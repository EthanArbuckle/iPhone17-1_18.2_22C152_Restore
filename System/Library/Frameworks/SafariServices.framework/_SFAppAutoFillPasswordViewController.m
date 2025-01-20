@interface _SFAppAutoFillPasswordViewController
- (BOOL)_canShowWhileLocked;
- (id)_connectToServiceWithCompletion:(id)a3;
- (id)_remoteViewController;
- (void)_sceneDidEnterBackground:(id)a3;
- (void)_setUpServiceProxyIfNeeded;
- (void)authenticateToPresentInPopover:(BOOL)a3 completion:(id)a4;
- (void)authenticateToPresentInPopover:(BOOL)a3 savedAccountContext:(id)a4 completion:(id)a5;
- (void)remoteViewController:(id)a3 fillPassword:(id)a4;
- (void)remoteViewController:(id)a3 fillText:(id)a4;
- (void)remoteViewController:(id)a3 fillUsername:(id)a4;
- (void)remoteViewController:(id)a3 fillVerificationCode:(id)a4;
- (void)remoteViewController:(id)a3 selectedCredential:(id)a4;
- (void)setAuthenticationGracePeriod:(double)a3;
- (void)setExternallyVerifiedAndApprovedSharedWebCredentialsDomains:(id)a3;
- (void)setPageID:(id)a3 frameID:(id)a4 credentialType:(id)a5;
- (void)setRemoteAppID:(id)a3;
- (void)setRemoteLocalizedAppName:(id)a3;
- (void)setRemoteUnlocalizedAppName:(id)a3;
- (void)setSystemAutoFillDocumentTraits:(id)a3;
- (void)setWebViewURL:(id)a3;
- (void)viewDidLoad;
@end

@implementation _SFAppAutoFillPasswordViewController

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (void)_sceneDidEnterBackground:(id)a3
{
  id v8 = a3;
  v4 = [(_SFAppAutoFillPasswordViewController *)self viewIfLoaded];
  v5 = [v4 window];
  v6 = [v5 windowScene];

  if (v6)
  {
    v7 = [v8 object];

    if (v6 == v7) {
      [(_SFPasswordViewController *)self remoteViewControllerWillDismiss:self->_remoteViewController];
    }
  }
}

- (void)_setUpServiceProxyIfNeeded
{
  if (!self->_serviceProxy)
  {
    v3 = [[SFQueueingServiceViewControllerProxy alloc] initWithProtocol:&unk_1EFC44728];
    serviceProxy = self->_serviceProxy;
    self->_serviceProxy = (SFPasswordPickerServiceViewControllerProtocol *)v3;

    v5 = self->_serviceProxy;
    [(SFPasswordPickerServiceViewControllerProtocol *)v5 setDelegate:self];
  }
}

- (id)_connectToServiceWithCompletion:(id)a3
{
  id v4 = a3;
  v5 = WBS_LOG_CHANNEL_PREFIXAppPasswordAutoFill();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
    -[_SFAppAutoFillPasswordViewController _connectToServiceWithCompletion:]((uint64_t)self, v5);
  }
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __72___SFAppAutoFillPasswordViewController__connectToServiceWithCompletion___block_invoke;
  v9[3] = &unk_1E5C72DB8;
  v9[4] = self;
  id v10 = v4;
  id v6 = v4;
  v7 = +[SFPasswordRemoteViewController requestViewControllerWithConnectionHandler:v9];

  return v7;
}

- (void)viewDidLoad
{
  v4.receiver = self;
  v4.super_class = (Class)_SFAppAutoFillPasswordViewController;
  [(_SFAppAutoFillPasswordViewController *)&v4 viewDidLoad];
  v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v3 addObserver:self selector:sel__sceneDidEnterBackground_ name:*MEMORY[0x1E4FB2E90] object:0];

  [(_SFPasswordViewController *)self _addRemoteViewAsChild];
}

- (void)authenticateToPresentInPopover:(BOOL)a3 completion:(id)a4
{
  BOOL v4 = a3;
  id v6 = (void *)MEMORY[0x1E4F98DE0];
  id v7 = a4;
  id v8 = [v6 defaultContext];
  [(_SFAppAutoFillPasswordViewController *)self authenticateToPresentInPopover:v4 savedAccountContext:v8 completion:v7];
}

