@interface ADCoreSettings
+ (id)sharedInstance;
- (ACAccount)iCloudAccount;
- (ACAccount)iTunesStoreAccount;
- (ADCoreSettings)init;
- (BOOL)educationModeEnabled;
- (BOOL)isAccountRestricted;
- (BOOL)isManagedAppleID;
- (BOOL)isManagediCloudAccount;
- (BOOL)isManagediTunesAccount;
- (BOOL)isPersonalizedAdsEnabled;
- (BOOL)isRestrictedByScreenTime;
- (BOOL)isRestrictedRegion;
- (BOOL)purpleBuddyWillRun;
- (BOOL)unitTesting;
- (NSString)bundleIdentifier;
- (NSString)customJinglePayload;
- (NSString)deviceModel;
- (NSString)iCloudAccountIdentifier;
- (NSString)iCloudDSID;
- (NSString)iTunesAccountDSID;
- (NSString)iTunesStorefront;
- (NSString)localeIdentifier;
- (NSString)longBuildVersion;
- (NSString)osIdentifier;
- (NSString)osVersionAndBuild;
- (NSString)shortBuildVersion;
- (NSString)shortModelType;
- (NSString)storefrontLocalizationLanguage;
- (NSURL)defaultConfigurationServerURL;
- (NSURL)defaultServerURL;
- (double)NSURLConnectionTimeout;
- (double)NSURLTransactionTimeout;
- (double)adServerTimeoutInterval;
- (double)jingleTimeoutInterval;
- (float)timezone;
- (id)adprivacydBag;
- (id)deviceDescription;
- (int)connectionType;
- (int)deviceRunStateForBundleIdentifier:(id)a3;
- (int)maxSegmentSendInterval;
- (int)runState;
- (int)segmentRetrievalInterval;
- (void)reloadNoServicesRestrictions;
- (void)reloadStorefront:(id)a3;
- (void)setAdServerTimeoutInterval:(double)a3;
- (void)setBundleIdentifier:(id)a3;
- (void)setConnectionType:(int)a3;
- (void)setDefaultConfigurationServerURL:(id)a3;
- (void)setDefaultServerURL:(id)a3;
- (void)setDeviceModel:(id)a3;
- (void)setITunesStorefront:(id)a3;
- (void)setIdentifierForAdvertisingAllowed:(BOOL)a3;
- (void)setIsPersonalizedAdsEnabled:(BOOL)a3;
- (void)setJingleTimeoutInterval:(double)a3;
- (void)setLongBuildVersion:(id)a3;
- (void)setMaxSegmentSendInterval:(int)a3;
- (void)setNSURLConnectionTimeout:(double)a3;
- (void)setNSURLTransactionTimeout:(double)a3;
- (void)setOsIdentifier:(id)a3;
- (void)setOsVersionAndBuild:(id)a3;
- (void)setRunState:(int)a3;
- (void)setSegmentRetrievalInterval:(int)a3;
- (void)setShortBuildVersion:(id)a3;
- (void)setShortModelType:(id)a3;
- (void)setStorefrontLocalizationLanguage:(id)a3;
- (void)setTimezone:(float)a3;
@end

@implementation ADCoreSettings

- (NSString)bundleIdentifier
{
  return self->_bundleIdentifier;
}

- (NSString)osVersionAndBuild
{
  return self->_osVersionAndBuild;
}

- (NSString)iTunesStorefront
{
  return self->_iTunesStorefront;
}

- (NSString)deviceModel
{
  return self->_deviceModel;
}

- (BOOL)isAccountRestricted
{
  v3 = +[ADIDManager sharedInstance];
  v4 = [v3 activeDSIDRecord];

  v5 = +[ADCoreSettings sharedInstance];
  int v6 = [v5 educationModeEnabled];

  v7 = +[ADCoreSettings sharedInstance];
  int v8 = [v7 isManagedAppleID];

  int v9 = v6 | v8;
  if (!v4) {
    goto LABEL_6;
  }
  if (([v4 accountIsU13] & 1) == 0 && (objc_msgSend(v4, "accountIsU18") & 1) == 0)
  {
    v9 |= [v4 accountAgeUnknown];
LABEL_6:
    uint64_t v10 = v9 ^ 1u;
    goto LABEL_7;
  }
  uint64_t v10 = 0;
  LOBYTE(v9) = 1;
LABEL_7:
  [(ADCoreSettings *)self setIdentifierForAdvertisingAllowed:v10];

  return v9;
}

