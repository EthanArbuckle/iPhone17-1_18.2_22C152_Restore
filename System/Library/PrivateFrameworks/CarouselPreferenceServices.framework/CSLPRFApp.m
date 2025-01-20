@interface CSLPRFApp
+ (id)appWithACXRemoteApplication:(id)a3;
+ (id)appWithApplicationRecord:(id)a3;
+ (id)appWithBBSectionInfo:(id)a3;
+ (id)appWithBundleID:(id)a3 name:(id)a4 sdkVersion:(id)a5 supportsAlwaysOnDisplay:(BOOL)a6 defaultsToPrivateAlwaysOnDisplayTreatment:(BOOL)a7;
- (ACXRemoteApplication)remoteApplicationRecord;
- (BOOL)defaultsToPrivateAlwaysOnDisplayTreatment;
- (BOOL)isBBSourcedApplication;
- (BOOL)isEqual:(id)a3;
- (BOOL)isLocal;
- (BOOL)isRemovedSystemApp;
- (BOOL)supportsAlwaysOnDisplay;
- (BOOL)supportsSmartStack;
- (CSLPRFApp)initWithBundleIdentifier:(id)a3 localizedName:(id)a4 sdkVersion:(id)a5 supportsAlwaysOnDisplay:(BOOL)a6 defaultsToPrivateAlwaysOnDisplayTreatment:(BOOL)a7 applicationRecord:(id)a8 bbSectionInfo:(id)a9;
- (CSLPRFApp)initWithBundleIdentifier:(id)a3 localizedName:(id)a4 sdkVersion:(id)a5 supportsAlwaysOnDisplay:(BOOL)a6 defaultsToPrivateAlwaysOnDisplayTreatment:(BOOL)a7 applicationRecord:(id)a8 remoteApplicationRecord:(id)a9 bbSectionInfo:(id)a10;
- (LSApplicationRecord)applicationRecord;
- (NSArray)counterpartIdentifiers;
- (NSMutableArray)unionedBackgroundModes;
- (NSString)SDKVersion;
- (NSString)bundleIdentifier;
- (NSString)description;
- (NSString)localizedName;
- (NSURL)URL;
- (id)bbSectionInfo;
- (int64_t)compare:(id)a3;
- (unint64_t)hash;
- (void)setRemoteApplicationRecord:(id)a3;
@end

@implementation CSLPRFApp

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_remoteApplicationRecord, 0);
  objc_storeStrong((id *)&self->_bbSectionInfo, 0);
  objc_destroyWeak((id *)&self->_applicationRecord);
  objc_storeStrong((id *)&self->_URL, 0);
  objc_storeStrong((id *)&self->_counterpartIdentifiers, 0);
  objc_storeStrong((id *)&self->_SDKVersion, 0);
  objc_storeStrong((id *)&self->_localizedName, 0);
  objc_storeStrong((id *)&self->_bundleIdentifier, 0);
  objc_destroyWeak((id *)&self->_lock_applicationRecord);
}

- (void)setRemoteApplicationRecord:(id)a3
{
}

- (ACXRemoteApplication)remoteApplicationRecord
{
  return self->_remoteApplicationRecord;
}

- (id)bbSectionInfo
{
  return self->_bbSectionInfo;
}

- (BOOL)isBBSourcedApplication
{
  return self->_isBBSourcedApplication;
}

- (BOOL)isRemovedSystemApp
{
  return self->_isRemovedSystemApp;
}

- (NSURL)URL
{
  return self->_URL;
}

- (BOOL)isLocal
{
  return self->_local;
}

- (NSArray)counterpartIdentifiers
{
  return self->_counterpartIdentifiers;
}

- (BOOL)defaultsToPrivateAlwaysOnDisplayTreatment
{
  return self->_defaultsToPrivateAlwaysOnDisplayTreatment;
}

- (BOOL)supportsAlwaysOnDisplay
{
  return self->_supportsAlwaysOnDisplay;
}

- (NSString)SDKVersion
{
  return self->_SDKVersion;
}

- (NSString)localizedName
{
  return self->_localizedName;
}

- (NSString)bundleIdentifier
{
  return self->_bundleIdentifier;
}

