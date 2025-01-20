@interface BMAprioriPatternMiner
- (BMAprioriPatternMiner)initWithBaskets:(id)a3;
- (BOOL)shouldStop;
- (NSArray)indexBaskets;
- (NSArray)items;
- (id)getItemIndexSetsWithMinSupport:(double)a3 itemIndexSets:(id)a4;
- (id)minePatternsWithMinSupport:(unint64_t)a3 constrainedToPatternsWithTypes:(id)a4;
- (id)supportOfItemIndexSet:(id)a3;
- (unint64_t)maxItemsetSize;
- (void)setMaxItemsetSize:(unint64_t)a3;
- (void)setShouldStop:(BOOL)a3;
- (void)terminateEarly;
@end

@implementation BMAprioriPatternMiner

- (BMAprioriPatternMiner)initWithBaskets:(id)a3
{
  uint64_t v43 = *MEMORY[0x263EF8340];
  id v4 = a3;
  v40.receiver = self;
  v40.super_class = (Class)BMAprioriPatternMiner;
  v5 = [(BMAprioriPatternMiner *)&v40 init];
  v6 = v5;
  if (v5)
  {
    v25 = v5;
    v5->_maxItemsetSize = 0;
    v7 = [MEMORY[0x263EFF980] array];
    v29 = [MEMORY[0x263EFF980] array];
    v8 = [MEMORY[0x263EFF9B0] orderedSet];
    long long v36 = 0u;
    long long v37 = 0u;
    long long v38 = 0u;
    long long v39 = 0u;
    id v26 = v4;
    id obj = v4;
    uint64_t v30 = [obj countByEnumeratingWithState:&v36 objects:v42 count:16];
    if (v30)
    {
      uint64_t v28 = *(void *)v37;
      do
      {
        uint64_t v9 = 0;
        do
        {
          if (*(void *)v37 != v28) {
            objc_enumerationMutation(obj);
          }
          uint64_t v31 = v9;
          v10 = *(void **)(*((void *)&v36 + 1) + 8 * v9);
          v11 = [MEMORY[0x263F089C8] indexSet];
          long long v32 = 0u;
          long long v33 = 0u;
          long long v34 = 0u;
          long long v35 = 0u;
          id v12 = v10;
          uint64_t v13 = [v12 countByEnumeratingWithState:&v32 objects:v41 count:16];
          if (v13)
          {
            uint64_t v14 = v13;
            uint64_t v15 = *(void *)v33;
            do
            {
              for (uint64_t i = 0; i != v14; ++i)
              {
                if (*(void *)v33 != v15) {
                  objc_enumerationMutation(v12);
                }
                uint64_t v17 = *(void *)(*((void *)&v32 + 1) + 8 * i);
                uint64_t v18 = [v8 indexOfObject:v17];
                if (v18 == 0x7FFFFFFFFFFFFFFFLL)
                {
                  [v8 addObject:v17];
                  uint64_t v18 = [v8 indexOfObject:v17];
                  [v7 addObject:v17];
                }
                [v11 addIndex:v18];
              }
              uint64_t v14 = [v12 countByEnumeratingWithState:&v32 objects:v41 count:16];
            }
            while (v14);
          }

          v19 = (void *)[v11 copy];
          [v29 addObject:v19];

          uint64_t v9 = v31 + 1;
        }
        while (v31 + 1 != v30);
        uint64_t v30 = [obj countByEnumeratingWithState:&v36 objects:v42 count:16];
      }
      while (v30);
    }

    uint64_t v20 = [v7 copy];
    v6 = v25;
    items = v25->_items;
    v25->_items = (NSArray *)v20;

    uint64_t v22 = [v29 copy];
    indexBaskets = v25->_indexBaskets;
    v25->_indexBaskets = (NSArray *)v22;

    v25->_shouldStop = 0;
    id v4 = v26;
  }

  return v6;
}

- (void)terminateEarly
{
}

