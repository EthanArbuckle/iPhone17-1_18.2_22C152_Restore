@interface AFUIAutofillContactsController
- (AFUIAutofillContactsController)initWithDocumentTraits:(id)a3 presentingViewController:(id)a4 textOperationsHandler:(id)a5;
- (AFUIContactsController)contactsController;
- (AFUIModalUIDelegate)modalUIDelegate;
- (BOOL)hasSuggestions;
- (BOOL)isSingleLineDocument;
- (RTIDocumentTraits)documentTraits;
- (UIViewController)presentingViewController;
- (double)_maximumSuggestionsForReturnedSuggestions:(double)a3;
- (id)_chooseOtherMenu;
- (id)_meAction;
- (id)performTextOperations;
- (void)_addCustomInfoActions:(id)a3;
- (void)_generateSuggestions:(id)a3;
- (void)_performCustomInfoTextOperations:(id)a3;
- (void)_presentContactPicker;
- (void)_presentCustomizeUI;
- (void)contactPickerDidCancel;
- (void)setContactsController:(id)a3;
- (void)setDocumentTraits:(id)a3;
- (void)setHasSuggestions:(BOOL)a3;
- (void)setModalUIDelegate:(id)a3;
- (void)setPerformTextOperations:(id)a3;
- (void)setPresentingViewController:(id)a3;
- (void)userSelectedContactProperties:(id)a3;
@end

@implementation AFUIAutofillContactsController

- (AFUIAutofillContactsController)initWithDocumentTraits:(id)a3 presentingViewController:(id)a4 textOperationsHandler:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v19.receiver = self;
  v19.super_class = (Class)AFUIAutofillContactsController;
  v12 = [(AFUIAutofillContactsController *)&v19 init];
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_documentTraits, a3);
    uint64_t v14 = MEMORY[0x24C589E40](v11);
    id performTextOperations = v13->_performTextOperations;
    v13->_id performTextOperations = (id)v14;

    v16 = objc_alloc_init(AFUIContactsController);
    contactsController = v13->_contactsController;
    v13->_contactsController = v16;

    [(AFUIContactsController *)v13->_contactsController setContactPropertyPickerDelegate:v13];
    objc_storeWeak((id *)&v13->_presentingViewController, v10);
  }

  return v13;
}

- (BOOL)isSingleLineDocument
{
  return [(RTIDocumentTraits *)self->_documentTraits _afui_isSingleLineDocument];
}

- (void)userSelectedContactProperties:(id)a3
{
  id v12 = a3;
  v4 = [(RTIDocumentTraits *)self->_documentTraits textInputTraits];
  v5 = [v4 textContentType];
  v6 = [v12 objectForKey:v5];

  if (!v6)
  {
    v6 = [v12 objectForKey:*MEMORY[0x263F29540]];
  }
  id v7 = objc_alloc_init(MEMORY[0x263F63758]);
  [v7 _assertOrInsertText:v6 documentTraits:self->_documentTraits];
  v8 = (void *)[v12 mutableCopy];
  id v9 = [v7 keyboardOutput];
  [v9 setCustomInfo:v8];

  id v10 = [(AFUIAutofillContactsController *)self performTextOperations];
  ((void (**)(void, id))v10)[2](v10, v7);

  id v11 = [(AFUIAutofillContactsController *)self modalUIDelegate];
  [v11 contactsUIDidEndForSessionUUID:0 completion:0];
}

- (void)contactPickerDidCancel
{
  id v2 = [(AFUIAutofillContactsController *)self modalUIDelegate];
  [v2 contactsUIDidEndForSessionUUID:0 completion:0];
}

- (double)_maximumSuggestionsForReturnedSuggestions:(double)a3
{
  v4 = [(AFUIAutofillContactsController *)self presentingViewController];
  v5 = [v4 view];
  v6 = [v5 window];
  id v7 = [v6 windowScene];
  if ((unint64_t)([v7 interfaceOrientation] - 3) >= 2) {
    double v8 = 3.0;
  }
  else {
    double v8 = 1.0;
  }

  if (AFUICanDisplayAllSuggestions()) {
    double result = 3.0;
  }
  else {
    double result = v8;
  }
  if (result >= a3) {
    return a3;
  }
  return result;
}

