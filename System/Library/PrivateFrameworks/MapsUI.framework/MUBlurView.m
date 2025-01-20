@interface MUBlurView
- (BOOL)shouldBlur;
- (MUBlurView)initWithBlurEffectStyle:(int64_t)a3;
- (MUBlurView)initWithGaussianBlurWithRadius:(double)a3;
- (MUBlurView)initWithVariableBlurWithRadius:(double)a3 maskImage:(CGImage *)a4;
- (NSArray)backgroundEffects;
- (NSString)blurGroupName;
- (UIColor)nonBlurredColor;
- (UIColor)overlayColor;
- (UIView)nonBlurView;
- (UIView)variableBlurView;
- (UIVisualEffectView)materialBlurView;
- (id)blurView;
- (id)blurViewIfExists;
- (unint64_t)style;
- (void)_setup;
- (void)_transparencyStatusDidChange;
- (void)_update;
- (void)setBackgroundEffects:(id)a3;
- (void)setBlurGroupName:(id)a3;
- (void)setMaterialBlurView:(id)a3;
- (void)setNonBlurView:(id)a3;
- (void)setNonBlurredColor:(id)a3;
- (void)setOverlayColor:(id)a3;
- (void)setShouldBlur:(BOOL)a3;
- (void)setStyle:(unint64_t)a3;
- (void)setVariableBlurView:(id)a3;
@end

@implementation MUBlurView

- (MUBlurView)initWithVariableBlurWithRadius:(double)a3 maskImage:(CGImage *)a4
{
  v9.receiver = self;
  v9.super_class = (Class)MUBlurView;
  v6 = -[MUBlurView initWithFrame:](&v9, sel_initWithFrame_, *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
  v7 = v6;
  if (v6)
  {
    v6->_isVariableBlur = 1;
    v6->_blurRadius = a3;
    v6->_variableBlurMaskImage = a4;
    [(MUBlurView *)v6 _setup];
  }
  return v7;
}

- (void)_setup
{
  v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v3 addObserver:self selector:sel__transparencyStatusDidChange name:*MEMORY[0x1E4FB24A8] object:0];

  self->_shouldBlur = !UIAccessibilityIsReduceTransparencyEnabled();
  [(MUBlurView *)self _update];
}

- (void)setNonBlurredColor:(id)a3
{
  id v4 = a3;
  unint64_t v5 = self->_nonBlurredColor;
  unint64_t v6 = (unint64_t)v4;
  if (v6 | v5)
  {
    id v10 = (id)v6;
    char v7 = [(id)v5 isEqual:v6];

    if ((v7 & 1) == 0)
    {
      v8 = (UIColor *)[v10 copy];
      nonBlurredColor = self->_nonBlurredColor;
      self->_nonBlurredColor = v8;

      if ([(MUBlurView *)self style] == 2) {
        [(MUBlurView *)self setBackgroundColor:self->_nonBlurredColor];
      }
      else {
        [(MUBlurView *)self _update];
      }
    }
  }
  MEMORY[0x1F41817F8]();
}

- (void)_update
{
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __21__MUBlurView__update__block_invoke;
  aBlock[3] = &unk_1E574EFD0;
  aBlock[4] = self;
  v3 = (void (**)(void))_Block_copy(aBlock);
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __21__MUBlurView__update__block_invoke_2;
  v8[3] = &unk_1E574EFD0;
  v8[4] = self;
  id v4 = (void (**)(void))_Block_copy(v8);
  unint64_t v5 = [(MUBlurView *)self style];
  if (v5 == 2)
  {
    char v7 = v4;
    goto LABEL_8;
  }
  unint64_t v6 = v5;
  char v7 = v3;
  if (v6 == 1)
  {
LABEL_8:
    v7[2]();
    goto LABEL_9;
  }
  if (!v6)
  {
    if ([(MUBlurView *)self shouldBlur]) {
      char v7 = v3;
    }
    else {
      char v7 = v4;
    }
    goto LABEL_8;
  }
LABEL_9:
}

- (unint64_t)style
{
  return self->_style;
}