- (id)supportOfItemIndexSet:(id)a3
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  id v4 = a3;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  v5 = [(BMAprioriPatternMiner *)self indexBaskets];
  uint64_t v6 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = 0;
    uint64_t v9 = *(void *)v14;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v14 != v9) {
          objc_enumerationMutation(v5);
        }
        v8 += [*(id *)(*((void *)&v13 + 1) + 8 * i) containsIndexes:v4];
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v7);
  }
  else
  {
    uint64_t v8 = 0;
  }

  v11 = [NSNumber numberWithUnsignedInteger:v8];

  return v11;
}

- (id)getItemIndexSetsWithMinSupport:(double)a3 itemIndexSets:(id)a4
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  id v6 = a4;
  uint64_t v7 = [MEMORY[0x263EFF9A0] dictionary];
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  id v8 = v6;
  uint64_t v9 = [v8 countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v19;
    while (2)
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v19 != v11) {
          objc_enumerationMutation(v8);
        }
        uint64_t v13 = *(void *)(*((void *)&v18 + 1) + 8 * i);
        if ([(BMAprioriPatternMiner *)self shouldStop])
        {

          id v16 = (id)MEMORY[0x263EFFA78];
          goto LABEL_13;
        }
        long long v14 = [(BMAprioriPatternMiner *)self supportOfItemIndexSet:v13];
        double v15 = (double)[v14 integerValue];
        if (v15 >= a3) {
          objc_msgSend(v7, "setObject:forKey:", v14, v13, v15);
        }
      }
      uint64_t v10 = [v8 countByEnumeratingWithState:&v18 objects:v22 count:16];
      if (v10) {
        continue;
      }
      break;
    }
  }

  id v16 = v7;
LABEL_13:

  return v16;
}

