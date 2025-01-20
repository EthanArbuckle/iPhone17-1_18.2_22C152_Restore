@interface CNVisualIdentityAvatarContainerView
- (CGSize)sizeThatFits:(CGSize)a3;
- (CNVisualIdentityAvatarContainerViewDelegate)delegate;
- (void)setDelegate:(id)a3;
@end

@implementation CNVisualIdentityAvatarContainerView

- (void).cxx_destruct
{
}

- (void)setDelegate:(id)a3
{
}

- (CNVisualIdentityAvatarContainerViewDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (CNVisualIdentityAvatarContainerViewDelegate *)WeakRetained;
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double height = a3.height;
  double width = a3.width;
  v5 = [(CNVisualIdentityAvatarContainerView *)self delegate];
  objc_msgSend(v5, "estimatedSizeThatFits:", width, height);
  double v7 = v6;
  double v9 = v8;

  double v10 = v7;
  double v11 = v9;
  result.double height = v11;
  result.double width = v10;
  return result;
}

@end