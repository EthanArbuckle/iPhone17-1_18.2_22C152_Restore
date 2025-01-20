@interface SearchUITrailerViewAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)accessibilityRespondsToUserInteraction;
- (BOOL)isAccessibilityElement;
- (SearchUITrailerViewAccessibility)initWithMediaItem:(id)a3 cardSectionView:(id)a4;
- (id)accessibilityHint;
- (id)accessibilityLabel;
- (unint64_t)accessibilityTraits;
- (void)_accessibilityLoadAccessibilityInformation;
@end

@implementation SearchUITrailerViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"SearchUITrailerView";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"SearchUITrailerView", @"titleLabel", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"SearchUITrailerView", @"playButton", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"SearchUITrailerView", @"initWithMediaItem: cardSectionView:", "@", "@", "@", 0);
}

- (void)_accessibilityLoadAccessibilityInformation
{
  v5.receiver = self;
  v5.super_class = (Class)SearchUITrailerViewAccessibility;
  [(SearchUITrailerViewAccessibility *)&v5 _accessibilityLoadAccessibilityInformation];
  id v3 = [(SearchUITrailerViewAccessibility *)self safeValueForKey:@"playButton"];
  [v3 setIsAccessibilityElement:0];

  v4 = [(SearchUITrailerViewAccessibility *)self safeValueForKey:@"titleLabel"];
  [v4 setIsAccessibilityElement:0];
}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (BOOL)accessibilityRespondsToUserInteraction
{
  return 1;
}

- (id)accessibilityLabel
{
  v2 = [(SearchUITrailerViewAccessibility *)self safeValueForKey:@"titleLabel"];
  id v3 = [v2 accessibilityLabel];

  return v3;
}

- (id)accessibilityHint
{
  return accessibilityLocalizedString(@"movie.trailer.play.hint");
}

- (unint64_t)accessibilityTraits
{
  v3.receiver = self;
  v3.super_class = (Class)SearchUITrailerViewAccessibility;
  return *MEMORY[0x263F1CEE8] | [(SearchUITrailerViewAccessibility *)&v3 accessibilityTraits];
}

- (SearchUITrailerViewAccessibility)initWithMediaItem:(id)a3 cardSectionView:(id)a4
{
  v7.receiver = self;
  v7.super_class = (Class)SearchUITrailerViewAccessibility;
  v4 = [(SearchUITrailerViewAccessibility *)&v7 initWithMediaItem:a3 cardSectionView:a4];
  objc_super v5 = v4;
  if (v4) {
    [(SearchUITrailerViewAccessibility *)v4 _accessibilityLoadAccessibilityInformation];
  }
  return v5;
}

@end