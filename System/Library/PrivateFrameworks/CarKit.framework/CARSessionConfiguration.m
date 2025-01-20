@interface CARSessionConfiguration
+ (id)_descriptionForTransportType:(unint64_t)a3;
+ (id)descriptionForCapability:(int64_t)a3;
+ (id)descriptionForEdgeInsets:(NSEdgeInsets)a3;
+ (id)descriptionForUserInterfaceStyle:(int64_t)a3;
+ (int64_t)_defaultInterfaceStyleFromAppearanceDefault:(id)a3;
+ (unint64_t)_limitableUserInterfacesFromLimitedUIValues:(id)a3;
- (BOOL)hasAccessory;
- (BOOL)hasGaugeClusterScreen;
- (BOOL)manufacturerIconVisible;
- (BOOL)nightModeSupported;
- (BOOL)rightHandDrive;
- (BOOL)supportsACBack;
- (BOOL)supportsElectronicTollCollection;
- (BOOL)supportsLogTransfer;
- (BOOL)supportsSiriMixable;
- (BOOL)supportsSiriZLL;
- (BOOL)supportsSiriZLLButton;
- (BOOL)supportsVehicleData;
- (BOOL)vehicleSupportsCNG;
- (BOOL)vehicleSupportsDestinationSharing;
- (BOOL)vehicleSupportsDiesel;
- (BOOL)vehicleSupportsElectric;
- (BOOL)vehicleSupportsGasoline;
- (CARDisplayInfoProviding)displayInfoProvider;
- (CARSessionConfiguration)initWithSessionStatusOptions:(unint64_t)a3 propertySupplier:(id)a4;
- (NSArray)altScreenSuggestUIURLs;
- (NSArray)displays;
- (NSArray)lastOnDisplayUIContextURLs;
- (NSArray)manufacturerIcons;
- (NSArray)nowOnDisplayUIContextURLs;
- (NSArray)screenIDs;
- (NSArray)screens;
- (NSArray)vehicleButtons;
- (NSDictionary)infoResponse;
- (NSEdgeInsets)dashboardRoundedCorners;
- (NSEdgeInsets)viewAreaInsets;
- (NSString)PPID;
- (NSString)deviceIdentifier;
- (NSString)endpointIdentifier;
- (NSString)manufacturerIconLabel;
- (NSString)manufacturerName;
- (NSString)modelName;
- (NSString)name;
- (NSString)vehicleDataProtocolVersion;
- (NSString)vehicleFirmwareVersion;
- (NSString)vehicleHardwareVersion;
- (NSString)vehicleManufacturer;
- (NSString)vehicleModelName;
- (NSString)vehicleName;
- (NSString)vehicleSerialNumber;
- (id)description;
- (id)descriptionForLimitableUserInterfaces;
- (id)descriptionForTransportType;
- (id)primaryDisplayPhysicalSize;
- (id)screenInfoForScreenID:(id)a3;
- (id)valueForUndefinedKey:(id)a3;
- (int64_t)defaultUserInterfaceStyle;
- (int64_t)nowPlayingAlbumArtMode;
- (int64_t)userInterfaceStyle;
- (int64_t)voiceTriggerMode;
- (unint64_t)limitableUserInterfaces;
- (unint64_t)transportType;
- (unint64_t)vehicleDataPluginCount;
- (void)setDashboardRoundedCorners:(NSEdgeInsets)a3;
- (void)setDefaultUserInterfaceStyle:(int64_t)a3;
- (void)setDisplayInfoProvider:(id)a3;
- (void)setHasAccessory:(BOOL)a3;
- (void)setInfoResponse:(id)a3;
- (void)setManufacturerIconLabel:(id)a3;
- (void)setManufacturerIconVisible:(BOOL)a3;
- (void)setManufacturerIcons:(id)a3;
- (void)setSupportsElectronicTollCollection:(BOOL)a3;
- (void)updateCarCapabilities;
@end

@implementation CARSessionConfiguration

- (id)descriptionForTransportType
{
  v3 = objc_opt_class();
  unint64_t v4 = [(CARSessionConfiguration *)self transportType];
  return (id)[v3 _descriptionForTransportType:v4];
}

+ (id)_descriptionForTransportType:(unint64_t)a3
{
  if (a3 - 1 > 2) {
    return @"Unknown";
  }
  else {
    return off_1E5E3B510[a3 - 1];
  }
}

+ (id)descriptionForCapability:(int64_t)a3
{
  v3 = @"Unknown";
  if (a3 == 2) {
    v3 = @"Unrestricted";
  }
  if (a3 == 1) {
    return @"Restricted";
  }
  else {
    return v3;
  }
}

+ (id)descriptionForUserInterfaceStyle:(int64_t)a3
{
  if ((unint64_t)a3 > 2) {
    return @"Unknown";
  }
  else {
    return off_1E5E3B528[a3];
  }
}

+ (id)descriptionForEdgeInsets:(NSEdgeInsets)a3
{
  return (id)[NSString stringWithFormat:@"{top = %f, left = %f, bottom = %f, right = %f}", *(void *)&a3.top, *(void *)&a3.left, *(void *)&a3.bottom, *(void *)&a3.right];
}

- (id)descriptionForLimitableUserInterfaces
{
  char v2 = [(CARSessionConfiguration *)self limitableUserInterfaces];
  v3 = [MEMORY[0x1E4F1CA48] array];
  unint64_t v4 = v3;
  if (v2)
  {
    [v3 addObject:@"Keyboard"];
    if ((v2 & 2) == 0)
    {
LABEL_3:
      if ((v2 & 4) == 0) {
        goto LABEL_4;
      }
      goto LABEL_15;
    }
  }
  else if ((v2 & 2) == 0)
  {
    goto LABEL_3;
  }
  [v4 addObject:@"Phone Keypad"];
  if ((v2 & 4) == 0)
  {
LABEL_4:
    if ((v2 & 8) == 0) {
      goto LABEL_5;
    }
    goto LABEL_16;
  }
LABEL_15:
  [v4 addObject:@"Non-Music Lists"];
  if ((v2 & 8) == 0)
  {
LABEL_5:
    if ((v2 & 0x10) == 0) {
      goto LABEL_6;
    }
    goto LABEL_17;
  }
LABEL_16:
  [v4 addObject:@"Music Lists"];
  if ((v2 & 0x10) == 0)
  {
LABEL_6:
    if ((v2 & 0x20) == 0) {
      goto LABEL_7;
    }
    goto LABEL_18;
  }
LABEL_17:
  [v4 addObject:@"Japan Maps"];
  if ((v2 & 0x20) == 0)
  {
LABEL_7:
    if ((v2 & 0x40) == 0) {
      goto LABEL_8;
    }
    goto LABEL_19;
  }
LABEL_18:
  [v4 addObject:@"Automaker Settings"];
  if ((v2 & 0x40) == 0)
  {
LABEL_8:
    if ((v2 & 0x80) == 0) {
      goto LABEL_10;
    }
    goto LABEL_9;
  }
LABEL_19:
  [v4 addObject:@"Paired Devices"];
  if (v2 < 0) {
LABEL_9:
  }
    [v4 addObject:@"Theme Customization"];
LABEL_10:
  v5 = [v4 componentsJoinedByString:@", "];

  return v5;
}

