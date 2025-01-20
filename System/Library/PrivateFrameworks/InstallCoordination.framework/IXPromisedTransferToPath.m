@interface IXPromisedTransferToPath
+ (BOOL)supportsSecureCoding;
- (BOOL)_doInit;
- (BOOL)shouldCopy;
- (BOOL)tryDeltaCopy;
- (Class)seedClass;
- (IXPromisedTransferToPath)initWithCoder:(id)a3;
- (IXPromisedTransferToPath)initWithName:(id)a3 client:(unint64_t)a4 diskSpaceNeeded:(unint64_t)a5;
- (IXPromisedTransferToPath)initWithName:(id)a3 client:(unint64_t)a4 transferPath:(id)a5 diskSpaceNeeded:(unint64_t)a6;
- (IXPromisedTransferToPath)initWithSeed:(id)a3;
- (NSURL)transferPath;
- (void)encodeWithCoder:(id)a3;
- (void)setComplete:(BOOL)a3;
- (void)setShouldCopy:(BOOL)a3;
- (void)setTransferPath:(id)a3;
- (void)setTryDeltaCopy:(BOOL)a3;
@end

@implementation IXPromisedTransferToPath

- (IXPromisedTransferToPath)initWithCoder:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)IXPromisedTransferToPath;
  return [(IXOwnedDataPromise *)&v4 initWithCoder:a3];
}

- (void)encodeWithCoder:(id)a3
{
  v3.receiver = self;
  v3.super_class = (Class)IXPromisedTransferToPath;
  [(IXDataPromise *)&v3 encodeWithCoder:a3];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (BOOL)_doInit
{
  uint64_t v10 = 0;
  v11 = &v10;
  uint64_t v12 = 0x2020000000;
  char v13 = 0;
  objc_super v3 = +[IXServerConnection sharedConnection];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __35__IXPromisedTransferToPath__doInit__block_invoke;
  v9[3] = &unk_1E5D172A8;
  v9[4] = &v10;
  objc_super v4 = [v3 synchronousRemoteObjectProxyWithErrorHandler:v9];

  if (v4)
  {
    v5 = [(IXDataPromise *)self seed];
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __35__IXPromisedTransferToPath__doInit__block_invoke_3;
    v8[3] = &unk_1E5D17CC8;
    v8[4] = self;
    v8[5] = &v10;
    objc_msgSend(v4, "_remote_createTransferToPathDataPromiseWithSeed:completion:", v5, v8);

    BOOL v6 = *((unsigned char *)v11 + 24) == 0;
  }
  else
  {
    BOOL v6 = 0;
  }

  _Block_object_dispose(&v10, 8);
  return v6;
}

void __35__IXPromisedTransferToPath__doInit__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  objc_super v4 = IXGetLoggingHandle((uint64_t)kIXLoggingSubsystem);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    int v5 = 136315394;
    BOOL v6 = "-[IXPromisedTransferToPath _doInit]_block_invoke";
    __int16 v7 = 2112;
    id v8 = v3;
    _os_log_impl(&dword_1A7B2D000, v4, OS_LOG_TYPE_DEFAULT, "%s: Failed to contact daemon: %@", (uint8_t *)&v5, 0x16u);
  }

  *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = 1;
}

void __35__IXPromisedTransferToPath__doInit__block_invoke_3(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if (v5)
  {
    BOOL v6 = IXGetLoggingHandle((uint64_t)kIXLoggingSubsystem);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      int v7 = 136315394;
      id v8 = "-[IXPromisedTransferToPath _doInit]_block_invoke";
      __int16 v9 = 2112;
      id v10 = v5;
      _os_log_impl(&dword_1A7B2D000, v6, OS_LOG_TYPE_DEFAULT, "%s: Failed tell daemon to set up transfer to path promise: %@", (uint8_t *)&v7, 0x16u);
    }

    *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 1;
  }
  else
  {
    [*(id *)(a1 + 32) _updateInitWithSeed:a2 notifyDaemon:0];
  }
}

