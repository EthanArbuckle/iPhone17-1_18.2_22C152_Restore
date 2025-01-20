@interface IAMMessageEntryManager
+ (id)messageEntries:(id)a3 withSatisfiedPresentationTriggerForTriggerContext:(id)a4;
+ (id)targetIdentifiersForMessageEntries:(id)a3;
+ (id)uniqueMessageEntriesInMessageEntriesByTrigger:(id)a3;
+ (void)_addMessageEntry:(id)a3 toTriggerKeyDictionary:(id)a4 atKey:(id)a5;
- (IAMMessageEntryManager)initWithModalTargetIdentifier:(id)a3;
- (NSArray)messageEntries;
- (NSString)modalTargetIdentifier;
- (id)messageEntriesByTriggerForEventContext:(id)a3;
- (id)messageEntriesForContextPropertiesContext:(id)a3;
- (id)messageEntriesForTargetIdentifier:(id)a3;
- (id)messageEntryForIdentifier:(id)a3;
- (id)priorityMessageEntryForIdentifier:(id)a3;
- (void)_updateMessageIndexes;
- (void)addPriorityMessageEntry:(id)a3;
- (void)setMessageEntries:(id)a3;
- (void)setModalTargetIdentifier:(id)a3;
@end

@implementation IAMMessageEntryManager

- (IAMMessageEntryManager)initWithModalTargetIdentifier:(id)a3
{
  id v4 = a3;
  v16.receiver = self;
  v16.super_class = (Class)IAMMessageEntryManager;
  v5 = [(IAMMessageEntryManager *)&v16 init];
  if (v5)
  {
    uint64_t v6 = [v4 copy];
    modalTargetIdentifier = v5->_modalTargetIdentifier;
    v5->_modalTargetIdentifier = (NSString *)v6;

    messageEntryByIdentifier = v5->_messageEntryByIdentifier;
    v9 = (NSDictionary *)MEMORY[0x263EFFA78];
    v5->_messageEntryByIdentifier = (NSDictionary *)MEMORY[0x263EFFA78];

    priorityMessageEntryByIdentifier = v5->_priorityMessageEntryByIdentifier;
    v5->_priorityMessageEntryByIdentifier = v9;

    messageEntriesByEventTriggers = v5->_messageEntriesByEventTriggers;
    v5->_messageEntriesByEventTriggers = v9;

    messageEntriesByContextPropertyTriggers = v5->_messageEntriesByContextPropertyTriggers;
    v5->_messageEntriesByContextPropertyTriggers = v9;

    messageEntriesByUnknownKindTriggers = v5->_messageEntriesByUnknownKindTriggers;
    v5->_messageEntriesByUnknownKindTriggers = v9;

    messageEntriesByTargetIdentifier = v5->_messageEntriesByTargetIdentifier;
    v5->_messageEntriesByTargetIdentifier = v9;
  }
  return v5;
}

+ (id)targetIdentifiersForMessageEntries:(id)a3
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v3 = a3;
  id v4 = objc_opt_new();
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v5 = v3;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v15;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v15 != v8) {
          objc_enumerationMutation(v5);
        }
        v10 = objc_msgSend(*(id *)(*((void *)&v14 + 1) + 8 * i), "applicationMessage", (void)v14);
        v11 = [v10 targets];

        if (v11) {
          [v4 addObjectsFromArray:v11];
        }
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v7);
  }

  v12 = [v4 allObjects];

  return v12;
}

