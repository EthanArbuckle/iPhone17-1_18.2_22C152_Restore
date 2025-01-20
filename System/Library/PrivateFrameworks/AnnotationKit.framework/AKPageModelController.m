@interface AKPageModelController
+ (BOOL)automaticallyNotifiesObserversForKey:(id)a3;
- (AKCropAnnotation)cropAnnotation;
- (AKInkAnnotation)inkCanvasAnnotation;
- (AKPageModelController)init;
- (AKPageModelController)initWithArchivableRepresentation:(id)a3;
- (AKStatistics)statisticsLogger;
- (BOOL)containsAnnotation:(id)a3;
- (BOOL)hasMaskBorderAnnotation;
- (CGRect)appliedCropRect;
- (NSArray)annotations;
- (NSSet)selectedAnnotations;
- (id)archivableRepresentation;
- (id)representedObject;
- (id)selectionStateForUndo;
- (void)_coalescedEnsureInkAnnotationIsInFront:(id)a3;
- (void)_enableEditObservationForAnnotationIfNew:(id)a3;
- (void)_ensureInkAnnotationIsInFrontWhenEditsAreDone;
- (void)_logAnnotationAdded:(id)a3;
- (void)_postSelectedAnnotationsChangedNotification;
- (void)addCropToolAnnotation;
- (void)addSelectedAnnotations:(id)a3;
- (void)addSelectedAnnotationsObject:(id)a3;
- (void)bringSelectedAnnotationsForward;
- (void)bringSelectedAnnotationsToFront;
- (void)insertAnnotations:(id)a3 atIndexes:(id)a4;
- (void)insertObject:(id)a3 inAnnotationsAtIndex:(unint64_t)a4;
- (void)intersectSelectedAnnotations:(id)a3;
- (void)removeAllAnnotations;
- (void)removeAnnotationsAtIndexes:(id)a3;
- (void)removeCropToolAnnotation;
- (void)removeObjectFromAnnotationsAtIndex:(unint64_t)a3;
- (void)removeSelectedAnnotations:(id)a3;
- (void)removeSelectedAnnotationsObject:(id)a3;
- (void)replaceAnnotationsAtIndexes:(id)a3 withAnnotations:(id)a4;
- (void)replaceObjectInAnnotationsAtIndex:(unint64_t)a3 withObject:(id)a4;
- (void)restoreSelectionStateForUndo:(id)a3;
- (void)selectAllAnnotations;
- (void)selectAnnotation:(id)a3 byExtendingSelection:(BOOL)a4;
- (void)selectAnnotationsAtIndexes:(id)a3 byExtendingSelection:(BOOL)a4;
- (void)sendSelectedAnnotationsBackward;
- (void)sendSelectedAnnotationsToBack;
- (void)setAppliedCropRect:(CGRect)a3;
- (void)setCropAnnotation:(id)a3;
- (void)setInkCanvasAnnotation:(id)a3;
- (void)setInkCanvasAnnotationOneTime:(id)a3;
- (void)setRepresentedObject:(id)a3;
- (void)setSelectedAnnotations:(id)a3;
- (void)setStatisticsLogger:(id)a3;
@end

@implementation AKPageModelController

+ (BOOL)automaticallyNotifiesObserversForKey:(id)a3
{
  v7.receiver = a1;
  v7.super_class = (Class)&OBJC_METACLASS___AKPageModelController;
  id v3 = a3;
  unsigned __int8 v4 = objc_msgSendSuper2(&v7, sel_automaticallyNotifiesObserversForKey_, v3);
  char v5 = objc_msgSend(v3, "isEqualToString:", @"selectedAnnotations", v7.receiver, v7.super_class);

  return v4 & ~v5;
}

- (AKPageModelController)init
{
  v9.receiver = self;
  v9.super_class = (Class)AKPageModelController;
  v2 = [(AKPageModelController *)&v9 init];
  if (v2)
  {
    uint64_t v3 = [MEMORY[0x263EFF9B0] orderedSet];
    unsigned __int8 v4 = (void *)*((void *)v2 + 1);
    *((void *)v2 + 1) = v3;

    uint64_t v5 = [MEMORY[0x263EFF9C0] set];
    v6 = (void *)*((void *)v2 + 2);
    *((void *)v2 + 2) = v5;

    long long v7 = *(_OWORD *)(MEMORY[0x263F00190] + 16);
    *(_OWORD *)(v2 + 56) = *MEMORY[0x263F00190];
    *(_OWORD *)(v2 + 72) = v7;
  }
  return (AKPageModelController *)v2;
}

- (NSArray)annotations
{
  return (NSArray *)[(NSMutableOrderedSet *)self->_mutableAnnotations array];
}

- (void)insertObject:(id)a3 inAnnotationsAtIndex:(unint64_t)a4
{
  id v7 = a3;
  if ((-[NSMutableOrderedSet containsObject:](self->_mutableAnnotations, "containsObject:") & 1) == 0)
  {
    [(NSMutableOrderedSet *)self->_mutableAnnotations insertObject:v7 atIndex:a4];
    [(AKPageModelController *)self _ensureInkAnnotationIsInFrontWhenEditsAreDone];
    v6 = [(AKPageModelController *)self inkCanvasAnnotation];

    if (!v6)
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        [(AKPageModelController *)self setInkCanvasAnnotation:v7];
      }
    }
    [(AKPageModelController *)self _enableEditObservationForAnnotationIfNew:v7];
    [(AKPageModelController *)self _logAnnotationAdded:v7];
  }
}

