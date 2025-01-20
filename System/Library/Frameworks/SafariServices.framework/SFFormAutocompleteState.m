@interface SFFormAutocompleteState
+ (BOOL)_shouldSaveCredentialsInProtectionSpace:(id)a3 savedAccountContext:(id)a4;
+ (void)_getMatchesFromFormProtectionSpace:(id)a3 matchesFromOtherProtectionSpaces:(id)a4 withFormURL:(id)a5 credentialMatches:(id)a6 lastGeneratedPassword:(id)a7 currentUser:(id)a8 currentPassword:(id)a9 forUserNamesOnly:(BOOL)a10;
- (BOOL)_canAutoFillCreditCardData;
- (BOOL)_didGatherESimInformation;
- (BOOL)_hasMatchWithUser:(id)a3 password:(id)a4;
- (BOOL)_passwordGenerationAssistanceAutoFillButtonEnabled;
- (BOOL)_shouldAllowExternalPasswordAutoFillOnURL:(id)a3;
- (BOOL)_shouldAllowGeneratedPassword;
- (BOOL)_shouldOfferCreditCardDataAfterUserHasFilledCreditCardData:(id)a3;
- (BOOL)_shouldShowPasswordOptions;
- (BOOL)_shouldUsePasswordGenerationAssistanceForTextField;
- (BOOL)_suggestUsernamesForRegistrationIfPossible:(unint64_t)a3;
- (BOOL)_textFieldIsEmptyPasswordField;
- (BOOL)currentTextFieldLooksLikeCardSecurityCodeFieldButNotCardNumberOrCardholderField;
- (BOOL)shouldOfferToAutoFillCreditCardData;
- (SFFormAutoFillFrameHandle)frame;
- (SFFormAutocompleteState)initWithFrame:(id)a3 form:(id)a4 textField:(id)a5 inputSession:(id)a6 autoFillController:(id)a7;
- (WBSCreditCardData)previouslySelectedVirtualCardWhereUserRequestedToIncreaseBalance;
- (WBSFormControlMetadata)textFieldMetadata;
- (WBSFormMetadata)formMetadata;
- (WBSMultiRoundAutoFillManager)multiRoundAutoFillManager;
- (_SFFormAutoFillInputSession)inputSession;
- (id)_actionForPresentingPasswordManagerExtension:(id)a3 completionHandler:(id)a4;
- (id)_addHideMyEmailSuggestionsIfNecessary:(id)a3 hideMyEmailRecord:(id)a4;
- (id)_bestTextFieldMetadataForMetadata:(id)a3;
- (id)_cachedPotentialCredentialMatches;
- (id)_correctedFormMetadata:(id)a3;
- (id)_createCreditCardHeaderViewControllerForEscapeHatchAlertControllerForCard:(id)a3;
- (id)_hideMyEmailCreationSuggestion;
- (id)_hideMyEmailSuggestionForRecord:(id)a3;
- (id)_messageForPageLevelAutoFillNotAvailableAlertForResult:(int64_t)a3;
- (id)_sortedSingleCreditCardDataArray:(id)a3;
- (id)_suggestionsForAutoFillDisplayData:(id)a3;
- (id)_textSuggestionForCredentialDisplayData:(id)a3 submitForm:(BOOL)a4;
- (id)_textSuggestionForExternalCredentialIdentity:(id)a3 submitForm:(BOOL)a4;
- (id)_titleForPageLevelAutoFillNotAvailableAlertForResult:(int64_t)a3;
- (id)_viewControllerToPresentFrom;
- (id)externalCredentialIdentities;
- (int64_t)_actionForLoginForm;
- (int64_t)_passwordGenerationAssistanceAction;
- (int64_t)action;
- (void)_addActionForAlertController:(id)a3 title:(id)a4 detail:(id)a5 handler:(id)a6;
- (void)_addPasswordsAutoFillSuggestionToSuggestions:(id)a3 forPurpose:(int64_t)a4;
- (void)_autoFillDisplayData:(id)a3 setAutoFilled:(BOOL)a4;
- (void)_autoFillFormWithUsername:(id)a3;
- (void)_autoFillHideMyEmailRecord:(id)a3;
- (void)_autoFillSingleCreditCardData:(int64_t)a3;
- (void)_autoFillWithSet:(id)a3;
- (void)_autofillESimData:(int64_t)a3;
- (void)_buildAndPresentOneTimeCodeAlertControllerWithExternalCredentialIdentities:(id)a3;
- (void)_clearAutoFilledCreditCardFieldsAndShowAllCreditCards;
- (void)_clearCachedCredentials;
- (void)_completePasskeyAssertionWithCredential:(id)a3 completionHandler:(id)a4;
- (void)_didGatherESimInformation;
- (void)_fetchPotentialCredentialMatchesWithCompletion:(id)a3;
- (void)_fillASOneTimeCodeCredential:(id)a3 setAutoFilled:(BOOL)a4 submitForm:(BOOL)a5;
- (void)_fillASPasswordCredential:(id)a3 needsAuthentication:(BOOL)a4 setAutoFilled:(BOOL)a5 submitForm:(BOOL)a6;
- (void)_fillCredential:(id)a3 setAutoFilled:(BOOL)a4 setAsDefaultCredential:(BOOL)a5 focusFieldAfterFilling:(BOOL)a6 submitForm:(BOOL)a7;
- (void)_fillCredentialAfterAuthenticationIfNeeded:(id)a3 setAsDefaultCredential:(BOOL)a4 submitForm:(BOOL)a5;
- (void)_fillCredentialIdentity:(id)a3 submitForm:(BOOL)a4;
- (void)_fillCreditCardData:(id)a3;
- (void)_fillCreditCardDataAfterAuthenticationIfNeeded:(id)a3;
- (void)_fillOneTimeCodeAfterAuthenticationIfNeeded:(id)a3 inFrame:(id)a4 shouldSubmit:(BOOL)a5;
- (void)_fillSavedAccount:(id)a3 setAutoFilled:(BOOL)a4 setAsDefaultCredential:(BOOL)a5 focusFieldAfterFilling:(BOOL)a6 submitForm:(BOOL)a7;
- (void)_fillSavedAccountMatchAfterAuthenticationIfNeeded:(id)a3 setAsDefaultCredential:(BOOL)a4 submitForm:(BOOL)a5;
- (void)_fillSingleCreditCardDataValue:(id)a3 creditCardDataType:(int64_t)a4;
- (void)_finishPageLevelAutoFillWithResult:(int64_t)a3;
- (void)_gatherAndShowAddressBookAutoFillSuggestions;
- (void)_gatherAndShowAddressBookAutoFillSuggestionsWithCorrections;
- (void)_gatherFormValues;
- (void)_gatherFormValuesWithCompletionHandler:(id)a3;
- (void)_generateAndSuggestPasswordWithCompletionHandler:(id)a3;
- (void)_getLoginFormUser:(id *)a3 password:(id *)a4 userIsAutoFilled:(BOOL *)a5 passwordIsAutoFilled:(BOOL *)a6;
- (void)_getMatchingKeychainCredentialsIncludingCredentialsWithEmptyUsernames:(BOOL)a3 withCompletion:(id)a4;
- (void)_getShouldOfferForgetPassword:(BOOL *)a3 savePassword:(BOOL *)a4;
- (void)_offerToAutoFillContact;
- (void)_offerToAutoFillFromAvailableOneTimeCodes;
- (void)_offerToAutoFillFromPotentialCredentialMatches;
- (void)_offerToForgetSavedAccount:(id)a3 completionHandler:(id)a4;
- (void)_performAutoFill;
- (void)_performPageLevelContactAutoFill;
- (void)_performPageLevelCredentialAutoFill;
- (void)_presentContactsAccessSettingsAlert;
- (void)_presentCredentialListForExtension:(id)a3 completionHandler:(id)a4;
- (void)_presentLowBalanceAppleCashAlertForCard:(id)a3;
- (void)_presentViewController:(id)a3 presentingViewController:(id)a4 animated:(BOOL)a5 completion:(id)a6;
- (void)_provisionHideMyEmailRecord;
- (void)_setShowingKeyboardInputView:(BOOL)a3;
- (void)_setUpMultiRoundAutoFillManagerIfNecessary;
- (void)_setUserAndPasswordFieldsAutoFilled:(BOOL)a3 clearPasswordField:(BOOL)a4;
- (void)_showCreditCardDataSuggestionsAfterUserHasFilledCreditCardData;
- (void)_showOtherContactOptions;
- (void)_showPageLevelAutoFillNotAvailableAlertForResult:(int64_t)a3;
- (void)_startHideMyEmailRecordUpdate;
- (void)_suggestLoginCredentialsShowingQuickTypeKey:(BOOL)a3;
- (void)_suggestPasswordForNewAccountOrChangePasswordForm;
- (void)_switchToCustomInputViewWithMatches:(id)a3 contact:(id)a4;
- (void)_textDidChangeInForm:(id)a3 textField:(id)a4;
- (void)_updateAutoFillActionToCaptureCreditCardAndFill;
- (void)_updateCreditCardAutoFillAction;
- (void)_updateSuggestions:(unint64_t)a3;
- (void)autoFill;
- (void)autoFillTextSuggestion:(id)a3;
- (void)captureCreditCardDataWithCameraAndFill;
- (void)contactPicker:(id)a3 didSelectContact:(id)a4;
- (void)contactPickerDidCancel:(id)a3;
- (void)credentialAuthenticationViewController:(id)a3 didFinishWithCredential:(id)a4 error:(id)a5 completion:(id)a6;
- (void)credentialAuthenticationViewController:(id)a3 didFinishWithOneTimeCodeCredential:(id)a4 error:(id)a5 completion:(id)a6;
- (void)credentialAuthenticationViewController:(id)a3 didFinishWithPasskeyAssertionCredential:(id)a4 error:(id)a5 completion:(id)a6;
- (void)credentialListViewController:(id)a3 didFinishWithCredential:(id)a4 completion:(id)a5;
- (void)credentialListViewController:(id)a3 didFinishWithOneTimeCodeCredential:(id)a4 completion:(id)a5;
- (void)credentialListViewController:(id)a3 didFinishWithPasskeyAssertionCredential:(id)a4 completion:(id)a5;
- (void)creditCardCaptureViewController:(id)a3 didCaptureCreditCard:(id)a4;
- (void)creditCardCaptureViewControllerDidCancel:(id)a3;
- (void)dealloc;
- (void)dismissCustomAutoFill;
- (void)getTextSuggestionForStreamlinedAutoFillWithCredentialIdentity:(id)a3 completion:(id)a4;
- (void)invalidate;
- (void)newAutoFillablePasskeysAvailable:(id)a3;
- (void)oneTimeCodeProviderReceivedCode:(id)a3;
- (void)performAutoFillWithMatchSelections:(id)a3 doNotFill:(id)a4 contact:(id)a5;
- (void)performPageLevelAutoFill;
- (void)presentCustomizeStrongPasswordAlert;
- (void)presentUIForPasswordCredentialAuthenticationViewController:(id)a3;
- (void)presentUnavailableVirtualCardAlert;
- (void)setAction:(int64_t)a3;
- (void)setPreviouslySelectedVirtualCardWhereUserRequestedToIncreaseBalance:(id)a3;
- (void)showAllPasswordsButtonTapped;
- (void)textDidChangeInFrame:(id)a3 form:(id)a4 textField:(id)a5;
- (void)updateAutoFillButton;
- (void)updateCachedFormMetadataAfterFilling:(id)a3;
- (void)updateSuggestions;
@end

@implementation SFFormAutocompleteState

- (SFFormAutocompleteState)initWithFrame:(id)a3 form:(id)a4 textField:(id)a5 inputSession:(id)a6 autoFillController:(id)a7
{
  id v13 = a3;
  id v14 = a4;
  id v15 = a5;
  id v16 = a6;
  id v17 = a7;
  v36.receiver = self;
  v36.super_class = (Class)SFFormAutocompleteState;
  v18 = [(SFFormAutocompleteState *)&v36 init];
  v19 = v18;
  if (v18)
  {
    objc_storeWeak((id *)&v18->_autoFillController, v17);
    v20 = +[_SFFormDataController sharedController];
    objc_storeWeak((id *)&v19->_dataController, v20);

    objc_storeStrong((id *)&v19->_formMetadata, a4);
    v19->_formType = [v14 type];
    objc_storeStrong((id *)&v19->_frame, a3);
    objc_storeStrong((id *)&v19->_inputSession, a6);
    uint64_t v21 = [v15 copy];
    textFieldMetadata = v19->_textFieldMetadata;
    v19->_textFieldMetadata = (WBSFormControlMetadata *)v21;

    if ([v17 metadataCorrectionsEnabled])
    {
      id v23 = objc_alloc(MEMORY[0x1E4F98B40]);
      v24 = objc_msgSend(v13, "webui_URL");
      v25 = [v24 host];
      uint64_t v26 = [v23 initWithDomain:v25];
      metadataCorrector = v19->_metadataCorrector;
      v19->_metadataCorrector = (WBSFormAutoFillMetadataCorrector *)v26;

      [(WBSFormAutoFillMetadataCorrector *)v19->_metadataCorrector enqueueCorrectionsRequestForFormMetadata:v14 completionHandler:0];
    }
    v28 = [v17 oneTimeCodeProvider];
    [v28 addObserver:v19];

    if ([MEMORY[0x1E4FB6EF0] shouldDisplayHideMyEmailForControl:v19->_textFieldMetadata]) {
      [(SFFormAutocompleteState *)v19 _startHideMyEmailRecordUpdate];
    }
    v29 = [[SFCreditCardFillingViewController alloc] initWithFormAutocompleteState:v19];
    creditCardViewController = v19->_creditCardViewController;
    v19->_creditCardViewController = v29;

    v31 = (WBSAuthenticationServicesAgentProxy *)objc_alloc_init(MEMORY[0x1E4F98968]);
    authenticationServicesAgentProxy = v19->_authenticationServicesAgentProxy;
    v19->_authenticationServicesAgentProxy = v31;

    v33 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v33 addObserver:v19 selector:sel_newAutoFillablePasskeysAvailable_ name:*MEMORY[0x1E4F99548] object:0];

    v34 = v19;
  }

  return v19;
}

- (void)invalidate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_autoFillController);
  if ([WeakRetained waitingForCreditCardDataFromWallet]) {
    [WeakRetained setAutoFillSpinnerVisibility:0 textFieldMetadata:self->_textFieldMetadata frame:self->_frame];
  }
  self->_action = 0;
  cachedCredentialMatches = self->_cachedCredentialMatches;
  self->_cachedCredentialMatches = 0;

  self->_fetchingLoginCredentialSuggestions = 0;
  formMetadata = self->_formMetadata;
  self->_formMetadata = 0;

  formValues = self->_formValues;
  self->_formType = 0;
  self->_formValues = 0;

  frame = self->_frame;
  self->_frame = 0;

  self->_invalidated = 1;
  multiRoundAutoFillManager = self->_multiRoundAutoFillManager;
  self->_multiRoundAutoFillManager = 0;

  cachedRelatedCredentialMatches = self->_cachedRelatedCredentialMatches;
  self->_cachedRelatedCredentialMatches = 0;

  textFieldMetadata = self->_textFieldMetadata;
  self->_textFieldMetadata = 0;

  self->_performingPageLevelAutoFill = 0;
  v10 = [WeakRetained oneTimeCodeProvider];
  [v10 removeObserver:self];

  metadataCorrector = self->_metadataCorrector;
  self->_metadataCorrector = 0;
}

- (void)dealloc
{
  v2.receiver = self;
  v2.super_class = (Class)SFFormAutocompleteState;
  [(SFFormAutocompleteState *)&v2 dealloc];
}

- (void)updateSuggestions
{
  v3 = [(SFFormAutoFillFrameHandle *)self->_frame webui_URL];
  char v4 = objc_msgSend(v3, "safari_isEligibleToShowNotSecureWarning");

  if ((v4 & 1) == 0)
  {
    [(SFFormAutocompleteState *)self _updateSuggestions:255];
  }
}

- (void)_updateSuggestions:(unint64_t)a3
{
  v60[2] = *MEMORY[0x1E4F143B8];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_autoFillController);
  v5 = [WeakRetained webView];
  v58[0] = 0;
  v58[1] = v58;
  v58[2] = 0x3032000000;
  v58[3] = __Block_byref_object_copy__4;
  v58[4] = __Block_byref_object_dispose__4;
  id v59 = 0;
  if (objc_opt_respondsToSelector()) {
    objc_msgSend(v5, "webui_setInputDashboardViewController:", 0);
  }
  v33 = [(_SFFormAutoFillInputSession *)self->_inputSession formInputSession];
  v6 = [MEMORY[0x1E4F98208] sharedFeatureManager];
  char v32 = [v6 shouldAutoFillPasswords];

  group = dispatch_group_create();
  v7 = [MEMORY[0x1E4F98208] sharedFeatureManager];
  char v8 = [v7 shouldAutoFillPasswordsFromKeychain];

  v9 = [WeakRetained oneTimeCodeProvider];
  v10 = [(WBSFormControlMetadata *)self->_textFieldMetadata ancestorFrameURLs];
  uint64_t v11 = [(WBSFormControlMetadata *)self->_textFieldMetadata oneTimeCodeFieldClassification];
  v12 = [WeakRetained savedAccountContext];
  id v13 = [v9 currentOneTimeCodesForWebBrowserWithWebsiteFrameURLs:v10 fieldClassification:v11 inContext:v12];
  v56[0] = MEMORY[0x1E4F143A8];
  v56[1] = 3221225472;
  v56[2] = __46__SFFormAutocompleteState__updateSuggestions___block_invoke;
  v56[3] = &__block_descriptor_33_e31_B16__0__SFAutoFillOneTimeCode_8l;
  char v57 = v8;
  id v14 = objc_msgSend(v13, "safari_filterObjectsUsingBlock:", v56);

  uint64_t v15 = [v14 count];
  BOOL v16 = v15 != 0;
  uint64_t v50 = 0;
  v51 = &v50;
  uint64_t v52 = 0x3032000000;
  v53 = __Block_byref_object_copy__4;
  v54 = __Block_byref_object_dispose__4;
  id v55 = 0;
  id v17 = [(WBSFormControlMetadata *)self->_textFieldMetadata ancestorFrameURLs];
  v18 = [v17 lastObject];

  v19 = [MEMORY[0x1E4F98230] sharedManager];
  LODWORD(v17) = [v19 atLeastOneEnabledExtensionSupportsOneTimeCodes];

  if (v17)
  {
    id v31 = objc_alloc_init(MEMORY[0x1E4F98228]);
    v20 = [v18 host];
    uint64_t v21 = [v20 length];

    if (v21)
    {
      dispatch_group_enter(group);
      v22 = [v18 host];
      v60[0] = v22;
      id v23 = [v18 host];
      v24 = objc_msgSend(v23, "safari_highLevelDomainForPasswordManager");
      v60[1] = v24;
      v25 = [MEMORY[0x1E4F1C978] arrayWithObjects:v60 count:2];
      v47[0] = MEMORY[0x1E4F143A8];
      v47[1] = 3221225472;
      v47[2] = __46__SFFormAutocompleteState__updateSuggestions___block_invoke_2;
      v47[3] = &unk_1E5C75238;
      v49 = &v50;
      v48 = group;
      [v31 fetchOneTimeCodeCredentialIdentitiesMatchingDomains:v25 completion:v47];
    }
    if (v15) {
      BOOL v16 = 1;
    }
    else {
      BOOL v16 = [(id)v51[5] count] != 0;
    }
  }
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __46__SFFormAutocompleteState__updateSuggestions___block_invoke_3;
  block[3] = &unk_1E5C75260;
  BOOL v45 = v16;
  block[4] = self;
  id v37 = v14;
  id v38 = v18;
  id v39 = WeakRetained;
  id v40 = v33;
  id v41 = v5;
  char v46 = v32;
  v42 = &v50;
  v43 = v58;
  unint64_t v44 = a3;
  id v26 = v5;
  id v27 = v33;
  id v28 = WeakRetained;
  id v29 = v18;
  id v30 = v14;
  dispatch_group_notify(group, MEMORY[0x1E4F14428], block);

  _Block_object_dispose(&v50, 8);
  _Block_object_dispose(v58, 8);
}

BOOL __46__SFFormAutocompleteState__updateSuggestions___block_invoke(uint64_t a1, void *a2)
{
  return [a2 source] != 2 || *(unsigned char *)(a1 + 32) != 0;
}

void __46__SFFormAutocompleteState__updateSuggestions___block_invoke_2(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a2);
  id v4 = a2;
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

void __46__SFFormAutocompleteState__updateSuggestions___block_invoke_3(uint64_t a1)
{
  uint64_t v1 = a1;
  uint64_t v66 = *MEMORY[0x1E4F143B8];
  if (*(unsigned char *)(a1 + 104)
    && [MEMORY[0x1E4F98B50] shouldDisplayOneTimeCodeForControl:*(void *)(*(void *)(a1 + 32) + 232) inForm:*(void *)(*(void *)(a1 + 32) + 224)])
  {
    objc_super v2 = [MEMORY[0x1E4F1CA48] array];
    unint64_t v3 = [*(id *)(v1 + 40) count];
    int IsPad = _SFDeviceIsPad();
    unint64_t v5 = 1;
    if (IsPad) {
      unint64_t v5 = 2;
    }
    unint64_t v6 = v3;
    if (v5 < v3)
    {
      if (_SFDeviceIsPad()) {
        unint64_t v6 = 2;
      }
      else {
        unint64_t v6 = 1;
      }
    }
    uint64_t v7 = [*(id *)(*(void *)(*(void *)(v1 + 80) + 8) + 40) count];
    long long v61 = 0u;
    long long v62 = 0u;
    long long v63 = 0u;
    long long v64 = 0u;
    id obj = *(id *)(*(void *)(*(void *)(v1 + 80) + 8) + 40);
    uint64_t v8 = [obj countByEnumeratingWithState:&v61 objects:v65 count:16];
    if (v8)
    {
      uint64_t v9 = v8;
      uint64_t v57 = v7;
      unint64_t v58 = v3;
      uint64_t v10 = 0;
      uint64_t v11 = *(void *)v62;
      while (2)
      {
        uint64_t v12 = 0;
        uint64_t v13 = v10;
        do
        {
          uint64_t v14 = v12;
          if (*(void *)v62 != v11) {
            objc_enumerationMutation(obj);
          }
          uint64_t v15 = *(void **)(*((void *)&v61 + 1) + 8 * v12);
          BOOL v16 = +[_SFTextSuggestion textSuggestionWithCredentialIdentity:*(void *)(*((void *)&v61 + 1) + 8 * v14) submitForm:1];
          uint64_t v17 = v1;
          v18 = [MEMORY[0x1E4F98250] titleForCredentialIdentity:v15 formURL:*(void *)(v1 + 48)];
          [v16 setHeaderText:v18];

          v19 = [v15 user];
          [v16 setDisplayText:v19];

          [v2 addObject:v16];
          unint64_t v20 = v13 + v14 + 1;

          if (v20 >= v6)
          {
            uint64_t v1 = v17;
            goto LABEL_23;
          }
          uint64_t v12 = v14 + 1;
          uint64_t v1 = v17;
        }
        while (v9 != v14 + 1);
        uint64_t v9 = [obj countByEnumeratingWithState:&v61 objects:v65 count:16];
        uint64_t v10 = v13 + v12;
        if (v9) {
          continue;
        }
        break;
      }
      unint64_t v20 = v13 + v14 + 1;
LABEL_23:
      uint64_t v7 = v57;
      unint64_t v3 = v58;
    }
    else
    {
      unint64_t v20 = 0;
    }
    unint64_t v33 = v7 + v3;

    if ([*(id *)(v1 + 40) count])
    {
      unint64_t v34 = v6 - v20;
      if (v34)
      {
        for (uint64_t i = 0; i != v34; ++i)
        {
          objc_super v36 = [*(id *)(v1 + 40) objectAtIndexedSubscript:i];
          id v37 = +[_SFTextSuggestion textSuggestionWithOneTimeCode:v36];
          id v38 = [v36 localizedSubtitleForContext:0];
          [v37 setHeaderText:v38];

          id v39 = [v36 localizedTitleForContext:0];
          [v37 setDisplayText:v39];

          [v2 addObject:v37];
        }
      }
    }
    if (v33 > v6) {
      [*(id *)(v1 + 32) _addPasswordsAutoFillSuggestionToSuggestions:v2 forPurpose:1];
    }
    if ([v2 count])
    {
      id v40 = *(void **)(v1 + 56);
      id v41 = [*(id *)(*(void *)(v1 + 32) + 232) uniqueID];
      [v40 reportAutoFillOfferedType:2 forTextFieldWithID:v41 forFormMetadata:*(void *)(*(void *)(v1 + 32) + 224)];
    }
    [*(id *)(v1 + 64) setSuggestions:v2];
    v42 = WBS_LOG_CHANNEL_PREFIXOneTimeCodeAutoFill();
    if (os_log_type_enabled(v42, OS_LOG_TYPE_DEBUG)) {
      __46__SFFormAutocompleteState__updateSuggestions___block_invoke_3_cold_2();
    }
    goto LABEL_77;
  }
  if ([*(id *)(v1 + 40) count])
  {
    uint64_t v21 = *(void *)(*(void *)(v1 + 32) + 232);
    v22 = WBS_LOG_CHANNEL_PREFIXOneTimeCodeAutoFill();
    id v23 = v22;
    if (v21)
    {
      if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1A690B000, v23, OS_LOG_TYPE_INFO, "Did not suggested verification code autofill because current text field is not verification code friendly", buf, 2u);
      }
    }
    else if (os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG))
    {
      __46__SFFormAutocompleteState__updateSuggestions___block_invoke_3_cold_1(v23);
    }
  }
  int v24 = [*(id *)(v1 + 32) _shouldShowPasswordOptions];
  v25 = *(void **)(v1 + 32);
  if (v24)
  {
    if ([v25 action] == 7)
    {
      if ([MEMORY[0x1E4F88198] shouldShowLoginIntroduction])
      {
        id v26 = [*(id *)(v1 + 72) firstResponder];
        [v26 reloadInputViews];
      }
      objc_super v2 = [MEMORY[0x1E4F1CA48] array];
      id v27 = [*(id *)(v1 + 56) automaticPasswordForPasswordField:*(void *)(*(void *)(v1 + 32) + 232) inForm:*(void *)(*(void *)(v1 + 32) + 224) isFrame:*(void *)(*(void *)(v1 + 32) + 216)];
      if (!v27) {
        goto LABEL_73;
      }
      id v28 = +[_SFTextSuggestion textSuggestionWithGeneratedPassword:v27];
      if ([MEMORY[0x1E4F98AF8] isPasswordsAppInstalled])
      {
        if ([*(id *)(v1 + 56) shouldSuggestToCustomizeStrongPassword])
        {
          id v29 = +[_SFTextSuggestion textSuggestionToCustomizeGeneratedPassword];

          id v30 = _WBSLocalizedString();
          [v29 setDisplayText:v30];
          id v28 = v29;
        }
        else
        {
          id v30 = _WBSLocalizedString();
          [v28 setDisplayText:v30];
        }
      }
      v51 = [v28 displayText];

      if (!v51)
      {
        uint64_t v52 = _WBSLocalizedString();
        [v28 setHeaderText:v52];

        [v28 setDisplayText:v27];
      }
      [v2 addObject:v28];
      char v53 = [MEMORY[0x1E4F98AF8] isPasswordsAppInstalled];

      if ((v53 & 1) == 0) {
LABEL_73:
      }
        [*(id *)(v1 + 32) _addPasswordsAutoFillSuggestionToSuggestions:v2 forPurpose:0];
      if ([v2 count])
      {
        v54 = *(void **)(v1 + 56);
        id v55 = [*(id *)(*(void *)(v1 + 32) + 232) uniqueID];
        [v54 reportAutoFillOfferedType:1 forTextFieldWithID:v55 forFormMetadata:*(void *)(*(void *)(v1 + 32) + 224)];
      }
      v56 = [*(id *)(*(void *)(v1 + 32) + 64) formInputSession];
      [v56 setSuggestions:v2];

LABEL_77:
      return;
    }
    if ([*(id *)(v1 + 32) action] == 8
      && [MEMORY[0x1E4F88198] shouldShowLoginIntroduction])
    {
      id v31 = [*(id *)(v1 + 72) firstResponder];
      char v32 = v31;
      if (v31) {
        [v31 reloadInputViews];
      }
    }
    if (*(unsigned char *)(v1 + 105)) {
      [*(id *)(v1 + 32) _suggestLoginCredentialsShowingQuickTypeKey:1];
    }
  }
  else if ([v25 _shouldOfferCreditCardDataAfterUserHasFilledCreditCardData:v25[29]])
  {
    [*(id *)(v1 + 32) _showCreditCardDataSuggestionsAfterUserHasFilledCreditCardData];
  }
  else if ([*(id *)(v1 + 56) waitingForCreditCardDataFromWallet])
  {
    [*(id *)(v1 + 56) setAutoFillSpinnerVisibility:1 textFieldMetadata:*(void *)(*(void *)(v1 + 32) + 232) frame:*(void *)(*(void *)(v1 + 32) + 216)];
  }
  else if ([*(id *)(v1 + 32) shouldOfferToAutoFillCreditCardData] {
         && [*(id *)(v1 + 32) _canAutoFillCreditCardData])
  }
  {
    v43 = [*(id *)(*(void *)(v1 + 32) + 232) value];
    uint64_t v44 = objc_msgSend(v43, "safari_stringByTrimmingWhitespace");
    uint64_t v45 = *(void *)(*(void *)(v1 + 88) + 8);
    char v46 = *(void **)(v45 + 40);
    *(void *)(v45 + 40) = v44;

    if (![*(id *)(*(void *)(*(void *)(v1 + 88) + 8) + 40) length]
      && (objc_opt_respondsToSelector() & 1) != 0)
    {
      objc_msgSend(*(id *)(v1 + 72), "webui_setInputDashboardViewController:", *(void *)(*(void *)(v1 + 32) + 184));
    }
    v47 = *(void **)(v1 + 56);
    v48 = [*(id *)(*(void *)(v1 + 32) + 232) uniqueID];
    [v47 reportAutoFillOfferedType:3 forTextFieldWithID:v48 forFormMetadata:*(void *)(*(void *)(v1 + 32) + 224)];
  }
  else if (((*(void *)(v1 + 96) & 1) == 0 {
          || (objc_msgSend(*(id *)(v1 + 32), "_suggestUsernamesForRegistrationIfPossible:") & 1) == 0)
  }
         && (![*(id *)(v1 + 56) shouldAutofillESimInformation]
          || ([*(id *)(v1 + 32) _didGatherESimInformation] & 1) == 0))
  {
    id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(v1 + 32) + 24));
    int v50 = [WeakRetained shouldAutoFillFromAddressBook];

    if (v50) {
      [*(id *)(v1 + 32) _gatherAndShowAddressBookAutoFillSuggestionsWithCorrections];
    }
  }
}

- (BOOL)_didGatherESimInformation
{
  v18[1] = *MEMORY[0x1E4F143B8];
  unint64_t v3 = (void *)[objc_alloc(MEMORY[0x1E4F23A80]) initWithQueue:0];
  if ([(WBSFormControlMetadata *)self->_textFieldMetadata looksLikeEIDField])
  {
    id v4 = [MEMORY[0x1E4F28B50] mainBundle];
    unint64_t v5 = [v4 bundleIdentifier];
    id v17 = 0;
    unint64_t v6 = [v3 retrieveDeviceIdentifier:1 clientBundleIdentifier:v5 error:&v17];
    id v7 = v17;

    uint64_t v8 = +[_SFTextSuggestion textSuggestionWithESimDataType:0];
    _SFDeviceIsPad();
  }
  else
  {
    if (![(WBSFormControlMetadata *)self->_textFieldMetadata looksLikeIMEIField]) {
      goto LABEL_11;
    }
    uint64_t v9 = [MEMORY[0x1E4F28B50] mainBundle];
    uint64_t v10 = [v9 bundleIdentifier];
    id v16 = 0;
    unint64_t v6 = [v3 retrieveDeviceIdentifier:2 clientBundleIdentifier:v10 error:&v16];
    id v7 = v16;

    uint64_t v8 = +[_SFTextSuggestion textSuggestionWithESimDataType:1];
    _SFDeviceIsPad();
  }
  uint64_t v11 = _WBSLocalizedString();
  [v8 setHeaderText:v11];

  [v8 setDisplayText:v6];
  BOOL v12 = v7 == 0;
  if (v7)
  {
    uint64_t v13 = WBS_LOG_CHANNEL_PREFIXESim();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
      [(SFFormAutocompleteState *)v13 _didGatherESimInformation];
    }
    goto LABEL_10;
  }
  if (!v8)
  {
LABEL_11:
    BOOL v12 = 0;
    goto LABEL_12;
  }
  v18[0] = v8;
  id v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:v18 count:1];
  uint64_t v14 = [(_SFFormAutoFillInputSession *)self->_inputSession formInputSession];
  [v14 setSuggestions:v7];

LABEL_10:
LABEL_12:

  return v12;
}

- (void)_gatherAndShowAddressBookAutoFillSuggestionsWithCorrections
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_autoFillController);
  if ([WeakRetained metadataCorrectionsEnabled])
  {
    metadataCorrector = self->_metadataCorrector;
    formMetadata = self->_formMetadata;
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __86__SFFormAutocompleteState__gatherAndShowAddressBookAutoFillSuggestionsWithCorrections__block_invoke;
    v6[3] = &unk_1E5C73530;
    v6[4] = self;
    id v7 = WeakRetained;
    [(WBSFormAutoFillMetadataCorrector *)metadataCorrector enqueueCorrectionsRequestForFormMetadata:formMetadata completionHandler:v6];
  }
  else
  {
    [(SFFormAutocompleteState *)self _gatherAndShowAddressBookAutoFillSuggestions];
  }
}

uint64_t __86__SFFormAutocompleteState__gatherAndShowAddressBookAutoFillSuggestionsWithCorrections__block_invoke(uint64_t a1, int a2)
{
  if (a2)
  {
    uint64_t v3 = [*(id *)(a1 + 32) _correctedFormMetadata:*(void *)(*(void *)(a1 + 32) + 224)];
    uint64_t v4 = *(void *)(a1 + 32);
    unint64_t v5 = *(void **)(v4 + 224);
    *(void *)(v4 + 224) = v3;

    uint64_t v6 = [*(id *)(a1 + 32) _bestTextFieldMetadataForMetadata:*(void *)(*(void *)(a1 + 32) + 232)];
    uint64_t v7 = *(void *)(a1 + 32);
    uint64_t v8 = *(void **)(v7 + 232);
    *(void *)(v7 + 232) = v6;

    [*(id *)(a1 + 32) _textDidChangeInForm:*(void *)(*(void *)(a1 + 32) + 224) textField:*(void *)(*(void *)(a1 + 32) + 232)];
    id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 24));
    uint64_t v10 = *(void *)(*(void *)(a1 + 32) + 224);
    uint64_t v11 = [*(id *)(a1 + 40) webView];
    uint64_t v12 = *(void *)(*(void *)(a1 + 32) + 216);
    uint64_t v13 = [*(id *)(a1 + 40) savedAccountContext];
    [WeakRetained textDidChangeInForm:v10 inWebView:v11 frame:v12 context:v13];
  }
  uint64_t v14 = *(void **)(a1 + 32);

  return [v14 _gatherAndShowAddressBookAutoFillSuggestions];
}

- (void)autoFill
{
  [(SFFormAutocompleteState *)self _setUpMultiRoundAutoFillManagerIfNecessary];

  [(SFFormAutocompleteState *)self _performAutoFill];
}

- (void)_performAutoFill
{
  switch(self->_action)
  {
    case 2:
      self->_action = 1;
      cachedCredentialMatches = self->_cachedCredentialMatches;
      self->_cachedCredentialMatches = 0;

      formMetadata = self->_formMetadata;
      self->_formMetadata = 0;

      formValues = self->_formValues;
      self->_formValues = 0;

      cachedRelatedCredentialMatches = self->_cachedRelatedCredentialMatches;
      self->_cachedRelatedCredentialMatches = 0;

      id WeakRetained = objc_loadWeakRetained((id *)&self->_autoFillController);
      uint64_t v8 = [(WBSFormControlMetadata *)self->_textFieldMetadata uniqueID];
      frame = self->_frame;
      v11[0] = MEMORY[0x1E4F143A8];
      v11[1] = 3221225472;
      v11[2] = __43__SFFormAutocompleteState__performAutoFill__block_invoke;
      v11[3] = &unk_1E5C752B0;
      v11[4] = self;
      [WeakRetained fetchMetadataForTextField:v8 inFrame:frame withCompletion:v11];

      break;
    case 4:
      uint64_t v10 = 1;
      goto LABEL_5;
    case 5:
      uint64_t v10 = 0;
LABEL_5:
      [(SFFormAutocompleteState *)self _autoFillSingleCreditCardData:v10];
      break;
    case 6:
      [(SFFormAutocompleteState *)self captureCreditCardDataWithCameraAndFill];
      break;
    case 7:
      [(SFFormAutocompleteState *)self _suggestPasswordForNewAccountOrChangePasswordForm];
      break;
    default:
      return;
  }
}

