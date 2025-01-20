@interface INUIRemoteViewController
+ (void)_attemptToConnectToRemoteViewControllerForRemainingExtensions:(id)a3 delegate:(id)a4 connectionHandler:(id)a5;
+ (void)_getWidgetHostingRemoteViewControllerWithIntent:(id)a3 descriptor:(id)a4 completionHandler:(id)a5;
+ (void)_getWidgetHostingRemoteViewControllerWithIntent:(id)a3 extensionMatchingError:(id)a4 completionHandler:(id)a5;
+ (void)_requestRemoteViewControllerForSnippetExtensionInteraction:(id)a3 delegate:(id)a4 connectionHandler:(id)a5;
+ (void)_requestRemoteViewControllerWithRequestInfo:(id)a3 delegate:(id)a4 reply:(id)a5;
+ (void)requestRemoteViewControllerForInteraction:(id)a3 delegate:(id)a4 connectionHandler:(id)a5;
+ (void)requestRemoteViewControllerWithRequestInfo:(id)a3 reply:(id)a4;
- (BOOL)_canShowWhileLocked;
- (BOOL)isWidgetHost;
- (BOOL)needsStateUpdate;
- (CGSize)preferredContentSize;
- (INUIExtensionRequestInfo)requestInfo;
- (INUIExtensionViewControllerConfiguration)configuration;
- (INUIRemoteViewControllerDelegate)delegate;
- (INWidgetDescriptor)widgetDescriptor;
- (NSCopying)currentRequestIdentifier;
- (NSExtension)activeExtension;
- (_INUIExtensionHostContext)extensionHostContext;
- (id)_errorHandlingServiceViewControllerProxy;
- (id)disconnect;
- (void)_queryRepresentedPropertiesWithCompletion:(id)a3;
- (void)_setRequestInfo:(id)a3;
- (void)_updateExtensionContextStateWithCompletion:(id)a3;
- (void)configureForParameters:(id)a3 ofInteraction:(id)a4 interactiveBehavior:(unint64_t)a5 context:(unint64_t)a6 completion:(id)a7;
- (void)configureWithInteraction:(id)a3 context:(unint64_t)a4 completion:(id)a5;
- (void)configureWithInteraction:(id)a3 context:(unint64_t)a4 errorHandlingCompletion:(id)a5;
- (void)desiresInteractivity:(id)a3;
- (void)extensionHostContext:(id)a3 wantsToHandleIntent:(id)a4;
- (void)extensionHostContextWillBeginEditing:(id)a3;
- (void)requestCancellation;
- (void)setActiveExtension:(id)a3;
- (void)setConfiguration:(id)a3;
- (void)setCurrentRequestIdentifier:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setDelegate:(id)a3 completion:(id)a4;
- (void)setExtensionHostContext:(id)a3;
- (void)setIdealConfiguration:(id)a3 animated:(BOOL)a4 completion:(id)a5;
- (void)setNeedsStateUpdate:(BOOL)a3;
- (void)setPreferredContentSize:(CGSize)a3;
- (void)setWidgetDescriptor:(id)a3;
- (void)setWidgetHost:(BOOL)a3;
- (void)viewServiceDidTerminateWithError:(id)a3;
@end

@implementation INUIRemoteViewController

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_currentRequestIdentifier, 0);
  objc_storeStrong((id *)&self->_activeExtension, 0);
  objc_storeStrong((id *)&self->_extensionHostContext, 0);
  objc_storeStrong((id *)&self->_widgetDescriptor, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_requestInfo, 0);

  objc_storeStrong((id *)&self->_configuration, 0);
}

- (void)setCurrentRequestIdentifier:(id)a3
{
}

- (NSCopying)currentRequestIdentifier
{
  return self->_currentRequestIdentifier;
}

- (void)setActiveExtension:(id)a3
{
}

- (NSExtension)activeExtension
{
  return self->_activeExtension;
}

- (void)setExtensionHostContext:(id)a3
{
}

- (_INUIExtensionHostContext)extensionHostContext
{
  return self->_extensionHostContext;
}

- (void)setWidgetDescriptor:(id)a3
{
}

- (INWidgetDescriptor)widgetDescriptor
{
  return self->_widgetDescriptor;
}

- (void)setWidgetHost:(BOOL)a3
{
  self->_widgetHost = a3;
}

- (BOOL)isWidgetHost
{
  return self->_widgetHost;
}

- (INUIRemoteViewControllerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (INUIRemoteViewControllerDelegate *)WeakRetained;
}

- (void)_setRequestInfo:(id)a3
{
}

- (INUIExtensionRequestInfo)requestInfo
{
  return self->_requestInfo;
}

- (void)setConfiguration:(id)a3
{
}

- (INUIExtensionViewControllerConfiguration)configuration
{
  return self->_configuration;
}

- (BOOL)needsStateUpdate
{
  return self->_needsStateUpdate;
}

- (void)setPreferredContentSize:(CGSize)a3
{
  self->_preferredContentSize = a3;
}

