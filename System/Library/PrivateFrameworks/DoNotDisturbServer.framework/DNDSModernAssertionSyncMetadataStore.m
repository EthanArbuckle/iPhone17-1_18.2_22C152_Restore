@interface DNDSModernAssertionSyncMetadataStore
+ (id)newWithDictionaryRepresentation:(id)a3 context:(id)a4;
- (BOOL)isEqual:(id)a3;
- (DNDSModernAssertionSyncMetadataStore)init;
- (NSMutableDictionary)lastReceivedStoreDate;
- (NSMutableDictionary)lastSentStoreDate;
- (NSMutableDictionary)pendingLastSentStoreDate;
- (NSString)description;
- (id)_initWithLastReceivedStoreDate:(id)a3 lastSentStoreDate:(id)a4 pendingLastSentStoreDate:(id)a5;
- (id)_initWithStore:(id)a3;
- (id)dictionaryRepresentationWithContext:(id)a3;
- (unint64_t)hash;
@end

@implementation DNDSModernAssertionSyncMetadataStore

- (DNDSModernAssertionSyncMetadataStore)init
{
  return (DNDSModernAssertionSyncMetadataStore *)[(DNDSModernAssertionSyncMetadataStore *)self _initWithStore:0];
}

- (id)_initWithStore:(id)a3
{
  id v4 = a3;
  v19.receiver = self;
  v19.super_class = (Class)DNDSModernAssertionSyncMetadataStore;
  v5 = [(DNDSModernAssertionSyncMetadataStore *)&v19 init];
  if (v5)
  {
    v6 = [v4 lastReceivedStoreDate];
    v7 = v6;
    if (v6)
    {
      v8 = v6;
    }
    else
    {
      v8 = [MEMORY[0x1E4F1CA60] dictionary];
    }
    lastReceivedStoreDate = v5->_lastReceivedStoreDate;
    v5->_lastReceivedStoreDate = v8;

    v10 = [v4 lastSentStoreDate];
    v11 = v10;
    if (v10)
    {
      v12 = v10;
    }
    else
    {
      v12 = [MEMORY[0x1E4F1CA60] dictionary];
    }
    lastSentStoreDate = v5->_lastSentStoreDate;
    v5->_lastSentStoreDate = v12;

    v14 = [v4 pendingLastSentStoreDate];
    v15 = v14;
    if (v14)
    {
      v16 = v14;
    }
    else
    {
      v16 = [MEMORY[0x1E4F1CA60] dictionary];
    }
    pendingLastSentStoreDate = v5->_pendingLastSentStoreDate;
    v5->_pendingLastSentStoreDate = v16;
  }
  return v5;
}

- (id)_initWithLastReceivedStoreDate:(id)a3 lastSentStoreDate:(id)a4 pendingLastSentStoreDate:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v19.receiver = self;
  v19.super_class = (Class)DNDSModernAssertionSyncMetadataStore;
  v11 = [(DNDSModernAssertionSyncMetadataStore *)&v19 init];
  if (v11)
  {
    uint64_t v12 = [v8 mutableCopy];
    lastReceivedStoreDate = v11->_lastReceivedStoreDate;
    v11->_lastReceivedStoreDate = (NSMutableDictionary *)v12;

    uint64_t v14 = [v9 mutableCopy];
    lastSentStoreDate = v11->_lastSentStoreDate;
    v11->_lastSentStoreDate = (NSMutableDictionary *)v14;

    uint64_t v16 = [v10 mutableCopy];
    pendingLastSentStoreDate = v11->_pendingLastSentStoreDate;
    v11->_pendingLastSentStoreDate = (NSMutableDictionary *)v16;
  }
  return v11;
}

