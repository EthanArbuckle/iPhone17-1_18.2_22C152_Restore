@interface CRKOrderedOneToManyKVOAccumulator
- (BOOL)_integrateChange:(id)a3 toArray:(id)a4;
- (BOOL)hasChanges;
- (CRKOrderedOneToManyKVOAccumulator)initWithObject:(id)a3 keyPath:(id)a4;
- (CRKOrderedOneToManyKVOAccumulatorDelegate)delegate;
- (NSObject)observedObject;
- (NSString)observedKeyPath;
- (id)_resultsToArriveAtArray:(id)a3;
- (unint64_t)_prestateIndexForImmediateIndex:(unint64_t)a3;
- (void)_drain;
- (void)_reset;
- (void)_validateArrayChangeToFinalCount:(int64_t)a3 accumulatedResults:(id)a4;
- (void)dealloc;
- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6;
- (void)setDelegate:(id)a3;
- (void)setObservedKeyPath:(id)a3;
- (void)setObservedObject:(id)a3;
@end

@implementation CRKOrderedOneToManyKVOAccumulator

- (CRKOrderedOneToManyKVOAccumulator)initWithObject:(id)a3 keyPath:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v20.receiver = self;
  v20.super_class = (Class)CRKOrderedOneToManyKVOAccumulator;
  v8 = [(CRKOrderedOneToManyKVOAccumulator *)&v20 init];
  if (v8)
  {
    uint64_t v9 = objc_opt_new();
    mReplacementObjects = v8->mReplacementObjects;
    v8->mReplacementObjects = (CRKPointerSet *)v9;

    uint64_t v11 = objc_opt_new();
    mInsertedObjects = v8->mInsertedObjects;
    v8->mInsertedObjects = (CRKPointerSet *)v11;

    uint64_t v13 = [MEMORY[0x263F08968] mapTableWithKeyOptions:512 valueOptions:0];
    mIndexForDeletedObject = v8->mIndexForDeletedObject;
    v8->mIndexForDeletedObject = (NSMapTable *)v13;

    uint64_t v15 = [MEMORY[0x263F08968] mapTableWithKeyOptions:512 valueOptions:0];
    mOriginalIndexOfMovedObject = v8->mOriginalIndexOfMovedObject;
    v8->mOriginalIndexOfMovedObject = (NSMapTable *)v15;

    [v6 addObserver:v8 forKeyPath:v7 options:11 context:@"CRKOrderedOneToManyKVOAccumulatorObservationContext"];
    uint64_t v17 = [v7 copy];
    observedKeyPath = v8->_observedKeyPath;
    v8->_observedKeyPath = (NSString *)v17;

    objc_storeWeak((id *)&v8->_observedObject, v6);
  }

  return v8;
}

- (void)dealloc
{
  v3 = [(CRKOrderedOneToManyKVOAccumulator *)self observedObject];
  v4 = [(CRKOrderedOneToManyKVOAccumulator *)self observedKeyPath];
  [v3 removeObserver:self forKeyPath:v4 context:@"CRKOrderedOneToManyKVOAccumulatorObservationContext"];

  v5.receiver = self;
  v5.super_class = (Class)CRKOrderedOneToManyKVOAccumulator;
  [(CRKOrderedOneToManyKVOAccumulator *)&v5 dealloc];
}

