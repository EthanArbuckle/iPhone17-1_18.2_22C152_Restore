@interface AVCaptureControlsOverlay
+ (void)initialize;
- (AVCaptureControlsOverlay)initWithSession:(id)a3;
- (void)_activateIsolated;
- (void)_invalidateIsolated;
- (void)_sendControlsIsolated;
- (void)_updateControlIsolated:(id)a3;
- (void)activate;
- (void)cameraOverlayConnection:(id)a3 didApplyControlUpdate:(id)a4;
- (void)cameraOverlayConnection:(id)a3 didChangeActiveControlIdentifier:(id)a4;
- (void)cameraOverlayConnection:(id)a3 didChangeFocusLocked:(BOOL)a4;
- (void)cameraOverlayConnection:(id)a3 didChangeInterfaceReduced:(BOOL)a4;
- (void)cameraOverlayConnection:(id)a3 didChangeOverlayVisible:(BOOL)a4;
- (void)cameraOverlayConnection:(id)a3 didChangeOverlayVisible:(BOOL)a4 activeControlIdentifier:(id)a5;
- (void)cameraOverlayConnection:(id)a3 didChangeStatus:(unint64_t)a4;
- (void)dealloc;
- (void)invalidate;
- (void)rebuildControls;
- (void)updateControl:(id)a3;
- (void)updateControls:(id)a3;
@end

@implementation AVCaptureControlsOverlay

- (AVCaptureControlsOverlay)initWithSession:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)AVCaptureControlsOverlay;
  v4 = [(AVCaptureControlsOverlay *)&v7 init];
  if (v4)
  {
    v4->_sessionReference = (AVWeakReference *)[objc_alloc(MEMORY[0x1E4F47DF0]) initWithReferencedObject:a3];
    dispatch_queue_t v5 = dispatch_queue_create("com.apple.avfoundation.controls-overlay", 0);
    v4->_controlsLock._os_unfair_lock_opaque = 0;
    v4->_connectionQueue = (OS_dispatch_queue *)v5;
    os_unfair_lock_lock(&v4->_controlsLock);
    v4->_itemsByIdentifier = (NSDictionary *)objc_alloc_init(MEMORY[0x1E4F1C9E8]);
    v4->_orderedIdentifiers = (NSArray *)objc_alloc_init(MEMORY[0x1E4F1C978]);
    os_unfair_lock_unlock(&v4->_controlsLock);
  }
  return v4;
}

