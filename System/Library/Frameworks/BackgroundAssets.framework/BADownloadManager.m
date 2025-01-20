@interface BADownloadManager
+ (BADownloadManager)sharedManager;
+ (void)_enforceCallerConformsToRequirements;
- (BADownloadManager)init;
- (BOOL)cancelDownload:(BADownload *)download error:(NSError *)error;
- (BOOL)scheduleDownload:(BADownload *)download error:(NSError *)error;
- (BOOL)startForegroundDownload:(BADownload *)download error:(NSError *)error;
- (NSArray)fetchCurrentDownloads:(NSError *)error;
- (id)delegate;
- (id)extensionConnection;
- (uint64_t)setScheduleLocked:(uint64_t)result;
- (void)downloadIdentifier:(id)a3 didFailWithError:(id)a4 wasHandled:(id)a5;
- (void)downloadIdentifier:(id)a3 didReceiveChallenge:(id)a4 authChallengeHandler:(id)a5;
- (void)downloadIdentifier:(id)a3 didWriteBytes:(int64_t)a4 totalBytesWritten:(int64_t)a5 totalBytesExpectedToWrite:(int64_t)a6;
- (void)downloadIdentifierDidBegin:(id)a3;
- (void)downloadIdentifierDidFinish:(id)a3 sandboxExtensionToken:(id)a4 wasHandled:(id)a5;
- (void)downloadIdentifierDidPause:(id)a3;
- (void)fetchCurrentDownloadsWithCompletionHandler:(void *)completionHandler;
- (void)initWithApplicationIdentifier:(void *)a1;
- (void)performWithExclusiveControl:(void *)performHandler;
- (void)performWithExclusiveControlBeforeDate:(NSDate *)date performHandler:(void *)performHandler;
- (void)removeDownloadIdentifier:(id)a3;
- (void)setDelegate:(id)delegate;
- (void)setExtensionConnection:(uint64_t)a1;
- (void)syncDownloads:(id)a3;
@end

@implementation BADownloadManager

- (id)extensionConnection
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 8));
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 16));
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 8));
  }
  else
  {
    id WeakRetained = 0;
  }

  return WeakRetained;
}

- (void)setExtensionConnection:(uint64_t)a1
{
  if (a1)
  {
    v3 = (os_unfair_lock_s *)(a1 + 8);
    id v4 = a2;
    os_unfair_lock_lock(v3);
    objc_storeWeak((id *)(a1 + 16), v4);

    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 8));
  }
}

+ (BADownloadManager)sharedManager
{
  if (sharedManager_onceToken != -1) {
    dispatch_once(&sharedManager_onceToken, &__block_literal_global_4);
  }
  v2 = (void *)sharedManager_sDownloader;

  return (BADownloadManager *)v2;
}

void __34__BADownloadManager_sharedManager__block_invoke()
{
  v0 = [BADownloadManager alloc];
  id v4 = [MEMORY[0x263F086E0] mainBundle];
  v1 = [v4 bundleIdentifier];
  -[BADownloadManager initWithApplicationIdentifier:](v0, v1);
  v2 = (void *)sharedManager_sDownloader;
  sharedManager_sDownloader = v3;
}

- (void)initWithApplicationIdentifier:(void *)a1
{
  id v3 = a2;
  if (!a1) {
    goto LABEL_5;
  }
  v29.receiver = a1;
  v29.super_class = (Class)BADownloadManager;
  id v4 = objc_msgSendSuper2(&v29, sel_init);
  if (!v4) {
    goto LABEL_5;
  }
  if (v3)
  {
    +[BADownloadManager _enforceCallerConformsToRequirements]();
    *((_DWORD *)v4 + 2) = 0;
    objc_storeWeak((id *)v4 + 2, 0);
    dispatch_queue_t v5 = dispatch_queue_create("com.apple.backgroundassets.BADownloadManager.CallbackQueue", 0);
    objc_setProperty_atomic(v4, v6, v5, 40);

    dispatch_queue_t v7 = dispatch_queue_create("com.apple.backgroundassets.BADownloadManager.Completion", 0);
    objc_setProperty_atomic(v4, v8, v7, 48);

    objc_setProperty_atomic(v4, v9, v3, 64);
    id v10 = objc_alloc_init(MEMORY[0x263EFF9A0]);
    objc_setProperty_atomic(v4, v11, v10, 72);

    v12 = [BAAgentClientProxy alloc];
    id Property = objc_getProperty(v4, v13, 64, 1);
    v15 = -[BAAgentClientProxy initWithApplicationIdentifier:downloadManager:]((id *)&v12->super.isa, Property, v4);
    objc_setProperty_atomic(v4, v16, v15, 56);

    v18 = (id *)objc_getProperty(v4, v17, 56, 1);
    v27[0] = MEMORY[0x263EF8330];
    v27[1] = 3221225472;
    v27[2] = __51__BADownloadManager_initWithApplicationIdentifier___block_invoke;
    v27[3] = &unk_2647E8F38;
    id v28 = v4;
    -[BAAgentClientProxy currentDownloadsWithCompletion:](v18, v27);

LABEL_5:
    return;
  }
  BOOL v19 = os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_FAULT);
  if (v19) {
    -[BADownloadManager initWithApplicationIdentifier:](v19, v20, v21, v22, v23, v24, v25, v26);
  }
  qword_26815EF58 = (uint64_t)"BUG IN CLIENT OF BackgroundAssets: BADownloadManager requires the app and extension to have"
                             " a valid bundle identifier";
  __break(1u);
}

+ (void)_enforceCallerConformsToRequirements
{
}

