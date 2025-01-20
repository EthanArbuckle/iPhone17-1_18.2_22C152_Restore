@interface CRVehicle
+ (BOOL)supportsSecureCoding;
+ (id)vehicleForMessagingVehicle:(id)a3;
- (BOOL)isEnhancedIntegrationEnabled;
- (BOOL)isEqual:(id)a3;
- (BOOL)isPaired;
- (BOOL)isSiriBargeInDisabled;
- (BOOL)requiresBonjour;
- (BOOL)setWallpaper:(id)a3 forDisplayWithID:(id)a4 requiresDarkAppearance:(BOOL)a5;
- (BOOL)supportsBluetoothLE;
- (BOOL)supportsEnhancedIntegration;
- (BOOL)supportsMixableAudio;
- (BOOL)supportsUSBCarPlay;
- (BOOL)supportsWirelessCarPlay;
- (CRSystemWallpaperData)previousSystemWallpaperData;
- (CRSystemWallpaperData)systemWallpaperData;
- (CRVehicle)init;
- (CRVehicle)initWithCoder:(id)a3;
- (CRVehicle)initWithIdentifier:(id)a3 certificateSerial:(id)a4;
- (NSData)certificateSerialNumber;
- (NSDate)lastConnectedDate;
- (NSDictionary)colorFilterIntensityPreference;
- (NSDictionary)displayThemeData;
- (NSNumber)clusterAssetVersion;
- (NSNumber)disabledFeaturesPreference;
- (NSNumber)finishedWelcome;
- (NSNumber)hasGaugeClusterScreen;
- (NSNumber)stagedClusterAssetVersion;
- (NSNumber)supportsStartSessionRequest;
- (NSNumber)supportsThemeAssets;
- (NSSet)accessoryProtocols;
- (NSString)PPID;
- (NSString)SDKVersion;
- (NSString)_axColorFiltersAnalyticsString;
- (NSString)_axSoundRecognitionAnalyticsString;
- (NSString)bluetoothAddress;
- (NSString)carplayWiFiUUID;
- (NSString)clusterAssetIdentifier;
- (NSString)clusterAssetiOSContentVersion;
- (NSString)internalNotes;
- (NSString)previousWallpaperIdentifier;
- (NSString)stagedClusterAssetiOSContentVersion;
- (NSString)vehicleModelName;
- (NSString)vehicleName;
- (NSString)wallpaperDescription;
- (NSString)wallpaperIdentifier;
- (NSURL)clusterAssetURL;
- (NSURL)stagedClusterAssetURL;
- (NSUUID)identifier;
- (id)_axColorFiltersIntensityStringForNumber:(id)a3;
- (id)_enhancedIntegrationDebugDescription;
- (id)_pairingDebugDescription;
- (id)assetDescription;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)displayName;
- (id)wallpaperForDisplayWithID:(id)a3;
- (int64_t)albumArtUserPreference;
- (int64_t)appearanceModePreference;
- (int64_t)boldTextPreference;
- (int64_t)colorFilterPreference;
- (int64_t)mapsAppearancePreference;
- (int64_t)voiceControlPreference;
- (unint64_t)enhancedIntegrationStatus;
- (unint64_t)hash;
- (unint64_t)pairingStatus;
- (unint64_t)soundRecognitionPreference;
- (void)encodeWithCoder:(id)a3;
- (void)mergeAttributesFromVehicle:(id)a3;
- (void)setAccessoryProtocols:(id)a3;
- (void)setAlbumArtUserPreference:(int64_t)a3;
- (void)setAppearanceModePreference:(int64_t)a3;
- (void)setBluetoothAddress:(id)a3;
- (void)setBoldTextPreference:(int64_t)a3;
- (void)setCarplayWiFiUUID:(id)a3;
- (void)setCertificateSerialNumber:(id)a3;
- (void)setClusterAssetIdentifier:(id)a3;
- (void)setClusterAssetURL:(id)a3;
- (void)setClusterAssetVersion:(id)a3;
- (void)setClusterAssetiOSContentVersion:(id)a3;
- (void)setColorFilterIntensityPreference:(id)a3;
- (void)setColorFilterPreference:(int64_t)a3;
- (void)setDisabledFeaturesPreference:(id)a3;
- (void)setDisplayThemeData:(id)a3;
- (void)setEnhancedIntegrationStatus:(unint64_t)a3;
- (void)setFinishedWelcome:(id)a3;
- (void)setHasGaugeClusterScreen:(id)a3;
- (void)setIdentifier:(id)a3;
- (void)setInternalNotes:(id)a3;
- (void)setLastConnectedDate:(id)a3;
- (void)setMapsAppearancePreference:(int64_t)a3;
- (void)setPPID:(id)a3;
- (void)setPairingStatus:(unint64_t)a3;
- (void)setPreviousSystemWallpaperData:(id)a3;
- (void)setPreviousWallpaperIdentifier:(id)a3;
- (void)setSDKVersion:(id)a3;
- (void)setSiriBargeInDisabled:(BOOL)a3;
- (void)setSoundRecognitionPreference:(unint64_t)a3;
- (void)setStagedClusterAssetURL:(id)a3;
- (void)setStagedClusterAssetVersion:(id)a3;
- (void)setStagedClusterAssetiOSContentVersion:(id)a3;
- (void)setSupportsBluetoothLE:(BOOL)a3;
- (void)setSupportsEnhancedIntegration:(BOOL)a3;
- (void)setSupportsMixableAudio:(BOOL)a3;
- (void)setSupportsStartSessionRequest:(id)a3;
- (void)setSupportsThemeAssets:(id)a3;
- (void)setSupportsUSBCarPlay:(BOOL)a3;
- (void)setSupportsWirelessCarPlay:(BOOL)a3;
- (void)setSystemWallpaperData:(id)a3;
- (void)setVehicleModelName:(id)a3;
- (void)setVehicleName:(id)a3;
- (void)setVoiceControlPreference:(int64_t)a3;
- (void)setWallpaperIdentifier:(id)a3;
@end

@implementation CRVehicle

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (CRVehicle)init
{
  return [(CRVehicle *)self initWithIdentifier:0 certificateSerial:0];
}

- (CRVehicle)initWithIdentifier:(id)a3 certificateSerial:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v12.receiver = self;
  v12.super_class = (Class)CRVehicle;
  v8 = [(CRVehicle *)&v12 init];
  v9 = v8;
  if (v8)
  {
    if (v6)
    {
      [(CRVehicle *)v8 setIdentifier:v6];
    }
    else
    {
      v10 = [MEMORY[0x1E4F29128] UUID];
      [(CRVehicle *)v9 setIdentifier:v10];
    }
    [(CRVehicle *)v9 setCertificateSerialNumber:v7];
    [(CRVehicle *)v9 setPairingStatus:0];
    [(CRVehicle *)v9 setEnhancedIntegrationStatus:0];
    [(CRVehicle *)v9 setAlbumArtUserPreference:0];
    [(CRVehicle *)v9 setAppearanceModePreference:-1];
    [(CRVehicle *)v9 setMapsAppearancePreference:-1];
    [(CRVehicle *)v9 setColorFilterPreference:0];
    [(CRVehicle *)v9 setBoldTextPreference:0];
    [(CRVehicle *)v9 setSoundRecognitionPreference:0];
    [(CRVehicle *)v9 setVoiceControlPreference:0];
  }

  return v9;
}

