@interface HDHeadphoneAudioExposureStatisticsBucket
+ (id)_currentDoseStringForEndDate:(id)a3 earliestStartDate:(id)a4 profile:(id)a5;
+ (id)_makeBucketsForNowDate:(id)a3 earliestStartDate:(id)a4 profile:(id)a5;
+ (id)_makeDataSourceWithProfile:(id)a3;
+ (id)_makeJournaledCalculator;
+ (id)_makePrimaryCalculator;
+ (id)_makeSourceOrderProviderWithProfile:(id)a3;
+ (id)bucketForArchivedRepresentation:(id)a3 profile:(id)a4 error:(id *)a5;
+ (id)makeBucketsForProfile:(id)a3 earliestStartDate:(id)a4;
- (BOOL)boundedInterval;
- (BOOL)hasPreviousStatistics;
- (BOOL)includesJournaledSamples;
- (BOOL)includesPrunableData;
- (BOOL)isExpiredForNowDate:(id)a3;
- (HDStatisticsCollectionCalculator)journaledCalculator;
- (HDStatisticsCollectionCalculator)primaryCalculator;
- (HKStatistics)previousStatistics;
- (NSDate)earliestStartDate;
- (NSDate)startDate;
- (NSDateInterval)dateInterval;
- (NSNumber)anchor;
- (id)_initWithProfile:(id)a3 primaryCalculator:(id)a4 journaledCalculator:(id)a5 startDate:(id)a6 earliestStartDate:(id)a7 boundedInterval:(BOOL)a8 anchor:(id)a9 previousStatistics:(id)a10 includesPrunableData:(BOOL)a11;
- (id)_initWithProfile:(id)a3 startDate:(id)a4 earliestStartDate:(id)a5 boundedInterval:(BOOL)a6;
- (id)_lock_addQuantitySamples:(id)a3 anchor:(id)a4 error:(id *)a5;
- (id)_lock_archivedRepresentationWithError:(id *)a3;
- (id)_lock_copyWithEarliestStartDate:(id)a3 resetDoseToZero:(BOOL)a4 error:(id *)a5;
- (id)_lock_currentStatisticsWithError:(id *)a3;
- (id)_lock_dateInterval;
- (id)_lock_fetchIncludesPrunableDataWithError:(id *)a3;
- (id)_lock_journalQuantitySamples:(id)a3 error:(id *)a4;
- (id)_lock_queryForInitialStatisticsWithError:(id *)a3;
- (id)archivedRepresentationWithError:(id *)a3;
- (id)copyWithEarliestStartDate:(id)a3 resetDoseToZero:(BOOL)a4 error:(id *)a5;
- (id)queryForInitialStatisticsWithError:(id *)a3;
- (id)snapshotStatisticsWithError:(id *)a3;
- (id)updateWithSampleBatch:(id)a3 error:(id *)a4;
- (void)_enableOverlappingProcessingInPrimaryCalculator:(BOOL)a3;
- (void)unitTesting_setIncludesPrunableData:(BOOL)a3;
- (void)unitTesting_setPreviousStatistics:(id)a3;
@end

@implementation HDHeadphoneAudioExposureStatisticsBucket

+ (id)makeBucketsForProfile:(id)a3 earliestStartDate:(id)a4
{
  v6 = (void *)MEMORY[0x263EFF910];
  id v7 = a4;
  id v8 = a3;
  v9 = [v6 now];
  v10 = [a1 _makeBucketsForNowDate:v9 earliestStartDate:v7 profile:v8];

  return v10;
}

+ (id)_makeBucketsForNowDate:(id)a3 earliestStartDate:(id)a4 profile:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  v10 = (void *)[objc_alloc(MEMORY[0x263EFF980]) initWithCapacity:5];
  v11 = [v7 dateByAddingTimeInterval:-604800.0];
  for (unint64_t i = 0; i != 5; ++i)
  {
    v13 = [v11 dateByAddingTimeInterval:3600.0 * (double)i];
    id v14 = [[HDHeadphoneAudioExposureStatisticsBucket alloc] _initWithProfile:v9 startDate:v13 earliestStartDate:v8 boundedInterval:i != 4];
    [v10 addObject:v14];
  }
  v15 = (void *)[v10 copy];

  return v15;
}

+ (id)_currentDoseStringForEndDate:(id)a3 earliestStartDate:(id)a4 profile:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  v10 = [a3 dateByAddingTimeInterval:-604800.0];
  v11 = (void *)[objc_alloc((Class)a1) _initWithProfile:v8 startDate:v10 earliestStartDate:v9 boundedInterval:1];

  id v26 = 0;
  v12 = [v11 queryForInitialStatisticsWithError:&v26];
  id v13 = v26;
  id v14 = v13;
  if (v12)
  {
    id v25 = 0;
    v15 = [v11 snapshotStatisticsWithError:&v25];
    id v16 = v25;
    if (v15)
    {
      v17 = [v15 statistics];
      id v24 = 0;
      v18 = objc_msgSend(v17, "hk_hearingSevenDayDosePercentageWithError:", &v24);
      id v19 = v24;

      v20 = NSString;
      if (v18)
      {
        [v18 doubleValue];
        [v20 stringWithFormat:@"%.2f%%", v21 * 100.0];
      }
      else
      {
        [NSString stringWithFormat:@"compute dose failed %@", v19];
      }
      v22 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v22 = [NSString stringWithFormat:@"compute statistics failed %@", v16];
    }
  }
  else if (objc_msgSend(v13, "hk_isDatabaseAccessibilityError"))
  {
    v22 = @"Locked (Data Inaccessible)";
  }
  else
  {
    v22 = [NSString stringWithFormat:@"query dose failed %@", v14];
  }

  return v22;
}

