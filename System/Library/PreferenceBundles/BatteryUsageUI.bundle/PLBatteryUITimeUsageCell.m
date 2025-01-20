@interface PLBatteryUITimeUsageCell
- (BOOL)constraintsAdded;
- (BOOL)previousBreakdownNotAvailable;
- (NSMutableArray)bottomMarginConstraints;
- (PLBatteryUITimeUsageCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4 specifier:(id)a5;
- (PLBatteryUITimeUsageTapDelegate)delegate;
- (id)getLabelWithTitle:(id)a3 withRGB:(id)a4 withFont:(id)a5;
- (id)getLoczlizedHourMinuteStringFromSeconds:(double)a3;
- (void)fitSize;
- (void)handleGesture:(id)a3;
- (void)layoutSubviews;
- (void)refreshCellContentsWithSpecifier:(id)a3;
- (void)setBottomMarginConstraints:(id)a3;
- (void)setConstraintsAdded:(BOOL)a3;
- (void)setDelegate:(id)a3;
- (void)setPreviousBreakdownNotAvailable:(BOOL)a3;
- (void)updateConstraints;
@end

@implementation PLBatteryUITimeUsageCell

- (id)getLabelWithTitle:(id)a3 withRGB:(id)a4 withFont:(id)a5
{
  id v7 = a5;
  id v8 = a4;
  id v9 = a3;
  id v10 = objc_msgSend(objc_alloc((Class)UILabel), "initWithFrame:", CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height);
  [v10 setFont:v7];

  [v10 setTranslatesAutoresizingMaskIntoConstraints:0];
  [v10 setAccessibilityIdentifier:v9];

  [v10 setTextColor:v8];
  objc_msgSend(v10, "setTextAlignment:", +[PLBatteryUIUtilities localizedLeftTextAlignment](PLBatteryUIUtilities, "localizedLeftTextAlignment"));
  v11 = +[UIColor clearColor];
  [v10 setBackgroundColor:v11];

  [v10 setHidden:0];
  [v10 setLineBreakMode:0];
  [v10 setNumberOfLines:0];

  return v10;
}

- (void)fitSize
{
  [(UILabel *)self->_screenOnText sizeToFit];
  [(UILabel *)self->_screenOffText sizeToFit];
  [(UILabel *)self->_screenOnTimeText sizeToFit];
  screenOffTimeText = self->_screenOffTimeText;

  [(UILabel *)screenOffTimeText sizeToFit];
}

- (PLBatteryUITimeUsageCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4 specifier:(id)a5
{
  id v8 = a5;
  v31.receiver = self;
  v31.super_class = (Class)PLBatteryUITimeUsageCell;
  id v9 = [(PLBatteryUITimeUsageCell *)&v31 initWithStyle:a3 reuseIdentifier:a4 specifier:v8];
  id v10 = v9;
  if (v9)
  {
    v11 = [(PLBatteryUITimeUsageCell *)v9 contentView];
    v12 = +[PLBatteryUIUtilities screenOnColor];
    v13 = +[UIFont preferredFontForTextStyle:UIFontTextStyleSubheadline];
    uint64_t v14 = [(PLBatteryUITimeUsageCell *)v10 getLabelWithTitle:@"ScreenOnText" withRGB:v12 withFont:v13];
    screenOnText = v10->_screenOnText;
    v10->_screenOnText = (UILabel *)v14;

    [v11 addSubview:v10->_screenOnText];
    v16 = +[PLBatteryUIUtilities screenOffColor];
    v17 = +[UIFont preferredFontForTextStyle:UIFontTextStyleSubheadline];
    uint64_t v18 = [(PLBatteryUITimeUsageCell *)v10 getLabelWithTitle:@"ScreenOffText" withRGB:v16 withFont:v17];
    screenOffText = v10->_screenOffText;
    v10->_screenOffText = (UILabel *)v18;

    [v11 addSubview:v10->_screenOffText];
    v20 = +[UIColor _labelColor];
    v21 = +[UIFont preferredFontForTextStyle:UIFontTextStyleTitle3];
    uint64_t v22 = [(PLBatteryUITimeUsageCell *)v10 getLabelWithTitle:@"ScreenOnTime" withRGB:v20 withFont:v21];
    screenOnTimeText = v10->_screenOnTimeText;
    v10->_screenOnTimeText = (UILabel *)v22;

    [v11 addSubview:v10->_screenOnTimeText];
    v24 = +[UIColor _labelColor];
    v25 = +[UIFont preferredFontForTextStyle:UIFontTextStyleTitle3];
    uint64_t v26 = [(PLBatteryUITimeUsageCell *)v10 getLabelWithTitle:@"ScreenOffTime" withRGB:v24 withFont:v25];
    screenOffTimeText = v10->_screenOffTimeText;
    v10->_screenOffTimeText = (UILabel *)v26;

    [v11 addSubview:v10->_screenOffTimeText];
    -[PLBatteryUITimeUsageCell setSeparatorInset:](v10, "setSeparatorInset:", 0.0, 0.0, 0.0, 0.0);
    v32[0] = v10->_screenOnText;
    v32[1] = v10->_screenOffText;
    v32[2] = v10->_screenOnTimeText;
    v32[3] = v10->_screenOffTimeText;
    v28 = +[NSArray arrayWithObjects:v32 count:4];
    [v11 setAccessibilityElements:v28];

    [(PLBatteryUITimeUsageCell *)v10 refreshCellContentsWithSpecifier:v8];
    [(PLBatteryUITimeUsageCell *)v10 setConstraintsAdded:0];
    v29 = +[NSMutableArray array];
    [(PLBatteryUITimeUsageCell *)v10 setBottomMarginConstraints:v29];
  }
  return v10;
}

- (void)layoutSubviews
{
  [(PLBatteryUITimeUsageCell *)self setSeparatorStyle:0];
  v3.receiver = self;
  v3.super_class = (Class)PLBatteryUITimeUsageCell;
  [(PLBatteryUITimeUsageCell *)&v3 layoutSubviews];
}

- (void)updateConstraints
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->PSTableCell_opaque[OBJC_IVAR___PSTableCell__specifier]);
  v4 = [WeakRetained propertyForKey:@"PLBatteryUIGraphBatteryBreakdownNotAvailableKey"];
  id v5 = [v4 BOOLValue];

  v6 = +[NSMutableArray array];
  [(PLBatteryUITimeUsageCell *)self setSeparatorStyle:0];
  [(PLBatteryUITimeUsageCell *)self fitSize];
  id v7 = _NSDictionaryOfVariableBindings(@"_screenOnText, _screenOffText, _screenOnTimeText, _screenOffTimeText", self->_screenOnText, self->_screenOffText, self->_screenOnTimeText, self->_screenOffTimeText, 0);
  if (v5) {
    _NSDictionaryOfVariableBindings(@"bottomMargin", &off_C9680, 0);
  }
  else {
  id v8 = _NSDictionaryOfVariableBindings(@"bottomMargin", &off_C9698, 0);
  }
  if ([(PLBatteryUITimeUsageCell *)self constraintsAdded])
  {
    if (v5 != [(PLBatteryUITimeUsageCell *)self previousBreakdownNotAvailable])
    {
      id v9 = [(PLBatteryUITimeUsageCell *)self bottomMarginConstraints];
      +[NSLayoutConstraint deactivateConstraints:v9];

      id v10 = [(PLBatteryUITimeUsageCell *)self bottomMarginConstraints];
      [v10 removeAllObjects];

      v11 = +[NSLayoutConstraint constraintsWithVisualFormat:options:metrics:views:](NSLayoutConstraint, "constraintsWithVisualFormat:options:metrics:views:", @"V:|-15-[_screenOnText]-2-[_screenOnTimeText]-(bottomMargin)-|", 0, v8, v7);
      v12 = +[NSLayoutConstraint constraintsWithVisualFormat:options:metrics:views:](NSLayoutConstraint, "constraintsWithVisualFormat:options:metrics:views:", @"V:|-15-[_screenOffText]-2-[_screenOffTimeText]-(bottomMargin)-|", 0, v8, v7);
      [v6 addObjectsFromArray:v11];
      [v6 addObjectsFromArray:v12];
      v13 = [(PLBatteryUITimeUsageCell *)self bottomMarginConstraints];
      [v13 addObjectsFromArray:v11];

      uint64_t v14 = [(PLBatteryUITimeUsageCell *)self bottomMarginConstraints];
      [v14 addObjectsFromArray:v12];

      +[NSLayoutConstraint activateConstraints:v6];
      [(PLBatteryUITimeUsageCell *)self setPreviousBreakdownNotAvailable:v5];
    }
    v27.receiver = self;
    v27.super_class = (Class)PLBatteryUITimeUsageCell;
    [(PLBatteryUITimeUsageCell *)&v27 updateConstraints];
  }
  else
  {
    [(PLBatteryUITimeUsageCell *)self setPreviousBreakdownNotAvailable:v5];
    v23 = +[NSLayoutConstraint constraintsWithVisualFormat:options:metrics:views:](NSLayoutConstraint, "constraintsWithVisualFormat:options:metrics:views:", @"H:|-15-[_screenOnText]-0-[_screenOffText]-15-|", 0, 0, v7);
    v25 = +[NSLayoutConstraint constraintsWithVisualFormat:options:metrics:views:](NSLayoutConstraint, "constraintsWithVisualFormat:options:metrics:views:", @"H:|-15-[_screenOnTimeText]-0-[_screenOffTimeText]-15-|", 0, 0, v7);
    uint64_t v22 = +[NSLayoutConstraint constraintsWithVisualFormat:options:metrics:views:](NSLayoutConstraint, "constraintsWithVisualFormat:options:metrics:views:", @"V:|-15-[_screenOnText]-2-[_screenOnTimeText]-(bottomMargin)-|", 0, v8, v7);
    v15 = +[NSLayoutConstraint constraintsWithVisualFormat:options:metrics:views:](NSLayoutConstraint, "constraintsWithVisualFormat:options:metrics:views:", @"V:|-15-[_screenOffText]-2-[_screenOffTimeText]-(bottomMargin)-|", 0, v8, v7);
    v16 = +[NSLayoutConstraint constraintsWithVisualFormat:@"H:[_screenOnText(==_screenOffText)]" options:0 metrics:0 views:v7];
    +[NSLayoutConstraint constraintsWithVisualFormat:@"H:[_screenOnTimeText(==_screenOffTimeText)]" options:0 metrics:0 views:v7];
    v17 = v24 = v8;
    uint64_t v18 = +[NSLayoutConstraint constraintsWithVisualFormat:@"V:[_screenOnText(==_screenOffText)]" options:0 metrics:0 views:v7];
    v19 = +[NSLayoutConstraint constraintsWithVisualFormat:@"V:[_screenOnTimeText(==_screenOffTimeText)]" options:0 metrics:0 views:v7];
    [v6 addObjectsFromArray:v23];
    [v6 addObjectsFromArray:v22];
    [v6 addObjectsFromArray:v25];
    [v6 addObjectsFromArray:v15];
    [v6 addObjectsFromArray:v16];
    [v6 addObjectsFromArray:v17];
    [v6 addObjectsFromArray:v18];
    [v6 addObjectsFromArray:v19];
    +[NSLayoutConstraint activateConstraints:v6];
    v20 = [(PLBatteryUITimeUsageCell *)self bottomMarginConstraints];
    [v20 addObjectsFromArray:v22];

    v21 = [(PLBatteryUITimeUsageCell *)self bottomMarginConstraints];
    [v21 addObjectsFromArray:v15];

    [(PLBatteryUITimeUsageCell *)self setConstraintsAdded:1];
    v26.receiver = self;
    v26.super_class = (Class)PLBatteryUITimeUsageCell;
    [(PLBatteryUITimeUsageCell *)&v26 updateConstraints];

    id v8 = v24;
  }
}

