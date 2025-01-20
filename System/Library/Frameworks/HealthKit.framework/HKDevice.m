@interface HKDevice
+ (BOOL)supportsSecureCoding;
+ (HKDevice)localDevice;
- (BOOL)_isAppleHardwareVersion;
- (BOOL)_isAppleManufacturer;
- (BOOL)_isAppleModel;
- (BOOL)_isConnectedGymDevice;
- (BOOL)isEqual:(id)a3;
- (HKDevice)init;
- (HKDevice)initWithCoder:(id)a3;
- (HKDevice)initWithName:(NSString *)name manufacturer:(NSString *)manufacturer model:(NSString *)model hardwareVersion:(NSString *)hardwareVersion firmwareVersion:(NSString *)firmwareVersion softwareVersion:(NSString *)softwareVersion localIdentifier:(NSString *)localIdentifier UDIDeviceIdentifier:(NSString *)UDIDeviceIdentifier;
- (NSDate)creationDate;
- (NSString)UDIDeviceIdentifier;
- (NSString)_connectedGymDeviceFullName;
- (NSString)_connectedGymDeviceTypeName;
- (NSString)_displayName;
- (NSString)firmwareVersion;
- (NSString)hardwareVersion;
- (NSString)localIdentifier;
- (NSString)manufacturer;
- (NSString)model;
- (NSString)name;
- (NSString)softwareVersion;
- (id)_init;
- (id)description;
- (unint64_t)_fitnessMachineType;
- (unint64_t)hash;
- (void)_setCreationDate:(id)a3;
- (void)_setFirmwareVersion:(id)a3;
- (void)_setFitnessMachineType:(unint64_t)a3;
- (void)_setHardwareVersion:(id)a3;
- (void)_setLocalIdentifier:(id)a3;
- (void)_setManufacturer:(id)a3;
- (void)_setModel:(id)a3;
- (void)_setName:(id)a3;
- (void)_setSoftwareVersion:(id)a3;
- (void)_setUDIDeviceIdentifier:(id)a3;
- (void)encodeWithCoder:(id)a3;
@end

@implementation HKDevice

+ (HKDevice)localDevice
{
  if (localDevice_onceToken != -1) {
    dispatch_once(&localDevice_onceToken, &__block_literal_global_19);
  }
  v2 = (void *)localDevice__localDevice;

  return (HKDevice *)v2;
}

- (NSString)name
{
  return self->_name;
}

- (NSString)manufacturer
{
  return self->_manufacturer;
}

- (NSString)model
{
  return self->_model;
}

- (NSString)hardwareVersion
{
  return self->_hardwareVersion;
}

- (NSString)firmwareVersion
{
  return self->_firmwareVersion;
}

- (NSString)softwareVersion
{
  return self->_softwareVersion;
}

- (NSString)localIdentifier
{
  return self->_localIdentifier;
}

- (NSString)UDIDeviceIdentifier
{
  return self->_UDIDeviceIdentifier;
}

- (unint64_t)hash
{
  NSUInteger v3 = [(NSString *)self->_name hash];
  NSUInteger v4 = v3 ^ (2 * [(NSString *)self->_manufacturer hash]);
  NSUInteger v5 = v4 ^ (4 * [(NSString *)self->_model hash]);
  NSUInteger v6 = v5 ^ (8 * [(NSString *)self->_hardwareVersion hash]);
  NSUInteger v7 = v6 ^ (16 * [(NSString *)self->_firmwareVersion hash]);
  NSUInteger v8 = v7 ^ (32 * [(NSString *)self->_softwareVersion hash]);
  NSUInteger v9 = v8 ^ ([(NSString *)self->_localIdentifier hash] << 6);
  return v9 ^ ([(NSString *)self->_UDIDeviceIdentifier hash] << 7);
}

