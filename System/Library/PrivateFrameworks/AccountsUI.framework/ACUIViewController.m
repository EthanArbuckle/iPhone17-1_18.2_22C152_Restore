@interface ACUIViewController
+ (BOOL)shouldPresentAsModalSheet;
+ (id)acuiAccountStore;
+ (id)guestUserModeContentUnavailableConfiguration:(id)a3;
- (ACAccountStore)accountStore;
- (ACUIAccountOperationsHelper)accountOperationsHelper;
- (ACUIViewController)init;
- (ACUIViewControllerAccountChangeObserver)accountChangeObserver;
- (BOOL)isPresentedAsModalSheet;
- (BOOL)isShowingActivityInProgressUI;
- (BOOL)shouldReloadSpecifiersOnResume;
- (BOOL)validationInProgress;
- (UIBarButtonItem)cancelButton;
- (UIBarButtonItem)doneButton;
- (id)_actionSheetWithButtons:(id)a3 title:(id)a4 destructive:(BOOL)a5 cancelButtonIndex:(int64_t)a6 context:(id)a7;
- (id)_alertViewWithButtons:(id)a3 title:(id)a4 message:(id)a5 cancelButtonIndex:(int64_t)a6 context:(id)a7;
- (id)_effectiveParentController;
- (id)operationsHelper:(id)a3 desiredDataclassActionFromPicker:(id)a4;
- (id)showAlertViewWithButtons:(id)a3 title:(id)a4 message:(id)a5 destructive:(BOOL)a6 cancelButtonIndex:(int64_t)a7 context:(id)a8 completion:(id)a9;
- (id)showAlertViewWithButtons:(id)a3 title:(id)a4 message:(id)a5 destructive:(BOOL)a6 context:(id)a7 completion:(id)a8;
- (id)showConfirmationViewForDeletingAccount:(id)a3 context:(id)a4 completion:(id)a5;
- (id)showConfirmationViewWithButtons:(id)a3 title:(id)a4 message:(id)a5 destructive:(BOOL)a6 cancelButtonIndex:(int64_t)a7 context:(id)a8 completion:(id)a9;
- (id)showConfirmationViewWithButtons:(id)a3 title:(id)a4 message:(id)a5 destructive:(BOOL)a6 cancelButtonIndex:(int64_t)a7 context:(id)a8 forceAlert:(BOOL)a9 completion:(id)a10;
- (id)showConfirmationViewWithButtons:(id)a3 title:(id)a4 message:(id)a5 destructive:(BOOL)a6 context:(id)a7 completion:(id)a8;
- (id)specifiers;
- (void)actionSheet:(id)a3 didDismissWithButtonIndex:(int64_t)a4;
- (void)alertView:(id)a3 didDismissWithButtonIndex:(int64_t)a4;
- (void)cancelButtonTapped:(id)a3;
- (void)confirmationView:(id)a3 clickedButtonAtIndex:(int64_t)a4;
- (void)dealloc;
- (void)dismissAnimated:(BOOL)a3;
- (void)doneButtonTapped:(id)a3;
- (void)hideActivityInProgressUI;
- (void)hideActivityInProgressUIWithDelay:(double)a3;
- (void)operationsHelper:(id)a3 didRemoveAccount:(id)a4 withSuccess:(BOOL)a5 error:(id)a6;
- (void)operationsHelper:(id)a3 didSaveAccount:(id)a4 withSuccess:(BOOL)a5 error:(id)a6;
- (void)operationsHelper:(id)a3 willRemoveAccount:(id)a4;
- (void)operationsHelper:(id)a3 willSaveAccount:(id)a4;
- (void)reloadAllParentSpecifiers;
- (void)reloadAllParentSpecifiersAnimated:(BOOL)a3;
- (void)reloadParentSpecifier;
- (void)removeParentSpecifier;
- (void)setAccountChangeObserver:(id)a3;
- (void)setAccountOperationsHelper:(id)a3;
- (void)setAccountStore:(id)a3;
- (void)setCancelButton:(id)a3;
- (void)setCellsChecked:(BOOL)a3;
- (void)setDoneButton:(id)a3;
- (void)setTaskCompletionAssertionEnabled:(BOOL)a3;
- (void)setValidationInProgress:(BOOL)a3;
- (void)showActivityInProgressUIWithMessage:(id)a3;
- (void)showConfirmationForDeletingAccount:(id)a3 completion:(id)a4;
- (void)showConfirmationWithActions:(id)a3 title:(id)a4 message:(id)a5;
- (void)showConfirmationWithButtons:(id)a3 title:(id)a4 message:(id)a5 destructive:(BOOL)a6 completion:(id)a7;
- (void)startValidationWithPrompt:(id)a3;
- (void)startValidationWithPrompt:(id)a3 userInteraction:(BOOL)a4;
- (void)stopValidationWithPrompt:(id)a3 showButtons:(BOOL)a4;
- (void)updateValidationPrompt:(id)a3;
- (void)viewDidLoad;
@end

@implementation ACUIViewController

- (ACUIViewController)init
{
  SEL v6 = a2;
  v7 = 0;
  v5.receiver = self;
  v5.super_class = (Class)ACUIViewController;
  v4 = [(ACUIViewController *)&v5 init];
  v7 = v4;
  objc_storeStrong((id *)&v7, v4);
  if (v4)
  {
    v7->_validationInProgress = 0;
    v7->_addedToTaskList = 0;
    v7->_activityInProgress = 0;
  }
  v3 = v7;
  objc_storeStrong((id *)&v7, 0);
  return v3;
}

- (void)dealloc
{
  v4 = self;
  SEL v3 = a2;
  [(ACUIViewController *)self hideActivityInProgressUI];
  v2.receiver = v4;
  v2.super_class = (Class)ACUIViewController;
  [(ACUIViewController *)&v2 dealloc];
}

- (void)viewDidLoad
{
  v18 = self;
  SEL v17 = a2;
  v16.receiver = self;
  v16.super_class = (Class)ACUIViewController;
  [(ACUIViewController *)&v16 viewDidLoad];
  if (!v18->_cancelButton)
  {
    id v13 = objc_alloc(MEMORY[0x1E4F427C0]);
    id v15 = (id)[MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
    id v14 = (id)[v15 localizedStringForKey:@"CANCEL" value:&stru_1F39EF5C0 table:@"Localizable"];
    uint64_t v2 = objc_msgSend(v13, "initWithTitle:style:target:action:");
    cancelButton = v18->_cancelButton;
    v18->_cancelButton = (UIBarButtonItem *)v2;
  }
  if (!v18->_doneButton)
  {
    id v10 = objc_alloc(MEMORY[0x1E4F427C0]);
    id v12 = (id)[MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
    id v11 = (id)[v12 localizedStringForKey:@"DONE" value:&stru_1F39EF5C0 table:@"Localizable"];
    uint64_t v4 = objc_msgSend(v10, "initWithTitle:style:target:action:");
    doneButton = v18->_doneButton;
    v18->_doneButton = (UIBarButtonItem *)v4;
  }
  SEL v6 = v18->_cancelButton;
  id v7 = (id)[(ACUIViewController *)v18 navigationItem];
  [v7 setLeftBarButtonItem:v6];

  v8 = v18->_doneButton;
  id v9 = (id)[(ACUIViewController *)v18 navigationItem];
  [v9 setRightBarButtonItem:v8];
}

- (id)specifiers
{
  return objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.super.super.isa
                                                 + (int)*MEMORY[0x1E4F92F08]));
}

