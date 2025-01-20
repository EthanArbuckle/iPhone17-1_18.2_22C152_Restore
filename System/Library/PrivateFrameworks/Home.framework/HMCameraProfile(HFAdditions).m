@interface HMCameraProfile(HFAdditions)
+ (uint64_t)hf_cameraAccessModeSelectedOptionForCameraProfiles:()HFAdditions presenceType:;
- (BOOL)hf_cameraIsNotSetToRecord;
- (BOOL)hf_hasDoorbellService;
- (BOOL)hf_supportsBidirectionalAudio;
- (BOOL)hf_thermalShutdownModeActive;
- (HFCameraManager)hf_cameraManager;
- (id)hf_doorbellChimeMuteCharacteristic;
- (id)hf_doorbellNotificationBulletin;
- (id)hf_faceCropImageForSignificantEvent:()HFAdditions;
- (id)hf_significantEventWithIdentifier:()HFAdditions;
- (uint64_t)hf_shouldDisableLiveStream;
- (uint64_t)hf_supportsReachabilityNotifications;
- (uint64_t)hf_supportsRecordingEvents;
- (unint64_t)hf_thermalShutdownMode;
- (void)hf_updateDoorbellChime:()HFAdditions;
@end

@implementation HMCameraProfile(HFAdditions)

- (HFCameraManager)hf_cameraManager
{
  objc_getAssociatedObject(a1, a2);
  v4 = (HFCameraManager *)objc_claimAutoreleasedReturnValue();
  if (!v4)
  {
    v4 = [[HFCameraManager alloc] initWithCameraProfile:a1];
    objc_setAssociatedObject(a1, a2, v4, (void *)1);
  }
  return v4;
}

- (unint64_t)hf_thermalShutdownMode
{
  v1 = [a1 accessory];
  v2 = [v1 services];
  v3 = objc_msgSend(v2, "na_firstObjectPassingTest:", &__block_literal_global_81);

  if (([v3 lastKnownOperatingStateAbnormalReasons] & 2) != 0) {
    unint64_t v4 = 2;
  }
  else {
    unint64_t v4 = ((unint64_t)[v3 lastKnownOperatingStateAbnormalReasons] >> 2) & 1;
  }

  return v4;
}

- (BOOL)hf_supportsBidirectionalAudio
{
  v2 = [a1 speakerControl];
  if (v2)
  {
    v3 = [a1 microphoneControl];
    BOOL v4 = v3 != 0;
  }
  else
  {
    BOOL v4 = 0;
  }

  return v4;
}

- (uint64_t)hf_supportsRecordingEvents
{
  v1 = [a1 userSettings];
  unint64_t v2 = [v1 supportedFeatures];

  return (v2 >> 1) & 1;
}

- (uint64_t)hf_shouldDisableLiveStream
{
  if (+[HFUtilities isPressDemoModeEnabled]) {
    return 1;
  }
  BOOL v4 = [a1 userSettings];
  uint64_t v5 = [v4 currentAccessMode];

  uint64_t v3 = 1;
  if (v5 && v5 != 3)
  {
    v1 = [a1 userSettings];
    uint64_t v3 = [v1 isCameraManuallyDisabled];
  }
  if (v5 && v5 != 3) {

  }
  return v3;
}

- (BOOL)hf_thermalShutdownModeActive
{
  return objc_msgSend(a1, "hf_thermalShutdownMode") != 0;
}

- (BOOL)hf_cameraIsNotSetToRecord
{
  unint64_t v2 = [a1 userSettings];
  if ([v2 accessModeForPresenceType:3] == 2)
  {
    BOOL v3 = 0;
  }
  else
  {
    BOOL v4 = [a1 userSettings];
    BOOL v3 = [v4 accessModeForPresenceType:4] != 2;
  }
  return v3;
}

- (BOOL)hf_hasDoorbellService
{
  v1 = [a1 accessory];
  unint64_t v2 = objc_msgSend(v1, "hf_serviceOfType:", *MEMORY[0x263F0D6C0]);
  BOOL v3 = v2 != 0;

  return v3;
}

- (uint64_t)hf_supportsReachabilityNotifications
{
  uint64_t result = objc_msgSend(a1, "hf_supportsRecordingEvents");
  if (result)
  {
    BOOL v3 = [a1 accessory];
    BOOL v4 = [v3 home];
    uint64_t v5 = objc_msgSend(v4, "hf_supportsReachabilityNotifications");

    return v5;
  }
  return result;
}

- (id)hf_doorbellNotificationBulletin
{
  v1 = [a1 accessory];
  unint64_t v2 = objc_msgSend(v1, "hf_serviceOfType:", *MEMORY[0x263F0D6C0]);
  BOOL v3 = [v2 bulletinBoardNotification];

  return v3;
}

- (id)hf_doorbellChimeMuteCharacteristic
{
  uint64_t v6 = 0;
  v7 = &v6;
  uint64_t v8 = 0x3032000000;
  v9 = __Block_byref_object_copy__11;
  v10 = __Block_byref_object_dispose__11;
  id v11 = 0;
  v1 = [a1 accessory];
  unint64_t v2 = [v1 services];
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __66__HMCameraProfile_HFAdditions__hf_doorbellChimeMuteCharacteristic__block_invoke;
  v5[3] = &unk_264093E10;
  v5[4] = &v6;
  [v2 enumerateObjectsUsingBlock:v5];

  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return v3;
}

