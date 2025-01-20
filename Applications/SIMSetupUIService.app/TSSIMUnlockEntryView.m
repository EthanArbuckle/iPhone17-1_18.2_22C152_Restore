@interface TSSIMUnlockEntryView
- (BOOL)becomeFirstResponder;
- (BOOL)canBecomeFirstResponder;
- (BOOL)canResignFirstResponder;
- (BOOL)isFirstResponder;
- (BOOL)pinMismatch;
- (BOOL)resignFirstResponder;
- (BOOL)textField:(id)a3 shouldChangeCharactersInRange:(_NSRange)a4 replacementString:(id)a5;
- (BOOL)textFieldShouldReturn:(id)a3;
- (BOOL)unlocking;
- (CGSize)sizeThatFits:(CGSize)result;
- (NSString)enteredText;
- (TSSIMUnlockEntryView)initWithActionType:(int64_t)a3 actionSubtype:(int64_t)a4;
- (TSSIMUnlockEntryViewDelegate)delegate;
- (int64_t)actionSubtype;
- (int64_t)actionType;
- (unint64_t)attemptsRemaining;
- (void)_configureDetailLabelText;
- (void)_configureOKButtonWithEnteredText:(id)a3;
- (void)_okButtonPressed:(id)a3;
- (void)layoutSubviews;
- (void)resetEnteredTextWithShakeAnimation:(BOOL)a3;
- (void)setAttemptsRemaining:(unint64_t)a3;
- (void)setDelegate:(id)a3;
- (void)setPinMismatch:(BOOL)a3;
- (void)setUnlocking:(BOOL)a3;
@end

@implementation TSSIMUnlockEntryView

- (TSSIMUnlockEntryView)initWithActionType:(int64_t)a3 actionSubtype:(int64_t)a4
{
  v30.receiver = self;
  v30.super_class = (Class)TSSIMUnlockEntryView;
  double y = CGRectZero.origin.y;
  double width = CGRectZero.size.width;
  double height = CGRectZero.size.height;
  v9 = -[TSSIMUnlockEntryView initWithFrame:](&v30, "initWithFrame:", CGRectZero.origin.x, y, width, height);
  v10 = v9;
  if (v9)
  {
    v9->_actionType = a3;
    v9->_actionSubtype = a4;
    v11 = [objc_alloc((Class)UILabel) initWithFrame:CGRectZero.origin.x, y, width, height];
    detailLabel = v10->_detailLabel;
    v10->_detailLabel = v11;

    [(UILabel *)v10->_detailLabel setTextAlignment:1];
    v13 = v10->_detailLabel;
    v14 = +[UIFont preferredFontForTextStyle:UIFontTextStyleBody];
    [(UILabel *)v13 setFont:v14];

    [(UILabel *)v10->_detailLabel setNumberOfLines:1];
    [(TSSIMUnlockEntryView *)v10 _configureDetailLabelText];
    [(TSSIMUnlockEntryView *)v10 addSubview:v10->_detailLabel];
    v15 = [objc_alloc((Class)UIView) initWithFrame:CGRectZero.origin.x, y, width, height];
    containerView = v10->_containerView;
    v10->_containerView = v15;

    [(TSSIMUnlockEntryView *)v10 addSubview:v10->_containerView];
    v17 = [objc_alloc((Class)UITextField) initWithFrame:CGRectZero.origin.x, y, width, height];
    entryField = v10->_entryField;
    v10->_entryField = v17;

    [(UITextField *)v10->_entryField setDelegate:v10];
    [(UITextField *)v10->_entryField setBorderStyle:3];
    v19 = v10->_entryField;
    if (+[SSServiceUtilities isPad]) {
      uint64_t v20 = 11;
    }
    else {
      uint64_t v20 = 127;
    }
    [(UITextField *)v19 setKeyboardType:v20];
    [(UITextField *)v10->_entryField setSecureTextEntry:1];
    [(UIView *)v10->_containerView addSubview:v10->_entryField];
    uint64_t v21 = +[UIButton buttonWithType:1];
    okButton = v10->_okButton;
    v10->_okButton = (UIButton *)v21;

    v23 = v10->_okButton;
    v24 = +[NSBundle mainBundle];
    v25 = [v24 localizedStringForKey:@"OK" value:&stru_100020AC8 table:@"Localizable"];
    [(UIButton *)v23 setTitle:v25 forState:0];

    v26 = v10->_okButton;
    v27 = +[UIFont boldSystemFontOfSize:16.0];
    [(UIButton *)v26 _setFont:v27];

    [(UIButton *)v10->_okButton setEnabled:0];
    [(UIButton *)v10->_okButton sizeToFit];
    [(UIButton *)v10->_okButton addTarget:v10 action:"_okButtonPressed:" forControlEvents:0x2000];
    v28 = [(TSSIMUnlockEntryView *)v10 enteredText];
    [(TSSIMUnlockEntryView *)v10 _configureOKButtonWithEnteredText:v28];

    [(UIView *)v10->_containerView addSubview:v10->_okButton];
  }
  return v10;
}

