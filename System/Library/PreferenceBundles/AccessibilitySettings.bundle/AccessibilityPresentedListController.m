@interface AccessibilityPresentedListController
- (AccessibilityPresentedListController)init;
- (AccessibilityPresentedListDelegate)delegate;
- (BOOL)canBeShownFromSuspendedState;
- (BOOL)showsCancelButton;
- (BOOL)showsSaveButton;
- (CGSize)preferredContentSize;
- (UIBarButtonItem)cancelButton;
- (UIBarButtonItem)saveButton;
- (void)cancel:(id)a3;
- (void)save:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setShowsCancelButton:(BOOL)a3;
- (void)setShowsSaveButton:(BOOL)a3;
@end

@implementation AccessibilityPresentedListController

- (AccessibilityPresentedListController)init
{
  v5.receiver = self;
  v5.super_class = (Class)AccessibilityPresentedListController;
  v2 = [(AccessibilityPresentedListController *)&v5 init];
  v3 = v2;
  if (v2)
  {
    [(AccessibilityPresentedListController *)v2 setShowsCancelButton:1];
    [(AccessibilityPresentedListController *)v3 setShowsSaveButton:1];
  }
  return v3;
}

- (void)setShowsCancelButton:(BOOL)a3
{
  if (self->_showsCancelButton != a3)
  {
    self->_showsCancelButton = a3;
    if (a3)
    {
      id v5 = [objc_alloc((Class)UIBarButtonItem) initWithBarButtonSystemItem:1 target:self action:"cancel:"];
      v4 = [(AccessibilityPresentedListController *)self navigationItem];
      [v4 setLeftBarButtonItem:v5];
    }
  }
}

- (void)setShowsSaveButton:(BOOL)a3
{
  if (self->_showsSaveButton != a3)
  {
    self->_showsSaveButton = a3;
    if (a3)
    {
      id v5 = [objc_alloc((Class)UIBarButtonItem) initWithBarButtonSystemItem:3 target:self action:"save:"];
      v4 = [(AccessibilityPresentedListController *)self navigationItem];
      [v4 setRightBarButtonItem:v5];
    }
  }
}

- (UIBarButtonItem)cancelButton
{
  v2 = [(AccessibilityPresentedListController *)self navigationItem];
  v3 = [v2 leftBarButtonItem];

  return (UIBarButtonItem *)v3;
}

- (UIBarButtonItem)saveButton
{
  v2 = [(AccessibilityPresentedListController *)self navigationItem];
  v3 = [v2 rightBarButtonItem];

  return (UIBarButtonItem *)v3;
}

- (void)save:(id)a3
{
  id v4 = [(AccessibilityPresentedListController *)self delegate];
  [v4 presentedListControllerDidSave:self];
}

- (void)cancel:(id)a3
{
  id v4 = [(AccessibilityPresentedListController *)self delegate];
  [v4 presentedListControllerDidCancel:self];
}

- (CGSize)preferredContentSize
{
  v5.receiver = self;
  v5.super_class = (Class)AccessibilityPresentedListController;
  [(AccessibilityPresentedListController *)&v5 preferredContentSize];
  objc_msgSend(*(id *)&self->AXUISettingsListController_opaque[OBJC_IVAR___PSListController__table], "sizeThatFits:");
  result.height = v4;
  result.width = v3;
  return result;
}

- (BOOL)canBeShownFromSuspendedState
{
  return 0;
}

- (AccessibilityPresentedListDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (AccessibilityPresentedListDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (BOOL)showsCancelButton
{
  return self->_showsCancelButton;
}

- (BOOL)showsSaveButton
{
  return self->_showsSaveButton;
}

- (void).cxx_destruct
{
}

@end