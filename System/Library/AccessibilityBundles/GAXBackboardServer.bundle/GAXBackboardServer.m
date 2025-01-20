void sub_1964(_Unwind_Exception *a1)
{
  id *v1;
  uint64_t v2;

  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 56));
  _Unwind_Resume(a1);
}

void sub_1984(uint64_t a1, uint64_t a2)
{
  v3 = (id *)(a1 + 32);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v4 = [WeakRetained backboardDelegate];
  id v5 = objc_loadWeakRetained(v3);
  [v4 backboardServer:v5 clientWentInvalid:a2];
}

void sub_1A08(uint64_t a1)
{
  v1 = *(void **)(a1 + 32);
  id v5 = 0;
  unsigned __int8 v2 = [v1 startServerWithError:&v5];
  id v3 = v5;
  if ((v2 & 1) == 0)
  {
    v4 = GAXLogCommon();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      sub_29A80((uint64_t)v3, v4);
    }
  }
}

uint64_t sub_3A3C(uint64_t a1)
{
  return __AXSVoiceOverTouchSetEnabledAndAutoConfirmUsage(*(unsigned __int8 *)(a1 + 32));
}

uint64_t sub_3A44(uint64_t a1)
{
  return __AXSZoomTouchSetEnabled(*(unsigned __int8 *)(a1 + 32));
}

uint64_t sub_3A4C(uint64_t a1)
{
  return __AXSInvertColorsSetEnabled(*(unsigned __int8 *)(a1 + 32));
}

uint64_t sub_3A54(uint64_t a1)
{
  return __AXSGrayscaleSetEnabled(*(unsigned __int8 *)(a1 + 32));
}

uint64_t sub_3A5C(uint64_t a1)
{
  return __AXSAssistiveTouchSetEnabled(*(unsigned __int8 *)(a1 + 32));
}

void sub_3FD4(uint64_t a1)
{
  id v3 = +[NSMutableArray array];
  int v2 = *(_DWORD *)(a1 + 32);
  if ((v2 & 0x20000) != 0)
  {
    [v3 addObject:&off_4D698];
    int v2 = *(_DWORD *)(a1 + 32);
    if ((v2 & 0x800) == 0)
    {
LABEL_3:
      if ((v2 & 0x2000) == 0) {
        goto LABEL_4;
      }
      goto LABEL_17;
    }
  }
  else if ((v2 & 0x800) == 0)
  {
    goto LABEL_3;
  }
  [v3 addObject:&off_4D638];
  int v2 = *(_DWORD *)(a1 + 32);
  if ((v2 & 0x2000) == 0)
  {
LABEL_4:
    if ((v2 & 0x1000) == 0) {
      goto LABEL_5;
    }
    goto LABEL_18;
  }
LABEL_17:
  [v3 addObject:&off_4D650];
  int v2 = *(_DWORD *)(a1 + 32);
  if ((v2 & 0x1000) == 0)
  {
LABEL_5:
    if ((v2 & 0x80000) == 0) {
      goto LABEL_6;
    }
    goto LABEL_19;
  }
LABEL_18:
  [v3 addObject:&off_4D668];
  int v2 = *(_DWORD *)(a1 + 32);
  if ((v2 & 0x80000) == 0)
  {
LABEL_6:
    if ((v2 & 0x8000) == 0) {
      goto LABEL_7;
    }
    goto LABEL_20;
  }
LABEL_19:
  [v3 addObject:&off_4D6F8];
  int v2 = *(_DWORD *)(a1 + 32);
  if ((v2 & 0x8000) == 0)
  {
LABEL_7:
    if ((v2 & 0x40000) == 0) {
      goto LABEL_8;
    }
    goto LABEL_21;
  }
LABEL_20:
  [v3 addObject:&off_4D680];
  int v2 = *(_DWORD *)(a1 + 32);
  if ((v2 & 0x40000) == 0)
  {
LABEL_8:
    if ((v2 & 0x10000) == 0) {
      goto LABEL_9;
    }
    goto LABEL_22;
  }
LABEL_21:
  [v3 addObject:&off_4D6B0];
  int v2 = *(_DWORD *)(a1 + 32);
  if ((v2 & 0x10000) == 0)
  {
LABEL_9:
    if ((v2 & 0x4000) == 0) {
      goto LABEL_10;
    }
    goto LABEL_23;
  }
LABEL_22:
  [v3 addObject:&off_4D6C8];
  int v2 = *(_DWORD *)(a1 + 32);
  if ((v2 & 0x4000) == 0)
  {
LABEL_10:
    if ((v2 & 0x100000) == 0) {
      goto LABEL_12;
    }
    goto LABEL_11;
  }
LABEL_23:
  [v3 addObject:&off_4D6E0];
  if ((*(_DWORD *)(a1 + 32) & 0x100000) != 0) {
LABEL_11:
  }
    [v3 addObject:&off_4D710];
LABEL_12:
  _AXSSetTripleClickOptions();
}

uint64_t sub_4144(uint64_t a1)
{
  return __AXSVoiceOverTouchSetEnabled(*(_DWORD *)(a1 + 32) & 1);
}

uint64_t sub_4150(uint64_t a1)
{
  return __AXSZoomTouchSetEnabled((*(unsigned __int8 *)(a1 + 32) >> 1) & 1);
}

uint64_t sub_415C(uint64_t a1)
{
  return __AXSInvertColorsSetEnabled((*(unsigned __int8 *)(a1 + 32) >> 2) & 1);
}

uint64_t sub_4168(uint64_t a1)
{
  return __AXSGrayscaleSetEnabled((*(unsigned __int8 *)(a1 + 32) >> 3) & 1);
}

uint64_t sub_4174(uint64_t a1)
{
  return __AXSAssistiveTouchSetEnabled((*(unsigned __int8 *)(a1 + 32) >> 4) & 1);
}

uint64_t sub_4180(uint64_t a1)
{
  return __AXSQuickSpeakSetEnabled((*(unsigned __int8 *)(a1 + 32) >> 6) & 1);
}

uint64_t sub_418C(uint64_t a1)
{
  return __AXSMonoAudioSetEnabled(*(unsigned __int8 *)(a1 + 32) >> 7);
}

uint64_t sub_4198()
{
  return _AXSGuidedAccessSetEnabled();
}

uint64_t sub_41A4(uint64_t a1)
{
  return __AXSAssistiveTouchScannerSetEnabled((*(unsigned __int8 *)(a1 + 32) >> 5) & 1);
}

uint64_t sub_41B0(uint64_t a1)
{
  return __AXSCommandAndControlSetEnabled((*(_DWORD *)(a1 + 32) >> 10) & 1);
}

id sub_4360(uint64_t a1)
{
  return [*(id *)(a1 + 32) _processNextUpdateBlockInQueue];
}

void sub_4430(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, &a9, 2u);
}

id GAXFallbackValueForProfileKey(void *a1, uint64_t a2, int a3)
{
  id v5 = a1;
  if (qword_560E0 == -1)
  {
    if (a3) {
      goto LABEL_3;
    }
  }
  else
  {
    dispatch_once(&qword_560E0, &stru_48E90);
    if (a3)
    {
LABEL_3:
      v6 = [(id)qword_560D8 objectForKey:v5];
      if (v6) {
        goto LABEL_8;
      }
    }
  }
  v7 = (void *)qword_560D0;
  v8 = +[NSNumber numberWithUnsignedInt:a2];
  uint64_t v9 = [v7 objectForKey:v8];
  v6 = [v9 objectForKey:v5];

  if (!v6)
  {
    v10 = GAXLogCommon();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      sub_29C58((uint64_t)v5, v10);
    }

    v6 = 0;
  }
LABEL_8:

  return v6;
}

void sub_4570(id a1)
{
  v52[0] = @"GAXProfileAllowsKeyboardTextInput";
  v52[1] = @"GAXProfileAllowsTouch";
  v53[0] = &__kCFBooleanTrue;
  v53[1] = &__kCFBooleanTrue;
  v52[2] = @"GAXProfileAllowsMotion";
  v52[3] = @"GAXProfileAllowsRingerSwitch";
  v53[2] = &__kCFBooleanTrue;
  v53[3] = &__kCFBooleanFalse;
  v52[4] = @"GAXProfileAllowsProximity";
  v52[5] = @"GAXProfileAllowsLockButton";
  v53[4] = &__kCFBooleanFalse;
  v53[5] = &__kCFBooleanFalse;
  v52[6] = @"GAXProfileAllowsVolumeButtons";
  v52[7] = @"GAXProfileAllowsAutolock";
  v53[6] = &__kCFBooleanFalse;
  v53[7] = &__kCFBooleanTrue;
  v52[8] = @"GAXProfileAppTimeoutDuration";
  v52[9] = @"GAXProfileAppTimeoutEnabled";
  v53[8] = &off_4D878;
  v53[9] = &__kCFBooleanFalse;
  v52[10] = @"GAXProfileAllowsAXAutoEnableVoiceOver";
  v41 = +[NSNull null];
  v53[10] = v41;
  v52[11] = @"GAXProfileAllowsAXAutoEnableZoom";
  v38 = +[NSNull null];
  v53[11] = v38;
  v52[12] = @"GAXProfileAllowsAXAutoEnableInvertColors";
  v35 = +[NSNull null];
  v53[12] = v35;
  v52[13] = @"GAXProfileAllowsAXAutoEnableGrayscale";
  v32 = +[NSNull null];
  v53[13] = v32;
  v52[14] = @"GAXProfileAllowsAXAutoEnableAssistiveTouch";
  v29 = +[NSNull null];
  v53[14] = v29;
  v52[15] = @"GAXProfileAllowsAXAutoEnableSpeakSelection";
  v1 = +[NSNull null];
  v53[15] = v1;
  v52[16] = @"GAXProfileAllowsAXAutoEnableMonoAudio";
  int v2 = +[NSNull null];
  v53[16] = v2;
  v52[17] = @"GAXProfileAllowsAXAutoEnableCommandAndControl";
  id v3 = +[NSNull null];
  v53[17] = v3;
  v53[18] = &__kCFBooleanFalse;
  v52[18] = @"GAXProfileAllowsAXToggleVoiceOver";
  v52[19] = @"GAXProfileAllowsAXToggleZoom";
  v53[19] = &__kCFBooleanFalse;
  v53[20] = &__kCFBooleanFalse;
  v52[20] = @"GAXProfileAllowsAXToggleInvertColors";
  v52[21] = @"GAXProfileAllowsAXToggleGrayscale";
  v53[21] = &__kCFBooleanFalse;
  v53[22] = &__kCFBooleanFalse;
  v52[22] = @"GAXProfileAllowsAXToggleAssistiveTouch";
  v52[23] = @"GAXProfileAllowsAXToggleCommandAndControl";
  v53[23] = &__kCFBooleanFalse;
  v52[24] = @"GAXProfileIgnoredTouchRegionsPortrait";
  v4 = +[NSNull null];
  v53[24] = v4;
  v52[25] = @"GAXProfileIgnoredTouchRegionsLandscape";
  id v5 = +[NSNull null];
  v53[25] = v5;
  v52[26] = @"GAXProfileStatesForRestrictions";
  v6 = +[NSNull null];
  v53[26] = v6;
  v52[27] = @"GAXProfileUnappliedChangedStatesForRestrictions";
  v7 = +[NSNull null];
  v53[27] = v7;
  v53[28] = &__kCFBooleanFalse;
  v52[28] = @"GAXProfileAllowsHomeButton";
  v52[29] = @"GAXProfileShouldAutolaunchCrashedApps";
  v53[29] = &__kCFBooleanTrue;
  v53[30] = &__kCFBooleanTrue;
  v52[30] = @"GAXProfileShowsUserConfirmationPromptsAndBanners";
  v52[31] = @"GAXProfileShouldAutolaunchAppsAfterSystemCrash";
  v53[31] = &__kCFBooleanTrue;
  v53[32] = &__kCFBooleanTrue;
  v52[32] = @"GAXProfileAllowsExit";
  v52[33] = @"GAXProfileShouldAutolaunchAfterLowBatteryShutDown";
  v53[33] = &__kCFBooleanFalse;
  v53[34] = &__kCFBooleanTrue;
  v52[34] = @"GAXProfileAllowsWebTextDefine";
  v52[35] = @"GAXProfileAllowsAccessibilityShortcut";
  v53[35] = &__kCFBooleanFalse;
  v43 = +[NSDictionary dictionaryWithObjects:v53 forKeys:v52 count:36];

  v50[0] = @"GAXProfileAllowsKeyboardTextInput";
  v50[1] = @"GAXProfileAllowsTouch";
  v51[0] = &__kCFBooleanTrue;
  v51[1] = &__kCFBooleanTrue;
  v50[2] = @"GAXProfileAllowsMotion";
  v50[3] = @"GAXProfileAllowsRingerSwitch";
  v51[2] = &__kCFBooleanTrue;
  v51[3] = &__kCFBooleanTrue;
  v50[4] = @"GAXProfileAllowsProximity";
  v50[5] = @"GAXProfileAllowsLockButton";
  v51[4] = &__kCFBooleanTrue;
  v51[5] = &__kCFBooleanTrue;
  v50[6] = @"GAXProfileAllowsVolumeButtons";
  v50[7] = @"GAXProfileAllowsAutolock";
  v51[6] = &__kCFBooleanTrue;
  v51[7] = &__kCFBooleanTrue;
  v50[8] = @"GAXProfileAppTimeoutDuration";
  v50[9] = @"GAXProfileAppTimeoutEnabled";
  v51[8] = &off_4D878;
  v51[9] = &__kCFBooleanFalse;
  v50[10] = @"GAXProfileAllowsAXAutoEnableVoiceOver";
  v39 = +[NSNull null];
  v51[10] = v39;
  v50[11] = @"GAXProfileAllowsAXAutoEnableZoom";
  v36 = +[NSNull null];
  v51[11] = v36;
  v50[12] = @"GAXProfileAllowsAXAutoEnableInvertColors";
  v33 = +[NSNull null];
  v51[12] = v33;
  v50[13] = @"GAXProfileAllowsAXAutoEnableGrayscale";
  v30 = +[NSNull null];
  v51[13] = v30;
  v50[14] = @"GAXProfileAllowsAXAutoEnableAssistiveTouch";
  v27 = +[NSNull null];
  v51[14] = v27;
  v50[15] = @"GAXProfileAllowsAXAutoEnableSpeakSelection";
  v8 = +[NSNull null];
  v51[15] = v8;
  v50[16] = @"GAXProfileAllowsAXAutoEnableMonoAudio";
  uint64_t v9 = +[NSNull null];
  v51[16] = v9;
  v50[17] = @"GAXProfileAllowsAXAutoEnableCommandAndControl";
  v10 = +[NSNull null];
  v51[17] = v10;
  v51[18] = &__kCFBooleanFalse;
  v50[18] = @"GAXProfileAllowsAXToggleVoiceOver";
  v50[19] = @"GAXProfileAllowsAXToggleZoom";
  v51[19] = &__kCFBooleanFalse;
  v51[20] = &__kCFBooleanFalse;
  v50[20] = @"GAXProfileAllowsAXToggleInvertColors";
  v50[21] = @"GAXProfileAllowsAXToggleGrayscale";
  v51[21] = &__kCFBooleanFalse;
  v51[22] = &__kCFBooleanFalse;
  v50[22] = @"GAXProfileAllowsAXToggleAssistiveTouch";
  v50[23] = @"GAXProfileAllowsAXToggleCommandAndControl";
  v51[23] = &__kCFBooleanFalse;
  v50[24] = @"GAXProfileIgnoredTouchRegionsPortrait";
  v11 = +[NSNull null];
  v51[24] = v11;
  v50[25] = @"GAXProfileIgnoredTouchRegionsLandscape";
  v12 = +[NSNull null];
  v51[25] = v12;
  v50[26] = @"GAXProfileStatesForRestrictions";
  v13 = +[NSNull null];
  v51[26] = v13;
  v50[27] = @"GAXProfileUnappliedChangedStatesForRestrictions";
  v14 = +[NSNull null];
  v51[27] = v14;
  v51[28] = &__kCFBooleanFalse;
  v50[28] = @"GAXProfileAllowsHomeButton";
  v50[29] = @"GAXProfileShouldAutolaunchCrashedApps";
  v51[29] = &__kCFBooleanTrue;
  v51[30] = &__kCFBooleanTrue;
  v50[30] = @"GAXProfileShowsUserConfirmationPromptsAndBanners";
  v50[31] = @"GAXProfileShouldAutolaunchAppsAfterSystemCrash";
  v51[31] = &__kCFBooleanTrue;
  v51[32] = &__kCFBooleanFalse;
  v50[32] = @"GAXProfileAllowsExit";
  v50[33] = @"GAXProfileShouldAutolaunchAfterLowBatteryShutDown";
  v51[33] = &__kCFBooleanTrue;
  v51[34] = &__kCFBooleanTrue;
  v50[34] = @"GAXProfileAllowsWebTextDefine";
  v50[35] = @"GAXProfileAllowsAccessibilityShortcut";
  v51[35] = &__kCFBooleanFalse;
  v42 = +[NSDictionary dictionaryWithObjects:v51 forKeys:v50 count:36];

  v48[0] = @"GAXProfileAllowsKeyboardTextInput";
  v48[1] = @"GAXProfileAllowsTouch";
  v49[0] = &__kCFBooleanTrue;
  v49[1] = &__kCFBooleanTrue;
  v48[2] = @"GAXProfileAllowsMotion";
  v48[3] = @"GAXProfileAllowsRingerSwitch";
  v49[2] = &__kCFBooleanTrue;
  v49[3] = &__kCFBooleanTrue;
  v48[4] = @"GAXProfileAllowsProximity";
  v48[5] = @"GAXProfileAllowsLockButton";
  v49[4] = &__kCFBooleanTrue;
  v49[5] = &__kCFBooleanTrue;
  v48[6] = @"GAXProfileAllowsVolumeButtons";
  v48[7] = @"GAXProfileAllowsAutolock";
  v49[6] = &__kCFBooleanTrue;
  v49[7] = &__kCFBooleanTrue;
  v48[8] = @"GAXProfileAppTimeoutDuration";
  v48[9] = @"GAXProfileAppTimeoutEnabled";
  v49[8] = &off_4D878;
  v49[9] = &__kCFBooleanFalse;
  v48[10] = @"GAXProfileAllowsAXAutoEnableVoiceOver";
  v40 = +[NSNull null];
  v49[10] = v40;
  v48[11] = @"GAXProfileAllowsAXAutoEnableZoom";
  v37 = +[NSNull null];
  v49[11] = v37;
  v48[12] = @"GAXProfileAllowsAXAutoEnableInvertColors";
  v34 = +[NSNull null];
  v49[12] = v34;
  v48[13] = @"GAXProfileAllowsAXAutoEnableGrayscale";
  v31 = +[NSNull null];
  v49[13] = v31;
  v48[14] = @"GAXProfileAllowsAXAutoEnableAssistiveTouch";
  v28 = +[NSNull null];
  v49[14] = v28;
  v48[15] = @"GAXProfileAllowsAXAutoEnableSpeakSelection";
  v15 = +[NSNull null];
  v49[15] = v15;
  v48[16] = @"GAXProfileAllowsAXAutoEnableMonoAudio";
  v16 = +[NSNull null];
  v49[16] = v16;
  v48[17] = @"GAXProfileAllowsAXAutoEnableCommandAndControl";
  v17 = +[NSNull null];
  v49[17] = v17;
  v49[18] = &__kCFBooleanFalse;
  v48[18] = @"GAXProfileAllowsAXToggleVoiceOver";
  v48[19] = @"GAXProfileAllowsAXToggleZoom";
  v49[19] = &__kCFBooleanFalse;
  v49[20] = &__kCFBooleanFalse;
  v48[20] = @"GAXProfileAllowsAXToggleInvertColors";
  v48[21] = @"GAXProfileAllowsAXToggleGrayscale";
  v49[21] = &__kCFBooleanFalse;
  v49[22] = &__kCFBooleanFalse;
  v48[22] = @"GAXProfileAllowsAXToggleAssistiveTouch";
  v48[23] = @"GAXProfileAllowsAXToggleCommandAndControl";
  v49[23] = &__kCFBooleanFalse;
  v48[24] = @"GAXProfileIgnoredTouchRegionsPortrait";
  v18 = +[NSNull null];
  v49[24] = v18;
  v48[25] = @"GAXProfileIgnoredTouchRegionsLandscape";
  v19 = +[NSNull null];
  v49[25] = v19;
  v48[26] = @"GAXProfileStatesForRestrictions";
  v20 = +[NSNull null];
  v49[26] = v20;
  v48[27] = @"GAXProfileUnappliedChangedStatesForRestrictions";
  v21 = +[NSNull null];
  v49[27] = v21;
  v49[28] = &__kCFBooleanFalse;
  v48[28] = @"GAXProfileAllowsHomeButton";
  v48[29] = @"GAXProfileShouldAutolaunchCrashedApps";
  v49[29] = &__kCFBooleanTrue;
  v49[30] = &__kCFBooleanTrue;
  v48[30] = @"GAXProfileShowsUserConfirmationPromptsAndBanners";
  v48[31] = @"GAXProfileShouldAutolaunchAppsAfterSystemCrash";
  v49[31] = &__kCFBooleanTrue;
  v49[32] = &__kCFBooleanFalse;
  v48[32] = @"GAXProfileAllowsExit";
  v48[33] = @"GAXProfileShouldAutolaunchAfterLowBatteryShutDown";
  v49[33] = &__kCFBooleanTrue;
  v49[34] = &__kCFBooleanTrue;
  v48[34] = @"GAXProfileAllowsWebTextDefine";
  v48[35] = @"GAXProfileAllowsAccessibilityShortcut";
  v49[35] = &__kCFBooleanFalse;
  v22 = +[NSDictionary dictionaryWithObjects:v49 forKeys:v48 count:36];

  v46[0] = @"GAXProfileAllowsAutolock";
  v46[1] = @"GAXProfileAllowsLockButton";
  v47[0] = &__kCFBooleanFalse;
  v47[1] = &__kCFBooleanFalse;
  uint64_t v23 = +[NSDictionary dictionaryWithObjects:v47 forKeys:v46 count:2];
  v24 = (void *)qword_560D8;
  qword_560D8 = v23;

  v44[0] = &off_4D728;
  v44[1] = &off_4D740;
  v45[0] = v43;
  v45[1] = v42;
  v44[2] = &off_4D758;
  v45[2] = v22;
  uint64_t v25 = +[NSDictionary dictionaryWithObjects:v45 forKeys:v44 count:3];
  v26 = (void *)qword_560D0;
  qword_560D0 = v25;
}

id GAXAppIsMobilePhoneOrFacetime(void *a1)
{
  id v1 = a1;
  if ([v1 isEqualToString:@"com.apple.mobilephone"]) {
    id v2 = &dword_0 + 1;
  }
  else {
    id v2 = [v1 isEqualToString:@"com.apple.facetime"];
  }

  return v2;
}

uint64_t GAXSessionAppsContainMobilePhoneOrFacetime(void *a1)
{
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  id v1 = a1;
  id v2 = [v1 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v2)
  {
    id v3 = v2;
    uint64_t v4 = *(void *)v10;
    while (2)
    {
      for (i = 0; i != v3; i = (char *)i + 1)
      {
        if (*(void *)v10 != v4) {
          objc_enumerationMutation(v1);
        }
        v6 = *(void **)(*((void *)&v9 + 1) + 8 * i);
        if ((objc_msgSend(v6, "isEqualToString:", @"com.apple.mobilephone", (void)v9) & 1) != 0
          || ([v6 isEqualToString:@"com.apple.facetime"] & 1) != 0)
        {
          uint64_t v7 = 1;
          goto LABEL_13;
        }
      }
      id v3 = [v1 countByEnumeratingWithState:&v9 objects:v13 count:16];
      uint64_t v7 = 0;
      if (v3) {
        continue;
      }
      break;
    }
  }
  else
  {
    uint64_t v7 = 0;
  }
LABEL_13:

  return v7;
}

void extractGAXBackboardStateFromMessage(void *a1@<X0>, uint64_t a2@<X8>)
{
  *(void *)a2 = 0;
  *(void *)(a2 + 8) = 0;
  *(_DWORD *)(a2 + 24) = 0;
  *(void *)(a2 + 16) = 0;
  id v3 = [a1 payload];
  id v4 = [v3 objectForKey:@"GAXIPCPayloadKeyGAXBackboardState"];

  [v4 getBytes:a2 length:28];
}

id serializeGAXBackboardState(uint64_t a1)
{
  return +[NSData dataWithBytes:a1 length:28];
}

id gaxDebugDescriptionForGAXBackboardState(unsigned int *a1)
{
  id v2 = +[NSMutableString stringWithString:@"GAXBackboardState:\n"];
  objc_msgSend(v2, "appendFormat:", @"  mode: %ld\n", *a1);
  objc_msgSend(v2, "appendFormat:", @"  passcodeWindowContextID: %ld\n", a1[1]);
  objc_msgSend(v2, "appendFormat:", @"  voiceOverItemChooserWindowContextID: %ld\n", a1[2]);
  objc_msgSend(v2, "appendFormat:", @"  tripleClickSheetWindowContextID: %ld\n", a1[3]);
  objc_msgSend(v2, "appendFormat:", @"  shouldBlockAllEvents: %ld\n", a1[6] & 1);
  objc_msgSend(v2, "appendFormat:", @"  restartingAndWasActiveBeforeRestart: %ld\n", ((unint64_t)a1[6] >> 1) & 1);
  objc_msgSend(v2, "appendFormat:", @"  verifyingDeviceUnlockInSAM: %ld\n", ((unint64_t)a1[6] >> 2) & 1);
  objc_msgSend(v2, "appendFormat:", @"  isPasscodeViewVisible: %ld\n", ((unint64_t)a1[6] >> 3) & 1);
  objc_msgSend(v2, "appendFormat:", @"  isRestricted: %ld\n", ((unint64_t)a1[6] >> 4) & 1);
  objc_msgSend(v2, "appendFormat:", @"  overrideAllowsAllTouchSBMiniAlertIsShowing: %ld\n", ((unint64_t)a1[6] >> 5) & 1);
  objc_msgSend(v2, "appendFormat:", @"  overrideAllowsAllTouchCallStateIsChanging: %ld\n", ((unint64_t)a1[6] >> 6) & 1);
  objc_msgSend(v2, "appendFormat:", @"  overrideAllowsAllTouchMakingEmergencyCall: %ld\n", ((unint64_t)a1[6] >> 7) & 1);
  objc_msgSend(v2, "appendFormat:", @"  overrideIgnoresAllTouchAllowedAppNotFound: %ld\n", ((unint64_t)a1[6] >> 8) & 1);
  objc_msgSend(v2, "appendFormat:", @"  overrideIgnoresAllTouchVerifyingIntegrity: %ld\n", ((unint64_t)a1[6] >> 9) & 1);
  objc_msgSend(v2, "appendFormat:", @"  profileConfiguration: %ld\n", a1[5]);
  objc_msgSend(v2, "appendFormat:", @"  allowsTouch: %ld\n", ((unint64_t)a1[6] >> 10) & 1);
  objc_msgSend(v2, "appendFormat:", @"  allowsLockButton: %ld\n", ((unint64_t)a1[6] >> 11) & 1);
  objc_msgSend(v2, "appendFormat:", @"  allowsAppExit: %ld\n", ((unint64_t)a1[6] >> 12) & 1);
  objc_msgSend(v2, "appendFormat:", @"  allowsHomeButton: %ld\n", ((unint64_t)a1[6] >> 13) & 1);
  objc_msgSend(v2, "appendFormat:", @"  allowsVolumeButtons: %ld\n", ((unint64_t)a1[6] >> 14) & 1);
  objc_msgSend(v2, "appendFormat:", @"  allowsRingerSwitch: %ld\n", ((unint64_t)a1[6] >> 15) & 1);
  objc_msgSend(v2, "appendFormat:", @"  allowsMotion: %ld\n", ((unint64_t)a1[6] >> 16) & 1);
  objc_msgSend(v2, "appendFormat:", @"  allowsAutolock: %ld\n", ((unint64_t)a1[6] >> 17) & 1);
  objc_msgSend(v2, "appendFormat:", @"  allowsKeyboardTextInput: %ld\n", ((unint64_t)a1[6] >> 18) & 1);
  objc_msgSend(v2, "appendFormat:", @"  allowsProximity: %ld\n", ((unint64_t)a1[6] >> 19) & 1);

  return v2;
}

BOOL GAXSecTaskHasBooleanEntitlement(__SecTask *a1, void *a2)
{
  id v3 = a2;
  CFErrorRef error = 0;
  CFTypeRef v4 = SecTaskCopyValueForEntitlement(a1, v3, &error);
  if (error)
  {
    id v5 = AXLogCommon();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412802;
      long long v11 = a1;
      __int16 v12 = 2112;
      v13 = v3;
      __int16 v14 = 2112;
      CFErrorRef v15 = error;
      _os_log_error_impl(&dword_0, v5, OS_LOG_TYPE_ERROR, "Unable to check if task %@ has entitlement %@: %@", buf, 0x20u);
    }

    CFRelease(error);
  }
  if (v4)
  {
    CFTypeID v6 = CFGetTypeID(v4);
    BOOL v7 = v6 == CFBooleanGetTypeID() && CFBooleanGetValue((CFBooleanRef)v4) != 0;
    CFRelease(v4);
  }
  else
  {
    BOOL v7 = 0;
  }

  return v7;
}

void sub_5B88(id a1, NSError *a2)
{
  id v2 = a2;
  if (v2)
  {
    id v3 = GAXLogCommon();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
      sub_29CD0((uint64_t)v2, v3);
    }
  }
}

