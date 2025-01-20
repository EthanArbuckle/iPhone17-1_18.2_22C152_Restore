@interface SCATInputSource
- (AXAccessQueue)queue;
- (AXDispatchTimer)longPressTimer;
- (BOOL)inputHoldEnabled;
- (BOOL)isRunning;
- (BOOL)longPressEnabled;
- (NSDictionary)actions;
- (SCATInputSource)init;
- (SCATInputSourceDelegate)delegate;
- (double)buttonDownStartTime;
- (double)inputHoldDuration;
- (double)longPressDuration;
- (double)totalLongPressDuration;
- (id)_interDeviceActionForIdentifier:(id)a3;
- (id)_switchEventWithAction:(id)a3 longPressAction:(id)a4 start:(BOOL)a5 switchIdentifier:(id)a6 switchDisplayName:(id)a7;
- (id)fallbackActionBlock;
- (int64_t)_identifierForInterDeviceAction:(id)a3;
- (int64_t)longPressActionIdentifier;
- (void)_clearActions;
- (void)_handleAction:(id)a3 longPressAction:(id)a4 start:(BOOL)a5 switchIdentifier:(id)a6 switchDisplayName:(id)a7;
- (void)_handleInterDeviceBailOut;
- (void)beginSimulatedLongPressForInputSource:(id)a3;
- (void)endSimulatedLongPressForInputSource:(id)a3;
- (void)setActions:(id)a3;
- (void)setButtonDownStartTime:(double)a3;
- (void)setDelegate:(id)a3;
- (void)setDelegate:(id)a3 queue:(id)a4;
- (void)setFallbackActionBlock:(id)a3;
- (void)setLongPressActionIdentifier:(int64_t)a3;
- (void)setLongPressTimer:(id)a3;
- (void)setQueue:(id)a3;
- (void)setRunning:(BOOL)a3;
- (void)updateWithSwitches:(id)a3 recipe:(id)a4;
@end

@implementation SCATInputSource

- (SCATInputSource)init
{
  v8.receiver = self;
  v8.super_class = (Class)SCATInputSource;
  v2 = [(SCATInputSource *)&v8 init];
  v3 = v2;
  if (v2)
  {
    [(SCATInputSource *)v2 setLongPressActionIdentifier:0];
    [(SCATInputSource *)v3 setButtonDownStartTime:-9.22337204e18];
    id v4 = [objc_alloc((Class)AXDispatchTimer) initWithTargetSerialQueue:&_dispatch_main_q];
    [(SCATInputSource *)v3 setLongPressTimer:v4];
    v5 = [(SCATInputSource *)v3 longPressTimer];
    [v5 setAutomaticallyCancelPendingBlockUponSchedulingNewBlock:1];

    v6 = [(SCATInputSource *)v3 longPressTimer];
    [v6 setLabel:@"input long press timer"];
  }
  return v3;
}

- (void)setDelegate:(id)a3 queue:(id)a4
{
  id v8 = a3;
  id v6 = a4;
  if (v6)
  {
    id v7 = +[AXAccessQueue mainAccessQueue];

    if (v7 != v6) {
      _AXAssert();
    }
  }
  [(SCATInputSource *)self setDelegate:v8];
  [(SCATInputSource *)self setQueue:v6];
}

- (void)_clearActions
{
  v3 = [(SCATInputSource *)self actions];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if (isKindOfClass)
  {
    v5 = [(SCATInputSource *)self actions];
    [v5 removeAllObjects];
  }
  [(SCATInputSource *)self setActions:0];
  [(SCATInputSource *)self setLongPressActionIdentifier:0];

  [(SCATInputSource *)self setFallbackActionBlock:0];
}

- (BOOL)longPressEnabled
{
  v2 = +[AXSettings sharedInstance];
  unsigned __int8 v3 = [v2 assistiveTouchLongPressEnabled];

  return v3;
}

- (double)longPressDuration
{
  v2 = +[AXSettings sharedInstance];
  [v2 assistiveTouchLongPressDuration];
  double v4 = v3;

  return v4;
}

- (BOOL)inputHoldEnabled
{
  v2 = +[AXSettings sharedInstance];
  unsigned __int8 v3 = [v2 assistiveTouchInputHoldEnabled];

  return v3;
}

- (double)inputHoldDuration
{
  v2 = +[AXSettings sharedInstance];
  [v2 assistiveTouchInputHoldDuration];
  double v4 = v3;

  return v4;
}

- (double)totalLongPressDuration
{
  double v3 = 0.0;
  if ([(SCATInputSource *)self inputHoldEnabled])
  {
    [(SCATInputSource *)self inputHoldDuration];
    double v3 = v4;
  }
  [(SCATInputSource *)self longPressDuration];
  return v3 + v5;
}

