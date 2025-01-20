@interface IXOwnedDataPromise
- (BOOL)consumeSandboxExtensionWithError:(id *)a3;
- (BOOL)setTargetLastPathComponent:(id)a3 error:(id *)a4;
- (Class)seedClass;
- (IXOwnedDataPromise)initWithCoder:(id)a3;
- (IXOwnedDataPromise)initWithName:(id)a3 client:(unint64_t)a4 diskSpaceNeeded:(unint64_t)a5;
- (IXOwnedDataPromise)initWithSeed:(id)a3;
- (NSString)targetLastPathComponent;
- (NSURL)stagedPath;
- (NSURL)stagingBaseDir;
- (id)targetLastPathComponentWithError:(id *)a3;
- (int64_t)sandboxExtensionHandle;
- (void)_clientDelegate_didCancelWithError:(id)a3 client:(unint64_t)a4;
- (void)_clientDelegate_didComplete;
- (void)_internalInit;
- (void)dealloc;
- (void)releaseSandboxExtension;
- (void)setStagedPath:(id)a3;
- (void)setTargetLastPathComponent:(id)a3;
@end

@implementation IXOwnedDataPromise

- (void)_internalInit
{
  self->_sandboxExtensionHandle = -1;
}

- (IXOwnedDataPromise)initWithSeed:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)IXOwnedDataPromise;
  v3 = [(IXDataPromise *)&v6 initWithSeed:a3];
  v4 = v3;
  if (v3) {
    [(IXOwnedDataPromise *)v3 _internalInit];
  }
  return v4;
}

- (IXOwnedDataPromise)initWithCoder:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)IXOwnedDataPromise;
  v3 = [(IXDataPromise *)&v6 initWithCoder:a3];
  v4 = v3;
  if (v3) {
    [(IXOwnedDataPromise *)v3 _internalInit];
  }
  return v4;
}

- (IXOwnedDataPromise)initWithName:(id)a3 client:(unint64_t)a4 diskSpaceNeeded:(unint64_t)a5
{
  v8.receiver = self;
  v8.super_class = (Class)IXOwnedDataPromise;
  v5 = [(IXDataPromise *)&v8 initWithName:a3 client:a4 diskSpaceNeeded:a5];
  objc_super v6 = v5;
  if (v5) {
    [(IXOwnedDataPromise *)v5 _internalInit];
  }
  return v6;
}

- (NSURL)stagedPath
{
  stagedPath = self->_stagedPath;
  if (!stagedPath)
  {
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __32__IXOwnedDataPromise_stagedPath__block_invoke;
    v6[3] = &unk_1E5D180E0;
    v6[4] = self;
    id v4 = +[IXServerConnection retrySynchronousIPC:v6];
    stagedPath = self->_stagedPath;
  }

  return stagedPath;
}

id __32__IXOwnedDataPromise_stagedPath__block_invoke(uint64_t a1)
{
  uint64_t v9 = 0;
  v10 = &v9;
  uint64_t v11 = 0x3032000000;
  v12 = __Block_byref_object_copy__7;
  v13 = __Block_byref_object_dispose__7;
  id v14 = 0;
  v2 = +[IXServerConnection sharedConnection];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __32__IXOwnedDataPromise_stagedPath__block_invoke_5;
  v8[3] = &unk_1E5D172A8;
  v8[4] = &v9;
  v3 = [v2 synchronousRemoteObjectProxyWithErrorHandler:v8];
  id v4 = [*(id *)(a1 + 32) uniqueIdentifier];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __32__IXOwnedDataPromise_stagedPath__block_invoke_6;
  v7[3] = &unk_1E5D180B8;
  v7[4] = *(void *)(a1 + 32);
  v7[5] = &v9;
  objc_msgSend(v3, "_remote_IXSOwnedDataPromise:getStagedPath:", v4, v7);

  id v5 = (id)v10[5];
  _Block_object_dispose(&v9, 8);

  return v5;
}

