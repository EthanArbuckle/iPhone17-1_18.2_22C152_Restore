@interface AKSidecarController
+ (BOOL)validateInitialMessage:(id)a3 applicationData:(id)a4;
- (AKController)controller;
- (AKSidecarController)initWithController:(id)a3;
- (AKSidecarControllerDelegate)delegate;
- (BOOL)_removeAnnotationUUID:(id)a3 fromPageModelController:(id)a4;
- (BOOL)_replaceAnnotation:(id)a3 inPageModelController:(id)a4;
- (BOOL)handleLiveStrokeBegan:(id)a3 onInkOverlayView:(id)a4;
- (BOOL)shouldObserveEdits;
- (NSMutableSet)observedAnnotations;
- (NSMutableSet)observedPageModelControllers;
- (id)_annotationWithUUID:(id)a3 inPageModelController:(id)a4;
- (id)_inkAnnotationFromPageModelController:(id)a3;
- (unint64_t)_indexOfAnnotationUUID:(id)a3 annotations:(id)a4;
- (void)_actuallySendAnnotationChange;
- (void)_annotation:(id)a3 addedToPageController:(unint64_t)a4 selected:(BOOL)a5 atIndex:(unint64_t)a6;
- (void)_annotation:(id)a3 modifiedInPageController:(unint64_t)a4 properties:(id)a5;
- (void)_annotation:(id)a3 removedFromPageController:(unint64_t)a4;
- (void)_annotationsWereAdded:(id)a3 onPageController:(id)a4 isUndoingRedoing:(BOOL)a5;
- (void)_annotationsWillBeRemoved:(id)a3 onPageController:(id)a4 isUndoingRedoing:(BOOL)a5;
- (void)_coalesceAnnotationChange:(id)a3 keyChange:(id)a4;
- (void)_handleAnnotationAdd:(id)a3;
- (void)_handleAnnotationModify:(id)a3;
- (void)_handleAnnotationRemove:(id)a3;
- (void)_handleInternalFailure;
- (void)_handleLiveStrokeUpdate;
- (void)_handleRedo:(id)a3;
- (void)_handleSelectionChanged:(id)a3;
- (void)_handleUndo:(id)a3;
- (void)_handleUndoCheckpoint:(id)a3;
- (void)_registerObservers;
- (void)_selectionChangedOnPageController:(id)a3;
- (void)_sendDictionary:(id)a3;
- (void)_startChangeUndoGroup;
- (void)_startObservingAnnotations:(id)a3;
- (void)_stopObservingAnnotations:(id)a3;
- (void)_unregisterObservers;
- (void)dealloc;
- (void)done;
- (void)handleIncomingOPACKObject:(id)a3;
- (void)handleLiveStrokeComplete:(BOOL)a3;
- (void)observePageControllerRequestsDisableRegistration:(id)a3;
- (void)observePageControllerRequestsEnableRegistration:(id)a3;
- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6;
- (void)setController:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setObservedAnnotations:(id)a3;
- (void)setObservedPageModelControllers:(id)a3;
- (void)setShouldObserveEdits:(BOOL)a3;
- (void)startObservingPageModelController:(id)a3;
- (void)stopObservingPageModelController:(id)a3;
@end

@implementation AKSidecarController

+ (BOOL)validateInitialMessage:(id)a3 applicationData:(id)a4
{
  id v5 = a3;
  v6 = (uint64_t (**)(id, void *))a4;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v7 = v5;
    v8 = [v7 objectForKeyedSubscript:&unk_26EA76838];
    uint64_t v9 = [v8 unsignedIntegerValue];

    v10 = [v7 objectForKeyedSubscript:&unk_26EA76850];
    uint64_t v11 = [v10 unsignedIntegerValue];

    v12 = [v7 objectForKeyedSubscript:&unk_26EA76868];
    if (v9)
    {
      if (v11)
      {
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          char v13 = v6[2](v6, v12);
LABEL_14:

          goto LABEL_15;
        }
        v14 = sub_2376C4650();
        if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
          sub_2376DA828();
        }
      }
      else
      {
        v14 = sub_2376C4650();
        if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
          sub_2376DA7B8(v14, v15, v16, v17, v18, v19, v20, v21);
        }
      }
    }
    else
    {
      v14 = sub_2376C4650();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
        sub_2376DA784();
      }
    }

    char v13 = 0;
    goto LABEL_14;
  }
  char v13 = 0;
LABEL_15:

  return v13;
}

- (AKSidecarController)initWithController:(id)a3
{
  id v4 = a3;
  v23.receiver = self;
  v23.super_class = (Class)AKSidecarController;
  id v5 = [(AKSidecarController *)&v23 init];
  v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->_controller, v4);
    uint64_t v7 = [MEMORY[0x263EFF9C0] set];
    observedPageModelControllers = v6->_observedPageModelControllers;
    v6->_observedPageModelControllers = (NSMutableSet *)v7;

    uint64_t v9 = [MEMORY[0x263EFF9C0] set];
    observedAnnotations = v6->_observedAnnotations;
    v6->_observedAnnotations = (NSMutableSet *)v9;

    uint64_t v11 = [MEMORY[0x263EFF9C0] set];
    coalescingAnnotationKeys = v6->_coalescingAnnotationKeys;
    v6->_coalescingAnnotationKeys = (NSMutableSet *)v11;

    v6->_updatingModel = 0;
    char v13 = [MEMORY[0x263F08A00] defaultCenter];
    v14 = [v4 undoController];
    uint64_t v15 = [v14 undoManager];

    objc_initWeak(&location, v6);
    [v13 addObserver:v6 selector:sel__handleUndo_ name:*MEMORY[0x263F08638] object:v15];
    [v13 addObserver:v6 selector:sel__handleRedo_ name:*MEMORY[0x263F08630] object:v15];
    [v13 addObserver:v6 selector:sel__handleUndoCheckpoint_ name:*MEMORY[0x263F08618] object:v15];
    [v13 addObserver:v6 selector:sel_observePageControllerRequestsDisableRegistration_ name:off_268923F70[0] object:0];
    [v13 addObserver:v6 selector:sel_observePageControllerRequestsEnableRegistration_ name:off_268923F78 object:0];
    dispatch_source_t v16 = dispatch_source_create(MEMORY[0x263EF83B8], 0, 0, MEMORY[0x263EF83A0]);
    coalescingAnnotationSource = v6->_coalescingAnnotationSource;
    v6->_coalescingAnnotationSource = (OS_dispatch_source *)v16;

    uint64_t v18 = v6->_coalescingAnnotationSource;
    v20[0] = MEMORY[0x263EF8330];
    v20[1] = 3221225472;
    v20[2] = sub_2376C4920;
    v20[3] = &unk_264CDB1F8;
    objc_copyWeak(&v21, &location);
    dispatch_source_set_event_handler(v18, v20);
    dispatch_activate((dispatch_object_t)v6->_coalescingAnnotationSource);
    objc_destroyWeak(&v21);
    objc_destroyWeak(&location);
  }
  return v6;
}

