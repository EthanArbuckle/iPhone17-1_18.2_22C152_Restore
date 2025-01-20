@interface TUIFeedbackController
+ (id)controller;
- (BOOL)feedbackFeatureEnabled;
- (BOOL)shouldCompleteStudyWithPreferenceValue:(BOOL)a3;
- (id)build;
- (id)computeSurveyMetadata;
- (id)currentInputModes;
- (id)model;
- (void)_presentSurveyWithParentController:(id)a3 completionHandler:(id)a4;
- (void)_updateStudyDataWithFinalPreferenceValue:(BOOL)a3 finalTimestamp:(id)a4;
- (void)_updateStudyDataWithSurveyOutcome:(int64_t)a3 surveyError:(id)a4 initialState:(int64_t)a5;
- (void)completeStudyWithFinalPreferenceValue:(BOOL)a3 parentController:(id)a4;
- (void)feedbackFeatureEnabled;
@end

@implementation TUIFeedbackController

+ (id)controller
{
  id v2 = objc_alloc_init((Class)objc_opt_class());
  return v2;
}

- (BOOL)shouldCompleteStudyWithPreferenceValue:(BOOL)a3
{
  BOOL v4 = [(TUIFeedbackController *)self feedbackFeatureEnabled];
  if (v4)
  {
    v5 = [MEMORY[0x263F7E550] getSupportedLangRegion];
    uint64_t v6 = [v5 length];

    if (IXACanLogMessageAtLevel())
    {
      v7 = IXAFeedbackLogFacility();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
        -[TUIFeedbackController shouldCompleteStudyWithPreferenceValue:](v6 != 0);
      }
    }
    uint64_t v8 = [MEMORY[0x263F7E550] getFeedbackState];
    LOBYTE(v4) = 0;
    if (v6) {
      BOOL v9 = v8 == 2;
    }
    else {
      BOOL v9 = 0;
    }
    if (v9 && !a3)
    {
      if (IXACanLogMessageAtLevel())
      {
        v10 = IXAFeedbackLogFacility();
        if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG)) {
          -[TUIFeedbackController shouldCompleteStudyWithPreferenceValue:]();
        }
      }
      LOBYTE(v4) = 1;
    }
  }
  return v4;
}

- (void)completeStudyWithFinalPreferenceValue:(BOOL)a3 parentController:(id)a4
{
  BOOL v4 = a3;
  uint64_t v6 = (void *)MEMORY[0x263F7E550];
  id v7 = a4;
  uint64_t v8 = [v6 getFeedbackState];
  BOOL v9 = [MEMORY[0x263EFF910] now];
  [(TUIFeedbackController *)self _updateStudyDataWithFinalPreferenceValue:v4 finalTimestamp:v9];

  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __80__TUIFeedbackController_completeStudyWithFinalPreferenceValue_parentController___block_invoke;
  v10[3] = &unk_2653ABD10;
  v10[4] = self;
  v10[5] = v8;
  [(TUIFeedbackController *)self _presentSurveyWithParentController:v7 completionHandler:v10];
}

uint64_t __80__TUIFeedbackController_completeStudyWithFinalPreferenceValue_parentController___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return [*(id *)(a1 + 32) _updateStudyDataWithSurveyOutcome:a2 surveyError:a3 initialState:*(void *)(a1 + 40)];
}

- (void)_presentSurveyWithParentController:(id)a3 completionHandler:(id)a4
{
  id v5 = a4;
  uint64_t v6 = [MEMORY[0x263F7E550] getFormIdentifier];
  id v7 = (void *)MEMORY[0x263F3C688];
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __78__TUIFeedbackController__presentSurveyWithParentController_completionHandler___block_invoke;
  v10[3] = &unk_2653ABD60;
  v12 = self;
  id v13 = v5;
  id v11 = v6;
  id v8 = v6;
  id v9 = v5;
  [v7 fetchCountsForFormWithIdentifier:v8 completion:v10];
}

void __78__TUIFeedbackController__presentSurveyWithParentController_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a3;
  if (v5)
  {
    if (IXACanLogMessageAtLevel())
    {
      uint64_t v6 = IXADefaultLogFacility();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG)) {
        __78__TUIFeedbackController__presentSurveyWithParentController_completionHandler___block_invoke_cold_3((uint64_t)v5);
      }
    }
    id v7 = *(void (**)(void))(*(void *)(a1 + 48) + 16);
