@interface MPCSleepTimerEngineObserver
- (MPCSleepTimerEngineObserver)initWithDelegate:(id)a3;
- (MPCSleepTimerEngineObserverDelegate)delegate;
- (void)engine:(id)a3 didChangeItemElapsedTime:(double)a4 rate:(float)a5;
- (void)engine:(id)a3 didEndPlaybackOfItem:(id)a4;
- (void)setDelegate:(id)a3;
@end

@implementation MPCSleepTimerEngineObserver

- (MPCSleepTimerEngineObserver)initWithDelegate:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)MPCSleepTimerEngineObserver;
  v5 = [(MPCSleepTimerEngineObserver *)&v8 init];
  v6 = v5;
  if (v5) {
    [(MPCSleepTimerEngineObserver *)v5 setDelegate:v4];
  }

  return v6;
}

- (void)setDelegate:(id)a3
{
}

- (void).cxx_destruct
{
}

- (MPCSleepTimerEngineObserverDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (MPCSleepTimerEngineObserverDelegate *)WeakRetained;
}

- (void)engine:(id)a3 didChangeItemElapsedTime:(double)a4 rate:(float)a5
{
  id v6 = [(MPCSleepTimerEngineObserver *)self delegate];
  if (objc_opt_respondsToSelector()) {
    [v6 didChangeItemElapsedTime:a4];
  }
}

- (void)engine:(id)a3 didEndPlaybackOfItem:(id)a4
{
  id v4 = [(MPCSleepTimerEngineObserver *)self delegate];
  if (objc_opt_respondsToSelector()) {
    [v4 didEndPlaybackForCurrentItem];
  }
}

@end