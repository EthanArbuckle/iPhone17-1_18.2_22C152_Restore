@interface CLVanillaWhenInUseAuthPromptPluginViewController
- (NSString)pillButtonTitleOnlyHere;
- (NSString)pillButtonTitlePreciseOff;
- (NSString)pillButtonTitlePreciseOn;
- (UIButton)pillButton;
- (UIImage)locationIcon;
- (void)_addPillButton;
- (void)_setConstraints;
- (void)_setDynamicTitleAndIconForButton;
- (void)_setPreciseButtonPadding;
- (void)_stylePreciseOnButton;
- (void)loadView;
- (void)pillButtonOnAction:(id)a3;
- (void)setLocationIcon:(id)a3;
- (void)setPillButton:(id)a3;
- (void)setPillButtonTitleOnlyHere:(id)a3;
- (void)setPillButtonTitlePreciseOff:(id)a3;
- (void)setPillButtonTitlePreciseOn:(id)a3;
@end

@implementation CLVanillaWhenInUseAuthPromptPluginViewController

- (void)loadView
{
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_INFO, "#CLVanillaWhenInUseAuthPromptPluginViewController loadView<Start>", buf, 2u);
  }
  v10.receiver = self;
  v10.super_class = (Class)CLVanillaWhenInUseAuthPromptPluginViewController;
  [(CLAuthWithPreciseSettingBaseViewController *)&v10 loadView];
  v3 = [(CLAuthBaseViewController *)self locationDictionary];
  v4 = [v3 objectForKeyedSubscript:@"PreciseButtonOnTitle"];
  [(CLVanillaWhenInUseAuthPromptPluginViewController *)self setPillButtonTitlePreciseOn:v4];

  v5 = [(CLAuthBaseViewController *)self locationDictionary];
  v6 = [v5 objectForKeyedSubscript:@"PreciseButtonOffTitle"];
  [(CLVanillaWhenInUseAuthPromptPluginViewController *)self setPillButtonTitlePreciseOff:v6];

  v7 = [(CLAuthBaseViewController *)self locationDictionary];
  v8 = [v7 objectForKeyedSubscript:@"OnlyHereTitle"];
  [(CLVanillaWhenInUseAuthPromptPluginViewController *)self setPillButtonTitleOnlyHere:v8];

  [(CLVanillaWhenInUseAuthPromptPluginViewController *)self _addPillButton];
  [(CLAuthWithPreciseSettingBaseViewController *)self updateMapZoomAccordinglyForPreciseSetting];
  v9 = [(CLAuthBaseViewController *)self mapView];
  [v9 setUserTrackingMode:1 animated:0];
}

- (void)pillButtonOnAction:(id)a3
{
  [(CLAuthWithPreciseSettingBaseViewController *)self pillButtonToggled];

  [(CLVanillaWhenInUseAuthPromptPluginViewController *)self _stylePreciseOnButton];
}

- (void)_setDynamicTitleAndIconForButton
{
  id v18 = +[UIFont systemFontOfSize:13.0 weight:UIFontWeightSemibold];
  v3 = +[UIFontMetrics metricsForTextStyle:UIFontTextStyleSubheadline];
  v4 = [v3 scaledFontForFont:v18];
  v5 = [(CLVanillaWhenInUseAuthPromptPluginViewController *)self pillButton];
  v6 = [v5 titleLabel];
  [v6 setFont:v4];

  v7 = [(CLVanillaWhenInUseAuthPromptPluginViewController *)self pillButton];
  v8 = [v7 titleLabel];
  [v8 setAdjustsFontForContentSizeCategory:1];

  v9 = [(CLVanillaWhenInUseAuthPromptPluginViewController *)self pillButton];
  objc_super v10 = [v9 titleLabel];
  [v10 setLineBreakMode:4];

  v11 = +[UIColor systemBackgroundColor];
  v12 = [(CLVanillaWhenInUseAuthPromptPluginViewController *)self pillButton];
  [v12 setBackgroundColor:v11];

  v13 = +[UIFont systemFontOfSize:10.0 weight:UIFontWeightSemibold];
  v14 = +[UIFontMetrics metricsForTextStyle:UIFontTextStyleSubheadline];
  v15 = [v14 scaledFontForFont:v13];

  [v15 pointSize];
  v16 = +[UIImageSymbolConfiguration configurationWithPointSize:weight:scale:](UIImageSymbolConfiguration, "configurationWithPointSize:weight:scale:", 6, -1);
  v17 = +[UIImage systemImageNamed:@"location.fill" withConfiguration:v16];
  [(CLVanillaWhenInUseAuthPromptPluginViewController *)self setLocationIcon:v17];
}

