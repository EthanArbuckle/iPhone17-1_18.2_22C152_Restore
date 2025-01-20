@interface SearchUIRowCardSectionViewAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)isAccessibilityElement;
- (id)accessibilityLabel;
- (void)_accessibilityLoadAccessibilityInformation;
- (void)_axApplyTrailingImageView:(id)a3;
- (void)updateWithRowModel:(id)a3;
@end

@implementation SearchUIRowCardSectionViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"SearchUIRowCardSectionView";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  [v3 validateClass:@"SearchUIRowCardSectionView" isKindOfClass:@"SearchUICardSectionView"];
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"SearchUICardSectionView", @"section", "@", 0);
  [v3 validateClass:@"SearchUIRowCardSectionView" isKindOfClass:@"SearchUICardSectionView"];
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"SearchUICardSectionView", @"rowModel", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"SearchUICardSectionView", @"contentView", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"TLKSimpleRowView", @"trailingImageView", "@", 0);
}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (id)accessibilityLabel
{
  v2 = [(SearchUIRowCardSectionViewAccessibility *)self _accessibleSubviews];
  id v3 = MEMORY[0x24565F960]();

  return v3;
}

- (void)_accessibilityLoadAccessibilityInformation
{
  v4.receiver = self;
  v4.super_class = (Class)SearchUIRowCardSectionViewAccessibility;
  [(SearchUIRowCardSectionViewAccessibility *)&v4 _accessibilityLoadAccessibilityInformation];
  id v3 = [(SearchUIRowCardSectionViewAccessibility *)self safeValueForKey:@"rowModel"];
  [(SearchUIRowCardSectionViewAccessibility *)self _axApplyTrailingImageView:v3];
}

- (void)_axApplyTrailingImageView:(id)a3
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  id v4 = a3;
  NSClassFromString(&cfstr_Searchuicardse_2.isa);
  if (objc_opt_isKindOfClass())
  {
    v5 = [v4 cardSection];
    v6 = [v5 punchoutOptions];
    v7 = [v6 firstObject];
    v8 = [v7 bundleIdentifier];

    if (!v8)
    {
      v9 = [v5 image];
      NSClassFromString(&cfstr_Sfappiconimage.isa);
      if (objc_opt_isKindOfClass())
      {
        if ([v9 iconType] == 1) {
          v8 = @"web-browser";
        }
        else {
          v8 = 0;
        }
      }
      else
      {
        v8 = 0;
      }
    }
    v10 = [(SearchUIRowCardSectionViewAccessibility *)self safeValueForKey:@"contentView"];
    v11 = [v10 safeUIViewForKey:@"trailingImageView"];

    v12 = AXLogCommon();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      v13 = [(SearchUIRowCardSectionViewAccessibility *)self safeValueForKey:@"contentView"];
      v14 = [(SearchUIRowCardSectionViewAccessibility *)self safeValueForKey:@"contentView"];
      v15 = [v14 safeUIViewForKey:@"trailingImageView"];
      int v16 = 138412546;
      v17 = v13;
      __int16 v18 = 2112;
      v19 = v15;
      _os_log_impl(&dword_2424E1000, v12, OS_LOG_TYPE_DEFAULT, "TRAILER: %@ %@", (uint8_t *)&v16, 0x16u);
    }
    [v11 setIsAccessibilityElement:v11 != 0];
    [v11 setAccessibilityIdentifier:v8];
  }
}

- (void)updateWithRowModel:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)SearchUIRowCardSectionViewAccessibility;
  id v4 = a3;
  [(SearchUIRowCardSectionViewAccessibility *)&v5 updateWithRowModel:v4];
  -[SearchUIRowCardSectionViewAccessibility _axApplyTrailingImageView:](self, "_axApplyTrailingImageView:", v4, v5.receiver, v5.super_class);
}

@end