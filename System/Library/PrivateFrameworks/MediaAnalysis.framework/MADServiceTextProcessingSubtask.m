@interface MADServiceTextProcessingSubtask
+ (id)subtaskForRequest:(id)a3 asset:(id)a4;
- (BOOL)autoCancellable;
- (MADServiceTextAsset)asset;
- (MADServiceTextProcessingSubtask)initWithRequest:(id)a3 asset:(id)a4;
- (MADTextRequest)request;
- (NSString)signpostPayload;
- (float)resourceRequirement;
- (int)run;
- (void)setSignpostPayload:(id)a3;
@end

@implementation MADServiceTextProcessingSubtask

+ (id)subtaskForRequest:(id)a3 asset:(id)a4
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  if ([v5 isMemberOfClass:objc_opt_class()])
  {
    v7 = (void *)[objc_alloc((Class)objc_opt_class()) initWithRequest:v5 asset:v6];
  }
  else
  {
    if ((int)MediaAnalysisLogLevel() >= 3)
    {
      v8 = VCPLogInstance();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      {
        v9 = (objc_class *)objc_opt_class();
        v10 = NSStringFromClass(v9);
        int v12 = 138412290;
        v13 = v10;
        _os_log_impl(&dword_1BBEDA000, v8, OS_LOG_TYPE_ERROR, "No subtask implemented for %@", (uint8_t *)&v12, 0xCu);
      }
    }
    v7 = 0;
  }

  return v7;
}

- (MADServiceTextProcessingSubtask)initWithRequest:(id)a3 asset:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)MADServiceTextProcessingSubtask;
  v9 = [(MADServiceTextProcessingSubtask *)&v12 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_request, a3);
    objc_storeStrong((id *)&v10->_asset, a4);
  }

  return v10;
}

- (float)resourceRequirement
{
  return 1.0;
}

- (BOOL)autoCancellable
{
  return 0;
}

- (int)run
{
  return -4;
}

- (MADTextRequest)request
{
  return self->_request;
}

- (MADServiceTextAsset)asset
{
  return self->_asset;
}

- (NSString)signpostPayload
{
  return self->_signpostPayload;
}

- (void)setSignpostPayload:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_signpostPayload, 0);
  objc_storeStrong((id *)&self->_asset, 0);
  objc_storeStrong((id *)&self->_request, 0);
}

@end