- (HKDevice)initWithName:(NSString *)name manufacturer:(NSString *)manufacturer model:(NSString *)model hardwareVersion:(NSString *)hardwareVersion firmwareVersion:(NSString *)firmwareVersion softwareVersion:(NSString *)softwareVersion localIdentifier:(NSString *)localIdentifier UDIDeviceIdentifier:(NSString *)UDIDeviceIdentifier
{
  v16 = name;
  v17 = manufacturer;
  v18 = model;
  v19 = hardwareVersion;
  v20 = firmwareVersion;
  v21 = softwareVersion;
  v22 = localIdentifier;
  v23 = UDIDeviceIdentifier;
  v35.receiver = self;
  v35.super_class = (Class)HKDevice;
  v24 = [(HKDevice *)&v35 init];
  if (v24)
  {
    uint64_t v31 = 0;
    v32 = &v31;
    uint64_t v33 = 0x2020000000;
    char v34 = 0;
    aBlock[0] = MEMORY[0x1E4F143A8];
    aBlock[1] = 3221225472;
    aBlock[2] = __128__HKDevice_initWithName_manufacturer_model_hardwareVersion_firmwareVersion_softwareVersion_localIdentifier_UDIDeviceIdentifier___block_invoke;
    aBlock[3] = &unk_1E58BF9F0;
    aBlock[4] = &v31;
    v25 = _Block_copy(aBlock);
    v26 = v16;
    v27 = (void (**)(void, void, void))v25;
    v29 = v26;
    (*((void (**)(void *, NSString **))v25 + 2))(v25, &v24->_name);
    ((void (**)(void, NSString **, NSString *))v27)[2](v27, &v24->_manufacturer, v17);
    ((void (**)(void, NSString **, NSString *))v27)[2](v27, &v24->_model, v18);
    ((void (**)(void, NSString **, NSString *))v27)[2](v27, &v24->_hardwareVersion, v19);
    ((void (**)(void, NSString **, NSString *))v27)[2](v27, &v24->_firmwareVersion, v20);
    ((void (**)(void, NSString **, NSString *))v27)[2](v27, &v24->_softwareVersion, v21);
    ((void (**)(void, NSString **, NSString *))v27)[2](v27, &v24->_localIdentifier, v22);
    ((void (**)(void, NSString **, NSString *))v27)[2](v27, &v24->_UDIDeviceIdentifier, v23);
    if (HKProgramSDKAtLeast() && !*((unsigned char *)v32 + 24)) {
      [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3C8] format:@"At least one field of the device must be non-nil."];
    }

    _Block_object_dispose(&v31, 8);
    v16 = v29;
  }

  return v24;
}

- (BOOL)isEqual:(id)a3
{
  NSUInteger v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    goto LABEL_26;
  }
  name = self->_name;
  NSUInteger v6 = (NSString *)v4[1];
  if (name != v6 && (!v6 || !-[NSString isEqualToString:](name, "isEqualToString:"))) {
    goto LABEL_26;
  }
  manufacturer = self->_manufacturer;
  NSUInteger v8 = (NSString *)v4[2];
  if (manufacturer != v8 && (!v8 || !-[NSString isEqualToString:](manufacturer, "isEqualToString:"))) {
    goto LABEL_26;
  }
  model = self->_model;
  v10 = (NSString *)v4[3];
  if (model != v10 && (!v10 || !-[NSString isEqualToString:](model, "isEqualToString:"))) {
    goto LABEL_26;
  }
  hardwareVersion = self->_hardwareVersion;
  v12 = (NSString *)v4[4];
  if (hardwareVersion != v12 && (!v12 || !-[NSString isEqualToString:](hardwareVersion, "isEqualToString:"))) {
    goto LABEL_26;
  }
  firmwareVersion = self->_firmwareVersion;
  v14 = (NSString *)v4[5];
  if (firmwareVersion != v14 && (!v14 || !-[NSString isEqualToString:](firmwareVersion, "isEqualToString:"))) {
    goto LABEL_26;
  }
  softwareVersion = self->_softwareVersion;
  v16 = (NSString *)v4[6];
  if (softwareVersion != v16 && (!v16 || !-[NSString isEqualToString:](softwareVersion, "isEqualToString:"))) {
    goto LABEL_26;
  }
  localIdentifier = self->_localIdentifier;
  v18 = (NSString *)v4[7];
  if (localIdentifier != v18 && (!v18 || !-[NSString isEqualToString:](localIdentifier, "isEqualToString:"))) {
    goto LABEL_26;
  }
  UDIDeviceIdentifier = self->_UDIDeviceIdentifier;
  v20 = (NSString *)v4[8];
  if (UDIDeviceIdentifier == v20)
  {
    char v21 = 1;
    goto LABEL_27;
  }
  if (v20) {
    char v21 = -[NSString isEqualToString:](UDIDeviceIdentifier, "isEqualToString:");
  }
  else {
LABEL_26:
  }
    char v21 = 0;
