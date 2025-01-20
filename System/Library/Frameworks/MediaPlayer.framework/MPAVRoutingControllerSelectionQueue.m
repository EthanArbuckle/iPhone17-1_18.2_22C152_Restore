@interface MPAVRoutingControllerSelectionQueue
- (BOOL)hasPendingPickedRoutes;
- (BOOL)hasPendingRoutes;
- (BOOL)routeIsPendingPick:(id)a3;
- (MPAVRoute)pendingPickedRoute;
- (MPAVRoutingController)routingController;
- (MPAVRoutingControllerSelectionQueue)initWithRoutingController:(id)a3;
- (NSSet)pendingPickedRoutes;
- (void)_dequeue;
- (void)_dequeueSelectionWhenPossible;
- (void)_enqueue:(id)a3;
- (void)_processSelection:(id)a3 completion:(id)a4;
- (void)addPendingRoutes:(id)a3;
- (void)cancelInProgressSelectionForRoute:(id)a3;
- (void)enqueueSelectionOperation:(int64_t)a3 forRoutes:(id)a4 completion:(id)a5;
- (void)pickedRouteDidChange;
- (void)removeAllPendingRoutes;
- (void)removePendingRoutes:(id)a3;
- (void)removePendingRoutes:(id)a3 withError:(BOOL)a4;
@end

@implementation MPAVRoutingControllerSelectionQueue

void __59__MPAVRoutingControllerSelectionQueue_pickedRouteDidChange__block_invoke(uint64_t a1)
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 64));
  long long v27 = 0u;
  long long v28 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  v3 = objc_msgSend(*(id *)(*(void *)(a1 + 32) + 24), "routes", 0);
  uint64_t v4 = [v3 countByEnumeratingWithState:&v25 objects:v31 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v26;
    int v7 = 1;
    int v8 = 1;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v26 != v6) {
          objc_enumerationMutation(v3);
        }
        uint64_t v10 = *(void *)(*((void *)&v25 + 1) + 8 * i);
        v11 = [WeakRetained pickedRoutes];
        v8 &= [v11 containsObject:v10];

        v12 = [WeakRetained pickedRoutes];
        v7 &= [v12 containsObject:v10] ^ 1;
      }
      uint64_t v5 = [v3 countByEnumeratingWithState:&v25 objects:v31 count:16];
    }
    while (v5);
  }
  else
  {
    LOBYTE(v7) = 1;
    int v8 = 1;
  }

  if (WeakRetained)
  {
    if ([*(id *)(*(void *)(a1 + 32) + 24) selectionOperation] == 1) {
      char v13 = v8;
    }
    else {
      char v13 = 0;
    }
    if ((v13 & 1) != 0
      || ([*(id *)(*(void *)(a1 + 32) + 24) selectionOperation] == 2 ? (char v14 = v7) : (char v14 = 0),
          (v14 & 1) != 0))
    {
      BOOL v15 = 0;
    }
    else
    {
      if ([*(id *)(*(void *)(a1 + 32) + 24) selectionOperation]) {
        int v23 = 0;
      }
      else {
        int v23 = v8;
      }
      if (v23 != 1) {
        goto LABEL_30;
      }
      v24 = [WeakRetained pickedRoutes];
      BOOL v15 = [v24 count] != 1;
    }
    v16 = *(void **)(*(void *)(a1 + 32) + 40);
    if (v16 && !v15)
    {
      [v16 invalidate];
      uint64_t v17 = *(void *)(a1 + 32);
      v18 = *(void **)(v17 + 40);
      *(void *)(v17 + 40) = 0;

      v19 = os_log_create("com.apple.amp.mediaplayer", "Routing");
      if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v20 = *(void *)(*(void *)(a1 + 32) + 24);
        *(_DWORD *)buf = 138543362;
        uint64_t v30 = v20;
        _os_log_impl(&dword_1952E8000, v19, OS_LOG_TYPE_DEFAULT, "RCS pickedRouteDidChange caused us to drop selection %{public}@", buf, 0xCu);
      }

      uint64_t v21 = *(void *)(a1 + 32);
      v22 = *(void **)(v21 + 24);
      *(void *)(v21 + 24) = 0;
    }
  }
LABEL_30:
}

- (MPAVRoutingControllerSelectionQueue)initWithRoutingController:(id)a3
{
  id v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)MPAVRoutingControllerSelectionQueue;
  uint64_t v5 = [(MPAVRoutingControllerSelectionQueue *)&v15 init];
  if (v5)
  {
    dispatch_queue_t v6 = dispatch_queue_create("com.apple.MediaPlayer.MPAVRoutingControllerSelection/serialQueue", 0);
    serialQueue = v5->_serialQueue;
    v5->_serialQueue = (OS_dispatch_queue *)v6;

    uint64_t v8 = [MEMORY[0x1E4F1CA48] array];
    selectionsEnqueued = v5->_selectionsEnqueued;
    v5->_selectionsEnqueued = (NSMutableArray *)v8;

    objc_storeWeak((id *)&v5->_routingController, v4);
    uint64_t v10 = [MEMORY[0x1E4F1CA80] set];
    pendingRoutes = v5->_pendingRoutes;
    v5->_pendingRoutes = (NSMutableSet *)v10;

    uint64_t v12 = [MEMORY[0x1E4F28E10] weakToStrongObjectsMapTable];
    pendingSelectionTimers = v5->_pendingSelectionTimers;
    v5->_pendingSelectionTimers = (NSMapTable *)v12;
  }
  return v5;
}

- (void)pickedRouteDidChange
{
  serialQueue = self->_serialQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __59__MPAVRoutingControllerSelectionQueue_pickedRouteDidChange__block_invoke;
  block[3] = &unk_1E57F9EA8;
  block[4] = self;
  dispatch_sync(serialQueue, block);
  [(MPAVRoutingControllerSelectionQueue *)self _dequeue];
}

