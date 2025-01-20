@interface AVPlaybackControlsRoutePickerView
- (AVButton)customButton;
- (AVLayoutItemAttributes)layoutAttributes;
- (AVPlaybackControlsRoutePickerView)initWithFrame:(CGRect)a3;
- (AVPlaybackControlsRoutePickerView)initWithSecondGenerationButton:(BOOL)a3;
- (BOOL)hasAlternateAppearance;
- (BOOL)hasFullScreenAppearance;
- (BOOL)isCollapsed;
- (BOOL)isCollapsedOrExcluded;
- (BOOL)isIncluded;
- (BOOL)isRemoved;
- (CGSize)extrinsicContentSize;
- (CGSize)intrinsicContentSize;
- (NSString)currentMicaPackageName;
- (void)_updateCustomButtonMicaPackage;
- (void)_updateLayoutItem;
- (void)layoutAttributesDidChange;
- (void)setCollapsed:(BOOL)a3;
- (void)setCurrentMicaPackageName:(id)a3;
- (void)setExtrinsicContentSize:(CGSize)a3;
- (void)setHasAlternateAppearance:(BOOL)a3;
- (void)setHasFullScreenAppearance:(BOOL)a3;
- (void)setIncluded:(BOOL)a3;
- (void)setPrioritizesVideoDevices:(BOOL)a3;
- (void)setRemoved:(BOOL)a3;
- (void)updateButtonAppearance;
@end

@implementation AVPlaybackControlsRoutePickerView

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_currentMicaPackageName, 0);
  objc_storeStrong((id *)&self->_layoutAttributes, 0);

  objc_storeStrong((id *)&self->_customButton, 0);
}

- (NSString)currentMicaPackageName
{
  return self->_currentMicaPackageName;
}

- (BOOL)hasFullScreenAppearance
{
  return self->_hasFullScreenAppearance;
}

- (void)setHasAlternateAppearance:(BOOL)a3
{
  self->_hasAlternateAppearance = a3;
}

- (BOOL)hasAlternateAppearance
{
  return self->_hasAlternateAppearance;
}

- (BOOL)isRemoved
{
  return self->_removed;
}

- (AVLayoutItemAttributes)layoutAttributes
{
  return self->_layoutAttributes;
}

- (void)_updateLayoutItem
{
  v3 = [(AVPlaybackControlsRoutePickerView *)self layoutAttributes];
  [(AVPlaybackControlsRoutePickerView *)self intrinsicContentSize];
  objc_msgSend(v3, "setMinimumSize:");

  v4 = [(AVPlaybackControlsRoutePickerView *)self layoutAttributes];
  objc_msgSend(v4, "setIncluded:", -[AVPlaybackControlsRoutePickerView isIncluded](self, "isIncluded"));

  id v5 = [(AVPlaybackControlsRoutePickerView *)self layoutAttributes];
  objc_msgSend(v5, "setCollapsed:", -[AVPlaybackControlsRoutePickerView isCollapsed](self, "isCollapsed"));
}

- (CGSize)intrinsicContentSize
{
  v13.receiver = self;
  v13.super_class = (Class)AVPlaybackControlsRoutePickerView;
  [(AVRoutePickerView *)&v13 intrinsicContentSize];
  double v4 = v3;
  double v6 = v5;
  [(AVPlaybackControlsRoutePickerView *)self extrinsicContentSize];
  if (v7 > 0.0)
  {
    [(AVPlaybackControlsRoutePickerView *)self extrinsicContentSize];
    double v4 = v8;
  }
  [(AVPlaybackControlsRoutePickerView *)self extrinsicContentSize];
  if (v9 > 0.0)
  {
    [(AVPlaybackControlsRoutePickerView *)self extrinsicContentSize];
    double v6 = v10;
  }
  double v11 = v4;
  double v12 = v6;
  result.height = v12;
  result.width = v11;
  return result;
}

