@interface HKMostRecentValueQuantityTypeDataSource
- (BOOL)_interval:(id)a3 isEqualToInterval:(id)a4;
- (BOOL)attenuated;
- (HKMostRecentValueQuantityTypeDataSource)initWithUnitController:(id)a3 displayType:(id)a4 healthStore:(id)a5 currentCalendar:(id)a6;
- (HKMostRecentValueQuantityTypeDataSource)initWithUnitController:(id)a3 displayType:(id)a4 healthStore:(id)a5 currentCalendar:(id)a6 attenuated:(BOOL)a7;
- (NSCalendar)currentCalendar;
- (id)_dataSourceValueFromMostRecentQuantity:(id)a3 quantityDateInterval:(id)a4 statisticsInterval:(id)a5;
- (id)_intervalFromZoomLevel:(int64_t)a3;
- (id)_intervalFromZoomLevel:(int64_t)a3 resolution:(int64_t)a4;
- (id)_middleDateFromInterval:(id)a3 endDate:(id)a4;
- (id)queriesForRequest:(id)a3 completionHandler:(id)a4;
- (id)queryDescription;
- (void)setAttenuated:(BOOL)a3;
- (void)setCurrentCalendar:(id)a3;
@end

@implementation HKMostRecentValueQuantityTypeDataSource

- (HKMostRecentValueQuantityTypeDataSource)initWithUnitController:(id)a3 displayType:(id)a4 healthStore:(id)a5 currentCalendar:(id)a6
{
  return [(HKMostRecentValueQuantityTypeDataSource *)self initWithUnitController:a3 displayType:a4 healthStore:a5 currentCalendar:a6 attenuated:0];
}

- (HKMostRecentValueQuantityTypeDataSource)initWithUnitController:(id)a3 displayType:(id)a4 healthStore:(id)a5 currentCalendar:(id)a6 attenuated:(BOOL)a7
{
  objc_storeStrong((id *)&self->_currentCalendar, a6);
  id v13 = a6;
  id v14 = a5;
  id v15 = a4;
  id v16 = a3;
  self->_attenuated = a7;
  v19.receiver = self;
  v19.super_class = (Class)HKMostRecentValueQuantityTypeDataSource;
  v17 = [(HKQuantityTypeDataSource *)&v19 initWithUnitController:v16 options:32 displayType:v15 healthStore:v14];

  return v17;
}

- (id)queryDescription
{
  v2 = NSString;
  v3 = [(HKQuantityTypeDataSource *)self quantityType];
  v4 = objc_msgSend(v3, "hk_localizedName");
  v5 = [v2 stringWithFormat:@"HKMostRecentValueQuantity(%@)", v4];

  return v5;
}

- (id)queriesForRequest:(id)a3 completionHandler:(id)a4
{
  v22[1] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __79__HKMostRecentValueQuantityTypeDataSource_queriesForRequest_completionHandler___block_invoke;
  aBlock[3] = &unk_1E6D53308;
  aBlock[4] = self;
  id v8 = v7;
  id v21 = v8;
  id v9 = v6;
  id v20 = v9;
  v10 = _Block_copy(aBlock);
  if (self->_attenuated
    && ([(HKQuantityTypeDataSource *)self quantityType],
        v11 = objc_claimAutoreleasedReturnValue(),
        [v11 identifier],
        v12 = objc_claimAutoreleasedReturnValue(),
        id v13 = (void *)*MEMORY[0x1E4F2A7F0],
        v12,
        v11,
        v12 == v13))
  {
    id v16 = [MEMORY[0x1E4F2B0B8] queryForMostRecentAttenuatedEAEQuantityWithHealthStore:self->super.super._healthStore completion:v10];
  }
  else
  {
    id v14 = (void *)MEMORY[0x1E4F2B0B8];
    id v15 = [(HKQuantityTypeDataSource *)self quantityType];
    id v16 = [v14 queryForMostRecentQuantityOfType:v15 healthStore:self->super.super._healthStore predicate:0 completion:v10];
  }
  [v16 setDebugIdentifier:@"charting (most recent)"];
  v22[0] = v16;
  v17 = [MEMORY[0x1E4F1C978] arrayWithObjects:v22 count:1];

  return v17;
}

