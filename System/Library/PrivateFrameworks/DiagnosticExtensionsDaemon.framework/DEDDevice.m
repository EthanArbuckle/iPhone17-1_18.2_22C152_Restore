@interface DEDDevice
+ (BOOL)supportsSecureCoding;
+ (id)_currentDeviceId;
+ (id)archivedClasses;
+ (id)currentDevice;
+ (id)currentDeviceWithDaemonInfo;
+ (id)deviceForSFDevice:(id)a3 andStatus:(int64_t)a4;
+ (id)deviceForSFDevice:(id)a3 systemInfo:(id)a4 andStatus:(int64_t)a5;
+ (id)deviceWithDictionary:(id)a3;
+ (id)idsDeviceWithDevice:(id)a3 address:(id)a4;
+ (id)nilSafeDevice;
- (BOOL)hasCapabilities:(id)a3;
- (BOOL)isCurrentDevice;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToDevice:(id)a3;
- (BOOL)isHomeKitResident;
- (BOOL)isLikeDevice:(id)a3;
- (BOOL)isMoreCompleteThan:(id)a3;
- (BOOL)isRemote;
- (BOOL)isTemporaryDevice;
- (DEDDevice)initWithCoder:(id)a3;
- (NSSet)bugSessions;
- (NSSet)capabilities;
- (NSString)_hashingKey;
- (NSString)address;
- (NSString)build;
- (NSString)color;
- (NSString)companionDeviceIdentifier;
- (NSString)description;
- (NSString)deviceClass;
- (NSString)enclosureColor;
- (NSString)hardwareCodename;
- (NSString)homeKitIdentifier;
- (NSString)homeTheaterSystemIdentifier;
- (NSString)homeTheaterSystemName;
- (NSString)identifier;
- (NSString)idsIdentifier;
- (NSString)mediaRemoteIdentifier;
- (NSString)mediaSystemIdentifier;
- (NSString)mediaSystemName;
- (NSString)model;
- (NSString)name;
- (NSString)platform;
- (NSString)productType;
- (NSString)publicLogSafeIdentifier;
- (NSString)serialNumber;
- (NSString)uniformTypeIdentifier;
- (SFDevice)sfDevice;
- (id)copyWithZone:(_NSZone *)a3;
- (id)hashingKey;
- (id)hashingKeyForTempDevice;
- (id)imageData;
- (id)imageURLForDeviceClass:(id)a3 deviceModel:(id)a4 deviceColor:(id)a5 size:(int64_t)a6 variant:(int64_t)a7 scale:(float)a8;
- (id)imageURLForScale:(float)a3;
- (id)publicLogDescription;
- (id)serialize;
- (int64_t)homeButtonType;
- (int64_t)mediaSystemRole;
- (int64_t)remoteTransport;
- (int64_t)status;
- (int64_t)transport;
- (void)encodeWithCoder:(id)a3;
- (void)fetchIconImageDataForScale:(float)a3 completionCompletion:(id)a4;
- (void)setAddress:(id)a3;
- (void)setBugSessions:(id)a3;
- (void)setBuild:(id)a3;
- (void)setCapabilities:(id)a3;
- (void)setColor:(id)a3;
- (void)setCompanionDeviceIdentifier:(id)a3;
- (void)setDeviceClass:(id)a3;
- (void)setEnclosureColor:(id)a3;
- (void)setHardwareCodename:(id)a3;
- (void)setHomeButtonType:(int64_t)a3;
- (void)setHomeKitIdentifier:(id)a3;
- (void)setHomeTheaterSystemIdentifier:(id)a3;
- (void)setHomeTheaterSystemName:(id)a3;
- (void)setIdentifier:(id)a3;
- (void)setIdsIdentifier:(id)a3;
- (void)setIsHomeKitResident:(BOOL)a3;
- (void)setMediaRemoteIdentifier:(id)a3;
- (void)setMediaSystemIdentifier:(id)a3;
- (void)setMediaSystemName:(id)a3;
- (void)setMediaSystemRole:(int64_t)a3;
- (void)setModel:(id)a3;
- (void)setName:(id)a3;
- (void)setPlatform:(id)a3;
- (void)setProductType:(id)a3;
- (void)setRemoteTransport:(int64_t)a3;
- (void)setSerialNumber:(id)a3;
- (void)setSfDevice:(id)a3;
- (void)setStatus:(int64_t)a3;
- (void)setTransport:(int64_t)a3;
- (void)setUniformTypeIdentifier:(id)a3;
- (void)set_hashingKey:(id)a3;
@end

@implementation DEDDevice

+ (id)archivedClasses
{
  v2 = (void *)MEMORY[0x263EFFA08];
  uint64_t v3 = objc_opt_class();
  uint64_t v4 = objc_opt_class();
  uint64_t v5 = objc_opt_class();
  return (id)objc_msgSend(v2, "setWithObjects:", v3, v4, v5, objc_opt_class(), 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(DEDDevice *)self address];
  [v4 encodeObject:v5 forKey:@"address"];

  v6 = [(DEDDevice *)self build];
  [v4 encodeObject:v6 forKey:@"build"];

  v7 = [(DEDDevice *)self color];
  [v4 encodeObject:v7 forKey:@"color"];

  v8 = [(DEDDevice *)self deviceClass];
  [v4 encodeObject:v8 forKey:@"deviceClass"];

  v9 = [(DEDDevice *)self enclosureColor];
  [v4 encodeObject:v9 forKey:@"enclosureColor"];

  v10 = [(DEDDevice *)self identifier];
  [v4 encodeObject:v10 forKey:@"identifier"];

  v11 = [(DEDDevice *)self model];
  [v4 encodeObject:v11 forKey:@"model"];

  v12 = [(DEDDevice *)self name];
  [v4 encodeObject:v12 forKey:@"name"];

  v13 = [(DEDDevice *)self productType];
  [v4 encodeObject:v13 forKey:@"productType"];

  objc_msgSend(v4, "encodeInteger:forKey:", -[DEDDevice status](self, "status"), @"status");
  objc_msgSend(v4, "encodeInteger:forKey:", -[DEDDevice transport](self, "transport"), @"transport");
  v14 = [(DEDDevice *)self platform];
  [v4 encodeObject:v14 forKey:@"platform"];

  objc_msgSend(v4, "encodeInteger:forKey:", -[DEDDevice remoteTransport](self, "remoteTransport"), @"remoteTransport");
  v15 = [(DEDDevice *)self capabilities];
  v16 = +[DEDCapability encodeCapabilitySet:v15];
  [v4 encodeObject:v16 forKey:@"capabilities"];

  v17 = [(DEDDevice *)self hardwareCodename];
  [v4 encodeObject:v17 forKey:@"hardwareCodename"];

  v18 = [(DEDDevice *)self serialNumber];
  [v4 encodeObject:v18 forKey:@"serialNumber"];

  objc_msgSend(v4, "encodeInteger:forKey:", -[DEDDevice homeButtonType](self, "homeButtonType"), @"homeButtonType");
  v19 = [(DEDDevice *)self uniformTypeIdentifier];
  [v4 encodeObject:v19 forKey:@"uniformTypeIdentifier"];

  v20 = [(DEDDevice *)self idsIdentifier];
  [v4 encodeObject:v20 forKey:@"idsIdentifier"];

  v21 = [(DEDDevice *)self companionDeviceIdentifier];
  [v4 encodeObject:v21 forKey:@"companionDeviceIdentifier"];

  v22 = [(DEDDevice *)self homeTheaterSystemName];
  [v4 encodeObject:v22 forKey:@"homeTheaterSystemName"];

  v23 = [(DEDDevice *)self homeTheaterSystemIdentifier];
  [v4 encodeObject:v23 forKey:@"homeTheaterSystemIdentifier"];

  v24 = [(DEDDevice *)self mediaSystemName];
  [v4 encodeObject:v24 forKey:@"mediaSystemName"];

  objc_msgSend(v4, "encodeInteger:forKey:", -[DEDDevice mediaSystemRole](self, "mediaSystemRole"), @"mediaSystemRole");
  v25 = [(DEDDevice *)self mediaSystemIdentifier];
  [v4 encodeObject:v25 forKey:@"mediaSystemIdentifier"];

  v26 = [(DEDDevice *)self mediaRemoteIdentifier];
  [v4 encodeObject:v26 forKey:@"mediaRemoteIdentifier"];

  v27 = [(DEDDevice *)self homeKitIdentifier];
  [v4 encodeObject:v27 forKey:@"homeKitIdentifier"];

  objc_msgSend(v4, "encodeBool:forKey:", -[DEDDevice isHomeKitResident](self, "isHomeKitResident"), @"isHomeKitResident");
  id v28 = [(DEDDevice *)self bugSessions];
  [v4 encodeObject:v28 forKey:@"bugSessions"];
}

