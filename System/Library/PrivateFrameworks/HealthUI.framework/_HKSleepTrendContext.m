@interface _HKSleepTrendContext
- (BOOL)unselectedContextShouldUseContextBaseType;
- (HKDisplayType)baseDisplayType;
- (HKOverlaySleepRoomContextChangeDelegate)contextChangeDelegate;
- (_HKSleepTrendContext)initWithBaseDisplayType:(id)a3 trendModel:(id)a4 overlayChartController:(id)a5 applicationItems:(id)a6 overlayMode:(int64_t)a7 contextChangeDelegate:(id)a8;
- (void)overlayStateWillChange:(BOOL)a3 contextItem:(id)a4 chartController:(id)a5;
- (void)setContextChangeDelegate:(id)a3;
@end

@implementation _HKSleepTrendContext

- (_HKSleepTrendContext)initWithBaseDisplayType:(id)a3 trendModel:(id)a4 overlayChartController:(id)a5 applicationItems:(id)a6 overlayMode:(int64_t)a7 contextChangeDelegate:(id)a8
{
  id v15 = a3;
  id v16 = a8;
  v20.receiver = self;
  v20.super_class = (Class)_HKSleepTrendContext;
  v17 = [(HKOverlayRoomTrendContext *)&v20 initWithBaseDisplayType:v15 trendModel:a4 overlayChartController:a5 applicationItems:a6 overlayMode:a7];
  v18 = v17;
  if (v17)
  {
    objc_storeStrong((id *)&v17->_baseDisplayType, a3);
    objc_storeWeak((id *)&v18->_contextChangeDelegate, v16);
  }

  return v18;
}

- (BOOL)unselectedContextShouldUseContextBaseType
{
  return [(HKOverlayRoomTrendContext *)self overlayMode] != 3;
}

- (void)overlayStateWillChange:(BOOL)a3 contextItem:(id)a4 chartController:(id)a5
{
  BOOL v5 = a3;
  id v6 = [(_HKSleepTrendContext *)self contextChangeDelegate];
  [v6 setDurationContextSelected:v5];
}

- (HKDisplayType)baseDisplayType
{
  return self->_baseDisplayType;
}

- (HKOverlaySleepRoomContextChangeDelegate)contextChangeDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_contextChangeDelegate);
  return (HKOverlaySleepRoomContextChangeDelegate *)WeakRetained;
}

- (void)setContextChangeDelegate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_contextChangeDelegate);
  objc_storeStrong((id *)&self->_baseDisplayType, 0);
}

@end