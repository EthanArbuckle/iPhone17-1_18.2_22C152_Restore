void _reloadSettings(uint64_t a1, void *a2, uint64_t a3)
{
  void *v5;
  NSObject *v6;
  uint64_t vars8;

  v5 = [MEMORY[0x263F08A00] defaultCenter];
  [v5 postNotificationName:@"AXNanoPreferencesSettingsChangedNotification" object:0];

  if (a2)
  {
    [a2 reloadSpecifiers];
    [a2 didReceiveNPSValueChangedNotificationWithName:a3];
  }
  else
  {
    v6 = AXLogCommon();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      _reloadSettings_cold_1(v6);
    }
  }
}

uint64_t headphoneLevelSettingChanged(uint64_t a1, void *a2)
{
  return [a2 reloadSpecifierID:@"HeadphoneNotificationsID"];
}

id AXGetActivePairedDevice()
{
  v0 = [MEMORY[0x263F57730] sharedInstance];
  v1 = [MEMORY[0x263F57730] activePairedDeviceSelectorBlock];
  v2 = [v0 getAllDevicesWithArchivedAltAccountDevicesMatching:v1];
  v3 = [v2 firstObject];

  v4 = [v3 valueForProperty:*MEMORY[0x263F575B8]];
  if ([v4 BOOLValue]) {
    v5 = 0;
  }
  else {
    v5 = v3;
  }
  id v6 = v5;

  return v6;
}

uint64_t AXActivePairedDeviceIsHunterOrLater()
{
  v0 = AXGetActivePairedDevice();
  v1 = (void *)[objc_alloc(MEMORY[0x263F08C38]) initWithUUIDString:@"B4FBD189-BF37-4C38-A2C3-A0471795086C"];
  uint64_t v2 = [v0 supportsCapability:v1];

  return v2;
}

BOOL AXActivePairedDeviceIsLighthouseOrLater()
{
  v0 = AXGetActivePairedDevice();
  v1 = [v0 valueForProperty:*MEMORY[0x263F57668]];
  uint64_t v2 = [v1 componentsSeparatedByString:@"."];
  v3 = [v2 firstObject];

  BOOL v4 = (int)[v3 intValue] > 9;
  return v4;
}

BOOL AXActivePairedDeviceIsLighthouseEOrLater()
{
  v0 = AXGetActivePairedDevice();
  v1 = [v0 valueForProperty:*MEMORY[0x263F57668]];
  uint64_t v2 = [v1 componentsSeparatedByString:@"."];
  v3 = [v2 firstObject];
  if ((unint64_t)[v2 count] < 2)
  {
    BOOL v4 = @"0";
  }
  else
  {
    BOOL v4 = [v2 objectAtIndexedSubscript:1];
  }
  if ((int)[v3 intValue] <= 10) {
    BOOL v5 = [v3 intValue] == 10 && (int)-[__CFString intValue](v4, "intValue") > 3;
  }
  else {
    BOOL v5 = 1;
  }

  return v5;
}

BOOL AXActivePairedDeviceIsMoonstoneOrLater()
{
  v0 = AXGetActivePairedDevice();
  v1 = [v0 valueForProperty:*MEMORY[0x263F57668]];
  uint64_t v2 = [v1 componentsSeparatedByString:@"."];
  v3 = [v2 firstObject];

  BOOL v4 = (int)[v3 intValue] > 10;
  return v4;
}

id settingsLocString(void *a1, void *a2)
{
  id v3 = a1;
  id v4 = a2;
  BOOL v5 = (void *)AXBridgeSettingsBundle_AXBundle;
  if (!AXBridgeSettingsBundle_AXBundle)
  {
    uint64_t v6 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
    v7 = (void *)AXBridgeSettingsBundle_AXBundle;
    AXBridgeSettingsBundle_AXBundle = v6;

    BOOL v5 = (void *)AXBridgeSettingsBundle_AXBundle;
  }
  v8 = [v5 localizedStringForKey:v3 value:v3 table:v4];

  return v8;
}

id AXHareImage()
{
  v0 = [MEMORY[0x263F827E8] systemImageNamed:@"hare"];
  v1 = [MEMORY[0x263F825C8] colorWithWhite:1.0 alpha:1.0];
  uint64_t v2 = [v0 imageWithTintColor:v1 renderingMode:2];

  return v2;
}

id AXTortoiseImage()
{
  v0 = [MEMORY[0x263F827E8] systemImageNamed:@"tortoise"];
  v1 = [MEMORY[0x263F825C8] colorWithWhite:1.0 alpha:1.0];
  uint64_t v2 = [v0 imageWithTintColor:v1 renderingMode:2];

  return v2;
}

id AXVolumeMinImage()
{
  v0 = [MEMORY[0x263F827E8] systemImageNamed:@"speaker.fill"];
  v1 = [MEMORY[0x263F825C8] colorWithWhite:1.0 alpha:1.0];
  uint64_t v2 = [v0 imageWithTintColor:v1 renderingMode:2];

  return v2;
}

id AXVolumeMaxImage()
{
  v0 = [MEMORY[0x263F827E8] systemImageNamed:@"speaker.wave.3.fill"];
  v1 = [MEMORY[0x263F825C8] colorWithWhite:1.0 alpha:1.0];
  uint64_t v2 = [v0 imageWithTintColor:v1 renderingMode:2];

  return v2;
}

id AXResizeImageToSystemImage(void *a1, uint64_t a2)
{
  id v3 = a1;
  id v4 = (void *)MEMORY[0x263F827E8];
  BOOL v5 = [MEMORY[0x263F82818] configurationWithTextStyle:a2];
  uint64_t v6 = [v4 _systemImageNamed:@"accessibility" withConfiguration:v5];

  if (v6)
  {
    [v6 size];
    double v8 = v7;
    [v6 size];
    if (v8 < v9) {
      double v8 = v9;
    }
    [v3 size];
    double v11 = v10;
    [v3 size];
    if (v11 >= v12) {
      double v13 = v11;
    }
    else {
      double v13 = v12;
    }
    double v14 = v8 / v13;
    id v15 = objc_alloc(MEMORY[0x263F827A0]);
    v16 = [MEMORY[0x263F827B0] defaultFormat];
    v17 = objc_msgSend(v15, "initWithSize:format:", v16, v8, v8);

    v20[0] = MEMORY[0x263EF8330];
    v20[1] = 3221225472;
    v20[2] = __AXResizeImageToSystemImage_block_invoke;
    v20[3] = &unk_2651F21D8;
    id v21 = v3;
    double v22 = v14;
    id v18 = v3;
    id v3 = [v17 imageWithActions:v20];
  }
  else
  {
    v17 = AXLogCommon();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
      AXResizeImageToSystemImage_cold_1(v17);
    }
  }

  return v3;
}

uint64_t __AXResizeImageToSystemImage_block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void **)(a1 + 32);
  double v3 = *(double *)(a1 + 40);
  [v2 size];
  double v5 = v3 * v4;
  double v6 = *(double *)(a1 + 40);
  [*(id *)(a1 + 32) size];

  return objc_msgSend(v2, "drawInRect:", 0.0, 0.0, v5, v6 * v7);
}

id AXLocalizedStringForQuickActionsState(uint64_t a1)
{
  if (a1 <= 2)
  {
    a1 = settingsLocString(off_2651F21F8[(int)a1], @"AccessibilitySettings-quickactions");
  }
  return (id)a1;
}

id AXLocalizedStringForQuickActionBannerAppearance(int a1)
{
  if (!a1)
  {
    uint64_t v2 = @"QUICK_ACTIONS_BANNER_FULL";
LABEL_5:
    double v3 = settingsLocString(v2, @"AccessibilitySettings-quickactions");
    return v3;
  }
  if (a1 == 1)
  {
    uint64_t v2 = @"QUICK_ACTIONS_BANNER_MINIMAL";
    goto LABEL_5;
  }
  double v3 = 0;
  return v3;
}

id AXSettingsBundle()
{
  v0 = (void *)AXSettingsBundle_AXBundle;
  if (!AXSettingsBundle_AXBundle)
  {
    uint64_t v1 = [MEMORY[0x263F086E0] bundleForClass:NSClassFromString(&cfstr_Accessibilityb_1.isa)];
    uint64_t v2 = (void *)AXSettingsBundle_AXBundle;
    AXSettingsBundle_AXBundle = v1;

    v0 = (void *)AXSettingsBundle_AXBundle;
  }

  return v0;
}

uint64_t AXActivePairedDeviceSupportsWatchQuickActionsV2()
{
  v0 = AXGetActivePairedDevice();
  uint64_t v1 = (void *)[objc_alloc(MEMORY[0x263F08C38]) initWithUUIDString:@"93EA0155-DFC4-4F9D-B8F0-DECC5B9C0C1D"];
  uint64_t v2 = [v0 supportsCapability:v1];

  return v2;
}

uint64_t AXActivePairedDeviceSupportsElton()
{
  v0 = AXGetActivePairedDevice();
  uint64_t v1 = (void *)[objc_alloc(MEMORY[0x263F08C38]) initWithUUIDString:@"0E581E21-36BA-4770-9408-0467585E8495"];
  uint64_t v2 = [v0 supportsCapability:v1];

  return v2;
}

uint64_t AXActivePairedDeviceSupportsHasEltonEnabled()
{
  if (!AXActivePairedDeviceSupportsElton()) {
    return 0;
  }
  char v7 = 0;
  id v0 = objc_alloc(MEMORY[0x263F57520]);
  uint64_t v1 = (void *)[v0 initWithDomain:WAGPreferencesDomain];
  id v2 = (id)[v1 synchronize];
  uint64_t v3 = [v1 integerForKey:@"gestureMode" keyExistsAndHasValidFormat:&v7];
  if (v7) {
    BOOL v4 = v3 == 1;
  }
  else {
    BOOL v4 = 1;
  }
  uint64_t v5 = v4;

  return v5;
}

void AXActivePairedDeviceDisableElton()
{
  v8[1] = *MEMORY[0x263EF8340];
  id v0 = objc_alloc(MEMORY[0x263F57520]);
  uint64_t v1 = (void *)[v0 initWithDomain:WAGPreferencesDomain];
  [v1 setObject:&unk_26FB00430 forKey:@"gestureMode"];
  id v2 = (id)[v1 synchronize];
  uint64_t v3 = objc_opt_new();
  uint64_t v4 = WAGPreferencesDomain;
  uint64_t v5 = (void *)MEMORY[0x263EFFA08];
  v8[0] = @"gestureMode";
  double v6 = [MEMORY[0x263EFF8C0] arrayWithObjects:v8 count:1];
  char v7 = [v5 setWithArray:v6];
  [v3 synchronizeNanoDomain:v4 keys:v7];
}

uint64_t AXActivePairedDeviceSupportsQuickActionsAlwaysOnState()
{
  return AXActivePairedDeviceSupportsElton() ^ 1;
}

void _reloadAutoAnswerValues(uint64_t a1, void *a2)
{
  id v4 = a2;
  id v2 = [v4 domainAccessor];
  id v3 = (id)[v2 synchronize];

  [v4 reload];
}

void sub_246A479FC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,char a33)
{
}

void sub_246A47E3C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, ...)
{
  va_start(va1, a12);
  va_start(va, a12);
  uint64_t v13 = va_arg(va1, void);
  uint64_t v15 = va_arg(va1, void);
  uint64_t v16 = va_arg(va1, void);
  uint64_t v17 = va_arg(va1, void);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  _Unwind_Resume(a1);
}

void sub_246A484D0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_246A51108(_Unwind_Exception *a1)
{
  objc_destroyWeak(v3);
  objc_destroyWeak(v2);
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v4 - 120));
  _Unwind_Resume(a1);
}

void _reloadSettings_0(uint64_t a1, void *a2)
{
  if (a2)
  {
    [a2 reloadSpecifiers];
  }
  else
  {
    id v3 = AXLogCommon();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
      _reloadSettings_cold_1_0(v3);
    }
  }
}

void _reloadSettings_1(uint64_t a1, void *a2)
{
  if (a2)
  {
    [a2 reloadSpecifiers];
  }
  else
  {
    id v3 = AXLogCommon();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
      _reloadSettings_cold_1_1(v3);
    }
  }
}

id AXTouchAccommodationsDomainAccessor()
{
  id v0 = objc_alloc(MEMORY[0x263F57520]);
  uint64_t v1 = (void *)[v0 initWithDomain:*MEMORY[0x263F8B3B0]];

  return v1;
}

uint64_t AXGizmoTouchAccommodationsSupported()
{
  id v0 = AXGetActivePairedDevice();
  NRWatchOSVersionForRemoteDevice();
  uint64_t IsGreaterThanOrEqual = NRVersionIsGreaterThanOrEqual();

  return IsGreaterThanOrEqual;
}

uint64_t AXGizmoTouchAccommodationsEnabled()
{
  id v0 = objc_alloc(MEMORY[0x263F57520]);
  uint64_t v1 = (void *)[v0 initWithDomain:*MEMORY[0x263F8B3B0]];
  uint64_t v2 = [v1 BOOLForKey:*MEMORY[0x263F22A78]];

  return v2;
}

void AXGizmoTouchAccommodationsSetEnabled(uint64_t a1)
{
  uint64_t v1 = (void *)*MEMORY[0x263F22A78];
  id v2 = [NSNumber numberWithBool:a1];
  AXGizmoTouchAccommodationsSyncPref(v1, v2);
}

void AXGizmoTouchAccommodationsSyncPref(void *a1, void *a2)
{
  v15[1] = *MEMORY[0x263EF8340];
  id v3 = (objc_class *)MEMORY[0x263F57520];
  id v4 = a2;
  id v5 = a1;
  id v6 = [v3 alloc];
  char v7 = (uint64_t *)MEMORY[0x263F8B3B0];
  double v8 = (void *)[v6 initWithDomain:*MEMORY[0x263F8B3B0]];
  [v8 setObject:v4 forKey:v5];

  id v9 = (id)[v8 synchronize];
  double v10 = objc_opt_new();
  uint64_t v11 = *v7;
  double v12 = (void *)MEMORY[0x263EFFA08];
  v15[0] = v5;
  uint64_t v13 = [MEMORY[0x263EFF8C0] arrayWithObjects:v15 count:1];
  double v14 = [v12 setWithArray:v13];
  [v10 synchronizeNanoDomain:v11 keys:v14];
}

uint64_t AXGizmoTouchAccommodationsUsageConfirmed()
{
  id v0 = objc_alloc(MEMORY[0x263F57520]);
  uint64_t v1 = (void *)[v0 initWithDomain:*MEMORY[0x263F8B3B0]];
  uint64_t v2 = [v1 BOOLForKey:*MEMORY[0x263F22AC8]];

  return v2;
}

void AXGizmoTouchAccommodationsSetUsageConfirmed(uint64_t a1)
{
  uint64_t v1 = (void *)*MEMORY[0x263F22AC8];
  id v2 = [NSNumber numberWithBool:a1];
  AXGizmoTouchAccommodationsSyncPref(v1, v2);
}

BOOL AXGizmoTouchAccommodationsAreConfigured()
{
  return (AXGizmoTouchAccommodationsHoldDurationEnabled() & 1) != 0
      || (AXGizmoTouchAccommodationsIgnoreRepeatEnabled() & 1) != 0
      || AXGizmoTouchAccommodationsTapActivationMethod() != 0;
}

