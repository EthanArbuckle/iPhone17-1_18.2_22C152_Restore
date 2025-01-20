@interface PHCarPlayInCallButton
- (BOOL)toggledOn;
- (CGSize)intrinsicContentSize;
- (NSLayoutConstraint)horizontalPositioningConstraint;
- (PHCarPlayInCallButtonRing)ringView;
- (UIColor)unhighlightedBackgroundColor;
- (UIImageView)specialRingView;
- (UILabel)buttonLabel;
- (id)carPlayInCallImageForSymbolType:(int64_t)a3;
- (id)initForButtonType:(int)a3 callState:(int64_t)a4;
- (int)inCallButtonType;
- (int)specialLayoutType;
- (int64_t)callState;
- (void)didUpdateFocusInContext:(id)a3 withAnimationCoordinator:(id)a4;
- (void)layoutSubviews;
- (void)pressesBegan:(id)a3 withEvent:(id)a4;
- (void)pressesCancelled:(id)a3 withEvent:(id)a4;
- (void)pressesEnded:(id)a3 withEvent:(id)a4;
- (void)setButtonLabel:(id)a3;
- (void)setCallState:(int64_t)a3;
- (void)setEnabled:(BOOL)a3;
- (void)setHasRingView:(BOOL)a3;
- (void)setHighlighted:(BOOL)a3;
- (void)setHorizontalPositioningConstraint:(id)a3;
- (void)setRingView:(id)a3;
- (void)setSelected:(BOOL)a3;
- (void)setSpecialLayoutType:(int)a3;
- (void)setSpecialRingView:(id)a3;
- (void)setToggledOn:(BOOL)a3;
- (void)setUnhighlightedBackgroundColor:(id)a3;
- (void)updateToProperIconColor;
@end

@implementation PHCarPlayInCallButton

