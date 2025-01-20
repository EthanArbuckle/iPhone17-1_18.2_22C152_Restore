@interface HomeScreenConfigurationPosterControlContentViewAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (id)accessibilityValue;
@end

@implementation HomeScreenConfigurationPosterControlContentViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"PosterBoard.HomeScreenConfigurationPosterControlContentView";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
}

- (id)accessibilityValue
{
  objc_opt_class();
  v3 = [(HomeScreenConfigurationPosterControlContentViewAccessibility *)self safeSwiftValueForKey:@"primaryImageView"];
  v4 = __UIAccessibilityCastAsClass();

  v5 = [v4 image];
  v6 = [v5 accessibilityIdentifier];
  int v7 = [v6 isEqualToString:@"photo.on.rectangle"];

  if (v7) {
    v8 = @"home.configuration.select.photo.value";
  }
  else {
    v8 = @"home.configuration.lock.screen.poster.value";
  }
  v9 = accessibilityLocalizedString(v8);

  return v9;
}

@end