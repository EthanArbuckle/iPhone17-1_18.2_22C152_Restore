@interface AAUIBeneficiaryClaimNotificationHook
- (BOOL)shouldMatchElement:(id)a3;
- (BOOL)shouldMatchModel:(id)a3;
- (RUIObjectModel)objectModel;
- (RUIServerHookDelegate)delegate;
- (RUIServerHookResponse)serverHookResponse;
- (void)_beneficiaryContactNameForBeneficiaryID:(id)a3 completion:(id)a4;
- (void)processElement:(id)a3 attributes:(id)a4 objectModel:(id)a5 completion:(id)a6;
- (void)processObjectModel:(id)a3 completion:(id)a4;
- (void)setDelegate:(id)a3;
- (void)setObjectModel:(id)a3;
- (void)setServerHookResponse:(id)a3;
@end

@implementation AAUIBeneficiaryClaimNotificationHook

- (BOOL)shouldMatchModel:(id)a3
{
  v3 = [a3 clientInfo];
  v4 = [v3 objectForKeyedSubscript:@"action"];
  char v5 = [v4 isEqualToString:@"beneficiary:contactName"];

  return v5;
}

- (BOOL)shouldMatchElement:(id)a3
{
  return 0;
}

- (void)processObjectModel:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v17[0] = 0;
  v17[1] = v17;
  v17[2] = 0x3032000000;
  v17[3] = __Block_byref_object_copy__4;
  v17[4] = __Block_byref_object_dispose__4;
  v8 = [v6 pages];
  id v18 = [v8 firstObject];

  v9 = [v6 clientInfo];
  v10 = [v9 objectForKeyedSubscript:@"beneficiaryUUID"];

  v13[0] = MEMORY[0x263EF8330];
  v13[1] = 3221225472;
  v13[2] = __70__AAUIBeneficiaryClaimNotificationHook_processObjectModel_completion___block_invoke;
  v13[3] = &unk_263F92CB0;
  id v11 = v7;
  id v15 = v11;
  v16 = v17;
  id v12 = v6;
  id v14 = v12;
  [(AAUIBeneficiaryClaimNotificationHook *)self _beneficiaryContactNameForBeneficiaryID:v10 completion:v13];

  _Block_object_dispose(v17, 8);
}

void __70__AAUIBeneficiaryClaimNotificationHook_processObjectModel_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if (v6)
  {
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __70__AAUIBeneficiaryClaimNotificationHook_processObjectModel_completion___block_invoke_2;
    block[3] = &unk_263F92070;
    id v7 = &v16;
    id v16 = *(id *)(a1 + 40);
    v8 = &v15;
    id v15 = v6;
    dispatch_async(MEMORY[0x263EF83A0], block);
  }
  else
  {
    v9[0] = MEMORY[0x263EF8330];
    v9[1] = 3221225472;
    v9[2] = __70__AAUIBeneficiaryClaimNotificationHook_processObjectModel_completion___block_invoke_3;
    v9[3] = &unk_263F92C88;
    uint64_t v13 = *(void *)(a1 + 48);
    id v7 = &v10;
    id v10 = v5;
    v8 = &v11;
    id v11 = *(id *)(a1 + 32);
    id v12 = *(id *)(a1 + 40);
    dispatch_async(MEMORY[0x263EF83A0], v9);
  }
}

uint64_t __70__AAUIBeneficiaryClaimNotificationHook_processObjectModel_completion___block_invoke_2(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 40);
  if (result) {
    return (*(uint64_t (**)(uint64_t, void, void))(result + 16))(result, 0, *(void *)(a1 + 32));
  }
  return result;
}

uint64_t __70__AAUIBeneficiaryClaimNotificationHook_processObjectModel_completion___block_invoke_3(uint64_t a1)
{
  v2 = [*(id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) tableViewOM];
  v3 = [v2 sections];
  v4 = [v3 firstObject];
  id v5 = [v4 headerView];
  uint64_t v6 = *(void *)(a1 + 32);
  id v7 = [*(id *)(a1 + 40) clientInfo];
  v8 = [v7 objectForKeyedSubscript:@"targetQuery"];
  [v5 setHTMLContent:v6 toElementsMatchingQuery:v8];

  uint64_t result = *(void *)(a1 + 48);
  if (result)
  {
    id v10 = *(uint64_t (**)(void))(result + 16);
    return v10();
  }
  return result;
}

- (void)processElement:(id)a3 attributes:(id)a4 objectModel:(id)a5 completion:(id)a6
{
}

- (void)_beneficiaryContactNameForBeneficiaryID:(id)a3 completion:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  id v7 = objc_alloc_init(MEMORY[0x263F25888]);
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __91__AAUIBeneficiaryClaimNotificationHook__beneficiaryContactNameForBeneficiaryID_completion___block_invoke;
  v10[3] = &unk_263F92D00;
  id v11 = v5;
  id v12 = v6;
  id v8 = v5;
  id v9 = v6;
  [v7 fetchBeneficiariesWithCompletion:v10];
}

void __91__AAUIBeneficiaryClaimNotificationHook__beneficiaryContactNameForBeneficiaryID_completion___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v5 = a2;
  if (a3)
  {
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
  else
  {
    id v6 = (void *)MEMORY[0x263F08A98];
    v15[0] = MEMORY[0x263EF8330];
    v15[1] = 3221225472;
    v15[2] = __91__AAUIBeneficiaryClaimNotificationHook__beneficiaryContactNameForBeneficiaryID_completion___block_invoke_2;
    v15[3] = &unk_263F92CD8;
    id v16 = *(id *)(a1 + 32);
    id v7 = [v6 predicateWithBlock:v15];
    id v8 = [v5 filteredArrayUsingPredicate:v7];

    id v9 = [v8 firstObject];
    id v10 = (void *)MEMORY[0x263F258F8];
    id v11 = [v9 handle];
    id v12 = [v10 contactInfoForHandle:v11];

    uint64_t v13 = *(void *)(a1 + 40);
    id v14 = [v12 fullName];
    (*(void (**)(uint64_t, void *, void))(v13 + 16))(v13, v14, 0);
  }
}

uint64_t __91__AAUIBeneficiaryClaimNotificationHook__beneficiaryContactNameForBeneficiaryID_completion___block_invoke_2(uint64_t a1, void *a2)
{
  v3 = [a2 beneficiaryID];
  v4 = [v3 UUIDString];
  uint64_t v5 = [v4 isEqualToString:*(void *)(a1 + 32)];

  return v5;
}

- (RUIObjectModel)objectModel
{
  return self->_objectModel;
}

- (void)setObjectModel:(id)a3
{
}

- (RUIServerHookDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (RUIServerHookDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (RUIServerHookResponse)serverHookResponse
{
  return self->_serverHookResponse;
}

- (void)setServerHookResponse:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_serverHookResponse, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_objectModel, 0);
}

@end