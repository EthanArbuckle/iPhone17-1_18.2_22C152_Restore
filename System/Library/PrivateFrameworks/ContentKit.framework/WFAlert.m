@interface WFAlert
+ (WFAlert)alertWithError:(id)a3;
+ (WFAlert)alertWithError:(id)a3 confirmationHandler:(id)a4;
+ (WFAlert)alertWithPreferredStyle:(int64_t)a3;
- (LNDialog)linkDialog;
- (NSArray)buttons;
- (NSArray)textFieldResults;
- (NSDate)datePickerResult;
- (NSError)associatedError;
- (NSMutableArray)mutableButtons;
- (NSMutableArray)mutableTextFieldConfigurationHandlers;
- (NSString)associatedParameterKey;
- (NSString)message;
- (NSString)title;
- (WFAlert)init;
- (WFAlertButton)escapeButton;
- (WFAlertPresenter)presenter;
- (WFDatePickerConfiguration)datePickerConfiguration;
- (WFImage)icon;
- (WFTextFieldConfiguration)textFieldConfiguration;
- (int64_t)preferredStyle;
- (void)addButton:(id)a3;
- (void)addTextFieldWithConfigurationHandler:(id)a3;
- (void)dismissWithCompletionHandler:(id)a3;
- (void)setAssociatedParameterKey:(id)a3;
- (void)setButtons:(id)a3;
- (void)setDatePickerConfiguration:(id)a3;
- (void)setDatePickerResult:(id)a3;
- (void)setIcon:(id)a3;
- (void)setLinkDialog:(id)a3;
- (void)setMessage:(id)a3;
- (void)setMutableButtons:(id)a3;
- (void)setMutableTextFieldConfigurationHandlers:(id)a3;
- (void)setPreferredStyle:(int64_t)a3;
- (void)setPresenter:(id)a3;
- (void)setTextFieldConfiguration:(id)a3;
- (void)setTextFieldResults:(id)a3;
- (void)setTitle:(id)a3;
@end

@implementation WFAlert

- (WFAlertButton)escapeButton
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  v3 = [(WFAlert *)self buttons];
  uint64_t v4 = [v3 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v13;
    while (2)
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v13 != v6) {
          objc_enumerationMutation(v3);
        }
        v8 = *(void **)(*((void *)&v12 + 1) + 8 * i);
        if ([v8 style] == 1)
        {
          id v9 = v8;
          goto LABEL_11;
        }
      }
      uint64_t v5 = [v3 countByEnumeratingWithState:&v12 objects:v16 count:16];
      if (v5) {
        continue;
      }
      break;
    }
  }

  v3 = [(WFAlert *)self buttons];
  id v9 = [v3 firstObject];
LABEL_11:
  v10 = v9;

  return (WFAlertButton *)v10;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_mutableTextFieldConfigurationHandlers, 0);
  objc_storeStrong((id *)&self->_mutableButtons, 0);
  objc_destroyWeak((id *)&self->_presenter);
  objc_storeStrong((id *)&self->_linkDialog, 0);
  objc_storeStrong((id *)&self->_associatedParameterKey, 0);
  objc_storeStrong((id *)&self->_datePickerResult, 0);
  objc_storeStrong((id *)&self->_textFieldResults, 0);
  objc_storeStrong((id *)&self->_datePickerConfiguration, 0);
  objc_storeStrong((id *)&self->_textFieldConfiguration, 0);
  objc_storeStrong((id *)&self->_icon, 0);
  objc_storeStrong((id *)&self->_message, 0);

  objc_storeStrong((id *)&self->_title, 0);
}

- (void)setMutableTextFieldConfigurationHandlers:(id)a3
{
}

- (NSMutableArray)mutableTextFieldConfigurationHandlers
{
  return self->_mutableTextFieldConfigurationHandlers;
}

- (void)setMutableButtons:(id)a3
{
}

- (NSMutableArray)mutableButtons
{
  return self->_mutableButtons;
}

- (void)setPresenter:(id)a3
{
}

- (WFAlertPresenter)presenter
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_presenter);

  return (WFAlertPresenter *)WeakRetained;
}

- (void)setLinkDialog:(id)a3
{
}

- (LNDialog)linkDialog
{
  return self->_linkDialog;
}

