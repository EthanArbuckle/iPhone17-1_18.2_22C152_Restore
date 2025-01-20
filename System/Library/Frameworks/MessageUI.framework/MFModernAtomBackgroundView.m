@interface MFModernAtomBackgroundView
- (BOOL)isSelected;
- (MFModernAtomBackgroundView)initWithFrame:(CGRect)a3;
- (MFModernAtomView)hostAtomView;
- (UIEdgeInsets)_backgroundBleedArea;
- (UIView)selectedView;
- (UIView)separatorView;
- (double)scalingFactor;
- (double)separatorWidth;
- (id)_chevronImage;
- (int64_t)separatorStyle;
- (void)_setSelectionStyle:(unint64_t)a3;
- (void)invalidateIntrinsicContentSize;
- (void)layoutSubviews;
- (void)setHostAtomView:(id)a3;
- (void)setScalingFactor:(double)a3;
- (void)setSelected:(BOOL)a3 animated:(BOOL)a4 style:(unint64_t)a5;
- (void)setSeparatorStyle:(int64_t)a3;
- (void)tintColorDidChange;
@end

@implementation MFModernAtomBackgroundView

- (MFModernAtomBackgroundView)initWithFrame:(CGRect)a3
{
  v15.receiver = self;
  v15.super_class = (Class)MFModernAtomBackgroundView;
  v3 = -[MFModernAtomBackgroundView initWithFrame:](&v15, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    v3->_scalingFactor = 1.0;
    [(MFModernAtomBackgroundView *)v3 setAutoresizesSubviews:1];
    id v5 = objc_alloc(MEMORY[0x1E4FB1EB0]);
    [(MFModernAtomBackgroundView *)v4 bounds];
    uint64_t v6 = objc_msgSend(v5, "initWithFrame:");
    selectedView = v4->_selectedView;
    v4->_selectedView = (UIView *)v6;

    v8 = [(MFModernAtomBackgroundView *)v4 tintColor];
    [(UIView *)v4->_selectedView setBackgroundColor:v8];

    [(UIView *)v4->_selectedView setAlpha:0.0];
    [(UIView *)v4->_selectedView setAutoresizingMask:2];
    v9 = [(UIView *)v4->_selectedView layer];
    [v9 setShouldRasterize:1];

    v10 = [MEMORY[0x1E4FB1BA8] mainScreen];
    [v10 scale];
    double v12 = v11;
    v13 = [(UIView *)v4->_selectedView layer];
    [v13 setRasterizationScale:v12];

    [(MFModernAtomBackgroundView *)v4 addSubview:v4->_selectedView];
    v4->_selectionStyle = 0;
  }
  return v4;
}

- (void)tintColorDidChange
{
  id v3 = [(MFModernAtomBackgroundView *)self tintColor];
  -[UIView setBackgroundColor:](self->_selectedView, "setBackgroundColor:");
}

