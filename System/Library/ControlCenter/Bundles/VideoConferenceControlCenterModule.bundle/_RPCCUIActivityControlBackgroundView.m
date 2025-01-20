@interface _RPCCUIActivityControlBackgroundView
- (BOOL)isHighlighted;
- (_RPCCUIActivityControlBackgroundView)initWithControlStyle:(int64_t)a3;
- (_RPCCUIActivityControlBackgroundView)initWithFrame:(CGRect)a3;
- (void)_configureHighlightViewIfNecessary;
- (void)_setContinuousCornerRadius:(double)a3;
- (void)_setCornerRadius:(double)a3;
- (void)setHighlighted:(BOOL)a3;
@end

@implementation _RPCCUIActivityControlBackgroundView

- (_RPCCUIActivityControlBackgroundView)initWithControlStyle:(int64_t)a3
{
  v5.receiver = self;
  v5.super_class = (Class)_RPCCUIActivityControlBackgroundView;
  result = [(_RPCCUIActivityControlBackgroundView *)&v5 init];
  if (result) {
    result->_controlStyle = a3;
  }
  return result;
}

- (_RPCCUIActivityControlBackgroundView)initWithFrame:(CGRect)a3
{
  v6.receiver = self;
  v6.super_class = (Class)_RPCCUIActivityControlBackgroundView;
  v3 = -[_RPCCUIActivityControlBackgroundView initWithFrame:](&v6, "initWithFrame:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    v4 = +[UIColor tertiarySystemFillColor];
    [(_RPCCUIActivityControlBackgroundView *)v3 setBackgroundColor:v4];

    [(_RPCCUIActivityControlBackgroundView *)v3 setAutoresizesSubviews:1];
    [(_RPCCUIActivityControlBackgroundView *)v3 setUserInteractionEnabled:0];
  }
  return v3;
}

- (void)_setContinuousCornerRadius:(double)a3
{
  v5.receiver = self;
  v5.super_class = (Class)_RPCCUIActivityControlBackgroundView;
  -[_RPCCUIActivityControlBackgroundView _setContinuousCornerRadius:](&v5, "_setContinuousCornerRadius:");
  [(UIView *)self->_highlightView _setContinuousCornerRadius:a3];
}

- (void)_setCornerRadius:(double)a3
{
  v5.receiver = self;
  v5.super_class = (Class)_RPCCUIActivityControlBackgroundView;
  -[_RPCCUIActivityControlBackgroundView _setCornerRadius:](&v5, "_setCornerRadius:");
  [(UIView *)self->_highlightView _setCornerRadius:a3];
}

- (void)setHighlighted:(BOOL)a3
{
  if (self->_highlighted != a3)
  {
    self->_highlighted = a3;
    if (a3)
    {
      [(_RPCCUIActivityControlBackgroundView *)self _configureHighlightViewIfNecessary];
      highlightView = self->_highlightView;
      double v5 = 0.1;
      if (self->_controlStyle) {
        double v5 = 1.0;
      }
    }
    else
    {
      highlightView = self->_highlightView;
      double v5 = 0.0;
    }
    [(UIView *)highlightView setAlpha:v5];
  }
}

- (void)_configureHighlightViewIfNecessary
{
  if (!self->_highlightView)
  {
    v2[0] = _NSConcreteStackBlock;
    v2[1] = 3221225472;
    v2[2] = sub_22FD0;
    v2[3] = &unk_68F10;
    v2[4] = self;
    +[UIView performWithoutAnimation:v2];
  }
}

- (BOOL)isHighlighted
{
  return self->_highlighted;
}

- (void).cxx_destruct
{
}

@end