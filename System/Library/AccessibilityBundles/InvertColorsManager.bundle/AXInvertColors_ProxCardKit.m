@interface AXInvertColors_ProxCardKit
+ (int64_t)helperType;
+ (void)installCategories:(id)a3;
+ (void)performValidations:(id)a3;
@end

@implementation AXInvertColors_ProxCardKit

+ (void)performValidations:(id)a3
{
  id v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"PRXCardBottomTray", @"imageView", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"PRXCardBottomTray", @"setImageView:", "v", "@", 0);
}

+ (void)installCategories:(id)a3
{
}

+ (int64_t)helperType
{
  return 2;
}

@end