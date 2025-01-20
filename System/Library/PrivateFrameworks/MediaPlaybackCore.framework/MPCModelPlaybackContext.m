@interface MPCModelPlaybackContext
+ (BOOL)supportsAutoPlay;
+ (BOOL)supportsSecureCoding;
- (BOOL)allowsJumpToIt;
- (BOOL)containsRestorableContent;
- (BOOL)isReusableForPlaybackContext:(id)a3;
- (BOOL)isSupported;
- (BOOL)skipEncodingMediaLibraryUniqueID;
- (Class)queueFeederClass;
- (MPCModelPlaybackContext)init;
- (MPCModelPlaybackContext)initWithCoder:(id)a3;
- (MPCPlaybackRequestEnvironment)playbackRequestEnvironment;
- (MPIdentifierSet)startItemIdentifiers;
- (MPModelGenericObject)fallbackSectionRepresentation;
- (MPModelRequest)request;
- (NSData)delegateTokenB;
- (NSDictionary)endTimeModifications;
- (NSDictionary)startTimeModifications;
- (NSString)encodedMediaLibraryUniqueID;
- (id)copyWithZone:(_NSZone *)a3;
- (id)descriptionComponents;
- (id)getSharedListeningTracklistWithCompletion:(id)a3;
- (id)userIdentity;
- (void)clearStartItem;
- (void)encodeWithCoder:(id)a3;
- (void)getRemotePlaybackQueueRepresentationWithCompletion:(id)a3;
- (void)setAllowsJumpToIt:(BOOL)a3;
- (void)setDelegateTokenB:(id)a3;
- (void)setEndTimeModifications:(id)a3;
- (void)setFallbackSectionRepresentation:(id)a3;
- (void)setPlaybackRequestEnvironment:(id)a3;
- (void)setRequest:(id)a3;
- (void)setSkipEncodingMediaLibraryUniqueID:(BOOL)a3;
- (void)setStartItemIdentifiers:(id)a3;
- (void)setStartTimeModifications:(id)a3;
- (void)setUserIdentity:(id)a3;
- (void)updateRequestPlaybackEnvironment;
@end

@implementation MPCModelPlaybackContext

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (BOOL)isSupported
{
  uint64_t v32 = *MEMORY[0x263EF8340];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v3 = [MEMORY[0x263F12178] standardUserDefaults];
    int v4 = [v3 forceLibrarySupplementalContexts];

    if (v4)
    {
      v5 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
      if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
      {
        int v20 = 138543618;
        id v21 = (id)objc_opt_class();
        __int16 v22 = 2048;
        id v23 = self;
        id v6 = v21;
        _os_log_impl(&dword_21BB87000, v5, OS_LOG_TYPE_DEFAULT, "<%{public}@: %p> isSupported: NO [user default override]", (uint8_t *)&v20, 0x16u);
      }
      LOBYTE(v7) = 0;
      goto LABEL_18;
    }
    v5 = [(MPCModelPlaybackContext *)self userIdentity];
    v9 = self->_request;
    v10 = [MEMORY[0x263F11E40] deviceMediaLibraryWithUserIdentity:v5];
    v11 = [v10 uniqueIdentifier];

    v12 = self->_encodedMediaLibraryUniqueID;
    v13 = [(MPModelRequest *)v9 valueForKeyPath:@"_mediaLibrary.uniqueIdentifier"];
    v14 = [(MPModelRequest *)v9 mediaLibrary];
    v15 = [v14 uniqueIdentifier];

    v16 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback_Oversize");
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      int v20 = 134219266;
      id v21 = self;
      __int16 v22 = 2114;
      id v23 = v5;
      __int16 v24 = 2114;
      v25 = v11;
      __int16 v26 = 2114;
      v27 = v12;
      __int16 v28 = 2114;
      v29 = v13;
      __int16 v30 = 2114;
      v31 = v15;
      _os_log_impl(&dword_21BB87000, v16, OS_LOG_TYPE_DEFAULT, "[MPC:%p] isSupported | matching device libraries [] user=%{public}@ userDeviceLibraryID=%{public}@ encodedLibraryID=%{public}@ requestDecodedLibraryID=%{public}@ requestLibraryID=%{public}@", (uint8_t *)&v20, 0x3Eu);
    }

    if (v12)
    {
      int v7 = [v11 isEqualToString:v12];
      v17 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
      {
        int v20 = 134218240;
        id v21 = self;
        __int16 v22 = 1024;
        LODWORD(v23) = v7;
        v18 = "[MPC:%p] isSupported | returning %{BOOL}u [using encoded media library]";
LABEL_16:
        _os_log_impl(&dword_21BB87000, v17, OS_LOG_TYPE_DEFAULT, v18, (uint8_t *)&v20, 0x12u);
      }
    }
    else
    {
      int v7 = [v11 isEqualToString:v15];
      v17 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
      {
        int v20 = 134218240;
        id v21 = self;
        __int16 v22 = 1024;
        LODWORD(v23) = v7;
        v18 = "[MPC:%p] isSupported | returning %{BOOL}u [using request media library]";
        goto LABEL_16;
      }
    }

    goto LABEL_18;
  }
  v5 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v20 = 134218242;
    id v21 = self;
    __int16 v22 = 2114;
    id v23 = (id)objc_opt_class();
    id v8 = v23;
    _os_log_impl(&dword_21BB87000, v5, OS_LOG_TYPE_DEFAULT, "[MPC:%p] isSupported | returning YES [non-library request] request.class=%{public}@", (uint8_t *)&v20, 0x16u);
  }
  LOBYTE(v7) = 1;
LABEL_18:

  return v7;
}

- (void)clearStartItem
{
  startItemIdentifiers = self->_startItemIdentifiers;
  self->_startItemIdentifiers = 0;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v14.receiver = self;
  v14.super_class = (Class)MPCModelPlaybackContext;
  id v4 = [(MPCModelPlaybackContext *)&v14 copyWithZone:a3];
  v5 = [(MPCModelPlaybackContext *)self playbackRequestEnvironment];
  [v4 setPlaybackRequestEnvironment:v5];

  id v6 = [(MPCModelPlaybackContext *)self request];
  int v7 = (void *)[v6 copy];
  [v4 setRequest:v7];

  id v8 = [(MPCModelPlaybackContext *)self startItemIdentifiers];
  [v4 setStartItemIdentifiers:v8];

  v9 = [(MPCModelPlaybackContext *)self startTimeModifications];
  [v4 setStartTimeModifications:v9];

  v10 = [(MPCModelPlaybackContext *)self endTimeModifications];
  [v4 setEndTimeModifications:v10];

  v11 = [(MPCModelPlaybackContext *)self fallbackSectionRepresentation];
  [v4 setFallbackSectionRepresentation:v11];

  objc_msgSend(v4, "setSkipEncodingMediaLibraryUniqueID:", -[MPCModelPlaybackContext skipEncodingMediaLibraryUniqueID](self, "skipEncodingMediaLibraryUniqueID"));
  objc_msgSend(v4, "setAllowsJumpToIt:", -[MPCModelPlaybackContext allowsJumpToIt](self, "allowsJumpToIt"));
  v12 = [(MPCModelPlaybackContext *)self delegateTokenB];
  [v4 setDelegateTokenB:v12];

  return v4;
}

- (MPModelRequest)request
{
  return self->_request;
}

- (MPIdentifierSet)startItemIdentifiers
{
  return self->_startItemIdentifiers;
}

- (void)updateRequestPlaybackEnvironment
{
  if ([(MPModelRequest *)self->_request conformsToProtocol:&unk_26CC28748])
  {
    request = self->_request;
    playbackRequestEnvironment = self->_playbackRequestEnvironment;
    [(MPModelRequest *)request setPlaybackRequestEnvironment:playbackRequestEnvironment];
  }
}

- (NSDictionary)startTimeModifications
{
  return self->_startTimeModifications;
}

- (void)setStartItemIdentifiers:(id)a3
{
}

- (MPModelGenericObject)fallbackSectionRepresentation
{
  return self->_fallbackSectionRepresentation;
}

- (NSDictionary)endTimeModifications
{
  return self->_endTimeModifications;
}

- (id)descriptionComponents
{
  v10.receiver = self;
  v10.super_class = (Class)MPCModelPlaybackContext;
  v3 = [(MPCModelPlaybackContext *)&v10 descriptionComponents];
  id v4 = (void *)[v3 mutableCopy];

  v5 = [(MPCModelPlaybackContext *)self playbackRequestEnvironment];
  id v6 = [v5 description];
  [v4 setObject:v6 forKeyedSubscript:@"playbackRequestEnvironment"];

  if ([(MPModelRequest *)self->_request conformsToProtocol:&unk_26CC28748])
  {
    int v7 = [(MPModelRequest *)self->_request playbackRequestEnvironment];
    [v4 setObject:v7 forKeyedSubscript:@"request.playbackRequestEnvironment"];
  }
  [v4 setObject:self->_request forKeyedSubscript:@"request"];
  id v8 = [(MPIdentifierSet *)self->_startItemIdentifiers humanDescription];
  [v4 setObject:v8 forKeyedSubscript:@"startItemIdentifiers"];

  [v4 setObject:self->_delegateTokenB forKeyedSubscript:@"delegateTokenB"];

  return v4;
}

