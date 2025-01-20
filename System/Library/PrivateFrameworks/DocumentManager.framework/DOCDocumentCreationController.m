@interface DOCDocumentCreationController
- (BOOL)handlesDidRequestDocumentCreation;
- (BOOL)hasCreationHandlerWithRequiredMethods;
- (BOOL)hasCreationHandlerWithoutValidatingMethodRequirements;
- (NSString)activeDocumentCreationIntent;
- (UIDocumentBrowserViewController)browserViewController;
- (id)initForBrowserViewController:(id)a3;
- (id)landingPresenter;
- (id)underylingHandler;
- (unint64_t)underlyingHandlerType;
- (void)_sendDidBeginToLandingPresenter;
- (void)_sendDidEndToLandingPresenterWithImportedURL:(id)a3 canceled:(BOOL)a4 error:(id)a5;
- (void)didDenyCreateDocumentSessionWithError:(id)a3;
- (void)didEndSessionWithImportedURL:(id)a3 canceled:(BOOL)a4 error:(id)a5;
- (void)performDidImportDocumentAtURL:(id)a3 toDestinationURL:(id)a4;
- (void)performDidRequestDocumentCreationWithHandler:(id)a3;
- (void)performFailedToImportDocumentAtURL:(id)a3 error:(id)a4;
- (void)setActiveDocumentCreationIntent:(id)a3;
- (void)warnIfNoValidCreationHandler;
- (void)willBeginSession;
@end

@implementation DOCDocumentCreationController

- (id)initForBrowserViewController:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)DOCDocumentCreationController;
  v5 = [(DOCDocumentCreationController *)&v9 init];
  v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->_browserViewController, v4);
    activeDocumentCreationIntent = v6->_activeDocumentCreationIntent;
    v6->_activeDocumentCreationIntent = 0;
  }
  return v6;
}

- (void)warnIfNoValidCreationHandler
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  v3 = a1;
  NSStringFromSelector(a2);
  objc_claimAutoreleasedReturnValue();
  id v4 = (Protocol *)OUTLINED_FUNCTION_6();
  v5 = NSStringFromProtocol(v4);
  int v6 = 138543874;
  v7 = a2;
  __int16 v8 = 2114;
  objc_super v9 = v5;
  __int16 v10 = 2114;
  v11 = @"allowsDocumentCreation";
  _os_log_error_impl(&dword_21361D000, v3, OS_LOG_TYPE_ERROR, "Warning: You must implement %{public}@ in the %{public}@ if %{public}@ is set to YES.", (uint8_t *)&v6, 0x20u);
}

- (BOOL)hasCreationHandlerWithRequiredMethods
{
  return [(DOCDocumentCreationController *)self underlyingHandlerType] != 0;
}

- (BOOL)hasCreationHandlerWithoutValidatingMethodRequirements
{
  p_browserViewController = &self->_browserViewController;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_browserViewController);
  id v4 = [WeakRetained delegate];
  if (v4)
  {
    BOOL v5 = 1;
  }
  else
  {
    id v6 = objc_loadWeakRetained((id *)p_browserViewController);
    v7 = [v6 documentLandingPresenter];
    BOOL v5 = v7 != 0;
  }
  return v5;
}

- (unint64_t)underlyingHandlerType
{
  p_browserViewController = &self->_browserViewController;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_browserViewController);
  id v4 = [WeakRetained delegate];

  if (v4 && (objc_opt_respondsToSelector() & 1) != 0)
  {
    unint64_t v5 = 1;
  }
  else
  {
    id v6 = objc_loadWeakRetained((id *)p_browserViewController);
    v7 = [v6 documentLandingPresenter];

    if ([v7 conformsToProtocol:&unk_26C4357A8]) {
      unint64_t v5 = 2;
    }
    else {
      unint64_t v5 = 0;
    }
    id v4 = v7;
  }

  return v5;
}