+ (id)sharedInstance
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __32__ADCoreSettings_sharedInstance__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (sharedInstance__onceToken_4 != -1) {
    dispatch_once(&sharedInstance__onceToken_4, block);
  }
  v2 = (void *)sharedInstance__instance_4;
  return v2;
}

- (void)setIdentifierForAdvertisingAllowed:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = [MEMORY[0x1E4F74230] sharedConnection];
  [v4 setBoolValue:v3 forSetting:*MEMORY[0x1E4F74088]];
}

- (BOOL)isManagedAppleID
{
  if ([(ADCoreSettings *)self isManagediTunesAccount]) {
    return 1;
  }
  return [(ADCoreSettings *)self isManagediCloudAccount];
}

- (BOOL)isManagediTunesAccount
{
  v2 = [(ADCoreSettings *)self iTunesStoreAccount];
  char v3 = objc_msgSend(v2, "ams_isManagedAppleID");

  return v3;
}

- (BOOL)educationModeEnabled
{
  v2 = [MEMORY[0x1E4FB36F8] sharedManager];
  uint64_t v3 = [v2 isSharedIPad];

  id v4 = NSString;
  v5 = [NSNumber numberWithBool:v3];
  int v6 = [v4 stringWithFormat:@"educationModeEnabled %@", v5];
  _ADLog(@"iAdSettingsLogging", v6, 0);

  return v3;
}

- (double)adServerTimeoutInterval
{
  return self->_adServerTimeoutInterval;
}

- (NSString)iTunesAccountDSID
{
  v2 = [(ADCoreSettings *)self iTunesStoreAccount];
  uint64_t v3 = objc_msgSend(v2, "ams_DSID");
  id v4 = [v3 stringValue];

  if (v4) {
    v5 = v4;
  }
  else {
    v5 = @"0";
  }
  int v6 = v5;

  return v6;
}

- (ACAccount)iTunesStoreAccount
{
  v2 = objc_msgSend(MEMORY[0x1E4F179C8], "ams_sharedAccountStore");
  uint64_t v3 = objc_msgSend(v2, "ams_activeiTunesAccount");

  return (ACAccount *)v3;
}

- (BOOL)isPersonalizedAdsEnabled
{
  if ([(ADCoreSettings *)self isRestrictedByScreenTime]) {
    return 0;
  }
  uint64_t v3 = [MEMORY[0x1E4F74230] sharedConnection];
  uint64_t v4 = *MEMORY[0x1E4F73F10];
  char v5 = [v3 isBoolSettingLockedDownByRestrictions:*MEMORY[0x1E4F73F10]];

  if ((v5 & 1) != 0 || [(ADCoreSettings *)self isAccountRestricted]) {
    return 0;
  }
  int v8 = [MEMORY[0x1E4F74230] sharedConnection];
  BOOL v6 = [v8 effectiveBoolValueForSetting:v4] == 1;

  return v6;
}

- (BOOL)isRestrictedByScreenTime
{
  v2 = (void *)CFPreferencesCopyAppValue(@"SBParentalControlsCapabilities", @"com.apple.springboard");
  char v3 = [v2 containsObject:@"advertising"];

  return v3;
}

- (BOOL)isRestrictedRegion
{
  return self->_isRestrictedRegion;
}

- (BOOL)isManagediCloudAccount
{
  v2 = [(ADCoreSettings *)self iCloudAccount];
  char v3 = objc_msgSend(v2, "ams_isManagedAppleID");

  return v3;
}

- (ACAccount)iCloudAccount
{
  v2 = objc_msgSend(MEMORY[0x1E4F179C8], "ams_sharedAccountStore");
  char v3 = objc_msgSend(v2, "ams_activeiCloudAccount");

  return (ACAccount *)v3;
}

- (NSURL)defaultConfigurationServerURL
{
  id v2 = objc_alloc(MEMORY[0x1E4F1CB10]);
  char v3 = +[ADCoreDefaults sharedInstance];
  uint64_t v4 = [v3 stringForKey:@"ConfigurationAdServerURL"];
  char v5 = (void *)[v2 initWithString:v4];

  return (NSURL *)v5;
}