- (void)insertAnnotations:(id)a3 atIndexes:(id)a4
{
  uint64_t v33 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  mutableAnnotations = self->_mutableAnnotations;
  objc_super v9 = [MEMORY[0x263EFFA08] setWithArray:v6];
  LOBYTE(mutableAnnotations) = [(NSMutableOrderedSet *)mutableAnnotations intersectsSet:v9];

  if (mutableAnnotations)
  {
    uint64_t v10 = [v7 firstIndex];
    long long v23 = 0u;
    long long v24 = 0u;
    long long v25 = 0u;
    long long v26 = 0u;
    id v11 = v6;
    uint64_t v12 = [v11 countByEnumeratingWithState:&v23 objects:v31 count:16];
    if (v12)
    {
      uint64_t v13 = v12;
      uint64_t v14 = *(void *)v24;
      do
      {
        for (uint64_t i = 0; i != v13; ++i)
        {
          if (*(void *)v24 != v14) {
            objc_enumerationMutation(v11);
          }
          -[AKPageModelController insertObject:inAnnotationsAtIndex:](self, "insertObject:inAnnotationsAtIndex:", *(void *)(*((void *)&v23 + 1) + 8 * i), v10, (void)v23);
          uint64_t v10 = [v7 indexGreaterThanIndex:v10];
        }
        uint64_t v13 = [v11 countByEnumeratingWithState:&v23 objects:v31 count:16];
      }
      while (v13);
    }
  }
  else
  {
    [(NSMutableOrderedSet *)self->_mutableAnnotations insertObjects:v6 atIndexes:v7];
    [(AKPageModelController *)self _ensureInkAnnotationIsInFrontWhenEditsAreDone];
    long long v29 = 0u;
    long long v30 = 0u;
    long long v27 = 0u;
    long long v28 = 0u;
    id v16 = v6;
    uint64_t v17 = [v16 countByEnumeratingWithState:&v27 objects:v32 count:16];
    if (v17)
    {
      uint64_t v18 = v17;
      uint64_t v19 = *(void *)v28;
      do
      {
        for (uint64_t j = 0; j != v18; ++j)
        {
          if (*(void *)v28 != v19) {
            objc_enumerationMutation(v16);
          }
          uint64_t v21 = *(void *)(*((void *)&v27 + 1) + 8 * j);
          v22 = [(AKPageModelController *)self inkCanvasAnnotation];

          if (!v22)
          {
            objc_opt_class();
            if (objc_opt_isKindOfClass()) {
              [(AKPageModelController *)self setInkCanvasAnnotation:v21];
            }
          }
          [(AKPageModelController *)self _enableEditObservationForAnnotationIfNew:v21];
          [(AKPageModelController *)self _logAnnotationAdded:v21];
        }
        uint64_t v18 = [v16 countByEnumeratingWithState:&v27 objects:v32 count:16];
      }
      while (v18);
    }
  }
}

- (void)_enableEditObservationForAnnotationIfNew:(id)a3
{
  id v3 = a3;
  if ((sub_2376C9528() & 1) == 0
    && ([v3 isEdited] & 1) == 0
    && ([v3 shouldObserveEdits] & 1) == 0)
  {
    [v3 setShouldObserveEdits:1];
  }
}

- (void)removeAllAnnotations
{
  id v3 = (void *)MEMORY[0x263F088D0];
  unsigned __int8 v4 = [(AKPageModelController *)self annotations];
  objc_msgSend(v3, "indexSetWithIndexesInRange:", 0, objc_msgSend(v4, "count"));
  id v5 = (id)objc_claimAutoreleasedReturnValue();

  [(AKPageModelController *)self removeAnnotationsAtIndexes:v5];
}

- (void)removeObjectFromAnnotationsAtIndex:(unint64_t)a3
{
  if ([(NSMutableOrderedSet *)self->_mutableAnnotations count] > a3)
  {
    id v6 = [(NSMutableOrderedSet *)self->_mutableAnnotations objectAtIndex:a3];
    if (-[NSMutableSet containsObject:](self->_mutableSelectedAnnotations, "containsObject:")) {
      [(AKPageModelController *)self removeSelectedAnnotationsObject:v6];
    }
    [v6 setShouldObserveEdits:0];
    id v5 = [(AKPageModelController *)self inkCanvasAnnotation];

    if (v5)
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        [(AKPageModelController *)self setInkCanvasAnnotation:0];
      }
    }
    [(NSMutableOrderedSet *)self->_mutableAnnotations removeObjectAtIndex:a3];
  }
}