void __32__IXOwnedDataPromise_stagedPath__block_invoke_5(uint64_t a1, void *a2)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v4 = a2;
  if (v4)
  {
    id v5 = IXGetLoggingHandle((uint64_t)kIXLoggingSubsystem);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      int v6 = 136315394;
      v7 = "-[IXOwnedDataPromise stagedPath]_block_invoke";
      __int16 v8 = 2112;
      id v9 = v4;
      _os_log_impl(&dword_1A7B2D000, v5, OS_LOG_TYPE_DEFAULT, "%s: Failed to get staged path: %@", (uint8_t *)&v6, 0x16u);
    }

    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40), a2);
  }
}

void __32__IXOwnedDataPromise_stagedPath__block_invoke_6(uint64_t a1, void *a2, void *a3)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v6 = a2;
  id v7 = a3;
  if (v7)
  {
    __int16 v8 = IXGetLoggingHandle((uint64_t)kIXLoggingSubsystem);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      int v11 = 136315394;
      v12 = "-[IXOwnedDataPromise stagedPath]_block_invoke";
      __int16 v13 = 2112;
      id v14 = v7;
      _os_log_impl(&dword_1A7B2D000, v8, OS_LOG_TYPE_DEFAULT, "%s: Failed to get staged path: %@", (uint8_t *)&v11, 0x16u);
    }

    id v9 = (id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
    uint64_t v10 = a3;
  }
  else
  {
    id v9 = (id *)(*(void *)(a1 + 32) + 40);
    uint64_t v10 = a2;
  }
  objc_storeStrong(v9, v10);
}

- (void)setStagedPath:(id)a3
{
  objc_storeStrong((id *)&self->_stagedPath, a3);
  id v5 = a3;
  id v8 = +[IXServerConnection sharedConnection];
  id v6 = [v8 synchronousRemoteObjectProxyWithErrorHandler:&__block_literal_global_4];
  id v7 = [(IXDataPromise *)self uniqueIdentifier];
  objc_msgSend(v6, "_remote_IXSOwnedDataPromise:setStagedPath:", v7, v5);
}

void __36__IXOwnedDataPromise_setStagedPath___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  id v2 = a2;
  v3 = IXGetLoggingHandle((uint64_t)kIXLoggingSubsystem);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    int v4 = 136315394;
    id v5 = "-[IXOwnedDataPromise setStagedPath:]_block_invoke";
    __int16 v6 = 2112;
    id v7 = v2;
    _os_log_impl(&dword_1A7B2D000, v3, OS_LOG_TYPE_DEFAULT, "%s: Failed to set staged item path: %@", (uint8_t *)&v4, 0x16u);
  }
}

- (Class)seedClass
{
  return (Class)objc_opt_class();
}

- (NSURL)stagingBaseDir
{
  id v2 = [(IXDataPromise *)self seed];
  v3 = [v2 stagingBaseDir];

  return (NSURL *)v3;
}

