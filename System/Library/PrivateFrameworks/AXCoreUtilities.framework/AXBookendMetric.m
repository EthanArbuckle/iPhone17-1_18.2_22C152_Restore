@interface AXBookendMetric
+ (BOOL)supportsSecureCoding;
- (void)endMeasurement;
- (void)startMeasurement;
@end

@implementation AXBookendMetric

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)startMeasurement
{
  v2.receiver = self;
  v2.super_class = (Class)AXBookendMetric;
  [(AXMetric *)&v2 _startMeasurement];
}

- (void)endMeasurement
{
  v2.receiver = self;
  v2.super_class = (Class)AXBookendMetric;
  [(AXMetric *)&v2 _endMeasurement];
}

@end