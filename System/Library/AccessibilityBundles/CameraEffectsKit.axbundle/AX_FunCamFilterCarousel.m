@interface AX_FunCamFilterCarousel
- (BOOL)accessibilityScroll:(int64_t)a3;
- (BOOL)isAccessibilityElement;
- (CGRect)accessibilityFrameInContainerSpace;
- (id)accessibilityHint;
- (id)accessibilityLabel;
- (id)accessibilityValue;
- (unint64_t)accessibilityTraits;
- (void)accessibilityDecrement;
- (void)accessibilityIncrement;
@end

@implementation AX_FunCamFilterCarousel

- (BOOL)isAccessibilityElement
{
  v2 = [(AX_FunCamFilterCarousel *)self accessibilityContainer];
  char v3 = [v2 safeBoolForKey:@"isDisplayingExpandedLayout"] ^ 1;

  return v3;
}

- (id)accessibilityLabel
{
  return accessibilityLocalizedString(@"filter.carousel");
}

- (id)accessibilityValue
{
  objc_opt_class();
  char v3 = [(AX_FunCamFilterCarousel *)self accessibilityContainer];
  v4 = [v3 safeValueForKey:@"collectionView"];
  v5 = __UIAccessibilityCastAsClass();

  objc_opt_class();
  v6 = [(AX_FunCamFilterCarousel *)self accessibilityContainer];
  v7 = [v6 safeValueForKey:@"indexPathForCenterOfCollectionView"];
  v8 = __UIAccessibilityCastAsClass();

  v9 = [v5 cellForItemAtIndexPath:v8];
  v10 = [v9 accessibilityLabel];

  return v10;
}

- (id)accessibilityHint
{
  objc_opt_class();
  char v3 = [(AX_FunCamFilterCarousel *)self accessibilityContainer];
  v4 = [v3 safeValueForKey:@"collectionView"];
  v5 = __UIAccessibilityCastAsClass();

  objc_opt_class();
  v6 = [(AX_FunCamFilterCarousel *)self accessibilityContainer];
  v7 = [v6 safeValueForKey:@"indexPathForCenterOfCollectionView"];
  v8 = __UIAccessibilityCastAsClass();

  v9 = [v5 cellForItemAtIndexPath:v8];
  v10 = [v9 accessibilityHint];

  return v10;
}

- (unint64_t)accessibilityTraits
{
  v3.receiver = self;
  v3.super_class = (Class)AX_FunCamFilterCarousel;
  return *MEMORY[0x263F1CED8] | [(AX_FunCamFilterCarousel *)&v3 accessibilityTraits];
}

- (void)accessibilityIncrement
{
  objc_super v3 = [(AX_FunCamFilterCarousel *)self accessibilityContainer];
  uint64_t v4 = [v3 safeUnsignedIntegerForKey:@"selectedIndex"];

  v5 = [MEMORY[0x263F088C8] indexPathForItem:v4 + 1 inSection:0];
  v6 = [(AX_FunCamFilterCarousel *)self accessibilityContainer];
  unint64_t v7 = [v6 safeUnsignedIntegerForKey:@"cachedEffectCount"];

  if (([v5 item] & 0x8000000000000000) == 0 && objc_msgSend(v5, "item") < v7)
  {
    objc_opt_class();
    v8 = [(AX_FunCamFilterCarousel *)self accessibilityContainer];
    v9 = [v8 safeValueForKey:@"collectionView"];
    v10 = __UIAccessibilityCastAsClass();

    id v12 = v5;
    id v11 = v10;
    AXPerformSafeBlock();
  }
}

- (void)accessibilityDecrement
{
  objc_super v3 = [(AX_FunCamFilterCarousel *)self accessibilityContainer];
  uint64_t v4 = [v3 safeUnsignedIntegerForKey:@"selectedIndex"];

  v5 = [MEMORY[0x263F088C8] indexPathForItem:v4 - 1 inSection:0];
  v6 = [(AX_FunCamFilterCarousel *)self accessibilityContainer];
  unint64_t v7 = [v6 safeUnsignedIntegerForKey:@"cachedEffectCount"];

  if (([v5 item] & 0x8000000000000000) == 0 && objc_msgSend(v5, "item") < v7)
  {
    objc_opt_class();
    v8 = [(AX_FunCamFilterCarousel *)self accessibilityContainer];
    v9 = [v8 safeValueForKey:@"collectionView"];
    v10 = __UIAccessibilityCastAsClass();

    id v12 = v5;
    id v11 = v10;
    AXPerformSafeBlock();
  }
}

- (BOOL)accessibilityScroll:(int64_t)a3
{
  v5 = [(AX_FunCamFilterCarousel *)self accessibilityContainer];
  v6 = [v5 safeValueForKey:@"collectionView"];

  if (a3 == 1)
  {
    unsigned __int8 v7 = [v6 accessibilityScrollRightPage];
  }
  else if (a3 == 2)
  {
    unsigned __int8 v7 = [v6 accessibilityScrollLeftPage];
  }
  else
  {
    v10.receiver = self;
    v10.super_class = (Class)AX_FunCamFilterCarousel;
    unsigned __int8 v7 = [(AX_FunCamFilterCarousel *)&v10 accessibilityScroll:a3];
  }
  BOOL v8 = v7;

  return v8;
}

- (CGRect)accessibilityFrameInContainerSpace
{
  v2 = [(AX_FunCamFilterCarousel *)self accessibilityContainer];
  [v2 frame];
  double v4 = v3;
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;

  double v11 = v4;
  double v12 = v6;
  double v13 = v8;
  double v14 = v10;
  result.size.height = v14;
  result.size.width = v13;
  result.origin.y = v12;
  result.origin.x = v11;
  return result;
}

@end