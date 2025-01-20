@interface IXDataPromise
+ (BOOL)promiseExists:(BOOL *)a3 withUUID:(id)a4 error:(id *)a5;
+ (BOOL)supportsSecureCoding;
+ (id)outstandingPromisesForCreator:(unint64_t)a3;
- (BOOL)cancelForReason:(id)a3 client:(unint64_t)a4 error:(id *)a5;
- (BOOL)cancelForReason:(id)a3 error:(id *)a4;
- (BOOL)isComplete;
- (BOOL)isEqual:(id)a3;
- (BOOL)localIsComplete;
- (BOOL)preflightWithError:(id *)a3;
- (BOOL)resetWithError:(id *)a3;
- (Class)seedClass;
- (IXDataPromise)initWithCoder:(id)a3;
- (IXDataPromise)initWithName:(id)a3 client:(unint64_t)a4 diskSpaceNeeded:(unint64_t)a5;
- (IXDataPromise)initWithSeed:(id)a3;
- (IXDataPromiseSeed)seed;
- (NSError)error;
- (NSError)localError;
- (NSString)name;
- (NSUUID)uniqueIdentifier;
- (double)percentComplete;
- (id)description;
- (unint64_t)creatorIdentifier;
- (unint64_t)errorSourceIdentifier;
- (unint64_t)hash;
- (unint64_t)totalBytesNeededOnDisk;
- (void)_clientDelegate_didCancelWithError:(id)a3 client:(unint64_t)a4;
- (void)_clientDelegate_didComplete;
- (void)_updateInitWithSeed:(id)a3 notifyDaemon:(BOOL)a4;
- (void)cancelForReason:(id)a3 client:(unint64_t)a4 completion:(id)a5;
- (void)cancelForReason:(id)a3 completion:(id)a4;
- (void)dealloc;
- (void)encodeWithCoder:(id)a3;
- (void)preflightWithCompletion:(id)a3;
- (void)resetWithCompletion:(id)a3;
- (void)setComplete:(BOOL)a3;
- (void)setError:(id)a3;
- (void)setErrorSourceIdentifier:(unint64_t)a3;
- (void)setPercentComplete:(double)a3;
- (void)setSeed:(id)a3;
@end

@implementation IXDataPromise

- (IXDataPromise)initWithSeed:(id)a3
{
  id v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)IXDataPromise;
  v6 = [(IXDataPromise *)&v10 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_seed, a3);
    v8 = +[IXServerConnection sharedConnection];
    [v8 registerDataPromiseForUpdates:v7 notifyDaemon:0];
  }
  return v7;
}

- (void)_updateInitWithSeed:(id)a3 notifyDaemon:(BOOL)a4
{
  BOOL v4 = a4;
  v6 = (IXDataPromiseSeed *)a3;
  if (![(IXDataPromiseSeed *)v6 creatorIdentifier]
    || ([(IXDataPromiseSeed *)v6 uniqueIdentifier],
        v7 = objc_claimAutoreleasedReturnValue(),
        v7,
        !v7))
  {
    v8 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v9 = *MEMORY[0x1E4F1C3B8];
    uint64_t v10 = [(IXDataPromiseSeed *)v6 creatorIdentifier];
    v11 = [(IXDataPromiseSeed *)v6 uniqueIdentifier];
    [v8 raise:v9, @"Expected client and uniqueID to be initialized but instead got %lu %@", v10, v11 format];
  }
  seed = self->_seed;
  self->_seed = v6;
  v13 = v6;

  id v14 = +[IXServerConnection sharedConnection];

  [v14 registerDataPromiseForUpdates:self notifyDaemon:v4];
}

- (void)dealloc
{
  v3 = +[IXServerConnection sharedConnection];
  BOOL v4 = [(IXDataPromiseSeed *)self->_seed uniqueIdentifier];
  [v3 unregisterForUpdatesForDataPromiseWithUUID:v4];

  v5.receiver = self;
  v5.super_class = (Class)IXDataPromise;
  [(IXDataPromise *)&v5 dealloc];
}

- (Class)seedClass
{
  return (Class)objc_opt_class();
}

- (NSString)name
{
  v2 = [(IXDataPromise *)self seed];
  v3 = [v2 name];

  return (NSString *)v3;
}

- (unint64_t)creatorIdentifier
{
  v2 = [(IXDataPromise *)self seed];
  unint64_t v3 = [v2 creatorIdentifier];

  return v3;
}

- (NSUUID)uniqueIdentifier
{
  v2 = [(IXDataPromise *)self seed];
  unint64_t v3 = [v2 uniqueIdentifier];

  return (NSUUID *)v3;
}

- (unint64_t)totalBytesNeededOnDisk
{
  v2 = [(IXDataPromise *)self seed];
  unint64_t v3 = [v2 totalBytesNeededOnDisk];

  return v3;
}

- (NSError)error
{
  error = self->_error;
  if (error)
  {
    unint64_t v3 = error;
  }
  else
  {
    uint64_t v11 = 0;
    v12 = &v11;
    uint64_t v13 = 0x3032000000;
    id v14 = __Block_byref_object_copy__8;
    v15 = __Block_byref_object_dispose__8;
    id v16 = 0;
    objc_super v5 = +[IXServerConnection sharedConnection];
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __22__IXDataPromise_error__block_invoke;
    v10[3] = &unk_1E5D17550;
    v10[4] = self;
    v10[5] = &v11;
    v6 = [v5 synchronousRemoteObjectProxyWithErrorHandler:v10];
    v7 = [(IXDataPromise *)self uniqueIdentifier];
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __22__IXDataPromise_error__block_invoke_6;
    v9[3] = &unk_1E5D17820;
    v9[4] = self;
    v9[5] = &v11;
    objc_msgSend(v6, "_remote_IXSDataPromise:getErrorInfo:", v7, v9);

    unint64_t v3 = (NSError *)(id)v12[5];
    _Block_object_dispose(&v11, 8);
  }

  return v3;
}

