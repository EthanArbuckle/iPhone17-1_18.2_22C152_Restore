@interface AKUndoController
- (AKController)controller;
- (AKUndoController)initWithController:(id)a3;
- (BOOL)externalSourceTrackingChanged;
- (BOOL)undoGroupHasChangesToMultipleProperties;
- (NSMapTable)undoGroupOldPropertiesPerAnnotation;
- (NSMutableSet)observedAnnotations;
- (NSMutableSet)observedPageModelControllers;
- (NSString)undoGroupPresentablePropertyName;
- (NSUndoManager)undoManager;
- (void)_addAnnotationsFromModel:(id)a3;
- (void)_annotationsWereAdded:(id)a3 onPageController:(id)a4;
- (void)_annotationsWillBeRemoved:(id)a3 onPageController:(id)a4;
- (void)_deleteAnnotationsFromModel:(id)a3;
- (void)_endEditingOfTextIfAnnotationsDeleted:(id)a3;
- (void)_registerUndoForSelectionOnPageModelController:(id)a3;
- (void)_setAnnotationProperties:(id)a3;
- (void)_startObservingAnnotations:(id)a3;
- (void)_stopObservingAnnotations:(id)a3;
- (void)_undoActionForSelectionState:(id)a3;
- (void)dealloc;
- (void)observePageControllerRequestsDisableRegistration:(id)a3;
- (void)observePageControllerRequestsEnableRegistration:(id)a3;
- (void)observeUndoManagerCheckpoint:(id)a3;
- (void)observeUndoManagerDetectedEdit:(id)a3;
- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6;
- (void)setController:(id)a3;
- (void)setExternalSourceTrackingChanged:(BOOL)a3;
- (void)setObservedAnnotations:(id)a3;
- (void)setObservedPageModelControllers:(id)a3;
- (void)setUndoGroupHasChangesToMultipleProperties:(BOOL)a3;
- (void)setUndoGroupOldPropertiesPerAnnotation:(id)a3;
- (void)setUndoGroupPresentablePropertyName:(id)a3;
- (void)setUndoManager:(id)a3;
- (void)startObservingPageModelController:(id)a3;
- (void)stopObservingPageModelController:(id)a3;
@end

@implementation AKUndoController

- (AKUndoController)initWithController:(id)a3
{
  id v4 = a3;
  v26.receiver = self;
  v26.super_class = (Class)AKUndoController;
  v5 = [(AKUndoController *)&v26 init];
  v6 = v5;
  if (v5)
  {
    [(AKUndoController *)v5 setController:v4];
    v7 = [v4 delegate];
    v8 = [v7 undoManagerForAnnotationController:v4];
    [(AKUndoController *)v6 setUndoManager:v8];
    v9 = [MEMORY[0x263EFF9C0] set];
    [(AKUndoController *)v6 setObservedPageModelControllers:v9];

    v10 = [MEMORY[0x263EFF9C0] set];
    [(AKUndoController *)v6 setObservedAnnotations:v10];

    [(AKUndoController *)v6 setUndoGroupPresentablePropertyName:0];
    [(AKUndoController *)v6 setUndoGroupHasChangesToMultipleProperties:0];
    [(AKUndoController *)v6 setUndoGroupOldPropertiesPerAnnotation:0];
    if (v8)
    {
      v11 = [MEMORY[0x263F08A00] defaultCenter];
      uint64_t v12 = *MEMORY[0x263F08618];
      v13 = [(AKUndoController *)v6 undoManager];
      [v11 addObserver:v6 selector:sel_observeUndoManagerCheckpoint_ name:v12 object:v13];

      v14 = [MEMORY[0x263F08A00] defaultCenter];
      uint64_t v15 = *MEMORY[0x263F08620];
      v16 = [(AKUndoController *)v6 undoManager];
      [v14 addObserver:v6 selector:sel_observeUndoManagerDetectedEdit_ name:v15 object:v16];

      v17 = [MEMORY[0x263F08A00] defaultCenter];
      uint64_t v18 = *MEMORY[0x263F08638];
      v19 = [(AKUndoController *)v6 undoManager];
      [v17 addObserver:v6 selector:sel_observeUndoManagerDetectedEdit_ name:v18 object:v19];

      v20 = [MEMORY[0x263F08A00] defaultCenter];
      uint64_t v21 = *MEMORY[0x263F08630];
      v22 = [(AKUndoController *)v6 undoManager];
      [v20 addObserver:v6 selector:sel_observeUndoManagerDetectedEdit_ name:v21 object:v22];

      v23 = [MEMORY[0x263F08A00] defaultCenter];
      [v23 addObserver:v6 selector:sel_observePageControllerRequestsDisableRegistration_ name:off_268923F70[0] object:0];

      v24 = [MEMORY[0x263F08A00] defaultCenter];
      [v24 addObserver:v6 selector:sel_observePageControllerRequestsEnableRegistration_ name:off_268923F78 object:0];
    }
  }

  return v6;
}

