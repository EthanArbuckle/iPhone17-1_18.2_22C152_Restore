@interface MPCPlaybackEngineEventStreamSubscription
@end

@implementation MPCPlaybackEngineEventStreamSubscription

void __54___MPCPlaybackEngineEventStreamSubscription_processID__block_invoke()
{
  if (+[MPCPlaybackEngine isSystemMusic])
  {
    v0 = @"mus";
  }
  else if (+[MPCPlaybackEngine isSystemPodcasts])
  {
    v0 = @"pod";
  }
  else
  {
    BOOL v1 = +[MPCPlaybackEngine isRemotePlayerService];
    v0 = @"oth";
    if (v1) {
      v0 = @"rps";
    }
  }
  v2 = (void *)processID_processID;
  processID_processID = (uint64_t)v0;
}

uint64_t __71___MPCPlaybackEngineEventStreamSubscription_flushEventsWithCompletion___block_invoke(uint64_t a1)
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  objc_msgSend(*(id *)(a1 + 32), "_onQueue_flush");
  v2 = os_log_create("com.apple.amp.mediaplaybackcore", "PlaybackEventStream");
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
  {
    v3 = [*(id *)(a1 + 40) engineID];
    v4 = [(id)objc_opt_class() identifier];
    uint64_t v5 = *(void *)(a1 + 48);
    int v7 = 138543874;
    v8 = v3;
    __int16 v9 = 2114;
    v10 = v4;
    __int16 v11 = 2048;
    uint64_t v12 = v5;
    _os_log_impl(&dword_21BB87000, v2, OS_LOG_TYPE_DEBUG, "[EVS:%{public}@:%{public}@:%p] flushEventsWithCompletion:… | flushed events", (uint8_t *)&v7, 0x20u);
  }
  return (*(uint64_t (**)(void))(*(void *)(a1 + 56) + 16))();
}

@end