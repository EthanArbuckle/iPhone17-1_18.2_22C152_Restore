@interface CNContactViewExtensionHostContext
+ (id)_extensionAuxiliaryHostProtocol;
+ (id)_extensionAuxiliaryVendorProtocol;
- (BOOL)shouldPerformDefaultActionForContact:(id)a3 propertyKey:(id)a4 propertyIdentifier:(id)a5;
- (CNContactViewHostViewController)viewController;
- (id)protocolService;
- (void)asyncShouldPerformDefaultActionForContact:(id)a3 propertyKey:(id)a4 propertyIdentifier:(id)a5;
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
- (void)setViewController:(id)a3;
- (void)setupWithOptions:(id)a3 readyBlock:(id)a4;
- (void)toggleEditing;
- (void)updateEditing:(BOOL)a3 doneButtonEnabled:(BOOL)a4 doneButtonText:(id)a5;
- (void)viewDidAppear;
@end

@implementation CNContactViewExtensionHostContext

+ (id)_extensionAuxiliaryHostProtocol
{
  return +[CNContactViewExtensionContext _extensionAuxiliaryHostProtocol];
}

+ (id)_extensionAuxiliaryVendorProtocol
{
  return +[CNContactViewExtensionContext _extensionAuxiliaryVendorProtocol];
}

- (void).cxx_destruct
{
}

- (void)setViewController:(id)a3
{
}

- (CNContactViewHostViewController)viewController
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_viewController);

  return (CNContactViewHostViewController *)WeakRetained;
}

- (void)asyncShouldPerformDefaultActionForContact:(id)a3 propertyKey:(id)a4 propertyIdentifier:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __110__CNContactViewExtensionHostContext_asyncShouldPerformDefaultActionForContact_propertyKey_propertyIdentifier___block_invoke;
  v14[3] = &unk_1E549BB80;
  v14[4] = self;
  id v15 = v8;
  id v16 = v9;
  id v17 = v10;
  id v11 = v10;
  id v12 = v9;
  id v13 = v8;
  dispatch_async(MEMORY[0x1E4F14428], v14);
}

void __110__CNContactViewExtensionHostContext_asyncShouldPerformDefaultActionForContact_propertyKey_propertyIdentifier___block_invoke(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) viewController];
  uint64_t v3 = [v2 shouldPerformDefaultActionForContact:*(void *)(a1 + 40) propertyKey:*(void *)(a1 + 48) propertyIdentifier:*(void *)(a1 + 56)];

  id v4 = [*(id *)(a1 + 32) protocolService];
  [v4 asyncShouldPerformDefaultActionResponse:v3];
}

- (void)presentCancelConfirmationAlert
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __67__CNContactViewExtensionHostContext_presentCancelConfirmationAlert__block_invoke;
  block[3] = &unk_1E549B488;
  block[4] = self;
  dispatch_async(MEMORY[0x1E4F14428], block);
}

void __67__CNContactViewExtensionHostContext_presentCancelConfirmationAlert__block_invoke(uint64_t a1)
{
  id v1 = [*(id *)(a1 + 32) viewController];
  [v1 presentCancelConfirmationAlert];
}

- (void)didExecuteDeleteFromDowntimeWhitelistAction
{
  uint64_t v3 = [MEMORY[0x1E4F5A4E8] mainThreadScheduler];
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __80__CNContactViewExtensionHostContext_didExecuteDeleteFromDowntimeWhitelistAction__block_invoke;
  v4[3] = &unk_1E549B488;
  v4[4] = self;
  [v3 performBlock:v4];
}

void __80__CNContactViewExtensionHostContext_didExecuteDeleteFromDowntimeWhitelistAction__block_invoke(uint64_t a1)
{
  id v1 = [*(id *)(a1 + 32) viewController];
  [v1 didExecuteDeleteFromDowntimeWhitelistAction];
}

- (void)didExecuteClearRecentsDataAction
{
  uint64_t v3 = [MEMORY[0x1E4F5A4E8] mainThreadScheduler];
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __69__CNContactViewExtensionHostContext_didExecuteClearRecentsDataAction__block_invoke;
  v4[3] = &unk_1E549B488;
  v4[4] = self;
  [v3 performBlock:v4];
}

void __69__CNContactViewExtensionHostContext_didExecuteClearRecentsDataAction__block_invoke(uint64_t a1)
{
  id v1 = [*(id *)(a1 + 32) viewController];
  [v1 didExecuteClearRecentsDataAction];
}

- (void)viewDidAppear
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __50__CNContactViewExtensionHostContext_viewDidAppear__block_invoke;
  block[3] = &unk_1E549B488;
  block[4] = self;
  dispatch_async(MEMORY[0x1E4F14428], block);
}

void __50__CNContactViewExtensionHostContext_viewDidAppear__block_invoke(uint64_t a1)
{
  id v1 = [*(id *)(a1 + 32) viewController];
  [v1 viewDidAppear];
}

- (void)didChangePreferredContentSize:(CGSize)a3
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __67__CNContactViewExtensionHostContext_didChangePreferredContentSize___block_invoke;
  block[3] = &unk_1E549A968;
  block[4] = self;
  CGSize v4 = a3;
  dispatch_async(MEMORY[0x1E4F14428], block);
}

void __67__CNContactViewExtensionHostContext_didChangePreferredContentSize___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) viewController];
  objc_msgSend(v2, "didChangePreferredContentSize:", *(double *)(a1 + 40), *(double *)(a1 + 48));
}