- (void)dealloc
{
  v3 = [MEMORY[0x263F08A00] defaultCenter];
  [v3 removeObserver:self];

  [(AKSidecarController *)self _unregisterObservers];
  coalescingAnnotationSource = self->_coalescingAnnotationSource;
  if (coalescingAnnotationSource) {
    dispatch_source_cancel(coalescingAnnotationSource);
  }
  v5.receiver = self;
  v5.super_class = (Class)AKSidecarController;
  [(AKSidecarController *)&v5 dealloc];
}

- (void)setShouldObserveEdits:(BOOL)a3
{
  if (self->_shouldObserveEdits != a3)
  {
    self->_shouldObserveEdits = a3;
    if (a3) {
      MEMORY[0x270F9A6D0](self, sel__registerObservers);
    }
    else {
      [(AKSidecarController *)self _unregisterObservers];
    }
  }
}

- (void)_registerObservers
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_controller);
  [WeakRetained addObserver:self forKeyPath:@"currentPageIndex" options:3 context:@"AKSidecarController.currentPageIndex"];
  long long v12 = 0u;
  long long v13 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  id v4 = objc_msgSend(WeakRetained, "modelController", 0);
  objc_super v5 = [v4 pageModelControllers];

  uint64_t v6 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v11;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v11 != v8) {
          objc_enumerationMutation(v5);
        }
        [(AKSidecarController *)self startObservingPageModelController:*(void *)(*((void *)&v10 + 1) + 8 * v9++)];
      }
      while (v7 != v9);
      uint64_t v7 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v7);
  }
}

- (void)_unregisterObservers
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  v3 = [(NSMutableSet *)self->_observedAnnotations allObjects];
  [(AKSidecarController *)self _stopObservingAnnotations:v3];

  long long v12 = 0u;
  long long v13 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  id v4 = (void *)[(NSMutableSet *)self->_observedPageModelControllers copy];
  uint64_t v5 = [v4 countByEnumeratingWithState:&v10 objects:v14 count:16];
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
          objc_enumerationMutation(v4);
        }
        [(AKSidecarController *)self stopObservingPageModelController:*(void *)(*((void *)&v10 + 1) + 8 * v8++)];
      }
      while (v6 != v8);
      uint64_t v6 = [v4 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v6);
  }

  id WeakRetained = objc_loadWeakRetained((id *)&self->_controller);
  [WeakRetained removeObserver:self forKeyPath:@"currentPageIndex" context:@"AKSidecarController.currentPageIndex"];

  [(NSMutableSet *)self->_observedPageModelControllers removeAllObjects];
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);

  [(AKSidecarController *)self setShouldObserveEdits:a3 != 0];
}

- (void)done
{
  v3 = sub_2376C4650();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)uint64_t v5 = 0;
    _os_log_impl(&dword_23760E000, v3, OS_LOG_TYPE_DEFAULT, "Client finished session", v5, 2u);
  }

  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  [WeakRetained sidecarControllerCancelled:self];
}

- (void)_handleInternalFailure
{
  v3 = sub_2376C4650();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
    sub_2376DA85C();
  }

  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  [WeakRetained sidecarControllerCancelled:self];
}

- (void)startObservingPageModelController:(id)a3
{
  if (self->_shouldObserveEdits)
  {
    id v5 = a3;
    id v4 = [v5 annotations];
    [(AKSidecarController *)self _startObservingAnnotations:v4];

    [v5 addObserver:self forKeyPath:@"annotations" options:11 context:@"AKSidecarController.modelAnnotationsObservationContext"];
    [v5 addObserver:self forKeyPath:@"selectedAnnotations" options:1 context:@"AKSidecarController.selectedAnnotationsObservationContext"];
    [(NSMutableSet *)self->_observedPageModelControllers addObject:v5];
  }
}

- (void)stopObservingPageModelController:(id)a3
{
  id v5 = a3;
  if (-[NSMutableSet containsObject:](self->_observedPageModelControllers, "containsObject:"))
  {
    [v5 removeObserver:self forKeyPath:@"annotations" context:@"AKSidecarController.modelAnnotationsObservationContext"];
    [v5 removeObserver:self forKeyPath:@"selectedAnnotations" context:@"AKSidecarController.selectedAnnotationsObservationContext"];
    [(NSMutableSet *)self->_observedPageModelControllers removeObject:v5];
    id v4 = [v5 annotations];
    [(AKSidecarController *)self _stopObservingAnnotations:v4];
  }
}

- (unint64_t)_indexOfAnnotationUUID:(id)a3 annotations:(id)a4
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  id v5 = a3;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  id v6 = a4;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = 0;
    uint64_t v10 = *(void *)v18;
    while (2)
    {
      uint64_t v11 = 0;
      uint64_t v12 = v9 + v8;
      do
      {
        if (*(void *)v18 != v10) {
          objc_enumerationMutation(v6);
        }
        long long v13 = objc_msgSend(*(id *)(*((void *)&v17 + 1) + 8 * v11), "UUID", (void)v17);
        char v14 = [v13 isEqualToString:v5];

        if (v14)
        {
          unint64_t v15 = v9 + v11;
          goto LABEL_11;
        }
        ++v11;
      }
      while (v8 != v11);
      uint64_t v8 = [v6 countByEnumeratingWithState:&v17 objects:v21 count:16];
      uint64_t v9 = v12;
      if (v8) {
        continue;
      }
      break;
    }
  }
  unint64_t v15 = 0x7FFFFFFFFFFFFFFFLL;
LABEL_11:

  return v15;
}

- (id)_annotationWithUUID:(id)a3 inPageModelController:(id)a4
{
  id v6 = a3;
  uint64_t v7 = [a4 annotations];
  unint64_t v8 = [(AKSidecarController *)self _indexOfAnnotationUUID:v6 annotations:v7];

  if (v8 == 0x7FFFFFFFFFFFFFFFLL)
  {
    uint64_t v9 = 0;
  }
  else
  {
    uint64_t v9 = [v7 objectAtIndex:v8];
  }

  return v9;
}

- (BOOL)_replaceAnnotation:(id)a3 inPageModelController:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  unint64_t v8 = [v6 UUID];
  uint64_t v9 = [v7 annotations];
  unint64_t v10 = [(AKSidecarController *)self _indexOfAnnotationUUID:v8 annotations:v9];

  if (v10 == 0x7FFFFFFFFFFFFFFFLL)
  {
    uint64_t v11 = [v7 annotations];
    objc_msgSend(v7, "insertObject:inAnnotationsAtIndex:", v6, objc_msgSend(v11, "count"));
  }
  else
  {
    [v7 replaceObjectInAnnotationsAtIndex:v10 withObject:v6];
  }

  return 1;
}

- (id)_inkAnnotationFromPageModelController:(id)a3
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  id v3 = a3;
  objc_opt_class();
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v4 = objc_msgSend(v3, "annotations", 0);
  id v5 = [v4 reverseObjectEnumerator];

  uint64_t v6 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v14;
    while (2)
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v14 != v8) {
          objc_enumerationMutation(v5);
        }
        unint64_t v10 = *(void **)(*((void *)&v13 + 1) + 8 * i);
        if (objc_opt_isKindOfClass())
        {
          uint64_t v11 = [v10 UUID];
          goto LABEL_11;
        }
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
      if (v7) {
        continue;
      }
      break;
    }
  }
  uint64_t v11 = 0;
