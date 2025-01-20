@interface AXInvertColors_SpotlightUIInternal
+ (int64_t)helperType;
+ (void)installCategories:(id)a3;
+ (void)performValidations:(id)a3;
@end

@implementation AXInvertColors_SpotlightUIInternal

+ (void)performValidations:(id)a3
{
  id v3 = a3;
  [v3 validateClass:@"SPUISearchHeader" isKindOfClass:@"UIView"];
  [v3 validateClass:@"SPUISearchHeader" hasProperty:@"cancelButton" withType:"@"];
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"SPUITextField", @"blurView", "@", 0);
  [v3 validateClass:@"SPUIPlatterContainerViewController"];
}

+ (void)installCategories:(id)a3
{
  id v3 = a3;
  [v3 installSafeCategory:@"SPUISearchHeaderInvertColorsAccessibility" canInteractWithTargetClass:1];
  [v3 installSafeCategory:@"SPUITextFieldInvertColorsAccessibility" canInteractWithTargetClass:1];
}

+ (int64_t)helperType
{
  return 1;
}

@end