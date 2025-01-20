@interface PUCropHandleViewAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)isAccessibilityElement;
- (id)accessibilityHint;
- (id)accessibilityLabel;
@end

@implementation PUCropHandleViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"PUCropHandleView";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (id)accessibilityLabel
{
  unint64_t v2 = [(PUCropHandleViewAccessibility *)self safeIntegerForKey:@"handle"];
  if (v2 > 7)
  {
    v3 = &stru_26F42F3E0;
  }
  else
  {
    accessibilityPULocalizedString(off_2650A7F48[v2]);
    v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }

  return v3;
}

- (id)accessibilityHint
{
  return accessibilityPULocalizedString(@"image.crop.hint");
}

@end