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
  id v4 = a4;
  id v5 = _AAUILogSystem();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v9 = 138412290;
    id v10 = v4;
    _os_log_impl(&dword_0, v5, OS_LOG_TYPE_DEFAULT, "Composing contact for address: %@", (uint8_t *)&v9, 0xCu);
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
  id v7 = [objc_alloc((Class)CNComposeRecipient) initWithContact:0 address:v4 kind:v6];

  return v7;
}

- (id)searchController:(id)a3 tintColorForRecipient:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if ((unint64_t)[v7 kind] > 1)
  {
    v11 = +[UIColor grayColor];
  }
  else if (objc_opt_respondsToSelector())
  {
    objc_initWeak(&location, self);
    idsStatusAccessQueue = self->_idsStatusAccessQueue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_11F9C;
    block[3] = &unk_75610;
    objc_copyWeak(&v26, &location);
    id v9 = v7;
    id v25 = v9;
    dispatch_async(idsStatusAccessQueue, block);
    uint64_t v20 = 0;
    v21 = &v20;
    uint64_t v22 = 0x2020000000;
    char v23 = 0;
    id v10 = self->_idsStatusAccessQueue;
    v13 = _NSConcreteStackBlock;
    uint64_t v14 = 3221225472;
    v15 = sub_11FEC;
    v16 = &unk_758B0;
    objc_copyWeak(&v19, &location);
    v18 = &v20;
    id v17 = v9;
    dispatch_sync(v10, &v13);
    if (*((unsigned char *)v21 + 24))
    {
      v11 = +[UIColor tintColor];
    }
    else
    {
      v11 = 0;
    }

    objc_destroyWeak(&v19);
    _Block_object_dispose(&v20, 8);

    objc_destroyWeak(&v26);
    objc_destroyWeak(&location);
  }
  else
  {
    v11 = 0;
  }

  return v11;
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
  id v6 = a3;
  id v7 = a4;
  v8 = [v6 recipients];
  id v9 = [v8 count];

  if ((unint64_t)v9 >= 2)
  {
    id v11 = v7;
    id v10 = +[NSArray arrayWithObjects:&v11 count:1];
    [v6 setRecipients:v10];
  }
  [(AAUIChooseContactController *)self _prepareNextButton];
}

- (void)contactPicker:(id)a3 didSelectContact:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  v8 = +[AAUITrustedContactPickerViewController addressKindAndHandleForSingleAddressContact:v6];
  id v9 = objc_alloc((Class)CNComposeRecipient);
  id v10 = [v8 handle];
  id v11 = objc_msgSend(v9, "initWithContact:address:kind:", v6, v10, objc_msgSend(v8, "kind"));

  id v13 = v11;
  v12 = +[NSArray arrayWithObjects:&v13 count:1];
  [(CNAutocompleteSearchController *)self->_autocompleteSearchController setRecipients:v12];

  [v7 dismissViewControllerAnimated:1 completion:0];
}

- (void)contactPicker:(id)a3 didSelectContactProperty:(id)a4
{
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
  id v11 = objc_alloc((Class)CNComposeRecipient);
  v12 = [v6 contact];

  id v13 = [v11 initWithContact:v12 address:v9 kind:v10];
  id v15 = v13;
  uint64_t v14 = +[NSArray arrayWithObjects:&v15 count:1];
  [(CNAutocompleteSearchController *)self->_autocompleteSearchController setRecipients:v14];

  [v7 dismissViewControllerAnimated:1 completion:0];
}

- (void)_setupViewController
{
  v3 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
  idsReachabilityForRecipientHandle = self->_idsReachabilityForRecipientHandle;
  self->_idsReachabilityForRecipientHandle = v3;

  id v5 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
  idsReachabilityForUnifiedOrGroupRecipientHandle = self->_idsReachabilityForUnifiedOrGroupRecipientHandle;
  self->_idsReachabilityForUnifiedOrGroupRecipientHandle = v5;

  id v7 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
  handleToRecipient = self->_handleToRecipient;
  self->_handleToRecipient = v7;

  id v9 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  uint64_t v10 = (OS_dispatch_queue *)dispatch_queue_create("com.apple.appleaccountui.idsReachabilityAccessQueue", v9);
  idsStatusAccessQueue = self->_idsStatusAccessQueue;
  self->_idsStatusAccessQueue = v10;

  v12 = (AAContactsManager *)objc_alloc_init((Class)AAContactsManager);
  contactsManager = self->_contactsManager;
  self->_contactsManager = v12;

  id v20 = (id)objc_opt_new();
  uint64_t v14 = (CNAutocompleteSearchController *)[objc_alloc((Class)CNAutocompleteSearchController) initWithSearchType:1];
  autocompleteSearchController = self->_autocompleteSearchController;
  self->_autocompleteSearchController = v14;

  [(CNAutocompleteSearchController *)self->_autocompleteSearchController setDelegate:self];
  v16 = [v20 title];
  [(CNAutocompleteSearchController *)self->_autocompleteSearchController setTitle:v16];

  id v17 = objc_opt_new();
  v18 = [v20 selectButtonText];
  [v17 setTitle:v18];

  [v17 setTarget:self];
  [v17 setAction:"_selectionCompleted"];
  id v19 = [(CNAutocompleteSearchController *)self->_autocompleteSearchController navigationItem];
  [v19 setRightBarButtonItem:v17];

  [(AAUIChooseContactController *)self _prepareNextButton];
}

