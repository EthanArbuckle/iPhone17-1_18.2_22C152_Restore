@interface FMDMagSafeAccessory
+ (BOOL)supportsSecureCoding;
- (BOOL)findMyEnabled;
- (BOOL)isValid;
- (FMDMagSafeAccessory)initWithCoder:(id)a3;
- (FMDMagSafeAccessory)initWithPhysicalAccessory:(id)a3 fmEnabled:(BOOL)a4;
- (NSString)lastLostModeKeyRollTime;
- (NSString)style;
- (id)description;
- (void)encodeWithCoder:(id)a3;
- (void)setFindMyEnabled:(BOOL)a3;
- (void)setLastLostModeKeyRollTime:(id)a3;
- (void)setStyle:(id)a3;
@end

@implementation FMDMagSafeAccessory

- (BOOL)isValid
{
  unsigned int v4 = [(FMDMagSafeAccessory *)self findMyEnabled];
  if (v4)
  {
    v2 = [(FMDExtAccessoryInfo *)self name];
    if (!v2)
    {
      BOOL v10 = 1;
      goto LABEL_11;
    }
  }
  uint64_t v5 = [(FMDExtAccessoryInfo *)self serialNumbers];
  if (!v5)
  {
    BOOL v10 = 1;
    if (!v4) {
      return !v10;
    }
    goto LABEL_11;
  }
  v6 = (void *)v5;
  uint64_t v7 = [(FMDExtAccessoryInfo *)self accessoryIdentifier];
  if (v7)
  {
    v8 = (void *)v7;
    v9 = [(FMDExtAccessoryInfo *)self accessoryType];
    BOOL v10 = v9 == 0;

    if ((v4 & 1) == 0) {
      return !v10;
    }
    goto LABEL_11;
  }

  BOOL v10 = 1;
  if (v4) {
LABEL_11:
  }

  return !v10;
}

- (FMDMagSafeAccessory)initWithPhysicalAccessory:(id)a3 fmEnabled:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  v21.receiver = self;
  v21.super_class = (Class)FMDMagSafeAccessory;
  uint64_t v7 = [(FMDMagSafeAccessory *)&v21 init];
  if (v7)
  {
    v8 = [v6 serialNumber];
    v9 = +[FMDExtHelper deviceIDFromAddress:v8];
    [(FMDExtAccessoryInfo *)v7 setAccessoryIdentifier:v9];

    CFStringRef v22 = @"systemSerialNumber";
    BOOL v10 = [v6 serialNumber];
    v23 = v10;
    v11 = +[NSDictionary dictionaryWithObjects:&v23 forKeys:&v22 count:1];
    [(FMDExtAccessoryInfo *)v7 setSerialNumbers:v11];

    v12 = [v6 firmwareVersion];
    [(FMDExtAccessoryInfo *)v7 setFirmwareVersion:v12];

    v13 = [v6 style];
    [(FMDMagSafeAccessory *)v7 setStyle:v13];

    if ([v6 isMF4i])
    {
      v14 = [v6 accessoryType];
      v15 = +[NSString stringWithFormat:@"MFI4.0v1_%@", v14];
      v16 = +[FMDExtHelper _computehash:v15];
      [(FMDExtAccessoryInfo *)v7 setAccessoryType:v16];
    }
    else
    {
      v14 = [v6 accessoryType];
      [(FMDExtAccessoryInfo *)v7 setAccessoryType:v14];
    }

    v17 = [v6 serialNumber];
    [(FMDExtAccessoryInfo *)v7 setDeviceDiscoveryId:v17];

    if (v4)
    {
      v18 = [v6 name];
      [(FMDExtAccessoryInfo *)v7 setName:v18];
    }
    [(FMDMagSafeAccessory *)v7 setFindMyEnabled:v4];
  }
  if ([(FMDMagSafeAccessory *)v7 isValid]) {
    v19 = v7;
  }
  else {
    v19 = 0;
  }

  return v19;
}