- (MPCPlaybackRequestEnvironment)playbackRequestEnvironment
{
  return self->_playbackRequestEnvironment;
}

- (id)userIdentity
{
  return [(MPCPlaybackRequestEnvironment *)self->_playbackRequestEnvironment userIdentity];
}

- (BOOL)skipEncodingMediaLibraryUniqueID
{
  return self->_skipEncodingMediaLibraryUniqueID;
}

- (void)setStartTimeModifications:(id)a3
{
}

- (void)setSkipEncodingMediaLibraryUniqueID:(BOOL)a3
{
  self->_skipEncodingMediaLibraryUniqueID = a3;
}

- (void)setRequest:(id)a3
{
  id v4 = (MPModelRequest *)[a3 copy];
  request = self->_request;
  self->_request = v4;

  [(MPCModelPlaybackContext *)self updateRequestPlaybackEnvironment];
}

- (void)setPlaybackRequestEnvironment:(id)a3
{
  v5 = (MPCPlaybackRequestEnvironment *)a3;
  if (self->_playbackRequestEnvironment != v5) {
    objc_storeStrong((id *)&self->_playbackRequestEnvironment, a3);
  }
  [(MPCModelPlaybackContext *)self updateRequestPlaybackEnvironment];
}

- (void)setFallbackSectionRepresentation:(id)a3
{
}

- (void)setEndTimeModifications:(id)a3
{
}

- (void)setDelegateTokenB:(id)a3
{
}

- (void)setAllowsJumpToIt:(BOOL)a3
{
  self->_allowsJumpToIt = a3;
}

- (NSData)delegateTokenB
{
  return self->_delegateTokenB;
}

- (BOOL)allowsJumpToIt
{
  return self->_allowsJumpToIt;
}

- (Class)queueFeederClass
{
  uint64_t v38 = *MEMORY[0x263EF8340];
  if (_os_feature_enabled_impl())
  {
    id v3 = [(MPCModelPlaybackContext *)self request];
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
LABEL_7:
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0
        || ([v3 playbackRequestEnvironment],
            v11 = objc_claimAutoreleasedReturnValue(),
            [v11 delegationProperties],
            v12 = objc_claimAutoreleasedReturnValue(),
            v12,
            v11,
            !v12))
      {

LABEL_34:
        goto LABEL_35;
      }
LABEL_33:

      goto LABEL_34;
    }
    id v4 = v3;
    v5 = [v4 mediaLibrary];
    if ([v5 isHomeSharingLibrary])
    {
LABEL_32:

      goto LABEL_33;
    }
    id v6 = [MEMORY[0x263F11FB8] identityKind];
    int v7 = [v4 sectionKind];
    id v8 = [v7 identityKind];
    if (v8 == v6)
    {
    }
    else
    {
      v9 = v8;
      char v10 = [v8 isEqual:v6];

      if ((v10 & 1) == 0)
      {

        goto LABEL_7;
      }
    }
    long long v35 = 0u;
    long long v36 = 0u;
    long long v33 = 0u;
    long long v34 = 0u;
    v13 = objc_msgSend(v4, "scopedContainers", 0);
    uint64_t v14 = [v13 countByEnumeratingWithState:&v33 objects:v37 count:16];
    if (v14)
    {
      uint64_t v15 = v14;
      uint64_t v16 = *(void *)v34;
LABEL_14:
      uint64_t v17 = 0;
      while (1)
      {
        if (*(void *)v34 != v16) {
          objc_enumerationMutation(v13);
        }
        v18 = [MEMORY[0x263F11EE0] genericObjectWithModelObject:*(void *)(*((void *)&v33 + 1) + 8 * v17)];
        if ([v18 type] == 4) {
          break;
        }

        if (v15 == ++v17)
        {
          uint64_t v15 = [v13 countByEnumeratingWithState:&v33 objects:v37 count:16];
          if (v15) {
            goto LABEL_14;
          }
          goto LABEL_20;
        }
      }
      v19 = [v18 playlist];
      id v20 = [v19 identifiers];

      if (v20) {
        goto LABEL_29;
      }
    }
    else
    {
LABEL_20:
    }
    id v21 = [v4 allowedSectionIdentifiers];
    id v20 = (id)[v21 count];

    if (!v20)
    {
LABEL_29:
      __int16 v28 = [v20 library];
      uint64_t v29 = [v28 persistentID];

      if (v29)
      {
        __int16 v30 = [v5 playlistWithPersistentID:v29];
        [v30 playlistAttributes];
      }
      goto LABEL_32;
    }
    __int16 v22 = [v4 allowedSectionIdentifiers];
    id v23 = [v22 firstObject];

    __int16 v24 = [v23 modelKind];
    id v25 = [v24 identityKind];
    if (v25 == v6)
    {
    }
    else
    {
      __int16 v26 = v25;
      char v27 = [v25 isEqual:v6];

      if ((v27 & 1) == 0)
      {
        id v20 = 0;
LABEL_28:

        goto LABEL_29;
      }
    }
    id v20 = v23;
    goto LABEL_28;
  }
LABEL_35:
  v31 = objc_opt_class();

  return (Class)v31;
}

- (MPCModelPlaybackContext)initWithCoder:(id)a3
{
  id v4 = a3;
  v33.receiver = self;
  v33.super_class = (Class)MPCModelPlaybackContext;
  v5 = [(MPCModelPlaybackContext *)&v33 initWithCoder:v4];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"MPCModelPlaybackContextRequest"];
    request = v5->_request;
    v5->_request = (MPModelRequest *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"MPCModelPlaybackContextUserIdentity"];
    v9 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"MPCModelPlaybackContextPlaybackRequestEnvironment"];
    char v10 = v9;
    if (!v9)
    {
      char v10 = +[MPCPlaybackRequestEnvironment requestEnvironmentWithUserIdentity:v8];
    }
    uint64_t v32 = (void *)v8;
    objc_storeStrong((id *)&v5->_playbackRequestEnvironment, v10);
    if (!v9) {

    }
    uint64_t v11 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"MPCModelPlaybackContextStartItemIdentifiers"];
    startItemIdentifiers = v5->_startItemIdentifiers;
    v5->_startItemIdentifiers = (MPIdentifierSet *)v11;

    v13 = (void *)MEMORY[0x263EFFA08];
    uint64_t v14 = objc_opt_class();
    uint64_t v15 = objc_opt_class();
    uint64_t v16 = objc_opt_class();
    uint64_t v17 = objc_msgSend(v13, "setWithObjects:", v14, v15, v16, objc_opt_class(), 0);
    uint64_t v18 = [v4 decodeObjectOfClasses:v17 forKey:@"MPCModelPlaybackContextStartTimeModifications"];
    startTimeModifications = v5->_startTimeModifications;
    v5->_startTimeModifications = (NSDictionary *)v18;

    id v20 = (void *)MEMORY[0x263EFFA08];
    uint64_t v21 = objc_opt_class();
    uint64_t v22 = objc_opt_class();
    uint64_t v23 = objc_opt_class();
    __int16 v24 = objc_msgSend(v20, "setWithObjects:", v21, v22, v23, objc_opt_class(), 0);
    uint64_t v25 = [v4 decodeObjectOfClasses:v24 forKey:@"MPCModelPlaybackContextEndTimeModifications"];
    endTimeModifications = v5->_endTimeModifications;
    v5->_endTimeModifications = (NSDictionary *)v25;

    uint64_t v27 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"MPCModelPlaybackContextFallbackSectionRepresentation"];
    fallbackSectionRepresentation = v5->_fallbackSectionRepresentation;
    v5->_fallbackSectionRepresentation = (MPModelGenericObject *)v27;

    uint64_t v29 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"MPCModelPlaybackContextMediaLibraryUniqueID"];
    encodedMediaLibraryUniqueID = v5->_encodedMediaLibraryUniqueID;
    v5->_encodedMediaLibraryUniqueID = (NSString *)v29;

    v5->_skipEncodingMediaLibraryUniqueID = [v4 decodeBoolForKey:@"semlUID"];
  }

  return v5;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_delegateTokenB, 0);
  objc_storeStrong((id *)&self->_playbackRequestEnvironment, 0);
  objc_storeStrong((id *)&self->_encodedMediaLibraryUniqueID, 0);
  objc_storeStrong((id *)&self->_fallbackSectionRepresentation, 0);
  objc_storeStrong((id *)&self->_endTimeModifications, 0);
  objc_storeStrong((id *)&self->_startTimeModifications, 0);
  objc_storeStrong((id *)&self->_startItemIdentifiers, 0);

  objc_storeStrong((id *)&self->_request, 0);
}