void __79__HKMostRecentValueQuantityTypeDataSource_queriesForRequest_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  v25[1] = *MEMORY[0x1E4F143B8];
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  v10 = v9;
  if (v9)
  {
    int v11 = objc_msgSend(v9, "hk_isDatabaseAccessibilityError");
    _HKInitializeLogging();
    v12 = (void *)*MEMORY[0x1E4F29FB0];
    id v13 = *MEMORY[0x1E4F29FB0];
    if (v11)
    {
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG)) {
        __79__HKMostRecentValueQuantityTypeDataSource_queriesForRequest_completionHandler___block_invoke_cold_1(a1, v12);
      }
    }
    else if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      __79__HKMostRecentValueQuantityTypeDataSource_queriesForRequest_completionHandler___block_invoke_cold_2(a1, v12);
    }
    uint64_t v23 = *(void *)(a1 + 48);
    if (v23) {
      (*(void (**)(uint64_t, void, void *))(v23 + 16))(v23, 0, v10);
    }
  }
  else
  {
    id v14 = objc_alloc(MEMORY[0x1E4F28C18]);
    id v15 = [*(id *)(a1 + 40) startDate];
    id v16 = [*(id *)(a1 + 40) endDate];
    v17 = (void *)[v14 initWithStartDate:v15 endDate:v16];

    if ([v8 intersectsDateInterval:v17])
    {
      v18 = *(void **)(a1 + 32);
      objc_super v19 = [*(id *)(a1 + 40) statisticsInterval];
      id v20 = [v18 _dataSourceValueFromMostRecentQuantity:v7 quantityDateInterval:v8 statisticsInterval:v19];

      uint64_t v21 = *(void *)(a1 + 48);
      if (v21)
      {
        v25[0] = v20;
        v22 = [MEMORY[0x1E4F1C978] arrayWithObjects:v25 count:1];
        (*(void (**)(uint64_t, void *, void))(v21 + 16))(v21, v22, 0);
      }
    }
    else
    {
      uint64_t v24 = *(void *)(a1 + 48);
      if (v24) {
        (*(void (**)(uint64_t, void, void))(v24 + 16))(v24, MEMORY[0x1E4F1CBF0], 0);
      }
    }
  }
}

- (id)_dataSourceValueFromMostRecentQuantity:(id)a3 quantityDateInterval:(id)a4 statisticsInterval:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  int v11 = objc_alloc_init(HKQuantityTypeDataSourceValue);
  v12 = [(HKQuantityTypeDataSource *)self quantityType];
  [(HKQuantityTypeDataSourceValue *)v11 setQuantityType:v12];

  if (v8)
  {
    id v13 = [v9 endDate];
    id v14 = [(HKMostRecentValueQuantityTypeDataSource *)self _middleDateFromInterval:v10 endDate:v13];

    if (v14)
    {
      [(HKQuantityTypeDataSourceValue *)v11 setStartDate:v14];
      [(HKQuantityTypeDataSourceValue *)v11 setEndDate:v14];
    }
    else
    {
      id v15 = [v9 startDate];
      [(HKQuantityTypeDataSourceValue *)v11 setStartDate:v15];

      id v16 = [v9 endDate];
      [(HKQuantityTypeDataSourceValue *)v11 setEndDate:v16];
    }
    [(HKQuantityTypeDataSourceValue *)v11 setMostRecentQuantity:v8];
  }
  return v11;
}

