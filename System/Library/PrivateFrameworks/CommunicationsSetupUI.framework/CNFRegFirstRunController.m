@interface CNFRegFirstRunController
- (BOOL)_hidesBackButton;
- (BOOL)dismissWithState:(unint64_t)a3;
- (BOOL)previousHidesBackButton;
- (BOOL)pushCompletionControllerIfPossible;
- (BOOL)timedOut;
- (CNFRegFirstRunController)initWithParentController:(id)a3 account:(id)a4;
- (CNFRegFirstRunController)initWithRegController:(id)a3;
- (CNFRegFirstRunController)initWithRegController:(id)a3 account:(id)a4;
- (CNFRegFirstRunDelegate)delegate;
- (Class)completionControllerClass;
- (IMAccount)account;
- (UIBarButtonItem)customLeftButton;
- (UIBarButtonItem)customRightButton;
- (UIBarButtonItem)previousLeftButton;
- (UIBarButtonItem)previousRightButton;
- (id)_leftButtonItem;
- (id)_rightButtonItem;
- (id)_validationModeCancelButton;
- (id)titleString;
- (id)validationString;
- (int64_t)currentAppearanceStyle;
- (void)_cancelValidationMode;
- (void)_executeDismissBlock:(id)a3;
- (void)_refreshCurrentState;
- (void)_refreshNavBarAnimated:(BOOL)a3;
- (void)_setupEventHandlers;
- (void)_startActivityIndicatorWithTitle:(id)a3 animated:(BOOL)a4;
- (void)_startActivityIndicatorWithTitle:(id)a3 animated:(BOOL)a4 allowCancel:(BOOL)a5;
- (void)_startListeningForReturnKey;
- (void)_startTimeoutWithDuration:(double)a3;
- (void)_startValidationModeAnimated:(BOOL)a3;
- (void)_startValidationModeAnimated:(BOOL)a3 allowCancel:(BOOL)a4;
- (void)_stopActivityIndicatorAnimated:(BOOL)a3;
- (void)_stopActivityIndicatorWithTitle:(id)a3 animated:(BOOL)a4;
- (void)_stopListeningForReturnKey;
- (void)_stopTimeout;
- (void)_timeoutFired:(id)a3;
- (void)_updateControllerState;
- (void)dealloc;
- (void)setAccount:(id)a3;
- (void)setCellsChecked:(BOOL)a3;
- (void)setCompletionControllerClass:(Class)a3;
- (void)setCustomLeftButton:(id)a3;
- (void)setCustomRightButton:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setPreviousHidesBackButton:(BOOL)a3;
- (void)setPreviousLeftButton:(id)a3;
- (void)setPreviousRightButton:(id)a3;
- (void)setSpecifier:(id)a3;
- (void)setTimedOut:(BOOL)a3;
- (void)systemApplicationDidEnterBackground;
- (void)systemApplicationWillEnterForeground;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidDisappear:(BOOL)a3;
- (void)viewWillAppear:(BOOL)a3;
- (void)viewWillDisappear:(BOOL)a3;
@end

@implementation CNFRegFirstRunController

- (CNFRegFirstRunController)initWithRegController:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)CNFRegFirstRunController;
  v3 = [(CNFRegListController *)&v6 initWithRegController:a3];
  v4 = v3;
  if (v3) {
    [(CNFRegFirstRunController *)v3 _refreshNavBarAnimated:0];
  }
  return v4;
}

- (CNFRegFirstRunController)initWithRegController:(id)a3 account:(id)a4
{
  id v6 = a4;
  v7 = [(CNFRegFirstRunController *)self initWithRegController:a3];
  v8 = v7;
  if (v7) {
    [(CNFRegFirstRunController *)v7 setAccount:v6];
  }

  return v8;
}

- (CNFRegFirstRunController)initWithParentController:(id)a3 account:(id)a4
{
  id v6 = a4;
  v10.receiver = self;
  v10.super_class = (Class)CNFRegFirstRunController;
  v7 = [(CNFRegListController *)&v10 initWithParentController:a3];
  v8 = v7;
  if (v7) {
    [(CNFRegFirstRunController *)v7 setAccount:v6];
  }

  return v8;
}

