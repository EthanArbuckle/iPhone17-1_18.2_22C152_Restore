@interface UIAlertController(DisembarkUI)
+ (id)dkui_unknownFailureAlertControllerWithCompletion:()DisembarkUI;
@end

@implementation UIAlertController(DisembarkUI)

+ (id)dkui_unknownFailureAlertControllerWithCompletion:()DisembarkUI
{
  id v3 = a3;
  v4 = (void *)MEMORY[0x263F1C3F8];
  v5 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  v6 = [v5 localizedStringForKey:@"UNKNOWN_FAILURE_TITLE" value:&stru_26EAA9F58 table:@"Localizable"];
  v7 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  v8 = [v7 localizedStringForKey:@"UNKNOWN_FAILURE_MESSAGE" value:&stru_26EAA9F58 table:@"Localizable"];
  v9 = [v4 alertControllerWithTitle:v6 message:v8 preferredStyle:1];

  v10 = (void *)MEMORY[0x263F1C3F0];
  v11 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  v12 = [v11 localizedStringForKey:@"UNKNOWN_FAILURE_BUTTON_TITLE" value:&stru_26EAA9F58 table:@"Localizable"];
  v16[0] = MEMORY[0x263EF8330];
  v16[1] = 3221225472;
  v16[2] = __83__UIAlertController_DisembarkUI__dkui_unknownFailureAlertControllerWithCompletion___block_invoke;
  v16[3] = &unk_264CF0C48;
  id v17 = v3;
  id v13 = v3;
  v14 = [v10 actionWithTitle:v12 style:0 handler:v16];
  [v9 addAction:v14];

  return v9;
}

@end