- (id)minePatternsWithMinSupport:(unint64_t)a3 constrainedToPatternsWithTypes:(id)a4
{
  id v6 = a4;
  uint64_t v7 = [MEMORY[0x263F089C8] indexSet];
  id v8 = [(BMAprioriPatternMiner *)self items];
  v46[0] = MEMORY[0x263EF8330];
  v46[1] = 3221225472;
  v46[2] = __83__BMAprioriPatternMiner_minePatternsWithMinSupport_constrainedToPatternsWithTypes___block_invoke;
  v46[3] = &unk_264546860;
  id v40 = v6;
  id v47 = v40;
  id v9 = v7;
  id v48 = v9;
  [v8 enumerateObjectsUsingBlock:v46];

  long long v39 = v9;
  v45 = (void *)[v9 copy];
  unint64_t v10 = 0x263EFF000uLL;
  id v11 = objc_alloc_init(MEMORY[0x263EFF980]);
  id v12 = [(BMAprioriPatternMiner *)self items];
  uint64_t v13 = [v12 count];

  if (v13)
  {
    unint64_t v14 = 0;
    do
    {
      double v15 = [MEMORY[0x263F088D0] indexSetWithIndex:v14];
      [v11 addObject:v15];

      ++v14;
      id v16 = [(BMAprioriPatternMiner *)self items];
      unint64_t v17 = [v16 count];
    }
    while (v17 > v14);
  }
  long long v18 = [MEMORY[0x263EFF9A0] dictionary];
  double v19 = (double)a3;
  long long v38 = v11;
  long long v20 = [(BMAprioriPatternMiner *)self getItemIndexSetsWithMinSupport:v11 itemIndexSets:(double)a3];
  long long v21 = 0;
  if ([v20 count])
  {
    unint64_t v22 = 2;
    uint64_t v23 = v20;
    long long v37 = v18;
    while (1)
    {
      [v18 addEntriesFromDictionary:v23];
      id v43 = objc_alloc_init(*(Class *)(v10 + 2432));

      v41 = v23;
      v24 = [v23 allKeys];
      if ([v24 count]) {
        break;
      }
LABEL_17:
      if ([(BMAprioriPatternMiner *)self maxItemsetSize]
        && v22 > [(BMAprioriPatternMiner *)self maxItemsetSize])
      {
        long long v35 = BMLog();
        long long v21 = v43;
        if (os_log_type_enabled(v35, OS_LOG_TYPE_DEBUG)) {
          -[BMAprioriPatternMiner minePatternsWithMinSupport:constrainedToPatternsWithTypes:](self, v35);
        }

        long long v20 = v41;
        long long v18 = v37;
        goto LABEL_25;
      }
      long long v21 = v43;
      long long v20 = [(BMAprioriPatternMiner *)self getItemIndexSetsWithMinSupport:v43 itemIndexSets:v19];

      ++v22;
      uint64_t v23 = v20;
      unint64_t v10 = 0x263EFF000;
      long long v18 = v37;
      if (![v20 count]) {
        goto LABEL_25;
      }
    }
    unint64_t v25 = 0;
    v44 = v24;
    while (1)
    {
      unint64_t v42 = v25 + 1;
      if (v25 + 1 < [v24 count]) {
        break;
      }
LABEL_16:
      unint64_t v25 = v42;
      if (v42 >= [v24 count]) {
        goto LABEL_17;
      }
    }
    unint64_t v26 = v25 + 1;
    while (![(BMAprioriPatternMiner *)self shouldStop])
    {
      v27 = [v24 objectAtIndexedSubscript:v25];
      uint64_t v28 = [v24 objectAtIndexedSubscript:v26];
      id v29 = objc_alloc_init(MEMORY[0x263F089C8]);
      [v29 addIndexes:v27];
      [v29 addIndexes:v28];
      if ([v29 count] == v22)
      {
        unint64_t v30 = v25;
        unint64_t v31 = v22;
        long long v32 = (void *)[v45 mutableCopy];
        [v32 removeIndexes:v29];
        uint64_t v33 = [v32 count];
        if (v33 != [v45 count]) {
          [v43 addObject:v29];
        }

        unint64_t v22 = v31;
        unint64_t v25 = v30;
        v24 = v44;
      }

      if (++v26 >= [v24 count]) {
        goto LABEL_16;
      }
    }

    id v34 = (id)MEMORY[0x263EFFA78];
    long long v18 = v37;
    long long v21 = v43;
    long long v20 = v41;
  }
  else
  {
LABEL_25:
    id v34 = v18;
  }

  return v34;
}

void __83__BMAprioriPatternMiner_minePatternsWithMinSupport_constrainedToPatternsWithTypes___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  v5 = *(void **)(a1 + 32);
  id v6 = [a2 type];
  LODWORD(v5) = [v5 containsObject:v6];

  if (v5)
  {
    uint64_t v7 = *(void **)(a1 + 40);
    [v7 addIndex:a3];
  }
}

- (NSArray)items
{
  return self->_items;
}

- (BOOL)shouldStop
{
  return self->_shouldStop;
}

- (void)setShouldStop:(BOOL)a3
{
  self->_shouldStop = a3;
}

- (NSArray)indexBaskets
{
  return self->_indexBaskets;
}

- (unint64_t)maxItemsetSize
{
  return self->_maxItemsetSize;
}

- (void)setMaxItemsetSize:(unint64_t)a3
{
  self->_maxItemsetSize = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_indexBaskets, 0);

  objc_storeStrong((id *)&self->_items, 0);
}

- (void)minePatternsWithMinSupport:(void *)a1 constrainedToPatternsWithTypes:(NSObject *)a2 .cold.1(void *a1, NSObject *a2)
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  v3 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(a1, "maxItemsetSize"));
  int v4 = 138412290;
  v5 = v3;
  _os_log_debug_impl(&dword_21FF33000, a2, OS_LOG_TYPE_DEBUG, "Finished mining patterns due to max items in itemset (%@) reached", (uint8_t *)&v4, 0xCu);
}

@end