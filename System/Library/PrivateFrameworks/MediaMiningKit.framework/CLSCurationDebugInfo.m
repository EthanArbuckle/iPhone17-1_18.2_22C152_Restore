@interface CLSCurationDebugInfo
- (CLSCurationDebugInfo)initWithDebugCluster:(id)a3;
- (CLSCurationDebugInfo)initWithItems:(id)a3;
- (NSString)agent;
- (NSString)stage;
- (id)debugClusterForCluster:(id)a3;
- (id)debugInfoForCluster:(id)a3;
- (id)debugItemForItem:(id)a3;
- (id)debugItemsForItems:(id)a3;
- (id)dictionaryRepresentationWithAppendExtraItemInfoBlock:(id)a3;
- (void)_dedupItems:(id)a3 toItems:(id)a4 chosenState:(unint64_t)a5 withDedupingType:(unint64_t)a6;
- (void)addClusters:(id)a3 withReason:(id)a4;
- (void)beginTentativeSection;
- (void)chooseItem:(id)a3 inCluster:(id)a4 withReason:(id)a5;
- (void)chooseItem:(id)a3 inItems:(id)a4 withReason:(id)a5;
- (void)chooseItems:(id)a3 inCluster:(id)a4 withReason:(id)a5;
- (void)chooseItems:(id)a3 inItems:(id)a4 withReason:(id)a5;
- (void)dedupItems:(id)a3 toItem:(id)a4 withDedupingType:(unint64_t)a5;
- (void)dedupItems:(id)a3 toItems:(id)a4 withDedupingType:(unint64_t)a5;
- (void)dedupItems:(id)a3 toRequiredItems:(id)a4 withDedupingType:(unint64_t)a5;
- (void)endTentativeSectionWithSuccess:(BOOL)a3;
- (void)forceState:(unint64_t)a3 ofItem:(id)a4 withReason:(id)a5;
- (void)requireItems:(id)a3 inCluster:(id)a4;
- (void)requireItems:(id)a3 inItems:(id)a4;
- (void)resetWithReason:(id)a3;
- (void)setAgent:(id)a3;
- (void)setClusters:(id)a3 withReason:(id)a4;
- (void)setStage:(id)a3;
- (void)setState:(unint64_t)a3 ofCluster:(id)a4 withReason:(id)a5;
- (void)setState:(unint64_t)a3 ofItem:(id)a4 withReason:(id)a5;
- (void)setState:(unint64_t)a3 ofItems:(id)a4 withReason:(id)a5;
- (void)setUnclusteredItemsState:(unint64_t)a3 withReason:(id)a4;
@end

@implementation CLSCurationDebugInfo

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_stage, 0);
  objc_storeStrong((id *)&self->_agent, 0);
  objc_storeStrong((id *)&self->_debugClusterByCluster, 0);
  objc_storeStrong((id *)&self->_debugItemByItem, 0);
  objc_storeStrong((id *)&self->_rootCluster, 0);
}

- (void)setStage:(id)a3
{
}

- (NSString)stage
{
  return self->_stage;
}

- (void)setAgent:(id)a3
{
}

- (NSString)agent
{
  return self->_agent;
}

- (id)dictionaryRepresentationWithAppendExtraItemInfoBlock:(id)a3
{
  v33[2] = *MEMORY[0x1E4F143B8];
  v4 = (void (**)(id, void *, void *))a3;
  v27 = [MEMORY[0x1E4F1CA60] dictionary];
  id v5 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  v26 = self;
  v6 = NSAllMapTableValues(self->_debugItemByItem);
  v7 = [MEMORY[0x1E4F29008] sortDescriptorWithKey:@"timestamp" ascending:1];
  v33[0] = v7;
  v8 = [MEMORY[0x1E4F29008] sortDescriptorWithKey:@"identifier" ascending:1];
  v33[1] = v8;
  v9 = [MEMORY[0x1E4F1C978] arrayWithObjects:v33 count:2];
  v10 = [v6 sortedArrayUsingDescriptors:v9];

  long long v30 = 0u;
  long long v31 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  id v11 = v10;
  uint64_t v12 = [v11 countByEnumeratingWithState:&v28 objects:v32 count:16];
  if (v12)
  {
    uint64_t v13 = v12;
    uint64_t v14 = 0;
    uint64_t v15 = *(void *)v29;
    do
    {
      for (uint64_t i = 0; i != v13; ++i)
      {
        if (*(void *)v29 != v15) {
          objc_enumerationMutation(v11);
        }
        v17 = *(void **)(*((void *)&v28 + 1) + 8 * i);
        v18 = [v17 dictionaryRepresentation];
        v19 = (void *)[v18 mutableCopy];

        if (v19)
        {
          v20 = [MEMORY[0x1E4F28ED0] numberWithUnsignedInteger:v14 + i];
          [v19 setObject:v20 forKeyedSubscript:@"index"];

          if (v4)
          {
            v21 = [v17 item];
            v4[2](v4, v21, v19);
          }
          v22 = [v17 item];
          v23 = [v22 clsIdentifier];

          [v5 setObject:v19 forKeyedSubscript:v23];
        }
      }
      v14 += i;
      uint64_t v13 = [v11 countByEnumeratingWithState:&v28 objects:v32 count:16];
    }
    while (v13);
  }

  [v27 setObject:v5 forKeyedSubscript:@"items"];
  v24 = [(CLSCurationDebugCluster *)v26->_rootCluster dictionaryRepresentation];
  [v27 setObject:v24 forKeyedSubscript:@"rootCluster"];

  return v27;
}

