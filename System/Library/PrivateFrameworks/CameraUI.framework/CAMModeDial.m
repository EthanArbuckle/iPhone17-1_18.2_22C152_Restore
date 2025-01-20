@interface CAMModeDial
+ (BOOL)wantsVerticalModeDialForLayoutStyle:(int64_t)a3;
- (CAGradientLayer)_gradientLayer;
- (CAMModeDial)initWithCoder:(id)a3;
- (CAMModeDial)initWithFrame:(CGRect)a3;
- (CAMModeDial)initWithLayoutStyle:(int64_t)a3;
- (CAMModeDialDataSource)dataSource;
- (CGPoint)_horizontalContainerCenterForMode:(int64_t)a3;
- (CGPoint)_verticalContainerCenterForMode:(int64_t)a3;
- (CGSize)_interpolatedHorizontalMeshTransformSize;
- (CGSize)sizeThatFits:(CGSize)a3;
- (NSArray)_modes;
- (NSDictionary)_items;
- (UIView)_itemsContainerView;
- (UIView)_meshTransformView;
- (UIView)_selectedItemBackgroundView;
- (double)_centeringNudgeForMode:(int64_t)a3;
- (id)_fontForLayoutStyle:(int64_t)a3 selected:(BOOL)a4;
- (id)_horizontalMeshTransform;
- (id)_meshTransformForLayoutStyle:(int64_t)a3;
- (id)_selectedItem;
- (id)hudItemForAccessibilityHUDManager:(id)a3;
- (int64_t)_nearestCaptureModeForLocation:(CGPoint)a3;
- (int64_t)layoutStyle;
- (int64_t)selectedMode;
- (void)_commonCAMModeDialInitializationWithLayoutStyle:(int64_t)a3;
- (void)_configureGradientForLayoutStyle:(int64_t)a3;
- (void)_configureMeshTransformForLayoutStyle:(int64_t)a3;
- (void)_layoutHorizontalModeDial;
- (void)_layoutVerticalModeDial;
- (void)_setItems:(id)a3;
- (void)_setModes:(id)a3;
- (void)_updateContainerCenterFromSelectedModeAnimated:(BOOL)a3;
- (void)_updateForLayoutStyle;
- (void)_updateItemsForLayoutStyle:(int64_t)a3;
- (void)_updateSelectedItemBackgroundForLayoutStyle:(int64_t)a3;
- (void)layoutSubviews;
- (void)reloadData;
- (void)selectedByAccessibilityHUDManager:(id)a3;
- (void)setDataSource:(id)a3;
- (void)setLayoutStyle:(int64_t)a3;
- (void)setSelectedMode:(int64_t)a3;
- (void)setSelectedMode:(int64_t)a3 animated:(BOOL)a4;
- (void)touchesEnded:(id)a3 withEvent:(id)a4;
- (void)traitCollectionDidChange:(id)a3;
@end

@implementation CAMModeDial

- (CAMModeDial)initWithLayoutStyle:(int64_t)a3
{
  v8.receiver = self;
  v8.super_class = (Class)CAMModeDial;
  v4 = -[CAMModeDial initWithFrame:](&v8, sel_initWithFrame_, *MEMORY[0x263F001A8], *(double *)(MEMORY[0x263F001A8] + 8), *(double *)(MEMORY[0x263F001A8] + 16), *(double *)(MEMORY[0x263F001A8] + 24));
  v5 = v4;
  if (v4)
  {
    [(CAMModeDial *)v4 _commonCAMModeDialInitializationWithLayoutStyle:a3];
    v6 = v5;
  }

  return v5;
}

- (void)_commonCAMModeDialInitializationWithLayoutStyle:(int64_t)a3
{
  v5 = [MEMORY[0x263F825C8] systemYellowColor];
  [(CAMModeDial *)self setTintColor:v5];

  [(CAMModeDial *)self setClipsToBounds:1];
  self->_layoutStyle = a3;
  id v6 = objc_alloc(MEMORY[0x263F82E00]);
  double v7 = *MEMORY[0x263F001A8];
  double v8 = *(double *)(MEMORY[0x263F001A8] + 8);
  double v9 = *(double *)(MEMORY[0x263F001A8] + 16);
  double v10 = *(double *)(MEMORY[0x263F001A8] + 24);
  v11 = (UIView *)objc_msgSend(v6, "initWithFrame:", *MEMORY[0x263F001A8], v8, v9, v10);
  meshTransformView = self->__meshTransformView;
  self->__meshTransformView = v11;

  [(UIView *)self->__meshTransformView setUserInteractionEnabled:0];
  [(CAMModeDial *)self addSubview:self->__meshTransformView];
  [(CAMModeDial *)self _configureMeshTransformForLayoutStyle:a3];
  v13 = (UIView *)objc_msgSend(objc_alloc(MEMORY[0x263F82E00]), "initWithFrame:", v7, v8, v9, v10);
  itemsContainerView = self->__itemsContainerView;
  self->__itemsContainerView = v13;

  [(UIView *)self->__itemsContainerView setUserInteractionEnabled:0];
  [(UIView *)self->__meshTransformView addSubview:self->__itemsContainerView];
  v15 = [MEMORY[0x263F157D0] layer];
  gradientLayer = self->__gradientLayer;
  self->__gradientLayer = v15;

  id v17 = [MEMORY[0x263F825C8] clearColor];
  -[CAGradientLayer setBackgroundColor:](self->__gradientLayer, "setBackgroundColor:", [v17 CGColor]);

  v18 = [MEMORY[0x263F157C8] filterWithType:*MEMORY[0x263F15B90]];
  [(CAGradientLayer *)self->__gradientLayer setCompositingFilter:v18];

  v19 = [(UIView *)self->__meshTransformView layer];
  [v19 addSublayer:self->__gradientLayer];

  [(CAMModeDial *)self _configureGradientForLayoutStyle:a3];
  [(CAMModeDial *)self _updateForLayoutStyle];
}

