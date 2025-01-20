@interface MOSettingsStore
+ (BOOL)saveSettings:(id)a3 toURL:(id)a4;
+ (NSDictionary)directoryAttributes;
+ (NSDictionary)fileAttributes;
+ (id)loadDataAtURL:(id)a3 outError:(id *)a4;
+ (id)loadSettingsAtURL:(id)a3;
+ (void)createSettingsDirectoryAtURL:(id)a3;
+ (void)migrateSettingsIfNecessary:(id)a3;
- (BOOL)hasSensitiveDataInSettings:(id)a3;
- (MOAccountSettingsGroup)account;
- (MOAirDropSettingsGroup)airDrop;
- (MOAllowedClientSettingsGroup)allowedClient;
- (MOAppStoreSettingsGroup)appStore;
- (MOApplicationSettingsGroup)application;
- (MOCalculatorSettingsGroup)calculator;
- (MOCameraSettingsGroup)camera;
- (MOCarPlaySettingsGroup)carPlay;
- (MOCellularSettingsGroup)cellular;
- (MODateAndTimeSettingsGroup)dateAndTime;
- (MODeviceActivitySettingsGroup)deviceActivity;
- (MOFaceTimeSettingsGroup)faceTime;
- (MOFindMySettingsGroup)findMy;
- (MOGameCenterSettingsGroup)gameCenter;
- (MOIntelligenceSettingsGroup)intelligence;
- (MOKeyboardSettingsGroup)keyboard;
- (MOManagedSettingsSettingsGroup)managedSettings;
- (MOMediaSettingsGroup)media;
- (MOMessagesSettingsGroup)messages;
- (MONewsSettingsGroup)news;
- (MONotificationSettingsGroup)notification;
- (MOPasscodeSettingsGroup)passcode;
- (MOPrivacySettingsGroup)privacy;
- (MOSafariSettingsGroup)safari;
- (MOScreenTimeSettingsGroup)screenTime;
- (MOSettingsReader)reader;
- (MOSettingsWriter)writer;
- (MOShieldSettingsGroup)shield;
- (MOSiriSettingsGroup)siri;
- (MOUserSafetySettingsGroup)userSafety;
- (MOUserSettingsGroup)user;
- (MOWebContentSettingsGroup)webContent;
- (id)initStore;
- (id)metadataForSettingKey:(id)a3;
- (id)settingKeyFromSetting:(id)a3 group:(id)a4;
@end

@implementation MOSettingsStore

- (MOShieldSettingsGroup)shield
{
  return self->_shield;
}

- (MOUserSafetySettingsGroup)userSafety
{
  return self->_userSafety;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_webContent, 0);
  objc_storeStrong((id *)&self->_userSafety, 0);
  objc_storeStrong((id *)&self->_user, 0);
  objc_storeStrong((id *)&self->_siri, 0);
  objc_storeStrong((id *)&self->_shield, 0);
  objc_storeStrong((id *)&self->_screenTime, 0);
  objc_storeStrong((id *)&self->_safari, 0);
  objc_storeStrong((id *)&self->_privacy, 0);
  objc_storeStrong((id *)&self->_passcode, 0);
  objc_storeStrong((id *)&self->_notification, 0);
  objc_storeStrong((id *)&self->_news, 0);
  objc_storeStrong((id *)&self->_messages, 0);
  objc_storeStrong((id *)&self->_media, 0);
  objc_storeStrong((id *)&self->_managedSettings, 0);
  objc_storeStrong((id *)&self->_keyboard, 0);
  objc_storeStrong((id *)&self->_intelligence, 0);
  objc_storeStrong((id *)&self->_gameCenter, 0);
  objc_storeStrong((id *)&self->_findMy, 0);
  objc_storeStrong((id *)&self->_faceTime, 0);
  objc_storeStrong((id *)&self->_deviceActivity, 0);
  objc_storeStrong((id *)&self->_dateAndTime, 0);
  objc_storeStrong((id *)&self->_cellular, 0);
  objc_storeStrong((id *)&self->_carPlay, 0);
  objc_storeStrong((id *)&self->_camera, 0);
  objc_storeStrong((id *)&self->_calculator, 0);
  objc_storeStrong((id *)&self->_appStore, 0);
  objc_storeStrong((id *)&self->_application, 0);
  objc_storeStrong((id *)&self->_allowedClient, 0);
  objc_storeStrong((id *)&self->_airDrop, 0);
  objc_storeStrong((id *)&self->_account, 0);
}