- (void)setDelegate:(id)a3
{
  id obj = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  objc_super v5 = obj;
  if (WeakRetained != obj)
  {
    objc_storeWeak((id *)&self->_delegate, obj);
    [(CRKOrderedOneToManyKVOAccumulator *)self _reset];
    objc_super v5 = obj;
  }
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  if (a6 == @"CRKOrderedOneToManyKVOAccumulatorObservationContext")
  {
    v14 = [v12 valueForKey:v11];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      uint64_t v15 = v14;
    }
    else {
      uint64_t v15 = 0;
    }
    id v16 = v15;

    if (!v16)
    {
      v18 = [MEMORY[0x263F08690] currentHandler];
      v19 = [v12 valueForKey:v11];
      objc_super v20 = (objc_class *)objc_opt_class();
      v21 = NSStringFromClass(v20);
      [v18 handleFailureInMethod:a2, self, @"CRKOrderedOneToManyKVOAccumulator.m", 96, @"expected array, got %@", v21 object file lineNumber description];
    }
    if ([(CRKOrderedOneToManyKVOAccumulator *)self _integrateChange:v13 toArray:v16])
    {
      self->mInitialArrayCount = [v16 count];
      objc_initWeak(&location, self);
      uint64_t v17 = (void *)MEMORY[0x263EFF9F0];
      v22[0] = MEMORY[0x263EF8330];
      v22[1] = 3221225472;
      v22[2] = __84__CRKOrderedOneToManyKVOAccumulator_observeValueForKeyPath_ofObject_change_context___block_invoke;
      v22[3] = &unk_2646F3D40;
      objc_copyWeak(&v23, &location);
      objc_msgSend(v17, "cat_performBlockOnMainRunLoop:", v22);
      objc_destroyWeak(&v23);
      objc_destroyWeak(&location);
    }
  }
  else
  {
    v25.receiver = self;
    v25.super_class = (Class)CRKOrderedOneToManyKVOAccumulator;
    [(CRKOrderedOneToManyKVOAccumulator *)&v25 observeValueForKeyPath:v11 ofObject:v12 change:v13 context:a6];
  }
}

void __84__CRKOrderedOneToManyKVOAccumulator_observeValueForKeyPath_ofObject_change_context___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _drain];
}

- (BOOL)hasChanges
{
  return self->mObservedShadow != 0;
}

