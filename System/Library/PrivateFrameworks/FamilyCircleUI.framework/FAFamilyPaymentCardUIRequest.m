@interface FAFamilyPaymentCardUIRequest
- (id)urlString;
@end

@implementation FAFamilyPaymentCardUIRequest

- (id)urlString
{
  v2 = [MEMORY[0x263F259C0] urlConfiguration];
  v3 = [v2 familyPaymentCardUIURL];

  return v3;
}

@end