@interface TPSPhonebookDetailController
- (TPSPhonebookController)phonebookController;
- (UIBarButtonItem)saveBarButtonItem;
- (id)errorAlertControllerWithMessage:(id)a3;
- (void)saveAction;
- (void)setSaveBarButtonItem:(id)a3;
- (void)viewDidLoad;
- (void)viewWillAppear:(BOOL)a3;
@end

@implementation TPSPhonebookDetailController

- (void)viewDidLoad
{
  v9.receiver = self;
  v9.super_class = (Class)TPSPhonebookDetailController;
  [(TPSPhonebookDetailController *)&v9 viewDidLoad];
  v3 = [(TPSPhonebookDetailController *)self phonebookController];
  unsigned int v4 = [v3 isSubscriptionEditable];

  if (v4)
  {
    uint64_t v5 = objc_opt_class();
    v6 = [(TPSPhonebookDetailController *)self saveBarButtonItem];
  }
  else
  {
    uint64_t v5 = objc_opt_class();
    v6 = 0;
  }
  v7 = [(TPSPhonebookDetailController *)self specifier];
  [v7 setEditPaneClass:v5];

  v8 = [(TPSPhonebookDetailController *)self navigationItem];
  [v8 setRightBarButtonItem:v6];

  [(TPSPhonebookDetailController *)self setPane:0];
  [(TPSPhonebookDetailController *)self loadPane];
}

- (void)viewWillAppear:(BOOL)a3
{
  v7.receiver = self;
  v7.super_class = (Class)TPSPhonebookDetailController;
  [(TPSPhonebookDetailController *)&v7 viewWillAppear:a3];
  unsigned int v4 = [(TPSPhonebookDetailController *)self pane];
  uint64_t v5 = [(TPSPhonebookDetailController *)self phonebookController];
  v6 = [v5 localizedSubscriptionTelephoneNumber];
  [v4 setPreferenceValue:v6];
}

- (UIBarButtonItem)saveBarButtonItem
{
  saveBarButtonItem = self->_saveBarButtonItem;
  if (!saveBarButtonItem)
  {
    unsigned int v4 = (UIBarButtonItem *)[objc_alloc((Class)UIBarButtonItem) initWithBarButtonSystemItem:3 target:self action:"saveAction"];
    uint64_t v5 = self->_saveBarButtonItem;
    self->_saveBarButtonItem = v4;

    saveBarButtonItem = self->_saveBarButtonItem;
  }

  return saveBarButtonItem;
}

- (TPSPhonebookController)phonebookController
{
  p_phonebookController = &self->_phonebookController;
  phonebookController = self->_phonebookController;
  if (!phonebookController)
  {
    uint64_t v5 = [(TPSPhonebookDetailController *)self specifier];
    v6 = (objc_class *)objc_opt_class();
    objc_super v7 = NSStringFromClass(v6);
    v8 = [v5 propertyForKey:v7];

    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      objc_storeStrong((id *)p_phonebookController, v8);
    }
    if (!*p_phonebookController)
    {
      objc_super v9 = [(TPSDetailController *)self subscriptionContext];
      if (v9)
      {
        v10 = [[TPSPhonebookController alloc] initWithSubscriptionContext:v9];
        v11 = *p_phonebookController;
        *p_phonebookController = v10;
      }
    }

    phonebookController = *p_phonebookController;
  }

  return phonebookController;
}

- (void)saveAction
{
  v3 = [(TPSPhonebookDetailController *)self pane];
  unsigned int v4 = [v3 preferenceValue];

  if (v4)
  {
    uint64_t v5 = [(TPSPhonebookDetailController *)self phonebookController];
    v6[0] = _NSConcreteStackBlock;
    v6[1] = 3221225472;
    v6[2] = sub_3D84;
    v6[3] = &unk_8260;
    id v7 = v4;
    v8 = self;
    [v5 updateSubscriptionTelephoneNumber:v7 completion:v6];
  }
}

- (id)errorAlertControllerWithMessage:(id)a3
{
  id v3 = a3;
  unsigned int v4 = +[TPSPhonebookStrings localizedStringForKey:@"ERROR_ALERT_CONTROLLER_TITLE"];
  uint64_t v5 = +[UIAlertController alertControllerWithTitle:v4 message:v3 preferredStyle:1];

  v6 = +[TPSPhonebookStrings localizedStringForKey:@"ERROR_ALERT_ACTION_TITLE_DISMISS"];
  id v7 = +[UIAlertAction actionWithTitle:v6 style:0 handler:0];
  [v5 addAction:v7];

  return v5;
}

- (void)setSaveBarButtonItem:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_saveBarButtonItem, 0);

  objc_storeStrong((id *)&self->_phonebookController, 0);
}

@end