@interface ISLanguageCarousel
+ (id)_rankedItems:(id)a3 usePreferredLanguages:(BOOL)a4 guessedRegion:(BOOL)a5;
+ (id)guessedRegion;
+ (id)rankedItemsFromItems:(id)a3 usingSystemLanguages:(id)a4 preferredLanguages:(id)a5 region:(id)a6;
- (BOOL)cycle;
- (BOOL)mergeDuplicates;
- (BOOL)randomize;
- (BOOL)rankingUsesGuessedRegion;
- (BOOL)rankingUsesPreferredLanguages;
- (BOOL)weightedRepetition;
- (ISLanguageCarousel)initWithItems:(id)a3;
- (NSArray)items;
- (NSArray)queue;
- (id)_itemsWithMergedDuplicates:(id)a3;
- (id)nextItem;
- (unint64_t)queueIndex;
- (void)reloadQueue;
- (void)setCycle:(BOOL)a3;
- (void)setItems:(id)a3;
- (void)setMergeDuplicates:(BOOL)a3;
- (void)setQueue:(id)a3;
- (void)setQueueIndex:(unint64_t)a3;
- (void)setRandomize:(BOOL)a3;
- (void)setRankingUsesGuessedRegion:(BOOL)a3;
- (void)setRankingUsesPreferredLanguages:(BOOL)a3;
- (void)setWeightedRepetition:(BOOL)a3;
@end

@implementation ISLanguageCarousel

- (ISLanguageCarousel)initWithItems:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)ISLanguageCarousel;
  v5 = [(ISLanguageCarousel *)&v8 init];
  v6 = v5;
  if (v5)
  {
    [(ISLanguageCarousel *)v5 setItems:v4];
    [(ISLanguageCarousel *)v6 setCycle:1];
    [(ISLanguageCarousel *)v6 setWeightedRepetition:1];
  }

  return v6;
}

- (id)nextItem
{
  unint64_t v3 = [(ISLanguageCarousel *)self queueIndex];
  id v4 = [(ISLanguageCarousel *)self queue];
  if (v3 >= [v4 count])
  {
    BOOL v5 = [(ISLanguageCarousel *)self cycle];

    if (v5) {
      [(ISLanguageCarousel *)self setQueueIndex:0];
    }
  }
  else
  {
  }
  unint64_t v6 = [(ISLanguageCarousel *)self queueIndex];
  v7 = [(ISLanguageCarousel *)self queue];
  unint64_t v8 = [v7 count];

  if (v6 >= v8)
  {
    v10 = 0;
  }
  else
  {
    v9 = [(ISLanguageCarousel *)self queue];
    v10 = objc_msgSend(v9, "objectAtIndexedSubscript:", -[ISLanguageCarousel queueIndex](self, "queueIndex"));

    [(ISLanguageCarousel *)self setQueueIndex:[(ISLanguageCarousel *)self queueIndex] + 1];
  }

  return v10;
}

