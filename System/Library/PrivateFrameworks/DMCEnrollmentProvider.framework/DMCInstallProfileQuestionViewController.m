@interface DMCInstallProfileQuestionViewController
- (DMCInstallProfileQuestionViewController)initWithFieldCollection:(id)a3;
- (DMCInstallProfileQuestionViewController)initWithStyle:(int64_t)a3;
- (DMCInstallProfileQuestionViewController)initWithUserInput:(id)a3;
- (DMCProfileQuestionsControllerDelegate)questionsDelegate;
- (UITextField)textField;
- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4;
- (id)tableView:(id)a3 titleForFooterInSection:(int64_t)a4;
- (id)tableView:(id)a3 titleForHeaderInSection:(int64_t)a4;
- (int64_t)numberOfSectionsInTableView:(id)a3;
- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4;
- (void)_addActionForError:(unint64_t)a3 title:(id)a4 toAlert:(id)a5;
- (void)_cancelInput;
- (void)_configureQuestionField:(id)a3;
- (void)_continueOrFinish;
- (void)_continueWithCurrentField;
- (void)_didFinishPasscodePreflightWithError:(id)a3;
- (void)_didFinishPreflightWithError:(id)a3;
- (void)_finishInput;
- (void)_handleError:(unint64_t)a3;
- (void)_hideProgressIndicator;
- (void)_preflightCurrentPayload;
- (void)_processResponseAndContinue;
- (void)_retryCurrentPasswordFieldWithError:(id)a3;
- (void)_retryWithCurrentField;
- (void)_setRightButtonEnabled:(BOOL)a3;
- (void)_setup;
- (void)_showAlertForError:(id)a3;
- (void)_showNavButtonsAnimated:(BOOL)a3;
- (void)_showProgressIndicator;
- (void)_tellDelegateDidFinishWithUserInputResponses:(id)a3;
- (void)_textFieldDidChange;
- (void)_updateNavigationBar;
- (void)profileConnectionDidFinishPreflightWithError:(id)a3;
- (void)setQuestionsDelegate:(id)a3;
- (void)setTextField:(id)a3;
- (void)updateWithUserInput:(id)a3;
- (void)viewDidAppear:(BOOL)a3;
@end

@implementation DMCInstallProfileQuestionViewController

- (DMCInstallProfileQuestionViewController)initWithStyle:(int64_t)a3
{
  v6.receiver = self;
  v6.super_class = (Class)DMCInstallProfileQuestionViewController;
  v3 = [(DMCProfileTableViewController *)&v6 initWithStyle:a3];
  v4 = v3;
  if (v3) {
    [(DMCInstallProfileQuestionViewController *)v3 _setup];
  }
  return v4;
}

- (DMCInstallProfileQuestionViewController)initWithUserInput:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)DMCInstallProfileQuestionViewController;
  v5 = [(DMCProfileTableViewController *)&v9 initWithStyle:2];
  if (v5)
  {
    objc_super v6 = [[DMCFieldCollection alloc] initWithUserInput:v4];
    fieldCollection = v5->_fieldCollection;
    v5->_fieldCollection = v6;

    [(DMCInstallProfileQuestionViewController *)v5 _setup];
  }

  return v5;
}

- (DMCInstallProfileQuestionViewController)initWithFieldCollection:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)DMCInstallProfileQuestionViewController;
  objc_super v6 = [(DMCProfileTableViewController *)&v9 initWithStyle:2];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_fieldCollection, a3);
    [(DMCInstallProfileQuestionViewController *)v7 _setup];
  }

  return v7;
}

- (void)_setup
{
  v5.receiver = self;
  v5.super_class = (Class)DMCInstallProfileQuestionViewController;
  [(DMCProfileTableViewController *)&v5 updateExtendedLayoutIncludesOpaqueBars];
  v3 = [(DMCInstallProfileQuestionViewController *)self navigationItem];
  [v3 setHidesBackButton:1];

  id v4 = [(DMCInstallProfileQuestionViewController *)self navigationItem];
  [v4 setBackButtonTitle:&stru_26D435FC0];

  [(DMCInstallProfileQuestionViewController *)self _showNavButtonsAnimated:0];
  [(DMCInstallProfileQuestionViewController *)self _updateNavigationBar];
}