- (BOOL)_integrateChange:(id)a3 toArray:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  uint64_t v9 = [v7 objectForKeyedSubscript:*MEMORY[0x263F081C0]];

  BOOL v10 = [(CRKOrderedOneToManyKVOAccumulator *)self hasChanges];
  if (!self->mObservedShadow)
  {
    if (!v9)
    {
      v34 = [MEMORY[0x263F08690] currentHandler];
      [v34 handleFailureInMethod:a2 object:self file:@"CRKOrderedOneToManyKVOAccumulator.m" lineNumber:127 description:@"expected to initialize shadow with original array size; observer must include NSKeyValueObservingOptionPrior option"];
    }
    objc_msgSend(MEMORY[0x263EFF980], "arrayWithCapacity:", objc_msgSend(v8, "count"));
    id v11 = (NSMutableArray *)objc_claimAutoreleasedReturnValue();
    mObservedShadow = self->mObservedShadow;
    self->mObservedShadow = v11;

    if ([v8 count])
    {
      unint64_t v13 = 0;
      do
      {
        v14 = self->mObservedShadow;
        uint64_t v15 = [NSNumber numberWithUnsignedInteger:v13];
        [(NSMutableArray *)v14 addObject:v15];

        ++v13;
      }
      while (v13 < [v8 count]);
    }
  }
  if (!v9)
  {
    id v16 = [v7 objectForKeyedSubscript:*MEMORY[0x263F081B0]];
    uint64_t v17 = [v16 unsignedIntegerValue];

    v18 = [v7 objectForKeyedSubscript:*MEMORY[0x263F081A8]];
    v19 = [v7 objectForKeyedSubscript:*MEMORY[0x263F081C8]];
    objc_super v20 = [v7 objectForKeyedSubscript:*MEMORY[0x263F081B8]];
    v21 = v20;
    BOOL v35 = v10;
    switch(v17)
    {
      case 1:
        if ([v19 count])
        {
          unint64_t v22 = 0;
          do
          {
            id v23 = [v19 objectAtIndexedSubscript:v22];
            unint64_t v24 = [(CRKOrderedOneToManyKVOAccumulator *)self _prestateIndexForImmediateIndex:v22];
            if (v24 != 0x7FFFFFFFFFFFFFFFLL)
            {
              mIndexForDeletedObject = self->mIndexForDeletedObject;
              v26 = [NSNumber numberWithUnsignedInteger:v24];
              [(NSMapTable *)mIndexForDeletedObject setObject:v26 forKey:v23];
            }
            [(CRKPointerSet *)self->mReplacementObjects removeObject:v23];

            ++v22;
          }
          while (v22 < [v19 count]);
        }
        [(NSMutableArray *)self->mObservedShadow removeAllObjects];
        if ([v21 count])
        {
          unint64_t v27 = 0;
          do
          {
            v28 = [v21 objectAtIndexedSubscript:v27];
            v29 = [(NSMapTable *)self->mIndexForDeletedObject objectForKey:v28];
            if (v29)
            {
              [(NSMapTable *)self->mIndexForDeletedObject removeObjectForKey:v28];
              [(NSMapTable *)self->mOriginalIndexOfMovedObject setObject:v29 forKey:v28];
            }
            else
            {
              [(CRKPointerSet *)self->mInsertedObjects addObject:v28];
            }
            [(NSMutableArray *)self->mObservedShadow insertObject:&unk_26D81A108 atIndex:v27];

            ++v27;
          }
          while (v27 < [v21 count]);
        }
        break;
      case 2:
        uint64_t v44 = 0;
        v45 = &v44;
        uint64_t v46 = 0x2020000000;
        uint64_t v47 = 0;
        v40[0] = MEMORY[0x263EF8330];
        v40[1] = 3221225472;
        v40[2] = __62__CRKOrderedOneToManyKVOAccumulator__integrateChange_toArray___block_invoke;
        v40[3] = &unk_2646F3D68;
        v42 = self;
        v43 = &v44;
        id v41 = v20;
        [v18 enumerateIndexesUsingBlock:v40];
        v30 = v41;
        goto LABEL_25;
      case 3:
        uint64_t v44 = 0;
        v45 = &v44;
        uint64_t v46 = 0x2020000000;
        uint64_t v47 = 0;
        v36[0] = MEMORY[0x263EF8330];
        v36[1] = 3221225472;
        v36[2] = __62__CRKOrderedOneToManyKVOAccumulator__integrateChange_toArray___block_invoke_20;
        v36[3] = &unk_2646F3D68;
        v38 = self;
        v39 = &v44;
        id v37 = v19;
        [v18 enumerateIndexesUsingBlock:v36];
        [(NSMutableArray *)self->mObservedShadow removeObjectsAtIndexes:v18];
        v30 = v37;
LABEL_25:

        _Block_object_dispose(&v44, 8);
        break;
      case 4:
        [(CRKPointerSet *)self->mReplacementObjects addObjectsFromArray:v20];
        break;
      default:
        v31 = [MEMORY[0x263F08690] currentHandler];
        v32 = [NSNumber numberWithUnsignedInteger:v17];
        [v31 handleFailureInMethod:a2, self, @"CRKOrderedOneToManyKVOAccumulator.m", 212, @"unexpected change kind: %@", v32 object file lineNumber description];

        break;
    }

    BOOL v10 = v35;
  }

  return !v10;
}

void __62__CRKOrderedOneToManyKVOAccumulator__integrateChange_toArray___block_invoke(uint64_t a1, uint64_t a2)
{
  id v6 = [*(id *)(a1 + 32) objectAtIndexedSubscript:*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 24)];
  v4 = objc_msgSend(*(id *)(*(void *)(a1 + 40) + 24), "objectForKey:");
  uint64_t v5 = *(void *)(a1 + 40);
  if (v4)
  {
    [*(id *)(v5 + 24) removeObjectForKey:v6];
    [*(id *)(*(void *)(a1 + 40) + 32) setObject:v4 forKey:v6];
  }
  else
  {
    [*(id *)(v5 + 8) addObject:v6];
  }
  [*(id *)(*(void *)(a1 + 40) + 40) insertObject:&unk_26D81A108 atIndex:a2];
  ++*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 24);
}

