@interface HFURLComponents
+ (BOOL)isHomeAppURL:(id)a3;
+ (NSURL)aboutImproveSiriAndDictationURL;
+ (NSURL)aboutResidentDeviceURL;
+ (NSURL)homeHub2OnboardingURL;
+ (NSURL)locationPrivacyURL;
+ (NSURL)musicLoginURL;
+ (NSURL)musicPrivacyURL;
+ (NSURL)personalRequestsOptInURL;
+ (NSURL)recognizeMyVoiceOptInURL;
+ (NSURL)siriPrivacyURL;
+ (NSURLComponents)dropInURLComponents;
+ (id)_URLComponentsForDestination:(unint64_t)a3;
+ (id)_privateSettingsURLHostString:(id)a3 UUID:(id)a4 forHome:(id)a5;
+ (id)_settingsURLHostString:(id)a3 UUID:(id)a4 forHome:(id)a5;
+ (id)_settingsURLHostString:(id)a3 forHome:(id)a4;
+ (id)_settingsURLHostString:(id)a3 scheme:(id)a4 UUID:(id)a5 forHome:(id)a6;
+ (id)accessoryDetailsURLForAccessory:(id)a3 home:(id)a4;
+ (id)bridgeSettingsURLForAccessory:(id)a3 home:(id)a4;
+ (id)cameraProfileDetailsURLForCameraProfile:(id)a3 home:(id)a4;
+ (id)connectedServicesURLForAccessory:(id)a3 home:(id)a4;
+ (id)faceRecognitionSettingsURLForHome:(id)a3;
+ (id)fixSymptomURLForAccessory:(id)a3 symptom:(id)a4;
+ (id)fixSymptomURLForAccessoryWithUUID:(id)a3 symptom:(id)a4;
+ (id)homeKitObjectURLForDestination:(unint64_t)a3 secondaryDestination:(unint64_t)a4 UUID:(id)a5;
+ (id)homeKitObjectURLForDestination:(unint64_t)a3 secondaryDestination:(unint64_t)a4 UUID:(id)a5 queryItems:(id)a6;
+ (id)locksOnboardingURLForHome:(id)a3;
+ (id)networkRouterSettingsURLForHome:(id)a3;
+ (id)personalRequestsOptInURLForHomeID:(id)a3;
+ (id)roomURLForRoom:(id)a3;
+ (id)serviceDetailsURLForService:(id)a3 home:(id)a4;
+ (id)symptomFromURL:(id)a3 accessory:(id)a4;
+ (id)userLockSettingsURLForHome:(id)a3;
- (HFHomeKitDispatcher)homeKitDispatcher;
- (HFURLComponents)initWithURL:(id)a3;
- (HFURLComponents)initWithURL:(id)a3 homeKitDispatcher:(id)a4;
- (NAFuture)homeKitObjectFuture;
- (NSISO8601DateFormatter)isoDateFormatter;
- (NSURL)URL;
- (id)_homeKitIdentifier;
- (id)dateForParameter:(id)a3;
- (id)description;
- (id)valueForParameter:(id)a3;
- (unint64_t)destination;
- (unint64_t)secondaryDestination;
- (void)setIsoDateFormatter:(id)a3;
@end

@implementation HFURLComponents

+ (NSURL)aboutResidentDeviceURL
{
  id v2 = objc_alloc_init(MEMORY[0x263F08BA0]);
  [v2 setScheme:@"com.apple.Home"];
  [v2 setHost:@"aboutResidentDevice"];
  v3 = [v2 URL];

  return (NSURL *)v3;
}

+ (id)homeKitObjectURLForDestination:(unint64_t)a3 secondaryDestination:(unint64_t)a4 UUID:(id)a5 queryItems:(id)a6
{
  v23[3] = *MEMORY[0x263EF8340];
  id v11 = a5;
  id v12 = a6;
  if (a3)
  {
    if (v11) {
      goto LABEL_3;
    }
  }
  else
  {
    v21 = [MEMORY[0x263F08690] currentHandler];
    [v21 handleFailureInMethod:a2, a1, @"HFURLComponents.m", 693, @"Invalid parameter not satisfying: %@", @"primaryDestination != HFURLComponentsDestinationUnknown" object file lineNumber description];

    if (v11) {
      goto LABEL_3;
    }
  }
  v22 = [MEMORY[0x263F08690] currentHandler];
  [v22 handleFailureInMethod:a2, a1, @"HFURLComponents.m", 694, @"Invalid parameter not satisfying: %@", @"uuid != nil" object file lineNumber description];

LABEL_3:
  v13 = [a1 _URLComponentsForDestination:a3];
  if (a4 - 1 > 2) {
    v14 = @"quickControl";
  }
  else {
    v14 = off_264093368[a4 - 1];
  }
  v15 = NSString;
  v23[0] = @"/";
  v16 = [v11 UUIDString];
  v23[1] = v16;
  v23[2] = v14;
  v17 = [MEMORY[0x263EFF8C0] arrayWithObjects:v23 count:3];
  v18 = [v15 pathWithComponents:v17];
  [v13 setPath:v18];

  [v13 setQueryItems:v12];
  v19 = [v13 URL];

  return v19;
}

+ (id)homeKitObjectURLForDestination:(unint64_t)a3 secondaryDestination:(unint64_t)a4 UUID:(id)a5
{
  return (id)[a1 homeKitObjectURLForDestination:a3 secondaryDestination:a4 UUID:a5 queryItems:0];
}