- (CRVehicle)initWithCoder:(id)a3
{
  id v4 = a3;
  v49.receiver = self;
  v49.super_class = (Class)CRVehicle;
  v5 = [(CRVehicle *)&v49 init];

  if (!v5) {
    goto LABEL_92;
  }
  if ([v4 containsValueForKey:@"identifier"])
  {
    id v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"identifier"];
    [(CRVehicle *)v5 setIdentifier:v6];
  }
  if ([v4 containsValueForKey:@"vehicleName"])
  {
    id v7 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"vehicleName"];
    [(CRVehicle *)v5 setVehicleName:v7];
  }
  if ([v4 containsValueForKey:@"certificateSerialNumber"])
  {
    v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"certificateSerialNumber"];
    [(CRVehicle *)v5 setCertificateSerialNumber:v8];
  }
  if ([v4 containsValueForKey:@"pairingStatus"])
  {
    v9 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"pairingStatus"];
    -[CRVehicle setPairingStatus:](v5, "setPairingStatus:", [v9 integerValue]);
  }
  if ([v4 containsValueForKey:@"enhancedIntegration"])
  {
    v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"enhancedIntegration"];
    -[CRVehicle setEnhancedIntegrationStatus:](v5, "setEnhancedIntegrationStatus:", [v10 integerValue]);
  }
  if ([v4 containsValueForKey:@"supportsEnhancedIntegration"])
  {
    v11 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"supportsEnhancedIntegration"];
    -[CRVehicle setSupportsEnhancedIntegration:](v5, "setSupportsEnhancedIntegration:", [v11 BOOLValue]);
  }
  if ([v4 containsValueForKey:@"supportsStartSessionRequest"])
  {
    objc_super v12 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"supportsStartSessionRequest"];
    [(CRVehicle *)v5 setSupportsStartSessionRequest:v12];
  }
  if ([v4 containsValueForKey:@"bluetoothAddress"])
  {
    v13 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"bluetoothAddress"];
    [(CRVehicle *)v5 setBluetoothAddress:v13];
  }
  if ([v4 containsValueForKey:@"carplayWiFiUUID"])
  {
    v14 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"carplayWiFiUUID"];
    [(CRVehicle *)v5 setCarplayWiFiUUID:v14];
  }
  if ([v4 containsValueForKey:@"carplayProtocols"])
  {
    v15 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v16 = objc_opt_class();
    v17 = objc_msgSend(v15, "setWithObjects:", v16, objc_opt_class(), 0);
    v18 = [v4 decodeObjectOfClasses:v17 forKey:@"carplayProtocols"];
    [(CRVehicle *)v5 setAccessoryProtocols:v18];
  }
  if ([v4 containsValueForKey:@"lastConnectionTime"])
  {
    v19 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"lastConnectionTime"];
    [(CRVehicle *)v5 setLastConnectedDate:v19];
  }
  if ([v4 containsValueForKey:@"vehicleModelName"])
  {
    v20 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"vehicleModelName"];
    [(CRVehicle *)v5 setVehicleModelName:v20];
  }
  if ([v4 containsValueForKey:@"ppid"])
  {
    v21 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"ppid"];
    [(CRVehicle *)v5 setPPID:v21];
  }
  if ([v4 containsValueForKey:@"albumArtUserPreference"]) {
    -[CRVehicle setAlbumArtUserPreference:](v5, "setAlbumArtUserPreference:", [v4 decodeIntegerForKey:@"albumArtUserPreference"]);
  }
  if ([v4 containsValueForKey:@"supportsUSBCarPlay"])
  {
    uint64_t v22 = [v4 decodeBoolForKey:@"supportsUSBCarPlay"];
  }
  else
  {
    v23 = [(CRVehicle *)v5 bluetoothAddress];

    if (v23) {
      goto LABEL_35;
    }
    uint64_t v22 = 1;
  }
  [(CRVehicle *)v5 setSupportsUSBCarPlay:v22];
LABEL_35:
  if ([v4 containsValueForKey:@"supportsWirelessCarPlay"])
  {
    uint64_t v24 = [v4 decodeBoolForKey:@"supportsWirelessCarPlay"];
LABEL_39:
    [(CRVehicle *)v5 setSupportsWirelessCarPlay:v24];
    goto LABEL_40;
  }
  v25 = [(CRVehicle *)v5 bluetoothAddress];

  if (v25)
  {
    uint64_t v24 = 1;
    goto LABEL_39;
  }
LABEL_40:
  if ([v4 containsValueForKey:@"wallpaperIdentifierUserPreference"])
  {
    v26 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"wallpaperIdentifierUserPreference"];
    [(CRVehicle *)v5 setWallpaperIdentifier:v26];
  }
  if ([v4 containsValueForKey:@"previousWallpaperIdentifierUserPreference"])
  {
    v27 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"previousWallpaperIdentifierUserPreference"];
    [(CRVehicle *)v5 setPreviousWallpaperIdentifier:v27];
  }
  if ([v4 containsValueForKey:@"appearanceModeUserPreference"]) {
    -[CRVehicle setAppearanceModePreference:](v5, "setAppearanceModePreference:", [v4 decodeIntegerForKey:@"appearanceModeUserPreference"]);
  }
  if ([v4 containsValueForKey:@"mapsAppearancePreference"]) {
    -[CRVehicle setMapsAppearancePreference:](v5, "setMapsAppearancePreference:", [v4 decodeIntegerForKey:@"mapsAppearancePreference"]);
  }
  if ([v4 containsValueForKey:@"colorFilterPreference"]) {
    -[CRVehicle setColorFilterPreference:](v5, "setColorFilterPreference:", [v4 decodeIntegerForKey:@"colorFilterPreference"]);
  }
  if ([v4 containsValueForKey:@"colorFilterIntensityPreference"])
  {
    uint64_t v28 = objc_opt_class();
    v29 = [v4 decodeDictionaryWithKeysOfClass:v28 objectsOfClass:objc_opt_class() forKey:@"colorFilterIntensityPreference"];
    [(CRVehicle *)v5 setColorFilterIntensityPreference:v29];
  }
  if ([v4 containsValueForKey:@"boldTextPreference"]) {
    -[CRVehicle setBoldTextPreference:](v5, "setBoldTextPreference:", [v4 decodeIntegerForKey:@"boldTextPreference"]);
  }
  if ([v4 containsValueForKey:@"soundRecognitionPreference"]) {
    -[CRVehicle setSoundRecognitionPreference:](v5, "setSoundRecognitionPreference:", [v4 decodeIntegerForKey:@"soundRecognitionPreference"]);
  }
  if ([v4 containsValueForKey:@"voiceControlPreference"]) {
    -[CRVehicle setVoiceControlPreference:](v5, "setVoiceControlPreference:", [v4 decodeIntegerForKey:@"voiceControlPreference"]);
  }
  if ([v4 containsValueForKey:@"disabledFeaturesPreference"])
  {
    v30 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"disabledFeaturesPreference"];
    [(CRVehicle *)v5 setDisabledFeaturesPreference:v30];
  }
  if ([v4 containsValueForKey:@"supportsBluetoothLE"]) {
    -[CRVehicle setSupportsBluetoothLE:](v5, "setSupportsBluetoothLE:", [v4 decodeBoolForKey:@"supportsBluetoothLE"]);
  }
  if ([v4 containsValueForKey:@"supportsThemeAssets"])
  {
    v31 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"supportsThemeAssets"];
    [(CRVehicle *)v5 setSupportsThemeAssets:v31];
  }
  if ([v4 containsValueForKey:@"clusterAssetIdentifier"])
  {
    v32 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"clusterAssetIdentifier"];
    [(CRVehicle *)v5 setClusterAssetIdentifier:v32];
  }
  if ([v4 containsValueForKey:@"clusterAssetiOSContentVersion"])
  {
    v33 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"clusterAssetiOSContentVersion"];
    [(CRVehicle *)v5 setClusterAssetiOSContentVersion:v33];
  }
  if ([v4 containsValueForKey:@"clusterAssetVersion"])
  {
    v34 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"clusterAssetVersion"];
    [(CRVehicle *)v5 setClusterAssetVersion:v34];
  }
  if ([v4 containsValueForKey:@"SDKVersion"])
  {
    v35 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"SDKVersion"];
    [(CRVehicle *)v5 setSDKVersion:v35];
  }
  if ([v4 containsValueForKey:@"clusterAssetURL"])
  {
    v36 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"clusterAssetURL"];
    [(CRVehicle *)v5 setClusterAssetURL:v36];
  }
  if ([v4 containsValueForKey:@"stagedClusterAssetiOSContentVersion"])
  {
    v37 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"stagedClusterAssetiOSContentVersion"];
    [(CRVehicle *)v5 setStagedClusterAssetiOSContentVersion:v37];
  }
  if ([v4 containsValueForKey:@"stagedClusterAssetVersion"])
  {
    v38 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"stagedClusterAssetVersion"];
    [(CRVehicle *)v5 setStagedClusterAssetVersion:v38];
  }
  if ([v4 containsValueForKey:@"stagedClusterAssetURL"])
  {
    v39 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"stagedClusterAssetURL"];
    [(CRVehicle *)v5 setStagedClusterAssetURL:v39];
  }
  if ([v4 containsValueForKey:@"displayThemeData"])
  {
    uint64_t v40 = objc_opt_class();
    v41 = [v4 decodeDictionaryWithKeysOfClass:v40 objectsOfClass:objc_opt_class() forKey:@"displayThemeData"];
    [(CRVehicle *)v5 setDisplayThemeData:v41];
  }
  if ([v4 containsValueForKey:@"hasGaugeClusterScreen"])
  {
    v42 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"hasGaugeClusterScreen"];
    [(CRVehicle *)v5 setHasGaugeClusterScreen:v42];
  }
  if ([v4 containsValueForKey:@"finishedWelcome"])
  {
    v43 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"finishedWelcome"];
    [(CRVehicle *)v5 setFinishedWelcome:v43];
  }
  if ([v4 containsValueForKey:@"internalNotes"])
  {
    v44 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"internalNotes"];
    [(CRVehicle *)v5 setInternalNotes:v44];
  }
  if ([v4 containsValueForKey:@"isSiriBargeInDisabled"])
  {
    v45 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"isSiriBargeInDisabled"];
    -[CRVehicle setSiriBargeInDisabled:](v5, "setSiriBargeInDisabled:", [v45 BOOLValue]);
  }
  if ([v4 containsValueForKey:@"supportsMixableAudio"])
  {
    v46 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"supportsMixableAudio"];
    -[CRVehicle setSupportsMixableAudio:](v5, "setSupportsMixableAudio:", [v46 BOOLValue]);
  }
