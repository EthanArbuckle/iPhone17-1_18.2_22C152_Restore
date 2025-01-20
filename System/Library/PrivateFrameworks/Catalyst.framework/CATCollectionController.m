@interface CATCollectionController
- (BOOL)automaticallyRearrangesObjects;
- (CATCollectionController)init;
- (CATCollectionController)initWithObjects:(id)a3;
- (CATCollectionControllerDelegate)delegate;
- (NSArray)arrangedObjects;
- (NSArray)selectedObjects;
- (NSArray)sortDescriptors;
- (NSIndexSet)selectionIndexes;
- (NSPredicate)filterPredicate;
- (NSSet)content;
- (id)arrangedObjectAtIndex:(unint64_t)a3;
- (id)arrangedObjectsAtIndexes:(id)a3;
- (unint64_t)arrangedIndexOfObject:(id)a3;
- (unint64_t)newIndexForObject:(id)a3 inArrangedObjects:(id)a4;
- (unint64_t)numberOfArrangedObjects;
- (void)addObject:(id)a3;
- (void)addObserversToObject:(id)a3 forKeyPaths:(id)a4;
- (void)arrangeObject:(id)a3;
- (void)bindContentToObject:(id)a3 withKeyPath:(id)a4;
- (void)bindContentToObject:(id)a3 withKeyPath:(id)a4 usingTransformer:(id)a5;
- (void)changeContent:(id)a3;
- (void)changeObject:(id)a3 atIndex:(unint64_t)a4 forChangeType:(unint64_t)a5 newIndex:(unint64_t)a6;
- (void)dealloc;
- (void)notifyArrangedObjectsDidChangeWithPreviousArrangedObjects:(id)a3;
- (void)notifyArrangedObjectsWillChange;
- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6;
- (void)rearrangeObjects;
- (void)rearrangeTimerDidFire:(id)a3;
- (void)removeObject:(id)a3;
- (void)removeObserversFromObject:(id)a3 forKeyPaths:(id)a4;
- (void)resolveArrangedObjectsAtIndexes:(id)a3 reply:(id)a4;
- (void)scheduleRearrangeTimerIfNeed;
- (void)setArrangedObjects:(id)a3;
- (void)setAutomaticallyRearrangesObjects:(BOOL)a3;
- (void)setDelegate:(id)a3;
- (void)setFilterPredicate:(id)a3;
- (void)setSelectionIndexes:(id)a3;
- (void)setSortDescriptors:(id)a3;
- (void)unbindContent;
- (void)updateKeysAffectingArrangementForceUpdate:(BOOL)a3 includeAllContent:(BOOL)a4;
- (void)updateObject:(id)a3;
@end

@implementation CATCollectionController

