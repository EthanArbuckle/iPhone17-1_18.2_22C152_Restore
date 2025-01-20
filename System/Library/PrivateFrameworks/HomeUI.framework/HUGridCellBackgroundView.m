@interface HUGridCellBackgroundView
+ (id)_sharedBlurEffect;
- (BOOL)_shouldUseCCMaterialView;
- (BOOL)_shouldUsePrecomputedWallpaperContents;
- (BOOL)_shouldUseVisualEffectStyle;
- (BOOL)isPressed;
- (BOOL)useDefaultCellBackgroundColor;
- (CGRect)normalizedWallpaperRect;
- (HUBackgroundEffectViewGrouping)backgroundEffectViewGrouper;
- (HUGridCellBackgroundDisplayOptions)displayOptions;
- (UIBlurEffect)overrideBackgroundEffect;
- (UIColor)backgroundTintColor;
- (UIView)ccHighlightMaterialView;
- (UIView)ccOffMaterialView;
- (UIView)ccOnMaterialView;
- (UIVisualEffectView)effectView;
- (double)cornerRadius;
- (id)_normalBackgroundColor;
- (unint64_t)backgroundState;
- (void)_createEffectViewIfNecessary;
- (void)_createHighlightCCMateriaViewIfNecessary;
- (void)_createOffCCMaterialViewIfNecessary;
- (void)_createOnCCMaterialViewIfNecessary;
- (void)_updateBackgroundColor;
- (void)_updateCornerRadius;
- (void)_updateDisplay;
- (void)_updateHighlightView;
- (void)_updateWallpaperContentsRect;
- (void)dealloc;
- (void)setBackgroundEffectViewGrouper:(id)a3;
- (void)setBackgroundState:(unint64_t)a3;
- (void)setBackgroundTintColor:(id)a3;
- (void)setCcHighlightMaterialView:(id)a3;
- (void)setCcOffMaterialView:(id)a3;
- (void)setCcOnMaterialView:(id)a3;
- (void)setCornerRadius:(double)a3;
- (void)setDisplayOptions:(id)a3;
- (void)setEffectView:(id)a3;
- (void)setNormalizedWallpaperRect:(CGRect)a3;
- (void)setOverrideBackgroundEffect:(id)a3;
- (void)setPressed:(BOOL)a3;
- (void)setUseDefaultCellBackgroundColor:(BOOL)a3;
- (void)traitCollectionDidChange:(id)a3;
@end

@implementation HUGridCellBackgroundView

+ (id)_sharedBlurEffect
{
  if (qword_1EBA46908 != -1) {
    dispatch_once(&qword_1EBA46908, &__block_literal_global_109);
  }
  v2 = (void *)_MergedGlobals_1_1;

  return v2;
}

void __45__HUGridCellBackgroundView__sharedBlurEffect__block_invoke()
{
  uint64_t v0 = [MEMORY[0x1E4F427D8] effectWithStyle:7];
  v1 = (void *)_MergedGlobals_1_1;
  _MergedGlobals_1_1 = v0;
}

- (void)_createEffectViewIfNecessary
{
  v3 = [(HUGridCellBackgroundView *)self effectView];

  if (!v3)
  {
    v4 = (void *)[objc_alloc(MEMORY[0x1E4F43028]) initWithEffect:0];
    [(HUGridCellBackgroundView *)self setEffectView:v4];

    v5 = [(HUGridCellBackgroundView *)self effectView];
    [v5 setAutoresizingMask:18];

    if ([MEMORY[0x1E4F69758] isAMac])
    {
      v6 = [(HUGridCellBackgroundView *)self traitCollection];
      uint64_t v7 = [v6 userInterfaceStyle];

      if (v7 == 1)
      {
        id v10 = [(HUGridCellBackgroundView *)self effectView];
        v8 = [v10 contentView];
        v9 = [MEMORY[0x1E4F428B8] systemMidGrayTintColor];
        [v8 setBackgroundColor:v9];
      }
    }
  }
}

