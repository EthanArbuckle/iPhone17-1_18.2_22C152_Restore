@interface CAMDisabledModeOverlayView
- (CAMDisabledModeOverlayView)initWithFrame:(CGRect)a3;
- (CGRect)_frameForMessageLabel;
- (CGRect)viewportFrame;
- (UILabel)_messageLabel;
- (int64_t)disabledModeReason;
- (int64_t)orientation;
- (void)_updateText;
- (void)layoutSubviews;
- (void)setDisabledModeReason:(int64_t)a3;
- (void)setOrientation:(int64_t)a3;
- (void)setOrientation:(int64_t)a3 animated:(BOOL)a4;
- (void)setViewportFrame:(CGRect)a3;
@end

@implementation CAMDisabledModeOverlayView

- (CAMDisabledModeOverlayView)initWithFrame:(CGRect)a3
{
  v13.receiver = self;
  v13.super_class = (Class)CAMDisabledModeOverlayView;
  v3 = -[CAMDisabledModeOverlayView initWithFrame:](&v13, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    v4 = [MEMORY[0x263F825C8] blackColor];
    [(CAMDisabledModeOverlayView *)v3 setBackgroundColor:v4];

    id v5 = objc_alloc(MEMORY[0x263F828E0]);
    uint64_t v6 = objc_msgSend(v5, "initWithFrame:", *MEMORY[0x263F001A8], *(double *)(MEMORY[0x263F001A8] + 8), *(double *)(MEMORY[0x263F001A8] + 16), *(double *)(MEMORY[0x263F001A8] + 24));
    messageLabel = v3->__messageLabel;
    v3->__messageLabel = (UILabel *)v6;

    [(CAMDisabledModeOverlayView *)v3 addSubview:v3->__messageLabel];
    v8 = v3->__messageLabel;
    v9 = +[CAMFont cameraFontOfSize:17.0];
    [(UILabel *)v8 setFont:v9];

    v10 = v3->__messageLabel;
    v11 = [MEMORY[0x263F825C8] whiteColor];
    [(UILabel *)v10 setTextColor:v11];

    [(UILabel *)v3->__messageLabel setTextAlignment:1];
    [(UILabel *)v3->__messageLabel setNumberOfLines:0];
    [(CAMDisabledModeOverlayView *)v3 _updateText];
  }
  return v3;
}

- (void)setDisabledModeReason:(int64_t)a3
{
  if (self->_disabledModeReason != a3)
  {
    self->_disabledModeReason = a3;
    [(CAMDisabledModeOverlayView *)self _updateText];
  }
}

- (void)_updateText
{
  int64_t v3 = [(CAMDisabledModeOverlayView *)self disabledModeReason];
  if (v3 == 1)
  {
    v4 = NSString;
    id v5 = [MEMORY[0x263F82670] currentDevice];
    uint64_t v6 = [v5 model];
    v7 = [v4 stringWithFormat:@"MODE_DISABLED_CAMERA_TOO_HOT_%@", v6];

    CAMLocalizedFrameworkString(v7, 0);
    id v9 = (id)objc_claimAutoreleasedReturnValue();
  }
  else if (v3)
  {
    id v9 = 0;
  }
  else
  {
    CAMLocalizedFrameworkString(@"MODE_DISABLED_WHILE_ON_CALL", 0);
    id v9 = (id)objc_claimAutoreleasedReturnValue();
  }
  v8 = [(CAMDisabledModeOverlayView *)self _messageLabel];
  [v8 setText:v9];
}

- (void)layoutSubviews
{
  v4.receiver = self;
  v4.super_class = (Class)CAMDisabledModeOverlayView;
  [(CAMDisabledModeOverlayView *)&v4 layoutSubviews];
  int64_t v3 = [(CAMDisabledModeOverlayView *)self _messageLabel];
  [(CAMDisabledModeOverlayView *)self _frameForMessageLabel];
  objc_msgSend(v3, "setFrame:");
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
    id v6 = [(CAMDisabledModeOverlayView *)self _messageLabel];
    +[CAMView rotateView:v6 toInterfaceOrientation:a3 animated:v4];
  }
}

- (CGRect)_frameForMessageLabel
{
  [(CAMDisabledModeOverlayView *)self viewportFrame];
  double v4 = v3 + 15.0;
  double v6 = v5 + 0.0;
  double v8 = v7 + -30.0;
  result.size.height = v2;
  result.size.width = v8;
  result.origin.y = v6;
  result.origin.x = v4;
  return result;
}

- (void)setViewportFrame:(CGRect)a3
{
  CGFloat height = a3.size.height;
  CGFloat width = a3.size.width;
  CGFloat y = a3.origin.y;
  CGFloat x = a3.origin.x;
  p_viewportFrame = &self->_viewportFrame;
  if (!CGRectEqualToRect(self->_viewportFrame, a3))
  {
    p_viewportFrame->origin.CGFloat x = x;
    p_viewportFrame->origin.CGFloat y = y;
    p_viewportFrame->size.CGFloat width = width;
    p_viewportFrame->size.CGFloat height = height;
    [(CAMDisabledModeOverlayView *)self setNeedsLayout];
  }
}

- (int64_t)disabledModeReason
{
  return self->_disabledModeReason;
}

- (int64_t)orientation
{
  return self->_orientation;
}

- (CGRect)viewportFrame
{
  double x = self->_viewportFrame.origin.x;
  double y = self->_viewportFrame.origin.y;
  double width = self->_viewportFrame.size.width;
  double height = self->_viewportFrame.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (UILabel)_messageLabel
{
  return self->__messageLabel;
}

- (void).cxx_destruct
{
}

@end