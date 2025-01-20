@interface _MPCQueueControllerBehaviorMusicDataSourceState
+ (BOOL)supportsSecureCoding;
- (BOOL)canJumpToItem:(id)a3 reason:(id *)a4;
- (BOOL)canSkipItem:(id)a3 reason:(id *)a4;
- (BOOL)containsLiveStream;
- (BOOL)isFrozen;
- (BOOL)isRadioDataSource;
- (BOOL)section:(id)a3 shouldShuffleExcludeItem:(id)a4;
- (BOOL)section:(id)a3 supportsShuffleType:(int64_t)a4;
- (BOOL)shouldAddOriginalPlaybackContextAfterReplacement;
- (BOOL)shouldRequestAdditionalItemsAtTail;
- (BOOL)shouldUsePlaceholderForItem:(id)a3 inSection:(id)a4;
- (MPCPlaybackEngineEventStream)eventStream;
- (MPCQueueControllerBehaviorMusicDataSource)dataSource;
- (MPPlaceholderAVItem)tailPlaceholderItem;
- (MPPlaybackContext)originalPlaybackContext;
- (MPPlaybackContext)playbackContext;
- (MPPlaybackContext)supplementalPlaybackContext;
- (NSString)description;
- (NSString)playerID;
- (NSString)preferredStartContentItemID;
- (NSString)preferredStartItemIdentifier;
- (NSString)sectionIdentifier;
- (_MPCQueueControllerBehaviorMusicDataSourceState)initWithCoder:(id)a3;
- (_MPCQueueControllerBehaviorMusicDataSourceState)initWithPlaybackContext:(id)a3;
- (id)_rtcSourceServiceName;
- (id)firstItemIntersectingIdentifierSet:(id)a3;
- (id)getTailPlaceholderItemAndState:(int64_t *)a3;
- (id)itemForItem:(id)a3 inSection:(id)a4;
- (int64_t)prefetchThreshold;
- (int64_t)state;
- (int64_t)supplementalPlaybackContextBehavior;
- (os_unfair_lock_s)stateLock;
- (void)_buildPlaceholder;
- (void)_inLock_buildPlaceholder;
- (void)encodeWithCoder:(id)a3;
- (void)itemDidBeginPlayback:(id)a3;
- (void)loadAdditionalItemsIfNeededWithCount:(int64_t)a3 completion:(id)a4;
- (void)reloadSection:(id)a3 completion:(id)a4;
- (void)setEventStream:(id)a3;
- (void)setFrozen:(BOOL)a3;
- (void)setPlayerID:(id)a3;
- (void)setState:(int64_t)a3;
- (void)updatePlaybackContext;
@end

@implementation _MPCQueueControllerBehaviorMusicDataSourceState

- (BOOL)canSkipItem:(id)a3 reason:(id *)a4
{
  if ((*(_WORD *)&self->_supportedMethods & 0x10) != 0) {
    return [(MPCQueueControllerBehaviorMusicDataSource *)self->_dataSource canSkipItem:a3 reason:a4];
  }
  else {
    return 1;
  }
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)itemDidBeginPlayback:(id)a3
{
  if ((*(_WORD *)&self->_supportedMethods & 0x40) != 0) {
    [(MPCQueueControllerBehaviorMusicDataSource *)self->_dataSource itemDidBeginPlayback:a3];
  }
}

- (BOOL)shouldUsePlaceholderForItem:(id)a3 inSection:(id)a4
{
  if ((*(_WORD *)&self->_supportedMethods & 0x200) != 0) {
    return [(MPCQueueControllerBehaviorMusicDataSource *)self->_dataSource shouldUsePlaceholderForItem:a3 inSection:a4];
  }
  else {
    return 0;
  }
}

- (MPCQueueControllerBehaviorMusicDataSource)dataSource
{
  return self->_dataSource;
}

- (id)itemForItem:(id)a3 inSection:(id)a4
{
  return (id)[(MPCQueueControllerBehaviorMusicDataSource *)self->_dataSource itemForItem:a3 inSection:a4];
}

