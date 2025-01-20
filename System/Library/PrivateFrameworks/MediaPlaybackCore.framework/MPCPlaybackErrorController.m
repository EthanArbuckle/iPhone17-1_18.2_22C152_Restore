@interface MPCPlaybackErrorController
- (BOOL)canHandleFirstItemFailure;
- (BOOL)isAssetUnavailableFailure:(id)a3;
- (BOOL)isFirstItemFailure:(id)a3 item:(id)a4;
- (BOOL)isLeaseTakenError:(id)a3;
- (BOOL)isQueueLoadingFailure:(id)a3;
- (BOOL)isUnrecoverableAssetLoadingError:(id)a3;
- (BOOL)itemsHavePlayed;
- (BOOL)shouldHandleFirstItemFailure:(id)a3 item:(id)a4;
- (MPAVItem)lastItemUsedForErrorResolution;
- (MPCExternalPlaybackRouter)externalPlaybackRouter;
- (MPCMediaFoundationTranslator)translator;
- (MPCPlaybackEngine)playbackEngine;
- (MPCPlaybackErrorController)initWithPlaybackEngine:(id)a3 translator:(id)a4 externalPlaybackRouter:(id)a5;
- (NSMutableSet)failedItemsIdentifiers;
- (NSString)preferredFirstContentItemID;
- (int64_t)_resolutionForPlaybackError:(id)a3 item:(id)a4;
- (int64_t)contiguousFailSilentlyResolutionCount;
- (void)_notifyObserversForError:(id)a3 item:(id)a4;
- (void)_playbackFailedWithError:(id)a3 item:(id)a4 canResolve:(BOOL)a5 proposedResolution:(int64_t)a6 completion:(id)a7;
- (void)reportCriticalError:(id)a3 forItem:(id)a4;
- (void)resetWithReason:(id)a3;
- (void)resolveError:(id)a3 forItem:(id)a4 completion:(id)a5;
- (void)setContiguousFailSilentlyResolutionCount:(int64_t)a3;
- (void)setExternalPlaybackRouter:(id)a3;
- (void)setFailedItemsIdentifiers:(id)a3;
- (void)setItemsHavePlayed:(BOOL)a3;
- (void)setLastItemUsedForErrorResolution:(id)a3;
- (void)setPlaybackEngine:(id)a3;
- (void)setPreferredFirstContentItemID:(id)a3;
@end

@implementation MPCPlaybackErrorController

- (MPCPlaybackErrorController)initWithPlaybackEngine:(id)a3 translator:(id)a4 externalPlaybackRouter:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v16.receiver = self;
  v16.super_class = (Class)MPCPlaybackErrorController;
  v11 = [(MPCPlaybackErrorController *)&v16 init];
  v12 = v11;
  if (v11)
  {
    objc_storeWeak((id *)&v11->_playbackEngine, v8);
    objc_storeStrong((id *)&v12->_translator, a4);
    v13 = (NSMutableSet *)objc_alloc_init(MEMORY[0x263EFF9C0]);
    failedItemsIdentifiers = v12->_failedItemsIdentifiers;
    v12->_failedItemsIdentifiers = v13;

    objc_storeStrong((id *)&v12->_externalPlaybackRouter, a5);
  }

  return v12;
}

- (void)setContiguousFailSilentlyResolutionCount:(int64_t)a3
{
  self->_contiguousFailSilentlyResolutionCount = a3;
}

- (void)resetWithReason:(id)a3
{
  [(MPCPlaybackErrorController *)self setItemsHavePlayed:0];
  [(MPCPlaybackErrorController *)self setPreferredFirstContentItemID:0];
  [(MPCPlaybackErrorController *)self setLastItemUsedForErrorResolution:0];
  v4 = [(MPCPlaybackErrorController *)self failedItemsIdentifiers];
  [v4 removeAllObjects];

  [(MPCPlaybackErrorController *)self setContiguousFailSilentlyResolutionCount:0];
}

- (void)setPreferredFirstContentItemID:(id)a3
{
}

- (void)setLastItemUsedForErrorResolution:(id)a3
{
}

- (void)setItemsHavePlayed:(BOOL)a3
{
  self->_itemsHavePlayed = a3;
  if (a3) {
    [(MPCPlaybackErrorController *)self setContiguousFailSilentlyResolutionCount:0];
  }
}

- (NSMutableSet)failedItemsIdentifiers
{
  return self->_failedItemsIdentifiers;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lastItemUsedForErrorResolution, 0);
  objc_storeStrong((id *)&self->_externalPlaybackRouter, 0);
  objc_storeStrong((id *)&self->_failedItemsIdentifiers, 0);
  objc_storeStrong((id *)&self->_translator, 0);
  objc_destroyWeak((id *)&self->_playbackEngine);

  objc_storeStrong((id *)&self->preferredFirstContentItemID, 0);
}

- (int64_t)contiguousFailSilentlyResolutionCount
{
  return self->_contiguousFailSilentlyResolutionCount;
}

- (MPAVItem)lastItemUsedForErrorResolution
{
  return self->_lastItemUsedForErrorResolution;
}

- (void)setExternalPlaybackRouter:(id)a3
{
}

- (MPCExternalPlaybackRouter)externalPlaybackRouter
{
  return self->_externalPlaybackRouter;
}

- (void)setFailedItemsIdentifiers:(id)a3
{
}

- (MPCMediaFoundationTranslator)translator
{
  return self->_translator;
}

- (void)setPlaybackEngine:(id)a3
{
}

- (MPCPlaybackEngine)playbackEngine
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_playbackEngine);

  return (MPCPlaybackEngine *)WeakRetained;
}

- (NSString)preferredFirstContentItemID
{
  return self->preferredFirstContentItemID;
}

- (BOOL)isLeaseTakenError:(id)a3
{
  return objc_msgSend(a3, "mpc_isLeaseTakenError");
}

- (BOOL)shouldHandleFirstItemFailure:(id)a3 item:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if ([(MPCPlaybackErrorController *)self canHandleFirstItemFailure]
    && ([(MPCPlaybackErrorController *)self isFirstItemFailure:v6 item:v7]
     || [(MPCPlaybackErrorController *)self isQueueLoadingFailure:v6]))
  {
    BOOL v8 = ![(MPCPlaybackErrorController *)self isAssetUnavailableFailure:v6];
  }
  else
  {
    LOBYTE(v8) = 0;
  }

  return v8;
}

- (BOOL)isAssetUnavailableFailure:(id)a3
{
  return objc_msgSend(a3, "mpc_isAssetUnavailableFailure");
}

- (BOOL)isUnrecoverableAssetLoadingError:(id)a3
{
  v3 = [a3 userInfo];
  v4 = [v3 objectForKeyedSubscript:*MEMORY[0x263F08608]];

  LOBYTE(v3) = objc_msgSend(v4, "mpc_isUnrecoverableAssetLoadingError");
  return (char)v3;
}

- (BOOL)isQueueLoadingFailure:(id)a3
{
  return objc_msgSend(a3, "mpc_isQueueLoadingFailure");
}

