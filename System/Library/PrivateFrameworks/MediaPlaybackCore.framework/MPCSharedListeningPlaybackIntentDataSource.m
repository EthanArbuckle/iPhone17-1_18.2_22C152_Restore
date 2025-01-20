@interface MPCSharedListeningPlaybackIntentDataSource
- (ICLiveLink)liveLink;
- (ICLiveLinkIdentity)identity;
- (MPCPlaybackIntent)initialIntent;
- (MSVBlockGuard)guard;
- (MSVSectionedCollection)initialTracklist;
- (NSIndexPath)startIndexPath;
- (id)completion;
- (id)strongSelf;
- (int64_t)buildState;
- (int64_t)linkState;
- (int64_t)shuffleMode;
- (int64_t)sourceState;
- (os_unfair_lock_s)lock;
- (void)_transitionToBuildState:(int64_t)a3;
- (void)_transitionToBuildState:(int64_t)a3 intent:(id)a4 error:(id)a5;
- (void)_transitionToLiveLinkState:(int64_t)a3;
- (void)_transitionToLiveLinkState:(int64_t)a3 error:(id)a4;
- (void)_transitionToSourceState:(int64_t)a3;
- (void)_transitionToSourceState:(int64_t)a3 error:(id)a4;
- (void)buildSharedSessionIntentWithIntent:(id)a3 identity:(id)a4 completion:(id)a5;
- (void)didStartLiveLink:(id)a3;
- (void)getRemotePlaybackQueueFromIntent:(id)a3 destination:(int64_t)a4 completion:(id)a5;
- (void)getRepresentativeObjectFromIntent:(id)a3 properties:(id)a4 completion:(id)a5;
- (void)liveLink:(id)a3 didEncounterError:(id)a4 willRetry:(BOOL)a5;
- (void)liveLink:(id)a3 didUpdateQueue:(id)a4;
- (void)setBuildState:(int64_t)a3;
- (void)setCompletion:(id)a3;
- (void)setGuard:(id)a3;
- (void)setIdentity:(id)a3;
- (void)setInitialIntent:(id)a3;
- (void)setInitialTracklist:(id)a3;
- (void)setLinkState:(int64_t)a3;
- (void)setLiveLink:(id)a3;
- (void)setLock:(os_unfair_lock_s)a3;
- (void)setShuffleMode:(int64_t)a3;
- (void)setSourceState:(int64_t)a3;
- (void)setStartIndexPath:(id)a3;
- (void)setStrongSelf:(id)a3;
@end

@implementation MPCSharedListeningPlaybackIntentDataSource

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_identity, 0);
  objc_storeStrong((id *)&self->_liveLink, 0);
  objc_storeStrong((id *)&self->_initialTracklist, 0);
  objc_storeStrong((id *)&self->_startIndexPath, 0);
  objc_storeStrong((id *)&self->_initialIntent, 0);
  objc_storeStrong(&self->_completion, 0);
  objc_storeStrong(&self->_strongSelf, 0);

  objc_storeStrong((id *)&self->_guard, 0);
}

- (void)setIdentity:(id)a3
{
}

- (ICLiveLinkIdentity)identity
{
  return self->_identity;
}

- (void)setLiveLink:(id)a3
{
}

- (ICLiveLink)liveLink
{
  return self->_liveLink;
}

- (void)setLinkState:(int64_t)a3
{
  self->_linkState = a3;
}

- (int64_t)linkState
{
  return self->_linkState;
}

- (void)setInitialTracklist:(id)a3
{
}

- (MSVSectionedCollection)initialTracklist
{
  return self->_initialTracklist;
}

- (void)setStartIndexPath:(id)a3
{
}

- (NSIndexPath)startIndexPath
{
  return self->_startIndexPath;
}

- (void)setInitialIntent:(id)a3
{
}

- (MPCPlaybackIntent)initialIntent
{
  return self->_initialIntent;
}

- (void)setSourceState:(int64_t)a3
{
  self->_sourceState = a3;
}

- (int64_t)sourceState
{
  return self->_sourceState;
}

- (void)setBuildState:(int64_t)a3
{
  self->_buildState = a3;
}

- (int64_t)buildState
{
  return self->_buildState;
}

- (void)setLock:(os_unfair_lock_s)a3
{
  self->_lock = a3;
}

- (os_unfair_lock_s)lock
{
  return self->_lock;
}

- (void)setCompletion:(id)a3
{
}

- (id)completion
{
  return self->_completion;
}

- (void)setStrongSelf:(id)a3
{
}

- (id)strongSelf
{
  return self->_strongSelf;
}

- (void)setShuffleMode:(int64_t)a3
{
  self->_shuffleMode = a3;
}

- (int64_t)shuffleMode
{
  return self->_shuffleMode;
}

- (void)setGuard:(id)a3
{
}

- (MSVBlockGuard)guard
{
  return self->_guard;
}