- (void)authenticateToPresentInPopover:(BOOL)a3 savedAccountContext:(id)a4 completion:(id)a5
{
  BOOL v6 = a3;
  id v8 = a5;
  id v9 = a4;
  id v10 = WBS_LOG_CHANNEL_PREFIXAppPasswordAutoFill();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG)) {
    -[_SFAppAutoFillPasswordViewController authenticateToPresentInPopover:savedAccountContext:completion:]((uint64_t)self, v10);
  }
  serviceProxy = self->_serviceProxy;
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __102___SFAppAutoFillPasswordViewController_authenticateToPresentInPopover_savedAccountContext_completion___block_invoke;
  v13[3] = &unk_1E5C737D0;
  v13[4] = self;
  id v14 = v8;
  id v12 = v8;
  [(SFPasswordPickerServiceViewControllerProtocol *)serviceProxy authenticateToPresentInPopover:v6 savedAccountContext:v9 completion:v13];
}

- (void)setWebViewURL:(id)a3
{
  id v4 = a3;
  v5 = WBS_LOG_CHANNEL_PREFIXAppPasswordAutoFill();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
    -[_SFAppAutoFillPasswordViewController setWebViewURL:]();
  }
  [(SFPasswordPickerServiceViewControllerProtocol *)self->_serviceProxy setWebViewURL:v4];
}

- (void)setRemoteAppID:(id)a3
{
  id v4 = a3;
  v5 = WBS_LOG_CHANNEL_PREFIXAppPasswordAutoFill();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
    -[_SFAppAutoFillPasswordViewController setRemoteAppID:]();
  }
  [(SFPasswordPickerServiceViewControllerProtocol *)self->_serviceProxy setRemoteAppID:v4];
}

- (void)setRemoteLocalizedAppName:(id)a3
{
  id v4 = a3;
  v5 = WBS_LOG_CHANNEL_PREFIXAppPasswordAutoFill();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
    -[_SFAppAutoFillPasswordViewController setRemoteLocalizedAppName:]();
  }
  [(SFPasswordPickerServiceViewControllerProtocol *)self->_serviceProxy setRemoteLocalizedAppName:v4];
}

- (void)setRemoteUnlocalizedAppName:(id)a3
{
  id v4 = a3;
  v5 = WBS_LOG_CHANNEL_PREFIXAppPasswordAutoFill();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
    -[_SFAppAutoFillPasswordViewController setRemoteUnlocalizedAppName:]();
  }
  [(SFPasswordPickerServiceViewControllerProtocol *)self->_serviceProxy setRemoteUnlocalizedAppName:v4];
}

- (void)setExternallyVerifiedAndApprovedSharedWebCredentialsDomains:(id)a3
{
  id v4 = a3;
  v5 = WBS_LOG_CHANNEL_PREFIXAppPasswordAutoFill();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
    -[_SFAppAutoFillPasswordViewController setExternallyVerifiedAndApprovedSharedWebCredentialsDomains:]();
  }
  [(SFPasswordPickerServiceViewControllerProtocol *)self->_serviceProxy setExternallyVerifiedAndApprovedSharedWebCredentialsDomains:v4];
}

- (void)setAuthenticationGracePeriod:(double)a3
{
  v5 = WBS_LOG_CHANNEL_PREFIXAppPasswordAutoFill();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
    [(_SFAppAutoFillPasswordViewController *)(uint64_t)self setAuthenticationGracePeriod:a3];
  }
  [(SFPasswordPickerServiceViewControllerProtocol *)self->_serviceProxy setAuthenticationGracePeriod:a3];
}

- (void)setPageID:(id)a3 frameID:(id)a4 credentialType:(id)a5
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v11 = WBS_LOG_CHANNEL_PREFIXAppPasswordAutoFill();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
  {
    int v12 = 134218754;
    v13 = self;
    __int16 v14 = 2112;
    id v15 = v8;
    __int16 v16 = 2112;
    id v17 = v9;
    __int16 v18 = 2112;
    id v19 = v10;
    _os_log_debug_impl(&dword_1A690B000, v11, OS_LOG_TYPE_DEBUG, "In-process view controller %p setPageID: %@ frameID: %@ credentialType: %@", (uint8_t *)&v12, 0x2Au);
  }
  [(SFPasswordPickerServiceViewControllerProtocol *)self->_serviceProxy setPageID:v8 frameID:v9 credentialType:v10];
}

- (id)_remoteViewController
{
  return self->_remoteViewController;
}

- (void)setSystemAutoFillDocumentTraits:(id)a3
{
  id v4 = a3;
  v5 = WBS_LOG_CHANNEL_PREFIXAppPasswordAutoFill();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
    -[_SFAppAutoFillPasswordViewController setSystemAutoFillDocumentTraits:]();
  }
  [(SFPasswordPickerServiceViewControllerProtocol *)self->_serviceProxy setSystemAutoFillDocumentTraits:v4];
}