+ (id)_makePrimaryCalculator
{
  v2 = (void *)MEMORY[0x263F43380];
  v3 = HKHeadphoneAudioExposureType();
  v4 = [v2 calculatorForQuantityType:v3 intervalCollection:0 options:66 mergeStrategy:0];

  v5 = (void *)[objc_alloc(MEMORY[0x263F433A8]) initWithOverlapProcessingEnabled:0];
  [v4 setStatisticsConfiguration:v5];

  return v4;
}

+ (id)_makeJournaledCalculator
{
  v2 = (void *)MEMORY[0x263F43380];
  v3 = HKHeadphoneAudioExposureType();
  v4 = [v2 calculatorForQuantityType:v3 intervalCollection:0 options:66 mergeStrategy:1];

  v5 = (void *)[objc_alloc(MEMORY[0x263F433A8]) initWithOverlapProcessingEnabled:0];
  [v4 setStatisticsConfiguration:v5];

  return v4;
}

+ (id)_makeDataSourceWithProfile:(id)a3
{
  v3 = (objc_class *)MEMORY[0x263F43390];
  id v4 = a3;
  id v5 = [v3 alloc];
  v6 = HKHeadphoneAudioExposureType();
  id v7 = (void *)[v5 initForProfile:v4 quantityType:v6 predicate:0 restrictedSourceEntities:0];

  [v7 setIncludeUnfrozenSeries:1];
  return v7;
}

+ (id)_makeSourceOrderProviderWithProfile:(id)a3
{
  v3 = (objc_class *)MEMORY[0x263F43398];
  id v4 = a3;
  id v5 = [v3 alloc];
  v6 = HKHeadphoneAudioExposureType();
  id v7 = (void *)[v5 initWithProfile:v4 quantityType:v6];

  return v7;
}

- (id)_initWithProfile:(id)a3 startDate:(id)a4 earliestStartDate:(id)a5 boundedInterval:(BOOL)a6
{
  BOOL v6 = a6;
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  v29.receiver = self;
  v29.super_class = (Class)HDHeadphoneAudioExposureStatisticsBucket;
  id v13 = [(HDHeadphoneAudioExposureStatisticsBucket *)&v29 init];
  if (v13)
  {
    id v14 = [(id)objc_opt_class() _makePrimaryCalculator];
    v15 = [(id)objc_opt_class() _makeDataSourceWithProfile:v10];
    uint64_t v16 = [(id)objc_opt_class() _makeSourceOrderProviderWithProfile:v10];
    [v14 setDataSource:v15];
    [v14 setSourceOrderProvider:v16];
    objc_msgSend(MEMORY[0x263F08798], "hd_hearingSevenDayLimitIntervalWithStartDate:earliestStartDate:boundedInterval:", v11, v12, v6);
    v17 = id v28 = v11;
    [v14 setDateInterval:v17];

    v13->_lock._os_unfair_lock_opaque = 0;
    primaryCalculator = v13->_primaryCalculator;
    v13->_primaryCalculator = (HDStatisticsCollectionCalculator *)v14;
    id v19 = v14;

    journaledCalculator = v13->_journaledCalculator;
    v13->_journaledCalculator = 0;

    objc_storeStrong((id *)&v13->_startDate, a4);
    objc_storeStrong((id *)&v13->_earliestStartDate, a5);
    v13->_boundedInterval = v6;
    anchor = v13->_anchor;
    v13->_anchor = 0;

    previousStatistics = v13->_previousStatistics;
    v13->_previousStatistics = 0;

    dataSource = v13->_dataSource;
    v13->_dataSource = v15;
    id v24 = v15;

    sourceOrderProvider = v13->_sourceOrderProvider;
    v13->_sourceOrderProvider = (HDStatisticsCollectionCalculatorSourceOrderProvider *)v16;

    id v11 = v28;
    id v26 = v13;
  }

  return v13;
}