- (void)_createOffCCMaterialViewIfNecessary
{
  v3 = [(HUGridCellBackgroundView *)self ccOffMaterialView];

  if (v3) {
    return;
  }
  v4 = [(HUGridCellBackgroundView *)self displayOptions];
  uint64_t v5 = [v4 displayStyle];

  if (v5 == 3)
  {
    uint64_t v6 = [MEMORY[0x1E4F5AE10] controlCenterModuleBackgroundMaterial];
LABEL_6:
    v9 = (void *)v6;
    [(HUGridCellBackgroundView *)self setCcOffMaterialView:v6];

    goto LABEL_7;
  }
  uint64_t v7 = [(HUGridCellBackgroundView *)self displayOptions];
  uint64_t v8 = [v7 displayStyle];

  if (v8 == 2)
  {
    uint64_t v6 = [MEMORY[0x1E4F5AE10] controlCenterTertiaryCapturingMaterial];
    goto LABEL_6;
  }
LABEL_7:
  [(HUGridCellBackgroundView *)self bounds];
  double v11 = v10;
  double v13 = v12;
  double v15 = v14;
  double v17 = v16;
  v18 = [(HUGridCellBackgroundView *)self ccOffMaterialView];
  objc_msgSend(v18, "setFrame:", v11, v13, v15, v17);

  id v19 = [(HUGridCellBackgroundView *)self ccOffMaterialView];
  [v19 setAutoresizingMask:18];
}

- (void)_createOnCCMaterialViewIfNecessary
{
  v3 = [(HUGridCellBackgroundView *)self ccOnMaterialView];

  if (!v3)
  {
    id v4 = objc_alloc_init(MEMORY[0x1E4F42FF0]);
    [(HUGridCellBackgroundView *)self setCcOnMaterialView:v4];

    uint64_t v5 = [MEMORY[0x1E4F428B8] whiteColor];
    uint64_t v6 = [(HUGridCellBackgroundView *)self ccOnMaterialView];
    [v6 setBackgroundColor:v5];

    [(HUGridCellBackgroundView *)self bounds];
    double v8 = v7;
    double v10 = v9;
    double v12 = v11;
    double v14 = v13;
    double v15 = [(HUGridCellBackgroundView *)self ccOnMaterialView];
    objc_msgSend(v15, "setFrame:", v8, v10, v12, v14);

    id v16 = [(HUGridCellBackgroundView *)self ccOnMaterialView];
    [v16 setAutoresizingMask:18];
  }
}

- (void)_createHighlightCCMateriaViewIfNecessary
{
  v3 = [(HUGridCellBackgroundView *)self ccHighlightMaterialView];

  if (!v3)
  {
    id v4 = [MEMORY[0x1E4F5AE10] controlCenterLightFill];
    [(HUGridCellBackgroundView *)self setCcHighlightMaterialView:v4];

    uint64_t v5 = [(HUGridCellBackgroundView *)self ccHighlightMaterialView];
    [v5 setAlpha:0.0];

    [(HUGridCellBackgroundView *)self bounds];
    double v7 = v6;
    double v9 = v8;
    double v11 = v10;
    double v13 = v12;
    double v14 = [(HUGridCellBackgroundView *)self ccHighlightMaterialView];
    objc_msgSend(v14, "setFrame:", v7, v9, v11, v13);

    id v15 = [(HUGridCellBackgroundView *)self ccHighlightMaterialView];
    [v15 setAutoresizingMask:18];
  }
}

- (void)dealloc
{
  uint64_t v3 = [(HUGridCellBackgroundView *)self backgroundEffectViewGrouper];
  if (v3)
  {
    id v4 = (void *)v3;
    uint64_t v5 = [(HUGridCellBackgroundView *)self effectView];

    if (v5)
    {
      double v6 = [(HUGridCellBackgroundView *)self backgroundEffectViewGrouper];
      double v7 = [(HUGridCellBackgroundView *)self effectView];
      [v6 backgroundEffectRemoveCaptureDependent:v7 forBackgroundEffectIdentifier:@"HUSharedVisualEffectIdentifierTileOff"];
    }
  }
  v8.receiver = self;
  v8.super_class = (Class)HUGridCellBackgroundView;
  [(HUGridCellBackgroundView *)&v8 dealloc];
}