void __22__IXDataPromise_error__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  BOOL v4 = IXGetLoggingHandle((uint64_t)kIXLoggingSubsystem);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v5 = *(void *)(a1 + 32);
    int v8 = 136315650;
    uint64_t v9 = "-[IXDataPromise error]_block_invoke";
    __int16 v10 = 2112;
    uint64_t v11 = v5;
    __int16 v12 = 2112;
    id v13 = v3;
    _os_log_impl(&dword_1A7B2D000, v4, OS_LOG_TYPE_DEFAULT, "%s: Failed contacting daemon on %@ : %@", (uint8_t *)&v8, 0x20u);
  }

  uint64_t v6 = *(void *)(*(void *)(a1 + 40) + 8);
  v7 = *(void **)(v6 + 40);
  *(void *)(v6 + 40) = v3;
}

void __22__IXDataPromise_error__block_invoke_6(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  v7 = v6;
  if (a2 && v6)
  {
    objc_storeStrong((id *)(*(void *)(a1 + 32) + 16), a3);
    *(void *)(*(void *)(a1 + 32) + 24) = a2;
LABEL_8:
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a3);
    goto LABEL_9;
  }
  if (v6)
  {
    int v8 = IXGetLoggingHandle((uint64_t)kIXLoggingSubsystem);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v9 = *(void *)(a1 + 32);
      int v10 = 136315650;
      uint64_t v11 = "-[IXDataPromise error]_block_invoke";
      __int16 v12 = 2112;
      uint64_t v13 = v9;
      __int16 v14 = 2112;
      v15 = v7;
      _os_log_impl(&dword_1A7B2D000, v8, OS_LOG_TYPE_DEFAULT, "%s: Failed to get error property on %@ : %@", (uint8_t *)&v10, 0x20u);
    }

    goto LABEL_8;
  }
LABEL_9:
}

- (NSError)localError
{
  return self->_error;
}

- (unint64_t)errorSourceIdentifier
{
  unint64_t errorSourceIdentifier = self->_errorSourceIdentifier;
  if (!errorSourceIdentifier)
  {
    uint64_t v10 = 0;
    uint64_t v11 = &v10;
    uint64_t v12 = 0x2020000000;
    uint64_t v13 = 0;
    BOOL v4 = +[IXServerConnection sharedConnection];
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __38__IXDataPromise_errorSourceIdentifier__block_invoke;
    v9[3] = &unk_1E5D17618;
    v9[4] = self;
    uint64_t v5 = [v4 synchronousRemoteObjectProxyWithErrorHandler:v9];
    id v6 = [(IXDataPromise *)self uniqueIdentifier];
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __38__IXDataPromise_errorSourceIdentifier__block_invoke_8;
    v8[3] = &unk_1E5D17820;
    v8[4] = self;
    v8[5] = &v10;
    objc_msgSend(v5, "_remote_IXSDataPromise:getErrorInfo:", v6, v8);

    unint64_t errorSourceIdentifier = v11[3];
    _Block_object_dispose(&v10, 8);
  }
  return errorSourceIdentifier;
}

void __38__IXDataPromise_errorSourceIdentifier__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  BOOL v4 = IXGetLoggingHandle((uint64_t)kIXLoggingSubsystem);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v5 = *(void *)(a1 + 32);
    int v6 = 136315650;
    v7 = "-[IXDataPromise errorSourceIdentifier]_block_invoke";
    __int16 v8 = 2112;
    uint64_t v9 = v5;
    __int16 v10 = 2112;
    id v11 = v3;
    _os_log_impl(&dword_1A7B2D000, v4, OS_LOG_TYPE_DEFAULT, "%s: Failed contacting daemon on %@ : %@", (uint8_t *)&v6, 0x20u);
  }
}

void __38__IXDataPromise_errorSourceIdentifier__block_invoke_8(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  v7 = v6;
  if (a2 && v6)
  {
    objc_storeStrong((id *)(*(void *)(a1 + 32) + 16), a3);
    *(void *)(*(void *)(a1 + 32) + 24) = a2;
LABEL_8:
    *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = a2;
    goto LABEL_9;
  }
  if (v6)
  {
    __int16 v8 = IXGetLoggingHandle((uint64_t)kIXLoggingSubsystem);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v9 = *(void *)(a1 + 32);
      int v10 = 136315650;
      id v11 = "-[IXDataPromise errorSourceIdentifier]_block_invoke";
      __int16 v12 = 2112;
      uint64_t v13 = v9;
      __int16 v14 = 2112;
      v15 = v7;
      _os_log_impl(&dword_1A7B2D000, v8, OS_LOG_TYPE_DEFAULT, "%s: Failed to get error source on %@ : %@", (uint8_t *)&v10, 0x20u);
    }

    goto LABEL_8;
  }
LABEL_9:
}

- (BOOL)isComplete
{
  uint64_t v10 = 0;
  id v11 = &v10;
  uint64_t v12 = 0x2020000000;
  char v13 = 0;
  if (self->_complete)
  {
    BOOL v2 = 1;
  }
  else if (self->_error)
  {
    BOOL v2 = 0;
  }
  else
  {
    BOOL v4 = +[IXServerConnection sharedConnection];
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __27__IXDataPromise_isComplete__block_invoke;
    v9[3] = &unk_1E5D17618;
    v9[4] = self;
    uint64_t v5 = [v4 synchronousRemoteObjectProxyWithErrorHandler:v9];
    id v6 = [(IXDataPromise *)self uniqueIdentifier];
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __27__IXDataPromise_isComplete__block_invoke_9;
    v8[3] = &unk_1E5D17640;
    v8[4] = self;
    v8[5] = &v10;
    objc_msgSend(v5, "_remote_IXSDataPromise:getIsComplete:", v6, v8);

    BOOL v2 = *((unsigned char *)v11 + 24) != 0;
  }
  _Block_object_dispose(&v10, 8);
  return v2;
}

