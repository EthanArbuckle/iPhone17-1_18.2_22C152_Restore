@interface SBCallAlertDisplayAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)newBottomLockBarForDisplay:(id)a3;
+ (id)safeCategoryTargetClassName;
@end

@implementation SBCallAlertDisplayAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"SBCallAlertDisplay";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (id)newBottomLockBarForDisplay:(id)a3
{
  v6.receiver = a1;
  v6.super_class = (Class)&OBJC_METACLASS___SBCallAlertDisplayAccessibility;
  id v3 = objc_msgSendSuper2(&v6, sel_newBottomLockBarForDisplay_, a3);
  v4 = accessibilityLocalizedString(@"slide.to.answer");
  [v3 setAccessibilityLabel:v4];

  return v3;
}

@end