void __62__CRKOrderedOneToManyKVOAccumulator__integrateChange_toArray___block_invoke_20(uint64_t a1, uint64_t a2)
{
  id v9 = [*(id *)(a1 + 32) objectAtIndexedSubscript:*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 24)];
  uint64_t v4 = [*(id *)(a1 + 40) _prestateIndexForImmediateIndex:a2];
  uint64_t v5 = *(void *)(a1 + 40);
  if (v4 == 0x7FFFFFFFFFFFFFFFLL)
  {
    [*(id *)(v5 + 8) removeObject:v9];
    id v6 = [*(id *)(*(void *)(a1 + 40) + 32) objectForKey:v9];
    if (!v6) {
      goto LABEL_6;
    }
    [*(id *)(*(void *)(a1 + 40) + 32) removeObjectForKey:v9];
    id v7 = *(void **)(*(void *)(a1 + 40) + 24);
  }
  else
  {
    id v8 = *(void **)(v5 + 24);
    id v6 = [NSNumber numberWithUnsignedInteger:v4];
    id v7 = v8;
  }
  [v7 setObject:v6 forKey:v9];
LABEL_6:

  [*(id *)(*(void *)(a1 + 40) + 16) removeObject:v9];
  ++*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 24);
}

- (void)_validateArrayChangeToFinalCount:(int64_t)a3 accumulatedResults:(id)a4
{
  id v7 = a4;
  int64_t mInitialArrayCount = self->mInitialArrayCount;
  id v20 = v7;
  uint64_t v9 = [v7 netCountChange] + mInitialArrayCount;
  if (v9 != a3)
  {
    v19 = [MEMORY[0x263F08690] currentHandler];
    BOOL v10 = [NSNumber numberWithInteger:v9];
    id v11 = [NSNumber numberWithInteger:self->mInitialArrayCount];
    id v12 = NSNumber;
    unint64_t v13 = [v20 insertions];
    v14 = objc_msgSend(v12, "numberWithUnsignedInteger:", objc_msgSend(v13, "count"));
    uint64_t v15 = NSNumber;
    id v16 = [v20 deletions];
    uint64_t v17 = objc_msgSend(v15, "numberWithUnsignedInteger:", objc_msgSend(v16, "count"));
    v18 = [NSNumber numberWithInteger:a3];
    [v19 handleFailureInMethod:a2, self, @"CRKOrderedOneToManyKVOAccumulator.m", 220, @"Expected final array to have %@ elements (%@ original elements + %@ insertions - %@ deletions), but it has %@ elements", v10, v11, v14, v17, v18 object file lineNumber description];
  }
}

- (void)_drain
{
  v3 = [(CRKOrderedOneToManyKVOAccumulator *)self delegate];
  if (v3)
  {
    id v11 = v3;
    uint64_t v4 = [(CRKOrderedOneToManyKVOAccumulator *)self observedObject];
    uint64_t v5 = [(CRKOrderedOneToManyKVOAccumulator *)self observedKeyPath];
    id v6 = [v4 valueForKeyPath:v5];

    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      id v7 = v6;
    }
    else {
      id v7 = 0;
    }
    id v8 = v7;

    if (v8)
    {
      uint64_t v9 = [v8 count];
      if ([(CRKOrderedOneToManyKVOAccumulator *)self hasChanges])
      {
        BOOL v10 = [(CRKOrderedOneToManyKVOAccumulator *)self _resultsToArriveAtArray:v8];
        [(CRKOrderedOneToManyKVOAccumulator *)self _validateArrayChangeToFinalCount:v9 accumulatedResults:v10];
        if (([v10 isEmpty] & 1) == 0) {
          [v11 kvoAccumulator:self didCoelesceResults:v10];
        }
        [(CRKOrderedOneToManyKVOAccumulator *)self _reset];
      }
      else
      {
        [(CRKOrderedOneToManyKVOAccumulator *)self _validateArrayChangeToFinalCount:v9 accumulatedResults:0];
      }
    }

    v3 = v11;
  }
}

