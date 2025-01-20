@interface CHContactProvider
- (CHContactDataSource)dataSource;
- (CHContactProvider)initWithDataSource:(id)a3;
- (id)contactsByHandleForCalls:(id)a3 keyDescriptors:(id)a4 error:(id *)a5;
- (id)contactsByHandleForHandles:(id)a3 keyDescriptors:(id)a4 error:(id *)a5;
@end

@implementation CHContactProvider

- (CHContactProvider)initWithDataSource:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)CHContactProvider;
  v6 = [(CHContactProvider *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_dataSource, a3);
  }

  return v7;
}

- (id)contactsByHandleForCalls:(id)a3 keyDescriptors:(id)a4 error:(id *)a5
{
  v23 = self;
  v24 = a5;
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  id v8 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
  long long v29 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  id v9 = v6;
  uint64_t v10 = [v9 countByEnumeratingWithState:&v29 objects:v34 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v30;
    do
    {
      for (uint64_t i = 0; i != v11; ++i)
      {
        if (*(void *)v30 != v12) {
          objc_enumerationMutation(v9);
        }
        v14 = *(void **)(*((void *)&v29 + 1) + 8 * i);
        long long v25 = 0u;
        long long v26 = 0u;
        long long v27 = 0u;
        long long v28 = 0u;
        v15 = objc_msgSend(v14, "remoteParticipantHandles", v23, v24, 0);
        uint64_t v16 = [v15 countByEnumeratingWithState:&v25 objects:v33 count:16];
        if (v16)
        {
          uint64_t v17 = v16;
          uint64_t v18 = *(void *)v26;
          do
          {
            for (uint64_t j = 0; j != v17; ++j)
            {
              if (*(void *)v26 != v18) {
                objc_enumerationMutation(v15);
              }
              [v8 addObject:*(void *)(*((void *)&v25 + 1) + 8 * j)];
            }
            uint64_t v17 = [v15 countByEnumeratingWithState:&v25 objects:v33 count:16];
          }
          while (v17);
        }
      }
      uint64_t v11 = [v9 countByEnumeratingWithState:&v29 objects:v34 count:16];
    }
    while (v11);
  }

  v20 = [v8 allObjects];
  v21 = [(CHContactProvider *)v23 contactsByHandleForHandles:v20 keyDescriptors:v7 error:v24];

  return v21;
}

- (id)contactsByHandleForHandles:(id)a3 keyDescriptors:(id)a4 error:(id *)a5
{
  uint64_t v56 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v35 = a4;
  id v40 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  long long v49 = 0u;
  long long v50 = 0u;
  long long v51 = 0u;
  long long v52 = 0u;
  obuint64_t j = v8;
  uint64_t v9 = [obj countByEnumeratingWithState:&v49 objects:v55 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v50;
    do
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v50 != v11) {
          objc_enumerationMutation(obj);
        }
        v13 = *(void **)(*((void *)&v49 + 1) + 8 * i);
        v14 = [v13 normalizedValue];
        if (![v14 length])
        {
          uint64_t v15 = [v13 value];

          v14 = (void *)v15;
        }
        if ([v14 length])
        {
          uint64_t v16 = [v40 objectForKeyedSubscript:v14];
          if (v16)
          {
            uint64_t v17 = v16;
            [v16 addObject:v13];
          }
          else
          {
            uint64_t v17 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithObjects:", v13, 0);
            [v40 setObject:v17 forKeyedSubscript:v14];
          }
        }
      }
      uint64_t v10 = [obj countByEnumeratingWithState:&v49 objects:v55 count:16];
    }
    while (v10);
  }

  uint64_t v18 = [(CHContactProvider *)self dataSource];
  v19 = v40;
  v20 = [v40 allKeys];
  v21 = [v18 contactsByContactHandleForContactHandles:v20 keyDescriptors:v35 error:a5];

  if (v21)
  {
    id v22 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
    long long v45 = 0u;
    long long v46 = 0u;
    long long v47 = 0u;
    long long v48 = 0u;
    id v36 = [v21 allKeys];
    uint64_t v39 = [v36 countByEnumeratingWithState:&v45 objects:v54 count:16];
    if (v39)
    {
      uint64_t v38 = *(void *)v46;
      do
      {
        for (uint64_t j = 0; j != v39; ++j)
        {
          if (*(void *)v46 != v38) {
            objc_enumerationMutation(v36);
          }
          uint64_t v24 = *(void *)(*((void *)&v45 + 1) + 8 * j);
          long long v25 = [v19 objectForKeyedSubscript:v24];
          long long v26 = v25;
          if (v25)
          {
            long long v43 = 0u;
            long long v44 = 0u;
            long long v41 = 0u;
            long long v42 = 0u;
            uint64_t v27 = [v25 countByEnumeratingWithState:&v41 objects:v53 count:16];
            if (v27)
            {
              uint64_t v28 = v27;
              uint64_t v29 = *(void *)v42;
              do
              {
                for (uint64_t k = 0; k != v28; ++k)
                {
                  if (*(void *)v42 != v29) {
                    objc_enumerationMutation(v26);
                  }
                  uint64_t v31 = *(void *)(*((void *)&v41 + 1) + 8 * k);
                  long long v32 = [v21 objectForKeyedSubscript:v24];
                  [v22 setObject:v32 forKeyedSubscript:v31];
                }
                uint64_t v28 = [v26 countByEnumeratingWithState:&v41 objects:v53 count:16];
              }
              while (v28);
            }
          }

          v19 = v40;
        }
        uint64_t v39 = [v36 countByEnumeratingWithState:&v45 objects:v54 count:16];
      }
      while (v39);
    }
  }
  else
  {
    id v22 = 0;
  }
  v33 = (void *)[v22 copy];

  return v33;
}

- (CHContactDataSource)dataSource
{
  return self->_dataSource;
}

- (void).cxx_destruct
{
}

@end