- (unint64_t)hash
{
  v3 = [(DNDSModernAssertionSyncMetadataStore *)self lastReceivedStoreDate];
  uint64_t v4 = [v3 hash];
  v5 = [(DNDSModernAssertionSyncMetadataStore *)self lastSentStoreDate];
  uint64_t v6 = [v5 hash] ^ v4;
  v7 = [(DNDSModernAssertionSyncMetadataStore *)self pendingLastSentStoreDate];
  unint64_t v8 = v6 ^ [v7 hash];

  return v8;
}

- (BOOL)isEqual:(id)a3
{
  v5 = (DNDSModernAssertionSyncMetadataStore *)a3;
  if (self == v5)
  {
    char v13 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      uint64_t v6 = v5;
      v7 = [(DNDSModernAssertionSyncMetadataStore *)self lastReceivedStoreDate];
      unint64_t v8 = [(DNDSModernAssertionSyncMetadataStore *)v6 lastReceivedStoreDate];
      if (v7 != v8)
      {
        uint64_t v9 = [(DNDSModernAssertionSyncMetadataStore *)self lastReceivedStoreDate];
        if (!v9)
        {
          char v13 = 0;
          goto LABEL_37;
        }
        id v10 = (void *)v9;
        v11 = [(DNDSModernAssertionSyncMetadataStore *)v6 lastReceivedStoreDate];
        if (!v11)
        {
          char v13 = 0;
LABEL_36:

          goto LABEL_37;
        }
        uint64_t v12 = [(DNDSModernAssertionSyncMetadataStore *)self lastReceivedStoreDate];
        v3 = [(DNDSModernAssertionSyncMetadataStore *)v6 lastReceivedStoreDate];
        if (![v12 isEqual:v3])
        {
          char v13 = 0;
LABEL_35:

          goto LABEL_36;
        }
        v36 = v3;
        v37 = v12;
        v38 = v11;
        v39 = v10;
      }
      uint64_t v14 = [(DNDSModernAssertionSyncMetadataStore *)self lastSentStoreDate];
      v15 = [(DNDSModernAssertionSyncMetadataStore *)v6 lastSentStoreDate];
      if (v14 != v15)
      {
        uint64_t v16 = [(DNDSModernAssertionSyncMetadataStore *)self lastSentStoreDate];
        if (v16)
        {
          v17 = (void *)v16;
          v18 = [(DNDSModernAssertionSyncMetadataStore *)v6 lastSentStoreDate];
          if (v18)
          {
            v35 = v14;
            objc_super v19 = [(DNDSModernAssertionSyncMetadataStore *)self lastSentStoreDate];
            v3 = [(DNDSModernAssertionSyncMetadataStore *)v6 lastSentStoreDate];
            if ([v19 isEqual:v3])
            {
              v31 = v19;
              v32 = v18;
              v33 = v17;
LABEL_17:
              v20 = [(DNDSModernAssertionSyncMetadataStore *)self pendingLastSentStoreDate];
              uint64_t v21 = [(DNDSModernAssertionSyncMetadataStore *)v6 pendingLastSentStoreDate];
              if (v20 == (void *)v21)
              {

                char v13 = 1;
                v27 = v35;
              }
              else
              {
                v22 = (void *)v21;
                v34 = v3;
                uint64_t v23 = [(DNDSModernAssertionSyncMetadataStore *)self pendingLastSentStoreDate];
                if (v23)
                {
                  v24 = (void *)v23;
                  v25 = [(DNDSModernAssertionSyncMetadataStore *)v6 pendingLastSentStoreDate];
                  if (v25)
                  {
                    v30 = v25;
                    v29 = [(DNDSModernAssertionSyncMetadataStore *)self pendingLastSentStoreDate];
                    v26 = [(DNDSModernAssertionSyncMetadataStore *)v6 pendingLastSentStoreDate];
                    char v13 = [v29 isEqual:v26];

                    v25 = v30;
                  }
                  else
                  {
                    char v13 = 0;
                  }
                }
                else
                {

                  char v13 = 0;
                }
                v3 = v34;
                v27 = v35;
              }
              if (v27 != v15)
              {
              }
LABEL_34:
              v11 = v38;
              id v10 = v39;
              v3 = v36;
              uint64_t v12 = v37;
              if (v7 != v8) {
                goto LABEL_35;
              }
LABEL_37:

              goto LABEL_38;
            }

            uint64_t v14 = v35;
          }
        }
        char v13 = 0;
        goto LABEL_34;
      }
      v35 = v14;
      goto LABEL_17;
    }
    char v13 = 0;
  }