- (id)_initWithProfile:(id)a3 primaryCalculator:(id)a4 journaledCalculator:(id)a5 startDate:(id)a6 earliestStartDate:(id)a7 boundedInterval:(BOOL)a8 anchor:(id)a9 previousStatistics:(id)a10 includesPrunableData:(BOOL)a11
{
  id v15 = a3;
  id v16 = a4;
  id v17 = a5;
  id obj = a6;
  id v18 = a6;
  id v51 = a7;
  id v19 = a7;
  id v54 = a9;
  id v53 = a10;
  if (!v16)
  {
    v40 = [MEMORY[0x263F08690] currentHandler];
    [v40 handleFailureInMethod:a2, self, @"HDHeadphoneAudioExposureStatisticsBucket.m", 257, @"Invalid parameter not satisfying: %@", @"primaryCalculator" object file lineNumber description];
  }
  v20 = [v16 quantityType];
  uint64_t v21 = [v20 code];

  if (v21 != 173)
  {
    v41 = [MEMORY[0x263F08690] currentHandler];
    [v41 handleFailureInMethod:a2, self, @"HDHeadphoneAudioExposureStatisticsBucket.m", 258, @"Invalid parameter not satisfying: %@", @"primaryCalculator.quantityType.code == _HKDataTypeHeadphoneAudioExposure" object file lineNumber description];
  }
  v22 = [v16 dateInterval];

  if (!v22)
  {
    v42 = [MEMORY[0x263F08690] currentHandler];
    [v42 handleFailureInMethod:a2, self, @"HDHeadphoneAudioExposureStatisticsBucket.m", 259, @"Invalid parameter not satisfying: %@", @"primaryCalculator.dateInterval" object file lineNumber description];
  }
  v23 = [v16 dataSource];

  if (v23)
  {
    v43 = [MEMORY[0x263F08690] currentHandler];
    [v43 handleFailureInMethod:a2, self, @"HDHeadphoneAudioExposureStatisticsBucket.m", 260, @"Invalid parameter not satisfying: %@", @"primaryCalculator.dataSource == nil" object file lineNumber description];
  }
  id v24 = [v16 sourceOrderProvider];

  if (v24)
  {
    v44 = [MEMORY[0x263F08690] currentHandler];
    [v44 handleFailureInMethod:a2, self, @"HDHeadphoneAudioExposureStatisticsBucket.m", 261, @"Invalid parameter not satisfying: %@", @"primaryCalculator.sourceOrderProvider == nil" object file lineNumber description];

    if (!v17) {
      goto LABEL_19;
    }
  }
  else if (!v17)
  {
    goto LABEL_19;
  }
  id v25 = [v17 quantityType];
  uint64_t v26 = [v25 code];

  if (v26 != 173)
  {
    v45 = [MEMORY[0x263F08690] currentHandler];
    [v45 handleFailureInMethod:a2, self, @"HDHeadphoneAudioExposureStatisticsBucket.m", 263, @"Invalid parameter not satisfying: %@", @"journaledCalculator.quantityType.code == _HKDataTypeHeadphoneAudioExposure" object file lineNumber description];
  }
  v27 = [v17 dateInterval];
  id v28 = [v16 dateInterval];
  char v29 = [v27 isEqualToDateInterval:v28];

  if ((v29 & 1) == 0)
  {
    v46 = [MEMORY[0x263F08690] currentHandler];
    [v46 handleFailureInMethod:a2, self, @"HDHeadphoneAudioExposureStatisticsBucket.m", 264, @"Invalid parameter not satisfying: %@", @"[journaledCalculator.dateInterval isEqualToDateInterval:primaryCalculator.dateInterval]" object file lineNumber description];
  }
  v30 = [v17 dataSource];

  if (v30)
  {
    v47 = [MEMORY[0x263F08690] currentHandler];
    [v47 handleFailureInMethod:a2, self, @"HDHeadphoneAudioExposureStatisticsBucket.m", 265, @"Invalid parameter not satisfying: %@", @"journaledCalculator.dataSource == nil" object file lineNumber description];
  }
  v31 = [v17 sourceOrderProvider];

  if (v31)
  {
    v48 = [MEMORY[0x263F08690] currentHandler];
    [v48 handleFailureInMethod:a2, self, @"HDHeadphoneAudioExposureStatisticsBucket.m", 266, @"Invalid parameter not satisfying: %@", @"journaledCalculator.sourceOrderProvider == nil" object file lineNumber description];
  }
LABEL_19:
  v56.receiver = self;
  v56.super_class = (Class)HDHeadphoneAudioExposureStatisticsBucket;
  v32 = [(HDHeadphoneAudioExposureStatisticsBucket *)&v56 init];
  if (v32)
  {
    v33 = [(id)objc_opt_class() _makeDataSourceWithProfile:v15];
    uint64_t v34 = [(id)objc_opt_class() _makeSourceOrderProviderWithProfile:v15];
    [v16 setDataSource:v33];
    [v16 setSourceOrderProvider:v34];
    if (v17)
    {
      [v17 setDataSource:v33];
      [v17 setSourceOrderProvider:v34];
    }
    v32->_lock._os_unfair_lock_opaque = 0;
    objc_storeStrong((id *)&v32->_primaryCalculator, a4);
    objc_storeStrong((id *)&v32->_journaledCalculator, a5);
    objc_storeStrong((id *)&v32->_startDate, obj);
    objc_storeStrong((id *)&v32->_earliestStartDate, v51);
    v32->_boundedInterval = a8;
    objc_storeStrong((id *)&v32->_anchor, a9);
    objc_storeStrong((id *)&v32->_previousStatistics, a10);
    v32->_includesPrunableData = a11;
    dataSource = v32->_dataSource;
    v32->_dataSource = v33;
    v36 = v33;

    sourceOrderProvider = v32->_sourceOrderProvider;
    v32->_sourceOrderProvider = (HDStatisticsCollectionCalculatorSourceOrderProvider *)v34;

    v38 = v32;
  }

  return v32;
}

- (id)copyWithEarliestStartDate:(id)a3 resetDoseToZero:(BOOL)a4 error:(id *)a5
{
  BOOL v6 = a4;
  p_lock = &self->_lock;
  id v9 = a3;
  os_unfair_lock_lock(p_lock);
  id v10 = [(HDHeadphoneAudioExposureStatisticsBucket *)self _lock_copyWithEarliestStartDate:v9 resetDoseToZero:v6 error:a5];

  os_unfair_lock_unlock(p_lock);
  return v10;
}

- (id)_lock_copyWithEarliestStartDate:(id)a3 resetDoseToZero:(BOOL)a4 error:(id *)a5
{
  id v8 = (NSDate *)a3;
  os_unfair_lock_assert_owner(&self->_lock);
  char v9 = [(NSDate *)self->_startDate hk_isAfterDate:v8];
  startDate = v8;
  if ((v9 & 1) == 0) {
    startDate = self->_startDate;
  }
  id v11 = startDate;
  id v12 = objc_alloc((Class)objc_opt_class());
  id v13 = [(HDStatisticsCollectionCalculatorDefaultDataSource *)self->_dataSource profile];
  uint64_t v14 = [v12 _initWithProfile:v13 startDate:v11 earliestStartDate:v8 boundedInterval:self->_boundedInterval];

  id v15 = *(void **)(v14 + 56);
  *(void *)(v14 + 56) = 0;

  if (a4) {
    goto LABEL_6;
  }
  uint64_t v16 = [(HDHeadphoneAudioExposureStatisticsBucket *)self _lock_currentStatisticsWithError:a5];
  if (v16)
  {
    id v17 = *(void **)(v14 + 64);
    *(void *)(v14 + 64) = v16;

    *(unsigned char *)(v14 + 72) = self->_includesPrunableData;
LABEL_6:
    id v18 = (id)v14;
    goto LABEL_8;
  }
  id v18 = 0;
LABEL_8:

  return v18;
}

- (id)archivedRepresentationWithError:(id *)a3
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  BOOL v6 = [(HDHeadphoneAudioExposureStatisticsBucket *)self _lock_archivedRepresentationWithError:a3];
  os_unfair_lock_unlock(p_lock);
  return v6;
}