- (BOOL)isRadioDataSource
{
  if ((*(_WORD *)&self->_supportedMethods & 0x1000) != 0) {
    return [(MPCQueueControllerBehaviorMusicDataSource *)self->_dataSource containsRadioContent];
  }
  else {
    return 0;
  }
}

- (id)_rtcSourceServiceName
{
  if ([(MPCQueueControllerBehaviorMusicDataSource *)self->_dataSource conformsToProtocol:&unk_26CC28260])
  {
    v3 = [(MPCQueueControllerBehaviorMusicDataSource *)self->_dataSource rtcReportingPlayQueueSourceIdentifier];
    v4 = +[MPCRTCEventConsumer playerServiceNameWithPlayerID:self->_playerID];
    v5 = [NSString stringWithFormat:@"%@.%@", v4, v3];
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (BOOL)isFrozen
{
  return self->_frozen;
}

- (BOOL)containsLiveStream
{
  return [(MPCQueueControllerBehaviorMusicDataSource *)self->_dataSource containsLiveStream];
}

- (BOOL)shouldRequestAdditionalItemsAtTail
{
  if (!self->_frozen && (*(_WORD *)&self->_supportedMethods & 0x80) != 0) {
    return [(MPCQueueControllerBehaviorMusicDataSource *)self->_dataSource shouldRequestAdditionalItemsWhenReachingTailOfSection:self->_sectionIdentifier];
  }
  else {
    return 0;
  }
}

- (BOOL)section:(id)a3 supportsShuffleType:(int64_t)a4
{
  if (self->_frozen) {
    return a4 == 1;
  }
  else {
    return [(MPCQueueControllerBehaviorMusicDataSource *)self->_dataSource section:a3 supportsShuffleType:a4];
  }
}

- (NSString)description
{
  v3 = NSString;
  v4 = [(_MPCQueueControllerBehaviorMusicDataSourceState *)self playbackContext];
  v5 = [(_MPCQueueControllerBehaviorMusicDataSourceState *)self originalPlaybackContext];
  v6 = [(_MPCQueueControllerBehaviorMusicDataSourceState *)self supplementalPlaybackContext];
  v7 = [v3 stringWithFormat:@"<_MPCQueueControllerDataSourceState %p> playbackContext: %@ - originalContext: %@ - supplementalContext: %@", self, v4, v5, v6];

  return (NSString *)v7;
}

- (MPPlaybackContext)supplementalPlaybackContext
{
  return self->_supplementalPlaybackContext;
}

- (void)reloadSection:(id)a3 completion:(id)a4
{
  v39[1] = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  os_unfair_lock_lock(&self->_stateLock);
  unint64_t state = self->_state;
  self->_unint64_t state = 1;
  [(_MPCQueueControllerBehaviorMusicDataSourceState *)self _inLock_buildPlaceholder];
  os_unfair_lock_unlock(&self->_stateLock);
  v9 = os_log_create("com.apple.amp.mediaplaybackcore", "QueueController");
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    sectionIdentifier = self->_sectionIdentifier;
    if (state >= 5)
    {
      objc_msgSend(NSString, "stringWithFormat:", @"Unknown[%ld]", state);
      v11 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v11 = off_2643C1A90[state];
    }
    *(_DWORD *)buf = 138543618;
    v33 = sectionIdentifier;
    __int16 v34 = 2114;
    v35 = v11;
    _os_log_impl(&dword_21BB87000, v9, OS_LOG_TYPE_DEFAULT, "[DASOS:%{public}@] reloadSection:… | changing state [starting reloadSection] oldState=%{public}@ newState=Loading", buf, 0x16u);
  }
  id WeakRetained = objc_loadWeakRetained((id *)&self->_eventStream);
  v13 = self->_sectionIdentifier;
  v38 = @"queue-section-id";
  v39[0] = v13;
  v14 = [NSDictionary dictionaryWithObjects:v39 forKeys:&v38 count:1];
  [WeakRetained emitEventType:@"queue-load-begin" payload:v14];

  v15 = [(_MPCQueueControllerBehaviorMusicDataSourceState *)self playbackContext];
  v16 = (void *)[v15 copy];

  v17 = os_log_create("com.apple.amp.mediaplaybackcore", "QueueController_Oversize");
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
  {
    v18 = self->_sectionIdentifier;
    dataSource = self->_dataSource;
    *(_DWORD *)buf = 138543874;
    v33 = v18;
    __int16 v34 = 2048;
    v35 = dataSource;
    __int16 v36 = 2114;
    v37 = v16;
    _os_log_impl(&dword_21BB87000, v17, OS_LOG_TYPE_DEFAULT, "[DASOS:%{public}@] reloadSection:… | loading playback context [dataSource %p] playbackContext=%{public}@ ", buf, 0x20u);
  }

  aBlock[0] = MEMORY[0x263EF8330];
  aBlock[1] = 3221225472;
  aBlock[2] = __76___MPCQueueControllerBehaviorMusicDataSourceState_reloadSection_completion___block_invoke;
  aBlock[3] = &unk_2643C3D38;
  aBlock[4] = self;
  id v20 = v16;
  id v29 = v20;
  id v21 = v7;
  id v31 = v21;
  id v22 = v6;
  id v30 = v22;
  v23 = (void (**)(void))_Block_copy(aBlock);
  v24 = [MEMORY[0x263F12178] standardUserDefaults];
  v25 = [v24 delayQueueLoadDuration];

  if (v25)
  {
    [v25 doubleValue];
    dispatch_time_t v27 = dispatch_time(0, (uint64_t)(v26 * 1000000000.0));
    dispatch_after(v27, MEMORY[0x263EF83A0], v23);
  }
  else
  {
    v23[2](v23);
  }
  if (*(_WORD *)&self->_supportedMethods)
  {
    os_unfair_lock_lock(&self->_stateLock);
    [(_MPCQueueControllerBehaviorMusicDataSourceState *)self _inLock_buildPlaceholder];
    os_unfair_lock_unlock(&self->_stateLock);
  }
}

- (MPPlaybackContext)playbackContext
{
  return self->_playbackContext;
}

- (BOOL)shouldAddOriginalPlaybackContextAfterReplacement
{
  return self->_supplementalPlaybackContextBehavior == 2 && !self->_frozen;
}

- (void)setPlayerID:(id)a3
{
}

- (void)setEventStream:(id)a3
{
}

- (NSString)sectionIdentifier
{
  return self->_sectionIdentifier;
}

- (MPPlaybackContext)originalPlaybackContext
{
  return self->_originalPlaybackContext;
}

- (void)_inLock_buildPlaceholder
{
  os_unfair_lock_assert_owner(&self->_stateLock);
  if ((*(_WORD *)&self->_supportedMethods & 1) == 0
    || ([(MPCQueueControllerBehaviorMusicDataSource *)self->_dataSource placeholderItemForLoadingAdditionalItemsInSection:self->_sectionIdentifier], (id v3 = (id)objc_claimAutoreleasedReturnValue()) == 0))
  {
    id v3 = objc_alloc_init(MEMORY[0x263F12150]);
  }
  id v8 = +[MPCQueueControllerBehaviorMusicIdentifierComponents placeholderComponentsWithLoadingSectionID:self->_sectionIdentifier];
  v4 = [v8 contentItemID];
  v5 = [v8 sectionID];
  id v6 = [v8 itemID];
  [v3 setContentItemID:v4 queueSectionID:v5 queueItemID:v6];

  tailPlaceholderItem = self->_tailPlaceholderItem;
  self->_tailPlaceholderItem = (MPPlaceholderAVItem *)v3;
}

- (_MPCQueueControllerBehaviorMusicDataSourceState)initWithCoder:(id)a3
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  id v5 = a3;
  uint64_t v6 = [v5 decodeIntegerForKey:@"spcb"];
  id v7 = [v5 decodeObjectOfClass:objc_opt_class() forKey:@"spc"];
  id v8 = [v5 decodeObjectOfClass:objc_opt_class() forKey:@"pc"];
  v9 = v8;
  if ((v6 & 0xFFFFFFFFFFFFFFFELL) == 2) {
    LOBYTE(v10) = 1;
  }
  else {
    int v10 = [v8 isSupported] ^ 1;
  }
  if ((v10 & (v7 != 0)) != 0) {
    v11 = v7;
  }
  else {
    v11 = v9;
  }
  id v12 = v11;
  v13 = [v5 decodeObjectOfClass:objc_opt_class() forKey:@"si"];
  if (!v12)
  {
    id v20 = [MEMORY[0x263F08690] currentHandler];
    [v20 handleFailureInMethod:a2, self, @"_MPCQueueControllerBehaviorMusicDataSourceState.m", 128, @"No active context for datasoure state for section: %@", v13 object file lineNumber description];
  }
  v14 = [(_MPCQueueControllerBehaviorMusicDataSourceState *)self initWithPlaybackContext:v12];
  v15 = v14;
  if (v14)
  {
    v14->_unint64_t state = 1;
    objc_storeStrong((id *)&v14->_sectionIdentifier, v13);
    v16 = os_log_create("com.apple.amp.mediaplaybackcore", "QueueController");
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      sectionIdentifier = v15->_sectionIdentifier;
      *(_DWORD *)buf = 138543362;
      id v22 = sectionIdentifier;
      _os_log_impl(&dword_21BB87000, v16, OS_LOG_TYPE_DEFAULT, "[DASOS:%{public}@] initWithCoder: | changing state [init] oldState=Unknown newState=Loading", buf, 0xCu);
    }

    objc_storeStrong((id *)&v15->_originalPlaybackContext, v9);
    objc_storeStrong((id *)&v15->_supplementalPlaybackContext, v7);
    v15->_supplementalPlaybackContextBehavior = v6;
    v15->_frozen = [v5 decodeBoolForKey:@"f"];
    v18 = [v5 decodeObjectOfClass:objc_opt_class() forKey:@"reg"];
    [(MPCQueueControllerBehaviorMusicDataSource *)v15->_dataSource replaceIdentifierRegistry:v18];
  }
  return v15;
}

