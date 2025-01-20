@interface WFAddNewReminderAction
- (BOOL)setParameterState:(id)a3 forKey:(id)a4;
- (NSDateFormatter)dateFormatter;
- (id)parameterKeysToHideWhenAttachmentsAreUnavailable;
- (id)selectedList;
- (id)selectedListIfDeterministic;
- (id)smartPromptWithContentDescription:(id)a3 contentDestination:(id)a4 workflowName:(id)a5;
- (void)addAlertToReminderChange:(id)a3 forAccount:(id)a4 completionHandler:(id)a5;
- (void)addImagesToReminderChange:(id)a3 completionHandler:(id)a4;
- (void)finishAddingReminderWithSaveRequest:(id)a3 reminderChange:(id)a4 reminderStore:(id)a5;
- (void)getContentDestinationWithCompletionHandler:(id)a3;
- (void)getSelectedListOrParentReminder:(id)a3;
- (void)runAsynchronouslyWithInput:(id)a3;
- (void)updateHiddenParameters;
- (void)updateLists;
- (void)wasAddedToWorkflow:(id)a3;
- (void)wasRemovedFromWorkflow:(id)a3;
@end

@implementation WFAddNewReminderAction

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dateFormatter, 0);
  objc_storeStrong((id *)&self->_parameterSummary, 0);
}

- (id)parameterKeysToHideWhenAttachmentsAreUnavailable
{
  v4[5] = *MEMORY[0x263EF8340];
  v4[0] = @"WFURL";
  v4[1] = @"WFImages";
  v4[2] = @"WFFlag";
  v4[3] = @"WFParentTask";
  v4[4] = @"WFTags";
  v2 = [MEMORY[0x263EFF8C0] arrayWithObjects:v4 count:5];
  return v2;
}

- (void)updateHiddenParameters
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  v3 = [(WFAddNewReminderAction *)self selectedListIfDeterministic];
  v4 = v3;
  if (v3)
  {
    v5 = [v3 account];
    v6 = [v5 capabilities];
    int v7 = [v6 supportsAttachments];

    uint64_t v8 = v7 ^ 1u;
  }
  else
  {
    uint64_t v8 = 0;
  }
  long long v17 = 0u;
  long long v18 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  v9 = [(WFAddNewReminderAction *)self parameterKeysToHideWhenAttachmentsAreUnavailable];
  uint64_t v10 = [v9 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v16;
    do
    {
      for (uint64_t i = 0; i != v11; ++i)
      {
        if (*(void *)v16 != v12) {
          objc_enumerationMutation(v9);
        }
        v14 = [(WFAddNewReminderAction *)self parameterForKey:*(void *)(*((void *)&v15 + 1) + 8 * i)];
        [v14 setHidden:v8];
      }
      uint64_t v11 = [v9 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v11);
  }
}

- (BOOL)setParameterState:(id)a3 forKey:(id)a4
{
  id v6 = a4;
  v9.receiver = self;
  v9.super_class = (Class)WFAddNewReminderAction;
  BOOL v7 = [(WFAddNewReminderAction *)&v9 setParameterState:a3 forKey:v6];
  if (v7 && [v6 isEqualToString:@"WFCalendarDescriptor"]) {
    [(WFAddNewReminderAction *)self updateHiddenParameters];
  }

  return v7;
}

- (id)selectedListIfDeterministic
{
  v2 = [(WFAddNewReminderAction *)self parameterStateForKey:@"WFCalendarDescriptor"];
  v3 = [v2 variable];

  if (v3)
  {
    v4 = 0;
  }
  else
  {
    v5 = [MEMORY[0x263F33950] allLists];
    id v6 = [v2 value];
    BOOL v7 = [v6 matchingRemindersListsFromArray:v5];
    uint64_t v8 = [v7 firstObject];
    objc_super v9 = v8;
    if (v8)
    {
      id v10 = v8;
    }
    else
    {
      id v10 = [MEMORY[0x263F33950] defaultList];
    }
    v4 = v10;
  }
  return v4;
}

- (id)smartPromptWithContentDescription:(id)a3 contentDestination:(id)a4 workflowName:(id)a5
{
  id v6 = NSString;
  id v7 = a5;
  id v8 = a3;
  objc_super v9 = WFLocalizedString(@"Allow “%1$@” to add %2$@ to a new reminder?");
  id v10 = objc_msgSend(v6, "localizedStringWithFormat:", v9, v7, v8);

  return v10;
}

