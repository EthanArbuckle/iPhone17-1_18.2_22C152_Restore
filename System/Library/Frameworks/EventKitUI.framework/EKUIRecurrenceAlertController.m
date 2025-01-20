@interface EKUIRecurrenceAlertController
+ (BOOL)_useSheetForViewController:(id)a3 options:(unint64_t)a4;
+ (BOOL)shouldShowDeleteAlertForEvent:(id)a3 options:(unint64_t)a4;
+ (BOOL)shouldShowDetachAlertForEvent:(id)a3 options:(unint64_t)a4;
+ (id)_cancelLocalizedString;
+ (id)_defaultStringForDeleteButtonForEvent:(id)a3;
+ (id)_defaultStringForDeleteTitleWhenNotRecurring:(id)a3;
+ (id)_detachAllLocalizedString;
+ (id)_detachFutureLocalizedString;
+ (id)deleteAlertWithOptions:(unint64_t)a3 forEvent:(id)a4 stringForDeleteButton:(id)a5 withCompletionHandler:(id)a6;
+ (id)newAlertControllerWithCompletionHandler:(id)a3;
+ (id)presentAttachmentAlertWithOptions:(unint64_t)a3 viewController:(id)a4 barButtonItem:(id)a5 forEvent:(id)a6 withCompletionHandler:(id)a7;
+ (id)presentDeleteAlertWithOptions:(unint64_t)a3 viewController:(id)a4 barButtonItem:(id)a5 forEvent:(id)a6 stringForDeleteButton:(id)a7 withCompletionHandler:(id)a8;
+ (id)presentDeleteAlertWithOptions:(unint64_t)a3 viewController:(id)a4 forEvents:(id)a5 withCompletionHandler:(id)a6;
+ (id)presentDeleteAlertWithOptions:(unint64_t)a3 viewController:(id)a4 sourceView:(id)a5 sourceRect:(CGRect)a6 forEvent:(id)a7 stringForDeleteButton:(id)a8 withCompletionHandler:(id)a9;
+ (id)presentDetachAlertWithOptions:(unint64_t)a3 viewController:(id)a4 barButtonItem:(id)a5 forEvent:(id)a6 withCompletionHandler:(id)a7;
+ (id)presentDetachAlertWithOptions:(unint64_t)a3 viewController:(id)a4 sourceView:(id)a5 sourceRect:(CGRect)a6 forEvent:(id)a7 withCompletionHandler:(id)a8;
+ (id)presentUnsubscribeAlertWithOptions:(unint64_t)a3 viewController:(id)a4 sourceView:(id)a5 sourceRect:(CGRect)a6 withCompletionHandler:(id)a7;
+ (id)unsubscribeAlertWithOptions:(unint64_t)a3 withCompletionHandler:(id)a4;
+ (int)_determineChoicesForEvent:(id)a3 options:(unint64_t)a4;
- (BOOL)_setupDeleteAlertForEvents:(id)a3;
- (BOOL)isCurrentlyShowingAlert;
- (UIAlertController)alertController;
- (id)completionHandler;
- (void)_cleanup;
- (void)_completeWithSelection:(unint64_t)a3;
- (void)_configureAlertControllerWithSourceView:(id)a3 sourceRect:(CGRect)a4 barButtonItem:(id)a5;
- (void)_presentAttachmentsAlertWithOptions:(unint64_t)a3 viewController:(id)a4 barButtonItem:(id)a5 forEvent:(id)a6;
- (void)_presentDeleteAlertWithOptions:(unint64_t)a3 viewController:(id)a4 sourceView:(id)a5 sourceRect:(CGRect)a6 barButtonItem:(id)a7 forEvent:(id)a8 stringForDeleteButton:(id)a9;
- (void)_presentDetachAlertWithOptions:(unint64_t)a3 viewController:(id)a4 sourceView:(id)a5 sourceRect:(CGRect)a6 barButtonItem:(id)a7 forEvent:(id)a8;
- (void)cancelAnimated:(BOOL)a3;
- (void)dealloc;
- (void)setAlertController:(id)a3;
- (void)setCompletionHandler:(id)a3;
- (void)setupDeleteAlertWithOptions:(unint64_t)a3 viewController:(id)a4 forEvent:(id)a5 stringForDeleteButton:(id)a6;
- (void)setupUnsubscribeAlertWithOptions:(unint64_t)a3 viewController:(id)a4;
@end

@implementation EKUIRecurrenceAlertController

- (void)dealloc
{
  [(EKUIRecurrenceAlertController *)self cancelAnimated:0];
  v3.receiver = self;
  v3.super_class = (Class)EKUIRecurrenceAlertController;
  [(EKUIRecurrenceAlertController *)&v3 dealloc];
}

+ (id)newAlertControllerWithCompletionHandler:(id)a3
{
  id v3 = a3;
  v4 = objc_opt_new();
  [v4 setCompletionHandler:v3];

  return v4;
}

- (BOOL)isCurrentlyShowingAlert
{
  id v3 = [(UIAlertController *)self->_alertController view];
  v4 = [v3 superview];
  if (v4)
  {
    v5 = [(UIAlertController *)self->_alertController presentingViewController];
    if (v5) {
      int v6 = [(UIAlertController *)self->_alertController isBeingDismissed] ^ 1;
    }
    else {
      LOBYTE(v6) = 0;
    }
  }
  else
  {
    LOBYTE(v6) = 0;
  }

  return v6;
}

+ (id)_defaultStringForDeleteButtonForEvent:(id)a3
{
  int v3 = [a3 isReminderIntegrationEvent];
  v4 = EventKitUIBundle();
  v5 = v4;
  if (v3) {
    int v6 = @"Delete Reminder";
  }
  else {
    int v6 = @"Delete Event";
  }
  v7 = [v4 localizedStringForKey:v6 value:&stru_1F0CC2140 table:0];

  return v7;
}

+ (id)presentDeleteAlertWithOptions:(unint64_t)a3 viewController:(id)a4 barButtonItem:(id)a5 forEvent:(id)a6 stringForDeleteButton:(id)a7 withCompletionHandler:(id)a8
{
  id v14 = a4;
  id v15 = a5;
  id v16 = a6;
  id v17 = a7;
  v18 = (void *)[a1 newAlertControllerWithCompletionHandler:a8];
  v19 = v17;
  if (!v17)
  {
    v19 = [a1 _defaultStringForDeleteButtonForEvent:v16];
  }
  objc_msgSend(v18, "_presentDeleteAlertWithOptions:viewController:sourceView:sourceRect:barButtonItem:forEvent:stringForDeleteButton:", a3, v14, 0, v15, v16, v19, *MEMORY[0x1E4F1DB20], *(double *)(MEMORY[0x1E4F1DB20] + 8), *(double *)(MEMORY[0x1E4F1DB20] + 16), *(double *)(MEMORY[0x1E4F1DB20] + 24));
  if (!v17) {

  }
  return v18;
}