- (id)_interDeviceActionForIdentifier:(id)a3
{
  id v3 = a3;
  uint64_t v4 = (uint64_t)[v3 action];
  double v5 = 0;
  if (v4 <= 199)
  {
    switch(v4)
    {
      case 'd':
        id v6 = (id *)&AXSSSwitchActionActivate;
        goto LABEL_38;
      case 'e':
        id v6 = (id *)&AXSSSwitchActionMenu;
        goto LABEL_38;
      case 'f':
        id v6 = (id *)&AXSSSwitchActionRun;
        goto LABEL_38;
      case 'g':
        id v6 = (id *)&AXSSSwitchActionSelect;
        goto LABEL_38;
      case 'h':
        id v6 = (id *)&AXSSSwitchActionMoveToNextItem;
        goto LABEL_38;
      case 'i':
        id v6 = (id *)&AXSSSwitchActionMoveToPreviousItem;
        goto LABEL_38;
      case 'j':
        id v6 = (id *)&AXSSSwitchActionStop;
        goto LABEL_38;
      case 'k':
        id v6 = (id *)&AXSSSwitchActionSiriShortcutsMenu;
LABEL_38:
        double v5 = (__CFString *)*v6;
        break;
      case 'l':
LABEL_28:
        _AXLogWithFacility();
        goto LABEL_29;
      case 'm':
        double v5 = @"selectandresumeautoscanning";
        break;
      default:
        if (v4) {
          break;
        }
        id v8 = +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", [v3 action]);
        _AXLogWithFacility();

LABEL_29:
        double v5 = 0;
        break;
    }
  }
  else
  {
    switch(v4)
    {
      case 200:
        id v6 = (id *)&AXSSSwitchActionAppSwitcher;
        goto LABEL_38;
      case 201:
        id v6 = (id *)&AXSSSwitchActionHome;
        goto LABEL_38;
      case 202:
        id v6 = (id *)&AXSSSwitchActionNotificationCenter;
        goto LABEL_38;
      case 203:
        id v6 = (id *)&AXSSSwitchActionSiri;
        goto LABEL_38;
      case 204:
        id v6 = (id *)&AXSSSwitchActionVolumeDown;
        goto LABEL_38;
      case 205:
        id v6 = (id *)&AXSSSwitchActionVolumeUp;
        goto LABEL_38;
      case 206:
        id v6 = (id *)&AXSSSwitchActionForceTouch;
        goto LABEL_38;
      case 207:
        id v6 = (id *)&AXSSSwitchActionDictation;
        goto LABEL_38;
      case 208:
        id v6 = (id *)&AXSSSwitchActionTripleClick;
        goto LABEL_38;
      case 209:
        id v6 = (id *)&AXSSSwitchActionControlCenter;
        goto LABEL_38;
      default:
        switch(v4)
        {
          case 300:
            id v6 = (id *)&AXSSSwitchActionATVSelect;
            goto LABEL_38;
          case 301:
            id v6 = (id *)&AXSSSwitchActionATVMenu;
            goto LABEL_38;
          case 302:
            id v6 = (id *)&AXSSSwitchActionATVHome;
            goto LABEL_38;
          case 303:
            id v6 = (id *)&AXSSSwitchActionATVPlayPause;
            goto LABEL_38;
          case 304:
            id v6 = (id *)&AXSSSwitchActionATVArrowUp;
            goto LABEL_38;
          case 305:
            id v6 = (id *)&AXSSSwitchActionATVArrowDown;
            goto LABEL_38;
          case 306:
            id v6 = (id *)&AXSSSwitchActionATVArrowLeft;
            goto LABEL_38;
          case 307:
            id v6 = (id *)&AXSSSwitchActionATVArrowRight;
            goto LABEL_38;
          default:
            if (v4 == 400) {
              goto LABEL_28;
            }
            break;
        }
        break;
    }
  }

  return v5;
}