- (BADownloadManager)init
{
  result = (BADownloadManager *)os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_FAULT);
  if (result)
  {
    int v3 = 136315138;
    id v4 = "BADownloadManager cannot be constructed using -init.";
    _os_log_fault_impl(&dword_226E14000, &_os_log_internal, OS_LOG_TYPE_FAULT, "BUG IN CLIENT OF BackgroundAssets: %s", (uint8_t *)&v3, 0xCu);
  }
  qword_26815EF58 = (uint64_t)"BUG IN CLIENT OF BackgroundAssets: BADownloadManager cannot be constructed using -init.";
  __break(1u);
  return result;
}

void __51__BADownloadManager_initWithApplicationIdentifier___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  id v3 = a2;
  os_unfair_lock_lock((os_unfair_lock_t)(*(void *)(a1 + 32) + 8));
  id Property = *(id *)(a1 + 32);
  if (Property) {
    id Property = objc_getProperty(Property, v4, 72, 1);
  }
  [Property removeAllObjects];
  long long v18 = 0u;
  long long v19 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v6 = v3;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v7)
  {
    uint64_t v9 = v7;
    uint64_t v10 = *(void *)v17;
    do
    {
      uint64_t v11 = 0;
      do
      {
        if (*(void *)v17 != v10) {
          objc_enumerationMutation(v6);
        }
        v12 = *(void **)(*((void *)&v16 + 1) + 8 * v11);
        id v13 = *(id *)(a1 + 32);
        if (v13) {
          id v13 = objc_getProperty(v13, v8, 72, 1);
        }
        id v14 = v13;
        v15 = objc_msgSend(v12, "uniqueIdentifier", (void)v16);
        [v14 setObject:v12 forKey:v15];

        ++v11;
      }
      while (v9 != v11);
      uint64_t v9 = [v6 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v9);
  }

  os_unfair_lock_unlock((os_unfair_lock_t)(*(void *)(a1 + 32) + 8));
}

- (BOOL)scheduleDownload:(BADownload *)download error:(NSError *)error
{
  uint64_t v7 = download;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    BOOL v15 = os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_FAULT);
    if (v15) {
      -[BADownloadManager scheduleDownload:error:](v15, v16, v17, v18, v19, v20, v21, v22);
    }
    __break(1u);
    goto LABEL_14;
  }
  if ([(BADownload *)v7 necessity] == 1)
  {
LABEL_14:
    BOOL v23 = os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_FAULT);
    if (v23) {
      -[BADownloadManager scheduleDownload:error:](v23, v24, v25, v26, v27, v28, v29, v30);
    }
    __break(1u);
    goto LABEL_17;
  }
  if (!self)
  {
LABEL_17:
    id Property = 0;
    goto LABEL_6;
  }
  if (self->_scheduleLocked)
  {
    BOOL v31 = os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_FAULT);
    if (v31) {
      -[BADownloadManager scheduleDownload:error:](v31, v32, v33, v34, v35, v36, v37, v38);
    }
                               "s method context.";
    __break(1u);
    goto LABEL_21;
  }
  id Property = (id *)objc_getProperty(self, v8, 56, 1);
LABEL_6:
  LODWORD(error) = -[BAAgentClientProxy scheduleDownload:error:](Property, v7, error);
  if (error)
  {
    p_stateLock = &self->_stateLock;
    os_unfair_lock_lock(&self->_stateLock);
    if (self)
    {
      id v11 = objc_getProperty(self, v10, 72, 1);
LABEL_9:
      id v12 = v11;
      id v13 = [(BADownload *)v7 uniqueIdentifier];
      [v12 setObject:v7 forKey:v13];

      os_unfair_lock_unlock(p_stateLock);
      goto LABEL_10;
    }
LABEL_21:
    id v11 = 0;
    goto LABEL_9;
  }
LABEL_10:

  return (char)error;
}

- (void)performWithExclusiveControl:(void *)performHandler
{
  uint64_t v34 = *MEMORY[0x263EF8340];
  id v4 = performHandler;
  if (!v4)
  {
    BOOL v19 = os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_FAULT);
    if (v19) {
      -[BADownloadManager performWithExclusiveControl:](v19, v20, v21, v22, v23, v24, v25, v26);
    }
    qword_26815EF58 = (uint64_t)"BUG IN CLIENT OF BackgroundAssets: Calling 'performWithExclusiveControl' must be called w"
                               "ith a valid performHandler.";
    __break(1u);
  }
  dispatch_queue_t v5 = v4;
  uint64_t v7 = -[BADownloadManager extensionConnection]((uint64_t)self);
  if (v7)
  {
    SEL v8 = BAClientLogObject();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      if (self) {
        id Property = objc_getProperty(self, v9, 64, 1);
      }
      else {
        id Property = 0;
      }
      *(_DWORD *)buf = 138543362;
      id v33 = Property;
      _os_log_impl(&dword_226E14000, v8, OS_LOG_TYPE_INFO, "Acquiring exclusive control extension wake assertion for: %{public}@", buf, 0xCu);
    }

    id v11 = -[BADownloadManager extensionConnection]((uint64_t)self);
    id v12 = [v11 acquireWakeAssertion];

    if (self) {
      id v14 = (id *)objc_getProperty(self, v13, 56, 1);
    }
    else {
      id v14 = 0;
    }
    v29[0] = MEMORY[0x263EF8330];
    v29[1] = 3221225472;
    v29[2] = __49__BADownloadManager_performWithExclusiveControl___block_invoke;
    v29[3] = &unk_2647E8F88;
    v29[4] = self;
    id v30 = v5;
    id v31 = v12;
    id v15 = v12;
    id v16 = v5;
    -[BAAgentClientProxy acquireExclusiveControlWithHandler:](v14, v29);
  }
  else
  {
    if (self) {
      uint64_t v17 = (id *)objc_getProperty(self, v6, 56, 1);
    }
    else {
      uint64_t v17 = 0;
    }
    v27[0] = MEMORY[0x263EF8330];
    v27[1] = 3221225472;
    v27[2] = __49__BADownloadManager_performWithExclusiveControl___block_invoke_43;
    v27[3] = &unk_2647E8FB0;
    void v27[4] = self;
    id v28 = v5;
    id v18 = v5;
    -[BAAgentClientProxy acquireExclusiveControlWithHandler:](v17, v27);
  }
}

