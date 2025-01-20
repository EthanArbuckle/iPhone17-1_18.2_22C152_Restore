@interface PLBatteryUIBatteryGroupHeader
+ (id)headerViewWithRange:(id)a3 Cycles:(id)a4;
- (PLBatteryUIBatteryGroupHeader)initWithFrame:(CGRect)a3;
- (PLBatteryUIBatteryGroupHeader)initWithFrame:(CGRect)a3 range:(id)a4 cycles:(id)a5;
- (PLBatteryUIBatteryGroupHeader)initWithSpecifier:(id)a3;
- (PLBatteryUIBatteryGroupHeaderDelegate)delegate;
- (void)layoutSubviews;
- (void)refresh1:(id)a3;
- (void)setCycle:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setRange:(id)a3;
@end

@implementation PLBatteryUIBatteryGroupHeader

+ (id)headerViewWithRange:(id)a3 Cycles:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  v7 = objc_alloc_init(PLBatteryUIBatteryGroupHeader);
  [(PLBatteryUIBatteryGroupHeader *)v7 setRange:v6];

  [(PLBatteryUIBatteryGroupHeader *)v7 setCycle:v5];

  return v7;
}

- (PLBatteryUIBatteryGroupHeader)initWithSpecifier:(id)a3
{
  id v4 = a3;
  id v5 = [v4 objectForKeyedSubscript:@"PLBatteryUIDurationValueKey"];
  usageDuration = self->_usageDuration;
  self->_usageDuration = v5;

  v7 = [v4 objectForKeyedSubscript:@"PLBatteryUITitleLabelString"];
  titleLabelString = self->_titleLabelString;
  self->_titleLabelString = v7;

  v9 = [v4 objectForKeyedSubscript:@"PLIconDisplayTypeKey"];
  self->_iconDisplayType = [v9 intValue];

  v10 = [v4 propertyForKey:@"PLBatteryUIBatteryGroupHeaderDelegateKey"];

  [(PLBatteryUIBatteryGroupHeader *)self setDelegate:v10];
  double y = CGRectZero.origin.y;
  double width = CGRectZero.size.width;
  double height = CGRectZero.size.height;

  return -[PLBatteryUIBatteryGroupHeader initWithFrame:](self, "initWithFrame:", CGRectZero.origin.x, y, width, height);
}

- (PLBatteryUIBatteryGroupHeader)initWithFrame:(CGRect)a3
{
  v19.receiver = self;
  v19.super_class = (Class)PLBatteryUIBatteryGroupHeader;
  v3 = -[PLBatteryUIBatteryGroupHeader initWithFrame:](&v19, "initWithFrame:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    id v4 = objc_alloc((Class)UILabel);
    double y = CGRectZero.origin.y;
    double width = CGRectZero.size.width;
    double height = CGRectZero.size.height;
    v8 = (UILabel *)objc_msgSend(v4, "initWithFrame:", CGRectZero.origin.x, y, width, height);
    batteryChargeCyclesString = v3->_batteryChargeCyclesString;
    v3->_batteryChargeCyclesString = v8;

    v10 = PreferencesTableViewHeaderFont();
    [(UILabel *)v3->_batteryChargeCyclesString setFont:v10];

    v11 = PreferencesTableViewHeaderColor();
    [(UILabel *)v3->_batteryChargeCyclesString setTextColor:v11];

    [(UILabel *)v3->_batteryChargeCyclesString setTextAlignment:2];
    v12 = +[UIColor clearColor];
    [(UILabel *)v3->_batteryChargeCyclesString setBackgroundColor:v12];

    [(PLBatteryUIBatteryGroupHeader *)v3 addSubview:v3->_batteryChargeCyclesString];
    v13 = (UILabel *)objc_msgSend(objc_alloc((Class)UILabel), "initWithFrame:", CGRectZero.origin.x, y, width, height);
    titleLabel = v3->_titleLabel;
    v3->_titleLabel = v13;

    v15 = PreferencesTableViewHeaderFont();
    [(UILabel *)v3->_titleLabel setFont:v15];

    v16 = PreferencesTableViewHeaderColor();
    [(UILabel *)v3->_titleLabel setTextColor:v16];

    [(UILabel *)v3->_titleLabel setTextAlignment:0];
    v17 = +[UIColor clearColor];
    [(UILabel *)v3->_titleLabel setBackgroundColor:v17];

    [(PLBatteryUIBatteryGroupHeader *)v3 addSubview:v3->_titleLabel];
  }
  return v3;
}