- (void)viewDidAppear:(BOOL)a3
{
  v5.receiver = self;
  v5.super_class = (Class)DMCInstallProfileQuestionViewController;
  [(DMCInstallProfileQuestionViewController *)&v5 viewDidAppear:a3];
  id v4 = [(DMCInstallProfileQuestionViewController *)self textField];
  [v4 becomeFirstResponder];
}

- (void)setQuestionsDelegate:(id)a3
{
  id obj = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_questionsDelegate);

  if (WeakRetained != obj)
  {
    id v5 = objc_storeWeak((id *)&self->_questionsDelegate, obj);
    [obj setCurrentQuestionsController:self];
  }
}

- (int64_t)numberOfSectionsInTableView:(id)a3
{
  return 1;
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  return 1;
}

- (id)tableView:(id)a3 titleForHeaderInSection:(int64_t)a4
{
  id v4 = [(DMCFieldCollection *)self->_fieldCollection currentField];
  id v5 = [v4 fieldDescription];

  return v5;
}

- (id)tableView:(id)a3 titleForFooterInSection:(int64_t)a4
{
  id v4 = [(DMCFieldCollection *)self->_fieldCollection currentField];
  id v5 = [v4 finePrint];

  return v5;
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  id v6 = a4;
  v7 = [a3 dequeueReusableCellWithIdentifier:@"MCProfileQuestionCell"];
  if (!v7) {
    v7 = (void *)[objc_alloc(MEMORY[0x263F1CA48]) initWithStyle:1000 reuseIdentifier:@"MCProfileQuestionCell"];
  }
  if (![v6 row])
  {
    [v7 setTextFieldOffset:0.0];
    [v7 setSelectionStyle:0];
    v8 = [v7 editableTextField];
    objc_super v9 = [MEMORY[0x263F08A00] defaultCenter];
    [v9 addObserver:self selector:sel__textFieldDidChange name:*MEMORY[0x263F1D778] object:0];

    [(DMCInstallProfileQuestionViewController *)self _configureQuestionField:v8];
    [(DMCInstallProfileQuestionViewController *)self setTextField:v8];
  }
  return v7;
}

- (void)_configureQuestionField:(id)a3
{
  fieldCollection = self->_fieldCollection;
  id v4 = a3;
  id v7 = [(DMCFieldCollection *)fieldCollection currentField];
  objc_msgSend(v4, "setSecureTextEntry:", objc_msgSend(v7, "isPassword"));
  objc_msgSend(v4, "setKeyboardType:", objc_msgSend(v7, "keyboardType"));
  objc_msgSend(v4, "setAutocapitalizationType:", objc_msgSend(v7, "capitalizationType"));
  [v4 setAutocorrectionType:1];
  [v4 setClearButtonMode:3];
  id v5 = [v7 defaultValue];
  [v4 setText:v5];

  id v6 = [v7 placeholderValue];
  [v4 setPlaceholder:v6];
}

- (void)_textFieldDidChange
{
  id v10 = [(DMCFieldCollection *)self->_fieldCollection currentField];
  if ([v10 isRequired])
  {
    v3 = [(DMCInstallProfileQuestionViewController *)self textField];
    id v4 = [v3 text];
    unint64_t v5 = [v4 length];

    id v6 = [v10 minimumLength];
    if (v6)
    {
      id v7 = [v10 minimumLength];
      BOOL v8 = v5 >= [v7 integerValue];
    }
    else
    {
      BOOL v8 = 1;
    }

    if (v5) {
      BOOL v9 = v8;
    }
    else {
      BOOL v9 = 0;
    }
    [(DMCInstallProfileQuestionViewController *)self _setRightButtonEnabled:v9];
  }
}

