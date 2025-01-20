@interface AFUIAutoFillPasswordController
- (AFUIAutoFillPasswordController)initWithDocumentTraits:(id)a3 presentingViewController:(id)a4 textOperationsHandler:(id)a5;
- (AFUIModalUIDelegate)modalUIDelegate;
- (BOOL)hasSuggestions;
- (UIViewController)presentingViewController;
- (id)_keyboardDictionaryWithCredential:(id)a3;
- (id)_menuItemImageForOneTimeCodeSuggestion:(id)a3;
- (void)_loadAccountSuggestions:(id)a3;
- (void)_loadOneTimeCodeSuggestions:(id)a3;
- (void)_performTextOperationsWithAccountSuggestion:(id)a3;
- (void)_performTextOperationsWithCredential:(id)a3;
- (void)_performTextOperationsWithOneTimeCodeSuggestion:(id)a3;
- (void)_performTextOperationsWithStringValue:(id)a3;
- (void)_reloadOneTimeCodeSuggestions;
- (void)_showAllPasswordsView;
- (void)generateInitialMenu:(id)a3 menuChanged:(id)a4;
- (void)passwordsController:(id)a3 fillPassword:(id)a4;
- (void)passwordsController:(id)a3 fillText:(id)a4;
- (void)passwordsController:(id)a3 fillUsername:(id)a4;
- (void)passwordsController:(id)a3 fillVerificationCode:(id)a4;
- (void)passwordsController:(id)a3 selectedCredential:(id)a4;
- (void)passwordsControllerDidFinish:(id)a3;
- (void)setModalUIDelegate:(id)a3;
- (void)setPresentingViewController:(id)a3;
@end

@implementation AFUIAutoFillPasswordController

- (AFUIAutoFillPasswordController)initWithDocumentTraits:(id)a3 presentingViewController:(id)a4 textOperationsHandler:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v18.receiver = self;
  v18.super_class = (Class)AFUIAutoFillPasswordController;
  v11 = [(AFUIAutoFillPasswordController *)&v18 init];
  if (v11)
  {
    uint64_t v12 = [v8 copy];
    documentTraits = v11->_documentTraits;
    v11->_documentTraits = (RTIDocumentTraits *)v12;

    objc_storeWeak((id *)&v11->_presentingViewController, v9);
    uint64_t v14 = MEMORY[0x24C589E40](v10);
    id textOperationsHandler = v11->_textOperationsHandler;
    v11->_id textOperationsHandler = (id)v14;

    v16 = v11;
  }

  return v11;
}

- (void)generateInitialMenu:(id)a3 menuChanged:(id)a4
{
  id v8 = a3;
  v6 = (void *)MEMORY[0x24C589E40](a4);
  id menuChanged = self->_menuChanged;
  self->_id menuChanged = v6;

  if ([(RTIDocumentTraits *)self->_documentTraits autofillMode] == 1)
  {
    [(AFUIAutoFillPasswordController *)self _loadAccountSuggestions:v8];
  }
  else
  {
    [(AFUIAutoFillPasswordController *)self _loadOneTimeCodeSuggestions:v8];

    id v8 = [MEMORY[0x263F08A00] defaultCenter];
    [v8 addObserver:self selector:sel__reloadOneTimeCodeSuggestions name:@"com.apple.AutoFillCore.AFOneTimeCodeSuggestionsDidChangeNotification" object:0];
  }
}

- (void)_loadAccountSuggestions:(id)a3
{
  id v4 = a3;
  v5 = [MEMORY[0x263EFF980] array];
  objc_initWeak(&location, self);
  v6 = [MEMORY[0x263F295C8] sharedInstance];
  documentTraits = self->_documentTraits;
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __58__AFUIAutoFillPasswordController__loadAccountSuggestions___block_invoke;
  v10[3] = &unk_265248FC0;
  objc_copyWeak(&v13, &location);
  id v8 = v5;
  id v11 = v8;
  id v9 = v4;
  id v12 = v9;
  [v6 generateAutoFillSuggestionsWithAutoFillMode:1 textPrefix:0 documentTraits:documentTraits completionHandler:v10];

  objc_destroyWeak(&v13);
  objc_destroyWeak(&location);
}

