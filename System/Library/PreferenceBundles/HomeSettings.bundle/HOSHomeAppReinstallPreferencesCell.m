@interface HOSHomeAppReinstallPreferencesCell
+ (id)cloudDownloadImageForTintColor:(id)a3 outlineColor:(id)a4 traitCollection:(id)a5;
+ (id)specifier;
+ (int64_t)cellStyle;
- (HFHomeAppInstallController)installController;
- (HOSCloudDownloadControl)downloadControl;
- (void)_downloadHomeApp:(id)a3;
- (void)_updateDownloadControl:(BOOL)a3;
- (void)_updateDownloadControlWithInstallStatus:(int64_t)a3 animated:(BOOL)a4;
- (void)refreshCellContentsWithSpecifier:(id)a3;
- (void)setDownloadControl:(id)a3;
- (void)setInstallController:(id)a3;
@end

@implementation HOSHomeAppReinstallPreferencesCell

+ (id)specifier
{
  v2 = NSStringFromClass((Class)a1);
  v3 = +[PSSpecifier preferenceSpecifierNamed:v2 target:0 set:0 get:0 detail:0 cell:-1 edit:0];

  [v3 setProperty:objc_opt_class() forKey:PSCellClassKey];
  v4 = +[NSNumber numberWithInteger:88];
  [v3 setProperty:v4 forKey:PSTableCellHeightKey];

  v5 = +[NSBundle bundleForClass:objc_opt_class()];
  v6 = [v5 localizedStringForKey:@"HOSHomeAppReinstallPreferencesCellTitle" value:&stru_108B0 table:@"HOSLocalizable"];
  [v3 setProperty:v6 forKey:PSTitleKey];

  v7 = +[NSBundle bundleForClass:objc_opt_class()];
  v8 = [v7 localizedStringForKey:@"HOSHomeAppReinstallPreferencesCellDescription" value:&stru_108B0 table:@"HOSLocalizable"];
  [v3 setProperty:v8 forKey:PSTableCellSubtitleTextKey];

  v9 = +[NSBundle bundleForClass:objc_opt_class()];
  v10 = +[UIImage imageNamed:@"HomeAppIcon" inBundle:v9 compatibleWithTraitCollection:0];
  [v3 setProperty:v10 forKey:PSIconImageKey];
  v11 = +[HFHomeAppInstallController sharedInstance];
  [v3 setProperty:v11 forKey:HOSHomeAppReinstallPreferencesCellHomeAppInstallControllerSpecifierKey];

  return v3;
}

+ (int64_t)cellStyle
{
  return 3;
}

+ (id)cloudDownloadImageForTintColor:(id)a3 outlineColor:(id)a4 traitCollection:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  v10 = +[NSBundle bundleForClass:objc_opt_class()];
  v11 = +[UIImage imageNamed:@"UniversalAddControlDownloadArrow" inBundle:v10 compatibleWithTraitCollection:v9];
  v12 = [v11 _flatImageWithColor:v7];

  v13 = +[UIImage imageNamed:@"UniversalAddControlDownloadCloud" inBundle:v10 compatibleWithTraitCollection:v9];
  v14 = [v13 _flatImageWithColor:v7];

  [v12 size];
  double v16 = v15;
  double v18 = v17;
  [v14 size];
  if (v16 < v19) {
    double v16 = v19;
  }
  if (v18 < v20) {
    double v18 = v20;
  }
  v21 = objc_opt_new();
  [v12 scale];
  objc_msgSend(v21, "setScale:");
  id v22 = objc_msgSend(objc_alloc((Class)UIGraphicsImageRenderer), "initWithSize:format:", v21, v16, v18);
  uint64_t v32 = 0;
  v33 = &v32;
  uint64_t v34 = 0x3032000000;
  v35 = sub_6D40;
  v36 = sub_6D50;
  id v37 = 0;
  v28[0] = _NSConcreteStackBlock;
  v28[1] = 3221225472;
  v28[2] = sub_6D58;
  v28[3] = &unk_10778;
  id v23 = v12;
  id v29 = v23;
  id v24 = v14;
  id v30 = v24;
  v31 = &v32;
  id v25 = [v22 imageWithActions:v28];
  id v26 = (id)v33[5];

  _Block_object_dispose(&v32, 8);

  return v26;
}

