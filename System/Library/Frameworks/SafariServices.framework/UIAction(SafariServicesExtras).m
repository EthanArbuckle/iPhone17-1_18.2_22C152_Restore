@interface UIAction(SafariServicesExtras)
+ (id)_sf_debugKillWebProcessActionForWebView:()SafariServicesExtras;
+ (id)_sf_openInNewTabActionWithHandler:()SafariServicesExtras;
+ (id)_sf_openInNewTabActionWithTabOrder:()SafariServicesExtras handler:identifierSuffix:;
+ (id)_sf_openInNewTabActionsWithHandler:()SafariServicesExtras identifierSuffix:;
+ (id)safari_actionWithTarget:()SafariServicesExtras selector:;
+ (uint64_t)_sf_openInNewTabActionsWithHandler:()SafariServicesExtras;
@end

@implementation UIAction(SafariServicesExtras)

+ (id)safari_actionWithTarget:()SafariServicesExtras selector:
{
  id v5 = a3;
  objc_initWeak(&location, v5);
  v6 = (void *)MEMORY[0x1E4FB13F0];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __67__UIAction_SafariServicesExtras__safari_actionWithTarget_selector___block_invoke;
  v9[3] = &unk_1E5C74AF8;
  objc_copyWeak(v10, &location);
  BOOL v11 = v5 == 0;
  v10[1] = a4;
  v7 = [v6 actionWithHandler:v9];
  objc_destroyWeak(v10);
  objc_destroyWeak(&location);

  return v7;
}

+ (id)_sf_openInNewTabActionWithHandler:()SafariServicesExtras
{
  id v3 = a3;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __68__UIAction_SafariServicesExtras___sf_openInNewTabActionWithHandler___block_invoke;
  v8[3] = &unk_1E5C735F0;
  id v9 = v3;
  id v4 = v3;
  id v5 = (void *)MEMORY[0x1AD0C36A0](v8);
  v6 = objc_msgSend(MEMORY[0x1E4FB13F0], "_sf_openInNewTabActionWithTabOrder:handler:identifierSuffix:", 0, v5, 0);

  return v6;
}

+ (uint64_t)_sf_openInNewTabActionsWithHandler:()SafariServicesExtras
{
  return objc_msgSend(a1, "_sf_openInNewTabActionsWithHandler:identifierSuffix:", a3, 0);
}

+ (id)_sf_openInNewTabActionsWithHandler:()SafariServicesExtras identifierSuffix:
{
  v12[2] = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  id v7 = a3;
  v8 = objc_msgSend(a1, "_sf_openInNewTabActionWithTabOrder:handler:identifierSuffix:", 1, v7, v6);
  v12[0] = v8;
  id v9 = objc_msgSend(a1, "_sf_openInNewTabActionWithTabOrder:handler:identifierSuffix:", 2, v7, v6);

  v12[1] = v9;
  v10 = [MEMORY[0x1E4F1C978] arrayWithObjects:v12 count:2];

  return v10;
}

+ (id)_sf_openInNewTabActionWithTabOrder:()SafariServicesExtras handler:identifierSuffix:
{
  id v7 = a4;
  id v8 = a5;
  uint64_t v9 = [MEMORY[0x1E4F78590] effectiveTabOrderWithPreferredTabOrder:a3];
  v10 = _WBSLocalizedString();
  BOOL v11 = [MEMORY[0x1E4FB1818] systemImageNamed:@"plus.square.on.square"];
  v12 = (void *)MEMORY[0x1E4FB13F0];
  uint64_t v19 = MEMORY[0x1E4F143A8];
  uint64_t v20 = 3221225472;
  v21 = __94__UIAction_SafariServicesExtras___sf_openInNewTabActionWithTabOrder_handler_identifierSuffix___block_invoke;
  v22 = &unk_1E5C74B20;
  id v13 = v7;
  id v23 = v13;
  uint64_t v24 = a3;
  v14 = [v12 actionWithTitle:v10 image:v11 identifier:0 handler:&v19];
  v15 = v14;
  if (v8)
  {
    v16 = @"Foreground";
    if (v9 == 2) {
      v16 = @"Background";
    }
    v17 = [NSString stringWithFormat:@"OpenInNewTab%@%@", v16, v8, v19, v20, v21, v22];
    [v15 setAccessibilityIdentifier:v17];
  }
  else
  {
    [v14 setAccessibilityIdentifier:0];
  }

  return v15;
}

+ (id)_sf_debugKillWebProcessActionForWebView:()SafariServicesExtras
{
  id v3 = a3;
  id v4 = (void *)MEMORY[0x1E4FB13F0];
  id v5 = [MEMORY[0x1E4FB1818] systemImageNamed:@"trash"];
  uint64_t v12 = MEMORY[0x1E4F143A8];
  uint64_t v13 = 3221225472;
  v14 = __74__UIAction_SafariServicesExtras___sf_debugKillWebProcessActionForWebView___block_invoke;
  v15 = &unk_1E5C72170;
  id v16 = v3;
  id v6 = v3;
  id v7 = [v4 actionWithTitle:@"Kill Web Process" image:v5 identifier:0 handler:&v12];

  [v7 setAttributes:2];
  id v8 = NSString;
  uint64_t v9 = [v6 _webProcessIdentifier];
  v10 = objc_msgSend(v8, "stringWithFormat:", @"PID %d", v9, v12, v13, v14, v15);
  [v7 setSubtitle:v10];

  [v7 setAccessibilityIdentifier:@"KillWebProcess"];

  return v7;
}

@end