@interface ADMonocularV2Pipeline
- (ADMonocularV2Pipeline)initWithInputPrioritization:(int64_t)a3;
- (ADMonocularV2Pipeline)initWithInputPrioritization:(int64_t)a3 andParameters:(id)a4;
- (ADMonocularV2PipelineParameters)pipelineParameters;
- (id)inferenceDescriptor;
- (int64_t)adjustForEngine:(unint64_t)a3;
- (int64_t)postProcessDisparity:(__CVBuffer *)a3 output:(__CVBuffer *)a4;
- (void)setPipelineParameters:(id)a3;
@end

@implementation ADMonocularV2Pipeline

- (id)inferenceDescriptor
{
  return self->_inferenceDesc;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pipelineParameters, 0);
  objc_storeStrong((id *)&self->_inferenceDesc, 0);
  objc_storeStrong((id *)&self->_networkProvider, 0);
}

- (ADMonocularV2Pipeline)initWithInputPrioritization:(int64_t)a3 andParameters:(id)a4
{
  uint64_t v33 = *MEMORY[0x263EF8340];
  id v6 = a4;
  int v22 = 335686160;
  int64_t v23 = a3;
  uint64_t v24 = 0;
  uint64_t v25 = 0;
  uint64_t v26 = 0;
  kdebug_trace();
  v21.receiver = self;
  v21.super_class = (Class)ADMonocularV2Pipeline;
  v7 = [(ADMonocularV2Pipeline *)&v21 init];
  if (v7)
  {
    if (!v6) {
      id v6 = (id)objc_opt_new();
    }
    objc_storeStrong((id *)&v7->_pipelineParameters, v6);
    if ([(ADMonocularV2PipelineParameters *)v7->_pipelineParameters networkVariantOverride] != 1)
    {
      if ([(ADMonocularV2PipelineParameters *)v7->_pipelineParameters networkVariantOverride] == 255
        || ![MEMORY[0x263F28048] hasANE])
      {
        goto LABEL_21;
      }
      ADCommonUtils::runtimePlatformANEVersionString(&buf);
      if (v32 < 0)
      {
        v14 = (void *)buf;
        int v12 = *((void *)&buf + 1) ? atoi((const char *)(buf + 1)) : -1;
        operator delete(v14);
      }
      else
      {
        if (!v32) {
          goto LABEL_5;
        }
        int v12 = atoi((const char *)&buf + 1);
      }
      if (v12 > 12)
      {
LABEL_21:
        v8 = @"CVM";
        if (a3 != 3) {
          goto LABEL_6;
        }
        goto LABEL_22;
      }
    }
LABEL_5:
    v8 = @"CVM4";
    if (a3 != 3)
    {
LABEL_6:
      if (a3 != 2)
      {
        if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR))
        {
          v15 = +[ADUtils prioritizationAsString:a3];
          LODWORD(buf) = 138543362;
          *(void *)((char *)&buf + 4) = v15;
          _os_log_error_impl(&dword_215F16000, &_os_log_internal, OS_LOG_TYPE_ERROR, "MonocularV2 does not support prioritization %{public}@", (uint8_t *)&buf, 0xCu);
        }
        v13 = 0;
        goto LABEL_29;
      }
      v29 = &unk_26C6982E0;
      v30 = @"height_216_width_288";
      v9 = &v29;
      v10 = &v30;
      v11 = @"height_176_width_320";
LABEL_23:
      v9[1] = &unk_26C6982F8;
      v10[1] = v11;
      v13 = objc_msgSend(NSDictionary, "dictionaryWithObjects:forKeys:count:");
      uint64_t v16 = +[ADNetworkProvider providerForNetwork:v8 requestedLayouts:v13];
      networkProvider = v7->_networkProvider;
      v7->_networkProvider = (ADNetworkProvider *)v16;

      if (v7->_networkProvider)
      {
        if ([MEMORY[0x263F28048] hasANE]) {
          uint64_t v18 = 4;
        }
        else {
          uint64_t v18 = 2;
        }
        [(ADMonocularV2Pipeline *)v7 adjustForEngine:v18];

        goto LABEL_28;
      }
LABEL_29:

      v19 = 0;
      goto LABEL_30;
    }
LABEL_22:
    v27 = &unk_26C6982E0;
    v28 = @"height_360_width_480";
    v9 = &v27;
    v10 = &v28;
    v11 = @"height_280_width_496";
    goto LABEL_23;
  }
LABEL_28:
  v19 = v7;
LABEL_30:
  kdebug_trace();

  return v19;
}

- (int64_t)adjustForEngine:(unint64_t)a3
{
  unint64_t v4 = a3 - 3;
  v5 = [ADEspressoMonocularV2InferenceDescriptor alloc];
  if (v4 >= 2) {
    uint64_t v6 = 1717856627;
  }
  else {
    uint64_t v6 = 1751411059;
  }
  v7 = [(ADEspressoMonocularV2InferenceDescriptor *)v5 initWithNetworkProvider:self->_networkProvider inputColorFormat:1111970369 disparityFormat:v6];
  inferenceDesc = self->_inferenceDesc;
  self->_inferenceDesc = v7;

  return 0;
}

- (void)setPipelineParameters:(id)a3
{
}

- (ADMonocularV2PipelineParameters)pipelineParameters
{
  return self->_pipelineParameters;
}

- (int64_t)postProcessDisparity:(__CVBuffer *)a3 output:(__CVBuffer *)a4
{
  kdebug_trace();
  int64_t v6 = +[ADUtils postProcessDepth:a3 depthOutput:a4];
  kdebug_trace();
  return v6;
}

- (ADMonocularV2Pipeline)initWithInputPrioritization:(int64_t)a3
{
  return [(ADMonocularV2Pipeline *)self initWithInputPrioritization:a3 andParameters:0];
}

@end