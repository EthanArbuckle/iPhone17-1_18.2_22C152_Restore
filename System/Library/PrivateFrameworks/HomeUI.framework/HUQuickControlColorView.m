@interface HUQuickControlColorView
- (BOOL)isSelectedColorInPalette;
- (BOOL)isUserInteractionActive;
- (BOOL)showPickerModeControl;
- (HFColorPalette)colorPalette;
- (HFColorPalette)originalPalette;
- (HFColorPaletteColor)selectedColor;
- (HUColorLinearPaletteView)colorLinearPaletteView;
- (HUColorPickerView)colorPickerView;
- (HUQuickControlColorView)initWithProfile:(id)a3;
- (HUQuickControlColorView)initWithProfile:(id)a3 colorPalette:(id)a4;
- (HUQuickControlColorViewInteractionDelegate)interactionDelegate;
- (HUQuickControlColorViewProfile)profile;
- (HUQuickControlInteractiveView)activeView;
- (NSIndexPath)linearPaletteViewSelectedColorIndexPath;
- (NSIndexPath)originalSelectedColorIndexPath;
- (UISegmentedControl)colorPickerModeSegmentedControl;
- (id)intrinsicSizeDescriptorForControlSize:(unint64_t)a3;
- (id)originalValue;
- (unint64_t)mode;
- (unint64_t)reachabilityState;
- (void)_updateColorPicker;
- (void)_updateLayout;
- (void)_updateUIForReachabilityState:(unint64_t)a3;
- (void)_updateVisibleViews;
- (void)beginUserInteractionWithFirstTouchGestureRecognizer:(id)a3;
- (void)cancelColorPicking;
- (void)controlView:(id)a3 colorPaletteDidChange:(id)a4;
- (void)controlView:(id)a3 colorPickerModeDidChange:(unint64_t)a4;
- (void)controlView:(id)a3 didSelectColorAtIndexPath:(id)a4;
- (void)controlView:(id)a3 interactionStateDidChange:(BOOL)a4 forFirstTouch:(BOOL)a5;
- (void)controlView:(id)a3 valueDidChange:(id)a4;
- (void)layoutSubviews;
- (void)presentFullColorViewForControlView:(id)a3 selectedColorIndexPath:(id)a4;
- (void)setColorLinearPaletteView:(id)a3;
- (void)setColorPalette:(id)a3;
- (void)setColorPickerModeSegmentedControl:(id)a3;
- (void)setColorPickerView:(id)a3;
- (void)setInteractionDelegate:(id)a3;
- (void)setOriginalPalette:(id)a3;
- (void)setOriginalSelectedColorIndexPath:(id)a3;
- (void)setOriginalValue:(id)a3;
- (void)setProfile:(id)a3;
- (void)setReachabilityState:(unint64_t)a3;
- (void)setSelectedColor:(id)a3;
- (void)setShowPickerModeControl:(BOOL)a3;
- (void)setUserInteractionActive:(BOOL)a3;
- (void)setValue:(id)a3;
- (void)storeCurrentColorInformationAsOriginalValues;
- (void)updateSelectedColorIndexPathToIndexPath:(id)a3;
@end

@implementation HUQuickControlColorView

- (unint64_t)mode
{
  v2 = [(HUQuickControlColorView *)self profile];
  unint64_t v3 = [v2 mode];

  return v3;
}

- (NSIndexPath)linearPaletteViewSelectedColorIndexPath
{
  v2 = [(HUQuickControlColorView *)self colorLinearPaletteView];
  unint64_t v3 = [v2 selectedColorIndexPath];

  return (NSIndexPath *)v3;
}

- (HUQuickControlColorView)initWithProfile:(id)a3
{
  v5 = objc_msgSend(MEMORY[0x1E4F28B00], "currentHandler", a3);
  v6 = NSStringFromSelector(sel_initWithProfile_colorPalette_);
  objc_msgSend(v5, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"HUQuickControlColorView.m", 68, @"%s is unavailable; use %@ instead",
    "-[HUQuickControlColorView initWithProfile:]",
    v6);

  return 0;
}