- (void)_dequeue
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  uint64_t v9 = 0;
  uint64_t v10 = &v9;
  uint64_t v11 = 0x3032000000;
  uint64_t v12 = __Block_byref_object_copy__9235;
  char v13 = __Block_byref_object_dispose__9236;
  id v14 = 0;
  serialQueue = self->_serialQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __47__MPAVRoutingControllerSelectionQueue__dequeue__block_invoke;
  block[3] = &unk_1E57F9F20;
  block[4] = self;
  void block[5] = &v9;
  dispatch_sync(serialQueue, block);
  if (v10[5])
  {
    id v4 = os_log_create("com.apple.amp.mediaplayer", "Routing");
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v5 = v10[5];
      *(_DWORD *)buf = 138543362;
      uint64_t v16 = v5;
      _os_log_impl(&dword_1952E8000, v4, OS_LOG_TYPE_DEFAULT, "RCS dequeue %{public}@", buf, 0xCu);
    }

    uint64_t v6 = v10[5];
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __47__MPAVRoutingControllerSelectionQueue__dequeue__block_invoke_458;
    v7[3] = &unk_1E57EF078;
    v7[4] = self;
    v7[5] = &v9;
    [(MPAVRoutingControllerSelectionQueue *)self _processSelection:v6 completion:v7];
  }
  _Block_object_dispose(&v9, 8);
}

uint64_t __47__MPAVRoutingControllerSelectionQueue__dequeue__block_invoke(uint64_t a1)
{
  uint64_t result = [*(id *)(*(void *)(a1 + 32) + 16) count];
  if (result)
  {
    uint64_t v3 = *(void *)(a1 + 32);
    if (!*(void *)(v3 + 24))
    {
      uint64_t v4 = [*(id *)(v3 + 16) firstObject];
      uint64_t v5 = *(void *)(a1 + 32);
      uint64_t v6 = *(void **)(v5 + 24);
      *(void *)(v5 + 24) = v4;

      objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), *(id *)(*(void *)(a1 + 32) + 24));
      uint64_t v7 = *(void *)(a1 + 32);
      uint64_t v8 = *(void **)(v7 + 16);
      uint64_t v9 = *(void *)(v7 + 24);
      return [v8 removeObject:v9];
    }
  }
  return result;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_routingController);
  objc_storeStrong((id *)&self->_pendingSelectionTimers, 0);
  objc_storeStrong((id *)&self->_selectionInProgressTimer, 0);
  objc_storeStrong((id *)&self->_pendingRoutes, 0);
  objc_storeStrong((id *)&self->_selectionInProgress, 0);
  objc_storeStrong((id *)&self->_selectionsEnqueued, 0);

  objc_storeStrong((id *)&self->_serialQueue, 0);
}

- (BOOL)hasPendingPickedRoutes
{
  return self->_hasPendingPickedRoutes;
}

- (MPAVRoutingController)routingController
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_routingController);

  return (MPAVRoutingController *)WeakRetained;
}

- (void)_processSelection:(id)a3 completion:(id)a4
{
  uint64_t v55 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [v6 routes];
  uint64_t v9 = (void *)[v8 mutableCopy];

  uint64_t v10 = [v6 selectionOperation];
  p_routingController = &self->_routingController;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_routingController);
  char v13 = [WeakRetained dataSource];
  [WeakRetained _clearLegacyCachedRoute];
  if (WeakRetained)
  {
    uint64_t v14 = [WeakRetained pickedRoute];
    objc_super v15 = (void *)v14;
    if (!v10)
    {
LABEL_38:
      v37 = [v9 firstObject];
      v38 = os_log_create("com.apple.amp.mediaplayer", "Routing");
      if (os_log_type_enabled(v38, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543362;
        *(void *)v49 = v37;
        _os_log_impl(&dword_1952E8000, v38, OS_LOG_TYPE_DEFAULT, "RCS set picked route %{public}@", buf, 0xCu);
      }

      [v13 setPickedRoute:v37 withPassword:0 completion:v7];
      goto LABEL_41;
    }
    if (v10 == 2)
    {
      v29 = os_log_create("com.apple.amp.mediaplayer", "Routing");
      if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543362;
        *(void *)v49 = v9;
        _os_log_impl(&dword_1952E8000, v29, OS_LOG_TYPE_DEFAULT, "RCS remove routes %{public}@", buf, 0xCu);
      }

      [v13 removeRoutesFromGroup:v9 completion:v7];
      goto LABEL_41;
    }
    if (v10 != 1)
    {
LABEL_41:

      goto LABEL_42;
    }
    v42 = (void *)v14;
    int v16 = [WeakRetained supportsMultipleSelection];
    long long v43 = 0u;
    long long v44 = 0u;
    long long v45 = 0u;
    long long v46 = 0u;
    uint64_t v17 = [v6 routes];
    uint64_t v18 = [v17 countByEnumeratingWithState:&v43 objects:v54 count:16];
    if (v18)
    {
      uint64_t v19 = v18;
      v40 = v13;
      id v41 = v7;
      LODWORD(v39) = v16;
      HIDWORD(v39) = v16 ^ 1;
      uint64_t v20 = *(void *)v44;
      do
      {
        for (uint64_t i = 0; i != v19; ++i)
        {
          if (*(void *)v44 != v20) {
            objc_enumerationMutation(v17);
          }
          v22 = *(void **)(*((void *)&v43 + 1) + 8 * i);
          int v23 = objc_msgSend(v22, "isDeviceSpeakerRoute", v39);
          int v24 = [v22 supportsGrouping];
        }
        int v25 = v24;
        uint64_t v19 = [v17 countByEnumeratingWithState:&v43 objects:v54 count:16];
      }
      while (v19);
      int v26 = v25 ^ 1;

      if (v23)
      {
        long long v27 = os_log_create("com.apple.amp.mediaplayer", "Routing");
        char v13 = v40;
        id v7 = v41;
        objc_super v15 = v42;
        if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138543362;
          *(void *)v49 = v42;
          _os_log_impl(&dword_1952E8000, v27, OS_LOG_TYPE_DEFAULT, "RCS cannot add local speaker route. Picked route: %{public}@", buf, 0xCu);
        }

        int v28 = 1;
        goto LABEL_31;
      }
      char v13 = v40;
      id v7 = v41;
      objc_super v15 = v42;
      if (v39)
      {
        if ((v25 & 1) == 0)
        {
          HIDWORD(v39) = 0;
          int v28 = 0;
          int v26 = 1;
LABEL_31:
          v33 = os_log_create("com.apple.amp.mediaplayer", "Routing");
          if (os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_1952E8000, v33, OS_LOG_TYPE_DEFAULT, "RCS treating Add as a Set", buf, 2u);
          }

          if ((unint64_t)[v9 count] >= 2)
          {
            v34 = os_log_create("com.apple.amp.mediaplayer", "Routing");
            if (os_log_type_enabled(v34, OS_LOG_TYPE_FAULT))
            {
              *(_DWORD *)buf = 67109890;
              *(_DWORD *)v49 = v28;
              *(_WORD *)&v49[4] = 1024;
              *(_DWORD *)&v49[6] = HIDWORD(v39);
              __int16 v50 = 1024;
              int v51 = v26;
              __int16 v52 = 2114;
              v53 = v9;
              _os_log_impl(&dword_1952E8000, v34, OS_LOG_TYPE_FAULT, "Set command invoked with >1 route. (localSpeakerRoute=%{BOOL}U|toNonGroupableOutputContext=%{BOOL}U|nonGroupableRoute=%{BOOL}U: %{public}@", buf, 0x1Eu);
            }
          }
          v35 = [v9 firstObject];
          v47 = v35;
          uint64_t v36 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v47 count:1];

          uint64_t v9 = (void *)v36;
          goto LABEL_38;
        }
