@interface CNContactViewExtensionContext
+ (id)_extensionAuxiliaryHostProtocol;
+ (id)_extensionAuxiliaryVendorProtocol;
- (BOOL)asyncShouldPerformResponse;
- (BOOL)shouldPerformDefaultActionForContact:(id)a3 propertyKey:(id)a4 propertyIdentifier:(id)a5;
- (OS_dispatch_semaphore)asyncShouldPerformSemaphore;
- (id)host;
- (void)asyncShouldPerformDefaultActionForContact:(id)a3 propertyKey:(id)a4 propertyIdentifier:(id)a5;
- (void)asyncShouldPerformDefaultActionResponse:(BOOL)a3;
- (void)didChangePreferredContentSize:(CGSize)a3;
- (void)didChangeToEditMode:(BOOL)a3;
- (void)didChangeToShowTitle:(BOOL)a3;
- (void)didCompleteWithContact:(id)a3;
- (void)didDeleteContact:(id)a3;
- (void)didExecuteClearRecentsDataAction;
- (void)didExecuteDeleteFromDowntimeWhitelistAction;
- (void)editCancel;
- (void)isPresentingEditingController:(BOOL)a3;
- (void)isPresentingFullscreen:(BOOL)a3;
- (void)performConfirmedCancel;
- (void)presentCancelConfirmationAlert;
- (void)setAsyncShouldPerformResponse:(BOOL)a3;
- (void)setAsyncShouldPerformSemaphore:(id)a3;
- (void)setupWithOptions:(id)a3 readyBlock:(id)a4;
- (void)toggleEditing;
- (void)updateEditing:(BOOL)a3 doneButtonEnabled:(BOOL)a4 doneButtonText:(id)a5;
- (void)viewDidAppear;
@end

@implementation CNContactViewExtensionContext

+ (id)_extensionAuxiliaryHostProtocol
{
  if (_extensionAuxiliaryHostProtocol_onceToken != -1) {
    dispatch_once(&_extensionAuxiliaryHostProtocol_onceToken, &__block_literal_global_109);
  }
  v2 = (void *)_extensionAuxiliaryHostProtocol___interface;

  return v2;
}

void __64__CNContactViewExtensionContext__extensionAuxiliaryHostProtocol__block_invoke()
{
  uint64_t v0 = [MEMORY[0x1E4F29280] interfaceWithProtocol:&unk_1ED9319D8];
  v1 = (void *)_extensionAuxiliaryHostProtocol___interface;
  _extensionAuxiliaryHostProtocol___interface = v0;
}

+ (id)_extensionAuxiliaryVendorProtocol
{
  if (_extensionAuxiliaryVendorProtocol_onceToken != -1) {
    dispatch_once(&_extensionAuxiliaryVendorProtocol_onceToken, &__block_literal_global_56);
  }
  v2 = (void *)_extensionAuxiliaryVendorProtocol___interface;

  return v2;
}

void __66__CNContactViewExtensionContext__extensionAuxiliaryVendorProtocol__block_invoke()
{
  uint64_t v0 = [MEMORY[0x1E4F29280] interfaceWithProtocol:&unk_1ED9F0EA0];
  v1 = (void *)_extensionAuxiliaryVendorProtocol___interface;
  _extensionAuxiliaryVendorProtocol___interface = v0;

  v13 = (void *)MEMORY[0x1E4F1CAD0];
  v15 = (void *)_extensionAuxiliaryVendorProtocol___interface;
  uint64_t v12 = objc_opt_class();
  uint64_t v2 = objc_opt_class();
  uint64_t v3 = objc_opt_class();
  uint64_t v4 = objc_opt_class();
  uint64_t v5 = objc_opt_class();
  uint64_t v6 = objc_opt_class();
  uint64_t v7 = objc_opt_class();
  uint64_t v8 = objc_opt_class();
  uint64_t v9 = objc_opt_class();
  uint64_t v10 = objc_opt_class();
  uint64_t v11 = objc_opt_class();
  v14 = objc_msgSend(v13, "setWithObjects:", v12, v2, v3, v4, v5, v6, v7, v8, v9, v10, v11, objc_opt_class(), 0);
  [v15 setClasses:v14 forSelector:sel_setupWithOptions_readyBlock_ argumentIndex:0 ofReply:0];
}

