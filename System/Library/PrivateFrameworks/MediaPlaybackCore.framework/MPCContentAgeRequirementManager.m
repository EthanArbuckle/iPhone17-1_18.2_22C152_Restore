@interface MPCContentAgeRequirementManager
+ (MPCContentAgeRequirementManager)sharedManager;
- (BOOL)_askPlaybackAuthorizationForItem:(id)a3 reason:(int64_t)a4;
- (BOOL)_shouldAskPlaybackAuthorizationForItem:(id)a3 reason:(int64_t)a4;
- (BOOL)isItemAuthorized:(id)a3;
- (BOOL)isItemAuthorized:(id)a3 shouldAskForAuthorization:(BOOL)a4;
- (ICAgeVerificationState)lastKnownAgeVerificationState;
- (MPCContentAgeRequirementDelegate)delegate;
- (NSError)authorizationError;
- (id)_explicitContentErrorWithUnderlyingError:(id)a3 message:(id)a4;
- (id)_init;
- (id)_retrieveAgeVerificationStateForUserIdentity:(id)a3;
- (int64_t)authorizationReason;
- (int64_t)status;
- (void)_setupWithAgeGateForItem:(id)a3;
- (void)_setupWithAgeVerificationState:(id)a3;
- (void)_updateAuthorizationStatusWithAuthorizationState:(id)a3 forItem:(id)a4;
- (void)setAuthorizationError:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setLastKnownAgeVerificationState:(id)a3;
- (void)setStatus:(int64_t)a3;
@end

@implementation MPCContentAgeRequirementManager

- (void)setDelegate:(id)a3
{
}

+ (MPCContentAgeRequirementManager)sharedManager
{
  if (sharedManager_onceToken != -1) {
    dispatch_once(&sharedManager_onceToken, &__block_literal_global_22061);
  }
  v2 = (void *)sharedManager___sharedManager;

  return (MPCContentAgeRequirementManager *)v2;
}

void __48__MPCContentAgeRequirementManager_sharedManager__block_invoke()
{
  id v0 = [[MPCContentAgeRequirementManager alloc] _init];
  v1 = (void *)sharedManager___sharedManager;
  sharedManager___sharedManager = (uint64_t)v0;
}

- (id)_init
{
  v3.receiver = self;
  v3.super_class = (Class)MPCContentAgeRequirementManager;
  id result = [(MPCContentAgeRequirementManager *)&v3 init];
  if (result) {
    *((void *)result + 2) = 3;
  }
  return result;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lastKnownAgeVerificationState, 0);
  objc_storeStrong((id *)&self->_authorizationError, 0);

  objc_destroyWeak((id *)&self->_delegate);
}

- (void)setLastKnownAgeVerificationState:(id)a3
{
}

- (ICAgeVerificationState)lastKnownAgeVerificationState
{
  return self->_lastKnownAgeVerificationState;
}

- (void)setAuthorizationError:(id)a3
{
}

- (NSError)authorizationError
{
  return self->_authorizationError;
}

- (void)setStatus:(int64_t)a3
{
  self->_status = a3;
}

- (int64_t)status
{
  return self->_status;
}

- (MPCContentAgeRequirementDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (MPCContentAgeRequirementDelegate *)WeakRetained;
}

- (id)_explicitContentErrorWithUnderlyingError:(id)a3 message:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  v7 = (void *)[objc_alloc(MEMORY[0x263EFF9A0]) initWithCapacity:1];
  v8 = v7;
  if (v5) {
    [v7 setObject:v5 forKeyedSubscript:*MEMORY[0x263F08608]];
  }
  [v8 setObject:v6 forKeyedSubscript:*MEMORY[0x263F07F80]];
  v9 = [MEMORY[0x263F087E8] errorWithDomain:@"MPCError" code:41 userInfo:v8];

  return v9;
}