- (id)_lock_archivedRepresentationWithError:(id *)a3
{
  os_unfair_lock_assert_owner(&self->_lock);
  id v4 = (void *)[objc_alloc(MEMORY[0x263F08910]) initRequiringSecureCoding:1];
  [v4 encodeObject:self->_primaryCalculator forKey:@"primaryCalculator"];
  journaledCalculator = self->_journaledCalculator;
  if (journaledCalculator) {
    [v4 encodeObject:journaledCalculator forKey:@"journaledCalculator"];
  }
  [v4 encodeObject:self->_startDate forKey:@"startDate"];
  earliestStartDate = self->_earliestStartDate;
  if (earliestStartDate) {
    [v4 encodeObject:earliestStartDate forKey:@"earliestStartDate"];
  }
  [v4 encodeBool:self->_boundedInterval forKey:@"boundedInterval"];
  previousStatistics = self->_previousStatistics;
  if (previousStatistics) {
    [v4 encodeObject:previousStatistics forKey:@"previousStatistics"];
  }
  [v4 encodeBool:self->_includesPrunableData forKey:@"includesPrunableData"];
  [v4 encodeObject:self->_anchor forKey:@"anchor"];
  [v4 finishEncoding];
  id v8 = [v4 encodedData];

  return v8;
}

+ (id)bucketForArchivedRepresentation:(id)a3 profile:(id)a4 error:(id *)a5
{
  id v7 = a4;
  id v8 = (objc_class *)MEMORY[0x263F08928];
  id v9 = a3;
  id v10 = (void *)[[v8 alloc] initForReadingFromData:v9 error:a5];

  if (!v10)
  {
    uint64_t v14 = 0;
    goto LABEL_34;
  }
  id v11 = [v10 decodeObjectOfClass:objc_opt_class() forKey:@"primaryCalculator"];
  if (!v11 || ([v10 error], id v12 = objc_claimAutoreleasedReturnValue(), v12, v12))
  {
    id v13 = [v10 error];
    if (v13)
    {
      if (a5) {
        *a5 = v13;
      }
      else {
        _HKLogDroppedError();
      }
    }

    [v10 finishDecoding];
    uint64_t v14 = 0;
    goto LABEL_33;
  }
  id v15 = [v10 decodeObjectOfClass:objc_opt_class() forKey:@"journaledCalculator"];
  uint64_t v16 = [v10 error];

  if (v16)
  {
    id v17 = [v10 error];
    if (v17)
    {
      if (a5) {
        *a5 = v17;
      }
      else {
        _HKLogDroppedError();
      }
    }

    [v10 finishDecoding];
    uint64_t v14 = 0;
    goto LABEL_32;
  }
  id v18 = [v10 decodeObjectOfClass:objc_opt_class() forKey:@"startDate"];
  if (!v18 || ([v10 error], id v19 = objc_claimAutoreleasedReturnValue(), v19, v19))
  {
    id v20 = [v10 error];
    if (v20)
    {
      if (a5) {
        *a5 = v20;
      }
      else {
        _HKLogDroppedError();
      }
    }

    [v10 finishDecoding];
    uint64_t v14 = 0;
    goto LABEL_31;
  }
  uint64_t v21 = [v10 decodeObjectOfClass:objc_opt_class() forKey:@"earliestStartDate"];
  v22 = [v10 error];

  if (v22
    || (uint64_t v23 = [v10 decodeBoolForKey:@"boundedInterval"],
        [v10 error],
        id v24 = objc_claimAutoreleasedReturnValue(),
        v24,
        v24))
  {
    id v25 = [v10 error];
    if (v25)
    {
      if (a5) {
        *a5 = v25;
      }
      else {
        _HKLogDroppedError();
      }
    }

    [v10 finishDecoding];
    uint64_t v14 = 0;
    goto LABEL_30;
  }
  uint64_t v38 = [v10 decodeObjectOfClass:objc_opt_class() forKey:@"anchor"];
  v27 = [v10 error];

  if (v27)
  {
    id v28 = [v10 error];
    if (v28)
    {
      if (a5) {
        *a5 = v28;
      }
      else {
        _HKLogDroppedError();
      }
    }

    [v10 finishDecoding];
    uint64_t v14 = 0;
    v31 = (void *)v38;
    goto LABEL_52;
  }
  uint64_t v37 = [v10 decodeObjectOfClass:objc_opt_class() forKey:@"previousStatistics"];
  char v29 = [v10 error];

  if (v29)
  {
    v30 = v10;
LABEL_46:
    id v33 = [v30 error];
    uint64_t v34 = (void *)v37;
    if (v33)
    {
      if (a5) {
        *a5 = v33;
      }
      else {
        _HKLogDroppedError();
      }
    }

    [v10 finishDecoding];
    uint64_t v14 = 0;
    v31 = (void *)v38;
    goto LABEL_51;
  }
  char v36 = [v10 decodeBoolForKey:@"includesPrunableData"];
  v32 = [v10 error];

  v30 = v10;
  if (v32) {
    goto LABEL_46;
  }
  [v10 finishDecoding];
  LOBYTE(v35) = v36;
  uint64_t v34 = (void *)v37;
  v31 = (void *)v38;
  uint64_t v14 = (void *)[objc_alloc((Class)objc_opt_class()) _initWithProfile:v7 primaryCalculator:v11 journaledCalculator:v15 startDate:v18 earliestStartDate:v21 boundedInterval:v23 anchor:v38 previousStatistics:v37 includesPrunableData:v35];
LABEL_51:

LABEL_52:
LABEL_30:

LABEL_31:
LABEL_32:

LABEL_33:
LABEL_34:

  return v14;
}

- (NSDateInterval)dateInterval
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  id v4 = [(HDHeadphoneAudioExposureStatisticsBucket *)self _lock_dateInterval];
  os_unfair_lock_unlock(p_lock);
  return (NSDateInterval *)v4;
}

