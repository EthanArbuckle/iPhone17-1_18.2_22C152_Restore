@interface BRDaemonConnection
+ (id)cloudDocsAppSupportURL;
+ (id)cloudDocsAppSupportURLForPersonaID:(id)a3 needsPersonaSwitch:(BOOL)a4;
+ (id)cloudDocsCachesURL;
+ (id)cloudDocsCachesURLForPersonaID:(id)a3 needsPersonaSwitch:(BOOL)a4;
+ (id)defaultConnection;
+ (id)defaultConnectionForKey:(id)a3 initializer:(id)a4;
+ (id)defaultConnectionIfExists;
+ (id)defaultConnectionIfExistsForKey:(id)a3;
+ (id)homeDirectoryURL;
+ (id)homeDirectoryURLForPersonaID:(id)a3 needsPersonaSwitch:(BOOL)a4;
+ (id)mobileDocumentsURL;
+ (id)mobileDocumentsURLForPersonaID:(id)a3 needsPersonaSwitch:(BOOL)a4;
+ (id)secondaryConnection;
+ (id)secondaryConnectionForKey:(id)a3 initializer:(id)a4;
+ (id)secondaryConnectionIfExists;
+ (id)secondaryConnectionIfExistsForKey:(id)a3;
+ (id)syncedDesktopURL;
+ (id)syncedDesktopURLForPersonaID:(id)a3 needsPersonaSwitch:(BOOL)a4;
+ (id)syncedDocumentsURL;
+ (id)syncedDocumentsURLForPersonaID:(id)a3 needsPersonaSwitch:(BOOL)a4;
+ (id)syncedRootURLs;
+ (id)syncedRootURLsForPersonaID:(id)a3 needsPersonaSwitch:(BOOL)a4;
+ (void)clearURLCache;
+ (void)clearURLCacheForPersonaID:(id)a3;
+ (void)initialize;
+ (void)invalidateCachedURLProperties;
+ (void)invalidateCachedURLPropertiesForPersonaID:(id)a3;
- (id)initUsingUserLocalDaemon;
- (id)initUsingUserLocalDaemonTokenService;
- (id)newFPFSSyncProxy;
- (id)newLegacySyncProxy;
- (id)newSyncProxy;
- (id)newSyncTokenProxy;
- (void)_setupAndResumeForKey:(id)a3;
- (void)newFPFSSyncProxy;
- (void)newLegacySyncProxy;
- (void)newSyncProxy;
- (void)newSyncTokenProxy;
@end

@implementation BRDaemonConnection

+ (id)mobileDocumentsURL
{
  v3 = objc_msgSend(NSString, "br_currentPersonaIDWithIsDataSeparated:", 0);
  v4 = [a1 mobileDocumentsURLForPersonaID:v3 needsPersonaSwitch:0];

  return v4;
}

+ (id)mobileDocumentsURLForPersonaID:(id)a3 needsPersonaSwitch:(BOOL)a4
{
  BOOL v4 = a4;
  v5 = @"__defaultPersonaID__";
  if (a3) {
    v5 = (__CFString *)a3;
  }
  v6 = v5;
  [(id)gCacheLock lock];
  v7 = [(id)g_mobileDocumentsURLForPersona objectForKeyedSubscript:v6];
  if (!v7)
  {
    _preComputeURLSForPersona(0, v6, v4);
    v7 = [(id)g_mobileDocumentsURLForPersona objectForKeyedSubscript:v6];
  }
  [(id)gCacheLock unlock];

  return v7;
}

- (id)newSyncTokenProxy
{
  if (!self->_isUsingTokenService)
  {
    BOOL v4 = brc_bread_crumbs((uint64_t)"-[BRDaemonConnection newSyncTokenProxy]", 324);
    v5 = brc_default_log(0);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_FAULT)) {
      -[BRDaemonConnection newSyncTokenProxy]();
    }
  }
  return [[BRXPCSyncProxy alloc] initWithXPCObject:self];
}

