@interface HMDCoreDataTransformerNSTimeZone
+ (Class)transformedValueClass;
@end

@implementation HMDCoreDataTransformerNSTimeZone

+ (Class)transformedValueClass
{
  return (Class)objc_opt_class();
}

@end