- (void)updateControls:(id)a3
{
  uint64_t v57 = *MEMORY[0x1E4F143B8];
  p_controlsLocuint64_t k = &self->_controlsLock;
  os_unfair_lock_lock(&self->_controlsLock);
  id v6 = (id)[(NSArray *)self->_orderedIdentifiers copy];
  id v7 = (id)[(NSDictionary *)self->_itemsByIdentifier copy];
  os_unfair_lock_unlock(p_controlsLock);
  uint64_t v49 = 0;
  v50 = &v49;
  uint64_t v51 = 0x2020000000;
  char v52 = 0;
  uint64_t v8 = [a3 count];
  if (v8 == [v6 count])
  {
    v48[0] = MEMORY[0x1E4F143A8];
    v48[1] = 3221225472;
    v48[2] = __43__AVCaptureControlsOverlay_updateControls___block_invoke;
    v48[3] = &unk_1E5A79A88;
    v48[4] = a3;
    v48[5] = v7;
    v48[6] = &v49;
    [v6 enumerateObjectsUsingBlock:v48];
    if (!*((unsigned char *)v50 + 24)) {
      goto LABEL_37;
    }
  }
  else
  {
    *((unsigned char *)v50 + 24) = 1;
  }
  long long v46 = 0u;
  long long v47 = 0u;
  long long v44 = 0u;
  long long v45 = 0u;
  uint64_t v9 = [v7 countByEnumeratingWithState:&v44 objects:v56 count:16];
  if (v9)
  {
    uint64_t v10 = *(void *)v45;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v45 != v10) {
          objc_enumerationMutation(v7);
        }
        v12 = (void *)[v7 objectForKeyedSubscript:*(void *)(*((void *)&v44 + 1) + 8 * i)];
        if ((objc_msgSend(a3, "containsObject:", objc_msgSend(v12, "control")) & 1) == 0) {
          objc_msgSend((id)objc_msgSend(v12, "control"), "setOverlay:", 0);
        }
      }
      uint64_t v9 = [v7 countByEnumeratingWithState:&v44 objects:v56 count:16];
    }
    while (v9);
  }
  id v30 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  id v13 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  long long v42 = 0u;
  long long v43 = 0u;
  long long v40 = 0u;
  long long v41 = 0u;
  uint64_t v14 = [a3 countByEnumeratingWithState:&v40 objects:v55 count:16];
  locuint64_t k = p_controlsLock;
  if (v14)
  {
    uint64_t v15 = *(void *)v41;
    do
    {
      for (uint64_t j = 0; j != v14; ++j)
      {
        if (*(void *)v41 != v15) {
          objc_enumerationMutation(a3);
        }
        v17 = *(void **)(*((void *)&v40 + 1) + 8 * j);
        uint64_t v18 = [v17 identifier];
        v19 = -[AVCaptureControlsOverlayItem initWithControl:overlayControl:]([AVCaptureControlsOverlayItem alloc], "initWithControl:overlayControl:", v17, [v17 overlayControl]);
        [v13 setObject:v19 forKeyedSubscript:v18];

        [v30 addObject:v18];
        [v17 setOverlay:self];
      }
      uint64_t v14 = [a3 countByEnumeratingWithState:&v40 objects:v55 count:16];
    }
    while (v14);
  }
  os_unfair_lock_lock(lock);
  long long v38 = 0u;
  long long v39 = 0u;
  long long v36 = 0u;
  long long v37 = 0u;
  itemsByIdentifier = self->_itemsByIdentifier;
  uint64_t v21 = [(NSDictionary *)itemsByIdentifier countByEnumeratingWithState:&v36 objects:v54 count:16];
  if (v21)
  {
    uint64_t v22 = *(void *)v37;
    do
    {
      for (uint64_t k = 0; k != v21; ++k)
      {
        if (*(void *)v37 != v22) {
          objc_enumerationMutation(itemsByIdentifier);
        }
        objc_msgSend((id)objc_msgSend(-[NSDictionary objectForKeyedSubscript:](self->_itemsByIdentifier, "objectForKeyedSubscript:", *(void *)(*((void *)&v36 + 1) + 8 * k)), "control"), "removeObservers");
      }
      uint64_t v21 = [(NSDictionary *)itemsByIdentifier countByEnumeratingWithState:&v36 objects:v54 count:16];
    }
    while (v21);
  }

  self->_itemsByIdentifier = (NSDictionary *)[v13 copy];
  self->_orderedIdentifiers = (NSArray *)[v30 copy];
  if (!self->_visible)
  {
    long long v34 = 0u;
    long long v35 = 0u;
    long long v32 = 0u;
    long long v33 = 0u;
    v24 = self->_itemsByIdentifier;
    uint64_t v25 = [(NSDictionary *)v24 countByEnumeratingWithState:&v32 objects:v53 count:16];
    if (v25)
    {
      uint64_t v26 = *(void *)v33;
      do
      {
        for (uint64_t m = 0; m != v25; ++m)
        {
          if (*(void *)v33 != v26) {
            objc_enumerationMutation(v24);
          }
          objc_msgSend((id)objc_msgSend(-[NSDictionary objectForKeyedSubscript:](self->_itemsByIdentifier, "objectForKeyedSubscript:", *(void *)(*((void *)&v32 + 1) + 8 * m)), "control"), "overlayVisibilityDidChange:", 0);
        }
        uint64_t v25 = [(NSDictionary *)v24 countByEnumeratingWithState:&v32 objects:v53 count:16];
      }
      while (v25);
    }
  }
  os_unfair_lock_unlock(lock);

  connectionQueue = self->_connectionQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __43__AVCaptureControlsOverlay_updateControls___block_invoke_2;
  block[3] = &unk_1E5A72ED0;
  block[4] = self;
  dispatch_async(connectionQueue, block);