- (void)isPresentingEditingController:(BOOL)a3
{
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __67__CNContactViewExtensionHostContext_isPresentingEditingController___block_invoke;
  v3[3] = &unk_1E5499510;
  v3[4] = self;
  BOOL v4 = a3;
  dispatch_async(MEMORY[0x1E4F14428], v3);
}

void __67__CNContactViewExtensionHostContext_isPresentingEditingController___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) viewController];
  [v2 isPresentingEditingController:*(unsigned __int8 *)(a1 + 40)];
}

- (void)isPresentingFullscreen:(BOOL)a3
{
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __60__CNContactViewExtensionHostContext_isPresentingFullscreen___block_invoke;
  v3[3] = &unk_1E5499510;
  v3[4] = self;
  BOOL v4 = a3;
  dispatch_async(MEMORY[0x1E4F14428], v3);
}

void __60__CNContactViewExtensionHostContext_isPresentingFullscreen___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) viewController];
  [v2 isPresentingFullscreen:*(unsigned __int8 *)(a1 + 40)];
}

- (void)didDeleteContact:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __54__CNContactViewExtensionHostContext_didDeleteContact___block_invoke;
  v6[3] = &unk_1E549BF80;
  v6[4] = self;
  id v7 = v4;
  id v5 = v4;
  dispatch_async(MEMORY[0x1E4F14428], v6);
}

void __54__CNContactViewExtensionHostContext_didDeleteContact___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) viewController];
  [v2 didDeleteContact:*(void *)(a1 + 40)];
}

- (void)didCompleteWithContact:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __60__CNContactViewExtensionHostContext_didCompleteWithContact___block_invoke;
  v6[3] = &unk_1E549BF80;
  v6[4] = self;
  id v7 = v4;
  id v5 = v4;
  dispatch_async(MEMORY[0x1E4F14428], v6);
}

void __60__CNContactViewExtensionHostContext_didCompleteWithContact___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) viewController];
  [v2 didCompleteWithContact:*(void *)(a1 + 40)];
}

- (void)updateEditing:(BOOL)a3 doneButtonEnabled:(BOOL)a4 doneButtonText:(id)a5
{
  id v8 = a5;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __84__CNContactViewExtensionHostContext_updateEditing_doneButtonEnabled_doneButtonText___block_invoke;
  block[3] = &unk_1E5497EF0;
  BOOL v12 = a3;
  BOOL v13 = a4;
  block[4] = self;
  id v11 = v8;
  id v9 = v8;
  dispatch_async(MEMORY[0x1E4F14428], block);
}

void __84__CNContactViewExtensionHostContext_updateEditing_doneButtonEnabled_doneButtonText___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) viewController];
  [v2 updateEditing:*(unsigned __int8 *)(a1 + 48) doneButtonEnabled:*(unsigned __int8 *)(a1 + 49) doneButtonText:*(void *)(a1 + 40)];
}

- (BOOL)shouldPerformDefaultActionForContact:(id)a3 propertyKey:(id)a4 propertyIdentifier:(id)a5
{
  _CNUILog((uint64_t)"/Library/Caches/com.apple.xbs/Sources/ContactsUI/Framework/CNContactViewHostViewController.m", 294, 3, @"Out of process [CNContactViewExtensionHostContextshouldPerformDefaultActionForContact] should not be invoked.", (uint64_t)a5, v5, v6, v7, vars0);
  return 1;
}

- (void)didChangeToShowTitle:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = [(CNContactViewExtensionHostContext *)self protocolService];
  [v4 didChangeToShowTitle:v3];
}

- (void)performConfirmedCancel
{
  id v2 = [(CNContactViewExtensionHostContext *)self protocolService];
  [v2 performConfirmedCancel];
}

- (void)toggleEditing
{
  id v2 = [(CNContactViewExtensionHostContext *)self protocolService];
  [v2 toggleEditing];
}

- (void)editCancel
{
  id v2 = [(CNContactViewExtensionHostContext *)self protocolService];
  [v2 editCancel];
}

- (void)didChangeToEditMode:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = [(CNContactViewExtensionHostContext *)self protocolService];
  [v4 didChangeToEditMode:v3];
}

- (void)setupWithOptions:(id)a3 readyBlock:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(CNContactViewExtensionHostContext *)self protocolService];
  [v8 setupWithOptions:v7 readyBlock:v6];
}

- (id)protocolService
{
  id v4 = [(CNContactViewExtensionHostContext *)self _auxiliaryConnection];
  uint64_t v5 = [v4 remoteObjectProxyWithErrorHandler:&__block_literal_global_147];

  if (!v5)
  {
    id v7 = [MEMORY[0x1E4F28B00] currentHandler];
    [v7 handleFailureInMethod:a2 object:self file:@"CNContactViewHostViewController.m" lineNumber:252 description:@"service object is nil!"];
  }

  return v5;
}

void __52__CNContactViewExtensionHostContext_protocolService__block_invoke(uint64_t a1, void *a2)
{
  id v6 = [a2 localizedDescription];
  _CNUILog((uint64_t)"/Library/Caches/com.apple.xbs/Sources/ContactsUI/Framework/CNContactViewHostViewController.m", 250, 3, @"error calling service - %@", v2, v3, v4, v5, (uint64_t)v6);
}

@end