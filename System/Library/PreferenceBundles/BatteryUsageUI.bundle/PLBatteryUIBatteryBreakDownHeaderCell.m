@interface PLBatteryUIBatteryBreakDownHeaderCell
- (NSLayoutConstraint)widthConstraint;
- (PLBatteryUIBatteryBreakDownHeaderCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4 specifier:(id)a5;
- (PLBatteryUITimeUsageCellDelegate)delegate;
- (UILabel)breakdownTitleLabel;
- (UILabel)breakdownToggleButton;
- (void)buttonAction:(id)a3;
- (void)refreshCellContentsWithSpecifier:(id)a3;
- (void)setBreakdownTitleLabel:(id)a3;
- (void)setBreakdownToggleButton:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setWidthConstraint:(id)a3;
- (void)updateButton;
- (void)updateConstraints;
@end

@implementation PLBatteryUIBatteryBreakDownHeaderCell

- (PLBatteryUIBatteryBreakDownHeaderCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4 specifier:(id)a5
{
  id v8 = a5;
  v51.receiver = self;
  v51.super_class = (Class)PLBatteryUIBatteryBreakDownHeaderCell;
  v9 = [(PLBatteryUIBatteryBreakDownHeaderCell *)&v51 initWithStyle:a3 reuseIdentifier:a4 specifier:v8];
  v10 = v9;
  if (v9)
  {
    v11 = [(PLBatteryUIBatteryBreakDownHeaderCell *)v9 contentView];
    id v12 = objc_alloc((Class)UILabel);
    double y = CGRectZero.origin.y;
    double width = CGRectZero.size.width;
    double height = CGRectZero.size.height;
    id v16 = objc_msgSend(v12, "initWithFrame:", CGRectZero.origin.x, y, width, height);
    [(PLBatteryUIBatteryBreakDownHeaderCell *)v10 setBreakdownTitleLabel:v16];

    v17 = [(PLBatteryUIBatteryBreakDownHeaderCell *)v10 breakdownTitleLabel];
    [v17 setAccessibilityIdentifier:@"TitleLabel"];

    v18 = +[UIFont preferredFontForTextStyle:UIFontTextStyleFootnote];
    v19 = [(PLBatteryUIBatteryBreakDownHeaderCell *)v10 breakdownTitleLabel];
    [v19 setFont:v18];

    v20 = [(PLBatteryUIBatteryBreakDownHeaderCell *)v10 breakdownTitleLabel];
    [v20 setTranslatesAutoresizingMaskIntoConstraints:0];

    v21 = +[UIColor _secondaryLabelColor];
    v22 = [(PLBatteryUIBatteryBreakDownHeaderCell *)v10 breakdownTitleLabel];
    [v22 setTextColor:v21];

    int64_t v23 = +[PLBatteryUIUtilities localizedLeftTextAlignment];
    v24 = [(PLBatteryUIBatteryBreakDownHeaderCell *)v10 breakdownTitleLabel];
    [v24 setTextAlignment:v23];

    v25 = +[UIColor clearColor];
    v26 = [(PLBatteryUIBatteryBreakDownHeaderCell *)v10 breakdownTitleLabel];
    [v26 setBackgroundColor:v25];

    v27 = [(PLBatteryUIBatteryBreakDownHeaderCell *)v10 breakdownTitleLabel];
    [v27 setNumberOfLines:0];

    v28 = [(PLBatteryUIBatteryBreakDownHeaderCell *)v10 breakdownTitleLabel];
    [v28 setLineBreakMode:0];

    v29 = [(PLBatteryUIBatteryBreakDownHeaderCell *)v10 breakdownTitleLabel];
    [v11 addSubview:v29];

    id v30 = objc_msgSend(objc_alloc((Class)UILabel), "initWithFrame:", CGRectZero.origin.x, y, width, height);
    [(PLBatteryUIBatteryBreakDownHeaderCell *)v10 setBreakdownToggleButton:v30];

    v31 = [(PLBatteryUIBatteryBreakDownHeaderCell *)v10 breakdownToggleButton];
    [v31 setAccessibilityIdentifier:@"ToggleButton"];

    v32 = [(PLBatteryUIBatteryBreakDownHeaderCell *)v10 breakdownToggleButton];
    [v32 setTranslatesAutoresizingMaskIntoConstraints:0];

    v33 = +[UIColor systemBlueColor];
    v34 = [(PLBatteryUIBatteryBreakDownHeaderCell *)v10 breakdownToggleButton];
    [v34 setTextColor:v33];

    v35 = [(PLBatteryUIBatteryBreakDownHeaderCell *)v10 breakdownToggleButton];
    [v35 setEnabled:1];

    v36 = [(PLBatteryUIBatteryBreakDownHeaderCell *)v10 breakdownToggleButton];
    [v36 setHidden:0];

    v37 = +[UIFont preferredFontForTextStyle:UIFontTextStyleFootnote];
    v38 = [(PLBatteryUIBatteryBreakDownHeaderCell *)v10 breakdownToggleButton];
    [v38 setFont:v37];

    v39 = [(PLBatteryUIBatteryBreakDownHeaderCell *)v10 breakdownToggleButton];
    [v39 setNumberOfLines:0];

    int64_t v40 = +[PLBatteryUIUtilities localizedRightTextAlignment];
    v41 = [(PLBatteryUIBatteryBreakDownHeaderCell *)v10 breakdownToggleButton];
    [v41 setTextAlignment:v40];

    v42 = [(PLBatteryUIBatteryBreakDownHeaderCell *)v10 breakdownToggleButton];
    [v42 setLineBreakMode:0];

    v43 = [(PLBatteryUIBatteryBreakDownHeaderCell *)v10 breakdownToggleButton];
    [v11 addSubview:v43];

    -[PLBatteryUIBatteryBreakDownHeaderCell setSeparatorInset:](v10, "setSeparatorInset:", 0.0, 0.0, 0.0, 0.0);
    v44 = [(PLBatteryUIBatteryBreakDownHeaderCell *)v10 breakdownTitleLabel];
    v52[0] = v44;
    v45 = [(PLBatteryUIBatteryBreakDownHeaderCell *)v10 breakdownToggleButton];
    v52[1] = v45;
    v46 = +[NSArray arrayWithObjects:v52 count:2];
    [v11 setAccessibilityElements:v46];

    v47 = [(PLBatteryUIBatteryBreakDownHeaderCell *)v10 breakdownToggleButton];
    [v47 setUserInteractionEnabled:1];

    id v48 = [objc_alloc((Class)UITapGestureRecognizer) initWithTarget:v10 action:"buttonAction:"];
    [v48 setNumberOfTapsRequired:1];
    v49 = [(PLBatteryUIBatteryBreakDownHeaderCell *)v10 breakdownToggleButton];
    [v49 addGestureRecognizer:v48];

    [(PLBatteryUIBatteryBreakDownHeaderCell *)v10 refreshCellContentsWithSpecifier:v8];
  }

  return v10;
}

- (void)updateConstraints
{
  v3 = [(PLBatteryUIBatteryBreakDownHeaderCell *)self breakdownTitleLabel];
  v4 = [v3 text];
  v5 = [(PLBatteryUIBatteryBreakDownHeaderCell *)self breakdownTitleLabel];
  v6 = [v5 font];
  +[PLBatteryUIUtilities getOneLineWidthOfText:v4 withFont:v6];
  double v8 = v7;

  v9 = [(PLBatteryUIBatteryBreakDownHeaderCell *)self breakdownToggleButton];
  v10 = [v9 text];
  v11 = [(PLBatteryUIBatteryBreakDownHeaderCell *)self breakdownToggleButton];
  id v12 = [v11 font];
  +[PLBatteryUIUtilities getOneLineWidthOfText:v10 withFont:v12];
  double v14 = v13;

  [(PLBatteryUIBatteryBreakDownHeaderCell *)self frame];
  if (v8 + v14 + 30.0 + 3.0 <= v15) {
    double v16 = v8 / v14;
  }
  else {
    double v16 = 1.0;
  }
  v17 = [(PLBatteryUIBatteryBreakDownHeaderCell *)self breakdownTitleLabel];
  v18 = [(PLBatteryUIBatteryBreakDownHeaderCell *)self breakdownToggleButton];
  v19 = +[NSLayoutConstraint constraintWithItem:v17 attribute:7 relatedBy:0 toItem:v18 attribute:7 multiplier:v16 constant:0.0];

  v20 = [(PLBatteryUIBatteryBreakDownHeaderCell *)self widthConstraint];

  if (v20)
  {
    v21 = [(PLBatteryUIBatteryBreakDownHeaderCell *)self contentView];
    v22 = [(PLBatteryUIBatteryBreakDownHeaderCell *)self widthConstraint];
    [v21 removeConstraint:v22];

    [(PLBatteryUIBatteryBreakDownHeaderCell *)self setWidthConstraint:v19];
    v35 = v19;
    int64_t v23 = +[NSArray arrayWithObjects:&v35 count:1];
    +[NSLayoutConstraint activateConstraints:v23];

    v34.receiver = self;
    v34.super_class = (Class)PLBatteryUIBatteryBreakDownHeaderCell;
    [(PLBatteryUIBatteryBreakDownHeaderCell *)&v34 updateConstraints];
  }
  else
  {
    v24 = +[NSMutableArray array];
    v25 = [(PLBatteryUIBatteryBreakDownHeaderCell *)self breakdownTitleLabel];
    [v25 sizeToFit];

    v26 = [(PLBatteryUIBatteryBreakDownHeaderCell *)self breakdownToggleButton];
    [v26 sizeToFit];

    v27 = _NSDictionaryOfVariableBindings(@"_breakdownTitleLabel, _breakdownToggleButton", self->_breakdownTitleLabel, self->_breakdownToggleButton, 0);
    v28 = _NSDictionaryOfVariableBindings(@"labelMargin", &off_C9440, 0);
    v29 = +[NSLayoutConstraint constraintsWithVisualFormat:options:metrics:views:](NSLayoutConstraint, "constraintsWithVisualFormat:options:metrics:views:", @"H:|-labelMargin-[_breakdownTitleLabel]-3-[_breakdownToggleButton]-labelMargin-|", 0, v28, v27);
    id v30 = +[NSLayoutConstraint constraintsWithVisualFormat:options:metrics:views:](NSLayoutConstraint, "constraintsWithVisualFormat:options:metrics:views:", @"V:|-5-[_breakdownTitleLabel]-5-|", 0, 0, v27);
    v31 = +[NSLayoutConstraint constraintsWithVisualFormat:options:metrics:views:](NSLayoutConstraint, "constraintsWithVisualFormat:options:metrics:views:", @"V:|-5-[_breakdownToggleButton]-5-|", 0, 0, v27);
    v32 = +[NSLayoutConstraint constraintsWithVisualFormat:@"V:[_breakdownTitleLabel(==_breakdownToggleButton)]" options:0 metrics:0 views:v27];
    [(PLBatteryUIBatteryBreakDownHeaderCell *)self setWidthConstraint:v19];
    [v24 addObjectsFromArray:v29];
    [v24 addObjectsFromArray:v30];
    [v24 addObjectsFromArray:v31];
    [v24 addObjectsFromArray:v32];
    [v24 addObject:v19];
    +[NSLayoutConstraint activateConstraints:v24];
    v33.receiver = self;
    v33.super_class = (Class)PLBatteryUIBatteryBreakDownHeaderCell;
    [(PLBatteryUIBatteryBreakDownHeaderCell *)&v33 updateConstraints];
  }
}

- (void)refreshCellContentsWithSpecifier:(id)a3
{
  id v4 = a3;
  v20.receiver = self;
  v20.super_class = (Class)PLBatteryUIBatteryBreakDownHeaderCell;
  [(PLBatteryUIBatteryBreakDownHeaderCell *)&v20 refreshCellContentsWithSpecifier:v4];
  v5 = [v4 propertyForKey:@"PLBatteryUIGraphBatteryBreakdownShortStringKey"];
  unsigned int v6 = [v5 BOOLValue];

  double v7 = [v4 propertyForKey:@"PLBatteryUITimeUsageCellDelegateWrapperKey"];

  if (v7)
  {
    double v8 = [v4 propertyForKey:@"PLBatteryUITimeUsageCellDelegateWrapperKey"];
    v9 = [v8 buiViewController];
    [(PLBatteryUIBatteryBreakDownHeaderCell *)self setDelegate:v9];
  }
  [(PLBatteryUIBatteryBreakDownHeaderCell *)self updateButton];
  v10 = [v4 propertyForKey:@"PLBatteryUIGraphTappedTimeDurationStringKey"];
  v11 = [v4 objectForKeyedSubscript:@"PLIconDisplayTypeKey"];
  unsigned int v12 = [v11 intValue];

  if (v12)
  {
    if (v10)
    {
      unsigned int v13 = +[BatteryUIResourceClass inDemoMode];
      if (v6)
      {
        if (v13)
        {
          +[BatteryUIResourceClass containerPath];
          double v14 = (void *)_CFPreferencesCopyValueWithContainer();
          if (v14) {
            goto LABEL_28;
          }
        }
        double v15 = @"USAGE_TIME_WITH_TIME";
      }
      else
      {
        if (v13)
        {
          +[BatteryUIResourceClass containerPath];
          double v14 = (void *)_CFPreferencesCopyValueWithContainer();
          if (v14) {
            goto LABEL_28;
          }
        }
        double v15 = @"USAGE_TIME_BY_APP_WITH_TIME";
      }
LABEL_27:
      double v14 = BatteryUILocalization(v15);
LABEL_28:
      v17 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", v14, v10);

      goto LABEL_29;
    }
    if (!+[BatteryUIResourceClass inDemoMode]
      || (+[BatteryUIResourceClass containerPath],
          (v17 = (void *)_CFPreferencesCopyValueWithContainer()) == 0))
    {
      v18 = @"USAGE_TIME_BY_APP";
LABEL_23:
      v17 = BatteryUILocalization(v18);
    }
  }
  else
  {
    if (v10)
    {
      unsigned int v16 = +[BatteryUIResourceClass inDemoMode];
      if (v6)
      {
        if (v16)
        {
          +[BatteryUIResourceClass containerPath];
          double v14 = (void *)_CFPreferencesCopyValueWithContainer();
          if (v14) {
            goto LABEL_28;
          }
        }
        double v15 = @"BATTERY_USAGE_WITH_TIME";
      }
      else
      {
        if (v16)
        {
          +[BatteryUIResourceClass containerPath];
          double v14 = (void *)_CFPreferencesCopyValueWithContainer();
          if (v14) {
            goto LABEL_28;
          }
        }
        double v15 = @"BATTERY_USAGE_BY_APP_WITH_TIME";
      }
      goto LABEL_27;
    }
    if (!+[BatteryUIResourceClass inDemoMode]
      || (+[BatteryUIResourceClass containerPath],
          (v17 = (void *)_CFPreferencesCopyValueWithContainer()) == 0))
    {
      v18 = @"BATTERY_USAGE_BY_APP";
      goto LABEL_23;
    }
  }
LABEL_29:
  v19 = [(PLBatteryUIBatteryBreakDownHeaderCell *)self breakdownTitleLabel];
  [v19 setText:v17];

  [(PLBatteryUIBatteryBreakDownHeaderCell *)self setNeedsUpdateConstraints];
  [(PLBatteryUIBatteryBreakDownHeaderCell *)self setNeedsDisplay];
}

- (void)updateButton
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->PSTableCell_opaque[OBJC_IVAR___PSTableCell__specifier]);
  id v4 = [WeakRetained objectForKeyedSubscript:@"PLIconDisplayTypeKey"];
  unsigned int v5 = [v4 intValue];
  unsigned int v6 = +[BatteryUIResourceClass inDemoMode];
  if (v5)
  {
    if (v6)
    {
      +[BatteryUIResourceClass containerPath];
      double v7 = @"SHOW_BATTERY_USAGE";
      goto LABEL_6;
    }
    double v7 = @"SHOW_BATTERY_USAGE";
  }
  else
  {
    if (v6)
    {
      +[BatteryUIResourceClass containerPath];
      double v7 = @"SHOW_USAGE_TIME";
LABEL_6:
      uint64_t v8 = _CFPreferencesCopyValueWithContainer();
      if (v8) {
        goto LABEL_11;
      }
      goto LABEL_10;
    }
    double v7 = @"SHOW_USAGE_TIME";
  }
LABEL_10:
  uint64_t v8 = BatteryUILocalization(v7);
LABEL_11:
  id v11 = (id)v8;

  v9 = [(PLBatteryUIBatteryBreakDownHeaderCell *)self breakdownToggleButton];
  [v9 setText:v11];

  v10 = [(PLBatteryUIBatteryBreakDownHeaderCell *)self breakdownToggleButton];
  [v10 sizeToFit];
}

- (void)buttonAction:(id)a3
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  [WeakRetained didPushBatteryButton:self];
}

- (PLBatteryUITimeUsageCellDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (PLBatteryUITimeUsageCellDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (UILabel)breakdownTitleLabel
{
  return (UILabel *)objc_getProperty(self, a2, 128, 1);
}

- (void)setBreakdownTitleLabel:(id)a3
{
}

- (UILabel)breakdownToggleButton
{
  return (UILabel *)objc_getProperty(self, a2, 136, 1);
}

- (void)setBreakdownToggleButton:(id)a3
{
}

- (NSLayoutConstraint)widthConstraint
{
  return (NSLayoutConstraint *)objc_getProperty(self, a2, 144, 1);
}

- (void)setWidthConstraint:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_widthConstraint, 0);
  objc_storeStrong((id *)&self->_breakdownToggleButton, 0);
  objc_storeStrong((id *)&self->_breakdownTitleLabel, 0);

  objc_destroyWeak((id *)&self->_delegate);
}

@end