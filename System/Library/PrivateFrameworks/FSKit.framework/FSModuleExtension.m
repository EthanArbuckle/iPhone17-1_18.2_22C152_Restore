@interface FSModuleExtension
+ (id)moduleExtensionForAppex:(id)a3;
- (BOOL)delegateConformantFS;
- (BOOL)fskitdIsClient:(id)a3;
- (BOOL)isFSSubclass;
- (BOOL)isNormalFS;
- (BOOL)isSimpleFS;
- (BOOL)isSimpleFSSubclass;
- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4;
- (BOOL)shouldAcceptConnection:(id)a3;
- (BOOL)supportsBlockOps;
- (BOOL)supportsServerOps;
- (BOOL)supportsSimpleMaintenanceOps;
- (FSContainerIdentifier)instanceID;
- (FSModuleConnector)fskitdCurrentConnection;
- (FSResource)resource;
- (LiveFSMachPort)fsMachPort;
- (NSMutableArray)connectors;
- (NSMutableDictionary)taskSet;
- (NSMutableDictionary)volumes;
- (NSObject)strongDelegate;
- (NSString)bundleID;
- (NSXPCListener)secondaryListener;
- (id)getFSMachPort;
- (void)dealloc;
- (void)didFinishLaunching;
- (void)sendConfigureUserClient:(id)a3 replyHandler:(id)a4;
- (void)sendIsVolumeUsed:(id)a3 bundle:(id)a4 replyHandler:(id)a5;
- (void)sendWipeResource:(id)a3 replyHandler:(id)a4;
- (void)setFsMachPort:(id)a3;
- (void)setFskitdCurrentConnection:(id)a3;
- (void)setInstanceID:(id)a3;
- (void)setResource:(id)a3;
- (void)setStrongDelegate:(id)a3;
- (void)setTaskSet:(id)a3;
@end

@implementation FSModuleExtension

- (void)dealloc
{
  if (gSecondaryListener)
  {
    [(id)gSecondaryListener invalidate];
    v3 = (void *)gSecondaryListener;
    gSecondaryListener = 0;
  }
  v4.receiver = self;
  v4.super_class = (Class)FSModuleExtension;
  [(FSModuleExtension *)&v4 dealloc];
}

- (void)didFinishLaunching
{
}

- (BOOL)fskitdIsClient:(id)a3
{
  id v3 = a3;
  objc_super v4 = v3;
  memset(&v13[1], 0, sizeof(audit_token_t));
  if (v3) {
    [v3 auditToken];
  }
  v13[0] = v13[1];
  v5 = SecTaskCreateWithAuditToken(0, v13);
  if (v5)
  {
    v6 = v5;
    v7 = (__CFString *)SecTaskCopyValueForEntitlement(v5, @"application-identifier", 0);
    if (v7)
    {
      v8 = v7;
      CFTypeID v9 = CFGetTypeID(v7);
      if (v9 == CFStringGetTypeID())
      {
LABEL_8:
        CFRelease(v6);
        goto LABEL_10;
      }
      CFRelease(v8);
    }
    v8 = &stru_26FFF08C0;
    goto LABEL_8;
  }
  v8 = &stru_26FFF08C0;
LABEL_10:
  v10 = fskit_std_log();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG)) {
    -[FSModuleExtension fskitdIsClient:]();
  }

  char v11 = [(__CFString *)v8 isEqualToString:@"com.apple.filesystems.fskitd"];
  return v11;
}

- (NSXPCListener)secondaryListener
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  id v3 = (void *)MEMORY[0x25332B920](self, a2);
  objc_super v4 = self;
  objc_sync_enter(v4);
  if (!gSecondaryListener)
  {
    uint64_t v5 = [MEMORY[0x263F08D88] anonymousListener];
    v6 = (void *)gSecondaryListener;
    gSecondaryListener = v5;

    if (gSecondaryListener)
    {
      [(id)gSecondaryListener setDelegate:v4];
      [(id)gSecondaryListener resume];
    }
  }
  v7 = fskit_std_log();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    int v10 = 138412290;
    uint64_t v11 = gSecondaryListener;
    _os_log_impl(&dword_24DDB2000, v7, OS_LOG_TYPE_DEFAULT, "Set secondary listener up %@", (uint8_t *)&v10, 0xCu);
  }

  id v8 = (id)gSecondaryListener;
  objc_sync_exit(v4);

  return (NSXPCListener *)v8;
}

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  return [(FSModuleExtension *)self shouldAcceptConnection:a4];
}

