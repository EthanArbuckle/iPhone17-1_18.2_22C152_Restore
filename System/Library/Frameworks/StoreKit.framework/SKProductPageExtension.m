@interface SKProductPageExtension
+ (id)clientInterface;
+ (id)serviceInterface;
- (BOOL)_isClientEntitled;
- (BOOL)askToBuy;
- (BOOL)lookupItemDidLoad:(id)a3 parameters:(id)a4;
- (BOOL)showsRightBarButton;
- (BOOL)showsStoreButton;
- (NSString)cancelButtonTitle;
- (NSString)promptString;
- (NSString)rightBarButtonTitle;
- (id)_createNavigationItem;
- (void)_setAskToBuy:(BOOL)a3;
- (void)_setCancelButtonTitle:(id)a3;
- (void)_setPromptString:(id)a3;
- (void)_setRightBarButtonTitle:(id)a3;
- (void)_setShowsRightBarButton:(BOOL)a3;
- (void)_setShowsStoreButton:(BOOL)a3;
- (void)_setUsageContext:(id)a3;
- (void)_setupWithClientBundleID:(id)a3 bagType:(int64_t)a4;
- (void)cancelButtonPressed:(id)a3;
- (void)clientLookupItemDidLoad:(id)a3 parameters:(id)a4;
- (void)finishWithResult:(unint64_t)a3 completion:(id)a4;
- (void)loadDidFinish;
- (void)rightBarButtonPressed:(id)a3;
- (void)setAskToBuy:(BOOL)a3;
- (void)setCancelButtonTitle:(id)a3;
- (void)setPromptString:(id)a3;
- (void)setRightBarButtonTitle:(id)a3;
- (void)setShowsRightBarButton:(BOOL)a3;
- (void)setShowsStoreButton:(BOOL)a3;
- (void)userDidInteractWithProduct:(unint64_t)a3;
@end

@implementation SKProductPageExtension

- (void)finishWithResult:(unint64_t)a3 completion:(id)a4
{
  id v6 = a4;
  v7 = [(SKProductPageExtension *)self _remoteViewControllerProxy];
  if (v7)
  {
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __54__SKProductPageExtension_finishWithResult_completion___block_invoke;
    v8[3] = &unk_1E5FA9988;
    id v9 = v6;
    [v7 finishWithResult:a3 completion:v8];
  }
  else
  {
    [(SKProductPageExtension *)self dismissViewControllerAnimated:1 completion:v6];
  }
}

uint64_t __54__SKProductPageExtension_finishWithResult_completion___block_invoke(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

- (void)loadDidFinish
{
  UIAccessibilityNotifications v3 = *MEMORY[0x1E4FB24B0];
  v4 = [(SKProductPageExtension *)self view];
  UIAccessibilityPostNotification(v3, v4);

  v5 = [(SKProductPageExtension *)self _remoteViewControllerProxy];
  if (v5)
  {
    id v6 = v5;
    [v5 loadDidFinish];
    v5 = v6;
  }
}

- (void)userDidInteractWithProduct:(unint64_t)a3
{
  v4 = [(SKProductPageExtension *)self _remoteViewControllerProxy];
  if (v4)
  {
    id v5 = v4;
    [v4 userDidInteractWithProduct:a3];
    v4 = v5;
  }
}

- (BOOL)lookupItemDidLoad:(id)a3 parameters:(id)a4
{
  return 1;
}

- (void)clientLookupItemDidLoad:(id)a3 parameters:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  v8 = [v6 objectForKey:@"isViewOnly"];

  if (v8) {
    [(SKProductPageExtension *)self setShowsStoreButton:0];
  }
  id v9 = [(SKProductPageExtension *)self _createNavigationItem];
  v10 = [(SKProductPageExtension *)self promptString];
  [(SKProductPageExtension *)self setupWithCustomNavigationItem:v9 promptString:v10 askToBuy:[(SKProductPageExtension *)self askToBuy]];

  LODWORD(v9) = [(SKProductPageExtension *)self lookupItemDidLoad:v7 parameters:v6];
  if (v9)
  {
    [(SKProductPageExtension *)self loadDidFinish];
  }
}