LABEL_92:
  v47 = v5;

  return v47;
}

- (void)encodeWithCoder:(id)a3
{
  id v63 = a3;
  id v4 = [(CRVehicle *)self identifier];

  if (v4)
  {
    v5 = [(CRVehicle *)self identifier];
    [v63 encodeObject:v5 forKey:@"identifier"];
  }
  id v6 = [(CRVehicle *)self vehicleName];

  if (v6)
  {
    id v7 = [(CRVehicle *)self vehicleName];
    [v63 encodeObject:v7 forKey:@"vehicleName"];
  }
  v8 = [(CRVehicle *)self certificateSerialNumber];

  if (v8)
  {
    v9 = [(CRVehicle *)self certificateSerialNumber];
    [v63 encodeObject:v9 forKey:@"certificateSerialNumber"];
  }
  v10 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[CRVehicle pairingStatus](self, "pairingStatus"));
  [v63 encodeObject:v10 forKey:@"pairingStatus"];

  v11 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[CRVehicle enhancedIntegrationStatus](self, "enhancedIntegrationStatus"));
  [v63 encodeObject:v11 forKey:@"enhancedIntegration"];

  objc_super v12 = objc_msgSend(NSNumber, "numberWithBool:", -[CRVehicle supportsEnhancedIntegration](self, "supportsEnhancedIntegration"));
  [v63 encodeObject:v12 forKey:@"supportsEnhancedIntegration"];

  v13 = [(CRVehicle *)self supportsStartSessionRequest];

  if (v13)
  {
    v14 = [(CRVehicle *)self supportsStartSessionRequest];
    [v63 encodeObject:v14 forKey:@"supportsStartSessionRequest"];
  }
  objc_msgSend(v63, "encodeInt:forKey:", -[CRVehicle albumArtUserPreference](self, "albumArtUserPreference"), @"albumArtUserPreference");
  objc_msgSend(v63, "encodeBool:forKey:", -[CRVehicle supportsUSBCarPlay](self, "supportsUSBCarPlay"), @"supportsUSBCarPlay");
  objc_msgSend(v63, "encodeBool:forKey:", -[CRVehicle supportsWirelessCarPlay](self, "supportsWirelessCarPlay"), @"supportsWirelessCarPlay");
  v15 = [(CRVehicle *)self bluetoothAddress];

  if (v15)
  {
    uint64_t v16 = [(CRVehicle *)self bluetoothAddress];
    [v63 encodeObject:v16 forKey:@"bluetoothAddress"];
  }
  v17 = [(CRVehicle *)self carplayWiFiUUID];

  if (v17)
  {
    v18 = [(CRVehicle *)self carplayWiFiUUID];
    [v63 encodeObject:v18 forKey:@"carplayWiFiUUID"];
  }
  v19 = [(CRVehicle *)self accessoryProtocols];

  if (v19)
  {
    v20 = [(CRVehicle *)self accessoryProtocols];
    [v63 encodeObject:v20 forKey:@"carplayProtocols"];
  }
  v21 = [(CRVehicle *)self lastConnectedDate];

  if (v21)
  {
    uint64_t v22 = [(CRVehicle *)self lastConnectedDate];
    [v63 encodeObject:v22 forKey:@"lastConnectionTime"];
  }
  v23 = [(CRVehicle *)self vehicleModelName];

  if (v23)
  {
    uint64_t v24 = [(CRVehicle *)self vehicleModelName];
    [v63 encodeObject:v24 forKey:@"vehicleModelName"];
  }
  v25 = [(CRVehicle *)self PPID];

  if (v25)
  {
    v26 = [(CRVehicle *)self PPID];
    [v63 encodeObject:v26 forKey:@"ppid"];
  }
  v27 = [(CRVehicle *)self wallpaperIdentifier];

  if (v27)
  {
    uint64_t v28 = [(CRVehicle *)self wallpaperIdentifier];
    [v63 encodeObject:v28 forKey:@"wallpaperIdentifierUserPreference"];
  }
  v29 = [(CRVehicle *)self previousWallpaperIdentifier];

  if (v29)
  {
    v30 = [(CRVehicle *)self previousWallpaperIdentifier];
    [v63 encodeObject:v30 forKey:@"previousWallpaperIdentifierUserPreference"];
  }
  v31 = [(CRVehicle *)self colorFilterIntensityPreference];

  if (v31)
  {
    v32 = [(CRVehicle *)self colorFilterIntensityPreference];
    [v63 encodeObject:v32 forKey:@"colorFilterIntensityPreference"];
  }
  objc_msgSend(v63, "encodeInteger:forKey:", -[CRVehicle appearanceModePreference](self, "appearanceModePreference"), @"appearanceModeUserPreference");
  objc_msgSend(v63, "encodeInteger:forKey:", -[CRVehicle mapsAppearancePreference](self, "mapsAppearancePreference"), @"mapsAppearancePreference");
  objc_msgSend(v63, "encodeInteger:forKey:", -[CRVehicle colorFilterPreference](self, "colorFilterPreference"), @"colorFilterPreference");
  objc_msgSend(v63, "encodeInteger:forKey:", -[CRVehicle boldTextPreference](self, "boldTextPreference"), @"boldTextPreference");
  objc_msgSend(v63, "encodeInteger:forKey:", -[CRVehicle soundRecognitionPreference](self, "soundRecognitionPreference"), @"soundRecognitionPreference");
  objc_msgSend(v63, "encodeInteger:forKey:", -[CRVehicle voiceControlPreference](self, "voiceControlPreference"), @"voiceControlPreference");
  v33 = [(CRVehicle *)self disabledFeaturesPreference];

  if (v33)
  {
    v34 = [(CRVehicle *)self disabledFeaturesPreference];
    [v63 encodeObject:v34 forKey:@"disabledFeaturesPreference"];
  }
  objc_msgSend(v63, "encodeBool:forKey:", -[CRVehicle supportsBluetoothLE](self, "supportsBluetoothLE"), @"supportsBluetoothLE");
  v35 = [(CRVehicle *)self supportsThemeAssets];

  if (v35)
  {
    v36 = [(CRVehicle *)self supportsThemeAssets];
    [v63 encodeObject:v36 forKey:@"supportsThemeAssets"];
  }
  v37 = [(CRVehicle *)self clusterAssetIdentifier];

  if (v37)
  {
    v38 = [(CRVehicle *)self clusterAssetIdentifier];
    [v63 encodeObject:v38 forKey:@"clusterAssetIdentifier"];
  }
  v39 = [(CRVehicle *)self clusterAssetiOSContentVersion];

  if (v39)
  {
    uint64_t v40 = [(CRVehicle *)self clusterAssetiOSContentVersion];
    [v63 encodeObject:v40 forKey:@"clusterAssetiOSContentVersion"];
  }
  v41 = [(CRVehicle *)self clusterAssetVersion];

  if (v41)
  {
    v42 = [(CRVehicle *)self clusterAssetVersion];
    [v63 encodeObject:v42 forKey:@"clusterAssetVersion"];
  }
  v43 = [(CRVehicle *)self SDKVersion];

  if (v43)
  {
    v44 = [(CRVehicle *)self SDKVersion];
    [v63 encodeObject:v44 forKey:@"SDKVersion"];
  }
  v45 = [(CRVehicle *)self clusterAssetURL];

  if (v45)
  {
    v46 = [(CRVehicle *)self clusterAssetURL];
    [v63 encodeObject:v46 forKey:@"clusterAssetURL"];
  }
  v47 = [(CRVehicle *)self stagedClusterAssetiOSContentVersion];

  if (v47)
  {
    v48 = [(CRVehicle *)self stagedClusterAssetiOSContentVersion];
    [v63 encodeObject:v48 forKey:@"stagedClusterAssetiOSContentVersion"];
  }
  objc_super v49 = [(CRVehicle *)self stagedClusterAssetVersion];

  if (v49)
  {
    v50 = [(CRVehicle *)self stagedClusterAssetVersion];
    [v63 encodeObject:v50 forKey:@"stagedClusterAssetVersion"];
  }
  v51 = [(CRVehicle *)self stagedClusterAssetURL];

  if (v51)
  {
    v52 = [(CRVehicle *)self stagedClusterAssetURL];
    [v63 encodeObject:v52 forKey:@"stagedClusterAssetURL"];
  }
  v53 = [(CRVehicle *)self displayThemeData];

  if (v53)
  {
    v54 = [(CRVehicle *)self displayThemeData];
    [v63 encodeObject:v54 forKey:@"displayThemeData"];
  }
  v55 = [(CRVehicle *)self hasGaugeClusterScreen];

  if (v55)
  {
    v56 = [(CRVehicle *)self hasGaugeClusterScreen];
    [v63 encodeObject:v56 forKey:@"hasGaugeClusterScreen"];
  }
  v57 = [(CRVehicle *)self finishedWelcome];

  if (v57)
  {
    v58 = [(CRVehicle *)self finishedWelcome];
    [v63 encodeObject:v58 forKey:@"finishedWelcome"];
  }
  v59 = [(CRVehicle *)self internalNotes];

  if (v59)
  {
    v60 = [(CRVehicle *)self internalNotes];
    [v63 encodeObject:v60 forKey:@"internalNotes"];
  }
  if ([(CRVehicle *)self isSiriBargeInDisabled])
  {
    v61 = objc_msgSend(NSNumber, "numberWithBool:", -[CRVehicle isSiriBargeInDisabled](self, "isSiriBargeInDisabled"));
    [v63 encodeObject:v61 forKey:@"isSiriBargeInDisabled"];
  }
  if ([(CRVehicle *)self supportsMixableAudio])
  {
    v62 = objc_msgSend(NSNumber, "numberWithBool:", -[CRVehicle supportsMixableAudio](self, "supportsMixableAudio"));
    [v63 encodeObject:v62 forKey:@"supportsMixableAudio"];
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  v5 = +[CRVehicle allocWithZone:](CRVehicle, "allocWithZone:");
  id v6 = (void *)[(NSUUID *)self->_identifier copyWithZone:a3];
  id v7 = (void *)[(NSData *)self->_certificateSerialNumber copyWithZone:a3];
  uint64_t v8 = [(CRVehicle *)v5 initWithIdentifier:v6 certificateSerial:v7];

  uint64_t v9 = [(NSString *)self->_vehicleName copyWithZone:a3];
  v10 = *(void **)(v8 + 24);
  *(void *)(v8 + 24) = v9;

  *(void *)(v8 + 152) = self->_pairingStatus;
  *(void *)(v8 + 40) = self->_enhancedIntegrationStatus;
  *(unsigned char *)(v8 + 8) = self->_supportsEnhancedIntegration;
  uint64_t v11 = [(NSNumber *)self->_supportsStartSessionRequest copyWithZone:a3];
  objc_super v12 = *(void **)(v8 + 208);
  *(void *)(v8 + 208) = v11;

  *(void *)(v8 + 224) = self->_albumArtUserPreference;
  *(unsigned char *)(v8 + 9) = self->_supportsUSBCarPlay;
  *(unsigned char *)(v8 + 10) = self->_supportsWirelessCarPlay;
  uint64_t v13 = [(NSString *)self->_bluetoothAddress copyWithZone:a3];
  v14 = *(void **)(v8 + 160);
  *(void *)(v8 + 160) = v13;

  uint64_t v15 = [(NSString *)self->_carplayWiFiUUID copyWithZone:a3];
  uint64_t v16 = *(void **)(v8 + 168);
  *(void *)(v8 + 168) = v15;

  uint64_t v17 = [(NSSet *)self->_accessoryProtocols copyWithZone:a3];
  v18 = *(void **)(v8 + 32);
  *(void *)(v8 + 32) = v17;

  uint64_t v19 = [(NSDate *)self->_lastConnectedDate copyWithZone:a3];
  v20 = *(void **)(v8 + 176);
  *(void *)(v8 + 176) = v19;

  uint64_t v21 = [(NSString *)self->_vehicleModelName copyWithZone:a3];
  uint64_t v22 = *(void **)(v8 + 184);
  *(void *)(v8 + 184) = v21;

  uint64_t v23 = [(NSString *)self->_PPID copyWithZone:a3];
  uint64_t v24 = *(void **)(v8 + 192);
  *(void *)(v8 + 192) = v23;

  uint64_t v25 = [(NSString *)self->_wallpaperIdentifier copyWithZone:a3];
  v26 = *(void **)(v8 + 232);
  *(void *)(v8 + 232) = v25;

  uint64_t v27 = [(NSString *)self->_previousWallpaperIdentifier copyWithZone:a3];
  uint64_t v28 = *(void **)(v8 + 240);
  *(void *)(v8 + 240) = v27;

  *(void *)(v8 + 248) = self->_appearanceModePreference;
  *(void *)(v8 + 256) = self->_mapsAppearancePreference;
  *(void *)(v8 + 264) = self->_colorFilterPreference;
  uint64_t v29 = [(NSDictionary *)self->_colorFilterIntensityPreference copyWithZone:a3];
  v30 = *(void **)(v8 + 272);
  *(void *)(v8 + 272) = v29;

  *(void *)(v8 + 280) = self->_boldTextPreference;
  *(void *)(v8 + 288) = self->_soundRecognitionPreference;
  *(void *)(v8 + 296) = self->_voiceControlPreference;
  uint64_t v31 = [(NSNumber *)self->_disabledFeaturesPreference copyWithZone:a3];
  v32 = *(void **)(v8 + 216);
  *(void *)(v8 + 216) = v31;

  *(unsigned char *)(v8 + 11) = self->_supportsBluetoothLE;
  uint64_t v33 = [(NSNumber *)self->_supportsThemeAssets copyWithZone:a3];
  v34 = *(void **)(v8 + 48);
  *(void *)(v8 + 48) = v33;

  uint64_t v35 = [(NSString *)self->_clusterAssetiOSContentVersion copyWithZone:a3];
  v36 = *(void **)(v8 + 64);
  *(void *)(v8 + 64) = v35;

  uint64_t v37 = [(NSString *)self->_clusterAssetIdentifier copyWithZone:a3];
  v38 = *(void **)(v8 + 56);
  *(void *)(v8 + 56) = v37;

  uint64_t v39 = [(NSNumber *)self->_clusterAssetVersion copyWithZone:a3];
  uint64_t v40 = *(void **)(v8 + 72);
  *(void *)(v8 + 72) = v39;

  uint64_t v41 = [(NSString *)self->_SDKVersion copyWithZone:a3];
  v42 = *(void **)(v8 + 80);
  *(void *)(v8 + 80) = v41;

  uint64_t v43 = [(NSURL *)self->_clusterAssetURL copyWithZone:a3];
  v44 = *(void **)(v8 + 88);
  *(void *)(v8 + 88) = v43;

  uint64_t v45 = [(NSString *)self->_stagedClusterAssetiOSContentVersion copyWithZone:a3];
  v46 = *(void **)(v8 + 96);
  *(void *)(v8 + 96) = v45;

  uint64_t v47 = [(NSNumber *)self->_stagedClusterAssetVersion copyWithZone:a3];
  v48 = *(void **)(v8 + 104);
  *(void *)(v8 + 104) = v47;

  uint64_t v49 = [(NSURL *)self->_stagedClusterAssetURL copyWithZone:a3];
  v50 = *(void **)(v8 + 112);
  *(void *)(v8 + 112) = v49;

  uint64_t v51 = [(NSDictionary *)self->_displayThemeData copyWithZone:a3];
  v52 = *(void **)(v8 + 120);
  *(void *)(v8 + 120) = v51;

  uint64_t v53 = [(NSNumber *)self->_hasGaugeClusterScreen copyWithZone:a3];
  v54 = *(void **)(v8 + 128);
  *(void *)(v8 + 128) = v53;

  uint64_t v55 = [(NSNumber *)self->_finishedWelcome copyWithZone:a3];
  v56 = *(void **)(v8 + 136);
  *(void *)(v8 + 136) = v55;

  uint64_t v57 = [(NSString *)self->_internalNotes copyWithZone:a3];
  v58 = *(void **)(v8 + 200);
  *(void *)(v8 + 200) = v57;

  *(unsigned char *)(v8 + 12) = self->_siriBargeInDisabled;
  *(unsigned char *)(v8 + 13) = self->_supportsMixableAudio;
  return (id)v8;
}