- (HUQuickControlColorView)initWithProfile:(id)a3 colorPalette:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v21.receiver = self;
  v21.super_class = (Class)HUQuickControlColorView;
  v8 = [(HUQuickControlColorView *)&v21 init];
  v9 = v8;
  if (v8)
  {
    [(HUQuickControlColorView *)v8 setProfile:v6];
    [(HUQuickControlColorView *)v9 setReachabilityState:0];
    [(HUQuickControlColorView *)v9 setColorPalette:v7];
    [(HUQuickControlColorView *)v9 setOriginalPalette:v7];
    v10 = objc_opt_new();
    v11 = _HULocalizedStringWithDefaultValue(@"HUQuickControlColorModeRGB", @"HUQuickControlColorModeRGB", 1);
    [v10 insertObject:v11 atIndex:0];

    v12 = _HULocalizedStringWithDefaultValue(@"HUQuickControlColorModeTemperature", @"HUQuickControlColorModeTemperature", 1);
    [v10 insertObject:v12 atIndex:1];

    uint64_t v13 = [objc_alloc(MEMORY[0x1E4F42DD0]) initWithItems:v10];
    colorPickerModeSegmentedControl = v9->_colorPickerModeSegmentedControl;
    v9->_colorPickerModeSegmentedControl = (UISegmentedControl *)v13;

    v15 = [(HUQuickControlColorView *)v9 profile];
    -[UISegmentedControl setSelectedSegmentIndex:](v9->_colorPickerModeSegmentedControl, "setSelectedSegmentIndex:", [v15 supportsRGBColor] ^ 1);

    [(UISegmentedControl *)v9->_colorPickerModeSegmentedControl addTarget:v9 action:sel__updateColorPicker forControlEvents:4096];
    [(HUQuickControlColorView *)v9 addSubview:v9->_colorPickerModeSegmentedControl];
    v16 = [[HUColorLinearPaletteView alloc] initWithProfile:v6 colorPalette:v7];
    colorLinearPaletteView = v9->_colorLinearPaletteView;
    v9->_colorLinearPaletteView = v16;

    [(HUColorLinearPaletteView *)v9->_colorLinearPaletteView setInteractionDelegate:v9];
    [(HUQuickControlColorView *)v9 addSubview:v9->_colorLinearPaletteView];
    v18 = [[HUColorPickerView alloc] initWithProfile:v6];
    colorPickerView = v9->_colorPickerView;
    v9->_colorPickerView = v18;

    [(HUColorPickerView *)v9->_colorPickerView setTranslatesAutoresizingMaskIntoConstraints:0];
    [(HUColorPickerView *)v9->_colorPickerView setInteractionDelegate:v9];
    [(HUQuickControlColorView *)v9 addSubview:v9->_colorPickerView];
  }
  return v9;
}

- (void)layoutSubviews
{
  v3.receiver = self;
  v3.super_class = (Class)HUQuickControlColorView;
  [(HUQuickControlColorView *)&v3 layoutSubviews];
  [(HUQuickControlColorView *)self _updateVisibleViews];
  [(HUQuickControlColorView *)self _updateLayout];
  [(HUQuickControlColorView *)self _updateColorPicker];
  [(HUQuickControlColorView *)self _updateUIForReachabilityState:[(HUQuickControlColorView *)self reachabilityState]];
}