- (DEDDevice)initWithCoder:(id)a3
{
  id v4 = a3;
  v57.receiver = self;
  v57.super_class = (Class)DEDDevice;
  uint64_t v5 = [(DEDDevice *)&v57 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"address"];
    address = v5->_address;
    v5->_address = (NSString *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"build"];
    build = v5->_build;
    v5->_build = (NSString *)v8;

    uint64_t v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"color"];
    color = v5->_color;
    v5->_color = (NSString *)v10;

    uint64_t v12 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"deviceClass"];
    deviceClass = v5->_deviceClass;
    v5->_deviceClass = (NSString *)v12;

    uint64_t v14 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"enclosureColor"];
    enclosureColor = v5->_enclosureColor;
    v5->_enclosureColor = (NSString *)v14;

    uint64_t v16 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"identifier"];
    identifier = v5->_identifier;
    v5->_identifier = (NSString *)v16;

    uint64_t v18 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"model"];
    model = v5->_model;
    v5->_model = (NSString *)v18;

    uint64_t v20 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"name"];
    name = v5->_name;
    v5->_name = (NSString *)v20;

    uint64_t v22 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"productType"];
    productType = v5->_productType;
    v5->_productType = (NSString *)v22;

    v5->_status = [v4 decodeIntegerForKey:@"status"];
    v5->_transport = [v4 decodeIntegerForKey:@"transport"];
    uint64_t v24 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"platform"];
    platform = v5->_platform;
    v5->_platform = (NSString *)v24;

    v5->_remoteTransport = [v4 decodeIntegerForKey:@"remoteTransport"];
    v26 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"capabilities"];
    if (v26) {
      +[DEDCapability decodeCapabilitiesString:v26];
    }
    else {
    uint64_t v27 = +[DEDCapability defaultCapabilities];
    }
    capabilities = v5->_capabilities;
    v5->_capabilities = (NSSet *)v27;

    uint64_t v29 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"hardwareCodename"];
    hardwareCodename = v5->_hardwareCodename;
    v5->_hardwareCodename = (NSString *)v29;

    uint64_t v31 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"serialNumber"];
    serialNumber = v5->_serialNumber;
    v5->_serialNumber = (NSString *)v31;

    v5->_homeButtonType = [v4 decodeIntegerForKey:@"homeButtonType"];
    uint64_t v33 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"uniformTypeIdentifier"];
    uniformTypeIdentifier = v5->_uniformTypeIdentifier;
    v5->_uniformTypeIdentifier = (NSString *)v33;

    uint64_t v35 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"idsIdentifier"];
    idsIdentifier = v5->_idsIdentifier;
    v5->_idsIdentifier = (NSString *)v35;

    uint64_t v37 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"companionDeviceIdentifier"];
    companionDeviceIdentifier = v5->_companionDeviceIdentifier;
    v5->_companionDeviceIdentifier = (NSString *)v37;

    uint64_t v39 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"homeTheaterSystemName"];
    homeTheaterSystemName = v5->_homeTheaterSystemName;
    v5->_homeTheaterSystemName = (NSString *)v39;

    uint64_t v41 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"homeTheaterSystemIdentifier"];
    homeTheaterSystemIdentifier = v5->_homeTheaterSystemIdentifier;
    v5->_homeTheaterSystemIdentifier = (NSString *)v41;

    uint64_t v43 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"mediaSystemName"];
    mediaSystemName = v5->_mediaSystemName;
    v5->_mediaSystemName = (NSString *)v43;

    v5->_mediaSystemRole = [v4 decodeIntegerForKey:@"mediaSystemRole"];
    uint64_t v45 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"mediaSystemIdentifier"];
    mediaSystemIdentifier = v5->_mediaSystemIdentifier;
    v5->_mediaSystemIdentifier = (NSString *)v45;

    uint64_t v47 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"mediaRemoteIdentifier"];
    mediaRemoteIdentifier = v5->_mediaRemoteIdentifier;
    v5->_mediaRemoteIdentifier = (NSString *)v47;

    uint64_t v49 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"homeKitIdentifier"];
    homeKitIdentifier = v5->_homeKitIdentifier;
    v5->_homeKitIdentifier = (NSString *)v49;

    v5->_isHomeKitResident = [v4 decodeBoolForKey:@"isHomeKitResident"];
    v51 = (void *)MEMORY[0x263EFFA08];
    uint64_t v52 = objc_opt_class();
    v53 = objc_msgSend(v51, "setWithObjects:", v52, objc_opt_class(), 0);
    uint64_t v54 = [v4 decodeObjectOfClasses:v53 forKey:@"bugSessions"];
    bugSessions = v5->_bugSessions;
    v5->_bugSessions = (NSSet *)v54;
  }
  return v5;
}