LABEL_37:
  _Block_object_dispose(&v49, 8);
}

+ (void)initialize
{
}

- (void)dealloc
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];

  connectionQueue = self->_connectionQueue;
  connection = self->_connection;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __35__AVCaptureControlsOverlay_dealloc__block_invoke;
  block[3] = &unk_1E5A72ED0;
  block[4] = connection;
  dispatch_async(connectionQueue, block);

  os_unfair_lock_lock(&self->_controlsLock);
  long long v13 = 0u;
  long long v14 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  itemsByIdentifier = self->_itemsByIdentifier;
  uint64_t v6 = [(NSDictionary *)itemsByIdentifier countByEnumeratingWithState:&v11 objects:v16 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v12;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v12 != v8) {
          objc_enumerationMutation(itemsByIdentifier);
        }
        objc_msgSend((id)objc_msgSend(-[NSDictionary objectForKeyedSubscript:](self->_itemsByIdentifier, "objectForKeyedSubscript:", *(void *)(*((void *)&v11 + 1) + 8 * i)), "control"), "removeObservers");
      }
      uint64_t v7 = [(NSDictionary *)itemsByIdentifier countByEnumeratingWithState:&v11 objects:v16 count:16];
    }
    while (v7);
  }

  os_unfair_lock_unlock(&self->_controlsLock);
  v10.receiver = self;
  v10.super_class = (Class)AVCaptureControlsOverlay;
  [(AVCaptureControlsOverlay *)&v10 dealloc];
}

uint64_t __35__AVCaptureControlsOverlay_dealloc__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) invalidate];
}

uint64_t __43__AVCaptureControlsOverlay_updateControls___block_invoke(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  uint64_t v7 = objc_msgSend(*(id *)(a1 + 32), "objectAtIndexedSubscript:");
  char v8 = objc_msgSend(a2, "isEqualToString:", objc_msgSend(v7, "identifier"));
  uint64_t v9 = objc_msgSend((id)objc_msgSend(*(id *)(a1 + 40), "objectForKeyedSubscript:", a2), "overlayControl");
  uint64_t result = [v7 overlayControl];
  char v11 = v8 ^ 1;
  if (v9 != result) {
    char v11 = 1;
  }
  *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = v11;
  *a4 = *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24);
  return result;
}

uint64_t __43__AVCaptureControlsOverlay_updateControls___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) _sendControlsIsolated];
}

- (void)rebuildControls
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  os_unfair_lock_lock(&self->_controlsLock);
  id v4 = (id)[(NSArray *)self->_orderedIdentifiers copy];
  uint64_t v15 = self;
  id v5 = (id)[(NSDictionary *)self->_itemsByIdentifier copy];
  locuint64_t k = &self->_controlsLock;
  os_unfair_lock_unlock(&self->_controlsLock);
  long long v19 = 0u;
  long long v20 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  uint64_t v6 = [v4 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v18;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v18 != v8) {
          objc_enumerationMutation(v4);
        }
        uint64_t v10 = *(void *)(*((void *)&v17 + 1) + 8 * i);
        char v11 = objc_msgSend((id)objc_msgSend(v5, "objectForKeyedSubscript:", v10), "control");
        long long v12 = -[AVCaptureControlsOverlayItem initWithControl:overlayControl:]([AVCaptureControlsOverlayItem alloc], "initWithControl:overlayControl:", v11, [v11 overlayControl]);
        [v3 setObject:v12 forKeyedSubscript:v10];
      }
      uint64_t v7 = [v4 countByEnumeratingWithState:&v17 objects:v21 count:16];
    }
    while (v7);
  }
  os_unfair_lock_lock(lock);

  v15->_itemsByIdentifier = (NSDictionary *)[v3 copy];
  os_unfair_lock_unlock(lock);

  connectionQueue = v15->_connectionQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __43__AVCaptureControlsOverlay_rebuildControls__block_invoke;
  block[3] = &unk_1E5A72ED0;
  block[4] = v15;
  dispatch_async(connectionQueue, block);
}

