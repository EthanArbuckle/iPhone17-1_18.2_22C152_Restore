@interface FMFDevice
+ (BOOL)supportsSecureCoding;
+ (id)deviceWithId:(id)a3 name:(id)a4 idsDeviceId:(id)a5 isActive:(BOOL)a6 isThisDevice:(BOOL)a7 isCompanionDevice:(BOOL)a8 isAutoMeCapable:(BOOL)a9;
- (BOOL)isActiveDevice;
- (BOOL)isAutoMeCapable;
- (BOOL)isCompanionDevice;
- (BOOL)isEqual:(id)a3;
- (BOOL)isThisDevice;
- (FMFDevice)initWithCoder:(id)a3;
- (NSString)deviceId;
- (NSString)deviceName;
- (NSString)idsDeviceId;
- (id)copyWithZone:(_NSZone *)a3;
- (id)debugDescription;
- (id)description;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
- (void)setDeviceId:(id)a3;
- (void)setDeviceName:(id)a3;
- (void)setIdsDeviceId:(id)a3;
- (void)setIsActiveDevice:(BOOL)a3;
- (void)setIsAutoMeCapable:(BOOL)a3;
- (void)setIsCompanionDevice:(BOOL)a3;
- (void)setIsThisDevice:(BOOL)a3;
- (void)updateIsActive:(BOOL)a3 isThisDevice:(BOOL)a4;
@end

@implementation FMFDevice

+ (id)deviceWithId:(id)a3 name:(id)a4 idsDeviceId:(id)a5 isActive:(BOOL)a6 isThisDevice:(BOOL)a7 isCompanionDevice:(BOOL)a8 isAutoMeCapable:(BOOL)a9
{
  BOOL v9 = a8;
  BOOL v10 = a7;
  BOOL v11 = a6;
  id v14 = a5;
  id v15 = a4;
  id v16 = a3;
  id v17 = objc_alloc_init((Class)objc_opt_class());
  [v17 setDeviceId:v16];

  [v17 setDeviceName:v15];
  [v17 setIsActiveDevice:v11];
  [v17 setIsThisDevice:v10];
  [v17 setIsCompanionDevice:v9];
  [v17 setIsAutoMeCapable:a9];
  [v17 setIdsDeviceId:v14];

  return v17;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = objc_alloc_init((Class)objc_opt_class());
  v5 = [(FMFDevice *)self deviceName];
  [v4 setDeviceName:v5];

  objc_msgSend(v4, "setIsActiveDevice:", -[FMFDevice isActiveDevice](self, "isActiveDevice"));
  objc_msgSend(v4, "setIsAutoMeCapable:", -[FMFDevice isAutoMeCapable](self, "isAutoMeCapable"));
  v6 = [(FMFDevice *)self idsDeviceId];
  [v4 setIdsDeviceId:v6];

  objc_msgSend(v4, "setIsThisDevice:", -[FMFDevice isThisDevice](self, "isThisDevice"));
  objc_msgSend(v4, "setIsCompanionDevice:", -[FMFDevice isCompanionDevice](self, "isCompanionDevice"));
  v7 = [(FMFDevice *)self deviceId];
  [v4 setDeviceId:v7];

  return v4;
}

- (void)updateIsActive:(BOOL)a3 isThisDevice:(BOOL)a4
{
  BOOL v4 = a4;
  [(FMFDevice *)self setIsActiveDevice:a3];

  [(FMFDevice *)self setIsThisDevice:v4];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v7 = a3;
  BOOL v4 = [(FMFDevice *)self deviceId];
  [v7 encodeObject:v4 forKey:@"deviceId"];

  v5 = [(FMFDevice *)self deviceName];
  [v7 encodeObject:v5 forKey:@"deviceName"];

  objc_msgSend(v7, "encodeBool:forKey:", -[FMFDevice isActiveDevice](self, "isActiveDevice"), @"isActiveDevice");
  objc_msgSend(v7, "encodeBool:forKey:", -[FMFDevice isThisDevice](self, "isThisDevice"), @"isThisDevice");
  objc_msgSend(v7, "encodeBool:forKey:", -[FMFDevice isCompanionDevice](self, "isCompanionDevice"), @"isCompanionDevice");
  v6 = [(FMFDevice *)self idsDeviceId];
  [v7 encodeObject:v6 forKey:@"idsDeviceId"];

  objc_msgSend(v7, "encodeBool:forKey:", -[FMFDevice isAutoMeCapable](self, "isAutoMeCapable"), @"isAutoMeCapable");
}