- (CATCollectionControllerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (CATCollectionControllerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (BOOL)automaticallyRearrangesObjects
{
  return self->_automaticallyRearrangesObjects;
}

- (void)setAutomaticallyRearrangesObjects:(BOOL)a3
{
  if (self->_automaticallyRearrangesObjects != a3)
  {
    self->_automaticallyRearrangesObjects = a3;
    [(CATCollectionController *)self updateKeysAffectingArrangementForceUpdate:0 includeAllContent:0];
  }
}

- (NSArray)sortDescriptors
{
  return self->_sortDescriptors;
}

- (void)setSortDescriptors:(id)a3
{
  id v6 = a3;
  if (([v6 isEqualToArray:self->_sortDescriptors] & 1) == 0)
  {
    v4 = (NSArray *)[v6 copy];
    sortDescriptors = self->_sortDescriptors;
    self->_sortDescriptors = v4;

    [(CATCollectionController *)self updateKeysAffectingArrangementForceUpdate:1 includeAllContent:0];
  }
}

- (NSPredicate)filterPredicate
{
  return self->_filterPredicate;
}

- (void)setFilterPredicate:(id)a3
{
  id v6 = a3;
  if (([v6 isEqual:self->_filterPredicate] & 1) == 0)
  {
    v4 = (NSPredicate *)[v6 copy];
    filterPredicate = self->_filterPredicate;
    self->_filterPredicate = v4;

    [(CATCollectionController *)self updateKeysAffectingArrangementForceUpdate:1 includeAllContent:1];
  }
}

- (NSIndexSet)selectionIndexes
{
  return self->_selectionIndexes;
}

- (void)setSelectionIndexes:(id)a3
{
  id v9 = a3;
  if (!-[NSIndexSet isEqualToIndexSet:](self->_selectionIndexes, "isEqualToIndexSet:"))
  {
    v4 = (NSIndexSet *)[v9 copy];
    selectionIndexes = self->_selectionIndexes;
    self->_selectionIndexes = v4;

    id v6 = [(CATCollectionController *)self delegate];
    char v7 = objc_opt_respondsToSelector();

    if (v7)
    {
      v8 = [(CATCollectionController *)self delegate];
      [v8 controllerDidChangeSelectionIndexes:self];
    }
  }
}

- (NSArray)selectedObjects
{
  v3 = [(CATCollectionController *)self selectionIndexes];
  uint64_t v4 = [v3 count];

  if (v4)
  {
    v5 = [(CATCollectionController *)self arrangedObjects];
    id v6 = [(CATCollectionController *)self selectionIndexes];
    char v7 = [v5 objectsAtIndexes:v6];
  }
  else
  {
    char v7 = (void *)MEMORY[0x263EFFA68];
  }

  return (NSArray *)v7;
}

- (NSSet)content
{
  v2 = (void *)[(NSMutableSet *)self->mContent copy];

  return (NSSet *)v2;
}

- (CATCollectionController)init
{
  v14.receiver = self;
  v14.super_class = (Class)CATCollectionController;
  v2 = [(CATCollectionController *)&v14 init];
  if (v2)
  {
    uint64_t v3 = [MEMORY[0x263EFF8C0] array];
    arrangedObjects = v2->_arrangedObjects;
    v2->_arrangedObjects = (NSArray *)v3;

    uint64_t v5 = objc_opt_new();
    mContent = v2->mContent;
    v2->mContent = (NSMutableSet *)v5;

    uint64_t v7 = [MEMORY[0x263EFF9C0] set];
    mObjectsToRearrange = v2->mObjectsToRearrange;
    v2->mObjectsToRearrange = (NSMutableSet *)v7;

    uint64_t v9 = objc_opt_new();
    mPendingInsertedObjects = v2->mPendingInsertedObjects;
    v2->mPendingInsertedObjects = (NSMutableArray *)v9;

    uint64_t v11 = objc_opt_new();
    mPendingDeletedObjects = v2->mPendingDeletedObjects;
    v2->mPendingDeletedObjects = (NSMutableArray *)v11;
  }
  return v2;
}

- (CATCollectionController)initWithObjects:(id)a3
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  id v5 = a3;
  id v6 = [(CATCollectionController *)self init];
  uint64_t v7 = v6;
  if (v6)
  {
    objc_storeStrong(&v6->mOriginalObjects, a3);
    long long v17 = 0u;
    long long v18 = 0u;
    long long v15 = 0u;
    long long v16 = 0u;
    id v8 = v5;
    uint64_t v9 = [v8 countByEnumeratingWithState:&v15 objects:v19 count:16];
    if (v9)
    {
      uint64_t v10 = v9;
      uint64_t v11 = *(void *)v16;
      do
      {
        uint64_t v12 = 0;
        do
        {
          if (*(void *)v16 != v11) {
            objc_enumerationMutation(v8);
          }
          -[CATCollectionController addObject:](v7, "addObject:", *(void *)(*((void *)&v15 + 1) + 8 * v12++), (void)v15);
        }
        while (v10 != v12);
        uint64_t v10 = [v8 countByEnumeratingWithState:&v15 objects:v19 count:16];
      }
      while (v10);
    }

    mChangingSelection = v7->mChangingSelection;
    v7->mChangingSelection = 0;
  }
  return v7;
}

- (void)dealloc
{
  [(CATCollectionController *)self setDelegate:0];
  [(CATCollectionController *)self unbindContent];
  v3.receiver = self;
  v3.super_class = (Class)CATCollectionController;
  [(CATCollectionController *)&v3 dealloc];
}

- (unint64_t)numberOfArrangedObjects
{
  return [(NSArray *)self->_arrangedObjects count];
}

- (id)arrangedObjectAtIndex:(unint64_t)a3
{
  return [(NSArray *)self->_arrangedObjects objectAtIndex:a3];
}

- (id)arrangedObjectsAtIndexes:(id)a3
{
  return [(NSArray *)self->_arrangedObjects objectsAtIndexes:a3];
}

- (void)resolveArrangedObjectsAtIndexes:(id)a3 reply:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = v7;
  if (v7)
  {
    uint64_t v9 = (void *)MEMORY[0x263EFF9F0];
    v10[0] = MEMORY[0x263EF8330];
    v10[1] = 3221225472;
    v10[2] = __65__CATCollectionController_resolveArrangedObjectsAtIndexes_reply___block_invoke;
    v10[3] = &unk_2641DBDC0;
    id v12 = v7;
    v10[4] = self;
    id v11 = v6;
    objc_msgSend(v9, "cat_performBlockOnMainRunLoop:", v10);
  }
}

void __65__CATCollectionController_resolveArrangedObjectsAtIndexes_reply___block_invoke(void *a1)
{
  uint64_t v1 = a1[6];
  id v2 = [*(id *)(a1[4] + 152) objectsAtIndexes:a1[5]];
  (*(void (**)(uint64_t, id, void))(v1 + 16))(v1, v2, 0);
}

- (unint64_t)arrangedIndexOfObject:(id)a3
{
  return [(NSArray *)self->_arrangedObjects indexOfObject:a3];
}

- (void)bindContentToObject:(id)a3 withKeyPath:(id)a4
{
}

- (void)bindContentToObject:(id)a3 withKeyPath:(id)a4 usingTransformer:(id)a5
{
  id v16 = a3;
  id v9 = a4;
  id v10 = a5;
  if (v16)
  {
    if (self->mTarget)
    {
      v13 = [MEMORY[0x263F08690] currentHandler];
      [v13 handleFailureInMethod:a2, self, @"CATCollectionController.m", 237, @"%@ is already observing <%@: %p> on keypath %@", self, v16, v16, v9 object file lineNumber description];
    }
    if ([(NSMutableSet *)self->mContent count])
    {
      objc_super v14 = [MEMORY[0x263F08690] currentHandler];
      long long v15 = NSStringFromSelector(a2);
      [v14 handleFailureInMethod:a2, self, @"CATCollectionController.m", 238, @"%@ cannot call %@ when there is already content set", self, v15 object file lineNumber description];
    }
    self->mTarget = v16;
    id v11 = (NSString *)[v9 copy];
    mKeyPath = self->mKeyPath;
    self->mKeyPath = v11;

    objc_storeStrong((id *)&self->mTransformer, a5);
    [self->mTarget addObserver:self forKeyPath:self->mKeyPath options:7 context:"_CATCollectionControllerContentObservationContext"];
  }
}

