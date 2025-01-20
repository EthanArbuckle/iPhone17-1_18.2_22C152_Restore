@interface CAMSharedLibraryStatusIndicatorAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (id)_axLabelForSharedLibraryMode:(int64_t)a3;
- (id)accessibilityLabel;
@end

@implementation CAMSharedLibraryStatusIndicatorAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"CAMSharedLibraryStatusIndicator";
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
  uint64_t v3 = [(CAMSharedLibraryStatusIndicatorAccessibility *)self safeIntegerForKey:@"sharedLibraryMode"];

  return [(CAMSharedLibraryStatusIndicatorAccessibility *)self _axLabelForSharedLibraryMode:v3];
}

- (id)_axLabelForSharedLibraryMode:(int64_t)a3
{
  if ((unint64_t)a3 > 5)
  {
    v4 = 0;
  }
  else
  {
    v4 = accessibilityCameraUILocalizedString(off_26509FCB0[a3]);
  }
  return v4;
}

@end