LABEL_25:
        uint64_t v30 = os_log_create("com.apple.amp.mediaplayer", "Routing");
        if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138543362;
          *(void *)v49 = v9;
          _os_log_impl(&dword_1952E8000, v30, OS_LOG_TYPE_DEFAULT, "RCS add routes %{public}@", buf, 0xCu);
        }

        [v13 addRoutesToGroup:v9 completion:v7];
        goto LABEL_41;
      }
    }
    else
    {

      objc_super v15 = v42;
      if (v16) {
        goto LABEL_25;
      }
      int v26 = 0;
    }
    v31 = objc_loadWeakRetained((id *)p_routingController);

    uint64_t v32 = os_log_create("com.apple.amp.mediaplayer", "Routing");
    if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      *(void *)v49 = v31;
      _os_log_impl(&dword_1952E8000, v32, OS_LOG_TYPE_DEFAULT, "RCS cannot add route to routing controller that does not support multiple selection routingController: %{public}@", buf, 0xCu);
    }

    int v28 = 0;
    HIDWORD(v39) = 1;
    id WeakRetained = v31;
    goto LABEL_31;
  }
  id WeakRetained = os_log_create("com.apple.amp.mediaplayer", "Routing");
  if (os_log_type_enabled(WeakRetained, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1952E8000, WeakRetained, OS_LOG_TYPE_DEFAULT, "RCS _processSelection:completion: routing controller missing", buf, 2u);
  }
LABEL_42:
}

void __47__MPAVRoutingControllerSelectionQueue__dequeue__block_invoke_458(uint64_t a1, void *a2)
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  uint64_t v4 = *(void **)(a1 + 32);
  uint64_t v5 = [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) routes];
  [v4 removePendingRoutes:v5 withError:v3 != 0];

  if (v3 && (MRMediaRemoteErrorIsInformational() & 1) == 0)
  {
    uint64_t v17 = os_log_create("com.apple.amp.mediaplayer", "Routing");
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v18 = *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
      *(_DWORD *)buf = 138543618;
      uint64_t v31 = v18;
      __int16 v32 = 2114;
      id v33 = v3;
      _os_log_impl(&dword_1952E8000, v17, OS_LOG_TYPE_DEFAULT, "RCS failed to process selection: %{public}@ error: %{public}@", buf, 0x16u);
    }

    id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 64));
    if (WeakRetained)
    {
      uint64_t v8 = WeakRetained;
      [WeakRetained _sendDelegatePickedRoutesChanged];
    }
    else
    {
      uint64_t v20 = os_log_create("com.apple.amp.mediaplayer", "Routing");
      if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1952E8000, v20, OS_LOG_TYPE_DEFAULT, "RCS _dequeue routing controller missing", buf, 2u);
      }

      uint64_t v8 = 0;
    }
  }
  else
  {
    id v6 = os_log_create("com.apple.amp.mediaplayer", "Routing");
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v7 = *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
      *(_DWORD *)buf = 138543362;
      uint64_t v31 = v7;
      _os_log_impl(&dword_1952E8000, v6, OS_LOG_TYPE_DEFAULT, "RCS successfully processed selection: %{public}@", buf, 0xCu);
    }

    long long v25 = 0u;
    long long v26 = 0u;
    long long v23 = 0u;
    long long v24 = 0u;
    uint64_t v8 = [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) routes];
    uint64_t v9 = [v8 countByEnumeratingWithState:&v23 objects:v29 count:16];
    if (v9)
    {
      uint64_t v10 = v9;
      uint64_t v11 = a1;
      uint64_t v12 = *(void *)v24;
      do
      {
        for (uint64_t i = 0; i != v10; ++i)
        {
          if (*(void *)v24 != v12) {
            objc_enumerationMutation(v8);
          }
          uint64_t v14 = *(void *)(*((void *)&v23 + 1) + 8 * i);
          long long v27 = @"MPAVRoutingControllerRouteUserInfoKey";
          uint64_t v28 = v14;
          objc_super v15 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v28 forKeys:&v27 count:1];
          int v16 = [MEMORY[0x1E4F28EB8] defaultCenter];
          [v16 postNotificationName:@"MPAVRoutingControllerDidPickRouteNotification" object:*(void *)(v11 + 32) userInfo:v15];
        }
        uint64_t v10 = [v8 countByEnumeratingWithState:&v23 objects:v29 count:16];
      }
      while (v10);
      a1 = v11;
    }
  }

  uint64_t v21 = [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) completion];

  if (v21)
  {
    v22 = [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) completion];
    ((void (**)(void, id))v22)[2](v22, v3);

    [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) setCompletion:0];
  }
  [*(id *)(a1 + 32) _dequeueSelectionWhenPossible];
}

