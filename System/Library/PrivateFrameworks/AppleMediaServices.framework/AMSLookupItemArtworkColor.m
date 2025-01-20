@interface AMSLookupItemArtworkColor
- (double)alpha;
- (double)blue;
- (double)green;
- (double)red;
- (void)setAlpha:(double)a3;
- (void)setBlue:(double)a3;
- (void)setGreen:(double)a3;
- (void)setRed:(double)a3;
@end

@implementation AMSLookupItemArtworkColor

- (double)alpha
{
  return self->_alpha;
}

- (void)setAlpha:(double)a3
{
  self->_alpha = a3;
}

- (double)blue
{
  return self->_blue;
}

- (void)setBlue:(double)a3
{
  self->_blue = a3;
}

- (double)green
{
  return self->_green;
}

- (void)setGreen:(double)a3
{
  self->_green = a3;
}

- (double)red
{
  return self->_red;
}

- (void)setRed:(double)a3
{
  self->_red = a3;
}

@end