void __27__IXDataPromise_isComplete__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  BOOL v4 = IXGetLoggingHandle((uint64_t)kIXLoggingSubsystem);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v5 = *(void *)(a1 + 32);
    int v6 = 136315650;
    v7 = "-[IXDataPromise isComplete]_block_invoke";
    __int16 v8 = 2112;
    uint64_t v9 = v5;
    __int16 v10 = 2112;
    id v11 = v3;
    _os_log_impl(&dword_1A7B2D000, v4, OS_LOG_TYPE_DEFAULT, "%s: Failed contacting daemon on %@ : %@", (uint8_t *)&v6, 0x20u);
  }
}

void __27__IXDataPromise_isComplete__block_invoke_9(uint64_t a1, char a2, void *a3)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if (v5)
  {
    int v6 = IXGetLoggingHandle((uint64_t)kIXLoggingSubsystem);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v7 = *(void *)(a1 + 32);
      int v8 = 136315650;
      uint64_t v9 = "-[IXDataPromise isComplete]_block_invoke";
      __int16 v10 = 2112;
      uint64_t v11 = v7;
      __int16 v12 = 2112;
      id v13 = v5;
      _os_log_impl(&dword_1A7B2D000, v6, OS_LOG_TYPE_DEFAULT, "%s: Failed to get isComplete on %@ : %@", (uint8_t *)&v8, 0x20u);
    }
  }
  else
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = a2;
    *(unsigned char *)(*(void *)(a1 + 32) + 8) = a2;
  }
}

- (void)setComplete:(BOOL)a3
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  if (self->_error)
  {
    BOOL v4 = IXGetLoggingHandle((uint64_t)kIXLoggingSubsystem);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      error = self->_error;
      *(_DWORD *)buf = 136315394;
      uint64_t v9 = "-[IXDataPromise setComplete:]";
      __int16 v10 = 2112;
      uint64_t v11 = error;
      _os_log_impl(&dword_1A7B2D000, v4, OS_LOG_TYPE_DEFAULT, "%s: Called after error %@ occurred; ignoring.",
        buf,
        0x16u);
    }
  }
  else if (a3)
  {
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __29__IXDataPromise_setComplete___block_invoke;
    v7[3] = &unk_1E5D180E0;
    v7[4] = self;
    id v6 = +[IXServerConnection retrySynchronousIPC:v7];
  }
}

id __29__IXDataPromise_setComplete___block_invoke(uint64_t a1)
{
  uint64_t v9 = 0;
  __int16 v10 = &v9;
  uint64_t v11 = 0x3032000000;
  uint64_t v12 = __Block_byref_object_copy__8;
  id v13 = __Block_byref_object_dispose__8;
  id v14 = 0;
  BOOL v2 = +[IXServerConnection sharedConnection];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __29__IXDataPromise_setComplete___block_invoke_2;
  v8[3] = &unk_1E5D17550;
  v8[4] = *(void *)(a1 + 32);
  v8[5] = &v9;
  id v3 = [v2 synchronousRemoteObjectProxyWithErrorHandler:v8];
  BOOL v4 = [*(id *)(a1 + 32) uniqueIdentifier];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __29__IXDataPromise_setComplete___block_invoke_11;
  v7[3] = &unk_1E5D17550;
  v7[4] = *(void *)(a1 + 32);
  void v7[5] = &v9;
  objc_msgSend(v3, "_remote_IXSDataPromise:setIsComplete:completion:", v4, 1, v7);

  id v5 = (id)v10[5];
  _Block_object_dispose(&v9, 8);

  return v5;
}

void __29__IXDataPromise_setComplete___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  BOOL v4 = IXGetLoggingHandle((uint64_t)kIXLoggingSubsystem);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v5 = *(void *)(a1 + 32);
    int v8 = 136315650;
    uint64_t v9 = "-[IXDataPromise setComplete:]_block_invoke_2";
    __int16 v10 = 2112;
    uint64_t v11 = v5;
    __int16 v12 = 2112;
    id v13 = v3;
    _os_log_impl(&dword_1A7B2D000, v4, OS_LOG_TYPE_DEFAULT, "%s: Failed contacting daemon on %@ : %@", (uint8_t *)&v8, 0x20u);
  }

  uint64_t v6 = *(void *)(*(void *)(a1 + 40) + 8);
  uint64_t v7 = *(void **)(v6 + 40);
  *(void *)(v6 + 40) = v3;
}

void __29__IXDataPromise_setComplete___block_invoke_11(uint64_t a1, void *a2)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v4 = a2;
  if (v4)
  {
    uint64_t v5 = IXGetLoggingHandle((uint64_t)kIXLoggingSubsystem);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v6 = *(void *)(a1 + 32);
      int v7 = 136315650;
      int v8 = "-[IXDataPromise setComplete:]_block_invoke";
      __int16 v9 = 2112;
      uint64_t v10 = v6;
      __int16 v11 = 2112;
      id v12 = v4;
      _os_log_impl(&dword_1A7B2D000, v5, OS_LOG_TYPE_DEFAULT, "%s: Failed to set isComplete on %@ : %@", (uint8_t *)&v7, 0x20u);
    }

    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a2);
  }
  else
  {
    *(unsigned char *)(*(void *)(a1 + 32) + 8) = 1;
  }
}

- (BOOL)localIsComplete
{
  return self->_complete;
}

