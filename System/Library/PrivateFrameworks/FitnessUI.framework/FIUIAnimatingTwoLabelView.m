@interface FIUIAnimatingTwoLabelView
- (CGRect)_frameAboveBounds;
- (CGRect)_frameBelowBounds;
- (CGSize)sizeThatFits:(CGSize)a3;
- (FIUIAnimatingTwoLabelView)initWithFrame:(CGRect)a3;
- (FIUIAnimatingTwoLabelView)initWithFrame:(CGRect)a3 mainLabel:(id)a4 secondaryLabel:(id)a5;
- (UILabel)mainLabel;
- (UILabel)secondaryLabel;
- (UILabel)visibleLabel;
- (void)_updateHidden;
- (void)applyFont:(id)a3;
- (void)layoutSubviews;
- (void)setFrame:(CGRect)a3;
- (void)setMainLabel:(id)a3;
- (void)setSecondaryLabel:(id)a3;
- (void)showMainLabelAnimated:(BOOL)a3;
- (void)showSecondaryLabelAnimated:(BOOL)a3;
@end

@implementation FIUIAnimatingTwoLabelView

- (FIUIAnimatingTwoLabelView)initWithFrame:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  id v8 = objc_alloc(MEMORY[0x263F828E0]);
  v9 = objc_msgSend(v8, "initWithFrame:", *MEMORY[0x263F001A8], *(double *)(MEMORY[0x263F001A8] + 8), *(double *)(MEMORY[0x263F001A8] + 16), *(double *)(MEMORY[0x263F001A8] + 24));
  v10 = -[FIUIAnimatingTwoLabelView initWithFrame:mainLabel:secondaryLabel:](self, "initWithFrame:mainLabel:secondaryLabel:", v9, 0, x, y, width, height);

  return v10;
}

- (FIUIAnimatingTwoLabelView)initWithFrame:(CGRect)a3 mainLabel:(id)a4 secondaryLabel:(id)a5
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  id v11 = a4;
  id v12 = a5;
  v19.receiver = self;
  v19.super_class = (Class)FIUIAnimatingTwoLabelView;
  v13 = -[FIUIAnimatingTwoLabelView initWithFrame:](&v19, sel_initWithFrame_, x, y, width, height);
  v14 = v13;
  if (v13)
  {
    [(FIUIAnimatingTwoLabelView *)v13 setClipsToBounds:1];
    [(FIUIAnimatingTwoLabelView *)v14 setMainLabel:v11];
    [(FIUIAnimatingTwoLabelView *)v14 setSecondaryLabel:v12];
    v15 = objc_msgSend(MEMORY[0x263F81708], "fu_mediumFontOfSize:", 17.0);
    [(FIUIAnimatingTwoLabelView *)v14 applyFont:v15];

    v16 = [(FIUIAnimatingTwoLabelView *)v14 mainLabel];
    [(FIUIAnimatingTwoLabelView *)v14 addSubview:v16];

    v17 = [(FIUIAnimatingTwoLabelView *)v14 secondaryLabel];
    [(FIUIAnimatingTwoLabelView *)v14 addSubview:v17];

    [(FIUIAnimatingTwoLabelView *)v14 showMainLabelAnimated:0];
  }

  return v14;
}

