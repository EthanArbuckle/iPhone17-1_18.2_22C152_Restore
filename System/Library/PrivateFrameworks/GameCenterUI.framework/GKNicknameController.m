@interface GKNicknameController
- (BOOL)nicknameChangeWasCommitted;
- (BOOL)nicknameWasEdited;
- (BOOL)shouldShakeTextFieldOnError;
- (BOOL)shouldUseSuggestedNicknameOnDefaultNickname;
- (BOOL)textField:(id)a3 shouldChangeCharactersInRange:(_NSRange)a4 replacementString:(id)a5;
- (BOOL)textFieldShouldBeginEditing:(id)a3;
- (BOOL)textFieldShouldReturn:(id)a3;
- (GKNicknameController)init;
- (GKNicknameControllerDelegate)delegate;
- (GKReachability)reachability;
- (NSArray)suggestedNicknames;
- (NSString)defaultNickname;
- (UIActivityIndicatorView)activityIndicator;
- (UITextField)nickname;
- (void)commitNicknameChangesWithCompletion:(id)a3;
- (void)didSelectSuggestion:(id)a3;
- (void)displayNicknameSuggestions;
- (void)keyboardWillHide:(id)a3;
- (void)keyboardWillShow:(id)a3;
- (void)loadSuggestedNicknames:(id)a3;
- (void)nicknameTextChanged:(id)a3;
- (void)reset;
- (void)setActivityIndicator:(id)a3;
- (void)setDefaultNickname:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setNickname:(id)a3;
- (void)setNicknameChangeWasCommitted:(BOOL)a3;
- (void)setNicknameWasEdited:(BOOL)a3;
- (void)setReachability:(id)a3;
- (void)setShouldShakeTextFieldOnError:(BOOL)a3;
- (void)setShouldUseSuggestedNicknameOnDefaultNickname:(BOOL)a3;
- (void)setSuggestedNicknames:(id)a3;
- (void)shakeNicknameTextFieldWithCompletionBlock:(id)a3;
- (void)startObservingKeyboardEvents;
- (void)stopObservingKeyboardEvents;
- (void)textFieldDidBecomeFirstResponder:(id)a3;
- (void)textFieldDidBeginEditing:(id)a3;
- (void)textFieldDidResignFirstResponder:(id)a3;
- (void)updateReturnKeyEnabledState;
@end

@implementation GKNicknameController

- (GKNicknameController)init
{
  v5.receiver = self;
  v5.super_class = (Class)GKNicknameController;
  v2 = [(GKNicknameController *)&v5 init];
  if (v2)
  {
    v3 = [MEMORY[0x1E4F637F0] _gkReachabilityForInternetConnection];
    [(GKNicknameController *)v2 setReachability:v3];

    [(GKNicknameController *)v2 setShouldUseSuggestedNicknameOnDefaultNickname:0];
  }
  return v2;
}

- (void)setNickname:(id)a3
{
  objc_storeStrong((id *)&self->_nickname, a3);
  id v7 = a3;
  objc_super v5 = GKGameCenterUIFrameworkBundle();
  v6 = GKGetLocalizedStringFromTableInBundle();
  [(UITextField *)self->_nickname setPlaceholder:v6];

  [(UITextField *)self->_nickname setDelegate:self];
}

- (void)updateReturnKeyEnabledState
{
  v3 = [(GKNicknameController *)self nickname];
  v4 = [v3 text];
  if ((unint64_t)[v4 length] < 3)
  {
    BOOL v7 = 0;
  }
  else
  {
    objc_super v5 = [(GKNicknameController *)self nickname];
    v6 = [v5 text];
    BOOL v7 = (unint64_t)[v6 length] < 0x10;
  }
  id v8 = [MEMORY[0x1E4FB18E0] activeKeyboard];
  [v8 setReturnKeyEnabled:v7];
}

- (BOOL)textField:(id)a3 shouldChangeCharactersInRange:(_NSRange)a4 replacementString:(id)a5
{
  return 1;
}

- (void)stopObservingKeyboardEvents
{
  v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v3 removeObserver:self name:*MEMORY[0x1E4FB2C58] object:0];

  v4 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v4 removeObserver:self name:*MEMORY[0x1E4FB2C50] object:0];

  id v5 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v5 removeObserver:self name:*MEMORY[0x1E4FB3018] object:0];
}