- (void)updateButtonAppearance
{
  v30.receiver = self;
  v30.super_class = (Class)AVPlaybackControlsRoutePickerView;
  [(AVRoutePickerView *)&v30 updateButtonAppearance];
  if ([(AVRoutePickerView *)self isAirPlayActive])
  {
    double v3 = 0;
  }
  else
  {
    double v4 = [MEMORY[0x1E4FB1618] whiteColor];
    double v3 = [v4 colorWithAlphaComponent:0.55];

    double v5 = [(AVPlaybackControlsRoutePickerView *)self customButton];
    double v6 = [v5 micaPackage];
    double v7 = [v6 rootLayer];

    [v7 setCompositingFilter:*MEMORY[0x1E4F3A2E8]];
  }
  BOOL v8 = [(AVRoutePickerView *)self isAirPlayActive];
  double v9 = @"off";
  if (v8) {
    double v9 = @"on";
  }
  double v10 = v9;
  double v11 = [(AVPlaybackControlsRoutePickerView *)self customButton];
  double v12 = [v11 micaPackage];
  id v13 = v3;
  objc_msgSend(v12, "setState:color:", v10, objc_msgSend(v13, "CGColor"));

  v14 = [(AVPlaybackControlsRoutePickerView *)self customButton];
  v15 = [v14 micaPackage];
  [v15 setState:v10 color:0];

  v16 = [(AVPlaybackControlsRoutePickerView *)self customButton];
  v17 = [v16 micaPackage];
  [(AVPlaybackControlsRoutePickerView *)self extrinsicContentSize];
  objc_msgSend(v17, "setTargetSize:");

  v18 = [(AVPlaybackControlsRoutePickerView *)self customButton];
  objc_msgSend(v18, "setHasAlternateAppearance:", -[AVRoutePickerView isAirPlayActive](self, "isAirPlayActive"));

  int v19 = [(AVPlaybackControlsRoutePickerView *)self isCollapsedOrExcluded];
  if (v19 != [(AVPlaybackControlsRoutePickerView *)self isHidden]
    || (!v19 ? (double v20 = 1.0) : (double v20 = 0.0), [(AVPlaybackControlsRoutePickerView *)self alpha], v21 != v20))
  {
    [(UIView *)self avkit_reevaluateHiddenStateOfItem:self];
    if ((v19 & 1) == 0)
    {
      v22 = [(AVPlaybackControlsRoutePickerView *)self customButton];
      [v22 frame];
      double v24 = v23;
      double v26 = v25;
      uint64_t v27 = MEMORY[0x1E4F1DB30];
      double v28 = *MEMORY[0x1E4F1DB30];

      if (v24 == v28 && v26 == *(double *)(v27 + 8))
      {
        v29 = [(AVPlaybackControlsRoutePickerView *)self customButton];
        [v29 invalidateIntrinsicContentSize];

        [(AVPlaybackControlsRoutePickerView *)self invalidateIntrinsicContentSize];
      }
    }
  }
}

- (void)setHasFullScreenAppearance:(BOOL)a3
{
  BOOL v3 = a3;
  self->_hasFullScreenAppearance = a3;
  double v4 = [(AVPlaybackControlsRoutePickerView *)self customButton];
  if (v3)
  {
    CGAffineTransformMakeTranslation(&v10, 0.0, 1.0);
    double v5 = &v10;
  }
  else
  {
    long long v6 = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 16);
    long long v7 = *MEMORY[0x1E4F1DAB8];
    long long v8 = v6;
    long long v9 = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 32);
    double v5 = (CGAffineTransform *)&v7;
  }
  objc_msgSend(v4, "setTransform:", v5, v7, v8, v9);
}

- (void)_updateCustomButtonMicaPackage
{
  uint64_t v3 = [(AVPlaybackControlsRoutePickerView *)self effectiveUserInterfaceLayoutDirection];
  objc_initWeak(&location, self);
  double v4 = [(AVPlaybackControlsRoutePickerView *)self currentMicaPackageName];
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __67__AVPlaybackControlsRoutePickerView__updateCustomButtonMicaPackage__block_invoke;
  v5[3] = &unk_1E5FC3DE8;
  objc_copyWeak(&v6, &location);
  +[AVMicaPackage asynchronouslyPrepareMicaPackageWithName:v4 layoutDirection:v3 completion:v5];

  objc_destroyWeak(&v6);
  objc_destroyWeak(&location);
}

void __67__AVPlaybackControlsRoutePickerView__updateCustomButtonMicaPackage__block_invoke(uint64_t a1, void *a2)
{
  v2 = (id *)(a1 + 32);
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained(v2);
  double v5 = [WeakRetained customButton];
  [v5 setMicaPackage:v3];

  id v6 = objc_loadWeakRetained(v2);
  [v6 updateButtonAppearance];
}

