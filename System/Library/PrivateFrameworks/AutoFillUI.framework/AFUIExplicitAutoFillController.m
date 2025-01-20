@interface AFUIExplicitAutoFillController
+ (BOOL)isCreditCardAuthenticationOngoing;
+ (BOOL)isExplicitAutoFillInvocationWithDocumentTraits:(id)a3;
+ (void)setIsCreditCardAuthenticationOngoing:(BOOL)a3;
- (AFUIExplicitAutoFillController)init;
- (AFUIExplicitAutoFillController)initWithDocumentTraits:(id)a3 documentState:(id)a4 keyboardOutputHandler:(id)a5;
- (AFUIExplicitAutoFillController)initWithDocumentTraits:(id)a3 documentState:(id)a4 textOperationsHandler:(id)a5;
- (AFUIModalUIDelegate)delegate;
- (BOOL)isCreditCardAuthenticationOngoing;
- (BOOL)isSingleLineDocument;
- (NSLock)authLock;
- (void)_finishWithSelectedCredential:(id)a3;
- (void)_finishWithStringValue:(id)a3;
- (void)_generateSuggestions:(id)a3;
- (void)_showContactsPanelFromViewController:(id)a3;
- (void)_showCreditCardsPanelFromViewController:(id)a3;
- (void)_showPasswordsPanelFromViewController:(id)a3;
- (void)authenticationDidEndForSessionUUID:(id)a3 completion:(id)a4;
- (void)authenticationWillBeginForSessionUUID:(id)a3 completion:(id)a4;
- (void)contactPickerDidCancel;
- (void)contactsUIDidEndForSessionUUID:(id)a3 completion:(id)a4;
- (void)contactsUIWillBeginForSessionUUID:(id)a3 completion:(id)a4;
- (void)creditCardsUIDidEndForSessionUUID:(id)a3 completion:(id)a4;
- (void)creditCardsUIWillBeginForSessionUUID:(id)a3 completion:(id)a4;
- (void)passwordsController:(id)a3 fillPassword:(id)a4;
- (void)passwordsController:(id)a3 fillText:(id)a4;
- (void)passwordsController:(id)a3 fillUsername:(id)a4;
- (void)passwordsController:(id)a3 fillVerificationCode:(id)a4;
- (void)passwordsController:(id)a3 selectedCredential:(id)a4;
- (void)passwordsControllerDidFinish:(id)a3;
- (void)passwordsUIDidEndForSessionUUID:(id)a3 completion:(id)a4;
- (void)passwordsUIWillBeginForSessionUUID:(id)a3 completion:(id)a4;
- (void)presentFromViewController:(id)a3;
- (void)setAuthLock:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setIsCreditCardAuthenticationOngoing:(BOOL)a3;
- (void)userSelectedContactProperties:(id)a3;
@end

@implementation AFUIExplicitAutoFillController

- (AFUIExplicitAutoFillController)init
{
  v6.receiver = self;
  v6.super_class = (Class)AFUIExplicitAutoFillController;
  v2 = [(AFUIExplicitAutoFillController *)&v6 init];
  if (v2)
  {
    v3 = (NSLock *)objc_alloc_init(MEMORY[0x263F08958]);
    authLock = v2->_authLock;
    v2->_authLock = v3;
  }
  return v2;
}

- (AFUIExplicitAutoFillController)initWithDocumentTraits:(id)a3 documentState:(id)a4 textOperationsHandler:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v20.receiver = self;
  v20.super_class = (Class)AFUIExplicitAutoFillController;
  v11 = [(AFUIExplicitAutoFillController *)&v20 init];
  if (v11)
  {
    uint64_t v12 = [v8 copy];
    documentTraits = v11->_documentTraits;
    v11->_documentTraits = (RTIDocumentTraits *)v12;

    uint64_t v14 = [v9 copy];
    documentState = v11->_documentState;
    v11->_documentState = (RTIDocumentState *)v14;

    uint64_t v16 = MEMORY[0x24C589E40](v10);
    id textOperationsHandler = v11->_textOperationsHandler;
    v11->_id textOperationsHandler = (id)v16;

    v18 = v11;
  }

  return v11;
}

