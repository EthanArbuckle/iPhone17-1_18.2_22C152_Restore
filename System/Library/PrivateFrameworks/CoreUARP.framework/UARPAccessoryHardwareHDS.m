@interface UARPAccessoryHardwareHDS
- (BOOL)isEqual:(id)a3;
- (NSUUID)uuid;
- (UARPAccessoryHardwareHDS)init;
- (UARPAccessoryHardwareHDS)initWithUUID:(id)a3;
- (id)description;
@end

@implementation UARPAccessoryHardwareHDS

- (UARPAccessoryHardwareHDS)init
{
  return 0;
}

- (UARPAccessoryHardwareHDS)initWithUUID:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)UARPAccessoryHardwareHDS;
  v6 = [(UARPAccessoryHardwareID *)&v9 initWithTransport:7];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_uuid, a3);
  }

  return v7;
}

- (BOOL)isEqual:(id)a3
{
  v4 = (UARPAccessoryHardwareHDS *)a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    if (self == v4)
    {
      BOOL v13 = 1;
    }
    else
    {
      uuid = self->_uuid;
      v6 = v4;
      v7 = [(NSUUID *)uuid UUIDString];
      v8 = [(UARPAccessoryHardwareHDS *)v6 uuid];
      objc_super v9 = [v8 UUIDString];

      char v10 = [v7 isEqualToString:v9];
      int64_t v11 = [(UARPAccessoryHardwareID *)self transport];
      uint64_t v12 = [(UARPAccessoryHardwareID *)v6 transport];

      if (v11 == v12) {
        BOOL v13 = v10;
      }
      else {
        BOOL v13 = 0;
      }
    }
  }
  else
  {
    BOOL v13 = 0;
  }

  return v13;
}

- (id)description
{
  v2 = NSString;
  v3 = [(NSUUID *)self->_uuid UUIDString];
  v4 = [v2 stringWithFormat:@"HDS, UUID = %@", v3];

  return v4;
}

- (NSUUID)uuid
{
  return (NSUUID *)objc_getProperty(self, a2, 16, 1);
}

- (void).cxx_destruct
{
}

@end