- (void)startObservingKeyboardEvents
{
  v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v3 addObserver:self selector:sel_keyboardWillShow_ name:*MEMORY[0x1E4FB2C58] object:0];

  v4 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v4 addObserver:self selector:sel_keyboardWillHide_ name:*MEMORY[0x1E4FB2C50] object:0];

  id v5 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v5 addObserver:self selector:sel_nicknameTextChanged_ name:*MEMORY[0x1E4FB3018] object:0];
}

- (void)commitNicknameChangesWithCompletion:(id)a3
{
  id v4 = a3;
  id v5 = [(GKNicknameController *)self delegate];
  char v6 = objc_opt_respondsToSelector();

  if (v6)
  {
    BOOL v7 = [(GKNicknameController *)self delegate];
    [v7 nicknameWillbeginUpdating];
  }
  id v8 = [(GKNicknameController *)self activityIndicator];
  [v8 startAnimating];

  v9 = [MEMORY[0x1E4F636C8] proxyForLocalPlayer];
  v10 = [v9 profileServicePrivate];
  v11 = [(GKNicknameController *)self nickname];
  v12 = [v11 text];
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __60__GKNicknameController_commitNicknameChangesWithCompletion___block_invoke;
  v14[3] = &unk_1E5F63CF0;
  v14[4] = self;
  id v15 = v4;
  id v13 = v4;
  [v10 setPlayerNickname:v12 suggestionsCount:3 handler:v14];
}

void __60__GKNicknameController_commitNicknameChangesWithCompletion___block_invoke(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  id v7 = a2;
  id v8 = a4;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __60__GKNicknameController_commitNicknameChangesWithCompletion___block_invoke_2;
  block[3] = &unk_1E5F638E8;
  v9 = *(void **)(a1 + 40);
  block[4] = *(void *)(a1 + 32);
  id v13 = v8;
  uint64_t v16 = a3;
  id v14 = v7;
  id v15 = v9;
  id v10 = v7;
  id v11 = v8;
  dispatch_async(MEMORY[0x1E4F14428], block);
}

void __60__GKNicknameController_commitNicknameChangesWithCompletion___block_invoke_2(uint64_t a1)
{
  v31[1] = *MEMORY[0x1E4F143B8];
  v2 = [*(id *)(a1 + 32) activityIndicator];
  [v2 stopAnimating];

  if (*(void *)(a1 + 40) || *(void *)(a1 + 64))
  {
    [*(id *)(a1 + 32) setSuggestedNicknames:*(void *)(a1 + 48)];
    [*(id *)(a1 + 32) displayNicknameSuggestions];
    int v3 = [*(id *)(a1 + 32) shouldShakeTextFieldOnError];
    id v4 = *(void **)(a1 + 32);
    if (v3)
    {
      v29[0] = MEMORY[0x1E4F143A8];
      v29[1] = 3221225472;
      v29[2] = __60__GKNicknameController_commitNicknameChangesWithCompletion___block_invoke_3;
      v29[3] = &unk_1E5F62EB0;
      v29[4] = v4;
      [v4 shakeNicknameTextFieldWithCompletionBlock:v29];
    }
    else
    {
      [v4 reset];
    }
    uint64_t v5 = *(void *)(a1 + 64);
    if (v5 > 5053)
    {
      if (v5 == 5054 || v5 == 5065 || v5 == 5066) {
        goto LABEL_21;
      }
    }
    else if (v5 == 5022 || v5 == 5024 || v5 == 5035)
    {
LABEL_21:
      id v14 = GKGameCenterUIFrameworkBundle();
      id v15 = GKGetLocalizedStringFromTableInBundle();
      uint64_t v16 = 1;
LABEL_22:

      v17 = *(void **)(a1 + 40);
      if (v17)
      {
        id v18 = v17;
      }
      else
      {
        v19 = (void *)MEMORY[0x1E4F28C58];
        uint64_t v20 = *MEMORY[0x1E4F63620];
        uint64_t v21 = *(void *)(a1 + 64);
        v30 = @"askUserToRetry";
        v22 = [NSNumber numberWithBool:v16];
        v31[0] = v22;
        v23 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v31 forKeys:&v30 count:1];
        id v18 = [v19 errorWithDomain:v20 code:v21 userInfo:v23];
      }
      v24 = [*(id *)(a1 + 32) delegate];
      char v25 = objc_opt_respondsToSelector();

      if (v25)
      {
        v26 = [*(id *)(a1 + 32) delegate];
        [v26 nicknameUpdateRequestCompletedWithStatus:v15 error:v18];
      }
      uint64_t v27 = *(void *)(a1 + 56);
      if (v27) {
        (*(void (**)(uint64_t, id))(v27 + 16))(v27, v18);
      }

      return;
    }
    v28 = GKGameCenterUIFrameworkBundle();
    id v15 = GKGetLocalizedStringFromTableInBundle();

    id v14 = [*(id *)(a1 + 32) nickname];
    [v14 resignFirstResponder];
    uint64_t v16 = 0;
    goto LABEL_22;
  }
  char v6 = [*(id *)(a1 + 32) nickname];
  uint64_t v7 = [v6 text];
  id v8 = [MEMORY[0x1E4F63760] local];
  [v8 setAlias:v7];

  [*(id *)(a1 + 32) setNicknameChangeWasCommitted:1];
  v9 = [*(id *)(a1 + 32) nickname];
  [v9 resignFirstResponder];

  id v10 = [*(id *)(a1 + 32) delegate];
  LOBYTE(v7) = objc_opt_respondsToSelector();

  if (v7)
  {
    id v11 = [*(id *)(a1 + 32) delegate];
    [v11 nicknameUpdateRequestCompletedWithStatus:0 error:0];
  }
  uint64_t v12 = *(void *)(a1 + 56);
  if (v12)
  {
    id v13 = *(void (**)(void))(v12 + 16);
    v13();
  }
}

