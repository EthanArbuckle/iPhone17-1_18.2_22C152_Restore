@interface PLBatteryUIGraphLastChargeCell
- (BOOL)constraintsAdded;
- (PLBatteryUIGraphLastChargeCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4 specifier:(id)a5;
- (PLBatteryUITapDelegate)delegate;
- (UILabel)lastChargeTitleLabel;
- (UILabel)percentLabel;
- (UILabel)timeStrLabel;
- (id)getLabelTextForSlowCharger;
- (id)getLabelWithTitle:(id)a3 withRGB:(id)a4 withFont:(id)a5 andTextAlignment:(int64_t)a6;
- (void)handleTapGesture:(id)a3;
- (void)infoSymbolTapped:(id)a3;
- (void)populatePausedChargingStrings:(id)a3 percentLabel:(id)a4 lastChargeText:(id)a5 lastChargeDate:(id)a6;
- (void)prepareForReuse;
- (void)refreshCellContentsWithSpecifier:(id)a3;
- (void)setConstraintsAdded:(BOOL)a3;
- (void)setDelegate:(id)a3;
- (void)setLastChargeTitleLabel:(id)a3;
- (void)setPercentLabel:(id)a3;
- (void)setTimeStrLabel:(id)a3;
- (void)updateConstraints;
@end

@implementation PLBatteryUIGraphLastChargeCell

- (id)getLabelWithTitle:(id)a3 withRGB:(id)a4 withFont:(id)a5 andTextAlignment:(int64_t)a6
{
  id v9 = a5;
  id v10 = a4;
  id v11 = a3;
  id v12 = objc_msgSend(objc_alloc((Class)UILabel), "initWithFrame:", CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height);
  [v12 setFont:v9];

  [v12 setTranslatesAutoresizingMaskIntoConstraints:0];
  [v12 setAccessibilityIdentifier:v11];

  [v12 setTextColor:v10];
  [v12 setTextAlignment:a6];
  v13 = +[UIColor clearColor];
  [v12 setBackgroundColor:v13];

  [v12 setHidden:0];
  [v12 setLineBreakMode:0];
  [v12 setNumberOfLines:0];

  return v12;
}

- (PLBatteryUIGraphLastChargeCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4 specifier:(id)a5
{
  id v8 = a5;
  v23.receiver = self;
  v23.super_class = (Class)PLBatteryUIGraphLastChargeCell;
  id v9 = [(PLBatteryUIGraphLastChargeCell *)&v23 initWithStyle:a3 reuseIdentifier:a4 specifier:v8];
  id v10 = v9;
  if (v9)
  {
    id v11 = [(PLBatteryUIGraphLastChargeCell *)v9 contentView];
    id v12 = +[UIColor systemGrayColor];
    v13 = +[UIFont preferredFontForTextStyle:UIFontTextStyleSubheadline];
    uint64_t v14 = [(PLBatteryUIGraphLastChargeCell *)v10 getLabelWithTitle:&stru_C3A18 withRGB:v12 withFont:v13 andTextAlignment:+[PLBatteryUIUtilities localizedLeftTextAlignment]];
    timeStrLabel = v10->_timeStrLabel;
    v10->_timeStrLabel = (UILabel *)v14;

    v16 = +[UIColor _labelColor];
    v17 = +[UIFont preferredFontForTextStyle:UIFontTextStyleBody];
    uint64_t v18 = [(PLBatteryUIGraphLastChargeCell *)v10 getLabelWithTitle:&stru_C3A18 withRGB:v16 withFont:v17 andTextAlignment:+[PLBatteryUIUtilities localizedLeftTextAlignment]];
    lastChargeTitleLabel = v10->_lastChargeTitleLabel;
    v10->_lastChargeTitleLabel = (UILabel *)v18;

    [v11 addSubview:v10->_lastChargeTitleLabel];
    [v11 addSubview:v10->_timeStrLabel];
    -[PLBatteryUIGraphLastChargeCell setSeparatorInset:](v10, "setSeparatorInset:", 0.0, 0.0, 0.0, 0.0);
    v24[0] = v10->_lastChargeTitleLabel;
    v24[1] = v10->_timeStrLabel;
    v20 = +[NSArray arrayWithObjects:v24 count:2];
    [v11 setAccessibilityElements:v20];

    [(PLBatteryUIGraphLastChargeCell *)v10 refreshCellContentsWithSpecifier:v8];
    id v21 = [objc_alloc((Class)UITapGestureRecognizer) initWithTarget:v10 action:"handleTapGesture:"];
    [v21 setNumberOfTapsRequired:1];
    [(PLBatteryUIGraphLastChargeCell *)v10 addGestureRecognizer:v21];
    [(PLBatteryUIGraphLastChargeCell *)v10 setConstraintsAdded:0];
  }
  return v10;
}

- (void)updateConstraints
{
  if ([(PLBatteryUIGraphLastChargeCell *)self constraintsAdded])
  {
    v18.receiver = self;
    v18.super_class = (Class)PLBatteryUIGraphLastChargeCell;
    [(PLBatteryUIGraphLastChargeCell *)&v18 updateConstraints];
  }
  else
  {
    v3 = +[NSMutableArray array];
    [(PLBatteryUIGraphLastChargeCell *)self setSeparatorStyle:1];
    -[PLBatteryUIGraphLastChargeCell setSeparatorInset:](self, "setSeparatorInset:", 0.0, 15.0, 0.0, 0.0);
    v4 = _NSDictionaryOfVariableBindings(@"_lastChargeTitleLabel,_timeStrLabel", self->_lastChargeTitleLabel, self->_timeStrLabel, 0);
    v5 = [(PLBatteryUIGraphLastChargeCell *)self lastChargeTitleLabel];
    [v5 sizeToFit];

    v6 = [(PLBatteryUIGraphLastChargeCell *)self percentLabel];
    [v6 sizeToFit];

    v7 = [(PLBatteryUIGraphLastChargeCell *)self timeStrLabel];
    [v7 sizeToFit];

    v16 = +[NSLayoutConstraint constraintsWithVisualFormat:options:metrics:views:](NSLayoutConstraint, "constraintsWithVisualFormat:options:metrics:views:", @"H:|-15-[_lastChargeTitleLabel]|", 0, 0, v4);
    id v8 = +[NSLayoutConstraint constraintsWithVisualFormat:options:metrics:views:](NSLayoutConstraint, "constraintsWithVisualFormat:options:metrics:views:", @"H:|-15-[_timeStrLabel]|", 0, 0, v4);
    id v9 = +[NSLayoutConstraint constraintsWithVisualFormat:options:metrics:views:](NSLayoutConstraint, "constraintsWithVisualFormat:options:metrics:views:", @"V:|-9-[_lastChargeTitleLabel]-3-[_timeStrLabel]-9-|", 0, 0, v4);
    id v10 = [(PLBatteryUIGraphLastChargeCell *)self lastChargeTitleLabel];
    id v11 = [(PLBatteryUIGraphLastChargeCell *)self percentLabel];
    id v12 = +[NSLayoutConstraint constraintWithItem:v10 attribute:7 relatedBy:0 toItem:v11 attribute:7 multiplier:1.2 constant:0.0];

    v13 = [(PLBatteryUIGraphLastChargeCell *)self timeStrLabel];
    uint64_t v14 = [(PLBatteryUIGraphLastChargeCell *)self percentLabel];
    v15 = +[NSLayoutConstraint constraintWithItem:v13 attribute:7 relatedBy:0 toItem:v14 attribute:7 multiplier:1.2 constant:0.0];

    [v3 addObjectsFromArray:v16];
    [v3 addObjectsFromArray:v8];
    [v3 addObjectsFromArray:v9];
    [v3 addObject:v12];
    [v3 addObject:v15];
    +[NSLayoutConstraint activateConstraints:v3];
    [(PLBatteryUIGraphLastChargeCell *)self setConstraintsAdded:1];
    v17.receiver = self;
    v17.super_class = (Class)PLBatteryUIGraphLastChargeCell;
    [(PLBatteryUIGraphLastChargeCell *)&v17 updateConstraints];
  }
}

- (id)getLabelTextForSlowCharger
{
  id v2 = objc_alloc((Class)NSAttributedString);
  if (!+[BatteryUIResourceClass inDemoMode]
    || (+[BatteryUIResourceClass containerPath],
        (v3 = (void *)_CFPreferencesCopyValueWithContainer()) == 0))
  {
    v3 = BatteryUILocalization(@"CURRENT_SLOW_CHARGING");
  }
  id v4 = [v2 initWithString:v3];

  id v5 = objc_alloc_init((Class)NSTextAttachment);
  v6 = +[UIImage systemImageNamed:@"info.circle.fill"];
  v7 = +[UIColor systemOrangeColor];
  id v8 = [v6 imageWithTintColor:v7];
  [v5 setImage:v8];

  id v9 = +[NSAttributedString attributedStringWithAttachment:v5];
  id v10 = +[NSMutableAttributedString localizedAttributedStringWithFormat:](NSMutableAttributedString, "localizedAttributedStringWithFormat:", v4, v9);

  return v10;
}

- (void)infoSymbolTapped:(id)a3
{
  v3 = +[BatteryUIResourceClass get_log_handle_bui];
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG)) {
    sub_8D140();
  }

  if (!+[BatteryUIResourceClass inDemoMode]
    || (+[BatteryUIResourceClass containerPath],
        (id v4 = (void *)_CFPreferencesCopyValueWithContainer()) == 0))
  {
    id v4 = BatteryUILocalization(@"SLOW_CHARGING_URL");
  }
  id v5 = +[NSURL URLWithString:v4];
  v6 = +[UIApplication sharedApplication];
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_24250;
  v8[3] = &unk_BF140;
  id v9 = v4;
  id v7 = v4;
  [v6 openURL:v5 options:&__NSDictionary0__struct completionHandler:v8];
}