- (BOOL)isFSSubclass
{
  return self->_isFSSubclass;
}

- (BOOL)isSimpleFSSubclass
{
  return self->_isSimpleFSSubclass;
}

- (BOOL)isNormalFS
{
  return self->_isNormalFS;
}

- (BOOL)isSimpleFS
{
  return self->_isSimpleFS;
}

- (BOOL)supportsBlockOps
{
  return self->_supportsBlockOps;
}

- (BOOL)supportsSimpleMaintenanceOps
{
  return self->_supportsSimpleMaintenanceOps;
}

- (BOOL)supportsServerOps
{
  return self->_supportsServerOps;
}

- (BOOL)delegateConformantFS
{
  return self->_delegateConformantFS;
}

- (NSObject)strongDelegate
{
  return objc_getProperty(self, a2, 48, 1);
}

- (void)setStrongDelegate:(id)a3
{
}

- (FSContainerIdentifier)instanceID
{
  return (FSContainerIdentifier *)objc_getProperty(self, a2, 56, 1);
}

- (void)setInstanceID:(id)a3
{
}

- (NSString)bundleID
{
  return (NSString *)objc_getProperty(self, a2, 64, 1);
}

- (NSMutableDictionary)taskSet
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 72, 1);
}

- (void)setTaskSet:(id)a3
{
}

- (NSMutableArray)connectors
{
  return (NSMutableArray *)objc_getProperty(self, a2, 80, 1);
}

- (NSMutableDictionary)volumes
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 88, 1);
}

- (FSResource)resource
{
  return (FSResource *)objc_getProperty(self, a2, 96, 1);
}

- (void)setResource:(id)a3
{
}

- (FSModuleConnector)fskitdCurrentConnection
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_fskitdCurrentConnection);
  return (FSModuleConnector *)WeakRetained;
}

- (void)setFskitdCurrentConnection:(id)a3
{
}

- (LiveFSMachPort)fsMachPort
{
  return (LiveFSMachPort *)objc_getProperty(self, a2, 112, 1);
}

- (void)setFsMachPort:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_fsMachPort, 0);
  objc_destroyWeak((id *)&self->_fskitdCurrentConnection);
  objc_storeStrong((id *)&self->_resource, 0);
  objc_storeStrong((id *)&self->_volumes, 0);
  objc_storeStrong((id *)&self->_connectors, 0);
  objc_storeStrong((id *)&self->_taskSet, 0);
  objc_storeStrong((id *)&self->_bundleID, 0);
  objc_storeStrong((id *)&self->_instanceID, 0);
  objc_storeStrong((id *)&self->_strongDelegate, 0);
}

+ (id)moduleExtensionForAppex:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [[FSModuleExtension alloc] init];
  p_isa = (id *)&v5->super.super.isa;
  if (v5)
  {
    [(_EXExtension *)v5 setDelegate:v4];
    objc_storeStrong(p_isa + 6, a3);
    v7 = fskit_std_log();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
      +[FSModuleExtension(Project) moduleExtensionForAppex:](v7, v8, v9, v10, v11, v12, v13, v14);
    }
  }
  return p_isa;
}

- (BOOL)shouldAcceptConnection:(id)a3
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  id v4 = a3;
  uint64_t v5 = objc_opt_new();
  [v5 setOurModule:self];
  [v5 setOurConnection:v4];
  if ([(FSModuleExtension *)self fskitdIsClient:v4]) {
    objc_storeWeak((id *)&self->_fskitdCurrentConnection, v5);
  }
  [v4 setExportedObject:v5];
  v6 = +[FSKitConstants FSModuleExtensionXPCProtocol];
  [v4 setExportedInterface:v6];

  v7 = +[FSKitConstants FSModuleExtensionHostXPCProtocol];
  [v4 setRemoteObjectInterface:v7];

  [v4 resume];
  [(NSMutableArray *)self->_connectors addObject:v5];
  uint64_t v8 = fskit_std_log();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    int v10 = 136315138;
    uint64_t v11 = "-[FSModuleExtension(Project) shouldAcceptConnection:]";
    _os_log_impl(&dword_24DDB2000, v8, OS_LOG_TYPE_DEFAULT, "%s returning YES", (uint8_t *)&v10, 0xCu);
  }

  return 1;
}

