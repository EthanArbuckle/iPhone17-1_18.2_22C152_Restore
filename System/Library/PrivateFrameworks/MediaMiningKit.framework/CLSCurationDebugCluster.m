@interface CLSCurationDebugCluster
- (CLSCurationDebugCluster)initWithDebugItems:(id)a3 reason:(id)a4;
- (NSSet)unclusteredDebugItems;
- (NSString)reason;
- (id)allDebugItems;
- (id)dictionaryRepresentation;
- (id)timestamp;
- (void)addDebugClusters:(id)a3;
- (void)resetWithReason:(id)a3 agent:(id)a4 stage:(id)a5;
- (void)setDebugClusters:(id)a3;
- (void)setUnclusteredDebugItems:(id)a3;
@end

@implementation CLSCurationDebugCluster

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_reason, 0);
  objc_storeStrong((id *)&self->_unclusteredDebugItems, 0);
  objc_storeStrong((id *)&self->_debugClusters, 0);
}

- (NSString)reason
{
  return (NSString *)objc_getProperty(self, a2, 56, 1);
}

- (void)setUnclusteredDebugItems:(id)a3
{
}

- (NSSet)unclusteredDebugItems
{
  return self->_unclusteredDebugItems;
}

- (id)timestamp
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  v3 = self->_unclusteredDebugItems;
  uint64_t v4 = [(NSSet *)v3 countByEnumeratingWithState:&v25 objects:v30 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    v6 = 0;
    uint64_t v7 = *(void *)v26;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v26 != v7) {
          objc_enumerationMutation(v3);
        }
        uint64_t v9 = [*(id *)(*((void *)&v25 + 1) + 8 * i) timestamp];
        v10 = (void *)v9;
        if (v6)
        {
          uint64_t v11 = [v6 earlierDate:v9];

          v6 = (void *)v11;
        }
        else
        {
          v6 = (void *)v9;
        }
      }
      uint64_t v5 = [(NSSet *)v3 countByEnumeratingWithState:&v25 objects:v30 count:16];
    }
    while (v5);
  }
  else
  {
    v6 = 0;
  }

  long long v23 = 0u;
  long long v24 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  v12 = self->_debugClusters;
  uint64_t v13 = [(NSSet *)v12 countByEnumeratingWithState:&v21 objects:v29 count:16];
  if (v13)
  {
    uint64_t v14 = v13;
    uint64_t v15 = *(void *)v22;
    do
    {
      for (uint64_t j = 0; j != v14; ++j)
      {
        if (*(void *)v22 != v15) {
          objc_enumerationMutation(v12);
        }
        uint64_t v17 = objc_msgSend(*(id *)(*((void *)&v21 + 1) + 8 * j), "timestamp", (void)v21);
        v18 = (void *)v17;
        if (v6)
        {
          uint64_t v19 = [v6 earlierDate:v17];

          v6 = (void *)v19;
        }
        else
        {
          v6 = (void *)v17;
        }
      }
      uint64_t v14 = [(NSSet *)v12 countByEnumeratingWithState:&v21 objects:v29 count:16];
    }
    while (v14);
  }

  return v6;
}