void __58__AFUIAutoFillPasswordController__loadAccountSuggestions___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v44 = *MEMORY[0x263EF8340];
  id v30 = a2;
  v2 = [v30 indexesOfObjectsPassingTest:&__block_literal_global];
  v3 = [v30 objectsAtIndexes:v2];

  long long v40 = 0u;
  long long v41 = 0u;
  long long v38 = 0u;
  long long v39 = 0u;
  id obj = v3;
  uint64_t v4 = [obj countByEnumeratingWithState:&v38 objects:v43 count:16];
  if (v4)
  {
    uint64_t v32 = *(void *)v39;
    uint64_t v5 = *MEMORY[0x263F29448];
    do
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v39 != v32) {
          objc_enumerationMutation(obj);
        }
        v7 = *(void **)(*((void *)&v38 + 1) + 8 * i);
        id v8 = [v7 usernameAndPasswordPayload];
        id v9 = [v8 objectForKeyedSubscript:v5];
        id v10 = @"person.badge.key.fill";
        if (!v9) {
          id v10 = @"key.fill";
        }
        id v11 = v10;

        id v12 = (void *)MEMORY[0x263F823D0];
        v36[0] = MEMORY[0x263EF8330];
        v36[1] = 3221225472;
        v36[2] = __58__AFUIAutoFillPasswordController__loadAccountSuggestions___block_invoke_3;
        v36[3] = &unk_265248F70;
        objc_copyWeak(&v37, (id *)(a1 + 48));
        v36[4] = v7;
        id v13 = [v12 actionWithHandler:v36];
        uint64_t v14 = [v7 title];
        [v13 setTitle:v14];

        v15 = [v7 subTitle];
        [v13 setSubtitle:v15];

        v16 = [MEMORY[0x263F827E8] systemImageNamed:v11];
        [v13 setImage:v16];

        [*(id *)(a1 + 32) addObject:v13];
        objc_destroyWeak(&v37);
      }
      uint64_t v4 = [obj countByEnumeratingWithState:&v38 objects:v43 count:16];
    }
    while (v4);
  }

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  if (WeakRetained) {
    WeakRetained[32] = [obj count] != 0;
  }
  BOOL v18 = [obj count] == 0;
  v19 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  v20 = v19;
  if (v18) {
    v21 = @"Passwords…";
  }
  else {
    v21 = @"Other Passwords…";
  }
  v22 = [v19 localizedStringForKey:v21 value:&stru_26FCB6C48 table:@"Localizable"];

  v23 = (void *)MEMORY[0x263F823D0];
  v34[0] = MEMORY[0x263EF8330];
  v34[1] = 3221225472;
  v34[2] = __58__AFUIAutoFillPasswordController__loadAccountSuggestions___block_invoke_4;
  v34[3] = &unk_265248F98;
  objc_copyWeak(&v35, (id *)(a1 + 48));
  v24 = [v23 actionWithHandler:v34];
  [v24 setTitle:v22];
  v25 = (void *)MEMORY[0x263F82940];
  v42 = v24;
  v26 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v42 count:1];
  v27 = [v25 menuWithTitle:&stru_26FCB6C48 image:0 identifier:0 options:1 children:v26];

  [*(id *)(a1 + 32) addObject:v27];
  uint64_t v28 = *(void *)(a1 + 40);
  v29 = [MEMORY[0x263F82940] menuWithChildren:*(void *)(a1 + 32)];
  (*(void (**)(uint64_t, void *))(v28 + 16))(v28, v29);

  objc_destroyWeak(&v35);
}

BOOL __58__AFUIAutoFillPasswordController__loadAccountSuggestions___block_invoke_2(uint64_t a1, void *a2)
{
  v2 = [a2 usernameAndPasswordPayload];
  BOOL v3 = [v2 count] != 0;

  return v3;
}

void __58__AFUIAutoFillPasswordController__loadAccountSuggestions___block_invoke_3(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  [WeakRetained _performTextOperationsWithAccountSuggestion:*(void *)(a1 + 32)];
}