+ (id)currentDevice
{
  v2 = objc_opt_new();
  [v2 setAddress:&stru_26D197018];
  uint64_t v3 = +[DEDUtils osBuild];
  [v2 setBuild:v3];

  id v4 = +[DEDUtils deviceColor];
  uint64_t v5 = stringIfNil(v4);
  [v2 setColor:v5];

  uint64_t v6 = +[DEDUtils deviceClass];
  v7 = stringIfNil(v6);
  [v2 setDeviceClass:v7];

  uint64_t v8 = +[DEDUtils deviceEnclosureColor];
  v9 = stringIfNil(v8);
  [v2 setEnclosureColor:v9];

  uint64_t v10 = NSString;
  v11 = +[DEDUtils uniqueDeviceSpecifier];
  uint64_t v12 = [v10 stringWithFormat:@"ded:%@", v11];
  [v2 setIdentifier:v12];

  v13 = +[DEDUtils deviceModel];
  uint64_t v14 = stringIfNil(v13);
  [v2 setModel:v14];

  v15 = +[DEDUtils deviceName];
  uint64_t v16 = stringIfNil(v15);
  [v2 setName:v16];

  v17 = +[DEDUtils deviceProductType];
  uint64_t v18 = stringIfNil(v17);
  [v2 setProductType:v18];

  [v2 setStatus:1];
  [v2 setTransport:1];
  v19 = +[DEDUtils platform];
  uint64_t v20 = stringIfNil(v19);
  [v2 setPlatform:v20];

  [v2 setRemoteTransport:1];
  v21 = +[DEDCapability allCapabilities];
  [v2 setCapabilities:v21];

  uint64_t v22 = +[DEDUtils deviceUniformTypeIdentifier];
  [v2 setUniformTypeIdentifier:v22];

  return v2;
}

+ (id)deviceWithDictionary:(id)a3
{
  id v3 = a3;
  id v4 = objc_opt_new();
  uint64_t v5 = [v3 objectForKeyedSubscript:@"address"];
  uint64_t v6 = stringIfNil(v5);
  [v4 setAddress:v6];

  v7 = [v3 objectForKeyedSubscript:@"build"];
  uint64_t v8 = stringIfNil(v7);
  [v4 setBuild:v8];

  v9 = [v3 objectForKeyedSubscript:@"color"];
  uint64_t v10 = stringIfNil(v9);
  [v4 setColor:v10];

  v11 = [v3 objectForKeyedSubscript:@"deviceClass"];
  uint64_t v12 = stringIfNil(v11);
  [v4 setDeviceClass:v12];

  v13 = [v3 objectForKeyedSubscript:@"enclosureColor"];
  uint64_t v14 = stringIfNil(v13);
  [v4 setEnclosureColor:v14];

  v15 = [v3 objectForKeyedSubscript:@"identifier"];
  uint64_t v16 = stringIfNil(v15);
  [v4 setIdentifier:v16];

  v17 = [v3 objectForKeyedSubscript:@"model"];
  uint64_t v18 = stringIfNil(v17);
  [v4 setModel:v18];

  v19 = [v3 objectForKeyedSubscript:@"name"];
  uint64_t v20 = stringIfNil(v19);
  [v4 setName:v20];

  v21 = [v3 objectForKeyedSubscript:@"productType"];
  uint64_t v22 = stringIfNil(v21);
  [v4 setProductType:v22];

  v23 = [v3 objectForKeyedSubscript:@"status"];
  objc_msgSend(v4, "setStatus:", objc_msgSend(v23, "integerValue"));

  uint64_t v24 = [v3 objectForKeyedSubscript:@"transport"];
  objc_msgSend(v4, "setTransport:", objc_msgSend(v24, "integerValue"));

  v25 = [v3 objectForKeyedSubscript:@"platform"];
  v26 = stringIfNil(v25);
  [v4 setPlatform:v26];

  uint64_t v27 = [v3 objectForKeyedSubscript:@"remoteTransport"];
  objc_msgSend(v4, "setRemoteTransport:", objc_msgSend(v27, "integerValue"));

  id v28 = [v3 objectForKeyedSubscript:@"capabilities"];
  if (v28) {
    +[DEDCapability decodeCapabilitiesString:v28];
  }
  else {
  uint64_t v29 = +[DEDCapability defaultCapabilities];
  }
  [v4 setCapabilities:v29];

  v30 = [v3 objectForKeyedSubscript:@"hardwareCodename"];
  [v4 setHardwareCodename:v30];

  uint64_t v31 = [v3 objectForKeyedSubscript:@"serialNumber"];
  [v4 setSerialNumber:v31];

  v32 = [v3 objectForKeyedSubscript:@"homeButtonType"];
  objc_msgSend(v4, "setHomeButtonType:", objc_msgSend(v32, "integerValue"));

  uint64_t v33 = [v3 objectForKeyedSubscript:@"uniformTypeIdentifier"];
  [v4 setUniformTypeIdentifier:v33];

  v34 = [v3 objectForKeyedSubscript:@"idsIdentifier"];
  [v4 setIdsIdentifier:v34];

  uint64_t v35 = [v3 objectForKeyedSubscript:@"companionDeviceIdentifier"];
  [v4 setCompanionDeviceIdentifier:v35];

  v36 = [v3 objectForKeyedSubscript:@"homeTheaterSystemName"];
  [v4 setHomeTheaterSystemName:v36];

  uint64_t v37 = [v3 objectForKeyedSubscript:@"homeTheaterSystemIdentifier"];
  [v4 setHomeTheaterSystemIdentifier:v37];

  v38 = [v3 objectForKeyedSubscript:@"mediaSystemName"];
  [v4 setMediaSystemName:v38];

  uint64_t v39 = [v3 objectForKeyedSubscript:@"mediaSystemRole"];
  objc_msgSend(v4, "setMediaSystemRole:", objc_msgSend(v39, "integerValue"));

  v40 = [v3 objectForKeyedSubscript:@"mediaSystemIdentifier"];
  [v4 setMediaSystemIdentifier:v40];

  uint64_t v41 = [v3 objectForKeyedSubscript:@"mediaRemoteIdentifier"];
  [v4 setMediaRemoteIdentifier:v41];

  v42 = [v3 objectForKeyedSubscript:@"homeKitIdentifier"];
  [v4 setHomeKitIdentifier:v42];

  uint64_t v43 = [v3 objectForKeyedSubscript:@"isHomeKitResident"];
  objc_msgSend(v4, "setIsHomeKitResident:", objc_msgSend(v43, "BOOLValue"));

  v44 = [v3 objectForKeyedSubscript:@"bugSessions"];

  if (v44)
  {
    uint64_t v45 = (void *)MEMORY[0x263EFFA08];
    v46 = [v3 objectForKeyedSubscript:@"bugSessions"];
    uint64_t v47 = [v45 setWithArray:v46];
    [v4 setBugSessions:v47];
  }
  return v4;
}

+ (id)deviceForSFDevice:(id)a3 andStatus:(int64_t)a4
{
  id v5 = a3;
  uint64_t v6 = +[DEDDevice nilSafeDevice];
  if (v6)
  {
    v7 = [v5 identifier];
    uint64_t v8 = [v7 UUIDString];
    v9 = stringIfNil(v8);
    [v6 setIdentifier:v9];

    uint64_t v10 = [v5 identifier];
    v11 = [v10 UUIDString];
    uint64_t v12 = stringIfNil(v11);
    [v6 setAddress:v12];

    [v6 setBuild:&stru_26D197018];
    v13 = [v5 model];
    uint64_t v14 = +[DEDUtils deviceClassForProductType:v13];
    [v6 setDeviceClass:v14];

    v15 = [v5 name];
    uint64_t v16 = stringIfNil(v15);
    [v6 setName:v16];

    v17 = [v5 model];
    uint64_t v18 = stringIfNil(v17);
    [v6 setModel:v18];

    [v6 setStatus:a4];
    [v6 setTransport:3];
    [v6 setRemoteTransport:3];
    v19 = +[DEDCapability defaultCapabilities];
    [v6 setCapabilities:v19];

    [v6 setSfDevice:v5];
  }

  return v6;
}

