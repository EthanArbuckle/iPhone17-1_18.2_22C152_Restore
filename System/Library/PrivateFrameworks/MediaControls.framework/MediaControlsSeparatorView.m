@interface MediaControlsSeparatorView
- (MTVisualStylingProvider)visualStylingProvider;
- (MediaControlsSeparatorView)initWithFrame:(CGRect)a3;
- (UIView)separatorView;
- (void)layoutSubviews;
- (void)setSeparatorView:(id)a3;
- (void)setVisualStylingProvider:(id)a3;
@end

@implementation MediaControlsSeparatorView

- (MediaControlsSeparatorView)initWithFrame:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  v12.receiver = self;
  v12.super_class = (Class)MediaControlsSeparatorView;
  v7 = -[MediaControlsSeparatorView initWithFrame:](&v12, sel_initWithFrame_);
  if (v7)
  {
    uint64_t v8 = objc_msgSend(objc_alloc(MEMORY[0x1E4FB1EB0]), "initWithFrame:", x, y, width, height);
    separatorView = v7->_separatorView;
    v7->_separatorView = (UIView *)v8;

    v10 = [MEMORY[0x1E4FB1618] labelColor];
    [(UIView *)v7->_separatorView setBackgroundColor:v10];

    [(MediaControlsSeparatorView *)v7 addSubview:v7->_separatorView];
  }
  return v7;
}

- (void)layoutSubviews
{
  v3.receiver = self;
  v3.super_class = (Class)MediaControlsSeparatorView;
  [(MediaControlsSeparatorView *)&v3 layoutSubviews];
  [(MediaControlsSeparatorView *)self bounds];
  -[UIView setFrame:](self->_separatorView, "setFrame:");
}

- (void)setVisualStylingProvider:(id)a3
{
  v5 = (MTVisualStylingProvider *)a3;
  visualStylingProvider = self->_visualStylingProvider;
  if (visualStylingProvider != v5)
  {
    v7 = v5;
    [(MTVisualStylingProvider *)visualStylingProvider stopAutomaticallyUpdatingView:self->_separatorView];
    objc_storeStrong((id *)&self->_visualStylingProvider, a3);
    [(MTVisualStylingProvider *)self->_visualStylingProvider automaticallyUpdateView:self->_separatorView withStyle:5];
    v5 = v7;
  }
}

- (MTVisualStylingProvider)visualStylingProvider
{
  return self->_visualStylingProvider;
}

- (UIView)separatorView
{
  return self->_separatorView;
}

- (void)setSeparatorView:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_separatorView, 0);

  objc_storeStrong((id *)&self->_visualStylingProvider, 0);
}

@end