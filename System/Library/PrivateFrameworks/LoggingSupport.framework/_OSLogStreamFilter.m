@interface _OSLogStreamFilter
- (NSData)data;
- (_OSLogStreamFilter)initWithPredicate:(id)a3;
- (id)dictionaryForComparisonPredicate:(id)a3;
- (id)encodePredicate:(id)a3;
- (unint64_t)flagsForPredicate:(id)a3;
- (void)addCategory:(id)a3 flags:(unint64_t)a4 returningDict:(id *)a5;
- (void)addProcess:(id)a3 flags:(unint64_t)a4 returningDict:(id *)a5;
- (void)addProcessID:(id)a3 flags:(unint64_t)a4 returningDict:(id *)a5;
- (void)addProcessImagePath:(id)a3 flags:(unint64_t)a4 returningDict:(id *)a5;
- (void)addSubsystem:(id)a3 flags:(unint64_t)a4 returningDict:(id *)a5;
- (void)addUserID:(id)a3 flags:(unint64_t)a4 returningDict:(id *)a5;
- (void)processComparisonPredicate:(id)a3;
- (void)processLeftExpression:(id)a3 andRightExpression:(id)a4 flags:(unint64_t)a5;
- (void)processLeftExpression:(id)a3 andRightExpression:(id)a4 flags:(unint64_t)a5 returningDict:(id *)a6;
- (void)reduceFilter:(id)a3;
- (void)visitPredicate:(id)a3;
@end

@implementation _OSLogStreamFilter

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_categories, 0);
  objc_storeStrong((id *)&self->_subsystems, 0);
  objc_storeStrong((id *)&self->_uids, 0);
  objc_storeStrong((id *)&self->_processImagePaths, 0);
  objc_storeStrong((id *)&self->_processes, 0);
  objc_storeStrong((id *)&self->_pids, 0);
  objc_storeStrong((id *)&self->_filter, 0);
}

- (void)visitPredicate:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    [(_OSLogStreamFilter *)self processComparisonPredicate:v4];
  }
}

- (void)processComparisonPredicate:(id)a3
{
  id v4 = a3;
  id v7 = [v4 leftExpression];
  v5 = [v4 rightExpression];
  unint64_t v6 = [(_OSLogStreamFilter *)self flagsForPredicate:v4];

  [(_OSLogStreamFilter *)self processLeftExpression:v7 andRightExpression:v5 flags:v6];
  [(_OSLogStreamFilter *)self processLeftExpression:v5 andRightExpression:v7 flags:v6];
}

- (id)dictionaryForComparisonPredicate:(id)a3
{
  id v4 = a3;
  v5 = [v4 leftExpression];
  unint64_t v6 = [v4 rightExpression];
  unint64_t v7 = [(_OSLogStreamFilter *)self flagsForPredicate:v4];

  id v11 = 0;
  [(_OSLogStreamFilter *)self processLeftExpression:v5 andRightExpression:v6 flags:v7 returningDict:&v11];
  id v8 = v11;
  if (!v8)
  {
    id v10 = 0;
    [(_OSLogStreamFilter *)self processLeftExpression:v6 andRightExpression:v5 flags:v7 returningDict:&v10];
    id v8 = v10;
  }

  return v8;
}

- (unint64_t)flagsForPredicate:(id)a3
{
  uint64_t v3 = [a3 predicateOperatorType];
  return (unint64_t)(v3 - 8) < 2 || v3 == 99;
}

- (void)processLeftExpression:(id)a3 andRightExpression:(id)a4 flags:(unint64_t)a5
{
  [(_OSLogStreamFilter *)self processLeftExpression:a3 andRightExpression:a4 flags:a5 returningDict:0];
}

