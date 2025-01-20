@interface EKUIDeclineCommentController
+ (id)_newDeclineCommentControllerWithCompletionBlock:(id)a3;
+ (id)presentDeclineCommentAlertWithOrganizer:(id)a3 currentComment:(id)a4 viewController:(id)a5 completionBlock:(id)a6;
- (void)_completeWithButton:(unint64_t)a3;
- (void)_presentAlertWithOrganizer:(id)a3 currentComment:(id)a4 viewController:(id)a5;
- (void)dealloc;
- (void)dismissAnimated:(BOOL)a3;
@end

@implementation EKUIDeclineCommentController

+ (id)_newDeclineCommentControllerWithCompletionBlock:(id)a3
{
  id v3 = a3;
  if (_newDeclineCommentControllerWithCompletionBlock__onceToken != -1) {
    dispatch_once(&_newDeclineCommentControllerWithCompletionBlock__onceToken, &__block_literal_global_23);
  }
  v4 = objc_opt_new();
  objc_initWeak(&location, v4);
  [(id)_newDeclineCommentControllerWithCompletionBlock__s_controllers addObject:v4];
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __80__EKUIDeclineCommentController__newDeclineCommentControllerWithCompletionBlock___block_invoke_2;
  aBlock[3] = &unk_1E6088ED0;
  id v10 = v3;
  id v5 = v3;
  objc_copyWeak(&v11, &location);
  v6 = _Block_copy(aBlock);
  v7 = (void *)v4[3];
  v4[3] = v6;

  objc_destroyWeak(&v11);
  objc_destroyWeak(&location);
  return v4;
}

void __80__EKUIDeclineCommentController__newDeclineCommentControllerWithCompletionBlock___block_invoke()
{
  uint64_t v0 = objc_opt_new();
  v1 = (void *)_newDeclineCommentControllerWithCompletionBlock__s_controllers;
  _newDeclineCommentControllerWithCompletionBlock__s_controllers = v0;
}

void __80__EKUIDeclineCommentController__newDeclineCommentControllerWithCompletionBlock___block_invoke_2(uint64_t a1, void *a2, uint64_t a3)
{
  id v5 = a2;
  uint64_t v6 = *(void *)(a1 + 32);
  id v11 = v5;
  if (v6) {
    (*(void (**)(uint64_t, id, uint64_t))(v6 + 16))(v6, v5, a3);
  }
  v7 = (id *)(a1 + 40);
  id WeakRetained = objc_loadWeakRetained(v7);

  if (WeakRetained)
  {
    v9 = (void *)_newDeclineCommentControllerWithCompletionBlock__s_controllers;
    id v10 = objc_loadWeakRetained(v7);
    [v9 removeObject:v10];
  }
}

+ (id)presentDeclineCommentAlertWithOrganizer:(id)a3 currentComment:(id)a4 viewController:(id)a5 completionBlock:(id)a6
{
  id v10 = a5;
  id v11 = a4;
  id v12 = a3;
  v13 = (void *)[a1 _newDeclineCommentControllerWithCompletionBlock:a6];
  [v13 _presentAlertWithOrganizer:v12 currentComment:v11 viewController:v10];

  return v13;
}

- (void)dealloc
{
  [(EKUIDeclineCommentController *)self dismissAnimated:0];
  v3.receiver = self;
  v3.super_class = (Class)EKUIDeclineCommentController;
  [(EKUIDeclineCommentController *)&v3 dealloc];
}