- (double)percentComplete
{
  uint64_t v10 = 0;
  __int16 v11 = (double *)&v10;
  uint64_t v12 = 0x2020000000;
  uint64_t v13 = 0;
  id v3 = +[IXServerConnection sharedConnection];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __32__IXDataPromise_percentComplete__block_invoke;
  v9[3] = &unk_1E5D17618;
  v9[4] = self;
  id v4 = [v3 synchronousRemoteObjectProxyWithErrorHandler:v9];
  uint64_t v5 = [(IXDataPromise *)self uniqueIdentifier];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __32__IXDataPromise_percentComplete__block_invoke_13;
  v8[3] = &unk_1E5D182D0;
  v8[4] = self;
  v8[5] = &v10;
  objc_msgSend(v4, "_remote_IXSDataPromise:getPercentComplete:", v5, v8);

  double v6 = v11[3];
  _Block_object_dispose(&v10, 8);
  return v6;
}

void __32__IXDataPromise_percentComplete__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = IXGetLoggingHandle((uint64_t)kIXLoggingSubsystem);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v5 = *(void *)(a1 + 32);
    int v6 = 136315650;
    int v7 = "-[IXDataPromise percentComplete]_block_invoke";
    __int16 v8 = 2112;
    uint64_t v9 = v5;
    __int16 v10 = 2112;
    id v11 = v3;
    _os_log_impl(&dword_1A7B2D000, v4, OS_LOG_TYPE_DEFAULT, "%s: Failed contacting daemon on %@ : %@", (uint8_t *)&v6, 0x20u);
  }
}

void __32__IXDataPromise_percentComplete__block_invoke_13(uint64_t a1, void *a2, double a3)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  if (v5)
  {
    int v6 = IXGetLoggingHandle((uint64_t)kIXLoggingSubsystem);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v7 = *(void *)(a1 + 32);
      int v8 = 136315650;
      uint64_t v9 = "-[IXDataPromise percentComplete]_block_invoke";
      __int16 v10 = 2112;
      uint64_t v11 = v7;
      __int16 v12 = 2112;
      id v13 = v5;
      _os_log_impl(&dword_1A7B2D000, v6, OS_LOG_TYPE_DEFAULT, "%s: Failed to get percentComplete on %@ : %@", (uint8_t *)&v8, 0x20u);
    }
  }
  else
  {
    *(double *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = a3;
  }
}

- (void)setPercentComplete:(double)a3
{
  id v5 = +[IXServerConnection sharedConnection];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __36__IXDataPromise_setPercentComplete___block_invoke;
  v8[3] = &unk_1E5D182F8;
  *(double *)&v8[5] = a3;
  v8[4] = self;
  int v6 = [v5 synchronousRemoteObjectProxyWithErrorHandler:v8];
  uint64_t v7 = [(IXDataPromise *)self uniqueIdentifier];
  objc_msgSend(v6, "_remote_IXSDataPromise:setPercentComplete:", v7, a3);
}

void __36__IXDataPromise_setPercentComplete___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = IXGetLoggingHandle((uint64_t)kIXLoggingSubsystem);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v6 = *(void *)(a1 + 32);
    uint64_t v5 = *(void *)(a1 + 40);
    int v7 = 136315906;
    int v8 = "-[IXDataPromise setPercentComplete:]_block_invoke";
    __int16 v9 = 2048;
    uint64_t v10 = v5;
    __int16 v11 = 2112;
    uint64_t v12 = v6;
    __int16 v13 = 2112;
    id v14 = v3;
    _os_log_impl(&dword_1A7B2D000, v4, OS_LOG_TYPE_DEFAULT, "%s: Failed to set percentComplete to %f on %@ : %@", (uint8_t *)&v7, 0x2Au);
  }
}

- (IXDataPromise)initWithCoder:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)IXDataPromise;
  uint64_t v5 = [(IXDataPromise *)&v10 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"seed"];
    seed = v5->_seed;
    v5->_seed = (IXDataPromiseSeed *)v6;

    int v8 = +[IXServerConnection sharedConnection];
    [v8 registerDataPromiseForUpdates:v5 notifyDaemon:1];
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [(IXDataPromise *)self seed];
  [v4 encodeObject:v5 forKey:@"seed"];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (IXDataPromise)initWithName:(id)a3 client:(unint64_t)a4 diskSpaceNeeded:(unint64_t)a5
{
  id v8 = a3;
  v16.receiver = self;
  v16.super_class = (Class)IXDataPromise;
  __int16 v9 = [(IXDataPromise *)&v16 init];
  objc_super v10 = v9;
  if (v9)
  {
    [(IXDataPromise *)v9 seedClass];
    __int16 v11 = objc_opt_new();
    [(IXDataPromise *)v10 setSeed:v11];

    uint64_t v12 = [(IXDataPromise *)v10 seed];
    [v12 setName:v8];

    __int16 v13 = [(IXDataPromise *)v10 seed];
    [v13 setCreatorIdentifier:a4];

    id v14 = [(IXDataPromise *)v10 seed];
    [v14 setTotalBytesNeededOnDisk:a5];
  }
  return v10;
}

- (unint64_t)hash
{
  BOOL v2 = [(IXDataPromise *)self uniqueIdentifier];
  unint64_t v3 = [v2 hash];

  return v3;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v5 = v4;
    uint64_t v6 = [(IXDataPromise *)self uniqueIdentifier];
    int v7 = [v5 uniqueIdentifier];

    char v8 = [v6 isEqual:v7];
  }
  else
  {
    char v8 = 0;
  }

  return v8;
}

- (id)description
{
  unint64_t v3 = NSString;
  id v4 = (objc_class *)objc_opt_class();
  id v5 = NSStringFromClass(v4);
  uint64_t v6 = [(IXDataPromise *)self name];
  int v7 = [(IXDataPromise *)self seed];
  char v8 = [v7 uniqueIdentifier];
  __int16 v9 = IXStringForClientID([(IXDataPromise *)self creatorIdentifier]);
  objc_super v10 = [v3 stringWithFormat:@"<%@<%p> name:\"%@\" uuid:%@ creator:\"%@\">", v5, self, v6, v8, v9];

  return v10;
}

- (void)cancelForReason:(id)a3 completion:(id)a4
{
}

