@interface PKOrderPhysicalCardHeroViewAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)isAccessibilityElement;
- (id)accessibilityLabel;
- (unint64_t)accessibilityTraits;
@end

@implementation PKOrderPhysicalCardHeroViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"PKOrderPhysicalCardHeroView";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"PKOrderPhysicalCardHeroView", @"artworkView", "@", 0);
  [v3 validateClass:@"PKPhysicalCardArtworkView" hasInstanceVariable:@"_nameLabel" withType:"UILabel"];
}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (id)accessibilityLabel
{
  v2 = [(PKOrderPhysicalCardHeroViewAccessibility *)self safeValueForKey:@"artworkView"];
  id v3 = [v2 safeValueForKey:@"_nameLabel"];
  v4 = [v3 accessibilityLabel];

  if ([v4 length])
  {
    v5 = NSString;
    v6 = accessibilityLocalizedString(@"apple.card.for.name");
    v7 = objc_msgSend(v5, "stringWithFormat:", v6, v4);
  }
  else
  {
    v7 = accessibilityLocalizedString(@"apple.card");
  }

  return v7;
}

- (unint64_t)accessibilityTraits
{
  return *MEMORY[0x263F1CF00];
}

@end