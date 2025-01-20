@interface HKStatistics
+ (BOOL)supportsSecureCoding;
+ (void)_validateOptions:(unint64_t)a3 forDataType:(id)a4;
- (BOOL)getData:(id *)a3 error:(id *)a4;
- (BOOL)isEqual:(id)a3;
- (HKQuantity)averageQuantity;
- (HKQuantity)averageQuantityForSource:(HKSource *)source;
- (HKQuantity)duration;
- (HKQuantity)durationForSource:(HKSource *)source;
- (HKQuantity)maximumQuantity;
- (HKQuantity)maximumQuantityForSource:(HKSource *)source;
- (HKQuantity)minimumQuantity;
- (HKQuantity)minimumQuantityForSource:(HKSource *)source;
- (HKQuantity)mostRecentQuantity;
- (HKQuantity)mostRecentQuantityForSource:(HKSource *)source;
- (HKQuantity)percentileQuantity;
- (HKQuantity)sumQuantity;
- (HKQuantity)sumQuantityForSource:(HKSource *)source;
- (HKQuantityType)quantityType;
- (HKStatistics)init;
- (HKStatistics)initWithCoder:(id)a3;
- (HKStatistics)initWithDataType:(id)a3 startDate:(id)a4 endDate:(id)a5;
- (NSArray)sources;
- (NSDate)endDate;
- (NSDate)startDate;
- (NSDateInterval)mostRecentQuantityDateInterval;
- (NSDateInterval)mostRecentQuantityDateIntervalForSource:(HKSource *)source;
- (NSDictionary)averageQuantityBySource;
- (NSDictionary)categoryValueBySource;
- (NSDictionary)dataCountBySource;
- (NSDictionary)durationBySource;
- (NSDictionary)maximumQuantityBySource;
- (NSDictionary)minimumQuantityBySource;
- (NSDictionary)mostRecentQuantityBySource;
- (NSDictionary)mostRecentQuantityDateIntervalBySource;
- (NSDictionary)percentileQuantityBySource;
- (NSDictionary)sumQuantityBySource;
- (NSDictionary)sumQuantityBySourceID;
- (NSNumber)categoryValue;
- (NSString)description;
- (id)_initAsCopyOf:(id)a3;
- (id)asJSONObject;
- (id)baselineRelativeValueState;
- (id)copyWithZone:(_NSZone *)a3;
- (int64_t)bucketIndexForIntervalComponents:(id)a3 anchorDate:(id)a4;
- (unint64_t)dataCount;
- (unint64_t)hash;
- (void)_setEndDate:(id)a3;
- (void)_setSources:(id)a3;
- (void)_setStartDate:(id)a3;
- (void)_validateUnit:(id)a3;
- (void)encodeWithCoder:(id)a3;
- (void)setAverageQuantity:(id)a3;
- (void)setAverageQuantityBySource:(id)a3;
- (void)setCategoryValue:(id)a3;
- (void)setCategoryValueBySource:(id)a3;
- (void)setDataCount:(unint64_t)a3;
- (void)setDataCountBySource:(id)a3;
- (void)setDuration:(id)a3;
- (void)setDurationBySource:(id)a3;
- (void)setMaximumQuantity:(id)a3;
- (void)setMaximumQuantityBySource:(id)a3;
- (void)setMinimumQuantity:(id)a3;
- (void)setMinimumQuantityBySource:(id)a3;
- (void)setMostRecentQuantity:(id)a3;
- (void)setMostRecentQuantityBySource:(id)a3;
- (void)setMostRecentQuantityDateInterval:(id)a3;
- (void)setMostRecentQuantityDateIntervalBySource:(id)a3;
- (void)setPercentileQuantity:(id)a3;
- (void)setPercentileQuantityBySource:(id)a3;
- (void)setSumQuantity:(id)a3;
- (void)setSumQuantityBySource:(id)a3;
- (void)setSumQuantityBySourceID:(id)a3;
@end

@implementation HKStatistics

- (HKStatistics)init
{
  v3 = (void *)MEMORY[0x1E4F1CA00];
  uint64_t v4 = *MEMORY[0x1E4F1C3C8];
  v5 = NSStringFromSelector(a2);
  [v3 raise:v4, @"The -%@ method is not available on %@", v5, objc_opt_class() format];

  return 0;
}