LABEL_13:
    v7();
    goto LABEL_14;
  }
  id v8 = [a2 currentCampaign];

  if (v8)
  {
    if (IXACanLogMessageAtLevel())
    {
      id v9 = IXADefaultLogFacility();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG)) {
        __78__TUIFeedbackController__presentSurveyWithParentController_completionHandler___block_invoke_cold_2();
      }
    }
    id v7 = *(void (**)(void))(*(void *)(a1 + 48) + 16);
    goto LABEL_13;
  }
  v10 = (void *)[objc_alloc(MEMORY[0x263F3C690]) initWithIdentifier:*(void *)(a1 + 32)];
  [v10 prefill:@":like_purchase", @"Yes, no or maybe" answer];
  id v11 = [*(id *)(a1 + 40) computeSurveyMetadata];
  if ([v11 initialPreferenceValue]) {
    v12 = @"1";
  }
  else {
    v12 = @"0";
  }
  [v10 prefill:@":initialPreferenceValue" answer:v12];
  id v13 = objc_msgSend(NSString, "stringWithFormat:", @"%ld", objc_msgSend(v11, "duration"));
  [v10 prefill:@":duration" answer:v13];

  [v10 setAuthenticationMethod:1];
  v24 = (void *)[objc_alloc(MEMORY[0x263F3C680]) initWithFeedbackForm:v10];
  id v14 = objc_alloc_init(MEMORY[0x263F3C698]);
  [v14 setPromptStyle:1];
  v15 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  v16 = [v15 localizedStringForKey:@"FEEDBACK_AUTOCORRECTION_DISABLED_TITLE" value:&stru_2703CEDD8 table:0];
  [v14 setLocalizedPromptTitle:v16];

  v17 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  v18 = [v17 localizedStringForKey:@"FEEDBACK_AUTOCORRECTION_DISABLED_MESSAGE" value:&stru_2703CEDD8 table:0];
  [v14 setLocalizedPromptMessage:v18];

  v19 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  v20 = [v19 localizedStringForKey:@"FEEDBACK_DECLINE_ACTION_LABEL" value:&stru_2703CEDD8 table:0];
  [v14 setLocalizedAlertViewDeclineButtonTitle:v20];

  v21 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  v22 = [v21 localizedStringForKey:@"FEEDBACK_ACCEPT_ACTION_LABEL" value:&stru_2703CEDD8 table:0];
  [v14 setLocalizedAlertViewProceedButtonTitle:v22];

  if (IXACanLogMessageAtLevel())
  {
    v23 = IXADefaultLogFacility();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_DEBUG)) {
      __78__TUIFeedbackController__presentSurveyWithParentController_completionHandler___block_invoke_cold_1((void *)(a1 + 32));
    }
  }
  v25[0] = MEMORY[0x263EF8330];
  v25[1] = 3221225472;
  v25[2] = __78__TUIFeedbackController__presentSurveyWithParentController_completionHandler___block_invoke_149;
  v25[3] = &unk_2653ABD38;
  id v26 = *(id *)(a1 + 48);
  [v24 collectFeedbackWithLaunchConfiguration:v14 completion:v25];

LABEL_14:
}

uint64_t __78__TUIFeedbackController__presentSurveyWithParentController_completionHandler___block_invoke_149(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)_updateStudyDataWithFinalPreferenceValue:(BOOL)a3 finalTimestamp:(id)a4
{
  BOOL v4 = a3;
  uint64_t v14 = *MEMORY[0x263EF8340];
  id v6 = a4;
  id v7 = [(TUIFeedbackController *)self currentInputModes];
  [MEMORY[0x263F7E550] setFeedbackState:1];
  [MEMORY[0x263F7E550] setFinalInputModes:v7];
  [MEMORY[0x263F7E550] setFinalTimestamp:v6];
  [MEMORY[0x263F7E550] setFinalPreferenceValue:v4];
  if (IXACanLogMessageAtLevel())
  {
    id v8 = IXAFeedbackLogFacility();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
    {
      id v9 = NSString;
      v10 = [MEMORY[0x263F7E550] getStudyID];
      id v11 = [v9 stringWithFormat:@"%s Feedback %@: completeStudy finalPreferenceValue: %d finalInputModes: %@ finalTimestamp: %@", "-[TUIFeedbackController _updateStudyDataWithFinalPreferenceValue:finalTimestamp:]", v10, v4, v7, v6];
      *(_DWORD *)buf = 138412290;
      id v13 = v11;
      _os_log_debug_impl(&dword_254414000, v8, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
    }
  }
}

- (void)_updateStudyDataWithSurveyOutcome:(int64_t)a3 surveyError:(id)a4 initialState:(int64_t)a5
{
  id v6 = (__CFString *)a4;
  [MEMORY[0x263F7E550] setFeedbackState:3];
  [MEMORY[0x263F7E550] setSurveyOutcome:a3];
  if (IXACanLogMessageAtLevel())
  {
    id v7 = IXAFeedbackLogFacility();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
      -[TUIFeedbackController _updateStudyDataWithSurveyOutcome:surveyError:initialState:](v6, a3);
    }
  }
}

