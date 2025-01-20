@interface MXMemoryMetric
+ (BOOL)supportsSecureCoding;
- (MXAverage)averageSuspendedMemory;
- (MXMemoryMetric)initWithCoder:(id)a3;
- (MXMemoryMetric)initWithPeakMemoryUsageMeasurement:(id)a3 averageMemoryUsageMeasurement:(id)a4;
- (NSMeasurement)peakMemoryUsage;
- (id)toDictionary;
- (void)encodeWithCoder:(id)a3;
@end

@implementation MXMemoryMetric

- (MXMemoryMetric)initWithPeakMemoryUsageMeasurement:(id)a3 averageMemoryUsageMeasurement:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v16.receiver = self;
  v16.super_class = (Class)MXMemoryMetric;
  v9 = [(MXMetric *)&v16 init];
  if (!v9) {
    goto LABEL_6;
  }
  [v7 doubleValue];
  if (v10 >= 0.0)
  {
    v11 = [v8 averageMeasurement];
    [v11 doubleValue];
    double v13 = v12;

    if (v13 >= 0.0)
    {
      objc_storeStrong((id *)&v9->_peakMemoryUsage, a3);
      objc_storeStrong((id *)&v9->_averageSuspendedMemory, a4);
LABEL_6:
      v14 = v9;
      goto LABEL_7;
    }
  }
  v14 = 0;
LABEL_7:

  return v14;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  peakMemoryUsage = self->_peakMemoryUsage;
  id v5 = a3;
  [v5 encodeObject:peakMemoryUsage forKey:@"peakMemoryUsage"];
  [v5 encodeObject:self->_averageSuspendedMemory forKey:@"averageSuspendedMemory"];
}

- (MXMemoryMetric)initWithCoder:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)MXMemoryMetric;
  id v5 = [(MXMetric *)&v11 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"peakMemoryUsage"];
    peakMemoryUsage = v5->_peakMemoryUsage;
    v5->_peakMemoryUsage = (NSMeasurement *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"averageSuspendedMemory"];
    averageSuspendedMemory = v5->_averageSuspendedMemory;
    v5->_averageSuspendedMemory = (MXAverage *)v8;
  }
  return v5;
}

- (id)toDictionary
{
  id v3 = objc_alloc_init(MEMORY[0x263EFF9A0]);
  if (self->_peakMemoryUsage)
  {
    id v4 = [(MXMetric *)self measurementFormatter];
    id v5 = [v4 stringFromMeasurement:self->_peakMemoryUsage];
    [v3 setObject:v5 forKey:@"peakMemoryUsage"];
  }
  averageSuspendedMemory = self->_averageSuspendedMemory;
  if (averageSuspendedMemory)
  {
    id v7 = [(MXAverage *)averageSuspendedMemory toDictionary];
    [v3 setObject:v7 forKey:@"averageSuspendedMemory"];
  }

  return v3;
}

- (NSMeasurement)peakMemoryUsage
{
  return (NSMeasurement *)objc_getProperty(self, a2, 16, 1);
}

- (MXAverage)averageSuspendedMemory
{
  return (MXAverage *)objc_getProperty(self, a2, 24, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_averageSuspendedMemory, 0);

  objc_storeStrong((id *)&self->_peakMemoryUsage, 0);
}

@end