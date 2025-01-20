@interface _HKQuantitySeriesSampleQueryServerConfiguration
+ (BOOL)supportsSecureCoding;
- (HKQuantitySample)quantitySample;
- (NSDate)latestSampleStartDate;
- (NSDate)maximumStartDate;
- (NSUUID)latestUUID;
- (_HKQuantitySeriesSampleQueryServerConfiguration)initWithCoder:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (int64_t)mode;
- (int64_t)seriesAnchor;
- (unint64_t)options;
- (void)encodeWithCoder:(id)a3;
- (void)setLatestSampleStartDate:(id)a3;
- (void)setLatestUUID:(id)a3;
- (void)setMaximumStartDate:(id)a3;
- (void)setMode:(int64_t)a3;
- (void)setOptions:(unint64_t)a3;
- (void)setQuantitySample:(id)a3;
- (void)setSeriesAnchor:(int64_t)a3;
@end

@implementation _HKQuantitySeriesSampleQueryServerConfiguration

- (id)copyWithZone:(_NSZone *)a3
{
  v10.receiver = self;
  v10.super_class = (Class)_HKQuantitySeriesSampleQueryServerConfiguration;
  id v4 = [(HKQueryServerConfiguration *)&v10 copyWithZone:a3];
  v5 = (void *)[(HKQuantitySample *)self->_quantitySample copy];
  [v4 setQuantitySample:v5];

  [v4 setSeriesAnchor:self->_seriesAnchor];
  [v4 setMode:self->_mode];
  [v4 setOptions:self->_options];
  v6 = (void *)[(NSDate *)self->_maximumStartDate copy];
  [v4 setMaximumStartDate:v6];

  v7 = (void *)[(NSUUID *)self->_latestUUID copy];
  [v4 setLatestUUID:v7];

  v8 = (void *)[(NSDate *)self->_latestSampleStartDate copy];
  [v4 setLatestSampleStartDate:v8];

  return v4;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (_HKQuantitySeriesSampleQueryServerConfiguration)initWithCoder:(id)a3
{
  id v4 = a3;
  v17.receiver = self;
  v17.super_class = (Class)_HKQuantitySeriesSampleQueryServerConfiguration;
  v5 = [(HKQueryServerConfiguration *)&v17 initWithCoder:v4];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"sample"];
    quantitySample = v5->_quantitySample;
    v5->_quantitySample = (HKQuantitySample *)v6;

    v5->_seriesAnchor = [v4 decodeIntegerForKey:@"anchor"];
    if ([v4 containsValueForKey:@"mode"]) {
      uint64_t v8 = [v4 decodeIntegerForKey:@"mode"];
    }
    else {
      uint64_t v8 = 0;
    }
    v5->_mode = v8;
    if ([v4 containsValueForKey:@"options"]) {
      uint64_t v9 = [v4 decodeIntegerForKey:@"options"];
    }
    else {
      uint64_t v9 = 0;
    }
    v5->_options = v9;
    int v10 = [v4 containsValueForKey:@"maxStart"];
    if (v10)
    {
      v11 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"maxStart"];
    }
    else
    {
      v11 = 0;
    }
    objc_storeStrong((id *)&v5->_maximumStartDate, v11);
    if (v10) {

    }
    int v12 = [v4 containsValueForKey:@"latestUUID"];
    if (v12)
    {
      v13 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"latestUUID"];
    }
    else
    {
      v13 = 0;
    }
    objc_storeStrong((id *)&v5->_latestUUID, v13);
    if (v12) {

    }
    int v14 = [v4 containsValueForKey:@"latestStart"];
    if (v14)
    {
      v15 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"latestStart"];
    }
    else
    {
      v15 = 0;
    }
    objc_storeStrong((id *)&v5->_latestSampleStartDate, v15);
    if (v14) {
  }
    }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)_HKQuantitySeriesSampleQueryServerConfiguration;
  [(HKQueryServerConfiguration *)&v8 encodeWithCoder:v4];
  [v4 encodeObject:self->_quantitySample forKey:@"sample"];
  [v4 encodeInteger:self->_seriesAnchor forKey:@"anchor"];
  [v4 encodeInteger:self->_mode forKey:@"mode"];
  [v4 encodeInteger:self->_options forKey:@"options"];
  maximumStartDate = self->_maximumStartDate;
  if (maximumStartDate) {
    [v4 encodeObject:maximumStartDate forKey:@"maxStart"];
  }
  latestUUID = self->_latestUUID;
  if (latestUUID) {
    [v4 encodeObject:latestUUID forKey:@"latestUUID"];
  }
  latestSampleStartDate = self->_latestSampleStartDate;
  if (latestSampleStartDate) {
    [v4 encodeObject:latestSampleStartDate forKey:@"latestStart"];
  }
}

- (HKQuantitySample)quantitySample
{
  return self->_quantitySample;
}

- (void)setQuantitySample:(id)a3
{
}

- (int64_t)seriesAnchor
{
  return self->_seriesAnchor;
}

- (void)setSeriesAnchor:(int64_t)a3
{
  self->_seriesAnchor = a3;
}

- (int64_t)mode
{
  return self->_mode;
}

- (void)setMode:(int64_t)a3
{
  self->_mode = a3;
}

- (unint64_t)options
{
  return self->_options;
}

- (void)setOptions:(unint64_t)a3
{
  self->_options = a3;
}

- (NSDate)maximumStartDate
{
  return self->_maximumStartDate;
}

- (void)setMaximumStartDate:(id)a3
{
}

- (NSUUID)latestUUID
{
  return self->_latestUUID;
}

- (void)setLatestUUID:(id)a3
{
}

- (NSDate)latestSampleStartDate
{
  return self->_latestSampleStartDate;
}

- (void)setLatestSampleStartDate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_latestSampleStartDate, 0);
  objc_storeStrong((id *)&self->_latestUUID, 0);
  objc_storeStrong((id *)&self->_maximumStartDate, 0);

  objc_storeStrong((id *)&self->_quantitySample, 0);
}

@end