+ (id)presentDeleteAlertWithOptions:(unint64_t)a3 viewController:(id)a4 sourceView:(id)a5 sourceRect:(CGRect)a6 forEvent:(id)a7 stringForDeleteButton:(id)a8 withCompletionHandler:(id)a9
{
  double height = a6.size.height;
  double width = a6.size.width;
  double y = a6.origin.y;
  double x = a6.origin.x;
  id v19 = a4;
  id v20 = a5;
  id v21 = a7;
  id v22 = a8;
  v23 = (void *)[a1 newAlertControllerWithCompletionHandler:a9];
  v24 = v23;
  if (v22)
  {
    objc_msgSend(v23, "_presentDeleteAlertWithOptions:viewController:sourceView:sourceRect:barButtonItem:forEvent:stringForDeleteButton:", a3, v19, v20, 0, v21, v22, x, y, width, height);
  }
  else
  {
    v25 = [a1 _defaultStringForDeleteButtonForEvent:v21];
    objc_msgSend(v24, "_presentDeleteAlertWithOptions:viewController:sourceView:sourceRect:barButtonItem:forEvent:stringForDeleteButton:", a3, v19, v20, 0, v21, v25, x, y, width, height);
  }

  return v24;
}

+ (id)presentDeleteAlertWithOptions:(unint64_t)a3 viewController:(id)a4 forEvents:(id)a5 withCompletionHandler:(id)a6
{
  id v10 = a4;
  id v11 = a5;
  v12 = (void *)[a1 newAlertControllerWithCompletionHandler:a6];
  if ([v11 count] == 1)
  {
    v13 = [v11 objectAtIndexedSubscript:0];
    id v14 = [v11 objectAtIndexedSubscript:0];
    id v15 = [a1 _defaultStringForDeleteButtonForEvent:v14];
    objc_msgSend(v12, "_presentDeleteAlertWithOptions:viewController:sourceView:sourceRect:barButtonItem:forEvent:stringForDeleteButton:", a3, v10, 0, 0, v13, v15, *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
  }
  else if ([v12 _setupDeleteAlertForEvents:v11])
  {
    v13 = [v12 alertController];
    [v10 presentViewController:v13 animated:1 completion:0];
  }
  else
  {
    v13 = v12;
    v12 = 0;
  }

  return v12;
}

+ (id)deleteAlertWithOptions:(unint64_t)a3 forEvent:(id)a4 stringForDeleteButton:(id)a5 withCompletionHandler:(id)a6
{
  id v10 = a4;
  id v11 = a5;
  id v12 = a6;
  if ([a1 shouldShowDeleteAlertForEvent:v10 options:a3])
  {
    v13 = (void *)[a1 newAlertControllerWithCompletionHandler:v12];
    id v14 = v13;
    if (v11)
    {
      [v13 setupDeleteAlertWithOptions:a3 viewController:0 forEvent:v10 stringForDeleteButton:v11];
    }
    else
    {
      id v15 = [a1 _defaultStringForDeleteButtonForEvent:v10];
      [v14 setupDeleteAlertWithOptions:a3 viewController:0 forEvent:v10 stringForDeleteButton:v15];
    }
  }
  else
  {
    id v14 = 0;
  }

  return v14;
}

+ (BOOL)shouldShowDeleteAlertForEvent:(id)a3 options:(unint64_t)a4
{
  char v4 = a4;
  v13[1] = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  char v6 = [v5 isReminderIntegrationEvent];
  if ((v6 & 1) != 0 || (v4 & 0x10) != 0)
  {
    BOOL v8 = (v4 & 0x10) == 0;
    v9 = (void *)MEMORY[0x1E4F57C28];
    v13[0] = v5;
    id v10 = [MEMORY[0x1E4F1C978] arrayWithObjects:v13 count:1];
    id v11 = [v9 spanDecisionInfoForEvents:v10];

    if ([v11 shouldRequestSpan]) {
      char v7 = v6 ^ 1;
    }
    else {
      char v7 = v8;
    }
  }
  else
  {
    char v7 = 1;
  }

  return v7;
}

+ (id)presentUnsubscribeAlertWithOptions:(unint64_t)a3 viewController:(id)a4 sourceView:(id)a5 sourceRect:(CGRect)a6 withCompletionHandler:(id)a7
{
  double height = a6.size.height;
  double width = a6.size.width;
  double y = a6.origin.y;
  double x = a6.origin.x;
  id v15 = a4;
  id v16 = a5;
  id v17 = a7;
  if (v15)
  {
    v18 = [a1 unsubscribeAlertWithOptions:a3 withCompletionHandler:v17];
    objc_msgSend(v18, "_configureAlertControllerWithSourceView:sourceRect:barButtonItem:", v16, 0, x, y, width, height);
    id v19 = [v18 alertController];
    [v15 presentViewController:v19 animated:1 completion:0];
  }
  else
  {
    id v20 = kEKUILogHandle;
    if (os_log_type_enabled((os_log_t)kEKUILogHandle, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)id v22 = 0;
      _os_log_impl(&dword_1B3F4C000, v20, OS_LOG_TYPE_ERROR, "Presenting a delete alert requires a view controller.", v22, 2u);
    }
    v18 = 0;
  }

  return v18;
}

+ (id)unsubscribeAlertWithOptions:(unint64_t)a3 withCompletionHandler:(id)a4
{
  id v5 = (void *)[a1 newAlertControllerWithCompletionHandler:a4];
  [v5 setupUnsubscribeAlertWithOptions:a3 viewController:0];

  return v5;
}

+ (id)presentDetachAlertWithOptions:(unint64_t)a3 viewController:(id)a4 barButtonItem:(id)a5 forEvent:(id)a6 withCompletionHandler:(id)a7
{
  id v12 = a6;
  id v13 = a5;
  id v14 = a4;
  id v15 = (void *)[a1 newAlertControllerWithCompletionHandler:a7];
  objc_msgSend(v15, "_presentDetachAlertWithOptions:viewController:sourceView:sourceRect:barButtonItem:forEvent:", a3, v14, 0, v13, v12, *MEMORY[0x1E4F1DB20], *(double *)(MEMORY[0x1E4F1DB20] + 8), *(double *)(MEMORY[0x1E4F1DB20] + 16), *(double *)(MEMORY[0x1E4F1DB20] + 24));

  return v15;
}

+ (id)presentDetachAlertWithOptions:(unint64_t)a3 viewController:(id)a4 sourceView:(id)a5 sourceRect:(CGRect)a6 forEvent:(id)a7 withCompletionHandler:(id)a8
{
  double height = a6.size.height;
  double width = a6.size.width;
  double y = a6.origin.y;
  double x = a6.origin.x;
  id v17 = a7;
  id v18 = a5;
  id v19 = a4;
  id v20 = (void *)[a1 newAlertControllerWithCompletionHandler:a8];
  objc_msgSend(v20, "_presentDetachAlertWithOptions:viewController:sourceView:sourceRect:barButtonItem:forEvent:", a3, v19, v18, 0, v17, x, y, width, height);

  return v20;
}

+ (BOOL)shouldShowDetachAlertForEvent:(id)a3 options:(unint64_t)a4
{
  return [a3 isReminderIntegrationEvent] ^ 1;
}

+ (id)presentAttachmentAlertWithOptions:(unint64_t)a3 viewController:(id)a4 barButtonItem:(id)a5 forEvent:(id)a6 withCompletionHandler:(id)a7
{
  id v12 = a6;
  id v13 = a5;
  id v14 = a4;
  id v15 = (void *)[a1 newAlertControllerWithCompletionHandler:a7];
  [v15 _presentAttachmentsAlertWithOptions:a3 viewController:v14 barButtonItem:v13 forEvent:v12];

  return v15;
}

+ (BOOL)_useSheetForViewController:(id)a3 options:(unint64_t)a4
{
  char v4 = a4;
  id v5 = a3;
  char v6 = v5;
  if ((v4 & 2) != 0)
  {
    BOOL v9 = 0;
    goto LABEL_12;
  }
  if ((v4 & 4) != 0)
  {
    if (!v5
      || ([v5 popoverPresentationController],
          id v10 = objc_claimAutoreleasedReturnValue(),
          v10,
          v10))
    {
      BOOL v9 = 1;
      goto LABEL_12;
    }
  }
  char v7 = [v6 view];
  if (!EKUICurrentHeightSizeClassIsCompact(v7))
  {
    BOOL v8 = [v6 view];
    if (!EKUICurrentWidthSizeClassIsCompactInViewHierarchy(v8))
    {
      BOOL v9 = 1;
      char v12 = [v6 _isInContextOfPresentationControllerOfClass:objc_opt_class() effective:1];

      if (v12) {
        goto LABEL_12;
      }
      char v7 = [v6 _popoverController];
      BOOL v9 = v7 != 0;
      goto LABEL_7;
    }
  }
  BOOL v9 = 1;
LABEL_7:

LABEL_12:
  return v9;
}

- (void)setupUnsubscribeAlertWithOptions:(unint64_t)a3 viewController:(id)a4
{
  id v6 = a4;
  objc_msgSend(MEMORY[0x1E4FB1418], "alertControllerWithTitle:message:preferredStyle:", 0, 0, objc_msgSend((id)objc_opt_class(), "_useSheetForViewController:options:", v6, a3) ^ 1);
  char v7 = (UIAlertController *)objc_claimAutoreleasedReturnValue();
  alertController = self->_alertController;
  self->_alertController = v7;

  objc_initWeak(&location, self);
  BOOL v9 = EventKitUIBundle();
  id v10 = [v9 localizedStringForKey:@"Are you sure you want to unsubscribe? Unsubscribing will delete all events from this subscription." value:&stru_1F0CC2140 table:0];
  [(UIAlertController *)self->_alertController setTitle:v10];

  id v11 = self->_alertController;
  char v12 = (void *)MEMORY[0x1E4FB1410];
  id v13 = EventKitUIBundle();
  id v14 = [v13 localizedStringForKey:@"Unsubscribe" value:&stru_1F0CC2140 table:0];
  v32[0] = MEMORY[0x1E4F143A8];
  v32[1] = 3221225472;
  v32[2] = __81__EKUIRecurrenceAlertController_setupUnsubscribeAlertWithOptions_viewController___block_invoke;
  v32[3] = &unk_1E6088F20;
  objc_copyWeak(&v33, &location);
  id v15 = [v12 actionWithTitle:v14 style:2 handler:v32];
  [(UIAlertController *)v11 addAction:v15];

  id v16 = self->_alertController;
  id v17 = (void *)MEMORY[0x1E4FB1410];
  id v18 = EventKitUIBundle();
  id v19 = [v18 localizedStringForKey:@"Unsubscribe and Report Junk" value:&stru_1F0CC2140 table:0];
  v30[0] = MEMORY[0x1E4F143A8];
  v30[1] = 3221225472;
  v30[2] = __81__EKUIRecurrenceAlertController_setupUnsubscribeAlertWithOptions_viewController___block_invoke_2;
  v30[3] = &unk_1E6088F20;
  objc_copyWeak(&v31, &location);
  id v20 = [v17 actionWithTitle:v19 style:2 handler:v30];
  [(UIAlertController *)v16 addAction:v20];

  id v21 = self->_alertController;
  id v22 = (void *)MEMORY[0x1E4FB1410];
  v23 = [(id)objc_opt_class() _cancelLocalizedString];
  uint64_t v25 = MEMORY[0x1E4F143A8];
  uint64_t v26 = 3221225472;
  v27 = __81__EKUIRecurrenceAlertController_setupUnsubscribeAlertWithOptions_viewController___block_invoke_3;
  v28 = &unk_1E6088F20;
  objc_copyWeak(&v29, &location);
  v24 = [v22 actionWithTitle:v23 style:1 handler:&v25];
  -[UIAlertController addAction:](v21, "addAction:", v24, v25, v26, v27, v28);

  objc_destroyWeak(&v29);
  objc_destroyWeak(&v31);
  objc_destroyWeak(&v33);
  objc_destroyWeak(&location);
}

void __81__EKUIRecurrenceAlertController_setupUnsubscribeAlertWithOptions_viewController___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _completeWithSelection:4];
}