- (void)_presentAlertWithOrganizer:(id)a3 currentComment:(id)a4 viewController:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v33 = a5;
  id v10 = (void *)MEMORY[0x1E4FB1418];
  id v11 = EventKitUIBundle();
  id v12 = [v11 localizedStringForKey:@"Decline Event" value:&stru_1F0CC2140 table:0];
  v13 = NSString;
  v14 = EventKitUIBundle();
  v15 = [v14 localizedStringForKey:@"Enter an optional comment to %@." value:&stru_1F0CC2140 table:0];
  v32 = v8;
  v16 = CUIKDisplayStringForNotificationIdentity();
  v17 = objc_msgSend(v13, "localizedStringWithFormat:", v15, v16);
  v18 = [v10 alertControllerWithTitle:v12 message:v17 preferredStyle:1];
  alertController = self->_alertController;
  self->_alertController = v18;

  objc_initWeak(location, self);
  v20 = self->_alertController;
  v38[0] = MEMORY[0x1E4F143A8];
  v38[1] = 3221225472;
  v38[2] = __89__EKUIDeclineCommentController__presentAlertWithOrganizer_currentComment_viewController___block_invoke;
  v38[3] = &unk_1E6088EF8;
  id v21 = v9;
  id v39 = v21;
  objc_copyWeak(&v40, location);
  [(UIAlertController *)v20 addTextFieldWithConfigurationHandler:v38];
  v22 = self->_alertController;
  v23 = (void *)MEMORY[0x1E4FB1410];
  v24 = EventKitUIBundle();
  v25 = [v24 localizedStringForKey:@"Cancel decline" value:@"Cancel" table:0];
  v36[0] = MEMORY[0x1E4F143A8];
  v36[1] = 3221225472;
  v36[2] = __89__EKUIDeclineCommentController__presentAlertWithOrganizer_currentComment_viewController___block_invoke_2;
  v36[3] = &unk_1E6088F20;
  objc_copyWeak(&v37, location);
  v26 = [v23 actionWithTitle:v25 style:1 handler:v36];
  [(UIAlertController *)v22 addAction:v26];

  v27 = self->_alertController;
  v28 = (void *)MEMORY[0x1E4FB1410];
  v29 = EventKitUIBundle();
  v30 = [v29 localizedStringForKey:@"Decline" value:&stru_1F0CC2140 table:0];
  v34[0] = MEMORY[0x1E4F143A8];
  v34[1] = 3221225472;
  v34[2] = __89__EKUIDeclineCommentController__presentAlertWithOrganizer_currentComment_viewController___block_invoke_3;
  v34[3] = &unk_1E6088F20;
  objc_copyWeak(&v35, location);
  v31 = [v28 actionWithTitle:v30 style:0 handler:v34];
  [(UIAlertController *)v27 addAction:v31];

  [v33 presentViewController:self->_alertController animated:1 completion:0];
  objc_destroyWeak(&v35);
  objc_destroyWeak(&v37);
  objc_destroyWeak(&v40);

  objc_destroyWeak(location);
}

void __89__EKUIDeclineCommentController__presentAlertWithOrganizer_currentComment_viewController___block_invoke(uint64_t a1, void *a2)
{
  id v8 = a2;
  v4 = EventKitUIBundle();
  id v5 = [v4 localizedStringForKey:@"Comment to Organizer" value:&stru_1F0CC2140 table:0];
  [v8 setPlaceholder:v5];

  [v8 setText:*(void *)(a1 + 32)];
  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 40));
  v7 = WeakRetained;
  if (WeakRetained) {
    objc_storeStrong(WeakRetained + 2, a2);
  }
}

void __89__EKUIDeclineCommentController__presentAlertWithOrganizer_currentComment_viewController___block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _completeWithButton:0];
}

void __89__EKUIDeclineCommentController__presentAlertWithOrganizer_currentComment_viewController___block_invoke_3(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _completeWithButton:1];
}

- (void)_completeWithButton:(unint64_t)a3
{
  id completionBlock = self->_completionBlock;
  if (completionBlock)
  {
    BOOL v5 = a3 == 0;
    id v10 = (void (**)(id, void *, BOOL))_Block_copy(completionBlock);
    uint64_t v6 = [(UITextField *)self->_alertTextField text];
    id v7 = self->_completionBlock;
    self->_id completionBlock = 0;

    alertController = self->_alertController;
    self->_alertController = 0;

    alertTextField = self->_alertTextField;
    self->_alertTextField = 0;

    v10[2](v10, v6, v5);
  }
}

- (void)dismissAnimated:(BOOL)a3
{
  [(UIAlertController *)self->_alertController dismissViewControllerAnimated:a3 completion:0];

  [(EKUIDeclineCommentController *)self _completeWithButton:0];
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_completionBlock, 0);
  objc_storeStrong((id *)&self->_alertTextField, 0);

  objc_storeStrong((id *)&self->_alertController, 0);
}

@end