- (void)dealloc
{
  self->_delegate = 0;
  [(CNFRegFirstRunController *)self _stopTimeout];
  v3 = [(UIBarButtonItem *)self->_customRightButton target];

  if (v3 == self) {
    [(UIBarButtonItem *)self->_customRightButton setTarget:0];
  }
  v4 = [(UIBarButtonItem *)self->_customLeftButton target];

  if (v4 == self) {
    [(UIBarButtonItem *)self->_customLeftButton setTarget:0];
  }
  v5.receiver = self;
  v5.super_class = (Class)CNFRegFirstRunController;
  [(CNFRegListController *)&v5 dealloc];
}

- (void)setSpecifier:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)CNFRegFirstRunController;
  [(CNFRegListController *)&v8 setSpecifier:v4];
  if (![(CNFRegFirstRunController *)self completionControllerClass])
  {
    objc_super v5 = [v4 propertyForKey:@"cnf-completionclass"];
    id v6 = v5;
    if (v5)
    {
      Class v7 = NSClassFromString(v5);
      if (v7) {
        [(CNFRegFirstRunController *)self setCompletionControllerClass:v7];
      }
    }
  }
}

- (void)_startListeningForReturnKey
{
  id v3 = [MEMORY[0x263F08A00] defaultCenter];
  [v3 addObserver:self selector:sel__handleReturnKeyTapped_ name:*MEMORY[0x263F837F0] object:0];
}

- (void)_stopListeningForReturnKey
{
  id v3 = [MEMORY[0x263F08A00] defaultCenter];
  [v3 removeObserver:self name:*MEMORY[0x263F837F0] object:0];
}

- (void)viewDidAppear:(BOOL)a3
{
  v8.receiver = self;
  v8.super_class = (Class)CNFRegFirstRunController;
  [(CNFRegListController *)&v8 viewDidAppear:a3];
  [(CNFRegFirstRunController *)self _setupEventHandlers];
  id v4 = [(CNFRegFirstRunController *)self account];
  uint64_t v5 = [v4 registrationStatus];

  if (v5 == -1)
  {
    id v6 = OSLogHandleForIDSCategory();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)Class v7 = 0;
      _os_log_impl(&dword_21ED18000, v6, OS_LOG_TYPE_DEFAULT, "Account state was failed so refreshing current state", v7, 2u);
    }

    if (os_log_shim_legacy_logging_enabled())
    {
      if (IMShouldLog()) {
        IMLogString();
      }
    }
    [(CNFRegFirstRunController *)self _refreshCurrentState];
  }
}

- (void)viewWillAppear:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)CNFRegFirstRunController;
  [(CNFRegListController *)&v4 viewWillAppear:a3];
  [(CNFRegFirstRunController *)self _refreshNavBarAnimated:0];
  [(CNFRegFirstRunController *)self _startListeningForReturnKey];
}

- (void)viewWillDisappear:(BOOL)a3
{
  v6.receiver = self;
  v6.super_class = (Class)CNFRegFirstRunController;
  [(CNFRegListController *)&v6 viewWillDisappear:a3];
  objc_super v4 = OSLogHandleForIDSCategory();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)uint64_t v5 = 0;
    _os_log_impl(&dword_21ED18000, v4, OS_LOG_TYPE_DEBUG, "Removing event handlers", v5, 2u);
  }

  if (os_log_shim_legacy_logging_enabled() && IMShouldLog()) {
    IMLogString();
  }
  [(CNFRegListController *)self removeAllHandlers];
  [(CNFRegFirstRunController *)self _stopListeningForReturnKey];
}

- (void)viewDidDisappear:(BOOL)a3
{
  BOOL v3 = a3;
  [(CNFRegFirstRunController *)self _stopTimeout];
  v5.receiver = self;
  v5.super_class = (Class)CNFRegFirstRunController;
  [(CNFRegListController *)&v5 viewDidDisappear:v3];
}

