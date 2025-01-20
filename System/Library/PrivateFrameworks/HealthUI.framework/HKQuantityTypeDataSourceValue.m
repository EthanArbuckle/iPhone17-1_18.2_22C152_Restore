@interface HKQuantityTypeDataSourceValue
+ (id)quantityTypeDataSourceValueWithCodableStatistics:(id)a3 sourceTimeZone:(id)a4;
- (HKQuantity)averageQuantity;
- (HKQuantity)durationQuantity;
- (HKQuantity)maxQuantity;
- (HKQuantity)minQuantity;
- (HKQuantity)mostRecentQuantity;
- (HKQuantity)sumQuantity;
- (HKQuantityType)quantityType;
- (NSDate)endDate;
- (NSDate)startDate;
- (NSDateComponents)statisticsInterval;
- (NSDictionary)metadata;
- (NSNumber)baselineRelativeValueState;
- (id)codableStatistics;
- (id)maxYValue;
- (id)minYValue;
- (int64_t)recordCount;
- (void)setAverageQuantity:(id)a3;
- (void)setBaselineRelativeValueState:(id)a3;
- (void)setDurationQuantity:(id)a3;
- (void)setEndDate:(id)a3;
- (void)setMaxQuantity:(id)a3;
- (void)setMetadata:(id)a3;
- (void)setMinQuantity:(id)a3;
- (void)setMostRecentQuantity:(id)a3;
- (void)setQuantityType:(id)a3;
- (void)setRecordCount:(int64_t)a3;
- (void)setStartDate:(id)a3;
- (void)setStatisticsInterval:(id)a3;
- (void)setSumQuantity:(id)a3;
@end

@implementation HKQuantityTypeDataSourceValue

- (void)setBaselineRelativeValueState:(id)a3
{
  id v12 = a3;
  objc_storeStrong((id *)&self->_baselineRelativeValueState, a3);
  if (v12)
  {
    minQuantity = self->_minQuantity;
    if (minQuantity)
    {
      self->_minQuantity = 0;
    }
    maxQuantity = self->_maxQuantity;
    if (maxQuantity)
    {
      self->_maxQuantity = 0;
    }
    if ([v12 integerValue] != 3)
    {
      averageQuantity = self->_averageQuantity;
      if (averageQuantity)
      {
        v8 = (void *)MEMORY[0x1E4F2B370];
        v9 = [(HKQuantity *)averageQuantity _unit];
        v10 = [v8 quantityWithUnit:v9 doubleValue:0.0];
        v11 = self->_averageQuantity;
        self->_averageQuantity = v10;
      }
    }
  }
}

- (id)minYValue
{
  v2 = NSNumber;
  [(HKQuantity *)self->_minQuantity _value];
  return (id)objc_msgSend(v2, "numberWithDouble:");
}

- (id)maxYValue
{
  v2 = NSNumber;
  [(HKQuantity *)self->_maxQuantity _value];
  return (id)objc_msgSend(v2, "numberWithDouble:");
}

- (HKQuantity)sumQuantity
{
  return self->_sumQuantity;
}

- (void)setSumQuantity:(id)a3
{
}

- (HKQuantity)minQuantity
{
  return self->_minQuantity;
}

- (void)setMinQuantity:(id)a3
{
}

- (HKQuantity)maxQuantity
{
  return self->_maxQuantity;
}

- (void)setMaxQuantity:(id)a3
{
}

- (HKQuantity)averageQuantity
{
  return self->_averageQuantity;
}

- (void)setAverageQuantity:(id)a3
{
}

- (HKQuantity)durationQuantity
{
  return self->_durationQuantity;
}

- (void)setDurationQuantity:(id)a3
{
}

- (HKQuantity)mostRecentQuantity
{
  return self->_mostRecentQuantity;
}

- (void)setMostRecentQuantity:(id)a3
{
}

- (HKQuantityType)quantityType
{
  return self->_quantityType;
}

- (void)setQuantityType:(id)a3
{
}

- (int64_t)recordCount
{
  return self->_recordCount;
}

- (void)setRecordCount:(int64_t)a3
{
  self->_recordCount = a3;
}

- (NSDateComponents)statisticsInterval
{
  return self->_statisticsInterval;
}

- (void)setStatisticsInterval:(id)a3
{
}

- (NSNumber)baselineRelativeValueState
{
  return self->_baselineRelativeValueState;
}

- (NSDate)startDate
{
  return self->_startDate;
}

- (void)setStartDate:(id)a3
{
}

- (NSDate)endDate
{
  return self->_endDate;
}

- (void)setEndDate:(id)a3
{
}

- (NSDictionary)metadata
{
  return self->_metadata;
}

