@interface AXInvertColors_AccountsUI
+ (int64_t)helperType;
+ (void)installCategories:(id)a3;
+ (void)performValidations:(id)a3;
@end

@implementation AXInvertColors_AccountsUI

+ (void)performValidations:(id)a3
{
  id v3 = a3;
  [v3 validateClass:@"ACUIAddAccountViewController"];
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"ACUIAddAccountViewController", @"_specifierForAOLAccount", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"ACUIAddAccountViewController", @"_specifierForiCloudAccount", "@", 0);
}

+ (void)installCategories:(id)a3
{
}

+ (int64_t)helperType
{
  return 1;
}

@end