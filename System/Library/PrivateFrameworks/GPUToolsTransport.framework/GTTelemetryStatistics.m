@interface GTTelemetryStatistics
+ (BOOL)supportsSecureCoding;
- (GTTelemetryStatistics)initWithCoder:(id)a3;
- (NSArray)devices;
- (NSArray)layers;
- (NSArray)queues;
- (id)description;
- (void)encodeWithCoder:(id)a3;
- (void)setDevices:(id)a3;
- (void)setLayers:(id)a3;
- (void)setQueues:(id)a3;
@end

@implementation GTTelemetryStatistics

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (GTTelemetryStatistics)initWithCoder:(id)a3
{
  id v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)GTTelemetryStatistics;
  v5 = [(GTTelemetryStatistics *)&v13 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeArrayOfObjectsOfClass:objc_opt_class() forKey:@"devices"];
    devices = v5->_devices;
    v5->_devices = (NSArray *)v6;

    uint64_t v8 = [v4 decodeArrayOfObjectsOfClass:objc_opt_class() forKey:@"queues"];
    queues = v5->_queues;
    v5->_queues = (NSArray *)v8;

    uint64_t v10 = [v4 decodeArrayOfObjectsOfClass:objc_opt_class() forKey:@"layers"];
    layers = v5->_layers;
    v5->_layers = (NSArray *)v10;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  devices = self->_devices;
  id v5 = a3;
  [v5 encodeObject:devices forKey:@"devices"];
  [v5 encodeObject:self->_queues forKey:@"queues"];
  [v5 encodeObject:self->_layers forKey:@"layers"];
}

- (id)description
{
  v4.receiver = self;
  v4.super_class = (Class)GTTelemetryStatistics;
  v2 = [(GTTelemetryStatistics *)&v4 description];
  return v2;
}

- (NSArray)devices
{
  return self->_devices;
}

- (void)setDevices:(id)a3
{
}

- (NSArray)queues
{
  return self->_queues;
}

- (void)setQueues:(id)a3
{
}

- (NSArray)layers
{
  return self->_layers;
}

- (void)setLayers:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_layers, 0);
  objc_storeStrong((id *)&self->_queues, 0);
  objc_storeStrong((id *)&self->_devices, 0);
}

@end