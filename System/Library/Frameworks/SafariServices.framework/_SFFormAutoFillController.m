@interface _SFFormAutoFillController
+ (id)_filterAndSortCredentialIdentities:(id)a3 pageURL:(id)a4 exactMatchesOnly:(BOOL)a5;
+ (void)_getExternalLoginCredentialSuggestionsForDomains:(id)a3 pageURL:(id)a4 webFrameIdentifier:(id)a5 completion:(id)a6;
+ (void)_getExternalLoginCredentialSuggestionsForDomains:(id)a3 webFrameIdentifier:(id)a4 completion:(id)a5;
- (BOOL)_presentStreamlinedStrongPasswordInputViewIfNeededWithInputSession:(id)a3 formType:(unint64_t)a4;
- (BOOL)_presentStrongPasswordIntroductionIfNeededWithAutoFillInputSession:(id)a3;
- (BOOL)_showingAutoFillInputView;
- (BOOL)didCloseStrongPasswordIntroductionView;
- (BOOL)displayMessageAsTitleForContext:(id)a3;
- (BOOL)elementIsBeingFocusedForStreamlinedLogin:(id)a3;
- (BOOL)metadataCorrectionsEnabled;
- (BOOL)shouldAutofillESimInformation;
- (BOOL)shouldGenerateStrongPasswordForFormOfType:(unint64_t)a3;
- (BOOL)shouldShowPasswordManagementAppOnboardingViews;
- (BOOL)shouldSuggestToCustomizeStrongPassword;
- (BOOL)waitingForCreditCardDataFromWallet;
- (CNContact)lastFilledContact;
- (NSDictionary)creditCardFormValues;
- (NSDictionary)lastFilledCreditCardDataTypes;
- (NSMutableSet)previouslyFilledVirtualCardNumbers;
- (NSString)currentStrongPassword;
- (NSString)defaultStrongPassword;
- (NSUUID)tabIDForAutoFill;
- (SFAppAutoFillOneTimeCodeProvider)oneTimeCodeProvider;
- (WBSCreditCardData)lastFilledCreditCardData;
- (WBSSavedAccountContext)savedAccountContext;
- (WBUFormAutoFillWebView)webView;
- (_SFAuthenticationContext)authenticationContext;
- (_SFFormAutoFillController)initWithWebView:(id)a3 delegate:(id)a4;
- (_SFFormAutoFillTestController)testController;
- (id)_beginAutomaticPasswordInteractionWithInputSession:(id)a3 generatedPassword:(id)a4 ignorePreviousDecision:(BOOL)a5;
- (id)_customInputViewFromAutoFillInputSession;
- (id)_preFillDisabledHosts;
- (id)_websiteForAuthenticationPrompt;
- (id)alphanumericStrongPassword;
- (id)authenticationCustomUIProgressObserverForContext:(id)a3;
- (id)authenticationMessageForContext:(id)a3;
- (id)automaticPasswordForPasswordField:(id)a3 inForm:(id)a4 isFrame:(id)a5;
- (id)beginAutomaticPasswordInteractionWithInputSession:(id)a3;
- (id)passcodePromptForContext:(id)a3;
- (id)placeholderImageForStrongPasswordIntroductionViewController:(id)a3;
- (id)recentlySavedAccountForStrongPasswordIntroductionViewController:(id)a3;
- (id)strongPasswordIntroductionViewController:(id)a3 automaticStrongPasswordWithFormat:(unint64_t)a4;
- (unint64_t)autoFillFormType;
- (void)_addUniqueIDsOfAutoFilledForm:(id)a3;
- (void)_addValuesAutoFilledForCurrentPage:(id)a3;
- (void)_authenticateForAutoFillForHighLevelDomain:(id)a3 withCompletion:(id)a4;
- (void)_collectDiagnosticsForAutoFillIncludingPageContents:(BOOL)a3 completionHandler:(id)a4;
- (void)_createFormTelemetryDataMonitorIfNeeded;
- (void)_customInputViewFromAutoFillInputSession;
- (void)_didFocusSensitiveFormField;
- (void)_dismissAutoFillInternalFeedbackNoticeImmediately:(BOOL)a3;
- (void)_dismissKeyboardAndSimulateCarriageReturnKeyEvents:(BOOL)a3;
- (void)_ensureCurrentStrongPasswordExists;
- (void)_fieldFocused:(id)a3 inForm:(id)a4 inFrame:(id)a5 inputSession:(id)a6;
- (void)_fieldFocusedWithInputSession:(id)a3;
- (void)_hideInputAssistantItemsIfNecessary;
- (void)_prefillTimerFired:(id)a3;
- (void)_presentAutoFillInternalFeedbackActivityNotificationIfNeeded;
- (void)_removeAutomaticPasswordButtonInitiatedByUser:(BOOL)a3 removeVisualTreatmentOnly:(BOOL)a4;
- (void)_removeUniqueIDsOfAutoFilledForm:(id)a3;
- (void)_restoreInputAssistantItemsIfNecessary;
- (void)_showICloudKeychainViewInCurrentInputView;
- (void)_updateFormTelemetryDataMonitorWithFormMetadata:(id)a3 textFieldMetadata:(id)a4 textFieldValueLength:(unint64_t)a5;
- (void)annotateForm:(int64_t)a3 inFrame:(id)a4 withValues:(id)a5;
- (void)authenticateIfNeededForAutoFillAuthenticationType:(int64_t)a3 user:(id)a4 shouldForceAuthentication:(BOOL)a5 withCompletion:(id)a6;
- (void)autoFill;
- (void)autoFillDidFinishWithUpdatedFormMetadata:(id)a3 inFrame:(id)a4 shouldSubmit:(BOOL)a5;
- (void)autoFillForm:(int64_t)a3 inFrame:(id)a4 withGeneratedPassword:(id)a5;
- (void)autoFillFormInFrame:(id)a3 withValues:(id)a4 setAutoFilled:(BOOL)a5 focusFieldAfterFilling:(BOOL)a6 fieldToFocus:(id)a7 fieldsToObscure:(id)a8 submitForm:(BOOL)a9;
- (void)autoFillFormInFrame:(id)a3 withValues:(id)a4 setAutoFilled:(BOOL)a5 focusFieldAfterFilling:(BOOL)a6 fieldToFocus:(id)a7 submitForm:(BOOL)a8;
- (void)autoFillInputViewShouldClose:(id)a3;
- (void)autoFillOneTimeCodeFieldsInFrame:(id)a3 withValue:(id)a4 shouldSubmit:(BOOL)a5;
- (void)autoFillTextSuggestion:(id)a3;
- (void)autoFilledField:(id)a3 inForm:(id)a4;
- (void)automaticPasswordSheetDismissed;
- (void)beginAutomaticPasswordInteractionWithInputSession:(id)a3 generatedPassword:(id)a4;
- (void)clearAutoFilledCreditCardFieldsInFrame:(id)a3 textFieldMetadata:(id)a4 formMetadata:(id)a5 completionHandler:(id)a6;
- (void)clearFieldsAndSetFormControlsToNotAutoFilled:(id)a3 inFrame:(id)a4 completionHandler:(id)a5;
- (void)collectDiagnosticsForAutoFillWithCompletionHandler:(id)a3;
- (void)copyCurrentStrongPassword;
- (void)dealloc;
- (void)didCollectFormMetadataForPageLevelAutoFill:(id)a3 atURL:(id)a4;
- (void)didCollectFormMetadataForPreFilling:(id)a3 atURL:(id)a4;
- (void)didCollectURLsForPreFilling:(id)a3 atURL:(id)a4 inFrame:(id)a5;
- (void)didCompleteWithPasskey;
- (void)didCompleteWithSavedAccount:(id)a3;
- (void)didFillGeneratedPasswordInForm:(id)a3 inFrame:(id)a4;
- (void)didPerformPageLevelAutoFill:(BOOL)a3;
- (void)didRemoveAutomaticStrongPasswordInForm:(id)a3 inputSessionUserObject:(id)a4 inFrame:(id)a5;
- (void)didUpdateUnsubmittedForm:(id)a3 inFrame:(id)a4;
- (void)fetchIconForURLWithCompletionHandler:(id)a3;
- (void)fetchMetadataForTextField:(id)a3 inFrame:(id)a4 withCompletion:(id)a5;
- (void)fieldDidFocusWithInputSession:(id)a3;
- (void)fieldFocusedWithInputSession:(id)a3;
- (void)fieldWillFocusWithInputSession:(id)a3;
- (void)fillCreditCardData:(id)a3 inFrame:(id)a4 textFieldMetadata:(id)a5 formMetadata:(id)a6;
- (void)fillCurrentAutomaticStrongPasswordInCurrentFrameBlurringAfterSubstitution:(BOOL)a3 completionHandler:(id)a4;
- (void)fillTextField:(id)a3 inFrame:(id)a4 withGeneratedPassword:(id)a5;
- (void)generateAndFillStrongPassword;
- (void)handleDidSaveAccountWithGeneratedPasswordNotification:(id)a3;
- (void)handleDidUpdatePasswordForPreviouslySavedAccount:(id)a3;
- (void)hideInputAccessoryView;
- (void)imageForStrongPasswordIntroductionViewController:(id)a3 completionHandler:(id)a4;
- (void)insertTextSuggestion:(id)a3;
- (void)invalidate;
- (void)makeStrongPasswordFieldViewableAndEditable:(BOOL)a3;
- (void)offerToSaveUnsubmittedFormDataIfNeeded;
- (void)offerToSaveUnsubmittedFormDataIfNeededInWebView:(id)a3 fromSameDocumentNavigationOfType:(int64_t)a4;
- (void)performPageLevelAutoFill;
- (void)prefillFormsSoonIfNeeded;
- (void)prepareForShowingAutomaticStrongPasswordWithInputSession:(id)a3;
- (void)reloadFirstResponderInputViews;
- (void)removeAutomaticPasswordButtonInitiatedByUser:(BOOL)a3;
- (void)removeAutomaticPasswordVisualTreatment;
- (void)replaceCurrentPasswordWithPassword:(id)a3;
- (void)reportAutoFillOfferedType:(unint64_t)a3 forTextFieldWithID:(id)a4 forFormMetadata:(id)a5;
- (void)sendEventsForAutoFillTelemetry;
- (void)setAutoFillSpinnerVisibility:(BOOL)a3 textFieldMetadata:(id)a4 frame:(id)a5;
- (void)setDidCloseStrongPasswordIntroductionView:(BOOL)a3;
- (void)setFormControls:(id)a3 areAutoFilled:(BOOL)a4 andClearField:(id)a5 inFrame:(id)a6;
- (void)setLastFilledContact:(id)a3;
- (void)setLastFilledCreditCardData:(id)a3;
- (void)setLastFilledCreditCardDataTypes:(id)a3;
- (void)setMetadataCorrectionsEnabled:(BOOL)a3;
- (void)setPreviouslyFilledVirtualCardNumbers:(id)a3;
- (void)setShouldAutofillESimInformation:(BOOL)a3;
- (void)setShouldSuggestToCustomizeStrongPassword:(BOOL)a3;
- (void)setTestController:(id)a3;
- (void)setUpFormTelemetryDataMonitorWithWebpageLocale:(id)a3;
- (void)setWaitingForCreditCardDataFromWallet:(BOOL)a3;
- (void)showSpinnerInFormSoon:(id)a3 frame:(id)a4;
- (void)stopShowingSpinnerInFormSoon:(double)a3 textFieldMetadata:(id)a4 frame:(id)a5;
- (void)strongPasswordIntroductionViewController:(id)a3 shouldPerformAction:(unint64_t)a4 willShowAdditionalView:(BOOL)a5;
- (void)suppressSoftwareKeyboardOnWebView:(BOOL)a3;
- (void)textDidChangeInTextField:(id)a3 inForm:(id)a4 inFrame:(id)a5;
- (void)updateExistingStreamlinedSuggestionIfNecessary:(id)a3;
- (void)updateSuggestions;
- (void)userDidSelectShowMorePasswords;
- (void)userDidSelectUseKeyboard;
- (void)usernameFieldFocused:(id)a3 inForm:(id)a4 inFrame:(id)a5 inputSession:(id)a6;
- (void)willNavigateFrame:(id)a3 withUnsubmittedForm:(id)a4;
- (void)willSubmitForm:(id)a3 inFrame:(id)a4 submissionHandler:(id)a5;
- (void)willSubmitFormValues:(id)a3 userObject:(id)a4 submissionHandler:(id)a5;
@end

@implementation _SFFormAutoFillController

- (void)setMetadataCorrectionsEnabled:(BOOL)a3
{
  self->_metadataCorrectionsEnabled = a3;
}

- (_SFFormAutoFillController)initWithWebView:(id)a3 delegate:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v53.receiver = self;
  v53.super_class = (Class)_SFFormAutoFillController;
  v8 = [(_SFFormAutoFillController *)&v53 init];
  v9 = v8;
  if (v8)
  {
    objc_storeWeak((id *)&v8->_webView, v6);
    objc_storeWeak((id *)&v9->_delegate, v7);
    dispatch_queue_t v10 = dispatch_queue_create("com.apple.mobilesafari.FormTelemetryDataMonitorQueue", 0);
    formTelemetryDataMonitorQueue = v9->_formTelemetryDataMonitorQueue;
    v9->_formTelemetryDataMonitorQueue = (OS_dispatch_queue *)v10;

    v12 = [MEMORY[0x1E4F1CAD0] setWithObject:objc_opt_class()];
    uint64_t v13 = [MEMORY[0x1E4F46788] remoteObjectInterfaceWithProtocol:&unk_1EFC30EB8];
    remoteObjectInterface = v9->_remoteObjectInterface;
    v9->_remoteObjectInterface = (_WKRemoteObjectInterface *)v13;

    v15 = v9->_remoteObjectInterface;
    v16 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v17 = objc_opt_class();
    v18 = objc_msgSend(v16, "setWithObjects:", v17, objc_opt_class(), 0);
    [(_WKRemoteObjectInterface *)v15 setClasses:v18 forSelector:sel_didCollectURLsForPreFilling_atURL_inFrame_ argumentIndex:0 ofReply:0];

    v19 = v9->_remoteObjectInterface;
    v20 = metadataClasses();
    v21 = [v20 setByAddingObjectsFromSet:v12];
    [(_WKRemoteObjectInterface *)v19 setClasses:v21 forSelector:sel_didCollectFormMetadataForPreFilling_atURL_ argumentIndex:0 ofReply:0];

    v22 = v9->_remoteObjectInterface;
    v23 = metadataClasses();
    v24 = [v23 setByAddingObjectsFromSet:v12];
    [(_WKRemoteObjectInterface *)v22 setClasses:v24 forSelector:sel_didCollectFormMetadataForPageLevelAutoFill_atURL_ argumentIndex:0 ofReply:0];

    v25 = v9->_remoteObjectInterface;
    v26 = metadataClasses();
    [(_WKRemoteObjectInterface *)v25 setClasses:v26 forSelector:sel_textDidChangeInTextField_inForm_inFrame_ argumentIndex:0 ofReply:0];

    v27 = v9->_remoteObjectInterface;
    v28 = [MEMORY[0x1E4F1CAD0] setWithObject:objc_opt_class()];
    [(_WKRemoteObjectInterface *)v27 setClasses:v28 forSelector:sel_textDidChangeInTextField_inForm_inFrame_ argumentIndex:1 ofReply:0];

    [(_WKRemoteObjectInterface *)v9->_remoteObjectInterface setClasses:v12 forSelector:sel_textDidChangeInTextField_inForm_inFrame_ argumentIndex:2 ofReply:0];
    v29 = v9->_remoteObjectInterface;
    v30 = metadataClasses();
    [(_WKRemoteObjectInterface *)v29 setClasses:v30 forSelector:sel_didFillGeneratedPasswordInForm_inFrame_ argumentIndex:0 ofReply:0];

    [(_WKRemoteObjectInterface *)v9->_remoteObjectInterface setClasses:v12 forSelector:sel_didFillGeneratedPasswordInForm_inFrame_ argumentIndex:1 ofReply:0];
    [(_WKRemoteObjectInterface *)v9->_remoteObjectInterface setClasses:v12 forSelector:sel_willNavigateFrame_withUnsubmittedForm_ argumentIndex:0 ofReply:0];
    v31 = v9->_remoteObjectInterface;
    v32 = metadataClasses();
    [(_WKRemoteObjectInterface *)v31 setClasses:v32 forSelector:sel_willNavigateFrame_withUnsubmittedForm_ argumentIndex:1 ofReply:0];

    v33 = v9->_remoteObjectInterface;
    v34 = metadataClasses();
    [(_WKRemoteObjectInterface *)v33 setClasses:v34 forSelector:sel_didUpdateUnsubmittedForm_inFrame_ argumentIndex:0 ofReply:0];

    [(_WKRemoteObjectInterface *)v9->_remoteObjectInterface setClasses:v12 forSelector:sel_didUpdateUnsubmittedForm_inFrame_ argumentIndex:1 ofReply:0];
    v35 = v9->_remoteObjectInterface;
    v36 = metadataClasses();
    [(_WKRemoteObjectInterface *)v35 setClasses:v36 forSelector:sel_didRemoveAutomaticStrongPasswordInForm_inputSessionUserObject_inFrame_ argumentIndex:0 ofReply:0];

    v37 = v9->_remoteObjectInterface;
    v38 = metadataClasses();
    v39 = [v38 setByAddingObjectsFromSet:v12];
    [(_WKRemoteObjectInterface *)v37 setClasses:v39 forSelector:sel_didRemoveAutomaticStrongPasswordInForm_inputSessionUserObject_inFrame_ argumentIndex:1 ofReply:0];

    [(_WKRemoteObjectInterface *)v9->_remoteObjectInterface setClasses:v12 forSelector:sel_didRemoveAutomaticStrongPasswordInForm_inputSessionUserObject_inFrame_ argumentIndex:2 ofReply:0];
    v40 = [v6 _remoteObjectRegistry];
    [v40 registerExportedObject:v9 interface:v9->_remoteObjectInterface];
    v41 = [MEMORY[0x1E4F46788] remoteObjectInterfaceWithProtocol:&unk_1EFC56210];
    v42 = [MEMORY[0x1E4F1CAD0] setWithObject:objc_opt_class()];
    [v41 setClasses:v42 forSelector:sel_getMetadataForTextField_inFrame_atURL_completionHandler_ argumentIndex:0 ofReply:1];

    v43 = metadataClasses();
    [v41 setClasses:v43 forSelector:sel_getMetadataForTextField_inFrame_atURL_completionHandler_ argumentIndex:1 ofReply:1];

    v44 = metadataClasses();
    [v41 setClasses:v44 forSelector:sel_diagnosticsFormMetadataWithCompletionHandler_ argumentIndex:0 ofReply:1];

    uint64_t v45 = [v40 remoteObjectProxyWithInterface:v41];
    autoFiller = v9->_autoFiller;
    v9->_autoFiller = (SFFormAutoFiller *)v45;

    v47 = [MEMORY[0x1E4F98230] sharedManager];
    [v47 addObserver:v9];

    v48 = [MEMORY[0x1E4F28EB8] defaultCenter];
    v49 = +[_SFFormDataController sharedController];
    [v48 addObserver:v9 selector:sel_handleDidSaveAccountWithGeneratedPasswordNotification_ name:*MEMORY[0x1E4FB6F18] object:v49];

    v50 = +[_SFFormDataController sharedController];
    [v48 addObserver:v9 selector:sel_handleDidUpdatePasswordForPreviouslySavedAccount_ name:*MEMORY[0x1E4FB6F20] object:v50];

    v51 = v9;
  }

  return v9;
}