- (void)cancelForReason:(id)a3 client:(unint64_t)a4 completion:(id)a5
{
  id v8 = a3;
  __int16 v9 = (void (**)(id, void *))a5;
  if (!v8)
  {
    id v14 = IXGetLoggingHandle((uint64_t)kIXLoggingSubsystem);
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
      -[IXDataPromise cancelForReason:client:completion:]();
    }

    objc_super v16 = @"-[IXDataPromise cancelForReason:client:completion:] was called with nil reason; this isn't valid.";
    uint64_t v17 = 301;
    goto LABEL_10;
  }
  if (!a4)
  {
    v18 = IXGetLoggingHandle((uint64_t)kIXLoggingSubsystem);
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR)) {
      -[IXDataPromise cancelForReason:client:completion:]();
    }

    objc_super v16 = @"-[IXDataPromise cancelForReason:client:completion:] was called with client of IXClientNone which is not valid.";
    uint64_t v17 = 307;
LABEL_10:
    v19 = _CreateError((uint64_t)"-[IXDataPromise cancelForReason:client:completion:]", v17, @"IXErrorDomain", 4uLL, 0, 0, v16, v15, v20);
    v9[2](v9, v19);

    goto LABEL_11;
  }
  [(IXDataPromise *)self setError:v8];
  [(IXDataPromise *)self setErrorSourceIdentifier:a4];
  self->_complete = 0;
  objc_super v10 = +[IXServerConnection sharedConnection];
  uint64_t v20 = MEMORY[0x1E4F143A8];
  uint64_t v21 = 3221225472;
  v22 = __51__IXDataPromise_cancelForReason_client_completion___block_invoke;
  v23 = &unk_1E5D181F0;
  v24 = self;
  __int16 v11 = v9;
  v25 = v11;
  uint64_t v12 = [v10 remoteObjectProxyWithErrorHandler:&v20];
  __int16 v13 = [(IXDataPromise *)self uniqueIdentifier];
  objc_msgSend(v12, "_remote_IXSDataPromise:cancelForReason:client:completion:", v13, v8, a4, v11);

LABEL_11:
}

void __51__IXDataPromise_cancelForReason_client_completion___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = IXGetLoggingHandle((uint64_t)kIXLoggingSubsystem);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v5 = *(void *)(a1 + 32);
    int v6 = 136315650;
    int v7 = "-[IXDataPromise cancelForReason:client:completion:]_block_invoke";
    __int16 v8 = 2112;
    uint64_t v9 = v5;
    __int16 v10 = 2112;
    id v11 = v3;
    _os_log_impl(&dword_1A7B2D000, v4, OS_LOG_TYPE_DEFAULT, "%s: Failed to cancel %@ : %@", (uint8_t *)&v6, 0x20u);
  }

  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (BOOL)cancelForReason:(id)a3 error:(id *)a4
{
  return [(IXDataPromise *)self cancelForReason:a3 client:14 error:a4];
}

- (BOOL)cancelForReason:(id)a3 client:(unint64_t)a4 error:(id *)a5
{
  id v8 = a3;
  uint64_t v29 = 0;
  v30 = &v29;
  uint64_t v31 = 0x2020000000;
  char v32 = 0;
  uint64_t v23 = 0;
  v24 = &v23;
  uint64_t v25 = 0x3032000000;
  v26 = __Block_byref_object_copy__8;
  v27 = __Block_byref_object_dispose__8;
  id v28 = 0;
  if (!v8)
  {
    uint64_t v12 = IXGetLoggingHandle((uint64_t)kIXLoggingSubsystem);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
      -[IXDataPromise cancelForReason:client:error:]();
    }

    _CreateError((uint64_t)"-[IXDataPromise cancelForReason:client:error:]", 333, @"IXErrorDomain", 4uLL, 0, 0, @"-[IXDataPromise cancelForReason:client:completion:] was called with nil reason; this isn't valid.",
      v13,
    uint64_t v14 = v21[0]);
    goto LABEL_10;
  }
  if (!a4)
  {
    uint64_t v15 = IXGetLoggingHandle((uint64_t)kIXLoggingSubsystem);
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
      -[IXDataPromise cancelForReason:client:error:]();
    }

    uint64_t v14 = _CreateError((uint64_t)"-[IXDataPromise cancelForReason:client:error:]", 338, @"IXErrorDomain", 4uLL, 0, 0, @"-[IXDataPromise cancelForReason:client:completion:] was called with client of IXClientNone which is not valid.", v16, v21[0]);
LABEL_10:
    uint64_t v17 = (void *)v24[5];
    v24[5] = v14;

    goto LABEL_11;
  }
  [(IXDataPromise *)self setError:v8];
  [(IXDataPromise *)self setErrorSourceIdentifier:a4];
  uint64_t v9 = +[IXServerConnection sharedConnection];
  v22[0] = MEMORY[0x1E4F143A8];
  v22[1] = 3221225472;
  v22[2] = __46__IXDataPromise_cancelForReason_client_error___block_invoke;
  v22[3] = &unk_1E5D17550;
  v22[4] = self;
  v22[5] = &v23;
  __int16 v10 = [v9 synchronousRemoteObjectProxyWithErrorHandler:v22];
  id v11 = [(IXDataPromise *)self uniqueIdentifier];
  v21[0] = MEMORY[0x1E4F143A8];
  v21[1] = 3221225472;
  v21[2] = (uint64_t)__46__IXDataPromise_cancelForReason_client_error___block_invoke_28;
  v21[3] = (uint64_t)&unk_1E5D17140;
  v21[4] = (uint64_t)&v23;
  v21[5] = (uint64_t)&v29;
  objc_msgSend(v10, "_remote_IXSDataPromise:cancelForReason:client:completion:", v11, v8, a4, v21);

