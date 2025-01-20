@interface _HKStatisticsCollectionQueryServerConfiguration
+ (BOOL)supportsSecureCoding;
- (HKStatisticsCollectionCacheSettings)cacheSettings;
- (NSDate)anchorDate;
- (NSDateComponents)intervalComponents;
- (NSDateInterval)dateInterval;
- (_HKStatisticsCollectionQueryServerConfiguration)initWithCoder:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (unint64_t)mergeStrategy;
- (unint64_t)options;
- (void)encodeWithCoder:(id)a3;
- (void)setAnchorDate:(id)a3;
- (void)setCacheSettings:(id)a3;
- (void)setDateInterval:(id)a3;
- (void)setIntervalComponents:(id)a3;
- (void)setMergeStrategy:(unint64_t)a3;
- (void)setOptions:(unint64_t)a3;
@end

@implementation _HKStatisticsCollectionQueryServerConfiguration

- (id)copyWithZone:(_NSZone *)a3
{
  v6.receiver = self;
  v6.super_class = (Class)_HKStatisticsCollectionQueryServerConfiguration;
  id v4 = [(HKQueryServerConfiguration *)&v6 copyWithZone:a3];
  [v4 setAnchorDate:self->_anchorDate];
  [v4 setOptions:self->_options];
  [v4 setIntervalComponents:self->_intervalComponents];
  [v4 setMergeStrategy:self->_mergeStrategy];
  [v4 setDateInterval:self->_dateInterval];
  [v4 setCacheSettings:self->_cacheSettings];
  return v4;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (_HKStatisticsCollectionQueryServerConfiguration)initWithCoder:(id)a3
{
  id v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)_HKStatisticsCollectionQueryServerConfiguration;
  v5 = [(HKQueryServerConfiguration *)&v15 initWithCoder:v4];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"anchor"];
    anchorDate = v5->_anchorDate;
    v5->_anchorDate = (NSDate *)v6;

    v5->_options = [v4 decodeIntegerForKey:@"options"];
    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"interval"];
    intervalComponents = v5->_intervalComponents;
    v5->_intervalComponents = (NSDateComponents *)v8;

    v5->_mergeStrategy = [v4 decodeIntegerForKey:@"mergeStrategy"];
    uint64_t v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"dateInterval"];
    dateInterval = v5->_dateInterval;
    v5->_dateInterval = (NSDateInterval *)v10;

    uint64_t v12 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"cacheSettings"];
    cacheSettings = v5->_cacheSettings;
    v5->_cacheSettings = (HKStatisticsCollectionCacheSettings *)v12;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)_HKStatisticsCollectionQueryServerConfiguration;
  id v4 = a3;
  [(HKQueryServerConfiguration *)&v5 encodeWithCoder:v4];
  objc_msgSend(v4, "encodeObject:forKey:", self->_anchorDate, @"anchor", v5.receiver, v5.super_class);
  [v4 encodeInteger:self->_options forKey:@"options"];
  [v4 encodeObject:self->_intervalComponents forKey:@"interval"];
  [v4 encodeInteger:self->_mergeStrategy forKey:@"mergeStrategy"];
  [v4 encodeObject:self->_cacheSettings forKey:@"cacheSettings"];
  [v4 encodeObject:self->_dateInterval forKey:@"dateInterval"];
}

- (NSDate)anchorDate
{
  return self->_anchorDate;
}

- (void)setAnchorDate:(id)a3
{
}

- (unint64_t)options
{
  return self->_options;
}

- (void)setOptions:(unint64_t)a3
{
  self->_options = a3;
}

- (NSDateComponents)intervalComponents
{
  return self->_intervalComponents;
}

- (void)setIntervalComponents:(id)a3
{
}

- (unint64_t)mergeStrategy
{
  return self->_mergeStrategy;
}

- (void)setMergeStrategy:(unint64_t)a3
{
  self->_mergeStrategy = a3;
}

- (NSDateInterval)dateInterval
{
  return self->_dateInterval;
}

- (void)setDateInterval:(id)a3
{
}

- (HKStatisticsCollectionCacheSettings)cacheSettings
{
  return self->_cacheSettings;
}

- (void)setCacheSettings:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cacheSettings, 0);
  objc_storeStrong((id *)&self->_dateInterval, 0);
  objc_storeStrong((id *)&self->_intervalComponents, 0);

  objc_storeStrong((id *)&self->_anchorDate, 0);
}

@end