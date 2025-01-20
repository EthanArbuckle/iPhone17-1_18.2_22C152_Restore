@interface ABSBulkFaultHandler
+ (double)interestWindow;
+ (int64_t)batchSize;
+ (int64_t)interestThreshold;
- (ABSAddressBookContextStorage)storage;
- (ABSBulkFaultHandler)initWithStorage:(id)a3 contactStoreFuture:(id)a4 schedulerProvider:(id)a5;
- (BOOL)withinInterestWindow;
- (CNFuture)contactStoreFuture;
- (CNScheduler)inlineScheduler;
- (NSMutableSet)keyDescriptorOfInterests;
- (double)lastRequestTimeStamp;
- (id)batchOfPeopleInStorageMissingKeysIncluding:(id)a3;
- (id)store;
- (int64_t)interest;
- (void)completePeople:(id)a3 withKeysToFetch:(id)a4;
- (void)completePerson:(id)a3 withKeysToFetch:(id)a4;
- (void)increaseInterest;
- (void)refetchContacts:(id)a3 keysToFetch:(id)a4 handler:(id)a5;
- (void)resetInterest;
- (void)setInterest:(int64_t)a3;
- (void)setLastRequestTimeStamp:(double)a3;
@end

@implementation ABSBulkFaultHandler

+ (double)interestWindow
{
  return 0.1;
}

+ (int64_t)interestThreshold
{
  return 5;
}

+ (int64_t)batchSize
{
  return 250;
}

- (ABSBulkFaultHandler)initWithStorage:(id)a3 contactStoreFuture:(id)a4 schedulerProvider:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v22.receiver = self;
  v22.super_class = (Class)ABSBulkFaultHandler;
  v12 = [(ABSBulkFaultHandler *)&v22 init];
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_storage, a3);
    uint64_t v14 = [v11 inlineScheduler];
    inlineScheduler = v13->_inlineScheduler;
    v13->_inlineScheduler = (CNScheduler *)v14;

    objc_storeStrong((id *)&v13->_contactStoreFuture, a4);
    uint64_t v16 = [MEMORY[0x263EFF9C0] set];
    keyDescriptorOfInterests = v13->_keyDescriptorOfInterests;
    v13->_keyDescriptorOfInterests = (NSMutableSet *)v16;

    v18 = [MEMORY[0x263EFF910] distantPast];
    [v18 timeIntervalSinceReferenceDate];
    v13->_lastRequestTimeStamp = v19;

    v20 = v13;
  }

  return v13;
}

- (id)store
{
  v2 = [(ABSBulkFaultHandler *)self contactStoreFuture];
  v3 = [v2 result:0];

  return v3;
}

- (void)completePerson:(id)a3 withKeysToFetch:(id)a4
{
  v13[1] = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  if (![(ABSBulkFaultHandler *)self withinInterestWindow]) {
    [(ABSBulkFaultHandler *)self resetInterest];
  }
  v8 = [(ABSBulkFaultHandler *)self keyDescriptorOfInterests];
  [v8 addObjectsFromArray:v7];

  uint64_t v9 = [(ABSBulkFaultHandler *)self interest];
  if (v9 >= [(id)objc_opt_class() interestThreshold])
  {
    id v10 = [(ABSBulkFaultHandler *)self batchOfPeopleInStorageMissingKeysIncluding:v6];
    id v11 = [(ABSBulkFaultHandler *)self keyDescriptorOfInterests];
    v12 = [v11 allObjects];
    [(ABSBulkFaultHandler *)self completePeople:v10 withKeysToFetch:v12];
  }
  else
  {
    [(ABSBulkFaultHandler *)self increaseInterest];
    v13[0] = v6;
    id v10 = [MEMORY[0x263EFF8C0] arrayWithObjects:v13 count:1];
    [(ABSBulkFaultHandler *)self completePeople:v10 withKeysToFetch:v7];
  }
}

- (BOOL)withinInterestWindow
{
  v3 = [(ABSBulkFaultHandler *)self inlineScheduler];
  [v3 timestamp];
  double v5 = v4;

  [(ABSBulkFaultHandler *)self lastRequestTimeStamp];
  double v7 = v5 - v6;
  [(id)objc_opt_class() interestWindow];
  return v7 < v8;
}

- (void)resetInterest
{
  *(_WORD *)v1 = 0;
  _os_log_debug_impl(&dword_214A03000, log, OS_LOG_TYPE_DEBUG, "Resetting interest", v1, 2u);
}

- (void)increaseInterest
{
  uint64_t v5 = *MEMORY[0x263EF8340];
  int v3 = 134217984;
  uint64_t v4 = [a1 interest];
  _os_log_debug_impl(&dword_214A03000, a2, OS_LOG_TYPE_DEBUG, "Increasing interest: %ld", (uint8_t *)&v3, 0xCu);
}