- (void)unbindContent
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  id mTarget = self->mTarget;
  if (mTarget)
  {
    [mTarget removeObserver:self forKeyPath:self->mKeyPath];
    mKeyPath = self->mKeyPath;
    self->id mTarget = 0;
    self->mKeyPath = 0;

    mTransformer = self->mTransformer;
    self->mTransformer = 0;

    id v6 = (void *)[(NSMutableSet *)self->mContent copy];
    long long v12 = 0u;
    long long v13 = 0u;
    long long v14 = 0u;
    long long v15 = 0u;
    id v7 = v6;
    uint64_t v8 = [v7 countByEnumeratingWithState:&v12 objects:v16 count:16];
    if (v8)
    {
      uint64_t v9 = v8;
      uint64_t v10 = *(void *)v13;
      do
      {
        uint64_t v11 = 0;
        do
        {
          if (*(void *)v13 != v10) {
            objc_enumerationMutation(v7);
          }
          -[CATCollectionController removeObserversFromObject:forKeyPaths:](self, "removeObserversFromObject:forKeyPaths:", *(void *)(*((void *)&v12 + 1) + 8 * v11++), self->mKeysAffectingArrangement, (void)v12);
        }
        while (v9 != v11);
        uint64_t v9 = [v7 countByEnumeratingWithState:&v12 objects:v16 count:16];
      }
      while (v9);
    }

    [(CATCollectionController *)self setArrangedObjects:MEMORY[0x263EFFA68]];
    [(NSMutableSet *)self->mContent removeAllObjects];
  }
}

- (void)rearrangeObjects
{
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  long long v13 = v12;
  if (a6 == "_CATCollectionControllerContentObservationContext")
  {
    long long v14 = objc_msgSend(v12, "cat_calculateAddedObjects");
    long long v15 = objc_msgSend(v13, "cat_calculateRemovedObjects");
    v19[0] = MEMORY[0x263EF8330];
    v19[1] = 3221225472;
    v19[2] = __74__CATCollectionController_observeValueForKeyPath_ofObject_change_context___block_invoke;
    v19[3] = &unk_2641DBE10;
    id v20 = v15;
    v21 = self;
    id v22 = v14;
    id v16 = v14;
    id v17 = v15;
    [(CATCollectionController *)self changeContent:v19];
  }
  else if (a6 == "_CATCollectionControllerArrangementKeyObservationContext")
  {
    [(NSMutableSet *)self->mObjectsToRearrange addObject:v11];
    [(CATCollectionController *)self scheduleRearrangeTimerIfNeed];
  }
  else
  {
    v18.receiver = self;
    v18.super_class = (Class)CATCollectionController;
    [(CATCollectionController *)&v18 observeValueForKeyPath:v10 ofObject:v11 change:v12 context:a6];
  }
}

uint64_t __74__CATCollectionController_observeValueForKeyPath_ofObject_change_context___block_invoke(void *a1)
{
  id v2 = (void *)a1[4];
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __74__CATCollectionController_observeValueForKeyPath_ofObject_change_context___block_invoke_2;
  v6[3] = &unk_2641DBDE8;
  v6[4] = a1[5];
  [v2 enumerateObjectsUsingBlock:v6];
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __74__CATCollectionController_observeValueForKeyPath_ofObject_change_context___block_invoke_3;
  v5[3] = &unk_2641DBDE8;
  objc_super v3 = (void *)a1[6];
  v5[4] = a1[5];
  return [v3 enumerateObjectsUsingBlock:v5];
}

uint64_t __74__CATCollectionController_observeValueForKeyPath_ofObject_change_context___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = *(void **)(*(void *)(a1 + 32) + 96);
  if (v4)
  {
    id v7 = v3;
    uint64_t v5 = [v4 transformedValue:v3];

    id v3 = (id)v5;
  }
  if (v3) {
    [*(id *)(a1 + 32) removeObject:v3];
  }

  return MEMORY[0x270F9A758]();
}

uint64_t __74__CATCollectionController_observeValueForKeyPath_ofObject_change_context___block_invoke_3(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = *(void **)(*(void *)(a1 + 32) + 96);
  if (v4)
  {
    id v7 = v3;
    uint64_t v5 = [v4 transformedValue:v3];

    id v3 = (id)v5;
  }
  if (v3) {
    [*(id *)(a1 + 32) addObject:v3];
  }

  return MEMORY[0x270F9A758]();
}

- (void)addObserversToObject:(id)a3 forKeyPaths:(id)a4
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  uint64_t v8 = [v7 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v13;
    do
    {
      uint64_t v11 = 0;
      do
      {
        if (*(void *)v13 != v10) {
          objc_enumerationMutation(v7);
        }
        [v6 addObserver:self forKeyPath:*(void *)(*((void *)&v12 + 1) + 8 * v11++) options:3 context:"_CATCollectionControllerArrangementKeyObservationContext"];
      }
      while (v9 != v11);
      uint64_t v9 = [v7 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v9);
  }
}

