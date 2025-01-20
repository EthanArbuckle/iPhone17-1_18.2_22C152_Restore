@interface VOTTVGestureRepeater
- (SCRCTargetSelectorTimer)repeaterTimer;
- (SCRCThread)targetThread;
- (VOTTVGestureRepeater)initWithThread:(id)a3;
- (VOTTVGestureRepeaterDelegate)delegate;
- (double)_delayForCurrentRepeatCount;
- (id)selectButtonReceivedNotificationObserverToken;
- (int64_t)_currentGestureRepeaterEvent;
- (int64_t)_repeatStateForEvent:(id)a3;
- (void)_handleRepeaterTimerDidFire:(id)a3;
- (void)dealloc;
- (void)setDelegate:(id)a3;
- (void)setRepeaterTimer:(id)a3;
- (void)setSelectButtonReceivedNotificationObserverToken:(id)a3;
- (void)setTargetThread:(id)a3;
- (void)updateWithEvent:(id)a3;
@end

@implementation VOTTVGestureRepeater

- (VOTTVGestureRepeater)initWithThread:(id)a3
{
  id v4 = a3;
  v17.receiver = self;
  v17.super_class = (Class)VOTTVGestureRepeater;
  v5 = [(VOTTVGestureRepeater *)&v17 init];
  v6 = v5;
  if (v5)
  {
    [(VOTTVGestureRepeater *)v5 setTargetThread:v4];
    v6->_currentRepeatState = 4;
    id v7 = objc_allocWithZone((Class)SCRCTargetSelectorTimer);
    v8 = [(VOTTVGestureRepeater *)v6 targetThread];
    id v9 = [v7 initWithTarget:v6 selector:"_handleRepeaterTimerDidFire:" thread:v8];

    [(VOTTVGestureRepeater *)v6 setRepeaterTimer:v9];
    v10 = +[NSNotificationCenter defaultCenter];
    v11 = +[NSOperationQueue mainQueue];
    v15[0] = _NSConcreteStackBlock;
    v15[1] = 3221225472;
    v15[2] = sub_100058074;
    v15[3] = &unk_1001B33E0;
    v12 = v6;
    v16 = v12;
    v13 = [v10 addObserverForName:@"VOTEventFactoryDidReceiveSelectButtonUpEvent" object:0 queue:v11 usingBlock:v15];
    [(VOTTVGestureRepeater *)v12 setSelectButtonReceivedNotificationObserverToken:v13];
  }
  return v6;
}

- (void)dealloc
{
  [(VOTTVGestureRepeater *)self setDelegate:0];
  [(VOTTVGestureRepeater *)self setTargetThread:0];
  v3 = [(VOTTVGestureRepeater *)self repeaterTimer];
  [v3 invalidate];

  [(VOTTVGestureRepeater *)self setRepeaterTimer:0];
  id v4 = +[NSNotificationCenter defaultCenter];
  v5 = [(VOTTVGestureRepeater *)self selectButtonReceivedNotificationObserverToken];
  [v4 removeObserver:v5];

  [(VOTTVGestureRepeater *)self setSelectButtonReceivedNotificationObserverToken:0];
  v6.receiver = self;
  v6.super_class = (Class)VOTTVGestureRepeater;
  [(VOTTVGestureRepeater *)&v6 dealloc];
}

