@interface GEOUsageManager
+ (id)sharedManager;
@end

@implementation GEOUsageManager

+ (id)sharedManager
{
  if (qword_1EB29FCD0 != -1) {
    dispatch_once(&qword_1EB29FCD0, &__block_literal_global_100);
  }
  v2 = (void *)_MergedGlobals_249;

  return v2;
}

void __32__GEOUsageManager_sharedManager__block_invoke()
{
  v0 = objc_alloc_init(GEOUsageManager);
  v1 = (void *)_MergedGlobals_249;
  _MergedGlobals_249 = (uint64_t)v0;
}

@end