void __49__BADownloadManager_performWithExclusiveControl___block_invoke(uint64_t a1, char a2, void *a3)
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v6 = a3;
  uint64_t v7 = *(void **)(a1 + 32);
  if (v7) {
    id Property = objc_getProperty(v7, v5, 48, 1);
  }
  else {
    id Property = 0;
  }
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __49__BADownloadManager_performWithExclusiveControl___block_invoke_2;
  block[3] = &unk_2647E8F60;
  id v15 = *(id *)(a1 + 40);
  char v16 = a2;
  id v9 = v6;
  id v14 = v9;
  dispatch_sync(Property, block);
  uint64_t v10 = BAClientLogObject();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    id v12 = *(id *)(a1 + 32);
    if (v12) {
      id v12 = objc_getProperty(v12, v11, 64, 1);
    }
    *(_DWORD *)buf = 138543362;
    id v18 = v12;
    _os_log_impl(&dword_226E14000, v10, OS_LOG_TYPE_INFO, "Releasing exclusive control extension wake assertion for: %{public}@", buf, 0xCu);
  }

  (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
}

uint64_t __49__BADownloadManager_performWithExclusiveControl___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(unsigned __int8 *)(a1 + 48), *(void *)(a1 + 32));
}

void __49__BADownloadManager_performWithExclusiveControl___block_invoke_43(uint64_t a1, char a2, void *a3)
{
  id v6 = a3;
  uint64_t v7 = *(void **)(a1 + 32);
  if (v7) {
    id Property = objc_getProperty(v7, v5, 48, 1);
  }
  else {
    id Property = 0;
  }
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __49__BADownloadManager_performWithExclusiveControl___block_invoke_2_44;
  block[3] = &unk_2647E8F60;
  id v9 = *(id *)(a1 + 40);
  char v14 = a2;
  id v12 = v6;
  id v13 = v9;
  id v10 = v6;
  dispatch_sync(Property, block);
}

uint64_t __49__BADownloadManager_performWithExclusiveControl___block_invoke_2_44(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(unsigned __int8 *)(a1 + 48), *(void *)(a1 + 32));
}

- (void)performWithExclusiveControlBeforeDate:(NSDate *)date performHandler:(void *)performHandler
{
  uint64_t v45 = *MEMORY[0x263EF8340];
  id v6 = date;
  uint64_t v7 = performHandler;
  if (!v7)
  {
    BOOL v22 = os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_FAULT);
    if (v22) {
      -[BADownloadManager performWithExclusiveControlBeforeDate:performHandler:](v22, v23, v24, v25, v26, v27, v28, v29);
    }
    qword_26815EF58 = (uint64_t)"BUG IN CLIENT OF BackgroundAssets: Calling 'performWithExclusiveControlBeforeDate' must b"
                               "e called with a valid performHandler.";
    __break(1u);
LABEL_18:
    BOOL v30 = os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_FAULT);
    if (v30) {
      -[BADownloadManager performWithExclusiveControlBeforeDate:performHandler:](v30, v31, v32, v33, v34, v35, v36, v37);
    }
    qword_26815EF58 = (uint64_t)"BUG IN CLIENT OF BackgroundAssets: Calling 'performWithExclusiveControlBeforeDate' must b"
                               "e called with a valid date.";
    __break(1u);
  }
  SEL v8 = v7;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    goto LABEL_18;
  }
  id v10 = -[BADownloadManager extensionConnection]((uint64_t)self);
  if (v10)
  {
    id v11 = BAClientLogObject();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      if (self) {
        id Property = objc_getProperty(self, v12, 64, 1);
      }
      else {
        id Property = 0;
      }
      *(_DWORD *)buf = 138543362;
      id v44 = Property;
      _os_log_impl(&dword_226E14000, v11, OS_LOG_TYPE_INFO, "Acquiring exclusive control extension wake assertion for: %{public}@", buf, 0xCu);
    }

    char v14 = -[BADownloadManager extensionConnection]((uint64_t)self);
    id v15 = [v14 acquireWakeAssertion];

    if (self) {
      uint64_t v17 = (id *)objc_getProperty(self, v16, 56, 1);
    }
    else {
      uint64_t v17 = 0;
    }
    v40[0] = MEMORY[0x263EF8330];
    v40[1] = 3221225472;
    v40[2] = __74__BADownloadManager_performWithExclusiveControlBeforeDate_performHandler___block_invoke;
    v40[3] = &unk_2647E8F88;
    v40[4] = self;
    id v41 = v8;
    id v42 = v15;
    id v18 = v15;
    id v19 = v8;
    -[BAAgentClientProxy acquireExclusiveControlBeforeDate:handler:](v17, v6, v40);
  }
  else
  {
    if (self) {
      uint64_t v20 = (id *)objc_getProperty(self, v9, 56, 1);
    }
    else {
      uint64_t v20 = 0;
    }
    v38[0] = MEMORY[0x263EF8330];
    v38[1] = 3221225472;
    v38[2] = __74__BADownloadManager_performWithExclusiveControlBeforeDate_performHandler___block_invoke_50;
    v38[3] = &unk_2647E8FB0;
    v38[4] = self;
    id v39 = v8;
    id v21 = v8;
    -[BAAgentClientProxy acquireExclusiveControlBeforeDate:handler:](v20, v6, v38);
  }
}

