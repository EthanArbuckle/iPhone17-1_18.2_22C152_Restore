@interface DDResultCluster
+ (id)clustersWithDDResults:(id)a3 mlResults:(id)a4;
- (__DDResult)resolvedDDResultFromOriginalQuery:(__DDScanQuery *)a3 mlSupportedTypes:(__CFArray *)a4;
- (void)addDDResult:(__DDResult *)a3;
- (void)setMLResult:(id)a3;
@end

@implementation DDResultCluster

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_MLResult, 0);

  objc_storeStrong((id *)&self->_DDResults, 0);
}

- (__DDResult)resolvedDDResultFromOriginalQuery:(__DDScanQuery *)a3 mlSupportedTypes:(__CFArray *)a4
{
  uint64_t v50 = *MEMORY[0x1E4F143B8];
  uint64_t v7 = [(NSMutableArray *)self->_DDResults count];
  v39 = self;
  MLResult = self->_MLResult;
  if (v7)
  {
    if (MLResult)
    {
      v37 = a3;
      long long v46 = 0u;
      long long v47 = 0u;
      long long v44 = 0u;
      long long v45 = 0u;
      v9 = self->_DDResults;
      uint64_t v10 = [(NSMutableArray *)v9 countByEnumeratingWithState:&v44 objects:v49 count:16];
      if (v10)
      {
        uint64_t v11 = v10;
        v12 = 0;
        v38 = 0;
        uint64_t v13 = *(void *)v45;
        uint64_t v14 = -1;
        uint64_t v15 = -1;
        do
        {
          for (uint64_t i = 0; i != v11; ++i)
          {
            if (*(void *)v45 != v13) {
              objc_enumerationMutation(v9);
            }
            uint64_t v17 = *(void *)(*((void *)&v44 + 1) + 8 * i);
            int v18 = [(DDMLResult *)v39->_MLResult classification];
            if (v18 == 10 || DDMLClassificationForType(v17) != v18)
            {
              if (!DDResultTypeIsMLSupported(v17, a4) && *(void *)(v17 + 48) > v14)
              {
                uint64_t v14 = *(void *)(v17 + 48);
                v12 = (__DDResult *)v17;
              }
            }
            else
            {
              uint64_t v19 = *(void *)(v17 + 48);
              BOOL v20 = v19 <= v15;
              if (v19 > v15) {
                uint64_t v15 = *(void *)(v17 + 48);
              }
              uint64_t v21 = (uint64_t)v38;
              if (!v20) {
                uint64_t v21 = v17;
              }
              v38 = (__DDResult *)v21;
            }
          }
          uint64_t v11 = [(NSMutableArray *)v9 countByEnumeratingWithState:&v44 objects:v49 count:16];
        }
        while (v11);
      }
      else
      {
        v12 = 0;
        v38 = 0;
      }

      a3 = v37;
      if (v38) {
        v26 = v38;
      }
      else {
        v26 = v12;
      }
    }
    else
    {
      long long v42 = 0u;
      long long v43 = 0u;
      long long v40 = 0u;
      long long v41 = 0u;
      v23 = self->_DDResults;
      uint64_t v24 = [(NSMutableArray *)v23 countByEnumeratingWithState:&v40 objects:v48 count:16];
      if (v24)
      {
        uint64_t v25 = v24;
        v26 = 0;
        uint64_t v27 = *(void *)v41;
        uint64_t v28 = -1;
        do
        {
          for (uint64_t j = 0; j != v25; ++j)
          {
            if (*(void *)v41 != v27) {
              objc_enumerationMutation(v23);
            }
            uint64_t v30 = *(void *)(*((void *)&v40 + 1) + 8 * j);
            if (!DDResultTypeIsMLSupported(v30, a4) && *(void *)(v30 + 48) > v28)
            {
              uint64_t v28 = *(void *)(v30 + 48);
              v26 = (__DDResult *)v30;
            }
          }
          uint64_t v25 = [(NSMutableArray *)v23 countByEnumeratingWithState:&v40 objects:v48 count:16];
        }
        while (v25);
      }
      else
      {
        v26 = 0;
      }
    }
    v31 = v39->_MLResult;
    if (!v26) {
      return [(DDMLResult *)v31 ddResultFromQuery:a3];
    }
    if (v31)
    {
      if (!CFStringHasSuffix(v26->var5, @"MLCandidate"))
      {
        int64_t var0 = v26->var2.var0;
        int64_t var1 = v26->var2.var1;
        uint64_t v34 = var0 - [(DDMLResult *)v39->_MLResult range];
        uint64_t v35 = [(DDMLResult *)v39->_MLResult range];
        [(DDMLResult *)v39->_MLResult range];
        DDResultExpandRange(v26, (uint64_t)a3, v34, v35 - (var0 + var1) + v36);
        return v26;
      }
      v31 = v39->_MLResult;
      return [(DDMLResult *)v31 ddResultFromQuery:a3];
    }
    if (+[DDMLResult shouldKeepResultOfType:v26->var5]) {
      return v26;
    }
    return 0;
  }
  if (!MLResult) {
    return 0;
  }

  return [(DDMLResult *)MLResult ddResultFromQuery:a3];
}

- (void)setMLResult:(id)a3
{
  id v14 = a3;
  if (self->_DDRange.length < 1) {
    goto LABEL_11;
  }
  uint64_t v5 = [v14 range];
  int64_t location = self->_DDRange.location;
  if (location <= v5) {
    int64_t v8 = v5;
  }
  else {
    int64_t v8 = self->_DDRange.location;
  }
  int64_t v9 = self->_DDRange.length + location;
  int64_t v10 = v5 + v6;
  uint64_t v11 = v14;
  if (v9 >= v10) {
    int64_t v9 = v10;
  }
  BOOL v12 = v9 <= v8;
  uint64_t v13 = v9 - v8;
  if (v12) {
    uint64_t v13 = 0;
  }
  if (v13 >= 1)
  {
LABEL_11:
    objc_storeStrong((id *)&self->_MLResult, a3);
    uint64_t v11 = v14;
  }
}

