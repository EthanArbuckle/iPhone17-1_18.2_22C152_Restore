@interface HFMediaValueManager
- (BOOL)hasPendingWrites;
- (BOOL)hasPendingWritesForRouteID:(id)a3;
- (HFMediaProfileContainer)mediaProfileContainer;
- (HFMediaValueManager)init;
- (HFMediaValueManager)initWithMediaProfileContainer:(id)a3;
- (NSError)cachedPlaybackStateWriteError;
- (NSMutableArray)transactionStack;
- (id)cachedPlaybackStateWriteErrorForRouteID:(id)a3;
- (id)mediaProfileContainerForRouteID:(id)a3;
- (id)writePlaybackState:(int64_t)a3 playbackArchive:(id)a4 forRouteID:(id)a5;
- (int64_t)lastPlaybackStateForProfileForRouteID:(id)a3;
- (void)_notifyDelegatesDidUpdatePlaybackState:(int64_t)a3 mediaSession:(id)a4;
- (void)_notifyDelegatesFailedToUpdatePlaybackStateWithError:(id)a3 mediaSession:(id)a4;
- (void)_notifyDelegatesWillUpdatePlaybackState:(int64_t)a3 mediaSession:(id)a4;
- (void)_updateCachedPlaybackStateWriteError:(id)a3 operationType:(id)a4 notifyDelegates:(BOOL)a5;
- (void)_updateLastPlaybackState:(int64_t)a3 sender:(SEL)a4 notifyWillUpdate:(BOOL)a5 notifyDidUpdate:(BOOL)a6;
- (void)clearCachedPlaybackStateWriteErrorWithReason:(id)a3 notifyDelegates:(BOOL)a4;
- (void)mediaObject:(id)a3 didUpdateMediaSession:(id)a4;
- (void)mediaSession:(id)a3 didUpdatePlaybackState:(int64_t)a4;
- (void)setCachedPlaybackStateWriteError:(id)a3;
- (void)setTransactionStack:(id)a3;
@end

@implementation HFMediaValueManager

- (HFMediaValueManager)initWithMediaProfileContainer:(id)a3
{
  id v5 = a3;
  if (!v5)
  {
    v13 = [MEMORY[0x263F08690] currentHandler];
    [v13 handleFailureInMethod:a2, self, @"HFMediaValueManager.m", 64, @"Invalid parameter not satisfying: %@", @"mediaProfileContainer" object file lineNumber description];
  }
  v14.receiver = self;
  v14.super_class = (Class)HFMediaValueManager;
  v6 = [(HFMediaValueManager *)&v14 init];
  v7 = v6;
  if (v6)
  {
    objc_storeWeak((id *)&v6->_mediaProfileContainer, v5);
    uint64_t v8 = objc_opt_new();
    transactionStack = v7->_transactionStack;
    v7->_transactionStack = (NSMutableArray *)v8;

    v10 = +[HFHomeKitDispatcher sharedDispatcher];
    [v10 addMediaSessionObserver:v7];

    v11 = +[HFHomeKitDispatcher sharedDispatcher];
    [v11 addMediaObjectObserver:v7];
  }
  return v7;
}

- (HFMediaValueManager)init
{
  v4 = [MEMORY[0x263F08690] currentHandler];
  id v5 = NSStringFromSelector(sel_initWithMediaProfileContainer_);
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"HFMediaValueManager.m", 79, @"%s is unavailable; use %@ instead",
    "-[HFMediaValueManager init]",
    v5);

  return 0;
}

- (BOOL)hasPendingWritesForRouteID:(id)a3
{
  if (!a3) {
    return 0;
  }
  id v4 = a3;
  id v5 = [(HFMediaValueManager *)self mediaProfileContainer];
  v6 = objc_msgSend(v5, "hf_mediaRouteIdentifier");
  int v7 = [v6 isEqualToString:v4];

  if (v7)
  {
    if ([v5 isContainedWithinItemGroup])
    {
      uint64_t v8 = objc_msgSend(v5, "hf_home");
      v9 = objc_msgSend(v5, "hf_backingAccessory");
      v10 = objc_msgSend(v8, "hf_mediaSystemForAccessory:", v9);

      v11 = objc_msgSend(v10, "hf_mediaValueSource");
      v12 = objc_msgSend(v10, "hf_mediaRouteIdentifier");
      char v13 = [v11 hasPendingWritesForRouteID:v12];
    }
    else
    {
      v10 = [(HFMediaValueManager *)self transactionStack];
      char v13 = [v10 count] != 0;
    }
  }
  else
  {
    char v13 = 0;
  }

  return v13;
}