- (CGSize)preferredContentSize
{
  double width = self->_preferredContentSize.width;
  double height = self->_preferredContentSize.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (void)configureWithInteraction:(id)a3 context:(unint64_t)a4 completion:(id)a5
{
  id v8 = a5;
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __72__INUIRemoteViewController_configureWithInteraction_context_completion___block_invoke;
  v10[3] = &unk_263FD6D08;
  id v11 = v8;
  id v9 = v8;
  [(INUIRemoteViewController *)self configureWithInteraction:a3 context:a4 errorHandlingCompletion:v10];
}

uint64_t __72__INUIRemoteViewController_configureWithInteraction_context_completion___block_invoke(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

- (void)configureForParameters:(id)a3 ofInteraction:(id)a4 interactiveBehavior:(unint64_t)a5 context:(unint64_t)a6 completion:(id)a7
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a7;
  v13 = [(INUIRemoteViewController *)self extensionHostContext];
  v14 = [v13 _auxiliaryConnection];
  v42[0] = MEMORY[0x263EF8330];
  v42[1] = 3221225472;
  v42[2] = __104__INUIRemoteViewController_configureForParameters_ofInteraction_interactiveBehavior_context_completion___block_invoke;
  v42[3] = &unk_263FD6C68;
  id v15 = v12;
  id v43 = v15;
  v16 = [v14 remoteObjectProxyWithErrorHandler:v42];

  if (v16)
  {
    v40[0] = 0;
    v40[1] = v40;
    v40[2] = 0x2020000000;
    char v41 = 0;
    id v17 = objc_alloc(MEMORY[0x263F100E0]);
    v37[0] = MEMORY[0x263EF8330];
    v37[1] = 3221225472;
    v37[2] = __104__INUIRemoteViewController_configureForParameters_ofInteraction_interactiveBehavior_context_completion___block_invoke_2;
    v37[3] = &unk_263FD6C90;
    id v18 = v15;
    id v38 = v18;
    v39 = v40;
    v19 = (void *)[v17 initWithTimeoutInterval:v37 timeoutHandler:10.0];
    [v19 start];
    v20 = [(INUIRemoteViewController *)self extensionHostContext];
    v21 = [v20 _auxiliaryConnection];

    long long v35 = 0u;
    long long v36 = 0u;
    if (v21) {
      [v21 auditToken];
    }
    v22 = [v11 intent];
    v23 = [(INUIRemoteViewController *)self activeExtension];
    v24 = [v23 _extensionBundle];
    long long v33 = v35;
    long long v34 = v36;
    [v22 trimDataAgainstTCCForAuditToken:&v33 bundle:v24];

    long long v33 = v35;
    long long v34 = v36;
    INIssueSandboxExtensionsForFileURLEnumerableToProcess();
    v25 = [v11 intentResponse];
    if (v25)
    {
      long long v33 = v35;
      long long v34 = v36;
      INIssueSandboxExtensionsForFileURLEnumerableToProcess();
    }
    v29[0] = MEMORY[0x263EF8330];
    v29[1] = 3221225472;
    v29[2] = __104__INUIRemoteViewController_configureForParameters_ofInteraction_interactiveBehavior_context_completion___block_invoke_68;
    v29[3] = &unk_263FD6CE0;
    id v31 = v18;
    v32 = v40;
    id v26 = v19;
    id v30 = v26;
    [v16 configureForParameters:v10 ofInteraction:v11 interactiveBehavior:a5 context:a6 completion:v29];

    _Block_object_dispose(v40, 8);
  }
}

void __104__INUIRemoteViewController_configureForParameters_ofInteraction_interactiveBehavior_context_completion___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  id v3 = a2;
  v4 = *MEMORY[0x263F0F810];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F0F810], OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 136315394;
    id v10 = "-[INUIRemoteViewController configureForParameters:ofInteraction:interactiveBehavior:context:completion:]_block_invoke";
    __int16 v11 = 2114;
    id v12 = v3;
    _os_log_error_impl(&dword_20A3EB000, v4, OS_LOG_TYPE_ERROR, "%s Unable to retrieve service view controller: %{public}@", buf, 0x16u);
  }
  v5 = *(void **)(a1 + 32);
  if (v5)
  {
    v6[0] = MEMORY[0x263EF8330];
    v6[1] = 3221225472;
    v6[2] = __104__INUIRemoteViewController_configureForParameters_ofInteraction_interactiveBehavior_context_completion___block_invoke_66;
    v6[3] = &unk_263FD6C40;
    id v8 = v5;
    id v7 = v3;
    dispatch_async(MEMORY[0x263EF83A0], v6);
  }
}

void __104__INUIRemoteViewController_configureForParameters_ofInteraction_interactiveBehavior_context_completion___block_invoke_2(uint64_t a1)
{
  if (*(void *)(a1 + 32))
  {
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __104__INUIRemoteViewController_configureForParameters_ofInteraction_interactiveBehavior_context_completion___block_invoke_3;
    block[3] = &unk_263FD6C90;
    long long v2 = *(_OWORD *)(a1 + 32);
    id v1 = (id)v2;
    long long v4 = v2;
    dispatch_async(MEMORY[0x263EF83A0], block);
  }
}

void __104__INUIRemoteViewController_configureForParameters_ofInteraction_interactiveBehavior_context_completion___block_invoke_68(uint64_t a1, char a2, void *a3, void *a4, double a5, double a6)
{
  id v11 = a3;
  id v12 = a4;
  if (*(void *)(a1 + 40))
  {
    v13[0] = MEMORY[0x263EF8330];
    v13[1] = 3221225472;
    v13[2] = __104__INUIRemoteViewController_configureForParameters_ofInteraction_interactiveBehavior_context_completion___block_invoke_2_69;
    v13[3] = &unk_263FD6CB8;
    uint64_t v18 = *(void *)(a1 + 48);
    id v14 = *(id *)(a1 + 32);
    id v17 = *(id *)(a1 + 40);
    char v21 = a2;
    id v15 = v11;
    double v19 = a5;
    double v20 = a6;
    id v16 = v12;
    dispatch_async(MEMORY[0x263EF83A0], v13);
  }
}

uint64_t __104__INUIRemoteViewController_configureForParameters_ofInteraction_interactiveBehavior_context_completion___block_invoke_2_69(uint64_t result)
{
  if (!*(unsigned char *)(*(void *)(*(void *)(result + 64) + 8) + 24))
  {
    uint64_t v1 = result;
    [*(id *)(result + 32) cancel];
    uint64_t result = (*(uint64_t (**)(double, double))(*(void *)(v1 + 56) + 16))(*(double *)(v1 + 72), *(double *)(v1 + 80));
    *(unsigned char *)(*(void *)(*(void *)(v1 + 64) + 8) + 24) = 1;
  }
  return result;
}

void __104__INUIRemoteViewController_configureForParameters_ofInteraction_interactiveBehavior_context_completion___block_invoke_3(uint64_t a1)
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  if (!*(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24))
  {
    long long v2 = [MEMORY[0x263F087E8] errorWithDomain:@"INUIRemoteViewControllerErrorDomain" code:1 userInfo:0];
    id v3 = *MEMORY[0x263F0F810];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F0F810], OS_LOG_TYPE_ERROR))
    {
      int v4 = 136315394;
      v5 = "-[INUIRemoteViewController configureForParameters:ofInteraction:interactiveBehavior:context:completion:]_block_invoke_3";
      __int16 v6 = 2114;
      id v7 = v2;
      _os_log_error_impl(&dword_20A3EB000, v3, OS_LOG_TYPE_ERROR, "%s Timed out waiting for service view controller configuration: %{public}@", (uint8_t *)&v4, 0x16u);
    }
    (*(void (**)(double, double))(*(void *)(a1 + 32) + 16))(*MEMORY[0x263F001B0], *(double *)(MEMORY[0x263F001B0] + 8));
    *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 1;
  }
}

