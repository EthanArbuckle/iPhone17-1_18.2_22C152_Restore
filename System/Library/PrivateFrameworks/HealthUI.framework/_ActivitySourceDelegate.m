@interface _ActivitySourceDelegate
- (HKDisplayTypeController)displayTypeController;
- (HKUnitPreferenceController)unitPreferenceController;
- (NSCalendar)currentCalendar;
- (_ActivitySourceDelegate)initWithActivityValue:(int64_t)a3 displayTypeController:(id)a4 unitPreferenceController:(id)a5;
- (double)_intervalSpanForTimeScope:(int64_t)a3 startDate:(id)a4 calendar:(id)a5;
- (id)_chartPointForActivityValue:(int64_t)a3 summary:(id)a4 timeScope:(int64_t)a5;
- (id)_healthChartPointForQuantity:(id)a3 quantityType:(id)a4 activityValue:(int64_t)a5 referenceDisplayType:(id)a6 activitySummaryData:(id)a7 preferredUnit:(id)a8 date:(id)a9 createBarValue:(BOOL)a10;
- (id)_quantityForActivityValue:(int64_t)a3 summary:(id)a4;
- (id)activitySummariesForDateRange:(id)a3 timeScope:(int64_t)a4;
- (id)dataForDateRange:(id)a3 timeScope:(int64_t)a4;
- (int64_t)activityValue;
- (void)setUpdateDelegate:(id)a3;
@end

@implementation _ActivitySourceDelegate

- (_ActivitySourceDelegate)initWithActivityValue:(int64_t)a3 displayTypeController:(id)a4 unitPreferenceController:(id)a5
{
  id v9 = a4;
  id v10 = a5;
  v16.receiver = self;
  v16.super_class = (Class)_ActivitySourceDelegate;
  v11 = [(_ActivitySourceDelegate *)&v16 init];
  v12 = v11;
  if (v11)
  {
    v11->_activityValue = a3;
    objc_storeStrong((id *)&v11->_displayTypeController, a4);
    objc_storeStrong((id *)&v12->_unitPreferenceController, a5);
    uint64_t v13 = objc_msgSend(MEMORY[0x1E4F1C9A8], "hk_gregorianCalendar");
    currentCalendar = v12->_currentCalendar;
    v12->_currentCalendar = (NSCalendar *)v13;
  }
  return v12;
}

- (double)_intervalSpanForTimeScope:(int64_t)a3 startDate:(id)a4 calendar:(id)a5
{
  id v7 = a4;
  id v8 = a5;
  double v9 = 0.0;
  if ((unint64_t)a3 <= 6)
  {
    id v10 = +[HKGraphZoomLevelConfiguration configurationForZoomLevel:a3];
    if (v10)
    {
      v11 = v10;
      v12 = objc_msgSend(MEMORY[0x1E4F1C9D8], "hk_dateComponentsForCalendarUnit:", objc_msgSend(v10, "majorTickCalendarUnit"));
      uint64_t v13 = [v8 dateByAddingComponents:v12 toDate:v7 options:0];

      [v13 timeIntervalSinceDate:v7];
      double v9 = v14;
    }
  }

  return v9;
}

- (id)dataForDateRange:(id)a3 timeScope:(int64_t)a4
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  v6 = -[_ActivitySourceDelegate activitySummariesForDateRange:timeScope:](self, "activitySummariesForDateRange:timeScope:", a3);
  id v7 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v8 = v6;
  uint64_t v9 = [v8 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v16;
    do
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v16 != v11) {
          objc_enumerationMutation(v8);
        }
        uint64_t v13 = [(_ActivitySourceDelegate *)self _chartPointForActivityValue:[(_ActivitySourceDelegate *)self activityValue] summary:*(void *)(*((void *)&v15 + 1) + 8 * i) timeScope:a4];
        if (v13) {
          [v7 addObject:v13];
        }
      }
      uint64_t v10 = [v8 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v10);
  }

  return v7;
}

- (id)activitySummariesForDateRange:(id)a3 timeScope:(int64_t)a4
{
  v6 = objc_msgSend(MEMORY[0x1E4F28B00], "currentHandler", a3, a4);
  [v6 handleFailureInMethod:a2 object:self file:@"HKInteractiveChartActivityController.m" lineNumber:1474 description:@"Subclass must provide an implementation for activitySummariesForDateRange:timeScope:"];

  return (id)MEMORY[0x1E4F1CBF0];
}

- (void)setUpdateDelegate:(id)a3
{
  objc_msgSend(MEMORY[0x1E4F28B00], "currentHandler", a3);
  id v5 = (id)objc_claimAutoreleasedReturnValue();
  [v5 handleFailureInMethod:a2 object:self file:@"HKInteractiveChartActivityController.m" lineNumber:1479 description:@"Subclass must provide an implementationfor setUpdateDelegate:"];
}