LABEL_11:

  return v11;
}

- (BOOL)_removeAnnotationUUID:(id)a3 fromPageModelController:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  uint64_t v8 = [v6 annotations];
  unint64_t v9 = [(AKSidecarController *)self _indexOfAnnotationUUID:v7 annotations:v8];

  if (v9 != 0x7FFFFFFFFFFFFFFFLL) {
    [v6 removeObjectFromAnnotationsAtIndex:v9];
  }

  return v9 != 0x7FFFFFFFFFFFFFFFLL;
}

- (void)handleIncomingOPACKObject:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_controller);
    id v6 = v4;
    id v7 = [v6 objectForKeyedSubscript:&unk_26EA76880];
    uint64_t v8 = [v7 unsignedIntegerValue];

    unint64_t v9 = sub_2376C4650();
    unint64_t v10 = v9;
    if (v8)
    {
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG)) {
        sub_2376DA968();
      }

      self->_updatingModel = 1;
      if (!(!v12 & v11))
      {
        switch(v8)
        {
          case 1:
            goto LABEL_15;
          case 2:
            self->_handlingUndoRedo = 1;
            long long v13 = [WeakRetained undoController];
            long long v14 = [v13 undoManager];
            [v14 undo];
            goto LABEL_23;
          case 3:
            self->_handlingUndoRedo = 1;
            long long v13 = [WeakRetained undoController];
            long long v14 = [v13 undoManager];
            [v14 redo];
LABEL_23:

            self->_handlingUndoRedo = 0;
            break;
          case 4:
            long long v15 = [WeakRetained undoController];
            long long v16 = [v15 undoManager];
            self->_sendingCheckpoint = 1;
            [v15 setExternalSourceTrackingChanged:0];
            long long v17 = [MEMORY[0x263F08A00] defaultCenter];
            [v17 postNotificationName:*MEMORY[0x263F08618] object:v16];

            self->_sendingCheckpoint = 0;
            break;
          default:
            JUMPOUT(0);
        }
LABEL_25:
        self->_updatingModel = 0;
        goto LABEL_26;
      }
      if ((unint64_t)(v8 - 1000) >= 4)
      {
        switch(v8)
        {
          case 2000:
            [(AKSidecarController *)self _handleAnnotationAdd:v6];
            break;
          case 2001:
            [(AKSidecarController *)self _handleAnnotationRemove:v6];
            break;
          case 2002:
            [(AKSidecarController *)self _handleAnnotationModify:v6];
            break;
          case 2003:
            [(AKSidecarController *)self _handleSelectionChanged:v6];
            break;
          default:
            goto LABEL_25;
        }
        goto LABEL_25;
      }
LABEL_15:
      unint64_t v10 = sub_2376C4650();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
        sub_2376DA900();
      }
    }
    else if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      sub_2376DA890();
    }

    [(AKSidecarController *)self _handleInternalFailure];
LABEL_26:

    goto LABEL_27;
  }
  id WeakRetained = sub_2376C4650();
  if (os_log_type_enabled(WeakRetained, OS_LOG_TYPE_ERROR)) {
    sub_2376DA9D0();
  }
LABEL_27:
}

- (void)_handleAnnotationAdd:(id)a3
{
  id v4 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_controller);
  id v6 = [WeakRetained modelController];
  id v7 = [v6 pageModelControllers];

  uint64_t v8 = [v4 objectForKeyedSubscript:&unk_26EA76898];
  unint64_t v9 = [v4 objectForKeyedSubscript:&unk_26EA768B0];
  unint64_t v10 = [v4 objectForKeyedSubscript:&unk_26EA768C8];
  char v11 = [v4 objectForKeyedSubscript:&unk_26EA768E0];
  objc_opt_class();
  objc_opt_class();
  if (objc_opt_isKindOfClass() & 1) != 0 && (objc_opt_isKindOfClass() & 1) != 0 && (objc_opt_isKindOfClass())
  {
    uint64_t v12 = +[AKAnnotation annotationWithData:v8];
    unint64_t v13 = [v9 unsignedIntegerValue];
    uint64_t v14 = [v10 unsignedIntegerValue];
    v35 = (void *)v12;
    if (v12)
    {
      uint64_t v32 = v14;
      if (v13 < [v7 count])
      {
        long long v15 = [WeakRetained modelController];
        v34 = [v15 pageModelControllerForPage:v13];

        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          long long v16 = sub_2376C4650();
          if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG)) {
            sub_2376DAA38();
          }

          long long v17 = [v34 inkCanvasAnnotation];

          if (v17)
          {
            uint64_t v18 = [WeakRetained undoController];
            long long v19 = [v18 undoManager];
            v42[0] = MEMORY[0x263EF8330];
            v42[1] = 3221225472;
            v42[2] = sub_2376C5C30;
            v42[3] = &unk_264CDB110;
            id v43 = v34;
            id v44 = v35;
            sub_2376C5B78(v19, v42);

            [(AKSidecarController *)self _startChangeUndoGroup];
            long long v20 = v43;
          }
          else
          {
            v28 = [WeakRetained pageControllers];
            long long v20 = [v28 objectAtIndex:v13];

            v33 = [v35 drawing];
            v31 = [v20 inkPageOverlayController];
            v29 = [v31 inkOverlayView];
            v30 = [v29 canvasView];
            [v30 setDrawing:v33];
          }
        }
        else
        {
          objc_super v23 = [v34 annotations];
          uint64_t v24 = [v23 count];

          v25 = sub_2376C4650();
          if (os_log_type_enabled(v25, OS_LOG_TYPE_DEBUG)) {
            sub_2376DAA78(v35, v25);
          }

          v26 = [WeakRetained undoController];
          v27 = [v26 undoManager];
          v36[0] = MEMORY[0x263EF8330];
          v36[1] = 3221225472;
          v36[2] = sub_2376C5CF0;
          v36[3] = &unk_264CDBC28;
          id v37 = v34;
          id v38 = v35;
          uint64_t v40 = v32;
          uint64_t v41 = v24;
          id v39 = v11;
          sub_2376C5B78(v27, v36);

          long long v20 = v37;
        }

        goto LABEL_25;
      }
      uint64_t v22 = sub_2376C4650();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR)) {
        sub_2376DAB28();
      }
    }
    else
    {
      uint64_t v22 = sub_2376C4650();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR)) {
        sub_2376DAA04();
      }
    }

    [(AKSidecarController *)self _handleInternalFailure];
LABEL_25:

    goto LABEL_14;
  }
  id v21 = sub_2376C4650();
  if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR)) {
    sub_2376DAB90();
  }

  [(AKSidecarController *)self _handleInternalFailure];
LABEL_14:
}