- (AFUIExplicitAutoFillController)initWithDocumentTraits:(id)a3 documentState:(id)a4 keyboardOutputHandler:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v20.receiver = self;
  v20.super_class = (Class)AFUIExplicitAutoFillController;
  v11 = [(AFUIExplicitAutoFillController *)&v20 init];
  if (v11)
  {
    uint64_t v12 = [v8 copy];
    documentTraits = v11->_documentTraits;
    v11->_documentTraits = (RTIDocumentTraits *)v12;

    uint64_t v14 = [v9 copy];
    documentState = v11->_documentState;
    v11->_documentState = (RTIDocumentState *)v14;

    uint64_t v16 = MEMORY[0x24C589E40](v10);
    id keyboardOutputHandler = v11->_keyboardOutputHandler;
    v11->_id keyboardOutputHandler = (id)v16;

    v18 = v11;
  }

  return v11;
}

+ (BOOL)isExplicitAutoFillInvocationWithDocumentTraits:(id)a3
{
  return [a3 _isExplicitAutoFillInvocation];
}

- (void)presentFromViewController:(id)a3
{
  id v7 = a3;
  uint64_t v4 = [(RTIDocumentTraits *)self->_documentTraits autofillMode];
  if (v4 == 1)
  {
    [(AFUIExplicitAutoFillController *)self _showPasswordsPanelFromViewController:v7];
    goto LABEL_8;
  }
  if (v4 == 9)
  {
    [(AFUIExplicitAutoFillController *)self _showCreditCardsPanelFromViewController:v7];
    goto LABEL_8;
  }
  BOOL v5 = v4 == 7;
  objc_super v6 = v7;
  if (v5)
  {
    [(AFUIExplicitAutoFillController *)self _showContactsPanelFromViewController:v7];
LABEL_8:
    objc_super v6 = v7;
  }
}

- (void)authenticationWillBeginForSessionUUID:(id)a3 completion:(id)a4
{
  if (a4) {
    (*((void (**)(id))a4 + 2))(a4);
  }
}

- (void)authenticationDidEndForSessionUUID:(id)a3 completion:(id)a4
{
  if (a4) {
    (*((void (**)(id))a4 + 2))(a4);
  }
}

- (void)contactsUIWillBeginForSessionUUID:(id)a3 completion:(id)a4
{
  if (a4) {
    (*((void (**)(id))a4 + 2))(a4);
  }
}

- (void)contactsUIDidEndForSessionUUID:(id)a3 completion:(id)a4
{
  if (a4) {
    (*((void (**)(id))a4 + 2))(a4);
  }
}

- (void)passwordsUIWillBeginForSessionUUID:(id)a3 completion:(id)a4
{
  if (a4) {
    (*((void (**)(id))a4 + 2))(a4);
  }
}

- (void)passwordsUIDidEndForSessionUUID:(id)a3 completion:(id)a4
{
  if (a4) {
    (*((void (**)(id))a4 + 2))(a4);
  }
}

- (void)creditCardsUIWillBeginForSessionUUID:(id)a3 completion:(id)a4
{
  if (a4) {
    (*((void (**)(id))a4 + 2))(a4);
  }
}

- (void)creditCardsUIDidEndForSessionUUID:(id)a3 completion:(id)a4
{
  if (a4) {
    (*((void (**)(id))a4 + 2))(a4);
  }
}

