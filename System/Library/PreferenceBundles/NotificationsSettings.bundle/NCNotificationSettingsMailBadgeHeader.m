@interface NCNotificationSettingsMailBadgeHeader
- (NCNotificationSettingsMailBadgeHeader)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4 specifier:(id)a5;
@end

@implementation NCNotificationSettingsMailBadgeHeader

- (NCNotificationSettingsMailBadgeHeader)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4 specifier:(id)a5
{
  v36.receiver = self;
  v36.super_class = (Class)NCNotificationSettingsMailBadgeHeader;
  v5 = [(NCNotificationSettingsMailBadgeHeader *)&v36 initWithStyle:a3 reuseIdentifier:a4 specifier:a5];
  v6 = v5;
  if (v5)
  {
    v7 = [(NCNotificationSettingsMailBadgeHeader *)v5 contentView];
    [(NCNotificationSettingsMailBadgeHeader *)v6 setTranslatesAutoresizingMaskIntoConstraints:0];
    id v8 = objc_alloc_init((Class)UIStackView);
    [v8 setTranslatesAutoresizingMaskIntoConstraints:0];
    [v8 setAxis:1];
    [v8 setSpacing:12.0];
    objc_msgSend(v8, "setLayoutMargins:", 25.0, 25.0, 25.0, 25.0);
    [v7 addSubview:v8];
    v9 = +[NSBundle bundleForClass:objc_opt_class()];
    v34 = +[UIImage imageNamed:@"mailBadgeHeader" inBundle:v9];

    id v10 = [objc_alloc((Class)UIImageView) initWithImage:v34];
    [v10 setTranslatesAutoresizingMaskIntoConstraints:0];
    [v10 setContentMode:1];
    v33 = v10;
    [v8 addArrangedSubview:v10];
    id v11 = objc_alloc_init((Class)UILabel);
    v12 = +[UIFont preferredFontForTextStyle:UIFontTextStyleSubheadline];
    [v11 setFont:v12];

    v13 = +[UIColor secondaryLabelColor];
    [v11 setTextColor:v13];

    v14 = +[NSBundle bundleWithIdentifier:@"com.apple.NotificationsSettings"];
    v15 = [v14 localizedStringForKey:@"BADGES_GROUP_HEADER" value:&stru_419A0 table:@"NotificationsSettings"];
    [v11 setText:v15];

    [v11 setTextAlignment:1];
    [v11 setNumberOfLines:10];
    [v8 addArrangedSubview:v11];
    v32 = [v10 heightAnchor];
    v31 = [v32 constraintEqualToConstant:80.0];
    v37[0] = v31;
    v30 = [v8 topAnchor];
    v29 = [v7 topAnchor];
    v28 = [v30 constraintEqualToAnchor:v29 constant:25.0];
    v37[1] = v28;
    v26 = [v8 leadingAnchor];
    v25 = [v7 leadingAnchor];
    v16 = [v26 constraintEqualToAnchor:v25 constant:20.0];
    v37[2] = v16;
    v27 = v7;
    v17 = [v7 trailingAnchor];
    v18 = [v8 trailingAnchor];
    [v17 constraintEqualToAnchor:v18 constant:20.0];
    v19 = v35 = v6;
    v37[3] = v19;
    v20 = [v7 bottomAnchor];
    v21 = [v8 bottomAnchor];
    v22 = [v20 constraintEqualToAnchor:v21 constant:25.0];
    v37[4] = v22;
    v23 = +[NSArray arrayWithObjects:v37 count:5];
    +[NSLayoutConstraint activateConstraints:v23];

    v6 = v35;
  }
  return v6;
}

@end