uint64_t __104__INUIRemoteViewController_configureForParameters_ofInteraction_interactiveBehavior_context_completion___block_invoke_66(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void, void, double, double))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), 0, 0, *(void *)(a1 + 32), *MEMORY[0x263F001B0], *(double *)(MEMORY[0x263F001B0] + 8));
}

- (void)configureWithInteraction:(id)a3 context:(unint64_t)a4 errorHandlingCompletion:(id)a5
{
  id v8 = a5;
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __85__INUIRemoteViewController_configureWithInteraction_context_errorHandlingCompletion___block_invoke;
  v10[3] = &unk_263FD6C18;
  id v11 = v8;
  id v9 = v8;
  [(INUIRemoteViewController *)self configureForParameters:0 ofInteraction:a3 interactiveBehavior:0 context:a4 completion:v10];
}

uint64_t __85__INUIRemoteViewController_configureWithInteraction_context_errorHandlingCompletion___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(uint64_t, uint64_t))(result + 16))(result, a4);
  }
  return result;
}

- (void)extensionHostContextWillBeginEditing:(id)a3
{
  id v4 = [(INUIRemoteViewController *)self delegate];
  if (objc_opt_respondsToSelector()) {
    [v4 remoteViewControllerWillBeginEditing:self];
  }
}

- (void)extensionHostContext:(id)a3 wantsToHandleIntent:(id)a4
{
  id v6 = a4;
  v5 = [(INUIRemoteViewController *)self delegate];
  if (objc_opt_respondsToSelector()) {
    [v5 remoteViewController:self requestsHandlingOfIntent:v6];
  }
}

- (void)_updateExtensionContextStateWithCompletion:(id)a3
{
  v25[1] = *MEMORY[0x263EF8340];
  id v4 = a3;
  self->_needsStateUpdate = 1;
  objc_initWeak(&location, self);
  v18[0] = MEMORY[0x263EF8330];
  v18[1] = 3221225472;
  v18[2] = __71__INUIRemoteViewController__updateExtensionContextStateWithCompletion___block_invoke;
  v18[3] = &unk_263FD6BC8;
  objc_copyWeak(&v20, &location);
  id v5 = v4;
  id v19 = v5;
  uint64_t v6 = MEMORY[0x210519BD0](v18);
  id v7 = (void *)v6;
  if (self->_extensionHostContext)
  {
    id v8 = objc_alloc_init(_INUIExtensionContextState);
    id v9 = [(INUIRemoteViewController *)self delegate];
    if (!v9)
    {
LABEL_16:
      extensionHostContext = self->_extensionHostContext;
      v16[0] = MEMORY[0x263EF8330];
      v16[1] = 3221225472;
      v16[2] = __71__INUIRemoteViewController__updateExtensionContextStateWithCompletion___block_invoke_60;
      v16[3] = &unk_263FD6A68;
      id v17 = v7;
      [(_INUIExtensionHostContext *)extensionHostContext setExtensionContextState:v8 completion:v16];

      goto LABEL_17;
    }
    if (objc_opt_respondsToSelector())
    {
      id v10 = [v9 minimumSizesBySystemVersionForRemoteViewController:self];
      [(_INUIExtensionContextState *)v8 setHostedViewMinimumAllowedSizes:v10];
    }
    else
    {
      if ((objc_opt_respondsToSelector() & 1) == 0) {
        goto LABEL_9;
      }
      [v9 minimumSizeForRemoteViewController:self];
      v24 = &unk_26BE51278;
      id v10 = objc_msgSend(MEMORY[0x263F08D40], "valueWithCGSize:");
      v25[0] = v10;
      id v11 = [NSDictionary dictionaryWithObjects:v25 forKeys:&v24 count:1];
      [(_INUIExtensionContextState *)v8 setHostedViewMinimumAllowedSizes:v11];
    }
LABEL_9:
    if (objc_opt_respondsToSelector())
    {
      id v12 = [v9 maximumSizesBySystemVersionForRemoteViewController:self];
      [(_INUIExtensionContextState *)v8 setHostedViewMaximumAllowedSizes:v12];
    }
    else
    {
      if ((objc_opt_respondsToSelector() & 1) == 0) {
        goto LABEL_14;
      }
      [v9 maximumSizeForRemoteViewController:self];
      v22 = &unk_26BE51278;
      id v12 = objc_msgSend(MEMORY[0x263F08D40], "valueWithCGSize:");
      v23 = v12;
      uint64_t v13 = [NSDictionary dictionaryWithObjects:&v23 forKeys:&v22 count:1];
      [(_INUIExtensionContextState *)v8 setHostedViewMaximumAllowedSizes:v13];
    }
LABEL_14:
    if (objc_opt_respondsToSelector())
    {
      id v14 = [v9 interfaceSectionsForRemoteViewController:self];
      [(_INUIExtensionContextState *)v8 setInterfaceSections:v14];
    }
    goto LABEL_16;
  }
  (*(void (**)(uint64_t))(v6 + 16))(v6);
LABEL_17:

  objc_destroyWeak(&v20);
  objc_destroyWeak(&location);
}

uint64_t __71__INUIRemoteViewController__updateExtensionContextStateWithCompletion___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained) {
    WeakRetained[1488] = 0;
  }
  uint64_t v3 = *(void *)(a1 + 32);
  if (v3) {
    (*(void (**)(void))(v3 + 16))();
  }

  return MEMORY[0x270F9A758]();
}

uint64_t __71__INUIRemoteViewController__updateExtensionContextStateWithCompletion___block_invoke_60(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (id)_errorHandlingServiceViewControllerProxy
{
  long long v2 = [(INUIRemoteViewController *)self extensionHostContext];
  uint64_t v3 = [v2 _auxiliaryConnection];
  id v4 = [v3 remoteObjectProxyWithErrorHandler:&__block_literal_global_46];

  return v4;
}

void __68__INUIRemoteViewController__errorHandlingServiceViewControllerProxy__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  id v2 = a2;
  uint64_t v3 = *MEMORY[0x263F0F810];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F0F810], OS_LOG_TYPE_ERROR))
  {
    int v4 = 136315394;
    id v5 = "-[INUIRemoteViewController _errorHandlingServiceViewControllerProxy]_block_invoke";
    __int16 v6 = 2114;
    id v7 = v2;
    _os_log_error_impl(&dword_20A3EB000, v3, OS_LOG_TYPE_ERROR, "%s Unable to retrieve service view controller: %{public}@", (uint8_t *)&v4, 0x16u);
  }
}

