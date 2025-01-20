@interface HMDCoreDataTransformerNSPersistentHistoryToken
+ (Class)transformedValueClass;
@end

@implementation HMDCoreDataTransformerNSPersistentHistoryToken

+ (Class)transformedValueClass
{
  return (Class)objc_opt_class();
}

@end