@interface _DKTombstonePolicy
+ (id)defaultPolicy;
- (NSArray)propertiesToFetchForTombstones;
- (NSArray)requirements;
- (NSPredicate)predicateForEventsRequiredToBeTombstoned;
- (_DKTombstonePolicy)init;
- (_DKTombstonePolicy)initWithRequirements:(id)a3;
- (id)tombstonesForEvents:(id)a3 resultingFromRequirementsWithIdentifiers:(id *)a4;
- (id)tombstonesForPartialEvents:(id)a3 resultingFromRequirementsWithIdentifiers:(id *)a4;
- (void)eventPredicateForEventsRequiredToBeTombstoned;
@end

@implementation _DKTombstonePolicy

+ (id)defaultPolicy
{
  v11[5] = *MEMORY[0x1E4F143B8];
  id v2 = objc_alloc((Class)objc_opt_class());
  v3 = +[_DKTombstoneRequirement requirement];
  v4 = +[_DKTombstoneRequirement requirement];
  v11[1] = v4;
  v5 = +[_DKTombstoneRequirement requirement];
  v11[2] = v5;
  v6 = +[_DKTombstoneRequirement requirement];
  v11[3] = v6;
  v7 = +[_DKTombstoneRequirement requirement];
  v11[4] = v7;
  v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:v11 count:5];
  v9 = (void *)[v2 initWithRequirements:v8];

  return v9;
}

- (_DKTombstonePolicy)initWithRequirements:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)_DKTombstonePolicy;
  v6 = [(_DKTombstonePolicy *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_requirements, a3);
  }

  return v7;
}

- (NSArray)propertiesToFetchForTombstones
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  propertiesToFetchForTombstones = self->_propertiesToFetchForTombstones;
  if (!propertiesToFetchForTombstones)
  {
    v4 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithObjects:", @"objectID", @"uuid", @"streamName", 0);
    long long v19 = 0u;
    long long v20 = 0u;
    long long v21 = 0u;
    long long v22 = 0u;
    id v5 = [(_DKTombstonePolicy *)self requirements];
    uint64_t v6 = [v5 countByEnumeratingWithState:&v19 objects:v23 count:16];
    if (v6)
    {
      uint64_t v7 = v6;
      uint64_t v8 = *(void *)v20;
      do
      {
        for (uint64_t i = 0; i != v7; ++i)
        {
          if (*(void *)v20 != v8) {
            objc_enumerationMutation(v5);
          }
          v10 = *(void **)(*((void *)&v19 + 1) + 8 * i);
          uint64_t v11 = [v10 propertiesToFetch];
          if (v11)
          {
            v12 = (void *)v11;
            v13 = [v10 propertiesToFetch];
            uint64_t v14 = [v13 count];

            if (v14)
            {
              v15 = [v10 propertiesToFetch];
              [v4 addObjectsFromArray:v15];
            }
          }
        }
        uint64_t v7 = [v5 countByEnumeratingWithState:&v19 objects:v23 count:16];
      }
      while (v7);
    }

    v16 = (NSArray *)[v4 copy];
    v17 = self->_propertiesToFetchForTombstones;
    self->_propertiesToFetchForTombstones = v16;

    propertiesToFetchForTombstones = self->_propertiesToFetchForTombstones;
  }
  return propertiesToFetchForTombstones;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_eventPredicateForEventsRequiredToBeTombstoned, 0);
  objc_storeStrong((id *)&self->_propertiesToFetchForTombstones, 0);
  objc_storeStrong((id *)&self->_predicateForEventsRequiredToBeTombstoned, 0);
  objc_storeStrong((id *)&self->_requirements, 0);
}

- (_DKTombstonePolicy)init
{
  return [(_DKTombstonePolicy *)self initWithRequirements:MEMORY[0x1E4F1CBF0]];
}

