@interface _FCUIActivityControlBackgroundView
- (BOOL)isHighlighted;
- (_FCUIActivityControlBackgroundView)initWithControlStyle:(int64_t)a3;
- (_FCUIActivityControlBackgroundView)initWithFrame:(CGRect)a3;
- (void)_configureHighlightViewIfNecessary;
- (void)_setContinuousCornerRadius:(double)a3;
- (void)_setCornerRadius:(double)a3;
- (void)setHighlighted:(BOOL)a3;
@end

@implementation _FCUIActivityControlBackgroundView

- (_FCUIActivityControlBackgroundView)initWithControlStyle:(int64_t)a3
{
  v5.receiver = self;
  v5.super_class = (Class)_FCUIActivityControlBackgroundView;
  result = [(_FCUIActivityControlBackgroundView *)&v5 init];
  if (result) {
    result->_controlStyle = a3;
  }
  return result;
}

- (_FCUIActivityControlBackgroundView)initWithFrame:(CGRect)a3
{
  v6.receiver = self;
  v6.super_class = (Class)_FCUIActivityControlBackgroundView;
  v3 = -[_FCUIActivityControlBackgroundView initWithFrame:](&v6, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    v4 = [MEMORY[0x263F825C8] tertiarySystemFillColor];
    [(_FCUIActivityControlBackgroundView *)v3 setBackgroundColor:v4];

    [(_FCUIActivityControlBackgroundView *)v3 setAutoresizesSubviews:1];
    [(_FCUIActivityControlBackgroundView *)v3 setUserInteractionEnabled:0];
  }
  return v3;
}

- (void)_setContinuousCornerRadius:(double)a3
{
  v5.receiver = self;
  v5.super_class = (Class)_FCUIActivityControlBackgroundView;
  -[_FCUIActivityControlBackgroundView _setContinuousCornerRadius:](&v5, sel__setContinuousCornerRadius_);
  [(UIView *)self->_highlightView _setContinuousCornerRadius:a3];
}

- (void)_setCornerRadius:(double)a3
{
  v5.receiver = self;
  v5.super_class = (Class)_FCUIActivityControlBackgroundView;
  -[_FCUIActivityControlBackgroundView _setCornerRadius:](&v5, sel__setCornerRadius_);
  [(UIView *)self->_highlightView _setCornerRadius:a3];
}

- (void)setHighlighted:(BOOL)a3
{
  if (self->_highlighted != a3)
  {
    self->_highlighted = a3;
    if (a3)
    {
      [(_FCUIActivityControlBackgroundView *)self _configureHighlightViewIfNecessary];
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
    v2[0] = MEMORY[0x263EF8330];
    v2[1] = 3221225472;
    v2[2] = __72___FCUIActivityControlBackgroundView__configureHighlightViewIfNecessary__block_invoke;
    v2[3] = &unk_264542B68;
    v2[4] = self;
    [MEMORY[0x263F82E00] performWithoutAnimation:v2];
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