- (BOOL)includesJournaledSamples
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  if (self->_journaledCalculator) {
    BOOL v4 = 1;
  }
  else {
    BOOL v4 = self->_previousStatistics != 0;
  }
  os_unfair_lock_unlock(p_lock);
  return v4;
}

- (BOOL)hasPreviousStatistics
{
  v2 = self;
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  LOBYTE(v2) = v2->_previousStatistics != 0;
  os_unfair_lock_unlock(p_lock);
  return (char)v2;
}

- (id)snapshotStatisticsWithError:(id *)a3
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  BOOL includesPrunableData = self->_includesPrunableData;
  id v7 = [(HDHeadphoneAudioExposureStatisticsBucket *)self _lock_currentStatisticsWithError:a3];
  os_unfair_lock_unlock(p_lock);
  if (v7) {
    id v8 = [[HDHeadphoneAudioExposureStatisticsSnapshot alloc] initWithStatistics:v7 includesPrunableData:includesPrunableData previousNotificationDate:self->_earliestStartDate];
  }
  else {
    id v8 = 0;
  }

  return v8;
}

- (id)_lock_currentStatisticsWithError:(id *)a3
{
  os_unfair_lock_assert_owner(&self->_lock);
  id v5 = [(HDStatisticsCollectionCalculator *)self->_primaryCalculator currentStatistics];
  if (!v5)
  {
    objc_msgSend(MEMORY[0x263F087E8], "hk_assignError:code:description:", a3, 100, @"unable compute primary statistics");
    id v7 = 0;
    goto LABEL_14;
  }
  previousStatistics = self->_previousStatistics;
  if (previousStatistics)
  {
    id v7 = [(HKStatistics *)previousStatistics statisticsByCombiningWithNoiseLevelStatistics:v5 error:a3];
    if (!v7) {
      goto LABEL_14;
    }
  }
  else
  {
    id v7 = v5;
  }
  journaledCalculator = self->_journaledCalculator;
  if (journaledCalculator)
  {
    id v9 = [(HDStatisticsCollectionCalculator *)journaledCalculator currentStatistics];
    if (v9)
    {
      id v10 = [v7 statisticsByCombiningWithNoiseLevelStatistics:v9 error:a3];

      id v7 = v10;
      id v11 = v7;
    }
    else
    {
      objc_msgSend(MEMORY[0x263F087E8], "hk_assignError:code:description:", a3, 100, @"unable compute journaled statistics");
      _HKInitializeLogging();
      id v12 = *MEMORY[0x263F09910];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x263F09910], OS_LOG_TYPE_FAULT)) {
        -[HDHeadphoneAudioExposureStatisticsBucket _lock_currentStatisticsWithError:](v12);
      }
      id v11 = 0;
    }

    id v7 = v11;
  }
LABEL_14:

  return v7;
}

- (BOOL)isExpiredForNowDate:(id)a3
{
  id v4 = a3;
  id v5 = [(HDHeadphoneAudioExposureStatisticsBucket *)self dateInterval];
  BOOL v6 = [v5 endDate];
  char v7 = objc_msgSend(v6, "hk_isBeforeDate:", v4);

  return v7;
}

- (id)queryForInitialStatisticsWithError:(id *)a3
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  BOOL v6 = [(HDHeadphoneAudioExposureStatisticsBucket *)self _lock_queryForInitialStatisticsWithError:a3];
  os_unfair_lock_unlock(p_lock);
  return v6;
}

- (id)updateWithSampleBatch:(id)a3 error:(id *)a4
{
  id v6 = a3;
  os_unfair_lock_lock(&self->_lock);
  if ([v6 isJournaled])
  {
    char v7 = [v6 samples];
    id v8 = [(HDHeadphoneAudioExposureStatisticsBucket *)self _lock_journalQuantitySamples:v7 error:a4];
LABEL_5:

    goto LABEL_6;
  }
  id v9 = [v6 anchor];

  if (v9)
  {
    char v7 = [v6 samples];
    id v10 = [v6 anchor];
    id v8 = [(HDHeadphoneAudioExposureStatisticsBucket *)self _lock_addQuantitySamples:v7 anchor:v10 error:a4];

    goto LABEL_5;
  }
  _HKInitializeLogging();
  id v13 = (void *)*MEMORY[0x263F09910];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F09910], OS_LOG_TYPE_FAULT)) {
    -[HDHeadphoneAudioExposureStatisticsBucket updateWithSampleBatch:error:](v13, v6);
  }
  id v8 = 0;
LABEL_6:
  if (!self->_includesPrunableData)
  {
    id v11 = [v6 samples];
    self->_BOOL includesPrunableData = objc_msgSend(v11, "hk_containsObjectPassingTest:", &__block_literal_global_3);
  }
  os_unfair_lock_unlock(&self->_lock);

  return v8;
}

uint64_t __72__HDHeadphoneAudioExposureStatisticsBucket_updateWithSampleBatch_error___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  v3 = [v2 metadata];
  uint64_t v4 = *MEMORY[0x263F0AAF0];
  id v10 = 0;
  id v5 = objc_msgSend(v3, "hk_safeNumberIfExistsForKeyPath:error:", v4, &v10);
  id v6 = v10;

  if (v6)
  {
    _HKInitializeLogging();
    char v7 = (void *)*MEMORY[0x263F09910];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F09910], OS_LOG_TYPE_FAULT)) {
      __72__HDHeadphoneAudioExposureStatisticsBucket_updateWithSampleBatch_error___block_invoke_cold_1(v7, v2, (uint64_t)v6);
    }
    uint64_t v8 = 1;
  }
  else
  {
    uint64_t v8 = [v5 BOOLValue];
  }

  return v8;
}

- (void)unitTesting_setPreviousStatistics:(id)a3
{
  uint64_t v4 = (HKStatistics *)a3;
  os_unfair_lock_lock(&self->_lock);
  previousStatistics = self->_previousStatistics;
  self->_previousStatistics = v4;

  os_unfair_lock_unlock(&self->_lock);
}