- (void)_dequeueSelectionWhenPossible
{
  serialQueue = self->_serialQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __68__MPAVRoutingControllerSelectionQueue__dequeueSelectionWhenPossible__block_invoke;
  block[3] = &unk_1E57F9EA8;
  block[4] = self;
  dispatch_sync(serialQueue, block);
}

void __68__MPAVRoutingControllerSelectionQueue__dequeueSelectionWhenPossible__block_invoke(uint64_t a1)
{
  objc_initWeak(&location, *(id *)(a1 + 32));
  v2 = (void *)MEMORY[0x1E4F77A30];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __68__MPAVRoutingControllerSelectionQueue__dequeueSelectionWhenPossible__block_invoke_2;
  v6[3] = &unk_1E57F6EF0;
  objc_copyWeak(&v7, &location);
  uint64_t v3 = [v2 timerWithInterval:0 repeats:v6 block:0.25];
  uint64_t v4 = *(void *)(a1 + 32);
  uint64_t v5 = *(void **)(v4 + 40);
  *(void *)(v4 + 40) = v3;

  objc_destroyWeak(&v7);
  objc_destroyWeak(&location);
}

void __68__MPAVRoutingControllerSelectionQueue__dequeueSelectionWhenPossible__block_invoke_2(uint64_t a1)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = WeakRetained;
  if (WeakRetained)
  {
    uint64_t v3 = *((void *)WeakRetained + 1);
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __68__MPAVRoutingControllerSelectionQueue__dequeueSelectionWhenPossible__block_invoke_3;
    block[3] = &unk_1E57F9EA8;
    block[4] = v2;
    dispatch_sync(v3, block);
    uint64_t v4 = os_log_create("com.apple.amp.mediaplayer", "Routing");
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v5 = v2[3];
      *(_DWORD *)buf = 138543362;
      uint64_t v8 = v5;
      _os_log_impl(&dword_1952E8000, v4, OS_LOG_TYPE_DEFAULT, "RCS _dequeueSelectionWhenPossible timed out for selection %{public}@", buf, 0xCu);
    }

    [v2 _dequeue];
  }
}

void __68__MPAVRoutingControllerSelectionQueue__dequeueSelectionWhenPossible__block_invoke_3(uint64_t a1)
{
  [*(id *)(*(void *)(a1 + 32) + 40) invalidate];
  uint64_t v2 = *(void *)(a1 + 32);
  uint64_t v3 = *(void **)(v2 + 24);
  *(void *)(v2 + 24) = 0;
}