- (int64_t)_identifierForInterDeviceAction:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:AXSSSwitchActionRun])
  {
    int64_t v4 = 102;
  }
  else if ([v3 isEqualToString:AXSSSwitchActionStop])
  {
    int64_t v4 = 106;
  }
  else if ([v3 isEqualToString:AXSSSwitchActionSelect])
  {
    int64_t v4 = 103;
  }
  else if ([v3 isEqualToString:@"selectandresumeautoscanning"])
  {
    int64_t v4 = 109;
  }
  else if ([v3 isEqualToString:AXSSSwitchActionMoveToNextItem])
  {
    int64_t v4 = 104;
  }
  else if ([v3 isEqualToString:AXSSSwitchActionMoveToPreviousItem])
  {
    int64_t v4 = 105;
  }
  else if ([v3 isEqualToString:AXSSSwitchActionActivate])
  {
    int64_t v4 = 100;
  }
  else if ([v3 isEqualToString:AXSSSwitchActionMenu])
  {
    int64_t v4 = 101;
  }
  else if ([v3 isEqualToString:AXSSSwitchActionAppSwitcher])
  {
    int64_t v4 = 200;
  }
  else if ([v3 isEqualToString:AXSSSwitchActionHome])
  {
    int64_t v4 = 201;
  }
  else if ([v3 isEqualToString:AXSSSwitchActionSiri])
  {
    int64_t v4 = 203;
  }
  else if ([v3 isEqualToString:AXSSSwitchActionVolumeDown])
  {
    int64_t v4 = 204;
  }
  else if ([v3 isEqualToString:AXSSSwitchActionVolumeUp])
  {
    int64_t v4 = 205;
  }
  else if ([v3 isEqualToString:AXSSSwitchActionForceTouch])
  {
    int64_t v4 = 206;
  }
  else if ([v3 isEqualToString:AXSSSwitchActionDictation])
  {
    int64_t v4 = 207;
  }
  else if ([v3 isEqualToString:AXSSSwitchActionTripleClick])
  {
    int64_t v4 = 208;
  }
  else if ([v3 isEqualToString:AXSSSwitchActionControlCenter])
  {
    int64_t v4 = 209;
  }
  else if ([v3 isEqualToString:AXSSSwitchActionNotificationCenter])
  {
    int64_t v4 = 202;
  }
  else if ([v3 isEqualToString:AXSSSwitchActionSiriShortcutsMenu])
  {
    int64_t v4 = 107;
  }
  else
  {
    int64_t v4 = 0;
  }

  return v4;
}

- (id)_switchEventWithAction:(id)a3 longPressAction:(id)a4 start:(BOOL)a5 switchIdentifier:(id)a6 switchDisplayName:(id)a7
{
  BOOL v8 = a5;
  id v12 = a7;
  id v13 = a6;
  id v14 = a4;
  uint64_t v15 = [(SCATInputSource *)self _interDeviceActionForIdentifier:a3];
  v16 = (void *)v15;
  if (v15)
  {
    uint64_t v25 = v15;
    v17 = &v25;
  }
  else
  {
    _AXAssert();
    uint64_t v26 = AXSSSwitchActionSelect;
    v17 = &v26;
  }
  v18 = +[NSArray arrayWithObjects:v17 count:1];
  v19 = [(SCATInputSource *)self _interDeviceActionForIdentifier:v14];

  if (v19)
  {
    v24 = v19;
    v20 = +[NSArray arrayWithObjects:&v24 count:1];
  }
  else
  {
    v20 = 0;
  }
  if (qword_1001F0BB8 != -1) {
    dispatch_once(&qword_1001F0BB8, &stru_1001AE2B8);
  }
  id v21 = objc_alloc((Class)AXSSInterDeviceSwitchEvent);
  id v22 = [v21 initWithSwitchIdentifier:v13 switchDisplayName:v12 deviceIdentifier:qword_1001F0BB0 actions:v18 longPressActions:v20 isDown:v8];

  return v22;
}

- (void)_handleInterDeviceBailOut
{
  id v3 = [(SCATInputSource *)self delegate];
  [v3 handleInterDeviceBailOutForInputSource:self];
}

