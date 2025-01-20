@interface StocksAssistantStockDetailCell
- (StocksAssistantStockDetailCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4;
- (void)chartUpdater:(id)a3 didFailWithError:(id)a4;
- (void)chartUpdater:(id)a3 didReceiveStockChartData:(id)a4;
- (void)layoutSubviews;
- (void)setStockObject:(id)a3;
@end

@implementation StocksAssistantStockDetailCell

- (StocksAssistantStockDetailCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  v11.receiver = self;
  v11.super_class = (Class)StocksAssistantStockDetailCell;
  v4 = [(StocksAssistantStockCell *)&v11 initWithStyle:a3 reuseIdentifier:a4];
  if (v4)
  {
    uint64_t v5 = objc_opt_new();
    chartUpdater = v4->_chartUpdater;
    v4->_chartUpdater = (ChartUpdater *)v5;

    [(ChartUpdater *)v4->_chartUpdater setDelegate:v4];
    v7 = +[NetPreferences sharedPreferences];
    [v7 setNetworkReachable:1];

    v8 = -[StocksAssistantChartView initWithFrame:]([StocksAssistantChartView alloc], "initWithFrame:", CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height);
    stockChart = v4->_stockChart;
    v4->_stockChart = v8;

    [(StocksAssistantStockDetailCell *)v4 addSubview:v4->_stockChart];
  }
  return v4;
}

- (void)setStockObject:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    sub_6C60();
  }
  v10.receiver = self;
  v10.super_class = (Class)StocksAssistantStockDetailCell;
  [(StocksAssistantStockCell *)&v10 setStockObject:v4];
  uint64_t v5 = [(StocksAssistantStockCell *)self stock];
  [(StocksAssistantChartView *)self->_stockChart setStock:v5];

  v6 = [v4 chartData];

  chartUpdater = self->_chartUpdater;
  if (v6)
  {
    v8 = [v4 chartData];
    v9 = [v8 dataUsingEncoding:4];
    [(ChartUpdater *)chartUpdater parseData:v9];
  }
  else
  {
    v8 = [(StocksAssistantStockCell *)self stock];
    [(ChartUpdater *)chartUpdater updateChartForStock:v8 interval:0];
  }

  [(StocksAssistantStockDetailCell *)self setNeedsLayout];
}

- (void)layoutSubviews
{
  unsigned int v3 = +[NAUIDeviceUtilities naui_isPad];
  v9.receiver = self;
  v9.super_class = (Class)StocksAssistantStockDetailCell;
  [(StocksAssistantStockDetailCell *)&v9 layoutSubviews];
  id v4 = +[UIColor clearColor];
  [(StocksAssistantStockDetailCell *)self setBackgroundColor:v4];

  [(StocksAssistantStockDetailCell *)self bounds];
  double v6 = v5;
  if (v3)
  {
    RoundToPixel();
    double v8 = v7;
  }
  else
  {
    double v8 = 80.0;
  }
  -[StocksAssistantChartView setFrame:](self->_stockChart, "setFrame:", SiriUIPlatterStyle[32], 0.0, v6 - SiriUIPlatterStyle[32] - SiriUIPlatterStyle[34], v8);
}

- (void)chartUpdater:(id)a3 didReceiveStockChartData:(id)a4
{
}

- (void)chartUpdater:(id)a3 didFailWithError:(id)a4
{
  id v4 = a4;
  double v5 = StocksLogForCategory();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
    sub_6C8C((uint64_t)v4, v5);
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_chartUpdater, 0);

  objc_storeStrong((id *)&self->_stockChart, 0);
}

@end