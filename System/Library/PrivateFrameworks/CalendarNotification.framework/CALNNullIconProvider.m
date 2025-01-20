@interface CALNNullIconProvider
+ (CALNNullIconProvider)sharedInstance;
- (id)identifierForIconWithDate:(id)a3 inCalendar:(id)a4;
- (id)pngDataForIconWithIdentifier:(id)a3;
@end

@implementation CALNNullIconProvider

+ (CALNNullIconProvider)sharedInstance
{
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __38__CALNNullIconProvider_sharedInstance__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (sharedInstance_onceToken != -1) {
    dispatch_once(&sharedInstance_onceToken, block);
  }
  v2 = (void *)sharedInstance_sharedInstance;
  return (CALNNullIconProvider *)v2;
}

uint64_t __38__CALNNullIconProvider_sharedInstance__block_invoke()
{
  sharedInstance_sharedInstance = objc_opt_new();
  return MEMORY[0x270F9A758]();
}

- (id)pngDataForIconWithIdentifier:(id)a3
{
  return 0;
}

- (id)identifierForIconWithDate:(id)a3 inCalendar:(id)a4
{
  return &stru_26D3B3198;
}

@end