- (IXPromisedTransferToPath)initWithName:(id)a3 client:(unint64_t)a4 transferPath:(id)a5 diskSpaceNeeded:(unint64_t)a6
{
  id v10 = a5;
  v16.receiver = self;
  v16.super_class = (Class)IXPromisedTransferToPath;
  uint64_t v11 = [(IXOwnedDataPromise *)&v16 initWithName:a3 client:a4 diskSpaceNeeded:a6];
  uint64_t v12 = v11;
  if (v11
    && ([(IXDataPromise *)v11 seed],
        char v13 = objc_claimAutoreleasedReturnValue(),
        [v13 setTransferPath:v10],
        v13,
        ![(IXPromisedTransferToPath *)v12 _doInit]))
  {
    v14 = 0;
  }
  else
  {
    v14 = v12;
  }

  return v14;
}

- (IXPromisedTransferToPath)initWithName:(id)a3 client:(unint64_t)a4 diskSpaceNeeded:(unint64_t)a5
{
  v9.receiver = self;
  v9.super_class = (Class)IXPromisedTransferToPath;
  id v5 = [(IXOwnedDataPromise *)&v9 initWithName:a3 client:a4 diskSpaceNeeded:a5];
  BOOL v6 = v5;
  if (v5 && ![(IXPromisedTransferToPath *)v5 _doInit]) {
    int v7 = 0;
  }
  else {
    int v7 = v6;
  }

  return v7;
}

- (NSURL)transferPath
{
  v2 = [(IXDataPromise *)self seed];
  id v3 = [v2 transferPath];

  return (NSURL *)v3;
}

- (void)setTransferPath:(id)a3
{
  id v4 = a3;
  id v5 = +[IXServerConnection sharedConnection];
  BOOL v6 = [v5 synchronousRemoteObjectProxyWithErrorHandler:&__block_literal_global_1];
  int v7 = [(IXDataPromise *)self uniqueIdentifier];
  objc_msgSend(v6, "_remote_IXSPromisedTransferToPath:setTransferPath:", v7, v4);

  id v8 = [(IXDataPromise *)self seed];
  [v8 setTransferPath:v4];
}

void __44__IXPromisedTransferToPath_setTransferPath___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  id v2 = a2;
  id v3 = IXGetLoggingHandle((uint64_t)kIXLoggingSubsystem);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    int v4 = 136315394;
    id v5 = "-[IXPromisedTransferToPath setTransferPath:]_block_invoke";
    __int16 v6 = 2112;
    id v7 = v2;
    _os_log_impl(&dword_1A7B2D000, v3, OS_LOG_TYPE_DEFAULT, "%s: Remote object proxy signaled error while setting transfer path: %@", (uint8_t *)&v4, 0x16u);
  }
}

- (BOOL)shouldCopy
{
  id v2 = [(IXDataPromise *)self seed];
  char v3 = [v2 shouldCopy];

  return v3;
}

- (void)setShouldCopy:(BOOL)a3
{
  BOOL v3 = a3;
  id v5 = +[IXServerConnection sharedConnection];
  __int16 v6 = [v5 synchronousRemoteObjectProxyWithErrorHandler:&__block_literal_global_8];
  id v7 = [(IXDataPromise *)self uniqueIdentifier];
  objc_msgSend(v6, "_remote_IXSPromisedTransferToPath:setShouldCopy:", v7, v3);

  id v8 = [(IXDataPromise *)self seed];
  [v8 setShouldCopy:v3];
}

void __42__IXPromisedTransferToPath_setShouldCopy___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  id v2 = a2;
  BOOL v3 = IXGetLoggingHandle((uint64_t)kIXLoggingSubsystem);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    int v4 = 136315394;
    id v5 = "-[IXPromisedTransferToPath setShouldCopy:]_block_invoke";
    __int16 v6 = 2112;
    id v7 = v2;
    _os_log_impl(&dword_1A7B2D000, v3, OS_LOG_TYPE_DEFAULT, "%s: Remote object proxy signaled error while setting shouldCopy: %@", (uint8_t *)&v4, 0x16u);
  }
}

- (BOOL)tryDeltaCopy
{
  id v2 = [(IXDataPromise *)self seed];
  char v3 = [v2 tryDeltaCopy];

  return v3;
}

