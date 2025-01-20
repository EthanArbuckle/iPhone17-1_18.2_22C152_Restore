@interface HDStatisticsQueryServer
+ (BOOL)supportsAnchorBasedAuthorization;
+ (BOOL)validateConfiguration:(id)a3 client:(id)a4 error:(id *)a5;
+ (Class)queryClass;
+ (id)requiredEntitlements;
- (HDStatisticsQueryServer)initWithUUID:(id)a3 configuration:(id)a4 client:(id)a5 delegate:(id)a6;
- (id)quantityType;
- (unint64_t)mergeStrategy;
- (unint64_t)statisticsOptions;
- (void)_queue_start;
@end

@implementation HDStatisticsQueryServer

- (HDStatisticsQueryServer)initWithUUID:(id)a3 configuration:(id)a4 client:(id)a5 delegate:(id)a6
{
  id v10 = a4;
  v24.receiver = self;
  v24.super_class = (Class)HDStatisticsQueryServer;
  v11 = [(HDQueryServer *)&v24 initWithUUID:a3 configuration:v10 client:a5 delegate:a6];
  if (v11)
  {
    uint64_t v12 = [v10 dateInterval];
    dateInterval = v11->_dateInterval;
    v11->_dateInterval = (NSDateInterval *)v12;

    v11->_statisticsOptions = [v10 options];
    v11->_mergeStrategy = [v10 mergeStrategy];
    v23.receiver = v11;
    v23.super_class = (Class)HDStatisticsQueryServer;
    uint64_t v14 = [(HDQueryServer *)&v23 quantityType];
    quantityType = v11->_quantityType;
    v11->_quantityType = (HKQuantityType *)v14;

    if (!v11->_quantityType)
    {
      v16 = [(HDQueryServer *)v11 sampleType];
      objc_opt_class();
      char isKindOfClass = objc_opt_isKindOfClass();

      if (isKindOfClass)
      {
        v18 = [(HDQueryServer *)v11 sampleType];
        v19 = [MEMORY[0x1E4F2B618] countUnit];
        uint64_t v20 = +[_HDStatisticsSyntheticQuantityType syntheticQuantityTypeWithUnderlyingSampleType:v18 aggregationStyle:1 canonicalUnit:v19];
        v21 = v11->_quantityType;
        v11->_quantityType = (HKQuantityType *)v20;
      }
    }
  }

  return v11;
}

+ (Class)queryClass
{
  return (Class)objc_opt_class();
}

+ (id)requiredEntitlements
{
  return (id)MEMORY[0x1E4F1CBF0];
}

+ (BOOL)validateConfiguration:(id)a3 client:(id)a4 error:(id *)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = v8;
  self;
  uint64_t v11 = [v10 options];
  if ((_HKStatisticsOptionPercentile() & v11) != 0
    || (uint64_t v12 = [v10 options], (_HKStatisticsOptionPresence() & v12) != 0)
    || (uint64_t v13 = [v10 options], (_HKStatisticOptionsAverageSampleDuration() & v13) != 0)
    || (uint64_t v14 = [v10 options], (_HKStatisticsOptionBaselineRelativeQuantities() & v14) != 0)
    || (uint64_t v15 = [v10 options], (_HKStatisticsOptionSleepStages() & v15) != 0))
  {

    goto LABEL_7;
  }
  objc_super v23 = [v10 objectType];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) == 0)
  {
LABEL_7:
    if (![v9 hasRequiredEntitlement:*MEMORY[0x1E4F2A548] error:a5]) {
      goto LABEL_15;
    }
  }
  uint64_t v16 = [v10 options];
  if ((_HKStatisticsOptionPresence() & v16) != 0)
  {
    v17 = (void *)MEMORY[0x1E4F28C58];
    v18 = @"Use a sample query with limit 1 for non-collection presence calculations.";
  }
  else
  {
    uint64_t v19 = [v10 options];
    if ((_HKStatisticsOptionBaselineRelativeQuantities() & v19) != 0)
    {
      v17 = (void *)MEMORY[0x1E4F28C58];
      v18 = @"Use HKStatisticsCollectionQuery for relative quantity calculations";
    }
    else
    {
      uint64_t v20 = [v10 options];
      if ((_HKStatisticsOptionSleepStages() & v20) == 0)
      {
        v25.receiver = a1;
        v25.super_class = (Class)&OBJC_METACLASS___HDStatisticsQueryServer;
        unsigned __int8 v21 = objc_msgSendSuper2(&v25, sel_validateConfiguration_client_error_, v10, v9, a5);
        goto LABEL_16;
      }
      v17 = (void *)MEMORY[0x1E4F28C58];
      v18 = @"This statistics option is currently only intended to be used via HDStatisticsCalculator directly.";
    }
  }
  objc_msgSend(v17, "hk_assignError:code:format:", a5, 3, v18);
LABEL_15:
  unsigned __int8 v21 = 0;
LABEL_16:

  return v21;
}