- (void)processLeftExpression:(id)a3 andRightExpression:(id)a4 flags:(unint64_t)a5 returningDict:(id *)a6
{
  id v13 = a3;
  id v10 = a4;
  if ([v13 expressionType] == 3)
  {
    id v11 = [v13 keyPath];
    if (([v11 isEqualToString:@"processID"] & 1) != 0
      || [v11 isEqualToString:@"processIdentifier"])
    {
      v12 = [v10 constantValue];
      [(_OSLogStreamFilter *)self addProcessID:v12 flags:a5 returningDict:a6];
    }
    else if ([v11 isEqualToString:@"process"])
    {
      v12 = [v10 constantValue];
      [(_OSLogStreamFilter *)self addProcess:v12 flags:a5 returningDict:a6];
    }
    else if ([v11 isEqualToString:@"processImagePath"])
    {
      v12 = [v10 constantValue];
      [(_OSLogStreamFilter *)self addProcessImagePath:v12 flags:a5 returningDict:a6];
    }
    else if (([v11 isEqualToString:@"userID"] & 1) != 0 {
           || [v11 isEqualToString:@"userIdentifier"])
    }
    {
      v12 = [v10 constantValue];
      [(_OSLogStreamFilter *)self addUserID:v12 flags:a5 returningDict:a6];
    }
    else if ([v11 isEqualToString:@"subsystem"])
    {
      v12 = [v10 constantValue];
      [(_OSLogStreamFilter *)self addSubsystem:v12 flags:a5 returningDict:a6];
    }
    else
    {
      if (![v11 isEqualToString:@"category"]) {
        goto LABEL_6;
      }
      v12 = [v10 constantValue];
      [(_OSLogStreamFilter *)self addCategory:v12 flags:a5 returningDict:a6];
    }

LABEL_6:
  }
}

- (void)addCategory:(id)a3 flags:(unint64_t)a4 returningDict:(id *)a5
{
  id v8 = a3;
  if ((unint64_t)a5 | (unint64_t)self->_filter)
  {
    id v17 = v8;
    if (a5)
    {
      v9 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
      id v10 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
      *a5 = v10;
    }
    else
    {
      categories = self->_categories;
      if (!categories)
      {
        v12 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
        id v13 = self->_categories;
        self->_categories = v12;

        categories = self->_categories;
      }
      v9 = categories;
      id v10 = self->_filter;
    }
    [(NSMutableDictionary *)v10 setObject:v9 forKeyedSubscript:@"category"];
    v14 = [(NSMutableDictionary *)v9 objectForKeyedSubscript:v17];
    uint64_t v15 = [v14 unsignedLongLongValue];

    v16 = [MEMORY[0x1E4F28ED0] numberWithUnsignedLongLong:v15 | a4];
    [(NSMutableDictionary *)v9 setObject:v16 forKeyedSubscript:v17];

    id v8 = v17;
  }
}

- (void)addSubsystem:(id)a3 flags:(unint64_t)a4 returningDict:(id *)a5
{
  id v8 = a3;
  if ((unint64_t)a5 | (unint64_t)self->_filter)
  {
    id v17 = v8;
    if (a5)
    {
      v9 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
      id v10 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
      *a5 = v10;
    }
    else
    {
      subsystems = self->_subsystems;
      if (!subsystems)
      {
        v12 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
        id v13 = self->_subsystems;
        self->_subsystems = v12;

        subsystems = self->_subsystems;
      }
      v9 = subsystems;
      id v10 = self->_filter;
    }
    [(NSMutableDictionary *)v10 setObject:v9 forKeyedSubscript:@"subsystem"];
    v14 = [(NSMutableDictionary *)v9 objectForKeyedSubscript:v17];
    uint64_t v15 = [v14 unsignedLongLongValue];

    v16 = [MEMORY[0x1E4F28ED0] numberWithUnsignedLongLong:v15 | a4];
    [(NSMutableDictionary *)v9 setObject:v16 forKeyedSubscript:v17];

    id v8 = v17;
  }
}

