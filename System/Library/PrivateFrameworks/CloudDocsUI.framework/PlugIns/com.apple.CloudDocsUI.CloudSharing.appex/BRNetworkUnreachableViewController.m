@interface BRNetworkUnreachableViewController
- (UILabel)subtitleLabel;
- (UILabel)titleLabel;
- (id)initForInitialSharing:(BOOL)a3;
- (void)setSubtitleLabel:(id)a3;
- (void)setTitleLabel:(id)a3;
@end

@implementation BRNetworkUnreachableViewController

- (id)initForInitialSharing:(BOOL)a3
{
  v53.receiver = self;
  v53.super_class = (Class)BRNetworkUnreachableViewController;
  v4 = [(BRNetworkUnreachableViewController *)&v53 initWithNibName:0 bundle:0];
  if (v4)
  {
    v5 = +[UIColor systemBackgroundColor];
    v6 = [(BRNetworkUnreachableViewController *)v4 view];
    [v6 setBackgroundColor:v5];

    v7 = objc_opt_new();
    v54 = v7;
    v8 = +[NSArray arrayWithObjects:&v54 count:1];
    [(BRNetworkUnreachableViewController *)v4 setViewControllers:v8];

    v9 = +[NSBundle bundleWithIdentifier:@"com.apple.CloudDocsUI"];
    v10 = [v9 localizedStringForKey:@"SHARE_INITIAL_TITLE" value:@"Add People" table:@"Localizable"];
    [v7 setTitle:v10];

    uint64_t v11 = objc_opt_new();
    titleLabel = v4->_titleLabel;
    v4->_titleLabel = (UILabel *)v11;

    uint64_t v13 = objc_opt_new();
    subtitleLabel = v4->_subtitleLabel;
    v4->_subtitleLabel = (UILabel *)v13;

    [(UILabel *)v4->_titleLabel setNumberOfLines:0];
    [(UILabel *)v4->_subtitleLabel setNumberOfLines:0];
    [(UILabel *)v4->_titleLabel setTextAlignment:1];
    [(UILabel *)v4->_subtitleLabel setTextAlignment:1];
    v15 = +[UIFont systemFontOfSize:27.0 weight:UIFontWeightRegular];
    [(UILabel *)v4->_titleLabel setFont:v15];

    v16 = +[UIFont systemFontOfSize:17.0 weight:UIFontWeightRegular];
    [(UILabel *)v4->_subtitleLabel setFont:v16];

    v17 = +[UIColor secondaryLabelColor];
    [(UILabel *)v4->_titleLabel setTextColor:v17];
    [(UILabel *)v4->_subtitleLabel setTextColor:v17];
    [(UILabel *)v4->_titleLabel setTranslatesAutoresizingMaskIntoConstraints:0];
    [(UILabel *)v4->_subtitleLabel setTranslatesAutoresizingMaskIntoConstraints:0];
    v18 = +[NSBundle bundleWithIdentifier:@"com.apple.CloudDocsUI"];
    v19 = v18;
    if (a3)
    {
      v20 = [v18 localizedStringForKey:@"NETWORK_UNREACHABLE_INITIAL_TITLE" value:@"You’re Offline" table:@"Localizable"];
      [(UILabel *)v4->_titleLabel setText:v20];

      v21 = +[NSBundle bundleWithIdentifier:@"com.apple.CloudDocsUI"];
      v22 = v21;
      CFStringRef v23 = @"NETWORK_UNREACHABLE_INITIAL_SUBTITLE";
    }
    else
    {
      v24 = [v18 localizedStringForKey:@"NETWORK_UNREACHABLE_TITLE" value:@"You’re Offline" table:@"Localizable"];
      [(UILabel *)v4->_titleLabel setText:v24];

      v21 = +[NSBundle bundleWithIdentifier:@"com.apple.CloudDocsUI"];
      v22 = v21;
      CFStringRef v23 = @"NETWORK_UNREACHABLE_SUBTITLE";
    }
    v25 = [v21 localizedStringForKey:v23 value:@"Check your Internet connection." table:@"Localizable"];
    [(UILabel *)v4->_subtitleLabel setText:v25];

    v26 = [v7 view];
    [v26 addSubview:v4->_titleLabel];

    v27 = [v7 view];
    [v27 addSubview:v4->_subtitleLabel];

    v28 = objc_opt_new();
    v29 = [(UILabel *)v4->_titleLabel centerXAnchor];
    v30 = [v7 view];
    v31 = [v30 centerXAnchor];
    v32 = [v29 constraintEqualToAnchor:v31];
    [v28 addObject:v32];

    v33 = [(UILabel *)v4->_subtitleLabel centerXAnchor];
    v34 = [v7 view];
    v35 = [v34 centerXAnchor];
    v36 = [v33 constraintEqualToAnchor:v35];
    [v28 addObject:v36];

    v37 = [(UILabel *)v4->_subtitleLabel firstBaselineAnchor];
    v38 = [(UILabel *)v4->_titleLabel lastBaselineAnchor];
    v39 = [v37 constraintEqualToAnchor:v38 constant:32.0];
    [v28 addObject:v39];

    v40 = [(UILabel *)v4->_subtitleLabel centerYAnchor];
    v41 = [v7 view];
    v42 = [v41 centerYAnchor];
    v43 = [v40 constraintEqualToAnchor:v42];
    [v28 addObject:v43];

    v44 = [(UILabel *)v4->_titleLabel widthAnchor];
    v45 = [v7 view];
    v46 = [v45 widthAnchor];
    v47 = [v44 constraintEqualToAnchor:v46 multiplier:0.800000012];
    [v28 addObject:v47];

    v48 = [(UILabel *)v4->_subtitleLabel widthAnchor];
    v49 = [v7 view];
    v50 = [v49 widthAnchor];
    v51 = [v48 constraintEqualToAnchor:v50 multiplier:0.800000012];
    [v28 addObject:v51];

    +[NSLayoutConstraint activateConstraints:v28];
  }
  return v4;
}

- (UILabel)titleLabel
{
  return self->_titleLabel;
}

- (void)setTitleLabel:(id)a3
{
}

- (UILabel)subtitleLabel
{
  return self->_subtitleLabel;
}

- (void)setSubtitleLabel:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_subtitleLabel, 0);

  objc_storeStrong((id *)&self->_titleLabel, 0);
}

@end