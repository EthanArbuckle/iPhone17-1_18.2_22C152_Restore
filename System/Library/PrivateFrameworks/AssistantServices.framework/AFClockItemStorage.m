@interface AFClockItemStorage
- (AFClockItemStorage)initWithIdentifier:(id)a3 delegate:(id)a4;
- (NSDate)date;
- (NSDictionary)itemsByID;
- (NSString)identifier;
- (id)itemWithID:(id)a3;
- (unint64_t)generation;
- (void)beginGrouping;
- (void)deleteAllItems;
- (void)deleteItemsWithIDs:(id)a3;
- (void)endGroupingWithOptions:(unint64_t)a3;
- (void)insertOrUpdateItems:(id)a3;
- (void)invalidate;
- (void)setDate:(id)a3;
- (void)setGeneration:(unint64_t)a3;
- (void)setItemsByID:(id)a3;
@end

@implementation AFClockItemStorage

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_itemsByID, 0);
  objc_storeStrong((id *)&self->_date, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_workingItemsByID, 0);
  objc_storeStrong((id *)&self->_workingDate, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

- (NSDictionary)itemsByID
{
  return self->_itemsByID;
}

- (NSDate)date
{
  return self->_date;
}

- (unint64_t)generation
{
  return self->_generation;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (void)invalidate
{
  objc_storeWeak((id *)&self->_delegate, 0);
  self->_groupingDepth = 0;
  self->_workingGeneration = 0;
  workingDate = self->_workingDate;
  self->_workingDate = 0;

  workingItemsByID = self->_workingItemsByID;
  self->_workingItemsByID = 0;

  date = self->_date;
  self->_generation = 0;
  self->_date = 0;

  itemsByID = self->_itemsByID;
  self->_itemsByID = 0;
}

- (void)deleteAllItems
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  v3 = AFSiriLogContextConnection;
  if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_INFO))
  {
    int v4 = 136315138;
    v5 = "-[AFClockItemStorage deleteAllItems]";
    _os_log_impl(&dword_19CF1D000, v3, OS_LOG_TYPE_INFO, "%s ", (uint8_t *)&v4, 0xCu);
  }
  [(AFClockItemStorage *)self beginGrouping];
  [(NSMutableDictionary *)self->_workingItemsByID removeAllObjects];
  [(AFClockItemStorage *)self endGroupingWithOptions:0];
}

- (void)deleteItemsWithIDs:(id)a3
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = AFSiriLogContextConnection;
  if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_INFO))
  {
    int v6 = 136315394;
    v7 = "-[AFClockItemStorage deleteItemsWithIDs:]";
    __int16 v8 = 2112;
    id v9 = v4;
    _os_log_impl(&dword_19CF1D000, v5, OS_LOG_TYPE_INFO, "%s itemIDs = %@", (uint8_t *)&v6, 0x16u);
  }
  if ([v4 count])
  {
    [(AFClockItemStorage *)self beginGrouping];
    [(NSMutableDictionary *)self->_workingItemsByID removeObjectsForKeys:v4];
    [(AFClockItemStorage *)self endGroupingWithOptions:0];
  }
}

- (void)insertOrUpdateItems:(id)a3
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = AFSiriLogContextConnection;
  if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    v19 = "-[AFClockItemStorage insertOrUpdateItems:]";
    __int16 v20 = 2112;
    id v21 = v4;
    _os_log_impl(&dword_19CF1D000, v5, OS_LOG_TYPE_INFO, "%s items = %@", buf, 0x16u);
  }
  if ([v4 count])
  {
    [(AFClockItemStorage *)self beginGrouping];
    long long v15 = 0u;
    long long v16 = 0u;
    long long v13 = 0u;
    long long v14 = 0u;
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
          v11 = *(void **)(*((void *)&v13 + 1) + 8 * i);
          v12 = objc_msgSend(v11, "itemID", (void)v13);
          if (v12) {
            [(NSMutableDictionary *)self->_workingItemsByID setObject:v11 forKey:v12];
          }
        }
        uint64_t v8 = [v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
      }
      while (v8);
    }

    [(AFClockItemStorage *)self endGroupingWithOptions:0];
  }
}