- (void)addUserID:(id)a3 flags:(unint64_t)a4 returningDict:(id *)a5
{
  id v8 = a3;
  if ((unint64_t)a5 | (unint64_t)self->_filter)
  {
    id v18 = v8;
    if (a5)
    {
      v9 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
      id v10 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
      *a5 = v10;
    }
    else
    {
      uids = self->_uids;
      if (!uids)
      {
        v12 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
        id v13 = self->_uids;
        self->_uids = v12;

        uids = self->_uids;
      }
      v9 = uids;
      id v10 = self->_filter;
    }
    [(NSMutableDictionary *)v10 setObject:v9 forKeyedSubscript:@"uid"];
    v14 = [v18 stringValue];
    uint64_t v15 = [(NSMutableDictionary *)v9 objectForKeyedSubscript:v14];
    uint64_t v16 = [v15 unsignedLongLongValue];

    id v17 = [MEMORY[0x1E4F28ED0] numberWithUnsignedLongLong:v16 | a4];
    [(NSMutableDictionary *)v9 setObject:v17 forKeyedSubscript:v14];

    id v8 = v18;
  }
}

- (void)addProcessImagePath:(id)a3 flags:(unint64_t)a4 returningDict:(id *)a5
{
  id v8 = a3;
  if ((unint64_t)a5 | (unint64_t)self->_filter)
  {
    id v17 = v8;
    if (a5)
    {
      v9 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
      id v10 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
      *a5 = v10;
    }
    else
    {
      processImagePaths = self->_processImagePaths;
      if (!processImagePaths)
      {
        v12 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
        id v13 = self->_processImagePaths;
        self->_processImagePaths = v12;

        processImagePaths = self->_processImagePaths;
      }
      v9 = processImagePaths;
      id v10 = self->_filter;
    }
    [(NSMutableDictionary *)v10 setObject:v9 forKeyedSubscript:@"processImagePath"];
    v14 = [(NSMutableDictionary *)v9 objectForKeyedSubscript:v17];
    uint64_t v15 = [v14 unsignedLongLongValue];

    uint64_t v16 = [MEMORY[0x1E4F28ED0] numberWithUnsignedLongLong:v15 | a4];
    [(NSMutableDictionary *)v9 setObject:v16 forKeyedSubscript:v17];

    id v8 = v17;
  }
}

- (void)addProcess:(id)a3 flags:(unint64_t)a4 returningDict:(id *)a5
{
  id v8 = a3;
  if ((unint64_t)a5 | (unint64_t)self->_filter)
  {
    id v17 = v8;
    if (a5)
    {
      v9 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
      id v10 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
      *a5 = v10;
    }
    else
    {
      processes = self->_processes;
      if (!processes)
      {
        v12 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
        id v13 = self->_processes;
        self->_processes = v12;

        processes = self->_processes;
      }
      v9 = processes;
      id v10 = self->_filter;
    }
    [(NSMutableDictionary *)v10 setObject:v9 forKeyedSubscript:@"process"];
    v14 = [(NSMutableDictionary *)v9 objectForKeyedSubscript:v17];
    uint64_t v15 = [v14 unsignedLongLongValue];

    uint64_t v16 = [MEMORY[0x1E4F28ED0] numberWithUnsignedLongLong:v15 | a4];
    [(NSMutableDictionary *)v9 setObject:v16 forKeyedSubscript:v17];

    id v8 = v17;
  }
}

- (void)addProcessID:(id)a3 flags:(unint64_t)a4 returningDict:(id *)a5
{
  id v8 = a3;
  if ((unint64_t)a5 | (unint64_t)self->_filter)
  {
    id v18 = v8;
    if (a5)
    {
      v9 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
      id v10 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
      *a5 = v10;
    }
    else
    {
      pids = self->_pids;
      if (!pids)
      {
        v12 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
        id v13 = self->_pids;
        self->_pids = v12;

        pids = self->_pids;
      }
      v9 = pids;
      id v10 = self->_filter;
    }
    [(NSMutableDictionary *)v10 setObject:v9 forKeyedSubscript:@"pid"];
    v14 = [v18 stringValue];
    uint64_t v15 = [(NSMutableDictionary *)v9 objectForKeyedSubscript:v14];
    uint64_t v16 = [v15 unsignedLongLongValue];

    id v17 = [MEMORY[0x1E4F28ED0] numberWithUnsignedLongLong:v16 | a4];
    [(NSMutableDictionary *)v9 setObject:v17 forKeyedSubscript:v14];

    id v8 = v18;
  }
}

