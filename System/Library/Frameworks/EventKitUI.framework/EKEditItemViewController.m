@interface EKEditItemViewController
+ (id)preferredViewControllerForPresentationsFromViewController:(id)a3;
- (BOOL)fitsPopoverWhenKeyboardActive;
- (BOOL)hidesBottomBarWhenPushed;
- (BOOL)modal;
- (BOOL)showsDoneButton;
- (CGSize)preferredContentSize;
- (EKEditItemViewController)initWithFrame:(CGRect)a3;
- (EKEditItemViewControllerDelegate)editDelegate;
- (EKViewControllerRemoteUIDelegate)remoteUIDelegate;
- (double)marginForTableView:(id)a3;
- (double)tableView:(id)a3 heightForFooterInSection:(int64_t)a4;
- (double)tableView:(id)a3 heightForHeaderInSection:(int64_t)a4;
- (unint64_t)subitem;
- (unint64_t)supportedInterfaceOrientations;
- (void)_saveAndDismissWithForce:(BOOL)a3;
- (void)_saveAndDismissWithForce:(BOOL)a3 success:(BOOL)a4;
- (void)cancel;
- (void)didReceiveMemoryWarning;
- (void)popIfNonModal;
- (void)saveAndDismiss;
- (void)saveAndDismissWithExtremePrejudice;
- (void)setCell:(id)a3 checked:(BOOL)a4;
- (void)setEditDelegate:(id)a3;
- (void)setModal:(BOOL)a3;
- (void)setRemoteUIDelegate:(id)a3;
- (void)setShowsDoneButton:(BOOL)a3;
- (void)setSubitem:(unint64_t)a3;
- (void)validateAllowingAlert:(BOOL)a3 callback:(id)a4;
- (void)viewDidLoad;
- (void)viewWillAppear:(BOOL)a3;
- (void)viewWillDisappear:(BOOL)a3;
@end

@implementation EKEditItemViewController

+ (id)preferredViewControllerForPresentationsFromViewController:(id)a3
{
  v3 = [a3 navigationController];
  v4 = [v3 presentingViewController];
  id v5 = [v4 presentedViewController];

  if (!v5)
  {
    if ([v3 definesPresentationContext])
    {
      id v6 = v3;
    }
    else
    {
      id v6 = [v3 parentViewController];
    }
    id v5 = v6;
    if (!v6) {
      id v5 = v3;
    }
  }

  return v5;
}

- (EKEditItemViewController)initWithFrame:(CGRect)a3
{
  CGFloat height = a3.size.height;
  CGFloat width = a3.size.width;
  CGFloat y = a3.origin.y;
  CGFloat x = a3.origin.x;
  v8.receiver = self;
  v8.super_class = (Class)EKEditItemViewController;
  result = [(EKEditItemViewController *)&v8 initWithNibName:0 bundle:0];
  if (result)
  {
    result->_initialFrame.origin.CGFloat x = x;
    result->_initialFrame.origin.CGFloat y = y;
    result->_modal = 0;
    result->_initialFrame.size.CGFloat width = width;
    result->_initialFrame.size.CGFloat height = height;
    result->_showsDoneButton = 1;
  }
  return result;
}

- (BOOL)hidesBottomBarWhenPushed
{
  return 1;
}

- (void)viewWillAppear:(BOOL)a3
{
  v5.receiver = self;
  v5.super_class = (Class)EKEditItemViewController;
  [(EKEditItemViewController *)&v5 viewWillAppear:a3];
  if (![(EKEditItemViewController *)self fitsPopoverWhenKeyboardActive])
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_editDelegate);
    [WeakRetained editItemViewControllerWantsKeyboardPinned:0];
  }
}

- (void)viewDidLoad
{
  v7.receiver = self;
  v7.super_class = (Class)EKEditItemViewController;
  [(EKEditItemViewController *)&v7 viewDidLoad];
  if (self->_modal && self->_showsDoneButton)
  {
    v3 = (void *)[objc_alloc(MEMORY[0x1E4FB14A8]) initWithBarButtonSystemItem:1 target:self action:sel_cancel];
    v4 = [(EKEditItemViewController *)self navigationItem];
    [v4 setLeftBarButtonItem:v3];

    objc_super v5 = (void *)[objc_alloc(MEMORY[0x1E4FB14A8]) initWithBarButtonSystemItem:0 target:self action:sel_saveAndDismiss];
    id v6 = [(EKEditItemViewController *)self navigationItem];
    [v6 setRightBarButtonItem:v5];
  }
}

