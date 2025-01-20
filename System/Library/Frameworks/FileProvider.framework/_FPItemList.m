@interface _FPItemList
- (BOOL)isObsoleteID:(id)a3;
- (_FPItemList)init;
- (id)allObjects;
- (id)description;
- (id)formerIDs;
- (id)itemIDsDifferenceWithList:(id)a3;
- (id)itemWithItemID:(id)a3;
- (id)mutableCopy;
- (id)objectAtIndex:(unint64_t)a3;
- (id)redactedDescription;
- (unint64_t)count;
- (unint64_t)indexOfItemID:(id)a3;
- (unint64_t)indexOfObject:(id)a3;
- (unint64_t)indexOfObject:(id)a3 inSortedRange:(_NSRange)a4 options:(unint64_t)a5 usingComparator:(id)a6;
- (void)addObject:(id)a3;
- (void)insertObject:(id)a3 atIndex:(unint64_t)a4;
- (void)removeLastObject;
- (void)removeObjectAtIndex:(unint64_t)a3;
- (void)removeObjectWithID:(id)a3;
- (void)replaceObjectAtIndex:(unint64_t)a3 withObject:(id)a4;
- (void)sortUsingDescriptors:(id)a3;
@end

@implementation _FPItemList

- (unint64_t)indexOfItemID:(id)a3
{
  v4 = [(NSMutableDictionary *)self->_itemsByIDs objectForKeyedSubscript:a3];
  if (v4) {
    unint64_t v5 = [(NSMutableOrderedSet *)self->_orderedSet indexOfObject:v4];
  }
  else {
    unint64_t v5 = 0x7FFFFFFFFFFFFFFFLL;
  }

  return v5;
}

- (unint64_t)count
{
  return [(NSMutableOrderedSet *)self->_orderedSet count];
}

- (BOOL)isObsoleteID:(id)a3
{
  v3 = [(NSMutableDictionary *)self->_formerIDs objectForKey:a3];
  BOOL v4 = v3 != 0;

  return v4;
}

- (void)insertObject:(id)a3 atIndex:(unint64_t)a4
{
  id v12 = a3;
  itemsByIDs = self->_itemsByIDs;
  v7 = [v12 itemID];
  [(NSMutableDictionary *)itemsByIDs setObject:v12 forKeyedSubscript:v7];

  [(NSMutableOrderedSet *)self->_orderedSet insertObject:v12 atIndex:a4];
  v8 = [v12 formerItemID];

  if (v8)
  {
    formerIDs = self->_formerIDs;
    v10 = [v12 itemID];
    v11 = [v12 formerItemID];
    [(NSMutableDictionary *)formerIDs setObject:v10 forKey:v11];
  }
}

- (unint64_t)indexOfObject:(id)a3 inSortedRange:(_NSRange)a4 options:(unint64_t)a5 usingComparator:(id)a6
{
  return -[NSMutableOrderedSet indexOfObject:inSortedRange:options:usingComparator:](self->_orderedSet, "indexOfObject:inSortedRange:options:usingComparator:", a3, a4.location, a4.length, a5, a6);
}

- (_FPItemList)init
{
  v10.receiver = self;
  v10.super_class = (Class)_FPItemList;
  v2 = [(_FPItemList *)&v10 init];
  if (v2)
  {
    uint64_t v3 = [MEMORY[0x1E4F1CA70] orderedSet];
    orderedSet = v2->_orderedSet;
    v2->_orderedSet = (NSMutableOrderedSet *)v3;

    uint64_t v5 = [MEMORY[0x1E4F1CA60] dictionary];
    itemsByIDs = v2->_itemsByIDs;
    v2->_itemsByIDs = (NSMutableDictionary *)v5;

    uint64_t v7 = [MEMORY[0x1E4F1CA60] dictionary];
    formerIDs = v2->_formerIDs;
    v2->_formerIDs = (NSMutableDictionary *)v7;
  }
  return v2;
}

- (id)formerIDs
{
  return self->_formerIDs;
}

- (id)allObjects
{
  return (id)[(NSMutableOrderedSet *)self->_orderedSet array];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_formerIDs, 0);
  objc_storeStrong((id *)&self->_itemsByIDs, 0);

  objc_storeStrong((id *)&self->_orderedSet, 0);
}

- (id)mutableCopy
{
  uint64_t v3 = objc_alloc_init(_FPItemList);
  uint64_t v4 = [(NSMutableOrderedSet *)self->_orderedSet mutableCopy];
  orderedSet = v3->_orderedSet;
  v3->_orderedSet = (NSMutableOrderedSet *)v4;

  uint64_t v6 = [(NSMutableDictionary *)self->_itemsByIDs mutableCopy];
  itemsByIDs = v3->_itemsByIDs;
  v3->_itemsByIDs = (NSMutableDictionary *)v6;

  uint64_t v8 = [(NSMutableDictionary *)self->_formerIDs mutableCopy];
  formerIDs = v3->_formerIDs;
  v3->_formerIDs = (NSMutableDictionary *)v8;

  return v3;
}

- (id)description
{
  if ((unint64_t)[(NSMutableOrderedSet *)self->_orderedSet count] > 5)
  {
    uint64_t v4 = NSString;
    uint64_t v5 = -[_FPItemList subarrayWithRange:](self, "subarrayWithRange:", 0, 5);
    uint64_t v6 = [v5 description];
    uint64_t v3 = [v4 stringWithFormat:@"{%@ and %lu others}", v6, -[NSMutableOrderedSet count](self->_orderedSet, "count") - 5];
  }
  else
  {
    uint64_t v3 = [(NSMutableOrderedSet *)self->_orderedSet description];
  }

  return v3;
}

