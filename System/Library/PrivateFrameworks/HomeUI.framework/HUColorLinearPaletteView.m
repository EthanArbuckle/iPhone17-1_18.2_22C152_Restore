@interface HUColorLinearPaletteView
- (BOOL)isUserInteractionActive;
- (CGSize)collectionView:(id)a3 layout:(id)a4 sizeForItemAtIndexPath:(id)a5;
- (HFColorPalette)calibratedColorPalette;
- (HFColorPalette)colorPalette;
- (HFColorPaletteColor)selectedColor;
- (HUColorLinearPaletteView)initWithProfile:(id)a3;
- (HUColorLinearPaletteView)initWithProfile:(id)a3 colorPalette:(id)a4;
- (HUQuickControlColorPaletteViewInteractionDelegate)interactionDelegate;
- (HUQuickControlColorViewProfile)profile;
- (NSIndexPath)prevSelectedColorIndexPath;
- (NSIndexPath)selectedColorIndexPath;
- (UICollectionView)colorSwatchCollectionView;
- (UICollectionViewFlowLayout)collectionViewFlowLayout;
- (UIEdgeInsets)collectionView:(id)a3 layout:(id)a4 insetForSectionAtIndex:(int64_t)a5;
- (UIImpactFeedbackGenerator)impactFeedbackGenerator;
- (UISelectionFeedbackGenerator)selectionFeedbackGenerator;
- (id)collectionView:(id)a3 cellForItemAtIndexPath:(id)a4;
- (id)intrinsicSizeDescriptorForControlSize:(unint64_t)a3;
- (id)value;
- (int64_t)collectionView:(id)a3 numberOfItemsInSection:(int64_t)a4;
- (int64_t)numberOfSectionsInCollectionView:(id)a3;
- (unint64_t)_indexForSelectedColor:(id)a3 includeBias:(BOOL)a4;
- (unint64_t)mode;
- (unint64_t)reachabilityState;
- (void)_actuateImpactTapticFeedback;
- (void)_actuateSelectionTapticFeedback;
- (void)_prepareForTapticFeedback;
- (void)_setColorPalette:(id)a3 notifyDelegate:(BOOL)a4;
- (void)_setSelectedColor:(id)a3 notifyDelegate:(BOOL)a4 selectionChanged:(BOOL)a5;
- (void)_updateCalibratedColorPalette;
- (void)_updateUIForReachabilityState:(unint64_t)a3;
- (void)collectionView:(id)a3 didSelectItemAtIndexPath:(id)a4;
- (void)layoutSubviews;
- (void)setCalibratedColorPalette:(id)a3;
- (void)setCollectionViewFlowLayout:(id)a3;
- (void)setColorPalette:(id)a3;
- (void)setColorSwatchCollectionView:(id)a3;
- (void)setImpactFeedbackGenerator:(id)a3;
- (void)setInteractionDelegate:(id)a3;
- (void)setMode:(unint64_t)a3;
- (void)setPrevSelectedColorIndexPath:(id)a3;
- (void)setProfile:(id)a3;
- (void)setReachabilityState:(unint64_t)a3;
- (void)setSelectedColor:(id)a3;
- (void)setSelectedColorIndexPath:(id)a3;
- (void)setSelectionFeedbackGenerator:(id)a3;
- (void)setUserInteractionActive:(BOOL)a3;
- (void)setValue:(id)a3;
- (void)traitCollectionDidChange:(id)a3;
- (void)updateSelectedColorIndexPathToIndexPath:(id)a3;
@end

@implementation HUColorLinearPaletteView

- (HUColorLinearPaletteView)initWithProfile:(id)a3
{
  v5 = objc_msgSend(MEMORY[0x1E4F28B00], "currentHandler", a3);
  v6 = NSStringFromSelector(sel_initWithProfile_colorPalette_);
  objc_msgSend(v5, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"HUColorLinearPaletteView.m", 52, @"%s is unavailable; use %@ instead",
    "-[HUColorLinearPaletteView initWithProfile:]",
    v6);

  return 0;
}

