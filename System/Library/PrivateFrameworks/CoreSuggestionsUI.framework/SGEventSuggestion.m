@interface SGEventSuggestion
- (BOOL)_isSourceAccountManaged;
- (BOOL)eventViewControllerShouldAlwaysShowNavBar:(id)a3;
- (BOOL)suggestionListSupportsDismissal;
- (id)_icsDataEkEvent:(id)a3;
- (id)suggestionAttributedSubtitle;
- (id)suggestionPrimaryAction;
- (void)_dismissViewController:(id)a3 retainBanner:(BOOL)a4;
- (void)_previewControllerForICSEvent:(id)a3 eventStore:(id)a4;
- (void)eventEditViewController:(id)a3 didCompleteWithAction:(int64_t)a4;
- (void)eventViewController:(id)a3 didCompleteWithAction:(int64_t)a4;
- (void)icsPreviewControllerWantsDismissal:(id)a3;
@end

@implementation SGEventSuggestion

- (void).cxx_destruct
{
}

- (id)_icsDataEkEvent:(id)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  v3 = [(SGRealtimeEvent *)self->super._realtimeEvent event];
  v4 = [v3 tags];

  v5 = (void *)[v4 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v5)
  {
    uint64_t v6 = *(void *)v11;
    while (2)
    {
      for (i = 0; i != v5; i = (char *)i + 1)
      {
        if (*(void *)v11 != v6) {
          objc_enumerationMutation(v4);
        }
        v8 = [MEMORY[0x1E4F5D9F0] resolveName:*(void *)(*((void *)&v10 + 1) + 8 * i)];
        if ([v8 isIcsAttachmentData])
        {
          v5 = [v8 icsAttachmentData];

          goto LABEL_11;
        }
      }
      v5 = (void *)[v4 countByEnumeratingWithState:&v10 objects:v14 count:16];
      if (v5) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return v5;
}

- (void)_previewControllerForICSEvent:(id)a3 eventStore:(id)a4
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  v7 = [(SGEventSuggestion *)self _icsDataEkEvent:a3];
  if (v7)
  {
    v8 = [(SGEventSuggestionBase *)self suggestionDelegate];
    v9 = [v8 icsPreviewControllerForData:v7 andEventStore:v6];

    [v9 setAllowsImport:1];
    [v9 setAllowsEditing:1];
    [v9 setPreviewDelegate:self];
    long long v10 = [v9 viewController];
    [v10 setHidesBottomBarWhenPushed:0];

    long long v11 = [(SGEventSuggestionBase *)self suggestionDelegate];
    [v9 setCancelButtonWithTarget:v11 action:sel_dismissICSPreviewController_];

    icsPreviewController = self->_icsPreviewController;
    self->_icsPreviewController = (EKICSPreviewController *)v9;
  }
  else
  {
    long long v13 = sgEventsLogHandle();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      v14 = [(SGRealtimeEvent *)self->super._realtimeEvent event];
      uint64_t v15 = [v14 loggingIdentifier];
      int v16 = 138543362;
      v17 = v15;
      _os_log_impl(&dword_1B5B6C000, v13, OS_LOG_TYPE_DEFAULT, "No ICS Data found for event [SGEvent (%{public}@)]", (uint8_t *)&v16, 0xCu);
    }
  }
}

- (BOOL)_isSourceAccountManaged
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  v2 = [(SGRealtimeEvent *)self->super._realtimeEvent event];
  v3 = [v2 tags];

  uint64_t v4 = [v3 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v14;
    while (2)
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v14 != v6) {
          objc_enumerationMutation(v3);
        }
        v8 = [MEMORY[0x1E4F5D9F0] resolveName:*(void *)(*((void *)&v13 + 1) + 8 * i)];
        if ([v8 isManagedSourceAccount])
        {
          v9 = [v8 value];
          char v10 = [v9 isEqualToString:@"MCAccountIsManaged"];

          if (v10)
          {

            BOOL v11 = 1;
            goto LABEL_12;
          }
        }
      }
      uint64_t v5 = [v3 countByEnumeratingWithState:&v13 objects:v17 count:16];
      if (v5) {
        continue;
      }
      break;
    }
  }
  BOOL v11 = 0;
LABEL_12:

  return v11;
}