- (void)addDDResult:(__DDResult *)a3
{
  if (self->_DDResults)
  {
    if (self->_DDRange.location == DDResultGetRangeForURLification((uint64_t)a3) && self->_DDRange.length == v5)
    {
      DDResults = self->_DDResults;
      [(NSMutableArray *)DDResults addObject:a3];
    }
  }
  else
  {
    uint64_t v7 = [MEMORY[0x1E4F1CA48] arrayWithObject:a3];
    int64_t v8 = self->_DDResults;
    self->_DDResults = v7;

    self->_DDRange.int64_t location = DDResultGetRangeForURLification((uint64_t)a3);
    self->_DDRange.length = v9;
  }
}

+ (id)clustersWithDDResults:(id)a3 mlResults:(id)a4
{
  uint64_t v46 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  id v30 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  uint64_t v28 = v5;
  unint64_t v32 = [v5 count];
  uint64_t v27 = v6;
  unint64_t v31 = [v6 count];
  id v7 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  NSUInteger v8 = 0;
  int64_t v9 = 0;
  uint64_t v10 = 0;
  uint64_t v11 = 0;
  unint64_t v12 = 0;
  unint64_t v13 = 0;
  NSUInteger v37 = 0;
  NSUInteger range1 = 0x7FFFFFFFFFFFFFFFLL;
  unint64_t range1_8 = 0x7FFFFFFFFFFFFFFFLL;
  NSUInteger v40 = 0;
  unint64_t v36 = 0x7FFFFFFFFFFFFFFFLL;
  id v29 = v7;
  while (1)
  {
    if (!v11)
    {
      if (v13 >= v32)
      {
        uint64_t v11 = 0;
        if (v10) {
          goto LABEL_11;
        }
        goto LABEL_6;
      }
      uint64_t v11 = [v28 objectAtIndexedSubscript:v13];

      unint64_t v36 = *(void *)(v11 + 32);
      NSUInteger v37 = *(void *)(v11 + 40);
      ++v13;
    }
    if (v10) {
      goto LABEL_11;
    }
LABEL_6:
    if (v12 >= v31)
    {
      uint64_t v10 = 0;
    }
    else
    {
      uint64_t v10 = [v27 objectAtIndexedSubscript:v12];
      unint64_t range1_8 = [(id)v10 range];
      NSUInteger v40 = v14;
      ++v12;
    }
LABEL_11:
    BOOL v15 = (v11 | v10) != 0;
    if (!v11)
    {
      if (v10)
      {
        char v17 = 0;
        NSUInteger v18 = range1_8;
        NSUInteger v19 = v40;
        goto LABEL_30;
      }
LABEL_29:
      char v17 = 0;
      NSUInteger v19 = 0;
      NSUInteger v18 = 0x7FFFFFFFFFFFFFFFLL;
      goto LABEL_30;
    }
    if (v10) {
      BOOL v16 = v36 >= range1_8;
    }
    else {
      BOOL v16 = 0;
    }
    char v17 = !v16;
    if (v17) {
      NSUInteger v18 = v36;
    }
    else {
      NSUInteger v18 = range1_8;
    }
    if (v17) {
      NSUInteger v19 = v37;
    }
    else {
      NSUInteger v19 = v40;
    }
    if ((v17 & 1) == 0 && !v10) {
      goto LABEL_29;
    }
LABEL_30:
    if (v9)
    {
      v47.int64_t location = range1;
      v47.length = v8;
      v48.int64_t location = v18;
      v48.length = v19;
      if (!NSIntersectionRange(v47, v48).length)
      {
        NSUInteger v33 = v8;
        unint64_t v34 = v13;
        unint64_t v35 = v12;
        long long v43 = 0u;
        long long v44 = 0u;
        long long v41 = 0u;
        long long v42 = 0u;
        id v20 = v7;
        uint64_t v21 = [v20 countByEnumeratingWithState:&v41 objects:v45 count:16];
        if (v21)
        {
          uint64_t v22 = v21;
          uint64_t v23 = *(void *)v42;
          do
          {
            for (uint64_t i = 0; i != v22; ++i)
            {
              if (*(void *)v42 != v23) {
                objc_enumerationMutation(v20);
              }
              [(DDResultCluster *)v9 setMLResult:*(void *)(*((void *)&v41 + 1) + 8 * i)];
            }
            uint64_t v22 = [v20 countByEnumeratingWithState:&v41 objects:v45 count:16];
          }
          while (v22);
        }

        [v20 removeAllObjects];
        [v30 addObject:v9];

        int64_t v9 = 0;
        id v7 = v29;
        unint64_t v13 = v34;
        unint64_t v12 = v35;
        NSUInteger v8 = v33;
      }
      BOOL v15 = (v11 | v10) != 0;
    }
    if (!v15) {
      break;
    }
    if (v9)
    {
      if (v17) {
        goto LABEL_44;
      }
LABEL_46:
      [v7 addObject:v10];

      uint64_t v10 = 0;
    }
    else
    {
      int64_t v9 = objc_alloc_init(DDResultCluster);
      NSUInteger v8 = v19;
      NSUInteger range1 = v18;
      if ((v17 & 1) == 0) {
        goto LABEL_46;
      }
LABEL_44:
      [(DDResultCluster *)v9 addDDResult:v11];
      uint64_t v11 = 0;
    }
  }
  id v25 = v30;

  return v25;
}

@end