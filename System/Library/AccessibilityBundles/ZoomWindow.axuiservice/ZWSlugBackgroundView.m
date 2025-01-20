@interface ZWSlugBackgroundView
- (BOOL)isAccessibilityElement;
- (ZWSlugBackgroundView)initWithFrame:(CGRect)a3;
- (ZWSlugBackgroundViewDelegate)delegate;
- (id)accessibilityLabel;
- (void)didUpdateFocusInContext:(id)a3 withAnimationCoordinator:(id)a4;
- (void)setDelegate:(id)a3;
@end

@implementation ZWSlugBackgroundView

- (ZWSlugBackgroundView)initWithFrame:(CGRect)a3
{
  v4.receiver = self;
  v4.super_class = (Class)ZWSlugBackgroundView;
  return -[ZWSlugBackgroundView initWithFrame:](&v4, "initWithFrame:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (BOOL)isAccessibilityElement
{
  [(ZWSlugBackgroundView *)self alpha];
  if (v3 <= 0.0) {
    return 0;
  }
  else {
    return [(ZWSlugBackgroundView *)self isHidden] ^ 1;
  }
}

- (id)accessibilityLabel
{
  return ZWLocString(@"ZW_SLUG_LABEL");
}

- (void)didUpdateFocusInContext:(id)a3 withAnimationCoordinator:(id)a4
{
  v5 = [a3 nextFocusedItem];

  if (v5 == self)
  {
    id v6 = [(ZWSlugBackgroundView *)self delegate];
    [v6 slugDidReceiveFocusWithSlugView:self];
  }
}

- (ZWSlugBackgroundViewDelegate)delegate
{
  return self->_delegate;
}

- (void)setDelegate:(id)a3
{
}

- (void).cxx_destruct
{
}

@end