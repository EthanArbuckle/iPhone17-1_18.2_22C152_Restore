@interface AXInvertColors_SetupAssistantUI
+ (int64_t)helperType;
+ (void)installCategories:(id)a3;
+ (void)performValidations:(id)a3;
@end

@implementation AXInvertColors_SetupAssistantUI

+ (void)performValidations:(id)a3
{
  id v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"BFFPaneHeaderView", @"setIcon:", "v", "@", 0);
  [v3 validateClass:@"BFFPaneHeaderView" hasInstanceVariable:@"_iconView" withType:"UIImageView"];
}

+ (void)installCategories:(id)a3
{
}

+ (int64_t)helperType
{
  return 1;
}

@end