- (void)_reset
{
  [(CRKPointerSet *)self->mReplacementObjects removeAllObjects];
  [(CRKPointerSet *)self->mInsertedObjects removeAllObjects];
  [(NSMapTable *)self->mIndexForDeletedObject removeAllObjects];
  [(NSMapTable *)self->mOriginalIndexOfMovedObject removeAllObjects];
  mObservedShadow = self->mObservedShadow;
  self->mObservedShadow = 0;
}

- (id)_resultsToArriveAtArray:(id)a3
{
  uint64_t v27 = *MEMORY[0x263EF8340];
  id v4 = a3;
  uint64_t v5 = objc_opt_new();
  id v6 = objc_opt_new();
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  id v7 = [(NSMapTable *)self->mIndexForDeletedObject objectEnumerator];
  uint64_t v8 = [v7 countByEnumeratingWithState:&v22 objects:v26 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v23;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v23 != v10) {
          objc_enumerationMutation(v7);
        }
        objc_msgSend(v6, "addIndex:", objc_msgSend(*(id *)(*((void *)&v22 + 1) + 8 * i), "unsignedIntegerValue"));
      }
      uint64_t v9 = [v7 countByEnumeratingWithState:&v22 objects:v26 count:16];
    }
    while (v9);
  }

  id v20 = v5;
  [v5 setDeletions:v6];
  id v12 = objc_opt_new();
  unint64_t v13 = objc_opt_new();
  v21 = objc_opt_new();
  if ([v4 count])
  {
    unint64_t v14 = 0;
    do
    {
      uint64_t v15 = [v4 objectAtIndexedSubscript:v14];
      if ([(CRKPointerSet *)self->mInsertedObjects containsObject:v15]) {
        [v12 addIndex:v14];
      }
      if ([(CRKPointerSet *)self->mReplacementObjects containsObject:v15]) {
        [v13 addIndex:v14];
      }
      id v16 = [(NSMapTable *)self->mOriginalIndexOfMovedObject objectForKey:v15];
      if (v16)
      {
        uint64_t v17 = objc_opt_new();
        objc_msgSend(v17, "setSourceIndex:", objc_msgSend(v16, "integerValue"));
        [v17 setDestinationIndex:v14];
        uint64_t v18 = [v17 sourceIndex];
        if (v18 != [v17 destinationIndex]) {
          [v21 addObject:v17];
        }
      }
      ++v14;
    }
    while (v14 < [v4 count]);
  }
  [v20 setInsertions:v12];
  [v20 setReplacements:v13];
  [v20 setMoves:v21];

  return v20;
}

- (unint64_t)_prestateIndexForImmediateIndex:(unint64_t)a3
{
  if ([(NSMutableArray *)self->mObservedShadow count] <= a3)
  {
    uint64_t v9 = [MEMORY[0x263F08690] currentHandler];
    [v9 handleFailureInMethod:a2, self, @"CRKOrderedOneToManyKVOAccumulator.m", 298, @"Invalid parameter not satisfying: %@", @"number < mObservedShadow.count" object file lineNumber description];
  }
  id v6 = [(NSMutableArray *)self->mObservedShadow objectAtIndexedSubscript:a3];
  unint64_t v7 = [v6 unsignedIntegerValue];

  return v7;
}

- (CRKOrderedOneToManyKVOAccumulatorDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (CRKOrderedOneToManyKVOAccumulatorDelegate *)WeakRetained;
}

- (NSString)observedKeyPath
{
  return self->_observedKeyPath;
}

- (void)setObservedKeyPath:(id)a3
{
}

- (NSObject)observedObject
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_observedObject);

  return WeakRetained;
}

- (void)setObservedObject:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_observedObject);
  objc_storeStrong((id *)&self->_observedKeyPath, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->mObservedShadow, 0);
  objc_storeStrong((id *)&self->mOriginalIndexOfMovedObject, 0);
  objc_storeStrong((id *)&self->mIndexForDeletedObject, 0);
  objc_storeStrong((id *)&self->mReplacementObjects, 0);

  objc_storeStrong((id *)&self->mInsertedObjects, 0);
}

@end