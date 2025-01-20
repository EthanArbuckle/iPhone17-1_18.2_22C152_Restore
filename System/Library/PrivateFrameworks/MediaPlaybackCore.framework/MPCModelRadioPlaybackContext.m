@interface MPCModelRadioPlaybackContext
+ (BOOL)supportsSecureCoding;
- (BOOL)continueListeningStation;
- (Class)queueFeederClass;
- (MPCContinueListeningRadioQueueProviding)continueListeningQueueProvider;
- (MPCModelRadioContentReference)nowPlayingContentReference;
- (MPCModelRadioContentReference)seedContentReference;
- (MPCModelRadioPlaybackContext)init;
- (MPCModelRadioPlaybackContext)initWithCoder:(id)a3;
- (MPCPlaybackRequestEnvironment)playbackRequestEnvironment;
- (MPModelRadioStation)radioStation;
- (NSData)delegateTokenB;
- (NSURL)stationURL;
- (id)copyWithZone:(_NSZone *)a3;
- (id)descriptionComponents;
- (id)getSharedListeningTracklistWithCompletion:(id)a3;
- (id)userIdentity;
- (int64_t)continueListeningMaxQueueReferences;
- (int64_t)continueListeningPrefetchThreshold;
- (int64_t)queueEndAction;
- (int64_t)repeatType;
- (int64_t)shuffleType;
- (void)encodeWithCoder:(id)a3;
- (void)getRemotePlaybackQueueRepresentationWithCompletion:(id)a3;
- (void)setContinueListeningMaxQueueReferences:(int64_t)a3;
- (void)setContinueListeningPrefetchThreshold:(int64_t)a3;
- (void)setContinueListeningQueueProvider:(id)a3;
- (void)setContinueListeningStation:(BOOL)a3;
- (void)setDelegateTokenB:(id)a3;
- (void)setNowPlayingContentReference:(id)a3;
- (void)setPlaybackRequestEnvironment:(id)a3;
- (void)setRadioStation:(id)a3;
- (void)setSeedContentReference:(id)a3;
- (void)setStationURL:(id)a3;
- (void)setUserIdentity:(id)a3;
@end

@implementation MPCModelRadioPlaybackContext

