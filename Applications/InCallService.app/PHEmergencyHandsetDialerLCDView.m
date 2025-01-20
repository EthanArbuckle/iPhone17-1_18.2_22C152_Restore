@interface PHEmergencyHandsetDialerLCDView
- (BOOL)shrinkLabelWhenNumbersEntered;
- (BOOL)textFieldShouldBeginEditing:(id)a3;
- (PHEmergencyHandsetDialerLCDView)initWithFrame:(CGRect)a3 forDialerType:(int)a4;
- (PHTextCycleLabel)emergencyTitleLabel;
- (double)_emergencyDialerFontSize;
- (id)newAddContactButton;
- (int64_t)numberOfLinesInEmergencyTitleLabel;
- (void)_applyLayoutConstraints;
- (void)_updateEmergencyLabel;
- (void)deleteCharacter;
- (void)setText:(id)a3 needsFormat:(BOOL)a4;
- (void)setText:(id)a3 needsFormat:(BOOL)a4 name:(id)a5 label:(id)a6;
@end

@implementation PHEmergencyHandsetDialerLCDView

- (PHEmergencyHandsetDialerLCDView)initWithFrame:(CGRect)a3 forDialerType:(int)a4
{
  v20.receiver = self;
  v20.super_class = (Class)PHEmergencyHandsetDialerLCDView;
  v4 = -[PHHandsetDialerLCDView initWithFrame:forDialerType:](&v20, "initWithFrame:forDialerType:", *(void *)&a4, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v4)
  {
    v5 = +[UIColor blackColor];
    v6 = [(PHHandsetDialerLCDView *)v4 numberTextField];
    [v6 setTextColor:v5];

    v7 = +[NSBundle mainBundle];
    v8 = [v7 localizedStringForKey:@"EMERGENCY_CALL_STRINGS" value:&stru_1002D6110 table:@"EmergencyCallStrings"];
    v9 = [v8 componentsSeparatedByString:@","];

    v10 = +[NSBundle mainBundle];
    v11 = [v10 localizedStringForKey:@"EMERGENCY_CALL" value:&stru_1002D6110 table:@"EmergencyCallStrings"];

    if (v11 && ([v9 containsObject:v11] & 1) == 0)
    {
      v12 = +[NSMutableArray arrayWithArray:v9];
      [v12 insertObject:v11 atIndex:0];
      uint64_t v13 = +[NSArray arrayWithArray:v12];

      v9 = (void *)v13;
    }
    v14 = objc_alloc_init(PHTextCycleLabel);
    emergencyTitleLabel = v4->_emergencyTitleLabel;
    v4->_emergencyTitleLabel = v14;

    [(PHEmergencyHandsetDialerLCDView *)v4 _emergencyDialerFontSize];
    v16 = +[UIFont systemFontOfSize:](UIFont, "systemFontOfSize:");
    [(PHTextCycleLabel *)v4->_emergencyTitleLabel setFont:v16];

    [(PHTextCycleLabel *)v4->_emergencyTitleLabel setTextAlignment:1];
    v17 = +[UIColor systemRedColor];
    [(PHTextCycleLabel *)v4->_emergencyTitleLabel setTextColor:v17];

    v18 = +[UIColor clearColor];
    [(PHTextCycleLabel *)v4->_emergencyTitleLabel setBackgroundColor:v18];

    [(PHTextCycleLabel *)v4->_emergencyTitleLabel setOpaque:0];
    [(PHTextCycleLabel *)v4->_emergencyTitleLabel setTranslatesAutoresizingMaskIntoConstraints:0];
    [(PHTextCycleLabel *)v4->_emergencyTitleLabel setCycleStrings:v9];
    [(PHTextCycleLabel *)v4->_emergencyTitleLabel startCyclingStrings];
    [(PHEmergencyHandsetDialerLCDView *)v4 addSubview:v4->_emergencyTitleLabel];
    [(PHEmergencyHandsetDialerLCDView *)v4 _applyLayoutConstraints];
    [(PHEmergencyHandsetDialerLCDView *)v4 setClipsToBounds:0];
  }
  return v4;
}