- (void)unitTesting_setIncludesPrunableData:(BOOL)a3
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  self->_BOOL includesPrunableData = a3;
  os_unfair_lock_unlock(p_lock);
}

- (id)_lock_dateInterval
{
  os_unfair_lock_assert_owner(&self->_lock);
  primaryCalculator = self->_primaryCalculator;
  return (id)[(HDStatisticsCollectionCalculator *)primaryCalculator dateInterval];
}

- (id)_lock_journalQuantitySamples:(id)a3 error:(id *)a4
{
  id v6 = a3;
  os_unfair_lock_assert_owner(&self->_lock);
  char v7 = self->_journaledCalculator;
  if (!v7)
  {
    char v7 = [(id)objc_opt_class() _makeJournaledCalculator];
    [(HDStatisticsCollectionCalculator *)v7 setDataSource:self->_dataSource];
    [(HDStatisticsCollectionCalculator *)v7 setSourceOrderProvider:self->_sourceOrderProvider];
    uint64_t v8 = [(HDHeadphoneAudioExposureStatisticsBucket *)self _lock_dateInterval];
    [(HDStatisticsCollectionCalculator *)v7 setDateInterval:v8];

    if (!v7) {
      goto LABEL_5;
    }
  }
  if ([(HDStatisticsCollectionCalculatorDefaultDataSource *)self->_dataSource addValuesForQuantitySamples:v6 calculator:v7 includeSeries:0 error:a4])
  {
    objc_storeStrong((id *)&self->_journaledCalculator, v7);
    id v9 = +[HDHeadphoneExposureStatisticUpdateResult resultForSamplesJournaled:v6];
  }
  else
  {
LABEL_5:
    id v9 = 0;
  }

  return v9;
}

- (id)_lock_addQuantitySamples:(id)a3 anchor:(id)a4 error:(id *)a5
{
  uint64_t v36 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = (NSNumber *)a4;
  os_unfair_lock_assert_owner(&self->_lock);
  if (self->_primaryCalculator)
  {
    p_anchor = &self->_anchor;
    anchor = self->_anchor;
    id v12 = (os_log_t *)MEMORY[0x263F09910];
    if (anchor)
    {
      uint64_t v13 = [(NSNumber *)anchor longLongValue];
      if (v13 > [(NSNumber *)v9 longLongValue])
      {
        _HKInitializeLogging();
        os_log_t v14 = *v12;
        if (os_log_type_enabled(*v12, OS_LOG_TYPE_ERROR))
        {
          v27 = v14;
          uint64_t v28 = [v8 count];
          char v29 = *p_anchor;
          int v30 = 134218498;
          uint64_t v31 = v28;
          __int16 v32 = 2114;
          id v33 = v9;
          __int16 v34 = 2114;
          uint64_t v35 = v29;
          _os_log_error_impl(&dword_22615C000, v27, OS_LOG_TYPE_ERROR, "[Warning] Adding %lu samples with anchor (%{public}@) below currentAnchor (%{public}@).", (uint8_t *)&v30, 0x20u);
        }
      }
    }
    _HKInitializeLogging();
    os_log_t v15 = *v12;
    if (os_log_type_enabled(*v12, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v16 = v15;
      uint64_t v17 = [v8 count];
      id v18 = *p_anchor;
      int v30 = 134218498;
      uint64_t v31 = v17;
      __int16 v32 = 2114;
      id v33 = v18;
      __int16 v34 = 2114;
      uint64_t v35 = v9;
      _os_log_impl(&dword_22615C000, v16, OS_LOG_TYPE_DEFAULT, "Added %lu sample(s) to primary calculator (anchor: %{public}@ -> %{public}@)", (uint8_t *)&v30, 0x20u);
    }
    id v19 = [(HDStatisticsCollectionCalculatorDefaultDataSource *)self->_dataSource hearing_addQuantitySamples:v8 calculator:self->_primaryCalculator error:a5];
    if (v19)
    {
      if (self->_journaledCalculator)
      {
        _HKInitializeLogging();
        os_log_t v20 = *v12;
        if (os_log_type_enabled(*v12, OS_LOG_TYPE_DEFAULT))
        {
          uint64_t v21 = v20;
          uint64_t v22 = [v8 count];
          uint64_t v23 = *p_anchor;
          int v30 = 134218498;
          uint64_t v31 = v22;
          __int16 v32 = 2114;
          id v33 = v23;
          __int16 v34 = 2114;
          uint64_t v35 = v9;
          _os_log_impl(&dword_22615C000, v21, OS_LOG_TYPE_DEFAULT, "Invalidated journaled calculator on %lu samples added (anchor: %{public}@ -> %{public}@)", (uint8_t *)&v30, 0x20u);
        }
        journaledCalculator = self->_journaledCalculator;
        self->_journaledCalculator = 0;
      }
      objc_storeStrong((id *)&self->_anchor, a4);
      id v25 = v19;
    }
  }
  else
  {
    objc_msgSend(MEMORY[0x263F087E8], "hk_assignError:code:description:", a5, 100, @"unable to add samples without primary caclulator");
    id v19 = 0;
  }

  return v19;
}

- (void)_enableOverlappingProcessingInPrimaryCalculator:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v16 = *MEMORY[0x263EF8340];
  _HKInitializeLogging();
  id v5 = (void *)*MEMORY[0x263F09910];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F09910], OS_LOG_TYPE_DEFAULT))
  {
    id v6 = v5;
    char v7 = objc_opt_class();
    id v8 = @"NO";
    if (v3) {
      id v8 = @"YES";
    }
    int v12 = 138543618;
    uint64_t v13 = v7;
    __int16 v14 = 2112;
    os_log_t v15 = v8;
    id v9 = v7;
    _os_log_impl(&dword_22615C000, v6, OS_LOG_TYPE_DEFAULT, "[%{public}@] Enable Overlap Processing In Primary Calculator: %@", (uint8_t *)&v12, 0x16u);
  }
  primaryCalculator = self->_primaryCalculator;
  id v11 = (void *)[objc_alloc(MEMORY[0x263F433A8]) initWithOverlapProcessingEnabled:v3];
  [(HDStatisticsCollectionCalculator *)primaryCalculator setStatisticsConfiguration:v11];
}