void __58__AFUIAutoFillPasswordController__loadAccountSuggestions___block_invoke_4(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _showAllPasswordsView];
}

- (void)_loadOneTimeCodeSuggestions:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [MEMORY[0x263EFF980] array];
  objc_initWeak(&location, self);
  v6 = [MEMORY[0x263F295C8] sharedInstance];
  documentTraits = self->_documentTraits;
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __62__AFUIAutoFillPasswordController__loadOneTimeCodeSuggestions___block_invoke;
  v10[3] = &unk_265248FE8;
  objc_copyWeak(&v13, &location);
  void v10[4] = self;
  id v8 = v5;
  id v11 = v8;
  id v9 = v4;
  id v12 = v9;
  [v6 generateAutoFillSuggestionsWithAutoFillMode:8 textPrefix:0 documentTraits:documentTraits completionHandler:v10];

  objc_destroyWeak(&v13);
  objc_destroyWeak(&location);
}

void __62__AFUIAutoFillPasswordController__loadOneTimeCodeSuggestions___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v36 = *MEMORY[0x263EF8340];
  long long v30 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  id obj = a2;
  uint64_t v3 = [obj countByEnumeratingWithState:&v30 objects:v35 count:16];
  if (v3)
  {
    uint64_t v4 = *(void *)v31;
    while (2)
    {
      for (uint64_t i = 0; i != v3; ++i)
      {
        if (*(void *)v31 != v4) {
          objc_enumerationMutation(obj);
        }
        v6 = *(void **)(*((void *)&v30 + 1) + 8 * i);
        if ((objc_opt_respondsToSelector() & 1) == 0)
        {
          id WeakRetained = obj;
          goto LABEL_16;
        }
        v7 = (void *)MEMORY[0x263F823D0];
        v28[0] = MEMORY[0x263EF8330];
        v28[1] = 3221225472;
        v28[2] = __62__AFUIAutoFillPasswordController__loadOneTimeCodeSuggestions___block_invoke_2;
        v28[3] = &unk_265248F70;
        objc_copyWeak(&v29, (id *)(a1 + 56));
        v28[4] = v6;
        id v8 = [v7 actionWithHandler:v28];
        id v9 = [v6 title];
        [v8 setTitle:v9];

        id v10 = [v6 subTitle];
        [v8 setSubtitle:v10];

        id v11 = [*(id *)(a1 + 32) _menuItemImageForOneTimeCodeSuggestion:v6];
        [v8 setImage:v11];

        [*(id *)(a1 + 40) addObject:v8];
        objc_destroyWeak(&v29);
      }
      uint64_t v3 = [obj countByEnumeratingWithState:&v30 objects:v35 count:16];
      if (v3) {
        continue;
      }
      break;
    }
  }

  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  if (WeakRetained) {
    *((unsigned char *)WeakRetained + 33) = [obj count] != 0;
  }
  BOOL v13 = [*((id *)WeakRetained + 3) autofillMode] == 8;
  uint64_t v14 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  v15 = v14;
  if (v13) {
    v16 = @"Passwords & Verification Codes…";
  }
  else {
    v16 = @"Passwords…";
  }
  v17 = [v14 localizedStringForKey:v16 value:&stru_26FCB6C48 table:@"Localizable"];

  BOOL v18 = (void *)MEMORY[0x263F823D0];
  v26[0] = MEMORY[0x263EF8330];
  v26[1] = 3221225472;
  v26[2] = __62__AFUIAutoFillPasswordController__loadOneTimeCodeSuggestions___block_invoke_3;
  v26[3] = &unk_265248F98;
  objc_copyWeak(&v27, (id *)(a1 + 56));
  v19 = [v18 actionWithHandler:v26];
  [v19 setTitle:v17];
  v20 = (void *)MEMORY[0x263F82940];
  v34 = v19;
  v21 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v34 count:1];
  v22 = [v20 menuWithTitle:&stru_26FCB6C48 image:0 identifier:0 options:1 children:v21];

  [*(id *)(a1 + 40) addObject:v22];
  uint64_t v23 = *(void *)(a1 + 48);
  v24 = [MEMORY[0x263F82940] menuWithChildren:*(void *)(a1 + 40)];
  (*(void (**)(uint64_t, void *))(v23 + 16))(v23, v24);

  objc_destroyWeak(&v27);