- (BOOL)shouldReloadSpecifiersOnResume
{
  return 0;
}

+ (BOOL)shouldPresentAsModalSheet
{
  return 1;
}

+ (id)guestUserModeContentUnavailableConfiguration:(id)a3
{
  location[2] = a1;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v25 = (id)[MEMORY[0x1E4F428E8] emptyConfiguration];
  id v8 = (id)[MEMORY[0x1E4F42A80] systemImageNamed:@"person.crop.circle.dashed"];
  objc_msgSend(v25, "setImage:");

  id v9 = (void *)MEMORY[0x1E4F42A98];
  id v12 = (id)[MEMORY[0x1E4F42A40] defaultMetrics];
  [v12 scaledValueForValue:28.0];
  id v11 = (id)objc_msgSend(v9, "configurationWithPointSize:");
  id v10 = (id)[v25 imageProperties];
  [v10 setPreferredSymbolConfiguration:v11];

  id v13 = (id)[MEMORY[0x1E4F42A40] defaultMetrics];
  [v13 scaledValueForValue:12.0];
  objc_msgSend(v25, "setImageToTextPadding:");

  id v15 = (id)[MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
  id v14 = (id)objc_msgSend(v15, "localizedStringForKey:value:table:", @"CONTENT_UNAVAILABLE_SHARING_MODE_TEXT");
  objc_msgSend(v25, "setText:");

  objc_super v16 = (void *)MEMORY[0x1E4F42A30];
  id v19 = (id)[MEMORY[0x1E4F42A40] defaultMetrics];
  [v19 scaledValueForValue:22.0];
  id v18 = (id)objc_msgSend(v16, "systemFontOfSize:weight:");
  id v17 = (id)[v25 textProperties];
  [v17 setFont:v18];

  id v21 = (id)[MEMORY[0x1E4F428B8] labelColor];
  id v20 = (id)[v25 textProperties];
  [v20 setColor:v21];

  id v23 = (id)[MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
  id v22 = (id)[v23 localizedStringForKey:@"CONTENT_UNAVAILABLE_SHARING_MODE_SECONDARY_TEXT" value:&stru_1F39EF5C0 table:@"Localizable"];
  objc_msgSend(v25, "setSecondaryText:");

  [v25 directionalLayoutMargins];
  [location[0] safeAreaInsets];
  [location[0] safeAreaInsets];
  [location[0] safeAreaInsets];
  [location[0] safeAreaInsets];
  NSDirectionalEdgeInsetsMake();
  objc_msgSend(v25, "setDirectionalLayoutMargins:", v3, v4, v5, v6);
  id v24 = v25;
  objc_storeStrong(&v25, 0);
  objc_storeStrong(location, 0);
  return v24;
}

- (BOOL)isPresentedAsModalSheet
{
  id v3 = (id)[(ACUIViewController *)self parentController];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

- (void)dismissAnimated:(BOOL)a3
{
  BOOL v6 = a3;
  if ([(ACUIViewController *)self isPresentedAsModalSheet])
  {
    id v5 = (id)[(ACUIViewController *)self navigationController];
    [v5 dismissViewControllerAnimated:v6 completion:0];
  }
  else
  {
    id v4 = (id)[(ACUIViewController *)self navigationController];
    id v3 = (id)[v4 popViewControllerAnimated:v6];
  }
}

- (void)cancelButtonTapped:(id)a3
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v12 = self;
  SEL v11 = a2;
  id location = 0;
  objc_storeStrong(&location, a3);
  os_log_t oslog = (os_log_t)_ACUILogSystem();
  os_log_type_t type = OS_LOG_TYPE_DEFAULT;
  if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEFAULT))
  {
    log = oslog;
    os_log_type_t v5 = type;
    uint64_t v3 = (uint64_t)v12;
    BOOL v6 = NSStringFromSelector(v11);
    id v7 = v6;
    __os_log_helper_16_2_5_8_32_4_0_8_66_8_66_8_66((uint64_t)v13, (uint64_t)"-[ACUIViewController cancelButtonTapped:]", 147, v3, (uint64_t)v7, (uint64_t)location);
    _os_log_impl(&dword_1DDFE5000, log, v5, "%s (%d) @\"%{public}@ %{public}@: %{public}@\"", v13, 0x30u);

    objc_storeStrong((id *)&v7, 0);
  }
  objc_storeStrong((id *)&oslog, 0);
  objc_storeStrong(&location, 0);
}

- (void)doneButtonTapped:(id)a3
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v12 = self;
  SEL v11 = a2;
  id location = 0;
  objc_storeStrong(&location, a3);
  os_log_t oslog = (os_log_t)_ACUILogSystem();
  os_log_type_t type = OS_LOG_TYPE_DEFAULT;
  if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEFAULT))
  {
    log = oslog;
    os_log_type_t v5 = type;
    uint64_t v3 = (uint64_t)v12;
    BOOL v6 = NSStringFromSelector(v11);
    id v7 = v6;
    __os_log_helper_16_2_5_8_32_4_0_8_66_8_66_8_66((uint64_t)v13, (uint64_t)"-[ACUIViewController doneButtonTapped:]", 152, v3, (uint64_t)v7, (uint64_t)location);
    _os_log_impl(&dword_1DDFE5000, log, v5, "%s (%d) @\"%{public}@ %{public}@: %{public}@\"", v13, 0x30u);

    objc_storeStrong((id *)&v7, 0);
  }
  objc_storeStrong((id *)&oslog, 0);
  objc_storeStrong(&location, 0);
}

- (void)showConfirmationWithButtons:(id)a3 title:(id)a4 message:(id)a5 destructive:(BOOL)a6 completion:(id)a7
{
  v33 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v31 = 0;
  objc_storeStrong(&v31, a4);
  id v30 = 0;
  objc_storeStrong(&v30, a5);
  BOOL v29 = a6;
  id v28 = 0;
  objc_storeStrong(&v28, a7);
  id v27 = (id)objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(location[0], "count"));
  for (int i = 0; ; ++i)
  {
    unint64_t v12 = i;
    if (v12 >= [location[0] count]) {
      break;
    }
    uint64_t v25 = 0;
    uint64_t v11 = i;
    if (v11 == [location[0] count] - 1)
    {
      uint64_t v25 = 1;
    }
    else if (v29)
    {
      uint64_t v10 = i;
      if (v10 == [location[0] count] - 2) {
        uint64_t v25 = 2;
      }
    }
    id v8 = (void *)MEMORY[0x1E4F42720];
    id v9 = (id)[location[0] objectAtIndexedSubscript:i];
    uint64_t v7 = v25;
    uint64_t v17 = MEMORY[0x1E4F143A8];
    int v18 = -1073741824;
    int v19 = 0;
    id v20 = __87__ACUIViewController_showConfirmationWithButtons_title_message_destructive_completion___block_invoke;
    id v21 = &unk_1E6D1FE38;
    id v22 = v28;
    int v23 = i;
    id v24 = (id)[v8 actionWithTitle:v9 style:v7 handler:&v17];

    [v27 addObject:v24];
    objc_storeStrong(&v24, 0);
    objc_storeStrong(&v22, 0);
  }
  [(ACUIViewController *)v33 showConfirmationWithActions:v27 title:v31 message:v30];
  objc_storeStrong(&v27, 0);
  objc_storeStrong(&v28, 0);
  objc_storeStrong(&v30, 0);
  objc_storeStrong(&v31, 0);
  objc_storeStrong(location, 0);
}