- (BOOL)isFirstItemFailure:(id)a3 item:(id)a4
{
  id v5 = a4;
  if ([v5 isStartItem])
  {
    id v6 = [(MPCPlaybackErrorController *)self preferredFirstContentItemID];
    if (v6)
    {
      id v7 = [v5 contentItemID];
      BOOL v8 = [(MPCPlaybackErrorController *)self preferredFirstContentItemID];
      if (v7 == v8) {
        char v9 = 1;
      }
      else {
        char v9 = [v7 isEqual:v8];
      }
    }
    else
    {
      char v9 = 1;
    }
  }
  else
  {
    char v9 = 0;
  }

  return v9;
}

- (BOOL)canHandleFirstItemFailure
{
  v2 = [(MPCPlaybackErrorController *)self playbackEngine];
  v3 = [v2 delegate];
  char v4 = objc_opt_respondsToSelector();

  return v4 & 1;
}

- (void)_notifyObserversForError:(id)a3 item:(id)a4
{
  uint64_t v80 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  BOOL v8 = [(MPCPlaybackErrorController *)self playbackEngine];
  char v9 = [v8 delegate];
  id v10 = objc_msgSend(v6, "msv_errorByUnwrappingDomain:code:", @"MPCEnginePlayerError", 16);
  v11 = v10;
  if (v10)
  {
    v12 = objc_msgSend(v10, "msv_errorByUnwrappingDomain:code:", *MEMORY[0x263F08570], -1009);

    if (v12)
    {
      v13 = [MEMORY[0x263F12178] standardUserDefaults];
      v68 = v11;
      if ([v13 preferredMusicLowBandwidthResolution] < 1)
      {
        uint64_t v15 = 0;
      }
      else
      {
        v14 = [MEMORY[0x263F11D60] sharedCloudController];
        uint64_t v15 = [v14 isCellularDataRestrictedForMusic] ^ 1;
      }
      v67 = v8;

      objc_super v16 = [MEMORY[0x263F89110] sharedMonitor];
      uint64_t v17 = [v16 networkType];

      int IsCellular = ICEnvironmentNetworkTypeIsCellular();
      v19 = [(MPCPlaybackErrorController *)self playbackEngine];
      v20 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
      BOOL v21 = os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT);
      if ((v15 & 1) != 0 || !IsCellular)
      {
        v22 = v9;
        if (v21)
        {
          v26 = [v19 engineID];
          *(_DWORD *)buf = 138544130;
          v73 = v26;
          __int16 v74 = 2048;
          v75 = self;
          __int16 v76 = 2114;
          v77 = v19;
          __int16 v78 = 2114;
          id v79 = v6;
          _os_log_impl(&dword_21BB87000, v20, OS_LOG_TYPE_DEFAULT, "[%{public}@]-MPCErrorControllerImplementation %p <%{public}@> - Transforming error to network unavailable instead of original: %{public}@", buf, 0x2Au);
        }
        v24 = @"Network Unavailable";
        uint64_t v25 = 11;
      }
      else
      {
        v22 = v9;
        if (v21)
        {
          v23 = [v19 engineID];
          *(_DWORD *)buf = 138544130;
          v73 = v23;
          __int16 v74 = 2048;
          v75 = self;
          __int16 v76 = 2114;
          v77 = v19;
          __int16 v78 = 2114;
          id v79 = v6;
          _os_log_impl(&dword_21BB87000, v20, OS_LOG_TYPE_DEFAULT, "[%{public}@]-MPCErrorControllerImplementation %p <%{public}@> - Transforming error to cellular restricted error instead of original: %{public}@", buf, 0x2Au);
        }
        v24 = @"Cellular Restricted";
        uint64_t v25 = 10;
      }

      v70[0] = @"ICEnvironmentNetworkType";
      v27 = [NSNumber numberWithInteger:v17];
      v70[1] = @"isMusicCellularStreamingAllowed";
      v71[0] = v27;
      v28 = [NSNumber numberWithBool:v15];
      v71[1] = v28;
      v29 = [NSDictionary dictionaryWithObjects:v71 forKeys:v70 count:2];
      uint64_t v30 = objc_msgSend(v6, "msv_errorByWrappingWithDomain:code:userInfo:debugDescription:", @"MPCError", v25, v29, @"playback request failed with reason: %@", v24);

      id v6 = (id)v30;
      char v9 = v22;
      BOOL v8 = v67;
      v11 = v68;
    }
  }
  if (v7)
  {
    if ([(MPCPlaybackErrorController *)self shouldHandleFirstItemFailure:v6 item:v7])
    {
      if ([(MPCPlaybackErrorController *)self isFirstItemFailure:v6 item:v7])
      {
        if ((objc_msgSend(v6, "mpc_isFileDoesNotExistError") & 1) != 0
          || objc_msgSend(v6, "mpc_isNoPermissionsToReadFileError"))
        {
          v69 = v11;
          v31 = [v6 userInfo];
          id v32 = v7;
          v33 = (void *)[v31 mutableCopy];

          v34 = [v8 mediaRemotePublisher];
          v66 = v32;
          uint64_t v35 = [v34 getQOSDialogForError:v6 withItem:v32];

          v65 = v35;
          [v33 addEntriesFromDictionary:v35];
          v36 = (void *)MEMORY[0x263F087E8];
          v37 = [v6 domain];
          uint64_t v38 = [v6 code];
          v39 = [v6 underlyingErrors];
          v40 = [v6 description];
          v41 = objc_msgSend(v36, "msv_errorWithDomain:code:underlyingErrors:userInfo:debugDescription:", v37, v38, v39, v33, @"%@", v40);

          id v42 = v41;
          v43 = [(MPCPlaybackErrorController *)self playbackEngine];
          v44 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
          if (os_log_type_enabled(v44, OS_LOG_TYPE_ERROR))
          {
            v45 = [v43 engineID];
            *(_DWORD *)buf = 138544130;
            v73 = v45;
            __int16 v74 = 2048;
            v75 = self;
            __int16 v76 = 2114;
            v77 = v43;
            __int16 v78 = 2114;
            id v79 = v42;
            _os_log_impl(&dword_21BB87000, v44, OS_LOG_TYPE_ERROR, "[%{public}@]-❗️MPCErrorControllerImplementation %p <%{public}@> - Notifying delegate [File does not exist] error=%{public}@", buf, 0x2Au);
          }
          v46 = v33;
          v11 = v69;
          v47 = v65;
          id v7 = v66;
          goto LABEL_47;
        }
        v46 = [(MPCPlaybackErrorController *)self playbackEngine];
        v47 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
        if (os_log_type_enabled(v47, OS_LOG_TYPE_ERROR))
        {
          v63 = [v46 engineID];
          *(_DWORD *)buf = 138544130;
          v73 = v63;
          __int16 v74 = 2048;
          v75 = self;
          __int16 v76 = 2114;
          v77 = v46;
          __int16 v78 = 2114;
          id v79 = v6;
          v64 = "[%{public}@]-❗️MPCErrorControllerImplementation %p <%{public}@> - Notifying delegate [Specified first it"
                "em failure] error=%{public}@";
          goto LABEL_45;
        }
      }
      else
      {
        if (![(MPCPlaybackErrorController *)self isQueueLoadingFailure:v6])
        {
          if (!objc_msgSend(v6, "mpc_isSubscriptionRequiredError"))
          {
LABEL_48:
            v51 = v9;
            v52 = v8;
            id v53 = v7;
LABEL_49:
            [v51 engine:v52 didFailToPlayFirstItem:v53 withError:v6];
            goto LABEL_50;
          }
          v46 = [(MPCPlaybackErrorController *)self playbackEngine];
          v47 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
          if (!os_log_type_enabled(v47, OS_LOG_TYPE_ERROR)) {
            goto LABEL_46;
          }
          v63 = [v46 engineID];
          *(_DWORD *)buf = 138544130;
          v73 = v63;
          __int16 v74 = 2048;
          v75 = self;
          __int16 v76 = 2114;
          v77 = v46;
          __int16 v78 = 2114;
          id v79 = v6;
          v64 = "[%{public}@]-❗️MPCErrorControllerImplementation %p <%{public}@> - Notifying delegate [Subscription requi"
                "red] error=%{public}@";
          goto LABEL_45;
        }
        v46 = [(MPCPlaybackErrorController *)self playbackEngine];
        v47 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
        if (os_log_type_enabled(v47, OS_LOG_TYPE_ERROR))
        {
          v63 = [v46 engineID];
          *(_DWORD *)buf = 138544130;
          v73 = v63;
          __int16 v74 = 2048;
          v75 = self;
          __int16 v76 = 2114;
          v77 = v46;
          __int16 v78 = 2114;
          id v79 = v6;
          v64 = "[%{public}@]-❗️MPCErrorControllerImplementation %p <%{public}@> - Notifying delegate [Entire queue loadi"
                "ng failure] error=%{public}@";
LABEL_45:
          _os_log_impl(&dword_21BB87000, v47, OS_LOG_TYPE_ERROR, v64, buf, 0x2Au);
        }
      }
LABEL_46:
      id v42 = v6;
LABEL_47:

      id v6 = v42;
      goto LABEL_48;
    }
    if (objc_opt_respondsToSelector())
    {
      v54 = [(MPCPlaybackErrorController *)self playbackEngine];
      v55 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
      if (os_log_type_enabled(v55, OS_LOG_TYPE_ERROR))
      {
        v56 = [v54 engineID];
        *(_DWORD *)buf = 138544130;
        v73 = v56;
        __int16 v74 = 2048;
        v75 = self;
        __int16 v76 = 2114;
        v77 = v54;
        __int16 v78 = 2114;
        id v79 = v6;
        _os_log_impl(&dword_21BB87000, v55, OS_LOG_TYPE_ERROR, "[%{public}@]-❗️MPCErrorControllerImplementation %p <%{public}@> - Notifying delegate [Queue item failure] error=%{public}@", buf, 0x2Au);
      }
      v57 = v9;
      v58 = v8;
      id v59 = v7;
LABEL_36:
      [v57 engine:v58 didFailToPlayItem:v59 withError:v6];
    }
  }
  else
  {
    if ([(MPCPlaybackErrorController *)self canHandleFirstItemFailure]
      && [(MPCPlaybackErrorController *)self isQueueLoadingFailure:v6])
    {
      v48 = [(MPCPlaybackErrorController *)self playbackEngine];
      v49 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
      if (os_log_type_enabled(v49, OS_LOG_TYPE_ERROR))
      {
        v50 = [v48 engineID];
        *(_DWORD *)buf = 138544130;
        v73 = v50;
        __int16 v74 = 2048;
        v75 = self;
        __int16 v76 = 2114;
        v77 = v48;
        __int16 v78 = 2114;
        id v79 = v6;
        _os_log_impl(&dword_21BB87000, v49, OS_LOG_TYPE_ERROR, "[%{public}@]-❗️MPCErrorControllerImplementation %p <%{public}@> - Notifying delegate [Failed to queue any items] error=%{public}@", buf, 0x2Au);
      }
      v51 = v9;
      v52 = v8;
      id v53 = 0;
      goto LABEL_49;
    }
    if (objc_opt_respondsToSelector())
    {
      v60 = [(MPCPlaybackErrorController *)self playbackEngine];
      v61 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
      if (os_log_type_enabled(v61, OS_LOG_TYPE_ERROR))
      {
        v62 = [v60 engineID];
        *(_DWORD *)buf = 138544130;
        v73 = v62;
        __int16 v74 = 2048;
        v75 = self;
        __int16 v76 = 2114;
        v77 = v60;
        __int16 v78 = 2114;
        id v79 = v6;
        _os_log_impl(&dword_21BB87000, v61, OS_LOG_TYPE_ERROR, "[%{public}@]-❗️MPCErrorControllerImplementation %p <%{public}@> - Notifying delegate [Queue item failure - nil item] error=%{public}@", buf, 0x2Au);
      }
      v57 = v9;
      v58 = v8;
      id v59 = 0;
      goto LABEL_36;
    }
  }
