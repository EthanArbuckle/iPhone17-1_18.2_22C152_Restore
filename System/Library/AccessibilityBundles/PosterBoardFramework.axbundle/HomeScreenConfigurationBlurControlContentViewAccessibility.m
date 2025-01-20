@interface HomeScreenConfigurationBlurControlContentViewAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (id)accessibilityHint;
@end

@implementation HomeScreenConfigurationBlurControlContentViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"PosterBoard.HomeScreenConfigurationBlurControlContentView";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
}

- (id)accessibilityHint
{
  if ([(HomeScreenConfigurationBlurControlContentViewAccessibility *)self safeSwiftBoolForKey:@"isSelected"])
  {
    v5.receiver = self;
    v5.super_class = (Class)HomeScreenConfigurationBlurControlContentViewAccessibility;
    v3 = [(HomeScreenConfigurationBlurControlContentViewAccessibility *)&v5 accessibilityHint];
  }
  else
  {
    v3 = accessibilityLocalizedString(@"home.configuration.blur.hint");
  }

  return v3;
}

@end