+ (id)loadSettingsAtURL:(id)a3
{
  id v4 = a3;
  id v18 = 0;
  v5 = [a1 loadDataAtURL:v4 outError:&v18];
  id v6 = v18;
  v7 = v6;
  if (!v5)
  {
    v12 = [v6 domain];
    if ([v12 isEqualToString:*MEMORY[0x1E4F281F8]])
    {
      uint64_t v13 = [v7 code];

      if (v13 == 260)
      {
        v10 = +[MOLogger store];
        if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)v16 = 0;
          _os_log_impl(&dword_1B8ED1000, v10, OS_LOG_TYPE_DEFAULT, "No settings have been applied", v16, 2u);
        }
LABEL_14:
        v11 = 0;
        id v9 = v7;
        goto LABEL_15;
      }
    }
    else
    {
    }
    v10 = +[MOLogger store];
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      +[MOSettingsStore loadSettingsAtURL:]();
    }
    goto LABEL_14;
  }
  id v17 = 0;
  v8 = [MEMORY[0x1E4F28F98] propertyListWithData:v5 options:0 format:0 error:&v17];
  id v9 = v17;

  v10 = [v8 mutableCopy];
  if (v10)
  {
    [a1 migrateSettingsIfNecessary:v10];
    v10 = v10;
    v11 = v10;
  }
  else
  {
    v14 = +[MOLogger store];
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
      +[MOSettingsStore loadSettingsAtURL:]();
    }

    v11 = 0;
  }
LABEL_15:

  return v11;
}

+ (id)loadDataAtURL:(id)a3 outError:(id *)a4
{
  return (id)[MEMORY[0x1E4F1C9B8] dataWithContentsOfURL:a3 options:2 error:a4];
}