- (void)prefillFormsSoonIfNeeded
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  char v4 = [WeakRetained formAutoFillControllerCanPrefillForm:self];

  if (v4)
  {
    [(NSTimer *)self->_prefillTimer invalidate];
    v5 = [MEMORY[0x1E4F1CB00] scheduledTimerWithTimeInterval:self target:sel__prefillTimerFired_ selector:0 userInfo:0 repeats:0.25];
    prefillTimer = self->_prefillTimer;
    self->_prefillTimer = v5;
  }
}

- (void)dealloc
{
  [(_SFFormAutoFillController *)self invalidate];
  v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
  char v4 = +[_SFFormDataController sharedController];
  [v3 removeObserver:self name:*MEMORY[0x1E4FB6F18] object:v4];

  v5 = +[_SFFormDataController sharedController];
  [v3 removeObserver:self name:*MEMORY[0x1E4FB6F20] object:v5];

  v6.receiver = self;
  v6.super_class = (Class)_SFFormAutoFillController;
  [(_SFFormAutoFillController *)&v6 dealloc];
}

- (void)invalidate
{
  p_webView = &self->_webView;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_webView);
  char v4 = [WeakRetained _remoteObjectRegistry];
  [v4 unregisterExportedObject:self interface:self->_remoteObjectInterface];

  remoteObjectInterface = self->_remoteObjectInterface;
  self->_remoteObjectInterface = 0;

  [(SFFormAutocompleteState *)self->_state invalidate];
  state = self->_state;
  self->_state = 0;

  [(NSTimer *)self->_prefillTimer invalidate];
  prefillTimer = self->_prefillTimer;
  self->_prefillTimer = 0;

  objc_storeWeak((id *)p_webView, 0);
  id v9 = [MEMORY[0x1E4F98230] sharedManager];
  [v9 removeObserver:self];
}

- (void)_prefillTimerFired:(id)a3
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  id v5 = [WeakRetained formAutoFillControllerURLForFormAutoFill:self];

  [(SFFormAutoFiller *)self->_autoFiller collectURLsForPrefillingAtURL:v5];
}

- (void)offerToSaveUnsubmittedFormDataIfNeededInWebView:(id)a3 fromSameDocumentNavigationOfType:(int64_t)a4
{
  id v6 = a3;
  if (a4)
  {
    id v12 = v6;
    id v7 = +[_SFFormDataController sharedController];
    v8 = [v7 autoFillQuirksManager];

    id v9 = [v12 _committedURL];
    dispatch_queue_t v10 = [v9 host];
    char v11 = [v8 isDomainKnownToDoSameDocumentNavigationInTextEditingCallback:v10];

    if ((v11 & 1) == 0) {
      [(_SFFormAutoFillController *)self offerToSaveUnsubmittedFormDataIfNeeded];
    }

    id v6 = v12;
  }
}

- (void)offerToSaveUnsubmittedFormDataIfNeeded
{
}

- (void)autoFill
{
}

- (void)insertTextSuggestion:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    [(SFFormAutocompleteState *)self->_state showAllPasswordsButtonTapped];
  }
  else if (v4)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      [(_SFFormAutoFillController *)self autoFillTextSuggestion:v4];
    }
  }
}

- (void)updateSuggestions
{
}

- (void)_fieldFocused:(id)a3 inForm:(id)a4 inFrame:(id)a5 inputSession:(id)a6
{
  id v17 = a3;
  id v10 = a4;
  id v11 = a5;
  id v12 = a6;
  [(SFFormAutocompleteState *)self->_state invalidate];
  uint64_t v13 = [[SFFormAutocompleteState alloc] initWithFrame:v11 form:v10 textField:v17 inputSession:v12 autoFillController:self];
  state = self->_state;
  self->_state = v13;

  v15 = [v12 formInputSession];
  if ([(SFFormAutocompleteState *)self->_state action] != 7) {
    [(SFFormAutocompleteState *)self->_state updateAutoFillButton];
  }
  if ([MEMORY[0x1E4FB6EF0] textFieldLooksLikeCreditCardNumericFormField:v17])
  {
    [v15 setForceSecureTextEntry:1];
  }
  else if (![v17 isSecureTextField])
  {
    goto LABEL_7;
  }
  [(_SFFormAutoFillController *)self _didFocusSensitiveFormField];
LABEL_7:
  if ([v17 looksLikeOneTimeCodeField])
  {
    v16 = [(_SFFormAutoFillController *)self oneTimeCodeProvider];
    [v16 didFocusOneTimeCodeField];
  }
}

- (void)usernameFieldFocused:(id)a3 inForm:(id)a4 inFrame:(id)a5 inputSession:(id)a6
{
  id v13 = a3;
  id v10 = a4;
  id v11 = a5;
  id v12 = a6;
  [(_SFFormAutoFillController *)self _didFocusSensitiveFormField];
  [(_SFFormAutoFillController *)self _fieldFocused:v13 inForm:v10 inFrame:v11 inputSession:v12];
}

- (void)fetchMetadataForTextField:(id)a3 inFrame:(id)a4 withCompletion:(id)a5
{
  id v13 = a3;
  id v8 = a4;
  id v9 = a5;
  autoFiller = self->_autoFiller;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  id v12 = [WeakRetained formAutoFillControllerURLForFormAutoFill:self];
  [(SFFormAutoFiller *)autoFiller getMetadataForTextField:v13 inFrame:v8 atURL:v12 completionHandler:v9];
}

- (void)autoFillFormInFrame:(id)a3 withValues:(id)a4 setAutoFilled:(BOOL)a5 focusFieldAfterFilling:(BOOL)a6 fieldToFocus:(id)a7 submitForm:(BOOL)a8
{
  LOBYTE(v8) = a8;
  [(_SFFormAutoFillController *)self autoFillFormInFrame:a3 withValues:a4 setAutoFilled:a5 focusFieldAfterFilling:a6 fieldToFocus:a7 fieldsToObscure:0 submitForm:v8];
}

- (void)autoFillFormInFrame:(id)a3 withValues:(id)a4 setAutoFilled:(BOOL)a5 focusFieldAfterFilling:(BOOL)a6 fieldToFocus:(id)a7 fieldsToObscure:(id)a8 submitForm:(BOOL)a9
{
  BOOL v11 = a6;
  BOOL v12 = a5;
  id v25 = a3;
  id v15 = a4;
  id v16 = a7;
  id v17 = a8;
  v18 = (void *)MEMORY[0x1E4F1CAD0];
  v19 = [v15 allValues];
  v20 = [v18 setWithArray:v19];
  [(_SFFormAutoFillController *)self _addValuesAutoFilledForCurrentPage:v20];

  LOBYTE(v24) = a9;
  [(SFFormAutoFiller *)self->_autoFiller autoFillFormAsynchronouslyInFrame:v25 withValues:v15 setAutoFilled:v12 focusFieldAfterFilling:v11 fieldToFocus:v16 fieldsToObscure:v17 submitForm:v24];
  int64_t v21 = [(SFFormAutocompleteState *)self->_state action];
  if (v21 == 2 || v21 == 8)
  {
    lastFilledCreditCardData = self->_lastFilledCreditCardData;
    self->_lastFilledCreditCardData = 0;

    lastFilledCreditCardDataTypes = self->_lastFilledCreditCardDataTypes;
    self->_lastFilledCreditCardDataTypes = 0;
  }
}

- (void)autoFillForm:(int64_t)a3 inFrame:(id)a4 withGeneratedPassword:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  id v10 = [MEMORY[0x1E4F1CAD0] setWithObject:v9];
  [(_SFFormAutoFillController *)self _addValuesAutoFilledForCurrentPage:v10];

  BOOL v11 = dispatch_group_create();
  dispatch_group_enter(v11);
  BOOL v12 = +[_SFFormDataController sharedController];
  id v13 = [v12 generatedPassword];

  if (v13)
  {
    v14 = [MEMORY[0x1E4F98B70] sharedStore];
    v24[0] = MEMORY[0x1E4F143A8];
    v24[1] = 3221225472;
    v24[2] = __72___SFFormAutoFillController_autoFillForm_inFrame_withGeneratedPassword___block_invoke;
    v24[3] = &unk_1E5C73C30;
    id v25 = v11;
    [v14 updateGeneratedPassword:v13 withPassword:v9 completionHandler:v24];

    id WeakRetained = v25;
  }
  else
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_webView);
    id v16 = objc_msgSend(v8, "webui_URL");
    int64_t v21 = a3;
    id v17 = [MEMORY[0x1E4F98B70] sharedStore];
    v18 = objc_msgSend(MEMORY[0x1E4F18D98], "safari_HTMLFormProtectionSpaceForURL:", v16);
    uint64_t v19 = objc_msgSend(WeakRetained, "webui_privateBrowsingEnabled");
    v22[0] = MEMORY[0x1E4F143A8];
    v22[1] = 3221225472;
    v22[2] = __72___SFFormAutoFillController_autoFillForm_inFrame_withGeneratedPassword___block_invoke_3;
    v22[3] = &unk_1E5C73C30;
    v23 = v11;
    [v17 addGeneratedPassword:v9 forProtectionSpace:v18 inPrivateBrowsingSession:v19 completionHandler:v22];

    a3 = v21;
  }

  dispatch_time_t v20 = dispatch_time(0, 1000000000);
  dispatch_group_wait(v11, v20);
  self->_didFillStrongPasswordFromStreamlinedAutoFillView = 1;
  [(SFFormAutoFiller *)self->_autoFiller autoFillForm:a3 inFrame:v8 withGeneratedPassword:v9];
}

- (void)annotateForm:(int64_t)a3 inFrame:(id)a4 withValues:(id)a5
{
  id v12 = a4;
  id v8 = a5;
  id v9 = (void *)MEMORY[0x1E4F1CAD0];
  id v10 = [v8 allValues];
  BOOL v11 = [v9 setWithArray:v10];
  [(_SFFormAutoFillController *)self _addValuesAutoFilledForCurrentPage:v11];

  [(SFFormAutoFiller *)self->_autoFiller annotateForm:a3 inFrame:v12 withValues:v8];
}

- (void)fillTextField:(id)a3 inFrame:(id)a4 withGeneratedPassword:(id)a5
{
  id v11 = a3;
  id v8 = a4;
  id v9 = a5;
  id v10 = [MEMORY[0x1E4F1CAD0] setWithObject:v9];
  [(_SFFormAutoFillController *)self _addValuesAutoFilledForCurrentPage:v10];

  [(SFFormAutoFiller *)self->_autoFiller fillTextField:v11 inFrame:v8 withGeneratedPassword:v9];
}

- (void)autoFillOneTimeCodeFieldsInFrame:(id)a3 withValue:(id)a4 shouldSubmit:(BOOL)a5
{
  BOOL v5 = a5;
  id v10 = a3;
  id v8 = a4;
  id v9 = [MEMORY[0x1E4F1CAD0] setWithObject:v8];
  [(_SFFormAutoFillController *)self _addValuesAutoFilledForCurrentPage:v9];

  [(SFFormAutoFiller *)self->_autoFiller autoFillOneTimeCodeFieldsInFrame:v10 withValue:v8 shouldSubmit:v5];
}

- (void)setFormControls:(id)a3 areAutoFilled:(BOOL)a4 andClearField:(id)a5 inFrame:(id)a6
{
}

- (void)clearFieldsAndSetFormControlsToNotAutoFilled:(id)a3 inFrame:(id)a4 completionHandler:(id)a5
{
}

- (void)willSubmitForm:(id)a3 inFrame:(id)a4 submissionHandler:(id)a5
{
  id v16 = a3;
  id v8 = a4;
  id v9 = (void (**)(void))a5;
  uint64_t v10 = [v16 uniqueID];
  if (self->_metadataCorrectionsEnabled) {
    uint64_t v11 = [(NSMutableIndexSet *)self->_uniqueIDsOfFormsThatWereAutoFilled containsIndex:v10];
  }
  else {
    uint64_t v11 = 0;
  }
  id v12 = +[_SFFormDataController sharedController];
  [v12 setLastFilledCreditCardData:self->_lastFilledCreditCardData];
  [v12 setPreviouslyFilledVirtualCardNumbers:self->_previouslyFilledVirtualCardNumbers];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_webView);
  v14 = [(_SFFormAutoFillController *)self savedAccountContext];
  int v15 = [v12 webView:WeakRetained frame:v8 willNavigateFromForm:v16 inContext:v14 bySubmitting:1 processMetadataCorrections:v11 uniqueIDsOfControlsThatWereAutoFilled:self->_uniqueIDsOfControlsThatWereAutoFilled submissionHandler:v9];

  if (v15) {
    v9[2](v9);
  }
  [v12 setLastFilledCreditCardData:0];
  [(_SFFormAutoFillController *)self _removeUniqueIDsOfAutoFilledForm:v16];
  [(_SFFormAutoFillController *)self sendEventsForAutoFillTelemetry];
  [(_SFFormAutoFillController *)self _dismissAutoFillInternalFeedbackNoticeImmediately:0];
}