+ (void)_validateOptions:(unint64_t)a3 forDataType:(id)a4
{
  uint64_t isKindOfClass = (uint64_t)a4;
  uint64_t v6 = isKindOfClass;
  if (a3 != 0x10000000)
  {
    id v8 = (id)isKindOfClass;
    if ([(id)isKindOfClass conformsToProtocol:&unk_1EECF0178])
    {
      id v7 = v8;
      if (([v7 supportsStatisticOptions:a3] & 1) == 0) {
        [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3C8], @"Statistics option is not compatible with statistic configuration providing data type %@", v7 format];
      }

      goto LABEL_12;
    }
    objc_opt_class();
    uint64_t isKindOfClass = objc_opt_isKindOfClass();
    if ((isKindOfClass & 1) == 0)
    {
      uint64_t isKindOfClass = [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3C8], @"Unexpected data type %@ not permitted for non-presence options.", v8 format];
      goto LABEL_12;
    }
    uint64_t v6 = (uint64_t)v8;
    if (a3 != 0xFFFFFFFF80000000 && a3 != 64 && a3 != 0x40000000)
    {
      uint64_t isKindOfClass = [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3C8], @"Statistics option is not compatible with non-quantity data type %@", v8 format];
LABEL_12:
      uint64_t v6 = (uint64_t)v8;
    }
  }

  MEMORY[0x1F41817F8](isKindOfClass, v6);
}

- (HKStatistics)initWithDataType:(id)a3 startDate:(id)a4 endDate:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v15.receiver = self;
  v15.super_class = (Class)HKStatistics;
  v12 = [(HKStatistics *)&v15 init];
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_dataType, a3);
    objc_storeStrong((id *)&v13->_startDate, a4);
    objc_storeStrong((id *)&v13->_endDate, a5);
  }

  return v13;
}

- (HKQuantity)averageQuantityForSource:(HKSource *)source
{
  averageQuantityBySource = self->_averageQuantityBySource;
  uint64_t v4 = [(HKSource *)source bundleIdentifier];
  v5 = [(NSDictionary *)averageQuantityBySource objectForKeyedSubscript:v4];

  return (HKQuantity *)v5;
}

- (HKQuantity)minimumQuantityForSource:(HKSource *)source
{
  minimumQuantityBySource = self->_minimumQuantityBySource;
  uint64_t v4 = [(HKSource *)source bundleIdentifier];
  v5 = [(NSDictionary *)minimumQuantityBySource objectForKeyedSubscript:v4];

  return (HKQuantity *)v5;
}

- (HKQuantity)maximumQuantityForSource:(HKSource *)source
{
  maximumQuantityBySource = self->_maximumQuantityBySource;
  uint64_t v4 = [(HKSource *)source bundleIdentifier];
  v5 = [(NSDictionary *)maximumQuantityBySource objectForKeyedSubscript:v4];

  return (HKQuantity *)v5;
}

- (HKQuantity)mostRecentQuantityForSource:(HKSource *)source
{
  mostRecentQuantityBySource = self->_mostRecentQuantityBySource;
  uint64_t v4 = [(HKSource *)source bundleIdentifier];
  v5 = [(NSDictionary *)mostRecentQuantityBySource objectForKeyedSubscript:v4];

  return (HKQuantity *)v5;
}

- (NSDateInterval)mostRecentQuantityDateIntervalForSource:(HKSource *)source
{
  mostRecentQuantityDateIntervalBySource = self->_mostRecentQuantityDateIntervalBySource;
  uint64_t v4 = [(HKSource *)source bundleIdentifier];
  v5 = [(NSDictionary *)mostRecentQuantityDateIntervalBySource objectForKeyedSubscript:v4];

  return (NSDateInterval *)v5;
}

- (HKQuantity)sumQuantityForSource:(HKSource *)source
{
  sumQuantityBySource = self->_sumQuantityBySource;
  uint64_t v4 = [(HKSource *)source bundleIdentifier];
  v5 = [(NSDictionary *)sumQuantityBySource objectForKeyedSubscript:v4];

  return (HKQuantity *)v5;
}

- (HKQuantity)durationForSource:(HKSource *)source
{
  durationBySource = self->_durationBySource;
  uint64_t v4 = [(HKSource *)source bundleIdentifier];
  v5 = [(NSDictionary *)durationBySource objectForKeyedSubscript:v4];

  return (HKQuantity *)v5;
}

- (id)baselineRelativeValueState
{
  if (!self->_minimumQuantity && !self->_maximumQuantity) {
    return 0;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    return 0;
  }
  v3 = self->_dataType;
  if ([(HKObjectType *)v3 _supportsRelativeDataCalculation])
  {
    minimumQuantity = self->_minimumQuantity;
    if (!minimumQuantity) {
      minimumQuantity = self->_maximumQuantity;
    }
    v5 = minimumQuantity;
    uint64_t v6 = [(HKObjectType *)v3 _unitForChangeInCanonicalUnit];
    [(HKQuantity *)v5 doubleValueForUnit:v6];
    double v8 = v7;

    id v9 = &unk_1EECE4958;
    if (v8 == 1.79769313e308) {
      id v9 = &unk_1EECE4940;
    }
    if (v8 == -1.79769313e308) {
      id v10 = &unk_1EECE4928;
    }
    else {
      id v10 = v9;
    }
  }
  else
  {
    id v10 = 0;
  }

  return v10;
}

