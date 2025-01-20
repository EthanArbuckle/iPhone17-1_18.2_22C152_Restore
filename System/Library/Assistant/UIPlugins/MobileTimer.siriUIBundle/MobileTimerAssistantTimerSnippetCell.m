@interface MobileTimerAssistantTimerSnippetCell
- (BOOL)isDeviceTimer;
- (BOOL)isStale;
- (MTTimer)currentTimer;
- (MTTimerManager)timerManager;
- (MobileTimerAssistantTimerSnippetCell)initWithFrame:(CGRect)a3;
- (SATimerObject)timer;
- (id)reuseIdentifier;
- (void)dealloc;
- (void)didMoveToSuperview;
- (void)handleTimerStateChanged;
- (void)layoutSubviews;
- (void)markStale;
- (void)reloadTimerState;
- (void)setCurrentTimer:(id)a3;
- (void)setTimer:(id)a3;
- (void)setTimerManager:(id)a3;
- (void)updateDisplay;
@end

@implementation MobileTimerAssistantTimerSnippetCell

- (MobileTimerAssistantTimerSnippetCell)initWithFrame:(CGRect)a3
{
  v13.receiver = self;
  v13.super_class = (Class)MobileTimerAssistantTimerSnippetCell;
  v3 = -[MobileTimerAssistantTimerSnippetCell initWithFrame:](&v13, "initWithFrame:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    [(MobileTimerAssistantTimerSnippetCell *)v3 setKeylineType:0];
    v5 = [TimerSnippetTimeView alloc];
    [(MobileTimerAssistantTimerSnippetCell *)v4 bounds];
    v6 = -[TimerSnippetTimeView initWithFrame:](v5, "initWithFrame:");
    timeView = v4->_timeView;
    v4->_timeView = v6;

    [(MobileTimerAssistantTimerSnippetCell *)v4 addSubview:v4->_timeView];
    v8 = (MTTimerManager *)objc_alloc_init((Class)MTTimerManager);
    timerManager = v4->_timerManager;
    v4->_timerManager = v8;

    v10 = +[NSNotificationCenter defaultCenter];
    [v10 addObserver:v4 selector:"handleTimerStateChanged" name:MTTimerManagerFiringTimerChanged object:v4->_timerManager];
    [v10 addObserver:v4 selector:"handleTimerStateChanged" name:MTTimerManagerTimersChanged object:v4->_timerManager];
    v11 = v4;
  }
  return v4;
}

- (void)dealloc
{
  v3 = +[NSNotificationCenter defaultCenter];
  [v3 removeObserver:self];

  v4.receiver = self;
  v4.super_class = (Class)MobileTimerAssistantTimerSnippetCell;
  [(MobileTimerAssistantTimerSnippetCell *)&v4 dealloc];
}

- (void)layoutSubviews
{
  v4.receiver = self;
  v4.super_class = (Class)MobileTimerAssistantTimerSnippetCell;
  [(MobileTimerAssistantTimerSnippetCell *)&v4 layoutSubviews];
  timeView = self->_timeView;
  [(MobileTimerAssistantTimerSnippetCell *)self bounds];
  -[TimerSnippetTimeView setFrame:](timeView, "setFrame:");
}

- (id)reuseIdentifier
{
  return @"TmSn";
}

- (void)reloadTimerState
{
  if (!self->_stale)
  {
    v3 = [(MTTimerManager *)self->_timerManager currentTimer];
    v5[0] = _NSConcreteStackBlock;
    v5[1] = 3221225472;
    v5[2] = sub_8C24;
    v5[3] = &unk_106C8;
    v5[4] = self;
    id v4 = [v3 addCompletionBlock:v5];
  }
}

- (void)setTimer:(id)a3
{
  v5 = (SATimerObject *)a3;
  p_timer = &self->_timer;
  if (self->_timer != v5)
  {
    v11 = v5;
    objc_storeStrong((id *)&self->_timer, a3);
    v7 = [(SATimerObject *)*p_timer state];
    unsigned int v8 = [v7 isEqualToString:SATimerStateUndefinedValue];

    if (v8)
    {
      self->_deviceTimer = 0;
      timeView = self->_timeView;
      v10 = [(SATimerObject *)*p_timer timerValue];
      -[TimerSnippetTimeView setRemainingTime:](timeView, "setRemainingTime:", (double)(int)[v10 intValue]);
    }
    else
    {
      self->_deviceTimer = 1;
      [(MobileTimerAssistantTimerSnippetCell *)self reloadTimerState];
    }
    [(MobileTimerAssistantTimerSnippetCell *)self setNeedsLayout];
    v5 = v11;
  }
}

- (void)updateDisplay
{
  if ([(TimerSnippetTimeView *)self->_timeView updateDisplayWithTime:CFAbsoluteTimeGetCurrent()])
  {
    [(CADisplayLink *)self->_displayLink invalidate];
    displayLink = self->_displayLink;
    self->_displayLink = 0;
  }
}

- (BOOL)isDeviceTimer
{
  return self->_deviceTimer;
}

- (BOOL)isStale
{
  return self->_stale;
}

- (void)markStale
{
  if (!self->_stale)
  {
    self->_stale = 1;
    v3 = [(SATimerObject *)self->_timer state];
    unsigned __int8 v4 = [v3 isEqualToString:SATimerStateUndefinedValue];

    if ((v4 & 1) == 0)
    {
      [(TimerSnippetTimeView *)self->_timeView markStaleWithTime:CFAbsoluteTimeGetCurrent()];
      [(CADisplayLink *)self->_displayLink invalidate];
      displayLink = self->_displayLink;
      self->_displayLink = 0;
    }
  }
}

- (void)handleTimerStateChanged
{
  if (!self->_stale)
  {
    timer = self->_timer;
    self->_timer = 0;

    [(MobileTimerAssistantTimerSnippetCell *)self reloadTimerState];
    [(MobileTimerAssistantTimerSnippetCell *)self setNeedsLayout];
  }
}

- (void)didMoveToSuperview
{
  v3 = [(MobileTimerAssistantTimerSnippetCell *)self superview];

  if (!v3)
  {
    [(CADisplayLink *)self->_displayLink invalidate];
    displayLink = self->_displayLink;
    self->_displayLink = 0;
  }
}

- (SATimerObject)timer
{
  return self->_timer;
}

- (MTTimerManager)timerManager
{
  return self->_timerManager;
}

- (void)setTimerManager:(id)a3
{
}

- (MTTimer)currentTimer
{
  return self->_currentTimer;
}

- (void)setCurrentTimer:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_currentTimer, 0);
  objc_storeStrong((id *)&self->_timerManager, 0);
  objc_storeStrong((id *)&self->_timeView, 0);
  objc_storeStrong((id *)&self->_displayLink, 0);

  objc_storeStrong((id *)&self->_timer, 0);
}

@end