- (void)removeAnnotationsAtIndexes:(id)a3
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = [(NSMutableOrderedSet *)self->_mutableAnnotations objectsAtIndexes:v4];
  mutableSelectedAnnotations = self->_mutableSelectedAnnotations;
  id v7 = [MEMORY[0x263EFFA08] setWithArray:v5];
  LODWORD(mutableSelectedAnnotations) = [(NSMutableSet *)mutableSelectedAnnotations intersectsSet:v7];

  if (mutableSelectedAnnotations)
  {
    v8 = [MEMORY[0x263EFFA08] setWithArray:v5];
    [(AKPageModelController *)self removeSelectedAnnotations:v8];
  }
  long long v17 = 0u;
  long long v18 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v9 = v5;
  uint64_t v10 = [v9 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v16;
    do
    {
      uint64_t v13 = 0;
      do
      {
        if (*(void *)v16 != v12) {
          objc_enumerationMutation(v9);
        }
        objc_msgSend(*(id *)(*((void *)&v15 + 1) + 8 * v13), "setShouldObserveEdits:", 0, (void)v15);
        uint64_t v14 = [(AKPageModelController *)self inkCanvasAnnotation];

        if (v14)
        {
          objc_opt_class();
          if (objc_opt_isKindOfClass()) {
            [(AKPageModelController *)self setInkCanvasAnnotation:0];
          }
        }
        ++v13;
      }
      while (v11 != v13);
      uint64_t v11 = [v9 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v11);
  }

  [(NSMutableOrderedSet *)self->_mutableAnnotations removeObjectsAtIndexes:v4];
}

- (void)replaceObjectInAnnotationsAtIndex:(unint64_t)a3 withObject:(id)a4
{
  id v7 = a4;
  id v6 = [(NSMutableOrderedSet *)self->_mutableAnnotations objectAtIndex:a3];
  if ([(NSMutableSet *)self->_mutableSelectedAnnotations containsObject:v6]) {
    [(AKPageModelController *)self removeSelectedAnnotationsObject:v6];
  }
  [v6 setShouldObserveEdits:0];
  [(NSMutableOrderedSet *)self->_mutableAnnotations replaceObjectAtIndex:a3 withObject:v7];
  [(AKPageModelController *)self _ensureInkAnnotationIsInFrontWhenEditsAreDone];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    [(AKPageModelController *)self setInkCanvasAnnotation:0];
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    [(AKPageModelController *)self setInkCanvasAnnotation:v7];
  }
  [(AKPageModelController *)self _enableEditObservationForAnnotationIfNew:v7];
}

- (void)replaceAnnotationsAtIndexes:(id)a3 withAnnotations:(id)a4
{
  uint64_t v44 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  mutableAnnotations = self->_mutableAnnotations;
  id v9 = [MEMORY[0x263EFFA08] setWithArray:v7];
  LOBYTE(mutableAnnotations) = [(NSMutableOrderedSet *)mutableAnnotations intersectsSet:v9];

  if (mutableAnnotations)
  {
    uint64_t v10 = [v6 firstIndex];
    long long v29 = 0u;
    long long v30 = 0u;
    long long v31 = 0u;
    long long v32 = 0u;
    id v11 = v7;
    uint64_t v12 = [v11 countByEnumeratingWithState:&v29 objects:v41 count:16];
    if (v12)
    {
      uint64_t v13 = v12;
      uint64_t v14 = *(void *)v30;
      do
      {
        for (uint64_t i = 0; i != v13; ++i)
        {
          if (*(void *)v30 != v14) {
            objc_enumerationMutation(v11);
          }
          -[AKPageModelController replaceObjectInAnnotationsAtIndex:withObject:](self, "replaceObjectInAnnotationsAtIndex:withObject:", v10, *(void *)(*((void *)&v29 + 1) + 8 * i), (void)v29);
          uint64_t v10 = [v6 indexGreaterThanIndex:v10];
        }
        uint64_t v13 = [v11 countByEnumeratingWithState:&v29 objects:v41 count:16];
      }
      while (v13);
    }
  }
  else
  {
    long long v16 = (void *)MEMORY[0x263EFFA08];
    long long v17 = [(NSMutableOrderedSet *)self->_mutableAnnotations objectsAtIndexes:v6];
    id v11 = [v16 setWithArray:v17];

    if ([(NSMutableSet *)self->_mutableSelectedAnnotations intersectsSet:v11]) {
      [(AKPageModelController *)self removeSelectedAnnotations:v11];
    }
    long long v39 = 0u;
    long long v40 = 0u;
    long long v37 = 0u;
    long long v38 = 0u;
    long long v18 = [v11 allObjects];
    uint64_t v19 = [v18 countByEnumeratingWithState:&v37 objects:v43 count:16];
    if (v19)
    {
      uint64_t v20 = v19;
      uint64_t v21 = *(void *)v38;
      do
      {
        for (uint64_t j = 0; j != v20; ++j)
        {
          if (*(void *)v38 != v21) {
            objc_enumerationMutation(v18);
          }
          [*(id *)(*((void *)&v37 + 1) + 8 * j) setShouldObserveEdits:0];
          objc_opt_class();
          if (objc_opt_isKindOfClass()) {
            [(AKPageModelController *)self setInkCanvasAnnotation:0];
          }
        }
        uint64_t v20 = [v18 countByEnumeratingWithState:&v37 objects:v43 count:16];
      }
      while (v20);
    }

    [(NSMutableOrderedSet *)self->_mutableAnnotations replaceObjectsAtIndexes:v6 withObjects:v7];
    [(AKPageModelController *)self _ensureInkAnnotationIsInFrontWhenEditsAreDone];
    long long v35 = 0u;
    long long v36 = 0u;
    long long v33 = 0u;
    long long v34 = 0u;
    id v23 = v7;
    uint64_t v24 = [v23 countByEnumeratingWithState:&v33 objects:v42 count:16];
    if (v24)
    {
      uint64_t v25 = v24;
      uint64_t v26 = *(void *)v34;
      do
      {
        for (uint64_t k = 0; k != v25; ++k)
        {
          if (*(void *)v34 != v26) {
            objc_enumerationMutation(v23);
          }
          uint64_t v28 = *(void *)(*((void *)&v33 + 1) + 8 * k);
          objc_opt_class();
          if (objc_opt_isKindOfClass()) {
            [(AKPageModelController *)self setInkCanvasAnnotation:v28];
          }
          [(AKPageModelController *)self _enableEditObservationForAnnotationIfNew:v28];
        }
        uint64_t v25 = [v23 countByEnumeratingWithState:&v33 objects:v42 count:16];
      }
      while (v25);
    }
  }
}