- (void)populatePausedChargingStrings:(id)a3 percentLabel:(id)a4 lastChargeText:(id)a5 lastChargeDate:(id)a6
{
  id v9 = a4;
  id v122 = a5;
  id v10 = a6;
  id v11 = a3;
  id v12 = +[BatteryUIResourceClass get_log_handle_bui];
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG)) {
    sub_8D7FC();
  }

  v13 = [v11 propertyForKey:@"PLBatteryUIPausedChargingKey"];

  uint64_t v14 = [v13 objectForKeyedSubscript:@"PLBatteryUIPausedChargingStateKey"];
  id v15 = [v14 intValue];

  v16 = [v13 objectForKeyedSubscript:@"PLBatteryUIPausedChargingCurrentPercentageKey"];
  [v16 doubleValue];
  double v18 = v17;

  v19 = [v13 objectForKeyedSubscript:@"PLBatteryUIPausedChargingFixedChargeLimitKey"];

  if (v19)
  {
    v20 = [v13 objectForKeyedSubscript:@"PLBatteryUIPausedChargingFixedChargeLimitKey"];
    int v21 = [v20 intValue];
  }
  else
  {
    int v21 = 80;
  }
  v117 = +[PLBatteryUIUtilities localizedStringWithPercentage:v18];
  uint64_t v108 = +[NSDate date];
  v22 = [v13 objectForKey:@"PLBatteryUIScheduleOBCKey"];

  if (v22)
  {
    objc_super v23 = +[BatteryUIResourceClass get_log_handle_bui];
    if (os_log_type_enabled(v23, OS_LOG_TYPE_DEBUG)) {
      sub_8D7C8();
    }

    uint64_t v24 = [v13 objectForKeyedSubscript:@"PLBatteryUIScheduleOBCKey"];
    v25 = +[BatteryUIResourceClass get_log_handle_bui];
    if (os_log_type_enabled(v25, OS_LOG_TYPE_DEBUG)) {
      sub_8D760();
    }

    v118 = +[PLBatteryUIUtilities getLocalizedTimeStringFromFutureDate:v24];
    v26 = +[BatteryUIResourceClass get_log_handle_bui];
    if (os_log_type_enabled(v26, OS_LOG_TYPE_DEBUG)) {
      sub_8D6F8();
    }
  }
  else
  {
    v118 = 0;
    uint64_t v24 = 0;
  }
  v27 = [v13 objectForKeyedSubscript:@"PLBatteryUIScheduleCECKey"];

  if (v27)
  {
    v109 = [v13 objectForKeyedSubscript:@"PLBatteryUIScheduleCECKey"];
    v115 = +[PLBatteryUIUtilities getLocalizedTimeStringFromFutureDate:](PLBatteryUIUtilities, "getLocalizedTimeStringFromFutureDate:");
    v28 = +[BatteryUIResourceClass get_log_handle_bui];
    if (os_log_type_enabled(v28, OS_LOG_TYPE_DEBUG)) {
      sub_8D6F8();
    }
  }
  else
  {
    v115 = 0;
    v109 = 0;
  }
  if (!+[BatteryUIResourceClass inDemoMode]
    || (+[BatteryUIResourceClass containerPath],
        (uint64_t v29 = _CFPreferencesCopyValueWithContainer()) == 0))
  {
    uint64_t v29 = BatteryUILocalization(@"CEC_SCHEDULE");
  }
  v110 = (void *)v29;
  if (!+[BatteryUIResourceClass inDemoMode]
    || (+[BatteryUIResourceClass containerPath],
        (v121 = (void *)_CFPreferencesCopyValueWithContainer()) == 0))
  {
    v121 = BatteryUILocalization(@"CURRENTLY_CHARGING");
  }
  if (!+[BatteryUIResourceClass inDemoMode]
    || (+[BatteryUIResourceClass containerPath],
        (uint64_t v30 = _CFPreferencesCopyValueWithContainer()) == 0))
  {
    uint64_t v30 = BatteryUILocalization(@"OBC_SCHEDULE");
  }
  v111 = (void *)v30;
  v116 = BatteryUILocalization(@"PREVIOUS_CAMERA_STREAMING");
  v31 = +[BatteryUIResourceClass get_log_handle_bui];
  if (os_log_type_enabled(v31, OS_LOG_TYPE_DEBUG)) {
    sub_8D690();
  }

  if (!+[BatteryUIResourceClass inDemoMode]
    || (+[BatteryUIResourceClass containerPath],
        (uint64_t v32 = _CFPreferencesCopyValueWithContainer()) == 0))
  {
    uint64_t v32 = BatteryUILocalization(@"CURRENT_CHARGING_LIMITED_FIXED");
  }
  v120 = v10;
  v33 = (void *)v24;
  if (!+[BatteryUIResourceClass inDemoMode]
    || (+[BatteryUIResourceClass containerPath],
        (uint64_t v34 = _CFPreferencesCopyValueWithContainer()) == 0))
  {
    uint64_t v34 = BatteryUILocalization(@"CHARGING_LIMITED_FIXED");
  }
  v112 = (void *)v34;
  v119 = +[PLBatteryUIUtilities localizedStringWithPercentage:(double)v21];
  v35 = +[BatteryUIResourceClass get_log_handle_bui];
  if (os_log_type_enabled(v35, OS_LOG_TYPE_DEBUG)) {
    sub_8D628();
  }

  if (+[PLBatteryUIUtilities inDemoMode])
  {
    v36 = +[PLBatteryUIUtilities getDefaultValueForKey:@"BUI_DEMO_PausedCharging"];
    v37 = v36;
    if (v36)
    {
      id v15 = [v36 intValue];
      v38 = +[BatteryUIResourceClass get_log_handle_bui];
      if (os_log_type_enabled(v38, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 67109120;
        int v124 = (int)v15;
        _os_log_impl(&dword_0, v38, OS_LOG_TYPE_INFO, "Overriding Paused Charging State with BUICTL: %d", buf, 8u);
      }
    }
  }
  v39 = +[BatteryUIResourceClass get_log_handle_bui];
  if (os_log_type_enabled(v39, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 67109120;
    int v124 = (int)v15;
    _os_log_impl(&dword_0, v39, OS_LOG_TYPE_INFO, "Paused Charging State: %d", buf, 8u);
  }

  v40 = objc_opt_new();
  v41 = +[NSNumber numberWithInt:v15];
  [v40 setObject:v41 forKeyedSubscript:@"type"];

  id v42 = v40;
  AnalyticsSendEventLazy();
  v113 = (void *)v32;
  if ((int)v15 <= 401)
  {
    v43 = v33;
    if ((int)v15 <= 300)
    {
      switch((int)v15)
      {
        case 200:
          goto LABEL_95;
        case 201:
          v44 = +[BatteryUIResourceClass get_log_handle_bui];
          if (os_log_type_enabled(v44, OS_LOG_TYPE_DEBUG)) {
            sub_8D558();
          }
          goto LABEL_103;
        case 202:
          v44 = +[BatteryUIResourceClass get_log_handle_bui];
          if (os_log_type_enabled(v44, OS_LOG_TYPE_DEBUG)) {
            sub_8D524();
          }
          goto LABEL_103;
        case 203:
          v75 = +[BatteryUIResourceClass get_log_handle_bui];
          if (os_log_type_enabled(v75, OS_LOG_TYPE_DEBUG)) {
            sub_8D4F0();
          }

          AnalyticsSendEventLazy();
          v76 = [(PLBatteryUIGraphLastChargeCell *)self lastChargeTitleLabel];
          if (!+[BatteryUIResourceClass inDemoMode]
            || (+[BatteryUIResourceClass containerPath],
                (v77 = (void *)_CFPreferencesCopyValueWithContainer()) == 0))
          {
            v77 = BatteryUILocalization(@"CHARGING_COMPLETE_CONNECTED");
          }
          [v76 setText:v77];

          id v48 = [(PLBatteryUIGraphLastChargeCell *)self timeStrLabel];
          v55 = (void *)v108;
          v78 = +[PLBatteryUIUtilities getRelativeDateStringForDate:v108];
          [v48 setText:v78];

          goto LABEL_162;
        case 204:
          goto LABEL_98;
        case 205:
          v79 = +[BatteryUIResourceClass get_log_handle_bui];
          if (os_log_type_enabled(v79, OS_LOG_TYPE_DEBUG)) {
            sub_8D2E8();
          }
          goto LABEL_114;
        case 206:
          v79 = +[BatteryUIResourceClass get_log_handle_bui];
          if (os_log_type_enabled(v79, OS_LOG_TYPE_DEBUG)) {
            sub_8D31C();
          }
LABEL_114:

          v80 = [(PLBatteryUIGraphLastChargeCell *)self lastChargeTitleLabel];
          v81 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", v113, v119);
          [v80 setText:v81];

          id v48 = [(PLBatteryUIGraphLastChargeCell *)self timeStrLabel];
          v55 = (void *)v108;
          uint64_t v59 = +[PLBatteryUIUtilities getRelativeDateStringForDate:v108];
          goto LABEL_115;
        default:
          if (v15 != 100) {
            goto LABEL_98;
          }
          v44 = +[BatteryUIResourceClass get_log_handle_bui];
          if (os_log_type_enabled(v44, OS_LOG_TYPE_DEBUG)) {
            sub_8D5F4();
          }
          goto LABEL_103;
      }
    }
    if ((int)v15 <= 305)
    {
      if (v15 != 301)
      {
        if (v15 == 302)
        {
          v49 = +[BatteryUIResourceClass get_log_handle_bui];
          if (os_log_type_enabled(v49, OS_LOG_TYPE_DEBUG)) {
            sub_8D2B4();
          }

          AnalyticsSendEventLazy();
          v50 = [(PLBatteryUIGraphLastChargeCell *)self lastChargeTitleLabel];
          v51 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", v121, v117);
          [v50 setText:v51];

          id v48 = [(PLBatteryUIGraphLastChargeCell *)self timeStrLabel];
          if (!+[BatteryUIResourceClass inDemoMode])
          {
LABEL_155:
            v55 = (void *)v108;
LABEL_156:
            CFStringRef v106 = @"PREVIOUS_TLC";
LABEL_159:
            v107 = +[UIDevice modelSpecificLocalizedStringKeyForKey:v106];
            v67 = BatteryUILocalization(v107);

            goto LABEL_160;
          }
LABEL_124:
          +[UIDevice modelSpecificLocalizedStringKeyForKey:@"PREVIOUS_TLC"];
          +[BatteryUIResourceClass containerPath];
          v67 = (void *)_CFPreferencesCopyValueWithContainer();
          v55 = (void *)v108;
          if (!v67) {
            goto LABEL_156;
          }
LABEL_160:
          [v48 setText:v67];
LABEL_161:

LABEL_162:
          v43 = v33;
LABEL_163:

          goto LABEL_164;
        }
        goto LABEL_98;
      }
      v97 = +[BatteryUIResourceClass get_log_handle_bui];
      if (os_log_type_enabled(v97, OS_LOG_TYPE_DEBUG)) {
        sub_8D280();
      }

      AnalyticsSendEventLazy();
      v98 = [(PLBatteryUIGraphLastChargeCell *)self lastChargeTitleLabel];
      v99 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", v121, v117);
      [v98 setText:v99];

      v55 = (void *)v108;
      v43 = v33;
      if (v118 && [v118 length])
      {
        id v48 = [(PLBatteryUIGraphLastChargeCell *)self timeStrLabel];
        uint64_t v72 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", v111, v118);
LABEL_141:
        v67 = (void *)v72;
        goto LABEL_160;
      }
      goto LABEL_164;
    }
    if (v15 == 306)
    {
      v104 = +[BatteryUIResourceClass get_log_handle_bui];
      if (os_log_type_enabled(v104, OS_LOG_TYPE_DEBUG)) {
        sub_8D350();
      }

      v92 = self;
      v93 = [(PLBatteryUIGraphLastChargeCell *)self lastChargeTitleLabel];
      +[NSString stringWithFormat:](NSString, "stringWithFormat:", v121, v117);
      v105 = LABEL_150:;
      [v93 setText:v105];

      id v48 = [(PLBatteryUIGraphLastChargeCell *)v92 timeStrLabel];
      if (!+[BatteryUIResourceClass inDemoMode]
        || (+[BatteryUIResourceClass containerPath],
            (v86 = (void *)_CFPreferencesCopyValueWithContainer()) == 0))
      {
        v87 = @"PREVIOUS_CEC";
LABEL_153:
        v86 = BatteryUILocalization(v87);
      }
LABEL_154:
      [v48 setText:v86];

      v55 = (void *)v108;
      goto LABEL_162;
    }
    if (v15 != 401) {
      goto LABEL_98;
    }
    v56 = +[BatteryUIResourceClass get_log_handle_bui];
    if (os_log_type_enabled(v56, OS_LOG_TYPE_DEBUG)) {
      sub_8D384();
    }

    AnalyticsSendEventLazy();
    v57 = [(PLBatteryUIGraphLastChargeCell *)self lastChargeTitleLabel];
    if (!+[BatteryUIResourceClass inDemoMode]
      || (+[BatteryUIResourceClass containerPath],
          (v58 = (void *)_CFPreferencesCopyValueWithContainer()) == 0))
    {
      v58 = BatteryUILocalization(@"PAUSED_OBC");
    }
    [v57 setText:v58];

    v55 = (void *)v108;
    v43 = v33;
    if (!v118 || ![v118 length]) {
      goto LABEL_164;
    }
    id v48 = [(PLBatteryUIGraphLastChargeCell *)self timeStrLabel];
    +[NSString stringWithFormat:](NSString, "stringWithFormat:", v111, v118);
    uint64_t v59 = LABEL_85:;
LABEL_115:
    v82 = (void *)v59;
    [v48 setText:v59];

    goto LABEL_163;
  }
  v43 = v33;
  if ((int)v15 > 500)
  {
    switch((int)v15)
    {
      case 501:
        v83 = +[BatteryUIResourceClass get_log_handle_bui];
        if (os_log_type_enabled(v83, OS_LOG_TYPE_DEBUG)) {
          sub_8D420();
        }

        AnalyticsSendEventLazy();
        v84 = [(PLBatteryUIGraphLastChargeCell *)self lastChargeTitleLabel];
        v85 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", v122, v9);
        [v84 setText:v85];

        id v48 = [(PLBatteryUIGraphLastChargeCell *)self timeStrLabel];
        if (+[BatteryUIResourceClass inDemoMode])
        {
          +[BatteryUIResourceClass containerPath];
          v86 = (void *)_CFPreferencesCopyValueWithContainer();
          if (v86) {
            goto LABEL_154;
          }
        }
        v87 = @"PREVIOUS_OBC";
        goto LABEL_153;
      case 502:
        v88 = +[BatteryUIResourceClass get_log_handle_bui];
        if (os_log_type_enabled(v88, OS_LOG_TYPE_DEBUG)) {
          sub_8D454();
        }

        AnalyticsSendEventLazy();
        v89 = [(PLBatteryUIGraphLastChargeCell *)self lastChargeTitleLabel];
        v90 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", v122, v9);
        [v89 setText:v90];

        id v48 = [(PLBatteryUIGraphLastChargeCell *)self timeStrLabel];
        if (+[BatteryUIResourceClass inDemoMode]) {
          goto LABEL_124;
        }
        goto LABEL_155;
      case 503:
      case 505:
        v45 = +[BatteryUIResourceClass get_log_handle_bui];
        if (os_log_type_enabled(v45, OS_LOG_TYPE_DEBUG)) {
          sub_8D488();
        }

        AnalyticsSendEventLazy();
        v46 = [(PLBatteryUIGraphLastChargeCell *)self lastChargeTitleLabel];
        v47 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", v122, v9);
        [v46 setText:v47];

        id v48 = [(PLBatteryUIGraphLastChargeCell *)self timeStrLabel];
        [v48 setText:v116];
        goto LABEL_135;
      case 504:
        goto LABEL_98;
      case 506:
        v91 = +[BatteryUIResourceClass get_log_handle_bui];
        if (os_log_type_enabled(v91, OS_LOG_TYPE_DEBUG)) {
          sub_8D4BC();
        }

        v92 = self;
        v93 = [(PLBatteryUIGraphLastChargeCell *)self lastChargeTitleLabel];
        +[NSString stringWithFormat:](NSString, "stringWithFormat:", v122, v9);
        goto LABEL_150;
      case 507:
        v94 = +[BatteryUIResourceClass get_log_handle_bui];
        if (os_log_type_enabled(v94, OS_LOG_TYPE_DEBUG)) {
          sub_8D58C();
        }
        goto LABEL_133;
      case 508:
        v94 = +[BatteryUIResourceClass get_log_handle_bui];
        if (os_log_type_enabled(v94, OS_LOG_TYPE_DEBUG)) {
          sub_8D5C0();
        }
LABEL_133:

        v73 = self;
        v74 = [(PLBatteryUIGraphLastChargeCell *)self lastChargeTitleLabel];
        +[NSString stringWithFormat:](NSString, "stringWithFormat:", v112, v119);
        goto LABEL_134;
      default:
        if (v15 != 601) {
          goto LABEL_98;
        }
        if (!+[PLModelingUtilities supportsSlowCharging])
        {
LABEL_95:
          v69 = +[BatteryUIResourceClass get_log_handle_bui];
          if (os_log_type_enabled(v69, OS_LOG_TYPE_DEBUG)) {
            sub_8D24C();
          }

          AnalyticsSendEventLazy();
          v70 = [(PLBatteryUIGraphLastChargeCell *)self lastChargeTitleLabel];
          v71 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", v121, v117);
          [v70 setText:v71];

          id v48 = [(PLBatteryUIGraphLastChargeCell *)self timeStrLabel];
          v55 = (void *)v108;
          uint64_t v72 = +[PLBatteryUIUtilities getRelativeDateStringForDate:v108];
          goto LABEL_141;
        }
        v60 = +[BatteryUIResourceClass get_log_handle_bui];
        if (os_log_type_enabled(v60, OS_LOG_TYPE_DEBUG)) {
          sub_8D218();
        }

        v61 = [(PLBatteryUIGraphLastChargeCell *)self lastChargeTitleLabel];
        v62 = [(PLBatteryUIGraphLastChargeCell *)self getLabelTextForSlowCharger];
        [v61 setAttributedText:v62];

        v63 = [(PLBatteryUIGraphLastChargeCell *)self lastChargeTitleLabel];
        v64 = +[UIColor systemOrangeColor];
        [v63 setTextColor:v64];

        v65 = [(PLBatteryUIGraphLastChargeCell *)self lastChargeTitleLabel];
        [v65 setUserInteractionEnabled:1];

        id v48 = [objc_alloc((Class)UITapGestureRecognizer) initWithTarget:self action:"infoSymbolTapped:"];
        [v48 setNumberOfTapsRequired:1];
        v66 = [(PLBatteryUIGraphLastChargeCell *)self lastChargeTitleLabel];
        [v66 addGestureRecognizer:v48];

        v67 = [(PLBatteryUIGraphLastChargeCell *)self timeStrLabel];
        v68 = +[PLBatteryUIUtilities getRelativeDateStringForDate:v108];
        [v67 setText:v68];

        v55 = (void *)v108;
        break;
    }
    goto LABEL_161;
  }
  if (v15 == 402)
  {
    v100 = +[BatteryUIResourceClass get_log_handle_bui];
    if (os_log_type_enabled(v100, OS_LOG_TYPE_DEBUG)) {
      sub_8D3B8();
    }

    AnalyticsSendEventLazy();
    v101 = [(PLBatteryUIGraphLastChargeCell *)self lastChargeTitleLabel];
    v102 = +[UIDevice modelSpecificLocalizedStringKeyForKey:@"PAUSED_TLC"];
    v103 = BatteryUILocalization(v102);
    [v101 setText:v103];

    id v48 = [(PLBatteryUIGraphLastChargeCell *)self timeStrLabel];
    if (+[BatteryUIResourceClass inDemoMode])
    {
      +[UIDevice modelSpecificLocalizedStringKeyForKey:@"RESUME_TEMP"];
      +[BatteryUIResourceClass containerPath];
      v67 = (void *)_CFPreferencesCopyValueWithContainer();
      v55 = (void *)v108;
      if (v67) {
        goto LABEL_160;
      }
    }
    else
    {
      v55 = (void *)v108;
    }
    CFStringRef v106 = @"RESUME_TEMP";
    goto LABEL_159;
  }
  if (v15 != 406)
  {
LABEL_98:
    v44 = +[BatteryUIResourceClass get_log_handle_bui];
    if (os_log_type_enabled(v44, OS_LOG_TYPE_DEBUG)) {
      sub_8D1E4();
    }
LABEL_103:

    AnalyticsSendEventLazy();
    v73 = self;
    v74 = [(PLBatteryUIGraphLastChargeCell *)self lastChargeTitleLabel];
    +[NSString stringWithFormat:](NSString, "stringWithFormat:", v122, v9);
    v95 = LABEL_134:;
    [v74 setText:v95];

    id v48 = [(PLBatteryUIGraphLastChargeCell *)v73 timeStrLabel];
    v96 = +[PLBatteryUIUtilities getRelativeDateStringForDate:v120];
    [v48 setText:v96];

LABEL_135:
    v55 = (void *)v108;
    goto LABEL_163;
  }
  v52 = +[BatteryUIResourceClass get_log_handle_bui];
  if (os_log_type_enabled(v52, OS_LOG_TYPE_DEBUG)) {
    sub_8D3EC();
  }

  v53 = [(PLBatteryUIGraphLastChargeCell *)self lastChargeTitleLabel];
  if (!+[BatteryUIResourceClass inDemoMode]
    || (+[BatteryUIResourceClass containerPath],
        (v54 = (void *)_CFPreferencesCopyValueWithContainer()) == 0))
  {
    v54 = BatteryUILocalization(@"PAUSED_CEC");
  }
  [v53 setText:v54];

  v55 = (void *)v108;
  v43 = v33;
  if (v115 && [v115 length])
  {
    id v48 = [(PLBatteryUIGraphLastChargeCell *)self timeStrLabel];
    +[NSString stringWithFormat:](NSString, "stringWithFormat:", v110, v115);
    goto LABEL_85;
  }
LABEL_164:
}

- (void)refreshCellContentsWithSpecifier:(id)a3
{
  id v4 = a3;
  v23.receiver = self;
  v23.super_class = (Class)PLBatteryUIGraphLastChargeCell;
  [(PLBatteryUIGraphLastChargeCell *)&v23 refreshCellContentsWithSpecifier:v4];
  id WeakRetained = objc_loadWeakRetained((id *)&self->PSTableCell_opaque[OBJC_IVAR___PSTableCell__specifier]);
  v6 = [WeakRetained propertyForKey:@"PLBatteryUIGraphTapDelegateWrapperKey"];

  if (v6)
  {
    id v7 = [v4 propertyForKey:@"PLBatteryUIGraphTapDelegateWrapperKey"];
    id v8 = [v7 buiViewController];
    [(PLBatteryUIGraphLastChargeCell *)self setDelegate:v8];
  }
  if (!+[BatteryUIResourceClass inDemoMode]
    || (+[BatteryUIResourceClass containerPath],
        (id v9 = (void *)_CFPreferencesCopyValueWithContainer()) == 0))
  {
    id v9 = BatteryUILocalization(@"LAST_CHARGE");
  }
  id v10 = [v4 propertyForKey:@"PLBatteryUILastChargeKey"];
  id v11 = [v10 objectForKeyedSubscript:@"PLBatteryUILevelKey"];
  [v11 doubleValue];
  id v12 = +[PLBatteryUIUtilities localizedStringWithPercentage:](PLBatteryUIUtilities, "localizedStringWithPercentage:");

  v13 = [v10 objectForKeyedSubscript:@"PLBatteryUITimestampKey"];
  double v14 = (double)(unint64_t)[v13 unsignedLongValue];

  id v15 = +[NSDate dateWithTimeIntervalSince1970:v14];
  int v16 = _os_feature_enabled_impl();
  double v17 = +[BatteryUIResourceClass get_log_handle_bui];
  BOOL v18 = os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG);
  if (v16)
  {
    if (v18) {
      sub_8D830();
    }

    [(PLBatteryUIGraphLastChargeCell *)self populatePausedChargingStrings:v4 percentLabel:v12 lastChargeText:v9 lastChargeDate:v15];
  }
  else
  {
    if (v18) {
      sub_8D864();
    }

    v19 = [(PLBatteryUIGraphLastChargeCell *)self lastChargeTitleLabel];
    v20 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", v9, v12);
    [v19 setText:v20];

    int v21 = [(PLBatteryUIGraphLastChargeCell *)self timeStrLabel];
    v22 = +[PLBatteryUIUtilities getRelativeDateStringForDate:v15];
    [v21 setText:v22];
  }
  [(PLBatteryUIGraphLastChargeCell *)self setNeedsUpdateConstraints];
  [(PLBatteryUIGraphLastChargeCell *)self setNeedsDisplay];
}

