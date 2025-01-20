@interface HMAccessory(HFMediaAdditions)
- (BOOL)hf_fakeShouldDisplayManualFixOption;
- (BOOL)hf_isSiriEndpoint;
- (id)hf_fakeDebugSymptoms;
- (id)hf_identifyHomePod;
- (uint64_t)hf_fake8021xNetworkSymptom;
- (uint64_t)hf_fakeCDPSymptom;
- (uint64_t)hf_fakeCaptiveLeaseRenewalSymptom;
- (uint64_t)hf_fakeGeneralFixSymptom;
- (uint64_t)hf_fakeHardwareFixSymptom;
- (uint64_t)hf_fakeHomeKitSymptom;
- (uint64_t)hf_fakeICloudSymptom;
- (uint64_t)hf_fakeITunesSymptom;
- (uint64_t)hf_fakeInternetFixSymptom;
- (uint64_t)hf_fakeNetworkNotShareableSymptom;
- (uint64_t)hf_fakeNetworkProfileFixSymptom;
- (uint64_t)hf_fakeNetworkProfileInstallSymptom;
- (uint64_t)hf_fakeNetworkStrengthError;
- (uint64_t)hf_fakeUnreachableError;
- (uint64_t)hf_fakeVPNProfileExpired;
- (uint64_t)hf_fakeWiFiMismatchSymptom;
- (uint64_t)hf_fakeWiFiPerformanceSymptom;
- (uint64_t)hf_fakeWiFiSymptom;
- (uint64_t)hf_isAirPortExpressSpeaker;
- (uint64_t)hf_isAppleTV;
- (uint64_t)hf_isAudioReceiver;
- (uint64_t)hf_isCategorizedAsMediaAccessory;
- (uint64_t)hf_isDumbSpeaker;
- (uint64_t)hf_isHomePod;
- (uint64_t)hf_isMediaAccessory;
- (uint64_t)hf_isSpeaker;
- (uint64_t)hf_mediaAccessControlCapabilities;
- (uint64_t)hf_needsSoftwareUpdateToSupportBeingAddedToMediaSystem;
- (uint64_t)hf_setFakeCaptiveLeaseRenewalSymptom:()HFMediaAdditions;
- (uint64_t)hf_setFakeWiFiMismatchSymptom:()HFMediaAdditions;
- (uint64_t)hf_shouldDisplayManualFixOptionForSymptom:()HFMediaAdditions;
- (uint64_t)hf_shouldShowSoftwareUpdateInfo;
- (uint64_t)hf_supportsMultiUserLanguage:()HFMediaAdditions;
- (void)_pushSymptomUpdate;
@end

@implementation HMAccessory(HFMediaAdditions)

- (uint64_t)hf_isHomePod
{
  v1 = [a1 category];
  v2 = [v1 categoryType];

  uint64_t v3 = [v2 isEqualToString:*MEMORY[0x263F0B0A0]];
  return v3;
}

- (uint64_t)hf_isMediaAccessory
{
  v2 = objc_msgSend(a1, "hf_siriEndpointProfile");

  if (v2)
  {
    uint64_t v3 = [a1 category];
    int v4 = objc_msgSend(v3, "hf_isMediaAccessory");

    if (!v4) {
      return 0;
    }
  }
  v5 = [a1 mediaProfile];
  if (v5) {
    uint64_t v6 = objc_msgSend(a1, "hf_isCategorizedAsMediaAccessory");
  }
  else {
    uint64_t v6 = 0;
  }

  return v6;
}

- (uint64_t)hf_isAppleTV
{
  v1 = [a1 category];
  v2 = [v1 categoryType];

  uint64_t v3 = [v2 isEqualToString:*MEMORY[0x263F0B030]];
  return v3;
}

- (uint64_t)hf_isCategorizedAsMediaAccessory
{
  if ((objc_msgSend(a1, "hf_isHomePod") & 1) != 0
    || (objc_msgSend(a1, "hf_isAppleTV") & 1) != 0
    || (objc_msgSend(a1, "hf_isSpeaker") & 1) != 0
    || (objc_msgSend(a1, "hf_isDumbSpeaker") & 1) != 0
    || (objc_msgSend(a1, "hf_isAirPortExpressSpeaker") & 1) != 0)
  {
    return 1;
  }
  return objc_msgSend(a1, "hf_isAudioReceiver");
}

- (uint64_t)hf_isAirPortExpressSpeaker
{
  v1 = [a1 category];
  v2 = [v1 categoryType];

  uint64_t v3 = [v2 isEqualToString:*MEMORY[0x263F0B010]];
  return v3;
}