- (void)getRemotePlaybackQueueRepresentationWithCompletion:(id)a3
{
  id v4 = a3;
  v5 = objc_alloc_init(_MPCProtoRadioCreationProperties);
  v6 = [(MPCModelRadioPlaybackContext *)self playActivityFeatureName];
  if (v6 && v5) {
    objc_storeStrong((id *)&v5->_playActivityFeatureName, v6);
  }
  v7 = [(MPCModelRadioPlaybackContext *)self playActivityQueueGroupingID];
  if (v7 && v5) {
    objc_storeStrong((id *)&v5->_playActivityQueueGroupingID, v7);
  }
  v65[0] = 0;
  v65[1] = v65;
  v65[2] = 0x3032000000;
  v65[3] = __Block_byref_object_copy__4408;
  v65[4] = __Block_byref_object_dispose__4409;
  id v66 = 0;
  v63[0] = 0;
  v63[1] = v63;
  v63[2] = 0x2020000000;
  char v64 = 1;
  dispatch_queue_t v8 = dispatch_queue_create("com.apple.MediaPlaybackCore.MPCModelRadioPlaybackContext.MPCPlaybackQueue.serialQueue", 0);
  v9 = dispatch_group_create();
  v10 = [(MPCModelRadioPlaybackContext *)self playbackRequestEnvironment];
  v11 = [v10 userIdentity];
  v12 = v11;
  v38 = v7;
  v39 = v6;
  v37 = v4;
  if (v11)
  {
    id v41 = v11;
  }
  else
  {
    id v41 = [MEMORY[0x263F893C0] activeAccount];
  }

  v13 = [MEMORY[0x263F893C8] defaultIdentityStore];
  id v62 = 0;
  v14 = [v13 getPropertiesForUserIdentity:v41 error:&v62];
  id v40 = v62;
  v36 = v14;
  v15 = [v14 DSID];
  uint64_t v16 = [v15 unsignedLongLongValue];

  if (v16)
  {
    v17 = (void *)MEMORY[0x263F893C0];
    v18 = [NSNumber numberWithUnsignedLongLong:v16];
    v19 = [v17 specificAccountWithDSID:v18];
    v20 = [v19 identityAllowingDelegation:1];

    dispatch_group_enter(v9);
    v52[0] = MEMORY[0x263EF8330];
    v52[1] = 3221225472;
    v52[2] = __101__MPCModelRadioPlaybackContext_MPCPlaybackQueue__getRemotePlaybackQueueRepresentationWithCompletion___block_invoke;
    v52[3] = &unk_2643BFDA8;
    id v53 = v13;
    id v21 = v20;
    id v54 = v21;
    uint64_t v61 = v16;
    v55 = v9;
    v59 = v65;
    v60 = v63;
    v56 = v8;
    v57 = self;
    v58 = v5;
    [v53 getDelegationUUIDsForUserIdentity:v21 completionHandler:v52];
  }
  else
  {
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __101__MPCModelRadioPlaybackContext_MPCPlaybackQueue__getRemotePlaybackQueueRepresentationWithCompletion___block_invoke_4;
    block[3] = &unk_2643C5E20;
    v50 = v65;
    id v49 = v40;
    v51 = v63;
    dispatch_group_async(v9, v8, block);
    id v21 = v49;
  }

  v22 = [(MPCModelRadioPlaybackContext *)self seedContentReference];
  v23 = [v22 ICRadioContentReference];

  if (!v23)
  {
    v30 = [(MPCModelRadioPlaybackContext *)self radioStation];
    v31 = [v30 identifiers];
    v32 = [v31 radio];
    v26 = [v32 stationStringID];

    if ([v26 length] && v5) {
      objc_storeStrong((id *)&v5->_radioStationID, v26);
    }
    v33 = [(MPCModelRadioPlaybackContext *)self stationURL];
    v28 = v33;
    if (!v33) {
      goto LABEL_27;
    }
    nowPlayingContentReference = [(_MPCProtoRadioContentReference *)v33 absoluteString];
    if (nowPlayingContentReference && v5) {
      objc_storeStrong((id *)&v5->_radioStationURLString, nowPlayingContentReference);
    }
    goto LABEL_26;
  }
  v24 = _MPCProtoRadioContentReferenceFromICRadioContentReference(v23);
  if (v5) {
    objc_storeStrong((id *)&v5->_seedContentReference, v24);
  }

  v25 = [(MPCModelRadioPlaybackContext *)self nowPlayingContentReference];
  v26 = [v25 ICRadioContentReference];

  if (v26)
  {
    _MPCProtoRadioContentReferenceFromICRadioContentReference(v26);
    v27 = (_MPCProtoRadioContentReference *)objc_claimAutoreleasedReturnValue();
    v28 = v27;
    if (!v5)
    {
LABEL_27:

      goto LABEL_28;
    }
    v28 = v27;
    nowPlayingContentReference = v5->_nowPlayingContentReference;
    v5->_nowPlayingContentReference = v28;
LABEL_26:

    goto LABEL_27;
  }
LABEL_28:

  v42[0] = MEMORY[0x263EF8330];
  v42[1] = 3221225472;
  v42[2] = __101__MPCModelRadioPlaybackContext_MPCPlaybackQueue__getRemotePlaybackQueueRepresentationWithCompletion___block_invoke_5;
  v42[3] = &unk_2643C5128;
  v43 = v5;
  v44 = self;
  id v45 = v37;
  v46 = v63;
  v47 = v65;
  id v34 = v37;
  v35 = v5;
  dispatch_group_notify(v9, v8, v42);

  _Block_object_dispose(v63, 8);
  _Block_object_dispose(v65, 8);
}