uint64_t AXGizmoTouchAccommodationsHoldDurationEnabled()
{
  id v0 = objc_alloc(MEMORY[0x263F57520]);
  uint64_t v1 = (void *)[v0 initWithDomain:*MEMORY[0x263F8B3B0]];
  uint64_t v2 = [v1 BOOLForKey:*MEMORY[0x263F22A80]];

  return v2;
}

uint64_t AXGizmoTouchAccommodationsIgnoreRepeatEnabled()
{
  id v0 = objc_alloc(MEMORY[0x263F57520]);
  uint64_t v1 = (void *)[v0 initWithDomain:*MEMORY[0x263F8B3B0]];
  uint64_t v2 = [v1 BOOLForKey:*MEMORY[0x263F22AA8]];

  return v2;
}

uint64_t AXGizmoTouchAccommodationsTapActivationMethod()
{
  id v0 = objc_alloc(MEMORY[0x263F57520]);
  uint64_t v1 = (void *)[v0 initWithDomain:*MEMORY[0x263F8B3B0]];
  uint64_t v2 = [v1 integerForKey:*MEMORY[0x263F22AB0]];

  return v2;
}

void AXGizmoTouchAccommodationsSetHoldDurationEnabled(uint64_t a1)
{
  uint64_t v1 = (void *)*MEMORY[0x263F22A80];
  id v2 = [NSNumber numberWithBool:a1];
  AXGizmoTouchAccommodationsSyncPref(v1, v2);
}

void AXGizmoTouchAccommodationsSetIgnoreRepeatEnabled(uint64_t a1)
{
  uint64_t v1 = (void *)*MEMORY[0x263F22AA8];
  id v2 = [NSNumber numberWithBool:a1];
  AXGizmoTouchAccommodationsSyncPref(v1, v2);
}

uint64_t AXGizmoTouchAccommodationsAllowsSwipeGesturesToBypass()
{
  id v0 = objc_alloc(MEMORY[0x263F57520]);
  uint64_t v1 = (void *)[v0 initWithDomain:*MEMORY[0x263F8B3B0]];
  uint64_t v2 = [v1 BOOLForKey:*MEMORY[0x263F22A70]];

  return v2;
}

void AXGizmoTouchAccommodationsSetAllowsSwipeGesturesToBypass(uint64_t a1)
{
  uint64_t v1 = (void *)*MEMORY[0x263F22A70];
  id v2 = [NSNumber numberWithBool:a1];
  AXGizmoTouchAccommodationsSyncPref(v1, v2);
}

double AXGizmoTouchAccommodationsSwipeGestureMinimumDistance()
{
  id v0 = objc_alloc(MEMORY[0x263F57520]);
  uint64_t v1 = (void *)[v0 initWithDomain:*MEMORY[0x263F8B3B0]];
  id v2 = [v1 objectForKey:*MEMORY[0x263F22A98]];

  if (!v2)
  {
    id v2 = [NSNumber numberWithDouble:*MEMORY[0x263F22A90]];
  }
  [v2 floatValue];
  double v4 = v3;

  return v4;
}

void AXGizmoTouchAccommodationsSetSwipeGestureMinimumDistance()
{
  id v0 = (void *)*MEMORY[0x263F22A98];
  objc_msgSend(NSNumber, "numberWithDouble:");
  id v1 = (id)objc_claimAutoreleasedReturnValue();
  AXGizmoTouchAccommodationsSyncPref(v0, v1);
}

double AXGizmoTouchAccommodationsHoldDuration()
{
  id v0 = objc_alloc(MEMORY[0x263F57520]);
  id v1 = (void *)[v0 initWithDomain:*MEMORY[0x263F8B3B0]];
  [v1 doubleForKey:*MEMORY[0x263F22A88]];
  double v3 = v2;

  return v3;
}

void AXGizmoTouchAccommodationsSetHoldDuration()
{
  id v0 = (void *)*MEMORY[0x263F22A88];
  objc_msgSend(NSNumber, "numberWithDouble:");
  id v1 = (id)objc_claimAutoreleasedReturnValue();
  AXGizmoTouchAccommodationsSyncPref(v0, v1);
}

double AXGizmoTouchAccommodationsIgnoreRepeatDuration()
{
  id v0 = objc_alloc(MEMORY[0x263F57520]);
  id v1 = (void *)[v0 initWithDomain:*MEMORY[0x263F8B3B0]];
  [v1 doubleForKey:*MEMORY[0x263F22AA0]];
  double v3 = v2;

  return v3;
}

void AXGizmoTouchAccommodationsSetIgnoreRepeatDuration()
{
  id v0 = (void *)*MEMORY[0x263F22AA0];
  objc_msgSend(NSNumber, "numberWithDouble:");
  id v1 = (id)objc_claimAutoreleasedReturnValue();
  AXGizmoTouchAccommodationsSyncPref(v0, v1);
}

double AXGizmoTouchAccommodationsTapActivationTimeout()
{
  id v0 = objc_alloc(MEMORY[0x263F57520]);
  id v1 = (void *)[v0 initWithDomain:*MEMORY[0x263F8B3B0]];
  [v1 doubleForKey:*MEMORY[0x263F22AB8]];
  double v3 = v2;

  return v3;
}

void AXGizmoTouchAccommodationsSetTapActivationTimeout()
{
  id v0 = (void *)*MEMORY[0x263F22AB8];
  objc_msgSend(NSNumber, "numberWithDouble:");
  id v1 = (id)objc_claimAutoreleasedReturnValue();
  AXGizmoTouchAccommodationsSyncPref(v0, v1);
}

void AXGizmoTouchAccommodationsSetTapActivationMethod(uint64_t a1)
{
  id v1 = (void *)*MEMORY[0x263F22AB0];
  id v2 = [NSNumber numberWithInteger:a1];
  AXGizmoTouchAccommodationsSyncPref(v1, v2);
}

void sub_246A52D90(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_246A55A6C(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 88));
  _Unwind_Resume(a1);
}

void sub_246A5B23C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy_(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose_(uint64_t a1)
{
}

void sub_246A60940(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,id location)
{
  _Block_object_dispose((const void *)(v25 - 136), 8);
  _Unwind_Resume(a1);
}

Class __getTTSVBUILoaderClass_block_invoke(uint64_t a1)
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  v3[0] = 0;
  if (!TextToSpeechVoiceBankingUILibraryCore_frameworkLibrary)
  {
    v3[1] = (void *)MEMORY[0x263EF8330];
    v3[2] = (void *)3221225472;
    v3[3] = __TextToSpeechVoiceBankingUILibraryCore_block_invoke;
    v3[4] = &__block_descriptor_40_e5_v8__0l;
    v3[5] = v3;
    long long v4 = xmmword_2651F25B8;
    uint64_t v5 = 0;
    TextToSpeechVoiceBankingUILibraryCore_frameworkLibrary = _sl_dlopen();
    if (!TextToSpeechVoiceBankingUILibraryCore_frameworkLibrary)
    {
      abort_report_np();
LABEL_8:
      __getTTSVBUILoaderClass_block_invoke_cold_1();
    }
    if (v3[0]) {
      free(v3[0]);
    }
  }
  Class result = objc_getClass("TTSVBUILoader");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  if (!*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24)) {
    goto LABEL_8;
  }
  getTTSVBUILoaderClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t __TextToSpeechVoiceBankingUILibraryCore_block_invoke()
{
  uint64_t result = _sl_dlopen();
  TextToSpeechVoiceBankingUILibraryCore_frameworkLibrary = result;
  return result;
}

void sub_246A6406C(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 112), 8);
  _Unwind_Resume(a1);
}

uint64_t BridgeVoiceSource.preferredLanguages.getter()
{
  id v0 = self;
  uint64_t v1 = (void *)sub_246A6B090();
  id v2 = objc_msgSend(v0, sel_domainAccessorForDomain_, v1);

  if (!v2) {
    return MEMORY[0x263F8EE78];
  }
  double v3 = (void *)sub_246A6B090();
  id v4 = objc_msgSend(v2, sel_stringArrayForKey_, v3);

  if (!v4 || (v5 = sub_246A6B0C0(), v4, uint64_t v6 = sub_246A644B4(v5), swift_bridgeObjectRelease(), !v6))
  {
    swift_bridgeObjectRelease();

    return MEMORY[0x263F8EE78];
  }

  return v6;
}

uint64_t sub_246A644B4(uint64_t a1)
{
  int64_t v2 = *(void *)(a1 + 16);
  uint64_t v12 = MEMORY[0x263F8EE78];
  sub_246A65640(0, v2, 0);
  uint64_t v3 = v12;
  if (v2)
  {
    for (uint64_t i = a1 + 32; ; i += 32)
    {
      sub_246A66268(i, (uint64_t)v11);
      if (!swift_dynamicCast()) {
        break;
      }
      if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
      {
        sub_246A65640(0, *(void *)(v3 + 16) + 1, 1);
        uint64_t v3 = v12;
      }
      unint64_t v6 = *(void *)(v3 + 16);
      unint64_t v5 = *(void *)(v3 + 24);
      if (v6 >= v5 >> 1)
      {
        sub_246A65640((char *)(v5 > 1), v6 + 1, 1);
        uint64_t v3 = v12;
      }
      *(void *)(v3 + 16) = v6 + 1;
      uint64_t v7 = v3 + 16 * v6;
      *(void *)(v7 + 32) = v9;
      *(void *)(v7 + 40) = v10;
      if (!--v2) {
        return v3;
      }
    }
    swift_release();
    swift_bridgeObjectRelease();
    return 0;
  }
  return v3;
}

uint64_t BridgeVoiceSource.__allocating_init()()
{
  uint64_t v0 = swift_allocObject();
  BridgeVoiceSource.init()();
  return v0;
}

uint64_t BridgeVoiceSource.init()()
{
  uint64_t v1 = v0;
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_2691BFDE8);
  MEMORY[0x270FA5388](v2 - 8, v3);
  v48 = (char *)&v39 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_2691BFDF0);
  uint64_t v6 = *(void *)(v5 - 8);
  MEMORY[0x270FA5388](v5, v7);
  uint64_t v9 = (char *)&v39 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v40 = __swift_instantiateConcreteTypeFromMangledName(&qword_2691BFDF8);
  uint64_t v49 = *(void *)(v40 - 8);
  uint64_t v47 = *(void *)(v49 + 64);
  uint64_t v11 = MEMORY[0x270FA5388](v40, v10);
  v46 = (char *)&v39 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v11, v13);
  uint64_t v15 = (char *)&v39 - v14;
  uint64_t v16 = __swift_instantiateConcreteTypeFromMangledName(&qword_2691BFE00);
  uint64_t v17 = *(void *)(v16 - 8);
  uint64_t v44 = v16;
  uint64_t v45 = v17;
  uint64_t v19 = MEMORY[0x270FA5388](v16, v18);
  id v21 = (char *)&v39 - ((v20 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v19, v22);
  v24 = (char *)&v39 - v23;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2691BFE08);
  (*(void (**)(char *, void, uint64_t))(v6 + 104))(v9, *MEMORY[0x263F8F580], v5);
  v43 = v24;
  v41 = v15;
  sub_246A6B110();
  (*(void (**)(char *, uint64_t))(v6 + 8))(v9, v5);
  v42 = *(void (**)(uint64_t, char *, uint64_t))(v49 + 16);
  uint64_t v25 = v40;
  v42(v1 + OBJC_IVAR____TtC21AccessibilitySettings17BridgeVoiceSource_streamContinuation, v15, v40);
  __swift_instantiateConcreteTypeFromMangledName(&qword_2691BFE10);
  (*(void (**)(char *, char *, uint64_t))(v17 + 16))(v21, v24, v16);
  *(void *)(v1 + 16) = sub_246A6AEF0();
  id v26 = objc_msgSend(self, sel_defaultCenter);
  swift_retain();
  v27 = (void *)sub_246A6B090();
  objc_msgSend(v26, sel_addObserver_selector_name_object_, v1, sel_resourceCacheDidReceiveUpdate, v27, 0);

  swift_release();
  v28 = (void *)MEMORY[0x24C53F810]();
  sub_246A65764();
  v50[3] = type metadata accessor for BridgeVoiceSource();
  v50[4] = sub_246A659E8();
  v50[0] = v1;
  swift_retain();
  sub_246A6B0D0();
  swift_bridgeObjectRelease();
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v50);
  uint64_t v39 = sub_246A6B080();
  swift_bridgeObjectRelease();
  uint64_t v29 = sub_246A6B100();
  uint64_t v30 = (uint64_t)v48;
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v29 - 8) + 56))(v48, 1, 1, v29);
  v31 = v46;
  v32 = v41;
  uint64_t v33 = v25;
  v42((uint64_t)v46, v41, v25);
  uint64_t v34 = v49;
  unint64_t v35 = (*(unsigned __int8 *)(v49 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v49 + 80);
  unint64_t v36 = (v47 + v35 + 7) & 0xFFFFFFFFFFFFFFF8;
  uint64_t v37 = swift_allocObject();
  *(void *)(v37 + 16) = 0;
  *(void *)(v37 + 24) = 0;
  (*(void (**)(unint64_t, char *, uint64_t))(v34 + 32))(v37 + v35, v31, v33);
  *(void *)(v37 + v36) = v39;
  sub_246A64C7C(v30, (uint64_t)&unk_2691BFE28, v37);
  swift_release();
  (*(void (**)(char *, uint64_t))(v34 + 8))(v32, v33);
  (*(void (**)(char *, uint64_t))(v45 + 8))(v43, v44);
  return v1;
}

uint64_t __swift_instantiateConcreteTypeFromMangledName(uint64_t *a1)
{
  uint64_t result = *a1;
  if (result < 0)
  {
    uint64_t result = swift_getTypeByMangledNameInContext2();
    *a1 = result;
  }
  return result;
}

uint64_t sub_246A64BC8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  v5[4] = a4;
  v5[5] = a5;
  v5[3] = a1;
  return MEMORY[0x270FA2498](sub_246A64BEC, 0, 0);
}

uint64_t sub_246A64BEC()
{
  v0[2] = v0[5];
  swift_bridgeObjectRetain();
  __swift_instantiateConcreteTypeFromMangledName(&qword_2691BFDF8);
  sub_246A6B120();
  uint64_t v1 = (uint64_t (*)(void))v0[1];
  return v1();
}

uint64_t sub_246A64C7C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_246A6B100();
  uint64_t v7 = *(void *)(v6 - 8);
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v7 + 48))(a1, 1, v6) != 1)
  {
    sub_246A6B0F0();
    (*(void (**)(uint64_t, uint64_t))(v7 + 8))(a1, v6);
    if (!*(void *)(a3 + 16)) {
      goto LABEL_5;
    }
    goto LABEL_3;
  }
  sub_246A6620C(a1, &qword_2691BFDE8);
  if (*(void *)(a3 + 16))
  {
LABEL_3:
    swift_getObjectType();
    swift_unknownObjectRetain();
    sub_246A6B0E0();
    swift_unknownObjectRelease();
  }
LABEL_5:
  uint64_t v8 = swift_allocObject();
  *(void *)(v8 + 16) = a2;
  *(void *)(v8 + 24) = a3;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2691BFE50);
  return swift_task_create();
}