- (void)_configureMeshTransformForLayoutStyle:(int64_t)a3
{
  uint64_t v5 = [(id)objc_opt_class() wantsVerticalModeDialForLayoutStyle:a3];
  id v8 = [(UIView *)self->__meshTransformView layer];
  id v6 = [(CAMModeDial *)self _meshTransformForLayoutStyle:a3];
  [v8 setMeshTransform:v6];
  double v7 = [(CAMModeDial *)self traitCollection];
  [v7 displayScale];
  objc_msgSend(v8, "setRasterizationScale:");

  [v8 setAllowsGroupBlending:v5];
}

+ (BOOL)wantsVerticalModeDialForLayoutStyle:(int64_t)a3
{
  return a3 == 1;
}

- (id)_meshTransformForLayoutStyle:(int64_t)a3
{
  if ([(id)objc_opt_class() wantsVerticalModeDialForLayoutStyle:a3])
  {
    v4 = 0;
  }
  else
  {
    v4 = [(CAMModeDial *)self _horizontalMeshTransform];
  }
  return v4;
}

- (id)_horizontalMeshTransform
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  memcpy(__dst, &unk_209C79A18, sizeof(__dst));
  memcpy(v6, &unk_209C7A5A8, sizeof(v6));
  v2 = [MEMORY[0x263F15810] meshTransformWithVertexCount:74 vertices:__dst faceCount:36 faces:v6 depthNormalization:*MEMORY[0x263F15A28]];
  v3 = (void *)[v2 mutableCopy];
  [v3 setSubdivisionSteps:0];
  v4 = (void *)[v3 copy];

  return v4;
}

- (void)_configureGradientForLayoutStyle:(int64_t)a3
{
  v17[6] = *MEMORY[0x263EF8340];
  v4 = [(CAMModeDial *)self _gradientLayer];
  int v5 = [(id)objc_opt_class() wantsVerticalModeDialForLayoutStyle:a3];
  [v4 setType:*MEMORY[0x263F15DD0]];
  if (v5) {
    double v6 = 0.5;
  }
  else {
    double v6 = 0.0;
  }
  if (v5) {
    double v7 = 1.0;
  }
  else {
    double v7 = 0.5;
  }
  if (v5) {
    double v8 = 0.5;
  }
  else {
    double v8 = 1.0;
  }
  if (v5) {
    double v9 = &unk_26BDDFE90;
  }
  else {
    double v9 = &unk_26BDDFEA8;
  }
  [v4 setStartPoint:v6];
  objc_msgSend(v4, "setEndPoint:", v8, v7);
  id v10 = [MEMORY[0x263F825C8] blackColor];
  v17[0] = [v10 CGColor];
  id v11 = [MEMORY[0x263F825C8] blackColor];
  v17[1] = [v11 CGColor];
  id v12 = [MEMORY[0x263F825C8] clearColor];
  v17[2] = [v12 CGColor];
  id v13 = [MEMORY[0x263F825C8] clearColor];
  v17[3] = [v13 CGColor];
  id v14 = [MEMORY[0x263F825C8] blackColor];
  v17[4] = [v14 CGColor];
  id v15 = [MEMORY[0x263F825C8] blackColor];
  v17[5] = [v15 CGColor];
  v16 = [MEMORY[0x263EFF8C0] arrayWithObjects:v17 count:6];
  [v4 setColors:v16];

  [v4 setLocations:v9];
}

- (CAGradientLayer)_gradientLayer
{
  return self->__gradientLayer;
}

- (void)_updateForLayoutStyle
{
  int64_t v3 = [(CAMModeDial *)self layoutStyle];
  [(CAMModeDial *)self _configureGradientForLayoutStyle:v3];
  [(CAMModeDial *)self _configureMeshTransformForLayoutStyle:v3];
  [(CAMModeDial *)self _updateItemsForLayoutStyle:v3];
  [(CAMModeDial *)self _updateSelectedItemBackgroundForLayoutStyle:v3];
  [(CAMModeDial *)self _updateContainerCenterFromSelectedModeAnimated:0];
  [(CAMModeDial *)self reloadData];
  [(CAMModeDial *)self setNeedsLayout];
}

- (int64_t)layoutStyle
{
  return self->_layoutStyle;
}