LABEL_27:

  return v21;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_creationDate, 0);
  objc_storeStrong((id *)&self->_UDIDeviceIdentifier, 0);
  objc_storeStrong((id *)&self->_localIdentifier, 0);
  objc_storeStrong((id *)&self->_softwareVersion, 0);
  objc_storeStrong((id *)&self->_firmwareVersion, 0);
  objc_storeStrong((id *)&self->_hardwareVersion, 0);
  objc_storeStrong((id *)&self->_model, 0);
  objc_storeStrong((id *)&self->_manufacturer, 0);

  objc_storeStrong((id *)&self->_name, 0);
}

- (void)encodeWithCoder:(id)a3
{
  name = self->_name;
  id v5 = a3;
  [v5 encodeObject:name forKey:@"name"];
  [v5 encodeObject:self->_manufacturer forKey:@"manufacturer"];
  [v5 encodeObject:self->_model forKey:@"model"];
  [v5 encodeObject:self->_hardwareVersion forKey:@"hardVers"];
  [v5 encodeObject:self->_firmwareVersion forKey:@"firmVers"];
  [v5 encodeObject:self->_softwareVersion forKey:@"softVers"];
  [v5 encodeObject:self->_localIdentifier forKey:@"localID"];
  [v5 encodeObject:self->_UDIDeviceIdentifier forKey:@"FDAUDI"];
  [v5 encodeObject:self->_creationDate forKey:@"date"];
}

void __23__HKDevice_localDevice__block_invoke()
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  v0 = [HKDevice alloc];
  v1 = +[_HKBehavior currentDeviceName];
  v2 = +[_HKBehavior currentDeviceManufacturer];
  NSUInteger v3 = +[_HKBehavior currentDeviceClass];
  NSUInteger v4 = +[_HKBehavior currentDeviceProductType];
  id v5 = +[_HKBehavior currentOSVersion];
  uint64_t v6 = [(HKDevice *)v0 initWithName:v1 manufacturer:v2 model:v3 hardwareVersion:v4 firmwareVersion:0 softwareVersion:v5 localIdentifier:0 UDIDeviceIdentifier:0];
  NSUInteger v7 = (void *)localDevice__localDevice;
  localDevice__localDevice = v6;

  _HKInitializeLogging();
  NSUInteger v8 = HKLogDefault;
  if (os_log_type_enabled((os_log_t)HKLogDefault, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    uint64_t v10 = localDevice__localDevice;
    _os_log_impl(&dword_19C023000, v8, OS_LOG_TYPE_DEFAULT, "Created localDevice: %@", buf, 0xCu);
  }
}

- (HKDevice)init
{
  NSUInteger v3 = (void *)MEMORY[0x1E4F1CA00];
  uint64_t v4 = *MEMORY[0x1E4F1C3C8];
  id v5 = NSStringFromSelector(a2);
  [v3 raise:v4, @"The -%@ method is not available on %@", v5, objc_opt_class() format];

  return 0;
}

- (id)_init
{
  v3.receiver = self;
  v3.super_class = (Class)HKDevice;
  return [(HKDevice *)&v3 init];
}

void __128__HKDevice_initWithName_manufacturer_model_hardwareVersion_firmwareVersion_softwareVersion_localIdentifier_UDIDeviceIdentifier___block_invoke(uint64_t a1, void **a2, void *a3)
{
  uint64_t v5 = objc_msgSend(a3, "hk_copyNonEmptyString");
  uint64_t v6 = *a2;
  *a2 = (void *)v5;

  *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) |= *a2 != 0;
}