LABEL_50:
}

- (int64_t)_resolutionForPlaybackError:(id)a3 item:(id)a4
{
  uint64_t v32 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  BOOL v8 = [(MPCPlaybackErrorController *)self playbackEngine];
  if (!v8)
  {
    int64_t v12 = 1;
    goto LABEL_24;
  }
  if (!v7)
  {
    v13 = [(MPCPlaybackErrorController *)self playbackEngine];
    v14 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      uint64_t v15 = [v13 engineID];
      int v24 = 138544130;
      uint64_t v25 = v15;
      __int16 v26 = 2048;
      v27 = self;
      __int16 v28 = 2114;
      v29 = v13;
      __int16 v30 = 2114;
      id v31 = v6;
      _os_log_impl(&dword_21BB87000, v14, OS_LOG_TYPE_ERROR, "[%{public}@]-❗️MPCErrorControllerImplementation %p <%{public}@> - nil item received [Queue failure] error=%{public}@", (uint8_t *)&v24, 0x2Au);
    }
    int64_t v12 = 0;
    goto LABEL_23;
  }
  if ([(MPCPlaybackErrorController *)self itemsHavePlayed])
  {
    char v9 = [(MPCPlaybackErrorController *)self playbackEngine];
    id v10 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      v11 = [v9 engineID];
      int v24 = 138543874;
      uint64_t v25 = v11;
      __int16 v26 = 2048;
      v27 = self;
      __int16 v28 = 2114;
      v29 = v9;
      _os_log_impl(&dword_21BB87000, v10, OS_LOG_TYPE_DEFAULT, "[%{public}@]-MPCErrorControllerImplementation %p <%{public}@> - Playback has succeeded for at least one item [Ignoring queue failure]", (uint8_t *)&v24, 0x20u);
    }