uint64_t __43__AVCaptureControlsOverlay_rebuildControls__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _sendControlsIsolated];
}

- (void)_sendControlsIsolated
{
  uint64_t v38 = *MEMORY[0x1E4F143B8];
  dispatch_assert_queue_V2((dispatch_queue_t)self->_connectionQueue);
  connection = self->_connection;
  if (connection && [(CAMOverlayServiceConnection *)self->_connection status] == 1)
  {
    os_unfair_lock_lock(&self->_controlsLock);
    id v4 = (id)[(NSArray *)self->_orderedIdentifiers copy];
    id v5 = (id)[(NSDictionary *)self->_itemsByIdentifier copy];
    os_unfair_lock_unlock(&self->_controlsLock);
    uint64_t v6 = (void *)[MEMORY[0x1E4F1CA48] array];
    long long v33 = 0u;
    long long v34 = 0u;
    long long v35 = 0u;
    long long v36 = 0u;
    uint64_t v7 = [v4 countByEnumeratingWithState:&v33 objects:v37 count:16];
    if (v7)
    {
      uint64_t v8 = v7;
      uint64_t v9 = *(void *)v34;
      do
      {
        uint64_t v10 = 0;
        do
        {
          if (*(void *)v34 != v9) {
            objc_enumerationMutation(v4);
          }
          objc_msgSend(v6, "addObject:", objc_msgSend((id)objc_msgSend(v5, "objectForKeyedSubscript:", *(void *)(*((void *)&v33 + 1) + 8 * v10++)), "overlayControl"));
        }
        while (v8 != v10);
        uint64_t v8 = [v4 countByEnumeratingWithState:&v33 objects:v37 count:16];
      }
      while (v8);
    }
    id v11 = (id)[v6 copy];
    long long v12 = (void *)[MEMORY[0x1E4F1CA48] array];
    long long v29 = 0u;
    long long v30 = 0u;
    long long v31 = 0u;
    long long v32 = 0u;
    uint64_t v13 = [v4 countByEnumeratingWithState:&v29 objects:v37 count:16];
    if (v13)
    {
      uint64_t v14 = v13;
      uint64_t v15 = *(void *)v30;
      do
      {
        uint64_t v16 = 0;
        do
        {
          if (*(void *)v30 != v15) {
            objc_enumerationMutation(v4);
          }
          long long v17 = objc_msgSend((id)objc_msgSend(v5, "objectForKeyedSubscript:", *(void *)(*((void *)&v29 + 1) + 8 * v16)), "control");
          if (([v17 isEnabled] & 1) == 0)
          {
            uint64_t v18 = [v17 enabledUpdate];
            if (v18) {
              [v12 addObject:v18];
            }
          }
          ++v16;
        }
        while (v14 != v16);
        uint64_t v14 = [v4 countByEnumeratingWithState:&v29 objects:v37 count:16];
      }
      while (v14);
    }
    long long v27 = 0u;
    long long v28 = 0u;
    long long v25 = 0u;
    long long v26 = 0u;
    uint64_t v19 = [v4 countByEnumeratingWithState:&v25 objects:&v33 count:16];
    if (v19)
    {
      uint64_t v20 = v19;
      uint64_t v21 = *(void *)v26;
      do
      {
        uint64_t v22 = 0;
        do
        {
          if (*(void *)v26 != v21) {
            objc_enumerationMutation(v4);
          }
          objc_msgSend(v12, "addObject:", objc_msgSend((id)objc_msgSend((id)objc_msgSend(v5, "objectForKeyedSubscript:", *(void *)(*((void *)&v25 + 1) + 8 * v22++)), "control"), "overlayUpdate"));
        }
        while (v20 != v22);
        uint64_t v20 = [v4 countByEnumeratingWithState:&v25 objects:&v33 count:16];
      }
      while (v20);
    }
    id v23 = (id)[v12 copy];
    v24[0] = MEMORY[0x1E4F143A8];
    v24[1] = 3221225472;
    v24[2] = __49__AVCaptureControlsOverlay__sendControlsIsolated__block_invoke;
    v24[3] = &unk_1E5A79AB0;
    v24[4] = v11;
    v24[5] = self;
    [(CAMOverlayServiceConnection *)connection configureWithControls:v11 initialUpdates:v23 completion:v24];
  }
}