+ (id)deviceForSFDevice:(id)a3 systemInfo:(id)a4 andStatus:(int64_t)a5
{
  id v7 = a3;
  id v8 = a4;
  v9 = +[DEDDevice nilSafeDevice];
  if (v9)
  {
    uint64_t v10 = [v7 identifier];
    v11 = [v10 UUIDString];
    uint64_t v12 = stringIfNil(v11);
    [v9 setIdentifier:v12];

    v13 = [v7 identifier];
    uint64_t v14 = [v13 UUIDString];
    v15 = stringIfNil(v14);
    [v9 setAddress:v15];

    uint64_t v16 = [v8 objectForKeyedSubscript:@"osBuild"];
    v17 = stringIfNil(v16);
    [v9 setBuild:v17];

    uint64_t v18 = [v8 objectForKeyedSubscript:@"model"];
    v19 = +[DEDUtils deviceClassForProductType:v18];
    [v9 setDeviceClass:v19];

    uint64_t v20 = [v8 objectForKeyedSubscript:@"name"];
    v21 = stringIfNil(v20);
    [v9 setName:v21];

    uint64_t v22 = [v7 model];
    if (v22
      && (v23 = (void *)v22,
          [v7 model],
          uint64_t v24 = objc_claimAutoreleasedReturnValue(),
          uint64_t v25 = [v24 length],
          v24,
          v23,
          v25))
    {
      v26 = [v7 model];
      uint64_t v27 = stringIfNil(v26);
    }
    else
    {
      v26 = [v8 objectForKeyedSubscript:@"model"];
      uint64_t v27 = +[DEDUtils modelForProductType:v26];
    }
    id v28 = (void *)v27;
    [v9 setModel:v27];

    uint64_t v29 = [v8 objectForKeyedSubscript:@"model"];
    v30 = stringIfNil(v29);
    [v9 setProductType:v30];

    [v9 setTransport:3];
    [v9 setRemoteTransport:3];
    [v9 setStatus:a5];
    uint64_t v31 = +[DEDCapability defaultCapabilities];
    [v9 setCapabilities:v31];

    [v9 setSfDevice:v7];
  }

  return v9;
}

+ (id)idsDeviceWithDevice:(id)a3 address:(id)a4
{
  id v5 = a3;
  uint64_t v6 = (__CFString *)a4;
  id v7 = +[DEDDevice nilSafeDevice];
  if (v7)
  {
    id v8 = stringIfNil(v6);
    [v7 setIdentifier:v8];

    v9 = stringIfNil(v6);
    [v7 setAddress:v9];

    uint64_t v10 = [v5 productBuildVersion];
    v11 = stringIfNil(v10);
    [v7 setBuild:v11];

    uint64_t v12 = [v5 modelIdentifier];
    v13 = +[DEDUtils deviceClassForProductType:v12];
    [v7 setDeviceClass:v13];

    uint64_t v14 = [v5 name];
    v15 = stringIfNil(v14);
    [v7 setName:v15];

    uint64_t v16 = [v5 productName];
    v17 = stringIfNil(v16);
    [v7 setModel:v17];

    uint64_t v18 = [v5 modelIdentifier];
    v19 = stringIfNil(v18);
    [v7 setProductType:v19];

    [v7 setTransport:4];
    [v7 setRemoteTransport:4];
    [v7 setStatus:3];
    uint64_t v20 = +[DEDCapability defaultCapabilities];
    [v7 setCapabilities:v20];

    v21 = [v5 uniqueIDOverride];
    [v7 setIdsIdentifier:v21];
  }
  return v7;
}

- (id)serialize
{
  id v3 = [MEMORY[0x263EFF9A0] dictionary];
  id v4 = [(DEDDevice *)self address];
  id v5 = stringIfNil(v4);
  [v3 setObject:v5 forKeyedSubscript:@"address"];

  uint64_t v6 = [(DEDDevice *)self build];
  id v7 = stringIfNil(v6);
  [v3 setObject:v7 forKeyedSubscript:@"build"];

  id v8 = [(DEDDevice *)self color];
  v9 = stringIfNil(v8);
  [v3 setObject:v9 forKeyedSubscript:@"color"];

  uint64_t v10 = [(DEDDevice *)self deviceClass];
  v11 = stringIfNil(v10);
  [v3 setObject:v11 forKeyedSubscript:@"deviceClass"];

  uint64_t v12 = [(DEDDevice *)self enclosureColor];
  v13 = stringIfNil(v12);
  [v3 setObject:v13 forKeyedSubscript:@"enclosureColor"];

  uint64_t v14 = [(DEDDevice *)self identifier];
  v15 = stringIfNil(v14);
  [v3 setObject:v15 forKeyedSubscript:@"identifier"];

  uint64_t v16 = [(DEDDevice *)self model];
  v17 = stringIfNil(v16);
  [v3 setObject:v17 forKeyedSubscript:@"model"];

  uint64_t v18 = [(DEDDevice *)self name];
  v19 = stringIfNil(v18);
  [v3 setObject:v19 forKeyedSubscript:@"name"];

  uint64_t v20 = [(DEDDevice *)self productType];
  v21 = stringIfNil(v20);
  [v3 setObject:v21 forKeyedSubscript:@"productType"];

  uint64_t v22 = objc_msgSend(NSNumber, "numberWithInteger:", -[DEDDevice status](self, "status"));
  [v3 setObject:v22 forKeyedSubscript:@"status"];

  v23 = objc_msgSend(NSNumber, "numberWithInteger:", -[DEDDevice transport](self, "transport"));
  [v3 setObject:v23 forKeyedSubscript:@"transport"];

  uint64_t v24 = [(DEDDevice *)self platform];
  uint64_t v25 = stringIfNil(v24);
  [v3 setObject:v25 forKeyedSubscript:@"platform"];

  v26 = objc_msgSend(NSNumber, "numberWithInteger:", -[DEDDevice remoteTransport](self, "remoteTransport"));
  [v3 setObject:v26 forKeyedSubscript:@"remoteTransport"];

  uint64_t v27 = [(DEDDevice *)self capabilities];
  id v28 = +[DEDCapability encodeCapabilitySet:v27];
  [v3 setObject:v28 forKeyedSubscript:@"capabilities"];

  uint64_t v29 = [(DEDDevice *)self hardwareCodename];
  [v3 setObject:v29 forKeyedSubscript:@"hardwareCodename"];

  v30 = [(DEDDevice *)self serialNumber];
  [v3 setObject:v30 forKeyedSubscript:@"serialNumber"];

  uint64_t v31 = objc_msgSend(NSNumber, "numberWithInteger:", -[DEDDevice homeButtonType](self, "homeButtonType"));
  [v3 setObject:v31 forKeyedSubscript:@"homeButtonType"];

  v32 = [(DEDDevice *)self uniformTypeIdentifier];
  [v3 setObject:v32 forKeyedSubscript:@"uniformTypeIdentifier"];

  uint64_t v33 = [(DEDDevice *)self idsIdentifier];
  [v3 setObject:v33 forKeyedSubscript:@"idsIdentifier"];

  v34 = [(DEDDevice *)self companionDeviceIdentifier];
  [v3 setObject:v34 forKeyedSubscript:@"companionDeviceIdentifier"];

  uint64_t v35 = [(DEDDevice *)self homeTheaterSystemName];
  [v3 setObject:v35 forKeyedSubscript:@"homeTheaterSystemName"];

  v36 = [(DEDDevice *)self homeTheaterSystemIdentifier];
  [v3 setObject:v36 forKeyedSubscript:@"homeTheaterSystemIdentifier"];

  uint64_t v37 = [(DEDDevice *)self mediaSystemName];
  [v3 setObject:v37 forKeyedSubscript:@"mediaSystemName"];

  v38 = objc_msgSend(NSNumber, "numberWithInteger:", -[DEDDevice mediaSystemRole](self, "mediaSystemRole"));
  [v3 setObject:v38 forKeyedSubscript:@"mediaSystemRole"];

  uint64_t v39 = [(DEDDevice *)self mediaSystemIdentifier];
  [v3 setObject:v39 forKeyedSubscript:@"mediaSystemIdentifier"];

  v40 = [(DEDDevice *)self mediaRemoteIdentifier];
  [v3 setObject:v40 forKeyedSubscript:@"mediaRemoteIdentifier"];

  uint64_t v41 = [(DEDDevice *)self homeKitIdentifier];
  [v3 setObject:v41 forKeyedSubscript:@"homeKitIdentifier"];

  v42 = objc_msgSend(NSNumber, "numberWithBool:", -[DEDDevice isHomeKitResident](self, "isHomeKitResident"));
  [v3 setObject:v42 forKeyedSubscript:@"isHomeKitResident"];

  uint64_t v43 = [(DEDDevice *)self bugSessions];

  if (v43)
  {
    v44 = [(DEDDevice *)self bugSessions];
    uint64_t v45 = [v44 allObjects];
    [v3 setObject:v45 forKeyedSubscript:@"bugSessions"];
  }
  return v3;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v3 = [(DEDDevice *)self serialize];
  id v4 = +[DEDDevice deviceWithDictionary:v3];

  return v4;
}