+ (id)_URLComponentsForDestination:(unint64_t)a3
{
  id v4 = objc_alloc_init(MEMORY[0x263F08BA0]);
  [v4 setScheme:@"com.apple.Home"];
  v5 = @"invitation";
  switch(a3)
  {
    case 1uLL:
      goto LABEL_31;
    case 2uLL:
      v5 = @"home";
      goto LABEL_31;
    case 3uLL:
      v5 = @"room";
      goto LABEL_31;
    case 4uLL:
      v5 = @"accessory";
      goto LABEL_31;
    case 5uLL:
      v5 = @"mediaSystem";
      goto LABEL_31;
    case 6uLL:
      v5 = @"accessoryProfile";
      goto LABEL_31;
    case 7uLL:
      v5 = @"service";
      goto LABEL_31;
    case 8uLL:
      v5 = @"trigger";
      goto LABEL_31;
    case 9uLL:
      v5 = @"person";
      goto LABEL_31;
    case 0xAuLL:
      v5 = @"unknownPersonEvent";
      goto LABEL_31;
    case 0xBuLL:
      v5 = @"aboutResidentDevice";
      goto LABEL_31;
    case 0xCuLL:
      v5 = @"faceRecognitionSettings";
      goto LABEL_31;
    case 0xDuLL:
      v5 = @"networkRoutersSettings";
      goto LABEL_31;
    case 0xEuLL:
      v5 = @"firmwareUpdate";
      goto LABEL_31;
    case 0xFuLL:
      v5 = @"x-hm";
      goto LABEL_31;
    case 0x10uLL:
      v5 = @"reprovisionDevice";
      goto LABEL_31;
    case 0x11uLL:
      v5 = @"com.apple.Home.fixSymptom";
      goto LABEL_31;
    case 0x12uLL:
      [v4 setScheme:@"com.apple.Home-private"];
      v5 = @"installhomepodprofile";
      goto LABEL_31;
    case 0x13uLL:
      [v4 setScheme:@"com.apple.Home-private"];
      v5 = @"homepodSoftwareUpdate";
      goto LABEL_31;
    case 0x14uLL:
      [v4 setScheme:@"com.apple.Home-private"];
      v5 = @"homeHubUpdate";
      goto LABEL_31;
    case 0x15uLL:
      v5 = @"bridgeSettings";
      goto LABEL_31;
    case 0x16uLL:
      [v4 setScheme:@"com.apple.Home-private"];
      v5 = @"personalRequestOptIn";
      goto LABEL_31;
    case 0x17uLL:
      [v4 setScheme:@"com.apple.Home.privacy"];
      v5 = @"recognizeMyVoiceOptIn";
      goto LABEL_31;
    case 0x18uLL:
      [v4 setScheme:@"com.apple.Home-private"];
      v5 = @"userLockSettings";
      goto LABEL_31;
    case 0x19uLL:
      [v4 setScheme:@"com.apple.Home-private"];
      v5 = @"locksOnboarding";
      goto LABEL_31;
    case 0x1AuLL:
      [v4 setScheme:@"com.apple.Home-private"];
      v5 = @"locksFirmwareUpdateSetup";
      goto LABEL_31;
    case 0x1BuLL:
      [v4 setScheme:@"com.apple.Home-private"];
      v5 = @"dropIn";
      goto LABEL_31;
    case 0x1CuLL:
      [v4 setScheme:@"com.apple.Home-private"];
      v5 = @"mediaServiceDefaultAccountSettings";
      goto LABEL_31;
    case 0x1DuLL:
      [v4 setScheme:@"com.apple.Home-private"];
      v5 = @"connectedServices";
      goto LABEL_31;
    case 0x1EuLL:
      [v4 setScheme:@"com.apple.Home-private"];
      v5 = @"userDetails";
LABEL_31:
      [v4 setHost:v5];
      break;
    default:
      break;
  }
  return v4;
}

+ (NSURL)personalRequestsOptInURL
{
  id v2 = objc_alloc_init(MEMORY[0x263F08BA0]);
  [v2 setScheme:@"com.apple.Home-private"];
  [v2 setHost:@"personalRequestOptIn"];
  v3 = [v2 URL];

  return (NSURL *)v3;
}

+ (NSURL)recognizeMyVoiceOptInURL
{
  id v2 = objc_alloc_init(MEMORY[0x263F08BA0]);
  [v2 setScheme:@"com.apple.Home-private"];
  [v2 setHost:@"recognizeMyVoiceOptIn"];
  v3 = [v2 URL];

  return (NSURL *)v3;
}

+ (NSURL)siriPrivacyURL
{
  id v2 = objc_alloc_init(MEMORY[0x263F08BA0]);
  [v2 setScheme:@"com.apple.Home.privacy"];
  [v2 setHost:@"privacySiri"];
  v3 = [v2 URL];

  return (NSURL *)v3;
}

+ (NSURL)musicPrivacyURL
{
  id v2 = objc_alloc_init(MEMORY[0x263F08BA0]);
  [v2 setScheme:@"com.apple.Home.privacy"];
  [v2 setHost:@"privacyMusic"];
  v3 = [v2 URL];

  return (NSURL *)v3;
}

+ (NSURL)locationPrivacyURL
{
  id v2 = objc_alloc_init(MEMORY[0x263F08BA0]);
  [v2 setScheme:@"com.apple.Home.privacy"];
  [v2 setHost:@"privacyLocation"];
  v3 = [v2 URL];

  return (NSURL *)v3;
}

+ (NSURL)musicLoginURL
{
  id v2 = objc_alloc_init(MEMORY[0x263F08BA0]);
  [v2 setScheme:@"com.apple.Home.appleMusic"];
  v3 = [v2 URL];

  return (NSURL *)v3;
}

+ (NSURL)homeHub2OnboardingURL
{
  id v2 = objc_alloc_init(MEMORY[0x263F08BA0]);
  [v2 setScheme:@"com.apple.Home-private"];
  [v2 setHost:@"homeHubUpdate"];
  v3 = [v2 URL];

  return (NSURL *)v3;
}