void __43__SFFormAutocompleteState__performAutoFill__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 16));
  int v8 = [WeakRetained metadataCorrectionsEnabled];

  if (v8)
  {
    uint64_t v9 = [*(id *)(a1 + 32) _correctedFormMetadata:v5];
    uint64_t v10 = *(void *)(a1 + 32);
    uint64_t v11 = *(void **)(v10 + 224);
    *(void *)(v10 + 224) = v9;
  }
  objc_storeStrong((id *)(*(void *)(a1 + 32) + 232), a3);
  uint64_t v12 = *(void **)(a1 + 32);
  if (v12[28])
  {
    uint64_t v13 = [MEMORY[0x1E4F1B980] authorizationStatusForEntityType:0];
    if ((unint64_t)(v13 - 1) < 2)
    {
      [*(id *)(a1 + 32) _presentContactsAccessSettingsAlert];
    }
    else if ((unint64_t)(v13 - 3) >= 2)
    {
      if (!v13)
      {
        id v14 = objc_alloc_init(MEMORY[0x1E4F1B980]);
        v15[0] = MEMORY[0x1E4F143A8];
        v15[1] = 3221225472;
        v15[2] = __43__SFFormAutocompleteState__performAutoFill__block_invoke_2;
        v15[3] = &unk_1E5C75288;
        v15[4] = *(void *)(a1 + 32);
        [v14 requestAccessForEntityType:0 completionHandler:v15];
      }
    }
    else
    {
      [*(id *)(a1 + 32) _gatherFormValues];
    }
  }
  else
  {
    [v12 updateAutoFillButton];
  }
}

void __43__SFFormAutocompleteState__performAutoFill__block_invoke_2(uint64_t a1, char a2)
{
  v2[0] = MEMORY[0x1E4F143A8];
  v2[1] = 3221225472;
  v2[2] = __43__SFFormAutocompleteState__performAutoFill__block_invoke_3;
  v2[3] = &unk_1E5C72988;
  char v3 = a2;
  v2[4] = *(void *)(a1 + 32);
  dispatch_async(MEMORY[0x1E4F14428], v2);
}

uint64_t __43__SFFormAutocompleteState__performAutoFill__block_invoke_3(uint64_t a1)
{
  if (*(unsigned char *)(a1 + 40)) {
    return [*(id *)(a1 + 32) _gatherFormValues];
  }
  *(void *)(*(void *)(a1 + 32) + 8) = 2;
  return [*(id *)(a1 + 32) updateAutoFillButton];
}

- (void)_gatherFormValues
{
  v2[0] = MEMORY[0x1E4F143A8];
  v2[1] = 3221225472;
  v2[2] = __44__SFFormAutocompleteState__gatherFormValues__block_invoke;
  v2[3] = &unk_1E5C72678;
  v2[4] = self;
  [(SFFormAutocompleteState *)self _gatherFormValuesWithCompletionHandler:v2];
}

void *__44__SFFormAutocompleteState__gatherFormValues__block_invoke(uint64_t a1)
{
  uint64_t v2 = [MEMORY[0x1E4F1B980] authorizationStatusForEntityType:0];
  result = *(void **)(a1 + 32);
  if (v2 == 2)
  {
LABEL_4:
    return (void *)[result updateAutoFillButton];
  }
  uint64_t v4 = result[1];
  if (v4 != 2)
  {
    if (v4 != 1) {
      return result;
    }
    goto LABEL_4;
  }

  return (void *)[result _offerToAutoFillContact];
}

- (void)_presentContactsAccessSettingsAlert
{
  _WBSLocalizedString();
  id v13 = (id)objc_claimAutoreleasedReturnValue();
  char v3 = _WBSLocalizedString();
  uint64_t v4 = [MEMORY[0x1E4FB1418] alertControllerWithTitle:v13 message:v3 preferredStyle:1];
  id v5 = [v4 view];
  [v5 setAccessibilityIdentifier:@"ContactsAccessPrompt"];

  id v6 = (void *)MEMORY[0x1E4FB1410];
  uint64_t v7 = _WBSLocalizedString();
  int v8 = [v6 actionWithTitle:v7 style:0 handler:&__block_literal_global_27];

  [v8 setAccessibilityIdentifier:@"OpenSettingsButton"];
  uint64_t v9 = (void *)MEMORY[0x1E4FB1410];
  uint64_t v10 = _WBSLocalizedString();
  uint64_t v11 = [v9 actionWithTitle:v10 style:0 handler:0];

  [v11 setAccessibilityIdentifier:@"CancelButton"];
  [v4 addAction:v11];
  [v4 addAction:v8];
  self->_action = 2;
  uint64_t v12 = [(SFFormAutocompleteState *)self _viewControllerToPresentFrom];
  [v12 presentViewController:v4 animated:1 completion:0];
}

void __62__SFFormAutocompleteState__presentContactsAccessSettingsAlert__block_invoke()
{
  [MEMORY[0x1E4F1CB10] URLWithString:@"prefs:root=Privacy&path=CONTACTS"];
  id v1 = (id)objc_claimAutoreleasedReturnValue();
  v0 = [MEMORY[0x1E4F223E0] defaultWorkspace];
  [v0 openSensitiveURL:v1 withOptions:MEMORY[0x1E4F1CC08]];
}

- (void)_setUpMultiRoundAutoFillManagerIfNecessary
{
  if (self->_action == 2)
  {
    char v3 = (WBSMultiRoundAutoFillManager *)objc_alloc_init(MEMORY[0x1E4F98C28]);
    multiRoundAutoFillManager = self->_multiRoundAutoFillManager;
    self->_multiRoundAutoFillManager = v3;
  }
  else
  {
    multiRoundAutoFillManager = self->_multiRoundAutoFillManager;
    self->_multiRoundAutoFillManager = 0;
  }
}

- (int64_t)action
{
  int64_t action = self->_action;
  if (!action)
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_dataController);
    if ([(SFFormAutocompleteState *)self _shouldOfferCreditCardDataAfterUserHasFilledCreditCardData:self->_textFieldMetadata])
    {
      if ([WeakRetained isControlASelectElement:self->_textFieldMetadata]) {
        int64_t action = 5;
      }
      else {
        int64_t action = 4;
      }
LABEL_6:
      self->_int64_t action = action;
LABEL_22:

      return action;
    }
    if ([(SFFormAutocompleteState *)self shouldOfferToAutoFillCreditCardData])
    {
      self->_int64_t action = 1;
      if (![(SFFormAutocompleteState *)self _canAutoFillCreditCardData])
      {
        if (+[_SFCreditCardCaptureViewController canCapture])
        {
          int64_t action = 6;
        }
        else
        {
          int64_t action = 1;
        }
        goto LABEL_6;
      }
      [(SFFormAutocompleteState *)self _updateCreditCardAutoFillAction];
    }
    else
    {
      if ([(SFFormAutocompleteState *)self _shouldUsePasswordGenerationAssistanceForTextField])
      {
        id v5 = [(SFFormAutoFillFrameHandle *)self->_frame webui_URL];
        id v6 = objc_loadWeakRetained((id *)&self->_autoFillController);
        uint64_t v7 = [v6 webView];
        int v8 = [WeakRetained shouldAutoGeneratePasswordsForURL:v5 inWebView:v7];

        if (v8)
        {
          int64_t action = [(SFFormAutocompleteState *)self _passwordGenerationAssistanceAction];
          self->_int64_t action = action;
          goto LABEL_22;
        }
      }
      self->_int64_t action = 1;
      formValues = self->_formValues;
      if ((!formValues
         || [(NSDictionary *)formValues count]
         || [(NSArray *)self->_cachedCredentialMatches count]
         || [(NSArray *)self->_cachedRelatedCredentialMatches count]
         || [(SFFormAutocompleteState *)self _textFieldIsEmptyPasswordField])
        && !self->_gatheringFormValues
        && self->_formMetadata)
      {
        v11[0] = MEMORY[0x1E4F143A8];
        v11[1] = 3221225472;
        v11[2] = __33__SFFormAutocompleteState_action__block_invoke;
        v11[3] = &unk_1E5C72678;
        v11[4] = self;
        [(SFFormAutocompleteState *)self _gatherFormValuesWithCompletionHandler:v11];
      }
    }
    int64_t action = self->_action;
    goto LABEL_22;
  }
  return action;
}

uint64_t __33__SFFormAutocompleteState_action__block_invoke(uint64_t result, int a2)
{
  if (a2) {
    return [*(id *)(result + 32) updateAutoFillButton];
  }
  return result;
}

- (int64_t)_actionForLoginForm
{
  char v3 = [(SFFormAutoFillFrameHandle *)self->_frame webui_URL];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_dataController);
  char v5 = [WeakRetained shouldAllowPasswordAutoFillOnURL:v3 allowExternalCredentials:0];

  if (v5)
  {
    int64_t v6 = 8;
  }
  else if ([(SFFormAutocompleteState *)self _shouldAllowExternalPasswordAutoFillOnURL:v3])
  {
    int64_t v6 = 8;
  }
  else
  {
    int64_t v6 = 1;
  }

  return v6;
}

- (void)_textDidChangeInForm:(id)a3 textField:(id)a4
{
  id v12 = a3;
  id v7 = a4;
  if (!self->_hasNotedThatTextDidChangeInPasswordField)
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_dataController);
    int v9 = [WeakRetained isPasswordFieldForUserCredentialsWithMetadata:self->_textFieldMetadata formMetadata:self->_formMetadata];

    if (v9) {
      self->_hasNotedThatTextDidChangeInPasswordField = 1;
    }
  }
  if (!self->_gatheringFormValues)
  {
    objc_storeStrong((id *)&self->_textFieldMetadata, a4);
    objc_storeStrong((id *)&self->_formMetadata, a3);
    if (self->_formType == 3)
    {
      int64_t action = self->_action;
      int64_t v11 = [(SFFormAutocompleteState *)self _actionForLoginForm];
      self->_int64_t action = v11;
      if (v11 != action) {
        [(SFFormAutocompleteState *)self updateAutoFillButton];
      }
    }
  }
}

- (void)updateCachedFormMetadataAfterFilling:(id)a3
{
}

- (void)updateAutoFillButton
{
  int64_t action = self->_action;
  if ((unint64_t)(action - 4) < 2 || action == 7 || action == 2)
  {
    _WBSLocalizedString();
    id v5 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v5 = 0;
  }
  uint64_t v4 = [(_SFFormAutoFillInputSession *)self->_inputSession formInputSession];
  [v4 setAccessoryViewCustomButtonTitle:v5];
}

- (BOOL)_textFieldIsEmptyPasswordField
{
  if (![(WBSFormControlMetadata *)self->_textFieldMetadata isSecureTextField]) {
    return 0;
  }
  char v3 = [(WBSFormControlMetadata *)self->_textFieldMetadata value];
  BOOL v4 = [v3 length] == 0;

  return v4;
}

- (BOOL)_suggestUsernamesForRegistrationIfPossible:(unint64_t)a3
{
  objc_initWeak(&location, self);
  id v5 = [MEMORY[0x1E4F98208] sharedFeatureManager];
  char v6 = [v5 shouldAutoFillPasswordsFromKeychain];

  if ((v6 & 1) != 0
    && [(WBSFormMetadata *)self->_formMetadata type] == 4
    && ([(WBSFormControlMetadata *)self->_textFieldMetadata addressBookLabel],
        id v7 = objc_claimAutoreleasedReturnValue(),
        unsigned int v8 = [v7 isEqualToString:@"email"],
        v7,
        ((v8 | [(WBSFormControlMetadata *)self->_textFieldMetadata isLabeledUsernameField]) & 1) != 0))
  {
    if (_SFDeviceIsPad()) {
      uint64_t v9 = 2;
    }
    else {
      uint64_t v9 = 1;
    }
    uint64_t v10 = [MEMORY[0x1E4F98260] sharedProvider];
    int64_t v11 = [(WBSFormControlMetadata *)self->_textFieldMetadata value];
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = __70__SFFormAutocompleteState__suggestUsernamesForRegistrationIfPossible___block_invoke;
    v14[3] = &unk_1E5C75320;
    objc_copyWeak(v15, &location);
    v15[1] = (id)v9;
    v15[2] = (id)a3;
    [v10 suggestedUsersOfType:v8 matchingText:v11 completionHandler:v14];

    objc_destroyWeak(v15);
    BOOL v12 = 1;
  }
  else
  {
    BOOL v12 = 0;
  }
  objc_destroyWeak(&location);
  return v12;
}

void __70__SFFormAutocompleteState__suggestUsernamesForRegistrationIfPossible___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __70__SFFormAutocompleteState__suggestUsernamesForRegistrationIfPossible___block_invoke_2;
  v5[3] = &unk_1E5C752F8;
  objc_copyWeak(&v7, (id *)(a1 + 32));
  id v6 = v3;
  long long v8 = *(_OWORD *)(a1 + 40);
  id v4 = v3;
  dispatch_async(MEMORY[0x1E4F14428], v5);

  objc_destroyWeak(&v7);
}

void __70__SFFormAutocompleteState__suggestUsernamesForRegistrationIfPossible___block_invoke_2(uint64_t a1)
{
  uint64_t v40 = *MEMORY[0x1E4F143B8];
  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 40));
  id v3 = WeakRetained;
  if (!WeakRetained) {
    goto LABEL_24;
  }
  id v4 = [WeakRetained[8] formInputSession];
  id v29 = [MEMORY[0x1E4F1CA48] array];
  long long v34 = 0u;
  long long v35 = 0u;
  long long v36 = 0u;
  long long v37 = 0u;
  id v5 = *(id *)(a1 + 32);
  uint64_t v6 = [v5 countByEnumeratingWithState:&v34 objects:v39 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    id v26 = v4;
    id v27 = v3;
    uint64_t v8 = 0;
    char v9 = 0;
    uint64_t v10 = *(void *)v35;
LABEL_4:
    uint64_t v11 = 0;
    uint64_t v28 = v8 + v7;
    while (1)
    {
      if (*(void *)v35 != v10) {
        objc_enumerationMutation(v5);
      }
      if (v8 + v11 == *(void *)(a1 + 48)) {
        break;
      }
      BOOL v12 = *(void **)(*((void *)&v34 + 1) + 8 * v11);
      id v13 = [v12 value];
      id v14 = +[_SFTextSuggestion textSuggestionWithUsername:v13];

      uint64_t v15 = [v12 value];
      [v14 setDisplayText:v15];

      [v29 addObject:v14];
      v9 |= [v12 type] == 2;

      if (v7 == ++v11)
      {
        uint64_t v7 = [v5 countByEnumeratingWithState:&v34 objects:v39 count:16];
        uint64_t v8 = v28;
        if (v7) {
          goto LABEL_4;
        }
        break;
      }
    }

    id v4 = v26;
    id v3 = v27;
    if ((v9 & 1) == 0) {
      goto LABEL_20;
    }
    long long v32 = 0u;
    long long v33 = 0u;
    long long v30 = 0u;
    long long v31 = 0u;
    id v5 = v29;
    uint64_t v16 = [v5 countByEnumeratingWithState:&v30 objects:v38 count:16];
    if (v16)
    {
      uint64_t v17 = v16;
      uint64_t v18 = *(void *)v31;
      do
      {
        for (uint64_t i = 0; i != v17; ++i)
        {
          if (*(void *)v31 != v18) {
            objc_enumerationMutation(v5);
          }
          unint64_t v20 = *(void **)(*((void *)&v30 + 1) + 8 * i);
          uint64_t v21 = _WBSLocalizedString();
          [v20 setHeaderText:v21];
        }
        uint64_t v17 = [v5 countByEnumeratingWithState:&v30 objects:v38 count:16];
      }
      while (v17);
      id v4 = v26;
      id v3 = v27;
    }
  }

LABEL_20:
  v22 = objc_msgSend(v3, "_addHideMyEmailSuggestionsIfNecessary:hideMyEmailRecord:", v29, v3[22], v26, v27);
  id v23 = (void *)[v22 mutableCopy];

  [v3 _addPasswordsAutoFillSuggestionToSuggestions:v23 forPurpose:0];
  if ([v23 count])
  {
    id v24 = objc_loadWeakRetained(v3 + 2);
    v25 = [v3[29] uniqueID];
    [v24 reportAutoFillOfferedType:1 forTextFieldWithID:v25 forFormMetadata:v3[28]];

    [v4 setSuggestions:v23];
  }
  else
  {
    [v3 _updateSuggestions:*(void *)(a1 + 56) & 0xFFFFFFFFFFFFFFFELL];
  }

LABEL_24:
}

- (void)_autoFillFormWithUsername:(id)a3
{
  v15[1] = *MEMORY[0x1E4F143B8];
  textFieldMetadata = self->_textFieldMetadata;
  id v5 = a3;
  uint64_t v6 = [(WBSFormControlMetadata *)textFieldMetadata uniqueID];
  uint64_t v7 = (void *)MEMORY[0x1E4F98B50];
  v15[0] = v6;
  uint64_t v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:v15 count:1];
  char v9 = [v7 nextFieldAfterControls:v8 inForm:self->_formMetadata];

  id WeakRetained = objc_loadWeakRetained((id *)&self->_autoFillController);
  frame = self->_frame;
  id v13 = v6;
  id v14 = v5;
  BOOL v12 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v14 forKeys:&v13 count:1];
  [WeakRetained autoFillFormInFrame:frame withValues:v12 setAutoFilled:1 focusFieldAfterFilling:v9 != 0 fieldToFocus:v9 submitForm:0];
}

- (void)_setShowingKeyboardInputView:(BOOL)a3
{
  BOOL v3 = a3;
  if (!self->_emptyInputView && !a3)
  {
    id v5 = (UIView *)objc_alloc_init(MEMORY[0x1E4FB1EB0]);
    emptyInputView = self->_emptyInputView;
    self->_emptyInputView = v5;
  }
  uint64_t v7 = [(_SFFormAutoFillInputSession *)self->_inputSession formInputSession];
  if (v3) {
    uint64_t v8 = 0;
  }
  else {
    uint64_t v8 = self->_emptyInputView;
  }
  id v9 = v7;
  [v7 setCustomInputView:v8];
  [v9 setAccessoryViewShouldNotShow:!v3];
}

- (void)textDidChangeInFrame:(id)a3 form:(id)a4 textField:(id)a5
{
  id v22 = a4;
  id v8 = a5;
  if ([a3 isEqual:self->_frame])
  {
    id v9 = [v8 uniqueID];
    uint64_t v10 = [(WBSFormControlMetadata *)self->_textFieldMetadata uniqueID];
    int v11 = [v9 isEqualToString:v10];

    if (v11)
    {
      objc_storeStrong((id *)&self->_textFieldMetadata, a5);
      id WeakRetained = objc_loadWeakRetained((id *)&self->_autoFillController);
      if ([WeakRetained metadataCorrectionsEnabled])
      {
        id v13 = [(SFFormAutocompleteState *)self _correctedFormMetadata:v22];
        formMetadata = self->_formMetadata;
        self->_formMetadata = v13;
      }
      [(SFFormAutocompleteState *)self _textDidChangeInForm:self->_formMetadata textField:self->_textFieldMetadata];
      if ([v8 isSecureTextField]
        && [v8 isAutoFilledTextField])
      {
        id v15 = objc_loadWeakRetained((id *)&self->_dataController);
        uint64_t v16 = [WeakRetained webView];
        frame = self->_frame;
        uint64_t v18 = [WeakRetained savedAccountContext];
        [v15 textDidChangeInForm:v22 inWebView:v16 frame:frame context:v18];
      }
      if (([v8 isSecureTextField] & 1) == 0)
      {
        v19 = [v8 value];
        unint64_t v20 = v19;
        if (v19 == self->_prefixForSuggestions || -[NSString isEqualToString:](v19, "isEqualToString:"))
        {
        }
        else
        {
          prefixForSuggestions = self->_prefixForSuggestions;
          self->_prefixForSuggestions = v20;

          [(SFFormAutocompleteState *)self updateSuggestions];
        }
      }
    }
  }
}

- (void)_gatherFormValuesWithCompletionHandler:(id)a3
{
  id v4 = a3;
  self->_gatheringFormValues = 1;
  uint64_t v14 = 0;
  id v15 = &v14;
  uint64_t v16 = 0x2020000000;
  char v17 = 1;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_dataController);
  formMetadata = self->_formMetadata;
  textFieldMetadata = self->_textFieldMetadata;
  multiRoundAutoFillManager = self->_multiRoundAutoFillManager;
  frame = self->_frame;
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __66__SFFormAutocompleteState__gatherFormValuesWithCompletionHandler___block_invoke;
  v11[3] = &unk_1E5C75348;
  v11[4] = self;
  id v10 = v4;
  id v12 = v10;
  id v13 = &v14;
  [WeakRetained gatherValuesForForm:formMetadata focusedTextFieldMetadata:textFieldMetadata inFrame:frame multiRoundAutoFillManager:multiRoundAutoFillManager completionHandler:v11];

  *((unsigned char *)v15 + 24) = 0;
  _Block_object_dispose(&v14, 8);
}

void __66__SFFormAutocompleteState__gatherFormValuesWithCompletionHandler___block_invoke(void *a1, void *a2, char a3)
{
  id v5 = a2;
  *(unsigned char *)(a1[4] + 56) = 0;
  id v18 = v5;
  if (v5) {
    id v6 = (id)[v5 copy];
  }
  else {
    id v6 = objc_alloc_init(MEMORY[0x1E4F1C9E8]);
  }
  uint64_t v7 = v6;
  objc_storeStrong((id *)(a1[4] + 48), v6);

  id v8 = (void *)a1[4];
  if (v8[5])
  {
    unsigned __int8 v9 = [v8 _shouldAllowGeneratedPassword];
    uint64_t v10 = a1[4];
    uint64_t v11 = *(void *)(v10 + 40);
    if (v11 == 3)
    {
      uint64_t v12 = [(id)v10 _actionForLoginForm];
    }
    else
    {
      BOOL v13 = (v9 & (v11 == 4)) == 0;
      uint64_t v12 = 7;
      if (v13) {
        uint64_t v12 = 8;
      }
      if (v9) {
        goto LABEL_16;
      }
      uint64_t v14 = [*(id *)(v10 + 48) count];
      uint64_t v10 = a1[4];
      uint64_t v12 = 2;
      if (v14 || (a3 & 1) != 0) {
        goto LABEL_16;
      }
      if ([*(id *)(v10 + 232) isSecureTextField]
        && (id WeakRetained = objc_loadWeakRetained((id *)(a1[4] + 24)),
            objc_msgSend(*(id *)(a1[4] + 216), "webui_URL"),
            uint64_t v16 = objc_claimAutoreleasedReturnValue(),
            char v17 = [WeakRetained shouldAllowPasswordAutoFillOnURL:v16 allowExternalCredentials:1],
            v16,
            WeakRetained,
            (v17 & 1) != 0))
      {
        uint64_t v12 = 8;
      }
      else
      {
        uint64_t v12 = 1;
      }
    }
    uint64_t v10 = a1[4];
LABEL_16:
    *(void *)(v10 + 8) = v12;
    (*(void (**)(void, BOOL))(a1[5] + 16))(a1[5], *(unsigned char *)(*(void *)(a1[6] + 8) + 24) == 0);
  }
}

- (void)autoFillTextSuggestion:(id)a3
{
  id v15 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_autoFillController);
  switch([v15 textSuggestionType])
  {
    case 0:
      id v5 = [v15 oneTimeCode];
      [(SFFormAutocompleteState *)self _fillOneTimeCodeAfterAuthenticationIfNeeded:v5 inFrame:self->_frame shouldSubmit:[(WBSFormControlMetadata *)self->_textFieldMetadata oneTimeCodeIsEligibleForAutomaticLogin]];
      goto LABEL_18;
    case 1:
      if ([MEMORY[0x1E4F98AF8] isPasswordsAppInstalled])
      {
        uint64_t v8 = [(WBSFormMetadata *)self->_formMetadata uniqueID];
        frame = self->_frame;
        uint64_t v10 = [v15 generatedPassword];
        [WeakRetained autoFillForm:v8 inFrame:frame withGeneratedPassword:v10];

        [WeakRetained setShouldSuggestToCustomizeStrongPassword:1];
        uint64_t v11 = [MEMORY[0x1E4F98948] sharedLogger];
        [v11 didSelectNewStrongPassword];

        [(SFFormAutocompleteState *)self updateSuggestions];
      }
      else
      {
        inputSession = self->_inputSession;
        id v5 = [v15 generatedPassword];
        [WeakRetained beginAutomaticPasswordInteractionWithInputSession:inputSession generatedPassword:v5];
LABEL_18:
      }
LABEL_19:

      return;
    case 2:
      [(SFFormAutocompleteState *)self presentCustomizeStrongPasswordAlert];
      goto LABEL_19;
    case 3:
      id v5 = [v15 username];
      [(SFFormAutocompleteState *)self _autoFillFormWithUsername:v5];
      goto LABEL_18;
    case 4:
      id v5 = [v15 savedAccountMatch];
      -[SFFormAutocompleteState _fillSavedAccountMatchAfterAuthenticationIfNeeded:setAsDefaultCredential:submitForm:](self, "_fillSavedAccountMatchAfterAuthenticationIfNeeded:setAsDefaultCredential:submitForm:", v5, 1, [v15 submitForm]);
      goto LABEL_18;
    case 5:
      id v5 = [v15 singleDisplayData];
      [(SFFormAutocompleteState *)self _autoFillDisplayData:v5 setAutoFilled:1];
      goto LABEL_18;
    case 6:
      id v5 = [v15 credentialIdentity];
      -[SFFormAutocompleteState _fillCredentialIdentity:submitForm:](self, "_fillCredentialIdentity:submitForm:", v5, [v15 submitForm]);
      goto LABEL_18;
    case 7:
      id v6 = [v15 creditCardData];
      [(SFFormAutocompleteState *)self _fillCreditCardDataAfterAuthenticationIfNeeded:v6];

      uint64_t v7 = [WeakRetained webView];
      if (objc_opt_respondsToSelector()) {
        objc_msgSend(v7, "webui_setInputDashboardViewController:", 0);
      }

      goto LABEL_19;
    case 8:
      id v5 = [v15 singleCreditCardData];
      uint64_t v12 = [v5 value];
      BOOL v13 = [v15 singleCreditCardData];
      -[SFFormAutocompleteState _fillSingleCreditCardDataValue:creditCardDataType:](self, "_fillSingleCreditCardDataValue:creditCardDataType:", v12, [v13 type]);

      goto LABEL_18;
    case 9:
      id v5 = [v15 emailRecord];
      [(SFFormAutocompleteState *)self _autoFillHideMyEmailRecord:v5];
      goto LABEL_18;
    case 10:
      [(SFFormAutocompleteState *)self _provisionHideMyEmailRecord];
      goto LABEL_19;
    case 11:
      -[SFFormAutocompleteState _autofillESimData:](self, "_autofillESimData:", [v15 eSimDataType]);
      goto LABEL_19;
    default:
      goto LABEL_19;
  }
}

- (void)_autofillESimData:(int64_t)a3
{
  BOOL v5 = a3 == 1;
  id v6 = (void *)[objc_alloc(MEMORY[0x1E4F23A80]) initWithQueue:0];
  uint64_t v7 = v6;
  if (a3) {
    uint64_t v8 = 2 * v5;
  }
  else {
    uint64_t v8 = 1;
  }
  id v29 = 0;
  unsigned __int8 v9 = [v6 retrieveDeviceIdentifier:v8 error:&v29];
  id v10 = v29;
  if (v10)
  {
    uint64_t v11 = WBS_LOG_CHANNEL_PREFIXESim();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      -[SFFormAutocompleteState _autofillESimData:](v11, v10);
    }
  }
  else
  {
    uint64_t v12 = [MEMORY[0x1E4F1CA60] dictionary];
    BOOL v13 = [(WBSFormMetadata *)self->_formMetadata controls];
    uint64_t v14 = [v13 count];
    if (v14)
    {
      unint64_t v15 = v14;
      id v26 = self;
      id v27 = 0;
      uint64_t v28 = v7;
      uint64_t v16 = 0;
      uint64_t v17 = 0x7FFFFFFFFFFFFFFFLL;
      do
      {
        id v18 = objc_msgSend(v13, "objectAtIndexedSubscript:", v16, v26, v27, v28);
        char v19 = [v18 looksLikeEIDField];
        if (!a3 && (v19 & 1) != 0 || (int v20 = [v18 looksLikeIMEIField], a3 == 1) && v20)
        {
          uint64_t v21 = [v18 uniqueID];
          [v12 setObject:v9 forKeyedSubscript:v21];

          if (v16 + 1 < v15) {
            uint64_t v22 = v16 + 1;
          }
          else {
            uint64_t v22 = 0x7FFFFFFFFFFFFFFFLL;
          }
          if (v17 == 0x7FFFFFFFFFFFFFFFLL) {
            uint64_t v17 = v22;
          }
        }

        ++v16;
      }
      while (v15 != v16);
      if (v17 == 0x7FFFFFFFFFFFFFFFLL)
      {
        id v23 = 0;
      }
      else
      {
        id v24 = [v13 objectAtIndexedSubscript:v17];
        id v23 = [v24 uniqueID];
      }
      id v10 = v27;
      uint64_t v7 = v28;
      self = v26;
    }
    else
    {
      id v23 = 0;
    }
    id WeakRetained = objc_loadWeakRetained((id *)&self->_autoFillController);
    [WeakRetained autoFillFormInFrame:self->_frame withValues:v12 setAutoFilled:1 focusFieldAfterFilling:v23 != 0 fieldToFocus:v23 submitForm:0];
  }
}

- (id)_viewControllerToPresentFrom
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_autoFillController);
  BOOL v3 = [WeakRetained webView];

  if (v3)
  {
    do
    {
      id v4 = v3;
      BOOL v5 = [MEMORY[0x1E4FB1EC0] viewControllerForView:v3];
      BOOL v3 = [v3 superview];
    }
    while (v3 && !v5);
  }
  else
  {
    BOOL v5 = 0;
  }

  return v5;
}

- (void)_presentViewController:(id)a3 presentingViewController:(id)a4 animated:(BOOL)a5 completion:(id)a6
{
  BOOL v7 = a5;
  id v11 = a3;
  id v9 = a4;
  id v10 = a6;
  if ([v9 modalPresentationStyle] == 7) {
    [v9 dismissViewControllerAnimated:0 completion:0];
  }
  [v9 presentViewController:v11 animated:v7 completion:v10];
}

- (BOOL)_shouldShowPasswordOptions
{
  BOOL v3 = [(SFFormAutoFillFrameHandle *)self->_frame webui_URL];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_dataController);
  char v5 = [WeakRetained shouldAllowPasswordAutoFillOnURL:v3 allowExternalCredentials:0];

  if ((v5 & 1) != 0
    || [(SFFormAutocompleteState *)self _shouldAllowExternalPasswordAutoFillOnURL:v3])
  {
    int64_t v6 = [(SFFormAutocompleteState *)self action];
    uint64_t v7 = [(WBSFormMetadata *)self->_formMetadata type];
    if (v6 == 8)
    {
      BOOL v8 = 1;
    }
    else
    {
      unint64_t v9 = v7 - 3;
      char v10 = [(WBSFormControlMetadata *)self->_textFieldMetadata isSecureTextField];
      if (v9 < 3) {
        BOOL v8 = v10;
      }
      else {
        BOOL v8 = 0;
      }
    }
  }
  else
  {
    BOOL v8 = 0;
  }

  return v8;
}

- (void)_offerToForgetSavedAccount:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_autoFillController);
  unint64_t v9 = [WeakRetained webView];
  char v10 = objc_msgSend(v9, "webui_presentingViewController");

  id v11 = [v6 user];
  uint64_t v12 = [v11 length];

  [MEMORY[0x1E4FB6EF0] keychainSyncEnabled];
  BOOL v13 = NSString;
  _WBSLocalizedString();
  if (v12) {
    uint64_t v14 = {;
  }
    unint64_t v15 = [v6 user];
    uint64_t v16 = [v6 highLevelDomain];
    uint64_t v17 = objc_msgSend(v13, "stringWithFormat:", v14, v15, v16);
  }
  else {
    uint64_t v14 = {;
  }
    unint64_t v15 = [v6 highLevelDomain];
    uint64_t v17 = objc_msgSend(v13, "stringWithFormat:", v14, v15);
  }

  id v18 = [MEMORY[0x1E4FB1418] alertControllerWithTitle:v17 message:0 preferredStyle:_SFDeviceIsPad()];
  char v19 = (void *)MEMORY[0x1E4FB1410];
  int v20 = _WBSLocalizedString();
  v30[0] = MEMORY[0x1E4F143A8];
  v30[1] = 3221225472;
  v30[2] = __72__SFFormAutocompleteState__offerToForgetSavedAccount_completionHandler___block_invoke;
  v30[3] = &unk_1E5C75370;
  id v31 = v6;
  long long v32 = self;
  id v21 = v7;
  id v33 = v21;
  id v22 = v6;
  id v23 = [v19 actionWithTitle:v20 style:2 handler:v30];
  [v18 addAction:v23];

  id v24 = (void *)MEMORY[0x1E4FB1410];
  v25 = _WBSLocalizedString();
  v28[0] = MEMORY[0x1E4F143A8];
  v28[1] = 3221225472;
  v28[2] = __72__SFFormAutocompleteState__offerToForgetSavedAccount_completionHandler___block_invoke_2;
  v28[3] = &unk_1E5C74688;
  id v29 = v21;
  id v26 = v21;
  id v27 = [v24 actionWithTitle:v25 style:1 handler:v28];
  [v18 addAction:v27];

  [(SFFormAutocompleteState *)self _presentViewController:v18 presentingViewController:v10 animated:1 completion:0];
}

void __72__SFFormAutocompleteState__offerToForgetSavedAccount_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t v2 = [MEMORY[0x1E4F98DF8] sharedStore];
  [v2 removeCredentialTypes:1 forSavedAccount:*(void *)(a1 + 32)];

  [*(id *)(a1 + 40) _setUserAndPasswordFieldsAutoFilled:0 clearPasswordField:1];
  id v3 = objc_alloc_init(MEMORY[0x1E4FB60F8]);
  [v3 schedulePasswordIconsCleanup];
  (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
}

uint64_t __72__SFFormAutocompleteState__offerToForgetSavedAccount_completionHandler___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)_getLoginFormUser:(id *)a3 password:(id *)a4 userIsAutoFilled:(BOOL *)a5 passwordIsAutoFilled:(BOOL *)a6
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  *a5 = 0;
  *a6 = 0;
  unint64_t v9 = [(WBSFormMetadata *)self->_formMetadata userNameElementUniqueID];
  v25 = [(WBSFormMetadata *)self->_formMetadata passwordElementUniqueID];
  if ([v9 length] || objc_msgSend(v25, "length"))
  {
    long long v29 = 0u;
    long long v30 = 0u;
    long long v27 = 0u;
    long long v28 = 0u;
    id v22 = self;
    id obj = [(WBSFormMetadata *)self->_formMetadata controls];
    uint64_t v10 = [obj countByEnumeratingWithState:&v27 objects:v31 count:16];
    if (v10)
    {
      uint64_t v11 = v10;
      uint64_t v12 = *(void *)v28;
      do
      {
        for (uint64_t i = 0; i != v11; ++i)
        {
          if (*(void *)v28 != v12) {
            objc_enumerationMutation(obj);
          }
          uint64_t v14 = *(void **)(*((void *)&v27 + 1) + 8 * i);
          unint64_t v15 = [v14 uniqueID];
          uint64_t v16 = a3;
          uint64_t v17 = a5;
          if (([v15 isEqualToString:v9] & 1) != 0
            || (uint64_t v16 = a4, v17 = a6, [v15 isEqualToString:v25]))
          {
            *uint64_t v16 = [v14 value];
            *uint64_t v17 = [v14 isAutoFilledTextField];
          }
        }
        uint64_t v11 = [obj countByEnumeratingWithState:&v27 objects:v31 count:16];
      }
      while (v11);
    }

    if (!*a3)
    {
      id WeakRetained = objc_loadWeakRetained((id *)&v22->_dataController);
      char v19 = [(SFFormAutoFillFrameHandle *)v22->_frame webui_URL];
      id v20 = objc_loadWeakRetained((id *)&v22->_autoFillController);
      id v21 = [v20 savedAccountContext];
      *a3 = [WeakRetained lastUsedUsernameWithPasswordForURL:v19 inContext:v21];

      if (*a3) {
        *a5 = 1;
      }
    }
  }
}

- (void)_fetchPotentialCredentialMatchesWithCompletion:(id)a3
{
  v29[1] = *MEMORY[0x1E4F143B8];
  id v4 = (void (**)(id, void *))a3;
  char v5 = [(SFFormAutocompleteState *)self _cachedPotentialCredentialMatches];
  if (v5)
  {
    v4[2](v4, v5);
  }
  else
  {
    p_credentialMatchesCompletionHandlers = (id *)&self->_credentialMatchesCompletionHandlers;
    credentialMatchesCompletionHandlers = self->_credentialMatchesCompletionHandlers;
    BOOL v8 = (void *)MEMORY[0x1AD0C36A0](v4);
    unint64_t v9 = [(NSArray *)credentialMatchesCompletionHandlers arrayByAddingObject:v8];
    if (v9)
    {
      objc_storeStrong((id *)&self->_credentialMatchesCompletionHandlers, v9);
    }
    else
    {
      uint64_t v10 = (void *)MEMORY[0x1AD0C36A0](v4);
      v29[0] = v10;
      uint64_t v11 = [MEMORY[0x1E4F1C978] arrayWithObjects:v29 count:1];
      id v12 = *p_credentialMatchesCompletionHandlers;
      id *p_credentialMatchesCompletionHandlers = (id)v11;
    }
    if ((unint64_t)[*p_credentialMatchesCompletionHandlers count] <= 1)
    {
      BOOL v13 = self->_formMetadata;
      uint64_t v14 = [(SFFormAutoFillFrameHandle *)self->_frame webui_URL];
      id WeakRetained = objc_loadWeakRetained((id *)&self->_dataController);
      uint64_t v16 = [(_SFFormAutoFillInputSession *)self->_inputSession frameHandle];
      uint64_t v17 = [v16 webFrameIdentifier];

      id v18 = dispatch_get_global_queue(33, 0);
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __74__SFFormAutocompleteState__fetchPotentialCredentialMatchesWithCompletion___block_invoke;
      block[3] = &unk_1E5C75398;
      id v24 = WeakRetained;
      v25 = v13;
      id v26 = v14;
      id v27 = v17;
      long long v28 = self;
      id v19 = v17;
      id v20 = v14;
      id v21 = v13;
      id v22 = WeakRetained;
      dispatch_async(v18, block);
    }
  }
}