LABEL_11:
  int v18 = *((unsigned __int8 *)v30 + 24);
  if (a5 && !*((unsigned char *)v30 + 24))
  {
    *a5 = (id) v24[5];
    int v18 = *((unsigned __int8 *)v30 + 24);
  }
  BOOL v19 = v18 != 0;
  _Block_object_dispose(&v23, 8);

  _Block_object_dispose(&v29, 8);
  return v19;
}

void __46__IXDataPromise_cancelForReason_client_error___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = IXGetLoggingHandle((uint64_t)kIXLoggingSubsystem);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v5 = *(void *)(a1 + 32);
    int v8 = 136315650;
    uint64_t v9 = "-[IXDataPromise cancelForReason:client:error:]_block_invoke";
    __int16 v10 = 2112;
    uint64_t v11 = v5;
    __int16 v12 = 2112;
    id v13 = v3;
    _os_log_impl(&dword_1A7B2D000, v4, OS_LOG_TYPE_DEFAULT, "%s: Failed to cancel %@ : %@", (uint8_t *)&v8, 0x20u);
  }

  uint64_t v6 = *(void *)(*(void *)(a1 + 40) + 8);
  int v7 = *(void **)(v6 + 40);
  *(void *)(v6 + 40) = v3;
}

void __46__IXDataPromise_cancelForReason_client_error___block_invoke_28(uint64_t a1, void *a2)
{
  id v4 = a2;
  if (v4)
  {
    id v5 = v4;
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40), a2);
    id v4 = v5;
  }
  else
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 1;
  }
}

- (void)resetWithCompletion:(id)a3
{
  id v4 = a3;
  id v5 = +[IXServerConnection sharedConnection];
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __37__IXDataPromise_resetWithCompletion___block_invoke;
  v12[3] = &unk_1E5D171B8;
  id v6 = v4;
  id v13 = v6;
  int v7 = [v5 remoteObjectProxyWithErrorHandler:v12];
  int v8 = [(IXDataPromise *)self uniqueIdentifier];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __37__IXDataPromise_resetWithCompletion___block_invoke_29;
  v10[3] = &unk_1E5D181F0;
  v10[4] = self;
  id v11 = v6;
  id v9 = v6;
  objc_msgSend(v7, "_remote_IXSDataPromise:resetWithCompletion:", v8, v10);
}

void __37__IXDataPromise_resetWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if (v3)
  {
    id v4 = IXGetLoggingHandle((uint64_t)kIXLoggingSubsystem);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      int v5 = 136315394;
      id v6 = "-[IXDataPromise resetWithCompletion:]_block_invoke";
      __int16 v7 = 2112;
      id v8 = v3;
      _os_log_impl(&dword_1A7B2D000, v4, OS_LOG_TYPE_DEFAULT, "%s: Remote object proxy returned error %@", (uint8_t *)&v5, 0x16u);
    }
  }
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __37__IXDataPromise_resetWithCompletion___block_invoke_29(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (v3)
  {
    v5[0] = MEMORY[0x1E4F143A8];
    v5[1] = 3221225472;
    v5[2] = __37__IXDataPromise_resetWithCompletion___block_invoke_2;
    v5[3] = &unk_1E5D17398;
    id v4 = *(void **)(a1 + 32);
    id v7 = *(id *)(a1 + 40);
    id v6 = v3;
    [v4 cancelForReason:v6 client:15 completion:v5];
  }
  else
  {
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
}

void __37__IXDataPromise_resetWithCompletion___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if (v3)
  {
    id v4 = IXGetLoggingHandle((uint64_t)kIXLoggingSubsystem);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      int v5 = 136315394;
      id v6 = "-[IXDataPromise resetWithCompletion:]_block_invoke_2";
      __int16 v7 = 2112;
      id v8 = v3;
      _os_log_impl(&dword_1A7B2D000, v4, OS_LOG_TYPE_DEFAULT, "%s: Failed to cancel for reason: %@", (uint8_t *)&v5, 0x16u);
    }
  }
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (BOOL)resetWithError:(id *)a3
{
  uint64_t v19 = 0;
  uint64_t v20 = &v19;
  uint64_t v21 = 0x2020000000;
  char v22 = 0;
  uint64_t v13 = 0;
  uint64_t v14 = &v13;
  uint64_t v15 = 0x3032000000;
  uint64_t v16 = __Block_byref_object_copy__8;
  uint64_t v17 = __Block_byref_object_dispose__8;
  id v18 = 0;
  int v5 = +[IXServerConnection sharedConnection];
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __32__IXDataPromise_resetWithError___block_invoke;
  v12[3] = &unk_1E5D172A8;
  void v12[4] = &v13;
  id v6 = [v5 synchronousRemoteObjectProxyWithErrorHandler:v12];
  __int16 v7 = [(IXDataPromise *)self uniqueIdentifier];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __32__IXDataPromise_resetWithError___block_invoke_30;
  v11[3] = &unk_1E5D17690;
  v11[4] = self;
  v11[5] = &v13;
  v11[6] = &v19;
  objc_msgSend(v6, "_remote_IXSDataPromise:resetWithCompletion:", v7, v11);

  int v8 = *((unsigned __int8 *)v20 + 24);
  if (a3 && !*((unsigned char *)v20 + 24))
  {
    *a3 = (id) v14[5];
    int v8 = *((unsigned __int8 *)v20 + 24);
  }
  BOOL v9 = v8 != 0;
  _Block_object_dispose(&v13, 8);

  _Block_object_dispose(&v19, 8);
  return v9;
}

void __32__IXDataPromise_resetWithError___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v4 = a2;
  if (v4)
  {
    int v5 = IXGetLoggingHandle((uint64_t)kIXLoggingSubsystem);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      int v6 = 136315394;
      __int16 v7 = "-[IXDataPromise resetWithError:]_block_invoke";
      __int16 v8 = 2112;
      id v9 = v4;
      _os_log_impl(&dword_1A7B2D000, v5, OS_LOG_TYPE_DEFAULT, "%s: Remote object proxy returned error %@", (uint8_t *)&v6, 0x16u);
    }

    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40), a2);
  }
}