+ (BOOL)supportsAnchorBasedAuthorization
{
  return 1;
}

- (void)_queue_start
{
  v37.receiver = self;
  v37.super_class = (Class)HDStatisticsQueryServer;
  [(HDQueryServer *)&v37 _queue_start];
  v36 = 0;
  if (!self)
  {
    v32 = 0;
    id v8 = 0;
    goto LABEL_24;
  }
  v3 = [(HDQueryServer *)self objectType];
  v4 = [(HDQueryServer *)self readAuthorizationStatusForType:v3 error:&v36];

  if (v4 && [v4 canRead])
  {
    v5 = [(HDQueryServer *)self filter];
    if (v5)
    {
      v6 = [(HDQueryServer *)self profile];
      v7 = [v5 predicateWithProfile:v6];

      if (!v7)
      {
        objc_msgSend(MEMORY[0x1E4F28C58], "hk_assignError:code:format:", &v36, 100, @"Error building predicate for query");
        id v8 = 0;
LABEL_22:

        goto LABEL_23;
      }
    }
    else
    {
      v7 = 0;
    }
    id v9 = (void *)MEMORY[0x1E4F65D08];
    id v10 = [v4 authorizationPredicate];
    uint64_t v11 = [v9 compoundPredicateWithPredicate:v7 otherPredicate:v10];

    uint64_t v12 = [(HDStatisticsQueryServer *)self quantityType];
    uint64_t v13 = [v4 restrictedSourceEntities];
    id v14 = v12;
    id v15 = v11;
    id v16 = v13;
    id v17 = v5;
    unint64_t statisticsOptions = self->_statisticsOptions;
    if ((_HKStatisticsOptionAttenuateSamples() & statisticsOptions) == 0) {
      goto LABEL_12;
    }
    uint64_t v19 = [MEMORY[0x1E4F2B3B8] quantityTypeForIdentifier:*MEMORY[0x1E4F2A7F0]];
    int v20 = [v14 isEqual:v19];

    if (!v20) {
      goto LABEL_12;
    }
    unsigned __int8 v21 = [MEMORY[0x1E4F2B3B8] _quantityTypeWithCode:272];
    v22 = [HDStatisticsCollectionCalculatorAttenuatedDataSource alloc];
    objc_super v23 = [(HDQueryServer *)self profile];
    id v24 = [(HDStatisticsCollectionCalculatorAttenuatedDataSource *)v22 initForProfile:v23 quantityType:v14 predicate:v15 restrictedSourceEntities:v16 attenuationType:v21];

    if (!v24)
    {
LABEL_12:
      objc_super v25 = [HDStatisticsCollectionCalculatorDefaultDataSource alloc];
      v26 = [(HDQueryServer *)self profile];
      id v24 = [(HDStatisticsCollectionCalculatorDefaultDataSource *)v25 initForProfile:v26 quantityType:v14 predicate:v15 restrictedSourceEntities:v16];
    }
    [v24 setFilter:v17];
    [v24 setIncludeUnfrozenSeries:1];

    v27 = [HDStatisticsCollectionCalculatorDefaultSourceOrderProvider alloc];
    v28 = [(HDQueryServer *)self profile];
    v29 = [(HDStatisticsCollectionCalculatorDefaultSourceOrderProvider *)v27 initWithProfile:v28 quantityType:v14];

    v30 = +[HDStatisticsCollectionCalculator calculatorForQuantityType:v14 intervalCollection:0 options:self->_statisticsOptions mergeStrategy:self->_mergeStrategy];
    [v30 setDataSource:v24];
    [v30 setSourceOrderProvider:v29];
    if (self->_dateInterval) {
      objc_msgSend(v30, "setDateInterval:");
    }
    if ([v30 queryForInitialStatisticsWithError:&v36])
    {
      v31 = [v30 currentStatistics];
      if ([v31 dataCount]) {
        id v8 = v31;
      }
      else {
        id v8 = 0;
      }
    }
    else
    {
      id v8 = 0;
    }

    goto LABEL_22;
  }
  id v8 = 0;
LABEL_23:

  v32 = v36;
LABEL_24:
  id v33 = v32;
  v34 = [(HDQueryServer *)self clientProxy];
  if (v8 || !v33)
  {
    -[HDQueryServer setDataCount:](self, "setDataCount:", [v8 dataCount]);
    v35 = [(HDQueryServer *)self queryUUID];
    objc_msgSend(v34, "client_deliverStatistics:forQuery:", v8, v35);
  }
  else
  {
    v35 = [(HDQueryServer *)self queryUUID];
    objc_msgSend(v34, "client_deliverError:forQuery:", v33, v35);
  }
}

- (id)quantityType
{
  return self->_quantityType;
}

- (unint64_t)statisticsOptions
{
  return self->_statisticsOptions;
}

- (unint64_t)mergeStrategy
{
  return self->_mergeStrategy;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_quantityType, 0);

  objc_storeStrong((id *)&self->_dateInterval, 0);
}

@end