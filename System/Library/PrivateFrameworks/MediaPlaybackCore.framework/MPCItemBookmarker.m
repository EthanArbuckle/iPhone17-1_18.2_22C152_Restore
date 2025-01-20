@interface MPCItemBookmarker
- (MPCItemBookmarker)initWithPlaybackEngine:(id)a3 translator:(id)a4;
- (MPCMediaFoundationTranslator)translator;
- (MPCPlaybackEngine)engine;
- (void)currentItemWillChangeFromItem:(id)a3 toItem:(id)a4 time:(double)a5;
- (void)itemDidBecomeCurrent:(id)a3 time:(double)a4;
- (void)itemDidPlayToEnd:(id)a3 time:(double)a4;
- (void)itemTransitionWillBeginFrom:(id)a3 to:(id)a4 type:(int64_t)a5 timeStamp:(id)a6;
- (void)playbackDidStartForItem:(id)a3 time:(double)a4 rate:(float)a5;
- (void)playbackDidStopForItem:(id)a3 time:(double)a4;
- (void)playbackRateDidChangeToRate:(float)a3 forItem:(id)a4 time:(double)a5;
- (void)playbackStateDidChangeFromState:(int64_t)a3 toState:(int64_t)a4 forItem:(id)a5 time:(double)a6 rate:(float)a7;
- (void)setEngine:(id)a3;
- (void)setTranslator:(id)a3;
- (void)updateDurationSnapshotWithTime:(double)a3 forItem:(id)a4 rate:(float)a5;
@end

@implementation MPCItemBookmarker

- (MPCItemBookmarker)initWithPlaybackEngine:(id)a3 translator:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)MPCItemBookmarker;
  v8 = [(MPCItemBookmarker *)&v11 init];
  v9 = v8;
  if (v8)
  {
    objc_storeWeak((id *)&v8->_engine, v6);
    objc_storeStrong((id *)&v9->_translator, a4);
  }

  return v9;
}

- (void)itemDidBecomeCurrent:(id)a3 time:(double)a4
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  id v7 = a3;
  if (v7)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      v10 = [MEMORY[0x263F08690] currentHandler];
      [v10 handleFailureInMethod:a2, self, @"MPCItemBookmarker.m", 71, @"Invalid parameter not satisfying: %@", @"item == nil || [(MPAVItem *)item isKindOfClass:[MPAVItem class]]" object file lineNumber description];
    }
  }
  id v8 = v7;
  if ([v8 isAssetLoaded])
  {
    [v8 reevaluateType];
    [v8 reevaluateHasProtectedContent];
    [v8 _updateDurationSnapshotWithElapsedTime:a4 playbackRate:0.0];
    v9 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134218498;
      v12 = self;
      __int16 v13 = 2114;
      id v14 = v8;
      __int16 v15 = 2048;
      double v16 = a4;
      _os_log_impl(&dword_21BB87000, v9, OS_LOG_TYPE_DEFAULT, "MPCItemBookmarker %p - Current loaded item bookmark data updated %{public}@ time:%.2fs", buf, 0x20u);
    }
  }
}

