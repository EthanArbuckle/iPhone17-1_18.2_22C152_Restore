@interface BMRuleExtractor
- (BMRuleExtractor)initWithPatterns:(id)a3 items:(id)a4 basketCount:(unint64_t)a5;
- (BOOL)shouldStop;
- (NSArray)items;
- (NSMutableDictionary)patterns;
- (id)itemSetForItemIndexSet:(id)a3;
- (id)subsetsOfItemset:(id)a3;
- (unint64_t)basketCount;
- (unint64_t)supportOfItemSet:(id)a3;
- (void)extractRulesWithMinSupport:(unint64_t)a3 minConfidence:(double)a4 targetTypes:(id)a5 batchSize:(unint64_t)a6 currentDate:(id)a7 datedBaskets:(id)a8 handler:(id)a9;
- (void)extractRulesWithMinSupport:(unint64_t)a3 minConfidence:(double)a4 targetTypes:(id)a5 batchSize:(unint64_t)a6 handler:(id)a7;
- (void)setItems:(id)a3;
- (void)setPatterns:(id)a3;
- (void)setShouldStop:(BOOL)a3;
- (void)terminateEarly;
@end

@implementation BMRuleExtractor

- (BMRuleExtractor)initWithPatterns:(id)a3 items:(id)a4 basketCount:(unint64_t)a5
{
  id v8 = a3;
  id v9 = a4;
  v22.receiver = self;
  v22.super_class = (Class)BMRuleExtractor;
  v10 = [(BMRuleExtractor *)&v22 init];
  if (v10)
  {
    v11 = objc_msgSend(objc_alloc(MEMORY[0x263EFF980]), "initWithCapacity:", objc_msgSend(v9, "count"));
    if ([v9 count])
    {
      unint64_t v12 = 0;
      do
      {
        v13 = [v9 objectAtIndexedSubscript:v12];
        v14 = (void *)[v13 copy];

        v15 = (void *)[objc_alloc(MEMORY[0x263F088D0]) initWithIndex:v12];
        v16 = [v8 objectForKeyedSubscript:v15];
        objc_msgSend(v14, "setAbsoluteSupport:", objc_msgSend(v16, "unsignedIntegerValue"));
        [v11 addObject:v14];

        ++v12;
      }
      while (v12 < [v9 count]);
    }
    uint64_t v17 = [v8 mutableCopy];
    patterns = v10->_patterns;
    v10->_patterns = (NSMutableDictionary *)v17;

    uint64_t v19 = [v11 copy];
    items = v10->_items;
    v10->_items = (NSArray *)v19;

    v10->_basketCount = a5;
    v10->_shouldStop = 0;
  }
  return v10;
}

- (void)terminateEarly
{
}

- (id)subsetsOfItemset:(id)a3
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  id v3 = a3;
  v4 = [MEMORY[0x263EFF9C0] set];
  uint64_t v5 = [v3 firstIndex];
  if (v5 != 0x7FFFFFFFFFFFFFFFLL)
  {
    uint64_t v6 = v5;
    do
    {
      v7 = [MEMORY[0x263EFF9C0] set];
      long long v18 = 0u;
      long long v19 = 0u;
      long long v20 = 0u;
      long long v21 = 0u;
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
            v13 = (void *)[*(id *)(*((void *)&v18 + 1) + 8 * i) mutableCopy];
            [v13 addIndex:v6];
            v14 = (void *)[v13 copy];
            [v7 addObject:v14];
          }
          uint64_t v10 = [v8 countByEnumeratingWithState:&v18 objects:v22 count:16];
        }
        while (v10);
      }

      v15 = (void *)[objc_alloc(MEMORY[0x263F088D0]) initWithIndex:v6];
      [v8 addObject:v15];

      v16 = [v7 allObjects];
      [v8 addObjectsFromArray:v16];

      uint64_t v6 = [v3 indexGreaterThanIndex:v6];
    }
    while (v6 != 0x7FFFFFFFFFFFFFFFLL);
  }

  return v4;
}