- (void)_enqueue:(id)a3
{
  uint64_t v68 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = os_log_create("com.apple.amp.mediaplayer", "Routing");
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    LODWORD(buf) = 138543362;
    *(void *)((char *)&buf + 4) = v4;
    _os_log_impl(&dword_1952E8000, v5, OS_LOG_TYPE_DEFAULT, "RCS enqueue %{public}@", (uint8_t *)&buf, 0xCu);
  }

  id v6 = [MEMORY[0x1E4F1CA48] array];
  *(void *)&long long buf = 0;
  *((void *)&buf + 1) = &buf;
  uint64_t v64 = 0x3032000000;
  v65 = __Block_byref_object_copy__9235;
  v66 = __Block_byref_object_dispose__9236;
  id v67 = 0;
  serialQueue = self->_serialQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __48__MPAVRoutingControllerSelectionQueue__enqueue___block_invoke;
  block[3] = &unk_1E57F9F48;
  block[4] = self;
  id v8 = v4;
  id v51 = v8;
  p_long long buf = &buf;
  dispatch_sync(serialQueue, block);
  if (*(void *)(*((void *)&buf + 1) + 40))
  {
    uint64_t v9 = os_log_create("com.apple.amp.mediaplayer", "Routing");
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v10 = *(void *)(*((void *)&buf + 1) + 40);
      LODWORD(v55) = 138543362;
      *(void *)((char *)&v55 + 4) = v10;
      _os_log_impl(&dword_1952E8000, v9, OS_LOG_TYPE_DEFAULT, "RCS will use existing selection %{public}@", (uint8_t *)&v55, 0xCu);
    }

    uint64_t v11 = [*(id *)(*((void *)&buf + 1) + 40) completion];
    if (v11)
    {
      uint64_t v12 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v61 = *MEMORY[0x1E4F28228];
      v62 = @"Enqueued route was cancelled because a new selection for the same route was enqueued.";
      char v13 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v62 forKeys:&v61 count:1];
      uint64_t v14 = [v12 errorWithDomain:@"MPAVRoutingControllerErrorDomain" code:6 userInfo:v13];
      ((void (**)(void, void *))v11)[2](v11, v14);
    }
    objc_super v15 = [v8 completion];
    [*(id *)(*((void *)&buf + 1) + 40) setCompletion:v15];

    uint64_t v16 = [v8 selectionOperation];
    [*(id *)(*((void *)&buf + 1) + 40) setSelectionOperation:v16];
    id v35 = v8;
    long long v48 = 0u;
    long long v49 = 0u;
    long long v46 = 0u;
    long long v47 = 0u;
    uint64_t v17 = [*(id *)(*((void *)&buf + 1) + 40) routes];
    uint64_t v18 = [v17 countByEnumeratingWithState:&v46 objects:v60 count:16];
    if (v18)
    {
      uint64_t v19 = *(void *)v47;
      do
      {
        for (uint64_t i = 0; i != v18; ++i)
        {
          if (*(void *)v47 != v19) {
            objc_enumerationMutation(v17);
          }
          uint64_t v21 = *(void **)(*((void *)&v46 + 1) + 8 * i);
          if ([v21 isPicked]) {
            BOOL v22 = [*(id *)(*((void *)&buf + 1) + 40) selectionOperation] == 0;
          }
          else {
            BOOL v22 = 0;
          }
          if ([v21 isPicked]) {
            BOOL v23 = [*(id *)(*((void *)&buf + 1) + 40) selectionOperation] == 1;
          }
          else {
            BOOL v23 = 0;
          }
          BOOL v24 = ([v21 isPicked] & 1) == 0
             && [*(id *)(*((void *)&buf + 1) + 40) selectionOperation] == 2;
          if (v22 || v23 || v24) {
            [v6 addObject:v21];
          }
        }
        uint64_t v18 = [v17 countByEnumeratingWithState:&v46 objects:v60 count:16];
      }
      while (v18);
    }

    id v8 = v35;
  }
  else
  {
    *(void *)&long long v55 = 0;
    *((void *)&v55 + 1) = &v55;
    uint64_t v56 = 0x3032000000;
    v57 = __Block_byref_object_copy__9235;
    v58 = __Block_byref_object_dispose__9236;
    id v59 = 0;
    long long v25 = self->_serialQueue;
    v42[0] = MEMORY[0x1E4F143A8];
    v42[1] = 3221225472;
    v42[2] = __48__MPAVRoutingControllerSelectionQueue__enqueue___block_invoke_453;
    v42[3] = &unk_1E57F9F48;
    id v26 = v8;
    id v43 = v26;
    long long v44 = self;
    long long v45 = &v55;
    dispatch_sync(v25, v42);
    long long v27 = *(void **)(*((void *)&v55 + 1) + 40);
    if (v27 && (uint64_t v28 = [v27 selectionOperation], v28 != objc_msgSend(v26, "selectionOperation")))
    {
      uint64_t v30 = self->_serialQueue;
      v38[0] = MEMORY[0x1E4F143A8];
      v38[1] = 3221225472;
      v38[2] = __48__MPAVRoutingControllerSelectionQueue__enqueue___block_invoke_2;
      v38[3] = &unk_1E57F9F48;
      id v41 = &v55;
      id v39 = v26;
      v40 = self;
      dispatch_sync(v30, v38);
      uint64_t v31 = [*(id *)(*((void *)&v55 + 1) + 40) completion];
      if (v31)
      {
        __int16 v32 = (void *)MEMORY[0x1E4F28C58];
        uint64_t v53 = *MEMORY[0x1E4F28228];
        v54 = @"Route in progress was interrupted by a new selection for the same route.";
        id v33 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v54 forKeys:&v53 count:1];
        uint64_t v34 = [v32 errorWithDomain:@"MPAVRoutingControllerErrorDomain" code:6 userInfo:v33];
        ((void (**)(void, void *))v31)[2](v31, v34);
      }
      [*(id *)(*((void *)&v55 + 1) + 40) setCompletion:0];
    }
    else
    {
      v29 = self->_serialQueue;
      v36[0] = MEMORY[0x1E4F143A8];
      v36[1] = 3221225472;
      v36[2] = __48__MPAVRoutingControllerSelectionQueue__enqueue___block_invoke_457;
      v36[3] = &unk_1E57F9F98;
      v36[4] = self;
      id v37 = v26;
      dispatch_sync(v29, v36);
    }
    _Block_object_dispose(&v55, 8);
  }
  [(MPAVRoutingControllerSelectionQueue *)self removePendingRoutes:v6];
  [(MPAVRoutingControllerSelectionQueue *)self _dequeue];

  _Block_object_dispose(&buf, 8);
}

void __48__MPAVRoutingControllerSelectionQueue__enqueue___block_invoke(uint64_t a1)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  long long v13 = 0u;
  long long v14 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  id v2 = *(id *)(*(void *)(a1 + 32) + 16);
  uint64_t v3 = [v2 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v12;
    do
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v12 != v5) {
          objc_enumerationMutation(v2);
        }
        id v7 = *(void **)(*((void *)&v11 + 1) + 8 * v6);
        id v8 = objc_msgSend(*(id *)(a1 + 40), "routes", (void)v11);
        uint64_t v9 = [v7 routes];
        int v10 = [v8 isEqual:v9];

        if (v10) {
          objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40), v7);
        }
        ++v6;
      }
      while (v4 != v6);
      uint64_t v4 = [v2 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v4);
  }
}

void __48__MPAVRoutingControllerSelectionQueue__enqueue___block_invoke_453(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) routes];
  uint64_t v3 = [*(id *)(*(void *)(a1 + 40) + 24) routes];
  int v4 = [v2 isEqual:v3];

  if (v4)
  {
    uint64_t v5 = *(void **)(*(void *)(a1 + 40) + 24);
    uint64_t v6 = (id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40);
    objc_storeStrong(v6, v5);
  }
}