- (BOOL)_askPlaybackAuthorizationForItem:(id)a3 reason:(int64_t)a4
{
  uint64_t v39 = *MEMORY[0x263EF8340];
  id v7 = a3;
  uint64_t v31 = 0;
  v32 = &v31;
  uint64_t v33 = 0x2020000000;
  char v34 = 0;
  uint64_t v25 = 0;
  v26 = &v25;
  uint64_t v27 = 0x3032000000;
  v28 = __Block_byref_object_copy__22023;
  v29 = __Block_byref_object_dispose__22024;
  id v30 = 0;
  v8 = [(MPCContentAgeRequirementManager *)self delegate];
  if (v8)
  {
    id v9 = objc_alloc(MEMORY[0x263F54ED0]);
    v24[0] = MEMORY[0x263EF8330];
    v24[1] = 3221225472;
    v24[2] = __75__MPCContentAgeRequirementManager__askPlaybackAuthorizationForItem_reason___block_invoke;
    v24[3] = &unk_2643C4F28;
    v24[4] = self;
    v24[5] = a2;
    v10 = (void *)[v9 initWithDeallocHandler:v24];
    dispatch_semaphore_t v11 = dispatch_semaphore_create(0);
    v19[0] = MEMORY[0x263EF8330];
    v19[1] = 3221225472;
    v19[2] = __75__MPCContentAgeRequirementManager__askPlaybackAuthorizationForItem_reason___block_invoke_2;
    v19[3] = &unk_2643C3370;
    id v12 = v10;
    id v20 = v12;
    v22 = &v25;
    v23 = &v31;
    v13 = v11;
    v21 = v13;
    [v8 requestAuthorizationForExplicitItem:v7 reason:a4 completion:v19];
    dispatch_semaphore_wait(v13, 0xFFFFFFFFFFFFFFFFLL);
  }
  if (*((unsigned char *)v32 + 24))
  {
    v14 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134218242;
      v36 = self;
      __int16 v37 = 2114;
      id v38 = v7;
      _os_log_impl(&dword_21BB87000, v14, OS_LOG_TYPE_DEFAULT, "MPCContentAgeRequirementManager %p - Explicit content playback authorization has been granted by client for: %{public}@", buf, 0x16u);
    }
  }
  else
  {
    v14 = [NSString stringWithFormat:@"MPCContentAgeRequirementManager %p - Explicit content playback authorization has been denied by client for: %@", self, v7];
    v15 = [(MPCContentAgeRequirementManager *)self _explicitContentErrorWithUnderlyingError:v26[5] message:v14];
    [v7 setItemError:v15];

    v16 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 134218242;
      v36 = self;
      __int16 v37 = 2114;
      id v38 = v7;
      _os_log_impl(&dword_21BB87000, v16, OS_LOG_TYPE_ERROR, "MPCContentAgeRequirementManager %p - Explicit content playback authorization has been denied by client for: %{public}@", buf, 0x16u);
    }
  }
  BOOL v17 = *((unsigned char *)v32 + 24) != 0;

  _Block_object_dispose(&v25, 8);
  _Block_object_dispose(&v31, 8);

  return v17;
}

void __75__MPCContentAgeRequirementManager__askPlaybackAuthorizationForItem_reason___block_invoke(uint64_t a1)
{
  if (MSVDeviceOSIsInternalInstall())
  {
    id v2 = [MEMORY[0x263F08690] currentHandler];
    [v2 handleFailureInMethod:*(void *)(a1 + 40) object:*(void *)(a1 + 32) file:@"MPCContentAgeRequirementManager.m" lineNumber:197 description:@"MPCGenericAVItem authorization handler was released and not called."];
  }
}

void __75__MPCContentAgeRequirementManager__askPlaybackAuthorizationForItem_reason___block_invoke_2(uint64_t a1, char a2, void *a3)
{
  id v5 = a3;
  [*(id *)(a1 + 32) disarm];
  uint64_t v6 = *(void *)(*(void *)(a1 + 48) + 8);
  id v7 = *(void **)(v6 + 40);
  *(void *)(v6 + 40) = v5;
  id v9 = v5;

  if (v9) {
    char v8 = 0;
  }
  else {
    char v8 = a2;
  }
  *(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = v8;
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 40));
}

