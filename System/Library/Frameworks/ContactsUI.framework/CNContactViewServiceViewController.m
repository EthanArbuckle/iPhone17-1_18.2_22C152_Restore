@interface CNContactViewServiceViewController
+ (Class)classForContentViewControllerImpl;
- (BOOL)shouldPerformDefaultActionForContact:(id)a3 propertyKey:(id)a4 propertyIdentifier:(id)a5;
- (CNContactContentViewController)contactContentVC;
- (CNContactViewServiceViewController)init;
- (void)didChangePreferredContentSize:(CGSize)a3;
- (void)didCompleteWithContact:(id)a3;
- (void)didDeleteContact:(id)a3;
- (void)didExecuteClearRecentsDataAction;
- (void)didExecuteDeleteFromDowntimeWhitelistAction;
- (void)isPresentingEditingController:(BOOL)a3;
- (void)isPresentingFullscreen:(BOOL)a3;
- (void)presentCancelConfirmationAlert;
- (void)setContactContentVC:(id)a3;
- (void)updateEditing:(BOOL)a3 doneButtonEnabled:(BOOL)a4 doneButtonText:(id)a5;
- (void)viewDidAppear;
- (void)viewDidLoad;
@end

@implementation CNContactViewServiceViewController

- (void).cxx_destruct
{
}

- (void)setContactContentVC:(id)a3
{
}

- (CNContactContentViewController)contactContentVC
{
  return self->_contactContentVC;
}

- (void)presentCancelConfirmationAlert
{
  id v2 = [(CNContactViewServiceViewController *)self extensionContext];
  [v2 presentCancelConfirmationAlert];
}

- (void)didExecuteDeleteFromDowntimeWhitelistAction
{
  id v2 = [(CNContactViewServiceViewController *)self extensionContext];
  [v2 didExecuteDeleteFromDowntimeWhitelistAction];
}

- (void)didExecuteClearRecentsDataAction
{
  id v2 = [(CNContactViewServiceViewController *)self extensionContext];
  [v2 didExecuteClearRecentsDataAction];
}

- (void)viewDidAppear
{
  id v2 = [(CNContactViewServiceViewController *)self extensionContext];
  [v2 viewDidAppear];
}

- (void)didChangePreferredContentSize:(CGSize)a3
{
  double height = a3.height;
  double width = a3.width;
  id v5 = [(CNContactViewServiceViewController *)self extensionContext];
  objc_msgSend(v5, "didChangePreferredContentSize:", width, height);
}

- (void)isPresentingEditingController:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = [(CNContactViewServiceViewController *)self extensionContext];
  [v4 isPresentingEditingController:v3];
}

- (void)isPresentingFullscreen:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = [(CNContactViewServiceViewController *)self extensionContext];
  [v4 isPresentingFullscreen:v3];
}

- (void)didDeleteContact:(id)a3
{
  id v4 = a3;
  id v5 = [(CNContactViewServiceViewController *)self extensionContext];
  [v5 didDeleteContact:v4];
}

- (void)didCompleteWithContact:(id)a3
{
  id v4 = a3;
  id v5 = [(CNContactViewServiceViewController *)self extensionContext];
  [v5 didCompleteWithContact:v4];
}

- (void)updateEditing:(BOOL)a3 doneButtonEnabled:(BOOL)a4 doneButtonText:(id)a5
{
  BOOL v5 = a4;
  BOOL v6 = a3;
  id v8 = a5;
  id v9 = [(CNContactViewServiceViewController *)self extensionContext];
  [v9 updateEditing:v6 doneButtonEnabled:v5 doneButtonText:v8];
}

- (BOOL)shouldPerformDefaultActionForContact:(id)a3 propertyKey:(id)a4 propertyIdentifier:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  v11 = [(CNContactViewServiceViewController *)self extensionContext];
  char v12 = [v11 shouldPerformDefaultActionForContact:v10 propertyKey:v9 propertyIdentifier:v8];

  return v12;
}

- (void)viewDidLoad
{
  v4.receiver = self;
  v4.super_class = (Class)CNContactViewServiceViewController;
  [(CNContactViewServiceViewController *)&v4 viewDidLoad];
  BOOL v3 = [(CNContactViewServiceViewController *)self contactContentVC];
  [(UIViewController *)self cnui_addChildViewController:v3];
}

- (CNContactViewServiceViewController)init
{
  v8.receiver = self;
  v8.super_class = (Class)CNContactViewServiceViewController;
  id v2 = [(CNContactViewServiceViewController *)&v8 init];
  id v3 = objc_alloc((Class)[(id)objc_opt_class() classForContentViewControllerImpl]);
  objc_super v4 = +[CNUIContactsEnvironment currentEnvironment];
  uint64_t v5 = [v3 initWithEnvironment:v4];
  contactContentVC = v2->_contactContentVC;
  v2->_contactContentVC = (CNContactContentViewController *)v5;

  [(CNContactContentViewController *)v2->_contactContentVC setDelegate:v2];
  [(CNContactContentViewController *)v2->_contactContentVC setPptDelegate:v2];
  return v2;
}

+ (Class)classForContentViewControllerImpl
{
  id v2 = [MEMORY[0x1E4F5A3D8] currentEnvironment];
  id v3 = [v2 featureFlags];
  [v3 isFeatureEnabled:4];

  objc_super v4 = objc_opt_class();

  return (Class)v4;
}

@end