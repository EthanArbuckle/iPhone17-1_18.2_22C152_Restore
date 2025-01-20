@interface FALocationSharingHook
- (BOOL)shouldMatchElement:(id)a3;
- (BOOL)shouldMatchModel:(id)a3;
- (RUIServerHookDelegate)delegate;
- (id)getFamilyCircle;
- (void)_invokeLocationServicesWithServerAttributes:(id)a3 completion:(id)a4;
- (void)processElement:(id)a3 attributes:(id)a4 objectModel:(id)a5 completion:(id)a6;
- (void)processObjectModel:(id)a3 completion:(id)a4;
- (void)setDelegate:(id)a3;
@end

@implementation FALocationSharingHook

- (BOOL)shouldMatchElement:(id)a3
{
  v3 = [a3 name];
  char v4 = [v3 isEqualToString:@"family:locationSharing"];

  return v4;
}

- (BOOL)shouldMatchModel:(id)a3
{
  v3 = [a3 clientInfo];
  char v4 = [v3 objectForKeyedSubscript:*MEMORY[0x263F25C10]];
  char v5 = [v4 isEqualToString:@"family:locationSharing"];

  return v5;
}

- (void)processElement:(id)a3 attributes:(id)a4 objectModel:(id)a5 completion:(id)a6
{
}

- (void)processObjectModel:(id)a3 completion:(id)a4
{
  id v6 = a4;
  id v7 = [a3 clientInfo];
  [(FALocationSharingHook *)self _invokeLocationServicesWithServerAttributes:v7 completion:v6];
}

- (void)_invokeLocationServicesWithServerAttributes:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v13[0] = 0;
  v13[1] = v13;
  v13[2] = 0x3032000000;
  v13[3] = __Block_byref_object_copy__1;
  v13[4] = __Block_byref_object_dispose__1;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  id v14 = [WeakRetained presentationContextForHook:self];

  v9 = [(FALocationSharingHook *)self getFamilyCircle];
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __80__FALocationSharingHook__invokeLocationServicesWithServerAttributes_completion___block_invoke;
  v12[3] = &unk_264349790;
  v12[4] = v13;
  uint64_t v10 = MEMORY[0x263EF83A0];
  id v11 = MEMORY[0x263EF83A0];
  [v9 onComplete:v12 onQueue:v10];

  _Block_object_dispose(v13, 8);
}

void __80__FALocationSharingHook__invokeLocationServicesWithServerAttributes_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v9 = +[LocationViewModel createModel];
  char v4 = [[FAProfilePictureStore alloc] initWithFamilyCircle:v3];

  char v5 = +[FASwiftUIHostingControllerProvider getLocationViewControllerWithViewModel:v9 pictureStore:v4 hackfromObjC:1];
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0
    && [*(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) isDismissing])
  {
    uint64_t v6 = [*(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) hostViewController];
    uint64_t v7 = *(void *)(*(void *)(a1 + 32) + 8);
    v8 = *(void **)(v7 + 40);
    *(void *)(v7 + 40) = v6;
  }
  [*(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) showViewController:v5 sender:0];
}

- (id)getFamilyCircle
{
  v2 = (void *)[objc_alloc(MEMORY[0x263F20300]) initWithBlock:&__block_literal_global_10];
  return v2;
}

void __40__FALocationSharingHook_getFamilyCircle__block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  id v3 = objc_opt_new();
  [v3 setCachePolicy:1];
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __40__FALocationSharingHook_getFamilyCircle__block_invoke_2;
  v5[3] = &unk_2643497B8;
  id v6 = v2;
  id v4 = v2;
  [v3 startRequestWithCompletionHandler:v5];
}

uint64_t __40__FALocationSharingHook_getFamilyCircle__block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (RUIServerHookDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (RUIServerHookDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_locationSharingController, 0);
}

@end