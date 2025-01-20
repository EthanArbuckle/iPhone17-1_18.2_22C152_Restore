@interface _EDDisplayNameGroupingTrie
- (_EDDisplayNameGroupingTrie)init;
- (_EDDisplayNameGroupingTrieNode)root;
- (id)_addressesInGroupWithRoot:(id)a3;
- (id)_findTopLevelGroupsForStart:(id)a3;
- (id)findGroups;
- (void)insertDisplayName:(id)a3 addressID:(id)a4;
- (void)setRoot:(id)a3;
@end

@implementation _EDDisplayNameGroupingTrie

- (_EDDisplayNameGroupingTrie)init
{
  v6.receiver = self;
  v6.super_class = (Class)_EDDisplayNameGroupingTrie;
  v2 = [(_EDDisplayNameGroupingTrie *)&v6 init];
  if (v2)
  {
    v3 = [[_EDDisplayNameGroupingTrieNode alloc] initWithValue:0];
    root = v2->_root;
    v2->_root = v3;
  }
  return v2;
}

- (void)insertDisplayName:(id)a3 addressID:(id)a4
{
  v30[2] = *MEMORY[0x1E4F143B8];
  id v21 = a3;
  id v22 = a4;
  objc_super v6 = [v21 lowercaseString];
  id v28 = 0;
  v7 = objc_msgSend(v6, "ef_wordComponentsForLocale:minimumWordLength:componentLimit:remainingString:", 0, 0, 50, &v28);
  id v23 = v28;

  if (v23)
  {
    v30[0] = v7;
    v30[1] = v23;
    v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:v30 count:2];
    uint64_t v9 = objc_msgSend(v8, "ef_flatten");

    v10 = +[EDBusinessCommonPrefixGroupingUpgradeStep log];
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      -[_EDDisplayNameGroupingTrie insertDisplayName:addressID:](v10);
    }

    v7 = (void *)v9;
  }
  if ([v7 count])
  {
    v11 = [(_EDDisplayNameGroupingTrie *)self root];
    long long v26 = 0u;
    long long v27 = 0u;
    long long v24 = 0u;
    long long v25 = 0u;
    id v12 = v7;
    uint64_t v13 = [v12 countByEnumeratingWithState:&v24 objects:v29 count:16];
    if (v13)
    {
      uint64_t v14 = *(void *)v25;
      do
      {
        uint64_t v15 = 0;
        do
        {
          if (*(void *)v25 != v14) {
            objc_enumerationMutation(v12);
          }
          uint64_t v16 = *(void *)(*((void *)&v24 + 1) + 8 * v15);
          v17 = [v11 children];
          v18 = [v17 objectForKeyedSubscript:v16];

          if (v18)
          {
            id v19 = v18;

            if ([v19 isEndOfName])
            {
              [v19 addAddressID:v22];

              goto LABEL_18;
            }
          }
          else
          {
            [v11 addChild:v16];
            v20 = [v11 children];
            id v19 = [v20 objectForKeyedSubscript:v16];
          }
          v11 = v19;

          ++v15;
        }
        while (v13 != v15);
        uint64_t v13 = [v12 countByEnumeratingWithState:&v24 objects:v29 count:16];
      }
      while (v13);
    }

    [v11 setIsEndOfName:1];
    [v11 addAddressID:v22];
    id v19 = v11;
LABEL_18:
  }
}

- (id)findGroups
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  v3 = [(_EDDisplayNameGroupingTrie *)self root];
  v4 = [(_EDDisplayNameGroupingTrie *)self _findTopLevelGroupsForStart:v3];

  id v5 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  long long v17 = 0u;
  long long v18 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v6 = v4;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v7)
  {
    uint64_t v8 = *(void *)v16;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v16 != v8) {
          objc_enumerationMutation(v6);
        }
        v10 = *(void **)(*((void *)&v15 + 1) + 8 * i);
        v11 = objc_msgSend(v10, "addressIDs", (void)v15);
        id v12 = [v11 firstObject];

        if (v12)
        {
          uint64_t v13 = [(_EDDisplayNameGroupingTrie *)self _addressesInGroupWithRoot:v10];
          [v5 setObject:v13 forKeyedSubscript:v12];
        }
      }
      uint64_t v7 = [v6 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v7);
  }

  return v5;
}

- (id)_addressesInGroupWithRoot:(id)a3
{
  id v3 = a3;
  v4 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithObjects:", v3, 0);
  id v5 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  while ([v4 count])
  {
    id v6 = objc_msgSend(v4, "ef_popElement");
    uint64_t v7 = v6;
    if (!v6) {
      break;
    }
    if ([v6 isEndOfName])
    {
      uint64_t v8 = [v7 addressIDs];
      [v5 addObjectsFromArray:v8];
    }
    uint64_t v9 = [v7 children];
    v10 = [v9 allValues];
    [v4 addObjectsFromArray:v10];
  }

  return v5;
}

- (id)_findTopLevelGroupsForStart:(id)a3
{
  id v3 = a3;
  v4 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithObjects:", v3, 0);
  id v5 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  while ([v4 count])
  {
    id v6 = objc_msgSend(v4, "ef_popElement");
    uint64_t v7 = v6;
    if (!v6) {
      break;
    }
    if ([v6 isEndOfName])
    {
      [v5 addObject:v7];
    }
    else
    {
      uint64_t v8 = [v7 children];
      uint64_t v9 = [v8 allValues];
      [v4 addObjectsFromArray:v9];
    }
  }

  return v5;
}

- (_EDDisplayNameGroupingTrieNode)root
{
  return self->_root;
}

- (void)setRoot:(id)a3
{
}

- (void).cxx_destruct
{
}

- (void)insertDisplayName:(os_log_t)log addressID:.cold.1(os_log_t log)
{
  uint64_t v3 = *MEMORY[0x1E4F143B8];
  int v1 = 134217984;
  uint64_t v2 = 50;
  _os_log_error_impl(&dword_1DB39C000, log, OS_LOG_TYPE_ERROR, "Display name contains over %lu tokens. Truncating.", (uint8_t *)&v1, 0xCu);
}

@end