- (void)refreshCellContentsWithSpecifier:(id)a3
{
  id v4 = a3;
  v5 = +[UIFont preferredFontForTextStyle:UIFontTextStyleHeadline];
  [v5 _scaledValueForValue:15.0];
  v6 = +[UIFont boldSystemFontOfSize:](UIFont, "boldSystemFontOfSize:");
  id v7 = [(HOSHomeAppReinstallPreferencesCell *)self textLabel];
  [v7 setFont:v6];

  id v36 = +[UIFont preferredFontForTextStyle:UIFontTextStyleBody];

  [v36 _scaledValueForValue:13.0];
  id v8 = +[UIFont systemFontOfSize:](UIFont, "systemFontOfSize:");
  id v9 = [(HOSHomeAppReinstallPreferencesCell *)self detailTextLabel];
  [v9 setFont:v8];

  v10 = [v4 propertyForKey:PSTitleKey];
  v11 = [(HOSHomeAppReinstallPreferencesCell *)self textLabel];
  [v11 setText:v10];

  v12 = [v4 propertyForKey:PSTableCellSubtitleTextKey];
  v13 = [(HOSHomeAppReinstallPreferencesCell *)self detailTextLabel];
  [v13 setText:v12];

  v14 = [v4 propertyForKey:PSIconImageKey];
  double v15 = [(HOSHomeAppReinstallPreferencesCell *)self imageView];
  [v15 setImage:v14];

  double v16 = [(HOSHomeAppReinstallPreferencesCell *)self imageView];
  double v17 = [v16 layer];
  [v17 setMasksToBounds:1];

  double v18 = [(HOSHomeAppReinstallPreferencesCell *)self imageView];
  double v19 = [v18 layer];
  [v19 setBorderWidth:0.5];

  id v20 = +[UIColor systemGrayColor];
  id v21 = [v20 CGColor];
  id v22 = [(HOSHomeAppReinstallPreferencesCell *)self imageView];
  id v23 = [v22 layer];
  [v23 setBorderColor:v21];

  sub_71D8();
  LIIconContinuousCornerRadiusForVariant();
  double v25 = v24;
  id v26 = [(HOSHomeAppReinstallPreferencesCell *)self imageView];
  [v26 _setContinuousCornerRadius:v25];

  v27 = [(HOSHomeAppReinstallPreferencesCell *)self imageView];
  v28 = [v27 layer];
  LIIconContinuousCornerRadiusForVariant();
  objc_msgSend(v28, "setCornerRadius:");

  id v29 = [(HOSHomeAppReinstallPreferencesCell *)self imageView];
  id v30 = [v29 layer];
  [v30 setContinuousCorners:1];

  v31 = [v4 propertyForKey:HOSHomeAppReinstallPreferencesCellHomeAppInstallControllerSpecifierKey];

  [(HOSHomeAppReinstallPreferencesCell *)self setInstallController:v31];
  uint64_t v32 = objc_opt_new();
  [(HOSHomeAppReinstallPreferencesCell *)self setDownloadControl:v32];

  [(HOSHomeAppReinstallPreferencesCell *)self _updateDownloadControl:0];
  v33 = [(HOSHomeAppReinstallPreferencesCell *)self downloadControl];
  [v33 addTarget:self action:"_downloadHomeApp:" forEvents:64];

  uint64_t v34 = [(HOSHomeAppReinstallPreferencesCell *)self downloadControl];
  [v34 sizeToFit];

  v35 = [(HOSHomeAppReinstallPreferencesCell *)self downloadControl];
  [(HOSHomeAppReinstallPreferencesCell *)self setAccessoryView:v35];

  [(HOSHomeAppReinstallPreferencesCell *)self setSelectionStyle:0];
}

- (void)_updateDownloadControl:(BOOL)a3
{
  BOOL v3 = a3;
  id v5 = [(HOSHomeAppReinstallPreferencesCell *)self installController];
  -[HOSHomeAppReinstallPreferencesCell _updateDownloadControlWithInstallStatus:animated:](self, "_updateDownloadControlWithInstallStatus:animated:", [v5 status], v3);
}

- (void)_updateDownloadControlWithInstallStatus:(int64_t)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  switch(a3)
  {
    case -1:
      uint64_t v7 = 0;
      uint64_t v6 = 1;
      uint64_t v8 = 2;
      break;
    case 0:
      uint64_t v6 = 1;
      uint64_t v8 = 5;
      uint64_t v7 = 1;
      break;
    case 1:
      uint64_t v7 = 0;
      uint64_t v6 = 1;
      goto LABEL_7;
    case 2:
    case 3:
      uint64_t v6 = 0;
      uint64_t v7 = 0;
LABEL_7:
      uint64_t v8 = 3;
      break;
    default:
      uint64_t v7 = 0;
      uint64_t v8 = 1;
      uint64_t v6 = 1;
      break;
  }
  id v9 = [(HOSHomeAppReinstallPreferencesCell *)self downloadControl];
  [v9 setHidden:v7];

  v10 = [(HOSHomeAppReinstallPreferencesCell *)self downloadControl];
  [v10 setEnabled:v6];

  id v11 = [(HOSHomeAppReinstallPreferencesCell *)self downloadControl];
  objc_msgSend(v11, "setControlStatus:animated:", v8, 0x3FF0000000000000, v4);
}

- (void)_downloadHomeApp:(id)a3
{
  id v5 = [(HOSHomeAppReinstallPreferencesCell *)self installController];
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_7538;
  v10[3] = &unk_107A0;
  v10[4] = self;
  uint64_t v6 = [v5 downloadHomeAppWithUpdateBlock:v10];
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_7548;
  v9[3] = &unk_107C8;
  v9[4] = self;
  v9[5] = a2;
  uint64_t v7 = [v6 addFailureBlock:v9];
  id v8 = [v7 addSuccessBlock:&stru_10808];
}

- (HFHomeAppInstallController)installController
{
  return self->_installController;
}

- (void)setInstallController:(id)a3
{
}

- (HOSCloudDownloadControl)downloadControl
{
  return self->_downloadControl;
}

- (void)setDownloadControl:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_downloadControl, 0);

  objc_storeStrong((id *)&self->_installController, 0);
}

@end