+ (id)defaultConnection
{
  v3 = [MEMORY[0x1E4FB36F8] sharedManager];
  BOOL v4 = objc_msgSend(v3, "br_currentPersonaID");
  v5 = [a1 defaultConnectionForKey:v4 initializer:&__block_literal_global_32];

  return v5;
}

+ (id)defaultConnectionForKey:(id)a3 initializer:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  uint64_t v16 = 0;
  v17 = &v16;
  uint64_t v18 = 0x3032000000;
  v19 = __Block_byref_object_copy__11;
  v20 = __Block_byref_object_dispose__11;
  id v21 = 0;
  v7 = gDaemonDefaultQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __58__BRDaemonConnection_defaultConnectionForKey_initializer___block_invoke;
  block[3] = &unk_1E59ADC48;
  id v14 = v6;
  v15 = &v16;
  id v13 = v5;
  id v8 = v6;
  id v9 = v5;
  dispatch_sync(v7, block);
  id v10 = (id)v17[5];

  _Block_object_dispose(&v16, 8);

  return v10;
}

- (void).cxx_destruct
{
}

void __58__BRDaemonConnection_defaultConnectionForKey_initializer___block_invoke(void *a1)
{
  uint64_t v2 = [(id)gDaemonDefaultConnectionsByKey objectForKeyedSubscript:a1[4]];
  uint64_t v3 = *(void *)(a1[6] + 8);
  BOOL v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;

  if (!*(void *)(*(void *)(a1[6] + 8) + 40))
  {
    uint64_t v5 = (*(void (**)(void))(a1[5] + 16))();
    uint64_t v6 = *(void *)(a1[6] + 8);
    v7 = *(void **)(v6 + 40);
    *(void *)(v6 + 40) = v5;

    uint64_t v8 = *(void *)(*(void *)(a1[6] + 8) + 40);
    id v9 = (void *)gDaemonDefaultConnectionsByKey;
    uint64_t v10 = a1[4];
    [v9 setObject:v8 forKeyedSubscript:v10];
  }
}

id __39__BRDaemonConnection_defaultConnection__block_invoke()
{
  id v0 = [[BRDaemonConnection alloc] initUsingUserLocalDaemon];

  return v0;
}

- (id)initUsingUserLocalDaemonTokenService
{
  v7.receiver = self;
  v7.super_class = (Class)BRDaemonConnection;
  uint64_t v2 = [(BRDaemonConnection *)&v7 initWithMachServiceName:@"com.apple.bird.token" options:0];
  uint64_t v3 = v2;
  if (v2)
  {
    v2->_isUsingTokenService = 1;
    BOOL v4 = [MEMORY[0x1E4FB36F8] sharedManager];
    uint64_t v5 = objc_msgSend(v4, "br_currentPersonaID");
    [(BRDaemonConnection *)v3 _setupAndResumeForKey:v5];
  }
  return v3;
}

- (id)initUsingUserLocalDaemon
{
  v6.receiver = self;
  v6.super_class = (Class)BRDaemonConnection;
  uint64_t v2 = [(BRDaemonConnection *)&v6 initWithMachServiceName:@"com.apple.bird" options:0];
  if (v2)
  {
    uint64_t v3 = [MEMORY[0x1E4FB36F8] sharedManager];
    BOOL v4 = objc_msgSend(v3, "br_currentPersonaID");
    [(BRDaemonConnection *)v2 _setupAndResumeForKey:v4];
  }
  return v2;
}

