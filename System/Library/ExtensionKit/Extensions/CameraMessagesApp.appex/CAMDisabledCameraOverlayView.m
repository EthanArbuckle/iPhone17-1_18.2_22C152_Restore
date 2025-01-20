@interface CAMDisabledCameraOverlayView
- (CAMDisabledCameraOverlayView)initWithFrame:(CGRect)a3;
- (UIButton)doneButton;
- (UILabel)_messageLabel;
- (void)_updateFonts;
- (void)layoutSubviews;
- (void)traitCollectionDidChange:(id)a3;
@end

@implementation CAMDisabledCameraOverlayView

- (CAMDisabledCameraOverlayView)initWithFrame:(CGRect)a3
{
  v18.receiver = self;
  v18.super_class = (Class)CAMDisabledCameraOverlayView;
  v3 = -[CAMDisabledCameraOverlayView initWithFrame:](&v18, "initWithFrame:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    v4 = +[UIColor blackColor];
    [(CAMDisabledCameraOverlayView *)v3 setBackgroundColor:v4];

    [(CAMDisabledCameraOverlayView *)v3 _accessibilitySetInterfaceStyleIntent:2];
    v5 = +[NSBundle mainBundle];
    v6 = [v5 localizedStringForKey:@"DONE" value:&stru_100014940 table:@"CameraMessagesApp"];
    v7 = [v5 localizedStringForKey:@"MESSAGES_CAMERA_DISABLED_FOR_MULTITASKING_MESSAGE" value:&stru_100014940 table:@"CameraMessagesApp"];
    uint64_t v8 = +[UIButton buttonWithType:1];
    doneButton = v3->_doneButton;
    v3->_doneButton = (UIButton *)v8;

    [(UIButton *)v3->_doneButton setTitle:v6 forState:0];
    v10 = +[UIColor systemYellowColor];
    [(UIButton *)v3->_doneButton setTintColor:v10];

    v11 = +[UIFont boldSystemFontOfSize:17.0];
    v12 = [(UIButton *)v3->_doneButton titleLabel];
    [v12 setFont:v11];

    [(CAMDisabledCameraOverlayView *)v3 addSubview:v3->_doneButton];
    v13 = (UILabel *)objc_msgSend(objc_alloc((Class)UILabel), "initWithFrame:", CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height);
    messageLabel = v3->__messageLabel;
    v3->__messageLabel = v13;

    v15 = +[UIColor whiteColor];
    [(UILabel *)v3->__messageLabel setTextColor:v15];

    [(UILabel *)v3->__messageLabel setTextAlignment:1];
    [(UILabel *)v3->__messageLabel setNumberOfLines:0];
    [(UILabel *)v3->__messageLabel setText:v7];
    [(CAMDisabledCameraOverlayView *)v3 addSubview:v3->__messageLabel];
    [(CAMDisabledCameraOverlayView *)v3 _updateFonts];
    v16 = v3;
  }
  return v3;
}

- (void)_updateFonts
{
  id v5 = +[UIFontDescriptor preferredFontDescriptorWithTextStyle:UIFontTextStyleBody addingSymbolicTraits:0 options:3];
  v3 = +[UIFont fontWithDescriptor:v5 size:0.0];
  v4 = [(CAMDisabledCameraOverlayView *)self _messageLabel];
  [v4 setFont:v3];
}

- (void)layoutSubviews
{
  v15.receiver = self;
  v15.super_class = (Class)CAMDisabledCameraOverlayView;
  [(CAMDisabledCameraOverlayView *)&v15 layoutSubviews];
  [(CAMDisabledCameraOverlayView *)self bounds];
  double v4 = v3;
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  v11 = [(CAMDisabledCameraOverlayView *)self doneButton];
  v12 = [(CAMDisabledCameraOverlayView *)self _messageLabel];
  [v11 intrinsicContentSize];
  objc_msgSend(v11, "setFrame:", v8 - v13 + -16.0 + -10.0, 21.0, v13 + 20.0, v14 + 20.0);
  objc_msgSend(v12, "setFrame:", v4 + 15.0, v6 + 0.0, v8 + -30.0, v10);
}

- (void)traitCollectionDidChange:(id)a3
{
  id v6 = [a3 preferredContentSizeCategory];
  double v4 = [(CAMDisabledCameraOverlayView *)self traitCollection];
  id v5 = [v4 preferredContentSizeCategory];

  if (v5 != v6 && ([v5 isEqualToString:v6] & 1) == 0)
  {
    [(CAMDisabledCameraOverlayView *)self _updateFonts];
    [(CAMDisabledCameraOverlayView *)self setNeedsLayout];
  }
}

- (UIButton)doneButton
{
  return self->_doneButton;
}

- (UILabel)_messageLabel
{
  return self->__messageLabel;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->__messageLabel, 0);

  objc_storeStrong((id *)&self->_doneButton, 0);
}

@end