void __74__BADownloadManager_performWithExclusiveControlBeforeDate_performHandler___block_invoke(uint64_t a1, char a2, void *a3)
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v6 = a3;
  uint64_t v7 = *(void **)(a1 + 32);
  if (v7) {
    id Property = objc_getProperty(v7, v5, 48, 1);
  }
  else {
    id Property = 0;
  }
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __74__BADownloadManager_performWithExclusiveControlBeforeDate_performHandler___block_invoke_2;
  block[3] = &unk_2647E8F60;
  id v15 = *(id *)(a1 + 40);
  char v16 = a2;
  id v9 = v6;
  id v14 = v9;
  dispatch_sync(Property, block);
  id v10 = BAClientLogObject();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    id v12 = *(id *)(a1 + 32);
    if (v12) {
      id v12 = objc_getProperty(v12, v11, 64, 1);
    }
    *(_DWORD *)buf = 138543362;
    id v18 = v12;
    _os_log_impl(&dword_226E14000, v10, OS_LOG_TYPE_INFO, "Releasing exclusive control extension wake assertion for: %{public}@", buf, 0xCu);
  }

  (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
}

uint64_t __74__BADownloadManager_performWithExclusiveControlBeforeDate_performHandler___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(unsigned __int8 *)(a1 + 48), *(void *)(a1 + 32));
}

void __74__BADownloadManager_performWithExclusiveControlBeforeDate_performHandler___block_invoke_50(uint64_t a1, char a2, void *a3)
{
  id v6 = a3;
  uint64_t v7 = *(void **)(a1 + 32);
  if (v7) {
    id Property = objc_getProperty(v7, v5, 48, 1);
  }
  else {
    id Property = 0;
  }
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __74__BADownloadManager_performWithExclusiveControlBeforeDate_performHandler___block_invoke_2_51;
  block[3] = &unk_2647E8F60;
  id v9 = *(id *)(a1 + 40);
  char v14 = a2;
  id v12 = v6;
  id v13 = v9;
  id v10 = v6;
  dispatch_sync(Property, block);
}

uint64_t __74__BADownloadManager_performWithExclusiveControlBeforeDate_performHandler___block_invoke_2_51(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(unsigned __int8 *)(a1 + 48), *(void *)(a1 + 32));
}

- (BOOL)startForegroundDownload:(BADownload *)download error:(NSError *)error
{
  id v6 = download;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    BOOL v11 = os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_FAULT);
    if (v11) {
      -[BADownloadManager startForegroundDownload:error:](v11, v12, v13, v14, v15, v16, v17, v18);
    }
    __break(1u);
    goto LABEL_10;
  }
  if ([(BADownload *)v6 necessity] == 1)
  {
LABEL_10:
    BOOL v19 = os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_FAULT);
    if (v19) {
      -[BADownloadManager startForegroundDownload:error:](v19, v20, v21, v22, v23, v24, v25, v26);
    }
                               " in Swift) first.";
    __break(1u);
    goto LABEL_13;
  }
  if (!self)
  {
LABEL_13:
    id Property = 0;
    goto LABEL_6;
  }
  if (!self->_scheduleLocked)
  {
    id Property = (id *)objc_getProperty(self, v7, 56, 1);
LABEL_6:
    BOOL v9 = -[BAAgentClientProxy startForegroundDownload:error:](Property, v6, error);

    LOBYTE(v10) = v9;
    return v10;
  }
  BOOL v10 = os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_FAULT);
  if (v10) {
    -[BADownloadManager startForegroundDownload:error:](v10, v27, v28, v29, v30, v31, v32, v33);
  }
  __break(1u);
  return v10;
}

- (BOOL)cancelDownload:(BADownload *)download error:(NSError *)error
{
  id v6 = download;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    BOOL v11 = os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_FAULT);
    if (v11) {
      -[BADownloadManager cancelDownload:error:](v11, v12, v13, v14, v15, v16, v17, v18);
    }
    __break(1u);
    goto LABEL_8;
  }
  if (!self)
  {
LABEL_8:
    id Property = 0;
    goto LABEL_4;
  }
  id Property = (id *)objc_getProperty(self, v7, 56, 1);
LABEL_4:
  BOOL v9 = -[BAAgentClientProxy cancelDownload:error:](Property, v6, error);

  return v9;
}

- (NSArray)fetchCurrentDownloads:(NSError *)error
{
  if (self) {
    self = (BADownloadManager *)objc_getProperty(self, a2, 56, 1);
  }

  return (NSArray *)-[BAAgentClientProxy currentDownloads:]((id *)&self->super.isa, (char *)error);
}

- (void)fetchCurrentDownloadsWithCompletionHandler:(void *)completionHandler
{
  dispatch_queue_t v5 = completionHandler;
  if (self) {
    id Property = (id *)objc_getProperty(self, v4, 56, 1);
  }
  else {
    id Property = 0;
  }
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __64__BADownloadManager_fetchCurrentDownloadsWithCompletionHandler___block_invoke;
  v8[3] = &unk_2647E8FD8;
  v8[4] = self;
  id v9 = v5;
  id v7 = v5;
  -[BAAgentClientProxy currentDownloadsWithCompletion:](Property, v8);
}

void __64__BADownloadManager_fetchCurrentDownloadsWithCompletionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v7 = a3;
  SEL v8 = *(void **)(a1 + 32);
  if (v8) {
    id Property = objc_getProperty(v8, v6, 48, 1);
  }
  else {
    id Property = 0;
  }
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __64__BADownloadManager_fetchCurrentDownloadsWithCompletionHandler___block_invoke_2;
  block[3] = &unk_2647E8EB8;
  id v10 = *(id *)(a1 + 40);
  id v15 = v7;
  id v16 = v10;
  id v14 = v5;
  id v11 = v7;
  id v12 = v5;
  dispatch_async(Property, block);
}

uint64_t __64__BADownloadManager_fetchCurrentDownloadsWithCompletionHandler___block_invoke_2(void *a1)
{
  return (*(uint64_t (**)(void, void, void))(a1[6] + 16))(a1[6], a1[4], a1[5]);
}