- (void)getContentDestinationWithCompletionHandler:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __69__WFAddNewReminderAction_getContentDestinationWithCompletionHandler___block_invoke;
  v6[3] = &unk_264E5A0B8;
  id v7 = v4;
  id v5 = v4;
  [(WFAddNewReminderAction *)self getSelectedListOrParentReminder:v6];
}

void __69__WFAddNewReminderAction_getContentDestinationWithCompletionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v9 = a2;
  id v5 = a3;
  id v6 = v9;
  if (v9 || (id v6 = v5) != 0)
  {
    id v7 = [v6 account];
    id v8 = WFMakeContentLocationForRemindersAccount();
  }
  else
  {
    id v8 = 0;
  }
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (id)selectedList
{
  v3 = [MEMORY[0x263F33950] allLists];
  id v4 = [(WFAddNewReminderAction *)self parameterValueForKey:@"WFCalendarDescriptor" ofClass:objc_opt_class()];
  id v5 = [v4 matchingRemindersListsFromArray:v3];
  id v6 = [v5 firstObject];
  id v7 = v6;
  if (v6)
  {
    id v8 = v6;
  }
  else
  {
    id v8 = [MEMORY[0x263F33950] defaultList];
  }
  id v9 = v8;

  return v9;
}

- (void)getSelectedListOrParentReminder:(id)a3
{
  id v4 = a3;
  id v5 = [(WFAddNewReminderAction *)self parameterValueForKey:@"WFParentTask" ofClass:objc_opt_class()];
  if (v5)
  {
    v9[0] = MEMORY[0x263EF8330];
    v9[1] = 3221225472;
    v9[2] = __58__WFAddNewReminderAction_getSelectedListOrParentReminder___block_invoke;
    v9[3] = &unk_264E5A090;
    v9[4] = self;
    id v10 = v4;
    uint64_t v12 = 0;
    v13 = &v12;
    uint64_t v14 = 0x2050000000;
    id v6 = (void *)getREMReminderClass_softClass;
    uint64_t v15 = getREMReminderClass_softClass;
    if (!getREMReminderClass_softClass)
    {
      v11[0] = MEMORY[0x263EF8330];
      v11[1] = 3221225472;
      v11[2] = __getREMReminderClass_block_invoke;
      v11[3] = &unk_264E5EC88;
      v11[4] = &v12;
      __getREMReminderClass_block_invoke((uint64_t)v11);
      id v6 = (void *)v13[3];
    }
    id v7 = v6;
    _Block_object_dispose(&v12, 8);
    [v5 getObjectRepresentation:v9 forClass:v7];
  }
  else
  {
    id v8 = [(WFAddNewReminderAction *)self selectedList];
    (*((void (**)(id, void *, void))v4 + 2))(v4, v8, 0);
  }
}

void __58__WFAddNewReminderAction_getSelectedListOrParentReminder___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a1 + 40);
  if (a2)
  {
    v3 = *(void (**)(uint64_t, void, uint64_t))(v2 + 16);
    uint64_t v4 = *(void *)(a1 + 40);
    v3(v4, 0, a2);
  }
  else
  {
    id v5 = [*(id *)(a1 + 32) selectedList];
    (*(void (**)(uint64_t, id, void))(v2 + 16))(v2, v5, 0);
  }
}

- (void)finishAddingReminderWithSaveRequest:(id)a3 reminderChange:(id)a4 reminderStore:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  id v10 = dispatch_get_global_queue(0, 0);
  v13[0] = MEMORY[0x263EF8330];
  v13[1] = 3221225472;
  v13[2] = __91__WFAddNewReminderAction_finishAddingReminderWithSaveRequest_reminderChange_reminderStore___block_invoke;
  v13[3] = &unk_264E5A808;
  v13[4] = self;
  id v14 = v9;
  id v15 = v8;
  id v11 = v8;
  id v12 = v9;
  [a3 saveWithQueue:v10 completion:v13];
}

void __91__WFAddNewReminderAction_finishAddingReminderWithSaveRequest_reminderChange_reminderStore___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (v3)
  {
    id v4 = v3;
    [*(id *)(a1 + 32) finishRunningWithError:v3];
  }
  else
  {
    id v5 = *(void **)(a1 + 40);
    id v6 = [*(id *)(a1 + 48) objectID];
    id v10 = 0;
    id v7 = [v5 fetchReminderWithObjectID:v6 error:&v10];
    id v4 = v10;

    if (v7)
    {
      id v8 = [*(id *)(a1 + 32) output];
      id v9 = [MEMORY[0x263F33950] itemWithReminder:v7 fromReminderStore:*(void *)(a1 + 40)];
      [v8 addItem:v9];
    }
    [*(id *)(a1 + 32) finishRunningWithError:v4];
  }
}