- (BOOL)consumeSandboxExtensionWithError:(id *)a3
{
  uint64_t v47 = *MEMORY[0x1E4F143B8];
  id v5 = [(IXDataPromise *)self seed];
  __int16 v6 = [v5 sandboxExtensionToken];

  if (!v6)
  {
    uint64_t v10 = IXGetLoggingHandle((uint64_t)kIXLoggingSubsystem);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      -[IXOwnedDataPromise consumeSandboxExtensionWithError:](v10, v11, v12, v13, v14, v15, v16, v17);
    }

    _CreateError((uint64_t)"-[IXOwnedDataPromise consumeSandboxExtensionWithError:]", 128, @"IXErrorDomain", 4uLL, 0, 0, @"Attempting to consume a sandbox extension but don't have a sandbox extension token issued", v18, v38);
LABEL_11:
    id v19 = (id)objc_claimAutoreleasedReturnValue();
    if (a3) {
      goto LABEL_12;
    }
LABEL_18:
    BOOL v20 = 0;
    goto LABEL_19;
  }
  if (self->_sandboxExtensionHandle >= 1)
  {
    id v7 = IXGetLoggingHandle((uint64_t)kIXLoggingSubsystem);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_FAULT)) {
      -[IXOwnedDataPromise consumeSandboxExtensionWithError:]();
    }

    uint64_t v8 = IXGetLoggingHandle((uint64_t)kIXLoggingSubsystem);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      -[IXOwnedDataPromise consumeSandboxExtensionWithError:]();
    }

    _CreateError((uint64_t)"-[IXOwnedDataPromise consumeSandboxExtensionWithError:]", 134, @"IXErrorDomain", 4uLL, 0, 0, @"Attempting to consume a sandbox extension while already holding one for %@", v9, (uint64_t)v6);
    goto LABEL_11;
  }
  id v21 = v6;
  [v21 fileSystemRepresentation];
  int64_t v22 = sandbox_extension_consume();
  if ((v22 & 0x8000000000000000) == 0)
  {
    id v19 = 0;
    self->_sandboxExtensionHandle = v22;
    BOOL v20 = 1;
    goto LABEL_19;
  }
  unint64_t v23 = *__error();
  v24 = IXGetLoggingHandle((uint64_t)kIXLoggingSubsystem);
  if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
  {
    v40 = [(IXDataPromise *)self seed];
    v39 = [v40 stagingBaseDir];
    v34 = [v39 path];
    v25 = (void *)*MEMORY[0x1E4F28798];
    uint64_t v35 = [v21 fileSystemRepresentation];
    strerror(v23);
    v37 = _CreateError((uint64_t)"-[IXOwnedDataPromise consumeSandboxExtensionWithError:]", 143, v25, v23, 0, 0, @"sandbox_extension_consume for %s failed: %s.", v36, v35);
    *(_DWORD *)buf = 136315650;
    v42 = "-[IXOwnedDataPromise consumeSandboxExtensionWithError:]";
    __int16 v43 = 2112;
    v44 = v34;
    __int16 v45 = 2112;
    v46 = v37;
    _os_log_error_impl(&dword_1A7B2D000, v24, OS_LOG_TYPE_ERROR, "%s: Could not get access to installcoordinationd's staging directory at \"%@\". : %@", buf, 0x20u);
  }
  else
  {
    v25 = (void *)*MEMORY[0x1E4F28798];
  }

  uint64_t v26 = [v21 fileSystemRepresentation];
  strerror(v23);
  v28 = _CreateError((uint64_t)"-[IXOwnedDataPromise consumeSandboxExtensionWithError:]", 143, v25, v23, 0, 0, @"sandbox_extension_consume for %s failed: %s.", v27, v26);
  v29 = [(IXDataPromise *)self seed];
  v30 = [v29 stagingBaseDir];
  v31 = [v30 path];
  _CreateError((uint64_t)"-[IXOwnedDataPromise consumeSandboxExtensionWithError:]", 143, @"IXErrorDomain", 4uLL, v28, 0, @"Could not get access to installcoordinationd's staging directory at \"%@\".", v32, (uint64_t)v31);
  id v19 = (id)objc_claimAutoreleasedReturnValue();

  if (!a3) {
    goto LABEL_18;
  }
LABEL_12:
  id v19 = v19;
  BOOL v20 = 0;
  *a3 = v19;
LABEL_19:

  return v20;
}

- (BOOL)setTargetLastPathComponent:(id)a3 error:(id *)a4
{
  id v6 = a3;
  uint64_t v24 = 0;
  v25 = &v24;
  uint64_t v26 = 0x3032000000;
  uint64_t v27 = __Block_byref_object_copy__7;
  v28 = __Block_byref_object_dispose__7;
  id v29 = 0;
  id v7 = +[IXServerConnection sharedConnection];
  v21[0] = MEMORY[0x1E4F143A8];
  v21[1] = 3221225472;
  v21[2] = __55__IXOwnedDataPromise_setTargetLastPathComponent_error___block_invoke;
  v21[3] = &unk_1E5D17550;
  id v8 = v6;
  id v22 = v8;
  unint64_t v23 = &v24;
  uint64_t v9 = [v7 synchronousRemoteObjectProxyWithErrorHandler:v21];
  uint64_t v10 = [(IXDataPromise *)self uniqueIdentifier];
  uint64_t v15 = MEMORY[0x1E4F143A8];
  uint64_t v16 = 3221225472;
  uint64_t v17 = __55__IXOwnedDataPromise_setTargetLastPathComponent_error___block_invoke_20;
  uint64_t v18 = &unk_1E5D17550;
  id v11 = v8;
  id v19 = v11;
  BOOL v20 = &v24;
  objc_msgSend(v9, "_remote_IXSOwnedDataPromise:setTargetLastPathComponent:withCompletion:", v10, v11, &v15);

  uint64_t v12 = (void *)v25[5];
  if (!a4)
  {
    if (v12) {
      goto LABEL_6;
    }
LABEL_5:
    -[IXOwnedDataPromise setTargetLastPathComponent:](self, "setTargetLastPathComponent:", v11, v15, v16, v17, v18);
    goto LABEL_6;
  }
  if (!v12) {
    goto LABEL_5;
  }
  *a4 = v12;
LABEL_6:
  BOOL v13 = v25[5] == 0;

  _Block_object_dispose(&v24, 8);
  return v13;
}