- (void)currentItemWillChangeFromItem:(id)a3 toItem:(id)a4 time:(double)a5
{
  uint64_t v35 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  if (v8 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    v26 = [MEMORY[0x263F08690] currentHandler];
    [v26 handleFailureInMethod:a2, self, @"MPCItemBookmarker.m", 37, @"Invalid parameter not satisfying: %@", @"fromItem == nil || [(MPAVItem *)fromItem isKindOfClass:[MPAVItem class]]" object file lineNumber description];

    if (!v9) {
      goto LABEL_6;
    }
  }
  else if (!v9)
  {
    goto LABEL_6;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v27 = [MEMORY[0x263F08690] currentHandler];
    [v27 handleFailureInMethod:a2, self, @"MPCItemBookmarker.m", 38, @"Invalid parameter not satisfying: %@", @"toItem == nil || [(MPAVItem *)toItem isKindOfClass:[MPAVItem class]]" object file lineNumber description];
  }
LABEL_6:
  id v10 = v8;
  if (![v10 isAssetLoaded]) {
    goto LABEL_24;
  }
  objc_super v11 = [v10 asset];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v12 = [v11 URL];
    if (v12)
    {
      __int16 v13 = v12;
      [v12 isFileURL];
    }
  }
  id v14 = [v10 playerItem];
  __int16 v15 = v14;
  if (v14) {
    [v14 currentTime];
  }
  else {
    memset(&time, 0, sizeof(time));
  }
  double Seconds = CMTimeGetSeconds(&time);

  if (Seconds == 0.0)
  {
    uint64_t v17 = [v10 contentItem];
    [v17 elapsedTime];
    if (v18 <= 0.0) {
      goto LABEL_18;
    }
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0) {
      goto LABEL_18;
    }
    uint64_t v19 = [v10 loadedAudioAssetType];

    if (v19 >= 2)
    {
      uint64_t v17 = [v10 contentItem];
      [v17 elapsedTime];
      double Seconds = v20;
LABEL_18:
    }
  }
  [v10 _setCurrentPlaybackRate:0.0];
  [v10 _updateDurationSnapshotWithElapsedTime:Seconds playbackRate:0.0];
  v21 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
  if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134218498;
    v30 = self;
    __int16 v31 = 2114;
    id v32 = v10;
    __int16 v33 = 2048;
    double v34 = Seconds;
    _os_log_impl(&dword_21BB87000, v21, OS_LOG_TYPE_DEFAULT, "MPCItemBookmarker %p - Previous loaded item bookmark data updated %{public}@ - PlaybackStoppedTime:%.2fs", buf, 0x20u);
  }

  id v22 = v9;
  v23 = [v22 contentItemID];
  v24 = [v10 contentItemID];
  int v25 = [v23 isEqualToString:v24];

  if (v25) {
    [v22 _pickupContentItemFrom:v10];
  }

LABEL_24:
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_engine);

  objc_storeStrong((id *)&self->_translator, 0);
}

- (void)setEngine:(id)a3
{
}

- (MPCPlaybackEngine)engine
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_engine);

  return (MPCPlaybackEngine *)WeakRetained;
}

- (void)setTranslator:(id)a3
{
}

- (MPCMediaFoundationTranslator)translator
{
  return self->_translator;
}

- (void)updateDurationSnapshotWithTime:(double)a3 forItem:(id)a4 rate:(float)a5
{
  id v9 = a4;
  if (v9)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      id v14 = [MEMORY[0x263F08690] currentHandler];
      [v14 handleFailureInMethod:a2, self, @"MPCItemBookmarker.m", 145, @"Invalid parameter not satisfying: %@", @"item == nil || [(MPAVItem *)item isKindOfClass:[MPAVItem class]]" object file lineNumber description];
    }
  }
  id v15 = v9;
  *(float *)&double v10 = a5;
  [v15 _setCurrentPlaybackRate:v10];
  *(float *)&double v11 = a5;
  [v15 _updateDurationSnapshotWithElapsedTime:a3 playbackRate:v11];

  v12 = [(MPCItemBookmarker *)self engine];
  __int16 v13 = [v12 mediaRemotePublisher];
  [v13 publishIfNeeded];
}

- (void)playbackStateDidChangeFromState:(int64_t)a3 toState:(int64_t)a4 forItem:(id)a5 time:(double)a6 rate:(float)a7
{
  id v14 = a5;
  if (v14)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      __int16 v13 = [MEMORY[0x263F08690] currentHandler];
      [v13 handleFailureInMethod:a2, self, @"MPCItemBookmarker.m", 136, @"Invalid parameter not satisfying: %@", @"item == nil || [(MPAVItem *)item isKindOfClass:[MPAVItem class]]" object file lineNumber description];
    }
  }
  if (a3 != 1 && a4 == 1)
  {
    *(float *)&double v12 = a7;
    [v14 _setCurrentPlaybackRate:v12];
  }
}

