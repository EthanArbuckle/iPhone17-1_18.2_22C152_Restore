@interface WetNotificationViewController
- (CGSize)preferredContentSize;
- (void)loadView;
- (void)viewDidLayoutSubviews;
- (void)viewWillLayoutSubviews;
@end

@implementation WetNotificationViewController

- (void)loadView
{
  v42.receiver = self;
  v42.super_class = (Class)WetNotificationViewController;
  [(WetNotificationViewController *)&v42 loadView];
  v3 = [(WetNotificationViewController *)self extensionContext];
  v4 = [v3 inputItems];
  v5 = [v4 firstObject];

  v41 = v5;
  v6 = [v5 userInfo];
  v7 = +[NSBundle mainBundle];
  unsigned int v8 = safeBoolValue(v6, @"legacy");
  unsigned int v9 = safeBoolValue(v6, @"typeC");
  unsigned int v10 = safeBoolValue(v6, @"chargerConnected");
  unsigned int v11 = safeBoolValue(v6, @"reinsertion");
  id v40 = objc_msgSend(objc_alloc((Class)UIView), "initWithFrame:", 0.0, 0.0, 250.0, 1000.0);
  -[WetNotificationViewController setView:](self, "setView:");
  id v12 = objc_alloc((Class)UIImageView);
  v13 = +[UIImage imageNamed:@"titleImage"];
  v14 = (UIImageView *)[v12 initWithImage:v13];
  imageView = self->_imageView;
  self->_imageView = v14;

  v16 = [(WetNotificationViewController *)self view];
  [v16 addSubview:self->_imageView];

  if (v8)
  {
    v17 = safeLocalizedString(v7, @"WETMSG_DIALOG_HEADER_LEGACY", @"Liquid Detected");
    CFStringRef v18 = @"WETMSG_DIALOG_BODY_LEGACY";
LABEL_3:
    v19 = @"Liquid has been detected in the Lightning connector. Disconnect to allow the connector to dry. Charging now may damage your iPhone.";
LABEL_4:
    v20 = safeLocalizedString(v7, (uint64_t)v18, v19);
    goto LABEL_5;
  }
  if (!v9)
  {
    if (v10)
    {
      v17 = safeLocalizedString(v7, @"WETMSG_DIALOG_HEADER", @"Charging Not Available");
      if (!v11)
      {
        CFStringRef v18 = @"WETMSG_DIALOG_BODY_INSERTION";
        v19 = @"Liquid has been detected in the Lightning connector. Disconnect to allow the connector to dry. This may take several hours.";
        goto LABEL_4;
      }
      CFStringRef v18 = @"WETMSG_DIALOG_BODY_REINSERTION";
      goto LABEL_3;
    }
    v17 = safeLocalizedString(v7, @"WETMSG_DIALOG_NONCHARGING_HEADER", @"Liquid Detected in Lightning Connector");
    if (v11)
    {
      CFStringRef v18 = @"WETMSG_DIALOG_NONCHARGING_BODY_REINSERTION";
      goto LABEL_17;
    }
    CFStringRef v18 = @"WETMSG_DIALOG_NONCHARGING_BODY_INSERTION";
LABEL_23:
    v19 = @"Disconnect to allow the connector to dry. This may take several hours.";
    goto LABEL_4;
  }
  if (!v10)
  {
    v17 = safeLocalizedString(v7, @"WETMSG_DIALOG_NONCHARGING_HEADER_TYPEC", @"Liquid Detected in\nUSB-C Connector");
    if (v11)
    {
      CFStringRef v18 = @"WETMSG_DIALOG_NONCHARGING_BODY_REINSERTION_TYPEC";
LABEL_17:
      v19 = @"Disconnect to allow the connector to dry.";
      goto LABEL_4;
    }
    CFStringRef v18 = @"WETMSG_DIALOG_NONCHARGING_BODY_INSERTION_TYPEC";
    goto LABEL_23;
  }
  v17 = safeLocalizedString(v7, @"WETMSG_DIALOG_HEADER_TYPEC", @"Liquid Detected");
  if (v11)
  {
    v38 = +[UIDevice modelSpecificLocalizedStringKeyForKey:@"WETMSG_DIALOG_BODY_REINSERTION_TYPEC"];
    v39 = @"Disconnect cable from charger and device. Unplug charger and allow all connectors to dry. Charging now may damage your device.";
  }
  else
  {
    v38 = +[UIDevice modelSpecificLocalizedStringKeyForKey:@"WETMSG_DIALOG_BODY_INSERTION_TYPEC"];
    v39 = @"Disconnect cable from charger and device. Unplug charger and allow all connectors to dry. This may take several hours.";
  }
  v20 = safeLocalizedString(v7, (uint64_t)v38, v39);

LABEL_5:
  id v21 = objc_alloc((Class)UILabel);
  v22 = [(WetNotificationViewController *)self view];
  [v22 bounds];
  v23 = (UILabel *)objc_msgSend(v21, "initWithFrame:");
  titleLabel = self->_titleLabel;
  self->_titleLabel = v23;

  [(UILabel *)self->_titleLabel setTextAlignment:1];
  v25 = self->_titleLabel;
  v26 = +[UIFont boldSystemFontOfSize:17.0];
  [(UILabel *)v25 setFont:v26];

  v27 = self->_titleLabel;
  v28 = +[UIColor systemRedColor];
  [(UILabel *)v27 setTextColor:v28];

  [(UILabel *)self->_titleLabel setText:v17];
  [(UILabel *)self->_titleLabel setLineBreakMode:0];
  [(UILabel *)self->_titleLabel setNumberOfLines:2];
  [(UILabel *)self->_titleLabel sizeToFit];
  v29 = [(WetNotificationViewController *)self view];
  [v29 addSubview:self->_titleLabel];

  v30 = (UILabel *)objc_msgSend(objc_alloc((Class)UILabel), "initWithFrame:", 0.0, 0.0, 230.0, 3.40282347e38);
  bodyLabel = self->_bodyLabel;
  self->_bodyLabel = v30;

  [(UILabel *)self->_bodyLabel setTextAlignment:1];
  v32 = self->_bodyLabel;
  v33 = +[UIFont systemFontOfSize:13.0];
  [(UILabel *)v32 setFont:v33];

  v34 = self->_bodyLabel;
  v35 = +[UIColor labelColor];
  [(UILabel *)v34 setTextColor:v35];

  [(UILabel *)self->_bodyLabel setText:v20];
  [(UILabel *)self->_bodyLabel setLineBreakMode:0];
  [(UILabel *)self->_bodyLabel setNumberOfLines:0];
  [(UILabel *)self->_bodyLabel sizeToFit];
  v36 = [(WetNotificationViewController *)self view];
  [v36 addSubview:self->_bodyLabel];

  v37 = [(WetNotificationViewController *)self view];
  [v37 setNeedsLayout];

  [(WetNotificationViewController *)self invalidatePreferredContentSize];
}