- (id)description
{
  id v3 = objc_alloc(MEMORY[0x1E4F28E78]);
  v7.receiver = self;
  v7.super_class = (Class)HKDevice;
  uint64_t v4 = [(HKDevice *)&v7 description];
  uint64_t v5 = (void *)[v3 initWithFormat:@"<%@", v4];

  if (self->_name) {
    [v5 appendFormat:@", name:%@", self->_name];
  }
  if (self->_manufacturer) {
    [v5 appendFormat:@", manufacturer:%@", self->_manufacturer];
  }
  if (self->_model) {
    [v5 appendFormat:@", model:%@", self->_model];
  }
  if (self->_hardwareVersion) {
    [v5 appendFormat:@", hardware:%@", self->_hardwareVersion];
  }
  if (self->_firmwareVersion) {
    [v5 appendFormat:@", firmware:%@", self->_firmwareVersion];
  }
  if (self->_softwareVersion) {
    [v5 appendFormat:@", software:%@", self->_softwareVersion];
  }
  if (self->_localIdentifier) {
    [v5 appendFormat:@", localIdentifier:%@", self->_localIdentifier];
  }
  if (self->_UDIDeviceIdentifier) {
    [v5 appendFormat:@", UDIDeviceIdentifier:%@", self->_UDIDeviceIdentifier];
  }
  if (self->_creationDate) {
    [v5 appendFormat:@", creation date:%@", self->_creationDate];
  }
  [v5 appendString:@">"];

  return v5;
}

- (BOOL)_isAppleManufacturer
{
  v2 = [(HKDevice *)self manufacturer];
  id v3 = +[_HKBehavior currentDeviceManufacturer];
  char v4 = [v2 isEqualToString:v3];

  return v4;
}

- (BOOL)_isAppleModel
{
  id v3 = [(HKDevice *)self model];
  if ([v3 hasPrefix:@"iPhone"])
  {
    char v4 = 1;
  }
  else
  {
    uint64_t v5 = [(HKDevice *)self model];
    if ([v5 hasPrefix:@"iPad"])
    {
      char v4 = 1;
    }
    else
    {
      uint64_t v6 = [(HKDevice *)self model];
      if ([v6 hasPrefix:@"Watch"])
      {
        char v4 = 1;
      }
      else
      {
        objc_super v7 = [(HKDevice *)self model];
        char v4 = [v7 hasPrefix:@"RealityDevice"];
      }
    }
  }
  return v4;
}

- (BOOL)_isAppleHardwareVersion
{
  id v3 = [(HKDevice *)self hardwareVersion];
  if ([v3 hasPrefix:@"iPhone"])
  {
    char v4 = 1;
  }
  else
  {
    uint64_t v5 = [(HKDevice *)self hardwareVersion];
    if ([v5 hasPrefix:@"iPad"])
    {
      char v4 = 1;
    }
    else
    {
      uint64_t v6 = [(HKDevice *)self hardwareVersion];
      if ([v6 hasPrefix:@"Watch"])
      {
        char v4 = 1;
      }
      else
      {
        objc_super v7 = [(HKDevice *)self hardwareVersion];
        char v4 = [v7 hasPrefix:@"RealityDevice"];
      }
    }
  }
  return v4;
}

- (void)_setFitnessMachineType:(unint64_t)a3
{
  if (a3 - 1 > 5) {
    id v3 = 0;
  }
  else {
    id v3 = off_1E58BFA10[a3 - 1];
  }
  [(HKDevice *)self _setModel:v3];
}

- (unint64_t)_fitnessMachineType
{
  v2 = [(HKDevice *)self model];
  if ([v2 isEqualToString:@"com.apple.health.fitnessmachinemodel.treadmill"])
  {
    unint64_t v3 = 1;
  }
  else if ([v2 isEqualToString:@"com.apple.health.fitnessmachinemodel.crosstrainer"])
  {
    unint64_t v3 = 2;
  }
  else if ([v2 isEqualToString:@"com.apple.health.fitnessmachinemodel.stepclimber"])
  {
    unint64_t v3 = 3;
  }
  else if ([v2 isEqualToString:@"com.apple.health.fitnessmachinemodel.stairclimber"])
  {
    unint64_t v3 = 4;
  }
  else if ([v2 isEqualToString:@"com.apple.health.fitnessmachinemodel.indoorbike"])
  {
    unint64_t v3 = 6;
  }
  else if ([v2 isEqualToString:@"com.apple.health.fitnessmachinemodel.rower"])
  {
    unint64_t v3 = 5;
  }
  else
  {
    unint64_t v3 = 0;
  }

  return v3;
}