- (id)initForButtonType:(int)a3 callState:(int64_t)a4
{
  v98.receiver = self;
  v98.super_class = (Class)PHCarPlayInCallButton;
  v6 = -[PHCarPlayInCallButton initWithFrame:](&v98, "initWithFrame:", 0.0, 0.0, 115.0, 130.0);
  v7 = v6;
  if (!v6) {
    return v7;
  }
  v6->_callState = a4;
  v6->_inCallButtonType = a3;
  [(PHCarPlayInCallButton *)v6 intrinsicContentSize];
  v9 = +[NSLayoutConstraint constraintWithItem:v7 attribute:7 relatedBy:0 toItem:0 attribute:0 multiplier:1.0 constant:v8];
  [(PHCarPlayInCallButton *)v7 addConstraint:v9];

  LODWORD(v10) = 1148846080;
  [(PHCarPlayInCallButton *)v7 setContentCompressionResistancePriority:0 forAxis:v10];
  LODWORD(v11) = 1132068864;
  [(PHCarPlayInCallButton *)v7 setContentHuggingPriority:0 forAxis:v11];
  [(PHCarPlayInCallButton *)v7 setClipsToBounds:0];
  [(PHCarPlayInCallButton *)v7 setSpecialLayoutType:0];
  [(PHCarPlayInCallButton *)v7 setAdjustsImageWhenDisabled:1];
  [(PHCarPlayInCallButton *)v7 setAdjustsImageWhenHighlighted:0];
  id v12 = objc_alloc_init((Class)UILabel);
  [v12 setTranslatesAutoresizingMaskIntoConstraints:0];
  [v12 setTextAlignment:1];
  v13 = +[UIColor dynamicCarPrimaryColor];
  [v12 setTextColor:v13];

  v14 = +[UIColor clearColor];
  [v12 setBackgroundColor:v14];

  [v12 setOpaque:0];
  [v12 setText:&stru_100285990];
  [v12 setLineBreakMode:0];
  [v12 setNumberOfLines:0];
  [v12 setUserInteractionEnabled:0];
  [v12 setAdjustsFontSizeToFitWidth:1];
  [(PHCarPlayInCallButton *)v7 addSubview:v12];
  [(PHCarPlayInCallButton *)v7 setButtonLabel:v12];
  v15 = +[UIColor whiteColor];
  [(PHCarPlayInCallButton *)v7 setTintColor:v15];

  v16 = [(PHCarPlayInCallButton *)v7 buttonLabel];
  LODWORD(v17) = 1132068864;
  [v16 setContentCompressionResistancePriority:0 forAxis:v17];

  if (a3 > 0x12) {
    goto LABEL_7;
  }
  double v18 = 10.0;
  if (((1 << a3) & 0x1E000) != 0)
  {
    double v20 = 0.0;
    double v21 = 20.0;
    uint64_t v19 = 1;
    goto LABEL_8;
  }
  if (((1 << a3) & 0x41C00) == 0)
  {
LABEL_7:
    double v20 = 0.0;
    double v21 = 20.0;
    uint64_t v19 = 1;
    double v18 = 12.0;
    goto LABEL_8;
  }
  uint64_t v19 = 0;
  double v20 = -20.0;
  double v21 = 0.0;
LABEL_8:
  -[PHCarPlayInCallButton setImageEdgeInsets:](v7, "setImageEdgeInsets:", v20, 0.0, v21, 0.0);
  v22 = +[UIFont systemFontOfSize:v18];
  [v12 setFont:v22];

  [(PHCarPlayInCallButton *)v7 setHasRingView:v19];
  switch(a3)
  {
    case 0:
      if (a4 == 1)
      {
        v23 = +[NSBundle mainBundle];
        v24 = +[UIImage phCarPlayImageNamed:@"carplay_incall_button_end_voip" inBundle:v23];
        v25 = [v24 imageWithRenderingMode:2];
      }
      else
      {
        v25 = [(PHCarPlayInCallButton *)v7 carPlayInCallImageForSymbolType:2];
      }
      [(PHCarPlayInCallButton *)v7 setImage:v25 forState:0];
      v69 = +[NSBundle mainBundle];
      v55 = v69;
      CFStringRef v70 = @"CARPLAY_END_BUTTON";
      goto LABEL_51;
    case 1:
      v43 = [(PHCarPlayInCallButton *)v7 carPlayInCallImageForSymbolType:22];
      [(PHCarPlayInCallButton *)v7 setImage:v43 forState:0];

      v27 = +[NSBundle mainBundle];
      v25 = v27;
      CFStringRef v28 = @"CARPLAY_MUTE_BUTTON";
      goto LABEL_34;
    case 2:
      v26 = [(PHCarPlayInCallButton *)v7 carPlayInCallImageForSymbolType:19];
      [(PHCarPlayInCallButton *)v7 setImage:v26 forState:0];

      v27 = +[NSBundle mainBundle];
      v25 = v27;
      CFStringRef v28 = @"CARPLAY_KEYPAD_BUTTON";
      goto LABEL_34;
    case 3:
      v44 = [(PHCarPlayInCallButton *)v7 carPlayInCallImageForSymbolType:17];
      [(PHCarPlayInCallButton *)v7 setImage:v44 forState:0];

      v27 = +[NSBundle mainBundle];
      v25 = v27;
      CFStringRef v28 = @"CARPLAY_ADD_CALL_BUTTON";
      goto LABEL_34;
    case 4:
      if (a4 == 1)
      {
        v29 = +[NSBundle mainBundle];
        v30 = +[UIImage phCarPlayImageNamed:@"carplay_incall_button_decline_glyph_voip" inBundle:v29];
        v25 = [v30 imageWithRenderingMode:2];
      }
      else
      {
        v25 = [(PHCarPlayInCallButton *)v7 carPlayInCallImageForSymbolType:2];
      }
      [(PHCarPlayInCallButton *)v7 setImage:v25 forState:0];
      v69 = +[NSBundle mainBundle];
      v55 = v69;
      CFStringRef v70 = @"CARPLAY_DECLINE_BUTTON";
      goto LABEL_51;
    case 5:
      v45 = [(PHCarPlayInCallButton *)v7 carPlayInCallImageForSymbolType:20];
      [(PHCarPlayInCallButton *)v7 setImage:v45 forState:0];

      v27 = +[NSBundle mainBundle];
      v25 = v27;
      CFStringRef v28 = @"CARPLAY_MERGE_CALLS_BUTTON";
      goto LABEL_34;
    case 6:
      v46 = [(PHCarPlayInCallButton *)v7 carPlayInCallImageForSymbolType:21];
      [(PHCarPlayInCallButton *)v7 setImage:v46 forState:0];

      v27 = +[NSBundle mainBundle];
      v25 = v27;
      CFStringRef v28 = @"CARPLAY_SWAP_BUTTON";
      goto LABEL_34;
    case 7:
      v47 = +[NSBundle mainBundle];
      v48 = +[UIImage phCarPlayImageNamed:@"carplay_incall_button_split" inBundle:v47];
      [(PHCarPlayInCallButton *)v7 setImage:v48 forState:0];

      v27 = +[NSBundle mainBundle];
      v25 = v27;
      CFStringRef v28 = @"CARPLAY_SPLIT_BUTTON";
      goto LABEL_34;
    case 8:
      if (a4 == 1)
      {
        v49 = +[NSBundle mainBundle];
        v50 = +[UIImage phCarPlayImageNamed:@"carplay_incall_button_answer_glyph_voip" inBundle:v49];
        v25 = [v50 imageWithRenderingMode:2];
      }
      else
      {
        v25 = [(PHCarPlayInCallButton *)v7 carPlayInCallImageForSymbolType:1];
      }
      [(PHCarPlayInCallButton *)v7 setImage:v25 forState:0];
      v69 = +[NSBundle mainBundle];
      v55 = v69;
      CFStringRef v70 = @"CARPLAY_ANSWER_BUTTON";
      goto LABEL_51;
    case 9:
      v31 = [(PHCarPlayInCallButton *)v7 carPlayInCallImageForSymbolType:14];
      [(PHCarPlayInCallButton *)v7 setImage:v31 forState:0];

      v27 = +[NSBundle mainBundle];
      v25 = v27;
      CFStringRef v28 = @"CARPLAY_DECLINE_WITH_MESSAGE";
      goto LABEL_34;
    case 10:
      if ((unint64_t)(a4 - 1) > 3) {
        v51 = 0;
      }
      else {
        v51 = off_10027E068[a4 - 1];
      }
      v25 = +[NSString stringWithFormat:@"%@_selected", v51];
      v83 = +[NSBundle mainBundle];
      v84 = +[UIImage phCarPlayImageNamed:v51 inBundle:v83];
      [(PHCarPlayInCallButton *)v7 setImage:v84 forState:0];

      v85 = +[NSBundle mainBundle];
      v86 = +[UIImage phCarPlayImageNamed:v25 inBundle:v85];
      [(PHCarPlayInCallButton *)v7 setImage:v86 forState:8];

      v87 = +[NSBundle mainBundle];
      v88 = +[UIImage phCarPlayImageNamed:v25 inBundle:v87];
      [(PHCarPlayInCallButton *)v7 setImage:v88 forState:4];

      v69 = +[NSBundle mainBundle];
      v55 = v69;
      CFStringRef v70 = @"CARPLAY_END_CALL_AND_ANSWER_BUTTON";
      goto LABEL_51;
    case 11:
      if ((unint64_t)(a4 - 1) > 3) {
        v32 = 0;
      }
      else {
        v32 = off_10027E088[a4 - 1];
      }
      v25 = +[NSString stringWithFormat:@"%@_selected", v32];
      v71 = +[NSBundle mainBundle];
      v72 = +[UIImage phCarPlayImageNamed:v32 inBundle:v71];
      [(PHCarPlayInCallButton *)v7 setImage:v72 forState:0];

      v73 = +[NSBundle mainBundle];
      v74 = +[UIImage phCarPlayImageNamed:v25 inBundle:v73];
      [(PHCarPlayInCallButton *)v7 setImage:v74 forState:8];

      v75 = +[NSBundle mainBundle];
      v76 = +[UIImage phCarPlayImageNamed:v25 inBundle:v75];
      [(PHCarPlayInCallButton *)v7 setImage:v76 forState:4];

      v69 = +[NSBundle mainBundle];
      v55 = v69;
      CFStringRef v70 = @"CARPLAY_HOLD_CALL_AND_ANSWER_BUTTON";
      goto LABEL_51;
    case 12:
      if ((unint64_t)(a4 - 1) > 3) {
        v33 = 0;
      }
      else {
        v33 = off_10027E0A8[a4 - 1];
      }
      v25 = +[NSString stringWithFormat:@"%@_selected", v33];
      v77 = +[NSBundle mainBundle];
      v78 = +[UIImage phCarPlayImageNamed:v33 inBundle:v77];
      [(PHCarPlayInCallButton *)v7 setImage:v78 forState:0];

      v79 = +[NSBundle mainBundle];
      v80 = +[UIImage phCarPlayImageNamed:v25 inBundle:v79];
      [(PHCarPlayInCallButton *)v7 setImage:v80 forState:8];

      v81 = +[NSBundle mainBundle];
      v82 = +[UIImage phCarPlayImageNamed:v25 inBundle:v81];
      [(PHCarPlayInCallButton *)v7 setImage:v82 forState:4];

      v69 = +[NSBundle mainBundle];
      v55 = v69;
      CFStringRef v70 = @"CARPLAY_END_HOLD_CALL_AND_ANSWER_BUTTON";
      goto LABEL_51;
    case 13:
      switch(a4)
      {
        case 1:
        case 3:
          v52 = +[NSBundle mainBundle];
          v53 = +[UIImage phCarPlayImageNamed:@"carplay_incall_button_decline_glyph_voip" inBundle:v52];
          v25 = [v53 imageWithRenderingMode:2];

          break;
        case 2:
        case 4:
          v25 = [(PHCarPlayInCallButton *)v7 carPlayInCallImageForSymbolType:2];
          break;
        default:
          v25 = 0;
          break;
      }
      v89 = +[UIColor whiteColor];
      v90 = [v25 _flatImageWithColor:v89];
      [(PHCarPlayInCallButton *)v7 setImage:v90 forState:0];

      v69 = +[NSBundle mainBundle];
      v55 = v69;
      CFStringRef v70 = @"CARPLAY_IGNORE_BUTTON";
LABEL_51:
      v56 = [v69 localizedStringForKey:v70 value:&stru_100285990 table:@"PHCarPlay"];
      v91 = [(PHCarPlayInCallButton *)v7 buttonLabel];
      [v91 setText:v56];

      goto LABEL_52;
    case 14:
      v34 = [(PHCarPlayInCallButton *)v7 carPlayInCallImageForSymbolType:1];
      [(PHCarPlayInCallButton *)v7 setImage:v34 forState:0];

      v27 = +[NSBundle mainBundle];
      v25 = v27;
      CFStringRef v28 = @"CARPLAY_CALL_BACK_BUTTON";
      goto LABEL_34;
    case 15:
      v35 = +[NSBundle mainBundle];
      v36 = +[UIImage phCarPlayImageNamed:@"carplay_incall_button_decline" inBundle:v35];
      v37 = +[UIColor whiteColor];
      v38 = [v36 _flatImageWithColor:v37];
      [(PHCarPlayInCallButton *)v7 setImage:v38 forState:0];

      v27 = +[NSBundle mainBundle];
      v25 = v27;
      CFStringRef v28 = @"CARPLAY_CANCEL_BUTTON";
      goto LABEL_34;
    case 16:
      v39 = +[NSBundle mainBundle];
      v40 = +[UIImage phCarPlayImageNamed:@"carplay_incall_button_decline_to_voicemail" inBundle:v39];
      v41 = +[UIColor externalSystemRedColor];
      v42 = [v40 _flatImageWithColor:v41];
      [(PHCarPlayInCallButton *)v7 setImage:v42 forState:0];

      v27 = +[NSBundle mainBundle];
      v25 = v27;
      CFStringRef v28 = @"CARPLAY_SEND_TO_VOICEMAIL";
      goto LABEL_34;
    case 17:
      v54 = [(PHCarPlayInCallButton *)v7 carPlayInCallImageForSymbolType:26];
      [(PHCarPlayInCallButton *)v7 setImage:v54 forState:0];

      v27 = +[NSBundle mainBundle];
      v25 = v27;
      CFStringRef v28 = @"CARPLAY_HOLD_BUTTON";
LABEL_34:
      v55 = [v27 localizedStringForKey:v28 value:&stru_100285990 table:@"PHCarPlay"];
      v56 = [(PHCarPlayInCallButton *)v7 buttonLabel];
      [v56 setText:v55];
LABEL_52:

      goto LABEL_53;
    case 18:
      v57 = +[NSBundle mainBundle];
      v58 = +[UIImage phCarPlayImageNamed:@"text_sos_icon_CarPlay" inBundle:v57];
      [(PHCarPlayInCallButton *)v7 setImage:v58 forState:0];

      v59 = +[NSBundle mainBundle];
      v60 = [v59 localizedStringForKey:@"ALERT_ACTION_TEXT_BUTTON_LABEL" value:&stru_100285990 table:@"Localizable-Stewie"];
      v61 = [(PHCarPlayInCallButton *)v7 buttonLabel];
      [v61 setText:v60];

      v62 = +[NSBundle mainBundle];
      v63 = +[UIImage phCarPlayImageNamed:@"text_sos_icon_CarPlay_Focus_Ring" inBundle:v62];

      v25 = [v63 imageWithRenderingMode:2];

      id v64 = [objc_alloc((Class)UIImageView) initWithImage:v25];
      [(PHCarPlayInCallButton *)v7 setSpecialRingView:v64];

      v65 = +[UIColor dynamicCarFocusedColor];
      v66 = [(PHCarPlayInCallButton *)v7 specialRingView];
      [v66 setTintColor:v65];

      v67 = [(PHCarPlayInCallButton *)v7 specialRingView];
      [v67 setUserInteractionEnabled:0];

      v68 = [(PHCarPlayInCallButton *)v7 specialRingView];
      [v68 setHidden:1];

      v55 = [(PHCarPlayInCallButton *)v7 specialRingView];
      [(PHCarPlayInCallButton *)v7 addSubview:v55];
LABEL_53:

      break;
    default:
      break;
  }
  v92 = [(PHCarPlayInCallButton *)v7 buttonLabel];
  v93 = [v92 text];

  if (v93)
  {
    v94 = [(PHCarPlayInCallButton *)v7 buttonLabel];
    v95 = [v94 text];
    v99 = v95;
    v96 = +[NSArray arrayWithObjects:&v99 count:1];
    [(PHCarPlayInCallButton *)v7 setAccessibilityUserInputLabels:v96];
  }
  return v7;
}