- (void)getRemotePlaybackQueueRepresentationWithCompletion:(id)a3
{
  id v4 = a3;
  v5 = [(MPCModelPlaybackContext *)self request];
  uint64_t v6 = (void *)[v5 copy];

  if (v6)
  {
    v37 = v4;
    int v7 = [MEMORY[0x263F893C0] activeAccount];
    if ([v6 conformsToProtocol:&unk_26CC28748])
    {
      id v8 = v6;
      v9 = [v8 playbackRequestEnvironment];

      if (!v9)
      {
        char v10 = [(MPCModelPlaybackContext *)self playbackRequestEnvironment];
        [v8 setPlaybackRequestEnvironment:v10];
      }
      uint64_t v11 = [v8 playbackRequestEnvironment];
      uint64_t v12 = [v11 userIdentity];

      int v7 = (void *)v12;
    }
    v13 = objc_alloc_init(_MPCProtoTracklist);
    uint64_t v14 = [(MPCModelPlaybackContext *)self shuffleType];
    if (v14 == 1000)
    {
      uint64_t v15 = [MEMORY[0x263F12178] standardUserDefaults];
      uint64_t v14 = [v15 musicShuffleType];
    }
    uint64_t v38 = v7;
    if (v13)
    {
      *(unsigned char *)&v13->_has |= 1u;
      v13->_shuffleMode = v14 != 0;
    }
    v69[0] = 0;
    v69[1] = v69;
    v69[2] = 0x3032000000;
    v69[3] = __Block_byref_object_copy__4408;
    v69[4] = __Block_byref_object_dispose__4409;
    id v70 = 0;
    v67[0] = 0;
    v67[1] = v67;
    v67[2] = 0x2020000000;
    char v68 = 1;
    dispatch_queue_t v16 = dispatch_queue_create("com.apple.MediaPlaybackCore.MPCModelPlaybackContext.MPCPlaybackQueue.serialQueue", 0);
    uint64_t v17 = dispatch_group_create();
    dispatch_group_enter(v17);
    [v6 setLabel:@"com.apple.MediaPlaybackCore.MPCModelPlaybackIntentDataSource.remotePlaybackQueueResolution"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      [v6 setDisableImplicitSectioning:1];
    }
    v60[0] = MEMORY[0x263EF8330];
    v60[1] = 3221225472;
    v60[2] = __96__MPCModelPlaybackContext_MPCPlaybackQueue__getRemotePlaybackQueueRepresentationWithCompletion___block_invoke_63;
    v60[3] = &unk_2643BFD30;
    uint64_t v18 = v17;
    v61 = v18;
    v19 = v16;
    v62 = v19;
    v63 = self;
    id v20 = v13;
    v64 = v20;
    v65 = v69;
    v66 = v67;
    [v6 performWithResponseHandler:v60];
    uint64_t v21 = [MEMORY[0x263F893C8] defaultIdentityStore];
    id v59 = 0;
    uint64_t v22 = [v21 getPropertiesForUserIdentity:v38 error:&v59];
    id v23 = v59;
    long long v36 = v22;
    __int16 v24 = [v22 DSID];
    uint64_t v25 = [v24 unsignedLongLongValue];

    if (v25)
    {
      id v35 = v23;
      __int16 v26 = (void *)MEMORY[0x263F893C0];
      uint64_t v27 = [NSNumber numberWithUnsignedLongLong:v25];
      __int16 v28 = [v26 specificAccountWithDSID:v27];
      uint64_t v29 = [v28 identityAllowingDelegation:1];

      dispatch_group_enter(v18);
      v49[0] = MEMORY[0x263EF8330];
      v49[1] = 3221225472;
      v49[2] = __96__MPCModelPlaybackContext_MPCPlaybackQueue__getRemotePlaybackQueueRepresentationWithCompletion___block_invoke_80;
      v49[3] = &unk_2643BFDA8;
      id v50 = v21;
      id v30 = v29;
      id v51 = v30;
      uint64_t v58 = v25;
      v52 = v18;
      v56 = v69;
      v57 = v67;
      v53 = v19;
      v54 = self;
      v55 = v20;
      [v50 getDelegationUUIDsForUserIdentity:v30 completionHandler:v49];

      id v23 = v35;
    }
    else
    {
      v45[0] = MEMORY[0x263EF8330];
      v45[1] = 3221225472;
      v45[2] = __96__MPCModelPlaybackContext_MPCPlaybackQueue__getRemotePlaybackQueueRepresentationWithCompletion___block_invoke_4_90;
      v45[3] = &unk_2643C5E20;
      v47 = v69;
      id v46 = v23;
      v48 = v67;
      dispatch_group_async(v18, v19, v45);
      id v30 = v46;
    }

    v39[0] = MEMORY[0x263EF8330];
    v39[1] = 3221225472;
    v39[2] = __96__MPCModelPlaybackContext_MPCPlaybackQueue__getRemotePlaybackQueueRepresentationWithCompletion___block_invoke_5;
    v39[3] = &unk_2643C5128;
    v40 = v20;
    v41 = self;
    id v42 = v37;
    v43 = v67;
    v44 = v69;
    id v33 = v37;
    long long v34 = v20;
    dispatch_group_notify(v18, v19, v39);

    _Block_object_dispose(v67, 8);
    _Block_object_dispose(v69, 8);

    id v32 = v38;
  }
  else
  {
    v31 = dispatch_get_global_queue(21, 0);
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __96__MPCModelPlaybackContext_MPCPlaybackQueue__getRemotePlaybackQueueRepresentationWithCompletion___block_invoke;
    block[3] = &unk_2643C54B8;
    id v72 = v4;
    id v32 = v4;
    dispatch_async(v31, block);
  }
}

void __96__MPCModelPlaybackContext_MPCPlaybackQueue__getRemotePlaybackQueueRepresentationWithCompletion___block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  objc_msgSend(MEMORY[0x263F087E8], "msv_errorWithDomain:code:debugDescription:", @"MPCError", 6, @"Tracklist token missing model request (nil).");
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, void, id))(v1 + 16))(v1, 0, v2);
}

void __96__MPCModelPlaybackContext_MPCPlaybackQueue__getRemotePlaybackQueueRepresentationWithCompletion___block_invoke_63(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  int v7 = *(NSObject **)(a1 + 32);
  id v8 = *(NSObject **)(a1 + 40);
  v13[0] = MEMORY[0x263EF8330];
  v13[1] = 3221225472;
  v13[2] = __96__MPCModelPlaybackContext_MPCPlaybackQueue__getRemotePlaybackQueueRepresentationWithCompletion___block_invoke_2;
  v13[3] = &unk_2643BFD08;
  uint64_t v9 = *(void *)(a1 + 48);
  char v10 = *(void **)(a1 + 56);
  id v14 = v6;
  uint64_t v15 = v9;
  id v16 = v5;
  id v17 = v10;
  long long v18 = *(_OWORD *)(a1 + 64);
  id v11 = v5;
  id v12 = v6;
  dispatch_group_async(v7, v8, v13);
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

void __96__MPCModelPlaybackContext_MPCPlaybackQueue__getRemotePlaybackQueueRepresentationWithCompletion___block_invoke_80(uint64_t a1, void *a2)
{
  uint64_t v35 = *MEMORY[0x263EF8340];
  id v3 = a2;
  id v4 = [v3 firstObject];
  if (![v3 count])
  {
    id v5 = [MEMORY[0x263F08C38] UUID];
    uint64_t v6 = [v5 UUIDString];

    int v7 = *(void **)(a1 + 32);
    uint64_t v34 = v6;
    id v8 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v34 count:1];
    [v7 addDelegationUUIDs:v8 forUserIdentity:*(void *)(a1 + 40) completionHandler:0];

    id v4 = (void *)v6;
  }
  uint64_t v9 = +[MPCPlaybackAccountManager sharedManager];
  uint64_t v10 = *(void *)(a1 + 96);
  id v11 = (char *)&v35 + 1;
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
    uint64_t v15 = (const UInt8 *)(v11 - 2);
    --v11;
  }
  while (v13.quot);
  if (v10 < 0)
  {
    *(v11 - 2) = 45;
    uint64_t v15 = (const UInt8 *)(v11 - 2);
  }
  id v16 = (__CFString *)CFStringCreateWithBytes(0, v15, (char *)&v35 - (char *)v15, 0x8000100u, 0);
  id v17 = [v9 accountForDSID:v16];

  char v18 = [v17 hasCatalogPlaybackCapability];
  char v19 = [v17 hasDelegationCapability];
  id v20 = *(void **)(a1 + 48);
  uint64_t v21 = *(NSObject **)(a1 + 56);
  v24[0] = MEMORY[0x263EF8330];
  v24[1] = 3221225472;
  v24[2] = __96__MPCModelPlaybackContext_MPCPlaybackQueue__getRemotePlaybackQueueRepresentationWithCompletion___block_invoke_2_84;
  v24[3] = &unk_2643BFD80;
  uint64_t v31 = *(void *)(a1 + 96);
  char v32 = v18;
  char v33 = v19;
  id v25 = v4;
  id v26 = v17;
  long long v30 = *(_OWORD *)(a1 + 80);
  uint64_t v27 = *(void *)(a1 + 64);
  __int16 v28 = v20;
  id v29 = *(id *)(a1 + 72);
  id v22 = v17;
  id v23 = v4;
  dispatch_group_async(v28, v21, v24);
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 48));
}

void __96__MPCModelPlaybackContext_MPCPlaybackQueue__getRemotePlaybackQueueRepresentationWithCompletion___block_invoke_4_90(uint64_t a1)
{
  *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = 0;
}