- (unint64_t)hash
{
  v3 = [MEMORY[0x263F29C60] builder];
  id v4 = (id)[v3 appendObject:self->_localizedName];
  id v5 = (id)[v3 appendObject:self->_bundleIdentifier];
  id v6 = (id)[v3 appendObject:self->_SDKVersion];
  id v7 = (id)[v3 appendBool:self->_supportsAlwaysOnDisplay];
  id v8 = (id)[v3 appendBool:self->_defaultsToPrivateAlwaysOnDisplayTreatment];
  id v9 = (id)[v3 appendBool:self->_local];
  id v10 = (id)[v3 appendObject:self->_URL];
  id v11 = (id)[v3 appendObject:self->_bbSectionInfo];
  unint64_t v12 = [v3 hash];

  return v12;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  id v5 = [MEMORY[0x263F29C58] builderWithObject:v4 ofExpectedClass:objc_opt_class()];
  localizedName = self->_localizedName;
  v48[0] = MEMORY[0x263EF8330];
  v48[1] = 3221225472;
  v48[2] = __21__CSLPRFApp_isEqual___block_invoke;
  v48[3] = &unk_264A0BBC8;
  id v7 = v4;
  id v49 = v7;
  id v8 = (id)[v5 appendObject:localizedName counterpart:v48];
  bundleIdentifier = self->_bundleIdentifier;
  v46[0] = MEMORY[0x263EF8330];
  v46[1] = 3221225472;
  v46[2] = __21__CSLPRFApp_isEqual___block_invoke_2;
  v46[3] = &unk_264A0BBC8;
  id v10 = v7;
  id v47 = v10;
  id v11 = (id)[v5 appendObject:bundleIdentifier counterpart:v46];
  SDKVersion = self->_SDKVersion;
  v44[0] = MEMORY[0x263EF8330];
  v44[1] = 3221225472;
  v44[2] = __21__CSLPRFApp_isEqual___block_invoke_3;
  v44[3] = &unk_264A0BBC8;
  id v13 = v10;
  id v45 = v13;
  id v14 = (id)[v5 appendObject:SDKVersion counterpart:v44];
  BOOL supportsAlwaysOnDisplay = self->_supportsAlwaysOnDisplay;
  v42[0] = MEMORY[0x263EF8330];
  v42[1] = 3221225472;
  v42[2] = __21__CSLPRFApp_isEqual___block_invoke_4;
  v42[3] = &unk_264A0BCF8;
  id v16 = v13;
  id v43 = v16;
  id v17 = (id)[v5 appendBool:supportsAlwaysOnDisplay counterpart:v42];
  BOOL defaultsToPrivateAlwaysOnDisplayTreatment = self->_defaultsToPrivateAlwaysOnDisplayTreatment;
  v40[0] = MEMORY[0x263EF8330];
  v40[1] = 3221225472;
  v40[2] = __21__CSLPRFApp_isEqual___block_invoke_5;
  v40[3] = &unk_264A0BCF8;
  id v19 = v16;
  id v41 = v19;
  id v20 = (id)[v5 appendBool:defaultsToPrivateAlwaysOnDisplayTreatment counterpart:v40];
  BOOL local = self->_local;
  v38[0] = MEMORY[0x263EF8330];
  v38[1] = 3221225472;
  v38[2] = __21__CSLPRFApp_isEqual___block_invoke_6;
  v38[3] = &unk_264A0BCF8;
  id v22 = v19;
  id v39 = v22;
  id v23 = (id)[v5 appendBool:local counterpart:v38];
  URL = self->_URL;
  v36[0] = MEMORY[0x263EF8330];
  v36[1] = 3221225472;
  v36[2] = __21__CSLPRFApp_isEqual___block_invoke_7;
  v36[3] = &unk_264A0BBC8;
  id v25 = v22;
  id v37 = v25;
  id v26 = (id)[v5 appendObject:URL counterpart:v36];
  bbSectionInfo = self->_bbSectionInfo;
  uint64_t v31 = MEMORY[0x263EF8330];
  uint64_t v32 = 3221225472;
  v33 = __21__CSLPRFApp_isEqual___block_invoke_8;
  v34 = &unk_264A0BBC8;
  id v35 = v25;
  id v28 = v25;
  id v29 = (id)[v5 appendObject:bbSectionInfo counterpart:&v31];
  LOBYTE(v25) = objc_msgSend(v5, "isEqual", v31, v32, v33, v34);

  return (char)v25;
}