uint64_t BridgeVoiceSource.voices.getter()
{
  return sub_246A6AF00();
}

Swift::Void __swiftcall BridgeVoiceSource.resourceCacheDidReceiveUpdate()()
{
  uint64_t v1 = v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2691BFDE8);
  MEMORY[0x270FA5388]();
  uint64_t v3 = (char *)v12 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v4 = sub_246A6B100();
  uint64_t v5 = *(void *)(v4 - 8);
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v5 + 56))(v3, 1, 1, v4);
  uint64_t v6 = (void *)swift_allocObject();
  v6[2] = 0;
  v6[3] = 0;
  v6[4] = v1;
  int v7 = (*(uint64_t (**)(char *, uint64_t, uint64_t))(v5 + 48))(v3, 1, v4);
  swift_retain();
  if (v7 == 1)
  {
    sub_246A6620C((uint64_t)v3, &qword_2691BFDE8);
    uint64_t v8 = 0;
    uint64_t v9 = 0;
  }
  else
  {
    sub_246A6B0F0();
    (*(void (**)(char *, uint64_t))(v5 + 8))(v3, v4);
    if (v6[2])
    {
      swift_getObjectType();
      swift_unknownObjectRetain();
      uint64_t v8 = sub_246A6B0E0();
      uint64_t v9 = v10;
      swift_unknownObjectRelease();
    }
    else
    {
      uint64_t v8 = 0;
      uint64_t v9 = 0;
    }
  }
  uint64_t v11 = swift_allocObject();
  *(void *)(v11 + 16) = &unk_2691BFE38;
  *(void *)(v11 + 24) = v6;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2691BFE50);
  if (v9 | v8)
  {
    v12[0] = 0;
    v12[1] = 0;
    v12[2] = v8;
    v12[3] = v9;
  }
  swift_task_create();
  swift_release();
}

uint64_t sub_246A650A0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  *(void *)(v4 + 56) = a1;
  *(void *)(v4 + 64) = a4;
  return MEMORY[0x270FA2498](sub_246A650C0, 0, 0);
}

uint64_t sub_246A650C0()
{
  uint64_t v1 = v0[8];
  uint64_t v2 = (void *)MEMORY[0x24C53F810]();
  sub_246A65764();
  v0[5] = type metadata accessor for BridgeVoiceSource();
  v0[6] = sub_246A659E8();
  v0[2] = v1;
  swift_retain();
  sub_246A6B0D0();
  swift_bridgeObjectRelease();
  __swift_destroy_boxed_opaque_existential_1((uint64_t)(v0 + 2));
  uint64_t v3 = sub_246A6B080();
  swift_bridgeObjectRelease();
  v0[2] = v3;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2691BFDF8);
  sub_246A6B120();
  uint64_t v4 = (uint64_t (*)(void))v0[1];
  return v4();
}

uint64_t BridgeVoiceSource.deviceMemoryLimit.getter()
{
  return 150000000;
}

uint64_t BridgeVoiceSource.deinit()
{
  id v1 = objc_msgSend(self, sel_defaultCenter);
  objc_msgSend(v1, sel_removeObserver_, v0);

  swift_release();
  uint64_t v2 = v0 + OBJC_IVAR____TtC21AccessibilitySettings17BridgeVoiceSource_streamContinuation;
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_2691BFDF8);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8))(v2, v3);
  return v0;
}

uint64_t BridgeVoiceSource.__deallocating_deinit()
{
  id v1 = objc_msgSend(self, sel_defaultCenter);
  objc_msgSend(v1, sel_removeObserver_, v0);

  swift_release();
  uint64_t v2 = v0 + OBJC_IVAR____TtC21AccessibilitySettings17BridgeVoiceSource_streamContinuation;
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_2691BFDF8);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8))(v2, v3);
  uint64_t v4 = *(unsigned int *)(*(void *)v0 + 48);
  uint64_t v5 = *(unsigned __int16 *)(*(void *)v0 + 52);

  return MEMORY[0x270FA0228](v0, v4, v5);
}

uint64_t sub_246A6539C()
{
  return (*(uint64_t (**)(void))(**(void **)v0 + 120))();
}

uint64_t sub_246A653E0()
{
  return (*(uint64_t (**)(void))(**(void **)v0 + 96))();
}

uint64_t sub_246A65428()
{
  return (*(uint64_t (**)(void))(**(void **)v0 + 144))();
}

uint64_t sub_246A6546C(uint64_t a1, int *a2)
{
  uint64_t v6 = (uint64_t (*)(uint64_t))((char *)a2 + *a2);
  uint64_t v4 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v4;
  void *v4 = v2;
  v4[1] = sub_246A65548;
  return v6(a1);
}

uint64_t sub_246A65548()
{
  uint64_t v3 = *v0;
  swift_task_dealloc();
  id v1 = *(uint64_t (**)(void))(v3 + 8);
  return v1();
}

char *sub_246A65640(char *a1, int64_t a2, char a3)
{
  uint64_t result = sub_246A65660(a1, a2, a3, *v3);
  char *v3 = result;
  return result;
}

char *sub_246A65660(char *result, int64_t a2, char a3, char *a4)
{
  char v5 = (char)result;
  if (a3)
  {
    unint64_t v6 = *((void *)a4 + 3);
    int64_t v7 = v6 >> 1;
    if ((uint64_t)(v6 >> 1) < a2)
    {
      if (v7 + 0x4000000000000000 < 0)
      {
        __break(1u);
        return result;
      }
      int64_t v7 = v6 & 0xFFFFFFFFFFFFFFFELL;
      if ((uint64_t)(v6 & 0xFFFFFFFFFFFFFFFELL) <= a2) {
        int64_t v7 = a2;
      }
    }
  }
  else
  {
    int64_t v7 = a2;
  }
  uint64_t v8 = *((void *)a4 + 2);
  if (v7 <= v8) {
    uint64_t v9 = *((void *)a4 + 2);
  }
  else {
    uint64_t v9 = v7;
  }
  if (v9)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_2691BFEB0);
    uint64_t v10 = (char *)swift_allocObject();
    int64_t v11 = _swift_stdlib_malloc_size(v10);
    uint64_t v12 = v11 - 32;
    if (v11 < 32) {
      uint64_t v12 = v11 - 17;
    }
    *((void *)v10 + 2) = v8;
    *((void *)v10 + 3) = 2 * (v12 >> 4);
  }
  else
  {
    uint64_t v10 = (char *)MEMORY[0x263F8EE78];
  }
  uint64_t v13 = v10 + 32;
  uint64_t v14 = a4 + 32;
  if (v5)
  {
    if (v10 != a4 || v13 >= &v14[16 * v8]) {
      memmove(v13, v14, 16 * v8);
    }
    *((void *)a4 + 2) = 0;
  }
  else
  {
    swift_arrayInitWithCopy();
  }
  swift_release();
  return v10;
}

id sub_246A65764()
{
  id result = objc_msgSend(self, sel_accessibilityDomainAccessor);
  if (result)
  {
    id v1 = result;
    uint64_t v2 = (void *)sub_246A6B090();
    id v3 = objc_msgSend(v1, sel_dataForKey_, v2);

    if (v3)
    {
      uint64_t v4 = sub_246A6AE80();
      unint64_t v6 = v5;

      sub_246A66178(0, &qword_2691BFE68);
      __swift_instantiateConcreteTypeFromMangledName(&qword_2691BFE70);
      uint64_t v7 = swift_allocObject();
      *(_OWORD *)(v7 + 16) = xmmword_246A6E2D0;
      *(void *)(v7 + 32) = sub_246A66178(0, &qword_2691BFE78);
      *(void *)(v7 + 40) = sub_246A66178(0, &qword_2691BFE80);
      *(void *)(v7 + 48) = sub_246A66178(0, &qword_2691BFE88);
      *(void *)(v7 + 56) = sub_246A66178(0, &qword_2691BFE90);
      *(void *)(v7 + 64) = sub_246A66178(0, (unint64_t *)&qword_2691BFE98);
      sub_246A6B1A0();
      swift_bridgeObjectRelease();
      if (v10)
      {
        __swift_instantiateConcreteTypeFromMangledName(&qword_2691BFEA8);
        if (swift_dynamicCast())
        {
          sub_246A661B4(v4, v6);
          return (id)v8;
        }
      }
      else
      {
        sub_246A6620C((uint64_t)v9, &qword_2691BFEA0);
      }
      sub_246A661B4(v4, v6);
    }
    return (id)MEMORY[0x263F8EE78];
  }
  else
  {
    __break(1u);
  }
  return result;
}

uint64_t type metadata accessor for BridgeVoiceSource()
{
  uint64_t result = qword_2691C00A0;
  if (!qword_2691C00A0) {
    return swift_getSingletonMetadata();
  }
  return result;
}

unint64_t sub_246A659E8()
{
  unint64_t result = qword_2691BFE18;
  if (!qword_2691BFE18)
  {
    type metadata accessor for BridgeVoiceSource();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, &qword_2691BFE18);
  }
  return result;
}

uint64_t __swift_destroy_boxed_opaque_existential_1(uint64_t a1)
{
  uint64_t v1 = *(void *)(*(void *)(a1 + 24) - 8);
  if ((*(unsigned char *)(v1 + 82) & 2) != 0) {
    return swift_release();
  }
  else {
    return (*(uint64_t (**)(void))(v1 + 8))();
  }
}

uint64_t sub_246A65A90()
{
  uint64_t v1 = __swift_instantiateConcreteTypeFromMangledName(&qword_2691BFDF8);
  uint64_t v2 = *(void *)(v1 - 8);
  uint64_t v3 = *(unsigned __int8 *)(v2 + 80);
  uint64_t v4 = (v3 + 32) & ~v3;
  uint64_t v5 = v3 | 7;
  unint64_t v6 = ((*(void *)(v2 + 64) + v4 + 7) & 0xFFFFFFFFFFFFFFF8) + 8;
  swift_unknownObjectRelease();
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v0 + v4, v1);
  swift_bridgeObjectRelease();

  return MEMORY[0x270FA0238](v0, v6, v5);
}

uint64_t sub_246A65B7C(uint64_t a1)
{
  uint64_t v4 = *(void *)(__swift_instantiateConcreteTypeFromMangledName(&qword_2691BFDF8) - 8);
  unint64_t v5 = (*(unsigned __int8 *)(v4 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v4 + 80);
  uint64_t v6 = v1 + v5;
  uint64_t v7 = *(void *)(v1 + ((*(void *)(v4 + 64) + v5 + 7) & 0xFFFFFFFFFFFFFFF8));
  uint64_t v8 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v8;
  void *v8 = v2;
  v8[1] = sub_246A662C8;
  v8[4] = v6;
  v8[5] = v7;
  v8[3] = a1;
  return MEMORY[0x270FA2498](sub_246A64BEC, 0, 0);
}

uint64_t sub_246A65CA0()
{
  swift_unknownObjectRelease();
  swift_release();

  return MEMORY[0x270FA0238](v0, 40, 7);
}

uint64_t sub_246A65CE0(uint64_t a1)
{
  uint64_t v4 = *(void *)(v1 + 32);
  unint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v5;
  void *v5 = v2;
  v5[1] = sub_246A65D90;
  v5[7] = a1;
  v5[8] = v4;
  return MEMORY[0x270FA2498](sub_246A650C0, 0, 0);
}

uint64_t sub_246A65D90()
{
  uint64_t v3 = *v0;
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v3 + 8);
  return v1();
}

uint64_t sub_246A65E84(uint64_t a1)
{
  uint64_t v4 = *(int **)(v1 + 16);
  unint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v5;
  void *v5 = v2;
  v5[1] = sub_246A662C8;
  uint64_t v6 = (uint64_t (*)(uint64_t, int *))((char *)&dword_2691BFE40 + dword_2691BFE40);
  return v6(a1, v4);
}

uint64_t sub_246A65F3C()
{
  return type metadata accessor for BridgeVoiceSource();
}

void sub_246A65F44()
{
  sub_246A65FE4();
  if (v0 <= 0x3F) {
    swift_updateClassMetadata2();
  }
}

void sub_246A65FE4()
{
  if (!qword_2691BFE58)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2691BFE08);
    unint64_t v0 = sub_246A6B130();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_2691BFE58);
    }
  }
}

uint64_t __swift_instantiateConcreteTypeFromMangledNameAbstract(uint64_t *a1)
{
  uint64_t result = *a1;
  if (result < 0)
  {
    uint64_t result = swift_getTypeByMangledNameInContextInMetadataState2();
    *a1 = result;
  }
  return result;
}

uint64_t sub_246A66088()
{
  swift_release();

  return MEMORY[0x270FA0238](v0, 32, 7);
}

uint64_t sub_246A660C0(uint64_t a1)
{
  uint64_t v4 = *(int **)(v1 + 16);
  unint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v5;
  void *v5 = v2;
  v5[1] = sub_246A65D90;
  uint64_t v6 = (uint64_t (*)(uint64_t, int *))((char *)&dword_2691BFE40 + dword_2691BFE40);
  return v6(a1, v4);
}

uint64_t sub_246A66178(uint64_t a1, unint64_t *a2)
{
  uint64_t result = *a2;
  if (!*a2)
  {
    self;
    uint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, a2);
  }
  return result;
}

uint64_t sub_246A661B4(uint64_t a1, unint64_t a2)
{
  if (a2 >> 62 != 1)
  {
    if (a2 >> 62 != 2) {
      return result;
    }
    swift_release();
  }

  return swift_release();
}