- (id)newAddContactButton
{
  return 0;
}

- (void)_applyLayoutConstraints
{
  v22[0] = @"emergencyLabel";
  v3 = [(PHEmergencyHandsetDialerLCDView *)self emergencyTitleLabel];
  v22[1] = @"numberLabel";
  v23[0] = v3;
  v4 = [(PHHandsetDialerLCDView *)self numberTextField];
  v23[1] = v4;
  v5 = +[NSDictionary dictionaryWithObjects:v23 forKeys:v22 count:2];

  v6 = +[NSLayoutConstraint constraintsWithVisualFormat:@"|[emergencyLabel]|" options:0 metrics:0 views:v5];
  [(PHEmergencyHandsetDialerLCDView *)self addConstraints:v6];

  v7 = +[NSLayoutConstraint constraintsWithVisualFormat:options:metrics:views:](NSLayoutConstraint, "constraintsWithVisualFormat:options:metrics:views:", @"|-[numberLabel]-|", 0x10000, 0, v5);
  [(PHEmergencyHandsetDialerLCDView *)self addConstraints:v7];

  v8 = [(PHEmergencyHandsetDialerLCDView *)self emergencyTitleLabel];
  +[PHUIConfiguration yOffsetForDialerLCDView];
  v10 = +[NSLayoutConstraint constraintWithItem:v8 attribute:11 relatedBy:0 toItem:self attribute:3 multiplier:1.0 constant:v9];
  [(PHEmergencyHandsetDialerLCDView *)self addConstraint:v10];

  v11 = [(PHEmergencyHandsetDialerLCDView *)self emergencyTitleLabel];
  v12 = +[NSLayoutConstraint constraintWithItem:self attribute:4 relatedBy:0 toItem:v11 attribute:11 multiplier:1.0 constant:0.0];
  [(PHEmergencyHandsetDialerLCDView *)self addConstraint:v12];

  uint64_t v13 = [(PHEmergencyHandsetDialerLCDView *)self emergencyTitleLabel];
  v14 = +[NSLayoutConstraint constraintWithItem:v13 attribute:9 relatedBy:0 toItem:self attribute:9 multiplier:1.0 constant:0.0];
  [(PHEmergencyHandsetDialerLCDView *)self addConstraint:v14];

  v15 = [(PHEmergencyHandsetDialerLCDView *)self emergencyTitleLabel];
  v16 = [(PHHandsetDialerLCDView *)self numberTextField];
  [(PHHandsetDialerLCDView *)self spacingBetweenNumberBaselineAndNameBaseline];
  v18 = +[NSLayoutConstraint constraintWithItem:v15 attribute:11 relatedBy:0 toItem:v16 attribute:11 multiplier:1.0 constant:v17];
  [(PHEmergencyHandsetDialerLCDView *)self addConstraint:v18];

  v19 = [(PHEmergencyHandsetDialerLCDView *)self emergencyTitleLabel];
  objc_super v20 = [(PHHandsetDialerLCDView *)self numberTextField];
  v21 = +[NSLayoutConstraint constraintWithItem:v19 attribute:9 relatedBy:0 toItem:v20 attribute:9 multiplier:1.0 constant:0.0];
  [(PHEmergencyHandsetDialerLCDView *)self addConstraint:v21];
}

- (BOOL)textFieldShouldBeginEditing:(id)a3
{
  return 0;
}

