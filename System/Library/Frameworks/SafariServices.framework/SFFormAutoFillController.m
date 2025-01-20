@interface SFFormAutoFillController
@end

@implementation SFFormAutoFillController

void __72___SFFormAutoFillController_autoFillForm_inFrame_withGeneratedPassword___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = objc_alloc_init(MEMORY[0x1E4F98E00]);
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __72___SFFormAutoFillController_autoFillForm_inFrame_withGeneratedPassword___block_invoke_2;
  v6[3] = &unk_1E5C73108;
  id v7 = *(id *)(a1 + 32);
  [v4 setHandler:v6];
  if (v3)
  {
    v5 = +[_SFFormDataController sharedController];
    [v5 setGeneratedPassword:v3];
  }
}

void __72___SFFormAutoFillController_autoFillForm_inFrame_withGeneratedPassword___block_invoke_2(uint64_t a1)
{
}

void __72___SFFormAutoFillController_autoFillForm_inFrame_withGeneratedPassword___block_invoke_3(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = objc_alloc_init(MEMORY[0x1E4F98E00]);
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __72___SFFormAutoFillController_autoFillForm_inFrame_withGeneratedPassword___block_invoke_4;
  v6[3] = &unk_1E5C73108;
  id v7 = *(id *)(a1 + 32);
  [v4 setHandler:v6];
  if (v3)
  {
    v5 = +[_SFFormDataController sharedController];
    [v5 setGeneratedPassword:v3];
  }
}

void __72___SFFormAutoFillController_autoFillForm_inFrame_withGeneratedPassword___block_invoke_4(uint64_t a1)
{
}

void __60___SFFormAutoFillController_fieldWillFocusWithInputSession___block_invoke(uint64_t a1)
{
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    id v3 = WeakRetained;
    id v2 = objc_loadWeakRetained(WeakRetained + 1);
    [v2 _setSuppressSoftwareKeyboard:0];

    WeakRetained = v3;
  }
}

void __60___SFFormAutoFillController_fieldWillFocusWithInputSession___block_invoke_2(id *a1, void *a2)
{
  id v24 = a2;
  if (v24)
  {
    id v3 = objc_msgSend(a1[4], "webui_URL");
    id v4 = [v3 host];
    v5 = objc_msgSend(v4, "safari_highLevelDomainFromHost");

    if (!v5)
    {
      v6 = objc_msgSend(a1[4], "webui_URL");
      id v7 = [v6 host];
      v5 = objc_msgSend(v7, "safari_simplifiedSiteNameForCredentialLookup");
    }
    v8 = [a1[5] owningExtensionState];
    v9 = [v8 localizedDisplayName];

    if (!v9)
    {
      v10 = [MEMORY[0x1E4F98230] sharedManager];
      v11 = [v10 enabledExtensions];
      uint64_t v12 = [v11 count];

      if (v12)
      {
        v9 = _WBSLocalizedString();
      }
      else
      {
        v9 = 0;
      }
    }
    v13 = [a1[6] passwordElementUniqueID];

    if (a1[5])
    {
      v14 = (void *)[objc_alloc(MEMORY[0x1E4F881A0]) initWithCredentialIdentity:a1[5] host:v5 hasPasswordFieldToFill:v13 != 0];
    }
    else
    {
      id v15 = objc_alloc(MEMORY[0x1E4F881A0]);
      v16 = [v24 savedAccountMatch];
      v14 = (void *)[v15 initWithSavedAccountMatch:v16 host:v5 hasPasswordFieldToFill:v13 != 0];
    }
    v17 = [[_SFAutoFillInputView alloc] initWithStreamlinedAutoFillViewController:v14 suggestion:v24];
    v18 = a1[7];
    v19 = (void *)v18[24];
    v18[24] = v17;

    objc_msgSend(*((id *)a1[7] + 24), "setDelegate:");
    uint64_t v20 = *((void *)a1[7] + 24);
    v21 = [a1[8] formInputSession];
    [v21 setCustomInputView:v20];

    v22 = [a1[8] formInputSession];
    [v22 setAccessoryViewShouldNotShow:1];

    [a1[7] _hideInputAssistantItemsIfNecessary];
  }
  id WeakRetained = objc_loadWeakRetained((id *)a1[7] + 1);
  [WeakRetained _setSuppressSoftwareKeyboard:0];
}

