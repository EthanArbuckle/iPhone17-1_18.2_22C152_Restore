@interface CRKDevice
+ (BOOL)supportsSecureCoding;
+ (NSDictionary)keyTranslations;
+ (id)CRKKeyForDMFKey:(id)a3;
+ (id)allPropertyKeys;
+ (id)applicationInfoFromBundleIdentifiers:(id)a3;
- (BOOL)isAppLocked;
- (BOOL)isApplicationInstalled:(id)a3;
- (BOOL)isApplicationOpen:(id)a3;
- (BOOL)isEphemeralMultiUser;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToDevice:(id)a3;
- (BOOL)isLowBattery;
- (BOOL)isMuted;
- (BOOL)isOrientationLocked;
- (BOOL)isPasscodeEnabled;
- (BOOL)isRequestingUnenroll;
- (BOOL)isScreenSaverActive;
- (BOOL)isSupervised;
- (CRKDevice)initWithCoder:(id)a3;
- (CRKDevice)initWithIdentifier:(id)a3;
- (NSArray)allOpenApplications;
- (NSArray)availableAirPlayRoutes;
- (NSArray)displays;
- (NSArray)installedApplicationInfo;
- (NSArray)installedApplications;
- (NSArray)trustedAnchorCertificateFingerprints;
- (NSDictionary)activeAirPlayRoute;
- (NSString)buildVersion;
- (NSString)currentLocaleIdentifier;
- (NSString)identifier;
- (NSString)instructorImageIdentifier;
- (NSString)managementLockPasscode;
- (NSString)model;
- (NSString)name;
- (NSString)pipOpenApplication;
- (NSString)primaryOpenApplication;
- (NSString)secondaryOpenApplication;
- (NSString)serialNumber;
- (NSString)stagedAdHocIdentityCertificateFingerprint;
- (NSString)studentImageIdentifier;
- (NSString)systemName;
- (NSString)systemVersion;
- (NSString)trustedExchangeIdentifier;
- (NSString)userDisplayName;
- (NSString)userFamilyName;
- (NSString)userGivenName;
- (NSString)userIdentifier;
- (NSString)userImageURL;
- (NSString)userPhoneticFamilyName;
- (NSString)userPhoneticGivenName;
- (float)batteryLevel;
- (float)displayBackingScaleFactor;
- (float)displayHeight;
- (float)displayWidth;
- (float)volume;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)valueForUndefinedKey:(id)a3;
- (unint64_t)availableBytes;
- (unint64_t)chargingState;
- (unint64_t)deviceOrientation;
- (unint64_t)hash;
- (unint64_t)interfaceOrientation;
- (unint64_t)lockState;
- (unint64_t)loginState;
- (unint64_t)platform;
- (unint64_t)screenState;
- (void)encodeWithCoder:(id)a3;
- (void)setActiveAirPlayRoute:(id)a3;
- (void)setAllOpenApplications:(id)a3;
- (void)setAppLocked:(BOOL)a3;
- (void)setAvailableAirPlayRoutes:(id)a3;
- (void)setAvailableBytes:(unint64_t)a3;
- (void)setBatteryLevel:(float)a3;
- (void)setBuildVersion:(id)a3;
- (void)setChargingState:(unint64_t)a3;
- (void)setCurrentLocaleIdentifier:(id)a3;
- (void)setDeviceOrientation:(unint64_t)a3;
- (void)setDisplayBackingScaleFactor:(float)a3;
- (void)setDisplayHeight:(float)a3;
- (void)setDisplayWidth:(float)a3;
- (void)setDisplays:(id)a3;
- (void)setEphemeralMultiUser:(BOOL)a3;
- (void)setInstalledApplicationInfo:(id)a3;
- (void)setInstalledApplications:(id)a3;
- (void)setInstructorImageIdentifier:(id)a3;
- (void)setInterfaceOrientation:(unint64_t)a3;
- (void)setLockState:(unint64_t)a3;
- (void)setLoginState:(unint64_t)a3;
- (void)setLowBattery:(BOOL)a3;
- (void)setManagementLockPasscode:(id)a3;
- (void)setModel:(id)a3;
- (void)setMuted:(BOOL)a3;
- (void)setName:(id)a3;
- (void)setOrientationLocked:(BOOL)a3;
- (void)setPasscodeEnabled:(BOOL)a3;
- (void)setPipOpenApplication:(id)a3;
- (void)setPlatform:(unint64_t)a3;
- (void)setPrimaryOpenApplication:(id)a3;
- (void)setRequestingUnenroll:(BOOL)a3;
- (void)setScreenSaverActive:(BOOL)a3;
- (void)setScreenState:(unint64_t)a3;
- (void)setSecondaryOpenApplication:(id)a3;
- (void)setSerialNumber:(id)a3;
- (void)setStagedAdHocIdentityCertificateFingerprint:(id)a3;
- (void)setStudentImageIdentifier:(id)a3;
- (void)setSupervised:(BOOL)a3;
- (void)setSystemName:(id)a3;
- (void)setSystemVersion:(id)a3;
- (void)setTrustedAnchorCertificateFingerprints:(id)a3;
- (void)setTrustedExchangeIdentifier:(id)a3;
- (void)setUserDisplayName:(id)a3;
- (void)setUserFamilyName:(id)a3;
- (void)setUserGivenName:(id)a3;
- (void)setUserIdentifier:(id)a3;
- (void)setUserImageURL:(id)a3;
- (void)setUserPhoneticFamilyName:(id)a3;
- (void)setUserPhoneticGivenName:(id)a3;
- (void)setValue:(id)a3 forUndefinedKey:(id)a4;
- (void)setVolume:(float)a3;
@end

@implementation CRKDevice

+ (NSDictionary)keyTranslations
{
  if (keyTranslations_onceToken != -1) {
    dispatch_once(&keyTranslations_onceToken, &__block_literal_global_28);
  }
  v2 = (void *)keyTranslations_translations;

  return (NSDictionary *)v2;
}

