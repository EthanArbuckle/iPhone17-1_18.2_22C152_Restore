@interface CNChangeHistoryFetchExecutor
+ (id)os_log;
- (BOOL)validateFetchRequest;
- (CNChangeHistoryFetchExecutor)initWithRequest:(id)a3 store:(id)a4;
- (CNChangeHistoryFetchRequest)request;
- (CNContactStore)store;
- (id)contactLinkingEventsForContacts:(id)a3 withFactory:(id)a4;
- (id)countOfDeltaSync;
- (id)deltaSync;
- (id)description;
- (id)fetchCount:(id *)a3;
- (id)fetchEvents:(id *)a3;
- (id)fullSync;
- (id)keysToFetch;
- (id)run:(id *)a3;
@end

@implementation CNChangeHistoryFetchExecutor

+ (id)os_log
{
  if (os_log_cn_once_token_0_7 != -1) {
    dispatch_once(&os_log_cn_once_token_0_7, &__block_literal_global_46);
  }
  v2 = (void *)os_log_cn_once_object_0_7;

  return v2;
}

uint64_t __38__CNChangeHistoryFetchExecutor_os_log__block_invoke()
{
  os_log_cn_once_object_0_7 = (uint64_t)os_log_create("com.apple.contacts", "fetching");

  return MEMORY[0x1F41817F8]();
}

- (CNChangeHistoryFetchExecutor)initWithRequest:(id)a3 store:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v13.receiver = self;
  v13.super_class = (Class)CNChangeHistoryFetchExecutor;
  v9 = [(CNChangeHistoryFetchExecutor *)&v13 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_request, a3);
    objc_storeStrong((id *)&v10->_store, a4);
    v11 = v10;
  }

  return v10;
}

- (id)description
{
  v3 = [MEMORY[0x1E4F5A3A8] descriptionBuilderWithObject:self];
  v4 = [(CNChangeHistoryFetchExecutor *)self request];
  id v5 = (id)[v3 appendName:@"request" object:v4];

  v6 = [(CNChangeHistoryFetchExecutor *)self store];
  id v7 = (id)[v3 appendName:@"store" object:v6];

  id v8 = [v3 build];

  return v8;
}

- (id)run:(id *)a3
{
  if (![(CNChangeHistoryFetchExecutor *)self validateFetchRequest]
    || ([(CNChangeHistoryFetchExecutor *)self request],
        id v5 = objc_claimAutoreleasedReturnValue(),
        uint64_t v6 = [v5 resultType],
        v5,
        v6 == 2))
  {
    id v8 = +[CNErrorFactory errorWithCode:605];
    v9 = v8;
    if (a3) {
      *a3 = v8;
    }

LABEL_9:
    id v7 = 0;
    goto LABEL_10;
  }
  if (v6 != 1)
  {
    if (!v6)
    {
      id v7 = [(CNChangeHistoryFetchExecutor *)self fetchEvents:a3];
      goto LABEL_10;
    }
    goto LABEL_9;
  }
  id v7 = [(CNChangeHistoryFetchExecutor *)self fetchCount:a3];
LABEL_10:

  return v7;
}

- (id)fetchEvents:(id *)a3
{
  id v5 = [(CNChangeHistoryFetchExecutor *)self request];
  uint64_t v6 = [v5 startingToken];

  BOOL v7 = +[CNContactStore isAccessLimitedForEntityType:0];
  if (v7) {
    goto LABEL_4;
  }
  if (!v6)
  {
    v11 = 0;
    goto LABEL_8;
  }
  id v8 = +[CNChangeHistoryAnchor limitedAccessHistoryAnchor];
  v9 = [v8 historyToken];
  char v10 = [v9 isEqualToData:v6];

  if (v10)
  {
LABEL_4:

    v11 = 0;
    uint64_t v6 = 0;
LABEL_8:
    objc_super v13 = [(CNChangeHistoryFetchExecutor *)self fullSync];

    goto LABEL_9;
  }
  v12 = [(CNChangeHistoryFetchExecutor *)self deltaSync];
  v11 = v12;
  if (!v12) {
    goto LABEL_8;
  }
  objc_super v13 = v12;
  if ([v12 isFailure]) {
    goto LABEL_8;
  }
LABEL_9:
  if ([v13 isSuccess])
  {
    v14 = [v13 value];
    v15 = [v14 events];

    if (v7)
    {
      v16 = +[CNChangeHistoryAnchor limitedAccessHistoryAnchor];
      [v16 historyToken];
    }
    else
    {
      v16 = [v13 value];
      [v16 token];
    v19 = };

    v18 = [[CNFetchResult alloc] initWithValue:v15 currentHistoryToken:v19];
  }
  else
  {
    v17 = [v13 error];
    v15 = v17;
    v18 = 0;
    if (a3) {
      *a3 = v17;
    }
  }

  return v18;
}

