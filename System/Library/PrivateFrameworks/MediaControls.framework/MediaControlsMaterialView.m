@interface MediaControlsMaterialView
- (BOOL)isHighlighted;
- (MediaControlsMaterialView)initWithFrame:(CGRect)a3;
- (id)visualStylingProviderForCategory:(int64_t)a3;
- (void)_setContinuousCornerRadius:(double)a3;
- (void)layoutSubviews;
- (void)setHighlighted:(BOOL)a3;
@end

@implementation MediaControlsMaterialView

- (MediaControlsMaterialView)initWithFrame:(CGRect)a3
{
  v12.receiver = self;
  v12.super_class = (Class)MediaControlsMaterialView;
  v3 = -[MediaControlsMaterialView initWithFrame:](&v12, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    uint64_t v4 = [MEMORY[0x1E4F5AE08] controlCenterDarkMaterial];
    backgroundView = v3->_backgroundView;
    v3->_backgroundView = (UIView *)v4;

    id v6 = objc_alloc(MEMORY[0x1E4FB1EB0]);
    [(MediaControlsMaterialView *)v3 bounds];
    uint64_t v7 = objc_msgSend(v6, "initWithFrame:");
    highlightView = v3->_highlightView;
    v3->_highlightView = (UIView *)v7;

    v9 = v3->_highlightView;
    v10 = [MEMORY[0x1E4FB1618] colorWithWhite:0.0 alpha:0.2];
    [(UIView *)v9 setBackgroundColor:v10];

    [(UIView *)v3->_highlightView setHidden:1];
    [(MediaControlsMaterialView *)v3 addSubview:v3->_backgroundView];
    [(MediaControlsMaterialView *)v3 addSubview:v3->_highlightView];
  }
  return v3;
}

- (void)_setContinuousCornerRadius:(double)a3
{
  -[UIView _setContinuousCornerRadius:](self->_backgroundView, "_setContinuousCornerRadius:");
  highlightView = self->_highlightView;

  [(UIView *)highlightView _setContinuousCornerRadius:a3];
}

- (void)setHighlighted:(BOOL)a3
{
  if (self->_highlighted != a3)
  {
    self->_highlighted = a3;
    [(UIView *)self->_highlightView setHidden:!a3];
  }
}

- (void)layoutSubviews
{
  v11.receiver = self;
  v11.super_class = (Class)MediaControlsMaterialView;
  [(MediaControlsMaterialView *)&v11 layoutSubviews];
  [(MediaControlsMaterialView *)self bounds];
  double v4 = v3;
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  -[UIView setFrame:](self->_highlightView, "setFrame:");
  -[UIView setFrame:](self->_backgroundView, "setFrame:", v4, v6, v8, v10);
}

- (id)visualStylingProviderForCategory:(int64_t)a3
{
  if (objc_opt_respondsToSelector())
  {
    double v5 = [(UIView *)self->_backgroundView visualStylingProviderForCategory:a3];
  }
  else
  {
    double v5 = 0;
  }

  return v5;
}

- (BOOL)isHighlighted
{
  return self->_highlighted;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_highlightView, 0);

  objc_storeStrong((id *)&self->_backgroundView, 0);
}

@end