- (id)_lock_queryForInitialStatisticsWithError:(id *)a3
{
  uint64_t v54 = *MEMORY[0x263EF8340];
  os_unfair_lock_assert_owner(&self->_lock);
  if (!self->_dataSource || !self->_sourceOrderProvider)
  {
    v44 = [MEMORY[0x263F08690] currentHandler];
    [v44 handleFailureInMethod:a2, self, @"HDHeadphoneAudioExposureStatisticsBucket.m", 660, @"Invalid parameter not satisfying: %@", @"_dataSource && _sourceOrderProvider" object file lineNumber description];
  }
  id v6 = [(HDStatisticsCollectionCalculator *)self->_primaryCalculator dataSource];
  dataSource = self->_dataSource;

  if (v6 != dataSource)
  {
    v45 = [MEMORY[0x263F08690] currentHandler];
    [v45 handleFailureInMethod:a2, self, @"HDHeadphoneAudioExposureStatisticsBucket.m", 661, @"Invalid parameter not satisfying: %@", @"_primaryCalculator.dataSource == _dataSource" object file lineNumber description];
  }
  id v8 = [(HDStatisticsCollectionCalculator *)self->_primaryCalculator sourceOrderProvider];
  sourceOrderProvider = self->_sourceOrderProvider;

  if (v8 != sourceOrderProvider)
  {
    v46 = [MEMORY[0x263F08690] currentHandler];
    [v46 handleFailureInMethod:a2, self, @"HDHeadphoneAudioExposureStatisticsBucket.m", 662, @"Invalid parameter not satisfying: %@", @"_primaryCalculator.sourceOrderProvider == _sourceOrderProvider" object file lineNumber description];
  }
  _HKInitializeLogging();
  id v10 = (os_log_t *)MEMORY[0x263F09910];
  id v11 = (void *)*MEMORY[0x263F09910];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F09910], OS_LOG_TYPE_DEFAULT))
  {
    int v12 = v11;
    uint64_t v13 = [(HDHeadphoneAudioExposureStatisticsBucket *)self _lock_dateInterval];
    __int16 v14 = [v13 startDate];
    [v14 timeIntervalSince1970];
    uint64_t v16 = (uint64_t)v15;
    uint64_t v17 = [(HDHeadphoneAudioExposureStatisticsBucket *)self _lock_dateInterval];
    id v18 = [v17 endDate];
    [v18 timeIntervalSince1970];
    *(_DWORD *)buf = 134218240;
    uint64_t v49 = v16;
    __int16 v50 = 2048;
    uint64_t v51 = (uint64_t)v19;
    _os_log_impl(&dword_22615C000, v12, OS_LOG_TYPE_DEFAULT, "Querying initial HAE statistics for bucket interval: %{time_t}ld to %{time_t}ld", buf, 0x16u);
  }
  [(HDHeadphoneAudioExposureStatisticsBucket *)self _enableOverlappingProcessingInPrimaryCalculator:1];
  primaryCalculator = self->_primaryCalculator;
  id v47 = 0;
  char v21 = [(HDStatisticsCollectionCalculator *)primaryCalculator queryForInitialStatisticsWithError:&v47];
  id v22 = v47;
  [(HDHeadphoneAudioExposureStatisticsBucket *)self _enableOverlappingProcessingInPrimaryCalculator:0];
  if ((v21 & 1) == 0)
  {
    _HKInitializeLogging();
    v40 = *v10;
    if (os_log_type_enabled(*v10, OS_LOG_TYPE_ERROR)) {
      -[HDHeadphoneAudioExposureStatisticsBucket _lock_queryForInitialStatisticsWithError:](v40);
    }
    v41 = [(HDStatisticsCollectionCalculator *)self->_primaryCalculator dateInterval];
    [(HDStatisticsCollectionCalculator *)self->_primaryCalculator setDateInterval:v41];

    id v42 = v22;
    if (v42)
    {
      if (a3) {
        *a3 = v42;
      }
      else {
        _HKLogDroppedError();
      }
    }

    goto LABEL_26;
  }
  if (!self->_previousStatistics || !self->_includesPrunableData)
  {
    uint64_t v23 = [(HDHeadphoneAudioExposureStatisticsBucket *)self _lock_fetchIncludesPrunableDataWithError:a3];
    if (!v23)
    {
LABEL_26:
      v39 = 0;
      goto LABEL_27;
    }
    id v24 = v23;
    self->_BOOL includesPrunableData = [v23 BOOLValue];
  }
  id v25 = [(HDStatisticsCollectionCalculator *)self->_primaryCalculator currentStatistics];

  if (!v25)
  {
    objc_msgSend(MEMORY[0x263F087E8], "hk_assignError:code:description:", a3, 100, @"Something went wrong with the calculator and we were unable to compute current statistics.");
    goto LABEL_26;
  }
  journaledCalculator = self->_journaledCalculator;
  self->_journaledCalculator = 0;

  v27 = [(HDStatisticsCollectionCalculatorDefaultDataSource *)self->_dataSource anchor];
  anchor = self->_anchor;
  self->_anchor = v27;

  _HKInitializeLogging();
  os_log_t v29 = *v10;
  if (os_log_type_enabled(*v10, OS_LOG_TYPE_DEFAULT))
  {
    int v30 = self->_anchor;
    uint64_t v31 = v29;
    __int16 v32 = [(HDHeadphoneAudioExposureStatisticsBucket *)self _lock_dateInterval];
    id v33 = [v32 startDate];
    [v33 timeIntervalSince1970];
    uint64_t v35 = (uint64_t)v34;
    uint64_t v36 = [(HDHeadphoneAudioExposureStatisticsBucket *)self _lock_dateInterval];
    uint64_t v37 = [v36 endDate];
    [v37 timeIntervalSince1970];
    *(_DWORD *)buf = 138543874;
    uint64_t v49 = (uint64_t)v30;
    __int16 v50 = 2048;
    uint64_t v51 = v35;
    __int16 v52 = 2048;
    uint64_t v53 = (uint64_t)v38;
    _os_log_impl(&dword_22615C000, v31, OS_LOG_TYPE_DEFAULT, "Queried initial anchor %{public}@ for HAE statistics in bucket interval: %{time_t}ld to %{time_t}ld", buf, 0x20u);
  }
  v39 = self->_anchor;