- (id)messageEntriesByTriggerForEventContext:(id)a3
{
  uint64_t v78 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = (void *)[(NSDictionary *)self->_messageEntriesByEventTriggers copy];
  uint64_t v6 = (void *)[(NSDictionary *)self->_messageEntriesByUnknownKindTriggers copy];
  uint64_t v7 = [v4 event];
  uint64_t v8 = [v4 bundleIdentifier];
  objc_opt_class();
  LOBYTE(self) = objc_opt_isKindOfClass();
  v66 = objc_opt_new();
  if (self)
  {
    v67 = v8;
    id v64 = v4;
    v65 = v6;
    long long v74 = 0u;
    long long v75 = 0u;
    long long v72 = 0u;
    long long v73 = 0u;
    v63 = v5;
    id v9 = v5;
    uint64_t v10 = [v9 countByEnumeratingWithState:&v72 objects:v77 count:16];
    if (v10)
    {
      uint64_t v11 = v10;
      uint64_t v12 = *(void *)v73;
      do
      {
        for (uint64_t i = 0; i != v11; ++i)
        {
          if (*(void *)v73 != v12) {
            objc_enumerationMutation(v9);
          }
          long long v14 = *(void **)(*((void *)&v72 + 1) + 8 * i);
          long long v15 = [v9 objectForKey:v14];
          if ([v15 count])
          {
            long long v16 = [v14 bundleIdentifier];
            long long v17 = v16;
            if (!v16 || [v16 isEqualToString:v67])
            {
              v18 = [v14 name];
              int v19 = [v7 matchesWithKey:v18];

              if (v19)
              {
                v20 = [v66 objectForKeyedSubscript:v14];

                if (!v20)
                {
                  v21 = objc_opt_new();
                  [v66 setObject:v21 forKeyedSubscript:v14];
                }
                v22 = [v66 objectForKeyedSubscript:v14];
                [v22 addObjectsFromArray:v15];
              }
            }
          }
        }
        uint64_t v11 = [v9 countByEnumeratingWithState:&v72 objects:v77 count:16];
      }
      while (v11);
    }

    long long v70 = 0u;
    long long v71 = 0u;
    long long v68 = 0u;
    long long v69 = 0u;
    id v23 = v65;
    uint64_t v24 = [v23 countByEnumeratingWithState:&v68 objects:v76 count:16];
    if (v24)
    {
      uint64_t v25 = v24;
      uint64_t v26 = *(void *)v69;
      do
      {
        for (uint64_t j = 0; j != v25; ++j)
        {
          if (*(void *)v69 != v26) {
            objc_enumerationMutation(v23);
          }
          v28 = *(void **)(*((void *)&v68 + 1) + 8 * j);
          v29 = [v23 objectForKey:v28];
          if ([v29 count])
          {
            v30 = [v28 bundleIdentifier];
            v31 = v30;
            if (!v30 || [v30 isEqualToString:v67])
            {
              v32 = [v28 name];
              int v33 = [v7 matchesWithKey:v32];

              if (v33)
              {
                v34 = [v66 objectForKeyedSubscript:v28];

                if (!v34)
                {
                  v35 = objc_opt_new();
                  [v66 setObject:v35 forKeyedSubscript:v28];
                }
                v36 = [v66 objectForKeyedSubscript:v28];
                [v36 addObjectsFromArray:v29];
              }
            }
          }
        }
        uint64_t v25 = [v23 countByEnumeratingWithState:&v68 objects:v76 count:16];
      }
      while (v25);
    }

    v37 = (void *)[v66 copy];
    id v5 = v63;
    id v4 = v64;
    uint64_t v6 = v65;
    uint64_t v8 = v67;
  }
  else
  {
    v38 = [IAMTriggerKey alloc];
    v39 = [v7 name];
    v40 = [(IAMTriggerKey *)v38 initWithName:v39 bundleIdentifier:v8];

    v41 = [IAMTriggerKey alloc];
    v42 = [v7 name];
    v43 = [(IAMTriggerKey *)v41 initWithName:v42 bundleIdentifier:0];

    v44 = [v5 objectForKeyedSubscript:v40];

    if (v44)
    {
      v45 = objc_opt_new();
      [v66 setObject:v45 forKeyedSubscript:v40];

      v46 = [v66 objectForKeyedSubscript:v40];
      v47 = [v5 objectForKeyedSubscript:v40];
      [v46 addObjectsFromArray:v47];
    }
    v48 = [v5 objectForKeyedSubscript:v43];

    if (v48)
    {
      v49 = objc_opt_new();
      [v66 setObject:v49 forKeyedSubscript:v43];

      v50 = [v66 objectForKeyedSubscript:v43];
      v51 = [v5 objectForKeyedSubscript:v43];
      [v50 addObjectsFromArray:v51];
    }
    v52 = [v6 objectForKeyedSubscript:v40];

    if (v52)
    {
      v53 = [v66 objectForKeyedSubscript:v40];

      if (!v53)
      {
        v54 = objc_opt_new();
        [v66 setObject:v54 forKeyedSubscript:v40];
      }
      v55 = [v66 objectForKeyedSubscript:v40];
      v56 = [v6 objectForKeyedSubscript:v40];
      [v55 addObjectsFromArray:v56];
    }
    v57 = [v6 objectForKeyedSubscript:v43];

    if (v57)
    {
      v58 = [v66 objectForKeyedSubscript:v43];

      if (!v58)
      {
        v59 = objc_opt_new();
        [v66 setObject:v59 forKeyedSubscript:v43];
      }
      v60 = [v66 objectForKeyedSubscript:v43];
      v61 = [v6 objectForKeyedSubscript:v43];
      [v60 addObjectsFromArray:v61];
    }
    v37 = (void *)[v66 copy];
  }

  return v37;
}