- (void)_setupAndResumeForKey:(id)a3
{
  id v4 = a3;
  if (self->_uuid) {
    -[BRDaemonConnection _setUUID:](self, "_setUUID:");
  }
  if (self->_isUsingTokenService) {
    BRCXPCTokenInterface();
  }
  else {
  uint64_t v5 = BRCXPCInterface();
  }
  [(BRDaemonConnection *)self setRemoteObjectInterface:v5];

  objc_initWeak(&location, self);
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __44__BRDaemonConnection__setupAndResumeForKey___block_invoke;
  v15[3] = &unk_1E59AE2E8;
  objc_copyWeak(&v16, &location);
  [(BRDaemonConnection *)self setInterruptionHandler:v15];
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __44__BRDaemonConnection__setupAndResumeForKey___block_invoke_2;
  v12[3] = &unk_1E59AF8E0;
  objc_copyWeak(&v14, &location);
  id v6 = v4;
  id v13 = v6;
  [(BRDaemonConnection *)self setInvalidationHandler:v12];
  uint64_t v7 = [(BRDaemonConnection *)self resume];
  if (!self->_isUsingTokenService && (BRIsFPFSEnabled(v7, v8) & 1) == 0)
  {
    id v9 = [(BRDaemonConnection *)self remoteObjectProxy];
    int active_platform = dyld_get_active_platform();
    if ((active_platform & 0xFFFFFFFB) == 2 || active_platform == 1 || active_platform == 11)
    {
      int v11 = dyld_program_sdk_at_least();
    }
    else
    {
      syslog(5, "Unknown platform linking against CloudDocs framework %d", active_platform);
      int v11 = 1;
    }
    [v9 checkinAskClientIfUsingUbiquity:v11 ^ 1u];
  }
  objc_destroyWeak(&v14);
  objc_destroyWeak(&v16);
  objc_destroyWeak(&location);
}

- (id)newSyncProxy
{
  if (self->_isUsingTokenService)
  {
    id v4 = brc_bread_crumbs((uint64_t)"-[BRDaemonConnection newSyncProxy]", 285);
    uint64_t v5 = brc_default_log(0);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_FAULT)) {
      -[BRDaemonConnection newSyncProxy]();
    }
  }
  return [[BRXPCSyncProxy alloc] initWithXPCObject:self];
}

void __44__BRDaemonConnection__setupAndResumeForKey___block_invoke_2(uint64_t a1)
{
  uint64_t v2 = gDaemonDefaultQueue;
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __44__BRDaemonConnection__setupAndResumeForKey___block_invoke_3;
  v3[3] = &unk_1E59AF8E0;
  objc_copyWeak(&v5, (id *)(a1 + 40));
  id v4 = *(id *)(a1 + 32);
  dispatch_async(v2, v3);

  objc_destroyWeak(&v5);
}

void __44__BRDaemonConnection__setupAndResumeForKey___block_invoke_3(uint64_t a1)
{
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    id v5 = WeakRetained;
    uint64_t v3 = [(id)gDaemonDefaultConnectionsByKey objectForKeyedSubscript:*(void *)(a1 + 32)];

    if (v5 == v3) {
      [(id)gDaemonDefaultConnectionsByKey setObject:0 forKeyedSubscript:*(void *)(a1 + 32)];
    }
    id v4 = [(id)gDaemonSecondaryConnectionsByKey objectForKeyedSubscript:*(void *)(a1 + 32)];

    WeakRetained = v5;
    if (v5 == v4)
    {
      [(id)gDaemonSecondaryConnectionsByKey setObject:0 forKeyedSubscript:*(void *)(a1 + 32)];
      WeakRetained = v5;
    }
    if (WeakRetained[20])
    {
      objc_msgSend((id)gDaemonConnectionsByUUID, "removeObjectForKey:");
      WeakRetained = v5;
    }
  }
}