uint64_t sub_5D6C(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t sub_5FDC(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t sub_5FF0(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void sub_6004(uint64_t a1, void *a2)
{
  id v3 = [a2 payload];
  CFTypeRef v4 = [v3 objectForKey:@"GAXIPCPayloadKeyShouldAbortServerModeTransition"];
  unsigned __int8 v5 = [v4 BOOLValue];

  if (v5)
  {
    CFTypeID v6 = GAXLogCommon();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)long long v10 = 0;
      _os_log_impl(&dword_0, v6, OS_LOG_TYPE_DEFAULT, "Transition was aborted by system app.", v10, 2u);
    }

    BOOL v7 = 0;
  }
  else
  {
    BOOL v7 = objc_alloc_init(GAXSpringboardClientStatus);
    v8 = [v3 objectForKey:@"GAXIPCPayloadKeyFrontmostAppName"];
    [(GAXSpringboardClientStatus *)v7 setSessionApplicationName:v8];

    long long v9 = [v3 objectForKey:@"GAXIPCPayloadKeyFrontmostArchivedAppIcon"];
    [(GAXSpringboardClientStatus *)v7 setArchivedSessionApplicationIcon:v9];
  }
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

void sub_6610(uint64_t a1, void *a2, void *a3)
{
  id v5 = a3;
  if (v5)
  {
    CFTypeID v6 = AXLogIPC();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      sub_29DD0((uint64_t)v5, v6);
    }
  }
  else
  {
    BOOL v7 = [a2 payload];
    v8 = [v7 objectForKey:@"GAXIPCPayloadKeyNewPasscodeLength"];
    [v8 unsignedIntegerValue];
  }
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t sub_6968(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t sub_697C(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

id sub_7A88(uint64_t a1)
{
  return [*(id *)(a1 + 32) _didFinishVerifyingCurrentEventWithOutcome:*(void *)(a1 + 48) error:*(void *)(a1 + 40)];
}

id sub_8118(uint64_t a1)
{
  id v2 = GAXLogIntegrity();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    id v3 = [*(id *)(a1 + 32) eventName];
    *(_DWORD *)buf = 138543362;
    long long v9 = v3;
    _os_log_impl(&dword_0, v2, OS_LOG_TYPE_DEFAULT, "Proceeding with verification of event <%{public}@>", buf, 0xCu);
  }
  [*(id *)(a1 + 32) setDelay:0.0];
  uint64_t v5 = *(void *)(a1 + 32);
  CFTypeRef v4 = *(void **)(a1 + 40);
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_8238;
  v7[3] = &unk_48FF0;
  v7[4] = v4;
  return [v4 _verifyWithEventObject:v5 completion:v7];
}

id sub_8238(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) _didFinishVerifyingCurrentEventWithOutcome:a2 error:0];
}

id sub_8248(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) _didFinishVerifyingCurrentEventWithOutcome:a2 error:0];
}

uint64_t sub_8710(uint64_t a1, uint64_t a2)
{
  if (a2 == 23)
  {
    id v3 = [*(id *)(a1 + 32) delegate];
    CFTypeRef v4 = [v3 expectedSessionAppIdentifierForIntegrityVerifier:*(void *)(a1 + 32)];

    uint64_t v5 = [*(id *)(a1 + 32) delegate];
    [v5 attemptAppRelaunchForAppWithIdentifier:v4 withIntegrityVerifier:*(void *)(a1 + 32)];
  }
  CFTypeID v6 = *(uint64_t (**)(void))(*(void *)(a1 + 40) + 16);

  return v6();
}

uint64_t sub_87AC(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 32) + 16))(*(void *)(a1 + 32), *(void *)(a1 + 40));
}

void sub_8B34(uint64_t a1, uint64_t a2)
{
  v10[0] = 0;
  v10[1] = v10;
  v10[2] = 0x2020000000;
  v10[3] = a2;
  id v3 = [*(id *)(a1 + 32) delegate];
  CFTypeRef v4 = *(void **)(a1 + 32);
  uint64_t v5 = [v4 delegate];
  CFTypeID v6 = [v5 expectedSessionAppIdentifier];
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_8C58;
  v7[3] = &unk_490B8;
  long long v9 = v10;
  id v8 = *(id *)(a1 + 40);
  [v3 sessionAppIsBeingInstalledForIntegrityVerifier:v4 sessionIdentifier:v6 completion:v7];

  _Block_object_dispose(v10, 8);
}

void sub_8C40(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_8C58(uint64_t a1, int a2)
{
  if (a2) {
    *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 27;
  }
  id v2 = *(id *)(a1 + 32);
  AXPerformBlockAsynchronouslyOnMainThread();
}

uint64_t sub_8CF8(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 32) + 16))(*(void *)(a1 + 32), *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24));
}

uint64_t sub_8D14(uint64_t a1, void *a2)
{
  id v3 = a2;
  CFTypeRef v4 = [v3 objectForKey:&off_4D770];
  unsigned __int8 v5 = [v4 BOOLValue];

  CFTypeID v6 = [v3 objectForKey:&off_4D788];

  [v6 BOOLValue];
  BOOL v7 = [*(id *)(a1 + 32) delegate];
  [v7 hasSystemPasscodeForIntegrityVerifier:*(void *)(a1 + 32)];

  if (v3
    && ((v5 & 1) != 0
     || [*(id *)(a1 + 32) _appWithIdentifierIsInstalledOnDevice:*(void *)(a1 + 40)]))
  {
    int v8 = *(_DWORD *)(a1 + 76);
    if ((v8 - 2) >= 2)
    {
      if (v8 == 1)
      {
        if (!*(unsigned char *)(a1 + 84))
        {
          long long v9 = [*(id *)(a1 + 32) delegate];
          [v9 relaunchAttemptsForSessionAppWithIdentifier:*(void *)(a1 + 40) forIntegrityVerifier:*(void *)(a1 + 32)];
        }
      }
      else
      {
        _AXAssert();
      }
    }
  }
  long long v10 = *(uint64_t (**)(void))(*(void *)(a1 + 48) + 16);

  return v10();
}

void sub_91D4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v13 - 112), 8);
  _Unwind_Resume(a1);
}

void sub_9200(uint64_t a1, int a2)
{
  if (a2)
  {
    id v3 = GAXLogCommon();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      CFTypeRef v4 = [*(id *)(a1 + 32) displayStringForOutcome:*(void *)(a1 + 64)];
      *(_DWORD *)buf = 138543362;
      BOOL v7 = v4;
      _os_log_impl(&dword_0, v3, OS_LOG_TYPE_DEFAULT, "Had error outcome %{public}@ but session app is being installed, so substituting in the session app being installed outcome", buf, 0xCu);
    }
    [*(id *)(a1 + 32) outcome:27 isError:*(void *)(*(void *)(a1 + 48) + 8) + 24 isIndeterminate:*(void *)(*(void *)(a1 + 56) + 8) + 24];
  }
  id v5 = *(id *)(a1 + 40);
  AXPerformBlockOnMainThreadAfterDelay();
}

id sub_9358(uint64_t a1)
{
  return [*(id *)(a1 + 32) _didFinishVerifyingCurrentEventWithOutcomePhase2:*(void *)(a1 + 56) outcomeIsIndeterminate:*(unsigned __int8 *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) error:*(void *)(a1 + 40)];
}

id sub_95C0(uint64_t a1)
{
  return [*(id *)(a1 + 32) _processNextEventInQueue];
}

void sub_9830(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 2u);
}

void sub_9A10(id a1)
{
  id v1 = +[GAXBackboard sharedInstance];
  [v1 didEnableSystemAppAccess];
}

id GAXAllowedRemoteUIProcesses()
{
  if (qword_560F0 != -1) {
    dispatch_once(&qword_560F0, &stru_49250);
  }
  v0 = (void *)qword_560E8;

  return v0;
}

void sub_9AAC(id a1)
{
  v3[0] = @"com.apple.MailCompositionService";
  v3[1] = @"com.apple.mobilesms.compose";
  v3[2] = @"com.apple.MessageCompositionService";
  v3[3] = @"com.apple.social.remoteui.SocialUIService";
  v3[4] = @"com.apple.quicklook.quicklookd";
  v3[5] = @"com.apple.SafariViewService";
  v3[6] = @"com.apple.CoreAuthUI";
  v3[7] = @"com.apple.InCallService";
  v3[8] = @"com.apple.datadetectors.DDActionsService";
  v3[9] = @"com.apple.shortcuts.runtime";
  v3[10] = @"com.apple.SleepLockScreen";
  v3[11] = @"com.apple.ContactlessUIService";
  uint64_t v1 = +[NSArray arrayWithObjects:v3 count:12];
  id v2 = (void *)qword_560E8;
  qword_560E8 = v1;
}

id GAXURLSchemeIsPhoneRelated(void *a1)
{
  uint64_t v1 = [a1 scheme];
  if (([v1 isEqualToString:@"tel"] & 1) != 0
    || ([v1 isEqualToString:@"facetime"] & 1) != 0)
  {
    id v2 = &dword_0 + 1;
  }
  else
  {
    id v2 = [v1 isEqualToString:@"facetime-audio"];
  }

  return v2;
}

id GAXLocalizedStringForTimeDuration(double a1)
{
  id v2 = objc_opt_new();
  [v2 setZeroFormattingBehavior:1];
  [v2 setUnitsStyle:3];
  if (a1 >= 60.0)
  {
    if ((int)a1 % 60 > 30) {
      a1 = a1 + 60.0;
    }
    uint64_t v3 = 96;
  }
  else
  {
    uint64_t v3 = 128;
  }
  [v2 setAllowedUnits:v3];
  CFTypeRef v4 = [v2 stringFromTimeInterval:a1];

  return v4;
}

void sub_ABC8(id a1)
{
  qword_560F8 = objc_alloc_init(GAXSettings);

  _objc_release_x1();
}

id sub_B184(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return [*(id *)(a1 + 32) appendFormat:@"%@->%@", a2, a3];
}

void sub_BD70(uint64_t a1, void *a2, void *a3)
{
  id v9 = a2;
  id v5 = a3;
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();
  BOOL v7 = *(void **)(a1 + 32);
  if (isKindOfClass)
  {
    id v8 = [v5 mutableCopy];

    id v5 = v8;
  }
  [v7 setObject:v5 forKey:v9];
}

void sub_BEA0(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, v9, OS_LOG_TYPE_ERROR, a4, &a9, 0xCu);
}

void sub_BEC0(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, a5, 0xCu);
}

void sub_CC18(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  CFTypeID v6 = [a3 description];
  id v7 = [v6 stringByReplacingOccurrencesOfString:@"\n", @", " withString];

  [*(id *)(a1 + 32) appendFormat:@"\t%@ : %@\n", v5, v7];
}

void sub_CCB8(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    [*(id *)(a1 + 32) appendFormat:@"\t%@\n", v5];
    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3221225472;
    v9[2] = sub_CE2C;
    v9[3] = &unk_492C0;
    id v10 = *(id *)(a1 + 32);
    [v6 enumerateKeysAndObjectsUsingBlock:v9];
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v7 = +[NSString stringWithFormat:@"NSData<%p>", v6];
    }
    else
    {
      id v8 = [v6 description];
      id v7 = [v8 stringByReplacingOccurrencesOfString:@"\n", @", " withString];
    }
    [*(id *)(a1 + 32) appendFormat:@"\t%@ : %@\n", v5, v7];
  }
}

void sub_CE2C(uint64_t a1, void *a2, void *a3)
{
  id v5 = a3;
  id v6 = a2;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v8 = +[NSString stringWithFormat:@"NSData<%p>", v5];
  }
  else
  {
    id v7 = [v5 description];

    id v8 = [v7 stringByReplacingOccurrencesOfString:@"\n", @", " withString];
    id v5 = v7;
  }

  [*(id *)(a1 + 32) appendFormat:@"\t\t%@ : %@\n", v6, v8];
}

void sub_DB94(uint64_t a1, void *a2)
{
  uint64_t v3 = *(void **)(a1 + 32);
  id v4 = a2;
  id v5 = [v3 stateForRestrictionWithIdentifier:v4];
  id v6 = *(void **)(a1 + 40);
  id v7 = +[NSNumber numberWithInteger:v5];
  [v6 setObject:v7 forKey:v4];
}

void sub_DDC4(id *a1, void *a2, void *a3)
{
  id v10 = a2;
  id v5 = a3;
  id v6 = [v5 integerValue];
  id v7 = [a1[4] objectForKey:v10];
  id v8 = [v7 integerValue];

  if (v6 != v8)
  {
    id v9 = [v10 copy];
    [a1[5] setObject:v5 forKey:v9];
    [a1[6] setObject:v5 forKey:v9];
  }
}

void sub_E5F8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t sub_E614(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void sub_E624(uint64_t a1)
{
}

void sub_E62C(uint64_t a1, void *a2, void *a3)
{
  id v6 = a2;
  if ([a3 isEqualToString:*(void *)(a1 + 32)]) {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a2);
  }
}

void sub_F834(uint64_t a1, uint64_t a2, void *a3)
{
  id v5 = a3;
  char v8 = 0;
  id v6 = [*(id *)(a1 + 32) _guidedAccessProfileKeyForManagedConfigKey:a2 shouldInvertValue:&v8];
  if (v6)
  {
    if (v8)
    {
      uint64_t v7 = +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", [v5 BOOLValue] ^ 1);

      id v5 = (id)v7;
    }
    [*(id *)(a1 + 40) setObject:v5 forKey:v6];
  }
}

void sub_F8DC(uint64_t a1, uint64_t a2, void *a3)
{
  id v5 = a3;
  char v8 = 0;
  id v6 = [*(id *)(a1 + 32) _guidedAccessProfileKeyForManagedConfigKey:a2 shouldInvertValue:&v8];
  if (v6)
  {
    if (v8)
    {
      uint64_t v7 = +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", [v5 BOOLValue] ^ 1);

      id v5 = (id)v7;
    }
    [*(id *)(a1 + 40) setObject:v5 forKey:v6];
  }
}

void sub_FA48(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) delegate];
  [v2 pauseVerificationForProfileManager:*(void *)(a1 + 32)];

  uint64_t v3 = [*(id *)(a1 + 32) managedConfigurationNotificationCoalesceTimer];
  [v3 cancel];

  id v4 = [*(id *)(a1 + 32) managedConfigurationNotificationCoalesceTimer];
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_FB10;
  v5[3] = &unk_48928;
  v5[4] = *(void *)(a1 + 32);
  [v4 afterDelay:v5 processBlock:5.0];
}

void sub_FB10(uint64_t a1)
{
  id v2 = GAXLogCommon();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v4 = 0;
    _os_log_impl(&dword_0, v2, OS_LOG_TYPE_DEFAULT, "Now acting on last received MCProfileListChangedNotification", v4, 2u);
  }

  [*(id *)(a1 + 32) _updateConfigurationAndNotifyDelegate:1];
  uint64_t v3 = [*(id *)(a1 + 32) delegate];
  [v3 resumeVerificationForProfileManager:*(void *)(a1 + 32)];
}

void sub_105A0(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 0xCu);
}

void sub_10704(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

id sub_10724(uint64_t a1, void *a2)
{
  id v2 = (id *)(a1 + 32);
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained(v2);
  id v5 = [WeakRetained _handleSystemEvent:v3];

  return v5;
}

BOOL sub_10794(id a1, AXEventRepresentation *a2)
{
  id v2 = GAXLogIntegrity();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG)) {
    sub_2A714(v2);
  }

  return 1;
}

void sub_10A54(uint64_t a1)
{
  id v2 = GAXLogCommon();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG)) {
    sub_2A758(a1, v2);
  }
}

void sub_10CD0(uint64_t a1)
{
  id v2 = +[AXEventTapManager sharedManager];
  [v2 sendEvent:*(void *)(a1 + 32) afterTap:AXEventTapIdentifierGuidedAccess useGSEvent:0 namedTaps:0 options:0];
}

void sub_11234(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) delegate];
  [v2 unlockDeviceWithEventProcessor:*(void *)(a1 + 32)];

  *(void *)(*(void *)(a1 + 32) + 64) = 0;
  *(void *)(*(void *)(a1 + 32) + 56) = 0;
  id v3 = [*(id *)(a1 + 32) delegate];
  [v3 monitorForTouchIDWithEventProcessor:*(void *)(a1 + 32)];
}

void sub_112C4(uint64_t a1)
{
  *(void *)(*(void *)(a1 + 32) + 64) = 0;
  *(void *)(*(void *)(a1 + 32) + 56) = 0;
  id v2 = *(void **)(a1 + 32);
  if ((*(unsigned char *)(a1 + 73) & 8) != 0)
  {
    if (v2[9] || (_AXAssert(), id v2 = *(void **)(a1 + 32), v2[9]))
    {
      id v4 = [v2 delegate];
      [v4 unlockDeviceIfSleepingWithEventProcessor:*(void *)(a1 + 32)];

      id v5 = *(void **)(a1 + 32);
      uint64_t v6 = *(void *)(a1 + 40);
      uint64_t v7 = v5[9];
      [v5 _postLockButtonPressWithDown:v7 up:v6];
    }
  }
  else
  {
    id v3 = [v2 delegate];
    [v3 unlockDeviceWithEventProcessor:*(void *)(a1 + 32)];

    id v8 = [*(id *)(a1 + 32) delegate];
    [v8 eventProcessor:*(void *)(a1 + 32) showAlertWithType:1];
  }
}

void sub_11CFC(id a1)
{
  qword_56108 = objc_alloc_init(GAXBackboard);

  _objc_release_x1();
}

id sub_12398(uint64_t a1)
{
  return [*(id *)(a1 + 32) _performValidation];
}

id sub_123A0(uint64_t a1)
{
  return [*(id *)(a1 + 32) _handleSpringboardDidGoInvalid];
}

id sub_123A8(uint64_t a1, void *a2)
{
  return [a2 _handleLostModeChanged];
}

void sub_12490(uint64_t a1)
{
  [*(id *)(a1 + 32) _updateRestrictedState:0];
  id v2 = +[AXSpringBoardServer server];
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472;
  v3[2] = sub_12534;
  v3[3] = &unk_49460;
  v3[4] = *(void *)(a1 + 32);
  [v2 screenLockStatus:v3 passcodeStatusRequired:0];
}

void sub_12534(uint64_t a1, int a2, int a3)
{
  char IsLoginSession = AXSessionIsLoginSession();
  if ((a2 & a3 & 1) == 0 && (IsLoginSession & 1) == 0)
  {
    uint64_t v7 = [*(id *)(a1 + 32) profileManager];
    unsigned int v8 = [v7 configuration];

    if (v8 == 2)
    {
      [*(id *)(a1 + 32) _updateSessionAppForSingleAppMode];
      [*(id *)(a1 + 32) _notifyOfGAXBackboardStateChange];
      uint64_t v9 = [*(id *)(a1 + 32) integrityVerifier];
      [v9 verifyIntegrityWithEvent:18];

      id v10 = *(void **)(a1 + 32);
      [v10 _applyDeniedStatesForRestrictions];
    }
  }
}

void sub_126F8(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 40));
  _Unwind_Resume(a1);
}

void sub_1271C(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  id v3 = [WeakRetained expectedSessionAppIdentifier];
  unsigned int v4 = [WeakRetained _appWithIdentifierIsBeingInstalled:v3];

  id v5 = GAXLogCommon();
  uint64_t v6 = v5;
  if (v4)
  {
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      int v16 = 134217984;
      uint64_t v17 = 0x403E000000000000;
      _os_log_impl(&dword_0, v6, OS_LOG_TYPE_INFO, "Didn't get a frontmost app change in %f seconds, but session app is being installed. Will wait for that to finish.", (uint8_t *)&v16, 0xCu);
    }
  }
  else
  {
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      sub_2A890(v6, v7, v8, v9, v10, v11, v12, v13);
    }

    uint64_t v6 = [*(id *)(a1 + 32) appManager];
    __int16 v14 = [v6 sessionAppBundleIdentifiers];
    CFErrorRef v15 = [v14 firstObject];
    [WeakRetained _launchSessionAppWithIdentifier:v15];
  }
}

id sub_1297C(uint64_t a1)
{
  [*(id *)(*(void *)(a1 + 32) + 256) addObject:*(void *)(a1 + 40)];
  id result = [*(id *)(*(void *)(a1 + 32) + 256) count];
  *(_DWORD *)(*(void *)(a1 + 32) + 40) = *(_DWORD *)(*(void *)(a1 + 32) + 40) & 0xFFFFFFFE | (result != 0);
  return result;
}

id sub_12AF0(uint64_t a1)
{
  [*(id *)(*(void *)(a1 + 32) + 256) removeObject:*(void *)(a1 + 40)];
  id result = [*(id *)(*(void *)(a1 + 32) + 256) count];
  *(_DWORD *)(*(void *)(a1 + 32) + 40) = *(_DWORD *)(*(void *)(a1 + 32) + 40) & 0xFFFFFFFE | (result != 0);
  return result;
}

uint64_t sub_12C34(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void sub_12C44(uint64_t a1)
{
}

uint64_t sub_12C4C(uint64_t a1)
{
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = [*(id *)(*(void *)(a1 + 32) + 256) copy];

  return _objc_release_x1();
}

id sub_12D08(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) appManager];
  [v2 updateSessionAppBundleIdentifiers:0];

  id v3 = [*(id *)(a1 + 32) integrityVerifier];
  [v3 verifyIntegrityWithEvent:3];

  unsigned int v4 = *(void **)(a1 + 32);

  return [v4 setDisableSystemGesturesForActiveAssertion:0];
}

id sub_12E58(uint64_t a1, uint64_t a2)
{
  if ((int)a2 <= 0)
  {
    uint64_t v6 = GAXLogCommon();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_0, v6, OS_LOG_TYPE_DEFAULT, "Still waiting to connect to SB. Will try again in .5", buf, 2u);
    }
    goto LABEL_11;
  }
  if (([*(id *)(a1 + 40) gaxServerIsReady] & 1) == 0)
  {
    uint64_t v6 = GAXLogCommon();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_0, v6, OS_LOG_TYPE_DEFAULT, "Still waiting for GAX SpringBoard Server to load. Will try again in .1", buf, 2u);
    }
LABEL_11:

    return (id)AXPerformBlockOnMainThreadAfterDelay();
  }
  unsigned int v4 = *(void **)(a1 + 32);
  uint64_t v5 = *(unsigned __int8 *)(a1 + 48);

  return [v4 _prepareGuidedAccessAfterConnectingToSpringboard:v5 springBoardPID:a2];
}

id sub_13010(uint64_t a1)
{
  return [*(id *)(a1 + 32) _prepareGuidedAccessAfterConnectingToSpringboard:*(unsigned __int8 *)(a1 + 40)];
}

id sub_13020(uint64_t a1)
{
  return [*(id *)(a1 + 32) _prepareGuidedAccessAfterConnectingToSpringboard:*(unsigned __int8 *)(a1 + 40)];
}

void sub_13100(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (v3)
  {
    unsigned int v4 = GAXLogCommon();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      sub_2A904();
    }

    [*(id *)(a1 + 32) _prepareGuidedAccessAfterConnectingToSpringboard:*(unsigned __int8 *)(a1 + 44)];
  }
  else
  {
    uint64_t v5 = +[AXSpringBoardServer server];
    v6[0] = _NSConcreteStackBlock;
    v6[1] = 3221225472;
    v6[2] = sub_131FC;
    v6[3] = &unk_49528;
    v6[4] = *(void *)(a1 + 32);
    char v8 = *(unsigned char *)(a1 + 44);
    int v7 = *(_DWORD *)(a1 + 40);
    [v5 screenLockStatus:v6 passcodeStatusRequired:0];
  }
}

void sub_131FC(uint64_t a1, uint64_t a2)
{
  [*(id *)(a1 + 32) _prepareGuidedAccessAfterConnectingToSpringboard:*(unsigned __int8 *)(a1 + 44) springBoardPID:*(unsigned int *)(a1 + 40) screenLocked:a2];
  if (*(unsigned char *)(a1 + 44))
  {
    uint64_t v7 = 0;
    char v8 = &v7;
    uint64_t v9 = 0x2020000000;
    int v10 = 0;
    uint64_t v3 = *(void *)(a1 + 32);
    unsigned int v4 = *(NSObject **)(v3 + 8);
    v6[0] = _NSConcreteStackBlock;
    v6[1] = 3221225472;
    v6[2] = sub_132FC;
    v6[3] = &unk_494B0;
    v6[4] = v3;
    void v6[5] = &v7;
    dispatch_sync(v4, v6);
    [*(id *)(a1 + 32) _updateDisablingSystemGesturesForMode:*((unsigned int *)v8 + 6)];
    uint64_t v5 = [*(id *)(a1 + 32) integrityVerifier];
    [v5 springBoardDidRelaunch];

    _Block_object_dispose(&v7, 8);
  }
}

void sub_132E4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t sub_132FC(uint64_t result)
{
  *(_DWORD *)(*(void *)(*(void *)(result + 40) + 8) + 24) = *(_DWORD *)(*(void *)(result + 32) + 16);
  return result;
}

void sub_137AC(uint64_t a1)
{
  id v4 = +[NSNotificationCenter defaultCenter];
  [v4 addObserver:*(void *)(a1 + 32) selector:"_handleToggleServerModeNotification:" name:AXBackboardServerShouldToggleGuidedAccessNotification object:0];
  [v4 addObserver:*(void *)(a1 + 32) selector:"_handleAssistiveTouchEnabledNotification:" name:kAXSAssistiveTouchEnabledNotification object:0];
  [v4 addObserver:*(void *)(a1 + 32) selector:"_handleAssistiveTouchEnabledNotification:" name:TUCallCenterCallStatusChangedNotification object:0];
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterAddObserver(DarwinNotifyCenter, *(const void **)(a1 + 32), (CFNotificationCallback)sub_138C0, @"com.apple.mobile.SubstantialTransition", 0, CFNotificationSuspensionBehaviorDeliverImmediately);
  uint64_t v3 = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterAddObserver(v3, *(const void **)(a1 + 32), (CFNotificationCallback)sub_138C8, kAXSGuidedAccessActivateNotification, 0, CFNotificationSuspensionBehaviorDeliverImmediately);
}

id sub_138C0(uint64_t a1, void *a2)
{
  return [a2 _handleSubstationalTransition];
}

id sub_138C8(uint64_t a1, void *a2)
{
  return [a2 _handleServerModeChangeRequestWithType:2];
}

void sub_13F70(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
  long long v4 = *(_OWORD *)(v2 + 16);
  *(_OWORD *)(v3 + 44) = *(_OWORD *)(v2 + 28);
  *(_OWORD *)(v3 + 32) = v4;
  id v15 = [*(id *)(a1 + 32) profileManager];
  *(_DWORD *)(*(void *)(*(void *)(a1 + 40) + 8) + 52) = [v15 configuration];
  if ([v15 shouldAllowTouch]) {
    int v5 = 1024;
  }
  else {
    int v5 = 0;
  }
  *(_DWORD *)(*(void *)(*(void *)(a1 + 40) + 8) + 56) = *(_DWORD *)(*(void *)(*(void *)(a1 + 40) + 8)
                                                                          + 56) & 0xFFFFFBFF | v5;
  if ([v15 shouldAllowLockButton]) {
    int v6 = 2048;
  }
  else {
    int v6 = 0;
  }
  *(_DWORD *)(*(void *)(*(void *)(a1 + 40) + 8) + 56) = *(_DWORD *)(*(void *)(*(void *)(a1 + 40) + 8)
                                                                          + 56) & 0xFFFFF7FF | v6;
  if ([v15 shouldAllowExit]) {
    int v7 = 4096;
  }
  else {
    int v7 = 0;
  }
  *(_DWORD *)(*(void *)(*(void *)(a1 + 40) + 8) + 56) = *(_DWORD *)(*(void *)(*(void *)(a1 + 40) + 8)
                                                                          + 56) & 0xFFFFEFFF | v7;
  if ([v15 shouldAllowHomeButton]) {
    int v8 = 0x2000;
  }
  else {
    int v8 = 0;
  }
  *(_DWORD *)(*(void *)(*(void *)(a1 + 40) + 8) + 56) = *(_DWORD *)(*(void *)(*(void *)(a1 + 40) + 8)
                                                                          + 56) & 0xFFFFDFFF | v8;
  if ([v15 shouldAllowVolumeButtons]) {
    int v9 = 0x4000;
  }
  else {
    int v9 = 0;
  }
  *(_DWORD *)(*(void *)(*(void *)(a1 + 40) + 8) + 56) = *(_DWORD *)(*(void *)(*(void *)(a1 + 40) + 8)
                                                                          + 56) & 0xFFFFBFFF | v9;
  if ([v15 shouldAllowRingerSwitch]) {
    int v10 = 0x8000;
  }
  else {
    int v10 = 0;
  }
  *(_DWORD *)(*(void *)(*(void *)(a1 + 40) + 8) + 56) = *(_DWORD *)(*(void *)(*(void *)(a1 + 40) + 8)
                                                                          + 56) & 0xFFFF7FFF | v10;
  if ([v15 shouldAllowMotion]) {
    int v11 = 0x10000;
  }
  else {
    int v11 = 0;
  }
  *(_DWORD *)(*(void *)(*(void *)(a1 + 40) + 8) + 56) = *(_DWORD *)(*(void *)(*(void *)(a1 + 40) + 8)
                                                                          + 56) & 0xFFFEFFFF | v11;
  if ([v15 shouldAllowAutolock]) {
    int v12 = 0x20000;
  }
  else {
    int v12 = 0;
  }
  *(_DWORD *)(*(void *)(*(void *)(a1 + 40) + 8) + 56) = *(_DWORD *)(*(void *)(*(void *)(a1 + 40) + 8)
                                                                          + 56) & 0xFFFDFFFF | v12;
  if ([v15 shouldAllowKeyboardTextInput]) {
    int v13 = 0x40000;
  }
  else {
    int v13 = 0;
  }
  *(_DWORD *)(*(void *)(*(void *)(a1 + 40) + 8) + 56) = *(_DWORD *)(*(void *)(*(void *)(a1 + 40) + 8)
                                                                          + 56) & 0xFFFBFFFF | v13;
  if ([v15 shouldAllowProximity]) {
    int v14 = 0x80000;
  }
  else {
    int v14 = 0;
  }
  *(_DWORD *)(*(void *)(*(void *)(a1 + 40) + 8) + 56) = *(_DWORD *)(*(void *)(*(void *)(a1 + 40) + 8)
                                                                          + 56) & 0xFFF7FFFF | v14;
}

uint64_t sub_14248(uint64_t result)
{
  *(unsigned char *)(*(void *)(*(void *)(result + 40) + 8) + 24) = *(_DWORD *)(*(void *)(result + 32) + 16) == 2;
  return result;
}

uint64_t sub_14310(uint64_t result)
{
  *(unsigned char *)(*(void *)(*(void *)(result + 40) + 8) + 24) = (*(unsigned char *)(*(void *)(result + 32) + 40) & 8) != 0;
  return result;
}

uint64_t sub_143D4(uint64_t result)
{
  *(unsigned char *)(*(void *)(*(void *)(result + 40) + 8) + 24) = *(_DWORD *)(*(void *)(result + 32) + 16) == 1;
  return result;
}

void sub_146A4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t sub_146C0(uint64_t result)
{
  *(_DWORD *)(*(void *)(*(void *)(result + 40) + 8) + 24) = *(_DWORD *)(*(void *)(result + 32) + 16);
  *(_DWORD *)(*(void *)(result + 32) + 16) = *(_DWORD *)(result + 48);
  return result;
}