+ (id)_currentDeviceId
{
  if (_currentDeviceId_onceToken != -1) {
    dispatch_once(&_currentDeviceId_onceToken, &__block_literal_global_10);
  }
  v2 = (void *)_currentDeviceId_selfIdentifier;
  return v2;
}

void __29__DEDDevice__currentDeviceId__block_invoke()
{
  id v2 = +[DEDDevice currentDevice];
  uint64_t v0 = [v2 identifier];
  v1 = (void *)_currentDeviceId_selfIdentifier;
  _currentDeviceId_selfIdentifier = v0;
}

- (BOOL)isCurrentDevice
{
  id v2 = [(DEDDevice *)self identifier];
  id v3 = [(id)objc_opt_class() _currentDeviceId];
  char v4 = [v2 isEqualToString:v3];

  return v4;
}

- (NSString)description
{
  id v3 = [MEMORY[0x263F089D8] string];
  char v4 = [(DEDDevice *)self platform];
  id v5 = [(DEDDevice *)self build];
  uint64_t v6 = [(DEDDevice *)self productType];
  int64_t v7 = [(DEDDevice *)self status];
  if ((unint64_t)(v7 - 1) > 3) {
    id v8 = "Unknown";
  }
  else {
    id v8 = off_26453B140[v7 - 1];
  }
  [v3 appendFormat:@"\nDEDDevice: %@ %@ (%@) -- %s", v4, v5, v6, v8];

  unint64_t v9 = [(DEDDevice *)self transport];
  if (v9 > 4) {
    uint64_t v10 = "Unknown";
  }
  else {
    uint64_t v10 = off_26453B160[v9];
  }
  v11 = [(DEDDevice *)self publicLogSafeIdentifier];
  [v3 appendFormat:@"\n%s (%@)", v10, v11];

  uint64_t v12 = [NSString stringWithString:v3];

  return (NSString *)v12;
}

- (id)publicLogDescription
{
  id v3 = NSString;
  char v4 = [(DEDDevice *)self productType];
  id v5 = [(DEDDevice *)self name];
  uint64_t v6 = [v3 stringWithFormat:@"%@ - %@", v4, v5];

  return v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    unsigned __int8 v5 = [(DEDDevice *)self isEqualToDevice:v4];
  }
  else
  {
    v8.receiver = self;
    v8.super_class = (Class)DEDDevice;
    unsigned __int8 v5 = [(DEDDevice *)&v8 isEqual:v4];
  }
  BOOL v6 = v5;

  return v6;
}

- (BOOL)isEqualToDevice:(id)a3
{
  if (self == a3) {
    return 1;
  }
  id v4 = [a3 identifier];
  unsigned __int8 v5 = [(DEDDevice *)self identifier];
  char v6 = [v4 isEqualToString:v5];

  return v6;
}

- (id)hashingKey
{
  id v3 = [(DEDDevice *)self _hashingKey];

  if (!v3)
  {
    if ([(DEDDevice *)self isCurrentDevice])
    {
      id v4 = [(DEDDevice *)self identifier];
      unsigned __int8 v5 = [NSString stringWithFormat:@"%i-%@", 1, v4];
    }
    else
    {
      BOOL v6 = [(DEDDevice *)self isTemporaryDevice];
      id v4 = [(DEDDevice *)self identifier];
      int64_t v7 = [(DEDDevice *)self remoteTransport];
      unsigned __int8 v5 = [NSString stringWithFormat:@"%i-%@", v7, v4];
      if (v6)
      {

        goto LABEL_8;
      }
    }
    [(DEDDevice *)self set_hashingKey:v5];
  }
  unsigned __int8 v5 = [(DEDDevice *)self _hashingKey];
LABEL_8:
  return v5;
}

- (BOOL)isLikeDevice:(id)a3
{
  id v4 = a3;
  unsigned __int8 v5 = [v4 deviceClass];
  if (![v5 length])
  {
    char v13 = 0;
LABEL_13:

    goto LABEL_14;
  }
  BOOL v6 = [v4 name];
  if (![v6 length]) {
    goto LABEL_8;
  }
  int64_t v7 = [v4 build];
  uint64_t v8 = [v7 length];

  if (v8)
  {
    unsigned __int8 v5 = [(DEDDevice *)self deviceClass];
    BOOL v6 = [v4 deviceClass];
    if ([v5 isEqualToString:v6])
    {
      unint64_t v9 = [(DEDDevice *)self name];
      uint64_t v10 = [v4 name];
      if ([v9 isEqualToString:v10])
      {
        v11 = [(DEDDevice *)self build];
        uint64_t v12 = [v4 build];
        char v13 = [v11 isEqualToString:v12];
      }
      else
      {
        char v13 = 0;
      }

      goto LABEL_12;
    }
LABEL_8:
    char v13 = 0;
LABEL_12:

    goto LABEL_13;
  }
  char v13 = 0;
LABEL_14:

  return v13;
}