- (uint64_t)hf_isDumbSpeaker
{
  v1 = [a1 category];
  v2 = [v1 categoryType];

  uint64_t v3 = [v2 isEqualToString:*MEMORY[0x263F0B130]];
  return v3;
}

- (uint64_t)hf_isSpeaker
{
  if (objc_msgSend(a1, "hf_isDumbSpeaker")) {
    return 1;
  }
  return objc_msgSend(a1, "hf_isAirPortExpressSpeaker");
}

- (uint64_t)hf_isAudioReceiver
{
  v1 = [a1 category];
  v2 = [v1 categoryType];

  uint64_t v3 = [v2 isEqualToString:*MEMORY[0x263F0B038]];
  return v3;
}

- (BOOL)hf_isSiriEndpoint
{
  v1 = objc_msgSend(a1, "hf_siriEndpointProfile");
  BOOL v2 = v1 != 0;

  return v2;
}

- (uint64_t)hf_supportsMultiUserLanguage:()HFMediaAdditions
{
  id v4 = a3;
  if ((objc_msgSend(a1, "hf_isSiriEndpoint") & 1) != 0
    || (+[HFHomeKitDispatcher sharedDispatcher],
        v5 = objc_claimAutoreleasedReturnValue(),
        [v5 homeManager],
        uint64_t v6 = objc_claimAutoreleasedReturnValue(),
        int v7 = [v6 hasOptedToHH2],
        v6,
        v5,
        v7))
  {
    v8 = [a1 mediaProfile];
    v9 = objc_msgSend(v8, "hf_siriLanguageOptionsManager");

    v10 = [v9 selectedLanguageOption];
  }
  else
  {
    v11 = [a1 mediaProfile];
    v9 = objc_msgSend(v11, "hf_settingsAdapterManager");

    v12 = [v9 adapterForIdentifier:@"SiriLanguageAdapter"];
    objc_opt_class();
    id v13 = v12;
    if (objc_opt_isKindOfClass()) {
      v14 = v13;
    }
    else {
      v14 = 0;
    }
    id v15 = v14;

    v10 = [v15 selectedLanguageOption];
  }
  v16 = [v10 recognitionLanguage];
  uint64_t v17 = [v4 containsObject:v16];

  return v17;
}

- (uint64_t)hf_mediaAccessControlCapabilities
{
  if ([MEMORY[0x263F0E390] accessorySupportsMediaAccessControl:a1]) {
    uint64_t v2 = 5;
  }
  else {
    uint64_t v2 = 0;
  }
  if ((objc_msgSend(a1, "hf_isHomePod") & 1) != 0 || objc_msgSend(a1, "hf_isAppleTV")) {
    return v2 | 2;
  }
  return v2;
}

- (uint64_t)hf_needsSoftwareUpdateToSupportBeingAddedToMediaSystem
{
  uint64_t result = objc_msgSend(a1, "hf_isHomePod");
  if (result)
  {
    uint64_t result = [MEMORY[0x263F0E540] canSupportMediaSystem:a1];
    if (result) {
      return [MEMORY[0x263F0E540] supportsMediaSystem:a1] ^ 1;
    }
  }
  return result;
}

- (id)hf_identifyHomePod
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  uint64_t v2 = [a1 mediaProfile];
  uint64_t v3 = objc_msgSend(v2, "hf_settingsAdapterManager");
  id v4 = [v3 adapterForIdentifier:@"DeviceOptions"];

  if (v4)
  {
    v5 = HFLogForCategory(0);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v13 = v2;
      _os_log_impl(&dword_20B986000, v5, OS_LOG_TYPE_DEFAULT, "Preparing to send identify message to accessory: %@", buf, 0xCu);
    }

    uint64_t v6 = [v4 identifyAccessory];
    v10[0] = MEMORY[0x263EF8330];
    v10[1] = 3221225472;
    v10[2] = __51__HMAccessory_HFMediaAdditions__hf_identifyHomePod__block_invoke;
    v10[3] = &unk_264091218;
    id v11 = v2;
    int v7 = [v6 addCompletionBlock:v10];
  }
  else
  {
    NSLog(&cfstr_DeviceOptionsA.isa, a1);
    v8 = (void *)MEMORY[0x263F58190];
    uint64_t v6 = objc_msgSend(MEMORY[0x263F087E8], "hf_errorWithCode:", 25);
    int v7 = [v8 futureWithError:v6];
  }

  return v7;
}