uint64_t sub_246A6620C(uint64_t a1, uint64_t *a2)
{
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(a2);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

uint64_t sub_246A66268(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 24);
  *(void *)(a2 + 24) = v3;
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

uint64_t sub_246A662D0()
{
  type metadata accessor for BridgeVoiceSource();
  uint64_t result = BridgeVoiceSource.__allocating_init()();
  qword_2691C0170 = result;
  return result;
}

uint64_t sub_246A66304()
{
  uint64_t v0 = sub_246A6AEB0();
  uint64_t v1 = *(void *)(v0 - 8);
  MEMORY[0x270FA5388](v0, v2);
  uint64_t v4 = &v9[-((v3 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v5 = sub_246A6AEE0();
  MEMORY[0x270FA5388](v5 - 8, v6);
  sub_246A6AEC0();
  if (qword_2691C00B0 != -1) {
    swift_once();
  }
  swift_beginAccess();
  uint64_t v7 = qword_2691C0170;
  uint64_t v11 = type metadata accessor for BridgeVoiceSource();
  uint64_t v12 = sub_246A6653C(&qword_2691BFE18, (void (*)(uint64_t))type metadata accessor for BridgeVoiceSource);
  uint64_t v10 = v7;
  swift_retain();
  sub_246A6AED0();
  (*(void (**)(unsigned char *, void, uint64_t))(v1 + 104))(v4, *MEMORY[0x263F7ECF8], v0);
  uint64_t result = sub_246A6AEA0();
  qword_2691C0178 = result;
  return result;
}

uint64_t type metadata accessor for BridgeCoreSynthesisVoicePickableFetcher()
{
  uint64_t result = qword_2691C0160;
  if (!qword_2691C0160) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t sub_246A66534()
{
  return 1;
}

uint64_t sub_246A6653C(unint64_t *a1, void (*a2)(uint64_t))
{
  uint64_t result = *a1;
  if (!result)
  {
    a2(255);
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_246A66584(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 24);
  *(void *)(a2 + 24) = v3;
  *(void *)(a2 + 32) = *(void *)(a1 + 32);
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

uint64_t sub_246A665E8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v10 = *(void *)(a1 + 24);
  uint64_t v11 = *(void *)(a1 + 32);
  uint64_t v12 = __swift_mutable_project_boxed_opaque_existential_1(a1, v10);
  MEMORY[0x270FA5388](v12, v12);
  uint64_t v14 = (char *)&v18 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *))(v15 + 16))(v14);
  uint64_t v16 = sub_246A69858((uint64_t)v14, a2, a3, a4, a5, v10, v11);
  __swift_destroy_boxed_opaque_existential_1(a1);
  return v16;
}

uint64_t sub_246A666F8@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X8>)
{
  uint64_t v35 = a1;
  uint64_t v36 = a2;
  uint64_t v40 = a5;
  uint64_t v41 = sub_246A6AF40();
  uint64_t v39 = *(void *)(v41 - 8);
  MEMORY[0x270FA5388](v41, v7);
  v38 = (char *)&v34 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_2691BFEE0);
  uint64_t v10 = *(void *)(v9 - 8);
  MEMORY[0x270FA5388](v9, v11);
  uint64_t v13 = (char *)&v34 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v34 = __swift_instantiateConcreteTypeFromMangledName(&qword_2691BFEE8);
  uint64_t v14 = *(void *)(v34 - 8);
  MEMORY[0x270FA5388](v34, v15);
  uint64_t v17 = (char *)&v34 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v37 = __swift_instantiateConcreteTypeFromMangledName(&qword_2691BFEF0);
  uint64_t v18 = *(void *)(v37 - 8);
  MEMORY[0x270FA5388](v37, v19);
  id v21 = (char *)&v34 - ((v20 + 15) & 0xFFFFFFFFFFFFFFF0);
  v44[0] = a3;
  v44[1] = a4;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2691BFED8);
  sub_246A6B040();
  sub_246A6AF10();
  if (qword_2691C00B8 != -1) {
    swift_once();
  }
  swift_beginAccess();
  uint64_t v22 = sub_246A6A5D4(&qword_2691BFEF8, &qword_2691BFEE0);
  swift_retain();
  sub_246A6AFF0();
  swift_release();
  (*(void (**)(char *, uint64_t))(v10 + 8))(v13, v9);
  uint64_t v42 = v35;
  uint64_t v43 = v36;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2691BFF00);
  sub_246A6B040();
  v44[3] = type metadata accessor for BridgeCoreSynthesisVoicePickableFetcher();
  v44[4] = MEMORY[0x263F7F210];
  uint64_t v42 = v9;
  uint64_t v43 = v22;
  swift_getOpaqueTypeConformance2();
  uint64_t v23 = v34;
  sub_246A6AFE0();
  (*(void (**)(char *, uint64_t))(v14 + 8))(v17, v23);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v44);
  uint64_t KeyPath = swift_getKeyPath();
  id v26 = v38;
  uint64_t v25 = v39;
  uint64_t v27 = v41;
  (*(void (**)(char *, void, uint64_t))(v39 + 104))(v38, *MEMORY[0x263F220B0], v41);
  uint64_t v28 = __swift_instantiateConcreteTypeFromMangledName(&qword_2691BFF08);
  uint64_t v29 = v40;
  uint64_t v30 = (uint64_t *)(v40 + *(int *)(v28 + 36));
  uint64_t v31 = __swift_instantiateConcreteTypeFromMangledName(&qword_2691BFF10);
  (*(void (**)(char *, char *, uint64_t))(v25 + 16))((char *)v30 + *(int *)(v31 + 28), v26, v27);
  *uint64_t v30 = KeyPath;
  uint64_t v32 = v37;
  (*(void (**)(uint64_t, char *, uint64_t))(v18 + 16))(v29, v21, v37);
  (*(void (**)(char *, uint64_t))(v25 + 8))(v26, v27);
  return (*(uint64_t (**)(char *, uint64_t))(v18 + 8))(v21, v32);
}

uint64_t sub_246A66B94()
{
  return sub_246A6AFC0();
}

uint64_t sub_246A66BB8(uint64_t a1)
{
  uint64_t v2 = sub_246A6AF40();
  MEMORY[0x270FA5388](v2, v3);
  (*(void (**)(char *, uint64_t))(v5 + 16))((char *)&v7 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0), a1);
  return sub_246A6AFD0();
}

uint64_t sub_246A66C88()
{
  return sub_246A6B020();
}

uint64_t sub_246A66CA4@<X0>(uint64_t a1@<X8>)
{
  return sub_246A666F8(*v1, v1[1], v1[2], v1[3], a1);
}

uint64_t sub_246A66CB0()
{
  sub_246A6B190();
  uint64_t result = sub_246A6B150();
  qword_2691C0180 = result;
  return result;
}

float sub_246A66D58()
{
  uint64_t v1 = swift_allocObject();
  *(void *)(v1 + 16) = v0;
  sub_246A67244((uint64_t)&unk_2691BFF20, v1);
  float v3 = v2;
  swift_release();
  return v3;
}

uint64_t sub_246A66E44(float a1)
{
  uint64_t v3 = swift_allocObject();
  *(void *)(v3 + 16) = v1;
  *(float *)(v3 + 24) = a1;
  sub_246A67558((uint64_t)&unk_2691BFF30, v3);

  return swift_release();
}

uint64_t sub_246A66EBC(uint64_t a1)
{
  *(void *)(v1 + 40) = a1;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2691BFFB8);
  *(void *)(v1 + 48) = swift_task_alloc();
  return MEMORY[0x270FA2498](sub_246A66F50, 0, 0);
}

uint64_t sub_246A66F50()
{
  if (qword_2691C00C0 != -1) {
    swift_once();
  }
  uint64_t v1 = v0[6];
  float v2 = (void **)(qword_2691C0180 + *MEMORY[0x263F22388]);
  swift_beginAccess();
  uint64_t v3 = *v2;
  v0[7] = v3;
  uint64_t v4 = sub_246A6B160();
  (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 56))(v1, 1, 1, v4);
  v3;
  uint64_t v5 = (void *)swift_task_alloc();
  v0[8] = v5;
  void *v5 = v0;
  v5[1] = sub_246A670A0;
  uint64_t v6 = v0[6];
  return MEMORY[0x270F09EA0](v6);
}

uint64_t sub_246A670A0(float a1)
{
  float v2 = *(void **)(*(void *)v1 + 56);
  uint64_t v3 = *(void *)(*(void *)v1 + 48);
  *(float *)(*(void *)v1 + 72) = a1;
  swift_task_dealloc();

  sub_246A6620C(v3, &qword_2691BFFB8);
  return MEMORY[0x270FA2498](sub_246A671DC, 0, 0);
}

uint64_t sub_246A671DC()
{
  **(_DWORD **)(v0 + 40) = *(_DWORD *)(v0 + 72);
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

void sub_246A67244(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_246A6B060();
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x270FA5388](v4, v6);
  uint64_t v8 = &v18[-((v7 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_2691BFDE8);
  MEMORY[0x270FA5388](v9 - 8, v10);
  uint64_t v12 = &v18[-((v11 + 15) & 0xFFFFFFFFFFFFFFF0)];
  sub_246A6B230();
  if (v18[0] == 1) {
    goto LABEL_4;
  }
  dispatch_semaphore_t v13 = dispatch_semaphore_create(0);
  uint64_t v14 = swift_allocObject();
  *(_DWORD *)(v14 + 16) = 0;
  *(unsigned char *)(v14 + 20) = 1;
  uint64_t v15 = sub_246A6B100();
  (*(void (**)(unsigned char *, uint64_t, uint64_t, uint64_t))(*(void *)(v15 - 8) + 56))(v12, 1, 1, v15);
  uint64_t v16 = (void *)swift_allocObject();
  v16[2] = 0;
  v16[3] = 0;
  v16[4] = v14;
  v16[5] = a1;
  v16[6] = a2;
  v16[7] = v13;
  swift_retain();
  swift_retain();
  uint64_t v17 = v13;
  sub_246A684E8((uint64_t)v12, (uint64_t)&unk_2691BFFB0, (uint64_t)v16);
  swift_release();
  sub_246A6B050();
  sub_246A6B1B0();
  (*(void (**)(unsigned char *, uint64_t))(v5 + 8))(v8, v4);
  swift_beginAccess();
  if (*(unsigned char *)(v14 + 20))
  {
LABEL_4:
    sub_246A6B200();
    __break(1u);
  }
  else
  {
    swift_release();
  }
}

void sub_246A67558(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_246A6B060();
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x270FA5388](v4, v6);
  uint64_t v8 = &v18[-((v7 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_2691BFDE8);
  MEMORY[0x270FA5388](v9 - 8, v10);
  uint64_t v12 = &v18[-((v11 + 15) & 0xFFFFFFFFFFFFFFF0)];
  sub_246A6B230();
  if (v18[0] == 1) {
    goto LABEL_4;
  }
  dispatch_semaphore_t v13 = dispatch_semaphore_create(0);
  uint64_t v14 = swift_allocObject();
  *(unsigned char *)(v14 + 16) = 1;
  uint64_t v15 = sub_246A6B100();
  (*(void (**)(unsigned char *, uint64_t, uint64_t, uint64_t))(*(void *)(v15 - 8) + 56))(v12, 1, 1, v15);
  uint64_t v16 = (void *)swift_allocObject();
  v16[2] = 0;
  v16[3] = 0;
  v16[4] = v14;
  v16[5] = a1;
  v16[6] = a2;
  v16[7] = v13;
  swift_retain();
  swift_retain();
  uint64_t v17 = v13;
  sub_246A684E8((uint64_t)v12, (uint64_t)&unk_2691BFFA0, (uint64_t)v16);
  swift_release();
  sub_246A6B050();
  sub_246A6B1B0();
  (*(void (**)(unsigned char *, uint64_t))(v5 + 8))(v8, v4);
  swift_beginAccess();
  if (*(unsigned char *)(v14 + 16))
  {
LABEL_4:
    sub_246A6B200();
    __break(1u);
  }
  else
  {
    swift_release();
  }
}

uint64_t sub_246A67858(float a1)
{
  *(float *)(v1 + 56) = a1;
  return MEMORY[0x270FA2498](sub_246A67878, 0, 0);
}

uint64_t sub_246A67878()
{
  if (qword_2691C00C0 != -1) {
    swift_once();
  }
  uint64_t v1 = (void **)(qword_2691C0180 + *MEMORY[0x263F22388]);
  swift_beginAccess();
  float v2 = *v1;
  *(void *)(v0 + 40) = *v1;
  v2;
  uint64_t v3 = (void *)swift_task_alloc();
  *(void *)(v0 + 48) = v3;
  void *v3 = v0;
  v3[1] = sub_246A67980;
  v4.n128_u32[0] = *(_DWORD *)(v0 + 56);
  return MEMORY[0x270F09EB8](v4);
}

uint64_t sub_246A67980()
{
  uint64_t v1 = *(void **)(*v0 + 40);
  uint64_t v4 = *v0;
  swift_task_dealloc();

  float v2 = *(uint64_t (**)(void))(v4 + 8);
  return v2();
}

uint64_t (*sub_246A67A8C(uint64_t a1))(uint64_t *a1, char a2)
{
  *(void *)a1 = v1;
  uint64_t v3 = swift_allocObject();
  *(void *)(v3 + 16) = v1;
  sub_246A67244((uint64_t)&unk_2691BFF38, v3);
  int v5 = v4;
  swift_release();
  *(_DWORD *)(a1 + 8) = v5;
  return sub_246A67B24;
}

uint64_t sub_246A67B24(uint64_t *a1, char a2)
{
  uint64_t v2 = *a1;
  int v3 = *((_DWORD *)a1 + 2);
  if (a2)
  {
    uint64_t v4 = swift_allocObject();
    *(void *)(v4 + 16) = v2;
    *(_DWORD *)(v4 + 24) = v3;
    int v5 = &unk_2691BFF40;
  }
  else
  {
    uint64_t v4 = swift_allocObject();
    *(void *)(v4 + 16) = v2;
    *(_DWORD *)(v4 + 24) = v3;
    int v5 = &unk_2691BFF48;
  }
  sub_246A67558((uint64_t)v5, v4);

  return swift_release();
}

id sub_246A67C18(uint64_t a1)
{
  return sub_246A69140(a1, type metadata accessor for VOSettingsHelper);
}

void __swiftcall VoiceOverSpeechSwiftUI.make()(UIViewController *__return_ptr retstr)
{
}

uint64_t sub_246A67C88@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = sub_246A69AA8();
  *a1 = result;
  a1[1] = v3;
  a1[2] = v4;
  a1[3] = v5;
  return result;
}

id VoiceOverSpeechSwiftUI.__allocating_init(nibName:bundle:)(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v4 = v3;
  if (a2)
  {
    uint64_t v6 = (void *)sub_246A6B090();
    swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v6 = 0;
  }
  id v7 = objc_msgSend(objc_allocWithZone(v4), sel_initWithNibName_bundle_, v6, a3);

  return v7;
}

id VoiceOverSpeechSwiftUI.init(nibName:bundle:)(uint64_t a1, uint64_t a2, void *a3)
{
  if (a2)
  {
    uint64_t v5 = (void *)sub_246A6B090();
    swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v5 = 0;
  }
  v8.receiver = v3;
  v8.super_class = (Class)type metadata accessor for VoiceOverSpeechSwiftUI();
  id v6 = objc_msgSendSuper2(&v8, sel_initWithNibName_bundle_, v5, a3);

  return v6;
}

id VoiceOverSpeechSwiftUI.__allocating_init(coder:)(void *a1)
{
  id v3 = objc_msgSend(objc_allocWithZone(v1), sel_initWithCoder_, a1);

  return v3;
}

id VoiceOverSpeechSwiftUI.init(coder:)(void *a1)
{
  v5.receiver = v1;
  v5.super_class = (Class)type metadata accessor for VoiceOverSpeechSwiftUI();
  id v3 = objc_msgSendSuper2(&v5, sel_initWithCoder_, a1);

  return v3;
}

id VoiceOverSpeechSwiftUI.__deallocating_deinit(uint64_t a1)
{
  return sub_246A69140(a1, type metadata accessor for VoiceOverSpeechSwiftUI);
}

uint64_t sub_246A67FA4@<X0>(uint64_t a1@<X0>, BOOL *a2@<X8>)
{
  uint64_t v4 = sub_246A6B140();
  uint64_t result = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 48))(a1, 1, v4);
  *a2 = result != 1;
  return result;
}

uint64_t sub_246A68020(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, int *a5, uint64_t a6, uint64_t a7)
{
  v7[5] = a4;
  v7[6] = a7;
  uint64_t v10 = (uint64_t (*)(void *))((char *)a5 + *a5);
  objc_super v8 = (void *)swift_task_alloc();
  v7[7] = v8;
  void *v8 = v7;
  v8[1] = sub_246A68100;
  return v10(v7 + 8);
}