- (id)titleString
{
  v2 = [(CNFRegListController *)self regController];
  uint64_t v3 = [v2 serviceType];

  switch(v3)
  {
    case 2:
      goto LABEL_4;
    case 1:
      objc_super v4 = CommunicationsSetupUIBundle();
      objc_super v5 = CNFRegStringTableName();
      objc_super v6 = @"IMESSAGE";
      goto LABEL_6;
    case 0:
LABEL_4:
      objc_super v4 = CommunicationsSetupUIBundle();
      objc_super v5 = CNFRegStringTableName();
      objc_super v6 = @"FACETIME";
LABEL_6:
      Class v7 = [v4 localizedStringForKey:v6 value:&stru_26D05D4F8 table:v5];

      goto LABEL_8;
  }
  Class v7 = &stru_26D05D4F8;
LABEL_8:
  return v7;
}

- (id)validationString
{
  v2 = CommunicationsSetupUIBundle();
  uint64_t v3 = CNFRegStringTableName();
  objc_super v4 = [v2 localizedStringForKey:@"VERIFYING" value:&stru_26D05D4F8 table:v3];

  return v4;
}

- (void)_refreshNavBarAnimated:(BOOL)a3
{
  BOOL v3 = a3;
  id v10 = [(CNFRegFirstRunController *)self _leftButtonItem];
  objc_super v5 = [(CNFRegFirstRunController *)self _rightButtonItem];
  BOOL v6 = [(CNFRegFirstRunController *)self _hidesBackButton];
  Class v7 = [(CNFRegFirstRunController *)self navigationItem];
  objc_super v8 = [v7 rightBarButtonItem];

  if (v8 != v5) {
    [v7 setRightBarButtonItem:v5 animated:v3];
  }
  id v9 = [v7 leftBarButtonItem];

  if (v9 != v10) {
    objc_msgSend(v7, "setLeftBarButtonItem:animated:");
  }
  if (v6 != [v7 hidesBackButton]) {
    [v7 setHidesBackButton:v6 animated:v3];
  }
}

- (id)_rightButtonItem
{
  customRightButton = self->_customRightButton;
  if (customRightButton)
  {
    objc_super v4 = customRightButton;
    objc_super v5 = [(UIBarButtonItem *)v4 target];

    if (!v5) {
      [(UIBarButtonItem *)v4 setTarget:self];
    }
    if (![(UIBarButtonItem *)v4 action]) {
      [(UIBarButtonItem *)v4 setAction:sel__rightButtonTapped];
    }
  }
  else
  {
    BOOL v6 = CommunicationsSetupUIBundle();
    Class v7 = CNFRegStringTableName();
    objc_super v8 = [v6 localizedStringForKey:@"NEXT" value:&stru_26D05D4F8 table:v7];

    objc_super v4 = (UIBarButtonItem *)[objc_alloc(MEMORY[0x263F824A8]) initWithTitle:v8 style:2 target:self action:sel__rightButtonTapped];
  }
  return v4;
}

- (void)_cancelValidationMode
{
  self->_cancelled = 1;
  [(CNFRegFirstRunController *)self _handleValidationModeCancelled];
}

- (id)_leftButtonItem
{
  customLeftButton = self->_customLeftButton;
  if (customLeftButton)
  {
    objc_super v4 = customLeftButton;
    objc_super v5 = [(UIBarButtonItem *)v4 target];

    if (!v5) {
      [(UIBarButtonItem *)v4 setTarget:self];
    }
    if (![(UIBarButtonItem *)v4 action]) {
      [(UIBarButtonItem *)v4 setAction:sel__leftButtonTapped];
    }
  }
  return customLeftButton;
}

- (BOOL)_hidesBackButton
{
  return self->_customLeftButton != 0;
}

- (void)_startTimeoutWithDuration:(double)a3
{
  if (!self->_timeoutTimer)
  {
    [(CNFRegFirstRunController *)self setTimedOut:0];
    self->_timeoutTimer = [MEMORY[0x263EFFA20] scheduledTimerWithTimeInterval:self target:sel__timeoutFired_ selector:0 userInfo:0 repeats:a3];
    MEMORY[0x270F9A758]();
  }
}