- (id)_middleDateFromInterval:(id)a3 endDate:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  id v9 = [(HKMostRecentValueQuantityTypeDataSource *)self _intervalFromZoomLevel:7];
  v64 = [(HKMostRecentValueQuantityTypeDataSource *)self _intervalFromZoomLevel:6];
  v63 = [(HKMostRecentValueQuantityTypeDataSource *)self _intervalFromZoomLevel:5 resolution:0];
  id v10 = [(HKMostRecentValueQuantityTypeDataSource *)self _intervalFromZoomLevel:5 resolution:1];
  int v11 = [(HKMostRecentValueQuantityTypeDataSource *)self _intervalFromZoomLevel:4];
  v62 = [(HKMostRecentValueQuantityTypeDataSource *)self _intervalFromZoomLevel:3];
  v12 = [(HKMostRecentValueQuantityTypeDataSource *)self _intervalFromZoomLevel:2];
  id v13 = [(HKMostRecentValueQuantityTypeDataSource *)self _intervalFromZoomLevel:1];
  id v14 = [(HKMostRecentValueQuantityTypeDataSource *)self currentCalendar];
  if ([(HKMostRecentValueQuantityTypeDataSource *)self _interval:v7 isEqualToInterval:v9])
  {
    objc_msgSend(v14, "hk_startOfMinuteForDate:moduloMinutes:addingModuloCount:", v8, objc_msgSend(v9, "minute"), 0);
    id v60 = v7;
    id v15 = v12;
    id v16 = v10;
    v18 = v17 = v11;
    objc_super v19 = objc_msgSend(v14, "hk_startOfMinuteForDate:moduloMinutes:addingModuloCount:", v8, objc_msgSend(v9, "minute"), 1);
    id v20 = HKUIMidDate(v18, v19);

    int v11 = v17;
    id v10 = v16;
    v12 = v15;
    id v7 = v60;
LABEL_3:
    uint64_t v21 = v14;
    goto LABEL_17;
  }
  v61 = v14;
  if ([(HKMostRecentValueQuantityTypeDataSource *)self _interval:v7 isEqualToInterval:v64])
  {
    objc_msgSend(v14, "hk_startOfHourForDate:addingHours:", v8, 0);
    v57 = v13;
    id v22 = v8;
    uint64_t v23 = v9;
    id v24 = v7;
    v25 = v12;
    v26 = v10;
    v28 = v27 = v11;
    v29 = objc_msgSend(v14, "hk_startOfHourForDate:addingHours:", v22, 1);
LABEL_16:
    v35 = v29;
    id v20 = HKUIMidDate(v28, v29);

    uint64_t v21 = v14;
    int v11 = v27;
    id v10 = v26;
    v12 = v25;
    id v7 = v24;
    id v9 = v23;
    id v8 = v22;
    id v13 = v57;
    goto LABEL_17;
  }
  if ([(HKMostRecentValueQuantityTypeDataSource *)self _interval:v7 isEqualToInterval:v63])
  {
    goto LABEL_15;
  }
  if ([(HKMostRecentValueQuantityTypeDataSource *)self _interval:v7 isEqualToInterval:v10])
  {
    v56 = v12;
    v58 = v11;
    long long v67 = 0uLL;
    uint64_t v68 = 0;
    HKGraphSeriesDataBlockPathContainingDate(v8, 5, 1, &v67);
    long long v65 = v67;
    uint64_t v66 = v68;
    v55 = HKGraphSeriesDataBlockPathMinimumX((uint64_t *)&v65);
    v30 = objc_msgSend(v55, "hk_dateBeforeDateForCalendar:rangeUnit:", v14, 16);
    if ((objc_msgSend(v30, "hk_isBeforeOrEqualToDate:", v8) & 1) == 0)
    {
      v54 = [MEMORY[0x1E4F28B00] currentHandler];
      [v54 handleFailureInMethod:a2 object:self file:@"HKMostRecentValueQuantityTypeDataSource.m" lineNumber:158 description:@"HKMostRecentValueQuantityTypeDataSource: anchor date must be before end date"];
    }
    id v31 = v30;
    id v32 = v31;
    v33 = v31;
    if (objc_msgSend(v31, "hk_isBeforeDate:", v8))
    {
      v33 = v31;
      v34 = v31;
      do
      {
        id v32 = v33;

        v33 = [v14 dateByAddingComponents:v10 toDate:v32 options:0];

        v34 = v32;
      }
      while ((objc_msgSend(v33, "hk_isBeforeDate:", v8) & 1) != 0);
    }
    id v20 = HKUIMidDate(v32, v33);

    v12 = v56;
    int v11 = v58;
    goto LABEL_3;
  }
  if ([(HKMostRecentValueQuantityTypeDataSource *)self _interval:v7 isEqualToInterval:v11])
  {
LABEL_15:
    objc_msgSend(v14, "hk_startOfDateByAddingDays:toDate:", 0, v8);
    v57 = v13;
    id v22 = v8;
    uint64_t v23 = v9;
    id v24 = v7;
    v25 = v12;
    v26 = v10;
    v28 = v27 = v11;
    v29 = objc_msgSend(v14, "hk_startOfDateByAddingDays:toDate:", 1, v22);
    goto LABEL_16;
  }
  uint64_t v21 = v14;
  if ([(HKMostRecentValueQuantityTypeDataSource *)self _interval:v7 isEqualToInterval:v62])
  {
    objc_msgSend(v14, "hk_startOfWeekWithFirstWeekday:beforeDate:addingWeeks:", objc_msgSend(v14, "firstWeekday"), v8, 0);
    v59 = v9;
    id v37 = v7;
    v38 = v12;
    v39 = v10;
    v41 = v40 = v11;
    v42 = objc_msgSend(v14, "hk_startOfWeekWithFirstWeekday:beforeDate:addingWeeks:", objc_msgSend(v14, "firstWeekday"), v8, 1);
    id v20 = HKUIMidDate(v41, v42);

    uint64_t v21 = v14;
    int v11 = v40;
    id v10 = v39;
    v12 = v38;
    id v7 = v37;
    id v9 = v59;
    goto LABEL_17;
  }
  if ([(HKMostRecentValueQuantityTypeDataSource *)self _interval:v7 isEqualToInterval:v12])
  {
    objc_msgSend(v14, "hk_startOfMonthForDate:", v8);
    v43 = v13;
    id v44 = v8;
    v45 = v9;
    id v46 = v7;
    v47 = v12;
    v48 = v10;
    v50 = v49 = v11;
    v51 = objc_msgSend(v14, "hk_startOfMonthForDate:addingMonths:", v44, 1);
LABEL_26:
    v52 = v51;
    uint64_t v53 = HKUIMidDate(v50, v51);

    uint64_t v21 = v61;
    int v11 = v49;
    id v10 = v48;
    v12 = v47;
    id v7 = v46;
    id v9 = v45;
    id v8 = v44;
    id v13 = v43;
    id v20 = (void *)v53;
    goto LABEL_17;
  }
  if ([(HKMostRecentValueQuantityTypeDataSource *)self _interval:v7 isEqualToInterval:v13])
  {
    objc_msgSend(v14, "hk_startOfYearForDate:addingYears:", v8, 0);
    v43 = v13;
    id v44 = v8;
    v45 = v9;
    id v46 = v7;
    v47 = v12;
    v48 = v10;
    v50 = v49 = v11;
    v51 = objc_msgSend(v14, "hk_startOfYearForDate:addingYears:", v44, 1);
    goto LABEL_26;
  }
  id v20 = 0;
