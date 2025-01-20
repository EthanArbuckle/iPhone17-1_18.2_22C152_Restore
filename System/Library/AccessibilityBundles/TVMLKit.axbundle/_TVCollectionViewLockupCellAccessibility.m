@interface _TVCollectionViewLockupCellAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (CGRect)_accessibilityFocusableFrameForZoom;
- (id)_accessibilityFrameDelegate;
- (id)accessibilityLabel;
@end

@implementation _TVCollectionViewLockupCellAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"_TVCollectionViewLockupCell";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  [v3 validateClass:@"_TVListTemplateView"];
  [v3 validateClass:@"_TVStackingPosterView"];
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"_TVListTemplateView", @"listView", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"_TVStackingPosterView", @"animatedLabel", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"UICollectionViewCell", @"contentView", "@", 0);
}

- (id)_accessibilityFrameDelegate
{
  char v11 = 0;
  objc_opt_class();
  id v3 = [(_TVCollectionViewLockupCellAccessibility *)self safeValueForKey:@"contentView"];
  v4 = __UIAccessibilityCastAsClass();

  v5 = [v4 subviews];
  uint64_t v6 = [v5 count];

  if (v6 == 1)
  {
    v7 = [v4 subviews];
    v8 = [v7 firstObject];
  }
  else
  {
    v10.receiver = self;
    v10.super_class = (Class)_TVCollectionViewLockupCellAccessibility;
    v8 = [(_TVCollectionViewLockupCellAccessibility *)&v10 _accessibilityFrameDelegate];
  }

  return v8;
}

- (CGRect)_accessibilityFocusableFrameForZoom
{
  id v3 = [(_TVCollectionViewLockupCellAccessibility *)self safeValueForKey:@"contentView"];
  char v28 = 0;
  objc_opt_class();
  v4 = [v3 safeValueForKey:@"subviews"];
  v5 = __UIAccessibilityCastAsClass();

  uint64_t v6 = [v5 axFilterObjectsUsingBlock:&__block_literal_global_2];
  v7 = [v6 firstObject];

  v8 = [v7 safeValueForKey:@"animatedLabel"];
  v9 = v8;
  if (!v8) {
    goto LABEL_3;
  }
  objc_super v10 = [v8 safeValueForKey:@"layer"];
  [v10 accessibilityFrame];
  CGFloat v12 = v11;
  CGFloat v14 = v13;
  CGFloat v16 = v15;
  CGFloat v18 = v17;

  v29.origin.x = v12;
  v29.origin.y = v14;
  v29.size.width = v16;
  v29.size.height = v18;
  if (CGRectIsEmpty(v29))
  {
LABEL_3:
    v27.receiver = self;
    v27.super_class = (Class)_TVCollectionViewLockupCellAccessibility;
    [(_TVCollectionViewLockupCellAccessibility *)&v27 _accessibilityFocusableFrameForZoom];
    CGFloat v12 = v19;
    CGFloat v14 = v20;
    CGFloat v16 = v21;
    CGFloat v18 = v22;
  }

  double v23 = v12;
  double v24 = v14;
  double v25 = v16;
  double v26 = v18;
  result.size.height = v26;
  result.size.width = v25;
  result.origin.y = v24;
  result.origin.x = v23;
  return result;
}

- (id)accessibilityLabel
{
  id v3 = [(_TVCollectionViewLockupCellAccessibility *)self _atvaccessibilityITMLAccessibilityContent];
  objc_opt_class();
  v4 = [(_TVCollectionViewLockupCellAccessibility *)self safeValueForKey:@"contentView"];
  v5 = __UIAccessibilityCastAsClass();

  char v15 = 0;
  objc_opt_class();
  uint64_t v6 = [v5 subviews];
  v7 = __UIAccessibilityCastAsClass();

  v8 = [v7 axFilterObjectsUsingBlock:&__block_literal_global_303];
  v9 = [v8 firstObject];

  if (v9)
  {
    objc_super v10 = [v9 _accessibilityLabelIncludingFallbackPlaceholder:0 usesSubviewsForComponents:1];
  }
  else
  {
    objc_super v10 = 0;
  }
  if (![v10 length])
  {
    v14.receiver = self;
    v14.super_class = (Class)_TVCollectionViewLockupCellAccessibility;
    uint64_t v11 = [(_TVCollectionViewLockupCellAccessibility *)&v14 accessibilityLabel];

    objc_super v10 = (void *)v11;
  }
  CGFloat v12 = [MEMORY[0x263F22278] textByReconcilingClientText:v10 withServerText:v3];

  return v12;
}

@end