- (CGSize)preferredContentSize
{
  v2 = [(WetNotificationViewController *)self view];
  [v2 bounds];
  double v4 = v3;
  double v6 = v5;

  double v7 = v4;
  double v8 = v6;
  result.height = v8;
  result.width = v7;
  return result;
}

- (void)viewWillLayoutSubviews
{
  double v3 = [(WetNotificationViewController *)self view];
  [v3 bounds];
  double v5 = v4;

  [(UIImageView *)self->_imageView bounds];
  -[UIImageView setFrame:](self->_imageView, "setFrame:", (v5 - v6) * 0.5, 19.0);
  [(UIImageView *)self->_imageView frame];
  double v8 = v7;
  double v10 = v9;
  [(UILabel *)self->_titleLabel bounds];
  -[UILabel setFrame:](self->_titleLabel, "setFrame:", (v5 - v11) * 0.5, v10 + v8 + 9.0);
  [(UILabel *)self->_titleLabel frame];
  double v13 = v12;
  double v15 = v14;
  [(UILabel *)self->_bodyLabel bounds];
  -[UILabel setFrame:](self->_bodyLabel, "setFrame:", (v5 - v16) * 0.5, v15 + v13 + 7.0);
  v17.receiver = self;
  v17.super_class = (Class)WetNotificationViewController;
  [(WetNotificationViewController *)&v17 viewWillLayoutSubviews];
}

- (void)viewDidLayoutSubviews
{
  double v3 = [(WetNotificationViewController *)self view];
  [(UILabel *)self->_bodyLabel bounds];
  double v5 = v4;
  [(UILabel *)self->_titleLabel bounds];
  double v7 = v5 + v6;
  [(UIImageView *)self->_imageView bounds];
  objc_msgSend(v3, "setFrame:", 0.0, 0.0, 250.0, v7 + v8 + 59.0);

  v9.receiver = self;
  v9.super_class = (Class)WetNotificationViewController;
  [(WetNotificationViewController *)&v9 viewDidLayoutSubviews];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_bodyLabel, 0);
  objc_storeStrong((id *)&self->_titleLabel, 0);
  objc_storeStrong((id *)&self->_imageView, 0);
}

@end