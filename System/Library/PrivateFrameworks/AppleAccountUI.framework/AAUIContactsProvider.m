@interface AAUIContactsProvider
- (AAUIContactsProvider)init;
- (void)_fetchImageDataForLocalContact:(id)a3 ofSize:(double)a4 withCompletion:(id)a5;
- (void)_fetchImagesForContacts:(id)a3 ofSize:(double)a4 completion:(id)a5;
- (void)_fetchServerImageDataFor:(id)a3 WithCompletion:(id)a4;
- (void)fetchSuggestedBeneficiariesWithImagesOfSize:(double)a3 andCompletion:(id)a4;
- (void)fetchSuggestedCustodiansWithImagesOfSize:(double)a3 andCompletion:(id)a4;
@end

@implementation AAUIContactsProvider

- (AAUIContactsProvider)init
{
  v6.receiver = self;
  v6.super_class = (Class)AAUIContactsProvider;
  v2 = [(AAContactsProvider *)&v6 init];
  if (v2)
  {
    uint64_t v3 = objc_opt_new();
    contactsManager = v2->_contactsManager;
    v2->_contactsManager = (AAContactsManager *)v3;
  }
  return v2;
}

- (void)fetchSuggestedCustodiansWithImagesOfSize:(double)a3 andCompletion:(id)a4
{
  id v6 = a4;
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __79__AAUIContactsProvider_fetchSuggestedCustodiansWithImagesOfSize_andCompletion___block_invoke;
  v9[3] = &unk_263F93E30;
  double v11 = a3;
  v9[4] = self;
  id v10 = v6;
  v8.receiver = self;
  v8.super_class = (Class)AAUIContactsProvider;
  id v7 = v6;
  [(AAContactsProvider *)&v8 fetchSuggestedCustodians:v9];
}

uint64_t __79__AAUIContactsProvider_fetchSuggestedCustodiansWithImagesOfSize_andCompletion___block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) _fetchImagesForContacts:a2 ofSize:*(void *)(a1 + 40) completion:*(double *)(a1 + 48)];
}

- (void)fetchSuggestedBeneficiariesWithImagesOfSize:(double)a3 andCompletion:(id)a4
{
  id v6 = a4;
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __82__AAUIContactsProvider_fetchSuggestedBeneficiariesWithImagesOfSize_andCompletion___block_invoke;
  v9[3] = &unk_263F93E30;
  double v11 = a3;
  v9[4] = self;
  id v10 = v6;
  v8.receiver = self;
  v8.super_class = (Class)AAUIContactsProvider;
  id v7 = v6;
  [(AAContactsProvider *)&v8 fetchSuggestedBeneficiaries:v9];
}

uint64_t __82__AAUIContactsProvider_fetchSuggestedBeneficiariesWithImagesOfSize_andCompletion___block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) _fetchImagesForContacts:a2 ofSize:*(void *)(a1 + 40) completion:*(double *)(a1 + 48)];
}

- (void)_fetchImagesForContacts:(id)a3 ofSize:(double)a4 completion:(id)a5
{
  uint64_t v31 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v20 = a5;
  v9 = dispatch_group_create();
  long long v26 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  id v10 = v8;
  uint64_t v11 = [v10 countByEnumeratingWithState:&v26 objects:v30 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v13 = *(void *)v27;
    do
    {
      for (uint64_t i = 0; i != v12; ++i)
      {
        if (*(void *)v27 != v13) {
          objc_enumerationMutation(v10);
        }
        v15 = *(void **)(*((void *)&v26 + 1) + 8 * i);
        v16 = [v15 imageData];

        if (!v16)
        {
          dispatch_group_enter(v9);
          v24[0] = MEMORY[0x263EF8330];
          v24[1] = 3221225472;
          v24[2] = __66__AAUIContactsProvider__fetchImagesForContacts_ofSize_completion___block_invoke;
          v24[3] = &unk_263F93E58;
          v24[4] = v15;
          v25 = v9;
          [(AAUIContactsProvider *)self _fetchImageDataForLocalContact:v15 ofSize:v24 withCompletion:a4];
        }
      }
      uint64_t v12 = [v10 countByEnumeratingWithState:&v26 objects:v30 count:16];
    }
    while (v12);
  }

  v17 = dispatch_get_global_queue(25, 0);
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __66__AAUIContactsProvider__fetchImagesForContacts_ofSize_completion___block_invoke_2;
  block[3] = &unk_263F92070;
  id v22 = v10;
  id v23 = v20;
  id v18 = v10;
  id v19 = v20;
  dispatch_group_notify(v9, v17, block);
}