- (void)refreshCellContentsWithSpecifier:(id)a3
{
  id v4 = a3;
  v42.receiver = self;
  v42.super_class = (Class)PLBatteryUITimeUsageCell;
  [(PLBatteryUITimeUsageCell *)&v42 refreshCellContentsWithSpecifier:v4];
  id v5 = (id *)&self->PSTableCell_opaque[OBJC_IVAR___PSTableCell__specifier];
  id WeakRetained = objc_loadWeakRetained(v5);
  id v7 = [WeakRetained propertyForKey:@"PLBatteryUIGraphTapDelegateWrapperKey"];

  if (v7)
  {
    id v8 = [v4 propertyForKey:@"PLBatteryUIGraphTapDelegateWrapperKey"];
    id v9 = [v8 buiViewController];
    objc_storeWeak((id *)&self->_delegate, v9);
  }
  id v10 = [v4 propertyForKey:@"PLBatteryUIGraphQueryRangeKey"];
  unsigned int v11 = [v10 intValue];

  id v12 = objc_loadWeakRetained(v5);
  v13 = [v12 propertyForKey:@"PLBatteryUIGraphTappedIndexKey"];
  unsigned int v14 = [v13 intValue];

  v15 = [v4 propertyForKey:@"PLBatteryUIGraphScreenOnUsageTimeKey"];
  int v16 = [v15 intValue];

  v17 = [v4 propertyForKey:@"PLBatteryUIGraphScreenOffUsageTimeKey"];
  int v18 = [v17 intValue];

  if (v11 && (v11 != 1 || v14 == -1))
  {
    if (_os_feature_enabled_impl()
      && +[PLModelingUtilities hasAOD])
    {
      screenOnText = self->_screenOnText;
      if (!+[BatteryUIResourceClass inDemoMode]
        || (+[BatteryUIResourceClass containerPath],
            (objc_super v27 = (void *)_CFPreferencesCopyValueWithContainer()) == 0))
      {
        objc_super v27 = BatteryUILocalization(@"AVERAGE_SCREEN_ON_USAGE_ALWAYS_ON");
      }
      [(UILabel *)screenOnText setText:v27];

      screenOffText = self->_screenOffText;
      if (!+[BatteryUIResourceClass inDemoMode]
        || (+[BatteryUIResourceClass containerPath],
            (uint64_t v22 = (void *)_CFPreferencesCopyValueWithContainer()) == 0))
      {
        v23 = @"AVERAGE_SCREEN_OFF_USAGE_ALWAYS_ON";
        goto LABEL_34;
      }
    }
    else
    {
      v28 = self->_screenOnText;
      if (!+[BatteryUIResourceClass inDemoMode]
        || (+[BatteryUIResourceClass containerPath],
            (v29 = (void *)_CFPreferencesCopyValueWithContainer()) == 0))
      {
        v29 = BatteryUILocalization(@"AVERAGE_SCREEN_ON_USAGE");
      }
      [(UILabel *)v28 setText:v29];

      screenOffText = self->_screenOffText;
      if (!+[BatteryUIResourceClass inDemoMode]
        || (+[BatteryUIResourceClass containerPath],
            (uint64_t v22 = (void *)_CFPreferencesCopyValueWithContainer()) == 0))
      {
        v23 = @"AVERAGE_SCREEN_OFF_USAGE";
        goto LABEL_34;
      }
    }
  }
  else if (_os_feature_enabled_impl() {
         && +[PLModelingUtilities hasAOD])
  }
  {
    v19 = self->_screenOnText;
    if (!+[BatteryUIResourceClass inDemoMode]
      || (+[BatteryUIResourceClass containerPath],
          (v20 = (void *)_CFPreferencesCopyValueWithContainer()) == 0))
    {
      v20 = BatteryUILocalization(@"SCREEN_ON_USAGE_ALWAYS_ON");
    }
    [(UILabel *)v19 setText:v20];

    screenOffText = self->_screenOffText;
    if (!+[BatteryUIResourceClass inDemoMode]
      || (+[BatteryUIResourceClass containerPath],
          (uint64_t v22 = (void *)_CFPreferencesCopyValueWithContainer()) == 0))
    {
      v23 = @"SCREEN_OFF_USAGE_ALWAYS_ON";
LABEL_34:
      uint64_t v22 = BatteryUILocalization(v23);
    }
  }
  else
  {
    v24 = self->_screenOnText;
    if (!+[BatteryUIResourceClass inDemoMode]
      || (+[BatteryUIResourceClass containerPath],
          (v25 = (void *)_CFPreferencesCopyValueWithContainer()) == 0))
    {
      v25 = BatteryUILocalization(@"SCREEN_ON_USAGE");
    }
    [(UILabel *)v24 setText:v25];

    screenOffText = self->_screenOffText;
    if (!+[BatteryUIResourceClass inDemoMode]
      || (+[BatteryUIResourceClass containerPath],
          (uint64_t v22 = (void *)_CFPreferencesCopyValueWithContainer()) == 0))
    {
      v23 = @"SCREEN_OFF_USAGE";
      goto LABEL_34;
    }
  }
  [(UILabel *)screenOffText setText:v22];

  int v30 = v18 & ~(v18 >> 31);
  int v31 = v16 & ~(v16 >> 31);
  screenOnTimeText = self->_screenOnTimeText;
  v33 = [(PLBatteryUITimeUsageCell *)self getLoczlizedHourMinuteStringFromSeconds:(double)v31];
  [(UILabel *)screenOnTimeText setText:v33];

  screenOffTimeText = self->_screenOffTimeText;
  v35 = [(PLBatteryUITimeUsageCell *)self getLoczlizedHourMinuteStringFromSeconds:(double)v30];
  [(UILabel *)screenOffTimeText setText:v35];

  id v36 = objc_alloc((Class)UIView);
  [(PLBatteryUITimeUsageCell *)self frame];
  double v38 = v37;
  [(PLBatteryUITimeUsageCell *)self frame];
  id v39 = objc_msgSend(v36, "initWithFrame:", 0.0, 0.0, v38);
  v40 = +[UIColor clearColor];
  [v39 setBackgroundColor:v40];

  [v39 setUserInteractionEnabled:1];
  id v41 = [objc_alloc((Class)UITapGestureRecognizer) initWithTarget:self action:"handleGesture:"];
  [v41 setNumberOfTapsRequired:1];
  [v39 addGestureRecognizer:v41];
  [(PLBatteryUITimeUsageCell *)self addSubview:v39];
  [(PLBatteryUITimeUsageCell *)self setNeedsUpdateConstraints];
  [(PLBatteryUITimeUsageCell *)self setNeedsDisplay];
}