- (_MPCQueueControllerBehaviorMusicDataSourceState)initWithPlaybackContext:(id)a3
{
  id v6 = a3;
  v29.receiver = self;
  v29.super_class = (Class)_MPCQueueControllerBehaviorMusicDataSourceState;
  id v7 = [(_MPCQueueControllerBehaviorMusicDataSourceState *)&v29 init];
  id v8 = v7;
  if (v7)
  {
    objc_storeStrong((id *)&v7->_playbackContext, a3);
    objc_storeStrong((id *)&v8->_originalPlaybackContext, a3);
    v9 = (objc_class *)[v6 queueFeederClass];
    id v10 = objc_alloc_init(v9);
    if (!v10)
    {
      v28 = [MEMORY[0x263F08690] currentHandler];
      [v28 handleFailureInMethod:a2, v8, @"_MPCQueueControllerBehaviorMusicDataSourceState.m", 77, @"Failed to instantiate queueFeederClass: %@", v9 object file lineNumber description];
    }
    objc_storeStrong((id *)&v8->_dataSource, v10);
    v11 = [v6 overrideSILSectionID];
    uint64_t v12 = [v11 length];

    if (v12) {
      [v6 overrideSILSectionID];
    }
    else {
    uint64_t v13 = MSVNanoIDCreateTaggedPointer();
    }
    sectionIdentifier = v8->_sectionIdentifier;
    v8->_sectionIdentifier = (NSString *)v13;

    v8->_stateLock._os_unfair_lock_opaque = 0;
    *(_WORD *)&v8->_supportedMethods = *(_WORD *)&v8->_supportedMethods & 0xFFFE | objc_opt_respondsToSelector() & 1;
    if (objc_opt_respondsToSelector()) {
      __int16 v15 = 2;
    }
    else {
      __int16 v15 = 0;
    }
    *(_WORD *)&v8->_supportedMethods = *(_WORD *)&v8->_supportedMethods & 0xFFFD | v15;
    if (objc_opt_respondsToSelector()) {
      __int16 v16 = 4;
    }
    else {
      __int16 v16 = 0;
    }
    *(_WORD *)&v8->_supportedMethods = *(_WORD *)&v8->_supportedMethods & 0xFFFB | v16;
    if (objc_opt_respondsToSelector()) {
      __int16 v17 = 8;
    }
    else {
      __int16 v17 = 0;
    }
    *(_WORD *)&v8->_supportedMethods = *(_WORD *)&v8->_supportedMethods & 0xFFF7 | v17;
    if (objc_opt_respondsToSelector()) {
      __int16 v18 = 16;
    }
    else {
      __int16 v18 = 0;
    }
    *(_WORD *)&v8->_supportedMethods = *(_WORD *)&v8->_supportedMethods & 0xFFEF | v18;
    if (objc_opt_respondsToSelector()) {
      __int16 v19 = 32;
    }
    else {
      __int16 v19 = 0;
    }
    *(_WORD *)&v8->_supportedMethods = *(_WORD *)&v8->_supportedMethods & 0xFFDF | v19;
    if (objc_opt_respondsToSelector()) {
      __int16 v20 = 64;
    }
    else {
      __int16 v20 = 0;
    }
    *(_WORD *)&v8->_supportedMethods = *(_WORD *)&v8->_supportedMethods & 0xFFBF | v20;
    if (objc_opt_respondsToSelector()) {
      __int16 v21 = 128;
    }
    else {
      __int16 v21 = 0;
    }
    *(_WORD *)&v8->_supportedMethods = *(_WORD *)&v8->_supportedMethods & 0xFF7F | v21;
    if (objc_opt_respondsToSelector()) {
      __int16 v22 = 256;
    }
    else {
      __int16 v22 = 0;
    }
    *(_WORD *)&v8->_supportedMethods = *(_WORD *)&v8->_supportedMethods & 0xFEFF | v22;
    if (objc_opt_respondsToSelector()) {
      __int16 v23 = 512;
    }
    else {
      __int16 v23 = 0;
    }
    *(_WORD *)&v8->_supportedMethods = *(_WORD *)&v8->_supportedMethods & 0xFDFF | v23;
    if (objc_opt_respondsToSelector()) {
      __int16 v24 = 1024;
    }
    else {
      __int16 v24 = 0;
    }
    *(_WORD *)&v8->_supportedMethods = *(_WORD *)&v8->_supportedMethods & 0xFBFF | v24;
    if (objc_opt_respondsToSelector()) {
      __int16 v25 = 2048;
    }
    else {
      __int16 v25 = 0;
    }
    *(_WORD *)&v8->_supportedMethods = *(_WORD *)&v8->_supportedMethods & 0xF7FF | v25;
    if (objc_opt_respondsToSelector()) {
      __int16 v26 = 4096;
    }
    else {
      __int16 v26 = 0;
    }
    *(_WORD *)&v8->_supportedMethods = *(_WORD *)&v8->_supportedMethods & 0xEFFF | v26;
  }
  return v8;
}