- (void)_updateVisibleViews
{
  v20[2] = *MEMORY[0x1E4F143B8];
  objc_super v3 = [(HUQuickControlColorView *)self colorLinearPaletteView];
  v4 = [(HUQuickControlColorView *)self profile];
  objc_msgSend(v3, "setHidden:", objc_msgSend(v4, "mode") == 1);

  v5 = [(HUQuickControlColorView *)self colorPickerModeSegmentedControl];
  v20[0] = v5;
  id v6 = [(HUQuickControlColorView *)self colorPickerView];
  v20[1] = v6;
  id v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:v20 count:2];

  long long v17 = 0u;
  long long v18 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v8 = v7;
  uint64_t v9 = [v8 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v16;
    do
    {
      uint64_t v12 = 0;
      do
      {
        if (*(void *)v16 != v11) {
          objc_enumerationMutation(v8);
        }
        uint64_t v13 = *(void **)(*((void *)&v15 + 1) + 8 * v12);
        v14 = [(HUQuickControlColorView *)self profile];
        objc_msgSend(v13, "setHidden:", objc_msgSend(v14, "mode") == 0);

        ++v12;
      }
      while (v10 != v12);
      uint64_t v10 = [v8 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v10);
  }
}

- (void)_updateLayout
{
  double v3 = *(double *)&HUQuickControlPushButtonSmallDiameter;
  v4 = [(HUQuickControlColorView *)self profile];
  uint64_t v5 = [v4 mode];

  if (v5 == 1)
  {
    [(HUQuickControlColorView *)self frame];
    double v16 = v15 + -32.0;
    long long v17 = [(HUQuickControlColorView *)self colorPickerModeSegmentedControl];
    [v17 frame];
    double v19 = v18;
    v20 = [(HUQuickControlColorView *)self colorPickerModeSegmentedControl];
    objc_msgSend(v20, "setFrame:", 16.0, 65.0, v16, v19);

    objc_super v21 = [(HUQuickControlColorView *)self colorPickerModeSegmentedControl];
    v22 = [(HUQuickControlColorView *)self profile];
    objc_msgSend(v21, "setHidden:", objc_msgSend(v22, "supportsRGBColor") ^ 1);

    v23 = [(HUQuickControlColorView *)self colorPickerView];
    [v23 setMagnifierLength:v3];

    [(HUQuickControlColorView *)self frame];
    double v25 = v24 + -64.0;
    [(HUQuickControlColorView *)self frame];
    double Height = CGRectGetHeight(v48);
    v27 = [(HUQuickControlColorView *)self colorPickerModeSegmentedControl];
    [v27 frame];
    double v28 = Height - CGRectGetMaxY(v49) + -64.0;

    if (v25 < v28) {
      double v28 = v25;
    }
    if ([MEMORY[0x1E4F69758] useMacIdiom]) {
      double v28 = v28 * 0.600000024;
    }
    [(HUQuickControlColorView *)self frame];
    double v30 = v29 * 0.5 - v28 * 0.5;
    [(HUQuickControlColorView *)self frame];
    double v32 = v31;
    v33 = [(HUQuickControlColorView *)self colorPickerModeSegmentedControl];
    [v33 frame];
    double v35 = v32 - v34;
    v36 = [(HUQuickControlColorView *)self colorPickerModeSegmentedControl];
    [v36 frame];
    double v38 = v35 - v37;

    double v39 = (v38 - v28) / 3.0;
    v40 = [(HUQuickControlColorView *)self colorPickerModeSegmentedControl];
    [v40 frame];
    double v42 = v41;
    v43 = [(HUQuickControlColorView *)self colorPickerModeSegmentedControl];
    [v43 frame];
    double v45 = v39 + v42 + v44;

    id v46 = [(HUQuickControlColorView *)self colorPickerView];
    objc_msgSend(v46, "setFrame:", v30, v45, v28, v28);
  }
  else
  {
    if (v5) {
      return;
    }
    id v6 = [(HUQuickControlColorView *)self profile];
    uint64_t v7 = [v6 orientation];

    unint64_t v8 = 2;
    if (v7) {
      unint64_t v9 = 3;
    }
    else {
      unint64_t v9 = 2;
    }
    if (!v7) {
      unint64_t v8 = 3;
    }
    double v10 = (float)((float)v9 * 4.5) + (float)((float)v9 * 4.5) + v3 * (double)v9;
    double v11 = (float)((float)v8 * 4.5) + (float)((float)v8 * 4.5) + v3 * (double)v8;
    [(HUQuickControlColorView *)self frame];
    double v13 = v12 * 0.5 - v10 * 0.5;
    v14 = [(HUQuickControlColorView *)self colorLinearPaletteView];
    objc_msgSend(v14, "setFrame:", v13, 0.0, v10, v11);

    id v46 = [(HUQuickControlColorView *)self colorLinearPaletteView];
    [v46 setTag:0];
  }
}

