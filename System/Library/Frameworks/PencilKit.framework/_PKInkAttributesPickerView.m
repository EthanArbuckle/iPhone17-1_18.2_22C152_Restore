@interface _PKInkAttributesPickerView
- (BOOL)showsTopSeparator;
- (CGSize)sizeThatFits:(CGSize)a3;
- (PKInk)ink;
- (PKToolConfiguration)toolConfiguration;
- (UIView)colorAlphaSliderView;
- (UIView)middleSeparatorView;
- (UIView)topSeparatorView;
- (_PKColorAlphaSlider)colorAlphaSlider;
- (_PKInkAttributesPickerView)initWithInk:(id)a3 toolConfiguration:(id)a4;
- (_PKInkAttributesPickerViewDelegate)delegate;
- (_PKInkThicknessPicker)thicknessPicker;
- (double)minimumOpacityValue;
- (int64_t)colorUserInterfaceStyle;
- (unint64_t)displayMode;
- (void)_colorAlphaSliderUserDidEndDraggingSlider:(id)a3;
- (void)_colorAlphaSliderUserDidStartDraggingSlider:(id)a3;
- (void)_opacityValueChanged:(id)a3;
- (void)_thicknessValueChanged:(id)a3;
- (void)_updateUI;
- (void)layoutSubviews;
- (void)setColorAlphaSlider:(id)a3;
- (void)setColorAlphaSliderView:(id)a3;
- (void)setColorUserInterfaceStyle:(int64_t)a3;
- (void)setDelegate:(id)a3;
- (void)setDisplayMode:(unint64_t)a3;
- (void)setInk:(id)a3;
- (void)setInk:(id)a3 animated:(BOOL)a4;
- (void)setMiddleSeparatorView:(id)a3;
- (void)setMinimumOpacityValue:(double)a3;
- (void)setShowsTopSeparator:(BOOL)a3;
- (void)setThicknessPicker:(id)a3;
- (void)setToolConfiguration:(id)a3;
- (void)setTopSeparatorView:(id)a3;
@end

@implementation _PKInkAttributesPickerView