- (id)dictionaryRepresentation
{
  uint64_t v61 = *MEMORY[0x1E4F143B8];
  v52.receiver = self;
  v52.super_class = (Class)CLSCurationDebugCluster;
  v3 = [(CLSCurationDebugObject *)&v52 dictionaryRepresentation];
  uint64_t v4 = (void *)[v3 mutableCopy];

  uint64_t v5 = (void *)MEMORY[0x1E4F28ED0];
  v6 = [(CLSCurationDebugCluster *)self allDebugItems];
  uint64_t v7 = objc_msgSend(v5, "numberWithUnsignedInteger:", objc_msgSend(v6, "count"));
  v39 = v4;
  [v4 setObject:v7 forKeyedSubscript:@"totalNumberOfItems"];

  id v8 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  long long v48 = 0u;
  long long v49 = 0u;
  long long v50 = 0u;
  long long v51 = 0u;
  uint64_t v9 = self->_unclusteredDebugItems;
  uint64_t v10 = [(NSSet *)v9 countByEnumeratingWithState:&v48 objects:v60 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v49;
    do
    {
      for (uint64_t i = 0; i != v11; ++i)
      {
        if (*(void *)v49 != v12) {
          objc_enumerationMutation(v9);
        }
        [v8 addObject:*(void *)(*((void *)&v48 + 1) + 8 * i)];
      }
      uint64_t v11 = [(NSSet *)v9 countByEnumeratingWithState:&v48 objects:v60 count:16];
    }
    while (v11);
  }

  long long v46 = 0u;
  long long v47 = 0u;
  long long v44 = 0u;
  long long v45 = 0u;
  uint64_t v14 = self->_debugClusters;
  uint64_t v15 = [(NSSet *)v14 countByEnumeratingWithState:&v44 objects:v59 count:16];
  if (v15)
  {
    uint64_t v16 = v15;
    uint64_t v17 = *(void *)v45;
    do
    {
      for (uint64_t j = 0; j != v16; ++j)
      {
        if (*(void *)v45 != v17) {
          objc_enumerationMutation(v14);
        }
        [v8 addObject:*(void *)(*((void *)&v44 + 1) + 8 * j)];
      }
      uint64_t v16 = [(NSSet *)v14 countByEnumeratingWithState:&v44 objects:v59 count:16];
    }
    while (v16);
  }

  id v19 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  id v20 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  long long v21 = [MEMORY[0x1E4F29008] sortDescriptorWithKey:@"timestamp" ascending:1];
  v58 = v21;
  long long v22 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v58 count:1];
  [v8 sortUsingDescriptors:v22];

  long long v42 = 0u;
  long long v43 = 0u;
  long long v40 = 0u;
  long long v41 = 0u;
  id v23 = v8;
  uint64_t v24 = [v23 countByEnumeratingWithState:&v40 objects:v57 count:16];
  if (v24)
  {
    uint64_t v25 = v24;
    uint64_t v26 = *(void *)v41;
    do
    {
      for (uint64_t k = 0; k != v25; ++k)
      {
        if (*(void *)v41 != v26) {
          objc_enumerationMutation(v23);
        }
        long long v28 = *(void **)(*((void *)&v40 + 1) + 8 * k);
        objc_opt_class();
        char isKindOfClass = objc_opt_isKindOfClass();
        id v30 = v28;
        uint64_t v31 = v30;
        if (isKindOfClass)
        {
          if ([v20 count])
          {
            v55[0] = @"itemIdentifiers";
            v55[1] = @"totalNumberOfItems";
            v56[0] = v20;
            v32 = objc_msgSend(MEMORY[0x1E4F28ED0], "numberWithUnsignedInteger:", objc_msgSend(v20, "count"));
            v56[1] = v32;
            v33 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v56 forKeys:v55 count:2];
            [v19 addObject:v33];

            id v34 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
            id v20 = v34;
          }
          v35 = [v31 dictionaryRepresentation];
          [v19 addObject:v35];
        }
        else
        {
          v36 = [v30 item];
          v35 = [v36 clsIdentifier];
          [v20 addObject:v35];

          uint64_t v31 = v36;
        }
      }
      uint64_t v25 = [v23 countByEnumeratingWithState:&v40 objects:v57 count:16];
    }
    while (v25);
  }

  if ([v20 count])
  {
    v53 = @"itemIdentifiers";
    id v54 = v20;
    v37 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v54 forKeys:&v53 count:1];
    [v19 addObject:v37];
  }
  [v39 setObject:v19 forKeyedSubscript:@"sortedObjects"];

  return v39;
}

- (void)resetWithReason:(id)a3 agent:(id)a4 stage:(id)a5
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v23.receiver = self;
  v23.super_class = (Class)CLSCurationDebugCluster;
  [(CLSCurationDebugObject *)&v23 resetWithReason:v8 agent:v9 stage:v10];
  uint64_t v11 = [(CLSCurationDebugCluster *)self allDebugItems];
  unclusteredDebugItems = self->_unclusteredDebugItems;
  self->_unclusteredDebugItems = v11;

  long long v21 = 0u;
  long long v22 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  uint64_t v13 = self->_unclusteredDebugItems;
  uint64_t v14 = [(NSSet *)v13 countByEnumeratingWithState:&v19 objects:v24 count:16];
  if (v14)
  {
    uint64_t v15 = v14;
    uint64_t v16 = *(void *)v20;
    do
    {
      uint64_t v17 = 0;
      do
      {
        if (*(void *)v20 != v16) {
          objc_enumerationMutation(v13);
        }
        objc_msgSend(*(id *)(*((void *)&v19 + 1) + 8 * v17++), "resetWithReason:agent:stage:", v8, v9, v10, (void)v19);
      }
      while (v15 != v17);
      uint64_t v15 = [(NSSet *)v13 countByEnumeratingWithState:&v19 objects:v24 count:16];
    }
    while (v15);
  }

  debugClusters = self->_debugClusters;
  self->_debugClusters = 0;
}

