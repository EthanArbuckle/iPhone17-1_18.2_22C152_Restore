@interface WFGetUpcomingCalendarItemsAction
- (void)runAsynchronouslyWithInput:(id)a3;
- (void)updateCalendars;
- (void)wasAddedToWorkflow:(id)a3;
- (void)wasRemovedFromWorkflow:(id)a3;
@end

@implementation WFGetUpcomingCalendarItemsAction

- (void)runAsynchronouslyWithInput:(id)a3
{
  v74[1] = *MEMORY[0x263EF8340];
  id v56 = a3;
  v4 = [(WFGetUpcomingCalendarItemsAction *)self parameterValueForKey:@"WFGetUpcomingItemCount" ofClass:objc_opt_class()];
  uint64_t v62 = [v4 integerValue];

  v5 = [(WFGetUpcomingCalendarItemsAction *)self definition];
  v6 = [v5 objectForKey:@"WFGetUpcomingItemType"];
  uint64_t v7 = [v6 unsignedIntegerValue];

  v57 = [(WFGetUpcomingCalendarItemsAction *)self parameterValueForKey:@"WFGetUpcomingItemCalendar" ofClass:objc_opt_class()];
  v8 = [(WFGetUpcomingCalendarItemsAction *)self resourceManager];
  v9 = [v8 resourceObjectsOfClass:objc_opt_class()];
  v58 = [v9 anyObject];

  if ([v58 status] != 4)
  {
    v30 = [v58 availabilityError];
    [(WFGetUpcomingCalendarItemsAction *)self finishRunningWithError:v30];

    goto LABEL_26;
  }
  if (!v7)
  {
    v31 = WFGetWorkflowEventStore();
    v61 = [v31 calendarsForEntityType:0];
    if (v57)
    {
      uint64_t v32 = [v57 matchingCalendarsFromArray:v61];

      v61 = (void *)v32;
    }
    v59 = objc_opt_new();
    v53 = [(WFGetUpcomingCalendarItemsAction *)self parameterValueForKey:@"WFDateSpecifier" ofClass:objc_opt_class()];
    int v60 = [v53 isEqualToString:@"Today"];
    int v55 = [v53 isEqualToString:@"Tomorrow"];
    int v54 = [v53 isEqualToString:@"Specified Day"];
    double v33 = 0.0;
    unint64_t v34 = -86400;
    uint64_t v35 = 86400;
    while (1)
    {
      uint64_t v70 = 0;
      v71 = &v70;
      uint64_t v72 = 0x2020000000;
      char v73 = 0;
      if (v60) {
        break;
      }
      if (v55)
      {
        v36 = objc_msgSend(MEMORY[0x263EFF8F0], "currentCalendar", v33);
        v42 = [MEMORY[0x263EFF910] date];
        v38 = [v36 components:28 fromDate:v42];

        objc_msgSend(v38, "setDay:", objc_msgSend(v38, "day") + 1);
        v39 = [v36 dateFromComponents:v38];
        objc_msgSend(v38, "setDay:", objc_msgSend(v38, "day") + 1);
        v40 = [v36 dateFromComponents:v38];
        uint64_t v41 = [v31 predicateForEventsWithStartDate:v39 endDate:v40 calendars:v61];
        goto LABEL_14;
      }
      if (v54)
      {
        v46 = [(WFGetUpcomingCalendarItemsAction *)self parameterValueForKey:@"WFSpecifiedDate" ofClass:objc_opt_class()];
        v47 = v46;
        if (v46)
        {
          id v48 = v46;
        }
        else
        {
          id v48 = [MEMORY[0x263EFF910] date];
        }
        v36 = v48;

        v38 = [MEMORY[0x263EFF8F0] currentCalendar];
        v39 = [v38 components:28 fromDate:v36];
        v40 = [v38 dateFromComponents:v39];
        objc_msgSend(v39, "setDay:", objc_msgSend(v39, "day") + 1);
        v49 = [v38 dateFromComponents:v39];
        v43 = [v31 predicateForEventsWithStartDate:v40 endDate:v49 calendars:v61];

        goto LABEL_15;
      }
      char v73 = 1;
      v36 = [MEMORY[0x263EFF910] dateWithTimeIntervalSinceNow:v33];
      v38 = [MEMORY[0x263EFF910] dateWithTimeIntervalSinceNow:(double)v35];
      v43 = [v31 predicateForEventsWithStartDate:v36 endDate:v38 calendars:v61];
LABEL_16:

      v66[0] = MEMORY[0x263EF8330];
      v66[1] = 3221225472;
      v66[2] = __63__WFGetUpcomingCalendarItemsAction_runAsynchronouslyWithInput___block_invoke;
      v66[3] = &unk_264E56778;
      id v44 = v59;
      id v67 = v44;
      v68 = &v70;
      uint64_t v69 = v62;
      [v31 enumerateEventsMatchingPredicate:v43 usingBlock:v66];
      BOOL v45 = *((unsigned char *)v71 + 24) == 0;

      _Block_object_dispose(&v70, 8);
      if (!v45)
      {
        double v33 = (double)v35;
        v35 += 86400;
        v34 += 86400;
        if (v34 <= 0x784CDFF) {
          continue;
        }
      }
      v50 = [v44 allValues];
      v51 = [v50 sortedArrayUsingSelector:sel_compareStartDateWithEvent_];
      v64[0] = MEMORY[0x263EF8330];
      v64[1] = 3221225472;
      v64[2] = __63__WFGetUpcomingCalendarItemsAction_runAsynchronouslyWithInput___block_invoke_2;
      v64[3] = &unk_264E567A0;
      v64[4] = self;
      id v65 = v31;
      id v52 = v31;
      [v51 enumerateObjectsUsingBlock:v64];

      [(WFGetUpcomingCalendarItemsAction *)self finishRunningWithError:0];
      goto LABEL_26;
    }
    v36 = objc_msgSend(MEMORY[0x263EFF8F0], "currentCalendar", v33);
    v37 = [MEMORY[0x263EFF910] date];
    v38 = [v36 components:28 fromDate:v37];

    objc_msgSend(v38, "setDay:", objc_msgSend(v38, "day") + 1);
    v39 = [MEMORY[0x263EFF910] date];
    v40 = [v36 dateFromComponents:v38];
    uint64_t v41 = [v31 predicateForEventsWithStartDate:v39 endDate:v40 calendars:v61];
LABEL_14:
    v43 = (void *)v41;
LABEL_15:

    goto LABEL_16;
  }
  v10 = objc_opt_new();
  v11 = (void *)MEMORY[0x263F33950];
  v12 = WFReminderPropertyNameDueDate();
  v13 = [v11 propertyForName:v12];

  v14 = (void *)MEMORY[0x263F33950];
  v15 = WFReminderPropertyNameList();
  v16 = [v14 propertyForName:v15];

  v17 = (void *)MEMORY[0x263F33950];
  v18 = WFReminderPropertyNameIsCompleted();
  v19 = [v17 propertyForName:v18];

  if (([v57 allCalendars] & 1) == 0)
  {
    v20 = (void *)MEMORY[0x263F337B8];
    v21 = [v57 calendarTitle];
    v22 = [v20 predicateWithValue:v21 forProperty:v16 comparisonType:4];
    [v10 addObject:v22];
  }
  v23 = [MEMORY[0x263F337B8] predicateWithValue:MEMORY[0x263EFFA80] forProperty:v19 comparisonType:4];
  [v10 addObject:v23];

  v24 = [MEMORY[0x263F337C0] andPredicateWithSubpredicates:v10];
  v25 = (void *)[objc_alloc(MEMORY[0x263F33810]) initWithPredicate:v24];
  v26 = [MEMORY[0x263F33818] sortDescriptorWithProperty:v13 ascending:1 comparator:0];
  v74[0] = v26;
  v27 = [MEMORY[0x263EFF8C0] arrayWithObjects:v74 count:1];
  [v25 setSortDescriptors:v27];

  objc_msgSend(v25, "setSlice:", 0x7FFFFFFFFFFFFFFFLL, v62);
  v28 = (void *)MEMORY[0x263F33950];
  v29 = [(WFGetUpcomingCalendarItemsAction *)self contentPermissionRequestor];
  v63[0] = MEMORY[0x263EF8330];
  v63[1] = 3221225472;
  v63[2] = __63__WFGetUpcomingCalendarItemsAction_runAsynchronouslyWithInput___block_invoke_3;
  v63[3] = &unk_264E5EEE8;
  v63[4] = self;
  [v28 runQuery:v25 withItems:0 permissionRequestor:v29 completionHandler:v63];

LABEL_26:
}