void sub_14CB4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t sub_14CCC(uint64_t result)
{
  *(_DWORD *)(*(void *)(*(void *)(result + 40) + 8) + 24) = *(_DWORD *)(*(void *)(result + 32) + 16);
  return result;
}

void sub_14D58(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) clientPortsToBundleIds];
  uint64_t v3 = +[NSNumber numberWithUnsignedInt:*(unsigned int *)(a1 + 40)];
  long long v4 = [v2 objectForKeyedSubscript:v3];

  int v5 = GAXLogAppLaunching();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v6 = *(unsigned int *)(a1 + 40);
    int v15 = 138543618;
    int v16 = v4;
    __int16 v17 = 2048;
    uint64_t v18 = v6;
    _os_log_impl(&dword_0, v5, OS_LOG_TYPE_DEFAULT, "Was notified gax client did become invalid: %{public}@. send right name: %llx", (uint8_t *)&v15, 0x16u);
  }

  if ([*(id *)(a1 + 32) isActive])
  {
    if (!v4
      || ([*(id *)(a1 + 32) appManager],
          int v7 = objc_claimAutoreleasedReturnValue(),
          unsigned int v8 = [v7 appWithIdentifierIsASessionApp:v4],
          v7,
          v8))
    {
      int v9 = [*(id *)(a1 + 32) profileManager];
      unsigned int v10 = [v9 shouldAutolaunchCrashedApps];

      if (v10) {
        uint64_t v11 = 7;
      }
      else {
        uint64_t v11 = 8;
      }
      int v12 = [*(id *)(a1 + 32) integrityVerifier];
      [v12 verifyIntegrityWithEvent:v11 afterDelay:1.5];
    }
  }
  int v13 = [*(id *)(a1 + 32) clientPortsToBundleIds];
  int v14 = +[NSNumber numberWithUnsignedInt:*(unsigned int *)(a1 + 40)];
  [v13 removeObjectForKey:v14];
}

id sub_14FB0(uint64_t a1)
{
  return [*(id *)(a1 + 32) _setPasscode:*(void *)(a1 + 40)];
}

void sub_15128(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 40);
  uint64_t v3 = [*(id *)(a1 + 32) clientPortsToBundleIds];
  long long v4 = +[NSNumber numberWithUnsignedInt:*(unsigned int *)(a1 + 48)];
  [v3 setObject:v2 forKeyedSubscript:v4];

  id v5 = [*(id *)(a1 + 32) appManager];
  [v5 gaxClientDidLoad:*(void *)(a1 + 40) pid:*(unsigned int *)(a1 + 52)];
  [*(id *)(a1 + 32) _handleUpdateGAXClientState];
}

void sub_15328(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) appManager];
  [v2 updateManagedAppState:0];
  [v2 appWithBundleIdentifier:*(void *)(a1 + 40) becameActiveWithPid:*(unsigned int *)(a1 + 48)];
  [*(id *)(a1 + 32) setWasEverActiveInCurrentFrontmostApp:0];
  uint64_t v3 = GAXLogAppLaunching();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    long long v4 = [v2 sessionAppBundleIdentifiers];
    id v5 = [v2 effectiveAppBundleIdentifier];
    *(_DWORD *)buf = 138412546;
    uint64_t v18 = v4;
    __int16 v19 = 2112;
    v20 = v5;
    _os_log_impl(&dword_0, v3, OS_LOG_TYPE_DEFAULT, "Session apps are %@. Effective app is %@.", buf, 0x16u);
  }
  unsigned int v6 = [v2 sessionAppIsEffectiveApp:*(void *)(a1 + 40)];
  int v7 = *(void **)(a1 + 32);
  if (v6)
  {
    if ([v7 shouldStartSessionUponFrontmostAppChanged])
    {
      unsigned int v8 = GAXLogAppLaunching();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_0, v8, OS_LOG_TYPE_INFO, "About to transition to active with new frontmost app", buf, 2u);
      }

      [*(id *)(a1 + 32) _transitionToMode:2];
      [*(id *)(a1 + 32) _updateRestrictedState:0];
      [*(id *)(a1 + 32) _updateIsInitializingAndWasActiveBeforeReboot:0];
    }
    [*(id *)(a1 + 32) setShouldStartSessionUponFrontmostAppChanged:0];
    [*(id *)(a1 + 32) _handleUpdateGAXClientState];
    goto LABEL_21;
  }
  if (![v7 wantsSingleAppModeOrAppSelfLockMode]
    || ([v2 sessionAppIsEffectiveApp:*(void *)(a1 + 40)] & 1) != 0)
  {
    goto LABEL_21;
  }
  if ([v2 effectiveAppIsPurpleBuddy])
  {
    int v9 = GAXLogAppLaunching();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      sub_2AAA8();
    }
LABEL_20:

    goto LABEL_21;
  }
  if ([v2 effectiveAppIsCoreAuthUI])
  {
    int v9 = GAXLogAppLaunching();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_0, v9, OS_LOG_TYPE_DEFAULT, "Effective app does not match session app, but is CoreAuthUI. will continue to run.", buf, 2u);
    }
    goto LABEL_20;
  }
  unsigned int v10 = [*(id *)(a1 + 32) profileManager];
  uint64_t v11 = [v2 effectiveAppBundleIdentifier];
  unsigned int v12 = [v10 appAllowlistActiveAndContainsAdditionalApp:v11];

  if (v12)
  {
    int v9 = GAXLogAppLaunching();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      sub_2AADC(v2);
    }
    goto LABEL_20;
  }
  int v13 = [v2 sessionAppBundleIdentifiers];
  int v14 = [v2 effectiveAppBundleIdentifier];
  int v15 = [v13 containsObject:v14];

  if ((v15 & 1) == 0)
  {
    int v16 = GAXLogAppLaunching();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
      sub_2AB8C();
    }

    [v2 terminateEffectiveApp];
    AXPerformBlockAsynchronouslyOnMainThread();
  }
LABEL_21:
}

void sub_156AC(uint64_t a1)
{
  id v1 = [*(id *)(a1 + 32) integrityVerifier];
  [v1 verifyIntegrityWithEvent:16];
}

id sub_15768(uint64_t a1)
{
  id result = [*(id *)(a1 + 32) isInWorkspace];
  if (result)
  {
    uint64_t v3 = *(void **)(a1 + 32);
    return [v3 _transitionToMode:0];
  }
  return result;
}

uint64_t sub_15984(uint64_t result)
{
  *(_DWORD *)(*(void *)(result + 32) + 40) |= 4u;
  return result;
}

uint64_t sub_15A10(uint64_t result)
{
  *(_DWORD *)(*(void *)(result + 32) + 28) = *(_DWORD *)(result + 40);
  return result;
}

uint64_t sub_15B28(uint64_t result)
{
  *(_DWORD *)(*(void *)(result + 32) + 24) = *(_DWORD *)(result + 40);
  return result;
}

uint64_t sub_15BB0(uint64_t result)
{
  *(_DWORD *)(*(void *)(result + 32) + 40) = *(_DWORD *)(*(void *)(result + 32) + 40) & 0xFFFFFFDF | (32 * *(unsigned __int8 *)(result + 40));
  return result;
}

uint64_t sub_15C44(uint64_t result)
{
  *(_DWORD *)(*(void *)(result + 32) + 40) = *(_DWORD *)(*(void *)(result + 32) + 40) & 0xFFFFFF7F | (*(unsigned __int8 *)(result + 40) << 7);
  return result;
}

void sub_15DB0(uint64_t a1)
{
  uint64_t v2 = GAXLogCommon();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    id v3 = [*(id *)(a1 + 32) appLaunchGeneration];
    int v5 = 134217984;
    id v6 = v3;
    _os_log_impl(&dword_0, v2, OS_LOG_TYPE_INFO, "App launch generation %lu was correct", (uint8_t *)&v5, 0xCu);
  }

  long long v4 = [*(id *)(a1 + 32) integrityVerifier];
  [v4 didFinishAppLaunchAttemptWithConfiguration:*(unsigned int *)(a1 + 48) errorMessage:*(void *)(a1 + 40)];
}

void sub_15E7C(uint64_t a1)
{
  uint64_t v2 = GAXLogCommon();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR)) {
    sub_2ABC0(a1);
  }

  id v3 = [*(id *)(a1 + 32) integrityVerifier];
  [v3 didFinishAppLaunchAttemptWithConfiguration:*(unsigned int *)(a1 + 48) errorMessage:@"stale app launch generation count"];
}

void sub_15F60(uint64_t a1)
{
  id v1 = [*(id *)(a1 + 32) settings];
  [v1 setSystemDidRestartDueToLowBattery:1];
}

void sub_16F04(uint64_t a1)
{
  int v2 = *(unsigned __int8 *)(a1 + 48);
  if (*(unsigned char *)(a1 + 48))
  {
    id v3 = [*(id *)(a1 + 40) objectForKey:@"passcode window context ID"];
    unsigned int v4 = [v3 unsignedIntegerValue];
    uint64_t v6 = *(void *)(a1 + 32);
    int v5 = (unsigned __int8 *)(a1 + 32);
    *(_DWORD *)(v6 + 20) = v4;

    int v2 = 8 * v5[16];
  }
  else
  {
    int v5 = (unsigned __int8 *)(a1 + 32);
    *(_DWORD *)(*(void *)(a1 + 32) + 20) = 0;
  }
  *(_DWORD *)(*(void *)v5 + 40) = *(_DWORD *)(*(void *)v5 + 40) & 0xFFFFFFF7 | v2;
}

id sub_16F80(uint64_t a1)
{
  int v2 = GAXLogCommon();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)unsigned int v4 = 0;
    _os_log_impl(&dword_0, v2, OS_LOG_TYPE_DEFAULT, "self.locked = NO (Touch ID)", v4, 2u);
  }

  [*(id *)(a1 + 32) setLocked:0];
  [*(id *)(a1 + 32) _setTimeRestrictionHasExpired:0];
  [*(id *)(a1 + 32) _transitionToMode:0];
  [*(id *)(a1 + 32) _showAlertWithTextType:2 asBanner:0 isUrgent:0];
  [*(id *)(a1 + 32) setDesiredModeAfterSuccessfulPasscodeEntry:0];
  return [*(id *)(a1 + 32) setPasscodeEntryFailedCount:0];
}

id sub_1703C(uint64_t a1, int a2)
{
  unsigned int v4 = GAXLogCommon();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)unsigned int v8 = 0;
    _os_log_impl(&dword_0, v4, OS_LOG_TYPE_DEFAULT, "self.locked = NO (passcode succeeded)", v8, 2u);
  }

  [*(id *)(a1 + 32) setLocked:0];
  [*(id *)(a1 + 32) _setTimeRestrictionHasExpired:0];
  if (a2
    && (+[AXSpringBoardServer server],
        int v5 = objc_claimAutoreleasedReturnValue(),
        unsigned __int8 v6 = [v5 gaxIsSystemAppShowingTransientOverlay],
        v5,
        (v6 & 1) == 0))
  {
    [*(id *)(a1 + 32) _transitionToMode:0];
    [*(id *)(a1 + 32) _showAlertWithTextType:2 asBanner:0 isUrgent:0];
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "_transitionToMode:", objc_msgSend(*(id *)(a1 + 32), "desiredModeAfterSuccessfulPasscodeEntry"));
  }
  [*(id *)(a1 + 32) setDesiredModeAfterSuccessfulPasscodeEntry:0];
  return [*(id *)(a1 + 32) setPasscodeEntryFailedCount:0];
}

id sub_17148(uint64_t a1, char a2)
{
  id v3 = *(void **)(a1 + 32);
  if (a2) {
    id v4 = 0;
  }
  else {
    id v4 = [*(id *)(a1 + 32) desiredModeAfterSuccessfulPasscodeEntry];
  }
  [v3 _transitionToMode:v4];
  int v5 = *(void **)(a1 + 32);

  return [v5 setDesiredModeAfterSuccessfulPasscodeEntry:0];
}

void sub_17348(uint64_t a1)
{
  uint64_t v24 = 0;
  uint64_t v25 = &v24;
  uint64_t v26 = 0x2020000000;
  int v27 = 0;
  uint64_t v2 = *(void *)(a1 + 32);
  id v3 = *(NSObject **)(v2 + 8);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_176F4;
  block[3] = &unk_494B0;
  block[4] = v2;
  block[5] = &v24;
  dispatch_sync(v3, block);
  int v4 = *((_DWORD *)v25 + 6);
  if (v4 == 2)
  {
    id v6 = [*(id *)(a1 + 32) activeInterfaceOrientation];
    int v7 = [*(id *)(a1 + 32) profileManager];
    v21 = [v7 ignoredTouchRegionsForOrientation:v6];

    v20 = [*(id *)(a1 + 32) profileManager];
    unsigned int v8 = +[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", [v20 configuration]);
    v29[0] = v8;
    int v9 = [*(id *)(a1 + 32) profileManager];
    unsigned int v10 = +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", [v9 timeRestrictionsEnabled]);
    v29[1] = v10;
    uint64_t v11 = [*(id *)(a1 + 32) profileManager];
    unsigned int v12 = +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", [v11 appTimeoutDuration]);
    v29[2] = v12;
    int v13 = +[NSNumber numberWithUnsignedInt:*((unsigned int *)v25 + 6)];
    v29[3] = v13;
    int v14 = +[NSArray arrayWithObjects:v29 count:4];
    v28[0] = @"profile configuration";
    v28[1] = @"time restrictions enabled";
    v28[2] = @"time restriction duration";
    v28[3] = @"server mode for disabling telephony";
    int v15 = +[NSArray arrayWithObjects:v28 count:4];
    int v16 = +[NSMutableDictionary dictionaryWithObjects:v14 forKeys:v15];

    if (v21) {
      [v16 setObject:v21 forKeyedSubscript:@"interest area paths for storage"];
    }
    __int16 v17 = [*(id *)(a1 + 32) userInterfaceClient];
    [v17 sendAsynchronousMessage:v16 withIdentifier:10 targetAccessQueue:0 completion:0];
  }
  else if (v4 == 1)
  {
    int v5 = +[AXSpringBoardServer server];
    [v5 stopHostingWorkspaceApplicationImmediately];

    [*(id *)(a1 + 32) _transitionToMode:0 requireUserUnlock:0 assumeUserInterfaceConnectionSevered:1];
  }
  uint64_t v18 = *(void *)(a1 + 32);
  __int16 v19 = *(NSObject **)(v18 + 8);
  v22[0] = _NSConcreteStackBlock;
  v22[1] = 3221225472;
  v22[2] = sub_17708;
  v22[3] = &unk_48928;
  v22[4] = v18;
  dispatch_sync(v19, v22);
  _Block_object_dispose(&v24, 8);
}

void sub_176C8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, ...)
{
  va_start(va, a15);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t sub_176F4(uint64_t result)
{
  *(_DWORD *)(*(void *)(*(void *)(result + 40) + 8) + 24) = *(_DWORD *)(*(void *)(result + 32) + 16);
  return result;
}

uint64_t sub_17708(uint64_t result)
{
  *(_DWORD *)(*(void *)(result + 32) + 40) &= ~8u;
  return result;
}

void sub_17790(uint64_t a1)
{
  uint64_t v2 = GAXLogIntegrity();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v3 = 0;
    _os_log_impl(&dword_0, v2, OS_LOG_TYPE_DEFAULT, "Start ignoring all touches via override for verifying integrity", v3, 2u);
  }

  *(_DWORD *)(*(void *)(a1 + 32) + 40) |= 0x200u;
}

id sub_17A40(uint64_t a1)
{
  [*(id *)(a1 + 32) _transitionToMode:2];
  uint64_t v2 = *(void **)(a1 + 32);

  return [v2 _updateRestrictedState:0];
}

void sub_17A84(uint64_t a1)
{
  [*(id *)(a1 + 32) removeReasonToBlockAllEvents:@"GAX verifying app relaunch"];
  id v2 = [*(id *)(a1 + 32) eventProcessor];
  [v2 endHandlingSystemEventsForReason:@"GAX Launching app"];
}

id sub_18260(uint64_t a1, int a2, int a3)
{
  if (*(_DWORD *)(a1 + 40) == 3) {
    uint64_t v3 = 0;
  }
  else {
    uint64_t v3 = a2 & a3 ^ 1u;
  }
  return [*(id *)(a1 + 32) _transitionToMode:0 requireUserUnlock:v3];
}

void sub_18284(uint64_t a1)
{
  id v2 = GAXLogIntegrity();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)uint64_t v3 = 0;
    _os_log_impl(&dword_0, v2, OS_LOG_TYPE_DEFAULT, "Stop ignoring all touches via override for verifying integrity", v3, 2u);
  }

  *(_DWORD *)(*(void *)(a1 + 32) + 40) &= ~0x200u;
}

id sub_185AC(uint64_t a1, void *a2, void *a3)
{
  *a2 = 0;
  int v5 = +[AXSpringBoardServer server];
  uint64_t v6 = *(void *)(a1 + 32);
  int v7 = [*(id *)(a1 + 40) profileManager];
  id v8 = [v7 configuration];
  uint64_t v9 = *(void *)(a1 + 48);
  id v14 = 0;
  id v10 = [v5 gaxLaunchApplication:v6 withConfiguration:v8 appLaunchGeneration:v9 enqueueError:&v14];
  id v11 = v14;

  if (v11)
  {
    unsigned int v12 = GAXLogCommon();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
      sub_2ADE8();
    }

    if (a3) {
      *a3 = v11;
    }
  }

  return v10;
}

void sub_18690(id a1, BOOL a2, id a3, NSError *a4)
{
  int v5 = a4;
  if (!a2)
  {
    uint64_t v6 = GAXLogCommon();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      sub_2AE50();
    }
  }
}

uint64_t sub_18C0C(uint64_t a1)
{
  unsigned int v2 = [*(id *)(a1 + 32) _appWithIdentifierIsBeingInstalled:*(void *)(a1 + 40)];
  uint64_t v3 = GAXLogIntegrity();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v4 = *(void *)(a1 + 40);
    v6[0] = 67109378;
    v6[1] = v2;
    __int16 v7 = 2112;
    uint64_t v8 = v4;
    _os_log_impl(&dword_0, v3, OS_LOG_TYPE_DEFAULT, "App is being installed: %d %@", (uint8_t *)v6, 0x12u);
  }

  return (*(uint64_t (**)(void))(*(void *)(a1 + 48) + 16))();
}

void sub_190D0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_190F8(uint64_t a1)
{
  unsigned int v2 = *(os_unfair_lock_s **)(a1 + 48);
  os_unfair_lock_lock(v2);
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = [*(id *)(a1 + 32) safeBoolForKey:@"_lock_systemAppBlocked"] ^ 1;

  os_unfair_lock_unlock(v2);
}

void sub_192EC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location)
{
  objc_destroyWeak(v15);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_19310(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _handleInPreBoardScenarioUpdated];
}

void sub_194E4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location)
{
  objc_destroyWeak(v15);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_19508(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _handleInCheckerBoardScenarioUpdated];
}

id sub_1961C(uint64_t a1)
{
  return [*(id *)(a1 + 32) _transitionToMode:0];
}

void sub_196A0(uint64_t a1)
{
  unsigned int v2 = *(void **)(a1 + 32);
  uint64_t v3 = *(unsigned int *)(a1 + 40);
  id v6 = [v2 profileManager];
  id v4 = [v6 timeRestrictionsEnabled];
  int v5 = [*(id *)(a1 + 32) timeRestrictionManager];
  objc_msgSend(v2, "_showAlertWithTextType:asBanner:isUrgent:timeRestrictionsEnabled:remainingTime:", v3, 1, 0, v4, objc_msgSend(v5, "remainingTimeInSeconds"));
}

uint64_t sub_197B0(uint64_t result)
{
  *(_DWORD *)(*(void *)(result + 32) + 32) = *(_DWORD *)(result + 40);
  return result;
}

void sub_197D4(id a1)
{
  id v1 = +[AXSpringBoardServer server];
  [v1 gaxUnlockDevice];
}

id *sub_198D4(id *result, int a2)
{
  if (a2) {
    return (id *)[result[4] unlockDeviceWithEventProcessor:result[5]];
  }
  return result;
}

id sub_1995C(uint64_t a1)
{
  return [*(id *)(a1 + 32) monitorForTouchID];
}

void sub_19A58(uint64_t a1)
{
  id v5 = [*(id *)(a1 + 32) ignoredTouchRegions];
  id v2 = [v5 copy];
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
  id v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;
}

void sub_19E50(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 64), 8);
  _Unwind_Resume(a1);
}

uint64_t sub_19E70(uint64_t result)
{
  *(unsigned char *)(*(void *)(*(void *)(result + 40) + 8) + 24) = (*(unsigned char *)(*(void *)(result + 32) + 40) & 2) != 0;
  return result;
}

uint64_t sub_19E88(uint64_t result)
{
  *(_DWORD *)(*(void *)(result + 32) + 40) = *(_DWORD *)(*(void *)(result + 32) + 40) & 0xFFFFFFFD | (2 * *(unsigned __int8 *)(result + 40));
  if (!*(unsigned char *)(result + 40)) {
    *(_DWORD *)(*(void *)(result + 32) + 40) &= ~4u;
  }
  return result;
}

uint64_t sub_19F34(uint64_t result)
{
  *(_DWORD *)(*(void *)(result + 32) + 40) &= ~0x20u;
  *(_DWORD *)(*(void *)(result + 32) + 40) &= ~0x40u;
  *(_DWORD *)(*(void *)(result + 32) + 40) &= ~0x80u;
  *(_DWORD *)(*(void *)(result + 32) + 40) &= ~0x100u;
  *(_DWORD *)(*(void *)(result + 32) + 40) &= ~0x200u;
  return result;
}

uint64_t sub_1A05C(uint64_t result)
{
  *(_DWORD *)(*(void *)(result + 32) + 32) = 0;
  return result;
}

uint64_t sub_1A1D0(uint64_t result)
{
  *(_DWORD *)(*(void *)(result + 32) + 40) &= ~0x40u;
  return result;
}

uint64_t sub_1A1E4(uint64_t result)
{
  *(_DWORD *)(*(void *)(result + 32) + 40) |= 0x40u;
  return result;
}

uint64_t sub_1A1F8(uint64_t result)
{
  *(_DWORD *)(*(void *)(result + 32) + 40) &= ~0x40u;
  return result;
}

void sub_1B434(_Unwind_Exception *a1)
{
}

void sub_1B4CC(uint64_t a1, double a2)
{
  dispatch_time_t v3 = dispatch_time(0, (uint64_t)(a2 * 1000000000.0));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1B590;
  block[3] = &unk_497B8;
  id v4 = *(void **)(a1 + 40);
  block[4] = *(void *)(a1 + 32);
  int v7 = *(_DWORD *)(a1 + 48);
  __int16 v8 = *(_WORD *)(a1 + 52);
  id v6 = v4;
  dispatch_after(v3, (dispatch_queue_t)&_dispatch_main_q, block);
}

id sub_1B590(uint64_t a1)
{
  return [*(id *)(a1 + 32) _transitionToMode:*(unsigned int *)(a1 + 48) requireUserUnlock:*(unsigned __int8 *)(a1 + 52) assumeUserInterfaceConnectionSevered:*(unsigned __int8 *)(a1 + 53) completion:*(void *)(a1 + 40)];
}

uint64_t sub_1B5A8(uint64_t result)
{
  *(_DWORD *)(*(void *)(*(void *)(result + 40) + 8) + 24) = *(_DWORD *)(*(void *)(result + 32) + 16);
  return result;
}

void sub_1B5BC(uint64_t a1, int a2)
{
  id v4 = GAXLogCommon();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67109120;
    int v21 = a2;
    _os_log_impl(&dword_0, v4, OS_LOG_TYPE_DEFAULT, "System app frontmost: %i", buf, 8u);
  }

  double v5 = *(double *)(a1 + 48);
  id v6 = GAXLogCommon();
  BOOL v7 = os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT);
  if (v5 < 2.0 || (a2 & 1) != 0)
  {
    if (v7)
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_0, v6, OS_LOG_TYPE_DEFAULT, "Show passcode view.", buf, 2u);
    }

    unsigned int v12 = [*(id *)(a1 + 32) userInterfaceClient];
    int v13 = +[AXAccessQueue mainAccessQueue];
    v16[0] = _NSConcreteStackBlock;
    v16[1] = 3221225472;
    v16[2] = sub_1B8D8;
    v16[3] = &unk_49808;
    v16[4] = *(void *)(a1 + 32);
    int v17 = *(_DWORD *)(a1 + 56);
    [v12 sendAsynchronousMessage:0 withIdentifier:7 targetAccessQueue:v13 completion:v16];
  }
  else
  {
    if (v7)
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_0, v6, OS_LOG_TYPE_DEFAULT, "Show lockout duration alert.", buf, 2u);
    }

    v18[0] = @"alert text type";
    __int16 v8 = +[NSNumber numberWithUnsignedInteger:0];
    v19[0] = v8;
    v19[1] = &__kCFBooleanTrue;
    v18[1] = @"alert is banner";
    v18[2] = @"alert is urgent";
    v19[2] = &__kCFBooleanFalse;
    v18[3] = @"alert remaining lockout duration";
    uint64_t v9 = +[NSNumber numberWithDouble:*(double *)(a1 + 48)];
    v19[3] = v9;
    id v10 = +[NSDictionary dictionaryWithObjects:v19 forKeys:v18 count:4];

    id v11 = [*(id *)(a1 + 32) userInterfaceClient];
    [v11 sendAsynchronousMessage:v10 withIdentifier:5 targetAccessQueue:0 completion:0];
  }
  id v14 = *(void **)(a1 + 40);
  if (v14)
  {
    id v15 = v14;
    AXPerformBlockAsynchronouslyOnMainThread();
  }
}

void sub_1B8D8(uint64_t a1, void *a2)
{
  dispatch_time_t v3 = [a2 objectForKey:@"passcode view was visible"];
  unsigned int v4 = [v3 BOOLValue];

  double v5 = GAXLogCommon();
  BOOL v6 = os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT);
  if (v4)
  {
    if (v6)
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_0, v5, OS_LOG_TYPE_DEFAULT, "Failed to show, as it was already visible.", buf, 2u);
    }
  }
  else
  {
    if (v6)
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_0, v5, OS_LOG_TYPE_DEFAULT, "Passcode view was shown.", buf, 2u);
    }

    [*(id *)(a1 + 32) setDesiredModeAfterSuccessfulPasscodeEntry:*(unsigned int *)(a1 + 40)];
    double v5 = +[AXSpringBoardServer server];
    BOOL v7 = [*(id *)(a1 + 32) appManager];
    __int16 v8 = [v7 effectiveAppBundleIdentifier];
    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3221225472;
    v9[2] = sub_1BA4C;
    v9[3] = &unk_49640;
    void v9[4] = *(void *)(a1 + 32);
    [v5 isMediaPlayingForApp:v8 completionHandler:v9];
  }
}

void sub_1BA4C(uint64_t a1, uint64_t a2)
{
  unsigned int v4 = [*(id *)(a1 + 32) appManager];
  [v4 setEffectiveAppWasPlayingMedia:a2];

  id v7 = +[AXSpringBoardServer server];
  double v5 = [*(id *)(a1 + 32) appManager];
  BOOL v6 = [v5 effectiveAppBundleIdentifier];
  [v7 pauseMediaForApp:v6];
}

uint64_t sub_1BAF4(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void sub_1BB08(uint64_t a1, uint64_t a2)
{
  int v4 = *(_DWORD *)(a1 + 48);
  double v5 = *(void **)(a1 + 32);
  if (v4)
  {
    BOOL v6 = [v5 eventProcessor];
    [v6 beginHandlingSystemEventsForReason:@"GAX Active"];
  }
  else
  {
    [v5 _setTimeRestrictionHasExpired:0];
    BOOL v6 = [*(id *)(a1 + 32) eventProcessor];
    [v6 endHandlingSystemEventsForReason:@"GAX Active"];
  }

  id v7 = [*(id *)(a1 + 32) appManager];
  uint64_t v8 = *(unsigned int *)(a1 + 48);
  uint64_t v9 = [*(id *)(a1 + 32) profileManager];
  id v10 = [v9 shouldAllowMotion];
  id v11 = [*(id *)(a1 + 32) profileManager];
  objc_msgSend(v7, "settingsDidChangeWithServerMode:allowsMotion:allowsKeyboardTextInput:", v8, v10, objc_msgSend(v11, "shouldAllowKeyboardTextInput"));

  [*(id *)(a1 + 32) _updateMode:*(unsigned int *)(a1 + 48)];
  [*(id *)(a1 + 32) _updateDisablingSystemGesturesForMode:*(unsigned int *)(a1 + 48)];
  [*(id *)(a1 + 32) _disableSOSGesture:*(_DWORD *)(a1 + 48) != 0];
  memset(&v22[40], 0, 28);
  unsigned int v12 = *(void **)(a1 + 32);
  if (v12) {
    [v12 gaxState];
  }
  int v13 = +[AXSpringBoardServer server];
  uint64_t v14 = *(unsigned int *)(a1 + 48);
  *(_OWORD *)v22 = *(_OWORD *)&v22[40];
  *(_OWORD *)&v22[12] = *(_OWORD *)&v22[52];
  [v13 gaxDidChangeMode:v14 shouldAcquireLockScreenAssertion:a2 gaxState:v22];

  v23[0] = @"gax backboard state";
  *(_OWORD *)v22 = *(_OWORD *)&v22[40];
  *(_OWORD *)&v22[12] = *(_OWORD *)&v22[52];
  id v15 = serializeGAXBackboardState((uint64_t)v22);
  v24[0] = v15;
  v23[1] = @"time restriction did expire";
  int v16 = +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", [*(id *)(a1 + 32) _hasTimeRestrictionExpired]);
  v24[1] = v16;
  v23[2] = @"time restriction duration";
  int v17 = [*(id *)(a1 + 32) profileManager];
  uint64_t v18 = +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", [v17 appTimeoutDuration]);
  v24[2] = v18;
  __int16 v19 = +[NSDictionary dictionaryWithObjects:v24 forKeys:v23 count:3];

  v20 = [*(id *)(a1 + 32) userInterfaceClient];
  [v20 sendAsynchronousMessage:v19 withIdentifier:1 targetAccessQueue:0 completion:0];

  if (!*(unsigned char *)(a1 + 52)) {
    AXPerformBlockOnMainThreadAfterDelay();
  }
  uint64_t v21 = *(void *)(a1 + 40);
  if (v21) {
    (*(void (**)(uint64_t, void))(v21 + 16))(v21, 0);
  }
}

void sub_1BE28(uint64_t a1)
{
  id v1 = [*(id *)(a1 + 32) userInterfaceClient];
  [v1 sendAsynchronousMessage:0 withIdentifier:21 targetAccessQueue:0 completion:0];
}

void sub_1BE7C(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (v3)
  {
    if (*(void *)(a1 + 32))
    {
      int v4 = *(void **)(a1 + 40);
      v25[0] = 0;
      unsigned int v5 = [v4 effectiveAppPrepareForTransitionToWorkspaceAndRetrieveRestrictionsInformation:v25];
      id v6 = v25[0];
      if (v5)
      {
        (*(void (**)(double))(*(void *)(a1 + 72) + 16))(0.2);
      }
      else
      {
        uint64_t v9 = [*(id *)(a1 + 48) timeRestrictionManager];
        [v9 cancel];

        id v10 = +[AXSpringBoardServer server];
        v15[0] = _NSConcreteStackBlock;
        v15[1] = 3221225472;
        v15[2] = sub_1C0D0;
        v15[3] = &unk_498D0;
        uint64_t v11 = *(void *)(a1 + 32);
        id v16 = *(id *)(a1 + 40);
        id v12 = *(id *)(a1 + 32);
        uint64_t v23 = *(void *)(a1 + 88);
        uint64_t v13 = *(void *)(a1 + 48);
        uint64_t v14 = *(void **)(a1 + 56);
        id v17 = v12;
        uint64_t v18 = v13;
        id v19 = v14;
        int v24 = *(_DWORD *)(a1 + 96);
        id v20 = v3;
        id v21 = v6;
        id v22 = *(id *)(a1 + 80);
        [v10 isMediaPlayingForApp:v11 completionHandler:v15];
      }
    }
    else
    {
      (*(void (**)(double))(*(void *)(a1 + 72) + 16))(0.5);
    }
  }
  else
  {
    id v7 = GAXLogCommon();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      sub_2AF18();
    }

    uint64_t v8 = *(void **)(a1 + 64);
    if (v8)
    {
      v25[1] = _NSConcreteStackBlock;
      v25[2] = (id)3221225472;
      v25[3] = sub_1C0BC;
      v25[4] = &unk_48F78;
      id v26 = v8;
      AXPerformBlockAsynchronouslyOnMainThread();
    }
  }
}