- (void)_setPreciseButtonPadding
{
  [(CLVanillaWhenInUseAuthPromptPluginViewController *)self _setDynamicTitleAndIconForButton];
  id v47 = [(CLVanillaWhenInUseAuthPromptPluginViewController *)self pillButton];
  v3 = [v47 imageView];
  [v3 setContentMode:1];

  id v48 = +[UIColor systemBackgroundColor];
  v4 = [(CLVanillaWhenInUseAuthPromptPluginViewController *)self pillButton];
  [v4 setBackgroundColor:v48];

  id v49 = [(CLVanillaWhenInUseAuthPromptPluginViewController *)self pillButton];
  v5 = [v49 titleLabel];
  v6 = [v5 font];
  [v6 lineHeight];
  double v8 = v7;

  id v50 = [(CLVanillaWhenInUseAuthPromptPluginViewController *)self pillButton];
  v9 = [v50 layer];
  double v10 = v8 + 4.0 + 4.0;
  [v9 setCornerRadius:v10 * 0.5];

  id v51 = [(CLVanillaWhenInUseAuthPromptPluginViewController *)self pillButton];
  [v51 setClipsToBounds:1];

  id v52 = [(CLVanillaWhenInUseAuthPromptPluginViewController *)self pillButton];
  v11 = [v52 imageView];
  [v11 setTranslatesAutoresizingMaskIntoConstraints:0];

  id v53 = [(CLVanillaWhenInUseAuthPromptPluginViewController *)self pillButton];
  v12 = [v53 titleLabel];
  v13 = [v12 font];
  [v13 lineHeight];
  double v15 = v14;

  id v54 = [(CLVanillaWhenInUseAuthPromptPluginViewController *)self pillButton];
  v16 = [v54 titleLabel];
  v17 = [v16 font];
  [v17 lineHeight];
  double v19 = v18;

  id v55 = [(CLVanillaWhenInUseAuthPromptPluginViewController *)self pillButton];
  v20 = [v55 titleLabel];
  v21 = [v20 font];
  [v21 lineHeight];
  double v23 = v22;

  id v56 = [(CLVanillaWhenInUseAuthPromptPluginViewController *)self locationIcon];
  [v56 size];
  double v25 = v24;

  id v57 = [(CLVanillaWhenInUseAuthPromptPluginViewController *)self pillButton];
  v26 = [v57 heightAnchor];
  v27 = [v26 constraintEqualToConstant:v10];
  [v27 setActive:1];

  id v58 = [(CLVanillaWhenInUseAuthPromptPluginViewController *)self pillButton];
  v28 = [v58 leadingAnchor];
  v29 = [(CLVanillaWhenInUseAuthPromptPluginViewController *)self pillButton];
  v30 = [v29 imageView];
  v31 = [v30 leadingAnchor];
  v32 = [v28 constraintEqualToAnchor:v31 constant:-(v15 * 0.5)];
  [v32 setActive:1];

  id v59 = [(CLVanillaWhenInUseAuthPromptPluginViewController *)self pillButton];
  v33 = [v59 imageView];
  v34 = [v33 leadingAnchor];
  v35 = [(CLVanillaWhenInUseAuthPromptPluginViewController *)self pillButton];
  v36 = [v35 titleLabel];
  v37 = [v36 leadingAnchor];
  double v38 = v23 * 0.25;
  v39 = [v34 constraintEqualToAnchor:v37 constant:-(v38 + v25)];
  [v39 setActive:1];

  id v60 = [(CLVanillaWhenInUseAuthPromptPluginViewController *)self pillButton];
  objc_msgSend(v60, "setContentEdgeInsets:", 0.0, v15 * 0.5 + v38, 0.0, v19 * 0.5);

  id v61 = [(CLVanillaWhenInUseAuthPromptPluginViewController *)self pillButton];
  v40 = [v61 titleLabel];
  v41 = [v40 topAnchor];
  v42 = [(CLVanillaWhenInUseAuthPromptPluginViewController *)self pillButton];
  v43 = [v42 topAnchor];
  v44 = [v41 constraintEqualToAnchor:v43 constant:4.0];
  [v44 setActive:1];

  id v62 = [(CLVanillaWhenInUseAuthPromptPluginViewController *)self view];
  UIUserInterfaceLayoutDirection v45 = +[UIView userInterfaceLayoutDirectionForSemanticContentAttribute:](UIView, "userInterfaceLayoutDirectionForSemanticContentAttribute:", [v62 semanticContentAttribute]);

  id v63 = [(CLVanillaWhenInUseAuthPromptPluginViewController *)self pillButton];
  [v63 imageView];
  if (v45 == UIUserInterfaceLayoutDirectionRightToLeft) {
    v46 = {;
  }
    [v46 setContentMode:8];
  }
  else {
    v46 = {;
  }
    [v46 setContentMode:7];
  }

  id v64 = [(CLVanillaWhenInUseAuthPromptPluginViewController *)self pillButton];
  [v64 setContentMode:4];
}