uint64_t __49__AVCaptureControlsOverlay__sendControlsIsolated__block_invoke(uint64_t result, uint64_t a2)
{
  if (!a2)
  {
    uint64_t v2 = result;
    uint64_t result = [*(id *)(result + 32) count];
    if (!result)
    {
      id v3 = *(void **)(v2 + 40);
      return [v3 invalidate];
    }
  }
  return result;
}

- (void)updateControl:(id)a3
{
  if (a3)
  {
    connectionQueue = self->_connectionQueue;
    v4[0] = MEMORY[0x1E4F143A8];
    v4[1] = 3221225472;
    v4[2] = __42__AVCaptureControlsOverlay_updateControl___block_invoke;
    v4[3] = &unk_1E5A72D70;
    v4[4] = self;
    v4[5] = a3;
    dispatch_async(connectionQueue, v4);
  }
}

uint64_t __42__AVCaptureControlsOverlay_updateControl___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _updateControlIsolated:*(void *)(a1 + 40)];
}

- (void)_updateControlIsolated:(id)a3
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_connectionQueue);
  connection = self->_connection;
  if (connection && [(CAMOverlayServiceConnection *)connection status] == 1)
  {
    [(CAMOverlayServiceConnection *)connection applyControlUpdate:a3 completion:&__block_literal_global_19];
  }
}

- (void)_invalidateIsolated
{
  self->_connection = 0;
}

- (void)_activateIsolated
{
  if ([(CAMOverlayServiceConnection *)self->_connection status] != 1)
  {
    [(AVCaptureControlsOverlay *)self _invalidateIsolated];
    self->_connection = (CAMOverlayServiceConnection *)(id)objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F57DC8], "sharedService"), "createConnectionWithClient:queue:", self, self->_connectionQueue);
    [(AVCaptureControlsOverlay *)self _sendControlsIsolated];
  }
}

- (void)activate
{
  objc_initWeak(&location, self);
  connectionQueue = self->_connectionQueue;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __36__AVCaptureControlsOverlay_activate__block_invoke;
  v4[3] = &unk_1E5A79AF8;
  objc_copyWeak(&v5, &location);
  dispatch_async(connectionQueue, v4);
  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);
}

void __36__AVCaptureControlsOverlay_activate__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _activateIsolated];
}

- (void)invalidate
{
  objc_initWeak(&location, self);
  connectionQueue = self->_connectionQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __38__AVCaptureControlsOverlay_invalidate__block_invoke;
  block[3] = &unk_1E5A79B20;
  objc_copyWeak(&v5, &location);
  block[4] = self;
  dispatch_async(connectionQueue, block);
  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);
}

void __38__AVCaptureControlsOverlay_invalidate__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  [*(id *)(a1 + 32) _invalidateIsolated];
}

- (void)cameraOverlayConnection:(id)a3 didChangeStatus:(unint64_t)a4
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_connectionQueue);
  if (self->_connection == a3)
  {
    uint64_t v6 = [a3 status];
    if (v6 == 1)
    {
      [(AVCaptureControlsOverlay *)self _sendControlsIsolated];
    }
    else if (v6 == 2)
    {
      uint64_t v7 = (void *)[(AVWeakReference *)self->_sessionReference referencedObject];
      [v7 handleControlsOverlayInvalidated:self];
    }
  }
}

