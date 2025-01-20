@interface CKParticipantsTrie
- (BOOL)_trieContainsEntity:(id)a3;
- (BOOL)hasPrefix:(id)a3;
- (CKParticipantsTrie)init;
- (CKParticipantsTrie)initWithKey:(id)a3;
- (NSMutableArray)children;
- (NSMutableArray)entities;
- (NSString)key;
- (id)_composedCharactersForString:(id)a3 appendRootKey:(BOOL)a4;
- (id)_lastNodeForString:(id)a3;
- (id)entitiesForPrefix:(id)a3;
- (id)rawHandlesForParticipantName:(id)a3;
- (void)_addEntity:(id)a3 named:(id)a4 forCharacters:(id)a5;
- (void)addParticipantName:(id)a3 entity:(id)a4;
- (void)loadHandleEntityFromLastNode:(id)a3 intoResult:(id)a4;
- (void)setChildren:(id)a3;
- (void)setEntities:(id)a3;
- (void)setKey:(id)a3;
@end

@implementation CKParticipantsTrie

- (CKParticipantsTrie)init
{
  return [(CKParticipantsTrie *)self initWithKey:@"@"];
}

- (CKParticipantsTrie)initWithKey:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)CKParticipantsTrie;
  v6 = [(CKParticipantsTrie *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_key, a3);
  }

  return v7;
}

- (void)addParticipantName:(id)a3 entity:(id)a4
{
  id v11 = a3;
  id v6 = a4;
  if (v11 && v6)
  {
    if (!self->_children)
    {
      v7 = (NSMutableArray *)objc_opt_new();
      children = self->_children;
      self->_children = v7;
    }
    objc_super v9 = [v11 lowercaseString];
    v10 = [(CKParticipantsTrie *)self _composedCharactersForString:v9 appendRootKey:1];
    [(CKParticipantsTrie *)self _addEntity:v6 named:v9 forCharacters:v10];
  }
}

- (BOOL)hasPrefix:(id)a3
{
  v3 = [(CKParticipantsTrie *)self _lastNodeForString:a3];
  BOOL v4 = v3 != 0;

  return v4;
}

- (id)rawHandlesForParticipantName:(id)a3
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = objc_opt_new();
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id v6 = -[CKParticipantsTrie _lastNodeForString:](self, "_lastNodeForString:", v4, 0);
  v7 = [v6 entities];

  uint64_t v8 = [v7 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v17;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v17 != v10) {
          objc_enumerationMutation(v7);
        }
        v12 = [*(id *)(*((void *)&v16 + 1) + 8 * i) defaultIMHandle];
        v13 = [v12 ID];
        [v5 addObject:v13];
      }
      uint64_t v9 = [v7 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v9);
  }

  if ([v5 count]) {
    id v14 = v5;
  }
  else {
    id v14 = 0;
  }

  return v14;
}

- (id)entitiesForPrefix:(id)a3
{
  id v4 = a3;
  if ([(CKParticipantsTrie *)self hasPrefix:v4])
  {
    id v5 = objc_opt_new();
    id v6 = [(CKParticipantsTrie *)self _lastNodeForString:v4];
    [(CKParticipantsTrie *)self loadHandleEntityFromLastNode:v6 intoResult:v5];

    v7 = [v5 sortedArrayUsingComparator:&__block_literal_global_184];
    if (![v5 count])
    {
      uint64_t v9 = (void *)MEMORY[0x1E4F1CA00];
      uint64_t v10 = [NSString stringWithFormat:@"No trie node values for valid prefix: [%@]", v4];
      id v11 = [v9 exceptionWithName:@"CKParticipantsTrie/NodeValuesIntegrityError" reason:v10 userInfo:0];

      objc_exception_throw(v11);
    }
  }
  else
  {
    v7 = (void *)MEMORY[0x1E4F1CBF0];
  }

  return v7;
}

uint64_t __40__CKParticipantsTrie_entitiesForPrefix___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4 = a3;
  id v5 = [a2 fullName];
  id v6 = [v4 fullName];

  uint64_t v7 = [v5 compare:v6];
  return v7;
}