LABEL_16:
}

void __62__AFUIAutoFillPasswordController__loadOneTimeCodeSuggestions___block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  [WeakRetained _performTextOperationsWithOneTimeCodeSuggestion:*(void *)(a1 + 32)];
}

void __62__AFUIAutoFillPasswordController__loadOneTimeCodeSuggestions___block_invoke_3(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _showAllPasswordsView];
}

- (void)_reloadOneTimeCodeSuggestions
{
  objc_initWeak(&location, self);
  v3[0] = MEMORY[0x263EF8330];
  v3[1] = 3221225472;
  v3[2] = __63__AFUIAutoFillPasswordController__reloadOneTimeCodeSuggestions__block_invoke;
  v3[3] = &unk_265249010;
  objc_copyWeak(&v4, &location);
  [(AFUIAutoFillPasswordController *)self _loadOneTimeCodeSuggestions:v3];
  objc_destroyWeak(&v4);
  objc_destroyWeak(&location);
}

void __63__AFUIAutoFillPasswordController__reloadOneTimeCodeSuggestions__block_invoke(uint64_t a1, void *a2)
{
  v2 = (id *)(a1 + 32);
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained(v2);
  (*(void (**)(void))(WeakRetained[2] + 16))();
}

- (void)_showAllPasswordsView
{
  if (!self->_passwordsController)
  {
    id v3 = [[AFUIPasswordsController alloc] initWithDocumentTraits:self->_documentTraits];
    passwordsController = self->_passwordsController;
    self->_passwordsController = v3;

    [(AFUIPasswordsController *)self->_passwordsController setPasswordPickerDelegate:self];
  }
  uint64_t v5 = [(AFUIAutoFillPasswordController *)self modalUIDelegate];
  [v5 passwordsUIWillBeginForSessionUUID:0 completion:0];

  v6 = self->_passwordsController;
  id v7 = [(AFUIAutoFillPasswordController *)self presentingViewController];
  [(AFUIPasswordsController *)v6 presentPasswordPickerFromViewController:v7 didFinishAuthenticationBlock:0];
}

- (void)_performTextOperationsWithAccountSuggestion:(id)a3
{
  id v4 = a3;
  v16[0] = MEMORY[0x263EF8330];
  v16[1] = 3221225472;
  v16[2] = __78__AFUIAutoFillPasswordController__performTextOperationsWithAccountSuggestion___block_invoke;
  v16[3] = &unk_265249060;
  v16[4] = self;
  id v5 = v4;
  id v17 = v5;
  v6 = (void *)MEMORY[0x24C589E40](v16);
  id v7 = self->_documentTraits;
  id v8 = [(AFUIAutoFillPasswordController *)self modalUIDelegate];
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __78__AFUIAutoFillPasswordController__performTextOperationsWithAccountSuggestion___block_invoke_3;
  v12[3] = &unk_265249088;
  id v13 = v5;
  uint64_t v14 = v7;
  id v15 = v6;
  id v9 = v6;
  id v10 = v7;
  id v11 = v5;
  [v8 authenticationWillBeginForSessionUUID:0 completion:v12];
}

void __78__AFUIAutoFillPasswordController__performTextOperationsWithAccountSuggestion___block_invoke(uint64_t a1, char a2)
{
  id v4 = [*(id *)(a1 + 32) modalUIDelegate];
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __78__AFUIAutoFillPasswordController__performTextOperationsWithAccountSuggestion___block_invoke_2;
  v7[3] = &unk_265249038;
  char v10 = a2;
  id v5 = *(id *)(a1 + 40);
  uint64_t v6 = *(void *)(a1 + 32);
  id v8 = v5;
  uint64_t v9 = v6;
  [v4 authenticationDidEndForSessionUUID:0 completion:v7];
}