- (id)carPlayInCallImageForSymbolType:(int64_t)a3
{
  return +[UIImage tpImageForSymbolType:a3 textStyle:UIFontTextStyleCallout scale:3 isStaticSize:1];
}

- (CGSize)intrinsicContentSize
{
  unsigned int v2 = [(PHCarPlayInCallButton *)self inCallButtonType];
  double v3 = 75.0;
  if (v2 - 8 < 6 || v2 == 4)
  {
    double v5 = 104.0;
  }
  else if (v2 == 18)
  {
    double v5 = 92.5;
  }
  else
  {
    double v5 = 75.0;
    double v3 = 75.0;
  }
  result.height = v3;
  result.width = v5;
  return result;
}

- (void)setHighlighted:(BOOL)a3
{
  BOOL v3 = a3;
  v15.receiver = self;
  v15.super_class = (Class)PHCarPlayInCallButton;
  -[PHCarPlayInCallButton setHighlighted:](&v15, "setHighlighted:");
  double v5 = [(PHCarPlayInCallButton *)self ringView];
  [v5 setHighlighted:v3];

  [(PHCarPlayInCallButton *)self updateToProperIconColor];
  v6 = [(PHCarPlayInCallButton *)self unhighlightedBackgroundColor];

  if (v6)
  {
    if ([(PHCarPlayInCallButton *)self isHighlighted])
    {
      double v13 = 0.0;
      double v14 = 0.0;
      double v11 = 0.0;
      double v12 = 0.0;
      v7 = [(PHCarPlayInCallButton *)self unhighlightedBackgroundColor];
      unsigned int v8 = [v7 getHue:&v14 saturation:&v13 brightness:&v12 alpha:&v11];

      v9 = 0;
      if (!v8)
      {
LABEL_7:
        [(PHCarPlayInCallButton *)self setBackgroundColor:v9];

        return;
      }
      uint64_t v10 = +[UIColor colorWithHue:v14 saturation:v13 brightness:v12 * 0.7 alpha:v11];
    }
    else
    {
      uint64_t v10 = [(PHCarPlayInCallButton *)self unhighlightedBackgroundColor];
    }
    v9 = (void *)v10;
    goto LABEL_7;
  }
}