void __42__CRKDevice_Translations__keyTranslations__block_invoke()
{
  v39[33] = *MEMORY[0x263EF8340];
  uint64_t v0 = *MEMORY[0x263F39BA0];
  v17[0] = *MEMORY[0x263F39AB8];
  v17[1] = v0;
  v39[0] = @"identifier";
  v39[1] = @"serialNumber";
  uint64_t v1 = *MEMORY[0x263F39B30];
  v17[2] = *MEMORY[0x263F39B70];
  v17[3] = v1;
  v39[2] = @"platform";
  v39[3] = @"model";
  uint64_t v2 = *MEMORY[0x263F39BF0];
  v17[4] = *MEMORY[0x263F39B48];
  v17[5] = v2;
  v39[4] = @"name";
  v39[5] = @"systemName";
  uint64_t v3 = *MEMORY[0x263F39A40];
  v17[6] = *MEMORY[0x263F39BF8];
  v17[7] = v3;
  v39[6] = @"systemVersion";
  v39[7] = @"buildVersion";
  uint64_t v4 = *MEMORY[0x263F39AE8];
  v17[8] = *MEMORY[0x263F39B08];
  v17[9] = v4;
  v39[8] = @"supervised";
  v39[9] = @"ephemeralMultiUser";
  uint64_t v5 = *MEMORY[0x263F39A60];
  v17[10] = *MEMORY[0x263F39A30];
  v17[11] = v5;
  v39[10] = @"batteryLevel";
  v39[11] = @"chargingState";
  uint64_t v6 = *MEMORY[0x263F39B90];
  uint64_t v18 = *MEMORY[0x263F39B18];
  uint64_t v19 = v6;
  v39[12] = @"lockState";
  v39[13] = @"screenState";
  uint64_t v7 = *MEMORY[0x263F39A18];
  uint64_t v20 = *MEMORY[0x263F39C40];
  uint64_t v21 = v7;
  v39[14] = @"volume";
  v39[15] = @"availableBytes";
  uint64_t v8 = *MEMORY[0x263F39AC0];
  uint64_t v22 = *MEMORY[0x263F39A88];
  uint64_t v23 = v8;
  v39[16] = @"deviceOrientation";
  v39[17] = @"interfaceOrientation";
  uint64_t v9 = *MEMORY[0x263F39B98];
  uint64_t v24 = *MEMORY[0x263F39B78];
  uint64_t v25 = v9;
  v39[18] = @"primaryOpenApplication";
  v39[19] = @"secondaryOpenApplication";
  uint64_t v10 = *MEMORY[0x263F39C20];
  uint64_t v26 = v18;
  uint64_t v27 = v10;
  v39[20] = @"lockState";
  v39[21] = @"userIdentifier";
  uint64_t v11 = *MEMORY[0x263F39C18];
  uint64_t v28 = *MEMORY[0x263F39C08];
  uint64_t v29 = v11;
  v39[22] = @"userDisplayName";
  v39[23] = @"userGivenName";
  uint64_t v12 = *MEMORY[0x263F39C28];
  uint64_t v30 = *MEMORY[0x263F39C10];
  uint64_t v31 = v12;
  v39[24] = @"userFamilyName";
  v39[25] = @"userImageURL";
  uint64_t v13 = *MEMORY[0x263F39B58];
  uint64_t v32 = *MEMORY[0x263F39C30];
  uint64_t v33 = v13;
  v39[26] = @"loginState";
  v39[27] = @"passcodeEnabled";
  uint64_t v14 = *MEMORY[0x263F39A10];
  uint64_t v34 = *MEMORY[0x263F39A00];
  uint64_t v35 = v14;
  v39[28] = @"activeAirPlayRoute";
  v39[29] = @"availableAirPlayRoutes";
  uint64_t v36 = *MEMORY[0x263F39B28];
  uint64_t v37 = v11;
  v39[30] = @"managementLockPasscode";
  v39[31] = @"userGivenName";
  uint64_t v38 = v30;
  v39[32] = @"userFamilyName";
  uint64_t v15 = [NSDictionary dictionaryWithObjects:v39 forKeys:v17 count:33];
  v16 = (void *)keyTranslations_translations;
  keyTranslations_translations = v15;
}

+ (id)CRKKeyForDMFKey:(id)a3
{
  id v3 = a3;
  uint64_t v4 = +[CRKDevice keyTranslations];
  uint64_t v5 = [v4 objectForKeyedSubscript:v3];

  return v5;
}

+ (id)allPropertyKeys
{
  v4[52] = *MEMORY[0x263EF8340];
  v4[0] = @"identifier";
  v4[1] = @"serialNumber";
  v4[2] = @"trustedExchangeIdentifier";
  v4[3] = @"platform";
  v4[4] = @"model";
  v4[5] = @"name";
  v4[6] = @"systemName";
  v4[7] = @"systemVersion";
  v4[8] = @"buildVersion";
  v4[9] = @"supervised";
  v4[10] = @"ephemeralMultiUser";
  v4[11] = @"batteryLevel";
  v4[12] = @"chargingState";
  v4[13] = @"lockState";
  v4[14] = @"screenState";
  v4[15] = @"screenSaverActive";
  v4[16] = @"volume";
  v4[17] = @"muted";
  v4[18] = @"availableBytes";
  v4[19] = @"deviceOrientation";
  v4[20] = @"interfaceOrientation";
  v4[21] = @"displays";
  v4[22] = @"displayBackingScaleFactor";
  v4[23] = @"displayHeight";
  v4[24] = @"displayWidth";
  v4[25] = @"primaryOpenApplication";
  v4[26] = @"secondaryOpenApplication";
  v4[27] = @"allOpenApplications";
  v4[28] = @"appLocked";
  v4[29] = @"installedApplications";
  v4[30] = @"installedApplicationInfo";
  v4[31] = @"userIdentifier";
  v4[32] = @"userDisplayName";
  v4[33] = @"userGivenName";
  v4[34] = @"userFamilyName";
  v4[35] = @"userImageURL";
  v4[36] = @"loginState";
  v4[37] = @"passcodeEnabled";
  v4[38] = @"studentImageIdentifier";
  v4[39] = @"instructorImageIdentifier";
  v4[40] = @"activeAirPlayRoute";
  v4[41] = @"availableAirPlayRoutes";
  v4[42] = @"managementLockPasscode";
  v4[43] = @"stagedAdHocIdentityCertificateFingerprint";
  v4[44] = @"trustedAnchorCertificateFingerprints";
  v4[45] = @"userPhoneticGivenName";
  v4[46] = @"userPhoneticFamilyName";
  v4[47] = @"studentImageIdentifier";
  v4[48] = @"instructorImageIdentifier";
  v4[49] = @"requestingUnenroll";
  v4[50] = @"currentLocaleIdentifier";
  v4[51] = @"lowBattery";
  uint64_t v2 = [MEMORY[0x263EFF8C0] arrayWithObjects:v4 count:52];

  return v2;
}

- (NSArray)installedApplications
{
  uint64_t v2 = [(CRKDevice *)self installedApplicationInfo];
  id v3 = +[CRKApplicationInfo bundleIdentifiersFromDictionaryRepresentations:v2];

  return (NSArray *)v3;
}

- (void)setInstalledApplications:(id)a3
{
  id v4 = a3;
  id v5 = [(id)objc_opt_class() applicationInfoFromBundleIdentifiers:v4];

  [(CRKDevice *)self setInstalledApplicationInfo:v5];
}

- (BOOL)isApplicationOpen:(id)a3
{
  id v4 = a3;
  id v5 = [(CRKDevice *)self allOpenApplications];
  char v6 = [v5 containsObject:v4];

  return v6;
}

- (BOOL)isApplicationInstalled:(id)a3
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  id v4 = a3;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v5 = [(CRKDevice *)self installedApplicationInfo];
  uint64_t v6 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v6)
  {
    uint64_t v7 = *(void *)v13;
    while (2)
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v13 != v7) {
          objc_enumerationMutation(v5);
        }
        uint64_t v9 = +[CRKApplicationInfo bundleIdentifierFromDictionaryRepresentation:*(void *)(*((void *)&v12 + 1) + 8 * i)];
        char v10 = [v9 isEqualToString:v4];

        if (v10)
        {
          LOBYTE(v6) = 1;
          goto LABEL_11;
        }
      }
      uint64_t v6 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
      if (v6) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return v6;
}