- (int64_t)state
{
  return self->_state;
}

- (void)updatePlaybackContext
{
  dispatch_assert_queue_V2(MEMORY[0x263EF83A0]);
  if ((*(_WORD *)&self->_supportedMethods & 0x800) != 0)
  {
    v4 = [(MPCQueueControllerBehaviorMusicDataSource *)self->_dataSource updatedPlaybackContext];
    uint64_t v5 = objc_opt_class();
    if (v5 != objc_opt_class())
    {
      id v7 = [MEMORY[0x263F08690] currentHandler];
      uint64_t v8 = objc_opt_class();
      [v7 handleFailureInMethod:a2, self, @"_MPCQueueControllerBehaviorMusicDataSourceState.m", 361, @"UpdatedPlaybackContext changed types %@ != %@", v8, objc_opt_class() object file lineNumber description];
    }
    objc_storeStrong((id *)&self->_playbackContext, v4);
    originalPlaybackContext = self->_originalPlaybackContext;
    self->_originalPlaybackContext = v4;
  }
}

- (NSString)preferredStartContentItemID
{
  id v3 = [(_MPCQueueControllerBehaviorMusicDataSourceState *)self preferredStartItemIdentifier];
  if (v3)
  {
    v4 = [(_MPCQueueControllerBehaviorMusicDataSourceState *)self sectionIdentifier];
    uint64_t v5 = +[MPCQueueControllerBehaviorMusicIdentifierComponents itemComponentsWithSectionID:v4 itemID:v3];

    id v6 = [v5 contentItemID];
  }
  else
  {
    id v6 = 0;
  }

  return (NSString *)v6;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_supplementalPlaybackContext, 0);
  objc_destroyWeak((id *)&self->_eventStream);
  objc_storeStrong((id *)&self->_playerID, 0);
  objc_storeStrong((id *)&self->_preferredStartItemIdentifier, 0);
  objc_storeStrong((id *)&self->_sectionIdentifier, 0);
  objc_storeStrong((id *)&self->_originalPlaybackContext, 0);
  objc_storeStrong((id *)&self->_playbackContext, 0);
  objc_storeStrong((id *)&self->_dataSource, 0);

  objc_storeStrong((id *)&self->_tailPlaceholderItem, 0);
}