- (id)initStore
{
  v149.receiver = self;
  v149.super_class = (Class)MOSettingsStore;
  v2 = [(MOSettingsStore *)&v149 init];
  v3 = [MOAccountSettingsGroup alloc];
  id v4 = [(MOSettingsStore *)v2 reader];
  v5 = [(MOSettingsStore *)v2 writer];
  uint64_t v6 = [(MOSettingsGroup *)v3 initWithReader:v4 writer:v5];
  account = v2->_account;
  v2->_account = (MOAccountSettingsGroup *)v6;

  v8 = [MOAirDropSettingsGroup alloc];
  id v9 = [(MOSettingsStore *)v2 reader];
  v10 = [(MOSettingsStore *)v2 writer];
  uint64_t v11 = [(MOSettingsGroup *)v8 initWithReader:v9 writer:v10];
  airDrop = v2->_airDrop;
  v2->_airDrop = (MOAirDropSettingsGroup *)v11;

  uint64_t v13 = [MOAllowedClientSettingsGroup alloc];
  v14 = [(MOSettingsStore *)v2 reader];
  v15 = [(MOSettingsStore *)v2 writer];
  uint64_t v16 = [(MOSettingsGroup *)v13 initWithReader:v14 writer:v15];
  allowedClient = v2->_allowedClient;
  v2->_allowedClient = (MOAllowedClientSettingsGroup *)v16;

  id v18 = [MOApplicationSettingsGroup alloc];
  v19 = [(MOSettingsStore *)v2 reader];
  v20 = [(MOSettingsStore *)v2 writer];
  uint64_t v21 = [(MOSettingsGroup *)v18 initWithReader:v19 writer:v20];
  application = v2->_application;
  v2->_application = (MOApplicationSettingsGroup *)v21;

  v23 = [MOAppStoreSettingsGroup alloc];
  v24 = [(MOSettingsStore *)v2 reader];
  v25 = [(MOSettingsStore *)v2 writer];
  uint64_t v26 = [(MOSettingsGroup *)v23 initWithReader:v24 writer:v25];
  appStore = v2->_appStore;
  v2->_appStore = (MOAppStoreSettingsGroup *)v26;

  v28 = [MOCalculatorSettingsGroup alloc];
  v29 = [(MOSettingsStore *)v2 reader];
  v30 = [(MOSettingsStore *)v2 writer];
  uint64_t v31 = [(MOSettingsGroup *)v28 initWithReader:v29 writer:v30];
  calculator = v2->_calculator;
  v2->_calculator = (MOCalculatorSettingsGroup *)v31;

  v33 = [MOCameraSettingsGroup alloc];
  v34 = [(MOSettingsStore *)v2 reader];
  v35 = [(MOSettingsStore *)v2 writer];
  uint64_t v36 = [(MOSettingsGroup *)v33 initWithReader:v34 writer:v35];
  camera = v2->_camera;
  v2->_camera = (MOCameraSettingsGroup *)v36;

  v38 = [MOCarPlaySettingsGroup alloc];
  v39 = [(MOSettingsStore *)v2 reader];
  v40 = [(MOSettingsStore *)v2 writer];
  uint64_t v41 = [(MOSettingsGroup *)v38 initWithReader:v39 writer:v40];
  carPlay = v2->_carPlay;
  v2->_carPlay = (MOCarPlaySettingsGroup *)v41;

  v43 = [MOCellularSettingsGroup alloc];
  v44 = [(MOSettingsStore *)v2 reader];
  v45 = [(MOSettingsStore *)v2 writer];
  uint64_t v46 = [(MOSettingsGroup *)v43 initWithReader:v44 writer:v45];
  cellular = v2->_cellular;
  v2->_cellular = (MOCellularSettingsGroup *)v46;

  v48 = [MODateAndTimeSettingsGroup alloc];
  v49 = [(MOSettingsStore *)v2 reader];
  v50 = [(MOSettingsStore *)v2 writer];
  uint64_t v51 = [(MOSettingsGroup *)v48 initWithReader:v49 writer:v50];
  dateAndTime = v2->_dateAndTime;
  v2->_dateAndTime = (MODateAndTimeSettingsGroup *)v51;

  v53 = [MODeviceActivitySettingsGroup alloc];
  v54 = [(MOSettingsStore *)v2 reader];
  v55 = [(MOSettingsStore *)v2 writer];
  uint64_t v56 = [(MOSettingsGroup *)v53 initWithReader:v54 writer:v55];
  deviceActivity = v2->_deviceActivity;
  v2->_deviceActivity = (MODeviceActivitySettingsGroup *)v56;

  v58 = [MOFaceTimeSettingsGroup alloc];
  v59 = [(MOSettingsStore *)v2 reader];
  v60 = [(MOSettingsStore *)v2 writer];
  uint64_t v61 = [(MOSettingsGroup *)v58 initWithReader:v59 writer:v60];
  faceTime = v2->_faceTime;
  v2->_faceTime = (MOFaceTimeSettingsGroup *)v61;

  v63 = [MOFindMySettingsGroup alloc];
  v64 = [(MOSettingsStore *)v2 reader];
  v65 = [(MOSettingsStore *)v2 writer];
  uint64_t v66 = [(MOSettingsGroup *)v63 initWithReader:v64 writer:v65];
  findMy = v2->_findMy;
  v2->_findMy = (MOFindMySettingsGroup *)v66;

  v68 = [MOGameCenterSettingsGroup alloc];
  v69 = [(MOSettingsStore *)v2 reader];
  v70 = [(MOSettingsStore *)v2 writer];
  uint64_t v71 = [(MOSettingsGroup *)v68 initWithReader:v69 writer:v70];
  gameCenter = v2->_gameCenter;
  v2->_gameCenter = (MOGameCenterSettingsGroup *)v71;

  v73 = [MOKeyboardSettingsGroup alloc];
  v74 = [(MOSettingsStore *)v2 reader];
  v75 = [(MOSettingsStore *)v2 writer];
  uint64_t v76 = [(MOSettingsGroup *)v73 initWithReader:v74 writer:v75];
  keyboard = v2->_keyboard;
  v2->_keyboard = (MOKeyboardSettingsGroup *)v76;

  v78 = [MOManagedSettingsSettingsGroup alloc];
  v79 = [(MOSettingsStore *)v2 reader];
  v80 = [(MOSettingsStore *)v2 writer];
  uint64_t v81 = [(MOSettingsGroup *)v78 initWithReader:v79 writer:v80];
  managedSettings = v2->_managedSettings;
  v2->_managedSettings = (MOManagedSettingsSettingsGroup *)v81;

  v83 = [MOMediaSettingsGroup alloc];
  v84 = [(MOSettingsStore *)v2 reader];
  v85 = [(MOSettingsStore *)v2 writer];
  uint64_t v86 = [(MOSettingsGroup *)v83 initWithReader:v84 writer:v85];
  media = v2->_media;
  v2->_media = (MOMediaSettingsGroup *)v86;

  v88 = [MOMessagesSettingsGroup alloc];
  v89 = [(MOSettingsStore *)v2 reader];
  v90 = [(MOSettingsStore *)v2 writer];
  uint64_t v91 = [(MOSettingsGroup *)v88 initWithReader:v89 writer:v90];
  messages = v2->_messages;
  v2->_messages = (MOMessagesSettingsGroup *)v91;

  v93 = [MONewsSettingsGroup alloc];
  v94 = [(MOSettingsStore *)v2 reader];
  v95 = [(MOSettingsStore *)v2 writer];
  uint64_t v96 = [(MOSettingsGroup *)v93 initWithReader:v94 writer:v95];
  news = v2->_news;
  v2->_news = (MONewsSettingsGroup *)v96;

  v98 = [MONotificationSettingsGroup alloc];
  v99 = [(MOSettingsStore *)v2 reader];
  v100 = [(MOSettingsStore *)v2 writer];
  uint64_t v101 = [(MOSettingsGroup *)v98 initWithReader:v99 writer:v100];
  notification = v2->_notification;
  v2->_notification = (MONotificationSettingsGroup *)v101;

  v103 = [MOPasscodeSettingsGroup alloc];
  v104 = [(MOSettingsStore *)v2 reader];
  v105 = [(MOSettingsStore *)v2 writer];
  uint64_t v106 = [(MOSettingsGroup *)v103 initWithReader:v104 writer:v105];
  passcode = v2->_passcode;
  v2->_passcode = (MOPasscodeSettingsGroup *)v106;

  v108 = [MOPrivacySettingsGroup alloc];
  v109 = [(MOSettingsStore *)v2 reader];
  v110 = [(MOSettingsStore *)v2 writer];
  uint64_t v111 = [(MOSettingsGroup *)v108 initWithReader:v109 writer:v110];
  privacy = v2->_privacy;
  v2->_privacy = (MOPrivacySettingsGroup *)v111;

  v113 = [MOSafariSettingsGroup alloc];
  v114 = [(MOSettingsStore *)v2 reader];
  v115 = [(MOSettingsStore *)v2 writer];
  uint64_t v116 = [(MOSettingsGroup *)v113 initWithReader:v114 writer:v115];
  safari = v2->_safari;
  v2->_safari = (MOSafariSettingsGroup *)v116;

  v118 = [MOScreenTimeSettingsGroup alloc];
  v119 = [(MOSettingsStore *)v2 reader];
  v120 = [(MOSettingsStore *)v2 writer];
  uint64_t v121 = [(MOSettingsGroup *)v118 initWithReader:v119 writer:v120];
  screenTime = v2->_screenTime;
  v2->_screenTime = (MOScreenTimeSettingsGroup *)v121;

  v123 = [MOShieldSettingsGroup alloc];
  v124 = [(MOSettingsStore *)v2 reader];
  v125 = [(MOSettingsStore *)v2 writer];
  uint64_t v126 = [(MOSettingsGroup *)v123 initWithReader:v124 writer:v125];
  shield = v2->_shield;
  v2->_shield = (MOShieldSettingsGroup *)v126;

  v128 = [MOSiriSettingsGroup alloc];
  v129 = [(MOSettingsStore *)v2 reader];
  v130 = [(MOSettingsStore *)v2 writer];
  uint64_t v131 = [(MOSettingsGroup *)v128 initWithReader:v129 writer:v130];
  siri = v2->_siri;
  v2->_siri = (MOSiriSettingsGroup *)v131;

  v133 = [MOUserSettingsGroup alloc];
  v134 = [(MOSettingsStore *)v2 reader];
  v135 = [(MOSettingsStore *)v2 writer];
  uint64_t v136 = [(MOSettingsGroup *)v133 initWithReader:v134 writer:v135];
  user = v2->_user;
  v2->_user = (MOUserSettingsGroup *)v136;

  v138 = [MOUserSafetySettingsGroup alloc];
  v139 = [(MOSettingsStore *)v2 reader];
  v140 = [(MOSettingsStore *)v2 writer];
  uint64_t v141 = [(MOSettingsGroup *)v138 initWithReader:v139 writer:v140];
  userSafety = v2->_userSafety;
  v2->_userSafety = (MOUserSafetySettingsGroup *)v141;

  v143 = [MOWebContentSettingsGroup alloc];
  v144 = [(MOSettingsStore *)v2 reader];
  v145 = [(MOSettingsStore *)v2 writer];
  uint64_t v146 = [(MOSettingsGroup *)v143 initWithReader:v144 writer:v145];
  webContent = v2->_webContent;
  v2->_webContent = (MOWebContentSettingsGroup *)v146;

  return v2;
}

