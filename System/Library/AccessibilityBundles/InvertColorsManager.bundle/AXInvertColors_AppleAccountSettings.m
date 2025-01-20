@interface AXInvertColors_AppleAccountSettings
+ (int64_t)helperType;
+ (void)installCategories:(id)a3;
+ (void)performValidations:(id)a3;
@end

@implementation AXInvertColors_AppleAccountSettings

+ (void)performValidations:(id)a3
{
  id v3 = a3;
  [v3 validateClass:@"AAUIDeviceInfoHeaderView" hasInstanceVariable:@"_deviceImageView" withType:"UIImageView"];
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"AAUIDeviceInfoHeaderView", @"_setupSubviews", "v", 0);
}

+ (void)installCategories:(id)a3
{
}

+ (int64_t)helperType
{
  return 4;
}

@end