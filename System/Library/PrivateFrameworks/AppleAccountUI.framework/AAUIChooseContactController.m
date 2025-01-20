@interface AAUIChooseContactController
- (AAUIChooseContactController)init;
- (AAUIChooseContactController)initWithAccountManager:(id)a3;
- (AAUIChooseContactControllerDelegate)delegate;
- (BOOL)_isHandleReachable:(id)a3;
- (NSString)telemetryFlowID;
- (UIViewController)chooseContactViewController;
- (id)_idsReachabilityDictionaryForRecipient:(id)a3;
- (id)searchController:(id)a3 composeRecipientForAddress:(id)a4;
- (id)searchController:(id)a3 tintColorForRecipient:(id)a4;
- (unint64_t)searchController:(id)a3 presentationOptionsForRecipient:(id)a4;
- (void)_prepareNextButton;
- (void)_selectionCompleted;
- (void)_setupViewController;
- (void)contactPicker:(id)a3 didSelectContact:(id)a4;
- (void)contactPicker:(id)a3 didSelectContactProperty:(id)a4;
- (void)didTapTextViewAccessoryButtonForSearchController:(id)a3;
- (void)fetchIDSStatusForRecipient:(id)a3;
- (void)searchController:(id)a3 didAddRecipient:(id)a4;
- (void)setDelegate:(id)a3;
- (void)setTelemetryFlowID:(id)a3;
@end

@implementation AAUIChooseContactController

- (AAUIChooseContactController)init
{
  v5.receiver = self;
  v5.super_class = (Class)AAUIChooseContactController;
  v2 = [(AAUIChooseContactController *)&v5 init];
  v3 = v2;
  if (v2) {
    [(AAUIChooseContactController *)v2 _setupViewController];
  }
  return v3;
}

- (AAUIChooseContactController)initWithAccountManager:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)AAUIChooseContactController;
  v6 = [(AAUIChooseContactController *)&v9 init];
  v7 = v6;
  if (v6)
  {
    [(AAUIChooseContactController *)v6 _setupViewController];
    objc_storeStrong((id *)&v7->_accountManager, a3);
  }

  return v7;
}

- (UIViewController)chooseContactViewController
{
  return (UIViewController *)self->_autocompleteSearchController;
}

- (id)searchController:(id)a3 composeRecipientForAddress:(id)a4
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  id v4 = a4;
  id v5 = _AAUILogSystem();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v9 = 138412290;
    id v10 = v4;
    _os_log_impl(&dword_209754000, v5, OS_LOG_TYPE_DEFAULT, "Composing contact for address: %@", (uint8_t *)&v9, 0xCu);
  }

  if (objc_msgSend(v4, "aa_appearsToBeEmail"))
  {
    uint64_t v6 = 0;
  }
  else if (objc_msgSend(v4, "aa_appearsToBePhoneNumber"))
  {
    uint64_t v6 = 1;
  }
  else
  {
    uint64_t v6 = 5;
  }
  v7 = (void *)[objc_alloc(MEMORY[0x263F33430]) initWithContact:0 address:v4 kind:v6];

  return v7;
}

- (id)searchController:(id)a3 tintColorForRecipient:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if ((unint64_t)[v7 kind] > 1)
  {
    uint64_t v11 = [MEMORY[0x263F825C8] grayColor];
  }
  else if (objc_opt_respondsToSelector())
  {
    objc_initWeak(&location, self);
    idsStatusAccessQueue = self->_idsStatusAccessQueue;
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __70__AAUIChooseContactController_searchController_tintColorForRecipient___block_invoke;
    block[3] = &unk_263F92668;
    objc_copyWeak(&v26, &location);
    id v9 = v7;
    id v25 = v9;
    dispatch_async(idsStatusAccessQueue, block);
    uint64_t v20 = 0;
    v21 = &v20;
    uint64_t v22 = 0x2020000000;
    char v23 = 0;
    id v10 = self->_idsStatusAccessQueue;
    uint64_t v13 = MEMORY[0x263EF8330];
    uint64_t v14 = 3221225472;
    v15 = __70__AAUIChooseContactController_searchController_tintColorForRecipient___block_invoke_2;
    v16 = &unk_263F92690;
    objc_copyWeak(&v19, &location);
    v18 = &v20;
    id v17 = v9;
    dispatch_sync(v10, &v13);
    if (*((unsigned char *)v21 + 24))
    {
      uint64_t v11 = objc_msgSend(MEMORY[0x263F825C8], "tintColor", v13, v14, v15, v16);
    }
    else
    {
      uint64_t v11 = 0;
    }

    objc_destroyWeak(&v19);
    _Block_object_dispose(&v20, 8);

    objc_destroyWeak(&v26);
    objc_destroyWeak(&location);
  }
  else
  {
    uint64_t v11 = 0;
  }

  return v11;
}

