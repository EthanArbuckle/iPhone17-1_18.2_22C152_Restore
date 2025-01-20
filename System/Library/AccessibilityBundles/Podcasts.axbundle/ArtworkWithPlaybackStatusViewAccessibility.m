@interface ArtworkWithPlaybackStatusViewAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)isAccessibilityElement;
- (id)accessibilityLabel;
- (id)accessibilityValue;
- (unint64_t)accessibilityTraits;
@end

@implementation ArtworkWithPlaybackStatusViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"ShelfKitCollectionViews.ArtworkWithPlaybackStatusView";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
}

- (unint64_t)accessibilityTraits
{
  return *MEMORY[0x263F1CF00];
}

- (id)accessibilityLabel
{
  return accessibilityLocalizedString(@"artwork.view");
}

- (id)accessibilityValue
{
  v3 = NSString;
  v4 = accessibilityLocalizedString(@"playback.progress");
  [(ArtworkWithPlaybackStatusViewAccessibility *)self safeFloatForKey:@"accessibilityProgress"];
  v5 = AXFormatFloatWithPercentage();
  v6 = objc_msgSend(v3, "stringWithFormat:", v4, v5);

  return v6;
}

- (BOOL)isAccessibilityElement
{
  return 1;
}

@end