- (void).cxx_destruct
{
}

- (void)setAsyncShouldPerformSemaphore:(id)a3
{
}

- (OS_dispatch_semaphore)asyncShouldPerformSemaphore
{
  return self->_asyncShouldPerformSemaphore;
}

- (void)setAsyncShouldPerformResponse:(BOOL)a3
{
  self->_asyncShouldPerformResponse = a3;
}

- (BOOL)asyncShouldPerformResponse
{
  return self->_asyncShouldPerformResponse;
}

- (void)asyncShouldPerformDefaultActionForContact:(id)a3 propertyKey:(id)a4 propertyIdentifier:(id)a5
{
  uint64_t v5 = CNUILogViewService();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)uint64_t v6 = 0;
    _os_log_error_impl(&dword_18B625000, v5, OS_LOG_TYPE_ERROR, "Out of process [CNContactViewExtensionContext asyncShouldPerformDefaultActionForContact] should not be invoked.", v6, 2u);
  }
}

- (void)presentCancelConfirmationAlert
{
  id v2 = [(CNContactViewExtensionContext *)self host];
  [v2 presentCancelConfirmationAlert];
}

- (void)didExecuteDeleteFromDowntimeWhitelistAction
{
  id v2 = [(CNContactViewExtensionContext *)self host];
  [v2 didExecuteDeleteFromDowntimeWhitelistAction];
}

- (void)didExecuteClearRecentsDataAction
{
  id v2 = [(CNContactViewExtensionContext *)self host];
  [v2 didExecuteClearRecentsDataAction];
}

- (void)viewDidAppear
{
  id v2 = [(CNContactViewExtensionContext *)self host];
  [v2 viewDidAppear];
}

- (void)didChangePreferredContentSize:(CGSize)a3
{
  double height = a3.height;
  double width = a3.width;
  id v5 = [(CNContactViewExtensionContext *)self host];
  objc_msgSend(v5, "didChangePreferredContentSize:", width, height);
}

- (void)isPresentingEditingController:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = [(CNContactViewExtensionContext *)self host];
  [v4 isPresentingEditingController:v3];
}

- (void)isPresentingFullscreen:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = [(CNContactViewExtensionContext *)self host];
  [v4 isPresentingFullscreen:v3];
}

- (void)didDeleteContact:(id)a3
{
  id v4 = a3;
  id v5 = [(CNContactViewExtensionContext *)self host];
  [v5 didDeleteContact:v4];
}

- (void)didCompleteWithContact:(id)a3
{
  id v4 = a3;
  id v5 = [(CNContactViewExtensionContext *)self host];
  [v5 didCompleteWithContact:v4];
}

- (void)updateEditing:(BOOL)a3 doneButtonEnabled:(BOOL)a4 doneButtonText:(id)a5
{
  BOOL v5 = a4;
  BOOL v6 = a3;
  id v8 = a5;
  id v9 = [(CNContactViewExtensionContext *)self host];
  [v9 updateEditing:v6 doneButtonEnabled:v5 doneButtonText:v8];
}