- (BOOL)isMoreCompleteThan:(id)a3
{
  id v4 = a3;
  int v5 = [(DEDDevice *)self isTemporaryDevice];
  LODWORD(v6) = [v4 isTemporaryDevice];
  if (v5 == v6)
  {
    int64_t v7 = [(DEDDevice *)self serialize];
    uint64_t v6 = __32__DEDDevice_isMoreCompleteThan___block_invoke((uint64_t)v7, v7);
    uint64_t v8 = [v4 serialize];
    LOBYTE(v6) = v6 > __32__DEDDevice_isMoreCompleteThan___block_invoke((uint64_t)v8, v8);
  }
  return v6;
}

uint64_t __32__DEDDevice_isMoreCompleteThan___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v12 = a2;
  id v2 = [v12 allValues];
  uint64_t v3 = [v2 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    int v5 = 0;
    uint64_t v6 = 0;
    uint64_t v7 = *(void *)v14;
    do
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v14 != v7) {
          objc_enumerationMutation(v2);
        }
        unint64_t v9 = *(void **)(*((void *)&v13 + 1) + 8 * i);
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          id v10 = v9;

          if (([v10 isEqualToString:@"unspecified"] & 1) == 0
            && ([v10 isEqualToString:@"unknown"] & 1) == 0)
          {
            v6 += [v10 length];
          }
          int v5 = v10;
        }
      }
      uint64_t v4 = [v2 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v4);
  }
  else
  {
    int v5 = 0;
    uint64_t v6 = 0;
  }

  return v6;
}

+ (id)nilSafeDevice
{
  id v2 = objc_opt_new();
  [v2 setAddress:&stru_26D197018];
  [v2 setBuild:&stru_26D197018];
  [v2 setColor:&stru_26D197018];
  [v2 setDeviceClass:&stru_26D197018];
  [v2 setEnclosureColor:&stru_26D197018];
  [v2 setIdentifier:&stru_26D197018];
  [v2 setModel:&stru_26D197018];
  [v2 setName:&stru_26D197018];
  [v2 setProductType:&stru_26D197018];
  [v2 setPlatform:&stru_26D197018];
  [v2 setSfDevice:0];
  uint64_t v3 = +[DEDCapability allCapabilities];
  [v2 setCapabilities:v3];

  return v2;
}

- (BOOL)hasCapabilities:(id)a3
{
  id v4 = a3;
  int v5 = [(DEDDevice *)self capabilities];
  char v6 = [v4 isSubsetOfSet:v5];

  return v6;
}

- (BOOL)isRemote
{
  return [(DEDDevice *)self remoteTransport] != 1;
}

- (NSString)publicLogSafeIdentifier
{
  if ([(DEDDevice *)self status] == 3
    && ([(DEDDevice *)self transport] == 4 || [(DEDDevice *)self remoteTransport] == 4))
  {
    uint64_t v3 = [(DEDDevice *)self idsIdentifier];
  }
  else
  {
    uint64_t v3 = [(DEDDevice *)self identifier];
  }
  return (NSString *)v3;
}

- (BOOL)isTemporaryDevice
{
  uint64_t v3 = [(DEDDevice *)self identifier];
  id v4 = [(DEDDevice *)self address];
  char v5 = [v3 isEqualToString:v4];

  return v5;
}

- (id)hashingKeyForTempDevice
{
  uint64_t v3 = [(DEDDevice *)self address];
  int64_t v4 = [(DEDDevice *)self remoteTransport];
  char v5 = [NSString stringWithFormat:@"%i-%@", v4, v3];

  return v5;
}

+ (id)currentDeviceWithDaemonInfo
{
  id v2 = +[DEDDevice currentDevice];
  uint64_t v3 = +[DEDUtils deviceHardwareCodename];
  [v2 setHardwareCodename:v3];

  int64_t v4 = +[DEDUtils deviceSerialNumber];
  [v2 setSerialNumber:v4];

  unsigned int v5 = +[DEDUtils deviceHomeButtonType];
  if (v5 < 3) {
    uint64_t v6 = v5 + 1;
  }
  else {
    uint64_t v6 = 0;
  }
  [v2 setHomeButtonType:v6];
  uint64_t v7 = (void *)IDSCopyLocalDeviceUniqueID();
  [v2 setIdsIdentifier:v7];

  uint64_t v8 = [MEMORY[0x263F57730] sharedInstance];
  unint64_t v9 = [v8 getActivePairedDevice];
  id v10 = [v9 valueForProperty:*MEMORY[0x263F57678]];

  if (v10)
  {
    v11 = [NSString stringWithFormat:@"ded:%@", v10];
    [v2 setCompanionDeviceIdentifier:v11];
  }
  id v12 = +[DEDHomeKitManager sharedInstance];
  long long v13 = [v12 homeTheaterSystemName];
  [v2 setHomeTheaterSystemName:v13];

  long long v14 = +[DEDHomeKitManager sharedInstance];
  long long v15 = [v14 homeTheaterSystemIdentifier];
  [v2 setHomeTheaterSystemIdentifier:v15];

  long long v16 = +[DEDRapportManager sharedInstance];
  v17 = [v16 mediaSystemName];
  [v2 setMediaSystemName:v17];

  uint64_t v18 = +[DEDRapportManager sharedInstance];
  objc_msgSend(v2, "setMediaSystemRole:", objc_msgSend(v18, "mediaSystemRole"));

  v19 = +[DEDRapportManager sharedInstance];
  uint64_t v20 = [v19 mediaSystemIdentifier];
  [v2 setMediaSystemIdentifier:v20];

  v21 = +[DEDRapportManager sharedInstance];
  uint64_t v22 = [v21 mediaRemoteIdentifier];
  [v2 setMediaRemoteIdentifier:v22];

  v23 = +[DEDHomeKitManager sharedInstance];
  uint64_t v24 = [v23 homeKitIdentifier];
  [v2 setHomeKitIdentifier:v24];

  uint64_t v25 = +[DEDHomeKitManager sharedInstance];
  objc_msgSend(v2, "setIsHomeKitResident:", objc_msgSend(v25, "isHomeKitResident"));

  v26 = +[DEDPersistence sharedInstance];
  uint64_t v27 = [v26 bugSessionIdentifiers];
  [v2 setBugSessions:v27];

  return v2;
}

- (NSString)address
{
  return (NSString *)objc_getProperty(self, a2, 16, 1);
}

- (void)setAddress:(id)a3
{
}

- (NSString)build
{
  return (NSString *)objc_getProperty(self, a2, 24, 1);
}