- (double)separatorWidth
{
  id v3 = [(MFModernAtomBackgroundView *)self hostAtomView];
  char v4 = [v3 isWrappingEnabled];

  double result = 0.0;
  if ((v4 & 1) == 0)
  {
    int64_t separatorStyle = self->_separatorStyle;
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
  [(MFModernAtomBackgroundView *)self separatorWidth];
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
  [(MFModernAtomBackgroundView *)self bounds];
  double v4 = v3;
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  id v39 = [(MFModernAtomBackgroundView *)self hostAtomView];
  int v11 = [v39 separatorIsLeftAligned];
  double v12 = v8;
  if ((self->_selectionStyle & 0x20) != 0)
  {
    [(MFModernAtomBackgroundView *)self _backgroundBleedArea];
    double v12 = v8 + v13;
  }
  if (self->_separatorStyle) {
    int v14 = 0;
  }
  else {
    int v14 = v11;
  }
  double v15 = v4;
  if (v14 == 1)
  {
    [(MFModernAtomBackgroundView *)self separatorWidth];
    double v15 = v4 + v16;
  }
  -[UIView setFrame:](self->_selectedView, "setFrame:", v15, v6, v12, v10);
  [(MFModernAtomBackgroundView *)self _setSelectionStyle:self->_selectionStyle];
  if (([v39 isWrappingEnabled] & 1) == 0)
  {
    [(UIView *)self->_separatorView sizeToFit];
    [(UIView *)self->_separatorView frame];
    double v18 = v17;
    double v20 = v19;
    UIRoundToViewScale();
    double v22 = v21;
    double v23 = floor(v4 + v8 - v18) + -3.0;
    if (v11) {
      double v24 = 3.0;
    }
    else {
      double v24 = v23;
    }
    if (self->_separatorStyle) {
      goto LABEL_26;
    }
    v25 = [v39 accessoryIconView];
    char v26 = [v39 presentationOptions];
    if (v11)
    {
      v27 = [v25 iconImages];
      uint64_t v28 = [v27 count];

      if (v28)
      {
        [v25 frame];
        double MinX = CGRectGetMinX(v41);
        [v25 iconPadding];
        double v31 = MinX + v30 + -3.0;
      }
      else
      {
        v36 = [v39 titleLabel];
        [v36 frame];
        double v31 = CGRectGetMinX(v43);
      }
      double v24 = v31 - v18;
      if ((v26 & 4) == 0) {
        goto LABEL_25;
      }
      v37 = [v39 activityIndicator];
      [v37 frame];
      double v24 = v24 - (CGRectGetWidth(v44) + 3.0);
    }
    else
    {
      v32 = [v25 iconImages];
      uint64_t v33 = [v32 count];

      if (v33)
      {
        [v25 frame];
        double MaxX = CGRectGetMaxX(v42);
        [v25 iconPadding];
        double v24 = MaxX - v35 + 3.0;
        if ((v26 & 4) == 0) {
          goto LABEL_25;
        }
      }
      else
      {
        v38 = [v39 titleLabel];
        [v38 frame];
        double v24 = CGRectGetMaxX(v45);

        if ((v26 & 4) == 0)
        {
LABEL_25:

LABEL_26:
          -[UIView setFrame:](self->_separatorView, "setFrame:", v24, v22, v18, v20);
          goto LABEL_27;
        }
      }
      v37 = [v39 activityIndicator];
      [v37 frame];
      double v24 = v24 + CGRectGetWidth(v46) + 3.0;
    }

    goto LABEL_25;
  }
LABEL_27:
}

- (void)_setSelectionStyle:(unint64_t)a3
{
  char v3 = a3;
  self->_selectionStyle = a3;
  if ((~a3 & 0xCLL) != 0)
  {
    [(MFModernAtomBackgroundView *)self bounds];
    double v6 = v5;
    double v8 = v7;
    double v10 = v9;
    double v12 = v11;
    uint64_t v13 = 10;
    if ((v3 & 4) == 0) {
      uint64_t v13 = -1;
    }
    if ((v3 & 8) != 0) {
      uint64_t v14 = 5;
    }
    else {
      uint64_t v14 = v13;
    }
    if ((v3 & 0x20) != 0)
    {
      [(MFModernAtomBackgroundView *)self _backgroundBleedArea];
      double v10 = v10 + v15;
    }
    id v19 = [MEMORY[0x1E4F39C88] layer];
    objc_msgSend(v19, "setAnchorPoint:", 0.0, 0.0);
    objc_msgSend(v19, "setBounds:", v6, v8, v10, v12);
    double v16 = (void *)MEMORY[0x1E4FB14C0];
    [(UIView *)self->_selectedView bounds];
    objc_msgSend(v16, "bezierPathWithRoundedRect:byRoundingCorners:cornerRadii:", v14);
    id v17 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "setPath:", objc_msgSend(v17, "CGPath"));

    double v18 = [(UIView *)self->_selectedView layer];
    [v18 setMask:v19];
  }
  else
  {
    id v19 = [(UIView *)self->_selectedView layer];
    [v19 setMask:0];
  }
}