- (BOOL)shouldPerformDefaultActionForContact:(id)a3 propertyKey:(id)a4 propertyIdentifier:(id)a5
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  dispatch_semaphore_t v11 = dispatch_semaphore_create(0);
  [(CNContactViewExtensionContext *)self setAsyncShouldPerformSemaphore:v11];

  [(CNContactViewExtensionContext *)self setAsyncShouldPerformResponse:1];
  uint64_t v12 = [(CNContactViewExtensionContext *)self host];
  [v12 asyncShouldPerformDefaultActionForContact:v10 propertyKey:v9 propertyIdentifier:v8];

  v13 = [(CNContactViewExtensionContext *)self asyncShouldPerformSemaphore];

  if (v13)
  {
    v14 = [MEMORY[0x1E4F5A3D8] currentEnvironment];
    uint64_t v15 = [v14 timeProvider];
    [(id)v15 timestamp];
    double v17 = v16;

    v18 = [(CNContactViewExtensionContext *)self asyncShouldPerformSemaphore];
    LOBYTE(v15) = CNDispatchSemaphoreWait();

    if ((v15 & 1) == 0)
    {
      v24 = CNUILogViewService();
      if (os_log_type_enabled(v24, OS_LOG_TYPE_FAULT))
      {
        LOWORD(v27) = 0;
        _os_log_fault_impl(&dword_18B625000, v24, OS_LOG_TYPE_FAULT, "OOP [CNContactViewExtensionContext shouldPerformDefaultActionForContact:propertyKey:propertyIdentifier:] call timed out", (uint8_t *)&v27, 2u);
      }
      goto LABEL_8;
    }
    v19 = [MEMORY[0x1E4F5A3D8] currentEnvironment];
    v20 = [v19 timeProvider];
    [v20 timestamp];
    double v22 = v21;

    double v23 = v22 - v17;
    if (v23 > 0.1)
    {
      v24 = CNUILogViewService();
      if (os_log_type_enabled(v24, OS_LOG_TYPE_FAULT))
      {
        v25 = [MEMORY[0x1E4F5A530] stringForTimeInterval:v23];
        int v27 = 138412290;
        v28 = v25;
        _os_log_fault_impl(&dword_18B625000, v24, OS_LOG_TYPE_FAULT, "OOP [CNContactViewExtensionContext shouldPerformDefaultActionForContact:propertyKey:propertyIdentifier:] call took longer than desired: %@", (uint8_t *)&v27, 0xCu);
      }
LABEL_8:
    }
  }
  return [(CNContactViewExtensionContext *)self asyncShouldPerformResponse];
}

- (void)asyncShouldPerformDefaultActionResponse:(BOOL)a3
{
  [(CNContactViewExtensionContext *)self setAsyncShouldPerformResponse:a3];
  id v4 = [(CNContactViewExtensionContext *)self asyncShouldPerformSemaphore];

  if (v4)
  {
    BOOL v5 = [(CNContactViewExtensionContext *)self asyncShouldPerformSemaphore];
    dispatch_semaphore_signal(v5);
  }
}

- (void)performConfirmedCancel
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __55__CNContactViewExtensionContext_performConfirmedCancel__block_invoke;
  block[3] = &unk_1E549B488;
  block[4] = self;
  dispatch_async(MEMORY[0x1E4F14428], block);
}

void __55__CNContactViewExtensionContext_performConfirmedCancel__block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) _principalObject];
  v1 = [v2 contactContentVC];
  [v1 performConfirmedCancel];
}

- (void)toggleEditing
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __46__CNContactViewExtensionContext_toggleEditing__block_invoke;
  block[3] = &unk_1E549B488;
  block[4] = self;
  dispatch_async(MEMORY[0x1E4F14428], block);
}

void __46__CNContactViewExtensionContext_toggleEditing__block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) _principalObject];
  v1 = [v2 contactContentVC];
  [v1 toggleEditing];
}

- (void)editCancel
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __43__CNContactViewExtensionContext_editCancel__block_invoke;
  block[3] = &unk_1E549B488;
  block[4] = self;
  dispatch_async(MEMORY[0x1E4F14428], block);
}

void __43__CNContactViewExtensionContext_editCancel__block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) _principalObject];
  v1 = [v2 contactContentVC];
  [v1 editCancel];
}

- (void)didChangeToShowTitle:(BOOL)a3
{
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __54__CNContactViewExtensionContext_didChangeToShowTitle___block_invoke;
  v3[3] = &unk_1E5499510;
  v3[4] = self;
  BOOL v4 = a3;
  dispatch_async(MEMORY[0x1E4F14428], v3);
}