- (void)_generateSuggestions:(id)a3
{
  v4 = (void *)MEMORY[0x263EFF980];
  v5 = (void (**)(id, void *))a3;
  id v9 = [v4 array];
  -[AFUIAutofillContactsController _addCustomInfoActions:](self, "_addCustomInfoActions:");
  if (_os_feature_enabled_impl())
  {
    v6 = [(AFUIAutofillContactsController *)self _meAction];
    [v9 addObject:v6];
  }
  -[AFUIAutofillContactsController setHasSuggestions:](self, "setHasSuggestions:", [v9 count] != 0);
  id v7 = [(AFUIAutofillContactsController *)self _chooseOtherMenu];
  [v9 addObject:v7];

  double v8 = [MEMORY[0x263F82940] menuWithChildren:v9];
  v5[2](v5, v8);
}

- (void)_addCustomInfoActions:(id)a3
{
  id v39 = a3;
  v4 = [(AFUIAutofillContactsController *)self contactsController];
  v5 = [(AFUIAutofillContactsController *)self documentTraits];
  v6 = [v5 textInputTraits];
  id v7 = [v6 textContentType];
  double v8 = [v4 meContactInfosForTextContentType:v7];

  v40 = v8;
  -[AFUIAutofillContactsController _maximumSuggestionsForReturnedSuggestions:](self, "_maximumSuggestionsForReturnedSuggestions:", (double)(unint64_t)[v8 count]);
  if (v9 > 0.0)
  {
    double v10 = v9;
    uint64_t v11 = 0;
    while (1)
    {
      id v12 = [v40 objectAtIndex:v11];
      v13 = [(AFUIAutofillContactsController *)self documentTraits];
      uint64_t v14 = [v13 textInputTraits];
      v15 = [v14 textContentType];
      v16 = [v12 propertyForTextContentType:v15];

      if ([v16 length])
      {
        objc_initWeak(&location, self);
        v17 = (void *)MEMORY[0x263F823D0];
        v45[0] = MEMORY[0x263EF8330];
        v45[1] = 3221225472;
        v45[2] = __56__AFUIAutofillContactsController__addCustomInfoActions___block_invoke;
        v45[3] = &unk_265248F70;
        objc_copyWeak(&v47, &location);
        id v18 = v12;
        id v46 = v18;
        objc_super v19 = [v17 actionWithHandler:v45];
        v20 = [v18 titleText];
        [v19 setTitle:v20];

        v21 = [(AFUIAutofillContactsController *)self documentTraits];
        v22 = [v21 autofillContext];
        v23 = [v18 subtitleTextForAutoFillContext:v22];
        [v19 setSubtitle:v23];

        v24 = (void *)MEMORY[0x263F827E8];
        v25 = [v18 label];
        v26 = +[AFUIContactInfo symbolNameForLabel:v25];
        v27 = [v24 systemImageNamed:v26];
        [v19 setImage:v27];

        [v39 addObject:v19];
        objc_destroyWeak(&v47);
        objc_destroyWeak(&location);
      }
      v28 = [(AFUIAutofillContactsController *)self documentTraits];
      v29 = [v28 textInputTraits];
      v30 = [v29 textContentType];
      if (AFTextContentTypeIsInNameSet(v30)) {
        break;
      }
      v31 = [(AFUIAutofillContactsController *)self documentTraits];
      v32 = [v31 textInputTraits];
      v33 = [v32 textContentType];
      if (AFTextContentTypeIsInBirthdaySet(v33))
      {

        break;
      }
      [(AFUIAutofillContactsController *)self documentTraits];
      v34 = v44 = v16;
      [v34 textInputTraits];
      v43 = v12;
      v36 = v35 = self;
      [v36 textContentType];
      v41 = v28;
      v38 = uint64_t v37 = v11;
      char v42 = AFTextContentTypeIsInJobSet(v38);

      self = v35;
      if ((v42 & 1) == 0)
      {
        uint64_t v11 = v37 + 1;
        if (v10 > (double)((int)v37 + 1)) {
          continue;
        }
      }
      goto LABEL_12;
    }
  }
LABEL_12:
}

void __56__AFUIAutofillContactsController__addCustomInfoActions___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  id v2 = [*(id *)(a1 + 32) customInfoFromContactInfo];
  [WeakRetained _performCustomInfoTextOperations:v2];
}

