@interface VCPCoreMLRequest
- (MLModel)model;
- (VCPCoreMLRequest)initWithModelName:(id)a3;
@end

@implementation VCPCoreMLRequest

- (VCPCoreMLRequest)initWithModelName:(id)a3
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v17.receiver = self;
  v17.super_class = (Class)VCPCoreMLRequest;
  v5 = [(VCPCoreMLRequest *)&v17 init];
  if (!v5) {
    goto LABEL_15;
  }
  v6 = objc_msgSend(MEMORY[0x1E4F28B50], "vcp_mediaAnalysisBundle");
  v7 = [v6 URLForResource:v4 withExtension:@"mlmodelc"];

  if (v7)
  {
    id v8 = objc_alloc_init(MEMORY[0x1E4F1E990]);
    v9 = v8;
    if (v8)
    {
      [v8 setExperimentalMLE5EngineUsage:1];
      id v16 = 0;
      uint64_t v10 = [MEMORY[0x1E4F1E968] modelWithContentsOfURL:v7 configuration:v9 error:&v16];
      v11 = v16;
      p_super = &v5->_model->super;
      v5->_model = (MLModel *)v10;
    }
    else
    {
      if ((int)MediaAnalysisLogLevel() < 3)
      {
        v11 = 0;
        goto LABEL_13;
      }
      p_super = VCPLogInstance();
      if (os_log_type_enabled(p_super, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1BBEDA000, p_super, OS_LOG_TYPE_ERROR, "VCPCoreMLRequest Failed to create MLModelConfiguration", buf, 2u);
      }
      v11 = 0;
    }

LABEL_13:
    goto LABEL_14;
  }
  if ((int)MediaAnalysisLogLevel() < 3) {
    goto LABEL_15;
  }
  v11 = VCPLogInstance();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138412546;
    id v19 = v4;
    __int16 v20 = 2112;
    uint64_t v21 = 0;
    _os_log_impl(&dword_1BBEDA000, v11, OS_LOG_TYPE_ERROR, "[%@] VCPCoreMLRequest Failed to open model file at url %@", buf, 0x16u);
  }
LABEL_14:

LABEL_15:
  if (v5->_model) {
    v13 = v5;
  }
  else {
    v13 = 0;
  }
  v14 = v13;

  return v14;
}

- (MLModel)model
{
  return self->_model;
}

- (void).cxx_destruct
{
}

@end