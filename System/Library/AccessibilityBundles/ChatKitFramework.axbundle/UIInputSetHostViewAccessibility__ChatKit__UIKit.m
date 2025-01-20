@interface UIInputSetHostViewAccessibility__ChatKit__UIKit
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (unint64_t)_accessibilityScannerGroupTraits;
@end

@implementation UIInputSetHostViewAccessibility__ChatKit__UIKit

+ (id)safeCategoryTargetClassName
{
  return @"UIInputSetHostView";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  [v3 validateClass:@"CKKeyboardContentViewController"];
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"UIInputWindowController", @"inputViewSet", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"UIInputViewSet", @"inputView", "@", 0);
}

- (unint64_t)_accessibilityScannerGroupTraits
{
  v10.receiver = self;
  v10.super_class = (Class)UIInputSetHostViewAccessibility__ChatKit__UIKit;
  unint64_t v2 = [(UIInputSetHostViewAccessibility__ChatKit__UIKit *)&v10 _accessibilityScannerGroupTraits];
  if (v2)
  {
    objc_opt_class();
    id v3 = __UIAccessibilityCastAsClass();
    v4 = [v3 _rootInputWindowController];

    v5 = [v4 safeValueForKey:@"inputViewSet"];
    v6 = [v5 safeValueForKey:@"inputView"];

    v7 = [v6 _accessibilityViewController];
    NSClassFromString(&cfstr_Ckkeyboardcont.isa);
    char isKindOfClass = objc_opt_isKindOfClass();

    if (isKindOfClass) {
      v2 &= ~1uLL;
    }
  }
  return v2;
}

@end