void __70__AAUIChooseContactController_searchController_tintColorForRecipient___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  [WeakRetained fetchIDSStatusForRecipient:*(void *)(a1 + 32)];
}

void __70__AAUIChooseContactController_searchController_tintColorForRecipient___block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = [WeakRetained _isHandleReachable:*(void *)(a1 + 32)];
}

- (unint64_t)searchController:(id)a3 presentationOptionsForRecipient:(id)a4
{
  return (unint64_t)objc_msgSend(a4, "kind", a3) > 1;
}

- (void)didTapTextViewAccessoryButtonForSearchController:(id)a3
{
  id v6 = (id)objc_opt_new();
  [v6 setDelegate:self];
  id v4 = [(AAUIChooseContactController *)self chooseContactViewController];
  id v5 = [v4 navigationController];
  [v5 presentViewController:v6 animated:1 completion:0];
}

- (void)searchController:(id)a3 didAddRecipient:(id)a4
{
  v11[1] = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  v8 = [v6 recipients];
  unint64_t v9 = [v8 count];

  if (v9 >= 2)
  {
    v11[0] = v7;
    id v10 = [MEMORY[0x263EFF8C0] arrayWithObjects:v11 count:1];
    [v6 setRecipients:v10];
  }
  [(AAUIChooseContactController *)self _prepareNextButton];
}

- (void)contactPicker:(id)a3 didSelectContact:(id)a4
{
  v13[1] = *MEMORY[0x263EF8340];
  id v6 = a4;
  id v7 = a3;
  v8 = +[AAUITrustedContactPickerViewController addressKindAndHandleForSingleAddressContact:v6];
  id v9 = objc_alloc(MEMORY[0x263F33430]);
  id v10 = [v8 handle];
  uint64_t v11 = objc_msgSend(v9, "initWithContact:address:kind:", v6, v10, objc_msgSend(v8, "kind"));

  v13[0] = v11;
  v12 = [MEMORY[0x263EFF8C0] arrayWithObjects:v13 count:1];
  [(CNAutocompleteSearchController *)self->_autocompleteSearchController setRecipients:v12];

  [v7 dismissViewControllerAnimated:1 completion:0];
}

- (void)contactPicker:(id)a3 didSelectContactProperty:(id)a4
{
  v15[1] = *MEMORY[0x263EF8340];
  id v6 = a4;
  id v7 = a3;
  v8 = [v6 value];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v9 = [v8 stringValue];
    uint64_t v10 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v9 = v8;
      uint64_t v10 = 0;
    }
    else
    {
      id v9 = 0;
      uint64_t v10 = 5;
    }
  }
  id v11 = objc_alloc(MEMORY[0x263F33430]);
  v12 = [v6 contact];

  uint64_t v13 = (void *)[v11 initWithContact:v12 address:v9 kind:v10];
  v15[0] = v13;
  uint64_t v14 = [MEMORY[0x263EFF8C0] arrayWithObjects:v15 count:1];
  [(CNAutocompleteSearchController *)self->_autocompleteSearchController setRecipients:v14];

  [v7 dismissViewControllerAnimated:1 completion:0];
}

- (void)_setupViewController
{
  v3 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x263EFF9A0]);
  idsReachabilityForRecipientHandle = self->_idsReachabilityForRecipientHandle;
  self->_idsReachabilityForRecipientHandle = v3;

  id v5 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x263EFF9A0]);
  idsReachabilityForUnifiedOrGroupRecipientHandle = self->_idsReachabilityForUnifiedOrGroupRecipientHandle;
  self->_idsReachabilityForUnifiedOrGroupRecipientHandle = v5;

  id v7 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x263EFF9A0]);
  handleToRecipient = self->_handleToRecipient;
  self->_handleToRecipient = v7;

  id v9 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  uint64_t v10 = (OS_dispatch_queue *)dispatch_queue_create("com.apple.appleaccountui.idsReachabilityAccessQueue", v9);
  idsStatusAccessQueue = self->_idsStatusAccessQueue;
  self->_idsStatusAccessQueue = v10;

  v12 = (AAContactsManager *)objc_alloc_init(MEMORY[0x263F257D0]);
  contactsManager = self->_contactsManager;
  self->_contactsManager = v12;

  id v20 = (id)objc_opt_new();
  uint64_t v14 = (CNAutocompleteSearchController *)[objc_alloc(MEMORY[0x263F33418]) initWithSearchType:1];
  autocompleteSearchController = self->_autocompleteSearchController;
  self->_autocompleteSearchController = v14;

  [(CNAutocompleteSearchController *)self->_autocompleteSearchController setDelegate:self];
  v16 = [v20 title];
  [(CNAutocompleteSearchController *)self->_autocompleteSearchController setTitle:v16];

  id v17 = objc_opt_new();
  v18 = [v20 selectButtonText];
  [v17 setTitle:v18];

  [v17 setTarget:self];
  [v17 setAction:sel__selectionCompleted];
  id v19 = [(CNAutocompleteSearchController *)self->_autocompleteSearchController navigationItem];
  [v19 setRightBarButtonItem:v17];

  [(AAUIChooseContactController *)self _prepareNextButton];
}

