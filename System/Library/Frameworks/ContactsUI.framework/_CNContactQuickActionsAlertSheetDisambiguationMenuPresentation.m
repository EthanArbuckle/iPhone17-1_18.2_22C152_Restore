@interface _CNContactQuickActionsAlertSheetDisambiguationMenuPresentation
- (id)viewControllerForPresentingActionsController:(id)a3 fromView:(id)a4 dismissDisambiguationMenuHandler:(id)a5;
@end

@implementation _CNContactQuickActionsAlertSheetDisambiguationMenuPresentation

- (id)viewControllerForPresentingActionsController:(id)a3 fromView:(id)a4 dismissDisambiguationMenuHandler:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  v10 = (void *)MEMORY[0x1E4FB1418];
  id v11 = a3;
  v12 = [v10 alertControllerWithTitle:0 message:0 preferredStyle:0];
  v24.receiver = self;
  v24.super_class = (Class)_CNContactQuickActionsAlertSheetDisambiguationMenuPresentation;
  v13 = [(CNContactQuickActionsDisambiguationMenuPresentation *)&v24 viewControllerForPresentingActionsController:v11 fromView:v8 dismissDisambiguationMenuHandler:v9];

  [v12 setContentViewController:v13];
  v14 = (void *)MEMORY[0x1E4FB1410];
  v15 = CNContactsUIBundle();
  v16 = [v15 localizedStringForKey:@"CANCEL" value:&stru_1ED8AC728 table:@"Localized"];
  v22[0] = MEMORY[0x1E4F143A8];
  v22[1] = 3221225472;
  v22[2] = __153___CNContactQuickActionsAlertSheetDisambiguationMenuPresentation_viewControllerForPresentingActionsController_fromView_dismissDisambiguationMenuHandler___block_invoke;
  v22[3] = &unk_1E549A818;
  id v23 = v9;
  id v17 = v9;
  v18 = [v14 actionWithTitle:v16 style:1 handler:v22];
  [v12 addAction:v18];

  v19 = [v12 popoverPresentationController];
  v20 = v19;
  if (v19)
  {
    [v19 setSourceView:v8];
    [v8 bounds];
    objc_msgSend(v20, "setSourceRect:");
  }

  return v12;
}

@end