- (void)_stylePreciseOnButton
{
  [(CLVanillaWhenInUseAuthPromptPluginViewController *)self _setDynamicTitleAndIconForButton];
  id v24 = [(CLVanillaWhenInUseAuthPromptPluginViewController *)self pillButton];
  v3 = [v24 layer];
  LODWORD(v4) = 4.0;
  [v3 setShadowOpacity:v4];

  id v25 = [(CLVanillaWhenInUseAuthPromptPluginViewController *)self pillButton];
  v5 = [v25 layer];
  [v5 setShadowRadius:2.0];

  id v26 = +[UIColor colorWithRed:0.0 green:0.0 blue:0.0 alpha:0.08];
  id v6 = [v26 CGColor];
  double v7 = [(CLVanillaWhenInUseAuthPromptPluginViewController *)self pillButton];
  double v8 = [v7 layer];
  [v8 setShadowColor:v6];

  id v27 = [(CLVanillaWhenInUseAuthPromptPluginViewController *)self pillButton];
  v9 = [v27 layer];
  objc_msgSend(v9, "setShadowOffset:", 0.0, 2.0);

  id v28 = [(CLVanillaWhenInUseAuthPromptPluginViewController *)self pillButton];
  double v10 = [v28 layer];
  [v10 setMasksToBounds:0];

  id v29 = [(CLVanillaWhenInUseAuthPromptPluginViewController *)self pillButton];
  v11 = [v29 titleLabel];
  LODWORD(v12) = 1036831949;
  [v11 _setHyphenationFactor:v12];

  if ([(CLAuthWithPreciseSettingBaseViewController *)self pillButtonState] == 1)
  {
    id v30 = [(CLVanillaWhenInUseAuthPromptPluginViewController *)self pillButton];
    v13 = [v30 imageView];
    double v14 = +[UIColor systemBlueColor];
    [v13 setTintColor:v14];

    id v31 = [(CLVanillaWhenInUseAuthPromptPluginViewController *)self pillButton];
    double v15 = [(CLVanillaWhenInUseAuthPromptPluginViewController *)self pillButtonTitlePreciseOn];
    [v31 setTitle:v15 forState:0];

    id v32 = [(CLVanillaWhenInUseAuthPromptPluginViewController *)self pillButton];
    v16 = +[UIColor systemBlueColor];
    [v32 setTitleColor:v16 forState:0];
  }
  else if ([(CLAuthWithPreciseSettingBaseViewController *)self pillButtonState] == 2)
  {
    id v33 = [(CLVanillaWhenInUseAuthPromptPluginViewController *)self pillButton];
    v17 = [v33 imageView];
    double v18 = +[UIColor grayColor];
    [v17 setTintColor:v18];

    id v34 = [(CLVanillaWhenInUseAuthPromptPluginViewController *)self pillButton];
    double v19 = [(CLVanillaWhenInUseAuthPromptPluginViewController *)self pillButtonTitlePreciseOff];
    [v34 setTitle:v19 forState:0];

    id v32 = [(CLVanillaWhenInUseAuthPromptPluginViewController *)self pillButton];
    v16 = +[UIColor systemGrayColor];
    [v32 setTitleColor:v16 forState:0];
  }
  else
  {
    if ([(CLAuthWithPreciseSettingBaseViewController *)self pillButtonState] != 3) {
      goto LABEL_8;
    }
    id v35 = [(CLVanillaWhenInUseAuthPromptPluginViewController *)self pillButton];
    v20 = [v35 imageView];
    v21 = +[UIColor systemBlueColor];
    [v20 setTintColor:v21];

    id v36 = [(CLVanillaWhenInUseAuthPromptPluginViewController *)self pillButton];
    double v22 = [(CLVanillaWhenInUseAuthPromptPluginViewController *)self pillButtonTitleOnlyHere];
    [v36 setTitle:v22 forState:0];

    id v32 = [(CLVanillaWhenInUseAuthPromptPluginViewController *)self pillButton];
    v16 = +[UIColor systemBlueColor];
    [v32 setTitleColor:v16 forState:0];
  }

LABEL_8:
  id v37 = [(CLVanillaWhenInUseAuthPromptPluginViewController *)self pillButton];
  double v23 = [(CLVanillaWhenInUseAuthPromptPluginViewController *)self locationIcon];
  [v37 setImage:v23 forState:0];
}