- (void)setCornerRadius:(double)a3
{
  self->_cornerRadius = a3;
  [(HUGridCellBackgroundView *)self _updateCornerRadius];
}

- (void)setDisplayOptions:(id)a3
{
  objc_storeStrong((id *)&self->_displayOptions, a3);

  [(HUGridCellBackgroundView *)self _updateDisplay];
}

- (void)setBackgroundTintColor:(id)a3
{
  objc_storeStrong((id *)&self->_backgroundTintColor, a3);

  [(HUGridCellBackgroundView *)self _updateBackgroundColor];
}

- (void)setOverrideBackgroundEffect:(id)a3
{
  id v5 = a3;
  double v6 = self->_overrideBackgroundEffect;
  double v7 = (UIBlurEffect *)v5;
  double v9 = v7;
  if (v6 == v7)
  {

    goto LABEL_8;
  }
  if (!v6)
  {

    goto LABEL_7;
  }
  char v8 = [(UIBlurEffect *)v6 isEqual:v7];

  if ((v8 & 1) == 0)
  {
LABEL_7:
    objc_storeStrong((id *)&self->_overrideBackgroundEffect, a3);
    [(HUGridCellBackgroundView *)self _updateDisplay];
  }
LABEL_8:
}

- (void)setBackgroundEffectViewGrouper:(id)a3
{
  id v4 = a3;
  id v5 = objc_loadWeakRetained((id *)&self->_backgroundEffectViewGrouper);
  id v6 = v4;
  id obj = v6;
  if (v5 == v6)
  {

LABEL_11:
    char v8 = obj;
    goto LABEL_12;
  }
  if (!v5)
  {

LABEL_7:
    uint64_t v9 = [(HUGridCellBackgroundView *)self backgroundEffectViewGrouper];
    if (v9)
    {
      double v10 = (void *)v9;
      double v11 = [(HUGridCellBackgroundView *)self effectView];

      if (v11)
      {
        double v12 = [(HUGridCellBackgroundView *)self backgroundEffectViewGrouper];
        double v13 = [(HUGridCellBackgroundView *)self effectView];
        [v12 backgroundEffectRemoveCaptureDependent:v13 forBackgroundEffectIdentifier:@"HUSharedVisualEffectIdentifierTileOff"];
      }
    }
    double v14 = [(HUGridCellBackgroundView *)self effectView];
    id v15 = [v14 _captureSource];
    id v16 = [(HUGridCellBackgroundView *)self effectView];
    [v15 _removeCaptureDependent:v16];

    objc_storeWeak((id *)&self->_backgroundEffectViewGrouper, obj);
    [(HUGridCellBackgroundView *)self _updateDisplay];
    goto LABEL_11;
  }
  char v7 = [v5 isEqual:v6];

  char v8 = obj;
  if ((v7 & 1) == 0) {
    goto LABEL_7;
  }
LABEL_12:
}

- (void)setBackgroundState:(unint64_t)a3
{
  if (self->_backgroundState != a3)
  {
    self->_backgroundState = a3;
    [(HUGridCellBackgroundView *)self _updateDisplay];
  }
}

- (void)setPressed:(BOOL)a3
{
  if (self->_pressed != a3)
  {
    self->_pressed = a3;
    [(HUGridCellBackgroundView *)self _updateBackgroundColor];
    [(HUGridCellBackgroundView *)self _updateHighlightView];
  }
}

- (void)setNormalizedWallpaperRect:(CGRect)a3
{
  self->_normalizedWallpaperRect = a3;
  [(HUGridCellBackgroundView *)self _updateWallpaperContentsRect];
}

- (void)setUseDefaultCellBackgroundColor:(BOOL)a3
{
  if (self->_useDefaultCellBackgroundColor != a3)
  {
    self->_useDefaultCellBackgroundColor = a3;
    [(HUGridCellBackgroundView *)self _updateBackgroundColor];
  }
}