LABEL_38:

  return v13;
}

- (NSString)description
{
  v3 = NSString;
  uint64_t v4 = objc_opt_class();
  v5 = [(DNDSModernAssertionSyncMetadataStore *)self lastReceivedStoreDate];
  uint64_t v6 = [(DNDSModernAssertionSyncMetadataStore *)self lastSentStoreDate];
  v7 = [(DNDSModernAssertionSyncMetadataStore *)self pendingLastSentStoreDate];
  objc_msgSend(v3, "stringWithFormat:", @"<%@: %p; lastReceivedStoreDate: %@; lastSentStoreDate: %@; pendingLastSentStoreDate: %@>",
    v4,
    self,
    v5,
    v6,
  unint64_t v8 = v7);

  return (NSString *)v8;
}

+ (id)newWithDictionaryRepresentation:(id)a3 context:(id)a4
{
  uint64_t v64 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = objc_msgSend(v4, "bs_safeObjectForKey:ofType:", @"lastReceivedStoreDate", objc_opt_class());
  uint64_t v6 = objc_msgSend(MEMORY[0x1E4F1CA60], "dictionaryWithCapacity:", objc_msgSend(v5, "count"));
  long long v57 = 0u;
  long long v58 = 0u;
  long long v59 = 0u;
  long long v60 = 0u;
  obuint64_t j = v5;
  uint64_t v7 = [obj countByEnumeratingWithState:&v57 objects:v63 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v58;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v58 != v9) {
          objc_enumerationMutation(obj);
        }
        uint64_t v11 = *(void *)(*((void *)&v57 + 1) + 8 * i);
        uint64_t v12 = (void *)MEMORY[0x1E4F1C9C8];
        char v13 = [obj objectForKeyedSubscript:v11];
        [v13 doubleValue];
        uint64_t v14 = objc_msgSend(v12, "dateWithTimeIntervalSinceReferenceDate:");
        [v6 setObject:v14 forKeyedSubscript:v11];
      }
      uint64_t v8 = [obj countByEnumeratingWithState:&v57 objects:v63 count:16];
    }
    while (v8);
  }
  v44 = v6;

  v15 = objc_msgSend(v4, "bs_safeObjectForKey:ofType:", @"lastSentStoreDate", objc_opt_class());
  uint64_t v16 = objc_msgSend(MEMORY[0x1E4F1CA60], "dictionaryWithCapacity:", objc_msgSend(v15, "count"));
  long long v53 = 0u;
  long long v54 = 0u;
  long long v55 = 0u;
  long long v56 = 0u;
  id v47 = v15;
  uint64_t v17 = [v47 countByEnumeratingWithState:&v53 objects:v62 count:16];
  if (v17)
  {
    uint64_t v18 = v17;
    uint64_t v19 = *(void *)v54;
    do
    {
      for (uint64_t j = 0; j != v18; ++j)
      {
        if (*(void *)v54 != v19) {
          objc_enumerationMutation(v47);
        }
        uint64_t v21 = *(void *)(*((void *)&v53 + 1) + 8 * j);
        v22 = (void *)MEMORY[0x1E4F1C9C8];
        uint64_t v23 = [v47 objectForKeyedSubscript:v21];
        [v23 doubleValue];
        v24 = objc_msgSend(v22, "dateWithTimeIntervalSinceReferenceDate:");
        [v16 setObject:v24 forKeyedSubscript:v21];
      }
      uint64_t v18 = [v47 countByEnumeratingWithState:&v53 objects:v62 count:16];
    }
    while (v18);
  }
  v43 = v16;

  v46 = v4;
  v25 = objc_msgSend(v4, "bs_safeObjectForKey:ofType:", @"pendingLastSentStoreDate", objc_opt_class());
  v26 = objc_msgSend(MEMORY[0x1E4F1CA60], "dictionaryWithCapacity:", objc_msgSend(v25, "count"));
  long long v49 = 0u;
  long long v50 = 0u;
  long long v51 = 0u;
  long long v52 = 0u;
  id v27 = v25;
  uint64_t v28 = [v27 countByEnumeratingWithState:&v49 objects:v61 count:16];
  if (v28)
  {
    uint64_t v29 = v28;
    uint64_t v30 = *(void *)v50;
    do
    {
      for (uint64_t k = 0; k != v29; ++k)
      {
        if (*(void *)v50 != v30) {
          objc_enumerationMutation(v27);
        }
        uint64_t v32 = *(void *)(*((void *)&v49 + 1) + 8 * k);
        v33 = objc_msgSend(v27, "objectForKeyedSubscript:", v32, v43);
        v34 = (void *)MEMORY[0x1E4F1C9C8];
        v35 = [v33 objectForKeyedSubscript:@"lastUpdateDate"];
        [v35 doubleValue];
        v36 = objc_msgSend(v34, "dateWithTimeIntervalSinceReferenceDate:");

        v37 = (void *)MEMORY[0x1E4F1CAD0];
        v38 = [v33 objectForKeyedSubscript:@"deviceIdentifiers"];
        v39 = [v37 setWithArray:v38];

        v40 = [[_DNDSPendingMessageRecipients alloc] initWithLastUpdateDate:v36 deviceIdentifiers:v39];
        [v26 setObject:v40 forKeyedSubscript:v32];
      }
      uint64_t v29 = [v27 countByEnumeratingWithState:&v49 objects:v61 count:16];
    }
    while (v29);
  }

  v41 = (void *)[objc_alloc((Class)a1) _initWithLastReceivedStoreDate:v44 lastSentStoreDate:v43 pendingLastSentStoreDate:v26];
  return v41;
}