- (void)remoteViewController:(id)a3 selectedCredential:(id)a4
{
  id v6 = a4;
  v5 = [(_SFPasswordViewController *)self delegate];
  if (objc_opt_respondsToSelector()) {
    [v5 passwordViewController:self selectedCredential:v6];
  }
}

- (void)remoteViewController:(id)a3 fillUsername:(id)a4
{
  id v6 = a4;
  v5 = [(_SFPasswordViewController *)self delegate];
  if (objc_opt_respondsToSelector()) {
    [v5 passwordViewController:self fillUsername:v6];
  }
}

- (void)remoteViewController:(id)a3 fillPassword:(id)a4
{
  id v6 = a4;
  v5 = [(_SFPasswordViewController *)self delegate];
  if (objc_opt_respondsToSelector()) {
    [v5 passwordViewController:self fillPassword:v6];
  }
}

- (void)remoteViewController:(id)a3 fillVerificationCode:(id)a4
{
  id v6 = a4;
  v5 = [(_SFPasswordViewController *)self delegate];
  if (objc_opt_respondsToSelector()) {
    [v5 passwordViewController:self fillVerificationCode:v6];
  }
}

- (void)remoteViewController:(id)a3 fillText:(id)a4
{
  id v6 = a4;
  v5 = [(_SFPasswordViewController *)self delegate];
  if (objc_opt_respondsToSelector()) {
    [v5 passwordViewController:self fillText:v6];
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_serviceProxy, 0);

  objc_storeStrong((id *)&self->_remoteViewController, 0);
}

- (void)_connectToServiceWithCompletion:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 134217984;
  uint64_t v3 = a1;
  _os_log_debug_impl(&dword_1A690B000, a2, OS_LOG_TYPE_DEBUG, "In-process view controller %p attempting to get remote password picker view controller", (uint8_t *)&v2, 0xCu);
}

- (void)authenticateToPresentInPopover:(uint64_t)a1 savedAccountContext:(NSObject *)a2 completion:.cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 134217984;
  uint64_t v3 = a1;
  _os_log_debug_impl(&dword_1A690B000, a2, OS_LOG_TYPE_DEBUG, "In-process view controller %p attempting to authenticate", (uint8_t *)&v2, 0xCu);
}

- (void)setWebViewURL:.cold.1()
{
  OUTLINED_FUNCTION_0_5();
  OUTLINED_FUNCTION_1_3(&dword_1A690B000, v0, v1, "In-process view controller %p setWebViewURL: %@");
}

- (void)setRemoteAppID:.cold.1()
{
  OUTLINED_FUNCTION_0_5();
  OUTLINED_FUNCTION_1_3(&dword_1A690B000, v0, v1, "In-process view controller %p setRemoteAppID: %@");
}

- (void)setRemoteLocalizedAppName:.cold.1()
{
  OUTLINED_FUNCTION_0_5();
  OUTLINED_FUNCTION_1_3(&dword_1A690B000, v0, v1, "In-process view controller %p setRemoteLocalizedAppName: %@");
}

- (void)setRemoteUnlocalizedAppName:.cold.1()
{
  OUTLINED_FUNCTION_0_5();
  OUTLINED_FUNCTION_1_3(&dword_1A690B000, v0, v1, "In-process view controller %p setRemoteUnlocalizedAppName: %@");
}

- (void)setExternallyVerifiedAndApprovedSharedWebCredentialsDomains:.cold.1()
{
  OUTLINED_FUNCTION_0_5();
  OUTLINED_FUNCTION_1_3(&dword_1A690B000, v0, v1, "In-process view controller %p setExternallyVerifiedAndApprovedSharedWebCredentialsDomains: %@");
}

- (void)setAuthenticationGracePeriod:(double)a3 .cold.1(uint64_t a1, NSObject *a2, double a3)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  int v3 = 134218240;
  uint64_t v4 = a1;
  __int16 v5 = 2048;
  double v6 = a3;
  _os_log_debug_impl(&dword_1A690B000, a2, OS_LOG_TYPE_DEBUG, "In-process view controller %p setAuthenticationGracePeriod: %f", (uint8_t *)&v3, 0x16u);
}

- (void)setSystemAutoFillDocumentTraits:.cold.1()
{
  OUTLINED_FUNCTION_0_5();
  OUTLINED_FUNCTION_1_3(&dword_1A690B000, v0, v1, "In-process view controller %p setSystemAutoFillDocumentTraits: %@");
}

@end