- (void)traitCollectionDidChange:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)HUGridCellBackgroundView;
  [(HUGridCellBackgroundView *)&v4 traitCollectionDidChange:a3];
  [(HUGridCellBackgroundView *)self _updateDisplay];
}

- (void)_updateDisplay
{
  uint64_t v3 = [(HUGridCellBackgroundView *)self displayOptions];

  if (!v3) {
    return;
  }
  [(HUGridCellBackgroundView *)self _updateBackgroundColor];
  if ([(HUGridCellBackgroundView *)self _shouldUseCCMaterialView])
  {
    if ([(HUGridCellBackgroundView *)self backgroundState])
    {
      if ([(HUGridCellBackgroundView *)self backgroundState] != 1)
      {
LABEL_17:
        v30 = [(HUGridCellBackgroundView *)self ccHighlightMaterialView];
        v31 = [v30 superview];

        if (!v31)
        {
          [(HUGridCellBackgroundView *)self _createHighlightCCMateriaViewIfNecessary];
          v32 = [(HUGridCellBackgroundView *)self ccHighlightMaterialView];
          [(HUGridCellBackgroundView *)self addSubview:v32];
        }
        [(HUGridCellBackgroundView *)self _updateHighlightView];
        goto LABEL_20;
      }
      objc_super v4 = [(HUGridCellBackgroundView *)self ccOffMaterialView];
      id v5 = [v4 superview];

      if (v5)
      {
        id v6 = [(HUGridCellBackgroundView *)self ccOffMaterialView];
        [v6 removeFromSuperview];
      }
      char v7 = [(HUGridCellBackgroundView *)self ccOnMaterialView];
      char v8 = [v7 superview];

      if (!v8)
      {
        [(HUGridCellBackgroundView *)self _createOnCCMaterialViewIfNecessary];
        uint64_t v9 = [(HUGridCellBackgroundView *)self ccOnMaterialView];
        [(HUGridCellBackgroundView *)self addSubview:v9];
      }
      [(HUGridCellBackgroundView *)self bounds];
      double v11 = v10;
      double v13 = v12;
      double v15 = v14;
      double v17 = v16;
      v18 = [(HUGridCellBackgroundView *)self ccOnMaterialView];
    }
    else
    {
      id v19 = [(HUGridCellBackgroundView *)self ccOnMaterialView];
      v20 = [v19 superview];

      if (v20)
      {
        v21 = [(HUGridCellBackgroundView *)self ccOnMaterialView];
        [v21 removeFromSuperview];
      }
      v22 = [(HUGridCellBackgroundView *)self ccOffMaterialView];
      v23 = [v22 superview];

      if (!v23)
      {
        [(HUGridCellBackgroundView *)self _createOffCCMaterialViewIfNecessary];
        v24 = [(HUGridCellBackgroundView *)self ccOffMaterialView];
        [(HUGridCellBackgroundView *)self addSubview:v24];
      }
      [(HUGridCellBackgroundView *)self bounds];
      double v11 = v25;
      double v13 = v26;
      double v15 = v27;
      double v17 = v28;
      v18 = [(HUGridCellBackgroundView *)self ccOffMaterialView];
    }
    v29 = v18;
    objc_msgSend(v18, "setFrame:", v11, v13, v15, v17);

    goto LABEL_17;
  }
LABEL_20:
  if ([(HUGridCellBackgroundView *)self _shouldUseVisualEffectStyle]
    && ![(HUGridCellBackgroundView *)self _shouldUsePrecomputedWallpaperContents])
  {
    [(HUGridCellBackgroundView *)self _createEffectViewIfNecessary];
    v34 = [(HUGridCellBackgroundView *)self overrideBackgroundEffect];

    v35 = [(HUGridCellBackgroundView *)self backgroundEffectViewGrouper];
    v36 = v35;
    if (v34)
    {
      v37 = [(HUGridCellBackgroundView *)self effectView];
      [v36 backgroundEffectRemoveCaptureDependent:v37 forBackgroundEffectIdentifier:@"HUSharedVisualEffectIdentifierTileOff"];

      v38 = [(HUGridCellBackgroundView *)self effectView];
      v39 = [v38 _captureSource];
      v40 = [(HUGridCellBackgroundView *)self effectView];
      [v39 _removeCaptureDependent:v40];

      uint64_t v41 = [(HUGridCellBackgroundView *)self overrideBackgroundEffect];
    }
    else
    {

      if (v36)
      {
        v42 = [(HUGridCellBackgroundView *)self backgroundEffectViewGrouper];
        v43 = [(HUGridCellBackgroundView *)self effectView];
        [v42 backgroundEffectAddCaptureDependent:v43 forBackgroundEffectIdentifier:@"HUSharedVisualEffectIdentifierTileOff"];
        goto LABEL_28;
      }
      uint64_t v41 = [(id)objc_opt_class() _sharedBlurEffect];
    }
    v42 = (void *)v41;
    v43 = [(HUGridCellBackgroundView *)self effectView];
    [v43 setEffect:v42];
LABEL_28:

    v44 = [(HUGridCellBackgroundView *)self effectView];
    [(HUGridCellBackgroundView *)self addSubview:v44];

    [(HUGridCellBackgroundView *)self bounds];
    double v46 = v45;
    double v48 = v47;
    double v50 = v49;
    double v52 = v51;
    v33 = [(HUGridCellBackgroundView *)self effectView];
    objc_msgSend(v33, "setFrame:", v46, v48, v50, v52);
    goto LABEL_29;
  }
  v33 = [(HUGridCellBackgroundView *)self effectView];
  [v33 removeFromSuperview];
LABEL_29:

  [(HUGridCellBackgroundView *)self _updateCornerRadius];
}