void __21__MUBlurView__update__block_invoke(uint64_t a1)
{
  v24[4] = *MEMORY[0x1E4F143B8];
  [*(id *)(*(void *)(a1 + 32) + 504) removeFromSuperview];
  [*(id *)(a1 + 32) setBackgroundColor:0];
  v2 = [*(id *)(a1 + 32) backgroundEffects];
  v3 = [*(id *)(a1 + 32) materialBlurView];
  [v3 setBackgroundEffects:v2];

  id v4 = *(void **)(a1 + 32);
  unint64_t v5 = [v4 blurView];
  [v4 insertSubview:v5 atIndex:0];

  v16 = (void *)MEMORY[0x1E4F28DC8];
  v23 = [*(id *)(a1 + 32) blurView];
  v22 = [v23 leadingAnchor];
  v21 = [*(id *)(a1 + 32) leadingAnchor];
  v20 = [v22 constraintEqualToAnchor:v21];
  v24[0] = v20;
  v19 = [*(id *)(a1 + 32) blurView];
  v18 = [v19 trailingAnchor];
  v17 = [*(id *)(a1 + 32) trailingAnchor];
  unint64_t v6 = [v18 constraintEqualToAnchor:v17];
  v24[1] = v6;
  char v7 = [*(id *)(a1 + 32) blurView];
  v8 = [v7 topAnchor];
  objc_super v9 = [*(id *)(a1 + 32) topAnchor];
  id v10 = [v8 constraintEqualToAnchor:v9];
  v24[2] = v10;
  v11 = [*(id *)(a1 + 32) blurView];
  v12 = [v11 bottomAnchor];
  v13 = [*(id *)(a1 + 32) bottomAnchor];
  v14 = [v12 constraintEqualToAnchor:v13];
  v24[3] = v14;
  v15 = [MEMORY[0x1E4F1C978] arrayWithObjects:v24 count:4];
  [v16 activateConstraints:v15];
}

- (id)blurView
{
  if (self->_isVariableBlur) {
    [(MUBlurView *)self variableBlurView];
  }
  else {
  v2 = [(MUBlurView *)self materialBlurView];
  }
  return v2;
}

- (UIView)variableBlurView
{
  variableBlurView = self->_variableBlurView;
  if (!variableBlurView)
  {
    if (self->_isVariableBlur)
    {
      id v4 = [[_MUVariableBlurView alloc] initWithRadius:self->_variableBlurMaskImage maskImage:self->_blurRadius];
      unint64_t v5 = self->_variableBlurView;
      self->_variableBlurView = &v4->super;

      [(UIView *)self->_variableBlurView setTranslatesAutoresizingMaskIntoConstraints:0];
      variableBlurView = self->_variableBlurView;
    }
    else
    {
      variableBlurView = 0;
    }
  }
  return variableBlurView;
}

- (BOOL)shouldBlur
{
  return self->_shouldBlur;
}

- (UIVisualEffectView)materialBlurView
{
  materialBlurView = self->_materialBlurView;
  if (!materialBlurView)
  {
    if (self->_isVariableBlur)
    {
      materialBlurView = 0;
    }
    else
    {
      if (self->_isGaussianBlur) {
        [MEMORY[0x1E4FB14C8] effectWithBlurRadius:self->_blurRadius];
      }
      else {
      id v4 = [MEMORY[0x1E4FB14C8] effectWithStyle:self->_blurEffectStyle];
      }
      unint64_t v5 = (UIVisualEffectView *)[objc_alloc(MEMORY[0x1E4FB1F00]) initWithEffect:v4];
      unint64_t v6 = self->_materialBlurView;
      self->_materialBlurView = v5;

      [(UIVisualEffectView *)self->_materialBlurView setTranslatesAutoresizingMaskIntoConstraints:0];
      char v7 = [(MUBlurView *)self blurGroupName];
      [(UIVisualEffectView *)self->_materialBlurView _setGroupName:v7];

      v8 = [(MUBlurView *)self overlayColor];
      objc_super v9 = [(UIVisualEffectView *)self->_materialBlurView contentView];
      [v9 setBackgroundColor:v8];

      if ([(NSArray *)self->_backgroundEffects count])
      {
        [(UIVisualEffectView *)self->_materialBlurView setBackgroundEffects:self->_backgroundEffects];
      }
      else
      {
        id v10 = [(UIVisualEffectView *)self->_materialBlurView backgroundEffects];
        backgroundEffects = self->_backgroundEffects;
        self->_backgroundEffects = v10;
      }
      materialBlurView = self->_materialBlurView;
    }
  }
  return materialBlurView;
}