+ (unint64_t)_limitableUserInterfacesFromLimitedUIValues:(id)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  uint64_t v4 = [v3 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    unint64_t v6 = 0;
    uint64_t v7 = *(void *)v12;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v12 != v7) {
          objc_enumerationMutation(v3);
        }
        v9 = *(void **)(*((void *)&v11 + 1) + 8 * i);
        if ([v9 isEqualToString:@"softKeyboard"])
        {
          v6 |= 1uLL;
        }
        else if ([v9 isEqualToString:@"softPhoneKeypad"])
        {
          v6 |= 2uLL;
        }
        else if ([v9 isEqualToString:@"nonMusicLists"])
        {
          v6 |= 4uLL;
        }
        else if ([v9 isEqualToString:@"musicLists"])
        {
          v6 |= 8uLL;
        }
        else if ([v9 isEqualToString:@"japanMaps"])
        {
          v6 |= 0x10uLL;
        }
        else if ([v9 isEqualToString:@"automakerSettings"])
        {
          v6 |= 0x20uLL;
        }
        else if ([v9 isEqualToString:@"pairedDevices"])
        {
          v6 |= 0x40uLL;
        }
        else if ([v9 isEqualToString:@"themeCustomization"])
        {
          v6 |= 0x80uLL;
        }
      }
      uint64_t v5 = [v3 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v5);
  }
  else
  {
    unint64_t v6 = 0;
  }

  return v6;
}

+ (int64_t)_defaultInterfaceStyleFromAppearanceDefault:(id)a3
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  uint64_t v4 = CarGeneralLogging();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    int v7 = 138412290;
    id v8 = v3;
    _os_log_impl(&dword_1ABB00000, v4, OS_LOG_TYPE_DEFAULT, "CARSessionConfiguration INFO appearanceDefault=%@", (uint8_t *)&v7, 0xCu);
  }

  if (v3) {
    int64_t v5 = [v3 isEqualToString:@"automatic"] - 1;
  }
  else {
    int64_t v5 = -1;
  }

  return v5;
}