- (BOOL)_isConnectedGymDevice
{
  v2 = [(HKDevice *)self localIdentifier];
  char v3 = [v2 isEqualToString:@"com.healthd.fitnessmachine"];

  return v3;
}

- (NSString)_connectedGymDeviceTypeName
{
  if ([(HKDevice *)self _isConnectedGymDevice])
  {
    switch([(HKDevice *)self _fitnessMachineType])
    {
      case 1uLL:
        char v3 = HKHealthKitFrameworkBundle();
        char v4 = v3;
        uint64_t v5 = @"CONNECTED_GYM_TREADMILL";
        break;
      case 2uLL:
        char v3 = HKHealthKitFrameworkBundle();
        char v4 = v3;
        uint64_t v5 = @"CONNECTED_GYM_CROSSTRAINER";
        break;
      case 3uLL:
      case 4uLL:
        char v3 = HKHealthKitFrameworkBundle();
        char v4 = v3;
        uint64_t v5 = @"CONNECTED_GYM_STAIRSTEPPER";
        break;
      case 5uLL:
        char v3 = HKHealthKitFrameworkBundle();
        char v4 = v3;
        uint64_t v5 = @"CONNECTED_GYM_ROWER";
        break;
      case 6uLL:
        char v3 = HKHealthKitFrameworkBundle();
        char v4 = v3;
        uint64_t v5 = @"CONNECTED_GYM_INDOORBIKE";
        break;
      default:
        goto LABEL_4;
    }
    uint64_t v6 = [v3 localizedStringForKey:v5 value:&stru_1EEC60288 table:@"Localizable"];
  }
  else
  {
LABEL_4:
    uint64_t v6 = 0;
  }

  return (NSString *)v6;
}

- (NSString)_connectedGymDeviceFullName
{
  if ([(HKDevice *)self _isConnectedGymDevice]
    && ([(HKDevice *)self manufacturer],
        char v3 = objc_claimAutoreleasedReturnValue(),
        v3,
        v3))
  {
    char v4 = [(HKDevice *)self _connectedGymDeviceTypeName];
    if (v4)
    {
      uint64_t v5 = NSString;
      uint64_t v6 = HKHealthKitFrameworkBundle();
      objc_super v7 = [v6 localizedStringForKey:@"CONNECTED_GYM_DEVICE_FORMAT" value:&stru_1EEC60288 table:@"Localizable"];
      NSUInteger v8 = [(HKDevice *)self manufacturer];
      NSUInteger v9 = objc_msgSend(v5, "stringWithFormat:", v7, v8, v4);
    }
    else
    {
      NSUInteger v9 = [(HKDevice *)self manufacturer];
    }
  }
  else
  {
    NSUInteger v9 = 0;
  }

  return (NSString *)v9;
}

- (NSString)_displayName
{
  if ([(HKDevice *)self _isConnectedGymDevice]
    && ([(HKDevice *)self manufacturer],
        char v3 = objc_claimAutoreleasedReturnValue(),
        v3,
        v3))
  {
    char v4 = [(HKDevice *)self _connectedGymDeviceFullName];
    uint64_t v5 = [v4 length];

    if (v5)
    {
      uint64_t v6 = [(HKDevice *)self _connectedGymDeviceFullName];
      goto LABEL_10;
    }
  }
  else
  {
    objc_super v7 = [(HKDevice *)self name];
    uint64_t v8 = [v7 length];

    if (v8)
    {
      uint64_t v6 = [(HKDevice *)self name];
      goto LABEL_10;
    }
    NSUInteger v9 = [(HKDevice *)self model];
    uint64_t v10 = [v9 length];

    if (v10)
    {
      uint64_t v6 = [(HKDevice *)self model];
      goto LABEL_10;
    }
  }
  uint64_t v6 = [(HKDevice *)self manufacturer];
LABEL_10:

  return (NSString *)v6;
}

- (void)_setName:(id)a3
{
  objc_msgSend(a3, "hk_copyNonEmptyString");
  self->_name = (NSString *)objc_claimAutoreleasedReturnValue();

  MEMORY[0x1F41817F8]();
}