- (HUColorLinearPaletteView)initWithProfile:(id)a3 colorPalette:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v18.receiver = self;
  v18.super_class = (Class)HUColorLinearPaletteView;
  v9 = [(HUColorLinearPaletteView *)&v18 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_profile, a3);
    v10->_reachabilityState = 0;
    objc_storeStrong((id *)&v10->_colorPalette, a4);
    [(HUColorLinearPaletteView *)v10 _updateCalibratedColorPalette];
    v11 = (UICollectionViewFlowLayout *)objc_alloc_init(MEMORY[0x1E4F42890]);
    collectionViewFlowLayout = v10->_collectionViewFlowLayout;
    v10->_collectionViewFlowLayout = v11;

    [(UICollectionViewFlowLayout *)v10->_collectionViewFlowLayout setMinimumInteritemSpacing:0.0];
    id v13 = objc_alloc(MEMORY[0x1E4F42858]);
    uint64_t v14 = objc_msgSend(v13, "initWithFrame:collectionViewLayout:", v10->_collectionViewFlowLayout, *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
    colorSwatchCollectionView = v10->_colorSwatchCollectionView;
    v10->_colorSwatchCollectionView = (UICollectionView *)v14;

    [(UICollectionView *)v10->_colorSwatchCollectionView registerClass:objc_opt_class() forCellWithReuseIdentifier:@"colorSwatchViewCell"];
    [(UICollectionView *)v10->_colorSwatchCollectionView registerClass:objc_opt_class() forCellWithReuseIdentifier:@"naturalLightSwatchViewCell"];
    [(UICollectionView *)v10->_colorSwatchCollectionView setClipsToBounds:0];
    [(UICollectionView *)v10->_colorSwatchCollectionView setDataSource:v10];
    [(UICollectionView *)v10->_colorSwatchCollectionView setDelegate:v10];
    v16 = [MEMORY[0x1E4F428B8] clearColor];
    [(UICollectionView *)v10->_colorSwatchCollectionView setBackgroundColor:v16];

    [(UICollectionView *)v10->_colorSwatchCollectionView setShowsHorizontalScrollIndicator:0];
    [(UICollectionView *)v10->_colorSwatchCollectionView setShowsVerticalScrollIndicator:0];
    [(HUColorLinearPaletteView *)v10 addSubview:v10->_colorSwatchCollectionView];
    [(HUColorLinearPaletteView *)v10 setClipsToBounds:0];
    [(HUColorLinearPaletteView *)v10 _prepareForTapticFeedback];
  }

  return v10;
}

- (void)setColorPalette:(id)a3
{
}

- (void)_setColorPalette:(id)a3 notifyDelegate:(BOOL)a4
{
  BOOL v4 = a4;
  id v24 = a3;
  char v7 = [(HFColorPalette *)self->_colorPalette isEqual:v24];
  id v8 = v24;
  if ((v7 & 1) == 0)
  {
    v9 = self->_colorPalette;
    objc_storeStrong((id *)&self->_colorPalette, a3);
    [(HUColorLinearPaletteView *)self _updateCalibratedColorPalette];
    v10 = objc_opt_new();
    v11 = [(HFColorPalette *)v9 colors];
    uint64_t v12 = [v11 count];

    if (v12)
    {
      unint64_t v13 = 0;
      do
      {
        uint64_t v14 = [(HFColorPalette *)v9 colors];
        v15 = [v14 objectAtIndexedSubscript:v13];
        v16 = [v24 colors];
        v17 = [v16 objectAtIndexedSubscript:v13];
        char v18 = [v15 isEqual:v17];

        if ((v18 & 1) == 0)
        {
          v19 = [MEMORY[0x1E4F28D58] indexPathForItem:v13 inSection:0];
          objc_msgSend(v10, "na_safeAddObject:", v19);
        }
        ++v13;
        v20 = [(HFColorPalette *)v9 colors];
        unint64_t v21 = [v20 count];
      }
      while (v13 < v21);
    }
    v22 = [(HUColorLinearPaletteView *)self colorSwatchCollectionView];
    [v22 reloadItemsAtIndexPaths:v10];

    id v8 = v24;
    if (v4)
    {
      v23 = [(HUColorLinearPaletteView *)self interactionDelegate];
      [v23 controlView:self colorPaletteDidChange:v24];

      id v8 = v24;
    }
  }
}

