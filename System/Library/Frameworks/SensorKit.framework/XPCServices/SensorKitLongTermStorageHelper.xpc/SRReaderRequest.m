@interface SRReaderRequest
+ (BOOL)supportsSecureCoding;
- (NSString)bundleIdentifier;
- (NSString)description;
- (NSString)deviceIdentifier;
- (NSString)sensor;
- (SRReaderRequest)initWithCoder:(id)a3;
- (void)dealloc;
- (void)encodeWithCoder:(id)a3;
- (void)setBundleIdentifier:(id)a3;
- (void)setDeviceIdentifier:(id)a3;
- (void)setSensor:(id)a3;
@end

@implementation SRReaderRequest

- (NSString)description
{
  v3 = (objc_class *)objc_opt_class();
  return +[NSString stringWithFormat:@"%@ (%p): sensor: %@, bundleId: %@, deviceId: %@", NSStringFromClass(v3), self, self->_sensor, self->_bundleIdentifier, self->_deviceIdentifier];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  [a3 encodeObject:self->_bundleIdentifier forKey:@"BundleIdentifier"];
  [a3 encodeObject:self->_sensor forKey:@"Sensor"];
  deviceIdentifier = self->_deviceIdentifier;

  [a3 encodeObject:deviceIdentifier forKey:@"DeviceIdentifier"];
}

- (SRReaderRequest)initWithCoder:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)SRReaderRequest;
  v4 = [(SRReaderRequest *)&v6 init];
  if (v4)
  {
    v4->_deviceIdentifier = (NSString *)[a3 decodeObjectOfClass:objc_opt_class() forKey:@"DeviceIdentifier"];
    v4->_bundleIdentifier = (NSString *)[a3 decodeObjectOfClass:objc_opt_class() forKey:@"BundleIdentifier"];
    v4->_sensor = (NSString *)[a3 decodeObjectOfClass:objc_opt_class() forKey:@"Sensor"];
  }
  return v4;
}

- (void)dealloc
{
  self->_deviceIdentifier = 0;
  self->_bundleIdentifier = 0;

  v3.receiver = self;
  v3.super_class = (Class)SRReaderRequest;
  [(SRReaderRequest *)&v3 dealloc];
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

@end