uint64_t sub_1C0BC(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void sub_1C0D0(uint64_t a1, uint64_t a2)
{
  [*(id *)(a1 + 32) setEffectiveAppWasPlayingMedia:a2];
  id v3 = +[AXSpringBoardServer server];
  [v3 pauseMediaForApp:*(void *)(a1 + 40)];

  if (*(_DWORD *)(*(void *)(*(void *)(a1 + 88) + 8) + 24) == 2)
  {
    int v4 = [*(id *)(a1 + 48) timeRestrictionManager];
    [v4 pause];
  }
  char v35 = 0;
  id v5 = *(id *)(a1 + 40);
  [*(id *)(a1 + 48) _updateSessionAppWithIdentifier:v5 notifyUserInterfaceServer:0 sessionAppIdentifierDidChange:&v35];
  [*(id *)(a1 + 56) setActiveAppID:0];
  [*(id *)(a1 + 48) addReasonToBlockAllEvents:@"GAX transitioning to workspace"];
  id v6 = +[NSNumber numberWithUnsignedInteger:*(unsigned int *)(a1 + 96)];
  id v7 = objc_msgSend(objc_alloc((Class)NSMutableDictionary), "initWithObjectsAndKeys:", v6, @"server mode for disabling telephony", 0);
  uint64_t v8 = GAXLogBlockedTouches();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    unsigned int v9 = [*(id *)(a1 + 48) activeInterfaceOrientation];
    *(_DWORD *)buf = 67109120;
    *(_DWORD *)&uint8_t buf[4] = v9;
    _os_log_impl(&dword_0, v8, OS_LOG_TYPE_DEFAULT, "Transitioning into workspace, drawing interest area paths for orientation %d", buf, 8u);
  }

  id v10 = [*(id *)(a1 + 48) profileManager];
  uint64_t v11 = objc_msgSend(v10, "ignoredTouchRegionsForOrientation:", objc_msgSend(*(id *)(a1 + 48), "activeInterfaceOrientation"));

  [v7 setValue:v11 forKey:@"interest area paths for storage"];
  if (v35)
  {
    if (v5)
    {
      id v37 = v5;
      +[NSArray arrayWithObjects:&v37 count:1];
    }
    else
    {
      +[NSNumber numberWithBool:0];
    id v12 = };
    [v7 setObject:v12 forKey:@"session application identifiers"];
  }
  uint64_t v13 = +[NSNumber numberWithUnsignedInt:*(unsigned int *)(*(void *)(*(void *)(a1 + 88) + 8) + 24)];
  [v7 setObject:v13 forKey:@"previous server mode"];

  uint64_t v14 = [*(id *)(a1 + 48) profileManager];
  id v15 = +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", [v14 appTimeoutDuration]);
  [v7 setValue:v15 forKey:@"time restriction duration"];

  id v16 = +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", [v14 timeRestrictionsEnabled]);
  [v7 setValue:v16 forKey:@"time restrictions enabled"];

  memset(buf, 0, 28);
  id v17 = *(void **)(a1 + 48);
  if (v17) {
    [v17 gaxState];
  }
  *(_OWORD *)v34 = *(_OWORD *)buf;
  *(_OWORD *)&v34[12] = *(_OWORD *)&buf[12];
  uint64_t v18 = serializeGAXBackboardState((uint64_t)v34);
  [v7 setValue:v18 forKey:@"gax backboard state"];

  id v19 = [*(id *)(a1 + 64) sessionApplicationName];
  [v7 setValue:v19 forKey:@"application name"];

  id v20 = [*(id *)(a1 + 64) archivedSessionApplicationIcon];
  [v7 setValue:v20 forKey:@"archived application icon"];

  id v21 = [*(id *)(a1 + 72) objectForKey:@"GAXIPCPayloadKeyRestrictionIdentifiers"];
  if ([v21 count])
  {
    [v7 setObject:v21 forKey:@"restriction identifiers"];
    id v22 = [v14 statesForRestrictionsWithIdentifiers:v21];
    [v7 setValue:v22 forKey:@"states for restrictions"];
    uint64_t v23 = [*(id *)(a1 + 72) objectForKey:@"GAXIPCPayloadKeyTextsForRestrictions"];
    [v7 setValue:v23 forKey:@"texts for restrictions"];
    int v24 = [*(id *)(a1 + 72) objectForKey:@"GAXIPCPayloadKeyDetailTextsForRestrictions"];
    [v7 setValue:v24 forKey:@"detail texts for restrictions"];
  }
  uint64_t v25 = [*(id *)(a1 + 48) userInterfaceClient];
  id v26 = +[AXAccessQueue mainAccessQueue];
  v30[0] = _NSConcreteStackBlock;
  v30[1] = 3221225472;
  v30[2] = sub_1C630;
  v30[3] = &unk_498A8;
  uint64_t v27 = *(void *)(a1 + 88);
  uint64_t v28 = *(void *)(a1 + 48);
  id v31 = v25;
  uint64_t v32 = v28;
  uint64_t v33 = v27;
  id v29 = v25;
  [v29 sendAsynchronousMessage:v7 withIdentifier:8 targetAccessQueue:v26 completion:v30];

  (*(void (**)(void))(*(void *)(a1 + 80) + 16))();
}

void sub_1C630(void *a1)
{
  id v2 = +[NSNumber numberWithUnsignedInteger:*(unsigned int *)(*(void *)(a1[6] + 8) + 24)];
  id v3 = objc_msgSend(objc_alloc((Class)NSDictionary), "initWithObjectsAndKeys:", v2, @"previous server mode", 0);
  int v4 = (void *)a1[4];
  id v5 = +[AXAccessQueue mainAccessQueue];
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  _DWORD v6[2] = sub_1C738;
  v6[3] = &unk_49880;
  v6[4] = a1[5];
  [v4 sendAsynchronousMessage:v3 withIdentifier:9 targetAccessQueue:v5 completion:v6];
}

id sub_1C738(uint64_t a1)
{
  return [*(id *)(a1 + 32) removeReasonToBlockAllEvents:@"GAX transitioning to workspace"];
}

uint64_t sub_1C748(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

uint64_t sub_1C75C(uint64_t a1)
{
  [*(id *)(a1 + 32) _transitionToMode:0 requireUserUnlock:0];
  uint64_t result = *(void *)(a1 + 40);
  if (result)
  {
    id v3 = *(uint64_t (**)(void))(result + 16);
    return v3();
  }
  return result;
}

void sub_1C7BC(uint64_t a1, uint64_t a2)
{
  CFStringRef v6 = @"new passcode length";
  id v3 = +[NSNumber numberWithUnsignedInteger:a2];
  id v7 = v3;
  int v4 = +[NSDictionary dictionaryWithObjects:&v7 forKeys:&v6 count:1];

  id v5 = [*(id *)(a1 + 32) userInterfaceClient];
  [v5 sendAsynchronousMessage:v4 withIdentifier:6 targetAccessQueue:0 completion:0];
}

uint64_t sub_1C894(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void sub_1C8A8(uint64_t a1, void *a2)
{
  id v3 = a2;
  [*(id *)(a1 + 32) _persistInterestAreaPathsForStorageFromMessage:v3 forInterfaceOrientation:*(unsigned int *)(a1 + 72)];
  int v4 = *(void **)(a1 + 32);
  id v5 = [v3 objectForKey:@"interest area paths in screen coordinates"];
  CFStringRef v6 = [v4 _unarchivedIgnoredTouchRegionsWithDataArray:v5];

  id v7 = +[AXAccessQueue mainAccessQueue];
  v24[0] = _NSConcreteStackBlock;
  v24[1] = 3221225472;
  v24[2] = sub_1CBF8;
  void v24[3] = &unk_49018;
  v24[4] = *(void *)(a1 + 32);
  id v8 = v6;
  id v25 = v8;
  [v7 performAsynchronousWritingBlock:v24];

  if (*(_DWORD *)(*(void *)(*(void *)(a1 + 64) + 8) + 24) != 1)
  {
    unsigned int v9 = +[AXSpringBoardServer server];
    id v10 = [*(id *)(a1 + 40) effectiveAppBundleIdentifier];
    v22[0] = _NSConcreteStackBlock;
    v22[1] = 3221225472;
    v22[2] = sub_1CC4C;
    v22[3] = &unk_49640;
    id v23 = *(id *)(a1 + 40);
    [v9 isMediaPlayingForApp:v10 completionHandler:v22];
  }
  uint64_t v11 = [v3 objectForKey:@"states for restrictions"];
  if (v11)
  {
    id v12 = [*(id *)(a1 + 32) profileManager];
    [v12 setStatesForRestrictions:v11];
  }
  if (([*(id *)(a1 + 32) _hasTimeRestrictionExpired] & 1) == 0)
  {
    uint64_t v13 = +[AXSettings sharedInstance];
    objc_msgSend(v13, "setGuidedAccessTimeLimitsUsageCount:", (char *)objc_msgSend(v13, "guidedAccessTimeLimitsUsageCount") + 1);

    uint64_t v14 = [*(id *)(a1 + 32) timeRestrictionManager];
    unsigned int v15 = [v14 isPaused];

    if (v15)
    {
      id v16 = [*(id *)(a1 + 32) timeRestrictionManager];
      [v16 resume];
    }
    else
    {
      if (![*(id *)(a1 + 48) timeRestrictionsEnabled]) {
        goto LABEL_11;
      }
      id v16 = [*(id *)(a1 + 32) timeRestrictionManager];
      objc_msgSend(v16, "beginWithDuration:", objc_msgSend(*(id *)(a1 + 48), "appTimeoutDuration"));
    }
  }
LABEL_11:
  id v17 = [v3 objectForKey:@"requires complete hiding workspace message"];
  unsigned int v18 = [v17 BOOLValue];

  if (v18)
  {
    id v19 = *(void **)(a1 + 56);
    id v20 = +[AXAccessQueue mainAccessQueue];
    v21[0] = _NSConcreteStackBlock;
    v21[1] = 3221225472;
    v21[2] = sub_1CC58;
    v21[3] = &unk_49880;
    v21[4] = *(void *)(a1 + 32);
    [v19 sendAsynchronousMessage:0 withIdentifier:11 targetAccessQueue:v20 completion:v21];
  }
  else
  {
    [*(id *)(a1 + 32) _didFinishTransitioningFromWorkspaceToSession];
  }
}

void sub_1CBF8(uint64_t a1)
{
  id v1 = (id *)(a1 + 32);
  [*(id *)(a1 + 32) setIgnoredTouchRegions:*(void *)(a1 + 40)];
  id v2 = GAXLogBlockedTouches();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG)) {
    sub_2AF4C(v1, v2);
  }
}

id sub_1CC4C(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) setEffectiveAppWasPlayingMedia:a2];
}

id sub_1CC58(uint64_t a1)
{
  return [*(id *)(a1 + 32) _didFinishTransitioningFromWorkspaceToSession];
}

uint64_t sub_1CC60(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void sub_1CC74(uint64_t a1, void *a2)
{
  id v3 = a2;
  int v4 = GAXLogBlockedTouches();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    unsigned int v5 = [*(id *)(a1 + 32) activeInterfaceOrientation];
    *(_DWORD *)buf = 67109120;
    unsigned int v14 = v5;
    _os_log_impl(&dword_0, v4, OS_LOG_TYPE_DEFAULT, "Transitioning out of Guided Access, storing interest area paths for orientation %d", buf, 8u);
  }

  CFStringRef v6 = [v3 objectForKey:@"interest area paths for storage"];
  objc_msgSend(*(id *)(a1 + 40), "setIgnoredTouchRegions:forOrientation:", v6, objc_msgSend(*(id *)(a1 + 32), "activeInterfaceOrientation"));
  id v7 = [v3 objectForKey:@"states for restrictions"];
  if (v7) {
    [*(id *)(a1 + 40) setStatesForRestrictions:v7];
  }
  id v8 = [v3 objectForKey:@"requires complete hiding workspace message"];
  unsigned int v9 = [v8 BOOLValue];

  if (v9)
  {
    id v10 = *(void **)(a1 + 48);
    uint64_t v11 = +[AXAccessQueue mainAccessQueue];
    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472;
    v12[2] = sub_1CE5C;
    v12[3] = &unk_49880;
    v12[4] = *(void *)(a1 + 32);
    [v10 sendAsynchronousMessage:0 withIdentifier:13 targetAccessQueue:v11 completion:v12];
  }
  else
  {
    [*(id *)(a1 + 32) _didFinishTransitioningFromWorkspaceToApplication];
  }
}

id sub_1CE5C(uint64_t a1)
{
  return [*(id *)(a1 + 32) _didFinishTransitioningFromWorkspaceToApplication];
}

id sub_1CE64(uint64_t a1)
{
  return [*(id *)(a1 + 32) _updateRestrictedState:0];
}

uint64_t sub_1CE70(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t sub_1CE84(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void sub_1D0B0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1D108(uint64_t a1)
{
  int v1 = *(_DWORD *)(*(void *)(a1 + 32) + 40);
  if ((v1 & 0x40) != 0)
  {
    uint64_t v2 = *(void *)(*(void *)(a1 + 40) + 8);
    id v3 = *(void **)(v2 + 40);
    CFStringRef v4 = @"Call state is changing";
LABEL_8:
    *(void *)(v2 + 40) = v4;

    return;
  }
  if ((v1 & 0x80) != 0)
  {
    uint64_t v2 = *(void *)(*(void *)(a1 + 40) + 8);
    id v3 = *(void **)(v2 + 40);
    CFStringRef v4 = @"Making emergency call";
    goto LABEL_8;
  }
  if ((v1 & 0x20) != 0)
  {
    uint64_t v2 = *(void *)(*(void *)(a1 + 40) + 8);
    id v3 = *(void **)(v2 + 40);
    CFStringRef v4 = @"Mini alert is shwowing";
    goto LABEL_8;
  }
}

uint64_t sub_1D218(uint64_t result)
{
  *(unsigned char *)(*(void *)(*(void *)(result + 40) + 8) + 24) = (*(_DWORD *)(*(void *)(result + 32) + 40) & 0xE0) != 0;
  return result;
}

void sub_1D2E0(uint64_t a1)
{
  unsigned int v2 = *(_DWORD *)(*(void *)(a1 + 32) + 40);
  int v3 = (v2 >> 9) & 1;
  int v4 = (v2 >> 8) & 1;
  unsigned int v5 = GAXLogCommon();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v10 = 67240448;
    LODWORD(v11[0]) = v3;
    WORD2(v11[0]) = 1026;
    *(_DWORD *)((char *)v11 + 6) = v4;
    _os_log_impl(&dword_0, v5, OS_LOG_TYPE_DEFAULT, "Determining if touches are ignored by override. verifyingIntegrity: %{public}d, allowedAppNotFound: %{public}d", (uint8_t *)&v10, 0xEu);
  }

  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = v3 | v4;
  if (v3)
  {
    unsigned int v6 = [*(id *)(*(void *)(a1 + 32) + 144) isVerifyingIntegrity];
    id v7 = objc_msgSend(*(id *)(*(void *)(a1 + 32) + 144), "displayStringForOutcome:", objc_msgSend(*(id *)(*(void *)(a1 + 32) + 144), "mostRecentOutcome"));
    id v8 = GAXLogCommon();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      int v10 = 67240192;
      LODWORD(v11[0]) = v6;
      _os_log_impl(&dword_0, v8, OS_LOG_TYPE_DEFAULT, "Checking if verifier is processing event queue %{public}d", (uint8_t *)&v10, 8u);
    }

    unsigned int v9 = GAXLogCommon();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      int v10 = 138543362;
      v11[0] = v7;
      _os_log_impl(&dword_0, v9, OS_LOG_TYPE_DEFAULT, "Checking most recent verification outcome %{public}@", (uint8_t *)&v10, 0xCu);
    }
  }
}

void sub_1D878(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, char a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,char a26)
{
}

__n128 sub_1D8A8(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  uint64_t v2 = *(void *)(*(void *)(a1 + 40) + 8);
  __n128 result = *(__n128 *)(v1 + 16);
  *(_OWORD *)(v2 + 44) = *(_OWORD *)(v1 + 28);
  *(__n128 *)(v2 + 32) = result;
  return result;
}

uint64_t sub_1D8C4(uint64_t result)
{
  *(_DWORD *)(*(void *)(*(void *)(result + 40) + 8) + 24) = *(_DWORD *)(*(void *)(result + 32) + 16);
  return result;
}

void sub_1DD0C(uint64_t a1, void *a2)
{
  id v3 = a2;
  if ((AXDeviceIsUnlocked() & 1) == 0)
  {
    unsigned int v6 = GAXLogCommon();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      unsigned int v9 = +[NSNumber numberWithUnsignedInt:*(unsigned int *)(a1 + 40)];
      *(_DWORD *)buf = 138543362;
      *(void *)&uint8_t buf[4] = v9;
      _os_log_impl(&dword_0, v6, OS_LOG_TYPE_DEFAULT, "Unable to make GAX active with request type: %{public}@. Device is not keybag unlocked.", buf, 0xCu);
    }
    goto LABEL_5;
  }
  id v4 = [*(id *)(a1 + 32) _availabilityForRequestType:*(unsigned int *)(a1 + 40) springboardParameters:v3];
  if (!v4)
  {
    int v10 = *(_DWORD *)(a1 + 40);
    *(void *)buf = 0;
    *(void *)&buf[8] = buf;
    *(void *)&uint8_t buf[16] = 0x2020000000;
    int v23 = 0;
    uint64_t v11 = *(void *)(a1 + 32);
    id v12 = *(NSObject **)(v11 + 8);
    v21[0] = _NSConcreteStackBlock;
    v21[1] = 3221225472;
    v21[2] = sub_1E028;
    v21[3] = &unk_494B0;
    v21[4] = v11;
    void v21[5] = buf;
    dispatch_sync(v12, v21);
    int v13 = *(_DWORD *)(*(void *)&buf[8] + 24);
    if (v13 == 2)
    {
      if (v10 == 2) {
        goto LABEL_21;
      }
      unsigned int v15 = [*(id *)(a1 + 32) profileManager];
      unsigned __int8 v16 = [v15 shouldAllowExit];

      if ((v16 & 1) == 0) {
        goto LABEL_21;
      }
      uint64_t v14 = 1;
    }
    else if (v13 == 1)
    {
      if (v10 == 2)
      {
LABEL_21:
        _Block_object_dispose(buf, 8);
        goto LABEL_22;
      }
      uint64_t v14 = 0;
    }
    else
    {
      id v17 = *(void **)(a1 + 32);
      if (v10 != 2)
      {
        unsigned int v18 = [*(id *)(a1 + 32) _shouldAllowDirectInactiveToActiveTransition];
        id v17 = *(void **)(a1 + 32);
        if (!v18)
        {
          uint64_t v14 = 1;
          goto LABEL_20;
        }
      }
      id v19 = [*(id *)(a1 + 32) appManager];
      id v20 = [v19 effectiveAppBundleIdentifier];
      [v17 _updateSessionAppWithIdentifier:v20];

      uint64_t v14 = 2;
    }
    id v17 = *(void **)(a1 + 32);
LABEL_20:
    [v17 _transitionToMode:v14];
    goto LABEL_21;
  }
  id v5 = v4;
  unsigned int v6 = GAXLogCommon();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    id v7 = +[NSNumber numberWithUnsignedInt:*(unsigned int *)(a1 + 40)];
    id v8 = [*(id *)(a1 + 32) _errorMessageForAvailability:v5];
    *(_DWORD *)buf = 138543618;
    *(void *)&uint8_t buf[4] = v7;
    *(_WORD *)&buf[12] = 2114;
    *(void *)&buf[14] = v8;
    _os_log_impl(&dword_0, v6, OS_LOG_TYPE_DEFAULT, "Unable to make GAX active with request type: %{public}@ - %{public}@", buf, 0x16u);
  }
LABEL_5:

LABEL_22:
}

void sub_1E008(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t sub_1E028(uint64_t result)
{
  *(_DWORD *)(*(void *)(*(void *)(result + 40) + 8) + 24) = *(_DWORD *)(*(void *)(result + 32) + 16);
  return result;
}

id *sub_1E768(id *result, uint64_t a2)
{
  if (a2) {
    return (id *)[result[4] _showAlertWithTextType:*((unsigned int *)result + 10) asBanner:1 isUrgent:1 effectiveAppName:a2];
  }
  return result;
}

void sub_1E91C(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = v3;
  if (v3)
  {
    CFStringRef v11 = @"application name";
    id v12 = v3;
    id v5 = +[NSDictionary dictionaryWithObjects:&v12 forKeys:&v11 count:1];
  }
  else
  {
    unsigned int v6 = GAXLogCommon();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_FAULT)) {
      sub_2B07C(a1, v6);
    }

    id v5 = &__NSDictionary0__struct;
  }
  id v7 = [*(id *)(a1 + 40) userInterfaceClient];
  id v8 = +[AXAccessQueue mainAccessQueue];
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_1EA98;
  v9[3] = &unk_49A38;
  id v10 = *(id *)(a1 + 48);
  [v7 sendAsynchronousMessage:v5 withIdentifier:35 targetAccessQueue:v8 completion:v9];
}

void sub_1EA98(uint64_t a1, void *a2, void *a3)
{
  id v5 = a3;
  if (v5)
  {
    unsigned int v6 = GAXLogIntegrity();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      sub_2B0F8();
    }

    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  }
  else
  {
    id v7 = [a2 objectForKeyedSubscript:@"result"];
    (*(void (**)(void, id))(*(void *)(a1 + 32) + 16))(*(void *)(a1 + 32), [v7 BOOLValue]);
  }
}

void sub_1F484(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, id *location)
{
  objc_destroyWeak(v11);
  objc_destroyWeak(location);
  objc_destroyWeak((id *)(v12 - 248));
  _Block_object_dispose((const void *)(v12 - 240), 8);
  _Block_object_dispose((const void *)(v12 - 208), 8);
  _Block_object_dispose((const void *)(v12 - 176), 8);
  _Block_object_dispose((const void *)(v12 - 144), 8);
  _Unwind_Resume(a1);
}

void sub_1F504(uint64_t a1, int a2, char a3)
{
  unsigned int v6 = (id *)(a1 + 56);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  [*(id *)(a1 + 32) setDisableSystemGesturesForASAMStartAssertion:0];
  if (a2 && *(unsigned char *)(a1 + 64))
  {
    [WeakRetained setEffectiveASAMStyle:*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 24)];
    id v8 = [WeakRetained integrityVerifier];
    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472;
    v10[2] = sub_1F674;
    v10[3] = &unk_49A88;
    id v11 = *(id *)(a1 + 40);
    char v13 = a2;
    char v14 = a3;
    objc_copyWeak(&v12, v6);
    [v8 verifyIntegrityWithEvent:19 afterDelay:v10 completion:1.0];

    objc_destroyWeak(&v12);
  }
  else
  {
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
    id v9 = objc_loadWeakRetained(v6);
    [v9 setCheckingASAMValidity:0];
  }
}

void sub_1F660(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_1F674(uint64_t a1)
{
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  [WeakRetained setCheckingASAMValidity:0];
}

void sub_1F6DC(uint64_t a1)
{
  if (*(_DWORD *)(*(void *)(*(void *)(a1 + 72) + 8) + 24))
  {
    (*(void (**)(void))(*(void *)(a1 + 64) + 16))(*(void *)(a1 + 64));
LABEL_3:
    uint64_t v2 = 0;
    goto LABEL_26;
  }
  if (*(unsigned char *)(a1 + 144))
  {
    if (!*(unsigned char *)(a1 + 145)) {
      _AXAssert();
    }
    uint64_t v3 = *(void *)(*(void *)(*(void *)(a1 + 80) + 8) + 24);
    if (v3 == 3)
    {
      id v31 = GAXLogCommon();
      if (os_log_type_enabled(v31, OS_LOG_TYPE_INFO))
      {
        uint64_t v32 = *(void *)(a1 + 32);
        *(_DWORD *)buf = 138543362;
        uint64_t v78 = v32;
        _os_log_impl(&dword_0, v31, OS_LOG_TYPE_INFO, "unmanaged self-locking to %{public}@ (internal style)", buf, 0xCu);
      }

      [*(id *)(a1 + 40) _updateSessionAppWithIdentifier:*(void *)(a1 + 32)];
      uint64_t v33 = +[GAXSettings sharedInstance];
      [v33 setSelfLockUnmanaged:1];

      v34 = +[GAXSettings sharedInstance];
      [v34 setActiveAppSelfLocked:1];

      [*(id *)(a1 + 48) notifySelfLockStateDidChange];
      char v35 = *(void **)(a1 + 48);
      v36 = [*(id *)(a1 + 56) objectForKeyedSubscript:&off_4D830];
      id v37 = [*(id *)(a1 + 56) objectForKeyedSubscript:&off_4D860];
      [v35 applyUnmanagedSelfLockPropertiesMap:v36 managedConfigurationSettings:v37];

      v38 = *(void **)(a1 + 40);
      v39 = [v38 profileManager];
      id v40 = [v39 isUserMode];
      v58[0] = _NSConcreteStackBlock;
      v58[1] = 3221225472;
      v58[2] = sub_2074C;
      v58[3] = &unk_49B78;
      uint64_t v41 = *(void *)(a1 + 80);
      v58[4] = *(void *)(a1 + 40);
      uint64_t v60 = v41;
      id v59 = *(id *)(a1 + 64);
      [v38 _transitionToMode:2 requireUserUnlock:v40 assumeUserInterfaceConnectionSevered:0 completion:v58];
    }
    else if (v3 == 1)
    {
      id v22 = GAXLogCommon();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v23 = *(void *)(a1 + 32);
        *(_DWORD *)buf = 138543362;
        uint64_t v78 = v23;
        _os_log_impl(&dword_0, v22, OS_LOG_TYPE_DEFAULT, "unmanaged self-locking to %{public}@ (AAC style)", buf, 0xCu);
      }

      int v24 = *(void **)(a1 + 40);
      id v25 = [v24 appManager];
      id v26 = [v25 effectiveAppBundleIdentifier];
      char v27 = *(unsigned char *)(a1 + 146);
      BOOL v28 = v27 != 0;
      v61[0] = _NSConcreteStackBlock;
      v61[1] = 3221225472;
      v61[2] = sub_20030;
      v61[3] = &unk_49B50;
      uint64_t v29 = *(void *)(a1 + 40);
      char v69 = v27;
      uint64_t v30 = *(void *)(a1 + 96);
      v61[4] = v29;
      uint64_t v66 = v30;
      id v62 = *(id *)(a1 + 48);
      char v70 = *(unsigned char *)(a1 + 144);
      id v63 = *(id *)(a1 + 32);
      id v64 = *(id *)(a1 + 56);
      objc_copyWeak(&v68, (id *)(a1 + 104));
      uint64_t v67 = *(void *)(a1 + 80);
      id v65 = *(id *)(a1 + 64);
      [v24 userConfirmUnmanagedASAMForAppWithBundleID:v26 requireConfirmation:v28 completion:v61];

      objc_destroyWeak(&v68);
    }
    else
    {
      if (v3)
      {
        _AXAssert();
        (*(void (**)(void))(*(void *)(a1 + 64) + 16))(*(void *)(a1 + 64));
        goto LABEL_3;
      }
      id v4 = GAXLogCommon();
      if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
      {
        uint64_t v5 = *(void *)(a1 + 32);
        *(_DWORD *)buf = 138543362;
        uint64_t v78 = v5;
        _os_log_impl(&dword_0, v4, OS_LOG_TYPE_INFO, "vanilla self-locking to %{public}@", buf, 0xCu);
      }

      [*(id *)(a1 + 40) _updateSessionAppWithIdentifier:*(void *)(a1 + 32)];
      unsigned int v6 = +[GAXSettings sharedInstance];
      [v6 setActiveAppSelfLocked:1];

      id v7 = +[GAXSettings sharedInstance];
      [v7 setSelfLockUnmanaged:0];

      [*(id *)(a1 + 48) notifySelfLockStateDidChange];
      id v8 = *(void **)(a1 + 40);
      id v9 = [v8 profileManager];
      id v10 = [v9 isUserMode];
      v71[0] = _NSConcreteStackBlock;
      v71[1] = 3221225472;
      v71[2] = sub_1FFB4;
      v71[3] = &unk_49AD8;
      uint64_t v74 = *(void *)(a1 + 88);
      int8x16_t v54 = *(int8x16_t *)(a1 + 32);
      id v11 = (id)v54.i64[0];
      int8x16_t v72 = vextq_s8(v54, v54, 8uLL);
      long long v12 = *(_OWORD *)(a1 + 128);
      long long v75 = *(_OWORD *)(a1 + 112);
      long long v76 = v12;
      id v73 = *(id *)(a1 + 64);
      [v8 _transitionToMode:2 requireUserUnlock:v10 assumeUserInterfaceConnectionSevered:0 completion:v71];
    }
  }
  else
  {
    char v13 = +[GAXSettings sharedInstance];
    if ([v13 selfLockUnmanaged]
      && [v13 isActiveAppSelfLocked]
      && [*(id *)(a1 + 40) effectiveASAMStyle] == (char *)&dword_0 + 1)
    {
      unsigned __int8 v14 = [*(id *)(a1 + 48) shouldShowUserConfirmationPromptsAndBanners];
    }
    else
    {
      unsigned __int8 v14 = 0;
    }
    unsigned int v15 = *(void **)(a1 + 40);
    unsigned __int8 v16 = [v15 profileManager];
    id v17 = [v16 isUserMode];
    v55[0] = _NSConcreteStackBlock;
    v55[1] = 3221225472;
    v55[2] = sub_207A4;
    v55[3] = &unk_49BA0;
    id v18 = *(id *)(a1 + 64);
    unsigned __int8 v57 = v14;
    v55[4] = *(void *)(a1 + 40);
    id v56 = v18;
    [v15 _transitionToMode:0 requireUserUnlock:v17 assumeUserInterfaceConnectionSevered:0 completion:v55];

    [*(id *)(a1 + 40) _removeUnmanagedSelfLockRestrictions];
    id v19 = +[GAXSettings sharedInstance];
    [v19 setActiveAppSelfLocked:0];

    id v20 = +[GAXSettings sharedInstance];
    [v20 setSelfLockUnmanaged:0];

    [*(id *)(a1 + 48) notifySelfLockStateDidChange];
    id v21 = [*(id *)(a1 + 40) axFeatureManager];
    [v21 restoreAccessibilityFeatures];
  }
  uint64_t v2 = 1;
LABEL_26:
  BOOL v42 = *(unsigned char *)(a1 + 144) == 0;
  v43 = GAXLogCommon();
  BOOL v44 = os_log_type_enabled(v43, OS_LOG_TYPE_DEFAULT);
  if (v42)
  {
    if (v44)
    {
      uint64_t v51 = *(void *)(a1 + 32);
      v52 = +[NSNumber numberWithBool:v2];
      v53 = +[NSNumber numberWithUnsignedInt:*(unsigned int *)(*(void *)(*(void *)(a1 + 72) + 8) + 24)];
      *(_DWORD *)buf = 138543874;
      uint64_t v78 = v51;
      __int16 v79 = 2114;
      v80 = v52;
      __int16 v81 = 2114;
      v82 = v53;
      _os_log_impl(&dword_0, v43, OS_LOG_TYPE_DEFAULT, "App:(%{public}@) asked to remove self-lock. result:%{public}@ error:%{public}@", buf, 0x20u);
    }
  }
  else if (v44)
  {
    uint64_t v45 = *(void *)(a1 + 32);
    v46 = *(void **)(*(void *)(*(void *)(a1 + 88) + 8) + 24);
    v47 = *(void **)(*(void *)(*(void *)(a1 + 80) + 8) + 24);
    v48 = +[NSNumber numberWithBool:v2];
    v49 = +[NSNumber numberWithUnsignedInt:*(unsigned int *)(*(void *)(*(void *)(a1 + 72) + 8) + 24)];
    v50 = [*(id *)(a1 + 40) _errorMessageForAvailability:*(void *)(*(void *)(*(void *)(a1 + 96) + 8) + 24)];
    *(_DWORD *)buf = 138544642;
    uint64_t v78 = v45;
    __int16 v79 = 2048;
    v80 = v46;
    __int16 v81 = 2048;
    v82 = v47;
    __int16 v83 = 2114;
    v84 = v48;
    __int16 v85 = 2114;
    v86 = v49;
    __int16 v87 = 2114;
    v88 = v50;
    _os_log_impl(&dword_0, v43, OS_LOG_TYPE_DEFAULT, "App:(%{public}@) asked to self-lock into gax. desired style: %ld effective style: %ld result:%{public}@ error:%{public}@ availability:%{public}@", buf, 0x3Eu);
  }
}