- (int64_t)lastPlaybackStateForProfileForRouteID:(id)a3
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  if (!a3) {
    return 0;
  }
  id v4 = a3;
  id v5 = [(HFMediaValueManager *)self mediaProfileContainer];
  v6 = objc_msgSend(v5, "hf_mediaRouteIdentifier");
  int v7 = [v6 isEqualToString:v4];

  if (v7)
  {
    if ([v5 isContainedWithinItemGroup])
    {
      uint64_t v8 = objc_msgSend(v5, "hf_home");
      v9 = objc_msgSend(v5, "hf_backingAccessory");
      v10 = objc_msgSend(v8, "hf_mediaSystemForAccessory:", v9);

      v11 = objc_msgSend(v10, "hf_mediaValueSource");
      v12 = objc_msgSend(v10, "hf_mediaRouteIdentifier");
      uint64_t v13 = [v11 lastPlaybackStateForProfileForRouteID:v12];
    }
    else
    {
      objc_super v14 = [v5 mediaSession];
      uint64_t v13 = [v14 playbackState];
      v15 = HFLogForCategory(0x3AuLL);
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
      {
        v16 = NSStringFromHMMediaPlaybackState(v13);
        int v18 = 138412802;
        v19 = v5;
        __int16 v20 = 2112;
        v21 = v14;
        __int16 v22 = 2112;
        v23 = v16;
        _os_log_impl(&dword_20B986000, v15, OS_LOG_TYPE_DEFAULT, "--> Reading Last Known Media Playback Value for %@/%@ (%@)", (uint8_t *)&v18, 0x20u);
      }
    }
  }
  else
  {
    uint64_t v13 = 0;
  }

  return v13;
}

- (id)writePlaybackState:(int64_t)a3 playbackArchive:(id)a4 forRouteID:(id)a5
{
  uint64_t v46 = *MEMORY[0x263EF8340];
  id v38 = a4;
  id v9 = a5;
  if (v9)
  {
    SEL v35 = a2;
    v10 = [(HFMediaValueManager *)self mediaProfileContainer];
    v36 = [v10 mediaSession];
    v11 = HFOperationMediaAccessoryPlay;
    if (a3 != 1) {
      v11 = HFOperationMediaAccessoryPause;
    }
    v37 = *v11;
    if (v10)
    {
      v12 = objc_msgSend(v10, "hf_mediaRouteIdentifier");
      char v13 = [v12 isEqualToString:v9];

      if (v13)
      {
        if (v36)
        {
          objc_super v14 = [(HFMediaValueManager *)self mediaProfileContainer];
          v15 = [v14 accessories];

          if (objc_msgSend(v15, "na_any:", &__block_literal_global_67))
          {
            v16 = HFLogForCategory(0x3AuLL);
            if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
            {
              *(_WORD *)location = 0;
              _os_log_error_impl(&dword_20B986000, v16, OS_LOG_TYPE_ERROR, "isUpdatingSoftware is true", location, 2u);
            }

            v17 = objc_msgSend(MEMORY[0x263F087E8], "hf_errorWithCode:operation:options:", 23, v37, 0);
          }
          else
          {
            v17 = 0;
          }

          goto LABEL_22;
        }
        __int16 v22 = HFLogForCategory(0x3AuLL);
        if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
        {
          *(_WORD *)location = 0;
          _os_log_error_impl(&dword_20B986000, v22, OS_LOG_TYPE_ERROR, "mediaSession is nil", location, 2u);
        }

        uint64_t v20 = objc_msgSend(MEMORY[0x263F087E8], "hf_errorWithCode:operation:options:", 24, v37, 0);
      }
      else
      {
        v21 = HFLogForCategory(0x3AuLL);
        if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
        {
          v34 = objc_msgSend(v10, "hf_mediaRouteIdentifier");
          *(_DWORD *)location = 138412546;
          *(void *)&location[4] = v34;
          __int16 v44 = 2112;
          id v45 = v9;
          _os_log_error_impl(&dword_20B986000, v21, OS_LOG_TYPE_ERROR, "route identifier mismatch: mediaProfileContainer.hf_mediaRouteIdentifier: %@ routeID: %@", location, 0x16u);
        }
        uint64_t v20 = objc_msgSend(MEMORY[0x263F087E8], "hf_errorWithCode:operation:options:", 23, v37, 0);
      }
    }
    else
    {
      v19 = HFLogForCategory(0x3AuLL);
      if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)location = 0;
        _os_log_error_impl(&dword_20B986000, v19, OS_LOG_TYPE_ERROR, "mediaProfileContainer is nil", location, 2u);
      }

      uint64_t v20 = objc_msgSend(MEMORY[0x263F087E8], "hf_errorWithCode:operation:options:", 23, v37, 0);
    }
    v17 = (void *)v20;