- (id)computeSurveyMetadata
{
  v3 = [MEMORY[0x263EFF960] currentLocale];
  BOOL v4 = [TUIFeedbackSurveyMetadata alloc];
  v23 = [(TUIFeedbackController *)self build];
  v22 = [(TUIFeedbackController *)self model];
  uint64_t v5 = [v3 languageCode];
  id v6 = (void *)v5;
  if (v5) {
    id v7 = (__CFString *)v5;
  }
  else {
    id v7 = &stru_2703CEDD8;
  }
  v21 = v7;
  uint64_t v8 = [v3 countryCode];
  id v9 = (void *)v8;
  if (v8) {
    v10 = (__CFString *)v8;
  }
  else {
    v10 = &stru_2703CEDD8;
  }
  v20 = v10;
  uint64_t v11 = [MEMORY[0x263F7E550] getInitialPreferenceValue];
  v12 = [MEMORY[0x263F7E550] getInitialInputModes];
  id v13 = [MEMORY[0x263F7E550] getInitialTimestamp];
  char v14 = [MEMORY[0x263F7E550] getFinalPreferenceValue];
  v15 = [MEMORY[0x263F7E550] getFinalInputModes];
  v16 = [MEMORY[0x263F7E550] getFinalTimestamp];
  LOBYTE(v19) = v14;
  v17 = [(TUIFeedbackSurveyMetadata *)v4 initWithBuild:v23 model:v22 language:v21 region:v20 initialPreferenceValue:v11 initialInputModes:v12 initialTimestamp:v13 finalPreferenceValue:v19 finalInputModes:v15 finalTimestamp:v16];

  return v17;
}

- (id)currentInputModes
{
  id v2 = [MEMORY[0x263F1C748] sharedInputModeController];
  v3 = [v2 enabledInputModeIdentifiers];

  return v3;
}

- (BOOL)feedbackFeatureEnabled
{
  if (feedbackFeatureEnabled_once_token != -1) {
    dispatch_once(&feedbackFeatureEnabled_once_token, &__block_literal_global);
  }
  if (feedbackFeatureEnabled_is_internal_install)
  {
    id v2 = (void *)[objc_alloc(MEMORY[0x263EFFA40]) initWithSuiteName:@"com.apple.keyboard"];
    char v3 = [v2 BOOLForKey:@"feedbackFeatureEnabled"];
  }
  else
  {
    char v3 = 0;
  }
  if (IXACanLogMessageAtLevel())
  {
    BOOL v4 = IXAFeedbackLogFacility();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG)) {
      -[TUIFeedbackController feedbackFeatureEnabled](v3);
    }
  }
  return v3;
}

uint64_t __47__TUIFeedbackController_feedbackFeatureEnabled__block_invoke()
{
  uint64_t result = MGGetBoolAnswer();
  feedbackFeatureEnabled_is_internal_install = result;
  return result;
}

- (id)build
{
  if (build_onceToken != -1) {
    dispatch_once(&build_onceToken, &__block_literal_global_176);
  }
  id v2 = (void *)build_build;
  return v2;
}

void __30__TUIFeedbackController_build__block_invoke()
{
  v1 = (__CFString *)MGCopyAnswer();
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    v0 = v1;
  }
  else {
    v0 = &stru_2703CEDD8;
  }
  objc_storeStrong((id *)&build_build, v0);
}