- (void)handleTapGesture:(id)a3
{
  id v4 = [(PLBatteryUIGraphLastChargeCell *)self delegate];

  if (v4)
  {
    id v5 = [(PLBatteryUIGraphLastChargeCell *)self delegate];
    [v5 didTappedBar:&off_C9608];
  }
}

- (void)prepareForReuse
{
  v3 = +[BatteryUIResourceClass get_log_handle_bui];
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_0, v3, OS_LOG_TYPE_INFO, "prepareForReuse called on LastChargeCell", buf, 2u);
  }

  v9.receiver = self;
  v9.super_class = (Class)PLBatteryUIGraphLastChargeCell;
  [(PLBatteryUIGraphLastChargeCell *)&v9 prepareForReuse];
  id v4 = [(PLBatteryUIGraphLastChargeCell *)self lastChargeTitleLabel];
  [v4 setText:&stru_C3A18];

  id v5 = +[UIColor labelColor];
  v6 = [(PLBatteryUIGraphLastChargeCell *)self lastChargeTitleLabel];
  [v6 setColor:v5];

  id v7 = [(PLBatteryUIGraphLastChargeCell *)self percentLabel];
  [v7 setText:&stru_C3A18];

  id v8 = [(PLBatteryUIGraphLastChargeCell *)self timeStrLabel];
  [v8 setText:&stru_C3A18];
}

- (PLBatteryUITapDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (PLBatteryUITapDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (UILabel)lastChargeTitleLabel
{
  return (UILabel *)objc_getProperty(self, a2, 136, 1);
}

- (void)setLastChargeTitleLabel:(id)a3
{
}

- (UILabel)percentLabel
{
  return (UILabel *)objc_getProperty(self, a2, 144, 1);
}

- (void)setPercentLabel:(id)a3
{
}

- (UILabel)timeStrLabel
{
  return (UILabel *)objc_getProperty(self, a2, 152, 1);
}

- (void)setTimeStrLabel:(id)a3
{
}

- (BOOL)constraintsAdded
{
  return self->_constraintsAdded;
}

- (void)setConstraintsAdded:(BOOL)a3
{
  self->_constraintsAdded = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_timeStrLabel, 0);
  objc_storeStrong((id *)&self->_percentLabel, 0);
  objc_storeStrong((id *)&self->_lastChargeTitleLabel, 0);

  objc_destroyWeak((id *)&self->_delegate);
}

@end