- (void)setTryDeltaCopy:(BOOL)a3
{
  BOOL v3 = a3;
  id v5 = +[IXServerConnection sharedConnection];
  __int16 v6 = [v5 synchronousRemoteObjectProxyWithErrorHandler:&__block_literal_global_10];
  id v7 = [(IXDataPromise *)self uniqueIdentifier];
  objc_msgSend(v6, "_remote_IXSPromisedTransferToPath:setTryDeltaCopy:", v7, v3);

  id v8 = [(IXDataPromise *)self seed];
  [v8 setTryDeltaCopy:v3];
}

void __44__IXPromisedTransferToPath_setTryDeltaCopy___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  id v2 = a2;
  BOOL v3 = IXGetLoggingHandle((uint64_t)kIXLoggingSubsystem);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    int v4 = 136315394;
    id v5 = "-[IXPromisedTransferToPath setTryDeltaCopy:]_block_invoke";
    __int16 v6 = 2112;
    id v7 = v2;
    _os_log_impl(&dword_1A7B2D000, v3, OS_LOG_TYPE_DEFAULT, "%s: Remote object proxy signaled error while setting tryDeltaCopy: %@", (uint8_t *)&v4, 0x16u);
  }
}

- (void)setComplete:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v59 = *MEMORY[0x1E4F143B8];
  if (a3)
  {
    id v5 = [MEMORY[0x1E4F1C9C8] date];
    __int16 v6 = +[IXFileManager defaultManager];
    id v7 = [(IXOwnedDataPromise *)self stagingBaseDir];
    uint64_t v8 = [(IXPromisedTransferToPath *)self transferPath];
    objc_super v9 = v8;
    if (!v8)
    {
      v19 = IXGetLoggingHandle((uint64_t)kIXLoggingSubsystem);
      if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR)) {
        -[IXPromisedTransferToPath setComplete:](v19);
      }

      uint64_t v11 = _CreateError((uint64_t)"-[IXPromisedTransferToPath setComplete:]", 259, @"IXErrorDomain", 4uLL, 0, 0, @"transferPath was not set, but must be set before complete=YES can be set", v20, v38);
      [(IXDataPromise *)self cancelForReason:v11 client:15 error:0];
      int v21 = 1;