- (unint64_t)supportedInterfaceOrientations
{
  v2 = [(EKEditItemViewController *)self view];
  IsRegularInViewHierarchCGFloat y = EKUICurrentWidthSizeClassIsRegularInViewHierarchy(v2);

  if (IsRegularInViewHierarchy) {
    return 30;
  }
  else {
    return 26;
  }
}

- (void)viewWillDisappear:(BOOL)a3
{
  v7.receiver = self;
  v7.super_class = (Class)EKEditItemViewController;
  [(EKEditItemViewController *)&v7 viewWillDisappear:a3];
  if (!self->_modal)
  {
    v4 = [(EKEditItemViewController *)self navigationController];
    objc_super v5 = [v4 viewControllers];
    char v6 = [v5 containsObject:self];

    if ((v6 & 1) == 0) {
      [(EKEditItemViewController *)self saveAndDismissWithExtremePrejudice];
    }
  }
}

- (void)cancel
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_editDelegate);
  [WeakRetained editItemViewController:self didCompleteWithAction:0];
}

- (void)_saveAndDismissWithForce:(BOOL)a3
{
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __53__EKEditItemViewController__saveAndDismissWithForce___block_invoke;
  v3[3] = &unk_1E6088610;
  v3[4] = self;
  [(EKEditItemViewController *)self validateAllowingAlert:!a3 callback:v3];
}

uint64_t __53__EKEditItemViewController__saveAndDismissWithForce___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return [*(id *)(a1 + 32) _saveAndDismissWithForce:a2 success:a3];
}

- (void)_saveAndDismissWithForce:(BOOL)a3 success:(BOOL)a4
{
  if (!a4)
  {
    if (!a3) {
      return;
    }
    goto LABEL_8;
  }
  id WeakRetained = objc_loadWeakRetained((id *)&self->_editDelegate);
  char v7 = objc_opt_respondsToSelector();

  if (v7)
  {
    id v8 = objc_loadWeakRetained((id *)&self->_editDelegate);
    int v9 = [v8 editItemViewControllerSave:self];

    if (!a3) {
      goto LABEL_10;
    }
LABEL_8:
    id v10 = objc_loadWeakRetained((id *)&self->_editDelegate);
    int v11 = [v10 editItemViewControllerShouldShowDetachAlert];

    if (v11)
    {
      v12 = [(EKEditItemViewController *)self navigationController];
      v13 = [v12 navigationBar];
      v14 = [(EKEditItemViewController *)self navigationController];
      v15 = [v14 navigationBar];
      [v15 bounds];
      double v17 = v16;
      double v19 = v18;
      double v21 = v20;
      double v23 = v22;
      id v24 = objc_loadWeakRetained((id *)&self->_editDelegate);
      v25 = [v24 editItemEventToDetach];
      v31[0] = MEMORY[0x1E4F143A8];
      v31[1] = 3221225472;
      v31[2] = __61__EKEditItemViewController__saveAndDismissWithForce_success___block_invoke;
      v31[3] = &unk_1E6088638;
      v31[4] = self;
      +[EKUIRecurrenceAlertController presentDetachAlertWithOptions:viewController:sourceView:sourceRect:forEvent:withCompletionHandler:](EKUIRecurrenceAlertController, "presentDetachAlertWithOptions:viewController:sourceView:sourceRect:forEvent:withCompletionHandler:", 0, self, v13, v25, v31, v17, v19, v21, v23);
      v26 = (EKUIRecurrenceAlertController *)objc_claimAutoreleasedReturnValue();
      recurrenceAlertController = self->_recurrenceAlertController;
      self->_recurrenceAlertController = v26;

      return;
    }
    id v30 = objc_loadWeakRetained((id *)&self->_editDelegate);
    objc_msgSend(v30, "editItemViewController:didCompleteWithAction:", self, 2, v30);
    goto LABEL_14;
  }
  int v9 = 1;
  if (a3) {
    goto LABEL_8;
  }
LABEL_10:
  if (!v9) {
    return;
  }
  id v28 = objc_loadWeakRetained((id *)&self->_editDelegate);
  objc_msgSend(v28, "editItemViewController:didCompleteWithAction:", self, 1, v28);
LABEL_14:
}

