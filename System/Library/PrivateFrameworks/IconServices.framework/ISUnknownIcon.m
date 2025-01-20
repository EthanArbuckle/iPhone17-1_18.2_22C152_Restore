@interface ISUnknownIcon
+ (id)sharedInstance;
- (ISUnknownIcon)init;
@end

@implementation ISUnknownIcon

+ (id)sharedInstance
{
  if (sharedInstance_onceToken_37 != -1) {
    dispatch_once(&sharedInstance_onceToken_37, &__block_literal_global_39);
  }
  v2 = (void *)sharedInstance_sharedInstance_36;
  return v2;
}

uint64_t __31__ISUnknownIcon_sharedInstance__block_invoke()
{
  sharedInstance_sharedInstance_36 = objc_alloc_init(ISUnknownIcon);
  return MEMORY[0x1F41817F8]();
}

- (ISUnknownIcon)init
{
  uint64_t v2 = *MEMORY[0x1E4F22608];
  v4.receiver = self;
  v4.super_class = (Class)ISUnknownIcon;
  return [(ISTypeIcon *)&v4 initWithType:v2];
}

@end