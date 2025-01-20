@interface ChargingStatusViewTableCell
+ (id)reuseIdentifierForClassAndType:(int64_t)a3;
- (BOOL)canReload;
- (ChargingStatusViewTableCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4;
- (void)layoutSubviews;
- (void)refreshCellContentsWithSpecifier:(id)a3;
@end

@implementation ChargingStatusViewTableCell

+ (id)reuseIdentifierForClassAndType:(int64_t)a3
{
  return @"PSBUIChargingStatusViewTableCell";
}

- (ChargingStatusViewTableCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  v8.receiver = self;
  v8.super_class = (Class)ChargingStatusViewTableCell;
  v4 = [(ChargingStatusViewTableCell *)&v8 initWithStyle:a3 reuseIdentifier:a4];
  v5 = v4;
  if (v4)
  {
    [(ChargingStatusViewTableCell *)v4 setSelectionStyle:0];
    [(ChargingStatusViewTableCell *)v5 setSeparatorStyle:0];
    chargingStatusViewController = v5->_chargingStatusViewController;
    v5->_chargingStatusViewController = 0;
  }
  return v5;
}

- (void)refreshCellContentsWithSpecifier:(id)a3
{
  uint64_t v4 = [a3 propertyForKey:@"PLBatteryUIChargingStatusViewControllerKey"];
  p_chargingStatusViewController = &self->_chargingStatusViewController;
  chargingStatusViewController = self->_chargingStatusViewController;
  if (chargingStatusViewController != (UIViewController *)v4)
  {
    id obj = (id)v4;
    if (chargingStatusViewController)
    {
      v7 = [(UIViewController *)chargingStatusViewController view];
      [v7 removeFromSuperview];
    }
    objc_storeStrong((id *)&self->_chargingStatusViewController, obj);
    objc_super v8 = [(ChargingStatusViewTableCell *)self contentView];
    [v8 bounds];
    double v10 = v9;
    double v12 = v11;
    double v14 = v13;
    double v16 = v15;
    v17 = [(UIViewController *)*p_chargingStatusViewController view];
    objc_msgSend(v17, "setFrame:", v10, v12, v14, v16);

    v18 = [(UIViewController *)*p_chargingStatusViewController view];
    [v18 setAutoresizingMask:18];

    v19 = [(UIViewController *)*p_chargingStatusViewController view];
    [v19 setTranslatesAutoresizingMaskIntoConstraints:1];

    v20 = [(ChargingStatusViewTableCell *)self contentView];
    v21 = [(UIViewController *)*p_chargingStatusViewController view];
    [v20 addSubview:v21];
  }

  _objc_release_x1();
}

- (void)layoutSubviews
{
  [(ChargingStatusViewTableCell *)self setSeparatorStyle:0];
  v3.receiver = self;
  v3.super_class = (Class)ChargingStatusViewTableCell;
  [(ChargingStatusViewTableCell *)&v3 layoutSubviews];
}

- (BOOL)canReload
{
  return 0;
}

- (void).cxx_destruct
{
}

@end