- (uint64_t)hf_shouldShowSoftwareUpdateInfo
{
  uint64_t result = [a1 isControllable];
  if (result)
  {
    return objc_msgSend(a1, "hf_softwareUpdatePossessesNecessaryDocumentation");
  }
  return result;
}

- (uint64_t)hf_shouldDisplayManualFixOptionForSymptom:()HFMediaAdditions
{
  if (objc_msgSend(a1, "hf_fakeShouldDisplayManualFixOption")) {
    return 1;
  }
  if (+[HFUtilities isAMac]) {
    return 0;
  }
  uint64_t v6 = +[HFSymptomFixManager sharedManager];
  int v7 = (void *)[objc_alloc(MEMORY[0x263F0E828]) initWithType:a3];
  if (a3 <= 0x14 && ((1 << a3) & 0x100006) != 0)
  {
    BOOL v5 = 1;
  }
  else
  {
    BOOL v5 = 0;
    if (([v6 anySymptomIsBeingFixedForFixableObject:a1] & 1) == 0 && v7)
    {
      v9 = [a1 symptomsHandler];
      v10 = (void *)[v9 newFixSessionForSymptom:v7];
      BOOL v5 = v10 != 0;
    }
  }

  return v5;
}

- (uint64_t)hf_fakeUnreachableError
{
  v1 = [a1 uniqueIdentifier];
  uint64_t v2 = [v1 UUIDString];
  uint64_t v3 = HFPreferencesAccessoryValueForKey(v2, @"fakeUnreachableError");
  uint64_t v4 = [v3 BOOLValue];

  return v4;
}

- (uint64_t)hf_fakeWiFiSymptom
{
  v1 = [a1 uniqueIdentifier];
  uint64_t v2 = [v1 UUIDString];
  uint64_t v3 = HFPreferencesAccessoryValueForKey(v2, @"fakeWiFiSymptom");
  uint64_t v4 = [v3 BOOLValue];

  return v4;
}

- (uint64_t)hf_fakeWiFiPerformanceSymptom
{
  v1 = [a1 uniqueIdentifier];
  uint64_t v2 = [v1 UUIDString];
  uint64_t v3 = HFPreferencesAccessoryValueForKey(v2, @"fakeWiFiPerformanceSymptom");
  uint64_t v4 = [v3 BOOLValue];

  return v4;
}

- (uint64_t)hf_fakeInternetFixSymptom
{
  v1 = [a1 uniqueIdentifier];
  uint64_t v2 = [v1 UUIDString];
  uint64_t v3 = HFPreferencesAccessoryValueForKey(v2, @"fakeInternetFixSymptom");
  uint64_t v4 = [v3 BOOLValue];

  return v4;
}

- (uint64_t)hf_fakeHardwareFixSymptom
{
  v1 = [a1 uniqueIdentifier];
  uint64_t v2 = [v1 UUIDString];
  uint64_t v3 = HFPreferencesAccessoryValueForKey(v2, @"fakeHardwareFixSymptom");
  uint64_t v4 = [v3 BOOLValue];

  return v4;
}

- (uint64_t)hf_fakeGeneralFixSymptom
{
  v1 = [a1 uniqueIdentifier];
  uint64_t v2 = [v1 UUIDString];
  uint64_t v3 = HFPreferencesAccessoryValueForKey(v2, @"fakeGeneralFixSymptom");
  uint64_t v4 = [v3 BOOLValue];

  return v4;
}

- (uint64_t)hf_fakeHomeKitSymptom
{
  v1 = [a1 uniqueIdentifier];
  uint64_t v2 = [v1 UUIDString];
  uint64_t v3 = HFPreferencesAccessoryValueForKey(v2, @"fakeHomeKitSymptom");
  uint64_t v4 = [v3 BOOLValue];

  return v4;
}

- (uint64_t)hf_fakeICloudSymptom
{
  v1 = [a1 uniqueIdentifier];
  uint64_t v2 = [v1 UUIDString];
  uint64_t v3 = HFPreferencesAccessoryValueForKey(v2, @"fakeICloudSymptom");
  uint64_t v4 = [v3 BOOLValue];

  return v4;
}

- (uint64_t)hf_fakeITunesSymptom
{
  v1 = [a1 uniqueIdentifier];
  uint64_t v2 = [v1 UUIDString];
  uint64_t v3 = HFPreferencesAccessoryValueForKey(v2, @"fakeITunesSymptom");
  uint64_t v4 = [v3 BOOLValue];

  return v4;
}

