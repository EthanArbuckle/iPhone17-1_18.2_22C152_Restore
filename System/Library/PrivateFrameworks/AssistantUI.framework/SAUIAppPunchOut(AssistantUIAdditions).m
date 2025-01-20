@interface SAUIAppPunchOut(AssistantUIAdditions)
- (id)_afui_installAppPunchout;
- (id)afui_punchOutAppNotAvailableViews;
- (id)afui_punchOutFailureViews;
- (void)afui_getInstallAppPunchoutWithCompletion:()AssistantUIAdditions;
- (void)afui_populateStoreServicesData:()AssistantUIAdditions;
@end

@implementation SAUIAppPunchOut(AssistantUIAdditions)

- (void)afui_populateStoreServicesData:()AssistantUIAdditions
{
  id v4 = a3;
  v5 = [a1 bundleId];
  if (v5)
  {
    v6 = dispatch_get_global_queue(0, 0);
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __72__SAUIAppPunchOut_AssistantUIAdditions__afui_populateStoreServicesData___block_invoke;
    block[3] = &unk_2646926A0;
    id v8 = v5;
    v9 = a1;
    id v10 = v4;
    dispatch_async(v6, block);
  }
  else if (v4)
  {
    (*((void (**)(id, void))v4 + 2))(v4, 0);
  }
}

- (id)afui_punchOutFailureViews
{
  v1 = [a1 appDisplayName];
  if (v1)
  {
    v2 = NSString;
    v3 = objc_msgSend(MEMORY[0x263F086E0], "afui_assistantUIFrameworkBundle");
    id v4 = [v3 assistantUILocalizedStringForKey:@"PUNCHOUT_FAILURE_FOR_APP" table:@"Localizable"];
    v5 = [v2 stringWithValidatedFormat:v4, @"%@", 0, v1 validFormatSpecifiers error];

    v6 = NSString;
    v7 = objc_msgSend(MEMORY[0x263F086E0], "afui_assistantUIFrameworkBundle");
    id v8 = [v7 assistantUILocalizedStringForKey:@"SPEAKABLE_PUNCHOUT_FAILURE_FOR_APP" table:@"Localizable"];
    v9 = [v6 stringWithValidatedFormat:v8, @"%@%@", 0, @"@{tts#\x1B\\pause=500\\}", v1 validFormatSpecifiers error];
  }
  else
  {
    id v10 = objc_msgSend(MEMORY[0x263F086E0], "afui_assistantUIFrameworkBundle");
    v5 = [v10 assistantUILocalizedStringForKey:@"PUNCHOUT_FAILURE_GENERIC" table:@"Localizable"];

    v7 = objc_msgSend(MEMORY[0x263F086E0], "afui_assistantUIFrameworkBundle");
    v9 = [v7 assistantUILocalizedStringForKey:@"PUNCHOUT_FAILURE_GENERIC" table:@"Localizable"];
  }

  id v11 = objc_alloc_init(MEMORY[0x263EFF980]);
  id v12 = objc_alloc_init(MEMORY[0x263F64EF0]);
  [v12 setText:v5];
  [v12 setSpeakableText:v9];
  [v11 addObject:v12];
  id v13 = objc_alloc_init(MEMORY[0x263F64ED8]);
  v14 = [MEMORY[0x263F08C38] UUID];
  v15 = [v14 UUIDString];
  [v13 setAceId:v15];

  [v13 setDialogPhase:*MEMORY[0x263F65DF8]];
  [v13 setViews:v11];

  return v13;
}