- (id)getLoczlizedHourMinuteStringFromSeconds:(double)a3
{
  id v4 = objc_alloc_init((Class)NSDateComponentsFormatter);
  objc_msgSend(v4, "setUnitsStyle:", +[PLBatteryUIUtilities localizedDateComponentsUnitsStyle](PLBatteryUIUtilities, "localizedDateComponentsUnitsStyle"));
  [v4 setIncludesApproximationPhrase:0];
  [v4 setIncludesTimeRemainingPhrase:0];
  [v4 setAllowedUnits:96];
  id v5 = [v4 stringFromTimeInterval:a3];

  return v5;
}

- (void)handleGesture:(id)a3
{
  id v4 = [(PLBatteryUITimeUsageCell *)self delegate];

  if (v4)
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    [WeakRetained didTappedBar:&off_C96B0];
  }
}

- (PLBatteryUITimeUsageTapDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (PLBatteryUITimeUsageTapDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
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

- (BOOL)previousBreakdownNotAvailable
{
  return self->_previousBreakdownNotAvailable;
}

- (void)setPreviousBreakdownNotAvailable:(BOOL)a3
{
  self->_previousBreakdownNotAvailable = a3;
}

- (NSMutableArray)bottomMarginConstraints
{
  return (NSMutableArray *)objc_getProperty(self, a2, 168, 1);
}

- (void)setBottomMarginConstraints:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_bottomMarginConstraints, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_screenOffTimeText, 0);
  objc_storeStrong((id *)&self->_screenOnTimeText, 0);
  objc_storeStrong((id *)&self->_screenOffText, 0);

  objc_storeStrong((id *)&self->_screenOnText, 0);
}

@end