+ (void)initialize
{
  if ((id)objc_opt_class() == a1)
  {
    uint64_t v2 = dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_UNSPECIFIED, 0);
    uint64_t v3 = dispatch_queue_attr_make_with_autorelease_frequency(v2, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v4 = dispatch_queue_create("com.apple.clouddocs.xpc", v3);

    id v5 = (void *)gDaemonDefaultQueue;
    gDaemonDefaultQueue = (uint64_t)v4;

    uint64_t v6 = objc_opt_new();
    uint64_t v7 = (void *)gDaemonConnectionsByUUID;
    gDaemonConnectionsByUUID = v6;

    uint64_t v8 = objc_opt_new();
    id v9 = (void *)gDaemonDefaultConnectionsByKey;
    gDaemonDefaultConnectionsByKey = v8;

    uint64_t v10 = objc_opt_new();
    int v11 = (void *)gDaemonSecondaryConnectionsByKey;
    gDaemonSecondaryConnectionsByKey = v10;

    uint64_t v12 = objc_opt_new();
    id v13 = (void *)gCacheLock;
    gCacheLock = v12;

    uint64_t v14 = objc_opt_new();
    v15 = (void *)g_homeDirectoryURLForPersona;
    g_homeDirectoryURLForPersona = v14;

    uint64_t v16 = objc_opt_new();
    v17 = (void *)g_mobileDocumentsURLForPersona;
    g_mobileDocumentsURLForPersona = v16;

    uint64_t v18 = objc_opt_new();
    v19 = (void *)g_cloudDocsAppSupportURLForPersona;
    g_cloudDocsAppSupportURLForPersona = v18;

    uint64_t v20 = objc_opt_new();
    id v21 = (void *)g_cloudDocsCachesURLForPersona;
    g_cloudDocsCachesURLForPersona = v20;

    uint64_t v22 = objc_opt_new();
    v23 = (void *)g_syncedDocumentsURLForPersona;
    g_syncedDocumentsURLForPersona = v22;

    uint64_t v24 = objc_opt_new();
    v25 = (void *)g_syncedDesktopURLForPersona;
    g_syncedDesktopURLForPersona = v24;

    uint64_t v26 = objc_opt_new();
    v27 = (void *)g_syncedRootURLsForPersona;
    g_syncedRootURLsForPersona = v26;

    g_accountTokenDidChangeObserverForPersona = objc_opt_new();
    MEMORY[0x1F41817F8]();
  }
}

uint64_t __56__BRDaemonConnection_secondaryConnectionIfExistsForKey___block_invoke(uint64_t a1)
{
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = [(id)gDaemonSecondaryConnectionsByKey objectForKeyedSubscript:*(void *)(a1 + 32)];

  return MEMORY[0x1F41817F8]();
}

uint64_t __54__BRDaemonConnection_defaultConnectionIfExistsForKey___block_invoke(uint64_t a1)
{
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = [(id)gDaemonDefaultConnectionsByKey objectForKeyedSubscript:*(void *)(a1 + 32)];

  return MEMORY[0x1F41817F8]();
}

+ (id)secondaryConnectionIfExists
{
  uint64_t v3 = [MEMORY[0x1E4FB36F8] sharedManager];
  dispatch_queue_t v4 = objc_msgSend(v3, "br_currentPersonaID");
  id v5 = [a1 secondaryConnectionIfExistsForKey:v4];

  return v5;
}

+ (id)secondaryConnectionIfExistsForKey:(id)a3
{
  id v3 = a3;
  uint64_t v11 = 0;
  uint64_t v12 = &v11;
  uint64_t v13 = 0x3032000000;
  uint64_t v14 = __Block_byref_object_copy__11;
  v15 = __Block_byref_object_dispose__11;
  id v16 = 0;
  dispatch_queue_t v4 = gDaemonDefaultQueue;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __56__BRDaemonConnection_secondaryConnectionIfExistsForKey___block_invoke;
  v8[3] = &unk_1E59AE180;
  id v9 = v3;
  uint64_t v10 = &v11;
  id v5 = v3;
  dispatch_sync(v4, v8);
  id v6 = (id)v12[5];

  _Block_object_dispose(&v11, 8);

  return v6;
}

+ (id)defaultConnectionIfExists
{
  id v3 = [MEMORY[0x1E4FB36F8] sharedManager];
  dispatch_queue_t v4 = objc_msgSend(v3, "br_currentPersonaID");
  id v5 = [a1 defaultConnectionIfExistsForKey:v4];

  return v5;
}