- (void)_updateCornerRadius
{
  uint64_t v3 = [(HUGridCellBackgroundView *)self effectView];
  objc_super v4 = [v3 superview];

  if (v4)
  {
    [(HUGridCellBackgroundView *)self cornerRadius];
    double v6 = v5;
    char v7 = [(HUGridCellBackgroundView *)self effectView];
    [v7 _setContinuousCornerRadius:v6];

LABEL_7:
    uint64_t v21 = 0;
    goto LABEL_8;
  }
  char v8 = [(HUGridCellBackgroundView *)self ccOffMaterialView];
  uint64_t v9 = [v8 superview];
  if (v9)
  {

LABEL_6:
    [(HUGridCellBackgroundView *)self cornerRadius];
    double v13 = v12;
    double v14 = [(HUGridCellBackgroundView *)self ccOffMaterialView];
    [v14 _setContinuousCornerRadius:v13];

    [(HUGridCellBackgroundView *)self cornerRadius];
    double v16 = v15;
    double v17 = [(HUGridCellBackgroundView *)self ccOnMaterialView];
    [v17 _setContinuousCornerRadius:v16];

    [(HUGridCellBackgroundView *)self cornerRadius];
    double v19 = v18;
    v20 = [(HUGridCellBackgroundView *)self ccHighlightMaterialView];
    [v20 _setContinuousCornerRadius:v19];

    [(HUGridCellBackgroundView *)self _setContinuousCornerRadius:0.0];
    goto LABEL_7;
  }
  double v10 = [(HUGridCellBackgroundView *)self ccOnMaterialView];
  double v11 = [v10 superview];

  if (v11) {
    goto LABEL_6;
  }
  [(HUGridCellBackgroundView *)self cornerRadius];
  -[HUGridCellBackgroundView _setContinuousCornerRadius:](self, "_setContinuousCornerRadius:");
  uint64_t v21 = 1;
LABEL_8:
  id v22 = [(HUGridCellBackgroundView *)self layer];
  [v22 setMasksToBounds:v21];
}

