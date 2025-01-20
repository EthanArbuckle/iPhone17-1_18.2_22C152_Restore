@interface MXDisplayMetric
+ (BOOL)supportsSecureCoding;
- (MXAverage)averagePixelLuminance;
- (MXDisplayMetric)initWithAveragePictureLevel:(id)a3;
- (MXDisplayMetric)initWithCoder:(id)a3;
- (id)toDictionary;
- (void)encodeWithCoder:(id)a3;
@end

@implementation MXDisplayMetric

- (MXDisplayMetric)initWithAveragePictureLevel:(id)a3
{
  id v5 = a3;
  v12.receiver = self;
  v12.super_class = (Class)MXDisplayMetric;
  v6 = [(MXMetric *)&v12 init];
  if (!v6) {
    goto LABEL_5;
  }
  v7 = [v5 averageMeasurement];
  [v7 doubleValue];
  double v9 = v8;

  if (v9 >= 0.0)
  {
    objc_storeStrong((id *)&v6->_averagePixelLuminance, a3);
LABEL_5:
    v10 = v6;
    goto LABEL_6;
  }
  v10 = 0;
LABEL_6:

  return v10;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
}

- (MXDisplayMetric)initWithCoder:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)MXDisplayMetric;
  id v5 = [(MXMetric *)&v9 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"averagePixelLuminance"];
    averagePixelLuminance = v5->_averagePixelLuminance;
    v5->_averagePixelLuminance = (MXAverage *)v6;
  }
  return v5;
}

- (id)toDictionary
{
  id v3 = objc_alloc_init(MEMORY[0x263EFF9A0]);
  averagePixelLuminance = self->_averagePixelLuminance;
  if (averagePixelLuminance)
  {
    id v5 = [(MXAverage *)averagePixelLuminance toDictionary];
    [v3 setObject:v5 forKey:@"averagePixelLuminance"];
  }

  return v3;
}

- (MXAverage)averagePixelLuminance
{
  return (MXAverage *)objc_getProperty(self, a2, 16, 1);
}

- (void).cxx_destruct
{
}

@end