- (void)endTentativeSectionWithSuccess:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  v4 = NSAllMapTableValues(self->_debugItemByItem);
  uint64_t v5 = [v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v10;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v10 != v7) {
          objc_enumerationMutation(v4);
        }
        objc_msgSend(*(id *)(*((void *)&v9 + 1) + 8 * v8++), "endTentativeSectionWithSuccess:", v3, (void)v9);
      }
      while (v6 != v8);
      uint64_t v6 = [v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v6);
  }
}

- (void)beginTentativeSection
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  long long v7 = 0u;
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  v2 = NSAllMapTableValues(self->_debugItemByItem);
  uint64_t v3 = [v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v8;
    do
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v8 != v5) {
          objc_enumerationMutation(v2);
        }
        objc_msgSend(*(id *)(*((void *)&v7 + 1) + 8 * v6++), "beginTentativeSection", (void)v7);
      }
      while (v4 != v6);
      uint64_t v4 = [v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
    }
    while (v4);
  }
}

- (void)resetWithReason:(id)a3
{
  debugClusterByCluster = self->_debugClusterByCluster;
  self->_debugClusterByCluster = 0;
  id v5 = a3;

  [(CLSCurationDebugCluster *)self->_rootCluster resetWithReason:v5 agent:self->_agent stage:self->_stage];
}

- (void)_dedupItems:(id)a3 toItems:(id)a4 chosenState:(unint64_t)a5 withDedupingType:(unint64_t)a6
{
  uint64_t v45 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a4;
  uint64_t v12 = [v11 firstObject];
  uint64_t v13 = [(CLSCurationDebugInfo *)self debugItemForItem:v12];

  if (v13)
  {
    id v34 = v10;
    uint64_t v14 = [(CLSCurationDebugInfo *)self debugItemsForItems:v10];
    uint64_t v15 = [(id)objc_opt_class() stringForDedupingType:a6];
    v16 = NSString;
    uint64_t v17 = [v14 count];
    uint64_t v18 = [v11 count];
    v19 = &stru_1F28DF9D8;
    if (a5 == 4) {
      v19 = @" because they are required";
    }
    v32 = (void *)v15;
    v20 = [v16 stringWithFormat:@"Deduping (%@) %lu items to %lu%@", v15, v17, v18, v19];
    id v33 = v11;
    if ((unint64_t)[v11 count] < 2)
    {
      [v13 setState:a5 withReason:v20 agent:self->_agent stage:self->_stage];
      id v21 = 0;
    }
    else
    {
      [(CLSCurationDebugInfo *)self debugItemsForItems:v11];
      long long v39 = 0u;
      long long v40 = 0u;
      long long v41 = 0u;
      long long v42 = 0u;
      id v21 = (id)objc_claimAutoreleasedReturnValue();
      uint64_t v22 = [v21 countByEnumeratingWithState:&v39 objects:v44 count:16];
      if (v22)
      {
        uint64_t v23 = v22;
        uint64_t v24 = *(void *)v40;
        do
        {
          uint64_t v25 = 0;
          do
          {
            if (*(void *)v40 != v24) {
              objc_enumerationMutation(v21);
            }
            [*(id *)(*((void *)&v39 + 1) + 8 * v25++) setState:a5 withReason:v20 agent:self->_agent stage:self->_stage];
          }
          while (v23 != v25);
          uint64_t v23 = [v21 countByEnumeratingWithState:&v39 objects:v44 count:16];
        }
        while (v23);
      }
    }
    long long v37 = 0u;
    long long v38 = 0u;
    long long v35 = 0u;
    long long v36 = 0u;
    id v26 = v14;
    uint64_t v27 = [v26 countByEnumeratingWithState:&v35 objects:v43 count:16];
    if (v27)
    {
      uint64_t v28 = v27;
      uint64_t v29 = *(void *)v36;
      do
      {
        uint64_t v30 = 0;
        do
        {
          if (*(void *)v36 != v29) {
            objc_enumerationMutation(v26);
          }
          long long v31 = *(void **)(*((void *)&v35 + 1) + 8 * v30);
          if (v31 != v13
            && (!v21 || ([v21 containsObject:*(void *)(*((void *)&v35 + 1) + 8 * v30)] & 1) == 0))
          {
            [v31 dupeToDebugItem:v13 withDedupingType:a6];
            [v31 setState:2 withReason:v20 agent:self->_agent stage:self->_stage];
          }
          ++v30;
        }
        while (v28 != v30);
        uint64_t v28 = [v26 countByEnumeratingWithState:&v35 objects:v43 count:16];
      }
      while (v28);
    }

    id v11 = v33;
    id v10 = v34;
  }
}