- (void)setFrame:(CGRect)a3
{
  v4.receiver = self;
  v4.super_class = (Class)FIUIAnimatingTwoLabelView;
  -[FIUIAnimatingTwoLabelView setFrame:](&v4, sel_setFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  [(FIUIAnimatingTwoLabelView *)self setNeedsLayout];
}

- (void)layoutSubviews
{
  v5.receiver = self;
  v5.super_class = (Class)FIUIAnimatingTwoLabelView;
  [(FIUIAnimatingTwoLabelView *)&v5 layoutSubviews];
  secondaryLabel = self->_secondaryLabel;
  if (self->_visibleLabel == secondaryLabel) {
    secondaryLabel = self->_mainLabel;
  }
  objc_super v4 = secondaryLabel;
  [(FIUIAnimatingTwoLabelView *)self _frameAboveBounds];
  -[UILabel setFrame:](v4, "setFrame:");
  [(FIUIAnimatingTwoLabelView *)self bounds];
  -[UILabel setFrame:](self->_visibleLabel, "setFrame:");
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  v30[1] = *MEMORY[0x263EF8340];
  objc_super v4 = [(FIUIAnimatingTwoLabelView *)self mainLabel];
  objc_super v5 = (uint64_t *)MEMORY[0x263F814F0];
  if (v4)
  {
    v6 = [(FIUIAnimatingTwoLabelView *)self mainLabel];
    v7 = [v6 text];
    uint64_t v29 = *v5;
    id v8 = [(FIUIAnimatingTwoLabelView *)self mainLabel];
    v9 = [v8 font];
    v30[0] = v9;
    v10 = [NSDictionary dictionaryWithObjects:v30 forKeys:&v29 count:1];
    [v7 sizeWithAttributes:v10];
    double v12 = v11;
    double v14 = v13;
  }
  else
  {
    double v12 = *MEMORY[0x263F001B0];
    double v14 = *(double *)(MEMORY[0x263F001B0] + 8);
  }

  v15 = [(FIUIAnimatingTwoLabelView *)self secondaryLabel];
  if (v15)
  {
    v16 = [(FIUIAnimatingTwoLabelView *)self secondaryLabel];
    v17 = [v16 text];
    uint64_t v27 = *v5;
    v18 = [(FIUIAnimatingTwoLabelView *)self secondaryLabel];
    objc_super v19 = [v18 font];
    v28 = v19;
    v20 = [NSDictionary dictionaryWithObjects:&v28 forKeys:&v27 count:1];
    [v17 sizeWithAttributes:v20];
    double v22 = v21;
    double v24 = v23;
  }
  else
  {
    double v22 = *MEMORY[0x263F001B0];
    double v24 = *(double *)(MEMORY[0x263F001B0] + 8);
  }

  if (v12 >= v22) {
    double v25 = v12;
  }
  else {
    double v25 = v22;
  }
  if (v14 >= v24) {
    double v26 = v14;
  }
  else {
    double v26 = v24;
  }
  result.double height = v26;
  result.double width = v25;
  return result;
}

- (CGRect)_frameAboveBounds
{
  [(FIUIAnimatingTwoLabelView *)self bounds];
  uint64_t v4 = v3;
  uint64_t v6 = v5;
  uint64_t v8 = v7;
  uint64_t v10 = v9;
  [(FIUIAnimatingTwoLabelView *)self bounds];
  double v11 = -CGRectGetHeight(v17);
  uint64_t v12 = v4;
  uint64_t v13 = v6;
  uint64_t v14 = v8;
  uint64_t v15 = v10;
  return CGRectOffset(*(CGRect *)&v12, 0.0, v11);
}

- (CGRect)_frameBelowBounds
{
  [(FIUIAnimatingTwoLabelView *)self bounds];
  uint64_t v4 = v3;
  uint64_t v6 = v5;
  uint64_t v8 = v7;
  uint64_t v10 = v9;
  [(FIUIAnimatingTwoLabelView *)self bounds];
  CGFloat Height = CGRectGetHeight(v17);
  uint64_t v12 = v4;
  uint64_t v13 = v6;
  uint64_t v14 = v8;
  uint64_t v15 = v10;
  return CGRectOffset(*(CGRect *)&v12, 0.0, Height);
}

- (UILabel)visibleLabel
{
  return self->_visibleLabel;
}

- (void)showMainLabelAnimated:(BOOL)a3
{
  p_visibleLabel = &self->_visibleLabel;
  mainLabel = self->_mainLabel;
  if (*p_visibleLabel != mainLabel)
  {
    BOOL v6 = a3;
    objc_storeStrong((id *)p_visibleLabel, mainLabel);
    uint64_t v7 = self->_mainLabel;
    [(FIUIAnimatingTwoLabelView *)self _frameBelowBounds];
    -[UILabel setFrame:](v7, "setFrame:");
    [(UILabel *)self->_mainLabel setHidden:0];
    uint64_t v8 = (void *)MEMORY[0x263F82E00];
    double v9 = 0.0;
    if (v6)
    {
      UIAnimationDragCoefficient();
      double v9 = (float)(v10 * 0.5);
    }
    v11[4] = self;
    v12[0] = MEMORY[0x263EF8330];
    v12[1] = 3221225472;
    v12[2] = __51__FIUIAnimatingTwoLabelView_showMainLabelAnimated___block_invoke;
    v12[3] = &unk_2644A7B18;
    v12[4] = self;
    v11[0] = MEMORY[0x263EF8330];
    v11[1] = 3221225472;
    v11[2] = __51__FIUIAnimatingTwoLabelView_showMainLabelAnimated___block_invoke_2;
    v11[3] = &unk_2644A7B18;
    objc_msgSend(v8, "fiui_animateIfNeededWithDuration:delay:options:animations:completion:", 0x20000, v12, v11, v9, 0.0);
  }
}

uint64_t __51__FIUIAnimatingTwoLabelView_showMainLabelAnimated___block_invoke(uint64_t a1)
{
  v2 = *(void **)(a1 + 32);
  uint64_t v3 = (void *)v2[52];
  [v2 bounds];
  objc_msgSend(v3, "setFrame:");
  [*(id *)(*(void *)(a1 + 32) + 416) setAlpha:1.0];
  uint64_t v4 = *(void **)(a1 + 32);
  uint64_t v5 = (void *)v4[53];
  [v4 _frameAboveBounds];
  objc_msgSend(v5, "setFrame:");
  BOOL v6 = *(void **)(*(void *)(a1 + 32) + 424);
  return [v6 setAlpha:0.2];
}

uint64_t __51__FIUIAnimatingTwoLabelView_showMainLabelAnimated___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) _updateHidden];
}

