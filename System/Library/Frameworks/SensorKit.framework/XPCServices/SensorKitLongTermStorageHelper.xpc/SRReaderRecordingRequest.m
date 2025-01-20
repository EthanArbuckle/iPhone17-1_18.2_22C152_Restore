@interface SRReaderRecordingRequest
+ (BOOL)supportsSecureCoding;
- (NSDictionary)sensorConfiguration;
- (NSError)configurationDecodeError;
- (NSString)bundleIdentifier;
- (NSString)description;
- (NSString)deviceIdentifier;
- (NSString)sensor;
- (SRReaderRecordingRequest)initWithCoder:(id)a3;
- (void)dealloc;
- (void)encodeWithCoder:(id)a3;
- (void)setBundleIdentifier:(id)a3;
- (void)setDeviceIdentifier:(id)a3;
- (void)setSensor:(id)a3;
- (void)setSensorConfiguration:(id)a3;
@end

@implementation SRReaderRecordingRequest

- (NSString)description
{
  v3 = (objc_class *)objc_opt_class();
  return +[NSString stringWithFormat:@"%@ (%p): sensor: %@, bundleId: %@, deviceId: %@, configuration: %@", NSStringFromClass(v3), self, self->_sensor, self->_bundleIdentifier, self->_deviceIdentifier, self->_sensorConfiguration];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  [a3 encodeObject:self->_bundleIdentifier forKey:@"BundleIdentifier"];
  [a3 encodeObject:self->_sensor forKey:@"Sensor"];
  [a3 encodeObject:self->_deviceIdentifier forKey:@"DeviceIdentifier"];
  sensorConfiguration = self->_sensorConfiguration;

  [a3 encodeObject:sensorConfiguration forKey:@"SensorConfiguration"];
}

- (SRReaderRecordingRequest)initWithCoder:(id)a3
{
  v11.receiver = self;
  v11.super_class = (Class)SRReaderRecordingRequest;
  v4 = [(SRReaderRecordingRequest *)&v11 init];
  if (v4)
  {
    v4->_deviceIdentifier = (NSString *)[a3 decodeObjectOfClass:objc_opt_class() forKey:@"DeviceIdentifier"];
    v4->_bundleIdentifier = (NSString *)[a3 decodeObjectOfClass:objc_opt_class() forKey:@"BundleIdentifier"];
    v4->_sensor = (NSString *)[a3 decodeObjectOfClass:objc_opt_class() forKey:@"Sensor"];
    uint64_t v5 = objc_opt_class();
    uint64_t v6 = objc_opt_class();
    uint64_t v7 = objc_opt_class();
    uint64_t v8 = objc_opt_class();
    uint64_t v9 = objc_opt_class();
    v4->_sensorConfiguration = (NSDictionary *)objc_msgSend(a3, "decodeObjectOfClasses:forKey:", +[NSSet setWithObjects:](NSSet, "setWithObjects:", v5, v6, v7, v8, v9, objc_opt_class(), 0), @"SensorConfiguration");
  }
  return v4;
}

- (void)dealloc
{
  self->_deviceIdentifier = 0;
  self->_bundleIdentifier = 0;

  self->_sensorConfiguration = 0;
  self->_configurationDecodeError = 0;

  v3.receiver = self;
  v3.super_class = (Class)SRReaderRecordingRequest;
  [(SRReaderRecordingRequest *)&v3 dealloc];
}

- (NSString)sensor
{
  return self->_sensor;
}

- (void)setSensor:(id)a3
{
}

- (NSString)bundleIdentifier
{
  return self->_bundleIdentifier;
}

- (void)setBundleIdentifier:(id)a3
{
}

- (NSString)deviceIdentifier
{
  return self->_deviceIdentifier;
}

- (void)setDeviceIdentifier:(id)a3
{
}

- (NSDictionary)sensorConfiguration
{
  return self->_sensorConfiguration;
}

- (void)setSensorConfiguration:(id)a3
{
}

- (NSError)configurationDecodeError
{
  return self->_configurationDecodeError;
}

@end