uint64_t sub_246A68100()
{
  uint64_t v1 = *v0;
  swift_task_dealloc();
  *(_DWORD *)(v1 + 68) = *(_DWORD *)(v1 + 64);
  return MEMORY[0x270FA2498](sub_246A68204, 0, 0);
}

uint64_t sub_246A68204()
{
  int v1 = *(_DWORD *)(v0 + 68);
  uint64_t v2 = *(void *)(v0 + 40);
  swift_beginAccess();
  *(_DWORD *)(v2 + 16) = v1;
  *(unsigned char *)(v2 + 20) = 0;
  sub_246A6B1C0();
  uint64_t v3 = *(uint64_t (**)(void))(v0 + 8);
  return v3();
}

uint64_t sub_246A6828C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, int *a5, uint64_t a6, uint64_t a7)
{
  v7[5] = a4;
  v7[6] = a7;
  uint64_t v10 = (uint64_t (*)(void *))((char *)a5 + *a5);
  objc_super v8 = (void *)swift_task_alloc();
  v7[7] = v8;
  void *v8 = v7;
  v8[1] = sub_246A6836C;
  return v10(v7 + 8);
}

uint64_t sub_246A6836C()
{
  swift_task_dealloc();
  return MEMORY[0x270FA2498](sub_246A68468, 0, 0);
}

uint64_t sub_246A68468()
{
  uint64_t v1 = *(void *)(v0 + 40);
  *(unsigned char *)(v0 + 64) = 0;
  swift_beginAccess();
  *(unsigned char *)(v1 + 16) = *(unsigned char *)(v0 + 64);
  sub_246A6B1C0();
  uint64_t v2 = *(uint64_t (**)(void))(v0 + 8);
  return v2();
}

uint64_t sub_246A684E8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_246A6B100();
  uint64_t v7 = *(void *)(v6 - 8);
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v7 + 48))(a1, 1, v6) != 1)
  {
    sub_246A6B0F0();
    (*(void (**)(uint64_t, uint64_t))(v7 + 8))(a1, v6);
    if (!*(void *)(a3 + 16)) {
      goto LABEL_5;
    }
    goto LABEL_3;
  }
  sub_246A6620C(a1, &qword_2691BFDE8);
  if (*(void *)(a3 + 16))
  {
LABEL_3:
    swift_getObjectType();
    swift_unknownObjectRetain();
    sub_246A6B0E0();
    swift_unknownObjectRelease();
  }
LABEL_5:
  uint64_t v8 = swift_allocObject();
  *(void *)(v8 + 16) = a2;
  *(void *)(v8 + 24) = a3;
  return swift_task_create();
}

void sub_246A68694()
{
  id v1 = objc_msgSend(self, sel_defaultCenter);
  uint64_t v2 = (void *)sub_246A6B090();
  objc_msgSend(v1, sel_addObserver_selector_name_object_, v0, sel_nanoPrefsChanged, v2, 0);

  sub_246A688E8();
}

void sub_246A6873C()
{
  id v1 = objc_msgSend(self, sel_defaultCenter);
  objc_msgSend(v1, sel_removeObserver_, v0);
}

void sub_246A687A0()
{
  uint64_t v0 = self;
  sub_246A6AFB0();
  id v1 = (id)sub_246A6B090();
  swift_bridgeObjectRelease();
  objc_msgSend(v0, sel_setGizmoAccessibilityPref_forKey_, v1, *MEMORY[0x263F22B78]);
}

void sub_246A68824()
{
  uint64_t v0 = self;
  sub_246A6AFB0();
  id v1 = (void *)sub_246A6B090();
  swift_bridgeObjectRelease();
  objc_msgSend(v0, sel_setGizmoAccessibilityPref_forKey_, v1, *MEMORY[0x263F22B80]);

  sub_246A6AFB0();
  id v2 = (id)sub_246A6B090();
  swift_bridgeObjectRelease();
  objc_msgSend(v0, sel_setGizmoAccessibilityPref_forKey_, v2, *MEMORY[0x263F22B70]);
}

void sub_246A688E8()
{
  uint64_t v1 = v0;
  id v2 = objc_msgSend(self, sel_accessibilityDomainAccessor);
  if (!v2) {
    goto LABEL_45;
  }
  uint64_t v3 = v2;
  uint64_t v4 = *MEMORY[0x263F22B68];
  id v5 = objc_msgSend(v2, sel_dictionaryForKey_, *MEMORY[0x263F22B68]);

  if (v5)
  {
    uint64_t v6 = sub_246A6B070();

    sub_246A68D54(v6);
    uint64_t v8 = v7;
    swift_bridgeObjectRelease();
    if (v8)
    {
      uint64_t v9 = (uint64_t *)(v1 + qword_2691BFED0);
      swift_beginAccess();
      uint64_t v10 = *v9;
      swift_bridgeObjectRetain();
      sub_246A69188(v8, v10);
      char v12 = v11;
      swift_bridgeObjectRelease();
      if (v12)
      {
        swift_bridgeObjectRelease();
        return;
      }
      *uint64_t v9 = v8;
      swift_bridgeObjectRelease();
      dispatch_semaphore_t v13 = (uint64_t *)(v1 + qword_2691BFED0);
      swift_beginAccess();
      uint64_t v14 = *v13;
      if (*(void *)(*v13 + 16))
      {
        uint64_t v38 = v4;
        uint64_t v39 = v14 + 64;
        uint64_t v15 = 1 << *(unsigned char *)(v14 + 32);
        uint64_t v16 = -1;
        if (v15 < 64) {
          uint64_t v16 = ~(-1 << v15);
        }
        unint64_t v17 = v16 & *(void *)(v14 + 64);
        int64_t v40 = (unint64_t)(v15 + 63) >> 6;
        swift_bridgeObjectRetain();
        int64_t v18 = 0;
        uint64_t v19 = &selRef_dialectForLanguageID_;
        if (v17) {
          goto LABEL_13;
        }
LABEL_14:
        int64_t v22 = v18 + 1;
        if (__OFADD__(v18, 1))
        {
          __break(1u);
LABEL_44:
          __break(1u);
LABEL_45:
          __break(1u);
          goto LABEL_46;
        }
        if (v22 >= v40) {
          goto LABEL_40;
        }
        unint64_t v23 = *(void *)(v39 + 8 * v22);
        ++v18;
        if (!v23)
        {
          int64_t v18 = v22 + 1;
          if (v22 + 1 >= v40) {
            goto LABEL_40;
          }
          unint64_t v23 = *(void *)(v39 + 8 * v18);
          if (v23) {
            goto LABEL_27;
          }
          int64_t v18 = v22 + 2;
          if (v22 + 2 >= v40)
          {
LABEL_40:
            swift_release();
            id v36 = objc_msgSend(self, sel_accessibilityDomainAccessor);
            if (!v36)
            {
LABEL_46:
              __break(1u);
              return;
            }
            uint64_t v37 = v36;
            objc_msgSend(v36, sel_removeObjectForKey_, v38);

            return;
          }
          unint64_t v23 = *(void *)(v39 + 8 * v18);
          if (!v23)
          {
            int64_t v24 = v22 + 3;
            if (v24 < v40)
            {
              unint64_t v23 = *(void *)(v39 + 8 * v24);
              if (v23)
              {
                int64_t v18 = v24;
                goto LABEL_27;
              }
              while (1)
              {
                int64_t v18 = v24 + 1;
                if (__OFADD__(v24, 1)) {
                  goto LABEL_44;
                }
                if (v18 >= v40) {
                  goto LABEL_40;
                }
                unint64_t v23 = *(void *)(v39 + 8 * v18);
                ++v24;
                if (v23) {
                  goto LABEL_27;
                }
              }
            }
            goto LABEL_40;
          }
        }
LABEL_27:
        unint64_t v17 = (v23 - 1) & v23;
        for (unint64_t i = __clz(__rbit64(v23)) + (v18 << 6); ; unint64_t i = v20 | (v18 << 6))
        {
          uint64_t v25 = (uint64_t *)(*(void *)(v14 + 48) + 16 * i);
          uint64_t v27 = *v25;
          uint64_t v26 = v25[1];
          uint64_t v28 = *(void **)(*(void *)(v14 + 56) + 8 * i);
          swift_bridgeObjectRetain();
          id v29 = v28;
          if ([v29 v19[106]] == (id)1)
          {
            sub_246A6AF80();
          }
          else if ([v29 v19[106]] == (id)-1)
          {
            sub_246A6AF60();
          }
          else
          {
            if ([v29 v19[106]] != (id)-2)
            {
              objc_msgSend(v29, sel_floatValue);
              sub_246A6AF90();
              swift_bridgeObjectRelease();

              if (!v17) {
                goto LABEL_14;
              }
              goto LABEL_13;
            }
            sub_246A6AF70();
          }
          swift_beginAccess();
          swift_bridgeObjectRetain();
          unint64_t v30 = sub_246A69370(v27, v26);
          char v32 = v31;
          swift_bridgeObjectRelease();
          if (v32)
          {
            char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
            uint64_t v34 = *v13;
            uint64_t v41 = *v13;
            *dispatch_semaphore_t v13 = 0x8000000000000000;
            if ((isUniquelyReferenced_nonNull_native & 1) == 0)
            {
              sub_246A696A4();
              uint64_t v34 = v41;
            }
            swift_bridgeObjectRelease();
            uint64_t v35 = *(void **)(*(void *)(v34 + 56) + 8 * v30);
            sub_246A694CC(v30, v34);
            *dispatch_semaphore_t v13 = v34;
            swift_bridgeObjectRelease();
            swift_bridgeObjectRelease();
          }
          else
          {
            swift_bridgeObjectRelease();
          }
          swift_endAccess();
          uint64_t v19 = &selRef_dialectForLanguageID_;

          if (!v17) {
            goto LABEL_14;
          }
LABEL_13:
          unint64_t v20 = __clz(__rbit64(v17));
          v17 &= v17 - 1;
        }
      }
    }
  }
}

void sub_246A68D54(uint64_t a1)
{
  uint64_t v1 = a1;
  if (*(void *)(a1 + 16))
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_2691BFF68);
    id v2 = (void *)sub_246A6B220();
  }
  else
  {
    id v2 = (void *)MEMORY[0x263F8EE80];
  }
  uint64_t v30 = v1 + 64;
  uint64_t v3 = -1;
  uint64_t v4 = -1 << *(unsigned char *)(v1 + 32);
  if (-v4 < 64) {
    uint64_t v3 = ~(-1 << -(char)v4);
  }
  unint64_t v5 = v3 & *(void *)(v1 + 64);
  int64_t v29 = (unint64_t)(63 - v4) >> 6;
  uint64_t v6 = &v35;
  swift_bridgeObjectRetain();
  int64_t v7 = 0;
  uint64_t v8 = (uint64_t *)&unk_2691BFF70;
  while (1)
  {
    if (v5)
    {
      uint64_t v31 = (v5 - 1) & v5;
      unint64_t v14 = __clz(__rbit64(v5)) | (v7 << 6);
      int64_t v15 = v7;
    }
    else
    {
      int64_t v16 = v7 + 1;
      if (__OFADD__(v7, 1)) {
        goto LABEL_36;
      }
      if (v16 >= v29)
      {
LABEL_33:
        sub_246A6A70C();
        return;
      }
      unint64_t v17 = *(void *)(v30 + 8 * v16);
      int64_t v15 = v7 + 1;
      if (!v17)
      {
        int64_t v15 = v7 + 2;
        if (v7 + 2 >= v29) {
          goto LABEL_33;
        }
        unint64_t v17 = *(void *)(v30 + 8 * v15);
        if (!v17)
        {
          int64_t v15 = v7 + 3;
          if (v7 + 3 >= v29) {
            goto LABEL_33;
          }
          unint64_t v17 = *(void *)(v30 + 8 * v15);
          if (!v17)
          {
            int64_t v15 = v7 + 4;
            if (v7 + 4 >= v29) {
              goto LABEL_33;
            }
            unint64_t v17 = *(void *)(v30 + 8 * v15);
            if (!v17)
            {
              int64_t v18 = v7 + 5;
              if (v7 + 5 >= v29) {
                goto LABEL_33;
              }
              unint64_t v17 = *(void *)(v30 + 8 * v18);
              if (!v17)
              {
                while (1)
                {
                  int64_t v15 = v18 + 1;
                  if (__OFADD__(v18, 1)) {
                    goto LABEL_37;
                  }
                  if (v15 >= v29) {
                    goto LABEL_33;
                  }
                  unint64_t v17 = *(void *)(v30 + 8 * v15);
                  ++v18;
                  if (v17) {
                    goto LABEL_26;
                  }
                }
              }
              int64_t v15 = v7 + 5;
            }
          }
        }
      }
LABEL_26:
      uint64_t v31 = (v17 - 1) & v17;
      unint64_t v14 = __clz(__rbit64(v17)) + (v15 << 6);
    }
    uint64_t v19 = (uint64_t *)(*(void *)(v1 + 48) + 16 * v14);
    uint64_t v20 = *v19;
    uint64_t v21 = v19[1];
    sub_246A66268(*(void *)(v1 + 56) + 32 * v14, (uint64_t)v6);
    v34[0] = v20;
    v34[1] = v21;
    sub_246A66268((uint64_t)v6, (uint64_t)v33);
    swift_bridgeObjectRetain_n();
    sub_246A6620C((uint64_t)v34, v8);
    sub_246A6A6CC();
    if (!swift_dynamicCast())
    {
      swift_bridgeObjectRelease();

      sub_246A6A70C();
      swift_release();
      return;
    }
    unint64_t v22 = sub_246A69370(v20, v21);
    unint64_t v23 = v22;
    if (v24)
    {
      uint64_t v9 = v6;
      uint64_t v10 = v1;
      char v11 = v8;
      char v12 = (uint64_t *)(v2[6] + 16 * v22);
      swift_bridgeObjectRelease();
      *char v12 = v20;
      v12[1] = v21;
      uint64_t v13 = v2[7];

      *(void *)(v13 + 8 * v23) = v32;
      uint64_t v8 = v11;
      uint64_t v1 = v10;
      uint64_t v6 = v9;
      goto LABEL_8;
    }
    if (v2[2] >= v2[3]) {
      break;
    }
    *(void *)((char *)v2 + ((v22 >> 3) & 0x1FFFFFFFFFFFFFF8) + 64) |= 1 << v22;
    uint64_t v25 = (uint64_t *)(v2[6] + 16 * v22);
    *uint64_t v25 = v20;
    v25[1] = v21;
    *(void *)(v2[7] + 8 * v22) = v32;
    uint64_t v26 = v2[2];
    BOOL v27 = __OFADD__(v26, 1);
    uint64_t v28 = v26 + 1;
    if (v27) {
      goto LABEL_35;
    }
    v2[2] = v28;
LABEL_8:
    int64_t v7 = v15;
    unint64_t v5 = v31;
  }
  __break(1u);
LABEL_35:
  __break(1u);
LABEL_36:
  __break(1u);
LABEL_37:
  __break(1u);
}

void sub_246A690CC(void *a1)
{
  id v1 = a1;
  sub_246A688E8();
}

uint64_t sub_246A69114()
{
  return swift_bridgeObjectRelease();
}

id sub_246A69124()
{
  return sub_246A69140(0, type metadata accessor for BridgeCoreSynthesisVoicePickableFetcher);
}