void __108___SFFormAutoFillController__getExternalLoginCredentialSuggestionsForDomains_webFrameIdentifier_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = objc_alloc_init(MEMORY[0x1E4F98228]);
  v5 = *(void **)(a1 + 32);
  if (v3)
  {
    v6 = [v3 relyingPartyIdentifier];
    id v7 = [v5 arrayByAddingObject:v6];
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __108___SFFormAutoFillController__getExternalLoginCredentialSuggestionsForDomains_webFrameIdentifier_completion___block_invoke_2;
    v13[3] = &unk_1E5C73C80;
    id v15 = *(id *)(a1 + 40);
    id v14 = v4;
    [v14 fetchAllCredentialIdentitiesMatchingDomains:v7 completion:v13];
    v8 = &v15;
    v9 = &v14;
  }
  else
  {
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __108___SFFormAutoFillController__getExternalLoginCredentialSuggestionsForDomains_webFrameIdentifier_completion___block_invoke_3;
    v10[3] = &unk_1E5C73C80;
    id v12 = *(id *)(a1 + 40);
    id v11 = v4;
    [v11 fetchPasswordCredentialIdentitiesMatchingDomains:v5 completion:v10];
    v8 = &v12;
    v9 = &v11;
  }
}

void __108___SFFormAutoFillController__getExternalLoginCredentialSuggestionsForDomains_webFrameIdentifier_completion___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  [*(id *)(a1 + 32) invalidate];
}

void __108___SFFormAutoFillController__getExternalLoginCredentialSuggestionsForDomains_webFrameIdentifier_completion___block_invoke_3(uint64_t a1, void *a2)
{
  id v3 = a2;
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  [*(id *)(a1 + 32) invalidate];
}

void __116___SFFormAutoFillController__getExternalLoginCredentialSuggestionsForDomains_pageURL_webFrameIdentifier_completion___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a1 + 40);
  id v3 = [*(id *)(a1 + 48) _filterAndSortCredentialIdentities:a2 pageURL:*(void *)(a1 + 32) exactMatchesOnly:0];
  (*(void (**)(uint64_t))(v2 + 16))(v2);
}

uint64_t __89___SFFormAutoFillController__filterAndSortCredentialIdentities_pageURL_exactMatchesOnly___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "compareForQuickTypeBar:");
}

id __71___SFFormAutoFillController_didCollectURLsForPreFilling_atURL_inFrame___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2 = [a2 host];

  return v2;
}

void __71___SFFormAutoFillController_didCollectURLsForPreFilling_atURL_inFrame___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  id v18 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  if (WeakRetained)
  {
    id v3 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
    id v20 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
    long long v28 = 0u;
    long long v29 = 0u;
    long long v26 = 0u;
    long long v27 = 0u;
    id v4 = *(id *)(a1 + 32);
    uint64_t v5 = [v4 countByEnumeratingWithState:&v26 objects:v30 count:16];
    if (v5)
    {
      char v19 = 0;
      uint64_t v6 = *(void *)v27;
      do
      {
        for (uint64_t i = 0; i != v5; ++i)
        {
          if (*(void *)v27 != v6) {
            objc_enumerationMutation(v4);
          }
          v8 = *(void **)(*((void *)&v26 + 1) + 8 * i);
          v9 = [v8 host];
          if (v9)
          {
            v10 = [WeakRetained _preFillDisabledHosts];
            char v11 = [v10 containsObject:v9];

            if ((v11 & 1) == 0)
            {
              id v12 = [v3 objectForKeyedSubscript:v9];
              if (!v12)
              {
                id v12 = [(id)objc_opt_class() _filterAndSortCredentialIdentities:v18 pageURL:v8 exactMatchesOnly:1];
                [v3 setObject:v12 forKeyedSubscript:v9];
              }
              if ([v12 count])
              {
                v13 = [v12 objectAtIndexedSubscript:0];
                [v20 setObject:v13 forKeyedSubscript:v8];

                char v19 = 1;
              }
            }
          }
        }
        uint64_t v5 = [v4 countByEnumeratingWithState:&v26 objects:v30 count:16];
      }
      while (v5);
    }
    else
    {
      char v19 = 0;
    }

    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __71___SFFormAutoFillController_didCollectURLsForPreFilling_atURL_inFrame___block_invoke_3;
    block[3] = &unk_1E5C73D38;
    char v25 = v19 & 1;
    block[4] = WeakRetained;
    id v14 = *(id *)(a1 + 40);
    uint64_t v15 = *(void *)(a1 + 48);
    id v22 = v14;
    id v23 = v20;
    uint64_t v24 = v15;
    id v16 = v20;
    dispatch_async(MEMORY[0x1E4F14428], block);
  }
}

