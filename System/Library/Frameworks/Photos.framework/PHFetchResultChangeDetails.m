@interface PHFetchResultChangeDetails
+ (PHFetchResultChangeDetails)changeDetailsFromFetchResult:(PHFetchResult *)fromResult toFetchResult:(PHFetchResult *)toResult changedObjects:(NSArray *)changedObjects;
+ (id)_identifiersForPHObjects:(id)a3;
- (BOOL)hasAnyChanges;
- (BOOL)hasDiffs;
- (BOOL)hasIncrementalChanges;
- (BOOL)hasMoves;
- (BOOL)shouldReload;
- (NSArray)changedObjects;
- (NSArray)insertedObjects;
- (NSArray)removedObjects;
- (NSIndexSet)changedIndexes;
- (NSIndexSet)insertedIndexes;
- (NSIndexSet)movedIndexes;
- (NSIndexSet)removedIndexes;
- (PHFetchResult)fetchResultAfterChanges;
- (PHFetchResult)fetchResultBeforeChanges;
- (PHFetchResultChangeDetails)initWithFetchResult:(id)a3 currentFetchResult:(id)a4 changedIdentifiers:(id)a5 unknownMergeEvent:(BOOL)a6;
- (PHFetchResultChangeDetails)initWithFetchResult:(id)a3 currentFetchResult:(id)a4 sortedChangedIdentifiers:(id)a5 unknownMergeEvent:(BOOL)a6;
- (PHFetchResultChangeDetails)initWithManualFetchResultAfterChanges:(id)a3;
- (PLSortedChangedObjects)sortedChangedIdentifiers;
- (__CFArray)movedFromIndexes;
- (id)_addAdditionalIndexesToChanges:(id)a3 withPreviousIdentifiers:(id)a4 currentIdentifiers:(id)a5;
- (id)description;
- (unint64_t)snapshotIndexForContainedObject:(id)a3;
- (void)calculateDiffs;
- (void)calculateDiffsAndAccumulateInsertedCount:(unint64_t *)a3 updatedCount:(unint64_t *)a4 deletedCount:(unint64_t *)a5;
- (void)dealloc;
- (void)enumerateMovesWithBlock:(void *)handler;
@end

@implementation PHFetchResultChangeDetails

- (NSIndexSet)movedIndexes
{
  return self->_movedIndexes;
}

- (__CFArray)movedFromIndexes
{
  return self->_movedFromIndexes;
}

- (BOOL)hasAnyChanges
{
  if (![(PHFetchResultChangeDetails *)self hasIncrementalChanges]) {
    return 1;
  }
  v3 = [(PHFetchResultChangeDetails *)self removedIndexes];
  uint64_t v4 = [v3 count];

  if (v4) {
    return 1;
  }
  v5 = [(PHFetchResultChangeDetails *)self insertedIndexes];
  uint64_t v6 = [v5 count];

  if (v6) {
    return 1;
  }
  v7 = [(PHFetchResultChangeDetails *)self changedIndexes];
  uint64_t v8 = [v7 count];

  if (v8) {
    return 1;
  }

  return [(PHFetchResultChangeDetails *)self hasMoves];
}

- (NSIndexSet)removedIndexes
{
  [(PHFetchResultChangeDetails *)self calculateDiffs];
  removedIndexes = self->_removedIndexes;

  return removedIndexes;
}

- (NSIndexSet)insertedIndexes
{
  [(PHFetchResultChangeDetails *)self calculateDiffs];
  insertedIndexes = self->_insertedIndexes;

  return insertedIndexes;
}

- (BOOL)hasIncrementalChanges
{
  return ![(PHFetchResultChangeDetails *)self shouldReload];
}

- (BOOL)shouldReload
{
  return self->_skipIncrementalChanges;
}

+ (PHFetchResultChangeDetails)changeDetailsFromFetchResult:(PHFetchResult *)fromResult toFetchResult:(PHFetchResult *)toResult changedObjects:(NSArray *)changedObjects
{
  v5 = 0;
  if (fromResult && toResult)
  {
    uint64_t v8 = toResult;
    v9 = fromResult;
    v10 = +[PHFetchResultChangeDetails _identifiersForPHObjects:changedObjects];
    v5 = [[PHFetchResultChangeDetails alloc] initWithFetchResult:v9 currentFetchResult:v8 changedIdentifiers:v10 unknownMergeEvent:0];

    [(PHFetchResultChangeDetails *)v5 calculateDiffs];
  }

  return v5;
}