- (_PKInkAttributesPickerView)initWithInk:(id)a3 toolConfiguration:(id)a4
{
  v6 = (PKToolConfiguration *)a4;
  v31.receiver = self;
  v31.super_class = (Class)_PKInkAttributesPickerView;
  double v7 = *MEMORY[0x1E4F1DB28];
  double v8 = *(double *)(MEMORY[0x1E4F1DB28] + 8);
  double v9 = *(double *)(MEMORY[0x1E4F1DB28] + 16);
  double v10 = *(double *)(MEMORY[0x1E4F1DB28] + 24);
  id v11 = a3;
  v12 = -[_PKInkAttributesPickerView initWithFrame:](&v31, sel_initWithFrame_, v7, v8, v9, v10);
  v12->_minimumOpacityValue = 0.0;
  toolConfiguration = v12->_toolConfiguration;
  v12->_toolConfiguration = v6;
  v14 = v6;

  v15 = (_PKInkThicknessPicker *)-[_PKInkThicknessPicker initWithToolConfiguration:]([_PKInkThicknessPicker alloc], v14);
  thicknessPicker = v12->_thicknessPicker;
  v12->_thicknessPicker = v15;

  [(_PKInkThicknessPicker *)v12->_thicknessPicker addTarget:v12 action:sel__thicknessValueChanged_ forControlEvents:4096];
  v17 = [(_PKInkAttributesPickerView *)v12 thicknessPicker];
  [(_PKInkAttributesPickerView *)v12 addSubview:v17];

  v18 = -[_PKColorAlphaSliderIOS initWithFrame:]([_PKColorAlphaSliderIOS alloc], "initWithFrame:", v7, v8, v9, v10);
  colorAlphaSliderView = v12->_colorAlphaSliderView;
  v12->_colorAlphaSliderView = &v18->super;

  objc_storeStrong((id *)&v12->_colorAlphaSlider, v12->_colorAlphaSliderView);
  [(_PKColorAlphaSlider *)v12->_colorAlphaSlider setDelegate:v12];
  [(_PKColorAlphaSlider *)v12->_colorAlphaSlider setMaxAlpha:1.0];
  v20 = [(_PKInkAttributesPickerView *)v12 colorAlphaSliderView];
  [(_PKInkAttributesPickerView *)v12 addSubview:v20];

  uint64_t v21 = objc_msgSend(objc_alloc(MEMORY[0x1E4FB1EB0]), "initWithFrame:", v7, v8, v9, v10);
  topSeparatorView = v12->_topSeparatorView;
  v12->_topSeparatorView = (UIView *)v21;

  v23 = objc_msgSend(MEMORY[0x1E4FB1618], "pk_separatorLineColor");
  [(UIView *)v12->_topSeparatorView setBackgroundColor:v23];

  [(_PKInkAttributesPickerView *)v12 addSubview:v12->_topSeparatorView];
  uint64_t v24 = objc_msgSend(objc_alloc(MEMORY[0x1E4FB1EB0]), "initWithFrame:", v7, v8, v9, v10);
  middleSeparatorView = v12->_middleSeparatorView;
  v12->_middleSeparatorView = (UIView *)v24;

  v26 = objc_msgSend(MEMORY[0x1E4FB1618], "pk_separatorLineColor");
  [(UIView *)v12->_middleSeparatorView setBackgroundColor:v26];

  [(_PKInkAttributesPickerView *)v12 addSubview:v12->_middleSeparatorView];
  [(_PKInkAttributesPickerView *)v12 setInk:v11];
  [(_PKInkAttributesPickerView *)v12 setDisplayMode:0];
  [(_PKInkAttributesPickerView *)v12 _setContinuousCornerRadius:8.0];
  v27 = NSString;
  v28 = [v11 identifier];

  v29 = [v27 stringWithFormat:@"%@%@", v28, @"_InkAttributesPicker", v31.receiver, v31.super_class];

  [(_PKInkAttributesPickerView *)v12 setAccessibilityIdentifier:v29];
  [(_PKInkAttributesPickerView *)v12 _updateUI];
  return v12;
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double v4 = *MEMORY[0x1E4F1DB30];
  double v5 = *(double *)(MEMORY[0x1E4F1DB30] + 8);
  v6 = [(_PKInkAttributesPickerView *)self thicknessPicker];
  objc_msgSend(v6, "sizeThatFits:", v4, v5);
  double v8 = v7;
  double v10 = v9;

  id v11 = [(_PKInkAttributesPickerView *)self toolConfiguration];
  [v11 strokeWeightButtonSize];
  double v13 = v12;
  double v15 = v14;

  +[_PKInkThicknessPicker sizeWithButtonCount:buttonSize:](_PKInkThicknessPicker, "sizeWithButtonCount:buttonSize:", 5, v13, v15);
  double v17 = fmax(v8, v16);
  v18 = [(_PKInkAttributesPickerView *)self colorAlphaSliderView];
  objc_msgSend(v18, "sizeThatFits:", v4, v5);
  double v20 = v19;

  if ([(_PKInkAttributesPickerView *)self displayMode])
  {
    if ([(_PKInkAttributesPickerView *)self displayMode] == 2)
    {
      double v21 = v17 + 24.0;
      double v22 = v20 + 24.0;
    }
    else
    {
      unint64_t v23 = [(_PKInkAttributesPickerView *)self displayMode];
      if (v23 == 1) {
        double v22 = v10 + 24.0;
      }
      else {
        double v22 = v5;
      }
      if (v23 == 1) {
        double v21 = v17 + 24.0;
      }
      else {
        double v21 = v4;
      }
    }
  }
  else
  {
    double v21 = v17 + 24.0;
    double v22 = v10 + 48.0 + v20;
  }
  result.height = v22;
  result.width = v21;
  return result;
}

