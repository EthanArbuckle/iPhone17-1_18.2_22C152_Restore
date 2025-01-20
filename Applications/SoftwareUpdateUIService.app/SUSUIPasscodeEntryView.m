@interface SUSUIPasscodeEntryView
- (SBUIPasscodeLockView)passcodeLockView;
- (SUSUIPasscodeEntryView)initWithFrame:(CGRect)a3;
- (id)createPasscodeView;
- (void)layoutSubviews;
- (void)setPasscodeViewsToVisible:(BOOL)a3 animated:(BOOL)a4 completion:(id)a5;
@end

@implementation SUSUIPasscodeEntryView

- (SUSUIPasscodeEntryView)initWithFrame:(CGRect)a3
{
  CGRect v21 = a3;
  SEL v19 = a2;
  v20 = 0;
  v18.receiver = self;
  v18.super_class = (Class)SUSUIPasscodeEntryView;
  v20 = -[SUSUIPasscodeEntryView initWithFrame:](&v18, "initWithFrame:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  objc_storeStrong((id *)&v20, v20);
  if (v20)
  {
    id v3 = objc_alloc((Class)UIView);
    v4 = [v3 initWithFrame:v21.origin.x, v21.origin.y, v21.size.width, v21.size.height];
    containerView = v20->_containerView;
    v20->_containerView = v4;

    -[UIView setAutoresizingMask:](v20->_containerView, "setAutoresizingMask:");
    -[UIView setBackgroundColor:](v20->_containerView, "setBackgroundColor:");
    [(SUSUIPasscodeEntryView *)v20 addSubview:v20->_containerView];
    uint64_t v17 = 2030;
    v6 = (_UIBackdropView *)[objc_alloc((Class)_UIBackdropView) initWithPrivateStyle:2030];
    blurView = v20->_blurView;
    v20->_blurView = v6;

    [(_UIBackdropView *)v20->_blurView setAutoresizingMask:18];
    [(UIView *)v20->_containerView addSubview:v20->_blurView];
    v8 = (SBUIPasscodeLockView *)[(SUSUIPasscodeEntryView *)v20 createPasscodeView];
    passcodeView = v20->_passcodeView;
    v20->_passcodeView = v8;

    id v12 = +[_UIBackdropViewSettings settingsForPrivateStyle:v17];
    id v16 = [v12 combinedTintColor];

    [(SBUIPasscodeLockView *)v20->_passcodeView setAutoresizingMask:18];
    v13 = v20->_passcodeView;
    id v14 = [v16 colorWithAlphaComponent:1.0];
    -[SBUIPasscodeLockView setCustomBackgroundColor:](v13, "setCustomBackgroundColor:");

    [(SBUIPasscodeLockView *)v20->_passcodeView setShowsEmergencyCallButton:0];
    v15 = v20->_passcodeView;
    [v16 alphaComponent];
    -[SBUIPasscodeLockView setBackgroundAlpha:](v15, "setBackgroundAlpha:");
    [(UIView *)v20->_containerView addSubview:v20->_passcodeView];
    [(UIView *)v20->_containerView setAlpha:0.0];
    objc_storeStrong(&v16, 0);
  }
  v11 = v20;
  objc_storeStrong((id *)&v20, 0);
  return v11;
}

- (void)setPasscodeViewsToVisible:(BOOL)a3 animated:(BOOL)a4 completion:(id)a5
{
  v24 = self;
  SEL v23 = a2;
  BOOL v22 = a3;
  BOOL v21 = a4;
  id location = 0;
  objc_storeStrong(&location, a5);
  v24->_dismissing = !v22;
  v13 = _NSConcreteStackBlock;
  int v14 = -1073741824;
  int v15 = 0;
  id v16 = sub_100008690;
  uint64_t v17 = &unk_100018698;
  objc_super v18 = v24;
  BOOL v19 = v22;
  v5 = _NSConcreteStackBlock;
  int v6 = -1073741824;
  int v7 = 0;
  v8 = sub_1000086EC;
  v9 = &unk_1000186C0;
  v10 = v24;
  BOOL v12 = v22;
  id v11 = location;
  +[UIView animateWithDuration:animations:completion:](UIView, "animateWithDuration:animations:completion:", &v13, 0.4);
  objc_storeStrong(&v11, 0);
  objc_storeStrong((id *)&v10, 0);
  objc_storeStrong((id *)&v18, 0);
  objc_storeStrong(&location, 0);
}

- (void)layoutSubviews
{
  [(SUSUIPasscodeEntryView *)self bounds];
  double v6 = v2;
  double v7 = v3;
  double v8 = v4;
  double v9 = v5;
  -[_UIBackdropView setFrame:](self->_blurView, "setFrame:", v2, v3, v4, v5);
  -[SBUIPasscodeLockView setFrame:](self->_passcodeView, "setFrame:", v6, v7, v8, v9);
}

- (id)createPasscodeView
{
  return +[SBUIPasscodeLockViewFactory passcodeLockViewForUsersCurrentStyle];
}

- (SBUIPasscodeLockView)passcodeLockView
{
  return self->_passcodeView;
}

- (void).cxx_destruct
{
}

@end