- (id)itemWithID:(id)a3
{
  uint64_t v3 = 72;
  if (self->_groupingDepth > 0) {
    uint64_t v3 = 40;
  }
  id v4 = [*(id *)((char *)&self->super.isa + v3) objectForKey:a3];
  return v4;
}

- (void)endGroupingWithOptions:(unint64_t)a3
{
  uint64_t v127 = *MEMORY[0x1E4F143B8];
  int64_t groupingDepth = self->_groupingDepth;
  id v4 = &_AFPreferencesReplacementLanguageForLocalRecognizerLanguageCode_onceToken;
  if (groupingDepth < 1)
  {
    v12 = AFSiriLogContextConnection;
    if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315138;
      v122 = "-[AFClockItemStorage endGroupingWithOptions:]";
      _os_log_error_impl(&dword_19CF1D000, v12, OS_LOG_TYPE_ERROR, "%s Attempt to end grouping without a balanced begin grouping.", buf, 0xCu);
    }
  }
  else
  {
    char v5 = a3;
    id v6 = AFSiriLogContextConnection;
    if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315650;
      v122 = "-[AFClockItemStorage endGroupingWithOptions:]";
      __int16 v123 = 2048;
      unint64_t v124 = groupingDepth;
      __int16 v125 = 2048;
      int64_t v126 = groupingDepth - 1;
      _os_log_impl(&dword_19CF1D000, v6, OS_LOG_TYPE_INFO, "%s grouping depth: %ld -> %ld", buf, 0x20u);
    }
    self->_int64_t groupingDepth = groupingDepth - 1;
    if (groupingDepth == 1)
    {
      itemsByID = (NSMutableDictionary *)self->_itemsByID;
      uint64_t v8 = self;
      char v103 = v5;
      if (itemsByID == self->_workingItemsByID
        || (-[NSMutableDictionary isEqualToDictionary:](itemsByID, "isEqualToDictionary:") & 1) != 0)
      {
        id v9 = 0;
        id v104 = 0;
        id v10 = 0;
        int v11 = 0;
        goto LABEL_82;
      }
      id v13 = [(NSDictionary *)self->_itemsByID count];
      uint64_t v14 = [(NSMutableDictionary *)self->_workingItemsByID count];
      uint64_t v15 = AFSiriLogContextConnection;
      BOOL v16 = os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_INFO);
      if (v13 == (id)v14)
      {
        if (!v16) {
          goto LABEL_16;
        }
        *(_DWORD *)buf = 136315394;
        v122 = "-[AFClockItemStorage endGroupingWithOptions:]";
        __int16 v123 = 2048;
        unint64_t v124 = (unint64_t)v13;
        v17 = "%s numberOfItems: %lu";
        v18 = v15;
        uint32_t v19 = 22;
      }
      else
      {
        if (!v16) {
          goto LABEL_16;
        }
        *(_DWORD *)buf = 136315650;
        v122 = "-[AFClockItemStorage endGroupingWithOptions:]";
        __int16 v123 = 2048;
        unint64_t v124 = (unint64_t)v13;
        __int16 v125 = 2048;
        int64_t v126 = v14;
        v17 = "%s numberOfItems: %lu -> %lu";
        v18 = v15;
        uint32_t v19 = 32;
      }
      _os_log_impl(&dword_19CF1D000, v18, OS_LOG_TYPE_INFO, v17, buf, v19);