- (void)dealloc
{
  uint64_t v37 = *MEMORY[0x263EF8340];
  v3 = [(AKUndoController *)self undoManager];

  if (v3)
  {
    id v4 = [MEMORY[0x263F08A00] defaultCenter];
    [v4 removeObserver:self];

    long long v32 = 0u;
    long long v33 = 0u;
    long long v30 = 0u;
    long long v31 = 0u;
    v5 = [(AKUndoController *)self observedAnnotations];
    uint64_t v6 = [v5 countByEnumeratingWithState:&v30 objects:v36 count:16];
    if (v6)
    {
      uint64_t v7 = v6;
      uint64_t v8 = *(void *)v31;
      do
      {
        for (uint64_t i = 0; i != v7; ++i)
        {
          if (*(void *)v31 != v8) {
            objc_enumerationMutation(v5);
          }
          v10 = *(void **)(*((void *)&v30 + 1) + 8 * i);
          v11 = [v10 keysForValuesToObserveForUndo];
          long long v26 = 0u;
          long long v27 = 0u;
          long long v28 = 0u;
          long long v29 = 0u;
          uint64_t v12 = [v11 countByEnumeratingWithState:&v26 objects:v35 count:16];
          if (v12)
          {
            uint64_t v13 = v12;
            uint64_t v14 = *(void *)v27;
            do
            {
              for (uint64_t j = 0; j != v13; ++j)
              {
                if (*(void *)v27 != v14) {
                  objc_enumerationMutation(v11);
                }
                [v10 removeObserver:self forKeyPath:*(void *)(*((void *)&v26 + 1) + 8 * j)];
              }
              uint64_t v13 = [v11 countByEnumeratingWithState:&v26 objects:v35 count:16];
            }
            while (v13);
          }
        }
        uint64_t v7 = [v5 countByEnumeratingWithState:&v30 objects:v36 count:16];
      }
      while (v7);
    }

    long long v24 = 0u;
    long long v25 = 0u;
    long long v22 = 0u;
    long long v23 = 0u;
    v16 = [(AKUndoController *)self observedPageModelControllers];
    uint64_t v17 = [v16 countByEnumeratingWithState:&v22 objects:v34 count:16];
    if (v17)
    {
      uint64_t v18 = v17;
      uint64_t v19 = *(void *)v23;
      do
      {
        for (uint64_t k = 0; k != v18; ++k)
        {
          if (*(void *)v23 != v19) {
            objc_enumerationMutation(v16);
          }
          [*(id *)(*((void *)&v22 + 1) + 8 * k) removeObserver:self forKeyPath:@"annotations" context:@"AKUndoController.modelAnnotationsObservationContext"];
        }
        uint64_t v18 = [v16 countByEnumeratingWithState:&v22 objects:v34 count:16];
      }
      while (v18);
    }
  }
  [(AKUndoController *)self setObservedAnnotations:0];
  [(AKUndoController *)self setObservedPageModelControllers:0];
  [(AKUndoController *)self setUndoGroupPresentablePropertyName:0];
  [(AKUndoController *)self setUndoGroupOldPropertiesPerAnnotation:0];
  [(AKUndoController *)self setUndoManager:0];
  v21.receiver = self;
  v21.super_class = (Class)AKUndoController;
  [(AKUndoController *)&v21 dealloc];
}