- (BOOL)isSelected
{
  return self->_selected;
}

- (void)setSelected:(BOOL)a3 animated:(BOOL)a4 style:(unint64_t)a5
{
  BOOL v5 = a4;
  if (self->_selected != a3 || self->_selectionStyle != a5)
  {
    self->_selected = a3;
    [(MFModernAtomBackgroundView *)self _setSelectionStyle:a5];
    aBlock[0] = MEMORY[0x1E4F143A8];
    aBlock[1] = 3221225472;
    aBlock[2] = __57__MFModernAtomBackgroundView_setSelected_animated_style___block_invoke;
    aBlock[3] = &unk_1E5F79088;
    aBlock[4] = self;
    double v7 = _Block_copy(aBlock);
    double v8 = v7;
    if (v5) {
      [MEMORY[0x1E4FB1EB0] animateWithDuration:v7 animations:0.15];
    }
    else {
      (*((void (**)(void *))v7 + 2))(v7);
    }
    [(MFModernAtomBackgroundView *)self setNeedsDisplay];
    [(MFModernAtomBackgroundView *)self layoutSubviews];
  }
}

uint64_t __57__MFModernAtomBackgroundView_setSelected_animated_style___block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  if (!*(void *)(v1 + 432))
  {
    double v3 = 0.0;
    if (!*(unsigned char *)(v1 + 440)) {
      double v3 = 1.0;
    }
    [*(id *)(v1 + 424) setAlpha:v3];
    uint64_t v1 = *(void *)(a1 + 32);
  }
  double v4 = *(void **)(v1 + 408);
  double v5 = 1.0;
  if (!*(unsigned char *)(v1 + 440)) {
    double v5 = 0.0;
  }

  return [v4 setAlpha:v5];
}

- (id)_chevronImage
{
  if (!_chevronImage__chevronImageCache)
  {
    id v3 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
    double v4 = (void *)_chevronImage__chevronImageCache;
    _chevronImage__chevronImageCache = (uint64_t)v3;
  }
  double v5 = [(MFModernAtomBackgroundView *)self hostAtomView];
  uint64_t v6 = [v5 _preferredIconVariant];
  int v7 = [v5 isPrimaryAddressAtom];
  if (v6 < 6) {
    int v8 = v7;
  }
  else {
    int v8 = 0;
  }
  if (v8 == 1)
  {
    ++v6;
  }
  else
  {
    double v9 = [v5 titleFont];
    double v10 = [MEMORY[0x1E4FB08E0] preferredFontForTextStyle:*MEMORY[0x1E4FB28F0]];
    int v11 = [v9 isEqual:v10];

    if (v11)
    {
      if (v6 == 1) {
        uint64_t v12 = 0;
      }
      else {
        uint64_t v12 = v6;
      }
      if (v6 >= 2) {
        v6 -= 2;
      }
      else {
        uint64_t v6 = v12;
      }
    }
  }
  uint64_t v13 = _MFAtomViewIconImageVariantNameForGlyphType(@"chevron", v6);
  uint64_t v14 = [(id)_chevronImage__chevronImageCache objectForKeyedSubscript:v13];
  if (!v14)
  {
    double v15 = (void *)MEMORY[0x1E4FB1818];
    double v16 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
    id v17 = [v15 imageNamed:v13 inBundle:v16];
    double v18 = [MEMORY[0x1E4FB1618] colorWithWhite:0.8 alpha:1.0];
    uint64_t v14 = [v17 _flatImageWithColor:v18];

    [(id)_chevronImage__chevronImageCache setObject:v14 forKeyedSubscript:v13];
  }

  return v14;
}