- (id)batchOfPeopleInStorageMissingKeysIncluding:(id)a3
{
  uint64_t v47 = *MEMORY[0x263EF8340];
  id v32 = a3;
  v33 = self;
  uint64_t v4 = [(ABSBulkFaultHandler *)self keyDescriptorOfInterests];
  uint64_t v5 = [v4 allObjects];

  id v6 = objc_alloc_init(MEMORY[0x263EFEAF8]);
  v35 = [MEMORY[0x263EFF980] array];
  long long v40 = 0u;
  long long v41 = 0u;
  long long v42 = 0u;
  long long v43 = 0u;
  id v7 = v5;
  uint64_t v8 = [v7 countByEnumeratingWithState:&v40 objects:v46 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v41;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v41 != v10) {
          objc_enumerationMutation(v7);
        }
        v12 = *(void **)(*((void *)&v40 + 1) + 8 * i);
        v13 = objc_msgSend(v12, "_cn_requiredKeys");
        [v6 unionKeyVector:v13];

        uint64_t v14 = objc_msgSend(v12, "_cn_optionalKeys");
        v15 = [MEMORY[0x263EFEA28] keyVector];
        char v16 = [v14 isEqualToKeyVector:v15];

        if ((v16 & 1) == 0) {
          [v35 addObject:v12];
        }
      }
      uint64_t v9 = [v7 countByEnumeratingWithState:&v40 objects:v46 count:16];
    }
    while (v9);
  }

  v17 = (void *)[v6 copy];
  v45 = v17;
  v34 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v45 count:1];

  v18 = [(ABSBulkFaultHandler *)v33 storage];
  double v19 = [v18 records];
  v20 = [v19 allValues];

  v21 = [MEMORY[0x263EFF980] arrayWithObject:v32];
  long long v36 = 0u;
  long long v37 = 0u;
  long long v38 = 0u;
  long long v39 = 0u;
  id v22 = v20;
  uint64_t v23 = [v22 countByEnumeratingWithState:&v36 objects:v44 count:16];
  if (v23)
  {
    uint64_t v24 = v23;
    uint64_t v25 = *(void *)v37;
    while (2)
    {
      for (uint64_t j = 0; j != v24; ++j)
      {
        if (*(void *)v37 != v25) {
          objc_enumerationMutation(v22);
        }
        id v27 = *(id *)(*((void *)&v36 + 1) + 8 * j);
        v28 = [v27 cnImpl];
        v29 = v28;
        if (v27 != v32
          && (![v28 areKeysAvailable:v34]
           || ([v29 areKeysAvailable:v35] & 1) == 0))
        {
          [v21 addObject:v27];
          unint64_t v30 = [v21 count];
          if (v30 >= [(id)objc_opt_class() batchSize])
          {

            goto LABEL_23;
          }
        }
      }
      uint64_t v24 = [v22 countByEnumeratingWithState:&v36 objects:v44 count:16];
      if (v24) {
        continue;
      }
      break;
    }
  }
LABEL_23:

  return v21;
}

- (void)completePeople:(id)a3 withKeysToFetch:(id)a4
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  if ((unint64_t)[v6 count] >= 2)
  {
    uint64_t v8 = +[ABSLog log];
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 134217984;
      uint64_t v23 = [v6 count];
      _os_log_impl(&dword_214A03000, v8, OS_LOG_TYPE_INFO, "Fetching in bulk %ld contacts!", buf, 0xCu);
    }
  }
  uint64_t v9 = objc_msgSend(v6, "_cn_map:", &__block_literal_global_3);
  uint64_t v10 = objc_msgSend(v6, "_cn_indexBy:", &__block_literal_global_9);
  id v11 = (void *)[v10 mutableCopy];
  v12 = [(ABSBulkFaultHandler *)self store];
  v13 = [v12 authorizedKeysForContactKeys:v7];

  if ([v13 count])
  {
    uint64_t v16 = MEMORY[0x263EF8330];
    uint64_t v17 = 3221225472;
    v18 = __54__ABSBulkFaultHandler_completePeople_withKeysToFetch___block_invoke_3;
    double v19 = &unk_264223B60;
    id v20 = v10;
    id v14 = v11;
    id v21 = v14;
    [(ABSBulkFaultHandler *)self refetchContacts:v9 keysToFetch:v13 handler:&v16];
    objc_msgSend(v14, "_cn_each:", &__block_literal_global_13, v16, v17, v18, v19);
    v15 = [(ABSBulkFaultHandler *)self inlineScheduler];
    [v15 timestamp];
    -[ABSBulkFaultHandler setLastRequestTimeStamp:](self, "setLastRequestTimeStamp:");
  }
}

uint64_t __54__ABSBulkFaultHandler_completePeople_withKeysToFetch___block_invoke(uint64_t a1, void *a2)
{
  return [a2 cnImpl];
}

id __54__ABSBulkFaultHandler_completePeople_withKeysToFetch___block_invoke_2(uint64_t a1, void *a2)
{
  v2 = [a2 cnImpl];
  int v3 = [v2 identifier];

  return v3;
}

void __54__ABSBulkFaultHandler_completePeople_withKeysToFetch___block_invoke_3(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v6 = [v3 identifier];
  uint64_t v4 = [*(id *)(a1 + 32) objectForKeyedSubscript:v6];
  uint64_t v5 = [v4 cnImpl];

  [v5 overwriteStateFromContact:v3];
  [*(id *)(a1 + 40) removeObjectForKey:v6];
}

