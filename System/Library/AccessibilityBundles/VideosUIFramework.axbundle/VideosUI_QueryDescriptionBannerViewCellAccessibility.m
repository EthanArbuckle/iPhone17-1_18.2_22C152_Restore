@interface VideosUI_QueryDescriptionBannerViewCellAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)isAccessibilityElement;
- (id)accessibilityLabel;
- (unint64_t)accessibilityTraits;
@end

@implementation VideosUI_QueryDescriptionBannerViewCellAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"VideosUI.QueryDescriptionBannerViewCell";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  [v3 validateClass:@"VideosUI.QueryDescriptionBannerViewCell" hasSwiftField:@"textView" withSwiftType:"Optional<UIView>"];
  [v3 validateClass:@"VideosUI.QueryDescriptionBannerViewCell" hasSwiftField:@"additionalInfoView" withSwiftType:"Optional<UIView>"];
}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (unint64_t)accessibilityTraits
{
  return *MEMORY[0x263F1CEE8];
}

- (id)accessibilityLabel
{
  id v3 = [MEMORY[0x263EFF980] array];
  v4 = [(VideosUI_QueryDescriptionBannerViewCellAccessibility *)self safeSwiftValueForKey:@"textView"];
  v5 = [v4 accessibilityLabel];
  [v3 axSafelyAddObject:v5];

  char v16 = 0;
  objc_opt_class();
  v6 = [(VideosUI_QueryDescriptionBannerViewCellAccessibility *)self safeSwiftValueForKey:@"additionalInfoView"];
  v7 = __UIAccessibilityCastAsClass();

  v8 = [v7 subviews];

  v14[0] = MEMORY[0x263EF8330];
  v14[1] = 3221225472;
  v14[2] = __74__VideosUI_QueryDescriptionBannerViewCellAccessibility_accessibilityLabel__block_invoke;
  v14[3] = &unk_265166450;
  id v9 = v3;
  id v15 = v9;
  [v8 enumerateObjectsUsingBlock:v14];
  if ([v9 count])
  {
    uint64_t v10 = AXLabelForElements();
  }
  else
  {
    v13.receiver = self;
    v13.super_class = (Class)VideosUI_QueryDescriptionBannerViewCellAccessibility;
    uint64_t v10 = [(VideosUI_QueryDescriptionBannerViewCellAccessibility *)&v13 accessibilityLabel];
  }
  v11 = (void *)v10;

  return v11;
}

@end