- (NSIndexSet)changedIndexes
{
  [(PHFetchResultChangeDetails *)self calculateDiffs];
  changedIndexes = self->_changedIndexes;

  return changedIndexes;
}

- (void)calculateDiffs
{
  if (!self->_skipIncrementalChanges && !self->_currentObjects)
  {
    v3 = [(PHFetchResult *)self->_fetchResultAfterChanges fetchedObjects];
    currentObjects = self->_currentObjects;
    self->_currentObjects = v3;

    v5 = +[PHFetchResultChangeDetails _identifiersForPHObjects:self->_previousObjects];
    uint64_t v6 = +[PHFetchResultChangeDetails _identifiersForPHObjects:self->_currentObjects];
    v7 = [(id)objc_opt_class() pointerComparableIdentifiersFromIdentifiers:v5];
    uint64_t v8 = [(id)objc_opt_class() pointerComparableIdentifiersFromIdentifiers:v6];
    PLDiffArrays();
    id v14 = 0;
    id v9 = 0;
    id v10 = 0;
    id v11 = 0;
    objc_storeStrong((id *)&self->_removedIndexes, 0);
    objc_storeStrong((id *)&self->_insertedIndexes, 0);
    objc_storeStrong((id *)&self->_movedIndexes, 0);
    self->_movedFromIndexes = 0;
    v12 = [(PHFetchResultChangeDetails *)self _addAdditionalIndexesToChanges:v11 withPreviousIdentifiers:v5 currentIdentifiers:v6];
    changedIndexes = self->_changedIndexes;
    self->_changedIndexes = v12;
  }
}

+ (id)_identifiersForPHObjects:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v4 = [v3 oids];
  }
  else
  {
    uint64_t v4 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(v3, "count"));
    long long v12 = 0u;
    long long v13 = 0u;
    long long v14 = 0u;
    long long v15 = 0u;
    id v5 = v3;
    uint64_t v6 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
    if (v6)
    {
      uint64_t v7 = v6;
      uint64_t v8 = *(void *)v13;
      do
      {
        for (uint64_t i = 0; i != v7; ++i)
        {
          if (*(void *)v13 != v8) {
            objc_enumerationMutation(v5);
          }
          id v10 = objc_msgSend(*(id *)(*((void *)&v12 + 1) + 8 * i), "identifier", (void)v12);
          [v4 addObject:v10];
        }
        uint64_t v7 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
      }
      while (v7);
    }
  }

  return v4;
}

- (PHFetchResultChangeDetails)initWithFetchResult:(id)a3 currentFetchResult:(id)a4 changedIdentifiers:(id)a5 unknownMergeEvent:(BOOL)a6
{
  BOOL v6 = a6;
  id v10 = (objc_class *)MEMORY[0x1E4F8AC08];
  id v11 = a5;
  id v12 = a4;
  id v13 = a3;
  long long v14 = (void *)[[v10 alloc] initWithChangedObjects:v11];

  long long v15 = [(PHFetchResultChangeDetails *)self initWithFetchResult:v13 currentFetchResult:v12 sortedChangedIdentifiers:v14 unknownMergeEvent:v6];
  return v15;
}

- (PHFetchResultChangeDetails)initWithFetchResult:(id)a3 currentFetchResult:(id)a4 sortedChangedIdentifiers:(id)a5 unknownMergeEvent:(BOOL)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  v19.receiver = self;
  v19.super_class = (Class)PHFetchResultChangeDetails;
  long long v14 = [(PHFetchResultChangeDetails *)&v19 init];
  long long v15 = v14;
  if (v14)
  {
    objc_storeStrong((id *)&v14->_fetchResultBeforeChanges, a3);
    objc_storeStrong((id *)&v15->_fetchResultAfterChanges, a4);
    uint64_t v16 = [v11 fetchedObjects];
    previousObjects = v15->_previousObjects;
    v15->_previousObjects = (NSArray *)v16;

    objc_storeStrong((id *)&v15->_sortedChangedIdentifiers, a5);
    v15->_skipIncrementalChanges = a6;
  }

  return v15;
}

