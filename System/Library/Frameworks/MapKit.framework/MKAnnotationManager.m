@interface MKAnnotationManager
- (BOOL)annotationIsInternal:(id)a3;
- (BOOL)annotationRepresentationsAreAddedImmediately;
- (BOOL)containsAnnotation:(id)a3;
- (MKAnnotation)draggedAnnotation;
- (MKAnnotationManager)init;
- (MKAnnotationManagerDelegate)delegate;
- (MKAnnotationMarkerContainer)container;
- (MKAnnotationRepresentation)selectedAnnotationRepresentation;
- (NSArray)annotationRepresentations;
- (NSArray)annotations;
- (id)_addRepresentationForAnnotation:(id)a3;
- (id)addRepresentationForAnnotation:(id)a3;
- (id)annotationsInMapRect:(id)a3;
- (id)dequeueReusableAnnotationRepresentationWithIdentifier:(id)a3;
- (id)newInternalAnnotationRepresentationForInternalAnnotation:(id)a3;
- (id)representationForAnnotation:(id)a3;
- (void)_addAnnotation:(id)a3 updateVisible:(BOOL)a4;
- (void)_annotationDidChangeState:(id)a3 animated:(BOOL)a4;
- (void)_removeAnnotation:(id)a3 updateVisible:(BOOL)a4 removeFromContainer:(BOOL)a5;
- (void)_removeRepresentationForAnnotation:(id)a3 fromCull:(BOOL)a4;
- (void)_setupUpdateVisibleAnnotationsTimer;
- (void)addAnnotation:(id)a3;
- (void)addAnnotation:(id)a3 allowAnimation:(BOOL)a4;
- (void)addAnnotations:(id)a3;
- (void)addRepresentationsForAnnotations:(id)a3;
- (void)cleanUpAnnotationRepresentationForRemoval:(id)a3;
- (void)configureAnnotationRepresentation:(id)a3 forAnnotation:(id)a4;
- (void)configureDefaultAnnotationRepresentation:(id)a3 forAnnotation:(id)a4;
- (void)dealloc;
- (void)deselectAnnotation:(id)a3 animated:(BOOL)a4;
- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6;
- (void)registerClass:(Class)a3 forRepresentationReuseIdentifier:(id)a4;
- (void)removeAnnotation:(id)a3;
- (void)removeAnnotation:(id)a3 updateVisible:(BOOL)a4;
- (void)removeAnnotations:(id)a3;
- (void)replaceAnnotation:(id)a3 withAnnotation:(id)a4;
- (void)selectAnnotation:(id)a3 animated:(BOOL)a4;
- (void)setAnnotationRepresentationsAreAddedImmediately:(BOOL)a3;
- (void)setContainer:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setDraggedAnnotation:(id)a3;
- (void)showAnnotationsInMapRect:(id)a3;
- (void)updateVisibleAnnotations;
@end

@implementation MKAnnotationManager

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  uint64_t v46 = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  if ([v10 conformsToProtocol:&unk_1ED9AD6C0]
    && [v9 isEqualToString:@"coordinate"])
  {
    v12 = [v11 objectForKey:*MEMORY[0x1E4F284D8]];
    int v13 = [v12 BOOLValue];

    if (v13)
    {
      self->_isChangingCoordinate = 1;
      [(MKQuadTrie *)self->_annotations remove:v10];
      [(NSMutableSet *)self->_invalidCoordinateAnnotations removeObject:v10];
    }
    else
    {
      [v10 coordinate];
      if (v15 < -180.0 || v15 > 180.0 || v14 < -90.0 || v14 > 90.0)
      {
        invalidCoordinateAnnotations = self->_invalidCoordinateAnnotations;
        if (!invalidCoordinateAnnotations)
        {
          v17 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E4F1CA80]);
          v18 = self->_invalidCoordinateAnnotations;
          self->_invalidCoordinateAnnotations = v17;

          invalidCoordinateAnnotations = self->_invalidCoordinateAnnotations;
        }
        [(NSMutableSet *)invalidCoordinateAnnotations addObject:v10];
      }
      else
      {
        [(MKQuadTrie *)self->_annotations insert:v10];
      }
      self->_isChangingCoordinate = 0;
      v19 = [v11 objectForKeyedSubscript:*MEMORY[0x1E4F284E0]];
      [v19 MKCoordinateValue];
      double v21 = v20;
      double v23 = v22;

      [v10 coordinate];
      if (vabdd_f64(v21, v25) >= 0.00000000999999994 || vabdd_f64(v23, v24) >= 0.00000000999999994)
      {
        long long v43 = 0u;
        long long v44 = 0u;
        long long v41 = 0u;
        long long v42 = 0u;
        v40 = self;
        v26 = self->_allClusterAnnotations;
        uint64_t v27 = [(NSHashTable *)v26 countByEnumeratingWithState:&v41 objects:v45 count:16];
        if (v27)
        {
          uint64_t v28 = v27;
          uint64_t v29 = *(void *)v42;
          do
          {
            for (uint64_t i = 0; i != v28; ++i)
            {
              if (*(void *)v42 != v29) {
                objc_enumerationMutation(v26);
              }
              v31 = *(void **)(*((void *)&v41 + 1) + 8 * i);
              v32 = [v31 memberAnnotations];
              int v33 = [v32 containsObject:v10];

              if (v33) {
                [v31 _memberAnnotationCoordinateDidChange];
              }
            }
            uint64_t v28 = [(NSHashTable *)v26 countByEnumeratingWithState:&v41 objects:v45 count:16];
          }
          while (v28);
        }

        v34 = [(NSMapTable *)v40->_annotationsToRepresentations objectForKey:v10];
        v35 = v34;
        if (v34)
        {
          [v34 _invalidateCachedCoordinate];
          uint64_t v36 = objc_msgSend(MEMORY[0x1E4F42FF0], "_mapkit_shouldAdoptImplicitAnimationParameters");
          double v37 = 0.0;
          if (v36)
          {
            [MEMORY[0x1E4F42FF0] _currentAnimationDuration];
            double v37 = v38;
          }
          id WeakRetained = objc_loadWeakRetained((id *)&v40->_container);
          objc_msgSend(WeakRetained, "moveAnnotationRepresentation:fromCoordinate:animated:duration:", v35, v36, v21, v23, v37);
        }
        else
        {
          [(MKAnnotationManager *)v40 updateVisibleAnnotations];
        }
      }
    }
  }
}