- (void)setEnabled:(BOOL)a3
{
  BOOL v3 = a3;
  v8.receiver = self;
  v8.super_class = (Class)PHCarPlayInCallButton;
  -[PHCarPlayInCallButton setEnabled:](&v8, "setEnabled:");
  double v5 = [(PHCarPlayInCallButton *)self ringView];
  [v5 setDimmed:!v3];

  if ([(PHCarPlayInCallButton *)self isEnabled]) {
    +[UIColor dynamicCarPrimaryColor];
  }
  else {
  v6 = +[UIColor lightGrayColor];
  }
  v7 = [(PHCarPlayInCallButton *)self buttonLabel];
  [v7 setTextColor:v6];
}

- (void)setSelected:(BOOL)a3
{
  BOOL v3 = a3;
  v7.receiver = self;
  v7.super_class = (Class)PHCarPlayInCallButton;
  -[PHCarPlayInCallButton setSelected:](&v7, "setSelected:");
  double v5 = [(PHCarPlayInCallButton *)self ringView];

  if (v5)
  {
    v6 = [(PHCarPlayInCallButton *)self ringView];
    [v6 setSelected:v3];

    [(PHCarPlayInCallButton *)self updateToProperIconColor];
  }
}

- (void)setHasRingView:(BOOL)a3
{
  BOOL v3 = a3;
  double v5 = [(PHCarPlayInCallButton *)self ringView];

  if (v3)
  {
    if (!v5)
    {
      v6 = -[PHCarPlayInCallButtonRing initWithFrame:]([PHCarPlayInCallButtonRing alloc], "initWithFrame:", 0.0, 0.0, 54.0, 54.0);
      [(PHCarPlayInCallButton *)self setRingView:v6];

      objc_super v7 = [(PHCarPlayInCallButton *)self ringView];
      [v7 setUserInteractionEnabled:0];

      objc_super v8 = [(PHCarPlayInCallButton *)self ringView];
      [v8 setTranslatesAutoresizingMaskIntoConstraints:0];

      v9 = +[UIColor clearColor];
      uint64_t v10 = [(PHCarPlayInCallButton *)self ringView];
      [v10 setBackgroundColor:v9];

      double v11 = [(PHCarPlayInCallButton *)self ringView];
      [v11 setOpaque:0];

      double v12 = [(PHCarPlayInCallButton *)self ringView];
      [(PHCarPlayInCallButton *)self addSubview:v12];

      switch([(PHCarPlayInCallButton *)self inCallButtonType])
      {
        case 0:
        case 4:
        case 0xD:
        case 0xF:
          uint64_t v13 = +[UIColor externalSystemRedColor];
          goto LABEL_16;
        case 8:
          if ((id)[(PHCarPlayInCallButton *)self callState] == (id)1) {
            +[UIColor colorWithRed:0.203921569 green:0.470588235 blue:0.964705882 alpha:1.0];
          }
          else {
          id v17 = +[UIColor externalSystemGreenColor];
          }
          v16 = [(PHCarPlayInCallButton *)self ringView];
          [v16 setFillColor:v17];

          goto LABEL_17;
        case 0xE:
          uint64_t v13 = +[UIColor externalSystemGreenColor];
          goto LABEL_16;
        case 0x10:
          uint64_t v13 = +[UIColor whiteColor];
          goto LABEL_16;
        case 0x12:
          uint64_t v13 = +[UIColor clearColor];
          goto LABEL_16;
        default:
          uint64_t v13 = +[UIColor dynamicCarTertiaryColor];
LABEL_16:
          id v17 = (id)v13;
          objc_super v15 = [(PHCarPlayInCallButton *)self ringView];
          [v15 setFillColor:v17];

LABEL_17:

          break;
      }
    }
  }
  else if (v5)
  {
    double v14 = [(PHCarPlayInCallButton *)self ringView];
    [v14 removeFromSuperview];

    [(PHCarPlayInCallButton *)self setRingView:0];
  }
}

