@interface BSUIVibrancyEffectView
- (BOOL)isBlurEnabled;
- (BOOL)isCaptureOnly;
- (BOOL)isEnabled;
- (BSUIVibrancyBackdropView)materialBackdropView;
- (BSUIVibrancyEffectView)initWithFrame:(CGRect)a3;
- (UIView)contentView;
- (UIView)maskView;
- (UIView)vibrancyView;
- (id)hitTest:(CGPoint)a3 withEvent:(id)a4;
- (unint64_t)contentType;
- (void)_updateSubviews;
- (void)_updateSubviewsIfNeeded;
- (void)invalidateSubviews;
- (void)layoutSubviews;
- (void)setBlurEnabled:(BOOL)a3;
- (void)setCaptureOnly:(BOOL)a3;
- (void)setContentType:(unint64_t)a3;
- (void)setIsEnabled:(BOOL)a3;
- (void)updateFilters;
@end

@implementation BSUIVibrancyEffectView

- (BSUIVibrancyEffectView)initWithFrame:(CGRect)a3
{
  v12.receiver = self;
  v12.super_class = (Class)BSUIVibrancyEffectView;
  v3 = -[BSUIVibrancyView initWithFrame:](&v12, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    [(BSUIVibrancyEffectView *)v3 bounds];
    v4->_isEnabled = 1;
    v4->_blurEnabled = 1;
    v4->_contentType = 0;
    uint64_t v9 = objc_msgSend(objc_alloc(MEMORY[0x1E4F42FF0]), "initWithFrame:", v5, v6, v7, v8);
    contentView = v4->_contentView;
    v4->_contentView = (UIView *)v9;

    [(BSUIVibrancyEffectView *)v4 addSubview:v4->_contentView];
    [(BSUIVibrancyEffectView *)v4 invalidateSubviews];
  }
  return v4;
}

- (id)hitTest:(CGPoint)a3 withEvent:(id)a4
{
  v11.receiver = self;
  v11.super_class = (Class)BSUIVibrancyEffectView;
  double v5 = -[BSUIVibrancyEffectView hitTest:withEvent:](&v11, sel_hitTest_withEvent_, a4, a3.x, a3.y);
  double v6 = [(BSUIVibrancyEffectView *)self contentView];
  double v7 = [v6 subviews];
  int v8 = [v7 containsObject:v5];

  if (v8) {
    id v9 = v5;
  }
  else {
    id v9 = 0;
  }

  return v9;
}

- (void)setIsEnabled:(BOOL)a3
{
  if (self->_isEnabled != a3)
  {
    self->_isEnabled = a3;
    [(BSUIVibrancyEffectView *)self invalidateSubviews];
    [(BSUIVibrancyView *)self _invalidateFilters];
  }
}

- (void)setBlurEnabled:(BOOL)a3
{
  if (self->_blurEnabled != a3)
  {
    self->_blurEnabled = a3;
    [(BSUIVibrancyView *)self _invalidateFilters];
  }
}

- (void)setCaptureOnly:(BOOL)a3
{
  if (self->_captureOnly != a3)
  {
    self->_captureOnly = a3;
    [(BSUIVibrancyEffectView *)self invalidateSubviews];
  }
}

- (void)setContentType:(unint64_t)a3
{
  if (self->_contentType != a3)
  {
    self->_contentType = a3;
    [(BSUIVibrancyView *)self _invalidateFilters];
  }
}

- (void)layoutSubviews
{
  [(BSUIVibrancyEffectView *)self _updateSubviewsIfNeeded];
  v24.receiver = self;
  v24.super_class = (Class)BSUIVibrancyEffectView;
  [(BSUIVibrancyView *)&v24 layoutSubviews];
  [(BSUIVibrancyEffectView *)self bounds];
  double v4 = v3;
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  objc_super v11 = [(BSUIVibrancyEffectView *)self contentView];
  objc_msgSend(v11, "setFrame:", v4, v6, v8, v10);

  objc_super v12 = [(BSUIVibrancyEffectView *)self materialBackdropView];
  objc_msgSend(v12, "setFrame:", v4, v6, v8, v10);

  v13 = [(BSUIVibrancyEffectView *)self vibrancyView];
  objc_msgSend(v13, "setFrame:", v4, v6, v8, v10);

  v14 = [(BSUIVibrancyEffectView *)self materialBackdropView];
  [v14 bounds];
  double v16 = v15;
  double v18 = v17;
  double v20 = v19;
  double v22 = v21;

  v23 = [(BSUIVibrancyEffectView *)self maskView];
  objc_msgSend(v23, "setFrame:", v16, v18, v20, v22);
}

- (void)invalidateSubviews
{
  self->_needsUpdate.subviews = 1;
  [(BSUIVibrancyEffectView *)self setNeedsLayout];
}