void __54__CNContactViewExtensionContext_didChangeToShowTitle___block_invoke(uint64_t a1)
{
  id v3 = [*(id *)(a1 + 32) _principalObject];
  id v2 = [v3 contactContentVC];
  [v2 didChangeToShowTitle:*(unsigned __int8 *)(a1 + 40)];
}

- (void)didChangeToEditMode:(BOOL)a3
{
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __53__CNContactViewExtensionContext_didChangeToEditMode___block_invoke;
  v3[3] = &unk_1E5499510;
  v3[4] = self;
  BOOL v4 = a3;
  dispatch_async(MEMORY[0x1E4F14428], v3);
}

void __53__CNContactViewExtensionContext_didChangeToEditMode___block_invoke(uint64_t a1)
{
  id v3 = [*(id *)(a1 + 32) _principalObject];
  id v2 = [v3 contactContentVC];
  [v2 didChangeToEditMode:*(unsigned __int8 *)(a1 + 40)];
}

- (void)setupWithOptions:(id)a3 readyBlock:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __61__CNContactViewExtensionContext_setupWithOptions_readyBlock___block_invoke;
  block[3] = &unk_1E549AFF8;
  block[4] = self;
  id v11 = v6;
  id v12 = v7;
  id v8 = v7;
  id v9 = v6;
  dispatch_async(MEMORY[0x1E4F14428], block);
}

void __61__CNContactViewExtensionContext_setupWithOptions_readyBlock___block_invoke(uint64_t a1)
{
  long long v16 = 0u;
  long long v17 = 0u;
  id v2 = [*(id *)(a1 + 32) _auxiliaryConnection];
  id v3 = v2;
  if (v2)
  {
    [v2 auditToken];
  }
  else
  {
    long long v16 = 0u;
    long long v17 = 0u;
  }

  long long v14 = v16;
  long long v15 = v17;
  BOOL v4 = [MEMORY[0x1E4F5A340] auditToken:&v14];
  BOOL v5 = (void *)[objc_alloc(MEMORY[0x1E4F5A350]) initWithAuditToken:v4 assumedIdentity:0];
  id v6 = +[CNUIContactsEnvironment currentEnvironment];
  [v6 setAuthorizationContext:v5];

  id v7 = objc_alloc(MEMORY[0x1E4F5A440]);
  id v8 = [MEMORY[0x1E4F5A448] sharedConnection];
  long long v14 = v16;
  long long v15 = v17;
  id v9 = (void *)[v7 initWithAuditToken:&v14 managedProfileConnection:v8];

  id v10 = [*(id *)(a1 + 32) _principalObject];
  id v11 = [v10 contactContentVC];
  [v11 setManagedConfiguration:v9];

  id v12 = [*(id *)(a1 + 32) _principalObject];
  v13 = [v12 contactContentVC];
  [v13 setupWithOptions:*(void *)(a1 + 40) readyBlock:*(void *)(a1 + 48)];
}

- (id)host
{
  BOOL v4 = [(CNContactViewExtensionContext *)self _auxiliaryConnection];
  BOOL v5 = [v4 remoteObjectProxyWithErrorHandler:&__block_literal_global_116];

  if (!v5)
  {
    id v7 = [MEMORY[0x1E4F28B00] currentHandler];
    [v7 handleFailureInMethod:a2 object:self file:@"CNContactViewServiceViewController.m" lineNumber:193 description:@"host object is nil!"];
  }

  return v5;
}

void __37__CNContactViewExtensionContext_host__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  id v2 = a2;
  id v3 = CNUILogViewService();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
  {
    BOOL v4 = [v2 localizedDescription];
    int v5 = 138412290;
    id v6 = v4;
    _os_log_error_impl(&dword_18B625000, v3, OS_LOG_TYPE_ERROR, "error calling host - %@", (uint8_t *)&v5, 0xCu);
  }
}

@end