- (FMFDevice)initWithCoder:(id)a3
{
  id v4 = a3;
  v5 = (FMFDevice *)objc_alloc_init((Class)objc_opt_class());
  v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"deviceId"];
  [(FMFDevice *)v5 setDeviceId:v6];

  id v7 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"deviceName"];
  [(FMFDevice *)v5 setDeviceName:v7];

  -[FMFDevice setIsActiveDevice:](v5, "setIsActiveDevice:", [v4 decodeBoolForKey:@"isActiveDevice"]);
  -[FMFDevice setIsThisDevice:](v5, "setIsThisDevice:", [v4 decodeBoolForKey:@"isThisDevice"]);
  -[FMFDevice setIsCompanionDevice:](v5, "setIsCompanionDevice:", [v4 decodeBoolForKey:@"isCompanionDevice"]);
  v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"idsDeviceId"];
  [(FMFDevice *)v5 setIdsDeviceId:v8];

  uint64_t v9 = [v4 decodeBoolForKey:@"isAutoMeCapable"];
  [(FMFDevice *)v5 setIsAutoMeCapable:v9];

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v5 = v4;
    v6 = [(FMFDevice *)self deviceId];
    id v7 = [v5 deviceId];
    if ([v6 isEqualToString:v7])
    {
      v8 = [(FMFDevice *)self deviceName];
      uint64_t v9 = [v5 deviceName];
      if ([v8 isEqualToString:v9])
      {
        BOOL v10 = [(FMFDevice *)self idsDeviceId];
        BOOL v11 = [v5 idsDeviceId];
        if ([v10 isEqualToString:v11]
          && (int v12 = [(FMFDevice *)self isAutoMeCapable],
              v12 == [v5 isAutoMeCapable])
          && (int v13 = [(FMFDevice *)self isActiveDevice],
              v13 == [v5 isActiveDevice])
          && (int v14 = [(FMFDevice *)self isThisDevice],
              v14 == [v5 isThisDevice]))
        {
          BOOL v17 = [(FMFDevice *)self isCompanionDevice];
          int v15 = v17 ^ [v5 isCompanionDevice] ^ 1;
        }
        else
        {
          LOBYTE(v15) = 0;
        }
      }
      else
      {
        LOBYTE(v15) = 0;
      }
    }
    else
    {
      LOBYTE(v15) = 0;
    }
  }
  else
  {
    LOBYTE(v15) = 0;
  }

  return v15;
}

- (unint64_t)hash
{
  v2 = [(FMFDevice *)self deviceId];
  unint64_t v3 = [v2 hash];

  return v3;
}

- (id)description
{
  unint64_t v3 = NSString;
  id v4 = [(FMFDevice *)self deviceName];
  id v5 = [(FMFDevice *)self deviceId];
  v6 = @"NO";
  if ([(FMFDevice *)self isActiveDevice]) {
    id v7 = @"YES";
  }
  else {
    id v7 = @"NO";
  }
  if ([(FMFDevice *)self isThisDevice]) {
    v6 = @"YES";
  }
  v8 = [(FMFDevice *)self idsDeviceId];
  uint64_t v9 = [v3 stringWithFormat:@"%@ [%@] {meDevice=%@} {thisDevice=%@} {idsDeviceId=%@}", v4, v5, v7, v6, v8];

  return v9;
}

- (id)debugDescription
{
  unint64_t v3 = NSString;
  uint64_t v4 = objc_opt_class();
  id v5 = [(FMFDevice *)self deviceId];
  v6 = [(FMFDevice *)self deviceName];
  id v7 = @"YES";
  if ([(FMFDevice *)self isActiveDevice]) {
    v8 = @"YES";
  }
  else {
    v8 = @"NO";
  }
  if (![(FMFDevice *)self isThisDevice]) {
    id v7 = @"NO";
  }
  uint64_t v9 = [(FMFDevice *)self idsDeviceId];
  BOOL v10 = [v3 stringWithFormat:@"<%@ %p [%@:%@]> meDevice ? (%@) : thisDevice ? (%@) : idsDeviceId (%@)", v4, self, v5, v6, v8, v7, v9];

  return v10;
}

- (NSString)deviceId
{
  return self->_deviceId;
}

- (void)setDeviceId:(id)a3
{
}

- (NSString)deviceName
{
  return self->_deviceName;
}

- (void)setDeviceName:(id)a3
{
}

- (BOOL)isActiveDevice
{
  return self->_isActiveDevice;
}

- (void)setIsActiveDevice:(BOOL)a3
{
  self->_isActiveDevice = a3;
}

- (BOOL)isThisDevice
{
  return self->_isThisDevice;
}

- (void)setIsThisDevice:(BOOL)a3
{
  self->_isThisDevice = a3;
}

- (BOOL)isCompanionDevice
{
  return self->_isCompanionDevice;
}

- (void)setIsCompanionDevice:(BOOL)a3
{
  self->_isCompanionDevice = a3;
}

- (NSString)idsDeviceId
{
  return self->_idsDeviceId;
}

- (void)setIdsDeviceId:(id)a3
{
}

- (BOOL)isAutoMeCapable
{
  return self->_isAutoMeCapable;
}

- (void)setIsAutoMeCapable:(BOOL)a3
{
  self->_isAutoMeCapable = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_idsDeviceId, 0);
  objc_storeStrong((id *)&self->_deviceName, 0);

  objc_storeStrong((id *)&self->_deviceId, 0);
}

@end