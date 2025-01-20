@interface DESDodMLMMappedTaskResult
- (DESDodMLMMappedTaskResult)initWithJSONResult:(id)a3 binaryResult:(id)a4 deferred:(BOOL)a5 deferralURL:(id)a6 duration:(double)a7;
- (DESDodMLMMappedTaskResult)initWithJSONResult:(id)a3 sandboxManager:(id)a4 mmappedFile:(id)a5 duration:(double)a6;
- (id)description;
- (void)dealloc;
@end

@implementation DESDodMLMMappedTaskResult

- (DESDodMLMMappedTaskResult)initWithJSONResult:(id)a3 binaryResult:(id)a4 deferred:(BOOL)a5 deferralURL:(id)a6 duration:(double)a7
{
  return -[DESDodMLMMappedTaskResult initWithJSONResult:sandboxManager:mmappedFile:duration:](self, "initWithJSONResult:sandboxManager:mmappedFile:duration:", a3, 0, 0, a6, a7);
}

- (DESDodMLMMappedTaskResult)initWithJSONResult:(id)a3 sandboxManager:(id)a4 mmappedFile:(id)a5 duration:(double)a6
{
  id v11 = a4;
  id v12 = a5;
  id v13 = a3;
  v14 = [v12 data];
  v17.receiver = self;
  v17.super_class = (Class)DESDodMLMMappedTaskResult;
  v15 = [(DESInternalDodMLTaskResult *)&v17 initWithJSONResult:v13 binaryResult:v14 deferred:0 deferralURL:0 duration:a6];

  if (v15)
  {
    objc_storeStrong((id *)&v15->_sandboxManager, a4);
    objc_storeStrong((id *)&v15->_mmappedFile, a5);
  }

  return v15;
}

- (void)dealloc
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  int v3 = 138412546;
  uint64_t v4 = a1;
  __int16 v5 = 2112;
  uint64_t v6 = a2;
  _os_log_error_impl(&dword_1BECCB000, log, OS_LOG_TYPE_ERROR, "Fail to remove %@ with error=%@", (uint8_t *)&v3, 0x16u);
}

- (id)description
{
  int v3 = NSString;
  uint64_t v4 = (objc_class *)objc_opt_class();
  __int16 v5 = NSStringFromClass(v4);
  uint64_t v6 = [(DESInternalDodMLTaskResult *)self binaryResult];
  uint64_t v7 = [v6 length];
  v8 = [(DESMMappedFile *)self->_mmappedFile fileURL];
  v9 = [(DESInternalDodMLTaskResult *)self JSONResult];
  v10 = [v3 stringWithFormat:@"%@(binaryResult.length=%lu, binaryResultURL=%@, JSONResult=%@)", v5, v7, v8, v9];

  return v10;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_mmappedFile, 0);

  objc_storeStrong((id *)&self->_sandboxManager, 0);
}

@end