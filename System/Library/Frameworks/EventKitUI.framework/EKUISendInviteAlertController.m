@interface EKUISendInviteAlertController
+ (id)newAlertControllerWithCompletionHandler:(id)a3;
+ (id)presentInviteAlertWithOptions:(unint64_t)a3 viewController:(id)a4 withCompletionHandler:(id)a5;
- (BOOL)_useSheetForViewController:(id)a3;
- (EKUISendInviteAlertController)strongSelf;
- (UIAlertController)alertController;
- (id)alertIconImage;
- (id)completionHandler;
- (void)_cleanup;
- (void)_completeWithSelection:(int)a3;
- (void)_presentAlertWithOptions:(unint64_t)a3 viewController:(id)a4;
- (void)cancelAnimated:(BOOL)a3;
- (void)dealloc;
- (void)setAlertController:(id)a3;
- (void)setCompletionHandler:(id)a3;
- (void)setStrongSelf:(id)a3;
@end

@implementation EKUISendInviteAlertController

+ (id)newAlertControllerWithCompletionHandler:(id)a3
{
  id v3 = a3;
  v4 = objc_opt_new();
  [v4 setCompletionHandler:v3];

  [v4 setStrongSelf:v4];
  return v4;
}

+ (id)presentInviteAlertWithOptions:(unint64_t)a3 viewController:(id)a4 withCompletionHandler:(id)a5
{
  id v8 = a4;
  v9 = (void *)[a1 newAlertControllerWithCompletionHandler:a5];
  [v9 _presentAlertWithOptions:a3 viewController:v8];

  return v9;
}

- (void)dealloc
{
  [(EKUISendInviteAlertController *)self cancelAnimated:0];
  v3.receiver = self;
  v3.super_class = (Class)EKUISendInviteAlertController;
  [(EKUISendInviteAlertController *)&v3 dealloc];
}

- (BOOL)_useSheetForViewController:(id)a3
{
  id v3 = a3;
  v4 = [v3 view];
  if (EKUICurrentHeightSizeClassIsCompact(v4)) {
    goto LABEL_4;
  }
  v5 = [v3 view];
  if (EKUICurrentWidthSizeClassIsCompactInViewHierarchy(v5))
  {

LABEL_4:
    BOOL v6 = 1;
    goto LABEL_5;
  }
  BOOL v6 = 1;
  char v8 = [v3 _isInContextOfPresentationControllerOfClass:objc_opt_class() effective:1];

  if (v8) {
    goto LABEL_6;
  }
  v4 = [v3 _popoverController];
  BOOL v6 = v4 != 0;
LABEL_5:

LABEL_6:
  return v6;
}

- (id)alertIconImage
{
  id v2 = objc_alloc(MEMORY[0x1E4F6F248]);
  id v3 = (void *)[v2 initWithBundleIdentifier:*MEMORY[0x1E4F57868]];
  v4 = [MEMORY[0x1E4FB1BA8] mainScreen];
  [v4 scale];
  double v6 = v5;

  v7 = objc_msgSend(objc_alloc(MEMORY[0x1E4F6F258]), "initWithSize:scale:", 100.0, 100.0, v6);
  char v8 = [v3 imageForDescriptor:v7];
  if ([v8 placeholder])
  {
    uint64_t v9 = [v3 prepareImageForDescriptor:v7];

    char v8 = (void *)v9;
  }
  v10 = objc_msgSend(objc_alloc(MEMORY[0x1E4FB1818]), "initWithCGImage:", objc_msgSend(v8, "CGImage"));

  return v10;
}

