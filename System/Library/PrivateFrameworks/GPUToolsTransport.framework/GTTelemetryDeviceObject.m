@interface GTTelemetryDeviceObject
+ (BOOL)supportsSecureCoding;
- (GTTelemetryDeviceObject)initWithCoder:(id)a3;
- (GTTelemetryRecordObject)gpuTime;
- (id)description;
- (unint64_t)commits;
- (unint64_t)streamRef;
- (void)encodeWithCoder:(id)a3;
- (void)setCommits:(unint64_t)a3;
- (void)setGpuTime:(id)a3;
- (void)setStreamRef:(unint64_t)a3;
@end

@implementation GTTelemetryDeviceObject

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (GTTelemetryDeviceObject)initWithCoder:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)GTTelemetryDeviceObject;
  v5 = [(GTTelemetryDeviceObject *)&v9 init];
  if (v5)
  {
    v5->_streamRef = [v4 decodeInt64ForKey:@"streamRef"];
    v5->_commits = [v4 decodeInt64ForKey:@"commits"];
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"gpuTime"];
    gpuTime = v5->_gpuTime;
    v5->_gpuTime = (GTTelemetryRecordObject *)v6;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  unint64_t streamRef = self->_streamRef;
  id v5 = a3;
  [v5 encodeInt64:streamRef forKey:@"streamRef"];
  [v5 encodeInt64:self->_commits forKey:@"commits"];
  [v5 encodeObject:self->_gpuTime forKey:@"gpuTime"];
}

- (id)description
{
  v4.receiver = self;
  v4.super_class = (Class)GTTelemetryDeviceObject;
  v2 = [(GTTelemetryDeviceObject *)&v4 description];
  return v2;
}

- (unint64_t)streamRef
{
  return self->_streamRef;
}

- (void)setStreamRef:(unint64_t)a3
{
  self->_unint64_t streamRef = a3;
}

- (GTTelemetryRecordObject)gpuTime
{
  return self->_gpuTime;
}

- (void)setGpuTime:(id)a3
{
}

- (unint64_t)commits
{
  return self->_commits;
}

- (void)setCommits:(unint64_t)a3
{
  self->_commits = a3;
}

- (void).cxx_destruct
{
}

@end