- (void)_updateItemsForLayoutStyle:(int64_t)a3
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  int v5 = [(CAMModeDial *)self _items];
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v16;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v16 != v8) {
          objc_enumerationMutation(v5);
        }
        id v10 = *(void **)(*((void *)&v15 + 1) + 8 * i);
        uint64_t v11 = [v10 integerValue];
        id v12 = [v5 objectForKeyedSubscript:v10];
        id v13 = objc_msgSend(NSString, "cam_localizedTitleForMode:wantsCompactTitle:", v11, objc_msgSend((id)objc_opt_class(), "wantsVerticalModeDialForLayoutStyle:", a3));
        [v12 setTitle:v13];

        id v14 = [(CAMModeDial *)self _fontForLayoutStyle:a3 selected:v11 == [(CAMModeDial *)self selectedMode]];
        [v12 setFont:v14];
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v7);
  }
  [(CAMModeDial *)self setNeedsLayout];
}

- (NSDictionary)_items
{
  return self->__items;
}

- (void)_updateSelectedItemBackgroundForLayoutStyle:(int64_t)a3
{
  switch(a3)
  {
    case 0:
    case 2:
    case 4:
      [(UIView *)self->__selectedItemBackgroundView removeFromSuperview];
      selectedItemBackgroundView = self->__selectedItemBackgroundView;
      self->__selectedItemBackgroundView = 0;

      break;
    case 1:
      id v5 = objc_alloc(MEMORY[0x263F82E00]);
      uint64_t v6 = (UIView *)objc_msgSend(v5, "initWithFrame:", *MEMORY[0x263F001A8], *(double *)(MEMORY[0x263F001A8] + 8), *(double *)(MEMORY[0x263F001A8] + 16), *(double *)(MEMORY[0x263F001A8] + 24));
      uint64_t v7 = self->__selectedItemBackgroundView;
      self->__selectedItemBackgroundView = v6;

      uint64_t v8 = self->__selectedItemBackgroundView;
      double v9 = [MEMORY[0x263F825C8] colorWithWhite:0.0 alpha:0.3];
      [(UIView *)v8 setBackgroundColor:v9];

      [(CAMModeDial *)self insertSubview:self->__selectedItemBackgroundView atIndex:0];
      break;
    default:
      break;
  }
  [(CAMModeDial *)self setNeedsLayout];
}

- (void)_updateContainerCenterFromSelectedModeAnimated:(BOOL)a3
{
  BOOL v3 = a3;
  int64_t v5 = [(CAMModeDial *)self selectedMode];
  int v6 = objc_msgSend((id)objc_opt_class(), "wantsVerticalModeDialForLayoutStyle:", -[CAMModeDial layoutStyle](self, "layoutStyle"));
  if (v6) {
    [(CAMModeDial *)self _verticalContainerCenterForMode:v5];
  }
  else {
    [(CAMModeDial *)self _horizontalContainerCenterForMode:v5];
  }
  double v9 = v7;
  double v10 = v8;
  uint64_t v11 = [(CAMModeDial *)self _itemsContainerView];
  id v12 = v11;
  if (v3)
  {
    id v13 = [v11 layer];
    id v14 = [v13 presentationLayer];
    [v14 position];
    double v16 = v15;
    double v18 = v17;

    v19 = [MEMORY[0x263F15760] animationWithKeyPath:@"position"];
    uint64_t v20 = objc_msgSend(MEMORY[0x263F08D40], "valueWithCGPoint:", v16, v18);
    [v19 setFromValue:v20];

    v21 = objc_msgSend(MEMORY[0x263F08D40], "valueWithCGPoint:", v9, v10);
    [v19 setToValue:v21];

    UIAnimationDragCoefficient();
    [v19 setDuration:v22 * 0.3];
    LODWORD(v23) = 1042536202;
    LODWORD(v24) = 1045220557;
    LODWORD(v25) = 0.25;
    LODWORD(v26) = 1.0;
    v27 = [MEMORY[0x263F15808] functionWithControlPoints:v25 :v23 :v24 :v26];
    [v19 setTimingFunction:v27];

    [v13 addAnimation:v19 forKey:@"centerTranslation"];
    objc_msgSend(v13, "setPosition:", v9, v10);

    if (!v6) {
      goto LABEL_11;
    }
  }
  else
  {
    objc_msgSend(v11, "setCenter:", v9, v10);
    if (!v6) {
      goto LABEL_11;
    }
  }
  uint64_t v34 = 0;
  v35 = (double *)&v34;
  uint64_t v36 = 0x2020000000;
  uint64_t v37 = 0;
  v28 = [(CAMModeDial *)self _items];
  v33[0] = MEMORY[0x263EF8330];
  v33[1] = 3221225472;
  v33[2] = __62__CAMModeDial__updateContainerCenterFromSelectedModeAnimated___block_invoke;
  v33[3] = &unk_263FA34C8;
  v33[4] = &v34;
  [v28 enumerateKeysAndObjectsUsingBlock:v33];
  UICeilToViewScale();
  double v30 = v29;
  v31 = [(CAMModeDial *)self _selectedItem];
  [v31 frame];
  if (CGRectGetHeight(v38) > v35[3] * 1.8) {
    UICeilToViewScale();
  }
  [(CAMModeDial *)self bounds];
  UIRectCenteredIntegralRectScale();
  [(UIView *)self->__selectedItemBackgroundView setFrame:0];
  v32 = [(UIView *)self->__selectedItemBackgroundView layer];
  [v32 setCornerRadius:v30 * 0.5];

  _Block_object_dispose(&v34, 8);
LABEL_11:
}