void __74__SFFormAutocompleteState__fetchPotentialCredentialMatchesWithCompletion___block_invoke(void *a1)
{
  uint64_t v2 = (void *)a1[4];
  uint64_t v3 = a1[5];
  uint64_t v4 = a1[6];
  uint64_t v5 = a1[7];
  id WeakRetained = objc_loadWeakRetained((id *)(a1[8] + 16));
  id v7 = [WeakRetained savedAccountContext];
  BOOL v8 = [v2 exactFQDNAndOtherSavedAccountMatchesForForm:v3 atURL:v4 webFrameIdentifier:v5 savedAccountContext:v7];

  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __74__SFFormAutocompleteState__fetchPotentialCredentialMatchesWithCompletion___block_invoke_2;
  v10[3] = &unk_1E5C72238;
  v10[4] = a1[8];
  id v11 = v8;
  id v9 = v8;
  dispatch_async(MEMORY[0x1E4F14428], v10);
}

void __74__SFFormAutocompleteState__fetchPotentialCredentialMatchesWithCompletion___block_invoke_2(uint64_t a1)
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = [*(id *)(a1 + 40) first];
  uint64_t v3 = *(void *)(a1 + 32);
  uint64_t v4 = *(void **)(v3 + 80);
  *(void *)(v3 + 80) = v2;

  uint64_t v5 = [*(id *)(a1 + 40) second];
  uint64_t v6 = *(void *)(a1 + 32);
  id v7 = *(void **)(v6 + 88);
  *(void *)(v6 + 88) = v5;

  id v8 = *(id *)(*(void *)(a1 + 32) + 96);
  uint64_t v9 = *(void *)(a1 + 32);
  uint64_t v10 = *(void **)(v9 + 96);
  *(void *)(v9 + 96) = 0;

  long long v20 = 0u;
  long long v21 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id v11 = v8;
  uint64_t v12 = [v11 countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v12)
  {
    uint64_t v13 = v12;
    uint64_t v14 = *(void *)v19;
    do
    {
      uint64_t v15 = 0;
      do
      {
        if (*(void *)v19 != v14) {
          objc_enumerationMutation(v11);
        }
        uint64_t v16 = *(void *)(*((void *)&v18 + 1) + 8 * v15);
        uint64_t v17 = objc_msgSend(*(id *)(a1 + 32), "_cachedPotentialCredentialMatches", (void)v18);
        (*(void (**)(uint64_t, void *))(v16 + 16))(v16, v17);

        ++v15;
      }
      while (v13 != v15);
      uint64_t v13 = [v11 countByEnumeratingWithState:&v18 objects:v22 count:16];
    }
    while (v13);
  }
}

- (id)_cachedPotentialCredentialMatches
{
  cachedCredentialMatches = self->_cachedCredentialMatches;
  cachedRelatedCredentialMatches = self->_cachedRelatedCredentialMatches;
  if (cachedCredentialMatches)
  {
    uint64_t v5 = [(NSArray *)cachedCredentialMatches arrayByAddingObjectsFromArray:cachedRelatedCredentialMatches];
  }
  else
  {
    uint64_t v5 = cachedRelatedCredentialMatches;
  }

  return v5;
}

- (void)_fillSavedAccount:(id)a3 setAutoFilled:(BOOL)a4 setAsDefaultCredential:(BOOL)a5 focusFieldAfterFilling:(BOOL)a6 submitForm:(BOOL)a7
{
  BOOL v7 = a7;
  BOOL v8 = a6;
  BOOL v9 = a5;
  BOOL v10 = a4;
  v65[1] = *MEMORY[0x1E4F143B8];
  id v12 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_dataController);
  uint64_t v14 = [v12 user];
  uint64_t v15 = [v12 password];
  unint64_t formType = self->_formType;
  BOOL v17 = formType == 5 || formType == 3;
  BOOL v54 = v10;
  BOOL v55 = v8;
  if (v17)
  {
    long long v18 = [(id)objc_opt_class() valuesFromUser:v14 password:v15 forLoginOrChangePasswordForm:self->_formMetadata];
  }
  else
  {
    BOOL v51 = v7;
    uint64_t v19 = [(WBSFormControlMetadata *)self->_textFieldMetadata uniqueID];
    long long v20 = (void *)v19;
    if (v19)
    {
      long long v21 = &stru_1EFB97EB8;
      if (v15) {
        long long v21 = v15;
      }
      uint64_t v64 = v19;
      v65[0] = v21;
      long long v18 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v65 forKeys:&v64 count:1];
    }
    else
    {
      id v22 = [(WBSFormControlMetadata *)self->_textFieldMetadata dictionaryRepresentation];
      uint64_t v23 = (void *)[v22 mutableCopy];

      [v23 removeObjectForKey:*MEMORY[0x1E4F99210]];
      id v24 = WBS_LOG_CHANNEL_PREFIXAutoFill();
      if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR)) {
        -[SFFormAutocompleteState _fillSavedAccount:setAutoFilled:setAsDefaultCredential:focusFieldAfterFilling:submitForm:]();
      }

      long long v18 = (void *)MEMORY[0x1E4F1CC08];
    }

    BOOL v7 = v51;
  }
  if (self->_performingPageLevelAutoFill && ![v18 count])
  {
    [(SFFormAutocompleteState *)self _finishPageLevelAutoFillWithResult:5];
  }
  else
  {
    uint64_t v57 = v15;
    id v25 = objc_loadWeakRetained((id *)&self->_autoFillController);
    uint64_t v26 = [WeakRetained annotationsFromUsername:v14 forLoginOrChangePasswordForm:self->_formMetadata];
    if (v26) {
      objc_msgSend(v25, "annotateForm:inFrame:withValues:", -[WBSFormMetadata uniqueID](self->_formMetadata, "uniqueID"), self->_frame, v26);
    }
    char v53 = (void *)v26;
    v56 = WeakRetained;
    unint64_t v58 = v14;
    if (v9)
    {
      BOOL v52 = v7;
      id v27 = [(SFFormAutoFillFrameHandle *)self->_frame webui_URL];
      long long v28 = objc_msgSend(MEMORY[0x1E4F18D98], "safari_HTMLFormProtectionSpaceForURL:", v27);
      long long v29 = [MEMORY[0x1E4F98DF8] sharedStore];
      long long v30 = [v12 protectionSpaces];
      id v31 = [v12 protectionSpacesForAdditionalSites];
      uint64_t v32 = [v30 arrayByAddingObjectsFromArray:v31];

      if ([v32 containsObject:v28])
      {
        id v33 = [v25 savedAccountContext];
        [v29 setSavedAccountAsDefault:v12 forProtectionSpace:v28 context:v33];
      }
      else
      {
        id v33 = [v28 host];
        long long v34 = objc_msgSend(v33, "safari_highLevelDomainForPasswordManager");
        [v12 sharedGroupID];
        int v50 = v18;
        long long v36 = v35 = v27;
        id v37 = (id)[v29 saveUser:v58 password:v57 forProtectionSpace:v28 highLevelDomain:v34 groupID:v36];

        id v27 = v35;
        long long v18 = v50;
      }
      id WeakRetained = v56;
      uint64_t v14 = v58;
      BOOL v7 = v52;
    }
    id v38 = [(SFFormAutoFillFrameHandle *)self->_frame webui_URL];
    if (v7) {
      uint64_t v39 = [WeakRetained shouldSubmitForm:self->_formMetadata withUser:v14 password:v57 onURL:v38];
    }
    else {
      uint64_t v39 = 0;
    }
    long long v61 = 0u;
    long long v62 = 0u;
    long long v59 = 0u;
    long long v60 = 0u;
    uint64_t v40 = [v18 allKeys];
    uint64_t v41 = [v40 countByEnumeratingWithState:&v59 objects:v63 count:16];
    if (v41)
    {
      uint64_t v42 = v41;
      uint64_t v43 = *(void *)v60;
      do
      {
        for (uint64_t i = 0; i != v42; ++i)
        {
          if (*(void *)v60 != v43) {
            objc_enumerationMutation(v40);
          }
          [v25 reportAutoFillOfferedType:1 forTextFieldWithID:*(void *)(*((void *)&v59 + 1) + 8 * i) forFormMetadata:self->_formMetadata];
        }
        uint64_t v42 = [v40 countByEnumeratingWithState:&v59 objects:v63 count:16];
      }
      while (v42);
    }

    [v25 autoFillFormInFrame:self->_frame withValues:v18 setAutoFilled:v54 focusFieldAfterFilling:v55 fieldToFocus:0 submitForm:v39];
    id WeakRetained = v56;
    if (v39) {
      [v56 didAutomaticallySubmitFormWhenFillingOnURL:v38 formMetadata:self->_formMetadata];
    }
    if (self->_performingPageLevelAutoFill) {
      [(SFFormAutocompleteState *)self _finishPageLevelAutoFillWithResult:0];
    }
    uint64_t v45 = +[_SFFormDataController sharedController];
    char v46 = [v12 user];
    uint64_t v47 = *MEMORY[0x1E4F99368];
    v48 = [v25 tabIDForAutoFill];
    v49 = [v25 webView];
    objc_msgSend(v45, "didFillPasswordForUsername:fromProviderWithBundleIdentifier:inTabWithID:currentURL:isPrivate:", v46, v47, v48, v38, objc_msgSend(v49, "webui_privateBrowsingEnabled"));

    uint64_t v15 = v57;
    uint64_t v14 = v58;
  }
}

- (void)_fillCredential:(id)a3 setAutoFilled:(BOOL)a4 setAsDefaultCredential:(BOOL)a5 focusFieldAfterFilling:(BOOL)a6 submitForm:(BOOL)a7
{
  BOOL v41 = a7;
  BOOL v7 = a6;
  BOOL v8 = a5;
  BOOL v9 = a4;
  v51[1] = *MEMORY[0x1E4F143B8];
  id v11 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_dataController);
  uint64_t v13 = [v11 user];
  uint64_t v14 = [v11 password];
  unint64_t formType = self->_formType;
  BOOL v16 = formType == 5 || formType == 3;
  BOOL v42 = v9;
  BOOL v43 = v7;
  if (v16)
  {
    BOOL v17 = [(id)objc_opt_class() valuesFromUser:v13 password:v14 forLoginOrChangePasswordForm:self->_formMetadata];
  }
  else
  {
    uint64_t v18 = [(WBSFormControlMetadata *)self->_textFieldMetadata uniqueID];
    uint64_t v19 = (void *)v18;
    if (v18)
    {
      long long v20 = &stru_1EFB97EB8;
      if (v14) {
        long long v20 = v14;
      }
      uint64_t v50 = v18;
      v51[0] = v20;
      BOOL v17 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v51 forKeys:&v50 count:1];
    }
    else
    {
      long long v21 = v13;
      id v22 = [(WBSFormControlMetadata *)self->_textFieldMetadata dictionaryRepresentation];
      uint64_t v23 = (void *)[v22 mutableCopy];

      [v23 removeObjectForKey:*MEMORY[0x1E4F99210]];
      id v24 = WBS_LOG_CHANNEL_PREFIXAutoFill();
      if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR)) {
        -[SFFormAutocompleteState _fillSavedAccount:setAutoFilled:setAsDefaultCredential:focusFieldAfterFilling:submitForm:]();
      }

      BOOL v17 = (void *)MEMORY[0x1E4F1CC08];
      uint64_t v13 = v21;
    }
  }
  if (self->_performingPageLevelAutoFill && ![v17 count])
  {
    [(SFFormAutocompleteState *)self _finishPageLevelAutoFillWithResult:5];
  }
  else
  {
    id v25 = objc_loadWeakRetained((id *)&self->_autoFillController);
    uint64_t v26 = [WeakRetained annotationsFromUsername:v13 forLoginOrChangePasswordForm:self->_formMetadata];
    if (v26) {
      objc_msgSend(v25, "annotateForm:inFrame:withValues:", -[WBSFormMetadata uniqueID](self->_formMetadata, "uniqueID"), self->_frame, v26);
    }
    uint64_t v44 = v14;
    if (v8)
    {
      [(SFFormAutoFillFrameHandle *)self->_frame webui_URL];
      v28 = id v27 = v13;
      long long v29 = objc_msgSend(MEMORY[0x1E4F18D98], "safari_HTMLFormProtectionSpaceForURL:", v28);
      long long v30 = [MEMORY[0x1E4F18D90] sharedCredentialStorage];
      objc_msgSend(v30, "safari_setDefaultCredential:forHTMLFormProtectionSpace:", v11, v29);

      uint64_t v13 = v27;
      uint64_t v14 = v44;
    }
    id v31 = [(SFFormAutoFillFrameHandle *)self->_frame webui_URL];
    uint64_t v39 = WeakRetained;
    id v40 = v11;
    if (v41) {
      uint64_t v32 = [WeakRetained shouldSubmitForm:self->_formMetadata withUser:v13 password:v14 onURL:v31];
    }
    else {
      uint64_t v32 = 0;
    }
    long long v47 = 0u;
    long long v48 = 0u;
    long long v45 = 0u;
    long long v46 = 0u;
    id v33 = objc_msgSend(v17, "allKeys", v13);
    uint64_t v34 = [v33 countByEnumeratingWithState:&v45 objects:v49 count:16];
    if (v34)
    {
      uint64_t v35 = v34;
      uint64_t v36 = *(void *)v46;
      do
      {
        for (uint64_t i = 0; i != v35; ++i)
        {
          if (*(void *)v46 != v36) {
            objc_enumerationMutation(v33);
          }
          [v25 reportAutoFillOfferedType:1 forTextFieldWithID:*(void *)(*((void *)&v45 + 1) + 8 * i) forFormMetadata:self->_formMetadata];
        }
        uint64_t v35 = [v33 countByEnumeratingWithState:&v45 objects:v49 count:16];
      }
      while (v35);
    }

    [v25 autoFillFormInFrame:self->_frame withValues:v17 setAutoFilled:v42 focusFieldAfterFilling:v43 fieldToFocus:0 submitForm:v32];
    id WeakRetained = v39;
    if (v32) {
      [v39 didAutomaticallySubmitFormWhenFillingOnURL:v31 formMetadata:self->_formMetadata];
    }
    id v11 = v40;
    uint64_t v13 = v38;
    if (self->_performingPageLevelAutoFill) {
      [(SFFormAutocompleteState *)self _finishPageLevelAutoFillWithResult:0];
    }

    uint64_t v14 = v44;
  }
}

+ (void)_getMatchesFromFormProtectionSpace:(id)a3 matchesFromOtherProtectionSpaces:(id)a4 withFormURL:(id)a5 credentialMatches:(id)a6 lastGeneratedPassword:(id)a7 currentUser:(id)a8 currentPassword:(id)a9 forUserNamesOnly:(BOOL)a10
{
  uint64_t v51 = *MEMORY[0x1E4F143B8];
  id v35 = a3;
  id v34 = a4;
  id v15 = a6;
  id v36 = a7;
  id v16 = a8;
  id v37 = a9;
  id v33 = objc_msgSend(MEMORY[0x1E4F18D98], "safari_HTMLFormProtectionSpaceForURL:", a5);
  id v39 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  long long v46 = 0u;
  long long v47 = 0u;
  long long v48 = 0u;
  long long v49 = 0u;
  id obj = v15;
  uint64_t v17 = [obj countByEnumeratingWithState:&v46 objects:v50 count:16];
  if (v17)
  {
    uint64_t v18 = v17;
    uint64_t v19 = 0;
    uint64_t v20 = *(void *)v47;
    do
    {
      for (uint64_t i = 0; i != v18; ++i)
      {
        if (*(void *)v47 != v20) {
          objc_enumerationMutation(obj);
        }
        id v22 = *(void **)(*((void *)&v46 + 1) + 8 * i);
        uint64_t v23 = [v22 user];
        uint64_t v24 = [v22 password];
        id v25 = (void *)v24;
        uint64_t v26 = &stru_1EFB97EB8;
        if (v24) {
          uint64_t v26 = (__CFString *)v24;
        }
        id v27 = v26;

        if (([v23 length] || (objc_msgSend(v36, "isEqualToString:", v27) & 1) == 0 && !a10)
          && (([v23 length] || objc_msgSend(v16, "length"))
           && ![v23 isEqualToString:v16]
           || ([(__CFString *)v27 isEqualToString:v37] & 1) == 0))
        {
          id v28 = [v39 objectForKeyedSubscript:v23];
          if (!v28)
          {
            id v28 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
            [v39 setObject:v28 forKeyedSubscript:v23];
          }
          id v29 = [v28 objectForKeyedSubscript:v27];
          if (!v29)
          {
            id v29 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
            [v28 setObject:v29 forKeyedSubscript:v27];
          }
          [v29 addObject:v22];
          ++v19;
        }
      }
      uint64_t v18 = [obj countByEnumeratingWithState:&v46 objects:v50 count:16];
    }
    while (v18);
  }
  else
  {
    uint64_t v19 = 0;
  }

  v40[0] = MEMORY[0x1E4F143A8];
  v40[1] = 3221225472;
  v40[2] = __192__SFFormAutocompleteState__getMatchesFromFormProtectionSpace_matchesFromOtherProtectionSpaces_withFormURL_credentialMatches_lastGeneratedPassword_currentUser_currentPassword_forUserNamesOnly___block_invoke;
  v40[3] = &unk_1E5C75430;
  BOOL v45 = a10;
  id v41 = v33;
  id v42 = v35;
  id v43 = v34;
  uint64_t v44 = v19;
  id v30 = v34;
  id v31 = v35;
  id v32 = v33;
  [v39 enumerateKeysAndObjectsUsingBlock:v40];
  [v31 sortUsingComparator:&__block_literal_global_159];
  [v30 sortUsingComparator:&__block_literal_global_161];
}

void __192__SFFormAutocompleteState__getMatchesFromFormProtectionSpace_matchesFromOtherProtectionSpaces_withFormURL_credentialMatches_lastGeneratedPassword_currentUser_currentPassword_forUserNamesOnly___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  uint64_t v6 = (objc_class *)MEMORY[0x1E4F28BD0];
  id v7 = a3;
  id v8 = objc_alloc_init(v6);
  v20[0] = MEMORY[0x1E4F143A8];
  v20[1] = 3221225472;
  v20[2] = __192__SFFormAutocompleteState__getMatchesFromFormProtectionSpace_matchesFromOtherProtectionSpaces_withFormURL_credentialMatches_lastGeneratedPassword_currentUser_currentPassword_forUserNamesOnly___block_invoke_2;
  v20[3] = &unk_1E5C753E0;
  id v9 = v8;
  id v21 = v9;
  [v7 enumerateKeysAndObjectsUsingBlock:v20];
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __192__SFFormAutocompleteState__getMatchesFromFormProtectionSpace_matchesFromOtherProtectionSpaces_withFormURL_credentialMatches_lastGeneratedPassword_currentUser_currentPassword_forUserNamesOnly___block_invoke_4;
  v12[3] = &unk_1E5C75408;
  id v13 = *(id *)(a1 + 32);
  id v14 = v9;
  char v19 = *(unsigned char *)(a1 + 64);
  uint64_t v18 = *(void *)(a1 + 56);
  id v15 = v5;
  id v16 = *(id *)(a1 + 40);
  id v17 = *(id *)(a1 + 48);
  id v10 = v5;
  id v11 = v9;
  [v7 enumerateKeysAndObjectsUsingBlock:v12];
}

void __192__SFFormAutocompleteState__getMatchesFromFormProtectionSpace_matchesFromOtherProtectionSpaces_withFormURL_credentialMatches_lastGeneratedPassword_currentUser_currentPassword_forUserNamesOnly___block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v4 = (void *)MEMORY[0x1E4F1CAD0];
  id v5 = objc_msgSend(a3, "safari_mapObjectsUsingBlock:", &__block_literal_global_135);
  id v6 = [v4 setWithArray:v5];

  [*(id *)(a1 + 32) unionSet:v6];
}

uint64_t __192__SFFormAutocompleteState__getMatchesFromFormProtectionSpace_matchesFromOtherProtectionSpaces_withFormURL_credentialMatches_lastGeneratedPassword_currentUser_currentPassword_forUserNamesOnly___block_invoke_3(uint64_t a1, void *a2)
{
  return [a2 host];
}

void __192__SFFormAutocompleteState__getMatchesFromFormProtectionSpace_matchesFromOtherProtectionSpaces_withFormURL_credentialMatches_lastGeneratedPassword_currentUser_currentPassword_forUserNamesOnly___block_invoke_4(id *a1, uint64_t a2, void *a3)
{
  uint64_t v44 = *MEMORY[0x1E4F143B8];
  long long v39 = 0u;
  long long v40 = 0u;
  long long v41 = 0u;
  long long v42 = 0u;
  id v4 = a3;
  uint64_t v5 = [v4 countByEnumeratingWithState:&v39 objects:v43 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v40;
    while (2)
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v40 != v7) {
          objc_enumerationMutation(v4);
        }
        id v9 = *(void **)(*((void *)&v39 + 1) + 8 * i);
        id v10 = [v9 protectionSpace];
        if ([v10 isEqual:a1[4]])
        {

LABEL_13:
          int v12 = 1;
          goto LABEL_14;
        }
        id v11 = [v9 autoFillPasskey];

        if (v11) {
          goto LABEL_13;
        }
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v39 objects:v43 count:16];
      int v12 = 0;
      if (v6) {
        continue;
      }
      break;
    }
  }
  else
  {
    int v12 = 0;
  }
LABEL_14:

  id v13 = [v4 firstObject];
  id v14 = v13;
  if (v12)
  {
    id v15 = a1[4];
  }
  else
  {
    id v15 = [v13 protectionSpace];
  }
  id v16 = v15;
  id v17 = [v15 host];
  if ((unint64_t)[a1[5] countForObject:v17] >= 2)
  {
    uint64_t v18 = objc_msgSend(v16, "safari_addressString");
    uint64_t v19 = objc_msgSend(v18, "safari_simplifiedUserVisibleURLString");

    id v17 = (void *)v19;
  }
  uint64_t v20 = [MEMORY[0x1E4F98230] sharedManager];
  id v21 = [v20 enabledExtensions];
  uint64_t v22 = [v21 count];

  if (v22 == 1)
  {
    uint64_t v23 = [MEMORY[0x1E4F98208] sharedFeatureManager];
    [v23 shouldAutoFillPasswordsFromKeychain];
  }
  uint64_t v24 = [v14 autoFillPasskey];

  if (v24)
  {
    uint64_t v25 = detailStringForPasskey(v14);
LABEL_31:
    id v35 = (void *)v25;
    goto LABEL_32;
  }
  if (v12)
  {
    uint64_t v26 = [v14 customTitle];
    uint64_t v27 = [v26 length];

    if (!v27)
    {
      uint64_t v25 = _WBSLocalizedString();
      goto LABEL_31;
    }
LABEL_28:
    uint64_t v25 = [v14 customTitle];
    goto LABEL_31;
  }
  if ([v4 count] == 1)
  {
    id v28 = [v14 customTitle];
    uint64_t v29 = [v28 length];

    if (v29) {
      goto LABEL_28;
    }
    id v34 = NSString;
    id v31 = _WBSLocalizedString();
    uint64_t v33 = objc_msgSend(v34, "stringWithFormat:", v31, v17);
  }
  else
  {
    id v30 = NSString;
    id v31 = _WBSLocalizedString();
    uint64_t v32 = [v4 count];
    uint64_t v33 = objc_msgSend(v30, "localizedStringWithFormat:", v31, v17, v32, (void)v39);
  }
  id v35 = (void *)v33;

LABEL_32:
  if ([a1[6] length])
  {
    id v36 = 0;
  }
  else
  {
    id v36 = objc_msgSend(v16, "safari_creationDateOfCredentialWithUser:", &stru_1EFB97EB8);
  }
  id v37 = [[SFCredentialDisplayData alloc] initWithMatch:v14 detail:v35 creationDate:v36];
  uint64_t v38 = 8;
  if (v12) {
    uint64_t v38 = 7;
  }
  [a1[v38] addObject:v37];
}

uint64_t __192__SFFormAutocompleteState__getMatchesFromFormProtectionSpace_matchesFromOtherProtectionSpaces_withFormURL_credentialMatches_lastGeneratedPassword_currentUser_currentPassword_forUserNamesOnly___block_invoke_5(uint64_t a1, void *a2, void *a3)
{
  id v4 = a3;
  uint64_t v5 = [a2 match];
  uint64_t v6 = [v4 match];

  uint64_t v7 = [v5 compare:v6];
  return v7;
}

uint64_t __192__SFFormAutocompleteState__getMatchesFromFormProtectionSpace_matchesFromOtherProtectionSpaces_withFormURL_credentialMatches_lastGeneratedPassword_currentUser_currentPassword_forUserNamesOnly___block_invoke_6(uint64_t a1, void *a2, void *a3)
{
  id v4 = a3;
  uint64_t v5 = [a2 match];
  uint64_t v6 = [v4 match];

  uint64_t v7 = [v5 compare:v6];
  return v7;
}

- (void)_offerToAutoFillFromPotentialCredentialMatches
{
  uint64_t v81 = *MEMORY[0x1E4F143B8];
  __int16 v79 = 0;
  id v78 = 0;
  id v77 = 0;
  [(SFFormAutocompleteState *)self _getLoginFormUser:&v78 password:&v77 userIsAutoFilled:(char *)&v79 + 1 passwordIsAutoFilled:&v79];
  id v40 = v78;
  id v42 = v77;
  uint64_t v71 = 0;
  v72 = &v71;
  uint64_t v73 = 0x3032000000;
  v74 = __Block_byref_object_copy__162;
  v75 = __Block_byref_object_dispose__163;
  id v76 = 0;
  id v43 = [(SFFormAutocompleteState *)self _cachedPotentialCredentialMatches];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_autoFillController);
  long long v48 = [WeakRetained webView];

  long long v41 = objc_msgSend(v48, "webui_lastGeneratedPasswordForCurrentBackForwardItem");
  uint64_t v44 = objc_msgSend(v48, "webui_presentingViewController");
  long long v49 = [(SFFormAutoFillFrameHandle *)self->_frame webui_URL];
  long long v46 = [MEMORY[0x1E4F1CA48] array];
  BOOL v45 = [MEMORY[0x1E4F1CA48] array];
  uint64_t v3 = [(WBSFormMetadata *)self->_formMetadata passwordElementUniqueID];
  uint64_t v4 = [v3 length];

  uint64_t v5 = [MEMORY[0x1E4F98208] sharedFeatureManager];
  LODWORD(v3) = [v5 shouldAutoFillPasswordsFromKeychain];

  if (v3)
  {
    LOBYTE(v36) = v4 == 0;
    +[SFFormAutocompleteState _getMatchesFromFormProtectionSpace:v46 matchesFromOtherProtectionSpaces:v45 withFormURL:v49 credentialMatches:v43 lastGeneratedPassword:v41 currentUser:v40 currentPassword:v42 forUserNamesOnly:v36];
  }
  uint64_t v6 = [MEMORY[0x1E4F98230] sharedManager];
  uint64_t v50 = [v6 enabledExtensions];

  uint64_t v7 = [(SFFormAutocompleteState *)self externalCredentialIdentities];
  unsigned int IsPad = _SFDeviceIsPad();
  v70[0] = MEMORY[0x1E4F143A8];
  v70[1] = 3221225472;
  v70[2] = __73__SFFormAutocompleteState__offerToAutoFillFromPotentialCredentialMatches__block_invoke;
  v70[3] = &unk_1E5C75478;
  v70[4] = self;
  v70[5] = &v71;
  long long v47 = +[SFFormAutoFillMultipleLoginsAlertController alertControllerWithMatchesFromFormProtectionSpace:v46 matchesFromOtherProtectionSpaces:v45 externalCredentials:v7 preferredStyle:IsPad formURL:v49 completionHandler:v70];

  if (v47)
  {
    v64[0] = MEMORY[0x1E4F143A8];
    v64[1] = 3221225472;
    v64[2] = __73__SFFormAutocompleteState__offerToAutoFillFromPotentialCredentialMatches__block_invoke_2;
    v64[3] = &unk_1E5C75518;
    id v65 = v49;
    uint64_t v66 = self;
    BOOL v69 = v4 == 0;
    v68 = &v71;
    id v38 = v44;
    id v67 = v38;
    long long v39 = (void *)MEMORY[0x1AD0C36A0](v64);
    uint64_t v9 = _WBSLocalizedString();
    id v10 = [MEMORY[0x1E4F1CA48] array];
    if ([v50 count])
    {
      id v37 = (void *)v9;
      long long v62 = 0u;
      long long v63 = 0u;
      long long v60 = 0u;
      long long v61 = 0u;
      id v11 = v50;
      uint64_t v12 = [v11 countByEnumeratingWithState:&v60 objects:v80 count:16];
      if (v12)
      {
        uint64_t v13 = *(void *)v61;
        do
        {
          for (uint64_t i = 0; i != v12; ++i)
          {
            if (*(void *)v61 != v13) {
              objc_enumerationMutation(v11);
            }
            uint64_t v15 = *(void *)(*((void *)&v60 + 1) + 8 * i);
            v59[0] = MEMORY[0x1E4F143A8];
            v59[1] = 3221225472;
            v59[2] = __73__SFFormAutocompleteState__offerToAutoFillFromPotentialCredentialMatches__block_invoke_3;
            v59[3] = &unk_1E5C723B0;
            v59[4] = &v71;
            id v16 = [(SFFormAutocompleteState *)self _actionForPresentingPasswordManagerExtension:v15 completionHandler:v59];
            [v10 addObject:v16];
          }
          uint64_t v12 = [v11 countByEnumeratingWithState:&v60 objects:v80 count:16];
        }
        while (v12);
      }

      uint64_t v9 = _WBSLocalizedString();
    }
    id v17 = (void *)MEMORY[0x1E4FB1410];
    v57[0] = MEMORY[0x1E4F143A8];
    v57[1] = 3221225472;
    v57[2] = __73__SFFormAutocompleteState__offerToAutoFillFromPotentialCredentialMatches__block_invoke_4;
    v57[3] = &unk_1E5C74688;
    uint64_t v18 = v39;
    id v58 = v18;
    uint64_t v19 = (void *)v9;
    uint64_t v20 = [v17 actionWithTitle:v9 style:0 handler:v57];
    v52[0] = MEMORY[0x1E4F143A8];
    v52[1] = 3221225472;
    v52[2] = __73__SFFormAutocompleteState__offerToAutoFillFromPotentialCredentialMatches__block_invoke_5;
    v52[3] = &unk_1E5C726F0;
    id v21 = v10;
    id v53 = v21;
    id v22 = v47;
    id v54 = v22;
    BOOL v55 = self;
    id v23 = v20;
    id v56 = v23;
    uint64_t v24 = (void (**)(void))MEMORY[0x1AD0C36A0](v52);
    uint64_t v25 = [(SFFormAutocompleteState *)self externalCredentialIdentities];
    unint64_t v26 = [v25 count];

    uint64_t v27 = [v50 count];
    id v28 = [MEMORY[0x1E4F98208] sharedFeatureManager];
    LODWORD(v17) = [v28 shouldAutoFillPasswordsFromKeychain];
    BOOL v29 = v26 < 2;

    if (v27 + v17 < 2 && v29)
    {
      uint64_t v31 = objc_msgSend(v48, "webui_preventNavigationDuringAutoFillPrompt");
      uint64_t v32 = (void *)v72[5];
      v72[5] = v31;

      if ([v50 count])
      {
        uint64_t v33 = [v50 firstObject];
        [(SFFormAutocompleteState *)self _presentCredentialListForExtension:v33 completionHandler:v72[5]];
      }
      else
      {
        v18[2](v18);
      }
    }
    else
    {
      v24[2](v24);
      uint64_t v34 = objc_msgSend(v48, "webui_preventNavigationDuringAutoFillPrompt");
      id v35 = (void *)v72[5];
      v72[5] = v34;

      [(SFFormAutocompleteState *)self _presentViewController:v22 presentingViewController:v38 animated:1 completion:0];
    }
  }
  _Block_object_dispose(&v71, 8);
}

void __73__SFFormAutocompleteState__offerToAutoFillFromPotentialCredentialMatches__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    [*(id *)(a1 + 32) _fillSavedAccountMatchAfterAuthenticationIfNeeded:v3 setAsDefaultCredential:1 submitForm:0];
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      [*(id *)(a1 + 32) _fillCredentialIdentity:v3 submitForm:0];
    }
    else if (v3)
    {
      __73__SFFormAutocompleteState__offerToAutoFillFromPotentialCredentialMatches__block_invoke_cold_1();
    }
  }
  (*(void (**)(void))(*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) + 16))();
}

void __73__SFFormAutocompleteState__offerToAutoFillFromPotentialCredentialMatches__block_invoke_2(uint64_t a1)
{
  v66[1] = *MEMORY[0x1E4F143B8];
  uint64_t v2 = objc_msgSend(*(id *)(a1 + 32), "safari_userVisibleString");
  long long v46 = objc_msgSend(v2, "safari_simplifiedUserVisibleURLStringWithSimplifications:forDisplayOnly:simplifiedStringOffset:", 511, 1, 0);

  id v3 = [*(id *)(a1 + 32) host];
  uint64_t v4 = objc_msgSend(v3, "safari_highLevelDomainFromHost");

  long long v47 = (void *)v4;
  if (v4)
  {
    v66[0] = v4;
    uint64_t v5 = [MEMORY[0x1E4F1C978] arrayWithObjects:v66 count:1];
  }
  else
  {
    uint64_t v5 = 0;
  }
  id v56 = 0;
  id v57 = 0;
  [MEMORY[0x1E4F98CA0] getHintStringsForAppID:0 appNames:0 matchedSites:v5 urlString:0 outServiceNameHintStrings:&v57 outDomainHintStrings:&v56];
  id v6 = v57;
  id v7 = v56;
  id v8 = WBS_LOG_CHANNEL_PREFIXAppPasswordAutoFill();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
  {
    id v40 = v8;
    uint64_t v41 = [v5 count];
    *(_DWORD *)buf = 134218498;
    uint64_t v61 = v41;
    __int16 v62 = 2112;
    id v63 = v6;
    __int16 v64 = 2112;
    id v65 = v7;
    _os_log_debug_impl(&dword_1A690B000, v40, OS_LOG_TYPE_DEBUG, "Requested hint strings for number of matchedSites %lu, got service name hint strings: %@ and domain hint strings: %@", buf, 0x20u);
  }
  BOOL v45 = v5;
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 40) + 16));
  uint64_t v9 = objc_alloc_init(SFAccountPickerConfiguration);
  id v10 = NSString;
  id v11 = _WBSLocalizedString();
  uint64_t v12 = objc_msgSend(v10, "stringWithFormat:", v11, v46);
  [(SFAccountPickerConfiguration *)v9 setPrompt:v12];

  uint64_t v13 = NSString;
  id v14 = _WBSLocalizedString();
  uint64_t v15 = objc_msgSend(v13, "stringWithFormat:", v14, v46);
  [(SFAccountPickerConfiguration *)v9 setPromptWhenPasskeysAreAvailable:v15];

  [(SFAccountPickerConfiguration *)v9 setMinimumNumberOfCredentialsToShowLikelyMatchesSection:10];
  [(SFAccountPickerConfiguration *)v9 setForUserNamesOnly:*(unsigned __int8 *)(a1 + 64)];
  uint64_t v44 = v6;
  [(SFAccountPickerConfiguration *)v9 setServiceNameHintStrings:v6];
  id v43 = v7;
  [(SFAccountPickerConfiguration *)v9 setDomainHintStrings:v7];
  [(SFAccountPickerConfiguration *)v9 setShouldEnableAddingNewPasswordsIfPossible:1];
  id v16 = objc_loadWeakRetained((id *)(*(void *)(a1 + 40) + 24));
  id v17 = [*(id *)(*(void *)(a1 + 40) + 232) ancestorFrameURLs];
  char v18 = [v16 frameIsKnownToAskForCredentialsFromOtherServicesFromAncestorFrameURLs:v17];

  if ((v18 & 1) == 0) {
    [(SFAccountPickerConfiguration *)v9 setAddPasswordSuggestedDomain:v4];
  }
  uint64_t v19 = [MEMORY[0x1E4F4F118] sharedManager];
  uint64_t v20 = [v19 isDeviceConfiguredToAllowPasskeys];

  [(SFAccountPickerConfiguration *)v9 setShouldShowAutoFillPasskeys:v20];
  id v21 = [*(id *)(*(void *)(a1 + 40) + 64) frameHandle];
  uint64_t v22 = [v21 webFrameIdentifier];
  [(SFAccountPickerConfiguration *)v9 setCurrentWebFrameIdentifierForAutoFillPasskeys:v22];

  [(SFAccountPickerConfiguration *)v9 setShouldShowPasskeysInAccountPicker:v20];
  id v23 = [WeakRetained savedAccountContext];
  [(SFAccountPickerConfiguration *)v9 setSavedAccountContext:v23];

  uint64_t v24 = [SFAccountPickerViewController alloc];
  v55[0] = MEMORY[0x1E4F143A8];
  v55[1] = 3221225472;
  v55[2] = __73__SFFormAutocompleteState__offerToAutoFillFromPotentialCredentialMatches__block_invoke_194;
  v55[3] = &unk_1E5C754A0;
  uint64_t v25 = *(void *)(a1 + 56);
  v55[4] = *(void *)(a1 + 40);
  v55[5] = v25;
  unint64_t v26 = [(SFAccountPickerViewController *)v24 initWithConfiguration:v9 completionHandler:v55];
  [(SFAccountPickerViewController *)v26 setModalPresentationStyle:2];
  id v27 = objc_alloc_init(MEMORY[0x1E4F30B50]);
  uint64_t v28 = WBSAuthenticationPolicyForPasswordManager();
  id v54 = 0;
  LOBYTE(v22) = [v27 canEvaluatePolicy:v28 error:&v54];
  id v29 = v54;
  id v30 = v29;
  if (v22)
  {
    v58[0] = &unk_1EFBDECB0;
    uint64_t v31 = +[SFAutoFillAuthenticationUtilities passcodePromptForViewingSavedAccounts];
    v58[1] = &unk_1EFBDECC8;
    v59[0] = v31;
    +[SFAutoFillAuthenticationUtilities customAuthenticationTitleForViewingSavedAccounts];
    v33 = uint64_t v32 = v30;
    v59[1] = v33;
    uint64_t v34 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v59 forKeys:v58 count:2];

    id v30 = v32;
    v48[0] = MEMORY[0x1E4F143A8];
    v48[1] = 3221225472;
    v48[2] = __73__SFFormAutocompleteState__offerToAutoFillFromPotentialCredentialMatches__block_invoke_200;
    v48[3] = &unk_1E5C754F0;
    long long v49 = v26;
    id v35 = v27;
    uint64_t v36 = *(void *)(a1 + 40);
    id v37 = *(void **)(a1 + 48);
    id v50 = v35;
    uint64_t v51 = v36;
    id v38 = v37;
    uint64_t v39 = *(void *)(a1 + 56);
    id v52 = v38;
    uint64_t v53 = v39;
    [v35 evaluatePolicy:v28 options:v34 reply:v48];
  }
  else if ([v29 code] == -5)
  {
    [*(id *)(a1 + 40) _presentViewController:v26 presentingViewController:*(void *)(a1 + 48) animated:1 completion:0];
  }
  else
  {
    (*(void (**)(void))(*(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) + 16))();
  }
}