- (void)setSeparatorStyle:(int64_t)a3
{
  self->_int64_t separatorStyle = a3;
  double v5 = [(MFModernAtomBackgroundView *)self hostAtomView];
  int v6 = [v5 isWrappingEnabled] ^ 1;
  p_separatorView = &self->_separatorView;
  separatorView = self->_separatorView;
  if (a3 == 2) {
    LOBYTE(v6) = 0;
  }
  if (v6)
  {
    if (!separatorView || self->_separatorStyle != a3)
    {
      if (a3)
      {
        if (a3 != 1) {
          __assert_rtn("-[MFModernAtomBackgroundView setSeparatorStyle:]", "MFModernAtomView.m", 1567, "0 && \"unexpected separatorStyle\"");
        }
        double v10 = [(MFModernAtomBackgroundView *)self _chevronImage];
        int v11 = (void *)[objc_alloc(MEMORY[0x1E4FB1838]) initWithImage:v10];
        if ([v5 separatorIsLeftAligned])
        {
          CGAffineTransformMakeScale(&v19, -1.0, 1.0);
        }
        else
        {
          long long v17 = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 16);
          *(_OWORD *)&v19.a = *MEMORY[0x1E4F1DAB8];
          *(_OWORD *)&v19.c = v17;
          *(_OWORD *)&v19.tx = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 32);
        }
        CGAffineTransform v18 = v19;
        [v11 setTransform:&v18];
      }
      else
      {
        id v12 = objc_alloc(MEMORY[0x1E4FB1930]);
        int v11 = objc_msgSend(v12, "initWithFrame:", *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
        uint64_t v13 = MFLocalizedAddressSeparator();
        [v11 setText:v13];

        uint64_t v14 = +[MFModernAtomView defaultFont];
        [v11 setFont:v14];

        double v15 = [MEMORY[0x1E4FB1618] colorWithWhite:0.5 alpha:1.0];
        [v11 setTextColor:v15];

        double v16 = [MEMORY[0x1E4FB1618] clearColor];
        [v11 setBackgroundColor:v16];

        [v11 setAutoresizingMask:0];
        [v11 sizeToFit];
      }
      if (*p_separatorView) {
        [(UIView *)*p_separatorView removeFromSuperview];
      }
      objc_storeStrong((id *)&self->_separatorView, v11);
      [(MFModernAtomBackgroundView *)self addSubview:*p_separatorView];
    }
  }
  else
  {
    [(UIView *)separatorView removeFromSuperview];
    double v9 = *p_separatorView;
    *p_separatorView = 0;
  }
}

- (void)invalidateIntrinsicContentSize
{
  v7.receiver = self;
  v7.super_class = (Class)MFModernAtomBackgroundView;
  [(MFModernAtomBackgroundView *)&v7 invalidateIntrinsicContentSize];
  id v3 = [(MFModernAtomBackgroundView *)self hostAtomView];
  char v4 = [v3 isWrappingEnabled];

  if ((v4 & 1) == 0)
  {
    if ([(MFModernAtomBackgroundView *)self separatorStyle] == 1)
    {
      double v5 = [(MFModernAtomBackgroundView *)self _chevronImage];
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        [(UIView *)self->_separatorView setImage:v5];
      }
      goto LABEL_8;
    }
    if (![(MFModernAtomBackgroundView *)self separatorStyle])
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        double v5 = self->_separatorView;
        int v6 = +[MFModernAtomView defaultFont];
        [(UIView *)v5 setFont:v6];

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

- (MFModernAtomView)hostAtomView
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_hostAtomView);

  return (MFModernAtomView *)WeakRetained;
}

- (void)setHostAtomView:(id)a3
{
}

- (UIView)selectedView
{
  return self->_selectedView;
}

- (int64_t)separatorStyle
{
  return self->_separatorStyle;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_hostAtomView);
  objc_storeStrong((id *)&self->_separatorView, 0);

  objc_storeStrong((id *)&self->_selectedView, 0);
}

@end