- (int64_t)selectedMode
{
  return self->_selectedMode;
}

- (CGPoint)_horizontalContainerCenterForMode:(int64_t)a3
{
  int64_t v5 = [(CAMModeDial *)self _itemsContainerView];
  int v6 = [v5 superview];
  [(CAMModeDial *)self bounds];
  CGFloat x = v22.origin.x;
  CGFloat y = v22.origin.y;
  CGFloat width = v22.size.width;
  CGFloat height = v22.size.height;
  double MidX = CGRectGetMidX(v22);
  v23.origin.CGFloat x = x;
  v23.origin.CGFloat y = y;
  v23.size.CGFloat width = width;
  v23.size.CGFloat height = height;
  objc_msgSend(v6, "convertPoint:fromView:", self, MidX, CGRectGetMidY(v23));
  id v12 = [(CAMModeDial *)self _selectedItem];
  [(CAMModeDial *)self _centeringNudgeForMode:a3];
  [v12 center];
  objc_msgSend(v6, "convertPoint:fromView:", v5);
  UIRoundToViewScale();
  double v14 = v13;
  [v5 center];
  double v16 = v15;
  double v18 = v14 + v17;

  double v19 = v18;
  double v20 = v16;
  result.CGFloat y = v20;
  result.CGFloat x = v19;
  return result;
}

- (UIView)_itemsContainerView
{
  return self->__itemsContainerView;
}

- (id)_selectedItem
{
  int64_t v3 = [(CAMModeDial *)self selectedMode];
  v4 = [(CAMModeDial *)self _items];
  int64_t v5 = [NSNumber numberWithInteger:v3];
  int v6 = [v4 objectForKeyedSubscript:v5];

  return v6;
}

- (double)_centeringNudgeForMode:(int64_t)a3
{
  switch(a3)
  {
    case 1:
      double result = 1.0 - CAMPixelWidthForView(self);
      break;
    case 2:
    case 4:
    case 5:
      double result = CAMPixelWidthForView(self);
      break;
    case 3:
      double result = -CAMPixelWidthForView(self);
      break;
    default:
      double result = 0.0;
      break;
  }
  return result;
}

- (void)reloadData
{
  uint64_t v40 = *MEMORY[0x263EF8340];
  int64_t v3 = [(CAMModeDial *)self dataSource];
  if (v3)
  {
    double v29 = [(CAMModeDial *)self _items];
    v28 = [v29 allValues];
    [v28 makeObjectsPerformSelector:sel_removeFromSuperview];
    double v30 = v3;
    v4 = [v3 modesForModeDial:self];
    [(CAMModeDial *)self _setModes:v4];
    int64_t v5 = [(CAMModeDial *)self selectedMode];
    int v6 = [NSNumber numberWithInteger:v5];
    char v7 = [v4 containsObject:v6];

    if ((v7 & 1) == 0)
    {
      double v8 = [NSNumber numberWithInteger:0];
      char v9 = [v4 containsObject:v8];

      uint64_t v10 = 0;
      if ((v9 & 1) == 0)
      {
        if ([v4 count])
        {
          uint64_t v11 = [v4 firstObject];
          uint64_t v10 = [v11 integerValue];
        }
        else
        {
          uint64_t v10 = 0;
        }
      }
      [(CAMModeDial *)self setSelectedMode:v10];
    }
    int64_t v33 = [(CAMModeDial *)self selectedMode];
    int64_t v12 = [(CAMModeDial *)self layoutStyle];
    id v34 = objc_alloc_init(MEMORY[0x263EFF9A0]);
    long long v35 = 0u;
    long long v36 = 0u;
    long long v37 = 0u;
    long long v38 = 0u;
    id obj = v4;
    uint64_t v13 = [obj countByEnumeratingWithState:&v35 objects:v39 count:16];
    if (v13)
    {
      uint64_t v14 = v13;
      uint64_t v32 = *(void *)v36;
      double v15 = *MEMORY[0x263F001A8];
      double v16 = *(double *)(MEMORY[0x263F001A8] + 8);
      double v17 = *(double *)(MEMORY[0x263F001A8] + 16);
      double v18 = *(double *)(MEMORY[0x263F001A8] + 24);
      do
      {
        uint64_t v19 = 0;
        do
        {
          if (*(void *)v36 != v32) {
            objc_enumerationMutation(obj);
          }
          double v20 = *(void **)(*((void *)&v35 + 1) + 8 * v19);
          uint64_t v21 = [v20 integerValue];
          CGRect v22 = -[CAMModeDialItem initWithFrame:]([CAMModeDialItem alloc], "initWithFrame:", v15, v16, v17, v18);
          [(CAMModeDialItem *)v22 setSelected:v21 == v33];
          CGRect v23 = objc_msgSend(NSString, "cam_localizedTitleForMode:wantsCompactTitle:", v21, objc_msgSend((id)objc_opt_class(), "wantsVerticalModeDialForLayoutStyle:", v12));
          [(CAMModeDialItem *)v22 setTitle:v23];
          double v24 = [(CAMModeDial *)self _fontForLayoutStyle:v12 selected:v21 == v33];
          [(CAMModeDialItem *)v22 setFont:v24];

          if ((unint64_t)(v12 - 2) < 3)
          {
LABEL_16:
            double v25 = +[CAMCaptureCapabilities capabilities];
            uint64_t v26 = [v25 isCTMSupported];

            goto LABEL_17;
          }
          if (v12 == 1)
          {
            uint64_t v26 = 1;
          }
          else
          {
            if (!v12) {
              goto LABEL_16;
            }
            uint64_t v26 = 0;
          }
LABEL_17:
          [(CAMModeDialItem *)v22 setShouldShadowTitleText:v26];
          [(UIView *)self->__itemsContainerView addSubview:v22];
          [v34 setObject:v22 forKey:v20];

          ++v19;
        }
        while (v14 != v19);
        uint64_t v27 = [obj countByEnumeratingWithState:&v35 objects:v39 count:16];
        uint64_t v14 = v27;
      }
      while (v27);
    }

    [(CAMModeDial *)self _setItems:v34];
    [(CAMModeDial *)self setNeedsLayout];

    int64_t v3 = v30;
  }
}

