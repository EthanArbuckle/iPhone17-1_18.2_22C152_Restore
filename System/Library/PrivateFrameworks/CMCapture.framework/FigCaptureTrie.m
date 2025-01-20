@interface FigCaptureTrie
- (BOOL)containsParentPath:(id)a3;
- (BOOL)containsPath:(id)a3;
- (BOOL)isComplete;
- (BOOL)isEqual:(id)a3;
- (FigCaptureTrie)init;
- (FigCaptureTrie)initWithPath:(id)a3;
- (FigCaptureTrie)initWithPathArray:(id)a3;
- (NSDictionary)children;
- (id)_extractFrom:(id)a3 writeTarget:(id)a4 destinationMutability:(int)a5 overwrite:(BOOL)a6;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)extractFrom:(id)a3;
- (id)generatePathArray;
- (id)getSubTrie:(id)a3;
- (void)_addPath:(id)a3 index:(unint64_t)a4;
- (void)_enumeratePathsWithPrefix:(id)a3 stop:(BOOL *)a4 processLeaf:(id)a5;
- (void)addPath:(id)a3;
- (void)dealloc;
- (void)enumeratePaths:(id)a3;
- (void)extractFrom:(id)a3 writeInto:(id)a4 assumeMutable:(BOOL)a5 overwrite:(BOOL)a6;
@end

@implementation FigCaptureTrie

- (FigCaptureTrie)init
{
  v3.receiver = self;
  v3.super_class = (Class)FigCaptureTrie;
  return [(FigCaptureTrie *)&v3 init];
}

- (FigCaptureTrie)initWithPath:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  v4 = [(FigCaptureTrie *)self init];
  if (v4)
  {
    long long v15 = 0u;
    long long v16 = 0u;
    long long v13 = 0u;
    long long v14 = 0u;
    uint64_t v5 = [a3 countByEnumeratingWithState:&v13 objects:v17 count:16];
    v6 = v4;
    if (v5)
    {
      uint64_t v7 = v5;
      uint64_t v8 = *(void *)v14;
      v6 = v4;
      do
      {
        uint64_t v9 = 0;
        v10 = v6;
        do
        {
          if (*(void *)v14 != v8) {
            objc_enumerationMutation(a3);
          }
          uint64_t v11 = *(void *)(*((void *)&v13 + 1) + 8 * v9);
          v6 = objc_alloc_init(FigCaptureTrie);
          v10->_subTries = (NSMutableDictionary *)(id)[MEMORY[0x1E4F1CA60] dictionaryWithObject:v6 forKey:v11];

          ++v9;
          v10 = v6;
        }
        while (v7 != v9);
        uint64_t v7 = [a3 countByEnumeratingWithState:&v13 objects:v17 count:16];
      }
      while (v7);
    }
    v6->_complete = 1;
  }
  return v4;
}

- (FigCaptureTrie)initWithPathArray:(id)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  v4 = [(FigCaptureTrie *)self init];
  if (v4)
  {
    long long v12 = 0u;
    long long v13 = 0u;
    long long v10 = 0u;
    long long v11 = 0u;
    uint64_t v5 = [a3 countByEnumeratingWithState:&v10 objects:v14 count:16];
    if (v5)
    {
      uint64_t v6 = v5;
      uint64_t v7 = *(void *)v11;
      do
      {
        uint64_t v8 = 0;
        do
        {
          if (*(void *)v11 != v7) {
            objc_enumerationMutation(a3);
          }
          [(FigCaptureTrie *)v4 addPath:*(void *)(*((void *)&v10 + 1) + 8 * v8++)];
        }
        while (v6 != v8);
        uint64_t v6 = [a3 countByEnumeratingWithState:&v10 objects:v14 count:16];
      }
      while (v6);
    }
  }
  return v4;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)FigCaptureTrie;
  [(FigCaptureTrie *)&v3 dealloc];
}

- (id)description
{
  objc_super v3 = (void *)[MEMORY[0x1E4F28E78] stringWithString:@"FigCaptureTrie: {\n"];
  v6[0] = 0;
  v6[1] = v6;
  v6[2] = 0x2020000000;
  int v7 = 0;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __29__FigCaptureTrie_description__block_invoke;
  v5[3] = &unk_1E5C242D0;
  v5[4] = v3;
  v5[5] = v6;
  [(FigCaptureTrie *)self enumeratePaths:v5];
  [v3 appendString:@"}"];
  _Block_object_dispose(v6, 8);
  return v3;
}

uint64_t __29__FigCaptureTrie_description__block_invoke(uint64_t a1, void *a2)
{
  return [*(id *)(a1 + 32) appendFormat:@"  %d: { %@ }\n", (*(_DWORD *)(*(void *)(*(void *)(a1 + 40) + 8) + 24))++, objc_msgSend(a2, "componentsJoinedByString:", @", ")];
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = [+[FigCaptureTrie allocWithZone:](FigCaptureTrie, "allocWithZone:") init];
  v5->_complete = self->_complete;
  if (self->_subTries)
  {
    v5->_subTries = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    subTries = self->_subTries;
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __31__FigCaptureTrie_copyWithZone___block_invoke;
    v8[3] = &unk_1E5C242F8;
    v8[4] = v5;
    v8[5] = a3;
    [(NSMutableDictionary *)subTries enumerateKeysAndObjectsUsingBlock:v8];
  }
  return v5;
}

