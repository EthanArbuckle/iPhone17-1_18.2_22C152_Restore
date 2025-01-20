@interface DCAccessibility
+ (id)sharedInstance;
- (void)postAnnouncement:(id)a3 withSender:(id)a4 priority:(int64_t)a5;
@end

@implementation DCAccessibility

- (void)postAnnouncement:(id)a3 withSender:(id)a4 priority:(int64_t)a5
{
}

+ (id)sharedInstance
{
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __33__DCAccessibility_sharedInstance__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (sharedInstance__DCAccessibilitySharedInstanceOnceToken != -1) {
    dispatch_once(&sharedInstance__DCAccessibilitySharedInstanceOnceToken, block);
  }
  v2 = (void *)sharedInstance__DCAccessibilitySharedInstance;

  return v2;
}

void __33__DCAccessibility_sharedInstance__block_invoke()
{
  uint64_t v0 = objc_opt_new();
  v1 = (void *)sharedInstance__DCAccessibilitySharedInstance;
  sharedInstance__DCAccessibilitySharedInstance = v0;
}

@end