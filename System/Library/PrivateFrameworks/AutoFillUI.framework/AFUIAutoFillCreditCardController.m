@interface AFUIAutoFillCreditCardController
+ (id)dateStringTextContentType:(id)a3 date:(id)a4 placeholderHint:(id)a5;
- (AFUIAutoFillCreditCardController)initWithDocumentTraits:(id)a3 documentState:(id)a4 presentingViewController:(id)a5 textOperationsHandler:(id)a6;
- (AFUIModalUIDelegate)modalUIDelegate;
- (BOOL)hasSuggestions;
- (RTIDocumentState)documentState;
- (RTIDocumentTraits)documentTraits;
- (UIViewController)presentingViewController;
- (double)_maximumSuggestionsForReturnedSuggestions:(double)a3;
- (id)_menuUIElementsForSuggestions:(id)a3;
- (id)performTextOperations;
- (void)_generateSuggestions:(id)a3;
- (void)_openSettings;
- (void)_performTextOperationsWithSuggestion:(id)a3;
- (void)setDocumentState:(id)a3;
- (void)setDocumentTraits:(id)a3;
- (void)setHasSuggestions:(BOOL)a3;
- (void)setModalUIDelegate:(id)a3;
- (void)setPerformTextOperations:(id)a3;
- (void)setPresentingViewController:(id)a3;
@end

@implementation AFUIAutoFillCreditCardController

- (AFUIAutoFillCreditCardController)initWithDocumentTraits:(id)a3 documentState:(id)a4 presentingViewController:(id)a5 textOperationsHandler:(id)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  v20.receiver = self;
  v20.super_class = (Class)AFUIAutoFillCreditCardController;
  v15 = [(AFUIAutoFillCreditCardController *)&v20 init];
  v16 = v15;
  if (v15)
  {
    objc_storeStrong((id *)&v15->_documentState, a4);
    objc_storeStrong((id *)&v16->_documentTraits, a3);
    uint64_t v17 = MEMORY[0x24C589E40](v14);
    id performTextOperations = v16->_performTextOperations;
    v16->_id performTextOperations = (id)v17;

    objc_storeWeak((id *)&v16->_presentingViewController, v13);
  }

  return v16;
}

- (double)_maximumSuggestionsForReturnedSuggestions:(double)a3
{
  v4 = [(AFUIAutoFillCreditCardController *)self presentingViewController];
  v5 = [v4 view];
  v6 = [v5 window];
  v7 = [v6 windowScene];
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
  id v4 = a3;
  objc_initWeak(&location, self);
  v5 = [MEMORY[0x263F295C8] sharedInstance];
  v6 = [(AFUIAutoFillCreditCardController *)self documentState];
  v7 = [v6 documentState];
  double v8 = [v7 contextBeforeInput];

  v9 = [(AFUIAutoFillCreditCardController *)self documentTraits];
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __57__AFUIAutoFillCreditCardController__generateSuggestions___block_invoke;
  v11[3] = &unk_2652495A0;
  id v10 = v4;
  id v12 = v10;
  objc_copyWeak(&v13, &location);
  [v5 generateAutoFillSuggestionsWithAutoFillMode:9 textPrefix:v8 documentTraits:v9 completionHandler:v11];

  objc_destroyWeak(&v13);
  objc_destroyWeak(&location);
}

void __57__AFUIAutoFillCreditCardController__generateSuggestions___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2 = *(void *)(a1 + 32);
  v3 = (id *)(a1 + 40);
  id v4 = a2;
  id WeakRetained = objc_loadWeakRetained(v3);
  v5 = [WeakRetained _menuUIElementsForSuggestions:v4];

  (*(void (**)(uint64_t, void *))(v2 + 16))(v2, v5);
}

