@interface DBColorButton
- (UIColor)carButtonColor;
- (id)_externalUnfocusedBorderColor;
- (void)setCarButtonColor:(id)a3;
@end

@implementation DBColorButton

- (id)_externalUnfocusedBorderColor
{
  v3 = [(DBColorButton *)self carButtonColor];

  if (v3)
  {
    v4 = [(DBColorButton *)self carButtonColor];
  }
  else
  {
    v6.receiver = self;
    v6.super_class = (Class)DBColorButton;
    v4 = [(DBColorButton *)&v6 _externalUnfocusedBorderColor];
  }
  return v4;
}

- (UIColor)carButtonColor
{
  return self->_carButtonColor;
}

- (void)setCarButtonColor:(id)a3
{
}

- (void).cxx_destruct
{
}

@end