- (NSSet)selectedAnnotations
{
  return (NSSet *)self->_mutableSelectedAnnotations;
}

- (void)addSelectedAnnotationsObject:(id)a3
{
  id v7 = a3;
  id v4 = [(AKPageModelController *)self cropAnnotation];

  if (v4 != v7)
  {
    id v5 = [(AKPageModelController *)self inkCanvasAnnotation];

    if (v5 != v7)
    {
      id v6 = [MEMORY[0x263EFFA08] setWithObject:v7];
      [(AKPageModelController *)self willChangeValueForKey:@"selectedAnnotations" withSetMutation:1 usingObjects:v6];
      [(NSMutableSet *)self->_mutableSelectedAnnotations addObject:v7];
      [(AKPageModelController *)self didChangeValueForKey:@"selectedAnnotations" withSetMutation:1 usingObjects:v6];
      [(AKPageModelController *)self _postSelectedAnnotationsChangedNotification];
    }
  }
}

- (void)addSelectedAnnotations:(id)a3
{
  uint64_t v29 = *MEMORY[0x263EF8340];
  id v4 = a3;
  uint64_t v5 = [(AKPageModelController *)self cropAnnotation];
  if (v5)
  {
    id v6 = (void *)v5;
    id v7 = [(AKPageModelController *)self cropAnnotation];
    int v8 = [v4 containsObject:v7];

    if (v8)
    {
      id v9 = (void *)[v4 mutableCopy];
      uint64_t v10 = [(AKPageModelController *)self cropAnnotation];
      [v9 removeObject:v10];

      id v4 = v9;
    }
  }
  uint64_t v11 = [(AKPageModelController *)self inkCanvasAnnotation];
  if (v11)
  {
    uint64_t v12 = (void *)v11;
    uint64_t v13 = [(AKPageModelController *)self inkCanvasAnnotation];
    int v14 = [v4 containsObject:v13];

    if (v14)
    {
      long long v15 = (void *)[v4 mutableCopy];
      long long v16 = [(AKPageModelController *)self inkCanvasAnnotation];
      [v15 removeObject:v16];

      id v4 = v15;
    }
  }
  long long v17 = [(NSMutableOrderedSet *)self->_mutableAnnotations set];
  int v18 = [v4 isSubsetOfSet:v17];

  if (v18)
  {
    [(AKPageModelController *)self willChangeValueForKey:@"selectedAnnotations" withSetMutation:1 usingObjects:v4];
    [(NSMutableSet *)self->_mutableSelectedAnnotations unionSet:v4];
    [(AKPageModelController *)self didChangeValueForKey:@"selectedAnnotations" withSetMutation:1 usingObjects:v4];
  }
  else
  {
    long long v26 = 0u;
    long long v27 = 0u;
    long long v24 = 0u;
    long long v25 = 0u;
    id v19 = v4;
    uint64_t v20 = [v19 countByEnumeratingWithState:&v24 objects:v28 count:16];
    if (v20)
    {
      uint64_t v21 = v20;
      uint64_t v22 = *(void *)v25;
      do
      {
        uint64_t v23 = 0;
        do
        {
          if (*(void *)v25 != v22) {
            objc_enumerationMutation(v19);
          }
          -[AKPageModelController addSelectedAnnotationsObject:](self, "addSelectedAnnotationsObject:", *(void *)(*((void *)&v24 + 1) + 8 * v23++), (void)v24);
        }
        while (v21 != v23);
        uint64_t v21 = [v19 countByEnumeratingWithState:&v24 objects:v28 count:16];
      }
      while (v21);
    }
  }
  [(AKPageModelController *)self _postSelectedAnnotationsChangedNotification];
}

