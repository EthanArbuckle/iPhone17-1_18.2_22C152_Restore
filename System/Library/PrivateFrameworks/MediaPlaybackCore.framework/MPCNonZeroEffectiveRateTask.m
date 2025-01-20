@interface MPCNonZeroEffectiveRateTask
- (AVPlayerItem)playerItem;
- (MPCNonZeroEffectiveRateTask)initWithPlayerItem:(id)a3 identifier:(id)a4 timeout:(double)a5 queue:(id)a6 block:(id)a7;
- (void)effectiveRateDidChange:(id)a3;
- (void)setPlayerItem:(id)a3;
- (void)taskDidExecute;
@end

@implementation MPCNonZeroEffectiveRateTask

- (void).cxx_destruct
{
}

- (void)setPlayerItem:(id)a3
{
}

- (AVPlayerItem)playerItem
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_playerItem);

  return (AVPlayerItem *)WeakRetained;
}

- (void)taskDidExecute
{
  v4.receiver = self;
  v4.super_class = (Class)MPCNonZeroEffectiveRateTask;
  [(MPCDeferrableTask *)&v4 taskDidExecute];
  v3 = [MEMORY[0x263F08A00] defaultCenter];
  [v3 removeObserver:self name:*MEMORY[0x263F010F8] object:0];
}

- (void)effectiveRateDidChange:(id)a3
{
  id v4 = a3;
  v5 = [(MPCNonZeroEffectiveRateTask *)self playerItem];
  id v6 = (id)[v5 timebase];

  id v11 = [v4 object];

  v7 = v11;
  if (v11 == v6
    && (Float64 EffectiveRate = CMTimebaseGetEffectiveRate((CMTimebaseRef)v6), v7 = v11, EffectiveRate > 0.00000011920929))
  {
    v9 = [(MPCDeferrableTask *)self guard];
    int v10 = [v9 disarm];

    if (v10)
    {
      [(MPCDeferrableTask *)self execute:0];
    }
  }
  else
  {
  }
}

- (MPCNonZeroEffectiveRateTask)initWithPlayerItem:(id)a3 identifier:(id)a4 timeout:(double)a5 queue:(id)a6 block:(id)a7
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  id v12 = a3;
  v20.receiver = self;
  v20.super_class = (Class)MPCNonZeroEffectiveRateTask;
  v13 = [(MPCDeferrableTask *)&v20 initWithIdentifier:a4 timeout:a6 queue:a7 block:a5];
  v14 = v13;
  if (v13)
  {
    [(MPCNonZeroEffectiveRateTask *)v13 setPlayerItem:v12];
    if (CMTimebaseGetEffectiveRate((CMTimebaseRef)[v12 timebase]) <= 0.00000011920929)
    {
      v17 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543362;
        v22 = v14;
        _os_log_impl(&dword_21BB87000, v17, OS_LOG_TYPE_DEFAULT, "%{public}@ Started waiting for a EffectiveRateChanged notification", buf, 0xCu);
      }

      v18 = [MEMORY[0x263F08A00] defaultCenter];
      [v18 addObserver:v14 selector:sel_effectiveRateDidChange_ name:*MEMORY[0x263F010F8] object:0];
    }
    else
    {
      v15 = [(MPCDeferrableTask *)v14 guard];
      int v16 = [v15 disarm];

      if (v16) {
        [(MPCDeferrableTask *)v14 execute:0];
      }
    }
  }

  return v14;
}

@end