- (uint64_t)hf_fakeCDPSymptom
{
  v1 = [a1 uniqueIdentifier];
  uint64_t v2 = [v1 UUIDString];
  uint64_t v3 = HFPreferencesAccessoryValueForKey(v2, @"fakeCDPSymptom");
  uint64_t v4 = [v3 BOOLValue];

  return v4;
}

- (BOOL)hf_fakeShouldDisplayManualFixOption
{
  v1 = objc_msgSend(a1, "hf_fakeDebugSymptoms");
  BOOL v2 = [v1 count] != 0;

  return v2;
}

- (uint64_t)hf_fakeWiFiMismatchSymptom
{
  v1 = [a1 uniqueIdentifier];
  BOOL v2 = [v1 UUIDString];
  uint64_t v3 = HFPreferencesAccessoryValueForKey(v2, @"fakeWiFiNetworkMismatchSymptom");
  uint64_t v4 = [v3 BOOLValue];

  return v4;
}

- (uint64_t)hf_setFakeWiFiMismatchSymptom:()HFMediaAdditions
{
  BOOL v5 = [a1 uniqueIdentifier];
  uint64_t v6 = [v5 UUIDString];
  int v7 = v6;
  if (a3) {
    v8 = @"YES";
  }
  else {
    v8 = 0;
  }
  HFPreferencesAccessorySetValueForKey(v6, @"fakeWiFiNetworkMismatchSymptom", v8);

  return [a1 _pushSymptomUpdate];
}

- (uint64_t)hf_fakeCaptiveLeaseRenewalSymptom
{
  v1 = [a1 uniqueIdentifier];
  BOOL v2 = [v1 UUIDString];
  uint64_t v3 = HFPreferencesAccessoryValueForKey(v2, @"fakeCaptiveLeaseRenewalSymptom");
  uint64_t v4 = [v3 BOOLValue];

  return v4;
}

- (uint64_t)hf_setFakeCaptiveLeaseRenewalSymptom:()HFMediaAdditions
{
  BOOL v5 = [a1 uniqueIdentifier];
  uint64_t v6 = [v5 UUIDString];
  int v7 = v6;
  if (a3) {
    v8 = @"YES";
  }
  else {
    v8 = 0;
  }
  HFPreferencesAccessorySetValueForKey(v6, @"fakeCaptiveLeaseRenewalSymptom", v8);

  return [a1 _pushSymptomUpdate];
}

- (uint64_t)hf_fakeVPNProfileExpired
{
  v1 = [a1 uniqueIdentifier];
  BOOL v2 = [v1 UUIDString];
  uint64_t v3 = HFPreferencesAccessoryValueForKey(v2, @"fakeVPNProfileExpiredSymptom");
  uint64_t v4 = [v3 BOOLValue];

  return v4;
}

- (uint64_t)hf_fake8021xNetworkSymptom
{
  v1 = [a1 uniqueIdentifier];
  BOOL v2 = [v1 UUIDString];
  uint64_t v3 = HFPreferencesAccessoryValueForKey(v2, @"fake8021xNetworkSymptom");
  uint64_t v4 = [v3 BOOLValue];

  return v4;
}

- (uint64_t)hf_fakeNetworkProfileFixSymptom
{
  v1 = [a1 uniqueIdentifier];
  BOOL v2 = [v1 UUIDString];
  uint64_t v3 = HFPreferencesAccessoryValueForKey(v2, @"fakeNetworkProfileFixSymptom");
  uint64_t v4 = [v3 BOOLValue];

  return v4;
}

- (uint64_t)hf_fakeNetworkProfileInstallSymptom
{
  v1 = [a1 uniqueIdentifier];
  BOOL v2 = [v1 UUIDString];
  uint64_t v3 = HFPreferencesAccessoryValueForKey(v2, @"fakeNetworkProfileInstallSymptom");
  uint64_t v4 = [v3 BOOLValue];

  return v4;
}

- (uint64_t)hf_fakeNetworkNotShareableSymptom
{
  v1 = [a1 uniqueIdentifier];
  BOOL v2 = [v1 UUIDString];
  uint64_t v3 = HFPreferencesAccessoryValueForKey(v2, @"fakeNetworkNotShareableSymptom");
  uint64_t v4 = [v3 BOOLValue];

  return v4;
}

- (uint64_t)hf_fakeNetworkStrengthError
{
  v1 = [a1 uniqueIdentifier];
  BOOL v2 = [v1 UUIDString];
  uint64_t v3 = HFPreferencesAccessoryValueForKey(v2, @"fakeNetworkStrengthError");
  uint64_t v4 = [v3 BOOLValue];

  return v4;
}