- (void)_stopTimeout
{
  timeoutTimer = self->_timeoutTimer;
  if (timeoutTimer)
  {
    [(NSTimer *)timeoutTimer invalidate];
    objc_super v4 = self->_timeoutTimer;
    self->_timeoutTimer = 0;
  }
}

- (void)_timeoutFired:(id)a3
{
  [(CNFRegFirstRunController *)self _stopTimeout];
  [(CNFRegFirstRunController *)self setTimedOut:1];
  [(CNFRegFirstRunController *)self _handleTimeout];
}

- (id)_validationModeCancelButton
{
  v2 = (void *)[objc_alloc(MEMORY[0x263F824A8]) initWithBarButtonSystemItem:1 target:self action:sel__cancelValidationMode];
  return v2;
}

- (void)_startActivityIndicatorWithTitle:(id)a3 animated:(BOOL)a4 allowCancel:(BOOL)a5
{
  id v8 = a3;
  id v9 = v8;
  if (!self->_showingActivityIndicator)
  {
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __82__CNFRegFirstRunController__startActivityIndicatorWithTitle_animated_allowCancel___block_invoke;
    block[3] = &unk_2644F0F00;
    block[4] = self;
    id v11 = v8;
    BOOL v12 = a5;
    BOOL v13 = a4;
    dispatch_async(MEMORY[0x263EF83A0], block);
  }
}

void __82__CNFRegFirstRunController__startActivityIndicatorWithTitle_animated_allowCancel___block_invoke(uint64_t a1)
{
  id v8 = [*(id *)(a1 + 32) navigationItem];
  v2 = [v8 leftBarButtonItem];
  [*(id *)(a1 + 32) setPreviousLeftButton:v2];

  BOOL v3 = [v8 rightBarButtonItem];
  [*(id *)(a1 + 32) setPreviousRightButton:v3];

  objc_msgSend(*(id *)(a1 + 32), "setPreviousHidesBackButton:", objc_msgSend(v8, "hidesBackButton"));
  [v8 setTitle:*(void *)(a1 + 40)];
  objc_super v4 = [*(id *)(a1 + 32) navigationController];
  objc_super v5 = [v4 navigationBar];
  [v8 setNavigationBar:v5];

  BOOL v6 = [[CNFRegNavigationBarTitleView alloc] initWithNavigationItem:v8];
  [(CNFRegNavigationBarTitleView *)v6 sizeToFit];
  [v8 setTitleView:v6];
  if (*(unsigned char *)(a1 + 48))
  {
    Class v7 = [*(id *)(a1 + 32) _validationModeCancelButton];
  }
  else
  {
    Class v7 = 0;
  }
  [v8 setLeftBarButtonItem:v7 animated:*(unsigned __int8 *)(a1 + 49)];
  [v8 setRightBarButtonItem:0 animated:*(unsigned __int8 *)(a1 + 49)];
  [v8 setHidesBackButton:1 animated:*(unsigned __int8 *)(a1 + 49)];
  *(unsigned char *)(*(void *)(a1 + 32) + 1416) = 1;
  [*(id *)(a1 + 32) _setFieldsEnabled:0 animated:*(unsigned __int8 *)(a1 + 49)];
}

- (void)_startActivityIndicatorWithTitle:(id)a3 animated:(BOOL)a4
{
}

- (void)_stopActivityIndicatorWithTitle:(id)a3 animated:(BOOL)a4
{
  id v6 = a3;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __69__CNFRegFirstRunController__stopActivityIndicatorWithTitle_animated___block_invoke;
  block[3] = &unk_2644F0F28;
  block[4] = self;
  id v9 = v6;
  BOOL v10 = a4;
  id v7 = v6;
  dispatch_async(MEMORY[0x263EF83A0], block);
}