- (int64_t)supplementalPlaybackContextBehavior
{
  return self->_supplementalPlaybackContextBehavior;
}

- (os_unfair_lock_s)stateLock
{
  return self->_stateLock;
}

- (MPCPlaybackEngineEventStream)eventStream
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_eventStream);

  return (MPCPlaybackEngineEventStream *)WeakRetained;
}

- (NSString)playerID
{
  return self->_playerID;
}

- (NSString)preferredStartItemIdentifier
{
  return self->_preferredStartItemIdentifier;
}

- (void)setFrozen:(BOOL)a3
{
  self->_frozen = a3;
}

- (void)setState:(int64_t)a3
{
  self->_unint64_t state = a3;
}

- (void)_buildPlaceholder
{
  p_stateLock = &self->_stateLock;
  os_unfair_lock_lock(&self->_stateLock);
  [(_MPCQueueControllerBehaviorMusicDataSourceState *)self _inLock_buildPlaceholder];

  os_unfair_lock_unlock(p_stateLock);
}

- (BOOL)section:(id)a3 shouldShuffleExcludeItem:(id)a4
{
  if ((*(_WORD *)&self->_supportedMethods & 0x400) != 0) {
    return [(MPCQueueControllerBehaviorMusicDataSource *)self->_dataSource section:a3 shouldShuffleExcludeItem:a4];
  }
  else {
    return 0;
  }
}