+ (id)rankedItemsFromItems:(id)a3 usingSystemLanguages:(id)a4 preferredLanguages:(id)a5 region:(id)a6
{
  uint64_t v59 = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  id v12 = a6;
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
  {
    v13 = [v10 componentsJoinedByString:@","];
    v14 = [v11 componentsJoinedByString:@","];
    id v15 = v11;
    id v16 = v10;
    uint64_t v17 = [v9 count];
    v18 = [v9 valueForKey:@"languageIdentifier"];
    v19 = [v18 componentsJoinedByString:@","];
    *(_DWORD *)buf = 136316418;
    v48 = "+[ISLanguageCarousel rankedItemsFromItems:usingSystemLanguages:preferredLanguages:region:]";
    __int16 v49 = 2114;
    v50 = v13;
    __int16 v51 = 2114;
    v52 = v14;
    __int16 v53 = 2114;
    id v54 = v12;
    __int16 v55 = 2048;
    uint64_t v56 = v17;
    id v10 = v16;
    id v11 = v15;
    __int16 v57 = 2114;
    v58 = v19;
    _os_log_impl(&dword_1E420E000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "%s: systemLanguages = [%{public}@], preferredLanguages = [%{public}@], region = %{public}@, items (%lu) = [%{public}@]", buf, 0x3Eu);
  }
  v20 = [v9 valueForKey:@"languageIdentifier"];
  v21 = (void *)[v20 mutableCopy];

  if (![v21 count]) {
    +[ISLanguageCarousel rankedItemsFromItems:usingSystemLanguages:preferredLanguages:region:]();
  }
  v37 = v10;
  if ([v21 count])
  {
    id v22 = v10;
    if ([v12 length])
    {
      v23 = [MEMORY[0x1E4F1CA20] languagesForRegion:v12 subdivision:0 withThreshold:1 filter:0];
      uint64_t v24 = [v23 arrayByAddingObjectsFromArray:v22];

      id v22 = (id)v24;
    }
    if ([v11 count])
    {
      uint64_t v25 = [v11 arrayByAddingObjectsFromArray:v22];

      id v22 = (id)v25;
    }
    v40 = objc_msgSend(MEMORY[0x1E4F1CA70], "orderedSetWithCapacity:", objc_msgSend(v21, "count"));
    if ([v21 count])
    {
      id v38 = v22;
      v39 = v21;
      while (1)
      {
        v26 = [MEMORY[0x1E4F28B50] preferredLocalizationsFromArray:v21 forPreferences:v22];
        if (![v26 count]) {
          +[ISLanguageCarousel rankedItemsFromItems:usingSystemLanguages:preferredLanguages:region:]();
        }
        if (![v26 count]) {
          break;
        }
        [v21 removeObjectsInArray:v26];
        long long v44 = 0u;
        long long v45 = 0u;
        long long v42 = 0u;
        long long v43 = 0u;
        id v27 = v26;
        uint64_t v28 = [v27 countByEnumeratingWithState:&v42 objects:v46 count:16];
        if (v28)
        {
          uint64_t v29 = v28;
          uint64_t v30 = *(void *)v43;
          do
          {
            for (uint64_t i = 0; i != v29; ++i)
            {
              if (*(void *)v43 != v30) {
                objc_enumerationMutation(v27);
              }
              uint64_t v32 = *(void *)(*((void *)&v42 + 1) + 8 * i);
              v41[0] = MEMORY[0x1E4F143A8];
              v41[1] = 3221225472;
              v41[2] = __90__ISLanguageCarousel_rankedItemsFromItems_usingSystemLanguages_preferredLanguages_region___block_invoke;
              v41[3] = &unk_1E6E3C450;
              v41[4] = v32;
              uint64_t v33 = [v9 indexOfObjectPassingTest:v41];
              if (v33 != 0x7FFFFFFFFFFFFFFFLL)
              {
                v34 = [v9 objectAtIndexedSubscript:v33];
                [v40 addObject:v34];
              }
            }
            uint64_t v29 = [v27 countByEnumeratingWithState:&v42 objects:v46 count:16];
          }
          while (v29);
        }

        v21 = v39;
        id v22 = v38;
        if (![v39 count]) {
          goto LABEL_26;
        }
      }
    }
LABEL_26:
    v35 = [v40 array];
  }
  else
  {
    v35 = (void *)MEMORY[0x1E4F1CBF0];
  }

  return v35;
}

uint64_t __90__ISLanguageCarousel_rankedItemsFromItems_usingSystemLanguages_preferredLanguages_region___block_invoke(uint64_t a1, void *a2)
{
  unint64_t v3 = [a2 languageIdentifier];
  uint64_t v4 = [v3 isEqualToString:*(void *)(a1 + 32)];

  return v4;
}

+ (id)guessedRegion
{
  v2 = +[ISRegionDetector sharedRegionDetector];
  unint64_t v3 = [v2 guessedCountries];
  uint64_t v4 = [v3 firstObject];

  return v4;
}

+ (id)_rankedItems:(id)a3 usePreferredLanguages:(BOOL)a4 guessedRegion:(BOOL)a5
{
  BOOL v6 = a4;
  id v7 = a3;
  unint64_t v8 = objc_opt_class();
  id v9 = [MEMORY[0x1E4F1CA20] systemLanguages];
  if (v6)
  {
    id v10 = [MEMORY[0x1E4F1CA20] preferredLanguages];
    if (!a5) {
      goto LABEL_3;
    }
LABEL_6:
    id v12 = [(id)objc_opt_class() guessedRegion];
    id v11 = [v8 rankedItemsFromItems:v7 usingSystemLanguages:v9 preferredLanguages:v10 region:v12];

    if (!v6) {
      goto LABEL_8;
    }
    goto LABEL_7;
  }
  id v10 = 0;
  if (a5) {
    goto LABEL_6;
  }
LABEL_3:
  id v11 = [v8 rankedItemsFromItems:v7 usingSystemLanguages:v9 preferredLanguages:v10 region:0];
  if (v6) {
LABEL_7:
  }

LABEL_8:

  return v11;
}

