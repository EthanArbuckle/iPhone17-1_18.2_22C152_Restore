@interface CAMMessagesPhotosButton
+ (id)photosButton;
- (UIEdgeInsets)tappableEdgeInsets;
- (id)imageForAccessibilityHUD;
- (int64_t)orientation;
- (void)layoutSubviews;
- (void)setOrientation:(int64_t)a3;
- (void)setOrientation:(int64_t)a3 animated:(BOOL)a4;
- (void)setTappableEdgeInsets:(UIEdgeInsets)a3;
@end

@implementation CAMMessagesPhotosButton

+ (id)photosButton
{
  v8.receiver = a1;
  v8.super_class = (Class)&OBJC_METACLASS___CAMMessagesPhotosButton;
  v2 = objc_msgSendSuper2(&v8, sel_buttonWithType_, 1);
  v3 = [MEMORY[0x263F825C8] whiteColor];
  [v2 setTintColor:v3];

  v4 = (void *)MEMORY[0x263F827E8];
  v5 = CAMCameraUIFrameworkBundle();
  v6 = [v4 imageNamed:@"CAMMessagesPhotosButton" inBundle:v5];
  [v2 setImage:v6 forState:0];

  [v2 setOrientation:1];
  return v2;
}

- (void)layoutSubviews
{
  v10.receiver = self;
  v10.super_class = (Class)CAMMessagesPhotosButton;
  [(CAMMessagesPhotosButton *)&v10 layoutSubviews];
  v3 = [(CAMMessagesPhotosButton *)self imageView];
  [(CAMMessagesPhotosButton *)self bounds];
  -[CAMMessagesPhotosButton alignmentRectForFrame:](self, "alignmentRectForFrame:");
  double v4 = *MEMORY[0x263F001A8];
  double v5 = *(double *)(MEMORY[0x263F001A8] + 8);
  [v3 intrinsicContentSize];
  double v7 = v6;
  double v9 = v8;
  UIRectGetCenter();
  objc_msgSend(v3, "setCenter:");
  objc_msgSend(v3, "setBounds:", v4, v5, v7, v9);
}

- (void)setTappableEdgeInsets:(UIEdgeInsets)a3
{
  if (a3.left != self->_tappableEdgeInsets.left
    || a3.top != self->_tappableEdgeInsets.top
    || a3.right != self->_tappableEdgeInsets.right
    || a3.bottom != self->_tappableEdgeInsets.bottom)
  {
    self->_tappableEdgeInsets = a3;
    -[CAMMessagesPhotosButton setContentEdgeInsets:](self, "setContentEdgeInsets:");
    [(CAMMessagesPhotosButton *)self setNeedsLayout];
  }
}

- (void)setOrientation:(int64_t)a3
{
}

- (void)setOrientation:(int64_t)a3 animated:(BOOL)a4
{
  if (self->_orientation != a3)
  {
    BOOL v4 = a4;
    self->_orientation = a3;
    id v6 = [(CAMMessagesPhotosButton *)self imageView];
    +[CAMView rotateView:v6 toInterfaceOrientation:a3 animated:v4];
  }
}

- (id)imageForAccessibilityHUD
{
  v2 = (void *)MEMORY[0x263F827E8];
  v3 = CAMCameraUIFrameworkBundle();
  BOOL v4 = [v2 imageNamed:@"CAMMessagesPhotosButton" inBundle:v3];
  double v5 = [v4 imageWithRenderingMode:1];

  return v5;
}

- (UIEdgeInsets)tappableEdgeInsets
{
  double top = self->_tappableEdgeInsets.top;
  double left = self->_tappableEdgeInsets.left;
  double bottom = self->_tappableEdgeInsets.bottom;
  double right = self->_tappableEdgeInsets.right;
  result.double right = right;
  result.double bottom = bottom;
  result.double left = left;
  result.double top = top;
  return result;
}

- (int64_t)orientation
{
  return self->_orientation;
}

@end