- (BOOL)suggestionListSupportsDismissal
{
  return [(SGRealtimeEvent *)self->super._realtimeEvent state] != 4
      && [(SGRealtimeEvent *)self->super._realtimeEvent state] != 5;
}

- (void)icsPreviewControllerWantsDismissal:(id)a3
{
  id v4 = [a3 viewController];
  [(SGEventSuggestion *)self _dismissViewController:v4 retainBanner:1];
}

- (BOOL)eventViewControllerShouldAlwaysShowNavBar:(id)a3
{
  return 1;
}

- (void)eventEditViewController:(id)a3 didCompleteWithAction:(int64_t)a4
{
  id v6 = a3;
  id v8 = v6;
  if (a4)
  {
    [(id)objc_opt_class() confirm:1 event:self->super._realtimeEvent completion:0];
    [(SGEventSuggestion *)self _dismissViewController:v8 retainBanner:a4 == 1];
    if (a4 == 1)
    {
      v7 = [(SGEventSuggestionBase *)self suggestionDelegate];
      [v7 suggestionWasUpdated:self];
    }
  }
  else
  {
    [(SGEventSuggestion *)self _dismissViewController:v6 retainBanner:1];
  }
}

- (void)eventViewController:(id)a3 didCompleteWithAction:(int64_t)a4
{
  [(SGEventSuggestion *)self _dismissViewController:a3 retainBanner:a4 != 2];
}

- (void)_dismissViewController:(id)a3 retainBanner:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  v7 = sgEventsLogHandle();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    id v8 = [(SGRealtimeEvent *)self->super._realtimeEvent event];
    uint64_t v9 = [v8 loggingIdentifier];
    char v10 = (void *)v9;
    BOOL v11 = @"not";
    if (v4) {
      BOOL v11 = @" ";
    }
    int v14 = 138543618;
    uint64_t v15 = v9;
    __int16 v16 = 2114;
    v17 = v11;
    _os_log_impl(&dword_1B5B6C000, v7, OS_LOG_TYPE_DEFAULT, "SGEventSuggestion - SGEvent %{public}@ ViewController dismissed. Did %{public}@ add event to calendar", (uint8_t *)&v14, 0x16u);
  }
  long long v12 = [(SGEventSuggestionBase *)self suggestionDelegate];
  [v12 dismissViewController:v6];

  long long v13 = [(SGEventSuggestionBase *)self suggestionDelegate];
  [v13 suggestion:self actionFinished:!v4];
}

- (id)suggestionPrimaryAction
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  v3 = sgEventsLogHandle();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
  {
    v7 = [(SGRealtimeEvent *)self->super._realtimeEvent event];
    id v8 = [v7 loggingIdentifier];
    *(_DWORD *)buf = 138543362;
    BOOL v11 = v8;
    _os_log_debug_impl(&dword_1B5B6C000, v3, OS_LOG_TYPE_DEBUG, "SGEventSuggestion - SGEvent %{public}@ PrimaryAction initialized", buf, 0xCu);
  }
  BOOL v4 = [(SGEventSuggestionBase *)self primaryActionTitle];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __44__SGEventSuggestion_suggestionPrimaryAction__block_invoke;
  v9[3] = &unk_1E612E548;
  v9[4] = self;
  uint64_t v5 = +[SGSuggestionAction actionWithTitle:v4 handler:v9];

  return v5;
}