- (void)hf_updateDoorbellChime:()HFAdditions
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  uint64_t v5 = [a1 accessory];
  uint64_t v6 = [v5 home];

  v7 = objc_msgSend(a1, "hf_doorbellChimeMuteCharacteristic");
  uint64_t v8 = (void *)MEMORY[0x263EFFA88];
  if (a3) {
    uint64_t v8 = (void *)MEMORY[0x263EFFA80];
  }
  id v9 = v8;
  v10 = HFLogForCategory(0xEuLL);
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    v17[0] = 67109378;
    v17[1] = [v9 BOOLValue];
    __int16 v18 = 2112;
    v19 = v7;
    _os_log_impl(&dword_20B986000, v10, OS_LOG_TYPE_DEFAULT, "Attempt to update doorbell chime - should mute = %{BOOL}d for characteristic:%@", (uint8_t *)v17, 0x12u);
  }

  if (v7)
  {
    id v11 = objc_msgSend(v6, "hf_characteristicValueManager");
    v12 = objc_opt_new();
    [v11 beginTransactionWithReason:@"HFDoorbellMute-Toggle" readPolicy:v12 logger:0];

    v13 = objc_alloc_init(HFCharacteristicValueSet);
    [(HFCharacteristicValueSet *)v13 setValue:v9 forCharacteristic:v7];
    v14 = objc_msgSend(v6, "hf_characteristicValueManager");
    id v15 = (id)[v14 writeValuesForCharacteristics:v13];

    v16 = objc_msgSend(v6, "hf_characteristicValueManager");
    [v16 commitTransactionWithReason:@"HFDoorbellMute-Toggle"];
  }
}

+ (uint64_t)hf_cameraAccessModeSelectedOptionForCameraProfiles:()HFAdditions presenceType:
{
  v25[4] = *MEMORY[0x263EF8340];
  id v5 = a3;
  v25[0] = @"HFCameraStreamingOptionOff";
  v25[1] = @"HFCameraStreamingOptionDetectActivity";
  v25[2] = @"HFCameraStreamingOptionStream";
  v25[3] = @"HFCameraStreamingOptionStreamAndRecord";
  uint64_t v6 = [MEMORY[0x263EFF8C0] arrayWithObjects:v25 count:4];
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  id obj = v5;
  uint64_t v7 = [obj countByEnumeratingWithState:&v20 objects:v24 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    unint64_t v9 = 0;
    uint64_t v10 = *(void *)v21;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v21 != v10) {
          objc_enumerationMutation(obj);
        }
        v12 = [*(id *)(*((void *)&v20 + 1) + 8 * i) userSettings];
        uint64_t v13 = [v12 accessModeForPresenceType:a4];

        v19[0] = MEMORY[0x263EF8330];
        v19[1] = 3221225472;
        v19[2] = __96__HMCameraProfile_HFAdditions__hf_cameraAccessModeSelectedOptionForCameraProfiles_presenceType___block_invoke;
        v19[3] = &__block_descriptor_40_e18_B16__0__NSString_8l;
        v19[4] = v13;
        v14 = objc_msgSend(v6, "na_firstObjectPassingTest:", v19);
        if ([v6 indexOfObject:v14] > v9) {
          unint64_t v9 = [v6 indexOfObject:v14];
        }
      }
      uint64_t v8 = [obj countByEnumeratingWithState:&v20 objects:v24 count:16];
    }
    while (v8);
  }
  else
  {
    unint64_t v9 = 0;
  }

  id v15 = [v6 objectAtIndex:v9];
  uint64_t v16 = cameraStreamingOptionFromString(v15);

  return v16;
}

- (id)hf_significantEventWithIdentifier:()HFAdditions
{
  id v4 = a3;
  objc_initWeak(&location, a1);
  id v5 = (void *)MEMORY[0x263F58190];
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __66__HMCameraProfile_HFAdditions__hf_significantEventWithIdentifier___block_invoke;
  v9[3] = &unk_264092510;
  objc_copyWeak(&v11, &location);
  id v6 = v4;
  id v10 = v6;
  uint64_t v7 = [v5 futureWithBlock:v9];

  objc_destroyWeak(&v11);
  objc_destroyWeak(&location);

  return v7;
}

- (id)hf_faceCropImageForSignificantEvent:()HFAdditions
{
  id v4 = a3;
  id v5 = (void *)MEMORY[0x263F58190];
  v14[0] = MEMORY[0x263EF8330];
  v14[1] = 3221225472;
  v14[2] = __68__HMCameraProfile_HFAdditions__hf_faceCropImageForSignificantEvent___block_invoke;
  v14[3] = &unk_264090378;
  v14[4] = a1;
  id v6 = v4;
  id v15 = v6;
  uint64_t v7 = [v5 futureWithCompletionHandlerAdapterBlock:v14];
  uint64_t v8 = [v7 flatMap:&__block_literal_global_53_0];
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __68__HMCameraProfile_HFAdditions__hf_faceCropImageForSignificantEvent___block_invoke_3;
  v12[3] = &unk_26408CDF0;
  id v13 = v6;
  id v9 = v6;
  id v10 = [v8 addFailureBlock:v12];

  return v10;
}

@end