- (void)_updateCalibratedColorPalette
{
  v3 = [(HUColorLinearPaletteView *)self profile];
  BOOL v4 = [v3 colorProfile];

  v5 = [(HUColorLinearPaletteView *)self colorPalette];
  if (v4)
  {
    v11 = v5;
    v6 = [(HUColorLinearPaletteView *)self profile];
    char v7 = [v6 colorProfile];
    id v8 = [(HFColorPalette *)v11 colorPaletteByAdjustingForColorProfile:v7];
    calibratedColorPalette = self->_calibratedColorPalette;
    self->_calibratedColorPalette = v8;

    v10 = v11;
  }
  else
  {
    v10 = self->_calibratedColorPalette;
    self->_calibratedColorPalette = v5;
  }
}

- (void)_setSelectedColor:(id)a3 notifyDelegate:(BOOL)a4 selectionChanged:(BOOL)a5
{
  BOOL v5 = a5;
  BOOL v6 = a4;
  [(HUColorLinearPaletteView *)self setSelectedColor:a3];
  id v15 = (id)objc_opt_new();
  id v8 = [(HUColorLinearPaletteView *)self prevSelectedColorIndexPath];
  objc_msgSend(v15, "na_safeAddObject:", v8);

  v9 = [(HUColorLinearPaletteView *)self selectedColorIndexPath];
  objc_msgSend(v15, "na_safeAddObject:", v9);

  v10 = [(HUColorLinearPaletteView *)self colorSwatchCollectionView];
  [v10 reloadItemsAtIndexPaths:v15];

  v11 = [(HUColorLinearPaletteView *)self prevSelectedColorIndexPath];
  int v12 = [v15 containsObject:v11];

  if (v12) {
    [(HUColorLinearPaletteView *)self setPrevSelectedColorIndexPath:0];
  }
  if (v6 && v5)
  {
    unint64_t v13 = [(HUColorLinearPaletteView *)self interactionDelegate];
    uint64_t v14 = [(HUColorLinearPaletteView *)self value];
    [v13 controlView:self valueDidChange:v14];
  }
}

- (unint64_t)_indexForSelectedColor:(id)a3 includeBias:(BOOL)a4
{
  id v5 = a3;
  BOOL v6 = [(HUColorLinearPaletteView *)self calibratedColorPalette];
  char v7 = [v6 colors];
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __63__HUColorLinearPaletteView__indexForSelectedColor_includeBias___block_invoke;
  v12[3] = &unk_1E638AEE8;
  id v13 = v5;
  id v8 = v5;
  v9 = [v7 indexesOfObjectsPassingTest:v12];

  unint64_t v10 = [v9 firstIndex];
  return v10;
}

uint64_t __63__HUColorLinearPaletteView__indexForSelectedColor_includeBias___block_invoke(uint64_t a1, void *a2)
{
  return [a2 isSimilarToColor:*(void *)(a1 + 32)];
}

- (void)updateSelectedColorIndexPathToIndexPath:(id)a3
{
  id v4 = a3;
  id v5 = [(HUColorLinearPaletteView *)self selectedColorIndexPath];
  [(HUColorLinearPaletteView *)self setPrevSelectedColorIndexPath:v5];

  [(HUColorLinearPaletteView *)self setSelectedColorIndexPath:v4];
  id v9 = (id)objc_opt_new();
  BOOL v6 = [(HUColorLinearPaletteView *)self prevSelectedColorIndexPath];
  objc_msgSend(v9, "na_safeAddObject:", v6);

  char v7 = [(HUColorLinearPaletteView *)self selectedColorIndexPath];
  objc_msgSend(v9, "na_safeAddObject:", v7);

  id v8 = [(HUColorLinearPaletteView *)self colorSwatchCollectionView];
  [v8 reloadItemsAtIndexPaths:v9];
}