- (void)_setupUpdateVisibleAnnotationsTimer
{
  if (self->_annotationRepresentationsAreAddedImmediately)
  {
    [(MKAnnotationManager *)self updateVisibleAnnotations];
  }
  else if (!self->_updateVisibleTimer)
  {
    v3 = [MEMORY[0x1E4F1CB00] timerWithTimeInterval:self target:sel_updateVisibleAnnotations selector:0 userInfo:0 repeats:0.0];
    updateVisibleTimer = self->_updateVisibleTimer;
    self->_updateVisibleTimer = v3;

    id v5 = [MEMORY[0x1E4F1CAC0] currentRunLoop];
    [v5 addTimer:self->_updateVisibleTimer forMode:*MEMORY[0x1E4F1C4B0]];
  }
}

- (void)updateVisibleAnnotations
{
  uint64_t v48 = *MEMORY[0x1E4F143B8];
  p_container = &self->_container;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_container);

  if (WeakRetained && !self->_isChangingCoordinate)
  {
    updateVisibleTimer = self->_updateVisibleTimer;
    if (updateVisibleTimer)
    {
      [(NSTimer *)updateVisibleTimer invalidate];
      v6 = self->_updateVisibleTimer;
      self->_updateVisibleTimer = 0;
    }
    id v7 = objc_loadWeakRetained((id *)p_container);
    v8 = [v7 annotationRectTest];

    id v9 = objc_loadWeakRetained((id *)p_container);
    id v10 = [v9 annotationCoordinateTest];

    if (v8 && v10)
    {
      id v11 = [(MKQuadTrie *)self->_annotations itemsPassingRectTest:v8 coordinateTest:v10];
      id v12 = objc_loadWeakRetained((id *)&self->_draggedAnnotation);

      if (v12)
      {
        id v13 = objc_loadWeakRetained((id *)&self->_draggedAnnotation);
        [v11 addObject:v13];
      }
      int v14 = [v11 containsObject:self->_selectedAnnotation];
      if (v14) {
        [v11 removeObject:self->_selectedAnnotation];
      }
      if (self->_selectedAnnotation)
      {
        double v15 = -[NSMapTable objectForKey:](self->_annotationsToRepresentations, "objectForKey:");
        v16 = v15;
        if (v14)
        {
          [v15 _setHiddenForOffscreen:0];
        }
        else
        {
          id v17 = objc_loadWeakRetained((id *)p_container);
          objc_msgSend(v16, "_setHiddenForOffscreen:", objc_msgSend(v17, "shouldHideOffscreenSelectedAnnotation"));
        }
      }
      if ([v11 count] || -[NSHashTable count](self->_visibleAnnotations, "count"))
      {
        v18 = (void *)[(NSHashTable *)self->_visibleAnnotations mutableCopy];
        [v18 minusHashTable:v11];
        if (self->_selectedAnnotation) {
          objc_msgSend(v18, "removeObject:");
        }
        double v37 = v8;
        long long v44 = 0u;
        long long v45 = 0u;
        long long v42 = 0u;
        long long v43 = 0u;
        id v19 = v18;
        uint64_t v20 = [v19 countByEnumeratingWithState:&v42 objects:v47 count:16];
        if (v20)
        {
          uint64_t v21 = v20;
          uint64_t v22 = *(void *)v43;
          do
          {
            for (uint64_t i = 0; i != v21; ++i)
            {
              if (*(void *)v43 != v22) {
                objc_enumerationMutation(v19);
              }
              [(MKAnnotationManager *)self _removeRepresentationForAnnotation:*(void *)(*((void *)&v42 + 1) + 8 * i) fromCull:1];
            }
            uint64_t v21 = [v19 countByEnumeratingWithState:&v42 objects:v47 count:16];
          }
          while (v21);
        }

        long long v40 = 0u;
        long long v41 = 0u;
        long long v38 = 0u;
        long long v39 = 0u;
        id v24 = v11;
        uint64_t v25 = [v24 countByEnumeratingWithState:&v38 objects:v46 count:16];
        if (v25)
        {
          uint64_t v26 = v25;
          uint64_t v27 = 0;
          uint64_t v28 = *(void *)v39;
          do
          {
            for (uint64_t j = 0; j != v26; ++j)
            {
              if (*(void *)v39 != v28) {
                objc_enumerationMutation(v24);
              }
              uint64_t v30 = *(void *)(*((void *)&v38 + 1) + 8 * j);
              if (![(NSHashTable *)self->_visibleAnnotations containsObject:v30])
              {
                if (!v27) {
                  uint64_t v27 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(v24, "count"));
                }
                v31 = [(MKAnnotationManager *)self _addRepresentationForAnnotation:v30];
                [v27 addObject:v31];
              }
            }
            uint64_t v26 = [v24 countByEnumeratingWithState:&v38 objects:v46 count:16];
          }
          while (v26);
        }
        else
        {
          uint64_t v27 = 0;
        }

        [(NSMutableSet *)self->_pendingAnnotations removeAllObjects];
        [(NSMutableSet *)self->_disallowAnimationAnnotations removeAllObjects];

        id v10 = v36;
        v8 = v37;
      }
      else
      {
        uint64_t v27 = 0;
      }
      if ([v27 count] || -[NSMutableSet count](self->_pendingRemovalAnnotationRepresentations, "count"))
      {
        id v32 = objc_loadWeakRetained((id *)&self->_delegate);
        [v32 annotationManagerDidChangeVisibleAnnotationRepresentations:self];

        if ([v27 count])
        {
          id v33 = objc_loadWeakRetained((id *)&self->_delegate);
          [v33 annotationManager:self didAddAnnotationRepresentations:v27];
        }
        if ([(NSMutableSet *)self->_pendingRemovalAnnotationRepresentations count])
        {
          id v34 = objc_loadWeakRetained((id *)&self->_delegate);
          v35 = [(NSMutableSet *)self->_pendingRemovalAnnotationRepresentations allObjects];
          [v34 annotationManager:self didRemoveAnnotationRepresentations:v35];

          [(NSMutableSet *)self->_pendingRemovalAnnotationRepresentations removeAllObjects];
        }
      }
    }
  }
}