- (void)dedupItems:(id)a3 toRequiredItems:(id)a4 withDedupingType:(unint64_t)a5
{
}

- (void)dedupItems:(id)a3 toItems:(id)a4 withDedupingType:(unint64_t)a5
{
}

- (void)dedupItems:(id)a3 toItem:(id)a4 withDedupingType:(unint64_t)a5
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v12 = a4;
  long long v8 = (void *)MEMORY[0x1E4F1C978];
  id v9 = a4;
  id v10 = a3;
  id v11 = [v8 arrayWithObjects:&v12 count:1];

  -[CLSCurationDebugInfo _dedupItems:toItems:chosenState:withDedupingType:](self, "_dedupItems:toItems:chosenState:withDedupingType:", v10, v11, 1, a5, v12, v13);
}

- (void)requireItems:(id)a3 inItems:(id)a4
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  [(CLSCurationDebugInfo *)self debugItemsForItems:a4];
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id obj = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v7 = [obj countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v16;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v16 != v9) {
          objc_enumerationMutation(obj);
        }
        id v11 = *(void **)(*((void *)&v15 + 1) + 8 * i);
        id v12 = [v11 item];
        if ([v6 containsObject:v12]) {
          uint64_t v13 = 4;
        }
        else {
          uint64_t v13 = 2;
        }

        [v11 setState:v13 withReason:@"Items required" agent:self->_agent stage:self->_stage];
      }
      uint64_t v8 = [obj countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v8);
  }
}

- (void)requireItems:(id)a3 inCluster:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [(CLSCurationDebugInfo *)self debugClusterForCluster:v7];
  uint64_t v9 = v8;
  if (v8)
  {
    [v8 setState:1 withReason:@"Items required" agent:self->_agent stage:self->_stage];
    id v10 = [v7 clsCurationItems];
    id v11 = [MEMORY[0x1E4F1CAD0] setWithArray:v10];
    [(CLSCurationDebugInfo *)self requireItems:v6 inItems:v11];
  }
  else if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)id v12 = 0;
    _os_log_error_impl(&dword_1D2150000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "Cluster unknown", v12, 2u);
  }
}

- (void)chooseItems:(id)a3 inItems:(id)a4 withReason:(id)a5
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a5;
  [(CLSCurationDebugInfo *)self debugItemsForItems:a4];
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  id obj = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v10 = [obj countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v19;
    do
    {
      for (uint64_t i = 0; i != v11; ++i)
      {
        if (*(void *)v19 != v12) {
          objc_enumerationMutation(obj);
        }
        uint64_t v14 = *(void **)(*((void *)&v18 + 1) + 8 * i);
        long long v15 = [v14 item];
        if ([v8 containsObject:v15]) {
          uint64_t v16 = 1;
        }
        else {
          uint64_t v16 = 2;
        }

        [v14 setState:v16 withReason:v9 agent:self->_agent stage:self->_stage];
      }
      uint64_t v11 = [obj countByEnumeratingWithState:&v18 objects:v22 count:16];
    }
    while (v11);
  }
}