- (id)_addAdditionalIndexesToChanges:(id)a3 withPreviousIdentifiers:(id)a4 currentIdentifiers:(id)a5
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if ([v8 count]) {
    id v11 = (void *)[v8 mutableCopy];
  }
  else {
    id v11 = 0;
  }
  id v12 = [(PHFetchResult *)self->_fetchResultAfterChanges additionalChangedIdentifiersFromPreviousIdentifiers:v9 currentIdentifiers:v10 inFetchResultBeforeChanges:self->_fetchResultBeforeChanges];
  if ([v12 count])
  {
    if (!v11)
    {
      id v11 = [MEMORY[0x1E4F28E60] indexSet];
    }
    long long v22 = 0u;
    long long v23 = 0u;
    long long v20 = 0u;
    long long v21 = 0u;
    id v13 = v12;
    uint64_t v14 = [v13 countByEnumeratingWithState:&v20 objects:v24 count:16];
    if (v14)
    {
      uint64_t v15 = v14;
      uint64_t v16 = *(void *)v21;
      do
      {
        for (uint64_t i = 0; i != v15; ++i)
        {
          if (*(void *)v21 != v16) {
            objc_enumerationMutation(v13);
          }
          uint64_t v18 = objc_msgSend(v10, "indexOfObject:", *(void *)(*((void *)&v20 + 1) + 8 * i), (void)v20);
          if (v18 != 0x7FFFFFFFFFFFFFFFLL) {
            [v11 addIndex:v18];
          }
        }
        uint64_t v15 = [v13 countByEnumeratingWithState:&v20 objects:v24 count:16];
      }
      while (v15);
    }
  }

  return v11;
}

- (void)dealloc
{
  movedFromIndexes = self->_movedFromIndexes;
  if (movedFromIndexes)
  {
    CFRelease(movedFromIndexes);
    self->_movedFromIndexes = 0;
  }
  v4.receiver = self;
  v4.super_class = (Class)PHFetchResultChangeDetails;
  [(PHFetchResultChangeDetails *)&v4 dealloc];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_changedIndexes, 0);
  objc_storeStrong((id *)&self->_sortedChangedIdentifiers, 0);
  objc_storeStrong((id *)&self->_movedIndexes, 0);
  objc_storeStrong((id *)&self->_insertedIndexes, 0);
  objc_storeStrong((id *)&self->_removedIndexes, 0);
  objc_storeStrong((id *)&self->_currentObjects, 0);
  objc_storeStrong((id *)&self->_previousObjects, 0);
  objc_storeStrong((id *)&self->_fetchResultAfterChanges, 0);

  objc_storeStrong((id *)&self->_fetchResultBeforeChanges, 0);
}

- (PHFetchResult)fetchResultBeforeChanges
{
  return self->_fetchResultBeforeChanges;
}

- (PHFetchResult)fetchResultAfterChanges
{
  fetchResultAfterChanges = self->_fetchResultAfterChanges;
  if (!fetchResultAfterChanges)
  {
    objc_super v4 = [(PHFetchResult *)self->_fetchResultBeforeChanges fetchResultWithChangeHandlingValue:0];
    id v5 = self->_fetchResultAfterChanges;
    self->_fetchResultAfterChanges = v4;

    fetchResultAfterChanges = self->_fetchResultAfterChanges;
  }
  [(PHFetchResult *)fetchResultAfterChanges updateRegistrationForChangeNotificationDeltas];
  BOOL v6 = self->_fetchResultAfterChanges;

  return v6;
}

- (id)description
{
  v12.receiver = self;
  v12.super_class = (Class)PHFetchResultChangeDetails;
  id v3 = [(PHFetchResultChangeDetails *)&v12 description];
  objc_super v4 = [(PHFetchResultChangeDetails *)self fetchResultBeforeChanges];
  id v5 = [(PHFetchResultChangeDetails *)self fetchResultAfterChanges];
  BOOL v6 = [(PHFetchResultChangeDetails *)self hasIncrementalChanges];
  uint64_t v7 = [(PHFetchResultChangeDetails *)self removedIndexes];
  id v8 = [(PHFetchResultChangeDetails *)self insertedIndexes];
  id v9 = [(PHFetchResultChangeDetails *)self changedIndexes];
  id v10 = [v3 stringByAppendingFormat:@" before=%@, after=%@, hasIncremental=%d deleted=%@, inserted=%@, changed=%@, hasMoves=%d", v4, v5, v6, v7, v8, v9, -[PHFetchResultChangeDetails hasMoves](self, "hasMoves")];

  return v10;
}

- (BOOL)hasDiffs
{
  if ([(PHFetchResultChangeDetails *)self shouldReload]
    || [(PHFetchResultChangeDetails *)self hasMoves])
  {
    return 1;
  }
  objc_super v4 = [(PHFetchResultChangeDetails *)self insertedIndexes];
  if (v4)
  {
    BOOL v3 = 1;
  }
  else
  {
    id v5 = [(PHFetchResultChangeDetails *)self removedIndexes];
    if (v5)
    {
      BOOL v3 = 1;
    }
    else
    {
      BOOL v6 = [(PHFetchResultChangeDetails *)self changedIndexes];
      BOOL v3 = v6 != 0;
    }
  }

  return v3;
}