- (NSPredicate)predicateForEventsRequiredToBeTombstoned
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  predicateForEventsRequiredToBeTombstoned = self->_predicateForEventsRequiredToBeTombstoned;
  if (!predicateForEventsRequiredToBeTombstoned)
  {
    id v4 = objc_alloc(MEMORY[0x1E4F1CA48]);
    id v5 = [MEMORY[0x1E4F28F60] predicateWithValue:0];
    uint64_t v6 = objc_msgSend(v4, "initWithObjects:", v5, 0);

    long long v20 = 0u;
    long long v21 = 0u;
    long long v18 = 0u;
    long long v19 = 0u;
    uint64_t v7 = [(_DKTombstonePolicy *)self requirements];
    uint64_t v8 = [v7 countByEnumeratingWithState:&v18 objects:v22 count:16];
    if (v8)
    {
      uint64_t v9 = v8;
      uint64_t v10 = *(void *)v19;
      do
      {
        for (uint64_t i = 0; i != v9; ++i)
        {
          if (*(void *)v19 != v10) {
            objc_enumerationMutation(v7);
          }
          v12 = *(void **)(*((void *)&v18 + 1) + 8 * i);
          v13 = [v12 predicate];

          if (v13)
          {
            uint64_t v14 = [v12 predicate];
            [v6 addObject:v14];
          }
        }
        uint64_t v9 = [v7 countByEnumeratingWithState:&v18 objects:v22 count:16];
      }
      while (v9);
    }

    v15 = [MEMORY[0x1E4F28BA0] orPredicateWithSubpredicates:v6];
    v16 = self->_predicateForEventsRequiredToBeTombstoned;
    self->_predicateForEventsRequiredToBeTombstoned = v15;

    predicateForEventsRequiredToBeTombstoned = self->_predicateForEventsRequiredToBeTombstoned;
  }
  return predicateForEventsRequiredToBeTombstoned;
}

- (void)eventPredicateForEventsRequiredToBeTombstoned
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  if (a1)
  {
    v1 = a1;
    id v2 = (void *)a1[4];
    if (!v2)
    {
      id v3 = objc_alloc(MEMORY[0x1E4F1CA48]);
      id v4 = [MEMORY[0x1E4F28F60] predicateWithValue:0];
      id v5 = objc_msgSend(v3, "initWithObjects:", v4, 0);

      long long v18 = 0u;
      long long v19 = 0u;
      long long v16 = 0u;
      long long v17 = 0u;
      uint64_t v6 = [v1 requirements];
      uint64_t v7 = [v6 countByEnumeratingWithState:&v16 objects:v20 count:16];
      if (v7)
      {
        uint64_t v8 = v7;
        uint64_t v9 = *(void *)v17;
        do
        {
          for (uint64_t i = 0; i != v8; ++i)
          {
            if (*(void *)v17 != v9) {
              objc_enumerationMutation(v6);
            }
            uint64_t v11 = *(void **)(*((void *)&v16 + 1) + 8 * i);
            v12 = [v11 eventPredicate];
            if (!v12)
            {
              v12 = [v11 predicate];
              if (!v12) {
                continue;
              }
            }
            [v5 addObject:v12];
          }
          uint64_t v8 = [v6 countByEnumeratingWithState:&v16 objects:v20 count:16];
        }
        while (v8);
      }

      uint64_t v13 = [MEMORY[0x1E4F28BA0] orPredicateWithSubpredicates:v5];
      uint64_t v14 = (void *)v1[4];
      v1[4] = v13;

      id v2 = (void *)v1[4];
    }
    a1 = v2;
  }
  return a1;
}