- (void)setAverageQuantity:(id)a3
{
  id v8 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v5 = [(HKStatistics *)self quantityType];
    uint64_t v6 = [v5 aggregationStyle];

    if ((unint64_t)(v6 - 1) <= 2)
    {
      if (v8)
      {
        double v7 = [v8 _unit];
        [(HKStatistics *)self _validateUnit:v7];
      }
      objc_storeStrong((id *)&self->_averageQuantity, a3);
    }
  }
}

- (void)setMinimumQuantity:(id)a3
{
  id v8 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v5 = [(HKStatistics *)self quantityType];
    uint64_t v6 = [v5 aggregationStyle];

    if ((unint64_t)(v6 - 1) <= 2)
    {
      if (v8)
      {
        double v7 = [v8 _unit];
        [(HKStatistics *)self _validateUnit:v7];
      }
      objc_storeStrong((id *)&self->_minimumQuantity, a3);
    }
  }
}

- (void)setMaximumQuantity:(id)a3
{
  id v8 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v5 = [(HKStatistics *)self quantityType];
    uint64_t v6 = [v5 aggregationStyle];

    if ((unint64_t)(v6 - 1) <= 2)
    {
      if (v8)
      {
        double v7 = [v8 _unit];
        [(HKStatistics *)self _validateUnit:v7];
      }
      objc_storeStrong((id *)&self->_maximumQuantity, a3);
    }
  }
}

- (void)setMostRecentQuantity:(id)a3
{
  uint64_t v4 = (HKQuantity *)a3;
  v5 = v4;
  if (v4)
  {
    uint64_t v6 = [(HKQuantity *)v4 _unit];
    [(HKStatistics *)self _validateUnit:v6];
  }
  mostRecentQuantity = self->_mostRecentQuantity;
  self->_mostRecentQuantity = v5;
}

- (void)setSumQuantity:(id)a3
{
  id v8 = a3;
  if ([(HKObjectType *)self->_dataType conformsToProtocol:&unk_1EECF0178])
  {
    v5 = self->_dataType;
    uint64_t v6 = v5;
    if (v5 && ![(HKObjectType *)v5 aggregationStyleForStatistics])
    {
      if (v8)
      {
        double v7 = [v8 _unit];
        [(HKStatistics *)self _validateUnit:v7];
      }
      objc_storeStrong((id *)&self->_sumQuantity, a3);
    }
  }
  else
  {
    uint64_t v6 = 0;
  }
}

- (void)_validateUnit:(id)a3
{
  id v4 = a3;
  if ([(HKObjectType *)self->_dataType conformsToProtocol:&unk_1EECF0178]) {
    [(HKObjectType *)self->_dataType validateUnitForStatistic:v4];
  }
  else {
    [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3C8], @"%@ %@ is not able to determine compatibility of unit %@", objc_opt_class(), self->_dataType, v4 format];
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = (void *)[(id)objc_opt_class() allocWithZone:a3];

  return (id)[v4 _initAsCopyOf:self];
}