void __96__MPCModelPlaybackContext_MPCPlaybackQueue__getRemotePlaybackQueueRepresentationWithCompletion___block_invoke_5(uint64_t a1)
{
  if (*(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24))
  {
    id v2 = objc_alloc(MEMORY[0x263F11D80]);
    id v3 = [*(id *)(a1 + 32) data];
    if (v3)
    {
      id v12 = (id)[v2 initWithIdentifier:@"com.apple.music.playbackqueue.tracklist" data:v3 options:MEMORY[0x263EFFA78]];
    }
    else
    {
      int v7 = [MEMORY[0x263EFF8F8] data];
      id v12 = (id)[v2 initWithIdentifier:@"com.apple.music.playbackqueue.tracklist" data:v7 options:MEMORY[0x263EFFA78]];
    }
    [v12 setRequestingImmediatePlayback:1];
    id v8 = [*(id *)(a1 + 40) playActivityRecommendationData];
    if (v8) {
      uint64_t v9 = (void *)[[NSString alloc] initWithData:v8 encoding:4];
    }
    else {
      uint64_t v9 = 0;
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
  id v5 = *(void (**)(uint64_t, void))(v4 + 16);
  uint64_t v6 = *(void *)(a1 + 48);

  v5(v6, 0);
}

void __96__MPCModelPlaybackContext_MPCPlaybackQueue__getRemotePlaybackQueueRepresentationWithCompletion___block_invoke_2_84(uint64_t a1)
{
  uint64_t v2 = +[_MPCProtoDelegateInfo currentDeviceDelegateInfo];
  id v3 = (void *)v2;
  if (v2)
  {
    *(unsigned char *)(v2 + 116) |= 2u;
    *(void *)(v2 + 40) = 1;
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
    id v5 = *(void **)(a1 + 40);
    id v19 = 0;
    uint64_t v6 = [v5 delegateTokenAWithError:&v19];
    id v7 = v19;
    id v8 = v19;
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
      v15[0] = MEMORY[0x263EF8330];
      v15[1] = 3221225472;
      v15[2] = __96__MPCModelPlaybackContext_MPCPlaybackQueue__getRemotePlaybackQueueRepresentationWithCompletion___block_invoke_3_87;
      v15[3] = &unk_2643BFD58;
      id v16 = v3;
      long long v18 = *(_OWORD *)(a1 + 72);
      id v17 = *(id *)(a1 + 56);
      [v14 getDelegateTokenEWithTokenB:v13 completion:v15];
    }
  }
  else if (v3)
  {
    PBRepeatedInt32Add();
  }
LABEL_19:
  -[_MPCProtoTracklist addAccountInfo:](*(void *)(a1 + 64), v3);
}

void __96__MPCModelPlaybackContext_MPCPlaybackQueue__getRemotePlaybackQueueRepresentationWithCompletion___block_invoke_3_87(uint64_t a1, void *a2, void *a3)
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

void __96__MPCModelPlaybackContext_MPCPlaybackQueue__getRemotePlaybackQueueRepresentationWithCompletion___block_invoke_2(uint64_t a1)
{
  uint64_t v2 = *(void **)(a1 + 32);
  if (v2)
  {
    uint64_t v3 = *(void *)(*(void *)(a1 + 64) + 8);
    uint64_t v5 = *(void *)(v3 + 40);
    uint64_t v4 = (id *)(v3 + 40);
    if (!v5) {
      objc_storeStrong(v4, v2);
    }
    *(unsigned char *)(*(void *)(*(void *)(a1 + 72) + 8) + 24) = 0;
  }
  else
  {
    uint64_t v6 = [*(id *)(a1 + 40) startItemIdentifiers];
    if (*(void *)(a1 + 48))
    {
      uint64_t v25 = 0;
      id v26 = &v25;
      uint64_t v27 = 0x3032000000;
      __int16 v28 = __Block_byref_object_copy__4408;
      id v29 = __Block_byref_object_dispose__4409;
      id v30 = 0;
      id v7 = objc_alloc_init(MEMORY[0x263EFF980]);
      uint64_t v8 = [*(id *)(a1 + 48) results];
      id v9 = [*(id *)(a1 + 40) playActivityFeatureName];
      uint64_t v10 = [*(id *)(a1 + 40) playActivityQueueGroupingID];
      v18[0] = MEMORY[0x263EF8330];
      v18[1] = 3221225472;
      v18[2] = __96__MPCModelPlaybackContext_MPCPlaybackQueue__getRemotePlaybackQueueRepresentationWithCompletion___block_invoke_3;
      v18[3] = &unk_2643BFCE0;
      id v11 = v9;
      id v19 = v11;
      id v12 = v10;
      id v20 = v12;
      id v13 = v8;
      id v21 = v13;
      __int16 v24 = &v25;
      id v22 = v6;
      id v14 = v7;
      id v23 = v14;
      [v13 enumerateSectionIdentifiersUsingBlock:v18];
      uint64_t v15 = *(void *)(a1 + 56);
      if (v15) {
        objc_storeStrong((id *)(v15 + 16), v7);
      }
      id v16 = (void *)v26[5];
      if (v16)
      {
        uint64_t v17 = *(void *)(a1 + 56);
        if (v17) {
          objc_storeStrong((id *)(v17 + 32), v16);
        }
      }

      _Block_object_dispose(&v25, 8);
    }
  }
}

void __96__MPCModelPlaybackContext_MPCPlaybackQueue__getRemotePlaybackQueueRepresentationWithCompletion___block_invoke_3(uint64_t a1, uint64_t a2, void *a3)
{
  id v5 = a3;
  uint64_t v6 = objc_alloc_init(_MPCProtoContainer);
  id v7 = objc_alloc_init(_MPCProtoContainerIdentifierSet);
  uint64_t v8 = [v5 modelKind];
  id v9 = [v8 identityKind];
  id v10 = [MEMORY[0x263F11E88] identityKind];
  if (v9 == v10)
  {

    goto LABEL_8;
  }
  id v11 = v10;
  char v12 = [v9 isEqual:v10];

  if (v12)
  {
LABEL_8:
    if (v6)
    {
      *(unsigned char *)&v6->_has |= 1u;
      v6->_containerType = 1;
    }
    long long v18 = [v5 universalStore];
    uint64_t v19 = [v18 adamID];
    if (v19)
    {
      if (v7)
      {
        *(unsigned char *)&v7->_has |= 4u;
        v7->_storeAdamID = v19;
      }
    }
    else
    {
      id v20 = [v5 universalStore];
      uint64_t v21 = [v20 subscriptionAdamID];
      if (v7)
      {
        *(unsigned char *)&v7->_has |= 4u;
        v7->_storeAdamID = v21;
      }
    }
    goto LABEL_27;
  }
  id v13 = [v5 modelKind];
  id v14 = [v13 identityKind];
  id v15 = [MEMORY[0x263F11FB8] identityKind];
  if (v14 == v15)
  {

    goto LABEL_17;
  }
  id v16 = v15;
  char v17 = [v14 isEqual:v15];

  if (v17)
  {
LABEL_17:
    if (v6)
    {
      *(unsigned char *)&v6->_has |= 1u;
      v6->_containerType = 5;
    }
    id v22 = [v5 personalizedStore];
    uint64_t v23 = [v22 cloudID];
    if (v7)
    {
      *(unsigned char *)&v7->_has |= 1u;
      v7->_cloudID = v23;
    }

    __int16 v24 = [v5 universalStore];
    uint64_t v25 = [v24 globalPlaylistID];
    if (v7) {
      objc_storeStrong((id *)&v7->_storePlaylistGlobalID, v25);
    }

    id v26 = [v5 universalStore];
    uint64_t v27 = [v26 universalCloudLibraryID];
    if (v7) {
      objc_storeStrong((id *)&v7->_cloudUniversalLibraryID, v27);
    }

    long long v18 = [v5 versionHash];
    if (v7) {
      objc_storeStrong((id *)&v7->_storePlaylistVersionHash, v18);
    }
LABEL_27:

    goto LABEL_28;
  }
  if (!v6) {
    goto LABEL_31;
  }
  *(unsigned char *)&v6->_has |= 1u;
  v6->_containerType = 0;
LABEL_28:
  __int16 v28 = *(void **)(a1 + 32);
  if (v28 && v6) {
    objc_storeStrong((id *)&v6->_playActivityFeatureName, v28);
  }
LABEL_31:
  id v29 = *(void **)(a1 + 40);
  if (v29)
  {
    if (v6)
    {
      objc_storeStrong((id *)&v6->_playActivityQueueGroupingID, v29);
      goto LABEL_35;
    }
LABEL_40:
    id v30 = 0;
    goto LABEL_37;
  }
  if (!v6) {
    goto LABEL_40;
  }
LABEL_35:
  objc_storeStrong((id *)&v6->_identifierSet, v7);
  id v30 = v6->_identifierSet;
  if (v30)
  {
    *(unsigned char *)&v30->_has |= 2u;
    v30->_delegateInfoID = 1;
  }
LABEL_37:

  id v31 = objc_alloc_init(MEMORY[0x263EFF980]);
  uint64_t v35 = MEMORY[0x263EF8330];
  uint64_t v36 = 3221225472;
  v37 = __96__MPCModelPlaybackContext_MPCPlaybackQueue__getRemotePlaybackQueueRepresentationWithCompletion___block_invoke_4;
  uint64_t v38 = &unk_2643BFCB8;
  uint64_t v41 = *(void *)(a1 + 72);
  char v32 = *(void **)(a1 + 48);
  id v33 = *(id *)(a1 + 56);
  uint64_t v42 = a2;
  id v39 = v33;
  id v40 = v31;
  id v34 = v31;
  [v32 enumerateItemIdentifiersInSectionAtIndex:a2 usingBlock:&v35];
  if (v6) {
    objc_storeStrong((id *)&v6->_items, v31);
  }
  objc_msgSend(*(id *)(a1 + 64), "addObject:", v6, v35, v36, v37, v38);
}

void __96__MPCModelPlaybackContext_MPCPlaybackQueue__getRemotePlaybackQueueRepresentationWithCompletion___block_invoke_4(void *a1, uint64_t a2, void *a3)
{
  uint64_t v61 = *MEMORY[0x263EF8340];
  id v5 = a3;
  if (!*(void *)(*(void *)(*((void *)a1 + 6) + 8) + 40))
  {
    if ([*((id *)a1 + 4) intersectsSet:v5])
    {
      uint64_t v6 = objc_alloc_init(_MPCProtoTracklistIndexPath);
      uint64_t v7 = *(void *)(*((void *)a1 + 6) + 8);
      uint64_t v8 = *(void **)(v7 + 40);
      *(void *)(v7 + 40) = v6;

      uint64_t v9 = *(void *)(*(void *)(*((void *)a1 + 6) + 8) + 40);
      if (v9)
      {
        uint64_t v10 = *((void *)a1 + 7);
        *(unsigned char *)(v9 + 24) |= 1u;
        *(void *)(v9 + 8) = v10;
        uint64_t v11 = *(void *)(*(void *)(*((void *)a1 + 6) + 8) + 40);
        if (v11)
        {
          *(unsigned char *)(v11 + 24) |= 2u;
          *(void *)(v11 + 16) = a2;
        }
      }
    }
  }
  char v12 = objc_alloc_init(_MPCProtoItem);
  id v13 = objc_alloc_init(_MPCProtoItemIdentifierSet);
  id v14 = [v5 personalizedStore];
  uint64_t v15 = [v14 cloudID];
  id v16 = &OBJC_IVAR___MPCModelGenericAVItem__tempFileURLToCleanup;
  if (v13)
  {
    *(unsigned char *)&v13->_has |= 1u;
    v13->_cloudID = v15;
  }

  char v17 = [v5 universalStore];
  uint64_t v18 = [v17 adamID];
  if (v13)
  {
    *(unsigned char *)&v13->_has |= 8u;
    v13->_storeAdamID = v18;
  }

  uint64_t v19 = [v5 universalStore];
  uint64_t v20 = [v19 subscriptionAdamID];
  if (v13)
  {
    *(unsigned char *)&v13->_has |= 0x10u;
    v13->_storeSubscriptionAdamID = v20;
  }

  uint64_t v21 = [v5 universalStore];
  id v22 = [v21 universalCloudLibraryID];
  if (v13) {
    objc_storeStrong((id *)&v13->_cloudUniversalLibraryID, v22);
  }

  uint64_t v23 = [v5 universalStore];
  uint64_t v24 = [v23 purchasedAdamID];
  if (v13)
  {
    *(unsigned char *)&v13->_has |= 4u;
    v13->_purchaseHistoryID = v24;
  }

  uint64_t v25 = [v5 modelKind];
  id v26 = [v25 identityKind];
  id v27 = [MEMORY[0x263F12030] identityKind];
  __int16 v28 = v26;
  if (v26 == v27) {
    goto LABEL_27;
  }
  char v29 = [v26 isEqual:v27];

  if (v29)
  {
LABEL_28:

    goto LABEL_29;
  }
  v56 = a1;
  __int16 v28 = [v5 modelKind];
  id v30 = [v28 identityKind];
  id v31 = [MEMORY[0x263F11FA8] identityKind];
  if (v30 == v31)
  {

    id v16 = &OBJC_IVAR___MPCModelGenericAVItem__tempFileURLToCleanup;
LABEL_27:

    goto LABEL_28;
  }
  char v32 = v31;
  char v33 = [v30 isEqual:v31];

  a1 = v56;
  id v16 = &OBJC_IVAR___MPCModelGenericAVItem__tempFileURLToCleanup;
  if (v33)
  {
LABEL_29:
    if (v12)
    {
      *(unsigned char *)&v12->_has |= 1u;
      v12->_mediaType = 1;
      char v44 = [v5 shouldExcludeFromShuffle];
      *(unsigned char *)&v12->_has |= 2u;
      v12->_excludeFromShuffle = v44;
      goto LABEL_31;
    }
    [v5 shouldExcludeFromShuffle];
    goto LABEL_50;
  }
  id v34 = [v5 modelKind];
  id v35 = [v34 identityKind];
  id v36 = [MEMORY[0x263F12080] identityKind];
  if (v35 == v36)
  {

LABEL_43:
    if (v12)
    {
      *(unsigned char *)&v12->_has |= 1u;
      int v55 = 6;
LABEL_48:
      v12->_mediaType = v55;
      goto LABEL_31;
    }
LABEL_50:
    id v46 = 0;
    unint64_t v45 = 0x267C60000;
    goto LABEL_33;
  }
  v37 = v36;
  char v38 = [v35 isEqual:v36];

  if (v38) {
    goto LABEL_43;
  }
  id v39 = [v5 modelKind];
  id v40 = [v39 identityKind];
  id v41 = [MEMORY[0x263F11F70] identityKind];
  if (v40 == v41)
  {

LABEL_46:
    if (v12)
    {
      *(unsigned char *)&v12->_has |= 1u;
      int v55 = 5;
      goto LABEL_48;
    }
    goto LABEL_50;
  }
  uint64_t v42 = v41;
  char v43 = [v40 isEqual:v41];

  if (v43) {
    goto LABEL_46;
  }
  if (!v12) {
    goto LABEL_50;
  }
LABEL_31:
  unint64_t v45 = 0x267C60000uLL;
  objc_storeStrong((id *)&v12->_identifierSet, v13);
  id v46 = v12->_identifierSet;
  if (v46)
  {
    *((unsigned char *)&v46->super.super.isa + v16[168]) |= 2u;
    v46->_delegateInfoID = 1;
  }
LABEL_33:

  v47 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
  if (os_log_type_enabled(v47, OS_LOG_TYPE_DEBUG))
  {
    v48 = [v5 library];
    uint64_t v49 = [v48 containedPersistentID];
    uint64_t v50 = v49;
    if (!v49)
    {
      v56 = [v5 library];
      uint64_t v50 = [v56 persistentID];
    }
    id v51 = a1;
    if (v12) {
      v52 = *(Class *)((char *)&v12->super.super.isa + *(int *)(v45 + 3804));
    }
    else {
      v52 = 0;
    }
    id v53 = v52;
    v54 = [v53 dictionaryRepresentation];
    *(_DWORD *)buf = 134218242;
    uint64_t v58 = v50;
    __int16 v59 = 2114;
    v60 = v54;
    _os_log_impl(&dword_21BB87000, v47, OS_LOG_TYPE_DEBUG, "XDLib: => %lld => %{public}@", buf, 0x16u);

    if (!v49) {
    a1 = v51;
    }
  }

  [*((id *)a1 + 5) addObject:v12];
}

- (id)getSharedListeningTracklistWithCompletion:(id)a3
{
  id v5 = a3;
  uint64_t v6 = [(MPCModelPlaybackContext *)self request];
  uint64_t v7 = (void *)[v6 copy];

  if (([v7 conformsToProtocol:&unk_26CC36B50] & 1) == 0)
  {
    char v33 = [MEMORY[0x263F08690] currentHandler];
    [v33 handleFailureInMethod:a2, self, @"MPPlaybackContext+MPCSharedListening.m", 39, @"Request class (%@) must conform to MPCModelPlaybackRequest", objc_opt_class() object file lineNumber description];
  }
  uint64_t v8 = [v7 itemKind];
  uint64_t v9 = (void *)[v8 modelClass];

  uint64_t v10 = objc_msgSend(v9, "mqf_requiredItemPlaybackProperties");
  if (v10)
  {
    [v7 setItemProperties:v10];
    uint64_t v11 = [v7 sectionKind];
    char v12 = (void *)[v11 modelClass];

    id v13 = objc_msgSend(v12, "mqf_requiredSectionPlaybackProperties");
    id v14 = [v7 sectionProperties];
    uint64_t v15 = [v13 propertySetByCombiningWithPropertySet:v14];

    [v7 setSectionProperties:v15];
    id v16 = [MEMORY[0x263F08AB8] progressWithTotalUnitCount:-1];
    char v17 = os_log_create("com.apple.amp.mediaplaybackcore", "SharedSession");
    uint64_t v18 = (char *)os_signpost_id_make_with_pointer(v17, self);

    uint64_t v19 = [(MPCModelPlaybackContext *)self startItemIdentifiers];
    uint64_t v20 = os_log_create("com.apple.amp.mediaplaybackcore", "SharedSession");
    uint64_t v21 = v20;
    if ((unint64_t)(v18 - 1) <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v20))
    {
      LOWORD(buf[0]) = 0;
      _os_signpost_emit_with_name_impl(&dword_21BB87000, v21, OS_SIGNPOST_INTERVAL_BEGIN, (os_signpost_id_t)v18, "sharedListeningTracklist:modelRequest:perform", "", (uint8_t *)buf, 2u);
    }

    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v22 = [v7 legacyMediaQuery];
      BOOL v23 = v22 != 0;
    }
    else
    {
      BOOL v23 = 0;
    }
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      uint64_t v25 = [v19 library];

      if (v25)
      {
        uint64_t v26 = [v19 copyWithSource:@"PlaybackContext-SharePlay" block:&__block_literal_global_21355];

        uint64_t v19 = (void *)v26;
      }
    }
    objc_initWeak(buf, v16);
    v37[0] = MEMORY[0x263EF8330];
    v37[1] = 3221225472;
    v37[2] = __89__MPCModelPlaybackContext_MPCSharedListening__getSharedListeningTracklistWithCompletion___block_invoke_2;
    v37[3] = &unk_2643C3280;
    v41[1] = v18;
    objc_copyWeak(v41, buf);
    id v40 = v5;
    v37[4] = self;
    id v27 = v19;
    id v38 = v27;
    BOOL v42 = v23;
    id v39 = v7;
    __int16 v28 = (void *)[v39 newOperationWithResponseHandler:v37];
    v35[0] = MEMORY[0x263EF8330];
    v35[1] = 3221225472;
    v35[2] = __89__MPCModelPlaybackContext_MPCSharedListening__getSharedListeningTracklistWithCompletion___block_invoke_112;
    v35[3] = &unk_2643C5FC8;
    id v29 = v28;
    id v36 = v29;
    [v16 setCancellationHandler:v35];
    id v30 = [(MPCModelPlaybackContext *)self request];
    id v31 = [(id)objc_opt_class() preferredQueue];
    [v31 addOperation:v29];

    objc_destroyWeak(v41);
    objc_destroyWeak(buf);
  }
  else
  {
    if (MSVDeviceOSIsInternalInstall())
    {
      id v34 = [MEMORY[0x263F08690] currentHandler];
      [v34 handleFailureInMethod:a2, self, @"MPPlaybackContext+MPCSharedListening.m", 44, @"Invalid request item class: %@ for %@", v9, v7 object file lineNumber description];
    }
    uint64_t v24 = objc_msgSend(MEMORY[0x263F087E8], "msv_errorWithDomain:code:debugDescription:", @"MPCMusicPlaybackContextSharePlayError", 3, @"Invalid request item class: %@ for %@", v9, v7);
    (*((void (**)(id, void, void, void *))v5 + 2))(v5, 0, 0, v24);

    id v16 = [MEMORY[0x263F08AB8] progressWithTotalUnitCount:0];
  }

  return v16;
}

