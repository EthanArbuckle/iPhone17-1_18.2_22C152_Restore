@interface AXCACCustomCommandEditorService
+ (id)sharedInstance;
- (id)sb_initialClassName;
@end

@implementation AXCACCustomCommandEditorService

+ (id)sharedInstance
{
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __49__AXCACCustomCommandEditorService_sharedInstance__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (sharedInstance_onceToken_5 != -1) {
    dispatch_once(&sharedInstance_onceToken_5, block);
  }
  v2 = (void *)sharedInstance_sharedInstance_5;

  return v2;
}

uint64_t __49__AXCACCustomCommandEditorService_sharedInstance__block_invoke(uint64_t a1)
{
  sharedInstance_sharedInstance_5 = (uint64_t)objc_alloc_init(*(Class *)(a1 + 32));

  return MEMORY[0x270F9A758]();
}

- (id)sb_initialClassName
{
  return @"AXCACCustomCommandEditorServiceViewController";
}

@end