uint64_t __48__MPAVRoutingControllerSelectionQueue__enqueue___block_invoke_2(void *a1)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v2 = os_log_create("com.apple.amp.mediaplayer", "Routing");
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = *(void *)(*(void *)(a1[6] + 8) + 40);
    uint64_t v4 = a1[4];
    int v6 = 138543618;
    uint64_t v7 = v3;
    __int16 v8 = 2114;
    uint64_t v9 = v4;
    _os_log_impl(&dword_1952E8000, v2, OS_LOG_TYPE_DEFAULT, "RCS changing selection in progress from %{public}@ to %{public}@", (uint8_t *)&v6, 0x16u);
  }

  return [*(id *)(a1[5] + 16) insertObject:a1[4] atIndex:0];
}

uint64_t __48__MPAVRoutingControllerSelectionQueue__enqueue___block_invoke_457(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 16) addObject:*(void *)(a1 + 40)];
}

- (void)removePendingRoutes:(id)a3 withError:(BOOL)a4
{
  BOOL v4 = a4;
  v34[1] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  uint64_t v27 = 0;
  uint64_t v28 = &v27;
  uint64_t v29 = 0x3032000000;
  uint64_t v30 = __Block_byref_object_copy__9235;
  uint64_t v31 = __Block_byref_object_dispose__9236;
  id v32 = 0;
  serialQueue = self->_serialQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __69__MPAVRoutingControllerSelectionQueue_removePendingRoutes_withError___block_invoke;
  block[3] = &unk_1E57F9F48;
  id v8 = v6;
  id v24 = v8;
  long long v25 = self;
  id v26 = &v27;
  dispatch_sync(serialQueue, block);
  uint64_t v9 = (void *)v28[5];
  if (v9)
  {
    uint64_t v10 = [v9 completion];
    if (v10)
    {
      if (v4)
      {
        long long v11 = (void *)MEMORY[0x1E4F28C58];
        uint64_t v33 = *MEMORY[0x1E4F28228];
        v34[0] = @"Selection was cancelled due to removePendingRoute.";
        long long v12 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v34 forKeys:&v33 count:1];
        long long v13 = [v11 errorWithDomain:@"MPAVRoutingControllerErrorDomain" code:6 userInfo:v12];
      }
      else
      {
        long long v13 = 0;
      }
      ((void (**)(void, void *))v10)[2](v10, v13);
    }
    [(id)v28[5] setCompletion:0];
  }
  long long v14 = self->_serialQueue;
  v20[0] = MEMORY[0x1E4F143A8];
  v20[1] = 3221225472;
  v20[2] = __69__MPAVRoutingControllerSelectionQueue_removePendingRoutes_withError___block_invoke_449;
  v20[3] = &unk_1E57F9F98;
  id v15 = v8;
  id v21 = v15;
  BOOL v22 = self;
  dispatch_sync(v14, v20);
  id WeakRetained = objc_loadWeakRetained((id *)&self->_routingController);
  uint64_t v17 = WeakRetained;
  if (WeakRetained)
  {
    [WeakRetained _sendDelegatePickedRoutesChanged];
  }
  else
  {
    uint64_t v18 = os_log_create("com.apple.amp.mediaplayer", "Routing");
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)uint64_t v19 = 0;
      _os_log_impl(&dword_1952E8000, v18, OS_LOG_TYPE_DEFAULT, "RCS removePendingRoute routing controller missing", v19, 2u);
    }
  }
  _Block_object_dispose(&v27, 8);
}

void __69__MPAVRoutingControllerSelectionQueue_removePendingRoutes_withError___block_invoke(uint64_t a1)
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v2 = *(id *)(a1 + 32);
  uint64_t v3 = [v2 countByEnumeratingWithState:&v13 objects:v19 count:16];
  if (v3)
  {
    uint64_t v5 = v3;
    uint64_t v6 = *(void *)v14;
    *(void *)&long long v4 = 138543362;
    long long v12 = v4;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v14 != v6) {
          objc_enumerationMutation(v2);
        }
        uint64_t v8 = *(void *)(*((void *)&v13 + 1) + 8 * i);
        if (objc_msgSend(*(id *)(*(void *)(a1 + 40) + 32), "containsObject:", v8, v12, (void)v13))
        {
          uint64_t v9 = os_log_create("com.apple.amp.mediaplayer", "Routing");
          if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)long long buf = v12;
            uint64_t v18 = v8;
            _os_log_impl(&dword_1952E8000, v9, OS_LOG_TYPE_DEFAULT, "RCS removePendingRoute %{public}@", buf, 0xCu);
          }

          [*(id *)(*(void *)(a1 + 40) + 32) removeObject:v8];
        }
      }
      uint64_t v5 = [v2 countByEnumeratingWithState:&v13 objects:v19 count:16];
    }
    while (v5);
  }

  uint64_t v10 = *(void **)(a1 + 32);
  long long v11 = [*(id *)(*(void *)(a1 + 40) + 24) routes];
  LODWORD(v10) = [v10 isEqual:v11];

  if (v10) {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40), *(id *)(*(void *)(a1 + 40) + 24));
  }
}

void __69__MPAVRoutingControllerSelectionQueue_removePendingRoutes_withError___block_invoke_449(uint64_t a1)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v2 = *(id *)(a1 + 32);
  uint64_t v3 = [v2 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v11;
    do
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v11 != v5) {
          objc_enumerationMutation(v2);
        }
        uint64_t v7 = *(void *)(*((void *)&v10 + 1) + 8 * i);
        uint64_t v8 = objc_msgSend(*(id *)(*(void *)(a1 + 40) + 48), "objectForKey:", v7, (void)v10);
        uint64_t v9 = v8;
        if (v8)
        {
          [v8 invalidate];
          [*(id *)(*(void *)(a1 + 40) + 48) removeObjectForKey:v7];
        }
      }
      uint64_t v4 = [v2 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v4);
  }
}

