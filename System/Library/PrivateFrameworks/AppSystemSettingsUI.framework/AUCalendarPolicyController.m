@interface AUCalendarPolicyController
+ (id)loadPrivacySettingsBundle;
+ (unint64_t)authorizationRightforAccessLevel:(int)a3;
+ (void)setCalendarAccessForApp:(id)a3 toValue:(int)a4 shouldPrompt:(BOOL)a5;
- (id)appSpecifierWithName:(id)a3 bundleID:(id)a4;
- (id)calendarStatus:(id)a3;
- (void)setCalendarStatus:(id)a3 specifier:(id)a4;
@end

@implementation AUCalendarPolicyController

+ (id)loadPrivacySettingsBundle
{
  v2 = (void *)MEMORY[0x263F086E0];
  v3 = SFRuntimeAbsoluteFilePathForPath();
  v4 = [v2 bundleWithPath:v3];

  [v4 load];
  return v4;
}

- (id)appSpecifierWithName:(id)a3 bundleID:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v17 = 0;
  id v18 = 0;
  id v16 = 0;
  PSCalendarAuthorizationStates(&v18, &v17, &v16);
  id v8 = v18;
  id v9 = v17;
  id v10 = v16;
  if (([v8 containsObject:v7] & 1) != 0
    || ([v9 containsObject:v7] & 1) != 0
    || [v10 containsObject:v7])
  {
    v11 = [MEMORY[0x263F5FC40] preferenceSpecifierNamed:v6 target:self set:sel_setCalendarStatus_specifier_ get:sel_calendarStatus_ detail:objc_opt_class() cell:2 edit:0];
    uint64_t v12 = MEMORY[0x263EFFA88];
    [v11 setProperty:MEMORY[0x263EFFA88] forKey:*MEMORY[0x263F601A8]];
    [v11 setProperty:v7 forKey:@"BUNDLE_ID"];
    [v11 setProperty:v7 forKey:@"APP_NAME"];
    [v11 setObject:v12 forKeyedSubscript:*MEMORY[0x263F600A8]];
    [v11 setProperty:v7 forKey:*MEMORY[0x263F60138]];
    [v11 setObject:@"com.apple.mobilecal" forKeyedSubscript:*MEMORY[0x263F60188]];
    v13 = [MEMORY[0x263EFF980] array];
    v14 = [MEMORY[0x263EFF980] array];
    if (appSpecifierWithName_bundleID__onceToken != -1) {
      dispatch_once(&appSpecifierWithName_bundleID__onceToken, &__block_literal_global_1);
    }
    [v13 addObject:appSpecifierWithName_bundleID__noAccessStr];
    [v14 addObject:&unk_26FC1ED28];
    [v13 addObject:appSpecifierWithName_bundleID__writeAccessStr];
    [v14 addObject:&unk_26FC1ECF8];
    [v13 addObject:appSpecifierWithName_bundleID__fullAccessStr];
    [v14 addObject:&unk_26FC1ED10];
    [v11 setValues:v14 titles:v13];
  }
  else
  {
    v11 = 0;
  }

  return v11;
}

void __60__AUCalendarPolicyController_appSpecifierWithName_bundleID___block_invoke()
{
  id v6 = +[AUCalendarPolicyController loadPrivacySettingsBundle];
  uint64_t v0 = [v6 localizedStringForKey:@"CALENDARS_FULL_ACCESS_AUTHORIZATION" value:&stru_26FC1C568 table:@"Privacy"];
  v1 = (void *)appSpecifierWithName_bundleID__fullAccessStr;
  appSpecifierWithName_bundleID__fullAccessStr = v0;

  uint64_t v2 = [v6 localizedStringForKey:@"CALENDARS_WRITE_ONLY_ACCESS_AUTHORIZATION" value:&stru_26FC1C568 table:@"Privacy"];
  v3 = (void *)appSpecifierWithName_bundleID__writeAccessStr;
  appSpecifierWithName_bundleID__writeAccessStr = v2;

  uint64_t v4 = [v6 localizedStringForKey:@"CALENDARS_NO_ACCESS_AUTHORIZATION" value:&stru_26FC1C568 table:@"Privacy"];
  v5 = (void *)appSpecifierWithName_bundleID__noAccessStr;
  appSpecifierWithName_bundleID__noAccessStr = v4;
}

- (id)calendarStatus:(id)a3
{
  v3 = [a3 propertyForKey:@"BUNDLE_ID"];
  id v11 = 0;
  id v12 = 0;
  id v10 = 0;
  PSCalendarAuthorizationStates(&v12, &v11, &v10);
  id v4 = v12;
  id v5 = v11;
  id v6 = v10;
  if ([v4 containsObject:v3])
  {
    id v7 = &unk_26FC1ED10;
  }
  else if ([v5 containsObject:v3])
  {
    id v7 = &unk_26FC1ECF8;
  }
  else
  {
    if (([v6 containsObject:v3] & 1) == 0)
    {
      id v8 = _AULoggingFacility();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
        -[AUCalendarPolicyController calendarStatus:]((uint64_t)v3, v8);
      }
    }
    id v7 = &unk_26FC1ED28;
  }

  return v7;
}