uint64_t __60__GKNicknameController_commitNicknameChangesWithCompletion___block_invoke_3(uint64_t a1)
{
  return [*(id *)(a1 + 32) reset];
}

- (BOOL)textFieldShouldReturn:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(GKNicknameController *)self nickname];
  char v6 = [v5 text];
  uint64_t v7 = [(GKNicknameController *)self defaultNickname];
  char v8 = [v6 isEqualToString:v7];

  if ((v8 & 1) == 0)
  {
    v9 = [MEMORY[0x1E4F637F8] reporter];
    [v9 reportEvent:*MEMORY[0x1E4F63568] type:*MEMORY[0x1E4F635A8]];
  }
  id v10 = [(GKNicknameController *)self reachability];
  int v11 = [v10 _gkCurrentReachabilityStatus];

  if (!v11)
  {
    id v18 = [MEMORY[0x1E4F63760] local];
    v19 = [v18 alias];
    uint64_t v20 = [(GKNicknameController *)self nickname];
    [v20 setText:v19];

    goto LABEL_7;
  }
  uint64_t v12 = [(GKNicknameController *)self nickname];
  id v13 = [v12 text];
  id v14 = [MEMORY[0x1E4F63760] local];
  id v15 = [v14 alias];
  char v16 = [v13 isEqualToString:v15];

  if (v16)
  {
LABEL_7:
    [v4 resignFirstResponder];
    BOOL v17 = 1;
    goto LABEL_8;
  }
  [(GKNicknameController *)self setNicknameWasEdited:1];
  v22[0] = MEMORY[0x1E4F143A8];
  v22[1] = 3221225472;
  v22[2] = __46__GKNicknameController_textFieldShouldReturn___block_invoke;
  v22[3] = &unk_1E5F63240;
  v22[4] = self;
  [(GKNicknameController *)self commitNicknameChangesWithCompletion:v22];
  BOOL v17 = 0;
LABEL_8:

  return v17;
}

void __46__GKNicknameController_textFieldShouldReturn___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = (NSObject **)MEMORY[0x1E4F63860];
  uint64_t v5 = *MEMORY[0x1E4F63860];
  if (v3)
  {
    if (!v5) {
      id v6 = (id)GKOSLoggers();
    }
    uint64_t v7 = *MEMORY[0x1E4F63850];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F63850], OS_LOG_TYPE_ERROR)) {
      __46__GKNicknameController_textFieldShouldReturn___block_invoke_cold_1((uint64_t)v3, v7);
    }
    char v8 = [v3 userInfo];
    v9 = [v8 objectForKeyedSubscript:@"askUserToRetry"];
    char v10 = [v9 BOOLValue];

    if ((v10 & 1) == 0)
    {
      int v11 = [MEMORY[0x1E4F63760] local];
      uint64_t v12 = [v11 alias];
      id v13 = [*(id *)(a1 + 32) nickname];
      [v13 setText:v12];
    }
  }
  else
  {
    if (!v5)
    {
      id v14 = (id)GKOSLoggers();
      uint64_t v5 = *v4;
    }
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)id v15 = 0;
      _os_log_impl(&dword_1AF250000, v5, OS_LOG_TYPE_INFO, "GKNicknameController.textFieldShouldReturn: Nickname saved.", v15, 2u);
    }
  }
}