LABEL_22:
    if (v17)
    {
      [(HFMediaValueManager *)self _updateCachedPlaybackStateWriteError:v17 operationType:@"HFMediaValueManager.writePlaybackState.preflight" notifyDelegates:1];
      int v18 = [MEMORY[0x263F58190] futureWithError:v17];
    }
    else
    {
      v23 = objc_opt_new();
      [v23 setPlaybackState:a3];
      uint64_t v24 = [(HFMediaValueManager *)self transactionStack];
      [v24 addObject:v23];

      v25 = [(HFMediaValueManager *)self lastPlaybackStateForProfileForRouteID:v9];
      [(HFMediaValueManager *)self _notifyDelegatesWillUpdatePlaybackState:v25 mediaSession:v36];
      objc_initWeak((id *)location, self);
      v26 = [(HFMediaValueManager *)self mediaProfileContainer];
      v27 = objc_msgSend(v26, "hf_home");
      v28 = objc_msgSend(v27, "hf_characteristicValueManager");

      v29 = (void *)MEMORY[0x263F58190];
      v39[0] = MEMORY[0x263EF8330];
      v39[1] = 3221225472;
      v39[2] = __69__HFMediaValueManager_writePlaybackState_playbackArchive_forRouteID___block_invoke_55;
      v39[3] = &unk_264092910;
      v39[4] = self;
      v42[1] = (id)a3;
      v42[2] = v25;
      id v30 = v23;
      id v40 = v30;
      id v31 = v28;
      id v41 = v31;
      objc_copyWeak(v42, (id *)location);
      v42[3] = (id)v35;
      v32 = [v29 futureWithBlock:v39];
      [v30 setWriteFuture:v32];

      int v18 = [v30 writeFuture];
      objc_destroyWeak(v42);

      objc_destroyWeak((id *)location);
    }

    goto LABEL_26;
  }
  int v18 = [MEMORY[0x263F58190] futureWithNoResult];
LABEL_26:

  return v18;
}

uint64_t __69__HFMediaValueManager_writePlaybackState_playbackArchive_forRouteID___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "hf_isSoftwareUpdateInProgress");
}

void __69__HFMediaValueManager_writePlaybackState_playbackArchive_forRouteID___block_invoke_55(uint64_t a1, void *a2)
{
  uint64_t v37 = *MEMORY[0x263EF8340];
  id v3 = a2;
  id v4 = objc_alloc(MEMORY[0x263F0E510]);
  id v5 = [*(id *)(a1 + 32) mediaProfileContainer];
  v6 = [v5 mediaProfiles];
  int v7 = (void *)[v4 initWithMediaProfiles:v6 playbackState:*(void *)(a1 + 64) volume:0 playbackArchive:0];

  uint64_t v8 = HFLogForCategory(0x3AuLL);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    id v9 = [*(id *)(a1 + 32) mediaProfileContainer];
    v10 = NSStringFromHMMediaPlaybackState(*(void *)(a1 + 72));
    v11 = NSStringFromHMMediaPlaybackState(*(void *)(a1 + 64));
    v12 = [*(id *)(a1 + 40) transactionNumber];
    *(_DWORD *)buf = 138413058;
    id v30 = v9;
    __int16 v31 = 2112;
    v32 = v10;
    __int16 v33 = 2112;
    v34 = v11;
    __int16 v35 = 2112;
    v36 = v12;
    _os_log_impl(&dword_20B986000, v8, OS_LOG_TYPE_DEFAULT, "--> Starting media value write transaction session %@: from %@ -> %@  (Transaction ID %@)", buf, 0x2Au);
  }
  [*(id *)(a1 + 48) beginTransactionWithReason:@"HFMediaValueManagerTransactionReasonActionExecution"];
  char v13 = *(void **)(a1 + 48);
  objc_super v14 = [MEMORY[0x263EFFA08] setWithObject:v7];
  v15 = [v13 executeActions:v14];
  uint64_t v20 = MEMORY[0x263EF8330];
  uint64_t v21 = 3221225472;
  __int16 v22 = __69__HFMediaValueManager_writePlaybackState_playbackArchive_forRouteID___block_invoke_58;
  v23 = &unk_2640928E8;
  objc_copyWeak(&v26, (id *)(a1 + 56));
  int8x16_t v27 = vextq_s8(*(int8x16_t *)(a1 + 64), *(int8x16_t *)(a1 + 64), 8uLL);
  id v16 = *(id *)(a1 + 40);
  uint64_t v17 = *(void *)(a1 + 80);
  id v24 = v16;
  uint64_t v28 = v17;
  id v18 = v3;
  id v25 = v18;
  id v19 = (id)[v15 addCompletionBlock:&v20];

  objc_msgSend(*(id *)(a1 + 48), "commitTransactionWithReason:", @"HFMediaValueManagerTransactionReasonActionExecution", v20, v21, v22, v23);
  objc_destroyWeak(&v26);
}