- (void)_transitionToLiveLinkState:(int64_t)a3 error:(id)a4
{
  uint64_t v46 = *MEMORY[0x263EF8340];
  id v7 = a4;
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  if (self->_buildState == 7)
  {
    v9 = os_log_create("com.apple.amp.mediaplaybackcore", "SharedSession");
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      initialIntent = self->_initialIntent;
      unint64_t linkState = self->_linkState;
      if (linkState >= 5)
      {
        objc_msgSend(NSString, "stringWithFormat:", @"Unknown/state=%ld", self->_linkState);
        v12 = (__CFString *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v12 = off_2643BE138[linkState];
      }
      v17 = v12;
      if ((unint64_t)a3 >= 5)
      {
        objc_msgSend(NSString, "stringWithFormat:", @"Unknown/state=%ld", a3);
        v18 = (__CFString *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v18 = off_2643BE138[a3];
      }
      *(_DWORD *)buf = 138543874;
      v41 = initialIntent;
      __int16 v42 = 2114;
      v43 = v17;
      __int16 v44 = 2114;
      v45 = v18;
      _os_log_impl(&dword_21BB87000, v9, OS_LOG_TYPE_DEFAULT, "%{public}@ _transitionToLiveLinkState [ignoring] %{public}@ -> %{public}@", buf, 0x20u);
    }
    os_unfair_lock_unlock(p_lock);
    goto LABEL_49;
  }
  int64_t v13 = a3 | (self->_linkState << 16);
  if (v13 <= 65538)
  {
    if (v13 == 1)
    {
      int v39 = 0;
      uint64_t v38 = 0;
      char v14 = 1;
      int v15 = 1;
      goto LABEL_29;
    }
    if (v13 != 65538) {
      goto LABEL_21;
    }
    goto LABEL_12;
  }
  if (v13 != 65539)
  {
    if (v13 != 196610)
    {
      if (v13 == 196612)
      {
        char v14 = 0;
        int v39 = 0;
        int v15 = 0;
        uint64_t v16 = 4;
LABEL_13:
        uint64_t v38 = v16;
        goto LABEL_29;
      }
LABEL_21:
      v19 = [MEMORY[0x263F08690] currentHandler];
      unint64_t v20 = self->_linkState;
      if (v20 >= 5)
      {
        objc_msgSend(NSString, "stringWithFormat:", @"Unknown/state=%ld", self->_linkState);
        v21 = (__CFString *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v21 = off_2643BE138[v20];
      }
      if ((unint64_t)a3 >= 5)
      {
        objc_msgSend(NSString, "stringWithFormat:", @"Unknown/state=%ld", a3);
        v22 = (__CFString *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v22 = off_2643BE138[a3];
      }
      [v19 handleFailureInMethod:a2, self, @"MPCSharedListeningPlaybackIntentDataSource.m", 481, @"Unexpected state transition %@ -> %@", v21, v22 object file lineNumber description];

      goto LABEL_28;
    }
LABEL_12:
    char v14 = 0;
    int v15 = 0;
    int v39 = 1;
    uint64_t v16 = 3;
    goto LABEL_13;
  }
LABEL_28:
  int v39 = 0;
  uint64_t v38 = 0;
  int v15 = 0;
  char v14 = 1;
LABEL_29:
  v23 = os_log_create("com.apple.amp.mediaplaybackcore", "SharedSession");
  if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
  {
    v24 = self->_initialIntent;
    unint64_t v25 = self->_linkState;
    if (v25 >= 5)
    {
      objc_msgSend(NSString, "stringWithFormat:", @"Unknown/state=%ld", self->_linkState);
      v26 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v26 = off_2643BE138[v25];
    }
    v27 = v26;
    if ((unint64_t)a3 >= 5)
    {
      objc_msgSend(NSString, "stringWithFormat:", @"Unknown/state=%ld", a3);
      v28 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v28 = off_2643BE138[a3];
    }
    *(_DWORD *)buf = 138543874;
    v41 = v24;
    __int16 v42 = 2114;
    v43 = v27;
    __int16 v44 = 2114;
    v45 = v28;
    _os_log_impl(&dword_21BB87000, v23, OS_LOG_TYPE_DEFAULT, "%{public}@ _transitionToLiveLinkState %{public}@ -> %{public}@", buf, 0x20u);
  }
  self->_unint64_t linkState = a3;
  os_unfair_lock_unlock(&self->_lock);
  if (v15)
  {
    os_unfair_lock_lock(&self->_lock);
    v29 = [MEMORY[0x263F89180] linkWithIdentity:self->_identity];
    [v29 setDelegate:self];
    objc_storeStrong((id *)&self->_liveLink, v29);
    os_unfair_lock_unlock(&self->_lock);
    v30 = os_log_create("com.apple.amp.mediaplaybackcore", "SharedSession");
    os_signpost_id_t v31 = os_signpost_id_make_with_pointer(v30, self->_initialIntent);

    v32 = os_log_create("com.apple.amp.mediaplaybackcore", "SharedSession");
    v33 = v32;
    if (v31 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v32))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_21BB87000, v33, OS_SIGNPOST_INTERVAL_BEGIN, v31, "link:start", "", buf, 2u);
    }

    [(ICLiveLink *)self->_liveLink start];
  }
  if ((v14 & 1) == 0)
  {
    os_unfair_lock_lock(&self->_lock);
    int64_t v34 = [(MPCSharedListeningPlaybackIntentDataSource *)self buildState];
    int64_t v35 = [(MPCSharedListeningPlaybackIntentDataSource *)self sourceState];
    os_unfair_lock_unlock(&self->_lock);
    if (v34 == 1)
    {
      if (v39)
      {
        v36 = self;
        uint64_t v37 = 3;
      }
      else
      {
        if (v35 != 3) {
          goto LABEL_49;
        }
        v36 = self;
        uint64_t v37 = v38;
      }
      [(MPCSharedListeningPlaybackIntentDataSource *)v36 _transitionToBuildState:v37 intent:0 error:v7];
    }
  }
LABEL_49:
}