- (id)_composedCharactersForString:(id)a3 appendRootKey:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  uint64_t v7 = objc_opt_new();
  if (v4)
  {
    uint64_t v8 = [(CKParticipantsTrie *)self key];
    [v7 addObject:v8];
  }
  uint64_t v9 = [v6 length];
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __65__CKParticipantsTrie__composedCharactersForString_appendRootKey___block_invoke;
  v12[3] = &unk_1E5629C00;
  id v10 = v7;
  id v13 = v10;
  objc_msgSend(v6, "enumerateSubstringsInRange:options:usingBlock:", 0, v9, 2, v12);

  return v10;
}

uint64_t __65__CKParticipantsTrie__composedCharactersForString_appendRootKey___block_invoke(uint64_t result, uint64_t a2)
{
  if (a2) {
    return [*(id *)(result + 32) addObject:a2];
  }
  return result;
}

- (void)_addEntity:(id)a3 named:(id)a4 forCharacters:(id)a5
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  id v26 = a3;
  id v8 = a4;
  id v9 = a5;
  id v10 = [v9 firstObject];
  [v9 removeFirstObject];
  [(CKParticipantsTrie *)self children];
  long long v27 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  id v11 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v12 = [v11 countByEnumeratingWithState:&v27 objects:v31 count:16];
  if (v12)
  {
    uint64_t v13 = v12;
    uint64_t v14 = *(void *)v28;
LABEL_3:
    uint64_t v15 = 0;
    while (1)
    {
      if (*(void *)v28 != v14) {
        objc_enumerationMutation(v11);
      }
      long long v16 = *(void **)(*((void *)&v27 + 1) + 8 * v15);
      long long v17 = [v16 key];
      char v18 = [v17 isEqualToString:v10];

      if (v18) {
        break;
      }
      if (v13 == ++v15)
      {
        uint64_t v13 = [v11 countByEnumeratingWithState:&v27 objects:v31 count:16];
        if (v13) {
          goto LABEL_3;
        }
        goto LABEL_9;
      }
    }
    long long v19 = v16;

    if (v19) {
      goto LABEL_12;
    }
  }
  else
  {
LABEL_9:
  }
  long long v19 = [[CKParticipantsTrie alloc] initWithKey:v10];
  [v11 addObject:v19];
LABEL_12:
  if (![v9 count])
  {
    v22 = [(CKParticipantsTrie *)v19 entities];

    if (v22)
    {
      v23 = [(CKParticipantsTrie *)v19 entities];
      char v24 = [v23 containsObject:v26];

      if (v24) {
        goto LABEL_21;
      }
      v25 = [(CKParticipantsTrie *)v19 entities];
      [v25 addObject:v26];
    }
    else
    {
      v25 = [MEMORY[0x1E4F1CA48] arrayWithObject:v26];
      [(CKParticipantsTrie *)v19 setEntities:v25];
    }

    goto LABEL_21;
  }
  v20 = [(CKParticipantsTrie *)v19 children];

  if (!v20)
  {
    uint64_t v21 = objc_opt_new();
    [(CKParticipantsTrie *)v19 setChildren:v21];
  }
  [(CKParticipantsTrie *)v19 _addEntity:v26 named:v8 forCharacters:v9];
LABEL_21:
}

- (BOOL)_trieContainsEntity:(id)a3
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v5 = [(CKParticipantsTrie *)self entities];
  uint64_t v6 = [v5 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v6)
  {
    uint64_t v7 = *(void *)v16;
    while (2)
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v16 != v7) {
          objc_enumerationMutation(v5);
        }
        id v9 = [*(id *)(*((void *)&v15 + 1) + 8 * i) defaultIMHandle];
        id v10 = [v9 ID];
        id v11 = [v4 defaultIMHandle];
        uint64_t v12 = [v11 ID];
        char v13 = [v10 isEqualToString:v12];

        if (v13)
        {
          LOBYTE(v6) = 1;
          goto LABEL_11;
        }
      }
      uint64_t v6 = [v5 countByEnumeratingWithState:&v15 objects:v19 count:16];
      if (v6) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return v6;
}

