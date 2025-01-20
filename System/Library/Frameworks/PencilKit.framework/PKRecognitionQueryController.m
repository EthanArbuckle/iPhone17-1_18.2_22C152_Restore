@interface PKRecognitionQueryController
- (id)drawingQueryWithIdentifier:(id *)a1;
- (id)initWithRecognitionSessionManager:(id *)a1;
- (id)setupAndStartQuery:(uint64_t)a1;
- (id)visibleStrokesQueryWithIdentifier:(id *)a1;
- (uint64_t)clearDrawingQueries;
- (uint64_t)clearVisibleStrokesQueries;
- (void)_cleanupQuery:(uint64_t)a1;
- (void)removeQueryWithIdentifier:(id *)a1;
- (void)setSuffixes:(void *)a3 forQueryWithIdentifier:;
- (void)setupDrawingQueriesIfNecessary;
- (void)setupForMath;
- (void)setupVisibleStrokesQueries;
- (void)updateQueriesIfNecessaryWithState:(id *)a1;
@end

@implementation PKRecognitionQueryController

- (id)initWithRecognitionSessionManager:(id *)a1
{
  id v3 = a2;
  if (a1)
  {
    v13.receiver = a1;
    v13.super_class = (Class)PKRecognitionQueryController;
    a1 = (id *)objc_msgSendSuper2(&v13, sel_init);
    if (a1)
    {
      id v4 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
      id v5 = a1[2];
      a1[2] = v4;

      id v6 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
      id v7 = a1[3];
      a1[3] = v6;

      id v8 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
      id v9 = a1[4];
      a1[4] = v8;

      id v10 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
      id v11 = a1[5];
      a1[5] = v10;

      objc_storeWeak(a1 + 6, v3);
    }
  }

  return a1;
}

- (void)removeQueryWithIdentifier:(id *)a1
{
  if (a1)
  {
    id v3 = a1[2];
    id v6 = a2;
    id v4 = [v3 objectForKey:v6];
    -[PKRecognitionQueryController _cleanupQuery:]((uint64_t)a1, v4);

    id v5 = [a1[3] objectForKey:v6];
    -[PKRecognitionQueryController _cleanupQuery:]((uint64_t)a1, v5);

    [a1[4] removeObjectForKey:v6];
    [a1[2] removeObjectForKey:v6];
    [a1[3] removeObjectForKey:v6];
    [a1[5] removeObjectForKey:v6];
  }
}

- (void)_cleanupQuery:(uint64_t)a1
{
  if (a1)
  {
    id v2 = a2;
    [v2 pause];
    [v2 setDelegate:0];
    [v2 teardown];
  }
}

- (id)visibleStrokesQueryWithIdentifier:(id *)a1
{
  if (a1)
  {
    a1 = [a1[3] objectForKey:a2];
    uint64_t v2 = vars8;
  }
  return a1;
}

- (id)drawingQueryWithIdentifier:(id *)a1
{
  if (a1)
  {
    a1 = [a1[2] objectForKey:a2];
    uint64_t v2 = vars8;
  }
  return a1;
}

- (void)updateQueriesIfNecessaryWithState:(id *)a1
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  if (a1)
  {
    long long v17 = 0u;
    long long v18 = 0u;
    long long v15 = 0u;
    long long v16 = 0u;
    id obj = [a1[4] allKeys];
    uint64_t v3 = [obj countByEnumeratingWithState:&v15 objects:v19 count:16];
    if (!v3) {
      goto LABEL_14;
    }
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v16;
    while (1)
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v16 != v5) {
          objc_enumerationMutation(obj);
        }
        uint64_t v7 = *(void *)(*((void *)&v15 + 1) + 8 * i);
        id v8 = (objc_class *)[a1[4] objectForKey:v7];
        if (a2 == 3)
        {
          id v9 = [a1[2] objectForKey:v7];

          id v10 = a1 + 2;
          if (v9) {
            continue;
          }
        }
        else
        {
          id v11 = [a1[3] objectForKey:v7];

          id v10 = a1 + 3;
          if (v11) {
            continue;
          }
        }
        v12 = -[PKRecognitionQueryController setupAndStartQuery:]((uint64_t)a1, v8);
        [*v10 setObject:v12 forKeyedSubscript:v7];
      }
      uint64_t v4 = [obj countByEnumeratingWithState:&v15 objects:v19 count:16];
      if (!v4)
      {
LABEL_14:

        return;
      }
    }
  }
}