void __44__SGEventSuggestion_suggestionPrimaryAction__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v67 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if ([*(id *)(*(void *)(a1 + 32) + 8) state] == 1
    || [*(id *)(*(void *)(a1 + 32) + 8) state] == 2)
  {
    BOOL v4 = objc_opt_new();
    if ([*(id *)(a1 + 32) _isSourceAccountManaged]) {
      [v4 setSourceAccountManagement:2];
    }
    uint64_t v5 = [MEMORY[0x1E4FB1438] sharedApplication];
    [v5 beginIgnoringInteractionEvents];

    *(void *)&long long buf = 0;
    *((void *)&buf + 1) = &buf;
    uint64_t v64 = 0x2020000000;
    LOBYTE(v65) = 0;
    dispatch_time_t v6 = dispatch_time(0, 83333333);
    aBlock[0] = MEMORY[0x1E4F143A8];
    aBlock[1] = 3221225472;
    aBlock[2] = __44__SGEventSuggestion_suggestionPrimaryAction__block_invoke_2;
    aBlock[3] = &unk_1E612E3C0;
    uint64_t v7 = *(void *)(a1 + 32);
    p_long long buf = &buf;
    aBlock[4] = v7;
    id v8 = v4;
    id v57 = v8;
    uint64_t v9 = _Block_copy(aBlock);
    char v10 = [*(id *)(*(void *)(a1 + 32) + 8) event];
    v54[0] = MEMORY[0x1E4F143A8];
    v54[1] = 3221225472;
    v54[2] = __44__SGEventSuggestion_suggestionPrimaryAction__block_invoke_13;
    v54[3] = &unk_1E612E410;
    id v11 = v9;
    id v55 = v11;
    [v10 geocodeWithCallback:v54];

    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __44__SGEventSuggestion_suggestionPrimaryAction__block_invoke_3;
    block[3] = &unk_1E612E3E8;
    block[4] = *(void *)(a1 + 32);
    id v53 = v11;
    id v12 = v11;
    dispatch_after(v6, MEMORY[0x1E4F14428], block);

    _Block_object_dispose(&buf, 8);
  }
  else if ([*(id *)(*(void *)(a1 + 32) + 8) state] == 4 {
         || [*(id *)(*(void *)(a1 + 32) + 8) state] == 5)
  }
  {
    id v8 = (id)objc_opt_new();
    if ([*(id *)(a1 + 32) _isSourceAccountManaged]) {
      [v8 setSourceAccountManagement:2];
    }
    long long v13 = [*(id *)(*(void *)(a1 + 32) + 8) eventIdentifier];
    int v14 = [v8 eventWithIdentifier:v13];

    uint64_t v15 = [*(id *)(*(void *)(a1 + 32) + 8) event];
    [v15 mergeIntoEKEvent:v14 withStore:v8];

    uint64_t v59 = 0;
    v60 = &v59;
    uint64_t v61 = 0x2050000000;
    __int16 v16 = (void *)getEKEventViewControllerClass_softClass;
    uint64_t v62 = getEKEventViewControllerClass_softClass;
    if (!getEKEventViewControllerClass_softClass)
    {
      *(void *)&long long buf = MEMORY[0x1E4F143A8];
      *((void *)&buf + 1) = 3221225472;
      uint64_t v64 = (uint64_t)__getEKEventViewControllerClass_block_invoke;
      v65 = &unk_1E612E840;
      v66 = &v59;
      __getEKEventViewControllerClass_block_invoke((uint64_t)&buf);
      __int16 v16 = (void *)v60[3];
    }
    id v17 = v16;
    _Block_object_dispose(&v59, 8);
    uint64_t v18 = objc_opt_new();
    [v18 setEvent:v14];
    [v18 setAllowsEditing:0];
    [v18 setDelegate:*(void *)(a1 + 32)];
    [v18 setModalPresentationStyle:-1];
    v19 = sgEventsLogHandle();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
    {
      v20 = [*(id *)(*(void *)(a1 + 32) + 8) event];
      v21 = [v20 loggingIdentifier];
      LODWORD(buf) = 138543362;
      *(void *)((char *)&buf + 4) = v21;
      _os_log_impl(&dword_1B5B6C000, v19, OS_LOG_TYPE_DEFAULT, "Presenting confirmed event (%{public}@) view controller", (uint8_t *)&buf, 0xCu);
    }
    v22 = [*(id *)(a1 + 32) suggestionDelegate];
    [v22 presentViewController:v18];
  }
  else
  {
    if ([*(id *)(*(void *)(a1 + 32) + 8) state] != 3) {
      goto LABEL_7;
    }
    v23 = objc_opt_new();
    if ([*(id *)(a1 + 32) _isSourceAccountManaged]) {
      [v23 setSourceAccountManagement:2];
    }
    uint64_t v25 = *(void *)(a1 + 32);
    v24 = (id *)(a1 + 32);
    v26 = [*(id *)(v25 + 8) eventIdentifier];
    v27 = [v23 eventWithIdentifier:v26];

    v28 = [MEMORY[0x1E4FB1418] alertControllerWithTitle:0 message:0 preferredStyle:0];
    v29 = (void *)MEMORY[0x1E4FB1410];
    v30 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.CoreSuggestionsUI"];
    v31 = [v30 localizedStringForKey:@"SuggestionsBannerAlertButtonDeleteEvent" value:&stru_1F0ED27A8 table:0];
    v47[0] = MEMORY[0x1E4F143A8];
    v47[1] = 3221225472;
    v47[2] = __44__SGEventSuggestion_suggestionPrimaryAction__block_invoke_28;
    v47[3] = &unk_1E612E438;
    id v48 = v27;
    id v49 = v23;
    id v50 = *v24;
    id v32 = v28;
    id v51 = v32;
    id v33 = v23;
    id v8 = v27;
    v34 = [v29 actionWithTitle:v31 style:2 handler:v47];
    [v32 addAction:v34];

    v35 = (void *)MEMORY[0x1E4FB1410];
    v36 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.CoreSuggestionsUI"];
    v37 = [v36 localizedStringForKey:@"SuggestionsBannerAlertButtonCancel" value:&stru_1F0ED27A8 table:0];
    uint64_t v41 = MEMORY[0x1E4F143A8];
    uint64_t v42 = 3221225472;
    v43 = __44__SGEventSuggestion_suggestionPrimaryAction__block_invoke_33;
    v44 = &unk_1E612E460;
    id v45 = *v24;
    id v46 = v32;
    id v38 = v32;
    v39 = [v35 actionWithTitle:v37 style:1 handler:&v41];
    objc_msgSend(v38, "addAction:", v39, v41, v42, v43, v44, v45);

    [v38 setModalPresentationStyle:7];
    v40 = [*v24 suggestionDelegate];
    [v40 presentViewController:v38];
  }