- (void)layoutSubviews
{
  v15.receiver = self;
  v15.super_class = (Class)TSSIMUnlockEntryView;
  [(TSSIMUnlockEntryView *)&v15 layoutSubviews];
  [(TSSIMUnlockEntryView *)self bounds];
  double Width = CGRectGetWidth(v16);
  v17.origin.x = 0.0;
  v17.origin.double y = 0.0;
  v17.size.double width = Width;
  v17.size.double height = 60.0;
  double MaxY = CGRectGetMaxY(v17);
  [(UIButton *)self->_okButton size];
  double v5 = v4;
  v18.origin.x = 0.0;
  v18.origin.double y = 0.0;
  v18.size.double height = 30.0;
  v18.size.double width = 100.0;
  CGRectGetMaxX(v18);
  UIRectCenteredYInRect();
  double v7 = v6;
  double v9 = v8;
  double v11 = v10;
  double v13 = v12;
  -[UILabel setFrame:](self->_detailLabel, "setFrame:", 0.0, 0.0, Width, 60.0);
  -[UITextField setFrame:](self->_entryField, "setFrame:", 0.0, 0.0, 100.0, 30.0);
  -[UIButton setFrame:](self->_okButton, "setFrame:", v7, v9, v11, v13);
  -[UIView setFrame:](self->_containerView, "setFrame:", Width * 0.5 + -50.0, MaxY, v5 + 100.0 + 5.0, 30.0);
}

- (CGSize)sizeThatFits:(CGSize)result
{
  double v3 = 90.0;
  result.double height = v3;
  return result;
}

- (BOOL)textField:(id)a3 shouldChangeCharactersInRange:(_NSRange)a4 replacementString:(id)a5
{
  if (self->_unlocking) {
    return 0;
  }
  NSUInteger length = a4.length;
  NSUInteger location = a4.location;
  id v10 = a5;
  id v11 = a3;
  double v12 = +[NSCharacterSet decimalDigitCharacterSet];
  double v13 = [v12 invertedSet];

  v14 = [v11 text];

  [v14 stringByReplacingCharactersInRange:location length:length withString:v10];

  id v16 = [v10 length];
  id v17 = [v10 rangeOfCharacterFromSet:v13];

  id v18 = [v15 length];
  if (!v16 || (BOOL v5 = 0, v17 == (id)0x7FFFFFFFFFFFFFFFLL) && (unint64_t)v18 <= 8)
  {
    [(TSSIMUnlockEntryView *)self _configureOKButtonWithEnteredText:v15];
    BOOL v5 = 1;
  }

  return v5;
}

- (BOOL)textFieldShouldReturn:(id)a3
{
  double v4 = [a3 text];
  id v5 = [v4 length];
  if (v5)
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    [WeakRetained entryView:self didEnterText:v4];
  }
  return v5 != 0;
}

- (BOOL)canBecomeFirstResponder
{
  return [(UITextField *)self->_entryField canBecomeFirstResponder];
}

- (BOOL)becomeFirstResponder
{
  return [(UITextField *)self->_entryField becomeFirstResponder];
}

- (BOOL)canResignFirstResponder
{
  return [(UITextField *)self->_entryField canResignFirstResponder];
}

- (BOOL)resignFirstResponder
{
  v4.receiver = self;
  v4.super_class = (Class)TSSIMUnlockEntryView;
  [(TSSIMUnlockEntryView *)&v4 resignFirstResponder];
  return [(UITextField *)self->_entryField resignFirstResponder];
}

- (BOOL)isFirstResponder
{
  return [(UITextField *)self->_entryField isFirstResponder];
}

- (void)resetEnteredTextWithShakeAnimation:(BOOL)a3
{
  BOOL v3 = a3;
  [(UITextField *)self->_entryField setText:0];
  [(TSSIMUnlockEntryView *)self _configureOKButtonWithEnteredText:0];
  if (v3)
  {
    id v5 = +[CASpringAnimation animationWithKeyPath:@"position"];
    [v5 setAdditive:1];
    [v5 setMass:1.2];
    [v5 setStiffness:1200.0];
    [v5 setDamping:12.0];
    LODWORD(v6) = 1028389654;
    LODWORD(v7) = 990057071;
    LODWORD(v8) = 1059712716;
    LODWORD(v9) = 1.0;
    id v10 = +[CAMediaTimingFunction functionWithControlPoints:v6 :v7 :v8 :v9];
    [v5 setTimingFunction:v10];

    [v5 setInitialVelocity:0.0];
    [v5 setFillMode:kCAFillModeForwards];
    [v5 durationForEpsilon:0.001];
    [v5 setDuration:];
    id v11 = +[NSValue valueWithCGPoint:](NSValue, "valueWithCGPoint:", 0.0, 0.0);
    [v5 setFromValue:v11];

    double v12 = +[NSValue valueWithCGPoint:](NSValue, "valueWithCGPoint:", -75.0, 0.0);
    [v5 setToValue:v12];

    double v13 = +[CABasicAnimation animationWithKeyPath:@"position"];
    [v13 setAdditive:1];
    LODWORD(v14) = 1054276898;
    LODWORD(v15) = 1058305108;
    LODWORD(v16) = 1.0;
    id v17 = +[CAMediaTimingFunction functionWithControlPoints:v14 :0.0 :v15 :v16];
    [v13 setTimingFunction:v17];

    [v13 setDuration:0.1];
    [v13 setFillMode:kCAFillModeForwards];
    id v18 = +[NSValue valueWithCGPoint:](NSValue, "valueWithCGPoint:", 0.0, 0.0);
    [v13 setFromValue:v18];

    v19 = +[NSValue valueWithCGPoint:](NSValue, "valueWithCGPoint:", 75.0, 0.0);
    [v13 setToValue:v19];

    uint64_t v20 = +[CAAnimationGroup animation];
    v26[0] = v5;
    v26[1] = v13;
    uint64_t v21 = +[NSArray arrayWithObjects:v26 count:2];
    [v20 setAnimations:v21];

    [v5 duration];
    double v23 = v22;
    [v13 duration];
    if (v23 >= v24) {
      double v24 = v23;
    }
    [v20 setDuration:v24];

    v25 = [(UIView *)self->_containerView layer];
    [v25 addAnimation:v20 forKey:0];
  }
}