+ (NSURLComponents)dropInURLComponents
{
  id v2 = objc_alloc_init(MEMORY[0x263F08BA0]);
  [v2 setScheme:@"com.apple.Home-private"];
  [v2 setHost:@"dropIn"];
  return (NSURLComponents *)v2;
}

+ (id)accessoryDetailsURLForAccessory:(id)a3 home:(id)a4
{
  v14[1] = *MEMORY[0x263EF8340];
  id v5 = a4;
  v6 = [a3 uniqueIdentifier];
  v7 = (void *)MEMORY[0x263F08BD0];
  v8 = [v5 uniqueIdentifier];

  v9 = [v8 UUIDString];
  v10 = [v7 queryItemWithName:@"HFURLComponentsHome" value:v9];
  v14[0] = v10;
  id v11 = [MEMORY[0x263EFF8C0] arrayWithObjects:v14 count:1];
  id v12 = +[HFURLComponents homeKitObjectURLForDestination:4 secondaryDestination:0 UUID:v6 queryItems:v11];

  return v12;
}

+ (id)serviceDetailsURLForService:(id)a3 home:(id)a4
{
  v14[1] = *MEMORY[0x263EF8340];
  id v5 = a4;
  v6 = [a3 uniqueIdentifier];
  v7 = (void *)MEMORY[0x263F08BD0];
  v8 = [v5 uniqueIdentifier];

  v9 = [v8 UUIDString];
  v10 = [v7 queryItemWithName:@"HFURLComponentsHome" value:v9];
  v14[0] = v10;
  id v11 = [MEMORY[0x263EFF8C0] arrayWithObjects:v14 count:1];
  id v12 = +[HFURLComponents homeKitObjectURLForDestination:7 secondaryDestination:0 UUID:v6 queryItems:v11];

  return v12;
}

+ (id)cameraProfileDetailsURLForCameraProfile:(id)a3 home:(id)a4
{
  v14[1] = *MEMORY[0x263EF8340];
  id v5 = a4;
  v6 = [a3 uniqueIdentifier];
  v7 = (void *)MEMORY[0x263F08BD0];
  v8 = [v5 uniqueIdentifier];

  v9 = [v8 UUIDString];
  v10 = [v7 queryItemWithName:@"HFURLComponentsHome" value:v9];
  v14[0] = v10;
  id v11 = [MEMORY[0x263EFF8C0] arrayWithObjects:v14 count:1];
  id v12 = +[HFURLComponents homeKitObjectURLForDestination:6 secondaryDestination:0 UUID:v6 queryItems:v11];

  return v12;
}

+ (id)bridgeSettingsURLForAccessory:(id)a3 home:(id)a4
{
  id v6 = a4;
  v7 = [a3 uniqueIdentifier];
  v8 = [a1 _settingsURLHostString:@"bridgeSettings" UUID:v7 forHome:v6];

  return v8;
}

+ (id)networkRouterSettingsURLForHome:(id)a3
{
  return (id)[a1 _settingsURLHostString:@"networkRoutersSettings" forHome:a3];
}

+ (id)faceRecognitionSettingsURLForHome:(id)a3
{
  return (id)[a1 _settingsURLHostString:@"faceRecognitionSettings" forHome:a3];
}

+ (id)userLockSettingsURLForHome:(id)a3
{
  return (id)[a1 _privateSettingsURLHostString:@"userLockSettings" UUID:0 forHome:a3];
}

+ (id)locksOnboardingURLForHome:(id)a3
{
  return (id)[a1 _privateSettingsURLHostString:@"userLockSettings" UUID:0 forHome:a3];
}

+ (id)connectedServicesURLForAccessory:(id)a3 home:(id)a4
{
  v14[1] = *MEMORY[0x263EF8340];
  id v5 = a4;
  id v6 = [a3 uniqueIdentifier];
  v7 = (void *)MEMORY[0x263F08BD0];
  v8 = [v5 uniqueIdentifier];

  v9 = [v8 UUIDString];
  v10 = [v7 queryItemWithName:@"HFURLComponentsHome" value:v9];
  v14[0] = v10;
  id v11 = [MEMORY[0x263EFF8C0] arrayWithObjects:v14 count:1];
  id v12 = +[HFURLComponents homeKitObjectURLForDestination:29 secondaryDestination:3 UUID:v6 queryItems:v11];

  return v12;
}

+ (id)personalRequestsOptInURLForHomeID:(id)a3
{
  v9[1] = *MEMORY[0x263EF8340];
  id v3 = a3;
  id v4 = objc_alloc_init(MEMORY[0x263F08BA0]);
  [v4 setScheme:@"com.apple.Home-private"];
  [v4 setHost:@"personalRequestOptIn"];
  if ([v3 length])
  {
    id v5 = [MEMORY[0x263F08BD0] queryItemWithName:@"homeId" value:v3];
    v9[0] = v5;
    id v6 = [MEMORY[0x263EFF8C0] arrayWithObjects:v9 count:1];
    [v4 setQueryItems:v6];
  }
  v7 = [v4 URL];

  return v7;
}

+ (id)roomURLForRoom:(id)a3
{
  v12[2] = *MEMORY[0x263EF8340];
  id v3 = a3;
  id v4 = +[HFURLComponents _URLComponentsForDestination:3];
  id v5 = NSString;
  v12[0] = @"/";
  id v6 = [v3 uniqueIdentifier];

  v7 = [v6 UUIDString];
  v12[1] = v7;
  v8 = [MEMORY[0x263EFF8C0] arrayWithObjects:v12 count:2];
  v9 = [v5 pathWithComponents:v8];
  [v4 setPath:v9];

  v10 = [v4 URL];

  return v10;
}

+ (id)_settingsURLHostString:(id)a3 forHome:(id)a4
{
  return (id)[a1 _settingsURLHostString:a3 UUID:0 forHome:a4];
}