+ (id)defaultConnectionIfExistsForKey:(id)a3
{
  id v3 = a3;
  uint64_t v11 = 0;
  uint64_t v12 = &v11;
  uint64_t v13 = 0x3032000000;
  uint64_t v14 = __Block_byref_object_copy__11;
  v15 = __Block_byref_object_dispose__11;
  id v16 = 0;
  dispatch_queue_t v4 = gDaemonDefaultQueue;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __54__BRDaemonConnection_defaultConnectionIfExistsForKey___block_invoke;
  v8[3] = &unk_1E59AE180;
  id v9 = v3;
  uint64_t v10 = &v11;
  id v5 = v3;
  dispatch_sync(v4, v8);
  id v6 = (id)v12[5];

  _Block_object_dispose(&v11, 8);

  return v6;
}

void __44__BRDaemonConnection__setupAndResumeForKey___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained invalidate];
}

+ (id)secondaryConnectionForKey:(id)a3 initializer:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  uint64_t v16 = 0;
  v17 = &v16;
  uint64_t v18 = 0x3032000000;
  v19 = __Block_byref_object_copy__11;
  uint64_t v20 = __Block_byref_object_dispose__11;
  id v21 = 0;
  uint64_t v7 = gDaemonDefaultQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __60__BRDaemonConnection_secondaryConnectionForKey_initializer___block_invoke;
  block[3] = &unk_1E59ADC48;
  id v14 = v6;
  v15 = &v16;
  id v13 = v5;
  id v8 = v6;
  id v9 = v5;
  dispatch_sync(v7, block);
  id v10 = (id)v17[5];

  _Block_object_dispose(&v16, 8);

  return v10;
}

void __60__BRDaemonConnection_secondaryConnectionForKey_initializer___block_invoke(void *a1)
{
  uint64_t v2 = [(id)gDaemonSecondaryConnectionsByKey objectForKeyedSubscript:a1[4]];
  uint64_t v3 = *(void *)(a1[6] + 8);
  dispatch_queue_t v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;

  if (!*(void *)(*(void *)(a1[6] + 8) + 40))
  {
    uint64_t v5 = (*(void (**)(void))(a1[5] + 16))();
    uint64_t v6 = *(void *)(a1[6] + 8);
    uint64_t v7 = *(void **)(v6 + 40);
    *(void *)(v6 + 40) = v5;

    uint64_t v8 = *(void *)(*(void *)(a1[6] + 8) + 40);
    id v9 = (void *)gDaemonSecondaryConnectionsByKey;
    uint64_t v10 = a1[4];
    [v9 setObject:v8 forKeyedSubscript:v10];
  }
}

+ (id)secondaryConnection
{
  uint64_t v3 = [MEMORY[0x1E4FB36F8] sharedManager];
  dispatch_queue_t v4 = objc_msgSend(v3, "br_currentPersonaID");
  uint64_t v5 = [a1 secondaryConnectionForKey:v4 initializer:&__block_literal_global_21];

  return v5;
}

id __41__BRDaemonConnection_secondaryConnection__block_invoke()
{
  id v0 = [[BRDaemonConnection alloc] initUsingUserLocalDaemon];

  return v0;
}

- (id)newLegacySyncProxy
{
  if (BRIsFPFSEnabled(self, a2))
  {
    uint64_t v3 = brc_bread_crumbs((uint64_t)"-[BRDaemonConnection newLegacySyncProxy]", 292);
    dispatch_queue_t v4 = brc_default_log(0);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_FAULT)) {
      -[BRDaemonConnection newLegacySyncProxy]();
    }

    uint64_t v5 = [BRXPCAutomaticErrorProxy alloc];
    uint64_t v6 = [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F281F8] code:4099 userInfo:0];
    uint64_t v7 = [NSString stringWithFormat:@"broken legacy proxy"];
    uint64_t v8 = [(FPXPCAutomaticErrorProxy *)v5 initWithConnection:0 protocol:&unk_1EF1563F8 orError:v6 name:v7 requestPid:0];

    id v9 = [(FPXPCAutomaticErrorProxy *)v8 synchronousRemoteObjectProxy];
  }
  else
  {
    if (self->_isUsingTokenService)
    {
      uint64_t v11 = brc_bread_crumbs((uint64_t)"-[BRDaemonConnection newLegacySyncProxy]", 301);
      uint64_t v12 = brc_default_log(0);
      if (os_log_type_enabled(v12, OS_LOG_TYPE_FAULT)) {
        -[BRDaemonConnection newSyncProxy]();
      }
    }
    return [[BRXPCSyncProxy alloc] initWithXPCObject:self];
  }
  return v9;
}

