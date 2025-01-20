@interface _HKQuantityDistributionQueryServerConfiguration
+ (BOOL)supportsSecureCoding;
- (HKQuantity)histogramAnchor;
- (HKQuantity)histogramBucketSize;
- (NSDate)anchorDate;
- (NSDate)endDate;
- (NSDate)startDate;
- (NSDateComponents)intervalComponents;
- (_HKQuantityDistributionQueryServerConfiguration)initWithCoder:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (int64_t)contextStyle;
- (unint64_t)options;
- (void)encodeWithCoder:(id)a3;
- (void)setAnchorDate:(id)a3;
- (void)setContextStyle:(int64_t)a3;
- (void)setEndDate:(id)a3;
- (void)setHistogramAnchor:(id)a3;
- (void)setHistogramBucketSize:(id)a3;
- (void)setIntervalComponents:(id)a3;
- (void)setOptions:(unint64_t)a3;
- (void)setStartDate:(id)a3;
@end

@implementation _HKQuantityDistributionQueryServerConfiguration

- (id)copyWithZone:(_NSZone *)a3
{
  v6.receiver = self;
  v6.super_class = (Class)_HKQuantityDistributionQueryServerConfiguration;
  id v4 = [(HKQueryServerConfiguration *)&v6 copyWithZone:a3];
  [v4 setStartDate:self->_startDate];
  [v4 setEndDate:self->_endDate];
  [v4 setContextStyle:self->_contextStyle];
  [v4 setAnchorDate:self->_anchorDate];
  [v4 setIntervalComponents:self->_intervalComponents];
  [v4 setHistogramAnchor:self->_histogramAnchor];
  [v4 setHistogramBucketSize:self->_histogramBucketSize];
  [v4 setOptions:self->_options];
  return v4;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (_HKQuantityDistributionQueryServerConfiguration)initWithCoder:(id)a3
{
  id v4 = a3;
  v19.receiver = self;
  v19.super_class = (Class)_HKQuantityDistributionQueryServerConfiguration;
  v5 = [(HKQueryServerConfiguration *)&v19 initWithCoder:v4];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"startConfigDate"];
    startDate = v5->_startDate;
    v5->_startDate = (NSDate *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"endConfigDate"];
    endDate = v5->_endDate;
    v5->_endDate = (NSDate *)v8;

    v5->_contextStyle = [v4 decodeIntegerForKey:@"contextStyleKey"];
    uint64_t v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"anchorDate"];
    anchorDate = v5->_anchorDate;
    v5->_anchorDate = (NSDate *)v10;

    uint64_t v12 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"intervalComponents"];
    intervalComponents = v5->_intervalComponents;
    v5->_intervalComponents = (NSDateComponents *)v12;

    uint64_t v14 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"histogramAnchor"];
    histogramAnchor = v5->_histogramAnchor;
    v5->_histogramAnchor = (HKQuantity *)v14;

    uint64_t v16 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"histogramBucketSize"];
    histogramBucketSize = v5->_histogramBucketSize;
    v5->_histogramBucketSize = (HKQuantity *)v16;

    v5->_options = [v4 decodeIntegerForKey:@"optionsKey"];
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)_HKQuantityDistributionQueryServerConfiguration;
  id v4 = a3;
  [(HKQueryServerConfiguration *)&v5 encodeWithCoder:v4];
  objc_msgSend(v4, "encodeObject:forKey:", self->_startDate, @"startConfigDate", v5.receiver, v5.super_class);
  [v4 encodeObject:self->_endDate forKey:@"endConfigDate"];
  [v4 encodeInteger:self->_contextStyle forKey:@"contextStyleKey"];
  [v4 encodeObject:self->_anchorDate forKey:@"anchorDate"];
  [v4 encodeObject:self->_intervalComponents forKey:@"intervalComponents"];
  [v4 encodeObject:self->_histogramAnchor forKey:@"histogramAnchor"];
  [v4 encodeObject:self->_histogramBucketSize forKey:@"histogramBucketSize"];
  [v4 encodeInteger:self->_options forKey:@"optionsKey"];
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

- (int64_t)contextStyle
{
  return self->_contextStyle;
}

- (void)setContextStyle:(int64_t)a3
{
  self->_contextStyle = a3;
}

- (NSDate)anchorDate
{
  return self->_anchorDate;
}

- (void)setAnchorDate:(id)a3
{
}

- (NSDateComponents)intervalComponents
{
  return self->_intervalComponents;
}

- (void)setIntervalComponents:(id)a3
{
}

- (HKQuantity)histogramAnchor
{
  return self->_histogramAnchor;
}

- (void)setHistogramAnchor:(id)a3
{
}

- (HKQuantity)histogramBucketSize
{
  return self->_histogramBucketSize;
}

- (void)setHistogramBucketSize:(id)a3
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

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_histogramBucketSize, 0);
  objc_storeStrong((id *)&self->_histogramAnchor, 0);
  objc_storeStrong((id *)&self->_intervalComponents, 0);
  objc_storeStrong((id *)&self->_anchorDate, 0);
  objc_storeStrong((id *)&self->_endDate, 0);

  objc_storeStrong((id *)&self->_startDate, 0);
}

@end