- (id)description
{
  id v3 = NSString;
  v9.receiver = self;
  v9.super_class = (Class)CRKDevice;
  id v4 = [(CRKDevice *)&v9 description];
  id v5 = [(CRKDevice *)self identifier];
  uint64_t v6 = [(CRKDevice *)self name];
  uint64_t v7 = [v3 stringWithFormat:@"%@ (identifier: %@ name: %@)", v4, v5, v6];

  return v7;
}

- (unint64_t)hash
{
  uint64_t v2 = [(CRKDevice *)self identifier];
  unint64_t v3 = [v2 hash];

  return v3;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (CRKDevice *)a3;
  if (v4 == self)
  {
    BOOL v5 = 1;
  }
  else
  {
    objc_opt_class();
    BOOL v5 = (objc_opt_isKindOfClass() & 1) != 0 && [(CRKDevice *)self isEqualToDevice:v4];
  }

  return v5;
}

- (BOOL)isEqualToDevice:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(CRKDevice *)self identifier];
  uint64_t v6 = [v4 identifier];

  if (v5 | v6) {
    char v7 = [(id)v5 isEqual:v6];
  }
  else {
    char v7 = 1;
  }

  return v7;
}

- (void)setValue:(id)a3 forUndefinedKey:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  uint64_t v8 = +[CRKDevice CRKKeyForDMFKey:v6];
  if (v8)
  {
    [(CRKDevice *)self setValue:v7 forKey:v8];
  }
  else
  {
    v9.receiver = self;
    v9.super_class = (Class)CRKDevice;
    [(CRKDevice *)&v9 setValue:v7 forUndefinedKey:v6];
  }
}