- (void)_showPasswordsPanelFromViewController:(id)a3
{
  id v4 = a3;
  if (!self->_passwordsController)
  {
    BOOL v5 = [[AFUIPasswordsController alloc] initWithDocumentTraits:self->_documentTraits];
    passwordsController = self->_passwordsController;
    self->_passwordsController = v5;

    [(AFUIPasswordsController *)self->_passwordsController setPasswordPickerDelegate:self];
  }
  uint64_t v7 = [(AFUIExplicitAutoFillController *)self delegate];
  id v8 = (void *)v7;
  if (v7) {
    id v9 = (AFUIExplicitAutoFillController *)v7;
  }
  else {
    id v9 = self;
  }
  id v10 = v9;

  [(AFUIExplicitAutoFillController *)v10 passwordsUIWillBeginForSessionUUID:0 completion:0];
  v13[0] = MEMORY[0x263EF8330];
  v13[1] = 3221225472;
  v13[2] = __72__AFUIExplicitAutoFillController__showPasswordsPanelFromViewController___block_invoke;
  v13[3] = &unk_265249138;
  v13[4] = self;
  id v14 = v4;
  v15 = v10;
  v11 = v10;
  id v12 = v4;
  [(AFUIExplicitAutoFillController *)v11 authenticationWillBeginForSessionUUID:0 completion:v13];
}

void __72__AFUIExplicitAutoFillController__showPasswordsPanelFromViewController___block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 40);
  v2 = *(void **)(*(void *)(a1 + 32) + 48);
  v3[0] = MEMORY[0x263EF8330];
  v3[1] = 3221225472;
  v3[2] = __72__AFUIExplicitAutoFillController__showPasswordsPanelFromViewController___block_invoke_2;
  v3[3] = &unk_265249280;
  id v4 = *(id *)(a1 + 48);
  [v2 presentPasswordPickerFromViewController:v1 didFinishAuthenticationBlock:v3];
}

uint64_t __72__AFUIExplicitAutoFillController__showPasswordsPanelFromViewController___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) authenticationDidEndForSessionUUID:0 completion:&__block_literal_global_11];
}

- (void)_showContactsPanelFromViewController:(id)a3
{
  id v4 = a3;
  if (!self->_contactsController)
  {
    BOOL v5 = objc_alloc_init(AFUIContactsController);
    contactsController = self->_contactsController;
    self->_contactsController = v5;

    [(AFUIContactsController *)self->_contactsController setContactPropertyPickerDelegate:self];
    [(AFUIContactsController *)self->_contactsController setAlwaysAllowsNamePicking:1];
  }
  uint64_t v7 = [(AFUIExplicitAutoFillController *)self delegate];

  if (v7)
  {
    id v8 = [(AFUIExplicitAutoFillController *)self delegate];
    v10[0] = MEMORY[0x263EF8330];
    v10[1] = 3221225472;
    v10[2] = __71__AFUIExplicitAutoFillController__showContactsPanelFromViewController___block_invoke;
    v10[3] = &unk_265249460;
    id v11 = v4;
    id v12 = self;
    [v8 contactsUIWillBeginForSessionUUID:0 completion:v10];
  }
  else
  {
    id v9 = [(AFUIContactsController *)self->_contactsController allContactsViewControllerForTextContentType:0];
    [v4 presentViewController:v9 animated:1 completion:&__block_literal_global_6];
  }
}

void __71__AFUIExplicitAutoFillController__showContactsPanelFromViewController___block_invoke(uint64_t a1)
{
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __71__AFUIExplicitAutoFillController__showContactsPanelFromViewController___block_invoke_2;
  v4[3] = &unk_265249460;
  id v2 = *(id *)(a1 + 32);
  uint64_t v3 = *(void *)(a1 + 40);
  id v5 = v2;
  uint64_t v6 = v3;
  dispatch_async(MEMORY[0x263EF83A0], v4);
}

void __71__AFUIExplicitAutoFillController__showContactsPanelFromViewController___block_invoke_2(uint64_t a1)
{
  uint64_t v1 = *(void **)(a1 + 32);
  id v2 = [*(id *)(*(void *)(a1 + 40) + 40) allContactsViewControllerForTextContentType:0];
  [v1 presentViewController:v2 animated:1 completion:&__block_literal_global_4_0];
}