- (id)_menuUIElementsForSuggestions:(id)a3
{
  val = self;
  v44[1] = *MEMORY[0x263EF8340];
  id v36 = a3;
  v37 = [MEMORY[0x263EFF980] array];
  objc_initWeak(&location, val);
  [(AFUIAutoFillCreditCardController *)val setHasSuggestions:0];
  v35 = [MEMORY[0x263F827E8] systemImageNamed:@"creditcard"];
  -[AFUIAutoFillCreditCardController _maximumSuggestionsForReturnedSuggestions:](val, "_maximumSuggestionsForReturnedSuggestions:", (double)(unint64_t)[v36 count]);
  double v4 = v3;
  if (v3 > 0.0)
  {
    uint64_t v5 = 0;
    do
    {
      v6 = objc_msgSend(v36, "objectAtIndex:", v5, val);
      v7 = [v6 creditCardPayload];
      double v8 = (void *)[v7 mutableCopy];

      v9 = [v8 objectForKey:@"cc-exp"];
      if (v9)
      {
        id v10 = +[AFUIAutoFillCreditCardController dateStringTextContentType:@"cc-exp" date:v9 placeholderHint:0];
        [v8 setObject:v10 forKey:@"cc-exp"];

        id v11 = +[AFUIAutoFillCreditCardController dateStringTextContentType:@"cc-exp-month" date:v9 placeholderHint:0];
        [v8 setObject:v11 forKey:@"cc-exp-month"];

        id v12 = +[AFUIAutoFillCreditCardController dateStringTextContentType:@"cc-exp-year" date:v9 placeholderHint:0];
        [v8 setObject:v12 forKey:@"cc-exp-year"];
      }
      id v13 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
      id v14 = [v13 localizedStringForKey:@"Ending in " value:&stru_26FCB6C48 table:@"Localizable"];

      v15 = [v6 subTitle];
      v16 = [v14 stringByAppendingString:v15];

      id v17 = objc_alloc(MEMORY[0x263F295C0]);
      v18 = [v6 title];
      v19 = [v6 subTitle];
      objc_super v20 = objc_msgSend(v17, "initWithTitle:subTitle:creditCardPayload:customInfoType:", v18, v19, v8, objc_msgSend(v6, "customInfoType"));

      v21 = (void *)MEMORY[0x263F823D0];
      v40[0] = MEMORY[0x263EF8330];
      v40[1] = 3221225472;
      v40[2] = __66__AFUIAutoFillCreditCardController__menuUIElementsForSuggestions___block_invoke;
      v40[3] = &unk_265248F70;
      objc_copyWeak(&v42, &location);
      id v22 = v20;
      id v41 = v22;
      v23 = [v21 actionWithHandler:v40];
      v24 = [v6 title];
      [v23 setTitle:v24];

      [v23 setSubtitle:v16];
      [v23 setImage:v35];
      [v37 addObject:v23];

      objc_destroyWeak(&v42);
      ++v5;
    }
    while (v4 > (double)(int)v5);
  }
  [(AFUIAutoFillCreditCardController *)val setHasSuggestions:v4 > 0.0];
  v25 = (void *)MEMORY[0x263F823D0];
  v38[0] = MEMORY[0x263EF8330];
  v38[1] = 3221225472;
  v38[2] = __66__AFUIAutoFillCreditCardController__menuUIElementsForSuggestions___block_invoke_2;
  v38[3] = &unk_265248F98;
  objc_copyWeak(&v39, &location);
  v26 = [v25 actionWithHandler:v38];
  v27 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  v28 = [v27 localizedStringForKey:@"Manage Cards…" value:&stru_26FCB6C48 table:@"Localizable"];
  [v26 setTitle:v28];

  v29 = (void *)MEMORY[0x263F82940];
  v44[0] = v26;
  v30 = [MEMORY[0x263EFF8C0] arrayWithObjects:v44 count:1];
  v31 = [v29 menuWithTitle:&stru_26FCB6C48 image:0 identifier:0 options:1 children:v30];

  [v37 addObject:v31];
  v32 = [MEMORY[0x263F82940] menuWithChildren:v37];

  objc_destroyWeak(&v39);
  objc_destroyWeak(&location);

  return v32;
}

void __66__AFUIAutoFillCreditCardController__menuUIElementsForSuggestions___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  [WeakRetained _performTextOperationsWithSuggestion:*(void *)(a1 + 32)];
}

void __66__AFUIAutoFillCreditCardController__menuUIElementsForSuggestions___block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _openSettings];
}

+ (id)dateStringTextContentType:(id)a3 date:(id)a4 placeholderHint:(id)a5
{
  id v6 = a3;
  v7 = (objc_class *)MEMORY[0x263EFF8F0];
  id v8 = a4;
  id v9 = [v7 alloc];
  id v10 = (void *)[v9 initWithCalendarIdentifier:*MEMORY[0x263EFF3F8]];
  id v11 = [v10 components:12 fromDate:v8];

  if ([v6 isEqualToString:@"cc-exp"])
  {
    objc_msgSend(NSString, "stringWithFormat:", @"%02ld/%02ld", objc_msgSend(v11, "month"), objc_msgSend(v11, "year"));
    id v14 = LABEL_8:;
    goto LABEL_9;
  }
  if ([v6 isEqualToString:@"cc-exp-month"])
  {
    id v12 = NSString;
    uint64_t v13 = [v11 month];
LABEL_7:
    objc_msgSend(v12, "stringWithFormat:", @"%02ld", v13, v16);
    goto LABEL_8;
  }
  if ([v6 isEqualToString:@"cc-exp-year"])
  {
    id v12 = NSString;
    uint64_t v13 = [v11 year];
    goto LABEL_7;
  }
  id v14 = 0;
LABEL_9:

  return v14;
}