+ (id)_settingsURLHostString:(id)a3 UUID:(id)a4 forHome:(id)a5
{
  return (id)[a1 _settingsURLHostString:a3 scheme:@"com.apple.Home" UUID:a4 forHome:a5];
}

+ (id)_privateSettingsURLHostString:(id)a3 UUID:(id)a4 forHome:(id)a5
{
  return (id)[a1 _settingsURLHostString:a3 scheme:@"com.apple.Home-private" UUID:a4 forHome:a5];
}

+ (id)_settingsURLHostString:(id)a3 scheme:(id)a4 UUID:(id)a5 forHome:(id)a6
{
  v27[2] = *MEMORY[0x263EF8340];
  id v9 = a5;
  id v10 = a6;
  id v11 = (objc_class *)MEMORY[0x263F08BA0];
  id v12 = a4;
  id v13 = a3;
  id v14 = objc_alloc_init(v11);
  [v14 setScheme:v12];

  [v14 setHost:v13];
  if (v9)
  {
    v15 = NSString;
    v27[0] = @"/";
    v16 = [v9 UUIDString];
    v27[1] = v16;
    v17 = [MEMORY[0x263EFF8C0] arrayWithObjects:v27 count:2];
    v18 = [v15 pathWithComponents:v17];
    [v14 setPath:v18];
  }
  v19 = (void *)MEMORY[0x263F08BD0];
  v20 = [v10 uniqueIdentifier];
  v21 = [v20 UUIDString];
  v22 = [v19 queryItemWithName:@"HFURLComponentsHome" value:v21];
  v26 = v22;
  v23 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v26 count:1];
  [v14 setQueryItems:v23];

  v24 = [v14 URL];

  return v24;
}

+ (id)fixSymptomURLForAccessory:(id)a3 symptom:(id)a4
{
  id v6 = a4;
  v7 = [a3 uniqueIdentifier];
  v8 = [a1 fixSymptomURLForAccessoryWithUUID:v7 symptom:v6];

  return v8;
}

+ (id)fixSymptomURLForAccessoryWithUUID:(id)a3 symptom:(id)a4
{
  v17[1] = *MEMORY[0x263EF8340];
  id v5 = a4;
  id v6 = a3;
  v7 = objc_opt_new();
  [v7 setScheme:@"com.apple.Home.fixSymptom"];
  v8 = [v6 UUIDString];

  id v9 = [@"/" stringByAppendingPathComponent:v8];
  [v7 setPath:v9];

  [v7 setHost:@"symptomHandler"];
  id v10 = (void *)MEMORY[0x263F08BD0];
  uint64_t v11 = [v5 type];

  id v12 = NSStringFromHMSymptomType(v11);
  id v13 = [v10 queryItemWithName:@"fixSymptom" value:v12];
  v17[0] = v13;
  id v14 = [MEMORY[0x263EFF8C0] arrayWithObjects:v17 count:1];
  [v7 setQueryItems:v14];

  v15 = [v7 URL];

  return v15;
}

+ (NSURL)aboutImproveSiriAndDictationURL
{
  id v2 = objc_alloc_init(MEMORY[0x263F08BA0]);
  [v2 setScheme:@"com.apple.Home.privacy"];
  [v2 setHost:@"aboutImproveSiriAndDictation"];
  id v3 = [v2 URL];

  return (NSURL *)v3;
}

+ (id)symptomFromURL:(id)a3 accessory:(id)a4
{
  id v5 = (objc_class *)MEMORY[0x263F08BA0];
  id v6 = a4;
  id v7 = a3;
  v8 = (void *)[[v5 alloc] initWithURL:v7 resolvingAgainstBaseURL:0];

  id v9 = [v8 queryItems];
  id v10 = objc_msgSend(v9, "na_firstObjectPassingTest:", &__block_literal_global_69);

  uint64_t v11 = [v10 value];
  uint64_t v12 = NSStringToHMSymptomType(v11);

  id v13 = [v6 symptomsHandler];

  id v14 = [v13 symptoms];
  v17[0] = MEMORY[0x263EF8330];
  v17[1] = 3221225472;
  void v17[2] = __44__HFURLComponents_symptomFromURL_accessory___block_invoke_2;
  v17[3] = &__block_descriptor_40_e19_B16__0__HMSymptom_8l;
  v17[4] = v12;
  v15 = objc_msgSend(v14, "na_firstObjectPassingTest:", v17);

  return v15;
}

uint64_t __44__HFURLComponents_symptomFromURL_accessory___block_invoke(uint64_t a1, void *a2)
{
  id v2 = [a2 name];
  uint64_t v3 = [v2 isEqualToString:@"fixSymptom"];

  return v3;
}

BOOL __44__HFURLComponents_symptomFromURL_accessory___block_invoke_2(uint64_t a1, void *a2)
{
  return [a2 type] == *(void *)(a1 + 32);
}

+ (BOOL)isHomeAppURL:(id)a3
{
  id v3 = a3;
  if (_MergedGlobals_243 != -1) {
    dispatch_once(&_MergedGlobals_243, &__block_literal_global_120);
  }
  id v4 = (id)qword_26AB2EFF8;
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __32__HFURLComponents_isHomeAppURL___block_invoke_3;
  v8[3] = &unk_26408D210;
  id v9 = v3;
  id v5 = v3;
  char v6 = objc_msgSend(v4, "na_any:", v8);

  return v6;
}

void __32__HFURLComponents_isHomeAppURL___block_invoke_2()
{
  v4[6] = *MEMORY[0x263EF8340];
  v0 = (void *)MEMORY[0x263EFFA08];
  v4[0] = @"com.apple.Home";
  v4[1] = @"com.apple.Home-private";
  v4[2] = @"X-HM";
  v4[3] = @"com.apple.Home.privacy";
  v4[4] = @"com.apple.Home.appleMusic";
  v4[5] = @"com.apple.Home.fixSymptom";
  v1 = [MEMORY[0x263EFF8C0] arrayWithObjects:v4 count:6];
  uint64_t v2 = [v0 setWithArray:v1];
  id v3 = (void *)qword_26AB2EFF8;
  qword_26AB2EFF8 = v2;
}