+ (id)uniqueMessageEntriesInMessageEntriesByTrigger:(id)a3
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  id v3 = a3;
  id v4 = objc_opt_new();
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v5 = v3;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v14;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v14 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = objc_msgSend(v5, "objectForKeyedSubscript:", *(void *)(*((void *)&v13 + 1) + 8 * i), (void)v13);
        [v4 unionSet:v10];
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v7);
  }

  uint64_t v11 = [v4 allObjects];

  return v11;
}

- (id)messageEntriesForTargetIdentifier:(id)a3
{
  return [(NSDictionary *)self->_messageEntriesByTargetIdentifier objectForKeyedSubscript:a3];
}

+ (id)messageEntries:(id)a3 withSatisfiedPresentationTriggerForTriggerContext:(id)a4
{
  uint64_t v45 = *MEMORY[0x263EF8340];
  id v5 = a3;
  id v6 = a4;
  uint64_t v7 = objc_opt_new();
  uint64_t v8 = v7;
  if (v5)
  {
    long long v41 = 0u;
    long long v42 = 0u;
    long long v39 = 0u;
    long long v40 = 0u;
    id v30 = v5;
    id v9 = v5;
    uint64_t v34 = [v9 countByEnumeratingWithState:&v39 objects:v44 count:16];
    if (!v34) {
      goto LABEL_33;
    }
    id v32 = v9;
    uint64_t v33 = *(void *)v40;
    v31 = v8;
    while (1)
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v40 != v33) {
          objc_enumerationMutation(v9);
        }
        uint64_t v11 = *(void **)(*((void *)&v39 + 1) + 8 * v10);
        uint64_t v12 = [v11 applicationMessage];
        long long v13 = [v12 presentationTriggers];
        long long v14 = [v12 rule];
        uint64_t v15 = [v13 count];
        if (v14)
        {
          long long v16 = [v14 triggerEventName];
          BOOL v17 = v16 != 0;
        }
        else
        {
          BOOL v17 = 0;
        }
        if (v15) {
          BOOL v18 = 0;
        }
        else {
          BOOL v18 = !v17;
        }
        if (v18)
        {
LABEL_26:
          [v8 addObject:v11];
          goto LABEL_27;
        }
        if (!v6) {
          goto LABEL_27;
        }
        if (v15)
        {
          long long v37 = 0u;
          long long v38 = 0u;
          long long v35 = 0u;
          long long v36 = 0u;
          id v19 = v13;
          uint64_t v20 = [v19 countByEnumeratingWithState:&v35 objects:v43 count:16];
          if (v20)
          {
            uint64_t v21 = v20;
            uint64_t v22 = *(void *)v36;
            while (2)
            {
              for (uint64_t i = 0; i != v21; ++i)
              {
                if (*(void *)v36 != v22) {
                  objc_enumerationMutation(v19);
                }
                if ([v6 satisfiesPresentationTrigger:*(void *)(*((void *)&v35 + 1) + 8 * i)])
                {

                  uint64_t v8 = v31;
                  id v9 = v32;
                  goto LABEL_26;
                }
              }
              uint64_t v21 = [v19 countByEnumeratingWithState:&v35 objects:v43 count:16];
              uint64_t v8 = v31;
              if (v21) {
                continue;
              }
              break;
            }
          }

          id v9 = v32;
        }
        else
        {
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            uint64_t v24 = [v6 event];
            uint64_t v25 = [v14 triggerEventName];
            char v26 = [v24 matchesWithKey:v25];

            id v9 = v32;
            if (v26) {
              goto LABEL_26;
            }
          }
        }
LABEL_27:

        ++v10;
      }
      while (v10 != v34);
      uint64_t v27 = [v9 countByEnumeratingWithState:&v39 objects:v44 count:16];
      uint64_t v34 = v27;
      if (!v27)
      {
LABEL_33:

        v28 = (void *)[v8 copy];
        id v5 = v30;
        goto LABEL_35;
      }
    }
  }
  v28 = (void *)[v7 copy];