void __69__HFMediaValueManager_writePlaybackState_playbackArchive_forRouteID___block_invoke_58(uint64_t a1, void *a2, void *a3)
{
  uint64_t v28 = *MEMORY[0x263EF8340];
  id v5 = a3;
  id v6 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  uint64_t v8 = WeakRetained;
  if (v5)
  {
    id v9 = HFLogForCategory(0x3AuLL);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      v10 = [v8 mediaProfileContainer];
      v11 = NSStringFromHMMediaPlaybackState(*(void *)(a1 + 56));
      v12 = NSStringFromHMMediaPlaybackState(*(void *)(a1 + 64));
      char v13 = [*(id *)(a1 + 32) transactionNumber];
      int v20 = 138413058;
      uint64_t v21 = v10;
      __int16 v22 = 2112;
      v23 = v11;
      __int16 v24 = 2112;
      id v25 = v12;
      __int16 v26 = 2112;
      int8x16_t v27 = v13;
      _os_log_impl(&dword_20B986000, v9, OS_LOG_TYPE_DEFAULT, "--> Failed media write transaction for session %@: %@ -> %@  (Transaction ID %@)", (uint8_t *)&v20, 0x2Au);
    }
    [v8 _updateCachedPlaybackStateWriteError:v5 operationType:@"HFMediaValueManager.writePlaybackState" notifyDelegates:1];
  }
  else
  {
    [WeakRetained clearCachedPlaybackStateWriteErrorWithReason:@"Successfully changed playback state" notifyDelegates:0];
    [v8 _updateLastPlaybackState:*(void *)(a1 + 64) sender:*(void *)(a1 + 72) notifyWillUpdate:0 notifyDidUpdate:1];
  }
  objc_super v14 = HFLogForCategory(0x3AuLL);
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    v15 = [v8 mediaProfileContainer];
    id v16 = NSStringFromHMMediaPlaybackState(*(void *)(a1 + 56));
    uint64_t v17 = NSStringFromHMMediaPlaybackState(*(void *)(a1 + 64));
    id v18 = [*(id *)(a1 + 32) transactionNumber];
    int v20 = 138413058;
    uint64_t v21 = v15;
    __int16 v22 = 2112;
    v23 = v16;
    __int16 v24 = 2112;
    id v25 = v17;
    __int16 v26 = 2112;
    int8x16_t v27 = v18;
    _os_log_impl(&dword_20B986000, v14, OS_LOG_TYPE_DEFAULT, "--> Finished media write transaction for session %@: %@ -> %@  (Transaction ID %@)", (uint8_t *)&v20, 0x2Au);
  }
  id v19 = [v8 transactionStack];
  [v19 removeObject:*(void *)(a1 + 32)];

  [*(id *)(a1 + 40) finishWithResult:v6 error:v5];
}

- (id)cachedPlaybackStateWriteErrorForRouteID:(id)a3
{
  if (a3)
  {
    id v4 = a3;
    id v5 = [(HFMediaValueManager *)self mediaProfileContainer];
    id v6 = objc_msgSend(v5, "hf_mediaRouteIdentifier");
    int v7 = [v6 isEqualToString:v4];

    if (v7)
    {
      uint64_t v8 = [(HFMediaValueManager *)self cachedPlaybackStateWriteError];
    }
    else
    {
      uint64_t v8 = 0;
    }
  }
  else
  {
    uint64_t v8 = 0;
  }
  return v8;
}

