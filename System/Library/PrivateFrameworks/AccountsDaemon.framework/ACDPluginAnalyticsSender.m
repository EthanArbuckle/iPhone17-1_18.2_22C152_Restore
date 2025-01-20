@interface ACDPluginAnalyticsSender
+ (BOOL)accountsTTREnabled;
+ (double)_timeSinceLastTTROffered;
+ (void)_selected_PostTapToRadar:(id)a3 description:(id)a4;
+ (void)openTapToRadarWithAlertTitle:(id)a3 alertDescription:(id)a4 TTRTitle:(id)a5 TTRDescription:(id)a6;
@end

@implementation ACDPluginAnalyticsSender

+ (double)_timeSinceLastTTROffered
{
  v2 = [MEMORY[0x263EFF910] distantPast];
  v3 = [MEMORY[0x263EFFA40] standardUserDefaults];
  v4 = [v3 persistentDomainForName:@"com.apple.accounts"];
  v5 = [v4 objectForKeyedSubscript:@"com.apple.accounts.ttr.lastOffered"];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if (isKindOfClass)
  {
    v7 = [MEMORY[0x263EFFA40] standardUserDefaults];
    v8 = [v7 persistentDomainForName:@"com.apple.accounts"];
    uint64_t v9 = [v8 objectForKeyedSubscript:@"com.apple.accounts.ttr.lastOffered"];

    v2 = (void *)v9;
  }
  [v2 timeIntervalSinceNow];
  double v11 = -v10;

  return v11;
}

+ (BOOL)accountsTTREnabled
{
  v2 = [MEMORY[0x263EFFA40] standardUserDefaults];
  v3 = [v2 persistentDomainForName:@"com.apple.accounts"];
  v4 = [v3 objectForKeyedSubscript:@"com.apple.accounts.ttr.enabled"];

  if (!v4) {
    return 0;
  }
  v5 = [MEMORY[0x263EFFA40] standardUserDefaults];
  v6 = [v5 persistentDomainForName:@"com.apple.accounts"];
  v7 = [v6 objectForKeyedSubscript:@"com.apple.accounts.ttr.enabled"];
  char v8 = [v7 BOOLValue];

  return v8;
}

+ (void)openTapToRadarWithAlertTitle:(id)a3 alertDescription:(id)a4 TTRTitle:(id)a5 TTRDescription:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  if (ACIsInternal())
  {
    if ([a1 accountsTTREnabled])
    {
      [a1 _timeSinceLastTTROffered];
      if (v14 >= 604800.0)
      {
        v16 = (void *)[objc_alloc(MEMORY[0x263EFFA40]) initWithSuiteName:@"com.apple.accounts"];
        v17 = [MEMORY[0x263EFF910] date];
        [v16 setObject:v17 forKey:@"com.apple.accounts.ttr.lastOffered"];

        v18 = _ACLogSystem();
        if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG)) {
          +[ACDPluginAnalyticsSender openTapToRadarWithAlertTitle:alertDescription:TTRTitle:TTRDescription:]();
        }

        v19[0] = MEMORY[0x263EF8330];
        v19[1] = 3221225472;
        v19[2] = __98__ACDPluginAnalyticsSender_openTapToRadarWithAlertTitle_alertDescription_TTRTitle_TTRDescription___block_invoke;
        v19[3] = &unk_2643219A8;
        id v22 = a1;
        v20 = v12;
        id v21 = v13;
        +[ACDUserNotification showUserNotificationWithTitle:v10 message:v11 cancelButtonTitle:@"Cancel" otherButtonTitle:@"Open Tap-To-Radar" level:2 withCompletionBlock:v19];

        v15 = v20;
      }
      else
      {
        v15 = _ACLogSystem();
        if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
          +[ACDPluginAnalyticsSender openTapToRadarWithAlertTitle:alertDescription:TTRTitle:TTRDescription:]();
        }
      }
    }
    else
    {
      v15 = _ACLogSystem();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
        +[ACDPluginAnalyticsSender openTapToRadarWithAlertTitle:alertDescription:TTRTitle:TTRDescription:]();
      }
    }
  }
  else
  {
    v15 = _ACLogSystem();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
      +[ACDPluginAnalyticsSender openTapToRadarWithAlertTitle:alertDescription:TTRTitle:TTRDescription:].cold.4();
    }
  }
}