BOOL __32__HFURLComponents_isHomeAppURL___block_invoke_3(uint64_t a1, void *a2)
{
  uint64_t v2 = *(void **)(a1 + 32);
  id v3 = a2;
  id v4 = [v2 scheme];
  uint64_t v5 = [v3 caseInsensitiveCompare:v4];

  return v5 == 0;
}

- (HFURLComponents)initWithURL:(id)a3
{
  id v4 = a3;
  uint64_t v5 = +[HFHomeKitDispatcher sharedDispatcher];
  char v6 = [(HFURLComponents *)self initWithURL:v4 homeKitDispatcher:v5];

  return v6;
}

- (HFURLComponents)initWithURL:(id)a3 homeKitDispatcher:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)HFURLComponents;
  id v9 = [(HFURLComponents *)&v12 init];
  id v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_URL, a3);
    objc_storeStrong((id *)&v10->_homeKitDispatcher, a4);
  }

  return v10;
}

- (unint64_t)destination
{
  id v3 = [(HFURLComponents *)self URL];
  id v4 = [v3 scheme];

  if (!v4) {
    goto LABEL_5;
  }
  uint64_t v5 = [(HFURLComponents *)self URL];
  char v6 = [v5 scheme];
  uint64_t v7 = [v6 caseInsensitiveCompare:@"X-HM"];

  if (!v7) {
    return 15;
  }
  id v8 = [(HFURLComponents *)self URL];
  id v9 = [v8 scheme];
  uint64_t v10 = [v9 caseInsensitiveCompare:@"com.apple.Home.fixSymptom"];

  if (!v10) {
    return 17;
  }
  uint64_t v11 = [(HFURLComponents *)self URL];
  objc_super v12 = [v11 scheme];
  uint64_t v13 = [v12 caseInsensitiveCompare:@"com.apple.Home-private"];

  if (v13) {
    goto LABEL_5;
  }
  v71 = [(HFURLComponents *)self URL];
  v72 = [v71 host];
  if (![v72 caseInsensitiveCompare:@"installhomepodprofile"])
  {

    return 18;
  }
  v73 = [(HFURLComponents *)self URL];
  v74 = [v73 host];
  v75 = [v74 uppercaseString];
  v76 = [@"installhomepodprofile&" uppercaseString];
  char v77 = [v75 hasPrefix:v76];

  if (v77) {
    return 18;
  }
  v78 = [(HFURLComponents *)self URL];
  v79 = [v78 host];
  uint64_t v80 = [v79 caseInsensitiveCompare:@"homepodSoftwareUpdate"];

  if (!v80) {
    return 19;
  }
  v81 = [(HFURLComponents *)self URL];
  v82 = [v81 host];
  uint64_t v83 = [v82 caseInsensitiveCompare:@"addAccessory"];

  if (!v83) {
    return 15;
  }
  v84 = [(HFURLComponents *)self URL];
  v85 = [v84 host];
  uint64_t v86 = [v85 caseInsensitiveCompare:@"userLockSettings"];

  if (!v86) {
    return 24;
  }
  v87 = [(HFURLComponents *)self URL];
  v88 = [v87 host];
  uint64_t v89 = [v88 caseInsensitiveCompare:@"locksOnboarding"];

  if (!v89) {
    return 25;
  }
  v90 = [(HFURLComponents *)self URL];
  v91 = [v90 host];
  uint64_t v92 = [v91 caseInsensitiveCompare:@"locksFirmwareUpdateSetup"];

  if (!v92) {
    return 26;
  }
  v93 = [(HFURLComponents *)self URL];
  v94 = [v93 host];
  uint64_t v95 = [v94 caseInsensitiveCompare:@"homeHubUpdate"];

  if (!v95) {
    return 20;
  }
  v96 = [(HFURLComponents *)self URL];
  v97 = [v96 host];
  uint64_t v98 = [v97 caseInsensitiveCompare:@"dropIn"];

  if (!v98) {
    return 27;
  }
  v99 = [(HFURLComponents *)self URL];
  v100 = [v99 host];
  uint64_t v101 = [v100 caseInsensitiveCompare:@"mediaServiceDefaultAccountSettings"];

  if (!v101) {
    return 28;
  }
  v102 = [(HFURLComponents *)self URL];
  v103 = [v102 host];
  uint64_t v104 = [v103 caseInsensitiveCompare:@"connectedServices"];

  if (!v104) {
    return 29;
  }
  v105 = [(HFURLComponents *)self URL];
  v106 = [v105 host];
  uint64_t v107 = [v106 caseInsensitiveCompare:@"userDetails"];

  if (!v107) {
    return 30;
  }
LABEL_5:
  id v14 = [(HFURLComponents *)self URL];
  v15 = [v14 host];

  if (!v15) {
    return 0;
  }
  v16 = [(HFURLComponents *)self URL];
  v17 = [v16 host];
  uint64_t v18 = [v17 caseInsensitiveCompare:@"invitation"];

  if (!v18) {
    return 1;
  }
  v19 = [(HFURLComponents *)self URL];
  v20 = [v19 host];
  uint64_t v21 = [v20 caseInsensitiveCompare:@"home"];

  if (!v21) {
    return 2;
  }
  v22 = [(HFURLComponents *)self URL];
  v23 = [v22 host];
  uint64_t v24 = [v23 caseInsensitiveCompare:@"room"];

  if (!v24) {
    return 3;
  }
  v25 = [(HFURLComponents *)self URL];
  v26 = [v25 host];
  uint64_t v27 = [v26 caseInsensitiveCompare:@"accessory"];

  if (!v27) {
    return 4;
  }
  v28 = [(HFURLComponents *)self URL];
  v29 = [v28 host];
  uint64_t v30 = [v29 caseInsensitiveCompare:@"mediaSystem"];

  if (!v30) {
    return 5;
  }
  v31 = [(HFURLComponents *)self URL];
  v32 = [v31 host];
  uint64_t v33 = [v32 caseInsensitiveCompare:@"accessoryProfile"];

  if (!v33) {
    return 6;
  }
  v34 = [(HFURLComponents *)self URL];
  v35 = [v34 host];
  uint64_t v36 = [v35 caseInsensitiveCompare:@"service"];

  if (!v36) {
    return 7;
  }
  v37 = [(HFURLComponents *)self URL];
  v38 = [v37 host];
  uint64_t v39 = [v38 caseInsensitiveCompare:@"trigger"];

  if (!v39) {
    return 8;
  }
  v40 = [(HFURLComponents *)self URL];
  v41 = [v40 host];
  uint64_t v42 = [v41 caseInsensitiveCompare:@"person"];

  if (!v42) {
    return 9;
  }
  v43 = [(HFURLComponents *)self URL];
  v44 = [v43 host];
  uint64_t v45 = [v44 caseInsensitiveCompare:@"unknownPersonEvent"];

  if (!v45) {
    return 10;
  }
  v46 = [(HFURLComponents *)self URL];
  v47 = [v46 host];
  uint64_t v48 = [v47 caseInsensitiveCompare:@"aboutResidentDevice"];

  if (!v48) {
    return 11;
  }
  v49 = [(HFURLComponents *)self URL];
  v50 = [v49 host];
  uint64_t v51 = [v50 caseInsensitiveCompare:@"faceRecognitionSettings"];

  if (!v51) {
    return 12;
  }
  v52 = [(HFURLComponents *)self URL];
  v53 = [v52 host];
  uint64_t v54 = [v53 caseInsensitiveCompare:@"networkRoutersSettings"];

  if (!v54) {
    return 13;
  }
  v55 = [(HFURLComponents *)self URL];
  v56 = [v55 host];
  uint64_t v57 = [v56 caseInsensitiveCompare:@"bridgeSettings"];

  if (!v57) {
    return 21;
  }
  v58 = [(HFURLComponents *)self URL];
  v59 = [v58 host];
  uint64_t v60 = [v59 caseInsensitiveCompare:@"firmwareUpdate"];

  if (!v60) {
    return 14;
  }
  v61 = [(HFURLComponents *)self URL];
  v62 = [v61 host];
  uint64_t v63 = [v62 caseInsensitiveCompare:@"reprovisionDevice"];

  if (!v63) {
    return 16;
  }
  v64 = [(HFURLComponents *)self URL];
  v65 = [v64 host];
  uint64_t v66 = [v65 caseInsensitiveCompare:@"personalRequestOptIn"];

  if (!v66) {
    return 22;
  }
  v67 = [(HFURLComponents *)self URL];
  v68 = [v67 host];
  uint64_t v69 = [v68 caseInsensitiveCompare:@"recognizeMyVoiceOptIn"];

  if (v69) {
    return 0;
  }
  return 23;
}