LABEL_35:

  return v28;
}

- (id)messageEntriesForContextPropertiesContext:(id)a3
{
  uint64_t v35 = *MEMORY[0x263EF8340];
  id v4 = a3;
  v28 = objc_opt_new();
  id v5 = (void *)[(NSDictionary *)self->_messageEntriesByContextPropertyTriggers copy];
  id v6 = (void *)[(NSDictionary *)self->_messageEntriesByUnknownKindTriggers copy];
  uint64_t v7 = [v4 contextPropertyNames];
  char v26 = v4;
  v29 = [v4 bundleIdentifier];
  long long v30 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  obuint64_t j = v7;
  uint64_t v8 = [obj countByEnumeratingWithState:&v30 objects:v34 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v31;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v31 != v10) {
          objc_enumerationMutation(obj);
        }
        uint64_t v12 = *(void *)(*((void *)&v30 + 1) + 8 * i);
        long long v13 = [[IAMTriggerKey alloc] initWithName:v12 bundleIdentifier:v29];
        long long v14 = [[IAMTriggerKey alloc] initWithName:v12 bundleIdentifier:0];
        uint64_t v15 = objc_opt_new();
        long long v16 = [v5 objectForKeyedSubscript:v13];

        if (v16)
        {
          BOOL v17 = [v5 objectForKeyedSubscript:v13];
          [v15 addObjectsFromArray:v17];
        }
        BOOL v18 = [v5 objectForKeyedSubscript:v14];

        if (v18)
        {
          id v19 = [v5 objectForKeyedSubscript:v14];
          [v15 addObjectsFromArray:v19];
        }
        uint64_t v20 = [v6 objectForKeyedSubscript:v13];

        if (v20)
        {
          uint64_t v21 = [v6 objectForKeyedSubscript:v13];
          [v15 addObjectsFromArray:v21];
        }
        uint64_t v22 = [v6 objectForKeyedSubscript:v14];

        if (v22)
        {
          id v23 = [v6 objectForKeyedSubscript:v14];
          [v15 addObjectsFromArray:v23];
        }
        if ([v15 count]) {
          [v28 addObjectsFromArray:v15];
        }
      }
      uint64_t v9 = [obj countByEnumeratingWithState:&v30 objects:v34 count:16];
    }
    while (v9);
  }

  uint64_t v24 = [v28 allObjects];

  return v24;
}

- (void)setMessageEntries:(id)a3
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = (NSArray *)[v4 copy];
  messageEntries = self->_messageEntries;
  self->_messageEntries = v5;

  uint64_t v7 = objc_opt_new();
  if (v4)
  {
    long long v20 = 0u;
    long long v21 = 0u;
    long long v18 = 0u;
    long long v19 = 0u;
    id v8 = v4;
    uint64_t v9 = [v8 countByEnumeratingWithState:&v18 objects:v22 count:16];
    if (v9)
    {
      uint64_t v10 = v9;
      uint64_t v11 = *(void *)v19;
      do
      {
        for (uint64_t i = 0; i != v10; ++i)
        {
          if (*(void *)v19 != v11) {
            objc_enumerationMutation(v8);
          }
          long long v13 = *(void **)(*((void *)&v18 + 1) + 8 * i);
          long long v14 = objc_msgSend(v13, "applicationMessage", (void)v18);
          uint64_t v15 = [v14 identifier];

          [v7 setObject:v13 forKeyedSubscript:v15];
        }
        uint64_t v10 = [v8 countByEnumeratingWithState:&v18 objects:v22 count:16];
      }
      while (v10);
    }
  }
  long long v16 = (NSDictionary *)objc_msgSend(v7, "copy", (void)v18);
  messageEntryByIdentifier = self->_messageEntryByIdentifier;
  self->_messageEntryByIdentifier = v16;

  [(IAMMessageEntryManager *)self _updateMessageIndexes];
}