- (void)chooseItems:(id)a3 inCluster:(id)a4 withReason:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  uint64_t v11 = [(CLSCurationDebugInfo *)self debugClusterForCluster:v9];
  if (v11)
  {
    if ([v8 count]) {
      uint64_t v12 = 1;
    }
    else {
      uint64_t v12 = 2;
    }
    [v11 setState:v12 withReason:v10 agent:self->_agent stage:self->_stage];
    uint64_t v13 = [v9 clsCurationItems];
    uint64_t v14 = [MEMORY[0x1E4F1CAD0] setWithArray:v13];
    [(CLSCurationDebugInfo *)self chooseItems:v8 inItems:v14 withReason:v10];
  }
  else if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)long long v15 = 0;
    _os_log_error_impl(&dword_1D2150000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "Cluster unknown", v15, 2u);
  }
}

- (void)chooseItem:(id)a3 inItems:(id)a4 withReason:(id)a5
{
  id v8 = (void *)MEMORY[0x1E4F1CAD0];
  id v9 = a5;
  id v10 = a4;
  if (a3) {
    [v8 setWithObject:a3];
  }
  else {
  id v11 = [v8 set];
  }
  [(CLSCurationDebugInfo *)self chooseItems:v11 inItems:v10 withReason:v9];
}

- (void)chooseItem:(id)a3 inCluster:(id)a4 withReason:(id)a5
{
  id v8 = (void *)MEMORY[0x1E4F1CAD0];
  id v9 = a5;
  id v10 = a4;
  if (a3) {
    [v8 setWithObject:a3];
  }
  else {
  id v11 = [v8 set];
  }
  [(CLSCurationDebugInfo *)self chooseItems:v11 inCluster:v10 withReason:v9];
}

- (void)setUnclusteredItemsState:(unint64_t)a3 withReason:(id)a4
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v7 = [(CLSCurationDebugCluster *)self->_rootCluster unclusteredDebugItems];
  uint64_t v8 = [v7 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v14;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v14 != v10) {
          objc_enumerationMutation(v7);
        }
        uint64_t v12 = *(void **)(*((void *)&v13 + 1) + 8 * i);
        if ([v12 state] != 4) {
          [v12 setState:a3 withReason:v6 agent:self->_agent stage:self->_stage];
        }
      }
      uint64_t v9 = [v7 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v9);
  }
}

- (void)forceState:(unint64_t)a3 ofItem:(id)a4 withReason:(id)a5
{
  id v8 = a5;
  id v9 = [(CLSCurationDebugInfo *)self debugItemForItem:a4];
  [v9 resetWithReason:v8 agent:self->_agent stage:self->_stage];
  [v9 setState:a3 withReason:v8 agent:self->_agent stage:self->_stage];
}

- (void)setState:(unint64_t)a3 ofItems:(id)a4 withReason:(id)a5
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v8 = a5;
  id v9 = [(CLSCurationDebugInfo *)self debugItemsForItems:a4];
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  uint64_t v10 = [v9 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v15;
    do
    {
      uint64_t v13 = 0;
      do
      {
        if (*(void *)v15 != v12) {
          objc_enumerationMutation(v9);
        }
        [*(id *)(*((void *)&v14 + 1) + 8 * v13++) setState:a3 withReason:v8 agent:self->_agent stage:self->_stage];
      }
      while (v11 != v13);
      uint64_t v11 = [v9 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v11);
  }
}

- (void)setState:(unint64_t)a3 ofItem:(id)a4 withReason:(id)a5
{
  id v8 = a5;
  id v9 = [(CLSCurationDebugInfo *)self debugItemForItem:a4];
  [v9 setState:a3 withReason:v8 agent:self->_agent stage:self->_stage];
}