- (id)_initAsCopyOf:(id)a3
{
  id v4 = a3;
  uint64_t v5 = v4[1];
  uint64_t v6 = [v4 startDate];
  double v7 = [v4 endDate];
  id v8 = [(HKStatistics *)self initWithDataType:v5 startDate:v6 endDate:v7];

  if (v8)
  {
    -[HKStatistics setDataCount:](v8, "setDataCount:", [v4 dataCount]);
    v8->_dataCount = [v4 dataCount];
    uint64_t v9 = [v4 averageQuantity];
    averageQuantity = v8->_averageQuantity;
    v8->_averageQuantity = (HKQuantity *)v9;

    uint64_t v11 = [v4 minimumQuantity];
    minimumQuantity = v8->_minimumQuantity;
    v8->_minimumQuantity = (HKQuantity *)v11;

    uint64_t v13 = [v4 maximumQuantity];
    maximumQuantity = v8->_maximumQuantity;
    v8->_maximumQuantity = (HKQuantity *)v13;

    uint64_t v15 = [v4 mostRecentQuantity];
    mostRecentQuantity = v8->_mostRecentQuantity;
    v8->_mostRecentQuantity = (HKQuantity *)v15;

    uint64_t v17 = [v4 mostRecentQuantityDateInterval];
    mostRecentQuantityDateInterval = v8->_mostRecentQuantityDateInterval;
    v8->_mostRecentQuantityDateInterval = (NSDateInterval *)v17;

    uint64_t v19 = [v4 sumQuantity];
    sumQuantity = v8->_sumQuantity;
    v8->_sumQuantity = (HKQuantity *)v19;

    uint64_t v21 = [v4 duration];
    duration = v8->_duration;
    v8->_duration = (HKQuantity *)v21;

    uint64_t v23 = [v4 averageQuantityBySource];
    averageQuantityBySource = v8->_averageQuantityBySource;
    v8->_averageQuantityBySource = (NSDictionary *)v23;

    uint64_t v25 = [v4 minimumQuantityBySource];
    minimumQuantityBySource = v8->_minimumQuantityBySource;
    v8->_minimumQuantityBySource = (NSDictionary *)v25;

    uint64_t v27 = [v4 maximumQuantityBySource];
    maximumQuantityBySource = v8->_maximumQuantityBySource;
    v8->_maximumQuantityBySource = (NSDictionary *)v27;

    uint64_t v29 = [v4 mostRecentQuantityBySource];
    mostRecentQuantityBySource = v8->_mostRecentQuantityBySource;
    v8->_mostRecentQuantityBySource = (NSDictionary *)v29;

    uint64_t v31 = [v4 mostRecentQuantityDateIntervalBySource];
    mostRecentQuantityDateIntervalBySource = v8->_mostRecentQuantityDateIntervalBySource;
    v8->_mostRecentQuantityDateIntervalBySource = (NSDictionary *)v31;

    uint64_t v33 = [v4 sumQuantityBySource];
    sumQuantityBySource = v8->_sumQuantityBySource;
    v8->_sumQuantityBySource = (NSDictionary *)v33;

    uint64_t v35 = [v4 dataCountBySource];
    dataCountBySource = v8->_dataCountBySource;
    v8->_dataCountBySource = (NSDictionary *)v35;

    uint64_t v37 = [v4 durationBySource];
    durationBySource = v8->_durationBySource;
    v8->_durationBySource = (NSDictionary *)v37;

    v39 = [v4 sources];
    uint64_t v40 = [v39 copy];
    sources = v8->_sources;
    v8->_sources = (NSArray *)v40;
  }
  return v8;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  dataType = self->_dataType;
  id v5 = a3;
  [v5 encodeObject:dataType forKey:@"dataType"];
  [v5 encodeObject:self->_startDate forKey:@"startDate"];
  [v5 encodeObject:self->_endDate forKey:@"endDate"];
  [v5 encodeInteger:self->_dataCount forKey:@"dataCount"];
  [v5 encodeObject:self->_sources forKey:@"sources"];
  [v5 encodeObject:self->_averageQuantity forKey:@"average"];
  [v5 encodeObject:self->_minimumQuantity forKey:@"min"];
  [v5 encodeObject:self->_maximumQuantity forKey:@"max"];
  [v5 encodeObject:self->_mostRecentQuantity forKey:@"mostRecent"];
  [v5 encodeObject:self->_mostRecentQuantityDateInterval forKey:@"mostRecentDateInterval"];
  [v5 encodeObject:self->_sumQuantity forKey:@"sum"];
  [v5 encodeObject:self->_duration forKey:@"duration"];
  [v5 encodeObject:self->_averageQuantityBySource forKey:@"averageBySource"];
  [v5 encodeObject:self->_minimumQuantityBySource forKey:@"minBySource"];
  [v5 encodeObject:self->_maximumQuantityBySource forKey:@"maxBySource"];
  [v5 encodeObject:self->_mostRecentQuantityBySource forKey:@"mostRecentBySource"];
  [v5 encodeObject:self->_mostRecentQuantityDateIntervalBySource forKey:@"mostRecentDateIntervalBySource"];
  [v5 encodeObject:self->_sumQuantityBySource forKey:@"sumBySource"];
  [v5 encodeObject:self->_dataCountBySource forKey:@"countBySource"];
  [v5 encodeObject:self->_durationBySource forKey:@"durationBySource"];
  [v5 encodeObject:self->_categoryValue forKey:@"categoryValueKey"];
  [v5 encodeObject:self->_categoryValueBySource forKey:@"categoryValueBySourceKey"];
}