- (void)cameraOverlayConnection:(id)a3 didChangeOverlayVisible:(BOOL)a4
{
}

- (void)cameraOverlayConnection:(id)a3 didChangeOverlayVisible:(BOOL)a4 activeControlIdentifier:(id)a5
{
  BOOL v6 = a4;
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  dispatch_assert_queue_V2((dispatch_queue_t)self->_connectionQueue);
  os_unfair_lock_lock(&self->_controlsLock);
  self->_visible = v6;
  id v8 = (id)[(NSDictionary *)self->_itemsByIdentifier copy];
  os_unfair_lock_unlock(&self->_controlsLock);
  long long v16 = 0u;
  long long v17 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  uint64_t v9 = [v8 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v15;
    do
    {
      uint64_t v12 = 0;
      do
      {
        if (*(void *)v15 != v11) {
          objc_enumerationMutation(v8);
        }
        objc_msgSend((id)objc_msgSend((id)objc_msgSend(v8, "objectForKeyedSubscript:", *(void *)(*((void *)&v14 + 1) + 8 * v12++)), "control"), "overlayVisibilityDidChange:", v6);
      }
      while (v10 != v12);
      uint64_t v10 = [v8 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v10);
  }
  if (a5) {
    a5 = (id)objc_msgSend((id)objc_msgSend(v8, "objectForKeyedSubscript:", a5), "control");
  }
  uint64_t v13 = (void *)[(AVWeakReference *)self->_sessionReference referencedObject];
  if (v13) {
    [v13 handleControlsOverlay:self didChangeVisibility:v6 activeControl:a5];
  }
}

- (void)cameraOverlayConnection:(id)a3 didChangeActiveControlIdentifier:(id)a4
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_connectionQueue);
  uint64_t v6 = [(AVWeakReference *)self->_sessionReference referencedObject];
  if (v6)
  {
    uint64_t v7 = (void *)v6;
    os_unfair_lock_lock(&self->_controlsLock);
    id v8 = (id)[(NSDictionary *)self->_itemsByIdentifier copy];
    os_unfair_lock_unlock(&self->_controlsLock);
    uint64_t v9 = objc_msgSend((id)objc_msgSend(v8, "objectForKeyedSubscript:", a4), "control");
    [v7 handleControlsOverlay:self didChangeActiveControl:v9];
  }
}

- (void)cameraOverlayConnection:(id)a3 didChangeInterfaceReduced:(BOOL)a4
{
  BOOL v4 = a4;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_connectionQueue);
  uint64_t v6 = (void *)[(AVWeakReference *)self->_sessionReference referencedObject];
  if (v6)
  {
    [v6 handleControlsOverlay:self didChangeInterfaceReduced:v4];
  }
}

- (void)cameraOverlayConnection:(id)a3 didApplyControlUpdate:(id)a4
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_connectionQueue);
  p_controlsLocuint64_t k = &self->_controlsLock;
  os_unfair_lock_lock(&self->_controlsLock);
  id v7 = -[NSDictionary objectForKeyedSubscript:](self->_itemsByIdentifier, "objectForKeyedSubscript:", [a4 controlIdentifier]);
  os_unfair_lock_unlock(p_controlsLock);
  id v8 = (void *)[v7 control];

  [v8 enqueueActionWithUpdate:a4];
}

- (void)cameraOverlayConnection:(id)a3 didChangeFocusLocked:(BOOL)a4
{
  BOOL v4 = a4;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_connectionQueue);
  uint64_t v6 = (void *)[(AVWeakReference *)self->_sessionReference referencedObject];
  if (v6)
  {
    [v6 handleControlsOverlay:self didChangeFocusLocked:v4];
  }
}

@end