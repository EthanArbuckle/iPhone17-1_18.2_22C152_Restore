@interface _CDTemporalInteractionAdvisor
- (NSMutableDictionary)consumerToModelMap;
- (OS_dispatch_queue)dataQueue;
- (_CDInteractionStore)store;
- (_CDTemporalInteractionAdvisor)initWithStore:(id)a3;
- (id)adviseInteractionsForDate:(id)a3 usingSettings:(id)a4;
- (id)rankContacts:(id)a3 usingSettings:(id)a4;
- (id)rankerForDate:(id)a3 settings:(id)a4;
- (int)settingsNotifyToken;
- (void)dealloc;
- (void)setConsumerToModelMap:(id)a3;
- (void)setDataQueue:(id)a3;
- (void)setSettingsNotifyToken:(int)a3;
- (void)setStore:(id)a3;
- (void)updateConsumerModel;
@end

@implementation _CDTemporalInteractionAdvisor

- (id)rankContacts:(id)a3 usingSettings:(id)a4
{
  v31[2] = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  id v7 = a3;
  v8 = [v6 interactionDate];
  if (!v8)
  {
    v8 = [MEMORY[0x1E4F1C9C8] date];
  }
  v28 = [(_CDTemporalInteractionAdvisor *)self rankerForDate:v8 settings:v6];
  v9 = [(_CDTemporalInteractionAdvisor *)self consumerToModelMap];
  +[_CDInteractionAdvisorUtils adjustForConsumerSettings:v6 modelSettings:v9 andRanker:v28];

  v27 = [v7 valueForKey:@"identifier"];
  v10 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"startDate <= %@", v8];
  v11 = [v6 interactionPredicate];

  v26 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"sender.identifier IN %@", v27];
  v25 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"ANY recipients.identifier IN %@", v27];
  v12 = v7;
  v13 = (void *)MEMORY[0x1E4F28BA0];
  v31[0] = v26;
  v31[1] = v25;
  v14 = [MEMORY[0x1E4F1C978] arrayWithObjects:v31 count:2];
  v15 = [v13 orPredicateWithSubpredicates:v14];

  v16 = (void *)MEMORY[0x1E4F28BA0];
  v30[0] = v10;
  v30[1] = v11;
  v30[2] = v15;
  v17 = [MEMORY[0x1E4F1C978] arrayWithObjects:v30 count:3];
  v18 = [v16 andPredicateWithSubpredicates:v17];

  v19 = [MEMORY[0x1E4F29008] sortDescriptorWithKey:@"startDate" ascending:0];
  store = self->_store;
  v29 = v19;
  v21 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v29 count:1];
  v22 = [(_CDInteractionStore *)store queryInteractionsUsingPredicate:v18 sortDescriptors:v21 limit:500 error:0];

  v23 = +[_CDInteractionAdvisorUtils rankContacts:v12 basedOnInteractions:v22 andRanker:v28];

  return v23;
}

- (_CDTemporalInteractionAdvisor)initWithStore:(id)a3
{
  v25[5] = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  v23.receiver = self;
  v23.super_class = (Class)_CDTemporalInteractionAdvisor;
  id v6 = [(_CDTemporalInteractionAdvisor *)&v23 init];
  id v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_store, a3);
    dispatch_queue_t v8 = dispatch_queue_create("com.apple.coreduet.cdtemporalAdvisor.serialqueue", 0);
    [(_CDTemporalInteractionAdvisor *)v7 setDataQueue:v8];

    v24[0] = &unk_1EDE1DC28;
    v9 = [MEMORY[0x1E4F1CA60] dictionary];
    v25[0] = v9;
    v24[1] = &unk_1EDE1DC70;
    v10 = [MEMORY[0x1E4F1CA60] dictionary];
    v25[1] = v10;
    v24[2] = &unk_1EDE1DC40;
    v11 = [MEMORY[0x1E4F1CA60] dictionary];
    v25[2] = v11;
    v24[3] = &unk_1EDE1DC58;
    v12 = objc_opt_new();
    v25[3] = v12;
    v24[4] = &unk_1EDE1DC88;
    v13 = [MEMORY[0x1E4F1CA60] dictionary];
    v25[4] = v13;
    v14 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v25 forKeys:v24 count:5];

    uint64_t v15 = [v14 mutableCopy];
    consumerToModelMap = v7->_consumerToModelMap;
    v7->_consumerToModelMap = (NSMutableDictionary *)v15;

    [(_CDTemporalInteractionAdvisor *)v7 updateConsumerModel];
    objc_initWeak(&location, v7);
    v17 = (const char *)[@"com.apple.coreduet.CDPeopleSettingsDidChange" UTF8String];
    v18 = [(_CDTemporalInteractionAdvisor *)v7 dataQueue];
    handler[0] = MEMORY[0x1E4F143A8];
    handler[1] = 3221225472;
    handler[2] = __47___CDTemporalInteractionAdvisor_initWithStore___block_invoke;
    handler[3] = &unk_1E560EEE8;
    objc_copyWeak(&v21, &location);
    notify_register_dispatch(v17, &v7->_settingsNotifyToken, v18, handler);

    objc_destroyWeak(&v21);
    objc_destroyWeak(&location);
  }
  return v7;
}