- (HUQuickControlInteractiveView)activeView
{
  double v3 = [(HUQuickControlColorView *)self profile];
  uint64_t v4 = [v3 mode];

  if (v4 == 1)
  {
    uint64_t v5 = [(HUQuickControlColorView *)self colorPickerView];
  }
  else if (v4)
  {
    uint64_t v5 = 0;
  }
  else
  {
    uint64_t v5 = [(HUQuickControlColorView *)self colorLinearPaletteView];
  }

  return (HUQuickControlInteractiveView *)v5;
}

- (void)setProfile:(id)a3
{
  objc_storeStrong((id *)&self->_profile, a3);
  id v5 = a3;
  id v6 = [(HUQuickControlColorView *)self colorLinearPaletteView];
  [v6 setProfile:v5];

  id v7 = [(HUQuickControlColorView *)self colorPickerView];
  [v7 setProfile:v5];
}

- (BOOL)isSelectedColorInPalette
{
  v2 = self;
  double v3 = [(HUQuickControlColorView *)self colorPalette];
  uint64_t v4 = [v3 colors];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __51__HUQuickControlColorView_isSelectedColorInPalette__block_invoke;
  v6[3] = &unk_1E638DB48;
  v6[4] = v2;
  LOBYTE(v2) = objc_msgSend(v4, "na_any:", v6);

  return (char)v2;
}

uint64_t __51__HUQuickControlColorView_isSelectedColorInPalette__block_invoke(uint64_t a1, void *a2)
{
  v2 = *(void **)(a1 + 32);
  id v3 = a2;
  uint64_t v4 = [v2 value];
  uint64_t v5 = [v3 isSimilarToColor:v4];

  return v5;
}

- (void)_updateColorPicker
{
  id v3 = [(HUQuickControlColorView *)self colorPickerModeSegmentedControl];
  uint64_t v4 = [v3 selectedSegmentIndex];
  uint64_t v5 = [(HUQuickControlColorView *)self colorPickerView];
  [v5 setColorPickerMode:v4];

  id v6 = [(HUQuickControlColorView *)self colorPickerModeSegmentedControl];
  uint64_t v7 = [v6 selectedSegmentIndex];

  double v8 = 0.0;
  if (v7 == 1)
  {
    unint64_t v9 = [(HUQuickControlColorView *)self colorPickerView];
    [v9 frame];
    double v11 = v10;

    double v12 = [(HUQuickControlColorView *)self colorPickerView];
    [v12 frame];
    double v14 = v13;

    if (v11 >= v14) {
      double v15 = v14;
    }
    else {
      double v15 = v11;
    }
    double v8 = (v15 + *(double *)&HUQuickControlPushButtonSmallDiameter * -2.0) * 0.5;
  }
  double v16 = [(HUQuickControlColorView *)self colorPickerView];
  [v16 setWheelHoleRadius:v8];

  double v17 = *(double *)&HUQuickControlPushButtonSmallDiameter;
  id v18 = [(HUQuickControlColorView *)self colorPickerView];
  [v18 setMagnifierLength:v17];
}

