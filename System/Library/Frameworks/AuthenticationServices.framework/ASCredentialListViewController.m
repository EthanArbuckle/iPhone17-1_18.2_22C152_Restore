@interface ASCredentialListViewController
@end

@implementation ASCredentialListViewController

void __90___ASCredentialListViewController_initWithExtension_serviceIdentifiers_requestParameters___block_invoke(uint64_t a1)
{
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __90___ASCredentialListViewController_initWithExtension_serviceIdentifiers_requestParameters___block_invoke_2;
  block[3] = &unk_264395360;
  objc_copyWeak(&v2, (id *)(a1 + 32));
  dispatch_async(MEMORY[0x263EF83A0], block);
  objc_destroyWeak(&v2);
}

void __90___ASCredentialListViewController_initWithExtension_serviceIdentifiers_requestParameters___block_invoke_2(uint64_t a1)
{
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v3 = WeakRetained;
    id v2 = objc_loadWeakRetained(WeakRetained + 128);
    if (objc_opt_respondsToSelector()) {
      [v2 credentialListViewControllerDidPrepareInterface:v3];
    }

    WeakRetained = v3;
  }
}

uint64_t __90___ASCredentialListViewController_initWithExtension_serviceIdentifiers_requestParameters___block_invoke_3(void *a1, void *a2)
{
  uint64_t v3 = a1[4];
  uint64_t v2 = a1[5];
  uint64_t v4 = a1[6];
  if (v3) {
    return [a2 prepareCredentialListForServiceIdentifiers:v2 requestParameters:v3 completionHandler:v4];
  }
  else {
    return [a2 prepareCredentialListForServiceIdentifiers:v2 completionHandler:v4];
  }
}

void __90___ASCredentialListViewController_initWithExtension_serviceIdentifiers_requestParameters___block_invoke_4(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v1 = [WeakRetained extension];
  [v1 _kill:9];
}

void __97___ASCredentialListViewController_initOneTimeCodeCredentialListWithExtension_serviceIdentifiers___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = *(void *)(a1 + 32);
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __97___ASCredentialListViewController_initOneTimeCodeCredentialListWithExtension_serviceIdentifiers___block_invoke_2;
  v5[3] = &unk_264395360;
  objc_copyWeak(&v6, (id *)(a1 + 40));
  [v3 prepareOneTimeCodeCredentialListForServiceIdentifiers:v4 completionHandler:v5];
  objc_destroyWeak(&v6);
}

void __97___ASCredentialListViewController_initOneTimeCodeCredentialListWithExtension_serviceIdentifiers___block_invoke_2(uint64_t a1)
{
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __97___ASCredentialListViewController_initOneTimeCodeCredentialListWithExtension_serviceIdentifiers___block_invoke_3;
  block[3] = &unk_264395360;
  objc_copyWeak(&v2, (id *)(a1 + 32));
  dispatch_async(MEMORY[0x263EF83A0], block);
  objc_destroyWeak(&v2);
}

void __97___ASCredentialListViewController_initOneTimeCodeCredentialListWithExtension_serviceIdentifiers___block_invoke_3(uint64_t a1)
{
  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  id v3 = WeakRetained;
  if (WeakRetained) {
    id v2 = objc_loadWeakRetained(WeakRetained + 128);
  }
  else {
    id v2 = 0;
  }
  if (objc_opt_respondsToSelector()) {
    [v2 credentialListViewControllerDidPrepareInterface:v3];
  }
}

void __97___ASCredentialListViewController_initOneTimeCodeCredentialListWithExtension_serviceIdentifiers___block_invoke_4(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v1 = [WeakRetained extension];
  [v1 _kill:9];
}

uint64_t __88___ASCredentialListViewController_initForTextSelectingWithExtension_serviceIdentifiers___block_invoke(uint64_t a1, void *a2)
{
  return [a2 prepareInterfaceForUserChoosingTextToInsert];
}

void __88___ASCredentialListViewController_initForTextSelectingWithExtension_serviceIdentifiers___block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v1 = [WeakRetained extension];
  [v1 _kill:9];
}

uint64_t __97___ASCredentialListViewController_prepareToCompleteRequestWithHostContext_credential_completion___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _finishWithCredential:*(void *)(a1 + 40) completion:*(void *)(a1 + 48)];
}

uint64_t __100___ASCredentialListViewController_prepareToCompleteSelectionRequestWithHostContext_text_completion___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) credentialListViewController:*(void *)(a1 + 40) didFinishWithText:*(void *)(a1 + 48) completion:*(void *)(a1 + 56)];
}

@end