- (void)_queryRepresentedPropertiesWithCompletion:(id)a3
{
  id v4 = a3;
  id v5 = [(INUIRemoteViewController *)self _errorHandlingServiceViewControllerProxy];
  [v5 queryRepresentedPropertiesWithCompletion:v4];
}

- (void)desiresInteractivity:(id)a3
{
  id v4 = (void (**)(id, void))a3;
  id v5 = [(INUIRemoteViewController *)self extensionHostContext];
  __int16 v6 = [v5 _auxiliaryConnection];
  id v7 = [v6 remoteObjectProxyWithErrorHandler:&__block_literal_global_16];

  if (v7) {
    [v7 desiresInteractivity:v4];
  }
  else {
    v4[2](v4, 0);
  }
}

void __49__INUIRemoteViewController_desiresInteractivity___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  id v2 = a2;
  uint64_t v3 = *MEMORY[0x263F0F810];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F0F810], OS_LOG_TYPE_ERROR))
  {
    int v4 = 136315394;
    id v5 = "-[INUIRemoteViewController desiresInteractivity:]_block_invoke";
    __int16 v6 = 2114;
    id v7 = v2;
    _os_log_error_impl(&dword_20A3EB000, v3, OS_LOG_TYPE_ERROR, "%s Unable to retrieve service view controller: %{public}@", (uint8_t *)&v4, 0x16u);
  }
}

- (void)requestCancellation
{
  id v2 = [(INUIRemoteViewController *)self extensionHostContext];
  uint64_t v3 = [v2 _auxiliaryConnection];
  id v5 = [v3 remoteObjectProxyWithErrorHandler:&__block_literal_global_1163];

  int v4 = v5;
  if (v5)
  {
    [v5 viewWasCancelled];
    int v4 = v5;
  }
}

void __47__INUIRemoteViewController_requestCancellation__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  id v2 = a2;
  uint64_t v3 = *MEMORY[0x263F0F810];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F0F810], OS_LOG_TYPE_ERROR))
  {
    int v4 = 136315394;
    id v5 = "-[INUIRemoteViewController requestCancellation]_block_invoke";
    __int16 v6 = 2114;
    id v7 = v2;
    _os_log_error_impl(&dword_20A3EB000, v3, OS_LOG_TYPE_ERROR, "%s Unable to retrieve service view controller: %{public}@", (uint8_t *)&v4, 0x16u);
  }
}

- (void)setIdealConfiguration:(id)a3 animated:(BOOL)a4 completion:(id)a5
{
  id v7 = a3;
  uint64_t v8 = (void (**)(id, void))a5;
  if ([(INUIRemoteViewController *)self isWidgetHost])
  {
    id v9 = [(INUIRemoteViewController *)self widgetDescriptor];
    [v9 preferredSize];
    -[INUIRemoteViewController setPreferredContentSize:](self, "setPreferredContentSize:");

    v8[2](v8, 0);
  }
  else
  {
    id v10 = [v7 parameters];
    id v11 = [(INUIExtensionRequestInfo *)self->_requestInfo interaction];
    uint64_t v12 = [v7 interactiveBehavior];
    uint64_t v13 = [v7 hostedViewContext];
    v14[0] = MEMORY[0x263EF8330];
    v14[1] = 3221225472;
    v14[2] = __70__INUIRemoteViewController_setIdealConfiguration_animated_completion___block_invoke;
    v14[3] = &unk_263FD6A90;
    v14[4] = self;
    id v15 = v7;
    id v16 = v8;
    [(INUIRemoteViewController *)self configureForParameters:v10 ofInteraction:v11 interactiveBehavior:v12 context:v13 completion:v14];
  }
}

void __70__INUIRemoteViewController_setIdealConfiguration_animated_completion___block_invoke(uint64_t a1, int a2, void *a3, void *a4, double a5, double a6)
{
  id v17 = a4;
  id v11 = *(void **)(a1 + 32);
  id v12 = a3;
  objc_msgSend(v11, "setPreferredContentSize:", a5, a6);
  uint64_t v13 = *(void **)(a1 + 32);
  id v14 = -[INUIExtensionViewControllerConfiguration initWithParameters:interactiveBehavior:hostedViewContext:]([INUIExtensionViewControllerConfiguration alloc], "initWithParameters:interactiveBehavior:hostedViewContext:", v12, [*(id *)(a1 + 40) interactiveBehavior], objc_msgSend(*(id *)(a1 + 40), "hostedViewContext"));

  [v13 setConfiguration:v14];
  uint64_t v15 = *(void *)(a1 + 48);
  if (v17 || a2)
  {
    (*(void (**)(uint64_t))(v15 + 16))(v15);
  }
  else
  {
    id v16 = [MEMORY[0x263F087E8] errorWithDomain:@"INUIRemoteViewControllerErrorDomain" code:0 userInfo:0];
    (*(void (**)(uint64_t, void *))(v15 + 16))(v15, v16);
  }
}

- (void)setNeedsStateUpdate:(BOOL)a3
{
  if (self->_needsStateUpdate != a3 && a3) {
    [(INUIRemoteViewController *)self _updateExtensionContextStateWithCompletion:0];
  }
}

- (void)setDelegate:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  if (WeakRetained != v6)
  {
    objc_storeWeak((id *)&self->_delegate, v6);
    v9[0] = MEMORY[0x263EF8330];
    v9[1] = 3221225472;
    v9[2] = __51__INUIRemoteViewController_setDelegate_completion___block_invoke;
    v9[3] = &unk_263FD6A68;
    id v10 = v7;
    [(INUIRemoteViewController *)self _updateExtensionContextStateWithCompletion:v9];
  }
}

uint64_t __51__INUIRemoteViewController_setDelegate_completion___block_invoke(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(uint64_t, void))(result + 16))(result, 0);
  }
  return result;
}

- (void)setDelegate:(id)a3
{
}

- (id)disconnect
{
  [(NSExtension *)self->_activeExtension cancelExtensionRequestWithIdentifier:self->_currentRequestIdentifier];
  activeExtension = self->_activeExtension;
  self->_activeExtension = 0;

  currentRequestIdentifier = self->_currentRequestIdentifier;
  self->_currentRequestIdentifier = 0;

  v7.receiver = self;
  v7.super_class = (Class)INUIRemoteViewController;
  id v5 = [(_UIRemoteViewController *)&v7 disconnect];

  return v5;
}