- (void)_updateUIForReachabilityState:(unint64_t)a3
{
  uint64_t v5 = [(HUQuickControlColorView *)self colorLinearPaletteView];
  [v5 setReachabilityState:a3];

  id v6 = [(HUQuickControlColorView *)self colorPickerView];
  [v6 setReachabilityState:a3];

  if (a3 >= 2)
  {
    if (a3 != 2) {
      return;
    }
    double v11 = [(HUQuickControlColorView *)self colorLinearPaletteView];
    [v11 setAlpha:1.0];

    double v12 = [(HUQuickControlColorView *)self colorPickerModeSegmentedControl];
    [v12 setAlpha:1.0];

    unint64_t v9 = [(HUQuickControlColorView *)self colorPickerModeSegmentedControl];
    uint64_t v10 = 1;
    [v9 setUserInteractionEnabled:1];
  }
  else
  {
    uint64_t v7 = [(HUQuickControlColorView *)self colorLinearPaletteView];
    [v7 setAlpha:0.5];

    double v8 = [(HUQuickControlColorView *)self colorPickerModeSegmentedControl];
    [v8 setAlpha:0.5];

    unint64_t v9 = [(HUQuickControlColorView *)self colorPickerModeSegmentedControl];
    [v9 setUserInteractionEnabled:0];
    uint64_t v10 = 0;
  }

  [(HUQuickControlColorView *)self setUserInteractionEnabled:v10];
}

- (void)storeCurrentColorInformationAsOriginalValues
{
  id v3 = [(HUQuickControlColorView *)self selectedColor];
  [(HUQuickControlColorView *)self setOriginalValue:v3];

  uint64_t v4 = [(HUQuickControlColorView *)self colorPalette];
  [(HUQuickControlColorView *)self setOriginalPalette:v4];

  id v6 = [(HUQuickControlColorView *)self colorLinearPaletteView];
  uint64_t v5 = [v6 selectedColorIndexPath];
  [(HUQuickControlColorView *)self setOriginalSelectedColorIndexPath:v5];
}

- (BOOL)isUserInteractionActive
{
  v2 = [(HUQuickControlColorView *)self activeView];
  char v3 = [v2 isUserInteractionActive];

  return v3;
}

- (void)setValue:(id)a3
{
  id v4 = a3;
  uint64_t v5 = objc_opt_class();
  id v6 = v4;
  if (!v6) {
    goto LABEL_7;
  }
  if (objc_opt_isKindOfClass()) {
    uint64_t v7 = v6;
  }
  else {
    uint64_t v7 = 0;
  }
  id v8 = v6;
  if (!v7)
  {
    unint64_t v9 = [MEMORY[0x1E4F28B00] currentHandler];
    uint64_t v10 = objc_msgSend(NSString, "stringWithUTF8String:", "id  _Nullable NAAssertCast(Class  _Nonnull __unsafe_unretained, id  _Nonnull __strong)");
    [v9 handleFailureInFunction:v10, @"NSObject+NAAdditions.h", 54, @"Expected class of %@ but was %@", v5, objc_opt_class() file lineNumber description];

LABEL_7:
    id v8 = 0;
  }

  objc_opt_class();
  double v11 = [v8 colorValue];
  if (objc_opt_isKindOfClass()) {
    double v12 = v11;
  }
  else {
    double v12 = 0;
  }
  id v13 = v12;

  if (v8)
  {
    double v14 = [v13 temperatureColor];

    if (!v14)
    {
      double v15 = [(HUQuickControlColorView *)self colorPalette];
      double v16 = [v15 colors];
      v31[0] = MEMORY[0x1E4F143A8];
      v31[1] = 3221225472;
      v31[2] = __36__HUQuickControlColorView_setValue___block_invoke;
      v31[3] = &unk_1E638DB48;
      id v8 = v8;
      id v32 = v8;
      double v17 = objc_msgSend(v16, "na_firstObjectPassingTest:", v31);

      if (v17)
      {
        id v18 = v17;

        id v8 = v18;
      }
    }
  }
  [(HUQuickControlColorView *)self setSelectedColor:v8];
  double v19 = [(HUQuickControlColorView *)self profile];
  uint64_t v20 = [v19 mode];

  objc_super v21 = [(HUQuickControlColorView *)self profile];
  v22 = v21;
  if (v20)
  {
    uint64_t v23 = [v21 mode];

    if (v23 == 1)
    {
      double v24 = [(HUQuickControlColorView *)self colorLinearPaletteView];
      [v24 setValue:v6];

      double v25 = [(HUQuickControlColorView *)self colorPickerView];
      [v25 setValue:v6];

      v26 = [(HUQuickControlColorView *)self originalValue];

      if (!v26) {
        [(HUQuickControlColorView *)self setOriginalValue:v6];
      }
      [(HUQuickControlColorView *)self _updateColorPicker];
    }
  }
  else
  {
    int v27 = [v21 naturalLightingEnabled];

    if (v27)
    {
      double v28 = (void *)[objc_alloc(MEMORY[0x1E4F69070]) initWithNaturalLightColor];
      double v29 = [(HUQuickControlColorView *)self colorLinearPaletteView];
      [v29 setValue:v28];
    }
    else
    {
      double v30 = [(HUQuickControlColorView *)self colorLinearPaletteView];
      [v30 setValue:v6];
    }
  }
}

