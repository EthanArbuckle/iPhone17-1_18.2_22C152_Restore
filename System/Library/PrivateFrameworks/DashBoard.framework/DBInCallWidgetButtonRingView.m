@interface DBInCallWidgetButtonRingView
- (BOOL)isFocusRingVisible;
- (BOOL)isHighlighted;
- (BOOL)isSelected;
- (UIColor)fillColor;
- (void)drawRect:(CGRect)a3;
- (void)setFillColor:(id)a3;
- (void)setFocusRingVisible:(BOOL)a3;
- (void)setHighlighted:(BOOL)a3;
- (void)setSelected:(BOOL)a3;
@end

@implementation DBInCallWidgetButtonRingView

- (void)setFillColor:(id)a3
{
  objc_storeStrong((id *)&self->_fillColor, a3);
  [(DBInCallWidgetButtonRingView *)self setNeedsDisplay];
}

- (void)setFocusRingVisible:(BOOL)a3
{
  self->_focusRingVisible = a3;
  [(DBInCallWidgetButtonRingView *)self setNeedsDisplay];
}

- (void)setHighlighted:(BOOL)a3
{
  self->_highlighted = a3;
  [(DBInCallWidgetButtonRingView *)self setNeedsDisplay];
}

- (void)setSelected:(BOOL)a3
{
  self->_selected = a3;
  [(DBInCallWidgetButtonRingView *)self setNeedsDisplay];
}

- (void)drawRect:(CGRect)a3
{
  CurrentContext = UIGraphicsGetCurrentContext();
  [(DBInCallWidgetButtonRingView *)self bounds];
  CGFloat x = v22.origin.x;
  CGFloat y = v22.origin.y;
  CGFloat width = v22.size.width;
  CGFloat height = v22.size.height;
  CGRect v23 = CGRectInset(v22, 4.0, 4.0);
  CGFloat v9 = v23.origin.x;
  CGFloat v10 = v23.origin.y;
  CGFloat v11 = v23.size.width;
  CGFloat v12 = v23.size.height;
  id v20 = [(DBInCallWidgetButtonRingView *)self fillColor];
  if ([(DBInCallWidgetButtonRingView *)self isSelected])
  {
    uint64_t v13 = [MEMORY[0x263F825C8] _carSystemPrimaryColor];

    id v20 = (id)v13;
  }
  if ([(DBInCallWidgetButtonRingView *)self isHighlighted])
  {
    v14 = [v20 colorWithAlphaComponent:0.5];
    [v14 setFill];
  }
  else
  {
    [v20 setFill];
  }
  if ([(DBInCallWidgetButtonRingView *)self isFocusRingVisible])
  {
    v24.origin.CGFloat x = x;
    v24.origin.CGFloat y = y;
    v24.size.CGFloat width = width;
    v24.size.CGFloat height = height;
    CGRect v25 = CGRectInset(v24, 1.0, 1.0);
    CGFloat v15 = v25.origin.x;
    CGFloat v16 = v25.origin.y;
    CGFloat v17 = v25.size.width;
    CGFloat v18 = v25.size.height;
    v19 = [MEMORY[0x263F825C8] _carSystemFocusColor];
    [v19 setStroke];

    CGContextSetLineWidth(CurrentContext, 2.0);
    v26.origin.CGFloat x = v15;
    v26.origin.CGFloat y = v16;
    v26.size.CGFloat width = v17;
    v26.size.CGFloat height = v18;
    CGContextStrokeEllipseInRect(CurrentContext, v26);
  }
  v27.origin.CGFloat x = v9;
  v27.origin.CGFloat y = v10;
  v27.size.CGFloat width = v11;
  v27.size.CGFloat height = v12;
  CGContextFillEllipseInRect(CurrentContext, v27);
}

- (UIColor)fillColor
{
  return self->_fillColor;
}

- (BOOL)isFocusRingVisible
{
  return self->_focusRingVisible;
}

- (BOOL)isHighlighted
{
  return self->_highlighted;
}

- (BOOL)isSelected
{
  return self->_selected;
}

- (void).cxx_destruct
{
}

@end