- (id)fetchCount:(id *)a3
{
  if (+[CNContactStore isAccessLimitedForEntityType:0])
  {
    id v5 = +[CNErrorFactory errorWithCode:603];
    uint64_t v6 = v5;
    BOOL v7 = 0;
    if (a3) {
      *a3 = v5;
    }
  }
  else
  {
    uint64_t v6 = [(CNChangeHistoryFetchExecutor *)self countOfDeltaSync];
    if ([v6 isSuccess])
    {
      id v8 = NSNumber;
      v9 = [v6 value];
      char v10 = objc_msgSend(v8, "numberWithInteger:", objc_msgSend(v9, "count"));

      v11 = [v6 value];
      v12 = [v11 token];

      BOOL v7 = [[CNFetchResult alloc] initWithValue:v10 currentHistoryToken:v12];
    }
    else
    {
      objc_super v13 = [v6 error];
      char v10 = v13;
      BOOL v7 = 0;
      if (a3) {
        *a3 = v13;
      }
    }
  }

  return v7;
}

- (BOOL)validateFetchRequest
{
  v3 = [(CNChangeHistoryFetchExecutor *)self request];
  if ([v3 shouldUnifyResults])
  {
    v4 = [(CNChangeHistoryFetchExecutor *)self request];
    int v5 = [v4 includeLinkingChanges] ^ 1;
  }
  else
  {
    LOBYTE(v5) = 1;
  }

  return v5;
}

- (id)fullSync
{
  v36[4] = *MEMORY[0x1E4F143B8];
  v3 = [(CNChangeHistoryFetchExecutor *)self keysToFetch];
  v4 = [[CNContactFetchRequest alloc] initWithKeysToFetch:v3];
  int v5 = [(CNChangeHistoryFetchExecutor *)self request];
  -[CNContactFetchRequest setUnifyResults:](v4, "setUnifyResults:", [v5 shouldUnifyResults]);

  uint64_t v6 = [(CNChangeHistoryFetchExecutor *)self request];
  -[CNContactFetchRequest setMutableObjects:](v4, "setMutableObjects:", [v6 mutableObjects]);

  BOOL v7 = [(CNChangeHistoryFetchExecutor *)self store];
  id v35 = 0;
  id v8 = [v7 enumeratorForContactFetchRequest:v4 error:&v35];
  id v29 = v35;

  v9 = [v8 value];
  char v10 = [v9 allObjects];

  if (v10)
  {
    v11 = [(CNChangeHistoryFetchExecutor *)self store];
    id v34 = 0;
    v12 = [v11 groupsMatchingPredicate:0 error:&v34];
    id v28 = v34;

    if (v12)
    {
      objc_super v13 = objc_alloc_init(CNChangeHistoryEventFactory);
      v32[0] = MEMORY[0x1E4F143A8];
      v32[1] = 3221225472;
      v32[2] = __40__CNChangeHistoryFetchExecutor_fullSync__block_invoke;
      v32[3] = &unk_1E56B53A8;
      v14 = v13;
      v33 = v14;
      v25 = objc_msgSend(v10, "_cn_map:", v32);
      v30[0] = MEMORY[0x1E4F143A8];
      v30[1] = 3221225472;
      v30[2] = __40__CNChangeHistoryFetchExecutor_fullSync__block_invoke_2;
      v30[3] = &unk_1E56B53D0;
      v31 = v14;
      v26 = v14;
      v24 = objc_msgSend(v12, "_cn_map:", v30);
      uint64_t v15 = [(CNChangeHistoryFetchExecutor *)self contactLinkingEventsForContacts:v10 withFactory:v26];
      v16 = [(CNChangeHistoryEventFactory *)v26 dropEverythingEvent];
      v36[0] = v16;
      v36[1] = v25;
      v36[2] = v15;
      v36[3] = v24;
      v17 = (void *)v15;
      [MEMORY[0x1E4F1C978] arrayWithObjects:v36 count:4];
      v18 = v27 = v3;
      v19 = objc_msgSend(v18, "_cn_flatten");

      v20 = [v8 currentHistoryToken];
      v21 = -[_CNChangeHistoryFetchExecutionResponse initWithEvents:count:token:]([_CNChangeHistoryFetchExecutionResponse alloc], "initWithEvents:count:token:", v19, [v19 count], v20);
      v22 = [MEMORY[0x1E4F5A4E0] successWithValue:v21];

      v3 = v27;
    }
    else
    {
      v22 = [MEMORY[0x1E4F5A4E0] failureWithError:v28];
    }
  }
  else
  {
    v22 = [MEMORY[0x1E4F5A4E0] failureWithError:v29];
  }

  return v22;
}