- (void)viewServiceDidTerminateWithError:(id)a3
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  id v4 = a3;
  v7.receiver = self;
  v7.super_class = (Class)INUIRemoteViewController;
  [(_UIRemoteViewController *)&v7 viewServiceDidTerminateWithError:v4];
  id v5 = *MEMORY[0x263F0F810];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F0F810], OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 136315650;
    id v9 = "-[INUIRemoteViewController viewServiceDidTerminateWithError:]";
    __int16 v10 = 2114;
    id v11 = self;
    __int16 v12 = 2114;
    id v13 = v4;
    _os_log_error_impl(&dword_20A3EB000, v5, OS_LOG_TYPE_ERROR, "%s Widget remote view controller service did terminate for RVC: %{public}@ error: %{public}@", buf, 0x20u);
  }
  id v6 = [(INUIRemoteViewController *)self delegate];
  if (objc_opt_respondsToSelector()) {
    [v6 remoteViewControllerServiceDidTerminate:self];
  }
}

+ (void)requestRemoteViewControllerForInteraction:(id)a3 delegate:(id)a4 connectionHandler:(id)a5
{
  id v8 = a5;
  if (v8)
  {
    id v9 = a4;
    id v10 = a3;
    id v11 = [[INUIExtensionRequestInfo alloc] initWithInteraction:v10];

    v12[0] = MEMORY[0x263EF8330];
    v12[1] = 3221225472;
    v12[2] = __97__INUIRemoteViewController_requestRemoteViewControllerForInteraction_delegate_connectionHandler___block_invoke;
    v12[3] = &unk_263FD6BF0;
    id v13 = v8;
    [a1 _requestRemoteViewControllerWithRequestInfo:v11 delegate:v9 reply:v12];
  }
}

uint64_t __97__INUIRemoteViewController_requestRemoteViewControllerForInteraction_delegate_connectionHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

+ (void)_getWidgetHostingRemoteViewControllerWithIntent:(id)a3 descriptor:(id)a4 completionHandler:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  id v9 = (void (**)(id, INUIRemoteViewController *, void))a5;
  id v10 = objc_alloc_init(INUIRemoteViewController);
  [(INUIRemoteViewController *)v10 setWidgetHost:1];
  [(INUIRemoteViewController *)v10 setWidgetDescriptor:v8];
  id v11 = objc_alloc(MEMORY[0x263F1CB60]);
  [v8 preferredSize];
  double v13 = v12;
  [v8 preferredSize];
  uint64_t v15 = objc_msgSend(v11, "initWithFrame:", 0.0, 0.0, v13, v14);
  [(INUIRemoteViewController *)v10 setView:v15];

  uint64_t v16 = [v8 preferredSizeClass];
  if ((unint64_t)(v16 - 1) >= 4) {
    uint64_t v17 = 0;
  }
  else {
    uint64_t v17 = v16;
  }
  uint64_t v40 = 0;
  char v41 = &v40;
  uint64_t v42 = 0x2050000000;
  uint64_t v18 = (void *)getCHSWidgetClass_softClass;
  uint64_t v43 = getCHSWidgetClass_softClass;
  if (!getCHSWidgetClass_softClass)
  {
    uint64_t v35 = MEMORY[0x263EF8330];
    uint64_t v36 = 3221225472;
    v37 = __getCHSWidgetClass_block_invoke;
    id v38 = &unk_263FD6D30;
    v39 = &v40;
    __getCHSWidgetClass_block_invoke((uint64_t)&v35);
    uint64_t v18 = (void *)v41[3];
  }
  id v19 = v18;
  _Block_object_dispose(&v40, 8);
  id v20 = [v19 alloc];
  char v21 = [v8 extensionBundleIdentifier];
  v22 = [v8 kind];
  v23 = (void *)[v20 initWithExtensionBundleIdentifier:v21 containerBundleIdentifier:0 kind:v22 family:v17 intent:v7];

  uint64_t v40 = 0;
  char v41 = &v40;
  uint64_t v42 = 0x2050000000;
  v24 = (void *)getCHSWidgetMetricsClass_softClass;
  uint64_t v43 = getCHSWidgetMetricsClass_softClass;
  if (!getCHSWidgetMetricsClass_softClass)
  {
    uint64_t v35 = MEMORY[0x263EF8330];
    uint64_t v36 = 3221225472;
    v37 = __getCHSWidgetMetricsClass_block_invoke;
    id v38 = &unk_263FD6D30;
    v39 = &v40;
    __getCHSWidgetMetricsClass_block_invoke((uint64_t)&v35);
    v24 = (void *)v41[3];
  }
  v25 = v24;
  _Block_object_dispose(&v40, 8);
  id v26 = [v25 alloc];
  [v8 preferredSize];
  v27 = objc_msgSend(v26, "initWithSize:cornerRadius:");
  uint64_t v40 = 0;
  char v41 = &v40;
  uint64_t v42 = 0x2050000000;
  v28 = (void *)getCHUISAvocadoHostViewControllerClass_softClass;
  uint64_t v43 = getCHUISAvocadoHostViewControllerClass_softClass;
  if (!getCHUISAvocadoHostViewControllerClass_softClass)
  {
    uint64_t v35 = MEMORY[0x263EF8330];
    uint64_t v36 = 3221225472;
    v37 = __getCHUISAvocadoHostViewControllerClass_block_invoke;
    id v38 = &unk_263FD6D30;
    v39 = &v40;
    __getCHUISAvocadoHostViewControllerClass_block_invoke((uint64_t)&v35);
    v28 = (void *)v41[3];
  }
  v29 = v28;
  _Block_object_dispose(&v40, 8);
  id v30 = (void *)[[v29 alloc] initWithWidget:v23 metrics:v27 widgetConfigurationIdentifier:0];
  [(INUIRemoteViewController *)v10 addChildViewController:v30];
  id v31 = [v30 view];
  v32 = [(INUIRemoteViewController *)v10 view];
  [v32 bounds];
  objc_msgSend(v31, "setFrame:");

  long long v33 = [(INUIRemoteViewController *)v10 view];
  long long v34 = [v30 view];
  [v33 addSubview:v34];

  [v30 didMoveToParentViewController:v10];
  v9[2](v9, v10, 0);
}