LABEL_27:

  return v39;
}

- (id)_lock_fetchIncludesPrunableDataWithError:(id *)a3
{
  v26[3] = *MEMORY[0x263EF8340];
  os_unfair_lock_assert_owner(&self->_lock);
  uint64_t v4 = [(HDStatisticsCollectionCalculatorDefaultDataSource *)self->_dataSource profile];
  id v5 = HKHeadphoneAudioExposureType();
  id v6 = (void *)MEMORY[0x263F434A8];
  char v7 = HDSampleEntityPredicateForDataType();
  v26[0] = v7;
  id v8 = [(HDStatisticsCollectionCalculator *)self->_primaryCalculator dateInterval];
  id v9 = HDSampleEntityPredicateForDateInterval();
  v26[1] = v9;
  id v10 = [v4 metadataManager];
  id v11 = [MEMORY[0x263EFFA08] setWithObject:MEMORY[0x263EFFA88]];
  int v12 = [v10 predicateWithMetadataKey:*MEMORY[0x263F0AAF0] allowedValues:v11];
  v26[2] = v12;
  uint64_t v13 = [MEMORY[0x263EFF8C0] arrayWithObjects:v26 count:3];
  __int16 v14 = [v6 predicateMatchingAllPredicates:v13];

  uint64_t v20 = 0;
  char v21 = &v20;
  uint64_t v22 = 0x3032000000;
  uint64_t v23 = __Block_byref_object_copy__0;
  id v24 = __Block_byref_object_dispose__0;
  id v25 = 0;
  double v15 = [MEMORY[0x263F432E8] entityEnumeratorWithType:v5 profile:v4];
  [v15 setIgnoreEntityClassAdditionalPredicateForEnumeration:1];
  [v15 setPredicate:v14];
  [v15 setLimitCount:1];
  v19[0] = MEMORY[0x263EF8330];
  v19[1] = 3221225472;
  v19[2] = __85__HDHeadphoneAudioExposureStatisticsBucket__lock_fetchIncludesPrunableDataWithError___block_invoke;
  v19[3] = &unk_264795EC0;
  v19[4] = &v20;
  [v15 enumerateWithError:a3 handler:v19];
  uint64_t v16 = [NSNumber numberWithInt:v21[5] != 0];

  _Block_object_dispose(&v20, 8);
  return v16;
}

uint64_t __85__HDHeadphoneAudioExposureStatisticsBucket__lock_fetchIncludesPrunableDataWithError___block_invoke(uint64_t a1, void *a2)
{
  return 0;
}

- (HDStatisticsCollectionCalculator)primaryCalculator
{
  return self->_primaryCalculator;
}

- (HDStatisticsCollectionCalculator)journaledCalculator
{
  return self->_journaledCalculator;
}

- (NSDate)startDate
{
  return self->_startDate;
}

- (NSDate)earliestStartDate
{
  return self->_earliestStartDate;
}

- (BOOL)boundedInterval
{
  return self->_boundedInterval;
}

- (NSNumber)anchor
{
  return self->_anchor;
}

- (HKStatistics)previousStatistics
{
  return self->_previousStatistics;
}

- (BOOL)includesPrunableData
{
  return self->_includesPrunableData;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sourceOrderProvider, 0);
  objc_storeStrong((id *)&self->_dataSource, 0);
  objc_storeStrong((id *)&self->_previousStatistics, 0);
  objc_storeStrong((id *)&self->_anchor, 0);
  objc_storeStrong((id *)&self->_earliestStartDate, 0);
  objc_storeStrong((id *)&self->_startDate, 0);
  objc_storeStrong((id *)&self->_journaledCalculator, 0);
  objc_storeStrong((id *)&self->_primaryCalculator, 0);
}

- (void)_lock_currentStatisticsWithError:(os_log_t)log .cold.1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_fault_impl(&dword_22615C000, log, OS_LOG_TYPE_FAULT, "unable compute journaled statistics", v1, 2u);
}

- (void)updateWithSampleBatch:(void *)a1 error:(void *)a2 .cold.1(void *a1, void *a2)
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  BOOL v3 = a1;
  uint64_t v4 = [a2 samples];
  int v5 = 134217984;
  uint64_t v6 = [v4 count];
  _os_log_fault_impl(&dword_22615C000, v3, OS_LOG_TYPE_FAULT, "Added %lu HAE quantity samples without an anchor!", (uint8_t *)&v5, 0xCu);
}

void __72__HDHeadphoneAudioExposureStatisticsBucket_updateWithSampleBatch_error___block_invoke_cold_1(void *a1, void *a2, uint64_t a3)
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  int v5 = a1;
  uint64_t v6 = [a2 UUID];
  int v7 = 138412546;
  id v8 = v6;
  __int16 v9 = 2114;
  uint64_t v10 = a3;
  _os_log_fault_impl(&dword_22615C000, v5, OS_LOG_TYPE_FAULT, "Incoming HAE sample %@ has invalid metadata: %{public}@", (uint8_t *)&v7, 0x16u);
}

- (void)_lock_queryForInitialStatisticsWithError:(os_log_t)log .cold.1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_22615C000, log, OS_LOG_TYPE_ERROR, "Failed to load historical data for primary calculator.", v1, 2u);
}

@end