- (id)mediaProfileContainerForRouteID:(id)a3
{
  if (a3)
  {
    id v4 = a3;
    id v5 = [(HFMediaValueManager *)self mediaProfileContainer];
    id v6 = objc_msgSend(v5, "hf_mediaRouteIdentifier");
    int v7 = [v6 isEqualToString:v4];

    if (v7) {
      id v8 = v5;
    }
    else {
      id v8 = 0;
    }
  }
  else
  {
    id v8 = 0;
  }
  return v8;
}

- (void)clearCachedPlaybackStateWriteErrorWithReason:(id)a3 notifyDelegates:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v6 = a3;
  if (self->_cachedPlaybackStateWriteError)
  {
    int v7 = HFLogForCategory(0x3AuLL);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      id v8 = [(HFMediaValueManager *)self mediaProfileContainer];
      int v15 = 138412546;
      id v16 = v8;
      __int16 v17 = 2112;
      id v18 = v6;
      _os_log_impl(&dword_20B986000, v7, OS_LOG_TYPE_DEFAULT, "Clearing cachedPlaybackStateWriteError for profile '%@'; Reason: '%@'",
        (uint8_t *)&v15,
        0x16u);
    }
    cachedPlaybackStateWriteError = self->_cachedPlaybackStateWriteError;
    self->_cachedPlaybackStateWriteError = 0;

    if (v4)
    {
      v10 = [(HFMediaValueManager *)self mediaProfileContainer];
      v11 = objc_msgSend(v10, "hf_mediaRouteIdentifier");
      int64_t v12 = [(HFMediaValueManager *)self lastPlaybackStateForProfileForRouteID:v11];

      char v13 = [(HFMediaValueManager *)self mediaProfileContainer];
      objc_super v14 = [v13 mediaSession];
      [(HFMediaValueManager *)self _notifyDelegatesDidUpdatePlaybackState:v12 mediaSession:v14];
    }
  }
}

- (void)mediaSession:(id)a3 didUpdatePlaybackState:(int64_t)a4
{
  id v7 = a3;
  id v8 = [(HFMediaValueManager *)self mediaProfileContainer];
  id v9 = [v8 mediaSession];
  int v10 = [v7 isEqual:v9];

  if (v10)
  {
    [(HFMediaValueManager *)self _updateLastPlaybackState:a4 sender:a2 notifyWillUpdate:0 notifyDidUpdate:0];
    [(HFMediaValueManager *)self clearCachedPlaybackStateWriteErrorWithReason:@"Playback State update" notifyDelegates:1];
  }
}

- (void)mediaObject:(id)a3 didUpdateMediaSession:(id)a4
{
  id v9 = a3;
  id v6 = [(HFMediaValueManager *)self mediaProfileContainer];
  int v7 = [v9 isEqual:v6];

  if (v7)
  {
    id v8 = [v9 mediaSession];
    -[HFMediaValueManager _updateLastPlaybackState:sender:notifyWillUpdate:notifyDidUpdate:](self, "_updateLastPlaybackState:sender:notifyWillUpdate:notifyDidUpdate:", [v8 playbackState], a2, 0, 0);

    [(HFMediaValueManager *)self clearCachedPlaybackStateWriteErrorWithReason:@"Media Session update" notifyDelegates:1];
  }
}

- (void)_updateCachedPlaybackStateWriteError:(id)a3 operationType:(id)a4 notifyDelegates:(BOOL)a5
{
  BOOL v5 = a5;
  id v13 = a3;
  objc_storeStrong((id *)&self->_cachedPlaybackStateWriteError, a3);
  id v9 = a4;
  int v10 = +[HFErrorHandler sharedHandler];
  [v10 logError:v13 operationDescription:v9];

  if (v5)
  {
    v11 = [(HFMediaValueManager *)self mediaProfileContainer];
    int64_t v12 = [v11 mediaSession];
    [(HFMediaValueManager *)self _notifyDelegatesFailedToUpdatePlaybackStateWithError:v13 mediaSession:v12];
  }
}