void __81__EKUIRecurrenceAlertController_setupUnsubscribeAlertWithOptions_viewController___block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _completeWithSelection:5];
}

void __81__EKUIRecurrenceAlertController_setupUnsubscribeAlertWithOptions_viewController___block_invoke_3(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _completeWithSelection:3];
}

- (BOOL)_setupDeleteAlertForEvents:(id)a3
{
  id v4 = a3;
  id v5 = [MEMORY[0x1E4F57C28] spanDecisionInfoForEvents:v4];
  char v6 = [v5 shouldRequestSpan];
  if (v6)
  {
    int v7 = [v5 proposeFuture];
    uint64_t v8 = [v5 recurringEventCount];
    uint64_t v9 = [v4 count];
    id v10 = EventKitUIBundle();
    uint64_t v11 = [v10 localizedStringForKey:@"You’re deleting events." value:&stru_1F0CC2140 table:0];

    char v12 = EventKitUIBundle();
    v39 = [v12 localizedStringForKey:@"Delete Only These Events" value:&stru_1F0CC2140 table:0];

    id v13 = EventKitUIBundle();
    id v14 = v13;
    if (v7)
    {
      if (v8 == v9) {
        id v15 = @"Do you want to delete this and all future occurrences of these events, or only the selected occurrences?";
      }
      else {
        id v15 = @"Some of the selected events are repeating events. Do you want to delete this and all future occurrences of these events, or only the selected occurrences?";
      }
      id v16 = [v13 localizedStringForKey:v15 value:&stru_1F0CC2140 table:0];

      id v17 = EventKitUIBundle();
      id v18 = [v17 localizedStringForKey:@"Delete All Future Events" value:&stru_1F0CC2140 table:0];
      uint64_t v19 = 0;
    }
    else
    {
      if (v8 == v9) {
        id v20 = @"Do you want to delete all occurrences of these events, or only the selected occurrences?";
      }
      else {
        id v20 = @"Some of the selected events are repeating events. Do you want to delete all occurrences of these events, or only the selected occurrences?";
      }
      id v16 = [v13 localizedStringForKey:v20 value:&stru_1F0CC2140 table:0];

      id v17 = EventKitUIBundle();
      uint64_t v19 = [v17 localizedStringForKey:@"Delete All" value:&stru_1F0CC2140 table:0];
      id v18 = 0;
    }

    v37 = (void *)v11;
    id v21 = +[EKUIDeleteAlertController alertControllerWithTitle:v11 message:v16 preferredStyle:1];
    alertController = self->_alertController;
    self->_alertController = v21;

    objc_initWeak(location, self);
    v38 = (void *)v19;
    if (v18)
    {
      v23 = self->_alertController;
      v24 = (void *)MEMORY[0x1E4FB1410];
      v46[0] = MEMORY[0x1E4F143A8];
      v46[1] = 3221225472;
      v46[2] = __60__EKUIRecurrenceAlertController__setupDeleteAlertForEvents___block_invoke;
      v46[3] = &unk_1E6088F20;
      uint64_t v25 = &v47;
      objc_copyWeak(&v47, location);
      uint64_t v26 = [v24 actionWithTitle:v18 style:0 handler:v46];
      [(UIAlertController *)v23 addAction:v26];
    }
    else
    {
      if (!v19)
      {
LABEL_17:
        id v29 = self->_alertController;
        v30 = (void *)MEMORY[0x1E4FB1410];
        v42[0] = MEMORY[0x1E4F143A8];
        v42[1] = 3221225472;
        v42[2] = __60__EKUIRecurrenceAlertController__setupDeleteAlertForEvents___block_invoke_3;
        v42[3] = &unk_1E6088F20;
        objc_copyWeak(&v43, location);
        id v31 = [v30 actionWithTitle:v39 style:0 handler:v42];
        [(UIAlertController *)v29 addAction:v31];

        v32 = self->_alertController;
        id v33 = (void *)MEMORY[0x1E4FB1410];
        v34 = [(id)objc_opt_class() _cancelLocalizedString];
        v40[0] = MEMORY[0x1E4F143A8];
        v40[1] = 3221225472;
        v40[2] = __60__EKUIRecurrenceAlertController__setupDeleteAlertForEvents___block_invoke_4;
        v40[3] = &unk_1E6088F20;
        objc_copyWeak(&v41, location);
        v35 = [v33 actionWithTitle:v34 style:1 handler:v40];
        [(UIAlertController *)v32 addAction:v35];

        objc_destroyWeak(&v41);
        objc_destroyWeak(&v43);
        objc_destroyWeak(location);

        goto LABEL_18;
      }
      v27 = self->_alertController;
      v28 = (void *)MEMORY[0x1E4FB1410];
      v44[0] = MEMORY[0x1E4F143A8];
      v44[1] = 3221225472;
      v44[2] = __60__EKUIRecurrenceAlertController__setupDeleteAlertForEvents___block_invoke_2;
      v44[3] = &unk_1E6088F20;
      uint64_t v25 = &v45;
      objc_copyWeak(&v45, location);
      uint64_t v26 = [v28 actionWithTitle:v38 style:0 handler:v44];
      [(UIAlertController *)v27 addAction:v26];
    }

    objc_destroyWeak(v25);
    goto LABEL_17;
  }
  [(EKUIRecurrenceAlertController *)self _completeWithSelection:0];
LABEL_18:

  return v6;
}