- (unint64_t)supportOfItemSet:(id)a3
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  id v4 = a3;
  uint64_t v5 = [(BMRuleExtractor *)self patterns];
  uint64_t v6 = [v5 objectForKeyedSubscript:v4];

  if (v6)
  {
    unint64_t v7 = [v6 unsignedIntegerValue];
  }
  else
  {
    long long v21 = 0u;
    long long v22 = 0u;
    long long v19 = 0u;
    long long v20 = 0u;
    id v8 = [(BMRuleExtractor *)self patterns];
    uint64_t v9 = [v8 countByEnumeratingWithState:&v19 objects:v23 count:16];
    if (v9)
    {
      uint64_t v10 = v9;
      unint64_t v7 = 0;
      uint64_t v11 = *(void *)v20;
      do
      {
        for (uint64_t i = 0; i != v10; ++i)
        {
          if (*(void *)v20 != v11) {
            objc_enumerationMutation(v8);
          }
          v13 = *(void **)(*((void *)&v19 + 1) + 8 * i);
          if ([v13 containsIndexes:v4])
          {
            v14 = [(BMRuleExtractor *)self patterns];
            v15 = [v14 objectForKey:v13];
            v7 += [v15 integerValue];
          }
        }
        uint64_t v10 = [v8 countByEnumeratingWithState:&v19 objects:v23 count:16];
      }
      while (v10);
    }
    else
    {
      unint64_t v7 = 0;
    }

    v16 = [NSNumber numberWithUnsignedInteger:v7];
    uint64_t v17 = [(BMRuleExtractor *)self patterns];
    [v17 setObject:v16 forKeyedSubscript:v4];
  }
  return v7;
}

- (id)itemSetForItemIndexSet:(id)a3
{
  id v4 = a3;
  id v5 = objc_alloc_init(MEMORY[0x263EFF9C0]);
  uint64_t v6 = [v4 firstIndex];
  if (v6 != 0x7FFFFFFFFFFFFFFFLL)
  {
    for (uint64_t i = v6; i != 0x7FFFFFFFFFFFFFFFLL; uint64_t i = [v4 indexGreaterThanIndex:i])
    {
      id v8 = [(BMRuleExtractor *)self items];
      uint64_t v9 = [v8 objectAtIndexedSubscript:i];
      [v5 addObject:v9];
    }
  }
  uint64_t v10 = (void *)[v5 copy];

  return v10;
}

- (void)extractRulesWithMinSupport:(unint64_t)a3 minConfidence:(double)a4 targetTypes:(id)a5 batchSize:(unint64_t)a6 handler:(id)a7
{
}