LABEL_17:
    int64_t v12 = 0;
    goto LABEL_18;
  }
  objc_super v16 = [(MPCPlaybackErrorController *)v8 queueController];
  uint64_t v17 = [v7 contentItemID];
  char v9 = [v16 contentItemIDWithoutRepeatIteration:v17];

  v18 = [(MPCPlaybackErrorController *)self failedItemsIdentifiers];
  LODWORD(v17) = [v18 containsObject:v9];

  if (!v17)
  {
    BOOL v21 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
    {
      int v24 = 134218242;
      uint64_t v25 = self;
      __int16 v26 = 2114;
      v27 = v8;
      _os_log_impl(&dword_21BB87000, v21, OS_LOG_TYPE_DEFAULT, "MPCErrorControllerImplementation %p <%{public}@> - Playback has not yet succeeded [Adding to queue failure set]", (uint8_t *)&v24, 0x16u);
    }

    id v10 = [(MPCPlaybackErrorController *)self failedItemsIdentifiers];
    [v10 addObject:v9];
    goto LABEL_17;
  }
  id v10 = [(MPCPlaybackErrorController *)self playbackEngine];
  v19 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
  if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
  {
    v20 = [v10 engineID];
    int v24 = 138543874;
    uint64_t v25 = v20;
    __int16 v26 = 2048;
    v27 = self;
    __int16 v28 = 2114;
    v29 = v10;
    _os_log_impl(&dword_21BB87000, v19, OS_LOG_TYPE_ERROR, "[%{public}@]-❗️MPCErrorControllerImplementation %p <%{public}@> - Ending playback [Entire queue failure]", (uint8_t *)&v24, 0x20u);
  }
  int64_t v12 = 1;
LABEL_18:

  if ([(MPCPlaybackErrorController *)self shouldHandleFirstItemFailure:v6 item:v7]|| [(MPCPlaybackErrorController *)self isUnrecoverableAssetLoadingError:v6])
  {
    v13 = [(MPCPlaybackErrorController *)self playbackEngine];
    v14 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      v22 = [v13 engineID];
      int v24 = 138544130;
      uint64_t v25 = v22;
      __int16 v26 = 2048;
      v27 = self;
      __int16 v28 = 2114;
      v29 = v13;
      __int16 v30 = 2114;
      id v31 = v6;
      _os_log_impl(&dword_21BB87000, v14, OS_LOG_TYPE_ERROR, "[%{public}@]-❗️MPCErrorControllerImplementation %p <%{public}@> - Stopping playback for a first item or unrecoverable asset loading error. error=%{public}@", (uint8_t *)&v24, 0x2Au);
    }
    int64_t v12 = 1;
LABEL_23:
  }
LABEL_24:

  return v12;
}

- (void)_playbackFailedWithError:(id)a3 item:(id)a4 canResolve:(BOOL)a5 proposedResolution:(int64_t)a6 completion:(id)a7
{
  BOOL v9 = a5;
  uint64_t v46 = *MEMORY[0x263EF8340];
  id v12 = a3;
  id v13 = a4;
  id v14 = a7;
  if (v13 && v9 && ([v13 hasPerformedErrorResolution] & 1) == 0)
  {
    int v24 = [(MPCPlaybackErrorController *)self playbackEngine];
    uint64_t v25 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
    if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
    {
      __int16 v26 = [v24 engineID];
      *(_DWORD *)buf = 138544386;
      uint64_t v35 = v26;
      __int16 v36 = 2048;
      v37 = self;
      __int16 v38 = 2114;
      v39 = v24;
      __int16 v40 = 2114;
      id v41 = v13;
      __int16 v42 = 2114;
      id v43 = v12;
      _os_log_impl(&dword_21BB87000, v25, OS_LOG_TYPE_DEFAULT, "[%{public}@]-MPCErrorControllerImplementation %p <%{public}@> - Attempting to recover from error [using item resolution] - item:%{public}@ - error:%{public}@", buf, 0x34u);
    }
    [(MPCPlaybackErrorController *)self setLastItemUsedForErrorResolution:v13];
    objc_initWeak((id *)buf, self);
    v28[0] = MEMORY[0x263EF8330];
    v28[1] = 3221225472;
    v28[2] = __101__MPCPlaybackErrorController__playbackFailedWithError_item_canResolve_proposedResolution_completion___block_invoke;
    v28[3] = &unk_2643C14D0;
    objc_copyWeak(v33, (id *)buf);
    id v27 = v13;
    v33[1] = (id)a6;
    id v29 = v27;
    __int16 v30 = self;
    id v31 = v12;
    id v32 = v14;
    [v27 resolvePlaybackError:v31 withCompletion:v28];

    objc_destroyWeak(v33);
    objc_destroyWeak((id *)buf);
  }
  else
  {
    uint64_t v15 = [(MPCPlaybackErrorController *)self playbackEngine];
    objc_super v16 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v17 = [v15 engineID];
      *(_DWORD *)buf = 138544386;
      uint64_t v35 = v17;
      __int16 v36 = 2048;
      v37 = self;
      __int16 v38 = 2114;
      v39 = v15;
      __int16 v40 = 2114;
      id v41 = v13;
      __int16 v42 = 2114;
      id v43 = v12;
      _os_log_impl(&dword_21BB87000, v16, OS_LOG_TYPE_DEFAULT, "[%{public}@]-MPCErrorControllerImplementation %p <%{public}@> - Unable resolve error [determining final resolution] - item:%{public}@ - error:%{public}@", buf, 0x34u);
    }
    int64_t v18 = [(MPCPlaybackErrorController *)self _resolutionForPlaybackError:v12 item:v13];
    if (a6 == 1) {
      uint64_t v19 = 1;
    }
    else {
      uint64_t v19 = v18;
    }
    v20 = [(MPCPlaybackErrorController *)self playbackEngine];
    BOOL v21 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
    {
      v22 = [v20 engineID];
      v23 = +[MFDescription forErrorResolution:v19];
      *(_DWORD *)buf = 138544642;
      uint64_t v35 = v22;
      __int16 v36 = 2048;
      v37 = self;
      __int16 v38 = 2114;
      v39 = v20;
      __int16 v40 = 2114;
      id v41 = v23;
      __int16 v42 = 2114;
      id v43 = v13;
      __int16 v44 = 2114;
      id v45 = v12;
      _os_log_impl(&dword_21BB87000, v21, OS_LOG_TYPE_DEFAULT, "[%{public}@]-MPCErrorControllerImplementation %p <%{public}@> - Final error resolution reached [%{public}@] - item:%{public}@ - error:%{public}@", buf, 0x3Eu);
    }
    if ((_os_feature_enabled_impl() & 1) == 0) {
      [(MPCPlaybackErrorController *)self _notifyObserversForError:v12 item:v13];
    }
    (*((void (**)(id, uint64_t))v14 + 2))(v14, v19);
  }
}