- (void)startObservingPageModelController:(id)a3
{
  id v9 = a3;
  id v4 = [(AKUndoController *)self undoManager];

  if (v4)
  {
    v5 = [(AKUndoController *)self observedPageModelControllers];
    char v6 = [v5 containsObject:v9];

    if ((v6 & 1) == 0)
    {
      uint64_t v7 = [v9 annotations];
      [(AKUndoController *)self _startObservingAnnotations:v7];

      [v9 addObserver:self forKeyPath:@"annotations" options:11 context:@"AKUndoController.modelAnnotationsObservationContext"];
      uint64_t v8 = [(AKUndoController *)self observedPageModelControllers];
      [v8 addObject:v9];
    }
  }
}

- (void)stopObservingPageModelController:(id)a3
{
  id v9 = a3;
  id v4 = [(AKUndoController *)self undoManager];

  if (v4)
  {
    v5 = [(AKUndoController *)self observedPageModelControllers];
    int v6 = [v5 containsObject:v9];

    if (v6)
    {
      [v9 removeObserver:self forKeyPath:@"annotations" context:@"AKUndoController.modelAnnotationsObservationContext"];
      uint64_t v7 = [(AKUndoController *)self observedPageModelControllers];
      [v7 removeObject:v9];

      uint64_t v8 = [v9 annotations];
      [(AKUndoController *)self _stopObservingAnnotations:v8];
    }
  }
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  v59[1] = *MEMORY[0x263EF8340];
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  if (a6 == @"AKUndoController.annotationPropertyObservationContext")
  {
    uint64_t v13 = [(AKUndoController *)self undoManager];
    uint64_t v14 = [(AKUndoController *)self controller];
    if (![v13 isUndoRegistrationEnabled])
    {
LABEL_46:
      v58 = AKAnnotationChangeObjectKey;
      v59[0] = v11;
      v47 = [NSDictionary dictionaryWithObjects:v59 forKeys:&v58 count:1];
      v48 = [MEMORY[0x263F08A00] defaultCenter];
      [v48 postNotificationName:AKAnnotationPropertiesChangedNotification object:v14 userInfo:v47];

LABEL_47:
      goto LABEL_48;
    }
    uint64_t v15 = [v12 objectForKey:*MEMORY[0x263F081B8]];
    v16 = [v12 objectForKey:*MEMORY[0x263F081C8]];
    uint64_t v17 = [MEMORY[0x263EFF9D0] null];
    v54 = v15;
    if (v16 == (void *)v17)
    {
      long long v26 = [MEMORY[0x263EFF9D0] null];
      if (v15 == v26)
      {
        char v27 = [v15 isEqual:v16];

        if (v27)
        {
LABEL_45:

          goto LABEL_46;
        }
      }
      else
      {
      }
    }
    else
    {
      uint64_t v18 = (void *)v17;
      char v19 = [v15 isEqual:v16];

      if (v19) {
        goto LABEL_45;
      }
    }
    long long v28 = [(AKUndoController *)self undoGroupOldPropertiesPerAnnotation];
    if (!v28)
    {
      uint64_t v52 = [MEMORY[0x263F08968] strongToStrongObjectsMapTable];
      -[AKUndoController setUndoGroupOldPropertiesPerAnnotation:](self, "setUndoGroupOldPropertiesPerAnnotation:");
      long long v29 = [v14 modelController];
      long long v30 = [v29 pageModelControllerForAnnotation:v11];

      if (v30) {
        [(AKUndoController *)self _registerUndoForSelectionOnPageModelController:v30];
      }
      long long v31 = [(AKUndoController *)self undoGroupOldPropertiesPerAnnotation];
      [v13 registerUndoWithTarget:self selector:sel__setAnnotationProperties_ object:v31];

      long long v28 = (void *)v52;
    }
    id v32 = [v28 objectForKey:v11];
    if (!v32)
    {
      id v32 = objc_alloc_init(MEMORY[0x263EFF9A0]);
      [v28 setObject:v32 forKey:v11];
    }
    long long v33 = [v32 objectForKey:v10];

    if (!v33) {
      [v32 setObject:v16 forKey:v10];
    }
    if ([v13 isUndoing] & 1) != 0 || (objc_msgSend(v13, "isRedoing"))
    {
LABEL_39:
      if (([v10 isEqualToString:@"modificationDate"] & 1) == 0
        && ([v13 isUndoing] & 1) == 0
        && ([v13 isRedoing] & 1) == 0)
      {
        v44 = [MEMORY[0x263EFF910] date];
        [v11 setModificationDate:v44];

        v45 = [v14 author];

        if (v45)
        {
          v46 = [v14 author];
          [v11 setAuthor:v46];
        }
      }

      goto LABEL_45;
    }
    v53 = v28;
    v34 = [(id)objc_opt_class() displayNameForUndoablePropertyChangeWithKey:v10];
    if ([v34 isEqualToString:&stru_26EA57918])
    {
LABEL_38:

      long long v28 = v53;
      goto LABEL_39;
    }
    v35 = [(AKUndoController *)self undoGroupPresentablePropertyName];
    if (v35)
    {
    }
    else if (![(AKUndoController *)self undoGroupHasChangesToMultipleProperties])
    {
      v41 = NSString;
      v49 = +[AKController akBundle];
      [v49 localizedStringForKey:@"Change of %@" value:&stru_26EA57918 table:@"AnnotationStrings"];
      v42 = v51 = v34;
      v43 = objc_msgSend(v41, "stringWithFormat:", v42, v51);
      [v13 setActionName:v43];

      v34 = v51;
      v40 = v51;
LABEL_37:
      [(AKUndoController *)self setUndoGroupPresentablePropertyName:v40];
      goto LABEL_38;
    }
    if ([(AKUndoController *)self undoGroupHasChangesToMultipleProperties]) {
      goto LABEL_38;
    }
    [(AKUndoController *)self undoGroupPresentablePropertyName];
    v36 = v50 = v34;
    char v37 = [v36 isEqualToString:v50];

    v34 = v50;
    if (v37) {
      goto LABEL_38;
    }
    v38 = +[AKController akBundle];
    v39 = [v38 localizedStringForKey:@"Change of Annotation Properties" value:&stru_26EA57918 table:@"AnnotationStrings"];
    [v13 setActionName:v39];

    v34 = v50;
    [(AKUndoController *)self setUndoGroupHasChangesToMultipleProperties:1];
    v40 = 0;
    goto LABEL_37;
  }
  if (a6 == @"AKUndoController.modelAnnotationsObservationContext")
  {
    uint64_t v13 = [(AKUndoController *)self controller];
    uint64_t v14 = [v12 objectForKey:*MEMORY[0x263F081C8]];
    v20 = [v12 objectForKey:*MEMORY[0x263F081B8]];
    objc_super v21 = [v12 objectForKey:*MEMORY[0x263F081C0]];
    int v22 = [v21 BOOLValue];

    id v23 = v11;
    if (v22)
    {
      [(AKUndoController *)self _registerUndoForSelectionOnPageModelController:v23];
      if (v14) {
        [(AKUndoController *)self _annotationsWillBeRemoved:v14 onPageController:v23];
      }
    }
    if (v20) {
      [(AKUndoController *)self _annotationsWereAdded:v20 onPageController:v23];
    }
    if ((v22 & 1) == 0)
    {
      v56 = AKAnnotationChangeObjectKey;
      id v57 = v23;
      long long v24 = [NSDictionary dictionaryWithObjects:&v57 forKeys:&v56 count:1];
      long long v25 = [MEMORY[0x263F08A00] defaultCenter];
      [v25 postNotificationName:AKAnnotationsAddedOrRemovedNotification object:v13 userInfo:v24];
    }
    goto LABEL_47;
  }
  v55.receiver = self;
  v55.super_class = (Class)AKUndoController;
  [(AKUndoController *)&v55 observeValueForKeyPath:v10 ofObject:v11 change:v12 context:a6];
LABEL_48:
}

