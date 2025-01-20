@interface MXDiskIOMetric
+ (BOOL)supportsSecureCoding;
- (MXDiskIOMetric)initWithCoder:(id)a3;
- (MXDiskIOMetric)initWithCumulativeLogicalWritesMeasurement:(id)a3;
- (NSMeasurement)cumulativeLogicalWrites;
- (id)toDictionary;
- (void)encodeWithCoder:(id)a3;
@end

@implementation MXDiskIOMetric

- (MXDiskIOMetric)initWithCumulativeLogicalWritesMeasurement:(id)a3
{
  id v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)MXDiskIOMetric;
  v6 = [(MXMetric *)&v10 init];
  if (!v6) {
    goto LABEL_5;
  }
  [v5 doubleValue];
  if (v7 >= 0.0)
  {
    objc_storeStrong((id *)&v6->_cumulativeLogicalWrites, a3);
LABEL_5:
    v8 = v6;
    goto LABEL_6;
  }
  v8 = 0;
LABEL_6:

  return v8;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
}

- (MXDiskIOMetric)initWithCoder:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)MXDiskIOMetric;
  id v5 = [(MXMetric *)&v9 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"cumulativeLogicalWrites"];
    cumulativeLogicalWrites = v5->_cumulativeLogicalWrites;
    v5->_cumulativeLogicalWrites = (NSMeasurement *)v6;
  }
  return v5;
}

- (id)toDictionary
{
  id v3 = objc_alloc_init(MEMORY[0x263EFF9A0]);
  if (self->_cumulativeLogicalWrites)
  {
    id v4 = [(MXMetric *)self measurementFormatter];
    id v5 = [v4 stringFromMeasurement:self->_cumulativeLogicalWrites];
    [v3 setObject:v5 forKey:@"cumulativeLogicalWrites"];
  }

  return v3;
}

- (NSMeasurement)cumulativeLogicalWrites
{
  return (NSMeasurement *)objc_getProperty(self, a2, 16, 1);
}

- (void).cxx_destruct
{
}

@end