- (void)removeObserversFromObject:(id)a3 forKeyPaths:(id)a4
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  uint64_t v8 = [v7 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v13;
    do
    {
      uint64_t v11 = 0;
      do
      {
        if (*(void *)v13 != v10) {
          objc_enumerationMutation(v7);
        }
        [v6 removeObserver:self forKeyPath:*(void *)(*((void *)&v12 + 1) + 8 * v11++)];
      }
      while (v9 != v11);
      uint64_t v9 = [v7 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v9);
  }
}

- (void)addObject:(id)a3
{
  id v4 = a3;
  if ((-[NSMutableSet containsObject:](self->mContent, "containsObject:") & 1) == 0)
  {
    [(NSMutableSet *)self->mContent addObject:v4];
    [(CATCollectionController *)self addObserversToObject:v4 forKeyPaths:self->mKeysAffectingArrangement];
    [(CATCollectionController *)self arrangeObject:v4];
  }
}

- (void)removeObject:(id)a3
{
  id v5 = a3;
  [(NSMutableSet *)self->mObjectsToRearrange removeObject:v5];
  if ([(NSMutableSet *)self->mContent containsObject:v5])
  {
    [(CATCollectionController *)self removeObserversFromObject:v5 forKeyPaths:self->mKeysAffectingArrangement];
    uint64_t v4 = [(NSMutableArray *)self->mPendingArrangedObjects indexOfObject:v5];
    [(NSMutableSet *)self->mContent removeObject:v5];
    if (v4 != 0x7FFFFFFFFFFFFFFFLL) {
      [(CATCollectionController *)self changeObject:v5 atIndex:v4 forChangeType:2 newIndex:0x7FFFFFFFFFFFFFFFLL];
    }
  }
}

- (void)updateObject:(id)a3
{
  id v5 = a3;
  [(CATCollectionController *)self arrangeObject:v5];
  uint64_t v4 = [(NSMutableArray *)self->mPendingArrangedObjects indexOfObject:v5];
  if (v4 != 0x7FFFFFFFFFFFFFFFLL) {
    [(CATCollectionController *)self changeObject:v5 atIndex:v4 forChangeType:4 newIndex:v4];
  }
}

- (void)arrangeObject:(id)a3
{
  id v14 = a3;
  uint64_t v4 = [(CATCollectionController *)self filterPredicate];
  if (v4)
  {
    id v5 = [(CATCollectionController *)self filterPredicate];
    int v6 = [v5 evaluateWithObject:v14];
  }
  else
  {
    int v6 = 1;
  }

  uint64_t v7 = [(NSMutableArray *)self->mPendingArrangedObjects indexOfObject:v14];
  uint64_t v8 = v7;
  if (v6)
  {
    uint64_t v9 = self->mPendingArrangedObjects;
    if (v8 != 0x7FFFFFFFFFFFFFFFLL)
    {
      uint64_t v10 = (void *)[(NSMutableArray *)self->mPendingArrangedObjects mutableCopy];
      [v10 removeObjectAtIndex:v8];
      uint64_t v11 = [v10 copy];

      uint64_t v9 = (NSMutableArray *)v11;
    }
    unint64_t v12 = [(CATCollectionController *)self newIndexForObject:v14 inArrangedObjects:v9];
    if (v8 != v12)
    {
      if (v8 == 0x7FFFFFFFFFFFFFFFLL) {
        uint64_t v13 = 1;
      }
      else {
        uint64_t v13 = 3;
      }
      [(CATCollectionController *)self changeObject:v14 atIndex:v8 forChangeType:v13 newIndex:v12];
    }
  }
  else if (v7 != 0x7FFFFFFFFFFFFFFFLL)
  {
    [(CATCollectionController *)self changeObject:v14 atIndex:v7 forChangeType:2 newIndex:0x7FFFFFFFFFFFFFFFLL];
  }
}

- (unint64_t)newIndexForObject:(id)a3 inArrangedObjects:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  uint64_t v8 = [(CATCollectionController *)self sortDescriptors];
  uint64_t v9 = [v8 count];

  if (v9) {
    goto LABEL_2;
  }
  id mOriginalObjects = self->mOriginalObjects;
  if (mOriginalObjects)
  {
    id v12 = mOriginalObjects;
  }
  else
  {
    id mTarget = self->mTarget;
    if (!mTarget || !self->mKeyPath)
    {
      uint64_t v10 = 0;
      goto LABEL_10;
    }
    objc_msgSend(mTarget, "valueForKeyPath:");
    id v12 = (id)objc_claimAutoreleasedReturnValue();
  }
  uint64_t v10 = v12;
LABEL_10:
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {

LABEL_2:
      uint64_t v10 = 0;
    }
  }
  uint64_t v14 = [v6 count];
  v18[0] = MEMORY[0x263EF8330];
  v18[1] = 3221225472;
  v18[2] = __63__CATCollectionController_newIndexForObject_inArrangedObjects___block_invoke;
  v18[3] = &unk_2641DBE38;
  v18[4] = self;
  id v19 = v10;
  id v15 = v10;
  unint64_t v16 = objc_msgSend(v6, "indexOfObject:inSortedRange:options:usingComparator:", v7, 0, v14, 1024, v18);

  return v16;
}

