@interface FMLDevice
- (BOOL)isActive;
- (BOOL)isAutoMeCapable;
- (BOOL)isCompanion;
- (BOOL)isEqual:(id)a3;
- (BOOL)isThisDevice;
- (FMLDevice)initWithIdentifier:(id)a3 deviceName:(id)a4 idsDeviceId:(id)a5 isActive:(BOOL)a6 isThisDevice:(BOOL)a7 isCompanion:(BOOL)a8 isAutoMeCapable:(BOOL)a9;
- (NSString)deviceName;
- (NSString)identifier;
- (NSString)idsDeviceId;
- (id)debugDescription;
- (id)description;
- (unint64_t)hash;
- (void)setDeviceName:(id)a3;
- (void)setIdentifier:(id)a3;
- (void)setIdsDeviceId:(id)a3;
- (void)setIsActive:(BOOL)a3;
- (void)setIsAutoMeCapable:(BOOL)a3;
- (void)setIsCompanion:(BOOL)a3;
- (void)setIsThisDevice:(BOOL)a3;
@end

@implementation FMLDevice

- (FMLDevice)initWithIdentifier:(id)a3 deviceName:(id)a4 idsDeviceId:(id)a5 isActive:(BOOL)a6 isThisDevice:(BOOL)a7 isCompanion:(BOOL)a8 isAutoMeCapable:(BOOL)a9
{
  BOOL v9 = a8;
  BOOL v10 = a7;
  BOOL v11 = a6;
  id v15 = a3;
  id v16 = a4;
  id v17 = a5;
  v21.receiver = self;
  v21.super_class = (Class)FMLDevice;
  v18 = [(FMLDevice *)&v21 init];
  v19 = v18;
  if (v18)
  {
    [(FMLDevice *)v18 setIdentifier:v15];
    [(FMLDevice *)v19 setDeviceName:v16];
    [(FMLDevice *)v19 setIdsDeviceId:v17];
    [(FMLDevice *)v19 setIsActive:v11];
    [(FMLDevice *)v19 setIsThisDevice:v10];
    [(FMLDevice *)v19 setIsCompanion:v9];
    [(FMLDevice *)v19 setIsAutoMeCapable:a9];
  }

  return v19;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v5 = v4;
    v6 = [(FMLDevice *)self comparisonIdentifier];
    v7 = [v5 comparisonIdentifier];

    char v8 = [v6 isEqualToString:v7];
  }
  else
  {
    char v8 = 0;
  }

  return v8;
}

- (unint64_t)hash
{
  v2 = [(FMLDevice *)self comparisonIdentifier];
  unint64_t v3 = [v2 hash];

  return v3;
}

- (id)description
{
  v2 = NSString;
  unint64_t v3 = [(FMLDevice *)self identifier];
  id v4 = [v2 stringWithFormat:@"%@", v3];

  return v4;
}

- (id)debugDescription
{
  unint64_t v3 = NSString;
  uint64_t v4 = objc_opt_class();
  id v5 = [(FMLDevice *)self identifier];
  v6 = [v3 stringWithFormat:@"<%@ %p [%@]>", v4, self, v5];

  return v6;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(id)a3
{
}

- (NSString)deviceName
{
  return self->_deviceName;
}

- (void)setDeviceName:(id)a3
{
}

- (NSString)idsDeviceId
{
  return self->_idsDeviceId;
}

- (void)setIdsDeviceId:(id)a3
{
}

- (BOOL)isActive
{
  return self->_isActive;
}

- (void)setIsActive:(BOOL)a3
{
  self->_isActive = a3;
}

- (BOOL)isThisDevice
{
  return self->_isThisDevice;
}

- (void)setIsThisDevice:(BOOL)a3
{
  self->_isThisDevice = a3;
}

- (BOOL)isCompanion
{
  return self->_isCompanion;
}

- (void)setIsCompanion:(BOOL)a3
{
  self->_isCompanion = a3;
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

  objc_storeStrong((id *)&self->_identifier, 0);
}

@end