void __60__EKUIRecurrenceAlertController__setupDeleteAlertForEvents___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _completeWithSelection:1];
}

void __60__EKUIRecurrenceAlertController__setupDeleteAlertForEvents___block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _completeWithSelection:2];
}

void __60__EKUIRecurrenceAlertController__setupDeleteAlertForEvents___block_invoke_3(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _completeWithSelection:0];
}

void __60__EKUIRecurrenceAlertController__setupDeleteAlertForEvents___block_invoke_4(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _completeWithSelection:3];
}

+ (id)_defaultStringForDeleteTitleWhenNotRecurring:(id)a3
{
  int v3 = [a3 isReminderIntegrationEvent];
  id v4 = EventKitUIBundle();
  id v5 = v4;
  if (v3) {
    char v6 = @"Are you sure you want to delete this reminder?";
  }
  else {
    char v6 = @"Are you sure you want to delete this event?";
  }
  int v7 = [v4 localizedStringForKey:v6 value:&stru_1F0CC2140 table:0];

  return v7;
}

- (void)setupDeleteAlertWithOptions:(unint64_t)a3 viewController:(id)a4 forEvent:(id)a5 stringForDeleteButton:(id)a6
{
  id v10 = a4;
  id v11 = a5;
  id v40 = a6;
  char v12 = +[EKUIRecurrenceAlertController _determineChoicesForEvent:v11 options:a3];
  +[EKUIDeleteAlertController alertControllerWithTitle:message:preferredStyle:](EKUIDeleteAlertController, "alertControllerWithTitle:message:preferredStyle:", 0, 0, [(id)objc_opt_class() _useSheetForViewController:v10 options:a3] ^ 1);
  id v13 = (UIAlertController *)objc_claimAutoreleasedReturnValue();
  alertController = self->_alertController;
  self->_alertController = v13;

  objc_initWeak(location, self);
  if ((v12 & 6) != 0)
  {
    id v15 = EventKitUIBundle();
    id v16 = [v15 localizedStringForKey:@"Are you sure you want to delete this event? This is a repeating event." value:&stru_1F0CC2140 table:0];
    [(UIAlertController *)self->_alertController setTitle:v16];

    id v17 = self->_alertController;
    id v18 = (void *)MEMORY[0x1E4FB1410];
    uint64_t v19 = EventKitUIBundle();
    id v20 = [v19 localizedStringForKey:@"Delete This Event Only" value:&stru_1F0CC2140 table:0];
    v51[0] = MEMORY[0x1E4F143A8];
    v51[1] = 3221225472;
    v51[2] = __107__EKUIRecurrenceAlertController_setupDeleteAlertWithOptions_viewController_forEvent_stringForDeleteButton___block_invoke;
    v51[3] = &unk_1E6088F20;
    id v21 = &v52;
    objc_copyWeak(&v52, location);
    id v22 = [v18 actionWithTitle:v20 style:0 handler:v51];
    [(UIAlertController *)v17 addAction:v22];

    v23 = self->_alertController;
    v24 = (void *)MEMORY[0x1E4FB1410];
    EventKitUIBundle();
    if ((v12 & 4) != 0) {
      uint64_t v25 = {;
    }
      uint64_t v26 = [v25 localizedStringForKey:@"Delete All Events" value:&stru_1F0CC2140 table:0];
      v49[0] = MEMORY[0x1E4F143A8];
      v49[1] = 3221225472;
      v49[2] = __107__EKUIRecurrenceAlertController_setupDeleteAlertWithOptions_viewController_forEvent_stringForDeleteButton___block_invoke_2;
      v49[3] = &unk_1E6088F20;
      v27 = &v50;
      objc_copyWeak(&v50, location);
      v28 = [v24 actionWithTitle:v26 style:0 handler:v49];
      [(UIAlertController *)v23 addAction:v28];
    }
    else {
      uint64_t v25 = {;
    }
      uint64_t v26 = [v25 localizedStringForKey:@"Delete All Future Events" value:&stru_1F0CC2140 table:0];
      v47[0] = MEMORY[0x1E4F143A8];
      v47[1] = 3221225472;
      v47[2] = __107__EKUIRecurrenceAlertController_setupDeleteAlertWithOptions_viewController_forEvent_stringForDeleteButton___block_invoke_3;
      v47[3] = &unk_1E6088F20;
      v27 = &v48;
      objc_copyWeak(&v48, location);
      v28 = [v24 actionWithTitle:v26 style:0 handler:v47];
      [(UIAlertController *)v23 addAction:v28];
    }

    objc_destroyWeak(v27);
    v38 = self->_alertController;
    v39 = (void *)MEMORY[0x1E4FB1410];
    v35 = [(id)objc_opt_class() _cancelLocalizedString];
    v45[0] = MEMORY[0x1E4F143A8];
    v45[1] = 3221225472;
    v45[2] = __107__EKUIRecurrenceAlertController_setupDeleteAlertWithOptions_viewController_forEvent_stringForDeleteButton___block_invoke_4;
    v45[3] = &unk_1E6088F20;
    v36 = &v46;
    objc_copyWeak(&v46, location);
    v37 = [v39 actionWithTitle:v35 style:1 handler:v45];
    [(UIAlertController *)v38 addAction:v37];
  }
  else
  {
    id v29 = [(id)objc_opt_class() _defaultStringForDeleteTitleWhenNotRecurring:v11];
    [(UIAlertController *)self->_alertController setTitle:v29];

    v30 = self->_alertController;
    id v31 = (void *)MEMORY[0x1E4FB1410];
    v43[0] = MEMORY[0x1E4F143A8];
    v43[1] = 3221225472;
    v43[2] = __107__EKUIRecurrenceAlertController_setupDeleteAlertWithOptions_viewController_forEvent_stringForDeleteButton___block_invoke_5;
    v43[3] = &unk_1E6088F20;
    id v21 = &v44;
    objc_copyWeak(&v44, location);
    v32 = [v31 actionWithTitle:v40 style:2 handler:v43];
    [(UIAlertController *)v30 addAction:v32];

    id v33 = self->_alertController;
    v34 = (void *)MEMORY[0x1E4FB1410];
    v35 = [(id)objc_opt_class() _cancelLocalizedString];
    v41[0] = MEMORY[0x1E4F143A8];
    v41[1] = 3221225472;
    v41[2] = __107__EKUIRecurrenceAlertController_setupDeleteAlertWithOptions_viewController_forEvent_stringForDeleteButton___block_invoke_6;
    v41[3] = &unk_1E6088F20;
    v36 = &v42;
    objc_copyWeak(&v42, location);
    v37 = [v34 actionWithTitle:v35 style:1 handler:v41];
    [(UIAlertController *)v33 addAction:v37];
  }

  objc_destroyWeak(v36);
  objc_destroyWeak(v21);
  objc_destroyWeak(location);
}

