@interface UARPPowerLogPendingReachabilityEvent
- (BOOL)allDataPresent;
- (BOOL)isEqual:(id)a3;
- (NSString)activeFirmwareVersion;
- (NSString)modelNumber;
- (NSString)stagedFirmwareVersion;
- (NSUUID)uuid;
- (id)description;
- (id)initModelNumber:(id)a3 uuid:(id)a4;
- (void)setActiveFirmwareVersion:(id)a3;
- (void)setStagedFirmwareVersion:(id)a3;
@end

@implementation UARPPowerLogPendingReachabilityEvent

- (id)initModelNumber:(id)a3 uuid:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v12.receiver = self;
  v12.super_class = (Class)UARPPowerLogPendingReachabilityEvent;
  v8 = [(UARPPowerLogPendingReachabilityEvent *)&v12 init];
  if (v8)
  {
    uint64_t v9 = [v6 copy];
    modelNumber = v8->_modelNumber;
    v8->_modelNumber = (NSString *)v9;

    objc_storeStrong((id *)&v8->_uuid, a4);
  }

  return v8;
}

- (BOOL)allDataPresent
{
  return self->_stagedFirmwareVersion && self->_activeFirmwareVersion != 0;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uuid = self->_uuid;
    id v6 = [v4 uuid];
    char v7 = [(NSUUID *)uuid isEqual:v6];
  }
  else
  {
    char v7 = 0;
  }

  return v7;
}

- (id)description
{
  v3 = NSString;
  id v4 = (objc_class *)objc_opt_class();
  v5 = NSStringFromClass(v4);
  id v6 = [v3 stringWithFormat:@"<%@: %@ %@>", v5, self->_modelNumber, self->_uuid];

  return v6;
}

- (NSString)modelNumber
{
  return (NSString *)objc_getProperty(self, a2, 8, 1);
}

- (NSUUID)uuid
{
  return (NSUUID *)objc_getProperty(self, a2, 16, 1);
}

- (NSString)activeFirmwareVersion
{
  return (NSString *)objc_getProperty(self, a2, 24, 1);
}

- (void)setActiveFirmwareVersion:(id)a3
{
}

- (NSString)stagedFirmwareVersion
{
  return (NSString *)objc_getProperty(self, a2, 32, 1);
}

- (void)setStagedFirmwareVersion:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_stagedFirmwareVersion, 0);
  objc_storeStrong((id *)&self->_activeFirmwareVersion, 0);
  objc_storeStrong((id *)&self->_uuid, 0);
  objc_storeStrong((id *)&self->_modelNumber, 0);
}

@end