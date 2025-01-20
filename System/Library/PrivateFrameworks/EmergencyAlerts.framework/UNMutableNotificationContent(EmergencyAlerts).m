@interface UNMutableNotificationContent(EmergencyAlerts)
- (id)ea_bundleForBundleIdentifier:()EmergencyAlerts;
- (id)ea_externalToneFileURLForTone:()EmergencyAlerts inBundle:;
- (id)ea_externalVibrationPatternFileURLForVibration:()EmergencyAlerts inBundle:;
- (id)ea_getUpdatedBodyString:()EmergencyAlerts withMessageDictionary:;
- (id)ea_timestampSubtitleForDate:()EmergencyAlerts locale:;
- (id)ea_timestampSubtitleForNow;
- (uint64_t)ea_defaultTitle;
- (void)ea_setAlertCategory:()EmergencyAlerts;
- (void)ea_setPropertiesForCellBroadcastMessage:()EmergencyAlerts withActivePhoneCall:;
- (void)ea_updateAlertCategory:()EmergencyAlerts;
- (void)ea_updateUserInfo:()EmergencyAlerts withMessageDictionary:;
@end

@implementation UNMutableNotificationContent(EmergencyAlerts)

- (id)ea_timestampSubtitleForNow
{
  v2 = [MEMORY[0x263EFF910] date];
  v3 = objc_msgSend(a1, "ea_timestampSubtitleForDate:locale:", v2, 0);

  return v3;
}

- (id)ea_timestampSubtitleForDate:()EmergencyAlerts locale:
{
  v5 = (objc_class *)MEMORY[0x263F08790];
  id v6 = a4;
  id v7 = a3;
  id v8 = objc_alloc_init(v5);
  v9 = [MEMORY[0x263F08790] dateFormatFromTemplate:@"yMdjm" options:0 locale:v6];

  [v8 setDateFormat:v9];
  v10 = [v8 stringFromDate:v7];

  return v10;
}

- (uint64_t)ea_defaultTitle
{
  return [NSString localizedUserNotificationStringForKey:@"NOTIFICATION_TITLE" arguments:0];
}

- (id)ea_externalToneFileURLForTone:()EmergencyAlerts inBundle:
{
  id v5 = a3;
  id v6 = a4;
  if (v6 && [v5 length])
  {
    id v7 = [v5 lastPathComponent];
    id v8 = [v7 stringByDeletingPathExtension];

    v9 = [v5 lastPathComponent];
    v10 = [v9 pathExtension];

    v11 = [v6 URLForResource:v8 withExtension:v10];
  }
  else
  {
    v11 = 0;
  }

  return v11;
}

- (id)ea_externalVibrationPatternFileURLForVibration:()EmergencyAlerts inBundle:
{
  id v5 = a3;
  id v6 = a4;
  if (v6 && [v5 length])
  {
    id v7 = [v5 lastPathComponent];
    id v8 = [v7 stringByDeletingPathExtension];

    v9 = [v5 lastPathComponent];
    v10 = [v9 pathExtension];

    v11 = [v6 URLForResource:v8 withExtension:v10];
  }
  else
  {
    v11 = 0;
  }

  return v11;
}

- (id)ea_bundleForBundleIdentifier:()EmergencyAlerts
{
  id v3 = a3;
  if (v3)
  {
    v4 = [MEMORY[0x263F086E0] bundleWithIdentifier:v3];
    if (v4) {
      goto LABEL_6;
    }
    id v5 = EALogDefault;
    if (os_log_type_enabled((os_log_t)EALogDefault, OS_LOG_TYPE_ERROR)) {
      -[UNMutableNotificationContent(EmergencyAlerts) ea_bundleForBundleIdentifier:]((uint64_t)v3, v5);
    }
  }
  v4 = 0;
LABEL_6:

  return v4;
}