uint64_t __32__ADCoreSettings_sharedInstance__block_invoke()
{
  sharedInstance__instance_4 = (uint64_t)objc_alloc_init((Class)objc_opt_class());
  return MEMORY[0x1F41817F8]();
}

- (void)reloadNoServicesRestrictions
{
  char v3 = [(ADCoreSettings *)self adprivacydBag];
  uint64_t v4 = [(ADCoreSettings *)self iTunesStoreAccount];
  char v5 = objc_msgSend(v4, "ams_isInRestrictedRegionWithBag:waitForSync:", v3, 0);
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __46__ADCoreSettings_reloadNoServicesRestrictions__block_invoke;
  v6[3] = &unk_1E68A0B80;
  v6[4] = self;
  [v5 addFinishBlock:v6];
}

- (ADCoreSettings)init
{
  v19.receiver = self;
  v19.super_class = (Class)ADCoreSettings;
  id v2 = [(ADCoreSettings *)&v19 init];
  if (v2)
  {
    char v3 = [MEMORY[0x1E4F28F80] processInfo];
    uint64_t v4 = [v3 operatingSystemVersionString];
    osVersionAndBuild = v2->_osVersionAndBuild;
    v2->_osVersionAndBuild = (NSString *)v4;

    v2->_runState = 1;
    uint64_t v6 = [(ADCoreSettings *)v2 deviceDescription];
    deviceModel = v2->_deviceModel;
    v2->_deviceModel = (NSString *)v6;

    iTunesStorefront = v2->_iTunesStorefront;
    v2->_iTunesStorefront = (NSString *)@"NONE";

    int v9 = [(ADCoreSettings *)v2 iTunesStoreAccount];
    uint64_t v10 = [(ADCoreSettings *)v2 adprivacydBag];
    v11 = objc_msgSend(v9, "ams_isInRestrictedRegionWithBag:waitForSync:", v10, 0);
    v17[0] = MEMORY[0x1E4F143A8];
    v17[1] = 3221225472;
    v17[2] = __22__ADCoreSettings_init__block_invoke;
    v17[3] = &unk_1E68A0B80;
    v12 = v2;
    v18 = v12;
    [v11 addFinishBlock:v17];

    v12->_jingleTimeoutInterval = 60.0;
    v12->_adServerTimeoutInterval = 30.0;
    v12->_NSURLConnectionTimeout = 30.0;
    v12->_NSURLTransactionTimeout = 60.0;
    v13 = [MEMORY[0x1E4F28B50] mainBundle];
    uint64_t v14 = [v13 bundleIdentifier];
    bundleIdentifier = v12->_bundleIdentifier;
    v12->_bundleIdentifier = (NSString *)v14;

    if (!v12->_bundleIdentifier)
    {
      v12->_bundleIdentifier = (NSString *)@"com.apple.adplatforms.AdCore";
    }
  }
  return v2;
}

- (id)adprivacydBag
{
  if (adprivacydBag_onceToken != -1) {
    dispatch_once(&adprivacydBag_onceToken, &__block_literal_global_15);
  }
  id v2 = (void *)adprivacydBag_bag;
  return v2;
}

- (id)deviceDescription
{
  v5[1] = *MEMORY[0x1E4F143B8];
  v5[0] = 0;
  sysctlbyname("hw.machine", 0, v5, 0, 0);
  id v2 = (char *)v5 - ((v5[0] + 15) & 0xFFFFFFFFFFFFFFF0);
  sysctlbyname("hw.machine", v2, v5, 0, 0);
  char v3 = [NSString stringWithUTF8String:v2];
  return v3;
}

uint64_t __31__ADCoreSettings_adprivacydBag__block_invoke()
{
  adprivacydBag_bag = [MEMORY[0x1E4F4DBD8] bagForProfile:@"adprivacyd" profileVersion:@"1"];
  return MEMORY[0x1F41817F8]();
}

- (void)setBundleIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_bundleIdentifier, a3);
  id v5 = a3;
  int v6 = [(ADCoreSettings *)self deviceRunStateForBundleIdentifier:v5];

  self->_runState = v6;
}