- (void)_handleAction:(id)a3 longPressAction:(id)a4 start:(BOOL)a5 switchIdentifier:(id)a6 switchDisplayName:(id)a7
{
  BOOL v9 = a5;
  id v12 = a3;
  id v13 = a4;
  id v14 = a6;
  id v15 = a7;
  +[NSObject cancelPreviousPerformRequestsWithTarget:self selector:"_handleInterDeviceBailOut" object:0];
  if (!+[NSThread isMainThread]) {
    _AXAssert();
  }
  v16 = [(SCATInputSource *)self queue];
  v17 = +[AXAccessQueue mainAccessQueue];

  if (v16 != v17) {
    _AXAssert();
  }
  v18 = [(SCATInputSource *)self delegate];
  unsigned int v19 = [v18 shouldForwardSwitchEventsForInputSource:self];

  if (!v19)
  {
    if (v9)
    {
      unsigned int v22 = [(SCATInputSource *)self longPressEnabled];
      [(SCATInputSource *)self setButtonDownStartTime:CFAbsoluteTimeGetCurrent()];
      if (v22 && [v13 action])
      {
        v23 = [(SCATInputSource *)self delegate];
        [v23 didBeginLongPressForInputSource:self];

        objc_initWeak(&location, self);
        v43[0] = _NSConcreteStackBlock;
        v43[1] = 3221225472;
        v43[2] = sub_1000C3B40;
        v43[3] = &unk_1001AAA40;
        objc_copyWeak(&v45, &location);
        id v44 = v12;
        [(SCATInputSource *)self setFallbackActionBlock:v43];
        v24 = [(SCATInputSource *)self longPressTimer];
        [(SCATInputSource *)self totalLongPressDuration];
        double v26 = v25;
        v40[0] = _NSConcreteStackBlock;
        v40[1] = 3221225472;
        v40[2] = sub_1000C3B98;
        v40[3] = &unk_1001AAA40;
        objc_copyWeak(&v42, &location);
        id v41 = v13;
        [v24 afterDelay:v40 processBlock:v26];

        objc_destroyWeak(&v42);
        objc_destroyWeak(&v45);
        objc_destroyWeak(&location);
        goto LABEL_24;
      }
      v37 = self;
      id v38 = v12;
      uint64_t v39 = 1;
    }
    else
    {
      v27 = [(SCATInputSource *)self longPressTimer];
      unsigned int v28 = [v27 isPending];

      if (v28)
      {
        v29 = [(SCATInputSource *)self delegate];
        [v29 didEndLongPressForInputSource:self];

        v30 = [(SCATInputSource *)self longPressTimer];
        [v30 cancel];
      }
      double Current = CFAbsoluteTimeGetCurrent();
      [(SCATInputSource *)self buttonDownStartTime];
      double v33 = v32;
      v34 = [(SCATInputSource *)self fallbackActionBlock];

      if (v34)
      {
        [(SCATInputSource *)self inputHoldDuration];
        if (Current - v33 >= v35 || ![(SCATInputSource *)self inputHoldEnabled])
        {
          v36 = [(SCATInputSource *)self fallbackActionBlock];
          v36[2]();
        }
        [(SCATInputSource *)self setFallbackActionBlock:0];
      }
      v37 = self;
      id v38 = v12;
      uint64_t v39 = 0;
    }
    [(SCATInputSource *)v37 _didReceiveActionWithIdentifier:v38 start:v39 ignoreInputHold:0];
    goto LABEL_24;
  }
  if (v9) {
    [(SCATInputSource *)self performSelector:"_handleInterDeviceBailOut" withObject:0 afterDelay:10.0];
  }
  if ([v12 action])
  {
    v20 = [(SCATInputSource *)self delegate];
    id v21 = [(SCATInputSource *)self _switchEventWithAction:v12 longPressAction:v13 start:v9 switchIdentifier:v14 switchDisplayName:v15];
    [v20 inputSource:self forwardSwitchEvent:v21];
  }
LABEL_24:
}

- (void)updateWithSwitches:(id)a3 recipe:(id)a4
{
}

- (void)beginSimulatedLongPressForInputSource:(id)a3
{
  id v4 = a3;
  id v5 = [(SCATInputSource *)self delegate];
  [v5 didBeginLongPressForInputSource:v4];
}

- (void)endSimulatedLongPressForInputSource:(id)a3
{
  id v4 = a3;
  id v5 = [(SCATInputSource *)self delegate];
  [v5 didEndLongPressForInputSource:v4];
}

- (NSDictionary)actions
{
  return self->_actions;
}

- (void)setActions:(id)a3
{
}

- (BOOL)isRunning
{
  return self->_running;
}

- (void)setRunning:(BOOL)a3
{
  self->_running = a3;
}

- (id)fallbackActionBlock
{
  return self->_fallbackActionBlock;
}

- (void)setFallbackActionBlock:(id)a3
{
}

- (AXDispatchTimer)longPressTimer
{
  return self->_longPressTimer;
}

- (void)setLongPressTimer:(id)a3
{
}

- (int64_t)longPressActionIdentifier
{
  return self->_longPressActionIdentifier;
}

- (void)setLongPressActionIdentifier:(int64_t)a3
{
  self->_longPressActionIdentifier = a3;
}

- (double)buttonDownStartTime
{
  return self->_buttonDownStartTime;
}

- (void)setButtonDownStartTime:(double)a3
{
  self->_buttonDownStartTime = a3;
}

- (SCATInputSourceDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (SCATInputSourceDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (AXAccessQueue)queue
{
  return self->_queue;
}

- (void)setQueue:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queue, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_longPressTimer, 0);
  objc_storeStrong(&self->_fallbackActionBlock, 0);

  objc_storeStrong((id *)&self->_actions, 0);
}

@end