uint64_t __21__CSLPRFApp_isEqual___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) localizedName];
}

uint64_t __21__CSLPRFApp_isEqual___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) bundleIdentifier];
}

uint64_t __21__CSLPRFApp_isEqual___block_invoke_3(uint64_t a1)
{
  return [*(id *)(a1 + 32) SDKVersion];
}

uint64_t __21__CSLPRFApp_isEqual___block_invoke_4(uint64_t a1)
{
  return [*(id *)(a1 + 32) supportsAlwaysOnDisplay];
}

uint64_t __21__CSLPRFApp_isEqual___block_invoke_5(uint64_t a1)
{
  return [*(id *)(a1 + 32) defaultsToPrivateAlwaysOnDisplayTreatment];
}

uint64_t __21__CSLPRFApp_isEqual___block_invoke_6(uint64_t a1)
{
  return [*(id *)(a1 + 32) isLocal];
}

uint64_t __21__CSLPRFApp_isEqual___block_invoke_7(uint64_t a1)
{
  return [*(id *)(a1 + 32) URL];
}

uint64_t __21__CSLPRFApp_isEqual___block_invoke_8(uint64_t a1)
{
  return [*(id *)(a1 + 32) bbSectionInfo];
}

- (NSString)description
{
  v3 = [MEMORY[0x263F29C40] builderWithObject:self];
  id v4 = (id)[v3 appendObject:self->_localizedName withName:@"name"];
  id v5 = (id)[v3 appendObject:self->_bundleIdentifier withName:@"bundleID"];
  id v6 = (id)[v3 appendObject:self->_SDKVersion withName:@"sdk"];
  id v7 = (id)[v3 appendBool:self->_supportsAlwaysOnDisplay withName:@"supportsAlwaysOn"];
  id v8 = (id)[v3 appendBool:self->_defaultsToPrivateAlwaysOnDisplayTreatment withName:@"privateByDefault"];
  id v9 = (id)[v3 appendBool:self->_local withName:@"local" ifEqualTo:1];
  id v10 = (id)[v3 appendBool:self->_isBBSourcedApplication withName:@"bbSourced" ifEqualTo:1];
  id v11 = [v3 build];

  return (NSString *)v11;
}

- (BOOL)supportsSmartStack
{
  v23[3] = *MEMORY[0x263EF8340];
  v3 = [(CSLPRFApp *)self unionedBackgroundModes];
  v23[0] = @"com.apple.Fitness";
  v23[1] = @"com.apple.Bridge";
  v23[2] = @"com.apple.NanoNowPlaying";
  id v4 = [MEMORY[0x263EFF8C0] arrayWithObjects:v23 count:3];
  id v5 = [(CSLPRFApp *)self bundleIdentifier];
  char v6 = [v4 containsObject:v5];

  if (v6)
  {
    char v7 = 0;
  }
  else
  {
    v22[0] = @"com.apple.NanoCompass.watchkitapp";
    v22[1] = @"com.apple.NanoAlarm";
    v22[2] = @"com.apple.NanoPassbook";
    v22[3] = @"com.apple.VoiceMemos";
    v22[4] = @"com.apple.nanomusicrecognition";
    v22[5] = @"com.apple.NanoNowPlaying";
    v22[6] = @"com.apple.NanoStopwatch";
    v22[7] = @"com.apple.Mind";
    v22[8] = @"com.apple.private.NanoTimer";
    v22[9] = @"com.apple.NanoAllMusicApps";
    v22[10] = @"com.apple.NanoAllWorkoutApps";
    id v8 = [MEMORY[0x263EFF8C0] arrayWithObjects:v22 count:11];
    id v9 = [(CSLPRFApp *)self bundleIdentifier];
    LOBYTE(v10) = [v8 containsObject:v9];

    if (v3 && (v10 & 1) == 0)
    {
      if (supportsSmartStack_onceToken != -1) {
        dispatch_once(&supportsSmartStack_onceToken, &__block_literal_global_1143);
      }
      long long v19 = 0u;
      long long v20 = 0u;
      long long v17 = 0u;
      long long v18 = 0u;
      id v11 = v3;
      uint64_t v10 = [v11 countByEnumeratingWithState:&v17 objects:v21 count:16];
      if (v10)
      {
        uint64_t v12 = *(void *)v18;
        while (2)
        {
          for (uint64_t i = 0; i != v10; ++i)
          {
            if (*(void *)v18 != v12) {
              objc_enumerationMutation(v11);
            }
            if (objc_msgSend((id)supportsSmartStack___sessionCapableBackgroundModes, "containsObject:", *(void *)(*((void *)&v17 + 1) + 8 * i), (void)v17))
            {
              LOBYTE(v10) = 1;
              goto LABEL_17;
            }
          }
          uint64_t v10 = [v11 countByEnumeratingWithState:&v17 objects:v21 count:16];
          if (v10) {
            continue;
          }
          break;
        }
      }
LABEL_17:
    }
    id v14 = [(CSLPRFApp *)self applicationRecord];
    char v15 = [v14 supportsLiveActivities];

    char v7 = v10 | v15;
  }

  return v7;
}

