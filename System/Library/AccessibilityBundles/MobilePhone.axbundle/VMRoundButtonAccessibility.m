@interface VMRoundButtonAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (id)accessibilityLabel;
@end

@implementation VMRoundButtonAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"VMRoundButton";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
}

- (id)accessibilityLabel
{
  unint64_t v2 = [(VMRoundButtonAccessibility *)self safeUnsignedIntegerForKey:@"_type"] - 1;
  if (v2 > 3)
  {
    v3 = 0;
  }
  else
  {
    v3 = accessibilityLocalizedString(off_265134FB0[v2]);
  }

  return v3;
}

@end