void __73__SFFormAutocompleteState__offerToAutoFillFromPotentialCredentialMatches__block_invoke_194(uint64_t a1, void *a2)
{
  id v3 = [a2 firstObject];
  if (v3) {
    [*(id *)(a1 + 32) _fillSavedAccount:v3 setAutoFilled:1 setAsDefaultCredential:0 focusFieldAfterFilling:0 submitForm:0];
  }
  (*(void (**)(void))(*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) + 16))();
}

void __73__SFFormAutocompleteState__offerToAutoFillFromPotentialCredentialMatches__block_invoke_200(uint64_t a1, uint64_t a2, void *a3)
{
  id v4 = a3;
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __73__SFFormAutocompleteState__offerToAutoFillFromPotentialCredentialMatches__block_invoke_2_201;
  v11[3] = &unk_1E5C754C8;
  id v12 = v4;
  id v13 = *(id *)(a1 + 32);
  id v5 = *(id *)(a1 + 40);
  uint64_t v6 = *(void *)(a1 + 48);
  id v7 = *(void **)(a1 + 56);
  id v14 = v5;
  uint64_t v15 = v6;
  id v8 = v7;
  uint64_t v9 = *(void *)(a1 + 64);
  id v16 = v8;
  uint64_t v17 = v9;
  id v10 = v4;
  dispatch_async(MEMORY[0x1E4F14428], v11);
}

uint64_t __73__SFFormAutocompleteState__offerToAutoFillFromPotentialCredentialMatches__block_invoke_2_201(uint64_t a1)
{
  if (*(void *)(a1 + 32))
  {
    uint64_t v2 = *(uint64_t (**)(void))(*(void *)(*(void *)(*(void *)(a1 + 72) + 8) + 40) + 16);
    return v2();
  }
  else
  {
    [*(id *)(a1 + 40) setAuthenticatedContext:*(void *)(a1 + 48)];
    uint64_t v4 = *(void *)(a1 + 40);
    id v5 = *(void **)(a1 + 56);
    uint64_t v6 = *(void *)(a1 + 64);
    return [v5 _presentViewController:v4 presentingViewController:v6 animated:1 completion:0];
  }
}

uint64_t __73__SFFormAutocompleteState__offerToAutoFillFromPotentialCredentialMatches__block_invoke_3(uint64_t a1)
{
  uint64_t result = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 40);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

uint64_t __73__SFFormAutocompleteState__offerToAutoFillFromPotentialCredentialMatches__block_invoke_4(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __73__SFFormAutocompleteState__offerToAutoFillFromPotentialCredentialMatches__block_invoke_5(uint64_t a1)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  id v2 = *(id *)(a1 + 32);
  uint64_t v3 = [v2 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v10;
    do
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v10 != v5) {
          objc_enumerationMutation(v2);
        }
        objc_msgSend(*(id *)(a1 + 40), "addAction:", *(void *)(*((void *)&v9 + 1) + 8 * v6++), (void)v9);
      }
      while (v4 != v6);
      uint64_t v4 = [v2 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v4);
  }

  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 48) + 24));
  int v8 = [WeakRetained shouldAutoFillPasswords];

  if (v8) {
    [*(id *)(a1 + 40) addAction:*(void *)(a1 + 56)];
  }
}

- (void)_addActionForAlertController:(id)a3 title:(id)a4 detail:(id)a5 handler:(id)a6
{
  id v9 = a3;
  id v10 = +[SFMultipleLineAlertAction actionWithTitle:a4 detail:a5 handler:a6];
  [v9 addAction:v10];
}

- (void)_offerToAutoFillFromAvailableOneTimeCodes
{
  v13[2] = *MEMORY[0x1E4F143B8];
  id v3 = objc_alloc_init(MEMORY[0x1E4F98228]);
  uint64_t v4 = [(WBSFormControlMetadata *)self->_textFieldMetadata ancestorFrameURLs];
  uint64_t v5 = [v4 lastObject];

  uint64_t v6 = [v5 host];
  uint64_t v7 = [v6 length];

  if (v7)
  {
    int v8 = [v5 host];
    v13[0] = v8;
    id v9 = [v5 host];
    id v10 = objc_msgSend(v9, "safari_highLevelDomainForPasswordManager");
    v13[1] = v10;
    long long v11 = [MEMORY[0x1E4F1C978] arrayWithObjects:v13 count:2];
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __68__SFFormAutocompleteState__offerToAutoFillFromAvailableOneTimeCodes__block_invoke;
    v12[3] = &unk_1E5C72420;
    void v12[4] = self;
    [v3 fetchOneTimeCodeCredentialIdentitiesMatchingDomains:v11 completion:v12];
  }
  else
  {
    [(SFFormAutocompleteState *)self _buildAndPresentOneTimeCodeAlertControllerWithExternalCredentialIdentities:MEMORY[0x1E4F1CBF0]];
  }
}

uint64_t __68__SFFormAutocompleteState__offerToAutoFillFromAvailableOneTimeCodes__block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) _buildAndPresentOneTimeCodeAlertControllerWithExternalCredentialIdentities:a2];
}

- (void)_buildAndPresentOneTimeCodeAlertControllerWithExternalCredentialIdentities:(id)a3
{
  uint64_t v109 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  BOOL v69 = self;
  objc_initWeak(&location, self);
  id WeakRetained = objc_loadWeakRetained((id *)&self->_autoFillController);
  uint64_t v5 = [WeakRetained oneTimeCodeProvider];
  uint64_t v6 = [(WBSFormControlMetadata *)self->_textFieldMetadata ancestorFrameURLs];
  uint64_t v7 = [(WBSFormControlMetadata *)v69->_textFieldMetadata oneTimeCodeFieldClassification];
  int v8 = [WeakRetained savedAccountContext];
  long long v60 = [v5 currentOneTimeCodesForWebBrowserWithWebsiteFrameURLs:v6 fieldClassification:v7 inContext:v8];

  id v9 = [(SFFormAutoFillFrameHandle *)v69->_frame webui_URL];
  id v10 = objc_msgSend(v9, "safari_userVisibleString");
  uint64_t v61 = objc_msgSend(v10, "safari_simplifiedUserVisibleURLStringWithSimplifications:forDisplayOnly:simplifiedStringOffset:", 511, 1, 0);

  long long v11 = (void *)MEMORY[0x1E4FB1418];
  long long v12 = NSString;
  id v13 = _WBSLocalizedString();
  uint64_t v14 = objc_msgSend(v12, "stringWithFormat:", v13, v61);
  v70 = [v11 alertControllerWithTitle:0 message:v14 preferredStyle:0];

  uint64_t v15 = [(WBSFormControlMetadata *)v69->_textFieldMetadata ancestorFrameURLs];
  id v63 = [v15 lastObject];

  id v16 = [MEMORY[0x1E4F98230] sharedManager];
  __int16 v64 = [v16 getEnabledExtensionsSynchronously];

  long long v96 = 0u;
  long long v97 = 0u;
  long long v94 = 0u;
  long long v95 = 0u;
  id obj = v4;
  id v67 = (id)[obj countByEnumeratingWithState:&v94 objects:v108 count:16];
  if (v67)
  {
    uint64_t v66 = *(void *)v95;
    do
    {
      for (id i = 0; i != v67; id i = (char *)i + 1)
      {
        if (*(void *)v95 != v66) {
          objc_enumerationMutation(obj);
        }
        uint64_t v17 = *(void **)(*((void *)&v94 + 1) + 8 * i);
        if ([v17 type] == 4)
        {
          long long v92 = 0u;
          long long v93 = 0u;
          long long v90 = 0u;
          long long v91 = 0u;
          id v18 = v64;
          uint64_t v19 = [v18 countByEnumeratingWithState:&v90 objects:v105 count:16];
          if (v19)
          {
            uint64_t v20 = *(void *)v91;
LABEL_9:
            uint64_t v21 = 0;
            while (1)
            {
              if (*(void *)v91 != v20) {
                objc_enumerationMutation(v18);
              }
              uint64_t v22 = *(void **)(*((void *)&v90 + 1) + 8 * v21);
              id v23 = objc_msgSend(v22, "sf_bundleIdentifierForContainingApp");
              uint64_t v24 = [v17 owningExtensionState];
              uint64_t v25 = [v24 providerBundleID];
              char v26 = [v23 isEqualToString:v25];

              if (v26) {
                break;
              }
              if (v19 == ++v21)
              {
                uint64_t v19 = [v18 countByEnumeratingWithState:&v90 objects:v105 count:16];
                if (v19) {
                  goto LABEL_9;
                }
                goto LABEL_15;
              }
            }
            id v27 = v22;

            if (!v27) {
              goto LABEL_21;
            }
            id v29 = [MEMORY[0x1E4F98230] sharedManager];
            char v30 = [v29 extensionSupportsOneTimeCodes:v27];

            if (v30)
            {
              uint64_t v31 = [v17 user];
              uint64_t v32 = [MEMORY[0x1E4F98250] titleForCredentialIdentity:v17 formURL:v63];
              v86[0] = MEMORY[0x1E4F143A8];
              v86[1] = 3221225472;
              v86[2] = __102__SFFormAutocompleteState__buildAndPresentOneTimeCodeAlertControllerWithExternalCredentialIdentities___block_invoke;
              v86[3] = &unk_1E5C75540;
              objc_copyWeak(&v89, &location);
              id v27 = v27;
              v87 = v27;
              v88 = v17;
              [(SFFormAutocompleteState *)v69 _addActionForAlertController:v70 title:v31 detail:v32 handler:v86];

              objc_destroyWeak(&v89);
            }
            else
            {
              id v35 = (id)WBS_LOG_CHANNEL_PREFIXAutoFill();
              if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR))
              {
                uint64_t v36 = [v27 identifier];
                -[SFFormAutocompleteState _buildAndPresentOneTimeCodeAlertControllerWithExternalCredentialIdentities:](v36, v101, &v102, v35);
              }
            }
          }
          else
          {
LABEL_15:

LABEL_21:
            id v27 = (id)WBS_LOG_CHANNEL_PREFIXAutoFill();
            if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
            {
              uint64_t v33 = [v17 owningExtensionState];
              uint64_t v34 = [v33 providerBundleID];
              *(_DWORD *)buf = 138543362;
              v104 = v34;
              _os_log_error_impl(&dword_1A690B000, v27, OS_LOG_TYPE_ERROR, "failed to find enabled extension matching credential identity, expected %{public}@", buf, 0xCu);
            }
          }
        }
        else
        {
          id v27 = (id)WBS_LOG_CHANNEL_PREFIXAutoFill();
          if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
          {
            [v17 type];
            uint64_t v28 = SFStringFromCredentialIdentityType();
            -[SFFormAutocompleteState _buildAndPresentOneTimeCodeAlertControllerWithExternalCredentialIdentities:](v28, v106, &v107, v27);
          }
        }
      }
      id v67 = (id)[obj countByEnumeratingWithState:&v94 objects:v108 count:16];
    }
    while (v67);
  }

  long long v84 = 0u;
  long long v85 = 0u;
  long long v82 = 0u;
  long long v83 = 0u;
  id v72 = v60;
  uint64_t v37 = [v72 countByEnumeratingWithState:&v82 objects:v100 count:16];
  if (v37)
  {
    uint64_t v38 = *(void *)v83;
    do
    {
      for (uint64_t j = 0; j != v37; ++j)
      {
        if (*(void *)v83 != v38) {
          objc_enumerationMutation(v72);
        }
        id v40 = *(void **)(*((void *)&v82 + 1) + 8 * j);
        uint64_t v41 = [v40 localizedSubtitleForContext:0];
        id v42 = [v40 localizedTitleForContext:0];
        v80[0] = MEMORY[0x1E4F143A8];
        v80[1] = 3221225472;
        v80[2] = __102__SFFormAutocompleteState__buildAndPresentOneTimeCodeAlertControllerWithExternalCredentialIdentities___block_invoke_2;
        v80[3] = &unk_1E5C72938;
        objc_copyWeak(&v81, &location);
        v80[4] = v40;
        [(SFFormAutocompleteState *)v69 _addActionForAlertController:v70 title:v41 detail:v42 handler:v80];

        objc_destroyWeak(&v81);
      }
      uint64_t v37 = [v72 countByEnumeratingWithState:&v82 objects:v100 count:16];
    }
    while (v37);
  }

  long long v79 = 0u;
  long long v77 = 0u;
  long long v78 = 0u;
  long long v76 = 0u;
  id v68 = v64;
  uint64_t v43 = [v68 countByEnumeratingWithState:&v76 objects:v99 count:16];
  if (v43)
  {
    uint64_t v44 = *(void *)v77;
    do
    {
      for (uint64_t k = 0; k != v43; ++k)
      {
        if (*(void *)v77 != v44) {
          objc_enumerationMutation(v68);
        }
        long long v46 = *(void **)(*((void *)&v76 + 1) + 8 * k);
        long long v47 = [MEMORY[0x1E4F98230] sharedManager];
        char v48 = [v47 extensionSupportsOneTimeCodes:v46];

        if (v48)
        {
          id v49 = objc_alloc(MEMORY[0x1E4F223C8]);
          id v50 = objc_msgSend(v46, "sf_bundleIdentifierForContainingApp");
          uint64_t v51 = (void *)[v49 initWithBundleIdentifier:v50 allowPlaceholder:0 error:0];
          id v52 = [v51 localizedName];

          uint64_t v53 = (void *)MEMORY[0x1E4FB1410];
          id v54 = [NSString stringWithFormat:@"%@…", v52];
          v74[0] = MEMORY[0x1E4F143A8];
          v74[1] = 3221225472;
          v74[2] = __102__SFFormAutocompleteState__buildAndPresentOneTimeCodeAlertControllerWithExternalCredentialIdentities___block_invoke_3;
          v74[3] = &unk_1E5C72938;
          objc_copyWeak(&v75, &location);
          v74[4] = v46;
          BOOL v55 = [v53 _actionWithTitle:v54 image:0 style:0 handler:v74 shouldDismissHandler:&__block_literal_global_226];
          [v70 addAction:v55];

          objc_destroyWeak(&v75);
        }
      }
      uint64_t v43 = [v68 countByEnumeratingWithState:&v76 objects:v99 count:16];
    }
    while (v43);
  }

  id v56 = (void *)MEMORY[0x1E4FB1410];
  id v57 = _WBSLocalizedString();
  v73[0] = MEMORY[0x1E4F143A8];
  v73[1] = 3221225472;
  v73[2] = __102__SFFormAutocompleteState__buildAndPresentOneTimeCodeAlertControllerWithExternalCredentialIdentities___block_invoke_5;
  v73[3] = &unk_1E5C72898;
  v73[4] = v69;
  id v58 = [v56 actionWithTitle:v57 style:1 handler:v73];
  [v70 addAction:v58];

  long long v59 = [(SFFormAutocompleteState *)v69 _viewControllerToPresentFrom];
  [(SFFormAutocompleteState *)v69 _presentViewController:v70 presentingViewController:v59 animated:1 completion:0];

  objc_destroyWeak(&location);
}

void __102__SFFormAutocompleteState__buildAndPresentOneTimeCodeAlertControllerWithExternalCredentialIdentities___block_invoke(uint64_t a1)
{
  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 48));
  if (WeakRetained)
  {
    id v2 = objc_alloc(MEMORY[0x1E4F18B00]);
    uint64_t v3 = *(void *)(a1 + 32);
    id v4 = objc_alloc(MEMORY[0x1E4F18AC0]);
    uint64_t v5 = (void *)[objc_alloc(MEMORY[0x1E4F18AB8]) _initWithFoundationCredentialIdentity:*(void *)(a1 + 40)];
    uint64_t v6 = (void *)[v4 initWithCredentialIdentity:v5];
    uint64_t v7 = [v2 initWithExtension:v3 oneTimeCodeCredentialRequest:v6];
    id v8 = WeakRetained[19];
    WeakRetained[19] = (id)v7;

    objc_msgSend(WeakRetained[19], "setDelegate:");
    [WeakRetained[19] setDismissOnBackground:1];
  }
}

void __102__SFFormAutocompleteState__buildAndPresentOneTimeCodeAlertControllerWithExternalCredentialIdentities___block_invoke_2(uint64_t a1)
{
  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    uint64_t v3 = WeakRetained;
    objc_msgSend(WeakRetained, "_fillOneTimeCodeAfterAuthenticationIfNeeded:inFrame:shouldSubmit:", *(void *)(a1 + 32), WeakRetained[27], objc_msgSend(WeakRetained[29], "oneTimeCodeIsEligibleForAutomaticLogin"));
    id WeakRetained = v3;
  }
}

void __102__SFFormAutocompleteState__buildAndPresentOneTimeCodeAlertControllerWithExternalCredentialIdentities___block_invoke_3(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    id v2 = objc_alloc(MEMORY[0x1E4F18B08]);
    uint64_t v3 = (void *)[v2 initOneTimeCodeCredentialListWithExtension:*(void *)(a1 + 32) serviceIdentifiers:MEMORY[0x1E4F1CBF0]];
    [v3 setDelegate:WeakRetained];
    [v3 setDismissOnBackground:1];
    id v4 = [WeakRetained _viewControllerToPresentFrom];
    [v4 presentViewController:v3 animated:1 completion:0];
  }
}

uint64_t __102__SFFormAutocompleteState__buildAndPresentOneTimeCodeAlertControllerWithExternalCredentialIdentities___block_invoke_4()
{
  return 1;
}

uint64_t __102__SFFormAutocompleteState__buildAndPresentOneTimeCodeAlertControllerWithExternalCredentialIdentities___block_invoke_5(uint64_t a1)
{
  return [*(id *)(a1 + 32) _setShowingKeyboardInputView:1];
}

- (void)_fillSavedAccountMatchAfterAuthenticationIfNeeded:(id)a3 setAsDefaultCredential:(BOOL)a4 submitForm:(BOOL)a5
{
  id v8 = a3;
  id v9 = [v8 autoFillPasskey];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_autoFillController);
  long long v11 = [v8 user];
  uint64_t v12 = [v9 shouldRequireUserVerification];
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  void v15[2] = __111__SFFormAutocompleteState__fillSavedAccountMatchAfterAuthenticationIfNeeded_setAsDefaultCredential_submitForm___block_invoke;
  id v15[3] = &unk_1E5C75568;
  v15[4] = self;
  id v16 = v9;
  id v17 = v8;
  BOOL v18 = a4;
  BOOL v19 = a5;
  id v13 = v8;
  id v14 = v9;
  [WeakRetained authenticateIfNeededForAutoFillAuthenticationType:v9 != 0 user:v11 shouldForceAuthentication:v12 withCompletion:v15];
}

void __111__SFFormAutocompleteState__fillSavedAccountMatchAfterAuthenticationIfNeeded_setAsDefaultCredential_submitForm___block_invoke(uint64_t a1, int a2, void *a3)
{
  id v5 = a3;
  if (a2)
  {
    id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 16));
    uint64_t v7 = WeakRetained;
    if (*(void *)(a1 + 40))
    {
      id v8 = [WeakRetained savedAccountContext];
      uint64_t v9 = *(void *)(a1 + 32);
      uint64_t v10 = *(void *)(a1 + 40);
      long long v11 = *(void **)(v9 + 192);
      v12[0] = MEMORY[0x1E4F143A8];
      v12[1] = 3221225472;
      v12[2] = __111__SFFormAutocompleteState__fillSavedAccountMatchAfterAuthenticationIfNeeded_setAsDefaultCredential_submitForm___block_invoke_2;
      v12[3] = &unk_1E5C724D8;
      id v13 = v7;
      [v11 userSelectedAutoFillPasskey:v10 authenticatedLAContext:v5 savedAccountContext:v8 completionHandler:v12];
    }
    else
    {
      id v8 = [*(id *)(a1 + 48) savedAccount];
      [*(id *)(a1 + 32) _fillSavedAccount:v8 setAutoFilled:1 setAsDefaultCredential:*(unsigned __int8 *)(a1 + 56) focusFieldAfterFilling:*(unsigned __int8 *)(a1 + 57) submitForm:*(unsigned __int8 *)(a1 + 57)];
      [v7 didCompleteWithSavedAccount:v8];
    }
  }
}

void __111__SFFormAutocompleteState__fillSavedAccountMatchAfterAuthenticationIfNeeded_setAsDefaultCredential_submitForm___block_invoke_2(uint64_t a1)
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __111__SFFormAutocompleteState__fillSavedAccountMatchAfterAuthenticationIfNeeded_setAsDefaultCredential_submitForm___block_invoke_3;
  block[3] = &unk_1E5C724D8;
  id v2 = *(id *)(a1 + 32);
  dispatch_async(MEMORY[0x1E4F14428], block);
}

uint64_t __111__SFFormAutocompleteState__fillSavedAccountMatchAfterAuthenticationIfNeeded_setAsDefaultCredential_submitForm___block_invoke_3(uint64_t a1)
{
  return [*(id *)(a1 + 32) didCompleteWithPasskey];
}

- (void)_fillCredentialAfterAuthenticationIfNeeded:(id)a3 setAsDefaultCredential:(BOOL)a4 submitForm:(BOOL)a5
{
  id v8 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_autoFillController);
  uint64_t v10 = [v8 user];
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __104__SFFormAutocompleteState__fillCredentialAfterAuthenticationIfNeeded_setAsDefaultCredential_submitForm___block_invoke;
  v12[3] = &unk_1E5C75590;
  void v12[4] = self;
  id v13 = v8;
  BOOL v14 = a4;
  BOOL v15 = a5;
  id v11 = v8;
  [WeakRetained authenticateIfNeededForAutoFillAuthenticationType:0 user:v10 shouldForceAuthentication:0 withCompletion:v12];
}

uint64_t __104__SFFormAutocompleteState__fillCredentialAfterAuthenticationIfNeeded_setAsDefaultCredential_submitForm___block_invoke(uint64_t result, int a2)
{
  if (a2) {
    return [*(id *)(result + 32) _fillCredential:*(void *)(result + 40) setAutoFilled:1 setAsDefaultCredential:*(unsigned __int8 *)(result + 48) focusFieldAfterFilling:*(unsigned __int8 *)(result + 49) submitForm:*(unsigned __int8 *)(result + 49)];
  }
  return result;
}

- (void)_fillOneTimeCodeAfterAuthenticationIfNeeded:(id)a3 inFrame:(id)a4 shouldSubmit:(BOOL)a5
{
  id v8 = a3;
  id v9 = a4;
  objc_initWeak(&location, self);
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __92__SFFormAutocompleteState__fillOneTimeCodeAfterAuthenticationIfNeeded_inFrame_shouldSubmit___block_invoke;
  v16[3] = &unk_1E5C755B8;
  objc_copyWeak(&v19, &location);
  id v10 = v9;
  id v17 = v10;
  id v11 = v8;
  id v18 = v11;
  BOOL v20 = a5;
  uint64_t v12 = (void (**)(void, void, void))MEMORY[0x1AD0C36A0](v16);
  unint64_t v13 = [v11 source];
  if (v13 >= 2)
  {
    if (v13 == 2)
    {
      id WeakRetained = objc_loadWeakRetained((id *)&self->_autoFillController);
      BOOL v15 = [v11 user];
      [WeakRetained authenticateIfNeededForAutoFillAuthenticationType:5 user:v15 shouldForceAuthentication:0 withCompletion:v12];
    }
  }
  else
  {
    v12[2](v12, 1, 0);
  }

  objc_destroyWeak(&v19);
  objc_destroyWeak(&location);
}

void __92__SFFormAutocompleteState__fillOneTimeCodeAfterAuthenticationIfNeeded_inFrame_shouldSubmit___block_invoke(uint64_t a1, int a2)
{
  if (a2)
  {
    id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 48));
    if (WeakRetained)
    {
      id v8 = WeakRetained;
      id v4 = objc_loadWeakRetained(WeakRetained + 2);
      uint64_t v5 = *(void *)(a1 + 32);
      uint64_t v6 = [*(id *)(a1 + 40) code];
      [v4 autoFillOneTimeCodeFieldsInFrame:v5 withValue:v6 shouldSubmit:*(unsigned __int8 *)(a1 + 56)];

      uint64_t v7 = [v4 oneTimeCodeProvider];
      [v7 consumeOneTimeCode:*(void *)(a1 + 40)];

      [v8 updateSuggestions];
      id WeakRetained = v8;
    }
  }
}

- (void)_suggestLoginCredentialsShowingQuickTypeKey:(BOOL)a3
{
  BOOL v3 = a3;
  v50[1] = *MEMORY[0x1E4F143B8];
  objc_initWeak(&location, self);
  if (!self->_fetchingLoginCredentialSuggestions)
  {
    self->_fetchingLoginCredentialSuggestions = 1;
    v46[0] = MEMORY[0x1E4F143A8];
    v46[1] = 3221225472;
    v46[2] = __71__SFFormAutocompleteState__suggestLoginCredentialsShowingQuickTypeKey___block_invoke;
    v46[3] = &unk_1E5C755E0;
    id v18 = &v47;
    objc_copyWeak(&v47, &location);
    BOOL v48 = v3;
    BOOL v20 = (void (**)(void, void, void))MEMORY[0x1AD0C36A0](v46);
    if (v3)
    {
      self->_quickTypeBarTrailingButtonPurpose = 0;
      uint64_t v5 = objc_msgSend(MEMORY[0x1E4FB1478], "autofillExtrasSuggestion", &v47);
      v50[0] = v5;
      uint64_t v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:v50 count:1];
      uint64_t v7 = [(_SFFormAutoFillInputSession *)self->_inputSession formInputSession];
      [v7 setSuggestions:v6];
    }
    id v8 = dispatch_group_create();
    id v9 = [(SFFormAutoFillFrameHandle *)self->_frame webui_URL];
    uint64_t v40 = 0;
    uint64_t v41 = &v40;
    uint64_t v42 = 0x3032000000;
    uint64_t v43 = __Block_byref_object_copy__4;
    uint64_t v44 = __Block_byref_object_dispose__4;
    id v45 = 0;
    id v10 = [MEMORY[0x1E4F1CA48] array];
    id v11 = [v9 host];
    uint64_t v12 = objc_msgSend(v11, "safari_domainFromHost");
    unint64_t v13 = objc_msgSend(v11, "safari_highLevelDomainFromHost");
    if (v12) {
      [v10 addObject:v12];
    }
    if (v13) {
      [v10 addObject:v13];
    }
    uint64_t v14 = objc_msgSend(v10, "count", v18);
    if (v14)
    {
      dispatch_group_enter(v8);
      BOOL v15 = dispatch_get_global_queue(33, 0);
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __71__SFFormAutocompleteState__suggestLoginCredentialsShowingQuickTypeKey___block_invoke_2;
      block[3] = &unk_1E5C75608;
      id v35 = v10;
      id v36 = v9;
      uint64_t v37 = self;
      uint64_t v39 = &v40;
      uint64_t v38 = v8;
      dispatch_async(v15, block);
    }
    uint64_t v28 = 0;
    id v29 = &v28;
    uint64_t v30 = 0x3032000000;
    uint64_t v31 = __Block_byref_object_copy__4;
    uint64_t v32 = __Block_byref_object_dispose__4;
    id v33 = 0;
    id v16 = [MEMORY[0x1E4F98208] sharedFeatureManager];
    int v17 = [v16 shouldAutoFillPasswordsFromKeychain];

    if (v17)
    {
      dispatch_group_enter(v8);
      v25[0] = MEMORY[0x1E4F143A8];
      v25[1] = 3221225472;
      v25[2] = __71__SFFormAutocompleteState__suggestLoginCredentialsShowingQuickTypeKey___block_invoke_4;
      v25[3] = &unk_1E5C75238;
      id v27 = &v28;
      char v26 = v8;
      [(SFFormAutocompleteState *)self _getMatchingKeychainCredentialsIncludingCredentialsWithEmptyUsernames:1 withCompletion:v25];
    }
    else if (!v14)
    {
      v20[2](v20, v29[5], v41[5]);
      goto LABEL_14;
    }
    v21[0] = MEMORY[0x1E4F143A8];
    v21[1] = 3221225472;
    v21[2] = __71__SFFormAutocompleteState__suggestLoginCredentialsShowingQuickTypeKey___block_invoke_5;
    v21[3] = &unk_1E5C75630;
    uint64_t v22 = v20;
    id v23 = &v28;
    uint64_t v24 = &v40;
    dispatch_group_notify(v8, MEMORY[0x1E4F14428], v21);

LABEL_14:
    _Block_object_dispose(&v28, 8);

    _Block_object_dispose(&v40, 8);
    objc_destroyWeak(v19);
  }
  objc_destroyWeak(&location);
}

void __71__SFFormAutocompleteState__suggestLoginCredentialsShowingQuickTypeKey___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v65 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v8 = WeakRetained;
  if (WeakRetained)
  {
    WeakRetained[104] = 0;
    if (!WeakRetained[105])
    {
      id obj = a3;
      uint64_t v45 = a1;
      id v9 = [MEMORY[0x1E4F1CA48] array];
      id v52 = [MEMORY[0x1E4F1CA48] array];
      id v10 = (void *)*((void *)v8 + 9);
      id v47 = v5;
      if (v10)
      {
        id v11 = v10;
      }
      else
      {
        id v12 = objc_loadWeakRetained((id *)v8 + 3);
        unint64_t v13 = objc_opt_class();
        uint64_t v14 = [*((id *)v8 + 28) userNameElementUniqueID];
        id v11 = [v13 valueOfControlWithUniqueID:v14 inForm:*((void *)v8 + 28)];
      }
      uint64_t v54 = [v11 length];
      long long v59 = 0u;
      long long v60 = 0u;
      long long v61 = 0u;
      long long v62 = 0u;
      id v46 = v6;
      id v15 = v6;
      uint64_t v16 = [v15 countByEnumeratingWithState:&v59 objects:v64 count:16];
      id v53 = v11;
      if (v16)
      {
        uint64_t v17 = v16;
        uint64_t v18 = *(void *)v60;
LABEL_8:
        uint64_t v19 = 0;
        while (1)
        {
          if (*(void *)v60 != v18) {
            objc_enumerationMutation(v15);
          }
          BOOL v20 = *(void **)(*((void *)&v59 + 1) + 8 * v19);
          if ([v9 count]) {
            break;
          }
          uint64_t v21 = [v20 user];
          uint64_t v22 = v21;
          if (v54 && !objc_msgSend(v21, "safari_hasCaseInsensitivePrefix:", v11))
          {
            uint64_t v24 = [v11 componentsSeparatedByString:@"@"];
            id v23 = [v24 firstObject];

            if (objc_msgSend(v22, "safari_hasCaseInsensitivePrefix:", v23))
            {
              uint64_t v25 = [v8 _textSuggestionForExternalCredentialIdentity:v20 submitForm:0];
              [v52 addObject:v25];
            }
            id v11 = v53;
          }
          else
          {
            id v23 = [v8 _textSuggestionForExternalCredentialIdentity:v20 submitForm:0];
            [v9 addObject:v23];
          }

          if (v17 == ++v19)
          {
            uint64_t v17 = [v15 countByEnumeratingWithState:&v59 objects:v64 count:16];
            if (v17) {
              goto LABEL_8;
            }
            break;
          }
        }
      }

      objc_storeStrong((id *)v8 + 18, obj);
      long long v57 = 0u;
      long long v58 = 0u;
      long long v55 = 0u;
      long long v56 = 0u;
      id v26 = v47;
      uint64_t v27 = [v26 countByEnumeratingWithState:&v55 objects:v63 count:16];
      if (v27)
      {
        uint64_t v28 = v27;
        uint64_t v29 = *(void *)v56;
        uint64_t v48 = *(void *)v56;
        id v49 = v26;
LABEL_22:
        uint64_t v30 = 0;
        id obja = (id)v28;
        while (1)
        {
          if (*(void *)v56 != v29) {
            objc_enumerationMutation(v26);
          }
          uint64_t v31 = *(void **)(*((void *)&v55 + 1) + 8 * v30);
          if ([v9 count]) {
            break;
          }
          uint64_t v32 = [v31 match];
          id v33 = [v32 user];

          if (v54 && !objc_msgSend(v33, "safari_hasCaseInsensitivePrefix:", v11))
          {
            id v35 = v8;
            id v36 = [v11 componentsSeparatedByString:@"@"];
            uint64_t v34 = [v36 firstObject];

            char v37 = objc_msgSend(v33, "safari_hasCaseInsensitivePrefix:", v34);
            uint64_t v38 = [v31 match];
            uint64_t v39 = [v38 autoFillPasskey];
            int v40 = [v39 requestUsedNonEmptyAllowList];

            if ((v37 & 1) != 0 || v40)
            {
              id v8 = v35;
              uint64_t v41 = [v35 _textSuggestionForCredentialDisplayData:v31 submitForm:0];
              [v52 addObject:v41];
            }
            else
            {
              id v8 = v35;
            }
            id v11 = v53;
            uint64_t v29 = v48;
            id v26 = v49;
            uint64_t v28 = (uint64_t)obja;
          }
          else
          {
            uint64_t v34 = [v8 _textSuggestionForCredentialDisplayData:v31 submitForm:0];
            [v9 addObject:v34];
          }

          if (v28 == ++v30)
          {
            uint64_t v28 = [v26 countByEnumeratingWithState:&v55 objects:v63 count:16];
            if (v28) {
              goto LABEL_22;
            }
            break;
          }
        }
      }

      [v9 addObjectsFromArray:v52];
      if (*(unsigned char *)(v45 + 40)) {
        [v8 _addPasswordsAutoFillSuggestionToSuggestions:v9 forPurpose:0];
      }
      uint64_t v42 = [*((id *)v8 + 8) formInputSession];
      id v43 = objc_loadWeakRetained((id *)v8 + 2);
      uint64_t v44 = [*((id *)v8 + 29) uniqueID];
      [v43 reportAutoFillOfferedType:1 forTextFieldWithID:v44 forFormMetadata:*((void *)v8 + 28)];

      [v42 setSuggestions:v9];
      id v6 = v46;
      id v5 = v47;
    }
  }
}

void __71__SFFormAutocompleteState__suggestLoginCredentialsShowingQuickTypeKey___block_invoke_2(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  uint64_t v3 = *(void *)(a1 + 40);
  id v4 = [*(id *)(*(void *)(a1 + 48) + 64) frameHandle];
  id v5 = [v4 webFrameIdentifier];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __71__SFFormAutocompleteState__suggestLoginCredentialsShowingQuickTypeKey___block_invoke_3;
  v8[3] = &unk_1E5C75238;
  long long v7 = *(_OWORD *)(a1 + 56);
  id v6 = (id)v7;
  long long v9 = v7;
  +[_SFFormAutoFillController _getExternalLoginCredentialSuggestionsForDomains:v2 pageURL:v3 webFrameIdentifier:v5 completion:v8];
}

