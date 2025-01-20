@interface CalLinkREMStoreWrapper
- (CalLinkREMStoreWrapper)init;
- (id)fetchReminderListNamesForReminderURLs:(id)a3 error:(id *)a4;
@end

@implementation CalLinkREMStoreWrapper

- (CalLinkREMStoreWrapper)init
{
  v8.receiver = self;
  v8.super_class = (Class)CalLinkREMStoreWrapper;
  v2 = [(CalLinkREMStoreWrapper *)&v8 init];
  if (v2)
  {
    uint64_t v10 = 0;
    v11 = &v10;
    uint64_t v12 = 0x2050000000;
    v3 = (void *)getREMStoreClass_softClass;
    uint64_t v13 = getREMStoreClass_softClass;
    if (!getREMStoreClass_softClass)
    {
      v9[0] = MEMORY[0x263EF8330];
      v9[1] = 3221225472;
      v9[2] = __getREMStoreClass_block_invoke;
      v9[3] = &unk_2648589F8;
      v9[4] = &v10;
      __getREMStoreClass_block_invoke((uint64_t)v9);
      v3 = (void *)v11[3];
    }
    id v4 = v3;
    _Block_object_dispose(&v10, 8);
    uint64_t v5 = objc_opt_new();
    reminderStore = v2->_reminderStore;
    v2->_reminderStore = (REMStore *)v5;
  }
  return v2;
}

- (id)fetchReminderListNamesForReminderURLs:(id)a3 error:(id *)a4
{
  uint64_t v32 = *MEMORY[0x263EF8340];
  id v4 = a3;
  uint64_t v5 = objc_opt_new();
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  id v6 = v4;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v22 objects:v31 count:16];
  if (v7)
  {
    uint64_t v8 = *(void *)v23;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v23 != v8) {
          objc_enumerationMutation(v6);
        }
        uint64_t v10 = *(void *)(*((void *)&v22 + 1) + 8 * i);
        uint64_t v27 = 0;
        v28 = &v27;
        uint64_t v29 = 0x2050000000;
        v11 = (void *)getREMObjectIDClass_softClass;
        uint64_t v30 = getREMObjectIDClass_softClass;
        if (!getREMObjectIDClass_softClass)
        {
          v26[0] = MEMORY[0x263EF8330];
          v26[1] = 3221225472;
          v26[2] = __getREMObjectIDClass_block_invoke;
          v26[3] = &unk_2648589F8;
          v26[4] = &v27;
          __getREMObjectIDClass_block_invoke((uint64_t)v26);
          v11 = (void *)v28[3];
        }
        id v12 = v11;
        _Block_object_dispose(&v27, 8);
        uint64_t v13 = [v12 objectIDWithURL:v10];
        if (v13) {
          [v5 addObject:v13];
        }
      }
      uint64_t v7 = [v6 countByEnumeratingWithState:&v22 objects:v31 count:16];
    }
    while (v7);
  }

  v14 = [(REMStore *)self->_reminderStore fetchRemindersWithObjectIDs:v5 error:a4];
  if (v14)
  {
    v15 = objc_opt_new();
    v20[0] = MEMORY[0x263EF8330];
    v20[1] = 3221225472;
    v20[2] = __70__CalLinkREMStoreWrapper_fetchReminderListNamesForReminderURLs_error___block_invoke;
    v20[3] = &unk_2648589D0;
    id v16 = v15;
    id v21 = v16;
    [v14 enumerateKeysAndObjectsUsingBlock:v20];
  }
  else
  {
    id v16 = 0;
  }

  return v16;
}

void __70__CalLinkREMStoreWrapper_fetchReminderListNamesForReminderURLs_error___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v9 = a2;
  uint64_t v5 = [a3 list];
  id v6 = [v5 name];

  if (v6)
  {
    uint64_t v7 = *(void **)(a1 + 32);
    uint64_t v8 = [v9 urlRepresentation];
    [v7 setObject:v6 forKeyedSubscript:v8];
  }
}

- (void).cxx_destruct
{
}

@end