id sub_246A69140(uint64_t a1, uint64_t (*a2)(void))
{
  v4.receiver = v2;
  v4.super_class = (Class)a2();
  return objc_msgSendSuper2(&v4, sel_dealloc);
}

uint64_t sub_246A69178()
{
  return swift_bridgeObjectRelease();
}

void sub_246A69188(uint64_t a1, uint64_t a2)
{
  if (a1 == a2 || *(void *)(a1 + 16) != *(void *)(a2 + 16)) {
    return;
  }
  int64_t v4 = 0;
  uint64_t v5 = a1 + 64;
  uint64_t v6 = 1 << *(unsigned char *)(a1 + 32);
  uint64_t v7 = -1;
  if (v6 < 64) {
    uint64_t v7 = ~(-1 << v6);
  }
  unint64_t v8 = v7 & *(void *)(a1 + 64);
  int64_t v9 = (unint64_t)(v6 + 63) >> 6;
  while (1)
  {
    if (v8)
    {
      unint64_t v10 = __clz(__rbit64(v8));
      v8 &= v8 - 1;
      unint64_t v11 = v10 | (v4 << 6);
      goto LABEL_24;
    }
    int64_t v12 = v4 + 1;
    if (__OFADD__(v4, 1))
    {
      __break(1u);
      goto LABEL_31;
    }
    if (v12 >= v9) {
      return;
    }
    unint64_t v13 = *(void *)(v5 + 8 * v12);
    ++v4;
    if (!v13)
    {
      int64_t v4 = v12 + 1;
      if (v12 + 1 >= v9) {
        return;
      }
      unint64_t v13 = *(void *)(v5 + 8 * v4);
      if (!v13)
      {
        int64_t v4 = v12 + 2;
        if (v12 + 2 >= v9) {
          return;
        }
        unint64_t v13 = *(void *)(v5 + 8 * v4);
        if (!v13)
        {
          int64_t v4 = v12 + 3;
          if (v12 + 3 >= v9) {
            return;
          }
          unint64_t v13 = *(void *)(v5 + 8 * v4);
          if (!v13) {
            break;
          }
        }
      }
    }
LABEL_23:
    unint64_t v8 = (v13 - 1) & v13;
    unint64_t v11 = __clz(__rbit64(v13)) + (v4 << 6);
LABEL_24:
    int64_t v15 = (uint64_t *)(*(void *)(a1 + 48) + 16 * v11);
    uint64_t v16 = *v15;
    uint64_t v17 = v15[1];
    int64_t v18 = *(void **)(*(void *)(a1 + 56) + 8 * v11);
    swift_bridgeObjectRetain();
    id v19 = v18;
    unint64_t v20 = sub_246A69370(v16, v17);
    char v22 = v21;
    swift_bridgeObjectRelease();
    if ((v22 & 1) == 0)
    {

      return;
    }
    sub_246A6A6CC();
    id v23 = *(id *)(*(void *)(a2 + 56) + 8 * v20);
    char v24 = sub_246A6B1D0();

    if ((v24 & 1) == 0) {
      return;
    }
  }
  int64_t v14 = v12 + 4;
  if (v14 >= v9) {
    return;
  }
  unint64_t v13 = *(void *)(v5 + 8 * v14);
  if (v13)
  {
    int64_t v4 = v14;
    goto LABEL_23;
  }
  while (1)
  {
    int64_t v4 = v14 + 1;
    if (__OFADD__(v14, 1)) {
      break;
    }
    if (v4 >= v9) {
      return;
    }
    unint64_t v13 = *(void *)(v5 + 8 * v4);
    ++v14;
    if (v13) {
      goto LABEL_23;
    }
  }
LABEL_31:
  __break(1u);
}

unint64_t sub_246A69370(uint64_t a1, uint64_t a2)
{
  sub_246A6B250();
  sub_246A6B0B0();
  uint64_t v4 = sub_246A6B260();

  return sub_246A693E8(a1, a2, v4);
}

unint64_t sub_246A693E8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = v3 + 64;
  uint64_t v5 = -1 << *(unsigned char *)(v3 + 32);
  unint64_t v6 = a3 & ~v5;
  if ((*(void *)(v3 + 64 + ((v6 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v6))
  {
    uint64_t v9 = *(void *)(v3 + 48);
    unint64_t v10 = (void *)(v9 + 16 * v6);
    BOOL v11 = *v10 == a1 && v10[1] == a2;
    if (!v11 && (sub_246A6B240() & 1) == 0)
    {
      uint64_t v12 = ~v5;
      do
      {
        unint64_t v6 = (v6 + 1) & v12;
        if (((*(void *)(v4 + ((v6 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v6) & 1) == 0) {
          break;
        }
        unint64_t v13 = (void *)(v9 + 16 * v6);
        BOOL v14 = *v13 == a1 && v13[1] == a2;
      }
      while (!v14 && (sub_246A6B240() & 1) == 0);
    }
  }
  return v6;
}

unint64_t sub_246A694CC(unint64_t result, uint64_t a2)
{
  int64_t v3 = result;
  uint64_t v4 = a2 + 64;
  uint64_t v5 = -1 << *(unsigned char *)(a2 + 32);
  unint64_t v6 = (result + 1) & ~v5;
  if (((1 << v6) & *(void *)(a2 + 64 + 8 * (v6 >> 6))) != 0)
  {
    uint64_t v7 = ~v5;
    uint64_t result = sub_246A6B1F0();
    if ((*(void *)(v4 + 8 * (v6 >> 6)) & (1 << v6)) != 0)
    {
      unint64_t v8 = (result + 1) & v7;
      do
      {
        sub_246A6B250();
        swift_bridgeObjectRetain();
        sub_246A6B0B0();
        uint64_t v9 = sub_246A6B260();
        uint64_t result = swift_bridgeObjectRelease();
        unint64_t v10 = v9 & v7;
        if (v3 >= (uint64_t)v8)
        {
          if (v10 < v8) {
            goto LABEL_5;
          }
        }
        else if (v10 >= v8)
        {
          goto LABEL_11;
        }
        if (v3 >= (uint64_t)v10)
        {
LABEL_11:
          uint64_t v11 = *(void *)(a2 + 48);
          uint64_t v12 = (_OWORD *)(v11 + 16 * v3);
          unint64_t v13 = (_OWORD *)(v11 + 16 * v6);
          if (v3 != v6 || v12 >= v13 + 1) {
            *uint64_t v12 = *v13;
          }
          uint64_t v14 = *(void *)(a2 + 56);
          int64_t v15 = (void *)(v14 + 8 * v3);
          uint64_t v16 = (void *)(v14 + 8 * v6);
          if (v3 != v6 || (int64_t v3 = v6, v15 >= v16 + 1))
          {
            *int64_t v15 = *v16;
            int64_t v3 = v6;
          }
        }
LABEL_5:
        unint64_t v6 = (v6 + 1) & v7;
      }
      while (((*(void *)(v4 + ((v6 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v6) & 1) != 0);
    }
    uint64_t v17 = (uint64_t *)(v4 + 8 * ((unint64_t)v3 >> 6));
    uint64_t v18 = *v17;
    uint64_t v19 = (-1 << v3) - 1;
  }
  else
  {
    uint64_t v17 = (uint64_t *)(v4 + 8 * (result >> 6));
    uint64_t v19 = *v17;
    uint64_t v18 = (-1 << result) - 1;
  }
  uint64_t *v17 = v19 & v18;
  uint64_t v20 = *(void *)(a2 + 16);
  BOOL v21 = __OFSUB__(v20, 1);
  uint64_t v22 = v20 - 1;
  if (v21)
  {
    __break(1u);
  }
  else
  {
    *(void *)(a2 + 16) = v22;
    ++*(_DWORD *)(a2 + 36);
  }
  return result;
}

id sub_246A696A4()
{
  id v1 = v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2691BFF68);
  uint64_t v2 = *v0;
  uint64_t v3 = sub_246A6B210();
  uint64_t v4 = v3;
  if (!*(void *)(v2 + 16))
  {
LABEL_26:
    id result = (id)swift_release();
    uint64_t *v1 = v4;
    return result;
  }
  id result = (id)(v3 + 64);
  uint64_t v6 = v2 + 64;
  unint64_t v7 = (unint64_t)((1 << *(unsigned char *)(v4 + 32)) + 63) >> 6;
  if (v4 != v2 || (unint64_t)result >= v2 + 64 + 8 * v7) {
    id result = memmove(result, (const void *)(v2 + 64), 8 * v7);
  }
  int64_t v9 = 0;
  *(void *)(v4 + 16) = *(void *)(v2 + 16);
  uint64_t v10 = 1 << *(unsigned char *)(v2 + 32);
  uint64_t v11 = -1;
  if (v10 < 64) {
    uint64_t v11 = ~(-1 << v10);
  }
  unint64_t v12 = v11 & *(void *)(v2 + 64);
  int64_t v13 = (unint64_t)(v10 + 63) >> 6;
  while (1)
  {
    if (v12)
    {
      unint64_t v14 = __clz(__rbit64(v12));
      v12 &= v12 - 1;
      unint64_t v15 = v14 | (v9 << 6);
      goto LABEL_12;
    }
    int64_t v22 = v9 + 1;
    if (__OFADD__(v9, 1))
    {
      __break(1u);
      goto LABEL_28;
    }
    if (v22 >= v13) {
      goto LABEL_26;
    }
    unint64_t v23 = *(void *)(v6 + 8 * v22);
    ++v9;
    if (!v23)
    {
      int64_t v9 = v22 + 1;
      if (v22 + 1 >= v13) {
        goto LABEL_26;
      }
      unint64_t v23 = *(void *)(v6 + 8 * v9);
      if (!v23) {
        break;
      }
    }
LABEL_25:
    unint64_t v12 = (v23 - 1) & v23;
    unint64_t v15 = __clz(__rbit64(v23)) + (v9 << 6);
LABEL_12:
    uint64_t v16 = 16 * v15;
    uint64_t v17 = (void *)(*(void *)(v2 + 48) + 16 * v15);
    uint64_t v18 = v17[1];
    uint64_t v19 = 8 * v15;
    uint64_t v20 = *(void **)(*(void *)(v2 + 56) + v19);
    BOOL v21 = (void *)(*(void *)(v4 + 48) + v16);
    *BOOL v21 = *v17;
    v21[1] = v18;
    *(void *)(*(void *)(v4 + 56) + v19) = v20;
    swift_bridgeObjectRetain();
    id result = v20;
  }
  int64_t v24 = v22 + 2;
  if (v24 >= v13) {
    goto LABEL_26;
  }
  unint64_t v23 = *(void *)(v6 + 8 * v24);
  if (v23)
  {
    int64_t v9 = v24;
    goto LABEL_25;
  }
  while (1)
  {
    int64_t v9 = v24 + 1;
    if (__OFADD__(v24, 1)) {
      break;
    }
    if (v9 >= v13) {
      goto LABEL_26;
    }
    unint64_t v23 = *(void *)(v6 + 8 * v9);
    ++v24;
    if (v23) {
      goto LABEL_25;
    }
  }
LABEL_28:
  __break(1u);
  return result;
}

uint64_t sub_246A69858(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  uint64_t v26 = a4;
  uint64_t v27 = a5;
  uint64_t v25 = a2;
  uint64_t v11 = sub_246A6AF50();
  uint64_t v12 = *(void *)(v11 - 8);
  MEMORY[0x270FA5388]();
  unint64_t v14 = (char *)&v24 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v15 = sub_246A6AEE0();
  uint64_t v16 = *(void *)(v15 - 8);
  MEMORY[0x270FA5388]();
  uint64_t v18 = (char *)&v24 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  v29[3] = a6;
  v29[4] = a7;
  boxed_opaque_existential_1 = __swift_allocate_boxed_opaque_existential_1(v29);
  (*(void (**)(uint64_t *, uint64_t, uint64_t))(*(void *)(a6 - 8) + 32))(boxed_opaque_existential_1, a1, a6);
  uint64_t v20 = (char *)objc_allocWithZone((Class)type metadata accessor for BridgeCoreSynthesisVoicePickableFetcher());
  *(void *)&v20[qword_2691BFED0] = MEMORY[0x263F8EE80];
  sub_246A66584((uint64_t)v29, (uint64_t)v28);
  uint64_t v21 = v25;
  (*(void (**)(char *, uint64_t, uint64_t))(v16 + 16))(v18, v25, v15);
  (*(void (**)(char *, uint64_t, uint64_t))(v12 + 16))(v14, a3, v11);
  uint64_t v22 = sub_246A6AFA0();
  (*(void (**)(uint64_t, uint64_t))(v12 + 8))(a3, v11);
  (*(void (**)(uint64_t, uint64_t))(v16 + 8))(v21, v15);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v29);
  return v22;
}

uint64_t sub_246A69AA8()
{
  uint64_t v0 = sub_246A6AEE0();
  uint64_t v30 = *(void *)(v0 - 8);
  uint64_t v2 = MEMORY[0x270FA5388](v0, v1);
  uint64_t v4 = (char *)&v28 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v2, v5);
  unint64_t v7 = (char *)&v28 - v6;
  uint64_t v8 = sub_246A6AF50();
  uint64_t v9 = *(void *)(v8 - 8);
  uint64_t v11 = MEMORY[0x270FA5388](v8, v10);
  uint64_t v13 = (char *)&v28 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v11, v14);
  uint64_t v16 = (char *)&v28 - v15;
  if (qword_2691C00B0 != -1) {
    swift_once();
  }
  swift_beginAccess();
  uint64_t v17 = qword_2691C0170;
  (*(void (**)(char *, void, uint64_t))(v9 + 104))(v16, *MEMORY[0x263F7F200], v8);
  v32[0] = MEMORY[0x263F8EE78];
  sub_246A6653C(&qword_2691BFEB8, MEMORY[0x263F7EE20]);
  uint64_t v29 = v8;
  swift_retain();
  __swift_instantiateConcreteTypeFromMangledName(&qword_2691BFEC0);
  sub_246A6A5D4(&qword_2691BFEC8, &qword_2691BFEC0);
  sub_246A6B1E0();
  v32[3] = type metadata accessor for BridgeVoiceSource();
  v32[4] = sub_246A6653C(&qword_2691BFE18, (void (*)(uint64_t))type metadata accessor for BridgeVoiceSource);
  v32[0] = v17;
  Class v28 = (Class)type metadata accessor for BridgeCoreSynthesisVoicePickableFetcher();
  uint64_t v18 = (char *)objc_allocWithZone(v28);
  *(void *)&v18[qword_2691BFED0] = MEMORY[0x263F8EE80];
  sub_246A66584((uint64_t)v32, (uint64_t)v31);
  uint64_t v19 = v30;
  uint64_t v20 = v7;
  (*(void (**)(char *, char *, uint64_t))(v30 + 16))(v4, v7, v0);
  uint64_t v21 = v0;
  uint64_t v22 = v29;
  (*(void (**)(char *, char *, uint64_t))(v9 + 16))(v13, v16, v29);
  swift_retain();
  uint64_t v23 = sub_246A6AFA0();
  (*(void (**)(char *, uint64_t))(v9 + 8))(v16, v22);
  (*(void (**)(char *, uint64_t))(v19 + 8))(v20, v21);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v32);
  swift_release();
  v31[0] = v23;
  sub_246A6B030();
  uint64_t v24 = v32[0];
  if (qword_2691C00C0 != -1) {
    swift_once();
  }
  uint64_t v25 = (void *)qword_2691C0180;
  v31[0] = qword_2691C0180;
  sub_246A6B190();
  id v26 = v25;
  sub_246A6B030();
  return v24;
}

uint64_t sub_246A69F08()
{
  return MEMORY[0x270FA0238](v0, 24, 7);
}

uint64_t sub_246A69F18(uint64_t a1)
{
  uint64_t v3 = (void *)swift_task_alloc();
  *(void *)(v1 + 16) = v3;
  void *v3 = v1;
  v3[1] = sub_246A662C8;
  return sub_246A66EBC(a1);
}

uint64_t sub_246A69FB0()
{
  return MEMORY[0x270FA0238](v0, 28, 7);
}

uint64_t sub_246A69FC0()
{
  int v2 = *(_DWORD *)(v0 + 24);
  uint64_t v3 = swift_task_alloc();
  *(void *)(v1 + 16) = v3;
  *(void *)uint64_t v3 = v1;
  *(void *)(v3 + 8) = sub_246A662C8;
  *(_DWORD *)(v3 + 56) = v2;
  return MEMORY[0x270FA2498](sub_246A67878, 0, 0);
}

uint64_t sub_246A6A06C()
{
  return MEMORY[0x270FA0238](v0, 24, 7);
}

uint64_t sub_246A6A07C(uint64_t a1)
{
  uint64_t v3 = (void *)swift_task_alloc();
  *(void *)(v1 + 16) = v3;
  void *v3 = v1;
  v3[1] = sub_246A65D90;
  return sub_246A66EBC(a1);
}

uint64_t sub_246A6A114()
{
  return MEMORY[0x270FA0238](v0, 28, 7);
}

uint64_t sub_246A6A124()
{
  return MEMORY[0x270FA0238](v0, 28, 7);
}

uint64_t type metadata accessor for VOSettingsHelper()
{
  return self;
}

unint64_t sub_246A6A158()
{
  unint64_t result = qword_2691BFF50;
  if (!qword_2691BFF50)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2691BFF50);
  }
  return result;
}

uint64_t type metadata accessor for VoiceOverSpeechSwiftUI()
{
  return self;
}

uint64_t sub_246A6A1D0()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t initializeBufferWithCopyOfBuffer for VoiceOverSpeechWrapperView(uint64_t *a1, uint64_t *a2)
{
  uint64_t v2 = *a2;
  *a1 = *a2;
  uint64_t v3 = v2 + 16;
  swift_retain();
  return v3;
}

uint64_t destroy for VoiceOverSpeechWrapperView(id *a1)
{
  swift_release();

  return swift_release();
}

void *initializeWithCopy for VoiceOverSpeechWrapperView(void *a1, uint64_t a2)
{
  uint64_t v3 = *(void **)a2;
  uint64_t v4 = *(void *)(a2 + 8);
  *a1 = *(void *)a2;
  a1[1] = v4;
  uint64_t v6 = *(void **)(a2 + 16);
  uint64_t v5 = *(void *)(a2 + 24);
  a1[2] = v6;
  a1[3] = v5;
  id v7 = v3;
  swift_retain();
  id v8 = v6;
  swift_retain();
  return a1;
}

uint64_t assignWithCopy for VoiceOverSpeechWrapperView(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = *(void **)a2;
  uint64_t v5 = *(void **)a1;
  *(void *)a1 = *(void *)a2;
  id v6 = v4;

  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  swift_retain();
  swift_release();
  id v7 = *(void **)(a2 + 16);
  id v8 = *(void **)(a1 + 16);
  *(void *)(a1 + 16) = v7;
  id v9 = v7;

  *(void *)(a1 + 24) = *(void *)(a2 + 24);
  swift_retain();
  swift_release();
  return a1;
}

__n128 __swift_memcpy32_8(_OWORD *a1, uint64_t a2)
{
  __n128 result = *(__n128 *)a2;
  long long v3 = *(_OWORD *)(a2 + 16);
  *a1 = *(_OWORD *)a2;
  a1[1] = v3;
  return result;
}

id *assignWithTake for VoiceOverSpeechWrapperView(id *a1, _OWORD *a2)
{
  *(_OWORD *)a1 = *a2;
  swift_release();

  *((_OWORD *)a1 + 1) = a2[1];
  swift_release();
  return a1;
}

uint64_t getEnumTagSinglePayload for VoiceOverSpeechWrapperView(uint64_t *a1, int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0 && *((unsigned char *)a1 + 32)) {
    return *(_DWORD *)a1 + 0x80000000;
  }
  uint64_t v2 = *a1;
  if ((unint64_t)*a1 >= 0xFFFFFFFF) {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for VoiceOverSpeechWrapperView(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(void *)(result + 16) = 0;
    *(void *)(result + 24) = 0;
    *(void *)__n128 result = a2 ^ 0x80000000;
    *(void *)(result + 8) = 0;
    if (a3 < 0) {
      *(unsigned char *)(result + 32) = 1;
    }
  }
  else
  {
    if ((a3 & 0x80000000) == 0)
    {
      if (!a2) {
        return result;
      }
LABEL_8:
      *(void *)__n128 result = (a2 - 1);
      return result;
    }
    *(unsigned char *)(result + 32) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for VoiceOverSpeechWrapperView()
{
  return &type metadata for VoiceOverSpeechWrapperView;
}

uint64_t sub_246A6A444()
{
  return swift_initClassMetadata2();
}

uint64_t sub_246A6A494()
{
  return type metadata accessor for BridgeCoreSynthesisVoicePickableFetcher();
}

unint64_t sub_246A6A4A0()
{
  unint64_t result = qword_2691BFF58;
  if (!qword_2691BFF58)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2691BFF08);
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2691BFEE8);
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2691BFEE0);
    sub_246A6A5D4(&qword_2691BFEF8, &qword_2691BFEE0);
    swift_getOpaqueTypeConformance2();
    swift_getOpaqueTypeConformance2();
    sub_246A6A5D4(&qword_2691BFF60, &qword_2691BFF10);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2691BFF58);
  }
  return result;
}