- (id)model
{
  if (model_onceToken != -1) {
    dispatch_once(&model_onceToken, &__block_literal_global_181);
  }
  id v2 = (void *)model_deviceModelName;
  return v2;
}

void __30__TUIFeedbackController_model__block_invoke()
{
  v1 = (__CFString *)MGCopyAnswer();
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    v0 = v1;
  }
  else {
    v0 = &stru_2703CEDD8;
  }
  objc_storeStrong((id *)&model_deviceModelName, v0);
}

- (void)shouldCompleteStudyWithPreferenceValue:.cold.1()
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  v0 = NSString;
  v1 = [MEMORY[0x263F7E550] getStudyID];
  id v2 = [v0 stringWithFormat:@"%s Feedback %@: action: completionPending", "-[TUIFeedbackController shouldCompleteStudyWithPreferenceValue:]", v1];
  int v5 = 138412290;
  id v6 = v2;
  OUTLINED_FUNCTION_0(&dword_254414000, v3, v4, "%@", (uint8_t *)&v5);
}

- (void)shouldCompleteStudyWithPreferenceValue:(char)a1 .cold.2(char a1)
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  id v2 = NSString;
  uint64_t v3 = [MEMORY[0x263F7E550] getStudyID];
  uint64_t v4 = [v2 stringWithFormat:@"%s Feedback %@: eligible: %d", "-[TUIFeedbackController shouldCompleteStudyWithPreferenceValue:]", v3, a1 & 1];
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_254414000, v5, v6, "%@", v7);
}

void __78__TUIFeedbackController__presentSurveyWithParentController_completionHandler___block_invoke_cold_1(void *a1)
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  id v2 = NSString;
  uint64_t v3 = [MEMORY[0x263F7E550] getStudyID];
  uint64_t v4 = [v2 stringWithFormat:@"%s Feedback %@: launching survey: %@", "-[TUIFeedbackController _presentSurveyWithParentController:completionHandler:]_block_invoke", v3, *a1];
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_254414000, v5, v6, "%@", v7);
}

void __78__TUIFeedbackController__presentSurveyWithParentController_completionHandler___block_invoke_cold_2()
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  v0 = NSString;
  v1 = [MEMORY[0x263F7E550] getStudyID];
  id v2 = [v0 stringWithFormat:@"%s Feedback %@: already running a campaign - should not happen", "-[TUIFeedbackController _presentSurveyWithParentController:completionHandler:]_block_invoke", v1];
  int v5 = 138412290;
  uint64_t v6 = v2;
  OUTLINED_FUNCTION_0(&dword_254414000, v3, v4, "%@", (uint8_t *)&v5);
}

void __78__TUIFeedbackController__presentSurveyWithParentController_completionHandler___block_invoke_cold_3(uint64_t a1)
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  id v2 = NSString;
  uint64_t v3 = [MEMORY[0x263F7E550] getStudyID];
  uint64_t v4 = [v2 stringWithFormat:@"%s Feedback %@: error getting response from feedback service: %@", "-[TUIFeedbackController _presentSurveyWithParentController:completionHandler:]_block_invoke", v3, a1];
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_254414000, v5, v6, "%@", v7);
}

- (void)_updateStudyDataWithSurveyOutcome:(__CFString *)a1 surveyError:(uint64_t)a2 initialState:.cold.1(__CFString *a1, uint64_t a2)
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  uint64_t v4 = NSString;
  uint64_t v5 = [MEMORY[0x263F7E550] getStudyID];
  uint64_t v6 = (void *)v5;
  uint64_t v7 = @"none";
  if (a1) {
    uint64_t v7 = a1;
  }
  uint64_t v8 = [v4 stringWithFormat:@"%s Feedback %@: completeStudy surveyOutcome: %ld surveyError: %@", "-[TUIFeedbackController _updateStudyDataWithSurveyOutcome:surveyError:initialState:]", v5, a2, v7];
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_254414000, v9, v10, "%@", v11);
}

- (void)feedbackFeatureEnabled
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  id v2 = NSString;
  uint64_t v3 = [MEMORY[0x263F7E550] getStudyID];
  uint64_t v4 = [v2 stringWithFormat:@"%s Feedback %@: RC_SEED_BUILD: 0 enabled: %d", "-[TUIFeedbackController feedbackFeatureEnabled]", v3, a1 & 1];
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_254414000, v5, v6, "%@", v7);
}

@end