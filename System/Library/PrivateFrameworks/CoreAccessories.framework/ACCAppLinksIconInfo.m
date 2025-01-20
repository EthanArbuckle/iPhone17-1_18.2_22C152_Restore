@interface ACCAppLinksIconInfo
+ (id)sharedManager;
- (ACCAppLinksIconInfo)init;
- (NSXPCConnection)xpcConnection;
- (id)_init;
- (void)getIconDataForBundleID:(id)a3 forIconSize:(double)a4 withReply:(id)a5;
- (void)setXpcConnection:(id)a3;
@end

@implementation ACCAppLinksIconInfo

+ (id)sharedManager
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __36__ACCAppLinksIconInfo_sharedManager__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (sharedManager_once_0 != -1) {
    dispatch_once(&sharedManager_once_0, block);
  }
  v2 = (void *)sharedManager_sharedInstance_0;

  return v2;
}

uint64_t __36__ACCAppLinksIconInfo_sharedManager__block_invoke(uint64_t a1)
{
  sharedManager_sharedInstance_0 = [objc_alloc(*(Class *)(a1 + 32)) _init];

  return MEMORY[0x1F41817F8]();
}

- (ACCAppLinksIconInfo)init
{
  v4 = (void *)MEMORY[0x1E4F1CA00];
  uint64_t v5 = *MEMORY[0x1E4F1C3B8];
  v6 = (objc_class *)objc_opt_class();
  v7 = NSStringFromClass(v6);
  v8 = NSStringFromSelector(sel_sharedManager);
  v9 = NSStringFromSelector(a2);
  [v4 raise:v5, @"Use +[%@ %@] instead of -%@.", v7, v8, v9 format];

  return 0;
}

- (id)_init
{
  init_logging();
  v8.receiver = self;
  v8.super_class = (Class)ACCAppLinksIconInfo;
  v3 = [(ACCAppLinksIconInfo *)&v8 init];
  if (v3)
  {
    uint64_t v4 = [objc_alloc(MEMORY[0x1E4F29268]) initWithServiceName:@"com.apple.coreaccessories.ACCAppLinksIconService"];
    xpcConnection = v3->_xpcConnection;
    v3->_xpcConnection = (NSXPCConnection *)v4;

    v6 = [MEMORY[0x1E4F29280] interfaceWithProtocol:&unk_1F0C7B1A0];
    [(NSXPCConnection *)v3->_xpcConnection setRemoteObjectInterface:v6];

    [(NSXPCConnection *)v3->_xpcConnection resume];
  }
  return v3;
}

- (void)getIconDataForBundleID:(id)a3 forIconSize:(double)a4 withReply:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  if (v9)
  {
    v10 = [(ACCAppLinksIconInfo *)self xpcConnection];
    v18[0] = MEMORY[0x1E4F143A8];
    v18[1] = 3221225472;
    v18[2] = __68__ACCAppLinksIconInfo_getIconDataForBundleID_forIconSize_withReply___block_invoke;
    v18[3] = &unk_1E6073DE0;
    v11 = v9;
    v19 = v11;
    v12 = [v10 remoteObjectProxyWithErrorHandler:v18];
    v16[0] = MEMORY[0x1E4F143A8];
    v16[1] = 3221225472;
    v16[2] = __68__ACCAppLinksIconInfo_getIconDataForBundleID_forIconSize_withReply___block_invoke_13;
    v16[3] = &unk_1E60740C0;
    v17 = v11;
    [v12 getIconDataForBundleID:v8 forIconSize:v16 withReply:a4];

    v13 = v19;
  }
  else
  {
    if (gLogObjects) {
      BOOL v14 = gNumLogObjects < 5;
    }
    else {
      BOOL v14 = 1;
    }
    if (v14)
    {
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
        -[ACCAppLinksIconInfo getIconDataForBundleID:forIconSize:withReply:]();
      }
      v13 = MEMORY[0x1E4F14500];
      id v15 = MEMORY[0x1E4F14500];
    }
    else
    {
      v13 = *(id *)(gLogObjects + 32);
    }
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
      -[ACCAppLinksIconInfo getIconDataForBundleID:forIconSize:withReply:](v13);
    }
  }
}

void __68__ACCAppLinksIconInfo_getIconDataForBundleID_forIconSize_withReply___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (gLogObjects) {
    BOOL v4 = gNumLogObjects < 5;
  }
  else {
    BOOL v4 = 1;
  }
  if (v4)
  {
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
      -[ACCAppLinksIconInfo getIconDataForBundleID:forIconSize:withReply:]();
    }
    v6 = MEMORY[0x1E4F14500];
    id v5 = MEMORY[0x1E4F14500];
  }
  else
  {
    v6 = *(id *)(gLogObjects + 32);
  }
  if (os_log_type_enabled(v6, OS_LOG_TYPE_FAULT)) {
    __68__ACCAppLinksIconInfo_getIconDataForBundleID_forIconSize_withReply___block_invoke_cold_1((uint64_t)v3, v6);
  }

  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __68__ACCAppLinksIconInfo_getIconDataForBundleID_forIconSize_withReply___block_invoke_13(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (NSXPCConnection)xpcConnection
{
  return self->_xpcConnection;
}

- (void)setXpcConnection:(id)a3
{
}

- (void).cxx_destruct
{
}

- (void)getIconDataForBundleID:(os_log_t)log forIconSize:withReply:.cold.1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_1B3C21000, log, OS_LOG_TYPE_ERROR, "no reply handler!", v1, 2u);
}

- (void)getIconDataForBundleID:forIconSize:withReply:.cold.2()
{
  uint64_t v1 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_0();
  _os_log_error_impl(&dword_1B3C21000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "Make sure you have called init_logging()!\ngLogObjects: %p, gNumLogObjects: %d", v0, 0x12u);
}

void __68__ACCAppLinksIconInfo_getIconDataForBundleID_forIconSize_withReply___block_invoke_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_fault_impl(&dword_1B3C21000, a2, OS_LOG_TYPE_FAULT, "can't invoke remote object %@", (uint8_t *)&v2, 0xCu);
}

@end