- (void)layoutSubviews
{
  v42.receiver = self;
  v42.super_class = (Class)PHCarPlayInCallButton;
  [(PHCarPlayInCallButton *)&v42 layoutSubviews];
  [(PHCarPlayInCallButton *)self bounds];
  double Width = CGRectGetWidth(v43);
  v4 = [(PHCarPlayInCallButton *)self imageView];
  [v4 sizeThatFits:Width, 58.0];

  [(PHCarPlayInCallButton *)self inCallButtonType];
  UIRectCenteredIntegralRect();
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  double v12 = v11;
  uint64_t v13 = [(PHCarPlayInCallButton *)self imageView];
  [v13 setFrame:v6, v8, v10, v12];

  double v14 = [(PHCarPlayInCallButton *)self specialRingView];

  if (v14)
  {
    objc_super v15 = [(PHCarPlayInCallButton *)self specialRingView];
    [v15 sizeThatFits:Width, 58.0];

    UIRectCenteredIntegralRect();
    double v17 = v16;
    double v19 = v18;
    double v21 = v20;
    double v23 = v22;
    v24 = [(PHCarPlayInCallButton *)self specialRingView];
    [v24 setFrame:v17, v19, v21, v23];
  }
  [(PHCarPlayInCallButton *)self bounds];
  CGFloat v25 = CGRectGetHeight(v44) + -58.0;
  v26 = [(PHCarPlayInCallButton *)self buttonLabel];
  [v26 sizeThatFits:Width v25];
  double v28 = v27;

  v29 = [(PHCarPlayInCallButton *)self buttonLabel];
  [v29 setFrame:CGRectMake(0.0, 58.0, Width, v28)];

  v30 = [(PHCarPlayInCallButton *)self ringView];

  if (v30)
  {
    v31 = [(PHCarPlayInCallButton *)self ringView];
    [(PHCarPlayInCallButton *)self sendSubviewToBack:v31];

    v32 = [(PHCarPlayInCallButton *)self ringView];
    [v32 sizeThatFits:Width, 58.0];

    UIRectCenteredIntegralRect();
    double v34 = v33;
    double v36 = v35;
    double v38 = v37;
    double v40 = v39;
    v41 = [(PHCarPlayInCallButton *)self ringView];
    [v41 setFrame:v34, v36, v38, v40];
  }
}