void __31__FigCaptureTrie_copyWithZone___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v5 = (id)[a3 copyWithZone:*(void *)(a1 + 40)];
  [*(id *)(*(void *)(a1 + 32) + 16) setObject:v5 forKeyedSubscript:a2];
}

- (BOOL)isEqual:(id)a3
{
  if (a3 == self)
  {
    LOBYTE(v6) = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0
      && self->_complete == *((unsigned __int8 *)a3 + 8)
      && (subTries = self->_subTries, (subTries != 0) != (*((void *)a3 + 2) == 0)))
    {
      if (!subTries || (int v6 = -[NSMutableDictionary isEqual:](subTries, "isEqual:")) != 0) {
        LOBYTE(v6) = 1;
      }
    }
    else
    {
      LOBYTE(v6) = 0;
    }
  }
  return v6;
}

- (BOOL)isComplete
{
  return self->_complete;
}

- (NSDictionary)children
{
  v2 = (void *)[(NSMutableDictionary *)self->_subTries copy];
  return (NSDictionary *)v2;
}

- (void)addPath:(id)a3
{
}

- (void)_addPath:(id)a3 index:(unint64_t)a4
{
  if ([a3 count] == a4)
  {
    self->_complete = 1;
  }
  else
  {
    uint64_t v7 = [a3 objectAtIndexedSubscript:a4];
    subTries = self->_subTries;
    if (!subTries)
    {
      subTries = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
      self->_subTries = subTries;
    }
    uint64_t v9 = (FigCaptureTrie *)[(NSMutableDictionary *)subTries objectForKeyedSubscript:v7];
    if (!v9)
    {
      uint64_t v9 = objc_alloc_init(FigCaptureTrie);
      [(NSMutableDictionary *)self->_subTries setObject:v9 forKeyedSubscript:v7];
    }
    [(FigCaptureTrie *)v9 _addPath:a3 index:a4 + 1];
  }
}

- (BOOL)containsPath:(id)a3
{
  objc_super v3 = [(FigCaptureTrie *)self getSubTrie:a3];
  if (v3) {
    LOBYTE(v3) = v3[8] != 0;
  }
  return (char)v3;
}

- (BOOL)containsParentPath:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  uint64_t v5 = [a3 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (!v5) {
    return self->_complete;
  }
  uint64_t v6 = v5;
  uint64_t v7 = *(void *)v13;
LABEL_3:
  uint64_t v8 = 0;
  while (1)
  {
    if (*(void *)v13 != v7) {
      objc_enumerationMutation(a3);
    }
    BOOL complete = self->_complete;
    if (self->_complete) {
      return complete;
    }
    long long v10 = (FigCaptureTrie *)[(NSMutableDictionary *)self->_subTries objectForKeyedSubscript:*(void *)(*((void *)&v12 + 1) + 8 * v8)];
    if (!v10) {
      return complete;
    }
    self = v10;
    if (v6 == ++v8)
    {
      uint64_t v6 = [a3 countByEnumeratingWithState:&v12 objects:v16 count:16];
      if (v6) {
        goto LABEL_3;
      }
      return self->_complete;
    }
  }
}

- (id)getSubTrie:(id)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  uint64_t v5 = [a3 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v11;
LABEL_3:
    uint64_t v8 = 0;
    while (1)
    {
      if (*(void *)v11 != v7) {
        objc_enumerationMutation(a3);
      }
      self = (FigCaptureTrie *)[(NSMutableDictionary *)self->_subTries objectForKeyedSubscript:*(void *)(*((void *)&v10 + 1) + 8 * v8)];
      if (!self) {
        break;
      }
      if (v6 == ++v8)
      {
        uint64_t v6 = [a3 countByEnumeratingWithState:&v10 objects:v14 count:16];
        if (v6) {
          goto LABEL_3;
        }
        return self;
      }
    }
  }
  return self;
}

- (void)enumeratePaths:(id)a3
{
  char v3 = 0;
  [(FigCaptureTrie *)self _enumeratePathsWithPrefix:MEMORY[0x1E4F1CBF0] stop:&v3 processLeaf:a3];
}

- (void)_enumeratePathsWithPrefix:(id)a3 stop:(BOOL *)a4 processLeaf:(id)a5
{
  if (!self->_complete
    || (unsigned __int8 v11 = 0, (*((void (**)(id, id, unsigned __int8 *, BOOL *))a5 + 2))(a5, a3, &v11, a4), !(*a4 | v11)))
  {
    subTries = self->_subTries;
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __61__FigCaptureTrie__enumeratePathsWithPrefix_stop_processLeaf___block_invoke;
    v10[3] = &unk_1E5C24320;
    v10[5] = a5;
    v10[6] = a4;
    v10[4] = a3;
    [(NSMutableDictionary *)subTries enumerateKeysAndObjectsUsingBlock:v10];
  }
}