- (void)cancelButtonPressed:(id)a3
{
}

- (void)rightBarButtonPressed:(id)a3
{
}

+ (id)clientInterface
{
  return (id)[MEMORY[0x1E4F29280] interfaceWithProtocol:&unk_1F08CD008];
}

+ (id)serviceInterface
{
  v2 = [MEMORY[0x1E4F29280] interfaceWithProtocol:&unk_1F08E6448];
  UIAccessibilityNotifications v3 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v4 = objc_opt_class();
  uint64_t v5 = objc_opt_class();
  uint64_t v6 = objc_opt_class();
  uint64_t v7 = objc_opt_class();
  uint64_t v8 = objc_opt_class();
  id v9 = objc_msgSend(v3, "setWithObjects:", v4, v5, v6, v7, v8, objc_opt_class(), 0);
  [v2 setClasses:v9 forSelector:sel_clientLookupItemDidLoad_parameters_ argumentIndex:0 ofReply:0];

  return v2;
}

- (id)_createNavigationItem
{
  id v3 = objc_alloc_init(MEMORY[0x1E4FB19F0]);
  uint64_t v4 = [(SKProductPageExtension *)self cancelButtonTitle];

  id v5 = objc_alloc(MEMORY[0x1E4FB14A8]);
  uint64_t v6 = v5;
  if (v4)
  {
    uint64_t v7 = [(SKProductPageExtension *)self cancelButtonTitle];
    uint64_t v8 = (void *)[v6 initWithTitle:v7 style:0 target:self action:sel_cancelButtonPressed_];
    [v3 setLeftBarButtonItem:v8];
  }
  else
  {
    uint64_t v7 = (void *)[v5 initWithBarButtonSystemItem:0 target:self action:sel_cancelButtonPressed_];
    [v3 setLeftBarButtonItem:v7];
  }

  if ([(SKProductPageExtension *)self showsRightBarButton]
    && ([(SKProductPageExtension *)self rightBarButtonTitle],
        id v9 = objc_claimAutoreleasedReturnValue(),
        v9,
        v9))
  {
    id v10 = objc_alloc(MEMORY[0x1E4FB14A8]);
    v11 = [(SKProductPageExtension *)self rightBarButtonTitle];
    v12 = (void *)[v10 initWithTitle:v11 style:0 target:self action:sel_rightBarButtonPressed_];
    [v3 setRightBarButtonItem:v12];
  }
  else
  {
    if (![(SKProductPageExtension *)self showsStoreButton]) {
      goto LABEL_10;
    }
    id v13 = objc_alloc(MEMORY[0x1E4FB14A8]);
    v11 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
    v12 = [v11 localizedStringForKey:@"VIEW_IN_STORE" value:&stru_1F08A7B80 table:0];
    v14 = (void *)[v13 initWithTitle:v12 style:0 target:self action:sel_storeButtonPressed_];
    [v3 setRightBarButtonItem:v14];
  }
LABEL_10:

  return v3;
}

- (void)_setShowsStoreButton:(BOOL)a3
{
  BOOL v3 = a3;
  if ([(SKProductPageExtension *)self _isClientEntitled])
  {
    [(SKProductPageExtension *)self setShowsStoreButton:v3];
  }
  else
  {
    if (SKLogHandleForCategory_onceToken != -1) {
      dispatch_once(&SKLogHandleForCategory_onceToken, &__block_literal_global_8);
    }
    if (os_log_type_enabled((os_log_t)SKLogHandleForCategory_logHandles_9, OS_LOG_TYPE_ERROR)) {
      -[SKProductPageExtension _setShowsStoreButton:]();
    }
  }
}