void __78__AFUIAutoFillPasswordController__performTextOperationsWithAccountSuggestion___block_invoke_2(uint64_t a1)
{
  if (*(unsigned char *)(a1 + 48))
  {
    id v5 = objc_alloc_init(MEMORY[0x263F63758]);
    v2 = [*(id *)(a1 + 32) usernameAndPasswordPayload];
    id v3 = (void *)[v2 mutableCopy];
    id v4 = [v5 keyboardOutput];
    [v4 setCustomInfo:v3];

    (*(void (**)(void))(*(void *)(*(void *)(a1 + 40) + 8) + 16))();
  }
}

void __78__AFUIAutoFillPasswordController__performTextOperationsWithAccountSuggestion___block_invoke_3(void *a1)
{
  v2 = [MEMORY[0x263F295C8] sharedInstance];
  char v3 = objc_opt_respondsToSelector();

  id v4 = [MEMORY[0x263F295C8] sharedInstance];
  uint64_t v5 = a1[4];
  id v6 = v4;
  if (v3) {
    [v4 authenticateIfNecessaryForSuggestion:v5 documentTraits:a1[5] completionHandler:a1[6]];
  }
  else {
    [v4 shouldAcceptSuggestion:v5 completionHandler:a1[6]];
  }
}

- (void)_performTextOperationsWithCredential:(id)a3
{
  id v4 = (objc_class *)MEMORY[0x263F63758];
  id v5 = a3;
  id v8 = objc_alloc_init(v4);
  id v6 = [(AFUIAutoFillPasswordController *)self _keyboardDictionaryWithCredential:v5];

  id v7 = [v8 keyboardOutput];
  [v7 setCustomInfo:v6];

  (*((void (**)(void))self->_textOperationsHandler + 2))();
}

- (void)_performTextOperationsWithOneTimeCodeSuggestion:(id)a3
{
  id v4 = a3;
  v16[0] = MEMORY[0x263EF8330];
  v16[1] = 3221225472;
  v16[2] = __82__AFUIAutoFillPasswordController__performTextOperationsWithOneTimeCodeSuggestion___block_invoke;
  v16[3] = &unk_265249060;
  v16[4] = self;
  id v5 = v4;
  id v17 = v5;
  id v6 = (void *)MEMORY[0x24C589E40](v16);
  id v7 = self->_documentTraits;
  id v8 = [(AFUIAutoFillPasswordController *)self modalUIDelegate];
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __82__AFUIAutoFillPasswordController__performTextOperationsWithOneTimeCodeSuggestion___block_invoke_3;
  v12[3] = &unk_265249088;
  id v13 = v5;
  uint64_t v14 = v7;
  id v15 = v6;
  id v9 = v6;
  char v10 = v7;
  id v11 = v5;
  [v8 authenticationWillBeginForSessionUUID:0 completion:v12];
}

void __82__AFUIAutoFillPasswordController__performTextOperationsWithOneTimeCodeSuggestion___block_invoke(uint64_t a1, char a2)
{
  id v4 = [*(id *)(a1 + 32) modalUIDelegate];
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __82__AFUIAutoFillPasswordController__performTextOperationsWithOneTimeCodeSuggestion___block_invoke_2;
  v7[3] = &unk_265249038;
  char v10 = a2;
  id v5 = *(id *)(a1 + 40);
  uint64_t v6 = *(void *)(a1 + 32);
  id v8 = v5;
  uint64_t v9 = v6;
  [v4 authenticationDidEndForSessionUUID:0 completion:v7];
}

void __82__AFUIAutoFillPasswordController__performTextOperationsWithOneTimeCodeSuggestion___block_invoke_2(uint64_t a1)
{
  if (*(unsigned char *)(a1 + 48))
  {
    v2 = [*(id *)(a1 + 32) oneTimeCodePayload];
    id v7 = [v2 objectForKeyedSubscript:@"OneTimeCode"];

    if (v7)
    {
      char v3 = [MEMORY[0x263EFF9A0] dictionary];
      id v4 = [v7 code];
      [v3 setObject:v4 forKeyedSubscript:*MEMORY[0x263F7E810]];

      id v5 = objc_alloc_init(MEMORY[0x263F63758]);
      uint64_t v6 = [v5 keyboardOutput];
      [v6 setCustomInfo:v3];

      (*(void (**)(void))(*(void *)(*(void *)(a1 + 40) + 8) + 16))();
    }
  }
}