void __101__MPCPlaybackErrorController__playbackFailedWithError_item_canResolve_proposedResolution_completion___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v36 = *MEMORY[0x263EF8340];
  id v5 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 64));
  [*(id *)(a1 + 32) setHasPerformedErrorResolution:1];
  if (!WeakRetained) {
    goto LABEL_11;
  }
  if (a2 == 2) {
    goto LABEL_5;
  }
  if (a2 != 1)
  {
    if (a2) {
      goto LABEL_11;
    }
LABEL_5:
    BOOL v7 = *(void *)(a1 + 72) == 1;
    BOOL v8 = [*(id *)(a1 + 40) playbackEngine];
    BOOL v9 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      id v10 = [v8 engineID];
      uint64_t v11 = *(void *)(a1 + 40);
      id v12 = +[MFDescription forErrorResolution:v7];
      uint64_t v13 = *(void *)(a1 + 32);
      uint64_t v14 = *(void *)(a1 + 48);
      int v22 = 138544898;
      v23 = v10;
      __int16 v24 = 2048;
      uint64_t v25 = v11;
      __int16 v26 = 2114;
      id v27 = v8;
      __int16 v28 = 2114;
      id v29 = v12;
      __int16 v30 = 2114;
      uint64_t v31 = v13;
      __int16 v32 = 2114;
      uint64_t v33 = v14;
      __int16 v34 = 2114;
      id v35 = v5;
      _os_log_impl(&dword_21BB87000, v9, OS_LOG_TYPE_ERROR, "[%{public}@]-❗️MPCErrorControllerImplementation %p <%{public}@> - Item error resolution failed [proposed resolution: %{public}@]- item:%{public}@ - error: %{public}@ - resolutionError:%{public}@", (uint8_t *)&v22, 0x48u);
    }
    [*(id *)(a1 + 40) _playbackFailedWithError:*(void *)(a1 + 48) item:*(void *)(a1 + 32) canResolve:0 proposedResolution:v7 completion:*(void *)(a1 + 56)];
    goto LABEL_11;
  }
  uint64_t v15 = [*(id *)(a1 + 40) playbackEngine];
  objc_super v16 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v17 = [v15 engineID];
    uint64_t v18 = *(void *)(a1 + 40);
    uint64_t v19 = +[MFDescription forErrorResolution:2];
    uint64_t v20 = *(void *)(a1 + 32);
    uint64_t v21 = *(void *)(a1 + 48);
    int v22 = 138544898;
    v23 = v17;
    __int16 v24 = 2048;
    uint64_t v25 = v18;
    __int16 v26 = 2114;
    id v27 = v15;
    __int16 v28 = 2114;
    id v29 = v19;
    __int16 v30 = 2114;
    uint64_t v31 = v20;
    __int16 v32 = 2114;
    uint64_t v33 = v21;
    __int16 v34 = 2114;
    id v35 = v5;
    _os_log_impl(&dword_21BB87000, v16, OS_LOG_TYPE_DEFAULT, "[%{public}@]-MPCErrorControllerImplementation %p <%{public}@> - Item error resolution succeeded [proposed resolution: %{public}@] - item:%{public}@ - error:%{public}@ - resolutionError:%{public}@", (uint8_t *)&v22, 0x48u);
  }
  (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
LABEL_11:
}

- (void)reportCriticalError:(id)a3 forItem:(id)a4
{
  uint64_t v31 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  if ((_os_feature_enabled_impl() & 1) == 0)
  {
    BOOL v8 = [(MPCPlaybackErrorController *)self playbackEngine];
    BOOL v9 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      id v10 = [v8 engineID];
      int v21 = 138544386;
      int v22 = v10;
      __int16 v23 = 2048;
      __int16 v24 = self;
      __int16 v25 = 2114;
      __int16 v26 = v8;
      __int16 v27 = 2114;
      id v28 = v7;
      __int16 v29 = 2114;
      id v30 = v6;
      _os_log_impl(&dword_21BB87000, v9, OS_LOG_TYPE_DEFAULT, "[%{public}@]-MPCErrorControllerImplementation %p <%{public}@> - Processing fatal playback error - item:%{public}@ - error:%{public}@", (uint8_t *)&v21, 0x34u);
    }
    uint64_t v11 = [(MPCPlaybackErrorController *)self translator];
    id v12 = [v11 MPAVItemForMFPlayerItem:v7];

    id v13 = v6;
    uint64_t v14 = [v13 domain];
    int v15 = [v14 isEqualToString:@"MPCEnginePlayerError"];

    if (!v15) {
      goto LABEL_10;
    }
    uint64_t v16 = [v13 code];
    if ((unint64_t)(v16 - 5) >= 3)
    {
      if (v16 != 9)
      {
LABEL_10:
        [(MPCPlaybackErrorController *)self _notifyObserversForError:v13 item:v12];

        goto LABEL_11;
      }
      uint64_t v17 = (void *)MEMORY[0x263F087E8];
      uint64_t v18 = @"Shared listening playback failure";
      uint64_t v19 = 2200;
    }
    else
    {
      uint64_t v17 = (void *)MEMORY[0x263F087E8];
      uint64_t v18 = @"SetQueue failed to load any assets";
      uint64_t v19 = 62;
    }
    uint64_t v20 = objc_msgSend(v17, "msv_errorWithDomain:code:underlyingError:debugDescription:", @"MPCError", v19, v13, v18);

    id v13 = (id)v20;
    goto LABEL_10;
  }
LABEL_11:
}

