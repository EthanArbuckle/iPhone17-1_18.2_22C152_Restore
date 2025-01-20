@interface SKUIPreviewProgressIndicatorAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)isAccessibilityElement;
- (id)accessibilityLabel;
- (unint64_t)accessibilityTraits;
@end

@implementation SKUIPreviewProgressIndicatorAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"SKUIPreviewProgressIndicator";
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
  if ([(SKUIPreviewProgressIndicatorAccessibility *)self safeBoolForKey:@"isIndeterminate"])v2 = @"preview.loading.button"; {
  else
  }
    v2 = @"preview.stop.button";
  v3 = accessibilitySKUILocalizedString(v2);

  return v3;
}

- (unint64_t)accessibilityTraits
{
  return *MEMORY[0x263F1CEE8];
}

@end