LABEL_7:
}

void __44__SGEventSuggestion_suggestionPrimaryAction__block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  uint64_t v4 = *(void *)(*(void *)(a1 + 48) + 8);
  if (!*(unsigned char *)(v4 + 24))
  {
    *(unsigned char *)(v4 + 24) = 1;
    uint64_t v5 = [MEMORY[0x1E4FB1438] sharedApplication];
    [v5 endIgnoringInteractionEvents];

    int v6 = [*(id *)(*(void *)(a1 + 32) + 8) state];
    uint64_t v7 = *(void **)(a1 + 40);
    if (v6 == 1)
    {
      id v8 = [v3 toEKEventWithStore:*(void *)(a1 + 40)];
    }
    else
    {
      uint64_t v9 = [*(id *)(*(void *)(a1 + 32) + 8) eventIdentifier];
      id v8 = [v7 eventWithIdentifier:v9];

      [v3 mergeIntoEKEvent:v8 withStore:*(void *)(a1 + 40)];
    }
    [*(id *)(a1 + 32) _previewControllerForICSEvent:v8 eventStore:*(void *)(a1 + 40)];
    char v10 = *(void **)(*(void *)(a1 + 32) + 48);
    if (v10)
    {
      id v11 = [v10 viewController];
      id v12 = sgEventsLogHandle();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        long long v13 = [*(id *)(*(void *)(a1 + 32) + 8) event];
        int v14 = [v13 loggingIdentifier];
        LODWORD(buf) = 138543362;
        *(void *)((char *)&buf + 4) = v14;
        _os_log_impl(&dword_1B5B6C000, v12, OS_LOG_TYPE_DEFAULT, "Presenting suggested ICS event (%{public}@) view controller", (uint8_t *)&buf, 0xCu);
      }
      [v11 setModalPresentationStyle:3];
      uint64_t v15 = [*(id *)(a1 + 32) suggestionDelegate];
      [v15 presentViewController:v11];
    }
    else
    {
      uint64_t v21 = 0;
      v22 = &v21;
      uint64_t v23 = 0x2050000000;
      __int16 v16 = (void *)getEKEventEditViewControllerClass_softClass;
      uint64_t v24 = getEKEventEditViewControllerClass_softClass;
      if (!getEKEventEditViewControllerClass_softClass)
      {
        *(void *)&long long buf = MEMORY[0x1E4F143A8];
        *((void *)&buf + 1) = 3221225472;
        v26 = __getEKEventEditViewControllerClass_block_invoke;
        v27 = &unk_1E612E840;
        v28 = &v21;
        __getEKEventEditViewControllerClass_block_invoke((uint64_t)&buf);
        __int16 v16 = (void *)v22[3];
      }
      id v17 = v16;
      _Block_object_dispose(&v21, 8);
      id v11 = objc_opt_new();
      objc_msgSend(v11, "setEvent:", v8, v21);
      [v11 setEventStore:*(void *)(a1 + 40)];
      [v11 setHidesBottomBarWhenPushed:1];
      [v11 setEditViewDelegate:*(void *)(a1 + 32)];
      [v11 setModalPresentationStyle:3];
      uint64_t v18 = sgEventsLogHandle();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
      {
        v19 = [*(id *)(*(void *)(a1 + 32) + 8) event];
        v20 = [v19 loggingIdentifier];
        LODWORD(buf) = 138543362;
        *(void *)((char *)&buf + 4) = v20;
        _os_log_impl(&dword_1B5B6C000, v18, OS_LOG_TYPE_DEFAULT, "Presenting suggested new event (%{public}@) view controller", (uint8_t *)&buf, 0xCu);
      }
      uint64_t v15 = [*(id *)(a1 + 32) suggestionDelegate];
      [v15 presentViewController:v11];
    }
  }
}