- (void)_presentAlertWithOptions:(unint64_t)a3 viewController:(id)a4
{
  char v4 = a3;
  id v6 = a4;
  if (v6)
  {
    uint64_t v7 = [(EKUISendInviteAlertController *)self _useSheetForViewController:v6] ^ 1;
    if ((v4 & 0x10) != 0)
    {
      char v8 = EventKitUIBundle();
      uint64_t v9 = v8;
      v10 = @"Send invitations to all attendees?";
    }
    else if ((v4 & 8) != 0)
    {
      char v8 = EventKitUIBundle();
      uint64_t v9 = v8;
      v10 = @"Propose new time?";
    }
    else
    {
      if ((v4 & 4) != 0)
      {
        v32 = EventKitUIBundle();
        v12 = [v32 localizedStringForKey:@"Time was changed" value:&stru_1F0CC2140 table:0];

        uint64_t v9 = EventKitUIBundle();
        v13 = [v9 localizedStringForKey:@"Notify all invitees?" value:&stru_1F0CC2140 table:0];
        goto LABEL_13;
      }
      char v8 = EventKitUIBundle();
      uint64_t v9 = v8;
      if ((v4 & 2) != 0)
      {
        if (v4) {
          v10 = @"You have removed an invitee";
        }
        else {
          v10 = @"You have removed invitees";
        }
      }
      else if (v4)
      {
        v10 = @"You have pending invitees";
      }
      else
      {
        v10 = @"You have a pending invite";
      }
    }
    v12 = [v8 localizedStringForKey:v10 value:&stru_1F0CC2140 table:0];
    v13 = 0;
LABEL_13:

    v14 = [MEMORY[0x1E4FB1418] alertControllerWithTitle:v12 message:v13 preferredStyle:v7];
    alertController = self->_alertController;
    self->_alertController = v14;

    v16 = [(EKUISendInviteAlertController *)self alertIconImage];
    [(UIAlertController *)self->_alertController setImage:v16];

    objc_initWeak(buf, self);
    v17 = self->_alertController;
    v18 = (void *)MEMORY[0x1E4FB1410];
    v19 = EventKitUIBundle();
    v20 = [v19 localizedStringForKey:@"Send" value:&stru_1F0CC2140 table:0];
    v37[0] = MEMORY[0x1E4F143A8];
    v37[1] = 3221225472;
    v37[2] = __73__EKUISendInviteAlertController__presentAlertWithOptions_viewController___block_invoke;
    v37[3] = &unk_1E6088F20;
    objc_copyWeak(&v38, buf);
    v21 = [v18 actionWithTitle:v20 style:0 handler:v37];
    [(UIAlertController *)v17 addAction:v21];

    if ((v4 & 0x10) == 0)
    {
      v22 = self->_alertController;
      v23 = (void *)MEMORY[0x1E4FB1410];
      v24 = EventKitUIBundle();
      v25 = [v24 localizedStringForKey:@"Discard Changes" value:&stru_1F0CC2140 table:0];
      v35[0] = MEMORY[0x1E4F143A8];
      v35[1] = 3221225472;
      v35[2] = __73__EKUISendInviteAlertController__presentAlertWithOptions_viewController___block_invoke_2;
      v35[3] = &unk_1E6088F20;
      objc_copyWeak(&v36, buf);
      v26 = [v23 actionWithTitle:v25 style:2 handler:v35];
      [(UIAlertController *)v22 addAction:v26];

      objc_destroyWeak(&v36);
    }
    v27 = self->_alertController;
    v28 = (void *)MEMORY[0x1E4FB1410];
    v29 = EventKitUIBundle();
    v30 = [v29 localizedStringForKey:@"Cancel - send invite alert controller" value:@"Cancel" table:0];
    v33[0] = MEMORY[0x1E4F143A8];
    v33[1] = 3221225472;
    v33[2] = __73__EKUISendInviteAlertController__presentAlertWithOptions_viewController___block_invoke_3;
    v33[3] = &unk_1E6088F20;
    objc_copyWeak(&v34, buf);
    v31 = [v28 actionWithTitle:v30 style:1 handler:v33];
    [(UIAlertController *)v27 addAction:v31];

    [v6 presentViewController:self->_alertController animated:1 completion:0];
    objc_destroyWeak(&v34);
    objc_destroyWeak(&v38);
    objc_destroyWeak(buf);

    goto LABEL_16;
  }
  v11 = kEKUILogHandle;
  if (os_log_type_enabled((os_log_t)kEKUILogHandle, OS_LOG_TYPE_ERROR))
  {
    LOWORD(buf[0]) = 0;
    _os_log_impl(&dword_1B3F4C000, v11, OS_LOG_TYPE_ERROR, "Presenting a alert requires a view controller.", (uint8_t *)buf, 2u);
  }
LABEL_16:
}

void __73__EKUISendInviteAlertController__presentAlertWithOptions_viewController___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _completeWithSelection:0];
}

void __73__EKUISendInviteAlertController__presentAlertWithOptions_viewController___block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _completeWithSelection:1];
}

void __73__EKUISendInviteAlertController__presentAlertWithOptions_viewController___block_invoke_3(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _completeWithSelection:2];
}

- (void)cancelAnimated:(BOOL)a3
{
  BOOL v3 = a3;
  if (([(UIAlertController *)self->_alertController isBeingDismissed] & 1) == 0)
  {
    alertController = self->_alertController;
    [(UIAlertController *)alertController dismissViewControllerAnimated:v3 completion:0];
  }
}

- (void)_completeWithSelection:(int)a3
{
  completionHandler = (void (**)(id, void))self->_completionHandler;
  if (completionHandler) {
    completionHandler[2](completionHandler, *(void *)&a3);
  }

  [(EKUISendInviteAlertController *)self _cleanup];
}

- (void)_cleanup
{
  [(EKUISendInviteAlertController *)self setStrongSelf:0];
  id completionHandler = self->_completionHandler;
  self->_id completionHandler = 0;

  alertController = self->_alertController;
  self->_alertController = 0;
}

- (id)completionHandler
{
  return objc_getProperty(self, a2, 8, 1);
}

- (void)setCompletionHandler:(id)a3
{
}

- (UIAlertController)alertController
{
  return (UIAlertController *)objc_getProperty(self, a2, 16, 1);
}

- (void)setAlertController:(id)a3
{
}

- (EKUISendInviteAlertController)strongSelf
{
  return (EKUISendInviteAlertController *)objc_getProperty(self, a2, 24, 1);
}

- (void)setStrongSelf:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_strongSelf, 0);
  objc_storeStrong((id *)&self->_alertController, 0);

  objc_storeStrong(&self->_completionHandler, 0);
}

@end