- (void)setBuild:(id)a3
{
}

- (NSString)color
{
  return (NSString *)objc_getProperty(self, a2, 32, 1);
}

- (void)setColor:(id)a3
{
}

- (NSString)deviceClass
{
  return (NSString *)objc_getProperty(self, a2, 40, 1);
}

- (void)setDeviceClass:(id)a3
{
}

- (NSString)enclosureColor
{
  return (NSString *)objc_getProperty(self, a2, 48, 1);
}

- (void)setEnclosureColor:(id)a3
{
}

- (NSString)identifier
{
  return (NSString *)objc_getProperty(self, a2, 56, 1);
}

- (void)setIdentifier:(id)a3
{
}

- (NSString)model
{
  return (NSString *)objc_getProperty(self, a2, 64, 1);
}

- (void)setModel:(id)a3
{
}

- (NSString)name
{
  return (NSString *)objc_getProperty(self, a2, 72, 1);
}

- (void)setName:(id)a3
{
}

- (NSString)productType
{
  return (NSString *)objc_getProperty(self, a2, 80, 1);
}

- (void)setProductType:(id)a3
{
}

- (NSString)platform
{
  return (NSString *)objc_getProperty(self, a2, 88, 1);
}

- (void)setPlatform:(id)a3
{
}

- (NSSet)bugSessions
{
  return self->_bugSessions;
}

- (void)setBugSessions:(id)a3
{
}

- (NSSet)capabilities
{
  return (NSSet *)objc_getProperty(self, a2, 104, 1);
}

- (void)setCapabilities:(id)a3
{
}

- (int64_t)status
{
  return self->_status;
}

- (void)setStatus:(int64_t)a3
{
  self->_status = a3;
}

- (int64_t)transport
{
  return self->_transport;
}

- (void)setTransport:(int64_t)a3
{
  self->_transport = a3;
}

- (int64_t)remoteTransport
{
  return self->_remoteTransport;
}

- (void)setRemoteTransport:(int64_t)a3
{
  self->_remoteTransport = a3;
}

- (SFDevice)sfDevice
{
  return (SFDevice *)objc_getProperty(self, a2, 136, 1);
}

- (void)setSfDevice:(id)a3
{
}

- (NSString)hardwareCodename
{
  return (NSString *)objc_getProperty(self, a2, 144, 1);
}

- (void)setHardwareCodename:(id)a3
{
}

- (NSString)serialNumber
{
  return (NSString *)objc_getProperty(self, a2, 152, 1);
}

- (void)setSerialNumber:(id)a3
{
}

- (int64_t)homeButtonType
{
  return self->_homeButtonType;
}

- (void)setHomeButtonType:(int64_t)a3
{
  self->_homeButtonType = a3;
}

- (NSString)uniformTypeIdentifier
{
  return (NSString *)objc_getProperty(self, a2, 168, 1);
}

- (void)setUniformTypeIdentifier:(id)a3
{
}

- (NSString)idsIdentifier
{
  return (NSString *)objc_getProperty(self, a2, 176, 1);
}

- (void)setIdsIdentifier:(id)a3
{
}

- (NSString)companionDeviceIdentifier
{
  return (NSString *)objc_getProperty(self, a2, 184, 1);
}

- (void)setCompanionDeviceIdentifier:(id)a3
{
}

- (NSString)homeTheaterSystemName
{
  return (NSString *)objc_getProperty(self, a2, 192, 1);
}

- (void)setHomeTheaterSystemName:(id)a3
{
}

- (NSString)homeTheaterSystemIdentifier
{
  return (NSString *)objc_getProperty(self, a2, 200, 1);
}

- (void)setHomeTheaterSystemIdentifier:(id)a3
{
}

- (NSString)mediaSystemName
{
  return (NSString *)objc_getProperty(self, a2, 208, 1);
}

- (void)setMediaSystemName:(id)a3
{
}

- (int64_t)mediaSystemRole
{
  return self->_mediaSystemRole;
}

- (void)setMediaSystemRole:(int64_t)a3
{
  self->_mediaSystemRole = a3;
}

- (NSString)mediaSystemIdentifier
{
  return (NSString *)objc_getProperty(self, a2, 224, 1);
}

- (void)setMediaSystemIdentifier:(id)a3
{
}

- (NSString)mediaRemoteIdentifier
{
  return (NSString *)objc_getProperty(self, a2, 232, 1);
}

- (void)setMediaRemoteIdentifier:(id)a3
{
}

- (NSString)homeKitIdentifier
{
  return (NSString *)objc_getProperty(self, a2, 240, 1);
}

- (void)setHomeKitIdentifier:(id)a3
{
}

- (BOOL)isHomeKitResident
{
  return self->_isHomeKitResident;
}

- (void)setIsHomeKitResident:(BOOL)a3
{
  self->_isHomeKitResident = a3;
}

- (NSString)_hashingKey
{
  return self->__hashingKey;
}

- (void)set_hashingKey:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->__hashingKey, 0);
  objc_storeStrong((id *)&self->_homeKitIdentifier, 0);
  objc_storeStrong((id *)&self->_mediaRemoteIdentifier, 0);
  objc_storeStrong((id *)&self->_mediaSystemIdentifier, 0);
  objc_storeStrong((id *)&self->_mediaSystemName, 0);
  objc_storeStrong((id *)&self->_homeTheaterSystemIdentifier, 0);
  objc_storeStrong((id *)&self->_homeTheaterSystemName, 0);
  objc_storeStrong((id *)&self->_companionDeviceIdentifier, 0);
  objc_storeStrong((id *)&self->_idsIdentifier, 0);
  objc_storeStrong((id *)&self->_uniformTypeIdentifier, 0);
  objc_storeStrong((id *)&self->_serialNumber, 0);
  objc_storeStrong((id *)&self->_hardwareCodename, 0);
  objc_storeStrong((id *)&self->_sfDevice, 0);
  objc_storeStrong((id *)&self->_capabilities, 0);
  objc_storeStrong((id *)&self->_bugSessions, 0);
  objc_storeStrong((id *)&self->_platform, 0);
  objc_storeStrong((id *)&self->_productType, 0);
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_model, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_enclosureColor, 0);
  objc_storeStrong((id *)&self->_deviceClass, 0);
  objc_storeStrong((id *)&self->_color, 0);
  objc_storeStrong((id *)&self->_build, 0);
  objc_storeStrong((id *)&self->_address, 0);
}

- (void)fetchIconImageDataForScale:(float)a3 completionCompletion:(id)a4
{
  id v6 = a4;
  uint64_t v7 = [(DEDDevice *)self imageData];

  if (v7)
  {
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __65__DEDDevice_UI__fetchIconImageDataForScale_completionCompletion___block_invoke;
    block[3] = &unk_26453A5E8;
    block[4] = self;
    id v16 = v6;
    id v8 = v6;
    dispatch_async(MEMORY[0x263EF83A0], block);
    unint64_t v9 = v16;
  }
  else
  {
    id v10 = dispatch_get_global_queue(0, 0);
    v12[0] = MEMORY[0x263EF8330];
    v12[1] = 3221225472;
    v12[2] = __65__DEDDevice_UI__fetchIconImageDataForScale_completionCompletion___block_invoke_2;
    v12[3] = &unk_26453B6A0;
    float v14 = a3;
    v12[4] = self;
    id v13 = v6;
    id v11 = v6;
    dispatch_async(v10, v12);

    unint64_t v9 = v13;
  }
}

