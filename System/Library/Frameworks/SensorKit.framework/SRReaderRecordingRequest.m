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
  v3 = NSString;
  v4 = (objc_class *)objc_opt_class();
  return (NSString *)[v3 stringWithFormat:@"%@ (%p): sensor: %@, bundleId: %@, deviceId: %@, configuration: %@", NSStringFromClass(v4), self, self->_sensor, self->_bundleIdentifier, self->_deviceIdentifier, self->_sensorConfiguration];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  if (([a3 allowsKeyedCoding] & 1) == 0) {
    objc_msgSend((id)objc_msgSend(MEMORY[0x263F08690], "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"SRReaderRequest.m", 72, @"Invalid parameter not satisfying: %@", @"[coder allowsKeyedCoding]");
  }
  [a3 encodeObject:self->_bundleIdentifier forKey:@"BundleIdentifier"];
  [a3 encodeObject:self->_sensor forKey:@"Sensor"];
  [a3 encodeObject:self->_deviceIdentifier forKey:@"DeviceIdentifier"];
  sensorConfiguration = self->_sensorConfiguration;

  [a3 encodeObject:sensorConfiguration forKey:@"SensorConfiguration"];
}

- (SRReaderRecordingRequest)initWithCoder:(id)a3
{
  if (([a3 allowsKeyedCoding] & 1) == 0) {
    objc_msgSend((id)objc_msgSend(MEMORY[0x263F08690], "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"SRReaderRequest.m", 82, @"Invalid parameter not satisfying: %@", @"[coder allowsKeyedCoding]");
  }
  v14.receiver = self;
  v14.super_class = (Class)SRReaderRecordingRequest;
  v6 = [(SRReaderRecordingRequest *)&v14 init];
  if (v6)
  {
    v6->_deviceIdentifier = (NSString *)(id)[a3 decodeObjectOfClass:objc_opt_class() forKey:@"DeviceIdentifier"];
    v6->_bundleIdentifier = (NSString *)(id)[a3 decodeObjectOfClass:objc_opt_class() forKey:@"BundleIdentifier"];
    v6->_sensor = (NSString *)(id)[a3 decodeObjectOfClass:objc_opt_class() forKey:@"Sensor"];
    v7 = (void *)MEMORY[0x263EFFA08];
    uint64_t v8 = objc_opt_class();
    uint64_t v9 = objc_opt_class();
    uint64_t v10 = objc_opt_class();
    uint64_t v11 = objc_opt_class();
    uint64_t v12 = objc_opt_class();
    v6->_sensorConfiguration = (NSDictionary *)(id)objc_msgSend(a3, "decodeObjectOfClasses:forKey:", objc_msgSend(v7, "setWithObjects:", v8, v9, v10, v11, v12, objc_opt_class(), 0), @"SensorConfiguration");
  }
  return v6;
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