- (id)_meAction
{
  objc_initWeak(&location, self);
  v3 = (void *)MEMORY[0x263F823D0];
  uint64_t v13 = MEMORY[0x263EF8330];
  uint64_t v14 = 3221225472;
  v15 = __43__AFUIAutofillContactsController__meAction__block_invoke;
  v16 = &unk_265248F98;
  objc_copyWeak(&v17, &location);
  v4 = [v3 actionWithHandler:&v13];
  v5 = [(AFUIAutofillContactsController *)self contactsController];
  v6 = [(AFUIAutofillContactsController *)self documentTraits];
  id v7 = [v6 textInputTraits];
  double v8 = [v7 textContentType];
  double v9 = [v5 meContactInfosForTextContentType:v8];
  double v10 = [v9 firstObject];
  uint64_t v11 = [v10 nameString];
  [v4 setTitle:v11];

  objc_destroyWeak(&v17);
  objc_destroyWeak(&location);

  return v4;
}

void __43__AFUIAutofillContactsController__meAction__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _presentCustomizeUI];
}

- (id)_chooseOtherMenu
{
  v16[1] = *MEMORY[0x263EF8340];
  objc_initWeak(&location, self);
  id v2 = (void *)MEMORY[0x263F823D0];
  uint64_t v10 = MEMORY[0x263EF8330];
  uint64_t v11 = 3221225472;
  id v12 = __50__AFUIAutofillContactsController__chooseOtherMenu__block_invoke;
  uint64_t v13 = &unk_265248F98;
  objc_copyWeak(&v14, &location);
  v3 = [v2 actionWithHandler:&v10];
  v4 = objc_msgSend(MEMORY[0x263F086E0], "bundleForClass:", objc_opt_class(), v10, v11, v12, v13);
  v5 = [v4 localizedStringForKey:@"Choose Other…" value:&stru_26FCB6C48 table:@"Localizable"];
  [v3 setTitle:v5];

  v6 = (void *)MEMORY[0x263F82940];
  v16[0] = v3;
  id v7 = [MEMORY[0x263EFF8C0] arrayWithObjects:v16 count:1];
  double v8 = [v6 menuWithTitle:&stru_26FCB6C48 image:0 identifier:0 options:1 children:v7];

  objc_destroyWeak(&v14);
  objc_destroyWeak(&location);

  return v8;
}

void __50__AFUIAutofillContactsController__chooseOtherMenu__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _presentContactPicker];
}

- (void)_performCustomInfoTextOperations:(id)a3
{
  v4 = (objc_class *)MEMORY[0x263F63758];
  id v5 = a3;
  id v12 = objc_alloc_init(v4);
  v6 = [(AFUIAutofillContactsController *)self documentTraits];
  id v7 = [v6 textInputTraits];
  double v8 = [v7 textContentType];
  double v9 = [v5 objectForKey:v8];

  [v12 _assertOrInsertText:v9 documentTraits:self->_documentTraits];
  uint64_t v10 = [v12 keyboardOutput];
  [v10 setCustomInfo:v5];

  uint64_t v11 = [(AFUIAutofillContactsController *)self performTextOperations];
  ((void (**)(void, id))v11)[2](v11, v12);
}

- (void)_presentContactPicker
{
  uint64_t v13 = 0;
  id v14 = &v13;
  uint64_t v15 = 0x3032000000;
  v16 = __Block_byref_object_copy_;
  id v17 = __Block_byref_object_dispose_;
  v3 = [(AFUIAutofillContactsController *)self documentTraits];
  v4 = [v3 textInputTraits];
  id v18 = [v4 textContentType];

  if (AFTextContentTypeIsInNameSet((void *)v14[5]))
  {
    id v5 = [(AFUIAutofillContactsController *)self documentTraits];
    v6 = [v5 autofillContext];
    v12[0] = MEMORY[0x263EF8330];
    v12[1] = 3221225472;
    v12[2] = __55__AFUIAutofillContactsController__presentContactPicker__block_invoke;
    v12[3] = &unk_265249160;
    v12[4] = &v13;
    [v6 enumerateKeysAndObjectsUsingBlock:v12];
  }
  id v7 = [(AFUIAutofillContactsController *)self modalUIDelegate];

  if (v7)
  {
    double v8 = [(AFUIAutofillContactsController *)self modalUIDelegate];
    v11[0] = MEMORY[0x263EF8330];
    v11[1] = 3221225472;
    v11[2] = __55__AFUIAutofillContactsController__presentContactPicker__block_invoke_2;
    v11[3] = &unk_2652491A8;
    v11[4] = self;
    v11[5] = &v13;
    [v8 contactsUIWillBeginForSessionUUID:0 completion:v11];
  }
  else
  {
    double v8 = [(AFUIAutofillContactsController *)self presentingViewController];
    double v9 = [(AFUIAutofillContactsController *)self contactsController];
    uint64_t v10 = [v9 allContactsViewControllerForTextContentType:v14[5]];
    [v8 presentViewController:v10 animated:1 completion:&__block_literal_global_22];
  }
  _Block_object_dispose(&v13, 8);
}