- (void)layoutSubviews
{
  v47.receiver = self;
  v47.super_class = (Class)_PKInkAttributesPickerView;
  [(_PKInkAttributesPickerView *)&v47 layoutSubviews];
  v3 = [(_PKInkAttributesPickerView *)self ink];
  [v3 weight];
  uint64_t v5 = v4;
  v6 = [(_PKInkAttributesPickerView *)self thicknessPicker];
  double v7 = v6;
  if (v6)
  {
    v6[58] = v5;
    [v6 setNeedsLayout];
  }

  double v8 = [(_PKInkAttributesPickerView *)self ink];
  double v9 = [v8 color];
  double v10 = [(_PKInkAttributesPickerView *)self colorAlphaSlider];
  [v10 setColor:v9];

  [(_PKInkAttributesPickerView *)self bounds];
  CGRect v49 = CGRectInset(v48, 12.0, 12.0);
  CGFloat x = v49.origin.x;
  CGFloat y = v49.origin.y;
  CGFloat width = v49.size.width;
  CGFloat height = v49.size.height;
  if ([(_PKInkAttributesPickerView *)self displayMode])
  {
    if ([(_PKInkAttributesPickerView *)self displayMode] == 2)
    {
      double v15 = [(_PKInkAttributesPickerView *)self colorAlphaSliderView];
      [v15 setAlpha:1.0];

      double v16 = [(_PKInkAttributesPickerView *)self thicknessPicker];
      [v16 setAlpha:0.0];

      double v17 = [(_PKInkAttributesPickerView *)self middleSeparatorView];
      [v17 setAlpha:0.0];

      v50.origin.CGFloat x = x;
      v50.origin.CGFloat y = y;
      v50.size.CGFloat width = width;
      v50.size.CGFloat height = height;
      CGRectGetMinX(v50);
      v51.origin.CGFloat x = x;
      v51.origin.CGFloat y = y;
      v51.size.CGFloat width = width;
      v51.size.CGFloat height = height;
      CGRectGetMinY(v51);
      v18 = [(_PKInkAttributesPickerView *)self colorAlphaSliderView];
      v52.origin.CGFloat x = x;
      v52.origin.CGFloat y = y;
      v52.size.CGFloat width = width;
      v52.size.CGFloat height = height;
      objc_msgSend(v18, "sizeThatFits:", CGRectGetWidth(v52), 0.0);

      double v19 = [(_PKInkAttributesPickerView *)self traitCollection];
      [v19 displayScale];
      UIRectIntegralWithScale();
      double v20 = &OBJC_IVAR____PKInkAttributesPickerView__colorAlphaSliderView;
    }
    else
    {
      if ([(_PKInkAttributesPickerView *)self displayMode] != 1) {
        goto LABEL_10;
      }
      v38 = [(_PKInkAttributesPickerView *)self colorAlphaSliderView];
      [v38 setAlpha:0.0];

      v39 = [(_PKInkAttributesPickerView *)self thicknessPicker];
      [v39 setAlpha:1.0];

      v40 = [(_PKInkAttributesPickerView *)self middleSeparatorView];
      [v40 setAlpha:0.0];

      v41 = [(_PKInkAttributesPickerView *)self thicknessPicker];
      v59.origin.CGFloat x = x;
      v59.origin.CGFloat y = y;
      v59.size.CGFloat width = width;
      v59.size.CGFloat height = height;
      objc_msgSend(v41, "sizeThatFits:", CGRectGetWidth(v59), 0.0);
      DKDRectWithSizeAlignedToRect(2, 1, v42, v43, x, y, width, height);

      double v19 = [(_PKInkAttributesPickerView *)self traitCollection];
      [v19 displayScale];
      UIRectIntegralWithScale();
      double v20 = &OBJC_IVAR____PKInkAttributesPickerView__thicknessPicker;
    }
  }
  else
  {
    double v21 = [(_PKInkAttributesPickerView *)self colorAlphaSliderView];
    [v21 setAlpha:1.0];

    double v22 = [(_PKInkAttributesPickerView *)self thicknessPicker];
    [v22 setAlpha:1.0];

    unint64_t v23 = [(_PKInkAttributesPickerView *)self middleSeparatorView];
    [v23 setAlpha:1.0];

    uint64_t v24 = [(_PKInkAttributesPickerView *)self thicknessPicker];
    v53.origin.CGFloat x = x;
    v53.origin.CGFloat y = y;
    v53.size.CGFloat width = width;
    v53.size.CGFloat height = height;
    objc_msgSend(v24, "sizeThatFits:", CGRectGetWidth(v53), 0.0);
    double v27 = DKDRectWithSizeAlignedToRect(2, 1, v25, v26, x, y, width, height);
    CGFloat v29 = v28;
    CGFloat v31 = v30;
    CGFloat v33 = v32;

    v54.origin.CGFloat x = x;
    v54.origin.CGFloat y = y;
    v54.size.CGFloat width = width;
    v54.size.CGFloat height = height;
    CGRectGetMinX(v54);
    v55.origin.CGFloat x = v27;
    v55.origin.CGFloat y = v29;
    v55.size.CGFloat width = v31;
    v55.size.CGFloat height = v33;
    CGRectGetMaxY(v55);
    v34 = [(_PKInkAttributesPickerView *)self colorAlphaSliderView];
    v56.origin.CGFloat x = x;
    v56.origin.CGFloat y = y;
    v56.size.CGFloat width = width;
    v56.size.CGFloat height = height;
    objc_msgSend(v34, "sizeThatFits:", CGRectGetWidth(v56), 0.0);

    v57.origin.CGFloat x = v27;
    v57.origin.CGFloat y = v29;
    v57.size.CGFloat width = v31;
    v57.size.CGFloat height = v33;
    CGRectGetMaxY(v57);
    v35 = [(_PKInkAttributesPickerView *)self traitCollection];
    [v35 displayScale];

    [(_PKInkAttributesPickerView *)self bounds];
    CGRectGetWidth(v58);
    v36 = [(_PKInkAttributesPickerView *)self traitCollection];
    [v36 displayScale];
    UIRectIntegralWithScale();
    -[_PKInkThicknessPicker setFrame:](self->_thicknessPicker, "setFrame:");

    v37 = [(_PKInkAttributesPickerView *)self traitCollection];
    [v37 displayScale];
    UIRectIntegralWithScale();
    -[UIView setFrame:](self->_colorAlphaSliderView, "setFrame:");

    double v19 = [(_PKInkAttributesPickerView *)self traitCollection];
    [v19 displayScale];
    UIRectIntegralWithScale();
    double v20 = &OBJC_IVAR____PKInkAttributesPickerView__middleSeparatorView;
  }
  objc_msgSend(*(id *)((char *)&self->super.super.super.isa + *v20), "setFrame:");

LABEL_10:
  topSeparatorView = self->_topSeparatorView;
  if (self->_showsTopSeparator)
  {
    [(UIView *)topSeparatorView setAlpha:1.0];
    v45 = [(_PKInkAttributesPickerView *)self traitCollection];
    [v45 displayScale];

    [(_PKInkAttributesPickerView *)self bounds];
    CGRectGetWidth(v60);
    v46 = [(_PKInkAttributesPickerView *)self traitCollection];
    [v46 displayScale];
    UIRectIntegralWithScale();
    -[UIView setFrame:](self->_topSeparatorView, "setFrame:");
  }
  else
  {
    [(UIView *)topSeparatorView setAlpha:0.0];
  }
}