- (void)_setCancelButtonTitle:(id)a3
{
  id v4 = a3;
  if ([(SKProductPageExtension *)self _isClientEntitled])
  {
    [(SKProductPageExtension *)self setCancelButtonTitle:v4];
  }
  else
  {
    if (SKLogHandleForCategory_onceToken != -1) {
      dispatch_once(&SKLogHandleForCategory_onceToken, &__block_literal_global_8);
    }
    if (os_log_type_enabled((os_log_t)SKLogHandleForCategory_logHandles_9, OS_LOG_TYPE_ERROR)) {
      -[SKProductPageExtension _setCancelButtonTitle:]();
    }
  }
}

- (void)_setRightBarButtonTitle:(id)a3
{
  id v4 = a3;
  if ([(SKProductPageExtension *)self _isClientEntitled])
  {
    [(SKProductPageExtension *)self setRightBarButtonTitle:v4];
  }
  else
  {
    if (SKLogHandleForCategory_onceToken != -1) {
      dispatch_once(&SKLogHandleForCategory_onceToken, &__block_literal_global_8);
    }
    if (os_log_type_enabled((os_log_t)SKLogHandleForCategory_logHandles_9, OS_LOG_TYPE_ERROR)) {
      -[SKProductPageExtension _setRightBarButtonTitle:]();
    }
  }
}

- (void)_setShowsRightBarButton:(BOOL)a3
{
  BOOL v3 = a3;
  if ([(SKProductPageExtension *)self _isClientEntitled])
  {
    [(SKProductPageExtension *)self setShowsRightBarButton:v3];
  }
  else
  {
    if (SKLogHandleForCategory_onceToken != -1) {
      dispatch_once(&SKLogHandleForCategory_onceToken, &__block_literal_global_8);
    }
    if (os_log_type_enabled((os_log_t)SKLogHandleForCategory_logHandles_9, OS_LOG_TYPE_ERROR)) {
      -[SKProductPageExtension _setShowsRightBarButton:]();
    }
  }
}

- (void)_setPromptString:(id)a3
{
  id v4 = a3;
  if ([(SKProductPageExtension *)self _isClientEntitled])
  {
    [(SKProductPageExtension *)self setPromptString:v4];
  }
  else
  {
    if (SKLogHandleForCategory_onceToken != -1) {
      dispatch_once(&SKLogHandleForCategory_onceToken, &__block_literal_global_8);
    }
    if (os_log_type_enabled((os_log_t)SKLogHandleForCategory_logHandles_9, OS_LOG_TYPE_ERROR)) {
      -[SKProductPageExtension _setPromptString:]();
    }
  }
}

- (void)_setAskToBuy:(BOOL)a3
{
  BOOL v3 = a3;
  if ([(SKProductPageExtension *)self _isClientEntitled])
  {
    [(SKProductPageExtension *)self setAskToBuy:v3];
  }
  else
  {
    if (SKLogHandleForCategory_onceToken != -1) {
      dispatch_once(&SKLogHandleForCategory_onceToken, &__block_literal_global_8);
    }
    if (os_log_type_enabled((os_log_t)SKLogHandleForCategory_logHandles_9, OS_LOG_TYPE_ERROR)) {
      -[SKProductPageExtension _setAskToBuy:]();
    }
  }
}

- (void)_setUsageContext:(id)a3
{
  id v4 = a3;
  if ([(SKProductPageExtension *)self _isClientEntitled])
  {
    [(SKProductPageExtension *)self setUsageContext:v4];
  }
  else
  {
    if (SKLogHandleForCategory_onceToken != -1) {
      dispatch_once(&SKLogHandleForCategory_onceToken, &__block_literal_global_8);
    }
    if (os_log_type_enabled((os_log_t)SKLogHandleForCategory_logHandles_9, OS_LOG_TYPE_ERROR)) {
      -[SKProductPageExtension _setUsageContext:]();
    }
  }
}