- (void)displayNicknameSuggestions
{
  id v3 = [(GKNicknameController *)self suggestedNicknames];
  uint64_t v4 = [v3 count];

  if (v4)
  {
    uint64_t v5 = [MEMORY[0x1E4FB16C8] currentDevice];
    uint64_t v6 = [v5 userInterfaceIdiom];

    if (v6 == 1) {
      uint64_t v7 = 3;
    }
    else {
      uint64_t v7 = 2;
    }
    char v8 = [MEMORY[0x1E4F1CA48] array];
    v9 = [(GKNicknameController *)self suggestedNicknames];
    uint64_t v13 = MEMORY[0x1E4F143A8];
    uint64_t v14 = 3221225472;
    id v15 = __50__GKNicknameController_displayNicknameSuggestions__block_invoke;
    char v16 = &unk_1E5F63D18;
    id v17 = v8;
    uint64_t v18 = v7;
    id v10 = v8;
    [v9 enumerateObjectsUsingBlock:&v13];

    int v11 = [(GKNicknameController *)self nickname];
    uint64_t v12 = [v11 textInputSuggestionDelegate];
    [v12 setSuggestions:v10];
  }
}

void __50__GKNicknameController_displayNicknameSuggestions__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, unsigned char *a4)
{
  id v6 = [MEMORY[0x1E4FB1DC8] textSuggestionWithInputText:a2];
  objc_msgSend(*(id *)(a1 + 32), "addObject:");
  if ((unint64_t)[*(id *)(a1 + 32) count] >= *(void *)(a1 + 40)) {
    *a4 = 1;
  }
}

- (void)didSelectSuggestion:(id)a3
{
  id v4 = a3;
  id v5 = [(GKNicknameController *)self nickname];
  [v5 setText:v4];
}

- (void)reset
{
  [(GKNicknameController *)self setNicknameWasEdited:0];

  [(GKNicknameController *)self updateReturnKeyEnabledState];
}

- (BOOL)textFieldShouldBeginEditing:(id)a3
{
  id v4 = [(GKNicknameController *)self delegate];
  char v5 = objc_opt_respondsToSelector();

  if ((v5 & 1) == 0) {
    return 1;
  }
  id v6 = [(GKNicknameController *)self delegate];
  char v7 = [v6 nicknameShouldBeginEditing];

  return v7;
}

- (void)textFieldDidBeginEditing:(id)a3
{
  v11[1] = *MEMORY[0x1E4F143B8];
  id v4 = [(GKNicknameController *)self nickname];
  char v5 = [v4 text];
  [(GKNicknameController *)self setDefaultNickname:v5];

  [(GKNicknameController *)self reset];
  id v6 = [(GKNicknameController *)self nickname];
  char v7 = [v6 textInputSuggestionDelegate];
  char v8 = [MEMORY[0x1E4FB1DC8] textSuggestionWithInputText:&stru_1F07B2408];
  v11[0] = v8;
  v9 = [MEMORY[0x1E4F1C978] arrayWithObjects:v11 count:1];
  [v7 setSuggestions:v9];

  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __49__GKNicknameController_textFieldDidBeginEditing___block_invoke;
  v10[3] = &unk_1E5F62EB0;
  v10[4] = self;
  [(GKNicknameController *)self loadSuggestedNicknames:v10];
}

uint64_t __49__GKNicknameController_textFieldDidBeginEditing___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) displayNicknameSuggestions];
}