- (void)removePendingRoutes:(id)a3
{
}

- (void)removeAllPendingRoutes
{
  id v3 = [(NSMutableSet *)self->_pendingRoutes allObjects];
  [(MPAVRoutingControllerSelectionQueue *)self removePendingRoutes:v3];
}

- (void)addPendingRoutes:(id)a3
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  objc_initWeak(&location, self);
  uint64_t v5 = (void *)MEMORY[0x1E4F77A30];
  v27[0] = MEMORY[0x1E4F143A8];
  v27[1] = 3221225472;
  v27[2] = __56__MPAVRoutingControllerSelectionQueue_addPendingRoutes___block_invoke;
  v27[3] = &unk_1E57EF050;
  objc_copyWeak(&v29, &location);
  id v6 = v4;
  id v28 = v6;
  uint64_t v7 = [v5 timerWithInterval:0 repeats:v27 block:60.0];
  uint64_t v23 = 0;
  id v24 = &v23;
  uint64_t v25 = 0x2020000000;
  char v26 = 0;
  serialQueue = self->_serialQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __56__MPAVRoutingControllerSelectionQueue_addPendingRoutes___block_invoke_445;
  block[3] = &unk_1E57F82D8;
  id v9 = v6;
  id v19 = v9;
  uint64_t v20 = self;
  id v10 = v7;
  id v21 = v10;
  BOOL v22 = &v23;
  dispatch_sync(serialQueue, block);
  id WeakRetained = objc_loadWeakRetained((id *)&self->_routingController);
  long long v12 = WeakRetained;
  if (*((unsigned char *)v24 + 24))
  {
    os_log_t v13 = os_log_create("com.apple.amp.mediaplayer", "Routing");
    if (!os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
LABEL_5:

      goto LABEL_7;
    }
    *(_DWORD *)long long buf = 138543362;
    id v32 = v9;
    long long v14 = "RCS ignoring addPendingRoute - route already pending %{public}@";
    uint64_t v15 = v13;
    uint32_t v16 = 12;
LABEL_4:
    _os_log_impl(&dword_1952E8000, v15, OS_LOG_TYPE_DEFAULT, v14, buf, v16);
    goto LABEL_5;
  }
  if (!WeakRetained)
  {
    os_log_t v13 = os_log_create("com.apple.amp.mediaplayer", "Routing");
    if (!os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_5;
    }
    *(_WORD *)long long buf = 0;
    long long v14 = "RCS addPendingRoute routing controller missing";
    uint64_t v15 = v13;
    uint32_t v16 = 2;
    goto LABEL_4;
  }
LABEL_7:
  uint64_t v17 = os_log_create("com.apple.amp.mediaplayer", "Routing");
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)long long buf = 138543362;
    id v32 = v9;
    _os_log_impl(&dword_1952E8000, v17, OS_LOG_TYPE_DEFAULT, "RCS addPendingRoute %{public}@", buf, 0xCu);
  }

  [v12 _sendDelegatePickedRoutesChanged];
  _Block_object_dispose(&v23, 8);

  objc_destroyWeak(&v29);
  objc_destroyWeak(&location);
}

void __56__MPAVRoutingControllerSelectionQueue_addPendingRoutes___block_invoke(uint64_t a1)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  id v3 = os_log_create("com.apple.amp.mediaplayer", "Routing");
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v4 = *(void *)(a1 + 32);
    int v5 = 138543362;
    uint64_t v6 = v4;
    _os_log_impl(&dword_1952E8000, v3, OS_LOG_TYPE_DEFAULT, "RCS pending route timed out %{public}@", (uint8_t *)&v5, 0xCu);
  }

  [WeakRetained removePendingRoutes:*(void *)(a1 + 32)];
}

void __56__MPAVRoutingControllerSelectionQueue_addPendingRoutes___block_invoke_445(uint64_t a1)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  id v2 = *(id *)(a1 + 32);
  uint64_t v3 = [v2 countByEnumeratingWithState:&v8 objects:v12 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v9;
    do
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v9 != v5) {
          objc_enumerationMutation(v2);
        }
        uint64_t v7 = *(void *)(*((void *)&v8 + 1) + 8 * i);
        objc_msgSend(*(id *)(*(void *)(a1 + 40) + 48), "setObject:forKey:", *(void *)(a1 + 48), v7, (void)v8);
        *(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = [*(id *)(*(void *)(a1 + 40) + 32) containsObject:v7];
        [*(id *)(*(void *)(a1 + 40) + 32) addObject:v7];
      }
      uint64_t v4 = [v2 countByEnumeratingWithState:&v8 objects:v12 count:16];
    }
    while (v4);
  }
}

- (BOOL)routeIsPendingPick:(id)a3
{
  id v4 = a3;
  uint64_t v11 = 0;
  long long v12 = &v11;
  uint64_t v13 = 0x2020000000;
  char v14 = 0;
  serialQueue = self->_serialQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __58__MPAVRoutingControllerSelectionQueue_routeIsPendingPick___block_invoke;
  block[3] = &unk_1E57F9F48;
  void block[4] = self;
  id v9 = v4;
  long long v10 = &v11;
  id v6 = v4;
  dispatch_sync(serialQueue, block);
  LOBYTE(serialQueue) = *((unsigned char *)v12 + 24);

  _Block_object_dispose(&v11, 8);
  return (char)serialQueue;
}