uint64_t sub_246A6A5D4(unint64_t *a1, uint64_t *a2)
{
  uint64_t result = *a1;
  if (!result)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(a2);
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

uint64_t __swift_mutable_project_boxed_opaque_existential_1(uint64_t a1, uint64_t a2)
{
  if ((*(_DWORD *)(*(void *)(a2 - 8) + 80) & 0x20000) != 0)
  {
    swift_makeBoxUnique();
    return v2;
  }
  return result;
}

uint64_t *__swift_allocate_boxed_opaque_existential_1(uint64_t *a1)
{
  uint64_t v1 = a1;
  if ((*(unsigned char *)(*(void *)(a1[3] - 8) + 82) & 2) != 0)
  {
    *a1 = swift_allocBox();
    return (uint64_t *)v2;
  }
  return v1;
}

unint64_t sub_246A6A6CC()
{
  unint64_t result = qword_2691BFE98;
  if (!qword_2691BFE98)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_2691BFE98);
  }
  return result;
}

uint64_t sub_246A6A70C()
{
  return swift_release();
}

uint64_t sub_246A6A714()
{
  return MEMORY[0x270FA0238](v0, 28, 7);
}

uint64_t sub_246A6A724()
{
  return MEMORY[0x270FA0238](v0, 24, 7);
}

uint64_t sub_246A6A734()
{
  swift_release();

  return MEMORY[0x270FA0238](v0, 32, 7);
}

uint64_t sub_246A6A76C(uint64_t a1)
{
  uint64_t v4 = *(int **)(v1 + 16);
  uint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v5;
  void *v5 = v2;
  v5[1] = sub_246A65D90;
  id v6 = (uint64_t (*)(uint64_t, int *))((char *)&dword_2691BFF88 + dword_2691BFF88);
  return v6(a1, v4);
}

uint64_t sub_246A6A824()
{
  return MEMORY[0x270FA0238](v0, 17, 7);
}

uint64_t sub_246A6A838()
{
  uint64_t v3 = v0[4];
  uint64_t v2 = (int *)v0[5];
  uint64_t v4 = v0[7];
  uint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v1 + 16) = v5;
  void *v5 = v1;
  v5[1] = sub_246A662C8;
  v5[5] = v3;
  v5[6] = v4;
  uint64_t v8 = (uint64_t (*)(void *))((char *)v2 + *v2);
  id v6 = (void *)swift_task_alloc();
  v5[7] = v6;
  *id v6 = v5;
  v6[1] = sub_246A6836C;
  return v8(v5 + 8);
}

uint64_t sub_246A6A970()
{
  return MEMORY[0x270FA0238](v0, 24, 7);
}

uint64_t objectdestroy_52Tm()
{
  swift_unknownObjectRelease();
  swift_release();
  swift_release();

  return MEMORY[0x270FA0238](v0, 64, 7);
}

uint64_t sub_246A6A9D4()
{
  uint64_t v3 = v0[4];
  uint64_t v2 = (int *)v0[5];
  uint64_t v4 = v0[7];
  uint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v1 + 16) = v5;
  void *v5 = v1;
  v5[1] = sub_246A662C8;
  v5[5] = v3;
  v5[6] = v4;
  uint64_t v8 = (uint64_t (*)(void *))((char *)v2 + *v2);
  id v6 = (void *)swift_task_alloc();
  v5[7] = v6;
  *id v6 = v5;
  v6[1] = sub_246A68100;
  return v8(v5 + 8);
}

uint64_t sub_246A6AB0C()
{
  return MEMORY[0x270FA0228](v0, 16, 7);
}

uint64_t type metadata accessor for ResourceBundleClass()
{
  return self;
}

void _reloadSettings_cold_1(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_error_impl(&dword_246A39000, log, OS_LOG_TYPE_ERROR, "AccessibilityBridgeSettings: observer is null", v1, 2u);
}

void AXResizeImageToSystemImage_cold_1(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_error_impl(&dword_246A39000, log, OS_LOG_TYPE_ERROR, "Failed to retrieve system image.", v1, 2u);
}

void _reloadSettings_cold_1_0(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_error_impl(&dword_246A39000, log, OS_LOG_TYPE_ERROR, "TouchAccommodationsAllowSwipeAccessibilityBridgeSettings: observer is null", v1, 2u);
}

void _reloadSettings_cold_1_1(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_error_impl(&dword_246A39000, log, OS_LOG_TYPE_ERROR, "TouchAccommodationsAccessibilityBridgeSettings: observer is null", v1, 2u);
}

void __getTTSVBUILoaderClass_block_invoke_cold_1()
{
}

uint64_t sub_246A6AE80()
{
  return MEMORY[0x270EF0178]();
}

uint64_t sub_246A6AE90()
{
  return MEMORY[0x270F7D3D0]();
}

uint64_t sub_246A6AEA0()
{
  return MEMORY[0x270F7D418]();
}

uint64_t sub_246A6AEB0()
{
  return MEMORY[0x270F7D428]();
}

uint64_t sub_246A6AEC0()
{
  return MEMORY[0x270F7D430]();
}

uint64_t sub_246A6AED0()
{
  return MEMORY[0x270F7D5A0]();
}

uint64_t sub_246A6AEE0()
{
  return MEMORY[0x270F7D5A8]();
}

uint64_t sub_246A6AEF0()
{
  return MEMORY[0x270F7D620]();
}

uint64_t sub_246A6AF00()
{
  return MEMORY[0x270F7D628]();
}

uint64_t sub_246A6AF10()
{
  return MEMORY[0x270F09C10]();
}

uint64_t sub_246A6AF20()
{
  return MEMORY[0x270F09C18]();
}

uint64_t sub_246A6AF30()
{
  return MEMORY[0x270F09C20]();
}

uint64_t sub_246A6AF40()
{
  return MEMORY[0x270F09C28]();
}

uint64_t sub_246A6AF50()
{
  return MEMORY[0x270F7DD78]();
}

uint64_t sub_246A6AF60()
{
  return MEMORY[0x270F7DD88]();
}

uint64_t sub_246A6AF70()
{
  return MEMORY[0x270F7DD90]();
}

uint64_t sub_246A6AF80()
{
  return MEMORY[0x270F7DD98]();
}

uint64_t sub_246A6AF90()
{
  return MEMORY[0x270F7DDA0]();
}

uint64_t sub_246A6AFA0()
{
  return MEMORY[0x270F7DDA8]();
}

uint64_t sub_246A6AFB0()
{
  return MEMORY[0x270F7DDC0]();
}

uint64_t sub_246A6AFC0()
{
  return MEMORY[0x270F09C30]();
}

uint64_t sub_246A6AFD0()
{
  return MEMORY[0x270F09C38]();
}

uint64_t sub_246A6AFE0()
{
  return MEMORY[0x270F09C40]();
}

uint64_t sub_246A6AFF0()
{
  return MEMORY[0x270F09C48]();
}

uint64_t sub_246A6B000()
{
  return MEMORY[0x270F032C0]();
}

uint64_t sub_246A6B010()
{
  return MEMORY[0x270F032D0]();
}

uint64_t sub_246A6B020()
{
  return MEMORY[0x270F036C0]();
}

uint64_t sub_246A6B030()
{
  return MEMORY[0x270F04818]();
}

uint64_t sub_246A6B040()
{
  return MEMORY[0x270F04820]();
}

uint64_t sub_246A6B050()
{
  return MEMORY[0x270FA0A80]();
}

uint64_t sub_246A6B060()
{
  return MEMORY[0x270FA0B00]();
}

uint64_t sub_246A6B070()
{
  return MEMORY[0x270EF1840]();
}

uint64_t sub_246A6B080()
{
  return MEMORY[0x270F7D720]();
}

uint64_t sub_246A6B090()
{
  return MEMORY[0x270EF19B0]();
}

uint64_t sub_246A6B0A0()
{
  return MEMORY[0x270EF19E8]();
}

uint64_t sub_246A6B0B0()
{
  return MEMORY[0x270F9D708]();
}

uint64_t sub_246A6B0C0()
{
  return MEMORY[0x270EF1BB8]();
}

uint64_t sub_246A6B0D0()
{
  return MEMORY[0x270F7D728]();
}

uint64_t sub_246A6B0E0()
{
  return MEMORY[0x270FA1DF8]();
}

uint64_t sub_246A6B0F0()
{
  return MEMORY[0x270FA1F08]();
}

uint64_t sub_246A6B100()
{
  return MEMORY[0x270FA1F10]();
}

uint64_t sub_246A6B110()
{
  return MEMORY[0x270FA1F18]();
}

uint64_t sub_246A6B120()
{
  return MEMORY[0x270FA1F48]();
}

uint64_t sub_246A6B130()
{
  return MEMORY[0x270FA1F58]();
}

uint64_t sub_246A6B140()
{
  return MEMORY[0x270FA2138]();
}

uint64_t sub_246A6B150()
{
  return MEMORY[0x270F09E28]();
}

uint64_t sub_246A6B160()
{
  return MEMORY[0x270F09E70]();
}

uint64_t sub_246A6B190()
{
  return MEMORY[0x270F09EC8]();
}

uint64_t sub_246A6B1A0()
{
  return MEMORY[0x270EF1F70]();
}

uint64_t sub_246A6B1B0()
{
  return MEMORY[0x270FA0F00]();
}