uint64_t __32__IXDataPromise_resetWithError___block_invoke_30(uint64_t a1, void *a2)
{
  id v4 = a2;
  if (v4)
  {
    [*(id *)(a1 + 32) cancelForReason:v4 client:15 completion:&__block_literal_global_7];
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a2);
  }
  else
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = 1;
  }

  return MEMORY[0x1F41817F8]();
}

- (void)preflightWithCompletion:(id)a3
{
  id v4 = a3;
  int v5 = +[IXServerConnection sharedConnection];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __41__IXDataPromise_preflightWithCompletion___block_invoke;
  v9[3] = &unk_1E5D171B8;
  id v10 = v4;
  id v6 = v4;
  __int16 v7 = [v5 remoteObjectProxyWithErrorHandler:v9];
  __int16 v8 = [(IXDataPromise *)self uniqueIdentifier];
  objc_msgSend(v7, "_remote_IXSDataPromise:preflightWithCompletion:", v8, v6);
}

void __41__IXDataPromise_preflightWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if (v3)
  {
    id v4 = IXGetLoggingHandle((uint64_t)kIXLoggingSubsystem);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      int v5 = 136315394;
      id v6 = "-[IXDataPromise preflightWithCompletion:]_block_invoke";
      __int16 v7 = 2112;
      id v8 = v3;
      _os_log_impl(&dword_1A7B2D000, v4, OS_LOG_TYPE_DEFAULT, "%s: Remote object proxy returned error %@", (uint8_t *)&v5, 0x16u);
    }
  }
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (BOOL)preflightWithError:(id *)a3
{
  uint64_t v13 = 0;
  uint64_t v14 = &v13;
  uint64_t v15 = 0x3032000000;
  uint64_t v16 = __Block_byref_object_copy__8;
  uint64_t v17 = __Block_byref_object_dispose__8;
  id v18 = 0;
  int v5 = +[IXServerConnection sharedConnection];
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __36__IXDataPromise_preflightWithError___block_invoke;
  v12[3] = &unk_1E5D172A8;
  void v12[4] = &v13;
  id v6 = [v5 synchronousRemoteObjectProxyWithErrorHandler:v12];
  __int16 v7 = [(IXDataPromise *)self uniqueIdentifier];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __36__IXDataPromise_preflightWithError___block_invoke_31;
  v11[3] = &unk_1E5D172A8;
  v11[4] = &v13;
  objc_msgSend(v6, "_remote_IXSDataPromise:preflightWithCompletion:", v7, v11);

  id v8 = (void *)v14[5];
  if (a3 && v8)
  {
    *a3 = v8;
    id v8 = (void *)v14[5];
  }
  BOOL v9 = v8 == 0;
  _Block_object_dispose(&v13, 8);

  return v9;
}

void __36__IXDataPromise_preflightWithError___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v4 = a2;
  if (v4)
  {
    int v5 = IXGetLoggingHandle((uint64_t)kIXLoggingSubsystem);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      int v6 = 136315394;
      __int16 v7 = "-[IXDataPromise preflightWithError:]_block_invoke";
      __int16 v8 = 2112;
      id v9 = v4;
      _os_log_impl(&dword_1A7B2D000, v5, OS_LOG_TYPE_DEFAULT, "%s: Remote object proxy returned error %@", (uint8_t *)&v6, 0x16u);
    }

    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40), a2);
  }
}

void __36__IXDataPromise_preflightWithError___block_invoke_31(uint64_t a1, void *a2)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v4 = a2;
  if (v4)
  {
    int v5 = IXGetLoggingHandle((uint64_t)kIXLoggingSubsystem);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      int v6 = 136315394;
      __int16 v7 = "-[IXDataPromise preflightWithError:]_block_invoke";
      __int16 v8 = 2112;
      id v9 = v4;
      _os_log_impl(&dword_1A7B2D000, v5, OS_LOG_TYPE_DEFAULT, "%s: Preflight failed with error: %@", (uint8_t *)&v6, 0x16u);
    }

    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40), a2);
  }
}

- (void)_clientDelegate_didComplete
{
  if (!self->_error) {
    self->_complete = 1;
  }
}

- (void)_clientDelegate_didCancelWithError:(id)a3 client:(unint64_t)a4
{
  self->_complete = 0;
  [(IXDataPromise *)self setError:a3];

  [(IXDataPromise *)self setErrorSourceIdentifier:a4];
}

- (void)setError:(id)a3
{
}

- (void)setErrorSourceIdentifier:(unint64_t)a3
{
  self->_unint64_t errorSourceIdentifier = a3;
}

- (IXDataPromiseSeed)seed
{
  return self->_seed;
}

- (void)setSeed:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_seed, 0);

  objc_storeStrong((id *)&self->_error, 0);
}

+ (id)outstandingPromisesForCreator:(unint64_t)a3
{
  uint64_t v9 = 0;
  uint64_t v10 = &v9;
  uint64_t v11 = 0x3032000000;
  __int16 v12 = __Block_byref_object_copy__8;
  uint64_t v13 = __Block_byref_object_dispose__8;
  id v14 = 0;
  id v4 = +[IXServerConnection sharedConnection];
  int v5 = [v4 synchronousRemoteObjectProxyWithErrorHandler:&__block_literal_global_132];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __58__IXDataPromise_IXTesting__outstandingPromisesForCreator___block_invoke_133;
  v8[3] = &unk_1E5D18320;
  v8[4] = &v9;
  objc_msgSend(v5, "_remote_fetchRegisteredDataPromiseInfoForCreator:completion:", a3, v8);

  id v6 = (id)v10[5];
  _Block_object_dispose(&v9, 8);

  return v6;
}