- (id)_itemsWithMergedDuplicates:(id)a3
{
  uint64_t v52 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  BOOL v5 = objc_opt_new();
  id v27 = (id)objc_opt_new();
  long long v38 = 0u;
  long long v39 = 0u;
  long long v40 = 0u;
  long long v41 = 0u;
  obuint64_t j = v4;
  uint64_t v30 = [obj countByEnumeratingWithState:&v38 objects:v51 count:16];
  if (v30)
  {
    uint64_t v29 = *(void *)v39;
    uint64_t v28 = v5;
    do
    {
      for (uint64_t i = 0; i != v30; ++i)
      {
        if (*(void *)v39 != v29) {
          objc_enumerationMutation(obj);
        }
        id v7 = *(void **)(*((void *)&v38 + 1) + 8 * i);
        unint64_t v8 = (void *)MEMORY[0x1E4F1CA20];
        id v9 = [v7 languageIdentifier];
        id v10 = [v8 baseLanguageFromLanguage:v9];

        id v11 = [v5 objectForKeyedSubscript:v10];

        if (v11)
        {
          v31 = v10;
          uint64_t v32 = i;
          id v12 = [v5 objectForKeyedSubscript:v10];
          long long v34 = 0u;
          long long v35 = 0u;
          long long v36 = 0u;
          long long v37 = 0u;
          id v33 = v12;
          uint64_t v13 = [v33 countByEnumeratingWithState:&v34 objects:v50 count:16];
          if (v13)
          {
            uint64_t v14 = v13;
            uint64_t v15 = *(void *)v35;
            while (2)
            {
              for (uint64_t j = 0; j != v14; ++j)
              {
                if (*(void *)v35 != v15) {
                  objc_enumerationMutation(v33);
                }
                uint64_t v17 = *(void **)(*((void *)&v34 + 1) + 8 * j);
                v18 = [v17 data];
                if (!v18)
                {
                  unint64_t v3 = [v7 data];
                  if (!v3)
                  {
LABEL_21:
                    id v10 = v31;
                    id v22 = v33;
                    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
                    {
                      v23 = [v17 languageIdentifier];
                      uint64_t v24 = [v7 languageIdentifier];
                      *(_DWORD *)buf = 136315906;
                      long long v43 = "-[ISLanguageCarousel _itemsWithMergedDuplicates:]";
                      __int16 v44 = 2114;
                      long long v45 = v23;
                      __int16 v46 = 2114;
                      v47 = v24;
                      __int16 v48 = 2114;
                      __int16 v49 = v31;
                      _os_log_impl(&dword_1E420E000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "%s: merging items (%{public}@, %{public}@) with baseLanguage %{public}@", buf, 0x2Au);
                    }
                    BOOL v5 = v28;
                    uint64_t i = v32;
                    goto LABEL_25;
                  }
                }
                v19 = [v17 data];
                v20 = [v7 data];
                int v21 = [v19 isEqual:v20];

                if (v18)
                {

                  if (v21) {
                    goto LABEL_21;
                  }
                }
                else
                {

                  if (v21) {
                    goto LABEL_21;
                  }
                }
              }
              uint64_t v14 = [v33 countByEnumeratingWithState:&v34 objects:v50 count:16];
              if (v14) {
                continue;
              }
              break;
            }
          }
          id v22 = v33;

          [v27 addObject:v7];
          [v33 addObject:v7];
          BOOL v5 = v28;
          id v10 = v31;
          uint64_t i = v32;
        }
        else
        {
          [v27 addObject:v7];
          id v22 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithObjects:", v7, 0);
          [v5 setObject:v22 forKeyedSubscript:v10];
        }
LABEL_25:
      }
      uint64_t v30 = [obj countByEnumeratingWithState:&v38 objects:v51 count:16];
    }
    while (v30);
  }

  return v27;
}