+ (void)_getWidgetHostingRemoteViewControllerWithIntent:(id)a3 extensionMatchingError:(id)a4 completionHandler:(id)a5
{
  uint64_t v31 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  id v10 = (void (**)(id, void, id))a5;
  if ([v8 _type] != 2
    || ([v8 _codableDescription],
        id v11 = objc_claimAutoreleasedReturnValue(),
        char v12 = [v11 isEligibleForWidgets],
        v11,
        (v12 & 1) == 0))
  {
    uint64_t v18 = *MEMORY[0x263F0F810];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F0F810], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315650;
      id v26 = "+[INUIRemoteViewController _getWidgetHostingRemoteViewControllerWithIntent:extensionMatchingError:completionHandler:]";
      __int16 v27 = 2112;
      id v28 = v8;
      __int16 v29 = 2114;
      id v30 = v9;
      id v19 = "%s Error matching extensions for intent: %@ error: %{public}@";
      goto LABEL_15;
    }
LABEL_10:
    v10[2](v10, 0, v9);
    goto LABEL_11;
  }
  double v13 = [MEMORY[0x263F100F0] sharedProvider];
  id v14 = [v13 descriptorForIntent:v8];

  if (!v14 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {

    uint64_t v18 = *MEMORY[0x263F0F810];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F0F810], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315650;
      id v26 = "+[INUIRemoteViewController _getWidgetHostingRemoteViewControllerWithIntent:extensionMatchingError:completionHandler:]";
      __int16 v27 = 2112;
      id v28 = v8;
      __int16 v29 = 2114;
      id v30 = v9;
      id v19 = "%s Error matching widget extensions for intent: %@ error: %{public}@";
LABEL_15:
      _os_log_error_impl(&dword_20A3EB000, v18, OS_LOG_TYPE_ERROR, v19, buf, 0x20u);
      goto LABEL_10;
    }
    goto LABEL_10;
  }
  if ([v14 preferredSizeClass] > 1)
  {
    v20[0] = MEMORY[0x263EF8330];
    v20[1] = 3221225472;
    v20[2] = __117__INUIRemoteViewController__getWidgetHostingRemoteViewControllerWithIntent_extensionMatchingError_completionHandler___block_invoke;
    v20[3] = &unk_263FD6BA0;
    id v24 = a1;
    id v21 = v8;
    id v22 = v14;
    v23 = v10;
    id v14 = v14;
    dispatch_async(MEMORY[0x263EF83A0], v20);
  }
  else
  {
    uint64_t v15 = (void *)*MEMORY[0x263F0F810];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F0F810], OS_LOG_TYPE_INFO))
    {
      uint64_t v16 = v15;
      uint64_t v17 = [v14 extensionBundleIdentifier];
      *(_DWORD *)buf = 136315394;
      id v26 = "+[INUIRemoteViewController _getWidgetHostingRemoteViewControllerWithIntent:extensionMatchingError:completionHandler:]";
      __int16 v27 = 2112;
      id v28 = v17;
      _os_log_impl(&dword_20A3EB000, v16, OS_LOG_TYPE_INFO, "%s %@ extension is not able to render medium or large size classes", buf, 0x16u);
    }
    v10[2](v10, 0, v9);
  }

LABEL_11:
}

uint64_t __117__INUIRemoteViewController__getWidgetHostingRemoteViewControllerWithIntent_extensionMatchingError_completionHandler___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 56) _getWidgetHostingRemoteViewControllerWithIntent:*(void *)(a1 + 32) descriptor:*(void *)(a1 + 40) completionHandler:*(void *)(a1 + 48)];
}

+ (void)_attemptToConnectToRemoteViewControllerForRemainingExtensions:(id)a3 delegate:(id)a4 connectionHandler:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if (v10)
  {
    id v11 = [v8 firstObject];
    char v12 = v11;
    if (v11)
    {
      v19[0] = MEMORY[0x263EF8330];
      v19[1] = 3221225472;
      v19[2] = __117__INUIRemoteViewController__attemptToConnectToRemoteViewControllerForRemainingExtensions_delegate_connectionHandler___block_invoke;
      v19[3] = &unk_263FD6B50;
      id v13 = v11;
      id v20 = v13;
      id v23 = v10;
      id v21 = v9;
      id v14 = v8;
      id v22 = v14;
      id v24 = a1;
      uint64_t v15 = (void *)MEMORY[0x210519BD0](v19);
      [v14 removeObject:v13];
      v17[0] = MEMORY[0x263EF8330];
      v17[1] = 3221225472;
      v17[2] = __117__INUIRemoteViewController__attemptToConnectToRemoteViewControllerForRemainingExtensions_delegate_connectionHandler___block_invoke_40;
      v17[3] = &unk_263FD6B78;
      id v18 = v15;
      id v16 = v15;
      [v13 instantiateViewControllerWithInputItems:0 connectionHandler:v17];
    }
    else
    {
      (*((void (**)(id, void, void))v10 + 2))(v10, 0, 0);
    }
  }
}

void __117__INUIRemoteViewController__attemptToConnectToRemoteViewControllerForRemainingExtensions_delegate_connectionHandler___block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  uint64_t v35 = *MEMORY[0x263EF8340];
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  if (v9)
  {
    id v10 = *MEMORY[0x263F0F810];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F0F810], OS_LOG_TYPE_ERROR))
    {
      id v20 = *(void **)(a1 + 32);
      *(_DWORD *)buf = 136315650;
      id v30 = "+[INUIRemoteViewController _attemptToConnectToRemoteViewControllerForRemainingExtensions:delegate:connection"
            "Handler:]_block_invoke";
      __int16 v31 = 2114;
      id v32 = v20;
      __int16 v33 = 2114;
      id v34 = v9;
      _os_log_error_impl(&dword_20A3EB000, v10, OS_LOG_TYPE_ERROR, "%s Error instantiating remote view controller for extension: %{public}@ error: %{public}@", buf, 0x20u);
    }
    id v11 = *(void (**)(void))(*(void *)(a1 + 56) + 16);