- (id)intrinsicSizeDescriptorForControlSize:(unint64_t)a3
{
  return +[HUIntrinsicSizeDescriptor descriptorWithAspectRatio:](HUIntrinsicSizeDescriptor, "descriptorWithAspectRatio:", a3, 1.0);
}

- (id)value
{
  v3 = [(HUColorLinearPaletteView *)self selectedColorIndexPath];

  if (v3)
  {
    id v4 = [(HUColorLinearPaletteView *)self calibratedColorPalette];
    id v5 = [v4 colors];
    BOOL v6 = [(HUColorLinearPaletteView *)self selectedColorIndexPath];
    char v7 = objc_msgSend(v5, "objectAtIndexedSubscript:", objc_msgSend(v6, "item"));
  }
  else
  {
    char v7 = 0;
  }

  return v7;
}

- (void)setValue:(id)a3
{
  id v4 = a3;
  uint64_t v5 = objc_opt_class();
  id v6 = v4;
  id v20 = v6;
  if (!v6) {
    goto LABEL_7;
  }
  if (objc_opt_isKindOfClass()) {
    char v7 = v20;
  }
  else {
    char v7 = 0;
  }
  id v8 = v7;
  id v6 = v20;
  id v9 = v20;
  if (!v8)
  {
    unint64_t v10 = [MEMORY[0x1E4F28B00] currentHandler];
    v11 = objc_msgSend(NSString, "stringWithUTF8String:", "id  _Nullable NAAssertCast(Class  _Nonnull __unsafe_unretained, id  _Nonnull __strong)");
    [v10 handleFailureInFunction:v11, @"NSObject+NAAdditions.h", 54, @"Expected class of %@ but was %@", v5, objc_opt_class() file lineNumber description];

    id v6 = v20;
LABEL_7:
    id v9 = 0;
  }

  unint64_t v12 = [(HUColorLinearPaletteView *)self _indexForSelectedColor:v9 includeBias:1];
  id v13 = [(HUColorLinearPaletteView *)self selectedColorIndexPath];

  if (v13)
  {
    uint64_t v14 = [(HUColorLinearPaletteView *)self selectedColorIndexPath];
    uint64_t v15 = [v14 item];
LABEL_12:

    goto LABEL_13;
  }
  uint64_t v15 = 0x7FFFFFFFFFFFFFFFLL;
  if (v12 != 0x7FFFFFFFFFFFFFFFLL)
  {
    uint64_t v14 = [MEMORY[0x1E4F28D58] indexPathForItem:v12 inSection:0];
    [(HUColorLinearPaletteView *)self setSelectedColorIndexPath:v14];
    goto LABEL_12;
  }
LABEL_13:
  v16 = [(HUColorLinearPaletteView *)self selectedColor];
  int v17 = [v9 isEqual:v16];

  char v18 = [(HUColorLinearPaletteView *)self colorPalette];
  v19 = (void *)[v18 mutableCopy];

  if (v12 == 0x7FFFFFFFFFFFFFFFLL && v15 != 0x7FFFFFFFFFFFFFFFLL && ([v9 isNaturalLightColor] & 1) == 0)
  {
    [v19 setColor:v9 atIndex:v15];
    [(HUColorLinearPaletteView *)self _setColorPalette:v19 notifyDelegate:1];
  }
  [(HUColorLinearPaletteView *)self _setSelectedColor:v9 notifyDelegate:0 selectionChanged:v17 ^ 1u];
}

