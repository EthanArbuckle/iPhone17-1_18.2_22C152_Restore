@interface HKAudiogramSample(HDExtensions)
+ (uint64_t)hd_dataEntityClass;
@end

@implementation HKAudiogramSample(HDExtensions)

+ (uint64_t)hd_dataEntityClass
{
  return objc_opt_class();
}

@end