void __107__EKUIRecurrenceAlertController_setupDeleteAlertWithOptions_viewController_forEvent_stringForDeleteButton___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _completeWithSelection:0];
}

void __107__EKUIRecurrenceAlertController_setupDeleteAlertWithOptions_viewController_forEvent_stringForDeleteButton___block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _completeWithSelection:2];
}

void __107__EKUIRecurrenceAlertController_setupDeleteAlertWithOptions_viewController_forEvent_stringForDeleteButton___block_invoke_3(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _completeWithSelection:1];
}

void __107__EKUIRecurrenceAlertController_setupDeleteAlertWithOptions_viewController_forEvent_stringForDeleteButton___block_invoke_4(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _completeWithSelection:3];
}

void __107__EKUIRecurrenceAlertController_setupDeleteAlertWithOptions_viewController_forEvent_stringForDeleteButton___block_invoke_5(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _completeWithSelection:0];
}

void __107__EKUIRecurrenceAlertController_setupDeleteAlertWithOptions_viewController_forEvent_stringForDeleteButton___block_invoke_6(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _completeWithSelection:3];
}

- (void)_presentDeleteAlertWithOptions:(unint64_t)a3 viewController:(id)a4 sourceView:(id)a5 sourceRect:(CGRect)a6 barButtonItem:(id)a7 forEvent:(id)a8 stringForDeleteButton:(id)a9
{
  double height = a6.size.height;
  double width = a6.size.width;
  double y = a6.origin.y;
  double x = a6.origin.x;
  id v19 = a4;
  id v20 = a5;
  id v21 = a7;
  id v22 = a8;
  id v23 = a9;
  if (v19)
  {
    if ([(id)objc_opt_class() shouldShowDeleteAlertForEvent:v22 options:a3])
    {
      [(EKUIRecurrenceAlertController *)self setupDeleteAlertWithOptions:a3 viewController:v19 forEvent:v22 stringForDeleteButton:v23];
      -[EKUIRecurrenceAlertController _configureAlertControllerWithSourceView:sourceRect:barButtonItem:](self, "_configureAlertControllerWithSourceView:sourceRect:barButtonItem:", v20, v21, x, y, width, height);
      [v19 presentViewController:self->_alertController animated:1 completion:0];
    }
    else
    {
      [(EKUIRecurrenceAlertController *)self _completeWithSelection:0];
    }
  }
  else
  {
    v24 = kEKUILogHandle;
    if (os_log_type_enabled((os_log_t)kEKUILogHandle, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)uint64_t v25 = 0;
      _os_log_impl(&dword_1B3F4C000, v24, OS_LOG_TYPE_ERROR, "Presenting a delete alert requires a view controller.", v25, 2u);
    }
  }
}

