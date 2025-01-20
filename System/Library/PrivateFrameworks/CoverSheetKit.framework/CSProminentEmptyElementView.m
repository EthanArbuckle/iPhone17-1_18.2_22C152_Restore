@interface CSProminentEmptyElementView
- (CSProminentEmptyElementView)initWithContentView:(id)a3;
- (UIView)contentView;
- (void)_layoutContentIfNeeded;
- (void)layoutSubviews;
- (void)setContentView:(id)a3;
@end

@implementation CSProminentEmptyElementView

- (CSProminentEmptyElementView)initWithContentView:(id)a3
{
  v4 = (UIView *)a3;
  v8.receiver = self;
  v8.super_class = (Class)CSProminentEmptyElementView;
  v5 = [(CSProminentEmptyElementView *)&v8 init];
  v6 = v5;
  if (v5)
  {
    v5->_contentView = v4;
    [(CSProminentEmptyElementView *)v5 addSubview:v4];
  }

  return v6;
}

- (void)layoutSubviews
{
  v3.receiver = self;
  v3.super_class = (Class)CSProminentEmptyElementView;
  [(CSProminentEmptyElementView *)&v3 layoutSubviews];
  [(CSProminentEmptyElementView *)self _layoutContentIfNeeded];
}

- (void)_layoutContentIfNeeded
{
  if (self->_contentView)
  {
    [(CSProminentEmptyElementView *)self bounds];
    double v4 = v3;
    double v6 = v5;
    [(UIView *)self->_contentView frame];
    if (v7 >= v4) {
      double v7 = v4;
    }
    if (v8 >= v6) {
      double v8 = v6;
    }
    -[UIView setFrame:](self->_contentView, "setFrame:", (v4 - v7) * 0.5, (v6 - v8) * 0.5);
    [(UIView *)self->_contentView frame];
    if (v10 > v4 || v9 > v6)
    {
      contentView = self->_contentView;
      [(CSProminentEmptyElementView *)self bounds];
      double MidX = CGRectGetMidX(v16);
      [(CSProminentEmptyElementView *)self bounds];
      double MidY = CGRectGetMidY(v17);
      -[UIView setCenter:](contentView, "setCenter:", MidX, MidY);
    }
  }
}

- (UIView)contentView
{
  return self->_contentView;
}

- (void)setContentView:(id)a3
{
  self->_contentView = (UIView *)a3;
}

@end