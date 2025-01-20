@interface IXPromisedOutOfBandTransfer
+ (BOOL)supportsSecureCoding;
- (Class)seedClass;
- (IXPromisedOutOfBandTransfer)initWithCoder:(id)a3;
- (IXPromisedOutOfBandTransfer)initWithName:(id)a3 client:(unint64_t)a4 diskSpaceNeeded:(unint64_t)a5;
- (IXPromisedOutOfBandTransfer)initWithSeed:(id)a3;
- (void)encodeWithCoder:(id)a3;
@end

@implementation IXPromisedOutOfBandTransfer

- (IXPromisedOutOfBandTransfer)initWithName:(id)a3 client:(unint64_t)a4 diskSpaceNeeded:(unint64_t)a5
{
  id v8 = a3;
  v22.receiver = self;
  v22.super_class = (Class)IXPromisedOutOfBandTransfer;
  v9 = [(IXDataPromise *)&v22 initWithName:v8 client:a4 diskSpaceNeeded:a5];
  if (!v9) {
    goto LABEL_5;
  }
  uint64_t v18 = 0;
  v19 = &v18;
  uint64_t v20 = 0x2020000000;
  char v21 = 0;
  v10 = +[IXServerConnection sharedConnection];
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __67__IXPromisedOutOfBandTransfer_initWithName_client_diskSpaceNeeded___block_invoke;
  v17[3] = &unk_1E5D172A8;
  v17[4] = &v18;
  v11 = [v10 synchronousRemoteObjectProxyWithErrorHandler:v17];

  if (!v11)
  {
    _Block_object_dispose(&v18, 8);
    goto LABEL_7;
  }
  v12 = [(IXDataPromise *)v9 seed];
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __67__IXPromisedOutOfBandTransfer_initWithName_client_diskSpaceNeeded___block_invoke_1;
  v14[3] = &unk_1E5D18258;
  v16 = &v18;
  v15 = v9;
  [(IXPromisedOutOfBandTransfer *)v11 _remote_createOutOfBandTransferPromiseWithSeed:v12 completion:v14];

  LODWORD(v12) = *((unsigned __int8 *)v19 + 24);
  _Block_object_dispose(&v18, 8);
  if (v12) {
    v11 = 0;
  }
  else {
LABEL_5:
  }
    v11 = v9;
LABEL_7:

  return v11;
}

void __67__IXPromisedOutOfBandTransfer_initWithName_client_diskSpaceNeeded___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  v4 = IXGetLoggingHandle((uint64_t)kIXLoggingSubsystem);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    int v5 = 136315394;
    v6 = "-[IXPromisedOutOfBandTransfer initWithName:client:diskSpaceNeeded:]_block_invoke";
    __int16 v7 = 2112;
    id v8 = v3;
    _os_log_impl(&dword_1A7B2D000, v4, OS_LOG_TYPE_DEFAULT, "%s: Failed to contact daemon: %@", (uint8_t *)&v5, 0x16u);
  }

  *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = 1;
}

void __67__IXPromisedOutOfBandTransfer_initWithName_client_diskSpaceNeeded___block_invoke_1(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if (v5)
  {
    v6 = IXGetLoggingHandle((uint64_t)kIXLoggingSubsystem);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      int v7 = 136315394;
      id v8 = "-[IXPromisedOutOfBandTransfer initWithName:client:diskSpaceNeeded:]_block_invoke";
      __int16 v9 = 2112;
      id v10 = v5;
      _os_log_impl(&dword_1A7B2D000, v6, OS_LOG_TYPE_DEFAULT, "%s: Failed tell daemon to set up out of band transfer promise: %@", (uint8_t *)&v7, 0x16u);
    }

    *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 1;
  }
  else
  {
    [*(id *)(a1 + 32) _updateInitWithSeed:a2 notifyDaemon:0];
  }
}

- (IXPromisedOutOfBandTransfer)initWithCoder:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)IXPromisedOutOfBandTransfer;
  return [(IXOpaqueDataPromise *)&v4 initWithCoder:a3];
}

- (void)encodeWithCoder:(id)a3
{
  v3.receiver = self;
  v3.super_class = (Class)IXPromisedOutOfBandTransfer;
  [(IXOpaqueDataPromise *)&v3 encodeWithCoder:a3];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (IXPromisedOutOfBandTransfer)initWithSeed:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)IXPromisedOutOfBandTransfer;
  return [(IXDataPromise *)&v4 initWithSeed:a3];
}

- (Class)seedClass
{
  return (Class)objc_opt_class();
}

@end