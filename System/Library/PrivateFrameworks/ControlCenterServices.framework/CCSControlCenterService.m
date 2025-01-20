@interface CCSControlCenterService
+ (id)sharedInstance;
- (id)_init;
- (void)getEnabledStateOfModuleWithIdentifier:(id)a3 completionHandler:(id)a4;
- (void)handleControlCenterOperationType:(int64_t)a3 completionHandler:(id)a4;
- (void)handleIconElementRequest:(id)a3 completionHandler:(id)a4;
- (void)presentModuleWithIdentifier:(id)a3 options:(id)a4 completionHandler:(id)a5;
- (void)requestAvailableModuleIdentifiersWithCompletionHandler:(id)a3;
- (void)requestDisableModuleWithIdentifier:(id)a3 completionHandler:(id)a4;
- (void)requestEnableModuleWithIdentifier:(id)a3 completionHandler:(id)a4;
- (void)requestEnableModuleWithIdentifier:(id)a3 force:(BOOL)a4 completionHandler:(id)a5;
- (void)requestIconElementState:(id)a3 completionHandler:(id)a4;
- (void)resetToDefaultLayoutWithCompletionHandler:(id)a3;
- (void)setVisibility:(BOOL)a3 forModuleWithIdentifier:(id)a4 completionHandler:(id)a5;
@end

@implementation CCSControlCenterService

- (void)setVisibility:(BOOL)a3 forModuleWithIdentifier:(id)a4 completionHandler:(id)a5
{
}

+ (id)sharedInstance
{
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __41__CCSControlCenterService_sharedInstance__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (sharedInstance_onceToken_0 != -1) {
    dispatch_once(&sharedInstance_onceToken_0, block);
  }
  v2 = (void *)sharedInstance_sharedInstance_0;

  return v2;
}

uint64_t __41__CCSControlCenterService_sharedInstance__block_invoke(uint64_t a1)
{
  sharedInstance_sharedInstance_0 = [objc_alloc(*(Class *)(a1 + 32)) _init];

  return MEMORY[0x270F9A758]();
}

- (id)_init
{
  v6.receiver = self;
  v6.super_class = (Class)CCSControlCenterService;
  v2 = [(CCSControlCenterService *)&v6 init];
  if (v2)
  {
    v3 = objc_alloc_init(CCSRemoteServiceConnection);
    connection = v2->_connection;
    v2->_connection = v3;
  }
  return v2;
}

- (void)requestAvailableModuleIdentifiersWithCompletionHandler:(id)a3
{
}

- (void)getEnabledStateOfModuleWithIdentifier:(id)a3 completionHandler:(id)a4
{
}

- (void)requestEnableModuleWithIdentifier:(id)a3 completionHandler:(id)a4
{
}

- (void)requestEnableModuleWithIdentifier:(id)a3 force:(BOOL)a4 completionHandler:(id)a5
{
}

- (void)requestDisableModuleWithIdentifier:(id)a3 completionHandler:(id)a4
{
}

- (void)presentModuleWithIdentifier:(id)a3 options:(id)a4 completionHandler:(id)a5
{
}

- (void)handleIconElementRequest:(id)a3 completionHandler:(id)a4
{
}

- (void)handleControlCenterOperationType:(int64_t)a3 completionHandler:(id)a4
{
}

- (void)requestIconElementState:(id)a3 completionHandler:(id)a4
{
}

- (void)resetToDefaultLayoutWithCompletionHandler:(id)a3
{
}

- (void).cxx_destruct
{
}

@end