+ (BOOL)isCreditCardAuthenticationOngoing
{
  return _isCreditCardAuthenticationOngoing;
}

+ (void)setIsCreditCardAuthenticationOngoing:(BOOL)a3
{
  _isCreditCardAuthenticationOngoing = a3;
}

- (void)_showCreditCardsPanelFromViewController:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (!self->_creditCardViewController)
  {
    v6[0] = MEMORY[0x263EF8330];
    v6[1] = 3221225472;
    v6[2] = __74__AFUIExplicitAutoFillController__showCreditCardsPanelFromViewController___block_invoke;
    v6[3] = &unk_265249748;
    v6[4] = self;
    id v7 = v4;
    [(AFUIExplicitAutoFillController *)self _generateSuggestions:v6];
  }
}

void __74__AFUIExplicitAutoFillController__showCreditCardsPanelFromViewController___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [AFUICreditCardViewController alloc];
  id v5 = *(void **)(a1 + 32);
  uint64_t v6 = v5[1];
  uint64_t v7 = v5[2];
  uint64_t v8 = v5[3];
  id v9 = [v5 delegate];
  uint64_t v10 = [(AFUICreditCardViewController *)v4 initWithDocumentTraits:v6 documentState:v7 textOperationsHandler:v8 modalUIDelegate:v9 suggestions:v3];

  uint64_t v11 = *(void *)(a1 + 32);
  id v12 = *(void **)(v11 + 56);
  *(void *)(v11 + 56) = v10;

  v13 = [*(id *)(a1 + 32) delegate];

  if (v13)
  {
    id v14 = [*(id *)(a1 + 32) delegate];
    [v14 creditCardsUIWillBeginForSessionUUID:0 completion:0];

    v17[0] = MEMORY[0x263EF8330];
    v17[1] = 3221225472;
    v17[2] = __74__AFUIExplicitAutoFillController__showCreditCardsPanelFromViewController___block_invoke_2;
    v17[3] = &unk_265249460;
    id v15 = *(id *)(a1 + 40);
    uint64_t v16 = *(void *)(a1 + 32);
    id v18 = v15;
    uint64_t v19 = v16;
    dispatch_async(MEMORY[0x263EF83A0], v17);
  }
}

uint64_t __74__AFUIExplicitAutoFillController__showCreditCardsPanelFromViewController___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) presentViewController:*(void *)(*(void *)(a1 + 40) + 56) animated:1 completion:0];
}

- (void)_finishWithStringValue:(id)a3
{
  id v13 = a3;
  [(AFUIExplicitAutoFillController *)self _yieldToClientApplicationIfNeeded];
  if (self->_textOperationsHandler)
  {
    id v4 = objc_alloc_init(MEMORY[0x263F63758]);
    [v4 _assertOrInsertText:v13 documentTraits:self->_documentTraits];
    [v4 setIsExplicitAutoFillInvocation:1];
    id textOperationsHandler = (void (**)(id, id))self->_textOperationsHandler;
  }
  else
  {
    if (!self->_keyboardOutputHandler) {
      goto LABEL_6;
    }
    id v4 = objc_alloc_init(MEMORY[0x263F7E678]);
    [v4 setInsertionText:v13];
    uint64_t v6 = [(RTIDocumentState *)self->_documentState documentState];
    uint64_t v7 = [v6 contextBeforeInput];
    uint64_t v8 = [v7 length];
    id v9 = [(RTIDocumentState *)self->_documentState documentState];
    uint64_t v10 = [v9 contextAfterInput];
    objc_msgSend(v4, "setDeletionCount:", objc_msgSend(v10, "length") + v8);

    id textOperationsHandler = (void (**)(id, id))self->_keyboardOutputHandler;
  }
  textOperationsHandler[2](textOperationsHandler, v4);

LABEL_6:
  id v11 = self->_textOperationsHandler;
  self->_id textOperationsHandler = 0;

  id keyboardOutputHandler = self->_keyboardOutputHandler;
  self->_id keyboardOutputHandler = 0;
}

