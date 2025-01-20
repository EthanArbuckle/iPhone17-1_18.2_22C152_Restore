@interface CNNMLEnhancerEspresso
- (CNNMLEnhancerEspresso)initWithModelFile:(id)a3;
- (int)inferenceWithPixelBuffer:(__CVBuffer *)a3 toDestinationPixelBuffer:(__CVBuffer *)a4;
- (void)dealloc;
@end

@implementation CNNMLEnhancerEspresso

- (CNNMLEnhancerEspresso)initWithModelFile:(id)a3
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v17.receiver = self;
  v17.super_class = (Class)CNNMLEnhancerEspresso;
  v5 = [(CNNMLEnhancerEspresso *)&v17 init];
  if (!v5) {
    goto LABEL_6;
  }
  id v16 = 0;
  char v6 = [v4 checkResourceIsReachableAndReturnError:&v16];
  id v7 = v16;
  if ((v6 & 1) == 0)
  {
    if ((int)MediaAnalysisLogLevel() >= 3)
    {
      v13 = VCPLogInstance();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        id v19 = v4;
        _os_log_impl(&dword_1BBEDA000, v13, OS_LOG_TYPE_ERROR, "Model URL %@ not reachable", buf, 0xCu);
      }
    }
    goto LABEL_11;
  }
  v5->_ctx = (void *)espresso_create_context();
  uint64_t plan = espresso_create_plan();
  v5->_uint64_t plan = (void *)plan;
  if (!plan
    || ([v4 path],
        id v9 = objc_claimAutoreleasedReturnValue(),
        [v9 UTF8String],
        BOOL v10 = espresso_plan_add_network() == 0,
        v9,
        !v10))
  {
LABEL_11:

    goto LABEL_12;
  }
  BOOL v11 = espresso_plan_build() == 0;

  if (!v11)
  {
LABEL_12:
    v12 = 0;
    goto LABEL_13;
  }
LABEL_6:
  v12 = v5;
LABEL_13:
  v14 = v12;

  return v14;
}

- (void)dealloc
{
  if (self->_plan) {
    espresso_plan_destroy();
  }
  if (self->_ctx) {
    espresso_context_destroy();
  }
  v3.receiver = self;
  v3.super_class = (Class)CNNMLEnhancerEspresso;
  [(CNNMLEnhancerEspresso *)&v3 dealloc];
}

- (int)inferenceWithPixelBuffer:(__CVBuffer *)a3 toDestinationPixelBuffer:(__CVBuffer *)a4
{
  int v6 = espresso_network_bind_direct_cvpixelbuffer();
  if (v6)
  {
    int v7 = v6;
    if ((int)MediaAnalysisLogLevel() >= 3)
    {
      v8 = VCPLogInstance();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      {
        __int16 v15 = 0;
        id v9 = "bind rgb_input error";
        BOOL v10 = (uint8_t *)&v15;
LABEL_13:
        _os_log_impl(&dword_1BBEDA000, v8, OS_LOG_TYPE_ERROR, v9, v10, 2u);
        goto LABEL_14;
      }
      goto LABEL_14;
    }
  }
  else
  {
    int v11 = espresso_network_bind_direct_cvpixelbuffer();
    if (v11)
    {
      int v7 = v11;
      if ((int)MediaAnalysisLogLevel() >= 3)
      {
        v8 = VCPLogInstance();
        if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
        {
          __int16 v14 = 0;
          id v9 = "bind rgb_output_final error";
          BOOL v10 = (uint8_t *)&v14;
          goto LABEL_13;
        }
LABEL_14:
      }
    }
    else
    {
      int v7 = espresso_plan_execute_sync();
      if (!v7)
      {
        CVBufferPropagateAttachments(a3, a4);
        return v7;
      }
      if ((int)MediaAnalysisLogLevel() >= 3)
      {
        v8 = VCPLogInstance();
        if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
        {
          __int16 v13 = 0;
          id v9 = "execute_sync error";
          BOOL v10 = (uint8_t *)&v13;
          goto LABEL_13;
        }
        goto LABEL_14;
      }
    }
  }
  return v7;
}

@end