void __87__ACUIViewController_showConfirmationWithButtons_title_message_destructive_completion___block_invoke(void *a1, void *a2)
{
  location[1] = a1;
  location[0] = 0;
  objc_storeStrong(location, a2);
  if (a1[4]) {
    (*(void (**)(void))(a1[4] + 16))();
  }
  objc_storeStrong(location, 0);
}

- (void)showConfirmationWithActions:(id)a3 title:(id)a4 message:(id)a5
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  uint64_t v25 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v23 = 0;
  objc_storeStrong(&v23, a4);
  id v22 = 0;
  objc_storeStrong(&v22, a5);
  id v13 = (void *)MEMORY[0x1E4F42728];
  id v14 = v23;
  id v15 = v22;
  uint64_t v26 = 0;
  id v16 = (id)[MEMORY[0x1E4F42948] currentDevice];
  uint64_t v17 = [v16 userInterfaceIdiom];

  uint64_t v26 = v17;
  BOOL v18 = 1;
  if (v17 != 1) {
    BOOL v18 = v26 == 5;
  }
  id v21 = (id)[v13 alertControllerWithTitle:v14 message:v15 preferredStyle:v18];
  memset(__b, 0, sizeof(__b));
  id v9 = location[0];
  uint64_t v10 = [v9 countByEnumeratingWithState:__b objects:v27 count:16];
  if (v10)
  {
    uint64_t v6 = *(void *)__b[2];
    uint64_t v7 = 0;
    unint64_t v8 = v10;
    while (1)
    {
      uint64_t v5 = v7;
      if (*(void *)__b[2] != v6) {
        objc_enumerationMutation(v9);
      }
      uint64_t v20 = *(void *)(__b[1] + 8 * v7);
      [v21 addAction:v20];
      ++v7;
      if (v5 + 1 >= v8)
      {
        uint64_t v7 = 0;
        unint64_t v8 = [v9 countByEnumeratingWithState:__b objects:v27 count:16];
        if (!v8) {
          break;
        }
      }
    }
  }

  -[ACUIViewController presentViewController:animated:completion:](v25, "presentViewController:animated:completion:", v21, 1);
  [(ACUIViewController *)v25 setTaskCompletionAssertionEnabled:0];
  objc_storeStrong(&v21, 0);
  objc_storeStrong(&v22, 0);
  objc_storeStrong(&v23, 0);
  objc_storeStrong(location, 0);
}

