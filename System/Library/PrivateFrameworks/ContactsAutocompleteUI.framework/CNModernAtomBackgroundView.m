@interface CNModernAtomBackgroundView
- (BOOL)appearsSelected;
- (BOOL)isSelected;
- (CNAtomView)hostAtomView;
- (CNModernAtomBackgroundView)initWithFrame:(CGRect)a3;
- (UIEdgeInsets)_backgroundBleedArea;
- (UIView)selectedView;
- (UIView)separatorView;
- (double)scalingFactor;
- (double)separatorWidth;
- (id)_chevronImage;
- (id)wrappedTintColor;
- (int)separatorStyle;
- (void)_setSelectionStyle:(unint64_t)a3;
- (void)_setupBackgroundView;
- (void)displaySelectionChangeWithAnimation:(BOOL)a3;
- (void)invalidateIntrinsicContentSize;
- (void)layoutSubviews;
- (void)setHostAtomView:(id)a3;
- (void)setScalingFactor:(double)a3;
- (void)setSelected:(BOOL)a3 animated:(BOOL)a4 style:(unint64_t)a5 updateVisualSelection:(BOOL)a6;
- (void)setSeparatorStyle:(int)a3;
- (void)tintColorDidChange;
@end

@implementation CNModernAtomBackgroundView

- (void)_setupBackgroundView
{
  self->_scalingFactor = 1.0;
  [(CNModernAtomBackgroundView *)self setAutoresizesSubviews:1];
  [(UIView *)self->_selectedView removeFromSuperview];
  id v3 = objc_alloc(MEMORY[0x1E4F42FF0]);
  [(CNModernAtomBackgroundView *)self bounds];
  v4 = (UIView *)objc_msgSend(v3, "initWithFrame:");
  selectedView = self->_selectedView;
  self->_selectedView = v4;

  v6 = [(CNModernAtomBackgroundView *)self wrappedTintColor];
  [(UIView *)self->_selectedView setBackgroundColor:v6];

  [(UIView *)self->_selectedView setAlpha:0.0];
  [(UIView *)self->_selectedView setAutoresizingMask:2];
  v7 = [(UIView *)self->_selectedView layer];
  [v7 setShouldRasterize:1];

  v8 = [MEMORY[0x1E4F42D90] mainScreen];
  [v8 scale];
  double v10 = v9;
  v11 = [(UIView *)self->_selectedView layer];
  [v11 setRasterizationScale:v10];

  [(UIView *)self->_selectedView _setContinuousCornerRadius:4.5];
  [(CNModernAtomBackgroundView *)self addSubview:self->_selectedView];
  self->_selectionStyle = 0;
}

- (CNModernAtomBackgroundView)initWithFrame:(CGRect)a3
{
  v6.receiver = self;
  v6.super_class = (Class)CNModernAtomBackgroundView;
  id v3 = -[CNModernAtomBackgroundView initWithFrame:](&v6, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3) {
    [(CNModernAtomBackgroundView *)v3 _setupBackgroundView];
  }
  return v4;
}

- (id)wrappedTintColor
{
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __46__CNModernAtomBackgroundView_wrappedTintColor__block_invoke;
  v4[3] = &unk_1E6128D58;
  v4[4] = self;
  v2 = [MEMORY[0x1E4F428B8] colorWithDynamicProvider:v4];

  return v2;
}

uint64_t __46__CNModernAtomBackgroundView_wrappedTintColor__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) tintColor];
}

- (void)tintColorDidChange
{
  id v3 = [(CNModernAtomBackgroundView *)self wrappedTintColor];
  [(UIView *)self->_selectedView setBackgroundColor:v3];
}