- (int)deviceRunStateForBundleIdentifier:(id)a3
{
  char v3 = [MEMORY[0x1E4F223C8] bundleRecordWithBundleIdentifier:a3 allowPlaceholder:0 error:0];
  uint64_t v4 = [v3 signerIdentity];
  id v5 = v4;
  if (v4)
  {
    [v4 rangeOfString:@"Apple iPhone OS Application Signing"];
    int v7 = v6 == 0;
  }
  else
  {
    int v7 = MGGetBoolAnswer();
  }
  if (v7) {
    int v8 = 1;
  }
  else {
    int v8 = 2;
  }

  return v8;
}

- (void)setITunesStorefront:(id)a3
{
  id v6 = a3;
  if (v6)
  {
    objc_storeStrong((id *)&self->_iTunesStorefront, a3);
  }
  else
  {
    id v5 = [NSString stringWithFormat:@"No iTunes Storefront provided. Updating Storefront information via the bag. This will incur a performance hit."];
    _ADLog(@"iAdSettingsLogging", v5, 0);

    [(ADCoreSettings *)self reloadStorefront:0];
  }
}

uint64_t __22__ADCoreSettings_init__block_invoke(uint64_t result, void *a2, uint64_t a3)
{
  if (!a3)
  {
    uint64_t v3 = result;
    result = [a2 BOOLValue];
    *(unsigned char *)(*(void *)(v3 + 32) + 8) = result;
  }
  return result;
}

- (NSString)osIdentifier
{
  return (NSString *)@"i";
}

- (NSString)longBuildVersion
{
  id v2 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"SELF MATCHES%@", @"([0-9]+)([A-Z])([0-9]{1,4})([a-z]*)"];
  uint64_t v3 = (void *)MGGetStringAnswer();
  if ([v2 evaluateWithObject:v3]) {
    id v4 = v3;
  }
  else {
    id v4 = 0;
  }

  return (NSString *)v4;
}

- (NSString)shortBuildVersion
{
  id v2 = [(ADCoreSettings *)self longBuildVersion];
  if (v2)
  {
    uint64_t v10 = 0;
    uint64_t v3 = [MEMORY[0x1E4F28FD8] regularExpressionWithPattern:@"([0-9]+)([A-Z])" options:1 error:&v10];
    uint64_t v4 = v10;
    uint64_t v5 = objc_msgSend(v3, "rangeOfFirstMatchInString:options:range:", v2, 0, 0, objc_msgSend(v2, "length"));
    if (!v4 && (v5 != 0x7FFFFFFFFFFFFFFFLL || v6 != 0))
    {
      uint64_t v8 = objc_msgSend(v2, "substringWithRange:", v5, v6);

      id v2 = (void *)v8;
    }
  }
  return (NSString *)v2;
}

- (NSString)shortModelType
{
  id v2 = [(ADCoreSettings *)self deviceModel];
  id v3 = [v2 lowercaseString];

  uint64_t v4 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"SELF MATCHES %@", @"([a-z]+)([0-9]{1,2})([,])([0-9]{1,2})"];
  if ([v4 evaluateWithObject:v3])
  {
    uint64_t v13 = 0;
    uint64_t v5 = [MEMORY[0x1E4F28FD8] regularExpressionWithPattern:@"([a-z]+)" options:1 error:&v13];
    uint64_t v6 = v13;
    uint64_t v7 = objc_msgSend(v5, "rangeOfFirstMatchInString:options:range:", v3, 0, 0, objc_msgSend(v3, "length"));
    if (!v6 && (v7 != 0x7FFFFFFFFFFFFFFFLL || v8 != 0))
    {
      uint64_t v10 = objc_msgSend(v3, "substringWithRange:", v7, v8);

      id v3 = (id)v10;
    }

    id v3 = v3;
    v11 = v3;
  }
  else
  {
    v11 = 0;
  }

  return (NSString *)v11;
}

- (NSURL)defaultServerURL
{
  id v2 = objc_alloc(MEMORY[0x1E4F1CB10]);
  id v3 = +[ADCoreDefaults sharedInstance];
  uint64_t v4 = [v3 stringForKey:@"AdServerURL"];
  uint64_t v5 = (void *)[v2 initWithString:v4];

  return (NSURL *)v5;
}

- (void)setStorefrontLocalizationLanguage:(id)a3
{
}