- (void)setAssociatedParameterKey:(id)a3
{
}

- (NSString)associatedParameterKey
{
  return self->_associatedParameterKey;
}

- (void)setDatePickerResult:(id)a3
{
}

- (NSDate)datePickerResult
{
  return self->_datePickerResult;
}

- (void)setTextFieldResults:(id)a3
{
}

- (NSArray)textFieldResults
{
  return self->_textFieldResults;
}

- (void)setDatePickerConfiguration:(id)a3
{
}

- (WFDatePickerConfiguration)datePickerConfiguration
{
  return self->_datePickerConfiguration;
}

- (void)setTextFieldConfiguration:(id)a3
{
}

- (WFTextFieldConfiguration)textFieldConfiguration
{
  return self->_textFieldConfiguration;
}

- (void)setIcon:(id)a3
{
}

- (WFImage)icon
{
  return self->_icon;
}

- (void)setPreferredStyle:(int64_t)a3
{
  self->_preferredStyle = a3;
}

- (int64_t)preferredStyle
{
  return self->_preferredStyle;
}

- (void)setMessage:(id)a3
{
}

- (NSString)message
{
  return self->_message;
}

- (void)setTitle:(id)a3
{
}

- (NSString)title
{
  return self->_title;
}

- (void)dismissWithCompletionHandler:(id)a3
{
  uint64_t v6 = (void (**)(void))a3;
  uint64_t v4 = [(WFAlert *)self presenter];

  if (v4)
  {
    uint64_t v5 = [(WFAlert *)self presenter];
    [v5 dismissAlert:self completionHandler:v6];
  }
  else
  {
    v6[2]();
  }
}

- (void)addTextFieldWithConfigurationHandler:(id)a3
{
  id v4 = a3;
  id v7 = [(WFAlert *)self mutableTextFieldConfigurationHandlers];
  if (v4) {
    uint64_t v5 = v4;
  }
  else {
    uint64_t v5 = &__block_literal_global_14104;
  }
  uint64_t v6 = _Block_copy(v5);

  [v7 addObject:v6];
}

- (NSArray)buttons
{
  v2 = [(WFAlert *)self mutableButtons];
  v3 = (void *)[v2 copy];

  return (NSArray *)v3;
}

- (void)setButtons:(id)a3
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  id v4 = a3;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  uint64_t v5 = [v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v13;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v13 != v7) {
          objc_enumerationMutation(v4);
        }
        [*(id *)(*((void *)&v12 + 1) + 8 * v8++) setAlert:self];
      }
      while (v6 != v8);
      uint64_t v6 = [v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v6);
  }
  id v9 = (void *)[v4 mutableCopy];
  [(WFAlert *)self setMutableButtons:v9];

  v10 = [(WFAlert *)self presenter];
  v11 = [(WFAlert *)self buttons];
  [v10 setButtons:v11 forAlert:self];
}

- (void)addButton:(id)a3
{
  id v4 = a3;
  id v6 = [(WFAlert *)self buttons];
  uint64_t v5 = [v6 arrayByAddingObject:v4];

  [(WFAlert *)self setButtons:v5];
}

- (WFAlert)init
{
  v9.receiver = self;
  v9.super_class = (Class)WFAlert;
  v2 = [(WFAlert *)&v9 init];
  if (v2)
  {
    uint64_t v3 = objc_opt_new();
    mutableButtons = v2->_mutableButtons;
    v2->_mutableButtons = (NSMutableArray *)v3;

    uint64_t v5 = objc_opt_new();
    mutableTextFieldConfigurationHandlers = v2->_mutableTextFieldConfigurationHandlers;
    v2->_mutableTextFieldConfigurationHandlers = (NSMutableArray *)v5;

    uint64_t v7 = v2;
  }

  return v2;
}

+ (WFAlert)alertWithPreferredStyle:(int64_t)a3
{
  id v4 = objc_opt_new();
  [v4 setPreferredStyle:a3];

  return (WFAlert *)v4;
}

- (NSError)associatedError
{
  return (NSError *)objc_getAssociatedObject(self, sel_associatedError);
}

