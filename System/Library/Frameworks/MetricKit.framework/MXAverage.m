@interface MXAverage
+ (BOOL)supportsSecureCoding;
- (MXAverage)initWithCoder:(id)a3;
- (MXAverage)initWithDoubleValue:(double)a3 sampleCount:(int64_t)a4 standardDeviation:(double)a5 unit:(id)a6;
- (MXAverage)initWithMeasurement:(id)a3 sampleCount:(int64_t)a4 standardDeviation:(double)a5;
- (NSInteger)sampleCount;
- (NSMeasurement)averageMeasurement;
- (double)standardDeviation;
- (id)toDictionary;
- (void)encodeWithCoder:(id)a3;
@end

@implementation MXAverage

- (MXAverage)initWithDoubleValue:(double)a3 sampleCount:(int64_t)a4 standardDeviation:(double)a5 unit:(id)a6
{
  id v10 = a6;
  v19.receiver = self;
  v19.super_class = (Class)MXAverage;
  v11 = [(MXAverage *)&v19 init];
  if (v11)
  {
    uint64_t v12 = [objc_alloc(MEMORY[0x263F08980]) initWithDoubleValue:v10 unit:a3];
    averageMeasurement = v11->_averageMeasurement;
    v11->_averageMeasurement = (NSMeasurement *)v12;

    v11->_sampleCount = a4;
    v11->_standardDeviation = a5;
    v14 = (NSMeasurementFormatter *)objc_alloc_init(MEMORY[0x263F08988]);
    averageMeasurementFormatter = v11->_averageMeasurementFormatter;
    v11->_averageMeasurementFormatter = v14;

    [(NSMeasurementFormatter *)v11->_averageMeasurementFormatter setUnitOptions:1];
    v16 = (void *)[objc_alloc(MEMORY[0x263EFF960]) initWithLocaleIdentifier:@"en_US_POSIX"];
    [(NSMeasurementFormatter *)v11->_averageMeasurementFormatter setLocale:v16];

    [(NSMeasurementFormatter *)v11->_averageMeasurementFormatter setUnitStyle:2];
    v17 = [(NSMeasurementFormatter *)v11->_averageMeasurementFormatter numberFormatter];
    [v17 setMaximumFractionDigits:0];
  }
  return v11;
}

- (MXAverage)initWithMeasurement:(id)a3 sampleCount:(int64_t)a4 standardDeviation:(double)a5
{
  id v9 = a3;
  v17.receiver = self;
  v17.super_class = (Class)MXAverage;
  id v10 = [(MXAverage *)&v17 init];
  v11 = v10;
  if (v10)
  {
    objc_storeStrong((id *)&v10->_averageMeasurement, a3);
    v11->_sampleCount = a4;
    v11->_standardDeviation = a5;
    uint64_t v12 = (NSMeasurementFormatter *)objc_alloc_init(MEMORY[0x263F08988]);
    averageMeasurementFormatter = v11->_averageMeasurementFormatter;
    v11->_averageMeasurementFormatter = v12;

    [(NSMeasurementFormatter *)v11->_averageMeasurementFormatter setUnitOptions:1];
    v14 = (void *)[objc_alloc(MEMORY[0x263EFF960]) initWithLocaleIdentifier:@"en_US_POSIX"];
    [(NSMeasurementFormatter *)v11->_averageMeasurementFormatter setLocale:v14];

    [(NSMeasurementFormatter *)v11->_averageMeasurementFormatter setUnitStyle:2];
    v15 = [(NSMeasurementFormatter *)v11->_averageMeasurementFormatter numberFormatter];
    [v15 setMaximumFractionDigits:0];
  }
  return v11;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  if (([v4 allowsKeyedCoding] & 1) == 0) {
    [MEMORY[0x263EFF940] raise:*MEMORY[0x263EFF4A0] format:@"NSMeasurement cannot be encoded by non-keyed archivers"];
  }
  [v4 encodeObject:self->_averageMeasurement forKey:@"averageValue"];
  [v4 encodeInteger:self->_sampleCount forKey:@"sampleCount"];
  [v4 encodeDouble:@"standardDeviation" forKey:self->_standardDeviation];
}

- (MXAverage)initWithCoder:(id)a3
{
  v19[1] = *MEMORY[0x263EF8340];
  id v4 = a3;
  if ([v4 allowsKeyedCoding])
  {
    v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"averageValue"];
    uint64_t v6 = [v4 decodeIntegerForKey:@"sampleCount"];
    [v4 decodeDoubleForKey:@"standardDeviation"];
    if (v5)
    {
      double v8 = v7;
      [v5 doubleValue];
      double v10 = v9;
      v11 = [v5 unit];
      self = [(MXAverage *)self initWithDoubleValue:v6 sampleCount:v11 standardDeviation:v10 unit:v8];

      uint64_t v12 = self;
    }
    else
    {
      v13 = (void *)MEMORY[0x263F087E8];
      uint64_t v14 = *MEMORY[0x263F07F70];
      uint64_t v18 = *MEMORY[0x263F08320];
      v19[0] = @"Measurement class object has been corrupted!";
      v15 = [NSDictionary dictionaryWithObjects:v19 forKeys:&v18 count:1];
      v16 = [v13 errorWithDomain:v14 code:4864 userInfo:v15];
      [v4 failWithError:v16];

      uint64_t v12 = 0;
    }
  }
  else
  {
    [MEMORY[0x263EFF940] raise:*MEMORY[0x263EFF4A0] format:@"NSMeasurement cannot be decoded by non-keyed archivers"];
    uint64_t v12 = 0;
  }

  return v12;
}

- (id)toDictionary
{
  id v3 = objc_alloc_init(MEMORY[0x263EFF9A0]);
  if (self->_averageMeasurement)
  {
    id v4 = -[NSMeasurementFormatter stringFromMeasurement:](self->_averageMeasurementFormatter, "stringFromMeasurement:");
    [v3 setObject:v4 forKey:@"averageValue"];
  }
  v5 = [NSNumber numberWithInteger:self->_sampleCount];
  [v3 setObject:v5 forKey:@"sampleCount"];

  uint64_t v6 = [MEMORY[0x263F087B0] numberWithDouble:self->_standardDeviation];
  [v3 setObject:v6 forKey:@"standardDeviation"];

  return v3;
}

- (NSMeasurement)averageMeasurement
{
  return (NSMeasurement *)objc_getProperty(self, a2, 16, 1);
}

- (NSInteger)sampleCount
{
  return self->_sampleCount;
}

- (double)standardDeviation
{
  return self->_standardDeviation;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_averageMeasurement, 0);

  objc_storeStrong((id *)&self->_averageMeasurementFormatter, 0);
}

@end