- (void)_updateMessageIndexes
{
  v65 = self;
  uint64_t v115 = *MEMORY[0x263EF8340];
  uint64_t v101 = 0;
  v102 = &v101;
  uint64_t v103 = 0x3032000000;
  v104 = __Block_byref_object_copy_;
  v105 = __Block_byref_object_dispose_;
  id v106 = (id)objc_opt_new();
  uint64_t v95 = 0;
  v96 = &v95;
  uint64_t v97 = 0x3032000000;
  v98 = __Block_byref_object_copy_;
  v99 = __Block_byref_object_dispose_;
  id v100 = (id)objc_opt_new();
  uint64_t v89 = 0;
  v90 = &v89;
  uint64_t v91 = 0x3032000000;
  v92 = __Block_byref_object_copy_;
  v93 = __Block_byref_object_dispose_;
  id v94 = (id)objc_opt_new();
  v2 = objc_opt_new();
  v88[0] = MEMORY[0x263EF8330];
  v88[1] = 3221225472;
  v88[2] = __47__IAMMessageEntryManager__updateMessageIndexes__block_invoke;
  v88[3] = &unk_264341CD0;
  v88[4] = &v89;
  v88[5] = &v101;
  v88[6] = &v95;
  long long v73 = (void (**)(void, void, void, void, void, void))MEMORY[0x21D475810](v88);
  long long v68 = objc_opt_new();
  long long v71 = objc_opt_new();
  id v3 = (void *)[(NSDictionary *)v65->_messageEntryByIdentifier copy];
  long long v86 = 0u;
  long long v87 = 0u;
  long long v84 = 0u;
  long long v85 = 0u;
  obuint64_t j = v3;
  uint64_t v67 = [obj countByEnumeratingWithState:&v84 objects:v114 count:16];
  if (v67)
  {
    uint64_t v66 = *(void *)v85;
    do
    {
      for (uint64_t i = 0; i != v67; ++i)
      {
        if (*(void *)v85 != v66) {
          objc_enumerationMutation(obj);
        }
        id v4 = objc_msgSend(obj, "objectForKey:", *(void *)(*((void *)&v84 + 1) + 8 * i), v65);
        id v5 = [v4 applicationMessage];
        id v6 = [v5 targets];
        long long v74 = v5;
        if ([v5 messageType] == 1)
        {
          modalTargetIdentifier = v65->_modalTargetIdentifier;
          uint64_t v7 = [MEMORY[0x263EFF8C0] arrayWithObjects:&modalTargetIdentifier count:1];

          id v8 = (void *)[v7 mutableCopy];
          [v74 setTargets:v8];

          if (v7) {
            goto LABEL_10;
          }
        }
        else
        {
          uint64_t v7 = v6;
          if (v6)
          {
LABEL_10:
            if ([v7 count]) {
              goto LABEL_14;
            }
          }
        }
        uint64_t v9 = IAMLogCategoryDefault();
        if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
        {
          uint64_t v10 = [v74 identifier];
          *(_DWORD *)buf = 138543362;
          v108 = v10;
          _os_log_impl(&dword_2188AF000, v9, OS_LOG_TYPE_ERROR, "Error indexing message, message specifies no targets = %{public}@", buf, 0xCu);
        }
LABEL_14:
        long long v82 = 0u;
        long long v83 = 0u;
        long long v80 = 0u;
        long long v81 = 0u;
        id v75 = v7;
        uint64_t v11 = [v75 countByEnumeratingWithState:&v80 objects:v112 count:16];
        if (v11)
        {
          uint64_t v12 = *(void *)v81;
          do
          {
            for (uint64_t j = 0; j != v11; ++j)
            {
              if (*(void *)v81 != v12) {
                objc_enumerationMutation(v75);
              }
              uint64_t v14 = *(void *)(*((void *)&v80 + 1) + 8 * j);
              uint64_t v15 = [v2 objectForKeyedSubscript:v14];
              long long v16 = (void *)v15;
              BOOL v17 = (void *)MEMORY[0x263EFFA68];
              if (v15) {
                BOOL v17 = (void *)v15;
              }
              id v18 = v17;

              if (([v18 containsObject:v4] & 1) == 0)
              {
                long long v19 = [v18 arrayByAddingObject:v4];
                [v2 setObject:v19 forKeyedSubscript:v14];
              }
            }
            uint64_t v11 = [v75 countByEnumeratingWithState:&v80 objects:v112 count:16];
          }
          while (v11);
        }

        long long v20 = [v74 presentationTriggers];
        long long v21 = (void *)[v20 copy];

        uint64_t v70 = [v21 count];
        long long v78 = 0u;
        long long v79 = 0u;
        long long v76 = 0u;
        long long v77 = 0u;
        id v22 = v21;
        uint64_t v23 = [v22 countByEnumeratingWithState:&v76 objects:v111 count:16];
        if (v23)
        {
          uint64_t v24 = *(void *)v77;
          do
          {
            for (uint64_t k = 0; k != v23; ++k)
            {
              if (*(void *)v77 != v24) {
                objc_enumerationMutation(v22);
              }
              char v26 = *(void **)(*((void *)&v76 + 1) + 8 * k);
              if ([v26 hasTriggerName])
              {
                if ([v26 hasKind])
                {
                  uint64_t v27 = [v26 triggerName];
                  uint64_t v28 = [v26 hasKind];
                  uint64_t v29 = [v26 kind];
                  long long v30 = [v26 bundleIdentifier];
                  ((void (**)(void, void *, NSObject *, uint64_t, uint64_t, void *))v73)[2](v73, v4, v27, v28, v29, v30);
                }
                else
                {
                  uint64_t v27 = IAMLogCategoryDefault();
                  if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
                  {
                    long long v32 = [v26 triggerName];
                    long long v33 = [v74 identifier];
                    *(_DWORD *)buf = 138543618;
                    v108 = v32;
                    __int16 v109 = 2114;
                    v110 = v33;
                    _os_log_impl(&dword_2188AF000, v27, OS_LOG_TYPE_ERROR, "Error indexing message, message presentation trigger = %{public}@ missing kind = %{public}@", buf, 0x16u);
                  }
                }
              }
              else
              {
                uint64_t v27 = IAMLogCategoryDefault();
                if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
                {
                  long long v31 = [v74 identifier];
                  *(_DWORD *)buf = 138543362;
                  v108 = v31;
                  _os_log_impl(&dword_2188AF000, v27, OS_LOG_TYPE_ERROR, "Error indexing message, message presentation trigger missing triggerName = %{public}@", buf, 0xCu);
                }
              }
            }
            uint64_t v23 = [v22 countByEnumeratingWithState:&v76 objects:v111 count:16];
          }
          while (v23);
        }

        uint64_t v34 = [v74 rule];
        uint64_t v35 = v34;
        if (v34)
        {
          if (!v70)
          {
            long long v36 = [v34 triggerEventName];
            BOOL v37 = v36 == 0;

            if (!v37)
            {
              long long v38 = [v74 rule];
              long long v39 = [v38 triggerEventName];

              long long v40 = [[IAMTriggerKey alloc] initWithName:v39 bundleIdentifier:0];
              +[IAMMessageEntryManager _addMessageEntry:v4 toTriggerKeyDictionary:v102[5] atKey:v40];
            }
          }
          [v68 addObject:v35];
          [v71 addObject:v4];
        }
      }
      uint64_t v67 = [obj countByEnumeratingWithState:&v84 objects:v114 count:16];
    }
    while (v67);
  }

  while (objc_msgSend(v68, "count", v65))
  {
    long long v41 = [v68 lastObject];
    long long v42 = [v71 lastObject];
    [v68 removeLastObject];
    [v71 removeLastObject];
    v43 = [v41 triggerEventName];
    if (v43)
    {
      v44 = [v41 triggerCondition];
      if (v44)
      {
      }
      else
      {
        uint64_t v45 = [v41 subrules];
        BOOL v46 = v45 == 0;

        if (v46) {
          goto LABEL_57;
        }
      }
    }
    int v47 = [v41 type];
    if (v47 == 1)
    {
      v53 = [v41 subrules];
      [v68 addObjectsFromArray:v53];

      for (unint64_t m = 0; ; ++m)
      {
        v55 = [v41 subrules];
        BOOL v56 = [v55 count] > m;

        if (!v56) {
          break;
        }
        [v71 addObject:v42];
      }
    }
    else if (!v47)
    {
      v48 = [v41 triggerCondition];
      v49 = [v48 identifier];
      if (v49)
      {
        uint64_t v50 = [v48 hasKind];
        uint64_t v51 = [v48 kind];
        v52 = [v48 bundleIdentifier];
        ((void (**)(void, void *, void *, uint64_t, uint64_t, void *))v73)[2](v73, v42, v49, v50, v51, v52);
      }
    }
LABEL_57:
  }
  uint64_t v57 = [(id)v102[5] copy];
  messageEntriesByEventTriggers = v65->_messageEntriesByEventTriggers;
  v65->_messageEntriesByEventTriggers = (NSDictionary *)v57;

  uint64_t v59 = [(id)v96[5] copy];
  messageEntriesByContextPropertyTriggers = v65->_messageEntriesByContextPropertyTriggers;
  v65->_messageEntriesByContextPropertyTriggers = (NSDictionary *)v59;

  uint64_t v61 = [(id)v90[5] copy];
  messageEntriesByUnknownKindTriggers = v65->_messageEntriesByUnknownKindTriggers;
  v65->_messageEntriesByUnknownKindTriggers = (NSDictionary *)v61;

  uint64_t v63 = [v2 copy];
  messageEntriesByTargetIdentifier = v65->_messageEntriesByTargetIdentifier;
  v65->_messageEntriesByTargetIdentifier = (NSDictionary *)v63;

  _Block_object_dispose(&v89, 8);
  _Block_object_dispose(&v95, 8);

  _Block_object_dispose(&v101, 8);
}

