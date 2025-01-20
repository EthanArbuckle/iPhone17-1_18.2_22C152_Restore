@interface GKGenericRoundButton
- (UIColor)fillColor;
- (UIColor)highlightedFillColor;
- (void)drawRect:(CGRect)a3;
- (void)setFillColor:(id)a3;
- (void)setHighlightedFillColor:(id)a3;
@end

@implementation GKGenericRoundButton

- (void)drawRect:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  if ([(GKGenericRoundButton *)self isHighlighted]) {
    [(GKGenericRoundButton *)self highlightedFillColor];
  }
  else {
  v8 = [(GKGenericRoundButton *)self fillColor];
  }
  if (v8)
  {
    double v9 = (width - height) * 0.5;
    if (width <= height) {
      double v9 = 0.0;
    }
    double v10 = (height - width) * 0.5;
    if (width < height)
    {
      double v11 = width;
    }
    else
    {
      double v10 = 0.0;
      double v11 = height;
    }
    v12 = objc_msgSend(MEMORY[0x1E4FB14C0], "bezierPathWithOvalInRect:", v9, v10, v11, v11);
    [v8 setFill];
    [v12 fill];
  }
  v13.receiver = self;
  v13.super_class = (Class)GKGenericRoundButton;
  -[GKGenericRoundButton drawRect:](&v13, sel_drawRect_, x, y, width, height);
}

- (UIColor)fillColor
{
  return self->_fillColor;
}

- (void)setFillColor:(id)a3
{
}

- (UIColor)highlightedFillColor
{
  return self->_highlightedFillColor;
}

- (void)setHighlightedFillColor:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_highlightedFillColor, 0);

  objc_storeStrong((id *)&self->_fillColor, 0);
}

@end