void __71___SFFormAutoFillController_didCollectURLsForPreFilling_atURL_inFrame___block_invoke_3(uint64_t a1)
{
  if (!*(unsigned char *)(a1 + 64)) {
    return;
  }
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 16));
  id v4 = [WeakRetained formAutoFillControllerURLForFormAutoFill:*(void *)(a1 + 32)];

  if (([*(id *)(a1 + 40) isEqual:v4] & 1) == 0)
  {
    uint64_t v3 = a1 + 56;
    goto LABEL_7;
  }
  objc_storeStrong((id *)(*(void *)(a1 + 32) + 224), *(id *)(a1 + 48));
  uint64_t v3 = a1 + 56;
  if (!*(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24))
  {
    [*(id *)(*(void *)(a1 + 32) + 32) collectFormMetadataForPrefillingAtURL:v4];
LABEL_7:
    *(unsigned char *)(*(void *)(*(void *)v3 + 8) + 24) = 1;
  }
}

void __71___SFFormAutoFillController_didCollectURLsForPreFilling_atURL_inFrame___block_invoke_217(uint64_t a1)
{
  uint64_t v2 = 0;
  do
  {
    uint64_t v3 = [*(id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) nextObject];

    if (!v3) {
      goto LABEL_5;
    }
    objc_opt_class();
    uint64_t v2 = v3;
  }
  while ((objc_opt_isKindOfClass() & 1) == 0);
  if (*(unsigned char *)(*(void *)(*(void *)(a1 + 64) + 8) + 24))
  {
LABEL_5:
    uint64_t v4 = *(void *)(*(void *)(a1 + 72) + 8);
    uint64_t v5 = *(void **)(v4 + 40);
    *(void *)(v4 + 40) = 0;

    goto LABEL_6;
  }
  v17[0] = 0;
  v17[1] = v17;
  v17[2] = 0x3032000000;
  v17[3] = __Block_byref_object_copy__215;
  v17[4] = __Block_byref_object_dispose__216;
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __71___SFFormAutoFillController_didCollectURLsForPreFilling_atURL_inFrame___block_invoke_2_218;
  v14[3] = &unk_1E5C73D88;
  uint64_t v6 = *(void **)(a1 + 40);
  v14[4] = *(void *)(a1 + 32);
  id v15 = v6;
  long long v16 = *(_OWORD *)(a1 + 64);
  id v18 = (id)MEMORY[0x1AD0C36A0](v14);
  id v7 = objc_alloc(MEMORY[0x1E4F98DF0]);
  v8 = [MEMORY[0x1E4F98ED0] queryThatMatchesEverything];
  v9 = [*(id *)(a1 + 48) webFrameIdentifier];
  v10 = (void *)[v7 initWithURL:v3 options:8 userNameQuery:v8 associatedDomainsManager:0 webFrameIdentifier:v9];

  char v11 = [*(id *)(a1 + 32) savedAccountContext];
  [v10 setContext:v11];

  id v12 = +[_SFFormDataController sharedController];
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __71___SFFormAutoFillController_didCollectURLsForPreFilling_atURL_inFrame___block_invoke_3_222;
  v13[3] = &unk_1E5C73DD8;
  void v13[4] = v17;
  [v12 getSavedAccountMatchesWithCriteria:v10 synchronously:0 completionHandler:v13];

  _Block_object_dispose(v17, 8);
LABEL_6:
}

