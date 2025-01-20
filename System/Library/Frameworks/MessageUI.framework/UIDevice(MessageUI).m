@interface UIDevice(MessageUI)
+ (uint64_t)mf_isPad;
+ (uint64_t)mf_isSmallPhone;
@end

@implementation UIDevice(MessageUI)

+ (uint64_t)mf_isPad
{
  if (mf_isPad_onceToken != -1) {
    dispatch_once(&mf_isPad_onceToken, &__block_literal_global_39);
  }
  return mf_isPad_isPad;
}

+ (uint64_t)mf_isSmallPhone
{
  unsigned int v0 = MGGetSInt32Answer();
  return (v0 < 6) & (0x26u >> v0);
}

@end