- (void)willBeginSession
{
  if (!self->_hasActiveSession) {
    [(DOCDocumentCreationController *)self _sendDidBeginToLandingPresenter];
  }
}

- (void)didEndSessionWithImportedURL:(id)a3 canceled:(BOOL)a4 error:(id)a5
{
  if (self->_hasActiveSession) {
    [(DOCDocumentCreationController *)self _sendDidEndToLandingPresenterWithImportedURL:a3 canceled:a4 error:a5];
  }
}

- (void)didDenyCreateDocumentSessionWithError:(id)a3
{
  id v4 = a3;
  if (self->_hasActiveSession)
  {
    unint64_t v5 = (NSObject **)MEMORY[0x263F3AC28];
    id v6 = *MEMORY[0x263F3AC28];
    if (!*MEMORY[0x263F3AC28])
    {
      DOCInitLogging();
      id v6 = *v5;
    }
    if (os_log_type_enabled(v6, OS_LOG_TYPE_FAULT)) {
      -[DOCDocumentCreationController didDenyCreateDocumentSessionWithError:]();
    }
  }
  else
  {
    [(DOCDocumentCreationController *)self _sendDidBeginToLandingPresenter];
    [(DOCDocumentCreationController *)self _sendDidEndToLandingPresenterWithImportedURL:0 canceled:1 error:v4];
  }
}

- (void)_sendDidBeginToLandingPresenter
{
  uint64_t v2 = *MEMORY[0x263EF8340];
  OUTLINED_FUNCTION_5();
  _os_log_fault_impl(&dword_21361D000, v0, OS_LOG_TYPE_FAULT, "Failed to send 'willStart' - bad landingPresenter: %@", v1, 0xCu);
}

- (void)_sendDidEndToLandingPresenterWithImportedURL:(id)a3 canceled:(BOOL)a4 error:(id)a5
{
  BOOL v6 = a4;
  id v8 = a3;
  id v9 = a5;
  self->_hasActiveSession = 0;
  __int16 v10 = (NSObject **)MEMORY[0x263F3AC08];
  v11 = *MEMORY[0x263F3AC08];
  if (!*MEMORY[0x263F3AC08])
  {
    DOCInitLogging();
    v11 = *v10;
  }
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v16 = 0;
    _os_log_impl(&dword_21361D000, v11, OS_LOG_TYPE_DEFAULT, "Sending 'didEnd' to landingPresenter", v16, 2u);
  }
  uint64_t v12 = [(DOCDocumentCreationController *)self browserViewController];
  v13 = [v12 documentLandingPresenter];
  if ([v13 conformsToProtocol:&unk_26C4357A8])
  {
    [v13 documentLandingBrowserDidEndDocumentCreation:v12 importedURL:v8 canceled:v6 error:v9];
  }
  else if (v13)
  {
    v14 = *v10;
    if (!*v10)
    {
      DOCInitLogging();
      v14 = *v10;
    }
    if (os_log_type_enabled(v14, OS_LOG_TYPE_FAULT)) {
      -[DOCDocumentCreationController _sendDidEndToLandingPresenterWithImportedURL:canceled:error:]();
    }
  }
  if (!self->_hasActiveSession)
  {
    activeDocumentCreationIntent = self->_activeDocumentCreationIntent;
    self->_activeDocumentCreationIntent = 0;
  }
}

- (BOOL)handlesDidRequestDocumentCreation
{
  unint64_t v3 = [(DOCDocumentCreationController *)self underlyingHandlerType];
  if (v3 == 1 || v3 == 2)
  {
    id v4 = [(DOCDocumentCreationController *)self underylingHandler];
    char v5 = objc_opt_respondsToSelector();
  }
  else
  {
    char v5 = 0;
  }
  return v5 & 1;
}