- (void)updateFilters
{
  double v3 = [(BSUIVibrancyView *)self configuration];
  double v4 = [v3 effectValues];
  values = self->_values;
  self->_values = v4;

  BOOL v6 = [(BSUIVibrancyEffectView *)self isBlurEnabled];
  unint64_t v7 = [(BSUIVibrancyEffectView *)self contentType];
  uint64_t v8 = [v3 effectType];
  id v42 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  id v43 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  if (v8 != 3)
  {
    if (!v6)
    {
      v41 = 0;
      uint64_t v25 = 1;
      unsigned int v26 = 1050253722;
      float v27 = *(float *)"333?";
      goto LABEL_13;
    }
    uint64_t v15 = *MEMORY[0x1E4F3A038];
    double v16 = [MEMORY[0x1E4F39BC0] filterWithType:*MEMORY[0x1E4F3A038]];
    long long v50 = 0u;
    long long v48 = 0u;
    memset(v49, 0, sizeof(v49));
    long long v47 = 0u;
    double v17 = self->_values;
    if (v17) {
      [(BSUIVibrancyEffectValues *)v17 backdropColorMatrix];
    }
    [v16 setName:@"color"];
    v46[2] = v49[0];
    v46[3] = v49[1];
    v46[4] = v50;
    v46[0] = v47;
    v46[1] = v48;
    double v18 = [MEMORY[0x1E4F29238] valueWithCAColorMatrix:v46];
    uint64_t v19 = *MEMORY[0x1E4F3A168];
    [v16 setValue:v18 forKey:*MEMORY[0x1E4F3A168]];

    [v42 addObject:v16];
    double v20 = [MEMORY[0x1E4F39BC0] filterWithType:*MEMORY[0x1E4F3A0D0]];
    [v20 setName:@"blur"];
    [v20 setValue:&unk_1EF5C0328 forKey:*MEMORY[0x1E4F3A1D8]];
    [v20 setValue:MEMORY[0x1E4F1CC38] forKey:*MEMORY[0x1E4F3A1B8]];
    [v42 addObject:v20];
    v41 = [(BSUIVibrancyEffectValues *)self->_values groupName];

    if (v7 == 1)
    {
      double v21 = [MEMORY[0x1E4F39BC0] filterWithType:v15];
      double v22 = v41;
      [v21 setName:@"vibrantColor"];
      v23 = (void *)MEMORY[0x1E4F29238];
      objc_super v24 = self->_values;
      if (v24) {
        [(BSUIVibrancyEffectValues *)v24 vibrantColorMatrix];
      }
      else {
        memset(v45, 0, sizeof(v45));
      }
      v34 = [v23 valueWithCAColorMatrix:v45];
      [v21 setValue:v34 forKey:v19];

      [v42 insertObject:v21 atIndex:0];
      [v41 stringByAppendingString:@"-withVibrancy"];
      uint64_t v25 = 0;
      v41 = uint64_t v30 = 1;
      goto LABEL_21;
    }
LABEL_11:
    uint64_t v25 = 0;
    unsigned int v26 = 0;
    float v27 = 1.0;
LABEL_13:
    double v21 = [MEMORY[0x1E4F39BC0] filterWithType:*MEMORY[0x1E4F3A038]];
    [v21 setName:@"colorToAlphaMask"];
    long long v48 = 0u;
    memset(v49, 0, 28);
    long long v47 = 0u;
    *((float *)&v49[1] + 3) = v27;
    *(void *)&long long v50 = 0;
    *((void *)&v50 + 1) = v26;
    v28 = [MEMORY[0x1E4F29238] valueWithCAColorMatrix:&v47];
    uint64_t v29 = *MEMORY[0x1E4F3A168];
    [v21 setValue:v28 forKey:*MEMORY[0x1E4F3A168]];

    [v21 setValue:MEMORY[0x1E4F1CC38] forKey:*MEMORY[0x1E4F3A1C8]];
    [v43 addObject:v21];
    if (v8 == 3)
    {
      uint64_t v30 = 0;
LABEL_22:

      double v10 = v41;
      v35 = [(BSUIVibrancyBackdropView *)self->_materialBackdropView backdropLayer];
      [v35 setGroupName:v41];

      [(BSUIVibrancyBackdropView *)self->_materialBackdropView setHidden:v25];
      [(UIView *)self->_vibrancyView setHidden:v30];
      v36 = [(UIView *)self->_vibrancyView layer];
      v37 = v36;
      if (v8 == 3) {
        uint64_t v38 = *MEMORY[0x1E4F3A090];
      }
      else {
        uint64_t v38 = 0;
      }
      [v36 setCompositingFilter:v38];

      v39 = [(BSUIVibrancyBackdropView *)self->_materialBackdropView layer];
      _setLayerFilters(v39, v42);

      v40 = [(UIView *)self->_vibrancyView layer];
      _setLayerFilters(v40, v43);

      goto LABEL_26;
    }
    double v22 = [MEMORY[0x1E4F39BC0] filterWithType:*MEMORY[0x1E4F3A350]];
    [v22 setName:@"vibrantColor"];
    v31 = (void *)MEMORY[0x1E4F29238];
    v32 = self->_values;
    if (v32) {
      [(BSUIVibrancyEffectValues *)v32 vibrantColorMatrix];
    }
    else {
      memset(v44, 0, sizeof(v44));
    }
    v33 = [v31 valueWithCAColorMatrix:v44];
    [v22 setValue:v33 forKey:v29];

    [v43 addObject:v22];
    uint64_t v30 = 0;
LABEL_21:

    goto LABEL_22;
  }
  double v9 = [v3 alternativeVibrancyEffectLUT];
  double v10 = v9;
  if (v9)
  {
    objc_super v11 = [v9 resolvedLUTFilter];
    if (!v11)
    {
LABEL_26:

      goto LABEL_27;
    }
    [v42 addObject:v11];
    objc_super v12 = NSString;
    v13 = [v3 groupName];
    v14 = [v10 groupName];
    v41 = [v12 stringWithFormat:@"%@-%@", v13, v14];

    goto LABEL_11;
  }
LABEL_27:
}