- (void)setReachabilityState:(unint64_t)a3
{
  self->_reachabilityState = a3;
  -[HUColorLinearPaletteView _updateUIForReachabilityState:](self, "_updateUIForReachabilityState:");
}

- (void)_updateUIForReachabilityState:(unint64_t)a3
{
  if (a3 >= 2)
  {
    if (a3 != 2) {
      return;
    }
    id v6 = [(HUColorLinearPaletteView *)self colorSwatchCollectionView];
    [v6 setAlpha:1.0];

    id v7 = [(HUColorLinearPaletteView *)self colorSwatchCollectionView];
    [v7 setUserInteractionEnabled:1];
  }
  else
  {
    id v4 = [(HUColorLinearPaletteView *)self colorSwatchCollectionView];
    [v4 setAlpha:0.5];

    uint64_t v5 = [(HUColorLinearPaletteView *)self colorSwatchCollectionView];
    [v5 setUserInteractionEnabled:0];

    [(HUColorLinearPaletteView *)self setSelectedColor:0];
    id v7 = [(HUColorLinearPaletteView *)self colorSwatchCollectionView];
    [v7 reloadData];
  }
}

- (void)traitCollectionDidChange:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)HUColorLinearPaletteView;
  [(HUColorLinearPaletteView *)&v4 traitCollectionDidChange:a3];
  [(HUColorLinearPaletteView *)self invalidateIntrinsicContentSize];
}

- (void)layoutSubviews
{
  v10.receiver = self;
  v10.super_class = (Class)HUColorLinearPaletteView;
  [(HUColorLinearPaletteView *)&v10 layoutSubviews];
  [(HUColorLinearPaletteView *)self frame];
  double v4 = v3;
  [(HUColorLinearPaletteView *)self frame];
  double v6 = v5;
  id v7 = [(HUColorLinearPaletteView *)self colorSwatchCollectionView];
  objc_msgSend(v7, "setFrame:", 0.0, 0.0, v4, v6);

  double v8 = *(double *)&HUQuickControlPushButtonSmallDiameter;
  id v9 = [(HUColorLinearPaletteView *)self collectionViewFlowLayout];
  objc_msgSend(v9, "setItemSize:", v8, v8);

  [(HUColorLinearPaletteView *)self _updateUIForReachabilityState:[(HUColorLinearPaletteView *)self reachabilityState]];
}

- (void)setUserInteractionActive:(BOOL)a3
{
  if (self->_userInteractionActive != a3)
  {
    BOOL v3 = a3;
    self->_userInteractionActive = a3;
    id v5 = [(HUColorLinearPaletteView *)self interactionDelegate];
    [v5 controlView:self interactionStateDidChange:v3 forFirstTouch:0];
  }
}

- (int64_t)numberOfSectionsInCollectionView:(id)a3
{
  return 1;
}

- (int64_t)collectionView:(id)a3 numberOfItemsInSection:(int64_t)a4
{
  double v4 = [(HUColorLinearPaletteView *)self calibratedColorPalette];
  id v5 = [v4 colors];
  int64_t v6 = [v5 count];

  return v6;
}

