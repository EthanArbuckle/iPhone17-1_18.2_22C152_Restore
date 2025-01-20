@interface SSSOccludingCoveringView
- (SSSOccludingCoveringView)initWithFrame:(CGRect)a3;
- (void)layoutSubviews;
@end

@implementation SSSOccludingCoveringView

- (SSSOccludingCoveringView)initWithFrame:(CGRect)a3
{
  v7.receiver = self;
  v7.super_class = (Class)SSSOccludingCoveringView;
  v3 = -[SSSOccludingCoveringView initWithFrame:](&v7, "initWithFrame:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  uint64_t v4 = objc_opt_new();
  backgroundColorView = v3->_backgroundColorView;
  v3->_backgroundColorView = (UIView *)v4;

  [(SSSOccludingCoveringView *)v3 addSubview:v3->_backgroundColorView];
  return v3;
}

- (void)layoutSubviews
{
  [(SSSOccludingCoveringView *)self bounds];
  -[UIView setFrame:](self->_backgroundColorView, "setFrame:");
  id v3 = +[UIColor colorWithWhite:0.0 alpha:0.56];
  [(UIView *)self->_backgroundColorView setBackgroundColor:v3];
}

- (void).cxx_destruct
{
}

@end