- (WBUFormAutoFillWebView)webView
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_webView);

  return (WBUFormAutoFillWebView *)WeakRetained;
}

- (void)suppressSoftwareKeyboardOnWebView:(BOOL)a3
{
  BOOL v3 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_webView);
  [WeakRetained _setSuppressSoftwareKeyboard:v3];
}

- (void)fieldWillFocusWithInputSession:(id)a3
{
  id v4 = a3;
  [(_SFFormAutoFillController *)self _restoreInputAssistantItemsIfNecessary];
  BOOL v5 = self->_externalCredentialIdentitiesForStreamlinedAutoFill;
  externalCredentialIdentitiesForStreamlinedAutoFill = self->_externalCredentialIdentitiesForStreamlinedAutoFill;
  self->_externalCredentialIdentitiesForStreamlinedAutoFill = 0;

  id v7 = [v4 autoFillInputSessionUserObject];
  if (v7)
  {
    id v8 = [v4 frameHandle];
    id v9 = v8;
    if (!v8)
    {
LABEL_22:

      goto LABEL_23;
    }
    uint64_t v10 = objc_msgSend(v8, "webui_URL");
    char v11 = objc_msgSend(v10, "safari_isEligibleToShowNotSecureWarning");

    id v12 = [v4 formMetadata];
    if (!v12)
    {
LABEL_21:

      goto LABEL_22;
    }
    id v13 = (void *)MEMORY[0x1E4F98C30];
    v14 = [v7 objectForKeyedSubscript:@"usernameField"];
    uint64_t v15 = [v13 formControlMetadataFromSerializedData:v14];

    id v16 = (void *)MEMORY[0x1E4F98C30];
    id v17 = [v7 objectForKeyedSubscript:@"passwordField"];
    uint64_t v30 = [v16 formControlMetadataFromSerializedData:v17];

    if (v15)
    {
      [(_SFFormAutoFillController *)self usernameFieldFocused:v15 inForm:v12 inFrame:v9 inputSession:v4];
    }
    else
    {
      if (!v30)
      {
        dispatch_time_t v20 = (void *)MEMORY[0x1E4F98B48];
        int64_t v21 = [v7 objectForKeyedSubscript:@"textField"];
        v22 = [v20 formControlMetadataFromSerializedData:v21];

        if ((v11 & 1) == 0) {
          [(_SFFormAutoFillController *)self textFieldFocused:v22 inForm:v12 inFrame:v9 inputSession:v4];
        }

        goto LABEL_20;
      }
      [(_SFFormAutoFillController *)self passwordFieldFocused:v30 inForm:v12 inFrame:v9 inputSession:v4];
    }
    if ((v11 & 1) == 0)
    {
      if (v15 | v30)
      {
        uint64_t v18 = [v12 type];
        if (![(_SFFormAutoFillController *)self _presentStrongPasswordIntroductionIfNeededWithAutoFillInputSession:v4]&& ![(_SFFormAutoFillController *)self _presentStreamlinedStrongPasswordInputViewIfNeededWithInputSession:v4 formType:v18])
        {
          uint64_t v19 = [v4 focusedElementInfo];
          if ([(_SFFormAutoFillController *)self elementIsBeingFocusedForStreamlinedLogin:v19])
          {

            goto LABEL_18;
          }
          BOOL attemptedOfferingStreamlinedLogin = self->_attemptedOfferingStreamlinedLogin;

          if (!attemptedOfferingStreamlinedLogin)
          {
LABEL_18:
            if (v18 == 3)
            {
              objc_initWeak(location, self);
              self->_BOOL attemptedOfferingStreamlinedLogin = 1;
              id WeakRetained = objc_loadWeakRetained((id *)&self->_webView);
              [WeakRetained _setSuppressSoftwareKeyboard:1];

              dispatch_time_t v25 = dispatch_time(0, 3000000000);
              block[0] = MEMORY[0x1E4F143A8];
              block[1] = 3221225472;
              block[2] = __60___SFFormAutoFillController_fieldWillFocusWithInputSession___block_invoke;
              block[3] = &unk_1E5C731C0;
              objc_copyWeak(&v38, location);
              dispatch_after(v25, MEMORY[0x1E4F14428], block);
              v26 = objc_msgSend(v9, "webui_URL");
              v27 = [(NSDictionary *)v5 objectForKeyedSubscript:v26];

              state = self->_state;
              v31[0] = MEMORY[0x1E4F143A8];
              v31[1] = 3221225472;
              v31[2] = __60___SFFormAutoFillController_fieldWillFocusWithInputSession___block_invoke_2;
              v31[3] = &unk_1E5C73C58;
              id v32 = v9;
              id v33 = v27;
              id v34 = v12;
              v35 = self;
              id v36 = v4;
              id v29 = v27;
              [(SFFormAutocompleteState *)state getTextSuggestionForStreamlinedAutoFillWithCredentialIdentity:v29 completion:v31];

              objc_destroyWeak(&v38);
              objc_destroyWeak(location);
            }
          }
        }
      }
    }
LABEL_20:

    goto LABEL_21;
  }
LABEL_23:
}

- (NSUUID)tabIDForAutoFill
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if (objc_opt_respondsToSelector())
  {
    BOOL v3 = [WeakRetained tabIDForAutoFill];
  }
  else
  {
    BOOL v3 = 0;
  }

  return (NSUUID *)v3;
}

- (BOOL)_presentStreamlinedStrongPasswordInputViewIfNeededWithInputSession:(id)a3 formType:(unint64_t)a4
{
  id v6 = a3;
  if (([MEMORY[0x1E4F98AF8] isAutomaticStrongPasswordsEnabled] & 1) == 0
    || self->_didCloseStrongPasswordIntroductionView
    || ([MEMORY[0x1E4F88198] hasThirdPartyPasswordManagerEnabledAndPasswordsAppDisabledForAutoFill] & 1) != 0
    || ![MEMORY[0x1E4F98AF8] isPasswordsAppInstalled])
  {
    goto LABEL_11;
  }
  id v7 = [MEMORY[0x1E4F98208] sharedFeatureManager];
  char v8 = [v7 shouldAutoFillPasswordsFromKeychain];

  char v9 = (a4 & 0xFFFFFFFFFFFFFFFELL) == 4 ? v8 : 0;
  if ((v9 & 1) == 0) {
    goto LABEL_11;
  }
  uint64_t v10 = [(SFFormAutocompleteState *)self->_state textFieldMetadata];
  char v11 = [v10 uniqueID];
  id v12 = [v6 formMetadata];
  id v13 = [v12 oldPasswordElementUniqueID];
  char v14 = [v11 isEqualToString:v13];

  if ((v14 & 1) != 0 || self->_didFillStrongPasswordFromStreamlinedAutoFillView)
  {
LABEL_11:
    char v15 = 0;
  }
  else
  {
    id v17 = +[_SFFormDataController sharedController];
    uint64_t v18 = [v17 autoFillQuirksManager];
    uint64_t v19 = [v18 passwordGenerationManager];

    dispatch_time_t v20 = [v6 frameHandle];
    int64_t v21 = objc_msgSend(v20, "webui_URL");
    v22 = [v19 defaultRequirementsForURL:v21];

    char v23 = [v19 passwordGenerationIsDisallowedByRequirements:v22];
    if ((v23 & 1) == 0)
    {
      uint64_t v24 = WBS_LOG_CHANNEL_PREFIXAutoFill();
      if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)id v36 = 0;
        _os_log_impl(&dword_1A690B000, v24, OS_LOG_TYPE_DEFAULT, "Presenting streamlined strong password view in custom input view", v36, 2u);
      }
      id v25 = objc_alloc(MEMORY[0x1E4F881A8]);
      v26 = [v6 frameHandle];
      v27 = objc_msgSend(v26, "webui_URL");
      v28 = [v27 host];
      id v29 = objc_msgSend(v28, "safari_highLevelDomainFromHost");
      uint64_t v30 = (void *)[v25 initWithDomain:v29];

      v31 = [[_SFAutoFillInputView alloc] initWithStreamlinedStrongPasswordViewController:v30];
      autoFillInputView = self->_autoFillInputView;
      self->_autoFillInputView = v31;

      [(_SFAutoFillInputView *)self->_autoFillInputView setDelegate:self];
      id v33 = self->_autoFillInputView;
      id v34 = [v6 formInputSession];
      [v34 setCustomInputView:v33];

      v35 = [v6 formInputSession];
      [v35 setAccessoryViewShouldNotShow:1];

      [(_SFFormAutoFillController *)self _hideInputAssistantItemsIfNecessary];
    }
    char v15 = v23 ^ 1;
  }
  return v15;
}

- (BOOL)_presentStrongPasswordIntroductionIfNeededWithAutoFillInputSession:(id)a3
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  BOOL v5 = [v4 formMetadata];
  unint64_t v6 = [v5 type];

  if (v6 >= 4 && (v6 - 4 >= 2 || [MEMORY[0x1E4F88198] shouldShowLoginIntroduction]))
  {
    char v8 = +[_SFFormDataController sharedController];
    char v9 = [v8 autoFillQuirksManager];
    uint64_t v10 = [v9 passwordGenerationManager];

    char v11 = [v4 frameHandle];
    id v12 = objc_msgSend(v11, "webui_URL");
    id v13 = [v10 defaultRequirementsForURL:v12];

    char v14 = [v10 passwordGenerationIsDisallowedByRequirements:v13];
    if ((v14 & 1) == 0)
    {
      if (!self->_strongPasswordIntroductionViewController)
      {
        char v15 = (PMSafariAutoFillStrongPasswordIntroductionViewController *)[objc_alloc(MEMORY[0x1E4F88198]) initWithMode:0];
        strongPasswordIntroductionViewController = self->_strongPasswordIntroductionViewController;
        self->_strongPasswordIntroductionViewController = v15;

        [(PMSafariAutoFillStrongPasswordIntroductionViewController *)self->_strongPasswordIntroductionViewController setDelegate:self];
      }
      id v17 = WBS_LOG_CHANNEL_PREFIXAutoFill();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
      {
        v25[0] = 67109120;
        v25[1] = 0;
        _os_log_impl(&dword_1A690B000, v17, OS_LOG_TYPE_DEFAULT, "Presenting strong password introduction in custom input view; mode=%d",
          (uint8_t *)v25,
          8u);
      }
      autoFillInputView = self->_autoFillInputView;
      if (autoFillInputView)
      {
        [(_SFAutoFillInputView *)autoFillInputView replaceContentsOfViewWithStrongPasswordIntroductionViewController:self->_strongPasswordIntroductionViewController];
      }
      else
      {
        uint64_t v19 = [[_SFAutoFillInputView alloc] initWithIntroductionViewController:self->_strongPasswordIntroductionViewController];
        dispatch_time_t v20 = self->_autoFillInputView;
        self->_autoFillInputView = v19;
      }
      int64_t v21 = self->_autoFillInputView;
      v22 = [v4 formInputSession];
      [v22 setCustomInputView:v21];

      char v23 = [v4 formInputSession];
      [v23 setAccessoryViewShouldNotShow:1];

      [(_SFFormAutoFillController *)self _hideInputAssistantItemsIfNecessary];
    }

    char v7 = v14 ^ 1;
  }
  else
  {
    char v7 = 0;
  }

  return v7;
}

- (void)reloadFirstResponderInputViews
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_webView);
  id v3 = [WeakRetained firstResponder];

  [v3 reloadInputViews];
}

- (void)hideInputAccessoryView
{
  id v3 = [(SFFormAutocompleteState *)self->_state inputSession];
  id v4 = [v3 formInputSession];
  [v4 setAccessoryViewShouldNotShow:1];

  [(_SFFormAutoFillController *)self _hideInputAssistantItemsIfNecessary];
}

- (void)updateExistingStreamlinedSuggestionIfNecessary:(id)a3
{
}

- (void)_hideInputAssistantItemsIfNecessary
{
  if (!self->_preservedLeadingBarButtonGroups && !self->_preservedTrailingBarButtonGroups)
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_webView);
    id v9 = [WeakRetained firstResponder];

    id v4 = [v9 inputAssistantItem];
    BOOL v5 = [v4 leadingBarButtonGroups];
    preservedLeadingBarButtonGroups = self->_preservedLeadingBarButtonGroups;
    self->_preservedLeadingBarButtonGroups = v5;

    char v7 = [v4 trailingBarButtonGroups];
    preservedTrailingBarButtonGroups = self->_preservedTrailingBarButtonGroups;
    self->_preservedTrailingBarButtonGroups = v7;

    [v4 setLeadingBarButtonGroups:MEMORY[0x1E4F1CBF0]];
    [v4 setTrailingBarButtonGroups:MEMORY[0x1E4F1CBF0]];
  }
}

- (void)_restoreInputAssistantItemsIfNecessary
{
  if (self->_preservedLeadingBarButtonGroups || self->_preservedTrailingBarButtonGroups)
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_webView);
    id v7 = [WeakRetained firstResponder];

    id v4 = [v7 inputAssistantItem];
    [v4 setLeadingBarButtonGroups:self->_preservedLeadingBarButtonGroups];
    [v4 setTrailingBarButtonGroups:self->_preservedTrailingBarButtonGroups];
    preservedLeadingBarButtonGroups = self->_preservedLeadingBarButtonGroups;
    self->_preservedLeadingBarButtonGroups = 0;

    preservedTrailingBarButtonGroups = self->_preservedTrailingBarButtonGroups;
    self->_preservedTrailingBarButtonGroups = 0;

    [v7 reloadInputViews];
  }
}

- (void)fieldDidFocusWithInputSession:(id)a3
{
}

- (void)fieldFocusedWithInputSession:(id)a3
{
  id v5 = a3;
  id v4 = [[_SFFormAutoFillInputSession alloc] initWithFormInputSession:v5];
  [(_SFFormAutoFillController *)self _fieldFocusedWithInputSession:v4];
}

- (void)_fieldFocusedWithInputSession:(id)a3
{
  id v4 = a3;
  -[_SFFormAutoFillController fieldWillFocusWithInputSession:](self, "fieldWillFocusWithInputSession:");
  [(_SFFormAutoFillController *)self fieldDidFocusWithInputSession:v4];
}

- (void)willSubmitFormValues:(id)a3 userObject:(id)a4 submissionHandler:(id)a5
{
  id v14 = a4;
  id v7 = (void (**)(void))a5;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v8 = v14;
    id v9 = [v8 objectForKey:@"frame"];
    uint64_t v10 = +[SFFormAutoFillFrameHandle frameHandleFromSerializedData:v9];

    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      char v11 = (void *)MEMORY[0x1E4F98B58];
      id v12 = [v8 objectForKeyedSubscript:@"form"];
      id v13 = [v11 formMetadataFromSerializedData:v12];

      if (v13) {
        [(_SFFormAutoFillController *)self willSubmitForm:v13 inFrame:v10 submissionHandler:v7];
      }
      else {
        v7[2](v7);
      }
    }
    else
    {
      v7[2](v7);
    }
  }
  else
  {
    v7[2](v7);
  }
}

+ (void)_getExternalLoginCredentialSuggestionsForDomains:(id)a3 webFrameIdentifier:(id)a4 completion:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  if (v9)
  {
    uint64_t v10 = [MEMORY[0x1E4F98230] sharedManager];
    char v11 = [v10 getEnabledExtensionsSynchronously];
    uint64_t v12 = [v11 count];

    if (v12)
    {
      id v13 = objc_alloc_init(MEMORY[0x1E4F98968]);
      id v14 = [MEMORY[0x1E4F28B50] mainBundle];
      char v15 = [v14 bundleIdentifier];
      v16[0] = MEMORY[0x1E4F143A8];
      v16[1] = 3221225472;
      v16[2] = __108___SFFormAutoFillController__getExternalLoginCredentialSuggestionsForDomains_webFrameIdentifier_completion___block_invoke;
      v16[3] = &unk_1E5C73CA8;
      id v17 = v7;
      id v18 = v9;
      [v13 getPasskeyAssertionRequestParametersForApplicationIdentifier:v15 completionHandler:v16];
    }
    else
    {
      (*((void (**)(id, void))v9 + 2))(v9, MEMORY[0x1E4F1CBF0]);
    }
  }
}