- (void)addDebugClusters:(id)a3
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  debugClusters = self->_debugClusters;
  if (debugClusters) {
    id v6 = (id)[(NSSet *)debugClusters mutableCopy];
  }
  else {
    id v6 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
  }
  uint64_t v7 = v6;
  [v6 unionSet:v4];
  objc_storeStrong((id *)&self->_debugClusters, v7);
  id v8 = (NSSet *)[(NSSet *)self->_unclusteredDebugItems mutableCopy];
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id v9 = v4;
  uint64_t v10 = [v9 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v17;
    do
    {
      for (uint64_t i = 0; i != v11; ++i)
      {
        if (*(void *)v17 != v12) {
          objc_enumerationMutation(v9);
        }
        uint64_t v14 = objc_msgSend(*(id *)(*((void *)&v16 + 1) + 8 * i), "allDebugItems", (void)v16);
        [(NSSet *)v8 minusSet:v14];
      }
      uint64_t v11 = [v9 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v11);
  }

  unclusteredDebugItems = self->_unclusteredDebugItems;
  self->_unclusteredDebugItems = v8;
}

- (void)setDebugClusters:(id)a3
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = v4;
  if (self->_debugClusters)
  {
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D2150000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "Clusters already set.", buf, 2u);
    }
  }
  else
  {
    id v6 = (NSSet *)[v4 copy];
    debugClusters = self->_debugClusters;
    self->_debugClusters = v6;

    id v8 = (NSSet *)[(NSSet *)self->_unclusteredDebugItems mutableCopy];
    long long v16 = 0u;
    long long v17 = 0u;
    long long v18 = 0u;
    long long v19 = 0u;
    id v9 = v5;
    uint64_t v10 = [v9 countByEnumeratingWithState:&v16 objects:v21 count:16];
    if (v10)
    {
      uint64_t v11 = v10;
      uint64_t v12 = *(void *)v17;
      do
      {
        uint64_t v13 = 0;
        do
        {
          if (*(void *)v17 != v12) {
            objc_enumerationMutation(v9);
          }
          uint64_t v14 = objc_msgSend(*(id *)(*((void *)&v16 + 1) + 8 * v13), "allDebugItems", (void)v16);
          [(NSSet *)v8 minusSet:v14];

          ++v13;
        }
        while (v11 != v13);
        uint64_t v11 = [v9 countByEnumeratingWithState:&v16 objects:v21 count:16];
      }
      while (v11);
    }

    unclusteredDebugItems = self->_unclusteredDebugItems;
    self->_unclusteredDebugItems = v8;
  }
}

- (id)allDebugItems
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  debugClusters = self->_debugClusters;
  if (debugClusters && [(NSSet *)debugClusters count])
  {
    id v4 = (NSSet *)[(NSSet *)self->_unclusteredDebugItems mutableCopy];
    long long v12 = 0u;
    long long v13 = 0u;
    long long v14 = 0u;
    long long v15 = 0u;
    uint64_t v5 = self->_debugClusters;
    uint64_t v6 = [(NSSet *)v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
    if (v6)
    {
      uint64_t v7 = v6;
      uint64_t v8 = *(void *)v13;
      do
      {
        for (uint64_t i = 0; i != v7; ++i)
        {
          if (*(void *)v13 != v8) {
            objc_enumerationMutation(v5);
          }
          uint64_t v10 = objc_msgSend(*(id *)(*((void *)&v12 + 1) + 8 * i), "allDebugItems", (void)v12);
          [(NSSet *)v4 unionSet:v10];
        }
        uint64_t v7 = [(NSSet *)v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
      }
      while (v7);
    }
  }
  else
  {
    id v4 = self->_unclusteredDebugItems;
  }
  return v4;
}

- (CLSCurationDebugCluster)initWithDebugItems:(id)a3 reason:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v12.receiver = self;
  v12.super_class = (Class)CLSCurationDebugCluster;
  uint64_t v8 = [(CLSCurationDebugObject *)&v12 init];
  if (v8)
  {
    uint64_t v9 = [v6 copy];
    unclusteredDebugItems = v8->_unclusteredDebugItems;
    v8->_unclusteredDebugItems = (NSSet *)v9;

    objc_storeStrong((id *)&v8->_reason, a4);
  }

  return v8;
}

@end