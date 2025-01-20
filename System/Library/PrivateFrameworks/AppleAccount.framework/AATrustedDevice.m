@interface AATrustedDevice
- (AATrustedDevice)initWithDictionary:(id)a3;
- (BOOL)currentDevice;
- (BOOL)fmipEnabled;
- (BOOL)injectNativeHeader;
- (BOOL)showBackupRow;
- (BOOL)showFMIPLink;
- (BOOL)showFMIPRow;
- (NSString)FMIPDeviceID;
- (NSString)backupUUID;
- (NSString)detailDeviceName;
- (NSString)detailSubLabel;
- (NSString)deviceDetailHttpMethod;
- (NSString)deviceDetailUri;
- (NSString)deviceID;
- (NSString)deviceQualifiedClass;
- (NSString)model;
- (NSString)modelDisplayName;
- (NSString)modelLargePhotoURL1x;
- (NSString)modelLargePhotoURL2x;
- (NSString)modelLargePhotoURL3x;
- (NSString)modelSmallPhotoURL1x;
- (NSString)modelSmallPhotoURL2x;
- (NSString)modelSmallPhotoURL3x;
- (NSString)name;
- (NSString)osVersion;
- (NSString)pushToken;
- (NSString)rawLatestBackup;
- (void)updateWithRUIClientInfo:(id)a3;
@end

@implementation AATrustedDevice

- (AATrustedDevice)initWithDictionary:(id)a3
{
  id v4 = a3;
  v5 = [(AATrustedDevice *)self init];
  if (v5)
  {
    uint64_t v6 = [v4 objectForKeyedSubscript:@"id"];
    deviceID = v5->_deviceID;
    v5->_deviceID = (NSString *)v6;

    uint64_t v8 = [v4 objectForKeyedSubscript:@"name"];
    name = v5->_name;
    v5->_name = (NSString *)v8;

    uint64_t v10 = [v4 objectForKeyedSubscript:@"modelName"];
    model = v5->_model;
    v5->_model = (NSString *)v10;

    uint64_t v12 = [v4 objectForKeyedSubscript:@"osVersion"];
    osVersion = v5->_osVersion;
    v5->_osVersion = (NSString *)v12;

    v14 = [v4 objectForKeyedSubscript:@"currentDevice"];
    v5->_currentDevice = [v14 BOOLValue];

    if (v5->_currentDevice)
    {
      v15 = NSString;
      v16 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
      v17 = [v16 localizedStringForKey:@"THIS_DEVICE" value:&stru_1EF456870 table:@"Localizable"];
      v18 = [v4 objectForKeyedSubscript:@"modelName"];
      uint64_t v19 = objc_msgSend(v15, "stringWithFormat:", v17, v18);
      modelDisplayName = v5->_modelDisplayName;
      v5->_modelDisplayName = (NSString *)v19;
    }
    else
    {
      uint64_t v21 = [v4 objectForKeyedSubscript:@"modelName"];
      v16 = v5->_modelDisplayName;
      v5->_modelDisplayName = (NSString *)v21;
    }

    uint64_t v22 = [v4 objectForKeyedSubscript:@"listImageLocation"];
    modelSmallPhotoURL1x = v5->_modelSmallPhotoURL1x;
    v5->_modelSmallPhotoURL1x = (NSString *)v22;

    uint64_t v24 = [v4 objectForKeyedSubscript:@"listImageLocation2x"];
    modelSmallPhotoURL2x = v5->_modelSmallPhotoURL2x;
    v5->_modelSmallPhotoURL2x = (NSString *)v24;

    uint64_t v26 = [v4 objectForKeyedSubscript:@"listImageLocation3x"];
    modelSmallPhotoURL3x = v5->_modelSmallPhotoURL3x;
    v5->_modelSmallPhotoURL3x = (NSString *)v26;

    uint64_t v28 = [v4 objectForKeyedSubscript:@"infoboxImageLocation"];
    modelLargePhotoURL1x = v5->_modelLargePhotoURL1x;
    v5->_modelLargePhotoURL1x = (NSString *)v28;

    uint64_t v30 = [v4 objectForKeyedSubscript:@"infoboxImageLocation2x"];
    modelLargePhotoURL2x = v5->_modelLargePhotoURL2x;
    v5->_modelLargePhotoURL2x = (NSString *)v30;

    uint64_t v32 = [v4 objectForKeyedSubscript:@"infoboxImageLocation3x"];
    modelLargePhotoURL3x = v5->_modelLargePhotoURL3x;
    v5->_modelLargePhotoURL3x = (NSString *)v32;

    uint64_t v34 = [v4 objectForKeyedSubscript:@"deviceDetailUri"];
    deviceDetailUri = v5->_deviceDetailUri;
    v5->_deviceDetailUri = (NSString *)v34;

    uint64_t v36 = [v4 objectForKeyedSubscript:@"deviceDetailHttpMethod"];
    deviceDetailHttpMethod = v5->_deviceDetailHttpMethod;
    v5->_deviceDetailHttpMethod = (NSString *)v36;

    uint64_t v38 = [v4 objectForKeyedSubscript:@"pushToken"];
    pushToken = v5->_pushToken;
    v5->_pushToken = (NSString *)v38;
  }
  return v5;
}

