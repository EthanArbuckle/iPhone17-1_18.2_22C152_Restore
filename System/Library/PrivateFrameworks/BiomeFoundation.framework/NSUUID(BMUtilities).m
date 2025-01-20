@interface NSUUID(BMUtilities)
+ (id)bm_bootSessionUUID;
@end

@implementation NSUUID(BMUtilities)

+ (id)bm_bootSessionUUID
{
  if (bm_bootSessionUUID_onceToken != -1) {
    dispatch_once(&bm_bootSessionUUID_onceToken, &__block_literal_global_12);
  }
  v0 = (void *)bm_bootSessionUUID__bootSessionUUID;
  return v0;
}

@end