- (MOSettingsWriter)writer
{
  return 0;
}

- (MOSettingsReader)reader
{
  return 0;
}

- (id)settingKeyFromSetting:(id)a3 group:(id)a4
{
  return (id)[NSString stringWithFormat:@"%@.%@", a4, a3];
}

+ (NSDictionary)directoryAttributes
{
  if (directoryAttributes_onceToken != -1) {
    dispatch_once(&directoryAttributes_onceToken, &__block_literal_global_2);
  }
  v2 = (void *)directoryAttributes_directoryAttributes;
  return (NSDictionary *)v2;
}

void __38__MOSettingsStore_directoryAttributes__block_invoke()
{
  v5[3] = *MEMORY[0x1E4F143B8];
  uint64_t v0 = *MEMORY[0x1E4F282E0];
  v4[0] = *MEMORY[0x1E4F28320];
  v4[1] = v0;
  v5[0] = @"mobile";
  v5[1] = @"mobile";
  v4[2] = *MEMORY[0x1E4F28330];
  v1 = [MEMORY[0x1E4F28ED0] numberWithShort:493];
  v5[2] = v1;
  uint64_t v2 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v5 forKeys:v4 count:3];
  v3 = (void *)directoryAttributes_directoryAttributes;
  directoryAttributes_directoryAttributes = v2;
}