- (id)valueForUndefinedKey:(id)a3
{
  id v4 = a3;
  uint64_t v5 = +[CRKDevice CRKKeyForDMFKey:v4];
  if (v5)
  {
    uint64_t v6 = [(CRKDevice *)self valueForKey:v5];
  }
  else
  {
    v9.receiver = self;
    v9.super_class = (Class)CRKDevice;
    uint64_t v6 = [(CRKDevice *)&v9 valueForUndefinedKey:v4];
  }
  id v7 = (void *)v6;

  return v7;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = objc_alloc((Class)objc_opt_class());
  uint64_t v5 = [(CRKDevice *)self identifier];
  uint64_t v6 = (void *)[v4 initWithIdentifier:v5];

  if (v6)
  {
    id v7 = [(CRKDevice *)self serialNumber];
    [v6 setSerialNumber:v7];

    uint64_t v8 = [(CRKDevice *)self trustedExchangeIdentifier];
    [v6 setTrustedExchangeIdentifier:v8];

    objc_msgSend(v6, "setPlatform:", -[CRKDevice platform](self, "platform"));
    objc_super v9 = [(CRKDevice *)self model];
    [v6 setModel:v9];

    char v10 = [(CRKDevice *)self name];
    [v6 setName:v10];

    uint64_t v11 = [(CRKDevice *)self systemName];
    [v6 setSystemName:v11];

    long long v12 = [(CRKDevice *)self systemVersion];
    [v6 setSystemVersion:v12];

    long long v13 = [(CRKDevice *)self buildVersion];
    [v6 setBuildVersion:v13];

    objc_msgSend(v6, "setSupervised:", -[CRKDevice isSupervised](self, "isSupervised"));
    objc_msgSend(v6, "setEphemeralMultiUser:", -[CRKDevice isEphemeralMultiUser](self, "isEphemeralMultiUser"));
    [(CRKDevice *)self batteryLevel];
    objc_msgSend(v6, "setBatteryLevel:");
    objc_msgSend(v6, "setLowBattery:", -[CRKDevice isLowBattery](self, "isLowBattery"));
    objc_msgSend(v6, "setChargingState:", -[CRKDevice chargingState](self, "chargingState"));
    objc_msgSend(v6, "setLockState:", -[CRKDevice lockState](self, "lockState"));
    objc_msgSend(v6, "setScreenState:", -[CRKDevice screenState](self, "screenState"));
    objc_msgSend(v6, "setScreenSaverActive:", -[CRKDevice isScreenSaverActive](self, "isScreenSaverActive"));
    [(CRKDevice *)self volume];
    objc_msgSend(v6, "setVolume:");
    objc_msgSend(v6, "setMuted:", -[CRKDevice isMuted](self, "isMuted"));
    objc_msgSend(v6, "setAvailableBytes:", -[CRKDevice availableBytes](self, "availableBytes"));
    objc_msgSend(v6, "setDeviceOrientation:", -[CRKDevice deviceOrientation](self, "deviceOrientation"));
    objc_msgSend(v6, "setInterfaceOrientation:", -[CRKDevice interfaceOrientation](self, "interfaceOrientation"));
    long long v14 = [(CRKDevice *)self displays];
    [v6 setDisplays:v14];

    [(CRKDevice *)self displayBackingScaleFactor];
    objc_msgSend(v6, "setDisplayBackingScaleFactor:");
    [(CRKDevice *)self displayWidth];
    objc_msgSend(v6, "setDisplayWidth:");
    [(CRKDevice *)self displayHeight];
    objc_msgSend(v6, "setDisplayHeight:");
    long long v15 = [(CRKDevice *)self primaryOpenApplication];
    [v6 setPrimaryOpenApplication:v15];

    v16 = [(CRKDevice *)self secondaryOpenApplication];
    [v6 setSecondaryOpenApplication:v16];

    uint64_t v17 = [(CRKDevice *)self pipOpenApplication];
    [v6 setPipOpenApplication:v17];

    uint64_t v18 = [(CRKDevice *)self allOpenApplications];
    [v6 setAllOpenApplications:v18];

    objc_msgSend(v6, "setAppLocked:", -[CRKDevice isAppLocked](self, "isAppLocked"));
    uint64_t v19 = [(CRKDevice *)self installedApplicationInfo];
    [v6 setInstalledApplicationInfo:v19];

    uint64_t v20 = [(CRKDevice *)self stagedAdHocIdentityCertificateFingerprint];
    [v6 setStagedAdHocIdentityCertificateFingerprint:v20];

    uint64_t v21 = [(CRKDevice *)self trustedAnchorCertificateFingerprints];
    [v6 setTrustedAnchorCertificateFingerprints:v21];

    uint64_t v22 = [(CRKDevice *)self userIdentifier];
    [v6 setUserIdentifier:v22];

    uint64_t v23 = [(CRKDevice *)self userDisplayName];
    [v6 setUserDisplayName:v23];

    uint64_t v24 = [(CRKDevice *)self userGivenName];
    [v6 setUserGivenName:v24];

    uint64_t v25 = [(CRKDevice *)self userFamilyName];
    [v6 setUserFamilyName:v25];

    uint64_t v26 = [(CRKDevice *)self userPhoneticGivenName];
    [v6 setUserPhoneticGivenName:v26];

    uint64_t v27 = [(CRKDevice *)self userPhoneticFamilyName];
    [v6 setUserPhoneticFamilyName:v27];

    uint64_t v28 = [(CRKDevice *)self userImageURL];
    [v6 setUserImageURL:v28];

    objc_msgSend(v6, "setLoginState:", -[CRKDevice loginState](self, "loginState"));
    objc_msgSend(v6, "setPasscodeEnabled:", -[CRKDevice isPasscodeEnabled](self, "isPasscodeEnabled"));
    uint64_t v29 = [(CRKDevice *)self studentImageIdentifier];
    [v6 setStudentImageIdentifier:v29];

    uint64_t v30 = [(CRKDevice *)self instructorImageIdentifier];
    [v6 setInstructorImageIdentifier:v30];

    objc_msgSend(v6, "setRequestingUnenroll:", -[CRKDevice isRequestingUnenroll](self, "isRequestingUnenroll"));
    uint64_t v31 = [(CRKDevice *)self currentLocaleIdentifier];
    [v6 setCurrentLocaleIdentifier:v31];

    uint64_t v32 = [(CRKDevice *)self activeAirPlayRoute];
    [v6 setActiveAirPlayRoute:v32];

    uint64_t v33 = [(CRKDevice *)self availableAirPlayRoutes];
    [v6 setAvailableAirPlayRoutes:v33];

    uint64_t v34 = [(CRKDevice *)self managementLockPasscode];
    [v6 setManagementLockPasscode:v34];
  }
  return v6;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (CRKDevice)initWithCoder:(id)a3
{
  v167[2] = *MEMORY[0x263EF8340];
  id v4 = a3;
  uint64_t v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"identifier"];
  if (v5)
  {
    uint64_t v6 = [(CRKDevice *)self initWithIdentifier:v5];
    if (v6)
    {
      v166 = v5;
      id v7 = objc_msgSend(MEMORY[0x263EFFA08], "setWithObjects:", objc_opt_class(), 0);
      uint64_t v8 = [v4 decodeObjectOfClasses:v7 forKey:@"serialNumber"];
      serialNumber = v6->_serialNumber;
      v6->_serialNumber = (NSString *)v8;

      char v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"platform"];
      v6->_platform = [v10 integerValue];

      uint64_t v11 = objc_msgSend(MEMORY[0x263EFFA08], "setWithObjects:", objc_opt_class(), 0);
      uint64_t v12 = [v4 decodeObjectOfClasses:v11 forKey:@"model"];
      model = v6->_model;
      v6->_model = (NSString *)v12;

      long long v14 = objc_msgSend(MEMORY[0x263EFFA08], "setWithObjects:", objc_opt_class(), 0);
      uint64_t v15 = [v4 decodeObjectOfClasses:v14 forKey:@"name"];
      name = v6->_name;
      v6->_name = (NSString *)v15;

      uint64_t v17 = objc_msgSend(MEMORY[0x263EFFA08], "setWithObjects:", objc_opt_class(), 0);
      uint64_t v18 = [v4 decodeObjectOfClasses:v17 forKey:@"systemName"];
      systemName = v6->_systemName;
      v6->_systemName = (NSString *)v18;

      uint64_t v20 = objc_msgSend(MEMORY[0x263EFFA08], "setWithObjects:", objc_opt_class(), 0);
      uint64_t v21 = [v4 decodeObjectOfClasses:v20 forKey:@"systemVersion"];
      systemVersion = v6->_systemVersion;
      v6->_systemVersion = (NSString *)v21;

      uint64_t v23 = objc_msgSend(MEMORY[0x263EFFA08], "setWithObjects:", objc_opt_class(), 0);
      uint64_t v24 = [v4 decodeObjectOfClasses:v23 forKey:@"buildVersion"];
      buildVersion = v6->_buildVersion;
      v6->_buildVersion = (NSString *)v24;

      uint64_t v26 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"supervised"];
      v6->_supervised = [v26 BOOLValue];

      uint64_t v27 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"ephemeralMultiUser"];
      v6->_ephemeralMultiUser = [v27 BOOLValue];

      uint64_t v28 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"batteryLevel"];
      [v28 doubleValue];
      *(float *)&double v29 = v29;
      v6->_batteryLevel = *(float *)&v29;

      uint64_t v30 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"lowBattery"];
      v6->_lowBattery = [v30 BOOLValue];

      uint64_t v31 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"chargingState"];
      v6->_chargingState = [v31 integerValue];

      uint64_t v32 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"lockState"];
      v6->_lockState = [v32 integerValue];

      uint64_t v33 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"screenState"];
      v6->_screenState = [v33 integerValue];

      uint64_t v34 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"screenSaverActive"];
      v6->_screenSaverActive = [v34 BOOLValue];

      uint64_t v35 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"volume"];
      [v35 doubleValue];
      *(float *)&double v36 = v36;
      v6->_volume = *(float *)&v36;

      uint64_t v37 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"muted"];
      v6->_muted = [v37 BOOLValue];

      uint64_t v38 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"availableBytes"];
      v6->_availableBytes = [v38 unsignedLongLongValue];

      v39 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"deviceOrientation"];
      v6->_deviceOrientation = [v39 integerValue];

      v40 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"interfaceOrientation"];
      v6->_interfaceOrientation = [v40 integerValue];

      v41 = (void *)MEMORY[0x263EFFA08];
      uint64_t v42 = objc_opt_class();
      uint64_t v43 = objc_opt_class();
      uint64_t v44 = objc_opt_class();
      v45 = objc_msgSend(v41, "setWithObjects:", v42, v43, v44, objc_opt_class(), 0);
      uint64_t v46 = [v4 decodeObjectOfClasses:v45 forKey:@"displays"];
      displays = v6->_displays;
      v6->_displays = (NSArray *)v46;

      v48 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"displayBackingScaleFactor"];
      [v48 doubleValue];
      *(float *)&double v49 = v49;
      v6->_displayBackingScaleFactor = *(float *)&v49;

      v50 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"displayWidth"];
      [v50 doubleValue];
      *(float *)&double v51 = v51;
      v6->_displayWidth = *(float *)&v51;

      v52 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"displayHeight"];
      [v52 doubleValue];
      *(float *)&double v53 = v53;
      v6->_displayHeight = *(float *)&v53;

      v54 = objc_msgSend(MEMORY[0x263EFFA08], "setWithObjects:", objc_opt_class(), 0);
      uint64_t v55 = [v4 decodeObjectOfClasses:v54 forKey:@"primaryOpenApplication"];
      primaryOpenApplication = v6->_primaryOpenApplication;
      v6->_primaryOpenApplication = (NSString *)v55;

      v57 = objc_msgSend(MEMORY[0x263EFFA08], "setWithObjects:", objc_opt_class(), 0);
      uint64_t v58 = [v4 decodeObjectOfClasses:v57 forKey:@"secondaryOpenApplication"];
      secondaryOpenApplication = v6->_secondaryOpenApplication;
      v6->_secondaryOpenApplication = (NSString *)v58;

      v60 = objc_msgSend(MEMORY[0x263EFFA08], "setWithObjects:", objc_opt_class(), 0);
      uint64_t v61 = [v4 decodeObjectOfClasses:v60 forKey:@"pipOpenApplication"];
      pipOpenApplication = v6->_pipOpenApplication;
      v6->_pipOpenApplication = (NSString *)v61;

      v63 = (void *)MEMORY[0x263EFFA08];
      uint64_t v64 = objc_opt_class();
      v65 = objc_msgSend(v63, "setWithObjects:", v64, objc_opt_class(), 0);
      uint64_t v66 = [v4 decodeObjectOfClasses:v65 forKey:@"allOpenApplications"];
      allOpenApplications = v6->_allOpenApplications;
      v6->_allOpenApplications = (NSArray *)v66;

      v68 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"appLocked"];
      v6->_appLocked = [v68 BOOLValue];

      if ([v4 containsValueForKey:@"installedApplicationInfo"])
      {
        v163 = (void *)MEMORY[0x263EFFA08];
        uint64_t v160 = objc_opt_class();
        uint64_t v157 = objc_opt_class();
        uint64_t v154 = objc_opt_class();
        uint64_t v69 = objc_opt_class();
        uint64_t v70 = objc_opt_class();
        uint64_t v71 = objc_opt_class();
        uint64_t v72 = objc_opt_class();
        uint64_t v73 = objc_opt_class();
        uint64_t v74 = objc_opt_class();
        uint64_t v75 = objc_opt_class();
        v76 = objc_msgSend(v163, "setWithObjects:", v160, v157, v154, v69, v70, v71, v72, v73, v74, v75, objc_opt_class(), 0);
        uint64_t v77 = [v4 decodeObjectOfClasses:v76 forKey:@"installedApplicationInfo"];
        installedApplicationInfo = v6->_installedApplicationInfo;
        v6->_installedApplicationInfo = (NSArray *)v77;
      }
      if (!v6->_installedApplicationInfo)
      {
        v79 = (void *)MEMORY[0x263EFFA08];
        v167[0] = objc_opt_class();
        v167[1] = objc_opt_class();
        v80 = [MEMORY[0x263EFF8C0] arrayWithObjects:v167 count:2];
        v81 = [v79 setWithArray:v80];
        v82 = [v4 decodeObjectOfClasses:v81 forKey:@"installedApplications"];

        uint64_t v83 = [(id)objc_opt_class() applicationInfoFromBundleIdentifiers:v82];
        v84 = v6->_installedApplicationInfo;
        v6->_installedApplicationInfo = (NSArray *)v83;
      }
      v85 = objc_msgSend(MEMORY[0x263EFFA08], "setWithObjects:", objc_opt_class(), 0);
      uint64_t v86 = [v4 decodeObjectOfClasses:v85 forKey:@"stagedAdHocIdentityCertificateFingerprint"];
      stagedAdHocIdentityCertificateFingerprint = v6->_stagedAdHocIdentityCertificateFingerprint;
      v6->_stagedAdHocIdentityCertificateFingerprint = (NSString *)v86;

      v88 = (void *)MEMORY[0x263EFFA08];
      uint64_t v89 = objc_opt_class();
      v90 = objc_msgSend(v88, "setWithObjects:", v89, objc_opt_class(), 0);
      uint64_t v91 = [v4 decodeObjectOfClasses:v90 forKey:@"trustedAnchorCertificateFingerprints"];
      trustedAnchorCertificateFingerprints = v6->_trustedAnchorCertificateFingerprints;
      v6->_trustedAnchorCertificateFingerprints = (NSArray *)v91;

      v93 = objc_msgSend(MEMORY[0x263EFFA08], "setWithObjects:", objc_opt_class(), 0);
      uint64_t v94 = [v4 decodeObjectOfClasses:v93 forKey:@"userIdentifier"];
      userIdentifier = v6->_userIdentifier;
      v6->_userIdentifier = (NSString *)v94;

      v96 = objc_msgSend(MEMORY[0x263EFFA08], "setWithObjects:", objc_opt_class(), 0);
      uint64_t v97 = [v4 decodeObjectOfClasses:v96 forKey:@"userDisplayName"];
      userDisplayName = v6->_userDisplayName;
      v6->_userDisplayName = (NSString *)v97;

      v99 = objc_msgSend(MEMORY[0x263EFFA08], "setWithObjects:", objc_opt_class(), 0);
      uint64_t v100 = [v4 decodeObjectOfClasses:v99 forKey:@"userGivenName"];
      userGivenName = v6->_userGivenName;
      v6->_userGivenName = (NSString *)v100;

      v102 = objc_msgSend(MEMORY[0x263EFFA08], "setWithObjects:", objc_opt_class(), 0);
      uint64_t v103 = [v4 decodeObjectOfClasses:v102 forKey:@"userFamilyName"];
      userFamilyName = v6->_userFamilyName;
      v6->_userFamilyName = (NSString *)v103;

      v105 = objc_msgSend(MEMORY[0x263EFFA08], "setWithObjects:", objc_opt_class(), 0);
      uint64_t v106 = [v4 decodeObjectOfClasses:v105 forKey:@"userPhoneticGivenName"];
      userPhoneticGivenName = v6->_userPhoneticGivenName;
      v6->_userPhoneticGivenName = (NSString *)v106;

      v108 = objc_msgSend(MEMORY[0x263EFFA08], "setWithObjects:", objc_opt_class(), 0);
      uint64_t v109 = [v4 decodeObjectOfClasses:v108 forKey:@"userPhoneticFamilyName"];
      userPhoneticFamilyName = v6->_userPhoneticFamilyName;
      v6->_userPhoneticFamilyName = (NSString *)v109;

      v111 = objc_msgSend(MEMORY[0x263EFFA08], "setWithObjects:", objc_opt_class(), 0);
      uint64_t v112 = [v4 decodeObjectOfClasses:v111 forKey:@"userImageURL"];
      userImageURL = v6->_userImageURL;
      v6->_userImageURL = (NSString *)v112;

      v114 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"loginState"];
      v6->_loginState = [v114 integerValue];

      v115 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"passcodeEnabled"];
      v6->_passcodeEnabled = [v115 BOOLValue];

      v116 = objc_msgSend(MEMORY[0x263EFFA08], "setWithObjects:", objc_opt_class(), 0);
      uint64_t v117 = [v4 decodeObjectOfClasses:v116 forKey:@"studentImageIdentifier"];
      studentImageIdentifier = v6->_studentImageIdentifier;
      v6->_studentImageIdentifier = (NSString *)v117;

      v119 = objc_msgSend(MEMORY[0x263EFFA08], "setWithObjects:", objc_opt_class(), 0);
      uint64_t v120 = [v4 decodeObjectOfClasses:v119 forKey:@"instructorImageIdentifier"];
      instructorImageIdentifier = v6->_instructorImageIdentifier;
      v6->_instructorImageIdentifier = (NSString *)v120;

      v122 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"requestingUnenroll"];
      v6->_requestingUnenroll = [v122 BOOLValue];

      v123 = objc_msgSend(MEMORY[0x263EFFA08], "setWithObjects:", objc_opt_class(), 0);
      uint64_t v124 = [v4 decodeObjectOfClasses:v123 forKey:@"currentLocaleIdentifier"];
      currentLocaleIdentifier = v6->_currentLocaleIdentifier;
      v6->_currentLocaleIdentifier = (NSString *)v124;

      v164 = (void *)MEMORY[0x263EFFA08];
      uint64_t v161 = objc_opt_class();
      uint64_t v158 = objc_opt_class();
      uint64_t v155 = objc_opt_class();
      uint64_t v126 = objc_opt_class();
      uint64_t v127 = objc_opt_class();
      uint64_t v128 = objc_opt_class();
      uint64_t v129 = objc_opt_class();
      uint64_t v130 = objc_opt_class();
      uint64_t v131 = objc_opt_class();
      uint64_t v132 = objc_opt_class();
      v133 = objc_msgSend(v164, "setWithObjects:", v161, v158, v155, v126, v127, v128, v129, v130, v131, v132, objc_opt_class(), 0);
      uint64_t v134 = [v4 decodeObjectOfClasses:v133 forKey:@"activeAirPlayRoute"];
      activeAirPlayRoute = v6->_activeAirPlayRoute;
      v6->_activeAirPlayRoute = (NSDictionary *)v134;

      v165 = (void *)MEMORY[0x263EFFA08];
      uint64_t v162 = objc_opt_class();
      uint64_t v159 = objc_opt_class();
      uint64_t v156 = objc_opt_class();
      uint64_t v136 = objc_opt_class();
      uint64_t v137 = objc_opt_class();
      uint64_t v138 = objc_opt_class();
      uint64_t v139 = objc_opt_class();
      uint64_t v140 = objc_opt_class();
      uint64_t v141 = objc_opt_class();
      uint64_t v142 = objc_opt_class();
      v143 = objc_msgSend(v165, "setWithObjects:", v162, v159, v156, v136, v137, v138, v139, v140, v141, v142, objc_opt_class(), 0);
      uint64_t v144 = [v4 decodeObjectOfClasses:v143 forKey:@"availableAirPlayRoutes"];
      availableAirPlayRoutes = v6->_availableAirPlayRoutes;
      v6->_availableAirPlayRoutes = (NSArray *)v144;

      v146 = objc_msgSend(MEMORY[0x263EFFA08], "setWithObjects:", objc_opt_class(), 0);
      uint64_t v147 = [v4 decodeObjectOfClasses:v146 forKey:@"managementLockPasscode"];
      managementLockPasscode = v6->_managementLockPasscode;
      v6->_managementLockPasscode = (NSString *)v147;

      v149 = objc_msgSend(MEMORY[0x263EFFA08], "setWithObjects:", objc_opt_class(), 0);
      uint64_t v150 = [v4 decodeObjectOfClasses:v149 forKey:@"trustedExchangeIdentifier"];
      trustedExchangeIdentifier = v6->_trustedExchangeIdentifier;
      v6->_trustedExchangeIdentifier = (NSString *)v150;

      uint64_t v5 = v166;
    }
    self = v6;
    v152 = self;
  }
  else
  {
    v152 = 0;
  }

  return v152;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(CRKDevice *)self identifier];
  [v4 encodeObject:v5 forKey:@"identifier"];

  uint64_t v6 = [(CRKDevice *)self serialNumber];
  [v4 encodeObject:v6 forKey:@"serialNumber"];

  id v7 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[CRKDevice platform](self, "platform"));
  [v4 encodeObject:v7 forKey:@"platform"];

  uint64_t v8 = [(CRKDevice *)self model];
  [v4 encodeObject:v8 forKey:@"model"];

  objc_super v9 = [(CRKDevice *)self name];
  [v4 encodeObject:v9 forKey:@"name"];

  char v10 = [(CRKDevice *)self systemName];
  [v4 encodeObject:v10 forKey:@"systemName"];

  uint64_t v11 = [(CRKDevice *)self systemVersion];
  [v4 encodeObject:v11 forKey:@"systemVersion"];

  uint64_t v12 = [(CRKDevice *)self buildVersion];
  [v4 encodeObject:v12 forKey:@"buildVersion"];

  long long v13 = objc_msgSend(NSNumber, "numberWithBool:", -[CRKDevice isSupervised](self, "isSupervised"));
  [v4 encodeObject:v13 forKey:@"supervised"];

  long long v14 = objc_msgSend(NSNumber, "numberWithBool:", -[CRKDevice isEphemeralMultiUser](self, "isEphemeralMultiUser"));
  [v4 encodeObject:v14 forKey:@"ephemeralMultiUser"];

  uint64_t v15 = NSNumber;
  [(CRKDevice *)self batteryLevel];
  v16 = objc_msgSend(v15, "numberWithFloat:");
  [v4 encodeObject:v16 forKey:@"batteryLevel"];

  uint64_t v17 = objc_msgSend(NSNumber, "numberWithBool:", -[CRKDevice isLowBattery](self, "isLowBattery"));
  [v4 encodeObject:v17 forKey:@"lowBattery"];

  uint64_t v18 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[CRKDevice chargingState](self, "chargingState"));
  [v4 encodeObject:v18 forKey:@"chargingState"];

  uint64_t v19 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[CRKDevice lockState](self, "lockState"));
  [v4 encodeObject:v19 forKey:@"lockState"];

  uint64_t v20 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[CRKDevice screenState](self, "screenState"));
  [v4 encodeObject:v20 forKey:@"screenState"];

  uint64_t v21 = objc_msgSend(NSNumber, "numberWithBool:", -[CRKDevice isScreenSaverActive](self, "isScreenSaverActive"));
  [v4 encodeObject:v21 forKey:@"screenSaverActive"];

  uint64_t v22 = NSNumber;
  [(CRKDevice *)self volume];
  uint64_t v23 = objc_msgSend(v22, "numberWithFloat:");
  [v4 encodeObject:v23 forKey:@"volume"];

  uint64_t v24 = objc_msgSend(NSNumber, "numberWithBool:", -[CRKDevice isMuted](self, "isMuted"));
  [v4 encodeObject:v24 forKey:@"muted"];

  uint64_t v25 = objc_msgSend(NSNumber, "numberWithUnsignedLongLong:", -[CRKDevice availableBytes](self, "availableBytes"));
  [v4 encodeObject:v25 forKey:@"availableBytes"];

  uint64_t v26 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[CRKDevice deviceOrientation](self, "deviceOrientation"));
  [v4 encodeObject:v26 forKey:@"deviceOrientation"];

  uint64_t v27 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[CRKDevice interfaceOrientation](self, "interfaceOrientation"));
  [v4 encodeObject:v27 forKey:@"interfaceOrientation"];

  uint64_t v28 = [(CRKDevice *)self displays];
  [v4 encodeObject:v28 forKey:@"displays"];

  double v29 = NSNumber;
  [(CRKDevice *)self displayBackingScaleFactor];
  uint64_t v30 = objc_msgSend(v29, "numberWithFloat:");
  [v4 encodeObject:v30 forKey:@"displayBackingScaleFactor"];

  uint64_t v31 = NSNumber;
  [(CRKDevice *)self displayWidth];
  uint64_t v32 = objc_msgSend(v31, "numberWithFloat:");
  [v4 encodeObject:v32 forKey:@"displayWidth"];

  uint64_t v33 = NSNumber;
  [(CRKDevice *)self displayHeight];
  uint64_t v34 = objc_msgSend(v33, "numberWithFloat:");
  [v4 encodeObject:v34 forKey:@"displayHeight"];

  uint64_t v35 = [(CRKDevice *)self primaryOpenApplication];
  [v4 encodeObject:v35 forKey:@"primaryOpenApplication"];

  double v36 = [(CRKDevice *)self secondaryOpenApplication];
  [v4 encodeObject:v36 forKey:@"secondaryOpenApplication"];

  uint64_t v37 = [(CRKDevice *)self pipOpenApplication];
  [v4 encodeObject:v37 forKey:@"pipOpenApplication"];

  uint64_t v38 = [(CRKDevice *)self allOpenApplications];
  [v4 encodeObject:v38 forKey:@"allOpenApplications"];

  v39 = objc_msgSend(NSNumber, "numberWithBool:", -[CRKDevice isAppLocked](self, "isAppLocked"));
  [v4 encodeObject:v39 forKey:@"appLocked"];

  v40 = [(CRKDevice *)self installedApplications];
  [v4 encodeObject:v40 forKey:@"installedApplications"];

  v41 = [(CRKDevice *)self installedApplicationInfo];
  [v4 encodeObject:v41 forKey:@"installedApplicationInfo"];

  uint64_t v42 = [(CRKDevice *)self stagedAdHocIdentityCertificateFingerprint];
  [v4 encodeObject:v42 forKey:@"stagedAdHocIdentityCertificateFingerprint"];

  uint64_t v43 = [(CRKDevice *)self trustedAnchorCertificateFingerprints];
  [v4 encodeObject:v43 forKey:@"trustedAnchorCertificateFingerprints"];

  uint64_t v44 = [(CRKDevice *)self userIdentifier];
  [v4 encodeObject:v44 forKey:@"userIdentifier"];

  v45 = [(CRKDevice *)self userDisplayName];
  [v4 encodeObject:v45 forKey:@"userDisplayName"];

  uint64_t v46 = [(CRKDevice *)self userGivenName];
  [v4 encodeObject:v46 forKey:@"userGivenName"];

  v47 = [(CRKDevice *)self userFamilyName];
  [v4 encodeObject:v47 forKey:@"userFamilyName"];

  v48 = [(CRKDevice *)self userPhoneticGivenName];
  [v4 encodeObject:v48 forKey:@"userPhoneticGivenName"];

  double v49 = [(CRKDevice *)self userPhoneticFamilyName];
  [v4 encodeObject:v49 forKey:@"userPhoneticFamilyName"];

  v50 = [(CRKDevice *)self userImageURL];
  [v4 encodeObject:v50 forKey:@"userImageURL"];

  double v51 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[CRKDevice loginState](self, "loginState"));
  [v4 encodeObject:v51 forKey:@"loginState"];

  v52 = objc_msgSend(NSNumber, "numberWithBool:", -[CRKDevice isPasscodeEnabled](self, "isPasscodeEnabled"));
  [v4 encodeObject:v52 forKey:@"passcodeEnabled"];

  double v53 = [(CRKDevice *)self studentImageIdentifier];
  [v4 encodeObject:v53 forKey:@"studentImageIdentifier"];

  v54 = [(CRKDevice *)self instructorImageIdentifier];
  [v4 encodeObject:v54 forKey:@"instructorImageIdentifier"];

  uint64_t v55 = objc_msgSend(NSNumber, "numberWithBool:", -[CRKDevice isRequestingUnenroll](self, "isRequestingUnenroll"));
  [v4 encodeObject:v55 forKey:@"requestingUnenroll"];

  v56 = [(CRKDevice *)self currentLocaleIdentifier];
  [v4 encodeObject:v56 forKey:@"currentLocaleIdentifier"];

  v57 = [(CRKDevice *)self activeAirPlayRoute];
  [v4 encodeObject:v57 forKey:@"activeAirPlayRoute"];

  uint64_t v58 = [(CRKDevice *)self availableAirPlayRoutes];
  [v4 encodeObject:v58 forKey:@"availableAirPlayRoutes"];

  v59 = [(CRKDevice *)self managementLockPasscode];
  [v4 encodeObject:v59 forKey:@"managementLockPasscode"];

  id v60 = [(CRKDevice *)self trustedExchangeIdentifier];
  [v4 encodeObject:v60 forKey:@"trustedExchangeIdentifier"];
}