LABEL_17:

  return v20;
}

- (id)_intervalFromZoomLevel:(int64_t)a3
{
  return [(HKMostRecentValueQuantityTypeDataSource *)self _intervalFromZoomLevel:a3 resolution:0];
}

- (id)_intervalFromZoomLevel:(int64_t)a3 resolution:(int64_t)a4
{
  v5 = +[HKGraphZoomLevelConfiguration configurationForZoomLevel:a3];
  id v6 = [v5 seriesPointIntervalComponentsAtResolution:a4];

  return v6;
}

- (BOOL)_interval:(id)a3 isEqualToInterval:(id)a4
{
  id v5 = a4;
  objc_msgSend(a3, "hk_approximateDuration");
  double v7 = v6;
  objc_msgSend(v5, "hk_approximateDuration");
  double v9 = v8;

  return v7 == v9;
}

- (NSCalendar)currentCalendar
{
  return self->_currentCalendar;
}

- (void)setCurrentCalendar:(id)a3
{
}

- (BOOL)attenuated
{
  return self->_attenuated;
}

- (void)setAttenuated:(BOOL)a3
{
  self->_attenuated = a3;
}

- (void).cxx_destruct
{
}

void __79__HKMostRecentValueQuantityTypeDataSource_queriesForRequest_completionHandler___block_invoke_cold_1(uint64_t a1, void *a2)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  v2 = *(void **)(a1 + 32);
  v3 = a2;
  v4 = [v2 quantityType];
  OUTLINED_FUNCTION_0_4();
  _os_log_debug_impl(&dword_1E0B26000, v3, OS_LOG_TYPE_DEBUG, "Encountered error querying for %{public}@: %{public}@", v5, 0x16u);
}

void __79__HKMostRecentValueQuantityTypeDataSource_queriesForRequest_completionHandler___block_invoke_cold_2(uint64_t a1, void *a2)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  v2 = *(void **)(a1 + 32);
  v3 = a2;
  v4 = [v2 quantityType];
  OUTLINED_FUNCTION_0_4();
  _os_log_error_impl(&dword_1E0B26000, v3, OS_LOG_TYPE_ERROR, "Encountered error querying for %{public}@: %{public}@", v5, 0x16u);
}

@end