- (double)separatorWidth
{
  id v3 = [(CNModernAtomBackgroundView *)self hostAtomView];
  char v4 = [v3 isWrappingEnabled];

  double result = 0.0;
  if ((v4 & 1) == 0)
  {
    int separatorStyle = self->_separatorStyle;
    [(UIView *)self->_separatorView bounds];
    if (separatorStyle) {
      double v8 = 3.0;
    }
    else {
      double v8 = -7.0;
    }
    return v7 + v8;
  }
  return result;
}

- (UIEdgeInsets)_backgroundBleedArea
{
  [(CNModernAtomBackgroundView *)self separatorWidth];
  double v3 = v2;
  double v4 = 0.0;
  double v5 = 0.0;
  double v6 = 0.0;
  result.right = v3;
  result.bottom = v6;
  result.left = v5;
  result.top = v4;
  return result;
}

- (void)layoutSubviews
{
  [(CNModernAtomBackgroundView *)self bounds];
  double v4 = v3;
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  v38 = [(CNModernAtomBackgroundView *)self hostAtomView];
  int v11 = [v38 separatorIsLeftAligned];
  int v12 = v11;
  if (self->_separatorStyle) {
    BOOL v13 = 1;
  }
  else {
    BOOL v13 = v11 == 0;
  }
  double v14 = v4;
  if (!v13)
  {
    [(CNModernAtomBackgroundView *)self separatorWidth];
    double v14 = v4 + v15;
  }
  -[UIView setFrame:](self->_selectedView, "setFrame:", v14, v6, v8, v10);
  [(CNModernAtomBackgroundView *)self _setSelectionStyle:self->_selectionStyle];
  uint64_t v16 = [v38 isWrappingEnabled];
  v17 = v38;
  if ((v16 & 1) == 0)
  {
    [(UIView *)self->_separatorView sizeToFit];
    [(UIView *)self->_separatorView frame];
    double v19 = v18;
    double v21 = v20;
    UIRoundToViewScale();
    double v23 = v22 + 1.0;
    double v24 = floor(v4 + v8 - v19) + -3.0;
    if (v12) {
      double v25 = 3.0;
    }
    else {
      double v25 = v24;
    }
    if (self->_separatorStyle) {
      goto LABEL_24;
    }
    v26 = [v38 accessoryIconView];
    char v27 = [v38 presentationOptions];
    v28 = [v26 iconImages];
    uint64_t v29 = [v28 count];

    if (v12)
    {
      if (v29)
      {
        [v26 frame];
        double MinX = CGRectGetMinX(v40);
        [v26 iconPadding];
        double v32 = MinX + v31 + -3.0;
      }
      else
      {
        v35 = [v38 titleLabel];
        [v35 frame];
        double v32 = CGRectGetMinX(v42);
      }
      double v25 = v32 - v19;
      if ((v27 & 4) == 0) {
        goto LABEL_23;
      }
      v36 = [v38 activityIndicator];
      [v36 frame];
      double v25 = v25 - (CGRectGetWidth(v43) + 3.0);
    }
    else
    {
      if (v29)
      {
        [v26 frame];
        double MaxX = CGRectGetMaxX(v41);
        [v26 iconPadding];
        double v25 = MaxX - v34 + 3.0;
        if ((v27 & 4) == 0) {
          goto LABEL_23;
        }
      }
      else
      {
        v37 = [v38 titleLabel];
        [v37 frame];
        double v25 = CGRectGetMaxX(v44);

        if ((v27 & 4) == 0)
        {
LABEL_23:

LABEL_24:
          uint64_t v16 = -[UIView setFrame:](self->_separatorView, "setFrame:", v25, v23, v19, v21);
          v17 = v38;
          goto LABEL_25;
        }
      }
      v36 = [v38 activityIndicator];
      [v36 frame];
      double v25 = v25 + CGRectGetWidth(v45) + 3.0;
    }

    goto LABEL_23;
  }
LABEL_25:

  MEMORY[0x1F41817F8](v16, v17);
}