- (id)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return WeakRetained;
}

- (void)setDelegate:(id)delegate
{
}

- (uint64_t)setScheduleLocked:(uint64_t)result
{
  if (result) {
    *(unsigned char *)(result + 24) = a2;
  }
  return result;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_downloads, 0);
  objc_storeStrong((id *)&self->_applicationIdentifier, 0);
  objc_storeStrong((id *)&self->_proxy, 0);
  objc_storeStrong((id *)&self->_completionHandlerQueue, 0);
  objc_storeStrong((id *)&self->_delegateCallbackQueue, 0);
  objc_destroyWeak((id *)&self->_delegate);

  objc_destroyWeak((id *)&self->_extensionConnection);
}

- (void)syncDownloads:(id)a3
{
  uint64_t v26 = *MEMORY[0x263EF8340];
  id v4 = a3;
  os_unfair_lock_lock(&self->_stateLock);
  long long v23 = 0u;
  long long v24 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  id v5 = v4;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v21 objects:v25 count:16];
  if (v6)
  {
    uint64_t v8 = v6;
    uint64_t v9 = *(void *)v22;
    do
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v22 != v9) {
          objc_enumerationMutation(v5);
        }
        id v11 = *(void **)(*((void *)&v21 + 1) + 8 * v10);
        if (self) {
          id Property = objc_getProperty(self, v7, 72, 1);
        }
        else {
          id Property = 0;
        }
        id v13 = Property;
        id v14 = objc_msgSend(v11, "uniqueIdentifier", (void)v21);
        id v15 = [v13 objectForKey:v14];

        if (v15)
        {
          [v15 syncTo:v11];
        }
        else
        {
          if (self) {
            id v17 = objc_getProperty(self, v16, 72, 1);
          }
          else {
            id v17 = 0;
          }
          id v18 = v17;
          BOOL v19 = [v11 uniqueIdentifier];
          [v18 setObject:v11 forKey:v19];
        }
        ++v10;
      }
      while (v8 != v10);
      uint64_t v20 = [v5 countByEnumeratingWithState:&v21 objects:v25 count:16];
      uint64_t v8 = v20;
    }
    while (v20);
  }

  os_unfair_lock_unlock(&self->_stateLock);
}

- (void)downloadIdentifierDidBegin:(id)a3
{
  id v4 = a3;
  os_unfair_lock_lock(&self->_stateLock);
  if (self) {
    id Property = objc_getProperty(self, v5, 72, 1);
  }
  else {
    id Property = 0;
  }
  id v7 = [Property objectForKey:v4];
  os_unfair_lock_unlock(&self->_stateLock);
  if (v7)
  {
    uint64_t v8 = [(BADownloadManager *)self delegate];
    if (v8)
    {
      uint64_t v9 = (void *)v8;
      uint64_t v10 = [(BADownloadManager *)self delegate];
      char v11 = objc_opt_respondsToSelector();

      if (v11)
      {
        if (self) {
          id v13 = objc_getProperty(self, v12, 40, 1);
        }
        else {
          id v13 = 0;
        }
        v14[0] = MEMORY[0x263EF8330];
        v14[1] = 3221225472;
        v14[2] = __65__BADownloadManager_XPCDownloadSync__downloadIdentifierDidBegin___block_invoke;
        v14[3] = &unk_2647E9000;
        v14[4] = self;
        id v15 = v7;
        dispatch_async(v13, v14);
      }
    }
  }
}

void __65__BADownloadManager_XPCDownloadSync__downloadIdentifierDidBegin___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) delegate];
  [v2 downloadDidBegin:*(void *)(a1 + 40)];
}

- (void)downloadIdentifierDidPause:(id)a3
{
  id v4 = a3;
  os_unfair_lock_lock(&self->_stateLock);
  if (self) {
    id Property = objc_getProperty(self, v5, 72, 1);
  }
  else {
    id Property = 0;
  }
  id v7 = [Property objectForKey:v4];
  os_unfair_lock_unlock(&self->_stateLock);
  if (v7)
  {
    uint64_t v8 = [(BADownloadManager *)self delegate];
    if (v8)
    {
      uint64_t v9 = (void *)v8;
      uint64_t v10 = [(BADownloadManager *)self delegate];
      char v11 = objc_opt_respondsToSelector();

      if (v11)
      {
        if (self) {
          id v13 = objc_getProperty(self, v12, 40, 1);
        }
        else {
          id v13 = 0;
        }
        v14[0] = MEMORY[0x263EF8330];
        v14[1] = 3221225472;
        v14[2] = __65__BADownloadManager_XPCDownloadSync__downloadIdentifierDidPause___block_invoke;
        v14[3] = &unk_2647E9000;
        v14[4] = self;
        id v15 = v7;
        dispatch_async(v13, v14);
      }
    }
  }
}

void __65__BADownloadManager_XPCDownloadSync__downloadIdentifierDidPause___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) delegate];
  [v2 downloadDidPause:*(void *)(a1 + 40)];
}

- (void)downloadIdentifier:(id)a3 didWriteBytes:(int64_t)a4 totalBytesWritten:(int64_t)a5 totalBytesExpectedToWrite:(int64_t)a6
{
  id v18 = a3;
  os_unfair_lock_lock(&self->_stateLock);
  if (self) {
    id Property = objc_getProperty(self, v10, 72, 1);
  }
  else {
    id Property = 0;
  }
  id v12 = [Property objectForKey:v18];
  os_unfair_lock_unlock(&self->_stateLock);
  if (v12)
  {
    uint64_t v13 = [(BADownloadManager *)self delegate];
    if (v13)
    {
      id v14 = (void *)v13;
      id v15 = [(BADownloadManager *)self delegate];
      char v16 = objc_opt_respondsToSelector();

      if (v16)
      {
        id v17 = [(BADownloadManager *)self delegate];
        [v17 download:v12 didWriteBytes:a4 totalBytesWritten:a5 totalBytesExpectedToWrite:a6];
      }
    }
  }
}