- (void)reloadQueue
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  unint64_t v3 = [(ISLanguageCarousel *)self items];
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
  {
    int v27 = 136315394;
    uint64_t v28 = "-[ISLanguageCarousel reloadQueue]";
    __int16 v29 = 1024;
    LODWORD(v30) = [(ISLanguageCarousel *)self cycle];
    _os_log_impl(&dword_1E420E000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "%s: cycle = %d", (uint8_t *)&v27, 0x12u);
  }
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
  {
    BOOL v4 = [(ISLanguageCarousel *)self mergeDuplicates];
    int v27 = 136315394;
    uint64_t v28 = "-[ISLanguageCarousel reloadQueue]";
    __int16 v29 = 1024;
    LODWORD(v30) = v4;
    _os_log_impl(&dword_1E420E000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "%s: mergedDuplicates = %d", (uint8_t *)&v27, 0x12u);
  }
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
  {
    BOOL v5 = [(ISLanguageCarousel *)self randomize];
    int v27 = 136315394;
    uint64_t v28 = "-[ISLanguageCarousel reloadQueue]";
    __int16 v29 = 1024;
    LODWORD(v30) = v5;
    _os_log_impl(&dword_1E420E000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "%s: randomize = %d", (uint8_t *)&v27, 0x12u);
  }
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
  {
    BOOL v6 = [(ISLanguageCarousel *)self rankingUsesGuessedRegion];
    int v27 = 136315394;
    uint64_t v28 = "-[ISLanguageCarousel reloadQueue]";
    __int16 v29 = 1024;
    LODWORD(v30) = v6;
    _os_log_impl(&dword_1E420E000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "%s: rankingUsesGuessedRegion = %d", (uint8_t *)&v27, 0x12u);
  }
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
  {
    BOOL v7 = [(ISLanguageCarousel *)self rankingUsesPreferredLanguages];
    int v27 = 136315394;
    uint64_t v28 = "-[ISLanguageCarousel reloadQueue]";
    __int16 v29 = 1024;
    LODWORD(v30) = v7;
    _os_log_impl(&dword_1E420E000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "%s: rankingUsesPreferredLanguages = %d", (uint8_t *)&v27, 0x12u);
  }
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
  {
    BOOL v8 = [(ISLanguageCarousel *)self weightedRepetition];
    int v27 = 136315394;
    uint64_t v28 = "-[ISLanguageCarousel reloadQueue]";
    __int16 v29 = 1024;
    LODWORD(v30) = v8;
    _os_log_impl(&dword_1E420E000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "%s: weightedRepetition = %d", (uint8_t *)&v27, 0x12u);
  }
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v9 = [v3 count];
    id v10 = [v3 valueForKey:@"languageIdentifier"];
    id v11 = [v10 componentsJoinedByString:@","];
    int v27 = 136315650;
    uint64_t v28 = "-[ISLanguageCarousel reloadQueue]";
    __int16 v29 = 2048;
    uint64_t v30 = v9;
    __int16 v31 = 2114;
    uint64_t v32 = v11;
    _os_log_impl(&dword_1E420E000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "%s: items (%lu) = [%{public}@]", (uint8_t *)&v27, 0x20u);
  }
  if ([v3 count])
  {
    if ([(ISLanguageCarousel *)self mergeDuplicates])
    {
      id v12 = [(ISLanguageCarousel *)self _itemsWithMergedDuplicates:v3];

      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v13 = [v12 count];
        uint64_t v14 = [v12 valueForKey:@"languageIdentifier"];
        uint64_t v15 = [v14 componentsJoinedByString:@","];
        int v27 = 136315650;
        uint64_t v28 = "-[ISLanguageCarousel reloadQueue]";
        __int16 v29 = 2048;
        uint64_t v30 = v13;
        __int16 v31 = 2114;
        uint64_t v32 = v15;
        _os_log_impl(&dword_1E420E000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "%s: itemsWithMergedDuplicates (%lu) = [%{public}@]", (uint8_t *)&v27, 0x20u);
      }
      unint64_t v3 = v12;
    }
    [(ISLanguageCarousel *)self setQueueIndex:0];
    if ([(ISLanguageCarousel *)self randomize])
    {
      id v16 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(v3, "count"));
      uint64_t v17 = (void *)[v3 mutableCopy];
      v18 = v17;
      while ([v17 count])
      {
        uint64_t v19 = arc4random_uniform([v18 count]);
        v20 = [v18 objectAtIndexedSubscript:v19];
        [v16 addObject:v20];

        [v18 removeObjectAtIndex:v19];
        uint64_t v17 = v18;
      }
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v24 = [v16 count];
        uint64_t v25 = [v16 valueForKey:@"languageIdentifier"];
        v26 = [v25 componentsJoinedByString:@","];
        int v27 = 136315650;
        uint64_t v28 = "-[ISLanguageCarousel reloadQueue]";
        __int16 v29 = 2048;
        uint64_t v30 = v24;
        __int16 v31 = 2114;
        uint64_t v32 = v26;
        _os_log_impl(&dword_1E420E000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "%s: randomizedItems (%lu) = [%{public}@]", (uint8_t *)&v27, 0x20u);
      }
      [(ISLanguageCarousel *)self setQueue:v16];
    }
    else
    {
      id v16 = objc_msgSend((id)objc_opt_class(), "_rankedItems:usePreferredLanguages:guessedRegion:", v3, -[ISLanguageCarousel rankingUsesPreferredLanguages](self, "rankingUsesPreferredLanguages"), -[ISLanguageCarousel rankingUsesGuessedRegion](self, "rankingUsesGuessedRegion"));
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v21 = [v16 count];
        id v22 = [v16 valueForKey:@"languageIdentifier"];
        v23 = [v22 componentsJoinedByString:@","];
        int v27 = 136315650;
        uint64_t v28 = "-[ISLanguageCarousel reloadQueue]";
        __int16 v29 = 2048;
        uint64_t v30 = v21;
        __int16 v31 = 2114;
        uint64_t v32 = v23;
        _os_log_impl(&dword_1E420E000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "%s: rankedItems (%lu) = [%{public}@]", (uint8_t *)&v27, 0x20u);
      }
      [(ISLanguageCarousel *)self setQueue:v16];
    }
  }
  else
  {
    [(ISLanguageCarousel *)self setQueue:v3];
  }
}