void __58__IXDataPromise_IXTesting__outstandingPromisesForCreator___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  id v2 = a2;
  id v3 = IXGetLoggingHandle((uint64_t)kIXLoggingSubsystem);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    int v4 = 136315394;
    int v5 = "+[IXDataPromise(IXTesting) outstandingPromisesForCreator:]_block_invoke";
    __int16 v6 = 2112;
    id v7 = v2;
    _os_log_impl(&dword_1A7B2D000, v3, OS_LOG_TYPE_DEFAULT, "%s: Failed to contact daemon to get registered data promise info: %@", (uint8_t *)&v4, 0x16u);
  }
}

void __58__IXDataPromise_IXTesting__outstandingPromisesForCreator___block_invoke_133(uint64_t a1, void *a2, void *a3)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  if (v6)
  {
    id v7 = IXGetLoggingHandle((uint64_t)kIXLoggingSubsystem);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      int v10 = 136315394;
      uint64_t v11 = "+[IXDataPromise(IXTesting) outstandingPromisesForCreator:]_block_invoke";
      __int16 v12 = 2112;
      id v13 = v6;
      _os_log_impl(&dword_1A7B2D000, v7, OS_LOG_TYPE_DEFAULT, "%s: Failed to get reigstered data promise info: %@", (uint8_t *)&v10, 0x16u);
    }
  }
  uint64_t v8 = *(void *)(*(void *)(a1 + 32) + 8);
  uint64_t v9 = *(void **)(v8 + 40);
  *(void *)(v8 + 40) = v5;
}

+ (BOOL)promiseExists:(BOOL *)a3 withUUID:(id)a4 error:(id *)a5
{
  id v7 = a4;
  uint64_t v26 = 0;
  v27 = &v26;
  uint64_t v28 = 0x2020000000;
  char v29 = 0;
  uint64_t v22 = 0;
  uint64_t v23 = &v22;
  uint64_t v24 = 0x2020000000;
  char v25 = 0;
  uint64_t v16 = 0;
  uint64_t v17 = &v16;
  uint64_t v18 = 0x3032000000;
  uint64_t v19 = __Block_byref_object_copy__8;
  uint64_t v20 = __Block_byref_object_dispose__8;
  id v21 = 0;
  uint64_t v8 = +[IXServerConnection sharedConnection];
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __57__IXDataPromise_IXTesting__promiseExists_withUUID_error___block_invoke;
  v15[3] = &unk_1E5D172A8;
  v15[4] = &v16;
  uint64_t v9 = [v8 synchronousRemoteObjectProxyWithErrorHandler:v15];
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __57__IXDataPromise_IXTesting__promiseExists_withUUID_error___block_invoke_135;
  v14[3] = &unk_1E5D18348;
  v14[4] = &v16;
  v14[5] = &v22;
  v14[6] = &v26;
  objc_msgSend(v9, "_remote_checkIfDataPromiseExistsForUUID:completion:", v7, v14);

  int v10 = v27;
  int v11 = *((unsigned __int8 *)v27 + 24);
  if (a5 && !*((unsigned char *)v27 + 24))
  {
    *a5 = (id) v17[5];
    int v10 = v27;
    int v11 = *((unsigned __int8 *)v27 + 24);
  }
  if (v11)
  {
    *a3 = *((unsigned char *)v23 + 24);
    BOOL v12 = *((unsigned char *)v10 + 24) != 0;
  }
  else
  {
    BOOL v12 = 0;
  }
  _Block_object_dispose(&v16, 8);

  _Block_object_dispose(&v22, 8);
  _Block_object_dispose(&v26, 8);

  return v12;
}

void __57__IXDataPromise_IXTesting__promiseExists_withUUID_error___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  int v4 = IXGetLoggingHandle((uint64_t)kIXLoggingSubsystem);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    int v7 = 136315394;
    uint64_t v8 = "+[IXDataPromise(IXTesting) promiseExists:withUUID:error:]_block_invoke";
    __int16 v9 = 2112;
    id v10 = v3;
    _os_log_impl(&dword_1A7B2D000, v4, OS_LOG_TYPE_DEFAULT, "%s: Failed to contact daemon to get promise info: %@", (uint8_t *)&v7, 0x16u);
  }

  uint64_t v5 = *(void *)(*(void *)(a1 + 32) + 8);
  id v6 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v3;
}

void __57__IXDataPromise_IXTesting__promiseExists_withUUID_error___block_invoke_135(void *a1, char a2, void *a3)
{
  id v6 = a3;
  if (v6)
  {
    id v7 = v6;
    objc_storeStrong((id *)(*(void *)(a1[4] + 8) + 40), a3);
    id v6 = v7;
  }
  else
  {
    *(unsigned char *)(*(void *)(a1[5] + 8) + 24) = a2;
    *(unsigned char *)(*(void *)(a1[6] + 8) + 24) = 1;
  }
}

- (void)cancelForReason:client:completion:.cold.1()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_6(&dword_1A7B2D000, v0, v1, "%s: -[IXDataPromise cancelForReason:client:completion:] was called with nil reason; this isn't valid. : %@",
    v2,
    v3,
    v4,
    v5,
    2u);
}

- (void)cancelForReason:client:completion:.cold.2()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_6(&dword_1A7B2D000, v0, v1, "%s: -[IXDataPromise cancelForReason:client:completion:] was called with client of IXClientNone which is not valid. : %@", v2, v3, v4, v5, 2u);
}

- (void)cancelForReason:client:error:.cold.1()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_6(&dword_1A7B2D000, v0, v1, "%s: -[IXDataPromise cancelForReason:client:completion:] was called with nil reason; this isn't valid. : %@",
    v2,
    v3,
    v4,
    v5,
    2u);
}

- (void)cancelForReason:client:error:.cold.2()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_6(&dword_1A7B2D000, v0, v1, "%s: -[IXDataPromise cancelForReason:client:completion:] was called with client of IXClientNone which is not valid. : %@", v2, v3, v4, v5, 2u);
}

@end