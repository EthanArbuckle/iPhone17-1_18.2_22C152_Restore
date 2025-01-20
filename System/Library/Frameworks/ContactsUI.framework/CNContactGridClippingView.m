@interface CNContactGridClippingView
- (BOOL)masksToAvatar;
- (CAShapeLayer)actionsMaskLayer;
- (CNAvatarView)avatarView;
- (void)layoutSubviews;
- (void)setActionsMaskLayer:(id)a3;
- (void)setAvatarView:(id)a3;
- (void)setMasksToAvatar:(BOOL)a3;
@end

@implementation CNContactGridClippingView

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_actionsMaskLayer, 0);

  objc_destroyWeak((id *)&self->_avatarView);
}

- (void)setActionsMaskLayer:(id)a3
{
}

- (CAShapeLayer)actionsMaskLayer
{
  return self->_actionsMaskLayer;
}

- (void)setAvatarView:(id)a3
{
}

- (CNAvatarView)avatarView
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_avatarView);

  return (CNAvatarView *)WeakRetained;
}

- (BOOL)masksToAvatar
{
  v2 = [(CNContactGridClippingView *)self actionsMaskLayer];
  BOOL v3 = v2 != 0;

  return v3;
}

- (void)setMasksToAvatar:(BOOL)a3
{
  BOOL v3 = a3;
  if ([(CNContactGridClippingView *)self masksToAvatar] != a3)
  {
    if (v3)
    {
      id v8 = objc_alloc_init(MEMORY[0x1E4F39C88]);
      id v5 = [MEMORY[0x1E4FB1618] blackColor];
      objc_msgSend(v8, "setFillColor:", objc_msgSend(v5, "CGColor"));

      [v8 setFillRule:*MEMORY[0x1E4F39FB8]];
      v6 = [(CNContactGridClippingView *)self layer];
      [v6 setMask:v8];

      [(CNContactGridClippingView *)self setActionsMaskLayer:v8];
    }
    else
    {
      v7 = [(CNContactGridClippingView *)self layer];
      [v7 setMask:0];

      [(CNContactGridClippingView *)self setActionsMaskLayer:0];
    }
  }
}

- (void)layoutSubviews
{
  v26.receiver = self;
  v26.super_class = (Class)CNContactGridClippingView;
  [(CNContactGridClippingView *)&v26 layoutSubviews];
  BOOL v3 = [(CNContactGridClippingView *)self actionsMaskLayer];

  if (v3)
  {
    [(CNContactGridClippingView *)self bounds];
    double v5 = v4;
    double v7 = v6;
    double v9 = v8;
    v10 = [MEMORY[0x1E4FB1BA8] mainScreen];
    [v10 bounds];
    double Width = CGRectGetWidth(v27);

    v12 = [(CNContactGridClippingView *)self avatarView];
    v13 = [(CNContactGridClippingView *)self avatarView];
    [v13 bounds];
    objc_msgSend(v12, "convertRect:toView:", self);
    CGFloat v15 = v14;
    CGFloat v17 = v16;
    CGFloat v19 = v18;
    double v21 = v20;

    v22 = [(CNContactGridClippingView *)self actionsMaskLayer];
    objc_msgSend(v22, "setFrame:", v5, v7, Width, v9);

    Mutable = CGPathCreateMutable();
    v28.origin.x = v15;
    v28.origin.y = v17;
    v28.size.width = v19;
    v28.size.height = v21;
    CGFloat MidY = CGRectGetMidY(v28);
    CGPathAddArc(Mutable, 0, 0.0, MidY, v21 * 0.5, 0.0, 6.28318531, 1);
    v29.origin.x = v5;
    v29.origin.y = v7;
    v29.size.width = Width;
    v29.size.height = v9;
    CGPathAddRect(Mutable, 0, v29);
    v25 = [(CNContactGridClippingView *)self actionsMaskLayer];
    [v25 setPath:Mutable];

    CFRelease(Mutable);
  }
}

@end