- (void)ea_updateAlertCategory:()EmergencyAlerts
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  v2 = [a1 categoryIdentifier];
  if (([v2 isEqualToString:@"alert-configurable"] & 1) != 0
    || ([v2 isEqualToString:@"alert-configurable-spinner"] & 1) != 0)
  {
    id v3 = EACategoryIdentifierConfigurableAlertDetailed;
LABEL_7:
    [a1 setCategoryIdentifier:*v3];
    goto LABEL_8;
  }
  if (([v2 isEqualToString:@"alert"] & 1) != 0
    || ([v2 isEqualToString:@"alert-spinner"] & 1) != 0)
  {
    id v3 = EACategoryIdentifierAlertDetailed;
    goto LABEL_7;
  }
  if ([v2 isEqualToString:@"igneous"])
  {
LABEL_8:
    v4 = (void *)EALogDefault;
    if (os_log_type_enabled((os_log_t)EALogDefault, OS_LOG_TYPE_DEFAULT))
    {
      id v5 = v4;
      id v6 = [a1 categoryIdentifier];
      int v8 = 138412290;
      v9 = v6;
      _os_log_impl(&dword_2266B8000, v5, OS_LOG_TYPE_DEFAULT, "Alert Category updated: %@", (uint8_t *)&v8, 0xCu);
    }
    goto LABEL_10;
  }
  id v7 = (void *)EALogDefault;
  if (os_log_type_enabled((os_log_t)EALogDefault, OS_LOG_TYPE_ERROR)) {
    -[UNMutableNotificationContent(EmergencyAlerts) ea_updateAlertCategory:](v7, a1);
  }
LABEL_10:
}

- (void)ea_setAlertCategory:()EmergencyAlerts
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = [v4 objectForKey:*MEMORY[0x263F032E0]];
  id v6 = [v5 objectForKey:@"UserConfigurable"];
  int v7 = [v6 BOOLValue];

  int v8 = [v5 objectForKey:@"SwitchName"];
  v9 = v8;
  if (v8)
  {
    if ([v8 isEqualToString:@"Advanced Earthquake Alert"])
    {
      uint64_t v10 = EALogDefault;
      if (os_log_type_enabled((os_log_t)EALogDefault, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(v20) = 0;
        _os_log_impl(&dword_2266B8000, v10, OS_LOG_TYPE_DEFAULT, "Overriding user configurable category to NO", (uint8_t *)&v20, 2u);
      }
      [a1 setCategoryIdentifier:@"igneous"];
      goto LABEL_20;
    }
  }
  else if (os_log_type_enabled((os_log_t)EALogDefault, OS_LOG_TYPE_ERROR))
  {
    -[UNMutableNotificationContent(EmergencyAlerts) ea_setAlertCategory:]();
  }
  v11 = [v4 objectForKey:@"kCTSMSAppleSafetyAlertData"];

  if (v11)
  {
    v12 = EACategoryIdentifierConfigurableAlertDetailed;
    if (!v7) {
      v12 = EACategoryIdentifierAlertDetailed;
    }
    [a1 setCategoryIdentifier:*v12];
    v13 = [v4 objectForKey:*MEMORY[0x263F032F8]];
    ea_sendSafetyAlertTapIndication(v13, 1);
  }
  else
  {
    v14 = [v4 objectForKey:@"kCTSMSAppleSafetyAlertSupport"];

    if (v14)
    {
      v15 = EACategoryIdentifierConfigurableAlertSpinner;
      v16 = EACategoryIdentifierAlertSpinner;
    }
    else
    {
      v15 = EACategoryIdentifierConfigurableAlert;
      v16 = EACategoryIdentifierAlert;
    }
    if (!v7) {
      v15 = v16;
    }
    [a1 setCategoryIdentifier:*v15];
  }
  v17 = (void *)EALogDefault;
  if (os_log_type_enabled((os_log_t)EALogDefault, OS_LOG_TYPE_DEFAULT))
  {
    v18 = v17;
    v19 = [a1 categoryIdentifier];
    int v20 = 138412290;
    v21 = v19;
    _os_log_impl(&dword_2266B8000, v18, OS_LOG_TYPE_DEFAULT, "Alert Category: %@", (uint8_t *)&v20, 0xCu);
  }
LABEL_20:
}