- (void)setMetadata:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_metadata, 0);
  objc_storeStrong((id *)&self->_endDate, 0);
  objc_storeStrong((id *)&self->_startDate, 0);
  objc_storeStrong((id *)&self->_baselineRelativeValueState, 0);
  objc_storeStrong((id *)&self->_statisticsInterval, 0);
  objc_storeStrong((id *)&self->_quantityType, 0);
  objc_storeStrong((id *)&self->_mostRecentQuantity, 0);
  objc_storeStrong((id *)&self->_durationQuantity, 0);
  objc_storeStrong((id *)&self->_averageQuantity, 0);
  objc_storeStrong((id *)&self->_maxQuantity, 0);
  objc_storeStrong((id *)&self->_minQuantity, 0);
  objc_storeStrong((id *)&self->_sumQuantity, 0);
}

+ (id)quantityTypeDataSourceValueWithCodableStatistics:(id)a3 sourceTimeZone:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v7 = objc_alloc_init(HKQuantityTypeDataSourceValue);
    if ([v5 hasDataType])
    {
      v8 = objc_msgSend(MEMORY[0x1E4F2B2C0], "dataTypeWithCode:", objc_msgSend(v5, "dataType"));
      [(HKQuantityTypeDataSourceValue *)v7 setQuantityType:v8];
    }
    if ([v5 hasStartDate])
    {
      [v5 startDate];
      v9 = objc_msgSend(MEMORY[0x1E4F1C9C8], "dateWithTimeIntervalSinceReferenceDate:");
      v10 = objc_msgSend(v9, "hk_dateFromSourceTimeZone:", v6);
      [(HKQuantityTypeDataSourceValue *)v7 setStartDate:v10];
    }
    if ([v5 hasEndDate])
    {
      [v5 endDate];
      v11 = objc_msgSend(MEMORY[0x1E4F1C9C8], "dateWithTimeIntervalSinceReferenceDate:");
      id v12 = objc_msgSend(v11, "hk_dateFromSourceTimeZone:", v6);
      [(HKQuantityTypeDataSourceValue *)v7 setEndDate:v12];
    }
    if ([v5 hasAverageQuantity])
    {
      v13 = (void *)MEMORY[0x1E4F2B370];
      v14 = [v5 averageQuantity];
      v15 = [v13 createWithCodableQuantity:v14];
      [(HKQuantityTypeDataSourceValue *)v7 setAverageQuantity:v15];
    }
    if ([v5 hasMinQuantity])
    {
      v16 = (void *)MEMORY[0x1E4F2B370];
      v17 = [v5 minQuantity];
      v18 = [v16 createWithCodableQuantity:v17];
      [(HKQuantityTypeDataSourceValue *)v7 setMinQuantity:v18];
    }
    if ([v5 hasMaxQuantity])
    {
      v19 = (void *)MEMORY[0x1E4F2B370];
      v20 = [v5 maxQuantity];
      v21 = [v19 createWithCodableQuantity:v20];
      [(HKQuantityTypeDataSourceValue *)v7 setMaxQuantity:v21];
    }
    if ([v5 hasMostRecentQuantity])
    {
      v22 = (void *)MEMORY[0x1E4F2B370];
      v23 = [v5 mostRecentQuantity];
      v24 = [v22 createWithCodableQuantity:v23];
      [(HKQuantityTypeDataSourceValue *)v7 setMostRecentQuantity:v24];
    }
    if ([v5 hasSumQuantity])
    {
      v25 = (void *)MEMORY[0x1E4F2B370];
      v26 = [v5 sumQuantity];
      v27 = [v25 createWithCodableQuantity:v26];
      [(HKQuantityTypeDataSourceValue *)v7 setSumQuantity:v27];
    }
    if ([v5 hasDurationQuantity])
    {
      v28 = (void *)MEMORY[0x1E4F2B370];
      v29 = [v5 durationQuantity];
      v30 = [v28 createWithCodableQuantity:v29];
      [(HKQuantityTypeDataSourceValue *)v7 setDurationQuantity:v30];
    }
    if ([v5 hasDataCount]) {
      -[HKQuantityTypeDataSourceValue setRecordCount:](v7, "setRecordCount:", [v5 dataCount]);
    }
    if ([v5 hasStatisticsInterval])
    {
      v31 = (void *)MEMORY[0x1E4F1C9D8];
      v32 = [v5 statisticsInterval];
      v33 = objc_msgSend(v31, "hkui_dateComponentsWithCodableDateComponents:", v32);
      [(HKQuantityTypeDataSourceValue *)v7 setStatisticsInterval:v33];
    }
    if ([v5 hasBaselineRelativeValueState])
    {
      v34 = objc_msgSend(NSNumber, "numberWithLongLong:", objc_msgSend(v5, "baselineRelativeValueState"));
      [(HKQuantityTypeDataSourceValue *)v7 setBaselineRelativeValueState:v34];
    }
    if ([v5 hasMetadata])
    {
      v35 = (void *)MEMORY[0x1E4F1C9E8];
      v36 = [v5 metadata];
      v37 = [v35 dictionaryWithCodableMetadata:v36];
      [(HKQuantityTypeDataSourceValue *)v7 setMetadata:v37];
    }
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (id)codableStatistics
{
  v3 = objc_alloc_init(HKCodableStatistics);
  v4 = [(HKQuantityTypeDataSourceValue *)self quantityType];
  -[HKCodableStatistics setDataType:](v3, "setDataType:", [v4 code]);

  id v5 = [(HKQuantityTypeDataSourceValue *)self startDate];
  [v5 timeIntervalSinceReferenceDate];
  -[HKCodableStatistics setStartDate:](v3, "setStartDate:");

  id v6 = [(HKQuantityTypeDataSourceValue *)self endDate];
  [v6 timeIntervalSinceReferenceDate];
  -[HKCodableStatistics setEndDate:](v3, "setEndDate:");

  v7 = [(HKQuantityTypeDataSourceValue *)self averageQuantity];
  v8 = [v7 codableRepresentation];
  [(HKCodableStatistics *)v3 setAverageQuantity:v8];

  v9 = [(HKQuantityTypeDataSourceValue *)self minQuantity];
  v10 = [v9 codableRepresentation];
  [(HKCodableStatistics *)v3 setMinQuantity:v10];

  v11 = [(HKQuantityTypeDataSourceValue *)self maxQuantity];
  id v12 = [v11 codableRepresentation];
  [(HKCodableStatistics *)v3 setMaxQuantity:v12];

  v13 = [(HKQuantityTypeDataSourceValue *)self mostRecentQuantity];
  v14 = [v13 codableRepresentation];
  [(HKCodableStatistics *)v3 setMostRecentQuantity:v14];

  v15 = [(HKQuantityTypeDataSourceValue *)self sumQuantity];
  v16 = [v15 codableRepresentation];
  [(HKCodableStatistics *)v3 setSumQuantity:v16];

  v17 = [(HKQuantityTypeDataSourceValue *)self durationQuantity];
  v18 = [v17 codableRepresentation];
  [(HKCodableStatistics *)v3 setDurationQuantity:v18];

  [(HKCodableStatistics *)v3 setDataCount:[(HKQuantityTypeDataSourceValue *)self recordCount]];
  v19 = [(HKQuantityTypeDataSourceValue *)self statisticsInterval];
  v20 = objc_msgSend(v19, "hkui_codableDateComponents");
  [(HKCodableStatistics *)v3 setStatisticsInterval:v20];

  v21 = [(HKQuantityTypeDataSourceValue *)self baselineRelativeValueState];
  v22 = v21;
  if (v21) {
    -[HKCodableStatistics setBaselineRelativeValueState:](v3, "setBaselineRelativeValueState:", [v21 integerValue]);
  }
  v23 = [(HKQuantityTypeDataSourceValue *)self metadata];

  if (v23)
  {
    v24 = objc_alloc_init(HKCodableMetadataDictionary);
    [(HKCodableStatistics *)v3 setMetadata:v24];

    v25 = [(HKQuantityTypeDataSourceValue *)self metadata];
    v27[0] = MEMORY[0x1E4F143A8];
    v27[1] = 3221225472;
    v27[2] = __67__HKQuantityTypeDataSourceValue_HKCodingSupport__codableStatistics__block_invoke;
    v27[3] = &unk_1E6D57B80;
    v28 = v3;
    [v25 enumerateKeysAndObjectsUsingBlock:v27];
  }
  return v3;
}

void __67__HKQuantityTypeDataSourceValue_HKCodingSupport__codableStatistics__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v8 = a3;
  id v5 = a2;
  id v6 = objc_alloc_init(HKCodableMetadataKeyValuePair);
  [(HKCodableMetadataKeyValuePair *)v6 setKey:v5];

  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    [(HKCodableMetadataKeyValuePair *)v6 setStringValue:v8];
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0) {
      goto LABEL_6;
    }
    -[HKCodableMetadataKeyValuePair setNumberIntValue:](v6, "setNumberIntValue:", (int)[v8 intValue]);
  }
  v7 = [*(id *)(a1 + 32) metadata];
  [v7 addKeyValuePairs:v6];

LABEL_6:
}

@end