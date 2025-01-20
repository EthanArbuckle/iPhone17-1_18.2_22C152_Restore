@interface MXSignpostIntervalData
+ (BOOL)supportsSecureCoding;
- (MXAverage)averageMemory;
- (MXHistogram)histogrammedSignpostDuration;
- (MXSignpostIntervalData)initWithCoder:(id)a3;
- (MXSignpostIntervalData)initWithHistogramDurationData:(id)a3 withCumulativeCPUTime:(id)a4 withAverageMemory:(id)a5 withCumulativeLogicalWrites:(id)a6;
- (MXSignpostIntervalData)initWithHistogramDurationData:(id)a3 withCumulativeCPUTime:(id)a4 withAverageMemory:(id)a5 withCumulativeLogicalWrites:(id)a6 withCumulativeHitchTimeRatio:(id)a7;
- (MXSignpostIntervalData)initWithHistogramDurationData:(id)a3 withCumulativeCPUTime:(id)a4 withPeakMemory:(id)a5 withAverageMemory:(id)a6 withCumulativeLogicalWrites:(id)a7;
- (NSMeasurement)cumulativeCPUTime;
- (NSMeasurement)cumulativeHitchTimeRatio;
- (NSMeasurement)cumulativeLogicalWrites;
- (NSMeasurementFormatter)measurementFormatter;
- (id)toDictionary;
- (void)encodeWithCoder:(id)a3;
- (void)setMeasurementFormatter:(id)a3;
@end

@implementation MXSignpostIntervalData

- (MXSignpostIntervalData)initWithHistogramDurationData:(id)a3 withCumulativeCPUTime:(id)a4 withAverageMemory:(id)a5 withCumulativeLogicalWrites:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  v23.receiver = self;
  v23.super_class = (Class)MXSignpostIntervalData;
  v14 = [(MXSignpostIntervalData *)&v23 init];
  if (v14)
  {
    if (!v10)
    {
      v21 = 0;
      goto LABEL_6;
    }
    v15 = [[MXHistogram alloc] initWithHistogramBucketData:v10];
    histogrammedSignpostDuration = v14->_histogrammedSignpostDuration;
    v14->_histogrammedSignpostDuration = v15;

    objc_storeStrong((id *)&v14->_cumulativeCPUTime, a4);
    objc_storeStrong((id *)&v14->_averageMemory, a5);
    objc_storeStrong((id *)&v14->_cumulativeLogicalWrites, a6);
    v17 = (NSMeasurementFormatter *)objc_alloc_init(MEMORY[0x263F08988]);
    measurementFormatter = v14->_measurementFormatter;
    v14->_measurementFormatter = v17;

    v19 = (void *)[objc_alloc(MEMORY[0x263EFF960]) initWithLocaleIdentifier:@"en_US_POSIX"];
    [(NSMeasurementFormatter *)v14->_measurementFormatter setLocale:v19];

    [(NSMeasurementFormatter *)v14->_measurementFormatter setUnitOptions:1];
    [(NSMeasurementFormatter *)v14->_measurementFormatter setUnitStyle:2];
    v20 = [(NSMeasurementFormatter *)v14->_measurementFormatter numberFormatter];
    [v20 setMaximumFractionDigits:0];
  }
  v21 = v14;
LABEL_6:

  return v21;
}

- (MXSignpostIntervalData)initWithHistogramDurationData:(id)a3 withCumulativeCPUTime:(id)a4 withAverageMemory:(id)a5 withCumulativeLogicalWrites:(id)a6 withCumulativeHitchTimeRatio:(id)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  id v16 = a7;
  v21.receiver = self;
  v21.super_class = (Class)MXSignpostIntervalData;
  v17 = [(MXSignpostIntervalData *)&v21 init];
  v18 = v17;
  if (v17)
  {
    if (!v12)
    {
      v19 = 0;
      goto LABEL_6;
    }
    objc_storeStrong((id *)&v17->_cumulativeHitchTimeRatio, a7);
  }
  v18 = [(MXSignpostIntervalData *)v18 initWithHistogramDurationData:v12 withCumulativeCPUTime:v13 withAverageMemory:v14 withCumulativeLogicalWrites:v15];
  v19 = v18;
LABEL_6:

  return v19;
}

- (MXSignpostIntervalData)initWithHistogramDurationData:(id)a3 withCumulativeCPUTime:(id)a4 withPeakMemory:(id)a5 withAverageMemory:(id)a6 withCumulativeLogicalWrites:(id)a7
{
  return [(MXSignpostIntervalData *)self initWithHistogramDurationData:a3 withCumulativeCPUTime:a4 withAverageMemory:a6 withCumulativeLogicalWrites:a7];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  histogrammedSignpostDuration = self->_histogrammedSignpostDuration;
  id v5 = a3;
  [v5 encodeObject:histogrammedSignpostDuration forKey:@"histogrammedSignpostDurations"];
  [v5 encodeObject:self->_cumulativeCPUTime forKey:@"signpostCumulativeCPUTime"];
  [v5 encodeObject:self->_averageMemory forKey:@"signpostAverageMemory"];
  [v5 encodeObject:self->_cumulativeLogicalWrites forKey:@"signpostCumulativeLogicalWrites"];
  [v5 encodeObject:self->_cumulativeHitchTimeRatio forKey:@"signpostCumulativeHitchTimeRatio"];
}