- (void)_pushSymptomUpdate
{
  v1 = [a1 symptomsHandler];
  BOOL v2 = +[HFHomeKitDispatcher sharedDispatcher];
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __51__HMAccessory_HFMediaAdditions___pushSymptomUpdate__block_invoke;
  v4[3] = &unk_264091240;
  id v5 = v1;
  id v3 = v1;
  [v2 dispatchSymptomsHandlerMessage:v4 sender:0];
}

- (id)hf_fakeDebugSymptoms
{
  BOOL v2 = objc_opt_new();
  if (objc_msgSend(a1, "hf_fakeWiFiSymptom"))
  {
    id v3 = (void *)[objc_alloc(MEMORY[0x263F0E828]) initWithType:4];
    [v2 addObject:v3];
  }
  if (objc_msgSend(a1, "hf_fakeWiFiPerformanceSymptom"))
  {
    uint64_t v4 = (void *)[objc_alloc(MEMORY[0x263F0E828]) initWithType:5];
    [v2 addObject:v4];
  }
  if (objc_msgSend(a1, "hf_fakeInternetFixSymptom"))
  {
    id v5 = (void *)[objc_alloc(MEMORY[0x263F0E828]) initWithType:6];
    [v2 addObject:v5];
  }
  if (objc_msgSend(a1, "hf_fakeHardwareFixSymptom"))
  {
    uint64_t v6 = (void *)[objc_alloc(MEMORY[0x263F0E828]) initWithType:7];
    [v2 addObject:v6];
  }
  if (objc_msgSend(a1, "hf_fakeGeneralFixSymptom"))
  {
    int v7 = (void *)[objc_alloc(MEMORY[0x263F0E828]) initWithType:999];
    [v2 addObject:v7];
  }
  if (objc_msgSend(a1, "hf_fakeHomeKitSymptom"))
  {
    v8 = (void *)[objc_alloc(MEMORY[0x263F0E828]) initWithType:3];
    [v2 addObject:v8];
  }
  if (objc_msgSend(a1, "hf_fakeITunesSymptom"))
  {
    v9 = (void *)[objc_alloc(MEMORY[0x263F0E828]) initWithType:2];
    [v2 addObject:v9];
  }
  if (objc_msgSend(a1, "hf_fakeICloudSymptom"))
  {
    v10 = (void *)[objc_alloc(MEMORY[0x263F0E828]) initWithType:1];
    [v2 addObject:v10];
  }
  if (objc_msgSend(a1, "hf_fakeCDPSymptom"))
  {
    id v11 = (void *)[objc_alloc(MEMORY[0x263F0E828]) initWithType:20];
    [v2 addObject:v11];
  }
  if (objc_msgSend(a1, "hf_fakeWiFiMismatchSymptom"))
  {
    v12 = (void *)[objc_alloc(MEMORY[0x263F0E828]) initWithType:11];
    [v2 addObject:v12];
  }
  if (objc_msgSend(a1, "hf_fakeCaptiveLeaseRenewalSymptom"))
  {
    id v13 = (void *)[objc_alloc(MEMORY[0x263F0E828]) initWithType:19];
    [v2 addObject:v13];
  }
  if (objc_msgSend(a1, "hf_fakeVPNProfileExpired"))
  {
    uint64_t v14 = (void *)[objc_alloc(MEMORY[0x263F0E828]) initWithType:13];
    [v2 addObject:v14];
  }
  if (objc_msgSend(a1, "hf_fake8021xNetworkSymptom"))
  {
    id v15 = (void *)[objc_alloc(MEMORY[0x263F0E828]) initWithType:14];
    [v2 addObject:v15];
  }
  if (objc_msgSend(a1, "hf_fakeNetworkProfileFixSymptom"))
  {
    v16 = (void *)[objc_alloc(MEMORY[0x263F0E828]) initWithType:16];
    [v2 addObject:v16];
  }
  if (objc_msgSend(a1, "hf_fakeNetworkProfileInstallSymptom"))
  {
    uint64_t v17 = (void *)[objc_alloc(MEMORY[0x263F0E828]) initWithType:17];
    [v2 addObject:v17];
  }
  if (objc_msgSend(a1, "hf_fakeNetworkNotShareableSymptom"))
  {
    v18 = (void *)[objc_alloc(MEMORY[0x263F0E828]) initWithType:18];
    [v2 addObject:v18];
  }
  objc_msgSend(v2, "na_each:", &__block_literal_global_49);
  return v2;
}

@end