- (MPPlaceholderAVItem)tailPlaceholderItem
{
  p_stateLock = &self->_stateLock;
  os_unfair_lock_lock(&self->_stateLock);
  v4 = self->_tailPlaceholderItem;
  os_unfair_lock_unlock(p_stateLock);

  return v4;
}

- (void)loadAdditionalItemsIfNeededWithCount:(int64_t)a3 completion:(id)a4
{
  v33[1] = *MEMORY[0x263EF8340];
  id v6 = (void (**)(id, void))a4;
  os_unfair_lock_lock(&self->_stateLock);
  int64_t state = self->_state;
  os_unfair_lock_unlock(&self->_stateLock);
  if (self->_frozen || (unint64_t)(state - 1) <= 1)
  {
    v9 = os_log_create("com.apple.amp.mediaplaybackcore", "QueueController");
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      sectionIdentifier = self->_sectionIdentifier;
      BOOL frozen = self->_frozen;
      *(_DWORD *)buf = 138543874;
      objc_super v29 = sectionIdentifier;
      __int16 v30 = 1024;
      *(_DWORD *)id v31 = frozen;
      *(_WORD *)&v31[4] = 2050;
      *(void *)&v31[6] = state;
      _os_log_impl(&dword_21BB87000, v9, OS_LOG_TYPE_DEFAULT, "[DASOS:%{public}@] loadAdditionalItemsIfNeededWithCompletion: additional loading skipped [data source loading or frozen] - _frozen=%{BOOL}u _state=%{public}ld", buf, 0x1Cu);
    }

    goto LABEL_19;
  }
  if ((*(_WORD *)&self->_supportedMethods & 0x80) == 0)
  {
    uint64_t v12 = os_log_create("com.apple.amp.mediaplaybackcore", "QueueController");
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v13 = self->_sectionIdentifier;
      *(_DWORD *)buf = 138543618;
      objc_super v29 = v13;
      __int16 v30 = 2048;
      *(void *)id v31 = a3;
      v14 = "[DASOS:%{public}@] loadAdditionalItemsIfNeededWithCount:%ld… | additional loading skipped [data source doesn"
            "'t support loading more]";
LABEL_17:
      _os_log_impl(&dword_21BB87000, v12, OS_LOG_TYPE_DEFAULT, v14, buf, 0x16u);
      goto LABEL_18;
    }
    goto LABEL_18;
  }
  if (![(MPCQueueControllerBehaviorMusicDataSource *)self->_dataSource shouldRequestAdditionalItemsWhenReachingTailOfSection:self->_sectionIdentifier])
  {
    uint64_t v12 = os_log_create("com.apple.amp.mediaplaybackcore", "QueueController");
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      __int16 v22 = self->_sectionIdentifier;
      *(_DWORD *)buf = 138543618;
      objc_super v29 = v22;
      __int16 v30 = 2048;
      *(void *)id v31 = a3;
      v14 = "[DASOS:%{public}@] loadAdditionalItemsIfNeededWithCount:%ld… | additional loading skipped [data source doesn"
            "'t want to load more]";
      goto LABEL_17;
    }