void sub_1FF98(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

uint64_t sub_1FFB4(uint64_t a1)
{
  if (*(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) == 2)
  {
    uint64_t v2 = *(void **)(a1 + 32);
    uint64_t v3 = *(void *)(a1 + 40);
    long long v4 = *(_OWORD *)(a1 + 80);
    v6[0] = *(_OWORD *)(a1 + 64);
    v6[1] = v4;
    if ([v2 appWithBundleIdentifier:v3 auditToken:v6 isAuthorizedForASAMStyle:1]) {
      [*(id *)(a1 + 32) _applyUnmanagedSelfLockRestrictionsForStyle:1];
    }
  }
  return (*(uint64_t (**)(void))(*(void *)(a1 + 48) + 16))();
}

void sub_20030(uint64_t a1, int a2)
{
  id v4 = [*(id *)(a1 + 32) _SBServerQueryForAvailabilitySBParameters];
  if (*(unsigned char *)(a1 + 96))
  {
    uint64_t v5 = GAXLogCommon();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 67109120;
      int v20 = a2;
      _os_log_impl(&dword_0, v5, OS_LOG_TYPE_INFO, "User did confirm to begin AAC: %d", buf, 8u);
    }
  }
  unsigned int v6 = +[AXSpringBoardServer server];
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_2020C;
  v9[3] = &unk_49B28;
  uint64_t v7 = *(void *)(a1 + 32);
  id v8 = *(void **)(a1 + 40);
  uint64_t v14 = *(void *)(a1 + 72);
  void v9[4] = v7;
  id v10 = v8;
  char v17 = *(unsigned char *)(a1 + 97);
  id v11 = *(id *)(a1 + 48);
  char v18 = a2;
  id v12 = *(id *)(a1 + 56);
  objc_copyWeak(&v16, (id *)(a1 + 88));
  uint64_t v15 = *(void *)(a1 + 80);
  id v13 = *(id *)(a1 + 64);
  [v6 systemAppInfoWithQuery:v4 completion:v9];

  objc_destroyWeak(&v16);
}

void sub_201F0(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_2020C(uint64_t a1, void *a2)
{
  id v3 = a2;
  *(void *)(*(void *)(*(void *)(a1 + 72) + 8) + 24) = [*(id *)(a1 + 32) _availabilityForRequestType:2 springboardParameters:v3];
  unsigned int v4 = [*(id *)(a1 + 40) isAvailabilityValid:*(void *)(*(void *)(*(void *)(a1 + 72) + 8) + 24) forSelfLockAppToEnableGuidedAccess:*(unsigned __int8 *)(a1 + 96)];
  uint64_t v5 = GAXLogCommon();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    int v6 = *(_DWORD *)(*(void *)(*(void *)(a1 + 72) + 8) + 24);
    uint64_t v7 = [*(id *)(a1 + 32) appManager];
    id v8 = [v7 effectiveAppBundleIdentifier];
    *(_DWORD *)buf = 67109634;
    int v29 = v6;
    __int16 v30 = 1024;
    unsigned int v31 = v4;
    __int16 v32 = 2114;
    uint64_t v33 = v8;
    _os_log_impl(&dword_0, v5, OS_LOG_TYPE_INFO, "rechecked availability: %d. resulting error: %d. effective app is %{public}@ .", buf, 0x18u);
  }
  if (v4) {
    goto LABEL_9;
  }
  id v9 = [*(id *)(a1 + 32) appManager];
  id v10 = [v9 effectiveAppBundleIdentifier];
  unsigned int v11 = [v10 isEqualToString:*(void *)(a1 + 48)];

  unsigned int v12 = *(unsigned char *)(a1 + 97) ? v11 : 0;
  if (v12 != 1)
  {
LABEL_9:
    (*(void (**)(void))(*(void *)(a1 + 64) + 16))();
  }
  else
  {
    [*(id *)(a1 + 32) _updateSessionAppWithIdentifier:*(void *)(a1 + 48)];
    id v13 = +[GAXSettings sharedInstance];
    [v13 setSelfLockUnmanaged:1];

    uint64_t v14 = +[GAXSettings sharedInstance];
    [v14 setActiveAppSelfLocked:1];

    [*(id *)(a1 + 40) notifySelfLockStateDidChange];
    uint64_t v15 = *(void **)(a1 + 40);
    id v16 = [*(id *)(a1 + 56) objectForKeyedSubscript:&off_4D830];
    char v17 = [*(id *)(a1 + 56) objectForKeyedSubscript:&off_4D860];
    [v15 applyUnmanagedSelfLockPropertiesMap:v16 managedConfigurationSettings:v17];

    char v18 = *(void **)(a1 + 32);
    id v19 = [v18 profileManager];
    id v20 = [v19 isUserMode];
    v23[0] = _NSConcreteStackBlock;
    v23[1] = 3221225472;
    v23[2] = sub_20548;
    void v23[3] = &unk_49B00;
    v23[4] = *(void *)(a1 + 32);
    objc_copyWeak(&v27, (id *)(a1 + 88));
    id v21 = *(id *)(a1 + 40);
    uint64_t v22 = *(void *)(a1 + 80);
    id v24 = v21;
    uint64_t v26 = v22;
    id v25 = *(id *)(a1 + 64);
    [v18 _transitionToMode:2 requireUserUnlock:v20 assumeUserInterfaceConnectionSevered:0 completion:v23];

    objc_destroyWeak(&v27);
  }
}

void sub_2052C(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_20548(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) unmanagedASAMFailsafeTimer];
  id v3 = _NSConcreteStackBlock;
  uint64_t v4 = 3221225472;
  uint64_t v5 = sub_2065C;
  int v6 = &unk_49488;
  objc_copyWeak(&v8, (id *)(a1 + 64));
  id v7 = *(id *)(a1 + 40);
  [v2 afterDelay:&v3 processBlock:28800.0];

  objc_msgSend(*(id *)(a1 + 32), "_applyUnmanagedSelfLockRestrictionsForStyle:", *(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 24), v3, v4, v5, v6);
  (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  [*(id *)(a1 + 32) _showUnmanagedASAMBeganBanner];

  objc_destroyWeak(&v8);
}

void sub_20644(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_2065C(uint64_t a1)
{
  uint64_t v2 = +[GAXSettings sharedInstance];
  unsigned int v3 = [v2 selfLockUnmanaged];

  if (v3)
  {
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
    [WeakRetained _transitionToMode:0 requireUserUnlock:0 assumeUserInterfaceConnectionSevered:0];

    uint64_t v5 = +[GAXSettings sharedInstance];
    [v5 setActiveAppSelfLocked:0];

    int v6 = +[GAXSettings sharedInstance];
    [v6 setSelfLockUnmanaged:0];

    [*(id *)(a1 + 32) notifySelfLockStateDidChange];
    id v7 = objc_loadWeakRetained((id *)(a1 + 40));
    [v7 _showUnmanagedASAMTimedOutBanner];
  }
}

uint64_t sub_2074C(uint64_t a1)
{
  [*(id *)(a1 + 32) _applyUnmanagedSelfLockRestrictionsForStyle:*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 24)];
  uint64_t v2 = *(uint64_t (**)(void))(*(void *)(a1 + 40) + 16);

  return v2();
}

id sub_207A4(uint64_t a1)
{
  id result = (id)(*(uint64_t (**)(void))(*(void *)(a1 + 40) + 16))();
  if (*(unsigned char *)(a1 + 48))
  {
    unsigned int v3 = *(void **)(a1 + 32);
    return [v3 _showUnmanagedASAMEndedBanner];
  }
  return result;
}

uint64_t sub_20804(uint64_t a1, uint64_t a2)
{
  *(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = [*(id *)(a1 + 32) _availabilityForRequestType:2 springboardParameters:a2];
  *(_DWORD *)(*(void *)(*(void *)(a1 + 64) + 8) + 24) = [*(id *)(a1 + 40) isAvailabilityValid:*(void *)(*(void *)(*(void *)(a1 + 56) + 8)+ 24) forSelfLockAppToEnableGuidedAccess:*(unsigned __int8 *)(a1 + 72)];
  unsigned int v3 = *(uint64_t (**)(void))(*(void *)(a1 + 48) + 16);

  return v3();
}

BOOL sub_20CD4(id a1, AXValidationManager *a2)
{
  uint64_t v2 = a2;
  [(AXValidationManager *)v2 validateClass:@"AXBHomeClickController", @"controller", "@", 0 hasClassMethod withFullSignature];
  [(AXValidationManager *)v2 validateClass:@"AXBHomeClickController" hasInstanceVariable:@"_isAlertVisible" withType:"B"];
  [(AXValidationManager *)v2 validateClass:@"FBSDisplayLayoutElement" hasInstanceVariable:@"_application" withType:"B"];
  [(AXValidationManager *)v2 validateClass:@"FBSDisplayLayoutElement" hasInstanceVariable:@"_bundleIdentifier" withType:"NSString"];
  [(AXValidationManager *)v2 validateClass:@"BKSystemShellSentinel"];
  [(AXValidationManager *)v2 validateClass:@"BKSystemShellSentinel", @"sharedInstance", "@", 0 hasClassMethod withFullSignature];
  [(AXValidationManager *)v2 validateClass:@"BKSystemShellSentinel" hasInstanceVariable:@"_lock_systemAppBlocked" withType:"B"];
  objc_opt_class();
  [(AXValidationManager *)v2 validateClass:@"BKSystemShellSentinel" hasInstanceVariable:@"_lock" withType:__ax_verbose_encode_with_type_encoding_group_class()];

  return 1;
}

BOOL sub_20E0C(id a1, AXValidationManager *a2)
{
  uint64_t v2 = a2;
  [(AXValidationManager *)v2 setValidationTargetName:@"GAX Backboard"];
  [(AXValidationManager *)v2 setOverrideProcessName:@"Guided Access Backboard"];
  [(AXValidationManager *)v2 setDebugBuild:0];

  return _AXPerformValidationChecks();
}

void sub_20E70(id a1, AXValidationManager *a2)
{
  uint64_t v2 = a2;
  [(AXValidationManager *)v2 installSafeCategory:@"GAXBKAccelerometerInterfaceAccessibility" canInteractWithTargetClass:1];
  [(AXValidationManager *)v2 installSafeCategory:@"GAXBKSystemShellSentinelAccessibility" canInteractWithTargetClass:1];
  [(AXValidationManager *)v2 installSafeCategory:@"GAXBKOrientationManagerAccessibility" canInteractWithTargetClass:1];
}

void sub_212D4(uint64_t a1, void *a2, void *a3)
{
  id v6 = a2;
  if ([a3 integerValue] == (char *)&dword_0 + 1)
  {
    uint64_t v5 = [*(id *)(a1 + 32) appManager];
    [v5 effectiveAppRestrictionWithIdentifier:v6 didChangeState:0];
  }
}

void sub_2134C(uint64_t a1, void *a2, void *a3)
{
  id v6 = a2;
  if (![a3 integerValue])
  {
    uint64_t v5 = [*(id *)(a1 + 32) appManager];
    [v5 effectiveAppRestrictionWithIdentifier:v6 didChangeState:0];
  }
}

void sub_21494(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  objc_msgSend(*(id *)(a1 + 32), "effectiveAppRestrictionWithIdentifier:didChangeState:", v5, objc_msgSend(a3, "integerValue"));
}

void sub_215D4(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  if ([a3 integerValue] == (char *)&dword_0 + 1) {
    [*(id *)(a1 + 32) effectiveAppRestrictionWithIdentifier:v5 didChangeState:1];
  }
}

void sub_21DA4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t sub_21DCC(uint64_t result)
{
  *(unsigned char *)(*(void *)(*(void *)(result + 40) + 8) + 24) = (*(unsigned char *)(*(void *)(result + 32) + 40) & 0x10) != 0;
  *(_DWORD *)(*(void *)(result + 32) + 40) = *(_DWORD *)(*(void *)(result + 32) + 40) & 0xFFFFFFEF | (16 * *(unsigned __int8 *)(result + 48));
  return result;
}

id sub_21E88(uint64_t a1)
{
  return [*(id *)(a1 + 32) _transitionToMode:0];
}

void sub_22058(uint64_t a1)
{
  [*(id *)(a1 + 32) _setTimeRestrictionHasExpired:1];
  uint64_t v2 = [*(id *)(a1 + 32) userInterfaceClient];
  CFStringRef v13 = @"time restriction duration";
  unsigned int v3 = [*(id *)(a1 + 32) profileManager];
  uint64_t v4 = +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", [v3 appTimeoutDuration]);
  uint64_t v14 = v4;
  id v5 = +[NSDictionary dictionaryWithObjects:&v14 forKeys:&v13 count:1];
  id v6 = +[AXAccessQueue mainAccessQueue];
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_2227C;
  v12[3] = &unk_49880;
  v12[4] = *(void *)(a1 + 32);
  [v2 sendAsynchronousMessage:v5 withIdentifier:29 targetAccessQueue:v6 completion:v12];

  id v7 = +[AXSpringBoardServer server];
  id v8 = [*(id *)(a1 + 32) appManager];
  id v9 = [v8 effectiveAppBundleIdentifier];
  [v7 pauseMediaForApp:v9];

  dispatch_time_t v10 = dispatch_time(0, 200000000);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_222C8;
  block[3] = &unk_48928;
  block[4] = *(void *)(a1 + 32);
  dispatch_after(v10, (dispatch_queue_t)&_dispatch_main_q, block);
}

void sub_2227C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (!a3)
  {
    id v4 = [*(id *)(a1 + 32) eventProcessor];
    [v4 cancelCurrentTouches];
  }
}

void sub_222C8(uint64_t a1)
{
  id v3 = [*(id *)(a1 + 32) appManager];
  if (([v3 effectiveAppIsHostedByTheSystemApp] & 1) == 0)
  {
    unsigned int v2 = [*(id *)(a1 + 32) _hasTimeRestrictionExpired];

    if (!v2) {
      return;
    }
    id v3 = [*(id *)(a1 + 32) appManager];
    [v3 suspendEffectiveApp];
  }
}

uint64_t sub_225FC(uint64_t a1, int a2, int a3)
{
  uint64_t result = AXSessionIsLoginSession();
  if ((a2 & a3 & 1) == 0 && (result & 1) == 0)
  {
    [*(id *)(a1 + 32) _updateSessionAppForSingleAppMode];
    [*(id *)(a1 + 32) _notifyOfGAXBackboardStateChange];
    id v7 = [*(id *)(a1 + 32) integrityVerifier];
    [v7 verifyIntegrityWithEvent:13];

    id v8 = *(void **)(a1 + 32);
    return (uint64_t)[v8 _applyDeniedStatesForRestrictions];
  }
  return result;
}

uint64_t sub_2274C(uint64_t a1, int a2, int a3)
{
  uint64_t result = AXSessionIsLoginSession();
  if ((a2 & a3 & 1) == 0 && (result & 1) == 0)
  {
    [*(id *)(a1 + 32) _updateSessionAppForSingleAppMode];
    [*(id *)(a1 + 32) _notifyOfGAXBackboardStateChange];
    id v7 = [*(id *)(a1 + 32) integrityVerifier];
    [v7 verifyIntegrityWithEvent:14];

    id v8 = *(void **)(a1 + 32);
    return (uint64_t)[v8 _applyDeniedStatesForRestrictions];
  }
  return result;
}

id sub_228E0(uint64_t a1)
{
  [*(id *)(a1 + 32) _transitionToMode:0 requireUserUnlock:0];
  [*(id *)(a1 + 32) _updateRestrictedState:0];
  unsigned int v2 = *(void **)(a1 + 32);

  return [v2 setShouldStartSessionUponFrontmostAppChanged:0];
}

void sub_22BE4(uint64_t a1)
{
  unsigned int v2 = +[GAXSettings sharedInstance];
  [v2 setActiveAppSelfLocked:0];

  [*(id *)(a1 + 32) _transitionToMode:0 requireUserUnlock:0];
  [*(id *)(a1 + 32) _updateRestrictedState:0];
  id v3 = [*(id *)(a1 + 32) axFeatureManager];
  [v3 restoreAccessibilityFeatures];
}

void sub_22D64(uint64_t a1)
{
  unsigned int v2 = [*(id *)(a1 + 32) profileManager];
  unsigned int v3 = [v2 isUserMode];

  if (v3)
  {
    id v4 = [*(id *)(a1 + 32) substantialTransitionTimer];

    if (!v4)
    {
      id v5 = objc_alloc((Class)AXAccessQueueTimer);
      id v6 = +[AXAccessQueue mainAccessQueue];
      id v7 = [v5 initWithTargetAccessQueue:v6];
      [*(id *)(a1 + 32) setSubstantialTransitionTimer:v7];
    }
    id v8 = [*(id *)(a1 + 32) substantialTransitionTimer];
    [v8 cancel];

    id v9 = [*(id *)(a1 + 32) substantialTransitionTimer];
    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472;
    v10[2] = sub_22E98;
    v10[3] = &unk_48928;
    void v10[4] = *(void *)(a1 + 32);
    [v9 afterDelay:v10 processWritingBlock:1.0];
  }
}

void sub_22E98(uint64_t a1)
{
  unsigned int v2 = GAXLogIntegrity();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG)) {
    sub_2B47C();
  }

  id v4 = *(void **)(a1 + 32);
  unsigned int v3 = (id *)(a1 + 32);
  id v5 = [v4 integrityVerifier];
  unsigned int v6 = [v5 isVerifyingIntegrity];

  if (v6)
  {
    id v7 = GAXLogIntegrity();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
      sub_2B3DC(v3, v7);
    }
  }
  else
  {
    uint64_t v13 = 0;
    uint64_t v14 = &v13;
    uint64_t v15 = 0x2020000000;
    int v16 = 0;
    id v8 = *v3;
    id v9 = *((void *)*v3 + 1);
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_23060;
    block[3] = &unk_494B0;
    block[4] = v8;
    void block[5] = &v13;
    dispatch_sync(v9, block);
    if (*((_DWORD *)v14 + 6) > 1u)
    {
      dispatch_time_t v10 = [*v3 integrityVerifier];
      [v10 verifyIntegrityWithEvent:15];
    }
    else
    {
      v11[0] = _NSConcreteStackBlock;
      v11[1] = 3221225472;
      void v11[2] = sub_23074;
      v11[3] = &unk_48928;
      v11[4] = *v3;
      dispatch_async((dispatch_queue_t)&_dispatch_main_q, v11);
    }
    _Block_object_dispose(&v13, 8);
  }
}

void sub_23048(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 80), 8);
  _Unwind_Resume(a1);
}

uint64_t sub_23060(uint64_t result)
{
  *(_DWORD *)(*(void *)(*(void *)(result + 40) + 8) + 24) = *(_DWORD *)(*(void *)(result + 32) + 16);
  return result;
}

void sub_23074(uint64_t a1)
{
  unsigned int v2 = [*(id *)(a1 + 32) appManager];
  id v4 = [v2 effectiveAppBundleIdentifier];

  [*(id *)(a1 + 32) _updateSessionAppWithIdentifier:v4];
  unsigned int v3 = [*(id *)(a1 + 32) integrityVerifier];
  [v3 verifyIntegrityWithEvent:15];
}

void sub_235C8(uint64_t a1)
{
  unsigned int v2 = *(void **)(a1 + 32);
  id v5 = [v2 profileManager];
  id v3 = [v5 timeRestrictionsEnabled];
  id v4 = [*(id *)(a1 + 32) timeRestrictionManager];
  objc_msgSend(v2, "_showAlertWithTextType:asBanner:isUrgent:timeRestrictionsEnabled:remainingTime:", 1, 1, 0, v3, objc_msgSend(v4, "remainingTimeInSeconds"));
}

void sub_24378(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 96), 8);
  _Unwind_Resume(a1);
}

uint64_t sub_24394(uint64_t result)
{
  *(_DWORD *)(*(void *)(*(void *)(result + 40) + 8) + 24) = *(_DWORD *)(*(void *)(result + 32) + 16);
  return result;
}

id sub_243A8(uint64_t a1)
{
  return [*(id *)(a1 + 32) _transitionToMode:*(unsigned int *)(a1 + 40) requireUserUnlock:0];
}

uint64_t sub_243BC(uint64_t result)
{
  *(_DWORD *)(*(void *)(*(void *)(result + 40) + 8) + 24) = *(_DWORD *)(*(void *)(result + 32) + 36);
  return result;
}

void sub_243D0(uint64_t a1)
{
  uint64_t v1 = *(void **)(a1 + 32);
  id v3 = [*(id *)(a1 + 40) parameters];
  unsigned int v2 = [v3 objectForKeyedSubscript:@"passcode"];
  [v1 _setPasscode:v2];
}

id sub_2443C(uint64_t a1)
{
  unsigned int v2 = [*(id *)(a1 + 32) profileManager];
  [v2 updateProperty:@"GAXProfileAllowsKeyboardTextInput" withValue:*(void *)(a1 + 40)];

  id result = *(id *)(a1 + 32);
  if (result)
  {
    id result = [result gaxState];
    if (v4) {
      return [*(id *)(a1 + 32) _handleUpdateGAXClientState];
    }
  }
  return result;
}

void sub_244AC(uint64_t a1, uint64_t a2)
{
  id v3 = +[NSNumber numberWithBool:a2];
  [*(id *)(a1 + 32) setResult:v3];

  id v4 = [*(id *)(a1 + 32) data];
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

void sub_249BC(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, a5, 0xCu);
}

void sub_249D4(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_fault_impl(a1, a2, OS_LOG_TYPE_FAULT, a4, &a9, 2u);
}

void sub_249FC(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, v9, OS_LOG_TYPE_ERROR, a4, &a9, 0x16u);
}

void sub_24B58(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_24B80(uint64_t a1)
{
  unsigned int v2 = GAXLogCommon();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_0, v2, OS_LOG_TYPE_DEFAULT, "Got layout monitor transition.", buf, 2u);
  }

  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_24C58;
  block[3] = &unk_49DA0;
  objc_copyWeak(&v4, (id *)(a1 + 32));
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
  objc_destroyWeak(&v4);
}

void sub_24C58(uint64_t a1)
{
  unsigned int v2 = GAXLogCommon();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v4 = 0;
    _os_log_impl(&dword_0, v2, OS_LOG_TYPE_DEFAULT, "Now updating for layout monitor transition.", v4, 2u);
  }

  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained updateManagedAppState:1];
}

void sub_24F5C()
{
  v0 = +[AXSpringBoardServer server];
  uint64_t v1 = [v0 focusedApps];

  id v2 = v1;
  AXPerformBlockAsynchronouslyOnMainThread();
}