- (NSString)iCloudAccountIdentifier
{
  id v2 = [(ADCoreSettings *)self iCloudAccount];
  id v3 = [v2 identifier];

  return (NSString *)v3;
}

- (NSString)iCloudDSID
{
  id v2 = [(ADCoreSettings *)self iCloudAccount];
  id v3 = objc_msgSend(v2, "ams_DSID");
  uint64_t v4 = [v3 stringValue];

  return (NSString *)v4;
}

- (NSString)customJinglePayload
{
  id v2 = +[ADCoreDefaults sharedInstance];
  id v3 = [v2 stringForKey:@"SegmentCountry"];

  uint64_t v4 = +[ADCoreDefaults sharedInstance];
  uint64_t v5 = [v4 stringForKey:@"SegmentGender"];

  uint64_t v6 = +[ADCoreDefaults sharedInstance];
  uint64_t v7 = [v6 stringForKey:@"SegmentAge"];

  uint64_t v8 = +[ADCoreDefaults sharedInstance];
  int v9 = [v8 stringForKey:@"SegmentZipCode"];

  uint64_t v10 = +[ADCoreDefaults sharedInstance];
  v11 = [v10 stringForKey:@"SegmentStorefront"];

  v12 = +[ADCoreDefaults sharedInstance];
  uint64_t v13 = [v12 stringForKey:@"SegmentAppDownload"];

  if (v3) {
    int v14 = [(__CFString *)v3 isEqualToString:&stru_1F270BEE0] ^ 1;
  }
  else {
    int v14 = 0;
  }
  v54 = v3;
  if (v5)
  {
    char v15 = [v5 isEqualToString:&stru_1F270BEE0] ^ 1;
    if (v7)
    {
LABEL_6:
      int v16 = [(__CFString *)v7 isEqualToString:&stru_1F270BEE0] ^ 1;
      goto LABEL_9;
    }
  }
  else
  {
    char v15 = 0;
    if (v7) {
      goto LABEL_6;
    }
  }
  int v16 = 0;
LABEL_9:
  v53 = v5;
  if (v9) {
    int v17 = [v9 isEqualToString:&stru_1F270BEE0] ^ 1;
  }
  else {
    LOBYTE(v17) = 0;
  }
  char v45 = v17;
  if (v11) {
    int v18 = [(__CFString *)v11 isEqualToString:&stru_1F270BEE0] ^ 1;
  }
  else {
    int v18 = 0;
  }
  int v46 = v18;
  v51 = v9;
  v52 = v7;
  v50 = v11;
  v47 = v13;
  if (v13) {
    int v19 = [v13 isEqualToString:&stru_1F270BEE0] ^ 1;
  }
  else {
    LOBYTE(v19) = 0;
  }
  id v20 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  id v21 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  [v21 setValue:@"20170429142657" forKey:@"gt"];
  v49 = v21;
  [v20 setValue:v21 forKey:@"mt"];
  id v22 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  id v23 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  [v23 setValue:@"0" forKey:@"24"];
  [v23 setValue:@"0" forKey:@"31048"];
  [v23 setValue:@"0" forKey:@"31052"];
  [v22 setValue:v23 forKey:@"sf"];
  id v24 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  [v24 setValue:@"ITC_7001,ITC_7017,ITC_7009,ITC_7015,ITC_7003,ITC_7012,ITC_7010" forKey:@"21047"];
  [v24 setValue:@"ITC_6002,ITC_6016,ITC_6014,ITC_6018,ITC_6005,ITC_6007,ITC_6009,ITC_6003,ITC_6008,ITC_6024" forKey:@"20"];
  [v22 setValue:v24 forKey:@"pr"];
  id v25 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  [v25 setValue:@"20150303" forKey:@"4"];
  [v25 setValue:@"17:0.84" forKey:@"15"];
  if (v14)
  {
    v26 = v25;
    v27 = v54;
  }
  else
  {
    v27 = @"USA";
    v26 = v25;
  }
  [v26 setValue:v27 forKey:@"48"];
  if (v15)
  {
    v28 = [NSString stringWithFormat:@"%@:0.92", v53];
    [v25 setValue:v28 forKey:@"14"];

    if (!v16)
    {
LABEL_23:
      v29 = @"1976";
      v30 = v25;
      goto LABEL_26;
    }
  }
  else
  {
    [v25 setValue:@"10:0.92" forKey:@"14"];
    if (!v16) {
      goto LABEL_23;
    }
  }
  v30 = v25;
  v29 = v52;
LABEL_26:
  [v30 setValue:v29 forKey:@"13"];
  char v31 = v19;
  if (v45)
  {
    v32 = [NSString stringWithFormat:@"%@:0.99", v9];
    [v25 setValue:v32 forKey:@"2"];
  }
  else
  {
    [v25 setValue:@"95014-2083" forKey:@"2"];
  }
  if (v46)
  {
    v33 = v25;
    v34 = v50;
  }
  else
  {
    v34 = @"143441";
    v33 = v25;
  }
  [v33 setValue:v34 forKey:@"35"];
  [v22 setValue:v25 forKey:@"dm"];
  [v20 setValue:v22 forKey:@"it"];
  id v35 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  id v36 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  [v35 setValue:v36 forKey:@"cs"];
  [v35 setValue:&unk_1F2715668 forKey:@"bl"];
  id v37 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  v38 = v37;
  v48 = v22;
  v39 = v24;
  if (v31)
  {
    v40 = v47;
    v41 = [NSString stringWithFormat:@"1:%@", v47];
    [v38 setValue:&stru_1F270BEE0 forKey:v41];
  }
  else
  {
    [v37 setValue:&stru_1F270BEE0 forKey:@"1:284910350"];
    v40 = v47;
  }
  [v35 setValue:v38 forKey:@"is"];
  [v20 setValue:v35 forKey:@"sg"];
  [v20 setValue:@"Basel-Display-v1" forKey:@"ver"];
  id v42 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  [v42 setValue:&unk_1F2715340 forKey:@"o"];
  [v20 setValue:v42 forKey:@"st"];
  v43 = objc_msgSend(v20, "AD_jsonStringWithPrettyPrint:", 0);

  return (NSString *)v43;
}

