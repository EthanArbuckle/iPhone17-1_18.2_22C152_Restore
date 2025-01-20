@interface IXPromisedInMemoryData
+ (BOOL)supportsSecureCoding;
- (Class)seedClass;
- (IXPromisedInMemoryData)initWithCoder:(id)a3;
- (IXPromisedInMemoryData)initWithName:(id)a3 client:(unint64_t)a4 data:(id)a5;
- (IXPromisedInMemoryData)initWithSeed:(id)a3;
- (void)encodeWithCoder:(id)a3;
- (void)resetWithCompletion:(id)a3;
@end

@implementation IXPromisedInMemoryData

- (IXPromisedInMemoryData)initWithCoder:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)IXPromisedInMemoryData;
  return [(IXOwnedDataPromise *)&v4 initWithCoder:a3];
}

- (void)encodeWithCoder:(id)a3
{
  v3.receiver = self;
  v3.super_class = (Class)IXPromisedInMemoryData;
  [(IXDataPromise *)&v3 encodeWithCoder:a3];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (IXPromisedInMemoryData)initWithName:(id)a3 client:(unint64_t)a4 data:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  v23.receiver = self;
  v23.super_class = (Class)IXPromisedInMemoryData;
  v10 = -[IXOwnedDataPromise initWithName:client:diskSpaceNeeded:](&v23, sel_initWithName_client_diskSpaceNeeded_, v8, a4, [v9 length]);
  if (!v10) {
    goto LABEL_5;
  }
  uint64_t v19 = 0;
  v20 = &v19;
  uint64_t v21 = 0x2020000000;
  char v22 = 0;
  v11 = +[IXServerConnection sharedConnection];
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __51__IXPromisedInMemoryData_initWithName_client_data___block_invoke;
  v18[3] = &unk_1E5D172A8;
  v18[4] = &v19;
  v12 = [v11 synchronousRemoteObjectProxyWithErrorHandler:v18];

  if (!v12)
  {
    _Block_object_dispose(&v19, 8);
    goto LABEL_7;
  }
  v13 = [(IXDataPromise *)v10 seed];
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __51__IXPromisedInMemoryData_initWithName_client_data___block_invoke_5;
  v15[3] = &unk_1E5D18090;
  v17 = &v19;
  v16 = v10;
  [(IXPromisedInMemoryData *)v12 _remote_createInMemoryDataPromiseWithSeed:v13 data:v9 completion:v15];

  LODWORD(v13) = *((unsigned __int8 *)v20 + 24);
  _Block_object_dispose(&v19, 8);
  if (v13) {
    v12 = 0;
  }
  else {
LABEL_5:
  }
    v12 = v10;
LABEL_7:

  return v12;
}

void __51__IXPromisedInMemoryData_initWithName_client_data___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  objc_super v4 = IXGetLoggingHandle((uint64_t)kIXLoggingSubsystem);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    int v5 = 136315394;
    v6 = "-[IXPromisedInMemoryData initWithName:client:data:]_block_invoke";
    __int16 v7 = 2112;
    id v8 = v3;
    _os_log_impl(&dword_1A7B2D000, v4, OS_LOG_TYPE_DEFAULT, "%s: Failed to contact daemon: %@", (uint8_t *)&v5, 0x16u);
  }

  *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = 1;
}

void __51__IXPromisedInMemoryData_initWithName_client_data___block_invoke_5(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if (v5)
  {
    v6 = IXGetLoggingHandle((uint64_t)kIXLoggingSubsystem);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      int v7 = 136315394;
      id v8 = "-[IXPromisedInMemoryData initWithName:client:data:]_block_invoke";
      __int16 v9 = 2112;
      id v10 = v5;
      _os_log_impl(&dword_1A7B2D000, v6, OS_LOG_TYPE_DEFAULT, "%s: Failed tell daemon to set up in memory data promise: %@", (uint8_t *)&v7, 0x16u);
    }

    *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 1;
  }
  else
  {
    [*(id *)(a1 + 32) _updateInitWithSeed:a2 notifyDaemon:0];
  }
}

- (void)resetWithCompletion:(id)a3
{
  id v3 = kIXLoggingSubsystem;
  objc_super v4 = (void (**)(id, void *))a3;
  id v5 = IXGetLoggingHandle((uint64_t)v3);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
    -[IXPromisedInMemoryData resetWithCompletion:](v5);
  }

  int v7 = _CreateError((uint64_t)"-[IXPromisedInMemoryData resetWithCompletion:]", 81, @"IXErrorDomain", 4uLL, 0, 0, @"Resetting an in-memory data promise doesn't make sense.", v6, v8);
  v4[2](v4, v7);
}

- (IXPromisedInMemoryData)initWithSeed:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)IXPromisedInMemoryData;
  return [(IXOwnedDataPromise *)&v4 initWithSeed:a3];
}

- (Class)seedClass
{
  return (Class)objc_opt_class();
}

- (void)resetWithCompletion:(os_log_t)log .cold.1(os_log_t log)
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  int v1 = 136315394;
  v2 = "-[IXPromisedInMemoryData resetWithCompletion:]";
  __int16 v3 = 2112;
  uint64_t v4 = 0;
  _os_log_error_impl(&dword_1A7B2D000, log, OS_LOG_TYPE_ERROR, "%s: Resetting an in-memory data promise doesn't make sense. : %@", (uint8_t *)&v1, 0x16u);
}

@end