- (id)messageEntryForIdentifier:(id)a3
{
  return [(NSDictionary *)self->_messageEntryByIdentifier objectForKeyedSubscript:a3];
}

- (id)priorityMessageEntryForIdentifier:(id)a3
{
  return [(NSDictionary *)self->_priorityMessageEntryByIdentifier objectForKeyedSubscript:a3];
}

- (void)addPriorityMessageEntry:(id)a3
{
  priorityMessageEntryByIdentifier = self->_priorityMessageEntryByIdentifier;
  id v5 = a3;
  id v10 = (id)[(NSDictionary *)priorityMessageEntryByIdentifier mutableCopy];
  id v6 = [v5 applicationMessage];
  uint64_t v7 = [v6 identifier];
  [v10 setObject:v5 forKeyedSubscript:v7];

  id v8 = (NSDictionary *)[v10 copy];
  uint64_t v9 = self->_priorityMessageEntryByIdentifier;
  self->_priorityMessageEntryByIdentifier = v8;
}

+ (void)_addMessageEntry:(id)a3 toTriggerKeyDictionary:(id)a4 atKey:(id)a5
{
  id v14 = a3;
  id v7 = a4;
  id v8 = a5;
  uint64_t v9 = [v7 objectForKeyedSubscript:v8];
  id v10 = (void *)v9;
  uint64_t v11 = (void *)MEMORY[0x263EFFA68];
  if (v9) {
    uint64_t v11 = (void *)v9;
  }
  id v12 = v11;

  if (([v12 containsObject:v14] & 1) == 0)
  {
    long long v13 = [v12 arrayByAddingObject:v14];
    [v7 setObject:v13 forKeyedSubscript:v8];
  }
}