void __101__MPCModelRadioPlaybackContext_MPCPlaybackQueue__getRemotePlaybackQueueRepresentationWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v35 = *MEMORY[0x263EF8340];
  id v3 = a2;
  id v4 = [v3 firstObject];
  if (![v3 count])
  {
    v5 = [MEMORY[0x263F08C38] UUID];
    uint64_t v6 = [v5 UUIDString];

    v7 = *(void **)(a1 + 32);
    uint64_t v34 = v6;
    dispatch_queue_t v8 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v34 count:1];
    [v7 addDelegationUUIDs:v8 forUserIdentity:*(void *)(a1 + 40) completionHandler:0];

    id v4 = (void *)v6;
  }
  v9 = +[MPCPlaybackAccountManager sharedManager];
  uint64_t v10 = *(void *)(a1 + 96);
  v11 = (char *)&v35 + 1;
  uint64_t quot = v10;
  do
  {
    lldiv_t v13 = lldiv(quot, 10);
    uint64_t quot = v13.quot;
    if (v13.rem >= 0) {
      LOBYTE(v14) = v13.rem;
    }
    else {
      uint64_t v14 = -v13.rem;
    }
    *(v11 - 2) = v14 + 48;
    v15 = (const UInt8 *)(v11 - 2);
    --v11;
  }
  while (v13.quot);
  if (v10 < 0)
  {
    *(v11 - 2) = 45;
    v15 = (const UInt8 *)(v11 - 2);
  }
  uint64_t v16 = (__CFString *)CFStringCreateWithBytes(0, v15, (char *)&v35 - (char *)v15, 0x8000100u, 0);
  v17 = [v9 accountForDSID:v16];

  char v18 = [v17 hasCatalogPlaybackCapability];
  char v19 = [v17 hasDelegationCapability];
  v20 = *(void **)(a1 + 48);
  id v21 = *(NSObject **)(a1 + 56);
  v24[0] = MEMORY[0x263EF8330];
  v24[1] = 3221225472;
  v24[2] = __101__MPCModelRadioPlaybackContext_MPCPlaybackQueue__getRemotePlaybackQueueRepresentationWithCompletion___block_invoke_2;
  v24[3] = &unk_2643BFD80;
  uint64_t v31 = *(void *)(a1 + 96);
  char v32 = v18;
  char v33 = v19;
  id v25 = v4;
  id v26 = v17;
  long long v30 = *(_OWORD *)(a1 + 80);
  uint64_t v27 = *(void *)(a1 + 64);
  v28 = v20;
  id v29 = *(id *)(a1 + 72);
  id v22 = v17;
  id v23 = v4;
  dispatch_group_async(v28, v21, v24);
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 48));
}

void __101__MPCModelRadioPlaybackContext_MPCPlaybackQueue__getRemotePlaybackQueueRepresentationWithCompletion___block_invoke_4(uint64_t a1)
{
  uint64_t v2 = *(void *)(*(void *)(a1 + 40) + 8);
  uint64_t v4 = *(void *)(v2 + 40);
  id v3 = (id *)(v2 + 40);
  if (!v4) {
    objc_storeStrong(v3, *(id *)(a1 + 32));
  }
  *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = 0;
}

