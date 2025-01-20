@interface FSWebKitHostSupportManager
+ (FSWebKitHostSupportManager)sharedManager;
- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4;
- (FSWebKitHostSupportManager)init;
- (NSXPCListener)listener;
- (void)setListener:(id)a3;
@end

@implementation FSWebKitHostSupportManager

+ (FSWebKitHostSupportManager)sharedManager
{
  if (sharedManager_onceToken_1 != -1) {
    dispatch_once(&sharedManager_onceToken_1, &__block_literal_global_7);
  }
  v2 = (void *)sharedManager_sSharedManager;
  return (FSWebKitHostSupportManager *)v2;
}

uint64_t __43__FSWebKitHostSupportManager_sharedManager__block_invoke()
{
  sharedManager_sSharedManager = objc_alloc_init(FSWebKitHostSupportManager);
  return MEMORY[0x1F41817F8]();
}

- (FSWebKitHostSupportManager)init
{
  v6.receiver = self;
  v6.super_class = (Class)FSWebKitHostSupportManager;
  v2 = [(FSWebKitHostSupportManager *)&v6 init];
  if (v2)
  {
    uint64_t v3 = [MEMORY[0x1E4F29290] anonymousListener];
    listener = v2->_listener;
    v2->_listener = (NSXPCListener *)v3;

    [(NSXPCListener *)v2->_listener setDelegate:v2];
    [(NSXPCListener *)v2->_listener resume];
  }
  return v2;
}

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  v4 = (void *)MEMORY[0x1E4F29280];
  id v5 = a4;
  objc_super v6 = [v4 interfaceWithProtocol:&unk_1F0DA4190];
  [v5 setExportedInterface:v6];
  v7 = [[FSWebKitProcessSupportHandler alloc] initWithConnection:v5];
  [v5 setExportedObject:v7];

  [v5 resume];
  return 1;
}

- (NSXPCListener)listener
{
  return self->_listener;
}

- (void)setListener:(id)a3
{
}

- (void).cxx_destruct
{
}

@end