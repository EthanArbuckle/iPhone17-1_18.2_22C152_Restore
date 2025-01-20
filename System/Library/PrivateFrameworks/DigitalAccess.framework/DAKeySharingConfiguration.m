@interface DAKeySharingConfiguration
+ (BOOL)supportsSecureCoding;
- (BOOL)enableVehicleEnteredPasscode;
- (BOOL)mockRefreshInstanceCA;
- (DAKeySharingConfiguration)initWithCoder:(id)a3;
- (DAKeySharingConfiguration)initWithProfile:(unint64_t)a3 displayName:(id)a4 metaData:(id)a5 targetDeviceType:(int64_t)a6;
- (DAKeySharingConfiguration)initWithProfile:(unint64_t)a3 displayName:(id)a4 metaData:(id)a5 targetDeviceType:(int64_t)a6 enableVehiclePasscode:(BOOL)a7 maxRetriesForDevicePasscode:(unint64_t)a8 deviceEnteredPasscode:(id)a9 proprietaryEntitlements:(id)a10;
- (NSData)metaData;
- (NSString)deviceEnteredPasscode;
- (NSString)displayName;
- (NSString)proprietaryEntitlements;
- (id)description;
- (int64_t)targetDeviceType;
- (unint64_t)keyRole;
- (unint64_t)maxRetriesForDeviceEnteredPasscode;
- (unint64_t)profile;
- (void)encodeWithCoder:(id)a3;
- (void)setKeyRole:(unint64_t)a3;
- (void)setMockRefreshInstanceCA:(BOOL)a3;
@end

@implementation DAKeySharingConfiguration

- (DAKeySharingConfiguration)initWithProfile:(unint64_t)a3 displayName:(id)a4 metaData:(id)a5 targetDeviceType:(int64_t)a6
{
  id v11 = a4;
  id v12 = a5;
  v18.receiver = self;
  v18.super_class = (Class)DAKeySharingConfiguration;
  v13 = [(DAKeySharingConfiguration *)&v18 init];
  v14 = v13;
  if (v13)
  {
    v13->_profile = a3;
    objc_storeStrong((id *)&v13->_displayName, a4);
    objc_storeStrong((id *)&v14->_metaData, a5);
    v14->_enableVehicleEnteredPasscode = 0;
    v14->_targetDeviceType = a6;
    v14->_maxRetriesForDeviceEnteredPasscode = 0;
    deviceEnteredPasscode = v14->_deviceEnteredPasscode;
    v14->_deviceEnteredPasscode = 0;

    proprietaryEntitlements = v14->_proprietaryEntitlements;
    v14->_proprietaryEntitlements = 0;

    v14->_mockRefreshInstanceCA = 0;
  }

  return v14;
}

- (DAKeySharingConfiguration)initWithProfile:(unint64_t)a3 displayName:(id)a4 metaData:(id)a5 targetDeviceType:(int64_t)a6 enableVehiclePasscode:(BOOL)a7 maxRetriesForDevicePasscode:(unint64_t)a8 deviceEnteredPasscode:(id)a9 proprietaryEntitlements:(id)a10
{
  id v23 = a4;
  id v15 = a5;
  id v16 = a9;
  id v17 = a10;
  v24.receiver = self;
  v24.super_class = (Class)DAKeySharingConfiguration;
  objc_super v18 = [(DAKeySharingConfiguration *)&v24 init];
  v19 = v18;
  if (v18)
  {
    v18->_profile = a3;
    objc_storeStrong((id *)&v18->_displayName, a4);
    objc_storeStrong((id *)&v19->_metaData, a5);
    v19->_enableVehicleEnteredPasscode = a7;
    v19->_targetDeviceType = a6;
    v19->_maxRetriesForDeviceEnteredPasscode = a8;
    objc_storeStrong((id *)&v19->_deviceEnteredPasscode, a9);
    objc_storeStrong((id *)&v19->_proprietaryEntitlements, a10);
    v19->_mockRefreshInstanceCA = 0;
    v19->_keyRole = 0;
  }

  return v19;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v8 = a3;
  objc_msgSend(v8, "encodeInteger:forKey:", -[DAKeySharingConfiguration profile](self, "profile"), @"profile");
  objc_msgSend(v8, "encodeInteger:forKey:", -[DAKeySharingConfiguration keyRole](self, "keyRole"), @"keyRole");
  v4 = [(DAKeySharingConfiguration *)self displayName];
  [v8 encodeObject:v4 forKey:@"displayName"];

  v5 = [(DAKeySharingConfiguration *)self metaData];
  [v8 encodeObject:v5 forKey:@"metaData"];

  objc_msgSend(v8, "encodeInteger:forKey:", -[DAKeySharingConfiguration targetDeviceType](self, "targetDeviceType"), @"targetDeviceType");
  objc_msgSend(v8, "encodeBool:forKey:", -[DAKeySharingConfiguration enableVehicleEnteredPasscode](self, "enableVehicleEnteredPasscode"), @"enableVehicleEnteredPasscode");
  objc_msgSend(v8, "encodeInteger:forKey:", -[DAKeySharingConfiguration maxRetriesForDeviceEnteredPasscode](self, "maxRetriesForDeviceEnteredPasscode"), @"maxRetriesForDeviceEnteredPasscode");
  v6 = [(DAKeySharingConfiguration *)self deviceEnteredPasscode];
  [v8 encodeObject:v6 forKey:@"deviceEnteredPasscode"];

  v7 = [(DAKeySharingConfiguration *)self proprietaryEntitlements];
  [v8 encodeObject:v7 forKey:@"proprietaryEntitlements"];

  objc_msgSend(v8, "encodeBool:forKey:", -[DAKeySharingConfiguration mockRefreshInstanceCA](self, "mockRefreshInstanceCA"), @"mockRefreshInstanceCA");
}