- (void)_preflightCurrentPayload
{
  [(DMCInstallProfileQuestionViewController *)self _showProgressIndicator];
  id v4 = [MEMORY[0x263F53C50] sharedConnection];
  v3 = [(DMCFieldCollection *)self->_fieldCollection responseDictionariesForCurrentPayload];
  objc_msgSend(v4, "preflightUserInputResponses:forPayloadIndex:", v3, -[DMCFieldCollection currentPayloadIndex](self->_fieldCollection, "currentPayloadIndex"));
}

- (void)profileConnectionDidFinishPreflightWithError:(id)a3
{
  id v4 = a3;
  [(DMCInstallProfileQuestionViewController *)self _hideProgressIndicator];
  if (self->_waitingForPasscodePreflight)
  {
    self->_waitingForPasscodePreflight = 0;
    [(DMCInstallProfileQuestionViewController *)self _didFinishPasscodePreflightWithError:v4];
  }
  else
  {
    [(DMCInstallProfileQuestionViewController *)self _didFinishPreflightWithError:v4];
  }
}

- (void)_didFinishPasscodePreflightWithError:(id)a3
{
  id v10 = a3;
  if (v10)
  {
    previousResponseValue = self->_previousResponseValue;
    self->_previousResponseValue = 0;

    [(DMCInstallProfileQuestionViewController *)self _retryCurrentPasswordFieldWithError:v10];
  }
  else
  {
    [(DMCInstallProfileQuestionViewController *)self _showNavButtonsAnimated:1];
    [(DMCInstallProfileQuestionViewController *)self _updateNavigationBar];
    unint64_t v5 = [(DMCFieldCollection *)self->_fieldCollection currentField];
    uint64_t v6 = [v5 retypeDescription];
    id v7 = (void *)v6;
    if (v6) {
      BOOL v8 = (__CFString *)v6;
    }
    else {
      BOOL v8 = &stru_26D435FC0;
    }
    [v5 setFieldDescription:v8];

    BOOL v9 = [(DMCInstallProfileQuestionViewController *)self tableView];
    [v9 reloadData];
  }
}

- (void)_didFinishPreflightWithError:(id)a3
{
  id v4 = a3;
  id v8 = v4;
  if (v4)
  {
    unint64_t v5 = [v4 userInfo];
    uint64_t v6 = [v5 objectForKey:*MEMORY[0x263F536E8]];
    if ([v6 isEqualToString:*MEMORY[0x263F536F0]])
    {
      BOOL v7 = [(DMCFieldCollection *)self->_fieldCollection currentFieldIsSinglePasswordField];

      if (v7)
      {
        [(DMCInstallProfileQuestionViewController *)self _retryCurrentPasswordFieldWithError:v8];
        goto LABEL_8;
      }
    }
    else
    {
    }
    [(DMCInstallProfileQuestionViewController *)self _showAlertForError:v8];
  }
  else
  {
    [(DMCInstallProfileQuestionViewController *)self _continueOrFinish];
  }
LABEL_8:
}

- (void)updateWithUserInput:(id)a3
{
  id v4 = a3;
  unint64_t v5 = [[DMCFieldCollection alloc] initWithUserInput:v4];

  fieldCollection = self->_fieldCollection;
  self->_fieldCollection = v5;

  [(DMCInstallProfileQuestionViewController *)self _continueWithCurrentField];
}

