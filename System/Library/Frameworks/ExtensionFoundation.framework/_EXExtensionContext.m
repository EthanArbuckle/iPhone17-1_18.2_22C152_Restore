@interface _EXExtensionContext
- (BOOL)shouldAcceptXPCConnection:(id)a3;
- (_EXExtensionContext)init;
- (id)makeXPCConnectionWithError:(id *)a3;
- (void)completeRequestReturningItems:(id)a3 completionHandler:(id)a4;
- (void)completeRequestWithHandler:(id)a3;
- (void)invalidate;
@end

@implementation _EXExtensionContext

- (_EXExtensionContext)init
{
  v3.receiver = self;
  v3.super_class = (Class)_EXExtensionContext;
  return [(_EXExtensionContext *)&v3 init];
}

- (BOOL)shouldAcceptXPCConnection:(id)a3
{
  id v3 = a3;
  v4 = _EXDefaultLog();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_FAULT))
  {
    v5 = (objc_class *)objc_opt_class();
    v6 = NSStringFromClass(v5);
    int v8 = 136315906;
    v9 = "/Library/Caches/com.apple.xbs/Sources/ExtensionFoundation/ExtensionFoundation/Source/EXExtension/Extension/Inte"
         "rnal/Shim/EXExtensionContext.m";
    __int16 v10 = 1024;
    int v11 = 21;
    __int16 v12 = 2080;
    v13 = "-[_EXExtensionContext shouldAcceptXPCConnection:]";
    __int16 v14 = 2112;
    v15 = v6;
  }
  __break(1u);
  return result;
}

- (id)makeXPCConnectionWithError:(id *)a3
{
  v4 = [(_EXExtensionContext *)self internalImplementation];
  v5 = [v4 makeXPCConnectionWithError:a3];

  return v5;
}

- (void)invalidate
{
  id v2 = [(_EXExtensionContext *)self internalImplementation];
  [v2 invalidate];
}

- (void)completeRequestWithHandler:(id)a3
{
  v4 = (void (**)(id, uint64_t))a3;
  [(_EXExtensionContext *)self invalidate];
  v4[2](v4, 1);
}

- (void)completeRequestReturningItems:(id)a3 completionHandler:(id)a4
{
  v6 = (void (**)(id, void))a4;
  if ([a3 count])
  {
    v7 = _EXDefaultLog();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_FAULT)) {
      -[_EXExtensionContext completeRequestReturningItems:completionHandler:](v7);
    }

    [(_EXExtensionContext *)self invalidate];
    v6[2](v6, 0);
  }
  else
  {
    [(_EXExtensionContext *)self invalidate];
    v6[2](v6, 1);
  }
}

- (void)completeRequestReturningItems:(os_log_t)log completionHandler:.cold.1(os_log_t log)
{
  uint64_t v3 = *MEMORY[0x1E4F143B8];
  int v1 = 136446210;
  id v2 = "-[_EXExtensionContext completeRequestReturningItems:completionHandler:]";
  _os_log_fault_impl(&dword_191F29000, log, OS_LOG_TYPE_FAULT, "'%{public}s' called with items. This is not supported!", (uint8_t *)&v1, 0xCu);
}

@end