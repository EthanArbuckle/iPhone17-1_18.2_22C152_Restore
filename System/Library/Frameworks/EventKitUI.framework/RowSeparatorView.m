@interface RowSeparatorView
- (BOOL)vibrant;
- (void)setVibrant:(BOOL)a3;
- (void)tintColorDidChange;
@end

@implementation RowSeparatorView

- (void)tintColorDidChange
{
  if ([(RowSeparatorView *)self vibrant])
  {
    id v3 = [(RowSeparatorView *)self tintColor];
    [(RowSeparatorView *)self setBackgroundColor:v3];
  }
}

- (BOOL)vibrant
{
  return self->_vibrant;
}

- (void)setVibrant:(BOOL)a3
{
  self->_vibrant = a3;
}

@end