- (void)sendWipeResource:(id)a3 replyHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = fskit_std_log();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
    -[FSModuleExtension(Project) sendWipeResource:replyHandler:](v8, v9, v10, v11, v12, v13, v14, v15);
  }

  id WeakRetained = objc_loadWeakRetained((id *)&self->_fskitdCurrentConnection);
  if (WeakRetained)
  {
    id v17 = objc_loadWeakRetained((id *)&self->_fskitdCurrentConnection);
    v28[0] = MEMORY[0x263EF8330];
    v28[1] = 3221225472;
    v28[2] = __60__FSModuleExtension_Project__sendWipeResource_replyHandler___block_invoke;
    v28[3] = &unk_26530B198;
    id v29 = v7;
    [v17 sendWipeResource:v6 replyHandler:v28];

    v18 = fskit_std_log();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG)) {
      -[FSModuleExtension(Project) sendWipeResource:replyHandler:](v18, v19, v20, v21, v22, v23, v24, v25);
    }

    v26 = v29;
  }
  else
  {
    v27 = fskit_std_log();
    if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR)) {
      -[FSModuleExtension(Project) sendWipeResource:replyHandler:](self, v27);
    }

    v26 = fs_errorForPOSIXError(45);
    (*((void (**)(id, void *))v7 + 2))(v7, v26);
  }
}

uint64_t __60__FSModuleExtension_Project__sendWipeResource_replyHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)sendIsVolumeUsed:(id)a3 bundle:(id)a4 replyHandler:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  uint64_t v11 = fskit_std_log();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG)) {
    -[FSModuleExtension(Project) sendIsVolumeUsed:bundle:replyHandler:]();
  }

  id WeakRetained = objc_loadWeakRetained((id *)&self->_fskitdCurrentConnection);
  if (WeakRetained)
  {
    id v13 = objc_loadWeakRetained((id *)&self->_fskitdCurrentConnection);
    v24[0] = MEMORY[0x263EF8330];
    v24[1] = 3221225472;
    v24[2] = __67__FSModuleExtension_Project__sendIsVolumeUsed_bundle_replyHandler___block_invoke;
    v24[3] = &unk_26530B1C0;
    id v25 = v10;
    [v13 sendIsVolumeUsed:v8 bundle:v9 replyHandler:v24];

    uint64_t v14 = fskit_std_log();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG)) {
      -[FSModuleExtension(Project) sendIsVolumeUsed:bundle:replyHandler:](v14, v15, v16, v17, v18, v19, v20, v21);
    }

    uint64_t v22 = v25;
  }
  else
  {
    uint64_t v23 = fskit_std_log();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR)) {
      -[FSModuleExtension(Project) sendIsVolumeUsed:bundle:replyHandler:](self, v23);
    }

    uint64_t v22 = fs_errorForPOSIXError(45);
    (*((void (**)(id, void, void *))v10 + 2))(v10, 0, v22);
  }
}

uint64_t __67__FSModuleExtension_Project__sendIsVolumeUsed_bundle_replyHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (id)getFSMachPort
{
  return self->_fsMachPort;
}

- (void)sendConfigureUserClient:(id)a3 replyHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = fskit_std_log();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
    -[FSModuleExtension(Project) sendConfigureUserClient:replyHandler:]();
  }

  id WeakRetained = objc_loadWeakRetained((id *)&self->_fskitdCurrentConnection);
  if (WeakRetained)
  {
    id v10 = objc_loadWeakRetained((id *)&self->_fskitdCurrentConnection);
    v21[0] = MEMORY[0x263EF8330];
    v21[1] = 3221225472;
    v21[2] = __67__FSModuleExtension_Project__sendConfigureUserClient_replyHandler___block_invoke;
    v21[3] = &unk_26530B198;
    id v22 = v7;
    [v10 sendConfigureUserClient:v6 replyHandler:v21];

    uint64_t v11 = fskit_std_log();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG)) {
      -[FSModuleExtension(Project) sendConfigureUserClient:replyHandler:](v11, v12, v13, v14, v15, v16, v17, v18);
    }

    uint64_t v19 = v22;
  }
  else
  {
    uint64_t v20 = fskit_std_log();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR)) {
      -[FSModuleExtension(Project) sendConfigureUserClient:replyHandler:](self, v20);
    }

    uint64_t v19 = fs_errorForPOSIXError(45);
    (*((void (**)(id, void *))v7 + 2))(v7, v19);
  }
}

uint64_t __67__FSModuleExtension_Project__sendConfigureUserClient_replyHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)fskitdIsClient:.cold.1()
{
  uint64_t v3 = *MEMORY[0x263EF8340];
  v2[0] = 136315394;
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_6(&dword_24DDB2000, v0, v1, "%s: connection application identifier (%@)", (uint8_t *)v2);
}

@end