- (HKStatistics)initWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"dataType"];
  uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"startDate"];
  double v7 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"endDate"];
  id v8 = [(HKStatistics *)self initWithDataType:v5 startDate:v6 endDate:v7];
  if (v8)
  {
    v8->_dataCount = [v4 decodeIntegerForKey:@"dataCount"];
    id v9 = objc_alloc(MEMORY[0x1E4F1CAD0]);
    uint64_t v10 = objc_opt_class();
    v36 = objc_msgSend(v9, "initWithObjects:", v10, objc_opt_class(), 0);
    uint64_t v11 = [v4 decodeObjectOfClasses:v36 forKey:@"sources"];
    sources = v8->_sources;
    v8->_sources = (NSArray *)v11;

    uint64_t v13 = objc_opt_class();
    uint64_t v14 = objc_opt_class();
    uint64_t v15 = objc_opt_class();
    uint64_t v16 = objc_opt_class();
    uint64_t v17 = [v4 decodeObjectOfClass:v14 forKey:@"average"];
    [(HKStatistics *)v8 setAverageQuantity:v17];

    v18 = [v4 decodeObjectOfClass:v14 forKey:@"min"];
    [(HKStatistics *)v8 setMinimumQuantity:v18];

    uint64_t v19 = [v4 decodeObjectOfClass:v14 forKey:@"max"];
    [(HKStatistics *)v8 setMaximumQuantity:v19];

    v20 = [v4 decodeObjectOfClass:v14 forKey:@"mostRecent"];
    [(HKStatistics *)v8 setMostRecentQuantity:v20];

    uint64_t v21 = [v4 decodeObjectOfClass:v13 forKey:@"mostRecentDateInterval"];
    [(HKStatistics *)v8 setMostRecentQuantityDateInterval:v21];

    v22 = [v4 decodeObjectOfClass:v14 forKey:@"sum"];
    [(HKStatistics *)v8 setSumQuantity:v22];

    uint64_t v23 = [v4 decodeObjectOfClass:v14 forKey:@"duration"];
    [(HKStatistics *)v8 setDuration:v23];

    v24 = [v4 decodeObjectOfClass:v16 forKey:@"categoryValueKey"];
    [(HKStatistics *)v8 setCategoryValue:v24];

    uint64_t v25 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CAD0]), "initWithObjects:", objc_opt_class(), v15, v16, v13, v14, 0);
    v26 = [v4 decodeObjectOfClasses:v25 forKey:@"averageBySource"];
    [(HKStatistics *)v8 setAverageQuantityBySource:v26];

    uint64_t v27 = [v4 decodeObjectOfClasses:v25 forKey:@"minBySource"];
    [(HKStatistics *)v8 setMinimumQuantityBySource:v27];

    v28 = [v4 decodeObjectOfClasses:v25 forKey:@"maxBySource"];
    [(HKStatistics *)v8 setMaximumQuantityBySource:v28];

    uint64_t v29 = [v4 decodeObjectOfClasses:v25 forKey:@"mostRecentBySource"];
    [(HKStatistics *)v8 setMostRecentQuantityBySource:v29];

    v30 = [v4 decodeObjectOfClasses:v25 forKey:@"mostRecentDateIntervalBySource"];
    [(HKStatistics *)v8 setMostRecentQuantityDateIntervalBySource:v30];

    uint64_t v31 = [v4 decodeObjectOfClasses:v25 forKey:@"sumBySource"];
    [(HKStatistics *)v8 setSumQuantityBySource:v31];

    v32 = [v4 decodeObjectOfClasses:v25 forKey:@"countBySource"];
    [(HKStatistics *)v8 setDataCountBySource:v32];

    uint64_t v33 = [v4 decodeObjectOfClasses:v25 forKey:@"durationBySource"];
    [(HKStatistics *)v8 setDurationBySource:v33];

    v34 = [v4 decodeObjectOfClasses:v25 forKey:@"categoryValueBySourceKey"];
    [(HKStatistics *)v8 setCategoryValueBySource:v34];
  }
  return v8;
}