- (void)showConfirmationForDeletingAccount:(id)a3 completion:(id)a4
{
  v24[2] = *MEMORY[0x1E4F143B8];
  id v23 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v21 = 0;
  objc_storeStrong(&v21, a4);
  id v5 = (id)[location[0] enabledDataclasses];
  id v20 = (id)[v5 allObjects];

  uint64_t v6 = NSString;
  id v9 = (id)[MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
  id v8 = (id)objc_msgSend(v9, "localizedStringForKey:value:table:", @"DELETE_ACCOUNT_WARNING_FORMAT");
  id v7 = +[ACUILocalization localizedTextForDataclasses:v20 usedAtBeginningOfSentence:0 forAccount:location[0]];
  id v19 = (id)objc_msgSend(v6, "stringWithFormat:", v8, v7);

  id v13 = (id)[MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
  id v12 = (id)objc_msgSend(v13, "localizedStringForKey:value:table:");
  v24[0] = v12;
  id v11 = (id)[MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
  id v10 = (id)[v11 localizedStringForKey:@"CANCEL" value:&stru_1F39EF5C0 table:@"Localizable"];
  v24[1] = v10;
  id v18 = (id)[MEMORY[0x1E4F1C978] arrayWithObjects:v24 count:2];

  id v15 = v23;
  id v14 = v18;
  id v17 = (id)[MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
  id v16 = (id)[v17 localizedStringForKey:@"DELETE_ACCOUNT" value:&stru_1F39EF5C0 table:@"Localizable"];
  -[ACUIViewController showConfirmationWithButtons:title:message:destructive:completion:](v15, "showConfirmationWithButtons:title:message:destructive:completion:", v14);

  objc_storeStrong(&v18, 0);
  objc_storeStrong(&v19, 0);
  objc_storeStrong(&v20, 0);
  objc_storeStrong(&v21, 0);
  objc_storeStrong(location, 0);
}

- (id)showConfirmationViewWithButtons:(id)a3 title:(id)a4 message:(id)a5 destructive:(BOOL)a6 cancelButtonIndex:(int64_t)a7 context:(id)a8 forceAlert:(BOOL)a9 completion:(id)a10
{
  uint64_t v46 = *MEMORY[0x1E4F143B8];
  v41 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v39 = 0;
  objc_storeStrong(&v39, a4);
  id v38 = 0;
  objc_storeStrong(&v38, a5);
  BOOL v37 = a6;
  int64_t v36 = a7;
  id v35 = 0;
  objc_storeStrong(&v35, a8);
  BOOL v34 = a9;
  id v33 = 0;
  objc_storeStrong(&v33, a10);
  if (v41->_confirmationViewCompletion)
  {
    id v32 = _ACUILogSystem();
    os_log_type_t v31 = OS_LOG_TYPE_ERROR;
    if (os_log_type_enabled((os_log_t)v32, OS_LOG_TYPE_ERROR))
    {
      __os_log_helper_16_2_2_8_32_4_0((uint64_t)v45, (uint64_t)"-[ACUIViewController showConfirmationViewWithButtons:title:message:destructive:cancelButtonIndex:context:forceAlert:completion:]", 242);
      _os_log_error_impl(&dword_1DDFE5000, (os_log_t)v32, v31, "%s (%d) \"Not showing confirmation view because another confirmation view's completion handler is still pending.\"", v45, 0x12u);
    }
    objc_storeStrong(&v32, 0);
    id v42 = 0;
    int v30 = 1;
  }
  else
  {
    id v29 = _ACUILogSystem();
    os_log_type_t v28 = OS_LOG_TYPE_DEBUG;
    if (os_log_type_enabled((os_log_t)v29, OS_LOG_TYPE_DEBUG))
    {
      __os_log_helper_16_2_2_8_32_4_0((uint64_t)v44, (uint64_t)"-[ACUIViewController showConfirmationViewWithButtons:title:message:destructive:cancelButtonIndex:context:forceAlert:completion:]", 246);
      _os_log_debug_impl(&dword_1DDFE5000, (os_log_t)v29, v28, "%s (%d) \"Setting confirmation view completion handler.\"", v44, 0x12u);
    }
    objc_storeStrong(&v29, 0);
    uint64_t v10 = MEMORY[0x1E01CBE70](v33);
    id confirmationViewCompletion = v41->_confirmationViewCompletion;
    v41->_id confirmationViewCompletion = (id)v10;

    id v27 = 0;
    uint64_t v43 = 0;
    id v19 = (id)[MEMORY[0x1E4F42948] currentDevice];
    uint64_t v20 = [v19 userInterfaceIdiom];

    uint64_t v43 = v20;
    BOOL v21 = 1;
    if (v20 != 1) {
      BOOL v21 = v43 == 5;
    }
    if (v21 || v34)
    {
      id v12 = [(ACUIViewController *)v41 _alertViewWithButtons:location[0] title:v39 message:v38 cancelButtonIndex:v36 context:v35];
      id v13 = v27;
      id v27 = v12;

      [v27 show];
    }
    else
    {
      id v14 = [(ACUIViewController *)v41 _actionSheetWithButtons:location[0] title:v38 destructive:v37 cancelButtonIndex:v36 context:v35];
      id v15 = v27;
      id v27 = v14;

      id v18 = (id)[(ACUIViewController *)v41 view];
      objc_msgSend(v27, "showInView:");
    }
    [(ACUIViewController *)v41 setTaskCompletionAssertionEnabled:0];
    id v42 = v27;
    int v30 = 1;
    objc_storeStrong(&v27, 0);
  }
  objc_storeStrong(&v33, 0);
  objc_storeStrong(&v35, 0);
  objc_storeStrong(&v38, 0);
  objc_storeStrong(&v39, 0);
  objc_storeStrong(location, 0);
  id v16 = v42;
  return v16;
}

- (id)showConfirmationViewWithButtons:(id)a3 title:(id)a4 message:(id)a5 destructive:(BOOL)a6 cancelButtonIndex:(int64_t)a7 context:(id)a8 completion:(id)a9
{
  id v24 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v22 = 0;
  objc_storeStrong(&v22, a4);
  id v21 = 0;
  objc_storeStrong(&v21, a5);
  BOOL v20 = a6;
  int64_t v19 = a7;
  id v18 = 0;
  objc_storeStrong(&v18, a8);
  id v17 = 0;
  objc_storeStrong(&v17, a9);
  LOBYTE(v10) = 0;
  id v16 = [(ACUIViewController *)v24 showConfirmationViewWithButtons:location[0] title:v22 message:v21 destructive:v20 cancelButtonIndex:v19 context:v18 forceAlert:v10 completion:v17];
  objc_storeStrong(&v17, 0);
  objc_storeStrong(&v18, 0);
  objc_storeStrong(&v21, 0);
  objc_storeStrong(&v22, 0);
  objc_storeStrong(location, 0);
  return v16;
}

- (id)showConfirmationViewWithButtons:(id)a3 title:(id)a4 message:(id)a5 destructive:(BOOL)a6 context:(id)a7 completion:(id)a8
{
  v41 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v39 = 0;
  objc_storeStrong(&v39, a4);
  id v38 = 0;
  objc_storeStrong(&v38, a5);
  BOOL v37 = a6;
  id v36 = 0;
  objc_storeStrong(&v36, a7);
  id v35 = 0;
  objc_storeStrong(&v35, a8);
  uint64_t v34 = [location[0] count] - 1;
  uint64_t v42 = 0;
  id v25 = (id)[MEMORY[0x1E4F42948] currentDevice];
  uint64_t v26 = [v25 userInterfaceIdiom];

  uint64_t v42 = v26;
  BOOL v27 = 1;
  if (v26 != 1) {
    BOOL v27 = v42 == 5;
  }
  if (v27 && [location[0] count] == 2 && !v37)
  {
    id v19 = (id)[location[0] reverseObjectEnumerator];
    id v8 = (id)[v19 allObjects];
    id v9 = location[0];
    location[0] = v8;

    uint64_t v34 = 0;
  }
  id v17 = v41;
  id v11 = location[0];
  id v12 = v39;
  id v13 = v38;
  BOOL v14 = v37;
  uint64_t v15 = v34;
  id v16 = v36;
  uint64_t v28 = MEMORY[0x1E4F143A8];
  int v29 = -1073741824;
  int v30 = 0;
  os_log_type_t v31 = __99__ACUIViewController_showConfirmationViewWithButtons_title_message_destructive_context_completion___block_invoke;
  id v32 = &unk_1E6D1FE60;
  id v33 = v35;
  id v18 = [(ACUIViewController *)v17 showConfirmationViewWithButtons:v11 title:v12 message:v13 destructive:v14 cancelButtonIndex:v15 context:v16 completion:&v28];
  objc_storeStrong(&v33, 0);
  objc_storeStrong(&v35, 0);
  objc_storeStrong(&v36, 0);
  objc_storeStrong(&v38, 0);
  objc_storeStrong(&v39, 0);
  objc_storeStrong(location, 0);
  return v18;
}

void __99__ACUIViewController_showConfirmationViewWithButtons_title_message_destructive_context_completion___block_invoke(void *a1, void *a2)
{
  location[1] = a1;
  location[0] = 0;
  objc_storeStrong(location, a2);
  if (a1[4]) {
    (*(void (**)(void))(a1[4] + 16))();
  }
  objc_storeStrong(location, 0);
}

- (id)showAlertViewWithButtons:(id)a3 title:(id)a4 message:(id)a5 destructive:(BOOL)a6 cancelButtonIndex:(int64_t)a7 context:(id)a8 completion:(id)a9
{
  id v24 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v22 = 0;
  objc_storeStrong(&v22, a4);
  id v21 = 0;
  objc_storeStrong(&v21, a5);
  BOOL v20 = a6;
  int64_t v19 = a7;
  id v18 = 0;
  objc_storeStrong(&v18, a8);
  id v17 = 0;
  objc_storeStrong(&v17, a9);
  LOBYTE(v10) = 1;
  id v16 = [(ACUIViewController *)v24 showConfirmationViewWithButtons:location[0] title:v22 message:v21 destructive:v20 cancelButtonIndex:v19 context:v18 forceAlert:v10 completion:v17];
  objc_storeStrong(&v17, 0);
  objc_storeStrong(&v18, 0);
  objc_storeStrong(&v21, 0);
  objc_storeStrong(&v22, 0);
  objc_storeStrong(location, 0);
  return v16;
}

- (id)showAlertViewWithButtons:(id)a3 title:(id)a4 message:(id)a5 destructive:(BOOL)a6 context:(id)a7 completion:(id)a8
{
  id v25 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v23 = 0;
  objc_storeStrong(&v23, a4);
  id v22 = 0;
  objc_storeStrong(&v22, a5);
  BOOL v21 = a6;
  id v20 = 0;
  objc_storeStrong(&v20, a7);
  id v19 = 0;
  objc_storeStrong(&v19, a8);
  uint64_t v18 = [location[0] count] - 1;
  if ([location[0] count] == 2 && !v21)
  {
    id v12 = (id)[location[0] reverseObjectEnumerator];
    id v8 = (id)[v12 allObjects];
    id v9 = location[0];
    location[0] = v8;

    uint64_t v18 = 0;
  }
  id v11 = [(ACUIViewController *)v25 showAlertViewWithButtons:location[0] title:v23 message:v22 destructive:v21 cancelButtonIndex:v18 context:v20 completion:v19];
  objc_storeStrong(&v19, 0);
  objc_storeStrong(&v20, 0);
  objc_storeStrong(&v22, 0);
  objc_storeStrong(&v23, 0);
  objc_storeStrong(location, 0);
  return v11;
}

- (id)_alertViewWithButtons:(id)a3 title:(id)a4 message:(id)a5 cancelButtonIndex:(int64_t)a6 context:(id)a7
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  BOOL v27 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v25 = 0;
  objc_storeStrong(&v25, a4);
  id v24 = 0;
  objc_storeStrong(&v24, a5);
  int64_t v23 = a6;
  id v22 = 0;
  objc_storeStrong(&v22, a7);
  id v21 = objc_alloc_init(MEMORY[0x1E4F42730]);
  memset(__b, 0, sizeof(__b));
  id v17 = location[0];
  uint64_t v18 = [v17 countByEnumeratingWithState:__b objects:v28 count:16];
  if (v18)
  {
    uint64_t v10 = *(void *)__b[2];
    uint64_t v11 = 0;
    unint64_t v12 = v18;
    while (1)
    {
      uint64_t v9 = v11;
      if (*(void *)__b[2] != v10) {
        objc_enumerationMutation(v17);
      }
      uint64_t v20 = *(void *)(__b[1] + 8 * v11);
      [v21 addButtonWithTitle:v20];
      ++v11;
      if (v9 + 1 >= v12)
      {
        uint64_t v11 = 0;
        unint64_t v12 = [v17 countByEnumeratingWithState:__b objects:v28 count:16];
        if (!v12) {
          break;
        }
      }
    }
  }

  [v21 setTitle:v25];
  [v21 setMessage:v24];
  [v21 setCancelButtonIndex:v23];
  [v21 setContext:v22];
  [v21 setDelegate:v27];
  id v8 = v21;
  objc_storeStrong(&v21, 0);
  objc_storeStrong(&v22, 0);
  objc_storeStrong(&v24, 0);
  objc_storeStrong(&v25, 0);
  objc_storeStrong(location, 0);
  return v8;
}

- (id)_actionSheetWithButtons:(id)a3 title:(id)a4 destructive:(BOOL)a5 cancelButtonIndex:(int64_t)a6 context:(id)a7
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  uint64_t v29 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v27 = 0;
  objc_storeStrong(&v27, a4);
  BOOL v26 = a5;
  int64_t v25 = a6;
  id v24 = 0;
  objc_storeStrong(&v24, a7);
  id v23 = objc_alloc_init(MEMORY[0x1E4F426F0]);
  memset(__b, 0, sizeof(__b));
  id v19 = location[0];
  uint64_t v20 = [v19 countByEnumeratingWithState:__b objects:v30 count:16];
  if (v20)
  {
    uint64_t v12 = *(void *)__b[2];
    uint64_t v13 = 0;
    unint64_t v14 = v20;
    while (1)
    {
      uint64_t v11 = v13;
      if (*(void *)__b[2] != v12) {
        objc_enumerationMutation(v19);
      }
      uint64_t v22 = *(void *)(__b[1] + 8 * v13);
      [v23 addButtonWithTitle:v22];
      ++v13;
      if (v11 + 1 >= v14)
      {
        uint64_t v13 = 0;
        unint64_t v14 = [v19 countByEnumeratingWithState:__b objects:v30 count:16];
        if (!v14) {
          break;
        }
      }
    }
  }

  [v23 setCancelButtonIndex:v25];
  if (v26) {
    uint64_t v10 = [v23 cancelButtonIndex] - 1;
  }
  else {
    uint64_t v10 = -1;
  }
  objc_msgSend(v23, "setDestructiveButtonIndex:", v10, &v23);
  [v23 setTitle:v27];
  [v23 setContext:v24];
  [v23 setDelegate:v29];
  id v9 = v23;
  objc_storeStrong(v8, 0);
  objc_storeStrong(&v24, 0);
  objc_storeStrong(&v27, 0);
  objc_storeStrong(location, 0);
  return v9;
}

- (void)confirmationView:(id)a3 clickedButtonAtIndex:(int64_t)a4
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  uint64_t v11 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  int64_t v9 = a4;
  if (v11->_confirmationViewCompletion)
  {
    id v8 = _ACUILogSystem();
    os_log_type_t v7 = OS_LOG_TYPE_DEBUG;
    if (os_log_type_enabled((os_log_t)v8, OS_LOG_TYPE_DEBUG))
    {
      __os_log_helper_16_2_2_8_32_4_0((uint64_t)v12, (uint64_t)"-[ACUIViewController confirmationView:clickedButtonAtIndex:]", 403);
      _os_log_debug_impl(&dword_1DDFE5000, (os_log_t)v8, v7, "%s (%d) \"Confirmative view calling completion handler.\"", v12, 0x12u);
    }
    objc_storeStrong(&v8, 0);
    uint64_t v6 = (void (**)(void, void, void))MEMORY[0x1E01CBE70](v11->_confirmationViewCompletion);
    id confirmationViewCompletion = v11->_confirmationViewCompletion;
    v11->_id confirmationViewCompletion = 0;

    ((void (**)(void, id, int64_t))v6)[2](v6, location[0], v9);
    objc_storeStrong((id *)&v6, 0);
  }
  objc_storeStrong(location, 0);
}

- (void)alertView:(id)a3 didDismissWithButtonIndex:(int64_t)a4
{
  uint64_t v6 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  [(ACUIViewController *)v6 confirmationView:location[0] clickedButtonAtIndex:a4];
  objc_storeStrong(location, 0);
}

- (void)actionSheet:(id)a3 didDismissWithButtonIndex:(int64_t)a4
{
  uint64_t v6 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  [(ACUIViewController *)v6 confirmationView:location[0] clickedButtonAtIndex:a4];
  objc_storeStrong(location, 0);
}

- (id)showConfirmationViewForDeletingAccount:(id)a3 context:(id)a4 completion:(id)a5
{
  v41[2] = *MEMORY[0x1E4F143B8];
  id v39 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v37 = 0;
  objc_storeStrong(&v37, a4);
  id v36 = 0;
  objc_storeStrong(&v36, a5);
  id v16 = (id)[location[0] enabledDataclasses];
  id v35 = (id)[v16 allObjects];

  id v17 = NSString;
  id v20 = (id)[MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
  id v19 = (id)[v20 localizedStringForKey:@"DELETE_ACCOUNT_WARNING_FORMAT" value:&stru_1F39EF5C0 table:@"Localizable"];
  id v18 = +[ACUILocalization localizedTextForDataclasses:v35 usedAtBeginningOfSentence:0 forAccount:location[0]];
  id v34 = (id)objc_msgSend(v17, "stringWithFormat:", v19, v18);

  uint64_t v40 = 0;
  id v21 = (id)[MEMORY[0x1E4F42948] currentDevice];
  uint64_t v22 = [v21 userInterfaceIdiom];

  uint64_t v40 = v22;
  BOOL v23 = 1;
  if (v22 != 1) {
    BOOL v23 = v40 == 5;
  }
  char v31 = 0;
  char v29 = 0;
  char v27 = 0;
  char v25 = 0;
  if (v23)
  {
    id v32 = (id)[MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
    char v31 = 1;
    id v30 = (id)[v32 localizedStringForKey:@"DELETE" value:&stru_1F39EF5C0 table:@"Localizable"];
    char v29 = 1;
    id v13 = v30;
  }
  else
  {
    id v28 = (id)[MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
    char v27 = 1;
    id v26 = (id)[v28 localizedStringForKey:@"DELETE_ACCOUNT" value:&stru_1F39EF5C0 table:@"Localizable"];
    char v25 = 1;
    id v13 = v26;
  }
  v41[0] = v13;
  id v12 = (id)[MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
  id v11 = (id)[v12 localizedStringForKey:@"CANCEL" value:&stru_1F39EF5C0 table:@"Localizable"];
  v41[1] = v11;
  id v33 = (id)[MEMORY[0x1E4F1C978] arrayWithObjects:v41 count:2];

  if (v25) {
  if (v27)
  }

  if (v29) {
  if (v31)
  }

  os_log_type_t v7 = v39;
  id v6 = v33;
  id v9 = (id)[MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
  id v8 = (id)[v9 localizedStringForKey:@"DELETE_ACCOUNT" value:&stru_1F39EF5C0 table:@"Localizable"];
  id v24 = -[ACUIViewController showConfirmationViewWithButtons:title:message:destructive:context:completion:](v7, "showConfirmationViewWithButtons:title:message:destructive:context:completion:", v6);

  id v10 = v24;
  objc_storeStrong(&v24, 0);
  objc_storeStrong(&v33, 0);
  objc_storeStrong(&v34, 0);
  objc_storeStrong(&v35, 0);
  objc_storeStrong(&v36, 0);
  objc_storeStrong(&v37, 0);
  objc_storeStrong(location, 0);
  return v10;
}

- (void)startValidationWithPrompt:(id)a3
{
  id v4 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  [(ACUIViewController *)v4 startValidationWithPrompt:location[0] userInteraction:0];
  objc_storeStrong(location, 0);
}

- (void)startValidationWithPrompt:(id)a3 userInteraction:(BOOL)a4
{
  unint64_t v14 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  BOOL v12 = a4;
  if (![(ACUIViewController *)v14 validationInProgress])
  {
    id v5 = (id)[(ACUIViewController *)v14 navigationItem];
    id v11 = (id)[v5 leftBarButtonItem];

    id v6 = (id)[(ACUIViewController *)v14 navigationItem];
    id v10 = (id)[v6 rightBarButtonItem];

    if (v11) {
      [(ACUIViewController *)v14 setCancelButton:v11];
    }
    if (v10) {
      [(ACUIViewController *)v14 setDoneButton:v10];
    }
    objc_storeStrong(&v10, 0);
    objc_storeStrong(&v11, 0);
  }
  [(ACUIViewController *)v14 setValidationInProgress:1];
  id v9 = (id)[(ACUIViewController *)v14 navigationItem];
  id v4 = [ACUISpinnerTitle alloc];
  id v8 = [(ACUISpinnerTitle *)v4 initWithTitle:location[0]];
  [v9 setTitleView:v8];
  objc_msgSend(v9, "setLeftBarButtonItem:animated:");
  [v9 setRightBarButtonItem:0 animated:1];
  if (([(id)*MEMORY[0x1E4F43630] isIgnoringInteractionEvents] & 1) == 0 && !v12) {
    [(id)*MEMORY[0x1E4F43630] beginIgnoringInteractionEvents];
  }
  objc_storeStrong(&v8, 0);
  objc_storeStrong(&v9, 0);
  objc_storeStrong(location, 0);
}

- (void)updateValidationPrompt:(id)a3
{
  id v8 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v6 = (id)[(ACUIViewController *)v8 navigationItem];
  id v5 = (id)[v6 titleView];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v3 = [ACUISpinnerTitle alloc];
    id v4 = [(ACUISpinnerTitle *)v3 initWithTitle:location[0]];
    [v6 setTitleView:v4];
    objc_storeStrong((id *)&v4, 0);
  }
  else
  {
    [v6 _setTitle:location[0] animated:1];
  }
  objc_storeStrong(&v5, 0);
  objc_storeStrong(&v6, 0);
  objc_storeStrong(location, 0);
}

- (void)stopValidationWithPrompt:(id)a3 showButtons:(BOOL)a4
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  BOOL v12 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  BOOL v10 = a4;
  id v9 = _ACUILogSystem();
  os_log_type_t v8 = OS_LOG_TYPE_DEBUG;
  if (os_log_type_enabled((os_log_t)v9, OS_LOG_TYPE_DEBUG))
  {
    __os_log_helper_16_2_3_8_32_4_0_8_64((uint64_t)v13, (uint64_t)"-[ACUIViewController stopValidationWithPrompt:showButtons:]", 486, (uint64_t)location[0]);
    _os_log_debug_impl(&dword_1DDFE5000, (os_log_t)v9, v8, "%s (%d) \"ACUIViewController stopValidatingWithprompt %@\"", v13, 0x1Cu);
  }
  objc_storeStrong(&v9, 0);
  [(ACUIViewController *)v12 setValidationInProgress:0];
  id v7 = (id)[(ACUIViewController *)v12 navigationItem];
  [v7 setTitleView:0];
  if (v10)
  {
    id v4 = [(ACUIViewController *)v12 cancelButton];
    objc_msgSend(v7, "setLeftBarButtonItem:animated:");

    id v5 = [(ACUIViewController *)v12 doneButton];
    objc_msgSend(v7, "setRightBarButtonItem:animated:");
  }
  else
  {
    [v7 setLeftBarButtonItems:0 animated:1];
  }
  [v7 _setTitle:location[0] animated:1];
  if (([(id)*MEMORY[0x1E4F43630] isIgnoringInteractionEvents] & 1) == 1) {
    [(id)*MEMORY[0x1E4F43630] endIgnoringInteractionEvents];
  }
  objc_storeStrong(&v7, 0);
  objc_storeStrong(location, 0);
}

- (void)setCellsChecked:(BOOL)a3
{
  BOOL v10 = self;
  SEL v9 = a2;
  BOOL v8 = a3;
  unint64_t i = 0;
  unint64_t v6 = 0;
  unint64_t v6 = [*(id *)((char *)&self->super.super.super.super.super.isa + (int)*MEMORY[0x1E4F92F08]) count];
  for (unint64_t i = 0; i < v6; ++i)
  {
    uint64_t v3 = *(Class *)((char *)&v10->super.super.super.super.super.isa + (int)*MEMORY[0x1E4F92F10]);
    id v4 = (id)[(ACUIViewController *)v10 indexPathForIndex:i];
    id location = (id)objc_msgSend(v3, "cellForRowAtIndexPath:");

    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 1) {
      [location setChecked:v8];
    }
    objc_storeStrong(&location, 0);
  }
}

- (void)reloadParentSpecifier
{
  id v4 = self;
  location[1] = (id)a2;
  location[0] = [(ACUIViewController *)self _effectiveParentController];
  id v2 = (id)[*(id *)((char *)&v4->super.super.super.super.super.isa+ (int)*MEMORY[0x1E4F92FA0]) identifier];
  objc_msgSend(location[0], "reloadSpecifierID:animated:");

  if (objc_opt_respondsToSelector()) {
    [location[0] performSelector:sel_reloadParentSpecifier];
  }
  objc_storeStrong(location, 0);
}

- (void)reloadAllParentSpecifiers
{
  id v3 = (id)[MEMORY[0x1E4F42948] currentDevice];
  uint64_t v4 = [v3 userInterfaceIdiom];

  BOOL v5 = 1;
  if (v4 != 1) {
    BOOL v5 = v4 == 5;
  }
  [(ACUIViewController *)self reloadAllParentSpecifiersAnimated:v5];
}

- (void)reloadAllParentSpecifiersAnimated:(BOOL)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  uint64_t v15 = self;
  SEL v14 = a2;
  BOOL v13 = a3;
  id location = [(ACUIViewController *)self _effectiveParentController];
  if (location)
  {
    memset(__b, 0, sizeof(__b));
    id obj = (id)[location specifiers];
    uint64_t v9 = [obj countByEnumeratingWithState:__b objects:v16 count:16];
    if (v9)
    {
      uint64_t v5 = *(void *)__b[2];
      uint64_t v6 = 0;
      uint64_t v7 = v9;
      while (1)
      {
        uint64_t v4 = v6;
        if (*(void *)__b[2] != v5) {
          objc_enumerationMutation(obj);
        }
        uint64_t v11 = *(void *)(__b[1] + 8 * v6);
        objc_msgSend(location, "reloadSpecifier:animated:", v11, v13, v7);
        ++v6;
        uint64_t v7 = v3;
        if (v4 + 1 >= v3)
        {
          uint64_t v6 = 0;
          uint64_t v7 = [obj countByEnumeratingWithState:__b objects:v16 count:16];
          if (!v7) {
            break;
          }
        }
      }
    }

    if (([(id)objc_opt_class() shouldPresentAsModalSheet] & 1) == 1
      && ![(ACUIViewController *)v15 isPresentedAsModalSheet]
      && (objc_opt_respondsToSelector() & 1) != 0)
    {
      [location performSelector:sel_reloadAllParentSpecifiers];
    }
  }
  objc_storeStrong(&location, 0);
}

- (void)removeParentSpecifier
{
  uint64_t v7 = self;
  location[1] = (id)a2;
  location[0] = [(ACUIViewController *)self _effectiveParentController];
  uint64_t v2 = *(uint64_t *)((char *)&v7->super.super.super.super.super.isa + (int)*MEMORY[0x1E4F92FA0]);
  id v3 = (id)[MEMORY[0x1E4F42948] currentDevice];
  uint64_t v4 = [v3 userInterfaceIdiom];

  uint64_t v8 = v4;
  BOOL v5 = 1;
  if (v4 != 1) {
    BOOL v5 = v8 == 5;
  }
  [location[0] removeSpecifier:v2 animated:v5];
  objc_storeStrong(location, 0);
}

- (id)_effectiveParentController
{
  BOOL v10 = self;
  location[1] = (id)a2;
  location[0] = 0;
  if ([(ACUIViewController *)self isPresentedAsModalSheet])
  {
    id v8 = (id)[(ACUIViewController *)v10 rootController];
    id v2 = (id)[v8 parentController];
    id v3 = location[0];
    location[0] = v2;
  }
  else
  {
    id v4 = (id)[(ACUIViewController *)v10 parentController];
    id v5 = location[0];
    location[0] = v4;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v11 = location[0];
  }
  else {
    id v11 = 0;
  }
  objc_storeStrong(location, 0);
  uint64_t v6 = v11;
  return v6;
}

- (void)setTaskCompletionAssertionEnabled:(BOOL)a3
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  uint64_t v9 = self;
  SEL v8 = a2;
  BOOL v7 = a3;
  os_log_t oslog = (os_log_t)_ACUILogSystem();
  if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEBUG))
  {
    if (v7) {
      id v3 = @"enabled";
    }
    else {
      id v3 = @"disabled";
    }
    __os_log_helper_16_2_3_8_32_4_0_8_66((uint64_t)v10, (uint64_t)"-[ACUIViewController setTaskCompletionAssertionEnabled:]", 579, (uint64_t)v3);
    _os_log_debug_impl(&dword_1DDFE5000, oslog, OS_LOG_TYPE_DEBUG, "%s (%d) \"ACUIViewController setTaskCompletionAssertionEnabled: %{public}@\"", v10, 0x1Cu);
  }
  objc_storeStrong((id *)&oslog, 0);
  if (v7)
  {
    if (!v9->_addedToTaskList)
    {
      id WeakRetained = objc_loadWeakRetained((id *)((char *)&v9->super.super.super.super.super.isa
                                                + (int)*MEMORY[0x1E4F92F98]));
      [WeakRetained addTask:v9];

      v9->_addedToTaskList = 1;
    }
  }
  else if (v9->_addedToTaskList)
  {
    id v4 = objc_loadWeakRetained((id *)((char *)&v9->super.super.super.super.super.isa + (int)*MEMORY[0x1E4F92F98]));
    [v4 taskFinished:v9];

    v9->_addedToTaskList = 0;
  }
}

