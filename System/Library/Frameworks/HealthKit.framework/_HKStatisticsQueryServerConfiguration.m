@interface _HKStatisticsQueryServerConfiguration
+ (BOOL)supportsSecureCoding;
- (NSDateInterval)dateInterval;
- (_HKStatisticsQueryServerConfiguration)initWithCoder:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (unint64_t)mergeStrategy;
- (unint64_t)options;
- (void)encodeWithCoder:(id)a3;
- (void)setDateInterval:(id)a3;
- (void)setMergeStrategy:(unint64_t)a3;
- (void)setOptions:(unint64_t)a3;
@end

@implementation _HKStatisticsQueryServerConfiguration

- (id)copyWithZone:(_NSZone *)a3
{
  v6.receiver = self;
  v6.super_class = (Class)_HKStatisticsQueryServerConfiguration;
  id v4 = [(HKQueryServerConfiguration *)&v6 copyWithZone:a3];
  [v4 setOptions:self->_options];
  [v4 setMergeStrategy:self->_mergeStrategy];
  [v4 setDateInterval:self->_dateInterval];
  return v4;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (_HKStatisticsQueryServerConfiguration)initWithCoder:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)_HKStatisticsQueryServerConfiguration;
  v5 = [(HKQueryServerConfiguration *)&v9 initWithCoder:v4];
  if (v5)
  {
    v5->_options = [v4 decodeIntegerForKey:@"options"];
    v5->_mergeStrategy = [v4 decodeIntegerForKey:@"mergeStrategy"];
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"dateInterval"];
    dateInterval = v5->_dateInterval;
    v5->_dateInterval = (NSDateInterval *)v6;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)_HKStatisticsQueryServerConfiguration;
  id v4 = a3;
  [(HKQueryServerConfiguration *)&v5 encodeWithCoder:v4];
  objc_msgSend(v4, "encodeInteger:forKey:", self->_options, @"options", v5.receiver, v5.super_class);
  [v4 encodeInteger:self->_mergeStrategy forKey:@"mergeStrategy"];
  [v4 encodeObject:self->_dateInterval forKey:@"dateInterval"];
}

- (unint64_t)options
{
  return self->_options;
}

- (void)setOptions:(unint64_t)a3
{
  self->_options = a3;
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

- (void).cxx_destruct
{
}

@end