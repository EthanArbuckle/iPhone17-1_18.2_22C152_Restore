@interface FMDExtAccessoryInfo
+ (BOOL)supportsSecureCoding;
- (FMDExtAccessoryInfo)initWithCoder:(id)a3;
- (NSDictionary)additionalInfo;
- (NSDictionary)serialNumbers;
- (NSString)accessoryIdentifier;
- (NSString)accessoryType;
- (NSString)deviceDiscoveryId;
- (NSString)firmwareVersion;
- (NSString)name;
- (id)description;
- (void)encodeWithCoder:(id)a3;
- (void)setAccessoryIdentifier:(id)a3;
- (void)setAccessoryType:(id)a3;
- (void)setAdditionalInfo:(id)a3;
- (void)setDeviceDiscoveryId:(id)a3;
- (void)setFirmwareVersion:(id)a3;
- (void)setName:(id)a3;
- (void)setSerialNumbers:(id)a3;
@end

@implementation FMDExtAccessoryInfo

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [(FMDExtAccessoryInfo *)self accessoryIdentifier];
  [v4 encodeObject:v5 forKey:@"accessoryIdentifier"];

  v6 = [(FMDExtAccessoryInfo *)self accessoryType];
  [v4 encodeObject:v6 forKey:@"accessoryType"];

  v7 = [(FMDExtAccessoryInfo *)self serialNumbers];
  [v4 encodeObject:v7 forKey:@"serialNumbers"];

  v8 = [(FMDExtAccessoryInfo *)self firmwareVersion];
  [v4 encodeObject:v8 forKey:@"firmwareVersion"];

  v9 = [(FMDExtAccessoryInfo *)self name];
  [v4 encodeObject:v9 forKey:@"name"];

  v10 = [(FMDExtAccessoryInfo *)self additionalInfo];
  [v4 encodeObject:v10 forKey:@"additionalInfo"];

  id v11 = [(FMDExtAccessoryInfo *)self deviceDiscoveryId];
  [v4 encodeObject:v11 forKey:@"deviceDiscoveryId"];
}

- (FMDExtAccessoryInfo)initWithCoder:(id)a3
{
  id v4 = a3;
  v17.receiver = self;
  v17.super_class = (Class)FMDExtAccessoryInfo;
  v5 = [(FMDExtAccessoryInfo *)&v17 init];
  if (v5)
  {
    v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"accessoryIdentifier"];
    [(FMDExtAccessoryInfo *)v5 setAccessoryIdentifier:v6];

    v7 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"accessoryType"];
    [(FMDExtAccessoryInfo *)v5 setAccessoryType:v7];

    v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"firmwareVersion"];
    [(FMDExtAccessoryInfo *)v5 setFirmwareVersion:v8];

    v9 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"name"];
    [(FMDExtAccessoryInfo *)v5 setName:v9];

    uint64_t v10 = objc_opt_class();
    uint64_t v11 = objc_opt_class();
    v12 = +[NSSet setWithObjects:](NSSet, "setWithObjects:", v10, v11, objc_opt_class(), 0);
    v13 = [v4 decodeObjectOfClasses:v12 forKey:@"serialNumbers"];
    [(FMDExtAccessoryInfo *)v5 setSerialNumbers:v13];

    v14 = [v4 decodeObjectOfClasses:v12 forKey:@"additionalInfo"];
    [(FMDExtAccessoryInfo *)v5 setAdditionalInfo:v14];

    v15 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"deviceDiscoveryId"];
    [(FMDExtAccessoryInfo *)v5 setDeviceDiscoveryId:v15];
  }
  return v5;
}

- (id)description
{
  v3 = [(FMDExtAccessoryInfo *)self accessoryIdentifier];
  id v4 = [(FMDExtAccessoryInfo *)self accessoryType];
  v5 = [(FMDExtAccessoryInfo *)self serialNumbers];
  v6 = [(FMDExtAccessoryInfo *)self firmwareVersion];
  v7 = [(FMDExtAccessoryInfo *)self name];
  v8 = [(FMDExtAccessoryInfo *)self additionalInfo];
  v9 = [(FMDExtAccessoryInfo *)self deviceDiscoveryId];
  uint64_t v10 = +[NSString stringWithFormat:@"accessory Info = (0x%lx)\n    accessoryIdentifier = %@\n    accessoryType = %@\n    serialNumbers = %@\n    firmwareVersion = %@\n    name = %@\n    additionalInfo = %@\n deviceDiscoveryId = %@\n", self, v3, v4, v5, v6, v7, v8, v9];

  return v10;
}

- (NSString)accessoryIdentifier
{
  return self->_accessoryIdentifier;
}

- (void)setAccessoryIdentifier:(id)a3
{
}

- (NSString)accessoryType
{
  return self->_accessoryType;
}

- (void)setAccessoryType:(id)a3
{
}

- (NSString)name
{
  return self->_name;
}

- (void)setName:(id)a3
{
}

- (NSDictionary)serialNumbers
{
  return self->_serialNumbers;
}

- (void)setSerialNumbers:(id)a3
{
}

- (NSString)firmwareVersion
{
  return self->_firmwareVersion;
}

- (void)setFirmwareVersion:(id)a3
{
}

- (NSString)deviceDiscoveryId
{
  return self->_deviceDiscoveryId;
}

- (void)setDeviceDiscoveryId:(id)a3
{
}

- (NSDictionary)additionalInfo
{
  return self->_additionalInfo;
}

- (void)setAdditionalInfo:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_additionalInfo, 0);
  objc_storeStrong((id *)&self->_deviceDiscoveryId, 0);
  objc_storeStrong((id *)&self->_firmwareVersion, 0);
  objc_storeStrong((id *)&self->_serialNumbers, 0);
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_accessoryType, 0);

  objc_storeStrong((id *)&self->_accessoryIdentifier, 0);
}

@end