- (DAKeySharingConfiguration)initWithCoder:(id)a3
{
  id v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)DAKeySharingConfiguration;
  v5 = [(DAKeySharingConfiguration *)&v15 init];
  if (v5)
  {
    v5->_profile = [v4 decodeIntegerForKey:@"profile"];
    v5->_keyRole = [v4 decodeIntegerForKey:@"keyRole"];
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"displayName"];
    displayName = v5->_displayName;
    v5->_displayName = (NSString *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"metaData"];
    metaData = v5->_metaData;
    v5->_metaData = (NSData *)v8;

    v5->_targetDeviceType = [v4 decodeIntegerForKey:@"targetDeviceType"];
    v5->_enableVehicleEnteredPasscode = [v4 decodeBoolForKey:@"enableVehicleEnteredPasscode"];
    v5->_maxRetriesForDeviceEnteredPasscode = [v4 decodeIntegerForKey:@"maxRetriesForDeviceEnteredPasscode"];
    uint64_t v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"deviceEnteredPasscode"];
    deviceEnteredPasscode = v5->_deviceEnteredPasscode;
    v5->_deviceEnteredPasscode = (NSString *)v10;

    uint64_t v12 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"proprietaryEntitlements"];
    proprietaryEntitlements = v5->_proprietaryEntitlements;
    v5->_proprietaryEntitlements = (NSString *)v12;

    v5->_mockRefreshInstanceCA = [v4 decodeBoolForKey:@"mockRefreshInstanceCA"];
  }

  return v5;
}

- (id)description
{
  v3 = [MEMORY[0x263F089D8] string];
  id v4 = objc_msgSend(NSString, "stringWithFormat:", @"Sharing Profile       : %ld\n", self->_profile);
  [v3 appendString:v4];

  v5 = objc_msgSend(NSString, "stringWithFormat:", @"Key Role              : %ld\n", self->_keyRole);
  [v3 appendString:v5];

  uint64_t v6 = [NSString stringWithFormat:@"Display Name          : %@\n", self->_displayName];
  [v3 appendString:v6];

  v7 = [NSString stringWithFormat:@"Meta Data             : %@\n", self->_metaData];
  [v3 appendString:v7];

  uint64_t v8 = objc_msgSend(NSString, "stringWithFormat:", @"Target Device         : %ld\n", self->_targetDeviceType);
  [v3 appendString:v8];

  v9 = objc_msgSend(NSString, "stringWithFormat:", @"Enable VEP            : %d\n", self->_enableVehicleEnteredPasscode);
  [v3 appendString:v9];

  uint64_t v10 = objc_msgSend(NSString, "stringWithFormat:", @"Max PIN retries       : %ld\n", self->_maxRetriesForDeviceEnteredPasscode);
  [v3 appendString:v10];

  id v11 = objc_msgSend(NSString, "stringWithFormat:", @"PIN length            : %lu\n", -[NSString length](self->_deviceEnteredPasscode, "length"));
  [v3 appendString:v11];

  uint64_t v12 = [NSString stringWithFormat:@"Prop. Entitlements    : %@\n", self->_proprietaryEntitlements];
  [v3 appendString:v12];

  if (self->_mockRefreshInstanceCA) {
    [v3 appendString:@"Mock Refresh of Instance CA requested"];
  }

  return v3;
}

- (unint64_t)profile
{
  return self->_profile;
}

- (unint64_t)keyRole
{
  return self->_keyRole;
}

- (void)setKeyRole:(unint64_t)a3
{
  self->_keyRole = a3;
}

- (NSString)displayName
{
  return self->_displayName;
}

- (NSData)metaData
{
  return self->_metaData;
}

- (int64_t)targetDeviceType
{
  return self->_targetDeviceType;
}

- (BOOL)enableVehicleEnteredPasscode
{
  return self->_enableVehicleEnteredPasscode;
}

- (unint64_t)maxRetriesForDeviceEnteredPasscode
{
  return self->_maxRetriesForDeviceEnteredPasscode;
}

- (NSString)deviceEnteredPasscode
{
  return self->_deviceEnteredPasscode;
}

- (NSString)proprietaryEntitlements
{
  return self->_proprietaryEntitlements;
}

- (BOOL)mockRefreshInstanceCA
{
  return self->_mockRefreshInstanceCA;
}

- (void)setMockRefreshInstanceCA:(BOOL)a3
{
  self->_mockRefreshInstanceCA = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_proprietaryEntitlements, 0);
  objc_storeStrong((id *)&self->_deviceEnteredPasscode, 0);
  objc_storeStrong((id *)&self->_metaData, 0);

  objc_storeStrong((id *)&self->_displayName, 0);
}

@end