uint64_t __40__CNChangeHistoryFetchExecutor_fullSync__block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) addContactEventWithContact:a2 containerIdentifier:0];
}

uint64_t __40__CNChangeHistoryFetchExecutor_fullSync__block_invoke_2(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) addGroupEventWithGroup:a2 containerIdentifier:0];
}

- (id)deltaSync
{
  v3 = [(CNChangeHistoryFetchExecutor *)self store];
  v4 = [(CNChangeHistoryFetchExecutor *)self request];
  id v22 = 0;
  int v5 = [v3 changeHistoryWithFetchRequest:v4 error:&v22];
  id v6 = v22;

  if (v5)
  {
    BOOL v7 = [CNChangeHistoryLegacyResultConverter alloc];
    id v8 = [(CNChangeHistoryFetchExecutor *)self store];
    v9 = [(CNChangeHistoryFetchExecutor *)self request];
    char v10 = [v9 additionalContactKeyDescriptors];
    v11 = [(CNChangeHistoryLegacyResultConverter *)v7 initWithContactStore:v8 additionalContactKeyDescriptors:v10];

    v12 = [(CNChangeHistoryLegacyResultConverter *)v11 eventsFromResult:v5];
    if ([v12 isSuccess])
    {
      objc_super v13 = [v5 latestChangeAnchor];
      v14 = [v13 historyToken];

      uint64_t v15 = [_CNChangeHistoryFetchExecutionResponse alloc];
      v16 = [v12 value];
      v17 = [v12 value];
      v18 = -[_CNChangeHistoryFetchExecutionResponse initWithEvents:count:token:](v15, "initWithEvents:count:token:", v16, [v17 count], v14);

      v19 = [MEMORY[0x1E4F5A4E0] successWithValue:v18];
    }
    else
    {
      v20 = (void *)MEMORY[0x1E4F5A4E0];
      v14 = [v12 error];
      v19 = [v20 failureWithError:v14];
    }
  }
  else
  {
    v19 = [MEMORY[0x1E4F5A4E0] failureWithError:v6];
  }

  return v19;
}

- (id)countOfDeltaSync
{
  v3 = [(CNChangeHistoryFetchExecutor *)self store];
  v4 = [(CNChangeHistoryFetchExecutor *)self request];
  id v13 = 0;
  int v5 = [v3 changeHistoryWithFetchRequest:v4 error:&v13];
  id v6 = v13;

  if (v5)
  {
    uint64_t v7 = [v5 changesCount];
    id v8 = [v5 latestChangeAnchor];
    v9 = [v8 historyToken];

    char v10 = [[_CNChangeHistoryFetchExecutionResponse alloc] initWithEvents:0 count:v7 token:v9];
    v11 = [MEMORY[0x1E4F5A4E0] successWithValue:v10];
  }
  else
  {
    v11 = [MEMORY[0x1E4F5A4E0] failureWithError:v6];
  }

  return v11;
}

- (id)keysToFetch
{
  v14[3] = *MEMORY[0x1E4F143B8];
  v3 = (void *)MEMORY[0x1E4F1CA48];
  v4 = +[CNContact alwaysFetchedKeys];
  int v5 = [v4 allObjects];
  id v6 = [v3 arrayWithArray:v5];

  uint64_t v7 = [(CNChangeHistoryFetchExecutor *)self request];
  id v8 = [v7 additionalContactKeyDescriptors];

  if (((*(uint64_t (**)(void))(*MEMORY[0x1E4F5A258] + 16))() & 1) == 0) {
    [v6 addObjectsFromArray:v8];
  }
  v9 = [(CNChangeHistoryFetchExecutor *)self request];
  int v10 = [v9 includeLinkingChanges];

  if (v10)
  {
    v14[0] = @"linkIdentifier";
    v14[1] = @"preferredForName";
    v14[2] = @"preferredForImage";
    v11 = [MEMORY[0x1E4F1C978] arrayWithObjects:v14 count:3];
    [v6 addObjectsFromArray:v11];
  }
  v12 = objc_msgSend(v6, "_cn_flatten");

  return v12;
}

- (id)contactLinkingEventsForContacts:(id)a3 withFactory:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(CNChangeHistoryFetchExecutor *)self request];
  if ([v8 includeLinkingChanges])
  {
    unint64_t v9 = [v6 count];

    if (v9 >= 2)
    {
      int v10 = [MEMORY[0x1E4F1CA48] array];
      v11 = objc_msgSend(v6, "_cn_filter:", &__block_literal_global_24);
      v12 = objc_msgSend(v11, "_cn_groupBy:", &__block_literal_global_27_0);
      v17[0] = MEMORY[0x1E4F143A8];
      v17[1] = 3221225472;
      v17[2] = __76__CNChangeHistoryFetchExecutor_contactLinkingEventsForContacts_withFactory___block_invoke_3;
      v17[3] = &unk_1E56B5440;
      id v13 = v10;
      id v18 = v13;
      id v19 = v7;
      objc_msgSend(v12, "_cn_each:", v17);
      v14 = v19;
      id v15 = v13;

      goto LABEL_6;
    }
  }
  else
  {
  }
  id v15 = (id)MEMORY[0x1E4F1CBF0];
