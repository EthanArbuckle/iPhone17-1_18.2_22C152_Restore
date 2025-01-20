@interface MXHistogramBucket
+ (BOOL)supportsSecureCoding;
- (MXHistogramBucket)initWithBucketStart:(id)a3 bucketEnd:(id)a4 bucketCount:(unint64_t)a5;
- (MXHistogramBucket)initWithCoder:(id)a3;
- (NSMeasurement)bucketEnd;
- (NSMeasurement)bucketStart;
- (NSUInteger)bucketCount;
- (id)toDictionary;
- (void)encodeWithCoder:(id)a3;
@end

@implementation MXHistogramBucket

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (MXHistogramBucket)initWithBucketStart:(id)a3 bucketEnd:(id)a4 bucketCount:(unint64_t)a5
{
  id v8 = a3;
  id v9 = a4;
  v21.receiver = self;
  v21.super_class = (Class)MXHistogramBucket;
  v10 = [(MXHistogramBucket *)&v21 init];
  if (!v10) {
    goto LABEL_6;
  }
  v11 = 0;
  if (v8 && v9 && a5)
  {
    uint64_t v12 = [v8 copy];
    bucketStart = v10->_bucketStart;
    v10->_bucketStart = (NSMeasurement *)v12;

    uint64_t v14 = [v9 copy];
    bucketEnd = v10->_bucketEnd;
    v10->_bucketEnd = (NSMeasurement *)v14;

    v10->_bucketCount = a5;
    v16 = (NSMeasurementFormatter *)objc_alloc_init(MEMORY[0x263F08988]);
    histogramBucketFormatter = v10->_histogramBucketFormatter;
    v10->_histogramBucketFormatter = v16;

    [(NSMeasurementFormatter *)v10->_histogramBucketFormatter setUnitOptions:1];
    v18 = (void *)[objc_alloc(MEMORY[0x263EFF960]) initWithLocaleIdentifier:@"en_US_POSIX"];
    [(NSMeasurementFormatter *)v10->_histogramBucketFormatter setLocale:v18];

    [(NSMeasurementFormatter *)v10->_histogramBucketFormatter setUnitStyle:2];
    v19 = [(NSMeasurementFormatter *)v10->_histogramBucketFormatter numberFormatter];
    [v19 setMaximumFractionDigits:0];

LABEL_6:
    v11 = v10;
  }

  return v11;
}

- (void)encodeWithCoder:(id)a3
{
  bucketStart = self->_bucketStart;
  id v5 = a3;
  [v5 encodeObject:bucketStart forKey:@"bucketStart"];
  [v5 encodeObject:self->_bucketEnd forKey:@"bucketEnd"];
  id v6 = [NSNumber numberWithUnsignedInteger:self->_bucketCount];
  [v5 encodeObject:v6 forKey:@"bucketCount"];
}

- (MXHistogramBucket)initWithCoder:(id)a3
{
  id v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)MXHistogramBucket;
  id v5 = [(MXHistogramBucket *)&v12 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"bucketStart"];
    bucketStart = v5->_bucketStart;
    v5->_bucketStart = (NSMeasurement *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"bucketEnd"];
    bucketEnd = v5->_bucketEnd;
    v5->_bucketEnd = (NSMeasurement *)v8;

    v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"bucketCount"];
    v5->_bucketCount = [v10 unsignedIntegerValue];

    id v5 = [(MXHistogramBucket *)v5 initWithBucketStart:v5->_bucketStart bucketEnd:v5->_bucketEnd bucketCount:v5->_bucketCount];
  }

  return v5;
}

- (id)toDictionary
{
  v9[3] = *MEMORY[0x263EF8340];
  if (self->_bucketStart && self->_bucketEnd && self->_bucketCount)
  {
    v8[0] = @"bucketStart";
    v3 = -[NSMeasurementFormatter stringFromMeasurement:](self->_histogramBucketFormatter, "stringFromMeasurement:");
    v9[0] = v3;
    v8[1] = @"bucketEnd";
    id v4 = [(NSMeasurementFormatter *)self->_histogramBucketFormatter stringFromMeasurement:self->_bucketEnd];
    v9[1] = v4;
    v8[2] = @"bucketCount";
    id v5 = [NSNumber numberWithUnsignedInteger:self->_bucketCount];
    v9[2] = v5;
    uint64_t v6 = [NSDictionary dictionaryWithObjects:v9 forKeys:v8 count:3];
  }
  else
  {
    uint64_t v6 = (void *)MEMORY[0x263EFFA78];
  }

  return v6;
}

- (NSMeasurement)bucketStart
{
  return (NSMeasurement *)objc_getProperty(self, a2, 16, 1);
}

- (NSMeasurement)bucketEnd
{
  return (NSMeasurement *)objc_getProperty(self, a2, 24, 1);
}

- (NSUInteger)bucketCount
{
  return self->_bucketCount;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_bucketEnd, 0);
  objc_storeStrong((id *)&self->_bucketStart, 0);

  objc_storeStrong((id *)&self->_histogramBucketFormatter, 0);
}

@end