- (void)downloadIdentifier:(id)a3 didReceiveChallenge:(id)a4 authChallengeHandler:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  os_unfair_lock_lock(&self->_stateLock);
  if (self) {
    id Property = objc_getProperty(self, v11, 72, 1);
  }
  else {
    id Property = 0;
  }
  uint64_t v13 = [Property objectForKey:v8];
  os_unfair_lock_unlock(&self->_stateLock);
  if (v13)
  {
    uint64_t v14 = [(BADownloadManager *)self delegate];
    if (v14
      && (id v15 = (void *)v14,
          [(BADownloadManager *)self delegate],
          char v16 = objc_claimAutoreleasedReturnValue(),
          char v17 = objc_opt_respondsToSelector(),
          v16,
          v15,
          (v17 & 1) != 0))
    {
      if (self) {
        BOOL v19 = objc_getProperty(self, v18, 40, 1);
      }
      else {
        BOOL v19 = 0;
      }
      v20[0] = MEMORY[0x263EF8330];
      v20[1] = 3221225472;
      v20[2] = __98__BADownloadManager_XPCDownloadSync__downloadIdentifier_didReceiveChallenge_authChallengeHandler___block_invoke;
      v20[3] = &unk_2647E8BE8;
      v20[4] = self;
      id v21 = v13;
      id v22 = v9;
      id v23 = v10;
      dispatch_async(v19, v20);
    }
    else
    {
      (*((void (**)(id, uint64_t, void))v10 + 2))(v10, 1, 0);
    }
  }
  else
  {
    (*((void (**)(id, uint64_t, void))v10 + 2))(v10, 2, 0);
  }
}

void __98__BADownloadManager_XPCDownloadSync__downloadIdentifier_didReceiveChallenge_authChallengeHandler___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) delegate];
  [v2 download:*(void *)(a1 + 40) didReceiveChallenge:*(void *)(a1 + 48) completionHandler:*(void *)(a1 + 56)];
}

- (void)downloadIdentifier:(id)a3 didFailWithError:(id)a4 wasHandled:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = (void (**)(id, uint64_t))a5;
  os_unfair_lock_lock(&self->_stateLock);
  if (self) {
    id Property = objc_getProperty(self, v11, 72, 1);
  }
  else {
    id Property = 0;
  }
  uint64_t v13 = [Property objectForKey:v8];
  os_unfair_lock_unlock(&self->_stateLock);
  if (!v13) {
    goto LABEL_9;
  }
  uint64_t v14 = [(BADownloadManager *)self delegate];
  if (!v14) {
    goto LABEL_9;
  }
  id v15 = (void *)v14;
  char v16 = [(BADownloadManager *)self delegate];
  char v17 = objc_opt_respondsToSelector();

  if (v17)
  {
    if (self) {
      BOOL v19 = objc_getProperty(self, v18, 40, 1);
    }
    else {
      BOOL v19 = 0;
    }
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __85__BADownloadManager_XPCDownloadSync__downloadIdentifier_didFailWithError_wasHandled___block_invoke;
    block[3] = &unk_2647E9028;
    void block[4] = self;
    id v22 = v13;
    id v23 = v9;
    dispatch_async(v19, block);

    uint64_t v20 = 1;
  }
  else
  {
LABEL_9:
    uint64_t v20 = 0;
  }
  v10[2](v10, v20);
}

void __85__BADownloadManager_XPCDownloadSync__downloadIdentifier_didFailWithError_wasHandled___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) delegate];
  [v2 download:*(void *)(a1 + 40) failedWithError:*(void *)(a1 + 48)];
}