+ (NSDictionary)fileAttributes
{
  if (fileAttributes_onceToken != -1) {
    dispatch_once(&fileAttributes_onceToken, &__block_literal_global_41);
  }
  uint64_t v2 = (void *)fileAttributes_directoryAttributes;
  return (NSDictionary *)v2;
}

void __33__MOSettingsStore_fileAttributes__block_invoke()
{
  v5[3] = *MEMORY[0x1E4F143B8];
  uint64_t v0 = *MEMORY[0x1E4F282E0];
  v4[0] = *MEMORY[0x1E4F28320];
  v4[1] = v0;
  v5[0] = @"mobile";
  v5[1] = @"mobile";
  v4[2] = *MEMORY[0x1E4F28330];
  v1 = [MEMORY[0x1E4F28ED0] numberWithShort:420];
  v5[2] = v1;
  uint64_t v2 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v5 forKeys:v4 count:3];
  v3 = (void *)fileAttributes_directoryAttributes;
  fileAttributes_directoryAttributes = v2;
}

+ (void)createSettingsDirectoryAtURL:(id)a3
{
  id v4 = (void *)MEMORY[0x1E4F28CB8];
  id v5 = a3;
  uint64_t v6 = [v4 defaultManager];
  v7 = [a1 directoryAttributes];
  id v11 = 0;
  char v8 = [v6 createDirectoryAtURL:v5 withIntermediateDirectories:1 attributes:v7 error:&v11];

  id v9 = v11;
  if ((v8 & 1) == 0)
  {
    v10 = +[MOLogger store];
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      +[MOSettingsStore createSettingsDirectoryAtURL:]((uint64_t)v9, v10);
    }
  }
}