- (void)nicknameTextChanged:(id)a3
{
  id v4 = [(GKNicknameController *)self nickname];
  char v5 = [v4 text];
  unint64_t v6 = [v5 length];

  if (v6 < 0x10)
  {
    id v17 = 0;
  }
  else
  {
    char v7 = [(GKNicknameController *)self nickname];
    char v8 = [v7 text];
    v9 = [v8 substringToIndex:15];
    id v10 = [(GKNicknameController *)self nickname];
    [v10 setText:v9];

    int v11 = NSString;
    uint64_t v12 = GKGameCenterUIFrameworkBundle();
    uint64_t v13 = GKGetLocalizedStringFromTableInBundle();
    objc_msgSend(v11, "stringWithFormat:", v13, &unk_1F0811CD0, &unk_1F0811CE8);
    id v17 = (id)objc_claimAutoreleasedReturnValue();
  }
  [(GKNicknameController *)self updateReturnKeyEnabledState];
  uint64_t v14 = [(GKNicknameController *)self delegate];
  char v15 = objc_opt_respondsToSelector();

  if (v15)
  {
    char v16 = [(GKNicknameController *)self delegate];
    [v16 nicknameTextDidChangeWithMessage:v17];
  }
  [(GKNicknameController *)self displayNicknameSuggestions];
}

- (void)shakeNicknameTextFieldWithCompletionBlock:(id)a3
{
  id v4 = a3;
  [MEMORY[0x1E4F39CF8] begin];
  char v5 = [MEMORY[0x1E4F39B48] animationWithKeyPath:@"position"];
  [v5 setRemovedOnCompletion:1];
  unint64_t v6 = (void *)MEMORY[0x1E4F29238];
  char v7 = [(GKNicknameController *)self nickname];
  char v8 = [v7 layer];
  [v8 position];
  double v10 = v9 + -5.0;
  int v11 = [(GKNicknameController *)self nickname];
  uint64_t v12 = [v11 layer];
  [v12 position];
  *(double *)v32 = v10;
  v32[1] = v13;
  uint64_t v14 = [v6 valueWithBytes:v32 objCType:"{CGPoint=dd}"];
  [v5 setFromValue:v14];

  char v15 = (void *)MEMORY[0x1E4F29238];
  char v16 = [(GKNicknameController *)self nickname];
  id v17 = [v16 layer];
  [v17 position];
  double v19 = v18 + 5.0;
  uint64_t v20 = [(GKNicknameController *)self nickname];
  uint64_t v21 = [v20 layer];
  [v21 position];
  *(double *)v31 = v19;
  v31[1] = v22;
  v23 = [v15 valueWithBytes:v31 objCType:"{CGPoint=dd}"];
  [v5 setToValue:v23];

  [v5 setDuration:0.05];
  LODWORD(v24) = 4.0;
  [v5 setRepeatCount:v24];
  [v5 setAutoreverses:1];
  char v25 = (void *)MEMORY[0x1E4F39CF8];
  v29[0] = MEMORY[0x1E4F143A8];
  v29[1] = 3221225472;
  v29[2] = __66__GKNicknameController_shakeNicknameTextFieldWithCompletionBlock___block_invoke;
  v29[3] = &unk_1E5F639B0;
  id v30 = v4;
  id v26 = v4;
  [v25 setCompletionBlock:v29];
  uint64_t v27 = [(GKNicknameController *)self nickname];
  v28 = [v27 layer];
  [v28 addAnimation:v5 forKey:@"shake"];

  [MEMORY[0x1E4F39CF8] commit];
}

void __66__GKNicknameController_shakeNicknameTextFieldWithCompletionBlock___block_invoke(uint64_t a1)
{
  if (*(void *)(a1 + 32))
  {
    dispatch_time_t v2 = dispatch_time(0, 1000000000);
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __66__GKNicknameController_shakeNicknameTextFieldWithCompletionBlock___block_invoke_2;
    block[3] = &unk_1E5F639B0;
    id v4 = *(id *)(a1 + 32);
    dispatch_after(v2, MEMORY[0x1E4F14428], block);
  }
}

uint64_t __66__GKNicknameController_shakeNicknameTextFieldWithCompletionBlock___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)keyboardWillShow:(id)a3
{
  v13[1] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  char v5 = [(GKNicknameController *)self nickname];
  int v6 = [v5 isFirstResponder];

  if (v6)
  {
    char v7 = [(GKNicknameController *)self nickname];
    uint64_t v8 = [v7 textInputSuggestionDelegate];
    double v9 = [MEMORY[0x1E4FB1DC8] textSuggestionWithInputText:&stru_1F07B2408];
    v13[0] = v9;
    double v10 = [MEMORY[0x1E4F1C978] arrayWithObjects:v13 count:1];
    [(id)v8 setSuggestions:v10];

    int v11 = [(GKNicknameController *)self delegate];
    LOBYTE(v8) = objc_opt_respondsToSelector();

    if (v8)
    {
      uint64_t v12 = [(GKNicknameController *)self delegate];
      [v12 keyboardWillShow:v4];
    }
  }
}