- (NSData)data
{
  filter = self->_filter;
  if (filter)
  {
    filter = (void *)[filter count];
    if (filter)
    {
      filter = [MEMORY[0x1E4F28F98] dataWithPropertyList:self->_filter format:200 options:0 error:0];
    }
  }
  return (NSData *)filter;
}

- (void)reduceFilter:(id)a3
{
  uint64_t v85 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = [v4 objectForKeyedSubscript:@"logicalExp"];
  unint64_t v6 = v5;
  if (v5)
  {
    v60 = v4;
    v61 = v5;
    unint64_t v7 = [v5 objectForKeyedSubscript:@"subfilters"];
    long long v78 = 0u;
    long long v79 = 0u;
    long long v80 = 0u;
    long long v81 = 0u;
    uint64_t v8 = [v7 countByEnumeratingWithState:&v78 objects:v84 count:16];
    if (v8)
    {
      uint64_t v9 = v8;
      uint64_t v10 = *(void *)v79;
      do
      {
        for (uint64_t i = 0; i != v9; ++i)
        {
          if (*(void *)v79 != v10) {
            objc_enumerationMutation(v7);
          }
          [(_OSLogStreamFilter *)self reduceFilter:*(void *)(*((void *)&v78 + 1) + 8 * i)];
        }
        uint64_t v9 = [v7 countByEnumeratingWithState:&v78 objects:v84 count:16];
      }
      while (v9);
    }
    if ([v7 count])
    {
      unint64_t v12 = 0;
      do
      {
        id v13 = [v7 objectAtIndexedSubscript:v12];
        uint64_t v14 = [v13 count];

        if (!v14) {
          [v7 removeObjectAtIndex:v12--];
        }
        ++v12;
      }
      while (v12 < [v7 count]);
    }
    id v4 = v60;
    unint64_t v6 = v61;
    if ([v7 count])
    {
      uint64_t v15 = [v61 objectForKeyedSubscript:@"operator"];
      v64 = v7;
      if (!v15) {
        goto LABEL_36;
      }
      uint64_t v16 = v15;
      uint64_t v17 = [v15 unsignedIntegerValue];

      if (v17)
      {
        if (v17 == 1)
        {
          if ([v7 count])
          {
            unint64_t v18 = 0;
            do
            {
              v19 = [v7 objectAtIndexedSubscript:v18];
              v20 = [v19 objectForKeyedSubscript:@"logicalExp"];
              v21 = v20;
              if (v20)
              {
                v22 = [v20 objectForKeyedSubscript:@"operator"];
                if (v22)
                {
                  v23 = v22;
                  uint64_t v24 = [v22 unsignedIntegerValue];

                  if (v24 == 1)
                  {
                    v25 = [v21 objectForKeyedSubscript:@"subfilters"];
                    [v64 removeObjectAtIndex:v18--];
                    [v64 addObjectsFromArray:v25];
                  }
                }
              }

              ++v18;
              unint64_t v7 = v64;
            }
            while (v18 < [v64 count]);
          }
          id v4 = v60;
          unint64_t v6 = v61;
          if ([v7 count] != 1) {
            goto LABEL_70;
          }
          [v61 setObject:0 forKeyedSubscript:@"operator"];
          goto LABEL_36;
        }
      }
      else
      {
        v26 = [v7 objectAtIndexedSubscript:0];
        v27 = [v26 objectForKeyedSubscript:@"logicalExp"];
        if (!v27)
        {

          id v4 = v60;
LABEL_69:
          unint64_t v6 = v61;
          goto LABEL_70;
        }
        v28 = v27;
        v29 = [v27 objectForKeyedSubscript:@"operator"];
        uint64_t v17 = (uint64_t)v29;
        if (v29)
        {
          uint64_t v30 = [v29 unsignedIntegerValue];

          if (v30)
          {
            uint64_t v17 = 0;
          }
          else
          {
            v31 = [v28 objectForKeyedSubscript:@"subfilters"];
            v32 = [v31 objectAtIndexedSubscript:0];
            [v7 removeAllObjects];
            [v7 addObject:v32];
            [v61 setObject:0 forKeyedSubscript:@"operator"];

            uint64_t v17 = 2;
          }
        }
      }
      id v4 = v60;
      unint64_t v6 = v61;
      if (v17 == 2)
      {
LABEL_36:
        [v6 setObject:0 forKeyedSubscript:@"operator"];
        if ([v7 count])
        {
          id v67 = 0;
          unint64_t v33 = 0;
          do
          {
            v34 = [v7 objectAtIndexedSubscript:v33];
            v35 = [v34 objectForKeyedSubscript:@"logicalExp"];
            if (v35)
            {
              v36 = v35;
              v37 = [v35 objectForKeyedSubscript:@"operator"];
              if (!v37
                || (v38 = v37,
                    v39 = v34,
                    uint64_t v40 = [v37 unsignedIntegerValue],
                    v38,
                    BOOL v41 = v40 == 2,
                    v34 = v39,
                    v41))
              {
                v58 = v36;
                v42 = [v36 objectForKeyedSubscript:@"subfilters"];
                [v7 removeObjectAtIndex:v33--];
                [v7 addObjectsFromArray:v42];
              }
              else
              {
                v58 = v36;
              }
            }
            else
            {
              if (v67)
              {
                v62 = v34;
                unint64_t v63 = v33;
                long long v76 = 0u;
                long long v77 = 0u;
                long long v74 = 0u;
                long long v75 = 0u;
                obuint64_t j = v34;
                uint64_t v66 = [obj countByEnumeratingWithState:&v74 objects:v83 count:16];
                if (v66)
                {
                  uint64_t v65 = *(void *)v75;
                  do
                  {
                    uint64_t v43 = 0;
                    do
                    {
                      if (*(void *)v75 != v65) {
                        objc_enumerationMutation(obj);
                      }
                      uint64_t v69 = v43;
                      uint64_t v44 = *(void *)(*((void *)&v74 + 1) + 8 * v43);
                      v45 = [obj objectForKeyedSubscript:v44];
                      v46 = [v67 objectForKeyedSubscript:v44];
                      if (!v46)
                      {
                        v46 = objc_opt_new();
                        [v67 setObject:v46 forKeyedSubscript:v44];
                      }
                      long long v72 = 0u;
                      long long v73 = 0u;
                      long long v70 = 0u;
                      long long v71 = 0u;
                      id v47 = v45;
                      uint64_t v48 = [v47 countByEnumeratingWithState:&v70 objects:v82 count:16];
                      if (v48)
                      {
                        uint64_t v49 = v48;
                        uint64_t v50 = *(void *)v71;
                        do
                        {
                          for (uint64_t j = 0; j != v49; ++j)
                          {
                            if (*(void *)v71 != v50) {
                              objc_enumerationMutation(v47);
                            }
                            uint64_t v52 = *(void *)(*((void *)&v70 + 1) + 8 * j);
                            v53 = [v47 objectForKeyedSubscript:v52];
                            uint64_t v54 = [v53 unsignedLongLongValue];

                            v55 = [v46 objectForKeyedSubscript:v52];
                            uint64_t v56 = [v55 unsignedLongLongValue];

                            v57 = [MEMORY[0x1E4F28ED0] numberWithUnsignedLongLong:v56 | v54];
                            [v46 setObject:v57 forKeyedSubscript:v52];
                          }
                          uint64_t v49 = [v47 countByEnumeratingWithState:&v70 objects:v82 count:16];
                        }
                        while (v49);
                      }

                      uint64_t v43 = v69 + 1;
                    }
                    while (v69 + 1 != v66);
                    uint64_t v66 = [obj countByEnumeratingWithState:&v74 objects:v83 count:16];
                  }
                  while (v66);
                }

                unint64_t v7 = v64;
                [v64 removeObjectAtIndex:v63];
                unint64_t v33 = v63 - 1;
                v34 = v62;
              }
              else
              {
                id v67 = v34;
              }
              v58 = 0;
            }

            ++v33;
          }
          while (v33 < [v7 count]);
        }
        else
        {
          id v67 = 0;
        }
        id v4 = v60;
        if ([v7 count] == 1)
        {
          v59 = [v7 objectAtIndexedSubscript:0];
          [v60 removeAllObjects];
          [v60 addEntriesFromDictionary:v59];
        }
        goto LABEL_69;
      }
    }
    else
    {
      [v60 setObject:0 forKeyedSubscript:@"logicalExp"];
    }
LABEL_70:
  }
}

