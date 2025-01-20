@interface AXMemoriesSlider
- (CGRect)accessibilityFrame;
- (NSString)selectedDescription;
- (id)_accessibilityUserTestingElementBaseType;
- (id)_axContainingCollectionView;
- (id)accessibilityLabel;
- (int64_t)_axContainingSelectedItem;
- (int64_t)sliderType;
- (unint64_t)accessibilityTraits;
- (void)accessibilityDecrement;
- (void)accessibilityIncrement;
- (void)setSelectedDescription:(id)a3;
- (void)setSliderType:(int64_t)a3;
@end

@implementation AXMemoriesSlider

- (void)setSelectedDescription:(id)a3
{
  id v6 = a3;
  if ([v6 isEqualToString:@"●"])
  {
    accessibilityMemoriesLocalizedString(@"slider.value.neutral");
    v4 = (NSString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v4 = (NSString *)v6;
  }
  selectedDescription = self->_selectedDescription;
  self->_selectedDescription = v4;
}

- (id)accessibilityLabel
{
  int64_t v2 = [(AXMemoriesSlider *)self sliderType];
  if (!v2)
  {
    v3 = @"slider.description.mood";
    goto LABEL_5;
  }
  if (v2 == 1)
  {
    v3 = @"slider.description.duration";
LABEL_5:
    v4 = accessibilityMemoriesLocalizedString(v3);
    goto LABEL_7;
  }
  v4 = 0;
LABEL_7:

  return v4;
}

- (id)_axContainingCollectionView
{
  int64_t v2 = (void *)MEMORY[0x263F1CB68];
  v3 = [(AXMemoriesSlider *)self accessibilityContainer];
  v4 = [v2 viewControllerForView:v3];

  objc_opt_class();
  v5 = [v4 safeValueForKey:@"collectionView"];
  id v6 = __UIAccessibilityCastAsClass();

  return v6;
}

- (int64_t)_axContainingSelectedItem
{
  int64_t v2 = (void *)MEMORY[0x263F1CB68];
  v3 = [(AXMemoriesSlider *)self accessibilityContainer];
  v4 = [v2 viewControllerForView:v3];

  int64_t v5 = [v4 safeIntegerForKey:@"selectedItem"];
  return v5;
}

- (void)accessibilityIncrement
{
  id v5 = [(AXMemoriesSlider *)self _axContainingCollectionView];
  uint64_t v3 = [(AXMemoriesSlider *)self _axContainingSelectedItem];
  if (v3 < [v5 numberOfItemsInSection:0] - 1)
  {
    v4 = [MEMORY[0x263F088C8] indexPathForItem:v3 + 1 inSection:0];
    [v5 scrollToItemAtIndexPath:v4 atScrollPosition:16 animated:1];
  }
}

- (void)accessibilityDecrement
{
  id v5 = [(AXMemoriesSlider *)self _axContainingCollectionView];
  uint64_t v3 = [(AXMemoriesSlider *)self _axContainingSelectedItem];
  if (v3 >= 1)
  {
    v4 = [MEMORY[0x263F088C8] indexPathForItem:v3 - 1 inSection:0];
    [v5 scrollToItemAtIndexPath:v4 atScrollPosition:16 animated:1];
  }
}

- (CGRect)accessibilityFrame
{
  uint64_t v3 = [(AXMemoriesSlider *)self _axContainingCollectionView];
  v4 = [(AXMemoriesSlider *)self accessibilityContainer];
  [v3 frame];
  UIAccessibilityFrameForBounds();
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  double v12 = v11;

  double v13 = v6;
  double v14 = v8;
  double v15 = v10;
  double v16 = v12;
  result.size.height = v16;
  result.size.width = v15;
  result.origin.y = v14;
  result.origin.x = v13;
  return result;
}

- (unint64_t)accessibilityTraits
{
  return *MEMORY[0x263F1CED8];
}

- (id)_accessibilityUserTestingElementBaseType
{
  int64_t v2 = objc_opt_class();

  return (id)[v2 description];
}

- (int64_t)sliderType
{
  return self->_sliderType;
}

- (void)setSliderType:(int64_t)a3
{
  self->_sliderType = a3;
}

- (NSString)selectedDescription
{
  return self->_selectedDescription;
}

- (void).cxx_destruct
{
}

@end