void __66__AAUIContactsProvider__fetchImagesForContacts_ofSize_completion___block_invoke(uint64_t a1, uint64_t a2)
{
  [*(id *)(a1 + 32) setImageData:a2];
  uint64_t v3 = *(NSObject **)(a1 + 40);
  dispatch_group_leave(v3);
}

uint64_t __66__AAUIContactsProvider__fetchImagesForContacts_ofSize_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

- (void)_fetchImageDataForLocalContact:(id)a3 ofSize:(double)a4 withCompletion:(id)a5
{
  id v8 = a3;
  v9 = (void (**)(id, void *))a5;
  contactsManager = self->_contactsManager;
  uint64_t v11 = [v8 handle];
  uint64_t v12 = [(AAContactsManager *)contactsManager contactForHandle:v11];

  uint64_t v13 = [v12 thumbnailImageData];

  if (v13)
  {
    v14 = [v12 thumbnailImageData];
    v9[2](v9, v14);
  }
  else
  {
    v15 = [v8 familyDSID];
    v16[0] = MEMORY[0x263EF8330];
    v16[1] = 3221225472;
    v16[2] = __77__AAUIContactsProvider__fetchImageDataForLocalContact_ofSize_withCompletion___block_invoke;
    v16[3] = &unk_263F93E80;
    id v17 = v8;
    double v19 = a4;
    id v18 = v9;
    [(AAUIContactsProvider *)self _fetchServerImageDataFor:v15 WithCompletion:v16];
  }
}

void __77__AAUIContactsProvider__fetchImageDataForLocalContact_ofSize_withCompletion___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v10 = 0;
  uint64_t v11 = &v10;
  uint64_t v12 = 0x2050000000;
  v4 = (void *)getFAProfilePictureStoreClass_softClass;
  uint64_t v13 = getFAProfilePictureStoreClass_softClass;
  if (!getFAProfilePictureStoreClass_softClass)
  {
    v9[0] = MEMORY[0x263EF8330];
    v9[1] = 3221225472;
    v9[2] = __getFAProfilePictureStoreClass_block_invoke;
    v9[3] = &unk_263F92608;
    v9[4] = &v10;
    __getFAProfilePictureStoreClass_block_invoke((uint64_t)v9);
    v4 = (void *)v11[3];
  }
  id v5 = v4;
  _Block_object_dispose(&v10, 8);
  id v6 = [*(id *)(a1 + 32) firstName];
  id v7 = [*(id *)(a1 + 32) lastName];
  id v8 = [v5 profilePictureForContact:0 serverImageData:v3 firstName:v6 lastName:v7 diameter:*(double *)(a1 + 48)];

  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (void)_fetchServerImageDataFor:(id)a3 WithCompletion:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  id v7 = v6;
  if (v5)
  {
    id v8 = (void *)[objc_alloc(MEMORY[0x263F3BF58]) initWithFamilyMemberDSID:v5 size:1 localFallback:1];
    [v8 setUseMonogramAsLastResort:0];
    v9[0] = MEMORY[0x263EF8330];
    v9[1] = 3221225472;
    v9[2] = __64__AAUIContactsProvider__fetchServerImageDataFor_WithCompletion___block_invoke;
    v9[3] = &unk_263F93EA8;
    id v10 = v7;
    [v8 startRequestWithCompletionHandler:v9];
  }
  else
  {
    (*((void (**)(id, void))v6 + 2))(v6, 0);
  }
}

uint64_t __64__AAUIContactsProvider__fetchServerImageDataFor_WithCompletion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void).cxx_destruct
{
}

@end