- (MXSignpostIntervalData)initWithCoder:(id)a3
{
  id v4 = a3;
  v21.receiver = self;
  v21.super_class = (Class)MXSignpostIntervalData;
  id v5 = [(MXSignpostIntervalData *)&v21 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"signpostCumulativeCPUTime"];
    cumulativeCPUTime = v5->_cumulativeCPUTime;
    v5->_cumulativeCPUTime = (NSMeasurement *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"signpostAverageMemory"];
    averageMemory = v5->_averageMemory;
    v5->_averageMemory = (MXAverage *)v8;

    uint64_t v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"signpostCumulativeLogicalWrites"];
    cumulativeLogicalWrites = v5->_cumulativeLogicalWrites;
    v5->_cumulativeLogicalWrites = (NSMeasurement *)v10;

    uint64_t v12 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"histogrammedSignpostDurations"];
    histogrammedSignpostDuration = v5->_histogrammedSignpostDuration;
    v5->_histogrammedSignpostDuration = (MXHistogram *)v12;

    uint64_t v14 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"signpostCumulativeHitchTimeRatio"];
    cumulativeHitchTimeRatio = v5->_cumulativeHitchTimeRatio;
    v5->_cumulativeHitchTimeRatio = (NSMeasurement *)v14;

    id v16 = (NSMeasurementFormatter *)objc_alloc_init(MEMORY[0x263F08988]);
    measurementFormatter = v5->_measurementFormatter;
    v5->_measurementFormatter = v16;

    v18 = (void *)[objc_alloc(MEMORY[0x263EFF960]) initWithLocaleIdentifier:@"en_US_POSIX"];
    [(NSMeasurementFormatter *)v5->_measurementFormatter setLocale:v18];

    [(NSMeasurementFormatter *)v5->_measurementFormatter setUnitOptions:1];
    [(NSMeasurementFormatter *)v5->_measurementFormatter setUnitStyle:2];
    v19 = [(NSMeasurementFormatter *)v5->_measurementFormatter numberFormatter];
    [v19 setMaximumFractionDigits:0];
  }
  return v5;
}

- (id)toDictionary
{
  id v3 = objc_alloc_init(MEMORY[0x263EFF9A0]);
  histogrammedSignpostDuration = self->_histogrammedSignpostDuration;
  if (histogrammedSignpostDuration)
  {
    id v5 = [(MXHistogram *)histogrammedSignpostDuration toDictionary];
    [v3 setObject:v5 forKey:@"histogrammedSignpostDurations"];
  }
  if (self->_cumulativeCPUTime)
  {
    uint64_t v6 = [(MXSignpostIntervalData *)self measurementFormatter];
    v7 = [v6 stringFromMeasurement:self->_cumulativeCPUTime];
    [v3 setObject:v7 forKey:@"signpostCumulativeCPUTime"];
  }
  if (self->_averageMemory)
  {
    uint64_t v8 = [(MXSignpostIntervalData *)self measurementFormatter];
    v9 = [(MXAverage *)self->_averageMemory averageMeasurement];
    uint64_t v10 = [v8 stringFromMeasurement:v9];
    [v3 setObject:v10 forKey:@"signpostAverageMemory"];
  }
  if (self->_cumulativeLogicalWrites)
  {
    id v11 = [(MXSignpostIntervalData *)self measurementFormatter];
    uint64_t v12 = [v11 stringFromMeasurement:self->_cumulativeLogicalWrites];
    [v3 setObject:v12 forKey:@"signpostCumulativeLogicalWrites"];
  }
  if (self->_cumulativeHitchTimeRatio)
  {
    id v13 = [(MXSignpostIntervalData *)self measurementFormatter];
    uint64_t v14 = [v13 stringFromMeasurement:self->_cumulativeHitchTimeRatio];
    [v3 setObject:v14 forKey:@"signpostCumulativeHitchTimeRatio"];
  }

  return v3;
}

- (MXHistogram)histogrammedSignpostDuration
{
  return (MXHistogram *)objc_getProperty(self, a2, 8, 1);
}

- (NSMeasurement)cumulativeCPUTime
{
  return (NSMeasurement *)objc_getProperty(self, a2, 16, 1);
}

- (MXAverage)averageMemory
{
  return (MXAverage *)objc_getProperty(self, a2, 24, 1);
}

- (NSMeasurement)cumulativeLogicalWrites
{
  return (NSMeasurement *)objc_getProperty(self, a2, 32, 1);
}

- (NSMeasurement)cumulativeHitchTimeRatio
{
  return (NSMeasurement *)objc_getProperty(self, a2, 40, 1);
}

- (NSMeasurementFormatter)measurementFormatter
{
  return (NSMeasurementFormatter *)objc_getProperty(self, a2, 48, 1);
}

- (void)setMeasurementFormatter:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_measurementFormatter, 0);
  objc_storeStrong((id *)&self->_cumulativeHitchTimeRatio, 0);
  objc_storeStrong((id *)&self->_cumulativeLogicalWrites, 0);
  objc_storeStrong((id *)&self->_averageMemory, 0);
  objc_storeStrong((id *)&self->_cumulativeCPUTime, 0);

  objc_storeStrong((id *)&self->_histogrammedSignpostDuration, 0);
}

@end