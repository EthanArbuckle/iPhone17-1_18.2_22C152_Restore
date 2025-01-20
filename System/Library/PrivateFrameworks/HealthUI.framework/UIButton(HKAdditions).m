@interface UIButton(HKAdditions)
+ (id)hk_buttonTintedWithColor:()HKAdditions title:target:action:;
+ (id)hk_chartShowMoreDataButtonWithTitleOverride:()HKAdditions target:action:;
+ (id)hk_currentValueViewInfoButtonWithTarget:()HKAdditions action:;
+ (id)hk_multiLineRoundRectButtonTintedWithColor:()HKAdditions title:target:action:;
+ (id)hk_roundRectButtonTintedWithColor:()HKAdditions title:target:action:;
+ (id)imageWithFillColor:()HKAdditions;
@end

@implementation UIButton(HKAdditions)

+ (id)hk_buttonTintedWithColor:()HKAdditions title:target:action:
{
  id v9 = a5;
  id v10 = a4;
  id v11 = a3;
  v12 = +[HKDynamicButton buttonWithType:1];
  v13 = [v12 titleLabel];
  [v13 setNumberOfLines:0];

  v14 = [v12 titleLabel];
  [v14 setTextAlignment:1];

  v15 = [v12 titleLabel];
  [v15 setAllowsDefaultTighteningForTruncation:1];

  v16 = [v12 titleLabel];
  v17 = _HKMediumScaledPreferredBodyFontWithButton(v12);
  [v16 setFont:v17];

  [v12 setTranslatesAutoresizingMaskIntoConstraints:0];
  [v12 setTitle:v10 forState:0];

  [v12 setTitleColor:v11 forState:0];
  [v12 addTarget:v9 action:a6 forControlEvents:64];

  v18 = [v12 heightAnchor];
  v19 = [v12 titleLabel];
  objc_msgSend(v19, "sizeThatFits:", 288.0, 0.0);
  v21 = [v18 constraintEqualToConstant:v20 + 22.0];
  [v12 setHeightConstraint:v21];

  return v12;
}

+ (id)hk_roundRectButtonTintedWithColor:()HKAdditions title:target:action:
{
  id v9 = a5;
  id v10 = a4;
  id v11 = a3;
  v12 = +[HKColoredButton buttonWithType:1];
  [v12 setTranslatesAutoresizingMaskIntoConstraints:0];
  [v12 setTitle:v10 forState:0];

  v13 = [MEMORY[0x1E4FB1618] whiteColor];
  [v12 setTitleColor:v13 forState:0];

  v14 = [v12 titleLabel];
  [v14 setNumberOfLines:1];

  v15 = [v12 titleLabel];
  [v15 setTextAlignment:1];

  v16 = [v12 titleLabel];
  [v16 setAllowsDefaultTighteningForTruncation:1];

  v17 = [v12 titleLabel];
  v18 = _HKMediumScaledPreferredBodyFontWithValue(17.0);
  [v17 setFont:v18];

  [v12 setBackgroundColor:v11];
  if (v9 && a6) {
    [v12 addTarget:v9 action:a6 forControlEvents:64];
  }
  v19 = [v12 layer];
  [v19 setCornerRadius:14.0];

  double v20 = [v12 heightAnchor];
  v21 = [v20 constraintEqualToConstant:50.0];
  [v12 setHeightConstraint:v21];

  v22 = [v12 widthAnchor];
  v23 = [v22 constraintEqualToConstant:288.0];

  LODWORD(v24) = 1144750080;
  [v23 setPriority:v24];
  [v23 setActive:1];

  return v12;
}