- (BOOL)_shouldAskPlaybackAuthorizationForItem:(id)a3 reason:(int64_t)a4
{
  if (a4 == 1) {
    return 1;
  }
  BOOL result = [a3 isStartItem];
  if (a4 != 2) {
    return 0;
  }
  return result;
}

- (void)_setupWithAgeVerificationState:(id)a3
{
  id v8 = a3;
  switch([v8 status])
  {
    case 0:
      id v5 = [MEMORY[0x263F08690] currentHandler];

      break;
    case 1:
      uint64_t v6 = self;
      uint64_t v7 = 2;
      goto LABEL_9;
    case 2:
      uint64_t v6 = self;
      uint64_t v7 = 0;
      goto LABEL_9;
    case 3:
      if ([v8 isExplicitContentAllowed]) {
        uint64_t v7 = 2;
      }
      else {
        uint64_t v7 = 3;
      }
      uint64_t v6 = self;
LABEL_9:
      [(MPCContentAgeRequirementManager *)v6 setStatus:v7];
      break;
    default:
      break;
  }
}

- (void)_setupWithAgeGateForItem:(id)a3
{
  v4 = [a3 genericObject];
  id v13 = [v4 flattenedGenericObject];

  if ([v13 type] == 8)
  {
    id v5 = [v13 tvEpisode];
    uint64_t v6 = [v5 explicitRating];
    uint64_t v7 = [MEMORY[0x263F121E8] sharedRestrictionsMonitor];
    uint64_t v8 = [v7 maximumTVShowRatingForAgeGate];

    if (v6 >= v8) {
      goto LABEL_5;
    }
  }
  if ([v13 type] == 9)
  {
    id v9 = [v13 movie];
    uint64_t v10 = [v9 explicitRating];
    dispatch_semaphore_t v11 = [MEMORY[0x263F121E8] sharedRestrictionsMonitor];
    uint64_t v12 = [v11 maximumMovieRatingForAgeGate];

    if (v10 >= v12) {
LABEL_5:
    }
      [(MPCContentAgeRequirementManager *)self setStatus:1];
  }
}

- (void)_updateAuthorizationStatusWithAuthorizationState:(id)a3 forItem:(id)a4
{
  id v6 = a4;
  [(MPCContentAgeRequirementManager *)self _setupWithAgeVerificationState:a3];
  if ([(MPCContentAgeRequirementManager *)self status] == 2) {
    [(MPCContentAgeRequirementManager *)self _setupWithAgeGateForItem:v6];
  }
}

- (id)_retrieveAgeVerificationStateForUserIdentity:(id)a3
{
  id v3 = a3;
  v4 = [MEMORY[0x263F890A0] defaultManager];
  id v5 = [v4 ageVerificationStateForUserIdentity:v3];

  if (v5)
  {
    id v6 = [MEMORY[0x263F890A0] defaultManager];
    id v7 = [v6 ageVerificationStateForUserIdentity:v3];
  }
  else
  {
    uint64_t v15 = 0;
    v16 = &v15;
    uint64_t v17 = 0x3032000000;
    v18 = __Block_byref_object_copy__22023;
    v19 = __Block_byref_object_dispose__22024;
    id v20 = 0;
    dispatch_block_t v8 = dispatch_block_create((dispatch_block_flags_t)0, &__block_literal_global_6);
    id v9 = [MEMORY[0x263F890A0] defaultManager];
    v12[0] = MEMORY[0x263EF8330];
    v12[1] = 3221225472;
    v12[2] = __80__MPCContentAgeRequirementManager__retrieveAgeVerificationStateForUserIdentity___block_invoke_2;
    v12[3] = &unk_2643C3348;
    v14 = &v15;
    id v10 = v8;
    id v13 = v10;
    [v9 getAgeVerificationStateWithCompletion:v12];

    dispatch_block_wait(v10, 0xFFFFFFFFFFFFFFFFLL);
    id v7 = (id)v16[5];

    _Block_object_dispose(&v15, 8);
  }

  return v7;
}