LABEL_18:

LABEL_19:
    v6[2](v6, 0);
    goto LABEL_20;
  }
  id WeakRetained = objc_loadWeakRetained((id *)&self->_eventStream);
  __int16 v16 = self->_sectionIdentifier;
  v32 = @"queue-section-id";
  v33[0] = v16;
  __int16 v17 = [NSDictionary dictionaryWithObjects:v33 forKeys:&v32 count:1];
  [WeakRetained emitEventType:@"queue-load-begin" payload:v17];

  os_unfair_lock_lock(&self->_stateLock);
  unint64_t v18 = self->_state;
  self->_int64_t state = 2;
  [(_MPCQueueControllerBehaviorMusicDataSourceState *)self _inLock_buildPlaceholder];
  os_unfair_lock_unlock(&self->_stateLock);
  __int16 v19 = os_log_create("com.apple.amp.mediaplaybackcore", "QueueController");
  if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
  {
    __int16 v20 = self->_sectionIdentifier;
    if (v18 >= 5)
    {
      objc_msgSend(NSString, "stringWithFormat:", @"Unknown[%ld]", v18);
      __int16 v21 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      __int16 v21 = off_2643C1A90[v18];
    }
    *(_DWORD *)buf = 138543874;
    objc_super v29 = v20;
    __int16 v30 = 2048;
    *(void *)id v31 = a3;
    *(_WORD *)&v31[8] = 2114;
    *(void *)&v31[10] = v21;
    _os_log_impl(&dword_21BB87000, v19, OS_LOG_TYPE_DEFAULT, "[DASOS:%{public}@] loadAdditionalItemsIfNeededWithCount:%ld… | changing state [start loading additional] oldState=%{public}@ newState=LoadingAdditionalItems", buf, 0x20u);
  }
  dataSource = self->_dataSource;
  __int16 v24 = self->_sectionIdentifier;
  v25[0] = MEMORY[0x263EF8330];
  v25[1] = 3221225472;
  v25[2] = __99___MPCQueueControllerBehaviorMusicDataSourceState_loadAdditionalItemsIfNeededWithCount_completion___block_invoke;
  v25[3] = &unk_2643C1A48;
  v25[4] = self;
  int64_t v27 = a3;
  __int16 v26 = v6;
  [(MPCQueueControllerBehaviorMusicDataSource *)dataSource loadAdditionalItemsWithCount:a3 forSection:v24 completion:v25];

LABEL_20:
}

- (int64_t)prefetchThreshold
{
  if ((*(_WORD *)&self->_supportedMethods & 0x100) != 0) {
    return [(MPCQueueControllerBehaviorMusicDataSource *)self->_dataSource prefetchThresholdForSection:self->_sectionIdentifier];
  }
  else {
    return 0;
  }
}