void __101__MPCModelRadioPlaybackContext_MPCPlaybackQueue__getRemotePlaybackQueueRepresentationWithCompletion___block_invoke_5(uint64_t a1)
{
  if (*(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24))
  {
    id v2 = objc_alloc(MEMORY[0x263F11D80]);
    id v3 = [*(id *)(a1 + 32) data];
    if (v3)
    {
      id v12 = (id)[v2 initWithIdentifier:@"com.apple.music.playbackqueue.radio" data:v3];
    }
    else
    {
      v7 = [MEMORY[0x263EFF8F8] data];
      id v12 = (id)[v2 initWithIdentifier:@"com.apple.music.playbackqueue.radio" data:v7];
    }
    [v12 setRequestingImmediatePlayback:1];
    dispatch_queue_t v8 = [*(id *)(a1 + 40) playActivityRecommendationData];
    if (v8) {
      v9 = (void *)[[NSString alloc] initWithData:v8 encoding:4];
    }
    else {
      v9 = 0;
    }
    [v12 setSiriRecommendationIdentifier:v9];
    (*(void (**)(void))(*(void *)(a1 + 48) + 16))();

    uint64_t v10 = v12;
    goto LABEL_13;
  }
  uint64_t v4 = *(void *)(a1 + 48);
  if (!*(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 40))
  {
    uint64_t v11 = [MEMORY[0x263F087E8] errorWithDomain:@"MPCError" code:0 userInfo:0];
    (*(void (**)(uint64_t, void, uint64_t))(v4 + 16))(v4, 0, v11);
    uint64_t v10 = (void *)v11;
LABEL_13:

    return;
  }
  v5 = *(void (**)(uint64_t, void))(v4 + 16);
  uint64_t v6 = *(void *)(a1 + 48);

  v5(v6, 0);
}

void __101__MPCModelRadioPlaybackContext_MPCPlaybackQueue__getRemotePlaybackQueueRepresentationWithCompletion___block_invoke_2(uint64_t a1)
{
  uint64_t v2 = +[_MPCProtoDelegateInfo currentDeviceDelegateInfo];
  id v3 = (void *)v2;
  if (v2)
  {
    uint64_t v4 = *(void *)(a1 + 88);
    *(unsigned char *)(v2 + 116) |= 1u;
    *(void *)(v2 + 32) = v4;
  }
  -[_MPCProtoDelegateInfo setUuid:](v2, *(void **)(a1 + 32));
  if (*(unsigned char *)(a1 + 96))
  {
    if (v3)
    {
      PBRepeatedInt32Add();
      if (!*(unsigned char *)(a1 + 97)) {
        goto LABEL_19;
      }
      PBRepeatedInt32Add();
    }
    else if (!*(unsigned char *)(a1 + 97))
    {
      goto LABEL_19;
    }
    v5 = *(void **)(a1 + 40);
    id v20 = 0;
    uint64_t v6 = [v5 delegateTokenAWithError:&v20];
    id v7 = v20;
    id v8 = v20;
    if (v6)
    {
      if (v3) {
        PBRepeatedInt32Add();
      }
      -[_MPCProtoDelegateInfo setTokenA:]((uint64_t)v3, v6);
    }
    else
    {
      uint64_t v9 = *(void *)(*(void *)(a1 + 72) + 8);
      uint64_t v11 = *(void *)(v9 + 40);
      uint64_t v10 = (id *)(v9 + 40);
      if (!v11) {
        objc_storeStrong(v10, v7);
      }
      *(unsigned char *)(*(void *)(*(void *)(a1 + 80) + 8) + 24) = 0;
    }
    id v12 = [*(id *)(a1 + 48) delegateTokenB];
    if (v12)
    {
      lldiv_t v13 = [[_MPCProtoDelegateInfoTokenB alloc] initWithData:v12];
      dispatch_group_enter(*(dispatch_group_t *)(a1 + 56));
      uint64_t v14 = *(void **)(a1 + 40);
      v16[0] = MEMORY[0x263EF8330];
      v16[1] = 3221225472;
      v16[2] = __101__MPCModelRadioPlaybackContext_MPCPlaybackQueue__getRemotePlaybackQueueRepresentationWithCompletion___block_invoke_3;
      v16[3] = &unk_2643BFD58;
      id v17 = v3;
      long long v19 = *(_OWORD *)(a1 + 72);
      id v18 = *(id *)(a1 + 56);
      [v14 getDelegateTokenEWithTokenB:v13 completion:v16];
    }
  }
  else if (v3)
  {
    PBRepeatedInt32Add();
  }
LABEL_19:
  uint64_t v15 = *(void *)(a1 + 64);
  if (v15) {
    objc_storeStrong((id *)(v15 + 8), v3);
  }
}