- (void)_handleAnnotationRemove:(id)a3
{
  id v4 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_controller);
  id v6 = [v4 objectForKeyedSubscript:&unk_26EA768F8];
  id v7 = [v4 objectForKeyedSubscript:&unk_26EA768B0];
  uint64_t v8 = [v4 objectForKeyedSubscript:&unk_26EA76910];
  objc_opt_class();
  if (objc_opt_isKindOfClass() & 1) != 0 && (objc_opt_class(), (objc_opt_isKindOfClass()))
  {
    uint64_t v9 = [v7 unsignedIntegerValue];
    unint64_t v10 = [WeakRetained modelController];
    char v11 = [v10 pageModelControllerForPage:v9];

    if ([v8 BOOLValue])
    {
      uint64_t v12 = [(AKSidecarController *)self _inkAnnotationFromPageModelController:v11];

      id v6 = (id)v12;
    }
    unint64_t v13 = sub_2376C4650();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG)) {
      sub_2376DAC00();
    }

    uint64_t v14 = [WeakRetained undoController];
    long long v15 = [v14 undoManager];
    v18[0] = MEMORY[0x263EF8330];
    v18[1] = 3221225472;
    v18[2] = sub_2376C5FC4;
    v18[3] = &unk_264CDB4D0;
    v18[4] = self;
    id v6 = v6;
    id v19 = v6;
    id v20 = v11;
    id v16 = v11;
    sub_2376C5B78(v15, v18);
  }
  else
  {
    long long v17 = sub_2376C4650();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
      sub_2376DAC68();
    }

    [(AKSidecarController *)self _handleInternalFailure];
  }
}

- (void)_handleAnnotationModify:(id)a3
{
  v66[9] = *MEMORY[0x263EF8340];
  id v4 = a3;
  v53 = self;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_controller);
  id v6 = [WeakRetained modelController];
  id v7 = [v6 pageModelControllers];

  v66[0] = objc_opt_class();
  v66[1] = objc_opt_class();
  v66[2] = objc_opt_class();
  v66[3] = objc_opt_class();
  v66[4] = objc_opt_class();
  v66[5] = objc_opt_class();
  v66[6] = objc_opt_class();
  v66[7] = objc_opt_class();
  v66[8] = objc_opt_class();
  uint64_t v8 = [MEMORY[0x263EFF8C0] arrayWithObjects:v66 count:9];
  uint64_t v9 = [v4 objectForKeyedSubscript:&unk_26EA768F8];
  unint64_t v10 = [v4 objectForKeyedSubscript:&unk_26EA768B0];
  char v11 = v4;
  uint64_t v12 = [v4 objectForKeyedSubscript:&unk_26EA76928];
  v54 = WeakRetained;
  unint64_t v13 = [WeakRetained undoController];
  uint64_t v14 = [v13 undoManager];

  long long v15 = v10;
  unint64_t v16 = [v10 unsignedIntegerValue];
  v52 = v7;
  if (v16 >= [v7 count])
  {
    v30 = sub_2376C4650();
    if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR)) {
      sub_2376DAB28();
    }

    [(AKSidecarController *)v53 _handleInternalFailure];
    id v20 = (void *)v12;
    long long v17 = v54;
    goto LABEL_19;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    v31 = sub_2376C4650();
    id v20 = (void *)v12;
    long long v17 = v54;
    if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR)) {
      sub_2376DAF58();
    }

    [(AKSidecarController *)v53 _handleInternalFailure];
LABEL_19:
    id v21 = (void *)v14;
    goto LABEL_20;
  }
  long long v17 = v54;
  uint64_t v18 = [v54 modelController];
  id v19 = [v18 pageModelControllerForPage:v16];

  id v20 = (void *)v12;
  if (v12)
  {
    objc_opt_class();
    id v21 = (void *)v14;
    if (objc_opt_isKindOfClass())
    {
      uint64_t v22 = [v11 objectForKeyedSubscript:&unk_26EA76910];
      objc_super v23 = +[AKSecureSerializationHelper secureCodingCompliantObjectForData:v20 ofClasses:v8 withOptionalKey:0];
      objc_opt_class();
      v47 = v22;
      if (objc_opt_isKindOfClass())
      {
        if ([v22 BOOLValue])
        {
          uint64_t v24 = [(AKSidecarController *)v53 _inkAnnotationFromPageModelController:v19];

          uint64_t v9 = (void *)v24;
        }
        v50 = v19;
        v25 = [(AKSidecarController *)v53 _annotationWithUUID:v9 inPageModelController:v19];
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          v26 = v25;
          id v27 = v25;
          v28 = sub_2376C4650();
          if (os_log_type_enabled(v28, OS_LOG_TYPE_DEBUG)) {
            sub_2376DADE4();
          }

          v59[0] = MEMORY[0x263EF8330];
          v59[1] = 3221225472;
          v59[2] = sub_2376C6850;
          v59[3] = &unk_264CDB110;
          id v60 = v27;
          id v61 = v23;
          id v29 = v27;
          sub_2376C5B78(v21, v59);
        }
        else
        {
          v26 = v25;
          id v43 = sub_2376C4650();
          if (os_log_type_enabled(v43, OS_LOG_TYPE_DEBUG)) {
            sub_2376DAE4C();
          }

          v55[0] = MEMORY[0x263EF8330];
          v55[1] = 3221225472;
          v55[2] = sub_2376C685C;
          v55[3] = &unk_264CDB4D0;
          id v56 = v54;
          id v57 = v26;
          id v58 = v23;
          sub_2376C5B78(v21, v55);
          [(AKSidecarController *)v53 _startChangeUndoGroup];

          id v29 = v56;
        }

        long long v17 = v54;
        id v19 = v50;
      }
      else
      {
        v42 = sub_2376C4650();
        if (os_log_type_enabled(v42, OS_LOG_TYPE_ERROR)) {
          sub_2376DAEB4();
        }

        [(AKSidecarController *)v53 _handleInternalFailure];
      }
    }
    else
    {
      id v39 = sub_2376C4650();
      if (os_log_type_enabled(v39, OS_LOG_TYPE_ERROR)) {
        sub_2376DAEE8();
      }

      [(AKSidecarController *)v53 _handleInternalFailure];
    }
  }
  else
  {
    v51 = v19;
    uint64_t v32 = [v11 objectForKeyedSubscript:&unk_26EA76940];
    uint64_t v33 = [v11 objectForKeyedSubscript:&unk_26EA76898];
    objc_opt_class();
    id v21 = (void *)v14;
    v49 = (void *)v32;
    if (objc_opt_isKindOfClass() & 1) != 0 && (objc_opt_class(), (objc_opt_isKindOfClass()))
    {
      v34 = +[AKAnnotation annotationWithData:v33];
      v46 = v34;
      v48 = (void *)v33;
      if (v34)
      {
        v45 = [v34 dictionaryWithValuesForKeys:v32];
        v35 = [(AKSidecarController *)v53 _annotationWithUUID:v9 inPageModelController:v51];
        v36 = sub_2376C4650();
        if (os_log_type_enabled(v36, OS_LOG_TYPE_DEBUG)) {
          sub_2376DAD0C();
        }

        v62[0] = MEMORY[0x263EF8330];
        v62[1] = 3221225472;
        v62[2] = sub_2376C67CC;
        v62[3] = &unk_264CDB4D0;
        id v63 = v54;
        id v64 = v35;
        id v65 = v45;
        id v37 = v45;
        id v38 = v35;
        sub_2376C5B78(v21, v62);
        [(AKSidecarController *)v53 _startChangeUndoGroup];
      }
      else
      {
        id v44 = sub_2376C4650();
        if (os_log_type_enabled(v44, OS_LOG_TYPE_ERROR)) {
          sub_2376DACD8();
        }

        [(AKSidecarController *)v53 _handleInternalFailure];
      }

      uint64_t v40 = v48;
    }
    else
    {
      uint64_t v40 = (void *)v33;
      uint64_t v41 = sub_2376C4650();
      if (os_log_type_enabled(v41, OS_LOG_TYPE_ERROR)) {
        sub_2376DAD74();
      }

      [(AKSidecarController *)v53 _handleInternalFailure];
    }

    id v19 = v51;
  }