- (void)_updateWallpaperContentsRect
{
  if ([(HUGridCellBackgroundView *)self _shouldUsePrecomputedWallpaperContents])
  {
    [(HUGridCellBackgroundView *)self normalizedWallpaperRect];
    double v4 = v3;
    double v6 = v5;
    double v8 = v7;
    double v10 = v9;
    id v11 = [(HUGridCellBackgroundView *)self layer];
    objc_msgSend(v11, "setContentsRect:", v4, v6, v8, v10);
  }
}

- (void)_updateBackgroundColor
{
  if ([(HUGridCellBackgroundView *)self _shouldUseCCMaterialView])
  {
    [(HUGridCellBackgroundView *)self setBackgroundColor:0];
    return;
  }
  if ([(HUGridCellBackgroundView *)self useDefaultCellBackgroundColor])
  {
    id v12 = [(HUGridCellBackgroundView *)self traitCollection];
    if ([v12 userInterfaceStyle] == 2) {
      [MEMORY[0x1E4F428B8] systemGray5Color];
    }
    else {
    uint64_t v3 = [MEMORY[0x1E4F428B8] systemWhiteColor];
    }
    goto LABEL_22;
  }
  double v4 = [(HUGridCellBackgroundView *)self displayOptions];
  uint64_t v5 = [v4 displayStyle];

  if (v5 == 4)
  {
    if ([(HUGridCellBackgroundView *)self backgroundState] == 1) {
      [MEMORY[0x1E4F428B8] systemWhiteColor];
    }
    else {
    uint64_t v9 = [MEMORY[0x1E4F428B8] systemGray5Color];
    }
    id v12 = (id)v9;
    double v10 = self;
  }
  else
  {
    double v6 = [(HUGridCellBackgroundView *)self backgroundTintColor];
    double v7 = v6;
    if (v6)
    {
      id v8 = v6;
    }
    else
    {
      id v8 = [MEMORY[0x1E4F428B8] systemWhiteColor];
    }
    id v12 = v8;

    if ([(HUGridCellBackgroundView *)self backgroundState] != 1)
    {
      uint64_t v3 = [(HUGridCellBackgroundView *)self _normalBackgroundColor];
LABEL_22:
      id v11 = (void *)v3;
      [(HUGridCellBackgroundView *)self setBackgroundColor:v3];

      goto LABEL_23;
    }
    double v10 = self;
    uint64_t v9 = (uint64_t)v12;
  }
  [(HUGridCellBackgroundView *)v10 setBackgroundColor:v9];
LABEL_23:
}

- (void)_updateHighlightView
{
  if ([(HUGridCellBackgroundView *)self _shouldUseCCMaterialView])
  {
    v3[0] = MEMORY[0x1E4F143A8];
    v3[1] = 3221225472;
    v3[2] = __48__HUGridCellBackgroundView__updateHighlightView__block_invoke;
    v3[3] = &unk_1E6386018;
    v3[4] = self;
    [MEMORY[0x1E4F42FF0] animateWithDuration:v3 animations:0.25];
  }
}

void __48__HUGridCellBackgroundView__updateHighlightView__block_invoke(uint64_t a1)
{
  if ([*(id *)(a1 + 32) isPressed] && !objc_msgSend(*(id *)(a1 + 32), "backgroundState"))
  {
    v2 = [*(id *)(a1 + 32) ccHighlightMaterialView];
    double v3 = 0.25;
  }
  else
  {
    v2 = [*(id *)(a1 + 32) ccHighlightMaterialView];
    double v3 = 0.0;
  }
  id v4 = v2;
  [v2 setAlpha:v3];
}

- (BOOL)_shouldUseCCMaterialView
{
  v2 = [(HUGridCellBackgroundView *)self displayOptions];
  unint64_t v3 = [v2 displayStyle];

  return (v3 < 5) & (0xCu >> v3);
}

- (BOOL)_shouldUseVisualEffectStyle
{
  unint64_t v3 = [(HUGridCellBackgroundView *)self displayOptions];
  unint64_t v4 = [v3 displayStyle];

  return v4 <= 1
      && ![(HUGridCellBackgroundView *)self backgroundState]
      && !UIAccessibilityIsReduceTransparencyEnabled();
}

