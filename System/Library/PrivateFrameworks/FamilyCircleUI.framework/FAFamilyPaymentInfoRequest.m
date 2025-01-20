@interface FAFamilyPaymentInfoRequest
+ (Class)responseClass;
- (id)urlString;
@end

@implementation FAFamilyPaymentInfoRequest

+ (Class)responseClass
{
  return (Class)objc_opt_class();
}

- (id)urlString
{
  v2 = [MEMORY[0x263F259C0] urlConfiguration];
  v3 = [v2 familyPaymentInfoURL];

  return v3;
}

@end