- (id)_lastNodeForString:(id)a3
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if ([v4 length])
  {
    id v23 = v4;
    id v5 = [(CKParticipantsTrie *)self _composedCharactersForString:v4 appendRootKey:0];
    uint64_t v6 = self;
    uint64_t v7 = [(CKParticipantsTrie *)v6 children];
    if (v7)
    {
      id v8 = (void *)v7;
      unint64_t v9 = 0;
      id v10 = v6;
      char v24 = v5;
      while (2)
      {
        unint64_t v11 = [v5 count];

        if (v9 >= v11)
        {
          uint64_t v6 = v10;
        }
        else
        {
          uint64_t v12 = [v5 objectAtIndexedSubscript:v9];
          long long v25 = 0u;
          long long v26 = 0u;
          long long v27 = 0u;
          long long v28 = 0u;
          char v13 = [(CKParticipantsTrie *)v10 children];
          uint64_t v14 = [v13 countByEnumeratingWithState:&v25 objects:v29 count:16];
          if (v14)
          {
            uint64_t v15 = v14;
            uint64_t v16 = *(void *)v26;
LABEL_7:
            uint64_t v17 = 0;
            while (1)
            {
              if (*(void *)v26 != v16) {
                objc_enumerationMutation(v13);
              }
              long long v18 = *(void **)(*((void *)&v25 + 1) + 8 * v17);
              long long v19 = [v18 key];
              uint64_t v20 = [v19 compare:v12 options:393];

              if (!v20) {
                break;
              }
              if (v15 == ++v17)
              {
                uint64_t v15 = [v13 countByEnumeratingWithState:&v25 objects:v29 count:16];
                if (v15) {
                  goto LABEL_7;
                }
                goto LABEL_18;
              }
            }
            uint64_t v6 = v18;

            ++v9;
            id v8 = [(CKParticipantsTrie *)v6 children];
            id v10 = v6;
            id v5 = v24;
            if (v8) {
              continue;
            }
          }
          else
          {
LABEL_18:

            uint64_t v6 = v10;
            id v5 = v24;
          }
        }
        break;
      }
    }
    else
    {
      unint64_t v9 = 0;
    }
    if (v9 == [v5 count]) {
      uint64_t v21 = v6;
    }
    else {
      uint64_t v21 = 0;
    }
    id v4 = v23;
  }
  else
  {
    uint64_t v21 = 0;
  }

  return v21;
}

- (void)loadHandleEntityFromLastNode:(id)a3 intoResult:(id)a4
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  id v8 = [v6 entities];

  if (v8)
  {
    long long v28 = 0u;
    long long v29 = 0u;
    long long v26 = 0u;
    long long v27 = 0u;
    unint64_t v9 = [v6 entities];
    uint64_t v10 = [v9 countByEnumeratingWithState:&v26 objects:v31 count:16];
    if (v10)
    {
      uint64_t v11 = v10;
      uint64_t v12 = *(void *)v27;
      do
      {
        for (uint64_t i = 0; i != v11; ++i)
        {
          if (*(void *)v27 != v12) {
            objc_enumerationMutation(v9);
          }
          uint64_t v14 = *(void *)(*((void *)&v26 + 1) + 8 * i);
          if (([v7 containsObject:v14] & 1) == 0) {
            [v7 addObject:v14];
          }
        }
        uint64_t v11 = [v9 countByEnumeratingWithState:&v26 objects:v31 count:16];
      }
      while (v11);
    }
  }
  uint64_t v15 = [v6 children];
  uint64_t v16 = [v15 count];

  if (v16)
  {
    long long v24 = 0u;
    long long v25 = 0u;
    long long v22 = 0u;
    long long v23 = 0u;
    uint64_t v17 = objc_msgSend(v6, "children", 0);
    uint64_t v18 = [v17 countByEnumeratingWithState:&v22 objects:v30 count:16];
    if (v18)
    {
      uint64_t v19 = v18;
      uint64_t v20 = *(void *)v23;
      do
      {
        for (uint64_t j = 0; j != v19; ++j)
        {
          if (*(void *)v23 != v20) {
            objc_enumerationMutation(v17);
          }
          [(CKParticipantsTrie *)self loadHandleEntityFromLastNode:*(void *)(*((void *)&v22 + 1) + 8 * j) intoResult:v7];
        }
        uint64_t v19 = [v17 countByEnumeratingWithState:&v22 objects:v30 count:16];
      }
      while (v19);
    }
  }
}

- (NSString)key
{
  return self->_key;
}

- (void)setKey:(id)a3
{
}

- (NSMutableArray)entities
{
  return self->_entities;
}

- (void)setEntities:(id)a3
{
}

- (NSMutableArray)children
{
  return self->_children;
}

- (void)setChildren:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_children, 0);
  objc_storeStrong((id *)&self->_entities, 0);

  objc_storeStrong((id *)&self->_key, 0);
}

@end