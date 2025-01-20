@interface WFRemoveCalendarItemsAction
- (Class)contentItemClass;
- (id)accessResource;
- (id)contentDestinationWithError:(id *)a3;
- (unint64_t)entityType;
- (void)deleteItems:(id)a3;
- (void)runAsynchronouslyWithInput:(id)a3;
@end

@implementation WFRemoveCalendarItemsAction

- (id)contentDestinationWithError:(id *)a3
{
  return 0;
}

- (void)deleteItems:(id)a3
{
  uint64_t v44 = *MEMORY[0x263EF8340];
  id v26 = a3;
  if ([(WFRemoveCalendarItemsAction *)self entityType])
  {
    v4 = WFGetWorkflowReminderStore();
    uint64_t v38 = 0;
    v39 = &v38;
    uint64_t v40 = 0x2050000000;
    v5 = (void *)getREMSaveRequestClass_softClass;
    uint64_t v41 = getREMSaveRequestClass_softClass;
    if (!getREMSaveRequestClass_softClass)
    {
      v37[0] = MEMORY[0x263EF8330];
      v37[1] = 3221225472;
      v37[2] = __getREMSaveRequestClass_block_invoke;
      v37[3] = &unk_264E5EC88;
      v37[4] = &v38;
      __getREMSaveRequestClass_block_invoke((uint64_t)v37);
      v5 = (void *)v39[3];
    }
    v6 = v5;
    _Block_object_dispose(&v38, 8);
    v7 = (void *)[[v6 alloc] initWithStore:v4];
    long long v30 = 0u;
    long long v31 = 0u;
    long long v28 = 0u;
    long long v29 = 0u;
    id v8 = v26;
    uint64_t v9 = [v8 countByEnumeratingWithState:&v28 objects:v42 count:16];
    if (v9)
    {
      uint64_t v10 = *(void *)v29;
      do
      {
        for (uint64_t i = 0; i != v9; ++i)
        {
          if (*(void *)v29 != v10) {
            objc_enumerationMutation(v8);
          }
          v12 = [*(id *)(*((void *)&v28 + 1) + 8 * i) reminder];
          v13 = [v7 updateReminder:v12];

          [v13 removeFromList];
        }
        uint64_t v9 = [v8 countByEnumeratingWithState:&v28 objects:v42 count:16];
      }
      while (v9);
    }

    v14 = dispatch_get_global_queue(0, 0);
    v27[0] = MEMORY[0x263EF8330];
    v27[1] = 3221225472;
    v27[2] = __43__WFRemoveCalendarItemsAction_deleteItems___block_invoke;
    v27[3] = &unk_264E5EBC8;
    v27[4] = self;
    [v7 saveWithQueue:v14 completion:v27];
  }
  else
  {
    v15 = [(WFRemoveCalendarItemsAction *)self parameterValueForKey:@"WFCalendarIncludeFutureEvents" ofClass:objc_opt_class()];
    unsigned int v16 = [v15 BOOLValue];

    long long v35 = 0u;
    long long v36 = 0u;
    long long v34 = 0u;
    long long v33 = 0u;
    id v17 = v26;
    uint64_t v18 = [v17 countByEnumeratingWithState:&v33 objects:v43 count:16];
    if (v18)
    {
      uint64_t v19 = *(void *)v34;
      while (2)
      {
        for (uint64_t j = 0; j != v18; ++j)
        {
          if (*(void *)v34 != v19) {
            objc_enumerationMutation(v17);
          }
          v21 = *(void **)(*((void *)&v33 + 1) + 8 * j);
          v22 = [v21 eventStore];
          v23 = [v21 event];
          id v32 = 0;
          char v24 = [v22 removeEvent:v23 span:v16 commit:1 error:&v32];
          id v25 = v32;

          if ((v24 & 1) == 0)
          {
            [(WFRemoveCalendarItemsAction *)self finishRunningWithError:v25];

            goto LABEL_22;
          }
        }
        uint64_t v18 = [v17 countByEnumeratingWithState:&v33 objects:v43 count:16];
        if (v18) {
          continue;
        }
        break;
      }
    }

    [(WFRemoveCalendarItemsAction *)self finishRunningWithError:0];
  }
LABEL_22:
}

uint64_t __43__WFRemoveCalendarItemsAction_deleteItems___block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) finishRunningWithError:a2];
}

- (void)runAsynchronouslyWithInput:(id)a3
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  id v4 = a3;
  v5 = [(WFRemoveCalendarItemsAction *)self accessResource];
  if ([v5 status] == 4)
  {
    [(WFRemoveCalendarItemsAction *)self entityType];
    id v22 = 0;
    v6 = [v4 collectionByFilteringToItemClass:objc_opt_class() excludedItems:&v22];
    id v7 = v22;
    id v8 = [v6 items];

    long long v20 = 0u;
    long long v21 = 0u;
    long long v18 = 0u;
    long long v19 = 0u;
    id v17 = v7;
    uint64_t v9 = [v7 items];
    uint64_t v10 = [v9 countByEnumeratingWithState:&v18 objects:v23 count:16];
    if (v10)
    {
      uint64_t v11 = v10;
      uint64_t v12 = *(void *)v19;
      do
      {
        uint64_t v13 = 0;
        do
        {
          if (*(void *)v19 != v12) {
            objc_enumerationMutation(v9);
          }
          uint64_t v14 = *(void *)(*((void *)&v18 + 1) + 8 * v13);
          v15 = [(WFRemoveCalendarItemsAction *)self output];
          [v15 addItem:v14];

          ++v13;
        }
        while (v11 != v13);
        uint64_t v11 = [v9 countByEnumeratingWithState:&v18 objects:v23 count:16];
      }
      while (v11);
    }

    if ([v8 count]) {
      [(WFRemoveCalendarItemsAction *)self deleteItems:v8];
    }
    else {
      [(WFRemoveCalendarItemsAction *)self finishRunningWithError:0];
    }
  }
  else
  {
    unsigned int v16 = [v5 availabilityError];
    [(WFRemoveCalendarItemsAction *)self finishRunningWithError:v16];
  }
}

- (id)accessResource
{
  v3 = [(WFRemoveCalendarItemsAction *)self resourceManager];
  [(WFRemoveCalendarItemsAction *)self entityType];
  id v4 = [v3 resourceObjectsOfClass:objc_opt_class()];
  v5 = [v4 anyObject];

  return v5;
}

- (Class)contentItemClass
{
  v2 = [(WFRemoveCalendarItemsAction *)self definition];
  v3 = [v2 objectForKey:@"WFCalendarItemEntityType"];
  [v3 isEqualToString:@"Event"];

  id v4 = objc_opt_class();
  return (Class)v4;
}

- (unint64_t)entityType
{
  v2 = [(WFRemoveCalendarItemsAction *)self definition];
  v3 = [v2 objectForKey:@"WFCalendarItemEntityType"];
  int v4 = [v3 isEqualToString:@"Event"];

  return v4 ^ 1u;
}

@end