- (void)setCurrentMicaPackageName:(id)a3
{
  id v8 = a3;
  id v5 = [(AVPlaybackControlsRoutePickerView *)self currentMicaPackageName];

  if (v5 != v8)
  {
    objc_storeStrong((id *)&self->_currentMicaPackageName, a3);
    [(AVPlaybackControlsRoutePickerView *)self _updateCustomButtonMicaPackage];
    if ((__CFString *)self->_currentMicaPackageName == @"AVRoutePickerViewCircularAirPlayGlyph")
    {
      id v6 = [(AVPlaybackControlsRoutePickerView *)self customButton];
      [v6 setImageName:@"AVMobileImageNameNoImage"];

      long long v7 = [(AVPlaybackControlsRoutePickerView *)self customButton];
      [v7 setAlternateImageName:@"AVMobileImageNameNoImage"];
    }
  }
}

- (void)setPrioritizesVideoDevices:(BOOL)a3
{
  v5.receiver = self;
  v5.super_class = (Class)AVPlaybackControlsRoutePickerView;
  [(AVRoutePickerView *)&v5 setPrioritizesVideoDevices:a3];
  if ([(AVRoutePickerView *)self prioritizesVideoDevices]) {
    double v4 = @"AVRoutePickerViewSquareAirPlayGlyph";
  }
  else {
    double v4 = @"AVRoutePickerViewCircularAirPlayGlyph";
  }
  [(AVPlaybackControlsRoutePickerView *)self setCurrentMicaPackageName:v4];
}

- (AVButton)customButton
{
  customButton = self->_customButton;
  if (!customButton)
  {
    BOOL secondGenerationButton = self->_secondGenerationButton;
    objc_super v5 = [(AVPlaybackControlsRoutePickerView *)self layer];
    [v5 setAllowsGroupBlending:0];

    id v6 = +[AVButton buttonWithAccessibilityIdentifier:@"AirPlay" isSecondGeneration:secondGenerationButton];
    long long v7 = self->_customButton;
    self->_customButton = v6;
    id v8 = v6;

    [(AVButton *)self->_customButton setIncluded:[(AVPlaybackControlsRoutePickerView *)self isIncluded]];
    [(AVButton *)self->_customButton setCollapsed:[(AVPlaybackControlsRoutePickerView *)self isCollapsed]];
    long long v9 = self->_customButton;
    [(AVPlaybackControlsRoutePickerView *)self extrinsicContentSize];
    -[AVButton setExtrinsicContentSize:](v9, "setExtrinsicContentSize:");
    CGAffineTransform v10 = self->_customButton;
    [(AVPlaybackControlsRoutePickerView *)self bounds];
    -[AVButton setFrame:](v10, "setFrame:");
    [(AVPlaybackControlsRoutePickerView *)self updateButtonAppearance];
    double v11 = [(AVPlaybackControlsRoutePickerView *)self currentMicaPackageName];
    [(AVPlaybackControlsRoutePickerView *)self setCurrentMicaPackageName:v11];

    [(AVButton *)v8 setImageName:@"AVMobileImageNameNoImage"];
    [(AVButton *)v8 setAlternateImageName:@"AVMobileImageNameNoImage"];
    [(AVButton *)v8 setMicaSnapshotAlpha:0.55];

    customButton = self->_customButton;
  }

  return customButton;
}

- (void)layoutAttributesDidChange
{
  id v3 = [(AVPlaybackControlsRoutePickerView *)self layoutAttributes];
  -[AVPlaybackControlsRoutePickerView setCollapsed:](self, "setCollapsed:", [v3 isCollapsed]);
}

- (void)setExtrinsicContentSize:(CGSize)a3
{
  double height = a3.height;
  double width = a3.width;
  id v6 = [(AVPlaybackControlsRoutePickerView *)self customButton];
  [v6 extrinsicContentSize];
  double v8 = v7;
  double v10 = v9;

  if (width != v8 || height != v10)
  {
    double v12 = [(AVPlaybackControlsRoutePickerView *)self customButton];
    objc_msgSend(v12, "setExtrinsicContentSize:", width, height);

    id v13 = [(AVPlaybackControlsRoutePickerView *)self customButton];
    [v13 invalidateIntrinsicContentSize];

    [(AVPlaybackControlsRoutePickerView *)self invalidateIntrinsicContentSize];
    [(AVPlaybackControlsRoutePickerView *)self _updateLayoutItem];
  }
}