LABEL_27:

      if (v21) {
        return;
      }
      goto LABEL_28;
    }
    v41 = v6;
    uint64_t v10 = [v8 lastPathComponent];
    uint64_t v11 = [v7 URLByAppendingPathComponent:v10 isDirectory:0];

    id v46 = 0;
    LOBYTE(v10) = [(IXOwnedDataPromise *)self consumeSandboxExtensionWithError:&v46];
    id v12 = v46;
    if ((v10 & 1) == 0)
    {
      [(IXDataPromise *)self cancelForReason:v12 client:15 error:0];
      int v21 = 1;
      id v14 = v12;
LABEL_26:

      __int16 v6 = v41;
      goto LABEL_27;
    }
    v40 = v5;
    if ([(IXPromisedTransferToPath *)self shouldCopy])
    {
      id v45 = v12;
      char v13 = [v41 copyItemAtURL:v9 toURL:v11 error:&v45];
      id v14 = v45;

      if ((v13 & 1) == 0)
      {
        v15 = IXGetLoggingHandle((uint64_t)kIXLoggingSubsystem);
        if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
        {
          objc_super v16 = [v9 path];
          v17 = [v11 path];
          *(_DWORD *)buf = 136315906;
          v48 = "-[IXPromisedTransferToPath setComplete:]";
          __int16 v49 = 2112;
          v50 = v16;
          __int16 v51 = 2112;
          v52 = v17;
          __int16 v53 = 2112;
          id v54 = v14;
          v18 = "%s: Failed to copy %@ to %@ : %@";
LABEL_23:
          _os_log_impl(&dword_1A7B2D000, v15, OS_LOG_TYPE_DEFAULT, v18, buf, 0x2Au);

          goto LABEL_24;
        }
        goto LABEL_24;
      }
    }
    else
    {
      id v44 = v12;
      char v22 = [v41 moveItemAtURL:v9 toURL:v11 error:&v44];
      id v14 = v44;

      if ((v22 & 1) == 0)
      {
        v15 = IXGetLoggingHandle((uint64_t)kIXLoggingSubsystem);
        if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
        {
          objc_super v16 = [v9 path];
          v17 = [v11 path];
          *(_DWORD *)buf = 136315906;
          v48 = "-[IXPromisedTransferToPath setComplete:]";
          __int16 v49 = 2112;
          v50 = v16;
          __int16 v51 = 2112;
          v52 = v17;
          __int16 v53 = 2112;
          id v54 = v14;
          v18 = "%s: Failed to move %@ to %@ : %@";
          goto LABEL_23;
        }
LABEL_24:

        [(IXDataPromise *)self cancelForReason:v14 client:15 error:0];
        int v21 = 1;
LABEL_25:
        id v5 = v40;
        goto LABEL_26;
      }
      uid_t v23 = getuid();
      v24 = +[IXGlobalConfiguration sharedInstance];
      int v25 = [v24 daemonUID];

      if (v23 != v25)
      {
        id v43 = v14;
        char v26 = [v41 copyACLFrom:v7 toAllChildrenOfPath:v11 error:&v43];
        id v27 = v43;

        if ((v26 & 1) == 0)
        {
          v35 = IXGetLoggingHandle((uint64_t)kIXLoggingSubsystem);
          if (os_log_type_enabled(v35, OS_LOG_TYPE_DEFAULT))
          {
            v36 = [v7 path];
            v37 = [v11 path];
            *(_DWORD *)buf = 136315906;
            v48 = "-[IXPromisedTransferToPath setComplete:]";
            __int16 v49 = 2112;
            v50 = v36;
            __int16 v51 = 2112;
            v52 = v37;
            __int16 v53 = 2112;
            id v54 = v27;
            _os_log_impl(&dword_1A7B2D000, v35, OS_LOG_TYPE_DEFAULT, "%s: Failed to inherit ACLs from %@ to %@ : %@", buf, 0x2Au);
          }
          [(IXDataPromise *)self cancelForReason:v27 client:15 error:0];
          int v21 = 1;
          id v14 = v27;
          goto LABEL_25;
        }
        id v14 = v27;
      }
    }
    [(IXOwnedDataPromise *)self setStagedPath:v11];
    v28 = [MEMORY[0x1E4F1C9C8] date];
    BOOL v29 = [(IXPromisedTransferToPath *)self shouldCopy];
    v30 = IXGetLoggingHandle((uint64_t)kIXLoggingSubsystem);
    if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
    {
      v31 = "Move";
      if (v29) {
        v31 = "Copy";
      }
      v39 = v31;
      v32 = [v9 path];
      v33 = [v11 path];
      [v28 timeIntervalSinceDate:v40];
      *(_DWORD *)buf = 136316418;
      v48 = "-[IXPromisedTransferToPath setComplete:]";
      __int16 v49 = 2112;
      v50 = self;
      __int16 v51 = 2080;
      v52 = v39;
      __int16 v53 = 2112;
      id v54 = v32;
      __int16 v55 = 2112;
      v56 = v33;
      __int16 v57 = 2048;
      uint64_t v58 = v34;
      _os_log_impl(&dword_1A7B2D000, v30, OS_LOG_TYPE_DEFAULT, "%s: %@ %s operation from %@ to %@ took %f seconds", buf, 0x3Eu);
    }
    [(IXOwnedDataPromise *)self releaseSandboxExtension];

    int v21 = 0;
    goto LABEL_25;
  }
LABEL_28:
  v42.receiver = self;
  v42.super_class = (Class)IXPromisedTransferToPath;
  [(IXDataPromise *)&v42 setComplete:v3];
}

- (IXPromisedTransferToPath)initWithSeed:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)IXPromisedTransferToPath;
  return [(IXOwnedDataPromise *)&v4 initWithSeed:a3];
}

- (Class)seedClass
{
  return (Class)objc_opt_class();
}

- (void)setComplete:(os_log_t)log .cold.1(os_log_t log)
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  int v1 = 136315394;
  id v2 = "-[IXPromisedTransferToPath setComplete:]";
  __int16 v3 = 2112;
  uint64_t v4 = 0;
  _os_log_error_impl(&dword_1A7B2D000, log, OS_LOG_TYPE_ERROR, "%s: transferPath was not set, but must be set before complete=YES can be set : %@", (uint8_t *)&v1, 0x16u);
}

@end