@interface SUSUIVerifyingAlertExtensionViewController
+ (BOOL)_isSecureForRemoteViewService;
- (BOOL)_canShowWhileLocked;
- (id)viewForAlert;
- (void)loadView;
@end

@implementation SUSUIVerifyingAlertExtensionViewController

- (void)loadView
{
  NSLog(@"Loading Verify View", a2);
  id v3 = [(SUSUIVerifyingAlertExtensionViewController *)self viewForAlert];
  [(SUSUIVerifyingAlertExtensionViewController *)self setView:v3];
}

- (id)viewForAlert
{
  v2 = [(SUSUIVerifyingAlertExtensionViewController *)self extensionContext];
  id v3 = [v2 inputItems];

  if (v3)
  {
    if ([v3 count])
    {
      v4 = [v3 objectAtIndexedSubscript:0];
      if (v4)
      {
        v5 = v4;
        v6 = [v4 userInfo];
        if (v6)
        {
          v7 = v6;
          v8 = [v6 objectForKeyedSubscript:@"ExtensionAlertKeyVerifyingText"];

          if (v8) {
            goto LABEL_11;
          }
        }
        else
        {
        }
      }
    }
  }
  if (qword_100008670 != -1) {
    dispatch_once(&qword_100008670, &stru_100004168);
  }
  v8 = [(id)qword_100008668 localizedStringForKey:@"SOFTWARE_UPDATE_VERIFYING_ALERT_BODY" value:&stru_100004308 table:@"ui_alerts"];
LABEL_11:
  id v9 = [objc_alloc((Class)UIActivityIndicatorView) initWithActivityIndicatorStyle:100];
  v10 = +[UIColor systemGrayColor];
  [v9 setColor:v10];

  [v9 setTranslatesAutoresizingMaskIntoConstraints:0];
  LODWORD(v11) = 1144750080;
  [v9 setContentHuggingPriority:0 forAxis:v11];
  [v9 startAnimating];
  v12 = +[UIFontDescriptor preferredFontDescriptorWithTextStyle:UIFontTextStyleBody];
  v13 = [v12 fontDescriptorWithSymbolicTraits:2];

  v14 = +[UIFont fontWithDescriptor:v13 size:0.0];
  id v15 = [objc_alloc((Class)UILabel) initWithFrame:0.0, 0.0, 0.0, 0.0];
  [v15 setTranslatesAutoresizingMaskIntoConstraints:0];
  [v15 setFont:v14];
  [v15 setLineBreakMode:2];
  [v15 setAdjustsFontSizeToFitWidth:1];
  [v15 setText:v8];
  LODWORD(v16) = 1132134400;
  [v15 setContentHuggingPriority:0 forAxis:v16];
  id v17 = objc_alloc_init((Class)UIView);
  id v18 = objc_alloc((Class)UIStackView);
  v26[0] = v9;
  v26[1] = v15;
  v19 = +[NSArray arrayWithObjects:v26 count:2];
  id v20 = [v18 initWithArrangedSubviews:v19];

  [v17 addSubview:v20];
  [v20 setAxis:0];
  [v20 setDistribution:2];
  [v20 setAlignment:3];
  [v20 setSpacing:1.17549435e-38];
  [v20 setLayoutMarginsRelativeArrangement:1];
  [v20 setTranslatesAutoresizingMaskIntoConstraints:0];
  v21 = +[NSLayoutConstraint constraintWithItem:v20 attribute:10 relatedBy:0 toItem:v17 attribute:10 multiplier:1.0 constant:0.0];
  [v17 addConstraint:v21];

  v22 = +[NSLayoutConstraint constraintWithItem:v20 attribute:9 relatedBy:0 toItem:v17 attribute:9 multiplier:1.0 constant:0.0];
  [v17 addConstraint:v22];

  v23 = +[NSLayoutConstraint constraintWithItem:v20 attribute:7 relatedBy:-1 toItem:v17 attribute:7 multiplier:0.899999976 constant:0.0];
  [v17 addConstraint:v23];

  -[SUSUIVerifyingAlertExtensionViewController setPreferredContentSize:](self, "setPreferredContentSize:", 260.0, 95.0);

  return v17;
}

+ (BOOL)_isSecureForRemoteViewService
{
  return 1;
}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

@end