- (void)removeSelectedAnnotationsObject:(id)a3
{
  id v4 = (void *)MEMORY[0x263EFFA08];
  id v5 = a3;
  id v6 = [v4 setWithObject:v5];
  [(AKPageModelController *)self willChangeValueForKey:@"selectedAnnotations" withSetMutation:2 usingObjects:v6];
  [(NSMutableSet *)self->_mutableSelectedAnnotations removeObject:v5];

  [(AKPageModelController *)self didChangeValueForKey:@"selectedAnnotations" withSetMutation:2 usingObjects:v6];
  [(AKPageModelController *)self _postSelectedAnnotationsChangedNotification];
}

- (void)removeSelectedAnnotations:(id)a3
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = [(NSMutableOrderedSet *)self->_mutableAnnotations set];
  int v6 = [v4 isSubsetOfSet:v5];

  if (v6)
  {
    [(AKPageModelController *)self willChangeValueForKey:@"selectedAnnotations" withSetMutation:2 usingObjects:v4];
    [(NSMutableSet *)self->_mutableSelectedAnnotations minusSet:v4];
    [(AKPageModelController *)self didChangeValueForKey:@"selectedAnnotations" withSetMutation:2 usingObjects:v4];
  }
  else
  {
    long long v14 = 0u;
    long long v15 = 0u;
    long long v12 = 0u;
    long long v13 = 0u;
    id v7 = v4;
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
          -[AKPageModelController removeSelectedAnnotationsObject:](self, "removeSelectedAnnotationsObject:", *(void *)(*((void *)&v12 + 1) + 8 * v11++), (void)v12);
        }
        while (v9 != v11);
        uint64_t v9 = [v7 countByEnumeratingWithState:&v12 objects:v16 count:16];
      }
      while (v9);
    }
  }
  [(AKPageModelController *)self _postSelectedAnnotationsChangedNotification];
}

- (void)intersectSelectedAnnotations:(id)a3
{
  id v4 = a3;
  [(AKPageModelController *)self willChangeValueForKey:@"selectedAnnotations" withSetMutation:3 usingObjects:v4];
  [(NSMutableSet *)self->_mutableSelectedAnnotations intersectSet:v4];
  [(AKPageModelController *)self didChangeValueForKey:@"selectedAnnotations" withSetMutation:3 usingObjects:v4];

  [(AKPageModelController *)self _postSelectedAnnotationsChangedNotification];
}

- (void)setSelectedAnnotations:(id)a3
{
  id v9 = a3;
  id v4 = [(AKPageModelController *)self inkCanvasAnnotation];
  id v5 = [(AKPageModelController *)self cropAnnotation];
  if (v4 && ([v9 containsObject:v4] & 1) != 0)
  {
    int v6 = (void *)[v9 mutableCopy];
    [v6 removeObject:v4];
    if (!v5) {
      goto LABEL_10;
    }
    goto LABEL_9;
  }
  if (v5 && [v9 containsObject:v5])
  {
    id v7 = (void *)[v9 mutableCopy];
    int v6 = v7;
    if (v4) {
      [v7 removeObject:v4];
    }
LABEL_9:
    [v6 removeObject:v5];
LABEL_10:

    id v8 = v6;
    goto LABEL_12;
  }
  id v8 = v9;
LABEL_12:
  id v10 = v8;
  [(AKPageModelController *)self willChangeValueForKey:@"selectedAnnotations" withSetMutation:4 usingObjects:v8];
  [(NSMutableSet *)self->_mutableSelectedAnnotations setSet:v10];
  [(AKPageModelController *)self didChangeValueForKey:@"selectedAnnotations" withSetMutation:4 usingObjects:v10];
  [(AKPageModelController *)self _postSelectedAnnotationsChangedNotification];
}

- (BOOL)containsAnnotation:(id)a3
{
  return [(NSMutableOrderedSet *)self->_mutableAnnotations containsObject:a3];
}

- (void)selectAnnotation:(id)a3 byExtendingSelection:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  if (v6)
  {
    if (v4)
    {
      [(AKPageModelController *)self addSelectedAnnotationsObject:v6];
    }
    else
    {
      id v7 = [MEMORY[0x263EFFA08] setWithObject:v6];
      [(AKPageModelController *)self setSelectedAnnotations:v7];
    }
  }

  MEMORY[0x270F9A758]();
}

- (void)selectAnnotationsAtIndexes:(id)a3 byExtendingSelection:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = (void *)MEMORY[0x263EFFA08];
  id v7 = [(NSMutableOrderedSet *)self->_mutableAnnotations objectsAtIndexes:a3];
  id v8 = [v6 setWithArray:v7];

  if (v4) {
    [(AKPageModelController *)self addSelectedAnnotations:v8];
  }
  else {
    [(AKPageModelController *)self setSelectedAnnotations:v8];
  }
}

- (void)selectAllAnnotations
{
  id v3 = (void *)MEMORY[0x263EFFA08];
  id v5 = [(AKPageModelController *)self annotations];
  BOOL v4 = [v3 setWithArray:v5];
  [(AKPageModelController *)self setSelectedAnnotations:v4];
}