- (CAMModeDialDataSource)dataSource
{
  return self->_dataSource;
}

- (void)_setModes:(id)a3
{
}

- (void)setSelectedMode:(int64_t)a3
{
}

- (void)setSelectedMode:(int64_t)a3 animated:(BOOL)a4
{
  uint64_t v26 = *MEMORY[0x263EF8340];
  if (self->_selectedMode != a3)
  {
    BOOL v4 = a4;
    if (a4) {
      [(CAMModeDial *)self layoutIfNeeded];
    }
    char v7 = [(CAMModeDial *)self _items];
    double v8 = [NSNumber numberWithInteger:self->_selectedMode];
    char v9 = [v7 objectForKeyedSubscript:v8];

    self->_selectedMode = a3;
    uint64_t v10 = [NSNumber numberWithInteger:a3];
    uint64_t v11 = [v7 objectForKeyedSubscript:v10];

    double v20 = v9;
    [v9 setSelected:0 animated:v4];
    [v11 setSelected:1 animated:v4];
    long long v23 = 0u;
    long long v24 = 0u;
    long long v21 = 0u;
    long long v22 = 0u;
    id v12 = v7;
    uint64_t v13 = [v12 countByEnumeratingWithState:&v21 objects:v25 count:16];
    if (v13)
    {
      uint64_t v14 = v13;
      uint64_t v15 = *(void *)v22;
      do
      {
        for (uint64_t i = 0; i != v14; ++i)
        {
          if (*(void *)v22 != v15) {
            objc_enumerationMutation(v12);
          }
          double v17 = *(void **)(*((void *)&v21 + 1) + 8 * i);
          double v18 = [v12 objectForKeyedSubscript:v17];
          uint64_t v19 = -[CAMModeDial _fontForLayoutStyle:selected:](self, "_fontForLayoutStyle:selected:", self->_layoutStyle, [v17 integerValue] == a3);
          [v18 setFont:v19];
        }
        uint64_t v14 = [v12 countByEnumeratingWithState:&v21 objects:v25 count:16];
      }
      while (v14);
    }

    [(CAMModeDial *)self _updateContainerCenterFromSelectedModeAnimated:v4];
  }
}

- (void)_setItems:(id)a3
{
}

- (void)setDataSource:(id)a3
{
  self->_dataSource = (CAMModeDialDataSource *)a3;
}

- (void)layoutSubviews
{
  v3.receiver = self;
  v3.super_class = (Class)CAMModeDial;
  [(CAMModeDial *)&v3 layoutSubviews];
  if (objc_msgSend((id)objc_opt_class(), "wantsVerticalModeDialForLayoutStyle:", -[CAMModeDial layoutStyle](self, "layoutStyle")))-[CAMModeDial _layoutVerticalModeDial](self, "_layoutVerticalModeDial"); {
  else
  }
    [(CAMModeDial *)self _layoutHorizontalModeDial];
  [(CAMModeDial *)self _updateContainerCenterFromSelectedModeAnimated:0];
}