void __89__MPCModelPlaybackContext_MPCSharedListening__getSharedListeningTracklistWithCompletion___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  uint64_t v84 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = os_log_create("com.apple.amp.mediaplaybackcore", "SharedSession");
  uint64_t v8 = v7;
  os_signpost_id_t v9 = *(void *)(a1 + 72);
  if (v9 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v7))
  {
    uint64_t v10 = [v5 results];
    *(_DWORD *)buf = 134218242;
    *(void *)&uint8_t buf[4] = [v10 totalItemCount];
    *(_WORD *)&buf[12] = 2114;
    *(void *)&buf[14] = v6;
    _os_signpost_emit_with_name_impl(&dword_21BB87000, v8, OS_SIGNPOST_INTERVAL_END, v9, "sharedListeningTracklist:modelRequest:perform", "items=%lld; error=%{public}@",
      buf,
      0x16u);
  }
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 64));
  int v12 = [WeakRetained isCancelled];

  if (!v12)
  {
    if (v6)
    {
      uint64_t v15 = *(void *)(a1 + 56);
      id v16 = objc_msgSend(MEMORY[0x263F087E8], "msv_errorWithDomain:code:underlyingError:debugDescription:", @"MPCMusicPlaybackContextSharePlayError", 4, v6, @"Failed to load request: %@", *(void *)(a1 + 32));
      (*(void (**)(uint64_t, void, void, void *))(v15 + 16))(v15, 0, 0, v16);

      goto LABEL_36;
    }
    char v17 = [v5 results];
    BOOL v18 = [v17 totalItemCount] == 0;

    if (v18)
    {
      uint64_t v38 = *(void *)(a1 + 56);
      id v39 = objc_msgSend(MEMORY[0x263F087E8], "msv_errorWithDomain:code:debugDescription:", @"MPCMusicPlaybackContextSharePlayError", 5, @"Request did not produce any items: %@", *(void *)(a1 + 32));
      (*(void (**)(uint64_t, void, void, void *))(v38 + 16))(v38, 0, 0, v39);

      goto LABEL_36;
    }
    *(void *)buf = 0;
    *(void *)&buf[8] = buf;
    *(void *)&buf[16] = 0x3032000000;
    v81 = __Block_byref_object_copy__21362;
    v82 = __Block_byref_object_dispose__21363;
    id v83 = 0;
    uint64_t v70 = 0;
    v71 = &v70;
    uint64_t v72 = 0x3032000000;
    v73 = __Block_byref_object_copy__21362;
    v74 = __Block_byref_object_dispose__21363;
    id v75 = 0;
    uint64_t v19 = [*(id *)(a1 + 32) playActivityFeatureName];
    uint64_t v20 = (void *)MEMORY[0x263EFF980];
    uint64_t v21 = [v5 results];
    id v22 = objc_msgSend(v20, "arrayWithCapacity:", objc_msgSend(v21, "totalItemCount"));

    id v23 = objc_alloc_init(MEMORY[0x263F54EF8]);
    uint64_t v24 = os_log_create("com.apple.amp.mediaplaybackcore", "SharedSession");
    uint64_t v25 = v24;
    os_signpost_id_t v26 = *(void *)(a1 + 72);
    if (v26 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v24))
    {
      *(_WORD *)v76 = 0;
      _os_signpost_emit_with_name_impl(&dword_21BB87000, v25, OS_SIGNPOST_INTERVAL_BEGIN, v26, "sharedListeningTracklist:modelRequest:enumerate", "", v76, 2u);
    }

    id v27 = [v5 results];
    uint64_t v56 = MEMORY[0x263EF8330];
    uint64_t v57 = 3221225472;
    uint64_t v58 = __89__MPCModelPlaybackContext_MPCSharedListening__getSharedListeningTracklistWithCompletion___block_invoke_79;
    __int16 v59 = &unk_2643C3238;
    id v28 = v19;
    v66 = buf;
    uint64_t v29 = *(void *)(a1 + 32);
    id v60 = v28;
    uint64_t v61 = v29;
    id v30 = v23;
    id v62 = v30;
    id v31 = v5;
    id v63 = v31;
    id v64 = *(id *)(a1 + 40);
    v67 = &v70;
    id v32 = v22;
    char v69 = *(unsigned char *)(a1 + 80);
    uint64_t v33 = *(void *)(a1 + 72);
    id v65 = v32;
    uint64_t v68 = v33;
    [v27 enumerateSectionsUsingBlock:&v56];

    id v34 = os_log_create("com.apple.amp.mediaplaybackcore", "SharedSession");
    id v35 = v34;
    os_signpost_id_t v36 = *(void *)(a1 + 72);
    if (v36 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v34))
    {
      uint64_t v37 = [v30 totalItemCount];
      *(_DWORD *)v76 = 134217984;
      uint64_t v77 = v37;
      _os_signpost_emit_with_name_impl(&dword_21BB87000, v35, OS_SIGNPOST_INTERVAL_END, v36, "sharedListeningTracklist:modelRequest:enumerate", "items=%lld", v76, 0xCu);
    }

    if (*(void *)(*(void *)&buf[8] + 40)) {
      goto LABEL_16;
    }
    if ([v30 totalItemCount])
    {
      if (v71[5] || !*(void *)(a1 + 40))
      {
        if ([v32 count])
        {
          id v40 = objc_msgSend(v32, "msv_map:", &__block_literal_global_110_21373);
          id v41 = _MPCLogCategoryPlayback_Oversize();
          if (os_log_type_enabled(v41, OS_LOG_TYPE_DEFAULT))
          {
            uint64_t v42 = *(void *)(a1 + 32);
            *(_DWORD *)v76 = 134218242;
            uint64_t v77 = v42;
            __int16 v78 = 2114;
            id v79 = v40;
            _os_log_impl(&dword_21BB87000, v41, OS_LOG_TYPE_DEFAULT, "[SLQF] %p getSharedListeningTracklist [dropping unsupported IDs] unsupportedIDs=%{public}@", v76, 0x16u);
          }
        }
LABEL_16:
        (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
LABEL_35:

        _Block_object_dispose(&v70, 8);
        _Block_object_dispose(buf, 8);

        goto LABEL_36;
      }
      v47 = _MPCLogCategoryPlayback_Oversize();
      if (os_log_type_enabled(v47, OS_LOG_TYPE_ERROR))
      {
        uint64_t v48 = *(void *)(a1 + 32);
        uint64_t v49 = *(void **)(a1 + 40);
        *(_DWORD *)v76 = 134218242;
        uint64_t v77 = v48;
        __int16 v78 = 2114;
        id v79 = v49;
        _os_log_impl(&dword_21BB87000, v47, OS_LOG_TYPE_ERROR, "[SLQF] %p getSharedListeningTracklist failed (1/3) [invalid start item IDs] startItemIdentifiers=%{public}@", v76, 0x16u);
      }

      uint64_t v50 = _MPCLogCategoryPlayback_Oversize();
      if (os_log_type_enabled(v50, OS_LOG_TYPE_ERROR))
      {
        uint64_t v51 = *(void *)(a1 + 32);
        v52 = *(void **)(a1 + 48);
        *(_DWORD *)v76 = 134218242;
        uint64_t v77 = v51;
        __int16 v78 = 2114;
        id v79 = v52;
        _os_log_impl(&dword_21BB87000, v50, OS_LOG_TYPE_ERROR, "[SLQF] %p getSharedListeningTracklist failed (2/3) [invalid start item IDs] request=%{public}@", v76, 0x16u);
      }

      id v53 = _MPCLogCategoryPlayback_Oversize();
      if (os_log_type_enabled(v53, OS_LOG_TYPE_ERROR))
      {
        uint64_t v54 = *(void *)(a1 + 32);
        *(_DWORD *)v76 = 134218242;
        uint64_t v77 = v54;
        __int16 v78 = 2114;
        id v79 = v31;
        _os_log_impl(&dword_21BB87000, v53, OS_LOG_TYPE_ERROR, "[SLQF] %p getSharedListeningTracklist failed (3/3) [invalid start item IDs] response=%{public}@", v76, 0x16u);
      }

      uint64_t v55 = *(void *)(a1 + 56);
      unint64_t v45 = objc_msgSend(MEMORY[0x263F087E8], "msv_errorWithDomain:code:debugDescription:", @"MPCMusicPlaybackContextSharePlayError", 8, @"Intent did not produce start item for identifiers: %@", *(void *)(a1 + 40));
      (*(void (**)(uint64_t, void, void, void *))(v55 + 16))(v55, 0, 0, v45);
    }
    else
    {
      uint64_t v43 = *(void *)(a1 + 56);
      char v44 = (void *)MEMORY[0x263F087E8];
      unint64_t v45 = [v31 results];
      id v46 = objc_msgSend(v44, "msv_errorWithDomain:code:debugDescription:", @"MPCMusicPlaybackContextSharePlayError", 7, @"Intent did not produce any store items: %@ %@", v45, *(void *)(a1 + 32), v56, v57, v58, v59, v60, v61, v62, v63, v64);
      (*(void (**)(uint64_t, void, void, void *))(v43 + 16))(v43, 0, 0, v46);
    }
    goto LABEL_35;
  }
  uint64_t v13 = *(void *)(a1 + 56);
  id v14 = objc_msgSend(MEMORY[0x263F087E8], "msv_errorWithDomain:code:debugDescription:", @"MPCMusicPlaybackContextSharePlayError", 2, @"Cancelled while performing request: %@", *(void *)(a1 + 32));
  (*(void (**)(uint64_t, void, void, void *))(v13 + 16))(v13, 0, 0, v14);