- (id)newFPFSSyncProxy
{
  if (BRIsFPFSEnabled(self, a2))
  {
    if (self->_isUsingTokenService)
    {
      uint64_t v11 = brc_bread_crumbs((uint64_t)"-[BRDaemonConnection newFPFSSyncProxy]", 317);
      uint64_t v12 = brc_default_log(0);
      if (os_log_type_enabled(v12, OS_LOG_TYPE_FAULT)) {
        -[BRDaemonConnection newSyncProxy]();
      }
    }
    return [[BRXPCSyncProxy alloc] initWithXPCObject:self];
  }
  else
  {
    dispatch_queue_t v4 = brc_bread_crumbs((uint64_t)"-[BRDaemonConnection newFPFSSyncProxy]", 308);
    uint64_t v5 = brc_default_log(0);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_FAULT)) {
      -[BRDaemonConnection newFPFSSyncProxy]();
    }

    uint64_t v6 = [BRXPCAutomaticErrorProxy alloc];
    uint64_t v7 = [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F281F8] code:4099 userInfo:0];
    uint64_t v8 = [NSString stringWithFormat:@"broken FPFS proxy"];
    id v9 = [(FPXPCAutomaticErrorProxy *)v6 initWithConnection:0 protocol:&unk_1EF156398 orError:v7 name:v8 requestPid:0];

    uint64_t v3 = [(FPXPCAutomaticErrorProxy *)v9 synchronousRemoteObjectProxy];
  }
  return v3;
}

+ (id)homeDirectoryURLForPersonaID:(id)a3 needsPersonaSwitch:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v5 = @"__defaultPersonaID__";
  if (a3) {
    uint64_t v5 = (__CFString *)a3;
  }
  uint64_t v6 = v5;
  [(id)gCacheLock lock];
  uint64_t v7 = [(id)g_homeDirectoryURLForPersona objectForKeyedSubscript:v6];
  if (!v7)
  {
    _preComputeURLSForPersona(1, v6, v4);
    uint64_t v7 = [(id)g_homeDirectoryURLForPersona objectForKeyedSubscript:v6];
  }
  [(id)gCacheLock unlock];

  return v7;
}

+ (id)cloudDocsAppSupportURLForPersonaID:(id)a3 needsPersonaSwitch:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v5 = @"__defaultPersonaID__";
  if (a3) {
    uint64_t v5 = (__CFString *)a3;
  }
  uint64_t v6 = v5;
  [(id)gCacheLock lock];
  uint64_t v7 = [(id)g_cloudDocsAppSupportURLForPersona objectForKeyedSubscript:v6];
  if (!v7)
  {
    _preComputeURLSForPersona(1, v6, v4);
    uint64_t v7 = [(id)g_cloudDocsAppSupportURLForPersona objectForKeyedSubscript:v6];
  }
  [(id)gCacheLock unlock];

  return v7;
}