LABEL_16:
      id v20 = objc_alloc(MEMORY[0x1E4F1CAD0]);
      uint64_t v21 = [(NSDictionary *)self->_itemsByID allKeys];
      uint64_t v22 = (void *)v21;
      uint64_t v23 = MEMORY[0x1E4F1CBF0];
      if (v21) {
        uint64_t v24 = v21;
      }
      else {
        uint64_t v24 = MEMORY[0x1E4F1CBF0];
      }
      v102 = (void *)[v20 initWithArray:v24];

      v25 = self;
      id v26 = objc_alloc(MEMORY[0x1E4F1CAD0]);
      uint64_t v27 = [(NSMutableDictionary *)self->_workingItemsByID allKeys];
      v28 = (void *)v27;
      if (v27) {
        uint64_t v29 = v27;
      }
      else {
        uint64_t v29 = v23;
      }
      v30 = (void *)[v26 initWithArray:v29];

      if (v14)
      {
        if (v13)
        {
          v31 = (void *)[v30 mutableCopy];
          [v31 minusSet:v102];
        }
        else
        {
          v31 = (void *)[v30 copy];
        }
        uint64_t v99 = v14;
        if (![v31 count])
        {

          id v10 = 0;
          id v44 = v13;
          id v13 = 0;
          id v45 = 0;
          if (v44) {
            goto LABEL_43;
          }
          goto LABEL_78;
        }
        long long v116 = 0u;
        long long v117 = 0u;
        long long v114 = 0u;
        long long v115 = 0u;
        id v10 = v31;
        uint64_t v33 = [v10 countByEnumeratingWithState:&v114 objects:v120 count:16];
        if (v33)
        {
          uint64_t v34 = v33;
          id v97 = v13;
          uint64_t v35 = *(void *)v115;
          do
          {
            for (uint64_t i = 0; i != v34; ++i)
            {
              if (*(void *)v115 != v35) {
                objc_enumerationMutation(v10);
              }
              v37 = v4[49];
              if (os_log_type_enabled(v37, OS_LOG_TYPE_INFO))
              {
                id v38 = v10;
                uint64_t v39 = *(void *)(*((void *)&v114 + 1) + 8 * i);
                workingItemsByID = self->_workingItemsByID;
                v41 = v37;
                v42 = workingItemsByID;
                id v4 = &_AFPreferencesReplacementLanguageForLocalRecognizerLanguageCode_onceToken;
                v43 = [(NSMutableDictionary *)v42 objectForKey:v39];
                *(_DWORD *)buf = 136315394;
                v122 = "-[AFClockItemStorage endGroupingWithOptions:]";
                __int16 v123 = 2112;
                unint64_t v124 = (unint64_t)v43;
                _os_log_impl(&dword_19CF1D000, v41, OS_LOG_TYPE_INFO, "%s itemsByID: [+] %@", buf, 0x16u);

                id v10 = v38;
              }
            }
            uint64_t v34 = [v10 countByEnumeratingWithState:&v114 objects:v120 count:16];
          }
          while (v34);

          if (v97)
          {
            v25 = self;
LABEL_43:
            v32 = (void *)[v102 mutableCopy];
            [v32 minusSet:v30];
LABEL_44:
            v101 = v30;
            if ([v32 count])
            {
              long long v112 = 0u;
              long long v113 = 0u;
              long long v110 = 0u;
              long long v111 = 0u;
              id v13 = v32;
              uint64_t v46 = [v13 countByEnumeratingWithState:&v110 objects:v119 count:16];
              if (v46)
              {
                uint64_t v47 = v46;
                v96 = v32;
                uint64_t v48 = *(void *)v111;
                do
                {
                  for (uint64_t j = 0; j != v47; ++j)
                  {
                    if (*(void *)v111 != v48) {
                      objc_enumerationMutation(v13);
                    }
                    v50 = v4[49];
                    if (os_log_type_enabled(v50, OS_LOG_TYPE_INFO))
                    {
                      uint64_t v51 = *(void *)(*((void *)&v110 + 1) + 8 * j);
                      id v52 = v13;
                      v53 = self->_itemsByID;
                      v54 = v50;
                      uint64_t v55 = v51;
                      id v4 = &_AFPreferencesReplacementLanguageForLocalRecognizerLanguageCode_onceToken;
                      v56 = [(NSDictionary *)v53 objectForKey:v55];
                      *(_DWORD *)buf = 136315394;
                      v122 = "-[AFClockItemStorage endGroupingWithOptions:]";
                      __int16 v123 = 2112;
                      unint64_t v124 = (unint64_t)v56;
                      _os_log_impl(&dword_19CF1D000, v54, OS_LOG_TYPE_INFO, "%s itemsByID: [-] %@", buf, 0x16u);

                      id v13 = v52;
                    }
                  }
                  uint64_t v47 = [v13 countByEnumeratingWithState:&v110 objects:v119 count:16];
                }
                while (v47);
                v25 = self;
                v32 = v96;
              }
              v30 = v101;
            }
            else
            {
              id v13 = 0;
            }

            if (v99)
            {
              v57 = (void *)[v102 mutableCopy];
              [v57 intersectSet:v30];
              if ([v57 count])
              {
                id v98 = v10;
                id v100 = v13;
                id v45 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
                long long v106 = 0u;
                long long v107 = 0u;
                long long v108 = 0u;
                long long v109 = 0u;
                v96 = v57;
                id v58 = v57;
                uint64_t v59 = [v58 countByEnumeratingWithState:&v106 objects:v118 count:16];
                if (v59)
                {
                  uint64_t v60 = v59;
                  uint64_t v61 = *(void *)v107;
                  do
                  {
                    for (uint64_t k = 0; k != v60; ++k)
                    {
                      if (*(void *)v107 != v61) {
                        objc_enumerationMutation(v58);
                      }
                      uint64_t v63 = *(void *)(*((void *)&v106 + 1) + 8 * k);
                      v64 = -[NSDictionary objectForKey:](v25->_itemsByID, "objectForKey:", v63, v96);
                      v65 = [(NSMutableDictionary *)v25->_workingItemsByID objectForKey:v63];
                      if (v64 != v65 && ([v64 isEqual:v65] & 1) == 0)
                      {
                        v66 = AFSiriLogContextConnection;
                        if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_INFO))
                        {
                          *(_DWORD *)buf = 136315650;
                          v122 = "-[AFClockItemStorage endGroupingWithOptions:]";
                          __int16 v123 = 2112;
                          unint64_t v124 = (unint64_t)v64;
                          __int16 v125 = 2112;
                          int64_t v126 = (int64_t)v65;
                          _os_log_impl(&dword_19CF1D000, v66, OS_LOG_TYPE_INFO, "%s itemsByID: [*] %@ -> %@", buf, 0x20u);
                        }
                        [v45 addObject:v63];
                      }
                    }
                    uint64_t v60 = [v58 countByEnumeratingWithState:&v106 objects:v118 count:16];
                  }
                  while (v60);
                }

                id v4 = &_AFPreferencesReplacementLanguageForLocalRecognizerLanguageCode_onceToken;
                if (![v45 count])
                {

                  id v45 = 0;
                }
                id v10 = v98;
                id v13 = v100;
                v30 = v101;
                v57 = v96;
              }
              else
              {
                id v45 = 0;
              }

              goto LABEL_78;
            }
            goto LABEL_77;
          }
          id v13 = 0;
          id v45 = 0;