- (float)timezone
{
  id v2 = [MEMORY[0x1E4F1C9C8] date];
  id v3 = [MEMORY[0x1E4F1CAF0] systemTimeZone];
  float v4 = (float)[v3 secondsFromGMTForDate:v2] / 3600.0;

  return v4;
}

- (BOOL)purpleBuddyWillRun
{
  return MEMORY[0x1F414B088](self, a2);
}

void __46__ADCoreSettings_reloadNoServicesRestrictions__block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  if (!a3)
  {
    unsigned int v4 = [a2 BOOLValue];
    uint64_t v5 = objc_msgSend(NSString, "stringWithFormat:", @"The no services regional restriction is: %d", v4);
    _ADLog(@"iAdSettingsLogging", v5, 0);

    *(unsigned char *)(*(void *)(a1 + 32) + 8) = v4;
  }
}

- (void)reloadStorefront:(id)a3
{
  unsigned int v4 = (void (**)(void))a3;
  uint64_t v5 = (void *)MEMORY[0x1D25F33C0]();
  uint64_t v6 = [NSString stringWithFormat:@"Loading the storefront from the AMS framework."];
  _ADLog(@"iAdSettingsLogging", v6, 0);

  uint64_t v7 = [(ADCoreSettings *)self iTunesStoreAccount];
  if (!v7)
  {
    uint64_t v8 = [NSString stringWithFormat:@"No active account. Getting storefront from local account."];
    _ADLog(@"iAdSettingsLogging", v8, 0);

    int v9 = objc_msgSend(MEMORY[0x1E4F179C8], "ams_sharedAccountStore");
    uint64_t v7 = objc_msgSend(v9, "ams_localiTunesAccount");
  }
  uint64_t v10 = objc_msgSend(v7, "ams_storefront");
  v11 = v10;
  if (v10 && ([v10 isEqualToString:&stru_1F270BEE0] & 1) == 0)
  {
    [(ADCoreSettings *)self setITunesStorefront:v11];
    ADSaveToPromotedContentKeychain((uint64_t)v11, @"APIDAccountsSettings.storefront");
    int v16 = [MEMORY[0x1E4F28C40] defaultCenter];
    [v16 postNotificationName:@"kADIDManager_ChangedNotification" object:@"com.apple.AdLib"];

    if (!v4) {
      goto LABEL_7;
    }
    goto LABEL_6;
  }
  v12 = [NSString stringWithFormat:@"No storefront was found: %@. Forcing a bag fetch", v11];
  _ADLog(@"iAdSettingsLogging", v12, 16);

  [(ADCoreSettings *)self setITunesStorefront:@"NONE"];
  uint64_t v13 = [(ADCoreSettings *)self adprivacydBag];
  int v14 = [v13 URLForKey:@"partiality-segment"];
  char v15 = [v14 valuePromise];

  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __35__ADCoreSettings_reloadStorefront___block_invoke;
  v17[3] = &unk_1E68A0BA8;
  id v18 = v7;
  int v19 = self;
  [v15 addFinishBlock:v17];

  if (v4) {
LABEL_6:
  }
    v4[2](v4);
LABEL_7:
}