LABEL_36:
}

uint64_t __89__MPCModelPlaybackContext_MPCSharedListening__getSharedListeningTracklistWithCompletion___block_invoke_112(uint64_t a1)
{
  return [*(id *)(a1 + 32) cancel];
}

void __89__MPCModelPlaybackContext_MPCSharedListening__getSharedListeningTracklistWithCompletion___block_invoke_79(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  uint64_t v64 = *MEMORY[0x263EF8340];
  id v7 = a2;
  objc_opt_class();
  uint64_t v8 = v7;
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    id v9 = objc_alloc(MEMORY[0x263F11F78]);
    uint64_t v10 = [MEMORY[0x263F11DB0] emptyIdentifierSet];
    uint64_t v8 = (void *)[v9 initWithIdentifiers:v10 block:&__block_literal_global_85];
  }
  uint64_t v11 = [v8 identifiers];
  int v12 = [v11 preferredStoreStringIdentifierForPersonID:0];
  uint64_t v13 = [MEMORY[0x263F11EE0] genericObjectWithModelObject:v8];
  if ([v12 length])
  {
    if ([v13 type] == 4)
    {
      uint64_t v49 = v12;
      uint64_t v50 = v11;
      uint64_t v14 = [MEMORY[0x263F892F0] playlistContainerWithMediaIdentifier:v12 featureName:*(void *)(a1 + 32)];
    }
    else
    {
      if ([v13 type] != 2)
      {
        uint64_t v42 = (void *)MEMORY[0x263F087E8];
        [v13 type];
        uint64_t v43 = NSStringFromMPModelGenericObjectType();
        uint64_t v44 = objc_msgSend(v42, "msv_errorWithDomain:code:debugDescription:", @"MPCMusicPlaybackContextSharePlayError", 6, @"Intent produced unsupported section (genericObject.type=%@) %@", v43, *(void *)(a1 + 40));
        uint64_t v45 = *(void *)(*(void *)(a1 + 80) + 8);
        id v46 = *(void **)(v45 + 40);
        *(void *)(v45 + 40) = v44;

        *a4 = 1;
        goto LABEL_31;
      }
      uint64_t v49 = v12;
      uint64_t v50 = v11;
      uint64_t v14 = [MEMORY[0x263F892F0] albumContainerWithMediaIdentifier:v12 featureName:*(void *)(a1 + 32)];
    }
  }
  else
  {
    uint64_t v49 = v12;
    uint64_t v50 = v11;
    uint64_t v14 = [MEMORY[0x263F892F0] groupWithFeatureName:*(void *)(a1 + 32)];
  }
  uint64_t v48 = (void *)v14;
  [*(id *)(a1 + 48) appendSection:v14];
  uint64_t v15 = (void *)MEMORY[0x263EFF980];
  id v16 = [*(id *)(a1 + 56) results];
  char v17 = objc_msgSend(v15, "arrayWithCapacity:", objc_msgSend(v16, "numberOfItemsInSection:", a3));

  aBlock[0] = MEMORY[0x263EF8330];
  aBlock[1] = 3221225472;
  aBlock[2] = __89__MPCModelPlaybackContext_MPCSharedListening__getSharedListeningTracklistWithCompletion___block_invoke_3;
  aBlock[3] = &unk_2643C31C0;
  id v18 = v17;
  id v56 = v18;
  id v19 = *(id *)(a1 + 64);
  uint64_t v60 = *(void *)(a1 + 88);
  uint64_t v61 = a3;
  uint64_t v20 = *(void *)(a1 + 40);
  id v57 = v19;
  uint64_t v58 = v20;
  id v59 = *(id *)(a1 + 72);
  uint64_t v21 = _Block_copy(aBlock);
  if ([v13 type] == 4)
  {
    id v22 = [v13 playlist];
    BOOL v23 = [v22 type] == 1;
  }
  else
  {
    BOOL v23 = 0;
  }
  int v24 = *(unsigned __int8 *)(a1 + 104);
  uint64_t v25 = [*(id *)(a1 + 56) results];
  if (v24 || v23)
  {
    v53[0] = MEMORY[0x263EF8330];
    v53[1] = 3221225472;
    v53[2] = __89__MPCModelPlaybackContext_MPCSharedListening__getSharedListeningTracklistWithCompletion___block_invoke_94;
    v53[3] = &unk_2643C31E8;
    os_signpost_id_t v26 = &v54;
    id v54 = v21;
    [v25 enumerateItemsUsingBlock:v53];
  }
  else
  {
    v51[0] = MEMORY[0x263EF8330];
    v51[1] = 3221225472;
    v51[2] = __89__MPCModelPlaybackContext_MPCSharedListening__getSharedListeningTracklistWithCompletion___block_invoke_2_96;
    v51[3] = &unk_2643C3210;
    os_signpost_id_t v26 = &v52;
    id v52 = v21;
    [v25 enumerateItemIdentifiersInSectionAtIndex:a3 usingBlock:v51];
  }

  if ([*(id *)(a1 + 40) shuffleType] == 1)
  {
    id v27 = os_log_create("com.apple.amp.mediaplaybackcore", "SharedSession");
    id v28 = v27;
    os_signpost_id_t v29 = *(void *)(a1 + 96);
    if (v29 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v27))
    {
      *(_DWORD *)buf = 134217984;
      uint64_t v63 = a3;
      _os_signpost_emit_with_name_impl(&dword_21BB87000, v28, OS_SIGNPOST_INTERVAL_BEGIN, v29, "sharedListeningTracklist:modelRequest:scramble", "section=%ld", buf, 0xCu);
    }

    id v47 = objc_alloc_init(MEMORY[0x263F54EC0]);
    id v30 = (void *)[objc_alloc(MEMORY[0x263F54F18]) initWithRandomSource:v47 lowestValue:0 highestValue:0x7FFFFFFFLL];
    id v31 = objc_msgSend(MEMORY[0x263EFF980], "arrayWithCapacity:", objc_msgSend(v18, "count"));
    id v32 = *(void **)(*(void *)(*(void *)(a1 + 88) + 8) + 40);
    if (v32 && [v32 section] == a3)
    {
      uint64_t v33 = objc_msgSend(v18, "objectAtIndexedSubscript:", objc_msgSend(*(id *)(*(void *)(*(void *)(a1 + 88) + 8) + 40), "msv_item"));
      objc_msgSend(v18, "removeObjectAtIndex:", objc_msgSend(*(id *)(*(void *)(*(void *)(a1 + 88) + 8) + 40), "msv_item"));
      [v31 addObject:v33];
      uint64_t v34 = objc_msgSend(MEMORY[0x263F088C8], "msv_indexPathForItem:inSection:", 0, a3);
      uint64_t v35 = *(void *)(*(void *)(a1 + 88) + 8);
      os_signpost_id_t v36 = *(void **)(v35 + 40);
      *(void *)(v35 + 40) = v34;
    }
    while ([v18 count])
    {
      uint64_t v37 = objc_msgSend(v30, "nextIntWithUpperBound:", objc_msgSend(v18, "count"));
      uint64_t v38 = [v18 objectAtIndexedSubscript:v37];
      [v31 addObject:v38];

      [v18 removeObjectAtIndex:v37];
    }

    id v39 = os_log_create("com.apple.amp.mediaplaybackcore", "SharedSession");
    id v40 = v39;
    os_signpost_id_t v41 = *(void *)(a1 + 96);
    if (v41 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v39))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_21BB87000, v40, OS_SIGNPOST_INTERVAL_END, v41, "sharedListeningTracklist:modelRequest:scramble", "", buf, 2u);
    }
  }
  else
  {
    id v31 = v18;
  }
  [*(id *)(a1 + 48) appendItems:v31];

  int v12 = v49;
  uint64_t v11 = v50;