- (CARSessionConfiguration)initWithSessionStatusOptions:(unint64_t)a3 propertySupplier:(id)a4
{
  char v170 = a3;
  v187[5] = *MEMORY[0x1E4F143B8];
  int64_t v5 = (void (**)(id, void))a4;
  v184.receiver = self;
  v184.super_class = (Class)CARSessionConfiguration;
  unint64_t v6 = [(CARSessionConfiguration *)&v184 init];

  if (v6)
  {
    v5[2](v5, *MEMORY[0x1E4F20E38]);
    id v7 = (id)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      id v8 = (NSString *)v7;
    }
    else {
      id v8 = 0;
    }

    endpointIdentifier = v6->_endpointIdentifier;
    v6->_endpointIdentifier = v8;

    v5[2](v5, *MEMORY[0x1E4F20F28]);
    id v10 = (id)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      long long v11 = (NSString *)v10;
    }
    else {
      long long v11 = 0;
    }

    name = v6->_name;
    v6->_name = v11;

    v5[2](v5, *MEMORY[0x1E4F20F18]);
    id v13 = (id)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      long long v14 = (NSString *)v13;
    }
    else {
      long long v14 = 0;
    }

    modelName = v6->_modelName;
    v6->_modelName = v14;

    v5[2](v5, *MEMORY[0x1E4F20EF8]);
    id v16 = (id)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      v17 = (NSString *)v16;
    }
    else {
      v17 = 0;
    }

    manufacturerName = v6->_manufacturerName;
    v6->_manufacturerName = v17;

    v19 = v5[2](v5, *MEMORY[0x1E4F21040]);
    v166 = v19;
    if (v19)
    {
      v20 = v19;
      if (([v19 isEqualToString:*MEMORY[0x1E4F21528]] & 1) != 0
        || ([v20 isEqualToString:*MEMORY[0x1E4F21540]] & 1) != 0)
      {
        uint64_t v21 = 3;
      }
      else if ([v20 isEqualToString:*MEMORY[0x1E4F21530]])
      {
        uint64_t v21 = 2;
      }
      else
      {
        uint64_t v21 = [v20 isEqualToString:*MEMORY[0x1E4F21538]];
      }
    }
    else
    {
      uint64_t v21 = 0;
    }
    v6->_transportType = v21;
    v5[2](v5, *MEMORY[0x1E4F20F70]);
    id v22 = (id)objc_claimAutoreleasedReturnValue();
    if (v22)
    {
      objc_opt_class();
      id v23 = v22;
      if (objc_opt_isKindOfClass()) {
        char v24 = [v23 BOOLValue];
      }
      else {
        char v24 = 0;
      }
    }
    else
    {
      char v24 = 0;
    }

    v6->_rightHandDrive = v24;
    v25 = v5[2](v5, *MEMORY[0x1E4F20EE0]);
    objc_opt_class();
    id v26 = v25;
    if (objc_opt_isKindOfClass()) {
      id v27 = v26;
    }
    else {
      id v27 = 0;
    }

    v6->_limitableUserInterfaces = +[CARSessionConfiguration _limitableUserInterfacesFromLimitedUIValues:v27];
    v28 = v5[2](v5, *MEMORY[0x1E4F20F30]);
    v6->_nightModeSupported = v28 != 0;

    v29 = ((void (**)(id, __CFString *))v5)[2](v5, @"EndpointInfo");
    v30 = v29;
    if ((v170 & 8) != 0)
    {
      if ((v170 & 0x10) != 0)
      {
        uint64_t v37 = [v29 copy];
        infoResponse = v6->_infoResponse;
        v6->_infoResponse = (NSDictionary *)v37;
      }
      else
      {
        infoResponse = [MEMORY[0x1E4F1CA60] dictionaryWithDictionary:v29];
        uint64_t v32 = *MEMORY[0x1E4F20F38];
        v187[0] = *MEMORY[0x1E4F20F48];
        v187[1] = v32;
        v187[2] = @"oemIcon";
        v187[3] = @"oemIcons";
        v187[4] = @"oemIconLabel";
        [MEMORY[0x1E4F1C978] arrayWithObjects:v187 count:5];
        v34 = id v33 = v27;
        [infoResponse removeObjectsForKeys:v34];

        id v27 = v33;
        uint64_t v35 = [infoResponse copy];
        v36 = v6->_infoResponse;
        v6->_infoResponse = (NSDictionary *)v35;
      }
    }
    v165 = v27;
    uint64_t v38 = [v30 objectForKeyedSubscript:@"altScreenSuggestUIURLs"];
    altScreenSuggestUIURLs = v6->_altScreenSuggestUIURLs;
    v6->_altScreenSuggestUIURLs = (NSArray *)v38;

    uint64_t v40 = [v30 objectForKeyedSubscript:@"uiContextLastOnDisplayURLs"];
    lastOnDisplayUIContextURLs = v6->_lastOnDisplayUIContextURLs;
    v6->_lastOnDisplayUIContextURLs = (NSArray *)v40;

    uint64_t v42 = [v30 objectForKeyedSubscript:@"uiContextNowOnDisplayURLs"];
    nowOnDisplayUIContextURLs = v6->_nowOnDisplayUIContextURLs;
    v6->_nowOnDisplayUIContextURLs = (NSArray *)v42;

    uint64_t v44 = [v30 objectForKeyedSubscript:@"deviceID"];
    deviceIdentifier = v6->_deviceIdentifier;
    v6->_deviceIdentifier = (NSString *)v44;

    v164 = [v30 objectForKeyedSubscript:@"appearanceDefault"];
    v6->_defaultUserInterfaceStyle = +[CARSessionConfiguration _defaultInterfaceStyleFromAppearanceDefault:](CARSessionConfiguration, "_defaultInterfaceStyleFromAppearanceDefault:");
    v6->_userInterfaceStyle = -1;
    [(CARSessionConfiguration *)v6 updateCarCapabilities];
    v46 = [v30 objectForKeyedSubscript:@"enhancedSiriInfo"];
    objc_opt_class();
    id v47 = v46;
    if (objc_opt_isKindOfClass()) {
      id v48 = v47;
    }
    else {
      id v48 = 0;
    }

    v167 = v48;
    if (v48)
    {
      id v49 = [v48 objectForKeyedSubscript:@"enhancedSiriVoice"];
      if (v49)
      {
        objc_opt_class();
        id v50 = v49;
        if (objc_opt_isKindOfClass()) {
          char v51 = [v50 BOOLValue];
        }
        else {
          char v51 = 0;
        }

        id v48 = v167;
      }
      else
      {
        char v51 = 0;
      }

      v6->_supportsSiriZLL = v51;
      id v52 = [v48 objectForKeyedSubscript:@"enhancedSiriButton"];
      if (v52)
      {
        objc_opt_class();
        id v53 = v52;
        if (objc_opt_isKindOfClass()) {
          char v54 = [v53 BOOLValue];
        }
        else {
          char v54 = 0;
        }

        id v48 = v167;
      }
      else
      {
        char v54 = 0;
      }

      v6->_supportsSiriZLLButton = v54;
      v55 = [v48 objectForKey:@"enhancedSiriNotMixable"];

      if (v55)
      {
        id v56 = [v48 objectForKeyedSubscript:@"enhancedSiriNotMixable"];
        if (v56)
        {
          objc_opt_class();
          id v57 = v56;
          if (objc_opt_isKindOfClass()) {
            char v58 = [v57 BOOLValue];
          }
          else {
            char v58 = 0;
          }
        }
        else
        {
          char v58 = 0;
        }

        v6->_supportsSiriMixable = v58 ^ 1;
      }
      else
      {
        v6->_supportsSiriMixable = 1;
      }
    }
    else
    {
      *(_WORD *)&v6->_supportsSiriZLL = 0;
      v6->_supportsSiriMixable = 0;
    }
    v163 = v5[2](v5, *MEMORY[0x1E4F20DB0]);
    v6->_supportsACBack = [v163 containsObject:*MEMORY[0x1E4F21520]];
    v5[2](v5, *MEMORY[0x1E4F21078]);
    id v59 = (id)objc_claimAutoreleasedReturnValue();
    if (v59)
    {
      objc_opt_class();
      id v60 = v59;
      if (objc_opt_isKindOfClass()) {
        uint64_t v61 = [v60 integerValue];
      }
      else {
        uint64_t v61 = 0x7FFFFFFFFFFFFFFFLL;
      }
    }
    else
    {
      uint64_t v61 = 0x7FFFFFFFFFFFFFFFLL;
    }

    if ((unint64_t)(v61 - 3) < 0xFFFFFFFFFFFFFFFCLL || v61 == 0) {
      uint64_t v63 = -1;
    }
    else {
      uint64_t v63 = v61;
    }
    v6->_voiceTriggerMode = v63;
    v169 = v30;
    if ((v170 & 2) != 0)
    {
      v64 = v5[2](v5, *MEMORY[0x1E4F21070]);
      v65 = v64;
      if (v64)
      {
        v66 = [v64 objectForKeyedSubscript:*MEMORY[0x1E4F21598]];
        objc_opt_class();
        id v67 = v66;
        if (objc_opt_isKindOfClass()) {
          id v68 = v67;
        }
        else {
          id v68 = 0;
        }

        if (v68)
        {
          v69 = [v68 objectForKeyedSubscript:@"active"];
          v6->_supportsElectronicTollCollection = v69 != 0;
        }
      }
    }
    v70 = [v30 objectForKey:@"vehicleStateProtocolInfo"];
    objc_opt_class();
    id v71 = v70;
    if (objc_opt_isKindOfClass()) {
      id v72 = v71;
    }
    else {
      id v72 = 0;
    }

    v162 = v72;
    if (!v72)
    {
      v6->_supportsVehicleData = 0;
      v6->_vehicleDataPluginCount = 0;
      goto LABEL_101;
    }
    v6->_supportsVehicleData = 1;
    v73 = [v72 objectForKey:@"protocolVersion"];
    objc_opt_class();
    id v74 = v73;
    if (objc_opt_isKindOfClass()) {
      v75 = (NSString *)v74;
    }
    else {
      v75 = 0;
    }

    vehicleDataProtocolVersion = v6->_vehicleDataProtocolVersion;
    v6->_vehicleDataProtocolVersion = v75;

    v77 = [v72 objectForKey:@"pluginCount"];
    objc_opt_class();
    id v78 = v77;
    if (objc_opt_isKindOfClass()) {
      id v79 = v78;
    }
    else {
      id v79 = 0;
    }

    if (v79)
    {
      uint64_t v80 = [v79 unsignedIntegerValue];
      v6->_vehicleDataPluginCount = v80;
      if (v80)
      {
LABEL_100:

LABEL_101:
        v89 = [v30 objectForKey:@"logTransferInfo"];
        v6->_supportsLogTransfer = v89 != 0;

        v90 = [MEMORY[0x1E4F1CA48] array];
        v91 = [MEMORY[0x1E4F1CA48] array];
        v168 = v5[2](v5, *MEMORY[0x1E4F20F80]);
        v92 = [v30 objectForKey:@"displayPanels"];
        objc_opt_class();
        id v93 = v92;
        if (objc_opt_isKindOfClass()) {
          id v94 = v93;
        }
        else {
          id v94 = 0;
        }

        id v95 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
        v96 = v95;
        v161 = v94;
        if (v94)
        {
          v182[0] = MEMORY[0x1E4F143A8];
          v182[1] = 3221225472;
          v182[2] = __73__CARSessionConfiguration_initWithSessionStatusOptions_propertySupplier___block_invoke;
          v182[3] = &unk_1E5E3B3E8;
          v97 = &v183;
          id v183 = v95;
          [v94 enumerateObjectsUsingBlock:v182];
          v98 = v168;
        }
        else
        {
          v180[0] = MEMORY[0x1E4F143A8];
          v180[1] = 3221225472;
          v180[2] = __73__CARSessionConfiguration_initWithSessionStatusOptions_propertySupplier___block_invoke_578;
          v180[3] = &unk_1E5E3B3E8;
          v97 = &v181;
          id v181 = v95;
          v98 = v168;
          [v168 enumerateObjectsUsingBlock:v180];
        }

        v160 = v96;
        uint64_t v99 = [v96 copy];
        displays = v6->_displays;
        v6->_displays = (NSArray *)v99;

        v101 = v169;
        v102 = [v169 objectForKey:@"displays"];
        v175[0] = MEMORY[0x1E4F143A8];
        v175[1] = 3221225472;
        v175[2] = __73__CARSessionConfiguration_initWithSessionStatusOptions_propertySupplier___block_invoke_582;
        v175[3] = &unk_1E5E3B488;
        id v158 = v102;
        id v176 = v158;
        v103 = v6;
        v177 = v103;
        id v104 = v90;
        id v178 = v104;
        id v105 = v91;
        id v179 = v105;
        [v98 enumerateObjectsUsingBlock:v175];
        v159 = v104;
        uint64_t v106 = [v104 copy];
        screens = v103->_screens;
        v103->_screens = (NSArray *)v106;

        v157 = v105;
        uint64_t v108 = [v105 copy];
        screenIDs = v103->_screenIDs;
        v103->_screenIDs = (NSArray *)v108;

        v103->_hasGaugeClusterScreen = [(NSArray *)v6->_displays bs_containsObjectPassingTest:&__block_literal_global_591];
        if ((v170 & 2) != 0)
        {
          v5[2](v5, *MEMORY[0x1E4F20F38]);
          id v110 = (id)objc_claimAutoreleasedReturnValue();
          objc_opt_class();
          if (objc_opt_isKindOfClass()) {
            v111 = (NSString *)v110;
          }
          else {
            v111 = 0;
          }

          manufacturerIconLabel = v103->_manufacturerIconLabel;
          v103->_manufacturerIconLabel = v111;

          v5[2](v5, *MEMORY[0x1E4F20F40]);
          id v113 = (id)objc_claimAutoreleasedReturnValue();
          if (v113)
          {
            objc_opt_class();
            id v114 = v113;
            if (objc_opt_isKindOfClass()) {
              char v115 = [v114 BOOLValue];
            }
            else {
              char v115 = 0;
            }
          }
          else
          {
            char v115 = 0;
          }

          v103->_manufacturerIconVisible = v115;
          v116 = v5[2](v5, *MEMORY[0x1E4F20F48]);
          id v117 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
          v173[0] = MEMORY[0x1E4F143A8];
          v173[1] = 3221225472;
          v173[2] = __73__CARSessionConfiguration_initWithSessionStatusOptions_propertySupplier___block_invoke_6;
          v173[3] = &unk_1E5E3B2A8;
          id v118 = v117;
          id v174 = v118;
          [v116 enumerateObjectsUsingBlock:v173];
          objc_storeStrong((id *)&v103->_manufacturerIcons, v117);

          v101 = v169;
        }
        v119 = [v101 objectForKeyedSubscript:@"buttonInfo"];
        objc_opt_class();
        id v120 = v119;
        if (objc_opt_isKindOfClass())
        {
          id v121 = v120;

          if (!v121) {
            goto LABEL_127;
          }
          v122 = [MEMORY[0x1E4F1CA48] array];
          v171[0] = MEMORY[0x1E4F143A8];
          v171[1] = 3221225472;
          v171[2] = __73__CARSessionConfiguration_initWithSessionStatusOptions_propertySupplier___block_invoke_7;
          v171[3] = &unk_1E5E3B2A8;
          v123 = v122;
          v172 = v123;
          [v121 enumerateObjectsUsingBlock:v171];
          uint64_t v124 = [MEMORY[0x1E4F1C978] arrayWithArray:v123];
          vehicleButtons = v103->_vehicleButtons;
          v103->_vehicleButtons = (NSArray *)v124;
        }
        else
        {

          if (!v120)
          {
            id v121 = 0;
LABEL_127:
            v126 = +[CRVehicleAccessoryManager sharedInstance];
            v127 = [v126 connectedVehicleAccessories];
            uint64_t v128 = [v127 anyObject];
            if (v128)
            {
              v129 = v128;
              v103->_hasAccessory = 1;
LABEL_129:
              v130 = [v129 vehicleAccessoryInfoKeys];
              uint64_t v131 = [v130 objectForKeyedSubscript:@"name"];
              vehicleName = v103->_vehicleName;
              v103->_vehicleName = (NSString *)v131;

              uint64_t v133 = [v130 objectForKeyedSubscript:@"modelName"];
              vehicleModelName = v103->_vehicleModelName;
              v103->_vehicleModelName = (NSString *)v133;

              uint64_t v135 = [v130 objectForKeyedSubscript:@"manufacturer"];
              vehicleManufacturer = v103->_vehicleManufacturer;
              v103->_vehicleManufacturer = (NSString *)v135;

              uint64_t v137 = [v130 objectForKeyedSubscript:@"serialNumber"];
              vehicleSerialNumber = v103->_vehicleSerialNumber;
              v103->_vehicleSerialNumber = (NSString *)v137;

              uint64_t v139 = [v130 objectForKeyedSubscript:@"firmwareVersion"];
              vehicleFirmwareVersion = v103->_vehicleFirmwareVersion;
              v103->_vehicleFirmwareVersion = (NSString *)v139;

              uint64_t v141 = [v130 objectForKeyedSubscript:@"hardwareVersion"];
              vehicleHardwareVersion = v103->_vehicleHardwareVersion;
              v103->_vehicleHardwareVersion = (NSString *)v141;

              v143 = [v130 objectForKeyedSubscript:@"engineTypeGasoline"];
              v103->_vehicleSupportsGasoline = [v143 BOOLValue];

              v144 = [v130 objectForKeyedSubscript:@"engineTypeElectric"];
              v103->_vehicleSupportsElectric = [v144 BOOLValue];

              v145 = [v130 objectForKeyedSubscript:@"engineTypeDiesel"];
              v103->_vehicleSupportsDiesel = [v145 BOOLValue];

              v146 = [v130 objectForKeyedSubscript:@"engineTypeCNG"];
              v103->_vehicleSupportsCNG = [v146 BOOLValue];

              uint64_t v147 = [v130 objectForKeyedSubscript:@"ppid"];
              PPID = v103->_PPID;
              v103->_PPID = (NSString *)v147;

              v149 = [v130 objectForKeyedSubscript:@"destinationSharing"];
              v103->_vehicleSupportsDestinationSharing = [v149 BOOLValue];

LABEL_130:
              goto LABEL_131;
            }
            uint64_t v152 = +[CRCarPlayCapabilities capabilitiesIdentifier];
            if (v152)
            {
              v153 = (void *)v152;
              v154 = (void *)[objc_alloc(MEMORY[0x1E4F1C9B8]) initWithBase64EncodedString:v152 options:0];
              id v155 = (id)[v126 connectedVehicleAccessories];
              v129 = [v126 vehicleAccessoryForCertificateSerial:v154];

              v103->_hasAccessory = v129 != 0;
              if (v129) {
                goto LABEL_129;
              }
            }
            else
            {
              v103->_hasAccessory = 0;
            }
            v129 = CarGeneralLogging();
            if (os_log_type_enabled(v129, OS_LOG_TYPE_DEFAULT))
            {
              v156 = [v126 connectedAccessories];
              *(_DWORD *)buf = 138412290;
              v186 = v156;
              _os_log_impl(&dword_1ABB00000, v129, OS_LOG_TYPE_DEFAULT, "Configuration created without an accessory. Connected accessories: %@", buf, 0xCu);
            }
            goto LABEL_130;
          }
          v123 = CarGeneralLogging();
          if (os_log_type_enabled(v123, OS_LOG_TYPE_ERROR)) {
            -[CARSessionConfiguration initWithSessionStatusOptions:propertySupplier:]();
          }
          id v121 = 0;
        }

        goto LABEL_127;
      }
    }
    else
    {
      v6->_vehicleDataPluginCount = 0;
    }
    v81 = CarGeneralLogging();
    if (os_log_type_enabled(v81, OS_LOG_TYPE_ERROR)) {
      -[CARSessionConfiguration initWithSessionStatusOptions:propertySupplier:](v81, v82, v83, v84, v85, v86, v87, v88);
    }

    goto LABEL_100;
  }
