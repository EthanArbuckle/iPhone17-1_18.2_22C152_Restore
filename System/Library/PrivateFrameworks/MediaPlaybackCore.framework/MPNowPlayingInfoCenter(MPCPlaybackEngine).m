@interface MPNowPlayingInfoCenter(MPCPlaybackEngine)
- (id)playbackEngine;
- (void)setPlaybackEngine:()MPCPlaybackEngine;
@end

@implementation MPNowPlayingInfoCenter(MPCPlaybackEngine)

- (id)playbackEngine
{
  uint64_t v1 = objc_getAssociatedObject(a1, "MPNowPlayingInfoCenter_MPCPlaybackEngine");
  v2 = (void *)v1;
  if (v1)
  {
    v3 = (*(void (**)(uint64_t))(v1 + 16))(v1);
  }
  else
  {
    v3 = 0;
  }

  return v3;
}

- (void)setPlaybackEngine:()MPCPlaybackEngine
{
  id v4 = a3;
  objc_initWeak(&location, v4);
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __63__MPNowPlayingInfoCenter_MPCPlaybackEngine__setPlaybackEngine___block_invoke;
  v6[3] = &unk_2643C45F8;
  objc_copyWeak(&v7, &location);
  v5 = _Block_copy(v6);
  objc_setAssociatedObject(a1, "MPNowPlayingInfoCenter_MPCPlaybackEngine", v5, (void *)3);

  objc_destroyWeak(&v7);
  objc_destroyWeak(&location);
}

@end