LABEL_20:
}

- (void)_handleSelectionChanged:(id)a3
{
  uint64_t v38 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_controller);
  id v6 = [WeakRetained modelController];
  id v7 = [v6 pageModelControllers];

  uint64_t v8 = [v4 objectForKeyedSubscript:&unk_26EA768B0];
  uint64_t v9 = [v4 objectForKeyedSubscript:&unk_26EA76958];
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    v25 = sub_2376C4650();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR)) {
      sub_2376DB030();
    }

    goto LABEL_23;
  }
  unint64_t v10 = [v8 unsignedIntegerValue];
  if (v10 >= [v7 count])
  {
    v26 = sub_2376C4650();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR)) {
      sub_2376DAB28();
    }

LABEL_23:
    [(AKSidecarController *)self _handleInternalFailure];
    goto LABEL_24;
  }
  char v11 = [WeakRetained modelController];
  uint64_t v12 = [v11 pageModelControllerForPage:v10];

  if (v12)
  {
    unint64_t v13 = [v12 valueForKeyPath:@"selectedAnnotations.UUID"];
    uint64_t v14 = [MEMORY[0x263EFFA08] setWithArray:v9];
    if (([v13 isEqualToSet:v14] & 1) == 0)
    {
      id v27 = v13;
      id v29 = v9;
      v30 = v8;
      v31 = v7;
      id v32 = WeakRetained;
      long long v15 = [MEMORY[0x263F089C8] indexSet];
      unint64_t v16 = sub_2376C4650();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG)) {
        sub_2376DAFC8();
      }

      long long v35 = 0u;
      long long v36 = 0u;
      long long v33 = 0u;
      long long v34 = 0u;
      v28 = v12;
      long long v17 = [v12 annotations];
      uint64_t v18 = [v17 countByEnumeratingWithState:&v33 objects:v37 count:16];
      if (v18)
      {
        uint64_t v19 = v18;
        uint64_t v20 = 0;
        uint64_t v21 = *(void *)v34;
        do
        {
          uint64_t v22 = 0;
          do
          {
            if (*(void *)v34 != v21) {
              objc_enumerationMutation(v17);
            }
            objc_super v23 = [*(id *)(*((void *)&v33 + 1) + 8 * v22) UUID];
            int v24 = [v14 containsObject:v23];

            if (v24) {
              [v15 addIndex:v20 + v22];
            }
            ++v22;
          }
          while (v19 != v22);
          uint64_t v19 = [v17 countByEnumeratingWithState:&v33 objects:v37 count:16];
          v20 += v22;
        }
        while (v19);
      }

      uint64_t v12 = v28;
      [v28 selectAnnotationsAtIndexes:v15 byExtendingSelection:0];

      id v7 = v31;
      id WeakRetained = v32;
      uint64_t v9 = v29;
      uint64_t v8 = v30;
      unint64_t v13 = v27;
    }
  }
LABEL_24:
}

- (BOOL)handleLiveStrokeBegan:(id)a3 onInkOverlayView:(id)a4
{
  v27[4] = *MEMORY[0x263EF8340];
  id v7 = a3;
  id v8 = a4;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  if (WeakRetained)
  {
    unint64_t v10 = [v8 pageController];
    char v11 = [v10 inkPageOverlayController];
    uint64_t v12 = [v11 inkOverlayView];
    unint64_t v13 = [v12 canvasView];
    [v11 scaleFromDrawingInCanvasView:v13 toPageControllerModelSpace:v10];
    double v15 = v14;

    objc_storeStrong((id *)&self->_currentStroke, a3);
    unint64_t v16 = [v7 dataRepresentation];
    id v24 = v7;
    v26[0] = &unk_26EA76880;
    v26[1] = &unk_26EA76970;
    v27[0] = &unk_26EA768B0;
    v27[1] = v16;
    v26[2] = &unk_26EA76988;
    long long v17 = [NSNumber numberWithDouble:v15];
    v27[2] = v17;
    v26[3] = &unk_26EA768B0;
    uint64_t v18 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v10, "pageIndex"));
    v27[3] = v18;
    uint64_t v19 = [NSDictionary dictionaryWithObjects:v27 forKeys:v26 count:4];
    [(AKSidecarController *)self _sendDictionary:v19];

    objc_storeStrong((id *)&self->_currentStrokeOverlay, a4);
    uint64_t v20 = dispatch_source_create(MEMORY[0x263EF8400], 0, 0, MEMORY[0x263EF83A0]);
    dispatch_source_set_timer(v20, 0, 0xFE502AuLL, 0xFE502AuLL);
    handler[0] = MEMORY[0x263EF8330];
    handler[1] = 3221225472;
    handler[2] = sub_2376C6ECC;
    handler[3] = &unk_264CDAE40;
    handler[4] = self;
    dispatch_source_set_event_handler(v20, handler);
    dispatch_resume(v20);
    strokeTimer = self->_strokeTimer;
    self->_strokeTimer = (OS_dispatch_source *)v20;
    uint64_t v22 = v20;

    id v7 = v24;
  }

  return WeakRetained != 0;
}

- (void)_handleLiveStrokeUpdate
{
  v15[2] = *MEMORY[0x263EF8340];
  id v3 = [(AKInkOverlayView *)self->_currentStrokeOverlay canvasView];
  id v4 = [v3 _currentStroke];

  if (v4)
  {
    id v5 = [(PKStroke *)self->_currentStroke deltaTo:v4];
    id v6 = v5;
    if (v5)
    {
      v15[0] = &unk_26EA76958;
      v14[0] = &unk_26EA76880;
      v14[1] = &unk_26EA769A0;
      id v7 = [v5 dataRepresentation];
      v15[1] = v7;
      id v8 = NSDictionary;
      uint64_t v9 = v15;
      unint64_t v10 = v14;
    }
    else
    {
      v13[0] = &unk_26EA76958;
      v12[0] = &unk_26EA76880;
      v12[1] = &unk_26EA76970;
      id v7 = [v4 dataRepresentation];
      v13[1] = v7;
      id v8 = NSDictionary;
      uint64_t v9 = v13;
      unint64_t v10 = v12;
    }
    char v11 = [v8 dictionaryWithObjects:v9 forKeys:v10 count:2];
    [(AKSidecarController *)self _sendDictionary:v11];
  }
}