- (id)encodePredicate:(id)a3
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v5 = [(_OSLogStreamFilter *)self dictionaryForComparisonPredicate:v4];
  }
  else
  {
    id v5 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v6 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
      [v5 setObject:v6 forKeyedSubscript:@"logicalExp"];
      id v7 = v4;
      if ([v7 compoundPredicateType] != 2)
      {
        uint64_t v8 = objc_msgSend(MEMORY[0x1E4F28ED0], "numberWithUnsignedInteger:", objc_msgSend(v7, "compoundPredicateType"));
        [v6 setObject:v8 forKeyedSubscript:@"operator"];
      }
      uint64_t v9 = (void *)MEMORY[0x1E4F1CA48];
      uint64_t v10 = [v7 subpredicates];
      id v11 = objc_msgSend(v9, "arrayWithCapacity:", objc_msgSend(v10, "count"));

      v19 = v6;
      [v6 setObject:v11 forKeyedSubscript:@"subfilters"];
      long long v22 = 0u;
      long long v23 = 0u;
      long long v20 = 0u;
      long long v21 = 0u;
      unint64_t v12 = [v7 subpredicates];
      uint64_t v13 = [v12 countByEnumeratingWithState:&v20 objects:v24 count:16];
      if (v13)
      {
        uint64_t v14 = v13;
        uint64_t v15 = *(void *)v21;
        do
        {
          for (uint64_t i = 0; i != v14; ++i)
          {
            if (*(void *)v21 != v15) {
              objc_enumerationMutation(v12);
            }
            uint64_t v17 = [(_OSLogStreamFilter *)self encodePredicate:*(void *)(*((void *)&v20 + 1) + 8 * i)];
            if (v17) {
              [v11 addObject:v17];
            }
          }
          uint64_t v14 = [v12 countByEnumeratingWithState:&v20 objects:v24 count:16];
        }
        while (v14);
      }
    }
  }

  return v5;
}

