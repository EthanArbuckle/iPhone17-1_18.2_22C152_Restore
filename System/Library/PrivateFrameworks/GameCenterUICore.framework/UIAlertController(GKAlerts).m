@interface UIAlertController(GKAlerts)
- (void)_gkAddCancelButtonWithAction:()GKAlerts;
@end

@implementation UIAlertController(GKAlerts)

- (void)_gkAddCancelButtonWithAction:()GKAlerts
{
  id v4 = a3;
  v5 = (void *)MEMORY[0x263F1C3F0];
  v6 = GKGameCenterUIFrameworkBundle();
  v7 = GKGetLocalizedStringFromTableInBundle();
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __60__UIAlertController_GKAlerts___gkAddCancelButtonWithAction___block_invoke;
  v10[3] = &unk_26478A858;
  id v11 = v4;
  id v8 = v4;
  v9 = [v5 actionWithTitle:v7 style:1 handler:v10];

  [a1 addAction:v9];
}

@end