void __101__MPCModelRadioPlaybackContext_MPCPlaybackQueue__getRemotePlaybackQueueRepresentationWithCompletion___block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  id v9 = a2;
  id v5 = a3;
  if (v5)
  {
    uint64_t v6 = *(void *)(*(void *)(a1 + 48) + 8);
    uint64_t v8 = *(void *)(v6 + 40);
    id v7 = (id *)(v6 + 40);
    if (!v8) {
      objc_storeStrong(v7, a3);
    }
    *(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = 0;
  }
  else
  {
    -[_MPCProtoDelegateInfo setTokenE:](*(void *)(a1 + 32), v9);
  }
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 40));
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_delegateTokenB, 0);
  objc_storeStrong((id *)&self->_playbackRequestEnvironment, 0);
  objc_storeStrong((id *)&self->_stationURL, 0);
  objc_storeStrong((id *)&self->_radioStation, 0);
  objc_storeStrong((id *)&self->_seedContentReference, 0);
  objc_storeStrong((id *)&self->_nowPlayingContentReference, 0);

  objc_destroyWeak((id *)&self->_continueListeningQueueProvider);
}

- (void)setDelegateTokenB:(id)a3
{
}

- (NSData)delegateTokenB
{
  return self->_delegateTokenB;
}

- (void)setPlaybackRequestEnvironment:(id)a3
{
}

- (MPCPlaybackRequestEnvironment)playbackRequestEnvironment
{
  return self->_playbackRequestEnvironment;
}

- (void)setStationURL:(id)a3
{
}

- (NSURL)stationURL
{
  return self->_stationURL;
}

- (void)setRadioStation:(id)a3
{
}

- (MPModelRadioStation)radioStation
{
  return self->_radioStation;
}

- (void)setSeedContentReference:(id)a3
{
}

- (MPCModelRadioContentReference)seedContentReference
{
  return self->_seedContentReference;
}

- (void)setNowPlayingContentReference:(id)a3
{
}

- (MPCModelRadioContentReference)nowPlayingContentReference
{
  return self->_nowPlayingContentReference;
}

- (void)setContinueListeningPrefetchThreshold:(int64_t)a3
{
  self->_continueListeningPrefetchThreshold = a3;
}

- (int64_t)continueListeningPrefetchThreshold
{
  return self->_continueListeningPrefetchThreshold;
}

- (void)setContinueListeningMaxQueueReferences:(int64_t)a3
{
  self->_continueListeningMaxQueueReferences = a3;
}

- (int64_t)continueListeningMaxQueueReferences
{
  return self->_continueListeningMaxQueueReferences;
}

- (void)setContinueListeningQueueProvider:(id)a3
{
}

- (MPCContinueListeningRadioQueueProviding)continueListeningQueueProvider
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_continueListeningQueueProvider);

  return (MPCContinueListeningRadioQueueProviding *)WeakRetained;
}

- (void)setContinueListeningStation:(BOOL)a3
{
  self->_continueListeningStation = a3;
}

- (BOOL)continueListeningStation
{
  return self->_continueListeningStation;
}

- (void)setUserIdentity:(id)a3
{
  id v4 = a3;
  if (!v4)
  {
    id v4 = [MEMORY[0x263F893C0] activeAccount];
  }
  id v7 = v4;
  id v5 = +[MPCPlaybackRequestEnvironment requestEnvironmentWithUserIdentity:v4];
  playbackRequestEnvironment = self->_playbackRequestEnvironment;
  self->_playbackRequestEnvironment = v5;
}

- (id)userIdentity
{
  return [(MPCPlaybackRequestEnvironment *)self->_playbackRequestEnvironment userIdentity];
}