- (void)setState:(unint64_t)a3 ofCluster:(id)a4 withReason:(id)a5
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v8 = a4;
  id v9 = a5;
  uint64_t v10 = [(CLSCurationDebugInfo *)self debugClusterForCluster:v8];
  uint64_t v11 = v10;
  if (v10)
  {
    [v10 setState:a3 withReason:v9 agent:self->_agent stage:self->_stage];
    uint64_t v12 = [v8 clsCurationItems];
    uint64_t v13 = [(CLSCurationDebugInfo *)self debugItemsForItems:v12];
    long long v19 = 0u;
    long long v20 = 0u;
    long long v21 = 0u;
    long long v22 = 0u;
    uint64_t v14 = [v13 countByEnumeratingWithState:&v19 objects:v23 count:16];
    if (v14)
    {
      uint64_t v15 = v14;
      uint64_t v16 = *(void *)v20;
      do
      {
        for (uint64_t i = 0; i != v15; ++i)
        {
          if (*(void *)v20 != v16) {
            objc_enumerationMutation(v13);
          }
          [*(id *)(*((void *)&v19 + 1) + 8 * i) setState:a3 withReason:v9 agent:self->_agent stage:self->_stage];
        }
        uint64_t v15 = [v13 countByEnumeratingWithState:&v19 objects:v23 count:16];
      }
      while (v15);
    }
  }
  else if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)uint64_t v18 = 0;
    _os_log_error_impl(&dword_1D2150000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "Cluster unknown", v18, 2u);
  }
}

- (void)addClusters:(id)a3 withReason:(id)a4
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  id v8 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA80]), "initWithCapacity:", objc_msgSend(v6, "count"));
  if (!self->_debugClusterByCluster)
  {
    id v9 = [MEMORY[0x1E4F28E10] strongToStrongObjectsMapTable];
    debugClusterByCluster = self->_debugClusterByCluster;
    self->_debugClusterByCluster = v9;
  }
  long long v22 = 0u;
  long long v23 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  id obj = v6;
  uint64_t v11 = [obj countByEnumeratingWithState:&v20 objects:v24 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v13 = *(void *)v21;
    do
    {
      for (uint64_t i = 0; i != v12; ++i)
      {
        if (*(void *)v21 != v13) {
          objc_enumerationMutation(obj);
        }
        uint64_t v15 = *(void **)(*((void *)&v20 + 1) + 8 * i);
        uint64_t v16 = [v15 clsCurationItems];
        long long v17 = [(CLSCurationDebugInfo *)self debugItemsForItems:v16];
        uint64_t v18 = [[CLSCurationDebugCluster alloc] initWithDebugItems:v17 reason:v7];
        [(NSMapTable *)self->_debugClusterByCluster setObject:v18 forKey:v15];
        [v8 addObject:v18];
      }
      uint64_t v12 = [obj countByEnumeratingWithState:&v20 objects:v24 count:16];
    }
    while (v12);
  }

  [(CLSCurationDebugCluster *)self->_rootCluster addDebugClusters:v8];
}

- (void)setClusters:(id)a3 withReason:(id)a4
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  if (self->_debugClusterByCluster)
  {
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D2150000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "Clusters already set. To reset them, use resetWithReason first", buf, 2u);
    }
  }
  else
  {
    id v8 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA80]), "initWithCapacity:", objc_msgSend(v6, "count"));
    id v9 = [MEMORY[0x1E4F28E10] strongToStrongObjectsMapTable];
    debugClusterByCluster = self->_debugClusterByCluster;
    self->_debugClusterByCluster = v9;

    long long v23 = 0u;
    long long v24 = 0u;
    long long v21 = 0u;
    long long v22 = 0u;
    id v19 = v6;
    id obj = v6;
    uint64_t v11 = [obj countByEnumeratingWithState:&v21 objects:v26 count:16];
    if (v11)
    {
      uint64_t v12 = v11;
      uint64_t v13 = *(void *)v22;
      do
      {
        for (uint64_t i = 0; i != v12; ++i)
        {
          if (*(void *)v22 != v13) {
            objc_enumerationMutation(obj);
          }
          uint64_t v15 = *(void **)(*((void *)&v21 + 1) + 8 * i);
          uint64_t v16 = objc_msgSend(v15, "clsCurationItems", v19);
          long long v17 = [(CLSCurationDebugInfo *)self debugItemsForItems:v16];
          uint64_t v18 = [[CLSCurationDebugCluster alloc] initWithDebugItems:v17 reason:v7];
          [(NSMapTable *)self->_debugClusterByCluster setObject:v18 forKey:v15];
          [v8 addObject:v18];
        }
        uint64_t v12 = [obj countByEnumeratingWithState:&v21 objects:v26 count:16];
      }
      while (v12);
    }

    [(CLSCurationDebugCluster *)self->_rootCluster setDebugClusters:v8];
    id v6 = v19;
  }
}

- (id)debugClusterForCluster:(id)a3
{
  return [(NSMapTable *)self->_debugClusterByCluster objectForKey:a3];
}