void __71___SFFormAutoFillController_didCollectURLsForPreFilling_atURL_inFrame___block_invoke_2_218(uint64_t a1, void *a2)
{
  id v10 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 16));
  uint64_t v4 = [WeakRetained formAutoFillControllerURLForFormAutoFill:*(void *)(a1 + 32)];

  if (([*(id *)(a1 + 40) isEqual:v4] & 1) == 0) {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = 1;
  }
  uint64_t v5 = [v10 exactMatches];
  uint64_t v6 = [v5 count];

  if (v6)
  {
    if (!*(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24))
    {
      id v7 = [*(id *)(a1 + 32) _preFillDisabledHosts];
      v8 = [v4 host];
      char v9 = [v7 containsObject:v8];

      if ((v9 & 1) == 0)
      {
        [*(id *)(*(void *)(a1 + 32) + 32) collectFormMetadataForPrefillingAtURL:v4];
        *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = 1;
      }
    }
  }
  (*(void (**)(void))(*(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) + 16))();
}

void __71___SFFormAutoFillController_didCollectURLsForPreFilling_atURL_inFrame___block_invoke_3_222(uint64_t a1, void *a2)
{
  id v3 = a2;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __71___SFFormAutoFillController_didCollectURLsForPreFilling_atURL_inFrame___block_invoke_4;
  v6[3] = &unk_1E5C73DB0;
  uint64_t v4 = *(void *)(a1 + 32);
  id v7 = v3;
  uint64_t v8 = v4;
  id v5 = v3;
  dispatch_async(MEMORY[0x1E4F14428], v6);
}

void __71___SFFormAutoFillController_didCollectURLsForPreFilling_atURL_inFrame___block_invoke_4(uint64_t a1)
{
  (*(void (**)(void))(*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) + 16))();
  uint64_t v2 = *(void *)(*(void *)(a1 + 40) + 8);
  id v3 = *(void **)(v2 + 40);
  *(void *)(v2 + 40) = 0;
}

void __87___SFFormAutoFillController__authenticateForAutoFillForHighLevelDomain_withCompletion___block_invoke(uint64_t a1, uint64_t a2)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  uint64_t v5 = *(void *)(a1 + 32);
  id v8 = WeakRetained;
  if (WeakRetained)
  {
    uint64_t v6 = [WeakRetained authenticationContext];
    id v7 = [v6 authenticatedContext];
    (*(void (**)(uint64_t, uint64_t, void *))(v5 + 16))(v5, a2, v7);
  }
  else
  {
    (*(void (**)(uint64_t, void, void))(v5 + 16))(v5, 0, 0);
  }
}

uint64_t __69___SFFormAutoFillController_textDidChangeInTextField_inForm_inFrame___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _updateFormTelemetryDataMonitorWithFormMetadata:*(void *)(a1 + 40) textFieldMetadata:*(void *)(a1 + 48) textFieldValueLength:*(void *)(a1 + 56)];
}

uint64_t __68___SFFormAutoFillController_didFillGeneratedPasswordInForm_inFrame___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _updateFormTelemetryDataMonitorWithFormMetadata:*(void *)(a1 + 40) textFieldMetadata:0 textFieldValueLength:0];
}

void __59___SFFormAutoFillController_sendEventsForAutoFillTelemetry__block_invoke(uint64_t a1)
{
  [*(id *)(*(void *)(a1 + 32) + 120) sendTelemetryEventsOnFormSubmission];
  uint64_t v2 = *(void *)(a1 + 32);
  id v3 = *(void **)(v2 + 120);
  *(void *)(v2 + 120) = 0;
}