- (void)handleLiveStrokeComplete:(BOOL)a3
{
  v11[1] = *MEMORY[0x263EF8340];
  if (a3) {
    uint64_t v4 = 1002;
  }
  else {
    uint64_t v4 = 1003;
  }
  unint64_t v10 = &unk_26EA76880;
  id v5 = [NSNumber numberWithUnsignedInteger:v4];
  v11[0] = v5;
  id v6 = [NSDictionary dictionaryWithObjects:v11 forKeys:&v10 count:1];
  [(AKSidecarController *)self _sendDictionary:v6];

  strokeTimer = self->_strokeTimer;
  if (strokeTimer)
  {
    dispatch_source_cancel(strokeTimer);
    id v8 = self->_strokeTimer;
  }
  else
  {
    id v8 = 0;
  }
  self->_strokeTimer = 0;

  currentStrokeOverlay = self->_currentStrokeOverlay;
  self->_currentStrokeOverlay = 0;
}

- (void)_actuallySendAnnotationChange
{
  if (self->_coalescingAnnotationChange)
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_controller);
    id v8 = [WeakRetained modelController];

    uint64_t v4 = [v8 pageModelControllerForAnnotation:self->_coalescingAnnotationChange];
    id v5 = [v8 pageModelControllers];
    uint64_t v6 = [v5 indexOfObject:v4];

    [(AKSidecarController *)self _annotation:self->_coalescingAnnotationChange modifiedInPageController:v6 properties:self->_coalescingAnnotationKeys];
    [(NSMutableSet *)self->_coalescingAnnotationKeys removeAllObjects];
    coalescingAnnotationChange = self->_coalescingAnnotationChange;
    self->_coalescingAnnotationChange = 0;
  }
}

- (void)_coalesceAnnotationChange:(id)a3 keyChange:(id)a4
{
  id v8 = (AKAnnotation *)a3;
  id v7 = a4;
  if (self->_coalescingAnnotationChange != v8) {
    [(AKSidecarController *)self _actuallySendAnnotationChange];
  }
  if (v8)
  {
    objc_storeStrong((id *)&self->_coalescingAnnotationChange, a3);
    [(NSMutableSet *)self->_coalescingAnnotationKeys addObject:v7];
    dispatch_source_merge_data((dispatch_source_t)self->_coalescingAnnotationSource, 1uLL);
  }
}

- (void)_handleUndo:(id)a3
{
  v6[1] = *MEMORY[0x263EF8340];
  if (!self->_handlingUndoRedo)
  {
    id v5 = &unk_26EA76880;
    v6[0] = &unk_26EA76880;
    uint64_t v4 = [NSDictionary dictionaryWithObjects:v6 forKeys:&v5 count:1];
    [(AKSidecarController *)self _sendDictionary:v4];
  }
}

- (void)_handleRedo:(id)a3
{
  v6[1] = *MEMORY[0x263EF8340];
  if (!self->_handlingUndoRedo)
  {
    id v5 = &unk_26EA76880;
    v6[0] = &unk_26EA76868;
    uint64_t v4 = [NSDictionary dictionaryWithObjects:v6 forKeys:&v5 count:1];
    [(AKSidecarController *)self _sendDictionary:v4];
  }
}

- (void)_handleUndoCheckpoint:(id)a3
{
  v10[1] = *MEMORY[0x263EF8340];
  id v4 = a3;
  if (!*(_WORD *)&self->_handlingUndoRedo && self->_needCheckpointSent)
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_controller);
    uint64_t v6 = [WeakRetained mainEventHandler];
    if (([v6 mainEventHandlerIsInTrackingLoop] & 1) == 0)
    {
      id v7 = [v6 annotationEventHandler];
      if (v7)
      {
      }
      else if (([v6 mainEventHandlerIsInRotationLoop] & 1) == 0)
      {
        self->_needCheckpointSent = 0;
        uint64_t v9 = &unk_26EA76880;
        v10[0] = &unk_26EA769B8;
        id v8 = [NSDictionary dictionaryWithObjects:v10 forKeys:&v9 count:1];
        [(AKSidecarController *)self _sendDictionary:v8];
      }
    }
  }
}

- (void)_startChangeUndoGroup
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_controller);
  id v3 = [WeakRetained undoController];

  if (([v3 externalSourceTrackingChanged] & 1) == 0)
  {
    [v3 setExternalSourceTrackingChanged:1];
    [MEMORY[0x263F08C50] _endTopLevelGroupings];
  }
}

- (void)observePageControllerRequestsDisableRegistration:(id)a3
{
  self->_ignoreKVOChanges = 1;
}

- (void)observePageControllerRequestsEnableRegistration:(id)a3
{
  self->_ignoreKVOChanges = 0;
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  unint64_t v13 = v12;
  if (!self->_ignoreKVOChanges)
  {
    double v14 = [v12 objectForKey:*MEMORY[0x263F081C0]];
    int v15 = [v14 BOOLValue];

    id WeakRetained = objc_loadWeakRetained((id *)&self->_controller);
    long long v17 = [WeakRetained undoController];
    uint64_t v18 = [v17 undoManager];

    if ([v18 isUndoing]) {
      uint64_t v19 = 1;
    }
    else {
      uint64_t v19 = [v18 isRedoing];
    }
    if (a6 == @"AKSidecarController.annotationPropertyObservationContext")
    {
      if (self->_updatingModel) {
        char v20 = 1;
      }
      else {
        char v20 = v19;
      }
      if ((v20 & 1) == 0)
      {
        uint64_t v21 = [v13 objectForKey:*MEMORY[0x263F081C8]];
        uint64_t v22 = [v13 objectForKey:*MEMORY[0x263F081B8]];
        id v23 = v11;
        if (![v21 isEqual:v22]
          || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
        {
          [(AKSidecarController *)self _coalesceAnnotationChange:v23 keyChange:v10];
        }
      }
    }
    else if (a6 == @"AKSidecarController.modelAnnotationsObservationContext")
    {
      id v24 = [v13 objectForKey:*MEMORY[0x263F081C8]];
      v25 = [v13 objectForKey:*MEMORY[0x263F081B8]];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        id v26 = v11;
        id v27 = v24;
        v28 = v26;
        v31 = v27;
        if (v27) {
          int v29 = v15;
        }
        else {
          int v29 = 0;
        }
        if (v29 == 1) {
          [(AKSidecarController *)self _annotationsWillBeRemoved:v31 onPageController:v26 isUndoingRedoing:v19];
        }
        if (v25) {
          [(AKSidecarController *)self _annotationsWereAdded:v25 onPageController:v28 isUndoingRedoing:v19];
        }

        id v24 = v31;
      }
      else
      {
        v30 = sub_2376C4650();
        if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR)) {
          sub_2376DB0A0((uint64_t)v11, v30);
        }
      }
    }
    else if (a6 == @"AKSidecarController.selectedAnnotationsObservationContext" && !self->_updatingModel)
    {
      [(AKSidecarController *)self _selectionChangedOnPageController:v11];
    }
  }
}