- (NSArray)backgroundEffects
{
  return self->_backgroundEffects;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_nonBlurView, 0);
  objc_storeStrong((id *)&self->_variableBlurView, 0);
  objc_storeStrong((id *)&self->_materialBlurView, 0);
  objc_storeStrong((id *)&self->_backgroundEffects, 0);
  objc_storeStrong((id *)&self->_nonBlurredColor, 0);
  objc_storeStrong((id *)&self->_blurGroupName, 0);
  objc_storeStrong((id *)&self->_overlayColor, 0);
}

- (void)setStyle:(unint64_t)a3
{
  if (self->_style != a3)
  {
    self->_style = a3;
    [(MUBlurView *)self _update];
  }
}

- (void)setBlurGroupName:(id)a3
{
  id v4 = a3;
  unint64_t v5 = self->_blurGroupName;
  unint64_t v6 = (unint64_t)v4;
  if (v6 | v5)
  {
    id v10 = (id)v6;
    char v7 = [(id)v5 isEqual:v6];

    if ((v7 & 1) == 0 && !self->_isVariableBlur)
    {
      v8 = (NSString *)[v10 copy];
      blurGroupName = self->_blurGroupName;
      self->_blurGroupName = v8;

      [(UIVisualEffectView *)self->_materialBlurView _setGroupName:self->_blurGroupName];
    }
  }
  MEMORY[0x1F41817F8]();
}

- (void)setOverlayColor:(id)a3
{
  id v4 = a3;
  unint64_t v5 = self->_overlayColor;
  unint64_t v6 = (unint64_t)v4;
  if (v6 | v5)
  {
    id v11 = (id)v6;
    char v7 = [(id)v5 isEqual:v6];

    if ((v7 & 1) == 0 && !self->_isVariableBlur)
    {
      v8 = (UIColor *)[v11 copy];
      overlayColor = self->_overlayColor;
      self->_overlayColor = v8;

      id v10 = [(UIVisualEffectView *)self->_materialBlurView contentView];
      [v10 setBackgroundColor:v11];

      [(UIView *)self->_nonBlurView setBackgroundColor:v11];
    }
  }
  MEMORY[0x1F41817F8]();
}