- (void)addAnnotation:(id)a3 allowAnimation:(BOOL)a4
{
  id v6 = a3;
  id v10 = v6;
  if (v6 && !a4)
  {
    disallowAnimationAnnotations = self->_disallowAnimationAnnotations;
    if (!disallowAnimationAnnotations)
    {
      v8 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E4F1CA80]);
      id v9 = self->_disallowAnimationAnnotations;
      self->_disallowAnimationAnnotations = v8;

      disallowAnimationAnnotations = self->_disallowAnimationAnnotations;
    }
    [(NSMutableSet *)disallowAnimationAnnotations addObject:v10];
    id v6 = v10;
  }
  [(MKAnnotationManager *)self _addAnnotation:v6 updateVisible:1];
}

- (void)addAnnotation:(id)a3
{
}

- (void)_addAnnotation:(id)a3 updateVisible:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  if (v6)
  {
    uint64_t v20 = v6;
    BOOL v7 = [(MKQuadTrie *)self->_annotations contains:v6];
    id v6 = v20;
    if (!v7)
    {
      char v8 = [(NSMutableSet *)self->_invalidCoordinateAnnotations containsObject:v20];
      id v6 = v20;
      if ((v8 & 1) == 0)
      {
        [v20 addObserver:self forKeyPath:@"coordinate" options:10 context:0];
        [v20 coordinate];
        if (v10 < -180.0 || v10 > 180.0 || v9 < -90.0 || v9 > 90.0)
        {
          invalidCoordinateAnnotations = self->_invalidCoordinateAnnotations;
          if (!invalidCoordinateAnnotations)
          {
            id v12 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E4F1CA80]);
            id v13 = self->_invalidCoordinateAnnotations;
            self->_invalidCoordinateAnnotations = v12;

            invalidCoordinateAnnotations = self->_invalidCoordinateAnnotations;
          }
          [(NSMutableSet *)invalidCoordinateAnnotations addObject:v20];
        }
        else
        {
          [(MKQuadTrie *)self->_annotations insert:v20];
        }
        pendingAnnotations = self->_pendingAnnotations;
        if (!pendingAnnotations)
        {
          double v15 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E4F1CA80]);
          v16 = self->_pendingAnnotations;
          self->_pendingAnnotations = v15;

          pendingAnnotations = self->_pendingAnnotations;
        }
        [(NSMutableSet *)pendingAnnotations addObject:v20];
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          allClusterAnnotations = self->_allClusterAnnotations;
          if (!allClusterAnnotations)
          {
            v18 = (NSHashTable *)[objc_alloc(MEMORY[0x1E4F28D30]) initWithOptions:512 capacity:100];
            id v19 = self->_allClusterAnnotations;
            self->_allClusterAnnotations = v18;

            allClusterAnnotations = self->_allClusterAnnotations;
          }
          [(NSHashTable *)allClusterAnnotations addObject:v20];
        }
        id v6 = v20;
        if (v4)
        {
          [(MKAnnotationManager *)self _setupUpdateVisibleAnnotationsTimer];
          id v6 = v20;
        }
      }
    }
  }
}

- (NSArray)annotationRepresentations
{
  return (NSArray *)[(NSMutableSet *)self->_annotationRepresentations allObjects];
}

- (BOOL)containsAnnotation:(id)a3
{
  return [(MKQuadTrie *)self->_annotations contains:a3];
}

- (void)setDelegate:(id)a3
{
}

- (id)_addRepresentationForAnnotation:(id)a3
{
  id v4 = a3;
  if (!self->_annotationsToRepresentations)
  {
    id v5 = (NSMapTable *)[objc_alloc(MEMORY[0x1E4F28E10]) initWithKeyOptions:512 valueOptions:512 capacity:100];
    annotationsToRepresentations = self->_annotationsToRepresentations;
    self->_annotationsToRepresentations = v5;
  }
  if (!self->_annotationRepresentations)
  {
    BOOL v7 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E4F1CA80]);
    annotationRepresentations = self->_annotationRepresentations;
    self->_annotationRepresentations = v7;
  }
  double v9 = [(NSMapTable *)self->_annotationsToRepresentations objectForKey:v4];

  if (v9)
  {
    id v10 = [(NSMapTable *)self->_annotationsToRepresentations objectForKey:v4];
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0
      && [v4 shouldRepresentSelf]
      && (id v11 = v4) != 0)
    {
      id v10 = v11;
      [(MKAnnotationManager *)self annotationIsInternal:v11];
    }
    else
    {
      id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
      id v10 = [WeakRetained annotationManager:self representationForAnnotation:v4];

      BOOL v13 = [(MKAnnotationManager *)self annotationIsInternal:v4];
      if (!v10 && v13) {
        id v10 = [(MKAnnotationManager *)self newInternalAnnotationRepresentationForInternalAnnotation:v4];
      }
      if (!v10)
      {
        objc_opt_class();
        char isKindOfClass = objc_opt_isKindOfClass();
        double v15 = &MKMapViewDefaultClusterAnnotationViewReuseIdentifier;
        if ((isKindOfClass & 1) == 0) {
          double v15 = &MKMapViewDefaultAnnotationViewReuseIdentifier;
        }
        id v10 = [(MKAnnotationManager *)self dequeueReusableAnnotationRepresentationWithIdentifier:*v15];
        [(MKAnnotationManager *)self configureDefaultAnnotationRepresentation:v10 forAnnotation:v4];
      }
    }
    [(MKAnnotationManager *)self configureAnnotationRepresentation:v10 forAnnotation:v4];
    [(NSMapTable *)self->_annotationsToRepresentations setObject:v10 forKey:v4];
    [(NSMutableSet *)self->_annotationRepresentations addObject:v10];
    [(NSHashTable *)self->_visibleAnnotations addObject:v4];
    if ([(NSMutableSet *)self->_pendingAnnotations containsObject:v4]) {
      uint64_t v16 = [(NSMutableSet *)self->_disallowAnimationAnnotations containsObject:v4] ^ 1;
    }
    else {
      uint64_t v16 = 0;
    }
    id v17 = objc_loadWeakRetained((id *)&self->_container);
    [v17 addAnnotationRepresentation:v10 allowAnimation:v16];
  }

  return v10;
}

