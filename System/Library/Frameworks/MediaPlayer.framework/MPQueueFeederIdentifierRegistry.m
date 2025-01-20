@interface MPQueueFeederIdentifierRegistry
+ (BOOL)supportsSecureCoding;
- (MPQueueFeederIdentifierRegistry)init;
- (MPQueueFeederIdentifierRegistry)initWithCoder:(id)a3;
- (NSMapTable)index;
- (NSMutableArray)identifierSets;
- (NSMutableArray)identifiers;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)identifierSetAtIndex:(int64_t)a3;
- (id)identifierSetForItem:(id)a3;
- (id)itemAtIndex:(int64_t)a3;
- (id)itemForIdentifierSet:(id)a3;
- (int64_t)count;
- (int64_t)indexForItem:(id)a3;
- (void)applyChanges:(id)a3 identifierSetLookupBlock:(id)a4;
- (void)encodeWithCoder:(id)a3;
- (void)replaceItemAndIdentifierSet:(id)a3 atIndex:(int64_t)a4;
- (void)setIdentifierSets:(id)a3;
- (void)setIdentifiers:(id)a3;
- (void)setIndex:(id)a3;
@end

@implementation MPQueueFeederIdentifierRegistry

- (id)identifierSetAtIndex:(int64_t)a3
{
  return (id)[(NSMutableArray *)self->_identifierSets objectAtIndexedSubscript:a3];
}

- (id)itemAtIndex:(int64_t)a3
{
  return (id)[(NSMutableArray *)self->_identifiers objectAtIndexedSubscript:a3];
}

- (int64_t)count
{
  return [(NSMutableArray *)self->_identifiers count];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

void __49__MPQueueFeederIdentifierRegistry_initWithCoder___block_invoke(uint64_t a1, const void *a2, uint64_t a3)
{
}

- (id)identifierSetForItem:(id)a3
{
  id v5 = a3;
  int64_t v6 = [(MPQueueFeederIdentifierRegistry *)self indexForItem:v5];
  if (v6 == 0x7FFFFFFFFFFFFFFFLL)
  {
    v9 = [MEMORY[0x1E4F28B00] currentHandler];
    [v9 handleFailureInMethod:a2, self, @"MPQueueFeederIdentifierRegistry.m", 175, @"Index not found for itemIdentifier: %@", v5 object file lineNumber description];
  }
  v7 = [(NSMutableArray *)self->_identifierSets objectAtIndexedSubscript:v6];

  return v7;
}

- (int64_t)indexForItem:(id)a3
{
  v4 = self->_index;
  id v5 = NSMapGet(v4, a3);

  if (v5) {
    return (int64_t)v5 - 1;
  }
  else {
    return 0x7FFFFFFFFFFFFFFFLL;
  }
}

- (MPQueueFeederIdentifierRegistry)init
{
  v10.receiver = self;
  v10.super_class = (Class)MPQueueFeederIdentifierRegistry;
  v2 = [(MPQueueFeederIdentifierRegistry *)&v10 init];
  if (v2)
  {
    uint64_t v3 = [MEMORY[0x1E4F1CA48] array];
    identifiers = v2->_identifiers;
    v2->_identifiers = (NSMutableArray *)v3;

    uint64_t v5 = [MEMORY[0x1E4F1CA48] array];
    identifierSets = v2->_identifierSets;
    v2->_identifierSets = (NSMutableArray *)v5;

    uint64_t v7 = [MEMORY[0x1E4F28E10] mapTableWithKeyOptions:0 valueOptions:1282];
    index = v2->_index;
    v2->_index = (NSMapTable *)v7;
  }
  return v2;
}

- (MPQueueFeederIdentifierRegistry)initWithCoder:(id)a3
{
  id v4 = a3;
  v22.receiver = self;
  v22.super_class = (Class)MPQueueFeederIdentifierRegistry;
  uint64_t v5 = [(MPQueueFeederIdentifierRegistry *)&v22 init];
  if (v5)
  {
    int64_t v6 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v7 = objc_opt_class();
    v8 = objc_msgSend(v6, "setWithObjects:", v7, objc_opt_class(), 0);
    uint64_t v9 = [v4 decodeObjectOfClasses:v8 forKey:@"i"];
    identifiers = v5->_identifiers;
    v5->_identifiers = (NSMutableArray *)v9;

    v11 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v12 = objc_opt_class();
    v13 = objc_msgSend(v11, "setWithObjects:", v12, objc_opt_class(), 0);
    uint64_t v14 = [v4 decodeObjectOfClasses:v13 forKey:@"s"];
    identifierSets = v5->_identifierSets;
    v5->_identifierSets = (NSMutableArray *)v14;

    uint64_t v16 = objc_msgSend(objc_alloc(MEMORY[0x1E4F28E10]), "initWithKeyOptions:valueOptions:capacity:", 0, 1282, -[NSMutableArray count](v5->_identifiers, "count"));
    index = v5->_index;
    v5->_index = (NSMapTable *)v16;

    v18 = v5->_identifiers;
    v20[0] = MEMORY[0x1E4F143A8];
    v20[1] = 3221225472;
    v20[2] = __49__MPQueueFeederIdentifierRegistry_initWithCoder___block_invoke;
    v20[3] = &unk_1E57F6570;
    v21 = v5;
    [(NSMutableArray *)v18 enumerateObjectsUsingBlock:v20];
  }
  return v5;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_index, 0);
  objc_storeStrong((id *)&self->_identifierSets, 0);

  objc_storeStrong((id *)&self->_identifiers, 0);
}