+ (id)vehicleForMessagingVehicle:(id)a3
{
  id v3 = a3;
  id v4 = [v3 certificateSerialNumber];
  if (v4)
  {
    v5 = [CRVehicle alloc];
    id v6 = [MEMORY[0x1E4F29128] UUID];
    id v7 = [(CRVehicle *)v5 initWithIdentifier:v6 certificateSerial:v4];

    uint64_t v8 = [v3 vehicleName];
    [(CRVehicle *)v7 setVehicleName:v8];

    uint64_t v9 = [v3 bluetoothAddress];
    [(CRVehicle *)v7 setBluetoothAddress:v9];

    v10 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v11 = [v3 accessoryProtocols];
    objc_super v12 = [v10 setWithArray:v11];
    [(CRVehicle *)v7 setAccessoryProtocols:v12];

    -[CRVehicle setSupportsEnhancedIntegration:](v7, "setSupportsEnhancedIntegration:", [v3 supportsEnhancedIntegration]);
    if ([v3 transportType] != 3)
    {
      uint64_t v13 = objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(v3, "supportsCarPlayConnectionRequest"));
      [(CRVehicle *)v7 setSupportsStartSessionRequest:v13];
    }
    -[CRVehicle setSupportsUSBCarPlay:](v7, "setSupportsUSBCarPlay:", [v3 supportsUSBCarPlay]);
    -[CRVehicle setSupportsWirelessCarPlay:](v7, "setSupportsWirelessCarPlay:", [v3 supportsWirelessCarPlay]);
    -[CRVehicle setSupportsBluetoothLE:](v7, "setSupportsBluetoothLE:", [v3 supportsBluetoothLE]);
    v14 = objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(v3, "supportsThemeAssets"));
    [(CRVehicle *)v7 setSupportsThemeAssets:v14];

    uint64_t v15 = [v3 PPID];
    [(CRVehicle *)v7 setPPID:v15];

    if (CRIsInternalInstall())
    {
      uint64_t v16 = [MEMORY[0x1E4F1C9C8] date];
      [(CRVehicle *)v7 setLastConnectedDate:v16];
    }
  }
  else
  {
    id v7 = 0;
  }

  return v7;
}