+ (id)applicationInfoFromBundleIdentifiers:(id)a3
{
  return (id)objc_msgSend(a3, "crk_mapUsingBlock:", &__block_literal_global_106);
}

id __50__CRKDevice_applicationInfoFromBundleIdentifiers___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  unint64_t v3 = [[CRKApplicationInfo alloc] initWithBundleIdentifier:v2 shortVersionString:0];

  id v4 = [(CRKApplicationInfo *)v3 dictionaryRepresentation];

  return v4;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (NSString)serialNumber
{
  return self->_serialNumber;
}

- (void)setSerialNumber:(id)a3
{
}

- (NSString)trustedExchangeIdentifier
{
  return self->_trustedExchangeIdentifier;
}

- (void)setTrustedExchangeIdentifier:(id)a3
{
}

- (unint64_t)platform
{
  return self->_platform;
}

- (void)setPlatform:(unint64_t)a3
{
  self->_platform = a3;
}

- (NSString)model
{
  return self->_model;
}

- (void)setModel:(id)a3
{
}

- (NSString)name
{
  return self->_name;
}

- (void)setName:(id)a3
{
}

- (NSString)systemName
{
  return self->_systemName;
}

- (void)setSystemName:(id)a3
{
}

- (NSString)systemVersion
{
  return self->_systemVersion;
}