- (void)_setupWithClientBundleID:(id)a3 bagType:(int64_t)a4
{
  id v7 = a3;
  if ([(SKProductPageExtension *)self _isClientEntitled])
  {
    [(SKProductPageExtension *)self setupWithClientBundleID:v7 bagType:a4];
  }
  else
  {
    uint64_t v6 = [(SKProductPageExtension *)self _hostApplicationBundleIdentifier];
    [(SKProductPageExtension *)self setupWithClientBundleID:v6 bagType:a4];
  }
}

- (BOOL)_isClientEntitled
{
  if (!_os_feature_enabled_impl()) {
    return 1;
  }
  [(SKProductPageExtension *)self _hostAuditToken];
  return +[SKEntitlementChecker isProcessEntitled:&v4 entitlementName:@"com.apple.itunesstored.private"];
}

- (BOOL)showsStoreButton
{
  return self->_showsStoreButton;
}

- (void)setShowsStoreButton:(BOOL)a3
{
  self->_showsStoreButton = a3;
}

- (NSString)cancelButtonTitle
{
  return self->_cancelButtonTitle;
}

- (void)setCancelButtonTitle:(id)a3
{
}

- (NSString)rightBarButtonTitle
{
  return self->_rightBarButtonTitle;
}

- (void)setRightBarButtonTitle:(id)a3
{
}

- (BOOL)showsRightBarButton
{
  return self->_showsRightBarButton;
}

- (void)setShowsRightBarButton:(BOOL)a3
{
  self->_showsRightBarButton = a3;
}

- (NSString)promptString
{
  return self->_promptString;
}

- (void)setPromptString:(id)a3
{
}

- (BOOL)askToBuy
{
  return self->_askToBuy;
}

- (void)setAskToBuy:(BOOL)a3
{
  self->_askToBuy = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_promptString, 0);
  objc_storeStrong((id *)&self->_rightBarButtonTitle, 0);

  objc_storeStrong((id *)&self->_cancelButtonTitle, 0);
}

- (void)_setShowsStoreButton:.cold.1()
{
  OUTLINED_FUNCTION_1_2();
  OUTLINED_FUNCTION_0_3(&dword_1B005B000, v0, v1, "[%{public}@]: Client not entitled to show store button", v2, v3, v4, v5, v6);
}

- (void)_setCancelButtonTitle:.cold.1()
{
  OUTLINED_FUNCTION_1_2();
  OUTLINED_FUNCTION_0_3(&dword_1B005B000, v0, v1, "[%{public}@]: Client not entitled to set cancel button title", v2, v3, v4, v5, v6);
}

- (void)_setRightBarButtonTitle:.cold.1()
{
  OUTLINED_FUNCTION_1_2();
  OUTLINED_FUNCTION_0_3(&dword_1B005B000, v0, v1, "[%{public}@]: Client not entitled to set bar button title", v2, v3, v4, v5, v6);
}

- (void)_setShowsRightBarButton:.cold.1()
{
  OUTLINED_FUNCTION_1_2();
  OUTLINED_FUNCTION_0_3(&dword_1B005B000, v0, v1, "[%{public}@]: Client not entitled to set right bar button", v2, v3, v4, v5, v6);
}

- (void)_setPromptString:.cold.1()
{
  OUTLINED_FUNCTION_1_2();
  OUTLINED_FUNCTION_0_3(&dword_1B005B000, v0, v1, "[%{public}@]: Client not entitled to set prompt string", v2, v3, v4, v5, v6);
}

- (void)_setAskToBuy:.cold.1()
{
  OUTLINED_FUNCTION_1_2();
  OUTLINED_FUNCTION_0_3(&dword_1B005B000, v0, v1, "[%{public}@]: Client not entitled to set ATB", v2, v3, v4, v5, v6);
}

- (void)_setUsageContext:.cold.1()
{
  OUTLINED_FUNCTION_1_2();
  OUTLINED_FUNCTION_0_3(&dword_1B005B000, v0, v1, "[%{public}@]: Client not entitled to set usage context", v2, v3, v4, v5, v6);
}

@end