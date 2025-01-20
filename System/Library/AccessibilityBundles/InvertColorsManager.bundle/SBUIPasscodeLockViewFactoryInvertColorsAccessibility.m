@interface SBUIPasscodeLockViewFactoryInvertColorsAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)_passcodeLockViewForStyle:(int)a3 withLightStyle:(BOOL)a4;
+ (id)safeCategoryTargetClassName;
@end

@implementation SBUIPasscodeLockViewFactoryInvertColorsAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"SBUIPasscodeLockViewFactory";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (id)_passcodeLockViewForStyle:(int)a3 withLightStyle:(BOOL)a4
{
  v6.receiver = a1;
  v6.super_class = (Class)&OBJC_METACLASS___SBUIPasscodeLockViewFactoryInvertColorsAccessibility;
  v4 = objc_msgSendSuper2(&v6, "_passcodeLockViewForStyle:withLightStyle:", *(void *)&a3, a4);
  [v4 setAccessibilityIgnoresInvertColors:_AXSInvertColorsEnabledGlobalCached() != 0];

  return v4;
}

@end