- (void)observeUndoManagerDetectedEdit:(id)a3
{
  id v4 = [(AKUndoController *)self controller];
  v3 = [v4 delegate];
  if (objc_opt_respondsToSelector()) {
    [v3 editDetectedForAnnotationController:v4];
  }
}

- (void)observeUndoManagerCheckpoint:(id)a3
{
  id v7 = [(AKUndoController *)self controller];
  id v4 = [v7 delegate];
  v5 = [v7 mainEventHandler];
  if (([v5 mainEventHandlerIsInTrackingLoop] & 1) == 0)
  {
    int v6 = [v5 annotationEventHandler];
    if (v6 || [v5 mainEventHandlerIsInRotationLoop])
    {
    }
    else if (![(AKUndoController *)self externalSourceTrackingChanged])
    {
      [(AKUndoController *)self setUndoGroupPresentablePropertyName:0];
      [(AKUndoController *)self setUndoGroupHasChangesToMultipleProperties:0];
      [(AKUndoController *)self setUndoGroupOldPropertiesPerAnnotation:0];
      if (objc_opt_respondsToSelector()) {
        [v4 editCheckpointReachedForAnnotationController:v7];
      }
    }
  }
}

- (void)_annotationsWereAdded:(id)a3 onPageController:(id)a4
{
  v18[2] = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  if ([v6 count])
  {
    uint64_t v8 = [(AKUndoController *)self undoManager];
    if ([v8 isUndoRegistrationEnabled])
    {
      v17[0] = @"pageModelController";
      v17[1] = @"annotations";
      v18[0] = v7;
      id v9 = (void *)[v6 copy];
      v18[1] = v9;
      id v10 = [NSDictionary dictionaryWithObjects:v18 forKeys:v17 count:2];

      [v8 registerUndoWithTarget:self selector:sel__deleteAnnotationsFromModel_ object:v10];
      if (([v8 isUndoing] & 1) == 0 && (objc_msgSend(v8, "isRedoing") & 1) == 0)
      {
        if ([v6 count] == 1)
        {
          id v11 = [v6 firstObject];
          id v12 = [v11 displayName];

          uint64_t v13 = NSString;
          uint64_t v14 = +[AKController akBundle];
          uint64_t v15 = [v14 localizedStringForKey:@"Add %@" value:&stru_26EA57918 table:@"AnnotationStrings"];
          v16 = objc_msgSend(v13, "stringWithFormat:", v15, v12);
          [v8 setActionName:v16];
        }
        else
        {
          id v12 = +[AKController akBundle];
          uint64_t v14 = [v12 localizedStringForKey:@"Add Annotations" value:&stru_26EA57918 table:@"AnnotationStrings"];
          [v8 setActionName:v14];
        }
      }
    }
    [(AKUndoController *)self _startObservingAnnotations:v6];
  }
}

