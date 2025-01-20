@interface MXAppRunTimeMetric
+ (BOOL)supportsSecureCoding;
- (MXAppRunTimeMetric)initWithCoder:(id)a3;
- (MXAppRunTimeMetric)initWithCumulativeForegroundTimeMeasurement:(id)a3 cumulativeBackgroundTimeMeasurement:(id)a4 cumulativeBackgroundAudioTimeMeasurement:(id)a5 cumulativeBackgroundLocationTimeMeasurement:(id)a6;
- (NSMeasurement)cumulativeBackgroundAudioTime;
- (NSMeasurement)cumulativeBackgroundLocationTime;
- (NSMeasurement)cumulativeBackgroundTime;
- (NSMeasurement)cumulativeForegroundTime;
- (id)toDictionary;
- (void)encodeWithCoder:(id)a3;
@end

@implementation MXAppRunTimeMetric

- (MXAppRunTimeMetric)initWithCumulativeForegroundTimeMeasurement:(id)a3 cumulativeBackgroundTimeMeasurement:(id)a4 cumulativeBackgroundAudioTimeMeasurement:(id)a5 cumulativeBackgroundLocationTimeMeasurement:(id)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  v22.receiver = self;
  v22.super_class = (Class)MXAppRunTimeMetric;
  v15 = [(MXMetric *)&v22 init];
  if (!v15) {
    goto LABEL_8;
  }
  [v11 doubleValue];
  if (v16 >= 0.0)
  {
    [v12 doubleValue];
    if (v17 >= 0.0)
    {
      [v13 doubleValue];
      if (v18 >= 0.0)
      {
        [v14 doubleValue];
        if (v19 >= 0.0)
        {
          objc_storeStrong((id *)&v15->_cumulativeForegroundTime, a3);
          objc_storeStrong((id *)&v15->_cumulativeBackgroundTime, a4);
          objc_storeStrong((id *)&v15->_cumulativeBackgroundAudioTime, a5);
          objc_storeStrong((id *)&v15->_cumulativeBackgroundLocationTime, a6);
LABEL_8:
          v20 = v15;
          goto LABEL_9;
        }
      }
    }
  }
  v20 = 0;
LABEL_9:

  return v20;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  cumulativeForegroundTime = self->_cumulativeForegroundTime;
  id v5 = a3;
  [v5 encodeObject:cumulativeForegroundTime forKey:@"cumulativeForegroundTime"];
  [v5 encodeObject:self->_cumulativeBackgroundTime forKey:@"cumulativeBackgroundTime"];
  [v5 encodeObject:self->_cumulativeBackgroundAudioTime forKey:@"cumulativeBackgroundAudioTime"];
  [v5 encodeObject:self->_cumulativeBackgroundLocationTime forKey:@"cumulativeBackgroundLocationTime"];
}

- (MXAppRunTimeMetric)initWithCoder:(id)a3
{
  id v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)MXAppRunTimeMetric;
  id v5 = [(MXMetric *)&v15 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"cumulativeForegroundTime"];
    cumulativeForegroundTime = v5->_cumulativeForegroundTime;
    v5->_cumulativeForegroundTime = (NSMeasurement *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"cumulativeBackgroundTime"];
    cumulativeBackgroundTime = v5->_cumulativeBackgroundTime;
    v5->_cumulativeBackgroundTime = (NSMeasurement *)v8;

    uint64_t v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"cumulativeBackgroundAudioTime"];
    cumulativeBackgroundAudioTime = v5->_cumulativeBackgroundAudioTime;
    v5->_cumulativeBackgroundAudioTime = (NSMeasurement *)v10;

    uint64_t v12 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"cumulativeBackgroundLocationTime"];
    cumulativeBackgroundLocationTime = v5->_cumulativeBackgroundLocationTime;
    v5->_cumulativeBackgroundLocationTime = (NSMeasurement *)v12;
  }
  return v5;
}

- (id)toDictionary
{
  id v3 = objc_alloc_init(MEMORY[0x263EFF9A0]);
  if (self->_cumulativeForegroundTime)
  {
    id v4 = [(MXMetric *)self measurementFormatter];
    id v5 = [v4 stringFromMeasurement:self->_cumulativeForegroundTime];
    [v3 setObject:v5 forKey:@"cumulativeForegroundTime"];
  }
  if (self->_cumulativeBackgroundTime)
  {
    uint64_t v6 = [(MXMetric *)self measurementFormatter];
    v7 = [v6 stringFromMeasurement:self->_cumulativeBackgroundTime];
    [v3 setObject:v7 forKey:@"cumulativeBackgroundTime"];
  }
  if (self->_cumulativeBackgroundAudioTime)
  {
    uint64_t v8 = [(MXMetric *)self measurementFormatter];
    v9 = [v8 stringFromMeasurement:self->_cumulativeBackgroundAudioTime];
    [v3 setObject:v9 forKey:@"cumulativeBackgroundAudioTime"];
  }
  if (self->_cumulativeBackgroundLocationTime)
  {
    uint64_t v10 = [(MXMetric *)self measurementFormatter];
    id v11 = [v10 stringFromMeasurement:self->_cumulativeBackgroundLocationTime];
    [v3 setObject:v11 forKey:@"cumulativeBackgroundLocationTime"];
  }

  return v3;
}

- (NSMeasurement)cumulativeForegroundTime
{
  return (NSMeasurement *)objc_getProperty(self, a2, 16, 1);
}

- (NSMeasurement)cumulativeBackgroundTime
{
  return (NSMeasurement *)objc_getProperty(self, a2, 24, 1);
}

- (NSMeasurement)cumulativeBackgroundAudioTime
{
  return (NSMeasurement *)objc_getProperty(self, a2, 32, 1);
}

- (NSMeasurement)cumulativeBackgroundLocationTime
{
  return (NSMeasurement *)objc_getProperty(self, a2, 40, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cumulativeBackgroundLocationTime, 0);
  objc_storeStrong((id *)&self->_cumulativeBackgroundAudioTime, 0);
  objc_storeStrong((id *)&self->_cumulativeBackgroundTime, 0);

  objc_storeStrong((id *)&self->_cumulativeForegroundTime, 0);
}

@end