- (void)downloadIdentifierDidFinish:(id)a3 sandboxExtensionToken:(id)a4 wasHandled:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = (void (**)(id, void))a5;
  os_unfair_lock_lock(&self->_stateLock);
  if (self) {
    id Property = objc_getProperty(self, v11, 72, 1);
  }
  else {
    id Property = 0;
  }
  uint64_t v13 = [Property objectForKey:v8];
  os_unfair_lock_unlock(&self->_stateLock);
  if (!v13)
  {
    uint64_t v28 = BASystemLogObject();
    if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR)) {
      -[BADownloadManager(XPCDownloadSync) downloadIdentifierDidFinish:sandboxExtensionToken:wasHandled:](v28, v29, v30, v31, v32, v33, v34, v35);
    }

    goto LABEL_33;
  }
  if (!v9)
  {
    uint64_t v36 = BASystemLogObject();
    if (os_log_type_enabled(v36, OS_LOG_TYPE_ERROR)) {
      -[BADownloadManager(XPCDownloadSync) downloadIdentifierDidFinish:sandboxExtensionToken:wasHandled:](v36, v37, v38, v39, v40, v41, v42, v43);
    }

    uint64_t v44 = [(BADownloadManager *)self delegate];
    if (!v44) {
      goto LABEL_33;
    }
    uint64_t v45 = (void *)v44;
    v46 = [(BADownloadManager *)self delegate];
    char v47 = objc_opt_respondsToSelector();

    if ((v47 & 1) == 0) {
      goto LABEL_33;
    }
    if (self) {
      v49 = objc_getProperty(self, v48, 40, 1);
    }
    else {
      v49 = 0;
    }
    v104[0] = MEMORY[0x263EF8330];
    v104[1] = 3221225472;
    v104[2] = __99__BADownloadManager_XPCDownloadSync__downloadIdentifierDidFinish_sandboxExtensionToken_wasHandled___block_invoke;
    v104[3] = &unk_2647E9000;
    v104[4] = self;
    id v105 = v13;
    dispatch_async(v49, v104);
    v50 = v105;
    goto LABEL_32;
  }
  [v9 UTF8String];
  if (sandbox_extension_consume() == -1)
  {
    v51 = BASystemLogObject();
    if (os_log_type_enabled(v51, OS_LOG_TYPE_ERROR)) {
      -[BADownloadManager(XPCDownloadSync) downloadIdentifierDidFinish:sandboxExtensionToken:wasHandled:](v51, v52, v53, v54, v55, v56, v57, v58);
    }

    uint64_t v59 = [(BADownloadManager *)self delegate];
    if (!v59) {
      goto LABEL_33;
    }
    v60 = (void *)v59;
    v61 = [(BADownloadManager *)self delegate];
    char v62 = objc_opt_respondsToSelector();

    if ((v62 & 1) == 0) {
      goto LABEL_33;
    }
    if (self) {
      v64 = objc_getProperty(self, v63, 40, 1);
    }
    else {
      v64 = 0;
    }
    v102[0] = MEMORY[0x263EF8330];
    v102[1] = 3221225472;
    v102[2] = __99__BADownloadManager_XPCDownloadSync__downloadIdentifierDidFinish_sandboxExtensionToken_wasHandled___block_invoke_110;
    v102[3] = &unk_2647E9000;
    v102[4] = self;
    id v103 = v13;
    dispatch_async(v64, v102);
    v50 = v103;
LABEL_32:

LABEL_33:
    v10[2](v10, 0);
    goto LABEL_60;
  }
  id v100 = 0;
  id v101 = 0;
  char v14 = [v13 cloneDownloadToFinalDestinationURL:&v101 error:&v100];
  id v15 = v101;
  id v17 = v100;
  if (v14)
  {
    if (self) {
      id v18 = (id *)objc_getProperty(self, v16, 56, 1);
    }
    else {
      id v18 = 0;
    }
    id v96 = v17;
    v85 = v15;
    BOOL v19 = -[BAAgentClientProxy markPurgeableWithFileURL:error:](v18, v15, &v96);
    id v20 = v96;

    if (v19)
    {
      uint64_t v21 = [(BADownloadManager *)self delegate];
      if (v21
        && (id v23 = (void *)v21,
            [(BADownloadManager *)self delegate],
            long long v24 = objc_claimAutoreleasedReturnValue(),
            char v25 = objc_opt_respondsToSelector(),
            v24,
            v23,
            (v25 & 1) != 0))
      {
        id v15 = v85;
        if (self) {
          uint64_t v26 = objc_getProperty(self, v22, 40, 1);
        }
        else {
          uint64_t v26 = 0;
        }
        block[0] = MEMORY[0x263EF8330];
        block[1] = 3221225472;
        block[2] = __99__BADownloadManager_XPCDownloadSync__downloadIdentifierDidFinish_sandboxExtensionToken_wasHandled___block_invoke_2;
        block[3] = &unk_2647E9028;
        void block[4] = self;
        id v90 = v13;
        id v91 = v85;
        dispatch_async(v26, block);

        uint64_t v27 = 1;
      }
      else
      {
        uint64_t v27 = 0;
        id v15 = v85;
      }
      if (self) {
        self = (BADownloadManager *)objc_getProperty(self, v22, 40, 1);
      }
      v86[0] = MEMORY[0x263EF8330];
      v86[1] = 3221225472;
      v86[2] = __99__BADownloadManager_XPCDownloadSync__downloadIdentifierDidFinish_sandboxExtensionToken_wasHandled___block_invoke_3;
      v86[3] = &unk_2647E9000;
      id v87 = v15;
      id v88 = v13;
      dispatch_async(&self->super, v86);
    }
    else
    {
      v73 = BAClientLogObject();
      if (os_log_type_enabled(v73, OS_LOG_TYPE_ERROR)) {
        -[BADownloadManager(XPCDownloadSync) downloadIdentifierDidFinish:sandboxExtensionToken:wasHandled:].cold.5();
      }

      -[BADownload setInternalState:](v13, -1);
      v74 = [MEMORY[0x263F08850] defaultManager];
      id v95 = 0;
      char v75 = [v74 removeItemAtURL:v85 error:&v95];
      id v76 = v95;

      if ((v75 & 1) == 0)
      {
        v77 = BAClientLogObject();
        if (os_log_type_enabled(v77, OS_LOG_TYPE_ERROR)) {
          -[BADownloadManager(XPCDownloadSync) downloadIdentifierDidFinish:sandboxExtensionToken:wasHandled:].cold.4();
        }
      }
      uint64_t v78 = [(BADownloadManager *)self delegate];
      if (v78)
      {
        v79 = (void *)v78;
        v80 = [(BADownloadManager *)self delegate];
        char v81 = objc_opt_respondsToSelector();

        if (v81)
        {
          if (self) {
            v83 = objc_getProperty(self, v82, 40, 1);
          }
          else {
            v83 = 0;
          }
          v92[0] = MEMORY[0x263EF8330];
          v92[1] = 3221225472;
          v92[2] = __99__BADownloadManager_XPCDownloadSync__downloadIdentifierDidFinish_sandboxExtensionToken_wasHandled___block_invoke_113;
          v92[3] = &unk_2647E9028;
          v92[4] = self;
          id v93 = v13;
          id v94 = v20;
          dispatch_async(v83, v92);
        }
      }

      uint64_t v27 = 0;
      id v15 = v85;
    }
  }
  else
  {
    v65 = BAClientLogObject();
    if (os_log_type_enabled(v65, OS_LOG_TYPE_ERROR)) {
      -[BADownloadManager(XPCDownloadSync) downloadIdentifierDidFinish:sandboxExtensionToken:wasHandled:].cold.6();
    }

    -[BADownload setInternalState:](v13, -1);
    uint64_t v66 = [(BADownloadManager *)self delegate];
    if (v66)
    {
      v67 = (void *)v66;
      id v68 = v15;
      v69 = [(BADownloadManager *)self delegate];
      char v70 = objc_opt_respondsToSelector();

      if (v70)
      {
        if (self) {
          v72 = objc_getProperty(self, v71, 40, 1);
        }
        else {
          v72 = 0;
        }
        id v15 = v68;
        v97[0] = MEMORY[0x263EF8330];
        v97[1] = 3221225472;
        v97[2] = __99__BADownloadManager_XPCDownloadSync__downloadIdentifierDidFinish_sandboxExtensionToken_wasHandled___block_invoke_111;
        v97[3] = &unk_2647E9028;
        v97[4] = self;
        id v98 = v13;
        id v20 = v17;
        id v99 = v20;
        dispatch_async(v72, v97);

        uint64_t v27 = 0;
      }
      else
      {
        uint64_t v27 = 0;
        id v20 = v17;
        id v15 = v68;
      }
    }
    else
    {
      uint64_t v27 = 0;
      id v20 = v17;
    }
  }
  sandbox_extension_release();
  v10[2](v10, v27);

