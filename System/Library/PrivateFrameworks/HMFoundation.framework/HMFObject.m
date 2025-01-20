@interface HMFObject
+ (id)shortDescription;
- (NSString)debugDescription;
- (NSString)privateDescription;
- (NSString)shortDescription;
@end

@implementation HMFObject

- (NSString)privateDescription
{
  if (qword_1EB4EEE18 != -1) {
    dispatch_once(&qword_1EB4EEE18, &__block_literal_global_98);
  }
  char v3 = _MergedGlobals_75 | 2;
  return (NSString *)HMFObjectDescriptionWithOptions(self, v3);
}

+ (id)shortDescription
{
  v2 = (objc_class *)objc_opt_class();
  return NSStringFromClass(v2);
}

- (NSString)shortDescription
{
  v2 = objc_opt_class();
  return (NSString *)[v2 shortDescription];
}

- (NSString)debugDescription
{
  return (NSString *)HMFObjectDescriptionWithOptions(self, 0);
}

@end