- (void)bringSelectedAnnotationsForward
{
  id v3 = [(AKPageModelController *)self annotations];
  v15[0] = MEMORY[0x263EF8330];
  v15[1] = 3221225472;
  v15[2] = sub_2376D1EB8;
  v15[3] = &unk_264CDB678;
  v15[4] = self;
  BOOL v4 = [v3 indexesOfObjectsPassingTest:v15];

  id v5 = [(AKPageModelController *)self annotations];
  id v6 = [v5 objectsAtIndexes:v4];

  unint64_t v7 = [v4 lastIndex] + 1;
  id v8 = [(AKPageModelController *)self annotations];
  unint64_t v9 = [v8 count];

  if (v7 >= v9)
  {
    [(AKPageModelController *)self removeAnnotationsAtIndexes:v4];
    goto LABEL_5;
  }
  id v10 = [(AKPageModelController *)self annotations];
  uint64_t v11 = [v10 objectAtIndex:v7];

  [(AKPageModelController *)self removeAnnotationsAtIndexes:v4];
  if (!v11)
  {
LABEL_5:
    uint64_t v11 = [(AKPageModelController *)self annotations];
    uint64_t v13 = [v11 count];
    goto LABEL_6;
  }
  long long v12 = [(AKPageModelController *)self annotations];
  uint64_t v13 = [v12 indexOfObject:v11] + 1;

LABEL_6:
  long long v14 = objc_msgSend(MEMORY[0x263F088D0], "indexSetWithIndexesInRange:", v13, objc_msgSend(v6, "count"));
  [(AKPageModelController *)self insertAnnotations:v6 atIndexes:v14];
  [(AKPageModelController *)self selectAnnotationsAtIndexes:v14 byExtendingSelection:0];
}

- (void)bringSelectedAnnotationsToFront
{
  id v3 = [(AKPageModelController *)self annotations];
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = sub_2376D2050;
  v10[3] = &unk_264CDB678;
  v10[4] = self;
  BOOL v4 = [v3 indexesOfObjectsPassingTest:v10];

  id v5 = [(AKPageModelController *)self annotations];
  id v6 = [v5 objectsAtIndexes:v4];

  [(AKPageModelController *)self removeAnnotationsAtIndexes:v4];
  unint64_t v7 = [(AKPageModelController *)self annotations];
  uint64_t v8 = [v7 count];

  unint64_t v9 = objc_msgSend(MEMORY[0x263F088D0], "indexSetWithIndexesInRange:", v8, objc_msgSend(v6, "count"));
  [(AKPageModelController *)self insertAnnotations:v6 atIndexes:v9];
  [(AKPageModelController *)self selectAnnotationsAtIndexes:v9 byExtendingSelection:0];
}

- (void)sendSelectedAnnotationsBackward
{
  id v3 = [(AKPageModelController *)self annotations];
  v14[0] = MEMORY[0x263EF8330];
  v14[1] = 3221225472;
  v14[2] = sub_2376D2240;
  v14[3] = &unk_264CDB678;
  v14[4] = self;
  BOOL v4 = [v3 indexesOfObjectsPassingTest:v14];

  id v5 = [(AKPageModelController *)self annotations];
  id v6 = [v5 objectsAtIndexes:v4];

  uint64_t v7 = [v4 firstIndex];
  if (v7 <= 0)
  {
    [(AKPageModelController *)self removeAnnotationsAtIndexes:v4];
    goto LABEL_5;
  }
  uint64_t v8 = v7 - 1;
  unint64_t v9 = [(AKPageModelController *)self annotations];
  id v10 = [v9 objectAtIndex:v8];

  [(AKPageModelController *)self removeAnnotationsAtIndexes:v4];
  if (!v10)
  {
LABEL_5:
    uint64_t v12 = 0;
    goto LABEL_6;
  }
  uint64_t v11 = [(AKPageModelController *)self annotations];
  uint64_t v12 = [v11 indexOfObject:v10];

LABEL_6:
  uint64_t v13 = objc_msgSend(MEMORY[0x263F088D0], "indexSetWithIndexesInRange:", v12, objc_msgSend(v6, "count"));
  [(AKPageModelController *)self insertAnnotations:v6 atIndexes:v13];
  [(AKPageModelController *)self selectAnnotationsAtIndexes:v13 byExtendingSelection:0];
}

- (void)sendSelectedAnnotationsToBack
{
  id v3 = [(AKPageModelController *)self annotations];
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = sub_2376D23B4;
  v8[3] = &unk_264CDB678;
  v8[4] = self;
  BOOL v4 = [v3 indexesOfObjectsPassingTest:v8];

  id v5 = [(AKPageModelController *)self annotations];
  id v6 = [v5 objectsAtIndexes:v4];

  [(AKPageModelController *)self removeAnnotationsAtIndexes:v4];
  uint64_t v7 = objc_msgSend(MEMORY[0x263F088D0], "indexSetWithIndexesInRange:", 0, objc_msgSend(v6, "count"));
  [(AKPageModelController *)self insertAnnotations:v6 atIndexes:v7];
  [(AKPageModelController *)self selectAnnotationsAtIndexes:v7 byExtendingSelection:0];
}