- (id)debugItemsForItems:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [MEMORY[0x1E4F1CA80] set];
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v6 = v4;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v14;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v14 != v9) {
          objc_enumerationMutation(v6);
        }
        uint64_t v11 = -[NSMapTable objectForKey:](self->_debugItemByItem, "objectForKey:", *(void *)(*((void *)&v13 + 1) + 8 * i), (void)v13);
        if (v11) {
          [v5 addObject:v11];
        }
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v8);
  }

  return v5;
}

- (id)debugItemForItem:(id)a3
{
  return [(NSMapTable *)self->_debugItemByItem objectForKey:a3];
}

- (id)debugInfoForCluster:(id)a3
{
  uint64_t v3 = [(CLSCurationDebugInfo *)self debugClusterForCluster:a3];
  id v4 = [[CLSCurationDebugInfo alloc] initWithDebugCluster:v3];

  return v4;
}

- (CLSCurationDebugInfo)initWithDebugCluster:(id)a3
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  v23.receiver = self;
  v23.super_class = (Class)CLSCurationDebugInfo;
  id v6 = [(CLSCurationDebugInfo *)&v23 init];
  uint64_t v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_rootCluster, a3);
    uint64_t v8 = [MEMORY[0x1E4F28E10] strongToStrongObjectsMapTable];
    debugItemByItem = v7->_debugItemByItem;
    v7->_debugItemByItem = (NSMapTable *)v8;

    long long v21 = 0u;
    long long v22 = 0u;
    long long v19 = 0u;
    long long v20 = 0u;
    uint64_t v10 = objc_msgSend(v5, "allDebugItems", 0);
    uint64_t v11 = [v10 countByEnumeratingWithState:&v19 objects:v24 count:16];
    if (v11)
    {
      uint64_t v12 = v11;
      uint64_t v13 = *(void *)v20;
      do
      {
        for (uint64_t i = 0; i != v12; ++i)
        {
          if (*(void *)v20 != v13) {
            objc_enumerationMutation(v10);
          }
          long long v15 = *(void **)(*((void *)&v19 + 1) + 8 * i);
          long long v16 = v7->_debugItemByItem;
          long long v17 = [v15 item];
          [(NSMapTable *)v16 setObject:v15 forKey:v17];
        }
        uint64_t v12 = [v10 countByEnumeratingWithState:&v19 objects:v24 count:16];
      }
      while (v12);
    }
  }
  return v7;
}

- (CLSCurationDebugInfo)initWithItems:(id)a3
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v24.receiver = self;
  v24.super_class = (Class)CLSCurationDebugInfo;
  id v5 = [(CLSCurationDebugInfo *)&v24 init];
  if (v5)
  {
    id v6 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA80]), "initWithCapacity:", objc_msgSend(v4, "count"));
    uint64_t v7 = [MEMORY[0x1E4F28E10] strongToStrongObjectsMapTable];
    debugItemByItem = v5->_debugItemByItem;
    v5->_debugItemByItem = (NSMapTable *)v7;

    long long v22 = 0u;
    long long v23 = 0u;
    long long v20 = 0u;
    long long v21 = 0u;
    id v9 = v4;
    uint64_t v10 = [v9 countByEnumeratingWithState:&v20 objects:v25 count:16];
    if (v10)
    {
      uint64_t v11 = v10;
      uint64_t v12 = *(void *)v21;
      do
      {
        uint64_t v13 = 0;
        do
        {
          if (*(void *)v21 != v12) {
            objc_enumerationMutation(v9);
          }
          uint64_t v14 = *(void *)(*((void *)&v20 + 1) + 8 * v13);
          long long v15 = [CLSCurationDebugItem alloc];
          long long v16 = -[CLSCurationDebugItem initWithItem:](v15, "initWithItem:", v14, (void)v20);
          [(NSMapTable *)v5->_debugItemByItem setObject:v16 forKey:v14];
          [v6 addObject:v16];

          ++v13;
        }
        while (v11 != v13);
        uint64_t v11 = [v9 countByEnumeratingWithState:&v20 objects:v25 count:16];
      }
      while (v11);
    }

    long long v17 = [[CLSCurationDebugCluster alloc] initWithDebugItems:v6 reason:@"Root"];
    rootCluster = v5->_rootCluster;
    v5->_rootCluster = v17;
  }
  return v5;
}

@end