- (BOOL)annotationIsInternal:(id)a3
{
  id v3 = a3;
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

- (void)configureAnnotationRepresentation:(id)a3 forAnnotation:(id)a4
{
  id v7 = a4;
  id v5 = [a3 viewRepresentation];
  id v6 = v5;
  if (v5) {
    [v5 setAnnotation:v7];
  }
}

- (MKAnnotationRepresentation)selectedAnnotationRepresentation
{
  if (self->_selectedAnnotation)
  {
    v2 = -[NSMapTable objectForKey:](self->_annotationsToRepresentations, "objectForKey:");
  }
  else
  {
    v2 = 0;
  }

  return (MKAnnotationRepresentation *)v2;
}

- (MKAnnotationManager)init
{
  v8.receiver = self;
  v8.super_class = (Class)MKAnnotationManager;
  v2 = [(MKAnnotationManager *)&v8 init];
  if (v2)
  {
    id v3 = -[MKQuadTrie initWithInitialRegion:minimumSize:maximumItems:]([MKQuadTrie alloc], "initWithInitialRegion:minimumSize:maximumItems:", 100, 0.0, 0.0, 268435456.0, 268435456.0, 1024.0, 1024.0);
    annotations = v2->_annotations;
    v2->_annotations = v3;

    uint64_t v5 = [objc_alloc(MEMORY[0x1E4F28D30]) initWithOptions:512 capacity:100];
    visibleAnnotations = v2->_visibleAnnotations;
    v2->_visibleAnnotations = (NSHashTable *)v5;

    [(MKAnnotationManager *)v2 registerClass:0 forRepresentationReuseIdentifier:@"MKMapViewDefaultAnnotationViewReuseIdentifier"];
    [(MKAnnotationManager *)v2 registerClass:0 forRepresentationReuseIdentifier:@"MKMapViewDefaultClusterAnnotationViewReuseIdentifier"];
  }
  return v2;
}

- (void)registerClass:(Class)a3 forRepresentationReuseIdentifier:(id)a4
{
  id v6 = a4;
  id v7 = v6;
  id v12 = v6;
  if (a3) {
    goto LABEL_7;
  }
  if (([v6 isEqualToString:@"MKMapViewDefaultAnnotationViewReuseIdentifier"] & 1) == 0)
  {
    int v8 = [v12 isEqualToString:@"MKMapViewDefaultClusterAnnotationViewReuseIdentifier"];
    id v7 = v12;
    if (!v8) {
      goto LABEL_13;
    }
  }
  a3 = (Class)objc_opt_class();
  if (_MKLinkedOnOrAfterReleaseSet(1540)) {
    a3 = (Class)objc_opt_class();
  }
  id v7 = v12;
  if (a3)
  {
LABEL_7:
    registeredIdentifierToRepresentationClasses = self->_registeredIdentifierToRepresentationClasses;
    if (!registeredIdentifierToRepresentationClasses)
    {
      id v10 = [MEMORY[0x1E4F1CA60] dictionary];
      id v11 = self->_registeredIdentifierToRepresentationClasses;
      self->_registeredIdentifierToRepresentationClasses = v10;

      id v7 = v12;
      registeredIdentifierToRepresentationClasses = self->_registeredIdentifierToRepresentationClasses;
    }
    [(NSMutableDictionary *)registeredIdentifierToRepresentationClasses setObject:a3 forKey:v7];
  }
  else
  {
LABEL_13:
    [(NSMutableDictionary *)self->_registeredIdentifierToRepresentationClasses removeObjectForKey:v7];
  }
}

- (void)setContainer:(id)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_container);

  if (WeakRetained != v4)
  {
    id v6 = self->_selectedAnnotation;
    [(MKAnnotationManager *)self deselectAnnotation:v6 animated:0];
    long long v16 = 0u;
    long long v17 = 0u;
    long long v14 = 0u;
    long long v15 = 0u;
    id v7 = self->_annotationRepresentations;
    uint64_t v8 = [(NSMutableSet *)v7 countByEnumeratingWithState:&v14 objects:v18 count:16];
    if (v8)
    {
      uint64_t v9 = v8;
      uint64_t v10 = *(void *)v15;
      do
      {
        uint64_t v11 = 0;
        do
        {
          if (*(void *)v15 != v10) {
            objc_enumerationMutation(v7);
          }
          uint64_t v12 = *(void *)(*((void *)&v14 + 1) + 8 * v11);
          id v13 = objc_loadWeakRetained((id *)&self->_container);
          objc_msgSend(v13, "removeAnnotationRepresentation:", v12, (void)v14);

          ++v11;
        }
        while (v9 != v11);
        uint64_t v9 = [(NSMutableSet *)v7 countByEnumeratingWithState:&v14 objects:v18 count:16];
      }
      while (v9);
    }

    [(NSMutableSet *)self->_annotationRepresentations removeAllObjects];
    [(NSMapTable *)self->_annotationsToRepresentations removeAllObjects];
    [(NSHashTable *)self->_visibleAnnotations removeAllObjects];
    objc_storeWeak((id *)&self->_container, v4);
    [(MKAnnotationManager *)self updateVisibleAnnotations];
    [(MKAnnotationManager *)self selectAnnotation:v6 animated:0];
  }
}

- (void)selectAnnotation:(id)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  id v7 = (MKAnnotation *)a3;
  uint64_t v8 = v7;
  selectedAnnotation = self->_selectedAnnotation;
  if (!v7 || selectedAnnotation != v7)
  {
    id v24 = v7;
    if (selectedAnnotation)
    {
      if (v4
        && (id v10 = objc_loadWeakRetained((id *)&self->_delegate),
            char v11 = objc_opt_respondsToSelector(),
            v10,
            (v11 & 1) != 0))
      {
        id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
        uint64_t v13 = [WeakRetained annotationManager:self shouldAnimateDeselectionOfAnnotation:self->_selectedAnnotation forSelectionOfAnnotation:v24];
      }
      else
      {
        uint64_t v13 = 0;
      }
      [(MKAnnotationManager *)self deselectAnnotation:self->_selectedAnnotation animated:v13];
      uint64_t v8 = v24;
    }
    if (v8)
    {
      if ([(MKQuadTrie *)self->_annotations contains:v8])
      {
        long long v14 = [(NSMapTable *)self->_annotationsToRepresentations objectForKey:v24];
        if (!v14)
        {
          long long v14 = [(MKAnnotationManager *)self _addRepresentationForAnnotation:v24];
          id v15 = objc_loadWeakRetained((id *)&self->_delegate);
          [v15 annotationManagerDidChangeVisibleAnnotationRepresentations:self];

          id v16 = objc_loadWeakRetained((id *)&self->_delegate);
          long long v17 = [MEMORY[0x1E4F1C978] arrayWithObject:v14];
          [v16 annotationManager:self didAddAnnotationRepresentations:v17];
        }
        objc_storeStrong((id *)&self->_selectedAnnotation, a3);
        id v18 = objc_loadWeakRetained((id *)&self->_delegate);
        char v19 = objc_opt_respondsToSelector();

        if ((v19 & 1) != 0
          && (id v20 = objc_loadWeakRetained((id *)&self->_delegate),
              int v21 = [v20 annotationManager:self canSelectAnnotationRepresentation:v14],
              v20,
              !v21))
        {
          self->_isDeferringContainerSelection = 1;
          self->_deferredContainerSelectionAnimated = v4;
        }
        else
        {
          id v22 = objc_loadWeakRetained((id *)&self->_container);
          [v22 selectAnnotationRepresentation:v14 animated:v4];
        }
        id v23 = objc_loadWeakRetained((id *)&self->_delegate);
        [v23 annotationManager:self didSelectAnnotationRepresentation:v14];
      }
      else
      {
        NSLog(&cfstr_ErrorTryingToS.isa);
      }
      uint64_t v8 = v24;
    }
  }
}