- (void)setIndex:(id)a3
{
}

- (NSMapTable)index
{
  return self->_index;
}

- (void)setIdentifierSets:(id)a3
{
}

- (NSMutableArray)identifierSets
{
  return self->_identifierSets;
}

- (void)setIdentifiers:(id)a3
{
}

- (NSMutableArray)identifiers
{
  return self->_identifiers;
}

- (id)itemForIdentifierSet:(id)a3
{
  id v4 = a3;
  uint64_t v13 = 0;
  uint64_t v14 = &v13;
  uint64_t v15 = 0x3032000000;
  uint64_t v16 = __Block_byref_object_copy__41409;
  v17 = __Block_byref_object_dispose__41410;
  id v18 = 0;
  identifierSets = self->_identifierSets;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __56__MPQueueFeederIdentifierRegistry_itemForIdentifierSet___block_invoke;
  v9[3] = &unk_1E57F6638;
  id v6 = v4;
  v11 = self;
  uint64_t v12 = &v13;
  id v10 = v6;
  [(NSMutableArray *)identifierSets enumerateObjectsUsingBlock:v9];
  id v7 = (id)v14[5];

  _Block_object_dispose(&v13, 8);

  return v7;
}

void __56__MPQueueFeederIdentifierRegistry_itemForIdentifierSet___block_invoke(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  if ([a2 intersectsSet:*(void *)(a1 + 32)])
  {
    uint64_t v7 = [*(id *)(a1 + 40) itemAtIndex:a3];
    uint64_t v8 = *(void *)(*(void *)(a1 + 48) + 8);
    uint64_t v9 = *(void **)(v8 + 40);
    *(void *)(v8 + 40) = v7;

    *a4 = 1;
  }
}

