@interface ThumbnailImageViewAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)_axIsDownloaded;
- (BOOL)isAccessibilityElement;
- (id)accessibilityLabel;
- (id)accessibilityValue;
- (unint64_t)accessibilityTraits;
- (void)setItem:(id)a3;
@end

@implementation ThumbnailImageViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"ThumbnailImageView";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"ThumbnailImageView", @"item", "@", 0);
  [v3 validateClass:@"DRItem"];
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"DRItem", @"thumbnail", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"DRItem", @"isDownloaded", "B", 0);
}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (id)accessibilityLabel
{
  return accessibilityLocalizedString(@"thumbnailview.label");
}

- (id)accessibilityValue
{
  if ([(ThumbnailImageViewAccessibility *)self _axIsDownloaded])
  {
    v2 = 0;
  }
  else
  {
    v2 = accessibilityLocalizedString(@"thumbnailview.downloading");
  }

  return v2;
}

- (unint64_t)accessibilityTraits
{
  v7.receiver = self;
  v7.super_class = (Class)ThumbnailImageViewAccessibility;
  unint64_t v3 = *MEMORY[0x263F1CF00] | [(ThumbnailImageViewAccessibility *)&v7 accessibilityTraits];
  BOOL v4 = [(ThumbnailImageViewAccessibility *)self _axIsDownloaded];
  uint64_t v5 = *MEMORY[0x263F1CF68];
  if (v4) {
    uint64_t v5 = 0;
  }
  return v3 | v5;
}

- (void)setItem:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)ThumbnailImageViewAccessibility;
  [(ThumbnailImageViewAccessibility *)&v9 setItem:v4];
  objc_opt_class();
  uint64_t v5 = [v4 safeValueForKey:@"thumbnail"];
  v6 = __UIAccessibilityCastAsClass();

  if (v6)
  {
    [v6 CGImage];
    objc_super v7 = UIAXPhotoDescriptionString();
    v8 = __UIAXStringForVariables();
    [(ThumbnailImageViewAccessibility *)self setAccessibilityHint:v8, @"__AXStringForVariablesSentinel"];
  }
  else
  {
    [(ThumbnailImageViewAccessibility *)self setAccessibilityHint:0];
  }
}

- (BOOL)_axIsDownloaded
{
  v2 = [(ThumbnailImageViewAccessibility *)self safeValueForKey:@"item"];
  char v3 = [v2 safeBoolForKey:@"isDownloaded"];

  return v3;
}

@end