- (void)addImagesToReminderChange:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v7 = (void (**)(void))a4;
  id v8 = [(WFAddNewReminderAction *)self parameterValueForKey:@"WFImages" ofClass:objc_opt_class()];
  if ([v8 numberOfItems])
  {
    id v9 = [v6 attachmentContext];
    if (v9)
    {
      v11[0] = MEMORY[0x263EF8330];
      v11[1] = 3221225472;
      v11[2] = __70__WFAddNewReminderAction_addImagesToReminderChange_completionHandler___block_invoke;
      v11[3] = &unk_264E5E648;
      v11[4] = self;
      v13 = v7;
      id v12 = v9;
      id v10 = [MEMORY[0x263F852B8] typeWithUTType:*MEMORY[0x263F1DB18]];
      [v8 getFileRepresentations:v11 forType:v10];
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

void __70__WFAddNewReminderAction_addImagesToReminderChange_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  if ([v5 count])
  {
    [MEMORY[0x263F33958] addImageFiles:v5 toAttachmentContext:*(void *)(a1 + 40)];
LABEL_3:
    (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
    goto LABEL_8;
  }
  if (!v6) {
    goto LABEL_3;
  }
  id v7 = getWFActionsLogObject();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
  {
    int v8 = 136315394;
    id v9 = "-[WFAddNewReminderAction addImagesToReminderChange:completionHandler:]_block_invoke";
    __int16 v10 = 2112;
    id v11 = v6;
    _os_log_impl(&dword_23C364000, v7, OS_LOG_TYPE_ERROR, "%s Loading images failed with error %@", (uint8_t *)&v8, 0x16u);
  }

  [*(id *)(a1 + 32) finishRunningWithError:v6];
LABEL_8:
}

- (void)addAlertToReminderChange:(id)a3 forAccount:(id)a4 completionHandler:(id)a5
{
  v64[1] = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  __int16 v10 = (void (**)(void))a5;
  id v11 = [(WFAddNewReminderAction *)self parameterValueForKey:@"WFAlertEnabled" ofClass:objc_opt_class()];
  if ([v11 isEqualToString:@"No Alert"])
  {
    v10[2](v10);
  }
  else
  {
    uint64_t v12 = [(WFAddNewReminderAction *)self parameterValueForKey:@"WFAlertCondition" ofClass:objc_opt_class()];
    if ([v12 isEqualToString:@"At Time"])
    {
      v13 = [(WFAddNewReminderAction *)self parameterValueForKey:@"WFAlertCustomTime" ofClass:objc_opt_class()];
      id v14 = v13;
      if (v13)
      {
        id v15 = [v13 date];
        int v16 = [v14 timeIsSignificant];
        long long v17 = [MEMORY[0x263EFF8F0] currentCalendar];
        long long v18 = v17;
        if (v16)
        {
          v19 = [MEMORY[0x263EFFA18] systemTimeZone];
          uint64_t v20 = [v18 componentsInTimeZone:v19 fromDate:v15];
        }
        else
        {
          uint64_t v20 = [v17 components:30 fromDate:v15];
        }

        [v8 setDueDateComponents:v20];
        uint64_t v55 = 0;
        v56 = &v55;
        uint64_t v57 = 0x2050000000;
        v30 = (void *)getREMAlarmDateTriggerClass_softClass;
        uint64_t v58 = getREMAlarmDateTriggerClass_softClass;
        if (!getREMAlarmDateTriggerClass_softClass)
        {
          uint64_t v50 = MEMORY[0x263EF8330];
          uint64_t v51 = 3221225472;
          v52 = __getREMAlarmDateTriggerClass_block_invoke;
          v53 = &unk_264E5EC88;
          v54 = &v55;
          __getREMAlarmDateTriggerClass_block_invoke((uint64_t)&v50);
          v30 = (void *)v56[3];
        }
        v31 = v30;
        _Block_object_dispose(&v55, 8);
        v29 = (void *)[[v31 alloc] initWithDateComponents:v20];
        id v32 = (id)[v8 addAlarmWithTrigger:v29];
        v10[2](v10);
      }
      else
      {
        v28 = (void *)MEMORY[0x263F087E8];
        uint64_t v63 = *MEMORY[0x263F08320];
        id v15 = WFLocalizedString(@"The alert time provided was invalid. Please check for spelling errors and ensure you provide a time of day.");
        v64[0] = v15;
        uint64_t v20 = [NSDictionary dictionaryWithObjects:v64 forKeys:&v63 count:1];
        v29 = [v28 errorWithDomain:*MEMORY[0x263F870B8] code:5 userInfo:v20];
        [(WFAddNewReminderAction *)self finishRunningWithError:v29];
      }
    }
    else if ([v12 isEqualToString:@"When Messaging"])
    {
      v21 = [v9 capabilities];
      char v22 = [v21 supportsPersonTrigger];

      if (v22)
      {
        v23 = [(WFAddNewReminderAction *)self parameterValueForKey:@"WFAlertPerson" ofClass:objc_opt_class()];
        id v14 = [v23 contentCollection];

        v47[0] = MEMORY[0x263EF8330];
        v47[1] = 3221225472;
        v47[2] = __80__WFAddNewReminderAction_addAlertToReminderChange_forAccount_completionHandler___block_invoke;
        v47[3] = &unk_264E5A040;
        v47[4] = self;
        v49 = v10;
        id v48 = v8;
        [v14 getObjectRepresentation:v47 forClass:objc_opt_class()];
      }
      else
      {
        v33 = (void *)MEMORY[0x263F087E8];
        uint64_t v61 = *MEMORY[0x263F08320];
        v34 = NSString;
        id v14 = WFLocalizedString(@"Add New Reminder failed because the Reminders account “%@” does not support notifications when messaging people.");
        v41 = [v9 displayName];
        v35 = objc_msgSend(v34, "stringWithFormat:", v14, v41);
        v62 = v35;
        v36 = [NSDictionary dictionaryWithObjects:&v62 forKeys:&v61 count:1];
        v37 = [v33 errorWithDomain:*MEMORY[0x263F870B8] code:5 userInfo:v36];
        [(WFAddNewReminderAction *)self finishRunningWithError:v37];
      }
    }
    else
    {
      id v14 = [(WFAddNewReminderAction *)self parameterValueForKey:@"WFAlertLocation" ofClass:objc_opt_class()];
      v24 = [v14 items];
      v25 = [v24 firstObject];

      if (v25)
      {
        v43[0] = MEMORY[0x263EF8330];
        v43[1] = 3221225472;
        v43[2] = __80__WFAddNewReminderAction_addAlertToReminderChange_forAccount_completionHandler___block_invoke_2;
        v43[3] = &unk_264E5A068;
        v43[4] = self;
        id v44 = v12;
        id v45 = v8;
        v46 = v10;
        uint64_t v55 = 0;
        v56 = &v55;
        uint64_t v57 = 0x2050000000;
        v26 = (void *)getMKMapItemClass_softClass_30339;
        uint64_t v58 = getMKMapItemClass_softClass_30339;
        if (!getMKMapItemClass_softClass_30339)
        {
          uint64_t v50 = MEMORY[0x263EF8330];
          uint64_t v51 = 3221225472;
          v52 = __getMKMapItemClass_block_invoke_30340;
          v53 = &unk_264E5EC88;
          v54 = &v55;
          __getMKMapItemClass_block_invoke_30340((uint64_t)&v50);
          v26 = (void *)v56[3];
        }
        id v27 = v26;
        _Block_object_dispose(&v55, 8);
        [v25 getObjectRepresentation:v43 forClass:v27];
      }
      else
      {
        v38 = (void *)MEMORY[0x263F087E8];
        uint64_t v59 = *MEMORY[0x263F08320];
        v42 = WFLocalizedString(@"No alert location was provided. Please provide a location for this reminder's alert.");
        v60 = v42;
        v39 = [NSDictionary dictionaryWithObjects:&v60 forKeys:&v59 count:1];
        v40 = [v38 errorWithDomain:*MEMORY[0x263F870B8] code:5 userInfo:v39];
        [(WFAddNewReminderAction *)self finishRunningWithError:v40];
      }
    }
  }
}

void __80__WFAddNewReminderAction_addAlertToReminderChange_forAccount_completionHandler___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  id v7 = a4;
  id v6 = [MEMORY[0x263F33950] contactRepresentationWithContact:a2];
  if (v6)
  {
    [*(id *)(a1 + 40) setContactHandles:v6];
LABEL_3:
    (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
    goto LABEL_6;
  }
  if (!v7) {
    goto LABEL_3;
  }
  objc_msgSend(*(id *)(a1 + 32), "finishRunningWithError:");
LABEL_6:
}

void __80__WFAddNewReminderAction_addAlertToReminderChange_forAccount_completionHandler___block_invoke_2(uint64_t a1, void *a2, void *a3, void *a4)
{
  v58[1] = *MEMORY[0x263EF8340];
  id v7 = a2;
  id v47 = a3;
  id v8 = a4;
  uint64_t v9 = (uint64_t)v8;
  if (v7)
  {
    uint64_t v53 = 0;
    v54 = &v53;
    uint64_t v55 = 0x2050000000;
    __int16 v10 = (void *)getREMStructuredLocationClass_softClass;
    uint64_t v56 = getREMStructuredLocationClass_softClass;
    if (!getREMStructuredLocationClass_softClass)
    {
      uint64_t v48 = MEMORY[0x263EF8330];
      uint64_t v49 = 3221225472;
      uint64_t v50 = __getREMStructuredLocationClass_block_invoke;
      uint64_t v51 = &unk_264E5EC88;
      v52 = &v53;
      __getREMStructuredLocationClass_block_invoke((uint64_t)&v48);
      __int16 v10 = (void *)v54[3];
    }
    v46 = (void *)v9;
    id v11 = v10;
    _Block_object_dispose(&v53, 8);
    uint64_t v12 = objc_opt_new();
    [v12 setTitle:v47];
    v13 = [v7 placemark];
    id v14 = [v13 location];
    [v14 coordinate];
    double v16 = v15;
    double v18 = v17;

    [v12 setLatitude:v16];
    [v12 setLongitude:v18];
    v19 = NSString;
    uint64_t v20 = [v13 region];
    v21 = objc_msgSend(v19, "stringWithFormat:", @"%d", objc_msgSend(v20, "referenceFrame"));
    [v12 setReferenceFrameString:v21];

    uint64_t v53 = 0;
    v54 = &v53;
    uint64_t v55 = 0x2050000000;
    char v22 = (void *)getCNPostalAddressFormatterClass_softClass;
    uint64_t v56 = getCNPostalAddressFormatterClass_softClass;
    if (!getCNPostalAddressFormatterClass_softClass)
    {
      uint64_t v48 = MEMORY[0x263EF8330];
      uint64_t v49 = 3221225472;
      uint64_t v50 = __getCNPostalAddressFormatterClass_block_invoke;
      uint64_t v51 = &unk_264E5EC88;
      v52 = &v53;
      __getCNPostalAddressFormatterClass_block_invoke((uint64_t)&v48);
      char v22 = (void *)v54[3];
    }
    id v23 = v22;
    _Block_object_dispose(&v53, 8);
    v24 = [v7 placemark];
    v25 = [v24 postalAddress];
    v26 = [v23 stringFromPostalAddress:v25 style:0];
    [v12 setAddress:v26];

    id v27 = [v7 _handle];
    [v12 setMapKitHandle:v27];

    v28 = [*(id *)(a1 + 32) parameterValueForKey:@"WFAlertLocationRadius" ofClass:objc_opt_class()];
    v29 = (void *)MEMORY[0x263F85370];
    v30 = [v28 unitString];
    v31 = [v29 unitFromString:v30];

    id v32 = objc_alloc(MEMORY[0x263F08980]);
    v33 = [v28 magnitude];
    [v33 doubleValue];
    v34 = objc_msgSend(v32, "initWithDoubleValue:unit:", v31);

    v35 = [MEMORY[0x263F08CE8] meters];
    LODWORD(v29) = [v34 canBeConvertedToUnit:v35];

    if (v29)
    {
      v36 = [MEMORY[0x263F08CE8] meters];
      v37 = [v34 measurementByConvertingToUnit:v36];

      [v37 doubleValue];
      objc_msgSend(v12, "setRadius:");
    }
    else
    {
      [v12 setRadius:0.0];
    }
    if ([*(id *)(a1 + 40) isEqualToString:@"When I Arrive"]) {
      uint64_t v41 = 1;
    }
    else {
      uint64_t v41 = 2;
    }
    uint64_t v53 = 0;
    v54 = &v53;
    uint64_t v55 = 0x2050000000;
    v42 = (void *)getREMAlarmLocationTriggerClass_softClass;
    uint64_t v56 = getREMAlarmLocationTriggerClass_softClass;
    if (!getREMAlarmLocationTriggerClass_softClass)
    {
      uint64_t v48 = MEMORY[0x263EF8330];
      uint64_t v49 = 3221225472;
      uint64_t v50 = __getREMAlarmLocationTriggerClass_block_invoke;
      uint64_t v51 = &unk_264E5EC88;
      v52 = &v53;
      __getREMAlarmLocationTriggerClass_block_invoke((uint64_t)&v48);
      v42 = (void *)v54[3];
    }
    v43 = v42;
    _Block_object_dispose(&v53, 8);
    id v44 = (void *)[[v43 alloc] initWithStructuredLocation:v12 proximity:v41];
    id v45 = (id)[*(id *)(a1 + 48) addAlarmWithTrigger:v44];
    (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
  }
  else
  {
    if (!v8)
    {
      v38 = (void *)MEMORY[0x263F087E8];
      uint64_t v57 = *MEMORY[0x263F08320];
      v39 = WFLocalizedString(@"The alert location provided could not be found.");
      v58[0] = v39;
      v40 = [NSDictionary dictionaryWithObjects:v58 forKeys:&v57 count:1];
      uint64_t v9 = [v38 errorWithDomain:*MEMORY[0x263F870B8] code:5 userInfo:v40];
    }
    v46 = (void *)v9;
    [*(id *)(a1 + 32) finishRunningWithError:v9];
  }
}

- (void)runAsynchronouslyWithInput:(id)a3
{
  v30[1] = *MEMORY[0x263EF8340];
  id v4 = [(WFAddNewReminderAction *)self resourceManager];
  id v5 = [v4 resourceObjectsOfClass:objc_opt_class()];
  id v6 = [v5 anyObject];

  if ([v6 status] == 4)
  {
    id v7 = [(WFAddNewReminderAction *)self parameterValueForKey:@"WFCalendarItemTitle" ofClass:objc_opt_class()];
    id v8 = [(WFAddNewReminderAction *)self parameterValueForKey:@"WFURL" ofClass:objc_opt_class()];
    uint64_t v9 = [(WFAddNewReminderAction *)self parameterValueForKey:@"WFCalendarItemNotes" ofClass:objc_opt_class()];
    __int16 v10 = [(WFAddNewReminderAction *)self parameterValueForKey:@"WFPriority" ofClass:objc_opt_class()];
    id v11 = [(WFAddNewReminderAction *)self parameterValueForKey:@"WFFlag" ofClass:objc_opt_class()];
    uint64_t v12 = [(WFAddNewReminderAction *)self parameterValueForKey:@"WFTags" ofClass:objc_opt_class()];
    if ([v7 length])
    {
      v22[0] = MEMORY[0x263EF8330];
      v22[1] = 3221225472;
      v22[2] = __53__WFAddNewReminderAction_runAsynchronouslyWithInput___block_invoke;
      v22[3] = &unk_264E5A018;
      v22[4] = self;
      id v23 = v7;
      id v24 = v9;
      id v25 = v8;
      id v26 = v11;
      id v27 = v10;
      id v28 = v12;
      [(WFAddNewReminderAction *)self getSelectedListOrParentReminder:v22];
    }
    else
    {
      v21 = v11;
      v13 = (void *)MEMORY[0x263F087E8];
      uint64_t v20 = *MEMORY[0x263F870B8];
      uint64_t v29 = *MEMORY[0x263F08320];
      id v14 = WFLocalizedString(@"No title was provided. Please provide a title for this reminder.");
      v30[0] = v14;
      [NSDictionary dictionaryWithObjects:v30 forKeys:&v29 count:1];
      double v15 = v7;
      double v16 = v9;
      v18 = double v17 = v8;
      v19 = [v13 errorWithDomain:v20 code:5 userInfo:v18];
      [(WFAddNewReminderAction *)self finishRunningWithError:v19];

      id v11 = v21;
      id v8 = v17;
      uint64_t v9 = v16;
      id v7 = v15;
    }
  }
  else
  {
    id v7 = [v6 availabilityError];
    [(WFAddNewReminderAction *)self finishRunningWithError:v7];
  }
}

void __53__WFAddNewReminderAction_runAsynchronouslyWithInput___block_invoke(uint64_t a1, void *a2, void *a3)
{
  v65[2] = *MEMORY[0x263EF8340];
  unint64_t v5 = a2;
  unint64_t v43 = a3;
  if (v5 | v43)
  {
    id v44 = WFGetWorkflowReminderStore();
    uint64_t v55 = 0;
    uint64_t v56 = &v55;
    uint64_t v57 = 0x2050000000;
    id v6 = (void *)getREMSaveRequestClass_softClass_30403;
    uint64_t v58 = getREMSaveRequestClass_softClass_30403;
    if (!getREMSaveRequestClass_softClass_30403)
    {
      location[0] = (id)MEMORY[0x263EF8330];
      location[1] = (id)3221225472;
      location[2] = __getREMSaveRequestClass_block_invoke_30404;
      location[3] = &unk_264E5EC88;
      location[4] = &v55;
      __getREMSaveRequestClass_block_invoke_30404((uint64_t)location);
      id v6 = (void *)v56[3];
    }
    id v7 = v6;
    _Block_object_dispose(&v55, 8);
    id v8 = (void *)[[v7 alloc] initWithStore:v44];
    uint64_t v9 = v8;
    if (v5)
    {
      id v10 = [v8 updateList:v5];
      v42 = [(id)v5 account];
      id v11 = [v9 addReminderWithTitle:*(void *)(a1 + 40) toListChangeItem:v10];
    }
    else
    {
      id v10 = [v8 updateReminder:v43];
      double v15 = [v10 subtaskContext];
      v42 = [(id)v43 account];
      if (!v15)
      {
        char v22 = [v42 capabilities];
        char v23 = [v22 supportsSubtasks];

        id v24 = *(void **)(a1 + 32);
        id v25 = (void *)MEMORY[0x263F087E8];
        if (v23)
        {
          uint64_t v60 = *MEMORY[0x263F08320];
          id v26 = NSString;
          v42 = WFLocalizedString(@"Add New Reminder failed because the reminder “%@” is a subtask, and subtasks cannot have their own subtasks.");
          id v27 = [(id)v43 title];
          id v28 = [v27 string];
          uint64_t v29 = objc_msgSend(v26, "stringWithFormat:", v42, v28);
          uint64_t v61 = v29;
          [NSDictionary dictionaryWithObjects:&v61 forKeys:&v60 count:1];
        }
        else
        {
          uint64_t v62 = *MEMORY[0x263F08320];
          v39 = NSString;
          v42 = WFLocalizedString(@"Add New Reminder failed because the Reminders account “%@” does not support subtasks.");
          id v27 = [(id)v43 account];
          id v28 = [v27 displayName];
          uint64_t v29 = objc_msgSend(v39, "stringWithFormat:", v42, v28);
          uint64_t v63 = v29;
          [NSDictionary dictionaryWithObjects:&v63 forKeys:&v62 count:1];
        v40 = };
        uint64_t v41 = [v25 errorWithDomain:*MEMORY[0x263F870B8] code:5 userInfo:v40];
        [v24 finishRunningWithError:v41];

LABEL_36:
        goto LABEL_37;
      }
      id v11 = [v9 addReminderWithTitle:*(void *)(a1 + 40) toReminderSubtaskContextChangeItem:v15];
    }
    if ([*(id *)(a1 + 48) length])
    {
      double v16 = (void *)[objc_alloc(MEMORY[0x263F086A0]) initWithString:*(void *)(a1 + 48)];
      [v11 setNotes:v16];
    }
    if (*(void *)(a1 + 56))
    {
      double v17 = [v11 attachmentContext];
      id v18 = (id)[v17 addURLAttachmentWithURL:*(void *)(a1 + 56)];
    }
    if (*(void *)(a1 + 64))
    {
      v19 = [v11 flaggedContext];
      objc_msgSend(v19, "setFlagged:", objc_msgSend(*(id *)(a1 + 64), "integerValue"));
    }
    uint64_t v20 = *(void **)(a1 + 72);
    if (v20)
    {
      if ([v20 isEqualToString:@"Low"])
      {
        uint64_t v21 = 7;
      }
      else if ([*(id *)(a1 + 72) isEqualToString:@"Medium"])
      {
        uint64_t v21 = 5;
      }
      else if ([*(id *)(a1 + 72) isEqualToString:@"High"])
      {
        uint64_t v21 = 3;
      }
      else
      {
        uint64_t v21 = 0;
      }
      [v11 setPriority:v21];
    }
    if ([*(id *)(a1 + 80) length])
    {
      v30 = [*(id *)(a1 + 80) componentsSeparatedByString:@","];
      long long v52 = 0u;
      long long v53 = 0u;
      long long v50 = 0u;
      long long v51 = 0u;
      uint64_t v31 = [v30 countByEnumeratingWithState:&v50 objects:v59 count:16];
      if (v31)
      {
        uint64_t v32 = *(void *)v51;
        do
        {
          for (uint64_t i = 0; i != v31; ++i)
          {
            if (*(void *)v51 != v32) {
              objc_enumerationMutation(v30);
            }
            uint64_t v34 = *(void *)(*((void *)&v50 + 1) + 8 * i);
            v35 = [v11 hashtagContext];
            id v36 = (id)[v35 addHashtagWithType:0 name:v34];
          }
          uint64_t v31 = [v30 countByEnumeratingWithState:&v50 objects:v59 count:16];
        }
        while (v31);
      }
    }
    v37 = *(void **)(a1 + 32);
    id v38 = objc_initWeak(location, v37);
    v45[0] = MEMORY[0x263EF8330];
    v45[1] = 3221225472;
    v45[2] = __53__WFAddNewReminderAction_runAsynchronouslyWithInput___block_invoke_2;
    v45[3] = &unk_264E59FF0;
    objc_copyWeak(&v49, location);
    id v10 = v11;
    id v46 = v10;
    id v47 = v9;
    id v48 = v44;
    [v37 addAlertToReminderChange:v10 forAccount:v42 completionHandler:v45];

    objc_destroyWeak(&v49);
    objc_destroyWeak(location);
    goto LABEL_36;
  }
  id v44 = WFLocalizedString(@"No Reminders lists");
  uint64_t v9 = WFLocalizedString(@"Add New Reminders couldn't find any Reminders lists. Make sure you have at least one set up in the Reminders app.");
  uint64_t v12 = (void *)MEMORY[0x263F087E8];
  uint64_t v13 = *MEMORY[0x263F08320];
  v64[0] = *MEMORY[0x263F08338];
  v64[1] = v13;
  v65[0] = v44;
  v65[1] = v9;
  id v14 = [NSDictionary dictionaryWithObjects:v65 forKeys:v64 count:2];
  id v10 = [v12 errorWithDomain:*MEMORY[0x263F870B8] code:5 userInfo:v14];

  [*(id *)(a1 + 32) finishRunningWithError:v10];
LABEL_37:
}

void __53__WFAddNewReminderAction_runAsynchronouslyWithInput___block_invoke_2(id *a1)
{
  uint64_t v2 = a1 + 7;
  id WeakRetained = objc_loadWeakRetained(a1 + 7);
  id v4 = a1[4];
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __53__WFAddNewReminderAction_runAsynchronouslyWithInput___block_invoke_3;
  v5[3] = &unk_264E59FF0;
  objc_copyWeak(&v9, v2);
  id v6 = a1[5];
  id v7 = a1[4];
  id v8 = a1[6];
  [WeakRetained addImagesToReminderChange:v4 completionHandler:v5];

  objc_destroyWeak(&v9);
}

void __53__WFAddNewReminderAction_runAsynchronouslyWithInput___block_invoke_3(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  [WeakRetained finishAddingReminderWithSaveRequest:*(void *)(a1 + 32) reminderChange:*(void *)(a1 + 40) reminderStore:*(void *)(a1 + 48)];
}

- (NSDateFormatter)dateFormatter
{
  dateFormatter = self->_dateFormatter;
  if (!dateFormatter)
  {
    id v4 = (NSDateFormatter *)objc_opt_new();
    unint64_t v5 = self->_dateFormatter;
    self->_dateFormatter = v4;

    dateFormatter = self->_dateFormatter;
  }
  return dateFormatter;
}

- (void)updateLists
{
  id v2 = [(WFAddNewReminderAction *)self parameterForKey:@"WFCalendarDescriptor"];
  [v2 reloadStates];
}

- (void)wasRemovedFromWorkflow:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)WFAddNewReminderAction;
  [(WFAddNewReminderAction *)&v5 wasRemovedFromWorkflow:a3];
  id v4 = [(WFAddNewReminderAction *)self resourceManager];
  [v4 removeTarget:self selector:sel_updateLists];
}

- (void)wasAddedToWorkflow:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)WFAddNewReminderAction;
  [(WFAddNewReminderAction *)&v5 wasAddedToWorkflow:a3];
  id v4 = [(WFAddNewReminderAction *)self resourceManager];
  [v4 addTarget:self selector:sel_updateLists];

  [(WFAddNewReminderAction *)self updateHiddenParameters];
}

@end