void __55__IXOwnedDataPromise_setTargetLastPathComponent_error___block_invoke(uint64_t a1, void *a2)
{
  id v4 = a2;
  if (v4)
  {
    id v5 = IXGetLoggingHandle((uint64_t)kIXLoggingSubsystem);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      __55__IXOwnedDataPromise_setTargetLastPathComponent_error___block_invoke_cold_1();
    }

    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a2);
  }
}

void __55__IXOwnedDataPromise_setTargetLastPathComponent_error___block_invoke_20(uint64_t a1, void *a2)
{
  id v4 = a2;
  if (v4)
  {
    id v5 = IXGetLoggingHandle((uint64_t)kIXLoggingSubsystem);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      __55__IXOwnedDataPromise_setTargetLastPathComponent_error___block_invoke_cold_1();
    }

    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a2);
  }
}

- (id)targetLastPathComponentWithError:(id *)a3
{
  uint64_t v20 = 0;
  id v21 = &v20;
  uint64_t v22 = 0x3032000000;
  unint64_t v23 = __Block_byref_object_copy__7;
  uint64_t v24 = __Block_byref_object_dispose__7;
  id v25 = [(IXOwnedDataPromise *)self targetLastPathComponent];
  id v5 = (void *)v21[5];
  if (!v5)
  {
    uint64_t v14 = 0;
    uint64_t v15 = &v14;
    uint64_t v16 = 0x3032000000;
    uint64_t v17 = __Block_byref_object_copy__7;
    uint64_t v18 = __Block_byref_object_dispose__7;
    id v19 = 0;
    id v6 = +[IXServerConnection sharedConnection];
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __55__IXOwnedDataPromise_targetLastPathComponentWithError___block_invoke;
    v13[3] = &unk_1E5D172A8;
    v13[4] = &v14;
    id v7 = [v6 synchronousRemoteObjectProxyWithErrorHandler:v13];
    id v8 = [(IXDataPromise *)self uniqueIdentifier];
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __55__IXOwnedDataPromise_targetLastPathComponentWithError___block_invoke_21;
    v12[3] = &unk_1E5D18108;
    v12[4] = &v14;
    v12[5] = &v20;
    objc_msgSend(v7, "_remote_IXSOwnedDataPromise:getTargetLastPathComponent:", v8, v12);

    uint64_t v9 = v21[5];
    if (a3)
    {
      if (!v9)
      {
        *a3 = (id) v15[5];
LABEL_7:
        _Block_object_dispose(&v14, 8);

        id v5 = (void *)v21[5];
        goto LABEL_8;
      }
    }
    else if (!v9)
    {
      goto LABEL_7;
    }
    -[IXOwnedDataPromise setTargetLastPathComponent:](self, "setTargetLastPathComponent:");
    goto LABEL_7;
  }
LABEL_8:
  id v10 = v5;
  _Block_object_dispose(&v20, 8);

  return v10;
}

void __55__IXOwnedDataPromise_targetLastPathComponentWithError___block_invoke(uint64_t a1, void *a2)
{
  id v4 = a2;
  if (v4)
  {
    id v5 = IXGetLoggingHandle((uint64_t)kIXLoggingSubsystem);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      __55__IXOwnedDataPromise_targetLastPathComponentWithError___block_invoke_cold_1(a1, v5, v6, v7, v8, v9, v10, v11);
    }

    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40), a2);
  }
}