- (id)collectionView:(id)a3 cellForItemAtIndexPath:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  double v8 = [(HUColorLinearPaletteView *)self selectedColor];
  uint64_t v9 = [(HUColorLinearPaletteView *)self _indexForSelectedColor:v8 includeBias:1];

  objc_super v10 = [(HUColorLinearPaletteView *)self selectedColorIndexPath];

  if (v10)
  {
    v11 = [(HUColorLinearPaletteView *)self selectedColorIndexPath];
    uint64_t v9 = [v11 item];
  }
  unint64_t v12 = [(HUColorLinearPaletteView *)self colorPalette];
  id v13 = [v12 colors];
  uint64_t v14 = objc_msgSend(v13, "objectAtIndexedSubscript:", objc_msgSend(v7, "item"));

  if ([v14 isNaturalLightColor])
  {
    uint64_t v15 = [v6 dequeueReusableCellWithReuseIdentifier:@"naturalLightSwatchViewCell" forIndexPath:v7];
    if (!v15) {
      uint64_t v15 = -[HUNaturalLightColorSwatchCollectionViewCell initWithFrame:]([HUNaturalLightColorSwatchCollectionViewCell alloc], "initWithFrame:", 0.0, 0.0, 57.0, 57.0);
    }
    uint64_t v16 = [v7 item];
    int v17 = [(HUNaturalLightColorSwatchCollectionViewCell *)v15 swatchView];
    [v17 setTag:v16];

    uint64_t v18 = [(HUColorLinearPaletteView *)self selectedColor];
    if (v18 && (v19 = (void *)v18, uint64_t v20 = [v7 item], v19, v9 == v20))
    {
      unint64_t v21 = [(HUNaturalLightColorSwatchCollectionViewCell *)v15 swatchView];
      v22 = v21;
      uint64_t v23 = 2;
    }
    else
    {
      unint64_t v21 = [(HUNaturalLightColorSwatchCollectionViewCell *)v15 swatchView];
      v22 = v21;
      uint64_t v23 = 0;
    }
    [v21 setSelectionState:v23];
  }
  else
  {
    uint64_t v15 = [v6 dequeueReusableCellWithReuseIdentifier:@"colorSwatchViewCell" forIndexPath:v7];
    if (!v15) {
      uint64_t v15 = -[HUColorSwatchViewCollectionViewCell initWithFrame:]([HUColorSwatchViewCollectionViewCell alloc], "initWithFrame:", 0.0, 0.0, 57.0, 57.0);
    }
    id v24 = _HULocalizedStringWithDefaultValue(@"HUQuickControlColorPickerEditButton", @"HUQuickControlColorPickerEditButton", 1);
    v25 = [v24 localizedUppercaseString];
    v26 = [(HUNaturalLightColorSwatchCollectionViewCell *)v15 swatchView];
    [v26 setText:v25];

    uint64_t v27 = [v7 item];
    v28 = [(HUNaturalLightColorSwatchCollectionViewCell *)v15 swatchView];
    [v28 setTag:v27];

    v29 = [(HUColorLinearPaletteView *)self calibratedColorPalette];
    v30 = [v29 colors];
    v31 = objc_msgSend(v30, "objectAtIndexedSubscript:", objc_msgSend(v7, "item"));

    v32 = [v31 UIColor];
    v33 = [(HUNaturalLightColorSwatchCollectionViewCell *)v15 swatchView];
    [v33 setColor:v32];

    uint64_t v34 = [(HUColorLinearPaletteView *)self selectedColor];
    if (v34 && (v35 = (void *)v34, uint64_t v36 = [v7 item], v35, v9 == v36))
    {
      v37 = [(HUNaturalLightColorSwatchCollectionViewCell *)v15 swatchView];
      [v37 setSelectionState:2];

      v22 = [(HUColorLinearPaletteView *)self profile];
      BOOL v38 = [v22 mode] != 0;
      v39 = [(HUNaturalLightColorSwatchCollectionViewCell *)v15 swatchView];
      [v39 setLabelHidden:v38];
    }
    else
    {
      v40 = [(HUNaturalLightColorSwatchCollectionViewCell *)v15 swatchView];
      [v40 setSelectionState:0];

      v22 = [(HUNaturalLightColorSwatchCollectionViewCell *)v15 swatchView];
      [v22 setLabelHidden:1];
    }
    uint64_t v14 = v31;
  }

  v41 = objc_msgSend(NSString, "stringWithFormat:", @"HUColorSwatchViewCollectionViewCell-%lu", objc_msgSend(v7, "item"));
  [(HUNaturalLightColorSwatchCollectionViewCell *)v15 setAccessibilityIdentifier:v41];

  return v15;
}

