@interface PLBatteryUIGraphViewTableCell
+ (id)reuseIdentifierForClassAndType:(int64_t)a3;
- (BOOL)canReload;
- (PLBatteryUIGraphViewTableCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4;
- (void)layoutSubviews;
- (void)refreshCellContentsWithSpecifier:(id)a3;
@end

@implementation PLBatteryUIGraphViewTableCell

+ (id)reuseIdentifierForClassAndType:(int64_t)a3
{
  return @"PSBUIGraphViewTableCellCoreChart";
}

- (PLBatteryUIGraphViewTableCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  v10.receiver = self;
  v10.super_class = (Class)PLBatteryUIGraphViewTableCell;
  v4 = [(PLBatteryUIGraphViewTableCell *)&v10 initWithStyle:a3 reuseIdentifier:a4];
  v5 = v4;
  if (v4)
  {
    [(PLBatteryUIGraphViewTableCell *)v4 setSelectionStyle:0];
    [(PLBatteryUIGraphViewTableCell *)v5 setSeparatorStyle:0];
    controller = v5->_controller;
    v5->_controller = 0;

    v7 = +[BatteryUIResourceClass get_log_handle_bui];
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v9 = 0;
      _os_log_impl(&dword_0, v7, OS_LOG_TYPE_INFO, "CCGraph: initWithStyle:reuseIdentifier:", v9, 2u);
    }
  }
  return v5;
}

- (void)refreshCellContentsWithSpecifier:(id)a3
{
  uint64_t v4 = [a3 propertyForKey:@"PLBatteryUIGraphViewControllerKey"];
  p_controller = &self->_controller;
  controller = self->_controller;
  if (controller != (_TtC14BatteryUsageUI24PLBUIChartViewController *)v4)
  {
    id obj = (id)v4;
    if (controller)
    {
      v7 = [(PLBUIChartViewController *)controller view];
      [v7 removeFromSuperview];
    }
    objc_storeStrong((id *)&self->_controller, obj);
    v8 = [(PLBatteryUIGraphViewTableCell *)self contentView];
    [v8 bounds];
    double v10 = v9;
    double v12 = v11;
    double v14 = v13;
    double v16 = v15;
    v17 = [(PLBUIChartViewController *)*p_controller view];
    objc_msgSend(v17, "setFrame:", v10, v12, v14, v16);

    v18 = [(PLBUIChartViewController *)*p_controller view];
    [v18 setAutoresizingMask:18];

    v19 = [(PLBUIChartViewController *)*p_controller view];
    [v19 setTranslatesAutoresizingMaskIntoConstraints:1];

    v20 = [(PLBatteryUIGraphViewTableCell *)self contentView];
    v21 = [(PLBUIChartViewController *)*p_controller view];
    [v20 addSubview:v21];
  }

  _objc_release_x1();
}

- (void)layoutSubviews
{
  [(PLBatteryUIGraphViewTableCell *)self setSeparatorStyle:0];
  v3.receiver = self;
  v3.super_class = (Class)PLBatteryUIGraphViewTableCell;
  [(PLBatteryUIGraphViewTableCell *)&v3 layoutSubviews];
}

- (BOOL)canReload
{
  return 0;
}

- (void).cxx_destruct
{
}

@end