uint64_t __90___SFFormAutoFillController_reportAutoFillOfferedType_forTextFieldWithID_forFormMetadata___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) _createFormTelemetryDataMonitorIfNeeded];
  uint64_t v2 = *(void *)(a1 + 40);
  id v3 = *(void **)(*(void *)(a1 + 32) + 120);
  uint64_t v5 = *(void *)(a1 + 48);
  uint64_t v4 = *(void *)(a1 + 56);

  return [v3 updateAutoFillOfferedType:v4 forTextFieldWithID:v2 forFormMetadata:v5];
}

uint64_t __52___SFFormAutoFillController_autoFilledField_inForm___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _updateFormTelemetryDataMonitorWithFormMetadata:*(void *)(a1 + 40) textFieldMetadata:*(void *)(a1 + 48) textFieldValueLength:*(void *)(a1 + 56)];
}

uint64_t __91___SFFormAutoFillController_autoFillDidFinishWithUpdatedFormMetadata_inFrame_shouldSubmit___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) performPageLevelAutoFill];
}

uint64_t __99___SFFormAutoFillController_didRemoveAutomaticStrongPasswordInForm_inputSessionUserObject_inFrame___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _updateFormTelemetryDataMonitorWithFormMetadata:*(void *)(a1 + 40) textFieldMetadata:0 textFieldValueLength:0];
}

void __64___SFFormAutoFillController_replaceCurrentPasswordWithPassword___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __64___SFFormAutoFillController_replaceCurrentPasswordWithPassword___block_invoke_2;
  v5[3] = &unk_1E5C72628;
  v5[4] = *(void *)(a1 + 32);
  id v6 = v3;
  id v4 = v3;
  dispatch_async(MEMORY[0x1E4F14428], v5);
}

void __64___SFFormAutoFillController_replaceCurrentPasswordWithPassword___block_invoke_2(uint64_t a1)
{
  uint64_t v2 = [*(id *)(*(void *)(a1 + 32) + 160) frameHandle];
  uint64_t v3 = *(void *)(a1 + 32);
  id v4 = *(void **)(v3 + 152);
  *(void *)(v3 + 152) = v2;

  uint64_t v5 = *(void **)(a1 + 40);
  id v6 = (id *)(*(void *)(a1 + 32) + 144);

  objc_storeStrong(v6, v5);
}

void __64___SFFormAutoFillController_replaceCurrentPasswordWithPassword___block_invoke_3(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a2);
  id v4 = a2;
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

void __121___SFFormAutoFillController__beginAutomaticPasswordInteractionWithInputSession_generatedPassword_ignorePreviousDecision___block_invoke(uint64_t a1, void *a2, void *a3, void *a4, void *a5, void *a6)
{
  id v11 = a2;
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  uint64_t v16 = *(void *)(a1 + 32);
  v17 = *(void **)(v16 + 152);
  *(void *)(v16 + 152) = v11;
  id v29 = v11;

  uint64_t v18 = *(void *)(a1 + 32);
  char v19 = *(void **)(v18 + 168);
  *(void *)(v18 + 168) = v12;
  id v20 = v12;

  uint64_t v21 = *(void *)(a1 + 32);
  id v22 = *(void **)(v21 + 176);
  *(void *)(v21 + 176) = v13;
  id v23 = v13;

  uint64_t v24 = *(void *)(a1 + 32);
  char v25 = *(void **)(v24 + 144);
  *(void *)(v24 + 144) = v14;
  id v26 = v14;

  uint64_t v27 = *(void *)(a1 + 32);
  long long v28 = *(void **)(v27 + 136);
  *(void *)(v27 + 136) = v15;
}

uint64_t __121___SFFormAutoFillController__beginAutomaticPasswordInteractionWithInputSession_generatedPassword_ignorePreviousDecision___block_invoke_2(void *a1)
{
  return (*(uint64_t (**)(void, void, void, void, void, void))(a1[9] + 16))(a1[9], a1[4], a1[5], a1[6], a1[7], a1[8]);
}