- (CGSize)extrinsicContentSize
{
  v2 = [(AVPlaybackControlsRoutePickerView *)self customButton];
  [v2 extrinsicContentSize];
  double v4 = v3;
  double v6 = v5;

  double v7 = v4;
  double v8 = v6;
  result.double height = v8;
  result.double width = v7;
  return result;
}

- (void)setRemoved:(BOOL)a3
{
  if (self->_removed != a3)
  {
    BOOL v3 = a3;
    self->_removed = a3;
    double v5 = [(AVPlaybackControlsRoutePickerView *)self customButton];
    [v5 setRemoved:v3];

    [(AVPlaybackControlsRoutePickerView *)self updateButtonAppearance];
  }
}

- (void)setCollapsed:(BOOL)a3
{
  BOOL v3 = a3;
  double v5 = [(AVPlaybackControlsRoutePickerView *)self customButton];
  int v6 = [v5 isCollapsed];

  if (v6 != v3)
  {
    double v7 = [(AVPlaybackControlsRoutePickerView *)self customButton];
    [v7 setCollapsed:v3];

    [(AVPlaybackControlsRoutePickerView *)self _updateLayoutItem];
    [(AVPlaybackControlsRoutePickerView *)self updateButtonAppearance];
  }
}

- (BOOL)isCollapsed
{
  v2 = [(AVPlaybackControlsRoutePickerView *)self customButton];
  char v3 = [v2 isCollapsed];

  return v3;
}

- (void)setIncluded:(BOOL)a3
{
  BOOL v3 = a3;
  double v5 = [(AVPlaybackControlsRoutePickerView *)self customButton];
  int v6 = [v5 isIncluded];

  if (v6 != v3)
  {
    double v7 = [(AVPlaybackControlsRoutePickerView *)self customButton];
    [v7 setIncluded:v3];

    [(AVPlaybackControlsRoutePickerView *)self _updateLayoutItem];
    [(AVPlaybackControlsRoutePickerView *)self updateButtonAppearance];
  }
}

- (BOOL)isIncluded
{
  v2 = [(AVPlaybackControlsRoutePickerView *)self customButton];
  char v3 = [v2 isIncluded];

  return v3;
}

- (BOOL)isCollapsedOrExcluded
{
  v2 = [(AVPlaybackControlsRoutePickerView *)self customButton];
  char v3 = [v2 isCollapsedOrExcluded];

  return v3;
}

- (AVPlaybackControlsRoutePickerView)initWithSecondGenerationButton:(BOOL)a3
{
  CGSize result = -[AVPlaybackControlsRoutePickerView initWithFrame:](self, "initWithFrame:", *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
  if (result) {
    result->_BOOL secondGenerationButton = a3;
  }
  return result;
}

- (AVPlaybackControlsRoutePickerView)initWithFrame:(CGRect)a3
{
  v9.receiver = self;
  v9.super_class = (Class)AVPlaybackControlsRoutePickerView;
  char v3 = -[AVRoutePickerView initWithFrame:](&v9, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  double v4 = v3;
  if (v3)
  {
    v3->_BOOL secondGenerationButton = 1;
    double v5 = objc_alloc_init(AVLayoutItemAttributes);
    layoutAttributes = v4->_layoutAttributes;
    v4->_layoutAttributes = v5;

    double v7 = v4->_layoutAttributes;
    [(AVPlaybackControlsRoutePickerView *)v4 intrinsicContentSize];
    -[AVLayoutItemAttributes setMinimumSize:](v7, "setMinimumSize:");
    [(AVLayoutItemAttributes *)v4->_layoutAttributes setCollapsed:[(AVPlaybackControlsRoutePickerView *)v4 isCollapsed]];
    [(AVLayoutItemAttributes *)v4->_layoutAttributes setIncluded:[(AVPlaybackControlsRoutePickerView *)v4 isIncluded]];
    [(AVLayoutItemAttributes *)v4->_layoutAttributes setHasFlexibleContentSize:0];
    [(AVLayoutItemAttributes *)v4->_layoutAttributes setAccessibilityIdentifier:@"Airplay"];
  }
  return v4;
}

@end