void __31__CSLPRFApp_supportsSmartStack__block_invoke()
{
  v4[1] = *MEMORY[0x263EF8340];
  v0 = (void *)MEMORY[0x263EFFA08];
  v4[0] = @"physical-therapy";
  v1 = [MEMORY[0x263EFF8C0] arrayWithObjects:v4 count:1];
  uint64_t v2 = [v0 setWithArray:v1];
  v3 = (void *)supportsSmartStack___sessionCapableBackgroundModes;
  supportsSmartStack___sessionCapableBackgroundModes = v2;
}

- (NSMutableArray)unionedBackgroundModes
{
  v3 = [MEMORY[0x263EFF980] array];
  id v4 = [(CSLPRFApp *)self applicationRecord];
  id v5 = [v4 UIBackgroundModes];
  [v3 addObjectsFromArray:v5];

  SEL v6 = NSSelectorFromString(&cfstr_Uibackgroundmo.isa);
  char v7 = [(ACXRemoteApplication *)self->_remoteApplicationRecord backgroundModes];
  [v3 addObjectsFromArray:v7];

  id v8 = [(CSLPRFApp *)self remoteApplicationRecord];
  char v9 = objc_opt_respondsToSelector();

  if (v9) {
    objc_msgSend(v3, "addObjectsFromArray:", -[ACXRemoteApplication performSelector:](self->_remoteApplicationRecord, "performSelector:", v6));
  }
  return (NSMutableArray *)v3;
}

- (int64_t)compare:(id)a3
{
  id v4 = a3;
  id v5 = [(CSLPRFApp *)self localizedName];
  SEL v6 = [v4 localizedName];
  int64_t v7 = [v5 compare:v6 options:1];

  if (!v7)
  {
    id v8 = [(CSLPRFApp *)self bundleIdentifier];
    char v9 = [v4 bundleIdentifier];
    int64_t v7 = [v8 compare:v9 options:1];
  }
  return v7;
}