LABEL_31:
}

uint64_t __89__MPCModelPlaybackContext_MPCSharedListening__getSharedListeningTracklistWithCompletion___block_invoke_107(uint64_t a1, void *a2)
{
  return [a2 humanDescription];
}

void __89__MPCModelPlaybackContext_MPCSharedListening__getSharedListeningTracklistWithCompletion___block_invoke_3(uint64_t a1, void *a2)
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  id v3 = a2;
  uint64_t v4 = [v3 preferredStoreStringIdentifierForPersonID:0];
  if ([v4 length])
  {
    id v5 = [MEMORY[0x263F892F8] itemWithMediaIdentifier:v4];
    [*(id *)(a1 + 32) addObject:v5];
    if ([*(id *)(a1 + 40) intersectsSet:v3])
    {
      uint64_t v6 = objc_msgSend(MEMORY[0x263F088C8], "msv_indexPathForItem:inSection:", objc_msgSend(*(id *)(a1 + 32), "count") - 1, *(void *)(a1 + 72));
      uint64_t v7 = *(void *)(*(void *)(a1 + 64) + 8);
      uint64_t v8 = *(void **)(v7 + 40);
      *(void *)(v7 + 40) = v6;
    }
    else
    {
      id v9 = [*(id *)(a1 + 40) universalStore];
      uint64_t v10 = [v9 subscriptionAdamID];
      uint64_t v11 = [v3 universalStore];
      uint64_t v12 = [v11 subscriptionAdamID];

      if (v10 == v12)
      {
        uint64_t v13 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback_Oversize");
        if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
        {
          uint64_t v15 = *(void *)(a1 + 40);
          uint64_t v14 = *(void *)(a1 + 48);
          int v16 = 134218498;
          uint64_t v17 = v14;
          __int16 v18 = 2114;
          uint64_t v19 = v15;
          __int16 v20 = 2114;
          id v21 = v3;
          _os_log_impl(&dword_21BB87000, v13, OS_LOG_TYPE_ERROR, "[SLQF] %p getSharedListeningTracklist unexpected failure [intersectsSet returned NO] startItemIdentifiers=%{public}@ itemIdentifierSet=%{public}@", (uint8_t *)&v16, 0x20u);
        }
      }
    }
  }
  else
  {
    [*(id *)(a1 + 56) addObject:v3];
  }
}

