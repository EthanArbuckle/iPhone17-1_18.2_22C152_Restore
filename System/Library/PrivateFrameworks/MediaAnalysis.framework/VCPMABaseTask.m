@interface VCPMABaseTask
- (BOOL)autoCancellable;
- (BOOL)isCanceled;
- (BOOL)run:(id *)a3;
- (VCPMABaseTask)init;
- (VCPMABaseTask)initWithCompletionHandler:(id)a3;
- (float)resourceRequirement;
- (id)cancelBlock;
- (id)completionHandler;
- (int)run;
- (void)cancel;
- (void)dealloc;
- (void)setCancelBlock:(id)a3;
@end

@implementation VCPMABaseTask

- (VCPMABaseTask)init
{
  return 0;
}

- (VCPMABaseTask)initWithCompletionHandler:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)VCPMABaseTask;
  v5 = [(VCPMABaseTask *)&v9 init];
  if (v5)
  {
    v6 = _Block_copy(v4);
    id completionHandler = v5->_completionHandler;
    v5->_id completionHandler = v6;
  }
  return v5;
}

- (void)dealloc
{
  v14[1] = *MEMORY[0x1E4F143B8];
  unsigned __int8 v3 = atomic_load((unsigned __int8 *)&self->_started);
  if ((v3 & 1) == 0)
  {
    id completionHandler = (void (**)(id, void, void *))self->_completionHandler;
    v5 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v13 = *MEMORY[0x1E4F28568];
    v6 = NSString;
    v7 = (objc_class *)objc_opt_class();
    v8 = NSStringFromClass(v7);
    objc_super v9 = [v6 stringWithFormat:@"%@ canceled", v8];
    v14[0] = v9;
    v10 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v14 forKeys:&v13 count:1];
    v11 = [v5 errorWithDomain:*MEMORY[0x1E4F28760] code:-128 userInfo:v10];
    completionHandler[2](completionHandler, 0, v11);
  }
  v12.receiver = self;
  v12.super_class = (Class)VCPMABaseTask;
  [(VCPMABaseTask *)&v12 dealloc];
}

- (float)resourceRequirement
{
  return 1.0;
}

- (BOOL)autoCancellable
{
  return 0;
}

- (void)cancel
{
}

- (BOOL)isCanceled
{
  unsigned __int8 v2 = atomic_load((unsigned __int8 *)&self->_canceled);
  if (v2)
  {
    LOBYTE(cancelBlock) = 1;
  }
  else
  {
    cancelBlock = (uint64_t (**)(void))self->_cancelBlock;
    if (cancelBlock) {
      LOBYTE(cancelBlock) = cancelBlock[2]();
    }
  }
  return (char)cancelBlock;
}

- (BOOL)run:(id *)a3
{
  v14[1] = *MEMORY[0x1E4F143B8];
  id v4 = (void *)MEMORY[0x1E4F28C58];
  uint64_t v13 = *MEMORY[0x1E4F28568];
  v5 = NSString;
  v6 = (objc_class *)objc_opt_class();
  v7 = NSStringFromClass(v6);
  v8 = [v5 stringWithFormat:@"%@ is not yet implemented", v7, v13];
  v14[0] = v8;
  objc_super v9 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v14 forKeys:&v13 count:1];
  v10 = [v4 errorWithDomain:*MEMORY[0x1E4F28760] code:-4 userInfo:v9];
  id v11 = *a3;
  *a3 = v10;

  return 0;
}

- (int)run
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  unsigned __int8 v3 = (void *)MEMORY[0x1C186D320](self, a2);
  atomic_store(1u, (unsigned __int8 *)&self->_started);
  id v13 = 0;
  if (![(VCPMABaseTask *)self run:&v13])
  {
    if ([v13 code] == -128)
    {
      if ((int)MediaAnalysisLogLevel() >= 5)
      {
        v5 = VCPLogInstance();
        if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
        {
          v6 = (objc_class *)objc_opt_class();
          v7 = NSStringFromClass(v6);
          v8 = [v13 description];
          *(_DWORD *)buf = 138412546;
          v15 = v7;
          __int16 v16 = 2112;
          v17 = v8;
          _os_log_impl(&dword_1BBEDA000, v5, OS_LOG_TYPE_DEFAULT, "%@ canceled (%@)", buf, 0x16u);
        }
LABEL_10:
      }
    }
    else if ((int)MediaAnalysisLogLevel() >= 3)
    {
      v5 = VCPLogInstance();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      {
        objc_super v9 = (objc_class *)objc_opt_class();
        v10 = NSStringFromClass(v9);
        id v11 = [v13 description];
        *(_DWORD *)buf = 138412546;
        v15 = v10;
        __int16 v16 = 2112;
        v17 = v11;
        _os_log_impl(&dword_1BBEDA000, v5, OS_LOG_TYPE_ERROR, "%@ failed (%@)", buf, 0x16u);
      }
      goto LABEL_10;
    }
    (*((void (**)(void))self->_completionHandler + 2))();
    int v4 = [v13 code];
    goto LABEL_12;
  }
  int v4 = 0;
LABEL_12:

  return v4;
}

- (id)cancelBlock
{
  return self->_cancelBlock;
}

- (void)setCancelBlock:(id)a3
{
}

- (id)completionHandler
{
  return self->_completionHandler;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_completionHandler, 0);
  objc_storeStrong(&self->_cancelBlock, 0);
}

@end