LABEL_78:
          uint64_t v67 = objc_msgSend(v10, "count", v96);
          uint64_t v68 = [v45 count] + v67;
          if (!(v68 + [v13 count]))
          {
            v69 = v4[49];
            if (os_log_type_enabled(v69, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 136315138;
              v122 = "-[AFClockItemStorage endGroupingWithOptions:]";
              _os_log_error_impl(&dword_19CF1D000, v69, OS_LOG_TYPE_ERROR, "%s Item changes detected, but there is no inserted, updated or deleted items.", buf, 0xCu);
            }
          }
          id v104 = v45;
          id v9 = v13;
          uint64_t v8 = self;
          v70 = (NSDictionary *)[(NSMutableDictionary *)self->_workingItemsByID copy];
          v71 = self->_itemsByID;
          self->_itemsByID = v70;

          int v11 = 1;
LABEL_82:
          unint64_t generation = v8->_generation;
          unint64_t workingGeneration = v8->_workingGeneration;
          BOOL v74 = generation != workingGeneration;
          if (generation != workingGeneration)
          {
            v75 = v4[49];
            if (os_log_type_enabled(v75, OS_LOG_TYPE_INFO))
            {
              *(_DWORD *)buf = 136315650;
              v122 = "-[AFClockItemStorage endGroupingWithOptions:]";
              __int16 v123 = 2048;
              unint64_t v124 = generation;
              __int16 v125 = 2048;
              int64_t v126 = workingGeneration;
              _os_log_impl(&dword_19CF1D000, v75, OS_LOG_TYPE_INFO, "%s generation: %llu -> %llu", buf, 0x20u);
              unint64_t v76 = v8->_workingGeneration;
            }
            else
            {
              unint64_t v76 = workingGeneration;
            }
            v8->_unint64_t generation = v76;
          }
          date = v8->_date;
          if (date == v8->_workingDate || -[NSDate isEqualToDate:](date, "isEqualToDate:"))
          {
            int v78 = 0;
          }
          else
          {
            v79 = v4[49];
            if (os_log_type_enabled(v79, OS_LOG_TYPE_INFO))
            {
              v80 = v8->_date;
              workingDate = v8->_workingDate;
              *(_DWORD *)buf = 136315650;
              v122 = "-[AFClockItemStorage endGroupingWithOptions:]";
              __int16 v123 = 2112;
              unint64_t v124 = (unint64_t)v80;
              __int16 v125 = 2112;
              int64_t v126 = (int64_t)workingDate;
              _os_log_impl(&dword_19CF1D000, v79, OS_LOG_TYPE_INFO, "%s date: %@ -> %@", buf, 0x20u);
            }
            uint64_t v82 = [(NSDate *)v8->_workingDate copy];
            v83 = v8->_date;
            v8->_date = (NSDate *)v82;

            int v78 = 1;
          }
          if (generation == workingGeneration)
          {
            v84 = v9;
            if (v11 | v78)
            {
              unint64_t v85 = v8->_generation;
              v86 = v4[49];
              if (os_log_type_enabled(v86, OS_LOG_TYPE_INFO))
              {
                *(_DWORD *)buf = 136315650;
                v122 = "-[AFClockItemStorage endGroupingWithOptions:]";
                __int16 v123 = 2048;
                unint64_t v124 = v85;
                __int16 v125 = 2048;
                int64_t v126 = v85 + 1;
                _os_log_impl(&dword_19CF1D000, v86, OS_LOG_TYPE_INFO, "%s generation: %llu -> %llu", buf, 0x20u);
              }
              self->_unint64_t generation = v85 + 1;
              uint64_t v8 = self;
              BOOL v74 = 1;
            }
          }
          else
          {
            v84 = v9;
          }
          if ((v78 | (v11 | v74) ^ 1))
          {
            int v87 = v78 | v11 | v74;
            v88 = v104;
            if (v87 != 1)
            {
              v89 = v4[49];
              if (os_log_type_enabled(v89, OS_LOG_TYPE_INFO))
              {
                *(_DWORD *)buf = 136315138;
                v122 = "-[AFClockItemStorage endGroupingWithOptions:]";
                _os_log_impl(&dword_19CF1D000, v89, OS_LOG_TYPE_INFO, "%s There's no generation, date or item changes.", buf, 0xCu);
              }
LABEL_108:

              return;
            }
          }
          else
          {
            v90 = [MEMORY[0x1E4F1C9C8] date];
            v91 = v4[49];
            v88 = v104;
            if (os_log_type_enabled(v91, OS_LOG_TYPE_INFO))
            {
              v92 = v8->_date;
              *(_DWORD *)buf = 136315650;
              v122 = "-[AFClockItemStorage endGroupingWithOptions:]";
              __int16 v123 = 2112;
              unint64_t v124 = (unint64_t)v92;
              __int16 v125 = 2112;
              int64_t v126 = (int64_t)v90;
              _os_log_impl(&dword_19CF1D000, v91, OS_LOG_TYPE_INFO, "%s date: %@ -> %@", buf, 0x20u);
            }
            uint64_t v93 = [v90 copy];
            v94 = v8->_date;
            v8->_date = (NSDate *)v93;
          }
          if ((v103 & 1) == 0)
          {
            id WeakRetained = objc_loadWeakRetained((id *)&v8->_delegate);
            [WeakRetained clockItemStorageDidUpdate:v8 insertedItemIDs:v10 updatedItemIDs:v88 deletedItemIDs:v84];
          }
          goto LABEL_108;
        }

        if (v13) {
          goto LABEL_43;
        }
      }
      else
      {
        if (v13)
        {
          uint64_t v99 = 0;
          v32 = (void *)[v102 copy];
          id v10 = 0;
          goto LABEL_44;
        }
        id v10 = 0;
      }