LABEL_16:
    v11();
    id v16 = 0;
    goto LABEL_17;
  }
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();
  id v13 = *MEMORY[0x263F0F810];
  if ((isKindOfClass & 1) == 0)
  {
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F0F810], OS_LOG_TYPE_ERROR))
    {
      id v21 = v13;
      id v22 = objc_opt_class();
      id v23 = *(void **)(a1 + 32);
      *(_DWORD *)buf = 136315650;
      id v30 = "+[INUIRemoteViewController _attemptToConnectToRemoteViewControllerForRemainingExtensions:delegate:connection"
            "Handler:]_block_invoke_2";
      __int16 v31 = 2114;
      id v32 = v22;
      __int16 v33 = 2114;
      id v34 = v23;
      id v24 = v22;
      _os_log_error_impl(&dword_20A3EB000, v21, OS_LOG_TYPE_ERROR, "%s Remote view controller is of unexpected class: %{public}@ for extension: %{public}@", buf, 0x20u);
    }
    id v11 = *(void (**)(void))(*(void *)(a1 + 56) + 16);
    goto LABEL_16;
  }
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F0F810], OS_LOG_TYPE_INFO))
  {
    id v14 = *(void **)(a1 + 32);
    *(_DWORD *)buf = 136315650;
    id v30 = "+[INUIRemoteViewController _attemptToConnectToRemoteViewControllerForRemainingExtensions:delegate:connectionHa"
          "ndler:]_block_invoke";
    __int16 v31 = 2112;
    id v32 = v8;
    __int16 v33 = 2112;
    id v34 = v14;
    _os_log_impl(&dword_20A3EB000, v13, OS_LOG_TYPE_INFO, "%s Instantiated remote view controller: %@ for extension: %@", buf, 0x20u);
  }
  uint64_t v15 = (id *)v8;
  id v16 = v15;
  uint64_t v17 = *(void **)(a1 + 40);
  if (v17) {
    objc_storeWeak(v15 + 189, v17);
  }
  [v16 setActiveExtension:*(void *)(a1 + 32)];
  [v16 setCurrentRequestIdentifier:v7];
  id v18 = [*(id *)(a1 + 32) _extensionContextForUUID:v7];
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0
    && ([v16 setExtensionHostContext:v18],
        [v16 extensionHostContext],
        id v19 = objc_claimAutoreleasedReturnValue(),
        [v19 setExtensionHostContextDelegate:v16],
        v19,
        *(void *)(a1 + 40)))
  {
    v25[0] = MEMORY[0x263EF8330];
    v25[1] = 3221225472;
    void v25[2] = __117__INUIRemoteViewController__attemptToConnectToRemoteViewControllerForRemainingExtensions_delegate_connectionHandler___block_invoke_37;
    v25[3] = &unk_263FD6B28;
    id v28 = *(id *)(a1 + 56);
    id v26 = v16;
    id v27 = 0;
    [v26 _updateExtensionContextStateWithCompletion:v25];
  }
  else
  {
    (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
  }

LABEL_17:
  if ([*(id *)(a1 + 48) count]) {
    [*(id *)(a1 + 64) _attemptToConnectToRemoteViewControllerForRemainingExtensions:*(void *)(a1 + 48) delegate:*(void *)(a1 + 40) connectionHandler:*(void *)(a1 + 56)];
  }
}

uint64_t __117__INUIRemoteViewController__attemptToConnectToRemoteViewControllerForRemainingExtensions_delegate_connectionHandler___block_invoke_40(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __117__INUIRemoteViewController__attemptToConnectToRemoteViewControllerForRemainingExtensions_delegate_connectionHandler___block_invoke_37(void *a1)
{
  return (*(uint64_t (**)(void, void, void))(a1[6] + 16))(a1[6], a1[4], a1[5]);
}

+ (void)_requestRemoteViewControllerWithRequestInfo:(id)a3 delegate:(id)a4 reply:(id)a5
{
  v32[1] = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  id v10 = (void (**)(id, void, void *))a5;
  id v11 = [v8 interaction];
  char v12 = [v11 intent];

  id v13 = [v12 identifier];

  if (v13)
  {
    if (v12) {
      goto LABEL_3;
    }
LABEL_7:
    id v19 = (void *)MEMORY[0x263F087E8];
    uint64_t v31 = *MEMORY[0x263F07F80];
    v32[0] = @"No valid input intent for remote view controller";
    id v20 = [NSDictionary dictionaryWithObjects:v32 forKeys:&v31 count:1];
    id v21 = [v19 errorWithDomain:@"INUIRemoteViewControllerErrorDomain" code:0 userInfo:v20];
    v10[2](v10, 0, v21);

    goto LABEL_10;
  }
  uint64_t v17 = [MEMORY[0x263F08C38] UUID];
  id v18 = [v17 UUIDString];
  [v12 setIdentifier:v18];

  if (!v12) {
    goto LABEL_7;
  }
LABEL_3:
  uint64_t v22 = MEMORY[0x263EF8330];
  uint64_t v23 = 3221225472;
  id v24 = __87__INUIRemoteViewController__requestRemoteViewControllerWithRequestInfo_delegate_reply___block_invoke;
  v25 = &unk_263FD6AD8;
  id v14 = v12;
  id v26 = v14;
  __int16 v29 = v10;
  id v30 = a1;
  id v27 = v9;
  id v15 = v8;
  id v28 = v15;
  id v16 = (void *)MEMORY[0x210519BD0](&v22);
  if (objc_msgSend(v15, "requiresUserConsent", v22, v23, v24, v25) && objc_msgSend(v14, "_type") != 2) {
    objc_msgSend(MEMORY[0x263F08800], "_intents_matchSiriUIExtensionsForIntent:completion:", v14, v16);
  }
  else {
    objc_msgSend(MEMORY[0x263F08800], "_intents_matchUIExtensionsForIntent:completion:", v14, v16);
  }

  id v20 = v26;
LABEL_10:
}

void __87__INUIRemoteViewController__requestRemoteViewControllerWithRequestInfo_delegate_reply___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  if (v6)
  {
    if (_os_feature_enabled_impl())
    {
      [*(id *)(a1 + 64) _getWidgetHostingRemoteViewControllerWithIntent:*(void *)(a1 + 32) extensionMatchingError:v6 completionHandler:*(void *)(a1 + 56)];
    }
    else
    {
      id v14 = *MEMORY[0x263F0F810];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x263F0F810], OS_LOG_TYPE_ERROR))
      {
        uint64_t v15 = *(void *)(a1 + 32);
        *(_DWORD *)buf = 136315650;
        *(void *)&uint8_t buf[4] = "+[INUIRemoteViewController _requestRemoteViewControllerWithRequestInfo:delegate:reply:]_block_invoke";
        *(_WORD *)&buf[12] = 2112;
        *(void *)&buf[14] = v15;
        *(_WORD *)&buf[22] = 2114;
        id v21 = v6;
        _os_log_error_impl(&dword_20A3EB000, v14, OS_LOG_TYPE_ERROR, "%s Error matching extensions for intent: %@ error: %{public}@", buf, 0x20u);
      }
      (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
    }
  }
  else
  {
    id v7 = (void *)*MEMORY[0x263F0F810];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F0F810], OS_LOG_TYPE_INFO))
    {
      id v8 = v7;
      uint64_t v9 = [v5 count];
      id v10 = *(void **)(a1 + 32);
      *(_DWORD *)buf = 136315650;
      *(void *)&uint8_t buf[4] = "+[INUIRemoteViewController _requestRemoteViewControllerWithRequestInfo:delegate:reply:]_block_invoke";
      *(_WORD *)&buf[12] = 2048;
      *(void *)&buf[14] = v9;
      *(_WORD *)&buf[22] = 2112;
      id v21 = v10;
      _os_log_impl(&dword_20A3EB000, v8, OS_LOG_TYPE_INFO, "%s Found %zd extensions for intent: %@", buf, 0x20u);
    }
    *(void *)buf = 0;
    *(void *)&buf[8] = buf;
    *(void *)&buf[16] = 0x2020000000;
    LOBYTE(v21) = 0;
    id v11 = *(void **)(a1 + 64);
    char v12 = (void *)[v5 mutableCopy];
    v16[0] = MEMORY[0x263EF8330];
    v16[1] = 3221225472;
    v16[2] = __87__INUIRemoteViewController__requestRemoteViewControllerWithRequestInfo_delegate_reply___block_invoke_33;
    v16[3] = &unk_263FD6B00;
    uint64_t v13 = *(void *)(a1 + 40);
    id v17 = *(id *)(a1 + 48);
    id v19 = buf;
    id v18 = *(id *)(a1 + 56);
    [v11 _attemptToConnectToRemoteViewControllerForRemainingExtensions:v12 delegate:v13 connectionHandler:v16];

    _Block_object_dispose(buf, 8);
  }
}