uint64_t __36__HUQuickControlColorView_setValue___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  objc_opt_class();
  id v4 = [v3 colorValue];
  if (objc_opt_isKindOfClass()) {
    uint64_t v5 = v4;
  }
  else {
    uint64_t v5 = 0;
  }
  id v6 = v5;

  uint64_t v7 = [v3 isSimilarToColor:*(void *)(a1 + 32)];
  if (v7)
  {
    id v8 = [v6 temperatureColor];
    uint64_t v7 = v8 != 0;
  }
  return v7;
}

- (void)setColorPalette:(id)a3
{
  objc_storeStrong((id *)&self->_colorPalette, a3);
  id v5 = a3;
  id v6 = [(HUQuickControlColorView *)self colorLinearPaletteView];
  [v6 setColorPalette:v5];
}

- (void)setReachabilityState:(unint64_t)a3
{
  self->_reachabilityState = a3;
  -[HUQuickControlColorView _updateUIForReachabilityState:](self, "_updateUIForReachabilityState:");
}

- (void)beginUserInteractionWithFirstTouchGestureRecognizer:(id)a3
{
  id v4 = a3;
  id v5 = [(HUQuickControlColorView *)self activeView];
  [v5 beginUserInteractionWithFirstTouchGestureRecognizer:v4];
}

- (id)intrinsicSizeDescriptorForControlSize:(unint64_t)a3
{
  id v5 = [(HUQuickControlColorView *)self profile];
  uint64_t v6 = [v5 mode];
  uint64_t v7 = [(HUQuickControlColorView *)self profile];
  id v8 = HUQuickControlColorViewMetricsForControlSizeModeAndOrientation(a3, v6, [v7 orientation]);

  return v8;
}

- (void)updateSelectedColorIndexPathToIndexPath:(id)a3
{
  id v4 = a3;
  id v5 = [(HUQuickControlColorView *)self colorLinearPaletteView];
  [v5 updateSelectedColorIndexPathToIndexPath:v4];
}

