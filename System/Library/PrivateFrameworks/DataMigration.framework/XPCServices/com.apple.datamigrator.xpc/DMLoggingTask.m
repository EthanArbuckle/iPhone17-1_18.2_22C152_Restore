@interface DMLoggingTask
+ (id)createTaskIfAppropriateWithEnvironment:(id)a3 lastBuildVersion:(id)a4;
- (NSString)name;
- (NSString)telemetryIdentifier;
- (double)estimatedDurationTimeInterval;
- (id)workBlock;
- (void)setEstimatedDurationTimeInterval:(double)a3;
- (void)setName:(id)a3;
- (void)setTelemetryIdentifier:(id)a3;
- (void)setWorkBlock:(id)a3;
@end

@implementation DMLoggingTask

+ (id)createTaskIfAppropriateWithEnvironment:(id)a3 lastBuildVersion:(id)a4
{
  return 0;
}

- (id)workBlock
{
  return objc_getProperty(self, a2, 8, 1);
}

- (void)setWorkBlock:(id)a3
{
}

- (double)estimatedDurationTimeInterval
{
  return self->_estimatedDurationTimeInterval;
}

- (void)setEstimatedDurationTimeInterval:(double)a3
{
  self->_estimatedDurationTimeInterval = a3;
}

- (NSString)name
{
  return (NSString *)objc_getProperty(self, a2, 24, 1);
}

- (void)setName:(id)a3
{
}

- (NSString)telemetryIdentifier
{
  return (NSString *)objc_getProperty(self, a2, 32, 1);
}

- (void)setTelemetryIdentifier:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_telemetryIdentifier, 0);
  objc_storeStrong((id *)&self->_name, 0);

  objc_storeStrong(&self->_workBlock, 0);
}

@end