@interface AXInvertColors_StoreKit
+ (int64_t)helperType;
+ (void)installCategories:(id)a3;
+ (void)performValidations:(id)a3;
@end

@implementation AXInvertColors_StoreKit

+ (void)performValidations:(id)a3
{
  id v3 = a3;
  [v3 validateClass:@"SKStoreProductViewController"];
  [v3 validateClass:@"SKStoreProductViewController" isKindOfClass:@"UIViewController"];
}

+ (void)installCategories:(id)a3
{
}

+ (int64_t)helperType
{
  return 1;
}

@end