void __71__SFFormAutocompleteState__suggestLoginCredentialsShowingQuickTypeKey___block_invoke_3(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a2);
  id v4 = a2;
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

void __71__SFFormAutocompleteState__suggestLoginCredentialsShowingQuickTypeKey___block_invoke_4(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a2);
  id v4 = a2;
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

uint64_t __71__SFFormAutocompleteState__suggestLoginCredentialsShowingQuickTypeKey___block_invoke_5(void *a1)
{
  return (*(uint64_t (**)(void, void, void))(a1[4] + 16))(a1[4], *(void *)(*(void *)(a1[5] + 8) + 40), *(void *)(*(void *)(a1[6] + 8) + 40));
}

- (void)_addPasswordsAutoFillSuggestionToSuggestions:(id)a3 forPurpose:(int64_t)a4
{
  self->_quickTypeBarTrailingButtonPurpose = a4;
  id v4 = (void *)MEMORY[0x1E4FB1478];
  id v5 = a3;
  id v6 = [v4 autofillExtrasSuggestion];
  [v5 addObject:v6];
}

- (void)_getMatchingKeychainCredentialsIncludingCredentialsWithEmptyUsernames:(BOOL)a3 withCompletion:(id)a4
{
  id v6 = a4;
  long long v7 = [(SFFormAutoFillFrameHandle *)self->_frame webui_URL];
  id v8 = [MEMORY[0x1E4F1CA48] array];
  long long v9 = [MEMORY[0x1E4F1CA48] array];
  __int16 v29 = 0;
  id v27 = 0;
  id v28 = 0;
  [(SFFormAutocompleteState *)self _getLoginFormUser:&v28 password:&v27 userIsAutoFilled:(char *)&v29 + 1 passwordIsAutoFilled:&v29];
  id v10 = v28;
  id v11 = v27;
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  void v18[2] = __112__SFFormAutocompleteState__getMatchingKeychainCredentialsIncludingCredentialsWithEmptyUsernames_withCompletion___block_invoke;
  v18[3] = &unk_1E5C75678;
  BOOL v26 = a3;
  id v19 = v8;
  id v20 = v9;
  id v21 = v7;
  uint64_t v22 = self;
  id v23 = v10;
  id v24 = v11;
  id v25 = v6;
  id v12 = v6;
  id v13 = v11;
  id v14 = v10;
  id v15 = v7;
  id v16 = v9;
  id v17 = v8;
  [(SFFormAutocompleteState *)self _fetchPotentialCredentialMatchesWithCompletion:v18];
}

void __112__SFFormAutocompleteState__getMatchingKeychainCredentialsIncludingCredentialsWithEmptyUsernames_withCompletion___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v17 = v3;
  if (!*(unsigned char *)(a1 + 88))
  {
    uint64_t v4 = objc_msgSend(v3, "safari_filterObjectsUsingBlock:", &__block_literal_global_236);

    id v17 = (id)v4;
  }
  uint64_t v5 = *(void *)(a1 + 32);
  uint64_t v6 = *(void *)(a1 + 40);
  uint64_t v7 = *(void *)(a1 + 48);
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 56) + 16));
  long long v9 = [WeakRetained webView];
  id v10 = objc_msgSend(v9, "webui_lastGeneratedPasswordForCurrentBackForwardItem");
  uint64_t v12 = *(void *)(a1 + 64);
  uint64_t v11 = *(void *)(a1 + 72);
  id v13 = [*(id *)(*(void *)(a1 + 56) + 224) passwordElementUniqueID];
  LOBYTE(v16) = [v13 length] == 0;
  +[SFFormAutocompleteState _getMatchesFromFormProtectionSpace:v5 matchesFromOtherProtectionSpaces:v6 withFormURL:v7 credentialMatches:v17 lastGeneratedPassword:v10 currentUser:v12 currentPassword:v11 forUserNamesOnly:v16];

  uint64_t v14 = *(void *)(a1 + 80);
  id v15 = [*(id *)(a1 + 32) arrayByAddingObjectsFromArray:*(void *)(a1 + 40)];
  (*(void (**)(uint64_t, void *))(v14 + 16))(v14, v15);
}

BOOL __112__SFFormAutocompleteState__getMatchingKeychainCredentialsIncludingCredentialsWithEmptyUsernames_withCompletion___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v2 = [a2 user];
  BOOL v3 = [v2 length] != 0;

  return v3;
}

- (id)_textSuggestionForCredentialDisplayData:(id)a3 submitForm:(BOOL)a4
{
  BOOL v4 = a4;
  id v5 = a3;
  uint64_t v6 = [v5 match];
  uint64_t v7 = +[_SFTextSuggestion textSuggestionWithSavedAccountMatch:v6 submitForm:v4];

  id v8 = [v5 match];
  long long v9 = [v8 user];
  id v10 = [v5 creationDate];
  uint64_t v11 = +[SFCredentialDisplayData descriptionForPasswordWithUser:v9 creationDate:v10];
  [v7 setDisplayText:v11];

  uint64_t v12 = [v5 detail];

  [v7 setHeaderText:v12];

  return v7;
}

- (void)showAllPasswordsButtonTapped
{
  int64_t quickTypeBarTrailingButtonPurpose = self->_quickTypeBarTrailingButtonPurpose;
  if (quickTypeBarTrailingButtonPurpose == 1)
  {
    [(SFFormAutocompleteState *)self _offerToAutoFillFromAvailableOneTimeCodes];
  }
  else if (!quickTypeBarTrailingButtonPurpose)
  {
    [(SFFormAutocompleteState *)self _offerToAutoFillFromPotentialCredentialMatches];
  }
}

- (BOOL)_hasMatchWithUser:(id)a3 password:(id)a4
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v18 = a3;
  id v6 = a4;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  id obj = [(SFFormAutocompleteState *)self _cachedPotentialCredentialMatches];
  uint64_t v7 = [obj countByEnumeratingWithState:&v19 objects:v23 count:16];
  if (v7)
  {
    uint64_t v8 = *(void *)v20;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v20 != v8) {
          objc_enumerationMutation(obj);
        }
        id v10 = *(id *)(*((void *)&v19 + 1) + 8 * i);
        id v11 = v18;
        id v12 = v6;
        id v13 = [v10 user];
        if (([v11 length] || objc_msgSend(v13, "length"))
          && ![v13 isEqualToString:v11])
        {
        }
        else
        {
          uint64_t v14 = [v10 password];
          char v15 = [v14 isEqualToString:v12];

          if (v15)
          {
            LOBYTE(v7) = 1;
            goto LABEL_14;
          }
        }
      }
      uint64_t v7 = [obj countByEnumeratingWithState:&v19 objects:v23 count:16];
    }
    while (v7);
  }
LABEL_14:

  return v7;
}

- (void)_getShouldOfferForgetPassword:(BOOL *)a3 savePassword:(BOOL *)a4
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_dataController);
  uint64_t v8 = [(SFFormAutoFillFrameHandle *)self->_frame webui_URL];
  char v9 = [WeakRetained shouldAllowPasswordAutoFillOnURL:v8 allowExternalCredentials:0];

  if (v9)
  {
    __int16 v19 = 0;
    id v17 = 0;
    id v18 = 0;
    [(SFFormAutocompleteState *)self _getLoginFormUser:&v18 password:&v17 userIsAutoFilled:(char *)&v19 + 1 passwordIsAutoFilled:&v19];
    id v10 = v18;
    id v11 = v17;
    if (!self->_hasDeterminedIfURLIsAllowedByWhiteList)
    {
      id v12 = [(SFFormAutoFillFrameHandle *)self->_frame webui_URL];
      self->_URLIsAllowedByWhiteList = [WeakRetained whiteListAllowsURL:v12];

      self->_hasDeterminedIfURLIsAllowedByWhiteList = 1;
    }
    BOOL v13 = (_BYTE)v19
       && (HIBYTE(v19) || ![v10 length])
       && [(SFFormAutocompleteState *)self _hasMatchWithUser:v10 password:v11];
    *a3 = v13;
    if (self->_URLIsAllowedByWhiteList
      && (v10 ? (BOOL v14 = HIBYTE(v19) == 0) : (BOOL v14 = 0), (v14 || !(_BYTE)v19) && [v11 length]))
    {
      char v15 = [(WBSFormControlMetadata *)self->_textFieldMetadata uniqueID];
      uint64_t v16 = [(WBSFormMetadata *)self->_formMetadata passwordElementUniqueID];
      *a4 = [v15 isEqualToString:v16];
    }
    else
    {
      *a4 = 0;
    }
  }
  else
  {
    *a3 = 0;
    *a4 = 0;
  }
}

- (void)_setUserAndPasswordFieldsAutoFilled:(BOOL)a3 clearPasswordField:(BOOL)a4
{
  BOOL v4 = a4;
  BOOL v5 = a3;
  id v12 = [MEMORY[0x1E4F1CA48] array];
  uint64_t v7 = [(WBSFormMetadata *)self->_formMetadata passwordElementUniqueID];
  if ([v7 length]) {
    [v12 addObject:v7];
  }
  uint64_t v8 = [(WBSFormMetadata *)self->_formMetadata userNameElementUniqueID];
  if ([v8 length]) {
    [v12 addObject:v8];
  }
  if ([v12 count])
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_autoFillController);
    id v10 = WeakRetained;
    if (v4) {
      id v11 = v7;
    }
    else {
      id v11 = 0;
    }
    [WeakRetained setFormControls:v12 areAutoFilled:v5 andClearField:v11 inFrame:self->_frame];
  }
}

- (BOOL)_shouldUsePasswordGenerationAssistanceForTextField
{
  if (self->_formMetadata
    && (unint64_t v3 = [(WBSFormControlMetadata *)self->_textFieldMetadata maxLength],
        v3 >= [MEMORY[0x1E4F98C90] minimumPasswordLength]))
  {
    id v6 = [(WBSFormControlMetadata *)self->_textFieldMetadata classification];
    int v4 = [v6 isEqualToString:*MEMORY[0x1E4F990F0]];

    if (v4)
    {
      id WeakRetained = objc_loadWeakRetained((id *)&self->_dataController);
      uint64_t v8 = [WeakRetained autoFillQuirksManager];
      char v9 = [v8 passwordGenerationManager];

      id v10 = [(SFFormAutoFillFrameHandle *)self->_frame webui_URL];
      id v11 = [v9 defaultRequirementsForURL:v10];

      if ([v9 passwordGenerationIsDisallowedByRequirements:v11])
      {
        id v12 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
        LOBYTE(v4) = [v12 BOOLForKey:@"WBUDebugOverridePasswordGenerationIsDisallowedByRequirements"];
      }
      else
      {
        LOBYTE(v4) = 1;
      }
    }
  }
  else
  {
    LOBYTE(v4) = 0;
  }
  return v4;
}

+ (BOOL)_shouldSaveCredentialsInProtectionSpace:(id)a3 savedAccountContext:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  uint64_t v13 = 0;
  BOOL v14 = &v13;
  uint64_t v15 = 0x2020000000;
  char v16 = 1;
  uint64_t v7 = (void *)MEMORY[0x1E4F98DF0];
  uint64_t v8 = objc_msgSend(v5, "safari_URL");
  char v9 = [v7 criteriaForExactFQDNPasswordMatchesOfURL:v8];

  objc_msgSend(v9, "setOptions:", objc_msgSend(v9, "options") | 4);
  [v9 setContext:v6];
  id v10 = [MEMORY[0x1E4F98DF8] sharedStore];
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __87__SFFormAutocompleteState__shouldSaveCredentialsInProtectionSpace_savedAccountContext___block_invoke;
  v12[3] = &unk_1E5C756A0;
  void v12[4] = &v13;
  [v10 getSavedAccountsMatchingCriteria:v9 withSynchronousCompletionHandler:v12];

  LOBYTE(v10) = *((unsigned char *)v14 + 24);
  _Block_object_dispose(&v13, 8);

  return (char)v10;
}

void __87__SFFormAutocompleteState__shouldSaveCredentialsInProtectionSpace_savedAccountContext___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  unint64_t v3 = objc_msgSend(a2, "exactMatches", 0);
  uint64_t v4 = [v3 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v12;
    while (2)
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v12 != v6) {
          objc_enumerationMutation(v3);
        }
        uint64_t v8 = [*(id *)(*((void *)&v11 + 1) + 8 * i) user];
        char v9 = [MEMORY[0x1E4F98B50] dontSaveMarker];
        int v10 = [v8 isEqualToString:v9];

        if (v10)
        {
          *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = 0;
          goto LABEL_11;
        }
      }
      uint64_t v5 = [v3 countByEnumeratingWithState:&v11 objects:v15 count:16];
      if (v5) {
        continue;
      }
      break;
    }
  }
LABEL_11:
}

- (BOOL)_passwordGenerationAssistanceAutoFillButtonEnabled
{
  unint64_t v3 = [(SFFormAutoFillFrameHandle *)self->_frame webui_URL];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_autoFillController);
  uint64_t v5 = objc_msgSend(MEMORY[0x1E4F18D98], "safari_HTMLFormProtectionSpaceForURL:", v3);
  uint64_t v6 = objc_opt_class();
  uint64_t v7 = [WeakRetained savedAccountContext];
  LODWORD(v6) = [v6 _shouldSaveCredentialsInProtectionSpace:v5 savedAccountContext:v7];

  if (!v6) {
    goto LABEL_4;
  }
  uint64_t v8 = objc_opt_class();
  id v9 = objc_loadWeakRetained((id *)&self->_dataController);
  int v10 = [v9 autoFillQuirksManager];
  long long v11 = [v10 passwordGenerationManager];
  long long v12 = [v11 protectionSpaceForGeneratedPasswordsInProtectionSpace:v5];
  long long v13 = [WeakRetained savedAccountContext];
  LODWORD(v8) = [v8 _shouldSaveCredentialsInProtectionSpace:v12 savedAccountContext:v13];

  if (v8) {
    int v14 = [(WBSFormMetadata *)self->_formMetadata usesRelAsync] ^ 1;
  }
  else {
LABEL_4:
  }
    LOBYTE(v14) = 0;

  return v14;
}

- (int64_t)_passwordGenerationAssistanceAction
{
  if ([(SFFormAutocompleteState *)self _passwordGenerationAssistanceAutoFillButtonEnabled])
  {
    return 7;
  }
  else
  {
    return 1;
  }
}

- (void)_generateAndSuggestPasswordWithCompletionHandler:(id)a3
{
  v30[1] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_autoFillController);
  id v25 = [WeakRetained webView];

  uint64_t v6 = [(WBSFormControlMetadata *)self->_textFieldMetadata maxLength];
  BOOL v26 = [(WBSFormMetadata *)self->_formMetadata passwordRequirements];
  id v7 = objc_loadWeakRetained((id *)&self->_dataController);
  uint64_t v8 = [(SFFormAutoFillFrameHandle *)self->_frame webui_URL];
  id v9 = [v7 autoGeneratedPasswordForURL:v8 respectingPasswordRequirements:v26 maxLength:v6];

  int v10 = NSString;
  if (_SFDeviceIsPad()) {
    long long v11 = @"%@\n%@";
  }
  else {
    long long v11 = @"%@\n\n%@";
  }
  long long v12 = _WBSLocalizedString();
  long long v13 = objc_msgSend(v10, "stringWithFormat:", v11, v12, v9);

  int v14 = NSString;
  if (_SFDeviceIsPad()) {
    uint64_t v15 = @"\n%@";
  }
  else {
    uint64_t v15 = @"%@";
  }
  uint64_t v16 = _WBSLocalizedString();
  id v17 = objc_msgSend(v14, "stringWithFormat:", v15, v16);

  id v18 = _WBSLocalizedString();
  __int16 v19 = _WBSLocalizedString();
  long long v20 = (void *)MEMORY[0x1E4FB6EE8];
  v30[0] = v19;
  long long v21 = [MEMORY[0x1E4F1C978] arrayWithObjects:v30 count:1];
  v27[0] = MEMORY[0x1E4F143A8];
  v27[1] = 3221225472;
  v27[2] = __76__SFFormAutocompleteState__generateAndSuggestPasswordWithCompletionHandler___block_invoke;
  v27[3] = &unk_1E5C756C8;
  id v28 = v9;
  id v29 = v4;
  id v22 = v9;
  id v23 = v4;
  LOBYTE(v24) = 1;
  [v20 showAutoFillPromptInWebView:v25 title:v13 message:v17 cancelButtonTitle:v18 otherButtonTitles:v21 cancelWhenAppEntersBackground:1 makeFirstButtonSuggestedAction:v24 headerViewController:0 completionHandler:v27];
}

void __76__SFFormAutocompleteState__generateAndSuggestPasswordWithCompletionHandler___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 40);
  if (a2) {
    uint64_t v4 = 0;
  }
  else {
    uint64_t v4 = *(void *)(a1 + 32);
  }
  BOOL v5 = a2 == 0;
  (*(void (**)(uint64_t, uint64_t))(v3 + 16))(v3, v4);
  id v6 = [MEMORY[0x1E4F98948] sharedLogger];
  [v6 didShowPasswordGenerationPromptWithPasswordAccepted:v5];
}

- (void)_suggestPasswordForNewAccountOrChangePasswordForm
{
  v2[0] = MEMORY[0x1E4F143A8];
  v2[1] = 3221225472;
  v2[2] = __76__SFFormAutocompleteState__suggestPasswordForNewAccountOrChangePasswordForm__block_invoke;
  v2[3] = &unk_1E5C756F0;
  v2[4] = self;
  [(SFFormAutocompleteState *)self _generateAndSuggestPasswordWithCompletionHandler:v2];
}

void __76__SFFormAutocompleteState__suggestPasswordForNewAccountOrChangePasswordForm__block_invoke(uint64_t a1, void *a2)
{
  id v4 = a2;
  if ([v4 length])
  {
    id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 16));
    objc_msgSend(WeakRetained, "autoFillForm:inFrame:withGeneratedPassword:", objc_msgSend(*(id *)(*(void *)(a1 + 32) + 224), "uniqueID"), *(void *)(*(void *)(a1 + 32) + 216), v4);
  }
}

- (BOOL)_shouldAllowGeneratedPassword
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_dataController);
  id v4 = [(SFFormAutoFillFrameHandle *)self->_frame webui_URL];
  if ([(SFFormAutocompleteState *)self _textFieldIsEmptyPasswordField]
    && (id v5 = objc_loadWeakRetained((id *)&self->_autoFillController),
        [v5 webView],
        id v6 = objc_claimAutoreleasedReturnValue(),
        int v7 = [WeakRetained shouldAutoGeneratePasswordsForURL:v4 inWebView:v6],
        v6,
        v5,
        v7))
  {
    uint64_t v8 = [WeakRetained autoFillQuirksManager];
    id v9 = [v8 passwordGenerationManager];

    int v10 = [v9 defaultRequirementsForURL:v4];
    int v11 = [v9 manualPasswordGenerationIsDisallowedByRequirements:v10] ^ 1;
  }
  else
  {
    LOBYTE(v11) = 0;
  }

  return v11;
}

- (BOOL)shouldOfferToAutoFillCreditCardData
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_dataController);
  if ([WeakRetained mayFillCreditCardDataInFrame:self->_frame]) {
    char v4 = [MEMORY[0x1E4FB6EF0] textFieldLooksLikeCreditCardFormField:self->_textFieldMetadata inForm:self->_formMetadata];
  }
  else {
    char v4 = 0;
  }

  return v4;
}

- (BOOL)currentTextFieldLooksLikeCardSecurityCodeFieldButNotCardNumberOrCardholderField
{
  if ([(WBSFormControlMetadata *)self->_textFieldMetadata looksLikeCreditCardNumberField] & 1) != 0|| ([(WBSFormControlMetadata *)self->_textFieldMetadata looksLikeCreditCardCardholderField])
  {
    return 0;
  }
  textFieldMetadata = self->_textFieldMetadata;

  return [(WBSFormControlMetadata *)textFieldMetadata looksLikeCreditCardSecurityCodeField];
}

- (BOOL)_shouldOfferCreditCardDataAfterUserHasFilledCreditCardData:(id)a3
{
  id v4 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_autoFillController);
  id v6 = [WeakRetained lastFilledCreditCardData];

  if (v6)
  {
    id v7 = objc_loadWeakRetained((id *)&self->_dataController);
    if ([v7 shouldAutoFillFromCreditCardData]
      && [v7 mayFillCreditCardDataInFrame:self->_frame])
    {
      if ([MEMORY[0x1E4FB6EF0] isFieldUnidentified:v4]) {
        char v8 = 1;
      }
      else {
        char v8 = [MEMORY[0x1E4FB6EF0] textFieldLooksLikeCreditCardFormField:self->_textFieldMetadata inForm:self->_formMetadata];
      }
    }
    else
    {
      char v8 = 0;
    }
  }
  else
  {
    char v8 = 0;
  }

  return v8;
}

- (id)_sortedSingleCreditCardDataArray:(id)a3
{
  id v4 = a3;
  id v5 = (void *)MEMORY[0x1E4F1CAD0];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_autoFillController);
  id v7 = [WeakRetained lastFilledCreditCardDataTypes];
  char v8 = [v7 allValues];
  id v9 = [v5 setWithArray:v8];

  if (v9)
  {
    int v10 = [MEMORY[0x1E4F1CA48] array];
    int v11 = [MEMORY[0x1E4F1CA48] array];
    v16[0] = MEMORY[0x1E4F143A8];
    v16[1] = 3221225472;
    v16[2] = __60__SFFormAutocompleteState__sortedSingleCreditCardDataArray___block_invoke;
    v16[3] = &unk_1E5C75718;
    id v17 = v9;
    id v18 = v11;
    id v19 = v10;
    id v12 = v10;
    id v13 = v11;
    [v4 enumerateObjectsUsingBlock:v16];
    id v14 = [v12 arrayByAddingObjectsFromArray:v13];
  }
  else
  {
    id v14 = v4;
  }

  return v14;
}

void __60__SFFormAutocompleteState__sortedSingleCreditCardDataArray___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3 = *(void **)(a1 + 32);
  id v4 = NSNumber;
  id v7 = a2;
  id v5 = objc_msgSend(v4, "numberWithInteger:", objc_msgSend(v7, "type"));
  LODWORD(v3) = [v3 containsObject:v5];

  uint64_t v6 = 48;
  if (v3) {
    uint64_t v6 = 40;
  }
  [*(id *)(a1 + v6) addObject:v7];
}

- (void)_showCreditCardDataSuggestionsAfterUserHasFilledCreditCardData
{
  uint64_t v55 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = [MEMORY[0x1E4F1CA48] array];
  id v49 = self;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_autoFillController);
  id v4 = [WeakRetained lastFilledCreditCardData];
  id v5 = [v4 cardNumber];
  if ([v5 length])
  {
    if ([v4 isVirtualCard])
    {
      uint64_t v6 = [v4 virtualCard];
      id v7 = [v6 displayablePANSuffix];
      char v8 = WBSDisplayTextForCreditCardNumber();
    }
    else
    {
      char v8 = WBSDisplayTextForCreditCardNumber();
    }
    id v9 = [SFSingleCreditCardData alloc];
    int v10 = _WBSLocalizedString();
    int v11 = [(SFSingleCreditCardData *)v9 initWithHeaderText:v10 displayText:v8 type:0 value:v5];
    [v3 addObject:v11];
  }
  id v12 = [v4 cardSecurityCode];
  if ([v12 length])
  {
    id v13 = [SFSingleCreditCardData alloc];
    id v14 = _WBSLocalizedString();
    uint64_t v15 = objc_msgSend(&stru_1EFB97EB8, "stringByPaddingToLength:withString:startingAtIndex:", objc_msgSend(v12, "length"), @"•", 0);
    uint64_t v16 = [(SFSingleCreditCardData *)v13 initWithHeaderText:v14 displayText:v15 type:1 value:v12];
    [v3 addObject:v16];
  }
  uint64_t v44 = v12;
  id v17 = [v4 expirationDate];
  if (v17)
  {
    id v18 = objc_alloc_init(MEMORY[0x1E4F28C10]);
    [v18 setDateFormat:@"MM/yy"];
    id v19 = [SFSingleCreditCardData alloc];
    long long v20 = _WBSLocalizedString();
    long long v21 = [v18 stringFromDate:v17];
    id v22 = [(SFSingleCreditCardData *)v19 initWithHeaderText:v20 displayText:v21 type:2 value:v17];
    [v3 addObject:v22];
  }
  id v23 = [v4 cardholderName];
  if ([v23 length])
  {
    uint64_t v24 = [SFSingleCreditCardData alloc];
    id v25 = _WBSLocalizedString();
    BOOL v26 = [(SFSingleCreditCardData *)v24 initWithHeaderText:v25 displayText:v23 type:3 value:v23];
    [v3 addObject:v26];
  }
  if ([v5 length])
  {
    WBSCreditCardTypeFromNumber();
    id v27 = WBSCreditCardTypeLocalizedName();
    if ([v27 length])
    {
      id v28 = [SFSingleCreditCardData alloc];
      id v29 = _WBSLocalizedString();
      uint64_t v30 = [(SFSingleCreditCardData *)v28 initWithHeaderText:v29 displayText:v27 type:4 value:v5];
      [v3 addObject:v30];
    }
  }
  uint64_t v45 = v5;
  id v46 = v4;
  uint64_t v48 = v3;
  uint64_t v31 = [(SFFormAutocompleteState *)v49 _sortedSingleCreditCardDataArray:v3];
  uint64_t v32 = [MEMORY[0x1E4F1CA48] array];
  long long v50 = 0u;
  long long v51 = 0u;
  long long v52 = 0u;
  long long v53 = 0u;
  id v33 = v31;
  uint64_t v34 = [v33 countByEnumeratingWithState:&v50 objects:v54 count:16];
  if (v34)
  {
    uint64_t v35 = v34;
    uint64_t v36 = *(void *)v51;
LABEL_18:
    uint64_t v37 = 0;
    while (1)
    {
      if (*(void *)v51 != v36) {
        objc_enumerationMutation(v33);
      }
      uint64_t v38 = *(void **)(*((void *)&v50 + 1) + 8 * v37);
      if ((unint64_t)[v32 count] > 1) {
        break;
      }
      uint64_t v39 = +[_SFTextSuggestion textSuggestionWithSingleCreditCardDataValue:v38];
      int v40 = [v38 displayText];
      [v39 setDisplayText:v40];

      uint64_t v41 = [v38 headerText];
      [v39 setHeaderText:v41];

      [v32 addObject:v39];
      if (v35 == ++v37)
      {
        uint64_t v35 = [v33 countByEnumeratingWithState:&v50 objects:v54 count:16];
        if (v35) {
          goto LABEL_18;
        }
        break;
      }
    }
  }

  if ([v32 count])
  {
    uint64_t v42 = [(WBSFormControlMetadata *)v49->_textFieldMetadata uniqueID];
    [WeakRetained reportAutoFillOfferedType:3 forTextFieldWithID:v42 forFormMetadata:v49->_formMetadata];
  }
  id v43 = [(_SFFormAutoFillInputSession *)v49->_inputSession formInputSession];
  [v43 setSuggestions:v32];
}

- (void)_fillCreditCardDataAfterAuthenticationIfNeeded:(id)a3
{
  id v4 = a3;
  previouslySelectedVirtualCardWhereUserRequestedToIncreaseBalance = self->_previouslySelectedVirtualCardWhereUserRequestedToIncreaseBalance;
  self->_previouslySelectedVirtualCardWhereUserRequestedToIncreaseBalance = 0;

  if ([v4 isCardBalanceZeroOrNegative])
  {
    [(SFFormAutocompleteState *)self _presentLowBalanceAppleCashAlertForCard:v4];
  }
  else
  {
    uint64_t v6 = [v4 virtualCard];
    if (v6)
    {
      id v7 = [MEMORY[0x1E4FB6ED8] sharedCreditCardDataController];
      if ([v7 authenticationRequiredForVirtualCard:v6]) {
        uint64_t v8 = 4;
      }
      else {
        uint64_t v8 = 3;
      }
    }
    else
    {
      uint64_t v8 = 2;
    }
    id WeakRetained = objc_loadWeakRetained((id *)&self->_autoFillController);
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __74__SFFormAutocompleteState__fillCreditCardDataAfterAuthenticationIfNeeded___block_invoke;
    v10[3] = &unk_1E5C75740;
    v10[4] = self;
    id v11 = v4;
    [WeakRetained authenticateIfNeededForAutoFillAuthenticationType:v8 user:0 shouldForceAuthentication:0 withCompletion:v10];
  }
}

uint64_t __74__SFFormAutocompleteState__fillCreditCardDataAfterAuthenticationIfNeeded___block_invoke(uint64_t result, int a2)
{
  if (a2) {
    return [*(id *)(result + 32) _fillCreditCardData:*(void *)(result + 40)];
  }
  return result;
}

- (void)_fillSingleCreditCardDataValue:(id)a3 creditCardDataType:(int64_t)a4
{
  uint64_t v44 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_autoFillController);
  unint64_t v8 = 0x1E4F98000uLL;
  uint64_t v36 = v6;
  id v9 = (void *)[objc_alloc(MEMORY[0x1E4F98E48]) initWithValue:v6 type:a4];
  int v10 = [WeakRetained lastFilledCreditCardData];
  objc_msgSend(v9, "setIsVirtualCard:", objc_msgSend(v10, "isVirtualCard"));

  id v11 = objc_loadWeakRetained((id *)&self->_dataController);
  id v41 = 0;
  id v42 = 0;
  [v11 getFormFieldValues:&v42 andFieldToFocus:&v41 withSingleCreditCardData:v9 inField:self->_textFieldMetadata inForm:self->_formMetadata];
  id v12 = v42;
  id v34 = v41;

  id v13 = [MEMORY[0x1E4FB6ED8] sharedCreditCardDataController];
  uint64_t v35 = v9;
  id v33 = [v13 fieldsToObscureWhenFillingSingleCreditCardData:v9 formFieldValues:v12];

  id v14 = [WeakRetained lastFilledCreditCardDataTypes];
  uint64_t v15 = [(WBSFormControlMetadata *)self->_textFieldMetadata uniqueID];
  uint64_t v16 = [v14 objectForKeyedSubscript:v15];
  if (v16)
  {
    [WeakRetained lastFilledCreditCardDataTypes];
    id v32 = v12;
    v18 = int64_t v17 = a4;
    id v19 = [(WBSFormControlMetadata *)self->_textFieldMetadata uniqueID];
    long long v20 = [v18 objectForKeyedSubscript:v19];
    uint64_t v21 = [v20 integerValue];

    unint64_t v8 = 0x1E4F98000;
    a4 = v17;
    id v12 = v32;
  }
  else
  {
    uint64_t v21 = 5;
  }

  uint64_t v22 = [MEMORY[0x1E4F98B60] formFieldTypeForFormControlMetadata:self->_textFieldMetadata formMetadata:self->_formMetadata];
  id v23 = [MEMORY[0x1E4F98948] sharedLogger];
  uint64_t v24 = [*(id *)(v8 + 3656) stringForSingleCreditCardDataType:a4];
  id v25 = [*(id *)(v8 + 3656) stringForSingleCreditCardDataType:v21];
  [v23 didUseCreditCardAutoFillEscapeHatchFillingNewType:v24 forPreviousType:v25 fieldType:v22];

  long long v39 = 0u;
  long long v40 = 0u;
  long long v37 = 0u;
  long long v38 = 0u;
  BOOL v26 = [v12 allKeys];
  uint64_t v27 = [v26 countByEnumeratingWithState:&v37 objects:v43 count:16];
  if (v27)
  {
    uint64_t v28 = v27;
    uint64_t v29 = *(void *)v38;
    do
    {
      for (uint64_t i = 0; i != v28; ++i)
      {
        if (*(void *)v38 != v29) {
          objc_enumerationMutation(v26);
        }
        [WeakRetained reportAutoFillOfferedType:3 forTextFieldWithID:*(void *)(*((void *)&v37 + 1) + 8 * i) forFormMetadata:self->_formMetadata];
      }
      uint64_t v28 = [v26 countByEnumeratingWithState:&v37 objects:v43 count:16];
    }
    while (v28);
  }

  LOBYTE(v31) = 0;
  [WeakRetained autoFillFormInFrame:self->_frame withValues:v12 setAutoFilled:1 focusFieldAfterFilling:0 fieldToFocus:v34 fieldsToObscure:v33 submitForm:v31];
}

- (BOOL)_canAutoFillCreditCardData
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_dataController);
  if ([WeakRetained shouldAutoFillFromCreditCardData]) {
    BOOL v4 = self->_formMetadata != 0;
  }
  else {
    BOOL v4 = 0;
  }

  return v4;
}

- (void)_updateAutoFillActionToCaptureCreditCardAndFill
{
  if (+[_SFCreditCardCaptureViewController canCapture])
  {
    self->_int64_t action = 6;
    [(SFFormAutocompleteState *)self updateAutoFillButton];
  }
}

- (void)_updateCreditCardAutoFillAction
{
  objc_initWeak(&location, self);
  uint64_t v3 = [MEMORY[0x1E4FB6ED8] sharedCreditCardDataController];
  BOOL v4 = [(SFFormAutocompleteState *)self currentTextFieldLooksLikeCardSecurityCodeFieldButNotCardNumberOrCardholderField];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __58__SFFormAutocompleteState__updateCreditCardAutoFillAction__block_invoke;
  v6[3] = &unk_1E5C75790;
  objc_copyWeak(&v8, &location);
  id v5 = v3;
  id v7 = v5;
  BOOL v9 = v4;
  [v5 getCreditCardDataWithCompletionHandler:v6];

  objc_destroyWeak(&v8);
  objc_destroyWeak(&location);
}

void __58__SFFormAutocompleteState__updateCreditCardAutoFillAction__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __58__SFFormAutocompleteState__updateCreditCardAutoFillAction__block_invoke_2;
  v5[3] = &unk_1E5C75768;
  objc_copyWeak(&v8, (id *)(a1 + 40));
  id v6 = v3;
  id v7 = *(id *)(a1 + 32);
  char v9 = *(unsigned char *)(a1 + 48);
  id v4 = v3;
  dispatch_async(MEMORY[0x1E4F14428], v5);

  objc_destroyWeak(&v8);
}

void __58__SFFormAutocompleteState__updateCreditCardAutoFillAction__block_invoke_2(uint64_t a1)
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 48));
  if (WeakRetained)
  {
    long long v24 = 0u;
    long long v25 = 0u;
    long long v22 = 0u;
    long long v23 = 0u;
    id obj = *(id *)(a1 + 32);
    uint64_t v2 = [obj countByEnumeratingWithState:&v22 objects:v26 count:16];
    if (v2)
    {
      uint64_t v3 = v2;
      uint64_t v4 = *(void *)v23;
      id v5 = WeakRetained + 3;
      uint64_t v18 = *(void *)v23;
      while (2)
      {
        for (uint64_t i = 0; i != v3; ++i)
        {
          if (*(void *)v23 != v4) {
            objc_enumerationMutation(obj);
          }
          id v7 = *(void **)(*((void *)&v22 + 1) + 8 * i);
          id v8 = objc_loadWeakRetained(v5);
          id v21 = 0;
          [v8 getFormFieldValues:&v21 andFieldToFocus:0 andCreditCardDataTypesThatWillBeFilled:0 forCreditCardForm:WeakRetained[28] fromCreditCardData:v7];
          id v9 = v21;

          if ([v9 count] && (objc_msgSend(v7, "shouldHide") & 1) == 0)
          {
            int v10 = [v7 cardSecurityCode];
            if ([v10 length])
            {

LABEL_19:
              WeakRetained[1] = (id)3;
              objc_msgSend(WeakRetained, "updateAutoFillButton", v18);

              goto LABEL_20;
            }
            id v11 = [v7 virtualCard];
            if (v11)
            {
              id v12 = v5;
              id v13 = *(void **)(a1 + 40);
              [v7 virtualCard];
              v15 = id v14 = WeakRetained;
              uint64_t v16 = v13;
              id v5 = v12;
              char v17 = [v16 authenticationRequiredForVirtualCard:v15];

              id WeakRetained = v14;
              uint64_t v4 = v18;
            }
            else
            {
              char v17 = 0;
            }

            if (!*(unsigned char *)(a1 + 56) || (v17 & 1) != 0) {
              goto LABEL_19;
            }
          }
        }
        uint64_t v3 = [obj countByEnumeratingWithState:&v22 objects:v26 count:16];
        if (v3) {
          continue;
        }
        break;
      }
    }

    [WeakRetained _updateAutoFillActionToCaptureCreditCardAndFill];
  }
LABEL_20:
}

- (void)_fillCreditCardData:(id)a3
{
  p_autoFillController = &self->_autoFillController;
  id v5 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)p_autoFillController);
  [WeakRetained fillCreditCardData:v5 inFrame:self->_frame textFieldMetadata:self->_textFieldMetadata formMetadata:self->_formMetadata];
}