- (unint64_t)secondaryDestination
{
  uint64_t v2 = [(HFURLComponents *)self URL];
  id v3 = [v2 pathComponents];

  if ((unint64_t)[v3 count] < 3) {
    goto LABEL_6;
  }
  id v4 = [v3 objectAtIndexedSubscript:2];
  char v5 = [v4 isEqualToString:@"quickControl"];

  if (v5) {
    goto LABEL_6;
  }
  char v6 = [v3 objectAtIndexedSubscript:2];
  char v7 = [v6 isEqualToString:@"detailsAction"];

  if ((v7 & 1) == 0)
  {
    unint64_t v8 = 2;
    id v9 = [v3 objectAtIndexedSubscript:2];
    char v10 = [v9 isEqualToString:@"alternateAction"];

    if (v10) {
      goto LABEL_7;
    }
LABEL_6:
    unint64_t v8 = 0;
    goto LABEL_7;
  }
  unint64_t v8 = 1;
LABEL_7:

  return v8;
}

- (NAFuture)homeKitObjectFuture
{
  objc_initWeak(&location, self);
  id v3 = [(HFURLComponents *)self homeKitDispatcher];
  id v4 = [v3 allHomesFuture];
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __38__HFURLComponents_homeKitObjectFuture__block_invoke;
  v7[3] = &unk_26408F468;
  objc_copyWeak(&v8, &location);
  char v5 = [v4 flatMap:v7];
  objc_destroyWeak(&v8);

  objc_destroyWeak(&location);
  return (NAFuture *)v5;
}