- (id)descriptionComponents
{
  v14.receiver = self;
  v14.super_class = (Class)MPCModelRadioPlaybackContext;
  id v3 = [(MPCModelRadioPlaybackContext *)&v14 descriptionComponents];
  id v4 = (void *)[v3 mutableCopy];

  id v5 = [(MPCModelRadioPlaybackContext *)self playbackRequestEnvironment];
  [v4 setObject:v5 forKeyedSubscript:@"playbackRequestEnvironment"];

  [v4 removeObjectForKey:@"repeat/shuffle"];
  [v4 removeObjectForKey:@"queueEndAction"];
  if (self->_continueListeningStation)
  {
    [v4 setObject:MEMORY[0x263EFFA88] forKeyedSubscript:@"continueListening"];
  }
  else
  {
    uint64_t v6 = (void *)MEMORY[0x263F11F78];
    uint64_t v8 = MEMORY[0x263EF8330];
    uint64_t v9 = 3221225472;
    uint64_t v10 = __53__MPCModelRadioPlaybackContext_descriptionComponents__block_invoke;
    uint64_t v11 = &unk_2643C5EE8;
    id v12 = v4;
    lldiv_t v13 = self;
    [v6 performWithoutEnforcement:&v8];
  }
  objc_msgSend(v4, "setObject:forKeyedSubscript:", self->_delegateTokenB, @"delegateTokenB", v8, v9, v10, v11);

  return v4;
}

void __53__MPCModelRadioPlaybackContext_descriptionComponents__block_invoke(uint64_t a1)
{
  v17[5] = *MEMORY[0x263EF8340];
  uint64_t v15 = *(void **)(a1 + 32);
  v16[0] = @"nowPlaying";
  uint64_t v2 = *(void *)(a1 + 40);
  uint64_t v3 = *(void *)(v2 + 176);
  if (v3)
  {
    uint64_t v4 = *(void *)(v2 + 176);
  }
  else
  {
    uint64_t v4 = [MEMORY[0x263EFF9D0] null];
    uint64_t v2 = *(void *)(a1 + 40);
  }
  objc_super v14 = (void *)v4;
  v17[0] = v4;
  v16[1] = @"seed";
  id v5 = *(void **)(v2 + 184);
  uint64_t v6 = v5;
  if (!v5)
  {
    uint64_t v6 = [MEMORY[0x263EFF9D0] null];
    uint64_t v2 = *(void *)(a1 + 40);
  }
  v17[1] = v6;
  v16[2] = @"stationID";
  id v7 = [*(id *)(v2 + 192) identifiers];
  uint64_t v8 = v7;
  if (!v7)
  {
    uint64_t v8 = [MEMORY[0x263EFF9D0] null];
  }
  v17[2] = v8;
  v16[3] = @"stationName";
  uint64_t v9 = [*(id *)(*(void *)(a1 + 40) + 192) name];
  uint64_t v10 = v9;
  if (!v9)
  {
    uint64_t v10 = [MEMORY[0x263EFF9D0] null];
  }
  v17[3] = v10;
  void v16[4] = @"stationURL";
  uint64_t v11 = *(void **)(*(void *)(a1 + 40) + 200);
  id v12 = v11;
  if (!v11)
  {
    id v12 = [MEMORY[0x263EFF9D0] null];
  }
  v17[4] = v12;
  lldiv_t v13 = [NSDictionary dictionaryWithObjects:v17 forKeys:v16 count:5];
  [v15 addEntriesFromDictionary:v13];

  if (v11)
  {
    if (v9) {
      goto LABEL_14;
    }
  }
  else
  {

    if (v9) {
      goto LABEL_14;
    }
  }

LABEL_14:
  if (!v7) {

  }
  if (v5)
  {
    if (v3) {
      return;
    }
LABEL_22:

    return;
  }

  if (!v3) {
    goto LABEL_22;
  }
}

- (int64_t)queueEndAction
{
  return 2;
}

- (int64_t)repeatType
{
  return 0;
}

- (int64_t)shuffleType
{
  return 0;
}

- (Class)queueFeederClass
{
  return (Class)objc_opt_class();
}