+ (id)cloudDocsCachesURLForPersonaID:(id)a3 needsPersonaSwitch:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v5 = @"__defaultPersonaID__";
  if (a3) {
    uint64_t v5 = (__CFString *)a3;
  }
  uint64_t v6 = v5;
  [(id)gCacheLock lock];
  uint64_t v7 = [(id)g_cloudDocsCachesURLForPersona objectForKeyedSubscript:v6];
  if (!v7)
  {
    _preComputeURLSForPersona(1, v6, v4);
    uint64_t v7 = [(id)g_cloudDocsCachesURLForPersona objectForKeyedSubscript:v6];
  }
  [(id)gCacheLock unlock];

  return v7;
}

+ (id)syncedDesktopURLForPersonaID:(id)a3 needsPersonaSwitch:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v5 = @"__defaultPersonaID__";
  if (a3) {
    uint64_t v5 = (__CFString *)a3;
  }
  uint64_t v6 = v5;
  [(id)gCacheLock lock];
  uint64_t v7 = [(id)g_syncedDesktopURLForPersona objectForKeyedSubscript:v6];
  if (!v7)
  {
    _preComputeURLSForPersona(1, v6, v4);
    uint64_t v7 = [(id)g_syncedDesktopURLForPersona objectForKeyedSubscript:v6];
  }
  [(id)gCacheLock unlock];

  return v7;
}

+ (id)syncedDocumentsURLForPersonaID:(id)a3 needsPersonaSwitch:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v5 = @"__defaultPersonaID__";
  if (a3) {
    uint64_t v5 = (__CFString *)a3;
  }
  uint64_t v6 = v5;
  [(id)gCacheLock lock];
  uint64_t v7 = [(id)g_syncedDocumentsURLForPersona objectForKeyedSubscript:v6];
  if (!v7)
  {
    _preComputeURLSForPersona(1, v6, v4);
    uint64_t v7 = [(id)g_syncedDocumentsURLForPersona objectForKeyedSubscript:v6];
  }
  [(id)gCacheLock unlock];

  return v7;
}

+ (id)syncedRootURLsForPersonaID:(id)a3 needsPersonaSwitch:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v5 = @"__defaultPersonaID__";
  if (a3) {
    uint64_t v5 = (__CFString *)a3;
  }
  uint64_t v6 = v5;
  [(id)gCacheLock lock];
  uint64_t v7 = [(id)g_syncedRootURLsForPersona objectForKeyedSubscript:v6];
  if (!v7)
  {
    _preComputeURLSForPersona(0, v6, v4);
    uint64_t v7 = [(id)g_syncedRootURLsForPersona objectForKeyedSubscript:v6];
  }
  [(id)gCacheLock unlock];

  return v7;
}

+ (id)homeDirectoryURL
{
  uint64_t v3 = objc_msgSend(NSString, "br_currentPersonaIDWithIsDataSeparated:", 0);
  BOOL v4 = [a1 homeDirectoryURLForPersonaID:v3 needsPersonaSwitch:0];

  return v4;
}

+ (id)syncedDesktopURL
{
  uint64_t v3 = objc_msgSend(NSString, "br_currentPersonaIDWithIsDataSeparated:", 0);
  BOOL v4 = [a1 syncedDesktopURLForPersonaID:v3 needsPersonaSwitch:0];

  return v4;
}

+ (id)syncedDocumentsURL
{
  uint64_t v3 = objc_msgSend(NSString, "br_currentPersonaIDWithIsDataSeparated:", 0);
  BOOL v4 = [a1 syncedDocumentsURLForPersonaID:v3 needsPersonaSwitch:0];

  return v4;
}

+ (id)syncedRootURLs
{
  uint64_t v3 = objc_msgSend(NSString, "br_currentPersonaIDWithIsDataSeparated:", 0);
  BOOL v4 = [a1 syncedRootURLsForPersonaID:v3 needsPersonaSwitch:0];

  return v4;
}

+ (id)cloudDocsAppSupportURL
{
  uint64_t v3 = objc_msgSend(NSString, "br_currentPersonaIDWithIsDataSeparated:", 0);
  BOOL v4 = [a1 cloudDocsAppSupportURLForPersonaID:v3 needsPersonaSwitch:0];

  return v4;
}