- (void)updateToProperIconColor
{
  if ([(PHCarPlayInCallButton *)self inCallButtonType] != 16)
  {
    BOOL v3 = [(PHCarPlayInCallButton *)self ringView];

    if (v3)
    {
      if ([(PHCarPlayInCallButton *)self toggledOn]
        || ([(PHCarPlayInCallButton *)self isHighlighted] & 1) != 0)
      {
        uint64_t v4 = +[UIColor tableBackgroundColor];
      }
      else
      {
        uint64_t v4 = +[UIColor whiteColor];
      }
      id v5 = (id)v4;
      [(PHCarPlayInCallButton *)self setTintColor:v4];
    }
  }
}

- (void)setToggledOn:(BOOL)a3
{
  if (self->_toggledOn != a3)
  {
    BOOL v3 = a3;
    self->_toggledOn = a3;
    if ([(PHCarPlayInCallButton *)self inCallButtonType] == 1
      || [(PHCarPlayInCallButton *)self inCallButtonType] == 17)
    {
      id v5 = [(PHCarPlayInCallButton *)self ringView];
      [v5 setToggledOn:v3];

      [(PHCarPlayInCallButton *)self updateToProperIconColor];
    }
  }
}

- (void)pressesBegan:(id)a3 withEvent:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (_pressesContainSelect(v6)) {
    [(PHCarPlayInCallButton *)self setHighlighted:1];
  }
  v8.receiver = self;
  v8.super_class = (Class)PHCarPlayInCallButton;
  [(PHCarPlayInCallButton *)&v8 pressesBegan:v6 withEvent:v7];
}

