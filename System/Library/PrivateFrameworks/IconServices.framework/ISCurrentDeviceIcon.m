@interface ISCurrentDeviceIcon
+ (id)sharedInstance;
- (ISCurrentDeviceIcon)init;
@end

@implementation ISCurrentDeviceIcon

+ (id)sharedInstance
{
  if (sharedInstance_onceToken_63 != -1) {
    dispatch_once(&sharedInstance_onceToken_63, &__block_literal_global_65);
  }
  v2 = (void *)sharedInstance_sharedInstance_62;
  return v2;
}

uint64_t __37__ISCurrentDeviceIcon_sharedInstance__block_invoke()
{
  sharedInstance_sharedInstance_62 = objc_alloc_init(ISCurrentDeviceIcon);
  return MEMORY[0x1F41817F8]();
}

- (ISCurrentDeviceIcon)init
{
  v3 = (void *)_LSCreateDeviceTypeIdentifierWithModelCode();
  v6.receiver = self;
  v6.super_class = (Class)ISCurrentDeviceIcon;
  v4 = [(ISTypeIcon *)&v6 initWithType:v3];

  return v4;
}

@end