- (id)copyWithZone:(_NSZone *)a3
{
  v13.receiver = self;
  v13.super_class = (Class)MPCModelRadioPlaybackContext;
  id v4 = [(MPCModelRadioPlaybackContext *)&v13 copyWithZone:a3];
  id v5 = [(MPCModelRadioPlaybackContext *)self playbackRequestEnvironment];
  [v4 setPlaybackRequestEnvironment:v5];

  uint64_t v6 = [(MPCModelRadioPlaybackContext *)self nowPlayingContentReference];
  [v4 setNowPlayingContentReference:v6];

  id v7 = [(MPCModelRadioPlaybackContext *)self seedContentReference];
  [v4 setSeedContentReference:v7];

  uint64_t v8 = [(MPCModelRadioPlaybackContext *)self radioStation];
  [v4 setRadioStation:v8];

  uint64_t v9 = [(MPCModelRadioPlaybackContext *)self stationURL];
  [v4 setStationURL:v9];

  objc_msgSend(v4, "setContinueListeningStation:", -[MPCModelRadioPlaybackContext continueListeningStation](self, "continueListeningStation"));
  objc_msgSend(v4, "setContinueListeningMaxQueueReferences:", -[MPCModelRadioPlaybackContext continueListeningMaxQueueReferences](self, "continueListeningMaxQueueReferences"));
  objc_msgSend(v4, "setContinueListeningPrefetchThreshold:", -[MPCModelRadioPlaybackContext continueListeningPrefetchThreshold](self, "continueListeningPrefetchThreshold"));
  uint64_t v10 = [(MPCModelRadioPlaybackContext *)self continueListeningQueueProvider];
  [v4 setContinueListeningQueueProvider:v10];

  uint64_t v11 = [(MPCModelRadioPlaybackContext *)self delegateTokenB];
  [v4 setDelegateTokenB:v11];

  return v4;
}

- (void)encodeWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)MPCModelRadioPlaybackContext;
  id v4 = a3;
  [(MPCModelRadioPlaybackContext *)&v5 encodeWithCoder:v4];
  objc_msgSend(v4, "encodeObject:forKey:", self->_radioStation, @"Station", v5.receiver, v5.super_class);
  [v4 encodeBool:self->_continueListeningStation forKey:@"ContinueListening"];
  [v4 encodeObject:self->_stationURL forKey:@"StationURL"];
  [v4 encodeObject:self->_nowPlayingContentReference forKey:@"NowPlayingContentReference"];
  [v4 encodeObject:self->_seedContentReference forKey:@"SeedContentReference"];
  [v4 encodeObject:self->_playbackRequestEnvironment forKey:@"PlaybackRequestEnvironment"];
}

- (MPCModelRadioPlaybackContext)initWithCoder:(id)a3
{
  id v4 = a3;
  v17.receiver = self;
  v17.super_class = (Class)MPCModelRadioPlaybackContext;
  objc_super v5 = [(MPCModelRadioPlaybackContext *)&v17 initWithCoder:v4];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"Station"];
    radioStation = v5->_radioStation;
    v5->_radioStation = (MPModelRadioStation *)v6;

    v5->_continueListeningStation = [v4 decodeBoolForKey:@"ContinueListening"];
    v5->_continueListeningMaxQueueReferences = [v4 decodeIntegerForKey:@"CL_MaxQueueReferences"];
    v5->_continueListeningPrefetchThreshold = [v4 decodeIntegerForKey:@"CL_PrefetchThreshold"];
    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"StationURL"];
    stationURL = v5->_stationURL;
    v5->_stationURL = (NSURL *)v8;

    uint64_t v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"NowPlayingContentReference"];
    nowPlayingContentReference = v5->_nowPlayingContentReference;
    v5->_nowPlayingContentReference = (MPCModelRadioContentReference *)v10;

    uint64_t v12 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"SeedContentReference"];
    seedContentReference = v5->_seedContentReference;
    v5->_seedContentReference = (MPCModelRadioContentReference *)v12;

    uint64_t v14 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"PlaybackRequestEnvironment"];
    playbackRequestEnvironment = v5->_playbackRequestEnvironment;
    v5->_playbackRequestEnvironment = (MPCPlaybackRequestEnvironment *)v14;
  }
  return v5;
}