- (void)_presentLowBalanceAppleCashAlertForCard:(id)a3
{
  id v4 = a3;
  id v5 = _WBSLocalizedString();
  id v6 = NSString;
  id v7 = _WBSLocalizedString();
  id v8 = [v4 balance];
  id v9 = [v8 formattedStringValue];
  int v10 = objc_msgSend(v6, "localizedStringWithFormat:", v7, v9);

  id v11 = [MEMORY[0x1E4FB1418] alertControllerWithTitle:v5 message:v10 preferredStyle:1];
  id v12 = [v11 view];
  [v12 setAccessibilityIdentifier:@"ConfirmYourCardPrompt"];

  id v13 = (void *)MEMORY[0x1E4FB1410];
  id v14 = _WBSLocalizedString();
  uint64_t v15 = [v13 actionWithTitle:v14 style:0 handler:0];

  [v15 setAccessibilityIdentifier:@"ChooseDifferentCardButton"];
  uint64_t v16 = (void *)MEMORY[0x1E4FB1410];
  char v17 = _WBSLocalizedString();
  v21[0] = MEMORY[0x1E4F143A8];
  v21[1] = 3221225472;
  v21[2] = __67__SFFormAutocompleteState__presentLowBalanceAppleCashAlertForCard___block_invoke;
  v21[3] = &unk_1E5C72448;
  void v21[4] = self;
  id v22 = v4;
  id v18 = v4;
  id v19 = [v16 actionWithTitle:v17 style:0 handler:v21];

  [v19 setAccessibilityIdentifier:@"AddMoneyButton"];
  [v11 addAction:v15];
  [v11 addAction:v19];
  [v11 setPreferredAction:v15];
  long long v20 = [(SFFormAutocompleteState *)self _viewControllerToPresentFrom];
  [v20 presentViewController:v11 animated:1 completion:0];
}

void __67__SFFormAutocompleteState__presentLowBalanceAppleCashAlertForCard___block_invoke(uint64_t a1)
{
  PKPeerPaymentGetTopUpSensitiveURL();
  id v3 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v2 = [MEMORY[0x1E4F223E0] defaultWorkspace];
  [v2 openSensitiveURL:v3 withOptions:0];

  objc_storeStrong((id *)(*(void *)(a1 + 32) + 240), *(id *)(a1 + 40));
}

- (void)presentUnavailableVirtualCardAlert
{
  id v10 = [MEMORY[0x1E4FB6ED8] sharedCreditCardDataController];
  id v3 = [v10 titleForUnavailableVirtualCardAlert];
  id v4 = [v10 messageForUnavailableVirtualCardAlert];
  id v5 = [MEMORY[0x1E4FB1418] alertControllerWithTitle:v3 message:v4 preferredStyle:1];
  id v6 = (void *)MEMORY[0x1E4FB1410];
  id v7 = _WBSLocalizedString();
  id v8 = [v6 actionWithTitle:v7 style:1 handler:0];
  [v5 addAction:v8];

  id v9 = [(SFFormAutocompleteState *)self _viewControllerToPresentFrom];
  [(SFFormAutocompleteState *)self _presentViewController:v5 presentingViewController:v9 animated:1 completion:0];
}

- (void)presentCustomizeStrongPasswordAlert
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_autoFillController);
  id v4 = [(SFFormAutoFillFrameHandle *)self->_frame webui_URL];
  id v5 = [v4 host];
  long long v25 = objc_msgSend(v5, "safari_domainFromHost");

  id v6 = NSString;
  id v7 = _WBSLocalizedString();
  long long v24 = objc_msgSend(v6, "stringWithFormat:", v7, v25);

  id v8 = [MEMORY[0x1E4FB1418] alertControllerWithTitle:v24 message:0 preferredStyle:0];
  id v9 = (void *)MEMORY[0x1E4FB1410];
  id v10 = _WBSLocalizedString();
  v29[0] = MEMORY[0x1E4F143A8];
  v29[1] = 3221225472;
  void v29[2] = __62__SFFormAutocompleteState_presentCustomizeStrongPasswordAlert__block_invoke;
  v29[3] = &unk_1E5C72448;
  id v11 = WeakRetained;
  id v30 = v11;
  uint64_t v31 = self;
  id v12 = [v9 actionWithTitle:v10 style:0 handler:v29];

  id v13 = (void *)MEMORY[0x1E4FB1410];
  id v14 = _WBSLocalizedString();
  v26[0] = MEMORY[0x1E4F143A8];
  v26[1] = 3221225472;
  v26[2] = __62__SFFormAutocompleteState_presentCustomizeStrongPasswordAlert__block_invoke_2;
  v26[3] = &unk_1E5C72448;
  id v27 = v11;
  uint64_t v28 = self;
  id v23 = v11;
  uint64_t v15 = [v13 actionWithTitle:v14 style:0 handler:v26];

  uint64_t v16 = (void *)MEMORY[0x1E4FB1410];
  char v17 = _WBSLocalizedString();
  id v18 = [v16 actionWithTitle:v17 style:0 handler:&__block_literal_global_354];

  id v19 = (void *)MEMORY[0x1E4FB1410];
  long long v20 = _WBSLocalizedString();
  id v21 = [v19 actionWithTitle:v20 style:1 handler:0];

  [v8 addAction:v12];
  [v8 addAction:v15];
  [v8 addAction:v18];
  [v8 addAction:v21];
  id v22 = [(SFFormAutocompleteState *)self _viewControllerToPresentFrom];
  [v22 presentViewController:v8 animated:1 completion:0];
}

void __62__SFFormAutocompleteState_presentCustomizeStrongPasswordAlert__block_invoke(uint64_t a1)
{
  id v3 = [*(id *)(a1 + 32) automaticPasswordForPasswordField:*(void *)(*(void *)(a1 + 40) + 232) inForm:*(void *)(*(void *)(a1 + 40) + 224) isFrame:*(void *)(*(void *)(a1 + 40) + 216)];
  objc_msgSend(*(id *)(a1 + 32), "autoFillForm:inFrame:withGeneratedPassword:", objc_msgSend(*(id *)(*(void *)(a1 + 40) + 224), "uniqueID"), *(void *)(*(void *)(a1 + 40) + 216), v3);
  [*(id *)(a1 + 32) makeStrongPasswordFieldViewableAndEditable:1];
  uint64_t v2 = [MEMORY[0x1E4F98948] sharedLogger];
  [v2 didSelectNewStrongPassword];
}

void __62__SFFormAutocompleteState_presentCustomizeStrongPasswordAlert__block_invoke_2(uint64_t a1)
{
  id v3 = [*(id *)(a1 + 32) alphanumericStrongPassword];
  objc_msgSend(*(id *)(a1 + 32), "autoFillForm:inFrame:withGeneratedPassword:", objc_msgSend(*(id *)(*(void *)(a1 + 40) + 224), "uniqueID"), *(void *)(*(void *)(a1 + 40) + 216), v3);
  [*(id *)(a1 + 32) makeStrongPasswordFieldViewableAndEditable:1];
  uint64_t v2 = [MEMORY[0x1E4F98948] sharedLogger];
  [v2 didChooseStrongPasswordWithoutSpecialCharacters];
}

void __62__SFFormAutocompleteState_presentCustomizeStrongPasswordAlert__block_invoke_3()
{
  id v1 = [MEMORY[0x1E4F223E0] defaultWorkspace];
  v0 = [MEMORY[0x1E4F98240] passwordManagerURL];
  [v1 openSensitiveURL:v0 withOptions:0];
}

- (void)captureCreditCardDataWithCameraAndFill
{
  objc_initWeak(&location, self);
  id WeakRetained = objc_loadWeakRetained((id *)&self->_autoFillController);
  id v4 = [WeakRetained webView];
  id v5 = objc_msgSend(v4, "webui_preventNavigationDuringAutoFillPrompt");
  id v6 = v4;
  id v7 = v6;
  if (v6)
  {
    id v8 = v6;
    do
    {
      id v9 = [MEMORY[0x1E4FB1EC0] viewControllerForView:v8];
      id v10 = [v8 superview];

      if (!v10) {
        break;
      }
      id v8 = v10;
    }
    while (!v9);
  }
  else
  {
    id v9 = 0;
  }
  v19[0] = MEMORY[0x1E4F143A8];
  v19[1] = 3221225472;
  v19[2] = __65__SFFormAutocompleteState_captureCreditCardDataWithCameraAndFill__block_invoke;
  v19[3] = &unk_1E5C757E0;
  id v11 = v9;
  id v20 = v11;
  id v12 = v5;
  id v21 = v12;
  objc_copyWeak(&v22, &location);
  id v13 = (void *)[v19 copy];
  id creditCardCaptureCompletionHandler = self->_creditCardCaptureCompletionHandler;
  self->_id creditCardCaptureCompletionHandler = v13;

  uint64_t v15 = objc_alloc_init(_SFCreditCardCaptureViewController);
  [(_SFCreditCardCaptureViewController *)v15 setDelegate:self];
  [WeakRetained suppressSoftwareKeyboardOnWebView:1];
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __65__SFFormAutocompleteState_captureCreditCardDataWithCameraAndFill__block_invoke_3;
  v17[3] = &unk_1E5C724D8;
  id v16 = WeakRetained;
  id v18 = v16;
  [(SFFormAutocompleteState *)self _presentViewController:v15 presentingViewController:v11 animated:1 completion:v17];

  objc_destroyWeak(&v22);
  objc_destroyWeak(&location);
}

void __65__SFFormAutocompleteState_captureCreditCardDataWithCameraAndFill__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __65__SFFormAutocompleteState_captureCreditCardDataWithCameraAndFill__block_invoke_2;
  v6[3] = &unk_1E5C757B8;
  id v4 = *(void **)(a1 + 32);
  id v8 = *(id *)(a1 + 40);
  id v5 = v3;
  id v7 = v5;
  objc_copyWeak(&v9, (id *)(a1 + 48));
  [v4 dismissViewControllerAnimated:1 completion:v6];
  objc_destroyWeak(&v9);
}

void __65__SFFormAutocompleteState_captureCreditCardDataWithCameraAndFill__block_invoke_2(uint64_t a1)
{
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  uint64_t v2 = [*(id *)(a1 + 32) cardNumber];
  uint64_t v3 = [v2 length];

  if (v3)
  {
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
    [WeakRetained _fillCreditCardData:*(void *)(a1 + 32)];
  }
}

uint64_t __65__SFFormAutocompleteState_captureCreditCardDataWithCameraAndFill__block_invoke_3(uint64_t a1)
{
  return [*(id *)(a1 + 32) suppressSoftwareKeyboardOnWebView:0];
}

- (void)_autoFillSingleCreditCardData:(int64_t)a3
{
  objc_initWeak(location, self);
  id WeakRetained = objc_loadWeakRetained((id *)&self->_autoFillController);
  id v6 = [MEMORY[0x1E4F1CA48] array];
  id v7 = [WeakRetained lastFilledCreditCardData];
  id v8 = [v7 cardNumber];
  id v9 = v8;
  if (a3 && [v8 length])
  {
    id v10 = WeakRetained;
    id v11 = _WBSLocalizedString();
    id v12 = [[SFSingleCreditCardData alloc] initWithHeaderText:0 displayText:v11 type:0 value:v9];
    [v6 addObject:v12];

    id WeakRetained = v10;
  }
  id v13 = [v7 cardSecurityCode];
  id v14 = v13;
  if (a3 && [v13 length])
  {
    uint64_t v15 = v14;
    id v16 = _WBSLocalizedString();
    char v17 = [[SFSingleCreditCardData alloc] initWithHeaderText:0 displayText:v16 type:1 value:v14];
    [v6 addObject:v17];

    id v14 = v15;
  }
  id v34 = [v7 expirationDate];
  if (v34)
  {
    id v18 = objc_alloc_init(MEMORY[0x1E4F28C10]);
    [v18 setDateFormat:@"MM/yy"];
    id v19 = _WBSLocalizedString();
    id v20 = [[SFSingleCreditCardData alloc] initWithHeaderText:0 displayText:v19 type:2 value:v34];
    [v6 addObject:v20];
  }
  id v21 = [v7 cardholderName];
  id v22 = v21;
  if (a3 && [v21 length])
  {
    id v23 = _WBSLocalizedString();
    long long v24 = [[SFSingleCreditCardData alloc] initWithHeaderText:0 displayText:v23 type:3 value:v22];
    [v6 addObject:v24];
  }
  if ([v9 length])
  {
    WBSCreditCardTypeFromNumber();
    long long v25 = WBSCreditCardTypeLocalizedName();
    if ([v25 length])
    {
      BOOL v26 = _WBSLocalizedString();
      id v27 = [[SFSingleCreditCardData alloc] initWithHeaderText:0 displayText:v26 type:4 value:v9];
      [v6 addObject:v27];
    }
  }
  if ([v6 count] == 1)
  {
    id v28 = [v6 firstObject];
    id v29 = [v28 value];
    -[SFFormAutocompleteState _fillSingleCreditCardDataValue:creditCardDataType:](self, "_fillSingleCreditCardDataValue:creditCardDataType:", v29, [v28 type]);
  }
  else
  {
    id v30 = [(SFFormAutocompleteState *)self _sortedSingleCreditCardDataArray:v6];
    uint64_t v31 = [MEMORY[0x1E4F1CA48] arrayWithCapacity:5];
    v41[0] = MEMORY[0x1E4F143A8];
    v41[1] = 3221225472;
    v41[2] = __57__SFFormAutocompleteState__autoFillSingleCreditCardData___block_invoke;
    v41[3] = &unk_1E5C75808;
    id v32 = v31;
    id v42 = v32;
    [v30 enumerateObjectsUsingBlock:v41];
    id v33 = [MEMORY[0x1E4FB6ED8] sharedCreditCardDataController];
    v35[0] = MEMORY[0x1E4F143A8];
    v35[1] = 3221225472;
    v35[2] = __57__SFFormAutocompleteState__autoFillSingleCreditCardData___block_invoke_2;
    v35[3] = &unk_1E5C75880;
    v35[4] = self;
    id v36 = v7;
    id v29 = v32;
    id v37 = v29;
    id v38 = WeakRetained;
    objc_copyWeak(&v40, location);
    id v28 = v30;
    id v39 = v28;
    [v33 getCreditCardDataWithCompletionHandler:v35];

    objc_destroyWeak(&v40);
  }

  objc_destroyWeak(location);
}

void __57__SFFormAutocompleteState__autoFillSingleCreditCardData___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2 = *(void **)(a1 + 32);
  id v3 = [a2 displayText];
  [v2 addObject:v3];
}

void __57__SFFormAutocompleteState__autoFillSingleCreditCardData___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __57__SFFormAutocompleteState__autoFillSingleCreditCardData___block_invoke_3;
  block[3] = &unk_1E5C75858;
  id v4 = *(void **)(a1 + 40);
  void block[4] = *(void *)(a1 + 32);
  id v7 = v4;
  id v8 = v3;
  id v9 = *(id *)(a1 + 48);
  id v10 = *(id *)(a1 + 56);
  id v5 = v3;
  objc_copyWeak(&v12, (id *)(a1 + 72));
  id v11 = *(id *)(a1 + 64);
  dispatch_async(MEMORY[0x1E4F14428], block);

  objc_destroyWeak(&v12);
}

void __57__SFFormAutocompleteState__autoFillSingleCreditCardData___block_invoke_3(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) _createCreditCardHeaderViewControllerForEscapeHatchAlertControllerForCard:*(void *)(a1 + 40)];
  if ((unint64_t)[*(id *)(a1 + 48) count] >= 2)
  {
    id v3 = *(void **)(a1 + 56);
    id v4 = _WBSLocalizedString();
    [v3 addObject:v4];
  }
  id v5 = _WBSLocalizedString();
  id v6 = (void *)MEMORY[0x1E4FB6EE8];
  id v7 = [*(id *)(a1 + 64) webView];
  uint64_t v8 = *(void *)(a1 + 56);
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __57__SFFormAutocompleteState__autoFillSingleCreditCardData___block_invoke_4;
  v10[3] = &unk_1E5C75830;
  objc_copyWeak(&v12, (id *)(a1 + 80));
  id v11 = *(id *)(a1 + 72);
  LOBYTE(v9) = 0;
  [v6 showAutoFillPromptInWebView:v7 title:0 message:0 cancelButtonTitle:v5 otherButtonTitles:v8 cancelWhenAppEntersBackground:0 makeFirstButtonSuggestedAction:v9 headerViewController:v2 completionHandler:v10];

  objc_destroyWeak(&v12);
}

void __57__SFFormAutocompleteState__autoFillSingleCreditCardData___block_invoke_4(uint64_t a1, uint64_t a2)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (a2 != -1 && WeakRetained)
  {
    id v7 = WeakRetained;
    if ([*(id *)(a1 + 32) count] == a2)
    {
      [v7 _clearAutoFilledCreditCardFieldsAndShowAllCreditCards];
    }
    else
    {
      id v5 = [*(id *)(a1 + 32) objectAtIndexedSubscript:a2];
      id v6 = [v5 value];
      objc_msgSend(v7, "_fillSingleCreditCardDataValue:creditCardDataType:", v6, objc_msgSend(v5, "type"));
    }
    id WeakRetained = v7;
  }
}

- (void)_clearAutoFilledCreditCardFieldsAndShowAllCreditCards
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_autoFillController);
  formMetadata = self->_formMetadata;
  textFieldMetadata = self->_textFieldMetadata;
  frame = self->_frame;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __80__SFFormAutocompleteState__clearAutoFilledCreditCardFieldsAndShowAllCreditCards__block_invoke;
  v8[3] = &unk_1E5C72238;
  id v9 = WeakRetained;
  id v10 = self;
  id v7 = WeakRetained;
  [v7 clearAutoFilledCreditCardFieldsInFrame:frame textFieldMetadata:textFieldMetadata formMetadata:formMetadata completionHandler:v8];
}

void __80__SFFormAutocompleteState__clearAutoFilledCreditCardFieldsAndShowAllCreditCards__block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void **)(a1 + 32);
  id v3 = [*(id *)(*(void *)(a1 + 40) + 232) uniqueID];
  uint64_t v4 = *(void *)(a1 + 40);
  uint64_t v5 = *(void *)(v4 + 216);
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __80__SFFormAutocompleteState__clearAutoFilledCreditCardFieldsAndShowAllCreditCards__block_invoke_2;
  v6[3] = &unk_1E5C758A8;
  void v6[4] = v4;
  id v7 = *(id *)(a1 + 32);
  [v2 fetchMetadataForTextField:v3 inFrame:v5 withCompletion:v6];
}

void __80__SFFormAutocompleteState__clearAutoFilledCreditCardFieldsAndShowAllCreditCards__block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v14 = a2;
  id v5 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 16));
  int v7 = [WeakRetained metadataCorrectionsEnabled];

  if (v7)
  {
    uint64_t v8 = [*(id *)(a1 + 32) _correctedFormMetadata:v14];
    uint64_t v9 = *(void *)(a1 + 32);
    id v10 = *(void **)(v9 + 224);
    *(void *)(v9 + 224) = v8;
  }
  uint64_t v11 = *(void *)(a1 + 32);
  id v12 = *(void **)(v11 + 232);
  *(void *)(v11 + 232) = v5;
  id v13 = v5;

  [*(id *)(a1 + 40) setLastFilledCreditCardData:0];
  [*(id *)(a1 + 40) setLastFilledCreditCardDataTypes:0];
  *(void *)(*(void *)(a1 + 32) + 8) = 3;
  [*(id *)(a1 + 32) updateAutoFillButton];
  [*(id *)(a1 + 32) updateSuggestions];
}

- (id)_createCreditCardHeaderViewControllerForEscapeHatchAlertControllerForCard:(id)a3
{
  v53[7] = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  id v4 = objc_alloc(MEMORY[0x1E4FB1838]);
  id v5 = SFCreditCardIconForType();
  id v6 = (void *)[v4 initWithImage:v5];

  [v6 setTranslatesAutoresizingMaskIntoConstraints:0];
  if ([v3 isVirtualCard])
  {
    v51[0] = MEMORY[0x1E4F143A8];
    v51[1] = 3221225472;
    v51[2] = __101__SFFormAutocompleteState__createCreditCardHeaderViewControllerForEscapeHatchAlertControllerForCard___block_invoke;
    void v51[3] = &unk_1E5C74150;
    id v52 = v6;
    objc_msgSend(v3, "virtualCardArtworkWithSize:completionHandler:", v51, 40.0, 26.0);
  }
  else
  {
    int v7 = [v3 cardNumber];
    WBSCreditCardTypeFromNumber();
    uint64_t v8 = SFCreditCardIconForType();
    [v6 setImage:v8];
  }
  [v6 setContentMode:1];
  LODWORD(v9) = 1148846080;
  [v6 setContentCompressionResistancePriority:0 forAxis:v9];
  LODWORD(v10) = 1148846080;
  [v6 setContentCompressionResistancePriority:1 forAxis:v10];
  id v11 = objc_alloc_init(MEMORY[0x1E4FB1930]);
  id v12 = [v3 cardName];
  long long v50 = v3;
  if ([v12 length]) {
    [v3 cardName];
  }
  else {
  id v13 = _WBSLocalizedString();
  }
  [v11 setText:v13];

  id v14 = [MEMORY[0x1E4FB1618] labelColor];
  [v11 setTextColor:v14];

  uint64_t v15 = [MEMORY[0x1E4FB1798] preferredFontForTextStyle:*MEMORY[0x1E4FB2998]];
  [v11 setFont:v15];

  [v11 setNumberOfLines:2];
  [v11 setTranslatesAutoresizingMaskIntoConstraints:0];
  id v16 = objc_alloc_init(MEMORY[0x1E4FB1C60]);
  char v17 = [MEMORY[0x1E4FB1438] sharedApplication];
  id v18 = [v17 preferredContentSizeCategory];
  BOOL IsAccessibilityCategory = UIContentSizeCategoryIsAccessibilityCategory(v18);

  if (!IsAccessibilityCategory) {
    [v16 addArrangedSubview:v6];
  }
  [v16 addArrangedSubview:v11];
  [v16 setAxis:0];
  [v16 setSpacing:10.0];
  [v16 setTranslatesAutoresizingMaskIntoConstraints:0];
  id v49 = v6;
  id v20 = objc_alloc_init(MEMORY[0x1E4FB1EB0]);
  [v20 addSubview:v16];
  id v39 = (void *)MEMORY[0x1E4F28DC8];
  uint64_t v48 = [v16 centerXAnchor];
  id v47 = [v20 centerXAnchor];
  id v46 = [v48 constraintEqualToAnchor:v47];
  LODWORD(v21) = 1144750080;
  uint64_t v45 = objc_msgSend(v46, "sf_withPriority:", v21);
  v53[0] = v45;
  uint64_t v44 = [v16 centerYAnchor];
  id v43 = [v20 centerYAnchor];
  id v42 = [v44 constraintEqualToAnchor:v43];
  v53[1] = v42;
  id v41 = [v20 heightAnchor];
  id v40 = [v41 constraintGreaterThanOrEqualToConstant:66.0];
  v53[2] = v40;
  id v38 = [v20 heightAnchor];
  id v37 = [v16 heightAnchor];
  id v36 = [v38 constraintGreaterThanOrEqualToAnchor:v37];
  v53[3] = v36;
  id v34 = [v20 heightAnchor];
  id v33 = [v34 constraintEqualToConstant:0.0];
  LODWORD(v22) = 1132003328;
  id v23 = objc_msgSend(v33, "sf_withPriority:", v22);
  v53[4] = v23;
  long long v24 = [v16 leadingAnchor];
  long long v25 = [v20 leadingAnchor];
  BOOL v26 = [v24 constraintGreaterThanOrEqualToSystemSpacingAfterAnchor:v25 multiplier:1.0];
  v53[5] = v26;
  id v27 = [v20 trailingAnchor];
  id v28 = [v16 trailingAnchor];
  id v29 = [v27 constraintGreaterThanOrEqualToSystemSpacingAfterAnchor:v28 multiplier:1.0];
  v53[6] = v29;
  [MEMORY[0x1E4F1C978] arrayWithObjects:v53 count:7];
  id v30 = v35 = v11;
  [v39 activateConstraints:v30];

  id v31 = objc_alloc_init(MEMORY[0x1E4F781A8]);
  [v31 setView:v20];

  return v31;
}

uint64_t __101__SFFormAutocompleteState__createCreditCardHeaderViewControllerForEscapeHatchAlertControllerForCard___block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) setImage:a2];
}

- (void)performPageLevelAutoFill
{
  self->_performingPageLevelAutoFill = 1;
  id v3 = [(WBSFormMetadata *)self->_formMetadata controls];
  uint64_t v4 = [v3 count];

  if (v4)
  {
    switch(self->_formType)
    {
      case 1uLL:
      case 4uLL:
      case 5uLL:
        self->_int64_t action = 2;
        if (!self->_multiRoundAutoFillManager) {
          [(SFFormAutocompleteState *)self _setUpMultiRoundAutoFillManagerIfNecessary];
        }
        [(SFFormAutocompleteState *)self _performPageLevelContactAutoFill];
        return;
      case 2uLL:
        uint64_t v6 = 2;
        goto LABEL_18;
      case 3uLL:
        self->_int64_t action = 8;
        int v7 = [MEMORY[0x1E4F98208] sharedFeatureManager];
        int v8 = [v7 shouldAutoFillPasswords];

        if (v8)
        {
          id WeakRetained = objc_loadWeakRetained((id *)&self->_dataController);
          double v10 = [(SFFormAutoFillFrameHandle *)self->_frame webui_URL];
          int v11 = [WeakRetained shouldAllowPasswordAutoFillOnURL:v10 allowExternalCredentials:0];

          if (v11)
          {
            [(SFFormAutocompleteState *)self _performPageLevelCredentialAutoFill];
            return;
          }
          uint64_t v6 = 5;
        }
        else
        {
          uint64_t v6 = 1;
        }
LABEL_18:
        id v5 = self;
        goto LABEL_19;
      default:
        uint64_t v6 = 3;
        goto LABEL_18;
    }
  }
  id v5 = self;
  uint64_t v6 = 4;
LABEL_19:

  [(SFFormAutocompleteState *)v5 _finishPageLevelAutoFillWithResult:v6];
}

- (void)_performPageLevelCredentialAutoFill
{
  v2[0] = MEMORY[0x1E4F143A8];
  v2[1] = 3221225472;
  v2[2] = __62__SFFormAutocompleteState__performPageLevelCredentialAutoFill__block_invoke;
  v2[3] = &unk_1E5C72420;
  v2[4] = self;
  [(SFFormAutocompleteState *)self _fetchPotentialCredentialMatchesWithCompletion:v2];
}

void __62__SFFormAutocompleteState__performPageLevelCredentialAutoFill__block_invoke(uint64_t a1, void *a2)
{
  id v6 = a2;
  uint64_t v3 = [v6 count];
  uint64_t v4 = *(void **)(a1 + 32);
  if (v3)
  {
    id v5 = [v6 firstObject];
    [v4 _fillSavedAccountMatchAfterAuthenticationIfNeeded:v5 setAsDefaultCredential:0 submitForm:1];
  }
  else
  {
    [v4 _finishPageLevelAutoFillWithResult:5];
  }
}

- (void)_performPageLevelContactAutoFill
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_dataController);
  if ([WeakRetained shouldAutoFillFromAddressBook])
  {
    v4[0] = MEMORY[0x1E4F143A8];
    v4[1] = 3221225472;
    v4[2] = __59__SFFormAutocompleteState__performPageLevelContactAutoFill__block_invoke;
    v4[3] = &unk_1E5C724D8;
    v4[4] = self;
    [WeakRetained performWhenReady:v4];
  }
}

void __59__SFFormAutocompleteState__performPageLevelContactAutoFill__block_invoke(uint64_t a1)
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 16));
  id v3 = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 24));
  uint64_t v4 = [WeakRetained lastFilledContact];
  id v5 = v4;
  if (v4)
  {
    id v6 = v4;
  }
  else
  {
    id v6 = [v3 me];
  }
  int v7 = v6;

  uint64_t v8 = *(void *)(a1 + 32);
  uint64_t v9 = *(void *)(v8 + 224);
  double v10 = objc_msgSend(*(id *)(v8 + 216), "webui_URL");
  int v11 = [v10 host];
  id v12 = objc_msgSend(v11, "safari_domainFromHost");
  LOBYTE(v24) = 1;
  id v13 = [v3 valuesForStandardForm:v9 inDomain:v12 autoFillDataType:0 matches:0 preferredLabel:0 multiRoundAutoFillManager:*(void *)(*(void *)(a1 + 32) + 208) contact:v7 allowingIdentifiedAddressBookLabelToOverridePreferredIdentifier:v24];

  uint64_t v14 = [v13 count];
  uint64_t v15 = *(void **)(a1 + 32);
  if (v14)
  {
    id v16 = (void *)v15[26];
    char v17 = [(id)objc_opt_class() controlsConsideredByAutoFillInForm:*(void *)(*(void *)(a1 + 32) + 224)];
    [v16 addControlUniqueIDsIgnoredByFollowUpAutoFill:v17];

    long long v27 = 0u;
    long long v28 = 0u;
    long long v25 = 0u;
    long long v26 = 0u;
    id v18 = [v13 allKeys];
    uint64_t v19 = [v18 countByEnumeratingWithState:&v25 objects:v29 count:16];
    if (v19)
    {
      uint64_t v20 = v19;
      uint64_t v21 = *(void *)v26;
      do
      {
        for (uint64_t i = 0; i != v20; ++i)
        {
          if (*(void *)v26 != v21) {
            objc_enumerationMutation(v18);
          }
          [WeakRetained reportAutoFillOfferedType:4 forTextFieldWithID:*(void *)(*((void *)&v25 + 1) + 8 * i) forFormMetadata:*(void *)(*(void *)(a1 + 32) + 224)];
        }
        uint64_t v20 = [v18 countByEnumeratingWithState:&v25 objects:v29 count:16];
      }
      while (v20);
    }

    [WeakRetained autoFillFormInFrame:*(void *)(*(void *)(a1 + 32) + 216) withValues:v13 setAutoFilled:1 focusFieldAfterFilling:0 fieldToFocus:0 submitForm:0];
    uint64_t v15 = *(void **)(a1 + 32);
    uint64_t v23 = 0;
  }
  else
  {
    uint64_t v23 = 5;
  }
  [v15 _finishPageLevelAutoFillWithResult:v23];
}

- (void)_finishPageLevelAutoFillWithResult:(int64_t)a3
{
  if (a3)
  {
    if (![(WBSMultiRoundAutoFillManager *)self->_multiRoundAutoFillManager currentAutoFillAttemptTrigger])[(SFFormAutocompleteState *)self _showPageLevelAutoFillNotAvailableAlertForResult:a3]; {
    [(SFFormAutocompleteState *)self invalidate];
    }
  }
  id WeakRetained = objc_loadWeakRetained((id *)&self->_autoFillController);
  [WeakRetained didPerformPageLevelAutoFill:a3 == 0];
}

- (void)_showPageLevelAutoFillNotAvailableAlertForResult:(int64_t)a3
{
  -[SFFormAutocompleteState _titleForPageLevelAutoFillNotAvailableAlertForResult:](self, "_titleForPageLevelAutoFillNotAvailableAlertForResult:");
  id v11 = (id)objc_claimAutoreleasedReturnValue();
  id v5 = [(SFFormAutocompleteState *)self _messageForPageLevelAutoFillNotAvailableAlertForResult:a3];
  id v6 = [MEMORY[0x1E4FB1418] alertControllerWithTitle:v11 message:v5 preferredStyle:1];
  int v7 = (void *)MEMORY[0x1E4FB1410];
  uint64_t v8 = _WBSLocalizedString();
  uint64_t v9 = [v7 actionWithTitle:v8 style:1 handler:0];
  [v6 addAction:v9];

  double v10 = [(SFFormAutocompleteState *)self _viewControllerToPresentFrom];
  [(SFFormAutocompleteState *)self _presentViewController:v6 presentingViewController:v10 animated:1 completion:0];
}

- (id)_titleForPageLevelAutoFillNotAvailableAlertForResult:(int64_t)a3
{
  uint64_t v4 = 0;
  if ((unint64_t)a3 <= 5 && (((1 << a3) & 0x36) != 0 || a3 == 3))
  {
    uint64_t v4 = _WBSLocalizedString();
  }
  return v4;
}

- (id)_messageForPageLevelAutoFillNotAvailableAlertForResult:(int64_t)a3
{
  uint64_t v4 = 0;
  if ((unint64_t)a3 <= 5 && (((1 << a3) & 0x36) != 0 || a3 == 3))
  {
    uint64_t v4 = _WBSLocalizedString();
  }
  return v4;
}

- (void)creditCardCaptureViewControllerDidCancel:(id)a3
{
  id v5 = (void (**)(id, void))MEMORY[0x1AD0C36A0](self->_creditCardCaptureCompletionHandler, a2, a3);
  id creditCardCaptureCompletionHandler = self->_creditCardCaptureCompletionHandler;
  self->_id creditCardCaptureCompletionHandler = 0;

  v5[2](v5, 0);
}

- (void)creditCardCaptureViewController:(id)a3 didCaptureCreditCard:(id)a4
{
  id creditCardCaptureCompletionHandler = self->_creditCardCaptureCompletionHandler;
  id v6 = a4;
  uint64_t v8 = (void (**)(id, id))MEMORY[0x1AD0C36A0](creditCardCaptureCompletionHandler);
  id v7 = self->_creditCardCaptureCompletionHandler;
  self->_id creditCardCaptureCompletionHandler = 0;

  v8[2](v8, v6);
}

- (void)_gatherAndShowAddressBookAutoFillSuggestions
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_dataController);
  textFieldMetadata = self->_textFieldMetadata;
  prefixForSuggestions = self->_prefixForSuggestions;
  id v6 = objc_loadWeakRetained((id *)&self->_autoFillController);
  id v7 = [v6 lastFilledContact];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __71__SFFormAutocompleteState__gatherAndShowAddressBookAutoFillSuggestions__block_invoke;
  v8[3] = &unk_1E5C72420;
  void v8[4] = self;
  [WeakRetained gatherAutoFillDisplayDataWithTextField:textFieldMetadata displayedInQuickType:1 prefix:prefixForSuggestions contact:v7 completionHandler:v8];
}

void __71__SFFormAutocompleteState__gatherAndShowAddressBookAutoFillSuggestions__block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = [*(id *)(a1 + 32) _suggestionsForAutoFillDisplayData:a2];
  id v8 = [*(id *)(a1 + 32) _addHideMyEmailSuggestionsIfNecessary:v3 hideMyEmailRecord:*(void *)(*(void *)(a1 + 32) + 176)];

  uint64_t v4 = [*(id *)(*(void *)(a1 + 32) + 64) formInputSession];
  if ([v8 count])
  {
    id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 16));
    id v6 = [*(id *)(*(void *)(a1 + 32) + 232) uniqueID];
    [WeakRetained reportAutoFillOfferedType:4 forTextFieldWithID:v6 forFormMetadata:*(void *)(*(void *)(a1 + 32) + 224)];

    id v7 = v8;
  }
  else
  {
    id v7 = 0;
  }
  [v4 setSuggestions:v7];
}

- (id)_suggestionsForAutoFillDisplayData:(id)a3
{
  uint64_t v3 = objc_msgSend(a3, "safari_mapAndFilterObjectsWithOptions:usingBlock:", 0, &__block_literal_global_395);
  if ([v3 count]) {
    uint64_t v4 = v3;
  }
  else {
    uint64_t v4 = 0;
  }
  id v5 = v4;

  return v5;
}

id __62__SFFormAutocompleteState__suggestionsForAutoFillDisplayData___block_invoke(uint64_t a1, void *a2, unint64_t a3, unsigned char *a4)
{
  id v6 = a2;
  if (a3 < 2)
  {
    id v7 = +[_SFTextSuggestion textSuggestionWithSingleDisplayData:v6];
    id v8 = [v6 valueString];
    [v7 setDisplayText:v8];

    uint64_t v9 = [v6 fillMatches];
    double v10 = [v9 firstObject];

    id v11 = [v10 identifier];
    uint64_t v12 = [v11 length];

    if (v12)
    {
      id v13 = [v6 label];
      if ([v13 length])
      {
        uint64_t v14 = [MEMORY[0x1E4F1BA20] localizedStringForLabel:v13];
        [v7 setHeaderText:v14];
      }
      else
      {
        uint64_t v15 = (void *)MEMORY[0x1E4FB6EF0];
        uint64_t v14 = [v10 property];
        id v16 = [v15 localizedLowercaseContactProperty:v14];
        [v7 setHeaderText:v16];
      }
    }
  }
  else
  {
    id v7 = 0;
    *a4 = 1;
  }

  return v7;
}

- (void)_startHideMyEmailRecordUpdate
{
  objc_initWeak(&location, self);
  uint64_t v3 = [MEMORY[0x1E4F98B80] sharedManager];
  uint64_t v4 = [(SFFormAutoFillFrameHandle *)self->_frame webui_URL];
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __56__SFFormAutocompleteState__startHideMyEmailRecordUpdate__block_invoke;
  v5[3] = &unk_1E5C758F0;
  objc_copyWeak(&v6, &location);
  [v3 getRecordForURL:v4 completionHandler:v5];

  objc_destroyWeak(&v6);
  objc_destroyWeak(&location);
}

void __56__SFFormAutocompleteState__startHideMyEmailRecordUpdate__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __56__SFFormAutocompleteState__startHideMyEmailRecordUpdate__block_invoke_2;
  v5[3] = &unk_1E5C72DE0;
  objc_copyWeak(&v7, (id *)(a1 + 32));
  id v6 = v3;
  id v4 = v3;
  dispatch_async(MEMORY[0x1E4F14428], v5);

  objc_destroyWeak(&v7);
}