LABEL_131:
  v150 = v6;

  return v150;
}

void __73__CARSessionConfiguration_initWithSessionStatusOptions_propertySupplier___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  objc_opt_class();
  uint64_t v4 = v3;
  if (objc_opt_isKindOfClass())
  {
    if (v4)
    {
      int64_t v5 = [[CARDisplayInfo alloc] initWithPhysicalScreenDictionary:v4];
      if (v5)
      {
        [*(id *)(a1 + 32) addObject:v5];
      }
      else
      {
        id v7 = CarGeneralLogging();
        if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
          __73__CARSessionConfiguration_initWithSessionStatusOptions_propertySupplier___block_invoke_cold_2();
        }
      }
      unint64_t v6 = v4;
      goto LABEL_12;
    }
  }
  else
  {
  }
  unint64_t v6 = CarGeneralLogging();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
    __73__CARSessionConfiguration_initWithSessionStatusOptions_propertySupplier___block_invoke_cold_1();
  }
LABEL_12:
}

void __73__CARSessionConfiguration_initWithSessionStatusOptions_propertySupplier___block_invoke_578(uint64_t a1, void *a2)
{
  id v3 = a2;
  objc_opt_class();
  uint64_t v4 = v3;
  if (objc_opt_isKindOfClass())
  {
    if (v4)
    {
      int64_t v5 = [[CARDisplayInfo alloc] initWithLogicalScreenDictionary:v4];
      if (v5)
      {
        [*(id *)(a1 + 32) addObject:v5];
      }
      else
      {
        id v7 = CarGeneralLogging();
        if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
          __73__CARSessionConfiguration_initWithSessionStatusOptions_propertySupplier___block_invoke_578_cold_2();
        }
      }
      unint64_t v6 = v4;
      goto LABEL_12;
    }
  }
  else
  {
  }
  unint64_t v6 = CarGeneralLogging();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
    __73__CARSessionConfiguration_initWithSessionStatusOptions_propertySupplier___block_invoke_578_cold_1();
  }
