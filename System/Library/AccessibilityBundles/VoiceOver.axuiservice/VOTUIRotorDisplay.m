@interface VOTUIRotorDisplay
- (VOTUIRotorDisplay)initWithFrame:(CGRect)a3;
- (void)hide;
- (void)resetRotorPosition;
- (void)setRotorItemCount:(int64_t)a3;
- (void)setTitle:(id)a3;
- (void)show;
- (void)updateRotorPosition:(BOOL)a3;
@end

@implementation VOTUIRotorDisplay

- (VOTUIRotorDisplay)initWithFrame:(CGRect)a3
{
  double width = a3.size.width;
  v51.receiver = self;
  v51.super_class = (Class)VOTUIRotorDisplay;
  v4 = -[VOTUIRotorDisplay initWithFrame:](&v51, "initWithFrame:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v5 = [(VOTUIRotorDisplay *)v4 layer];
  [v5 setCornerRadius:10.0];

  v50 = +[UIBlurEffect effectWithStyle:1203];
  v6 = (UIVisualEffectView *)[objc_alloc((Class)UIVisualEffectView) initWithEffect:v50];
  backdropView = v4->_backdropView;
  v4->_backdropView = v6;

  [(VOTUIRotorDisplay *)v4 _setOverrideUserInterfaceStyle:2];
  v8 = [(UIVisualEffectView *)v4->_backdropView layer];
  [v8 setCornerRadius:10.0];

  [(VOTUIRotorDisplay *)v4 addSubview:v4->_backdropView];
  v9 = +[UIColor clearColor];
  [(VOTUIRotorDisplay *)v4 setBackgroundColor:v9];

  [(VOTUIRotorDisplay *)v4 setAlpha:0.0];
  v4->_title1Active = 1;
  id v10 = objc_allocWithZone((Class)UILabel);
  double y = CGRectZero.origin.y;
  double v12 = CGRectZero.size.width;
  double height = CGRectZero.size.height;
  v14 = (UILabel *)objc_msgSend(v10, "initWithFrame:", CGRectZero.origin.x, y, v12, height);
  title1Label = v4->_title1Label;
  v4->_title1Label = v14;

  [(UILabel *)v4->_title1Label setNumberOfLines:0];
  v16 = +[UIFont preferredFontForTextStyle:UIFontTextStyleHeadline];
  [(UILabel *)v4->_title1Label setFont:v16];

  v17 = +[UIColor clearColor];
  [(UILabel *)v4->_title1Label setBackgroundColor:v17];

  v18 = +[UIColor whiteColor];
  [(UILabel *)v4->_title1Label setTextColor:v18];

  [(UILabel *)v4->_title1Label setTextAlignment:1];
  [(UILabel *)v4->_title1Label setLineBreakMode:0];
  [(UILabel *)v4->_title1Label setAdjustsFontForContentSizeCategory:1];
  [(VOTUIRotorDisplay *)v4 addSubview:v4->_title1Label];
  v19 = (UILabel *)objc_msgSend(objc_allocWithZone((Class)UILabel), "initWithFrame:", CGRectZero.origin.x, y, v12, height);
  title2Label = v4->_title2Label;
  v4->_title2Label = v19;

  v21 = +[UIFont preferredFontForTextStyle:UIFontTextStyleHeadline];
  [(UILabel *)v4->_title2Label setFont:v21];

  v22 = +[UIColor clearColor];
  [(UILabel *)v4->_title2Label setBackgroundColor:v22];

  v23 = +[UIColor whiteColor];
  [(UILabel *)v4->_title2Label setTextColor:v23];

  [(UILabel *)v4->_title2Label setTextAlignment:1];
  [(UILabel *)v4->_title2Label setLineBreakMode:0];
  [(UILabel *)v4->_title2Label setAdjustsFontForContentSizeCategory:1];
  [(UILabel *)v4->_title2Label setNumberOfLines:0];
  [(VOTUIRotorDisplay *)v4 addSubview:v4->_title2Label];
  v24 = (VOTUIRotorKnob *)objc_msgSend(objc_allocWithZone((Class)VOTUIRotorKnob), "initWithFrame:", CGRectZero.origin.x, y, v12, height);
  rotorKnob = v4->_rotorKnob;
  v4->_rotorKnob = v24;

  [(VOTUIRotorDisplay *)v4 addSubview:v4->_rotorKnob];
  [(UILabel *)v4->_title1Label setTranslatesAutoresizingMaskIntoConstraints:0];
  [(VOTUIRotorKnob *)v4->_rotorKnob setTranslatesAutoresizingMaskIntoConstraints:0];
  [(UILabel *)v4->_title2Label setTranslatesAutoresizingMaskIntoConstraints:0];
  [(UIVisualEffectView *)v4->_backdropView setTranslatesAutoresizingMaskIntoConstraints:0];
  uint64_t v26 = +[NSLayoutConstraint constraintWithItem:v4->_title1Label attribute:9 relatedBy:0 toItem:v4 attribute:9 multiplier:1.0 constant:0.0];
  title1LabelCenterConstraint = v4->_title1LabelCenterConstraint;
  v4->_title1LabelCenterConstraint = (NSLayoutConstraint *)v26;

  uint64_t v28 = +[NSLayoutConstraint constraintWithItem:v4->_title2Label attribute:9 relatedBy:0 toItem:v4 attribute:9 multiplier:1.0 constant:width * -1.5];
  title2LabelCenterConstraint = v4->_title2LabelCenterConstraint;
  v4->_title2LabelCenterConstraint = (NSLayoutConstraint *)v28;

  uint64_t v30 = +[NSLayoutConstraint constraintWithItem:v4->_rotorKnob attribute:3 relatedBy:0 toItem:v4->_title1Label attribute:11 multiplier:1.0 constant:-5.0];
  rotorKnobPinnedToTitle1Label = v4->_rotorKnobPinnedToTitle1Label;
  v4->_rotorKnobPinnedToTitle1Label = (NSLayoutConstraint *)v30;

  uint64_t v32 = +[NSLayoutConstraint constraintWithItem:v4->_rotorKnob attribute:3 relatedBy:0 toItem:v4->_title2Label attribute:11 multiplier:1.0 constant:-5.0];
  rotorKnobPinnedToTitle2Label = v4->_rotorKnobPinnedToTitle2Label;
  v4->_rotorKnobPinnedToTitle2Label = (NSLayoutConstraint *)v32;

  v49 = +[NSLayoutConstraint constraintWithItem:v4 attribute:7 relatedBy:1 toItem:0 attribute:0 multiplier:1.0 constant:160.0];
  v52[0] = v49;
  v48 = +[NSLayoutConstraint constraintWithItem:v4 attribute:7 relatedBy:-1 toItem:0 attribute:0 multiplier:1.0 constant:240.0];
  v52[1] = v48;
  v47 = +[NSLayoutConstraint constraintWithItem:v4 attribute:4 relatedBy:0 toItem:v4->_rotorKnob attribute:4 multiplier:1.0 constant:5.0];
  v52[2] = v47;
  v46 = +[NSLayoutConstraint constraintWithItem:v4->_backdropView attribute:7 relatedBy:0 toItem:v4 attribute:7 multiplier:1.0 constant:0.0];
  v52[3] = v46;
  v45 = +[NSLayoutConstraint constraintWithItem:v4->_backdropView attribute:8 relatedBy:0 toItem:v4 attribute:8 multiplier:1.0 constant:0.0];
  v52[4] = v45;
  v44 = +[NSLayoutConstraint constraintWithItem:v4->_backdropView attribute:9 relatedBy:0 toItem:v4 attribute:9 multiplier:1.0 constant:0.0];
  v52[5] = v44;
  v34 = +[NSLayoutConstraint constraintWithItem:v4->_backdropView attribute:10 relatedBy:0 toItem:v4 attribute:10 multiplier:1.0 constant:0.0];
  v52[6] = v34;
  v35 = +[NSLayoutConstraint constraintWithItem:v4->_title1Label attribute:7 relatedBy:0 toItem:v4 attribute:7 multiplier:0.9 constant:0.0];
  v52[7] = v35;
  v52[8] = v4->_title1LabelCenterConstraint;
  v36 = +[NSLayoutConstraint constraintWithItem:v4->_title1Label attribute:3 relatedBy:0 toItem:v4 attribute:3 multiplier:1.0 constant:5.0];
  v52[9] = v36;
  v37 = +[NSLayoutConstraint constraintWithItem:v4->_title2Label attribute:7 relatedBy:0 toItem:v4 attribute:7 multiplier:0.9 constant:0.0];
  v52[10] = v37;
  v38 = +[NSLayoutConstraint constraintWithItem:v4->_title2Label attribute:3 relatedBy:0 toItem:v4 attribute:3 multiplier:1.0 constant:5.0];
  v52[11] = v38;
  v52[12] = v4->_title2LabelCenterConstraint;
  v52[13] = v4->_rotorKnobPinnedToTitle1Label;
  v39 = +[NSLayoutConstraint constraintWithItem:v4->_rotorKnob attribute:7 relatedBy:0 toItem:v4 attribute:7 multiplier:0.95 constant:0.0];
  v52[14] = v39;
  v40 = +[NSLayoutConstraint constraintWithItem:v4->_rotorKnob attribute:8 relatedBy:0 toItem:0 attribute:0 multiplier:1.0 constant:140.0];
  v52[15] = v40;
  v41 = +[NSLayoutConstraint constraintWithItem:v4->_rotorKnob attribute:9 relatedBy:0 toItem:v4 attribute:9 multiplier:1.0 constant:0.0];
  v52[16] = v41;
  v42 = +[NSArray arrayWithObjects:v52 count:17];
  +[NSLayoutConstraint activateConstraints:v42];

  [(VOTUIRotorDisplay *)v4 setClipsToBounds:1];
  return v4;
}

- (void)resetRotorPosition
{
}

- (void)setRotorItemCount:(int64_t)a3
{
}

- (void)updateRotorPosition:(BOOL)a3
{
  self->_wasRotorMovementClockwise = a3;
  -[VOTUIRotorKnob updatePosition:](self->_rotorKnob, "updatePosition:");
}

- (void)setTitle:(id)a3
{
  id v4 = a3;
  v5 = [(UILabel *)self->_title1Label text];
  if ([v4 isEqualToString:v5] && self->_title1Active)
  {
  }
  else
  {
    v6 = [(UILabel *)self->_title2Label text];
    if ([v4 isEqualToString:v6])
    {
      BOOL title1Active = self->_title1Active;

      if (!title1Active) {
        goto LABEL_22;
      }
    }
    else
    {
    }
    v8 = VOTLogCommon();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      BOOL v9 = self->_title1Active;
      *(_DWORD *)buf = 67109120;
      BOOL v26 = v9;
      _os_log_impl(&dword_0, v8, OS_LOG_TYPE_INFO, "Title 1 active: %d", buf, 8u);
    }

    BOOL v10 = self->_title1Active;
    BOOL wasRotorMovementClockwise = self->_wasRotorMovementClockwise;
    [(VOTUIRotorDisplay *)self frame];
    double v13 = -v12;
    if (!wasRotorMovementClockwise) {
      double v13 = v12;
    }
    v14 = &OBJC_IVAR___VOTUIRotorDisplay__title2LabelCenterConstraint;
    double v15 = v13 * 1.5;
    if (!v10) {
      v14 = &OBJC_IVAR___VOTUIRotorDisplay__title1LabelCenterConstraint;
    }
    [*(id *)((char *)&self->super.super.super.isa + *v14) setConstant:v15];
    v24[0] = _NSConcreteStackBlock;
    v24[1] = 3221225472;
    v24[2] = sub_E8B0;
    v24[3] = &unk_3D2B0;
    v24[4] = self;
    +[UIView animateWithDuration:v24 animations:0.0];
    [(NSLayoutConstraint *)self->_rotorKnobPinnedToTitle1Label setActive:!self->_title1Active];
    [(NSLayoutConstraint *)self->_rotorKnobPinnedToTitle2Label setActive:self->_title1Active];
    if (self->_title1Active)
    {
      [(NSLayoutConstraint *)self->_title2LabelCenterConstraint setConstant:0.0];
      BOOL v16 = self->_wasRotorMovementClockwise;
      [(VOTUIRotorDisplay *)self frame];
      double v18 = -v17;
      if (v16) {
        double v18 = v17;
      }
      v19 = &OBJC_IVAR___VOTUIRotorDisplay__title1LabelCenterConstraint;
    }
    else
    {
      [(NSLayoutConstraint *)self->_title1LabelCenterConstraint setConstant:0.0];
      BOOL v20 = self->_wasRotorMovementClockwise;
      [(VOTUIRotorDisplay *)self frame];
      double v18 = -v21;
      if (v20) {
        double v18 = v21;
      }
      v19 = &OBJC_IVAR___VOTUIRotorDisplay__title2LabelCenterConstraint;
    }
    [*(id *)((char *)&self->super.super.super.isa + *v19) setConstant:v18 * 1.5];
    v22[0] = _NSConcreteStackBlock;
    v22[1] = 3221225472;
    v22[2] = sub_E8B8;
    v22[3] = &unk_3D418;
    v22[4] = self;
    id v23 = v4;
    +[UIView animateWithDuration:v22 animations:0.400000006];
  }
LABEL_22:
}

- (void)show
{
  [(VOTUIRotorDisplay *)self alpha];
  if (v3 == 0.0)
  {
    [(VOTUIRotorDisplay *)self setAlpha:1.0];
  }
}

- (void)hide
{
  v2[0] = _NSConcreteStackBlock;
  v2[1] = 3221225472;
  v2[2] = sub_EA40;
  v2[3] = &unk_3D2B0;
  v2[4] = self;
  +[UIView animateWithDuration:v2 animations:0.5];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_rotorKnobPinnedToTitle2Label, 0);
  objc_storeStrong((id *)&self->_rotorKnobPinnedToTitle1Label, 0);
  objc_storeStrong((id *)&self->_title2LabelCenterConstraint, 0);
  objc_storeStrong((id *)&self->_title1LabelCenterConstraint, 0);
  objc_storeStrong((id *)&self->_title2Label, 0);
  objc_storeStrong((id *)&self->_title1Label, 0);
  objc_storeStrong((id *)&self->_fadeTimer, 0);
  objc_storeStrong((id *)&self->_rotorKnob, 0);

  objc_storeStrong((id *)&self->_backdropView, 0);
}

@end