- (void)_finishWithSelectedCredential:(id)a3
{
  id v4 = a3;
  [(AFUIExplicitAutoFillController *)self _yieldToClientApplicationIfNeeded];
  id v14 = [MEMORY[0x263EFF9A0] dictionary];
  uint64_t v5 = [v4 user];
  uint64_t v6 = (void *)v5;
  if (v5) {
    uint64_t v7 = (__CFString *)v5;
  }
  else {
    uint64_t v7 = &stru_26FCB6C48;
  }
  [v14 setObject:v7 forKeyedSubscript:*MEMORY[0x263F7E820]];

  uint64_t v8 = [v4 password];

  if (v8) {
    id v9 = v8;
  }
  else {
    id v9 = &stru_26FCB6C48;
  }
  [v14 setObject:v9 forKeyedSubscript:*MEMORY[0x263F7E818]];

  if (self->_textOperationsHandler)
  {
    id v10 = objc_alloc_init(MEMORY[0x263F63758]);
    [v10 setIsExplicitAutoFillInvocation:1];
    [v10 setCustomInfo:v14];
    id textOperationsHandler = (void (**)(id, id))self->_textOperationsHandler;
  }
  else
  {
    if (!self->_keyboardOutputHandler) {
      goto LABEL_12;
    }
    id v10 = objc_alloc_init(MEMORY[0x263F7E678]);
    [v10 setCustomInfo:v14];
    id textOperationsHandler = (void (**)(id, id))self->_keyboardOutputHandler;
  }
  textOperationsHandler[2](textOperationsHandler, v10);

LABEL_12:
  id v12 = self->_textOperationsHandler;
  self->_id textOperationsHandler = 0;

  id keyboardOutputHandler = self->_keyboardOutputHandler;
  self->_id keyboardOutputHandler = 0;
}

- (BOOL)isSingleLineDocument
{
  return [(RTIDocumentTraits *)self->_documentTraits _afui_isSingleLineDocument];
}

- (void)userSelectedContactProperties:(id)a3
{
  id v25 = a3;
  [(AFUIExplicitAutoFillController *)self _yieldToClientApplicationIfNeeded];
  id v4 = [(RTIDocumentTraits *)self->_documentTraits textInputTraits];
  uint64_t v5 = [v4 textContentType];
  uint64_t v6 = [v25 objectForKeyedSubscript:v5];

  uint64_t v7 = [(RTIDocumentTraits *)self->_documentTraits textInputTraits];
  uint64_t v8 = [v7 textContentType];
  uint64_t v9 = *MEMORY[0x263F29540];
  if (([v8 isEqualToString:*MEMORY[0x263F29540]] & 1) == 0)
  {

    goto LABEL_6;
  }
  id v10 = [v25 objectForKeyedSubscript:@"didPickContactNamePropertyKey"];
  int v11 = [v10 BOOLValue];

  if (v11)
  {
    uint64_t v12 = *MEMORY[0x263F29518];
    id v13 = [v25 objectForKeyedSubscript:*MEMORY[0x263F29518]];
    uint64_t v14 = [v13 length];

    if (v14)
    {
      [v25 objectForKeyedSubscript:v12];
      uint64_t v6 = v7 = v6;
LABEL_6:
    }
  }
  if (!v6)
  {
    uint64_t v6 = [v25 objectForKeyedSubscript:v9];
    if (!v6)
    {
      uint64_t v6 = [v25 objectForKeyedSubscript:*MEMORY[0x263F29518]];
    }
  }
  if (self->_textOperationsHandler)
  {
    id v15 = objc_alloc_init(MEMORY[0x263F63758]);
    [v15 _assertOrInsertText:v6 documentTraits:self->_documentTraits];
    [v15 setIsExplicitAutoFillInvocation:1];
    id textOperationsHandler = (void (**)(id, id))self->_textOperationsHandler;
  }
  else
  {
    if (!self->_keyboardOutputHandler) {
      goto LABEL_15;
    }
    id v15 = objc_alloc_init(MEMORY[0x263F7E678]);
    [v15 setInsertionText:v6];
    v17 = [(RTIDocumentState *)self->_documentState documentState];
    id v18 = [v17 contextBeforeInput];
    uint64_t v19 = [v18 length];
    objc_super v20 = [(RTIDocumentState *)self->_documentState documentState];
    v21 = [v20 contextAfterInput];
    objc_msgSend(v15, "setDeletionCount:", objc_msgSend(v21, "length") + v19);

    id textOperationsHandler = (void (**)(id, id))self->_keyboardOutputHandler;
  }
  textOperationsHandler[2](textOperationsHandler, v15);

LABEL_15:
  id v22 = self->_textOperationsHandler;
  self->_id textOperationsHandler = 0;

  id keyboardOutputHandler = self->_keyboardOutputHandler;
  self->_id keyboardOutputHandler = 0;

  v24 = [(AFUIExplicitAutoFillController *)self delegate];
  [v24 contactsUIDidEndForSessionUUID:0 completion:0];
}