- (unint64_t)hash
{
  unint64_t v3 = [(HKObjectType *)self->_dataType hash];
  uint64_t v4 = [(NSDate *)self->_startDate hash] ^ v3;
  return v4 ^ [(NSDate *)self->_endDate hash] ^ (2654435761u * self->_dataCount);
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    goto LABEL_60;
  }
  if (![(HKObjectType *)self->_dataType isEqual:v4[1]]) {
    goto LABEL_60;
  }
  if (![(NSDate *)self->_startDate isEqual:v4[2]]) {
    goto LABEL_60;
  }
  if (![(NSDate *)self->_endDate isEqual:v4[3]]) {
    goto LABEL_60;
  }
  if (self->_dataCount != v4[7]) {
    goto LABEL_60;
  }
  averageQuantity = self->_averageQuantity;
  uint64_t v6 = (HKQuantity *)v4[8];
  if (averageQuantity != v6 && (!v6 || !-[HKQuantity isEqual:](averageQuantity, "isEqual:"))) {
    goto LABEL_60;
  }
  minimumQuantity = self->_minimumQuantity;
  id v8 = (HKQuantity *)v4[9];
  if (minimumQuantity != v8 && (!v8 || !-[HKQuantity isEqual:](minimumQuantity, "isEqual:"))) {
    goto LABEL_60;
  }
  maximumQuantity = self->_maximumQuantity;
  uint64_t v10 = (HKQuantity *)v4[10];
  if (maximumQuantity != v10 && (!v10 || !-[HKQuantity isEqual:](maximumQuantity, "isEqual:"))) {
    goto LABEL_60;
  }
  mostRecentQuantity = self->_mostRecentQuantity;
  v12 = (HKQuantity *)v4[11];
  if (mostRecentQuantity != v12 && (!v12 || !-[HKQuantity isEqual:](mostRecentQuantity, "isEqual:"))) {
    goto LABEL_60;
  }
  mostRecentQuantityDateInterval = self->_mostRecentQuantityDateInterval;
  uint64_t v14 = (NSDateInterval *)v4[12];
  if (mostRecentQuantityDateInterval != v14
    && (!v14 || !-[NSDateInterval isEqual:](mostRecentQuantityDateInterval, "isEqual:")))
  {
    goto LABEL_60;
  }
  sumQuantity = self->_sumQuantity;
  uint64_t v16 = (HKQuantity *)v4[23];
  if (sumQuantity != v16 && (!v16 || !-[HKQuantity isEqual:](sumQuantity, "isEqual:"))) {
    goto LABEL_60;
  }
  duration = self->_duration;
  v18 = (HKQuantity *)v4[13];
  if (duration != v18 && (!v18 || !-[HKQuantity isEqual:](duration, "isEqual:"))) {
    goto LABEL_60;
  }
  sources = self->_sources;
  v20 = (NSArray *)v4[4];
  if (sources != v20 && (!v20 || !-[NSArray isEqual:](sources, "isEqual:"))) {
    goto LABEL_60;
  }
  dataCountBySource = self->_dataCountBySource;
  v22 = (NSDictionary *)v4[20];
  if (dataCountBySource != v22 && (!v22 || !-[NSDictionary isEqual:](dataCountBySource, "isEqual:"))) {
    goto LABEL_60;
  }
  averageQuantityBySource = self->_averageQuantityBySource;
  v24 = (NSDictionary *)v4[15];
  if (averageQuantityBySource != v24
    && (!v24 || !-[NSDictionary isEqual:](averageQuantityBySource, "isEqual:")))
  {
    goto LABEL_60;
  }
  minimumQuantityBySource = self->_minimumQuantityBySource;
  v26 = (NSDictionary *)v4[16];
  if (minimumQuantityBySource != v26
    && (!v26 || !-[NSDictionary isEqual:](minimumQuantityBySource, "isEqual:")))
  {
    goto LABEL_60;
  }
  maximumQuantityBySource = self->_maximumQuantityBySource;
  v28 = (NSDictionary *)v4[17];
  if (maximumQuantityBySource != v28
    && (!v28 || !-[NSDictionary isEqual:](maximumQuantityBySource, "isEqual:")))
  {
    goto LABEL_60;
  }
  mostRecentQuantityBySource = self->_mostRecentQuantityBySource;
  v30 = (NSDictionary *)v4[18];
  if (mostRecentQuantityBySource != v30
    && (!v30 || !-[NSDictionary isEqual:](mostRecentQuantityBySource, "isEqual:")))
  {
    goto LABEL_60;
  }
  mostRecentQuantityDateIntervalBySource = self->_mostRecentQuantityDateIntervalBySource;
  v32 = (NSDictionary *)v4[19];
  if (mostRecentQuantityDateIntervalBySource != v32
    && (!v32 || !-[NSDictionary isEqual:](mostRecentQuantityDateIntervalBySource, "isEqual:")))
  {
    goto LABEL_60;
  }
  sumQuantityBySource = self->_sumQuantityBySource;
  v34 = (NSDictionary *)v4[24];
  if (sumQuantityBySource != v34 && (!v34 || !-[NSDictionary isEqual:](sumQuantityBySource, "isEqual:"))) {
    goto LABEL_60;
  }
  durationBySource = self->_durationBySource;
  v36 = (NSDictionary *)v4[21];
  if (durationBySource != v36 && (!v36 || !-[NSDictionary isEqual:](durationBySource, "isEqual:"))) {
    goto LABEL_60;
  }
  categoryValue = self->_categoryValue;
  v38 = (NSNumber *)v4[5];
  if (categoryValue != v38 && (!v38 || !-[NSNumber isEqual:](categoryValue, "isEqual:"))) {
    goto LABEL_60;
  }
  categoryValueBySource = self->_categoryValueBySource;
  uint64_t v40 = (NSDictionary *)v4[6];
  if (categoryValueBySource == v40)
  {
    char v41 = 1;
    goto LABEL_61;
  }
  if (v40) {
    char v41 = -[NSDictionary isEqual:](categoryValueBySource, "isEqual:");
  }
  else {
LABEL_60:
  }
    char v41 = 0;