- (void)_layoutHorizontalModeDial
{
  uint64_t v49 = *MEMORY[0x263EF8340];
  [(CAMModeDial *)self bounds];
  CGFloat v4 = v3;
  CGFloat v6 = v5;
  CGFloat v8 = v7;
  CGFloat v10 = v9;
  [(CAMModeDial *)self _interpolatedHorizontalMeshTransformSize];
  double v12 = v11;
  double v14 = v13;
  v50.origin.CGFloat x = v4;
  v50.origin.CGFloat y = v6;
  v50.size.CGFloat width = v8;
  v50.size.CGFloat height = v10;
  CGRectGetWidth(v50);
  UIRoundToViewScale();
  double v16 = v15;
  v51.origin.CGFloat x = v4;
  v51.origin.CGFloat y = v6;
  v51.size.CGFloat width = v8;
  v51.size.CGFloat height = v10;
  CGFloat v17 = v16 + CGRectGetMinX(v51);
  v52.origin.CGFloat x = v4;
  CGFloat v18 = v4;
  v52.origin.CGFloat y = v6;
  v52.size.CGFloat width = v8;
  v52.size.CGFloat height = v10;
  CGFloat v19 = CGRectGetMaxY(v52) - v14;
  double v20 = [(CAMModeDial *)self _meshTransformView];
  objc_msgSend(v20, "setFrame:", v17, v19, v12, v14);
  v53.origin.CGFloat x = v17;
  v53.origin.CGFloat y = v19;
  v53.size.CGFloat width = v12;
  v53.size.CGFloat height = v14;
  double v43 = -CGRectGetMinX(v53);
  v54.origin.CGFloat x = v17;
  v54.origin.CGFloat y = v19;
  v54.size.CGFloat width = v12;
  v54.size.CGFloat height = v14;
  double v42 = -CGRectGetMinY(v54);
  long long v21 = [(CAMModeDial *)self _gradientLayer];
  objc_msgSend(v21, "setFrame:", *MEMORY[0x263F00148], *(double *)(MEMORY[0x263F00148] + 8), v12, v14);
  long long v22 = [(CAMModeDial *)self _modes];
  long long v23 = [(CAMModeDial *)self _items];
  v55.origin.CGFloat x = v18;
  v55.origin.CGFloat y = v6;
  v55.size.CGFloat width = v8;
  v55.size.CGFloat height = v10;
  CGFloat Width = CGRectGetWidth(v55);
  v56.origin.CGFloat x = v18;
  v56.origin.CGFloat y = v6;
  v56.size.CGFloat width = v8;
  v56.size.CGFloat height = v10;
  double Height = CGRectGetHeight(v56);
  long long v44 = 0u;
  long long v45 = 0u;
  long long v46 = 0u;
  long long v47 = 0u;
  id v26 = v22;
  uint64_t v27 = [v26 countByEnumeratingWithState:&v44 objects:v48 count:16];
  if (v27)
  {
    uint64_t v28 = v27;
    uint64_t v29 = *(void *)v45;
    double v30 = *MEMORY[0x263F001B0];
    double v31 = *(double *)(MEMORY[0x263F001B0] + 8);
    double v32 = 0.0;
    do
    {
      for (uint64_t i = 0; i != v28; ++i)
      {
        if (*(void *)v45 != v29) {
          objc_enumerationMutation(v26);
        }
        id v34 = [v23 objectForKey:*(void *)(*((void *)&v44 + 1) + 8 * i)];
        objc_msgSend(v34, "sizeThatFits:", v30, v31);
        double v36 = v35;
        double v38 = v37;
        v57.origin.CGFloat y = v42;
        v57.origin.CGFloat x = v43;
        v57.size.CGFloat width = Width;
        v57.size.CGFloat height = Height;
        CGRectGetHeight(v57);
        UIRoundToViewScale();
        CGFloat v40 = v39;
        objc_msgSend(v34, "setFrame:", v32, v39, v36, v38);
        v58.origin.CGFloat x = v32;
        v58.origin.CGFloat y = v40;
        v58.size.CGFloat width = v36;
        v58.size.CGFloat height = v38;
        double v32 = CGRectGetMaxX(v58) + 26.0;
      }
      uint64_t v28 = [v26 countByEnumeratingWithState:&v44 objects:v48 count:16];
    }
    while (v28);
  }
  else
  {
    double v32 = 0.0;
  }

  v41 = [(CAMModeDial *)self _itemsContainerView];
  objc_msgSend(v41, "setFrame:", v43, v42, v32, Height);
}

- (CGSize)_interpolatedHorizontalMeshTransformSize
{
  [(CAMModeDial *)self bounds];
  CGRectGetWidth(v8);
  UIRoundToViewScale();
  double v3 = v2;
  UIRoundToViewScale();
  double v5 = v4;
  double v6 = v3;
  result.CGFloat height = v5;
  result.CGFloat width = v6;
  return result;
}

- (UIView)_meshTransformView
{
  return self->__meshTransformView;
}

- (NSArray)_modes
{
  return self->__modes;
}