- (void)_prepareNextButton
{
  v3 = [(CNAutocompleteSearchController *)self->_autocompleteSearchController recipients];
  BOOL v4 = [v3 count] == (char *)&dword_0 + 1;

  id v6 = [(CNAutocompleteSearchController *)self->_autocompleteSearchController navigationItem];
  id v5 = [v6 rightBarButtonItem];
  [v5 setEnabled:v4];
}

- (void)_selectionCompleted
{
  v3 = [(CNAutocompleteSearchController *)self->_autocompleteSearchController recipients];
  BOOL v4 = [v3 firstObject];

  if ((unint64_t)[v4 kind] > 1)
  {
    uint64_t v10 = _AAUILogSystem();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      sub_48B80(v10);
    }
  }
  else
  {
    id v5 = objc_alloc((Class)AALocalContactInfo);
    id v6 = [v4 address];
    id v7 = [v4 contact];
    id v8 = [v5 initWithHandle:v6 contact:v7];

    id v9 = [(AAUIChooseContactController *)self delegate];
    [v9 chooseContactController:self didSelectContact:v8];
  }
}

- (BOOL)_isHandleReachable:(id)a3
{
  id v4 = a3;
  id v5 = [(AAUIChooseContactController *)self _idsReachabilityDictionaryForRecipient:v4];
  id v6 = [v4 address];
  id v7 = [v5 objectForKeyedSubscript:v6];

  if (!v7 || [v7 integerValue] == (id)-1) {
    unsigned __int8 v8 = 0;
  }
  else {
    unsigned __int8 v8 = [v7 BOOLValue];
  }
  id v9 = _AAUILogSystem();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG)) {
    sub_48BC4(v4, v8, v9);
  }

  return v8;
}

- (id)_idsReachabilityDictionaryForRecipient:(id)a3
{
  id v4 = [a3 children];
  id v5 = [v4 count];
  uint64_t v6 = 24;
  if (!v5) {
    uint64_t v6 = 16;
  }
  id v7 = *(id *)((char *)&self->super.isa + v6);

  return v7;
}

- (void)fetchIDSStatusForRecipient:(id)a3
{
  id v4 = a3;
  if (objc_opt_respondsToSelector())
  {
    id v5 = [(AAUIChooseContactController *)self _idsReachabilityDictionaryForRecipient:v4];
    uint64_t v6 = [v4 address];
    id v7 = [v5 objectForKeyedSubscript:v6];

    if (!v7)
    {
      unsigned __int8 v8 = [v4 address];
      id v9 = [v5 objectForKeyedSubscript:v8];

      if (v9)
      {
        if ([v9 integerValue] == (id)-1) {
          goto LABEL_27;
        }
      }
      else
      {
        uint64_t v10 = [v4 address];
        [v5 setObject:&off_79D70 forKeyedSubscript:v10];
      }
      id v11 = [v4 children];
      id v12 = [v11 count];

      if (v12)
      {
        long long v31 = 0u;
        long long v32 = 0u;
        long long v29 = 0u;
        long long v30 = 0u;
        id v13 = [v4 children];
        id v14 = [v13 countByEnumeratingWithState:&v29 objects:v33 count:16];
        if (v14)
        {
          uint64_t v15 = *(void *)v30;
          do
          {
            v16 = 0;
            do
            {
              if (*(void *)v30 != v15) {
                objc_enumerationMutation(v13);
              }
              [(AAUIChooseContactController *)self fetchIDSStatusForRecipient:*(void *)(*((void *)&v29 + 1) + 8 * (void)v16)];
              v16 = (char *)v16 + 1;
            }
            while (v14 != v16);
            id v14 = [v13 countByEnumeratingWithState:&v29 objects:v33 count:16];
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
          sub_48C78(v4, (uint64_t)v19, v20);
        }
      }
      v21 = self->_handleToRecipient;
      uint64_t v22 = [v4 address];
      [(NSMutableDictionary *)v21 setObject:v4 forKeyedSubscript:v22];

      objc_initWeak(&location, self);
      contactsManager = self->_contactsManager;
      v24 = [v4 address];
      v25[0] = _NSConcreteStackBlock;
      v25[1] = 3221225472;
      v25[2] = sub_12C78;
      v25[3] = &unk_75900;
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
    id v5 = _AAUILogSystem();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
      sub_48D38(v4, v5);
    }
  }
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

@end