+ (void)_getExternalLoginCredentialSuggestionsForDomains:(id)a3 pageURL:(id)a4 webFrameIdentifier:(id)a5 completion:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  id v14 = v13;
  if (v13)
  {
    v15[0] = MEMORY[0x1E4F143A8];
    v15[1] = 3221225472;
    v15[2] = __116___SFFormAutoFillController__getExternalLoginCredentialSuggestionsForDomains_pageURL_webFrameIdentifier_completion___block_invoke;
    v15[3] = &unk_1E5C73CD0;
    id v17 = v13;
    id v18 = a1;
    id v16 = v11;
    [a1 _getExternalLoginCredentialSuggestionsForDomains:v10 webFrameIdentifier:v12 completion:v15];
  }
}

+ (id)_filterAndSortCredentialIdentities:(id)a3 pageURL:(id)a4 exactMatchesOnly:(BOOL)a5
{
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  id v26 = a3;
  unint64_t v6 = [a4 host];
  id v7 = [v6 lowercaseString];

  if (v7)
  {
    v27 = objc_msgSend(v7, "safari_highLevelDomainFromHost");
    id v8 = [NSString stringWithFormat:@"https://%@", v7];
    id v29 = objc_msgSend(v8, "safari_simplifiedUserVisibleURLStringWithSimplifications:forDisplayOnly:simplifiedStringOffset:", 330, 0, 0);

    id v31 = [MEMORY[0x1E4F1CA48] array];
    uint64_t v30 = [MEMORY[0x1E4F1CA48] array];
    v28 = [MEMORY[0x1E4F1CA48] array];
    long long v34 = 0u;
    long long v35 = 0u;
    long long v32 = 0u;
    long long v33 = 0u;
    id v9 = v26;
    uint64_t v10 = [v9 countByEnumeratingWithState:&v32 objects:v36 count:16];
    if (v10)
    {
      uint64_t v11 = *(void *)v33;
      do
      {
        for (uint64_t i = 0; i != v10; ++i)
        {
          if (*(void *)v33 != v11) {
            objc_enumerationMutation(v9);
          }
          id v13 = *(void **)(*((void *)&v32 + 1) + 8 * i);
          id v14 = [v13 site];
          if (([v14 isEqualToString:v7] & 1) != 0 || objc_msgSend(v13, "type") == 2)
          {
            [v31 addObject:v13];
          }
          else
          {
            char v15 = [NSString stringWithFormat:@"https://%@", v14];
            id v16 = objc_msgSend(v15, "safari_simplifiedUserVisibleURLStringWithSimplifications:forDisplayOnly:simplifiedStringOffset:", 330, 0, 0);

            char v17 = [v16 isEqualToString:v29];
            id v18 = v30;
            if ((v17 & 1) != 0
              || (objc_msgSend(v14, "safari_highLevelDomainFromHost"),
                  uint64_t v19 = objc_claimAutoreleasedReturnValue(),
                  int v20 = [v27 isEqualToString:v19],
                  v19,
                  id v18 = v28,
                  v20))
            {
              [v18 addObject:v13];
            }
          }
        }
        uint64_t v10 = [v9 countByEnumeratingWithState:&v32 objects:v36 count:16];
      }
      while (v10);
    }

    [v31 sortUsingComparator:&__block_literal_global_11];
    [v30 sortUsingComparator:&__block_literal_global_11];
    [v28 sortUsingComparator:&__block_literal_global_11];
    if ([v30 count])
    {
      if ([v31 count])
      {
        int64_t v21 = [v30 arrayByAddingObjectsFromArray:v28];
        uint64_t v22 = [v21 mutableCopy];

        v28 = (void *)v22;
      }
      else
      {
        int64_t v21 = v31;
        id v31 = v30;
      }
    }
    if (a5)
    {
      char v23 = 0;
    }
    else
    {
      [v31 arrayByAddingObjectsFromArray:v28];
      char v23 = v31;
      id v31 = (id)objc_claimAutoreleasedReturnValue();
    }
  }
  else
  {
    id v31 = (id)MEMORY[0x1E4F1CBF0];
  }

  return v31;
}

- (BOOL)shouldShowPasswordManagementAppOnboardingViews
{
  if (self->_didCloseStrongPasswordIntroductionView) {
    return 0;
  }
  else {
    return [MEMORY[0x1E4F88198] shouldShowLoginIntroduction];
  }
}

- (void)didCollectURLsForPreFilling:(id)a3 atURL:(id)a4 inFrame:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  id v12 = [WeakRetained formAutoFillControllerURLForFormAutoFill:self];

  if ([v9 isEqual:v12])
  {
    id v13 = [(_SFFormAutoFillController *)self testController];
    if ([v13 autoFillControllerShouldCollectFormMetadataForTesting:self])
    {
      [(SFFormAutoFiller *)self->_autoFiller collectFormMetadataForTestingAtURL:v12];
    }
    else
    {
      v42[0] = 0;
      v42[1] = v42;
      v42[2] = 0x2020000000;
      char v43 = 0;
      objc_initWeak(&location, self);
      int64_t v21 = objc_msgSend(v8, "safari_mapObjectsUsingBlock:", &__block_literal_global_213);
      id v14 = objc_opt_class();
      char v15 = [v10 webFrameIdentifier];
      v36[0] = MEMORY[0x1E4F143A8];
      v36[1] = 3221225472;
      v36[2] = __71___SFFormAutoFillController_didCollectURLsForPreFilling_atURL_inFrame___block_invoke_2;
      v36[3] = &unk_1E5C73D60;
      objc_copyWeak(&v40, &location);
      id v16 = v8;
      id v37 = v16;
      id v17 = v9;
      id v38 = v17;
      v39 = v42;
      [v14 _getExternalLoginCredentialSuggestionsForDomains:v21 webFrameIdentifier:v15 completion:v36];

      v34[0] = 0;
      v34[1] = v34;
      v34[2] = 0x3032000000;
      v34[3] = __Block_byref_object_copy__0;
      v34[4] = __Block_byref_object_dispose__0;
      id v35 = [v16 objectEnumerator];
      uint64_t v28 = 0;
      id v29 = &v28;
      uint64_t v30 = 0x3032000000;
      id v31 = __Block_byref_object_copy__215;
      long long v32 = __Block_byref_object_dispose__216;
      id v33 = 0;
      v22[0] = MEMORY[0x1E4F143A8];
      v22[1] = 3221225472;
      v22[2] = __71___SFFormAutoFillController_didCollectURLsForPreFilling_atURL_inFrame___block_invoke_217;
      v22[3] = &unk_1E5C73E00;
      id v26 = v42;
      v27 = &v28;
      id v25 = v34;
      void v22[4] = self;
      id v23 = v17;
      id v24 = v10;
      id v18 = (void *)MEMORY[0x1AD0C36A0](v22);
      uint64_t v19 = MEMORY[0x1AD0C36A0]();
      int v20 = (void *)v29[5];
      v29[5] = v19;

      (*(void (**)(void))(v29[5] + 16))();
      _Block_object_dispose(&v28, 8);

      _Block_object_dispose(v34, 8);
      objc_destroyWeak(&v40);

      objc_destroyWeak(&location);
      _Block_object_dispose(v42, 8);
    }
  }
}

- (_SFAuthenticationContext)authenticationContext
{
  v2 = +[_SFFormDataController sharedController];
  id v3 = [v2 autoFillAuthenticationContext];

  return (_SFAuthenticationContext *)v3;
}

- (void)_authenticateForAutoFillForHighLevelDomain:(id)a3 withCompletion:(id)a4
{
  id v5 = a4;
  objc_initWeak(&location, self);
  unint64_t v6 = [(_SFFormAutoFillController *)self authenticationContext];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __87___SFFormAutoFillController__authenticateForAutoFillForHighLevelDomain_withCompletion___block_invoke;
  v8[3] = &unk_1E5C73E28;
  objc_copyWeak(&v10, &location);
  id v7 = v5;
  id v9 = v7;
  [v6 authenticateForClient:self userInitiated:1 completion:v8];

  objc_destroyWeak(&v10);
  objc_destroyWeak(&location);
}

- (void)authenticateIfNeededForAutoFillAuthenticationType:(int64_t)a3 user:(id)a4 shouldForceAuthentication:(BOOL)a5 withCompletion:(id)a6
{
  id v22 = a4;
  id v10 = (void (**)(id, uint64_t, void))a6;
  self->_authenticationType = a3;
  if (a5
    || ((+[_SFManagedFeatureObserver sharedObserver],
         uint64_t v11 = objc_claimAutoreleasedReturnValue(),
         char v12 = [v11 authenticationRequiredToAutoFill],
         a3 == 4)
      ? (char v13 = 1)
      : (char v13 = v12),
        v11,
        (v13 & 1) != 0))
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    if (a3 != 5 && a3) {
      goto LABEL_12;
    }
    if (!v22) {
      goto LABEL_12;
    }
    if ((objc_opt_respondsToSelector() & 1) == 0) {
      goto LABEL_12;
    }
    char v15 = +[_SFFormDataController sharedController];
    id v16 = [WeakRetained tabIDForAutoFill];
    id v17 = [WeakRetained formAutoFillControllerURLForFormAutoFill:self];
    int v18 = [v15 canApplyAutoFillGracePeriodForUsername:v22 inTabWithID:v16 currentURL:v17];

    if (v18)
    {
      v10[2](v10, 1, 0);
    }
    else
    {
LABEL_12:
      uint64_t v19 = [WeakRetained formAutoFillControllerURLForFormAutoFill:self];
      int v20 = [v19 host];
      int64_t v21 = objc_msgSend(v20, "safari_highLevelDomainFromHost");

      if (objc_opt_respondsToSelector()) {
        [WeakRetained formAutoFillControllerGetAuthenticationForAutoFill:self completion:v10];
      }
      else {
        [(_SFFormAutoFillController *)self _authenticateForAutoFillForHighLevelDomain:v21 withCompletion:v10];
      }
    }
  }
  else
  {
    v10[2](v10, 1, 0);
  }
}

- (SFAppAutoFillOneTimeCodeProvider)oneTimeCodeProvider
{
  v2 = +[_SFFormDataController sharedController];
  id v3 = [v2 oneTimeCodeProvider];

  return (SFAppAutoFillOneTimeCodeProvider *)v3;
}

- (WBSSavedAccountContext)savedAccountContext
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if (objc_opt_respondsToSelector())
  {
    id v4 = [WeakRetained currentSavedAccountContextForFormAutoFillController:self];
    id v5 = v4;
    if (v4)
    {
      id v6 = v4;
    }
    else
    {
      id v6 = [MEMORY[0x1E4F98DE0] defaultContext];
    }
    id v7 = v6;
  }
  else
  {
    id v7 = [MEMORY[0x1E4F98DE0] defaultContext];
  }

  return (WBSSavedAccountContext *)v7;
}

- (id)_websiteForAuthenticationPrompt
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  id v4 = [WeakRetained formAutoFillControllerURLForFormAutoFill:self];
  id v5 = [v4 host];

  id v6 = objc_msgSend(v5, "safari_highLevelDomainFromHost");
  id v7 = v6;
  if (!v6) {
    id v6 = v5;
  }
  id v8 = v6;

  return v8;
}

- (id)_preFillDisabledHosts
{
  v2 = (void *)-[_SFFormAutoFillController _preFillDisabledHosts]::disabledHosts;
  if (!-[_SFFormAutoFillController _preFillDisabledHosts]::disabledHosts)
  {
    uint64_t v3 = objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithObjects:", @"idmsa.apple.com", @"idmsac.apple.com", @"idmsac.corp.apple.com", @"idmsauth.corp.apple.com", 0);
    id v4 = (void *)-[_SFFormAutoFillController _preFillDisabledHosts]::disabledHosts;
    -[_SFFormAutoFillController _preFillDisabledHosts]::disabledHosts = v3;

    v2 = (void *)-[_SFFormAutoFillController _preFillDisabledHosts]::disabledHosts;
  }

  return v2;
}

- (id)authenticationMessageForContext:(id)a3
{
  id v4 = a3;
  int64_t authenticationType = self->_authenticationType;
  if (authenticationType == 5)
  {
    uint64_t v8 = +[SFAutoFillAuthenticationUtilities customAuthenticationTitleForFillingTimeBasedOneTimeCode];
  }
  else if (authenticationType == 1)
  {
    uint64_t v8 = +[SFAutoFillAuthenticationUtilities customAuthenticationTitleForFillingSavedPasskey];
  }
  else if (authenticationType)
  {
    uint64_t v8 = +[SFAutoFillAuthenticationUtilities customAuthenticationTitleForFillingCreditCard];
  }
  else
  {
    if ([(_SFFormAutoFillController *)self _showingAutoFillInputView])
    {
      id v6 = [(_SFFormAutoFillController *)self _websiteForAuthenticationPrompt];
      id v7 = +[SFAutoFillAuthenticationUtilities customAuthenticationTitleForLoggingInWithSavedAccountOnWebsite:v6];

      goto LABEL_11;
    }
    uint64_t v8 = +[SFAutoFillAuthenticationUtilities customAuthenticationTitleForFillingSavedPassword];
  }
  id v7 = (void *)v8;
LABEL_11:

  return v7;
}

- (id)passcodePromptForContext:(id)a3
{
  id v4 = a3;
  int64_t authenticationType = self->_authenticationType;
  if (authenticationType == 5)
  {
    uint64_t v8 = +[SFAutoFillAuthenticationUtilities passcodePromptForFillingTimeBasedOneTimeCode];
  }
  else if (authenticationType == 1)
  {
    uint64_t v8 = +[SFAutoFillAuthenticationUtilities customAuthenticationTitleForFillingSavedPasskey];
  }
  else if (authenticationType)
  {
    uint64_t v8 = +[SFAutoFillAuthenticationUtilities passcodePromptForFillingCreditCard];
  }
  else
  {
    if ([(_SFFormAutoFillController *)self _showingAutoFillInputView])
    {
      id v6 = [(_SFFormAutoFillController *)self _websiteForAuthenticationPrompt];
      id v7 = +[SFAutoFillAuthenticationUtilities passcodePromptForLoggingInWithSavedAccountOnWebsite:v6];

      goto LABEL_11;
    }
    uint64_t v8 = +[SFAutoFillAuthenticationUtilities passcodePromptForFillingSavedAccount];
  }
  id v7 = (void *)v8;
LABEL_11:

  return v7;
}

- (BOOL)_showingAutoFillInputView
{
  if (!self->_autoFillInputView) {
    return 0;
  }
  if (!self->_strongPasswordIntroductionViewController) {
    goto LABEL_5;
  }
  uint64_t v3 = [(SFFormAutocompleteState *)self->_state inputSession];
  id v4 = [v3 formInputSession];
  id v5 = [v4 customInputView];
  autoFillInputView = self->_autoFillInputView;

  if (v5 == autoFillInputView) {
    return 1;
  }
  if (!self->_autoFillInputView) {
    return 0;
  }
LABEL_5:
  id v7 = [(SFFormAutocompleteState *)self->_state inputSession];
  uint64_t v8 = [v7 formInputSession];
  id v9 = [v8 customInputView];
  BOOL v10 = v9 == self->_autoFillInputView;

  return v10;
}

- (BOOL)displayMessageAsTitleForContext:(id)a3
{
  return 1;
}

- (id)authenticationCustomUIProgressObserverForContext:(id)a3
{
  return 0;
}

- (void)didCollectFormMetadataForPreFilling:(id)a3 atURL:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [(_SFFormAutoFillController *)self testController];
  if ([v8 autoFillControllerShouldCollectFormMetadataForTesting:self])
  {
    id WeakRetained = [[SFFormsMetadataProvider alloc] initWithFrameHandleToFormsDictionary:v6];
    [v8 autoFillController:self didCollectFormMetadataForTesting:WeakRetained forURL:v7];
  }
  else
  {
    id WeakRetained = (SFFormsMetadataProvider *)objc_loadWeakRetained((id *)&self->_delegate);
    BOOL v10 = [(SFFormsMetadataProvider *)WeakRetained formAutoFillControllerURLForFormAutoFill:self];
    char v11 = [v7 isEqual:v10];

    if (v11 & 1) != 0 && (objc_opt_respondsToSelector())
    {
      char v12 = +[_SFFormDataController sharedController];
      char v13 = [v12 autoFillQuirksManager];
      char v14 = [v13 isStreamlinedLoginDisallowedOnURL:v7];

      if ((v14 & 1) == 0
        && [v12 shouldAllowPasswordAutoFillOnURL:v7 allowExternalCredentials:1]
        && ([(SFFormsMetadataProvider *)WeakRetained formAutoFillControllerShouldDisableStreamlinedLogin:self] & 1) == 0)
      {
        char v15 = [[SFFormsMetadataProvider alloc] initWithFrameHandleToFormsDictionary:v6];
        id v18 = 0;
        id v16 = [v12 metadataOfBestFormForStreamlinedLogin:v15 frame:&v18];
        if (v16)
        {
          id v17 = v18;
          if ([v12 mayPreFillInFrame:v17]) {
            -[SFFormAutoFiller focusFormForStreamlinedLogin:inFrame:](self->_autoFiller, "focusFormForStreamlinedLogin:inFrame:", [v16 uniqueID], v17);
          }
        }
      }
    }
  }
}