+ (WFAlert)alertWithError:(id)a3 confirmationHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [a1 alertWithPreferredStyle:0];
  objc_setAssociatedObject(v8, sel_associatedError, v6, (void *)1);
  objc_super v9 = [v6 localizedFailureReason];
  [v8 setTitle:v9];

  v10 = [v6 localizedDescription];
  [v8 setMessage:v10];

  v11 = [v6 localizedRecoveryOptions];
  if ([v11 count])
  {
    long long v12 = [v6 userInfo];
    long long v13 = [v12 objectForKeyedSubscript:@"WFRecoveryAttempter"];
    if (v13)
    {

LABEL_6:
      long long v15 = [v6 userInfo];
      v16 = [v15 objectForKey:@"WFDestructiveRecoveryOptionIndex"];

      uint64_t v17 = [v6 userInfo];
      v18 = [v17 objectForKey:@"WFPreferredRecoveryOptionIndex"];

      v19 = [v6 userInfo];
      v20 = [v19 objectForKeyedSubscript:@"WFRecoveryAttempter"];

      v21 = [v6 localizedRecoveryOptions];
      v32[0] = MEMORY[0x263EF8330];
      v32[1] = 3221225472;
      v32[2] = __54__WFAlert_Errors__alertWithError_confirmationHandler___block_invoke;
      v32[3] = &unk_26428B040;
      id v33 = v16;
      id v34 = v18;
      id v35 = v8;
      id v36 = v20;
      id v37 = v6;
      id v22 = v20;
      id v23 = v18;
      id v24 = v16;
      [v21 enumerateObjectsUsingBlock:v32];

      goto LABEL_8;
    }
    long long v14 = [v6 recoveryAttempter];

    if (v14) {
      goto LABEL_6;
    }
  }
  else
  {
  }
  uint64_t v27 = MEMORY[0x263EF8330];
  uint64_t v28 = 3221225472;
  v29 = __54__WFAlert_Errors__alertWithError_confirmationHandler___block_invoke_4;
  v30 = &unk_26428B068;
  id v31 = v7;
  v25 = +[WFAlertButton okButtonWithHandler:&v27];
  objc_msgSend(v8, "addButton:", v25, v27, v28, v29, v30);

  id v24 = v31;
LABEL_8:

  return (WFAlert *)v8;
}

void __54__WFAlert_Errors__alertWithError_confirmationHandler___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v5 = *(void **)(a1 + 32);
  id v6 = NSNumber;
  id v7 = a2;
  uint64_t v8 = [v6 numberWithUnsignedInteger:a3];
  if ([v5 isEqualToNumber:v8]) {
    uint64_t v9 = 2;
  }
  else {
    uint64_t v9 = 0;
  }

  v10 = *(void **)(a1 + 40);
  v11 = [NSNumber numberWithUnsignedInteger:a3];
  uint64_t v12 = [v10 isEqualToNumber:v11];

  v15[0] = MEMORY[0x263EF8330];
  v15[1] = 3221225472;
  v15[2] = __54__WFAlert_Errors__alertWithError_confirmationHandler___block_invoke_2;
  v15[3] = &unk_26428B018;
  long long v13 = *(void **)(a1 + 48);
  id v16 = *(id *)(a1 + 56);
  id v17 = *(id *)(a1 + 64);
  uint64_t v18 = a3;
  long long v14 = +[WFAlertButton buttonWithTitle:v7 style:v9 preferred:v12 handler:v15];

  [v13 addButton:v14];
}

uint64_t __54__WFAlert_Errors__alertWithError_confirmationHandler___block_invoke_4(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

void __54__WFAlert_Errors__alertWithError_confirmationHandler___block_invoke_2(void *a1)
{
  v2 = (void *)a1[4];
  uint64_t v3 = a1[5];
  if (v2)
  {
    uint64_t v4 = a1[6];
    [v2 attemptRecoveryFromError:v3 optionIndex:v4 userInterface:0 completionHandler:&__block_literal_global_25803];
  }
  else
  {
    id v5 = [(id)a1[5] recoveryAttempter];
    [v5 attemptRecoveryFromError:a1[5] optionIndex:a1[6]];
  }
}

+ (WFAlert)alertWithError:(id)a3
{
  return (WFAlert *)[a1 alertWithError:a3 confirmationHandler:0];
}

@end