- (void)setSystemVersion:(id)a3
{
}

- (NSString)buildVersion
{
  return self->_buildVersion;
}

- (void)setBuildVersion:(id)a3
{
}

- (BOOL)isSupervised
{
  return self->_supervised;
}

- (void)setSupervised:(BOOL)a3
{
  self->_supervised = a3;
}

- (BOOL)isEphemeralMultiUser
{
  return self->_ephemeralMultiUser;
}

- (void)setEphemeralMultiUser:(BOOL)a3
{
  self->_ephemeralMultiUser = a3;
}

- (float)batteryLevel
{
  return self->_batteryLevel;
}

- (void)setBatteryLevel:(float)a3
{
  self->_batteryLevel = a3;
}

- (BOOL)isLowBattery
{
  return self->_lowBattery;
}

- (void)setLowBattery:(BOOL)a3
{
  self->_lowBattery = a3;
}

- (unint64_t)chargingState
{
  return self->_chargingState;
}

- (void)setChargingState:(unint64_t)a3
{
  self->_chargingState = a3;
}

- (unint64_t)lockState
{
  return self->_lockState;
}

- (void)setLockState:(unint64_t)a3
{
  self->_lockState = a3;
}

- (unint64_t)screenState
{
  return self->_screenState;
}

- (void)setScreenState:(unint64_t)a3
{
  self->_screenState = a3;
}

