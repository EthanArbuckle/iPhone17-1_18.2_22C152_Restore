@interface HMDCoreDataTransformerMPPlaybackArchive
+ (Class)transformedValueClass;
@end

@implementation HMDCoreDataTransformerMPPlaybackArchive

+ (Class)transformedValueClass
{
  return (Class)objc_opt_class();
}

@end