- (void)setItems:(id)a3
{
  objc_storeStrong((id *)&self->_items, a3);

  [(ISLanguageCarousel *)self reloadQueue];
}

- (void)setMergeDuplicates:(BOOL)a3
{
  self->_mergeDuplicates = a3;
  [(ISLanguageCarousel *)self reloadQueue];
}

- (void)setRandomize:(BOOL)a3
{
  self->_randomize = a3;
  [(ISLanguageCarousel *)self reloadQueue];
}

- (void)setRankingUsesGuessedRegion:(BOOL)a3
{
  self->_rankingUsesGuessedRegion = a3;
  [(ISLanguageCarousel *)self reloadQueue];
}

- (void)setRankingUsesPreferredLanguages:(BOOL)a3
{
  self->_rankingUsesPreferredLanguages = a3;
  [(ISLanguageCarousel *)self reloadQueue];
}

- (void)setWeightedRepetition:(BOOL)a3
{
  self->_weightedRepetition = a3;
  [(ISLanguageCarousel *)self reloadQueue];
}

- (NSArray)items
{
  return self->_items;
}

- (BOOL)cycle
{
  return self->_cycle;
}

- (void)setCycle:(BOOL)a3
{
  self->_cycle = a3;
}

- (BOOL)mergeDuplicates
{
  return self->_mergeDuplicates;
}

- (BOOL)randomize
{
  return self->_randomize;
}

- (BOOL)rankingUsesGuessedRegion
{
  return self->_rankingUsesGuessedRegion;
}

- (BOOL)rankingUsesPreferredLanguages
{
  return self->_rankingUsesPreferredLanguages;
}

- (BOOL)weightedRepetition
{
  return self->_weightedRepetition;
}

- (NSArray)queue
{
  return self->_queue;
}

- (void)setQueue:(id)a3
{
}

- (unint64_t)queueIndex
{
  return self->_queueIndex;
}

- (void)setQueueIndex:(unint64_t)a3
{
  self->_queueIndex = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queue, 0);

  objc_storeStrong((id *)&self->_items, 0);
}

+ (void)rankedItemsFromItems:usingSystemLanguages:preferredLanguages:region:.cold.1()
{
}

+ (void)rankedItemsFromItems:usingSystemLanguages:preferredLanguages:region:.cold.2()
{
}

@end