- (void)keyboardWillHide:(id)a3
{
  id v10 = a3;
  if (![(GKNicknameController *)self nicknameWasEdited])
  {
    id v4 = [MEMORY[0x1E4F63760] local];
    char v5 = [v4 alias];
    int v6 = [(GKNicknameController *)self nickname];
    [v6 setText:v5];
  }
  char v7 = [(GKNicknameController *)self delegate];
  char v8 = objc_opt_respondsToSelector();

  if (v8)
  {
    double v9 = [(GKNicknameController *)self delegate];
    [v9 keyboardWillHide:v10];
  }
}

- (void)textFieldDidBecomeFirstResponder:(id)a3
{
  id v4 = [(GKNicknameController *)self delegate];
  char v5 = objc_opt_respondsToSelector();

  if (v5)
  {
    id v6 = [(GKNicknameController *)self delegate];
    [v6 nicknameDidBecomeFirstResponder];
  }
}

- (void)textFieldDidResignFirstResponder:(id)a3
{
  id v4 = [(GKNicknameController *)self delegate];
  char v5 = objc_opt_respondsToSelector();

  if (v5)
  {
    id v6 = [(GKNicknameController *)self delegate];
    [v6 nicknameDidResignFirstResponder];
  }
}

- (void)loadSuggestedNicknames:(id)a3
{
  id v4 = a3;
  char v5 = [MEMORY[0x1E4F636C8] proxyForLocalPlayer];
  id v6 = [v5 profileServicePrivate];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __47__GKNicknameController_loadSuggestedNicknames___block_invoke;
  v8[3] = &unk_1E5F63D40;
  v8[4] = self;
  id v9 = v4;
  id v7 = v4;
  [v6 getNicknameSuggestions:3 handler:v8];
}

void __47__GKNicknameController_loadSuggestedNicknames___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id v7 = (NSObject **)MEMORY[0x1E4F63860];
  char v8 = *MEMORY[0x1E4F63860];
  if (v6)
  {
    if (!v8) {
      id v9 = (id)GKOSLoggers();
    }
    id v10 = *MEMORY[0x1E4F63850];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F63850], OS_LOG_TYPE_ERROR)) {
      __47__GKNicknameController_loadSuggestedNicknames___block_invoke_cold_1((uint64_t)v6, v10);
    }
  }
  else
  {
    if (!v8)
    {
      id v11 = (id)GKOSLoggers();
      char v8 = *v7;
    }
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1AF250000, v8, OS_LOG_TYPE_INFO, "GKNicknameController.loadSuggestedNicknames: Succeeded", buf, 2u);
    }
  }
  if (*(void *)(a1 + 40))
  {
    [*(id *)(a1 + 32) setSuggestedNicknames:v5];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __47__GKNicknameController_loadSuggestedNicknames___block_invoke_78;
    block[3] = &unk_1E5F639B0;
    id v13 = *(id *)(a1 + 40);
    dispatch_async(MEMORY[0x1E4F14428], block);
  }
}