void __89__MPCModelPlaybackContext_MPCSharedListening__getSharedListeningTracklistWithCompletion___block_invoke_94(uint64_t a1, void *a2)
{
  uint64_t v2 = *(void *)(a1 + 32);
  id v3 = [a2 identifiers];
  (*(void (**)(uint64_t, id))(v2 + 16))(v2, v3);
}

uint64_t __89__MPCModelPlaybackContext_MPCSharedListening__getSharedListeningTracklistWithCompletion___block_invoke_2_96(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __89__MPCModelPlaybackContext_MPCSharedListening__getSharedListeningTracklistWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  return [a2 clearLibraryIdentifiers];
}

- (NSString)encodedMediaLibraryUniqueID
{
  return self->_encodedMediaLibraryUniqueID;
}

- (void)setUserIdentity:(id)a3
{
  id v8 = a3;
  if (!v8)
  {
    id v8 = [MEMORY[0x263F893C0] activeAccount];
  }
  uint64_t v4 = [(MPCPlaybackRequestEnvironment *)self->_playbackRequestEnvironment userIdentity];
  id v5 = [MEMORY[0x263F893C8] defaultIdentityStore];
  char v6 = [v4 isEqualToIdentity:v8 inStore:v5];

  if ((v6 & 1) == 0)
  {
    uint64_t v7 = +[MPCPlaybackRequestEnvironment requestEnvironmentWithUserIdentity:v8];
    [(MPCModelPlaybackContext *)self setPlaybackRequestEnvironment:v7];
  }
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)MPCModelPlaybackContext;
  [(MPCModelPlaybackContext *)&v8 encodeWithCoder:v4];
  [v4 encodeObject:self->_request forKey:@"MPCModelPlaybackContextRequest"];
  [v4 encodeObject:self->_playbackRequestEnvironment forKey:@"MPCModelPlaybackContextPlaybackRequestEnvironment"];
  [v4 encodeObject:self->_startItemIdentifiers forKey:@"MPCModelPlaybackContextStartItemIdentifiers"];
  [v4 encodeObject:self->_startTimeModifications forKey:@"MPCModelPlaybackContextStartTimeModifications"];
  [v4 encodeObject:self->_endTimeModifications forKey:@"MPCModelPlaybackContextEndTimeModifications"];
  [v4 encodeObject:self->_fallbackSectionRepresentation forKey:@"MPCModelPlaybackContextFallbackSectionRepresentation"];
  [v4 encodeBool:self->_skipEncodingMediaLibraryUniqueID forKey:@"semlUID"];
  if (!self->_skipEncodingMediaLibraryUniqueID)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      encodedMediaLibraryUniqueID = self->_encodedMediaLibraryUniqueID;
      if (encodedMediaLibraryUniqueID)
      {
        [v4 encodeObject:encodedMediaLibraryUniqueID forKey:@"MPCModelPlaybackContextMediaLibraryUniqueID"];
      }
      else
      {
        char v6 = [(MPModelRequest *)self->_request mediaLibrary];
        uint64_t v7 = [v6 uniqueIdentifier];
        [v4 encodeObject:v7 forKey:@"MPCModelPlaybackContextMediaLibraryUniqueID"];
      }
    }
  }
}

- (BOOL)isReusableForPlaybackContext:(id)a3
{
  id v5 = a3;
  v12.receiver = self;
  v12.super_class = (Class)MPCModelPlaybackContext;
  if ([(MPCModelPlaybackContext *)&v12 isReusableForPlaybackContext:v5])
  {
    id v6 = v5;
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      uint64_t v11 = [MEMORY[0x263F08690] currentHandler];
      [v11 handleFailureInMethod:a2 object:self file:@"MPCModelPlaybackContext.m" lineNumber:171 description:@"[super isReusableForPlaybackContext:] failed to check for equal types"];
    }
    request = self->_request;
    objc_super v8 = [v6 request];
    char v9 = [(MPModelRequest *)request isEqual:v8];
  }
  else
  {
    char v9 = 0;
  }

  return v9;
}

- (BOOL)containsRestorableContent
{
  uint64_t v2 = objc_opt_class();

  return [v2 supportsSecureCoding];
}

- (MPCModelPlaybackContext)init
{
  v5.receiver = self;
  v5.super_class = (Class)MPCModelPlaybackContext;
  uint64_t v2 = [(MPCModelPlaybackContext *)&v5 init];
  id v3 = v2;
  if (v2) {
    [(MPCModelPlaybackContext *)v2 setUserIdentity:0];
  }
  return v3;
}

+ (BOOL)supportsAutoPlay
{
  return 1;
}

@end