@interface AVTAdaptativeLayoutView
- (AVTAdaptativeLayout)layout;
- (AVTAdaptativeLayoutView)initWithFrame:(CGRect)a3 contentView:(id)a4;
- (UIView)contentView;
- (void)layoutSubviews;
- (void)setLayout:(id)a3;
@end

@implementation AVTAdaptativeLayoutView

- (AVTAdaptativeLayoutView)initWithFrame:(CGRect)a3 contentView:(id)a4
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  id v10 = a4;
  v16.receiver = self;
  v16.super_class = (Class)AVTAdaptativeLayoutView;
  v11 = -[AVTAdaptativeLayoutView initWithFrame:](&v16, sel_initWithFrame_, x, y, width, height);
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_contentView, a4);
    [(AVTAdaptativeLayoutView *)v12 addSubview:v12->_contentView];
    v13 = objc_alloc_init(_AVTAdaptiveFullSizeLayout);
    layout = v12->_layout;
    v12->_layout = (AVTAdaptativeLayout *)v13;
  }
  return v12;
}

- (void)setLayout:(id)a3
{
  v5 = (AVTAdaptativeLayout *)a3;
  p_layout = &self->_layout;
  if (self->_layout != v5)
  {
    v7 = v5;
    objc_storeStrong((id *)p_layout, a3);
    p_layout = (AVTAdaptativeLayout **)[(AVTAdaptativeLayoutView *)self setNeedsLayout];
    v5 = v7;
  }
  MEMORY[0x270F9A758](p_layout, v5);
}

- (void)layoutSubviews
{
  v3 = [(AVTAdaptativeLayoutView *)self layout];
  [(AVTAdaptativeLayoutView *)self bounds];
  objc_msgSend(v3, "contentViewSizeForSize:", v4, v5);

  [(AVTAdaptativeLayoutView *)self bounds];
  UIRectGetCenter();
  v6 = [(AVTAdaptativeLayoutView *)self window];
  uint64_t v7 = [v6 screen];
  [(id)v7 scale];
  UIRectCenteredAboutPointScale();
  double v9 = v8;
  double v11 = v10;
  double v13 = v12;
  double v15 = v14;

  objc_super v16 = [(AVTAdaptativeLayoutView *)self contentView];
  [v16 frame];
  v24.origin.double x = v17;
  v24.origin.double y = v18;
  v24.size.double width = v19;
  v24.size.double height = v20;
  v23.origin.double x = v9;
  v23.origin.double y = v11;
  v23.size.double width = v13;
  v23.size.double height = v15;
  LOBYTE(v7) = CGRectEqualToRect(v23, v24);

  if ((v7 & 1) == 0)
  {
    id v21 = [(AVTAdaptativeLayoutView *)self contentView];
    objc_msgSend(v21, "setFrame:", v9, v11, v13, v15);
  }
}

- (AVTAdaptativeLayout)layout
{
  return self->_layout;
}

- (UIView)contentView
{
  return self->_contentView;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_contentView, 0);
  objc_storeStrong((id *)&self->_layout, 0);
}

@end