- (void)resolveError:(id)a3 forItem:(id)a4 completion:(id)a5
{
  uint64_t v127 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  uint64_t v11 = [(MPCPlaybackErrorController *)self playbackEngine];
  id v12 = [(MPCPlaybackErrorController *)self translator];
  id v13 = [v12 MPAVItemForMFPlayerItem:v9];

  uint64_t v14 = [(MPCPlaybackErrorController *)self playbackEngine];
  int v15 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
  v105 = v11;
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v16 = [v14 engineID];
    int v17 = [v13 isStartItem];
    uint64_t v18 = v13;
    id v19 = v10;
    id v20 = v8;
    int v21 = v17;
    int v22 = [(MPCPlaybackErrorController *)self preferredFirstContentItemID];
    *(_DWORD *)buf = 138544898;
    v114 = v16;
    __int16 v115 = 2048;
    v116 = self;
    __int16 v117 = 2114;
    v118 = v14;
    __int16 v119 = 2114;
    id v120 = v9;
    __int16 v121 = 1024;
    int v122 = v21;
    id v8 = v20;
    id v10 = v19;
    id v13 = v18;
    __int16 v123 = 2114;
    id v124 = v22;
    __int16 v125 = 2114;
    id v126 = v8;
    _os_log_impl(&dword_21BB87000, v15, OS_LOG_TYPE_DEFAULT, "[%{public}@]-MPCErrorControllerImplementation %p <%{public}@> - Starting error resolution - item:%{public}@ - isStartItem:%{BOOL}u - preferredFirstContentItemID:%{public}@ - error:%{public}@", buf, 0x44u);

    uint64_t v11 = v105;
  }

  if ([(MPCPlaybackErrorController *)self contiguousFailSilentlyResolutionCount] < 250)
  {
    __int16 v23 = [v8 userInfo];
    uint64_t v24 = *MEMORY[0x263F08608];
    uint64_t v25 = [v23 objectForKeyedSubscript:*MEMORY[0x263F08608]];

    __int16 v26 = [v13 playbackError];
    v103 = v26;
    if (v26)
    {
      __int16 v27 = [v26 userInfo];
      v104 = [v27 objectForKeyedSubscript:v24];
    }
    else
    {
      v104 = 0;
    }
    v101 = (void *)v25;
    id v102 = v8;
    id v28 = v8;
    __int16 v29 = [v11 player];
    if ([v29 state] == 4)
    {
      BOOL v30 = 1;
    }
    else
    {
      uint64_t v31 = [v11 player];
      BOOL v30 = [v31 state] == 6;
    }
    __int16 v32 = v11;

    uint64_t v33 = (void *)MEMORY[0x263EF83A0];
    id v34 = MEMORY[0x263EF83A0];
    aBlock[0] = MEMORY[0x263EF8330];
    aBlock[1] = 3221225472;
    aBlock[2] = __62__MPCPlaybackErrorController_resolveError_forItem_completion___block_invoke;
    aBlock[3] = &unk_2643C14A0;
    id v107 = v33;
    id v112 = v10;
    v108 = self;
    id v35 = v28;
    id v109 = v35;
    id v36 = v13;
    id v110 = v36;
    id v111 = v32;
    v100 = _Block_copy(aBlock);
    v37 = v101;
    if ((objc_msgSend(v35, "mpc_isAirplayDeviceBusyError") & 1) != 0
      || (objc_msgSend(v101, "mpc_isAirplayDeviceBusyError") & 1) != 0
      || objc_msgSend(v104, "mpc_isAirplayDeviceBusyError"))
    {
      __int16 v38 = [(MPCPlaybackErrorController *)self playbackEngine];
      v39 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
      if (os_log_type_enabled(v39, OS_LOG_TYPE_ERROR))
      {
        __int16 v40 = [v38 engineID];
        id v41 = +[MFDescription forErrorResolution:1];
        *(_DWORD *)buf = 138544130;
        v114 = v40;
        __int16 v115 = 2048;
        v116 = self;
        __int16 v117 = 2114;
        v118 = v38;
        __int16 v119 = 2114;
        id v120 = v41;
        _os_log_impl(&dword_21BB87000, v39, OS_LOG_TYPE_ERROR, "[%{public}@]-❗️MPCErrorControllerImplementation %p <%{public}@> - Unrecoverable AirPlay failure [airPlayVideoEnded] - Actual resolution:%{public}@", buf, 0x2Au);
      }
      __int16 v42 = v100;
      (*((void (**)(void *, uint64_t))v100 + 2))(v100, 1);
      id v43 = [(MPCPlaybackErrorController *)self externalPlaybackRouter];
      [v43 pickBestDeviceRoute];

      id v8 = v102;
      __int16 v44 = v103;
      goto LABEL_17;
    }
    if ((objc_msgSend(v35, "mpc_isRentalContentRequiresDownloadError") & 1) != 0
      || (objc_msgSend(v101, "mpc_isRentalContentRequiresDownloadError") & 1) != 0
      || objc_msgSend(v104, "mpc_isRentalContentRequiresDownloadError"))
    {
      objc_msgSend(MEMORY[0x263F087E8], "msv_errorWithDomain:code:underlyingError:debugDescription:", *MEMORY[0x263F110C0], 8, v35, @"Unrecoverable AirPlay failure [rental requires download]");
      id v98 = (id)objc_claimAutoreleasedReturnValue();

      id v45 = [(MPCPlaybackErrorController *)self playbackEngine];
      uint64_t v46 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
      id v8 = v102;
      __int16 v44 = v103;
      v97 = v45;
      if (os_log_type_enabled(v46, OS_LOG_TYPE_ERROR))
      {
        [v45 engineID];
        v47 = id v90 = v36;
        +[MFDescription forErrorResolution:1];
        v49 = v48 = v46;
        *(_DWORD *)buf = 138544642;
        v114 = v47;
        __int16 v115 = 2048;
        v116 = self;
        __int16 v117 = 2114;
        v118 = v97;
        __int16 v119 = 2114;
        id v120 = v49;
        __int16 v121 = 1024;
        int v122 = 0;
        __int16 v123 = 2114;
        id v124 = v98;
        _os_log_impl(&dword_21BB87000, v48, OS_LOG_TYPE_ERROR, "[%{public}@]-❗️MPCErrorControllerImplementation %p <%{public}@> - Unrecoverable AirPlay failure [rental requires download] - Proposed resolution:%{public}@ - canResolve:%{BOOL}u - errorForResolution:%{public}@", buf, 0x3Au);

        id v36 = v90;
        uint64_t v46 = v48;
        uint64_t v50 = 1;
        unsigned int v96 = 0;
LABEL_26:

        id v35 = v98;
        id v51 = v36;
        __int16 v42 = v100;
        [(MPCPlaybackErrorController *)self _playbackFailedWithError:v98 item:v51 canResolve:v96 proposedResolution:v50 completion:v100];
LABEL_17:

        uint64_t v11 = v105;
        goto LABEL_18;
      }
      unsigned int v96 = 0;
LABEL_25:
      uint64_t v50 = 1;
      goto LABEL_26;
    }
    __int16 v44 = v103;
    if ((objc_msgSend(v35, "mpc_isAirplayStreamingNotSupportedError") & 1) != 0
      || (objc_msgSend(v101, "mpc_isAirplayStreamingNotSupportedError") & 1) != 0
      || objc_msgSend(v104, "mpc_isAirplayStreamingNotSupportedError"))
    {
      if (v35) {
        v52 = v35;
      }
      else {
        v52 = v103;
      }
      id v98 = v52;

      id v53 = [(MPCPlaybackErrorController *)self playbackEngine];
      uint64_t v46 = _MPCLogCategoryPlayback();
      unsigned int v96 = 1;
      v97 = v53;
      if (os_log_type_enabled(v46, OS_LOG_TYPE_DEFAULT))
      {
        [v53 engineID];
        id v91 = v36;
        v55 = v54 = v53;
        +[MFDescription forErrorResolution:0];
        v57 = v56 = v46;
        *(_DWORD *)buf = 138544642;
        v114 = v55;
        __int16 v115 = 2048;
        v116 = self;
        __int16 v117 = 2114;
        v118 = v54;
        __int16 v119 = 2114;
        id v120 = v57;
        __int16 v121 = 1024;
        int v122 = 1;
        __int16 v123 = 2114;
        id v124 = v98;
        _os_log_impl(&dword_21BB87000, v56, OS_LOG_TYPE_DEFAULT, "[%{public}@]-MPCErrorControllerImplementation %p <%{public}@> - Potentialy recoverable AirPlay failure [streaming not supported on device] - Proposed resolution:%{public}@ - canResolve:%{BOOL}u - errorForResolution:%{public}@", buf, 0x3Au);

        id v36 = v91;
        uint64_t v46 = v56;
      }
      uint64_t v50 = 0;
      id v8 = v102;
      goto LABEL_26;
    }
    if (objc_msgSend(v35, "mpc_isResourceUnavailableError"))
    {
      if ([v9 isAssetLoaded])
      {
        v58 = [v9 avPlayerItem];
        id v59 = [v58 errorLog];

        if (v59)
        {
          v97 = [(MPCPlaybackErrorController *)self playbackEngine];
          v60 = _MPCLogCategoryPlayback();
          if (os_log_type_enabled(v60, OS_LOG_TYPE_ERROR))
          {
            [v97 engineID];
            v61 = id v92 = v36;
            v62 = +[MFDescription forErrorResolution:1];
            *(_DWORD *)buf = 138544130;
            v114 = v61;
            __int16 v115 = 2048;
            v116 = self;
            __int16 v117 = 2114;
            v118 = v97;
            __int16 v119 = 2114;
            id v120 = v62;
            v63 = v60;
            uint64_t v50 = 1;
            _os_log_impl(&dword_21BB87000, v63, OS_LOG_TYPE_ERROR, "[%{public}@]-❗️MPCErrorControllerImplementation %p <%{public}@> - Unrecoverable playback failure [resource unavailable] - Actual resolution:%{public}@", buf, 0x2Au);

            id v36 = v92;
            unsigned int v96 = 0;
            id v98 = v35;
            uint64_t v46 = v63;
            id v8 = v102;
            __int16 v44 = v103;
            goto LABEL_26;
          }
          unsigned int v96 = 0;
          id v98 = v35;
          id v8 = v102;
          goto LABEL_63;
        }
      }
    }
    if ((objc_msgSend(v35, "mpc_isLeaseTakenError") & v30) == 1)
    {
      v64 = [(MPCPlaybackErrorController *)self playbackEngine];
      log = _MPCLogCategoryPlayback();
      id v8 = v102;
      v97 = v64;
      if (os_log_type_enabled(log, OS_LOG_TYPE_ERROR))
      {
        [v64 engineID];
        id v93 = v36;
        v66 = v65 = v64;
        v67 = +[MFDescription forErrorResolution:1];
        *(_DWORD *)buf = 138544130;
        v114 = v66;
        __int16 v115 = 2048;
        v116 = self;
        __int16 v117 = 2114;
        v118 = v65;
        __int16 v119 = 2114;
        id v120 = v67;
        _os_log_impl(&dword_21BB87000, log, OS_LOG_TYPE_ERROR, "[%{public}@]-❗️MPCErrorControllerImplementation %p <%{public}@> - Unrecoverable playback failure [lease error while paused or interrupted] - Actual resolution:%{public}@", buf, 0x2Au);

        uint64_t v50 = 1;
        id v36 = v93;

        unsigned int v96 = 0;
      }
      else
      {
        unsigned int v96 = 0;
        uint64_t v50 = 1;
      }
      id v98 = v35;
      __int16 v44 = v103;
      uint64_t v46 = log;
      goto LABEL_26;
    }
    id v8 = v102;
    if (![(MPCPlaybackErrorController *)self itemsHavePlayed]
      && objc_msgSend(v35, "mpc_isSubscriptionRequiredError"))
    {
      v94 = v36;
      v97 = [(MPCPlaybackErrorController *)self playbackEngine];
      v60 = _MPCLogCategoryPlayback();
      if (os_log_type_enabled(v60, OS_LOG_TYPE_DEFAULT))
      {
        v99 = [v97 engineID];
        v68 = +[MFDescription forErrorResolution:1];
        *(_DWORD *)buf = 138544642;
        v114 = v99;
        __int16 v115 = 2048;
        v116 = self;
        __int16 v117 = 2114;
        v118 = v97;
        __int16 v119 = 2114;
        id v120 = v68;
        __int16 v121 = 1024;
        int v122 = 0;
        __int16 v123 = 2114;
        id v124 = v35;
        v69 = "[%{public}@]-MPCErrorControllerImplementation %p <%{public}@> - Unrecoverable failure [subscription requir"
              "ed for playback] - Proposed resolution:%{public}@ - canResolve:%{BOOL}u - errorForResolution:%{public}@";
LABEL_56:
        v72 = v60;
        uint64_t v50 = 1;
        _os_log_impl(&dword_21BB87000, v72, OS_LOG_TYPE_DEFAULT, v69, buf, 0x3Au);

        unsigned int v96 = 0;
        id v98 = v35;
        uint64_t v46 = v72;
LABEL_75:
        __int16 v44 = v103;
        id v36 = v94;
        goto LABEL_26;
      }
      goto LABEL_57;
    }
    if (objc_msgSend(v35, "mpc_isKeyServerNoOfflineSlotError"))
    {
      v97 = [(MPCPlaybackErrorController *)self playbackEngine];
      v60 = _MPCLogCategoryPlayback();
      if (os_log_type_enabled(v60, OS_LOG_TYPE_DEFAULT))
      {
        [v97 engineID];
        v70 = id v95 = v36;
        v71 = +[MFDescription forErrorResolution:1];
        *(_DWORD *)buf = 138544642;
        v114 = v70;
        __int16 v115 = 2048;
        v116 = self;
        __int16 v117 = 2114;
        v118 = v97;
        __int16 v119 = 2114;
        id v120 = v71;
        __int16 v121 = 1024;
        int v122 = 0;
        __int16 v123 = 2114;
        id v124 = v35;
        _os_log_impl(&dword_21BB87000, v60, OS_LOG_TYPE_DEFAULT, "[%{public}@]-MPCErrorControllerImplementation %p <%{public}@> - Unrecoverable failure [no offline slot] - Proposed resolution:%{public}@ - canResolve:%{BOOL}u - errorForResolution:%{public}@", buf, 0x3Au);

        id v36 = v95;
        unsigned int v96 = 0;
        id v98 = v35;
        uint64_t v46 = v60;
        uint64_t v50 = 1;
        __int16 v44 = v103;
        goto LABEL_26;
      }
      unsigned int v96 = 0;
      id v98 = v35;
LABEL_63:
      __int16 v44 = v103;
      goto LABEL_64;
    }
    v94 = v36;
    if (objc_msgSend(v35, "mpc_isStreamingSlotError"))
    {
      v97 = [(MPCPlaybackErrorController *)self playbackEngine];
      v60 = _MPCLogCategoryPlayback();
      if (os_log_type_enabled(v60, OS_LOG_TYPE_DEFAULT))
      {
        v99 = [v97 engineID];
        v68 = +[MFDescription forErrorResolution:1];
        *(_DWORD *)buf = 138544642;
        v114 = v99;
        __int16 v115 = 2048;
        v116 = self;
        __int16 v117 = 2114;
        v118 = v97;
        __int16 v119 = 2114;
        id v120 = v68;
        __int16 v121 = 1024;
        int v122 = 0;
        __int16 v123 = 2114;
        id v124 = v35;
        v69 = "[%{public}@]-MPCErrorControllerImplementation %p <%{public}@> - Unrecoverable failure [streaming slot erro"
              "r] - Proposed resolution:%{public}@ - canResolve:%{BOOL}u - errorForResolution:%{public}@";
        goto LABEL_56;
      }
LABEL_57:
      unsigned int v96 = 0;
      id v98 = v35;
      __int16 v44 = v103;
      id v36 = v94;
LABEL_64:
      uint64_t v46 = v60;
      goto LABEL_25;
    }
    v73 = self;
    if (objc_msgSend(v35, "mpc_isUnrecoverableAssetLoadingError"))
    {
      __int16 v74 = [(MPCPlaybackErrorController *)self playbackEngine];
      loga = _MPCLogCategoryPlayback();
      v97 = v74;
      if (os_log_type_enabled(loga, OS_LOG_TYPE_DEFAULT))
      {
        v75 = v74;
        __int16 v76 = [v74 engineID];
        v77 = +[MFDescription forErrorResolution:1];
        *(_DWORD *)buf = 138544642;
        v114 = v76;
        __int16 v115 = 2048;
        v116 = self;
        __int16 v117 = 2114;
        v118 = v75;
        __int16 v119 = 2114;
        id v120 = v77;
        __int16 v121 = 1024;
        int v122 = 0;
        __int16 v123 = 2114;
        id v124 = v35;
        __int16 v78 = loga;
        _os_log_impl(&dword_21BB87000, loga, OS_LOG_TYPE_DEFAULT, "[%{public}@]-MPCErrorControllerImplementation %p <%{public}@> - Unrecoverable failure [asset loading error] - Proposed resolution:%{public}@ - canResolve:%{BOOL}u - errorForResolution:%{public}@", buf, 0x3Au);

        uint64_t v50 = 1;
        unsigned int v96 = 0;
LABEL_74:
        id v98 = v35;
        uint64_t v46 = v78;
        v37 = v101;
        id v8 = v102;
        goto LABEL_75;
      }
      unsigned int v96 = 0;
      id v98 = v35;
      v37 = v101;
      id v8 = v102;
      __int16 v44 = v103;
      uint64_t v50 = 1;
    }
    else
    {
      id v79 = [(MPCPlaybackErrorController *)self lastItemUsedForErrorResolution];
      if (v79)
      {
        uint64_t v80 = [(MPCPlaybackErrorController *)v73 lastItemUsedForErrorResolution];
        if (v80)
        {
          v81 = [(MPCPlaybackErrorController *)v73 lastItemUsedForErrorResolution];
          v82 = [v81 contentItemID];
          v83 = [v94 contentItemID];
          unsigned int v96 = [v82 isEqualToString:v83] ^ 1;
        }
        else
        {
          unsigned int v96 = 0;
        }
      }
      else
      {
        unsigned int v96 = 1;
      }

      v84 = [(MPCPlaybackErrorController *)v73 playbackEngine];
      loga = _MPCLogCategoryPlayback();
      v97 = v84;
      if (os_log_type_enabled(loga, OS_LOG_TYPE_DEFAULT))
      {
        v85 = v84;
        v86 = [v84 engineID];
        v87 = +[MFDescription forErrorResolution:0];
        *(_DWORD *)buf = 138544642;
        v114 = v86;
        __int16 v115 = 2048;
        self = v73;
        v116 = v73;
        __int16 v117 = 2114;
        v118 = v85;
        __int16 v119 = 2114;
        id v120 = v87;
        __int16 v121 = 1024;
        int v122 = v96;
        __int16 v123 = 2114;
        id v124 = v35;
        __int16 v78 = loga;
        _os_log_impl(&dword_21BB87000, loga, OS_LOG_TYPE_DEFAULT, "[%{public}@]-MPCErrorControllerImplementation %p <%{public}@> - Potentialy recoverable failure [general error] - Proposed resolution:%{public}@ - canResolve:%{BOOL}u - errorForResolution:%{public}@", buf, 0x3Au);

        uint64_t v50 = 0;
        goto LABEL_74;
      }
      id v98 = v35;
      self = v73;
      v37 = v101;
      id v8 = v102;
      __int16 v44 = v103;
      uint64_t v50 = 0;
    }
    uint64_t v46 = loga;
    id v36 = v94;
    goto LABEL_26;
  }
  [(MPCPlaybackErrorController *)self setContiguousFailSilentlyResolutionCount:0];
  (*((void (**)(id, uint64_t))v10 + 2))(v10, 1);