- (void)applyChanges:(id)a3 identifierSetLookupBlock:(id)a4
{
  uint64_t v56 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  if ([v6 hasChanges])
  {
    uint64_t v8 = [MEMORY[0x1E4F28E60] indexSet];
    uint64_t v9 = [MEMORY[0x1E4F28E60] indexSet];
    id v10 = [MEMORY[0x1E4F28E10] mapTableWithKeyOptions:1282 valueOptions:512];
    v50[0] = MEMORY[0x1E4F143A8];
    v50[1] = 3221225472;
    v50[2] = __73__MPQueueFeederIdentifierRegistry_applyChanges_identifierSetLookupBlock___block_invoke;
    v50[3] = &unk_1E57F6598;
    v50[4] = self;
    id v38 = v7;
    id v11 = v7;
    id v54 = v11;
    id v12 = v10;
    id v51 = v12;
    id v13 = v9;
    id v52 = v13;
    id v14 = v8;
    id v53 = v14;
    [v6 enumerateMovesUsingBlock:v50];
    unint64_t v15 = [v14 firstIndex];
    unint64_t v16 = [v13 firstIndex];
    if (v15 >= v16) {
      unint64_t v17 = v16;
    }
    else {
      unint64_t v17 = v15;
    }
    v48[0] = MEMORY[0x1E4F143A8];
    v48[1] = 3221225472;
    v48[2] = __73__MPQueueFeederIdentifierRegistry_applyChanges_identifierSetLookupBlock___block_invoke_2;
    v48[3] = &unk_1E57F65C0;
    v48[4] = self;
    id v37 = v11;
    id v49 = v37;
    [v6 enumerateUpdatesUsingBlock:v48];
    id v18 = [v6 deletedIndexes];
    unint64_t v19 = [v18 firstIndex];

    if (v17 >= v19) {
      unint64_t v20 = v19;
    }
    else {
      unint64_t v20 = v17;
    }
    long long v46 = 0u;
    long long v47 = 0u;
    long long v44 = 0u;
    long long v45 = 0u;
    identifiers = self->_identifiers;
    objc_super v22 = [v6 deletedIndexes];
    v23 = [(NSMutableArray *)identifiers objectsAtIndexes:v22];

    uint64_t v24 = [v23 countByEnumeratingWithState:&v44 objects:v55 count:16];
    if (v24)
    {
      uint64_t v25 = v24;
      uint64_t v26 = *(void *)v45;
      do
      {
        uint64_t v27 = 0;
        do
        {
          if (*(void *)v45 != v26) {
            objc_enumerationMutation(v23);
          }
          NSMapRemove(self->_index, *(const void **)(*((void *)&v44 + 1) + 8 * v27++));
        }
        while (v25 != v27);
        uint64_t v25 = [v23 countByEnumeratingWithState:&v44 objects:v55 count:16];
      }
      while (v25);
    }

    v28 = [v6 deletedIndexes];
    [v13 addIndexes:v28];

    [(NSMutableArray *)self->_identifiers removeObjectsAtIndexes:v13];
    [(NSMutableArray *)self->_identifierSets removeObjectsAtIndexes:v13];
    v29 = [v6 insertedIndexes];
    unint64_t v30 = [v29 firstIndex];

    if (v20 >= v30) {
      unint64_t v31 = v30;
    }
    else {
      unint64_t v31 = v20;
    }
    if (v31 >= 0x7FFFFFFFFFFFFFFFLL) {
      uint64_t v32 = 0x7FFFFFFFFFFFFFFFLL;
    }
    else {
      uint64_t v32 = v31;
    }
    v33 = [v6 insertedIndexes];
    [v14 addIndexes:v33];
    v40[0] = MEMORY[0x1E4F143A8];
    v40[1] = 3221225472;
    v40[2] = __73__MPQueueFeederIdentifierRegistry_applyChanges_identifierSetLookupBlock___block_invoke_3;
    v40[3] = &unk_1E57F65E8;
    id v41 = v12;
    v42 = self;
    id v43 = v37;
    id v34 = v12;
    [v14 enumerateIndexesUsingBlock:v40];
    uint64_t v35 = [(NSMutableArray *)self->_identifiers count];
    v36 = objc_msgSend(MEMORY[0x1E4F28D60], "indexSetWithIndexesInRange:", v32, v35 - v32);
    v39[0] = MEMORY[0x1E4F143A8];
    v39[1] = 3221225472;
    v39[2] = __73__MPQueueFeederIdentifierRegistry_applyChanges_identifierSetLookupBlock___block_invoke_4;
    v39[3] = &unk_1E57F6610;
    v39[4] = self;
    [v36 enumerateIndexesUsingBlock:v39];

    id v7 = v38;
  }
}

void __73__MPQueueFeederIdentifierRegistry_applyChanges_identifierSetLookupBlock___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, int a4)
{
  id v10 = [*(id *)(*(void *)(a1 + 32) + 8) objectAtIndex:a2];
  uint64_t v8 = [*(id *)(*(void *)(a1 + 32) + 16) objectAtIndex:a2];
  if (a4)
  {
    uint64_t v9 = (*(void (**)(void))(*(void *)(a1 + 64) + 16))();

    uint64_t v8 = (void *)v9;
  }
  NSMapInsert(*(NSMapTable **)(a1 + 40), (const void *)(a3 + 1), (const void *)[MEMORY[0x1E4F779D8] pairWithFirst:v10 second:v8]);
  [*(id *)(a1 + 48) addIndex:a2];
  [*(id *)(a1 + 56) addIndex:a3];
}