- (MPCModelRadioPlaybackContext)init
{
  v6.receiver = self;
  v6.super_class = (Class)MPCModelRadioPlaybackContext;
  uint64_t v2 = [(MPCModelRadioPlaybackContext *)&v6 init];
  if (v2)
  {
    uint64_t v3 = +[MPCPlaybackRequestEnvironment activeAccountRequestEnvironment];
    playbackRequestEnvironment = v2->_playbackRequestEnvironment;
    v2->_playbackRequestEnvironment = (MPCPlaybackRequestEnvironment *)v3;
  }
  return v2;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)getSharedListeningTracklistWithCompletion:(id)a3
{
  uint64_t v30 = *MEMORY[0x263EF8340];
  id v4 = a3;
  objc_super v5 = [(MPCModelRadioPlaybackContext *)self seedContentReference];
  objc_super v6 = [v5 referenceModelObjectIdentifiers];
  id v7 = [v6 universalStore];

  uint64_t v8 = [v7 purchasedAdamID];
  if (v8 || (uint64_t v8 = [v7 subscriptionAdamID]) != 0 || (uint64_t v8 = objc_msgSend(v7, "adamID")) != 0)
  {
    uint64_t v9 = (void *)MEMORY[0x263F892F8];
    uint64_t v10 = (char *)&v30 + 1;
    uint64_t quot = v8;
    do
    {
      lldiv_t v12 = lldiv(quot, 10);
      uint64_t quot = v12.quot;
      if (v12.rem >= 0) {
        LOBYTE(v13) = v12.rem;
      }
      else {
        uint64_t v13 = -v12.rem;
      }
      *(v10 - 2) = v13 + 48;
      uint64_t v14 = (const UInt8 *)(v10 - 2);
      --v10;
    }
    while (v12.quot);
    if (v8 < 0)
    {
      *(v10 - 2) = 45;
      uint64_t v14 = (const UInt8 *)(v10 - 2);
    }
    uint64_t v15 = (__CFString *)CFStringCreateWithBytes(0, v14, (char *)&v30 - (char *)v14, 0x8000100u, 0);
    uint64_t v16 = [v9 itemWithMediaIdentifier:v15];

    objc_super v17 = (void *)MEMORY[0x263F892F0];
    id v18 = [(MPCModelRadioPlaybackContext *)self playActivityFeatureName];
    long long v19 = [v17 radioContainerWithSeedItem:v16 featureName:v18];
  }
  else
  {
    long long v19 = 0;
  }
  id v20 = [(MPCModelRadioPlaybackContext *)self radioStation];
  id v21 = [v20 identifiers];
  id v22 = [v21 radio];
  id v23 = [v22 stationStringID];

  if (v23)
  {
    v24 = (void *)MEMORY[0x263F892F0];
    id v25 = [(MPCModelRadioPlaybackContext *)self playActivityFeatureName];
    uint64_t v26 = [v24 radioContainerWithMediaIdentifier:v23 featureName:v25];

    long long v19 = (void *)v26;
  }
  uint64_t v27 = [MEMORY[0x263F08AB8] progressWithTotalUnitCount:1];
  if (v19)
  {
    id v28 = objc_alloc_init(MEMORY[0x263F54EF8]);
    [v28 appendSection:v19];
    (*((void (**)(id, id, void, void))v4 + 2))(v4, v28, 0, 0);
  }
  else
  {
    objc_msgSend(MEMORY[0x263F087E8], "msv_errorWithDomain:code:debugDescription:", @"MPCMusicPlaybackContextSharePlayError", 9, @"Unsupported content [Radio] %@", self);
    id v28 = (id)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, void, void, id))v4 + 2))(v4, 0, 0, v28);
  }

  [v27 setCompletedUnitCount:1];

  return v27;
}

@end