LABEL_12:
}

void __73__CARSessionConfiguration_initWithSessionStatusOptions_propertySupplier___block_invoke_582(uint64_t a1, void *a2, uint64_t a3)
{
  id v5 = a2;
  uint64_t v30 = 0;
  v31 = &v30;
  uint64_t v32 = 0x3032000000;
  id v33 = __Block_byref_object_copy__1;
  v34 = __Block_byref_object_dispose__1;
  id v35 = 0;
  unint64_t v6 = [v5 objectForKey:@"ScreenID"];
  id v7 = *(void **)(a1 + 32);
  v27[0] = MEMORY[0x1E4F143A8];
  v27[1] = 3221225472;
  v27[2] = __73__CARSessionConfiguration_initWithSessionStatusOptions_propertySupplier___block_invoke_586;
  v27[3] = &unk_1E5E3B410;
  id v8 = v6;
  id v28 = v8;
  v29 = &v30;
  [v7 enumerateObjectsUsingBlock:v27];
  uint64_t v9 = *(void **)(*(void *)(a1 + 40) + 120);
  uint64_t v22 = MEMORY[0x1E4F143A8];
  uint64_t v23 = 3221225472;
  char v24 = __73__CARSessionConfiguration_initWithSessionStatusOptions_propertySupplier___block_invoke_2;
  v25 = &unk_1E5E3B460;
  id v10 = v8;
  id v26 = v10;
  long long v11 = objc_msgSend(v9, "bs_firstObjectPassingTest:", &v22);
  long long v12 = [CARScreenInfo alloc];
  uint64_t v17 = MEMORY[0x1E4F143A8];
  uint64_t v18 = 3221225472;
  v19 = __73__CARSessionConfiguration_initWithSessionStatusOptions_propertySupplier___block_invoke_4;
  v20 = &unk_1E5E3B2D0;
  id v13 = v5;
  id v21 = v13;
  long long v14 = -[CARScreenInfo initWithPropertySupplier:screenType:additionalInsets:displayDictionary:physicalDisplay:](v12, "initWithPropertySupplier:screenType:additionalInsets:displayDictionary:physicalDisplay:", &v17, a3 != 0, v31[5], v11, *(double *)(*(void *)(a1 + 40) + 280), *(double *)(*(void *)(a1 + 40) + 288), *(double *)(*(void *)(a1 + 40) + 296), *(double *)(*(void *)(a1 + 40) + 304));
  if (v14)
  {
    objc_msgSend(*(id *)(a1 + 48), "addObject:", v14, v17, v18, v19, v20, v21, v22, v23, v24, v25);
    v15 = *(void **)(a1 + 56);
    id v16 = [(CARScreenInfo *)v14 identifier];
    [v15 addObject:v16];
  }
  _Block_object_dispose(&v30, 8);
}