- (void)_processResponseAndContinue
{
  id v14 = [(DMCFieldCollection *)self->_fieldCollection currentField];
  v3 = [(DMCInstallProfileQuestionViewController *)self textField];
  id v4 = [v3 text];

  if (![v14 needsRetype])
  {
    int v5 = 0;
    goto LABEL_6;
  }
  if (!self->_previousResponseValue)
  {
    id v8 = (NSString *)[v4 copy];
    previousResponseValue = self->_previousResponseValue;
    self->_previousResponseValue = v8;

    if ([v14 isDevicePasscodeField])
    {
      [v14 setUserResponse:v4];
      int v5 = 0;
      self->_waitingForPasscodePreflight = 1;
      goto LABEL_6;
    }
    uint64_t v11 = [v14 retypeDescription];
LABEL_18:
    v12 = (void *)v11;
    if (v11) {
      v13 = (__CFString *)v11;
    }
    else {
      v13 = &stru_26D435FC0;
    }
    [v14 setFieldDescription:v13];

    [(DMCInstallProfileQuestionViewController *)self _updateNavigationBar];
    BOOL v7 = [(DMCInstallProfileQuestionViewController *)self tableView];
    [v7 reloadData];
    goto LABEL_22;
  }
  if ((objc_msgSend(v4, "isEqualToString:") & 1) == 0)
  {
    id v10 = self->_previousResponseValue;
    self->_previousResponseValue = 0;

    if ([v14 isDevicePasscodeField]) {
      [v14 setUserResponse:0];
    }
    uint64_t v11 = [v14 mismatchDescription];
    goto LABEL_18;
  }
  int v5 = [v14 isDevicePasscodeField];
  uint64_t v6 = self->_previousResponseValue;
  self->_previousResponseValue = 0;

LABEL_6:
  if (self->_waitingForPasscodePreflight || (v5 & 1) != 0)
  {
    if (!v5) {
      goto LABEL_9;
    }
LABEL_11:
    [(DMCInstallProfileQuestionViewController *)self _continueOrFinish];
    goto LABEL_23;
  }
  [v14 setUserResponse:v4];
  if (![(DMCFieldCollection *)self->_fieldCollection currentFieldIsLastInPayload]) {
    goto LABEL_11;
  }
LABEL_9:
  [(DMCInstallProfileQuestionViewController *)self _preflightCurrentPayload];
  BOOL v7 = [(DMCInstallProfileQuestionViewController *)self view];
  [v7 endEditing:1];
LABEL_22:

LABEL_23:
}

- (void)_setRightButtonEnabled:(BOOL)a3
{
  BOOL v3 = a3;
  id v5 = [(DMCInstallProfileQuestionViewController *)self navigationItem];
  id v4 = [v5 rightBarButtonItem];
  [v4 setEnabled:v3];
}

- (void)_showProgressIndicator
{
  BOOL v3 = [(DMCInstallProfileQuestionViewController *)self navigationItem];
  [v3 setLeftBarButtonItem:0 animated:0];

  id v4 = [(DMCInstallProfileQuestionViewController *)self navigationItem];
  [v4 setRightBarButtonItem:0 animated:0];

  [(DMCProfileTableViewController *)self showProgressInNavBar];
}

- (void)_hideProgressIndicator
{
}

- (void)_showNavButtonsAnimated:(BOOL)a3
{
  BOOL v3 = a3;
  id v5 = objc_alloc(MEMORY[0x263F1C468]);
  uint64_t v6 = DMCEnrollmentLocalizedString(@"DMC_GENERAL_NEXT");
  id v10 = (id)[v5 initWithTitle:v6 style:0 target:self action:sel__processResponseAndContinue];

  BOOL v7 = (void *)[objc_alloc(MEMORY[0x263F1C468]) initWithBarButtonSystemItem:1 target:self action:sel__cancelInput];
  id v8 = [(DMCInstallProfileQuestionViewController *)self navigationItem];
  [v8 setRightBarButtonItem:v10 animated:v3];

  BOOL v9 = [(DMCInstallProfileQuestionViewController *)self navigationItem];
  [v9 setLeftBarButtonItem:v7 animated:v3];
}

- (void)_updateNavigationBar
{
  id v9 = [(DMCFieldCollection *)self->_fieldCollection currentField];
  if ([(DMCFieldCollection *)self->_fieldCollection currentFieldIsFinalField]
    && (![v9 needsRetype] || self->_previousResponseValue))
  {
    BOOL v3 = [(DMCInstallProfileQuestionViewController *)self navigationItem];
    id v4 = [v3 rightBarButtonItem];
    [v4 setStyle:2];
  }
  if ([v9 isRequired])
  {
    id v5 = [v9 defaultValue];
    uint64_t v6 = [v5 length];

    if (!v6) {
      [(DMCInstallProfileQuestionViewController *)self _setRightButtonEnabled:0];
    }
  }
  BOOL v7 = [v9 title];
  id v8 = [(DMCInstallProfileQuestionViewController *)self navigationItem];
  [v8 setTitle:v7];
}

