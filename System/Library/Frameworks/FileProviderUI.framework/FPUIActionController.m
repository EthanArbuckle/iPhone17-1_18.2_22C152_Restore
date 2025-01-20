@interface FPUIActionController
+ (id)actionControllerForActionIdentifier:(id)a3 actionTitle:(id)a4 items:(id)a5 providerIdentifier:(id)a6 domainIdentifier:(id)a7;
- (FPUIActionControllerDelegate)delegate;
- (NSArray)items;
- (NSString)actionIdentifier;
- (NSString)domainIdentifier;
- (NSString)providerIdentifier;
- (id)_getExtensionWithError:(id *)a3;
- (id)performActionWithCompletionHandler:(id)a3;
- (void)_delegateDidFinishWithUserInfo:(id)a3 error:(id)a4;
- (void)_delegateError:(id)a3;
- (void)remoteActionContext:(id)a3 didEncounterError:(id)a4 completionHandler:(id)a5;
- (void)remoteActionContextDidFinishAction:(id)a3 userInfo:(id)a4 error:(id)a5;
- (void)setDelegate:(id)a3;
@end

@implementation FPUIActionController

+ (id)actionControllerForActionIdentifier:(id)a3 actionTitle:(id)a4 items:(id)a5 providerIdentifier:(id)a6 domainIdentifier:(id)a7
{
  id v10 = a7;
  id v11 = a6;
  id v12 = a5;
  id v13 = a3;
  v14 = objc_alloc_init(FPUIActionController);
  uint64_t v15 = [v11 copy];

  providerIdentifier = v14->_providerIdentifier;
  v14->_providerIdentifier = (NSString *)v15;

  uint64_t v17 = [v13 copy];
  actionIdentifier = v14->_actionIdentifier;
  v14->_actionIdentifier = (NSString *)v17;

  uint64_t v19 = [v12 copy];
  items = v14->_items;
  v14->_items = (NSArray *)v19;

  uint64_t v21 = [v10 copy];
  domainIdentifier = v14->_domainIdentifier;
  v14->_domainIdentifier = (NSString *)v21;

  return v14;
}

- (id)performActionWithCompletionHandler:(id)a3
{
  v4 = (objc_class *)MEMORY[0x263F05570];
  id v5 = a3;
  v6 = (void *)[[v4 alloc] initWithActionIdentifier:self->_actionIdentifier providerDomainID:self->_domainIdentifier itemIdentifiers:self->_items];
  [v6 setActionCompletionBlock:v5];

  v7 = [MEMORY[0x263F054C0] defaultManager];
  [v7 scheduleAction:v6];

  v8 = [v6 progress];

  return v8;
}

- (id)_getExtensionWithError:(id *)a3
{
  id v5 = (void *)MEMORY[0x263F08800];
  v6 = [(FPUIActionController *)self providerIdentifier];
  id v11 = 0;
  v7 = [v5 extensionWithIdentifier:v6 error:&v11];
  id v8 = v11;

  if (!v7)
  {
    v9 = fpuiLogHandle;
    if (!fpuiLogHandle)
    {
      FPUIInitLogging();
      v9 = fpuiLogHandle;
    }
    if (!os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      if (!a3) {
        goto LABEL_7;
      }
      goto LABEL_6;
    }
    -[FPUIActionViewController _getExtensionWithError:](v9, self);
    if (a3) {
LABEL_6:
    }
      *a3 = v8;
  }
LABEL_7:

  return v7;
}

- (void)_delegateError:(id)a3
{
}

- (void)_delegateDidFinishWithUserInfo:(id)a3 error:(id)a4
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  id v8 = fpuiLogHandle;
  if (v7)
  {
    if (!fpuiLogHandle)
    {
      FPUIInitLogging();
      id v8 = fpuiLogHandle;
    }
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      -[FPUIActionViewController _delegateDidFinishWithUserInfo:error:](v8, self);
    }
  }
  else
  {
    if (!fpuiLogHandle)
    {
      FPUIInitLogging();
      id v8 = fpuiLogHandle;
    }
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      v9 = v8;
      id v10 = [(FPUIActionController *)self actionIdentifier];
      int v15 = 138412290;
      v16 = v10;
      _os_log_impl(&dword_235BE4000, v9, OS_LOG_TYPE_INFO, "Action with identifier (%@) did finish.", (uint8_t *)&v15, 0xCu);
    }
  }
  id v11 = [(FPUIActionController *)self delegate];
  char v12 = objc_opt_respondsToSelector();

  id v13 = [(FPUIActionController *)self delegate];
  v14 = v13;
  if (v12) {
    [v13 actionControllerDidFinishAction:self userInfo:v6 error:v7];
  }
  else {
    [v13 actionControllerDidFinishAction:self error:v7];
  }
}

- (void)remoteActionContextDidFinishAction:(id)a3 userInfo:(id)a4 error:(id)a5
{
}

- (void)remoteActionContext:(id)a3 didEncounterError:(id)a4 completionHandler:(id)a5
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  id v7 = a4;
  id v8 = (void (**)(void))a5;
  v9 = [(FPUIActionController *)self delegate];
  char v10 = objc_opt_respondsToSelector();

  if (v10)
  {
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __80__FPUIActionController_remoteActionContext_didEncounterError_completionHandler___block_invoke;
    block[3] = &unk_264C6CCC0;
    block[4] = self;
    id v13 = v7;
    v14 = v8;
    dispatch_async(MEMORY[0x263EF83A0], block);
  }
  else
  {
    id v11 = fpuiLogHandle;
    if (!fpuiLogHandle)
    {
      FPUIInitLogging();
      id v11 = fpuiLogHandle;
    }
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      id v16 = v7;
      _os_log_impl(&dword_235BE4000, v11, OS_LOG_TYPE_INFO, "An error occurred on the service side, but the client won't present it: %@", buf, 0xCu);
    }
    v8[2](v8);
  }
}

void __80__FPUIActionController_remoteActionContext_didEncounterError_completionHandler___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) delegate];
  [v2 actionController:*(void *)(a1 + 32) presentError:*(void *)(a1 + 40) completion:*(void *)(a1 + 48)];
}

- (NSString)domainIdentifier
{
  return self->_domainIdentifier;
}

- (NSString)actionIdentifier
{
  return self->_actionIdentifier;
}

- (NSArray)items
{
  return self->_items;
}

- (NSString)providerIdentifier
{
  return self->_providerIdentifier;
}

- (FPUIActionControllerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (FPUIActionControllerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_providerIdentifier, 0);
  objc_storeStrong((id *)&self->_items, 0);
  objc_storeStrong((id *)&self->_actionIdentifier, 0);

  objc_storeStrong((id *)&self->_domainIdentifier, 0);
}

@end