+ (id)hk_multiLineRoundRectButtonTintedWithColor:()HKAdditions title:target:action:
{
  id v9 = a5;
  id v10 = a4;
  id v11 = a3;
  v12 = +[HKColoredButton buttonWithType:1];
  [v12 setTranslatesAutoresizingMaskIntoConstraints:0];
  [v12 setTitle:v10 forState:0];

  v13 = [MEMORY[0x1E4FB1618] whiteColor];
  [v12 setTitleColor:v13 forState:0];

  v14 = [v12 titleLabel];
  v15 = _HKMediumScaledPreferredBodyFontWithValue(17.0);
  [v14 setFont:v15];

  v16 = [v12 titleLabel];
  [v16 setNumberOfLines:0];

  v17 = [v12 titleLabel];
  [v17 setTextAlignment:1];

  [v12 setBackgroundColor:v11];
  [v12 addTarget:v9 action:a6 forControlEvents:64];

  v18 = [v12 layer];
  [v18 setCornerCurve:*MEMORY[0x1E4F39EA8]];

  v19 = [v12 layer];
  [v19 setCornerRadius:14.0];

  objc_msgSend(v12, "setContentEdgeInsets:", 11.0, 0.0, 11.0, 0.0);
  double v20 = [v12 heightAnchor];
  v21 = [v12 titleLabel];
  objc_msgSend(v21, "sizeThatFits:", 288.0, 0.0);
  double v23 = v22 + 22.0;

  double v24 = 50.0;
  if (v23 >= 50.0) {
    double v24 = v23;
  }
  v25 = [v20 constraintEqualToConstant:v24];
  [v12 setHeightConstraint:v25];

  v26 = [v12 widthAnchor];
  v27 = [v26 constraintEqualToConstant:288.0];

  LODWORD(v28) = 1144750080;
  [v27 setPriority:v28];
  [v27 setActive:1];

  return v12;
}

+ (id)imageWithFillColor:()HKAdditions
{
  id v3 = a3;
  v10.width = 1.0;
  v10.height = 1.0;
  UIGraphicsBeginImageContext(v10);
  CurrentContext = UIGraphicsGetCurrentContext();
  id v5 = v3;
  v6 = (CGColor *)[v5 CGColor];

  CGContextSetFillColorWithColor(CurrentContext, v6);
  v11.origin.x = 0.0;
  v11.origin.y = 0.0;
  v11.size.width = 1.0;
  v11.size.height = 1.0;
  CGContextFillRect(CurrentContext, v11);
  v7 = UIGraphicsGetImageFromCurrentImageContext();
  UIGraphicsEndImageContext();
  return v7;
}

+ (id)hk_currentValueViewInfoButtonWithTarget:()HKAdditions action:
{
  id v5 = (objc_class *)MEMORY[0x1E4FB14D0];
  id v6 = a3;
  v7 = objc_msgSend([v5 alloc], "initWithFrame:", 0.0, 0.0, 25.0, 25.0);
  [v7 setTranslatesAutoresizingMaskIntoConstraints:0];
  v8 = [MEMORY[0x1E4FB1830] configurationWithPointSize:25.0];
  id v9 = [MEMORY[0x1E4FB1818] systemImageNamed:@"info.circle" withConfiguration:v8];
  [v7 setImage:v9 forState:0];
  CGSize v10 = objc_msgSend(MEMORY[0x1E4FB1618], "hk_appTintColor");
  [v7 setTintColor:v10];

  [v7 setIsAccessibilityElement:1];
  CGRect v11 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.HealthUI"];
  v12 = [v11 localizedStringForKey:@"CURRENT_VALUE_INFO_BUTTON_ACCESSIBILITY_LABEL" value:&stru_1F3B9CF20 table:@"HealthUI-Localizable"];
  [v7 setAccessibilityLabel:v12];

  [v7 addTarget:v6 action:a4 forControlEvents:64];
  LODWORD(v13) = 1144750080;
  [v7 setContentHuggingPriority:0 forAxis:v13];

  return v7;
}

+ (id)hk_chartShowMoreDataButtonWithTitleOverride:()HKAdditions target:action:
{
  id v7 = a3;
  id v8 = a4;
  if (v7)
  {
    id v9 = v7;
  }
  else
  {
    CGSize v10 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.HealthUI"];
    id v9 = [v10 localizedStringForKey:@"SHOW_MORE_DATA" value:&stru_1F3B9CF20 table:@"HealthUI-Localizable"];
  }
  CGRect v11 = (void *)MEMORY[0x1E4FB14D0];
  v12 = objc_msgSend(MEMORY[0x1E4FB1618], "hk_appTintColor");
  double v13 = objc_msgSend(v11, "hk_buttonTintedWithColor:title:target:action:", v12, v9, v8, a5);

  v14 = objc_msgSend(NSString, "hk_chartOverlayAccessibilityIdentifier:", @"ShowMoreData");
  [v13 setAccessibilityIdentifier:v14];

  objc_msgSend(v13, "setContentEdgeInsets:", 16.0, 16.0, 16.0, 16.0);
  return v13;
}

@end