void __61__EKEditItemViewController__saveAndDismissWithForce_success___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = 0;
  switch(a2)
  {
    case 0:
      uint64_t v3 = 3;
      goto LABEL_5;
    case 1:
      uint64_t v3 = 4;
      goto LABEL_5;
    case 2:
      uint64_t v3 = 5;
      goto LABEL_5;
    case 4:
    case 5:
      return;
    default:
LABEL_5:
      id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 1024));
      [WeakRetained editItemViewController:*(void *)(a1 + 32) didCompleteWithAction:v3];

      uint64_t v5 = *(void *)(a1 + 32);
      char v6 = *(void **)(v5 + 1032);
      *(void *)(v5 + 1032) = 0;

      return;
  }
}

- (void)saveAndDismiss
{
}

- (void)saveAndDismissWithExtremePrejudice
{
}

- (void)popIfNonModal
{
  if (!self->_modal)
  {
    id v3 = [(EKEditItemViewController *)self navigationController];
    id v2 = (id)[v3 popViewControllerAnimated:1];
  }
}

- (void)validateAllowingAlert:(BOOL)a3 callback:(id)a4
{
}

- (void)didReceiveMemoryWarning
{
  v2.receiver = self;
  v2.super_class = (Class)EKEditItemViewController;
  [(EKEditItemViewController *)&v2 didReceiveMemoryWarning];
}

- (CGSize)preferredContentSize
{
  id v3 = [(EKEditItemViewController *)self view];
  objc_msgSend(v3, "sizeThatFits:", 2147483650.0, 2147483650.0);
  double v5 = v4;
  double v7 = v6;

  id v8 = [(EKEditItemViewController *)self navigationController];
  char v9 = [v8 isToolbarHidden];

  if ((v9 & 1) == 0)
  {
    id v10 = [(EKEditItemViewController *)self navigationController];
    int v11 = [v10 toolbar];
    [v11 bounds];
    double v7 = v7 + CGRectGetHeight(v17);
  }
  v12 = [(EKEditItemViewController *)self view];
  IsRegularInViewHierarchCGFloat y = EKUICurrentWidthSizeClassIsRegularInViewHierarchy(v12);

  if (IsRegularInViewHierarchy)
  {
    if (v7 > 600.0) {
      double v7 = 600.0;
    }
    double v5 = EKUIContainedControllerIdealWidth();
  }
  double v14 = v5;
  double v15 = v7;
  result.CGFloat height = v15;
  result.CGFloat width = v14;
  return result;
}

- (BOOL)fitsPopoverWhenKeyboardActive
{
  return 1;
}

- (void)setCell:(id)a3 checked:(BOOL)a4
{
  BOOL v4 = a4;
  id v8 = a3;
  if ([v8 accessoryType] == 3 || !objc_msgSend(v8, "accessoryType"))
  {
    if (v4) {
      uint64_t v5 = 3;
    }
    else {
      uint64_t v5 = 0;
    }
    double v6 = [MEMORY[0x1E4FB1618] labelColor];
    [v8 setAccessoryType:v5];
    [v8 setAccessoryView:0];
    double v7 = [v8 textLabel];
    [v7 setTextColor:v6];
  }
}

- (double)marginForTableView:(id)a3
{
  return 0.0;
}

- (double)tableView:(id)a3 heightForHeaderInSection:(int64_t)a4
{
  return 0.0;
}

- (double)tableView:(id)a3 heightForFooterInSection:(int64_t)a4
{
  return 0.0;
}

- (EKEditItemViewControllerDelegate)editDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_editDelegate);

  return (EKEditItemViewControllerDelegate *)WeakRetained;
}

- (void)setEditDelegate:(id)a3
{
}

- (EKViewControllerRemoteUIDelegate)remoteUIDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_remoteUIDelegate);

  return (EKViewControllerRemoteUIDelegate *)WeakRetained;
}

- (void)setRemoteUIDelegate:(id)a3
{
}

- (unint64_t)subitem
{
  return self->_subitem;
}

- (void)setSubitem:(unint64_t)a3
{
  self->_subitem = a3;
}

- (BOOL)modal
{
  return self->_modal;
}

- (void)setModal:(BOOL)a3
{
  self->_modal = a3;
}

- (BOOL)showsDoneButton
{
  return self->_showsDoneButton;
}

- (void)setShowsDoneButton:(BOOL)a3
{
  self->_showsDoneButton = a3;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_remoteUIDelegate);
  objc_storeStrong((id *)&self->_recurrenceAlertController, 0);

  objc_destroyWeak((id *)&self->_editDelegate);
}

@end