void __82__AFUIAutoFillPasswordController__performTextOperationsWithOneTimeCodeSuggestion___block_invoke_3(void *a1)
{
  v2 = [MEMORY[0x263F295C8] sharedInstance];
  char v3 = objc_opt_respondsToSelector();

  id v4 = [MEMORY[0x263F295C8] sharedInstance];
  uint64_t v5 = a1[4];
  id v6 = v4;
  if (v3) {
    [v4 authenticateIfNecessaryForSuggestion:v5 documentTraits:a1[5] completionHandler:a1[6]];
  }
  else {
    [v4 shouldAcceptSuggestion:v5 completionHandler:a1[6]];
  }
}

- (id)_menuItemImageForOneTimeCodeSuggestion:(id)a3
{
  char v3 = [a3 oneTimeCodePayload];
  id v4 = [v3 objectForKeyedSubscript:@"OneTimeCode"];

  unint64_t v5 = [v4 source];
  if (v5 <= 2)
  {
    char v3 = [MEMORY[0x263F827E8] systemImageNamed:off_2652490A8[v5]];
  }

  return v3;
}

- (id)_keyboardDictionaryWithCredential:(id)a3
{
  char v3 = (void *)MEMORY[0x263EFF9A0];
  id v4 = a3;
  unint64_t v5 = [v3 dictionary];
  uint64_t v6 = [v4 user];
  id v7 = (void *)v6;
  if (v6) {
    id v8 = (__CFString *)v6;
  }
  else {
    id v8 = &stru_26FCB6C48;
  }
  [v5 setObject:v8 forKeyedSubscript:*MEMORY[0x263F7E820]];

  uint64_t v9 = [v4 password];

  if (v9) {
    char v10 = v9;
  }
  else {
    char v10 = &stru_26FCB6C48;
  }
  [v5 setObject:v10 forKeyedSubscript:*MEMORY[0x263F7E818]];

  return v5;
}

- (void)_performTextOperationsWithStringValue:(id)a3
{
  id v4 = (objc_class *)MEMORY[0x263F63758];
  id v5 = a3;
  id v6 = objc_alloc_init(v4);
  [v6 _assertOrInsertText:v5 documentTraits:self->_documentTraits];

  (*((void (**)(void))self->_textOperationsHandler + 2))();
}

- (BOOL)hasSuggestions
{
  return self->_hasAccountSuggestions || self->_hasOneTimeCodeSuggestions;
}

- (void)passwordsController:(id)a3 selectedCredential:(id)a4
{
}

- (void)passwordsController:(id)a3 fillUsername:(id)a4
{
}

- (void)passwordsController:(id)a3 fillPassword:(id)a4
{
}

- (void)passwordsController:(id)a3 fillVerificationCode:(id)a4
{
}

- (void)passwordsController:(id)a3 fillText:(id)a4
{
}

- (void)passwordsControllerDidFinish:(id)a3
{
  id v3 = [(AFUIAutoFillPasswordController *)self modalUIDelegate];
  [v3 passwordsUIDidEndForSessionUUID:0 completion:0];
}

- (AFUIModalUIDelegate)modalUIDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->modalUIDelegate);

  return (AFUIModalUIDelegate *)WeakRetained;
}

- (void)setModalUIDelegate:(id)a3
{
}

- (UIViewController)presentingViewController
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_presentingViewController);

  return (UIViewController *)WeakRetained;
}

- (void)setPresentingViewController:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_presentingViewController);
  objc_destroyWeak((id *)&self->modalUIDelegate);
  objc_storeStrong((id *)&self->_passwordsController, 0);
  objc_storeStrong((id *)&self->_documentTraits, 0);
  objc_storeStrong(&self->_menuChanged, 0);

  objc_storeStrong(&self->_textOperationsHandler, 0);
}

@end