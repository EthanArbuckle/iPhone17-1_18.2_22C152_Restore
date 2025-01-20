@interface BuddyPasscodeInputView
- (BOOL)becomeFirstResponder;
- (BOOL)canBecomeFirstResponder;
- (BOOL)isFirstResponder;
- (BOOL)resignFirstResponder;
- (BuddyPasscodeInputViewDelegate)delegate;
- (CGSize)intrinsicContentSize;
- (id)passcode;
- (id)passcodeField;
- (void)setDelegate:(id)a3;
- (void)setPasscode:(id)a3;
- (void)shakePasscode;
@end

@implementation BuddyPasscodeInputView

- (void)setPasscode:(id)a3
{
  location[2] = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  objc_storeStrong(location, 0);
}

- (id)passcode
{
  return 0;
}

- (id)passcodeField
{
  return 0;
}

- (BOOL)canBecomeFirstResponder
{
  return 1;
}

- (BOOL)becomeFirstResponder
{
  id v2 = [(BuddyPasscodeInputView *)self passcodeField];
  unsigned __int8 v3 = [v2 becomeFirstResponder];

  return v3 & 1;
}

- (BOOL)isFirstResponder
{
  id v2 = [(BuddyPasscodeInputView *)self passcodeField];
  unsigned __int8 v3 = [v2 isFirstResponder];

  return v3 & 1;
}

- (BOOL)resignFirstResponder
{
  v7 = self;
  SEL v6 = a2;
  v5.receiver = self;
  v5.super_class = (Class)BuddyPasscodeInputView;
  [(BuddyPasscodeInputView *)&v5 resignFirstResponder];
  id v2 = [(BuddyPasscodeInputView *)v7 passcodeField];
  unsigned __int8 v3 = [v2 resignFirstResponder];

  return v3 & 1;
}

- (void)shakePasscode
{
  v27[2] = self;
  v27[1] = (id)a2;
  v27[0] = self;
  v26[1] = (id)0x4052C00000000000;
  v26[0] = +[CASpringAnimation animationWithKeyPath:@"position.x"];
  [v26[0] setMass:1.20000005];
  [v26[0] setStiffness:1200.0];
  [v26[0] setDamping:12.0];
  LODWORD(v2) = 1028389654;
  LODWORD(v3) = 990057071;
  LODWORD(v4) = 1059712716;
  LODWORD(v5) = 1.0;
  SEL v6 = +[CAMediaTimingFunction functionWithControlPoints:v2 :v3 :v4 :v5];
  [v26[0] setTimingFunction:v6];

  [v26[0] setDuration:0.666999996];
  [v26[0] setInitialVelocity:0.0];
  [v26[0] setFillMode:kCAFillModeBackwards];
  id v7 = [v27[0] layer];
  [v7 position];
  location[1] = v8;
  location[2] = v9;
  double v10 = *(double *)&v8 + 75.0;
  *(float *)&double v10 = v10;
  v11 = +[NSNumber numberWithFloat:v10];
  [v26[0] setFromValue:v11];

  id v12 = [v27[0] layer];
  [v12 addAnimation:v26[0] forKey:@"spring"];

  location[0] = +[CABasicAnimation animationWithKeyPath:@"position.x"];
  LODWORD(v13) = 1054276898;
  LODWORD(v14) = 0;
  LODWORD(v15) = 1058305108;
  LODWORD(v16) = 1.0;
  v17 = +[CAMediaTimingFunction functionWithControlPoints:v13 :v14 :v15 :v16];
  [location[0] setTimingFunction:v17];

  [location[0] setDuration:0.100000001];
  [location[0] setFillMode:kCAFillModeBackwards];
  id v18 = [v27[0] layer];
  [v18 position];
  double v24 = v19;
  double v20 = v19 - 75.0;
  *(float *)&double v20 = v20;
  v22 = +[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:", v20, *(void *)&v24, v21);
  [location[0] setFromValue:v22];

  id v23 = [v27[0] layer];
  [v23 addAnimation:location[0] forKey:@"force"];

  objc_storeStrong(location, 0);
  objc_storeStrong(v26, 0);
  objc_storeStrong(v27, 0);
}

- (CGSize)intrinsicContentSize
{
  id v2 = [(BuddyPasscodeInputView *)self passcodeField];
  [v2 frame];
  double v8 = v3;
  double v7 = v4;

  double v6 = v8;
  double v5 = v7;
  result.height = v6;
  result.width = v5;
  return result;
}

- (BuddyPasscodeInputViewDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (BuddyPasscodeInputViewDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (void).cxx_destruct
{
}

@end