- (CAMModeDial)initWithFrame:(CGRect)a3
{
  double v4 = objc_msgSend(MEMORY[0x263F82670], "currentDevice", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  uint64_t v5 = objc_msgSend(v4, "cam_initialLayoutStyle");

  return [(CAMModeDial *)self initWithLayoutStyle:v5];
}

- (CAMModeDial)initWithCoder:(id)a3
{
  double v4 = objc_msgSend(MEMORY[0x263F82670], "currentDevice", a3);
  uint64_t v5 = objc_msgSend(v4, "cam_initialLayoutStyle");

  return [(CAMModeDial *)self initWithLayoutStyle:v5];
}

- (void)traitCollectionDidChange:(id)a3
{
  id v6 = [a3 preferredContentSizeCategory];
  double v4 = [(CAMModeDial *)self traitCollection];
  id v5 = [v4 preferredContentSizeCategory];

  if (v5 != v6 && ([v5 isEqualToString:v6] & 1) == 0) {
    [(CAMModeDial *)self reloadData];
  }
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  CGFloat height = a3.height;
  CGFloat width = a3.width;
  uint64_t v26 = *MEMORY[0x263EF8340];
  if (objc_msgSend((id)objc_opt_class(), "wantsVerticalModeDialForLayoutStyle:", -[CAMModeDial layoutStyle](self, "layoutStyle")))
  {
    id v6 = [(CAMModeDial *)self _modes];
    double v7 = [(CAMModeDial *)self _items];
    long long v21 = 0u;
    long long v22 = 0u;
    long long v23 = 0u;
    long long v24 = 0u;
    id v8 = v6;
    uint64_t v9 = [v8 countByEnumeratingWithState:&v21 objects:v25 count:16];
    if (v9)
    {
      uint64_t v10 = v9;
      uint64_t v11 = *(void *)v22;
      double v12 = *MEMORY[0x263F001B0];
      double v13 = *(double *)(MEMORY[0x263F001B0] + 8);
      double v14 = 0.0;
      do
      {
        for (uint64_t i = 0; i != v10; ++i)
        {
          if (*(void *)v22 != v11) {
            objc_enumerationMutation(v8);
          }
          double v16 = objc_msgSend(v7, "objectForKey:", *(void *)(*((void *)&v21 + 1) + 8 * i), (void)v21);
          objc_msgSend(v16, "sizeThatFits:", v12, v13);
          if (v17 > v14) {
            double v14 = v17;
          }
        }
        uint64_t v10 = [v8 countByEnumeratingWithState:&v21 objects:v25 count:16];
      }
      while (v10);
    }

    UIRoundToViewScale();
    CGFloat width = v18;
  }
  double v19 = width;
  double v20 = height;
  result.CGFloat height = v20;
  result.CGFloat width = v19;
  return result;
}

- (void)_layoutVerticalModeDial
{
  uint64_t v42 = *MEMORY[0x263EF8340];
  [(CAMModeDial *)self bounds];
  double v4 = v3;
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  id v34 = [(CAMModeDial *)self _meshTransformView];
  double v35 = v4;
  double v36 = v6;
  objc_msgSend(v34, "setFrame:", v4, v6, v8, v10);
  uint64_t v11 = [(CAMModeDial *)self _gradientLayer];
  double v12 = v8;
  objc_msgSend(v11, "setFrame:", *MEMORY[0x263F00148], *(double *)(MEMORY[0x263F00148] + 8), v8, v10);
  double v13 = [(CAMModeDial *)self _modes];
  double v14 = [(CAMModeDial *)self _items];
  double v15 = [(CAMModeDial *)self _itemsContainerView];
  long long v37 = 0u;
  long long v38 = 0u;
  long long v39 = 0u;
  long long v40 = 0u;
  id v16 = v13;
  uint64_t v17 = [v16 countByEnumeratingWithState:&v37 objects:v41 count:16];
  if (v17)
  {
    uint64_t v18 = v17;
    uint64_t v19 = *(void *)v38;
    double v20 = *MEMORY[0x263F001B0];
    double v21 = *(double *)(MEMORY[0x263F001B0] + 8);
    do
    {
      for (uint64_t i = 0; i != v18; ++i)
      {
        if (*(void *)v38 != v19) {
          objc_enumerationMutation(v16);
        }
        long long v23 = [v14 objectForKey:*(void *)(*((void *)&v37 + 1) + 8 * i)];
        objc_msgSend(v23, "sizeThatFits:", v20, v21);
        v43.origin.CGFloat x = v35;
        v43.origin.CGFloat y = v36;
        v43.size.CGFloat width = v12;
        v43.size.CGFloat height = v10;
        CGRectGetWidth(v43);
        long long v24 = [(CAMModeDial *)self traitCollection];
        [v24 displayScale];
        UIRectIntegralWithScale();
        double v26 = v25;
        double v28 = v27;
        double v30 = v29;
        double v32 = v31;

        objc_msgSend(v23, "setFrame:", v26, v28, v30, v32);
        v44.origin.CGFloat x = v26;
        v44.origin.CGFloat y = v28;
        v44.size.CGFloat width = v30;
        v44.size.CGFloat height = v32;
        double v33 = CGRectGetMaxY(v44) + 30.0;
      }
      uint64_t v18 = [v16 countByEnumeratingWithState:&v37 objects:v41 count:16];
    }
    while (v18);
  }
  else
  {
    double v33 = 0.0;
  }

  objc_msgSend(v15, "setFrame:", v35, v36, v12, v33);
}

- (CGPoint)_verticalContainerCenterForMode:(int64_t)a3
{
  double v4 = [(CAMModeDial *)self _itemsContainerView];
  double v5 = [v4 superview];
  [(CAMModeDial *)self bounds];
  CGFloat x = v21.origin.x;
  CGFloat y = v21.origin.y;
  CGFloat width = v21.size.width;
  CGFloat height = v21.size.height;
  double MidX = CGRectGetMidX(v21);
  v22.origin.CGFloat x = x;
  v22.origin.CGFloat y = y;
  v22.size.CGFloat width = width;
  v22.size.CGFloat height = height;
  objc_msgSend(v5, "convertPoint:fromView:", self, MidX, CGRectGetMidY(v22));
  uint64_t v11 = [(CAMModeDial *)self _selectedItem];
  [v11 center];
  objc_msgSend(v5, "convertPoint:fromView:", v4);
  UIRoundToViewScale();
  double v13 = v12;
  [v4 center];
  double v15 = v14;
  double v17 = v13 + v16;

  double v18 = v15;
  double v19 = v17;
  result.CGFloat y = v19;
  result.CGFloat x = v18;
  return result;
}

void __62__CAMModeDial__updateContainerCenterFromSelectedModeAnimated___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  [a3 frame];
  double Height = CGRectGetHeight(v8);
  uint64_t v5 = *(void *)(*(void *)(a1 + 32) + 8);
  double v6 = *(double *)(v5 + 24);
  if (v6 == 0.0 || v6 > Height) {
    *(double *)(v5 + 24) = Height;
  }
}