- (void)_annotationsWillBeRemoved:(id)a3 onPageController:(id)a4
{
  v18[2] = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  if ([v6 count])
  {
    [(AKUndoController *)self _stopObservingAnnotations:v6];
    [(AKUndoController *)self _endEditingOfTextIfAnnotationsDeleted:v6];
    uint64_t v8 = [(AKUndoController *)self undoManager];
    if ([v8 isUndoRegistrationEnabled])
    {
      v17[0] = @"pageModelController";
      v17[1] = @"annotations";
      v18[0] = v7;
      id v9 = (void *)[v6 copy];
      v18[1] = v9;
      id v10 = [NSDictionary dictionaryWithObjects:v18 forKeys:v17 count:2];

      [v8 registerUndoWithTarget:self selector:sel__addAnnotationsFromModel_ object:v10];
      if (([v8 isUndoing] & 1) == 0 && (objc_msgSend(v8, "isRedoing") & 1) == 0)
      {
        if ([v6 count] == 1)
        {
          id v11 = [v6 firstObject];
          id v12 = [v11 displayName];

          uint64_t v13 = NSString;
          uint64_t v14 = +[AKController akBundle];
          uint64_t v15 = [v14 localizedStringForKey:@"Remove %@" value:&stru_26EA57918 table:@"AnnotationStrings"];
          v16 = objc_msgSend(v13, "stringWithFormat:", v15, v12);
          [v8 setActionName:v16];
        }
        else
        {
          id v12 = +[AKController akBundle];
          uint64_t v14 = [v12 localizedStringForKey:@"Remove Annotations" value:&stru_26EA57918 table:@"AnnotationStrings"];
          [v8 setActionName:v14];
        }
      }
    }
  }
}