- (id)tombstonesForEvents:(id)a3 resultingFromRequirementsWithIdentifiers:(id *)a4
{
  uint64_t v60 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  v37 = a4;
  if (a4) {
    id v6 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
  }
  else {
    id v6 = 0;
  }
  v43 = [MEMORY[0x1E4F1C9C8] date];
  id v40 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  uint64_t v7 = -[_DKTombstonePolicy eventPredicateForEventsRequiredToBeTombstoned](self);
  v38 = v5;
  uint64_t v8 = [v5 filteredArrayUsingPredicate:v7];

  long long v54 = 0u;
  long long v55 = 0u;
  long long v52 = 0u;
  long long v53 = 0u;
  id obj = v8;
  uint64_t v9 = [obj countByEnumeratingWithState:&v52 objects:v59 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v53;
    uint64_t v39 = *(void *)v53;
    do
    {
      uint64_t v12 = 0;
      uint64_t v42 = v10;
      do
      {
        if (*(void *)v53 != v11) {
          objc_enumerationMutation(obj);
        }
        uint64_t v13 = *(void **)(*((void *)&v52 + 1) + 8 * v12);
        uint64_t v14 = [v13 UUID];
        v15 = [v13 stream];
        long long v16 = [v15 name];

        if (v16) {
          BOOL v17 = v14 == 0;
        }
        else {
          BOOL v17 = 1;
        }
        if (!v17)
        {
          long long v18 = +[_DKSystemEventStreams tombstoneStream];
          v47 = v14;
          long long v19 = +[_DKUUIDIdentifier withUUID:v14];
          long long v20 = +[_DKTombstoneMetadataKey eventStreamName];
          v57 = v20;
          v58 = v16;
          v46 = v16;
          uint64_t v21 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v58 forKeys:&v57 count:1];
          long long v22 = +[_DKEvent eventWithStream:v18 startDate:v43 endDate:v43 value:v19 metadata:v21];

          if (v22)
          {
            uint64_t v45 = v12;
            long long v50 = 0u;
            long long v51 = 0u;
            long long v48 = 0u;
            long long v49 = 0u;
            uint64_t v23 = [(_DKTombstonePolicy *)self requirements];
            uint64_t v24 = [v23 countByEnumeratingWithState:&v48 objects:v56 count:16];
            if (v24)
            {
              uint64_t v25 = v24;
              uint64_t v26 = *(void *)v49;
              do
              {
                for (uint64_t i = 0; i != v25; ++i)
                {
                  if (*(void *)v49 != v26) {
                    objc_enumerationMutation(v23);
                  }
                  v28 = *(void **)(*((void *)&v48 + 1) + 8 * i);
                  v29 = [v28 eventPredicate];
                  v30 = v29;
                  if (v29)
                  {
                    id v31 = v29;
                  }
                  else
                  {
                    id v31 = [v28 predicate];
                  }
                  v32 = v31;

                  if ([v32 evaluateWithObject:v13])
                  {
                    [v28 assignPropertiesToTombstone:v22 extractedFromEvent:v13];
                    if (v6)
                    {
                      v33 = [v28 identifier];

                      if (v33)
                      {
                        v34 = [v28 identifier];
                        [v6 addObject:v34];
                      }
                    }
                  }
                }
                uint64_t v25 = [v23 countByEnumeratingWithState:&v48 objects:v56 count:16];
              }
              while (v25);
            }

            [v40 addObject:v22];
            uint64_t v10 = v42;
            uint64_t v11 = v39;
            uint64_t v12 = v45;
          }

          long long v16 = v46;
          uint64_t v14 = v47;
        }

        ++v12;
      }
      while (v12 != v10);
      uint64_t v10 = [obj countByEnumeratingWithState:&v52 objects:v59 count:16];
    }
    while (v10);
  }

  if (v37) {
    id *v37 = (id)[v6 copy];
  }
  v35 = (void *)[v40 copy];

  return v35;
}