- (void)_setManufacturer:(id)a3
{
  objc_msgSend(a3, "hk_copyNonEmptyString");
  self->_manufacturer = (NSString *)objc_claimAutoreleasedReturnValue();

  MEMORY[0x1F41817F8]();
}

- (void)_setModel:(id)a3
{
  objc_msgSend(a3, "hk_copyNonEmptyString");
  self->_model = (NSString *)objc_claimAutoreleasedReturnValue();

  MEMORY[0x1F41817F8]();
}

- (void)_setHardwareVersion:(id)a3
{
  objc_msgSend(a3, "hk_copyNonEmptyString");
  self->_hardwareVersion = (NSString *)objc_claimAutoreleasedReturnValue();

  MEMORY[0x1F41817F8]();
}

- (void)_setFirmwareVersion:(id)a3
{
  objc_msgSend(a3, "hk_copyNonEmptyString");
  self->_firmwareVersion = (NSString *)objc_claimAutoreleasedReturnValue();

  MEMORY[0x1F41817F8]();
}

- (void)_setSoftwareVersion:(id)a3
{
  objc_msgSend(a3, "hk_copyNonEmptyString");
  self->_softwareVersion = (NSString *)objc_claimAutoreleasedReturnValue();

  MEMORY[0x1F41817F8]();
}

- (void)_setLocalIdentifier:(id)a3
{
  objc_msgSend(a3, "hk_copyNonEmptyString");
  self->_localIdentifier = (NSString *)objc_claimAutoreleasedReturnValue();

  MEMORY[0x1F41817F8]();
}

- (void)_setUDIDeviceIdentifier:(id)a3
{
  objc_msgSend(a3, "hk_copyNonEmptyString");
  self->_UDIDeviceIdentifier = (NSString *)objc_claimAutoreleasedReturnValue();

  MEMORY[0x1F41817F8]();
}

- (NSDate)creationDate
{
  return self->_creationDate;
}

- (void)_setCreationDate:(id)a3
{
  self->_creationDate = (NSDate *)[a3 copy];

  MEMORY[0x1F41817F8]();
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (HKDevice)initWithCoder:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(HKDevice *)self _init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"name"];
    uint64_t v7 = objc_msgSend(v6, "hk_copyNonEmptyString");
    name = v5->_name;
    v5->_name = (NSString *)v7;

    NSUInteger v9 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"manufacturer"];
    uint64_t v10 = objc_msgSend(v9, "hk_copyNonEmptyString");
    manufacturer = v5->_manufacturer;
    v5->_manufacturer = (NSString *)v10;

    v12 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"model"];
    uint64_t v13 = objc_msgSend(v12, "hk_copyNonEmptyString");
    model = v5->_model;
    v5->_model = (NSString *)v13;

    v15 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"hardVers"];
    uint64_t v16 = objc_msgSend(v15, "hk_copyNonEmptyString");
    hardwareVersion = v5->_hardwareVersion;
    v5->_hardwareVersion = (NSString *)v16;

    v18 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"firmVers"];
    uint64_t v19 = objc_msgSend(v18, "hk_copyNonEmptyString");
    firmwareVersion = v5->_firmwareVersion;
    v5->_firmwareVersion = (NSString *)v19;

    char v21 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"softVers"];
    uint64_t v22 = objc_msgSend(v21, "hk_copyNonEmptyString");
    softwareVersion = v5->_softwareVersion;
    v5->_softwareVersion = (NSString *)v22;

    v24 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"localID"];
    uint64_t v25 = objc_msgSend(v24, "hk_copyNonEmptyString");
    localIdentifier = v5->_localIdentifier;
    v5->_localIdentifier = (NSString *)v25;

    v27 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"FDAUDI"];
    uint64_t v28 = objc_msgSend(v27, "hk_copyNonEmptyString");
    UDIDeviceIdentifier = v5->_UDIDeviceIdentifier;
    v5->_UDIDeviceIdentifier = (NSString *)v28;

    uint64_t v30 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"date"];
    creationDate = v5->_creationDate;
    v5->_creationDate = (NSDate *)v30;
  }
  return v5;
}

@end