- (void)didCollectFormMetadataForPageLevelAutoFill:(id)a3 atURL:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  id v9 = [WeakRetained formAutoFillControllerURLForFormAutoFill:self];
  char v10 = [v7 isEqual:v9];

  if (v10)
  {
    char v11 = [[SFFormsMetadataProvider alloc] initWithFrameHandleToFormsDictionary:v6];
    id v18 = 0;
    char v12 = +[_SFFormDataController sharedController];
    char v13 = [v12 metadataOfActiveFormOrBestFormForPageLevelAutoFill:v11 frame:&v18];

    if (v13)
    {
      stateForPageLevelAutoFill = self->_stateForPageLevelAutoFill;
      if (stateForPageLevelAutoFill)
      {
        [(SFFormAutocompleteState *)stateForPageLevelAutoFill updateCachedFormMetadataAfterFilling:v13];
      }
      else
      {
        id v15 = v18;
        id v16 = [[SFFormAutocompleteState alloc] initWithFrame:v15 form:v13 textField:0 inputSession:0 autoFillController:self];
        id v17 = self->_stateForPageLevelAutoFill;
        self->_stateForPageLevelAutoFill = v16;
      }
      [(SFFormAutocompleteState *)self->_stateForPageLevelAutoFill performPageLevelAutoFill];
    }
  }
}

- (void)textDidChangeInTextField:(id)a3 inForm:(id)a4 inFrame:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  char v11 = [v8 value];
  [v11 length];

  uint64_t v14 = MEMORY[0x1E4F143A8];
  id v12 = v9;
  id v13 = v8;
  WBSDispatchAsyncAndReleaseOnMainQueue();
  if (-[NSMutableIndexSet containsIndex:](self->_uniqueIDsOfFormsThatWereAutoFilled, "containsIndex:", objc_msgSend(v12, "uniqueID", v14, 3221225472, __69___SFFormAutoFillController_textDidChangeInTextField_inForm_inFrame___block_invoke, &unk_1E5C73E50, self)))-[_SFFormAutoFillController _presentAutoFillInternalFeedbackActivityNotificationIfNeeded](self, "_presentAutoFillInternalFeedbackActivityNotificationIfNeeded"); {
  [(_SFFormAutoFillController *)self didUpdateUnsubmittedForm:v12 inFrame:v10];
  }
  [(SFFormAutocompleteState *)self->_state textDidChangeInFrame:v10 form:v12 textField:v13];
}

- (void)didFillGeneratedPasswordInForm:(id)a3 inFrame:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v11 = MEMORY[0x1E4F143A8];
  id v12 = v6;
  WBSDispatchAsyncAndReleaseOnMainQueue();
  -[_SFFormAutoFillController didUpdateUnsubmittedForm:inFrame:](self, "didUpdateUnsubmittedForm:inFrame:", v12, v7, v11, 3221225472, __68___SFFormAutoFillController_didFillGeneratedPasswordInForm_inFrame___block_invoke, &unk_1E5C72628, self);
  id v8 = +[_SFFormDataController sharedController];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_webView);
  id v10 = [(_SFFormAutoFillController *)self savedAccountContext];
  [v8 didFillFormWithGeneratedPassword:v12 inWebView:WeakRetained frame:v7 context:v10];
}

- (void)willNavigateFrame:(id)a3 withUnsubmittedForm:(id)a4
{
  id v25 = a3;
  id v6 = a4;
  self->_BOOL attemptedOfferingStreamlinedLogin = 0;
  uint64_t v7 = [v6 uniqueID];
  if (self->_metadataCorrectionsEnabled) {
    uint64_t v8 = [(NSMutableIndexSet *)self->_uniqueIDsOfFormsThatWereAutoFilled containsIndex:v7];
  }
  else {
    uint64_t v8 = 0;
  }
  id v9 = +[_SFFormDataController sharedController];
  [v9 setLastFilledCreditCardData:self->_lastFilledCreditCardData];
  [v9 setPreviouslyFilledVirtualCardNumbers:self->_previouslyFilledVirtualCardNumbers];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_webView);
  uint64_t v11 = [(_SFFormAutoFillController *)self savedAccountContext];
  [v9 webView:WeakRetained frame:v25 willNavigateFromForm:v6 inContext:v11 bySubmitting:0 processMetadataCorrections:v8 uniqueIDsOfControlsThatWereAutoFilled:self->_uniqueIDsOfControlsThatWereAutoFilled submissionHandler:&__block_literal_global_247];

  *(_WORD *)&self->_didFillStrongPasswordFromStreamlinedAutoFillView = 0;
  self->_shouldSuggestToCustomizeStrongPassword = 0;
  if ([MEMORY[0x1E4F98AF8] isPasswordsAppInstalled])
  {
    id v12 = +[_SFFormDataController sharedController];
    id v13 = [v12 generatedPassword];

    if (v13)
    {
      uint64_t v14 = +[_SFFormDataController sharedController];
      [v14 setGeneratedPassword:0];
    }
  }
  [(_SFFormAutoFillController *)self _removeUniqueIDsOfAutoFilledForm:v6];
  [(_SFFormAutoFillController *)self sendEventsForAutoFillTelemetry];
  valuesAutoFilledForCurrentPage = self->_valuesAutoFilledForCurrentPage;
  self->_valuesAutoFilledForCurrentPage = 0;

  self->_hasPresentedAutoFillInternalFeedbackNoticeForCurrentPage = 0;
  [(_SFFormAutoFillController *)self _dismissAutoFillInternalFeedbackNoticeImmediately:1];
  unsubmittedForm = self->_unsubmittedForm;
  self->_unsubmittedForm = 0;

  unsubmittedFormFrame = self->_unsubmittedFormFrame;
  self->_unsubmittedFormFrame = 0;

  self->_waitingForCreditCardDataFromWallet = 0;
  lastFilledCreditCardData = self->_lastFilledCreditCardData;
  self->_lastFilledCreditCardData = 0;

  [v9 setLastFilledCreditCardData:0];
  lastFilledContact = self->_lastFilledContact;
  self->_lastFilledContact = 0;

  frameHandleForAutomaticPasswords = self->_frameHandleForAutomaticPasswords;
  self->_frameHandleForAutomaticPasswords = 0;

  formMetadataForAutomaticPasswords = self->_formMetadataForAutomaticPasswords;
  self->_formMetadataForAutomaticPasswords = 0;

  passwordFieldMetadataForAutomaticPasswords = self->_passwordFieldMetadataForAutomaticPasswords;
  self->_passwordFieldMetadataForAutomaticPasswords = 0;

  uniqueIDsOfPasswordElementsForAutomaticPasswords = self->_uniqueIDsOfPasswordElementsForAutomaticPasswords;
  self->_uniqueIDsOfPasswordElementsForAutomaticPasswords = 0;

  uniqueIDOfFocusedPasswordElementWithAutomaticPassword = self->_uniqueIDOfFocusedPasswordElementWithAutomaticPassword;
  self->_uniqueIDOfFocusedPasswordElementWithAutomaticPassword = 0;

  self->_didCloseStrongPasswordIntroductionView = 0;
  self->_didFillStrongPasswordFromStreamlinedAutoFillView = 0;
}

- (void)didUpdateUnsubmittedForm:(id)a3 inFrame:(id)a4
{
  id v6 = (WBSFormMetadata *)a3;
  uint64_t v7 = (SFFormAutoFillFrameHandle *)a4;
  unsubmittedForm = self->_unsubmittedForm;
  self->_unsubmittedForm = v6;
  id v10 = v6;

  unsubmittedFormFrame = self->_unsubmittedFormFrame;
  self->_unsubmittedFormFrame = v7;
}

- (void)sendEventsForAutoFillTelemetry
{
}

- (void)_updateFormTelemetryDataMonitorWithFormMetadata:(id)a3 textFieldMetadata:(id)a4 textFieldValueLength:(unint64_t)a5
{
  id v9 = a3;
  id v8 = a4;
  [(_SFFormAutoFillController *)self _createFormTelemetryDataMonitorIfNeeded];
  [(WBSFormTelemetryDataMonitor *)self->_formTelemetryDataMonitor updateFormTelemetryWithFormMetadata:v9 textFieldMetadata:v8 textFieldValueLength:a5];
}

- (void)reportAutoFillOfferedType:(unint64_t)a3 forTextFieldWithID:(id)a4 forFormMetadata:(id)a5
{
  id v6 = a4;
  id v9 = a5;
  id v7 = v9;
  id v8 = v6;
  WBSDispatchAsyncAndReleaseOnMainQueue();
}

- (void)_createFormTelemetryDataMonitorIfNeeded
{
  if (!self->_formTelemetryDataMonitor)
  {
    uint64_t v3 = (WBSFormTelemetryDataMonitor *)[objc_alloc(MEMORY[0x1E4F98B60]) initWithWebpageLocale:self->_cachedWebpageLocale];
    formTelemetryDataMonitor = self->_formTelemetryDataMonitor;
    self->_formTelemetryDataMonitor = v3;
  }
}

- (void)setUpFormTelemetryDataMonitorWithWebpageLocale:(id)a3
{
}

- (void)_addUniqueIDsOfAutoFilledForm:(id)a3
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = [v4 uniqueID];
  uniqueIDsOfFormsThatWereAutoFilled = self->_uniqueIDsOfFormsThatWereAutoFilled;
  if (uniqueIDsOfFormsThatWereAutoFilled)
  {
    [(NSMutableIndexSet *)uniqueIDsOfFormsThatWereAutoFilled addIndex:v5];
  }
  else
  {
    id v7 = [MEMORY[0x1E4F28E60] indexSetWithIndex:v5];
    id v8 = self->_uniqueIDsOfFormsThatWereAutoFilled;
    self->_uniqueIDsOfFormsThatWereAutoFilled = v7;
  }
  long long v20 = 0u;
  long long v21 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id v9 = objc_msgSend(v4, "controls", 0);
  uint64_t v10 = [v9 countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v10)
  {
    uint64_t v11 = *(void *)v19;
    do
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v19 != v11) {
          objc_enumerationMutation(v9);
        }
        id v13 = *(void **)(*((void *)&v18 + 1) + 8 * i);
        if ([v13 isAutoFilledTextField])
        {
          uint64_t v14 = [v13 uniqueID];
          if ([v14 length])
          {
            uniqueIDsOfControlsThatWereAutoFilled = self->_uniqueIDsOfControlsThatWereAutoFilled;
            if (uniqueIDsOfControlsThatWereAutoFilled)
            {
              [(NSMutableSet *)uniqueIDsOfControlsThatWereAutoFilled addObject:v14];
            }
            else
            {
              id v16 = [MEMORY[0x1E4F1CA80] setWithObject:v14];
              id v17 = self->_uniqueIDsOfControlsThatWereAutoFilled;
              self->_uniqueIDsOfControlsThatWereAutoFilled = v16;
            }
          }
        }
      }
      uint64_t v10 = [v9 countByEnumeratingWithState:&v18 objects:v22 count:16];
    }
    while (v10);
  }
}

- (void)_removeUniqueIDsOfAutoFilledForm:(id)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  -[NSMutableIndexSet removeIndex:](self->_uniqueIDsOfFormsThatWereAutoFilled, "removeIndex:", [v4 uniqueID]);
  long long v12 = 0u;
  long long v13 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  uint64_t v5 = objc_msgSend(v4, "controls", 0);
  uint64_t v6 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v6)
  {
    uint64_t v7 = *(void *)v11;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v11 != v7) {
          objc_enumerationMutation(v5);
        }
        id v9 = [*(id *)(*((void *)&v10 + 1) + 8 * v8) uniqueID];
        if (v9) {
          [(NSMutableSet *)self->_uniqueIDsOfControlsThatWereAutoFilled removeObject:v9];
        }

        ++v8;
      }
      while (v6 != v8);
      uint64_t v6 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v6);
  }
}

- (void)autoFilledField:(id)a3 inForm:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  uint64_t v7 = [v5 value];
  [v7 length];

  id v8 = v6;
  id v9 = v5;
  WBSDispatchAsyncAndReleaseOnMainQueue();
}

- (void)autoFillDidFinishWithUpdatedFormMetadata:(id)a3 inFrame:(id)a4 shouldSubmit:(BOOL)a5
{
  BOOL v5 = a5;
  id v8 = a3;
  id v9 = a4;
  [(_SFFormAutoFillController *)self _addUniqueIDsOfAutoFilledForm:v8];
  stateForPageLevelAutoFill = self->_stateForPageLevelAutoFill;
  if (stateForPageLevelAutoFill)
  {
    if (!v5
      && (uint64_t v11 = [(SFFormAutocompleteState *)stateForPageLevelAutoFill action],
          stateForPageLevelAutoFill = self->_stateForPageLevelAutoFill,
          v11)
      && ([(SFFormAutocompleteState *)stateForPageLevelAutoFill multiRoundAutoFillManager],
          long long v12 = objc_claimAutoreleasedReturnValue(),
          int v13 = [v12 shouldAttemptFollowUpAutoFillInFormWithMetadata:v8 requestType:0],
          v12,
          stateForPageLevelAutoFill = self->_stateForPageLevelAutoFill,
          v13))
    {
      uint64_t v14 = [(SFFormAutocompleteState *)stateForPageLevelAutoFill multiRoundAutoFillManager];
      v19[0] = MEMORY[0x1E4F143A8];
      v19[1] = 3221225472;
      v19[2] = __91___SFFormAutoFillController_autoFillDidFinishWithUpdatedFormMetadata_inFrame_shouldSubmit___block_invoke;
      v19[3] = &unk_1E5C73108;
      v19[4] = self;
      [v14 dispatchFollowUpAutoFillOfFormWithMetdata:v8 autoFillBlock:v19];
    }
    else
    {
      [(SFFormAutocompleteState *)stateForPageLevelAutoFill invalidate];
      uint64_t v15 = self->_stateForPageLevelAutoFill;
      self->_stateForPageLevelAutoFill = 0;
    }
  }
  if ([v8 type] == 4)
  {
    id v16 = +[_SFFormDataController sharedController];
    id WeakRetained = objc_loadWeakRetained((id *)&self->_webView);
    long long v18 = [(_SFFormAutoFillController *)self savedAccountContext];
    [v16 textDidChangeInForm:v8 inWebView:WeakRetained frame:v9 context:v18];
  }
  else if ([v8 type] == 3 {
         || [v8 type] == 5
  }
         || [(SFFormAutocompleteState *)self->_state shouldOfferToAutoFillCreditCardData])
  {
    [(SFFormAutocompleteState *)self->_state updateCachedFormMetadataAfterFilling:v8];
    [(SFFormAutocompleteState *)self->_state updateSuggestions];
    if ([(SFFormAutocompleteState *)self->_state action] != 3
      && [(SFFormAutocompleteState *)self->_state action] != 6
      && [(SFFormAutocompleteState *)self->_state action] != 4
      && [(SFFormAutocompleteState *)self->_state action] != 5)
    {
      [(_SFFormAutoFillController *)self _dismissKeyboardAndSimulateCarriageReturnKeyEvents:v5];
    }
  }
}

- (void)didCompleteWithPasskey
{
}

- (void)didCompleteWithSavedAccount:(id)a3
{
  id v11 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if (objc_opt_respondsToSelector())
  {
    id v5 = objc_loadWeakRetained((id *)&self->_webView);
    id v6 = +[_SFFormDataController sharedController];
    uint64_t v7 = [v11 user];
    id v8 = [WeakRetained tabIDForAutoFill];
    id v9 = [v5 URL];
    uint64_t v10 = objc_msgSend(v5, "webui_privateBrowsingEnabled");
    [v6 didFillPasswordForUsername:v7 fromProviderWithBundleIdentifier:*MEMORY[0x1E4F99368] inTabWithID:v8 currentURL:v9 isPrivate:v10];
  }
}

