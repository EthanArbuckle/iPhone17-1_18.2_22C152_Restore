@interface MXCellularConditionMetric
+ (BOOL)supportsSecureCoding;
- (MXCellularConditionMetric)initWithCellularConditionTime:(id)a3;
- (MXCellularConditionMetric)initWithCoder:(id)a3;
- (MXHistogram)histogrammedCellularConditionTime;
- (id)toDictionary;
- (void)encodeWithCoder:(id)a3;
@end

@implementation MXCellularConditionMetric

- (MXCellularConditionMetric)initWithCellularConditionTime:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)MXCellularConditionMetric;
  v5 = [(MXMetric *)&v10 init];
  if (v5)
  {
    if (!v4)
    {
      v8 = 0;
      goto LABEL_6;
    }
    v6 = [[MXHistogram alloc] initWithHistogramBucketData:v4];
    histogrammedCellularConditionTime = v5->_histogrammedCellularConditionTime;
    v5->_histogrammedCellularConditionTime = v6;
  }
  v8 = v5;
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

- (MXCellularConditionMetric)initWithCoder:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)MXCellularConditionMetric;
  v5 = [(MXMetric *)&v9 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"cellConditionTime"];
    histogrammedCellularConditionTime = v5->_histogrammedCellularConditionTime;
    v5->_histogrammedCellularConditionTime = (MXHistogram *)v6;
  }
  return v5;
}

- (id)toDictionary
{
  id v3 = objc_alloc_init(MEMORY[0x263EFF9A0]);
  histogrammedCellularConditionTime = self->_histogrammedCellularConditionTime;
  if (histogrammedCellularConditionTime)
  {
    v5 = [(MXHistogram *)histogrammedCellularConditionTime toDictionary];
    [v3 setObject:v5 forKey:@"cellConditionTime"];
  }

  return v3;
}

- (MXHistogram)histogrammedCellularConditionTime
{
  return (MXHistogram *)objc_getProperty(self, a2, 16, 1);
}

- (void).cxx_destruct
{
}

@end