- (ACUIAccountOperationsHelper)accountOperationsHelper
{
  if (!self->_accountOperationsHelper)
  {
    uint64_t v6 = [ACUIAccountOperationsHelper alloc];
    BOOL v7 = [(ACUIViewController *)self accountStore];
    id v2 = -[ACUIAccountOperationsHelper initWithAccountStore:](v6, "initWithAccountStore:");
    accountOperationsHelper = self->_accountOperationsHelper;
    self->_accountOperationsHelper = v2;

    [(ACUIAccountOperationsHelper *)self->_accountOperationsHelper setDelegate:self];
  }
  id v4 = self->_accountOperationsHelper;
  return v4;
}

+ (id)acuiAccountStore
{
  id v5 = (dispatch_once_t *)&acuiAccountStore_onceToken;
  id location = 0;
  objc_storeStrong(&location, &__block_literal_global_1);
  if (*v5 != -1) {
    dispatch_once(v5, location);
  }
  objc_storeStrong(&location, 0);
  id v2 = (void *)acuiAccountStore___acuiAccountStore;
  return v2;
}

void __38__ACUIViewController_acuiAccountStore__block_invoke(void *a1)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  v9[2] = a1;
  v9[1] = a1;
  id v4 = objc_alloc(MEMORY[0x1E4F179E8]);
  id v3 = (void *)MEMORY[0x1E4F1CAD0];
  id v6 = ACUIVisibleAccountTypes();
  id v5 = (id)objc_msgSend(v3, "setWithArray:");
  uint64_t v1 = objc_msgSend(v4, "initWithAccountTypes:delegate:");
  id v2 = (void *)acuiAccountStore___acuiAccountStore;
  acuiAccountStore___acuiAccountStore = v1;

  v9[0] = 0;
  id v8 = 0;
  [(id)acuiAccountStore___acuiAccountStore registerSynchronouslyWithError:&v8];
  objc_storeStrong(v9, v8);
  if (v9[0])
  {
    id v7 = _ACUILogSystem();
    if (os_log_type_enabled((os_log_t)v7, OS_LOG_TYPE_ERROR))
    {
      __os_log_helper_16_2_3_8_32_4_0_8_64((uint64_t)v10, (uint64_t)"+[ACUIViewController acuiAccountStore]_block_invoke", 615, (uint64_t)v9[0]);
      _os_log_error_impl(&dword_1DDFE5000, (os_log_t)v7, OS_LOG_TYPE_ERROR, "%s (%d) @\"Error registering account monitor: %@\"", v10, 0x1Cu);
    }
    objc_storeStrong(&v7, 0);
  }
  objc_storeStrong(v9, 0);
}