uint64_t __63__CATCollectionController_newIndexForObject_inArrangedObjects___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  id v7 = [*(id *)(a1 + 32) sortDescriptors];
  uint64_t v8 = [v7 count];

  if (v8)
  {
    long long v22 = 0u;
    long long v23 = 0u;
    long long v20 = 0u;
    long long v21 = 0u;
    uint64_t v9 = objc_msgSend(*(id *)(a1 + 32), "sortDescriptors", 0);
    uint64_t v10 = [v9 countByEnumeratingWithState:&v20 objects:v24 count:16];
    if (v10)
    {
      uint64_t v11 = v10;
      uint64_t v12 = *(void *)v21;
      while (2)
      {
        uint64_t v13 = 0;
        do
        {
          if (*(void *)v21 != v12) {
            objc_enumerationMutation(v9);
          }
          uint64_t v14 = [*(id *)(*((void *)&v20 + 1) + 8 * v13) compareObject:v5 toObject:v6];
          if (v14)
          {
            uint64_t v15 = v14;
            goto LABEL_12;
          }
          ++v13;
        }
        while (v11 != v13);
        uint64_t v11 = [v9 countByEnumeratingWithState:&v20 objects:v24 count:16];
        if (v11) {
          continue;
        }
        break;
      }
    }
    uint64_t v15 = 0;
LABEL_12:
  }
  else
  {
    unint64_t v16 = *(void **)(a1 + 40);
    if (v16)
    {
      unint64_t v17 = [v16 indexOfObject:v5];
      unint64_t v18 = [*(id *)(a1 + 40) indexOfObject:v6];
      if (v17 < v18) {
        uint64_t v15 = -1;
      }
      else {
        uint64_t v15 = v17 != v18;
      }
    }
    else if (objc_opt_respondsToSelector())
    {
      uint64_t v15 = [v5 compare:v6];
    }
    else if (v5 >= v6)
    {
      uint64_t v15 = v5 != v6;
    }
    else
    {
      uint64_t v15 = -1;
    }
  }

  return v15;
}

- (void)rearrangeTimerDidFire:(id)a3
{
  [(NSTimer *)self->mRearrangeTimer invalidate];
  mRearrangeTimer = self->mRearrangeTimer;
  self->mRearrangeTimer = 0;

  if ([(NSMutableSet *)self->mObjectsToRearrange count])
  {
    v5[0] = MEMORY[0x263EF8330];
    v5[1] = 3221225472;
    v5[2] = __49__CATCollectionController_rearrangeTimerDidFire___block_invoke;
    v5[3] = &unk_2641DBE60;
    v5[4] = self;
    [(CATCollectionController *)self changeContent:v5];
  }
}

void __49__CATCollectionController_rearrangeTimerDidFire___block_invoke(uint64_t a1)
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  long long v7 = 0u;
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  id v2 = *(id *)(*(void *)(a1 + 32) + 80);
  uint64_t v3 = [v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v8;
    do
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v8 != v5) {
          objc_enumerationMutation(v2);
        }
        objc_msgSend(*(id *)(a1 + 32), "arrangeObject:", *(void *)(*((void *)&v7 + 1) + 8 * v6++), (void)v7);
      }
      while (v4 != v6);
      uint64_t v4 = [v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
    }
    while (v4);
  }
}

- (void)scheduleRearrangeTimerIfNeed
{
  if (!self->mRearrangeTimer)
  {
    self->mRearrangeTimer = [MEMORY[0x263EFFA20] scheduledTimerWithTimeInterval:self target:sel_rearrangeTimerDidFire_ selector:0 userInfo:0 repeats:0.25];
    MEMORY[0x270F9A758]();
  }
}

- (void)updateKeysAffectingArrangementForceUpdate:(BOOL)a3 includeAllContent:(BOOL)a4
{
  BOOL v4 = a4;
  BOOL v5 = a3;
  long long v7 = [MEMORY[0x263EFF9C0] set];
  if ([(CATCollectionController *)self automaticallyRearrangesObjects])
  {
    long long v8 = [(CATCollectionController *)self sortDescriptors];
    long long v9 = [v8 valueForKeyPath:@"key"];
    [v7 addObjectsFromArray:v9];
  }
  long long v10 = [MEMORY[0x263EFF9D0] null];
  [v7 removeObject:v10];

  [v7 removeObject:&stru_26C4A6940];
  if (v4)
  {
    uint64_t v11 = [MEMORY[0x263EFF9C0] setWithSet:self->mContent];
  }
  else if (v5)
  {
    uint64_t v11 = [MEMORY[0x263EFF9C0] setWithArray:self->_arrangedObjects];
  }
  else
  {
    uint64_t v11 = 0;
  }
  v14[0] = MEMORY[0x263EF8330];
  v14[1] = 3221225472;
  v14[2] = __87__CATCollectionController_updateKeysAffectingArrangementForceUpdate_includeAllContent___block_invoke;
  v14[3] = &unk_2641DBE10;
  v14[4] = self;
  id v15 = v7;
  id v16 = v11;
  id v12 = v11;
  id v13 = v7;
  [(CATCollectionController *)self changeContent:v14];
}

