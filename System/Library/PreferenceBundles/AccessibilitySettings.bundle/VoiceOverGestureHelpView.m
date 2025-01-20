@interface VoiceOverGestureHelpView
- (VoiceOverGestureHelpView)initWithDelegate:(id)a3;
- (VoiceOverGestureHelpViewController)delegate;
- (void)_accessibilitySetCurrentGesture:(id)a3;
- (void)hide;
- (void)layoutSubviews;
- (void)setDelegate:(id)a3;
- (void)setTitleText:(id)a3 infoText:(id)a4;
- (void)show;
@end

@implementation VoiceOverGestureHelpView

- (VoiceOverGestureHelpView)initWithDelegate:(id)a3
{
  id v4 = a3;
  v41.receiver = self;
  v41.super_class = (Class)VoiceOverGestureHelpView;
  double y = CGRectZero.origin.y;
  double width = CGRectZero.size.width;
  double height = CGRectZero.size.height;
  v8 = -[VoiceOverGestureHelpView initWithFrame:](&v41, "initWithFrame:", CGRectZero.origin.x, y, width, height);
  v9 = v8;
  if (v8)
  {
    [(VoiceOverGestureHelpView *)v8 setDelegate:v4];
    v10 = +[UIColor secondarySystemBackgroundColor];
    [(VoiceOverGestureHelpView *)v9 setBackgroundColor:v10];

    v11 = objc_alloc_init(VOGestureMat);
    [(VOGestureMat *)v11 setTranslatesAutoresizingMaskIntoConstraints:0];
    [(VoiceOverGestureHelpView *)v9 addSubview:v11];
    v37 = [(VOGestureMat *)v11 topAnchor];
    v38 = [(VoiceOverGestureHelpView *)v9 safeAreaLayoutGuide];
    v36 = [v38 topAnchor];
    v35 = [v37 constraintEqualToAnchor:v36];
    v42[0] = v35;
    v34 = [(VOGestureMat *)v11 bottomAnchor];
    v12 = [(VoiceOverGestureHelpView *)v9 bottomAnchor];
    v13 = [v34 constraintEqualToAnchor:v12];
    v42[1] = v13;
    v39 = v11;
    v14 = [(VOGestureMat *)v11 leadingAnchor];
    v15 = [(VoiceOverGestureHelpView *)v9 leadingAnchor];
    v16 = [v14 constraintEqualToAnchor:v15];
    v42[2] = v16;
    v17 = [(VOGestureMat *)v11 trailingAnchor];
    v18 = [(VoiceOverGestureHelpView *)v9 trailingAnchor];
    v19 = [v17 constraintEqualToAnchor:v18];
    v42[3] = v19;
    +[NSArray arrayWithObjects:v42 count:4];
    v20 = id v40 = v4;
    +[NSLayoutConstraint activateConstraints:v20];

    v21 = (UILabel *)objc_msgSend(objc_allocWithZone((Class)UILabel), "initWithFrame:", CGRectZero.origin.x, y, width, height);
    titleLabel = v9->_titleLabel;
    v9->_titleLabel = v21;

    v23 = +[UIFontDescriptor preferredFontDescriptorWithTextStyle:UIFontTextStyleTitle2 addingSymbolicTraits:2 options:0];
    v24 = +[UIFont fontWithDescriptor:v23 size:0.0];
    [(UILabel *)v9->_titleLabel setFont:v24];

    [(UILabel *)v9->_titleLabel setTextAlignment:1];
    [(UILabel *)v9->_titleLabel setLineBreakMode:0];
    [(UILabel *)v9->_titleLabel setNumberOfLines:0];
    v25 = +[UIColor systemGrayColor];
    [(UILabel *)v9->_titleLabel setTextColor:v25];

    [(UILabel *)v9->_titleLabel setIsAccessibilityElement:0];
    v26 = +[UIColor clearColor];
    [(UILabel *)v9->_titleLabel setBackgroundColor:v26];

    [(VOGestureMat *)v39 addSubview:v9->_titleLabel];
    v27 = (UILabel *)objc_msgSend(objc_allocWithZone((Class)UILabel), "initWithFrame:", CGRectZero.origin.x, y, width, height);
    infoLabel = v9->_infoLabel;
    v9->_infoLabel = v27;

    v29 = +[UIFont preferredFontForTextStyle:UIFontTextStyleBody];
    [(UILabel *)v9->_infoLabel setFont:v29];

    [(UILabel *)v9->_infoLabel setNumberOfLines:0];
    [(UILabel *)v9->_infoLabel setTextAlignment:1];
    [(UILabel *)v9->_infoLabel setLineBreakMode:0];
    v30 = +[UIColor systemGrayColor];
    [(UILabel *)v9->_infoLabel setTextColor:v30];

    [(UILabel *)v9->_infoLabel setIsAccessibilityElement:0];
    v31 = +[UIColor clearColor];
    [(UILabel *)v9->_infoLabel setBackgroundColor:v31];

    id v4 = v40;
    [(VOGestureMat *)v39 addSubview:v9->_infoLabel];
    v32 = v9;
  }
  return v9;
}

