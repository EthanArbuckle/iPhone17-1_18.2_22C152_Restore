@interface VCPFlowDecoder
- (id)initModule:(int)a3 config:(id)a4 cancel:(id)a5;
- (int)bindWithBuffers:(__CVBuffer *)a3 correlation:(__CVBuffer *)a4 flow:(__CVBuffer *)a5 outputFlow:(__CVBuffer *)a6;
- (int)estimateFlow:(__CVBuffer *)a3 correlation:(__CVBuffer *)a4 flow:(__CVBuffer *)a5 outputFlow:(__CVBuffer *)a6 callback:(id)a7;
@end

@implementation VCPFlowDecoder

- (id)initModule:(int)a3 config:(id)a4 cancel:(id)a5
{
  uint64_t v6 = *(void *)&a3;
  id v8 = a4;
  v9 = (uint64_t (**)(void))a5;
  v10 = objc_msgSend(NSString, "stringWithFormat:", @"flow_estimation_%d", v6);
  if (v9 && (v9[2](v9) & 1) != 0)
  {
    v11 = 0;
  }
  else
  {
    v17.receiver = self;
    v17.super_class = (Class)VCPFlowDecoder;
    v12 = [(VCPEspressoModel *)&v17 initModelWithName:v10 andConfig:v8];
    v11 = v12;
    if (v12)
    {
      inputBlobNames = v12->_inputBlobNames;
      v12->_inputBlobNames = (NSArray *)&unk_1F15EE148;

      outpuBlobName = v11->_outpuBlobName;
      v11->_outpuBlobName = (NSString *)@"t_38";

      self = v11;
    }
    else
    {
      self = 0;
    }
  }
  v15 = v11;

  return v15;
}

- (int)bindWithBuffers:(__CVBuffer *)a3 correlation:(__CVBuffer *)a4 flow:(__CVBuffer *)a5 outputFlow:(__CVBuffer *)a6
{
  id v7 = [(NSArray *)self->_inputBlobNames objectAtIndexedSubscript:0];
  [v7 UTF8String];
  int v8 = espresso_network_bind_direct_cvpixelbuffer();

  if (v8)
  {
    if ((int)MediaAnalysisLogLevel() >= 3)
    {
      v9 = VCPLogInstance();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      {
        __int16 v20 = 0;
        v10 = "Flow decoder: fail to bind inputFeature";
        v11 = (uint8_t *)&v20;
LABEL_17:
        _os_log_impl(&dword_1BBEDA000, v9, OS_LOG_TYPE_ERROR, v10, v11, 2u);
        goto LABEL_18;
      }
      goto LABEL_18;
    }
  }
  else
  {
    id v12 = [(NSArray *)self->_inputBlobNames objectAtIndexedSubscript:1];
    [v12 UTF8String];
    int v13 = espresso_network_bind_direct_cvpixelbuffer();

    if (v13)
    {
      if ((int)MediaAnalysisLogLevel() >= 3)
      {
        v9 = VCPLogInstance();
        if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
        {
          __int16 v19 = 0;
          v10 = "Flow decoder: fail to bind correlation";
          v11 = (uint8_t *)&v19;
          goto LABEL_17;
        }
LABEL_18:
      }
    }
    else
    {
      id v14 = [(NSArray *)self->_inputBlobNames objectAtIndexedSubscript:2];
      [v14 UTF8String];
      int v15 = espresso_network_bind_direct_cvpixelbuffer();

      if (v15)
      {
        if ((int)MediaAnalysisLogLevel() >= 3)
        {
          v9 = VCPLogInstance();
          if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
          {
            __int16 v18 = 0;
            v10 = "Flow decoder: fail to bind upscaled flow";
            v11 = (uint8_t *)&v18;
            goto LABEL_17;
          }
          goto LABEL_18;
        }
      }
      else
      {
        [(NSString *)self->_outpuBlobName UTF8String];
        int result = espresso_network_bind_direct_cvpixelbuffer();
        if (!result) {
          return result;
        }
        if ((int)MediaAnalysisLogLevel() >= 3)
        {
          v9 = VCPLogInstance();
          if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
          {
            __int16 v17 = 0;
            v10 = "Flow decoder: fail to bind output flow";
            v11 = (uint8_t *)&v17;
            goto LABEL_17;
          }
          goto LABEL_18;
        }
      }
    }
  }
  return -108;
}

- (int)estimateFlow:(__CVBuffer *)a3 correlation:(__CVBuffer *)a4 flow:(__CVBuffer *)a5 outputFlow:(__CVBuffer *)a6 callback:(id)a7
{
  id v12 = (void (**)(void))a7;
  int v13 = [(VCPFlowDecoder *)self bindWithBuffers:a3 correlation:a4 flow:a5 outputFlow:a6];
  if (v13)
  {
    if ((int)MediaAnalysisLogLevel() >= 3)
    {
      id v14 = VCPLogInstance();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1BBEDA000, v14, OS_LOG_TYPE_ERROR, "Flow decoder: fail to bind buffers", buf, 2u);
      }
    }
    v12[2](v12);
  }
  else
  {
    __int16 v17 = v12;
    if (espresso_plan_submit())
    {
      if ((int)MediaAnalysisLogLevel() >= 3)
      {
        int v15 = VCPLogInstance();
        if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_1BBEDA000, v15, OS_LOG_TYPE_ERROR, "Flow decoder: fail to execute", buf, 2u);
        }
      }
      int v13 = -18;
    }
    else
    {
      int v13 = 0;
    }
  }
  return v13;
}

uint64_t __68__VCPFlowDecoder_estimateFlow_correlation_flow_outputFlow_callback___block_invoke(uint64_t a1)
{
  if ((int)MediaAnalysisLogLevel() >= 7)
  {
    v2 = VCPLogInstance();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)v4 = 0;
      _os_log_impl(&dword_1BBEDA000, v2, OS_LOG_TYPE_DEBUG, "Flow decoder: executing callback", v4, 2u);
    }
  }
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_outpuBlobName, 0);
  objc_storeStrong((id *)&self->_inputBlobNames, 0);
}

@end