@interface SearchUIDetailedRowCardSectionViewAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)isAccessibilityElement;
- (CGPoint)accessibilityActivationPoint;
- (id)_accessibilitySupplementaryFooterViews;
- (id)_axGetToggleSwitch;
- (id)accessibilityLabel;
- (id)accessibilityValue;
- (id)automationCustomProperties;
- (unint64_t)accessibilityTraits;
@end

@implementation SearchUIDetailedRowCardSectionViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"SearchUIDetailedRowCardSectionView";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"SearchUIDetailedView", @"detailsView", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"SearchUIDetailedView", @"innerContainer", "@", 0);
  [v3 validateClass:@"TLKAuxilliaryTextView"];
  [v3 validateClass:@"SearchUIDetailedRowCardSectionView" isKindOfClass:@"SearchUICardSectionView"];
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"SearchUICardSectionView", @"contentView", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"SearchUIDetailedRowCardSectionView", @"updateWithRowModel:", "v", "@", 0);
  [v3 validateClass:@"SearchUIButtonItemView"];
}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (id)_accessibilitySupplementaryFooterViews
{
  return (id)[(SearchUIDetailedRowCardSectionViewAccessibility *)self _accessibilityFindSubviewDescendantsPassingTest:&__block_literal_global_10];
}

uint64_t __89__SearchUIDetailedRowCardSectionViewAccessibility__accessibilitySupplementaryFooterViews__block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  NSClassFromString(&cfstr_Searchuibutton_1.isa);
  if ((objc_opt_isKindOfClass() & 1) != 0
    || (NSClassFromString(&cfstr_Cnactionview.isa), (objc_opt_isKindOfClass() & 1) != 0)
    || (NSClassFromString(&cfstr_Tlkstorebutton.isa), (objc_opt_isKindOfClass() & 1) != 0))
  {
    char isKindOfClass = 1;
  }
  else
  {
    NSClassFromString(&cfstr_Ascofferbutton.isa);
    char isKindOfClass = objc_opt_isKindOfClass();
  }
  NSClassFromString(&cfstr_Ascofferbutton.isa);
  if (objc_opt_isKindOfClass())
  {
    v4 = [v2 safeValueForKey:@"titleLabel"];
    [v4 accessibilityFrame];
    CGFloat v6 = v5;
    CGFloat v8 = v7;
    CGFloat v10 = v9;
    CGFloat v12 = v11;
    v13 = [v2 safeValueForKey:@"imageView"];
    [v13 accessibilityFrame];
    v42.origin.double x = v14;
    v42.origin.double y = v15;
    v42.size.double width = v16;
    v42.size.double height = v17;
    v38.origin.double x = v6;
    v38.origin.double y = v8;
    v38.size.double width = v10;
    v38.size.double height = v12;
    CGRect v39 = CGRectUnion(v38, v42);
    double x = v39.origin.x;
    double y = v39.origin.y;
    double width = v39.size.width;
    double height = v39.size.height;

    v22 = [v2 safeValueForKey:@"subtitleLabel"];
    if ([v22 _accessibilityViewIsVisible])
    {
      [v22 accessibilityFrame];
      v43.origin.double x = v23;
      v43.origin.double y = v24;
      v43.size.double width = v25;
      v43.size.double height = v26;
      v40.origin.double x = x;
      v40.origin.double y = y;
      v40.size.double width = width;
      v40.size.double height = height;
      CGRect v41 = CGRectUnion(v40, v43);
      double x = v41.origin.x;
      double y = v41.origin.y;
      double width = v41.size.width;
      double height = v41.size.height;
      v27 = objc_msgSend(MEMORY[0x263F1C478], "bezierPathWithRoundedRect:cornerRadius:");
      [v27 bounds];
      AX_CGRectGetCenter();
      double v29 = v28;
      double v31 = v30;
      CGAffineTransformMakeScale(&v37, 1.3, 1.3);
      [v27 applyTransform:&v37];
      [v27 bounds];
      AX_CGRectGetCenter();
      CGAffineTransformMakeTranslation(&v36, v29 - v32, v31 - v33);
      [v27 applyTransform:&v36];
    }
    else
    {
      v27 = objc_msgSend(MEMORY[0x263F1C478], "bezierPathWithRoundedRect:cornerRadius:", x, y, width, height, 10.0);
    }
    [v2 setAccessibilityPath:v27];

    objc_msgSend(v2, "setAccessibilityFrame:", x, y, width, height);
  }
  if ((isKindOfClass & 1) != 0 && [v2 isAccessibilityElement]) {
    uint64_t v34 = [v2 _accessibilityViewIsVisible];
  }
  else {
    uint64_t v34 = 0;
  }

  return v34;
}