- (BOOL)isPaired
{
  return [(CRVehicle *)self pairingStatus] == 2;
}

- (id)_pairingDebugDescription
{
  unint64_t v2 = [(CRVehicle *)self pairingStatus];
  if (v2 > 2) {
    return 0;
  }
  else {
    return off_1E5E3B110[v2];
  }
}

- (BOOL)isEnhancedIntegrationEnabled
{
  return [(CRVehicle *)self enhancedIntegrationStatus] == 2;
}

- (id)_enhancedIntegrationDebugDescription
{
  unint64_t v2 = [(CRVehicle *)self enhancedIntegrationStatus];
  id v3 = @"unknown";
  if (v2 == 1) {
    id v3 = @"declined";
  }
  if (v2 == 2) {
    return @"accepted";
  }
  else {
    return v3;
  }
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v5 = [(CRVehicle *)self identifier];
    id v6 = [v4 identifier];
    char v7 = [v5 isEqual:v6];
  }
  else
  {
    char v7 = 0;
  }

  return v7;
}

- (unint64_t)hash
{
  unint64_t v2 = [(CRVehicle *)self identifier];
  unint64_t v3 = [v2 hash];

  return v3;
}

- (id)description
{
  uint64_t v29 = NSString;
  uint64_t v3 = [(CRVehicle *)self vehicleName];
  id v4 = @"<unnamed>";
  uint64_t v33 = (void *)v3;
  if (v3) {
    id v4 = (__CFString *)v3;
  }
  uint64_t v28 = v4;
  v32 = [(CRVehicle *)self identifier];
  uint64_t v5 = [v32 UUIDString];
  uint64_t v6 = [(CRVehicle *)self PPID];
  v34 = [(CRVehicle *)self _pairingDebugDescription];
  uint64_t v31 = [(CRVehicle *)self supportsStartSessionRequest];
  if (v31)
  {
    uint64_t v21 = [(CRVehicle *)self supportsStartSessionRequest];
    if ([v21 BOOLValue]) {
      char v7 = @"YES";
    }
    else {
      char v7 = @"NO";
    }
    v26 = v7;
  }
  else
  {
    v26 = @"unset";
  }
  uint64_t v27 = [(CRVehicle *)self supportsThemeAssets];
  uint64_t v35 = (void *)v6;
  v36 = (void *)v5;
  if (v27)
  {
    v20 = [(CRVehicle *)self supportsThemeAssets];
    if ([v20 BOOLValue]) {
      uint64_t v8 = @"YES";
    }
    else {
      uint64_t v8 = @"NO";
    }
    uint64_t v25 = v8;
  }
  else
  {
    uint64_t v25 = @"unset";
  }
  uint64_t v24 = [(CRVehicle *)self clusterAssetIdentifier];
  uint64_t v9 = [(CRVehicle *)self clusterAssetiOSContentVersion];
  v10 = [(CRVehicle *)self clusterAssetVersion];
  uint64_t v23 = [(CRVehicle *)self _enhancedIntegrationDebugDescription];
  uint64_t v22 = [(CRVehicle *)self disabledFeaturesPreference];
  if ([(CRVehicle *)self isSiriBargeInDisabled]) {
    uint64_t v11 = @"YES";
  }
  else {
    uint64_t v11 = @"NO";
  }
  if ([(CRVehicle *)self supportsMixableAudio]) {
    objc_super v12 = @"YES";
  }
  else {
    objc_super v12 = @"NO";
  }
  uint64_t v13 = objc_msgSend(NSNumber, "numberWithInteger:", -[CRVehicle albumArtUserPreference](self, "albumArtUserPreference"));
  v14 = [(CRVehicle *)self bluetoothAddress];
  uint64_t v15 = [(CRVehicle *)self carplayWiFiUUID];
  uint64_t v16 = [(CRVehicle *)self accessoryProtocols];
  uint64_t v17 = [(CRVehicle *)self lastConnectedDate];
  v18 = [(CRVehicle *)self vehicleModelName];
  objc_msgSend(v29, "stringWithFormat:", @"%@ (identifier: %@, PPID: %@, pairing: %@, startSessionRequest: %@, cluster{supported: %@ id: %@ versions{ %@, %@}, enhancedIntegration: %@, disabledFeatures: %@, isSiriBargeInDisabled: %@, supportsMixableAudio: %@, albumArtUserPreference: %@, %@: %@, %@: %@, %@: %@, %@: %@, %@: %@)", v28, v36, v35, v34, v26, v25, v24, v9, v10, v23, v22, v11, v12, v13, @"bluetoothAddress", v14,
    @"carplayWiFiUUID",
    v15,
    @"carplayProtocols",
    v16,
    @"lastConnectionTime",
    v17,
    @"vehicleModelName",
  v30 = v18);

  if (v27) {
  if (v31)
  }

  return v30;
}