- (void)controlView:(id)a3 valueDidChange:(id)a4
{
  id v20 = a3;
  id v6 = a4;
  uint64_t v7 = objc_opt_class();
  id v8 = v6;
  if (!v8) {
    goto LABEL_7;
  }
  if (objc_opt_isKindOfClass()) {
    unint64_t v9 = v8;
  }
  else {
    unint64_t v9 = 0;
  }
  uint64_t v10 = v8;
  if (!v9)
  {
    double v11 = [MEMORY[0x1E4F28B00] currentHandler];
    double v12 = objc_msgSend(NSString, "stringWithUTF8String:", "id  _Nullable NAAssertCast(Class  _Nonnull __unsafe_unretained, id  _Nonnull __strong)");
    [v11 handleFailureInFunction:v12, @"NSObject+NAAdditions.h", 54, @"Expected class of %@ but was %@", v7, objc_opt_class() file lineNumber description];

LABEL_7:
    uint64_t v10 = 0;
  }

  [(HUQuickControlColorView *)self setSelectedColor:v10];
  id v13 = [(HUQuickControlColorView *)self interactionDelegate];
  double v14 = [(HUQuickControlColorView *)self value];
  [v13 controlView:self valueDidChange:v14];

  double v15 = [(HUQuickControlColorView *)self profile];
  uint64_t v16 = [v15 mode];

  if (v16 != 1) {
    goto LABEL_14;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    double v17 = [(HUQuickControlColorView *)self selectedColor];
    id v18 = [(HUQuickControlColorView *)self colorPickerView];
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0) {
      goto LABEL_14;
    }
    double v17 = [(HUQuickControlColorView *)self selectedColor];
    id v18 = [(HUQuickControlColorView *)self colorLinearPaletteView];
  }
  double v19 = v18;
  [v18 setValue:v17];

LABEL_14:
}

- (void)controlView:(id)a3 interactionStateDidChange:(BOOL)a4 forFirstTouch:(BOOL)a5
{
  BOOL v5 = a5;
  BOOL v6 = a4;
  id v8 = [(HUQuickControlColorView *)self interactionDelegate];
  [v8 controlView:self interactionStateDidChange:v6 forFirstTouch:v5];
}

- (void)controlView:(id)a3 colorPickerModeDidChange:(unint64_t)a4
{
  id v5 = [(HUQuickControlColorView *)self colorPickerModeSegmentedControl];
  [v5 setSelectedSegmentIndex:a4];
}

- (void)controlView:(id)a3 colorPaletteDidChange:(id)a4
{
  id v5 = a4;
  [(HUQuickControlColorView *)self setColorPalette:v5];
  id v6 = [(HUQuickControlColorView *)self interactionDelegate];
  [v6 controlView:self colorPaletteDidChange:v5];
}

- (void)presentFullColorViewForControlView:(id)a3 selectedColorIndexPath:(id)a4
{
  id v5 = a4;
  id v6 = [(HUQuickControlColorView *)self interactionDelegate];
  [v6 presentFullColorViewForControlView:self selectedColorIndexPath:v5];
}

- (void)controlView:(id)a3 didSelectColorAtIndexPath:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(HUQuickControlColorView *)self interactionDelegate];
  [v8 controlView:v7 didSelectColorAtIndexPath:v6];
}

