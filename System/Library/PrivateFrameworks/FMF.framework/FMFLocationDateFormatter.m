@interface FMFLocationDateFormatter
+ (id)sharedInstance;
@end

@implementation FMFLocationDateFormatter

+ (id)sharedInstance
{
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __42__FMFLocationDateFormatter_sharedInstance__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (sharedInstance_dispatch_predicate_1 != -1) {
    dispatch_once(&sharedInstance_dispatch_predicate_1, block);
  }
  v2 = (void *)sharedInstance_instance;

  return v2;
}

uint64_t __42__FMFLocationDateFormatter_sharedInstance__block_invoke()
{
  id v0 = objc_alloc_init((Class)objc_opt_class());
  v1 = (void *)sharedInstance_instance;
  sharedInstance_instance = (uint64_t)v0;

  v2 = (void *)sharedInstance_instance;

  return [v2 setLocalizedDateFormatFromTemplate:@"H:mm:ss"];
}

@end