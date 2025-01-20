@interface UIAlertController(MailUI)
+ (id)mf_actionSheetWithTitle:()MailUI cancellationHandler:;
- (void)mf_addAvatarWithAvatarGenerator:()MailUI messageListItem:contactStore:brandIndicatorProvider:;
- (void)mf_addCancelActionWithHandler:()MailUI;
- (void)mf_presentConfirmationSheetFromViewController:()MailUI withSource:;
- (void)mf_presentFromViewController:()MailUI withSource:;
@end

@implementation UIAlertController(MailUI)

+ (id)mf_actionSheetWithTitle:()MailUI cancellationHandler:
{
  v5 = (void *)MEMORY[0x1E4FB1418];
  id v6 = a4;
  v7 = [v5 alertControllerWithTitle:a3 message:0 preferredStyle:0];
  [v7 setModalPresentationStyle:7];
  objc_msgSend(v7, "mf_addCancelActionWithHandler:", v6);

  return v7;
}

- (void)mf_addAvatarWithAvatarGenerator:()MailUI messageListItem:contactStore:brandIndicatorProvider:
{
  id v10 = a3;
  v11 = (objc_class *)MEMORY[0x1E4FB1EB0];
  id v12 = a6;
  id v13 = a5;
  id v14 = a4;
  id v15 = [v11 alloc];
  v16 = objc_msgSend(v15, "initWithFrame:", *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
  v17 = (void *)[objc_alloc(MEMORY[0x1E4FB1EC0]) initWithNibName:0 bundle:0];
  v18 = [[MUIAvatarImageContext alloc] initWithMessageListItem:v14 contactStore:v13 brandIndicatorProvider:v12];

  v22[0] = MEMORY[0x1E4F143A8];
  v22[1] = 3221225472;
  v22[2] = __113__UIAlertController_MailUI__mf_addAvatarWithAvatarGenerator_messageListItem_contactStore_brandIndicatorProvider___block_invoke;
  v22[3] = &unk_1E6D12818;
  id v23 = v16;
  id v24 = v17;
  uint64_t v25 = a1;
  id v19 = v17;
  id v20 = v16;
  id v21 = (id)[v10 avatarImageForContext:v18 handler:v22];
}

- (void)mf_addCancelActionWithHandler:()MailUI
{
  v4 = (void *)MEMORY[0x1E4FB1410];
  id v5 = a3;
  id v6 = _EFLocalizedString();
  id v7 = [v4 actionWithTitle:v6 style:1 handler:v5];

  [a1 addAction:v7];
}

- (void)mf_presentFromViewController:()MailUI withSource:
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [a1 popoverPresentationController];
  objc_msgSend(v6, "mui_setAsSourceForPopoverPresentationController:", v8);

  [v7 presentViewController:a1 animated:1 completion:0];
}

- (void)mf_presentConfirmationSheetFromViewController:()MailUI withSource:
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [a1 popoverPresentationController];
  if (objc_opt_respondsToSelector()) {
    objc_msgSend(v6, "mui_setAsSourceWithExtendedRectForPopoverPresentationController:", v8);
  }
  else {
    objc_msgSend(v6, "mui_setAsSourceForPopoverPresentationController:", v8);
  }

  [v7 presentViewController:a1 animated:1 completion:0];
}

@end