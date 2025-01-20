@interface AXInvertColors_TemplateKit
+ (int64_t)helperType;
+ (void)installCategories:(id)a3;
+ (void)performValidations:(id)a3;
@end

@implementation AXInvertColors_TemplateKit

+ (void)performValidations:(id)a3
{
  id v3 = a3;
  [v3 validateClass:@"TLKIconsView"];
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"TLKDescriptionView", @"imageView", "@", 0);
  [v3 validateClass:@"TLKLabel" isKindOfClass:@"UILabel"];
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"TLKLabel", @"initWithProminence:", "@", "Q", 0);
  [v3 validateClass:@"TLKStoreButton" isKindOfClass:@"UIButton"];
  [v3 validateClass:@"TLKStoreButton" isKindOfClass:@"UIView"];
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"UIView", @"tlk_updateWithCurrentAppearance", "v", 0);
}

+ (void)installCategories:(id)a3
{
  id v3 = a3;
  [v3 installSafeCategory:@"TLKDescriptionViewInvertColorsAccessibility" canInteractWithTargetClass:1];
  [v3 installSafeCategory:@"TLKLabelInvertColorsAccessibility" canInteractWithTargetClass:1];
  [v3 installSafeCategory:@"TLKStoreButtonInvertColorsAccessibility" canInteractWithTargetClass:1];
}

+ (int64_t)helperType
{
  return 1;
}

@end