- (void)setCalendarStatus:(id)a3 specifier:(id)a4
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  id v5 = a3;
  id v6 = [a4 propertyForKey:@"BUNDLE_ID"];
  if ([v5 intValue] == 2)
  {
    id v7 = _AULoggingFacility();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      int v15 = 138412290;
      id v16 = v6;
      _os_log_impl(&dword_247E6E000, v7, OS_LOG_TYPE_DEFAULT, "Requesting to set calendar auth for app %@ to full", (uint8_t *)&v15, 0xCu);
    }

    id v8 = v6;
    uint64_t v9 = 2;
    uint64_t v10 = 1;
  }
  else
  {
    if ([v5 intValue] == 1)
    {
      id v11 = _AULoggingFacility();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        int v15 = 138412290;
        id v16 = v6;
        _os_log_impl(&dword_247E6E000, v11, OS_LOG_TYPE_DEFAULT, "Setting calendar auth for app %@ to write-only", (uint8_t *)&v15, 0xCu);
      }

      id v8 = v6;
      uint64_t v9 = 1;
    }
    else
    {
      int v12 = [v5 intValue];
      v13 = _AULoggingFacility();
      BOOL v14 = os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT);
      if (v12)
      {
        if (v14)
        {
          int v15 = 138412290;
          id v16 = v5;
          _os_log_impl(&dword_247E6E000, v13, OS_LOG_TYPE_DEFAULT, "Unexpected value set for calendar tcc access: %@", (uint8_t *)&v15, 0xCu);
        }

        id v8 = v6;
        uint64_t v9 = 3;
      }
      else
      {
        if (v14)
        {
          int v15 = 138412290;
          id v16 = v6;
          _os_log_impl(&dword_247E6E000, v13, OS_LOG_TYPE_DEFAULT, "Setting calendar auth for app %@ to denied", (uint8_t *)&v15, 0xCu);
        }

        id v8 = v6;
        uint64_t v9 = 0;
      }
    }
    uint64_t v10 = 0;
  }
  +[AUCalendarPolicyController setCalendarAccessForApp:v8 toValue:v9 shouldPrompt:v10];
}

+ (unint64_t)authorizationRightforAccessLevel:(int)a3
{
  if ((a3 - 1) > 2) {
    return 0;
  }
  else {
    return qword_247E83788[a3 - 1];
  }
}

+ (void)setCalendarAccessForApp:(id)a3 toValue:(int)a4 shouldPrompt:(BOOL)a5
{
  BOOL v5 = a5;
  uint64_t v6 = *(void *)&a4;
  uint64_t v26 = *MEMORY[0x263EF8340];
  id v8 = a3;
  if (setCalendarAccessForApp_toValue_shouldPrompt__onceToken != -1) {
    dispatch_once(&setCalendarAccessForApp_toValue_shouldPrompt__onceToken, &__block_literal_global_79);
  }
  uint64_t v9 = _AULoggingFacility();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v10 = (void *)*MEMORY[0x263F7C508];
    *(_DWORD *)buf = 138412802;
    id v21 = v10;
    __int16 v22 = 2112;
    id v23 = v8;
    __int16 v24 = 1024;
    int v25 = v6;
    _os_log_impl(&dword_247E6E000, v9, OS_LOG_TYPE_DEFAULT, "Setting TCC auth for service: %@ appIdentifier:%@, accessLevel:%d", buf, 0x1Cu);
  }

  id v11 = v8;
  [v11 cStringUsingEncoding:4];
  int v12 = (void *)tcc_identity_create();
  v13 = tcc_service_singleton_for_CF_name();
  +[AUCalendarPolicyController authorizationRightforAccessLevel:v6];
  if (v5)
  {
    v17[0] = MEMORY[0x263EF8330];
    v17[1] = 3221225472;
    v17[2] = __75__AUCalendarPolicyController_setCalendarAccessForApp_toValue_shouldPrompt___block_invoke_80;
    v17[3] = &unk_265231270;
    id v19 = a1;
    id v14 = v11;
    id v18 = v14;
    int v15 = (void *)MEMORY[0x24C56E5E0](v17);
    id v16 = _AULoggingFacility();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v21 = v14;
      _os_log_impl(&dword_247E6E000, v16, OS_LOG_TYPE_DEFAULT, "Setting calendar auth for app %@ to full, after prompt", buf, 0xCu);
    }

    tcc_server_message_prompt_authorization_value();
  }
  else
  {
    tcc_server_message_set_authorization_value();
  }
}

uint64_t __75__AUCalendarPolicyController_setCalendarAccessForApp_toValue_shouldPrompt___block_invoke()
{
  setCalendarAccessForApp_toValue_shouldPrompt__tccServer = tcc_server_create();
  return MEMORY[0x270F9A758]();
}

void __75__AUCalendarPolicyController_setCalendarAccessForApp_toValue_shouldPrompt___block_invoke_80(uint64_t a1)
{
  v7[1] = *MEMORY[0x263EF8340];
  uint64_t v2 = [MEMORY[0x263F08A00] defaultCenter];
  uint64_t v3 = *(void *)(a1 + 32);
  uint64_t v4 = *(void *)(a1 + 40);
  uint64_t v6 = @"PSCalendarPrivacyUpgradePromptAppIdentifierKey";
  v7[0] = v3;
  BOOL v5 = [NSDictionary dictionaryWithObjects:v7 forKeys:&v6 count:1];
  [v2 postNotificationName:@"PSCalendarPrivacyUpgradePromptCompletedNotification" object:v4 userInfo:v5];
}

- (void)calendarStatus:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_247E6E000, a2, OS_LOG_TYPE_ERROR, "unknown state for %@, treating as denied", (uint8_t *)&v2, 0xCu);
}

@end