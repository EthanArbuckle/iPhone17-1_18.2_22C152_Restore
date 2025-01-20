@interface CTRemoteDevice
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (BOOL)isMultiESimEnabled;
- (CTDeviceIdentifier)deviceID;
- (CTRemoteDevice)init;
- (CTRemoteDevice)initWithCoder:(id)a3;
- (NSArray)remoteDisplayPlans;
- (NSArray)remotePlans;
- (id)EID;
- (id)description;
- (id)deviceName;
- (id)modelName;
- (unint64_t)deviceType;
- (void)encodeWithCoder:(id)a3;
- (void)setDeviceID:(id)a3;
- (void)setIsMultiESimEnabled:(BOOL)a3;
- (void)setRemoteDisplayPlans:(id)a3;
- (void)setRemotePlans:(id)a3;
@end

@implementation CTRemoteDevice

- (CTRemoteDevice)init
{
  v8.receiver = self;
  v8.super_class = (Class)CTRemoteDevice;
  v2 = [(CTRemoteDevice *)&v8 init];
  v3 = v2;
  if (v2)
  {
    deviceID = v2->_deviceID;
    v2->_deviceID = 0;

    remoteDisplayPlans = v3->_remoteDisplayPlans;
    v3->_remoteDisplayPlans = 0;

    remotePlans = v3->_remotePlans;
    v3->_remotePlans = 0;
  }
  return v3;
}

- (id)description
{
  v3 = [MEMORY[0x1E4F28E78] stringWithFormat:@"<%@ %p", objc_opt_class(), self];
  v4 = [(CTRemoteDevice *)self deviceID];
  [v3 appendFormat:@" deviceID=%@", v4];

  v5 = [(CTRemoteDevice *)self remoteDisplayPlans];
  [v3 appendFormat:@" remoteDisplayPlans:%@", v5];

  v6 = [(CTRemoteDevice *)self remotePlans];
  [v3 appendFormat:@" remotePlans=%@", v6];

  [v3 appendString:@">"];

  return v3;
}

- (BOOL)isEqual:(id)a3
{
  v6 = (CTRemoteDevice *)a3;
  if (v6 == self)
  {
    char v9 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v7 = [(CTRemoteDevice *)self deviceID];
      objc_super v8 = [(CTRemoteDevice *)v6 deviceID];
      if (v7 != v8)
      {
        v3 = [(CTRemoteDevice *)self deviceID];
        v4 = [(CTRemoteDevice *)v6 deviceID];
        if (![v3 isEqual:v4])
        {
          char v9 = 0;
          goto LABEL_18;
        }
      }
      v10 = [(CTRemoteDevice *)self remoteDisplayPlans];
      v11 = [(CTRemoteDevice *)v6 remoteDisplayPlans];
      if (v10 != v11)
      {
        v12 = [(CTRemoteDevice *)self remoteDisplayPlans];
        v13 = [(CTRemoteDevice *)v6 remoteDisplayPlans];
        if (![v12 isEqual:v13])
        {
          char v9 = 0;
          goto LABEL_16;
        }
        v25 = v13;
        v26 = v12;
      }
      v14 = [(CTRemoteDevice *)self remotePlans];
      uint64_t v15 = [(CTRemoteDevice *)v6 remotePlans];
      if (v14 == (void *)v15)
      {

        char v9 = 1;
      }
      else
      {
        v16 = (void *)v15;
        [(CTRemoteDevice *)self remotePlans];
        v17 = v24 = v3;
        [(CTRemoteDevice *)v6 remotePlans];
        v23 = v10;
        v18 = v8;
        v19 = v7;
        v21 = v20 = v4;
        char v9 = [v17 isEqual:v21];

        v4 = v20;
        v7 = v19;
        objc_super v8 = v18;
        v10 = v23;

        v3 = v24;
      }
      v13 = v25;
      v12 = v26;
      if (v10 == v11)
      {
LABEL_17:

        if (v7 == v8)
        {
LABEL_19:

          goto LABEL_20;
        }
LABEL_18:

        goto LABEL_19;
      }
LABEL_16:

      goto LABEL_17;
    }
    char v9 = 0;
  }
LABEL_20:

  return v9;
}

- (id)deviceName
{
  return [(CTDeviceIdentifier *)self->_deviceID deviceName];
}

- (id)modelName
{
  return [(CTDeviceIdentifier *)self->_deviceID modelName];
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

- (CTRemoteDevice)initWithCoder:(id)a3
{
  id v4 = a3;
  v19.receiver = self;
  v19.super_class = (Class)CTRemoteDevice;
  v5 = [(CTRemoteDevice *)&v19 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"deviceID"];
    deviceID = v5->_deviceID;
    v5->_deviceID = (CTDeviceIdentifier *)v6;

    objc_super v8 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v9 = objc_opt_class();
    v10 = objc_msgSend(v8, "setWithObjects:", v9, objc_opt_class(), 0);
    uint64_t v11 = [v4 decodeObjectOfClasses:v10 forKey:@"remoteDisplayPlans"];
    remoteDisplayPlans = v5->_remoteDisplayPlans;
    v5->_remoteDisplayPlans = (NSArray *)v11;

    v13 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v14 = objc_opt_class();
    uint64_t v15 = objc_msgSend(v13, "setWithObjects:", v14, objc_opt_class(), 0);
    uint64_t v16 = [v4 decodeObjectOfClasses:v15 forKey:@"remotePlans"];
    remotePlans = v5->_remotePlans;
    v5->_remotePlans = (NSArray *)v16;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  deviceID = self->_deviceID;
  id v5 = a3;
  [v5 encodeObject:deviceID forKey:@"deviceID"];
  [v5 encodeObject:self->_remoteDisplayPlans forKey:@"remoteDisplayPlans"];
  [v5 encodeObject:self->_remotePlans forKey:@"remotePlans"];
}

- (CTDeviceIdentifier)deviceID
{
  return self->_deviceID;
}

- (void)setDeviceID:(id)a3
{
}

- (NSArray)remoteDisplayPlans
{
  return self->_remoteDisplayPlans;
}

- (void)setRemoteDisplayPlans:(id)a3
{
}

- (NSArray)remotePlans
{
  return self->_remotePlans;
}

- (void)setRemotePlans:(id)a3
{
}

- (BOOL)isMultiESimEnabled
{
  return self->_isMultiESimEnabled;
}

- (void)setIsMultiESimEnabled:(BOOL)a3
{
  self->_isMultiESimEnabled = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_remotePlans, 0);
  objc_storeStrong((id *)&self->_remoteDisplayPlans, 0);

  objc_storeStrong((id *)&self->_deviceID, 0);
}

@end