- (void)setColorUserInterfaceStyle:(int64_t)a3
{
  id v4 = [(_PKInkAttributesPickerView *)self colorAlphaSlider];
  [v4 setColorUserInterfaceStyle:a3];
}

- (int64_t)colorUserInterfaceStyle
{
  v2 = [(_PKInkAttributesPickerView *)self colorAlphaSlider];
  int64_t v3 = [v2 colorUserInterfaceStyle];

  return v3;
}

- (void)setMinimumOpacityValue:(double)a3
{
  if (self->_minimumOpacityValue != a3)
  {
    self->_minimumOpacityValue = a3;
    [(_PKInkAttributesPickerView *)self _updateUI];
  }
}

- (void)setShowsTopSeparator:(BOOL)a3
{
  if (self->_showsTopSeparator != a3)
  {
    self->_showsTopSeparator = a3;
    [(_PKInkAttributesPickerView *)self setNeedsLayout];
  }
}

- (void)_updateUI
{
  [(_PKInkAttributesPickerView *)self minimumOpacityValue];
  double v4 = v3;
  id v5 = [(_PKInkAttributesPickerView *)self colorAlphaSlider];
  [v5 setMinAlpha:v4];
}

- (void)setInk:(id)a3
{
}

- (void)setInk:(id)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  objc_storeStrong((id *)&self->_ink, a3);
  [(_PKInkAttributesPickerView *)self setNeedsLayout];
  v6 = [(_PKInkAttributesPickerView *)self ink];
  [v6 weight];
  uint64_t v8 = v7;
  double v9 = [(_PKInkAttributesPickerView *)self thicknessPicker];
  double v10 = v9;
  if (v9)
  {
    v9[58] = v8;
    [v9 setNeedsLayout];
  }

  id v13 = [(_PKInkAttributesPickerView *)self colorAlphaSlider];
  id v11 = [(_PKInkAttributesPickerView *)self ink];
  double v12 = [v11 color];
  [v13 setColor:v12 animated:v4];
}