- (id)_chartPointForActivityValue:(int64_t)a3 summary:(id)a4 timeScope:(int64_t)a5
{
  id v8 = a4;
  uint64_t v9 = [(_ActivitySourceDelegate *)self currentCalendar];
  uint64_t v10 = [v8 dateComponentsForCalendar:v9];

  unint64_t v11 = a3 & 0xFFFFFFFFFFFFFFFCLL;
  v12 = [(_ActivitySourceDelegate *)self _quantityForActivityValue:a3 summary:v8];
  uint64_t v13 = [v10 hour];
  if ((a3 & 0xFFFFFFFFFFFFFFFCLL) != 4 || v13 == 0x7FFFFFFFFFFFFFFFLL)
  {
    int64_t v34 = a5;
    long long v15 = [(_ActivitySourceDelegate *)self displayTypeController];
    uint64_t v16 = _DisplayTypeForActivityValue(a3, v15);

    if (unint64_t)a3 <= 6 && ((0x77u >> a3))
    {
      uint64_t v35 = [MEMORY[0x1E4F2B2C0] quantityTypeForIdentifier:**((void **)&unk_1E6D55BD8 + a3)];
    }
    else
    {
      uint64_t v35 = 0;
    }
    long long v17 = [(_ActivitySourceDelegate *)self unitPreferenceController];
    v36 = (void *)v16;
    long long v18 = [v17 unitForDisplayType:v16];
    v19 = [(_ActivitySourceDelegate *)self currentCalendar];
    uint64_t v20 = [v19 dateFromComponents:v10];

    if (a3 == 3 && ([v12 doubleValueForUnit:v18], v21 == 0.0))
    {
      double v14 = 0;
      v23 = (void *)v35;
      v22 = v36;
    }
    else
    {
      v24 = [(_ActivitySourceDelegate *)self currentCalendar];
      [(_ActivitySourceDelegate *)self _intervalSpanForTimeScope:v34 startDate:v20 calendar:v24];
      double v26 = v25;

      BOOL v27 = v11 == 4;
      BOOL v28 = v11 != 4;
      double v29 = v26 * 0.5;
      if (v27) {
        double v29 = v26;
      }
      uint64_t v30 = [v20 dateByAddingTimeInterval:v29];

      LOBYTE(v33) = v28;
      v31 = self;
      v23 = (void *)v35;
      v22 = v36;
      double v14 = [(_ActivitySourceDelegate *)v31 _healthChartPointForQuantity:v12 quantityType:v35 activityValue:a3 referenceDisplayType:v36 activitySummaryData:v8 preferredUnit:v18 date:v30 createBarValue:v33];
      uint64_t v20 = (void *)v30;
    }
  }
  else
  {
    double v14 = 0;
  }

  return v14;
}

- (id)_quantityForActivityValue:(int64_t)a3 summary:(id)a4
{
  id v5 = a4;
  v6 = v5;
  switch(a3)
  {
    case 0:
      int64_t v7 = [v5 activeEnergyBurned];
      goto LABEL_11;
    case 1:
      int64_t v7 = [v5 appleMoveTime];
      goto LABEL_11;
    case 2:
      int64_t v7 = [v5 appleExerciseTime];
      goto LABEL_11;
    case 3:
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        goto LABEL_4;
      }
      int64_t v7 = [v6 appleStandHours];
      goto LABEL_11;
    case 4:
      int64_t v7 = [v5 activeEnergyBurnedGoal];
      goto LABEL_11;
    case 5:
      int64_t v7 = [v5 appleMoveTimeGoal];
      goto LABEL_11;
    case 6:
      int64_t v7 = [v5 exerciseTimeGoal];
      goto LABEL_11;
    case 7:
LABEL_4:
      int64_t v7 = [v6 standHoursGoal];
LABEL_11:
      a3 = v7;
      break;
    default:
      break;
  }

  return (id)a3;
}

- (id)_healthChartPointForQuantity:(id)a3 quantityType:(id)a4 activityValue:(int64_t)a5 referenceDisplayType:(id)a6 activitySummaryData:(id)a7 preferredUnit:(id)a8 date:(id)a9 createBarValue:(BOOL)a10
{
  id v15 = a9;
  id v16 = a8;
  id v17 = a7;
  id v18 = a6;
  id v19 = a4;
  id v20 = a3;
  double v21 = objc_alloc_init(HKQuantityTypeDataSourceValue);
  [(HKQuantityTypeDataSourceValue *)v21 setQuantityType:v19];

  [(HKQuantityTypeDataSourceValue *)v21 setStartDate:v15];
  [(HKQuantityTypeDataSourceValue *)v21 setEndDate:v15];

  if (a10)
  {
    uint64_t v22 = [v20 _unit];
    v23 = [MEMORY[0x1E4F2B370] quantityWithUnit:v22 doubleValue:0.0];
    [(HKQuantityTypeDataSourceValue *)v21 setMaxQuantity:v20];

    [(HKQuantityTypeDataSourceValue *)v21 setMinQuantity:v23];
    id v20 = (id)v22;
  }
  else
  {
    [(HKQuantityTypeDataSourceValue *)v21 setMinQuantity:v20];
    [(HKQuantityTypeDataSourceValue *)v21 setMaxQuantity:v20];
  }

  v24 = [[HKHealthChartPoint alloc] initWithDataSourceValue:v21 options:12 unit:v16 displayType:v18];
  double v25 = objc_alloc_init(HKInteractiveChartActivityData);
  [(HKInteractiveChartActivityData *)v25 setActivitySummaryData:v17];

  [(HKInteractiveChartActivityData *)v25 setActivityValue:a5];
  [(HKHealthChartPoint *)v24 setUserInfo:v25];

  return v24;
}

- (int64_t)activityValue
{
  return self->_activityValue;
}

- (HKDisplayTypeController)displayTypeController
{
  return self->_displayTypeController;
}

- (HKUnitPreferenceController)unitPreferenceController
{
  return self->_unitPreferenceController;
}

- (NSCalendar)currentCalendar
{
  return self->_currentCalendar;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_currentCalendar, 0);
  objc_storeStrong((id *)&self->_unitPreferenceController, 0);
  objc_storeStrong((id *)&self->_displayTypeController, 0);
}

@end