- (void)_transitionToLiveLinkState:(int64_t)a3
{
}

- (void)_transitionToSourceState:(int64_t)a3 error:(id)a4
{
  uint64_t v46 = *MEMORY[0x263EF8340];
  id v7 = a4;
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  if (self->_buildState == 7)
  {
    v9 = os_log_create("com.apple.amp.mediaplaybackcore", "SharedSession");
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      unint64_t sourceState = self->_sourceState;
      initialIntent = self->_initialIntent;
      if (sourceState >= 4)
      {
        objc_msgSend(NSString, "stringWithFormat:", @"Unknown/state=%ld", self->_sourceState);
        v12 = (__CFString *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v12 = off_2643BE118[sourceState];
      }
      uint64_t v16 = v12;
      if ((unint64_t)a3 >= 4)
      {
        objc_msgSend(NSString, "stringWithFormat:", @"Unknown/state=%ld", a3);
        v17 = (__CFString *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v17 = off_2643BE118[a3];
      }
      *(_DWORD *)buf = 138543874;
      v41 = initialIntent;
      __int16 v42 = 2114;
      v43 = v16;
      __int16 v44 = 2114;
      v45 = v17;
      _os_log_impl(&dword_21BB87000, v9, OS_LOG_TYPE_DEFAULT, "%{public}@ _transitionToSourceState [ignoring] %{public}@ -> %{public}@", buf, 0x20u);
    }
    os_unfair_lock_unlock(p_lock);
  }
  else
  {
    int64_t v13 = a3 | (self->_sourceState << 16);
    switch(v13)
    {
      case 1:
        uint64_t v38 = 0x100000000;
        uint64_t v15 = 0;
        int v14 = 1;
        break;
      case 65538:
        int v14 = 0;
        uint64_t v38 = 1;
        uint64_t v15 = 2;
        break;
      case 65539:
        uint64_t v38 = 0;
        int v14 = 0;
        uint64_t v15 = 4;
        break;
      default:
        v18 = [MEMORY[0x263F08690] currentHandler];
        unint64_t v19 = self->_sourceState;
        if (v19 >= 4)
        {
          objc_msgSend(NSString, "stringWithFormat:", @"Unknown/state=%ld", self->_sourceState);
          unint64_t v20 = (__CFString *)objc_claimAutoreleasedReturnValue();
        }
        else
        {
          unint64_t v20 = off_2643BE118[v19];
        }
        if ((unint64_t)a3 >= 4)
        {
          objc_msgSend(NSString, "stringWithFormat:", @"Unknown/state=%ld", a3);
          v21 = (__CFString *)objc_claimAutoreleasedReturnValue();
        }
        else
        {
          v21 = off_2643BE118[a3];
        }
        [v18 handleFailureInMethod:a2, self, @"MPCSharedListeningPlaybackIntentDataSource.m", 382, @"Unexpected state transition %@ -> %@", v20, v21 object file lineNumber description];

        uint64_t v15 = 0;
        int v14 = 0;
        uint64_t v38 = 0x100000000;
        break;
    }
    v22 = os_log_create("com.apple.amp.mediaplaybackcore", "SharedSession");
    if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v37 = v15;
      id v23 = v7;
      v24 = a2;
      unint64_t v25 = self->_sourceState;
      v26 = self->_initialIntent;
      if (v25 >= 4)
      {
        objc_msgSend(NSString, "stringWithFormat:", @"Unknown/state=%ld", self->_sourceState);
        v27 = (__CFString *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v27 = off_2643BE118[v25];
      }
      v28 = v27;
      if ((unint64_t)a3 >= 4)
      {
        objc_msgSend(NSString, "stringWithFormat:", @"Unknown/state=%ld", a3);
        v29 = (__CFString *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v29 = off_2643BE118[a3];
      }
      *(_DWORD *)buf = 138543874;
      v41 = v26;
      __int16 v42 = 2114;
      v43 = v28;
      __int16 v44 = 2114;
      v45 = v29;
      _os_log_impl(&dword_21BB87000, v22, OS_LOG_TYPE_DEFAULT, "%{public}@ _transitionToSourceState %{public}@ -> %{public}@", buf, 0x20u);

      a2 = v24;
      id v7 = v23;
      uint64_t v15 = v37;
    }

    self->_unint64_t sourceState = a3;
    os_unfair_lock_unlock(&self->_lock);
    if (v14)
    {
      v30 = os_log_create("com.apple.amp.mediaplaybackcore", "SharedSession");
      os_signpost_id_t v31 = os_signpost_id_make_with_pointer(v30, self->_initialIntent);

      v32 = os_log_create("com.apple.amp.mediaplaybackcore", "SharedSession");
      v33 = v32;
      if (v31 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v32))
      {
        *(_WORD *)buf = 0;
        _os_signpost_emit_with_name_impl(&dword_21BB87000, v33, OS_SIGNPOST_INTERVAL_BEGIN, v31, "source:getPlaybackContext", "", buf, 2u);
      }

      int64_t v34 = self->_initialIntent;
      v39[0] = MEMORY[0x263EF8330];
      v39[1] = 3221225472;
      v39[2] = __77__MPCSharedListeningPlaybackIntentDataSource__transitionToSourceState_error___block_invoke;
      v39[3] = &unk_2643BE080;
      v39[4] = self;
      v39[5] = a2;
      v39[6] = v31;
      [(MPCPlaybackIntent *)v34 getRemotePlaybackQueueWithDestination:1 completion:v39];
    }
    if ((v38 & 0x100000000) == 0)
    {
      os_unfair_lock_lock(&self->_lock);
      int64_t v35 = [(MPCSharedListeningPlaybackIntentDataSource *)self buildState];
      int64_t v36 = [(MPCSharedListeningPlaybackIntentDataSource *)self linkState];
      os_unfair_lock_unlock(&self->_lock);
      if (v35 == 1)
      {
        if (v38)
        {
          [(MPCSharedListeningPlaybackIntentDataSource *)self _transitionToBuildState:2 intent:0 error:v7];
        }
        else if (v36 == 4)
        {
          [(MPCSharedListeningPlaybackIntentDataSource *)self _transitionToBuildState:v15];
        }
      }
    }
  }
}

void __77__MPCSharedListeningPlaybackIntentDataSource__transitionToSourceState_error___block_invoke(void *a1, void *a2)
{
  id v3 = a2;
  if (!v3)
  {
    v4 = [MEMORY[0x263F08690] currentHandler];
    objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a1[5], *(void *)(a1[4] + 64));
  }
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __77__MPCSharedListeningPlaybackIntentDataSource__transitionToSourceState_error___block_invoke_2;
  v5[3] = &unk_2643BE058;
  long long v6 = *((_OWORD *)a1 + 2);
  uint64_t v7 = a1[6];
  [v3 getMusicPlaybackContextWithOptions:0 completion:v5];
}

