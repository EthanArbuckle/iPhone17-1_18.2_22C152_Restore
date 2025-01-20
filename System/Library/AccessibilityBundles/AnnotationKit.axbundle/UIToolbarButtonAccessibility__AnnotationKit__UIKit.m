@interface UIToolbarButtonAccessibility__AnnotationKit__UIKit
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
- (id)accessibilityLabel;
@end

@implementation UIToolbarButtonAccessibility__AnnotationKit__UIKit

+ (id)safeCategoryTargetClassName
{
  return @"UIToolbarButton";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (id)accessibilityLabel
{
  char v12 = 0;
  objc_opt_class();
  v3 = __UIAccessibilityCastAsClass();
  v4 = [v3 allTargets];
  v5 = [v4 anyObject];
  uint64_t v6 = [v5 safeIntegerForKey:@"tag"];

  v11.receiver = self;
  v11.super_class = (Class)UIToolbarButtonAccessibility__AnnotationKit__UIKit;
  v7 = [(UIToolbarButtonAccessibility__AnnotationKit__UIKit *)&v11 accessibilityLabel];
  uint64_t v8 = v6 - 764014;
  if (unint64_t)(v6 - 764014) <= 6 && ((0x77u >> v8))
  {
    uint64_t v9 = accessibilityLocalizedString(off_265104160[v8]);

    v7 = (void *)v9;
  }

  return v7;
}

@end