- (_OSLogStreamFilter)initWithPredicate:(id)a3
{
  id v4 = a3;
  id v5 = getenv("LOG_USE_STREAMFILTER");
  if (v5 && !strcmp(v5, "0"))
  {
    uint64_t v13 = 0;
  }
  else
  {
    id v6 = [MEMORY[0x1E4F1CAD0] setWithArray:&unk_1EF44ABC8];
    id v7 = [MEMORY[0x1E4F1CAD0] setWithArray:&unk_1EF44ABE0];
    uint64_t v8 = [MEMORY[0x1E4F1CAD0] setWithArray:&unk_1EF44ABF8];
    v17.receiver = self;
    v17.super_class = (Class)_OSLogStreamFilter;
    uint64_t v9 = [(_OSLogStreamFilter *)&v17 init];
    if (v9)
    {
      uint64_t v10 = _OSLogGetSimplePredicate(v4, v6, v7, v8);
      if (requiresLogicalExpression(v10))
      {
        uint64_t v11 = [(_OSLogStreamFilter *)v9 encodePredicate:v10];
        filter = v9->_filter;
        v9->_filter = (NSMutableDictionary *)v11;

        [(_OSLogStreamFilter *)v9 reduceFilter:v9->_filter];
      }
      else
      {
        uint64_t v14 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
        uint64_t v15 = v9->_filter;
        v9->_filter = v14;

        [v10 acceptVisitor:v9 flags:0];
      }
    }
    self = v9;

    uint64_t v13 = self;
  }

  return v13;
}

@end