void sub_25020(uint64_t a1)
{
  if (*(unsigned char *)(a1 + 48))
  {
    long long v55 = 0u;
    long long v56 = 0u;
    long long v53 = 0u;
    long long v54 = 0u;
    id v2 = [*(id *)(a1 + 32) managedApps];
    id v3 = [v2 countByEnumeratingWithState:&v53 objects:v65 count:16];
    if (v3)
    {
      id v4 = v3;
      uint64_t v5 = *(void *)v54;
      do
      {
        for (i = 0; i != v4; i = (char *)i + 1)
        {
          if (*(void *)v54 != v5) {
            objc_enumerationMutation(v2);
          }
          [*(id *)(*((void *)&v53 + 1) + 8 * i) setLayoutRole:0];
        }
        id v4 = [v2 countByEnumeratingWithState:&v53 objects:v65 count:16];
      }
      while (v4);
    }
  }
  long long v51 = 0u;
  long long v52 = 0u;
  long long v49 = 0u;
  long long v50 = 0u;
  id v7 = *(id *)(a1 + 40);
  id v8 = [v7 countByEnumeratingWithState:&v49 objects:v64 count:16];
  if (v8)
  {
    id v9 = v8;
    uint64_t v10 = *(void *)v50;
    do
    {
      for (j = 0; j != v9; j = (char *)j + 1)
      {
        if (*(void *)v50 != v10) {
          objc_enumerationMutation(v7);
        }
        unsigned int v12 = *(void **)(*((void *)&v49 + 1) + 8 * (void)j);
        uint64_t v13 = *(void **)(a1 + 32);
        uint64_t v14 = [v12 bundleIdentifier];
        uint64_t v15 = [v13 _appWithBundleIdentifier:v14];

        int v16 = *(void **)(a1 + 32);
        if (v15)
        {
          [v16 _updateGAXApp:v15 fromAXApp:v12];
        }
        else if ([v16 _axAppIsValidGAXApp:v12])
        {
          char v17 = [*(id *)(a1 + 32) managedApps];
          char v18 = [*(id *)(a1 + 32) _makeGAXAppFromAXApp:v12];
          [v17 addObject:v18];
        }
      }
      id v9 = [v7 countByEnumeratingWithState:&v49 objects:v64 count:16];
    }
    while (v9);
  }

  id v19 = [*(id *)(a1 + 32) appLayoutMonitor];
  id v20 = [v19 currentLayout];
  id v21 = [v20 elements];

  long long v47 = 0u;
  long long v48 = 0u;
  long long v45 = 0u;
  long long v46 = 0u;
  id obj = v21;
  id v22 = [obj countByEnumeratingWithState:&v45 objects:v63 count:16];
  if (!v22)
  {
    id v25 = 0;
    goto LABEL_65;
  }
  id v24 = v22;
  id v25 = 0;
  uint64_t v26 = *(void *)v46;
  *(void *)&long long v23 = 138412290;
  long long v43 = v23;
  do
  {
    id v27 = 0;
    do
    {
      if (*(void *)v46 != v26) {
        objc_enumerationMutation(obj);
      }
      BOOL v28 = *(void **)(*((void *)&v45 + 1) + 8 * (void)v27);
      int v29 = objc_msgSend(v28, "identifier", v43);
      if ([v28 isUIApplicationElement]) {
        [v28 bundleIdentifier];
      }
      else {
      uint64_t v30 = [*(id *)(a1 + 32) _bundleIdentifierFromLayoutIdentifier:v29];
      }
      unsigned int v31 = (void *)v30;
      if (v30) {
        __int16 v32 = (void *)v30;
      }
      else {
        __int16 v32 = v29;
      }
      id v33 = v32;

      id v34 = [v28 layoutRole];
      char v35 = GAXLogCommon();
      if (os_log_type_enabled(v35, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412802;
        id v58 = v29;
        __int16 v59 = 2112;
        id v60 = v33;
        __int16 v61 = 2048;
        id v62 = v34;
        _os_log_impl(&dword_0, v35, OS_LOG_TYPE_DEFAULT, "Layout ID: %@ Bundle ID: %@ Role: %ld", buf, 0x20u);
      }

      if (v29)
      {
        v36 = [*(id *)(a1 + 32) _appWithBundleIdentifier:v33];
        if (!v36)
        {
          v36 = [[_GAXAppRepresentation alloc] initWithDelegate:*(void *)(a1 + 32)];
          [(_GAXAppRepresentation *)v36 setPid:0xFFFFFFFFLL];
          [(_GAXAppRepresentation *)v36 setBundleIdentifier:v33];
          if ([*(id *)(a1 + 32) _axAppIsValidGAXApp:v36])
          {
            id v37 = [*(id *)(a1 + 32) managedApps];
            [v37 addObject:v36];
          }
        }
        if (v25 && ([v33 isEqualToString:v25] & 1) != 0)
        {
          v38 = GAXLogCommon();
          if (os_log_type_enabled(v38, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 134218242;
            id v58 = v34;
            __int16 v59 = 2112;
            id v60 = v33;
            _os_log_impl(&dword_0, v38, OS_LOG_TYPE_INFO, "Found app with both primary role and role %ld: %@", buf, 0x16u);
          }
        }
        else
        {
          [(_GAXAppRepresentation *)v36 setLayoutRole:v34];
          if ([(_GAXAppRepresentation *)v36 layoutRole] != (char *)&dword_0 + 1) {
            goto LABEL_58;
          }
          if (qword_56130 == -1)
          {
            if (!v25) {
              goto LABEL_57;
            }
          }
          else
          {
            dispatch_once(&qword_56130, &stru_49DE8);
            if (!v25) {
              goto LABEL_57;
            }
          }
          if (([(id)qword_56128 containsObject:v25] & 1) == 0
            && ![(id)qword_56128 containsObject:v33])
          {
            id v40 = GAXLogCommon();
            if (os_log_type_enabled(v40, OS_LOG_TYPE_FAULT))
            {
              *(_DWORD *)buf = 138412546;
              id v58 = v25;
              __int16 v59 = 2112;
              id v60 = v33;
              _os_log_fault_impl(&dword_0, v40, OS_LOG_TYPE_FAULT, "Unexpectedly found two app bundle identifiers that were primary, %@ and %@", buf, 0x16u);
            }

LABEL_57:
            id v41 = v33;

            id v25 = v41;
            goto LABEL_58;
          }
          v39 = GAXLogCommon();
          if (os_log_type_enabled(v39, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412546;
            id v58 = v25;
            __int16 v59 = 2112;
            id v60 = v33;
            _os_log_impl(&dword_0, v39, OS_LOG_TYPE_DEFAULT, "Primary role found for both %@ and %@", buf, 0x16u);
          }

          if ([(id)qword_56128 containsObject:v25]) {
            goto LABEL_57;
          }
        }
      }
      else
      {
        GAXLogCommon();
        v36 = (_GAXAppRepresentation *)objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled((os_log_t)v36, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = v43;
          id v58 = v28;
          _os_log_error_impl(&dword_0, (os_log_t)v36, OS_LOG_TYPE_ERROR, "Did not expect layoutElement to have a nil identifier: %@", buf, 0xCu);
        }
      }
LABEL_58:

      id v27 = (char *)v27 + 1;
    }
    while (v24 != v27);
    id v42 = [obj countByEnumeratingWithState:&v45 objects:v63 count:16];
    id v24 = v42;
  }
  while (v42);
LABEL_65:
}

void sub_256A8(id a1)
{
  v4[0] = SBSDisplayLayoutElementHomeScreenIdentifier;
  v4[1] = SBSDisplayLayoutElementAppSwitcherIdentifier;
  uint64_t v1 = +[NSArray arrayWithObjects:v4 count:2];
  uint64_t v2 = +[NSSet setWithArray:v1];
  id v3 = (void *)qword_56128;
  qword_56128 = v2;
}

void sub_25AB0(id a1)
{
  v4[0] = @"com.apple.lock-screen";
  v4[1] = @"com.apple.Siri";
  void v4[2] = SBSDisplayLayoutElementTodayViewIdentifier;
  v4[3] = SBSDisplayLayoutElementAppLibraryIdentifier;
  v4[4] = SBSDisplayLayoutElementAppLibraryOpenPodIdentifier;
  v4[5] = SBSDisplayLayoutElementHomeScreenOpenFolderIdentifier;
  v4[6] = @"com.apple.shortcuts.runtime";
  uint64_t v1 = +[NSArray arrayWithObjects:v4 count:7];
  uint64_t v2 = +[NSSet setWithArray:v1];
  id v3 = (void *)qword_56138;
  qword_56138 = v2;
}

BOOL sub_25BA0(id a1, FBSDisplayLayoutElement *a2, NSDictionary *a3)
{
  id v3 = [(FBSDisplayLayoutElement *)a2 identifier];
  char v4 = [(id)qword_56138 containsObject:v3] ^ 1;

  return v4;
}

id sub_25DE4(uint64_t a1)
{
  return [*(id *)(a1 + 32) resetRelaunchAttempts];
}

void sub_2617C(uint64_t a1, uint64_t a2)
{
  char v4 = GAXLogIntegrity();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    uint64_t v5 = +[NSNumber numberWithInt:a2];
    *(_DWORD *)buf = 138543362;
    id v19 = v5;
    _os_log_impl(&dword_0, v4, OS_LOG_TYPE_INFO, "Monitoring PurpleBuddy PID: %{public}@", buf, 0xCu);
  }
  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472;
  v17[2] = sub_263EC;
  v17[3] = &unk_48928;
  v17[4] = *(void *)(a1 + 32);
  unsigned int v6 = objc_retainBlock(v17);
  id v7 = dispatch_get_global_queue(0, 0);
  id v8 = [*(id *)(a1 + 32) purpleBuddyPIDMonitor];

  if ((int)a2 < 1 || v8)
  {
    if (a2 == -1)
    {
      unsigned int v12 = GAXLogIntegrity();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_0, v12, OS_LOG_TYPE_DEFAULT, "Asked to monitor PurpleBuddy, but by the time we tried to get its PID, it had terminated.", buf, 2u);
      }

      dispatch_async(v7, v6);
    }
  }
  else
  {
    dispatch_source_t v9 = dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_proc, a2, 0x80000000uLL, v7);
    [*(id *)(a1 + 32) setPurpleBuddyPIDMonitor:v9];
    if (v9)
    {
      v13[0] = _NSConcreteStackBlock;
      v13[1] = 3221225472;
      v13[2] = sub_265FC;
      v13[3] = &unk_49E70;
      int v16 = v6;
      uint64_t v10 = v9;
      uint64_t v11 = *(void *)(a1 + 32);
      uint64_t v14 = v10;
      uint64_t v15 = v11;
      dispatch_source_set_event_handler(v10, v13);
      dispatch_resume(v10);
    }
  }
}

uint64_t sub_263EC(uint64_t a1)
{
  int v2 = CFPreferencesAppSynchronize(@"com.apple.purplebuddy");
  Boolean keyExistsAndHasValidFormat = v2;
  if (!v2)
  {
    id v3 = GAXLogIntegrity();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
      sub_2B6C0(v3, v4, v5, v6, v7, v8, v9, v10);
    }
  }
  int AppBooleanValue = CFPreferencesGetAppBooleanValue(@"SetupDone", @"com.apple.purplebuddy", &keyExistsAndHasValidFormat);
  int v12 = AppBooleanValue;
  if (keyExistsAndHasValidFormat)
  {
    if (AppBooleanValue)
    {
LABEL_7:
      id v24 = _NSConcreteStackBlock;
      uint64_t v25 = 3221225472;
      uint64_t v26 = sub_265A0;
      id v27 = &unk_48928;
      uint64_t v28 = *(void *)(a1 + 32);
      return AXPerformBlockAsynchronouslyOnMainThread();
    }
  }
  else
  {
    uint64_t v14 = GAXLogIntegrity();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
      sub_2B688(v14, v15, v16, v17, v18, v19, v20, v21);
    }

    if (v12) {
      goto LABEL_7;
    }
  }
  id v22 = GAXLogIntegrity();
  if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_0, v22, OS_LOG_TYPE_DEFAULT, "buddy did not appear to exit cleanly. will monitor for new instance", buf, 2u);
  }

  return AXPerformBlockOnMainThreadAfterDelay();
}

void sub_265A0(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) delegate];
  [v2 purpleBuddyDidTerminateWithAppManager:*(void *)(a1 + 32)];
}

id sub_265F4(uint64_t a1)
{
  return [*(id *)(a1 + 32) monitorForPurpleBuddyDeath];
}

id sub_265FC(uint64_t a1)
{
  id v2 = GAXLogIntegrity();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)uint64_t v4 = 0;
    _os_log_impl(&dword_0, v2, OS_LOG_TYPE_DEFAULT, "Did get nod that purpleBuddy terminated. Verifying Guided Access now", v4, 2u);
  }

  (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  dispatch_source_cancel(*(dispatch_source_t *)(a1 + 32));
  return [*(id *)(a1 + 40) setPurpleBuddyPIDMonitor:0];
}

void sub_27E50(id a1)
{
  CFStringRef v4 = @"com.apple.shortcuts.runtime";
  uint64_t v1 = +[NSArray arrayWithObjects:&v4 count:1];
  uint64_t v2 = +[NSSet setWithArray:v1];
  id v3 = (void *)qword_56148;
  qword_56148 = v2;
}

void sub_29580(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location)
{
  objc_destroyWeak(v15);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_295A8(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  uint64_t v2 = GAXLogCommon();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    id v3 = [WeakRetained appClient];
    unsigned int v4 = [v3 pid];
    uint64_t v5 = [WeakRetained bundleIdentifier];
    v6[0] = 67109378;
    v6[1] = v4;
    __int16 v7 = 2112;
    uint64_t v8 = v5;
    _os_log_impl(&dword_0, v2, OS_LOG_TYPE_DEFAULT, "Port death handler called for pid %i, identifier %@", (uint8_t *)v6, 0x12u);
  }
  [WeakRetained handleDeath];
}

void sub_29A80(uint64_t a1, NSObject *a2)
{
  int v2 = 138543362;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_0, a2, OS_LOG_TYPE_ERROR, "Backboard Server could not start its message server: %{public}@", (uint8_t *)&v2, 0xCu);
}

void sub_29AF8()
{
  sub_444C();
  sub_4430(&dword_0, v0, v1, "User AX Settings were already saved, keeping those", v2, v3, v4, v5, v6);
}

void sub_29B2C()
{
  sub_444C();
  sub_4430(&dword_0, v0, v1, "User AX settings were not saved yet, saving them now", v2, v3, v4, v5, v6);
}

void sub_29B60()
{
  sub_444C();
  sub_4430(&dword_0, v0, v1, "Will override the user preferred AX Settings now", v2, v3, v4, v5, v6);
}

void sub_29B94()
{
  sub_444C();
  sub_4430(&dword_0, v0, v1, "Will restore the user preferred AX Settings now", v2, v3, v4, v5, v6);
}

void sub_29BC8(void *a1, NSObject *a2)
{
  int v3 = 134217984;
  uint64_t v4 = [a1 isRestoring];
  _os_log_debug_impl(&dword_0, a2, OS_LOG_TYPE_DEBUG, "Did finish updating AX Settings. Was restoring: %ld", (uint8_t *)&v3, 0xCu);
}

void sub_29C58(uint64_t a1, NSObject *a2)
{
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_0, a2, OS_LOG_TYPE_ERROR, "No fallback value was registered for profile key: %@", (uint8_t *)&v2, 0xCu);
}

void sub_29CD0(uint64_t a1, NSObject *a2)
{
  int v2 = 138543362;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_0, a2, OS_LOG_TYPE_ERROR, "Unable to push backboard state change to SpringBoard: %{public}@", (uint8_t *)&v2, 0xCu);
}

void sub_29D48(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_error_impl(&dword_0, log, OS_LOG_TYPE_ERROR, "Updating GAXSpringboardClient with a nil frontmostAppID", v1, 2u);
}

void sub_29D8C(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_error_impl(&dword_0, log, OS_LOG_TYPE_ERROR, "No appID sent in when launching application", v1, 2u);
}

void sub_29DD0(uint64_t a1, NSObject *a2)
{
  int v2 = 138543362;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_0, a2, OS_LOG_TYPE_ERROR, "Couldn't get suggested passcode length from SpringBoard: %{public}@", (uint8_t *)&v2, 0xCu);
}

void sub_29E48(NSObject *a1)
{
  int v2 = +[NSNumber numberWithUnsignedInteger:0];
  int v3 = 138412290;
  uint64_t v4 = v2;
  _os_log_fault_impl(&dword_0, a1, OS_LOG_TYPE_FAULT, "Did not understand outcome: %@", (uint8_t *)&v3, 0xCu);
}

void sub_29EEC()
{
  sub_444C();
  sub_9830(&dword_0, v0, v1, "Session app gax client failed to check in. Giving up", v2, v3, v4, v5, v6);
}

void sub_29F20()
{
  sub_444C();
  sub_9830(&dword_0, v0, v1, "Unable to access SpringBoard server!", v2, v3, v4, v5, v6);
}

void sub_29F54()
{
  sub_444C();
  _os_log_fault_impl(&dword_0, v0, OS_LOG_TYPE_FAULT, "Should not have gotten here if waiting for SpringBoard to relaunch.", v1, 2u);
}

void sub_29F94(uint64_t a1, NSObject *a2)
{
  int v2 = 138543362;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_0, a2, OS_LOG_TYPE_ERROR, "%{public}@", (uint8_t *)&v2, 0xCu);
}

void sub_2A00C()
{
  sub_444C();
  sub_9830(&dword_0, v0, v1, "replayEvent was nil", v2, v3, v4, v5, v6);
}

void sub_2A040()
{
  sub_BE94();
  sub_BEC0(&dword_0, v0, v1, "Could not read GAX state from file: %{public}@", v2);
}

void sub_2A0AC()
{
  sub_BE94();
  sub_BEC0(&dword_0, v0, v1, "Could not deserialize GAX state %{public}@", v2);
}

void sub_2A118()
{
  sub_BE94();
  sub_BEC0(&dword_0, v0, v1, "Could not serialize GAX State: %{public}@", v2);
}

void sub_2A184()
{
  os_log_t v0 = __error();
  strerror(*v0);
  sub_BE94();
  sub_BEA0(&dword_0, v1, v2, "Failed to open GAX State file. errno: %{public}s", v3, v4, v5, v6, v7);
}

void sub_2A204()
{
  os_log_t v0 = __error();
  strerror(*v0);
  sub_BE94();
  sub_BEA0(&dword_0, v1, v2, "Failed to open GAX state directory: %{public}s", v3, v4, v5, v6, v7);
}

void sub_2A284()
{
  os_log_t v0 = __error();
  strerror(*v0);
  sub_BE94();
  sub_BEA0(&dword_0, v1, v2, "failed to F_FULLSYNC GAX state directory: %{public}s", v3, v4, v5, v6, v7);
}

void sub_2A304()
{
  sub_BE94();
  sub_BEC0(&dword_0, v0, v1, "Failed to set protection class on GAX State file: %{public}@", v2);
}

void sub_2A370()
{
  sub_BE94();
  sub_BEC0(&dword_0, v0, v1, "Failed to create dir for gax state file: %{public}@", v2);
}

void sub_2A3DC(void *a1)
{
  uint64_t v1 = [a1 settingsStorage];
  sub_BE94();
  sub_BEA0(&dword_0, v2, v3, "Cannot write out GAX state. Its not valid json: %{public}@", v4, v5, v6, v7, v8);
}

void sub_2A460(void *a1, uint64_t a2, NSObject *a3)
{
  uint64_t v5 = [a1 fastStorage];
  uint64_t v6 = [v5 activeAppID];
  sub_BE94();
  __int16 v8 = 2114;
  uint64_t v9 = a2;
  _os_log_debug_impl(&dword_0, a3, OS_LOG_TYPE_DEBUG, "Updated persisted appID. %{public}@ --> %{public}@", v7, 0x16u);
}