- (void)contactPickerDidCancel
{
  id v2 = [(AFUIExplicitAutoFillController *)self delegate];
  [v2 contactsUIDidEndForSessionUUID:0 completion:0];
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
  id v3 = [(AFUIExplicitAutoFillController *)self delegate];
  [v3 passwordsUIDidEndForSessionUUID:0 completion:0];
}

- (void)_generateSuggestions:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [MEMORY[0x263F295C8] sharedInstance];
  uint64_t v6 = [(RTIDocumentState *)self->_documentState documentState];
  uint64_t v7 = [v6 contextBeforeInput];

  uint64_t v8 = [MEMORY[0x263EFF980] array];
  documentTraits = self->_documentTraits;
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __55__AFUIExplicitAutoFillController__generateSuggestions___block_invoke;
  v12[3] = &unk_265249798;
  id v13 = v8;
  uint64_t v14 = self;
  id v15 = v4;
  id v10 = v4;
  id v11 = v8;
  [v5 generateAutoFillSuggestionsWithAutoFillMode:9 textPrefix:v7 documentTraits:documentTraits completionHandler:v12];
}

void __55__AFUIExplicitAutoFillController__generateSuggestions___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  [*(id *)(a1 + 32) addObjectsFromArray:v3];
  id v4 = [*(id *)(a1 + 40) delegate];
  uint64_t v5 = v4;
  if (!v4) {
    uint64_t v5 = *(void **)(a1 + 40);
  }
  id v6 = v5;

  if ([*(id *)(a1 + 32) count])
  {
    v20[0] = MEMORY[0x263EF8330];
    v20[1] = 3221225472;
    v20[2] = __55__AFUIExplicitAutoFillController__generateSuggestions___block_invoke_2;
    v20[3] = &unk_265249770;
    uint64_t v7 = *(void **)(a1 + 48);
    v20[4] = *(void *)(a1 + 40);
    id v22 = v7;
    id v21 = *(id *)(a1 + 32);
    uint64_t v8 = (void *)MEMORY[0x24C589E40](v20);
    uint64_t v9 = [v3 objectAtIndex:0];
    id v10 = *(id *)(*(void *)(a1 + 40) + 8);
    v16[0] = MEMORY[0x263EF8330];
    v16[1] = 3221225472;
    v16[2] = __55__AFUIExplicitAutoFillController__generateSuggestions___block_invoke_4;
    v16[3] = &unk_265249438;
    v16[4] = *(void *)(a1 + 40);
    id v17 = v9;
    id v18 = v10;
    id v19 = v8;
    id v11 = v8;
    id v12 = v10;
    id v13 = v9;
    [v6 authenticationWillBeginForSessionUUID:0 completion:v16];
  }
  else
  {
    uint64_t v14 = *(void *)(a1 + 48);
    id v15 = (void *)[*(id *)(a1 + 32) copy];
    (*(void (**)(uint64_t, void *))(v14 + 16))(v14, v15);
  }
}