- (void)_updateEmergencyLabel
{
  if (![(PHEmergencyHandsetDialerLCDView *)self shrinkLabelWhenNumbersEntered]) {
    return;
  }
  v3 = [(PHHandsetDialerLCDView *)self numberTextField];
  v4 = [v3 text];
  if ([v4 length])
  {
    v5 = [(PHTextCycleLabel *)self->_emergencyTitleLabel font];
    [v5 pointSize];
    double v7 = v6;
    [(PHEmergencyHandsetDialerLCDView *)self _emergencyDialerFontSize];
    double v9 = v8;

    if (v7 == v9)
    {
      uint64_t v10 = +[UIFont systemFontOfSize:11.0];
      id v16 = (id)v10;
      emergencyTitleLabel = self->_emergencyTitleLabel;
LABEL_10:
      [(PHTextCycleLabel *)emergencyTitleLabel setFont:v10];
      goto LABEL_11;
    }
  }
  else
  {
  }
  id v16 = [(PHHandsetDialerLCDView *)self numberTextField];
  v12 = [v16 text];
  if (![v12 length])
  {
    uint64_t v13 = [(PHTextCycleLabel *)self->_emergencyTitleLabel font];
    [v13 pointSize];
    double v15 = v14;

    if (v15 != 11.0) {
      return;
    }
    [(PHEmergencyHandsetDialerLCDView *)self _emergencyDialerFontSize];
    uint64_t v10 = +[UIFont systemFontOfSize:](UIFont, "systemFontOfSize:");
    id v16 = (id)v10;
    emergencyTitleLabel = self->_emergencyTitleLabel;
    goto LABEL_10;
  }

LABEL_11:
}

- (void)setText:(id)a3 needsFormat:(BOOL)a4 name:(id)a5 label:(id)a6
{
  v7.receiver = self;
  v7.super_class = (Class)PHEmergencyHandsetDialerLCDView;
  [(PHHandsetDialerLCDView *)&v7 setText:a3 needsFormat:a4 name:a5 label:a6];
  [(PHEmergencyHandsetDialerLCDView *)self _updateEmergencyLabel];
}

- (void)setText:(id)a3 needsFormat:(BOOL)a4
{
  v5.receiver = self;
  v5.super_class = (Class)PHEmergencyHandsetDialerLCDView;
  [(PHHandsetDialerLCDView *)&v5 setText:a3 needsFormat:a4];
  [(PHEmergencyHandsetDialerLCDView *)self _updateEmergencyLabel];
}

- (void)deleteCharacter
{
  v3.receiver = self;
  v3.super_class = (Class)PHEmergencyHandsetDialerLCDView;
  [(PHHandsetDialerLCDView *)&v3 deleteCharacter];
  [(PHEmergencyHandsetDialerLCDView *)self _updateEmergencyLabel];
}

- (double)_emergencyDialerFontSize
{
  unint64_t v2 = +[PHUIConfiguration handsetDialerSize];
  double result = 17.0;
  if (v2 - 1 <= 3) {
    return dbl_100284F00[v2 - 1];
  }
  return result;
}

- (BOOL)shrinkLabelWhenNumbersEntered
{
  return (id)+[PHUIConfiguration handsetDialerSize] == (id)1;
}

- (int64_t)numberOfLinesInEmergencyTitleLabel
{
  [(PHTextCycleLabel *)self->_emergencyTitleLabel frame];
  double v4 = v3;
  objc_super v5 = [(PHTextCycleLabel *)self->_emergencyTitleLabel font];
  [v5 lineHeight];
  double v7 = v6;

  double v8 = [(PHTextCycleLabel *)self->_emergencyTitleLabel text];
  NSAttributedStringKey v14 = NSFontAttributeName;
  double v9 = [(PHTextCycleLabel *)self->_emergencyTitleLabel font];
  double v15 = v9;
  uint64_t v10 = +[NSDictionary dictionaryWithObjects:&v15 forKeys:&v14 count:1];
  [v8 boundingRectWithSize:1 options:v10 attributes:0 context:v4];
  double v12 = v11;

  return (uint64_t)(v12 / v7);
}

- (PHTextCycleLabel)emergencyTitleLabel
{
  return (PHTextCycleLabel *)objc_getProperty(self, a2, 128, 1);
}

- (void).cxx_destruct
{
}

@end