LABEL_61:

  return v41;
}

- (HKQuantityType)quantityType
{
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    uint64_t v6 = [MEMORY[0x1E4F28B00] currentHandler];
    [v6 handleFailureInMethod:a2 object:self file:@"HKStatistics.m" lineNumber:441 description:@"Data type is not a quantity"];
  }
  dataType = self->_dataType;

  return (HKQuantityType *)dataType;
}

- (NSDate)startDate
{
  return self->_startDate;
}

- (void)_setStartDate:(id)a3
{
}

- (NSDate)endDate
{
  return self->_endDate;
}

- (void)_setEndDate:(id)a3
{
}

- (NSArray)sources
{
  return self->_sources;
}

- (void)_setSources:(id)a3
{
  uint64_t v4 = (NSArray *)[a3 copy];
  sources = self->_sources;
  self->_sources = v4;

  MEMORY[0x1F41817F8](v4, sources);
}

- (BOOL)getData:(id *)a3 error:(id *)a4
{
  double v7 = [MEMORY[0x1E4F28DB0] archivedDataWithRootObject:self requiringSecureCoding:1 error:a4];
  id v8 = v7;
  if (v7)
  {
    *a3 = v7;
  }
  else
  {
    _HKInitializeLogging();
    id v9 = HKLogInfrastructure();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      -[HKStatistics getData:error:]((uint64_t)self, (uint64_t *)a4, v9);
    }
  }
  return v8 != 0;
}

- (int64_t)bucketIndexForIntervalComponents:(id)a3 anchorDate:(id)a4
{
  return objc_msgSend(a3, "hk_indexForDate:anchorDate:", self->_startDate, a4);
}

- (NSString)description
{
  id v3 = [NSString alloc];
  v10.receiver = self;
  v10.super_class = (Class)HKStatistics;
  uint64_t v4 = [(HKStatistics *)&v10 description];
  long long v9 = *(_OWORD *)&self->_dataType;
  endDate = self->_endDate;
  uint64_t v6 = [(NSArray *)self->_sources componentsJoinedByString:@", "];
  double v7 = (void *)[v3 initWithFormat:@"<%@ Statistics on %@ (%@ - %@) over sources (%@)>", v4, v9, endDate, v6];

  return (NSString *)v7;
}

- (NSNumber)categoryValue
{
  return self->_categoryValue;
}

- (void)setCategoryValue:(id)a3
{
}

- (NSDictionary)categoryValueBySource
{
  return self->_categoryValueBySource;
}

- (void)setCategoryValueBySource:(id)a3
{
}

- (unint64_t)dataCount
{
  return self->_dataCount;
}

- (void)setDataCount:(unint64_t)a3
{
  self->_dataCount = a3;
}

- (HKQuantity)averageQuantity
{
  return self->_averageQuantity;
}

- (HKQuantity)minimumQuantity
{
  return self->_minimumQuantity;
}

- (HKQuantity)maximumQuantity
{
  return self->_maximumQuantity;
}

- (HKQuantity)mostRecentQuantity
{
  return self->_mostRecentQuantity;
}

- (NSDateInterval)mostRecentQuantityDateInterval
{
  return self->_mostRecentQuantityDateInterval;
}

- (void)setMostRecentQuantityDateInterval:(id)a3
{
}

- (HKQuantity)duration
{
  return self->_duration;
}

- (void)setDuration:(id)a3
{
}

- (HKQuantity)percentileQuantity
{
  return self->_percentileQuantity;
}

- (void)setPercentileQuantity:(id)a3
{
}

- (NSDictionary)averageQuantityBySource
{
  return self->_averageQuantityBySource;
}

- (void)setAverageQuantityBySource:(id)a3
{
}

- (NSDictionary)minimumQuantityBySource
{
  return self->_minimumQuantityBySource;
}

- (void)setMinimumQuantityBySource:(id)a3
{
}

- (NSDictionary)maximumQuantityBySource
{
  return self->_maximumQuantityBySource;
}

- (void)setMaximumQuantityBySource:(id)a3
{
}

- (NSDictionary)mostRecentQuantityBySource
{
  return self->_mostRecentQuantityBySource;
}

- (void)setMostRecentQuantityBySource:(id)a3
{
}