id __38__HFURLComponents_homeKitObjectFuture__block_invoke(uint64_t a1, void *a2)
{
  v76[1] = *MEMORY[0x263EF8340];
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  char v5 = [WeakRetained homeKitDispatcher];
  char v6 = [v5 homeManager];
  id v7 = objc_alloc(MEMORY[0x263F08C38]);
  id v8 = [WeakRetained valueForParameter:@"HFURLComponentsHome"];
  id v9 = (void *)[v7 initWithUUIDString:v8];
  char v10 = objc_msgSend(v6, "hf_homeWithIdentifier:", v9);

  uint64_t v11 = [WeakRetained destination];
  if (v11 == 10)
  {
    if (v10)
    {
      id v13 = v10;
    }
    else
    {
      v41 = +[HFHomeKitDispatcher sharedDispatcher];
      id v13 = [v41 home];
    }
    id v42 = objc_alloc(MEMORY[0x263F08C38]);
    v43 = [WeakRetained valueForParameter:@"HFURLComponentsCameraProfile"];
    v44 = (void *)[v42 initWithUUIDString:v43];
    uint64_t v45 = objc_msgSend(v13, "hf_cameraProfileWithIdentifier:", v44);

    v46 = [WeakRetained _homeKitIdentifier];
    uint64_t v33 = objc_msgSend(v45, "hf_significantEventWithIdentifier:", v46);

    goto LABEL_53;
  }
  uint64_t v12 = v11;
  if (v11 == 9)
  {
    if (v10)
    {
      id v13 = v10;
    }
    else
    {
      v34 = +[HFHomeKitDispatcher sharedDispatcher];
      id v13 = [v34 home];
    }
    id v35 = objc_alloc(MEMORY[0x263F08C38]);
    uint64_t v36 = [WeakRetained valueForParameter:@"HFURLComponentsPersonManager"];
    v37 = (void *)[v35 initWithUUIDString:v36];
    v38 = objc_msgSend(v13, "hf_personManagerWithIdentifier:", v37);
    uint64_t v39 = v38;
    if (v38)
    {
      id v40 = v38;
    }
    else
    {
      id v40 = [v13 personManager];
    }
    id v47 = v40;

    uint64_t v48 = [WeakRetained _homeKitIdentifier];
    uint64_t v33 = objc_msgSend(v47, "hf_personWithIdentifier:", v48);

LABEL_52:
    goto LABEL_53;
  }
  id v13 = objc_alloc_init(MEMORY[0x263EFF9C0]);
  if (v12 == 27)
  {
    if (v10)
    {
      id v47 = v10;
    }
    else
    {
      uint64_t v54 = +[HFHomeKitDispatcher sharedDispatcher];
      id v47 = [v54 home];
    }
    id v55 = objc_alloc(MEMORY[0x263F08C38]);
    v56 = [WeakRetained valueForParameter:@"accessoryId"];
    uint64_t v57 = (void *)[v55 initWithUUIDString:v56];
    v58 = objc_msgSend(v47, "hf_accessoryWithIdentifier:", v57);

    uint64_t v33 = [MEMORY[0x263F58190] futureWithResult:v58];

    goto LABEL_52;
  }
  uint64_t v14 = v12 - 1;
  if (!v14)
  {
    v15 = [WeakRetained homeKitDispatcher];
    v16 = [v15 homeManager];
    v17 = [v16 incomingHomeInvitations];
    [v13 addObjectsFromArray:v17];
  }
  uint64_t v60 = v10;
  v61 = WeakRetained;
  if (v10)
  {
    v76[0] = v10;
    uint64_t v18 = [MEMORY[0x263EFF8C0] arrayWithObjects:v76 count:1];

    id v3 = (id)v18;
  }
  long long v70 = 0u;
  long long v71 = 0u;
  long long v68 = 0u;
  long long v69 = 0u;
  id v3 = v3;
  uint64_t v19 = [v3 countByEnumeratingWithState:&v68 objects:v75 count:16];
  id v62 = v3;
  if (v19)
  {
    uint64_t v20 = v19;
    uint64_t v21 = *(void *)v69;
    do
    {
      for (uint64_t i = 0; i != v20; ++i)
      {
        if (*(void *)v69 != v21) {
          objc_enumerationMutation(v3);
        }
        v23 = *(void **)(*((void *)&v68 + 1) + 8 * i);
        switch(v14)
        {
          case 0:
            uint64_t v24 = [*(id *)(*((void *)&v68 + 1) + 8 * i) outgoingInvitations];
            goto LABEL_34;
          case 1:
          case 13:
          case 18:
          case 19:
          case 23:
          case 24:
          case 25:
          case 27:
            [v13 addObject:v23];
            continue;
          case 2:
            uint64_t v24 = objc_msgSend(*(id *)(*((void *)&v68 + 1) + 8 * i), "hf_allRooms");
            goto LABEL_34;
          case 3:
          case 16:
          case 28:
            uint64_t v24 = [*(id *)(*((void *)&v68 + 1) + 8 * i) accessories];
            goto LABEL_34;
          case 4:
            uint64_t v24 = [*(id *)(*((void *)&v68 + 1) + 8 * i) mediaSystems];
            goto LABEL_34;
          case 5:
            long long v66 = 0u;
            long long v67 = 0u;
            long long v64 = 0u;
            long long v65 = 0u;
            v25 = [v23 accessories];
            uint64_t v26 = [v25 countByEnumeratingWithState:&v64 objects:v74 count:16];
            if (v26)
            {
              uint64_t v27 = v26;
              uint64_t v28 = *(void *)v65;
              do
              {
                for (uint64_t j = 0; j != v27; ++j)
                {
                  if (*(void *)v65 != v28) {
                    objc_enumerationMutation(v25);
                  }
                  uint64_t v30 = objc_msgSend(*(id *)(*((void *)&v64 + 1) + 8 * j), "cameraProfiles", v60);
                  [v13 addObjectsFromArray:v30];
                }
                uint64_t v27 = [v25 countByEnumeratingWithState:&v64 objects:v74 count:16];
              }
              while (v27);
            }

            id v3 = v62;
            continue;
          case 6:
            uint64_t v24 = objc_msgSend(*(id *)(*((void *)&v68 + 1) + 8 * i), "hf_allServices");
            goto LABEL_34;
          case 7:
            uint64_t v24 = [*(id *)(*((void *)&v68 + 1) + 8 * i) triggers];
            goto LABEL_34;
          case 20:
            uint64_t v24 = objc_msgSend(*(id *)(*((void *)&v68 + 1) + 8 * i), "hf_allBridgeAccessories");
LABEL_34:
            v31 = (void *)v24;
            objc_msgSend(v13, "addObjectsFromArray:", v24, v60);

            break;
          default:
            continue;
        }
      }
      uint64_t v20 = [v3 countByEnumeratingWithState:&v68 objects:v75 count:16];
    }
    while (v20);
  }

  v63[0] = MEMORY[0x263EF8330];
  v63[1] = 3221225472;
  v63[2] = __38__HFURLComponents_homeKitObjectFuture__block_invoke_2;
  v63[3] = &unk_264091DC0;
  id WeakRetained = v61;
  v63[4] = v61;
  v32 = objc_msgSend(v13, "na_firstObjectPassingTest:", v63);
  if (v32)
  {
    uint64_t v33 = [MEMORY[0x263F58190] futureWithResult:v32];
  }
  else
  {
    v49 = (void *)MEMORY[0x263F087E8];
    uint64_t v50 = *MEMORY[0x263F08570];
    uint64_t v72 = *MEMORY[0x263F08578];
    uint64_t v51 = [v61 URL];
    v73 = v51;
    v52 = [NSDictionary dictionaryWithObjects:&v73 forKeys:&v72 count:1];
    v53 = [v49 errorWithDomain:v50 code:-1000 userInfo:v52];

    id v3 = v62;
    uint64_t v33 = [MEMORY[0x263F58190] futureWithError:v53];
  }
  char v10 = v60;
LABEL_53:

  return v33;
}

