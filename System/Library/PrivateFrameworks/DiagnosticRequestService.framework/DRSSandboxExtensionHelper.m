@interface DRSSandboxExtensionHelper
- (BOOL)didInit;
- (DRSSandboxExtensionHelper)initWithSandboxExtensionToken:(id)a3 logPath:(id)a4 errorOut:(id *)a5;
- (NSString)logPath;
- (int64_t)sandboxExtensionHandle;
- (void)dealloc;
- (void)setSandboxExtensionHandle:(int64_t)a3;
@end

@implementation DRSSandboxExtensionHelper

- (DRSSandboxExtensionHelper)initWithSandboxExtensionToken:(id)a3 logPath:(id)a4 errorOut:(id *)a5
{
  v27[1] = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  if (!v8)
  {
    v11 = (void *)MEMORY[0x263F087E8];
    uint64_t v26 = *MEMORY[0x263F08320];
    v27[0] = @"nil sandbox extension token";
    v12 = [NSDictionary dictionaryWithObjects:v27 forKeys:&v26 count:1];
    v13 = [v11 errorWithDomain:@"DRSSandboxExtensionHelper" code:0 userInfo:v12];

    if (a5) {
      *a5 = v13;
    }
    goto LABEL_13;
  }
  v23.receiver = self;
  v23.super_class = (Class)DRSSandboxExtensionHelper;
  self = [(DRSSandboxExtensionHelper *)&v23 init];
  if (self)
  {
    [v8 UTF8String];
    self->_sandboxExtensionHandle = sandbox_extension_consume();
    objc_storeStrong((id *)&self->_logPath, a4);
    if ([(DRSSandboxExtensionHelper *)self sandboxExtensionHandle] != -1)
    {
      self->_didInit = 1;
      goto LABEL_5;
    }
    id v14 = [NSString alloc];
    v15 = [(DRSSandboxExtensionHelper *)self logPath];
    v16 = __error();
    v17 = strerror(*v16);
    v18 = "Unknown";
    if (v17) {
      v18 = v17;
    }
    v13 = (void *)[v14 initWithFormat:@"Failed to consume extension token for '%@' due to error: %s", v15, v18];

    v19 = (void *)MEMORY[0x263F087E8];
    uint64_t v24 = *MEMORY[0x263F08320];
    v25 = v13;
    v20 = [NSDictionary dictionaryWithObjects:&v25 forKeys:&v24 count:1];
    v21 = [v19 errorWithDomain:@"DRSSandboxExtensionHelper" code:0 userInfo:v20];

    if (a5) {
      *a5 = v21;
    }

LABEL_13:
    v10 = 0;
    goto LABEL_14;
  }
LABEL_5:
  self = self;
  v10 = self;
LABEL_14:

  return v10;
}

- (void)dealloc
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  if ([(DRSSandboxExtensionHelper *)self didInit])
  {
    [(DRSSandboxExtensionHelper *)self sandboxExtensionHandle];
    if (sandbox_extension_release() == -1)
    {
      v3 = DPLogHandle_SubmitLogError();
      if (os_signpost_enabled(v3))
      {
        v4 = [(DRSSandboxExtensionHelper *)self logPath];
        v5 = __error();
        v6 = strerror(*v5);
        v7 = "Unknown";
        if (v6) {
          v7 = v6;
        }
        *(_DWORD *)buf = 138543618;
        v10 = v4;
        __int16 v11 = 2082;
        v12 = v7;
        _os_signpost_emit_with_name_impl(&dword_209E70000, v3, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "SandboxExtensionReleaseFailure", "Failed to release sandbox extension for file '%{public}@' due to error: %{public}s", buf, 0x16u);
      }
    }
  }
  v8.receiver = self;
  v8.super_class = (Class)DRSSandboxExtensionHelper;
  [(DRSSandboxExtensionHelper *)&v8 dealloc];
}

- (int64_t)sandboxExtensionHandle
{
  return self->_sandboxExtensionHandle;
}

- (void)setSandboxExtensionHandle:(int64_t)a3
{
  self->_sandboxExtensionHandle = a3;
}

- (BOOL)didInit
{
  return self->_didInit;
}

- (NSString)logPath
{
  return self->_logPath;
}

- (void).cxx_destruct
{
}

@end