- (void)_tellDelegateDidFinishWithUserInputResponses:(id)a3
{
  id v4 = a3;
  id v5 = [(DMCInstallProfileQuestionViewController *)self questionsDelegate];
  [v5 questionsController:self didFinishWithResponses:v4];
}

- (void)_cancelInput
{
}

- (void)_continueWithCurrentField
{
  [(DMCInstallProfileQuestionViewController *)self _showNavButtonsAnimated:1];
  [(DMCInstallProfileQuestionViewController *)self _updateNavigationBar];
  id v3 = [(DMCInstallProfileQuestionViewController *)self tableView];
  [v3 reloadData];
}

- (void)_retryWithCurrentField
{
  [(DMCInstallProfileQuestionViewController *)self _showNavButtonsAnimated:1];
  [(DMCInstallProfileQuestionViewController *)self _updateNavigationBar];
  id v3 = [(DMCInstallProfileQuestionViewController *)self tableView];
  [v3 reloadData];

  id v4 = [(DMCInstallProfileQuestionViewController *)self tableView];
  [v4 layoutIfNeeded];

  id v5 = [(DMCInstallProfileQuestionViewController *)self textField];
  [v5 becomeFirstResponder];
}

- (void)_retryCurrentPasswordFieldWithError:(id)a3
{
  id v8 = a3;
  [(DMCInstallProfileQuestionViewController *)self _showNavButtonsAnimated:1];
  [(DMCInstallProfileQuestionViewController *)self _updateNavigationBar];
  id v4 = [(DMCFieldCollection *)self->_fieldCollection currentField];
  id v5 = [v8 localizedDescription];
  if (v5) {
    [v4 setFieldDescription:v5];
  }
  uint64_t v6 = [v8 localizedRecoverySuggestion];
  if (v6) {
    [v4 setFinePrint:v6];
  }
  BOOL v7 = [(DMCInstallProfileQuestionViewController *)self tableView];
  [v7 reloadData];
}

- (void)_finishInput
{
  id v3 = [(DMCFieldCollection *)self->_fieldCollection userInputResponses];
  [(DMCInstallProfileQuestionViewController *)self _tellDelegateDidFinishWithUserInputResponses:v3];
}

- (void)_continueOrFinish
{
  if ([(DMCFieldCollection *)self->_fieldCollection currentFieldIsFinalField])
  {
    [(DMCInstallProfileQuestionViewController *)self _finishInput];
  }
  else
  {
    [(DMCFieldCollection *)self->_fieldCollection moveToNextField];
    [(DMCInstallProfileQuestionViewController *)self _continueWithCurrentField];
    id v5 = [[DMCInstallProfileQuestionViewController alloc] initWithFieldCollection:self->_fieldCollection];
    id v3 = [(DMCInstallProfileQuestionViewController *)self questionsDelegate];
    [(DMCInstallProfileQuestionViewController *)v5 setQuestionsDelegate:v3];

    id v4 = [(DMCInstallProfileQuestionViewController *)self navigationController];
    [v4 pushViewController:v5 animated:1];
  }
}