- (id)tombstonesForPartialEvents:(id)a3 resultingFromRequirementsWithIdentifiers:(id *)a4
{
  uint64_t v61 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if (a4) {
    id v6 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
  }
  else {
    id v6 = 0;
  }
  uint64_t v42 = objc_msgSend(MEMORY[0x1E4F1C9C8], "date", a4);
  id v40 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  uint64_t v7 = [(_DKTombstonePolicy *)self predicateForEventsRequiredToBeTombstoned];
  v38 = v5;
  uint64_t v8 = [v5 filteredArrayUsingPredicate:v7];

  long long v55 = 0u;
  long long v56 = 0u;
  long long v53 = 0u;
  long long v54 = 0u;
  id obj = v8;
  uint64_t v9 = [obj countByEnumeratingWithState:&v53 objects:v60 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v54;
    uint64_t v39 = *(void *)v54;
    do
    {
      uint64_t v12 = 0;
      uint64_t v43 = v10;
      do
      {
        if (*(void *)v54 != v11) {
          objc_enumerationMutation(obj);
        }
        uint64_t v13 = *(void **)(*((void *)&v53 + 1) + 8 * v12);
        uint64_t v14 = [v13 objectForKeyedSubscript:@"streamName"];
        uint64_t v15 = [v13 objectForKeyedSubscript:@"uuid"];
        long long v16 = (void *)v15;
        if (v14) {
          BOOL v17 = v15 == 0;
        }
        else {
          BOOL v17 = 1;
        }
        if (!v17)
        {
          uint64_t v48 = v12;
          v46 = (void *)v15;
          uint64_t v18 = [objc_alloc(MEMORY[0x1E4F29128]) initWithUUIDString:v15];
          +[_DKSystemEventStreams tombstoneStream];
          v20 = long long v19 = v14;
          uint64_t v45 = (void *)v18;
          uint64_t v21 = +[_DKUUIDIdentifier withUUID:v18];
          long long v22 = +[_DKTombstoneMetadataKey eventStreamName];
          v58 = v22;
          v59 = v19;
          v47 = v19;
          uint64_t v23 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v59 forKeys:&v58 count:1];
          uint64_t v24 = +[_DKEvent eventWithStream:v20 startDate:v42 endDate:v42 value:v21 metadata:v23];

          if (v24)
          {
            long long v51 = 0u;
            long long v52 = 0u;
            long long v49 = 0u;
            long long v50 = 0u;
            uint64_t v25 = [(_DKTombstonePolicy *)self requirements];
            uint64_t v26 = [v25 countByEnumeratingWithState:&v49 objects:v57 count:16];
            if (v26)
            {
              uint64_t v27 = v26;
              uint64_t v28 = *(void *)v50;
              do
              {
                for (uint64_t i = 0; i != v27; ++i)
                {
                  if (*(void *)v50 != v28) {
                    objc_enumerationMutation(v25);
                  }
                  v30 = *(void **)(*((void *)&v49 + 1) + 8 * i);
                  id v31 = [v30 predicate];
                  int v32 = [v31 evaluateWithObject:v13];

                  if (v32)
                  {
                    [v30 assignPropertiesToTombstone:v24 extractedFromPartialEvent:v13];
                    if (v6)
                    {
                      v33 = [v30 identifier];

                      if (v33)
                      {
                        v34 = [v30 identifier];
                        [v6 addObject:v34];
                      }
                    }
                  }
                }
                uint64_t v27 = [v25 countByEnumeratingWithState:&v49 objects:v57 count:16];
              }
              while (v27);
            }

            [v40 addObject:v24];
            uint64_t v11 = v39;
          }

          uint64_t v10 = v43;
          uint64_t v14 = v47;
          uint64_t v12 = v48;
          long long v16 = v46;
        }

        ++v12;
      }
      while (v12 != v10);
      uint64_t v10 = [obj countByEnumeratingWithState:&v53 objects:v60 count:16];
    }
    while (v10);
  }

  if (v37) {
    void *v37 = (id)[v6 copy];
  }
  v35 = (void *)[v40 copy];

  return v35;
}

- (NSArray)requirements
{
  return self->_requirements;
}

@end