- (CSLPRFApp)initWithBundleIdentifier:(id)a3 localizedName:(id)a4 sdkVersion:(id)a5 supportsAlwaysOnDisplay:(BOOL)a6 defaultsToPrivateAlwaysOnDisplayTreatment:(BOOL)a7 applicationRecord:(id)a8 remoteApplicationRecord:(id)a9 bbSectionInfo:(id)a10
{
  uint64_t v54 = *MEMORY[0x263EF8340];
  id v47 = a3;
  id v16 = a4;
  id v17 = a5;
  id v18 = a8;
  id v19 = a9;
  id v20 = a10;
  v49.receiver = self;
  v49.super_class = (Class)CSLPRFApp;
  v21 = [(CSLPRFApp *)&v49 init];
  id v22 = v21;
  if (!v21) {
    goto LABEL_14;
  }
  v21->_lock._os_unfair_lock_opaque = 0;
  uint64_t v23 = [v47 copy];
  bundleIdentifier = v22->_bundleIdentifier;
  v22->_bundleIdentifier = (NSString *)v23;

  uint64_t v25 = [v16 copy];
  localizedName = v22->_localizedName;
  v22->_localizedName = (NSString *)v25;

  uint64_t v27 = [v17 copy];
  SDKVersion = v22->_SDKVersion;
  v22->_SDKVersion = (NSString *)v27;

  v22->_BOOL supportsAlwaysOnDisplay = a6;
  v22->_BOOL defaultsToPrivateAlwaysOnDisplayTreatment = a7;
  if (v18)
  {
    v22->_BOOL local = 1;
    objc_storeWeak((id *)&v22->_lock_applicationRecord, v18);
    uint64_t v29 = [v18 URL];
    URL = v22->_URL;
    v22->_URL = (NSURL *)v29;

    uint64_t v31 = [v18 counterpartIdentifiers];
    uint64_t v32 = [v31 copy];
    counterpartIdentifiers = v22->_counterpartIdentifiers;
    v22->_counterpartIdentifiers = (NSArray *)v32;

    v34 = [v18 applicationState];
    if ([v34 isInstalled])
    {
      v22->_isRemovedSystemApp = 0;
    }
    else
    {
      id v35 = [v18 applicationState];
      v22->_isRemovedSystemApp = [v35 isPlaceholder] ^ 1;
    }
  }
  objc_storeStrong((id *)&v22->_remoteApplicationRecord, a9);
  v36 = [(CSLPRFApp *)v22 applicationRecord];
  if (!v36)
  {
    if (v22->_remoteApplicationRecord) {
      goto LABEL_10;
    }
    v38 = [MEMORY[0x263F57730] sharedInstance];
    v36 = [v38 getActivePairedDevice];

    id v39 = [MEMORY[0x263F24EB0] sharedDeviceConnection];
    v40 = v22->_bundleIdentifier;
    id v48 = 0;
    uint64_t v41 = [v39 applicationOnPairedDevice:v36 withBundleID:v40 error:&v48];
    id v42 = v48;
    remoteApplicationRecord = v22->_remoteApplicationRecord;
    v22->_remoteApplicationRecord = (ACXRemoteApplication *)v41;
    id v44 = v42;

    if (v44)
    {
      id v45 = cslprf_settings_log();
      if (os_log_type_enabled(v45, OS_LOG_TYPE_ERROR))
      {
        v46 = v22->_bundleIdentifier;
        *(_DWORD *)buf = 138412546;
        v51 = v46;
        __int16 v52 = 2112;
        id v53 = v44;
        _os_log_error_impl(&dword_22F4EA000, v45, OS_LOG_TYPE_ERROR, "error retrieving remote application record with bundleID:%@ error:%@", buf, 0x16u);
      }
    }
  }

LABEL_10:
  v22->_isBBSourcedApplication = v20 != 0;
  objc_storeStrong((id *)&v22->_bbSectionInfo, a10);
  if (!v19 && !v22->_local && !v22->_isBBSourcedApplication) {
    v22->_BOOL local = 1;
  }
LABEL_14:

  return v22;
}

- (CSLPRFApp)initWithBundleIdentifier:(id)a3 localizedName:(id)a4 sdkVersion:(id)a5 supportsAlwaysOnDisplay:(BOOL)a6 defaultsToPrivateAlwaysOnDisplayTreatment:(BOOL)a7 applicationRecord:(id)a8 bbSectionInfo:(id)a9
{
  return [(CSLPRFApp *)self initWithBundleIdentifier:a3 localizedName:a4 sdkVersion:a5 supportsAlwaysOnDisplay:a6 defaultsToPrivateAlwaysOnDisplayTreatment:a7 applicationRecord:a8 remoteApplicationRecord:0 bbSectionInfo:a9];
}

- (LSApplicationRecord)applicationRecord
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  id WeakRetained = objc_loadWeakRetained((id *)&self->_lock_applicationRecord);
  os_unfair_lock_unlock(p_lock);
  if (!WeakRetained)
  {
    URL = self->_URL;
    id v6 = objc_alloc(MEMORY[0x263F01878]);
    if (URL) {
      uint64_t v7 = [v6 initWithURL:self->_URL allowPlaceholder:0 error:0];
    }
    else {
      uint64_t v7 = [v6 initWithBundleIdentifier:self->_bundleIdentifier allowPlaceholder:0 error:0];
    }
    id WeakRetained = (id)v7;
    os_unfair_lock_lock(p_lock);
    objc_storeWeak((id *)&self->_lock_applicationRecord, WeakRetained);
    os_unfair_lock_unlock(p_lock);
  }
  return (LSApplicationRecord *)WeakRetained;
}

