@interface _UIKBCompatInputViewAccessibility__ChatKit__UIKit
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)accessibilityElementsHidden;
@end

@implementation _UIKBCompatInputViewAccessibility__ChatKit__UIKit

+ (id)safeCategoryTargetClassName
{
  return @"_UIKBCompatInputView";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  [v3 validateClass:@"CKActionMenuWindow"];
  objc_msgSend(v3, "validateClass:hasClassMethod:withFullSignature:", @"CKActionMenuWindow", @"sharedInstance", "@", 0);
}

- (BOOL)accessibilityElementsHidden
{
  objc_opt_class();
  v2 = [NSClassFromString(&cfstr_Ckactionmenuwi.isa) sharedInstance];
  id v3 = __UIAccessibilityCastAsClass();

  LODWORD(v2) = [v3 isHidden] ^ 1;
  return (char)v2;
}

@end