- (CGSize)collectionView:(id)a3 layout:(id)a4 sizeForItemAtIndexPath:(id)a5
{
  double v5 = 57.0;
  double v6 = 57.0;
  result.height = v6;
  result.width = v5;
  return result;
}

- (void)collectionView:(id)a3 didSelectItemAtIndexPath:(id)a4
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v5 = a4;
  [(HUColorLinearPaletteView *)self setUserInteractionActive:1];
  double v6 = HFLogForCategory();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    id v7 = [(HUColorLinearPaletteView *)self calibratedColorPalette];
    double v8 = [v7 colors];
    int v24 = 138412546;
    id v25 = v5;
    __int16 v26 = 2112;
    uint64_t v27 = v8;
    _os_log_impl(&dword_1BE345000, v6, OS_LOG_TYPE_DEFAULT, "User selected indexPath %@. colors = %@", (uint8_t *)&v24, 0x16u);
  }
  uint64_t v9 = [(HUColorLinearPaletteView *)self selectedColorIndexPath];

  if (v9)
  {
    [(HUColorLinearPaletteView *)self selectedColorIndexPath];
  }
  else
  {
    objc_super v10 = [(HUColorLinearPaletteView *)self selectedColor];
    unint64_t v11 = [(HUColorLinearPaletteView *)self _indexForSelectedColor:v10 includeBias:1];

    [MEMORY[0x1E4F28D58] indexPathForItem:v11 inSection:0];
  unint64_t v12 = };
  [(HUColorLinearPaletteView *)self setPrevSelectedColorIndexPath:v12];

  [(HUColorLinearPaletteView *)self setSelectedColorIndexPath:v5];
  id v13 = [(HUColorLinearPaletteView *)self calibratedColorPalette];
  uint64_t v14 = [v13 colors];
  uint64_t v15 = objc_msgSend(v14, "objectAtIndexedSubscript:", objc_msgSend(v5, "item"));

  uint64_t v16 = [v5 item];
  int v17 = [(HUColorLinearPaletteView *)self prevSelectedColorIndexPath];
  uint64_t v18 = [v17 item];

  char v19 = [v15 isNaturalLightColor];
  if (v16 == v18)
  {
    char v20 = v19;
    unint64_t v21 = [(HUColorLinearPaletteView *)self profile];
    if ([v21 mode]) {
      char v20 = 1;
    }

    if ((v20 & 1) == 0)
    {
      [(HUColorLinearPaletteView *)self setPrevSelectedColorIndexPath:0];
      [(HUColorLinearPaletteView *)self setPrevSelectedColorIndexPath:0];
      v22 = [(HUColorLinearPaletteView *)self interactionDelegate];
      [v22 presentFullColorViewForControlView:self selectedColorIndexPath:v5];

      [(HUColorLinearPaletteView *)self _actuateImpactTapticFeedback];
    }
  }
  else
  {
    uint64_t v23 = [(HUColorLinearPaletteView *)self interactionDelegate];
    [v23 controlView:self didSelectColorAtIndexPath:v5];

    [(HUColorLinearPaletteView *)self _setSelectedColor:v15 notifyDelegate:1 selectionChanged:1];
    [(HUColorLinearPaletteView *)self _actuateSelectionTapticFeedback];
  }

  [(HUColorLinearPaletteView *)self setUserInteractionActive:0];
}

- (UIEdgeInsets)collectionView:(id)a3 layout:(id)a4 insetForSectionAtIndex:(int64_t)a5
{
  double v5 = 0.0;
  double v6 = 4.5;
  double v7 = 0.0;
  double v8 = 4.5;
  result.right = v8;
  result.bottom = v7;
  result.left = v6;
  result.top = v5;
  return result;
}

- (void)_prepareForTapticFeedback
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F42DD8]);
  [(HUColorLinearPaletteView *)self setSelectionFeedbackGenerator:v3];

  double v4 = [(HUColorLinearPaletteView *)self selectionFeedbackGenerator];
  [v4 prepare];

  double v5 = (void *)[objc_alloc(MEMORY[0x1E4F42AA8]) initWithStyle:1];
  [(HUColorLinearPaletteView *)self setImpactFeedbackGenerator:v5];

  id v6 = [(HUColorLinearPaletteView *)self impactFeedbackGenerator];
  [v6 prepare];
}