- (void)addCropToolAnnotation
{
  id v3 = [(AKPageModelController *)self cropAnnotation];

  if (!v3)
  {
    id v5 = objc_alloc_init(AKCropAnnotation);
    [(AKPageModelController *)self setCropAnnotation:v5];
    [(AKCropAnnotation *)v5 setShowHandles:1];
    -[AKCropAnnotation setRectangle:](v5, "setRectangle:", *MEMORY[0x263F00190], *(double *)(MEMORY[0x263F00190] + 8), *(double *)(MEMORY[0x263F00190] + 16), *(double *)(MEMORY[0x263F00190] + 24));
    [(AKAnnotation *)v5 setOriginalModelBaseScaleFactor:1.0];
    [(AKAnnotation *)v5 setOriginalExifOrientation:1];
    BOOL v4 = [(AKPageModelController *)self mutableArrayValueForKey:@"annotations"];
    [v4 addObject:v5];
  }
}

- (void)removeCropToolAnnotation
{
  id v3 = [(AKPageModelController *)self cropAnnotation];

  if (v3)
  {
    BOOL v4 = [(AKPageModelController *)self mutableArrayValueForKey:@"annotations"];
    id v5 = [(AKPageModelController *)self cropAnnotation];
    [v4 removeObject:v5];

    [(AKPageModelController *)self setCropAnnotation:0];
  }
}

- (AKInkAnnotation)inkCanvasAnnotation
{
  return self->_inkCanvasAnnotation;
}

- (void)setInkCanvasAnnotation:(id)a3
{
  id v5 = (AKInkAnnotation *)a3;
  p_inkCanvasAnnotation = &self->_inkCanvasAnnotation;
  if (self->_inkCanvasAnnotation != v5)
  {
    uint64_t v8 = v5;
    objc_storeStrong((id *)p_inkCanvasAnnotation, a3);
    uint64_t v7 = [MEMORY[0x263F08A00] defaultCenter];
    [v7 postNotificationName:off_268923F68[0] object:self];

    id v5 = v8;
  }

  MEMORY[0x270F9A758](p_inkCanvasAnnotation, v5);
}

- (void)setInkCanvasAnnotationOneTime:(id)a3
{
  id v6 = a3;
  if (v6)
  {
    BOOL v4 = [(AKPageModelController *)self mutableArrayValueForKey:@"annotations"];
    [v4 addObject:v6];
  }
  else
  {
    BOOL v4 = [(AKPageModelController *)self inkCanvasAnnotation];
    if (v4)
    {
      id v5 = [(AKPageModelController *)self mutableArrayValueForKey:@"annotations"];
      [v5 removeObject:v4];
    }
  }
}

- (BOOL)hasMaskBorderAnnotation
{
  uint64_t v5 = 0;
  id v6 = &v5;
  uint64_t v7 = 0x2020000000;
  char v8 = 0;
  v2 = [(AKPageModelController *)self annotations];
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = sub_2376D2790;
  v4[3] = &unk_264CDB598;
  v4[4] = &v5;
  [v2 enumerateObjectsUsingBlock:v4];

  LOBYTE(v2) = *((unsigned char *)v6 + 24);
  _Block_object_dispose(&v5, 8);
  return (char)v2;
}

- (id)archivableRepresentation
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  id v3 = (void *)MEMORY[0x263EFF980];
  BOOL v4 = [(AKPageModelController *)self annotations];
  uint64_t v5 = objc_msgSend(v3, "arrayWithCapacity:", objc_msgSend(v4, "count"));

  long long v17 = 0u;
  long long v18 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v6 = [(AKPageModelController *)self annotations];
  uint64_t v7 = [v6 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v16;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v16 != v9) {
          objc_enumerationMutation(v6);
        }
        uint64_t v11 = [*(id *)(*((void *)&v15 + 1) + 8 * i) dataRepresentation];
        [v5 addObject:v11];
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v8);
  }

  uint64_t v12 = [MEMORY[0x263EFF8C0] arrayWithArray:v5];
  uint64_t v13 = +[AKSecureSerializationHelper dataForSecureCodingCompliantObject:v12 withOptionalKey:0];

  return v13;
}

- (AKPageModelController)initWithArchivableRepresentation:(id)a3
{
  v24[3] = *MEMORY[0x263EF8340];
  id v4 = a3;
  uint64_t v5 = [(AKPageModelController *)self init];
  if (v5)
  {
    uint64_t v18 = 0;
    id v19 = &v18;
    uint64_t v20 = 0x3032000000;
    uint64_t v21 = sub_2376D2BC4;
    uint64_t v22 = sub_2376D2BD4;
    id v23 = 0;
    v24[0] = objc_opt_class();
    v24[1] = objc_opt_class();
    v24[2] = objc_opt_class();
    id v6 = [MEMORY[0x263EFF8C0] arrayWithObjects:v24 count:3];
    uint64_t v7 = +[AKSecureSerializationHelper secureCodingCompliantObjectForData:v4 ofClasses:v6 withOptionalKey:0];

    uint64_t v8 = objc_msgSend(MEMORY[0x263EFF980], "arrayWithCapacity:", objc_msgSend(v7, "count"));
    uint64_t v12 = MEMORY[0x263EF8330];
    uint64_t v13 = 3221225472;
    long long v14 = sub_2376D2BDC;
    long long v15 = &unk_264CDBC78;
    id v9 = v8;
    id v16 = v9;
    long long v17 = &v18;
    [v7 enumerateObjectsUsingBlock:&v12];
    id v10 = [(AKPageModelController *)v5 mutableArrayValueForKey:@"annotations", v12, v13, v14, v15];
    [v10 addObjectsFromArray:v9];

    if (v19[5]) {
      -[AKPageModelController setCropAnnotation:](v5, "setCropAnnotation:");
    }

    _Block_object_dispose(&v18, 8);
  }

  return v5;
}