- (void)pressesEnded:(id)a3 withEvent:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (_pressesContainSelect(v6)) {
    [(PHCarPlayInCallButton *)self setHighlighted:0];
  }
  v8.receiver = self;
  v8.super_class = (Class)PHCarPlayInCallButton;
  [(PHCarPlayInCallButton *)&v8 pressesEnded:v6 withEvent:v7];
}

- (void)pressesCancelled:(id)a3 withEvent:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (_pressesContainSelect(v6)) {
    [(PHCarPlayInCallButton *)self setHighlighted:0];
  }
  v8.receiver = self;
  v8.super_class = (Class)PHCarPlayInCallButton;
  [(PHCarPlayInCallButton *)&v8 pressesCancelled:v6 withEvent:v7];
}

- (void)didUpdateFocusInContext:(id)a3 withAnimationCoordinator:(id)a4
{
  id v16 = a3;
  id v5 = [(PHCarPlayInCallButton *)self ringView];

  if (v5)
  {
    id v6 = [v16 nextFocusedItem];
    [(PHCarPlayInCallButton *)self setSelected:v6 == self];
  }
  uint64_t v7 = [(PHCarPlayInCallButton *)self specialRingView];
  if (v7)
  {
    objc_super v8 = (void *)v7;
    unsigned int v9 = [(PHCarPlayInCallButton *)self inCallButtonType];

    if (v9 == 18)
    {
      double v10 = [v16 nextFocusedItem];

      double v11 = [(PHCarPlayInCallButton *)self specialRingView];
      double v12 = v11;
      if (v10 == self)
      {
        [v11 setHidden:0];

        uint64_t v13 = +[NSBundle mainBundle];
        CFStringRef v14 = @"text_sos_icon_CarPlay_Focused";
      }
      else
      {
        [v11 setHidden:1];

        uint64_t v13 = +[NSBundle mainBundle];
        CFStringRef v14 = @"text_sos_icon_CarPlay";
      }
      objc_super v15 = +[UIImage phCarPlayImageNamed:v14 inBundle:v13];
      [(PHCarPlayInCallButton *)self setImage:v15 forState:0];
    }
  }
}