void __69__CNFRegFirstRunController__stopActivityIndicatorWithTitle_animated___block_invoke(uint64_t a1)
{
  v2 = *(unsigned char **)(a1 + 32);
  if (v2[1416])
  {
    id v5 = [v2 navigationItem];
    [v5 setTitle:*(void *)(a1 + 40)];
    [v5 setTitleView:0];
    BOOL v3 = [*(id *)(a1 + 32) previousLeftButton];
    [v5 setLeftBarButtonItem:v3 animated:*(unsigned __int8 *)(a1 + 48)];

    objc_super v4 = [*(id *)(a1 + 32) previousRightButton];
    [v5 setRightBarButtonItem:v4 animated:*(unsigned __int8 *)(a1 + 48)];

    objc_msgSend(v5, "setHidesBackButton:animated:", objc_msgSend(*(id *)(a1 + 32), "previousHidesBackButton"), *(unsigned __int8 *)(a1 + 48));
    [*(id *)(a1 + 32) setPreviousLeftButton:0];
    [*(id *)(a1 + 32) setPreviousRightButton:0];
    [*(id *)(a1 + 32) setPreviousHidesBackButton:0];
    [*(id *)(a1 + 32) _setFieldsEnabled:1 animated:*(unsigned __int8 *)(a1 + 48)];
    *(unsigned char *)(*(void *)(a1 + 32) + 1416) = 0;
  }
}

- (void)_stopActivityIndicatorAnimated:(BOOL)a3
{
  BOOL v3 = a3;
  id v5 = [(CNFRegFirstRunController *)self titleString];
  [(CNFRegFirstRunController *)self _stopActivityIndicatorWithTitle:v5 animated:v3];
}

- (void)_startValidationModeAnimated:(BOOL)a3 allowCancel:(BOOL)a4
{
  BOOL v4 = a4;
  BOOL v5 = a3;
  self->_cancelled = 0;
  id v7 = [(CNFRegFirstRunController *)self validationString];
  [(CNFRegFirstRunController *)self _startActivityIndicatorWithTitle:v7 animated:v5 allowCancel:v4];
}

- (void)_startValidationModeAnimated:(BOOL)a3
{
}

- (void)setCellsChecked:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v5 = [*(id *)((char *)&self->super.super.super.super.super.super.isa + (int)*MEMORY[0x263F5FDB8]) count];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = 0;
    uint64_t v8 = (int)*MEMORY[0x263F5FDD0];
    do
    {
      id v9 = *(Class *)((char *)&self->super.super.super.super.super.super.isa + v8);
      BOOL v10 = [(CNFRegFirstRunController *)self indexPathForIndex:v7];
      id v11 = [v9 cellForRowAtIndexPath:v10];

      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        [v11 setChecked:v3];
      }

      ++v7;
    }
    while (v6 != v7);
  }
}

- (void)systemApplicationWillEnterForeground
{
  v3.receiver = self;
  v3.super_class = (Class)CNFRegFirstRunController;
  [(CNFRegListController *)&v3 systemApplicationWillEnterForeground];
  [(CNFRegFirstRunController *)self _setupEventHandlers];
  [(CNFRegFirstRunController *)self _updateUI];
}

- (void)systemApplicationDidEnterBackground
{
  v3.receiver = self;
  v3.super_class = (Class)CNFRegFirstRunController;
  [(CNFRegListController *)&v3 systemApplicationDidEnterBackground];
  [(CNFRegFirstRunController *)self _stopTimeout];
  [(CNFRegListController *)self removeAllHandlers];
  [(CNFRegFirstRunController *)self _stopValidationModeAnimated:0];
}

- (void)_updateControllerState
{
  objc_super v3 = [(CNFRegListController *)self regController];
  char v4 = [v3 isServiceSupported];

  if (v4)
  {
    [(CNFRegFirstRunController *)self _updateUI];
  }
  else
  {
    [(CNFRegFirstRunController *)self dismissWithState:0];
  }
}