- (void)cancelColorPicking
{
  id v3 = [(HUQuickControlColorView *)self colorLinearPaletteView];
  id v4 = [(HUQuickControlColorView *)self originalSelectedColorIndexPath];
  [v3 updateSelectedColorIndexPathToIndexPath:v4];

  uint64_t v5 = [(HUQuickControlColorView *)self originalPalette];
  if (v5)
  {
    id v6 = (void *)v5;
    id v7 = [(HUQuickControlColorView *)self originalPalette];
    id v8 = [(HUQuickControlColorView *)self colorPalette];
    char v9 = [v7 isEqual:v8];

    if ((v9 & 1) == 0)
    {
      uint64_t v10 = [(HUQuickControlColorView *)self colorLinearPaletteView];
      [v10 setUserInteractionActive:1];

      double v11 = [(HUQuickControlColorView *)self colorPickerView];
      [v11 setUserInteractionActive:1];

      double v12 = [(HUQuickControlColorView *)self interactionDelegate];
      id v13 = [(HUQuickControlColorView *)self originalPalette];
      [v12 controlView:self colorPaletteDidChange:v13];

      double v14 = [(HUQuickControlColorView *)self colorLinearPaletteView];
      [v14 setUserInteractionActive:0];

      double v15 = [(HUQuickControlColorView *)self colorPickerView];
      [v15 setUserInteractionActive:0];
    }
  }
  uint64_t v16 = [(HUQuickControlColorView *)self originalValue];
  if (v16)
  {
    double v17 = (void *)v16;
    id v18 = [(HUQuickControlColorView *)self originalValue];
    double v19 = [(HUQuickControlColorView *)self selectedColor];
    char v20 = [v18 isEqual:v19];

    if ((v20 & 1) == 0)
    {
      objc_super v21 = [(HUQuickControlColorView *)self colorLinearPaletteView];
      [v21 setUserInteractionActive:1];

      v22 = [(HUQuickControlColorView *)self colorPickerView];
      [v22 setUserInteractionActive:1];

      uint64_t v23 = [(HUQuickControlColorView *)self originalValue];
      [(HUQuickControlColorView *)self controlView:self valueDidChange:v23];

      double v24 = [(HUQuickControlColorView *)self colorLinearPaletteView];
      [v24 setUserInteractionActive:0];

      id v25 = [(HUQuickControlColorView *)self colorPickerView];
      [v25 setUserInteractionActive:0];
    }
  }
}

- (HUQuickControlColorViewProfile)profile
{
  return self->_profile;
}

- (unint64_t)reachabilityState
{
  return self->_reachabilityState;
}

- (HUQuickControlColorViewInteractionDelegate)interactionDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_interactionDelegate);

  return (HUQuickControlColorViewInteractionDelegate *)WeakRetained;
}

- (void)setInteractionDelegate:(id)a3
{
}

- (HFColorPalette)colorPalette
{
  return self->_colorPalette;
}

- (HFColorPaletteColor)selectedColor
{
  return self->_selectedColor;
}

- (void)setSelectedColor:(id)a3
{
}

- (id)originalValue
{
  return self->_originalValue;
}

- (void)setOriginalValue:(id)a3
{
}

- (HFColorPalette)originalPalette
{
  return self->_originalPalette;
}

- (void)setOriginalPalette:(id)a3
{
}

- (NSIndexPath)originalSelectedColorIndexPath
{
  return self->_originalSelectedColorIndexPath;
}

- (void)setOriginalSelectedColorIndexPath:(id)a3
{
}

- (BOOL)showPickerModeControl
{
  return self->_showPickerModeControl;
}

- (void)setShowPickerModeControl:(BOOL)a3
{
  self->_showPickerModeControl = a3;
}

- (HUColorLinearPaletteView)colorLinearPaletteView
{
  return self->_colorLinearPaletteView;
}

- (void)setColorLinearPaletteView:(id)a3
{
}

- (HUColorPickerView)colorPickerView
{
  return self->_colorPickerView;
}

- (void)setColorPickerView:(id)a3
{
}

- (UISegmentedControl)colorPickerModeSegmentedControl
{
  return self->_colorPickerModeSegmentedControl;
}

- (void)setColorPickerModeSegmentedControl:(id)a3
{
}

- (void)setUserInteractionActive:(BOOL)a3
{
  self->_userInteractionActive = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_colorPickerModeSegmentedControl, 0);
  objc_storeStrong((id *)&self->_colorPickerView, 0);
  objc_storeStrong((id *)&self->_colorLinearPaletteView, 0);
  objc_storeStrong((id *)&self->_originalSelectedColorIndexPath, 0);
  objc_storeStrong((id *)&self->_originalPalette, 0);
  objc_storeStrong(&self->_originalValue, 0);
  objc_storeStrong((id *)&self->_selectedColor, 0);
  objc_storeStrong((id *)&self->_colorPalette, 0);
  objc_destroyWeak((id *)&self->_interactionDelegate);

  objc_storeStrong((id *)&self->_profile, 0);
}

@end