- (void)mergeAttributesFromVehicle:(id)a3
{
  id v56 = a3;
  id v4 = [v56 certificateSerialNumber];

  if (v4)
  {
    uint64_t v5 = [v56 certificateSerialNumber];
    [(CRVehicle *)self setCertificateSerialNumber:v5];
  }
  uint64_t v6 = [v56 vehicleName];

  if (v6)
  {
    char v7 = [v56 vehicleName];
    [(CRVehicle *)self setVehicleName:v7];
  }
  if ([v56 pairingStatus]) {
    -[CRVehicle setPairingStatus:](self, "setPairingStatus:", [v56 pairingStatus]);
  }
  if ([v56 enhancedIntegrationStatus]) {
    -[CRVehicle setEnhancedIntegrationStatus:](self, "setEnhancedIntegrationStatus:", [v56 enhancedIntegrationStatus]);
  }
  uint64_t v8 = [v56 supportsStartSessionRequest];

  if (v8)
  {
    uint64_t v9 = [v56 supportsStartSessionRequest];
    [(CRVehicle *)self setSupportsStartSessionRequest:v9];
  }
  -[CRVehicle setSupportsWirelessCarPlay:](self, "setSupportsWirelessCarPlay:", [v56 supportsWirelessCarPlay]);
  -[CRVehicle setSupportsUSBCarPlay:](self, "setSupportsUSBCarPlay:", [v56 supportsUSBCarPlay]);
  v10 = [v56 bluetoothAddress];

  if (v10)
  {
    uint64_t v11 = [v56 bluetoothAddress];
    [(CRVehicle *)self setBluetoothAddress:v11];
  }
  objc_super v12 = [v56 carplayWiFiUUID];

  if (v12)
  {
    uint64_t v13 = [v56 carplayWiFiUUID];
    [(CRVehicle *)self setCarplayWiFiUUID:v13];
  }
  v14 = [v56 accessoryProtocols];

  if (v14)
  {
    uint64_t v15 = [v56 accessoryProtocols];
    [(CRVehicle *)self setAccessoryProtocols:v15];
  }
  uint64_t v16 = [v56 lastConnectedDate];

  if (v16)
  {
    uint64_t v17 = [v56 lastConnectedDate];
    [(CRVehicle *)self setLastConnectedDate:v17];
  }
  v18 = [v56 vehicleModelName];

  if (v18)
  {
    uint64_t v19 = [v56 vehicleModelName];
    [(CRVehicle *)self setVehicleModelName:v19];
  }
  v20 = [v56 PPID];

  if (v20)
  {
    uint64_t v21 = [v56 PPID];
    [(CRVehicle *)self setPPID:v21];
  }
  -[CRVehicle setAlbumArtUserPreference:](self, "setAlbumArtUserPreference:", [v56 albumArtUserPreference]);
  uint64_t v22 = [v56 wallpaperIdentifier];

  if (v22)
  {
    uint64_t v23 = [v56 wallpaperIdentifier];
    [(CRVehicle *)self setWallpaperIdentifier:v23];
  }
  uint64_t v24 = [v56 previousWallpaperIdentifier];

  if (v24)
  {
    uint64_t v25 = [v56 previousWallpaperIdentifier];
    [(CRVehicle *)self setPreviousWallpaperIdentifier:v25];
  }
  if ([v56 appearanceModePreference] != -1) {
    -[CRVehicle setAppearanceModePreference:](self, "setAppearanceModePreference:", [v56 appearanceModePreference]);
  }
  if ([v56 mapsAppearancePreference] != -1) {
    -[CRVehicle setMapsAppearancePreference:](self, "setMapsAppearancePreference:", [v56 mapsAppearancePreference]);
  }
  if ([v56 colorFilterPreference]) {
    -[CRVehicle setColorFilterPreference:](self, "setColorFilterPreference:", [v56 colorFilterPreference]);
  }
  v26 = [v56 colorFilterIntensityPreference];

  if (v26)
  {
    uint64_t v27 = [v56 colorFilterIntensityPreference];
    [(CRVehicle *)self setColorFilterIntensityPreference:v27];
  }
  if ([v56 boldTextPreference]) {
    -[CRVehicle setBoldTextPreference:](self, "setBoldTextPreference:", [v56 boldTextPreference]);
  }
  -[CRVehicle setSoundRecognitionPreference:](self, "setSoundRecognitionPreference:", [v56 soundRecognitionPreference]);
  -[CRVehicle setVoiceControlPreference:](self, "setVoiceControlPreference:", [v56 voiceControlPreference]);
  uint64_t v28 = [v56 disabledFeaturesPreference];

  if (v28)
  {
    uint64_t v29 = [v56 disabledFeaturesPreference];
    [(CRVehicle *)self setDisabledFeaturesPreference:v29];
  }
  -[CRVehicle setSupportsBluetoothLE:](self, "setSupportsBluetoothLE:", [v56 supportsBluetoothLE]);
  v30 = [v56 supportsThemeAssets];

  if (v30)
  {
    uint64_t v31 = [v56 supportsThemeAssets];
    [(CRVehicle *)self setSupportsThemeAssets:v31];
  }
  v32 = [v56 clusterAssetIdentifier];

  if (v32)
  {
    uint64_t v33 = [v56 clusterAssetIdentifier];
    [(CRVehicle *)self setClusterAssetIdentifier:v33];
  }
  v34 = [v56 clusterAssetiOSContentVersion];

  if (v34)
  {
    uint64_t v35 = [v56 clusterAssetiOSContentVersion];
    [(CRVehicle *)self setClusterAssetiOSContentVersion:v35];
  }
  v36 = [v56 clusterAssetVersion];

  if (v36)
  {
    uint64_t v37 = [v56 clusterAssetVersion];
    [(CRVehicle *)self setClusterAssetVersion:v37];
  }
  v38 = [v56 SDKVersion];

  if (v38)
  {
    uint64_t v39 = [v56 SDKVersion];
    [(CRVehicle *)self setSDKVersion:v39];
  }
  uint64_t v40 = [v56 clusterAssetURL];

  if (v40)
  {
    uint64_t v41 = [v56 clusterAssetURL];
    [(CRVehicle *)self setClusterAssetURL:v41];
  }
  v42 = [v56 stagedClusterAssetiOSContentVersion];

  if (v42)
  {
    uint64_t v43 = [v56 stagedClusterAssetiOSContentVersion];
    [(CRVehicle *)self setStagedClusterAssetiOSContentVersion:v43];
  }
  v44 = [v56 stagedClusterAssetVersion];

  if (v44)
  {
    uint64_t v45 = [v56 stagedClusterAssetVersion];
    [(CRVehicle *)self setStagedClusterAssetVersion:v45];
  }
  v46 = [v56 stagedClusterAssetURL];

  if (v46)
  {
    uint64_t v47 = [v56 stagedClusterAssetURL];
    [(CRVehicle *)self setStagedClusterAssetURL:v47];
  }
  v48 = [v56 displayThemeData];

  if (v48)
  {
    uint64_t v49 = [v56 displayThemeData];
    [(CRVehicle *)self setDisplayThemeData:v49];
  }
  v50 = [v56 hasGaugeClusterScreen];

  if (v50)
  {
    uint64_t v51 = [v56 hasGaugeClusterScreen];
    [(CRVehicle *)self setHasGaugeClusterScreen:v51];
  }
  v52 = [v56 finishedWelcome];

  if (v52)
  {
    uint64_t v53 = [v56 finishedWelcome];
    [(CRVehicle *)self setFinishedWelcome:v53];
  }
  -[CRVehicle setSiriBargeInDisabled:](self, "setSiriBargeInDisabled:", [v56 isSiriBargeInDisabled]);
  -[CRVehicle setSupportsMixableAudio:](self, "setSupportsMixableAudio:", [v56 supportsMixableAudio]);
  v54 = [v56 internalNotes];

  if (v54)
  {
    uint64_t v55 = [v56 internalNotes];
    [(CRVehicle *)self setInternalNotes:v55];
  }
}

- (id)displayName
{
  uint64_t v3 = [(CRVehicle *)self vehicleName];
  if (![v3 length])
  {
    id v4 = [(CRVehicle *)self bluetoothAddress];
    uint64_t v5 = [v4 length];

    if (v5)
    {
      uint64_t v6 = [(CRVehicle *)self bluetoothAddress];
    }
    else
    {
      uint64_t v6 = &stru_1F03060C0;
    }

    uint64_t v3 = v6;
  }
  return v3;
}

- (BOOL)requiresBonjour
{
  uint64_t v3 = [(CRVehicle *)self supportsStartSessionRequest];
  if (v3)
  {
    id v4 = [(CRVehicle *)self supportsStartSessionRequest];
    int v5 = [v4 BOOLValue] ^ 1;
  }
  else
  {
    LOBYTE(v5) = 1;
  }

  return v5;
}

- (id)assetDescription
{
  uint64_t v3 = (void *)CFPreferencesCopyAppValue(@"AlwaysUpdateAsset", CRPreferencesNotMigratedDomain);
  id v17 = (id)NSString;
  uint64_t v24 = [(CRVehicle *)self clusterAssetIdentifier];
  uint64_t v23 = CRNullableDescriptionForString(v24);
  uint64_t v22 = [(CRVehicle *)self clusterAssetiOSContentVersion];
  uint64_t v21 = CRNullableDescriptionForString(v22);
  v20 = [(CRVehicle *)self clusterAssetVersion];
  uint64_t v19 = [(CRVehicle *)self SDKVersion];
  id v4 = CRNullableDescriptionForString(v19);
  uint64_t v16 = [(CRVehicle *)self clusterAssetURL];
  uint64_t v15 = [v16 absoluteString];
  int v5 = CRNullableDescriptionForString(v15);
  v14 = [(CRVehicle *)self stagedClusterAssetiOSContentVersion];
  uint64_t v6 = CRNullableDescriptionForString(v14);
  char v7 = [(CRVehicle *)self stagedClusterAssetVersion];
  uint64_t v8 = [(CRVehicle *)self stagedClusterAssetURL];
  uint64_t v9 = [v8 absoluteString];
  v10 = CRNullableDescriptionForString(v9);
  if (v3)
  {
    int v11 = [v3 BOOLValue];
    objc_super v12 = @"NO";
    if (v11) {
      objc_super v12 = @"YES";
    }
  }
  else
  {
    objc_super v12 = @"unset";
  }
  id v18 = [v17 stringWithFormat:@"Asset Identifier: %@\niOS Version: %@\nAccessory Version: %@\nSDK Version: %@\nAsset URL: %@\nStaged Asset iOS Version: %@\nStaged Asset Accessory Version: %@\nStaged Asset URL: %@\nAlways Update Asset preference: %@", v23, v21, v20, v4, v5, v6, v7, v10, v12];

  return v18;
}

- (NSString)wallpaperDescription
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = NSString;
  id v4 = [(CRVehicle *)self wallpaperIdentifier];
  int v5 = [(CRVehicle *)self previousWallpaperIdentifier];
  uint64_t v6 = [v3 stringWithFormat:@"Wallpaper identifier: %@\nPrevious wallpaper identifier: %@", v4, v5];

  char v7 = [(CRVehicle *)self displayThemeData];

  if (v7)
  {

    long long v20 = 0u;
    long long v21 = 0u;
    long long v18 = 0u;
    long long v19 = 0u;
    uint64_t v8 = [(CRVehicle *)self displayThemeData];
    uint64_t v9 = [v8 countByEnumeratingWithState:&v18 objects:v22 count:16];
    if (v9)
    {
      uint64_t v10 = v9;
      uint64_t v11 = *(void *)v19;
      uint64_t v6 = @"wallpaper identifier: ";
      do
      {
        uint64_t v12 = 0;
        uint64_t v13 = v6;
        do
        {
          if (*(void *)v19 != v11) {
            objc_enumerationMutation(v8);
          }
          uint64_t v14 = *(void *)(*((void *)&v18 + 1) + 8 * v12);
          uint64_t v15 = [(CRVehicle *)self displayThemeData];
          uint64_t v16 = [v15 objectForKey:v14];
          uint64_t v6 = [(__CFString *)v13 stringByAppendingFormat:@"\nDisplay: %@\n\t%@", v14, v16];

          ++v12;
          uint64_t v13 = v6;
        }
        while (v10 != v12);
        uint64_t v10 = [v8 countByEnumeratingWithState:&v18 objects:v22 count:16];
      }
      while (v10);
    }
    else
    {
      uint64_t v6 = @"wallpaper identifier: ";
    }
  }
  return (NSString *)v6;
}