- (void)deselectAnnotation:(id)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = (MKAnnotation *)a3;
  selectedAnnotation = self->_selectedAnnotation;
  if (v6)
  {
    uint64_t v8 = v6;
    if (selectedAnnotation != v6) {
      goto LABEL_10;
    }
  }
  else
  {
    if (!selectedAnnotation)
    {
      uint64_t v8 = 0;
      goto LABEL_10;
    }
    uint64_t v8 = selectedAnnotation;
  }
  id v16 = v8;
  uint64_t v9 = [(NSMapTable *)self->_annotationsToRepresentations objectForKey:v8];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  char v11 = objc_opt_respondsToSelector();

  if (v11)
  {
    id v12 = objc_loadWeakRetained((id *)&self->_delegate);
    [v12 annotationManager:self willDeselectAnnotationRepresentation:v9];
  }
  self->_isDeferringContainerSelection = 0;
  id v13 = objc_loadWeakRetained((id *)&self->_container);
  [v13 deselectAnnotationRepresentation:v9 animated:v4];

  [v9 _setHiddenForOffscreen:0];
  long long v14 = self->_selectedAnnotation;
  self->_selectedAnnotation = 0;

  id v15 = objc_loadWeakRetained((id *)&self->_delegate);
  [v15 annotationManager:self didDeselectAnnotationRepresentation:v9];

  [(MKAnnotationManager *)self updateVisibleAnnotations];
  uint64_t v8 = v16;
LABEL_10:
}

- (void)dealloc
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  annotations = self->_annotations;
  v23[0] = MEMORY[0x1E4F143A8];
  v23[1] = 3221225472;
  v23[2] = __30__MKAnnotationManager_dealloc__block_invoke;
  v23[3] = &unk_1E54BB230;
  v23[4] = self;
  [(MKQuadTrie *)annotations foreach:v23];
  long long v21 = 0u;
  long long v22 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  BOOL v4 = self->_invalidCoordinateAnnotations;
  uint64_t v5 = [(NSMutableSet *)v4 countByEnumeratingWithState:&v19 objects:v25 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v20;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v20 != v7) {
          objc_enumerationMutation(v4);
        }
        [*(id *)(*((void *)&v19 + 1) + 8 * v8++) removeObserver:self forKeyPath:@"coordinate"];
      }
      while (v6 != v8);
      uint64_t v6 = [(NSMutableSet *)v4 countByEnumeratingWithState:&v19 objects:v25 count:16];
    }
    while (v6);
  }

  long long v17 = 0u;
  long long v18 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  uint64_t v9 = self->_annotationRepresentations;
  uint64_t v10 = [(NSMutableSet *)v9 countByEnumeratingWithState:&v15 objects:v24 count:16];
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
        [(MKAnnotationManager *)self cleanUpAnnotationRepresentationForRemoval:*(void *)(*((void *)&v15 + 1) + 8 * v13++)];
      }
      while (v11 != v13);
      uint64_t v11 = [(NSMutableSet *)v9 countByEnumeratingWithState:&v15 objects:v24 count:16];
    }
    while (v11);
  }

  v14.receiver = self;
  v14.super_class = (Class)MKAnnotationManager;
  [(MKAnnotationManager *)&v14 dealloc];
}

uint64_t __30__MKAnnotationManager_dealloc__block_invoke(uint64_t a1, void *a2)
{
  return 1;
}

- (void)addAnnotations:(id)a3
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  uint64_t v5 = [v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v10;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v10 != v7) {
          objc_enumerationMutation(v4);
        }
        [(MKAnnotationManager *)self _addAnnotation:*(void *)(*((void *)&v9 + 1) + 8 * v8++) updateVisible:0];
      }
      while (v6 != v8);
      uint64_t v6 = [v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v6);
  }
  [(MKAnnotationManager *)self _setupUpdateVisibleAnnotationsTimer];
}

- (id)addRepresentationForAnnotation:(id)a3
{
  v10[1] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  [(MKAnnotationManager *)self _addAnnotation:v4 updateVisible:0];
  uint64_t v5 = [(MKAnnotationManager *)self _addRepresentationForAnnotation:v4];
  if (v5)
  {
    [(NSMutableSet *)self->_pendingAnnotations removeObject:v4];
    [(NSMutableSet *)self->_disallowAnimationAnnotations removeObject:v4];
    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    [WeakRetained annotationManagerDidChangeVisibleAnnotationRepresentations:self];

    id v7 = objc_loadWeakRetained((id *)&self->_delegate);
    v10[0] = v5;
    uint64_t v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:v10 count:1];
    [v7 annotationManager:self didAddAnnotationRepresentations:v8];
  }
  else
  {
    NSLog(&cfstr_FailedToCreate.isa, v4);
    [(NSMutableSet *)self->_pendingAnnotations removeObject:v4];
    [(NSMutableSet *)self->_disallowAnimationAnnotations removeObject:v4];
  }

  return v5;
}