- (void)playbackRateDidChangeToRate:(float)a3 forItem:(id)a4 time:(double)a5
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  id v8 = a4;
  if (a3 == 0.0 || a3 == 1.0)
  {
    double v11 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      int v12 = 134218498;
      __int16 v13 = self;
      __int16 v14 = 2048;
      double v15 = a3;
      __int16 v16 = 2114;
      id v17 = v8;
      _os_log_impl(&dword_21BB87000, v11, OS_LOG_TYPE_ERROR, "MPCItemBookmarker %p - Unexpected rate change to %.1f received [Should be handled by playbackDidStart/Stop] - item=%{public}@", (uint8_t *)&v12, 0x20u);
    }
  }
  else
  {
    *(float *)&double v9 = a3;
    [(MPCItemBookmarker *)self updateDurationSnapshotWithTime:v8 forItem:a5 rate:v9];
  }
}

- (void)playbackDidStopForItem:(id)a3 time:(double)a4
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    int v8 = 134218498;
    double v9 = self;
    __int16 v10 = 2114;
    id v11 = v6;
    __int16 v12 = 2048;
    double v13 = a4;
    _os_log_impl(&dword_21BB87000, v7, OS_LOG_TYPE_DEFAULT, "MPCItemBookmarker %p - playbackDidStopForItem - item=%{public}@ - time:%.2fs", (uint8_t *)&v8, 0x20u);
  }

  [(MPCItemBookmarker *)self updateDurationSnapshotWithTime:v6 forItem:a4 rate:0.0];
}

- (void)playbackDidStartForItem:(id)a3 time:(double)a4 rate:(float)a5
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v9 = a3;
  __int16 v10 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134218498;
    uint64_t v14 = self;
    __int16 v15 = 2114;
    id v16 = v9;
    __int16 v17 = 2048;
    double v18 = a4;
    _os_log_impl(&dword_21BB87000, v10, OS_LOG_TYPE_DEFAULT, "MPCItemBookmarker %p - playbackDidStartForItem - item=%{public}@ - time:%.2fs", buf, 0x20u);
  }

  if (v9)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      __int16 v12 = [MEMORY[0x263F08690] currentHandler];
      [v12 handleFailureInMethod:a2, self, @"MPCItemBookmarker.m", 118, @"Invalid parameter not satisfying: %@", @"item == nil || [(MPAVItem *)item isKindOfClass:[MPAVItem class]]" object file lineNumber description];
    }
  }
  *(float *)&double v11 = a5;
  [(MPCItemBookmarker *)self updateDurationSnapshotWithTime:v9 forItem:a4 rate:v11];
}

- (void)itemTransitionWillBeginFrom:(id)a3 to:(id)a4 type:(int64_t)a5 timeStamp:(id)a6
{
  id v16 = a3;
  id v10 = a4;
  id v11 = a6;
  __int16 v12 = v16;
  id v13 = v11;
  if (v16)
  {
    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();
    __int16 v12 = v16;
    if ((isKindOfClass & 1) == 0)
    {
      __int16 v15 = [MEMORY[0x263F08690] currentHandler];
      [v15 handleFailureInMethod:a2, self, @"MPCItemBookmarker.m", 89, @"Invalid parameter not satisfying: %@", @"fromItem == nil || [(MPAVItem *)fromItem isKindOfClass:[MPAVItem class]]" object file lineNumber description];

      __int16 v12 = v16;
    }
  }
  [v12 notePlaybackFinishedByHittingEnd];
}

- (void)itemDidPlayToEnd:(id)a3 time:(double)a4
{
  id v6 = a3;
  id v9 = v6;
  if (v6)
  {
    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();
    id v6 = v9;
    if ((isKindOfClass & 1) == 0)
    {
      int v8 = [MEMORY[0x263F08690] currentHandler];
      [v8 handleFailureInMethod:a2, self, @"MPCItemBookmarker.m", 83, @"Invalid parameter not satisfying: %@", @"item == nil || [(MPAVItem *)item isKindOfClass:[MPAVItem class]]" object file lineNumber description];

      id v6 = v9;
    }
  }
  [v6 notePlaybackFinishedByHittingEnd];
}

@end