- (void)_dismissKeyboardAndSimulateCarriageReturnKeyEvents:(BOOL)a3
{
  uint64_t v3 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_webView);
  LOBYTE(v3) = objc_msgSend(WeakRetained, "_sf_endEditingAndSimulateCarriageReturnKeyEvents:", v3);

  if ((v3 & 1) == 0)
  {
    id v5 = WBS_LOG_CHANNEL_PREFIXAutoFill();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      -[_SFFormAutoFillController _dismissKeyboardAndSimulateCarriageReturnKeyEvents:](v5);
    }
  }
}

- (void)didRemoveAutomaticStrongPasswordInForm:(id)a3 inputSessionUserObject:(id)a4 inFrame:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  uint64_t v18 = MEMORY[0x1E4F143A8];
  id v11 = v8;
  WBSDispatchAsyncAndReleaseOnMainQueue();
  -[_SFFormAutoFillController didUpdateUnsubmittedForm:inFrame:](self, "didUpdateUnsubmittedForm:inFrame:", v11, v10, v18, 3221225472, __99___SFFormAutoFillController_didRemoveAutomaticStrongPasswordInForm_inputSessionUserObject_inFrame___block_invoke, &unk_1E5C72628, self);
  long long v12 = self->_inputSessionForAutomaticPasswords;
  inputSessionForAutomaticPasswords = self->_inputSessionForAutomaticPasswords;
  self->_inputSessionForAutomaticPasswords = 0;

  uint64_t v14 = +[_SFFormDataController sharedController];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_webView);
  id v16 = [(_SFFormAutoFillController *)self savedAccountContext];
  [v14 textDidChangeInForm:v11 inWebView:WeakRetained frame:v10 context:v16];

  if (v9 && v12)
  {
    uint64_t v17 = [(_SFFormAutoFillInputSession *)v12 autoFillInputSessionByReplacingInputSessionUserObject:v9];

    long long v12 = (_SFFormAutoFillInputSession *)v17;
    [(_SFFormAutoFillController *)self _fieldFocusedWithInputSession:v17];
  }
}

- (void)removeAutomaticPasswordVisualTreatment
{
}

- (void)removeAutomaticPasswordButtonInitiatedByUser:(BOOL)a3
{
}

- (void)_removeAutomaticPasswordButtonInitiatedByUser:(BOOL)a3 removeVisualTreatmentOnly:(BOOL)a4
{
  if (self->_frameHandleForAutomaticPasswords)
  {
    autoFiller = self->_autoFiller;
    if (a4) {
      -[SFFormAutoFiller removeAutomaticPasswordVisualTreatmentInFrame:passwordControlUniqueIDs:](autoFiller, "removeAutomaticPasswordVisualTreatmentInFrame:passwordControlUniqueIDs:");
    }
    else {
      -[SFFormAutoFiller removeAutomaticPasswordElementsInFrame:focusedPasswordControlUniqueID:passwordControlUniqueIDs:](autoFiller, "removeAutomaticPasswordElementsInFrame:focusedPasswordControlUniqueID:passwordControlUniqueIDs:");
    }
    frameHandleForAutomaticPasswords = self->_frameHandleForAutomaticPasswords;
    self->_frameHandleForAutomaticPasswords = 0;

    uniqueIDsOfPasswordElementsForAutomaticPasswords = self->_uniqueIDsOfPasswordElementsForAutomaticPasswords;
    self->_uniqueIDsOfPasswordElementsForAutomaticPasswords = 0;

    uniqueIDOfFocusedPasswordElementWithAutomaticPassword = self->_uniqueIDOfFocusedPasswordElementWithAutomaticPassword;
    self->_uniqueIDOfFocusedPasswordElementWithAutomaticPassword = 0;

    if (!a3)
    {
      inputSessionForAutomaticPasswords = self->_inputSessionForAutomaticPasswords;
      self->_inputSessionForAutomaticPasswords = 0;
    }
    id v11 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v11 postNotificationName:@"_SFAutomaticPasswordDismissedByUser" object:self];
  }
}

- (void)automaticPasswordSheetDismissed
{
  if ([(NSString *)self->_uniqueIDOfFocusedPasswordElementWithAutomaticPassword length]
    && self->_frameHandleForAutomaticPasswords)
  {
    autoFiller = self->_autoFiller;
    -[SFFormAutoFiller automaticPasswordSheetDimissedInFrame:focusedPasswordControlUniqueID:](autoFiller, "automaticPasswordSheetDimissedInFrame:focusedPasswordControlUniqueID:");
  }
}

- (void)prepareForShowingAutomaticStrongPasswordWithInputSession:(id)a3
{
}

- (id)automaticPasswordForPasswordField:(id)a3 inForm:(id)a4 isFrame:(id)a5
{
  id v7 = a4;
  id v8 = a5;
  uint64_t v9 = [a3 maxLength];
  id v10 = [v7 passwordRequirements];
  id v11 = +[_SFFormDataController sharedController];
  long long v12 = objc_msgSend(v8, "webui_URL");
  int v13 = [v11 autoGeneratedPasswordForURL:v12 respectingPasswordRequirements:v10 maxLength:v9];

  return v13;
}

- (id)alphanumericStrongPassword
{
  alphanumericStrongPassword = self->_alphanumericStrongPassword;
  if (alphanumericStrongPassword)
  {
    id v4 = (NSString *)[(NSString *)alphanumericStrongPassword copy];
  }
  else
  {
    id v5 = (void *)[objc_alloc(MEMORY[0x1E4F98C90]) initWithPasswordRequirementsByDomain:0];
    id v6 = [v5 generated15CharacterAlphanumericPassword];
    id v7 = self->_alphanumericStrongPassword;
    self->_alphanumericStrongPassword = v6;

    id v4 = self->_alphanumericStrongPassword;
  }

  return v4;
}

- (void)replaceCurrentPasswordWithPassword:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    id v5 = [MEMORY[0x1E4F1CAD0] setWithObject:v4];
    [(_SFFormAutoFillController *)self _addValuesAutoFilledForCurrentPage:v5];
  }
  if (([(NSString *)self->_currentStrongPassword isEqual:v4] & 1) == 0)
  {
    autoFiller = self->_autoFiller;
    id v7 = [(_SFFormAutoFillInputSession *)self->_inputSessionForAutomaticPasswords frameHandle];
    [(SFFormAutoFiller *)autoFiller removeAutomaticPasswordVisualTreatmentInFrame:v7 passwordControlUniqueIDs:self->_uniqueIDsOfPasswordElementsForAutomaticPasswords];

    id v8 = self->_autoFiller;
    uint64_t v9 = [(_SFFormAutoFillInputSession *)self->_inputSessionForAutomaticPasswords frameHandle];
    id v10 = [(_SFFormAutoFillInputSession *)self->_inputSessionForAutomaticPasswords formMetadata];
    uint64_t v11 = [v10 uniqueID];
    uniqueIDOfFocusedPasswordElementWithAutomaticPassword = self->_uniqueIDOfFocusedPasswordElementWithAutomaticPassword;
    uniqueIDsOfPasswordElementsForAutomaticPasswords = self->_uniqueIDsOfPasswordElementsForAutomaticPasswords;
    v33[0] = MEMORY[0x1E4F143A8];
    v33[1] = 3221225472;
    v33[2] = __64___SFFormAutoFillController_replaceCurrentPasswordWithPassword___block_invoke;
    v33[3] = &unk_1E5C73018;
    v33[4] = self;
    [(SFFormAutoFiller *)v8 substitutePasswordElementsWithAutomaticPasswordElementsInFrame:v9 formID:v11 focusedPasswordControlUniqueID:uniqueIDOfFocusedPasswordElementWithAutomaticPassword passwordControlUniqueIDs:uniqueIDsOfPasswordElementsForAutomaticPasswords automaticPassword:v4 blurAfterSubstitution:0 completionHandler:v33];

    uint64_t v14 = +[_SFFormDataController sharedController];
    uint64_t v15 = [v14 generatedPassword];

    if (v15)
    {
      id v16 = dispatch_group_create();
      dispatch_group_enter(v16);
      uint64_t v27 = 0;
      uint64_t v28 = &v27;
      uint64_t v29 = 0x3032000000;
      uint64_t v30 = __Block_byref_object_copy__0;
      id v31 = __Block_byref_object_dispose__0;
      id v32 = 0;
      uint64_t v17 = [MEMORY[0x1E4F98B70] sharedStore];
      v24[0] = MEMORY[0x1E4F143A8];
      v24[1] = 3221225472;
      v24[2] = __64___SFFormAutoFillController_replaceCurrentPasswordWithPassword___block_invoke_3;
      v24[3] = &unk_1E5C73E78;
      id v26 = &v27;
      uint64_t v18 = v16;
      id v25 = v18;
      [v17 updateGeneratedPassword:v15 withPassword:v4 completionHandler:v24];

      dispatch_time_t v19 = dispatch_time(0, 1000000000);
      dispatch_group_wait(v18, v19);
      uint64_t v20 = v28[5];
      long long v21 = +[_SFFormDataController sharedController];
      [v21 setGeneratedPassword:v20];

      _Block_object_dispose(&v27, 8);
    }

    id v22 = (NSString *)[v4 copy];
    currentStrongPassword = self->_currentStrongPassword;
    self->_currentStrongPassword = v22;
  }
}

- (void)makeStrongPasswordFieldViewableAndEditable:(BOOL)a3
{
  frameHandleForAutomaticPasswords = self->_frameHandleForAutomaticPasswords;
  if (frameHandleForAutomaticPasswords)
  {
    [(SFFormAutoFiller *)self->_autoFiller setStrongPasswordElementViewableIfAppropriate:a3 frame:frameHandleForAutomaticPasswords passwordControlUniqueIDs:self->_uniqueIDsOfPasswordElementsForAutomaticPasswords];
    if (([MEMORY[0x1E4F98AF8] isPasswordsAppInstalled] & 1) == 0)
    {
      id v5 = +[_SFFormDataController sharedController];
      id v6 = [v5 generatedPassword];

      if (v6)
      {
        id v7 = [MEMORY[0x1E4F98B70] sharedStore];
        [v7 removeGeneratedPassword:v6 completionHandler:0];

        id v8 = +[_SFFormDataController sharedController];
        [v8 setGeneratedPassword:0];
      }
    }
    if (([MEMORY[0x1E4F98AF8] isPasswordsAppInstalled] & 1) == 0)
    {
      [(_SFFormAutoFillController *)self _removeAutomaticPasswordButtonInitiatedByUser:0 removeVisualTreatmentOnly:1];
    }
  }
}

- (void)copyCurrentStrongPassword
{
  id v3 = [MEMORY[0x1E4FB1A78] generalPasteboard];
  [v3 setString:self->_currentStrongPassword];
}

- (void)beginAutomaticPasswordInteractionWithInputSession:(id)a3 generatedPassword:(id)a4
{
  id v11 = a3;
  id v6 = a4;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if (objc_opt_respondsToSelector()) {
    [WeakRetained formAutoFillControllerUserChoseToUseGeneratedPassword:self];
  }
  lastFilledCreditCardData = self->_lastFilledCreditCardData;
  self->_lastFilledCreditCardData = 0;

  lastFilledCreditCardDataTypes = self->_lastFilledCreditCardDataTypes;
  self->_lastFilledCreditCardDataTypes = 0;

  id v10 = [(_SFFormAutoFillController *)self _beginAutomaticPasswordInteractionWithInputSession:v11 generatedPassword:v6 ignorePreviousDecision:1];
}

- (id)beginAutomaticPasswordInteractionWithInputSession:(id)a3
{
  id v3 = [(_SFFormAutoFillController *)self _beginAutomaticPasswordInteractionWithInputSession:a3 generatedPassword:0 ignorePreviousDecision:0];

  return v3;
}

- (id)_beginAutomaticPasswordInteractionWithInputSession:(id)a3 generatedPassword:(id)a4 ignorePreviousDecision:(BOOL)a5
{
  BOOL v5 = a5;
  id v8 = a3;
  id v9 = a4;
  if ([MEMORY[0x1E4F98AF8] isPasswordsAppInstalled]
    && (([MEMORY[0x1E4F98AF8] isAutomaticStrongPasswordsEnabled] & 1) == 0
     || self->_didCloseStrongPasswordIntroductionView))
  {
    goto LABEL_18;
  }
  if ([MEMORY[0x1E4F98AF8] hasInternalContent])
  {
    id v10 = objc_msgSend(MEMORY[0x1E4F1CB18], "safari_browserDefaults");
    char v11 = [v10 BOOLForKey:@"SFDebugEnableAutomaticStrongPasswords"];

    if (v11) {
      goto LABEL_18;
    }
  }
  long long v12 = [v8 focusedElementInfo];
  uint64_t v13 = [v12 type];

  if (v13 != 3)
  {
LABEL_18:
    id v20 = 0;
  }
  else
  {
    uint64_t v14 = [v8 autoFillInputSessionUserObject];
    if (v14)
    {
      uint64_t v15 = [v8 frameHandle];
      if (v15)
      {
        id v16 = (void *)MEMORY[0x1E4F98C30];
        uint64_t v17 = [v14 objectForKeyedSubscript:@"passwordField"];
        uint64_t v18 = [v16 formControlMetadataFromSerializedData:v17];

        if (v18)
        {
          dispatch_time_t v19 = [v8 formMetadata];
          if (v19)
          {
            +[_SFFormDataController sharedController];
            v44 = v53[0] = 0;
            if ([v44 textFieldIsEligibleForAutomaticStrongPassword:v18 form:v19 ignorePreviousDecision:v5 textFieldCurrentlyContainsStrongPassword:v53])
            {
              id v40 = v19;
              v39 = [v18 uniqueID];
              v42 = [v19 passwordElementUniqueID];
              v41 = [v19 confirmPasswordElementUniqueID];
              v52[0] = MEMORY[0x1E4F143A8];
              v52[1] = 3221225472;
              v52[2] = __121___SFFormAutoFillController__beginAutomaticPasswordInteractionWithInputSession_generatedPassword_ignorePreviousDecision___block_invoke;
              v52[3] = &unk_1E5C73EA0;
              v52[4] = self;
              id v38 = (void (**)(void, void, void, void, void, void))MEMORY[0x1AD0C36A0](v52);
              char v43 = [MEMORY[0x1E4F1CA48] array];
              if (v42) {
                [v43 addObject:v42];
              }
              if (v41) {
                [v43 addObject:v41];
              }
              ((void (**)(void, void *, void *, void *, void *, void *))v38)[2](v38, v15, v19, v18, v43, v39);
              if (v53[0])
              {
                id v37 = [v8 focusedElementInfo];
                id v20 = [v37 value];
              }
              else
              {
                id v37 = objc_msgSend(v15, "webui_URL");
                long long v21 = [v44 autoFillQuirksManager];
                id v22 = [v21 passwordGenerationManager];

                id v36 = v22;
                uint64_t v23 = [v22 defaultRequirementsForURL:v37];
                if ([v22 passwordGenerationIsDisallowedByRequirements:v23])
                {
                  id v24 = (void *)v23;
                  id v20 = 0;
                  dispatch_time_t v19 = v40;
                }
                else
                {
                  id WeakRetained = objc_loadWeakRetained((id *)&self->_webView);
                  if (objc_msgSend(v44, "shouldAutoGeneratePasswordsForURL:inWebView:", v37))
                  {
                    id v34 = objc_loadWeakRetained((id *)&self->_delegate);
                    if ((objc_opt_respondsToSelector() & 1) != 0
                      && ([v34 formAutoFillControllerDidUserDeclineAutomaticStrongPasswordForCurrentDomain:self] & 1) != 0)
                    {
                      id v24 = (void *)v23;
                      id v20 = 0;
                    }
                    else
                    {
                      uint64_t v25 = [(_SFFormAutoFillController *)self automaticPasswordForPasswordField:v18 inForm:v40 isFrame:v15];
                      id v33 = (void *)v25;
                      if (v9) {
                        id v26 = v9;
                      }
                      else {
                        id v26 = (void *)v25;
                      }
                      id v20 = v26;
                      if (v20)
                      {
                        id v32 = [MEMORY[0x1E4F1CAD0] setWithObject:v20];
                        [(_SFFormAutoFillController *)self _addValuesAutoFilledForCurrentPage:v32];

                        uint64_t v27 = (NSString *)[v33 copy];
                        defaultStrongPassword = self->_defaultStrongPassword;
                        self->_defaultStrongPassword = v27;

                        ((void (**)(void, void *, void *, void *, void *, void *))v38)[2](v38, v15, v40, v18, v43, v39);
                        if (([MEMORY[0x1E4F98AF8] isPasswordsAppInstalled] & 1) == 0)
                        {
                          uint64_t v29 = (NSString *)[v20 copy];
                          currentStrongPassword = self->_currentStrongPassword;
                          self->_currentStrongPassword = v29;

                          v45[0] = MEMORY[0x1E4F143A8];
                          v45[1] = 3221225472;
                          v45[2] = __121___SFFormAutoFillController__beginAutomaticPasswordInteractionWithInputSession_generatedPassword_ignorePreviousDecision___block_invoke_2;
                          v45[3] = &unk_1E5C73EC8;
                          v51 = v38;
                          id v46 = v15;
                          id v47 = v40;
                          id v48 = v18;
                          id v49 = v43;
                          id v50 = v39;
                          [(_SFFormAutoFillController *)self fillCurrentAutomaticStrongPasswordInCurrentFrameBlurringAfterSubstitution:v5 completionHandler:v45];
                        }
                      }
                      id v24 = (void *)v23;
                    }
                  }
                  else
                  {
                    id v24 = (void *)v23;
                    id v20 = 0;
                  }
                  dispatch_time_t v19 = v40;
                }
              }
            }
            else
            {
              id v20 = 0;
            }
          }
          else
          {
            id v20 = 0;
          }
        }
        else
        {
          id v20 = 0;
        }
      }
      else
      {
        id v20 = 0;
      }
    }
    else
    {
      id v20 = 0;
    }
  }

  return v20;
}