- (BOOL)isScreenSaverActive
{
  return self->_screenSaverActive;
}

- (void)setScreenSaverActive:(BOOL)a3
{
  self->_screenSaverActive = a3;
}

- (float)volume
{
  return self->_volume;
}

- (void)setVolume:(float)a3
{
  self->_volume = a3;
}

- (BOOL)isMuted
{
  return self->_muted;
}

- (void)setMuted:(BOOL)a3
{
  self->_muted = a3;
}

- (unint64_t)availableBytes
{
  return self->_availableBytes;
}

- (void)setAvailableBytes:(unint64_t)a3
{
  self->_availableBytes = a3;
}

- (unint64_t)deviceOrientation
{
  return self->_deviceOrientation;
}

- (void)setDeviceOrientation:(unint64_t)a3
{
  self->_deviceOrientation = a3;
}

- (unint64_t)interfaceOrientation
{
  return self->_interfaceOrientation;
}

- (void)setInterfaceOrientation:(unint64_t)a3
{
  self->_interfaceOrientation = a3;
}

- (NSArray)displays
{
  return self->_displays;
}

- (void)setDisplays:(id)a3
{
}

- (float)displayBackingScaleFactor
{
  return self->_displayBackingScaleFactor;
}

- (void)setDisplayBackingScaleFactor:(float)a3
{
  self->_displayBackingScaleFactor = a3;
}