void sub_2A51C(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_2A588(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_2A5F4(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_error_impl(&dword_0, log, OS_LOG_TYPE_ERROR, "Guided Access rejecting Single App Mode.  Profile does not specify any app IDs", v1, 2u);
}

void sub_2A638(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_2A6A8(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_2A714(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_debug_impl(&dword_0, log, OS_LOG_TYPE_DEBUG, "Guided Access blocking HID events", v1, 2u);
}

void sub_2A758(uint64_t a1, NSObject *a2)
{
  uint64_t v2 = *(void *)(a1 + 32);
  int v3 = 138543362;
  uint64_t v4 = v2;
  _os_log_debug_impl(&dword_0, a2, OS_LOG_TYPE_DEBUG, "%{public}@", (uint8_t *)&v3, 0xCu);
}

void sub_2A7D4(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_fault_impl(&dword_0, log, OS_LOG_TYPE_FAULT, "Triple click sheet was visible, but we could not get its window context ID.", v1, 2u);
}

void sub_2A818(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_fault_impl(&dword_0, log, OS_LOG_TYPE_FAULT, "Shouldn't have tried to check for a window with context ID 0.", v1, 2u);
}

void sub_2A85C()
{
  sub_444C();
  sub_4430(&dword_0, v0, v1, "GAX Backboard did finish init", v2, v3, v4, v5, v6);
}

void sub_2A890(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_2A904()
{
  sub_BE94();
  sub_105A0(&dword_0, v0, v1, "Couldn't push backboard state to SpringBoard: %{public}@", v2, v3, v4, v5, v6);
}

void sub_2A96C()
{
  sub_BE94();
  sub_249BC(&dword_0, v0, v1, "Guided Access found an app to relaunch from its profile: %{public}@", v2);
}

void sub_2A9D8()
{
  sub_BE94();
  sub_105A0(&dword_0, v0, v1, "Backboard could not stop its message server gracefully: %{public}@", v2, v3, v4, v5, v6);
}

void sub_2AA40()
{
  sub_BE94();
  sub_105A0(&dword_0, v0, v1, "Guided Access should be self-locked, but the ManagedConfig profile does not allow this app to be self-locked: %{public}@", v2, v3, v4, v5, v6);
}

void sub_2AAA8()
{
  sub_444C();
  sub_9830(&dword_0, v0, v1, "Effective app does not match session app, but is purple buddy. will continue to run.", v2, v3, v4, v5, v6);
}

void sub_2AADC(void *a1)
{
  uint64_t v2 = [a1 effectiveAppBundleIdentifier];
  uint64_t v3 = [a1 sessionAppBundleIdentifiers];
  sub_249F0();
  sub_249FC(&dword_0, v4, v5, "Effective app (%@) does not match session app (%@), but is allowed. will continue to run.", v6, v7, v8, v9, 2u);
}

void sub_2AB8C()
{
  sub_444C();
  sub_9830(&dword_0, v0, v1, "Effective app does not match session apps - terminate", v2, v3, v4, v5, v6);
}

void sub_2ABC0(uint64_t a1)
{
  [*(id *)(a1 + 32) appLaunchGeneration];
  sub_249F0();
  sub_249FC(&dword_0, v1, v2, "App launch generation %lu was out of date (%lu)", v3, v4, v5, v6, 0);
}

void sub_2AC48(uint64_t a1, uint64_t a2)
{
  int v3 = 134218242;
  uint64_t v4 = a2;
  sub_249F0();
  _os_log_error_impl(&dword_0, v2, OS_LOG_TYPE_ERROR, "Unknown message from server: %lu %@", (uint8_t *)&v3, 0x16u);
}

void sub_2ACCC()
{
  sub_444C();
  sub_4430(&dword_0, v0, v1, "Config is user or app self lock. Launch was successful.", v2, v3, v4, v5, v6);
}

void sub_2AD00(void *a1, NSObject *a2)
{
  uint64_t v4 = [a1 appManager];
  uint64_t v5 = [v4 sessionAppBundleIdentifiers];
  uint8_t v6 = [a1 profileManager];
  uint64_t v7 = [v6 singleAppModeAppID];
  int v8 = 138543618;
  uint64_t v9 = v5;
  sub_249F0();
  _os_log_error_impl(&dword_0, a2, OS_LOG_TYPE_ERROR, "Wanted single app mode, but the app manager's session apps %{public}@ did not contain the profile manager's single app mode app %{public}@. attempting to recover...", (uint8_t *)&v8, 0x16u);
}

void sub_2ADE8()
{
  sub_BE94();
  sub_105A0(&dword_0, v0, v1, "could not enqueue app relaunch message to springboard! %{public}@", v2, v3, v4, v5, v6);
}

void sub_2AE50()
{
  sub_BE94();
  sub_105A0(&dword_0, v0, v1, "Giving up enqueueing app relaunch message to springboard: %{public}@", v2, v3, v4, v5, v6);
}

void sub_2AEB8()
{
  __assert_rtn("-[GAXBackboard sessionAppIsBeingInstalledForIntegrityVerifier:sessionIdentifier:completion:]", "GAXBackboard.m", 1786, "completion != nil");
}

void sub_2AEE4()
{
  sub_444C();
  sub_249D4(&dword_0, v0, v1, "Unable to get lock to access system app access enabled state.", v2, v3, v4, v5, v6);
}

void sub_2AF18()
{
  sub_444C();
  sub_9830(&dword_0, v0, v1, "Could not transition to workspace. sb status was nil", v2, v3, v4, v5, v6);
}

void sub_2AF4C(id *a1, NSObject *a2)
{
  uint64_t v3 = [*a1 ignoredTouchRegions];
  sub_BE94();
  sub_249BC(&dword_0, a2, v4, "setting ignored touch regions in screen coordinates:\n%@", v5);
}

void sub_2AFDC()
{
  sub_444C();
  sub_4430(&dword_0, v0, v1, "Internal Pref is forcing you through the workspace.", v2, v3, v4, v5, v6);
}

void sub_2B010()
{
  sub_BE94();
  sub_249BC(&dword_0, v0, v1, "App asked if self-locked into gax: %{public}@", v2);
}

void sub_2B07C(uint64_t a1, NSObject *a2)
{
  uint64_t v2 = *(void *)(a1 + 32);
  int v3 = 138543362;
  uint64_t v4 = v2;
  _os_log_fault_impl(&dword_0, a2, OS_LOG_TYPE_FAULT, "Could not get app name for %{public}@ appID", (uint8_t *)&v3, 0xCu);
}

void sub_2B0F8()
{
  sub_BE94();
  sub_105A0(&dword_0, v0, v1, "Couldn't confirm unmanaged ASAM: %{public}@", v2, v3, v4, v5, v6);
}

void sub_2B160()
{
  sub_BE94();
  sub_105A0(&dword_0, v0, v1, "An app (%{public}@) asked to change ASAM state but we are already evaluating a previous request to modify ASAM state. Denying.", v2, v3, v4, v5, v6);
}

void sub_2B1C8()
{
  sub_444C();
  sub_249D4(&dword_0, v0, v1, "Attempted to access passcode before handle was initialized.", v2, v3, v4, v5, v6);
}

void sub_2B1FC(uint8_t *buf, unsigned char *a2, os_log_t log)
{
  *buf = 0;
  *a2 = 0;
  _os_log_error_impl(&dword_0, log, OS_LOG_TYPE_ERROR, "AX_CGPathCreateWithDataRepresentation returned a NULL value for ignoredPaths", buf, 2u);
}

void sub_2B23C()
{
  sub_444C();
  sub_4430(&dword_0, v0, v1, "Time restriction: Time did expire", v2, v3, v4, v5, v6);
}

void sub_2B270()
{
  sub_444C();
  sub_4430(&dword_0, v0, v1, "Time restriction: cancelled", v2, v3, v4, v5, v6);
}

void sub_2B2A4()
{
  sub_444C();
  sub_4430(&dword_0, v0, v1, "Time restriction: alarm event did occur", v2, v3, v4, v5, v6);
}

void sub_2B2D8()
{
  sub_444C();
  sub_4430(&dword_0, v0, v1, "Did get appDidChangeForSingleAppMode callback", v2, v3, v4, v5, v6);
}

void sub_2B30C()
{
  sub_444C();
  sub_4430(&dword_0, v0, v1, "Did get didExitSingleAppMode callback", v2, v3, v4, v5, v6);
}

void sub_2B340()
{
  sub_444C();
  sub_4430(&dword_0, v0, v1, "Did get didEnterAppSelfLockMode callback", v2, v3, v4, v5, v6);
}

void sub_2B374()
{
  sub_444C();
  sub_4430(&dword_0, v0, v1, "Did get appDidChangeForAppSelfLockMode callback", v2, v3, v4, v5, v6);
}

void sub_2B3A8()
{
  sub_444C();
  sub_4430(&dword_0, v0, v1, "Did get didExitAppSelfLockMode callback", v2, v3, v4, v5, v6);
}

void sub_2B3DC(id *a1, NSObject *a2)
{
  uint64_t v3 = [*a1 integrityVerifier];
  int v5 = 134217984;
  uint64_t v6 = [v3 isVerifyingIntegrity];
  sub_249BC(&dword_0, a2, v4, "Got substantial transition note, but already verifying integrity:%ld, so bailing", (uint8_t *)&v5);
}

void sub_2B47C()
{
  sub_444C();
  sub_4430(&dword_0, v0, v1, "Handing substantial transition note", v2, v3, v4, v5, v6);
}

void sub_2B4B0()
{
  sub_444C();
  sub_9830(&dword_0, v0, v1, "Could not make automation command from data", v2, v3, v4, v5, v6);
}

void sub_2B4E4(void *a1, NSObject *a2)
{
  uint64_t v3 = [a1 errorMessage];
  sub_BE94();
  _os_log_error_impl(&dword_0, a2, OS_LOG_TYPE_ERROR, "%{public}@", v4, 0xCu);
}

void sub_2B57C()
{
  sub_BE94();
  sub_249BC(&dword_0, v0, v1, "GAX did get automation command: %@", v2);
}

void sub_2B5E8()
{
  sub_BE94();
  sub_105A0(&dword_0, v0, v1, "Expected to receive automation command as data. It was %{public}@", v2, v3, v4, v5, v6);
}

void sub_2B650(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_2B688(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_2B6C0(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_2B6F8(void *a1)
{
  uint64_t v1 = [a1 bundleIdentifier];
  sub_BE94();
  sub_BEA0(&dword_0, v2, v3, "GAX: Killing process: %{public}@", v4, v5, v6, v7, v8);
}

void sub_2B77C()
{
  sub_BE94();
  _os_log_error_impl(&dword_0, v0, OS_LOG_TYPE_ERROR, "Unable to find delegate for app %@.", v1, 0xCu);
}

void sub_2B7F0()
{
  os_log_t v0 = +[NSThread callStackSymbols];
  sub_BE94();
  sub_BEA0(&dword_0, v1, v2, "%{public}@", v3, v4, v5, v6, v7);
}

void sub_2B880()
{
  sub_BE94();
  _os_log_error_impl(&dword_0, v0, OS_LOG_TYPE_ERROR, "Cannot set up GAX client connection to %{public}@. GAX Client has not loaded yet", v1, 0xCu);
}

void sub_2B8F4()
{
  os_log_t v0 = +[NSThread callStackSymbols];
  sub_BE94();
  sub_BEA0(&dword_0, v1, v2, "%{public}@", v3, v4, v5, v6, v7);
}

void sub_2B984(void *a1, NSObject *a2)
{
  uint64_t v4 = [a1 bundleIdentifier];
  uint64_t v5 = +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", [a1 pid]);
  int v6 = 138543618;
  uint8_t v7 = v4;
  __int16 v8 = 2114;
  uint64_t v9 = v5;
  _os_log_error_impl(&dword_0, a2, OS_LOG_TYPE_ERROR, "Cannot set up GAX client connection to %{public}@. PID not valid: %{public}@", (uint8_t *)&v6, 0x16u);
}

uint64_t AXDeviceHasHomeButton()
{
  return _AXDeviceHasHomeButton();
}

uint64_t AXDeviceIsUnlocked()
{
  return _AXDeviceIsUnlocked();
}

uint64_t AXEventTypeIsHomeButtonPress()
{
  return _AXEventTypeIsHomeButtonPress();
}

uint64_t AXEventTypeIsLockButtonPress()
{
  return _AXEventTypeIsLockButtonPress();
}

uint64_t AXEventTypeIsMotion()
{
  return _AXEventTypeIsMotion();
}

uint64_t AXEventTypeIsOrientationChange()
{
  return _AXEventTypeIsOrientationChange();
}

uint64_t AXEventTypeIsRingerSwitchStateChange()
{
  return _AXEventTypeIsRingerSwitchStateChange();
}

uint64_t AXEventTypeIsShake()
{
  return _AXEventTypeIsShake();
}

uint64_t AXEventTypeIsTouch()
{
  return _AXEventTypeIsTouch();
}

uint64_t AXEventTypeIsVolumeButtonPress()
{
  return _AXEventTypeIsVolumeButtonPress();
}

uint64_t AXInCheckerBoardScenario()
{
  return _AXInCheckerBoardScenario();
}

uint64_t AXInPreboardScenario()
{
  return _AXInPreboardScenario();
}

uint64_t AXLogCommon()
{
  return _AXLogCommon();
}

uint64_t AXLogIPC()
{
  return _AXLogIPC();
}

uint64_t AXPerformBlockAsynchronouslyOnMainThread()
{
  return _AXPerformBlockAsynchronouslyOnMainThread();
}

uint64_t AXPerformBlockOnMainThread()
{
  return _AXPerformBlockOnMainThread();
}

uint64_t AXPerformBlockOnMainThreadAfterDelay()
{
  return _AXPerformBlockOnMainThreadAfterDelay();
}

uint64_t AXPerformSafeBlock()
{
  return _AXPerformSafeBlock();
}

uint64_t AXPidSuspend()
{
  return _AXPidSuspend();
}

uint64_t AXPidUnsuspend()
{
  return _AXPidUnsuspend();
}

uint64_t AXSafeClassFromString()
{
  return _AXSafeClassFromString();
}

uint64_t AXSessionIsLoginSession()
{
  return _AXSessionIsLoginSession();
}

uint64_t AX_CGPathCreateWithDataRepresentation()
{
  return _AX_CGPathCreateWithDataRepresentation();
}

uint64_t AX_EventRepresentationContainsAnyTouchesInPath()
{
  return _AX_EventRepresentationContainsAnyTouchesInPath();
}

uint64_t AX_EventRepresentationContainsOnlyPathsForContextID()
{
  return _AX_EventRepresentationContainsOnlyPathsForContextID();
}

uint64_t BKSHIDServicesCancelTouchesOnMainDisplay()
{
  return _BKSHIDServicesCancelTouchesOnMainDisplay();
}

void CFArrayAppendValue(CFMutableArrayRef theArray, const void *value)
{
}

CFIndex CFArrayGetCount(CFArrayRef theArray)
{
  return _CFArrayGetCount(theArray);
}

const void *__cdecl CFArrayGetValueAtIndex(CFArrayRef theArray, CFIndex idx)
{
  return _CFArrayGetValueAtIndex(theArray, idx);
}

CFTypeID CFBooleanGetTypeID(void)
{
  return _CFBooleanGetTypeID();
}

Boolean CFBooleanGetValue(CFBooleanRef BOOLean)
{
  return _CFBooleanGetValue(BOOLean);
}

const void *__cdecl CFDictionaryGetValue(CFDictionaryRef theDict, const void *key)
{
  return _CFDictionaryGetValue(theDict, key);
}

CFTypeID CFGetTypeID(CFTypeRef cf)
{
  return _CFGetTypeID(cf);
}

void CFNotificationCenterAddObserver(CFNotificationCenterRef center, const void *observer, CFNotificationCallback callBack, CFStringRef name, const void *object, CFNotificationSuspensionBehavior suspensionBehavior)
{
}

CFNotificationCenterRef CFNotificationCenterGetDarwinNotifyCenter(void)
{
  return _CFNotificationCenterGetDarwinNotifyCenter();
}

void CFNotificationCenterPostNotification(CFNotificationCenterRef center, CFNotificationName name, const void *object, CFDictionaryRef userInfo, Boolean deliverImmediately)
{
}

void CFNotificationCenterRemoveObserver(CFNotificationCenterRef center, const void *observer, CFNotificationName name, const void *object)
{
}

CFTypeID CFNumberGetTypeID(void)
{
  return _CFNumberGetTypeID();
}

Boolean CFPreferencesAppSynchronize(CFStringRef applicationID)
{
  return _CFPreferencesAppSynchronize(applicationID);
}

Boolean CFPreferencesGetAppBooleanValue(CFStringRef key, CFStringRef applicationID, Boolean *keyExistsAndHasValidFormat)
{
  return _CFPreferencesGetAppBooleanValue(key, applicationID, keyExistsAndHasValidFormat);
}

void CFPreferencesSetAppValue(CFStringRef key, CFPropertyListRef value, CFStringRef applicationID)
{
}

void CFRelease(CFTypeRef cf)
{
}

CFTypeID CFStringGetTypeID(void)
{
  return _CFStringGetTypeID();
}

BOOL CGPathContainsPoint(CGPathRef path, const CGAffineTransform *m, CGPoint point, BOOL eoFill)
{
  return _CGPathContainsPoint(path, m, point, eoFill);
}

void CGPathRelease(CGPathRef path)
{
}

CGRect CGRectIntersection(CGRect r1, CGRect r2)
{
  return _CGRectIntersection(r1, r2);
}

uint64_t CPCopySharedResourcesPreferencesDomainForDomain()
{
  return _CPCopySharedResourcesPreferencesDomainForDomain();
}

uint64_t GAXLogAppLaunching()
{
  return _GAXLogAppLaunching();
}

uint64_t GAXLogBlockedTouches()
{
  return _GAXLogBlockedTouches();
}

uint64_t GAXLogCommon()
{
  return _GAXLogCommon();
}

uint64_t GAXLogIntegrity()
{
  return _GAXLogIntegrity();
}

uint64_t MGCopyMultipleAnswers()
{
  return _MGCopyMultipleAnswers();
}

SEL NSSelectorFromString(NSString *aSelectorName)
{
  return _NSSelectorFromString(aSelectorName);
}

NSString *__cdecl NSStringFromClass(Class aClass)
{
  return _NSStringFromClass(aClass);
}

NSString *__cdecl NSStringFromSelector(SEL aSelector)
{
  return _NSStringFromSelector(aSelector);
}

CFTypeRef SecTaskCopyValueForEntitlement(SecTaskRef task, CFStringRef entitlement, CFErrorRef *error)
{
  return _SecTaskCopyValueForEntitlement(task, entitlement, error);
}

SecTaskRef SecTaskCreateWithAuditToken(CFAllocatorRef allocator, audit_token_t *token)
{
  return _SecTaskCreateWithAuditToken(allocator, token);
}

uint64_t _AXAssert()
{
  return __AXAssert();
}

uint64_t _AXLogWithFacility()
{
  return __AXLogWithFacility();
}

uint64_t _AXSAssistiveTouchEnabled()
{
  return __AXSAssistiveTouchEnabled();
}

uint64_t _AXSAssistiveTouchScannerEnabled()
{
  return __AXSAssistiveTouchScannerEnabled();
}

uint64_t _AXSCommandAndControlEnabled()
{
  return __AXSCommandAndControlEnabled();
}

uint64_t _AXSGrayscaleEnabled()
{
  return __AXSGrayscaleEnabled();
}

uint64_t _AXSGuidedAccessEnabled()
{
  return __AXSGuidedAccessEnabled();
}

uint64_t _AXSGuidedAccessEnabledByManagedConfiguration()
{
  return __AXSGuidedAccessEnabledByManagedConfiguration();
}

uint64_t _AXSGuidedAccessRequiresApplicationAccessibility()
{
  return __AXSGuidedAccessRequiresApplicationAccessibility();
}

uint64_t _AXSGuidedAccessSetEnabled()
{
  return __AXSGuidedAccessSetEnabled();
}

uint64_t _AXSGuidedAccessSetEnabledByManagedConfiguration()
{
  return __AXSGuidedAccessSetEnabledByManagedConfiguration();
}

uint64_t _AXSGuidedAccessSetHasPasscode()
{
  return __AXSGuidedAccessSetHasPasscode();
}

uint64_t _AXSHandleTripleClickHomeButtonPress()
{
  return __AXSHandleTripleClickHomeButtonPress();
}

uint64_t _AXSHomeClickSpeed()
{
  return __AXSHomeClickSpeed();
}

uint64_t _AXSInvertColorsEnabled()
{
  return __AXSInvertColorsEnabled();
}

uint64_t _AXSMonoAudioEnabled()
{
  return __AXSMonoAudioEnabled();
}

uint64_t _AXSQuickSpeakEnabled()
{
  return __AXSQuickSpeakEnabled();
}

uint64_t _AXSReduceWhitePointEnabled()
{
  return __AXSReduceWhitePointEnabled();
}

uint64_t _AXSSetTripleClickOptions()
{
  return __AXSSetTripleClickOptions();
}

uint64_t _AXSTripleClickCopyOptions()
{
  return __AXSTripleClickCopyOptions();
}

uint64_t _AXSVoiceOverTouchEnabled()
{
  return __AXSVoiceOverTouchEnabled();
}

uint64_t _AXSZoomTouchEnabled()
{
  return __AXSZoomTouchEnabled();
}

void _Block_object_dispose(const void *a1, const int a2)
{
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
}

uint64_t __UIAccessibilityCastAsClass()
{
  return ___UIAccessibilityCastAsClass();
}

void __assert_rtn(const char *a1, const char *a2, int a3, const char *a4)
{
}

uint64_t __ax_verbose_encode_with_type_encoding_group_class()
{
  return ___ax_verbose_encode_with_type_encoding_group_class();
}

int *__error(void)
{
  return ___error();
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

void abort(void)
{
}

kern_return_t bootstrap_look_up(mach_port_t bp, const name_t service_name, mach_port_t *sp)
{
  return _bootstrap_look_up(bp, service_name, sp);
}

int close(int a1)
{
  return _close(a1);
}

int closedir(DIR *a1)
{
  return _closedir(a1);
}

int dirfd(DIR *dirp)
{
  return _dirfd(dirp);
}

void dispatch_after(dispatch_time_t when, dispatch_queue_t queue, dispatch_block_t block)
{
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
}

dispatch_queue_global_t dispatch_get_global_queue(intptr_t identifier, uintptr_t flags)
{
  return _dispatch_get_global_queue(identifier, flags);
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
}

dispatch_queue_t dispatch_queue_create(const char *label, dispatch_queue_attr_t attr)
{
  return _dispatch_queue_create(label, attr);
}

void dispatch_resume(dispatch_object_t object)
{
}

void dispatch_source_cancel(dispatch_source_t source)
{
}

dispatch_source_t dispatch_source_create(dispatch_source_type_t type, uintptr_t handle, uintptr_t mask, dispatch_queue_t queue)
{
  return _dispatch_source_create(type, handle, mask, queue);
}

void dispatch_source_set_event_handler(dispatch_source_t source, dispatch_block_t handler)
{
}

void dispatch_sync(dispatch_queue_t queue, dispatch_block_t block)
{
}

dispatch_time_t dispatch_time(dispatch_time_t when, int64_t delta)
{
  return _dispatch_time(when, delta);
}

int fcntl(int a1, int a2, ...)
{
  return _fcntl(a1, a2);
}

int kill(pid_t a1, int a2)
{
  return _kill(a1, a2);
}

id objc_alloc(Class a1)
{
  return _[a1 alloc];
}

uint64_t objc_alloc_init()
{
  return _objc_alloc_init();
}

id objc_autorelease(id a1)
{
  return _objc_autorelease(a1);
}

id objc_autoreleaseReturnValue(id a1)
{
  return _objc_autoreleaseReturnValue(a1);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return _objc_claimAutoreleasedReturnValue();
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

id objc_initWeak(id *location, id val)
{
  return _objc_initWeak(location, val);
}

id objc_loadWeakRetained(id *location)
{
  return _objc_loadWeakRetained(location);
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return _objc_msgSendSuper2(a1, a2);
}

uint64_t objc_opt_class()
{
  return _objc_opt_class();
}

uint64_t objc_opt_isKindOfClass()
{
  return _objc_opt_isKindOfClass();
}

uint64_t objc_opt_new()
{
  return _objc_opt_new();
}

void objc_release(id a1)
{
}

id objc_retain(id a1)
{
  return _objc_retain(a1);
}

id objc_retainAutorelease(id a1)
{
  return _a1;
}

id objc_retainAutoreleaseReturnValue(id a1)
{
  return _a1;
}

id objc_retainBlock(id a1)
{
  return _objc_retainBlock(a1);
}

void objc_setProperty_nonatomic_copy(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
}

void objc_storeStrong(id *location, id obj)
{
}

id objc_storeWeak(id *location, id obj)
{
  return _objc_storeWeak(location, obj);
}

int open(const char *a1, int a2, ...)
{
  return _open(a1, a2);
}

DIR *__cdecl opendir(const char *a1)
{
  return _opendir(a1);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return _os_log_type_enabled(oslog, type);
}

void os_unfair_lock_lock(os_unfair_lock_t lock)
{
}

void os_unfair_lock_unlock(os_unfair_lock_t lock)
{
}

uint64_t pid_resume()
{
  return _pid_resume();
}

uint64_t pid_suspend()
{
  return _pid_suspend();
}

char *__cdecl strerror(int __errnum)
{
  return _strerror(__errnum);
}

ssize_t write(int __fd, const void *__buf, size_t __nbyte)
{
  return _write(__fd, __buf, __nbyte);
}

id objc_msgSend_ECID(void *a1, const char *a2, ...)
{
  return [a1 ECID];
}

id objc_msgSend__SBServerQueryForAvailabilitySBParameters(void *a1, const char *a2, ...)
{
  return [a1 _SBServerQueryForAvailabilitySBParameters];
}

id objc_msgSend__accessIgnoredTouchRegions(void *a1, const char *a2, ...)
{
  return [a1 _accessIgnoredTouchRegions];
}

id objc_msgSend__accessibilityTripleClickOptions(void *a1, const char *a2, ...)
{
  return [a1 _accessibilityTripleClickOptions];
}

id objc_msgSend__applyAllowedStatesForRestrictions(void *a1, const char *a2, ...)
{
  return [a1 _applyAllowedStatesForRestrictions];
}

id objc_msgSend__applyChangedStatesForRestrictions(void *a1, const char *a2, ...)
{
  return [a1 _applyChangedStatesForRestrictions];
}

id objc_msgSend__applyDeniedStatesForRestrictions(void *a1, const char *a2, ...)
{
  return [a1 _applyDeniedStatesForRestrictions];
}

id objc_msgSend__axSpringBoardServerInstance(void *a1, const char *a2, ...)
{
  return [a1 _axSpringBoardServerInstance];
}

id objc_msgSend__beginProcessingEventsIfNeeded(void *a1, const char *a2, ...)
{
  return [a1 _beginProcessingEventsIfNeeded];
}

id objc_msgSend__clearChangedStatesForRestrictions(void *a1, const char *a2, ...)
{
  return [a1 _clearChangedStatesForRestrictions];
}

id objc_msgSend__clearSavedActiveAppIDAfterRelaunchIfNeeeded(void *a1, const char *a2, ...)
{
  return [a1 _clearSavedActiveAppIDAfterRelaunchIfNeeeded];
}

id objc_msgSend__clearSavedTimeRestrictionsSettingsAfterRelaunchIfNeeded(void *a1, const char *a2, ...)
{
  return [a1 _clearSavedTimeRestrictionsSettingsAfterRelaunchIfNeeded];
}

id objc_msgSend__currentFeatureSet(void *a1, const char *a2, ...)
{
  return [a1 _currentFeatureSet];
}

id objc_msgSend__didFinishTransitioningFromWorkspaceToApplication(void *a1, const char *a2, ...)
{
  return [a1 _didFinishTransitioningFromWorkspaceToApplication];
}

id objc_msgSend__didFinishTransitioningFromWorkspaceToSession(void *a1, const char *a2, ...)
{
  return [a1 _didFinishTransitioningFromWorkspaceToSession];
}

id objc_msgSend__effectiveApp(void *a1, const char *a2, ...)
{
  return [a1 _effectiveApp];
}

id objc_msgSend__gaxShouldRemainEnabledByManagedConfiguration(void *a1, const char *a2, ...)
{
  return [a1 _gaxShouldRemainEnabledByManagedConfiguration];
}

id objc_msgSend__handleInCheckerBoardScenarioUpdated(void *a1, const char *a2, ...)
{
  return [a1 _handleInCheckerBoardScenarioUpdated];
}

id objc_msgSend__handleInPreBoardScenarioUpdated(void *a1, const char *a2, ...)
{
  return [a1 _handleInPreBoardScenarioUpdated];
}

id objc_msgSend__handleUpdateGAXClientState(void *a1, const char *a2, ...)
{
  return [a1 _handleUpdateGAXClientState];
}

id objc_msgSend__hasPasscode(void *a1, const char *a2, ...)
{
  return [a1 _hasPasscode];
}

id objc_msgSend__hasSavedUserPreferredFeatures(void *a1, const char *a2, ...)
{
  return [a1 _hasSavedUserPreferredFeatures];
}

id objc_msgSend__hasSystemPasscode(void *a1, const char *a2, ...)
{
  return [a1 _hasSystemPasscode];
}

id objc_msgSend__hasTimeRestrictionExpired(void *a1, const char *a2, ...)
{
  return [a1 _hasTimeRestrictionExpired];
}

id objc_msgSend__hasValidPID(void *a1, const char *a2, ...)
{
  return [a1 _hasValidPID];
}

id objc_msgSend__initializeProfileKeyToRetrieveSelectorMap(void *a1, const char *a2, ...)
{
  return [a1 _initializeProfileKeyToRetrieveSelectorMap];
}

id objc_msgSend__initializeProfileKeys(void *a1, const char *a2, ...)
{
  return [a1 _initializeProfileKeys];
}

id objc_msgSend__isAllowingAllTouchByOverride(void *a1, const char *a2, ...)
{
  return [a1 _isAllowingAllTouchByOverride];
}

id objc_msgSend__isIgnoringAllTouchByOverride(void *a1, const char *a2, ...)
{
  return [a1 _isIgnoringAllTouchByOverride];
}

id objc_msgSend__isPasscodeStale(void *a1, const char *a2, ...)
{
  return [a1 _isPasscodeStale];
}

id objc_msgSend__isRunningInStoreDemoMode(void *a1, const char *a2, ...)
{
  return [a1 _isRunningInStoreDemoMode];
}

id objc_msgSend__loadSettings(void *a1, const char *a2, ...)
{
  return [a1 _loadSettings];
}

id objc_msgSend__loadUserPreferredSet(void *a1, const char *a2, ...)
{
  return [a1 _loadUserPreferredSet];
}

id objc_msgSend__notifyOfGAXBackboardStateChange(void *a1, const char *a2, ...)
{
  return [a1 _notifyOfGAXBackboardStateChange];
}

id objc_msgSend__passcode(void *a1, const char *a2, ...)
{
  return [a1 _passcode];
}

id objc_msgSend__processNextEventInQueue(void *a1, const char *a2, ...)
{
  return [a1 _processNextEventInQueue];
}

id objc_msgSend__processNextUpdateBlockInQueue(void *a1, const char *a2, ...)
{
  return [a1 _processNextUpdateBlockInQueue];
}

id objc_msgSend__remainingLockoutDuration(void *a1, const char *a2, ...)
{
  return [a1 _remainingLockoutDuration];
}

id objc_msgSend__removeUnmanagedSelfLockRestrictions(void *a1, const char *a2, ...)
{
  return [a1 _removeUnmanagedSelfLockRestrictions];
}

id objc_msgSend__resetOverrideTouchReasons(void *a1, const char *a2, ...)
{
  return [a1 _resetOverrideTouchReasons];
}

id objc_msgSend__saveCurrentAXFeaturesAsUserPreferredSetIfNecessary(void *a1, const char *a2, ...)
{
  return [a1 _saveCurrentAXFeaturesAsUserPreferredSetIfNecessary];
}

id objc_msgSend__saveCurrentFeatureSetAsUserPreferredSet(void *a1, const char *a2, ...)
{
  return [a1 _saveCurrentFeatureSetAsUserPreferredSet];
}

id objc_msgSend__sessionApps(void *a1, const char *a2, ...)
{
  return [a1 _sessionApps];
}

id objc_msgSend__sessionAppsContainMobilePhoneOrFacetime(void *a1, const char *a2, ...)
{
  return [a1 _sessionAppsContainMobilePhoneOrFacetime];
}

id objc_msgSend__setupGAXClientConnection(void *a1, const char *a2, ...)
{
  return [a1 _setupGAXClientConnection];
}

id objc_msgSend__shouldAllowDirectInactiveToActiveTransition(void *a1, const char *a2, ...)
{
  return [a1 _shouldAllowDirectInactiveToActiveTransition];
}

id objc_msgSend__shouldDispatchLocally(void *a1, const char *a2, ...)
{
  return [a1 _shouldDispatchLocally];
}

id objc_msgSend__showUnmanagedASAMBeganBanner(void *a1, const char *a2, ...)
{
  return [a1 _showUnmanagedASAMBeganBanner];
}

id objc_msgSend__showUnmanagedASAMTimedOutBanner(void *a1, const char *a2, ...)
{
  return [a1 _showUnmanagedASAMTimedOutBanner];
}

id objc_msgSend__singleAppModeAppIDs(void *a1, const char *a2, ...)
{
  return [a1 _singleAppModeAppIDs];
}

id objc_msgSend__updateSessionAppForSingleAppMode(void *a1, const char *a2, ...)
{
  return [a1 _updateSessionAppForSingleAppMode];
}

id objc_msgSend__updateSingleAppModeStateFromManagedConfiguration(void *a1, const char *a2, ...)
{
  return [a1 _updateSingleAppModeStateFromManagedConfiguration];
}

id objc_msgSend__verificationWillPauseForSpringBoardRelaunch(void *a1, const char *a2, ...)
{
  return [a1 _verificationWillPauseForSpringBoardRelaunch];
}

id objc_msgSend__windowsToHost(void *a1, const char *a2, ...)
{
  return [a1 _windowsToHost];
}

id objc_msgSend_activeAppID(void *a1, const char *a2, ...)
{
  return [a1 activeAppID];
}

id objc_msgSend_activeAppOrientation(void *a1, const char *a2, ...)
{
  return [a1 activeAppOrientation];
}

id objc_msgSend_activeInterfaceOrientation(void *a1, const char *a2, ...)
{
  return [a1 activeInterfaceOrientation];
}

id objc_msgSend_allKeys(void *a1, const char *a2, ...)
{
  return [a1 allKeys];
}

id objc_msgSend_allowsMotion(void *a1, const char *a2, ...)
{
  return [a1 allowsMotion];
}

id objc_msgSend_allowsTripleClickSheet(void *a1, const char *a2, ...)
{
  return [a1 allowsTripleClickSheet];
}

id objc_msgSend_appClient(void *a1, const char *a2, ...)
{
  return [a1 appClient];
}

id objc_msgSend_appLaunchFailureDetectionTimer(void *a1, const char *a2, ...)
{
  return [a1 appLaunchFailureDetectionTimer];
}

id objc_msgSend_appLaunchGeneration(void *a1, const char *a2, ...)
{
  return [a1 appLaunchGeneration];
}

id objc_msgSend_appLayoutIsMultiApp(void *a1, const char *a2, ...)
{
  return [a1 appLayoutIsMultiApp];
}

id objc_msgSend_appLayoutMonitor(void *a1, const char *a2, ...)
{
  return [a1 appLayoutMonitor];
}

id objc_msgSend_appManager(void *a1, const char *a2, ...)
{
  return [a1 appManager];
}

id objc_msgSend_appTimeoutDuration(void *a1, const char *a2, ...)
{
  return [a1 appTimeoutDuration];
}

id objc_msgSend_archivedSessionApplicationIcon(void *a1, const char *a2, ...)
{
  return [a1 archivedSessionApplicationIcon];
}

id objc_msgSend_array(void *a1, const char *a2, ...)
{
  return [a1 array];
}

id objc_msgSend_autonomousSingleAppModePermittedBundleIDs(void *a1, const char *a2, ...)
{
  return [a1 autonomousSingleAppModePermittedBundleIDs];
}

id objc_msgSend_axFeatureManager(void *a1, const char *a2, ...)
{
  return [a1 axFeatureManager];
}

id objc_msgSend_backboardDelegate(void *a1, const char *a2, ...)
{
  return [a1 backboardDelegate];
}

id objc_msgSend_backboardServer(void *a1, const char *a2, ...)
{
  return [a1 backboardServer];
}

id objc_msgSend_beginBlockingHID(void *a1, const char *a2, ...)
{
  return [a1 beginBlockingHID];
}

id objc_msgSend_BOOLValue(void *a1, const char *a2, ...)
{
  return [a1 BOOLValue];
}

id objc_msgSend_bounds(void *a1, const char *a2, ...)
{
  return [a1 bounds];
}

id objc_msgSend_bundleIdentifier(void *a1, const char *a2, ...)
{
  return [a1 bundleIdentifier];
}

id objc_msgSend_bytes(void *a1, const char *a2, ...)
{
  return [a1 bytes];
}

id objc_msgSend_callStackSymbols(void *a1, const char *a2, ...)
{
  return [a1 callStackSymbols];
}

id objc_msgSend_cancel(void *a1, const char *a2, ...)
{
  return [a1 cancel];
}

id objc_msgSend_cancelCurrentTouches(void *a1, const char *a2, ...)
{
  return [a1 cancelCurrentTouches];
}

id objc_msgSend_checkerBoardDidFinishObserverToken(void *a1, const char *a2, ...)
{
  return [a1 checkerBoardDidFinishObserverToken];
}

id objc_msgSend_checkingASAMValidity(void *a1, const char *a2, ...)
{
  return [a1 checkingASAMValidity];
}

id objc_msgSend_cleanup(void *a1, const char *a2, ...)
{
  return [a1 cleanup];
}

id objc_msgSend_clearUnappliedChangedStatesForRestrictions(void *a1, const char *a2, ...)
{
  return [a1 clearUnappliedChangedStatesForRestrictions];
}

id objc_msgSend_clientPort(void *a1, const char *a2, ...)
{
  return [a1 clientPort];
}

id objc_msgSend_clientPortsToBundleIds(void *a1, const char *a2, ...)
{
  return [a1 clientPortsToBundleIds];
}

id objc_msgSend_command(void *a1, const char *a2, ...)
{
  return [a1 command];
}

id objc_msgSend_completion(void *a1, const char *a2, ...)
{
  return [a1 completion];
}

id objc_msgSend_configuration(void *a1, const char *a2, ...)
{
  return [a1 configuration];
}

id objc_msgSend_configurationForDefaultMainDisplayMonitor(void *a1, const char *a2, ...)
{
  return [a1 configurationForDefaultMainDisplayMonitor];
}

id objc_msgSend_copy(void *a1, const char *a2, ...)
{
  return [a1 copy];
}

id objc_msgSend_count(void *a1, const char *a2, ...)
{
  return [a1 count];
}

id objc_msgSend_currentLayout(void *a1, const char *a2, ...)
{
  return [a1 currentLayout];
}

id objc_msgSend_currentVerificationEvent(void *a1, const char *a2, ...)
{
  return [a1 currentVerificationEvent];
}

id objc_msgSend_data(void *a1, const char *a2, ...)
{
  return [a1 data];
}

id objc_msgSend_date(void *a1, const char *a2, ...)
{
  return [a1 date];
}

id objc_msgSend_defaultCenter(void *a1, const char *a2, ...)
{
  return [a1 defaultCenter];
}

id objc_msgSend_defaultManager(void *a1, const char *a2, ...)
{
  return [a1 defaultManager];
}

id objc_msgSend_defaultWorkspace(void *a1, const char *a2, ...)
{
  return [a1 defaultWorkspace];
}

id objc_msgSend_delay(void *a1, const char *a2, ...)
{
  return [a1 delay];
}

id objc_msgSend_delegate(void *a1, const char *a2, ...)
{
  return [a1 delegate];
}

id objc_msgSend_description(void *a1, const char *a2, ...)
{
  return [a1 description];
}

id objc_msgSend_desiredModeAfterSuccessfulPasscodeEntry(void *a1, const char *a2, ...)
{
  return [a1 desiredModeAfterSuccessfulPasscodeEntry];
}

id objc_msgSend_dictionary(void *a1, const char *a2, ...)
{
  return [a1 dictionary];
}

id objc_msgSend_didEnableSystemAppAccess(void *a1, const char *a2, ...)
{
  return [a1 didEnableSystemAppAccess];
}

id objc_msgSend_disableSystemGesturesForActiveAssertion(void *a1, const char *a2, ...)
{
  return [a1 disableSystemGesturesForActiveAssertion];
}

id objc_msgSend_dismissAppSwitcher(void *a1, const char *a2, ...)
{
  return [a1 dismissAppSwitcher];
}

id objc_msgSend_displays(void *a1, const char *a2, ...)
{
  return [a1 displays];
}

id objc_msgSend_effectiveASAMStyle(void *a1, const char *a2, ...)
{
  return [a1 effectiveASAMStyle];
}

id objc_msgSend_effectiveAppBundleIdentifier(void *a1, const char *a2, ...)
{
  return [a1 effectiveAppBundleIdentifier];
}

id objc_msgSend_effectiveAppIsAcceptableForSessionApps(void *a1, const char *a2, ...)
{
  return [a1 effectiveAppIsAcceptableForSessionApps];
}

id objc_msgSend_effectiveAppIsCoreAuthUI(void *a1, const char *a2, ...)
{
  return [a1 effectiveAppIsCoreAuthUI];
}

id objc_msgSend_effectiveAppIsHostedByTheSystemApp(void *a1, const char *a2, ...)
{
  return [a1 effectiveAppIsHostedByTheSystemApp];
}

id objc_msgSend_effectiveAppIsPreferences(void *a1, const char *a2, ...)
{
  return [a1 effectiveAppIsPreferences];
}

id objc_msgSend_effectiveAppIsPurpleBuddy(void *a1, const char *a2, ...)
{
  return [a1 effectiveAppIsPurpleBuddy];
}

id objc_msgSend_effectiveAppRestrictionIdentifiers(void *a1, const char *a2, ...)
{
  return [a1 effectiveAppRestrictionIdentifiers];
}

id objc_msgSend_effectiveAppWasPlayingMedia(void *a1, const char *a2, ...)
{
  return [a1 effectiveAppWasPlayingMedia];
}

id objc_msgSend_effectiveWhitelistedAppsAndOptions(void *a1, const char *a2, ...)
{
  return [a1 effectiveWhitelistedAppsAndOptions];
}

id objc_msgSend_elements(void *a1, const char *a2, ...)
{
  return [a1 elements];
}

id objc_msgSend_endBlockingHID(void *a1, const char *a2, ...)
{
  return [a1 endBlockingHID];
}

id objc_msgSend_errorMessage(void *a1, const char *a2, ...)
{
  return [a1 errorMessage];
}

id objc_msgSend_event(void *a1, const char *a2, ...)
{
  return [a1 event];
}

id objc_msgSend_eventName(void *a1, const char *a2, ...)
{
  return [a1 eventName];
}

id objc_msgSend_eventProcessor(void *a1, const char *a2, ...)
{
  return [a1 eventProcessor];
}

id objc_msgSend_expectedSessionAppIdentifier(void *a1, const char *a2, ...)
{
  return [a1 expectedSessionAppIdentifier];
}

id objc_msgSend_fastStorage(void *a1, const char *a2, ...)
{
  return [a1 fastStorage];
}

id objc_msgSend_fileSystemRepresentation(void *a1, const char *a2, ...)
{
  return [a1 fileSystemRepresentation];
}

id objc_msgSend_firstObject(void *a1, const char *a2, ...)
{
  return [a1 firstObject];
}

id objc_msgSend_focusedApps(void *a1, const char *a2, ...)
{
  return [a1 focusedApps];
}

id objc_msgSend_gaxDisconnectAllCalls(void *a1, const char *a2, ...)
{
  return [a1 gaxDisconnectAllCalls];
}

id objc_msgSend_gaxEndRequiringWallpaper(void *a1, const char *a2, ...)
{
  return [a1 gaxEndRequiringWallpaper];
}

id objc_msgSend_gaxInternalSettingsActiveAppOrientation(void *a1, const char *a2, ...)
{
  return [a1 gaxInternalSettingsActiveAppOrientation];
}

id objc_msgSend_gaxInternalSettingsECID(void *a1, const char *a2, ...)
{
  return [a1 gaxInternalSettingsECID];
}

id objc_msgSend_gaxInternalSettingsLastActivationDate(void *a1, const char *a2, ...)
{
  return [a1 gaxInternalSettingsLastActivationDate];
}

id objc_msgSend_gaxInternalSettingsLastPasscodeSetDate(void *a1, const char *a2, ...)
{
  return [a1 gaxInternalSettingsLastPasscodeSetDate];
}

id objc_msgSend_gaxInternalSettingsProductBuildVersion(void *a1, const char *a2, ...)
{
  return [a1 gaxInternalSettingsProductBuildVersion];
}

id objc_msgSend_gaxInternalSettingsSavedAccessibilityFeatures(void *a1, const char *a2, ...)
{
  return [a1 gaxInternalSettingsSavedAccessibilityFeatures];
}

id objc_msgSend_gaxInternalSettingsSavedAccessibilityTripleClickOptions(void *a1, const char *a2, ...)
{
  return [a1 gaxInternalSettingsSavedAccessibilityTripleClickOptions];
}

id objc_msgSend_gaxInternalSettingsSystemDidRestartDueToLowBattery(void *a1, const char *a2, ...)
{
  return [a1 gaxInternalSettingsSystemDidRestartDueToLowBattery];
}

id objc_msgSend_gaxInternalSettingsTimeRestrictionHasExpired(void *a1, const char *a2, ...)
{
  return [a1 gaxInternalSettingsTimeRestrictionHasExpired];
}

id objc_msgSend_gaxInternalSettingsUserAppProfile(void *a1, const char *a2, ...)
{
  return [a1 gaxInternalSettingsUserAppProfile];
}

id objc_msgSend_gaxInternalSettingsUserConfiguredAppIDs(void *a1, const char *a2, ...)
{
  return [a1 gaxInternalSettingsUserConfiguredAppIDs];
}

id objc_msgSend_gaxInternalSettingsUserGlobalProfile(void *a1, const char *a2, ...)
{
  return [a1 gaxInternalSettingsUserGlobalProfile];
}

id objc_msgSend_gaxIsSystemAppShowingTransientOverlay(void *a1, const char *a2, ...)
{
  return [a1 gaxIsSystemAppShowingTransientOverlay];
}

id objc_msgSend_gaxPreventPotentialAppLaunches(void *a1, const char *a2, ...)
{
  return [a1 gaxPreventPotentialAppLaunches];
}

id objc_msgSend_gaxServerIsReady(void *a1, const char *a2, ...)
{
  return [a1 gaxServerIsReady];
}

id objc_msgSend_gaxState(void *a1, const char *a2, ...)
{
  return [a1 gaxState];
}

id objc_msgSend_gaxTimeRestrictionStatusDidChange(void *a1, const char *a2, ...)
{
  return [a1 gaxTimeRestrictionStatusDidChange];
}

id objc_msgSend_gaxUnlockDevice(void *a1, const char *a2, ...)
{
  return [a1 gaxUnlockDevice];
}

id objc_msgSend_globalProfileKeys(void *a1, const char *a2, ...)
{
  return [a1 globalProfileKeys];
}

id objc_msgSend_guidedAccessAXFeaturesEnabled(void *a1, const char *a2, ...)
{
  return [a1 guidedAccessAXFeaturesEnabled];
}

id objc_msgSend_guidedAccessAllowsMultipleWindows(void *a1, const char *a2, ...)
{
  return [a1 guidedAccessAllowsMultipleWindows];
}

id objc_msgSend_guidedAccessAllowsUnlockWithTouchID(void *a1, const char *a2, ...)
{
  return [a1 guidedAccessAllowsUnlockWithTouchID];
}

id objc_msgSend_guidedAccessDisallowDirectInactiveToActiveTransition(void *a1, const char *a2, ...)
{
  return [a1 guidedAccessDisallowDirectInactiveToActiveTransition];
}

id objc_msgSend_guidedAccessTimeLimitsUsageCount(void *a1, const char *a2, ...)
{
  return [a1 guidedAccessTimeLimitsUsageCount];
}

id objc_msgSend_guidedAccessUsageCount(void *a1, const char *a2, ...)
{
  return [a1 guidedAccessUsageCount];
}

id objc_msgSend_handInfo(void *a1, const char *a2, ...)
{
  return [a1 handInfo];
}

id objc_msgSend_handleDeath(void *a1, const char *a2, ...)
{
  return [a1 handleDeath];
}

id objc_msgSend_hasAccessibilityTripleClickOptions(void *a1, const char *a2, ...)
{
  return [a1 hasAccessibilityTripleClickOptions];
}

id objc_msgSend_hideNotificationCenter(void *a1, const char *a2, ...)
{
  return [a1 hideNotificationCenter];
}

id objc_msgSend_iTunesMetadata(void *a1, const char *a2, ...)
{
  return [a1 iTunesMetadata];
}

id objc_msgSend_identifier(void *a1, const char *a2, ...)
{
  return [a1 identifier];
}

id objc_msgSend_ignoredTouchRegions(void *a1, const char *a2, ...)
{
  return [a1 ignoredTouchRegions];
}

id objc_msgSend_installType(void *a1, const char *a2, ...)
{
  return [a1 installType];
}

id objc_msgSend_intValue(void *a1, const char *a2, ...)
{
  return [a1 intValue];
}

id objc_msgSend_integerValue(void *a1, const char *a2, ...)
{
  return [a1 integerValue];
}

id objc_msgSend_integrityVerifier(void *a1, const char *a2, ...)
{
  return [a1 integrityVerifier];
}

id objc_msgSend_invalidate(void *a1, const char *a2, ...)
{
  return [a1 invalidate];
}

id objc_msgSend_isActive(void *a1, const char *a2, ...)
{
  return [a1 isActive];
}

id objc_msgSend_isActiveAppSelfLocked(void *a1, const char *a2, ...)
{
  return [a1 isActiveAppSelfLocked];
}

id objc_msgSend_isAppSelfLockMode(void *a1, const char *a2, ...)
{
  return [a1 isAppSelfLockMode];
}

id objc_msgSend_isApplicationBeingInstalled(void *a1, const char *a2, ...)
{
  return [a1 isApplicationBeingInstalled];
}

id objc_msgSend_isCoreAuthUI(void *a1, const char *a2, ...)
{
  return [a1 isCoreAuthUI];
}

id objc_msgSend_isGAXClientLoaded(void *a1, const char *a2, ...)
{
  return [a1 isGAXClientLoaded];
}

id objc_msgSend_isHostedByTheSystemApp(void *a1, const char *a2, ...)
{
  return [a1 isHostedByTheSystemApp];
}

id objc_msgSend_isInSingleAppMode(void *a1, const char *a2, ...)
{
  return [a1 isInSingleAppMode];
}

id objc_msgSend_isInWorkspace(void *a1, const char *a2, ...)
{
  return [a1 isInWorkspace];
}

id objc_msgSend_isLayoutFullscreenModal(void *a1, const char *a2, ...)
{
  return [a1 isLayoutFullscreenModal];
}

id objc_msgSend_isLayoutPrimary(void *a1, const char *a2, ...)
{
  return [a1 isLayoutPrimary];
}

id objc_msgSend_isLocked(void *a1, const char *a2, ...)
{
  return [a1 isLocked];
}

id objc_msgSend_isLostModeActive(void *a1, const char *a2, ...)
{
  return [a1 isLostModeActive];
}

id objc_msgSend_isPaused(void *a1, const char *a2, ...)
{
  return [a1 isPaused];
}

id objc_msgSend_isPreferences(void *a1, const char *a2, ...)
{
  return [a1 isPreferences];
}

id objc_msgSend_isPurpleBuddy(void *a1, const char *a2, ...)
{
  return [a1 isPurpleBuddy];
}

id objc_msgSend_isRestoring(void *a1, const char *a2, ...)
{
  return [a1 isRestoring];
}

id objc_msgSend_isSingleAppMode(void *a1, const char *a2, ...)
{
  return [a1 isSingleAppMode];
}

id objc_msgSend_isUIApplicationElement(void *a1, const char *a2, ...)
{
  return [a1 isUIApplicationElement];
}

id objc_msgSend_isUnmanagedSelfLocked(void *a1, const char *a2, ...)
{
  return [a1 isUnmanagedSelfLocked];
}

id objc_msgSend_isUserMode(void *a1, const char *a2, ...)
{
  return [a1 isUserMode];
}

id objc_msgSend_isVerifyingIntegrity(void *a1, const char *a2, ...)
{
  return [a1 isVerifyingIntegrity];
}

id objc_msgSend_isWebTextDefineAllowed(void *a1, const char *a2, ...)
{
  return [a1 isWebTextDefineAllowed];
}

id objc_msgSend_itemName(void *a1, const char *a2, ...)
{
  return [a1 itemName];
}

id objc_msgSend_keyCode(void *a1, const char *a2, ...)
{
  return [a1 keyCode];
}

id objc_msgSend_keyInfo(void *a1, const char *a2, ...)
{
  return [a1 keyInfo];
}

id objc_msgSend_lastActivationDate(void *a1, const char *a2, ...)
{
  return [a1 lastActivationDate];
}

id objc_msgSend_lastAlertDisplayedTimeInterval(void *a1, const char *a2, ...)
{
  return [a1 lastAlertDisplayedTimeInterval];
}

id objc_msgSend_lastLockoutStartedTimeInterval(void *a1, const char *a2, ...)
{
  return [a1 lastLockoutStartedTimeInterval];
}

id objc_msgSend_lastPasscodeSetDate(void *a1, const char *a2, ...)
{
  return [a1 lastPasscodeSetDate];
}

id objc_msgSend_layoutRole(void *a1, const char *a2, ...)
{
  return [a1 layoutRole];
}

id objc_msgSend_length(void *a1, const char *a2, ...)
{
  return [a1 length];
}

id objc_msgSend_lostModeIsActive(void *a1, const char *a2, ...)
{
  return [a1 lostModeIsActive];
}

id objc_msgSend_mainAccessQueue(void *a1, const char *a2, ...)
{
  return [a1 mainAccessQueue];
}

id objc_msgSend_mainDisplay(void *a1, const char *a2, ...)
{
  return [a1 mainDisplay];
}

id objc_msgSend_mainQueue(void *a1, const char *a2, ...)
{
  return [a1 mainQueue];
}

id objc_msgSend_managedApps(void *a1, const char *a2, ...)
{
  return [a1 managedApps];
}

id objc_msgSend_managedConfigurationNotificationCoalesceTimer(void *a1, const char *a2, ...)
{
  return [a1 managedConfigurationNotificationCoalesceTimer];
}

id objc_msgSend_modeHistory(void *a1, const char *a2, ...)
{
  return [a1 modeHistory];
}

id objc_msgSend_monitorForPurpleBuddyDeath(void *a1, const char *a2, ...)
{
  return [a1 monitorForPurpleBuddyDeath];
}

id objc_msgSend_monitorForTouchID(void *a1, const char *a2, ...)
{
  return [a1 monitorForTouchID];
}

id objc_msgSend_mostRecentOutcome(void *a1, const char *a2, ...)
{
  return [a1 mostRecentOutcome];
}

id objc_msgSend_mutableCopy(void *a1, const char *a2, ...)
{
  return [a1 mutableCopy];
}

id objc_msgSend_mutableUserAppProfile(void *a1, const char *a2, ...)
{
  return [a1 mutableUserAppProfile];
}

id objc_msgSend_mutableUserGlobalProfile(void *a1, const char *a2, ...)
{
  return [a1 mutableUserGlobalProfile];
}

id objc_msgSend_notifySelfLockStateDidChange(void *a1, const char *a2, ...)
{
  return [a1 notifySelfLockStateDidChange];
}

id objc_msgSend_null(void *a1, const char *a2, ...)
{
  return [a1 null];
}

id objc_msgSend_object(void *a1, const char *a2, ...)
{
  return [a1 object];
}

id objc_msgSend_parameters(void *a1, const char *a2, ...)
{
  return [a1 parameters];
}

id objc_msgSend_passcode(void *a1, const char *a2, ...)
{
  return [a1 passcode];
}

id objc_msgSend_passcodeEntryFailedCount(void *a1, const char *a2, ...)
{
  return [a1 passcodeEntryFailedCount];
}

id objc_msgSend_passcodeHandle(void *a1, const char *a2, ...)
{
  return [a1 passcodeHandle];
}

id objc_msgSend_pathLocation(void *a1, const char *a2, ...)
{
  return [a1 pathLocation];
}

id objc_msgSend_pathWindowContextID(void *a1, const char *a2, ...)
{
  return [a1 pathWindowContextID];
}

id objc_msgSend_paths(void *a1, const char *a2, ...)
{
  return [a1 paths];
}

id objc_msgSend_pause(void *a1, const char *a2, ...)
{
  return [a1 pause];
}

id objc_msgSend_payload(void *a1, const char *a2, ...)
{
  return [a1 payload];
}

id objc_msgSend_pid(void *a1, const char *a2, ...)
{
  return [a1 pid];
}

id objc_msgSend_preBoardDidFinishObserverToken(void *a1, const char *a2, ...)
{
  return [a1 preBoardDidFinishObserverToken];
}

id objc_msgSend_presentStandardActiveTopBanner(void *a1, const char *a2, ...)
{
  return [a1 presentStandardActiveTopBanner];
}

id objc_msgSend_productBuildVersion(void *a1, const char *a2, ...)
{
  return [a1 productBuildVersion];
}

id objc_msgSend_profileAccessibilityFeatureSet(void *a1, const char *a2, ...)
{
  return [a1 profileAccessibilityFeatureSet];
}

id objc_msgSend_profileKeyToRetrieveSelectorMap(void *a1, const char *a2, ...)
{
  return [a1 profileKeyToRetrieveSelectorMap];
}

id objc_msgSend_profileManager(void *a1, const char *a2, ...)
{
  return [a1 profileManager];
}

id objc_msgSend_purpleBuddyPIDMonitor(void *a1, const char *a2, ...)
{
  return [a1 purpleBuddyPIDMonitor];
}

id objc_msgSend_raiseHIDEventTapPriorityToMaximum(void *a1, const char *a2, ...)
{
  return [a1 raiseHIDEventTapPriorityToMaximum];
}

id objc_msgSend_raiseSystemEventTapPriorityToMaximum(void *a1, const char *a2, ...)
{
  return [a1 raiseSystemEventTapPriorityToMaximum];
}

id objc_msgSend_rectValue(void *a1, const char *a2, ...)
{
  return [a1 rectValue];
}

id objc_msgSend_relaunchAttempts(void *a1, const char *a2, ...)
{
  return [a1 relaunchAttempts];
}

id objc_msgSend_remainingTimeInSeconds(void *a1, const char *a2, ...)
{
  return [a1 remainingTimeInSeconds];
}

id objc_msgSend_removeLastObject(void *a1, const char *a2, ...)
{
  return [a1 removeLastObject];
}

id objc_msgSend_replayer(void *a1, const char *a2, ...)
{
  return [a1 replayer];
}

id objc_msgSend_resetRelaunchAttempts(void *a1, const char *a2, ...)
{
  return [a1 resetRelaunchAttempts];
}

id objc_msgSend_resetRelaunchAttemptsTimer(void *a1, const char *a2, ...)
{
  return [a1 resetRelaunchAttemptsTimer];
}

id objc_msgSend_restoreAccessibilityFeatures(void *a1, const char *a2, ...)
{
  return [a1 restoreAccessibilityFeatures];
}

id objc_msgSend_restoreHIDEventTapPriorityToDefault(void *a1, const char *a2, ...)
{
  return [a1 restoreHIDEventTapPriorityToDefault];
}

id objc_msgSend_restoreSystemEventTapPriorityToDefault(void *a1, const char *a2, ...)
{
  return [a1 restoreSystemEventTapPriorityToDefault];
}

id objc_msgSend_restrictionIdentifiers(void *a1, const char *a2, ...)
{
  return [a1 restrictionIdentifiers];
}

id objc_msgSend_result(void *a1, const char *a2, ...)
{
  return [a1 result];
}

id objc_msgSend_resume(void *a1, const char *a2, ...)
{
  return [a1 resume];
}

id objc_msgSend_resumeEffectiveApp(void *a1, const char *a2, ...)
{
  return [a1 resumeEffectiveApp];
}

id objc_msgSend_savedASAMAppIdForLostMode(void *a1, const char *a2, ...)
{
  return [a1 savedASAMAppIdForLostMode];
}

id objc_msgSend_savedAccessibilityFeatures(void *a1, const char *a2, ...)
{
  return [a1 savedAccessibilityFeatures];
}

id objc_msgSend_savedAccessibilityTripleClickOptions(void *a1, const char *a2, ...)
{
  return [a1 savedAccessibilityTripleClickOptions];
}

id objc_msgSend_scheduleResetLaunchAttempts(void *a1, const char *a2, ...)
{
  return [a1 scheduleResetLaunchAttempts];
}

id objc_msgSend_scheme(void *a1, const char *a2, ...)
{
  return [a1 scheme];
}

id objc_msgSend_selfLockAppIDs(void *a1, const char *a2, ...)
{
  return [a1 selfLockAppIDs];
}

id objc_msgSend_selfLockUnmanaged(void *a1, const char *a2, ...)
{
  return [a1 selfLockUnmanaged];
}

id objc_msgSend_server(void *a1, const char *a2, ...)
{
  return [a1 server];
}

id objc_msgSend_serverIfRunning(void *a1, const char *a2, ...)
{
  return [a1 serverIfRunning];
}

id objc_msgSend_sessionAllowedBundleIdentifiers(void *a1, const char *a2, ...)
{
  return [a1 sessionAllowedBundleIdentifiers];
}

id objc_msgSend_sessionAppBundleIdentifiers(void *a1, const char *a2, ...)
{
  return [a1 sessionAppBundleIdentifiers];
}

id objc_msgSend_sessionAppGAXClientDidCheckIn(void *a1, const char *a2, ...)
{
  return [a1 sessionAppGAXClientDidCheckIn];
}

id objc_msgSend_sessionApplicationName(void *a1, const char *a2, ...)
{
  return [a1 sessionApplicationName];
}

id objc_msgSend_sessionAppsContainPreferences(void *a1, const char *a2, ...)
{
  return [a1 sessionAppsContainPreferences];
}

id objc_msgSend_sessionAppsContainPurpleBuddy(void *a1, const char *a2, ...)
{
  return [a1 sessionAppsContainPurpleBuddy];
}

id objc_msgSend_set(void *a1, const char *a2, ...)
{
  return [a1 set];
}

id objc_msgSend_settings(void *a1, const char *a2, ...)
{
  return [a1 settings];
}

id objc_msgSend_settingsStorage(void *a1, const char *a2, ...)
{
  return [a1 settingsStorage];
}

id objc_msgSend_sharedConnection(void *a1, const char *a2, ...)
{
  return [a1 sharedConnection];
}

id objc_msgSend_sharedInstance(void *a1, const char *a2, ...)
{
  return [a1 sharedInstance];
}

id objc_msgSend_sharedManager(void *a1, const char *a2, ...)
{
  return [a1 sharedManager];
}

id objc_msgSend_shouldAllowAccessibilityShortcut(void *a1, const char *a2, ...)
{
  return [a1 shouldAllowAccessibilityShortcut];
}

id objc_msgSend_shouldAllowAutolock(void *a1, const char *a2, ...)
{
  return [a1 shouldAllowAutolock];
}

id objc_msgSend_shouldAllowExit(void *a1, const char *a2, ...)
{
  return [a1 shouldAllowExit];
}

id objc_msgSend_shouldAllowHomeButton(void *a1, const char *a2, ...)
{
  return [a1 shouldAllowHomeButton];
}

id objc_msgSend_shouldAllowKeyboardTextInput(void *a1, const char *a2, ...)
{
  return [a1 shouldAllowKeyboardTextInput];
}

id objc_msgSend_shouldAllowLockButton(void *a1, const char *a2, ...)
{
  return [a1 shouldAllowLockButton];
}

id objc_msgSend_shouldAllowMotion(void *a1, const char *a2, ...)
{
  return [a1 shouldAllowMotion];
}

id objc_msgSend_shouldAllowProximity(void *a1, const char *a2, ...)
{
  return [a1 shouldAllowProximity];
}

id objc_msgSend_shouldAllowRingerSwitch(void *a1, const char *a2, ...)
{
  return [a1 shouldAllowRingerSwitch];
}

id objc_msgSend_shouldAllowToggleOfAssistiveTouch(void *a1, const char *a2, ...)
{
  return [a1 shouldAllowToggleOfAssistiveTouch];
}

id objc_msgSend_shouldAllowToggleOfCommandAndControl(void *a1, const char *a2, ...)
{
  return [a1 shouldAllowToggleOfCommandAndControl];
}

id objc_msgSend_shouldAllowToggleOfGrayscale(void *a1, const char *a2, ...)
{
  return [a1 shouldAllowToggleOfGrayscale];
}

id objc_msgSend_shouldAllowToggleOfInvertColors(void *a1, const char *a2, ...)
{
  return [a1 shouldAllowToggleOfInvertColors];
}

id objc_msgSend_shouldAllowToggleOfVoiceOver(void *a1, const char *a2, ...)
{
  return [a1 shouldAllowToggleOfVoiceOver];
}

id objc_msgSend_shouldAllowToggleOfZoom(void *a1, const char *a2, ...)
{
  return [a1 shouldAllowToggleOfZoom];
}

id objc_msgSend_shouldAllowTouch(void *a1, const char *a2, ...)
{
  return [a1 shouldAllowTouch];
}

id objc_msgSend_shouldAllowVolumeButtons(void *a1, const char *a2, ...)
{
  return [a1 shouldAllowVolumeButtons];
}

id objc_msgSend_shouldAutolaunchAppsAfterLowBatteryPowerDown(void *a1, const char *a2, ...)
{
  return [a1 shouldAutolaunchAppsAfterLowBatteryPowerDown];
}

id objc_msgSend_shouldAutolaunchCrashedApps(void *a1, const char *a2, ...)
{
  return [a1 shouldAutolaunchCrashedApps];
}

id objc_msgSend_shouldDisableAssistiveTouch(void *a1, const char *a2, ...)
{
  return [a1 shouldDisableAssistiveTouch];
}

id objc_msgSend_shouldDisableCommandAndControl(void *a1, const char *a2, ...)
{
  return [a1 shouldDisableCommandAndControl];
}

id objc_msgSend_shouldDisableGrayscale(void *a1, const char *a2, ...)
{
  return [a1 shouldDisableGrayscale];
}

id objc_msgSend_shouldDisableInvertColors(void *a1, const char *a2, ...)
{
  return [a1 shouldDisableInvertColors];
}

id objc_msgSend_shouldDisableMonoAudio(void *a1, const char *a2, ...)
{
  return [a1 shouldDisableMonoAudio];
}

id objc_msgSend_shouldDisableSpeakSelection(void *a1, const char *a2, ...)
{
  return [a1 shouldDisableSpeakSelection];
}

id objc_msgSend_shouldDisableVoiceOver(void *a1, const char *a2, ...)
{
  return [a1 shouldDisableVoiceOver];
}

id objc_msgSend_shouldDisableZoom(void *a1, const char *a2, ...)
{
  return [a1 shouldDisableZoom];
}

id objc_msgSend_shouldEnableAssistiveTouch(void *a1, const char *a2, ...)
{
  return [a1 shouldEnableAssistiveTouch];
}

id objc_msgSend_shouldEnableCommandAndControl(void *a1, const char *a2, ...)
{
  return [a1 shouldEnableCommandAndControl];
}

id objc_msgSend_shouldEnableGrayscale(void *a1, const char *a2, ...)
{
  return [a1 shouldEnableGrayscale];
}

id objc_msgSend_shouldEnableInvertColors(void *a1, const char *a2, ...)
{
  return [a1 shouldEnableInvertColors];
}

id objc_msgSend_shouldEnableMonoAudio(void *a1, const char *a2, ...)
{
  return [a1 shouldEnableMonoAudio];
}

id objc_msgSend_shouldEnableSpeakSelection(void *a1, const char *a2, ...)
{
  return [a1 shouldEnableSpeakSelection];
}

id objc_msgSend_shouldEnableVoiceOver(void *a1, const char *a2, ...)
{
  return [a1 shouldEnableVoiceOver];
}

id objc_msgSend_shouldEnableZoom(void *a1, const char *a2, ...)
{
  return [a1 shouldEnableZoom];
}

id objc_msgSend_shouldShowUserConfirmationPromptsAndBanners(void *a1, const char *a2, ...)
{
  return [a1 shouldShowUserConfirmationPromptsAndBanners];
}

id objc_msgSend_shouldStartSessionUponFrontmostAppChanged(void *a1, const char *a2, ...)
{
  return [a1 shouldStartSessionUponFrontmostAppChanged];
}

id objc_msgSend_singleAppModeAppID(void *a1, const char *a2, ...)
{
  return [a1 singleAppModeAppID];
}

id objc_msgSend_singleAppModeAppPropertiesMap(void *a1, const char *a2, ...)
{
  return [a1 singleAppModeAppPropertiesMap];
}

id objc_msgSend_singleAppModeGlobalPropertiesMap(void *a1, const char *a2, ...)
{
  return [a1 singleAppModeGlobalPropertiesMap];
}

id objc_msgSend_springBoardDidRelaunch(void *a1, const char *a2, ...)
{
  return [a1 springBoardDidRelaunch];
}

id objc_msgSend_springboardDiedObserverToken(void *a1, const char *a2, ...)
{
  return [a1 springboardDiedObserverToken];
}

id objc_msgSend_status(void *a1, const char *a2, ...)
{
  return [a1 status];
}

id objc_msgSend_stopHostingWorkspaceApplicationImmediately(void *a1, const char *a2, ...)
{
  return [a1 stopHostingWorkspaceApplicationImmediately];
}

id objc_msgSend_string(void *a1, const char *a2, ...)
{
  return [a1 string];
}

id objc_msgSend_substantialTransitionTimer(void *a1, const char *a2, ...)
{
  return [a1 substantialTransitionTimer];
}

id objc_msgSend_suspend(void *a1, const char *a2, ...)
{
  return [a1 suspend];
}

id objc_msgSend_suspendEffectiveApp(void *a1, const char *a2, ...)
{
  return [a1 suspendEffectiveApp];
}

id objc_msgSend_systemDidRestartDueToLowBattery(void *a1, const char *a2, ...)
{
  return [a1 systemDidRestartDueToLowBattery];
}

id objc_msgSend_terminate(void *a1, const char *a2, ...)
{
  return [a1 terminate];
}

id objc_msgSend_terminateEffectiveApp(void *a1, const char *a2, ...)
{
  return [a1 terminateEffectiveApp];
}

id objc_msgSend_timeIntervalSinceReferenceDate(void *a1, const char *a2, ...)
{
  return [a1 timeIntervalSinceReferenceDate];
}

id objc_msgSend_timeRestrictionHasExpired(void *a1, const char *a2, ...)
{
  return [a1 timeRestrictionHasExpired];
}

id objc_msgSend_timeRestrictionManager(void *a1, const char *a2, ...)
{
  return [a1 timeRestrictionManager];
}

id objc_msgSend_timeRestrictionsEnabled(void *a1, const char *a2, ...)
{
  return [a1 timeRestrictionsEnabled];
}

id objc_msgSend_timeout(void *a1, const char *a2, ...)
{
  return [a1 timeout];
}

id objc_msgSend_type(void *a1, const char *a2, ...)
{
  return [a1 type];
}

id objc_msgSend_unappliedChangedStatesForRestrictions(void *a1, const char *a2, ...)
{
  return [a1 unappliedChangedStatesForRestrictions];
}

id objc_msgSend_unmanagedASAMFailsafeTimer(void *a1, const char *a2, ...)
{
  return [a1 unmanagedASAMFailsafeTimer];
}

id objc_msgSend_unmanagedSelfLockManagedConfigurationSettings(void *a1, const char *a2, ...)
{
  return [a1 unmanagedSelfLockManagedConfigurationSettings];
}

id objc_msgSend_unmanagedSelfLockPropertiesMap(void *a1, const char *a2, ...)
{
  return [a1 unmanagedSelfLockPropertiesMap];
}

id objc_msgSend_unsignedIntValue(void *a1, const char *a2, ...)
{
  return [a1 unsignedIntValue];
}

id objc_msgSend_unsignedIntegerValue(void *a1, const char *a2, ...)
{
  return [a1 unsignedIntegerValue];
}

id objc_msgSend_updateQueue(void *a1, const char *a2, ...)
{
  return [a1 updateQueue];
}

id objc_msgSend_updateTimer(void *a1, const char *a2, ...)
{
  return [a1 updateTimer];
}

id objc_msgSend_usagePage(void *a1, const char *a2, ...)
{
  return [a1 usagePage];
}

id objc_msgSend_userAppProfile(void *a1, const char *a2, ...)
{
  return [a1 userAppProfile];
}

id objc_msgSend_userAppPropertiesMap(void *a1, const char *a2, ...)
{
  return [a1 userAppPropertiesMap];
}

id objc_msgSend_userConfiguredAppIDs(void *a1, const char *a2, ...)
{
  return [a1 userConfiguredAppIDs];
}

id objc_msgSend_userGlobalProfile(void *a1, const char *a2, ...)
{
  return [a1 userGlobalProfile];
}

id objc_msgSend_userGlobalPropertiesMap(void *a1, const char *a2, ...)
{
  return [a1 userGlobalPropertiesMap];
}

id objc_msgSend_userInterfaceClient(void *a1, const char *a2, ...)
{
  return [a1 userInterfaceClient];
}

id objc_msgSend_verifyConnectionExists(void *a1, const char *a2, ...)
{
  return [a1 verifyConnectionExists];
}

id objc_msgSend_verifyQueue(void *a1, const char *a2, ...)
{
  return [a1 verifyQueue];
}

id objc_msgSend_wantsAppSelfLockMode(void *a1, const char *a2, ...)
{
  return [a1 wantsAppSelfLockMode];
}

id objc_msgSend_wantsSingleAppMode(void *a1, const char *a2, ...)
{
  return [a1 wantsSingleAppMode];
}

id objc_msgSend_wantsSingleAppModeOrAppSelfLockMode(void *a1, const char *a2, ...)
{
  return [a1 wantsSingleAppModeOrAppSelfLockMode];
}

id objc_msgSend_wasPlayingMedia(void *a1, const char *a2, ...)
{
  return [a1 wasPlayingMedia];
}

id objc_msgSend_willStartSessionWhenFrontmostAppChangesForIntegrityVerifier_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "willStartSessionWhenFrontmostAppChangesForIntegrityVerifier:");
}