- (void)fillCurrentAutomaticStrongPasswordInCurrentFrameBlurringAfterSubstitution:(BOOL)a3 completionHandler:(id)a4
{
  BOOL v4 = a3;
  id v6 = a4;
  if ([MEMORY[0x1E4F98AF8] isPasswordsAppInstalled])
  {
    id v7 = [(SFFormAutocompleteState *)self->_state frame];
    id v8 = [(SFFormAutocompleteState *)self->_state formMetadata];
    id v9 = [(SFFormAutocompleteState *)self->_state textFieldMetadata];
  }
  else
  {
    id v7 = self->_frameHandleForAutomaticPasswords;
    id v8 = self->_formMetadataForAutomaticPasswords;
    id v9 = self->_passwordFieldMetadataForAutomaticPasswords;
  }
  id v10 = v9;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_webView);
  long long v12 = [(SFFormAutoFillFrameHandle *)v7 webui_URL];
  if (!self->_defaultStrongPassword)
  {
    uint64_t v13 = [(_SFFormAutoFillController *)self automaticPasswordForPasswordField:v10 inForm:v8 isFrame:v7];
    defaultStrongPassword = self->_defaultStrongPassword;
    self->_defaultStrongPassword = v13;
  }
  if (self->_currentStrongPassword
    || (objc_storeStrong((id *)&self->_currentStrongPassword, self->_defaultStrongPassword), self->_currentStrongPassword))
  {
    id v33 = v6;
    id v34 = v7;
    id v35 = v8;
    id v32 = v10;
    uint64_t v30 = v12;
    id v31 = +[_SFFormDataController sharedController];
    BOOL v28 = v4;
    v48[0] = 0;
    v48[1] = v48;
    v48[2] = 0x3032000000;
    v48[3] = __Block_byref_object_copy__0;
    v48[4] = __Block_byref_object_dispose__0;
    id v49 = 0;
    uint64_t v29 = dispatch_group_create();
    dispatch_group_enter(v29);
    uint64_t v15 = [MEMORY[0x1E4F98B70] sharedStore];
    currentStrongPassword = self->_currentStrongPassword;
    uint64_t v17 = objc_msgSend(MEMORY[0x1E4F18D98], "safari_HTMLFormProtectionSpaceForURL:", v12);
    uint64_t v18 = objc_msgSend(WeakRetained, "webui_privateBrowsingEnabled");
    v45[0] = MEMORY[0x1E4F143A8];
    v45[1] = 3221225472;
    v45[2] = __121___SFFormAutoFillController_fillCurrentAutomaticStrongPasswordInCurrentFrameBlurringAfterSubstitution_completionHandler___block_invoke;
    v45[3] = &unk_1E5C73EF0;
    dispatch_time_t v19 = v29;
    id v46 = v19;
    id v20 = v31;
    id v47 = v20;
    [v15 addGeneratedPassword:currentStrongPassword forProtectionSpace:v17 inPrivateBrowsingSession:v18 completionHandler:v45];

    dispatch_group_enter(v19);
    autoFiller = self->_autoFiller;
    uint64_t v22 = [(WBSFormMetadata *)v35 uniqueID];
    uniqueIDOfFocusedPasswordElementWithAutomaticPassword = self->_uniqueIDOfFocusedPasswordElementWithAutomaticPassword;
    uniqueIDsOfPasswordElementsForAutomaticPasswords = self->_uniqueIDsOfPasswordElementsForAutomaticPasswords;
    uint64_t v25 = self->_currentStrongPassword;
    v42[0] = MEMORY[0x1E4F143A8];
    v42[1] = 3221225472;
    v42[2] = __121___SFFormAutoFillController_fillCurrentAutomaticStrongPasswordInCurrentFrameBlurringAfterSubstitution_completionHandler___block_invoke_3;
    void v42[3] = &unk_1E5C73F18;
    v44 = v48;
    id v26 = v19;
    char v43 = v26;
    id v7 = v34;
    [(SFFormAutoFiller *)autoFiller substitutePasswordElementsWithAutomaticPasswordElementsInFrame:v34 formID:v22 focusedPasswordControlUniqueID:uniqueIDOfFocusedPasswordElementWithAutomaticPassword passwordControlUniqueIDs:uniqueIDsOfPasswordElementsForAutomaticPasswords automaticPassword:v25 blurAfterSubstitution:v28 completionHandler:v42];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __121___SFFormAutoFillController_fillCurrentAutomaticStrongPasswordInCurrentFrameBlurringAfterSubstitution_completionHandler___block_invoke_4;
    block[3] = &unk_1E5C73F40;
    id v37 = v34;
    id v38 = self;
    v41 = v48;
    id v8 = v35;
    v39 = v35;
    id v6 = v33;
    id v40 = v33;
    dispatch_group_notify(v26, MEMORY[0x1E4F14428], block);

    _Block_object_dispose(v48, 8);
    id v10 = v32;
    long long v12 = v30;
  }
  else
  {
    uint64_t v27 = WBS_LOG_CHANNEL_PREFIXAutoFill();
    if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR)) {
      -[_SFFormAutoFillController fillCurrentAutomaticStrongPasswordInCurrentFrameBlurringAfterSubstitution:completionHandler:](v27);
    }
  }
}

- (void)fillCreditCardData:(id)a3 inFrame:(id)a4 textFieldMetadata:(id)a5 formMetadata:(id)a6
{
  id v25 = a3;
  id v10 = a4;
  id v11 = a5;
  id v12 = a6;
  id v24 = v11;
  uint64_t v13 = [MEMORY[0x1E4FB6ED8] sharedCreditCardDataController];
  uint64_t v14 = [(_SFFormAutoFillController *)self authenticationContext];
  uint64_t v15 = [v14 externalizedContext];

  id v16 = [MEMORY[0x1E4F1C9C8] dateWithTimeIntervalSinceNow:*MEMORY[0x1E4F992B8]];
  [(_SFFormAutoFillController *)self showSpinnerInFormSoon:v11 frame:v10];
  self->_waitingForCreditCardDataFromWallet = 1;
  objc_initWeak(&location, self);
  uint64_t v23 = objc_msgSend(v10, "webui_URL");
  uint64_t v17 = [v23 host];
  v26[0] = MEMORY[0x1E4F143A8];
  v26[1] = 3221225472;
  v26[2] = __87___SFFormAutoFillController_fillCreditCardData_inFrame_textFieldMetadata_formMetadata___block_invoke;
  v26[3] = &unk_1E5C73F90;
  objc_copyWeak(&v31, &location);
  id v18 = v16;
  id v27 = v18;
  id v19 = v12;
  id v28 = v19;
  uint64_t v22 = v16;
  id v20 = v13;
  id v29 = v20;
  id v21 = v10;
  id v30 = v21;
  objc_msgSend(v20, "getCreditCardDataToFill:host:externalizedContext:completionHandler:", v25, v17, v15, v26, v10, v22);

  objc_destroyWeak(&v31);
  objc_destroyWeak(&location);
}

- (void)showSpinnerInFormSoon:(id)a3 frame:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  objc_initWeak(&location, self);
  id v8 = (void *)MEMORY[0x1E4F98AC0];
  double v9 = *MEMORY[0x1E4F992B8];
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __57___SFFormAutoFillController_showSpinnerInFormSoon_frame___block_invoke;
  v14[3] = &unk_1E5C73FB8;
  objc_copyWeak(&v17, &location);
  id v15 = v6;
  id v16 = v7;
  id v10 = v7;
  id v11 = v6;
  id v12 = [v8 scheduledTimerWithInterval:0 repeats:v14 handler:v9];
  timerToShowSpinnerInForm = self->_timerToShowSpinnerInForm;
  self->_timerToShowSpinnerInForm = v12;

  objc_destroyWeak(&v17);
  objc_destroyWeak(&location);
}

- (void)stopShowingSpinnerInFormSoon:(double)a3 textFieldMetadata:(id)a4 frame:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  objc_initWeak(&location, self);
  id v10 = (void *)MEMORY[0x1E4F98AC0];
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __82___SFFormAutoFillController_stopShowingSpinnerInFormSoon_textFieldMetadata_frame___block_invoke;
  v15[3] = &unk_1E5C73FB8;
  objc_copyWeak(&v18, &location);
  id v16 = v8;
  id v17 = v9;
  id v11 = v9;
  id v12 = v8;
  uint64_t v13 = [v10 scheduledTimerWithInterval:0 repeats:v15 handler:a3];
  timerToStopShowingSpinnerInForm = self->_timerToStopShowingSpinnerInForm;
  self->_timerToStopShowingSpinnerInForm = v13;

  objc_destroyWeak(&v18);
  objc_destroyWeak(&location);
}

- (void)setAutoFillSpinnerVisibility:(BOOL)a3 textFieldMetadata:(id)a4 frame:(id)a5
{
}

- (void)clearAutoFilledCreditCardFieldsInFrame:(id)a3 textFieldMetadata:(id)a4 formMetadata:(id)a5 completionHandler:(id)a6
{
  id v10 = a3;
  id v8 = a6;
  id v9 = [(NSDictionary *)self->_creditCardFormValues allKeys];
  [(SFFormAutoFiller *)self->_autoFiller clearFieldsAndSetFormControlsToNotAutoFilled:v9 inFrame:v10 completionHandler:v8];
}

- (BOOL)elementIsBeingFocusedForStreamlinedLogin:(id)a3
{
  id v3 = [a3 userObject];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    char v4 = objc_msgSend(v3, "safari_BOOLForKey:", @"focusingForStreamlinedLogin");
  }
  else {
    char v4 = 0;
  }

  return v4;
}

- (void)performPageLevelAutoFill
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  id v4 = [WeakRetained formAutoFillControllerURLForFormAutoFill:self];

  [(SFFormAutoFiller *)self->_autoFiller collectFormMetadataForPageLevelAutoFillAtURL:v4];
}

- (void)didPerformPageLevelAutoFill:(BOOL)a3
{
  if (!a3
    || ([(SFFormAutocompleteState *)self->_stateForPageLevelAutoFill multiRoundAutoFillManager], id v4 = objc_claimAutoreleasedReturnValue(), v4, !v4))
  {
    [(SFFormAutocompleteState *)self->_stateForPageLevelAutoFill invalidate];
    stateForPageLevelAutoFill = self->_stateForPageLevelAutoFill;
    self->_stateForPageLevelAutoFill = 0;
  }
}

- (void)collectDiagnosticsForAutoFillWithCompletionHandler:(id)a3
{
}

- (void)_collectDiagnosticsForAutoFillIncludingPageContents:(BOOL)a3 completionHandler:(id)a4
{
  id v5 = a4;
  id v6 = objc_alloc_init(MEMORY[0x1E4F98978]);
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  id v8 = [WeakRetained formAutoFillControllerURLForFormAutoFill:self];

  [v6 setUrl:v8];
  [v6 setSensitiveValuesForRedaction:self->_valuesAutoFilledForCurrentPage];
  autoFiller = self->_autoFiller;
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __99___SFFormAutoFillController__collectDiagnosticsForAutoFillIncludingPageContents_completionHandler___block_invoke;
  v12[3] = &unk_1E5C73FE0;
  id v10 = v6;
  id v13 = v10;
  id v11 = v5;
  id v14 = v11;
  [(SFFormAutoFiller *)autoFiller diagnosticsFormMetadataWithCompletionHandler:v12];
}

- (void)_presentAutoFillInternalFeedbackActivityNotificationIfNeeded
{
  if ([MEMORY[0x1E4F98AF8] isInternalInstall])
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    if (objc_opt_respondsToSelector()) {
      [WeakRetained resetPendingAutoFillInternalFeedbackToastDismissalTimer];
    }
    if (!self->_hasPresentedAutoFillInternalFeedbackNoticeForCurrentPage)
    {
      self->_hasPresentedAutoFillInternalFeedbackNoticeForCurrentPage = 1;
      if (objc_opt_respondsToSelector())
      {
        objc_initWeak(&location, self);
        v4[0] = MEMORY[0x1E4F143A8];
        v4[1] = 3221225472;
        v4[2] = __89___SFFormAutoFillController__presentAutoFillInternalFeedbackActivityNotificationIfNeeded__block_invoke;
        v4[3] = &unk_1E5C74008;
        objc_copyWeak(&v6, &location);
        id v5 = WeakRetained;
        [(_SFFormAutoFillController *)self _collectDiagnosticsForAutoFillIncludingPageContents:0 completionHandler:v4];

        objc_destroyWeak(&v6);
        objc_destroyWeak(&location);
      }
    }
  }
}

- (void)_dismissAutoFillInternalFeedbackNoticeImmediately:(BOOL)a3
{
  BOOL v3 = a3;
  if ([MEMORY[0x1E4F98AF8] isInternalInstall])
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    if (objc_opt_respondsToSelector()) {
      [WeakRetained dismissAutoFillInternalFeedbackActivityForFormAutoFillController:self immediately:v3];
    }
  }
}

- (void)_addValuesAutoFilledForCurrentPage:(id)a3
{
  id v4 = a3;
  if ([MEMORY[0x1E4F98AF8] isInternalInstall])
  {
    objc_msgSend(v4, "safari_mapAndFilterObjectsUsingBlock:", &__block_literal_global_276);
    id v9 = (id)objc_claimAutoreleasedReturnValue();

    valuesAutoFilledForCurrentPage = self->_valuesAutoFilledForCurrentPage;
    if (valuesAutoFilledForCurrentPage)
    {
      -[NSMutableSet unionSet:](valuesAutoFilledForCurrentPage, "unionSet:");
    }
    else
    {
      id v7 = (NSMutableSet *)[v9 mutableCopy];
      id v8 = self->_valuesAutoFilledForCurrentPage;
      self->_valuesAutoFilledForCurrentPage = v7;
    }
    id v6 = v9;
  }
  else
  {
    id v6 = v4;
  }
}

- (void)_didFocusSensitiveFormField
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if (objc_opt_respondsToSelector()) {
    [WeakRetained formAutoFillControllerDidFocusSensitiveFormField:self];
  }
  if ([MEMORY[0x1E4F98AF8] isPasswordsAppInstalled])
  {
    BOOL v3 = [MEMORY[0x1E4F98208] sharedFeatureManager];
    int v4 = [v3 shouldAutoFillPasswordsFromKeychain];

    if (v4) {
      [(_SFFormAutoFillController *)self makeStrongPasswordFieldViewableAndEditable:1];
    }
  }
}