void __77__MPCSharedListeningPlaybackIntentDataSource__transitionToSourceState_error___block_invoke_2(void *a1, void *a2, void *a3)
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  if (!v5)
  {
    int64_t v13 = [MEMORY[0x263F08690] currentHandler];
    objc_msgSend(v13, "handleFailureInMethod:object:file:lineNumber:description:", a1[5], *(void *)(a1[4] + 64));
  }
  uint64_t v7 = os_log_create("com.apple.amp.mediaplaybackcore", "SharedSession");
  v8 = v7;
  os_signpost_id_t v9 = a1[6];
  if (v9 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v7))
  {
    *(_DWORD *)buf = 138543362;
    id v17 = v6;
    _os_signpost_emit_with_name_impl(&dword_21BB87000, v8, OS_SIGNPOST_INTERVAL_END, v9, "source:getPlaybackContext", "error=%{public}@", buf, 0xCu);
  }

  os_unfair_lock_lock((os_unfair_lock_t)(a1[4] + 8));
  uint64_t v10 = a1[4];
  uint64_t v11 = *(void *)(v10 + 48);
  os_unfair_lock_unlock((os_unfair_lock_t)(v10 + 8));
  if (v11 != 7)
  {
    v14[0] = MEMORY[0x263EF8330];
    v14[1] = 3221225472;
    v14[2] = __77__MPCSharedListeningPlaybackIntentDataSource__transitionToSourceState_error___block_invoke_52;
    v14[3] = &unk_2643BE030;
    long long v15 = *((_OWORD *)a1 + 2);
    id v12 = (id)[v5 getSharedListeningTracklistWithCompletion:v14];
  }
}

void __77__MPCSharedListeningPlaybackIntentDataSource__transitionToSourceState_error___block_invoke_52(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v11 = a2;
  id v7 = a3;
  id v8 = a4;
  if (v8)
  {
    os_signpost_id_t v9 = objc_msgSend(MEMORY[0x263F087E8], "msv_errorWithDomain:code:underlyingError:debugDescription:", @"MPCPlayerEnqueueError", 3, v8, @"Content type is not supported in live link");
    [*(id *)(a1 + 32) _transitionToSourceState:2 error:v9];
  }
  else
  {
    if (!v11)
    {
      uint64_t v10 = [MEMORY[0x263F08690] currentHandler];
      [v10 handleFailureInMethod:*(void *)(a1 + 40) object:*(void *)(a1 + 32) file:@"MPCSharedListeningPlaybackIntentDataSource.m" lineNumber:415 description:@"Missing required parameters (tracklist) [error == nil]"];
    }
    os_unfair_lock_lock((os_unfair_lock_t)(*(void *)(a1 + 32) + 8));
    [*(id *)(a1 + 32) setInitialTracklist:v11];
    [*(id *)(a1 + 32) setStartIndexPath:v7];
    os_unfair_lock_unlock((os_unfair_lock_t)(*(void *)(a1 + 32) + 8));
    [*(id *)(a1 + 32) _transitionToSourceState:3];
  }
}

- (void)_transitionToSourceState:(int64_t)a3
{
}