void __55__IXOwnedDataPromise_targetLastPathComponentWithError___block_invoke_21(uint64_t a1, void *a2, void *a3)
{
  id v6 = a2;
  id v7 = a3;
  if (v7)
  {
    uint64_t v8 = IXGetLoggingHandle((uint64_t)kIXLoggingSubsystem);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      __55__IXOwnedDataPromise_targetLastPathComponentWithError___block_invoke_21_cold_1();
    }

    uint64_t v9 = (id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40);
    uint64_t v10 = a3;
  }
  else
  {
    uint64_t v9 = (id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
    uint64_t v10 = a2;
  }
  objc_storeStrong(v9, v10);
}

- (void)releaseSandboxExtension
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  int v5 = 136315906;
  id v6 = "-[IXOwnedDataPromise releaseSandboxExtension]";
  __int16 v7 = 2048;
  uint64_t v8 = a2;
  __int16 v9 = 2080;
  uint64_t v10 = strerror(a1);
  __int16 v11 = 1024;
  int v12 = a1;
  _os_log_error_impl(&dword_1A7B2D000, a3, OS_LOG_TYPE_ERROR, "%s: Failed to release sandbox extension %lld: %s (%d)", (uint8_t *)&v5, 0x26u);
}

- (void)dealloc
{
  [(IXOwnedDataPromise *)self releaseSandboxExtension];
  v3.receiver = self;
  v3.super_class = (Class)IXOwnedDataPromise;
  [(IXDataPromise *)&v3 dealloc];
}

- (void)_clientDelegate_didComplete
{
  [(IXOwnedDataPromise *)self releaseSandboxExtension];
  v3.receiver = self;
  v3.super_class = (Class)IXOwnedDataPromise;
  [(IXDataPromise *)&v3 _clientDelegate_didComplete];
}

- (void)_clientDelegate_didCancelWithError:(id)a3 client:(unint64_t)a4
{
  id v6 = a3;
  [(IXOwnedDataPromise *)self releaseSandboxExtension];
  v7.receiver = self;
  v7.super_class = (Class)IXOwnedDataPromise;
  [(IXDataPromise *)&v7 _clientDelegate_didCancelWithError:v6 client:a4];
}

- (NSString)targetLastPathComponent
{
  return self->_targetLastPathComponent;
}

- (void)setTargetLastPathComponent:(id)a3
{
}

- (int64_t)sandboxExtensionHandle
{
  return self->_sandboxExtensionHandle;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_targetLastPathComponent, 0);

  objc_storeStrong((id *)&self->_stagedPath, 0);
}

- (void)consumeSandboxExtensionWithError:(uint64_t)a3 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)consumeSandboxExtensionWithError:.cold.2()
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  v2[0] = 136315650;
  OUTLINED_FUNCTION_0_0();
  __int16 v3 = v0;
  uint64_t v4 = 0;
  _os_log_error_impl(&dword_1A7B2D000, v1, OS_LOG_TYPE_ERROR, "%s: Attempting to consume a sandbox extension while already holding one for %@ : %@", (uint8_t *)v2, 0x20u);
}

- (void)consumeSandboxExtensionWithError:.cold.3()
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  v1[0] = 136315394;
  OUTLINED_FUNCTION_0_0();
  _os_log_fault_impl(&dword_1A7B2D000, v0, OS_LOG_TYPE_FAULT, "%s: Attempting to consume a sandbox extension while already holding one for %@", (uint8_t *)v1, 0x16u);
}

void __55__IXOwnedDataPromise_setTargetLastPathComponent_error___block_invoke_cold_1()
{
  int v2 = 136315650;
  OUTLINED_FUNCTION_14();
  OUTLINED_FUNCTION_4_1(&dword_1A7B2D000, v0, v1, "%s: Failed to set target last path component to %@ : %@", v2);
}

void __55__IXOwnedDataPromise_targetLastPathComponentWithError___block_invoke_cold_1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void __55__IXOwnedDataPromise_targetLastPathComponentWithError___block_invoke_21_cold_1()
{
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_6(&dword_1A7B2D000, v0, v1, "%s: Failed to get target last path component : %@", v2, v3, v4, v5, 2u);
}

@end