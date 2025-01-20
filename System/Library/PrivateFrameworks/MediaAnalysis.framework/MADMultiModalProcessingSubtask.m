@interface MADMultiModalProcessingSubtask
+ (BOOL)prewarmRequest:(id)a3 error:(id *)a4;
+ (id)subtaskForRequest:(id)a3 inputs:(id)a4;
- (BOOL)autoCancellable;
- (MADMultiModalProcessingSubtask)initWithRequest:(id)a3 inputs:(id)a4;
- (MADMultiModalRequest)request;
- (NSArray)inputs;
- (NSString)signpostPayload;
- (float)resourceRequirement;
- (int)run;
- (void)setSignpostPayload:(id)a3;
@end

@implementation MADMultiModalProcessingSubtask

+ (BOOL)prewarmRequest:(id)a3 error:(id *)a4
{
  v14[1] = *MEMORY[0x1E4F143B8];
  if (a4)
  {
    v5 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v6 = *MEMORY[0x1E4F28760];
    uint64_t v13 = *MEMORY[0x1E4F28568];
    v7 = NSString;
    v8 = (objc_class *)objc_opt_class();
    v9 = NSStringFromClass(v8);
    v10 = [v7 stringWithFormat:@"Pre-warming not implemented for %@", v9, v13];
    v14[0] = v10;
    v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v14 forKeys:&v13 count:1];
    *a4 = [v5 errorWithDomain:v6 code:-4 userInfo:v11];
  }
  return 0;
}

+ (id)subtaskForRequest:(id)a3 inputs:(id)a4
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  if ([v5 isMemberOfClass:objc_opt_class()])
  {
    v7 = (void *)[objc_alloc((Class)objc_opt_class()) initWithRequest:v5 inputs:v6];
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
        uint64_t v13 = v10;
        _os_log_impl(&dword_1BBEDA000, v8, OS_LOG_TYPE_ERROR, "No subtask implemented for %@", (uint8_t *)&v12, 0xCu);
      }
    }
    v7 = 0;
  }

  return v7;
}

- (MADMultiModalProcessingSubtask)initWithRequest:(id)a3 inputs:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)MADMultiModalProcessingSubtask;
  v9 = [(MADMultiModalProcessingSubtask *)&v12 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_request, a3);
    objc_storeStrong((id *)&v10->_inputs, a4);
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

- (MADMultiModalRequest)request
{
  return self->_request;
}

- (NSArray)inputs
{
  return self->_inputs;
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
  objc_storeStrong((id *)&self->_inputs, 0);
  objc_storeStrong((id *)&self->_request, 0);
}

@end