- (void)_removeAnnotation:(id)a3 updateVisible:(BOOL)a4 removeFromContainer:(BOOL)a5
{
  BOOL v5 = a5;
  BOOL v6 = a4;
  long long v11 = (MKAnnotation *)a3;
  BOOL v8 = [(MKQuadTrie *)self->_annotations contains:v11];
  long long v9 = v11;
  if (v8
    || (v10 = [(NSMutableSet *)self->_invalidCoordinateAnnotations containsObject:v11], long long v9 = v11, v10))
  {
    if ([(MKQuadTrie *)self->_annotations contains:v9]
      || [(NSMutableSet *)self->_invalidCoordinateAnnotations containsObject:v11])
    {
      [(MKAnnotation *)v11 removeObserver:self forKeyPath:@"coordinate"];
    }
    [(MKQuadTrie *)self->_annotations remove:v11];
    [(NSMutableSet *)self->_invalidCoordinateAnnotations removeObject:v11];
    [(NSMutableSet *)self->_pendingAnnotations removeObject:v11];
    [(NSHashTable *)self->_visibleAnnotations removeObject:v11];
    [(NSMutableSet *)self->_disallowAnimationAnnotations removeObject:v11];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      [(NSHashTable *)self->_allClusterAnnotations removeObject:v11];
    }
    long long v9 = v11;
    if (self->_selectedAnnotation == v11)
    {
      [(MKAnnotationManager *)self deselectAnnotation:v11 animated:0];
      long long v9 = v11;
      if (!v5)
      {
LABEL_10:
        if (!v6) {
          goto LABEL_12;
        }
        goto LABEL_11;
      }
    }
    else if (!v5)
    {
      goto LABEL_10;
    }
    [(MKAnnotationManager *)self _removeRepresentationForAnnotation:v11 fromCull:0];
    long long v9 = v11;
    if (v6)
    {
LABEL_11:
      [(MKAnnotationManager *)self _setupUpdateVisibleAnnotationsTimer];
      long long v9 = v11;
    }
  }
LABEL_12:
}

- (void)removeAnnotation:(id)a3
{
}

- (void)removeAnnotation:(id)a3 updateVisible:(BOOL)a4
{
}

- (void)removeAnnotations:(id)a3
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  uint64_t v5 = [v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v10;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v10 != v7) {
          objc_enumerationMutation(v4);
        }
        [(MKAnnotationManager *)self _removeAnnotation:*(void *)(*((void *)&v9 + 1) + 8 * v8++) updateVisible:0 removeFromContainer:1];
      }
      while (v6 != v8);
      uint64_t v6 = [v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v6);
  }
  [(MKAnnotationManager *)self updateVisibleAnnotations];
}

- (void)replaceAnnotation:(id)a3 withAnnotation:(id)a4
{
  long long v9 = (MKAnnotation *)a3;
  id v6 = a4;
  if (![(MKQuadTrie *)self->_annotations contains:v6])
  {
    BOOL v7 = [(MKQuadTrie *)self->_annotations contains:v9];
    if (v9)
    {
      if (v7)
      {
        if (v6)
        {
          if (self->_selectedAnnotation == v9)
          {
            uint64_t v8 = [(NSMapTable *)self->_annotationsToRepresentations objectForKey:v9];
            objc_storeStrong((id *)&self->_selectedAnnotation, a4);
            [(NSMapTable *)self->_annotationsToRepresentations removeObjectForKey:v9];
            [(MKAnnotationManager *)self _removeAnnotation:v9 updateVisible:0 removeFromContainer:0];
            [(MKAnnotationManager *)self _addAnnotation:v6 updateVisible:0];
            [(MKAnnotationManager *)self configureAnnotationRepresentation:v8 forAnnotation:v6];
            [(NSMapTable *)self->_annotationsToRepresentations setObject:v8 forKey:v6];
            [(NSHashTable *)self->_visibleAnnotations addObject:v6];
          }
          else
          {
            [(MKAnnotationManager *)self removeAnnotation:v9];
            [(MKAnnotationManager *)self addAnnotation:v6];
          }
        }
        else
        {
          [(MKAnnotationManager *)self removeAnnotation:v9];
        }
      }
    }
  }
}

- (void)addRepresentationsForAnnotations:(id)a3
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(v4, "count"));
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id v6 = v4;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v17;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v17 != v9) {
          objc_enumerationMutation(v6);
        }
        uint64_t v11 = *(void *)(*((void *)&v16 + 1) + 8 * i);
        if (-[MKQuadTrie contains:](self->_annotations, "contains:", v11, (void)v16))
        {
          long long v12 = [(NSMapTable *)self->_annotationsToRepresentations objectForKey:v11];

          if (!v12)
          {
            uint64_t v13 = [(MKAnnotationManager *)self _addRepresentationForAnnotation:v11];
            [v5 addObject:v13];
            [(NSMutableSet *)self->_pendingAnnotations removeObject:v11];
            [(NSMutableSet *)self->_disallowAnimationAnnotations removeObject:v11];
          }
        }
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v8);
  }

  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  [WeakRetained annotationManagerDidChangeVisibleAnnotationRepresentations:self];

  id v15 = objc_loadWeakRetained((id *)&self->_delegate);
  [v15 annotationManager:self didAddAnnotationRepresentations:v5];
}

- (id)dequeueReusableAnnotationRepresentationWithIdentifier:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(NSMapTable *)self->_reusableAnnotationRepresentations objectForKey:v4];
  if ([v5 count])
  {
    id v6 = [v5 lastObject];
    if ([(NSMutableSet *)self->_annotationRepresentations containsObject:v6])
    {
      do
      {
        if ([v5 count])
        {
          [v5 removeLastObject];
          uint64_t v7 = [v5 lastObject];
        }
        else
        {
          uint64_t v7 = 0;
        }

        id v6 = v7;
      }
      while (([(NSMutableSet *)self->_annotationRepresentations containsObject:v7] & 1) != 0);
    }
    else
    {
      uint64_t v7 = v6;
    }
    [v7 prepareForReuse];
    if ([v5 count]) {
      [v5 removeLastObject];
    }
    else {
      [(NSMapTable *)self->_reusableAnnotationRepresentations removeObjectForKey:v4];
    }
  }
  else
  {
    uint64_t v8 = [(NSMutableDictionary *)self->_registeredIdentifierToRepresentationClasses objectForKey:v4];
    uint64_t v7 = objc_msgSend((id)objc_msgSend(v8, "alloc"), "initWithAnnotation:reuseIdentifier:", 0, v4);
  }

  return v7;
}