void __121___SFFormAutoFillController_fillCurrentAutomaticStrongPasswordInCurrentFrameBlurringAfterSubstitution_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = objc_alloc_init(MEMORY[0x1E4F98E00]);
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __121___SFFormAutoFillController_fillCurrentAutomaticStrongPasswordInCurrentFrameBlurringAfterSubstitution_completionHandler___block_invoke_2;
  v5[3] = &unk_1E5C73108;
  id v6 = *(id *)(a1 + 32);
  [v4 setHandler:v5];
  if (v3) {
    [*(id *)(a1 + 40) setGeneratedPassword:v3];
  }
}

void __121___SFFormAutoFillController_fillCurrentAutomaticStrongPasswordInCurrentFrameBlurringAfterSubstitution_completionHandler___block_invoke_2(uint64_t a1)
{
}

void __121___SFFormAutoFillController_fillCurrentAutomaticStrongPasswordInCurrentFrameBlurringAfterSubstitution_completionHandler___block_invoke_3(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a2);
  id v4 = a2;
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

void __121___SFFormAutoFillController_fillCurrentAutomaticStrongPasswordInCurrentFrameBlurringAfterSubstitution_completionHandler___block_invoke_4(uint64_t a1)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  int v2 = [MEMORY[0x1E4F98AF8] isPasswordsAppInstalled];
  id v4 = *(void **)(a1 + 32);
  uint64_t v3 = *(void *)(a1 + 40);
  if (v2)
  {
    uint64_t v5 = [*(id *)(v3 + 56) frame];

    if (v4 != v5) {
      return;
    }
    uint64_t v3 = *(void *)(a1 + 40);
  }
  else if (v4 != *(void **)(v3 + 152))
  {
    return;
  }
  *(unsigned char *)(v3 + 283) = 1;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v6 = *(id *)(*(void *)(*(void *)(a1 + 64) + 8) + 40);
  uint64_t v7 = [v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v7)
  {
    uint64_t v8 = *(void *)v12;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v12 != v8) {
          objc_enumerationMutation(v6);
        }
        objc_msgSend(*(id *)(a1 + 40), "reportAutoFillOfferedType:forTextFieldWithID:forFormMetadata:", 1, *(void *)(*((void *)&v11 + 1) + 8 * v9++), *(void *)(a1 + 48), (void)v11);
      }
      while (v7 != v9);
      uint64_t v7 = [v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v7);
  }

  uint64_t v10 = *(void *)(a1 + 56);
  if (v10) {
    (*(void (**)(void))(v10 + 16))();
  }
}

void __87___SFFormAutoFillController_fillCreditCardData_inFrame_textFieldMetadata_formMetadata___block_invoke(id *a1, void *a2)
{
  id v3 = a2;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __87___SFFormAutoFillController_fillCreditCardData_inFrame_textFieldMetadata_formMetadata___block_invoke_2;
  v5[3] = &unk_1E5C73F68;
  objc_copyWeak(&v11, a1 + 8);
  id v6 = a1[4];
  id v7 = v3;
  id v8 = a1[5];
  id v9 = a1[6];
  id v10 = a1[7];
  id v4 = v3;
  dispatch_async(MEMORY[0x1E4F14428], v5);

  objc_destroyWeak(&v11);
}