LABEL_77:
      id v45 = 0;
      goto LABEL_78;
    }
  }
}

- (void)beginGrouping
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  int64_t groupingDepth = self->_groupingDepth;
  int64_t v4 = groupingDepth + 1;
  char v5 = AFSiriLogContextConnection;
  if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_INFO))
  {
    int v12 = 136315650;
    id v13 = "-[AFClockItemStorage beginGrouping]";
    __int16 v14 = 2048;
    int64_t v15 = groupingDepth;
    __int16 v16 = 2048;
    int64_t v17 = groupingDepth + 1;
    _os_log_impl(&dword_19CF1D000, v5, OS_LOG_TYPE_INFO, "%s grouping depth: %ld -> %ld", (uint8_t *)&v12, 0x20u);
    int64_t groupingDepth = self->_groupingDepth;
  }
  if (!groupingDepth)
  {
    date = self->_date;
    self->_unint64_t workingGeneration = self->_generation;
    uint64_t v7 = (NSDate *)[(NSDate *)date copy];
    workingDate = self->_workingDate;
    self->_workingDate = v7;

    itemsByID = self->_itemsByID;
    if (itemsByID) {
      id v10 = (NSMutableDictionary *)[(NSDictionary *)itemsByID mutableCopy];
    }
    else {
      id v10 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    }
    workingItemsByID = self->_workingItemsByID;
    self->_workingItemsByID = v10;
  }
  self->_int64_t groupingDepth = v4;
}

