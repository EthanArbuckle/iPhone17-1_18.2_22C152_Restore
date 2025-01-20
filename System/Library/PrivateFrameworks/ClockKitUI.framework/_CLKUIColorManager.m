@interface _CLKUIColorManager
- (BOOL)shouldAnimatePropertyWithKey:(id)a3;
- (CALayer)layer;
- (UIColor)color;
- (UIColor)contentColor;
- (void)_updateFilterColor;
- (void)setColor:(id)a3;
- (void)setLayer:(id)a3;
@end

@implementation _CLKUIColorManager

- (void)setColor:(id)a3
{
  id v5 = a3;
  if ((-[UIColor isEqual:](self->_color, "isEqual:") & 1) == 0)
  {
    objc_storeStrong((id *)&self->_color, a3);
    [(_CLKUIColorManager *)self _updateFilterColor];
  }
}

- (void)_updateFilterColor
{
  layer = self->_layer;
  v3 = [(UIColor *)self->_color CGColor];
  [(CALayer *)layer setContentsMultiplyColor:v3];
}

- (BOOL)shouldAnimatePropertyWithKey:(id)a3
{
  return [a3 isEqualToString:@"contentsMultiplyColor"];
}

- (UIColor)contentColor
{
  return (UIColor *)[MEMORY[0x1E4FB1618] whiteColor];
}

- (CALayer)layer
{
  return self->_layer;
}

- (void)setLayer:(id)a3
{
}

- (UIColor)color
{
  return self->_color;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_color, 0);
  objc_storeStrong((id *)&self->_layer, 0);
}

@end