- (void)_annotationsWereAdded:(id)a3 onPageController:(id)a4 isUndoingRedoing:(BOOL)a5
{
  uint64_t v28 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  if ([v8 count])
  {
    [(AKSidecarController *)self _startObservingAnnotations:v8];
    if (!self->_updatingModel && !a5)
    {
      id WeakRetained = objc_loadWeakRetained((id *)&self->_controller);
      id v11 = [WeakRetained modelController];
      id v12 = [v11 pageModelControllers];
      uint64_t v13 = [v12 indexOfObject:v9];

      double v14 = [v9 annotations];
      id v21 = v9;
      int v15 = [v9 selectedAnnotations];
      long long v23 = 0u;
      long long v24 = 0u;
      long long v25 = 0u;
      long long v26 = 0u;
      id v22 = v8;
      id v16 = v8;
      uint64_t v17 = [v16 countByEnumeratingWithState:&v23 objects:v27 count:16];
      if (v17)
      {
        uint64_t v18 = v17;
        uint64_t v19 = *(void *)v24;
        do
        {
          uint64_t v20 = 0;
          do
          {
            if (*(void *)v24 != v19) {
              objc_enumerationMutation(v16);
            }
            -[AKSidecarController _annotation:addedToPageController:selected:atIndex:](self, "_annotation:addedToPageController:selected:atIndex:", *(void *)(*((void *)&v23 + 1) + 8 * v20), v13, [v15 containsObject:*(void *)(*((void *)&v23 + 1) + 8 * v20)], objc_msgSend(v14, "indexOfObject:", *(void *)(*((void *)&v23 + 1) + 8 * v20)));
            ++v20;
          }
          while (v18 != v20);
          uint64_t v18 = [v16 countByEnumeratingWithState:&v23 objects:v27 count:16];
        }
        while (v18);
      }

      id v9 = v21;
      id v8 = v22;
    }
  }
}

- (void)_annotationsWillBeRemoved:(id)a3 onPageController:(id)a4 isUndoingRedoing:(BOOL)a5
{
  uint64_t v31 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  if ([v8 count])
  {
    [(AKSidecarController *)self _stopObservingAnnotations:v8];
    if (!a5)
    {
      id WeakRetained = objc_loadWeakRetained((id *)&self->_controller);
      id v11 = [WeakRetained modelController];
      id v12 = [v11 pageModelControllers];
      id v24 = v9;
      uint64_t v13 = [v12 indexOfObject:v9];

      double v14 = [(AKAnnotation *)self->_coalescingAnnotationChange UUID];
      long long v26 = 0u;
      long long v27 = 0u;
      long long v28 = 0u;
      long long v29 = 0u;
      id v25 = v8;
      id v15 = v8;
      uint64_t v16 = [v15 countByEnumeratingWithState:&v26 objects:v30 count:16];
      if (v16)
      {
        uint64_t v17 = v16;
        uint64_t v18 = *(void *)v27;
        do
        {
          for (uint64_t i = 0; i != v17; ++i)
          {
            if (*(void *)v27 != v18) {
              objc_enumerationMutation(v15);
            }
            uint64_t v20 = *(void **)(*((void *)&v26 + 1) + 8 * i);
            id v21 = [v20 UUID];
            int v22 = [v14 isEqualToString:v21];

            if (v22)
            {
              coalescingAnnotationChange = self->_coalescingAnnotationChange;
              self->_coalescingAnnotationChange = 0;
            }
            if (!self->_updatingModel) {
              [(AKSidecarController *)self _annotation:v20 removedFromPageController:v13];
            }
          }
          uint64_t v17 = [v15 countByEnumeratingWithState:&v26 objects:v30 count:16];
        }
        while (v17);
      }

      id v9 = v24;
      id v8 = v25;
    }
  }
}

- (void)_startObservingAnnotations:(id)a3
{
  uint64_t v27 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = [MEMORY[0x263EFFA08] setWithArray:&unk_26EA76328];
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  obuint64_t j = v4;
  uint64_t v16 = [obj countByEnumeratingWithState:&v21 objects:v26 count:16];
  if (v16)
  {
    uint64_t v15 = *(void *)v22;
    do
    {
      for (uint64_t i = 0; i != v16; ++i)
      {
        if (*(void *)v22 != v15) {
          objc_enumerationMutation(obj);
        }
        id v7 = *(void **)(*((void *)&v21 + 1) + 8 * i);
        id v8 = [v7 keysForValuesToObserveForUndo];
        long long v17 = 0u;
        long long v18 = 0u;
        long long v19 = 0u;
        long long v20 = 0u;
        uint64_t v9 = [v8 countByEnumeratingWithState:&v17 objects:v25 count:16];
        if (v9)
        {
          uint64_t v10 = v9;
          uint64_t v11 = *(void *)v18;
          do
          {
            for (uint64_t j = 0; j != v10; ++j)
            {
              if (*(void *)v18 != v11) {
                objc_enumerationMutation(v8);
              }
              uint64_t v13 = *(void *)(*((void *)&v17 + 1) + 8 * j);
              if (([v5 containsObject:v13] & 1) == 0) {
                [v7 addObserver:self forKeyPath:v13 options:3 context:@"AKSidecarController.annotationPropertyObservationContext"];
              }
            }
            uint64_t v10 = [v8 countByEnumeratingWithState:&v17 objects:v25 count:16];
          }
          while (v10);
        }
        [(NSMutableSet *)self->_observedAnnotations addObject:v7];
      }
      uint64_t v16 = [obj countByEnumeratingWithState:&v21 objects:v26 count:16];
    }
    while (v16);
  }
}

- (void)_stopObservingAnnotations:(id)a3
{
  uint64_t v29 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = [MEMORY[0x263EFFA08] setWithArray:&unk_26EA76340];
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  obuint64_t j = v4;
  uint64_t v6 = [obj countByEnumeratingWithState:&v23 objects:v28 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v24;
    do
    {
      uint64_t v9 = 0;
      uint64_t v17 = v7;
      do
      {
        if (*(void *)v24 != v8) {
          objc_enumerationMutation(obj);
        }
        uint64_t v10 = *(void **)(*((void *)&v23 + 1) + 8 * v9);
        if (-[NSMutableSet containsObject:](self->_observedAnnotations, "containsObject:", v10, v17))
        {
          uint64_t v11 = [v10 keysForValuesToObserveForUndo];
          long long v19 = 0u;
          long long v20 = 0u;
          long long v21 = 0u;
          long long v22 = 0u;
          uint64_t v12 = [v11 countByEnumeratingWithState:&v19 objects:v27 count:16];
          if (v12)
          {
            uint64_t v13 = v12;
            uint64_t v14 = *(void *)v20;
            do
            {
              for (uint64_t i = 0; i != v13; ++i)
              {
                if (*(void *)v20 != v14) {
                  objc_enumerationMutation(v11);
                }
                uint64_t v16 = *(void *)(*((void *)&v19 + 1) + 8 * i);
                if (([v5 containsObject:v16] & 1) == 0) {
                  [v10 removeObserver:self forKeyPath:v16];
                }
              }
              uint64_t v13 = [v11 countByEnumeratingWithState:&v19 objects:v27 count:16];
            }
            while (v13);
          }
          [(NSMutableSet *)self->_observedAnnotations removeObject:v10];

          uint64_t v7 = v17;
        }
        ++v9;
      }
      while (v9 != v7);
      uint64_t v7 = [obj countByEnumeratingWithState:&v23 objects:v28 count:16];
    }
    while (v7);
  }
}