void __56__SFFormAutocompleteState__startHideMyEmailRecordUpdate__block_invoke_2(uint64_t a1)
{
  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    id v3 = WeakRetained;
    objc_storeStrong(WeakRetained + 22, *(id *)(a1 + 32));
    [v3 updateSuggestions];
    id WeakRetained = v3;
  }
}

- (void)_autoFillHideMyEmailRecord:(id)a3
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_dataController);
  id v6 = [WeakRetained valuesForFormWithMetadata:self->_formMetadata hideMyEmailRecord:v4];

  id v7 = objc_loadWeakRetained((id *)&self->_autoFillController);
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id v8 = objc_msgSend(v6, "allKeys", 0);
  uint64_t v9 = [v8 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v17;
    do
    {
      uint64_t v12 = 0;
      do
      {
        if (*(void *)v17 != v11) {
          objc_enumerationMutation(v8);
        }
        [v7 reportAutoFillOfferedType:4 forTextFieldWithID:*(void *)(*((void *)&v16 + 1) + 8 * v12++) forFormMetadata:self->_formMetadata];
      }
      while (v10 != v12);
      uint64_t v10 = [v8 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v10);
  }

  id v13 = (void *)MEMORY[0x1E4F98B50];
  uint64_t v14 = [v6 allKeys];
  uint64_t v15 = [v13 nextFieldAfterControls:v14 inForm:self->_formMetadata];

  [v7 autoFillFormInFrame:self->_frame withValues:v6 setAutoFilled:1 focusFieldAfterFilling:v15 != 0 fieldToFocus:v15 submitForm:0];
}

- (void)_provisionHideMyEmailRecord
{
  objc_initWeak(&location, self);
  id v3 = [MEMORY[0x1E4F98B80] sharedManager];
  id v4 = [(SFFormAutoFillFrameHandle *)self->_frame webui_URL];
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __54__SFFormAutocompleteState__provisionHideMyEmailRecord__block_invoke;
  v5[3] = &unk_1E5C758F0;
  objc_copyWeak(&v6, &location);
  [v3 provisionRecordForURL:v4 completionHandler:v5];

  objc_destroyWeak(&v6);
  objc_destroyWeak(&location);
}

void __54__SFFormAutocompleteState__provisionHideMyEmailRecord__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __54__SFFormAutocompleteState__provisionHideMyEmailRecord__block_invoke_2;
  v5[3] = &unk_1E5C72DE0;
  objc_copyWeak(&v7, (id *)(a1 + 32));
  id v6 = v3;
  id v4 = v3;
  dispatch_async(MEMORY[0x1E4F14428], v5);

  objc_destroyWeak(&v7);
}

void __54__SFFormAutocompleteState__provisionHideMyEmailRecord__block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    id v3 = *(void **)(a1 + 32);
    if (v3)
    {
      id v5 = WeakRetained;
      uint64_t v4 = [v3 state];
      id WeakRetained = v5;
      if (!v4)
      {
        [v5 _autoFillHideMyEmailRecord:*(void *)(a1 + 32)];
        id WeakRetained = v5;
      }
    }
  }
}

- (id)_addHideMyEmailSuggestionsIfNecessary:(id)a3 hideMyEmailRecord:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (v7
    && ([MEMORY[0x1E4FB6EF0] shouldDisplayHideMyEmailForControl:self->_textFieldMetadata] & 1) != 0
    && (![v7 state] || objc_msgSend(v7, "state") == 1))
  {
    if (!v6) {
      id v6 = objc_alloc_init(MEMORY[0x1E4F1C978]);
    }
    if ((unint64_t)[v6 count] >= 2)
    {
      uint64_t v8 = objc_msgSend(v6, "subarrayWithRange:", 0, 1);

      id v6 = (id)v8;
    }
    uint64_t v9 = (void *)[v6 mutableCopy];
    if ([v7 state])
    {
      uint64_t v10 = [(SFFormAutocompleteState *)self _hideMyEmailCreationSuggestion];
      [v9 addObject:v10];
    }
    else
    {
      uint64_t v10 = [(SFFormAutocompleteState *)self _hideMyEmailSuggestionForRecord:v7];
      [v9 insertObject:v10 atIndex:0];
    }
  }
  else
  {
    id v6 = v6;
    uint64_t v9 = v6;
  }

  return v9;
}

- (id)_hideMyEmailSuggestionForRecord:(id)a3
{
  id v3 = a3;
  uint64_t v4 = +[_SFTextSuggestion textSuggestionWithHideMyEmailRecord:v3];
  id v5 = _WBSLocalizedString();
  [v4 setHeaderText:v5];

  id v6 = [v3 privateEmailAddress];

  [v4 setDisplayText:v6];

  return v4;
}

- (id)_hideMyEmailCreationSuggestion
{
  uint64_t v2 = +[_SFTextSuggestion textSuggestionToProvisionHideMyEmailRecord];
  id v3 = _WBSLocalizedString();
  [v2 setDisplayText:v3];

  return v2;
}

- (void)_autoFillWithSet:(id)a3
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = (void *)MEMORY[0x1E4F98B50];
  id v6 = [v4 controlIDToValueMap];
  id v7 = [v6 allKeys];
  uint64_t v8 = [v5 nextFieldAfterControls:v7 inForm:self->_formMetadata];

  id WeakRetained = objc_loadWeakRetained((id *)&self->_autoFillController);
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  uint64_t v10 = objc_msgSend(v4, "controlIDToValueMap", 0);
  uint64_t v11 = [v10 allKeys];

  uint64_t v12 = [v11 countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v12)
  {
    uint64_t v13 = v12;
    uint64_t v14 = *(void *)v19;
    do
    {
      uint64_t v15 = 0;
      do
      {
        if (*(void *)v19 != v14) {
          objc_enumerationMutation(v11);
        }
        [WeakRetained reportAutoFillOfferedType:4 forTextFieldWithID:*(void *)(*((void *)&v18 + 1) + 8 * v15++) forFormMetadata:self->_formMetadata];
      }
      while (v13 != v15);
      uint64_t v13 = [v11 countByEnumeratingWithState:&v18 objects:v22 count:16];
    }
    while (v13);
  }

  frame = self->_frame;
  long long v17 = [v4 controlIDToValueMap];
  [WeakRetained autoFillFormInFrame:frame withValues:v17 setAutoFilled:1 focusFieldAfterFilling:v8 != 0 fieldToFocus:v8 submitForm:0];
}

- (void)_offerToAutoFillContact
{
  uint64_t v121 = *MEMORY[0x1E4F143B8];
  objc_initWeak(&location, self);
  id WeakRetained = objc_loadWeakRetained((id *)&self->_autoFillController);
  id v78 = objc_loadWeakRetained((id *)&self->_dataController);
  uint64_t v2 = [WeakRetained webView];
  id v72 = objc_msgSend(v2, "webui_presentingViewController");

  id v3 = [WeakRetained lastFilledContact];
  id v4 = v3;
  if (v3)
  {
    id v77 = v3;
  }
  else
  {
    id v77 = [v78 me];
  }

  formMetadata = self->_formMetadata;
  id v112 = 0;
  id v6 = (id)[v78 valuesForContactFormWithMetadata:formMetadata matches:&v112 multiRoundAutoFillManager:self->_multiRoundAutoFillManager existingMatches:0 contact:v77];
  id v71 = v112;
  v80 = [MEMORY[0x1E4FB1418] alertControllerWithTitle:0 message:0 preferredStyle:_SFDeviceIsPad()];
  hideMyEmailRecord = self->_hideMyEmailRecord;
  if (hideMyEmailRecord && ![(WBSHideMyEmailRecord *)hideMyEmailRecord state])
  {
    uint64_t v8 = (void *)MEMORY[0x1E4FB1410];
    uint64_t v9 = [(WBSHideMyEmailRecord *)self->_hideMyEmailRecord privateEmailAddress];
    v111[0] = MEMORY[0x1E4F143A8];
    v111[1] = 3221225472;
    v111[2] = __50__SFFormAutocompleteState__offerToAutoFillContact__block_invoke;
    v111[3] = &unk_1E5C72898;
    v111[4] = self;
    uint64_t v10 = [v8 actionWithTitle:v9 style:0 handler:v111];
    [v80 addAction:v10];
  }
  uint64_t v73 = [MEMORY[0x1E4F98B50] specifierForControl:self->_textFieldMetadata];
  uint64_t v11 = (void *)MEMORY[0x1E4F98B50];
  uint64_t v12 = [v73 property];
  if ([v11 isNameProperty:v12])
  {
  }
  else
  {
    uint64_t v13 = [v73 component];
    int v14 = [v13 isEqualToString:*MEMORY[0x1E4FB6F08]];

    if (!v14)
    {
      id v53 = [(SFFormAutocompleteState *)self _bestTextFieldMetadataForMetadata:self->_textFieldMetadata];
      textFieldMetadata = self->_textFieldMetadata;
      uint64_t v55 = [WeakRetained lastFilledContact];
      v95[0] = MEMORY[0x1E4F143A8];
      v95[1] = 3221225472;
      v95[2] = __50__SFFormAutocompleteState__offerToAutoFillContact__block_invoke_4;
      v95[3] = &unk_1E5C72B40;
      id v96 = v80;
      long long v97 = self;
      [v78 gatherAutoFillDisplayDataWithTextField:textFieldMetadata displayedInQuickType:0 prefix:0 contact:v55 completionHandler:v95];

      id v52 = v96;
      goto LABEL_51;
    }
  }
  uint64_t v15 = [MEMORY[0x1E4F1B910] stringFromContact:v77 style:0];
  [v80 setTitle:v15];

  long long v109 = 0u;
  long long v110 = 0u;
  long long v107 = 0u;
  long long v108 = 0u;
  long long v16 = [v78 recentlyUsedAutoFillSets];
  uint64_t v17 = [v16 countByEnumeratingWithState:&v107 objects:v119 count:16];
  id obj = v16;
  if (!v17)
  {
    v86 = 0;
    goto LABEL_40;
  }
  uint64_t v79 = v17;
  v86 = 0;
  uint64_t v76 = *(void *)v108;
  id v87 = (id)*MEMORY[0x1E4F1B6F8];
  long long v18 = (void *)*MEMORY[0x1E4F1B770];
  do
  {
    uint64_t v85 = 0;
    long long v82 = v86;
    do
    {
      if (*(void *)v108 != v76) {
        objc_enumerationMutation(obj);
      }
      id v81 = *(void **)(*((void *)&v107 + 1) + 8 * v85);
      long long v83 = [v81 fillMatches];
      if (![v83 count]) {
        goto LABEL_29;
      }
      long long v116 = 0u;
      long long v117 = 0u;
      long long v114 = 0u;
      long long v115 = 0u;
      id v19 = v83;
      uint64_t v20 = [v19 countByEnumeratingWithState:&v114 objects:v120 count:16];
      if (!v20)
      {

LABEL_29:
        v86 = 0;
        goto LABEL_30;
      }
      char v21 = 0;
      uint64_t v22 = *(void *)v115;
      char v23 = 1;
      char v24 = 1;
      do
      {
        for (uint64_t i = 0; i != v20; ++i)
        {
          if (*(void *)v115 != v22) {
            objc_enumerationMutation(v19);
          }
          long long v26 = *(void **)(*((void *)&v114 + 1) + 8 * i);
          long long v27 = [v26 label];
          BOOL v28 = v27 == 0;

          if (!v28)
          {
            id v29 = [v26 label];
            char v30 = [v29 isEqualToString:v87];

            id v31 = [v26 label];
            char v32 = [v31 isEqualToString:v18];

            v23 &= v30;
            v24 &= v32;
            char v21 = 1;
          }
        }
        uint64_t v20 = [v19 countByEnumeratingWithState:&v114 objects:v120 count:16];
      }
      while (v20);

      if ((v21 & 1) == 0) {
        goto LABEL_29;
      }
      if (v23)
      {
        id v33 = v87;
      }
      else
      {
        if ((v24 & 1) == 0) {
          goto LABEL_29;
        }
        id v33 = v18;
      }
      v86 = v33;
LABEL_30:

      id v34 = [v78 contactAutoFillSetForRecentlyUsedAutoFillSet:v81 contact:v77 form:self->_formMetadata];
      uint64_t v35 = [v34 fillDisplayProperties];
      if ([v35 count])
      {
        id v36 = _WBSLocalizedString();
        id v37 = _WBSLocalizedString();
        id v38 = [v35 componentsJoinedByString:v37];
        v104[0] = MEMORY[0x1E4F143A8];
        v104[1] = 3221225472;
        v104[2] = __50__SFFormAutocompleteState__offerToAutoFillContact__block_invoke_2;
        v104[3] = &unk_1E5C72938;
        objc_copyWeak(&v106, &location);
        id v105 = v34;
        [(SFFormAutocompleteState *)self _addActionForAlertController:v80 title:v36 detail:v38 handler:v104];

        objc_destroyWeak(&v106);
      }

      long long v82 = v86;
      ++v85;
    }
    while (v85 != v79);
    uint64_t v39 = [obj countByEnumeratingWithState:&v107 objects:v119 count:16];
    uint64_t v79 = v39;
  }
  while (v39);
LABEL_40:

  [v78 orderedHomeAndWorkSetsForContact:v77 form:self->_formMetadata];
  long long v102 = 0u;
  long long v103 = 0u;
  long long v100 = 0u;
  long long v101 = 0u;
  id v88 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v40 = [v88 countByEnumeratingWithState:&v100 objects:v118 count:16];
  if (v40)
  {
    uint64_t v41 = *(void *)v101;
    do
    {
      for (uint64_t j = 0; j != v40; ++j)
      {
        if (*(void *)v101 != v41) {
          objc_enumerationMutation(v88);
        }
        id v43 = *(void **)(*((void *)&v100 + 1) + 8 * j);
        uint64_t v44 = [v43 label];
        char v45 = [v86 isEqualToString:v44];

        if ((v45 & 1) == 0)
        {
          id v46 = (void *)MEMORY[0x1E4F1BA20];
          id v47 = [v43 label];
          uint64_t v48 = [v46 localizedStringForLabel:v47];
          id v49 = [v43 fillDisplayProperties];
          long long v50 = _WBSLocalizedString();
          long long v51 = [v49 componentsJoinedByString:v50];
          v98[0] = MEMORY[0x1E4F143A8];
          v98[1] = 3221225472;
          v98[2] = __50__SFFormAutocompleteState__offerToAutoFillContact__block_invoke_3;
          v98[3] = &unk_1E5C72938;
          objc_copyWeak(&v99, &location);
          v98[4] = v43;
          [(SFFormAutocompleteState *)self _addActionForAlertController:v80 title:v48 detail:v51 handler:v98];

          objc_destroyWeak(&v99);
        }
      }
      uint64_t v40 = [v88 countByEnumeratingWithState:&v100 objects:v118 count:16];
    }
    while (v40);
  }

  id v52 = v86;
LABEL_51:

  long long v56 = self->_hideMyEmailRecord;
  if (v56 && [(WBSHideMyEmailRecord *)v56 state] == 1)
  {
    long long v57 = (void *)MEMORY[0x1E4FB1410];
    long long v58 = _WBSLocalizedString();
    v94[0] = MEMORY[0x1E4F143A8];
    v94[1] = 3221225472;
    v94[2] = __50__SFFormAutocompleteState__offerToAutoFillContact__block_invoke_7;
    v94[3] = &unk_1E5C72898;
    v94[4] = self;
    long long v59 = [v57 actionWithTitle:v58 style:0 handler:v94];
    [v80 addAction:v59];
  }
  long long v60 = (void *)MEMORY[0x1E4FB1410];
  long long v61 = _WBSLocalizedString();
  v91[0] = MEMORY[0x1E4F143A8];
  v91[1] = 3221225472;
  v91[2] = __50__SFFormAutocompleteState__offerToAutoFillContact__block_invoke_8;
  v91[3] = &unk_1E5C72A50;
  v91[4] = self;
  id v62 = v71;
  id v92 = v62;
  id v63 = v77;
  id v93 = v63;
  __int16 v64 = [v60 actionWithTitle:v61 style:0 handler:v91];
  [v80 addAction:v64];

  uint64_t v65 = (void *)MEMORY[0x1E4FB1410];
  uint64_t v66 = _WBSLocalizedString();
  v90[0] = MEMORY[0x1E4F143A8];
  v90[1] = 3221225472;
  v90[2] = __50__SFFormAutocompleteState__offerToAutoFillContact__block_invoke_9;
  v90[3] = &unk_1E5C72898;
  v90[4] = self;
  id v67 = [v65 actionWithTitle:v66 style:0 handler:v90];
  [v80 addAction:v67];

  id v68 = (void *)MEMORY[0x1E4FB1410];
  BOOL v69 = _WBSLocalizedString();
  v89[0] = MEMORY[0x1E4F143A8];
  v89[1] = 3221225472;
  v89[2] = __50__SFFormAutocompleteState__offerToAutoFillContact__block_invoke_10;
  v89[3] = &unk_1E5C72898;
  v89[4] = self;
  v70 = [v68 actionWithTitle:v69 style:1 handler:v89];
  [v80 addAction:v70];

  if (v80)
  {
    [(SFFormAutocompleteState *)self _setShowingKeyboardInputView:0];
    [(SFFormAutocompleteState *)self _presentViewController:v80 presentingViewController:v72 animated:1 completion:0];
  }

  objc_destroyWeak(&location);
}

uint64_t __50__SFFormAutocompleteState__offerToAutoFillContact__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _autoFillHideMyEmailRecord:*(void *)(*(void *)(a1 + 32) + 176)];
}

void __50__SFFormAutocompleteState__offerToAutoFillContact__block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  [WeakRetained _autoFillWithSet:*(void *)(a1 + 32)];
}

void __50__SFFormAutocompleteState__offerToAutoFillContact__block_invoke_3(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  [WeakRetained _autoFillWithSet:*(void *)(a1 + 32)];
}

void __50__SFFormAutocompleteState__offerToAutoFillContact__block_invoke_4(uint64_t a1, void *a2)
{
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __50__SFFormAutocompleteState__offerToAutoFillContact__block_invoke_5;
  v6[3] = &unk_1E5C75918;
  id v4 = *(id *)(a1 + 32);
  uint64_t v5 = *(void *)(a1 + 40);
  id v7 = v4;
  uint64_t v8 = v5;
  [a2 enumerateObjectsUsingBlock:v6];
}

void __50__SFFormAutocompleteState__offerToAutoFillContact__block_invoke_5(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = *(void **)(a1 + 32);
  uint64_t v5 = (void *)MEMORY[0x1E4FB1410];
  id v6 = [v3 valueString];
  id v7 = [v3 label];
  id v8 = v6;
  if ([v7 length])
  {
    uint64_t v9 = NSString;
    uint64_t v10 = _WBSLocalizedString();
    uint64_t v11 = [MEMORY[0x1E4F1BA20] localizedStringForLabel:v7];
    objc_msgSend(v9, "stringWithFormat:", v10, v8, v11);
    id v12 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v12 = v8;
  }

  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  void v15[2] = __50__SFFormAutocompleteState__offerToAutoFillContact__block_invoke_6;
  id v15[3] = &unk_1E5C72448;
  v15[4] = *(void *)(a1 + 40);
  id v16 = v3;
  id v13 = v3;
  int v14 = [v5 actionWithTitle:v12 style:0 handler:v15];
  [v4 addAction:v14];
}

uint64_t __50__SFFormAutocompleteState__offerToAutoFillContact__block_invoke_6(uint64_t a1)
{
  return [*(id *)(a1 + 32) _autoFillDisplayData:*(void *)(a1 + 40) setAutoFilled:1];
}

uint64_t __50__SFFormAutocompleteState__offerToAutoFillContact__block_invoke_7(uint64_t a1)
{
  return [*(id *)(a1 + 32) _provisionHideMyEmailRecord];
}

uint64_t __50__SFFormAutocompleteState__offerToAutoFillContact__block_invoke_8(uint64_t a1)
{
  return [*(id *)(a1 + 32) _switchToCustomInputViewWithMatches:*(void *)(a1 + 40) contact:*(void *)(a1 + 48)];
}

uint64_t __50__SFFormAutocompleteState__offerToAutoFillContact__block_invoke_9(uint64_t a1)
{
  return [*(id *)(a1 + 32) _showOtherContactOptions];
}

uint64_t __50__SFFormAutocompleteState__offerToAutoFillContact__block_invoke_10(uint64_t a1)
{
  return [*(id *)(a1 + 32) _setShowingKeyboardInputView:1];
}

- (void)_autoFillDisplayData:(id)a3 setAutoFilled:(BOOL)a4
{
  BOOL v31 = a4;
  v39[1] = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_dataController);
  id v7 = [v5 fillMatches];
  id v8 = objc_alloc(MEMORY[0x1E4F98D98]);
  uint64_t v9 = [v5 label];
  if ([v9 length])
  {
    uint64_t v10 = [v5 label];
    uint64_t v11 = [v8 initWithFillMatches:v7 skipMatches:MEMORY[0x1E4F1CBF0] label:v10];
  }
  else
  {
    uint64_t v10 = [v7 firstObject];
    id v12 = [v10 property];
    uint64_t v11 = [v8 initWithFillMatches:v7 skipMatches:MEMORY[0x1E4F1CBF0] label:v12];
  }
  BOOL v13 = (unint64_t)[v7 count] < 2;
  formMetadata = self->_formMetadata;
  uint64_t v15 = [WeakRetained me];
  id v16 = [WeakRetained valuesForContactFormWithMetadata:formMetadata matches:0 multiRoundAutoFillManager:0 existingMatches:v11 shouldUseExistingMatchesToFillFocusedField:v13 contact:v15];

  char v32 = WeakRetained;
  char v30 = (void *)v11;
  if (![v16 count]
    && [v7 count] == 1
    && ([(WBSFormMetadata *)self->_formMetadata containsActiveElement] & 1) == 0)
  {
    uint64_t v17 = [(WBSFormControlMetadata *)self->_textFieldMetadata uniqueID];
    long long v18 = [v7 firstObject];
    id v19 = [v18 stringValue];

    if (v17 && v19)
    {
      id v38 = v17;
      v39[0] = v19;
      uint64_t v20 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v39 forKeys:&v38 count:1];

      id v16 = (void *)v20;
    }
  }
  char v21 = (void *)MEMORY[0x1E4F98B50];
  uint64_t v22 = [v16 allKeys];
  char v23 = [v21 nextFieldAfterControls:v22 inForm:self->_formMetadata];

  id v24 = objc_loadWeakRetained((id *)&self->_autoFillController);
  long long v33 = 0u;
  long long v34 = 0u;
  long long v35 = 0u;
  long long v36 = 0u;
  long long v25 = [v16 allKeys];
  uint64_t v26 = [v25 countByEnumeratingWithState:&v33 objects:v37 count:16];
  if (v26)
  {
    uint64_t v27 = v26;
    uint64_t v28 = *(void *)v34;
    do
    {
      uint64_t v29 = 0;
      do
      {
        if (*(void *)v34 != v28) {
          objc_enumerationMutation(v25);
        }
        [v24 reportAutoFillOfferedType:4 forTextFieldWithID:*(void *)(*((void *)&v33 + 1) + 8 * v29++) forFormMetadata:self->_formMetadata];
      }
      while (v27 != v29);
      uint64_t v27 = [v25 countByEnumeratingWithState:&v33 objects:v37 count:16];
    }
    while (v27);
  }

  [v24 autoFillFormInFrame:self->_frame withValues:v16 setAutoFilled:v31 focusFieldAfterFilling:v23 != 0 fieldToFocus:v23 submitForm:0];
}

- (void)_switchToCustomInputViewWithMatches:(id)a3 contact:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  objc_initWeak(&location, self);
  id WeakRetained = objc_loadWeakRetained((id *)&self->_autoFillController);
  uint64_t v9 = [WeakRetained webView];
  uint64_t v10 = objc_msgSend(v9, "webui_preventNavigationDuringAutoFillPrompt");

  uint64_t v11 = [(SFFormAutocompleteState *)self _viewControllerToPresentFrom];
  uint64_t v19 = MEMORY[0x1E4F143A8];
  uint64_t v20 = 3221225472;
  char v21 = __71__SFFormAutocompleteState__switchToCustomInputViewWithMatches_contact___block_invoke;
  uint64_t v22 = &unk_1E5C75968;
  id v12 = v11;
  id v23 = v12;
  objc_copyWeak(&v25, &location);
  id v13 = v10;
  id v24 = v13;
  int v14 = (void *)MEMORY[0x1AD0C36A0](&v19);
  id customAutoFillContactCompletionHandler = self->_customAutoFillContactCompletionHandler;
  self->_id customAutoFillContactCompletionHandler = v14;

  id v16 = [SFContactAutoFillViewController alloc];
  uint64_t v17 = -[SFContactAutoFillViewController initWithMatches:contact:](v16, "initWithMatches:contact:", v6, v7, v19, v20, v21, v22);
  long long v18 = (void *)[objc_alloc(MEMORY[0x1E4FB19E8]) initWithRootViewController:v17];
  [v18 setModalPresentationStyle:2];
  [(SFContactAutoFillViewController *)v17 setAutoFiller:self];
  [(SFFormAutocompleteState *)self _setShowingKeyboardInputView:0];
  [(SFFormAutocompleteState *)self _presentViewController:v18 presentingViewController:v12 animated:1 completion:0];

  objc_destroyWeak(&v25);
  objc_destroyWeak(&location);
}

void __71__SFFormAutocompleteState__switchToCustomInputViewWithMatches_contact___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void **)(a1 + 32);
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __71__SFFormAutocompleteState__switchToCustomInputViewWithMatches_contact___block_invoke_2;
  v3[3] = &unk_1E5C75940;
  objc_copyWeak(&v5, (id *)(a1 + 48));
  id v4 = *(id *)(a1 + 40);
  [v2 dismissViewControllerAnimated:1 completion:v3];

  objc_destroyWeak(&v5);
}

uint64_t __71__SFFormAutocompleteState__switchToCustomInputViewWithMatches_contact___block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  [WeakRetained _setShowingKeyboardInputView:1];

  id v3 = *(uint64_t (**)(void))(*(void *)(a1 + 32) + 16);

  return v3();
}

- (void)_showOtherContactOptions
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_autoFillController);
  id v4 = [WeakRetained webView];
  id v5 = objc_msgSend(v4, "webui_preventNavigationDuringAutoFillPrompt");

  id v6 = [(SFFormAutocompleteState *)self _viewControllerToPresentFrom];
  objc_initWeak(&location, self);
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __51__SFFormAutocompleteState__showOtherContactOptions__block_invoke;
  v14[3] = &unk_1E5C759B8;
  id v7 = v6;
  id v15 = v7;
  objc_copyWeak(&v17, &location);
  id v8 = v5;
  id v16 = v8;
  uint64_t v9 = (void *)MEMORY[0x1AD0C36A0](v14);
  id displayOtherContactsCompletionHandler = self->_displayOtherContactsCompletionHandler;
  self->_id displayOtherContactsCompletionHandler = v9;

  uint64_t v20 = 0;
  char v21 = &v20;
  uint64_t v22 = 0x2050000000;
  uint64_t v11 = (void *)getCNContactPickerViewControllerClass_softClass;
  uint64_t v23 = getCNContactPickerViewControllerClass_softClass;
  if (!getCNContactPickerViewControllerClass_softClass)
  {
    v19[0] = MEMORY[0x1E4F143A8];
    v19[1] = 3221225472;
    v19[2] = __getCNContactPickerViewControllerClass_block_invoke;
    v19[3] = &unk_1E5C723B0;
    void v19[4] = &v20;
    __getCNContactPickerViewControllerClass_block_invoke((uint64_t)v19);
    uint64_t v11 = (void *)v21[3];
  }
  id v12 = v11;
  _Block_object_dispose(&v20, 8);
  id v13 = objc_alloc_init(v12);
  [v13 setDelegate:self];
  [v13 setModalPresentationStyle:2];
  [(SFFormAutocompleteState *)self _setShowingKeyboardInputView:0];
  [v7 presentViewController:v13 animated:1 completion:0];

  objc_destroyWeak(&v17);
  objc_destroyWeak(&location);
}

void __51__SFFormAutocompleteState__showOtherContactOptions__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id v7 = *(void **)(a1 + 32);
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __51__SFFormAutocompleteState__showOtherContactOptions__block_invoke_2;
  v10[3] = &unk_1E5C75990;
  objc_copyWeak(&v14, (id *)(a1 + 48));
  id v8 = v5;
  id v11 = v8;
  id v9 = v6;
  id v12 = v9;
  id v13 = *(id *)(a1 + 40);
  [v7 dismissViewControllerAnimated:1 completion:v10];

  objc_destroyWeak(&v14);
}

void __51__SFFormAutocompleteState__showOtherContactOptions__block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  id v3 = WeakRetained;
  if (WeakRetained)
  {
    if (*(void *)(a1 + 32) && *(void *)(a1 + 40)) {
      objc_msgSend(WeakRetained, "_switchToCustomInputViewWithMatches:contact:");
    }
    else {
      [WeakRetained _setShowingKeyboardInputView:1];
    }
  }
  (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
}

- (void)dismissCustomAutoFill
{
  id customAutoFillContactCompletionHandler = self->_customAutoFillContactCompletionHandler;
  if (customAutoFillContactCompletionHandler)
  {
    id v5 = (void (**)(void))MEMORY[0x1AD0C36A0](customAutoFillContactCompletionHandler, a2);
    id v4 = self->_customAutoFillContactCompletionHandler;
    self->_id customAutoFillContactCompletionHandler = 0;

    v5[2]();
  }
}

- (void)performAutoFillWithMatchSelections:(id)a3 doNotFill:(id)a4 contact:(id)a5
{
  uint64_t v66 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v45 = a5;
  uint64_t v10 = [MEMORY[0x1E4F1CA60] dictionary];
  long long v57 = 0u;
  long long v58 = 0u;
  long long v59 = 0u;
  long long v60 = 0u;
  id v11 = v8;
  uint64_t v12 = [v11 countByEnumeratingWithState:&v57 objects:v65 count:16];
  if (v12)
  {
    uint64_t v13 = v12;
    uint64_t v14 = *(void *)v58;
    do
    {
      for (uint64_t i = 0; i != v13; ++i)
      {
        if (*(void *)v58 != v14) {
          objc_enumerationMutation(v11);
        }
        id v16 = *(void **)(*((void *)&v57 + 1) + 8 * i);
        id v17 = [v16 identifier];
        uint64_t v18 = [v17 length];

        if (v18)
        {
          uint64_t v19 = [v16 identifier];
          uint64_t v20 = [v16 property];
          [v10 setObject:v19 forKeyedSubscript:v20];
        }
      }
      uint64_t v13 = [v11 countByEnumeratingWithState:&v57 objects:v65 count:16];
    }
    while (v13);
  }

  long long v55 = 0u;
  long long v56 = 0u;
  long long v53 = 0u;
  long long v54 = 0u;
  id v21 = v9;
  uint64_t v22 = [v21 countByEnumeratingWithState:&v53 objects:v64 count:16];
  if (v22)
  {
    uint64_t v23 = v22;
    uint64_t v24 = *(void *)v54;
    uint64_t v25 = *MEMORY[0x1E4F99418];
    do
    {
      for (uint64_t j = 0; j != v23; ++j)
      {
        if (*(void *)v54 != v24) {
          objc_enumerationMutation(v21);
        }
        uint64_t v27 = [*(id *)(*((void *)&v53 + 1) + 8 * j) property];
        [v10 setObject:v25 forKeyedSubscript:v27];
      }
      uint64_t v23 = [v21 countByEnumeratingWithState:&v53 objects:v64 count:16];
    }
    while (v23);
  }

  v51[0] = MEMORY[0x1E4F143A8];
  v51[1] = 3221225472;
  v51[2] = __80__SFFormAutocompleteState_performAutoFillWithMatchSelections_doNotFill_contact___block_invoke;
  void v51[3] = &unk_1E5C759E0;
  void v51[4] = self;
  id v28 = v45;
  id v52 = v28;
  [v10 enumerateKeysAndObjectsUsingBlock:v51];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_autoFillController);
  id v30 = objc_loadWeakRetained((id *)&self->_dataController);
  id v43 = (void *)[objc_alloc(MEMORY[0x1E4F98D98]) initWithFillMatches:v11 skipMatches:v21 label:0];
  id v46 = objc_msgSend(v30, "valuesForContactFormWithMetadata:matches:multiRoundAutoFillManager:existingMatches:contact:", self->_formMetadata, 0, self->_multiRoundAutoFillManager);
  if ([MEMORY[0x1E4FB6EF0] contactIsMe:v28]) {
    [v30 saveRecentlyUsedAutoFillSetWithMatchesToFill:v11 matchesForDoNotFill:v21];
  }
  uint64_t v44 = v30;
  BOOL v31 = (void *)MEMORY[0x1E4F98B50];
  char v32 = [v46 allKeys];
  id v42 = [v31 nextFieldAfterControls:v32 inForm:self->_formMetadata];

  long long v49 = 0u;
  long long v50 = 0u;
  long long v47 = 0u;
  long long v48 = 0u;
  long long v33 = [v46 allKeys];
  uint64_t v34 = [v33 countByEnumeratingWithState:&v47 objects:v63 count:16];
  if (v34)
  {
    uint64_t v35 = v34;
    uint64_t v36 = *(void *)v48;
    do
    {
      for (uint64_t k = 0; k != v35; ++k)
      {
        if (*(void *)v48 != v36) {
          objc_enumerationMutation(v33);
        }
        [WeakRetained reportAutoFillOfferedType:4 forTextFieldWithID:*(void *)(*((void *)&v47 + 1) + 8 * k) forFormMetadata:self->_formMetadata];
      }
      uint64_t v35 = [v33 countByEnumeratingWithState:&v47 objects:v63 count:16];
    }
    while (v35);
  }

  [WeakRetained autoFillFormInFrame:self->_frame withValues:v46 setAutoFilled:1 focusFieldAfterFilling:v42 != 0 fieldToFocus:v42 submitForm:0];
  uint64_t v41 = [(WBSFormMetadata *)self->_formMetadata uniqueID];
  frame = self->_frame;
  uint64_t v61 = *MEMORY[0x1E4F99208];
  uint64_t v39 = [v28 identifier];
  id v62 = v39;
  uint64_t v40 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v62 forKeys:&v61 count:1];
  [WeakRetained annotateForm:v41 inFrame:frame withValues:v40];

  [WeakRetained setLastFilledContact:v28];
  [(SFFormAutocompleteState *)self dismissCustomAutoFill];
}

void __80__SFFormAutocompleteState_performAutoFillWithMatchSelections_doNotFill_contact___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = (id *)(*(void *)(a1 + 32) + 24);
  id v6 = a3;
  id v7 = a2;
  id WeakRetained = objc_loadWeakRetained(v5);
  [WeakRetained setPreferredIdentifier:v6 forProperty:v7 withContact:*(void *)(a1 + 40)];
}

- (void)contactPickerDidCancel:(id)a3
{
  id v5 = (id)MEMORY[0x1AD0C36A0](self->_displayOtherContactsCompletionHandler, a2, a3);
  id displayOtherContactsCompletionHandler = self->_displayOtherContactsCompletionHandler;
  self->_id displayOtherContactsCompletionHandler = 0;

  (*((void (**)(id, void, void))v5 + 2))(v5, 0, 0);
}

- (void)contactPicker:(id)a3 didSelectContact:(id)a4
{
  id displayOtherContactsCompletionHandler = self->_displayOtherContactsCompletionHandler;
  id v6 = a4;
  id v7 = (void (**)(void, void, void))MEMORY[0x1AD0C36A0](displayOtherContactsCompletionHandler);
  id v8 = self->_displayOtherContactsCompletionHandler;
  self->_id displayOtherContactsCompletionHandler = 0;

  id WeakRetained = objc_loadWeakRetained((id *)&self->_dataController);
  formMetadata = self->_formMetadata;
  id v13 = 0;
  id v11 = (id)[WeakRetained valuesForContactFormWithMetadata:formMetadata matches:&v13 multiRoundAutoFillManager:self->_multiRoundAutoFillManager existingMatches:0 contact:v6];
  id v12 = v13;

  ((void (**)(void, id, id))v7)[2](v7, v12, v6);
}

- (id)_correctedFormMetadata:(id)a3
{
  id v4 = a3;
  metadataCorrector = self->_metadataCorrector;
  if (metadataCorrector)
  {
    id v6 = [(WBSFormAutoFillMetadataCorrector *)metadataCorrector bestAvailableMetadataFromMetadata:v4];
  }
  else
  {
    id v6 = v4;
  }
  id v7 = v6;

  return v7;
}

- (id)_bestTextFieldMetadataForMetadata:(id)a3
{
  id v4 = a3;
  metadataCorrector = self->_metadataCorrector;
  if (metadataCorrector)
  {
    id v6 = [(WBSFormAutoFillMetadataCorrector *)metadataCorrector bestAvailableMetadataFromControlMetadata:v4];
  }
  else
  {
    id v6 = v4;
  }
  id v7 = v6;

  return v7;
}