void __65__DEDDevice_UI__fetchIconImageDataForScale_completionCompletion___block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 40);
  id v2 = [*(id *)(a1 + 32) imageData];
  (*(void (**)(uint64_t, id))(v1 + 16))(v1, v2);
}

void __65__DEDDevice_UI__fetchIconImageDataForScale_completionCompletion___block_invoke_2(uint64_t a1, double a2)
{
  LODWORD(a2) = *(_DWORD *)(a1 + 48);
  uint64_t v3 = [*(id *)(a1 + 32) imageURLForScale:a2];
  int64_t v4 = +[DEDImageResourceManager sharedInstance];
  unsigned int v5 = [*(id *)(a1 + 32) identifier];
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __65__DEDDevice_UI__fetchIconImageDataForScale_completionCompletion___block_invoke_3;
  v6[3] = &unk_26453B678;
  id v7 = *(id *)(a1 + 40);
  [v4 asynchronousDataFromURL:v3 key:v5 completionBlock:v6];
}

void __65__DEDDevice_UI__fetchIconImageDataForScale_completionCompletion___block_invoke_3(uint64_t a1, void *a2)
{
  id v3 = a2;
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __65__DEDDevice_UI__fetchIconImageDataForScale_completionCompletion___block_invoke_4;
  v6[3] = &unk_26453A5E8;
  id v4 = *(id *)(a1 + 32);
  id v7 = v3;
  id v8 = v4;
  id v5 = v3;
  dispatch_async(MEMORY[0x263EF83A0], v6);
}

uint64_t __65__DEDDevice_UI__fetchIconImageDataForScale_completionCompletion___block_invoke_4(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

- (id)imageData
{
  id v2 = self;
  objc_sync_enter(v2);
  id v3 = [(DEDDevice *)v2 identifier];

  if (v3)
  {
    id v4 = +[DEDImageResourceManager sharedInstance];
    id v5 = [(DEDDevice *)v2 identifier];
    id v6 = [v4 cachedImageFromKey:v5];
  }
  else
  {
    id v6 = 0;
  }
  objc_sync_exit(v2);

  return v6;
}

- (id)imageURLForScale:(float)a3
{
  id v5 = [(DEDDevice *)self color];
  if ([v5 length])
  {
    id v6 = [(DEDDevice *)self enclosureColor];
    uint64_t v7 = [v6 length];

    if (!v7)
    {
      id v12 = 0;
      goto LABEL_9;
    }
    id v8 = NSString;
    unint64_t v9 = [(DEDDevice *)self color];
    id v10 = [(DEDDevice *)self enclosureColor];
    id v5 = [v8 stringWithFormat:@"%@-%@", v9, v10];

    id v11 = [(DEDDevice *)self color];
    if ([v11 isEqualToString:@"unknown"])
    {
    }
    else
    {
      id v13 = [(DEDDevice *)self enclosureColor];
      char v14 = [v13 isEqualToString:@"unknown"];

      if ((v14 & 1) == 0)
      {
        uint64_t v20 = [(DEDDevice *)self enclosureColor];
        int v21 = [v20 intValue];

        if (v21) {
          [NSString stringWithFormat:@"%@-0", v5];
        }
        else {
        id v12 = [v5 stringByReplacingOccurrencesOfString:@"#" withString:&stru_26D197018];
        }
        goto LABEL_8;
      }
    }
  }
  id v12 = 0;
LABEL_8:

LABEL_9:
  long long v15 = [(DEDDevice *)self deviceClass];
  id v16 = [(DEDDevice *)self productType];
  *(float *)&double v17 = a3;
  uint64_t v18 = [(DEDDevice *)self imageURLForDeviceClass:v15 deviceModel:v16 deviceColor:v12 size:0 variant:0 scale:v17];

  return v18;
}

- (id)imageURLForDeviceClass:(id)a3 deviceModel:(id)a4 deviceColor:(id)a5 size:(int64_t)a6 variant:(int64_t)a7 scale:(float)a8
{
  id v13 = (__CFString *)a3;
  id v14 = a4;
  id v15 = a5;
  id v16 = [NSURL URLWithString:@"https://statici.icloud.com/fmipmobile/deviceImages-9.0/"];
  double v17 = [v16 absoluteString];
  uint64_t v18 = (void *)[v17 mutableCopy];

  if ((unint64_t)a6 > 2) {
    v19 = @"nolocation-ipad";
  }
  else {
    v19 = off_26453B6C0[a6];
  }
  if ([(__CFString *)v13 isEqualToString:@"AudioAccessory"])
  {

    id v13 = @"HomePod";
  }
  uint64_t v20 = [MEMORY[0x263F08708] URLPathAllowedCharacterSet];
  int v21 = [(__CFString *)v13 stringByAddingPercentEncodingWithAllowedCharacters:v20];
  [v18 appendFormat:@"%@/", v21];

  uint64_t v22 = [MEMORY[0x263F08708] URLPathAllowedCharacterSet];
  v23 = [v14 stringByAddingPercentEncodingWithAllowedCharacters:v22];
  [v18 appendFormat:@"%@", v23];

  if (v15 && [v15 length])
  {
    uint64_t v24 = [MEMORY[0x263F08708] URLPathAllowedCharacterSet];
    uint64_t v25 = [v15 stringByAddingPercentEncodingWithAllowedCharacters:v24];
    [v18 appendFormat:@"-%@", v25];
  }
  [v18 appendString:@"/"];
  if ((unint64_t)(a7 - 1) > 2) {
    v26 = @"online";
  }
  else {
    v26 = off_26453B6D8[a7 - 1];
  }
  if (a8 <= 1.0) {
    uint64_t v27 = &stru_26D197018;
  }
  else {
    uint64_t v27 = (__CFString *)objc_msgSend([NSString alloc], "initWithFormat:", @"__%.0fx", a8);
  }
  if ([(__CFString *)v13 isEqualToString:@"RealityDevice"])
  {
    id v28 = [NSString stringWithFormat:@"https://appleid.cdn-apple.com/static/deviceImages-12.0/RealityDevice/%@/online-sourcelist%@.png", v14, v27];
    uint64_t v29 = [NSURL URLWithString:v28];
  }
  else
  {
    [v18 appendFormat:@"%@-%@%@.png", v26, v19, v27];
    uint64_t v29 = [NSURL URLWithString:v18];
  }
  v30 = +[DEDUtils sharedLog];
  if (os_log_type_enabled(v30, OS_LOG_TYPE_DEBUG)) {
    -[DEDDevice(UI) imageURLForDeviceClass:deviceModel:deviceColor:size:variant:scale:]((uint64_t)v29, v30);
  }

  return v29;
}

@end