- (id)annotationsInMapRect:(id)a3
{
  return -[MKQuadTrie itemsInMapRect:](self->_annotations, "itemsInMapRect:", a3.var0.var0, a3.var0.var1, a3.var1.var0, a3.var1.var1);
}

- (void)showAnnotationsInMapRect:(id)a3
{
  double var1 = a3.var1.var1;
  double var0 = a3.var1.var0;
  double v5 = a3.var0.var1;
  double v6 = a3.var0.var0;
  uint64_t v41 = *MEMORY[0x1E4F143B8];
  p_container = &self->_container;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_container);

  if (WeakRetained)
  {
    id v10 = objc_loadWeakRetained((id *)p_container);
    uint64_t v11 = [v10 annotationRectTest];

    if (v11 && v11[2](v11, v6, v5, var0, var1) != 1)
    {
      updateVisibleTimer = self->_updateVisibleTimer;
      if (updateVisibleTimer)
      {
        [(NSTimer *)updateVisibleTimer invalidate];
        uint64_t v13 = self->_updateVisibleTimer;
        self->_updateVisibleTimer = 0;
      }
      uint64_t v14 = -[MKQuadTrie itemsInMapRect:](self->_annotations, "itemsInMapRect:", v6, v5, var0, var1);
      if ([v14 containsObject:self->_selectedAnnotation]) {
        [v14 removeObject:self->_selectedAnnotation];
      }
      long long v37 = 0u;
      long long v38 = 0u;
      long long v35 = 0u;
      long long v36 = 0u;
      id v15 = self->_visibleAnnotations;
      uint64_t v16 = [(NSHashTable *)v15 countByEnumeratingWithState:&v35 objects:v40 count:16];
      if (v16)
      {
        uint64_t v17 = v16;
        uint64_t v18 = *(void *)v36;
        do
        {
          for (uint64_t i = 0; i != v17; ++i)
          {
            if (*(void *)v36 != v18) {
              objc_enumerationMutation(v15);
            }
            [v14 removeObject:*(void *)(*((void *)&v35 + 1) + 8 * i)];
          }
          uint64_t v17 = [(NSHashTable *)v15 countByEnumeratingWithState:&v35 objects:v40 count:16];
        }
        while (v17);
      }

      [(NSMutableSet *)self->_pendingAnnotations minusSet:v14];
      [(NSMutableSet *)self->_disallowAnimationAnnotations minusSet:v14];
      if ([v14 count])
      {
        long long v33 = 0u;
        long long v34 = 0u;
        long long v31 = 0u;
        long long v32 = 0u;
        id v20 = v14;
        uint64_t v21 = [v20 countByEnumeratingWithState:&v31 objects:v39 count:16];
        if (v21)
        {
          uint64_t v22 = v21;
          id v23 = 0;
          uint64_t v24 = *(void *)v32;
          do
          {
            for (uint64_t j = 0; j != v22; ++j)
            {
              if (*(void *)v32 != v24) {
                objc_enumerationMutation(v20);
              }
              uint64_t v26 = *(void *)(*((void *)&v31 + 1) + 8 * j);
              if (!v23)
              {
                id v27 = objc_alloc(MEMORY[0x1E4F1CA48]);
                id v23 = objc_msgSend(v27, "initWithCapacity:", objc_msgSend(v20, "count", (void)v31));
              }
              uint64_t v28 = -[MKAnnotationManager _addRepresentationForAnnotation:](self, "_addRepresentationForAnnotation:", v26, (void)v31);
              [v23 addObject:v28];
            }
            uint64_t v22 = [v20 countByEnumeratingWithState:&v31 objects:v39 count:16];
          }
          while (v22);
        }
        else
        {
          id v23 = 0;
        }

        if ([v23 count])
        {
          id v29 = objc_loadWeakRetained((id *)&self->_delegate);
          [v29 annotationManagerDidChangeVisibleAnnotationRepresentations:self];

          id v30 = objc_loadWeakRetained((id *)&self->_delegate);
          [v30 annotationManager:self didAddAnnotationRepresentations:v23];
        }
      }
    }
  }
}

- (NSArray)annotations
{
  id v3 = [MEMORY[0x1E4F1CA48] array];
  id v4 = [(MKQuadTrie *)self->_annotations allItems];
  [v3 addObjectsFromArray:v4];

  invalidCoordinateAnnotations = self->_invalidCoordinateAnnotations;
  if (invalidCoordinateAnnotations)
  {
    double v6 = [(NSMutableSet *)invalidCoordinateAnnotations allObjects];
    [v3 addObjectsFromArray:v6];
  }

  return (NSArray *)v3;
}

- (void)_annotationDidChangeState:(id)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  double v6 = (MKAnnotation *)a3;
  uint64_t v7 = v6;
  if (self->_isDeferringContainerSelection && self->_selectedAnnotation == v6)
  {
    uint64_t v17 = v6;
    if ([(MKQuadTrie *)self->_annotations contains:v6])
    {
      uint64_t v8 = [(NSMapTable *)self->_annotationsToRepresentations objectForKey:v17];
      uint64_t v7 = v17;
      if (!v8) {
        goto LABEL_13;
      }
      uint64_t v9 = (void *)v8;
      id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
      char v11 = objc_opt_respondsToSelector();

      if ((v11 & 1) == 0
        || (id v12 = objc_loadWeakRetained((id *)&self->_delegate),
            int v13 = [v12 annotationManager:self canSelectAnnotationRepresentation:v9],
            v12,
            v13))
      {
        self->_isDeferringContainerSelection = 0;
        id v14 = objc_loadWeakRetained((id *)&self->_container);
        id v15 = v14;
        BOOL deferredContainerSelectionAnimated = 0;
        if (v4) {
          BOOL deferredContainerSelectionAnimated = self->_deferredContainerSelectionAnimated;
        }
        [v14 selectAnnotationRepresentation:v9 animated:deferredContainerSelectionAnimated];
      }
    }
    else
    {
      NSLog(&cfstr_ErrorTryingToS.isa);
    }
    uint64_t v7 = v17;
  }
LABEL_13:
}

- (id)representationForAnnotation:(id)a3
{
  return [(NSMapTable *)self->_annotationsToRepresentations objectForKey:a3];
}