uint64_t __47__GKNicknameController_loadSuggestedNicknames___block_invoke_78(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)setShouldUseSuggestedNicknameOnDefaultNickname:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v5 = (NSObject **)MEMORY[0x1E4F63860];
  id v6 = *MEMORY[0x1E4F63860];
  if (!*MEMORY[0x1E4F63860])
  {
    id v7 = (id)GKOSLoggers();
    id v6 = *v5;
  }
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    char v8 = (void *)MEMORY[0x1E4F63760];
    id v9 = v6;
    id v10 = [v8 local];
    id v11 = [v10 internal];
    int v12 = [v11 isDefaultNickname];
    id v13 = [(GKNicknameController *)self nickname];
    *(_DWORD *)buf = 67109632;
    BOOL v19 = v3;
    __int16 v20 = 1024;
    int v21 = v12;
    __int16 v22 = 1024;
    BOOL v23 = v13 != 0;
    _os_log_impl(&dword_1AF250000, v9, OS_LOG_TYPE_INFO, "GKNicknameController.setShouldUseSuggestedNicknameOnDefaultNickname: %d, is player using default nickname? %d, is nickname text field set? %d", buf, 0x14u);
  }
  self->_shouldUseSuggestedNicknameOnDefaultNickname = v3;
  if (v3)
  {
    uint64_t v14 = [MEMORY[0x1E4F63760] local];
    char v15 = [v14 internal];
    int v16 = [v15 isDefaultNickname];

    if (v16)
    {
      v17[0] = MEMORY[0x1E4F143A8];
      v17[1] = 3221225472;
      v17[2] = __71__GKNicknameController_setShouldUseSuggestedNicknameOnDefaultNickname___block_invoke;
      v17[3] = &unk_1E5F62EB0;
      v17[4] = self;
      [(GKNicknameController *)self loadSuggestedNicknames:v17];
    }
  }
}

void __71__GKNicknameController_setShouldUseSuggestedNicknameOnDefaultNickname___block_invoke(uint64_t a1)
{
  dispatch_time_t v2 = [*(id *)(a1 + 32) suggestedNicknames];
  uint64_t v3 = [v2 count];

  if (v3)
  {
    id v4 = [*(id *)(a1 + 32) suggestedNicknames];
    uint64_t v5 = [v4 objectAtIndexedSubscript:0];
    id v6 = [*(id *)(a1 + 32) nickname];
    [v6 setText:v5];

    [*(id *)(a1 + 32) setNicknameWasEdited:1];
    id v7 = [*(id *)(a1 + 32) delegate];
    LOBYTE(v5) = objc_opt_respondsToSelector();

    if (v5)
    {
      id v10 = [*(id *)(a1 + 32) delegate];
      char v8 = [*(id *)(a1 + 32) nickname];
      id v9 = [v8 text];
      [v10 nicknameUpdateAvatarImage:v9];
    }
  }
}

- (UITextField)nickname
{
  return self->_nickname;
}

- (BOOL)nicknameWasEdited
{
  return self->_nicknameWasEdited;
}

- (void)setNicknameWasEdited:(BOOL)a3
{
  self->_nicknameWasEdited = a3;
}

- (BOOL)nicknameChangeWasCommitted
{
  return self->_nicknameChangeWasCommitted;
}

- (void)setNicknameChangeWasCommitted:(BOOL)a3
{
  self->_nicknameChangeWasCommitted = a3;
}

- (BOOL)shouldShakeTextFieldOnError
{
  return self->_shouldShakeTextFieldOnError;
}

- (void)setShouldShakeTextFieldOnError:(BOOL)a3
{
  self->_shouldShakeTextFieldOnError = a3;
}

- (BOOL)shouldUseSuggestedNicknameOnDefaultNickname
{
  return self->_shouldUseSuggestedNicknameOnDefaultNickname;
}

- (UIActivityIndicatorView)activityIndicator
{
  return self->_activityIndicator;
}

- (void)setActivityIndicator:(id)a3
{
}

- (GKNicknameControllerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (GKNicknameControllerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (GKReachability)reachability
{
  return self->_reachability;
}

- (void)setReachability:(id)a3
{
}

- (NSArray)suggestedNicknames
{
  return self->_suggestedNicknames;
}

- (void)setSuggestedNicknames:(id)a3
{
}

- (NSString)defaultNickname
{
  return self->_defaultNickname;
}

- (void)setDefaultNickname:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_defaultNickname, 0);
  objc_storeStrong((id *)&self->_suggestedNicknames, 0);
  objc_storeStrong((id *)&self->_reachability, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_activityIndicator, 0);

  objc_storeStrong((id *)&self->_nickname, 0);
}

void __46__GKNicknameController_textFieldShouldReturn___block_invoke_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_1AF250000, a2, OS_LOG_TYPE_ERROR, "GKNicknameController.textFieldShouldReturn: Failed to change player's nickname: %@", (uint8_t *)&v2, 0xCu);
}

void __47__GKNicknameController_loadSuggestedNicknames___block_invoke_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_1AF250000, a2, OS_LOG_TYPE_ERROR, "GKNicknameController.loadSuggestedNicknames: Failed with error: %@", (uint8_t *)&v2, 0xCu);
}

@end