void __35__ADCoreSettings_reloadStorefront___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v11 = a2;
  id v5 = a3;
  if (v5)
  {
    uint64_t v6 = [NSString stringWithFormat:@"Error fetching bag with promise: %@", v5];
    _ADLog(@"iAdSettingsLogging", v6, 16);
  }
  if (v11)
  {
    uint64_t v7 = objc_msgSend(*(id *)(a1 + 32), "ams_storefront");
    uint64_t v8 = v7;
    if (v7 && ([v7 isEqualToString:&stru_1F270BEE0] & 1) == 0)
    {
      int v9 = [NSString stringWithFormat:@"Received updated storefront from forced bag fetch. Posting change notification for APIDAccounts."];
      _ADLog(@"iAdSettingsLogging", v9, 0);

      [*(id *)(a1 + 40) setITunesStorefront:v8];
      ADSaveToPromotedContentKeychain((uint64_t)v8, @"APIDAccountsSettings.storefront");
      uint64_t v10 = [MEMORY[0x1E4F28C40] defaultCenter];
      [v10 postNotificationName:@"kADIDManager_ChangedNotification" object:@"com.apple.AdLib"];
    }
  }
  else
  {
    uint64_t v8 = [NSString stringWithFormat:@"No storefront was found after forced bag fetch"];
    _ADLog(@"iAdSettingsLogging", v8, 16);
  }
}

- (void)setIsPersonalizedAdsEnabled:(BOOL)a3
{
  BOOL v3 = a3;
  if (![(ADCoreSettings *)self isRestrictedByScreenTime])
  {
    id v5 = [MEMORY[0x1E4F74230] sharedConnection];
    uint64_t v6 = *MEMORY[0x1E4F73F10];
    char v7 = [v5 isBoolSettingLockedDownByRestrictions:*MEMORY[0x1E4F73F10]];

    if ((v7 & 1) == 0 && ![(ADCoreSettings *)self isAccountRestricted])
    {
      id v8 = [MEMORY[0x1E4F74230] sharedConnection];
      [v8 setBoolValue:v3 forSetting:v6];
    }
  }
}

- (int)connectionType
{
  id v2 = +[ADNetworkController sharedNetworkController];
  int v3 = [v2 networkType];

  return v3;
}

- (NSString)localeIdentifier
{
  id v2 = [MEMORY[0x1E4F1CA20] currentLocale];
  int v3 = [v2 localeIdentifier];

  return (NSString *)v3;
}

- (int)segmentRetrievalInterval
{
  if (!MGGetBoolAnswer()
    || (+[ADCoreDefaults sharedInstance],
        id v2 = objc_claimAutoreleasedReturnValue(),
        [v2 stringForKey:@"adprivacydSegmentIntervalOverride"],
        int v3 = objc_claimAutoreleasedReturnValue(),
        int v4 = [v3 integerValue],
        v3,
        v2,
        v4 <= 0))
  {
    id v5 = +[ADCoreDefaults sharedInstance];
    uint64_t v6 = [v5 stringForKey:@"adprivacydSegmentInterval"];
    int v7 = [v6 integerValue];

    if (v7) {
      return v7;
    }
    else {
      return 86400;
    }
  }
  return v4;
}

- (void)setSegmentRetrievalInterval:(int)a3
{
  int v3 = [NSNumber numberWithInt:*(void *)&a3];
  id v5 = [v3 stringValue];

  int v4 = +[ADCoreDefaults sharedInstance];
  [v4 setString:v5 forKey:@"adprivacydSegmentInterval"];
}

