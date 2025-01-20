@interface AVTCarouselPlusButtonView
- (AVTCarouselPlusButtonView)initWithFrame:(CGRect)a3 environment:(id)a4;
- (AVTUIEnvironment)environment;
- (BOOL)allowHighlight;
- (BOOL)isHighlighted;
- (CGSize)maxItemSize;
- (UIButton)button;
- (void)layoutSubviews;
- (void)setAllowHighlight:(BOOL)a3;
- (void)setHighlighted:(BOOL)a3;
- (void)setMaxItemSize:(CGSize)a3;
@end

@implementation AVTCarouselPlusButtonView

- (AVTCarouselPlusButtonView)initWithFrame:(CGRect)a3 environment:(id)a4
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  id v10 = a4;
  v17.receiver = self;
  v17.super_class = (Class)AVTCarouselPlusButtonView;
  v11 = -[AVTCarouselPlusButtonView initWithFrame:](&v17, sel_initWithFrame_, x, y, width, height);
  if (v11)
  {
    v12 = [MEMORY[0x263F1C488] buttonWithType:0];
    v13 = AVTPlusButtonImage();
    [(UIButton *)v12 setImage:v13 forState:0];
    [(UIButton *)v12 setUserInteractionEnabled:0];
    button = v11->_button;
    v11->_button = v12;
    v15 = v12;

    objc_storeStrong((id *)&v11->_environment, a4);
    [(AVTCarouselPlusButtonView *)v11 addSubview:v11->_button];
  }
  return v11;
}

- (void)setMaxItemSize:(CGSize)a3
{
  if (a3.width != self->_maxItemSize.width || a3.height != self->_maxItemSize.height)
  {
    self->_maxItemSize = a3;
    [(AVTCarouselPlusButtonView *)self setNeedsLayout];
  }
}

- (void)setHighlighted:(BOOL)a3
{
  BOOL v3 = a3;
  self->_highlighted = a3;
  if ([(AVTCarouselPlusButtonView *)self allowHighlight])
  {
    id v5 = [(AVTCarouselPlusButtonView *)self button];
    [v5 setHighlighted:v3];
  }
}

- (void)setAllowHighlight:(BOOL)a3
{
  BOOL v3 = a3;
  self->_allowHighlight = a3;
  if ([(AVTCarouselPlusButtonView *)self isHighlighted])
  {
    id v5 = [(AVTCarouselPlusButtonView *)self button];
    [v5 setHighlighted:v3];
  }
}

- (void)layoutSubviews
{
  v34.receiver = self;
  v34.super_class = (Class)AVTCarouselPlusButtonView;
  [(AVTCarouselPlusButtonView *)&v34 layoutSubviews];
  [(AVTCarouselPlusButtonView *)self maxItemSize];
  if (v4 != *MEMORY[0x263F001B0] || v3 != *(double *)(MEMORY[0x263F001B0] + 8))
  {
    v6 = [(AVTCarouselPlusButtonView *)self environment];
    int v7 = [v6 deviceIsPad];

    if (v7) {
      double v8 = 100.0;
    }
    else {
      double v8 = 88.0;
    }
    [(AVTCarouselPlusButtonView *)self maxItemSize];
    CGFloat v10 = v8 / v9;
    [(AVTCarouselPlusButtonView *)self maxItemSize];
    CGFloat v12 = v8 / v11;
    [(AVTCarouselPlusButtonView *)self bounds];
    double v14 = v13;
    double v16 = v15;
    CGAffineTransformMakeScale(&v33, v10, v12);
    double v17 = v16 * v33.c + v33.a * v14;
    double v18 = v16 * v33.d + v33.b * v14;
    [(AVTCarouselPlusButtonView *)self bounds];
    UIRectGetCenter();
    double v20 = v19;
    double v22 = v21;
    [(AVTCarouselPlusButtonView *)self bounds];
    double v24 = v23;
    [(AVTCarouselPlusButtonView *)self maxItemSize];
    double v26 = (1.0 - v24 / v25) * 70.0;
    v27 = [(AVTCarouselPlusButtonView *)self environment];
    int v28 = [v27 deviceIsPad];

    double v29 = 0.0;
    if (!v28) {
      double v29 = v26;
    }
    double v30 = v20 + v29;
    v31 = [(AVTCarouselPlusButtonView *)self button];
    objc_msgSend(v31, "setBounds:", *MEMORY[0x263F00148], *(double *)(MEMORY[0x263F00148] + 8), v17, v18);

    v32 = [(AVTCarouselPlusButtonView *)self button];
    objc_msgSend(v32, "setCenter:", v30, v22);
  }
}

- (CGSize)maxItemSize
{
  double width = self->_maxItemSize.width;
  double height = self->_maxItemSize.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (BOOL)isHighlighted
{
  return self->_highlighted;
}

- (BOOL)allowHighlight
{
  return self->_allowHighlight;
}

- (AVTUIEnvironment)environment
{
  return self->_environment;
}

- (UIButton)button
{
  return self->_button;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_button, 0);
  objc_storeStrong((id *)&self->_environment, 0);
}

@end