void __44__SGEventSuggestion_suggestionPrimaryAction__block_invoke_13(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (pthread_main_np())
  {
    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  }
  else
  {
    v4[0] = MEMORY[0x1E4F143A8];
    v4[1] = 3221225472;
    v4[2] = __44__SGEventSuggestion_suggestionPrimaryAction__block_invoke_2_14;
    v4[3] = &unk_1E612E3E8;
    id v6 = *(id *)(a1 + 32);
    id v5 = v3;
    dispatch_sync(MEMORY[0x1E4F14428], v4);
  }
}

void __44__SGEventSuggestion_suggestionPrimaryAction__block_invoke_3(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 40);
  id v2 = [*(id *)(*(void *)(a1 + 32) + 8) event];
  (*(void (**)(uint64_t, id))(v1 + 16))(v1, v2);
}

void __44__SGEventSuggestion_suggestionPrimaryAction__block_invoke_28(uint64_t a1, void *a2)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  uint64_t v4 = *(void *)(a1 + 32);
  if (v4)
  {
    id v5 = *(void **)(a1 + 40);
    id v9 = 0;
    char v6 = [v5 removeEvent:v4 span:0 error:&v9];
    id v7 = v9;
    if ((v6 & 1) == 0)
    {
      id v8 = sgLogHandle();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)long long buf = 138412290;
        id v11 = v7;
        _os_log_error_impl(&dword_1B5B6C000, v8, OS_LOG_TYPE_ERROR, "Error: error removing event: %@", buf, 0xCu);
      }
    }
  }
  else
  {
    id v7 = 0;
  }
  [(id)objc_opt_class() confirm:1 event:*(void *)(*(void *)(a1 + 48) + 8) completion:0];
  [*(id *)(a1 + 48) _dismissViewController:*(void *)(a1 + 56) retainBanner:0];
}

uint64_t __44__SGEventSuggestion_suggestionPrimaryAction__block_invoke_33(uint64_t a1)
{
  return [*(id *)(a1 + 32) _dismissViewController:*(void *)(a1 + 40) retainBanner:1];
}

uint64_t __44__SGEventSuggestion_suggestionPrimaryAction__block_invoke_2_14(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

- (id)suggestionAttributedSubtitle
{
  v9[1] = *MEMORY[0x1E4F143B8];
  if ([(SGRealtimeEvent *)self->super._realtimeEvent state] == 3)
  {
    id v3 = objc_alloc(MEMORY[0x1E4F28B18]);
    uint64_t v4 = [(SGEventSuggestionBase *)self suggestionSubtitle];
    uint64_t v8 = *MEMORY[0x1E4FB0768];
    v9[0] = &unk_1F0ED74D8;
    id v5 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v9 forKeys:&v8 count:1];
    char v6 = (void *)[v3 initWithString:v4 attributes:v5];
  }
  else
  {
    char v6 = 0;
  }
  return v6;
}

@end