void __58__MPAVRoutingControllerSelectionQueue_routeIsPendingPick___block_invoke(void *a1)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  long long v9 = 0u;
  long long v10 = 0u;
  long long v7 = 0u;
  long long v8 = 0u;
  id v2 = *(id *)(a1[4] + 32);
  uint64_t v3 = [v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v8;
    while (2)
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v8 != v5) {
          objc_enumerationMutation(v2);
        }
        if (objc_msgSend(*(id *)(*((void *)&v7 + 1) + 8 * i), "isEqual:", a1[5], (void)v7))
        {
          *(unsigned char *)(*(void *)(a1[6] + 8) + 24) = 1;
          goto LABEL_11;
        }
      }
      uint64_t v4 = [v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
      if (v4) {
        continue;
      }
      break;
    }
  }
LABEL_11:
}

- (NSSet)pendingPickedRoutes
{
  uint64_t v6 = 0;
  long long v7 = &v6;
  uint64_t v8 = 0x3032000000;
  long long v9 = __Block_byref_object_copy__9235;
  long long v10 = __Block_byref_object_dispose__9236;
  id v11 = 0;
  serialQueue = self->_serialQueue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __58__MPAVRoutingControllerSelectionQueue_pendingPickedRoutes__block_invoke;
  v5[3] = &unk_1E57F9F20;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(serialQueue, v5);
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return (NSSet *)v3;
}

void __58__MPAVRoutingControllerSelectionQueue_pendingPickedRoutes__block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(*(void *)(a1 + 32) + 32) copy];
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
  uint64_t v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;
}

- (MPAVRoute)pendingPickedRoute
{
  uint64_t v6 = 0;
  long long v7 = &v6;
  uint64_t v8 = 0x3032000000;
  long long v9 = __Block_byref_object_copy__9235;
  long long v10 = __Block_byref_object_dispose__9236;
  id v11 = 0;
  serialQueue = self->_serialQueue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __57__MPAVRoutingControllerSelectionQueue_pendingPickedRoute__block_invoke;
  v5[3] = &unk_1E57F9F20;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(serialQueue, v5);
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return (MPAVRoute *)v3;
}

void __57__MPAVRoutingControllerSelectionQueue_pendingPickedRoute__block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(*(void *)(a1 + 32) + 32) anyObject];
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
  uint64_t v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;
}

- (BOOL)hasPendingRoutes
{
  uint64_t v6 = 0;
  long long v7 = &v6;
  uint64_t v8 = 0x2020000000;
  char v9 = 0;
  serialQueue = self->_serialQueue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __55__MPAVRoutingControllerSelectionQueue_hasPendingRoutes__block_invoke;
  v5[3] = &unk_1E57F9F20;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(serialQueue, v5);
  char v3 = *((unsigned char *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __55__MPAVRoutingControllerSelectionQueue_hasPendingRoutes__block_invoke(uint64_t a1)
{
  uint64_t result = [*(id *)(*(void *)(a1 + 32) + 32) count];
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = result != 0;
  return result;
}

- (void)enqueueSelectionOperation:(int64_t)a3 forRoutes:(id)a4 completion:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  long long v10 = [[MPAVRoutingControllerSelection alloc] initWithRoutes:v9 selectionOperation:a3];

  [(MPAVRoutingControllerSelection *)v10 setCompletion:v8];
  [(MPAVRoutingControllerSelectionQueue *)self _enqueue:v10];
}

- (void)cancelInProgressSelectionForRoute:(id)a3
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v18 = 0;
  id v19 = &v18;
  uint64_t v20 = 0x3032000000;
  id v21 = __Block_byref_object_copy__9235;
  BOOL v22 = __Block_byref_object_dispose__9236;
  id v23 = 0;
  serialQueue = self->_serialQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __73__MPAVRoutingControllerSelectionQueue_cancelInProgressSelectionForRoute___block_invoke;
  block[3] = &unk_1E57F9F20;
  void block[4] = self;
  void block[5] = &v18;
  dispatch_sync(serialQueue, block);
  if (v19[5])
  {
    uint64_t v6 = os_log_create("com.apple.amp.mediaplayer", "Routing");
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v7 = v19[5];
      *(_DWORD *)long long buf = 138543362;
      uint64_t v27 = v7;
      _os_log_impl(&dword_1952E8000, v6, OS_LOG_TYPE_DEFAULT, "RCS cancelling in-progress selection %{public}@", buf, 0xCu);
    }

    id v8 = [(id)v19[5] completion];
    BOOL v9 = v8 == 0;

    if (!v9)
    {
      long long v10 = [(id)v19[5] completion];
      id v11 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v24 = *MEMORY[0x1E4F28228];
      uint64_t v25 = @"Route selection cancelled by MPAVRoutingController cancelInProgressSelectionForRoute:";
      uint64_t v12 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v25 forKeys:&v24 count:1];
      uint64_t v13 = [v11 errorWithDomain:@"MPAVRoutingControllerErrorDomain" code:6 userInfo:v12];
      ((void (**)(void, void *))v10)[2](v10, v13);
    }
    [(id)v19[5] setCompletion:0];
    char v14 = self->_serialQueue;
    v16[0] = MEMORY[0x1E4F143A8];
    v16[1] = 3221225472;
    v16[2] = __73__MPAVRoutingControllerSelectionQueue_cancelInProgressSelectionForRoute___block_invoke_442;
    v16[3] = &unk_1E57F9EA8;
    v16[4] = self;
    dispatch_sync(v14, v16);
    uint64_t v15 = [(id)v19[5] routes];
    [(MPAVRoutingControllerSelectionQueue *)self removePendingRoutes:v15];

    [(MPAVRoutingControllerSelectionQueue *)self _dequeue];
  }
  _Block_object_dispose(&v18, 8);
}

void __73__MPAVRoutingControllerSelectionQueue_cancelInProgressSelectionForRoute___block_invoke(uint64_t a1)
{
}

void __73__MPAVRoutingControllerSelectionQueue_cancelInProgressSelectionForRoute___block_invoke_442(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  uint64_t v2 = *(void **)(v1 + 24);
  *(void *)(v1 + 24) = 0;
}

@end