- (void)dealloc
{
  notify_cancel(self->_settingsNotifyToken);
  v3.receiver = self;
  v3.super_class = (Class)_CDTemporalInteractionAdvisor;
  [(_CDTemporalInteractionAdvisor *)&v3 dealloc];
}

- (void)updateConsumerModel
{
  id v2 = [(_CDTemporalInteractionAdvisor *)self consumerToModelMap];
  +[_CDInteractionAdvisorUtils updateConsumerModelSettings:v2];
}

- (void)setConsumerToModelMap:(id)a3
{
  id v4 = a3;
  id v5 = [(_CDTemporalInteractionAdvisor *)self dataQueue];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __55___CDTemporalInteractionAdvisor_setConsumerToModelMap___block_invoke;
  v10[3] = &unk_1E560D848;
  v10[4] = self;
  id v11 = v4;
  id v6 = v10;
  id v7 = v4;
  dispatch_queue_t v8 = (void *)os_transaction_create();
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __cd_dispatch_async_capture_tx_block_invoke_4;
  block[3] = &unk_1E560D978;
  id v13 = v8;
  id v14 = v6;
  id v9 = v8;
  dispatch_async(v5, block);
}

- (id)rankerForDate:(id)a3 settings:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  id v7 = objc_opt_new();
  [v7 setReferenceDate:v6];

  dispatch_queue_t v8 = [v5 contactPrefix];
  [v7 setContactPrefix:v8];

  [v7 setTimeHalfLife:172800.0];
  [v7 setTimeOfDayHalfLife:7200.0];
  [v7 setTimeOfWeekHalfLife:21600.0];
  [v7 setTimeWeight:2.0];
  [v7 setTimeOfDayWeight:1.0];
  [v7 setTimeOfWeekWeight:2.0];
  [v7 setOutgoingWeight:2.0];
  [v7 setKeywordWeight:100000.0];
  [v7 setContactNameKeywordMatchWeight:200000.0];
  id v9 = [v5 interactionTitle];
  v10 = +[_CDStringTokenizer extractNormalizedKeywords:v9];
  [v7 setReferenceKeywords:v10];

  id v11 = [v5 constrainIdentifiers];
  [v7 setAllowedIdentifiers:v11];

  v12 = [v5 constrainPersonIds];
  [v7 setAllowedPersonIds:v12];

  id v13 = [v5 constrainPersonIdType];
  [v7 setAllowedPersonIdType:v13];

  [v7 setLocationWeight:4.0];
  id v14 = [v5 interactionLocationUUID];

  [v7 setReferenceLocationUUID:v14];
  [v7 setRankAggregationMethod:0];
  return v7;
}