+ (BOOL)saveSettings:(id)a3 toURL:(id)a4
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  v7 = (void *)[a3 mutableCopy];
  [v7 setObject:&unk_1F12BB7D0 forKeyedSubscript:@"version"];
  id v20 = 0;
  char v8 = [MEMORY[0x1E4F28F98] dataWithPropertyList:v7 format:200 options:0 error:&v20];
  id v9 = v20;
  if (v8)
  {
    v10 = [v6 path];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      v22 = v10;
      _os_log_impl(&dword_1B8ED1000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "Writing plist data to path: %{public}@", buf, 0xCu);
    }
    id v19 = v9;
    char v11 = [v8 writeToFile:v10 options:1 error:&v19];
    id v12 = v19;

    if ((v11 & 1) == 0)
    {
      uint64_t v16 = +[MOLogger store];
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
        +[MOSettingsStore saveSettings:toURL:]();
      }
      goto LABEL_14;
    }
    uint64_t v13 = [MEMORY[0x1E4F28CB8] defaultManager];
    v14 = [a1 fileAttributes];
    id v18 = v12;
    char v15 = [v13 setAttributes:v14 ofItemAtPath:v10 error:&v18];
    id v9 = v18;

    if ((v15 & 1) == 0)
    {
      uint64_t v16 = +[MOLogger store];
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
        +[MOSettingsStore saveSettings:toURL:]();
      }
      id v12 = v9;
LABEL_14:

      id v9 = v12;
    }
  }
  else
  {
    v10 = +[MOLogger store];
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      +[MOSettingsStore saveSettings:toURL:]((uint64_t)v9, v10);
    }
    char v11 = 0;
  }

  return v11;
}

+ (void)migrateSettingsIfNecessary:(id)a3
{
  v11[1] = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  id v4 = [v3 objectForKeyedSubscript:@"version"];
  if ([v4 integerValue] == 1)
  {
    id v5 = [v3 objectForKeyedSubscript:@"allowedClient.allowedClient"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v11[0] = v5;
      id v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:v11 count:1];
      [v3 setObject:v6 forKeyedSubscript:@"deviceActivity.allowedClients"];

      v10 = v5;
      v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v10 count:1];
      [v3 setObject:v7 forKeyedSubscript:@"managedSettings.allowedClients"];
    }
    char v8 = [v3 objectForKeyedSubscript:@"allowedClient.tokenKeys"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      [v3 setObject:v8 forKeyedSubscript:@"managedSettings.tokenDecodingKeys"];
      id v9 = [v8 firstObject];
      [v3 setObject:v9 forKeyedSubscript:@"managedSettings.tokenEncodingKey"];

      [v3 setObject:0 forKeyedSubscript:@"allowedClient.tokenKeys"];
    }
  }
  [v3 setObject:0 forKeyedSubscript:@"version"];
}

- (id)metadataForSettingKey:(id)a3
{
  id v4 = [a3 componentsSeparatedByString:@"."];
  if ([v4 count] == 2)
  {
    id v5 = [v4 objectAtIndexedSubscript:0];
    id v6 = [v4 objectAtIndexedSubscript:1];
    v7 = [(MOSettingsStore *)self valueForKey:v5];
    objc_opt_class();
    char v8 = 0;
    if (objc_opt_isKindOfClass())
    {
      char v8 = [v7 metadataForSetting:v6];
    }
  }
  else
  {
    char v8 = 0;
  }

  return v8;
}

- (BOOL)hasSensitiveDataInSettings:(id)a3
{
  id v4 = [a3 allKeys];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __46__MOSettingsStore_hasSensitiveDataInSettings___block_invoke;
  v7[3] = &unk_1E61CC0E0;
  v7[4] = self;
  uint64_t v5 = [v4 indexOfObjectPassingTest:v7];

  return v5 != 0x7FFFFFFFFFFFFFFFLL;
}

uint64_t __46__MOSettingsStore_hasSensitiveDataInSettings___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = [*(id *)(a1 + 32) metadataForSettingKey:a2];
  uint64_t v3 = [v2 isPrivacySensitive];

  return v3;
}