- (id)_fontForLayoutStyle:(int64_t)a3 selected:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v5 = [(CAMModeDial *)self traitCollection];
  double v6 = [v5 preferredContentSizeCategory];

  double v7 = +[CAMFont cameraModeDialFontForContentSize:v6];
  if (v4)
  {
    CGRect v8 = +[CAMCaptureCapabilities capabilities];
    int v9 = [v8 isCTMSupported];

    if (v9)
    {
      uint64_t v10 = +[CAMFont cameraModeDialFontForContentSize:v6 weight:*MEMORY[0x263F81840]];

      double v7 = (void *)v10;
    }
  }

  return v7;
}

- (int64_t)_nearestCaptureModeForLocation:(CGPoint)a3
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  BOOL v4 = [(CAMModeDial *)self _modes];
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  uint64_t v5 = [v4 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    int64_t v7 = 0;
    uint64_t v8 = *(void *)v18;
    double v9 = 1.79769313e308;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v18 != v8) {
          objc_enumerationMutation(v4);
        }
        uint64_t v11 = *(void **)(*((void *)&v17 + 1) + 8 * i);
        double v12 = [(CAMModeDial *)self _items];
        double v13 = [v12 objectForKeyedSubscript:v11];
        [v13 frame];
        UIDistanceBetweenPointAndRect();
        if (v14 < v9)
        {
          double v15 = v14;
          int64_t v7 = [v11 integerValue];
          double v9 = v15;
        }
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v17 objects:v21 count:16];
    }
    while (v6);
  }
  else
  {
    int64_t v7 = 0;
  }

  return v7;
}

- (void)touchesEnded:(id)a3 withEvent:(id)a4
{
  id v12 = [a3 anyObject];
  uint64_t v5 = [(CAMModeDial *)self _itemsContainerView];
  [v12 locationInView:v5];
  double v7 = v6;
  double v9 = v8;
  int64_t v10 = [(CAMModeDial *)self selectedMode];
  int64_t v11 = -[CAMModeDial _nearestCaptureModeForLocation:](self, "_nearestCaptureModeForLocation:", v7, v9);
  if (v10 != v11)
  {
    [(CAMModeDial *)self setSelectedMode:v11 animated:1];
    [(CAMModeDial *)self sendActionsForControlEvents:4096];
  }
}

- (void)setLayoutStyle:(int64_t)a3
{
  if (self->_layoutStyle != a3)
  {
    self->_layoutStyle = a3;
    [(CAMModeDial *)self _updateForLayoutStyle];
  }
}

- (id)hudItemForAccessibilityHUDManager:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(CAMModeDial *)self _itemsContainerView];
  [v4 locationOfAccessibilityGestureInView:v5];
  double v7 = v6;
  double v9 = v8;

  int64_t v10 = -[CAMModeDial _nearestCaptureModeForLocation:](self, "_nearestCaptureModeForLocation:", v7, v9);
  int64_t v11 = [NSNumber numberWithInteger:v10];
  id v12 = [(NSDictionary *)self->__items objectForKeyedSubscript:v11];
  double v13 = [v12 title];
  id v14 = objc_alloc(MEMORY[0x263F823C0]);
  double v15 = objc_msgSend(v14, "initWithTitle:image:imageInsets:", v13, 0, *MEMORY[0x263F834E8], *(double *)(MEMORY[0x263F834E8] + 8), *(double *)(MEMORY[0x263F834E8] + 16), *(double *)(MEMORY[0x263F834E8] + 24));

  return v15;
}

- (void)selectedByAccessibilityHUDManager:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(CAMModeDial *)self _itemsContainerView];
  [v4 locationOfAccessibilityGestureInView:v5];
  double v7 = v6;
  double v9 = v8;

  int64_t v10 = -[CAMModeDial _nearestCaptureModeForLocation:](self, "_nearestCaptureModeForLocation:", v7, v9);
  if (v10 != [(CAMModeDial *)self selectedMode])
  {
    [(CAMModeDial *)self setSelectedMode:v10 animated:1];
    [(CAMModeDial *)self sendActionsForControlEvents:4096];
  }
}

- (UIView)_selectedItemBackgroundView
{
  return self->__selectedItemBackgroundView;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->__itemsContainerView, 0);
  objc_storeStrong((id *)&self->__gradientLayer, 0);
  objc_storeStrong((id *)&self->__meshTransformView, 0);
  objc_storeStrong((id *)&self->__items, 0);
  objc_storeStrong((id *)&self->__modes, 0);
  objc_storeStrong((id *)&self->__selectedItemBackgroundView, 0);
}

@end