- (void)_transitionToBuildState:(int64_t)a3 intent:(id)a4 error:(id)a5
{
  uint64_t v66 = *MEMORY[0x263EF8340];
  os_signpost_id_t v9 = (__CFString *)a4;
  id v10 = a5;
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  int64_t buildState = self->_buildState;
  int64_t v13 = a3 | (buildState << 16);
  if (v13 > 65539)
  {
    if ((unint64_t)(v13 - 262149) >= 2)
    {
      if (v13 == 65540)
      {
        int v14 = 0;
        int v16 = 0;
        int v15 = 1;
        goto LABEL_7;
      }
      goto LABEL_33;
    }
LABEL_6:
    int v15 = 0;
    int v16 = 0;
    int v14 = 1;
    goto LABEL_7;
  }
  if ((unint64_t)(v13 - 65538) < 2) {
    goto LABEL_6;
  }
  if (v13 != 1)
  {
LABEL_33:
    if (buildState == 7)
    {
      v45 = os_log_create("com.apple.amp.mediaplaybackcore", "SharedSession");
      if (os_log_type_enabled(v45, OS_LOG_TYPE_DEFAULT))
      {
        id v46 = v10;
        v47 = v9;
        initialIntent = self->_initialIntent;
        unint64_t v49 = self->_buildState;
        if (v49 >= 8)
        {
          objc_msgSend(NSString, "stringWithFormat:", @"Unknown/state=%ld", self->_buildState);
          v50 = (__CFString *)objc_claimAutoreleasedReturnValue();
        }
        else
        {
          v50 = off_2643BE0D8[v49];
        }
        v54 = v50;
        if ((unint64_t)a3 >= 8)
        {
          objc_msgSend(NSString, "stringWithFormat:", @"Unknown/state=%ld", a3);
          v55 = (__CFString *)objc_claimAutoreleasedReturnValue();
        }
        else
        {
          v55 = off_2643BE0D8[a3];
        }
        *(_DWORD *)buf = 138543874;
        v61 = initialIntent;
        __int16 v62 = 2114;
        v63 = v54;
        __int16 v64 = 2114;
        v65 = v55;
        _os_log_impl(&dword_21BB87000, v45, OS_LOG_TYPE_DEFAULT, "%{public}@ _transitionToBuildState [ignoring] %{public}@ -> %{public}@", buf, 0x20u);

        os_signpost_id_t v9 = v47;
        id v10 = v46;
      }

      os_unfair_lock_unlock(p_lock);
      goto LABEL_30;
    }
    if (a3 != 7)
    {
      v51 = [MEMORY[0x263F08690] currentHandler];
      unint64_t v52 = self->_buildState;
      if (v52 >= 8)
      {
        objc_msgSend(NSString, "stringWithFormat:", @"Unknown/state=%ld", self->_buildState);
        v53 = (__CFString *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v53 = off_2643BE0D8[v52];
      }
      if ((unint64_t)a3 >= 7)
      {
        objc_msgSend(NSString, "stringWithFormat:", @"Unknown/state=%ld", a3);
        v56 = (__CFString *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v56 = off_2643BE0A0[a3];
      }
      [v51 handleFailureInMethod:a2, self, @"MPCSharedListeningPlaybackIntentDataSource.m", 300, @"Unexpected state transition %@ -> %@", v53, v56 object file lineNumber description];

      int v14 = 0;
      int v15 = 0;
      int v16 = 0;
      goto LABEL_7;
    }
    goto LABEL_6;
  }
  int v14 = 0;
  int v15 = 0;
  int v16 = 1;
LABEL_7:
  id v17 = os_log_create("com.apple.amp.mediaplaybackcore", "SharedSession");
  v58 = v9;
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
  {
    id v57 = v10;
    uint64_t v18 = self->_initialIntent;
    unint64_t v19 = self->_buildState;
    int v20 = v14;
    if (v19 >= 8)
    {
      objc_msgSend(NSString, "stringWithFormat:", @"Unknown/state=%ld", self->_buildState);
      v21 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v21 = off_2643BE0D8[v19];
    }
    v22 = v21;
    if ((unint64_t)a3 >= 8)
    {
      objc_msgSend(NSString, "stringWithFormat:", @"Unknown/state=%ld", a3);
      id v23 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      id v23 = off_2643BE0D8[a3];
    }
    *(_DWORD *)buf = 138543874;
    v61 = v18;
    __int16 v62 = 2114;
    v63 = v22;
    __int16 v64 = 2114;
    v65 = v23;
    _os_log_impl(&dword_21BB87000, v17, OS_LOG_TYPE_DEFAULT, "%{public}@ _transitionToBuildState %{public}@ -> %{public}@", buf, 0x20u);

    os_signpost_id_t v9 = v58;
    int v14 = v20;
    id v10 = v57;
  }

  self->_int64_t buildState = a3;
  os_unfair_lock_unlock(&self->_lock);
  if (v16)
  {
    [(MPCSharedListeningPlaybackIntentDataSource *)self _transitionToSourceState:1];
    [(MPCSharedListeningPlaybackIntentDataSource *)self _transitionToLiveLinkState:1];
    if (!v15)
    {
LABEL_17:
      if (!v14) {
        goto LABEL_30;
      }
      goto LABEL_24;
    }
  }
  else if (!v15)
  {
    goto LABEL_17;
  }
  id v24 = v10;
  int v25 = v14;
  os_unfair_lock_lock(&self->_lock);
  v26 = [(ICLiveLink *)self->_liveLink queue];
  v27 = [(MPCSharedListeningPlaybackIntentDataSource *)self initialTracklist];
  v28 = [(MPCSharedListeningPlaybackIntentDataSource *)self startIndexPath];
  os_unfair_lock_unlock(&self->_lock);
  v29 = os_log_create("com.apple.amp.mediaplaybackcore", "SharedSession");
  os_signpost_id_t v30 = os_signpost_id_make_with_pointer(v29, self->_initialIntent);

  os_signpost_id_t v31 = os_log_create("com.apple.amp.mediaplaybackcore", "SharedSession");
  v32 = v31;
  if (v30 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v31))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_21BB87000, v32, OS_SIGNPOST_INTERVAL_BEGIN, v30, "build:replace", "", buf, 2u);
  }

  v59[0] = MEMORY[0x263EF8330];
  v59[1] = 3221225472;
  v59[2] = __83__MPCSharedListeningPlaybackIntentDataSource__transitionToBuildState_intent_error___block_invoke;
  v59[3] = &unk_2643BE008;
  v59[4] = self;
  v59[5] = v30;
  [v26 replaceTracklist:v27 preferredStartIndexPath:v28 completion:v59];

  int v33 = v25;
  id v10 = v24;
  os_signpost_id_t v9 = v58;
  if (v33)
  {
LABEL_24:
    int64_t v34 = [(MPCSharedListeningPlaybackIntentDataSource *)self guard];
    [v34 disarm];

    int64_t v35 = [MPCPlayerCommandStatus alloc];
    int64_t v36 = objc_msgSend(v10, "mpc_remoteCommandStatus");
    uint64_t v37 = [(MPCPlayerCommandStatus *)v35 initWithMPStatus:v36 request:0];

    uint64_t v38 = os_log_create("com.apple.amp.mediaplaybackcore", "SharedSession");
    if (os_log_type_enabled(v38, OS_LOG_TYPE_DEFAULT))
    {
      int v39 = self->_initialIntent;
      *(_DWORD *)buf = 138543874;
      v61 = v39;
      __int16 v62 = 2114;
      v63 = v9;
      __int16 v64 = 2114;
      v65 = (__CFString *)v37;
      _os_log_impl(&dword_21BB87000, v38, OS_LOG_TYPE_DEFAULT, "%{public}@: calling completion intent=%{public}@ status=%{public}@", buf, 0x20u);
    }

    v40 = os_log_create("com.apple.amp.mediaplaybackcore", "SharedSession");
    os_signpost_id_t v41 = os_signpost_id_make_with_pointer(v40, self->_initialIntent);

    __int16 v42 = os_log_create("com.apple.amp.mediaplaybackcore", "SharedSession");
    v43 = v42;
    if (v41 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v42))
    {
      *(_DWORD *)buf = 138543618;
      v61 = (MPCPlaybackIntent *)v9;
      __int16 v62 = 2114;
      v63 = (__CFString *)v37;
      _os_signpost_emit_with_name_impl(&dword_21BB87000, v43, OS_SIGNPOST_INTERVAL_END, v41, "build", "intent=%{public}@ status=%{public}@", buf, 0x16u);
    }

    __int16 v44 = [(MPCSharedListeningPlaybackIntentDataSource *)self completion];
    ((void (**)(void, __CFString *, MPCPlayerCommandStatus *))v44)[2](v44, v9, v37);

    [(MPCSharedListeningPlaybackIntentDataSource *)self setCompletion:0];
    [(MPCSharedListeningPlaybackIntentDataSource *)self setStrongSelf:0];
  }