LABEL_18:
}

void __62__MPCPlaybackErrorController_resolveError_forItem_completion___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v38 = *MEMORY[0x263EF8340];
  char v4 = *(NSObject **)(a1 + 32);
  uint64_t v24 = MEMORY[0x263EF8330];
  uint64_t v25 = 3221225472;
  __int16 v26 = __62__MPCPlaybackErrorController_resolveError_forItem_completion___block_invoke_2;
  __int16 v27 = &unk_2643C1478;
  id v28 = *(id *)(a1 + 72);
  uint64_t v29 = a2;
  dispatch_async(v4, &v24);
  id v5 = *(void **)(a1 + 40);
  if (a2 == 1) {
    uint64_t v6 = 0;
  }
  else {
    uint64_t v6 = objc_msgSend(*(id *)(a1 + 40), "contiguousFailSilentlyResolutionCount", v24, v25, v26, v27) + 1;
  }
  objc_msgSend(v5, "setContiguousFailSilentlyResolutionCount:", v6, v24, v25, v26, v27);
  id v7 = objc_msgSend(*(id *)(a1 + 48), "msv_analyticSignature");
  id v8 = os_log_create("com.apple.amp.mediaplaybackcore", "Analytics");
  os_signpost_id_t v9 = os_signpost_id_make_with_pointer(v8, *(const void **)(a1 + 48));

  id v10 = os_log_create("com.apple.amp.mediaplaybackcore", "Analytics");
  uint64_t v11 = v10;
  if (v9 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
  {
    uint64_t v12 = [v7 UTF8String];
    *(_DWORD *)buf = 67240450;
    int v35 = a2;
    __int16 v36 = 2082;
    uint64_t v37 = v12;
    _os_signpost_emit_with_name_impl(&dword_21BB87000, v11, OS_SIGNPOST_EVENT, v9, "ErrorResolution", " enableTelemetry=YES type=%{public, signpost.telemetry:number1, name=type}d error=%{public, signpost.telemetry:string1, name=error}s", buf, 0x12u);
  }

  id v13 = [*(id *)(a1 + 56) queueSectionID];
  uint64_t v14 = [*(id *)(a1 + 56) queueItemID];
  int v15 = (void *)v14;
  if (v13 && v14)
  {
    v32[0] = @"queue-section-id";
    v32[1] = @"queue-item-id";
    v33[0] = v13;
    v33[1] = v14;
    id v33[2] = *(void *)(a1 + 48);
    v32[2] = @"error-for-resolution";
    v32[3] = @"resolution-type";
    uint64_t v16 = [NSNumber numberWithInteger:a2];
    v33[3] = v16;
    int v17 = NSDictionary;
    uint64_t v18 = v33;
    id v19 = v32;
    uint64_t v20 = 4;
  }
  else
  {
    uint64_t v21 = *(void *)(a1 + 48);
    v30[0] = @"error-for-resolution";
    v30[1] = @"resolution-type";
    v31[0] = v21;
    uint64_t v16 = [NSNumber numberWithInteger:a2];
    v31[1] = v16;
    int v17 = NSDictionary;
    uint64_t v18 = v31;
    id v19 = v30;
    uint64_t v20 = 2;
  }
  int v22 = [v17 dictionaryWithObjects:v18 forKeys:v19 count:v20];

  __int16 v23 = [*(id *)(a1 + 64) eventStream];
  [v23 emitEventType:@"error-resolution" payload:v22];
}

uint64_t __62__MPCPlaybackErrorController_resolveError_forItem_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 32) + 16))(*(void *)(a1 + 32), *(void *)(a1 + 40));
}

- (BOOL)itemsHavePlayed
{
  return self->_itemsHavePlayed;
}

@end