- (void)performDidRequestDocumentCreationWithHandler:(id)a3
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  id v4 = a3;
  [(DOCDocumentCreationController *)self willBeginSession];
  char v5 = [(DOCDocumentCreationController *)self underylingHandler];
  BOOL v6 = (NSObject **)MEMORY[0x263F3AC08];
  v7 = *MEMORY[0x263F3AC08];
  if (!*MEMORY[0x263F3AC08])
  {
    DOCInitLogging();
    v7 = *v6;
  }
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    int v11 = 138412290;
    uint64_t v12 = v5;
    _os_log_impl(&dword_21361D000, v7, OS_LOG_TYPE_DEFAULT, "Sending 'document creation request' to creationHandler: %@", (uint8_t *)&v11, 0xCu);
  }
  unint64_t v8 = [(DOCDocumentCreationController *)self underlyingHandlerType];
  if (v8)
  {
    if (v8 == 2)
    {
      id WeakRetained = objc_loadWeakRetained((id *)&self->_browserViewController);
      [v5 documentLandingBrowser:WeakRetained didRequestDocumentCreationWithHandler:v4];
      goto LABEL_14;
    }
    if (v8 == 1)
    {
      id WeakRetained = objc_loadWeakRetained((id *)&self->_browserViewController);
      [v5 documentBrowser:WeakRetained didRequestDocumentCreationWithHandler:v4];
LABEL_14:
    }
  }
  else
  {
    __int16 v10 = *v6;
    if (!*v6)
    {
      DOCInitLogging();
      __int16 v10 = *v6;
    }
    if (os_log_type_enabled(v10, OS_LOG_TYPE_FAULT)) {
      -[DOCDocumentCreationController performDidRequestDocumentCreationWithHandler:]();
    }
  }
}

- (void)performDidImportDocumentAtURL:(id)a3 toDestinationURL:(id)a4
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  unint64_t v8 = [(DOCDocumentCreationController *)self underylingHandler];
  if (objc_opt_respondsToSelector())
  {
    id v9 = (NSObject **)MEMORY[0x263F3AC08];
    __int16 v10 = *MEMORY[0x263F3AC08];
    if (!*MEMORY[0x263F3AC08])
    {
      DOCInitLogging();
      __int16 v10 = *v9;
    }
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      int v14 = 138412290;
      v15 = v8;
      _os_log_impl(&dword_21361D000, v10, OS_LOG_TYPE_DEFAULT, "Sending 'did import' to creationHandler: %@", (uint8_t *)&v14, 0xCu);
    }
    id WeakRetained = objc_loadWeakRetained((id *)&self->_browserViewController);
    [v8 documentBrowser:WeakRetained didImportDocumentAtURL:v6 toDestinationURL:v7];
LABEL_13:

    goto LABEL_14;
  }
  if (objc_opt_respondsToSelector())
  {
    uint64_t v12 = *MEMORY[0x263F3AC08];
    if (!*MEMORY[0x263F3AC08])
    {
      uint64_t v13 = (NSObject **)MEMORY[0x263F3AC08];
      DOCInitLogging();
      uint64_t v12 = *v13;
    }
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      int v14 = 138412290;
      v15 = v8;
      _os_log_impl(&dword_21361D000, v12, OS_LOG_TYPE_DEFAULT, "Sending 'did import' to landingPresenter: %@", (uint8_t *)&v14, 0xCu);
    }
    id WeakRetained = objc_loadWeakRetained((id *)&self->_browserViewController);
    [v8 documentLandingBrowser:WeakRetained didImportDocumentAtURL:v6 toDestinationURL:v7];
    goto LABEL_13;
  }
LABEL_14:
  [(DOCDocumentCreationController *)self didEndSessionWithImportedURL:v7 canceled:0 error:0];
}