LABEL_30:
}

void __83__MPCSharedListeningPlaybackIntentDataSource__transitionToBuildState_intent_error___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  id v3 = a2;
  v4 = os_log_create("com.apple.amp.mediaplaybackcore", "SharedSession");
  id v5 = v4;
  os_signpost_id_t v6 = *(void *)(a1 + 40);
  if (v6 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v4))
  {
    int v13 = 138543362;
    id v14 = v3;
    _os_signpost_emit_with_name_impl(&dword_21BB87000, v5, OS_SIGNPOST_INTERVAL_END, v6, "build:replace", "error=%{public}@", (uint8_t *)&v13, 0xCu);
  }

  id v7 = *(os_unfair_lock_s **)(a1 + 32);
  if (v3)
  {
    [(os_unfair_lock_s *)v7 _transitionToBuildState:5 intent:0 error:v3];
  }
  else
  {
    os_unfair_lock_lock(v7 + 2);
    id v8 = [*(id *)(*(void *)(a1 + 32) + 96) identifier];
    os_signpost_id_t v9 = [*(id *)(*(void *)(a1 + 32) + 96) sessionKey];
    id v10 = +[MPCPlaybackSharedListeningProperties propertiesWithSessionIdentifier:v8 sessionKey:v9];

    [v10 setLiveLink:*(void *)(*(void *)(a1 + 32) + 96)];
    id v11 = [*(id *)(*(void *)(a1 + 32) + 96) identity];
    id v12 = +[MPCPlaybackIntent sharedSessionIntentWithProperties:v10 identity:v11];

    os_unfair_lock_unlock((os_unfair_lock_t)(*(void *)(a1 + 32) + 8));
    [*(id *)(a1 + 32) _transitionToBuildState:6 intent:v12 error:0];
  }
}

- (void)_transitionToBuildState:(int64_t)a3
{
}

- (void)liveLink:(id)a3 didUpdateQueue:(id)a4
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  id v5 = a4;
  os_unfair_lock_lock(&self->_lock);
  int64_t v6 = [(MPCSharedListeningPlaybackIntentDataSource *)self linkState];
  os_unfair_lock_unlock(&self->_lock);
  if (v6 == 3)
  {
    id v7 = [v5 items];
    uint64_t v8 = [v7 count];

    if (v8)
    {
      os_signpost_id_t v9 = (void *)MEMORY[0x263F087E8];
      id v10 = [v5 items];
      id v11 = objc_msgSend(v9, "msv_errorWithDomain:code:debugDescription:", @"MPCError", 28, @"Canceling intent loading because live link already had content %@", v10);

      [(MPCSharedListeningPlaybackIntentDataSource *)self _transitionToLiveLinkState:2 error:v11];
    }
    else
    {
      [(MPCSharedListeningPlaybackIntentDataSource *)self _transitionToLiveLinkState:4];
    }
  }
  id v12 = os_log_create("com.apple.amp.mediaplaybackcore", "SharedSession");
  if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138543362;
    id v14 = self;
    _os_log_impl(&dword_21BB87000, v12, OS_LOG_TYPE_INFO, "%{public}@ didUpdateQueue:", buf, 0xCu);
  }
}