- (void)_setSelectionStyle:(unint64_t)a3
{
  self->_selectionStyle = a3;
  uint64_t v3 = 5;
  if ((a3 & 0xFFFFFFFFFFFFFFFDLL) != 1) {
    uint64_t v3 = 0;
  }
  if (a3 - 1 >= 2) {
    uint64_t v4 = v3;
  }
  else {
    uint64_t v4 = v3 | 0xA;
  }
  id v5 = [(UIView *)self->_selectedView layer];
  [v5 setMaskedCorners:v4];
}

- (BOOL)appearsSelected
{
  if (![(CNModernAtomBackgroundView *)self isSelected]) {
    return 0;
  }
  uint64_t v3 = [(CNModernAtomBackgroundView *)self hostAtomView];
  uint64_t v4 = [v3 traitCollection];
  BOOL v5 = [v4 activeAppearance] == 1;

  return v5;
}

- (BOOL)isSelected
{
  return self->_selected;
}

- (void)setSelected:(BOOL)a3 animated:(BOOL)a4 style:(unint64_t)a5 updateVisualSelection:(BOOL)a6
{
  BOOL v6 = a6;
  BOOL v7 = a4;
  if (self->_selected != a3 || self->_selectionStyle != a5)
  {
    self->_selected = a3;
    [(CNModernAtomBackgroundView *)self _setSelectionStyle:a5];
    if (v6)
    {
      [(CNModernAtomBackgroundView *)self displaySelectionChangeWithAnimation:v7];
    }
  }
}

- (void)displaySelectionChangeWithAnimation:(BOOL)a3
{
  BOOL v3 = a3;
  BOOL v5 = [(CNModernAtomBackgroundView *)self appearsSelected];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __66__CNModernAtomBackgroundView_displaySelectionChangeWithAnimation___block_invoke;
  v8[3] = &unk_1E6128D08;
  v8[4] = self;
  BOOL v9 = v5;
  uint64_t v6 = MEMORY[0x1BA9A6470](v8);
  BOOL v7 = (void *)v6;
  if (v3) {
    [MEMORY[0x1E4F42FF0] animateWithDuration:v6 animations:0.15];
  }
  else {
    (*(void (**)(uint64_t))(v6 + 16))(v6);
  }
  [(CNModernAtomBackgroundView *)self setNeedsDisplay];
  [(CNModernAtomBackgroundView *)self layoutSubviews];
}

void __66__CNModernAtomBackgroundView_displaySelectionChangeWithAnimation___block_invoke(uint64_t a1)
{
  if (![*(id *)(a1 + 32) separatorStyle])
  {
    double v2 = [*(id *)(a1 + 32) separatorView];
    BOOL v3 = v2;
    double v4 = 0.0;
    if (!*(unsigned char *)(a1 + 40)) {
      double v4 = 1.0;
    }
    [v2 setAlpha:v4];
  }
  BOOL v5 = [*(id *)(a1 + 32) selectedView];
  id v7 = v5;
  double v6 = 1.0;
  if (!*(unsigned char *)(a1 + 40)) {
    double v6 = 0.0;
  }
  [v5 setAlpha:v6];
}

- (id)_chevronImage
{
  double v2 = [(CNModernAtomBackgroundView *)self hostAtomView];
  BOOL v3 = (void *)MEMORY[0x1E4F42A98];
  double v4 = [v2 titleFont];
  [v4 pointSize];
  BOOL v5 = objc_msgSend(v3, "configurationWithPointSize:weight:scale:", 6, 1);

  double v6 = [MEMORY[0x1E4F42A80] systemImageNamed:@"chevron.forward" withConfiguration:v5];
  id v7 = [MEMORY[0x1E4F428B8] tertiaryLabelColor];
  double v8 = [v6 imageWithTintColor:v7 renderingMode:1];

  return v8;
}