- (ACAccountStore)accountStore
{
  return (ACAccountStore *)[(id)objc_opt_class() acuiAccountStore];
}

- (id)operationsHelper:(id)a3 desiredDataclassActionFromPicker:(id)a4
{
  uint64_t v9 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v7 = 0;
  objc_storeStrong(&v7, a4);
  id v6 = (id)[v7 showInViewController:v9];
  objc_storeStrong(&v7, 0);
  objc_storeStrong(location, 0);
  return v6;
}

- (void)showActivityInProgressUIWithMessage:(id)a3
{
  id v32 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v32->_activityInProgress = 1;
  [(id)*MEMORY[0x1E4F43630] beginIgnoringInteractionEvents];
  id v30 = *(id *)((char *)&v32->super.super.super.super.super.isa + (int)*MEMORY[0x1E4F92F10]);
  id v29 = 0;
  id v28 = v30;
  while (1)
  {
    id v24 = (id)[v30 superview];
    id v3 = v29;
    id v29 = v24;

    if (!v24) {
      break;
    }
    BOOL v23 = &v30;
    objc_storeStrong(&v28, v30);
    objc_storeStrong(&v30, v29);
  }
  id v4 = (UIProgressHUD *)objc_alloc_init(MEMORY[0x1E4F42D20]);
  unint64_t v13 = 0x1EAB9F000uLL;
  hud = v32->_hud;
  v32->_hud = v4;

  [*(id *)((char *)&v32->super.super.super.super.super.isa + *(int *)(v13 + 2580)) setFontSize:16];
  id v6 = *(Class *)((char *)&v32->super.super.super.super.super.isa + *(int *)(v13 + 2580));
  id v21 = location;
  [v6 setText:location[0]];
  id v7 = *(Class *)((char *)&v32->super.super.super.super.super.isa + *(int *)(v13 + 2580));
  int v16 = 1;
  [v7 setTranslatesAutoresizingMaskIntoConstraints:0];
  id v8 = *(Class *)((char *)&v32->super.super.super.super.super.isa + *(int *)(v13 + 2580));
  id v20 = &v28;
  [v8 showInView:v28];
  uint64_t v9 = *(Class *)((char *)&v32->super.super.super.super.super.isa + *(int *)(v13 + 2580));
  id obj = 0;
  BOOL v10 = _NSDictionaryOfVariableBindings(&cfstr_Hud.isa, v9, 0);
  id v19 = (id *)&v27;
  char v27 = v10;
  unint64_t v15 = 0x1E4F28000uLL;
  uint64_t v14 = 0;
  id v11 = (id)objc_msgSend(MEMORY[0x1E4F28DC8], "constraintsWithVisualFormat:options:metrics:views:", @"V:|-[_hud]-|");
  id v18 = &v26;
  id v26 = v11;
  id v12 = (id)[*(id *)(v15 + 3528) constraintsWithVisualFormat:@"H:|-[_hud]-|" options:v14 metrics:obj views:v27];
  uint64_t v17 = &v25;
  id v25 = v12;
  [*(id *)(v15 + 3528) activateConstraints:v26];
  [*(id *)(v15 + 3528) activateConstraints:v25];
  [(ACUIViewController *)v32 setTaskCompletionAssertionEnabled:v16 & 1];
  objc_storeStrong(v17, obj);
  objc_storeStrong(v18, obj);
  objc_storeStrong(v19, obj);
  objc_storeStrong(v20, obj);
  objc_storeStrong(&v29, obj);
  objc_storeStrong(&v30, obj);
  objc_storeStrong(v21, obj);
}