- (void)_refreshCurrentState
{
  objc_super v3 = OSLogHandleForIDSCategory();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_21ED18000, v3, OS_LOG_TYPE_DEFAULT, "_refreshCurrentState", buf, 2u);
  }

  if (os_log_shim_legacy_logging_enabled() && IMShouldLog()) {
    IMLogString();
  }
  char v4 = [(CNFRegListController *)self regController];
  uint64_t v5 = [(CNFRegFirstRunController *)self account];
  uint64_t v6 = [v4 accountStateForAccount:v5];

  if ((v6 & 0x40000000) == 0) {
    goto LABEL_7;
  }
  uint64_t v7 = OSLogHandleForIDSCategory();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)uint64_t v8 = 0;
    _os_log_impl(&dword_21ED18000, v7, OS_LOG_TYPE_DEFAULT, "_refreshCurrentState: finished", v8, 2u);
  }

  if (os_log_shim_legacy_logging_enabled() && IMShouldLog()) {
    IMLogString();
  }
  if (![(CNFRegFirstRunController *)self pushCompletionControllerIfPossible]
    && ![(CNFRegFirstRunController *)self dismissWithState:v6])
  {
LABEL_7:
    [(CNFRegFirstRunController *)self _updateControllerState];
  }
}

- (BOOL)pushCompletionControllerIfPossible
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  objc_super v3 = OSLogHandleForIDSCategory();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    char v4 = NSStringFromClass([(CNFRegFirstRunController *)self completionControllerClass]);
    *(_DWORD *)buf = 138412290;
    v24 = v4;
    _os_log_impl(&dword_21ED18000, v3, OS_LOG_TYPE_DEFAULT, "Pushing completion controller %@", buf, 0xCu);
  }
  if (os_log_shim_legacy_logging_enabled() && IMShouldLog())
  {
    v22 = NSStringFromClass([(CNFRegFirstRunController *)self completionControllerClass]);
    IMLogString();
  }
  uint64_t v5 = [(CNFRegFirstRunController *)self completionControllerClass];
  id v6 = v5;
  if (v5)
  {
    id v7 = [v5 alloc];
    uint64_t v8 = [(CNFRegListController *)self regController];
    id v9 = (void *)[v7 initWithRegController:v8];

    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0 && [v9 conformsToProtocol:&unk_26D088BF0])
    {
      [v9 setParentController:self];
      BOOL v10 = [(CNFRegFirstRunController *)self rootController];
      [v9 setRootController:v10];

      id v11 = [(CNFRegFirstRunController *)self specifier];
      [v9 setSpecifier:v11];

      if (objc_opt_respondsToSelector()) {
        [v9 setShouldRerootPreferences:1];
      }
      BOOL v12 = (id *)((char *)&self->super.super.super.super.super.super.isa + (int)*MEMORY[0x263F5FE88]);
      id WeakRetained = objc_loadWeakRetained(v12);
      v14 = [WeakRetained viewControllers];
      v15 = (void *)[v14 mutableCopy];

      id v16 = objc_alloc_init(MEMORY[0x263F089C8]);
      if ([v15 count])
      {
        unint64_t v17 = 0;
        do
        {
          v18 = [v15 objectAtIndex:v17];
          if ([v18 conformsToProtocol:&unk_26D0967F0])
          {
            [v18 setDelegate:0];
            [v16 addIndex:v17];
          }

          ++v17;
        }
        while (v17 < [v15 count]);
      }
      [v15 removeObjectsAtIndexes:v16];
      [v15 addObject:v9];
      id v6 = objc_loadWeakRetained(v12);
      [v6 setViewControllers:v15 animated:1];

      LOBYTE(v6) = 1;
    }
    else
    {
      v19 = OSLogHandleForIDSCategory();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
      {
        v20 = NSStringFromClass((Class)v6);
        *(_DWORD *)buf = 138412290;
        v24 = v20;
        _os_log_impl(&dword_21ED18000, v19, OS_LOG_TYPE_DEFAULT, "Unexpected completion controller %@", buf, 0xCu);
      }
      if (!os_log_shim_legacy_logging_enabled() || !IMShouldLog())
      {
        LOBYTE(v6) = 0;
        goto LABEL_24;
      }
      v15 = NSStringFromClass((Class)v6);
      IMLogString();
      LOBYTE(v6) = 0;
    }

LABEL_24:
  }
  return (char)v6;
}