- (id)ea_getUpdatedBodyString:()EmergencyAlerts withMessageDictionary:
{
  id v5 = a3;
  id v6 = [a4 objectForKey:@"kCTSMSAppleSafetyAlertData"];
  int v7 = v6;
  if (!v6)
  {
    id v14 = v5;
    goto LABEL_18;
  }
  uint64_t v8 = [v6 objectForKeyedSubscript:@"CmamText"];
  uint64_t v9 = [v7 objectForKeyedSubscript:@"CmamLongText"];
  if (!(v8 | v9))
  {
    if (os_log_type_enabled((os_log_t)EALogDefault, OS_LOG_TYPE_ERROR)) {
      -[UNMutableNotificationContent(EmergencyAlerts) ea_getUpdatedBodyString:withMessageDictionary:]();
    }
    id v14 = v5;
    goto LABEL_17;
  }
  uint64_t v10 = [v7 objectForKeyedSubscript:@"ReplaceAlertBodyWithCmamLongText"];
  if ([v10 BOOLValue]
    && [v5 rangeOfString:v8] != 0x7FFFFFFFFFFFFFFFLL
    && [v5 rangeOfString:v9] == 0x7FFFFFFFFFFFFFFFLL)
  {
    unint64_t v11 = [(id)v9 length];
    if (v11 > [(id)v8 length])
    {
      v12 = [v5 stringByReplacingOccurrencesOfString:v8 withString:v9];

      v13 = EALogDefault;
      if (os_log_type_enabled((os_log_t)EALogDefault, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v16 = 0;
        _os_log_impl(&dword_2266B8000, v13, OS_LOG_TYPE_DEFAULT, "Alert body updated with CMAM long text", v16, 2u);
      }
      goto LABEL_16;
    }
    if (os_log_type_enabled((os_log_t)EALogDefault, OS_LOG_TYPE_ERROR)) {
      -[UNMutableNotificationContent(EmergencyAlerts) ea_getUpdatedBodyString:withMessageDictionary:]();
    }
  }
  v12 = v5;
LABEL_16:
  id v14 = v12;

LABEL_17:
LABEL_18:

  return v14;
}

- (void)ea_updateUserInfo:()EmergencyAlerts withMessageDictionary:
{
  id v6 = a3;
  int v7 = [a4 objectForKey:@"kCTSMSAppleSafetyAlertData"];
  uint64_t v8 = v7;
  if (v7)
  {
    if (v6)
    {
      uint64_t v9 = [v7 objectForKey:@"Instruction"];
      if (!v9 && os_log_type_enabled((os_log_t)EALogDefault, OS_LOG_TYPE_ERROR)) {
        -[UNMutableNotificationContent(EmergencyAlerts) ea_updateUserInfo:withMessageDictionary:].cold.4();
      }
      uint64_t v10 = [v8 objectForKey:@"ExpiryTimestamp"];
      if (v10)
      {
        unint64_t v11 = [v8 objectForKey:@"EffectiveTimestamp"];
        if (v11)
        {
          [v6 setObject:v9 forKeyedSubscript:@"Instruction"];
          [v6 setObject:v10 forKeyedSubscript:@"ExpiryTimestamp"];
          [v6 setObject:v11 forKeyedSubscript:@"EffectiveTimestamp"];
          v12 = EALogDefault;
          if (os_log_type_enabled((os_log_t)EALogDefault, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)id v14 = 0;
            _os_log_impl(&dword_2266B8000, v12, OS_LOG_TYPE_DEFAULT, "User Info updated with Apple safety alert", v14, 2u);
          }
        }
        else if (os_log_type_enabled((os_log_t)EALogDefault, OS_LOG_TYPE_ERROR))
        {
          -[UNMutableNotificationContent(EmergencyAlerts) ea_updateUserInfo:withMessageDictionary:]();
        }
      }
      else if (os_log_type_enabled((os_log_t)EALogDefault, OS_LOG_TYPE_ERROR))
      {
        -[UNMutableNotificationContent(EmergencyAlerts) ea_updateUserInfo:withMessageDictionary:]();
      }
    }
    else if (os_log_type_enabled((os_log_t)EALogDefault, OS_LOG_TYPE_ERROR))
    {
      -[UNMutableNotificationContent(EmergencyAlerts) ea_updateUserInfo:withMessageDictionary:]();
    }
  }
  else
  {
    v13 = EALogDefault;
    if (os_log_type_enabled((os_log_t)EALogDefault, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_2266B8000, v13, OS_LOG_TYPE_DEFAULT, "No Apple safety alert data", buf, 2u);
    }
  }
  [a1 setUserInfo:v6];
}

- (void)ea_setPropertiesForCellBroadcastMessage:()EmergencyAlerts withActivePhoneCall:
{
  v90[5] = *MEMORY[0x263EF8340];
  id v5 = a3;
  uint64_t v6 = [v5 objectForKey:*MEMORY[0x263F03310]];
  uint64_t v7 = [v5 objectForKey:*MEMORY[0x263F03318]];
  uint64_t v8 = [v5 objectForKey:*MEMORY[0x263F032F8]];
  uint64_t v9 = objc_msgSend(a1, "ea_getUpdatedBodyString:withMessageDictionary:", v8, v5);

  if (v6) {
    BOOL v10 = v7 == 0;
  }
  else {
    BOOL v10 = 1;
  }
  v69 = (void *)v7;
  v70 = (void *)v6;
  if (!v10)
  {
    v90[0] = v7;
    v90[1] = @":\n";
    v90[2] = v6;
    v90[3] = @"\n\n";
    v90[4] = v9;
    unint64_t v11 = [MEMORY[0x263EFF8C0] arrayWithObjects:v90 count:5];
    uint64_t v12 = [v11 componentsJoinedByString:&stru_26DA418D0];

    uint64_t v9 = (void *)v12;
  }
  v13 = [v5 objectForKey:*MEMORY[0x263F032F0]];
  HIDWORD(v61) = [v13 BOOLValue];

  v82 = [v5 objectForKey:*MEMORY[0x263F032E8]];
  v79 = [v5 objectForKey:*MEMORY[0x263F032D0]];
  id v14 = [v5 objectForKey:*MEMORY[0x263F032E0]];
  v15 = [v14 objectForKey:@"SoundIsMutableInDND"];
  int v16 = [v15 BOOLValue];

  v17 = [v14 objectForKey:@"SoundAlertDeviceInMute"];
  LODWORD(v61) = [v17 BOOLValue];

  v18 = [v14 objectForKey:@"ShowTimestamp"];
  int v19 = [v18 BOOLValue];

  uint64_t v20 = [v14 objectForKey:@"SoundAlertPeriod"];
  uint64_t v21 = [v14 objectForKey:@"NotificationTitle"];
  uint64_t v22 = [v5 objectForKey:*MEMORY[0x263F032D8]];
  v23 = [v22 objectForKey:@"PlaySoundUntilAcknowledged"];
  int v63 = [v23 BOOLValue];

  v24 = [v5 objectForKey:*MEMORY[0x263F03308]];
  v67 = v24;
  if (v24)
  {
    id v25 = v24;
  }
  else
  {
    id v25 = [v22 objectForKey:@"Sound"];
  }
  v81 = v25;
  v73 = objc_msgSend(v22, "objectForKey:", @"OverrideAccessibilityVibrationSetting", v61);

  v80 = [v22 objectForKey:@"Vibration"];
  v77 = v22;
  v26 = [v22 objectForKey:@"SystemSound"];
  v66 = v26;
  v27 = (void *)v21;
  if (v26) {
    uint64_t v28 = [v26 caseInsensitiveCompare:@"TEXT"];
  }
  else {
    uint64_t v28 = 0;
  }
  v29 = [v77 objectForKey:@"AllowCallAudioInterruption"];
  int v64 = [v29 BOOLValue];

  uint64_t v30 = (uint64_t)v27;
  if (![v27 length])
  {
    uint64_t v30 = objc_msgSend(a1, "ea_defaultTitle");
  }
  v71 = (void *)v20;
  if (v19)
  {
    objc_msgSend(a1, "ea_timestampSubtitleForNow");
    v76 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v76 = &stru_26DA418D0;
  }
  id v31 = v9;
  v32 = [MEMORY[0x263F08708] alphanumericCharacterSet];
  for (unint64_t i = 0; [v31 length] > i; ++i)
  {
    if (objc_msgSend(v32, "characterIsMember:", objc_msgSend(v31, "characterAtIndex:", i))) {
      break;
    }
  }
  uint64_t v34 = [v31 substringFromIndex:i];

  [a1 setTitle:v30];
  [a1 setSubtitle:v76];
  v65 = (void *)v34;
  [a1 setBody:v34];
  [a1 setShouldIgnoreDoNotDisturb:v16 ^ 1u];
  [a1 setShouldSuppressDefaultAction:1];
  [a1 setShouldPreemptPresentedNotification:1];
  if (v79)
  {
    v35 = EALogDefault;
    if (os_log_type_enabled((os_log_t)EALogDefault, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      *(void *)v85 = v79;
      _os_log_impl(&dword_2266B8000, v35, OS_LOG_TYPE_DEFAULT, "Setting speech language to: %@", buf, 0xCu);
    }
    [a1 setSpeechLanguage:v79];
  }
  v75 = objc_msgSend(a1, "ea_bundleForBundleIdentifier:", v82);
  v78 = objc_msgSend(a1, "ea_externalToneFileURLForTone:inBundle:", v81);
  v83 = [MEMORY[0x263EFF9A0] dictionary];
  v68 = (void *)v30;
  if (v28)
  {
    v36 = [MEMORY[0x263F1DF00] soundWithAlertType:2];
    v37 = v80;
    goto LABEL_46;
  }
  v38 = [MEMORY[0x263F1DF00] soundWithAlertType:18];
  v36 = v38;
  if (((v64 | a4 ^ 1) & 1) == 0) {
    [v38 setAlertTopic:*MEMORY[0x263F7FCD8]];
  }
  v39 = [v14 objectForKey:@"AlwaysDeliverPref"];

  if (v39)
  {
    v40 = [v14 objectForKey:@"AlwaysDeliverPref"];
    uint64_t v41 = [v40 BOOLValue];
  }
  else
  {
    uint64_t v41 = HIDWORD(v62) | v63 | v62;
  }
  [v36 setShouldIgnoreRingerSwitch:v41];
  v42 = EALogDefault;
  if (os_log_type_enabled((os_log_t)EALogDefault, OS_LOG_TYPE_DEFAULT))
  {
    v43 = @"NO";
    if (v41) {
      v43 = @"YES";
    }
    *(_DWORD *)buf = 138412290;
    *(void *)v85 = v43;
    _os_log_impl(&dword_2266B8000, v42, OS_LOG_TYPE_DEFAULT, "Always Deliver: %@", buf, 0xCu);
  }
  if (v63)
  {
    [v36 setShouldRepeat:1];
    v37 = v80;
  }
  else
  {
    v37 = v80;
    if (v71)
    {
      [v36 setShouldRepeat:1];
      [v71 doubleValue];
      double v45 = v44 / 1000.0;
    }
    else
    {
      [v36 setShouldRepeat:0];
      double v45 = 14.0;
    }
    [v36 setMaximumDuration:v45];
  }
  if ((a4 & v64) == 1) {
    goto LABEL_42;
  }
  if (v78)
  {
    objc_msgSend(v36, "setToneFileURL:");
  }
  else if (([v81 isEqualToString:@"Text"] & 1) == 0)
  {
LABEL_42:
    [v36 setToneIdentifier:*MEMORY[0x263F7FD70]];
  }
LABEL_46:
  [v36 setShouldIgnoreAccessibilityDisabledVibrationSetting:v73 != 0];
  v46 = (void *)EALogDefault;
  if (os_log_type_enabled((os_log_t)EALogDefault, OS_LOG_TYPE_DEFAULT))
  {
    v47 = v46;
    int v48 = [v36 shouldIgnoreAccessibilityDisabledVibrationSetting];
    *(_DWORD *)buf = 67109120;
    *(_DWORD *)v85 = v48;
    _os_log_impl(&dword_2266B8000, v47, OS_LOG_TYPE_DEFAULT, "Setting alert override-accessibility-vibration: %{BOOL}d", buf, 8u);
  }
  v49 = objc_msgSend(a1, "ea_externalVibrationPatternFileURLForVibration:inBundle:", v37, v75);
  if (v49)
  {
    [v36 setVibrationPatternFileURL:v49];
  }
  else if (([v37 isEqualToString:@"Default"] & 1) == 0)
  {
    [v36 setVibrationIdentifier:*MEMORY[0x263F7FD78]];
  }
  v50 = (void *)EALogDefault;
  v74 = v14;
  if (os_log_type_enabled((os_log_t)EALogDefault, OS_LOG_TYPE_DEFAULT))
  {
    v51 = v50;
    int v52 = [v36 shouldIgnoreRingerSwitch];
    int v53 = [v36 shouldRepeat];
    id v54 = v5;
    v55 = NSNumber;
    [v36 maximumDuration];
    v56 = objc_msgSend(v55, "numberWithDouble:");
    *(_DWORD *)buf = 67109890;
    *(_DWORD *)v85 = v52;
    *(_WORD *)&v85[4] = 1024;
    *(_DWORD *)&v85[6] = v53;
    id v14 = v74;
    __int16 v86 = 2114;
    v87 = v56;
    __int16 v88 = 1024;
    int v89 = a4;
    _os_log_impl(&dword_2266B8000, v51, OS_LOG_TYPE_DEFAULT, "Setting alert sound: prevent-muting: %{BOOL}d, repeat: %{BOOL}d, max-duration: %{public}@, active-call: %{BOOL}d", buf, 0x1Eu);

    id v5 = v54;
  }
  [a1 setSound:v36];
  [v83 setObject:MEMORY[0x263EFFA88] forKey:@"FromPhone"];
  v57 = [v14 objectForKey:@"SoundIsMutableInRelayMode"];
  if (v57) {
    [v83 setObject:v57 forKey:@"SoundIsMutableInRelayMode"];
  }
  if (v82) {
    [v83 setObject:v82 forKey:@"carrierBundleIdentifier"];
  }
  v58 = [v78 path];
  if (v78) {
    [v83 setObject:v58 forKey:@"externalToneFileURL"];
  }
  if (v81) {
    [v83 setObject:v81 forKey:@"externalToneFileName"];
  }
  v59 = [v49 path];
  if (v59) {
    [v83 setObject:v59 forKey:@"externalVibrationPatternFileURL"];
  }
  if (v80) {
    [v83 setObject:v80 forKey:@"externalVibrationPatternFileName"];
  }
  objc_msgSend(a1, "ea_updateUserInfo:withMessageDictionary:", v83, v5);
  objc_msgSend(a1, "ea_setAlertCategory:", v5);
  v60 = EALogDefault;
  if (os_log_type_enabled((os_log_t)EALogDefault, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    *(void *)v85 = v83;
    _os_log_impl(&dword_2266B8000, v60, OS_LOG_TYPE_DEFAULT, "UserInfo dict: %@", buf, 0xCu);
  }
}

- (void)ea_bundleForBundleIdentifier:()EmergencyAlerts .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 138543362;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_2266B8000, a2, OS_LOG_TYPE_ERROR, "Cannot find bundle for %{public}@", (uint8_t *)&v2, 0xCu);
}

- (void)ea_updateAlertCategory:()EmergencyAlerts .cold.1(void *a1, void *a2)
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  uint64_t v3 = a1;
  uint64_t v4 = [a2 categoryIdentifier];
  int v5 = 138412290;
  uint64_t v6 = v4;
  _os_log_error_impl(&dword_2266B8000, v3, OS_LOG_TYPE_ERROR, "Alert category: %@", (uint8_t *)&v5, 0xCu);
}

