@interface UIViewController(GKRestrictionAlerts)
- (id)_gkInGameUIUnavailableAlertWithRestrictionMode:()GKRestrictionAlerts dismissHandler:;
@end

@implementation UIViewController(GKRestrictionAlerts)

- (id)_gkInGameUIUnavailableAlertWithRestrictionMode:()GKRestrictionAlerts dismissHandler:
{
  id v6 = a4;
  v7 = [MEMORY[0x263F40270] localPlayer];
  v8 = [MEMORY[0x263F40298] shared];
  v9 = [MEMORY[0x263F40298] shared];
  uint64_t v10 = [v9 multiplayerAllowedPlayerType];

  if (![v8 isGameCenterRestricted]
    && ![v8 lockedDown]
    && (a3 != 2 || v10)
    && (a3 == 3 || ([v7 isAuthenticated] & 1) != 0))
  {
    v14 = 0;
    v12 = 0;
    goto LABEL_13;
  }
  v11 = GKGameCenterUIFrameworkBundle();
  v12 = GKGetLocalizedStringFromTableInBundle();

  v13 = GKGameCenterUIFrameworkBundle();
  v14 = GKGetLocalizedStringFromTableInBundle();

  if (!v12)
  {
LABEL_13:
    v15 = 0;
    goto LABEL_14;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    [a1 setNavigationBarHidden:1];
  }
  [a1 setModalPresentationStyle:17];
  v15 = [MEMORY[0x263F1C3F8] alertControllerWithTitle:v12 message:v14 preferredStyle:1];
  [v15 setModalPresentationStyle:17];
  v16 = (void *)MEMORY[0x263F1C3F0];
  v17 = GKGameCenterUIFrameworkBundle();
  v18 = GKGetLocalizedStringFromTableInBundle();
  v22[0] = MEMORY[0x263EF8330];
  v22[1] = 3221225472;
  v22[2] = __103__UIViewController_GKRestrictionAlerts___gkInGameUIUnavailableAlertWithRestrictionMode_dismissHandler___block_invoke;
  v22[3] = &unk_26478A858;
  id v23 = v6;
  v19 = [v16 actionWithTitle:v18 style:0 handler:v22];
  [v15 addAction:v19];

LABEL_14:
  id v20 = v15;

  return v20;
}

@end