- (UILabel)buttonLabel
{
  return (UILabel *)objc_getProperty(self, a2, 24, 1);
}

- (void)setButtonLabel:(id)a3
{
}

- (NSLayoutConstraint)horizontalPositioningConstraint
{
  return (NSLayoutConstraint *)objc_getProperty(self, a2, 32, 1);
}

- (void)setHorizontalPositioningConstraint:(id)a3
{
}

- (int)inCallButtonType
{
  return self->_inCallButtonType;
}

- (BOOL)toggledOn
{
  return self->_toggledOn;
}

- (int)specialLayoutType
{
  return self->_specialLayoutType;
}

- (void)setSpecialLayoutType:(int)a3
{
  self->_specialLayoutType = a3;
}

- (UIColor)unhighlightedBackgroundColor
{
  return (UIColor *)objc_getProperty(self, a2, 40, 1);
}

- (void)setUnhighlightedBackgroundColor:(id)a3
{
}

- (PHCarPlayInCallButtonRing)ringView
{
  return (PHCarPlayInCallButtonRing *)objc_getProperty(self, a2, 48, 1);
}

- (void)setRingView:(id)a3
{
}

- (UIImageView)specialRingView
{
  return (UIImageView *)objc_getProperty(self, a2, 56, 1);
}

- (void)setSpecialRingView:(id)a3
{
}

- (int64_t)callState
{
  return self->_callState;
}

- (void)setCallState:(int64_t)a3
{
  self->_callState = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_specialRingView, 0);
  objc_storeStrong((id *)&self->_ringView, 0);
  objc_storeStrong((id *)&self->_unhighlightedBackgroundColor, 0);
  objc_storeStrong((id *)&self->_horizontalPositioningConstraint, 0);

  objc_storeStrong((id *)&self->_buttonLabel, 0);
}

@end