void __98__ACDPluginAnalyticsSender_openTapToRadarWithAlertTitle_alertDescription_TTRTitle_TTRDescription___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  v5 = _ACLogSystem();
  BOOL v6 = os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG);
  if (a3)
  {
    if (v6) {
      __98__ACDPluginAnalyticsSender_openTapToRadarWithAlertTitle_alertDescription_TTRTitle_TTRDescription___block_invoke_cold_2();
    }
  }
  else
  {
    if (v6) {
      __98__ACDPluginAnalyticsSender_openTapToRadarWithAlertTitle_alertDescription_TTRTitle_TTRDescription___block_invoke_cold_1();
    }

    objc_msgSend(*(id *)(a1 + 48), "_selected_PostTapToRadar:description:", *(void *)(a1 + 32), *(void *)(a1 + 40));
  }
}

+ (void)_selected_PostTapToRadar:(id)a3 description:(id)a4
{
  v20[7] = *MEMORY[0x263EF8340];
  id v5 = a3;
  id v6 = a4;
  if (ACIsInternal())
  {
    v7 = objc_alloc_init(MEMORY[0x263F08BA0]);
    [v7 setScheme:@"tap-to-radar"];
    [v7 setHost:@"new"];
    char v8 = [MEMORY[0x263F08BD0] queryItemWithName:@"BundleID" value:@"com.apple.accounts"];
    id v19 = v5;
    v20[0] = v8;
    uint64_t v9 = [MEMORY[0x263F08BD0] queryItemWithName:@"Title" value:v5];
    v20[1] = v9;
    id v10 = [MEMORY[0x263F08BD0] queryItemWithName:@"Description" value:v6];
    v20[2] = v10;
    id v11 = [MEMORY[0x263F08BD0] queryItemWithName:@"Classification" value:@"Crash/Hang/Data Loss"];
    v20[3] = v11;
    id v12 = [MEMORY[0x263F08BD0] queryItemWithName:@"ComponentName" value:@"Accounts"];
    v20[4] = v12;
    id v13 = [MEMORY[0x263F08BD0] queryItemWithName:@"ComponentVersion" value:@"iOS"];
    v20[5] = v13;
    double v14 = [MEMORY[0x263F08BD0] queryItemWithName:@"ComponentID" value:@"990749"];
    v20[6] = v14;
    v15 = [MEMORY[0x263EFF8C0] arrayWithObjects:v20 count:7];
    [v7 setQueryItems:v15];

    v16 = [v7 URL];

    if (v16)
    {
      v17 = [MEMORY[0x263F01880] defaultWorkspace];
      v18 = [v7 URL];
      [v17 openURL:v18 configuration:0 completionHandler:&__block_literal_global_7];
    }
    id v5 = v19;
  }
  else
  {
    v7 = _ACLogSystem();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      +[ACDPluginAnalyticsSender _selected_PostTapToRadar:description:]();
    }
  }
}

+ (void)openTapToRadarWithAlertTitle:alertDescription:TTRTitle:TTRDescription:.cold.1()
{
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_0_1(&dword_2183AD000, v0, v1, "@\"Open Tap-To-Radar offered in the last week\"", v2, v3, v4, v5, v6);
}

+ (void)openTapToRadarWithAlertTitle:alertDescription:TTRTitle:TTRDescription:.cold.2()
{
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_2_1(&dword_2183AD000, v0, v1, "@\"Offering to open Tap-To-Radar\"", v2, v3, v4, v5, v6);
}

+ (void)openTapToRadarWithAlertTitle:alertDescription:TTRTitle:TTRDescription:.cold.3()
{
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_0_1(&dword_2183AD000, v0, v1, "@\"Open Tap-To-Radar disabled\"", v2, v3, v4, v5, v6);
}

+ (void)openTapToRadarWithAlertTitle:alertDescription:TTRTitle:TTRDescription:.cold.4()
{
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_0_1(&dword_2183AD000, v0, v1, "@\"Open Tap-To-Radar called on external build\"", v2, v3, v4, v5, v6);
}

void __98__ACDPluginAnalyticsSender_openTapToRadarWithAlertTitle_alertDescription_TTRTitle_TTRDescription___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_2_1(&dword_2183AD000, v0, v1, "@\"Opening Tap-To-Radar\"", v2, v3, v4, v5, v6);
}

void __98__ACDPluginAnalyticsSender_openTapToRadarWithAlertTitle_alertDescription_TTRTitle_TTRDescription___block_invoke_cold_2()
{
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_2_1(&dword_2183AD000, v0, v1, "@\"Canceled open Tap-To-Radar\"", v2, v3, v4, v5, v6);
}

+ (void)_selected_PostTapToRadar:description:.cold.1()
{
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_0_1(&dword_2183AD000, v0, v1, "@\"_selected_PostTapToRadar Tap-To-Radar called on external build\"", v2, v3, v4, v5, v6);
}

@end