void __87__CATCollectionController_updateKeysAffectingArrangementForceUpdate_includeAllContent___block_invoke(id *a1)
{
  uint64_t v28 = *MEMORY[0x263EF8340];
  if (([*((id *)a1[4] + 9) isEqualToSet:a1[5]] & 1) == 0)
  {
    id v2 = [MEMORY[0x263EFF9C0] setWithSet:*((void *)a1[4] + 9)];
    uint64_t v3 = [MEMORY[0x263EFF9C0] setWithSet:a1[5]];
    [v2 minusSet:a1[5]];
    [v3 minusSet:*((void *)a1[4] + 9)];
    if ([v2 count] || objc_msgSend(v3, "count"))
    {
      long long v24 = 0u;
      long long v25 = 0u;
      long long v22 = 0u;
      long long v23 = 0u;
      id v4 = *((id *)a1[4] + 4);
      uint64_t v5 = [v4 countByEnumeratingWithState:&v22 objects:v27 count:16];
      if (v5)
      {
        uint64_t v6 = v5;
        uint64_t v7 = *(void *)v23;
        do
        {
          for (uint64_t i = 0; i != v6; ++i)
          {
            if (*(void *)v23 != v7) {
              objc_enumerationMutation(v4);
            }
            uint64_t v9 = *(void *)(*((void *)&v22 + 1) + 8 * i);
            [a1[4] removeObserversFromObject:v9 forKeyPaths:v2];
            [a1[4] addObserversToObject:v9 forKeyPaths:v3];
            [a1[4] arrangeObject:v9];
            [a1[6] removeObject:v9];
          }
          uint64_t v6 = [v4 countByEnumeratingWithState:&v22 objects:v27 count:16];
        }
        while (v6);
      }
    }
    uint64_t v10 = [a1[5] copy];
    uint64_t v11 = a1[4];
    id v12 = (void *)v11[9];
    v11[9] = v10;
  }
  long long v20 = 0u;
  long long v21 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id v13 = a1[6];
  uint64_t v14 = [v13 countByEnumeratingWithState:&v18 objects:v26 count:16];
  if (v14)
  {
    uint64_t v15 = v14;
    uint64_t v16 = *(void *)v19;
    do
    {
      for (uint64_t j = 0; j != v15; ++j)
      {
        if (*(void *)v19 != v16) {
          objc_enumerationMutation(v13);
        }
        objc_msgSend(a1[4], "arrangeObject:", *(void *)(*((void *)&v18 + 1) + 8 * j), (void)v18);
      }
      uint64_t v15 = [v13 countByEnumeratingWithState:&v18 objects:v26 count:16];
    }
    while (v15);
  }
}

- (void)changeContent:(id)a3
{
  uint64_t v5 = (void (**)(void))a3;
  long long v24 = v5;
  if (!v5)
  {
    long long v23 = [MEMORY[0x263F08690] currentHandler];
    [v23 handleFailureInMethod:a2, self, @"CATCollectionController.m", 559, @"Invalid parameter not satisfying: %@", @"changeBlock" object file lineNumber description];

    uint64_t v5 = 0;
  }
  if (self->mChangingSelection)
  {
    v5[2]();
  }
  else
  {
    id v6 = objc_alloc(MEMORY[0x263F089C8]);
    uint64_t v7 = [(CATCollectionController *)self selectionIndexes];
    long long v8 = (NSMutableIndexSet *)[v6 initWithIndexSet:v7];
    mChangingSelection = self->mChangingSelection;
    self->mChangingSelection = v8;

    uint64_t v10 = (NSMutableArray *)[(NSArray *)self->_arrangedObjects mutableCopy];
    mPendingArrangedObjects = self->mPendingArrangedObjects;
    self->mPendingArrangedObjects = v10;

    [(NSMutableArray *)self->mPendingInsertedObjects removeAllObjects];
    [(NSMutableArray *)self->mPendingDeletedObjects removeAllObjects];
    v24[2]();
    [(CATCollectionController *)self notifyArrangedObjectsWillChange];
    id v12 = (void *)[(NSArray *)self->_arrangedObjects copy];
    id v13 = (void *)[(NSMutableArray *)self->mPendingArrangedObjects copy];
    [(CATCollectionController *)self setArrangedObjects:v13];

    uint64_t v14 = [(CATCollectionController *)self selectionIndexes];
    int v15 = [v14 isEqualToIndexSet:self->mChangingSelection];

    if (v15)
    {
      uint64_t v16 = self->mChangingSelection;
      self->mChangingSelection = 0;

      [(CATCollectionController *)self notifyArrangedObjectsDidChangeWithPreviousArrangedObjects:v12];
    }
    else
    {
      [(CATCollectionController *)self willChangeValueForKey:@"selectionIndexes"];
      unint64_t v17 = (NSIndexSet *)[(NSMutableIndexSet *)self->mChangingSelection copy];
      selectionIndexes = self->_selectionIndexes;
      self->_selectionIndexes = v17;

      [(CATCollectionController *)self didChangeValueForKey:@"selectionIndexes"];
      long long v19 = self->mChangingSelection;
      self->mChangingSelection = 0;

      [(CATCollectionController *)self notifyArrangedObjectsDidChangeWithPreviousArrangedObjects:v12];
      long long v20 = [(CATCollectionController *)self delegate];
      int v21 = objc_opt_respondsToSelector();

      if (v21)
      {
        long long v22 = [(CATCollectionController *)self delegate];
        [v22 controllerDidChangeSelectionIndexes:self];
      }
    }
  }
}