- (void)_updateLastPlaybackState:(int64_t)a3 sender:(SEL)a4 notifyWillUpdate:(BOOL)a5 notifyDidUpdate:(BOOL)a6
{
  BOOL v6 = a6;
  BOOL v7 = a5;
  uint64_t v23 = *MEMORY[0x263EF8340];
  dispatch_assert_queue_V2(MEMORY[0x263EF83A0]);
  if (![(HFMediaValueManager *)self hasPendingWrites])
  {
    v11 = [(HFMediaValueManager *)self mediaProfileContainer];
    int64_t v12 = [v11 mediaSession];
    if (v7) {
      [(HFMediaValueManager *)self _notifyDelegatesWillUpdatePlaybackState:a3 mediaSession:v12];
    }
    id v13 = HFLogForCategory(0x3AuLL);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      objc_super v14 = [(HFMediaValueManager *)self mediaProfileContainer];
      int v15 = NSStringFromHMMediaPlaybackState(a3);
      id v16 = NSStringFromSelector(a4);
      int v17 = 138412802;
      id v18 = v14;
      __int16 v19 = 2112;
      int v20 = v15;
      __int16 v21 = 2112;
      __int16 v22 = v16;
      _os_log_impl(&dword_20B986000, v13, OS_LOG_TYPE_DEFAULT, "--> Updating last playback state for profile %@ --> %@ (Update sent from %@)", (uint8_t *)&v17, 0x20u);
    }
    if (v6) {
      [(HFMediaValueManager *)self _notifyDelegatesDidUpdatePlaybackState:a3 mediaSession:v12];
    }
  }
}

- (void)_notifyDelegatesDidUpdatePlaybackState:(int64_t)a3 mediaSession:(id)a4
{
  id v6 = a4;
  dispatch_assert_queue_V2(MEMORY[0x263EF83A0]);
  BOOL v7 = +[HFHomeKitDispatcher sharedDispatcher];
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __75__HFMediaValueManager__notifyDelegatesDidUpdatePlaybackState_mediaSession___block_invoke;
  v9[3] = &unk_264092938;
  id v10 = v6;
  int64_t v11 = a3;
  id v8 = v6;
  [v7 dispatchMediaSessionObserverMessage:v9 sender:self];
}

void __75__HFMediaValueManager__notifyDelegatesDidUpdatePlaybackState_mediaSession___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (objc_opt_respondsToSelector()) {
    [v3 mediaSession:*(void *)(a1 + 32) didUpdatePlaybackState:*(void *)(a1 + 40)];
  }
}

- (void)_notifyDelegatesWillUpdatePlaybackState:(int64_t)a3 mediaSession:(id)a4
{
  id v6 = a4;
  dispatch_assert_queue_V2(MEMORY[0x263EF83A0]);
  BOOL v7 = +[HFHomeKitDispatcher sharedDispatcher];
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __76__HFMediaValueManager__notifyDelegatesWillUpdatePlaybackState_mediaSession___block_invoke;
  v9[3] = &unk_264092938;
  id v10 = v6;
  int64_t v11 = a3;
  id v8 = v6;
  [v7 dispatchMediaSessionObserverMessage:v9 sender:self];
}

void __76__HFMediaValueManager__notifyDelegatesWillUpdatePlaybackState_mediaSession___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (objc_opt_respondsToSelector()) {
    [v3 mediaSession:*(void *)(a1 + 32) willUpdatePlaybackState:*(void *)(a1 + 40)];
  }
}

- (void)_notifyDelegatesFailedToUpdatePlaybackStateWithError:(id)a3 mediaSession:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  dispatch_assert_queue_V2(MEMORY[0x263EF83A0]);
  id v8 = +[HFHomeKitDispatcher sharedDispatcher];
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __89__HFMediaValueManager__notifyDelegatesFailedToUpdatePlaybackStateWithError_mediaSession___block_invoke;
  v11[3] = &unk_264092960;
  id v12 = v7;
  id v13 = v6;
  id v9 = v6;
  id v10 = v7;
  [v8 dispatchMediaSessionObserverMessage:v11 sender:self];
}

void __89__HFMediaValueManager__notifyDelegatesFailedToUpdatePlaybackStateWithError_mediaSession___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (objc_opt_respondsToSelector()) {
    [v3 mediaSession:*(void *)(a1 + 32) failedToUpdatePlaybackStateWithError:*(void *)(a1 + 40)];
  }
}

- (HFMediaProfileContainer)mediaProfileContainer
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_mediaProfileContainer);
  return (HFMediaProfileContainer *)WeakRetained;
}

- (BOOL)hasPendingWrites
{
  return self->_hasPendingWrites;
}

- (NSMutableArray)transactionStack
{
  return self->_transactionStack;
}

- (void)setTransactionStack:(id)a3
{
}

- (NSError)cachedPlaybackStateWriteError
{
  return self->_cachedPlaybackStateWriteError;
}

- (void)setCachedPlaybackStateWriteError:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cachedPlaybackStateWriteError, 0);
  objc_storeStrong((id *)&self->_transactionStack, 0);
  objc_destroyWeak((id *)&self->_mediaProfileContainer);
}

@end