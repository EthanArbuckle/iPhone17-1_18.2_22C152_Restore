@interface PHCarPlayInCallDialerView
- (PHCarPlayInCallDialerView)initWithFrame:(CGRect)a3;
@end

@implementation PHCarPlayInCallDialerView

- (PHCarPlayInCallDialerView)initWithFrame:(CGRect)a3
{
  v53.receiver = self;
  v53.super_class = (Class)PHCarPlayInCallDialerView;
  v3 = -[PHCarPlayInCallDialerView initWithFrame:](&v53, "initWithFrame:", 0.0, 0.0, 147.0, 180.0);
  if (v3)
  {
    v4 = +[UIColor clearColor];
    [(PHCarPlayInCallDialerView *)v3 setBackgroundColor:v4];

    v5 = objc_alloc_init(PHCarPlayInCallDialerLCDView);
    [(PHAbstractDialerView *)v3 setLcdView:v5];

    v6 = [(PHAbstractDialerView *)v3 lcdView];
    [v6 setDelegate:v3];

    v7 = [(PHAbstractDialerView *)v3 lcdView];
    [v7 setTranslatesAutoresizingMaskIntoConstraints:0];

    v8 = [PHCarPlayNumberPad alloc];
    v9 = [(PHCarPlayInCallDialerView *)v3 traitCollection];
    v10 = -[PHCarPlayNumberPad initWithUserInterfaceStyle:](v8, "initWithUserInterfaceStyle:", [v9 userInterfaceStyle]);
    [(PHAbstractDialerView *)v3 setPhonePadView:v10];

    v11 = [(PHAbstractDialerView *)v3 phonePadView];
    [v11 frame];
    double v13 = v12;
    v14 = [(PHAbstractDialerView *)v3 phonePadView];
    [v14 frame];
    double v16 = v15;
    v17 = [(PHAbstractDialerView *)v3 phonePadView];
    [v17 setFrame:0.0, 52.0, v13, v16];

    v18 = [(PHAbstractDialerView *)v3 phonePadView];
    [v18 setTranslatesAutoresizingMaskIntoConstraints:0];

    v19 = [(PHAbstractDialerView *)v3 phonePadView];
    [v19 setPlaysSounds:1];

    v20 = +[UIColor clearColor];
    v21 = [(PHAbstractDialerView *)v3 phonePadView];
    [v21 setBackgroundColor:v20];

    v22 = [(PHAbstractDialerView *)v3 phonePadView];
    [v22 setOpaque:0];

    v23 = [(PHAbstractDialerView *)v3 lcdView];
    [(PHCarPlayInCallDialerView *)v3 addSubview:v23];

    v24 = [(PHAbstractDialerView *)v3 phonePadView];
    [(PHCarPlayInCallDialerView *)v3 addSubview:v24];

    id v25 = objc_alloc_init((Class)UILayoutGuide);
    [(PHCarPlayInCallDialerView *)v3 addLayoutGuide:v25];
    v50 = [v25 topAnchor];
    v48 = [(PHCarPlayInCallDialerView *)v3 topAnchor];
    +[PHCarPlayInCallKeypadViewController fakeNavigationBarHeight];
    v47 = [v50 constraintEqualToAnchor:v48];
    v55[0] = v47;
    v46 = [v25 bottomAnchor];
    v26 = [(PHCarPlayInCallDialerView *)v3 bottomAnchor];
    v27 = [v46 constraintEqualToAnchor:v26];
    v55[1] = v27;
    v52 = v25;
    v28 = [v25 leadingAnchor];
    v29 = [(PHCarPlayInCallDialerView *)v3 leadingAnchor];
    v30 = [v28 constraintEqualToAnchor:v29];
    v55[2] = v30;
    v31 = [v25 trailingAnchor];
    v32 = [(PHCarPlayInCallDialerView *)v3 trailingAnchor];
    v33 = [v31 constraintEqualToAnchor:v32];
    v55[3] = v33;
    v34 = +[NSArray arrayWithObjects:v55 count:4];
    +[NSLayoutConstraint activateConstraints:v34];

    v51 = [(PHAbstractDialerView *)v3 phonePadView];
    v49 = +[NSLayoutConstraint constraintWithItem:v51 attribute:9 relatedBy:0 toItem:v3 attribute:9 multiplier:1.0 constant:0.0];
    v54[0] = v49;
    v35 = [(PHAbstractDialerView *)v3 phonePadView];
    v36 = +[NSLayoutConstraint constraintWithItem:v35 attribute:10 relatedBy:0 toItem:v52 attribute:10 multiplier:1.0 constant:0.0];
    v54[1] = v36;
    v37 = [(PHAbstractDialerView *)v3 lcdView];
    LODWORD(v38) = 1148846080;
    v39 = +[NSLayoutConstraint constraintWithItem:v37 attribute:11 relatedBy:0 toItem:v3 attribute:3 multiplier:1.0 constant:30.0 priority:v38];
    v54[2] = v39;
    v40 = [(PHAbstractDialerView *)v3 lcdView];
    v41 = +[NSLayoutConstraint constraintWithItem:v40 attribute:7 relatedBy:0 toItem:0 attribute:0 multiplier:1.0 constant:147.0];
    v54[3] = v41;
    v42 = [(PHAbstractDialerView *)v3 lcdView];
    v43 = +[NSLayoutConstraint constraintWithItem:v42 attribute:9 relatedBy:0 toItem:v3 attribute:9 multiplier:1.0 constant:0.0];
    v54[4] = v43;
    v44 = +[NSArray arrayWithObjects:v54 count:5];
    [(PHCarPlayInCallDialerView *)v3 addConstraints:v44];
  }
  return v3;
}

@end