- (MUBlurView)initWithBlurEffectStyle:(int64_t)a3
{
  v7.receiver = self;
  v7.super_class = (Class)MUBlurView;
  id v4 = -[MUBlurView initWithFrame:](&v7, sel_initWithFrame_, *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
  unint64_t v5 = v4;
  if (v4)
  {
    v4->_blurEffectStyle = a3;
    [(MUBlurView *)v4 _setup];
  }
  return v5;
}

- (MUBlurView)initWithGaussianBlurWithRadius:(double)a3
{
  v7.receiver = self;
  v7.super_class = (Class)MUBlurView;
  id v4 = -[MUBlurView initWithFrame:](&v7, sel_initWithFrame_, *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
  unint64_t v5 = v4;
  if (v4)
  {
    v4->_isGaussianBlur = 1;
    v4->_blurRadius = a3;
    [(MUBlurView *)v4 _setup];
  }
  return v5;
}

- (void)setShouldBlur:(BOOL)a3
{
  if (self->_shouldBlur != a3)
  {
    self->_shouldBlur = a3;
    if (![(MUBlurView *)self style])
    {
      [(MUBlurView *)self _update];
    }
  }
}

void __21__MUBlurView__update__block_invoke_2(uint64_t a1)
{
  v24[4] = *MEMORY[0x1E4F143B8];
  v2 = [*(id *)(a1 + 32) blurViewIfExists];
  [v2 removeFromSuperview];

  v3 = [*(id *)(a1 + 32) nonBlurredColor];
  [*(id *)(a1 + 32) setBackgroundColor:v3];

  id v4 = *(void **)(a1 + 32);
  unint64_t v5 = [v4 nonBlurView];
  [v4 insertSubview:v5 atIndex:0];

  v16 = (void *)MEMORY[0x1E4F28DC8];
  v23 = [*(id *)(a1 + 32) nonBlurView];
  v22 = [v23 leadingAnchor];
  v21 = [*(id *)(a1 + 32) leadingAnchor];
  v20 = [v22 constraintEqualToAnchor:v21];
  v24[0] = v20;
  v19 = [*(id *)(a1 + 32) nonBlurView];
  v18 = [v19 trailingAnchor];
  v17 = [*(id *)(a1 + 32) trailingAnchor];
  unint64_t v6 = [v18 constraintEqualToAnchor:v17];
  v24[1] = v6;
  objc_super v7 = [*(id *)(a1 + 32) nonBlurView];
  v8 = [v7 topAnchor];
  objc_super v9 = [*(id *)(a1 + 32) topAnchor];
  id v10 = [v8 constraintEqualToAnchor:v9];
  v24[2] = v10;
  id v11 = [*(id *)(a1 + 32) nonBlurView];
  v12 = [v11 bottomAnchor];
  v13 = [*(id *)(a1 + 32) bottomAnchor];
  v14 = [v12 constraintEqualToAnchor:v13];
  v24[3] = v14;
  v15 = [MEMORY[0x1E4F1C978] arrayWithObjects:v24 count:4];
  [v16 activateConstraints:v15];
}

- (id)blurViewIfExists
{
  uint64_t v2 = 6;
  if (!self->_isVariableBlur) {
    uint64_t v2 = 7;
  }
  return objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.isa
                                                 + OBJC_IVAR___MUBlurView__blurEffectStyle[v2]));
}

- (UIView)nonBlurView
{
  nonBlurView = self->_nonBlurView;
  if (!nonBlurView)
  {
    id v4 = (UIView *)objc_opt_new();
    unint64_t v5 = self->_nonBlurView;
    self->_nonBlurView = v4;

    [(UIView *)self->_nonBlurView setTranslatesAutoresizingMaskIntoConstraints:0];
    unint64_t v6 = [(MUBlurView *)self overlayColor];
    [(UIView *)self->_nonBlurView setBackgroundColor:v6];

    nonBlurView = self->_nonBlurView;
  }
  return nonBlurView;
}

- (void)setBackgroundEffects:(id)a3
{
  id v4 = a3;
  unint64_t v5 = self->_backgroundEffects;
  uint64_t v6 = (uint64_t)v4;
  uint64_t v7 = v6;
  if (v6 | v5)
  {
    id v11 = (id)v6;
    char v8 = [(id)v5 isEqual:v6];

    uint64_t v7 = (uint64_t)v11;
    if ((v8 & 1) == 0 && !self->_isVariableBlur)
    {
      objc_super v9 = (NSArray *)[v11 copy];
      backgroundEffects = self->_backgroundEffects;
      self->_backgroundEffects = v9;

      uint64_t v6 = [(MUBlurView *)self _update];
      uint64_t v7 = (uint64_t)v11;
    }
  }
  MEMORY[0x1F41817F8](v6, v7);
}

- (void)_transparencyStatusDidChange
{
  BOOL v3 = !UIAccessibilityIsReduceTransparencyEnabled();
  [(MUBlurView *)self setShouldBlur:v3];
}

- (UIColor)overlayColor
{
  return self->_overlayColor;
}

- (NSString)blurGroupName
{
  return self->_blurGroupName;
}

- (UIColor)nonBlurredColor
{
  return self->_nonBlurredColor;
}

- (void)setMaterialBlurView:(id)a3
{
}

- (void)setVariableBlurView:(id)a3
{
}

- (void)setNonBlurView:(id)a3
{
}

@end