- (void)_prepareNextButton
{
  v3 = [(CNAutocompleteSearchController *)self->_autocompleteSearchController recipients];
  BOOL v4 = [v3 count] == 1;

  id v6 = [(CNAutocompleteSearchController *)self->_autocompleteSearchController navigationItem];
  id v5 = [v6 rightBarButtonItem];
  [v5 setEnabled:v4];
}

- (void)_selectionCompleted
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_209754000, log, OS_LOG_TYPE_ERROR, "Selection is invalid!", v1, 2u);
}

- (BOOL)_isHandleReachable:(id)a3
{
  id v4 = a3;
  id v5 = [(AAUIChooseContactController *)self _idsReachabilityDictionaryForRecipient:v4];
  id v6 = [v4 address];
  id v7 = [v5 objectForKeyedSubscript:v6];

  if (!v7 || [v7 integerValue] == -1) {
    char v8 = 0;
  }
  else {
    char v8 = [v7 BOOLValue];
  }
  id v9 = _AAUILogSystem();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG)) {
    [(AAUIChooseContactController *)v4 _isHandleReachable:v9];
  }

  return v8;
}

- (id)_idsReachabilityDictionaryForRecipient:(id)a3
{
  id v4 = [a3 children];
  uint64_t v5 = [v4 count];
  uint64_t v6 = 24;
  if (!v5) {
    uint64_t v6 = 16;
  }
  id v7 = *(id *)((char *)&self->super.isa + v6);

  return v7;
}

- (void)fetchIDSStatusForRecipient:(id)a3
{
  uint64_t v34 = *MEMORY[0x263EF8340];
  id v4 = a3;
  if (objc_opt_respondsToSelector())
  {
    uint64_t v5 = [(AAUIChooseContactController *)self _idsReachabilityDictionaryForRecipient:v4];
    uint64_t v6 = [v4 address];
    id v7 = [v5 objectForKeyedSubscript:v6];

    if (!v7)
    {
      char v8 = [v4 address];
      id v9 = [v5 objectForKeyedSubscript:v8];

      if (v9)
      {
        if ([v9 integerValue] == -1) {
          goto LABEL_27;
        }
      }
      else
      {
        uint64_t v10 = [v4 address];
        [v5 setObject:&unk_26BD70B98 forKeyedSubscript:v10];
      }
      id v11 = [v4 children];
      uint64_t v12 = [v11 count];

      if (v12)
      {
        long long v31 = 0u;
        long long v32 = 0u;
        long long v29 = 0u;
        long long v30 = 0u;
        uint64_t v13 = [v4 children];
        uint64_t v14 = [v13 countByEnumeratingWithState:&v29 objects:v33 count:16];
        if (v14)
        {
          uint64_t v15 = *(void *)v30;
          do
          {
            uint64_t v16 = 0;
            do
            {
              if (*(void *)v30 != v15) {
                objc_enumerationMutation(v13);
              }
              [(AAUIChooseContactController *)self fetchIDSStatusForRecipient:*(void *)(*((void *)&v29 + 1) + 8 * v16++)];
            }
            while (v14 != v16);
            uint64_t v14 = [v13 countByEnumeratingWithState:&v29 objects:v33 count:16];
          }
          while (v14);
        }
      }
      handleToRecipient = self->_handleToRecipient;
      v18 = [v4 address];
      id v19 = [(NSMutableDictionary *)handleToRecipient objectForKeyedSubscript:v18];

      if (!v19 || v19 == v4)
      {
        if (v19 && v19 == v4) {
          goto LABEL_26;
        }
      }
      else
      {
        id v20 = _AAUILogSystem();
        if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR)) {
          [(AAUIChooseContactController *)v4 fetchIDSStatusForRecipient:v20];
        }
      }
      v21 = self->_handleToRecipient;
      uint64_t v22 = [v4 address];
      [(NSMutableDictionary *)v21 setObject:v4 forKeyedSubscript:v22];

      objc_initWeak(&location, self);
      contactsManager = self->_contactsManager;
      v24 = [v4 address];
      v25[0] = MEMORY[0x263EF8330];
      v25[1] = 3221225472;
      v25[2] = __58__AAUIChooseContactController_fetchIDSStatusForRecipient___block_invoke;
      v25[3] = &unk_263F92708;
      v25[4] = self;
      objc_copyWeak(&v27, &location);
      id v26 = v4;
      [(AAContactsManager *)contactsManager idsStatusForHandle:v24 completion:v25];

      objc_destroyWeak(&v27);
      objc_destroyWeak(&location);
LABEL_26:

LABEL_27:
    }
  }
  else
  {
    uint64_t v5 = _AAUILogSystem();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
      -[AAUIChooseContactController fetchIDSStatusForRecipient:](v4, v5);
    }
  }
}