- (void)liveLink:(id)a3 didEncounterError:(id)a4 willRetry:(BOOL)a5
{
  if (!a5)
  {
    objc_msgSend(MEMORY[0x263F087E8], "msv_errorWithDomain:code:underlyingError:debugDescription:", @"MPCError", 1, a4, @"Live link connection failed");
    id v7 = (id)objc_claimAutoreleasedReturnValue();
    [(MPCSharedListeningPlaybackIntentDataSource *)self _transitionToLiveLinkState:2 error:v7];
  }
}

- (void)didStartLiveLink:(id)a3
{
  id v4 = a3;
  uint64_t v5 = os_log_create("com.apple.amp.mediaplaybackcore", "SharedSession");
  os_signpost_id_t v6 = os_signpost_id_make_with_pointer(v5, self->_initialIntent);

  id v7 = os_log_create("com.apple.amp.mediaplaybackcore", "SharedSession");
  uint64_t v8 = v7;
  if (v6 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v7))
  {
    *(_WORD *)id v11 = 0;
    _os_signpost_emit_with_name_impl(&dword_21BB87000, v8, OS_SIGNPOST_INTERVAL_END, v6, "link:start", "", v11, 2u);
  }

  [(MPCSharedListeningPlaybackIntentDataSource *)self _transitionToLiveLinkState:3];
  os_signpost_id_t v9 = +[MPCSharedListeningLiveLinkReusePool sharedReusePool];
  id v10 = [v4 identifier];
  [v9 storeLiveLink:v4 forSessionID:v10];
}

- (void)getRemotePlaybackQueueFromIntent:(id)a3 destination:(int64_t)a4 completion:(id)a5
{
  v19[2] = *MEMORY[0x263EF8340];
  id v7 = a3;
  uint64_t v8 = (void (**)(id, void *, void))a5;
  if ((unint64_t)(a4 - 2) < 2) {
    goto LABEL_4;
  }
  if (a4 == 1)
  {
    os_signpost_id_t v9 = [v7 tracklistToken];
    BOOL v10 = [v7 actionAfterQueueLoad] == 20;
    id v11 = objc_alloc(MEMORY[0x263F11D80]);
    id v12 = [MEMORY[0x263EFF8F8] data];
    v19[0] = v9;
    uint64_t v13 = *MEMORY[0x263F54CA8];
    v18[0] = @"sharedListeningToken";
    v18[1] = v13;
    id v14 = [v9 sharedListeningProperties];
    uint64_t v15 = [v14 sessionIdentifier];
    v19[1] = v15;
    int v16 = [NSDictionary dictionaryWithObjects:v19 forKeys:v18 count:2];
    id v17 = (void *)[v11 initWithIdentifier:@"InProcess-com.apple.music.playbackqueue.sharedlistening" data:v12 options:v16];

    [v17 setRequestingImmediatePlayback:v10];
    v8[2](v8, v17, 0);

    goto LABEL_6;
  }
  if (!a4)
  {
LABEL_4:
    os_signpost_id_t v9 = objc_msgSend(MEMORY[0x263F087E8], "msv_errorWithDomain:code:debugDescription:", @"MPCError", 58, @"Cannot create a remote queue for destination: %ld", a4);
    ((void (**)(id, void *, void *))v8)[2](v8, 0, v9);
LABEL_6:
  }
}

- (void)getRepresentativeObjectFromIntent:(id)a3 properties:(id)a4 completion:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  BOOL v10 = [[_MPCQueueControllerBehaviorMusicSharePlay alloc] initWithSessionID:0];
  v15[0] = MEMORY[0x263EF8330];
  v15[1] = 3221225472;
  v15[2] = __102__MPCSharedListeningPlaybackIntentDataSource_getRepresentativeObjectFromIntent_properties_completion___block_invoke;
  v15[3] = &unk_2643BDFE0;
  id v16 = v7;
  id v17 = v10;
  id v18 = v8;
  id v19 = v9;
  id v11 = v8;
  id v12 = v10;
  id v13 = v7;
  id v14 = v9;
  [v13 getRemotePlaybackQueueWithDestination:1 completion:v15];
}

void __102__MPCSharedListeningPlaybackIntentDataSource_getRepresentativeObjectFromIntent_properties_completion___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v5 = a2;
  if (!v5 || a3)
  {
    uint64_t v9 = *(void *)(a1 + 56);
    os_signpost_id_t v6 = objc_msgSend(MEMORY[0x263F087E8], "msv_errorWithDomain:code:underlyingError:debugDescription:", @"MPCPlaybackEngineInternalError", 3000, a3, @"Failed to build playback queue from intent %@", *(void *)(a1 + 32));
    (*(void (**)(uint64_t, void, void, void *))(v9 + 16))(v9, 0, 0, v6);
  }
  else
  {
    os_signpost_id_t v6 = (void *)[objc_alloc(MEMORY[0x263F12238]) initWithCommand:0 playbackQueue:v5];
    id v7 = *(void **)(a1 + 40);
    v10[0] = MEMORY[0x263EF8330];
    v10[1] = 3221225472;
    v10[2] = __102__MPCSharedListeningPlaybackIntentDataSource_getRepresentativeObjectFromIntent_properties_completion___block_invoke_2;
    v10[3] = &unk_2643C2AF0;
    id v14 = *(id *)(a1 + 56);
    id v11 = 0;
    id v12 = *(id *)(a1 + 40);
    id v13 = *(id *)(a1 + 48);
    id v8 = (id)[v7 performLoadCommand:v6 completion:v10];
  }
}