- (void)_addPillButton
{
  id v3 = objc_alloc_init((Class)UIButton);
  [(CLVanillaWhenInUseAuthPromptPluginViewController *)self setPillButton:v3];

  [(CLVanillaWhenInUseAuthPromptPluginViewController *)self _setPreciseButtonPadding];
  [(CLVanillaWhenInUseAuthPromptPluginViewController *)self _stylePreciseOnButton];
  double v4 = [(CLVanillaWhenInUseAuthPromptPluginViewController *)self pillButton];
  [v4 addTarget:self action:"pillButtonOnAction:" forControlEvents:64];

  v5 = [(CLVanillaWhenInUseAuthPromptPluginViewController *)self view];
  id v6 = [(CLVanillaWhenInUseAuthPromptPluginViewController *)self pillButton];
  [v5 addSubview:v6];

  [(CLVanillaWhenInUseAuthPromptPluginViewController *)self _setConstraints];
}

- (void)_setConstraints
{
  id v22 = [(CLVanillaWhenInUseAuthPromptPluginViewController *)self pillButton];
  [v22 setTranslatesAutoresizingMaskIntoConstraints:0];

  id v23 = [(CLVanillaWhenInUseAuthPromptPluginViewController *)self pillButton];
  id v3 = [v23 leadingAnchor];
  double v4 = [(CLVanillaWhenInUseAuthPromptPluginViewController *)self view];
  v5 = [v4 leadingAnchor];
  id v6 = [v3 constraintEqualToAnchor:v5 constant:8.0];
  [v6 setActive:1];

  id v24 = [(CLVanillaWhenInUseAuthPromptPluginViewController *)self pillButton];
  double v7 = [v24 topAnchor];
  double v8 = [(CLVanillaWhenInUseAuthPromptPluginViewController *)self view];
  v9 = [v8 topAnchor];
  double v10 = [v7 constraintEqualToAnchor:v9 constant:8.0];
  [v10 setActive:1];

  id v25 = [(CLVanillaWhenInUseAuthPromptPluginViewController *)self view];
  v11 = [v25 trailingAnchor];
  double v12 = [(CLVanillaWhenInUseAuthPromptPluginViewController *)self pillButton];
  v13 = [v12 trailingAnchor];
  double v14 = [v11 constraintGreaterThanOrEqualToAnchor:v13 constant:8.0];
  [v14 setActive:1];

  id v26 = [(CLVanillaWhenInUseAuthPromptPluginViewController *)self view];
  double v15 = [v26 trailingAnchor];
  v16 = [(CLVanillaWhenInUseAuthPromptPluginViewController *)self pillButton];
  v17 = [v16 titleLabel];
  double v18 = [v17 trailingAnchor];
  double v19 = [v15 constraintGreaterThanOrEqualToAnchor:v18 constant:8.0];
  [v19 setActive:1];

  v20 = [(CLVanillaWhenInUseAuthPromptPluginViewController *)self pillButton];
  LODWORD(v21) = 1144750080;
  id v27 = v20;
  [v20 setContentCompressionResistancePriority:0 forAxis:v21];
}

- (UIButton)pillButton
{
  return self->_pillButton;
}

- (void)setPillButton:(id)a3
{
}

- (UIImage)locationIcon
{
  return self->_locationIcon;
}

- (void)setLocationIcon:(id)a3
{
}

- (NSString)pillButtonTitlePreciseOn
{
  return self->_pillButtonTitlePreciseOn;
}

- (void)setPillButtonTitlePreciseOn:(id)a3
{
}

- (NSString)pillButtonTitlePreciseOff
{
  return self->_pillButtonTitlePreciseOff;
}

- (void)setPillButtonTitlePreciseOff:(id)a3
{
}

- (NSString)pillButtonTitleOnlyHere
{
  return self->_pillButtonTitleOnlyHere;
}

- (void)setPillButtonTitleOnlyHere:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pillButtonTitleOnlyHere, 0);
  objc_storeStrong((id *)&self->_pillButtonTitlePreciseOff, 0);
  objc_storeStrong((id *)&self->_pillButtonTitlePreciseOn, 0);
  objc_storeStrong((id *)&self->_locationIcon, 0);

  objc_storeStrong((id *)&self->_pillButton, 0);
}

@end