- (void)notifyArrangedObjectsWillChange
{
  uint64_t v42 = *MEMORY[0x263EF8340];
  if (self->mChangingSelection)
  {
    if (([(NSMutableArray *)self->mPendingInsertedObjects count]
       || [(NSMutableArray *)self->mPendingDeletedObjects count])
      && !self->mDelegateKnowsContentIsChanging)
    {
      uint64_t v3 = [(CATCollectionController *)self delegate];
      char v4 = objc_opt_respondsToSelector();

      if (v4)
      {
        uint64_t v5 = [(CATCollectionController *)self delegate];
        [v5 controllerWillChangeContent:self];
      }
      self->mDelegateKnowsContentIsChanging = 1;
    }
    if (self->mChangingSelection)
    {
      id v6 = [(CATCollectionController *)self delegate];
      char v7 = objc_opt_respondsToSelector();

      if (v7)
      {
        long long v38 = 0u;
        long long v39 = 0u;
        long long v36 = 0u;
        long long v37 = 0u;
        long long v8 = self->mPendingDeletedObjects;
        uint64_t v9 = [(NSMutableArray *)v8 countByEnumeratingWithState:&v36 objects:v41 count:16];
        if (v9)
        {
          uint64_t v10 = v9;
          uint64_t v11 = *(void *)v37;
          do
          {
            for (uint64_t i = 0; i != v10; ++i)
            {
              if (*(void *)v37 != v11) {
                objc_enumerationMutation(v8);
              }
              uint64_t v13 = *(void *)(*((void *)&v36 + 1) + 8 * i);
              int v14 = [(NSMutableArray *)self->mPendingInsertedObjects containsObject:v13];
              NSUInteger v15 = [(NSArray *)self->_arrangedObjects indexOfObject:v13];
              if (v14)
              {
                uint64_t v16 = [(NSMutableArray *)self->mPendingArrangedObjects indexOfObject:v13];
                unint64_t v17 = [(CATCollectionController *)self delegate];
                long long v18 = v17;
                long long v19 = self;
                uint64_t v20 = v13;
                NSUInteger v21 = v15;
                uint64_t v22 = 3;
                uint64_t v23 = v16;
              }
              else
              {
                unint64_t v17 = [(CATCollectionController *)self delegate];
                long long v18 = v17;
                long long v19 = self;
                uint64_t v20 = v13;
                NSUInteger v21 = v15;
                uint64_t v22 = 2;
                uint64_t v23 = 0x7FFFFFFFFFFFFFFFLL;
              }
              [v17 controller:v19 willChangeObject:v20 atIndex:v21 forChangeType:v22 newIndex:v23];
            }
            uint64_t v10 = [(NSMutableArray *)v8 countByEnumeratingWithState:&v36 objects:v41 count:16];
          }
          while (v10);
        }

        long long v34 = 0u;
        long long v35 = 0u;
        long long v32 = 0u;
        long long v33 = 0u;
        long long v24 = self->mPendingInsertedObjects;
        uint64_t v25 = [(NSMutableArray *)v24 countByEnumeratingWithState:&v32 objects:v40 count:16];
        if (v25)
        {
          uint64_t v26 = v25;
          uint64_t v27 = *(void *)v33;
          do
          {
            for (uint64_t j = 0; j != v26; ++j)
            {
              if (*(void *)v33 != v27) {
                objc_enumerationMutation(v24);
              }
              uint64_t v29 = *(void *)(*((void *)&v32 + 1) + 8 * j);
              if ((-[NSMutableArray containsObject:](self->mPendingDeletedObjects, "containsObject:", v29, (void)v32) & 1) == 0)
              {
                uint64_t v30 = [(NSMutableArray *)self->mPendingArrangedObjects indexOfObject:v29];
                v31 = [(CATCollectionController *)self delegate];
                [v31 controller:self willChangeObject:v29 atIndex:0x7FFFFFFFFFFFFFFFLL forChangeType:1 newIndex:v30];
              }
            }
            uint64_t v26 = [(NSMutableArray *)v24 countByEnumeratingWithState:&v32 objects:v40 count:16];
          }
          while (v26);
        }
      }
    }
  }
}