- (void)extractRulesWithMinSupport:(unint64_t)a3 minConfidence:(double)a4 targetTypes:(id)a5 batchSize:(unint64_t)a6 currentDate:(id)a7 datedBaskets:(id)a8 handler:(id)a9
{
  uint64_t v127 = *MEMORY[0x263EF8340];
  id v16 = a5;
  id v17 = a7;
  id v18 = a8;
  long long v19 = (void (**)(id, void *))a9;
  if (v19)
  {
    unint64_t v90 = a6;
    long long v20 = [MEMORY[0x263F089C8] indexSet];
    long long v21 = [(BMRuleExtractor *)self items];
    v121[0] = MEMORY[0x263EF8330];
    v121[1] = 3221225472;
    v121[2] = __115__BMRuleExtractor_extractRulesWithMinSupport_minConfidence_targetTypes_batchSize_currentDate_datedBaskets_handler___block_invoke;
    v121[3] = &unk_264546860;
    id v122 = v16;
    id v22 = v20;
    id v123 = v22;
    [v21 enumerateObjectsUsingBlock:v121];

    v86 = v22;
    uint64_t v97 = [v22 copy];
    v96 = [MEMORY[0x263EFF9C0] set];
    v103 = self;
    uint64_t v23 = [(BMRuleExtractor *)self patterns];
    uint64_t v24 = (void *)[v23 copy];

    long long v119 = 0u;
    long long v120 = 0u;
    long long v117 = 0u;
    long long v118 = 0u;
    id v25 = v24;
    uint64_t v87 = [v25 countByEnumeratingWithState:&v117 objects:v126 count:16];
    if (v87)
    {
      uint64_t v26 = *(void *)v118;
      double v27 = (double)a3;
      v28 = v103;
      id v83 = v17;
      id v84 = v16;
      id v85 = v18;
      v89 = v19;
      id v82 = v25;
      uint64_t v81 = *(void *)v118;
      do
      {
        uint64_t v29 = 0;
        do
        {
          if (*(void *)v118 != v26)
          {
            uint64_t v30 = v29;
            objc_enumerationMutation(v25);
            uint64_t v29 = v30;
          }
          uint64_t v91 = v29;
          v31 = *(void **)(*((void *)&v117 + 1) + 8 * v29);
          v95 = (void *)MEMORY[0x223C621B0]();
          v32 = [(BMRuleExtractor *)v28 patterns];
          v33 = [v32 objectForKey:v31];
          [v33 doubleValue];
          double v35 = v34;

          if (v35 >= v27)
          {
            v37 = [(BMRuleExtractor *)v28 subsetsOfItemset:v31];
            long long v113 = 0u;
            long long v114 = 0u;
            long long v115 = 0u;
            long long v116 = 0u;
            id obj = v37;
            v36 = (void *)v97;
            uint64_t v105 = [obj countByEnumeratingWithState:&v113 objects:v125 count:16];
            if (v105)
            {
              v38 = v31;
              uint64_t v104 = *(void *)v114;
              v88 = v31;
              unint64_t v39 = v90;
              do
              {
                uint64_t v40 = 0;
                do
                {
                  if (*(void *)v114 != v104) {
                    objc_enumerationMutation(obj);
                  }
                  uint64_t v41 = *(void *)(*((void *)&v113 + 1) + 8 * v40);
                  v42 = (void *)MEMORY[0x223C621B0]();
                  if ([(BMRuleExtractor *)v28 shouldStop])
                  {
                    id v17 = v83;
                    id v16 = v84;
                    v78 = v95;
                    v80 = v96;
                    id v25 = v82;
                    goto LABEL_51;
                  }
                  context = v42;
                  v43 = (void *)[v38 mutableCopy];
                  [v43 removeIndexes:v41];
                  if ([v43 count])
                  {
                    v44 = (void *)[v43 mutableCopy];
                    [v44 removeIndexes:v36];
                    v106 = v44;
                    if ([v44 count]
                      || (unint64_t v45 = [(BMRuleExtractor *)v28 supportOfItemSet:v41],
                          double v46 = v35 / (double)v45,
                          v46 < a4))
                    {
                      v47 = v44;
                    }
                    else
                    {
                      unint64_t v94 = v45;
                      unint64_t v92 = [(BMRuleExtractor *)v28 basketCount];
                      uint64_t v93 = [(BMRuleExtractor *)v28 supportOfItemSet:v43];
                      if (v18)
                      {
                        id v101 = objc_alloc_init(MEMORY[0x263EFF9C0]);
                        id v98 = objc_alloc_init(MEMORY[0x263EFF9C0]);
                        v48 = (void *)MEMORY[0x263EFF9C0];
                        v49 = [(BMRuleExtractor *)v28 itemSetForItemIndexSet:v41];
                        v50 = [v48 setWithSet:v49];

                        v51 = [(BMRuleExtractor *)v28 itemSetForItemIndexSet:v43];
                        v107 = v50;
                        [v50 unionSet:v51];

                        v100 = [MEMORY[0x263EFF910] now];
                        long long v109 = 0u;
                        long long v110 = 0u;
                        long long v111 = 0u;
                        long long v112 = 0u;
                        id v102 = v18;
                        uint64_t v52 = [v102 countByEnumeratingWithState:&v109 objects:v124 count:16];
                        if (v52)
                        {
                          uint64_t v53 = v52;
                          uint64_t v54 = *(void *)v110;
                          while (2)
                          {
                            for (uint64_t i = 0; i != v53; ++i)
                            {
                              if (*(void *)v110 != v54) {
                                objc_enumerationMutation(v102);
                              }
                              v56 = *(void **)(*((void *)&v109 + 1) + 8 * i);
                              if ([(BMRuleExtractor *)v28 shouldStop])
                              {

                                int v69 = 0;
                                uint64_t v66 = 0;
                                uint64_t v68 = 0;
                                v67 = v101;
                                v65 = v98;
                                goto LABEL_37;
                              }
                              v57 = [v56 basket];
                              int v58 = [v107 isSubsetOfSet:v57];

                              if (v58)
                              {
                                v59 = [MEMORY[0x263EFF8F0] currentCalendar];
                                v60 = [v56 date];
                                v61 = [v59 components:28 fromDate:v60];

                                [v101 addObject:v61];
                                v62 = [v56 date];
                                [v100 timeIntervalSinceDate:v62];
                                double v64 = v63;

                                if (v64 < 604800.0) {
                                  [v98 addObject:v61];
                                }

                                v28 = v103;
                              }
                            }
                            uint64_t v53 = [v102 countByEnumeratingWithState:&v109 objects:v124 count:16];
                            if (v53) {
                              continue;
                            }
                            break;
                          }
                        }

                        v65 = v98;
                        uint64_t v66 = [v98 count];
                        v67 = v101;
                        uint64_t v68 = [v101 count];
                        int v69 = 1;
LABEL_37:

                        id v18 = v85;
                        unint64_t v39 = v90;
                        if (!v69)
                        {
                          v80 = v96;
                          long long v19 = v89;
                          goto LABEL_59;
                        }
                      }
                      else
                      {
                        uint64_t v66 = 0;
                        uint64_t v68 = 0;
                      }
                      v70 = [BMRule alloc];
                      v71 = [(BMRuleExtractor *)v103 itemSetForItemIndexSet:v41];
                      v72 = [(BMRuleExtractor *)v103 itemSetForItemIndexSet:v43];
                      v73 = [(BMRule *)v70 initWithAntecedent:v71 consequent:v72 support:[(BMRuleExtractor *)v103 basketCount] confidence:(unint64_t)v35 basketCount:v94 absoluteSupport:v93 absoluteAntecedentSupport:v35 / (double)v92 absoluteConsequentSupport:v46 uniqueDaysLastWeek:v66 uniqueDaysTotal:v68];

                      [v96 addObject:v73];
                      if ([v96 count] >= v39)
                      {
                        v74 = (void *)[v96 copy];
                        long long v19 = v89;
                        int v75 = ((uint64_t (*)(void, void *))v89[2])(v89, v74);

                        uint64_t v76 = [MEMORY[0x263EFF9C0] set];

                        if (v75)
                        {

                          v80 = (void *)v76;
LABEL_59:

                          id v17 = v83;
                          id v16 = v84;
                          v36 = (void *)v97;
                          id v25 = v82;
                          v78 = v95;
                          v42 = context;
LABEL_51:

                          v79 = v25;
                          goto LABEL_55;
                        }
                        v96 = (void *)v76;
                      }
                      else
                      {
                        long long v19 = v89;
                      }
                      v47 = v106;

                      v36 = (void *)v97;
                      v28 = v103;
                      v38 = v88;
                    }
                  }
                  ++v40;
                }
                while (v40 != v105);
                uint64_t v77 = [obj countByEnumeratingWithState:&v113 objects:v125 count:16];
                uint64_t v105 = v77;
              }
              while (v77);
            }

            id v17 = v83;
            id v16 = v84;
            id v25 = v82;
            uint64_t v26 = v81;
          }
          else
          {
            v36 = (void *)v97;
          }
          uint64_t v29 = v91 + 1;
        }
        while (v91 + 1 != v87);
        uint64_t v87 = [v25 countByEnumeratingWithState:&v117 objects:v126 count:16];
      }
      while (v87);
    }
    else
    {
      v36 = (void *)v97;
    }

    v80 = v96;
    if ([v96 count])
    {
      v79 = (void *)[v96 copy];
      v19[2](v19, v79);
LABEL_55:
    }
  }
}

void __115__BMRuleExtractor_extractRulesWithMinSupport_minConfidence_targetTypes_batchSize_currentDate_datedBaskets_handler___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v5 = *(void **)(a1 + 32);
  uint64_t v6 = [a2 type];
  LODWORD(v5) = [v5 containsObject:v6];

  if (v5)
  {
    unint64_t v7 = *(void **)(a1 + 40);
    [v7 addIndex:a3];
  }
}

- (NSMutableDictionary)patterns
{
  return self->_patterns;
}

- (void)setPatterns:(id)a3
{
}

- (NSArray)items
{
  return self->_items;
}

- (void)setItems:(id)a3
{
}

- (unint64_t)basketCount
{
  return self->_basketCount;
}

- (BOOL)shouldStop
{
  return self->_shouldStop;
}

- (void)setShouldStop:(BOOL)a3
{
  self->_shouldStop = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_items, 0);

  objc_storeStrong((id *)&self->_patterns, 0);
}

@end