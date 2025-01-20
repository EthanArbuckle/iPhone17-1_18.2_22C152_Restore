@interface BuddyAccessibilityUtilitiesAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)navigationBarButton;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
@end

@implementation BuddyAccessibilityUtilitiesAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"BuddyAccessibilityUtilities";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
}

+ (id)navigationBarButton
{
  v5.receiver = a1;
  v5.super_class = (Class)&OBJC_METACLASS___BuddyAccessibilityUtilitiesAccessibility;
  v2 = objc_msgSendSuper2(&v5, sel_navigationBarButton);
  v3 = accessibilityLocalizedString(@"accessibility.button.title");
  [v2 setAccessibilityLabel:v3];

  return v2;
}

@end