- (void)_presentDetachAlertWithOptions:(unint64_t)a3 viewController:(id)a4 sourceView:(id)a5 sourceRect:(CGRect)a6 barButtonItem:(id)a7 forEvent:(id)a8
{
  double height = a6.size.height;
  double width = a6.size.width;
  double y = a6.origin.y;
  double x = a6.origin.x;
  id v17 = a4;
  id v18 = a5;
  id v19 = a7;
  id v20 = a8;
  if (v17)
  {
    if ([(id)objc_opt_class() shouldShowDetachAlertForEvent:v20 options:a3])
    {
      id v54 = v18;
      char v21 = +[EKUIRecurrenceAlertController _determineChoicesForEvent:v20 options:a3];
      unsigned int v55 = v21 & 4;
      uint64_t v22 = [(id)objc_opt_class() _useSheetForViewController:v17 options:a3] ^ 1;
      if ((a3 & 8) != 0)
      {
        uint64_t v25 = EventKitUIBundle();
        uint64_t v23 = [v25 localizedStringForKey:@"Changes to attachments will apply to all recurrences." value:&stru_1F0CC2140 table:0];
      }
      else
      {
        uint64_t v23 = 0;
      }
      uint64_t v26 = (void *)MEMORY[0x1E4FB1418];
      v27 = EventKitUIBundle();
      v28 = [v27 localizedStringForKey:@"This is a repeating event." value:&stru_1F0CC2140 table:0];
      id v52 = (void *)v23;
      id v29 = [v26 alertControllerWithTitle:v28 message:v23 preferredStyle:v22];
      alertController = self->_alertController;
      self->_alertController = v29;

      objc_initWeak(buf, self);
      id v31 = self->_alertController;
      v32 = (void *)MEMORY[0x1E4FB1410];
      if (v21)
      {
        id v33 = EventKitUIBundle();
        v34 = [v33 localizedStringForKey:@"Save for This Event Only" value:&stru_1F0CC2140 table:0];
        v66[0] = MEMORY[0x1E4F143A8];
        v66[1] = 3221225472;
        v66[2] = __124__EKUIRecurrenceAlertController__presentDetachAlertWithOptions_viewController_sourceView_sourceRect_barButtonItem_forEvent___block_invoke;
        v66[3] = &unk_1E6088F20;
        id location = &v67;
        objc_copyWeak(&v67, buf);
        v35 = [v32 actionWithTitle:v34 style:0 handler:v66];
        [(UIAlertController *)v31 addAction:v35];

        v36 = self->_alertController;
        v37 = (void *)MEMORY[0x1E4FB1410];
        id v38 = v54;
        if (v55) {
          [(id)objc_opt_class() _detachAllLocalizedString];
        }
        else {
        id v46 = [(id)objc_opt_class() _detachFutureLocalizedString];
        }
        v63[0] = MEMORY[0x1E4F143A8];
        v63[1] = 3221225472;
        v63[2] = __124__EKUIRecurrenceAlertController__presentDetachAlertWithOptions_viewController_sourceView_sourceRect_barButtonItem_forEvent___block_invoke_2;
        v63[3] = &unk_1E6089940;
        id v44 = &v64;
        objc_copyWeak(&v64, buf);
        char v65 = v55 >> 2;
        id v47 = [v37 actionWithTitle:v46 style:0 handler:v63];
        [(UIAlertController *)v36 addAction:v47];

        id v48 = self->_alertController;
        v49 = (void *)MEMORY[0x1E4FB1410];
        id v50 = [(id)objc_opt_class() _cancelLocalizedString];
        v61[0] = MEMORY[0x1E4F143A8];
        v61[1] = 3221225472;
        v61[2] = __124__EKUIRecurrenceAlertController__presentDetachAlertWithOptions_viewController_sourceView_sourceRect_barButtonItem_forEvent___block_invoke_3;
        v61[3] = &unk_1E6088F20;
        objc_copyWeak(&v62, buf);
        v51 = [v49 actionWithTitle:v50 style:1 handler:v61];
        [(UIAlertController *)v48 addAction:v51];

        objc_destroyWeak(&v62);
      }
      else
      {
        if ((v21 & 4) != 0) {
          [(id)objc_opt_class() _detachAllLocalizedString];
        }
        else {
        v39 = [(id)objc_opt_class() _detachFutureLocalizedString];
        }
        v58[0] = MEMORY[0x1E4F143A8];
        v58[1] = 3221225472;
        v58[2] = __124__EKUIRecurrenceAlertController__presentDetachAlertWithOptions_viewController_sourceView_sourceRect_barButtonItem_forEvent___block_invoke_4;
        v58[3] = &unk_1E6089940;
        objc_copyWeak(&v59, buf);
        char v60 = (v21 & 4) >> 2;
        id v40 = [v32 actionWithTitle:v39 style:2 handler:v58];
        [(UIAlertController *)v31 addAction:v40];
        id location = &v59;

        id v41 = self->_alertController;
        id v42 = (void *)MEMORY[0x1E4FB1410];
        id v43 = [(id)objc_opt_class() _cancelLocalizedString];
        v56[0] = MEMORY[0x1E4F143A8];
        v56[1] = 3221225472;
        v56[2] = __124__EKUIRecurrenceAlertController__presentDetachAlertWithOptions_viewController_sourceView_sourceRect_barButtonItem_forEvent___block_invoke_5;
        v56[3] = &unk_1E6088F20;
        id v44 = &v57;
        objc_copyWeak(&v57, buf);
        [v42 actionWithTitle:v43 style:1 handler:v56];
        id v45 = v38 = v54;
        [(UIAlertController *)v41 addAction:v45];
      }
      objc_destroyWeak(v44);
      objc_destroyWeak(location);
      -[EKUIRecurrenceAlertController _configureAlertControllerWithSourceView:sourceRect:barButtonItem:](self, "_configureAlertControllerWithSourceView:sourceRect:barButtonItem:", v38, v19, x, y, width, height);
      [v17 presentViewController:self->_alertController animated:1 completion:0];
      objc_destroyWeak(buf);

      id v18 = v54;
    }
    else
    {
      [(EKUIRecurrenceAlertController *)self _completeWithSelection:0];
    }
  }
  else
  {
    v24 = kEKUILogHandle;
    if (os_log_type_enabled((os_log_t)kEKUILogHandle, OS_LOG_TYPE_ERROR))
    {
      LOWORD(buf[0]) = 0;
      _os_log_impl(&dword_1B3F4C000, v24, OS_LOG_TYPE_ERROR, "Presenting a detach alert requires a view controller.", (uint8_t *)buf, 2u);
    }
  }
}