- (void)_startObservingAnnotations:(id)a3
{
  uint64_t v28 = *MEMORY[0x263EF8340];
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  obuint64_t j = a3;
  uint64_t v4 = [obj countByEnumeratingWithState:&v22 objects:v27 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v23;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v23 != v6) {
          objc_enumerationMutation(obj);
        }
        uint64_t v8 = *(void **)(*((void *)&v22 + 1) + 8 * v7);
        id v9 = [(AKUndoController *)self observedAnnotations];
        char v10 = [v9 containsObject:v8];

        if ((v10 & 1) == 0)
        {
          id v11 = [v8 keysForValuesToObserveForUndo];
          long long v18 = 0u;
          long long v19 = 0u;
          long long v20 = 0u;
          long long v21 = 0u;
          uint64_t v12 = [v11 countByEnumeratingWithState:&v18 objects:v26 count:16];
          if (v12)
          {
            uint64_t v13 = v12;
            uint64_t v14 = *(void *)v19;
            do
            {
              uint64_t v15 = 0;
              do
              {
                if (*(void *)v19 != v14) {
                  objc_enumerationMutation(v11);
                }
                [v8 addObserver:self forKeyPath:*(void *)(*((void *)&v18 + 1) + 8 * v15++) options:3 context:@"AKUndoController.annotationPropertyObservationContext"];
              }
              while (v13 != v15);
              uint64_t v13 = [v11 countByEnumeratingWithState:&v18 objects:v26 count:16];
            }
            while (v13);
          }
          v16 = [(AKUndoController *)self observedAnnotations];
          [v16 addObject:v8];
        }
        ++v7;
      }
      while (v7 != v5);
      uint64_t v5 = [obj countByEnumeratingWithState:&v22 objects:v27 count:16];
    }
    while (v5);
  }
}