void __87__INUIRemoteViewController__requestRemoteViewControllerWithRequestInfo_delegate_reply___block_invoke_33(void *a1, void *a2, void *a3)
{
  id v7 = a2;
  id v5 = a3;
  [v7 _setRequestInfo:a1[4]];
  uint64_t v6 = *(void *)(a1[6] + 8);
  if (!*(unsigned char *)(v6 + 24))
  {
    *(unsigned char *)(v6 + 24) = 1;
    (*(void (**)(void))(a1[5] + 16))();
  }
}

+ (void)_requestRemoteViewControllerForSnippetExtensionInteraction:(id)a3 delegate:(id)a4 connectionHandler:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if (v10)
  {
    id v11 = [v8 _snippet];
    if (v11)
    {
      char v12 = (void *)MEMORY[0x263F08800];
      v14[0] = MEMORY[0x263EF8330];
      v14[1] = 3221225472;
      v14[2] = __114__INUIRemoteViewController__requestRemoteViewControllerForSnippetExtensionInteraction_delegate_connectionHandler___block_invoke;
      v14[3] = &unk_263FD6AD8;
      id v15 = v8;
      id v18 = v10;
      id v19 = a1;
      id v16 = v11;
      id v17 = v9;
      objc_msgSend(v12, "_intents_matchSiriUISnippetExtensionsWithCompletion:", v14);
    }
    else
    {
      uint64_t v13 = [MEMORY[0x263F087E8] errorWithDomain:@"_INUIRemoteViewControllerErrorDomain" code:1 userInfo:0];
      (*((void (**)(id, void, void *))v10 + 2))(v10, 0, v13);
    }
  }
}

void __114__INUIRemoteViewController__requestRemoteViewControllerForSnippetExtensionInteraction_delegate_connectionHandler___block_invoke(void *a1, void *a2, void *a3)
{
  uint64_t v27 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  id v7 = *MEMORY[0x263F0F810];
  if (v6)
  {
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F0F810], OS_LOG_TYPE_ERROR))
    {
      uint64_t v20 = a1[4];
      *(_DWORD *)buf = 136315650;
      uint64_t v22 = "+[INUIRemoteViewController _requestRemoteViewControllerForSnippetExtensionInteraction:delegate:connectionHan"
            "dler:]_block_invoke";
      __int16 v23 = 2112;
      uint64_t v24 = v20;
      __int16 v25 = 2114;
      id v26 = v6;
      _os_log_error_impl(&dword_20A3EB000, v7, OS_LOG_TYPE_ERROR, "%s Error matching extensions for interaction: %@ error: %{public}@", buf, 0x20u);
    }
    (*(void (**)(void))(a1[7] + 16))();
  }
  else
  {
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F0F810], OS_LOG_TYPE_INFO))
    {
      id v8 = v7;
      uint64_t v9 = [v5 count];
      id v10 = (void *)a1[4];
      *(_DWORD *)buf = 136315650;
      uint64_t v22 = "+[INUIRemoteViewController _requestRemoteViewControllerForSnippetExtensionInteraction:delegate:connectionHan"
            "dler:]_block_invoke";
      __int16 v23 = 2048;
      uint64_t v24 = v9;
      __int16 v25 = 2112;
      id v26 = v10;
      _os_log_impl(&dword_20A3EB000, v8, OS_LOG_TYPE_INFO, "%s Found %zd extensions for interaction: %@", buf, 0x20u);
    }
    id v11 = (void *)MEMORY[0x263F08A98];
    char v12 = (objc_class *)objc_opt_class();
    uint64_t v13 = NSStringFromClass(v12);
    id v14 = [v11 predicateWithFormat:@"(attributes[%@] CONTAINS[c] %@)", @"SAUISnippetSubclassNames", v13];
    id v15 = [v5 filteredArrayUsingPredicate:v14];

    if ([v15 count])
    {
      id v16 = v15;
    }
    else
    {
      uint64_t v17 = [MEMORY[0x263F08A98] predicateWithFormat:@"(attributes[%@] == nil)", @"SAUISnippetSubclassNames"];
      id v16 = [v5 filteredArrayUsingPredicate:v17];

      id v5 = (id)v17;
    }

    id v18 = (void *)a1[8];
    id v19 = (void *)[v16 mutableCopy];
    [v18 _attemptToConnectToRemoteViewControllerForRemainingExtensions:v19 delegate:a1[6] connectionHandler:a1[7]];

    id v5 = v16;
  }
}

+ (void)requestRemoteViewControllerWithRequestInfo:(id)a3 reply:(id)a4
{
}

@end