void __73__CARSessionConfiguration_initWithSessionStatusOptions_propertySupplier___block_invoke_586(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  id v9 = a2;
  id v7 = [v9 objectForKey:@"uuid"];
  int v8 = [v7 isEqualToString:*(void *)(a1 + 32)];

  if (v8)
  {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a2);
    *a4 = 1;
  }
}

uint64_t __73__CARSessionConfiguration_initWithSessionStatusOptions_propertySupplier___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = [a2 streams];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __73__CARSessionConfiguration_initWithSessionStatusOptions_propertySupplier___block_invoke_3;
  v6[3] = &unk_1E5E3B438;
  id v7 = *(id *)(a1 + 32);
  uint64_t v4 = objc_msgSend(v3, "bs_containsObjectPassingTest:", v6);

  return v4;
}

uint64_t __73__CARSessionConfiguration_initWithSessionStatusOptions_propertySupplier___block_invoke_3(uint64_t a1, void *a2)
{
  id v3 = [a2 identifier];
  uint64_t v4 = [v3 isEqualToString:*(void *)(a1 + 32)];

  return v4;
}

uint64_t __73__CARSessionConfiguration_initWithSessionStatusOptions_propertySupplier___block_invoke_4(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) objectForKey:a2];
}

uint64_t __73__CARSessionConfiguration_initWithSessionStatusOptions_propertySupplier___block_invoke_5(uint64_t a1, void *a2)
{
  return [a2 supportsDDPContent];
}

void __73__CARSessionConfiguration_initWithSessionStatusOptions_propertySupplier___block_invoke_6(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v5 = [[CARManufacturerIcon alloc] initWithDictionary:v3];

  uint64_t v4 = v5;
  if (v5)
  {
    [*(id *)(a1 + 32) addObject:v5];
    uint64_t v4 = v5;
  }
}

void __73__CARSessionConfiguration_initWithSessionStatusOptions_propertySupplier___block_invoke_7(uint64_t a1, void *a2)
{
  id v3 = a2;
  objc_opt_class();
  uint64_t v4 = v3;
  if (objc_opt_isKindOfClass())
  {
    if (v4)
    {
      id v5 = [v4 objectForKeyedSubscript:@"buttonType"];
      objc_opt_class();
      id v6 = v5;
      if (objc_opt_isKindOfClass()) {
        id v7 = v6;
      }
      else {
        id v7 = 0;
      }

      id v9 = [v4 objectForKeyedSubscript:@"buttonLocation"];
      objc_opt_class();
      id v10 = v9;
      if (objc_opt_isKindOfClass()) {
        id v11 = v10;
      }
      else {
        id v11 = 0;
      }

      long long v12 = [v4 objectForKeyedSubscript:@"buttonPressDuration"];
      objc_opt_class();
      id v13 = v12;
      if (objc_opt_isKindOfClass()) {
        id v14 = v13;
      }
      else {
        id v14 = 0;
      }

      if (v7 && v11 && v14)
      {
        v15 = -[CARButtonInfo initWithButtonType:buttonLocation:buttonPressDuration:]([CARButtonInfo alloc], "initWithButtonType:buttonLocation:buttonPressDuration:", [v7 unsignedIntegerValue], objc_msgSend(v11, "unsignedIntegerValue"), objc_msgSend(v14, "unsignedIntegerValue"));
        [*(id *)(a1 + 32) addObject:v15];
      }
      else
      {
        id v16 = CarGeneralLogging();
        if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
          __73__CARSessionConfiguration_initWithSessionStatusOptions_propertySupplier___block_invoke_7_cold_2(v16, v17, v18, v19, v20, v21, v22, v23);
        }
      }
      int v8 = v4;
      goto LABEL_23;
    }
  }
  else
  {
  }
  int v8 = CarGeneralLogging();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
    __73__CARSessionConfiguration_initWithSessionStatusOptions_propertySupplier___block_invoke_7_cold_1();
  }
LABEL_23:
}

- (void)updateCarCapabilities
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  int v3 = 136315650;
  uint64_t v4 = "-[CARSessionConfiguration updateCarCapabilities]";
  __int16 v5 = 2048;
  uint64_t v6 = a1;
  __int16 v7 = 2112;
  uint64_t v8 = a2;
  _os_log_debug_impl(&dword_1ABB00000, log, OS_LOG_TYPE_DEBUG, "%s: configuration %p updated with car capabilities with %@", (uint8_t *)&v3, 0x20u);
}

- (id)valueForUndefinedKey:(id)a3
{
  id v3 = a3;
  uint64_t v4 = CarGeneralLogging();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG)) {
    -[CARSessionConfiguration valueForUndefinedKey:]((uint64_t)v3, v4);
  }

  return 0;
}

- (id)description
{
  id v26 = NSString;
  v28.receiver = self;
  v28.super_class = (Class)CARSessionConfiguration;
  v25 = [(CARSessionConfiguration *)&v28 description];
  char v24 = [(CARSessionConfiguration *)self vehicleName];
  uint64_t v23 = [(CARSessionConfiguration *)self vehicleModelName];
  uint64_t v22 = [(CARSessionConfiguration *)self vehicleManufacturer];
  id v3 = [(CARSessionConfiguration *)self vehicleSerialNumber];
  uint64_t v4 = [(CARSessionConfiguration *)self descriptionForTransportType];
  if ([(CARSessionConfiguration *)self supportsElectronicTollCollection]) {
    __int16 v5 = @"YES";
  }
  else {
    __int16 v5 = @"NO";
  }
  uint64_t v21 = v5;
  if ([(CARSessionConfiguration *)self rightHandDrive]) {
    uint64_t v6 = @"YES";
  }
  else {
    uint64_t v6 = @"NO";
  }
  uint64_t v20 = v6;
  uint64_t v19 = [(CARSessionConfiguration *)self descriptionForLimitableUserInterfaces];
  uint64_t v18 = [(CARSessionConfiguration *)self manufacturerIconLabel];
  if ([(CARSessionConfiguration *)self manufacturerIconVisible]) {
    __int16 v7 = @"YES";
  }
  else {
    __int16 v7 = @"NO";
  }
  uint64_t v17 = v7;
  if ([(CARSessionConfiguration *)self nightModeSupported]) {
    uint64_t v8 = @"YES";
  }
  else {
    uint64_t v8 = @"NO";
  }
  id v16 = v8;
  if ([(CARSessionConfiguration *)self supportsACBack]) {
    uint64_t v9 = @"YES";
  }
  else {
    uint64_t v9 = @"NO";
  }
  id v10 = [(CARSessionConfiguration *)self screens];
  v15 = +[CARSessionConfiguration descriptionForCapability:[(CARSessionConfiguration *)self nowPlayingAlbumArtMode]];
  id v11 = +[CARSessionConfiguration descriptionForUserInterfaceStyle:[(CARSessionConfiguration *)self userInterfaceStyle]];
  [(CARSessionConfiguration *)self viewAreaInsets];
  long long v12 = +[CARSessionConfiguration descriptionForEdgeInsets:](CARSessionConfiguration, "descriptionForEdgeInsets:");
  [(CARSessionConfiguration *)self dashboardRoundedCorners];
  id v13 = +[CARSessionConfiguration descriptionForEdgeInsets:](CARSessionConfiguration, "descriptionForEdgeInsets:");
  objc_msgSend(v26, "stringWithFormat:", @"[%@ name: %@, modelName: %@, manufacturer: %@, serialNumber: %@, transport: %@, ETC supported: %@, right hand drive: %@, limitableUserInterfaces: (%@), manufacturerIconLabel: %@, manufacturerIconVisible: %@, night mode supported: %@, supports AC_BACK: %@, screens: %@], [CC] Now Playing Album Art Mode: %@, [CC] User Interface Style: %@, [CC] Additional Safe Area Insets %@, [CC] Dashboard rounded corners: %@", v25, v24, v23, v22, v3, v4, v21, v20, v19, v18, v17, v16, v9, v10, v15, v11,
    v12,
  id v27 = v13);

  return v27;
}

