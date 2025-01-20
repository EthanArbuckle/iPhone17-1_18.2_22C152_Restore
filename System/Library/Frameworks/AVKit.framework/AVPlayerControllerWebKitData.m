@interface AVPlayerControllerWebKitData
- (AVPlayerControllerWebKitData)initWithPlayerController:(id)a3;
- (AVPlayerControllerWebKitDelegate)delegate;
- (BOOL)isScrubbing;
- (double)seekToTime;
- (void)setDelegate:(id)a3;
- (void)setScrubbing:(BOOL)a3;
- (void)setSeekToTime:(double)a3;
@end

@implementation AVPlayerControllerWebKitData

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);

  objc_destroyWeak((id *)&self->_playerController);
}

- (double)seekToTime
{
  return self->_seekToTime;
}

- (BOOL)isScrubbing
{
  return self->_scrubbing;
}

- (void)setDelegate:(id)a3
{
}

- (AVPlayerControllerWebKitDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (AVPlayerControllerWebKitDelegate *)WeakRetained;
}

- (void)setSeekToTime:(double)a3
{
  if (self->_seekToTime != a3)
  {
    self->_seekToTime = a3;
    id v6 = [(AVPlayerControllerWebKitData *)self delegate];
    if (objc_opt_respondsToSelector())
    {
      id WeakRetained = objc_loadWeakRetained((id *)&self->_playerController);
      [v6 webkitPlayerController:WeakRetained didUpdateSeekToTime:a3];
    }
  }
}

- (void)setScrubbing:(BOOL)a3
{
  if (self->_scrubbing != a3)
  {
    BOOL v3 = a3;
    self->_scrubbing = a3;
    id v6 = [(AVPlayerControllerWebKitData *)self delegate];
    if (objc_opt_respondsToSelector())
    {
      id WeakRetained = objc_loadWeakRetained((id *)&self->_playerController);
      [v6 webkitPlayerController:WeakRetained didChangeScrubbingStateTo:v3];
    }
  }
}

- (AVPlayerControllerWebKitData)initWithPlayerController:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)AVPlayerControllerWebKitData;
  v5 = [(AVPlayerControllerWebKitData *)&v8 init];
  id v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->_playerController, v4);
    v6->_scrubbing = 0;
    v6->_seekToTime = NAN;
    objc_storeWeak((id *)&v6->_delegate, 0);
  }

  return v6;
}

@end