+ (id)appWithBBSectionInfo:(id)a3
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = [v4 sectionID];
  id v6 = [v4 sectionID];
  id v17 = 0;
  uint64_t v7 = (void *)[objc_alloc(MEMORY[0x263F01878]) initWithBundleIdentifier:v6 allowPlaceholder:0 error:&v17];
  id v8 = v17;
  if (v8)
  {
    char v9 = cslprf_settings_log();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412546;
      id v19 = v6;
      __int16 v20 = 2112;
      id v21 = v8;
      _os_log_error_impl(&dword_22F4EA000, v9, OS_LOG_TYPE_ERROR, "error retrieving application record with bundleID:%@ error:%@", buf, 0x16u);
    }
  }
  uint64_t v10 = [v4 displayName];

  if (v10)
  {
    uint64_t v11 = [v4 displayName];
  }
  else
  {
    if (!v7) {
      goto LABEL_10;
    }
    uint64_t v11 = [v7 localizedName];
  }
  uint64_t v12 = (void *)v11;

  id v5 = v12;
LABEL_10:
  id v13 = objc_alloc((Class)a1);
  id v14 = [v7 SDKVersion];
  char v15 = objc_msgSend(v13, "initWithBundleIdentifier:localizedName:sdkVersion:supportsAlwaysOnDisplay:defaultsToPrivateAlwaysOnDisplayTreatment:applicationRecord:bbSectionInfo:", v6, v5, v14, objc_msgSend(v7, "supportsAlwaysOnDisplay"), objc_msgSend(v7, "defaultsToPrivateAlwaysOnDisplayTreatment"), v7, v4);

  return v15;
}

+ (id)appWithApplicationRecord:(id)a3
{
  id v4 = a3;
  id v5 = objc_alloc((Class)a1);
  id v6 = [v4 bundleIdentifier];
  uint64_t v7 = [v4 localizedName];
  id v8 = [v4 SDKVersion];
  char v9 = objc_msgSend(v5, "initWithBundleIdentifier:localizedName:sdkVersion:supportsAlwaysOnDisplay:defaultsToPrivateAlwaysOnDisplayTreatment:applicationRecord:bbSectionInfo:", v6, v7, v8, objc_msgSend(v4, "supportsAlwaysOnDisplay"), objc_msgSend(v4, "defaultsToPrivateAlwaysOnDisplayTreatment"), v4, 0);

  return v9;
}

+ (id)appWithACXRemoteApplication:(id)a3
{
  id v4 = a3;
  id v5 = objc_alloc((Class)a1);
  id v6 = [v4 bundleIdentifier];
  uint64_t v7 = objc_msgSend(v4, "cslprf_displayName");
  id v8 = [v4 sdkVersion];
  char v9 = objc_msgSend(v5, "initWithBundleIdentifier:localizedName:sdkVersion:supportsAlwaysOnDisplay:defaultsToPrivateAlwaysOnDisplayTreatment:applicationRecord:remoteApplicationRecord:bbSectionInfo:", v6, v7, v8, objc_msgSend(v4, "supportsAlwaysOnDisplay"), objc_msgSend(v4, "defaultsToPrivateAlwaysOnDisplayTreatment"), 0, v4, 0);

  return v9;
}

+ (id)appWithBundleID:(id)a3 name:(id)a4 sdkVersion:(id)a5 supportsAlwaysOnDisplay:(BOOL)a6 defaultsToPrivateAlwaysOnDisplayTreatment:(BOOL)a7
{
  BOOL v7 = a7;
  BOOL v8 = a6;
  id v12 = a5;
  id v13 = a4;
  id v14 = a3;
  char v15 = (void *)[objc_alloc((Class)a1) initWithBundleIdentifier:v14 localizedName:v13 sdkVersion:v12 supportsAlwaysOnDisplay:v8 defaultsToPrivateAlwaysOnDisplayTreatment:v7 applicationRecord:0 bbSectionInfo:0];

  return v15;
}

@end