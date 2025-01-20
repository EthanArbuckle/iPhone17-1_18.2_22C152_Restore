@interface IXPromisedInMemoryDictionary
+ (BOOL)supportsSecureCoding;
- (Class)seedClass;
- (IXPromisedInMemoryDictionary)initWithCoder:(id)a3;
- (IXPromisedInMemoryDictionary)initWithName:(id)a3 client:(unint64_t)a4 dictionary:(id)a5;
- (IXPromisedInMemoryDictionary)initWithSeed:(id)a3;
- (void)encodeWithCoder:(id)a3;
- (void)resetWithCompletion:(id)a3;
@end

@implementation IXPromisedInMemoryDictionary

- (IXPromisedInMemoryDictionary)initWithCoder:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)IXPromisedInMemoryDictionary;
  return [(IXOwnedDataPromise *)&v4 initWithCoder:a3];
}

- (void)encodeWithCoder:(id)a3
{
  v3.receiver = self;
  v3.super_class = (Class)IXPromisedInMemoryDictionary;
  [(IXDataPromise *)&v3 encodeWithCoder:a3];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (IXPromisedInMemoryDictionary)initWithName:(id)a3 client:(unint64_t)a4 dictionary:(id)a5
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a5;
  id v23 = 0;
  v10 = [MEMORY[0x1E4F28F98] dataWithPropertyList:v9 format:200 options:0 error:&v23];
  id v11 = v23;
  if (v10)
  {
    v22.receiver = self;
    v22.super_class = (Class)IXPromisedInMemoryDictionary;
    self = -[IXOwnedDataPromise initWithName:client:diskSpaceNeeded:](&v22, sel_initWithName_client_diskSpaceNeeded_, v8, a4, [v10 length]);
    if (!self) {
      goto LABEL_9;
    }
    *(void *)buf = 0;
    *(void *)&buf[8] = buf;
    *(void *)&buf[16] = 0x2020000000;
    char v25 = 0;
    v12 = +[IXServerConnection sharedConnection];
    v21[0] = MEMORY[0x1E4F143A8];
    v21[1] = 3221225472;
    v21[2] = __63__IXPromisedInMemoryDictionary_initWithName_client_dictionary___block_invoke;
    v21[3] = &unk_1E5D172A8;
    v21[4] = buf;
    v13 = [v12 synchronousRemoteObjectProxyWithErrorHandler:v21];

    if (!v13)
    {
      _Block_object_dispose(buf, 8);
      goto LABEL_11;
    }
    v14 = [(IXDataPromise *)self seed];
    v18[0] = MEMORY[0x1E4F143A8];
    v18[1] = 3221225472;
    v18[2] = __63__IXPromisedInMemoryDictionary_initWithName_client_dictionary___block_invoke_6;
    v18[3] = &unk_1E5D18568;
    v20 = buf;
    v15 = self;
    v19 = v15;
    [(IXPromisedInMemoryDictionary *)v13 _remote_createInMemoryDictionaryPromiseWithSeed:v14 dictionary:v9 completion:v18];

    LODWORD(v14) = *(unsigned __int8 *)(*(void *)&buf[8] + 24);
    _Block_object_dispose(buf, 8);
    if (v14)
    {
      v13 = 0;
      self = v15;
    }
    else
    {
LABEL_9:
      self = self;
      v13 = self;
    }
  }
  else
  {
    v16 = IXGetLoggingHandle((uint64_t)kIXLoggingSubsystem);
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315394;
      *(void *)&buf[4] = "-[IXPromisedInMemoryDictionary initWithName:client:dictionary:]";
      *(_WORD *)&buf[12] = 2112;
      *(void *)&buf[14] = v11;
      _os_log_impl(&dword_1A7B2D000, v16, OS_LOG_TYPE_DEFAULT, "%s: Failed to serialize dictionary: %@", buf, 0x16u);
    }

    v13 = 0;
  }
LABEL_11:

  return v13;
}

void __63__IXPromisedInMemoryDictionary_initWithName_client_dictionary___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  objc_super v4 = IXGetLoggingHandle((uint64_t)kIXLoggingSubsystem);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    int v5 = 136315394;
    v6 = "-[IXPromisedInMemoryDictionary initWithName:client:dictionary:]_block_invoke";
    __int16 v7 = 2112;
    id v8 = v3;
    _os_log_impl(&dword_1A7B2D000, v4, OS_LOG_TYPE_DEFAULT, "%s: Failed to contact daemon: %@", (uint8_t *)&v5, 0x16u);
  }

  *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = 1;
}

void __63__IXPromisedInMemoryDictionary_initWithName_client_dictionary___block_invoke_6(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if (v5)
  {
    v6 = IXGetLoggingHandle((uint64_t)kIXLoggingSubsystem);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      int v7 = 136315394;
      id v8 = "-[IXPromisedInMemoryDictionary initWithName:client:dictionary:]_block_invoke";
      __int16 v9 = 2112;
      id v10 = v5;
      _os_log_impl(&dword_1A7B2D000, v6, OS_LOG_TYPE_DEFAULT, "%s: Failed tell daemon to set up in memory dictionary promise: %@", (uint8_t *)&v7, 0x16u);
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
    -[IXPromisedInMemoryDictionary resetWithCompletion:](v5);
  }

  int v7 = _CreateError((uint64_t)"-[IXPromisedInMemoryDictionary resetWithCompletion:]", 90, @"IXErrorDomain", 4uLL, 0, 0, @"Resetting an in-memory dictionary promise doesn't make sense.", v6, v8);
  v4[2](v4, v7);
}

- (IXPromisedInMemoryDictionary)initWithSeed:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)IXPromisedInMemoryDictionary;
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
  v2 = "-[IXPromisedInMemoryDictionary resetWithCompletion:]";
  __int16 v3 = 2112;
  uint64_t v4 = 0;
  _os_log_error_impl(&dword_1A7B2D000, log, OS_LOG_TYPE_ERROR, "%s: Resetting an in-memory dictionary promise doesn't make sense. : %@", (uint8_t *)&v1, 0x16u);
}

@end