LABEL_60:
}

void __99__BADownloadManager_XPCDownloadSync__downloadIdentifierDidFinish_sandboxExtensionToken_wasHandled___block_invoke(uint64_t a1)
{
  NSErrorWithBAErrorCode(-108);
  id v3 = (id)objc_claimAutoreleasedReturnValue();
  id v2 = [*(id *)(a1 + 32) delegate];
  [v2 download:*(void *)(a1 + 40) failedWithError:v3];
}

void __99__BADownloadManager_XPCDownloadSync__downloadIdentifierDidFinish_sandboxExtensionToken_wasHandled___block_invoke_110(uint64_t a1)
{
  NSErrorWithBAErrorCode(-108);
  id v3 = (id)objc_claimAutoreleasedReturnValue();
  id v2 = [*(id *)(a1 + 32) delegate];
  [v2 download:*(void *)(a1 + 40) failedWithError:v3];
}

void __99__BADownloadManager_XPCDownloadSync__downloadIdentifierDidFinish_sandboxExtensionToken_wasHandled___block_invoke_111(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) delegate];
  [v2 download:*(void *)(a1 + 40) failedWithError:*(void *)(a1 + 48)];
}

void __99__BADownloadManager_XPCDownloadSync__downloadIdentifierDidFinish_sandboxExtensionToken_wasHandled___block_invoke_113(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) delegate];
  [v2 download:*(void *)(a1 + 40) failedWithError:*(void *)(a1 + 48)];
}

void __99__BADownloadManager_XPCDownloadSync__downloadIdentifierDidFinish_sandboxExtensionToken_wasHandled___block_invoke_2(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) delegate];
  [v2 download:*(void *)(a1 + 40) finishedWithFileURL:*(void *)(a1 + 48)];
}

void __99__BADownloadManager_XPCDownloadSync__downloadIdentifierDidFinish_sandboxExtensionToken_wasHandled___block_invoke_3(uint64_t a1)
{
  id v2 = [MEMORY[0x263F08850] defaultManager];
  id v3 = [*(id *)(a1 + 32) path];
  int v4 = [v2 fileExistsAtPath:v3];

  if (v4)
  {
    id v5 = [MEMORY[0x263F08850] defaultManager];
    uint64_t v6 = *(void *)(a1 + 32);
    id v10 = 0;
    char v7 = [v5 removeItemAtURL:v6 error:&v10];
    id v8 = v10;

    if ((v7 & 1) == 0)
    {
      id v9 = BAClientLogObject();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
        __99__BADownloadManager_XPCDownloadSync__downloadIdentifierDidFinish_sandboxExtensionToken_wasHandled___block_invoke_3_cold_1();
      }
    }
  }
}

- (void)removeDownloadIdentifier:(id)a3
{
  id v6 = a3;
  os_unfair_lock_lock(&self->_stateLock);
  if (self) {
    id Property = objc_getProperty(self, v4, 72, 1);
  }
  else {
    id Property = 0;
  }
  [Property removeObjectForKey:v6];
  os_unfair_lock_unlock(&self->_stateLock);
}

- (void)initWithApplicationIdentifier:(uint64_t)a3 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)scheduleDownload:(uint64_t)a3 error:(uint64_t)a4 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)scheduleDownload:(uint64_t)a3 error:(uint64_t)a4 .cold.2(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)scheduleDownload:(uint64_t)a3 error:(uint64_t)a4 .cold.3(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)performWithExclusiveControl:(uint64_t)a3 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)performWithExclusiveControlBeforeDate:(uint64_t)a3 performHandler:(uint64_t)a4 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)performWithExclusiveControlBeforeDate:(uint64_t)a3 performHandler:(uint64_t)a4 .cold.2(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)startForegroundDownload:(uint64_t)a3 error:(uint64_t)a4 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)startForegroundDownload:(uint64_t)a3 error:(uint64_t)a4 .cold.2(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)startForegroundDownload:(uint64_t)a3 error:(uint64_t)a4 .cold.3(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)cancelDownload:(uint64_t)a3 error:(uint64_t)a4 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void __99__BADownloadManager_XPCDownloadSync__downloadIdentifierDidFinish_sandboxExtensionToken_wasHandled___block_invoke_3_cold_1()
{
  OUTLINED_FUNCTION_3();
  [*(id *)(v1 + 40) identifier];
  objc_claimAutoreleasedReturnValue();
  id v2 = [(id)OUTLINED_FUNCTION_4() description];
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_226E14000, v3, v4, "Download %{public}@ failed to remove cloned file after the client serviced the download. Error:%{public}@", v5, v6, v7, v8, v9);
}

@end