- (void)notifyArrangedObjectsDidChangeWithPreviousArrangedObjects:(id)a3
{
  uint64_t v44 = *MEMORY[0x263EF8340];
  id v4 = a3;
  if (self->mDelegateKnowsContentIsChanging)
  {
    uint64_t v5 = [(CATCollectionController *)self delegate];
    char v6 = objc_opt_respondsToSelector();

    if (v6)
    {
      char v7 = [(CATCollectionController *)self delegate];
      [v7 controllerDidChangeContent:self];
    }
  }
  self->mDelegateKnowsContentIsChanging = 0;
  long long v8 = [(CATCollectionController *)self delegate];
  char v9 = objc_opt_respondsToSelector();

  if (v9)
  {
    long long v40 = 0u;
    long long v41 = 0u;
    long long v38 = 0u;
    long long v39 = 0u;
    uint64_t v10 = self->mPendingDeletedObjects;
    uint64_t v11 = [(NSMutableArray *)v10 countByEnumeratingWithState:&v38 objects:v43 count:16];
    if (v11)
    {
      uint64_t v12 = v11;
      uint64_t v13 = *(void *)v39;
      do
      {
        for (uint64_t i = 0; i != v12; ++i)
        {
          if (*(void *)v39 != v13) {
            objc_enumerationMutation(v10);
          }
          uint64_t v15 = *(void *)(*((void *)&v38 + 1) + 8 * i);
          int v16 = [(NSMutableArray *)self->mPendingInsertedObjects containsObject:v15];
          uint64_t v17 = [v4 indexOfObject:v15];
          if (v16)
          {
            uint64_t v18 = [(NSMutableArray *)self->mPendingArrangedObjects indexOfObject:v15];
            long long v19 = [(CATCollectionController *)self delegate];
            uint64_t v20 = v19;
            NSUInteger v21 = self;
            uint64_t v22 = v15;
            uint64_t v23 = v17;
            uint64_t v24 = 3;
            uint64_t v25 = v18;
          }
          else
          {
            long long v19 = [(CATCollectionController *)self delegate];
            uint64_t v20 = v19;
            NSUInteger v21 = self;
            uint64_t v22 = v15;
            uint64_t v23 = v17;
            uint64_t v24 = 2;
            uint64_t v25 = 0x7FFFFFFFFFFFFFFFLL;
          }
          [v19 controller:v21 didChangeObject:v22 atIndex:v23 forChangeType:v24 newIndex:v25];
        }
        uint64_t v12 = [(NSMutableArray *)v10 countByEnumeratingWithState:&v38 objects:v43 count:16];
      }
      while (v12);
    }

    long long v36 = 0u;
    long long v37 = 0u;
    long long v34 = 0u;
    long long v35 = 0u;
    uint64_t v26 = self->mPendingInsertedObjects;
    uint64_t v27 = [(NSMutableArray *)v26 countByEnumeratingWithState:&v34 objects:v42 count:16];
    if (v27)
    {
      uint64_t v28 = v27;
      uint64_t v29 = *(void *)v35;
      do
      {
        for (uint64_t j = 0; j != v28; ++j)
        {
          if (*(void *)v35 != v29) {
            objc_enumerationMutation(v26);
          }
          uint64_t v31 = *(void *)(*((void *)&v34 + 1) + 8 * j);
          if ((-[NSMutableArray containsObject:](self->mPendingDeletedObjects, "containsObject:", v31, (void)v34) & 1) == 0)
          {
            uint64_t v32 = [(NSMutableArray *)self->mPendingArrangedObjects indexOfObject:v31];
            long long v33 = [(CATCollectionController *)self delegate];
            [v33 controller:self didChangeObject:v31 atIndex:0x7FFFFFFFFFFFFFFFLL forChangeType:1 newIndex:v32];
          }
        }
        uint64_t v28 = [(NSMutableArray *)v26 countByEnumeratingWithState:&v34 objects:v42 count:16];
      }
      while (v28);
    }
  }
}

- (void)changeObject:(id)a3 atIndex:(unint64_t)a4 forChangeType:(unint64_t)a5 newIndex:(unint64_t)a6
{
  id v10 = a3;
  id v11 = v10;
  if (a5 == 3)
  {
    id v13 = v10;
    [(NSMutableIndexSet *)self->mChangingSelection cat_moveIndex:a4 toIndex:a6];
    [(NSMutableArray *)self->mPendingArrangedObjects removeObjectAtIndex:a4];
    [(NSMutableArray *)self->mPendingArrangedObjects insertObject:v13 atIndex:a6];
    [(NSMutableArray *)self->mPendingInsertedObjects addObject:v13];
LABEL_7:
    uint64_t v12 = 24;
    goto LABEL_8;
  }
  if (a5 == 2)
  {
    id v13 = v10;
    [(NSMutableIndexSet *)self->mChangingSelection cat_shiftAndRemoveIndex:a4];
    [(NSMutableArray *)self->mPendingArrangedObjects removeObjectAtIndex:a4];
    goto LABEL_7;
  }
  if (a5 != 1) {
    goto LABEL_9;
  }
  id v13 = v10;
  [(NSMutableIndexSet *)self->mChangingSelection shiftIndexesStartingAtIndex:a6 by:1];
  [(NSMutableArray *)self->mPendingArrangedObjects insertObject:v13 atIndex:a6];
  uint64_t v12 = 16;
LABEL_8:
  id v10 = (id)[*(id *)((char *)&self->super.isa + v12) addObject:v13];
  id v11 = v13;
LABEL_9:

  MEMORY[0x270F9A758](v10, v11);
}

- (NSArray)arrangedObjects
{
  return (NSArray *)objc_getProperty(self, a2, 152, 1);
}

- (void)setArrangedObjects:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_arrangedObjects, 0);
  objc_storeStrong((id *)&self->_selectionIndexes, 0);
  objc_storeStrong((id *)&self->_filterPredicate, 0);
  objc_storeStrong((id *)&self->_sortDescriptors, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong(&self->mOriginalObjects, 0);
  objc_storeStrong((id *)&self->mTransformer, 0);
  objc_storeStrong((id *)&self->mRearrangeTimer, 0);
  objc_storeStrong((id *)&self->mObjectsToRearrange, 0);
  objc_storeStrong((id *)&self->mKeysAffectingArrangement, 0);
  objc_storeStrong((id *)&self->mChangingSelection, 0);
  objc_storeStrong((id *)&self->mKeyPath, 0);
  objc_storeStrong((id *)&self->mContent, 0);
  objc_storeStrong((id *)&self->mPendingDeletedObjects, 0);
  objc_storeStrong((id *)&self->mPendingInsertedObjects, 0);

  objc_storeStrong((id *)&self->mPendingArrangedObjects, 0);
}

@end