void __55__AFUIExplicitAutoFillController__generateSuggestions___block_invoke_2(uint64_t a1, int a2)
{
  id v4 = [*(id *)(a1 + 32) delegate];
  [v4 authenticationDidEndForSessionUUID:0 completion:&__block_literal_global_16];

  +[AFUIExplicitAutoFillController setIsCreditCardAuthenticationOngoing:0];
  if (a2)
  {
    uint64_t v5 = *(void *)(a1 + 48);
    id v6 = (id)[*(id *)(a1 + 40) copy];
    (*(void (**)(uint64_t, id))(v5 + 16))(v5, v6);
  }
}

void __55__AFUIExplicitAutoFillController__generateSuggestions___block_invoke_4(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) authLock];
  [v2 lock];

  if (+[AFUIExplicitAutoFillController isCreditCardAuthenticationOngoing])
  {
    id v11 = [*(id *)(a1 + 32) authLock];
    [v11 unlock];
  }
  else
  {
    +[AFUIExplicitAutoFillController setIsCreditCardAuthenticationOngoing:1];
    id v3 = [MEMORY[0x263F295C8] sharedInstance];
    char v4 = objc_opt_respondsToSelector();

    uint64_t v5 = [MEMORY[0x263F295C8] sharedInstance];
    uint64_t v6 = *(void *)(a1 + 40);
    if (v4)
    {
      v14[0] = MEMORY[0x263EF8330];
      v14[1] = 3221225472;
      v14[2] = __55__AFUIExplicitAutoFillController__generateSuggestions___block_invoke_5;
      v14[3] = &unk_265249320;
      uint64_t v7 = *(void *)(a1 + 48);
      id v8 = *(id *)(a1 + 56);
      v14[4] = *(void *)(a1 + 32);
      id v15 = v8;
      [v5 authenticateIfNecessaryForSuggestion:v6 documentTraits:v7 completionHandler:v14];

      uint64_t v9 = v15;
    }
    else
    {
      v12[0] = MEMORY[0x263EF8330];
      v12[1] = 3221225472;
      v12[2] = __55__AFUIExplicitAutoFillController__generateSuggestions___block_invoke_6;
      v12[3] = &unk_265249320;
      id v10 = *(id *)(a1 + 56);
      void v12[4] = *(void *)(a1 + 32);
      id v13 = v10;
      [v5 shouldAcceptSuggestion:v6 completionHandler:v12];

      uint64_t v9 = v13;
    }
  }
}

void __55__AFUIExplicitAutoFillController__generateSuggestions___block_invoke_5(uint64_t a1)
{
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  id v2 = [*(id *)(a1 + 32) authLock];
  [v2 unlock];
}

void __55__AFUIExplicitAutoFillController__generateSuggestions___block_invoke_6(uint64_t a1)
{
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  id v2 = [*(id *)(a1 + 32) authLock];
  [v2 unlock];
}

- (AFUIModalUIDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (AFUIModalUIDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (BOOL)isCreditCardAuthenticationOngoing
{
  return self->_isCreditCardAuthenticationOngoing;
}

- (void)setIsCreditCardAuthenticationOngoing:(BOOL)a3
{
  self->_isCreditCardAuthenticationOngoing = a3;
}

- (NSLock)authLock
{
  return self->_authLock;
}

- (void)setAuthLock:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_authLock, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_creditCardViewController, 0);
  objc_storeStrong((id *)&self->_passwordsController, 0);
  objc_storeStrong((id *)&self->_contactsController, 0);
  objc_storeStrong(&self->_keyboardOutputHandler, 0);
  objc_storeStrong(&self->_textOperationsHandler, 0);
  objc_storeStrong((id *)&self->_documentState, 0);

  objc_storeStrong((id *)&self->_documentTraits, 0);
}

@end