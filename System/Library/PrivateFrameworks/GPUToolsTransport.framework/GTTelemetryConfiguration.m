@interface GTTelemetryConfiguration
+ (BOOL)supportsSecureCoding;
- (GTTelemetryConfiguration)init;
- (GTTelemetryConfiguration)initWithCoder:(id)a3;
- (float)reportFrequencyInSeconds;
- (void)encodeWithCoder:(id)a3;
- (void)setReportFrequencyInSeconds:(float)a3;
@end

@implementation GTTelemetryConfiguration

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (GTTelemetryConfiguration)init
{
  v6.receiver = self;
  v6.super_class = (Class)GTTelemetryConfiguration;
  v2 = [(GTTelemetryConfiguration *)&v6 init];
  v3 = v2;
  if (v2)
  {
    v2->_reportFrequencyInSeconds = INFINITY;
    v4 = v2;
  }

  return v3;
}

- (GTTelemetryConfiguration)initWithCoder:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)GTTelemetryConfiguration;
  v5 = [(GTTelemetryConfiguration *)&v9 init];
  if (v5)
  {
    [v4 decodeFloatForKey:@"reportFrequencyInSeconds"];
    v5->_reportFrequencyInSeconds = v6;
    v7 = v5;
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  *(float *)&double v3 = self->_reportFrequencyInSeconds;
  [a3 encodeFloat:@"reportFrequencyInSeconds" forKey:v3];
}

- (float)reportFrequencyInSeconds
{
  return self->_reportFrequencyInSeconds;
}

- (void)setReportFrequencyInSeconds:(float)a3
{
  self->_reportFrequencyInSeconds = a3;
}

@end