void __124__EKUIRecurrenceAlertController__presentDetachAlertWithOptions_viewController_sourceView_sourceRect_barButtonItem_forEvent___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _completeWithSelection:0];
}

void __124__EKUIRecurrenceAlertController__presentDetachAlertWithOptions_viewController_sourceView_sourceRect_barButtonItem_forEvent___block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v4 = WeakRetained;
  if (*(unsigned char *)(a1 + 40)) {
    uint64_t v3 = 2;
  }
  else {
    uint64_t v3 = 1;
  }
  [WeakRetained _completeWithSelection:v3];
}

void __124__EKUIRecurrenceAlertController__presentDetachAlertWithOptions_viewController_sourceView_sourceRect_barButtonItem_forEvent___block_invoke_3(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _completeWithSelection:3];
}

void __124__EKUIRecurrenceAlertController__presentDetachAlertWithOptions_viewController_sourceView_sourceRect_barButtonItem_forEvent___block_invoke_4(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v4 = WeakRetained;
  if (*(unsigned char *)(a1 + 40)) {
    uint64_t v3 = 2;
  }
  else {
    uint64_t v3 = 1;
  }
  [WeakRetained _completeWithSelection:v3];
}

void __124__EKUIRecurrenceAlertController__presentDetachAlertWithOptions_viewController_sourceView_sourceRect_barButtonItem_forEvent___block_invoke_5(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _completeWithSelection:3];
}

- (void)_presentAttachmentsAlertWithOptions:(unint64_t)a3 viewController:(id)a4 barButtonItem:(id)a5 forEvent:(id)a6
{
  id v10 = a4;
  id v11 = a5;
  id v12 = a6;
  id v13 = v12;
  if (v10)
  {
    id v32 = v12;
    uint64_t v14 = [(id)objc_opt_class() _useSheetForViewController:v10 options:a3] ^ 1;
    id v15 = (void *)MEMORY[0x1E4FB1418];
    id v16 = EventKitUIBundle();
    id v17 = [v16 localizedStringForKey:@"This is a repeating event." value:&stru_1F0CC2140 table:0];
    id v18 = EventKitUIBundle();
    id v19 = [v18 localizedStringForKey:@"Attachment changes must be applied to all recurrences." value:&stru_1F0CC2140 table:0];
    id v20 = [v15 alertControllerWithTitle:v17 message:v19 preferredStyle:v14];
    alertController = self->_alertController;
    self->_alertController = v20;

    objc_initWeak(location, self);
    uint64_t v22 = self->_alertController;
    uint64_t v23 = (void *)MEMORY[0x1E4FB1410];
    v24 = EventKitUIBundle();
    uint64_t v25 = [v24 localizedStringForKey:@"Save for all recurrences" value:&stru_1F0CC2140 table:0];
    v35[0] = MEMORY[0x1E4F143A8];
    v35[1] = 3221225472;
    v35[2] = __107__EKUIRecurrenceAlertController__presentAttachmentsAlertWithOptions_viewController_barButtonItem_forEvent___block_invoke;
    v35[3] = &unk_1E6088F20;
    objc_copyWeak(&v36, location);
    uint64_t v26 = [v23 actionWithTitle:v25 style:0 handler:v35];
    [(UIAlertController *)v22 addAction:v26];

    v27 = self->_alertController;
    v28 = (void *)MEMORY[0x1E4FB1410];
    id v29 = [(id)objc_opt_class() _cancelLocalizedString];
    v33[0] = MEMORY[0x1E4F143A8];
    v33[1] = 3221225472;
    v33[2] = __107__EKUIRecurrenceAlertController__presentAttachmentsAlertWithOptions_viewController_barButtonItem_forEvent___block_invoke_2;
    v33[3] = &unk_1E6088F20;
    objc_copyWeak(&v34, location);
    v30 = [v28 actionWithTitle:v29 style:1 handler:v33];
    [(UIAlertController *)v27 addAction:v30];

    -[EKUIRecurrenceAlertController _configureAlertControllerWithSourceView:sourceRect:barButtonItem:](self, "_configureAlertControllerWithSourceView:sourceRect:barButtonItem:", 0, v11, *MEMORY[0x1E4F1DB20], *(double *)(MEMORY[0x1E4F1DB20] + 8), *(double *)(MEMORY[0x1E4F1DB20] + 16), *(double *)(MEMORY[0x1E4F1DB20] + 24));
    [v10 presentViewController:self->_alertController animated:1 completion:0];
    objc_destroyWeak(&v34);
    objc_destroyWeak(&v36);
    objc_destroyWeak(location);
    id v13 = v32;
  }
  else
  {
    id v31 = kEKUILogHandle;
    if (os_log_type_enabled((os_log_t)kEKUILogHandle, OS_LOG_TYPE_ERROR))
    {
      LOWORD(location[0]) = 0;
      _os_log_impl(&dword_1B3F4C000, v31, OS_LOG_TYPE_ERROR, "Presenting a detach alert requires a view controller.", (uint8_t *)location, 2u);
    }
  }
}