- (void)hideActivityInProgressUI
{
  self->_activityInProgress = 0;
}

- (void)hideActivityInProgressUIWithDelay:(double)a3
{
  if (a3 <= 0.0)
  {
    [(ACUIViewController *)self hideActivityInProgressUI];
  }
  else
  {
    [(UIProgressHUD *)self->_hud done];
    [(ACUIViewController *)self performSelector:sel_hideActivityInProgressUI withObject:self afterDelay:a3];
  }
}

- (BOOL)isShowingActivityInProgressUI
{
  return self->_activityInProgress;
}

- (void)operationsHelper:(id)a3 willSaveAccount:(id)a4
{
  id location[2] = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v5 = 0;
  objc_storeStrong(&v5, a4);
  objc_storeStrong(&v5, 0);
  objc_storeStrong(location, 0);
}

- (void)operationsHelper:(id)a3 didSaveAccount:(id)a4 withSuccess:(BOOL)a5 error:(id)a6
{
  BOOL v23 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v21 = 0;
  objc_storeStrong(&v21, a4);
  BOOL v20 = a5;
  id v19 = 0;
  objc_storeStrong(&v19, a6);
  BOOL v10 = [(ACUIViewController *)v23 accountChangeObserver];
  char v11 = objc_opt_respondsToSelector();

  if (v11)
  {
    queue = MEMORY[0x1E4F14428];
    uint64_t v12 = MEMORY[0x1E4F143A8];
    int v13 = -1073741824;
    int v14 = 0;
    unint64_t v15 = __72__ACUIViewController_operationsHelper_didSaveAccount_withSuccess_error___block_invoke;
    int v16 = &unk_1E6D1FE88;
    uint64_t v17 = v23;
    BOOL v18 = v20;
    dispatch_async(queue, &v12);

    objc_storeStrong((id *)&v17, 0);
  }
  objc_storeStrong(&v19, 0);
  objc_storeStrong(&v21, 0);
  objc_storeStrong(location, 0);
}

