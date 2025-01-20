@interface HMDCoreDataTransformerNSDateComponents
+ (Class)transformedValueClass;
@end

@implementation HMDCoreDataTransformerNSDateComponents

+ (Class)transformedValueClass
{
  return (Class)objc_opt_class();
}

@end