- (void)updateWithEvent:(id)a3
{
  id v17 = a3;
  id v4 = [v17 command];
  unsigned int v5 = [v4 isEqualToString:kVOTEventCommandIdle];

  if (v5)
  {
    objc_super v6 = [(VOTTVGestureRepeater *)self repeaterTimer];
    [v6 cancel];

    *(_OWORD *)&self->_int64_t currentRepeatState = xmmword_10016E6D0;
    self->_isSendingFirstRepeatEvent = 1;
LABEL_7:
    v11 = v17;
    goto LABEL_8;
  }
  id v7 = [v17 command];
  unsigned int v8 = [v7 isEqualToString:kVOTEventCommandTracking];

  if (!v8)
  {
    _AXLogWithFacility();
    goto LABEL_7;
  }
  unint64_t v9 = [(VOTTVGestureRepeater *)self _repeatStateForEvent:v17];
  if (v9 == 5)
  {
    v10 = [(VOTTVGestureRepeater *)self repeaterTimer];
    [v10 cancel];

    *(_OWORD *)&self->_int64_t currentRepeatState = xmmword_10016E6C0;
    goto LABEL_7;
  }
  int64_t v12 = v9;
  BOOL v13 = v9 > 3;
  v11 = v17;
  if (!v13)
  {
    int64_t currentRepeatState = self->_currentRepeatState;
    if (currentRepeatState == 4)
    {
      self->_int64_t currentRepeatState = v12;
    }
    else if (currentRepeatState != v12)
    {
      v15 = [(VOTTVGestureRepeater *)self repeaterTimer];
      [v15 cancel];

      self->_int64_t currentRepeatState = v12;
      self->_currentRepeatCount = 0;
      v16 = [(VOTTVGestureRepeater *)self repeaterTimer];
      [v16 dispatchAfterDelay:0.5];

      goto LABEL_7;
    }
  }
LABEL_8:
}

- (void)_handleRepeaterTimerDidFire:(id)a3
{
  if (self->_isSendingFirstRepeatEvent)
  {
    id v4 = [(VOTTVGestureRepeater *)self delegate];
    [v4 gestureRepeaterWillSendFirstRepeaterEvent:self];

    self->_isSendingFirstRepeatEvent = 0;
  }
  unsigned int v5 = [(VOTTVGestureRepeater *)self delegate];
  objc_msgSend(v5, "gestureRepeater:repeaterEventDidFire:", self, -[VOTTVGestureRepeater _currentGestureRepeaterEvent](self, "_currentGestureRepeaterEvent"));

  objc_super v6 = [(VOTTVGestureRepeater *)self repeaterTimer];
  [(VOTTVGestureRepeater *)self _delayForCurrentRepeatCount];
  objc_msgSend(v6, "dispatchAfterDelay:");

  ++self->_currentRepeatCount;
}

- (double)_delayForCurrentRepeatCount
{
  return 0.4;
}

- (int64_t)_currentGestureRepeaterEvent
{
  unint64_t v2 = self->_currentRepeatState - 1;
  if (v2 > 4) {
    return 1;
  }
  else {
    return qword_10016E6E0[v2];
  }
}

- (int64_t)_repeatStateForEvent:(id)a3
{
  id v3 = a3;
  [v3 touchRawLocation];
  if (sqrt((v5 + -0.5) * (v5 + -0.5) + (v4 + -0.5) * (v4 + -0.5)) >= 0.34)
  {
    id v7 = [v3 tvTouchPadRegion];
    if ((unint64_t)v7 >= 4) {
      int64_t v6 = 4;
    }
    else {
      int64_t v6 = (int64_t)v7;
    }
  }
  else
  {
    int64_t v6 = 5;
  }

  return v6;
}

- (VOTTVGestureRepeaterDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (VOTTVGestureRepeaterDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (SCRCThread)targetThread
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_targetThread);

  return (SCRCThread *)WeakRetained;
}

- (void)setTargetThread:(id)a3
{
}

- (SCRCTargetSelectorTimer)repeaterTimer
{
  return self->_repeaterTimer;
}

- (void)setRepeaterTimer:(id)a3
{
}

- (id)selectButtonReceivedNotificationObserverToken
{
  return self->_selectButtonReceivedNotificationObserverToken;
}

- (void)setSelectButtonReceivedNotificationObserverToken:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_selectButtonReceivedNotificationObserverToken, 0);
  objc_storeStrong((id *)&self->_repeaterTimer, 0);
  objc_destroyWeak((id *)&self->_targetThread);

  objc_destroyWeak((id *)&self->_delegate);
}

@end