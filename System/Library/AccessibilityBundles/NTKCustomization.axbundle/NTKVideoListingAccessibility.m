@interface NTKVideoListingAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (id)accessibilityLabel;
@end

@implementation NTKVideoListingAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"NTKVideoListing";
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
  id v2 = [(NTKVideoListingAccessibility *)self safeIntegerForKey:@"variant"];
  v4 = accessibilityLocalizedString(*(&AccessibilityClockFaceVideoDescription + (void)v2), v3);
  v5 = v4;
  if (!v2) {
    v4 = 0;
  }
  id v6 = v4;

  return v6;
}

@end