- (void)updateWithRUIClientInfo:(id)a3
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = [v4 objectForKeyedSubscript:@"showFMIPLink"];
  self->_showFMIPLink = [v5 BOOLValue];

  uint64_t v6 = [v4 objectForKeyedSubscript:@"deviceFmipDeviceId"];
  FMIPDeviceID = self->_FMIPDeviceID;
  self->_FMIPDeviceID = v6;

  uint64_t v8 = [v4 objectForKeyedSubscript:@"deviceName"];
  detailDeviceName = self->_detailDeviceName;
  self->_detailDeviceName = v8;

  uint64_t v10 = [v4 objectForKeyedSubscript:@"deviceSubLabel"];
  detailSubLabel = self->_detailSubLabel;
  self->_detailSubLabel = v10;

  uint64_t v12 = [v4 objectForKeyedSubscript:@"rawLatestBackup"];
  rawLatestBackup = self->_rawLatestBackup;
  self->_rawLatestBackup = v12;

  v14 = [v4 objectForKeyedSubscript:@"backupUuid"];
  backupUUID = self->_backupUUID;
  self->_backupUUID = v14;

  if ([(NSString *)self->_rawLatestBackup isEqualToString:&stru_1EF456870])
  {
    v16 = self->_rawLatestBackup;
    self->_rawLatestBackup = 0;
  }
  v17 = [v4 objectForKeyedSubscript:@"deviceFmipEnabled"];
  self->_fmipEnabled = [v17 BOOLValue];

  v18 = [v4 objectForKeyedSubscript:@"deviceQualifiedClass"];
  deviceQualifiedClass = self->_deviceQualifiedClass;
  self->_deviceQualifiedClass = v18;

  v20 = [v4 objectForKeyedSubscript:@"showDeviceHeaderNatively"];
  self->_injectNativeHeader = [v20 BOOLValue];

  uint64_t v21 = [v4 objectForKeyedSubscript:@"showFMIPRow"];
  uint64_t v22 = _AALogSystem();
  if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
  {
    int v25 = 138412290;
    uint64_t v26 = v21;
    _os_log_impl(&dword_1A11D8000, v22, OS_LOG_TYPE_DEFAULT, "TrustedDevice server response: showFMIP %@", (uint8_t *)&v25, 0xCu);
  }

  if (v21) {
    self->_showFMIPRow = [v21 BOOLValue];
  }
  v23 = [v4 objectForKeyedSubscript:@"showBackupRow"];
  uint64_t v24 = _AALogSystem();
  if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
  {
    int v25 = 138412290;
    uint64_t v26 = v23;
    _os_log_impl(&dword_1A11D8000, v24, OS_LOG_TYPE_DEFAULT, "TrustedDevice server response: showBackup %@", (uint8_t *)&v25, 0xCu);
  }

  if (v23) {
    self->_showBackupRow = [v23 BOOLValue];
  }
}