void __72__ACUIViewController_operationsHelper_didSaveAccount_withSuccess_error___block_invoke(uint64_t a1)
{
  id v2 = (id)[*(id *)(a1 + 32) accountChangeObserver];
  [v2 viewController:*(void *)(a1 + 32) didFinishSavingAccountWithSuccess:*(unsigned char *)(a1 + 40) & 1];
}

- (void)operationsHelper:(id)a3 willRemoveAccount:(id)a4
{
  id location[2] = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v5 = 0;
  objc_storeStrong(&v5, a4);
  objc_storeStrong(&v5, 0);
  objc_storeStrong(location, 0);
}

- (void)operationsHelper:(id)a3 didRemoveAccount:(id)a4 withSuccess:(BOOL)a5 error:(id)a6
{
  BOOL v23 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v21 = 0;
  objc_storeStrong(&v21, a4);
  BOOL v20 = a5;
  id v19 = 0;
  objc_storeStrong(&v19, a6);
  BOOL v10 = [(ACUIViewController *)v23 accountChangeObserver];
  char v11 = objc_opt_respondsToSelector();

  if (v11)
  {
    queue = MEMORY[0x1E4F14428];
    uint64_t v12 = MEMORY[0x1E4F143A8];
    int v13 = -1073741824;
    int v14 = 0;
    unint64_t v15 = __74__ACUIViewController_operationsHelper_didRemoveAccount_withSuccess_error___block_invoke;
    int v16 = &unk_1E6D1FE88;
    uint64_t v17 = v23;
    BOOL v18 = v20;
    dispatch_async(queue, &v12);

    objc_storeStrong((id *)&v17, 0);
  }
  objc_storeStrong(&v19, 0);
  objc_storeStrong(&v21, 0);
  objc_storeStrong(location, 0);
}

void __74__ACUIViewController_operationsHelper_didRemoveAccount_withSuccess_error___block_invoke(uint64_t a1)
{
  id v2 = (id)[*(id *)(a1 + 32) accountChangeObserver];
  [v2 viewController:*(void *)(a1 + 32) didFinishRemovingAccountWithSuccess:*(unsigned char *)(a1 + 40) & 1];
}

- (UIBarButtonItem)doneButton
{
  return self->_doneButton;
}

- (void)setDoneButton:(id)a3
{
}

- (UIBarButtonItem)cancelButton
{
  return self->_cancelButton;
}

- (void)setCancelButton:(id)a3
{
}

- (void)setAccountStore:(id)a3
{
}

- (void)setAccountOperationsHelper:(id)a3
{
}

- (ACUIViewControllerAccountChangeObserver)accountChangeObserver
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_accountChangeObserver);
  return (ACUIViewControllerAccountChangeObserver *)WeakRetained;
}

- (void)setAccountChangeObserver:(id)a3
{
}

- (BOOL)validationInProgress
{
  return self->_validationInProgress;
}

- (void)setValidationInProgress:(BOOL)a3
{
  self->_validationInProgress = a3;
}

- (void).cxx_destruct
{
}

@end