- (id)_customInputViewFromAutoFillInputSession
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  v2 = [(_SFFormAutoFillInputSession *)self->_inputSessionForAutomaticPasswords formInputSession];
  BOOL v3 = [v2 customInputView];

  if (v3)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      int v4 = (id)WBS_LOG_CHANNEL_PREFIXAutoFill();
      if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      {
        id v5 = (objc_class *)objc_opt_class();
        id v6 = NSStringFromClass(v5);
        [(_SFFormAutoFillController *)v6 _customInputViewFromAutoFillInputSession];
      }

      BOOL v3 = 0;
    }
  }

  return v3;
}

- (void)_ensureCurrentStrongPasswordExists
{
  BOOL v3 = [(_SFFormAutoFillController *)self automaticPasswordForPasswordField:self->_passwordFieldMetadataForAutomaticPasswords inForm:self->_formMetadataForAutomaticPasswords isFrame:self->_frameHandleForAutomaticPasswords];
  if (v3)
  {
    id v6 = v3;
    int v4 = (NSString *)[v3 copy];
    currentStrongPassword = self->_currentStrongPassword;
    self->_currentStrongPassword = v4;

    BOOL v3 = v6;
  }
}

- (void)generateAndFillStrongPassword
{
  if (!self->_currentStrongPassword)
  {
    [(_SFFormAutoFillController *)self _ensureCurrentStrongPasswordExists];
    BOOL v3 = [MEMORY[0x1E4F1CAD0] setWithObject:self->_currentStrongPassword];
    [(_SFFormAutoFillController *)self _addValuesAutoFilledForCurrentPage:v3];
  }
  [(_SFFormAutoFillController *)self fillCurrentAutomaticStrongPasswordInCurrentFrameBlurringAfterSubstitution:0 completionHandler:&__block_literal_global_281];
  self->_didFillStrongPasswordFromStreamlinedAutoFillView = 1;
}

- (void)userDidSelectUseKeyboard
{
  BOOL v3 = [(SFFormAutocompleteState *)self->_state inputSession];
  int v4 = [v3 formInputSession];
  [v4 setCustomInputView:0];

  id v5 = [(SFFormAutocompleteState *)self->_state inputSession];
  id v6 = [v5 formInputSession];
  [v6 setAccessoryViewShouldNotShow:0];

  [(_SFFormAutoFillController *)self _restoreInputAssistantItemsIfNecessary];
}

- (void)userDidSelectShowMorePasswords
{
}

- (void)_showICloudKeychainViewInCurrentInputView
{
  BOOL v3 = [(_SFFormAutoFillController *)self _customInputViewFromAutoFillInputSession];
  if (v3)
  {
    int v4 = WBS_LOG_CHANNEL_PREFIXAutoFill();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v6 = 0;
      _os_log_impl(&dword_1A690B000, v4, OS_LOG_TYPE_DEFAULT, "Transitioning to iCloud Keychain view", v6, 2u);
    }
    id v5 = (void *)[objc_alloc(MEMORY[0x1E4F88198]) initWithMode:3];
    [v5 setDelegate:self];
    [v3 replaceContentsOfViewWithStrongPasswordIntroductionViewController:v5];
    objc_storeStrong((id *)&self->_strongPasswordIntroductionViewController, v5);
    [(_SFFormAutoFillController *)self hideInputAccessoryView];
  }
}

- (void)autoFillTextSuggestion:(id)a3
{
}

- (void)autoFillInputViewShouldClose:(id)a3
{
  self->_didCloseStrongPasswordIntroductionView = 1;
  [(_SFFormAutoFillController *)self _dismissKeyboardAndSimulateCarriageReturnKeyEvents:0];
}

- (unint64_t)autoFillFormType
{
  return [(WBSFormMetadata *)self->_formMetadataForAutomaticPasswords type];
}

- (BOOL)shouldGenerateStrongPasswordForFormOfType:(unint64_t)a3
{
  return (a3 & 0xFFFFFFFFFFFFFFFELL) == 4;
}

- (void)fetchIconForURLWithCompletionHandler:(id)a3
{
  id v4 = a3;
  id v5 = objc_alloc(MEMORY[0x1E4F98F30]);
  id WeakRetained = objc_loadWeakRetained((id *)&self->_webView);
  id v7 = [WeakRetained URL];
  id v8 = objc_msgSend(v5, "initWithTitle:url:minimumIconSize:maximumIconSize:", &stru_1EFB97EB8, v7, 48.0, 48.0, 64.0, 64.0);

  uint64_t v9 = [MEMORY[0x1E4F785B0] sharedSiteMetadataManager];
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __66___SFFormAutoFillController_fetchIconForURLWithCompletionHandler___block_invoke;
  v12[3] = &unk_1E5C74050;
  id v10 = v4;
  id v13 = v10;
  id v11 = (id)[v9 registerRequest:v8 priority:2 responseHandler:v12];
}

- (void)strongPasswordIntroductionViewController:(id)a3 shouldPerformAction:(unint64_t)a4 willShowAdditionalView:(BOOL)a5
{
  id v8 = a3;
  uint64_t v7 = [v8 mode];
  if (a4 != 1 || v7)
  {
    if ((v7 & 0xFFFFFFFFFFFFFFFELL) == 2) {
      [(_SFFormAutoFillController *)self _dismissKeyboardAndSimulateCarriageReturnKeyEvents:0];
    }
  }
  else
  {
    self->_didCloseStrongPasswordIntroductionView = 1;
    [(_SFFormAutoFillController *)self _dismissKeyboardAndSimulateCarriageReturnKeyEvents:0];
  }
}

- (void)imageForStrongPasswordIntroductionViewController:(id)a3 completionHandler:(id)a4
{
}

- (id)placeholderImageForStrongPasswordIntroductionViewController:(id)a3
{
  BOOL v3 = (void *)MEMORY[0x1E4F785B8];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_webView);
  id v5 = [WeakRetained URL];
  id v6 = [MEMORY[0x1E4FB1618] systemGrayColor];
  uint64_t v7 = [v3 generateFavoritesIconForTitle:&stru_1EFB97EB8 url:v5 backgroundColor:v6 shouldRemoveGrammaticalArticles:1 fontWeight:0 fontDesign:1 fontSize:56.0];

  return v7;
}

- (id)strongPasswordIntroductionViewController:(id)a3 automaticStrongPasswordWithFormat:(unint64_t)a4
{
  id v7 = a3;
  if (a4 == 1)
  {
    uint64_t v8 = [(_SFFormAutoFillController *)self alphanumericStrongPassword];
  }
  else
  {
    if (a4) {
      goto LABEL_6;
    }
    uint64_t v8 = [(_SFFormAutoFillController *)self defaultStrongPassword];
  }
  id v4 = (void *)v8;
LABEL_6:

  return v4;
}

- (id)recentlySavedAccountForStrongPasswordIntroductionViewController:(id)a3
{
  return self->_recentlySavedAccountFromStreamlinedAutoFill;
}

- (void)handleDidSaveAccountWithGeneratedPasswordNotification:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (self->_didFillStrongPasswordFromStreamlinedAutoFillView
    && !self->_didPostAccountSavedNotificationForAccountSavedWithFilledStrongPassword)
  {
    id v6 = [v4 userInfo];
    id v7 = [v6 objectForKeyedSubscript:*MEMORY[0x1E4FB6F28]];

    if (v7)
    {
      objc_storeStrong((id *)&self->_recentlySavedAccountFromStreamlinedAutoFill, v7);
      if (![MEMORY[0x1E4F88198] shouldShowViewsInMode:3])
      {
        id v11 = [MEMORY[0x1E4F98CC0] sharedNotificationManager];
        v12[0] = MEMORY[0x1E4F143A8];
        v12[1] = 3221225472;
        v12[2] = __83___SFFormAutoFillController_handleDidSaveAccountWithGeneratedPasswordNotification___block_invoke_3;
        v12[3] = &unk_1E5C740A0;
        void v12[4] = self;
        id v13 = v7;
        [v11 requestStatusWithCompletionHandler:v12];

        goto LABEL_11;
      }
      v14[0] = MEMORY[0x1E4F143A8];
      v14[1] = 3221225472;
      v14[2] = __83___SFFormAutoFillController_handleDidSaveAccountWithGeneratedPasswordNotification___block_invoke_2;
      v14[3] = &unk_1E5C73108;
      void v14[4] = self;
      uint64_t v8 = MEMORY[0x1E4F14428];
      uint64_t v9 = v14;
    }
    else
    {
      id v10 = WBS_LOG_CHANNEL_PREFIXAutoFill();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1A690B000, v10, OS_LOG_TYPE_DEFAULT, "No account saved; dismissing keyboard", buf, 2u);
      }
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __83___SFFormAutoFillController_handleDidSaveAccountWithGeneratedPasswordNotification___block_invoke;
      block[3] = &unk_1E5C73108;
      void block[4] = self;
      uint64_t v8 = MEMORY[0x1E4F14428];
      uint64_t v9 = block;
    }
    dispatch_async(v8, v9);
LABEL_11:
  }
}

- (void)handleDidUpdatePasswordForPreviouslySavedAccount:(id)a3
{
  id v4 = a3;
  if (self->_didFillStrongPasswordFromStreamlinedAutoFillView
    && self->_didPostAccountSavedNotificationForAccountSavedWithFilledStrongPassword)
  {
    id v5 = WBS_LOG_CHANNEL_PREFIXAutoFill();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)uint64_t v9 = 0;
      _os_log_impl(&dword_1A690B000, v5, OS_LOG_TYPE_DEFAULT, "Scheduling password updated notification", v9, 2u);
    }
    id v6 = [v4 userInfo];
    id v7 = [v6 objectForKeyedSubscript:*MEMORY[0x1E4FB6F28]];

    objc_storeStrong((id *)&self->_recentlySavedAccountFromStreamlinedAutoFill, v7);
    uint64_t v8 = [MEMORY[0x1E4F98CC0] sharedNotificationManager];
    [v8 schedulePasswordUpdatedNotificationForSavedAccount:v7 completionHandler:&__block_literal_global_296];
  }
}

- (BOOL)metadataCorrectionsEnabled
{
  return self->_metadataCorrectionsEnabled;
}

- (NSString)defaultStrongPassword
{
  return self->_defaultStrongPassword;
}

- (NSString)currentStrongPassword
{
  return self->_currentStrongPassword;
}

- (BOOL)shouldSuggestToCustomizeStrongPassword
{
  return self->_shouldSuggestToCustomizeStrongPassword;
}

- (void)setShouldSuggestToCustomizeStrongPassword:(BOOL)a3
{
  self->_shouldSuggestToCustomizeStrongPassword = a3;
}

- (NSDictionary)creditCardFormValues
{
  return self->_creditCardFormValues;
}

- (CNContact)lastFilledContact
{
  return self->_lastFilledContact;
}

- (void)setLastFilledContact:(id)a3
{
}

- (BOOL)waitingForCreditCardDataFromWallet
{
  return self->_waitingForCreditCardDataFromWallet;
}

- (void)setWaitingForCreditCardDataFromWallet:(BOOL)a3
{
  self->_waitingForCreditCardDataFromWallet = a3;
}

- (WBSCreditCardData)lastFilledCreditCardData
{
  return self->_lastFilledCreditCardData;
}

- (void)setLastFilledCreditCardData:(id)a3
{
}

- (NSMutableSet)previouslyFilledVirtualCardNumbers
{
  return self->_previouslyFilledVirtualCardNumbers;
}

- (void)setPreviouslyFilledVirtualCardNumbers:(id)a3
{
}

- (NSDictionary)lastFilledCreditCardDataTypes
{
  return self->_lastFilledCreditCardDataTypes;
}

- (void)setLastFilledCreditCardDataTypes:(id)a3
{
}

- (BOOL)didCloseStrongPasswordIntroductionView
{
  return self->_didCloseStrongPasswordIntroductionView;
}

- (void)setDidCloseStrongPasswordIntroductionView:(BOOL)a3
{
  self->_didCloseStrongPasswordIntroductionView = a3;
}

- (BOOL)shouldAutofillESimInformation
{
  return self->_shouldAutofillESimInformation;
}

- (void)setShouldAutofillESimInformation:(BOOL)a3
{
  self->_shouldAutofillESimInformation = a3;
}

- (_SFFormAutoFillTestController)testController
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_testController);

  return (_SFFormAutoFillTestController *)WeakRetained;
}

- (void)setTestController:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_testController);
  objc_storeStrong((id *)&self->_lastFilledCreditCardDataTypes, 0);
  objc_storeStrong((id *)&self->_previouslyFilledVirtualCardNumbers, 0);
  objc_storeStrong((id *)&self->_lastFilledCreditCardData, 0);
  objc_storeStrong((id *)&self->_lastFilledContact, 0);
  objc_storeStrong((id *)&self->_creditCardFormValues, 0);
  objc_storeStrong((id *)&self->_currentStrongPassword, 0);
  objc_storeStrong((id *)&self->_defaultStrongPassword, 0);
  objc_storeStrong((id *)&self->_recentlySavedAccountFromStreamlinedAutoFill, 0);
  objc_storeStrong((id *)&self->_strongPasswordIntroductionViewController, 0);
  objc_storeStrong((id *)&self->_valuesAutoFilledForCurrentPage, 0);
  objc_storeStrong((id *)&self->_timerToStopShowingSpinnerInForm, 0);
  objc_storeStrong((id *)&self->_timerToShowSpinnerInForm, 0);
  objc_storeStrong((id *)&self->_externalCredentialIdentitiesForStreamlinedAutoFill, 0);
  objc_storeStrong((id *)&self->_preservedTrailingBarButtonGroups, 0);
  objc_storeStrong((id *)&self->_preservedLeadingBarButtonGroups, 0);
  objc_storeStrong((id *)&self->_autoFillInputView, 0);
  objc_storeStrong((id *)&self->_alphanumericStrongPassword, 0);
  objc_storeStrong((id *)&self->_passwordFieldMetadataForAutomaticPasswords, 0);
  objc_storeStrong((id *)&self->_formMetadataForAutomaticPasswords, 0);
  objc_storeStrong((id *)&self->_inputSessionForAutomaticPasswords, 0);
  objc_storeStrong((id *)&self->_frameHandleForAutomaticPasswords, 0);
  objc_storeStrong((id *)&self->_uniqueIDsOfPasswordElementsForAutomaticPasswords, 0);
  objc_storeStrong((id *)&self->_uniqueIDOfFocusedPasswordElementWithAutomaticPassword, 0);
  objc_storeStrong((id *)&self->_formTelemetryDataMonitorQueue, 0);
  objc_storeStrong((id *)&self->_formTelemetryDataMonitor, 0);
  objc_storeStrong((id *)&self->_cachedWebpageLocale, 0);
  objc_storeStrong((id *)&self->_uniqueIDsOfControlsThatWereAutoFilled, 0);
  objc_storeStrong((id *)&self->_uniqueIDsOfFormsThatWereAutoFilled, 0);
  objc_storeStrong((id *)&self->_unsubmittedFormFrame, 0);
  objc_storeStrong((id *)&self->_unsubmittedForm, 0);
  objc_storeStrong((id *)&self->_prefillTimer, 0);
  objc_storeStrong((id *)&self->_stateForPageLevelAutoFill, 0);
  objc_storeStrong((id *)&self->_state, 0);
  objc_storeStrong((id *)&self->_autoFiller, 0);
  objc_storeStrong((id *)&self->_remoteObjectInterface, 0);
  objc_destroyWeak((id *)&self->_delegate);

  objc_destroyWeak((id *)&self->_webView);
}

- (void)_dismissKeyboardAndSimulateCarriageReturnKeyEvents:(os_log_t)log .cold.1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_1A690B000, log, OS_LOG_TYPE_ERROR, "Failed to dismiss keyboard and simulate pressing the Enter key. Refusing to try automatic login.", v1, 2u);
}

- (void)fillCurrentAutomaticStrongPasswordInCurrentFrameBlurringAfterSubstitution:(os_log_t)log completionHandler:.cold.1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_1A690B000, log, OS_LOG_TYPE_ERROR, "Couldn't generate a strong password, so there's nothing to fill", v1, 2u);
}

- (void)_customInputViewFromAutoFillInputSession
{
  *(_DWORD *)buf = 138412290;
  *(void *)(buf + 4) = a1;
  _os_log_error_impl(&dword_1A690B000, log, OS_LOG_TYPE_ERROR, "Found unexpected input view of type %@", buf, 0xCu);
}

@end