void __107__EKUIRecurrenceAlertController__presentAttachmentsAlertWithOptions_viewController_barButtonItem_forEvent___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _completeWithSelection:2];
}

void __107__EKUIRecurrenceAlertController__presentAttachmentsAlertWithOptions_viewController_barButtonItem_forEvent___block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _completeWithSelection:3];
}

- (void)_configureAlertControllerWithSourceView:(id)a3 sourceRect:(CGRect)a4 barButtonItem:(id)a5
{
  double height = a4.size.height;
  double width = a4.size.width;
  double y = a4.origin.y;
  double x = a4.origin.x;
  id v14 = a3;
  id v11 = a5;
  if (v14)
  {
    id v12 = [(UIAlertController *)self->_alertController popoverPresentationController];
    [v12 setSourceView:v14];

    id v13 = [(UIAlertController *)self->_alertController popoverPresentationController];
    objc_msgSend(v13, "setSourceRect:", x, y, width, height);
  }
  else
  {
    if (!v11) {
      goto LABEL_6;
    }
    id v13 = [(UIAlertController *)self->_alertController popoverPresentationController];
    [v13 setBarButtonItem:v11];
  }

LABEL_6:
}

+ (id)_detachAllLocalizedString
{
  v2 = EventKitUIBundle();
  uint64_t v3 = [v2 localizedStringForKey:@"Save for All Events" value:&stru_1F0CC2140 table:0];

  return v3;
}

+ (id)_detachFutureLocalizedString
{
  v2 = EventKitUIBundle();
  uint64_t v3 = [v2 localizedStringForKey:@"Save for Future Events" value:&stru_1F0CC2140 table:0];

  return v3;
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

- (void)_completeWithSelection:(unint64_t)a3
{
  completionHandler = (void (**)(id, unint64_t))self->_completionHandler;
  if (completionHandler) {
    completionHandler[2](completionHandler, a3);
  }

  [(EKUIRecurrenceAlertController *)self _cleanup];
}

- (void)_cleanup
{
  id completionHandler = self->_completionHandler;
  self->_id completionHandler = 0;

  alertController = self->_alertController;
  self->_alertController = 0;
}

+ (id)_cancelLocalizedString
{
  v2 = EventKitUIBundle();
  BOOL v3 = [v2 localizedStringForKey:@"Cancel - recurrence alert controller" value:@"Cancel" table:0];

  return v3;
}

+ (int)_determineChoicesForEvent:(id)a3 options:(unint64_t)a4
{
  v30[1] = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  char v6 = v5;
  if (!v5)
  {
LABEL_19:
    int v13 = 1;
    goto LABEL_20;
  }
  int v7 = [v5 canDetachSingleOccurrence];
  if ((a4 & 1) != 0 || ![v6 isOrWasPartOfRecurringSeries])
  {
LABEL_16:
    if ((v7 & 1) == 0)
    {
      id v17 = (void *)kEKUILogHandle;
      if (os_log_type_enabled((os_log_t)kEKUILogHandle, OS_LOG_TYPE_ERROR))
      {
        id v18 = NSNumber;
        id v19 = v17;
        id v20 = [v18 numberWithUnsignedInteger:a4];
        int v26 = 138412546;
        v27 = v6;
        __int16 v28 = 2112;
        id v29 = v20;
        _os_log_impl(&dword_1B3F4C000, v19, OS_LOG_TYPE_ERROR, "No choices for event:%@ options:%@", (uint8_t *)&v26, 0x16u);
      }
    }
    goto LABEL_19;
  }
  int v8 = [v6 hasChanges];
  if ((a4 & 8) != 0 && !v8) {
    goto LABEL_8;
  }
  uint64_t v9 = [v6 changeSet];
  uint64_t v10 = *MEMORY[0x1E4F56BB0];
  if ([v9 hasUnsavedChangeForKey:*MEMORY[0x1E4F56BB0]])
  {
    v30[0] = v10;
    id v11 = [MEMORY[0x1E4F1C978] arrayWithObjects:v30 count:1];
    int v12 = [v6 hasUnsavedChangesIgnoreKeys:v11];

    if (!v12)
    {
LABEL_8:
      int v13 = 4;
      goto LABEL_20;
    }
  }
  else
  {
  }
  if ([v6 isExternallyOrganizedInvitation]) {
    goto LABEL_12;
  }
  id v14 = [v6 singleRecurrenceRule];
  char v15 = [v14 recurrenceEndHasChanges];

  if (v15) {
    goto LABEL_12;
  }
  uint64_t v22 = [v6 calendar];
  uint64_t v23 = [v22 source];
  v24 = [v23 constraints];
  if ([v24 prohibitsSlicingEventsWithAttendees])
  {
    if ([v6 hasAttendees])
    {

LABEL_12:
      int v16 = 1;
      goto LABEL_13;
    }
    char v25 = [v6 _hadAttendees];

    if (v25) {
      goto LABEL_12;
    }
  }
  else
  {
  }
  int v16 = 0;
LABEL_13:
  if (![v6 canWeInferUpdateToComplexRecurrenceRule]) {
    goto LABEL_16;
  }
  if (v16) {
    int v13 = v7 | 4;
  }
  else {
    int v13 = v7 | 2;
  }
LABEL_20:

  return v13;
}

- (UIAlertController)alertController
{
  return (UIAlertController *)objc_getProperty(self, a2, 8, 1);
}

- (void)setAlertController:(id)a3
{
}

- (id)completionHandler
{
  return objc_getProperty(self, a2, 16, 1);
}

- (void)setCompletionHandler:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_completionHandler, 0);

  objc_storeStrong((id *)&self->_alertController, 0);
}

@end