LABEL_6:

  return v15;
}

uint64_t __76__CNChangeHistoryFetchExecutor_contactLinkingEventsForContacts_withFactory___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2 = *MEMORY[0x1E4F5A2A0];
  v3 = [a2 linkIdentifier];
  uint64_t v4 = (*(uint64_t (**)(uint64_t, void *))(v2 + 16))(v2, v3);

  return v4;
}

uint64_t __76__CNChangeHistoryFetchExecutor_contactLinkingEventsForContacts_withFactory___block_invoke_2(uint64_t a1, void *a2)
{
  return [a2 linkIdentifier];
}

void __76__CNChangeHistoryFetchExecutor_contactLinkingEventsForContacts_withFactory___block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if ((unint64_t)[v6 count] >= 2)
  {
    id v7 = [v6 objectAtIndexedSubscript:0];
    id v8 = [v7 linkIdentifier];
    unint64_t v9 = +[CNContact contactWithIdentifierOnly:v8];

    uint64_t v34 = 0;
    id v35 = &v34;
    uint64_t v36 = 0x3032000000;
    v37 = __Block_byref_object_copy__11;
    v38 = __Block_byref_object_dispose__11;
    id v39 = 0;
    uint64_t v28 = 0;
    id v29 = &v28;
    uint64_t v30 = 0x3032000000;
    v31 = __Block_byref_object_copy__11;
    v32 = __Block_byref_object_dispose__11;
    id v33 = 0;
    uint64_t v18 = MEMORY[0x1E4F143A8];
    uint64_t v19 = 3221225472;
    v20 = __76__CNChangeHistoryFetchExecutor_contactLinkingEventsForContacts_withFactory___block_invoke_28;
    v21 = &unk_1E56B5418;
    id v10 = v7;
    id v22 = v10;
    id v23 = *(id *)(a1 + 32);
    id v24 = *(id *)(a1 + 40);
    id v11 = v9;
    id v25 = v11;
    v26 = &v34;
    v27 = &v28;
    objc_msgSend(v6, "_cn_each:", &v18);
    uint64_t v12 = v35[5];
    if (v12)
    {
      id v13 = *(void **)(a1 + 32);
      v14 = objc_msgSend(*(id *)(a1 + 40), "preferredContactForNameEventWithPreferredContact:unifiedContact:", v12, 0, v18, v19, v20, v21, v22, v23, v24);
      [v13 addObject:v14];
    }
    uint64_t v15 = v29[5];
    if (v15)
    {
      v16 = *(void **)(a1 + 32);
      v17 = [*(id *)(a1 + 40) preferredContactForImageEventWithPreferredContact:v15 unifiedContact:0];
      [v16 addObject:v17];
    }
    _Block_object_dispose(&v28, 8);

    _Block_object_dispose(&v34, 8);
  }
}

void __76__CNChangeHistoryFetchExecutor_contactLinkingEventsForContacts_withFactory___block_invoke_28(uint64_t a1, void *a2)
{
  id v13 = a2;
  v3 = [*(id *)(a1 + 32) identifier];
  uint64_t v4 = [v13 identifier];

  if (v3 != v4)
  {
    id v5 = *(void **)(a1 + 40);
    id v6 = [*(id *)(a1 + 48) linkContactsEventWithFromContact:*(void *)(a1 + 32) toContact:v13 unifiedContact:*(void *)(a1 + 56)];
    [v5 addObject:v6];
  }
  char v7 = [v13 isPreferredForName];
  uint64_t v8 = *(void *)(*(void *)(a1 + 64) + 8);
  unint64_t v9 = v13;
  if ((v7 & 1) == 0) {
    unint64_t v9 = *(void **)(v8 + 40);
  }
  objc_storeStrong((id *)(v8 + 40), v9);
  char v10 = [v13 isPreferredForImage];
  uint64_t v11 = *(void *)(*(void *)(a1 + 72) + 8);
  uint64_t v12 = v13;
  if ((v10 & 1) == 0) {
    uint64_t v12 = *(void **)(v11 + 40);
  }
  objc_storeStrong((id *)(v11 + 40), v12);
}

- (CNChangeHistoryFetchRequest)request
{
  return self->_request;
}

- (CNContactStore)store
{
  return self->_store;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_store, 0);

  objc_storeStrong((id *)&self->_request, 0);
}

@end