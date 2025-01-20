@interface VOTEnabledBannerViewController
- (VOTEnabledBannerView)bannerView;
- (void)hideAnimated:(BOOL)a3 completion:(id)a4;
- (void)loadView;
- (void)setBannerView:(id)a3;
- (void)showAnimated:(BOOL)a3 completion:(id)a4;
@end

@implementation VOTEnabledBannerViewController

- (void)loadView
{
  id v3 = objc_alloc((Class)UIView);
  double y = CGRectZero.origin.y;
  double width = CGRectZero.size.width;
  double height = CGRectZero.size.height;
  id v15 = objc_msgSend(v3, "initWithFrame:", CGRectZero.origin.x, y, width, height);
  [(VOTEnabledBannerViewController *)self setView:v15];
  v7 = -[VOTEnabledBannerView initWithFrame:]([VOTEnabledBannerView alloc], "initWithFrame:", CGRectZero.origin.x, y, width, height);
  [(VOTEnabledBannerView *)v7 setAlpha:0.0];
  [v15 addSubview:v7];
  [(VOTEnabledBannerViewController *)self setBannerView:v7];
  v8 = +[NSMutableArray array];
  v9 = [(VOTEnabledBannerView *)v7 bottomAnchor];
  v10 = [v15 bottomAnchor];
  v11 = [v9 constraintEqualToAnchor:v10 constant:-47.0];
  [v8 addObject:v11];

  v12 = [(VOTEnabledBannerView *)v7 centerXAnchor];
  v13 = [v15 centerXAnchor];
  v14 = [v12 constraintEqualToAnchor:v13];
  [v8 addObject:v14];

  +[NSLayoutConstraint activateConstraints:v8];
}

- (void)showAnimated:(BOOL)a3 completion:(id)a4
{
  BOOL v4 = a3;
  id v6 = a4;
  v7 = [(VOTEnabledBannerViewController *)self bannerView];
  v8 = [(VOTEnabledBannerViewController *)self view];
  [v8 setNeedsLayout];

  v9 = [(VOTEnabledBannerViewController *)self view];
  [v9 layoutIfNeeded];

  double v10 = 0.0;
  [v7 setAlpha:0.0];
  if (v4) {
    double v10 = 0.3;
  }
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_13024;
  v15[3] = &unk_3D2B0;
  id v16 = v7;
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_13030;
  v13[3] = &unk_3D530;
  id v14 = v6;
  id v11 = v6;
  id v12 = v7;
  +[UIView animateWithDuration:4 delay:v15 options:v13 animations:v10 completion:0.0];
}

- (void)hideAnimated:(BOOL)a3 completion:(id)a4
{
  BOOL v4 = a3;
  id v6 = a4;
  v7 = [(VOTEnabledBannerViewController *)self bannerView];
  v8 = v7;
  if (v4) {
    double v9 = 0.3;
  }
  else {
    double v9 = 0.0;
  }
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472;
  v14[2] = sub_13184;
  v14[3] = &unk_3D2B0;
  id v15 = v7;
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_13190;
  v12[3] = &unk_3D530;
  id v13 = v6;
  id v10 = v6;
  id v11 = v8;
  +[UIView animateWithDuration:4 delay:v14 options:v12 animations:v9 completion:0.0];
}

- (VOTEnabledBannerView)bannerView
{
  return self->_bannerView;
}

- (void)setBannerView:(id)a3
{
}

- (void).cxx_destruct
{
}

@end