void __58__AAUIChooseContactController_fetchIDSStatusForRecipient___block_invoke(uint64_t a1, char a2)
{
  id v4 = *(NSObject **)(*(void *)(a1 + 32) + 40);
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __58__AAUIChooseContactController_fetchIDSStatusForRecipient___block_invoke_2;
  block[3] = &unk_263F926E0;
  objc_copyWeak(&v7, (id *)(a1 + 48));
  id v6 = *(id *)(a1 + 40);
  char v8 = a2;
  dispatch_async(v4, block);

  objc_destroyWeak(&v7);
}

void __58__AAUIChooseContactController_fetchIDSStatusForRecipient___block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v3 = [NSNumber numberWithBool:*(unsigned __int8 *)(a1 + 48)];
  id v4 = [WeakRetained _idsReachabilityDictionaryForRecipient:*(void *)(a1 + 32)];
  uint64_t v5 = [*(id *)(a1 + 32) address];
  [v4 setObject:v3 forKeyedSubscript:v5];

  if (*(unsigned char *)(a1 + 48) && *(void *)(a1 + 32))
  {
    v6[0] = MEMORY[0x263EF8330];
    v6[1] = 3221225472;
    v6[2] = __58__AAUIChooseContactController_fetchIDSStatusForRecipient___block_invoke_3;
    v6[3] = &unk_263F926B8;
    id v7 = WeakRetained;
    id v8 = *(id *)(a1 + 32);
    dispatch_async(MEMORY[0x263EF83A0], v6);
  }
}

void __58__AAUIChooseContactController_fetchIDSStatusForRecipient___block_invoke_3(uint64_t a1)
{
  v2 = *(void **)(*(void *)(a1 + 32) + 8);
  id v3 = [MEMORY[0x263F825C8] tintColor];
  [v2 setTintColor:v3 forRecipient:*(void *)(a1 + 40)];
}

- (AAUIChooseContactControllerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (AAUIChooseContactControllerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (NSString)telemetryFlowID
{
  return self->_telemetryFlowID;
}

- (void)setTelemetryFlowID:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_telemetryFlowID, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_accountManager, 0);
  objc_storeStrong((id *)&self->_contactsManager, 0);
  objc_storeStrong((id *)&self->_idsStatusAccessQueue, 0);
  objc_storeStrong((id *)&self->_handleToRecipient, 0);
  objc_storeStrong((id *)&self->_idsReachabilityForUnifiedOrGroupRecipientHandle, 0);
  objc_storeStrong((id *)&self->_idsReachabilityForRecipientHandle, 0);
  objc_storeStrong((id *)&self->_autocompleteSearchController, 0);
}

- (void)_isHandleReachable:(NSObject *)a3 .cold.1(void *a1, char a2, NSObject *a3)
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  uint64_t v5 = [a1 address];
  int v6 = 138478083;
  id v7 = v5;
  __int16 v8 = 1024;
  int v9 = a2 & 1;
  _os_log_debug_impl(&dword_209754000, a3, OS_LOG_TYPE_DEBUG, "%{private}@ _isHandleReachable %d", (uint8_t *)&v6, 0x12u);
}

- (void)fetchIDSStatusForRecipient:(NSObject *)a3 .cold.1(void *a1, uint64_t a2, NSObject *a3)
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  int v6 = [a1 address];
  int v7 = 138478339;
  __int16 v8 = v6;
  __int16 v9 = 2112;
  uint64_t v10 = a1;
  __int16 v11 = 2112;
  uint64_t v12 = a2;
  _os_log_error_impl(&dword_209754000, a3, OS_LOG_TYPE_ERROR, "%{private}@ mismatch in tintColorForRecipient incoming %@ existing %@", (uint8_t *)&v7, 0x20u);
}

- (void)fetchIDSStatusForRecipient:(void *)a1 .cold.2(void *a1, NSObject *a2)
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  id v3 = [a1 address];
  int v4 = 138477827;
  uint64_t v5 = v3;
  _os_log_debug_impl(&dword_209754000, a2, OS_LOG_TYPE_DEBUG, "%{private}@ Missing AA SPI, skipping reachability check", (uint8_t *)&v4, 0xCu);
}

@end