- (id)setupAndStartQuery:(uint64_t)a1
{
  if (a1)
  {
    id v3 = [a2 alloc];
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
    uint64_t v5 = (void *)[v3 initWithRecognitionSessionManager:WeakRetained];

    id v6 = objc_loadWeakRetained((id *)(a1 + 48));
    [v5 setDelegate:v6];

    if (*(unsigned char *)(a1 + 8)) {
      [v5 setupForMath];
    }
    [v5 start];
  }
  else
  {
    uint64_t v5 = 0;
  }

  return v5;
}

- (void)setupVisibleStrokesQueries
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  if (a1)
  {
    -[PKRecognitionQueryController clearVisibleStrokesQueries](a1);
    -[PKRecognitionQueryController clearDrawingQueries](a1);
    long long v11 = 0u;
    long long v12 = 0u;
    long long v9 = 0u;
    long long v10 = 0u;
    uint64_t v2 = objc_msgSend(*(id *)(a1 + 32), "allKeys", 0);
    uint64_t v3 = [v2 countByEnumeratingWithState:&v9 objects:v13 count:16];
    if (v3)
    {
      uint64_t v4 = v3;
      uint64_t v5 = *(void *)v10;
      do
      {
        for (uint64_t i = 0; i != v4; ++i)
        {
          if (*(void *)v10 != v5) {
            objc_enumerationMutation(v2);
          }
          uint64_t v7 = *(void *)(*((void *)&v9 + 1) + 8 * i);
          id v8 = -[PKRecognitionQueryController setupAndStartQuery:](a1, (Class)[*(id *)(a1 + 32) objectForKeyedSubscript:v7]);
          [*(id *)(a1 + 24) setObject:v8 forKey:v7];
        }
        uint64_t v4 = [v2 countByEnumeratingWithState:&v9 objects:v13 count:16];
      }
      while (v4);
    }
  }
}

- (void)setupDrawingQueriesIfNecessary
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  if (a1)
  {
    long long v14 = 0u;
    long long v15 = 0u;
    long long v12 = 0u;
    long long v13 = 0u;
    uint64_t v2 = objc_msgSend(a1[4], "allKeys", 0);
    uint64_t v3 = [v2 countByEnumeratingWithState:&v12 objects:v16 count:16];
    if (v3)
    {
      uint64_t v4 = v3;
      uint64_t v5 = *(void *)v13;
      do
      {
        for (uint64_t i = 0; i != v4; ++i)
        {
          if (*(void *)v13 != v5) {
            objc_enumerationMutation(v2);
          }
          uint64_t v7 = *(void *)(*((void *)&v12 + 1) + 8 * i);
          id v8 = (objc_class *)[a1[4] objectForKeyedSubscript:v7];
          long long v9 = [a1[2] objectForKey:v7];

          if (!v9)
          {
            long long v10 = -[PKRecognitionQueryController setupAndStartQuery:]((uint64_t)a1, v8);
            [a1[2] setObject:v10 forKey:v7];
            objc_opt_class();
            if (objc_opt_isKindOfClass())
            {
              long long v11 = [a1[5] objectForKeyedSubscript:v7];
              [v10 setValidSuffixes:v11];
            }
          }
        }
        uint64_t v4 = [v2 countByEnumeratingWithState:&v12 objects:v16 count:16];
      }
      while (v4);
    }
  }
}