- (void)_stopObservingAnnotations:(id)a3
{
  uint64_t v28 = *MEMORY[0x263EF8340];
  id v4 = a3;
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  uint64_t v5 = [v4 countByEnumeratingWithState:&v22 objects:v27 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v23;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v23 != v7) {
          objc_enumerationMutation(v4);
        }
        id v9 = *(void **)(*((void *)&v22 + 1) + 8 * v8);
        char v10 = [(AKUndoController *)self observedAnnotations];
        int v11 = [v10 containsObject:v9];

        if (v11)
        {
          uint64_t v12 = [v9 keysForValuesToObserveForUndo];
          long long v18 = 0u;
          long long v19 = 0u;
          long long v20 = 0u;
          long long v21 = 0u;
          uint64_t v13 = [v12 countByEnumeratingWithState:&v18 objects:v26 count:16];
          if (v13)
          {
            uint64_t v14 = v13;
            uint64_t v15 = *(void *)v19;
            do
            {
              uint64_t v16 = 0;
              do
              {
                if (*(void *)v19 != v15) {
                  objc_enumerationMutation(v12);
                }
                [v9 removeObserver:self forKeyPath:*(void *)(*((void *)&v18 + 1) + 8 * v16++)];
              }
              while (v14 != v16);
              uint64_t v14 = [v12 countByEnumeratingWithState:&v18 objects:v26 count:16];
            }
            while (v14);
          }
          uint64_t v17 = [(AKUndoController *)self observedAnnotations];
          [v17 removeObject:v9];
        }
        ++v8;
      }
      while (v8 != v6);
      uint64_t v6 = [v4 countByEnumeratingWithState:&v22 objects:v27 count:16];
    }
    while (v6);
  }
}

- (void)_setAnnotationProperties:(id)a3
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  id v3 = a3;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v4 = objc_msgSend(v3, "keyEnumerator", 0);
  uint64_t v5 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v12;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v12 != v7) {
          objc_enumerationMutation(v4);
        }
        id v9 = *(void **)(*((void *)&v11 + 1) + 8 * i);
        char v10 = [v3 objectForKey:v9];
        [v9 setValuesForKeysWithDictionary:v10];
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v6);
  }
}

- (void)_addAnnotationsFromModel:(id)a3
{
  id v3 = a3;
  id v11 = [v3 objectForKeyedSubscript:@"pageModelController"];
  id v4 = [v3 objectForKeyedSubscript:@"annotations"];

  uint64_t v5 = [MEMORY[0x263EFF9B0] orderedSetWithArray:v4];
  uint64_t v6 = (void *)MEMORY[0x263EFFA08];
  uint64_t v7 = [v11 annotations];
  uint64_t v8 = [v6 setWithArray:v7];

  [v5 minusSet:v8];
  id v9 = [v11 mutableArrayValueForKey:@"annotations"];
  char v10 = [v5 array];
  [v9 addObjectsFromArray:v10];
}

- (void)_deleteAnnotationsFromModel:(id)a3
{
  id v3 = a3;
  id v6 = [v3 objectForKeyedSubscript:@"pageModelController"];
  id v4 = [v3 objectForKeyedSubscript:@"annotations"];

  uint64_t v5 = [v6 mutableArrayValueForKey:@"annotations"];
  [v5 removeObjectsInArray:v4];
}

- (void)_registerUndoForSelectionOnPageModelController:(id)a3
{
  v9[2] = *MEMORY[0x263EF8340];
  id v4 = a3;
  uint64_t v5 = [(AKUndoController *)self undoManager];
  if ([v5 isUndoRegistrationEnabled])
  {
    id v6 = [v4 selectionStateForUndo];
    v8[0] = @"pageModelController";
    v8[1] = @"selectionState";
    v9[0] = v4;
    v9[1] = v6;
    uint64_t v7 = [NSDictionary dictionaryWithObjects:v9 forKeys:v8 count:2];
    [v5 registerUndoWithTarget:self selector:sel__undoActionForSelectionState_ object:v7];
  }
}