- (NSString)deviceID
{
  return self->_deviceID;
}

- (NSString)name
{
  return self->_name;
}

- (NSString)model
{
  return self->_model;
}

- (NSString)osVersion
{
  return self->_osVersion;
}

- (NSString)modelDisplayName
{
  return self->_modelDisplayName;
}

- (NSString)modelSmallPhotoURL3x
{
  return self->_modelSmallPhotoURL3x;
}

- (NSString)modelSmallPhotoURL2x
{
  return self->_modelSmallPhotoURL2x;
}

- (NSString)modelSmallPhotoURL1x
{
  return self->_modelSmallPhotoURL1x;
}

- (NSString)modelLargePhotoURL3x
{
  return self->_modelLargePhotoURL3x;
}

- (NSString)modelLargePhotoURL2x
{
  return self->_modelLargePhotoURL2x;
}

- (NSString)modelLargePhotoURL1x
{
  return self->_modelLargePhotoURL1x;
}

- (NSString)deviceDetailUri
{
  return self->_deviceDetailUri;
}

- (NSString)deviceDetailHttpMethod
{
  return self->_deviceDetailHttpMethod;
}

- (NSString)pushToken
{
  return self->_pushToken;
}

- (BOOL)fmipEnabled
{
  return self->_fmipEnabled;
}

- (BOOL)currentDevice
{
  return self->_currentDevice;
}

- (BOOL)showFMIPLink
{
  return self->_showFMIPLink;
}

- (BOOL)showBackupRow
{
  return self->_showBackupRow;
}

- (BOOL)showFMIPRow
{
  return self->_showFMIPRow;
}

- (BOOL)injectNativeHeader
{
  return self->_injectNativeHeader;
}

- (NSString)FMIPDeviceID
{
  return self->_FMIPDeviceID;
}

- (NSString)detailDeviceName
{
  return self->_detailDeviceName;
}

- (NSString)detailSubLabel
{
  return self->_detailSubLabel;
}

- (NSString)deviceQualifiedClass
{
  return self->_deviceQualifiedClass;
}

- (NSString)rawLatestBackup
{
  return self->_rawLatestBackup;
}

- (NSString)backupUUID
{
  return self->_backupUUID;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_backupUUID, 0);
  objc_storeStrong((id *)&self->_rawLatestBackup, 0);
  objc_storeStrong((id *)&self->_deviceQualifiedClass, 0);
  objc_storeStrong((id *)&self->_detailSubLabel, 0);
  objc_storeStrong((id *)&self->_detailDeviceName, 0);
  objc_storeStrong((id *)&self->_FMIPDeviceID, 0);
  objc_storeStrong((id *)&self->_pushToken, 0);
  objc_storeStrong((id *)&self->_deviceDetailHttpMethod, 0);
  objc_storeStrong((id *)&self->_deviceDetailUri, 0);
  objc_storeStrong((id *)&self->_modelLargePhotoURL1x, 0);
  objc_storeStrong((id *)&self->_modelLargePhotoURL2x, 0);
  objc_storeStrong((id *)&self->_modelLargePhotoURL3x, 0);
  objc_storeStrong((id *)&self->_modelSmallPhotoURL1x, 0);
  objc_storeStrong((id *)&self->_modelSmallPhotoURL2x, 0);
  objc_storeStrong((id *)&self->_modelSmallPhotoURL3x, 0);
  objc_storeStrong((id *)&self->_modelDisplayName, 0);
  objc_storeStrong((id *)&self->_osVersion, 0);
  objc_storeStrong((id *)&self->_model, 0);
  objc_storeStrong((id *)&self->_name, 0);

  objc_storeStrong((id *)&self->_deviceID, 0);
}

@end