- (void)_updateSubviewsIfNeeded
{
  if (self->_needsUpdate.subviews)
  {
    self->_needsUpdate.subviews = 0;
    [(BSUIVibrancyEffectView *)self _updateSubviews];
  }
}

- (void)_updateSubviews
{
  if ([(BSUIVibrancyEffectView *)self isEnabled]) {
    int v3 = !+[BSUIVibrancyView isDisabled];
  }
  else {
    int v3 = 0;
  }
  id v25 = [(BSUIVibrancyView *)self configuration];
  [(UIView *)self->_contentView setAlpha:(double)(v3 ^ 1u)];
  if (v3)
  {
    [(BSUIVibrancyEffectView *)self bounds];
    double v8 = v4;
    double v9 = v5;
    double v10 = v6;
    double v11 = v7;
    if (!self->_materialBackdropView)
    {
      objc_super v12 = -[BSUIVibrancyBackdropView initWithFrame:]([BSUIVibrancyBackdropView alloc], "initWithFrame:", v4, v5, v6, v7);
      materialBackdropView = self->_materialBackdropView;
      self->_materialBackdropView = v12;

      [(BSUIVibrancyBackdropView *)self->_materialBackdropView setUserInteractionEnabled:0];
      v14 = [(BSUIVibrancyBackdropView *)self->_materialBackdropView backdropLayer];
      [v14 setUsesGlobalGroupNamespace:1];

      [(BSUIVibrancyEffectView *)self addSubview:self->_materialBackdropView];
    }
    BOOL v15 = [(BSUIVibrancyEffectView *)self isCaptureOnly];
    uint64_t v16 = [v25 effectType];
    vibrancyView = [(BSUIVibrancyBackdropView *)self->_materialBackdropView backdropLayer];
    [vibrancyView setCaptureOnly:v15];
    double v18 = 0.1;
    if (v16 == 3) {
      double v18 = 1.0;
    }
    [vibrancyView setScale:v18];
    if (!self->_maskView)
    {
      uint64_t v19 = (UIView *)[objc_alloc(MEMORY[0x1E4F43298]) initWithSourceView:self->_contentView];
      -[UIView setFrame:](v19, "setFrame:", v8, v9, v10, v11);
      maskView = self->_maskView;
      self->_maskView = v19;
    }
    char v21 = v16 == 3 || v15;
    if (v21) {
      double v22 = 0;
    }
    else {
      double v22 = self->_maskView;
    }
    [(BSUIVibrancyBackdropView *)self->_materialBackdropView setMaskView:v22];
    if (!self->_vibrancyView)
    {
      objc_super v24 = [(_UIPortalView *)[BSUIVibrancyAnimatingPortalView alloc] initWithSourceView:self->_contentView];
      -[_UIPortalView setFrame:](v24, "setFrame:", v8, v9, v10, v11);
      [(_UIPortalView *)v24 setAllowsHitTesting:1];
      objc_storeStrong((id *)&self->_vibrancyView, v24);
      [(BSUIVibrancyEffectView *)self addSubview:self->_vibrancyView];
    }
  }
  else
  {
    [(BSUIVibrancyBackdropView *)self->_materialBackdropView removeFromSuperview];
    v23 = self->_materialBackdropView;
    self->_materialBackdropView = 0;

    [(UIView *)self->_vibrancyView removeFromSuperview];
    vibrancyView = self->_vibrancyView;
    self->_vibrancyView = 0;
  }
}

- (BOOL)isEnabled
{
  return self->_isEnabled;
}

- (BOOL)isBlurEnabled
{
  return self->_blurEnabled;
}

- (BOOL)isCaptureOnly
{
  return self->_captureOnly;
}

- (UIView)contentView
{
  return self->_contentView;
}

- (BSUIVibrancyBackdropView)materialBackdropView
{
  return self->_materialBackdropView;
}

- (UIView)maskView
{
  return self->_maskView;
}

- (UIView)vibrancyView
{
  return self->_vibrancyView;
}

- (unint64_t)contentType
{
  return self->_contentType;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_vibrancyView, 0);
  objc_storeStrong((id *)&self->_maskView, 0);
  objc_storeStrong((id *)&self->_materialBackdropView, 0);
  objc_storeStrong((id *)&self->_contentView, 0);

  objc_storeStrong((id *)&self->_values, 0);
}

@end