- (float)displayWidth
{
  return self->_displayWidth;
}

- (void)setDisplayWidth:(float)a3
{
  self->_displayWidth = a3;
}

- (float)displayHeight
{
  return self->_displayHeight;
}

- (void)setDisplayHeight:(float)a3
{
  self->_displayHeight = a3;
}

- (NSString)primaryOpenApplication
{
  return self->_primaryOpenApplication;
}

- (void)setPrimaryOpenApplication:(id)a3
{
}

- (NSString)secondaryOpenApplication
{
  return self->_secondaryOpenApplication;
}

- (void)setSecondaryOpenApplication:(id)a3
{
}

- (NSArray)allOpenApplications
{
  return self->_allOpenApplications;
}

- (void)setAllOpenApplications:(id)a3
{
}

- (BOOL)isAppLocked
{
  return self->_appLocked;
}

- (void)setAppLocked:(BOOL)a3
{
  self->_appLocked = a3;
}

- (NSArray)installedApplicationInfo
{
  return self->_installedApplicationInfo;
}

- (void)setInstalledApplicationInfo:(id)a3
{
}

- (NSString)stagedAdHocIdentityCertificateFingerprint
{
  return self->_stagedAdHocIdentityCertificateFingerprint;
}

- (void)setStagedAdHocIdentityCertificateFingerprint:(id)a3
{
}

- (NSArray)trustedAnchorCertificateFingerprints
{
  return self->_trustedAnchorCertificateFingerprints;
}

- (void)setTrustedAnchorCertificateFingerprints:(id)a3
{
}

- (NSString)userIdentifier
{
  return self->_userIdentifier;
}

- (void)setUserIdentifier:(id)a3
{
}

- (NSString)userDisplayName
{
  return self->_userDisplayName;
}

- (void)setUserDisplayName:(id)a3
{
}

- (NSString)userGivenName
{
  return self->_userGivenName;
}

- (void)setUserGivenName:(id)a3
{
}

- (NSString)userPhoneticGivenName
{
  return self->_userPhoneticGivenName;
}

- (void)setUserPhoneticGivenName:(id)a3
{
}

- (NSString)userFamilyName
{
  return self->_userFamilyName;
}

- (void)setUserFamilyName:(id)a3
{
}

- (NSString)userPhoneticFamilyName
{
  return self->_userPhoneticFamilyName;
}

- (void)setUserPhoneticFamilyName:(id)a3
{
}

- (NSString)userImageURL
{
  return self->_userImageURL;
}

- (void)setUserImageURL:(id)a3
{
}

- (unint64_t)loginState
{
  return self->_loginState;
}

- (void)setLoginState:(unint64_t)a3
{
  self->_loginState = a3;
}

- (BOOL)isPasscodeEnabled
{
  return self->_passcodeEnabled;
}

- (void)setPasscodeEnabled:(BOOL)a3
{
  self->_passcodeEnabled = a3;
}

- (NSString)studentImageIdentifier
{
  return self->_studentImageIdentifier;
}

- (void)setStudentImageIdentifier:(id)a3
{
}

- (NSString)instructorImageIdentifier
{
  return self->_instructorImageIdentifier;
}

- (void)setInstructorImageIdentifier:(id)a3
{
}

- (BOOL)isRequestingUnenroll
{
  return self->_requestingUnenroll;
}

- (void)setRequestingUnenroll:(BOOL)a3
{
  self->_requestingUnenroll = a3;
}

- (NSString)currentLocaleIdentifier
{
  return self->_currentLocaleIdentifier;
}

- (void)setCurrentLocaleIdentifier:(id)a3
{
}

- (NSDictionary)activeAirPlayRoute
{
  return self->_activeAirPlayRoute;
}

- (void)setActiveAirPlayRoute:(id)a3
{
}

- (NSArray)availableAirPlayRoutes
{
  return self->_availableAirPlayRoutes;
}

- (void)setAvailableAirPlayRoutes:(id)a3
{
}

- (NSString)managementLockPasscode
{
  return self->_managementLockPasscode;
}

- (void)setManagementLockPasscode:(id)a3
{
}

- (BOOL)isOrientationLocked
{
  return self->_orientationLocked;
}

- (void)setOrientationLocked:(BOOL)a3
{
  self->_orientationLocked = a3;
}

- (NSString)pipOpenApplication
{
  return self->_pipOpenApplication;
}

- (void)setPipOpenApplication:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pipOpenApplication, 0);
  objc_storeStrong((id *)&self->_managementLockPasscode, 0);
  objc_storeStrong((id *)&self->_availableAirPlayRoutes, 0);
  objc_storeStrong((id *)&self->_activeAirPlayRoute, 0);
  objc_storeStrong((id *)&self->_currentLocaleIdentifier, 0);
  objc_storeStrong((id *)&self->_instructorImageIdentifier, 0);
  objc_storeStrong((id *)&self->_studentImageIdentifier, 0);
  objc_storeStrong((id *)&self->_userImageURL, 0);
  objc_storeStrong((id *)&self->_userPhoneticFamilyName, 0);
  objc_storeStrong((id *)&self->_userFamilyName, 0);
  objc_storeStrong((id *)&self->_userPhoneticGivenName, 0);
  objc_storeStrong((id *)&self->_userGivenName, 0);
  objc_storeStrong((id *)&self->_userDisplayName, 0);
  objc_storeStrong((id *)&self->_userIdentifier, 0);
  objc_storeStrong((id *)&self->_trustedAnchorCertificateFingerprints, 0);
  objc_storeStrong((id *)&self->_stagedAdHocIdentityCertificateFingerprint, 0);
  objc_storeStrong((id *)&self->_installedApplicationInfo, 0);
  objc_storeStrong((id *)&self->_allOpenApplications, 0);
  objc_storeStrong((id *)&self->_secondaryOpenApplication, 0);
  objc_storeStrong((id *)&self->_primaryOpenApplication, 0);
  objc_storeStrong((id *)&self->_displays, 0);
  objc_storeStrong((id *)&self->_buildVersion, 0);
  objc_storeStrong((id *)&self->_systemVersion, 0);
  objc_storeStrong((id *)&self->_systemName, 0);
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_model, 0);
  objc_storeStrong((id *)&self->_trustedExchangeIdentifier, 0);
  objc_storeStrong((id *)&self->_serialNumber, 0);

  objc_storeStrong((id *)&self->_identifier, 0);
}

- (CRKDevice)initWithIdentifier:(id)a3
{
  id v5 = a3;
  if (!v5)
  {
    char v10 = [MEMORY[0x263F08690] currentHandler];
    [v10 handleFailureInMethod:a2, self, @"CRKDevice.m", 473, @"Invalid parameter not satisfying: %@", @"identifier" object file lineNumber description];
  }
  v11.receiver = self;
  v11.super_class = (Class)CRKDevice;
  uint64_t v6 = [(CRKDevice *)&v11 init];
  if (v6)
  {
    uint64_t v7 = [v5 copy];
    identifier = v6->_identifier;
    v6->_identifier = (NSString *)v7;
  }
  return v6;
}

@end