void __55__AFUIAutofillContactsController__presentContactPicker__block_invoke(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  id v10 = a2;
  if ((AFTextContentTypeIsInNameSet(v10) & 1) == 0)
  {
    if (AFTextContentTypeIsInContactSet(v10))
    {
      v6 = (id *)MEMORY[0x263F294F0];
    }
    else
    {
      if (!AFTextContentTypeIsInPhoneSet(v10)) {
        goto LABEL_7;
      }
      v6 = (id *)MEMORY[0x263F295A0];
    }
    uint64_t v7 = *(void *)(*(void *)(a1 + 32) + 8);
    id v8 = *v6;
    double v9 = *(void **)(v7 + 40);
    *(void *)(v7 + 40) = v8;

    *a4 = 1;
  }
LABEL_7:
}

void __55__AFUIAutofillContactsController__presentContactPicker__block_invoke_2(uint64_t a1)
{
  v1[0] = MEMORY[0x263EF8330];
  v1[1] = 3221225472;
  v1[2] = __55__AFUIAutofillContactsController__presentContactPicker__block_invoke_3;
  v1[3] = &unk_2652491A8;
  long long v2 = *(_OWORD *)(a1 + 32);
  dispatch_async(MEMORY[0x263EF83A0], v1);
}

void __55__AFUIAutofillContactsController__presentContactPicker__block_invoke_3(uint64_t a1)
{
  id v4 = [*(id *)(a1 + 32) presentingViewController];
  long long v2 = [*(id *)(a1 + 32) contactsController];
  v3 = [v2 allContactsViewControllerForTextContentType:*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40)];
  [v4 presentViewController:v3 animated:1 completion:&__block_literal_global_2];
}

- (void)_presentCustomizeUI
{
  id v8 = [(AFUIAutofillContactsController *)self presentingViewController];
  v3 = [(AFUIAutofillContactsController *)self contactsController];
  id v4 = [(AFUIAutofillContactsController *)self documentTraits];
  id v5 = [v4 textInputTraits];
  v6 = [v5 textContentType];
  uint64_t v7 = [v3 meCardViewControllerForTextContentType:v6];
  [v8 presentViewController:v7 animated:1 completion:&__block_literal_global_24];
}

- (AFUIModalUIDelegate)modalUIDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->modalUIDelegate);

  return (AFUIModalUIDelegate *)WeakRetained;
}

- (void)setModalUIDelegate:(id)a3
{
}

- (RTIDocumentTraits)documentTraits
{
  return self->_documentTraits;
}

- (void)setDocumentTraits:(id)a3
{
}

- (id)performTextOperations
{
  return self->_performTextOperations;
}

- (void)setPerformTextOperations:(id)a3
{
}

- (AFUIContactsController)contactsController
{
  return self->_contactsController;
}

- (void)setContactsController:(id)a3
{
}

- (BOOL)hasSuggestions
{
  return self->_hasSuggestions;
}

- (void)setHasSuggestions:(BOOL)a3
{
  self->_hasSuggestions = a3;
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
  objc_storeStrong((id *)&self->_contactsController, 0);
  objc_storeStrong(&self->_performTextOperations, 0);
  objc_storeStrong((id *)&self->_documentTraits, 0);

  objc_destroyWeak((id *)&self->modalUIDelegate);
}

@end