- (MOAccountSettingsGroup)account
{
  return self->_account;
}

- (MOAirDropSettingsGroup)airDrop
{
  return self->_airDrop;
}

- (MOAllowedClientSettingsGroup)allowedClient
{
  return self->_allowedClient;
}

- (MOApplicationSettingsGroup)application
{
  return self->_application;
}

- (MOAppStoreSettingsGroup)appStore
{
  return self->_appStore;
}

- (MOCalculatorSettingsGroup)calculator
{
  return self->_calculator;
}

- (MOCameraSettingsGroup)camera
{
  return self->_camera;
}

- (MOCarPlaySettingsGroup)carPlay
{
  return self->_carPlay;
}

- (MOCellularSettingsGroup)cellular
{
  return self->_cellular;
}

- (MODateAndTimeSettingsGroup)dateAndTime
{
  return self->_dateAndTime;
}

- (MODeviceActivitySettingsGroup)deviceActivity
{
  return self->_deviceActivity;
}

- (MOFaceTimeSettingsGroup)faceTime
{
  return self->_faceTime;
}

- (MOFindMySettingsGroup)findMy
{
  return self->_findMy;
}

- (MOGameCenterSettingsGroup)gameCenter
{
  return self->_gameCenter;
}

- (MOIntelligenceSettingsGroup)intelligence
{
  return self->_intelligence;
}

- (MOKeyboardSettingsGroup)keyboard
{
  return self->_keyboard;
}

- (MOManagedSettingsSettingsGroup)managedSettings
{
  return self->_managedSettings;
}

- (MOMediaSettingsGroup)media
{
  return self->_media;
}

- (MOMessagesSettingsGroup)messages
{
  return self->_messages;
}

- (MONewsSettingsGroup)news
{
  return self->_news;
}

- (MONotificationSettingsGroup)notification
{
  return self->_notification;
}

- (MOPasscodeSettingsGroup)passcode
{
  return self->_passcode;
}

- (MOPrivacySettingsGroup)privacy
{
  return self->_privacy;
}

- (MOSafariSettingsGroup)safari
{
  return self->_safari;
}

- (MOScreenTimeSettingsGroup)screenTime
{
  return self->_screenTime;
}

- (MOSiriSettingsGroup)siri
{
  return self->_siri;
}

- (MOUserSettingsGroup)user
{
  return self->_user;
}

- (MOWebContentSettingsGroup)webContent
{
  return self->_webContent;
}

+ (void)createSettingsDirectoryAtURL:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138543362;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_1B8ED1000, a2, OS_LOG_TYPE_ERROR, "Unable to create settings directory: %{public}@", (uint8_t *)&v2, 0xCu);
}

+ (void)loadSettingsAtURL:.cold.1()
{
  OUTLINED_FUNCTION_0_2();
  OUTLINED_FUNCTION_1_1(&dword_1B8ED1000, v0, v1, "Failed to read data from url: %{public}@ with error: %{public}@");
}

+ (void)loadSettingsAtURL:.cold.2()
{
  OUTLINED_FUNCTION_0_2();
  OUTLINED_FUNCTION_1_1(&dword_1B8ED1000, v0, v1, "Failed to deserialize data from url: %{public}@ with error: %{public}@");
}

+ (void)saveSettings:(uint64_t)a1 toURL:(NSObject *)a2 .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138543362;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_1B8ED1000, a2, OS_LOG_TYPE_ERROR, "Failed to create plist data. error: %{public}@", (uint8_t *)&v2, 0xCu);
}

+ (void)saveSettings:toURL:.cold.2()
{
  OUTLINED_FUNCTION_0_2();
  OUTLINED_FUNCTION_1_1(&dword_1B8ED1000, v0, v1, "Failed to set attributes of file at path: %{public}@ error: %{public}@");
}

+ (void)saveSettings:toURL:.cold.3()
{
  OUTLINED_FUNCTION_0_2();
  OUTLINED_FUNCTION_1_1(&dword_1B8ED1000, v0, v1, "Failed to write plist data to path: %{public}@ error: %{public}@");
}

@end