- (id)dictionaryRepresentationWithContext:(id)a3
{
  uint64_t v64 = *MEMORY[0x1E4F143B8];
  id v4 = objc_msgSend(MEMORY[0x1E4F1CA60], "dictionary", a3);
  v5 = objc_msgSend(MEMORY[0x1E4F1CA60], "dictionaryWithCapacity:", -[NSMutableDictionary count](self->_lastReceivedStoreDate, "count"));
  long long v55 = 0u;
  long long v56 = 0u;
  long long v57 = 0u;
  long long v58 = 0u;
  v46 = self;
  uint64_t v6 = self->_lastReceivedStoreDate;
  uint64_t v7 = [(NSMutableDictionary *)v6 countByEnumeratingWithState:&v55 objects:v63 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v56;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v56 != v9) {
          objc_enumerationMutation(v6);
        }
        uint64_t v11 = *(void *)(*((void *)&v55 + 1) + 8 * i);
        uint64_t v12 = NSNumber;
        char v13 = [(NSMutableDictionary *)v46->_lastReceivedStoreDate objectForKeyedSubscript:v11];
        [v13 timeIntervalSinceReferenceDate];
        uint64_t v14 = objc_msgSend(v12, "numberWithDouble:");
        [v5 setObject:v14 forKeyedSubscript:v11];
      }
      uint64_t v8 = [(NSMutableDictionary *)v6 countByEnumeratingWithState:&v55 objects:v63 count:16];
    }
    while (v8);
  }

  v42 = v5;
  v15 = (void *)[v5 copy];
  [v4 setObject:v15 forKeyedSubscript:@"lastReceivedStoreDate"];

  uint64_t v16 = objc_msgSend(MEMORY[0x1E4F1CA60], "dictionaryWithCapacity:", -[NSMutableDictionary count](v46->_lastSentStoreDate, "count"));
  long long v51 = 0u;
  long long v52 = 0u;
  long long v53 = 0u;
  long long v54 = 0u;
  uint64_t v17 = v46->_lastSentStoreDate;
  uint64_t v18 = [(NSMutableDictionary *)v17 countByEnumeratingWithState:&v51 objects:v62 count:16];
  if (v18)
  {
    uint64_t v19 = v18;
    uint64_t v20 = *(void *)v52;
    do
    {
      for (uint64_t j = 0; j != v19; ++j)
      {
        if (*(void *)v52 != v20) {
          objc_enumerationMutation(v17);
        }
        uint64_t v22 = *(void *)(*((void *)&v51 + 1) + 8 * j);
        uint64_t v23 = NSNumber;
        v24 = [(NSMutableDictionary *)v46->_lastSentStoreDate objectForKeyedSubscript:v22];
        [v24 timeIntervalSinceReferenceDate];
        v25 = objc_msgSend(v23, "numberWithDouble:");
        [v16 setObject:v25 forKeyedSubscript:v22];
      }
      uint64_t v19 = [(NSMutableDictionary *)v17 countByEnumeratingWithState:&v51 objects:v62 count:16];
    }
    while (v19);
  }

  v41 = v16;
  v26 = (void *)[v16 copy];
  v43 = v4;
  [v4 setObject:v26 forKeyedSubscript:@"lastSentStoreDate"];

  v45 = objc_msgSend(MEMORY[0x1E4F1CA60], "dictionaryWithCapacity:", -[NSMutableDictionary count](v46->_pendingLastSentStoreDate, "count"));
  long long v47 = 0u;
  long long v48 = 0u;
  long long v49 = 0u;
  long long v50 = 0u;
  obuint64_t j = v46->_pendingLastSentStoreDate;
  uint64_t v27 = [(NSMutableDictionary *)obj countByEnumeratingWithState:&v47 objects:v61 count:16];
  if (v27)
  {
    uint64_t v28 = v27;
    uint64_t v29 = *(void *)v48;
    do
    {
      for (uint64_t k = 0; k != v28; ++k)
      {
        if (*(void *)v48 != v29) {
          objc_enumerationMutation(obj);
        }
        uint64_t v31 = *(void *)(*((void *)&v47 + 1) + 8 * k);
        uint64_t v32 = [(NSMutableDictionary *)v46->_pendingLastSentStoreDate objectForKeyedSubscript:v31];
        v59[0] = @"lastUpdateDate";
        v33 = NSNumber;
        v34 = [v32 lastUpdateDate];
        [v34 timeIntervalSinceReferenceDate];
        v35 = objc_msgSend(v33, "numberWithDouble:");
        v59[1] = @"deviceIdentifiers";
        v60[0] = v35;
        v36 = [v32 deviceIdentifiers];
        v37 = [v36 allObjects];
        v60[1] = v37;
        v38 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v60 forKeys:v59 count:2];
        [v45 setObject:v38 forKeyedSubscript:v31];
      }
      uint64_t v28 = [(NSMutableDictionary *)obj countByEnumeratingWithState:&v47 objects:v61 count:16];
    }
    while (v28);
  }

  v39 = (void *)[v45 copy];
  [v43 setObject:v39 forKeyedSubscript:@"pendingLastSentStoreDate"];

  return v43;
}

- (NSMutableDictionary)lastReceivedStoreDate
{
  return self->_lastReceivedStoreDate;
}

- (NSMutableDictionary)lastSentStoreDate
{
  return self->_lastSentStoreDate;
}

- (NSMutableDictionary)pendingLastSentStoreDate
{
  return self->_pendingLastSentStoreDate;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pendingLastSentStoreDate, 0);
  objc_storeStrong((id *)&self->_lastSentStoreDate, 0);
  objc_storeStrong((id *)&self->_lastReceivedStoreDate, 0);
}

@end