- (id)screenInfoForScreenID:(id)a3
{
  id v4 = a3;
  uint64_t v12 = 0;
  id v13 = &v12;
  uint64_t v14 = 0x3032000000;
  v15 = __Block_byref_object_copy__1;
  id v16 = __Block_byref_object_dispose__1;
  id v17 = 0;
  __int16 v5 = [(CARSessionConfiguration *)self screens];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __49__CARSessionConfiguration_screenInfoForScreenID___block_invoke;
  v9[3] = &unk_1E5E3B4D0;
  id v6 = v4;
  id v10 = v6;
  id v11 = &v12;
  [v5 enumerateObjectsUsingBlock:v9];

  id v7 = (id)v13[5];
  _Block_object_dispose(&v12, 8);

  return v7;
}

void __49__CARSessionConfiguration_screenInfoForScreenID___block_invoke(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  id v9 = a2;
  id v7 = [v9 identifier];
  int v8 = [v7 isEqualToString:*(void *)(a1 + 32)];

  if (v8)
  {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a2);
    *a4 = 1;
  }
}

- (id)primaryDisplayPhysicalSize
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  char v2 = [(CARSessionConfiguration *)self screens];
  uint64_t v3 = [v2 countByEnumeratingWithState:&v14 objects:v18 count:16];
  CGFloat v4 = 0.0;
  if (v3)
  {
    uint64_t v5 = v3;
    uint64_t v6 = *(void *)v15;
    while (2)
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v15 != v6) {
          objc_enumerationMutation(v2);
        }
        int v8 = *(void **)(*((void *)&v14 + 1) + 8 * i);
        if (![v8 screenType])
        {
          [v8 physicalSize];
          CGFloat v9 = v10;
          CGFloat v4 = v11;
          goto LABEL_11;
        }
      }
      uint64_t v5 = [v2 countByEnumeratingWithState:&v14 objects:v18 count:16];
      if (v5) {
        continue;
      }
      break;
    }
  }
  CGFloat v9 = 0.0;
LABEL_11:

  v21.width = v9;
  v21.height = v4;
  uint64_t v12 = NSStringFromSize(v21);
  return v12;
}

- (NSString)name
{
  return self->_name;
}

- (NSString)modelName
{
  return self->_modelName;
}

- (NSString)manufacturerName
{
  return self->_manufacturerName;
}

- (NSString)vehicleName
{
  return self->_vehicleName;
}

- (NSString)vehicleModelName
{
  return self->_vehicleModelName;
}

- (NSString)vehicleSerialNumber
{
  return self->_vehicleSerialNumber;
}

- (NSString)vehicleManufacturer
{
  return self->_vehicleManufacturer;
}

- (NSString)vehicleFirmwareVersion
{
  return self->_vehicleFirmwareVersion;
}

- (NSString)vehicleHardwareVersion
{
  return self->_vehicleHardwareVersion;
}

- (BOOL)vehicleSupportsDestinationSharing
{
  return self->_vehicleSupportsDestinationSharing;
}

- (BOOL)vehicleSupportsGasoline
{
  return self->_vehicleSupportsGasoline;
}

- (BOOL)vehicleSupportsDiesel
{
  return self->_vehicleSupportsDiesel;
}

- (BOOL)vehicleSupportsElectric
{
  return self->_vehicleSupportsElectric;
}

- (BOOL)vehicleSupportsCNG
{
  return self->_vehicleSupportsCNG;
}

- (NSString)PPID
{
  return self->_PPID;
}

- (unint64_t)transportType
{
  return self->_transportType;
}

- (NSArray)displays
{
  return self->_displays;
}

- (NSArray)screens
{
  return self->_screens;
}

- (NSArray)screenIDs
{
  return self->_screenIDs;
}

- (BOOL)rightHandDrive
{
  return self->_rightHandDrive;
}

- (unint64_t)limitableUserInterfaces
{
  return self->_limitableUserInterfaces;
}

- (BOOL)nightModeSupported
{
  return self->_nightModeSupported;
}

- (NSString)endpointIdentifier
{
  return self->_endpointIdentifier;
}

- (int64_t)voiceTriggerMode
{
  return self->_voiceTriggerMode;
}

- (int64_t)nowPlayingAlbumArtMode
{
  return self->_nowPlayingAlbumArtMode;
}

- (NSEdgeInsets)viewAreaInsets
{
  double top = self->_viewAreaInsets.top;
  double left = self->_viewAreaInsets.left;
  double bottom = self->_viewAreaInsets.bottom;
  double right = self->_viewAreaInsets.right;
  result.double right = right;
  result.double bottom = bottom;
  result.double left = left;
  result.double top = top;
  return result;
}

- (int64_t)userInterfaceStyle
{
  return self->_userInterfaceStyle;
}

- (BOOL)supportsACBack
{
  return self->_supportsACBack;
}

- (BOOL)supportsSiriZLL
{
  return self->_supportsSiriZLL;
}

- (BOOL)supportsSiriZLLButton
{
  return self->_supportsSiriZLLButton;
}

- (BOOL)supportsSiriMixable
{
  return self->_supportsSiriMixable;
}

- (NSArray)vehicleButtons
{
  return self->_vehicleButtons;
}

