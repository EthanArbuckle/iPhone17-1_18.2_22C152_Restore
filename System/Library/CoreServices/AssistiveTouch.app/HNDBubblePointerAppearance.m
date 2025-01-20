@interface HNDBubblePointerAppearance
- (BOOL)shouldShowInnerCircle;
- (HNDBubblePointerAppearance)init;
- (void)setShouldShowInnerCircle:(BOOL)a3;
@end

@implementation HNDBubblePointerAppearance

- (HNDBubblePointerAppearance)init
{
  v4.receiver = self;
  v4.super_class = (Class)HNDBubblePointerAppearance;
  v2 = [(HNDBubblePointerAppearance *)&v4 init];
  [(HNDBubblePointerAppearance *)v2 setShouldShowInnerCircle:0];
  return v2;
}

- (BOOL)shouldShowInnerCircle
{
  return self->_shouldShowInnerCircle;
}

- (void)setShouldShowInnerCircle:(BOOL)a3
{
  self->_shouldShowInnerCircle = a3;
}

@end