- (void)setSeparatorStyle:(int)a3
{
  self->_int separatorStyle = a3;
  id v17 = [(CNModernAtomBackgroundView *)self hostAtomView];
  int v5 = [v17 isWrappingEnabled];
  separatorView = self->_separatorView;
  if (a3 == 2 || v5)
  {
    [(UIView *)separatorView removeFromSuperview];
    BOOL v9 = self->_separatorView;
    self->_separatorView = 0;
LABEL_13:

    goto LABEL_14;
  }
  if (!separatorView || self->_separatorStyle != a3)
  {
    if (a3)
    {
      if (a3 != 1) {
        -[CNModernAtomBackgroundView setSeparatorStyle:]();
      }
      id v7 = [(CNModernAtomBackgroundView *)self _chevronImage];
      double v8 = (UIView *)[objc_alloc(MEMORY[0x1E4F42AA0]) initWithImage:v7];
    }
    else
    {
      id v10 = objc_alloc(MEMORY[0x1E4F42B38]);
      double v8 = (UIView *)objc_msgSend(v10, "initWithFrame:", *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
      int v11 = CNAUILocalizedAddressSeparator();
      [(UIView *)v8 setText:v11];

      int v12 = +[CNAtomView defaultFont];
      [(UIView *)v8 setFont:v12];

      BOOL v13 = [MEMORY[0x1E4F428B8] colorWithWhite:0.5 alpha:1.0];
      [(UIView *)v8 setTextColor:v13];

      double v14 = [MEMORY[0x1E4F428B8] clearColor];
      [(UIView *)v8 setBackgroundColor:v14];

      [(UIView *)v8 setAutoresizingMask:0];
      [(UIView *)v8 sizeToFit];
      [(UIView *)v8 setHidden:[(CNModernAtomBackgroundView *)self isSelected]];
    }
    double v15 = self->_separatorView;
    if (v15) {
      [(UIView *)v15 removeFromSuperview];
    }
    uint64_t v16 = self->_separatorView;
    self->_separatorView = v8;
    BOOL v9 = v8;

    [(CNModernAtomBackgroundView *)self addSubview:self->_separatorView];
    goto LABEL_13;
  }
LABEL_14:
}

- (void)invalidateIntrinsicContentSize
{
  v7.receiver = self;
  v7.super_class = (Class)CNModernAtomBackgroundView;
  [(CNModernAtomBackgroundView *)&v7 invalidateIntrinsicContentSize];
  BOOL v3 = [(CNModernAtomBackgroundView *)self hostAtomView];
  char v4 = [v3 isWrappingEnabled];

  if ((v4 & 1) == 0)
  {
    if ([(CNModernAtomBackgroundView *)self separatorStyle] == 1)
    {
      int v5 = [(CNModernAtomBackgroundView *)self _chevronImage];
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        [(UIView *)self->_separatorView setImage:v5];
      }
      goto LABEL_8;
    }
    if (![(CNModernAtomBackgroundView *)self separatorStyle])
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        [(UIView *)self->_separatorView setHidden:[(CNModernAtomBackgroundView *)self isSelected]];
        double v6 = self->_separatorView;
        int v5 = +[CNAtomView defaultFont];
        [(UIView *)v6 setFont:v5];

LABEL_8:
      }
    }
  }
}

- (double)scalingFactor
{
  return self->_scalingFactor;
}

- (void)setScalingFactor:(double)a3
{
  self->_scalingFactor = a3;
}

- (UIView)separatorView
{
  return self->_separatorView;
}

- (CNAtomView)hostAtomView
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_hostAtomView);

  return (CNAtomView *)WeakRetained;
}

- (void)setHostAtomView:(id)a3
{
}

- (UIView)selectedView
{
  return self->_selectedView;
}

- (int)separatorStyle
{
  return self->_separatorStyle;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_hostAtomView);
  objc_storeStrong((id *)&self->_separatorView, 0);

  objc_storeStrong((id *)&self->_selectedView, 0);
}

- (void)setSeparatorStyle:.cold.1()
{
}

@end