- (void)_undoActionForSelectionState:(id)a3
{
  v11[2] = *MEMORY[0x263EF8340];
  id v4 = a3;
  uint64_t v5 = [(AKUndoController *)self undoManager];
  id v6 = [v4 objectForKey:@"pageModelController"];
  uint64_t v7 = [v4 objectForKey:@"selectionState"];

  if ([v5 isUndoRegistrationEnabled])
  {
    uint64_t v8 = [v6 selectionStateForUndo];
    v10[0] = @"pageModelController";
    v10[1] = @"selectionState";
    v11[0] = v6;
    v11[1] = v8;
    id v9 = [NSDictionary dictionaryWithObjects:v11 forKeys:v10 count:2];
    [v5 registerUndoWithTarget:self selector:sel__undoActionForSelectionState_ object:v9];
  }
  [v6 restoreSelectionStateForUndo:v7];
}

- (void)_endEditingOfTextIfAnnotationsDeleted:(id)a3
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v4 = a3;
  uint64_t v5 = [(AKUndoController *)self controller];
  id v6 = [v5 textEditorController];
  if ([v6 isEditing])
  {
    long long v16 = 0u;
    long long v17 = 0u;
    long long v14 = 0u;
    long long v15 = 0u;
    id v7 = v4;
    uint64_t v8 = [v7 countByEnumeratingWithState:&v14 objects:v18 count:16];
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
          long long v12 = *(void **)(*((void *)&v14 + 1) + 8 * v11);
          long long v13 = objc_msgSend(v6, "annotation", (void)v14);

          if (v12 == v13) {
            [v6 endEditing];
          }
          ++v11;
        }
        while (v9 != v11);
        uint64_t v9 = [v7 countByEnumeratingWithState:&v14 objects:v18 count:16];
      }
      while (v9);
    }
  }
}

- (void)observePageControllerRequestsDisableRegistration:(id)a3
{
  id v3 = [(AKUndoController *)self undoManager];
  [v3 disableUndoRegistration];
}

- (void)observePageControllerRequestsEnableRegistration:(id)a3
{
  id v3 = [(AKUndoController *)self undoManager];
  [v3 enableUndoRegistration];
}

- (NSUndoManager)undoManager
{
  return (NSUndoManager *)objc_getProperty(self, a2, 16, 1);
}

- (void)setUndoManager:(id)a3
{
}

- (BOOL)externalSourceTrackingChanged
{
  return self->_externalSourceTrackingChanged;
}

- (void)setExternalSourceTrackingChanged:(BOOL)a3
{
  self->_externalSourceTrackingChanged = a3;
}

- (AKController)controller
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_controller);

  return (AKController *)WeakRetained;
}

- (void)setController:(id)a3
{
}

- (NSMutableSet)observedPageModelControllers
{
  return (NSMutableSet *)objc_getProperty(self, a2, 32, 1);
}

- (void)setObservedPageModelControllers:(id)a3
{
}

- (NSMutableSet)observedAnnotations
{
  return (NSMutableSet *)objc_getProperty(self, a2, 40, 1);
}

- (void)setObservedAnnotations:(id)a3
{
}

- (NSString)undoGroupPresentablePropertyName
{
  return (NSString *)objc_getProperty(self, a2, 48, 1);
}

- (void)setUndoGroupPresentablePropertyName:(id)a3
{
}

- (BOOL)undoGroupHasChangesToMultipleProperties
{
  return self->_undoGroupHasChangesToMultipleProperties;
}

- (void)setUndoGroupHasChangesToMultipleProperties:(BOOL)a3
{
  self->_undoGroupHasChangesToMultipleProperties = a3;
}

- (NSMapTable)undoGroupOldPropertiesPerAnnotation
{
  return (NSMapTable *)objc_getProperty(self, a2, 56, 1);
}

- (void)setUndoGroupOldPropertiesPerAnnotation:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_undoGroupOldPropertiesPerAnnotation, 0);
  objc_storeStrong((id *)&self->_undoGroupPresentablePropertyName, 0);
  objc_storeStrong((id *)&self->_observedAnnotations, 0);
  objc_storeStrong((id *)&self->_observedPageModelControllers, 0);
  objc_destroyWeak((id *)&self->_controller);

  objc_storeStrong((id *)&self->_undoManager, 0);
}

@end