- (id)accessibilityLabel
{
  id v3 = [(SearchUIDetailedRowCardSectionViewAccessibility *)self safeValueForKey:@"contentView"];
  v4 = [v3 safeValueForKey:@"innerContainer"];
  double v5 = [v4 _accessibilityFindSubviewDescendantsPassingTest:&__block_literal_global_318];

  CGFloat v6 = [(SearchUIDetailedRowCardSectionViewAccessibility *)self safeValueForKey:@"contentView"];
  double v7 = [v6 safeUIViewForKey:@"detailsView"];

  CGFloat v8 = [(SearchUIDetailedRowCardSectionViewAccessibility *)self _accessibilityValueForKey:*MEMORY[0x263EFFB68]];
  double v9 = [v7 accessibilityLabel];
  CGFloat v10 = [v7 accessibilityValue];
  v13 = MEMORY[0x24565F960](v5);
  double v11 = __UIAXStringForVariables();

  return v11;
}

uint64_t __69__SearchUIDetailedRowCardSectionViewAccessibility_accessibilityLabel__block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  NSClassFromString(&cfstr_Tlkauxilliaryt.isa);
  char isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

- (id)accessibilityValue
{
  id v3 = [(SearchUIDetailedRowCardSectionViewAccessibility *)self _axGetToggleSwitch];
  v4 = v3;
  if (v3)
  {
    uint64_t v5 = [v3 accessibilityValue];
  }
  else
  {
    v8.receiver = self;
    v8.super_class = (Class)SearchUIDetailedRowCardSectionViewAccessibility;
    uint64_t v5 = [(SearchUIDetailedRowCardSectionViewAccessibility *)&v8 accessibilityValue];
  }
  CGFloat v6 = (void *)v5;

  return v6;
}

- (CGPoint)accessibilityActivationPoint
{
  id v3 = [(SearchUIDetailedRowCardSectionViewAccessibility *)self _axGetToggleSwitch];
  v4 = v3;
  if (v3)
  {
    [v3 accessibilityActivationPoint];
  }
  else
  {
    v11.receiver = self;
    v11.super_class = (Class)SearchUIDetailedRowCardSectionViewAccessibility;
    [(SearchUIDetailedRowCardSectionViewAccessibility *)&v11 accessibilityActivationPoint];
  }
  double v7 = v5;
  double v8 = v6;

  double v9 = v7;
  double v10 = v8;
  result.double y = v10;
  result.double x = v9;
  return result;
}

- (unint64_t)accessibilityTraits
{
  id v3 = [(SearchUIDetailedRowCardSectionViewAccessibility *)self _axGetToggleSwitch];

  if (v3) {
    return *MEMORY[0x263F1CF60];
  }
  v5.receiver = self;
  v5.super_class = (Class)SearchUIDetailedRowCardSectionViewAccessibility;
  return [(SearchUIDetailedRowCardSectionViewAccessibility *)&v5 accessibilityTraits];
}

- (id)automationCustomProperties
{
  v13[2] = *MEMORY[0x263EF8340];
  id v2 = [(SearchUIDetailedRowCardSectionViewAccessibility *)self safeValueForKey:@"contentView"];
  id v3 = [v2 safeUIViewForKey:@"detailsView"];

  v12[0] = @"Title";
  uint64_t v4 = [v3 accessibilityLabel];
  objc_super v5 = (void *)v4;
  if (v4) {
    double v6 = (__CFString *)v4;
  }
  else {
    double v6 = &stru_26F7AC440;
  }
  v12[1] = @"Subtitle";
  v13[0] = v6;
  uint64_t v7 = [v3 accessibilityValue];
  double v8 = (void *)v7;
  if (v7) {
    double v9 = (__CFString *)v7;
  }
  else {
    double v9 = &stru_26F7AC440;
  }
  v13[1] = v9;
  double v10 = [NSDictionary dictionaryWithObjects:v13 forKeys:v12 count:2];

  return v10;
}

- (id)_axGetToggleSwitch
{
  id v2 = [(SearchUIDetailedRowCardSectionViewAccessibility *)self safeValueForKey:@"contentView"];
  id v3 = [v2 _accessibilityFindSubviewDescendant:&__block_literal_global_339];

  return v3;
}

uint64_t __69__SearchUIDetailedRowCardSectionViewAccessibility__axGetToggleSwitch__block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    uint64_t v3 = [v2 _accessibilityViewIsVisible];
  }
  else {
    uint64_t v3 = 0;
  }

  return v3;
}

@end