- (void)performFailedToImportDocumentAtURL:(id)a3 error:(id)a4
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  unint64_t v8 = [(DOCDocumentCreationController *)self underylingHandler];
  if (objc_opt_respondsToSelector())
  {
    id v9 = (NSObject **)MEMORY[0x263F3AC08];
    __int16 v10 = *MEMORY[0x263F3AC08];
    if (!*MEMORY[0x263F3AC08])
    {
      DOCInitLogging();
      __int16 v10 = *v9;
    }
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      int v14 = 138412290;
      v15 = v8;
      _os_log_impl(&dword_21361D000, v10, OS_LOG_TYPE_DEFAULT, "Sending 'failed to import' to creationHandler: %@", (uint8_t *)&v14, 0xCu);
    }
    id WeakRetained = objc_loadWeakRetained((id *)&self->_browserViewController);
    [v8 documentBrowser:WeakRetained failedToImportDocumentAtURL:v6 error:v7];
LABEL_13:

    goto LABEL_14;
  }
  if (objc_opt_respondsToSelector())
  {
    uint64_t v12 = *MEMORY[0x263F3AC08];
    if (!*MEMORY[0x263F3AC08])
    {
      uint64_t v13 = (NSObject **)MEMORY[0x263F3AC08];
      DOCInitLogging();
      uint64_t v12 = *v13;
    }
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      int v14 = 138412290;
      v15 = v8;
      _os_log_impl(&dword_21361D000, v12, OS_LOG_TYPE_DEFAULT, "Sending 'failed to import' to landingPresenter: %@", (uint8_t *)&v14, 0xCu);
    }
    id WeakRetained = objc_loadWeakRetained((id *)&self->_browserViewController);
    [v8 documentLandingBrowser:WeakRetained failedToImportDocumentAtURL:v6 error:v7];
    goto LABEL_13;
  }
LABEL_14:
  [(DOCDocumentCreationController *)self didEndSessionWithImportedURL:0 canceled:0 error:v7];
}

- (id)landingPresenter
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_browserViewController);
  unint64_t v3 = [WeakRetained documentLandingPresenter];

  if ([v3 conformsToProtocol:&unk_26C4357A8]) {
    id v4 = v3;
  }
  else {
    id v4 = 0;
  }

  return v4;
}

- (id)underylingHandler
{
  unint64_t v3 = [(DOCDocumentCreationController *)self underlyingHandlerType];
  if (v3 == 2)
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_browserViewController);
    uint64_t v5 = [WeakRetained documentLandingPresenter];
    goto LABEL_5;
  }
  if (v3 == 1)
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_browserViewController);
    uint64_t v5 = [WeakRetained delegate];
LABEL_5:
    id v6 = (void *)v5;

    goto LABEL_7;
  }
  id v6 = 0;
LABEL_7:
  return v6;
}

- (UIDocumentBrowserViewController)browserViewController
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_browserViewController);
  return (UIDocumentBrowserViewController *)WeakRetained;
}

- (NSString)activeDocumentCreationIntent
{
  return self->_activeDocumentCreationIntent;
}

- (void)setActiveDocumentCreationIntent:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_activeDocumentCreationIntent, 0);
  objc_destroyWeak((id *)&self->_browserViewController);
}

- (void)didDenyCreateDocumentSessionWithError:.cold.1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_4(&dword_21361D000, v0, v1, "Unexpected condition.  Session denied, but found one active", v2, v3, v4, v5, v6);
}

- (void)_sendDidEndToLandingPresenterWithImportedURL:canceled:error:.cold.1()
{
  uint64_t v2 = *MEMORY[0x263EF8340];
  OUTLINED_FUNCTION_5();
  _os_log_fault_impl(&dword_21361D000, v0, OS_LOG_TYPE_FAULT, "Failed to send 'didEnd' - bad landingPresenter: %@", v1, 0xCu);
}

- (void)performDidRequestDocumentCreationWithHandler:.cold.1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_4(&dword_21361D000, v0, v1, "Failed to send 'document creation request' - creationHandler is 'None'", v2, v3, v4, v5, v6);
}

@end