- (void)_annotation:(id)a3 addedToPageController:(unint64_t)a4 selected:(BOOL)a5 atIndex:(unint64_t)a6
{
  BOOL v7 = a5;
  v19[5] = *MEMORY[0x263EF8340];
  id v10 = a3;
  uint64_t v11 = [v10 dataRepresentation];
  uint64_t v12 = (void *)v11;
  if (v11)
  {
    v18[0] = &unk_26EA76880;
    v18[1] = &unk_26EA76898;
    v19[0] = &unk_26EA768F8;
    v19[1] = v11;
    v18[2] = &unk_26EA768B0;
    uint64_t v13 = [NSNumber numberWithUnsignedInteger:a4];
    v19[2] = v13;
    v18[3] = &unk_26EA768C8;
    uint64_t v14 = [NSNumber numberWithUnsignedInteger:a6];
    v19[3] = v14;
    v18[4] = &unk_26EA768E0;
    uint64_t v15 = [NSNumber numberWithBool:v7];
    v19[4] = v15;
    uint64_t v16 = [NSDictionary dictionaryWithObjects:v19 forKeys:v18 count:5];
    [(AKSidecarController *)self _sendDictionary:v16];
  }
  else
  {
    uint64_t v17 = sub_2376C4650();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
      sub_2376DB138();
    }

    [(AKSidecarController *)self _handleInternalFailure];
  }
}

- (void)_annotation:(id)a3 removedFromPageController:(unint64_t)a4
{
  v14[4] = *MEMORY[0x263EF8340];
  v14[0] = &unk_26EA768C8;
  v13[0] = &unk_26EA76880;
  v13[1] = &unk_26EA768F8;
  id v6 = a3;
  BOOL v7 = [v6 UUID];
  v14[1] = v7;
  void v13[2] = &unk_26EA768B0;
  uint64_t v8 = [NSNumber numberWithUnsignedInteger:a4];
  void v14[2] = v8;
  v13[3] = &unk_26EA76910;
  uint64_t v9 = NSNumber;
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  uint64_t v11 = [v9 numberWithBool:isKindOfClass & 1];
  v14[3] = v11;
  uint64_t v12 = [NSDictionary dictionaryWithObjects:v14 forKeys:v13 count:4];
  [(AKSidecarController *)self _sendDictionary:v12];
}

- (void)_annotation:(id)a3 modifiedInPageController:(unint64_t)a4 properties:(id)a5
{
  v21[5] = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a5;
  id v10 = [v9 allObjects];
  if (([v9 containsObject:@"typingAttributes"] & 1) != 0
    || ([v9 containsObject:@"annotationText"] & 1) != 0
    || [v9 containsObject:@"quadPoints"])
  {
    uint64_t v11 = [v8 dataRepresentation];
    v21[0] = &unk_26EA76898;
    v20[0] = &unk_26EA76880;
    v20[1] = &unk_26EA768F8;
    uint64_t v12 = [v8 UUID];
    v21[1] = v12;
    v20[2] = &unk_26EA768B0;
    uint64_t v13 = [NSNumber numberWithUnsignedInteger:a4];
    v21[2] = v13;
    v21[3] = v10;
    v20[3] = &unk_26EA76940;
    void v20[4] = &unk_26EA76898;
    v21[4] = v11;
    uint64_t v14 = [NSDictionary dictionaryWithObjects:v21 forKeys:v20 count:5];
    [(AKSidecarController *)self _sendDictionary:v14];
  }
  else
  {
    uint64_t v11 = [v8 dictionaryWithValuesForKeys:v10];
    uint64_t v12 = +[AKSecureSerializationHelper dataForSecureCodingCompliantObject:v11 withOptionalKey:0];
    v19[0] = &unk_26EA76898;
    uint64_t v13 = objc_msgSend(v8, "UUID", &unk_26EA76880, &unk_26EA768F8);
    v19[1] = v13;
    v18[2] = &unk_26EA768B0;
    uint64_t v14 = [NSNumber numberWithUnsignedInteger:a4];
    v19[2] = v14;
    v19[3] = v12;
    v18[3] = &unk_26EA76928;
    v18[4] = &unk_26EA76910;
    uint64_t v15 = NSNumber;
    objc_opt_class();
    uint64_t v16 = [v15 numberWithBool:objc_opt_isKindOfClass() & 1];
    v19[4] = v16;
    uint64_t v17 = [NSDictionary dictionaryWithObjects:v19 forKeys:v18 count:5];
    [(AKSidecarController *)self _sendDictionary:v17];
  }
  self->_needCheckpointSent = 1;
}

- (void)_selectionChangedOnPageController:(id)a3
{
  v14[3] = *MEMORY[0x263EF8340];
  id v4 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_controller);
  id v6 = [WeakRetained modelController];
  BOOL v7 = [v6 pageModelControllers];
  uint64_t v8 = [v7 indexOfObject:v4];

  if (v8 != 0x7FFFFFFFFFFFFFFFLL)
  {
    v14[0] = &unk_26EA768E0;
    v13[0] = &unk_26EA76880;
    v13[1] = &unk_26EA768B0;
    id v9 = [NSNumber numberWithUnsignedInteger:v8];
    v14[1] = v9;
    void v13[2] = &unk_26EA76958;
    id v10 = [v4 valueForKeyPath:@"selectedAnnotations.UUID"];
    uint64_t v11 = [v10 allObjects];
    void v14[2] = v11;
    uint64_t v12 = [NSDictionary dictionaryWithObjects:v14 forKeys:v13 count:3];
    [(AKSidecarController *)self _sendDictionary:v12];
  }
}

- (void)_sendDictionary:(id)a3
{
  id v4 = a3;
  id v5 = sub_2376C4650();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
    sub_2376DB1A0();
  }

  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  [WeakRetained sidecarController:self sendOPACKObject:v4];
}

- (BOOL)shouldObserveEdits
{
  return self->_shouldObserveEdits;
}

- (AKSidecarControllerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (AKSidecarControllerDelegate *)WeakRetained;
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
  return (NSMutableSet *)objc_getProperty(self, a2, 88, 1);
}

- (void)setObservedPageModelControllers:(id)a3
{
}

- (NSMutableSet)observedAnnotations
{
  return (NSMutableSet *)objc_getProperty(self, a2, 96, 1);
}

- (void)setObservedAnnotations:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_observedAnnotations, 0);
  objc_storeStrong((id *)&self->_observedPageModelControllers, 0);
  objc_destroyWeak((id *)&self->_controller);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_coalescingAnnotationSource, 0);
  objc_storeStrong((id *)&self->_coalescingAnnotationChange, 0);
  objc_storeStrong((id *)&self->_coalescingAnnotationKeys, 0);
  objc_storeStrong((id *)&self->_strokeTimer, 0);
  objc_storeStrong((id *)&self->_currentStrokeOverlay, 0);

  objc_storeStrong((id *)&self->_currentStroke, 0);
}

@end