void __102__MPCSharedListeningPlaybackIntentDataSource_getRepresentativeObjectFromIntent_properties_completion___block_invoke_2(uint64_t a1, uint64_t a2)
{
  if (a2)
  {
    uint64_t v3 = *(void *)(a1 + 56);
    objc_msgSend(MEMORY[0x263F087E8], "msv_errorWithDomain:code:underlyingError:debugDescription:", @"MPCPlaybackEngineInternalError", 3000, *(void *)(a1 + 32), @"Failed to perform load queue command");
    id v5 = (id)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, void, void, id))(v3 + 16))(v3, 0, 0, v5);
  }
  else
  {
    v6[0] = MEMORY[0x263EF8330];
    v6[1] = 3221225472;
    v6[2] = __102__MPCSharedListeningPlaybackIntentDataSource_getRepresentativeObjectFromIntent_properties_completion___block_invoke_3;
    v6[3] = &unk_2643BDFB8;
    id v4 = *(void **)(a1 + 40);
    id v7 = *(id *)(a1 + 48);
    id v8 = *(id *)(a1 + 56);
    [v4 getExpectedCurrentItemModelObjectWithCompletion:v6];
  }
}

void __102__MPCSharedListeningPlaybackIntentDataSource_getRepresentativeObjectFromIntent_properties_completion___block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  id v5 = a3;
  os_signpost_id_t v6 = [a2 flattenedGenericObject];
  id v7 = (id)[v6 copyWithPropertySet:*(void *)(a1 + 32)];

  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (void)buildSharedSessionIntentWithIntent:(id)a3 identity:(id)a4 completion:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  [(MPCSharedListeningPlaybackIntentDataSource *)self setStrongSelf:self];
  [(MPCSharedListeningPlaybackIntentDataSource *)self setInitialIntent:v9];
  -[MPCSharedListeningPlaybackIntentDataSource setShuffleMode:](self, "setShuffleMode:", [v9 shuffleMode]);
  [(MPCSharedListeningPlaybackIntentDataSource *)self setIdentity:v10];
  [(MPCSharedListeningPlaybackIntentDataSource *)self setCompletion:v11];
  id v12 = os_log_create("com.apple.amp.mediaplaybackcore", "SharedSession");
  os_signpost_id_t v13 = os_signpost_id_make_with_pointer(v12, v9);

  id v14 = os_log_create("com.apple.amp.mediaplaybackcore", "SharedSession");
  uint64_t v15 = v14;
  if (v13 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v14))
  {
    LOWORD(buf[0]) = 0;
    _os_signpost_emit_with_name_impl(&dword_21BB87000, v15, OS_SIGNPOST_INTERVAL_BEGIN, v13, "build", "", (uint8_t *)buf, 2u);
  }

  [(MPCSharedListeningPlaybackIntentDataSource *)self setLock:0];
  objc_initWeak(buf, self);
  id v16 = objc_alloc(MEMORY[0x263F54ED0]);
  v18[0] = MEMORY[0x263EF8330];
  v18[1] = 3221225472;
  void v18[2] = __101__MPCSharedListeningPlaybackIntentDataSource_buildSharedSessionIntentWithIntent_identity_completion___block_invoke;
  v18[3] = &unk_2643BDF90;
  v19[1] = (id)a2;
  v18[4] = self;
  objc_copyWeak(v19, buf);
  id v17 = (void *)[v16 initWithTimeout:v18 interruptionHandler:25.0];
  [(MPCSharedListeningPlaybackIntentDataSource *)self setGuard:v17];

  [(MPCSharedListeningPlaybackIntentDataSource *)self _transitionToBuildState:1];
  objc_destroyWeak(v19);
  objc_destroyWeak(buf);
}

void __101__MPCSharedListeningPlaybackIntentDataSource_buildSharedSessionIntentWithIntent_identity_completion___block_invoke(uint64_t a1, uint64_t a2)
{
  if (a2 == 1)
  {
    id v7 = [MEMORY[0x263F08690] currentHandler];
    [v7 handleFailureInMethod:*(void *)(a1 + 48) object:*(void *)(a1 + 32) file:@"MPCSharedListeningPlaybackIntentDataSource.m" lineNumber:154 description:@"Deallocated without calling live link completion"];

    WeakRetained = (os_unfair_lock_s *)objc_loadWeakRetained((id *)(a1 + 40));
  }
  else
  {
    WeakRetained = (os_unfair_lock_s *)objc_loadWeakRetained((id *)(a1 + 40));
    if (!a2 && WeakRetained)
    {
      id v8 = WeakRetained;
      id v5 = objc_msgSend(MEMORY[0x263F087E8], "msv_errorWithDomain:code:debugDescription:", @"MPCError", 14, @"Build shared intent timeout");
      [(os_unfair_lock_s *)v8 _transitionToBuildState:7 intent:0 error:v5];

      os_unfair_lock_lock(v8 + 2);
      os_signpost_id_t v6 = [(os_unfair_lock_s *)v8 liveLink];
      os_unfair_lock_unlock(v8 + 2);
      [v6 stop];

      WeakRetained = v8;
    }
  }
}

@end