void __47__IAMMessageEntryManager__updateMessageIndexes__block_invoke(void *a1, void *a2, void *a3, char a4, int a5, void *a6)
{
  id v15 = a2;
  id v11 = a6;
  id v12 = a3;
  long long v13 = [[IAMTriggerKey alloc] initWithName:v12 bundleIdentifier:v11];

  if (a4)
  {
    if (a5 == 1)
    {
      uint64_t v14 = a1[6];
    }
    else
    {
      if (a5) {
        goto LABEL_8;
      }
      uint64_t v14 = a1[5];
    }
  }
  else
  {
    uint64_t v14 = a1[4];
  }
  +[IAMMessageEntryManager _addMessageEntry:v15 toTriggerKeyDictionary:*(void *)(*(void *)(v14 + 8) + 40) atKey:v13];
LABEL_8:
}

- (NSArray)messageEntries
{
  return self->_messageEntries;
}

- (NSString)modalTargetIdentifier
{
  return self->_modalTargetIdentifier;
}

- (void)setModalTargetIdentifier:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_modalTargetIdentifier, 0);
  objc_storeStrong((id *)&self->_messageEntries, 0);
  objc_storeStrong((id *)&self->_messageEntriesByTargetIdentifier, 0);
  objc_storeStrong((id *)&self->_messageEntriesByUnknownKindTriggers, 0);
  objc_storeStrong((id *)&self->_messageEntriesByContextPropertyTriggers, 0);
  objc_storeStrong((id *)&self->_messageEntriesByEventTriggers, 0);
  objc_storeStrong((id *)&self->_priorityMessageEntryByIdentifier, 0);

  objc_storeStrong((id *)&self->_messageEntryByIdentifier, 0);
}

@end