- (void)_performTextOperationsWithSuggestion:(id)a3
{
  id v4 = a3;
  v16[0] = MEMORY[0x263EF8330];
  v16[1] = 3221225472;
  v16[2] = __73__AFUIAutoFillCreditCardController__performTextOperationsWithSuggestion___block_invoke;
  v16[3] = &unk_265249060;
  v16[4] = self;
  id v5 = v4;
  id v17 = v5;
  id v6 = (void *)MEMORY[0x24C589E40](v16);
  v7 = self->_documentTraits;
  id v8 = [(AFUIAutoFillCreditCardController *)self modalUIDelegate];
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __73__AFUIAutoFillCreditCardController__performTextOperationsWithSuggestion___block_invoke_3;
  v12[3] = &unk_265249088;
  id v13 = v5;
  id v14 = v7;
  id v15 = v6;
  id v9 = v6;
  id v10 = v7;
  id v11 = v5;
  [v8 authenticationWillBeginForSessionUUID:0 completion:v12];
}

void __73__AFUIAutoFillCreditCardController__performTextOperationsWithSuggestion___block_invoke(uint64_t a1, char a2)
{
  id v4 = [*(id *)(a1 + 32) modalUIDelegate];
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __73__AFUIAutoFillCreditCardController__performTextOperationsWithSuggestion___block_invoke_2;
  v7[3] = &unk_265249038;
  char v10 = a2;
  id v5 = *(id *)(a1 + 40);
  uint64_t v6 = *(void *)(a1 + 32);
  id v8 = v5;
  uint64_t v9 = v6;
  [v4 authenticationDidEndForSessionUUID:0 completion:v7];
}

void __73__AFUIAutoFillCreditCardController__performTextOperationsWithSuggestion___block_invoke_2(uint64_t a1)
{
  if (*(unsigned char *)(a1 + 48))
  {
    id v15 = objc_alloc_init(MEMORY[0x263F63758]);
    uint64_t v2 = [*(id *)(a1 + 32) creditCardPayload];
    double v3 = (void *)[v2 mutableCopy];
    id v4 = [v15 keyboardOutput];
    [v4 setCustomInfo:v3];

    id v5 = [*(id *)(a1 + 32) creditCardPayload];
    uint64_t v6 = [*(id *)(a1 + 40) documentTraits];
    v7 = [v6 textInputTraits];
    id v8 = [v7 textContentType];
    uint64_t v9 = [v5 objectForKey:v8];

    if (!v9)
    {
      char v10 = [*(id *)(a1 + 32) creditCardPayload];
      uint64_t v9 = [v10 objectForKey:*MEMORY[0x263F294C8]];
    }
    id v11 = [*(id *)(a1 + 40) documentTraits];
    [v15 _assertOrInsertText:v9 documentTraits:v11];

    id v12 = [v15 keyboardOutput];
    id v13 = [v12 customInfo];
    [v13 setObject:v9 forKey:*MEMORY[0x263F29540]];

    id v14 = [*(id *)(a1 + 40) performTextOperations];
    ((void (**)(void, id))v14)[2](v14, v15);
  }
}

void __73__AFUIAutoFillCreditCardController__performTextOperationsWithSuggestion___block_invoke_3(void *a1)
{
  uint64_t v2 = [MEMORY[0x263F295C8] sharedInstance];
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

- (void)_openSettings
{
  uint64_t v5 = 0;
  id v6 = &v5;
  uint64_t v7 = 0x2050000000;
  uint64_t v2 = (void *)getSFSafariCreditCardStoreClass_softClass_0;
  uint64_t v8 = getSFSafariCreditCardStoreClass_softClass_0;
  if (!getSFSafariCreditCardStoreClass_softClass_0)
  {
    v4[0] = MEMORY[0x263EF8330];
    v4[1] = 3221225472;
    v4[2] = __getSFSafariCreditCardStoreClass_block_invoke_0;
    v4[3] = &unk_265249370;
    v4[4] = &v5;
    __getSFSafariCreditCardStoreClass_block_invoke_0((uint64_t)v4);
    uint64_t v2 = (void *)v6[3];
  }
  id v3 = v2;
  _Block_object_dispose(&v5, 8);
  if (objc_opt_respondsToSelector()) {
    [v3 showCreditCardSettings];
  }
}

- (AFUIModalUIDelegate)modalUIDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->modalUIDelegate);

  return (AFUIModalUIDelegate *)WeakRetained;
}

- (void)setModalUIDelegate:(id)a3
{
}

- (RTIDocumentState)documentState
{
  return self->_documentState;
}

- (void)setDocumentState:(id)a3
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
  objc_storeStrong(&self->_performTextOperations, 0);
  objc_storeStrong((id *)&self->_documentTraits, 0);
  objc_storeStrong((id *)&self->_documentState, 0);

  objc_destroyWeak((id *)&self->modalUIDelegate);
}

@end