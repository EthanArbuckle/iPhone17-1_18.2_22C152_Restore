@interface CTLocalDevice
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (CTDeviceIdentifier)deviceID;
- (CTLocalDevice)init;
- (CTLocalDevice)initWithCoder:(id)a3;
- (NSArray)installedPlans;
- (id)EID;
- (id)description;
- (id)deviceName;
- (unint64_t)deviceType;
- (void)encodeWithCoder:(id)a3;
- (void)setDeviceID:(id)a3;
- (void)setInstalledPlans:(id)a3;
@end

@implementation CTLocalDevice

- (CTLocalDevice)init
{
  v7.receiver = self;
  v7.super_class = (Class)CTLocalDevice;
  v2 = [(CTLocalDevice *)&v7 init];
  v3 = v2;
  if (v2)
  {
    deviceID = v2->_deviceID;
    v2->_deviceID = 0;

    installedPlans = v3->_installedPlans;
    v3->_installedPlans = 0;
  }
  return v3;
}

- (id)description
{
  v3 = [MEMORY[0x1E4F28E78] stringWithFormat:@"<%@ %p", objc_opt_class(), self];
  v4 = [(CTLocalDevice *)self deviceID];
  [v3 appendFormat:@" deviceID=%@", v4];

  v5 = [(CTLocalDevice *)self installedPlans];
  [v3 appendFormat:@" installedPlans=%@", v5];

  [v3 appendString:@">"];

  return v3;
}

- (BOOL)isEqual:(id)a3
{
  v6 = (CTLocalDevice *)a3;
  if (v6 == self)
  {
    char v9 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      objc_super v7 = [(CTLocalDevice *)self deviceID];
      v8 = [(CTLocalDevice *)v6 deviceID];
      if (v7 == v8
        || ([(CTLocalDevice *)self deviceID],
            v3 = objc_claimAutoreleasedReturnValue(),
            [(CTLocalDevice *)v6 deviceID],
            v4 = objc_claimAutoreleasedReturnValue(),
            [v3 isEqual:v4]))
      {
        v10 = [(CTLocalDevice *)self installedPlans];
        v11 = [(CTLocalDevice *)v6 installedPlans];
        if (v10 == v11)
        {
          char v9 = 1;
        }
        else
        {
          v12 = [(CTLocalDevice *)self installedPlans];
          v13 = [(CTLocalDevice *)v6 installedPlans];
          char v9 = [v12 isEqual:v13];
        }
        if (v7 == v8) {
          goto LABEL_13;
        }
      }
      else
      {
        char v9 = 0;
      }

LABEL_13:
      goto LABEL_14;
    }
    char v9 = 0;
  }
LABEL_14:

  return v9;
}

- (id)deviceName
{
  return [(CTDeviceIdentifier *)self->_deviceID deviceName];
}

- (unint64_t)deviceType
{
  return [(CTDeviceIdentifier *)self->_deviceID deviceType];
}

- (id)EID
{
  return [(CTDeviceIdentifier *)self->_deviceID EID];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (CTLocalDevice)initWithCoder:(id)a3
{
  id v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)CTLocalDevice;
  v5 = [(CTLocalDevice *)&v14 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"deviceID"];
    deviceID = v5->_deviceID;
    v5->_deviceID = (CTDeviceIdentifier *)v6;

    v8 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v9 = objc_opt_class();
    v10 = objc_msgSend(v8, "setWithObjects:", v9, objc_opt_class(), 0);
    uint64_t v11 = [v4 decodeObjectOfClasses:v10 forKey:@"installedPlans"];
    installedPlans = v5->_installedPlans;
    v5->_installedPlans = (NSArray *)v11;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  deviceID = self->_deviceID;
  id v5 = a3;
  [v5 encodeObject:deviceID forKey:@"deviceID"];
  [v5 encodeObject:self->_installedPlans forKey:@"installedPlans"];
}

- (CTDeviceIdentifier)deviceID
{
  return self->_deviceID;
}

- (void)setDeviceID:(id)a3
{
}

- (NSArray)installedPlans
{
  return self->_installedPlans;
}

- (void)setInstalledPlans:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_installedPlans, 0);

  objc_storeStrong((id *)&self->_deviceID, 0);
}

@end