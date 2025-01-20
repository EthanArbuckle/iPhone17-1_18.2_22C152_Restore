@interface HULinkedApplicationTableViewCellAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)isAccessibilityElement;
- (id)accessibilityHint;
- (id)accessibilityLabel;
- (unint64_t)accessibilityTraits;
@end

@implementation HULinkedApplicationTableViewCellAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"HULinkedApplicationTableViewCell";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"HULinkedApplicationTableViewCell", @"linkedApplicationView", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"HULinkedApplicationView", @"nameLabel", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"HULinkedApplicationView", @"publisherLabel", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"HULinkedApplicationView", @"ratingView", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"HULinkedApplicationRatingView", @"starViews", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"HULinkedApplicationRatingView", @"rating", "d", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"HULinkedApplicationView", @"priceLabel", "@", 0);
}

- (id)accessibilityLabel
{
  v2 = [(HULinkedApplicationTableViewCellAccessibility *)self safeValueForKey:@"linkedApplicationView"];
  id v3 = [v2 safeValueForKey:@"nameLabel"];
  v4 = [v2 safeValueForKey:@"publisherLabel"];
  v5 = [v2 safeValueForKey:@"ratingView"];
  [v5 safeFloatForKey:@"rating"];
  float v7 = v6;
  v8 = [v2 safeValueForKey:@"priceLabel"];
  v9 = [v5 safeValueForKey:@"starViews"];
  objc_opt_class();
  v10 = __UIAccessibilityCastAsClass();
  uint64_t v11 = [v10 count];

  v12 = NSString;
  v13 = accessibilityHomeUILocalizedString(@"manufacturer.app.store.star.rating");
  v14 = objc_msgSend(v12, "localizedStringWithFormat:", v13, v7, v11);

  v15 = objc_msgSend(MEMORY[0x263EFF8C0], "axArrayByIgnoringNilElementsWithCount:", 4, v3, v4, v14, v8);
  v16 = AXLabelForElements();

  return v16;
}

- (unint64_t)accessibilityTraits
{
  v3.receiver = self;
  v3.super_class = (Class)HULinkedApplicationTableViewCellAccessibility;
  return *MEMORY[0x263F1CEE8] | [(HULinkedApplicationTableViewCellAccessibility *)&v3 accessibilityTraits];
}

- (id)accessibilityHint
{
  return accessibilityHomeUILocalizedString(@"manufacturer.app.store.open.hint");
}

- (BOOL)isAccessibilityElement
{
  return 1;
}

@end