- (id)firstItemIntersectingIdentifierSet:(id)a3
{
  if ((*(_WORD *)&self->_supportedMethods & 0x20) != 0)
  {
    id v3 = [(MPCQueueControllerBehaviorMusicDataSource *)self->_dataSource firstItemIntersectingIdentifierSet:a3];
  }
  else
  {
    id v3 = 0;
  }

  return v3;
}

- (BOOL)canJumpToItem:(id)a3 reason:(id *)a4
{
  if ((*(_WORD *)&self->_supportedMethods & 8) != 0) {
    return [(MPCQueueControllerBehaviorMusicDataSource *)self->_dataSource canJumpToItem:a3 reason:a4];
  }
  else {
    return 1;
  }
}

- (id)getTailPlaceholderItemAndState:(int64_t *)a3
{
  p_stateLock = &self->_stateLock;
  os_unfair_lock_lock(&self->_stateLock);
  id v6 = self->_tailPlaceholderItem;
  if (a3) {
    *a3 = self->_state;
  }
  os_unfair_lock_unlock(p_stateLock);

  return v6;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  BOOL frozen = self->_frozen;
  id v19 = v4;
  if ((self->_supplementalPlaybackContextBehavior & 0xFFFFFFFFFFFFFFFELL) == 2)
  {
    [v4 encodeObject:self->_playbackContext forKey:@"pc"];
    BOOL v6 = frozen;
    goto LABEL_20;
  }
  if ((*(_WORD *)&self->_supportedMethods & 4) != 0)
  {
    int64_t supplementalPlaybackContextBehavior = [(MPCQueueControllerBehaviorMusicDataSource *)self->_dataSource supplementalPlaybackContextBehavior];
    p_super = self->_originalPlaybackContext;
    if (supplementalPlaybackContextBehavior == 3)
    {
      BOOL v6 = 1;
      goto LABEL_10;
    }
  }
  else
  {
    p_super = self->_originalPlaybackContext;
    int64_t supplementalPlaybackContextBehavior = 0;
  }
  if (([(MPPlaybackContext *)p_super containsRestorableContent] & 1) == 0)
  {
    v9 = objc_alloc_init(_MPCNullPlaybackContext);
    id v10 = [(MPPlaybackContext *)p_super description];
    [(_MPCNullPlaybackContext *)v9 setLabel:v10];

    p_super = &v9->super;
  }
  [v19 encodeObject:p_super forKey:@"pc"];
  BOOL v6 = frozen;
LABEL_10:
  if (self->_supplementalPlaybackContext == self->_playbackContext)
  {
    objc_msgSend(v19, "encodeObject:forKey:");
    int64_t supplementalPlaybackContextBehavior = self->_supplementalPlaybackContextBehavior;
  }
  else
  {
    __int16 supportedMethods = (__int16)self->_supportedMethods;
    if ((supportedMethods & 2) != 0)
    {
      uint64_t v12 = objc_msgSend(v19, "msv_userInfo");
      uint64_t v13 = [v12 objectForKeyedSubscript:*MEMORY[0x263F11C30]];
      uint64_t v14 = [v13 integerValue];

      __int16 v15 = [(MPCQueueControllerBehaviorMusicDataSource *)self->_dataSource supplementalPlaybackContextWithReason:v14];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        id v16 = v15;
        __int16 v17 = [(MPPlaybackContext *)p_super description];
        [v16 setLabel:v17];
      }
      [v19 encodeObject:v15 forKey:@"spc"];

      __int16 supportedMethods = (__int16)self->_supportedMethods;
    }
    if ((supportedMethods & 4) == 0) {
      goto LABEL_19;
    }
  }
  [v19 encodeInteger:supplementalPlaybackContextBehavior forKey:@"spcb"];
LABEL_19:

LABEL_20:
  [v19 encodeObject:self->_sectionIdentifier forKey:@"si"];
  [v19 encodeBool:v6 forKey:@"f"];
  if ([(id)objc_opt_class() usesIdentifierRegistry])
  {
    unint64_t v18 = [(MPCQueueControllerBehaviorMusicDataSource *)self->_dataSource identifierRegistryWithExclusiveAccessReturningObject:&__block_literal_global_14510];
    [v19 encodeObject:v18 forKey:@"reg"];
  }
}

@end