void __87___SFFormAutoFillController_fillCreditCardData_inFrame_textFieldMetadata_formMetadata___block_invoke_2(uint64_t a1)
{
  uint64_t v38 = *MEMORY[0x1E4F143B8];
  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 72));
  id v3 = WeakRetained;
  if (WeakRetained && *((unsigned char *)WeakRetained + 284))
  {
    *((unsigned char *)WeakRetained + 284) = 0;
    id v4 = [MEMORY[0x1E4F1C9C8] now];
    [v4 timeIntervalSinceDate:*(void *)(a1 + 32)];
    double v6 = v5;

    double v7 = *MEMORY[0x1E4F992B0];
    if (v6 <= *MEMORY[0x1E4F992B0])
    {
      id v8 = [v3[7] textFieldMetadata];
      id v9 = [v3[7] frame];
      [v3 stopShowingSpinnerInFormSoon:v8 textFieldMetadata:v9 frame:v7 - v6];
    }
    else
    {
      id v8 = [v3[7] textFieldMetadata];
      id v9 = [v3[7] frame];
      [v3 setAutoFillSpinnerVisibility:0 textFieldMetadata:v8 frame:v9];
    }

    id v10 = [*(id *)(a1 + 40) cardNumber];
    uint64_t v11 = [v10 length];

    if (v11)
    {
      long long v12 = +[_SFFormDataController sharedController];
      id v35 = 0;
      id v36 = 0;
      id v34 = 0;
      [v12 getFormFieldValues:&v36 andFieldToFocus:&v35 andCreditCardDataTypesThatWillBeFilled:&v34 forCreditCardForm:*(void *)(a1 + 48) fromCreditCardData:*(void *)(a1 + 40)];
      id v13 = v36;
      id v14 = v36;
      id v15 = v35;
      id v16 = v34;
      id v29 = v34;

      objc_storeStrong(v3 + 38, v13);
      v17 = [*(id *)(a1 + 56) fieldsToObscureWhenFillingCreditCard:*(void *)(a1 + 40) formMetadata:*(void *)(a1 + 48)];
      long long v32 = 0u;
      long long v33 = 0u;
      long long v30 = 0u;
      long long v31 = 0u;
      uint64_t v18 = [v14 allKeys];
      uint64_t v19 = [v18 countByEnumeratingWithState:&v30 objects:v37 count:16];
      if (v19)
      {
        uint64_t v20 = *(void *)v31;
        do
        {
          uint64_t v21 = 0;
          do
          {
            if (*(void *)v31 != v20) {
              objc_enumerationMutation(v18);
            }
            [v3 reportAutoFillOfferedType:3 forTextFieldWithID:*(void *)(*((void *)&v30 + 1) + 8 * v21++) forFormMetadata:*(void *)(a1 + 48)];
          }
          while (v19 != v21);
          uint64_t v19 = [v18 countByEnumeratingWithState:&v30 objects:v37 count:16];
        }
        while (v19);
      }

      LOBYTE(v28) = 0;
      [v3 autoFillFormInFrame:*(void *)(a1 + 64) withValues:v3[38] setAutoFilled:1 focusFieldAfterFilling:1 fieldToFocus:v15 fieldsToObscure:v17 submitForm:v28];
      [*(id *)(a1 + 56) markCreditCardDataAsMostRecentlyUsed:*(void *)(a1 + 40)];
      objc_storeStrong(v3 + 40, *(id *)(a1 + 40));
      id v22 = [*(id *)(a1 + 40) virtualCard];
      BOOL v23 = v22 == 0;

      if (!v23)
      {
        id v24 = v3[41];
        if (!v24)
        {
          uint64_t v25 = [MEMORY[0x1E4F1CA80] set];
          id v26 = v3[41];
          v3[41] = (id)v25;

          id v24 = v3[41];
        }
        uint64_t v27 = [*(id *)(a1 + 40) cardNumber];
        [v24 addObject:v27];
      }
      objc_storeStrong(v3 + 42, v16);
      [v3[7] setAction:4];
      [v3[7] updateAutoFillButton];
    }
    else
    {
      [v3[7] presentUnavailableVirtualCardAlert];
    }
  }
}

void __57___SFFormAutoFillController_showSpinnerInFormSoon_frame___block_invoke(uint64_t a1)
{
  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 48));
  if (WeakRetained)
  {
    [WeakRetained[29] invalidate];
    id v2 = WeakRetained[29];
    WeakRetained[29] = 0;

    if (*((unsigned char *)WeakRetained + 284)) {
      [WeakRetained setAutoFillSpinnerVisibility:1 textFieldMetadata:*(void *)(a1 + 32) frame:*(void *)(a1 + 40)];
    }
  }
}

void __82___SFFormAutoFillController_stopShowingSpinnerInFormSoon_textFieldMetadata_frame___block_invoke(uint64_t a1)
{
  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 48));
  if (WeakRetained)
  {
    [WeakRetained[30] invalidate];
    id v2 = WeakRetained[30];
    WeakRetained[30] = 0;

    [WeakRetained setAutoFillSpinnerVisibility:0 textFieldMetadata:*(void *)(a1 + 32) frame:*(void *)(a1 + 40)];
  }
}