- (void)_showAlertForError:(id)a3
{
  id v4 = (void *)MEMORY[0x263F1C3F8];
  id v5 = a3;
  uint64_t v6 = [v5 localizedDescription];
  BOOL v7 = [v5 localizedRecoverySuggestion];
  id v17 = [v4 alertControllerWithTitle:v6 message:v7 preferredStyle:1];

  id v8 = [v5 userInfo];

  id v9 = [v8 objectForKey:*MEMORY[0x263F536E8]];

  if ([v9 isEqualToString:*MEMORY[0x263F53700]])
  {
    id v10 = DMCEnrollmentLocalizedString(@"DMC_GENERAL_RETRY");
    [(DMCInstallProfileQuestionViewController *)self _addActionForError:0 title:v10 toAlert:v17];

    uint64_t v11 = @"DMC_GENERAL_SKIP";
LABEL_5:
    v13 = DMCEnrollmentLocalizedString(v11);
    id v14 = self;
    uint64_t v15 = 1;
    goto LABEL_6;
  }
  if ([v9 isEqualToString:*MEMORY[0x263F536F8]])
  {
    v12 = DMCEnrollmentLocalizedString(@"DMC_GENERAL_RETRY");
    [(DMCInstallProfileQuestionViewController *)self _addActionForError:0 title:v12 toAlert:v17];

    uint64_t v11 = @"DMC_GENERAL_IGNORE";
    goto LABEL_5;
  }
  if ([v9 isEqualToString:*MEMORY[0x263F536F0]])
  {
    v16 = DMCEnrollmentLocalizedString(@"DMC_GENERAL_CANCEL");
    [(DMCInstallProfileQuestionViewController *)self _addActionForError:2 title:v16 toAlert:v17];

    v13 = DMCEnrollmentLocalizedString(@"DMC_GENERAL_RETRY");
    id v14 = self;
    uint64_t v15 = 0;
  }
  else
  {
    v13 = DMCEnrollmentLocalizedString(@"DMC_GENERAL_OK");
    id v14 = self;
    uint64_t v15 = 3;
  }
LABEL_6:
  [(DMCInstallProfileQuestionViewController *)v14 _addActionForError:v15 title:v13 toAlert:v17];

  [(DMCInstallProfileQuestionViewController *)self presentViewController:v17 animated:1 completion:0];
}

- (void)_addActionForError:(unint64_t)a3 title:(id)a4 toAlert:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  objc_initWeak(&location, self);
  id v10 = (void *)MEMORY[0x263F1C3F0];
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __76__DMCInstallProfileQuestionViewController__addActionForError_title_toAlert___block_invoke;
  v12[3] = &unk_2645E9730;
  objc_copyWeak(v13, &location);
  v13[1] = (id)a3;
  uint64_t v11 = [v10 actionWithTitle:v8 style:a3 == 2 handler:v12];
  [v9 addAction:v11];

  objc_destroyWeak(v13);
  objc_destroyWeak(&location);
}

void __76__DMCInstallProfileQuestionViewController__addActionForError_title_toAlert___block_invoke(uint64_t a1)
{
  v2[0] = MEMORY[0x263EF8330];
  v2[1] = 3221225472;
  v2[2] = __76__DMCInstallProfileQuestionViewController__addActionForError_title_toAlert___block_invoke_2;
  v2[3] = &unk_2645E9708;
  objc_copyWeak(v3, (id *)(a1 + 32));
  v3[1] = *(id *)(a1 + 40);
  dispatch_async(MEMORY[0x263EF83A0], v2);
  objc_destroyWeak(v3);
}

void __76__DMCInstallProfileQuestionViewController__addActionForError_title_toAlert___block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    id v3 = WeakRetained;
    [WeakRetained _handleError:*(void *)(a1 + 40)];
    id WeakRetained = v3;
  }
}

- (void)_handleError:(unint64_t)a3
{
  switch(a3)
  {
    case 0uLL:
      [(DMCFieldCollection *)self->_fieldCollection restartCurrentPayload];
      goto LABEL_3;
    case 1uLL:
      [(DMCInstallProfileQuestionViewController *)self _continueOrFinish];
      break;
    case 2uLL:
      [(DMCInstallProfileQuestionViewController *)self _cancelInput];
      break;
    case 3uLL:
LABEL_3:
      [(DMCInstallProfileQuestionViewController *)self _retryWithCurrentField];
      break;
    default:
      return;
  }
}

- (DMCProfileQuestionsControllerDelegate)questionsDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_questionsDelegate);
  return (DMCProfileQuestionsControllerDelegate *)WeakRetained;
}

- (UITextField)textField
{
  return self->_textField;
}

- (void)setTextField:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_textField, 0);
  objc_destroyWeak((id *)&self->_questionsDelegate);
  objc_storeStrong((id *)&self->_previousResponseValue, 0);
  objc_storeStrong((id *)&self->_fieldCollection, 0);
}

@end