void __63__WFGetUpcomingCalendarItemsAction_runAsynchronouslyWithInput___block_invoke(uint64_t a1, void *a2, unsigned char *a3)
{
  id v5 = a2;
  v6 = *(void **)(a1 + 32);
  id v11 = v5;
  uint64_t v7 = [v5 eventIdentifier];
  v8 = [v6 objectForKey:v7];

  if (!v8)
  {
    v9 = *(void **)(a1 + 32);
    v10 = [v11 eventIdentifier];
    [v9 setObject:v11 forKey:v10];
  }
  if ([*(id *)(a1 + 32) count] == *(void *)(a1 + 48))
  {
    *a3 = 1;
    *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 0;
  }
}

void __63__WFGetUpcomingCalendarItemsAction_runAsynchronouslyWithInput___block_invoke_2(uint64_t a1, void *a2)
{
  v3 = *(void **)(a1 + 32);
  id v4 = a2;
  id v6 = [v3 output];
  id v5 = [MEMORY[0x263F33758] itemWithEKEvent:v4 fromEventStore:*(void *)(a1 + 40)];

  [v6 addItem:v5];
}

void __63__WFGetUpcomingCalendarItemsAction_runAsynchronouslyWithInput___block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  uint64_t v7 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v14;
    do
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v14 != v9) {
          objc_enumerationMutation(v5);
        }
        uint64_t v11 = *(void *)(*((void *)&v13 + 1) + 8 * v10);
        v12 = [*(id *)(a1 + 32) output];
        [v12 addItem:v11];

        ++v10;
      }
      while (v8 != v10);
      uint64_t v8 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v8);
  }
  [*(id *)(a1 + 32) finishRunningWithError:v6];
}

- (void)updateCalendars
{
  id v2 = [(WFGetUpcomingCalendarItemsAction *)self parameterForKey:@"WFGetUpcomingItemCalendar"];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    [v2 loadPossibleStatesWithCompletionHandler:&__block_literal_global_5981];
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      [v2 reloadStates];
    }
  }
}

- (void)wasRemovedFromWorkflow:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)WFGetUpcomingCalendarItemsAction;
  [(WFGetUpcomingCalendarItemsAction *)&v5 wasRemovedFromWorkflow:a3];
  id v4 = [(WFGetUpcomingCalendarItemsAction *)self resourceManager];
  [v4 removeTarget:self selector:sel_updateCalendars];
}

- (void)wasAddedToWorkflow:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)WFGetUpcomingCalendarItemsAction;
  [(WFGetUpcomingCalendarItemsAction *)&v5 wasAddedToWorkflow:a3];
  id v4 = [(WFGetUpcomingCalendarItemsAction *)self resourceManager];
  [v4 addTarget:self selector:sel_updateCalendars];
}

@end