- (id)redactedDescription
{
  return (id)objc_msgSend(NSString, "stringWithFormat:", @"{%lu items}", -[NSMutableOrderedSet count](self->_orderedSet, "count"));
}

- (id)itemIDsDifferenceWithList:(id)a3
{
  orderedSet = self->_orderedSet;
  uint64_t v4 = a3;
  uint64_t v5 = (void *)[(NSMutableOrderedSet *)orderedSet mutableCopy];
  uint64_t v6 = v4[1];

  [v5 minusOrderedSet:v6];
  uint64_t v7 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(v5, "count"));
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __41___FPItemList_itemIDsDifferenceWithList___block_invoke;
  v10[3] = &unk_1E5AF2398;
  id v8 = v7;
  id v11 = v8;
  [v5 enumerateObjectsUsingBlock:v10];

  return v8;
}

- (id)objectAtIndex:(unint64_t)a3
{
  return (id)[(NSMutableOrderedSet *)self->_orderedSet objectAtIndex:a3];
}

- (unint64_t)indexOfObject:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [v4 itemID];
  unint64_t v6 = [(_FPItemList *)self indexOfItemID:v5];

  if (v6 == 0x7FFFFFFFFFFFFFFFLL)
  {
    uint64_t v7 = [v4 formerItemID];
    if (v7) {
      unint64_t v6 = [(_FPItemList *)self indexOfItemID:v7];
    }
    else {
      unint64_t v6 = 0x7FFFFFFFFFFFFFFFLL;
    }
  }
  return v6;
}

- (void)removeObjectWithID:(id)a3
{
  id v9 = a3;
  id v4 = -[NSMutableDictionary objectForKeyedSubscript:](self->_itemsByIDs, "objectForKeyedSubscript:");
  [(NSMutableOrderedSet *)self->_orderedSet removeObject:v4];
  uint64_t v5 = [v4 formerItemID];

  if (v5)
  {
    formerIDs = self->_formerIDs;
    uint64_t v7 = [v4 formerItemID];
    [(NSMutableDictionary *)formerIDs removeObjectForKey:v7];
  }
  if (!v4)
  {
    id v8 = [(NSMutableDictionary *)self->_formerIDs objectForKey:v9];
    if (v8) {
      [(_FPItemList *)self removeObjectWithID:v8];
    }
  }
}

- (void)removeObjectAtIndex:(unint64_t)a3
{
  -[NSMutableOrderedSet objectAtIndex:](self->_orderedSet, "objectAtIndex:");
  id v10 = (id)objc_claimAutoreleasedReturnValue();
  itemsByIDs = self->_itemsByIDs;
  unint64_t v6 = [v10 itemID];
  [(NSMutableDictionary *)itemsByIDs setObject:0 forKeyedSubscript:v6];

  [(NSMutableOrderedSet *)self->_orderedSet removeObjectAtIndex:a3];
  uint64_t v7 = [v10 formerItemID];

  if (v7)
  {
    formerIDs = self->_formerIDs;
    id v9 = [v10 formerItemID];
    [(NSMutableDictionary *)formerIDs removeObjectForKey:v9];
  }
}

- (void)addObject:(id)a3
{
  id v9 = a3;
  itemsByIDs = self->_itemsByIDs;
  uint64_t v5 = [v9 itemID];
  [(NSMutableDictionary *)itemsByIDs setObject:v9 forKeyedSubscript:v5];

  [(NSMutableOrderedSet *)self->_orderedSet addObject:v9];
  unint64_t v6 = [v9 formerItemID];

  if (v6)
  {
    formerIDs = self->_formerIDs;
    id v8 = [v9 formerItemID];
    [(NSMutableDictionary *)formerIDs removeObjectForKey:v8];
  }
}

- (void)removeLastObject
{
  if ([(NSMutableOrderedSet *)self->_orderedSet count])
  {
    uint64_t v3 = [(NSMutableOrderedSet *)self->_orderedSet count] - 1;
    [(_FPItemList *)self removeObjectAtIndex:v3];
  }
}

- (void)replaceObjectAtIndex:(unint64_t)a3 withObject:(id)a4
{
  id v17 = a4;
  unint64_t v6 = [(NSMutableOrderedSet *)self->_orderedSet objectAtIndex:a3];
  itemsByIDs = self->_itemsByIDs;
  id v8 = [v6 itemID];
  [(NSMutableDictionary *)itemsByIDs setObject:0 forKeyedSubscript:v8];

  id v9 = self->_itemsByIDs;
  id v10 = [v17 itemID];
  [(NSMutableDictionary *)v9 setObject:v17 forKeyedSubscript:v10];

  [(NSMutableOrderedSet *)self->_orderedSet replaceObjectAtIndex:a3 withObject:v17];
  id v11 = [v6 formerItemID];

  if (v11)
  {
    formerIDs = self->_formerIDs;
    v13 = [v17 formerItemID];
    [(NSMutableDictionary *)formerIDs removeObjectForKey:v13];
  }
  v14 = [v17 formerItemID];

  if (v14)
  {
    v15 = self->_formerIDs;
    v16 = [v17 formerItemID];
    [(NSMutableDictionary *)v15 removeObjectForKey:v16];
  }
}

- (void)sortUsingDescriptors:(id)a3
{
}

- (id)itemWithItemID:(id)a3
{
  return (id)[(NSMutableDictionary *)self->_itemsByIDs objectForKeyedSubscript:a3];
}

@end