+ (id)cloudDocsCachesURL
{
  uint64_t v3 = objc_msgSend(NSString, "br_currentPersonaIDWithIsDataSeparated:", 0);
  BOOL v4 = [a1 cloudDocsCachesURLForPersonaID:v3 needsPersonaSwitch:0];

  return v4;
}

+ (void)invalidateCachedURLProperties
{
  objc_msgSend(NSString, "br_currentPersonaIDWithIsDataSeparated:", 0);
  id v3 = (id)objc_claimAutoreleasedReturnValue();
  [a1 invalidateCachedURLPropertiesForPersonaID:v3];
}

+ (void)invalidateCachedURLPropertiesForPersonaID:(id)a3
{
  id v3 = (void *)gCacheLock;
  id v4 = a3;
  [v3 lock];
  uint64_t v5 = [(id)g_homeDirectoryURLForPersona objectForKeyedSubscript:v4];
  [v5 removeAllCachedResourceValues];

  uint64_t v6 = [(id)g_mobileDocumentsURLForPersona objectForKeyedSubscript:v4];
  [v6 removeAllCachedResourceValues];

  uint64_t v7 = [(id)g_cloudDocsAppSupportURLForPersona objectForKeyedSubscript:v4];
  [v7 removeAllCachedResourceValues];

  uint64_t v8 = [(id)g_cloudDocsCachesURLForPersona objectForKeyedSubscript:v4];
  [v8 removeAllCachedResourceValues];

  id v9 = [(id)g_syncedDocumentsURLForPersona objectForKeyedSubscript:v4];
  [v9 removeAllCachedResourceValues];

  uint64_t v10 = [(id)g_syncedDesktopURLForPersona objectForKeyedSubscript:v4];

  [v10 removeAllCachedResourceValues];
  uint64_t v11 = (void *)gCacheLock;

  [v11 unlock];
}

+ (void)clearURLCache
{
  objc_msgSend(NSString, "br_currentPersonaIDWithIsDataSeparated:", 0);
  id v3 = (id)objc_claimAutoreleasedReturnValue();
  [a1 clearURLCacheForPersonaID:v3];
}

+ (void)clearURLCacheForPersonaID:(id)a3
{
  id v4 = (void *)gCacheLock;
  id v5 = a3;
  [v4 lock];
  [a1 invalidateCachedURLPropertiesForPersonaID:v5];
  [(id)g_homeDirectoryURLForPersona removeObjectForKey:v5];
  [(id)g_mobileDocumentsURLForPersona removeObjectForKey:v5];
  [(id)g_cloudDocsAppSupportURLForPersona removeObjectForKey:v5];
  [(id)g_cloudDocsCachesURLForPersona removeObjectForKey:v5];
  [(id)g_syncedDocumentsURLForPersona removeObjectForKey:v5];
  [(id)g_syncedDesktopURLForPersona removeObjectForKey:v5];
  [(id)g_syncedRootURLsForPersona removeObjectForKey:v5];

  uint64_t v6 = (void *)gCacheLock;

  [v6 unlock];
}

- (void)newSyncProxy
{
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0_0(&dword_19ED3F000, v0, v1, "[CRIT] Assertion failed: _isUsingTokenService == NO%@", v2, v3, v4, v5, v6);
}

- (void)newLegacySyncProxy
{
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0_0(&dword_19ED3F000, v0, v1, "[CRIT] UNREACHABLE: Can't use the legacy sync proxy when fpfs is enabled%@", v2, v3, v4, v5, v6);
}

- (void)newFPFSSyncProxy
{
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0_0(&dword_19ED3F000, v0, v1, "[CRIT] UNREACHABLE: Can't use the fpfs sync proxy when fpfs isn't enabled%@", v2, v3, v4, v5, v6);
}

- (void)newSyncTokenProxy
{
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0_0(&dword_19ED3F000, v0, v1, "[CRIT] Assertion failed: _isUsingTokenService%@", v2, v3, v4, v5, v6);
}

@end