- (void)setItemsByID:(id)a3
{
  id v4 = a3;
  [(AFClockItemStorage *)self beginGrouping];
  char v5 = (NSMutableDictionary *)[v4 mutableCopy];

  workingItemsByID = self->_workingItemsByID;
  self->_workingItemsByID = v5;

  [(AFClockItemStorage *)self endGroupingWithOptions:0];
}

- (void)setDate:(id)a3
{
  id v4 = a3;
  [(AFClockItemStorage *)self beginGrouping];
  char v5 = (NSDate *)[v4 copy];

  workingDate = self->_workingDate;
  self->_workingDate = v5;

  [(AFClockItemStorage *)self endGroupingWithOptions:0];
}

- (void)setGeneration:(unint64_t)a3
{
  [(AFClockItemStorage *)self beginGrouping];
  self->_unint64_t workingGeneration = a3;
  [(AFClockItemStorage *)self endGroupingWithOptions:0];
}

- (AFClockItemStorage)initWithIdentifier:(id)a3 delegate:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v12.receiver = self;
  v12.super_class = (Class)AFClockItemStorage;
  uint64_t v8 = [(AFClockItemStorage *)&v12 init];
  if (v8)
  {
    uint64_t v9 = [v6 copy];
    identifier = v8->_identifier;
    v8->_identifier = (NSString *)v9;

    objc_storeWeak((id *)&v8->_delegate, v7);
  }

  return v8;
}

@end