- (id)adviseInteractionsForDate:(id)a3 usingSettings:(id)a4
{
  v48[2] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  context = (void *)MEMORY[0x192FB2F20]();
  uint64_t v8 = [(_CDTemporalInteractionAdvisor *)self rankerForDate:v6 settings:v7];
  id v9 = [(_CDTemporalInteractionAdvisor *)self consumerToModelMap];
  v44 = (void *)v8;
  +[_CDInteractionAdvisorUtils adjustForConsumerSettings:v7 modelSettings:v9 andRanker:v8];

  v10 = [MEMORY[0x1E4F28F60] predicateWithValue:1];
  uint64_t v11 = [v7 contactPredicate];
  unint64_t v12 = 0x1E4F28000uLL;
  unint64_t v13 = 0x1E4F1C000uLL;
  v43 = (void *)v11;
  if (v11)
  {
    v42 = [(_CDInteractionStore *)self->_store queryContactsUsingPredicate:v11 sortDescriptors:0 limit:500 error:0];
    id v14 = [v42 valueForKey:@"identifier"];
    if ([v14 count])
    {
      uint64_t v15 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"sender.identifier IN %@", v14];
      v16 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"ANY recipients.identifier IN %@", v14];
      v17 = v10;
      v18 = (void *)MEMORY[0x1E4F28BA0];
      v48[0] = v15;
      v48[1] = v16;
      v19 = [MEMORY[0x1E4F1C978] arrayWithObjects:v48 count:2];
      v10 = [v18 orPredicateWithSubpredicates:v19];

      unint64_t v12 = 0x1E4F28000;
      unint64_t v13 = 0x1E4F1C000;
    }
  }
  else
  {
    v42 = 0;
  }
  if ([v7 useFuture]) {
    uint64_t v20 = 4;
  }
  else {
    uint64_t v20 = 0;
  }
  uint64_t v21 = +[_CDInteractionAdvisorUtils createTimePredicateForReferenceDate:v6 recentLookBackDays:168 windowHours:24 lookBackWeeks:4 lookAheadWeeks:v20];
  uint64_t v22 = [v7 interactionPredicate];
  objc_super v23 = *(void **)(v12 + 2976);
  v40 = (void *)v22;
  v41 = (void *)v21;
  v47[0] = v21;
  v47[1] = v22;
  v47[2] = v10;
  v24 = [*(id *)(v13 + 2424) arrayWithObjects:v47 count:3];
  v25 = [v23 andPredicateWithSubpredicates:v24];

  v26 = +[_CDLogging interactionChannel];
  v39 = v6;
  if (os_log_type_enabled(v26, OS_LOG_TYPE_DEBUG)) {
    -[_CDTemporalInteractionAdvisor adviseInteractionsForDate:usingSettings:]();
  }

  v27 = [MEMORY[0x1E4F29008] sortDescriptorWithKey:@"startDate" ascending:0];
  store = self->_store;
  v46 = v27;
  v29 = [*(id *)(v13 + 2424) arrayWithObjects:&v46 count:1];
  v30 = [(_CDInteractionStore *)store queryInteractionsUsingPredicate:v25 sortDescriptors:v29 limit:500 error:0];

  v31 = [v7 ignoreContactIdentifiers];
  v32 = [v31 allObjects];
  v33 = +[_CDInteractionAdvisorUtils contactsForIdentifiers:v32];

  uint64_t v34 = [v7 resultLimit];
  uint64_t v35 = [v7 aggregateByIdentifier];
  LOBYTE(v38) = [v7 requireOutgoingInteraction];
  v36 = +[_CDInteractionAdvisorUtils adviceBasedOnInteractions:v30 forContacts:v42 andRanker:v44 ignoringContacts:v33 withLimit:v34 aggregateByIdentifier:v35 requireOneOutgoingInteraction:v38];

  return v36;
}

- (_CDInteractionStore)store
{
  return (_CDInteractionStore *)objc_getProperty(self, a2, 16, 1);
}

- (void)setStore:(id)a3
{
}

- (OS_dispatch_queue)dataQueue
{
  return self->_dataQueue;
}

- (void)setDataQueue:(id)a3
{
}

- (NSMutableDictionary)consumerToModelMap
{
  return self->_consumerToModelMap;
}

- (int)settingsNotifyToken
{
  return self->_settingsNotifyToken;
}

- (void)setSettingsNotifyToken:(int)a3
{
  self->_settingsNotifyToken = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_consumerToModelMap, 0);
  objc_storeStrong((id *)&self->_dataQueue, 0);
  objc_storeStrong((id *)&self->_store, 0);
}

- (void)adviseInteractionsForDate:usingSettings:.cold.1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_3_0(&dword_18ECEB000, v0, v1, "Querying interactions with predicate %@", v2, v3, v4, v5, v6);
}

@end