- (void)getTextSuggestionForStreamlinedAutoFillWithCredentialIdentity:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = (void (**)(id, void *))a4;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_dataController);
  id v9 = [WeakRetained autoFillQuirksManager];
  uint64_t v10 = [(SFFormAutoFillFrameHandle *)self->_frame webui_URL];
  if ([v9 isAutomaticLoginDisallowedOnURL:v10]) {
    uint64_t v11 = 0;
  }
  else {
    uint64_t v11 = [(WBSFormMetadata *)self->_formMetadata isEligibleForAutomaticLogin];
  }

  if (v6)
  {
    id v12 = [(SFFormAutocompleteState *)self _textSuggestionForExternalCredentialIdentity:v6 submitForm:v11];
    v7[2](v7, v12);
  }
  else
  {
    id v13 = [MEMORY[0x1E4F98208] sharedFeatureManager];
    int v14 = [v13 shouldAutoFillPasswordsFromKeychain];

    if (v14)
    {
      v15[0] = MEMORY[0x1E4F143A8];
      v15[1] = 3221225472;
      void v15[2] = __100__SFFormAutocompleteState_getTextSuggestionForStreamlinedAutoFillWithCredentialIdentity_completion___block_invoke;
      id v15[3] = &unk_1E5C75A08;
      v15[4] = self;
      id v16 = v7;
      char v17 = v11;
      [(SFFormAutocompleteState *)self _getMatchingKeychainCredentialsIncludingCredentialsWithEmptyUsernames:0 withCompletion:v15];
    }
    else
    {
      v7[2](v7, 0);
    }
  }
}

void __100__SFFormAutocompleteState_getTextSuggestionForStreamlinedAutoFillWithCredentialIdentity_completion___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3 = [a2 firstObject];
  uint64_t v4 = *(void *)(a1 + 40);
  id v6 = (id)v3;
  if (v3)
  {
    id v5 = [*(id *)(a1 + 32) _textSuggestionForCredentialDisplayData:v3 submitForm:*(unsigned __int8 *)(a1 + 48)];
    (*(void (**)(uint64_t, void *))(v4 + 16))(v4, v5);
  }
  else
  {
    (*(void (**)(uint64_t, void))(v4 + 16))(v4, 0);
  }
}

- (void)oneTimeCodeProviderReceivedCode:(id)a3
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __59__SFFormAutocompleteState_oneTimeCodeProviderReceivedCode___block_invoke;
  block[3] = &unk_1E5C724D8;
  void block[4] = self;
  dispatch_async(MEMORY[0x1E4F14428], block);
}

uint64_t __59__SFFormAutocompleteState_oneTimeCodeProviderReceivedCode___block_invoke(uint64_t a1)
{
  uint64_t v2 = WBS_LOG_CHANNEL_PREFIXOneTimeCodeAutoFill();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG)) {
    __59__SFFormAutocompleteState_oneTimeCodeProviderReceivedCode___block_invoke_cold_1(v2);
  }
  return [*(id *)(a1 + 32) updateSuggestions];
}

- (void)newAutoFillablePasskeysAvailable:(id)a3
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __60__SFFormAutocompleteState_newAutoFillablePasskeysAvailable___block_invoke;
  block[3] = &unk_1E5C724D8;
  void block[4] = self;
  dispatch_async(MEMORY[0x1E4F14428], block);
}

void __60__SFFormAutocompleteState_newAutoFillablePasskeysAvailable___block_invoke(uint64_t a1)
{
  v12[1] = *MEMORY[0x1E4F143B8];
  uint64_t v3 = WBS_LOG_CHANNEL_PREFIXAutoFill();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1A690B000, v3, OS_LOG_TYPE_INFO, "Received new passkeys available notification. Refreshing AutoFill state.", buf, 2u);
  }
  [*(id *)(a1 + 32) _clearCachedCredentials];
  [*(id *)(a1 + 32) updateSuggestions];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __60__SFFormAutocompleteState_newAutoFillablePasskeysAvailable___block_invoke_430;
  v9[3] = &unk_1E5C72420;
  v9[4] = *(void *)(a1 + 32);
  uint64_t v4 = (void *)MEMORY[0x1AD0C36A0](v9);
  uint64_t v5 = *(void *)(*(void *)(a1 + 32) + 96);
  uint64_t v6 = MEMORY[0x1AD0C36A0]();
  id v7 = (void *)v6;
  if (v5)
  {
    v12[0] = v6;
    id v1 = [MEMORY[0x1E4F1C978] arrayWithObjects:v12 count:1];
    [v1 arrayByAddingObjectsFromArray:*(void *)(*(void *)(a1 + 32) + 96)];
  }
  else
  {
    uint64_t v11 = v6;
    [MEMORY[0x1E4F1C978] arrayWithObjects:&v11 count:1];
  id v8 = };
  objc_storeStrong((id *)(*(void *)(a1 + 32) + 96), v8);
  if (v5)
  {

    id v8 = v1;
  }
}

void __60__SFFormAutocompleteState_newAutoFillablePasskeysAvailable___block_invoke_430(uint64_t a1, void *a2)
{
  id v11 = [a2 firstObject];
  uint64_t v3 = [v11 autoFillPasskey];

  if (v3)
  {
    uint64_t v4 = [SFCredentialDisplayData alloc];
    uint64_t v5 = detailStringForPasskey(v11);
    uint64_t v6 = [v11 savedAccount];
    id v7 = [v6 creationDate];
    id v8 = [(SFCredentialDisplayData *)v4 initWithMatch:v11 detail:v5 creationDate:v7];

    id v9 = [*(id *)(a1 + 32) _textSuggestionForCredentialDisplayData:v8 submitForm:1];
    id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 16));
    [WeakRetained updateExistingStreamlinedSuggestionIfNecessary:v9];
  }
}

- (void)_clearCachedCredentials
{
  cachedCredentialMatches = self->_cachedCredentialMatches;
  self->_cachedCredentialMatches = 0;

  cachedRelatedCredentialMatches = self->_cachedRelatedCredentialMatches;
  self->_cachedRelatedCredentialMatches = 0;

  cachedExternalCredentialIdentities = self->_cachedExternalCredentialIdentities;
  self->_cachedExternalCredentialIdentities = 0;
}

- (id)externalCredentialIdentities
{
  if (self->_cachedExternalCredentialIdentities) {
    return self->_cachedExternalCredentialIdentities;
  }
  else {
    return MEMORY[0x1E4F1CBF0];
  }
}

- (id)_textSuggestionForExternalCredentialIdentity:(id)a3 submitForm:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  id v7 = +[_SFTextSuggestion textSuggestionWithCredentialIdentity:v6 submitForm:v4];
  id v8 = [v6 user];
  id v9 = +[SFCredentialDisplayData descriptionForPasswordWithUser:v8 creationDate:0];
  [v7 setDisplayText:v9];

  uint64_t v10 = (void *)MEMORY[0x1E4F98250];
  id v11 = [(SFFormAutoFillFrameHandle *)self->_frame webui_URL];
  id v12 = [v10 titleForCredentialIdentity:v6 formURL:v11];

  [v7 setHeaderText:v12];

  return v7;
}

- (BOOL)_shouldAllowExternalPasswordAutoFillOnURL:(id)a3
{
  id v3 = a3;
  BOOL v4 = [MEMORY[0x1E4F98208] sharedFeatureManager];
  if ([v4 shouldAutoFillPasswords])
  {
    uint64_t v5 = (void *)MEMORY[0x1E4F98C88];
    id v6 = [v3 host];
    if ([v5 mayAutoFillPasswordOnHost:v6])
    {
      id v7 = [MEMORY[0x1E4F98230] sharedManager];
      id v8 = [v7 getEnabledExtensionsSynchronously];
      BOOL v9 = [v8 count] != 0;
    }
    else
    {
      BOOL v9 = 0;
    }
  }
  else
  {
    BOOL v9 = 0;
  }

  return v9;
}

- (void)_fillCredentialIdentity:(id)a3 submitForm:(BOOL)a4
{
  id v6 = a3;
  id v7 = [v6 owningExtensionState];
  id v8 = [v7 providerBundleID];

  BOOL v9 = [MEMORY[0x1E4F98230] sharedManager];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __62__SFFormAutocompleteState__fillCredentialIdentity_submitForm___block_invoke;
  v11[3] = &unk_1E5C75A58;
  BOOL v13 = a4;
  void v11[4] = self;
  id v12 = v6;
  id v10 = v6;
  [v9 getExtensionWithBundleID:v8 completion:v11];
}

void __62__SFFormAutocompleteState__fillCredentialIdentity_submitForm___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __62__SFFormAutocompleteState__fillCredentialIdentity_submitForm___block_invoke_2;
  v6[3] = &unk_1E5C75148;
  BOOL v4 = *(void **)(a1 + 40);
  void v6[4] = *(void *)(a1 + 32);
  char v9 = *(unsigned char *)(a1 + 48);
  id v7 = v4;
  id v8 = v3;
  id v5 = v3;
  dispatch_async(MEMORY[0x1E4F14428], v6);
}

void __62__SFFormAutocompleteState__fillCredentialIdentity_submitForm___block_invoke_2(uint64_t a1)
{
  *(unsigned char *)(*(void *)(a1 + 32) + 168) = *(unsigned char *)(a1 + 56);
  uint64_t v2 = [*(id *)(a1 + 40) type];
  if (v2 != 4)
  {
    if (v2 == 2)
    {
      id v21 = *(void **)(*(void *)(a1 + 32) + 192);
      uint64_t v22 = (void *)MEMORY[0x1E4F28B50];
      id v23 = *(id *)(a1 + 40);
      uint64_t v24 = [v22 mainBundle];
      uint64_t v25 = [v24 bundleIdentifier];
      uint64_t v26 = [v23 serviceIdentifier];
      uint64_t v27 = [v23 credentialID];
      v29[0] = MEMORY[0x1E4F143A8];
      v29[1] = 3221225472;
      void v29[2] = __62__SFFormAutocompleteState__fillCredentialIdentity_submitForm___block_invoke_3;
      v29[3] = &unk_1E5C75A30;
      void v29[4] = *(void *)(a1 + 32);
      id v30 = *(id *)(a1 + 48);
      [v21 getExternalPasskeyRequestForApplicationIdentifier:v25 relyingPartyIdentifier:v26 credentialID:v27 completionHandler:v29];

      return;
    }
    if (v2 != 1) {
      return;
    }
    id v3 = objc_alloc(MEMORY[0x1E4F18B00]);
    uint64_t v4 = *(void *)(a1 + 48);
    id v5 = (void *)[objc_alloc(MEMORY[0x1E4F18AD0]) initWithFoundationCredentialIdentity:*(void *)(a1 + 40)];
    uint64_t v6 = [v3 initWithExtension:v4 credentialIdentity:v5];
    uint64_t v7 = *(void *)(a1 + 32);
    id v8 = *(void **)(v7 + 152);
    *(void *)(v7 + 152) = v6;

    goto LABEL_7;
  }
  char v9 = [MEMORY[0x1E4F98230] sharedManager];
  id v10 = (void **)(a1 + 48);
  char v11 = [v9 extensionSupportsOneTimeCodes:*(void *)(a1 + 48)];

  if (v11)
  {
    id v12 = objc_alloc(MEMORY[0x1E4F18B00]);
    uint64_t v13 = *(void *)(a1 + 48);
    id v14 = objc_alloc(MEMORY[0x1E4F18AC0]);
    id v15 = (void *)[objc_alloc(MEMORY[0x1E4F18AB8]) _initWithFoundationCredentialIdentity:*(void *)(a1 + 40)];
    id v16 = (void *)[v14 initWithCredentialIdentity:v15];
    uint64_t v17 = [v12 initWithExtension:v13 oneTimeCodeCredentialRequest:v16];
    uint64_t v18 = *(void *)(a1 + 32);
    uint64_t v19 = *(void **)(v18 + 152);
    *(void *)(v18 + 152) = v17;

LABEL_7:
    objc_msgSend(*(id *)(*(void *)(a1 + 32) + 152), "setDelegate:");
    uint64_t v20 = *(void **)(*(void *)(a1 + 32) + 152);
    [v20 setDismissOnBackground:1];
    return;
  }
  id v28 = WBS_LOG_CHANNEL_PREFIXAutoFill();
  if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR)) {
    __62__SFFormAutocompleteState__fillCredentialIdentity_submitForm___block_invoke_2_cold_1(v10, v28);
  }
}

uint64_t __62__SFFormAutocompleteState__fillCredentialIdentity_submitForm___block_invoke_3(uint64_t result, void *a2)
{
  if (a2)
  {
    uint64_t v2 = result;
    id v3 = (objc_class *)MEMORY[0x1E4F18B00];
    id v4 = a2;
    uint64_t v5 = [[v3 alloc] initWithExtension:*(void *)(v2 + 40) passkeyAssertionRequest:v4];

    uint64_t v6 = *(void *)(v2 + 32);
    uint64_t v7 = *(void **)(v6 + 152);
    *(void *)(v6 + 152) = v5;

    objc_msgSend(*(id *)(*(void *)(v2 + 32) + 152), "setDelegate:");
    id v8 = *(void **)(*(void *)(v2 + 32) + 152);
    return [v8 setDismissOnBackground:1];
  }
  return result;
}

- (void)_fillASPasswordCredential:(id)a3 needsAuthentication:(BOOL)a4 setAutoFilled:(BOOL)a5 submitForm:(BOOL)a6
{
  BOOL v6 = a6;
  BOOL v7 = a5;
  BOOL v8 = a4;
  id v10 = (void *)MEMORY[0x1E4F18D88];
  id v11 = a3;
  id v12 = [v11 user];
  uint64_t v13 = [v11 password];

  objc_msgSend(v10, "safari_credentialWithUser:password:persistence:", v12, v13, 0);
  id v14 = (id)objc_claimAutoreleasedReturnValue();

  if (v8) {
    [(SFFormAutocompleteState *)self _fillCredentialAfterAuthenticationIfNeeded:v14 setAsDefaultCredential:0 submitForm:v6];
  }
  else {
    [(SFFormAutocompleteState *)self _fillCredential:v14 setAutoFilled:v7 setAsDefaultCredential:0 focusFieldAfterFilling:v6 submitForm:v6];
  }
}

- (void)_fillASOneTimeCodeCredential:(id)a3 setAutoFilled:(BOOL)a4 submitForm:(BOOL)a5
{
  BOOL v5 = a5;
  p_autoFillController = &self->_autoFillController;
  id v8 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)p_autoFillController);
  frame = self->_frame;
  id v10 = [v8 code];

  [WeakRetained autoFillOneTimeCodeFieldsInFrame:frame withValue:v10 shouldSubmit:v5];
  [(SFFormAutocompleteState *)self updateSuggestions];
}

- (id)_actionForPresentingPasswordManagerExtension:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  objc_initWeak(&location, self);
  id v8 = [MEMORY[0x1E4F98230] sharedManager];
  char v9 = [v8 displayNameForExtension:v6];

  id v10 = NSString;
  id v11 = _WBSLocalizedString();
  id v12 = objc_msgSend(v10, "stringWithFormat:", v11, v9);

  uint64_t v13 = (void *)MEMORY[0x1E4FB1410];
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  void v18[2] = __90__SFFormAutocompleteState__actionForPresentingPasswordManagerExtension_completionHandler___block_invoke;
  v18[3] = &unk_1E5C75A80;
  objc_copyWeak(&v21, &location);
  id v14 = v6;
  id v19 = v14;
  id v15 = v7;
  id v20 = v15;
  id v16 = [v13 _actionWithTitle:v12 image:0 style:0 handler:v18 shouldDismissHandler:&__block_literal_global_440];

  objc_destroyWeak(&v21);
  objc_destroyWeak(&location);

  return v16;
}

void __90__SFFormAutocompleteState__actionForPresentingPasswordManagerExtension_completionHandler___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  [WeakRetained _presentCredentialListForExtension:*(void *)(a1 + 32) completionHandler:*(void *)(a1 + 40)];
}

uint64_t __90__SFFormAutocompleteState__actionForPresentingPasswordManagerExtension_completionHandler___block_invoke_2()
{
  return 1;
}

- (void)_presentCredentialListForExtension:(id)a3 completionHandler:(id)a4
{
  v31[1] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  id v8 = v7;
  if (v7)
  {
    p_externalCredentialListCompletionHandlers = &self->_externalCredentialListCompletionHandlers;
    externalCredentialListCompletionHandlers = self->_externalCredentialListCompletionHandlers;
    id v11 = (void *)MEMORY[0x1AD0C36A0](v7);
    id v12 = [(NSArray *)externalCredentialListCompletionHandlers arrayByAddingObject:v11];
    if (v12)
    {
      objc_storeStrong((id *)&self->_externalCredentialListCompletionHandlers, v12);
    }
    else
    {
      uint64_t v13 = (void *)MEMORY[0x1AD0C36A0](v8);
      v31[0] = v13;
      uint64_t v14 = [MEMORY[0x1E4F1C978] arrayWithObjects:v31 count:1];
      id v15 = *p_externalCredentialListCompletionHandlers;
      *p_externalCredentialListCompletionHandlers = (NSArray *)v14;
    }
  }
  id v16 = objc_alloc(MEMORY[0x1E4F18AB0]);
  uint64_t v17 = [(SFFormAutoFillFrameHandle *)self->_frame webui_URL];
  uint64_t v18 = objc_msgSend(v17, "safari_originalDataAsString");
  id v19 = (void *)[v16 initWithIdentifier:v18 type:1];
  id v30 = v19;
  id v20 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v30 count:1];

  authenticationServicesAgentProxy = self->_authenticationServicesAgentProxy;
  uint64_t v22 = [MEMORY[0x1E4F28B50] mainBundle];
  id v23 = [v22 bundleIdentifier];
  v26[0] = MEMORY[0x1E4F143A8];
  v26[1] = 3221225472;
  v26[2] = __80__SFFormAutocompleteState__presentCredentialListForExtension_completionHandler___block_invoke;
  v26[3] = &unk_1E5C75AA8;
  id v27 = v6;
  id v28 = v20;
  uint64_t v29 = self;
  id v24 = v20;
  id v25 = v6;
  [(WBSAuthenticationServicesAgentProxy *)authenticationServicesAgentProxy getPasskeyAssertionRequestParametersForApplicationIdentifier:v23 completionHandler:v26];
}

void __80__SFFormAutocompleteState__presentCredentialListForExtension_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3 = (objc_class *)MEMORY[0x1E4F18B08];
  id v4 = a2;
  id v6 = (id)[[v3 alloc] initWithExtension:*(void *)(a1 + 32) serviceIdentifiers:*(void *)(a1 + 40) requestParameters:v4];

  [v6 setDelegate:*(void *)(a1 + 48)];
  [v6 setDismissOnBackground:1];
  BOOL v5 = [*(id *)(a1 + 48) _viewControllerToPresentFrom];
  [v5 presentViewController:v6 animated:1 completion:0];
}

- (void)credentialListViewController:(id)a3 didFinishWithCredential:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = self->_externalCredentialListCompletionHandlers;
  externalCredentialListCompletionHandlers = self->_externalCredentialListCompletionHandlers;
  self->_externalCredentialListCompletionHandlers = 0;

  v24[0] = MEMORY[0x1E4F143A8];
  v24[1] = 3221225472;
  v24[2] = __91__SFFormAutocompleteState_credentialListViewController_didFinishWithCredential_completion___block_invoke;
  v24[3] = &unk_1E5C73380;
  id v23 = v11;
  id v25 = v23;
  id v26 = v10;
  id v22 = v10;
  [v8 dismissViewControllerAnimated:1 completion:v24];
  if (v9) {
    [(SFFormAutocompleteState *)self _fillASPasswordCredential:v9 needsAuthentication:0 setAutoFilled:0 submitForm:0];
  }
  id WeakRetained = objc_loadWeakRetained((id *)&self->_autoFillController);
  uint64_t v14 = +[_SFFormDataController sharedController];
  id v15 = [v9 user];
  id v16 = [v8 extension];
  uint64_t v17 = objc_msgSend(v16, "sf_bundleIdentifierForContainingApp");
  uint64_t v18 = [WeakRetained tabIDForAutoFill];
  id v19 = [(SFFormAutoFillFrameHandle *)self->_frame webui_URL];
  [WeakRetained webView];
  id v21 = v20 = v8;
  objc_msgSend(v14, "didFillPasswordForUsername:fromProviderWithBundleIdentifier:inTabWithID:currentURL:isPrivate:", v15, v17, v18, v19, objc_msgSend(v21, "webui_privateBrowsingEnabled"));
}

uint64_t __91__SFFormAutocompleteState_credentialListViewController_didFinishWithCredential_completion___block_invoke(uint64_t a1)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  id v2 = *(id *)(a1 + 32);
  uint64_t v3 = [v2 countByEnumeratingWithState:&v8 objects:v12 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v9;
    do
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v9 != v5) {
          objc_enumerationMutation(v2);
        }
        (*(void (**)(void))(*(void *)(*((void *)&v8 + 1) + 8 * v6) + 16))(*(void *)(*((void *)&v8 + 1) + 8 * v6));
        ++v6;
      }
      while (v4 != v6);
      uint64_t v4 = [v2 countByEnumeratingWithState:&v8 objects:v12 count:16];
    }
    while (v4);
  }

  uint64_t result = *(void *)(a1 + 40);
  if (result) {
    return (*(uint64_t (**)(uint64_t))(result + 16))(result);
  }
  return result;
}

- (void)credentialListViewController:(id)a3 didFinishWithOneTimeCodeCredential:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  long long v11 = self->_externalCredentialListCompletionHandlers;
  externalCredentialListCompletionHandlers = self->_externalCredentialListCompletionHandlers;
  self->_externalCredentialListCompletionHandlers = 0;

  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __102__SFFormAutocompleteState_credentialListViewController_didFinishWithOneTimeCodeCredential_completion___block_invoke;
  block[3] = &unk_1E5C75AD0;
  id v18 = v8;
  id v19 = v11;
  id v21 = self;
  id v22 = v10;
  id v20 = v9;
  id v13 = v9;
  id v14 = v10;
  id v15 = v11;
  id v16 = v8;
  dispatch_async(MEMORY[0x1E4F14428], block);
}

void __102__SFFormAutocompleteState_credentialListViewController_didFinishWithOneTimeCodeCredential_completion___block_invoke(uint64_t a1)
{
  uint64_t v4 = MEMORY[0x1E4F143A8];
  uint64_t v5 = 3221225472;
  uint64_t v6 = __102__SFFormAutocompleteState_credentialListViewController_didFinishWithOneTimeCodeCredential_completion___block_invoke_2;
  id v7 = &unk_1E5C73380;
  id v2 = *(void **)(a1 + 32);
  id v8 = *(id *)(a1 + 40);
  id v9 = *(id *)(a1 + 64);
  [v2 dismissViewControllerAnimated:1 completion:&v4];
  uint64_t v3 = *(void *)(a1 + 48);
  if (v3) {
    objc_msgSend(*(id *)(a1 + 56), "_fillASOneTimeCodeCredential:setAutoFilled:submitForm:", v3, 0, 0, v4, v5, v6, v7, v8);
  }
}

uint64_t __102__SFFormAutocompleteState_credentialListViewController_didFinishWithOneTimeCodeCredential_completion___block_invoke_2(uint64_t a1)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  id v2 = *(id *)(a1 + 32);
  uint64_t v3 = [v2 countByEnumeratingWithState:&v8 objects:v12 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v9;
    do
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v9 != v5) {
          objc_enumerationMutation(v2);
        }
        (*(void (**)(void))(*(void *)(*((void *)&v8 + 1) + 8 * v6) + 16))(*(void *)(*((void *)&v8 + 1) + 8 * v6));
        ++v6;
      }
      while (v4 != v6);
      uint64_t v4 = [v2 countByEnumeratingWithState:&v8 objects:v12 count:16];
    }
    while (v4);
  }

  uint64_t result = *(void *)(a1 + 40);
  if (result) {
    return (*(uint64_t (**)(uint64_t))(result + 16))(result);
  }
  return result;
}

- (void)presentUIForPasswordCredentialAuthenticationViewController:(id)a3
{
  id v4 = a3;
  id v5 = [(SFFormAutocompleteState *)self _viewControllerToPresentFrom];
  [v5 presentViewController:v4 animated:1 completion:0];
}

- (void)credentialAuthenticationViewController:(id)a3 didFinishWithCredential:(id)a4 error:(id)a5 completion:(id)a6
{
  id v22 = a3;
  id v9 = a4;
  BOOL submitExternalCredential = self->_submitExternalCredential;
  self->_BOOL submitExternalCredential = 0;
  externalCredentialViewController = self->_externalCredentialViewController;
  self->_externalCredentialViewController = 0;
  id v12 = a6;

  uint64_t v13 = [v22 presentingViewController];

  [v22 dismissViewControllerAnimated:1 completion:v12];
  if (v9) {
    [(SFFormAutocompleteState *)self _fillASPasswordCredential:v9 needsAuthentication:v13 == 0 setAutoFilled:1 submitForm:submitExternalCredential];
  }
  id WeakRetained = objc_loadWeakRetained((id *)&self->_autoFillController);
  id v15 = +[_SFFormDataController sharedController];
  id v16 = [v9 user];
  uint64_t v17 = [v22 extension];
  id v18 = objc_msgSend(v17, "sf_bundleIdentifierForContainingApp");
  id v19 = [WeakRetained tabIDForAutoFill];
  id v20 = [(SFFormAutoFillFrameHandle *)self->_frame webui_URL];
  id v21 = [WeakRetained webView];
  objc_msgSend(v15, "didFillPasswordForUsername:fromProviderWithBundleIdentifier:inTabWithID:currentURL:isPrivate:", v16, v18, v19, v20, objc_msgSend(v21, "webui_privateBrowsingEnabled"));
}

- (void)credentialAuthenticationViewController:(id)a3 didFinishWithOneTimeCodeCredential:(id)a4 error:(id)a5 completion:(id)a6
{
  id v14 = a4;
  BOOL submitExternalCredential = self->_submitExternalCredential;
  self->_BOOL submitExternalCredential = 0;
  externalCredentialViewController = self->_externalCredentialViewController;
  self->_externalCredentialViewController = 0;
  id v11 = a6;
  id v12 = a3;

  [v12 dismissViewControllerAnimated:1 completion:v11];
  uint64_t v13 = v14;
  if (v14)
  {
    [(SFFormAutocompleteState *)self _fillASOneTimeCodeCredential:v14 setAutoFilled:1 submitForm:submitExternalCredential];
    uint64_t v13 = v14;
  }
}

- (void)credentialAuthenticationViewController:(id)a3 didFinishWithPasskeyAssertionCredential:(id)a4 error:(id)a5 completion:(id)a6
{
  externalCredentialViewController = self->_externalCredentialViewController;
  self->_externalCredentialViewController = 0;
  id v10 = a6;
  id v12 = a4;
  id v11 = a3;

  [v11 dismissViewControllerAnimated:1 completion:v10];
  [(SFFormAutocompleteState *)self _completePasskeyAssertionWithCredential:v12 completionHandler:v10];
}

- (void)credentialListViewController:(id)a3 didFinishWithPasskeyAssertionCredential:(id)a4 completion:(id)a5
{
  id v8 = a3;
  uint64_t v12 = MEMORY[0x1E4F143A8];
  uint64_t v13 = 3221225472;
  id v14 = __107__SFFormAutocompleteState_credentialListViewController_didFinishWithPasskeyAssertionCredential_completion___block_invoke;
  id v15 = &unk_1E5C72238;
  id v16 = v8;
  uint64_t v17 = self;
  id v9 = v8;
  id v10 = a5;
  id v11 = a4;
  dispatch_async(MEMORY[0x1E4F14428], &v12);
  -[SFFormAutocompleteState _completePasskeyAssertionWithCredential:completionHandler:](self, "_completePasskeyAssertionWithCredential:completionHandler:", v11, v10, v12, v13, v14, v15);
}

uint64_t __107__SFFormAutocompleteState_credentialListViewController_didFinishWithPasskeyAssertionCredential_completion___block_invoke(uint64_t a1)
{
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __107__SFFormAutocompleteState_credentialListViewController_didFinishWithPasskeyAssertionCredential_completion___block_invoke_2;
  v3[3] = &unk_1E5C724D8;
  id v1 = *(void **)(a1 + 32);
  void v3[4] = *(void *)(a1 + 40);
  return [v1 dismissViewControllerAnimated:1 completion:v3];
}

void __107__SFFormAutocompleteState_credentialListViewController_didFinishWithPasskeyAssertionCredential_completion___block_invoke_2(uint64_t a1)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v2 = *(id *)(*(void *)(a1 + 32) + 160);
  uint64_t v3 = *(void *)(a1 + 32);
  id v4 = *(void **)(v3 + 160);
  *(void *)(v3 + 160) = 0;

  long long v12 = 0u;
  long long v13 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  id v5 = v2;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v11;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v11 != v8) {
          objc_enumerationMutation(v5);
        }
        (*(void (**)(void))(*(void *)(*((void *)&v10 + 1) + 8 * v9) + 16))(*(void *)(*((void *)&v10 + 1) + 8 * v9));
        ++v9;
      }
      while (v7 != v9);
      uint64_t v7 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v7);
  }
}

- (void)_completePasskeyAssertionWithCredential:(id)a3 completionHandler:(id)a4
{
  self->_BOOL submitExternalCredential = 0;
  authenticationServicesAgentProxy = self->_authenticationServicesAgentProxy;
  uint64_t v6 = (void *)MEMORY[0x1E4F28B50];
  uint64_t v7 = (void (**)(void))a4;
  id v8 = a3;
  uint64_t v9 = [v6 mainBundle];
  long long v10 = [v9 bundleIdentifier];
  long long v11 = [v8 relyingParty];
  long long v12 = [v8 authenticatorData];
  long long v13 = [v8 signature];
  id v14 = [v8 userHandle];
  uint64_t v15 = [v8 credentialID];

  [(WBSAuthenticationServicesAgentProxy *)authenticationServicesAgentProxy completeAssertionWithExternalPasskeyForApplicationIdentifier:v10 relyingPartyIdentifier:v11 authenticatorData:v12 signature:v13 userHandle:v14 credentialID:v15];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __85__SFFormAutocompleteState__completePasskeyAssertionWithCredential_completionHandler___block_invoke;
  block[3] = &unk_1E5C724D8;
  void block[4] = self;
  dispatch_async(MEMORY[0x1E4F14428], block);
  v7[2](v7);
}

void __85__SFFormAutocompleteState__completePasskeyAssertionWithCredential_completionHandler___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 16));
  [WeakRetained didCompleteWithPasskey];
}

- (void)setAction:(int64_t)a3
{
  self->_int64_t action = a3;
}

- (_SFFormAutoFillInputSession)inputSession
{
  return self->_inputSession;
}

- (WBSMultiRoundAutoFillManager)multiRoundAutoFillManager
{
  return self->_multiRoundAutoFillManager;
}

- (SFFormAutoFillFrameHandle)frame
{
  return self->_frame;
}

- (WBSFormMetadata)formMetadata
{
  return self->_formMetadata;
}

- (WBSFormControlMetadata)textFieldMetadata
{
  return self->_textFieldMetadata;
}

- (WBSCreditCardData)previouslySelectedVirtualCardWhereUserRequestedToIncreaseBalance
{
  return self->_previouslySelectedVirtualCardWhereUserRequestedToIncreaseBalance;
}

- (void)setPreviouslySelectedVirtualCardWhereUserRequestedToIncreaseBalance:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_previouslySelectedVirtualCardWhereUserRequestedToIncreaseBalance, 0);
  objc_storeStrong((id *)&self->_textFieldMetadata, 0);
  objc_storeStrong((id *)&self->_formMetadata, 0);
  objc_storeStrong((id *)&self->_frame, 0);
  objc_storeStrong((id *)&self->_multiRoundAutoFillManager, 0);
  objc_storeStrong((id *)&self->_authenticationServicesAgentProxy, 0);
  objc_storeStrong((id *)&self->_creditCardViewController, 0);
  objc_storeStrong((id *)&self->_hideMyEmailRecord, 0);
  objc_storeStrong((id *)&self->_externalCredentialListCompletionHandlers, 0);
  objc_storeStrong((id *)&self->_externalCredentialViewController, 0);
  objc_storeStrong((id *)&self->_cachedExternalCredentialIdentities, 0);
  objc_storeStrong((id *)&self->_metadataCorrector, 0);
  objc_storeStrong(&self->_creditCardCaptureCompletionHandler, 0);
  objc_storeStrong(&self->_customAutoFillContactCompletionHandler, 0);
  objc_storeStrong(&self->_displayOtherContactsCompletionHandler, 0);
  objc_storeStrong((id *)&self->_credentialMatchesCompletionHandlers, 0);
  objc_storeStrong((id *)&self->_cachedRelatedCredentialMatches, 0);
  objc_storeStrong((id *)&self->_cachedCredentialMatches, 0);
  objc_storeStrong((id *)&self->_prefixForSuggestions, 0);
  objc_storeStrong((id *)&self->_inputSession, 0);
  objc_storeStrong((id *)&self->_formValues, 0);
  objc_storeStrong((id *)&self->_emptyInputView, 0);
  objc_destroyWeak((id *)&self->_dataController);

  objc_destroyWeak((id *)&self->_autoFillController);
}

void __46__SFFormAutocompleteState__updateSuggestions___block_invoke_3_cold_1(os_log_t log)
{
  *(_WORD *)id v1 = 0;
  _os_log_debug_impl(&dword_1A690B000, log, OS_LOG_TYPE_DEBUG, "Did not suggested verification code autofill because no text field is focused", v1, 2u);
}

void __46__SFFormAutocompleteState__updateSuggestions___block_invoke_3_cold_2()
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_3();
  _os_log_debug_impl(&dword_1A690B000, v0, OS_LOG_TYPE_DEBUG, "Adding verification code suggestions: %{private}@", v1, 0xCu);
}

- (void)_didGatherESimInformation
{
  id v3 = a1;
  id v4 = objc_msgSend(a2, "safari_privacyPreservingDescription");
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0_0(&dword_1A690B000, v5, v6, "Did not retrieve device identifier from CoreTelephony with error %{public}@.", v7, v8, v9, v10, v11);
}

- (void)_autofillESimData:(void *)a1 .cold.1(void *a1, void *a2)
{
  id v3 = a1;
  id v4 = objc_msgSend(a2, "safari_privacyPreservingDescription");
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0_0(&dword_1A690B000, v5, v6, "Did not retrieve autofill value from CoreTelephony with error %@.", v7, v8, v9, v10, v11);
}

- (void)_fillSavedAccount:setAutoFilled:setAsDefaultCredential:focusFieldAfterFilling:submitForm:.cold.1()
{
  uint64_t v3 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0_4(&dword_1A690B000, v0, v1, "Tried to fill password but didn't have control unique ID for metadata: %{private}@", v2);
}

void __73__SFFormAutocompleteState__offerToAutoFillFromPotentialCredentialMatches__block_invoke_cold_1()
{
  os_log_t v0 = [NSString stringWithFormat:&stru_1EFB97EB8];
  uint64_t v1 = NSString;
  uint64_t v2 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/SafariServices/iOS/MobileSafari/SafariServices/SFFormAutocompleteState.m"];
  uint64_t v3 = [v2 lastPathComponent];
  if ([v0 length])
  {
    uint64_t v5 = [NSString stringWithFormat:@", %@", v0];
    uint64_t v4 = [v1 stringWithFormat:@"ASSERTION FAILURE: \"%s\" in %s, %@:%d%@", "!match", "-[SFFormAutocompleteState _offerToAutoFillFromPotentialCredentialMatches]_block_invoke", v3, 1697, v5];
  }
  else
  {
    uint64_t v4 = [v1 stringWithFormat:@"ASSERTION FAILURE: \"%s\" in %s, %@:%d%@", "!match", "-[SFFormAutocompleteState _offerToAutoFillFromPotentialCredentialMatches]_block_invoke", v3, 1697, &stru_1EFB97EB8];
  }

  uint64_t v6 = [MEMORY[0x1E4F29060] callStackSymbols];
  NSLog(&stru_1EFB9DC58.isa, v4, v6);

  abort();
}

- (void)_buildAndPresentOneTimeCodeAlertControllerWithExternalCredentialIdentities:(void *)a3 .cold.1(void *a1, uint8_t *a2, void *a3, NSObject *a4)
{
  *(_DWORD *)a2 = 138543362;
  *a3 = a1;
  OUTLINED_FUNCTION_0_4(&dword_1A690B000, a4, (uint64_t)a3, "Fetched one time code credential identities for extension that does not support one time codes: %{public}@", a2);
}

- (void)_buildAndPresentOneTimeCodeAlertControllerWithExternalCredentialIdentities:(void *)a3 .cold.2(void *a1, uint8_t *a2, void *a3, NSObject *a4)
{
  *(_DWORD *)a2 = 138412290;
  *a3 = a1;
  OUTLINED_FUNCTION_0_4(&dword_1A690B000, a4, (uint64_t)a3, "expected one time code credential identity, got type %@", a2);
}

void __59__SFFormAutocompleteState_oneTimeCodeProviderReceivedCode___block_invoke_cold_1(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_debug_impl(&dword_1A690B000, log, OS_LOG_TYPE_DEBUG, "Codes were updated", v1, 2u);
}

void __62__SFFormAutocompleteState__fillCredentialIdentity_submitForm___block_invoke_2_cold_1(void **a1, void *a2)
{
  uint64_t v2 = *a1;
  id v3 = a2;
  uint64_t v4 = [v2 identifier];
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0_0(&dword_1A690B000, v5, v6, "Fetched one time code credential identities for extension that does not support one time codes: %{public}@", v7, v8, v9, v10, v11);
}

@end