- (NSString)deviceIdentifier
{
  return self->_deviceIdentifier;
}

- (BOOL)hasGaugeClusterScreen
{
  return self->_hasGaugeClusterScreen;
}

- (BOOL)supportsVehicleData
{
  return self->_supportsVehicleData;
}

- (NSString)vehicleDataProtocolVersion
{
  return self->_vehicleDataProtocolVersion;
}

- (unint64_t)vehicleDataPluginCount
{
  return self->_vehicleDataPluginCount;
}

- (BOOL)supportsLogTransfer
{
  return self->_supportsLogTransfer;
}

- (NSEdgeInsets)dashboardRoundedCorners
{
  double top = self->_dashboardRoundedCorners.top;
  double left = self->_dashboardRoundedCorners.left;
  double bottom = self->_dashboardRoundedCorners.bottom;
  double right = self->_dashboardRoundedCorners.right;
  result.double right = right;
  result.double bottom = bottom;
  result.double left = left;
  result.double top = top;
  return result;
}

- (void)setDashboardRoundedCorners:(NSEdgeInsets)a3
{
  self->_dashboardRoundedCorners = a3;
}

- (int64_t)defaultUserInterfaceStyle
{
  return self->_defaultUserInterfaceStyle;
}

- (void)setDefaultUserInterfaceStyle:(int64_t)a3
{
  self->_defaultUserInterfaceStyle = a3;
}

- (BOOL)supportsElectronicTollCollection
{
  return self->_supportsElectronicTollCollection;
}

- (void)setSupportsElectronicTollCollection:(BOOL)a3
{
  self->_supportsElectronicTollCollection = a3;
}

- (NSString)manufacturerIconLabel
{
  return self->_manufacturerIconLabel;
}

- (void)setManufacturerIconLabel:(id)a3
{
}

- (BOOL)manufacturerIconVisible
{
  return self->_manufacturerIconVisible;
}

- (void)setManufacturerIconVisible:(BOOL)a3
{
  self->_manufacturerIconVisible = a3;
}

- (NSArray)manufacturerIcons
{
  return self->_manufacturerIcons;
}

- (void)setManufacturerIcons:(id)a3
{
}

- (BOOL)hasAccessory
{
  return self->_hasAccessory;
}

- (void)setHasAccessory:(BOOL)a3
{
  self->_hasAccessory = a3;
}

- (NSDictionary)infoResponse
{
  return self->_infoResponse;
}

- (void)setInfoResponse:(id)a3
{
}

- (CARDisplayInfoProviding)displayInfoProvider
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_displayInfoProvider);
  return (CARDisplayInfoProviding *)WeakRetained;
}

- (void)setDisplayInfoProvider:(id)a3
{
}

- (NSArray)altScreenSuggestUIURLs
{
  return self->_altScreenSuggestUIURLs;
}

- (NSArray)lastOnDisplayUIContextURLs
{
  return self->_lastOnDisplayUIContextURLs;
}

- (NSArray)nowOnDisplayUIContextURLs
{
  return self->_nowOnDisplayUIContextURLs;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_nowOnDisplayUIContextURLs, 0);
  objc_storeStrong((id *)&self->_lastOnDisplayUIContextURLs, 0);
  objc_storeStrong((id *)&self->_altScreenSuggestUIURLs, 0);
  objc_destroyWeak((id *)&self->_displayInfoProvider);
  objc_storeStrong((id *)&self->_infoResponse, 0);
  objc_storeStrong((id *)&self->_manufacturerIcons, 0);
  objc_storeStrong((id *)&self->_manufacturerIconLabel, 0);
  objc_storeStrong((id *)&self->_vehicleDataProtocolVersion, 0);
  objc_storeStrong((id *)&self->_deviceIdentifier, 0);
  objc_storeStrong((id *)&self->_vehicleButtons, 0);
  objc_storeStrong((id *)&self->_endpointIdentifier, 0);
  objc_storeStrong((id *)&self->_screenIDs, 0);
  objc_storeStrong((id *)&self->_screens, 0);
  objc_storeStrong((id *)&self->_displays, 0);
  objc_storeStrong((id *)&self->_PPID, 0);
  objc_storeStrong((id *)&self->_vehicleHardwareVersion, 0);
  objc_storeStrong((id *)&self->_vehicleFirmwareVersion, 0);
  objc_storeStrong((id *)&self->_vehicleManufacturer, 0);
  objc_storeStrong((id *)&self->_vehicleSerialNumber, 0);
  objc_storeStrong((id *)&self->_vehicleModelName, 0);
  objc_storeStrong((id *)&self->_vehicleName, 0);
  objc_storeStrong((id *)&self->_manufacturerName, 0);
  objc_storeStrong((id *)&self->_modelName, 0);
  objc_storeStrong((id *)&self->_name, 0);
}

- (void)initWithSessionStatusOptions:propertySupplier:.cold.1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1ABB00000, v0, v1, "Button info is not array: %@", v2, v3, v4, v5, v6);
}

- (void)initWithSessionStatusOptions:(uint64_t)a3 propertySupplier:(uint64_t)a4 .cold.2(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void __73__CARSessionConfiguration_initWithSessionStatusOptions_propertySupplier___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1ABB00000, v0, v1, "Unable to create display info from physical screen info: %@", v2, v3, v4, v5, v6);
}

void __73__CARSessionConfiguration_initWithSessionStatusOptions_propertySupplier___block_invoke_cold_2()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1ABB00000, v0, v1, "Unable to create display info from physical screen dictionary: %@", v2, v3, v4, v5, v6);
}

void __73__CARSessionConfiguration_initWithSessionStatusOptions_propertySupplier___block_invoke_578_cold_1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1ABB00000, v0, v1, "Unable to create display info from screen info: %@", v2, v3, v4, v5, v6);
}

void __73__CARSessionConfiguration_initWithSessionStatusOptions_propertySupplier___block_invoke_578_cold_2()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1ABB00000, v0, v1, "Unable to create display info from screen dictionary: %@", v2, v3, v4, v5, v6);
}

void __73__CARSessionConfiguration_initWithSessionStatusOptions_propertySupplier___block_invoke_7_cold_1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1ABB00000, v0, v1, "Button info is of incorrect type: %@", v2, v3, v4, v5, v6);
}

void __73__CARSessionConfiguration_initWithSessionStatusOptions_propertySupplier___block_invoke_7_cold_2(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)valueForUndefinedKey:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  int v2 = 136315394;
  uint64_t v3 = "-[CARSessionConfiguration valueForUndefinedKey:]";
  __int16 v4 = 2112;
  uint64_t v5 = a1;
  _os_log_debug_impl(&dword_1ABB00000, a2, OS_LOG_TYPE_DEBUG, "%s: key %@", (uint8_t *)&v2, 0x16u);
}

@end