- (void)layoutSubviews
{
  v22.receiver = self;
  v22.super_class = (Class)VoiceOverGestureHelpView;
  [(VoiceOverGestureHelpView *)&v22 layoutSubviews];
  [(VoiceOverGestureHelpView *)self frame];
  v23.origin.x = 0.0;
  v23.origin.double y = 0.0;
  v23.size.double height = 20.0;
  v23.size.CGFloat width = v4 * 0.9;
  CGFloat width = v23.size.width;
  CGRect v24 = CGRectIntegral(v23);
  -[UILabel setFrame:](self->_titleLabel, "setFrame:", v24.origin.x, v24.origin.y, v24.size.width, v24.size.height);
  v25.size.double height = 65.0;
  v25.origin.x = 0.0;
  v25.origin.double y = 0.0;
  v25.size.CGFloat width = width;
  CGRect v26 = CGRectIntegral(v25);
  -[UILabel setFrame:](self->_infoLabel, "setFrame:", v26.origin.x, v26.origin.y, v26.size.width, v26.size.height);
  [(UILabel *)self->_titleLabel frame];
  CGFloat v6 = v5;
  -[UILabel textRectForBounds:limitedToNumberOfLines:](self->_titleLabel, "textRectForBounds:limitedToNumberOfLines:", 0, 0.0, 0.0);
  double v8 = v7;
  double v10 = v9;
  [(UILabel *)self->_infoLabel frame];
  -[UILabel textRectForBounds:limitedToNumberOfLines:](self->_infoLabel, "textRectForBounds:limitedToNumberOfLines:", 0, 0.0, 0.0);
  double v12 = v11;
  CGFloat v14 = v13;
  double v15 = v10 + v13 + 25.0;
  v16 = [(UILabel *)self->_infoLabel superview];
  [v16 bounds];
  double v18 = v17;
  double v20 = v19;

  CGFloat v21 = (v20 - v15) * 0.5;
  v27.origin.x = v6;
  v27.origin.double y = v21;
  v27.size.CGFloat width = v8;
  v27.size.double height = v10;
  v28.origin.double y = CGRectGetMaxY(v27) + 5.0;
  v28.origin.x = (v18 - v12) * 0.5;
  v28.size.CGFloat width = v12;
  v28.size.double height = v14;
  CGRect v29 = CGRectIntegral(v28);
  -[UILabel setFrame:](self->_infoLabel, "setFrame:", v29.origin.x, v29.origin.y, v29.size.width, v29.size.height);
  v30.origin.x = (v18 - v8) * 0.5;
  v30.origin.double y = v21;
  v30.size.CGFloat width = v8;
  v30.size.double height = v10;
  CGRect v31 = CGRectIntegral(v30);
  -[UILabel setFrame:](self->_titleLabel, "setFrame:", v31.origin.x, v31.origin.y, v31.size.width, v31.size.height);
}

- (void)_accessibilitySetCurrentGesture:(id)a3
{
  id v4 = a3;
  double v5 = (char *)[v4 count];
  if ((uint64_t)v5 < 1)
  {
    double v7 = 0;
    goto LABEL_5;
  }
  CGFloat v6 = v5;
  double v7 = [v4 objectAtIndex:0];
  if (v6 == (unsigned char *)&dword_0 + 1)
  {
LABEL_5:
    double v8 = 0;
    goto LABEL_6;
  }
  double v8 = [v4 objectAtIndex:1];
LABEL_6:
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = __60__VoiceOverGestureHelpView__accessibilitySetCurrentGesture___block_invoke;
  v11[3] = &unk_209510;
  v11[4] = self;
  id v12 = v7;
  id v13 = v8;
  id v9 = v8;
  id v10 = v7;
  +[UIView animateWithDuration:v11 animations:0.0];
}

id __60__VoiceOverGestureHelpView__accessibilitySetCurrentGesture___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) setTitleText:*(void *)(a1 + 40) infoText:*(void *)(a1 + 48)];
}

- (void)setTitleText:(id)a3 infoText:(id)a4
{
  titleLabel = self->_titleLabel;
  id v7 = a4;
  [(UILabel *)titleLabel setText:a3];
  [(UILabel *)self->_infoLabel setText:v7];

  [(VoiceOverGestureHelpView *)self layoutSubviews];
}

- (void)show
{
  v3 = settingsLocString(@"VOICEOVER_GESTURE_HELP_BUTTON_TITLE", @"VoiceOverSettings");
  [(VoiceOverGestureHelpView *)self setTitleText:v3 infoText:&stru_20F6B8];

  UIAccessibilityNotifications v4 = UIAccessibilityScreenChangedNotification;

  UIAccessibilityPostNotification(v4, 0);
}

- (void)hide
{
  [(UILabel *)self->_titleLabel setText:&stru_20F6B8];
  [(UILabel *)self->_infoLabel setText:&stru_20F6B8];
  UIAccessibilityNotifications v3 = UIAccessibilityScreenChangedNotification;

  UIAccessibilityPostNotification(v3, 0);
}

- (VoiceOverGestureHelpViewController)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (VoiceOverGestureHelpViewController *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_infoLabel, 0);

  objc_storeStrong((id *)&self->_titleLabel, 0);
}

@end