void __80__MPCContentAgeRequirementManager__retrieveAgeVerificationStateForUserIdentity___block_invoke_2(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a2);
  id v4 = a2;
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (int64_t)authorizationReason
{
  int64_t v2 = [(MPCContentAgeRequirementManager *)self status];
  if (v2) {
    return v2 == 1;
  }
  else {
    return 2;
  }
}

- (BOOL)isItemAuthorized:(id)a3 shouldAskForAuthorization:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v23 = *MEMORY[0x263EF8340];
  id v6 = a3;
  if ([v6 mediaType] == 2048)
  {
    id v7 = [MEMORY[0x263F121E8] sharedRestrictionsMonitor];
    char v8 = [v7 allowsMusicVideos];

    if ((v8 & 1) == 0)
    {
      id v10 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 134218242;
        id v20 = self;
        __int16 v21 = 2114;
        id v22 = v6;
        _os_log_impl(&dword_21BB87000, v10, OS_LOG_TYPE_DEFAULT, "MPCContentAgeRequirementManager %p - Music Video playback is not allowed for item - %{public}@", buf, 0x16u);
      }
      BOOL v13 = 0;
      goto LABEL_23;
    }
  }
  if ([v6 isExplicitTrack])
  {
    id v9 = [v6 playbackRequestEnvironment];
    id v10 = [v9 userIdentity];

    dispatch_semaphore_t v11 = [(MPCContentAgeRequirementManager *)self _retrieveAgeVerificationStateForUserIdentity:v10];
    [(MPCContentAgeRequirementManager *)self _updateAuthorizationStatusWithAuthorizationState:v11 forItem:v6];
    if ([(MPCContentAgeRequirementManager *)self status] == 2)
    {
      uint64_t v12 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 134218242;
        id v20 = self;
        __int16 v21 = 2114;
        id v22 = v6;
        _os_log_impl(&dword_21BB87000, v12, OS_LOG_TYPE_DEFAULT, "MPCContentAgeRequirementManager %p - Age Requirements satisfied for item: %{public}@", buf, 0x16u);
      }

      BOOL v13 = 1;
      goto LABEL_22;
    }
    if ([(MPCContentAgeRequirementManager *)self status] == 3)
    {
      v14 = [NSString stringWithFormat:@"MPCContentAgeRequirementManager %p - Explicit content playback is not allowed for any item - %@", self, v6];
      uint64_t v15 = [(MPCContentAgeRequirementManager *)self authorizationError];
      v16 = [(MPCContentAgeRequirementManager *)self _explicitContentErrorWithUnderlyingError:v15 message:v14];
      [v6 setItemError:v16];

      uint64_t v17 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
      if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 134218242;
        id v20 = self;
        __int16 v21 = 2114;
        id v22 = v6;
        _os_log_impl(&dword_21BB87000, v17, OS_LOG_TYPE_ERROR, "MPCContentAgeRequirementManager %p - Age Requirements prohibit playback for item: %{public}@", buf, 0x16u);
      }
    }
    else
    {
      if (v4
        && [(MPCContentAgeRequirementManager *)self _shouldAskPlaybackAuthorizationForItem:v6 reason:[(MPCContentAgeRequirementManager *)self authorizationReason]])
      {
        BOOL v13 = [(MPCContentAgeRequirementManager *)self _askPlaybackAuthorizationForItem:v6 reason:[(MPCContentAgeRequirementManager *)self authorizationReason]];
LABEL_22:

LABEL_23:
        goto LABEL_24;
      }
      v14 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 134218242;
        id v20 = self;
        __int16 v21 = 2114;
        id v22 = v6;
        _os_log_impl(&dword_21BB87000, v14, OS_LOG_TYPE_DEFAULT, "MPCContentAgeRequirementManager %p - Age Requirements not satisfied and will not request authorization for item: %{public}@", buf, 0x16u);
      }
    }

    BOOL v13 = 0;
    goto LABEL_22;
  }
  BOOL v13 = 1;
LABEL_24:

  return v13;
}

- (BOOL)isItemAuthorized:(id)a3
{
  return [(MPCContentAgeRequirementManager *)self isItemAuthorized:a3 shouldAskForAuthorization:0];
}

@end