- (PLSortedChangedObjects)sortedChangedIdentifiers
{
  return self->_sortedChangedIdentifiers;
}

- (void)calculateDiffsAndAccumulateInsertedCount:(unint64_t *)a3 updatedCount:(unint64_t *)a4 deletedCount:(unint64_t *)a5
{
  *a3 += [(NSIndexSet *)self->_insertedIndexes count];
  *a4 += [(NSIndexSet *)self->_changedIndexes count];
  *a5 += [(NSIndexSet *)self->_removedIndexes count];
}

- (unint64_t)snapshotIndexForContainedObject:(id)a3
{
  fetchResultBeforeChanges = self->_fetchResultBeforeChanges;
  if (fetchResultBeforeChanges) {
    return [(PHFetchResult *)fetchResultBeforeChanges indexOfObject:a3];
  }
  else {
    return 0x7FFFFFFFFFFFFFFFLL;
  }
}

- (BOOL)hasMoves
{
  return [(NSIndexSet *)self->_movedIndexes count] != 0;
}

- (void)enumerateMovesWithBlock:(void *)handler
{
  objc_super v4 = handler;
  [(PHFetchResultChangeDetails *)self calculateDiffs];
  movedIndexes = self->_movedIndexes;
  if (movedIndexes)
  {
    v9[0] = 0;
    v9[1] = v9;
    v9[2] = 0x2020000000;
    v9[3] = 0;
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __54__PHFetchResultChangeDetails_enumerateMovesWithBlock___block_invoke;
    v6[3] = &unk_1E58482A8;
    v6[4] = self;
    id v8 = v9;
    id v7 = v4;
    [(NSIndexSet *)movedIndexes enumerateIndexesUsingBlock:v6];

    _Block_object_dispose(v9, 8);
  }
}

uint64_t __54__PHFetchResultChangeDetails_enumerateMovesWithBlock___block_invoke(void *a1)
{
  CFArrayRef v2 = *(const __CFArray **)(a1[4] + 64);
  uint64_t v3 = *(void *)(a1[6] + 8);
  CFIndex v4 = *(void *)(v3 + 24);
  *(void *)(v3 + 24) = v4 + 1;
  CFArrayGetValueAtIndex(v2, v4);
  id v5 = *(uint64_t (**)(void))(a1[5] + 16);

  return v5();
}

- (NSArray)changedObjects
{
  [(PHFetchResultChangeDetails *)self calculateDiffs];
  if (self->_changedIndexes)
  {
    uint64_t v3 = -[NSArray objectsAtIndexes:](self->_currentObjects, "objectsAtIndexes:");
  }
  else
  {
    uint64_t v3 = (void *)MEMORY[0x1E4F1CBF0];
  }

  return (NSArray *)v3;
}

- (NSArray)insertedObjects
{
  [(PHFetchResultChangeDetails *)self calculateDiffs];
  if (self->_insertedIndexes)
  {
    uint64_t v3 = -[NSArray objectsAtIndexes:](self->_currentObjects, "objectsAtIndexes:");
  }
  else
  {
    uint64_t v3 = (void *)MEMORY[0x1E4F1CBF0];
  }

  return (NSArray *)v3;
}

- (NSArray)removedObjects
{
  [(PHFetchResultChangeDetails *)self calculateDiffs];
  if (self->_removedIndexes)
  {
    uint64_t v3 = -[NSArray objectsAtIndexes:](self->_previousObjects, "objectsAtIndexes:");
  }
  else
  {
    uint64_t v3 = (void *)MEMORY[0x1E4F1CBF0];
  }

  return (NSArray *)v3;
}

- (PHFetchResultChangeDetails)initWithManualFetchResultAfterChanges:(id)a3
{
  id v5 = a3;
  v11.receiver = self;
  v11.super_class = (Class)PHFetchResultChangeDetails;
  BOOL v6 = [(PHFetchResultChangeDetails *)&v11 init];
  id v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_fetchResultAfterChanges, a3);
    uint64_t v8 = [v5 fetchedObjects];
    previousObjects = v7->_previousObjects;
    v7->_previousObjects = (NSArray *)v8;

    v7->_skipIncrementalChanges = 1;
  }

  return v7;
}

@end