- (int)maxSegmentSendInterval
{
  if (!MGGetBoolAnswer()
    || (+[ADCoreDefaults sharedInstance],
        id v2 = objc_claimAutoreleasedReturnValue(),
        [v2 stringForKey:@"adprivacydMaxSegmentSendIntervalOverride"],
        int v3 = objc_claimAutoreleasedReturnValue(),
        int v4 = [v3 integerValue],
        v3,
        v2,
        v4 <= 0))
  {
    id v5 = +[ADCoreDefaults sharedInstance];
    uint64_t v6 = [v5 stringForKey:@"adprivacydMaxSegmentSendInterval"];
    int v7 = [v6 integerValue];

    if (v7) {
      return v7;
    }
    else {
      return 259200;
    }
  }
  return v4;
}

- (void)setMaxSegmentSendInterval:(int)a3
{
  int v3 = [NSNumber numberWithInt:*(void *)&a3];
  id v5 = [v3 stringValue];

  int v4 = +[ADCoreDefaults sharedInstance];
  [v4 setString:v5 forKey:@"adprivacydMaxSegmentSendInterval"];
}

- (BOOL)unitTesting
{
  if (unitTesting_onceToken != -1) {
    dispatch_once(&unitTesting_onceToken, &__block_literal_global_276);
  }
  return unitTesting_areWeUnitTesting;
}

void __29__ADCoreSettings_unitTesting__block_invoke()
{
  if (MGGetBoolAnswer())
  {
    id v1 = [MEMORY[0x1E4F28F80] processInfo];
    v0 = [v1 arguments];
    unitTesting_areWeUnitTesting = [v0 containsObject:@"-ADUnitTestingScheme"];
  }
  else
  {
    unitTesting_areWeUnitTesting = 0;
  }
}

- (void)setDefaultServerURL:(id)a3
{
}

- (void)setDefaultConfigurationServerURL:(id)a3
{
}

- (double)jingleTimeoutInterval
{
  return self->_jingleTimeoutInterval;
}

- (void)setJingleTimeoutInterval:(double)a3
{
  self->_jingleTimeoutInterval = a3;
}

- (void)setAdServerTimeoutInterval:(double)a3
{
  self->_adServerTimeoutInterval = a3;
}

- (double)NSURLConnectionTimeout
{
  return self->_NSURLConnectionTimeout;
}

- (void)setNSURLConnectionTimeout:(double)a3
{
  self->_NSURLConnectionTimeout = a3;
}

- (double)NSURLTransactionTimeout
{
  return self->_NSURLTransactionTimeout;
}

- (void)setNSURLTransactionTimeout:(double)a3
{
  self->_NSURLTransactionTimeout = a3;
}

- (void)setOsIdentifier:(id)a3
{
}

- (void)setOsVersionAndBuild:(id)a3
{
}

- (void)setLongBuildVersion:(id)a3
{
}

- (void)setShortBuildVersion:(id)a3
{
}

- (void)setShortModelType:(id)a3
{
}

- (void)setDeviceModel:(id)a3
{
}

- (void)setConnectionType:(int)a3
{
  self->_connectionType = a3;
}

- (void)setTimezone:(float)a3
{
  self->_timezone = a3;
}

- (NSString)storefrontLocalizationLanguage
{
  return self->_storefrontLocalizationLanguage;
}

- (int)runState
{
  return self->_runState;
}

- (void)setRunState:(int)a3
{
  self->_runState = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_iTunesStorefront, 0);
  objc_storeStrong((id *)&self->_storefrontLocalizationLanguage, 0);
  objc_storeStrong((id *)&self->_bundleIdentifier, 0);
  objc_storeStrong((id *)&self->_deviceModel, 0);
  objc_storeStrong((id *)&self->_shortModelType, 0);
  objc_storeStrong((id *)&self->_shortBuildVersion, 0);
  objc_storeStrong((id *)&self->_longBuildVersion, 0);
  objc_storeStrong((id *)&self->_osVersionAndBuild, 0);
  objc_storeStrong((id *)&self->_osIdentifier, 0);
  objc_storeStrong((id *)&self->_defaultConfigurationServerURL, 0);
  objc_storeStrong((id *)&self->_defaultServerURL, 0);
}

@end