void __99___SFFormAutoFillController__collectDiagnosticsForAutoFillIncludingPageContents_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "setFormMetadata:");
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

void __89___SFFormAutoFillController__presentAutoFillInternalFeedbackActivityNotificationIfNeeded__block_invoke(uint64_t a1, void *a2)
{
  id v4 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained) {
    [*(id *)(a1 + 32) presentAutoFillInternalFeedbackToastForFormAutoFillController:WeakRetained diagnosticsDataWithoutPageContents:v4];
  }
}

id __64___SFFormAutoFillController__addValuesAutoFilledForCurrentPage___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v3 = 0;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      uint64_t v4 = [v2 stringValue];
      id v3 = v2;
      id v2 = (id)v4;
    }
    else
    {
      id v3 = v2;
      id v2 = 0;
    }
  }

  return v2;
}

void __66___SFFormAutoFillController_fetchIconForURLWithCompletionHandler___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2 = *(void *)(a1 + 32);
  id v3 = [a2 touchIcon];
  (*(void (**)(uint64_t))(v2 + 16))(v2);
}

uint64_t __83___SFFormAutoFillController_handleDidSaveAccountWithGeneratedPasswordNotification___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _dismissKeyboardAndSimulateCarriageReturnKeyEvents:0];
}

uint64_t __83___SFFormAutoFillController_handleDidSaveAccountWithGeneratedPasswordNotification___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) _showICloudKeychainViewInCurrentInputView];
}

void __83___SFFormAutoFillController_handleDidSaveAccountWithGeneratedPasswordNotification___block_invoke_3(uint64_t a1, uint64_t a2)
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __83___SFFormAutoFillController_handleDidSaveAccountWithGeneratedPasswordNotification___block_invoke_4;
  block[3] = &unk_1E5C74078;
  uint64_t v2 = *(void *)(a1 + 32);
  id v3 = *(void **)(a1 + 40);
  uint64_t v6 = a2;
  block[4] = v2;
  id v5 = v3;
  dispatch_async(MEMORY[0x1E4F14428], block);
}

void __83___SFFormAutoFillController_handleDidSaveAccountWithGeneratedPasswordNotification___block_invoke_4(uint64_t a1)
{
  if (*(void *)(a1 + 48) == 2)
  {
    uint64_t v2 = WBS_LOG_CHANNEL_PREFIXAutoFill();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v9 = 0;
      _os_log_impl(&dword_1A690B000, v2, OS_LOG_TYPE_DEFAULT, "Scheduling account saved notification", v9, 2u);
    }
    id v3 = [MEMORY[0x1E4F98CC0] sharedNotificationManager];
    [v3 schedulePasswordSavedNotificationForSavedAccount:*(void *)(a1 + 40) completionHandler:&__block_literal_global_293];

    [*(id *)(a1 + 32) _dismissKeyboardAndSimulateCarriageReturnKeyEvents:0];
    *(unsigned char *)(*(void *)(a1 + 32) + 281) = 1;
  }
  else
  {
    uint64_t v4 = [*(id *)(a1 + 32) _customInputViewFromAutoFillInputSession];
    if (v4)
    {
      id v5 = WBS_LOG_CHANNEL_PREFIXAutoFill();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1A690B000, v5, OS_LOG_TYPE_DEFAULT, "Transitioning AutoFill view to Strong Password Saved view", buf, 2u);
      }
      uint64_t v6 = [objc_alloc(MEMORY[0x1E4F88198]) initWithMode:2];
      uint64_t v7 = *(void *)(a1 + 32);
      id v8 = *(void **)(v7 + 264);
      *(void *)(v7 + 264) = v6;

      objc_msgSend(*(id *)(*(void *)(a1 + 32) + 264), "setDelegate:");
      [v4 replaceContentsOfViewWithStrongPasswordIntroductionViewController:*(void *)(*(void *)(a1 + 32) + 264)];
    }
  }
}

@end