void __54__ABSBulkFaultHandler_completePeople_withKeysToFetch___block_invoke_4(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  id v3 = (objc_class *)MEMORY[0x263EFEAF0];
  id v4 = a3;
  id v5 = objc_alloc_init(v3);
  id v6 = +[ABSLog log];
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    id v7 = [v5 identifier];
    *(_DWORD *)buf = 138412290;
    double v19 = v7;
    _os_log_impl(&dword_214A03000, v6, OS_LOG_TYPE_DEFAULT, "Backing contact has been deleted, creating a new contact: %@", buf, 0xCu);
  }
  uint64_t v8 = [v4 cnImpl];
  uint64_t v9 = [v8 keyVector];
  uint64_t v12 = MEMORY[0x263EF8330];
  uint64_t v13 = 3221225472;
  id v14 = __54__ABSBulkFaultHandler_completePeople_withKeysToFetch___block_invoke_15;
  v15 = &unk_264223BA8;
  id v16 = v8;
  id v17 = v5;
  id v10 = v5;
  id v11 = v8;
  [v9 enumeratePropertiesUsingBlock:&v12];

  objc_msgSend(v4, "replaceRecordStorageWithCNObject:", v10, v12, v13, v14, v15);
}

void __54__ABSBulkFaultHandler_completePeople_withKeysToFetch___block_invoke_15(uint64_t a1, void *a2)
{
  uint64_t v3 = *(void *)(a1 + 32);
  id v4 = a2;
  id v5 = [v4 CNValueForContact:v3];
  [v4 setCNValue:v5 onContact:*(void *)(a1 + 40)];
}

- (void)refetchContacts:(id)a3 keysToFetch:(id)a4 handler:(id)a5
{
  id v8 = a5;
  uint64_t v9 = (objc_class *)MEMORY[0x263EFEA18];
  id v10 = a4;
  id v11 = a3;
  uint64_t v12 = (void *)[[v9 alloc] initWithKeysToFetch:v10];

  if ([v11 count] == 1)
  {
    uint64_t v13 = [v11 firstObject];

    id v14 = (void *)MEMORY[0x263EFE9F8];
    uint64_t v15 = [v13 iOSLegacyIdentifier];
    id v16 = [v13 identifier];
    id v17 = [v14 predicateForFaultFulfillmentForLegacyIdentifier:v15 identifier:v16];
  }
  else
  {
    v18 = (void *)MEMORY[0x263EFE9F8];
    uint64_t v13 = objc_msgSend(v11, "_cn_map:", &__block_literal_global_21_0);

    id v17 = [v18 predicateForContactsWithIdentifiers:v13];
  }

  [v12 setPredicate:v17];
  [v12 setUnifyResults:0];
  [v12 setMutableObjects:0];
  double v19 = [(ABSBulkFaultHandler *)self store];
  id v29 = 0;
  uint64_t v24 = MEMORY[0x263EF8330];
  uint64_t v25 = 3221225472;
  v26 = __59__ABSBulkFaultHandler_refetchContacts_keysToFetch_handler___block_invoke_2;
  id v27 = &unk_264223BF0;
  id v20 = v8;
  id v28 = v20;
  char v21 = [v19 enumerateContactsWithFetchRequest:v12 error:&v29 usingBlock:&v24];
  id v22 = v29;

  if ((v21 & 1) == 0)
  {
    uint64_t v23 = +[ABSLog log];
    if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR)) {
      -[ABSBulkFaultHandler refetchContacts:keysToFetch:handler:]((uint64_t)v22, v23);
    }
  }
}

uint64_t __59__ABSBulkFaultHandler_refetchContacts_keysToFetch_handler___block_invoke(uint64_t a1, void *a2)
{
  return [a2 identifier];
}

uint64_t __59__ABSBulkFaultHandler_refetchContacts_keysToFetch_handler___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (ABSAddressBookContextStorage)storage
{
  return self->_storage;
}

- (CNScheduler)inlineScheduler
{
  return self->_inlineScheduler;
}

- (CNFuture)contactStoreFuture
{
  return self->_contactStoreFuture;
}

- (NSMutableSet)keyDescriptorOfInterests
{
  return self->_keyDescriptorOfInterests;
}

- (int64_t)interest
{
  return self->_interest;
}

- (void)setInterest:(int64_t)a3
{
  self->_interest = a3;
}

- (double)lastRequestTimeStamp
{
  return self->_lastRequestTimeStamp;
}

- (void)setLastRequestTimeStamp:(double)a3
{
  self->_lastRequestTimeStamp = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_keyDescriptorOfInterests, 0);
  objc_storeStrong((id *)&self->_contactStoreFuture, 0);
  objc_storeStrong((id *)&self->_inlineScheduler, 0);

  objc_storeStrong((id *)&self->_storage, 0);
}

- (void)refetchContacts:(uint64_t)a1 keysToFetch:(NSObject *)a2 handler:.cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 138543362;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_214A03000, a2, OS_LOG_TYPE_ERROR, "Error completing contacts: %{public}@", (uint8_t *)&v2, 0xCu);
}

@end