uint64_t __38__HFURLComponents_homeKitObjectFuture__block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = [a2 uniqueIdentifier];
  id v4 = [*(id *)(a1 + 32) _homeKitIdentifier];
  uint64_t v5 = [v3 isEqual:v4];

  return v5;
}

__CFString *__87__HFURLComponents_homeKitObjectURLForDestination_secondaryDestination_UUID_queryItems___block_invoke(uint64_t a1)
{
  unint64_t v1 = *(void *)(a1 + 32) - 1;
  if (v1 > 2) {
    return @"quickControl";
  }
  else {
    return off_264093368[v1];
  }
}

- (id)description
{
  id v3 = [MEMORY[0x263F58188] builderWithObject:self];
  id v4 = [(HFURLComponents *)self URL];
  id v5 = (id)[v3 appendObject:v4 withName:@"url"];

  id v6 = (id)objc_msgSend(v3, "appendUnsignedInteger:withName:", -[HFURLComponents destination](self, "destination"), @"destination");
  id v7 = (id)objc_msgSend(v3, "appendUnsignedInteger:withName:", -[HFURLComponents secondaryDestination](self, "secondaryDestination"), @"secondaryDestination");
  id v8 = [v3 build];

  return v8;
}

- (id)valueForParameter:(id)a3
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  id v4 = a3;
  if ([v4 length])
  {
    id v5 = (void *)MEMORY[0x263F08BA0];
    id v6 = [(HFURLComponents *)self URL];
    id v7 = [v6 absoluteString];
    id v8 = [v5 componentsWithString:v7];

    id v9 = [v8 queryItems];
    v13[0] = MEMORY[0x263EF8330];
    v13[1] = 3221225472;
    v13[2] = __37__HFURLComponents_valueForParameter___block_invoke;
    v13[3] = &unk_264093348;
    id v14 = v4;
    char v10 = objc_msgSend(v9, "na_firstObjectPassingTest:", v13);

    uint64_t v11 = [v10 value];
  }
  else
  {
    id v8 = HFLogForCategory(0);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 136315138;
      v16 = "-[HFURLComponents valueForParameter:]";
      _os_log_debug_impl(&dword_20B986000, v8, OS_LOG_TYPE_DEBUG, "(%s) parameter.length = 0", buf, 0xCu);
    }
    uint64_t v11 = 0;
  }

  return v11;
}

uint64_t __37__HFURLComponents_valueForParameter___block_invoke(uint64_t a1, void *a2)
{
  id v3 = [a2 name];
  uint64_t v4 = [v3 isEqualToString:*(void *)(a1 + 32)];

  return v4;
}

- (id)dateForParameter:(id)a3
{
  uint64_t v4 = [(HFURLComponents *)self valueForParameter:a3];
  if (v4)
  {
    id v5 = [(HFURLComponents *)self isoDateFormatter];
    id v6 = [v5 dateFromString:v4];
  }
  else
  {
    id v6 = 0;
  }

  return v6;
}

- (NSISO8601DateFormatter)isoDateFormatter
{
  p_isoDateFormatter = &self->_isoDateFormatter;
  isoDateFormatter = self->_isoDateFormatter;
  if (isoDateFormatter)
  {
    uint64_t v4 = isoDateFormatter;
  }
  else
  {
    uint64_t v4 = (NSISO8601DateFormatter *)objc_alloc_init(MEMORY[0x263F088C0]);
    [(NSISO8601DateFormatter *)v4 setFormatOptions:3955];
    objc_storeStrong((id *)p_isoDateFormatter, v4);
  }
  return v4;
}

- (id)_homeKitIdentifier
{
  id v3 = [(HFURLComponents *)self URL];
  uint64_t v4 = [v3 pathComponents];
  unint64_t v5 = [v4 count];

  if (v5 < 2)
  {
    char v10 = 0;
  }
  else
  {
    id v6 = objc_alloc(MEMORY[0x263F08C38]);
    id v7 = [(HFURLComponents *)self URL];
    id v8 = [v7 pathComponents];
    id v9 = [v8 objectAtIndexedSubscript:1];
    char v10 = (void *)[v6 initWithUUIDString:v9];
  }
  return v10;
}

- (NSURL)URL
{
  return self->_URL;
}

- (HFHomeKitDispatcher)homeKitDispatcher
{
  return self->_homeKitDispatcher;
}

- (void)setIsoDateFormatter:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_isoDateFormatter, 0);
  objc_storeStrong((id *)&self->_homeKitDispatcher, 0);
  objc_storeStrong((id *)&self->_URL, 0);
}

@end