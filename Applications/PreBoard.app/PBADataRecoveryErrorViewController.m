@interface PBADataRecoveryErrorViewController
- (BOOL)_canShowWhileLocked;
- (void)loadView;
@end

@implementation PBADataRecoveryErrorViewController

- (void)loadView
{
  id v3 = objc_alloc((Class)UIView);
  double y = CGRectZero.origin.y;
  double width = CGRectZero.size.width;
  double height = CGRectZero.size.height;
  id v17 = [v3 initWithFrame:CGRectZero.origin.x, y, width, height];
  id v7 = [objc_alloc((Class)UILabel) initWithFrame:CGRectZero.origin.x, y, width, height];
  v8 = +[NSBundle mainBundle];
  v9 = +[UIDevice modelSpecificLocalizedStringKeyForKey:@"PREBOARD_RECOVERY_GIVE_UP"];
  v10 = [v8 localizedStringForKey:v9 value:&stru_10001CD78 table:@"PreBoard"];
  [v7 setText:v10];

  [v7 setTranslatesAutoresizingMaskIntoConstraints:0];
  [v7 setNumberOfLines:0];
  [v7 setTextAlignment:1];
  [v17 addSubview:v7];
  v11 = [v7 centerXAnchor];
  v12 = [v17 centerXAnchor];
  v13 = [v11 constraintEqualToAnchor:v12];
  [v13 setActive:1];

  v14 = [v7 centerYAnchor];
  v15 = [v17 centerYAnchor];
  v16 = [v14 constraintEqualToAnchor:v15 constant:-20.0];
  [v16 setActive:1];

  [(PBADataRecoveryErrorViewController *)self setView:v17];
}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

@end