- (NSDictionary)mostRecentQuantityDateIntervalBySource
{
  return self->_mostRecentQuantityDateIntervalBySource;
}

- (void)setMostRecentQuantityDateIntervalBySource:(id)a3
{
}

- (NSDictionary)dataCountBySource
{
  return self->_dataCountBySource;
}

- (void)setDataCountBySource:(id)a3
{
}

- (NSDictionary)durationBySource
{
  return self->_durationBySource;
}

- (void)setDurationBySource:(id)a3
{
}

- (NSDictionary)percentileQuantityBySource
{
  return self->_percentileQuantityBySource;
}

- (void)setPercentileQuantityBySource:(id)a3
{
}

- (HKQuantity)sumQuantity
{
  return self->_sumQuantity;
}

- (NSDictionary)sumQuantityBySource
{
  return self->_sumQuantityBySource;
}

- (void)setSumQuantityBySource:(id)a3
{
}

- (NSDictionary)sumQuantityBySourceID
{
  return self->_sumQuantityBySourceID;
}

- (void)setSumQuantityBySourceID:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sumQuantityBySourceID, 0);
  objc_storeStrong((id *)&self->_sumQuantityBySource, 0);
  objc_storeStrong((id *)&self->_sumQuantity, 0);
  objc_storeStrong((id *)&self->_percentileQuantityBySource, 0);
  objc_storeStrong((id *)&self->_durationBySource, 0);
  objc_storeStrong((id *)&self->_dataCountBySource, 0);
  objc_storeStrong((id *)&self->_mostRecentQuantityDateIntervalBySource, 0);
  objc_storeStrong((id *)&self->_mostRecentQuantityBySource, 0);
  objc_storeStrong((id *)&self->_maximumQuantityBySource, 0);
  objc_storeStrong((id *)&self->_minimumQuantityBySource, 0);
  objc_storeStrong((id *)&self->_averageQuantityBySource, 0);
  objc_storeStrong((id *)&self->_percentileQuantity, 0);
  objc_storeStrong((id *)&self->_duration, 0);
  objc_storeStrong((id *)&self->_mostRecentQuantityDateInterval, 0);
  objc_storeStrong((id *)&self->_mostRecentQuantity, 0);
  objc_storeStrong((id *)&self->_maximumQuantity, 0);
  objc_storeStrong((id *)&self->_minimumQuantity, 0);
  objc_storeStrong((id *)&self->_averageQuantity, 0);
  objc_storeStrong((id *)&self->_categoryValueBySource, 0);
  objc_storeStrong((id *)&self->_categoryValue, 0);
  objc_storeStrong((id *)&self->_sources, 0);
  objc_storeStrong((id *)&self->_endDate, 0);
  objc_storeStrong((id *)&self->_startDate, 0);

  objc_storeStrong((id *)&self->_dataType, 0);
}

- (id)asJSONObject
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  uint64_t v4 = [(HKStatistics *)self averageQuantity];
  id v5 = [(HKStatistics *)self quantityType];
  uint64_t v6 = [v5 canonicalUnit];
  double v7 = [v4 asJSONObjectForUnit:v6];
  [v3 setObject:v7 forKeyedSubscript:@"averageQuantity"];

  id v8 = [(HKStatistics *)self minimumQuantity];
  long long v9 = [(HKStatistics *)self quantityType];
  objc_super v10 = [v9 canonicalUnit];
  uint64_t v11 = [v8 asJSONObjectForUnit:v10];
  [v3 setObject:v11 forKeyedSubscript:@"minimumQuantity"];

  v12 = [(HKStatistics *)self maximumQuantity];
  uint64_t v13 = [(HKStatistics *)self quantityType];
  uint64_t v14 = [v13 canonicalUnit];
  uint64_t v15 = [v12 asJSONObjectForUnit:v14];
  [v3 setObject:v15 forKeyedSubscript:@"maximumQuantity"];

  uint64_t v16 = [(HKStatistics *)self mostRecentQuantity];
  uint64_t v17 = [(HKStatistics *)self quantityType];
  v18 = [v17 canonicalUnit];
  uint64_t v19 = [v16 asJSONObjectForUnit:v18];
  [v3 setObject:v19 forKeyedSubscript:@"mostRecentQuantity"];

  return v3;
}

- (void)getData:(os_log_t)log error:.cold.1(uint64_t a1, uint64_t *a2, os_log_t log)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = *a2;
  int v4 = 138412546;
  uint64_t v5 = a1;
  __int16 v6 = 2112;
  uint64_t v7 = v3;
  _os_log_error_impl(&dword_19C023000, log, OS_LOG_TYPE_ERROR, "Error getting archived data from statistics %@: %@", (uint8_t *)&v4, 0x16u);
}

@end