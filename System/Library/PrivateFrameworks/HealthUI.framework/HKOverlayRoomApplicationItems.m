@interface HKOverlayRoomApplicationItems
+ (HKOverlayRoomApplicationItems)applicationItemsWithItems:(id)a3;
- (HKChartDataCacheController)chartDataCacheController;
- (HKDateCache)dateCache;
- (HKDisplayTypeController)displayTypeController;
- (HKHealthStore)healthStore;
- (HKSampleTypeDateRangeController)sampleDateRangeController;
- (HKSampleTypeUpdateController)sampleTypeUpdateController;
- (HKSelectedTimeScopeController)timeScopeController;
- (HKUnitPreferenceController)unitController;
- (void)setChartDataCacheController:(id)a3;
- (void)setDateCache:(id)a3;
- (void)setDisplayTypeController:(id)a3;
- (void)setHealthStore:(id)a3;
- (void)setSampleDateRangeController:(id)a3;
- (void)setSampleTypeUpdateController:(id)a3;
- (void)setTimeScopeController:(id)a3;
- (void)setUnitController:(id)a3;
@end

@implementation HKOverlayRoomApplicationItems

+ (HKOverlayRoomApplicationItems)applicationItemsWithItems:(id)a3
{
  id v3 = a3;
  v4 = objc_alloc_init(HKOverlayRoomApplicationItems);
  v5 = [v3 healthStore];
  [(HKOverlayRoomApplicationItems *)v4 setHealthStore:v5];

  v6 = [v3 timeScopeController];
  [(HKOverlayRoomApplicationItems *)v4 setTimeScopeController:v6];

  v7 = [v3 dateCache];
  [(HKOverlayRoomApplicationItems *)v4 setDateCache:v7];

  v8 = [v3 unitController];
  [(HKOverlayRoomApplicationItems *)v4 setUnitController:v8];

  v9 = [v3 chartDataCacheController];
  [(HKOverlayRoomApplicationItems *)v4 setChartDataCacheController:v9];

  v10 = [v3 sampleTypeUpdateController];
  [(HKOverlayRoomApplicationItems *)v4 setSampleTypeUpdateController:v10];

  v11 = [v3 sampleDateRangeController];
  [(HKOverlayRoomApplicationItems *)v4 setSampleDateRangeController:v11];

  v12 = [v3 displayTypeController];

  [(HKOverlayRoomApplicationItems *)v4 setDisplayTypeController:v12];
  return v4;
}

- (HKHealthStore)healthStore
{
  return self->_healthStore;
}

- (void)setHealthStore:(id)a3
{
}

- (HKSelectedTimeScopeController)timeScopeController
{
  return self->_timeScopeController;
}

- (void)setTimeScopeController:(id)a3
{
}

- (HKDateCache)dateCache
{
  return self->_dateCache;
}

- (void)setDateCache:(id)a3
{
}

- (HKUnitPreferenceController)unitController
{
  return self->_unitController;
}

- (void)setUnitController:(id)a3
{
}

- (HKChartDataCacheController)chartDataCacheController
{
  return self->_chartDataCacheController;
}

- (void)setChartDataCacheController:(id)a3
{
}

- (HKSampleTypeUpdateController)sampleTypeUpdateController
{
  return self->_sampleTypeUpdateController;
}

- (void)setSampleTypeUpdateController:(id)a3
{
}

- (HKSampleTypeDateRangeController)sampleDateRangeController
{
  return self->_sampleDateRangeController;
}

- (void)setSampleDateRangeController:(id)a3
{
}

- (HKDisplayTypeController)displayTypeController
{
  return self->_displayTypeController;
}

- (void)setDisplayTypeController:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_displayTypeController, 0);
  objc_storeStrong((id *)&self->_sampleDateRangeController, 0);
  objc_storeStrong((id *)&self->_sampleTypeUpdateController, 0);
  objc_storeStrong((id *)&self->_chartDataCacheController, 0);
  objc_storeStrong((id *)&self->_unitController, 0);
  objc_storeStrong((id *)&self->_dateCache, 0);
  objc_storeStrong((id *)&self->_timeScopeController, 0);
  objc_storeStrong((id *)&self->_healthStore, 0);
}

@end