- (PLBatteryUIBatteryGroupHeader)initWithFrame:(CGRect)a3 range:(id)a4 cycles:(id)a5
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  id v12 = a4;
  id v13 = a5;
  v14 = -[PLBatteryUIBatteryGroupHeader initWithFrame:](self, "initWithFrame:", x, y, width, height);
  v15 = v14;
  if (v14)
  {
    objc_storeStrong((id *)&v14->_rangeString, a4);
    objc_storeStrong((id *)&v15->_cycles, a5);
  }

  return v15;
}

- (void)setRange:(id)a3
{
}

- (void)setCycle:(id)a3
{
}

- (void)layoutSubviews
{
  [(PLBatteryUIBatteryGroupHeader *)self bounds];
  double v4 = v3;
  id v5 = [(PLBatteryUIBatteryGroupHeader *)self superview];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if (isKindOfClass)
  {
    v7 = [(PLBatteryUIBatteryGroupHeader *)self superview];
    [v7 _backgroundInset];
    double v9 = v8;

    double v10 = v9 + 15.0;
    [(UILabel *)self->_titleLabel setText:self->_titleLabelString];
    [(UILabel *)self->_titleLabel setTextAlignment:2];
    [(UILabel *)self->_titleLabel sizeToFit];
    double v11 = v4 + v10 * -2.0;
    [(UILabel *)self->_batteryChargeCyclesString frame];
    double v13 = v12;
    double v15 = v14;
    double v16 = v4 - v10;
    [(UILabel *)self->_batteryChargeCyclesString size];
    double v18 = v4 - v10 - v17;
    if (v11 >= v13) {
      double v19 = v13;
    }
    else {
      double v19 = v4 + v10 * -2.0;
    }
    -[UILabel setFrame:](self->_batteryChargeCyclesString, "setFrame:", v18, v10, v19, v15);
    [(UILabel *)self->_titleLabel frame];
    double v21 = v20;
    double v23 = v22;
    id v24 = [UIApp userInterfaceLayoutDirection];
    double v25 = v16 - v21;
    if (!v24) {
      double v25 = v10;
    }
    titleLabel = self->_titleLabel;
    if (v11 >= v21) {
      double v27 = v21;
    }
    else {
      double v27 = v11;
    }
    -[UILabel setFrame:](titleLabel, "setFrame:", v25, v10, v27, v23);
  }
}

- (void)refresh1:(id)a3
{
  double v4 = [(PLBatteryUIBatteryGroupHeader *)self delegate];

  if (v4)
  {
    id v5 = [(PLBatteryUIBatteryGroupHeader *)self delegate];
    char v6 = objc_opt_respondsToSelector();

    if (v6)
    {
      id v7 = [(PLBatteryUIBatteryGroupHeader *)self delegate];
      [v7 didPushBatteryButton:self];
    }
  }
}

- (PLBatteryUIBatteryGroupHeaderDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (PLBatteryUIBatteryGroupHeaderDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_toggleImageOn, 0);
  objc_storeStrong((id *)&self->_backgroundImageOff, 0);
  objc_storeStrong((id *)&self->_foregroundImageOff, 0);
  objc_storeStrong((id *)&self->_batteryImageOff, 0);
  objc_storeStrong((id *)&self->_backgroundImageOn, 0);
  objc_storeStrong((id *)&self->_foregroundImageOn, 0);
  objc_storeStrong((id *)&self->_batteryImageOn, 0);
  objc_storeStrong((id *)&self->_backgroundImage, 0);
  objc_storeStrong((id *)&self->_foregroundImage, 0);
  objc_storeStrong((id *)&self->_batteryImage, 0);
  objc_storeStrong((id *)&self->_siriImage, 0);
  objc_storeStrong((id *)&self->_button3, 0);
  objc_storeStrong((id *)&self->_button2, 0);
  objc_storeStrong((id *)&self->_button1, 0);
  objc_storeStrong((id *)&self->_usageDuration, 0);
  objc_storeStrong((id *)&self->_titleLabelString, 0);
  objc_storeStrong((id *)&self->_titleLabel, 0);
  objc_storeStrong((id *)&self->_batteryChargeCyclesString, 0);
  objc_storeStrong((id *)&self->_cycles, 0);

  objc_storeStrong((id *)&self->_rangeString, 0);
}

@end