- (id)newInternalAnnotationRepresentationForInternalAnnotation:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    userLocationView = self->_userLocationView;
    if (!userLocationView)
    {
      double v6 = [[_MKUserLocationView alloc] initWithAnnotation:v4 reuseIdentifier:0];
      uint64_t v7 = self->_userLocationView;
      self->_userLocationView = &v6->super.super;

      userLocationView = self->_userLocationView;
    }
    uint64_t v8 = userLocationView;
  }
  else
  {
    uint64_t v8 = 0;
  }

  return v8;
}

- (void)configureDefaultAnnotationRepresentation:(id)a3 forAnnotation:(id)a4
{
  id v15 = a4;
  double v5 = [a3 viewRepresentation];
  if (!v5) {
    goto LABEL_18;
  }
  BOOL v6 = _MKLinkedOnOrAfterReleaseSet(1539);
  char v7 = objc_opt_respondsToSelector();
  if (!v6)
  {
    if (v7)
    {
      uint64_t v8 = [v15 title];
      BOOL v10 = [v8 length] != 0;
      uint64_t v9 = v5;
      goto LABEL_8;
    }
LABEL_10:
    [v5 setCanShowCallout:0];
    goto LABEL_11;
  }
  if ((v7 & 1) == 0) {
    goto LABEL_10;
  }
  uint64_t v8 = [v15 title];
  if (![v8 length])
  {
    id v14 = [v5 detailCalloutAccessoryView];
    [v5 setCanShowCallout:v14 != 0];

    goto LABEL_9;
  }
  uint64_t v9 = v5;
  BOOL v10 = 1;
LABEL_8:
  [v9 setCanShowCallout:v10];
LABEL_9:

LABEL_11:
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    char v11 = [v15 clusteringIdentifier];
    [v5 setClusteringIdentifier:v11];
LABEL_13:

    goto LABEL_18;
  }
  if (objc_opt_respondsToSelector())
  {
    char v11 = [v15 _representedMapItem];
    if (v11)
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        id v12 = v5;
        int v13 = [v11 _styleAttributes];
        [v12 _setStyleAttributes:v13];
      }
    }
    goto LABEL_13;
  }
LABEL_18:
}

- (void)cleanUpAnnotationRepresentationForRemoval:(id)a3
{
  id v3 = [a3 viewRepresentation];
  if (v3)
  {
    id v4 = v3;
    [v3 setAnnotation:0];
    id v3 = v4;
  }
}

- (void)_removeRepresentationForAnnotation:(id)a3 fromCull:(BOOL)a4
{
  BOOL v4 = a4;
  id v17 = a3;
  BOOL v6 = -[NSMapTable objectForKey:](self->_annotationsToRepresentations, "objectForKey:");
  char v7 = v6;
  if (v6 && (!v4 || ([v6 isPersistent] & 1) == 0))
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_container);
    [WeakRetained removeAnnotationRepresentation:v7];

    [(MKAnnotationManager *)self cleanUpAnnotationRepresentationForRemoval:v7];
    uint64_t v9 = [v7 reuseIdentifier];
    if ([v9 length])
    {
      reusableAnnotationRepresentations = self->_reusableAnnotationRepresentations;
      if (!reusableAnnotationRepresentations)
      {
        char v11 = [MEMORY[0x1E4F28E10] strongToStrongObjectsMapTable];
        id v12 = self->_reusableAnnotationRepresentations;
        self->_reusableAnnotationRepresentations = v11;

        reusableAnnotationRepresentations = self->_reusableAnnotationRepresentations;
      }
      id v13 = [(NSMapTable *)reusableAnnotationRepresentations objectForKey:v9];
      if (!v13)
      {
        id v13 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
        [(NSMapTable *)self->_reusableAnnotationRepresentations setObject:v13 forKey:v9];
      }
      [v13 addObject:v7];
    }
    [(NSMapTable *)self->_annotationsToRepresentations removeObjectForKey:v17];
    [(NSMutableSet *)self->_annotationRepresentations removeObject:v7];
    [(NSHashTable *)self->_visibleAnnotations removeObject:v17];
    pendingRemovalAnnotationRepresentations = self->_pendingRemovalAnnotationRepresentations;
    if (!pendingRemovalAnnotationRepresentations)
    {
      id v15 = [MEMORY[0x1E4F1CA80] set];
      uint64_t v16 = self->_pendingRemovalAnnotationRepresentations;
      self->_pendingRemovalAnnotationRepresentations = v15;

      pendingRemovalAnnotationRepresentations = self->_pendingRemovalAnnotationRepresentations;
    }
    [(NSMutableSet *)pendingRemovalAnnotationRepresentations addObject:v7];
  }
}

- (MKAnnotationMarkerContainer)container
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_container);

  return (MKAnnotationMarkerContainer *)WeakRetained;
}

- (MKAnnotationManagerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (MKAnnotationManagerDelegate *)WeakRetained;
}

- (BOOL)annotationRepresentationsAreAddedImmediately
{
  return self->_annotationRepresentationsAreAddedImmediately;
}

- (void)setAnnotationRepresentationsAreAddedImmediately:(BOOL)a3
{
  self->_annotationRepresentationsAreAddedImmediately = a3;
}

- (MKAnnotation)draggedAnnotation
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_draggedAnnotation);

  return (MKAnnotation *)WeakRetained;
}

- (void)setDraggedAnnotation:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_userLocationView, 0);
  objc_storeStrong((id *)&self->_allClusterAnnotations, 0);
  objc_storeStrong((id *)&self->_registeredIdentifierToRepresentationClasses, 0);
  objc_storeStrong((id *)&self->_pendingRemovalAnnotationRepresentations, 0);
  objc_storeStrong((id *)&self->_reusableAnnotationRepresentations, 0);
  objc_storeStrong((id *)&self->_annotationRepresentations, 0);
  objc_storeStrong((id *)&self->_annotationsToRepresentations, 0);
  objc_destroyWeak((id *)&self->_draggedAnnotation);
  objc_storeStrong((id *)&self->_selectedAnnotation, 0);
  objc_storeStrong((id *)&self->_invalidCoordinateAnnotations, 0);
  objc_storeStrong((id *)&self->_disallowAnimationAnnotations, 0);
  objc_storeStrong((id *)&self->_pendingAnnotations, 0);
  objc_storeStrong((id *)&self->_visibleAnnotations, 0);
  objc_storeStrong((id *)&self->_annotations, 0);
  objc_storeStrong((id *)&self->_updateVisibleTimer, 0);
  objc_destroyWeak((id *)&self->_delegate);

  objc_destroyWeak((id *)&self->_container);
}

@end