- (NSString)enteredText
{
  return [(UITextField *)self->_entryField text];
}

- (void)setUnlocking:(BOOL)a3
{
  if (self->_unlocking != a3)
  {
    self->_unlocking = a3;
    [(TSSIMUnlockEntryView *)self _configureDetailLabelText];
    id v4 = [(TSSIMUnlockEntryView *)self enteredText];
    [(TSSIMUnlockEntryView *)self _configureOKButtonWithEnteredText:v4];
  }
}

- (void)setAttemptsRemaining:(unint64_t)a3
{
  if (self->_attemptsRemaining != a3)
  {
    self->_attemptsRemaining = a3;
    [(TSSIMUnlockEntryView *)self _configureDetailLabelText];
  }
}

- (void)setPinMismatch:(BOOL)a3
{
  if (self->_pinMismatch != a3)
  {
    self->_pinMismatch = a3;
    [(TSSIMUnlockEntryView *)self _configureDetailLabelText];
  }
}

- (void)_okButtonPressed:(id)a3
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  id v4 = [(UITextField *)self->_entryField text];
  [WeakRetained entryView:self didEnterText:v4];
}

- (void)_configureOKButtonWithEnteredText:(id)a3
{
  okButton = self->_okButton;
  BOOL v4 = !self->_unlocking && [a3 length] != 0;

  [(UIButton *)okButton setEnabled:v4];
}

- (void)_configureDetailLabelText
{
  if (self->_unlocking) {
    goto LABEL_2;
  }
  unint64_t actionSubtype = self->_actionSubtype;
  if (actionSubtype < 2)
  {
    double v7 = +[NSBundle mainBundle];
    double v9 = [v7 localizedStringForKey:@"ATTEMPTS_REMAINING_FORMAT" value:&stru_100020AC8 table:@"Plurals"];
    +[NSString localizedStringWithFormat:](NSString, "localizedStringWithFormat:", v9, self->_attemptsRemaining);
    id v10 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    if (actionSubtype == 3)
    {
      double v6 = +[NSBundle mainBundle];
      double v7 = v6;
      CFStringRef v8 = @"ENTER_NEW_PIN_2_DETAIL";
    }
    else
    {
      if (actionSubtype != 2)
      {
LABEL_2:
        id v3 = 0;
        goto LABEL_13;
      }
      BOOL pinMismatch = self->_pinMismatch;
      double v6 = +[NSBundle mainBundle];
      double v7 = v6;
      if (pinMismatch) {
        CFStringRef v8 = @"ENTER_NEW_PIN_1_DETAIL_MISMATCH";
      }
      else {
        CFStringRef v8 = @"ENTER_NEW_PIN_1_DETAIL";
      }
    }
    id v10 = [v6 localizedStringForKey:v8 value:&stru_100020AC8 table:@"Localizable"];
  }

  id v3 = v10;
LABEL_13:
  id v11 = v3;
  [(UILabel *)self->_detailLabel setText:v3];
  [(TSSIMUnlockEntryView *)self setNeedsDisplay];
}

- (BOOL)unlocking
{
  return self->_unlocking;
}

- (BOOL)pinMismatch
{
  return self->_pinMismatch;
}

- (unint64_t)attemptsRemaining
{
  return self->_attemptsRemaining;
}

- (TSSIMUnlockEntryViewDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (TSSIMUnlockEntryViewDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (int64_t)actionType
{
  return self->_actionType;
}

- (int64_t)actionSubtype
{
  return self->_actionSubtype;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_okButton, 0);
  objc_storeStrong((id *)&self->_entryField, 0);
  objc_storeStrong((id *)&self->_detailLabel, 0);

  objc_storeStrong((id *)&self->_containerView, 0);
}

@end