- (id)selectionStateForUndo
{
  v2 = [(AKPageModelController *)self selectedAnnotations];
  id v3 = (void *)[v2 copy];

  return v3;
}

- (void)restoreSelectionStateForUndo:(id)a3
{
  id v4 = a3;
  id v5 = [(AKPageModelController *)self mutableSetValueForKey:@"selectedAnnotations"];
  [v5 setSet:v4];
}

- (void)_ensureInkAnnotationIsInFrontWhenEditsAreDone
{
  v6[1] = *MEMORY[0x263EF8340];
  id v3 = [MEMORY[0x263EFF9F0] currentRunLoop];
  [v3 cancelPerformSelector:sel__coalescedEnsureInkAnnotationIsInFront_ target:self argument:0];

  id v4 = [MEMORY[0x263EFF9F0] currentRunLoop];
  v6[0] = *MEMORY[0x263EFF588];
  id v5 = [MEMORY[0x263EFF8C0] arrayWithObjects:v6 count:1];
  [v4 performSelector:sel__coalescedEnsureInkAnnotationIsInFront_ target:self argument:0 order:349999 modes:v5];
}

- (void)_coalescedEnsureInkAnnotationIsInFront:(id)a3
{
  id v4 = objc_msgSend(MEMORY[0x263EFF9F0], "currentRunLoop", a3);
  [v4 cancelPerformSelector:sel__coalescedEnsureInkAnnotationIsInFront_ target:self argument:0];

  id v5 = [(AKPageModelController *)self inkCanvasAnnotation];
  if (v5)
  {
    id v11 = v5;
    id v6 = [(AKPageModelController *)self mutableArrayValueForKey:@"annotations"];
    uint64_t v7 = [v6 indexOfObject:v11];
    if (v7 != 0x7FFFFFFFFFFFFFFFLL)
    {
      uint64_t v8 = v7;
      if (v7 != [v6 count] - 1)
      {
        id v9 = [MEMORY[0x263F08A00] defaultCenter];
        [v9 postNotificationName:off_268923F70[0] object:0];

        [v6 removeObjectAtIndex:v8];
        [v6 addObject:v11];
        id v10 = [MEMORY[0x263F08A00] defaultCenter];
        [v10 postNotificationName:off_268923F78 object:0];
      }
    }

    id v5 = v11;
  }
}

- (void)_logAnnotationAdded:(id)a3
{
  id v4 = a3;
  id v5 = [(AKPageModelController *)self statisticsLogger];
  [v5 logAnnotationAdded:v4];
}

- (void)_postSelectedAnnotationsChangedNotification
{
  id v3 = [MEMORY[0x263F089F8] notificationWithName:off_268923F60[0] object:self];
  v2 = [MEMORY[0x263F08A10] defaultQueue];
  [v2 enqueueNotification:v3 postingStyle:2 coalesceMask:1 forModes:0];
}

- (id)representedObject
{
  id WeakRetained = objc_loadWeakRetained(&self->_representedObject);

  return WeakRetained;
}

- (void)setRepresentedObject:(id)a3
{
}

- (CGRect)appliedCropRect
{
  objc_copyStruct(v6, &self->_appliedCropRect, 32, 1, 0);
  double v2 = *(double *)v6;
  double v3 = *(double *)&v6[1];
  double v4 = *(double *)&v6[2];
  double v5 = *(double *)&v6[3];
  result.size.height = v5;
  result.size.width = v4;
  result.origin.y = v3;
  result.origin.x = v2;
  return result;
}

- (void)setAppliedCropRect:(CGRect)a3
{
  CGRect v3 = a3;
  objc_copyStruct(&self->_appliedCropRect, &v3, 32, 1, 0);
}

- (AKCropAnnotation)cropAnnotation
{
  return (AKCropAnnotation *)objc_getProperty(self, a2, 40, 1);
}

- (void)setCropAnnotation:(id)a3
{
}

- (AKStatistics)statisticsLogger
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_statisticsLogger);

  return (AKStatistics *)WeakRetained;
}

- (void)setStatisticsLogger:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_statisticsLogger);
  objc_storeStrong((id *)&self->_cropAnnotation, 0);
  objc_destroyWeak(&self->_representedObject);
  objc_storeStrong((id *)&self->_inkCanvasAnnotation, 0);
  objc_storeStrong((id *)&self->_mutableSelectedAnnotations, 0);

  objc_storeStrong((id *)&self->_mutableAnnotations, 0);
}

@end