- (BOOL)_shouldUsePrecomputedWallpaperContents
{
  if (![(HUGridCellBackgroundView *)self _shouldUseVisualEffectStyle]) {
    return 0;
  }
  unint64_t v3 = [(HUGridCellBackgroundView *)self displayOptions];
  if ([v3 displayStyle]) {
    BOOL v4 = 0;
  }
  else {
    BOOL v4 = +[HUGraphicsUtilities shouldReduceVisualEffects];
  }

  return v4;
}

- (id)_normalBackgroundColor
{
  if ([(HUGridCellBackgroundView *)self _shouldUseCCMaterialView]
    || !UIAccessibilityIsReduceTransparencyEnabled())
  {
    goto LABEL_6;
  }
  unint64_t v3 = [(HUGridCellBackgroundView *)self displayOptions];
  uint64_t v4 = [v3 contentColorStyle];

  if (v4 == 1)
  {
    uint64_t v5 = [(HUGridCellBackgroundView *)self traitCollection];
    BOOL v6 = [v5 userInterfaceStyle] == 2;
    double v7 = (void *)MEMORY[0x1E4F428B8];
    id v8 = (double *)&unk_1BEA19F60;
    goto LABEL_11;
  }
  if (v4)
  {
LABEL_6:
    uint64_t v9 = 0;
    goto LABEL_7;
  }
  uint64_t v5 = [(HUGridCellBackgroundView *)self traitCollection];
  BOOL v6 = [v5 userInterfaceStyle] == 2;
  double v7 = (void *)MEMORY[0x1E4F428B8];
  id v8 = (double *)&unk_1BEA19F70;
LABEL_11:
  uint64_t v9 = [v7 colorWithWhite:v8[v6] alpha:1.0];

LABEL_7:

  return v9;
}

- (unint64_t)backgroundState
{
  return self->_backgroundState;
}

- (BOOL)isPressed
{
  return self->_pressed;
}

- (HUGridCellBackgroundDisplayOptions)displayOptions
{
  return self->_displayOptions;
}

- (UIColor)backgroundTintColor
{
  return self->_backgroundTintColor;
}

- (UIBlurEffect)overrideBackgroundEffect
{
  return self->_overrideBackgroundEffect;
}

- (BOOL)useDefaultCellBackgroundColor
{
  return self->_useDefaultCellBackgroundColor;
}

- (CGRect)normalizedWallpaperRect
{
  double x = self->_normalizedWallpaperRect.origin.x;
  double y = self->_normalizedWallpaperRect.origin.y;
  double width = self->_normalizedWallpaperRect.size.width;
  double height = self->_normalizedWallpaperRect.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (HUBackgroundEffectViewGrouping)backgroundEffectViewGrouper
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_backgroundEffectViewGrouper);

  return (HUBackgroundEffectViewGrouping *)WeakRetained;
}

- (double)cornerRadius
{
  return self->_cornerRadius;
}

- (UIVisualEffectView)effectView
{
  return self->_effectView;
}

- (void)setEffectView:(id)a3
{
}

- (UIView)ccOnMaterialView
{
  return self->_ccOnMaterialView;
}

- (void)setCcOnMaterialView:(id)a3
{
}

- (UIView)ccOffMaterialView
{
  return self->_ccOffMaterialView;
}

- (void)setCcOffMaterialView:(id)a3
{
}

- (UIView)ccHighlightMaterialView
{
  return self->_ccHighlightMaterialView;
}

- (void)setCcHighlightMaterialView:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_ccHighlightMaterialView, 0);
  objc_storeStrong((id *)&self->_ccOffMaterialView, 0);
  objc_storeStrong((id *)&self->_ccOnMaterialView, 0);
  objc_storeStrong((id *)&self->_effectView, 0);
  objc_destroyWeak((id *)&self->_backgroundEffectViewGrouper);
  objc_storeStrong((id *)&self->_overrideBackgroundEffect, 0);
  objc_storeStrong((id *)&self->_backgroundTintColor, 0);

  objc_storeStrong((id *)&self->_displayOptions, 0);
}

@end