- (id)description
{
  v3 = [(FMDExtAccessoryInfo *)self accessoryIdentifier];
  BOOL v4 = [(FMDExtAccessoryInfo *)self serialNumbers];
  uint64_t v5 = [(FMDExtAccessoryInfo *)self firmwareVersion];
  id v6 = [(FMDMagSafeAccessory *)self style];
  uint64_t v7 = +[NSString stringWithFormat:@"%@ %@ %@ %@", v3, v4, v5, v6];

  return v7;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(FMDExtAccessoryInfo *)self accessoryIdentifier];
  [v4 encodeObject:v5 forKey:@"accessoryIdentifier"];

  id v6 = [(FMDExtAccessoryInfo *)self accessoryType];
  [v4 encodeObject:v6 forKey:@"accessoryType"];

  uint64_t v7 = [(FMDExtAccessoryInfo *)self serialNumbers];
  [v4 encodeObject:v7 forKey:@"serialNumbers"];

  v8 = [(FMDExtAccessoryInfo *)self firmwareVersion];
  [v4 encodeObject:v8 forKey:@"firmwareVersion"];

  v9 = [(FMDExtAccessoryInfo *)self name];
  [v4 encodeObject:v9 forKey:@"name"];

  BOOL v10 = [(FMDMagSafeAccessory *)self style];
  [v4 encodeObject:v10 forKey:@"style"];

  v11 = [(FMDExtAccessoryInfo *)self additionalInfo];
  [v4 encodeObject:v11 forKey:@"additionalInfo"];

  v12 = [(FMDExtAccessoryInfo *)self deviceDiscoveryId];
  [v4 encodeObject:v12 forKey:@"deviceDiscoveryId"];

  [v4 encodeBool:[self findMyEnabled] forKey:@"findMyEnabled"];
  id v13 = [(FMDMagSafeAccessory *)self lastLostModeKeyRollTime];
  [v4 encodeObject:v13 forKey:@"lastLostModeKeyRollTime"];
}

- (FMDMagSafeAccessory)initWithCoder:(id)a3
{
  id v4 = a3;
  v19.receiver = self;
  v19.super_class = (Class)FMDMagSafeAccessory;
  uint64_t v5 = [(FMDMagSafeAccessory *)&v19 init];
  if (v5)
  {
    id v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"accessoryIdentifier"];
    [(FMDExtAccessoryInfo *)v5 setAccessoryIdentifier:v6];

    uint64_t v7 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"accessoryType"];
    [(FMDExtAccessoryInfo *)v5 setAccessoryType:v7];

    v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"firmwareVersion"];
    [(FMDExtAccessoryInfo *)v5 setFirmwareVersion:v8];

    v9 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"name"];
    [(FMDExtAccessoryInfo *)v5 setName:v9];

    BOOL v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"style"];
    [(FMDMagSafeAccessory *)v5 setStyle:v10];

    uint64_t v11 = objc_opt_class();
    uint64_t v12 = objc_opt_class();
    id v13 = +[NSSet setWithObjects:](NSSet, "setWithObjects:", v11, v12, objc_opt_class(), 0);
    v14 = [v4 decodeObjectOfClasses:v13 forKey:@"serialNumbers"];
    [(FMDExtAccessoryInfo *)v5 setSerialNumbers:v14];

    v15 = [v4 decodeObjectOfClasses:v13 forKey:@"additionalInfo"];
    [(FMDExtAccessoryInfo *)v5 setAdditionalInfo:v15];

    v16 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"deviceDiscoveryId"];
    [(FMDExtAccessoryInfo *)v5 setDeviceDiscoveryId:v16];

    -[FMDMagSafeAccessory setFindMyEnabled:](v5, "setFindMyEnabled:", [v4 decodeBoolForKey:@"findMyEnabled"]);
    v17 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"lastLostModeKeyRollTime"];
    [(FMDMagSafeAccessory *)v5 setLastLostModeKeyRollTime:v17];
  }
  return v5;
}

- (NSString)style
{
  return self->_style;
}

- (void)setStyle:(id)a3
{
}

- (BOOL)findMyEnabled
{
  return self->_findMyEnabled;
}

- (void)setFindMyEnabled:(BOOL)a3
{
  self->_findMyEnabled = a3;
}

- (NSString)lastLostModeKeyRollTime
{
  return self->_lastLostModeKeyRollTime;
}

- (void)setLastLostModeKeyRollTime:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lastLostModeKeyRollTime, 0);

  objc_storeStrong((id *)&self->_style, 0);
}

@end