- (CRSystemWallpaperData)systemWallpaperData
{
  uint64_t v3 = [(CRVehicle *)self wallpaperIdentifier];

  if (v3)
  {
    id v4 = [CRSystemWallpaperData alloc];
    int v5 = [(CRVehicle *)self wallpaperIdentifier];
    uint64_t v6 = [(CRSystemWallpaperData *)v4 initWithIdentifier:v5];
  }
  else
  {
    uint64_t v6 = 0;
  }
  return v6;
}

- (void)setSystemWallpaperData:(id)a3
{
  id v4 = [a3 identifier];
  [(CRVehicle *)self setWallpaperIdentifier:v4];
}

- (CRSystemWallpaperData)previousSystemWallpaperData
{
  uint64_t v3 = [(CRVehicle *)self previousWallpaperIdentifier];

  if (v3)
  {
    id v4 = [CRSystemWallpaperData alloc];
    int v5 = [(CRVehicle *)self previousWallpaperIdentifier];
    uint64_t v6 = [(CRSystemWallpaperData *)v4 initWithIdentifier:v5];
  }
  else
  {
    uint64_t v6 = 0;
  }
  return v6;
}

- (void)setPreviousSystemWallpaperData:(id)a3
{
  id v4 = [a3 identifier];
  [(CRVehicle *)self setPreviousWallpaperIdentifier:v4];
}

- (id)wallpaperForDisplayWithID:(id)a3
{
  id v4 = a3;
  int v5 = [(CRVehicle *)self displayThemeData];

  if (v5)
  {
    if (!v4
      || ([(CRVehicle *)self displayThemeData],
          uint64_t v6 = objc_claimAutoreleasedReturnValue(),
          [v6 objectForKey:v4],
          char v7 = objc_claimAutoreleasedReturnValue(),
          v6,
          !v7))
    {
      uint64_t v8 = CarGeneralLogging();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
        -[CRVehicle wallpaperForDisplayWithID:]((uint64_t)v4, v8);
      }

      char v7 = 0;
    }
    uint64_t v9 = [v7 currentWallpaper];
  }
  else
  {
    uint64_t v9 = [(CRVehicle *)self systemWallpaperData];
  }

  return v9;
}

- (BOOL)setWallpaper:(id)a3 forDisplayWithID:(id)a4 requiresDarkAppearance:(BOOL)a5
{
  BOOL v5 = a5;
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  uint64_t v10 = [(CRVehicle *)self displayThemeData];

  if (v10)
  {
    if (v9)
    {
      uint64_t v11 = [(CRVehicle *)self displayThemeData];
      uint64_t v12 = [v11 objectForKey:v9];

      if (v12)
      {
        uint64_t v13 = [v12 themeDataWithCurrentWallpaper:v8];

        uint64_t v14 = [(CRVehicle *)self displayThemeData];
        uint64_t v15 = (void *)[v14 mutableCopy];

        [v15 setObject:v13 forKey:v9];
        [(CRVehicle *)self setDisplayThemeData:v15];

        if (!v5) {
          goto LABEL_11;
        }
        goto LABEL_8;
      }
    }
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      uint64_t v16 = [(CRVehicle *)self systemWallpaperData];
      [(CRVehicle *)self setPreviousSystemWallpaperData:v16];

      [(CRVehicle *)self setSystemWallpaperData:v8];
      if (!v5)
      {
LABEL_11:
        BOOL v19 = 1;
        goto LABEL_15;
      }
LABEL_8:
      id v17 = CarGeneralLogging();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
      {
        long long v18 = [v8 identifier];
        int v22 = 138543362;
        uint64_t v23 = v18;
        _os_log_impl(&dword_1ABB00000, v17, OS_LOG_TYPE_INFO, "Selected #wallpaper %{public}@ doesn't support dynamic appearance. Locking Appearance to Always Dark", (uint8_t *)&v22, 0xCu);
      }
      [(CRVehicle *)self setAppearanceModePreference:2];
      goto LABEL_11;
    }
  }
  long long v20 = CarGeneralLogging();
  if (os_log_type_enabled(v20, OS_LOG_TYPE_FAULT)) {
    -[CRVehicle setWallpaper:forDisplayWithID:requiresDarkAppearance:]((uint64_t)v9, (uint64_t)v8, v20);
  }

  BOOL v19 = 0;
LABEL_15:

  return v19;
}

- (NSString)_axColorFiltersAnalyticsString
{
  uint64_t v3 = [(CRVehicle *)self colorFilterIntensityPreference];
  int64_t v4 = [(CRVehicle *)self colorFilterPreference];
  BOOL v5 = @"Gray";
  uint64_t v6 = @"CARColorFilterIntensityGrayscaleKey";
  char v7 = @"Off";
  switch(v4)
  {
    case 1:
      break;
    case 2:
      goto LABEL_5;
    case 3:
      BOOL v5 = @"RedGreen";
      uint64_t v6 = @"CARColorFilterIntensityRedGreenKey";
      goto LABEL_5;
    case 4:
      BOOL v5 = @"GreenRed";
      uint64_t v6 = @"CARColorFilterIntensityGreenRedKey";
      goto LABEL_5;
    case 5:
      BOOL v5 = @"BlueYellow";
      uint64_t v6 = @"CARColorFilterIntensityBlueYellowKey";
LABEL_5:
      id v8 = [v3 objectForKeyedSubscript:v6];
      id v9 = [(CRVehicle *)self _axColorFiltersIntensityStringForNumber:v8];

      if (!v9) {
        goto LABEL_7;
      }
      char v7 = [NSString stringWithFormat:@"%@-%@", v5, v9];

      break;
    default:
LABEL_7:
      char v7 = @"Undefined";
      break;
  }

  return (NSString *)v7;
}

- (id)_axColorFiltersIntensityStringForNumber:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToNumber:&unk_1F03180C8])
  {
    int64_t v4 = @"Low";
  }
  else if ([v3 isEqualToNumber:&unk_1F03180E0])
  {
    int64_t v4 = @"Medium";
  }
  else if ([v3 isEqualToNumber:&unk_1F03180F8])
  {
    int64_t v4 = @"High";
  }
  else
  {
    int64_t v4 = @"Undefined";
  }

  return v4;
}

- (NSString)_axSoundRecognitionAnalyticsString
{
  id v3 = [MEMORY[0x1E4F1CA48] array];
  char v4 = [(CRVehicle *)self soundRecognitionPreference];
  if (v4)
  {
    [v3 addObject:@"Enabled"];
    if ((v4 & 2) != 0) {
      [v3 addObject:@"CarHorns"];
    }
    if ((v4 & 4) != 0) {
      [v3 addObject:@"Siren"];
    }
    BOOL v5 = [v3 componentsJoinedByString:@","];
  }
  else
  {
    BOOL v5 = @"Off";
  }

  return (NSString *)v5;
}

- (NSUUID)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(id)a3
{
}

- (NSString)vehicleName
{
  return self->_vehicleName;
}

- (void)setVehicleName:(id)a3
{
}

- (NSSet)accessoryProtocols
{
  return self->_accessoryProtocols;
}

- (void)setAccessoryProtocols:(id)a3
{
}

- (BOOL)supportsEnhancedIntegration
{
  return self->_supportsEnhancedIntegration;
}

- (void)setSupportsEnhancedIntegration:(BOOL)a3
{
  self->_supportsEnhancedIntegration = a3;
}

- (unint64_t)enhancedIntegrationStatus
{
  return self->_enhancedIntegrationStatus;
}

- (void)setEnhancedIntegrationStatus:(unint64_t)a3
{
  self->_enhancedIntegrationStatus = a3;
}

- (BOOL)supportsUSBCarPlay
{
  return self->_supportsUSBCarPlay;
}

- (void)setSupportsUSBCarPlay:(BOOL)a3
{
  self->_supportsUSBCarPlay = a3;
}

- (BOOL)supportsWirelessCarPlay
{
  return self->_supportsWirelessCarPlay;
}

- (void)setSupportsWirelessCarPlay:(BOOL)a3
{
  self->_supportsWirelessCarPlay = a3;
}