uint64_t __61__FigCaptureTrie__enumeratePathsWithPrefix_stop_processLeaf___block_invoke(uint64_t a1, uint64_t a2, void *a3, unsigned char *a4)
{
  uint64_t result = objc_msgSend(a3, "_enumeratePathsWithPrefix:stop:processLeaf:", objc_msgSend(*(id *)(a1 + 32), "arrayByAddingObject:", a2), *(void *)(a1 + 48), *(void *)(a1 + 40));
  *a4 = **(unsigned char **)(a1 + 48);
  return result;
}

- (id)extractFrom:(id)a3
{
  id result = [(FigCaptureTrie *)self _extractFrom:a3 writeTarget:0 destinationMutability:2 overwrite:1];
  if (!result)
  {
    v4 = (void *)MEMORY[0x1E4F1CA60];
    return (id)[v4 dictionary];
  }
  return result;
}

- (void)extractFrom:(id)a3 writeInto:(id)a4 assumeMutable:(BOOL)a5 overwrite:(BOOL)a6
{
  if (self->_complete)
  {
    if (a6)
    {
      objc_msgSend(a4, "removeAllObjects", a3, a4, a5);
      [a4 addEntriesFromDictionary:a3];
    }
  }
  else
  {
    if (a5) {
      uint64_t v8 = 2;
    }
    else {
      uint64_t v8 = 1;
    }
    [(FigCaptureTrie *)self _extractFrom:a3 writeTarget:a4 destinationMutability:v8 overwrite:a6];
  }
}

- (id)_extractFrom:(id)a3 writeTarget:(id)a4 destinationMutability:(int)a5 overwrite:(BOOL)a6
{
  if (!self->_complete)
  {
    uint64_t v20 = 0;
    v21 = &v20;
    uint64_t v22 = 0x3052000000;
    v23 = __Block_byref_object_copy_;
    v24 = __Block_byref_object_dispose_;
    uint64_t v25 = 0;
    if ([(NSMutableDictionary *)self->_subTries count])
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        if (!a4 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
        {
          if (a5)
          {
            id v12 = a4;
            v21[5] = (uint64_t)v12;
            if (a5 == 1) {
              int v13 = 0;
            }
            else {
              int v13 = a5;
            }
          }
          else
          {
            int v13 = 0;
          }
          subTries = self->_subTries;
          v17[0] = MEMORY[0x1E4F143A8];
          v17[1] = 3221225472;
          v17[2] = __75__FigCaptureTrie__extractFrom_writeTarget_destinationMutability_overwrite___block_invoke;
          v17[3] = &unk_1E5C24348;
          v17[4] = a3;
          v17[5] = a4;
          int v18 = v13;
          BOOL v19 = a6;
          v17[6] = self;
          v17[7] = &v20;
          [(NSMutableDictionary *)subTries enumerateKeysAndObjectsUsingBlock:v17];
        }
      }
    }
    id v9 = (id)v21[5];
    _Block_object_dispose(&v20, 8);
    return v9;
  }
  if (a4 && !a6) {
    return 0;
  }
  id v14 = a3;
  return v14;
}

uint64_t __75__FigCaptureTrie__extractFrom_writeTarget_destinationMutability_overwrite___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t result = [*(id *)(a1 + 32) objectForKeyedSubscript:a2];
  if (result)
  {
    uint64_t result = objc_msgSend(a3, "_extractFrom:writeTarget:destinationMutability:overwrite:", result, objc_msgSend(*(id *)(a1 + 40), "objectForKeyedSubscript:", a2), *(unsigned int *)(a1 + 64), *(unsigned __int8 *)(a1 + 68));
    if (result)
    {
      uint64_t v7 = result;
      if (!*(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 40))
      {
        uint64_t v8 = *(void **)(a1 + 40);
        if (v8) {
          id v9 = (id)[v8 mutableCopy];
        }
        else {
          id v9 = (id)objc_msgSend(MEMORY[0x1E4F1CA60], "dictionaryWithCapacity:", objc_msgSend(*(id *)(*(void *)(a1 + 48) + 16), "count"));
        }
        *(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) = v9;
      }
      long long v10 = *(void **)(*(void *)(*(void *)(a1 + 56) + 8) + 40);
      return [v10 setObject:v7 forKeyedSubscript:a2];
    }
  }
  return result;
}

- (id)generatePathArray
{
  char v3 = (void *)[MEMORY[0x1E4F1CA48] array];
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __35__FigCaptureTrie_generatePathArray__block_invoke;
  v5[3] = &unk_1E5C24370;
  v5[4] = v3;
  [(FigCaptureTrie *)self enumeratePaths:v5];
  return v3;
}

uint64_t __35__FigCaptureTrie_generatePathArray__block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) addObject:a2];
}

@end