- (void)setupForMath
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  if (a1)
  {
    a1[8] = 1;
    long long v18 = 0u;
    long long v19 = 0u;
    long long v20 = 0u;
    long long v21 = 0u;
    uint64_t v3 = objc_msgSend(objc_getProperty(a1, a2, 24, 1), "allValues");
    uint64_t v4 = [v3 countByEnumeratingWithState:&v18 objects:v23 count:16];
    if (v4)
    {
      uint64_t v5 = v4;
      uint64_t v6 = *(void *)v19;
      do
      {
        uint64_t v7 = 0;
        do
        {
          if (*(void *)v19 != v6) {
            objc_enumerationMutation(v3);
          }
          [*(id *)(*((void *)&v18 + 1) + 8 * v7++) setupForMath];
        }
        while (v5 != v7);
        uint64_t v5 = [v3 countByEnumeratingWithState:&v18 objects:v23 count:16];
      }
      while (v5);
    }

    long long v16 = 0u;
    long long v17 = 0u;
    long long v14 = 0u;
    long long v15 = 0u;
    long long v9 = objc_msgSend(objc_getProperty(a1, v8, 16, 1), "allValues", 0);
    uint64_t v10 = [v9 countByEnumeratingWithState:&v14 objects:v22 count:16];
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
          [*(id *)(*((void *)&v14 + 1) + 8 * v13++) setupForMath];
        }
        while (v11 != v13);
        uint64_t v11 = [v9 countByEnumeratingWithState:&v14 objects:v22 count:16];
      }
      while (v11);
    }
  }
}

- (uint64_t)clearVisibleStrokesQueries
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  if (result)
  {
    uint64_t v1 = result;
    long long v9 = 0u;
    long long v10 = 0u;
    long long v7 = 0u;
    long long v8 = 0u;
    uint64_t v2 = objc_msgSend(*(id *)(result + 24), "allValues", 0);
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
          -[PKRecognitionQueryController _cleanupQuery:](v1, *(void **)(*((void *)&v7 + 1) + 8 * v6++));
        }
        while (v4 != v6);
        uint64_t v4 = [v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
      }
      while (v4);
    }

    return [*(id *)(v1 + 24) removeAllObjects];
  }
  return result;
}

- (uint64_t)clearDrawingQueries
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  if (result)
  {
    uint64_t v1 = result;
    long long v9 = 0u;
    long long v10 = 0u;
    long long v7 = 0u;
    long long v8 = 0u;
    uint64_t v2 = objc_msgSend(*(id *)(result + 16), "allValues", 0);
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
          -[PKRecognitionQueryController _cleanupQuery:](v1, *(void **)(*((void *)&v7 + 1) + 8 * v6++));
        }
        while (v4 != v6);
        uint64_t v4 = [v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
      }
      while (v4);
    }

    return [*(id *)(v1 + 16) removeAllObjects];
  }
  return result;
}

- (void)setSuffixes:(void *)a3 forQueryWithIdentifier:
{
  id v10 = a2;
  id v5 = a3;
  if (a1)
  {
    id v6 = [*(id *)(a1 + 40) objectForKeyedSubscript:v5];
    if (v6 == v10)
    {
      long long v7 = [*(id *)(a1 + 40) objectForKeyedSubscript:v5];
      char v8 = [v10 isEqualToSet:v7];

      if (v8) {
        goto LABEL_8;
      }
    }
    else
    {
    }
    [*(id *)(a1 + 40) setObject:v10 forKeyedSubscript:v5];
    long long v9 = [*(id *)(a1 + 16) objectForKey:v5];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      [v9 setValidSuffixes:v10];
    }
  }
LABEL_8:
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_recognitionManager);
  objc_storeStrong((id *)&self->_suffixes, 0);
  objc_storeStrong((id *)&self->_queriesToCreate, 0);
  objc_storeStrong((id *)&self->_visibleStrokeQueries, 0);

  objc_storeStrong((id *)&self->_drawingQueries, 0);
}

@end