- (void)showSecondaryLabelAnimated:(BOOL)a3
{
  p_visibleLabel = &self->_visibleLabel;
  secondaryLabel = self->_secondaryLabel;
  if (*p_visibleLabel != secondaryLabel)
  {
    BOOL v6 = a3;
    objc_storeStrong((id *)p_visibleLabel, secondaryLabel);
    uint64_t v7 = self->_secondaryLabel;
    [(FIUIAnimatingTwoLabelView *)self _frameAboveBounds];
    -[UILabel setFrame:](v7, "setFrame:");
    [(UILabel *)self->_secondaryLabel setHidden:0];
    uint64_t v8 = (void *)MEMORY[0x263F82E00];
    double v9 = 0.0;
    if (v6)
    {
      UIAnimationDragCoefficient();
      double v9 = (float)(v10 * 0.5);
    }
    v11[4] = self;
    v12[0] = MEMORY[0x263EF8330];
    v12[1] = 3221225472;
    v12[2] = __56__FIUIAnimatingTwoLabelView_showSecondaryLabelAnimated___block_invoke;
    v12[3] = &unk_2644A7B18;
    v12[4] = self;
    v11[0] = MEMORY[0x263EF8330];
    v11[1] = 3221225472;
    v11[2] = __56__FIUIAnimatingTwoLabelView_showSecondaryLabelAnimated___block_invoke_2;
    v11[3] = &unk_2644A7B18;
    objc_msgSend(v8, "fiui_animateIfNeededWithDuration:delay:options:animations:completion:", 0x20000, v12, v11, v9, 0.0);
  }
}

uint64_t __56__FIUIAnimatingTwoLabelView_showSecondaryLabelAnimated___block_invoke(uint64_t a1)
{
  v2 = *(void **)(a1 + 32);
  uint64_t v3 = (void *)v2[53];
  [v2 bounds];
  objc_msgSend(v3, "setFrame:");
  [*(id *)(*(void *)(a1 + 32) + 424) setAlpha:1.0];
  uint64_t v4 = *(void **)(a1 + 32);
  uint64_t v5 = (void *)v4[52];
  [v4 _frameBelowBounds];
  objc_msgSend(v5, "setFrame:");
  BOOL v6 = *(void **)(*(void *)(a1 + 32) + 416);
  return [v6 setAlpha:0.2];
}

uint64_t __56__FIUIAnimatingTwoLabelView_showSecondaryLabelAnimated___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) _updateHidden];
}

- (void)_updateHidden
{
  secondaryLabel = self->_secondaryLabel;
  if (self->_visibleLabel == secondaryLabel) {
    secondaryLabel = self->_mainLabel;
  }
  uint64_t v4 = secondaryLabel;
  [(UILabel *)v4 setHidden:1];
  [(UILabel *)self->_visibleLabel setHidden:0];
}

- (void)applyFont:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(FIUIAnimatingTwoLabelView *)self mainLabel];
  [v5 setFont:v4];

  id v6 = [(FIUIAnimatingTwoLabelView *)self secondaryLabel];
  [v6 setFont:v4];
}

- (UILabel)mainLabel
{
  return self->_mainLabel;
}

- (void)setMainLabel:(id)a3
{
}

- (UILabel)secondaryLabel
{
  return self->_secondaryLabel;
}

- (void)setSecondaryLabel:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_secondaryLabel, 0);
  objc_storeStrong((id *)&self->_mainLabel, 0);
  objc_storeStrong((id *)&self->_visibleLabel, 0);
}

@end