- (void)setDisplayMode:(unint64_t)a3
{
  self->_displayMode = a3;
  [(_PKInkAttributesPickerView *)self setNeedsLayout];
}

- (void)_thicknessValueChanged:(id)a3
{
  BOOL v4 = (double *)a3;
  id v5 = [(_PKInkAttributesPickerView *)self ink];
  if (v4) {
    double v6 = v4[58];
  }
  else {
    double v6 = 0.0;
  }

  uint64_t v7 = +[PKInk inkFromInk:v5 weight:v6];
  [(_PKInkAttributesPickerView *)self setInk:v7];

  id v8 = [(_PKInkAttributesPickerView *)self delegate];
  [v8 inkAttributesPickerViewDidChangeInkThickness:self];
}

- (void)_opacityValueChanged:(id)a3
{
  id v4 = a3;
  id v5 = [(_PKInkAttributesPickerView *)self ink];
  double v6 = [v4 color];

  uint64_t v7 = +[PKInk inkFromInk:v5 color:v6];
  [(_PKInkAttributesPickerView *)self setInk:v7];

  id v8 = [(_PKInkAttributesPickerView *)self delegate];
  [v8 inkAttributesPickerViewDidChangeInkOpacity:self];
}

- (void)_colorAlphaSliderUserDidStartDraggingSlider:(id)a3
{
  uint64_t v4 = [(_PKInkAttributesPickerView *)self delegate];
  if (v4)
  {
    id v5 = (void *)v4;
    double v6 = [(_PKInkAttributesPickerView *)self delegate];
    char v7 = objc_opt_respondsToSelector();

    if (v7)
    {
      id v8 = [(_PKInkAttributesPickerView *)self delegate];
      [v8 _inkAttributesPickerViewUserDidStartDraggingSlider:self];
    }
  }
}

- (void)_colorAlphaSliderUserDidEndDraggingSlider:(id)a3
{
  uint64_t v4 = [(_PKInkAttributesPickerView *)self delegate];
  if (v4)
  {
    id v5 = (void *)v4;
    double v6 = [(_PKInkAttributesPickerView *)self delegate];
    char v7 = objc_opt_respondsToSelector();

    if (v7)
    {
      id v8 = [(_PKInkAttributesPickerView *)self delegate];
      [v8 _inkAttributesPickerViewUserDidEndDraggingSlider:self];
    }
  }
}

- (_PKInkAttributesPickerViewDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (_PKInkAttributesPickerViewDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (PKInk)ink
{
  return self->_ink;
}

- (unint64_t)displayMode
{
  return self->_displayMode;
}

- (double)minimumOpacityValue
{
  return self->_minimumOpacityValue;
}

- (BOOL)showsTopSeparator
{
  return self->_showsTopSeparator;
}

- (_PKInkThicknessPicker)thicknessPicker
{
  return self->_thicknessPicker;
}

- (void)setThicknessPicker:(id)a3
{
}

- (UIView)colorAlphaSliderView
{
  return self->_colorAlphaSliderView;
}

- (void)setColorAlphaSliderView:(id)a3
{
}

- (_PKColorAlphaSlider)colorAlphaSlider
{
  return self->_colorAlphaSlider;
}

- (void)setColorAlphaSlider:(id)a3
{
}

- (PKToolConfiguration)toolConfiguration
{
  return self->_toolConfiguration;
}

- (void)setToolConfiguration:(id)a3
{
}

- (UIView)topSeparatorView
{
  return self->_topSeparatorView;
}

- (void)setTopSeparatorView:(id)a3
{
}

- (UIView)middleSeparatorView
{
  return self->_middleSeparatorView;
}

- (void)setMiddleSeparatorView:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_middleSeparatorView, 0);
  objc_storeStrong((id *)&self->_topSeparatorView, 0);
  objc_storeStrong((id *)&self->_toolConfiguration, 0);
  objc_storeStrong((id *)&self->_colorAlphaSlider, 0);
  objc_storeStrong((id *)&self->_colorAlphaSliderView, 0);
  objc_storeStrong((id *)&self->_thicknessPicker, 0);
  objc_storeStrong((id *)&self->_ink, 0);

  objc_destroyWeak((id *)&self->_delegate);
}

@end