- (void)_actuateSelectionTapticFeedback
{
  id v3 = [(HUColorLinearPaletteView *)self selectionFeedbackGenerator];
  [v3 selectionChanged];

  id v4 = [(HUColorLinearPaletteView *)self selectionFeedbackGenerator];
  [v4 prepare];
}

- (void)_actuateImpactTapticFeedback
{
  id v3 = [(HUColorLinearPaletteView *)self impactFeedbackGenerator];
  [v3 impactOccurred];

  id v4 = [(HUColorLinearPaletteView *)self impactFeedbackGenerator];
  [v4 prepare];
}

- (HUQuickControlColorViewProfile)profile
{
  return self->_profile;
}

- (void)setProfile:(id)a3
{
}

- (HUQuickControlColorPaletteViewInteractionDelegate)interactionDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_interactionDelegate);

  return (HUQuickControlColorPaletteViewInteractionDelegate *)WeakRetained;
}

- (void)setInteractionDelegate:(id)a3
{
}

- (unint64_t)reachabilityState
{
  return self->_reachabilityState;
}

- (unint64_t)mode
{
  return self->_mode;
}

- (void)setMode:(unint64_t)a3
{
  self->_mode = a3;
}

- (BOOL)isUserInteractionActive
{
  return self->_userInteractionActive;
}

- (NSIndexPath)selectedColorIndexPath
{
  return self->_selectedColorIndexPath;
}

- (void)setSelectedColorIndexPath:(id)a3
{
}

- (HFColorPalette)colorPalette
{
  return self->_colorPalette;
}

- (HFColorPalette)calibratedColorPalette
{
  return self->_calibratedColorPalette;
}

- (void)setCalibratedColorPalette:(id)a3
{
}

- (HFColorPaletteColor)selectedColor
{
  return self->_selectedColor;
}

- (void)setSelectedColor:(id)a3
{
}

- (NSIndexPath)prevSelectedColorIndexPath
{
  return self->_prevSelectedColorIndexPath;
}

- (void)setPrevSelectedColorIndexPath:(id)a3
{
}

- (UICollectionView)colorSwatchCollectionView
{
  return self->_colorSwatchCollectionView;
}

- (void)setColorSwatchCollectionView:(id)a3
{
}

- (UICollectionViewFlowLayout)collectionViewFlowLayout
{
  return self->_collectionViewFlowLayout;
}

- (void)setCollectionViewFlowLayout:(id)a3
{
}

- (UISelectionFeedbackGenerator)selectionFeedbackGenerator
{
  return self->_selectionFeedbackGenerator;
}

- (void)setSelectionFeedbackGenerator:(id)a3
{
}

- (UIImpactFeedbackGenerator)impactFeedbackGenerator
{
  return self->_impactFeedbackGenerator;
}

- (void)setImpactFeedbackGenerator:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_impactFeedbackGenerator, 0);
  objc_storeStrong((id *)&self->_selectionFeedbackGenerator, 0);
  objc_storeStrong((id *)&self->_collectionViewFlowLayout, 0);
  objc_storeStrong((id *)&self->_colorSwatchCollectionView, 0);
  objc_storeStrong((id *)&self->_prevSelectedColorIndexPath, 0);
  objc_storeStrong((id *)&self->_selectedColor, 0);
  objc_storeStrong((id *)&self->_calibratedColorPalette, 0);
  objc_storeStrong((id *)&self->_colorPalette, 0);
  objc_storeStrong((id *)&self->_selectedColorIndexPath, 0);
  objc_destroyWeak((id *)&self->_interactionDelegate);

  objc_storeStrong((id *)&self->_profile, 0);
}

@end