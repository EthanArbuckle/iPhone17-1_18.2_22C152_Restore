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
  v3 = NSString;
  v4 = (objc_class *)objc_opt_class();
  return (NSString *)[v3 stringWithFormat:@"%@ (%p): sensor: %@, bundleId: %@, deviceId: %@", NSStringFromClass(v4), self, self->_sensor, self->_bundleIdentifier, self->_deviceIdentifier];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  if (([a3 allowsKeyedCoding] & 1) == 0) {
    objc_msgSend((id)objc_msgSend(MEMORY[0x263F08690], "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"SRReaderRequest.m", 28, @"Invalid parameter not satisfying: %@", @"[coder allowsKeyedCoding]");
  }
  [a3 encodeObject:self->_bundleIdentifier forKey:@"BundleIdentifier"];
  [a3 encodeObject:self->_sensor forKey:@"Sensor"];
  deviceIdentifier = self->_deviceIdentifier;

  [a3 encodeObject:deviceIdentifier forKey:@"DeviceIdentifier"];
}

- (SRReaderRequest)initWithCoder:(id)a3
{
  if (([a3 allowsKeyedCoding] & 1) == 0) {
    objc_msgSend((id)objc_msgSend(MEMORY[0x263F08690], "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"SRReaderRequest.m", 36, @"Invalid parameter not satisfying: %@", @"[coder allowsKeyedCoding]");
  }
  v8.receiver = self;
  v8.super_class = (Class)SRReaderRequest;
  v6 = [(SRReaderRequest *)&v8 init];
  if (v6)
  {
    v6->_deviceIdentifier = (NSString *)(id)[a3 decodeObjectOfClass:objc_opt_class() forKey:@"DeviceIdentifier"];
    v6->_bundleIdentifier = (NSString *)(id)[a3 decodeObjectOfClass:objc_opt_class() forKey:@"BundleIdentifier"];
    v6->_sensor = (NSString *)(id)[a3 decodeObjectOfClass:objc_opt_class() forKey:@"Sensor"];
  }
  return v6;
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