- (NSNumber)supportsThemeAssets
{
  return self->_supportsThemeAssets;
}

- (void)setSupportsThemeAssets:(id)a3
{
}

- (NSString)clusterAssetIdentifier
{
  return self->_clusterAssetIdentifier;
}

- (void)setClusterAssetIdentifier:(id)a3
{
}

- (NSString)clusterAssetiOSContentVersion
{
  return self->_clusterAssetiOSContentVersion;
}

- (void)setClusterAssetiOSContentVersion:(id)a3
{
}

- (NSNumber)clusterAssetVersion
{
  return self->_clusterAssetVersion;
}

- (void)setClusterAssetVersion:(id)a3
{
}

- (NSString)SDKVersion
{
  return self->_SDKVersion;
}

- (void)setSDKVersion:(id)a3
{
}

- (NSURL)clusterAssetURL
{
  return self->_clusterAssetURL;
}

- (void)setClusterAssetURL:(id)a3
{
}

- (NSString)stagedClusterAssetiOSContentVersion
{
  return self->_stagedClusterAssetiOSContentVersion;
}

- (void)setStagedClusterAssetiOSContentVersion:(id)a3
{
}

- (NSNumber)stagedClusterAssetVersion
{
  return self->_stagedClusterAssetVersion;
}

- (void)setStagedClusterAssetVersion:(id)a3
{
}

- (NSURL)stagedClusterAssetURL
{
  return self->_stagedClusterAssetURL;
}

- (void)setStagedClusterAssetURL:(id)a3
{
}

- (NSDictionary)displayThemeData
{
  return self->_displayThemeData;
}

- (void)setDisplayThemeData:(id)a3
{
}

- (NSNumber)hasGaugeClusterScreen
{
  return self->_hasGaugeClusterScreen;
}

- (void)setHasGaugeClusterScreen:(id)a3
{
}

- (NSNumber)finishedWelcome
{
  return self->_finishedWelcome;
}

- (void)setFinishedWelcome:(id)a3
{
}

- (NSData)certificateSerialNumber
{
  return self->_certificateSerialNumber;
}

- (void)setCertificateSerialNumber:(id)a3
{
}

- (unint64_t)pairingStatus
{
  return self->_pairingStatus;
}

- (void)setPairingStatus:(unint64_t)a3
{
  self->_pairingStatus = a3;
}

- (NSString)bluetoothAddress
{
  return self->_bluetoothAddress;
}

- (void)setBluetoothAddress:(id)a3
{
}

- (NSString)carplayWiFiUUID
{
  return self->_carplayWiFiUUID;
}

- (void)setCarplayWiFiUUID:(id)a3
{
}

- (NSDate)lastConnectedDate
{
  return self->_lastConnectedDate;
}

- (void)setLastConnectedDate:(id)a3
{
}

- (NSString)vehicleModelName
{
  return self->_vehicleModelName;
}

- (void)setVehicleModelName:(id)a3
{
}

- (NSString)PPID
{
  return self->_PPID;
}

- (void)setPPID:(id)a3
{
}

- (NSString)internalNotes
{
  return self->_internalNotes;
}

- (void)setInternalNotes:(id)a3
{
}

- (NSNumber)supportsStartSessionRequest
{
  return self->_supportsStartSessionRequest;
}

- (void)setSupportsStartSessionRequest:(id)a3
{
}

- (NSNumber)disabledFeaturesPreference
{
  return self->_disabledFeaturesPreference;
}

- (void)setDisabledFeaturesPreference:(id)a3
{
}

- (BOOL)supportsBluetoothLE
{
  return self->_supportsBluetoothLE;
}

- (void)setSupportsBluetoothLE:(BOOL)a3
{
  self->_supportsBluetoothLE = a3;
}

- (int64_t)albumArtUserPreference
{
  return self->_albumArtUserPreference;
}

- (void)setAlbumArtUserPreference:(int64_t)a3
{
  self->_albumArtUserPreference = a3;
}

- (NSString)wallpaperIdentifier
{
  return self->_wallpaperIdentifier;
}

- (void)setWallpaperIdentifier:(id)a3
{
}

- (NSString)previousWallpaperIdentifier
{
  return self->_previousWallpaperIdentifier;
}

- (void)setPreviousWallpaperIdentifier:(id)a3
{
}

- (int64_t)appearanceModePreference
{
  return self->_appearanceModePreference;
}

- (void)setAppearanceModePreference:(int64_t)a3
{
  self->_appearanceModePreference = a3;
}

- (int64_t)mapsAppearancePreference
{
  return self->_mapsAppearancePreference;
}

- (void)setMapsAppearancePreference:(int64_t)a3
{
  self->_mapsAppearancePreference = a3;
}

- (int64_t)colorFilterPreference
{
  return self->_colorFilterPreference;
}

- (void)setColorFilterPreference:(int64_t)a3
{
  self->_colorFilterPreference = a3;
}

- (NSDictionary)colorFilterIntensityPreference
{
  return self->_colorFilterIntensityPreference;
}

- (void)setColorFilterIntensityPreference:(id)a3
{
}

- (int64_t)boldTextPreference
{
  return self->_boldTextPreference;
}

- (void)setBoldTextPreference:(int64_t)a3
{
  self->_boldTextPreference = a3;
}

- (unint64_t)soundRecognitionPreference
{
  return self->_soundRecognitionPreference;
}

- (void)setSoundRecognitionPreference:(unint64_t)a3
{
  self->_soundRecognitionPreference = a3;
}

- (int64_t)voiceControlPreference
{
  return self->_voiceControlPreference;
}

- (void)setVoiceControlPreference:(int64_t)a3
{
  self->_voiceControlPreference = a3;
}

- (BOOL)isSiriBargeInDisabled
{
  return self->_siriBargeInDisabled;
}

- (void)setSiriBargeInDisabled:(BOOL)a3
{
  self->_siriBargeInDisabled = a3;
}

- (BOOL)supportsMixableAudio
{
  return self->_supportsMixableAudio;
}

- (void)setSupportsMixableAudio:(BOOL)a3
{
  self->_supportsMixableAudio = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_colorFilterIntensityPreference, 0);
  objc_storeStrong((id *)&self->_previousWallpaperIdentifier, 0);
  objc_storeStrong((id *)&self->_wallpaperIdentifier, 0);
  objc_storeStrong((id *)&self->_disabledFeaturesPreference, 0);
  objc_storeStrong((id *)&self->_supportsStartSessionRequest, 0);
  objc_storeStrong((id *)&self->_internalNotes, 0);
  objc_storeStrong((id *)&self->_PPID, 0);
  objc_storeStrong((id *)&self->_vehicleModelName, 0);
  objc_storeStrong((id *)&self->_lastConnectedDate, 0);
  objc_storeStrong((id *)&self->_carplayWiFiUUID, 0);
  objc_storeStrong((id *)&self->_bluetoothAddress, 0);
  objc_storeStrong((id *)&self->_certificateSerialNumber, 0);
  objc_storeStrong((id *)&self->_finishedWelcome, 0);
  objc_storeStrong((id *)&self->_hasGaugeClusterScreen, 0);
  objc_storeStrong((id *)&self->_displayThemeData, 0);
  objc_storeStrong((id *)&self->_stagedClusterAssetURL, 0);
  objc_storeStrong((id *)&self->_stagedClusterAssetVersion, 0);
  objc_storeStrong((id *)&self->_stagedClusterAssetiOSContentVersion, 0);
  objc_storeStrong((id *)&self->_clusterAssetURL, 0);
  objc_storeStrong((id *)&self->_SDKVersion, 0);
  objc_storeStrong((id *)&self->_clusterAssetVersion, 0);
  objc_storeStrong((id *)&self->_clusterAssetiOSContentVersion, 0);
  objc_storeStrong((id *)&self->_clusterAssetIdentifier, 0);
  objc_storeStrong((id *)&self->_supportsThemeAssets, 0);
  objc_storeStrong((id *)&self->_accessoryProtocols, 0);
  objc_storeStrong((id *)&self->_vehicleName, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

- (void)wallpaperForDisplayWithID:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_1ABB00000, a2, OS_LOG_TYPE_ERROR, "Failed to get wallpaper, no display with id: %@", (uint8_t *)&v2, 0xCu);
}

- (void)setWallpaper:(uint64_t)a1 forDisplayWithID:(uint64_t)a2 requiresDarkAppearance:(os_log_t)log .cold.1(uint64_t a1, uint64_t a2, os_log_t log)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  int v3 = 138412546;
  uint64_t v4 = a1;
  __int16 v5 = 2112;
  uint64_t v6 = a2;
  _os_log_fault_impl(&dword_1ABB00000, log, OS_LOG_TYPE_FAULT, "Failed to set wallpaper on display %@: %@", (uint8_t *)&v3, 0x16u);
}

@end