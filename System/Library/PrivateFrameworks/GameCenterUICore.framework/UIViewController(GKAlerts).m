@interface UIViewController(GKAlerts)
+ (id)_gkKeyWindowRootViewController;
- (id)_gkAlertControllerForBarButtonItem:()GKAlerts;
- (id)_gkPresentAlertForError:()GKAlerts title:defaultMessage:;
- (id)_gkPresentAlertWithTitle:()GKAlerts message:buttonTitle:dismissHandler:presentationCompletionHandler:;
- (id)_gkPresentConfirmationAlertWithTitle:()GKAlerts message:buttonTitle:block:cancelAction:;
- (uint64_t)_gkPresentAlertWithTitle:()GKAlerts message:buttonTitle:;
- (uint64_t)_gkPresentAlertWithTitle:()GKAlerts message:buttonTitle:dismissHandler:;
@end

@implementation UIViewController(GKAlerts)

+ (id)_gkKeyWindowRootViewController
{
  v0 = [MEMORY[0x263F1C408] sharedApplication];
  v1 = [v0 keyWindow];
  v2 = [v1 rootViewController];

  return v2;
}

- (uint64_t)_gkPresentAlertWithTitle:()GKAlerts message:buttonTitle:
{
  return [a1 _gkPresentAlertWithTitle:a3 message:a4 buttonTitle:a5 dismissHandler:0];
}

- (uint64_t)_gkPresentAlertWithTitle:()GKAlerts message:buttonTitle:dismissHandler:
{
  return [a1 _gkPresentAlertWithTitle:a3 message:a4 buttonTitle:a5 dismissHandler:a6 presentationCompletionHandler:0];
}

- (id)_gkPresentAlertWithTitle:()GKAlerts message:buttonTitle:dismissHandler:presentationCompletionHandler:
{
  id v12 = a6;
  v13 = (void *)MEMORY[0x263F1C3F8];
  id v14 = a7;
  id v15 = a5;
  v16 = [v13 alertControllerWithTitle:a3 message:a4 preferredStyle:1];
  v17 = (void *)MEMORY[0x263F1C3F0];
  v21[0] = MEMORY[0x263EF8330];
  v21[1] = 3221225472;
  v21[2] = __120__UIViewController_GKAlerts___gkPresentAlertWithTitle_message_buttonTitle_dismissHandler_presentationCompletionHandler___block_invoke;
  v21[3] = &unk_26478A858;
  id v22 = v12;
  id v18 = v12;
  v19 = [v17 actionWithTitle:v15 style:0 handler:v21];

  [v16 addAction:v19];
  [a1 presentViewController:v16 animated:1 completion:v14];

  return v16;
}

- (id)_gkPresentConfirmationAlertWithTitle:()GKAlerts message:buttonTitle:block:cancelAction:
{
  id v12 = a6;
  v13 = (void *)MEMORY[0x263F1C3F8];
  id v14 = a7;
  id v15 = a5;
  v16 = [v13 alertControllerWithTitle:a3 message:a4 preferredStyle:1];
  v17 = (void *)MEMORY[0x263F1C3F0];
  v21[0] = MEMORY[0x263EF8330];
  v21[1] = 3221225472;
  v21[2] = __106__UIViewController_GKAlerts___gkPresentConfirmationAlertWithTitle_message_buttonTitle_block_cancelAction___block_invoke;
  v21[3] = &unk_26478A858;
  id v22 = v12;
  id v18 = v12;
  v19 = [v17 actionWithTitle:v15 style:0 handler:v21];

  [v16 addAction:v19];
  [v16 _gkAddCancelButtonWithAction:v14];

  [v16 setPreferredAction:v19];
  [a1 presentViewController:v16 animated:1 completion:0];

  return v16;
}

- (id)_gkPresentAlertForError:()GKAlerts title:defaultMessage:
{
  id v9 = a3;
  id v10 = a4;
  unint64_t v11 = a5;
  if (v9)
  {
    if (v10) {
      goto LABEL_3;
    }
  }
  else
  {
    id v22 = [MEMORY[0x263F08690] currentHandler];
    [v22 handleFailureInMethod:a2, a1, @"UIViewController+GKAlerts.m", 99, @"Invalid parameter not satisfying: %@", @"error != nil" object file lineNumber description];

    if (v10) {
      goto LABEL_3;
    }
  }
  v23 = [MEMORY[0x263F08690] currentHandler];
  [v23 handleFailureInMethod:a2, a1, @"UIViewController+GKAlerts.m", 100, @"Invalid parameter not satisfying: %@", @"title != nil" object file lineNumber description];

LABEL_3:
  uint64_t v12 = [v9 localizedDescription];
  v13 = (void *)v12;
  if (v11 | v12)
  {
    id v14 = (id)v12;
    if (v13) {
      goto LABEL_6;
    }
  }
  else
  {
    v24 = [MEMORY[0x263F08690] currentHandler];
    [v24 handleFailureInMethod:a2, a1, @"UIViewController+GKAlerts.m", 103, @"Invalid parameter not satisfying: %@", @"localizedDescription != nil || defaultMessage != nil" object file lineNumber description];
  }
  id v14 = (id)v11;
LABEL_6:
  id v15 = v14;
  v16 = [MEMORY[0x263F1C3F8] alertControllerWithTitle:v10 message:v14 preferredStyle:1];
  v17 = (void *)MEMORY[0x263F1C3F0];
  id v18 = GKGameCenterUIFrameworkBundle();
  v19 = GKGetLocalizedStringFromTableInBundle();
  v20 = [v17 actionWithTitle:v19 style:0 handler:&__block_literal_global_12];

  [v16 addAction:v20];
  [a1 presentViewController:v16 animated:1 completion:0];

  return v16;
}

- (id)_gkAlertControllerForBarButtonItem:()GKAlerts
{
  id v3 = a3;
  v4 = [MEMORY[0x263F1C3F8] alertControllerWithTitle:0 message:0 preferredStyle:0];
  v5 = [MEMORY[0x263F1C5C0] currentDevice];
  uint64_t v6 = [v5 userInterfaceIdiom];

  if (v6 == 1 && (!*MEMORY[0x263F402F8] || _GKIsRemoteUIUsingPadIdiom != 0))
  {
    [v4 setModalPresentationStyle:7];
    v8 = [v4 popoverPresentationController];
    [v8 setPermittedArrowDirections:15];
    [v8 setBarButtonItem:v3];
  }
  return v4;
}

@end