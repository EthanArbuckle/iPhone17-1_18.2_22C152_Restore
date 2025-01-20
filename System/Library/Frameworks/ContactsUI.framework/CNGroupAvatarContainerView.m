@interface CNGroupAvatarContainerView
- (CGSize)sizeThatFits:(CGSize)a3;
- (CNVisualIdentityAvatarContainerView)underlyingContainerView;
- (void)setUnderlyingContainerView:(id)a3;
@end

@implementation CNGroupAvatarContainerView

- (void).cxx_destruct
{
}

- (void)setUnderlyingContainerView:(id)a3
{
}

- (CNVisualIdentityAvatarContainerView)underlyingContainerView
{
  return self->_underlyingContainerView;
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double height = a3.height;
  double width = a3.width;
  v5 = [(CNGroupAvatarContainerView *)self underlyingContainerView];
  objc_msgSend(v5, "sizeThatFits:", width, height);
  double v7 = v6;
  double v9 = v8;

  double v10 = v7;
  double v11 = v9;
  result.double height = v11;
  result.double width = v10;
  return result;
}

@end