- (void)ea_setAlertCategory:()EmergencyAlerts .cold.1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_2266B8000, v0, v1, "Failed to get switch name.", v2, v3, v4, v5, v6);
}

- (void)ea_getUpdatedBodyString:()EmergencyAlerts withMessageDictionary:.cold.1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_2266B8000, v0, v1, "CMAM long text shorter than CMAM text", v2, v3, v4, v5, v6);
}

- (void)ea_getUpdatedBodyString:()EmergencyAlerts withMessageDictionary:.cold.2()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_2266B8000, v0, v1, "Missing CmamLongText and CmamText in AppleSafetyAlert dictionary", v2, v3, v4, v5, v6);
}

- (void)ea_updateUserInfo:()EmergencyAlerts withMessageDictionary:.cold.1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_2266B8000, v0, v1, "Missing currentUserInfo dictionary", v2, v3, v4, v5, v6);
}

- (void)ea_updateUserInfo:()EmergencyAlerts withMessageDictionary:.cold.2()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_2266B8000, v0, v1, "Missing expiry timestamp in Apple safety alert dictionary", v2, v3, v4, v5, v6);
}

- (void)ea_updateUserInfo:()EmergencyAlerts withMessageDictionary:.cold.3()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_2266B8000, v0, v1, "Missing effective timestamp in Apple safety alert dictionary", v2, v3, v4, v5, v6);
}

- (void)ea_updateUserInfo:()EmergencyAlerts withMessageDictionary:.cold.4()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_2266B8000, v0, v1, "Missing instruction in Apple safety alert dictionary", v2, v3, v4, v5, v6);
}

@end