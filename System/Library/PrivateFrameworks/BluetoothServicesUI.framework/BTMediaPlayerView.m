@interface BTMediaPlayerView
+ (Class)layerClass;
- (void)startMovieLoopWithPath:(id)a3;
- (void)startMovieLoopWithPath:(id)a3 assetType:(int)a4 adjustmentsURL:(id)a5;
- (void)stop;
@end

@implementation BTMediaPlayerView

+ (Class)layerClass
{
  return (Class)MEMORY[0x270F9A6F8](MEMORY[0x263EFA838], a2);
}

- (void)startMovieLoopWithPath:(id)a3
{
  id v11 = a3;
  v4 = self->_avPlayer;
  if (!v4)
  {
    v5 = [MEMORY[0x263EF93E0] sharedInstance];
    [v5 setCategory:*MEMORY[0x263EF9048] withOptions:1 error:0];

    v4 = (AVQueuePlayer *)objc_alloc_init(MEMORY[0x263EFA860]);
    [(AVQueuePlayer *)v4 setAllowsExternalPlayback:0];
    [(AVQueuePlayer *)v4 setPreventsDisplaySleepDuringVideoPlayback:0];
    [(AVQueuePlayer *)v4 _setDisallowsAutoPauseOnRouteRemovalIfNoAudio:1];
    objc_storeStrong((id *)&self->_avPlayer, v4);
    v6 = [(BTMediaPlayerView *)self layer];
    [v6 setPlayer:v4];
  }
  v7 = [NSURL fileURLWithPath:v11 isDirectory:0];
  v8 = [MEMORY[0x263EFA800] playerItemWithURL:v7];
  v9 = [MEMORY[0x263EFA840] playerLooperWithPlayer:v4 templateItem:v8];
  avLooper = self->_avLooper;
  self->_avLooper = v9;

  [(AVQueuePlayer *)self->_avPlayer play];
}

- (void)startMovieLoopWithPath:(id)a3 assetType:(int)a4 adjustmentsURL:(id)a5
{
  id v8 = a3;
  v9 = [NSDictionary dictionaryWithContentsOfURL:a5 error:0];
  if (v9)
  {
    if (a4 == 1 || a4 == 2)
    {
      CFDictionaryGetTypeID();
      v10 = CFDictionaryGetTypedValue();
    }
    else
    {
      v10 = 0;
    }
    int v31 = 0;
    CFDictionaryGetDouble();
    float v12 = v11;
    id v13 = objc_alloc(MEMORY[0x263F157C8]);
    v14 = (void *)[v13 initWithType:*MEMORY[0x263F15B40]];
    float v23 = v12;
    long long v24 = *(_OWORD *)(MEMORY[0x263F15720] + 4);
    int v25 = *(_DWORD *)(MEMORY[0x263F15720] + 20);
    float v26 = v12;
    long long v27 = *(_OWORD *)(MEMORY[0x263F15720] + 28);
    int v28 = *(_DWORD *)(MEMORY[0x263F15720] + 44);
    float v29 = v12;
    *(_OWORD *)v30 = *(_OWORD *)(MEMORY[0x263F15720] + 52);
    *(_OWORD *)&v30[12] = *(_OWORD *)(MEMORY[0x263F15720] + 64);
    v15 = [MEMORY[0x263F08D40] valueWithCAColorMatrix:&v23];
    [v14 setValue:v15 forKey:@"inputColorMatrix"];

    id v16 = objc_alloc_init(MEMORY[0x263EFF980]);
    [v16 addObject:v14];

    CFDictionaryGetDouble();
    if (!v31)
    {
      double v18 = v17;
      id v19 = objc_alloc(MEMORY[0x263F157C8]);
      v20 = (void *)[v19 initWithType:*MEMORY[0x263F15AE0]];
      v21 = [NSNumber numberWithDouble:v18];
      [v20 setValue:v21 forKey:@"inputAmount"];

      if (!v16) {
        id v16 = objc_alloc_init(MEMORY[0x263EFF980]);
      }
      [v16 addObject:v20];
    }
    if ([v16 count])
    {
      v22 = [(BTMediaPlayerView *)self layer];
      [v22 setFilters:v16];
    }
  }
  [(BTMediaPlayerView *)self startMovieLoopWithPath:v8];
}

- (void)stop
{
  [(AVQueuePlayer *)self->_avPlayer pause];
  v3 = [(BTMediaPlayerView *)self layer];
  [v3 setPlayer:0];

  [(AVQueuePlayer *)self->_avPlayer removeAllItems];
  avPlayer = self->_avPlayer;
  self->_avPlayer = 0;

  avLooper = self->_avLooper;
  self->_avLooper = 0;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_avPlayer, 0);
  objc_storeStrong((id *)&self->_avLooper, 0);
}

@end