- (BOOL)dismissWithState:(unint64_t)a3
{
  uint64_t v5 = [(CNFRegFirstRunController *)self delegate];
  if (v5)
  {
    id v6 = (void *)v5;
    id v7 = [(CNFRegFirstRunController *)self delegate];
    char v8 = objc_opt_respondsToSelector();

    if (v8)
    {
      id v9 = [(CNFRegFirstRunController *)self delegate];
      [v9 firstRunController:self finishedWithState:a3];

      LOBYTE(v5) = 1;
    }
    else
    {
      LOBYTE(v5) = 0;
    }
  }
  return v5;
}

- (void)_setupEventHandlers
{
  v6.receiver = self;
  v6.super_class = (Class)CNFRegFirstRunController;
  [(CNFRegListController *)&v6 _setupEventHandlers];
  objc_super v3 = [(CNFRegListController *)self regController];
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __47__CNFRegFirstRunController__setupEventHandlers__block_invoke;
  v5[3] = &unk_2644F04A0;
  v5[4] = self;
  [v3 setResetBlock:v5];
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __47__CNFRegFirstRunController__setupEventHandlers__block_invoke_2;
  v4[3] = &unk_2644F04A0;
  v4[4] = self;
  [v3 setServiceDidBecomeUnsupportedBlock:v4];
}

uint64_t __47__CNFRegFirstRunController__setupEventHandlers__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _refreshCurrentState];
}

void __47__CNFRegFirstRunController__setupEventHandlers__block_invoke_2(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) regController];
  char v3 = [v2 isServiceSupported];

  if ((v3 & 1) == 0)
  {
    char v4 = *(void **)(a1 + 32);
    [v4 _updateControllerState];
  }
}

- (int64_t)currentAppearanceStyle
{
  v3.receiver = self;
  v3.super_class = (Class)CNFRegFirstRunController;
  return [(CNFRegListController *)&v3 currentAppearanceStyle];
}

- (void)_executeDismissBlock:(id)a3
{
  char v4 = (void (**)(void))a3;
  if (v4)
  {
    id v9 = v4;
    uint64_t v5 = [(CNFRegFirstRunController *)self navigationController];
    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();

    if (isKindOfClass)
    {
      id v7 = [(CNFRegFirstRunController *)self navigationController];
      if (v7)
      {
        char v8 = v7;
        [v7 setSkipReloadOnNextViewWillAppear:1];
      }
    }
    v9[2]();
    char v4 = v9;
  }
}

- (Class)completionControllerClass
{
  return self->_completionControllerClass;
}

- (void)setCompletionControllerClass:(Class)a3
{
  self->_completionControllerClass = a3;
}

- (UIBarButtonItem)previousLeftButton
{
  return self->_previousLeftButton;
}

- (void)setPreviousLeftButton:(id)a3
{
}

- (UIBarButtonItem)previousRightButton
{
  return self->_previousRightButton;
}

- (void)setPreviousRightButton:(id)a3
{
}

- (BOOL)previousHidesBackButton
{
  return self->_previousHidesBackButton;
}

- (void)setPreviousHidesBackButton:(BOOL)a3
{
  self->_previousHidesBackButton = a3;
}

- (CNFRegFirstRunDelegate)delegate
{
  return self->_delegate;
}

- (void)setDelegate:(id)a3
{
  self->_delegate = (CNFRegFirstRunDelegate *)a3;
}

- (UIBarButtonItem)customLeftButton
{
  return self->_customLeftButton;
}

- (void)setCustomLeftButton:(id)a3
{
}

- (UIBarButtonItem)customRightButton
{
  return self->_customRightButton;
}

- (void)setCustomRightButton:(id)a3
{
}

- (BOOL)timedOut
{
  return self->_timedOut;
}

- (void)setTimedOut:(BOOL)a3
{
  self->_timedOut = a3;
}

- (IMAccount)account
{
  return self->_account;
}

- (void)setAccount:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_account, 0);
  objc_storeStrong((id *)&self->_timeoutTimer, 0);
  objc_storeStrong((id *)&self->_customLeftButton, 0);
  objc_storeStrong((id *)&self->_customRightButton, 0);
  objc_storeStrong((id *)&self->_previousRightButton, 0);
  objc_storeStrong((id *)&self->_previousLeftButton, 0);
}

@end