void __73__MPQueueFeederIdentifierRegistry_applyChanges_identifierSetLookupBlock___block_invoke_2(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void **)(*(void *)(a1 + 32) + 16);
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  id v4 = (id)objc_claimAutoreleasedReturnValue();
  [v3 replaceObjectAtIndex:a2 withObject:v4];
}

void __73__MPQueueFeederIdentifierRegistry_applyChanges_identifierSetLookupBlock___block_invoke_3(uint64_t a1, uint64_t a2)
{
  id v4 = (void *)MEMORY[0x19971DE60]();
  uint64_t v5 = NSMapGet(*(NSMapTable **)(a1 + 32), (const void *)(a2 + 1));
  id v6 = v5;
  id v7 = *(void **)(*(void *)(a1 + 40) + 8);
  if (v5)
  {
    uint64_t v8 = [v5 first];
    [v7 insertObject:v8 atIndex:a2];

    uint64_t v9 = *(void **)(*(void *)(a1 + 40) + 16);
    [v6 second];
  }
  else
  {
    id v10 = MSVNanoIDCreateTaggedPointer();
    [v7 insertObject:v10 atIndex:a2];

    uint64_t v9 = *(void **)(*(void *)(a1 + 40) + 16);
    (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  id v11 = };
  [v9 insertObject:v11 atIndex:a2];
}

void __73__MPQueueFeederIdentifierRegistry_applyChanges_identifierSetLookupBlock___block_invoke_4(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void **)(a1 + 32);
  id v4 = (NSMapTable *)v3[3];
  uint64_t v5 = (const void *)[v3 itemAtIndex:a2];

  NSMapInsert(v4, v5, (const void *)(a2 + 1));
}

- (void)replaceItemAndIdentifierSet:(id)a3 atIndex:(int64_t)a4
{
  id v6 = a3;
  key = [(MPQueueFeederIdentifierRegistry *)self itemAtIndex:a4];
  id v7 = MSVNanoIDCreateTaggedPointer();
  [(NSMutableArray *)self->_identifiers replaceObjectAtIndex:a4 withObject:v7];
  [(NSMutableArray *)self->_identifierSets replaceObjectAtIndex:a4 withObject:v6];
  NSMapRemove(self->_index, key);
  NSMapInsert(self->_index, v7, (const void *)(a4 + 1));
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = objc_alloc_init(MPQueueFeederIdentifierRegistry);
  uint64_t v5 = (void *)[(NSMutableArray *)self->_identifiers mutableCopy];
  [(MPQueueFeederIdentifierRegistry *)v4 setIdentifiers:v5];

  id v6 = (void *)[(NSMutableArray *)self->_identifierSets mutableCopy];
  [(MPQueueFeederIdentifierRegistry *)v4 setIdentifierSets:v6];

  id v7 = (void *)[(NSMapTable *)self->_index copy];
  [(MPQueueFeederIdentifierRegistry *)v4 setIndex:v7];

  return v4;
}

- (void)encodeWithCoder:(id)a3
{
  identifiers = self->_identifiers;
  id v5 = a3;
  [v5 encodeObject:identifiers forKey:@"i"];
  [v5 encodeObject:self->_identifierSets forKey:@"s"];
}

- (id)description
{
  uint64_t v3 = objc_msgSend(MEMORY[0x1E4F28E78], "stringWithFormat:", @"<%@: %p> ("), objc_opt_class(), self;
  if ([(NSMutableArray *)self->_identifiers count])
  {
    unint64_t v4 = 0;
    do
    {
      id v5 = [(NSMutableArray *)self->_identifiers objectAtIndexedSubscript:v4];
      id v6 = [(NSMutableArray *)self->_identifierSets objectAtIndexedSubscript:v4];
      id v7 = [v6 humanDescription];
      [v3 appendFormat:@"\n    [%ld] %@ : %@,", v4, v5, v7];

      ++v4;
    }
    while (v4 < [(NSMutableArray *)self->_identifiers count]);
  }
  [v3 appendString:@""]);
  uint64_t v8 = (void *)[v3 copy];

  return v8;
}

@end