- (id)afui_punchOutAppNotAvailableViews
{
  v1 = [a1 appDisplayName];
  if (v1)
  {
    v2 = NSString;
    v3 = objc_msgSend(MEMORY[0x263F086E0], "afui_assistantUIFrameworkBundle");
    id v4 = [v3 assistantUILocalizedStringForKey:@"PUNCHOUT_APP_NOT_AVAILABLE_IN_STOREFRONT" table:@"Localizable"];
    v5 = [v2 stringWithValidatedFormat:v4, @"%@", 0, v1 validFormatSpecifiers error];

    v6 = NSString;
    v7 = objc_msgSend(MEMORY[0x263F086E0], "afui_assistantUIFrameworkBundle");
    id v8 = [v7 assistantUILocalizedStringForKey:@"SPEAKABLE_PUNCHOUT_APP_NOT_AVAILABLE_IN_STOREFRONT" table:@"Localizable"];
    v9 = [v6 stringWithValidatedFormat:v8, @"%@%@", 0, @"@{tts#\x1B\\pause=500\\}", v1 validFormatSpecifiers error];
  }
  else
  {
    id v10 = objc_msgSend(MEMORY[0x263F086E0], "afui_assistantUIFrameworkBundle");
    v5 = [v10 assistantUILocalizedStringForKey:@"PUNCHOUT_FAILURE_GENERIC" table:@"Localizable"];

    v7 = objc_msgSend(MEMORY[0x263F086E0], "afui_assistantUIFrameworkBundle");
    v9 = [v7 assistantUILocalizedStringForKey:@"PUNCHOUT_FAILURE_GENERIC" table:@"Localizable"];
  }

  id v11 = objc_alloc_init(MEMORY[0x263EFF980]);
  id v12 = objc_alloc_init(MEMORY[0x263F64EF0]);
  [v12 setText:v5];
  [v12 setSpeakableText:v9];
  [v11 addObject:v12];
  id v13 = objc_alloc_init(MEMORY[0x263F64ED8]);
  v14 = [MEMORY[0x263F08C38] UUID];
  v15 = [v14 UUIDString];
  [v13 setAceId:v15];

  [v13 setDialogPhase:*MEMORY[0x263F65DF8]];
  [v13 setViews:v11];

  return v13;
}

- (void)afui_getInstallAppPunchoutWithCompletion:()AssistantUIAdditions
{
  id v4 = a3;
  if (v4)
  {
    v5 = [a1 bundleId];
    if (v5)
    {
      v6 = [a1 dictionary];
      v7 = [v6 objectForKey:@"AFUIStoreServicesData"];

      if (v7)
      {
        id v8 = objc_msgSend(a1, "_afui_installAppPunchout");
        v4[2](v4, v8);
      }
      else
      {
        v9[0] = MEMORY[0x263EF8330];
        v9[1] = 3221225472;
        v9[2] = __82__SAUIAppPunchOut_AssistantUIAdditions__afui_getInstallAppPunchoutWithCompletion___block_invoke;
        v9[3] = &unk_264692018;
        v9[4] = a1;
        id v10 = v4;
        objc_msgSend(a1, "afui_populateStoreServicesData:", v9);
      }
    }
    else
    {
      v4[2](v4, 0);
    }
  }
}

- (id)_afui_installAppPunchout
{
  id v2 = [a1 appStoreUri];

  if (v2)
  {
    id v2 = objc_alloc_init(MEMORY[0x263F64F08]);
    v3 = NSString;
    id v4 = objc_msgSend(MEMORY[0x263F086E0], "afui_assistantUIFrameworkBundle");
    v5 = [v4 assistantUILocalizedStringForKey:@"INSTALL_APP_BUTTON_TITLE" table:@"Localizable"];
    v6 = [a1 appDisplayName];
    v7 = [v3 stringWithValidatedFormat:v5, @"%@", 0, v6 validFormatSpecifiers error];

    [v2 setText:v7];
    id v8 = objc_alloc_init(MEMORY[0x263F64EE0]);
    [v8 setAppAvailableInStorefront:1];
    v9 = [a1 appStoreUri];
    [v8 setPunchOutUri:v9];

    id v10 = [MEMORY[0x263EFF8C0] arrayWithObject:v8];
    [v2 setCommands:v10];
  }

  return v2;
}

@end