uint64_t sub_246A6B1C0()
{
  return MEMORY[0x270FA0F28]();
}

uint64_t sub_246A6B1D0()
{
  return MEMORY[0x270FA1180]();
}

uint64_t sub_246A6B1E0()
{
  return MEMORY[0x270F9E7E8]();
}

uint64_t sub_246A6B1F0()
{
  return MEMORY[0x270F9E7F0]();
}

uint64_t sub_246A6B200()
{
  return MEMORY[0x270F9EFF0]();
}

uint64_t sub_246A6B210()
{
  return MEMORY[0x270F9F098]();
}

uint64_t sub_246A6B220()
{
  return MEMORY[0x270F9F0B0]();
}

uint64_t sub_246A6B230()
{
  return MEMORY[0x270FA22C0]();
}

uint64_t sub_246A6B240()
{
  return MEMORY[0x270F9F7D0]();
}

uint64_t sub_246A6B250()
{
  return MEMORY[0x270F9FC48]();
}

uint64_t sub_246A6B260()
{
  return MEMORY[0x270F9FC90]();
}

uint64_t AFDictationLanguageForKeyboardLanguage()
{
  return MEMORY[0x270F0ED10]();
}

uint64_t AXAddVoiceFootprintsToArrayForDialectWithResources()
{
  return MEMORY[0x270F09D20]();
}

uint64_t AXAirPodsLocalizedStringForKey()
{
  return MEMORY[0x270F09EE0]();
}

uint64_t AXCFormattedString()
{
  return MEMORY[0x270F09160]();
}

uint64_t AXCLanguageConvertToCanonicalForm()
{
  return MEMORY[0x270F09168]();
}

uint64_t AXDeviceSupportsLiveSpeechCategories()
{
  return MEMORY[0x270F0A068]();
}

uint64_t AXDeviceSupportsManyTouches()
{
  return MEMORY[0x270F0A070]();
}

uint64_t AXFormatFloatWithPercentage()
{
  return MEMORY[0x270F09240]();
}

uint64_t AXFormatNumberWithOptions()
{
  return MEMORY[0x270F09260]();
}

uint64_t AXLanguageCanonicalFormToGeneralLanguage()
{
  return MEMORY[0x270F0A160]();
}

uint64_t AXLanguageConvertToCanonicalForm()
{
  return MEMORY[0x270F0A168]();
}

uint64_t AXLocDuration()
{
  return MEMORY[0x270F0A170]();
}

uint64_t AXLocalizedTimeSummary()
{
  return MEMORY[0x270F09D60]();
}

uint64_t AXLogCommon()
{
  return MEMORY[0x270F092D8]();
}

uint64_t AXLogSettings()
{
  return MEMORY[0x270F09370]();
}

uint64_t AXPerformBlockAsynchronouslyOnMainThread()
{
  return MEMORY[0x270F09428]();
}

uint64_t AXRuntimeCheck_SupportsIncreaseBrightnessFloor()
{
  return MEMORY[0x270F09518]();
}

uint64_t AXSafeClassFromString()
{
  return MEMORY[0x270F09540]();
}

uint64_t AXTTSLogCommon()
{
  return MEMORY[0x270F09568]();
}

uint64_t AXVoiceNameForVoiceId()
{
  return MEMORY[0x270F0A338]();
}

uint64_t AudioServicesPlaySystemSoundWithOptions()
{
  return MEMORY[0x270EE2230]();
}

uint64_t AudioServicesStopSystemSound()
{
  return MEMORY[0x270EE2248]();
}

uint64_t BPSAccessoryHighlightColor()
{
  return MEMORY[0x270F12820]();
}

uint64_t BPSBridgeTintColor()
{
  return MEMORY[0x270F12828]();
}

uint64_t BPSTintedSymbol()
{
  return MEMORY[0x270F12888]();
}

uint64_t BRLLogTranslation()
{
  return MEMORY[0x270F09578]();
}

CFAbsoluteTime CFAbsoluteTimeGetCurrent(void)
{
  MEMORY[0x270EE4278]();
  return result;
}

void CFNotificationCenterAddObserver(CFNotificationCenterRef center, const void *observer, CFNotificationCallback callBack, CFStringRef name, const void *object, CFNotificationSuspensionBehavior suspensionBehavior)
{
}

CFNotificationCenterRef CFNotificationCenterGetDarwinNotifyCenter(void)
{
  return (CFNotificationCenterRef)MEMORY[0x270EE4B88]();
}

CFNotificationCenterRef CFNotificationCenterGetLocalCenter(void)
{
  return (CFNotificationCenterRef)MEMORY[0x270EE4B98]();
}

void CFNotificationCenterRemoveEveryObserver(CFNotificationCenterRef center, const void *observer)
{
}

void CFNotificationCenterRemoveObserver(CFNotificationCenterRef center, const void *observer, CFNotificationName name, const void *object)
{
}

Boolean CFNumberGetValue(CFNumberRef number, CFNumberType theType, void *valuePtr)
{
  return MEMORY[0x270EE4C70](number, theType, valuePtr);
}

uint64_t LiveSpeechLogCommon()
{
  return MEMORY[0x270F095A8]();
}

uint64_t NRVersionIsGreaterThanOrEqual()
{
  return MEMORY[0x270F4D8B0]();
}

uint64_t NRWatchOSVersionForRemoteDevice()
{
  return MEMORY[0x270F4D8C0]();
}

Class NSClassFromString(NSString *aClassName)
{
  return (Class)MEMORY[0x270EF2A50](aClassName);
}

uint64_t NSStringFromBOOL()
{
  return MEMORY[0x270EF2BF8]();
}

NSString *__cdecl NSStringFromClass(Class aClass)
{
  return (NSString *)MEMORY[0x270EF2C08](aClass);
}

NSString *__cdecl NSStringFromRange(NSRange range)
{
  return (NSString *)MEMORY[0x270EF2C28](range.location, range.length);
}

NSString *__cdecl NSStringFromSelector(SEL aSelector)
{
  return (NSString *)MEMORY[0x270EF2C38](aSelector);
}

uint64_t VOSBrailleTableForRotorItem()
{
  return MEMORY[0x270F84510]();
}

uint64_t VOSCustomBrailleEnabled()
{
  return MEMORY[0x270F84518]();
}

uint64_t WCAvailableActionGroupsForSettings()
{
  return MEMORY[0x270F849E8]();
}

uint64_t WCAvailableGreyEvents()
{
  return MEMORY[0x270F849F0]();
}

uint64_t WCDefaultActionForMotionPointerEdge()
{
  return MEMORY[0x270F849F8]();
}

uint64_t WCDefaultActionsForActionGroup()
{
  return MEMORY[0x270F84A00]();
}

uint64_t WCGreyEventForAXHandGestureEventUsage()
{
  return MEMORY[0x270F84A08]();
}

uint64_t WCImageForAction()
{
  return MEMORY[0x270F84A10]();
}

uint64_t WCInputSourceTypeIsSupportedOnDevice()
{
  return MEMORY[0x270F84A18]();
}

uint64_t WCNameForAction()
{
  return MEMORY[0x270F84A20]();
}

uint64_t WCNameForActionGroup()
{
  return MEMORY[0x270F84A28]();
}

uint64_t WCNameForActionMenuPosition()
{
  return MEMORY[0x270F84A30]();
}

uint64_t WCNameForAutoMovementSpeed()
{
  return MEMORY[0x270F84A38]();
}

uint64_t WCNameForCursorColor()
{
  return MEMORY[0x270F84A40]();
}

uint64_t WCNameForFocusMovementStyle()
{
  return MEMORY[0x270F84A48]();
}

uint64_t WCNameForGreyEvent()
{
  return MEMORY[0x270F84A50]();
}

uint64_t WCNameForInputSourceType()
{
  return MEMORY[0x270F84A58]();
}

uint64_t WCNameForMotionPointerEdge()
{
  return MEMORY[0x270F84A60]();
}

uint64_t WCNameForMotionPointerMovementTolerance()
{
  return MEMORY[0x270F84A68]();
}

uint64_t WCRetrieveCustomActionFromPayload()
{
  return MEMORY[0x270F84A70]();
}

uint64_t WFSystemImageNameForGlyphCharacter()
{
  return MEMORY[0x270F848A0]();
}

uint64_t _AXAssert()
{
  return MEMORY[0x270F095D8]();
}

void _Block_object_dispose(const void *a1, const int a2)
{
}

uint64_t _TCSInitializeLogging()
{
  return MEMORY[0x270F7E2F8]();
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
}

uint64_t __UIAccessibilitySafeClass()
{
  return MEMORY[0x270F09670]();
}

void __assert_rtn(const char *a1, const char *a2, int a3, const char *a4)
{
}

float __exp10f(float a1)
{
  MEMORY[0x270ED7DD0](a1);
  return result;
}

{
  return MEMORY[0x270F9A3C0]();
}

{
  return MEMORY[0x270F9A3C8]();
}

uint64_t _os_feature_enabled_impl()
{
  return MEMORY[0x270ED8070]();
}

void _os_log_debug_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_log_error_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_log_fault_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

uint64_t _sl_dlopen()
{
  return MEMORY[0x270F76310]();
}

void abort(void)
{
}

uint64_t abort_report_np()
{
  return MEMORY[0x270ED8458]();
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
}

dispatch_semaphore_t dispatch_semaphore_create(intptr_t value)
{
  return (dispatch_semaphore_t)MEMORY[0x270ED94B8](value);
}

void free(void *a1)
{
}

float log10f(float a1)
{
  MEMORY[0x270EDA0B8](a1);
  return result;
}

size_t malloc_size(const void *ptr)
{
  return MEMORY[0x270EDA378](ptr);
}

void *__cdecl memmove(void *__dst, const void *__src, size_t __len)
{
  return (void *)MEMORY[0x270EDA488](__dst, __src, __len);
}

uint64_t nameForComplicationPreferredDisplayMode()
{
  return MEMORY[0x270F394F8]();
}

id objc_alloc(Class a1)
{
  return (id)MEMORY[0x270F9A528](a1);
}

id objc_allocWithZone(Class a1)
{
  return (id)MEMORY[0x270F9A538](a1);
}

uint64_t objc_alloc_init()
{
  return MEMORY[0x270F9A540]();
}

id objc_autoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x270F9A590](a1);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return MEMORY[0x270F9A5A8]();
}

void objc_copyWeak(id *to, id *from)
{
}

void objc_destroyWeak(id *location)
{
}

void objc_enumerationMutation(id obj)
{
}

Class objc_getClass(const char *name)
{
  return (Class)MEMORY[0x270F9A658](name);
}

id objc_getProperty(id self, SEL _cmd, ptrdiff_t offset, BOOL atomic)
{
  return (id)MEMORY[0x270F9A678](self, _cmd, offset, atomic);
}

id objc_initWeak(id *location, id val)
{
  return (id)MEMORY[0x270F9A688](location, val);
}

id objc_loadWeakRetained(id *location)
{
  return (id)MEMORY[0x270F9A6B0](location);
}

id objc_msgSend(id a1, SEL a2, ...)
{
  return (id)MEMORY[0x270F9A6D0](a1, a2);
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return (id)MEMORY[0x270F9A6E8](a1, a2);
}

uint64_t objc_opt_class()
{
  return MEMORY[0x270F9A6F8]();
}

uint64_t objc_opt_isKindOfClass()
{
  return MEMORY[0x270F9A700]();
}

uint64_t objc_opt_new()
{
  return MEMORY[0x270F9A710]();
}

uint64_t self
{
  return MEMORY[0x270F9A730]();
}

void objc_release(id a1)
{
}

id objc_retain(id a1)
{
  return (id)MEMORY[0x270F9A870](a1);
}

id objc_retainAutorelease(id a1)
{
  return (id)MEMORY[0x270F9A880](a1);
}

id objc_retainAutoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x270F9A888](a1);
}

id objc_retainAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x270F9A890](a1);
}

id objc_retainBlock(id a1)
{
  return (id)MEMORY[0x270F9A898](a1);
}

void objc_setProperty_atomic(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
}

void objc_storeStrong(id *location, id obj)
{
}

id objc_storeWeak(id *location, id obj)
{
  return (id)MEMORY[0x270F9A9F8](location, obj);
}

id objc_unsafeClaimAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x270F9AA38](a1);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x270EDA9D0](oslog, type);
}

uint64_t swift_allocBox()
{
  return MEMORY[0x270FA0180]();
}

uint64_t swift_allocObject()
{
  return MEMORY[0x270FA0198]();
}

uint64_t swift_arrayInitWithCopy()
{
  return MEMORY[0x270FA01C8]();
}

uint64_t swift_beginAccess()
{
  return MEMORY[0x270FA01E0]();
}

uint64_t swift_bridgeObjectRelease()
{
  return MEMORY[0x270FA01E8]();
}

uint64_t swift_bridgeObjectRetain()
{
  return MEMORY[0x270FA01F8]();
}

uint64_t swift_bridgeObjectRetain_n()
{
  return MEMORY[0x270FA0200]();
}

uint64_t swift_dynamicCast()
{
  return MEMORY[0x270FA0260]();
}

uint64_t swift_endAccess()
{
  return MEMORY[0x270FA02C0]();
}

uint64_t swift_errorRelease()
{
  return MEMORY[0x270FA02C8]();
}

uint64_t swift_getKeyPath()
{
  return MEMORY[0x270FA03B8]();
}

uint64_t swift_getObjCClassMetadata()
{
  return MEMORY[0x270FA03E0]();
}

uint64_t swift_getObjectType()
{
  return MEMORY[0x270FA03E8]();
}

uint64_t swift_getOpaqueTypeConformance2()
{
  return MEMORY[0x270FA03F0]();
}

uint64_t swift_getSingletonMetadata()
{
  return MEMORY[0x270FA0400]();
}

uint64_t swift_getTypeByMangledNameInContext2()
{
  return MEMORY[0x270FA0440]();
}

uint64_t swift_getTypeByMangledNameInContextInMetadataState2()
{
  return MEMORY[0x270FA0448]();
}

uint64_t swift_getWitnessTable()
{
  return MEMORY[0x270FA0450]();
}

uint64_t swift_initClassMetadata2()
{
  return MEMORY[0x270FA0458]();
}

uint64_t swift_isUniquelyReferenced_nonNull_native()
{
  return MEMORY[0x270FA04C8]();
}

uint64_t swift_makeBoxUnique()
{
  return MEMORY[0x270FA04D8]();
}

uint64_t swift_once()
{
  return MEMORY[0x270FA04F0]();
}

uint64_t swift_release()
{
  return MEMORY[0x270FA0520]();
}

uint64_t swift_retain()
{
  return MEMORY[0x270FA0530]();
}

uint64_t swift_task_alloc()
{
  return MEMORY[0x270FA2450]();
}

uint64_t swift_task_create()
{
  return MEMORY[0x270FA2458]();
}

uint64_t swift_task_dealloc()
{
  return MEMORY[0x270FA2460]();
}

uint64_t swift_unknownObjectRelease()
{
  return MEMORY[0x270FA0590]();
}

uint64_t swift_unknownObjectRetain()
{
  return MEMORY[0x270FA05A0]();
}

uint64_t swift_updateClassMetadata2()
{
  return MEMORY[0x270FA0628]();
}