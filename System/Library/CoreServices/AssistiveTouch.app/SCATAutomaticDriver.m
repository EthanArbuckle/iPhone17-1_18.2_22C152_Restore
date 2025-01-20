@interface SCATAutomaticDriver
- (AXDispatchTimer)focusTimer;
- (BOOL)_handleRunAction;
- (BOOL)_handleSelectAction;
- (BOOL)_handleStopAction;
- (BOOL)forcePause;
- (BOOL)pauseScanningForPointPickerNumberOfCycles:(unint64_t)a3;
- (BOOL)shouldScanToNextFocusContextAfterSpeaking;
- (SCATAutomaticDriver)initWithDelegate:(id)a3;
- (double)focusInterval;
- (id)description;
- (int)driverType;
- (int64_t)currentCycleCount;
- (unint64_t)maxAutoscanCycles;
- (void)_autoscanToNextFocusContext;
- (void)_didTransitionToPhase:(int)a3;
- (void)_didWrapInDirection:(int64_t)a3;
- (void)_endAutoscanning;
- (void)_idleTimerDidFire;
- (void)_pauseForMaximumNumberOfCycles;
- (void)_willStepToNextFocusContext:(id)a3 inDirection:(int64_t)a4;
- (void)actionHandlerDidCancelPendingAction:(id)a3;
- (void)actionHandlerDidFireAction:(id)a3;
- (void)dealloc;
- (void)outputManager:(id)a3 didSpeakFocusContext:(id)a4;
- (void)pauseAutoscanning;
- (void)resumeAutoscanning:(BOOL)a3;
- (void)setCurrentCycleCount:(int64_t)a3;
- (void)setFocusTimer:(id)a3;
- (void)setForcePause:(BOOL)a3;
- (void)setShouldScanToNextFocusContextAfterSpeaking:(BOOL)a3;
- (void)willDrillIntoGroup;
- (void)willDrillOutOfGroup;
- (void)willFinishAsScannerDriver;
@end

@implementation SCATAutomaticDriver

- (SCATAutomaticDriver)initWithDelegate:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)SCATAutomaticDriver;
  v3 = [(SCATDriver *)&v6 initWithDelegate:a3];
  if (v3)
  {
    id v4 = [objc_alloc((Class)AXDispatchTimer) initWithTargetSerialQueue:&_dispatch_main_q];
    [v4 setLabel:@"FocusTimer"];
    [v4 setAutomaticallyCancelPendingBlockUponSchedulingNewBlock:1];
    [(SCATAutomaticDriver *)v3 setFocusTimer:v4];
  }
  return v3;
}

- (void)dealloc
{
  v3 = [(SCATAutomaticDriver *)self focusTimer];
  [v3 cancel];

  v4.receiver = self;
  v4.super_class = (Class)SCATAutomaticDriver;
  [(SCATAutomaticDriver *)&v4 dealloc];
}

- (id)description
{
  v11.receiver = self;
  v11.super_class = (Class)SCATAutomaticDriver;
  v3 = [(SCATDriver *)&v11 description];
  objc_super v4 = +[NSNumber numberWithInteger:[(SCATAutomaticDriver *)self currentCycleCount]];
  v5 = [(SCATAutomaticDriver *)self focusTimer];
  objc_super v6 = +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", [v5 isPending]);
  v7 = [(SCATAutomaticDriver *)self focusTimer];
  v8 = +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", [v7 isActive]);
  v9 = +[NSString stringWithFormat:@"%@ cycle:%@ focusTimer:p%@:a%@", v3, v4, v6, v8];

  return v9;
}

- (void)willFinishAsScannerDriver
{
  [(SCATAutomaticDriver *)self _endAutoscanning];
  v3.receiver = self;
  v3.super_class = (Class)SCATAutomaticDriver;
  [(SCATDriver *)&v3 willFinishAsScannerDriver];
}

- (void)willDrillIntoGroup
{
  [(SCATAutomaticDriver *)self setCurrentCycleCount:0];

  [(SCATAutomaticDriver *)self _autoscanToNextFocusContext];
}

- (void)willDrillOutOfGroup
{
  [(SCATAutomaticDriver *)self setCurrentCycleCount:0];

  [(SCATAutomaticDriver *)self _autoscanToNextFocusContext];
}

- (BOOL)pauseScanningForPointPickerNumberOfCycles:(unint64_t)a3
{
  BOOL v5 = [(SCATDriver *)self _canAutomaticallyPauseScanner];
  if (v5)
  {
    if ([(SCATAutomaticDriver *)self maxAutoscanCycles] <= a3)
    {
      [(SCATAutomaticDriver *)self _pauseForMaximumNumberOfCycles];
      LOBYTE(v5) = 1;
    }
    else
    {
      LOBYTE(v5) = 0;
    }
  }
  return v5;
}

- (int)driverType
{
  return 0;
}

- (double)focusInterval
{
  objc_super v3 = +[AXSettings sharedInstance];
  if ([v3 assistiveTouchDelayAfterInputEnabled]
    && ([(SCATDriver *)self focusContext],
        objc_super v4 = objc_claimAutoreleasedReturnValue(),
        unsigned int v5 = [v4 isFirstInSequence],
        v4,
        v5))
  {
    [v3 assistiveTouchStepInterval];
    double v7 = v6;
    [v3 assistiveTouchDelayAfterInput];
    double v9 = v7 + v8;
  }
  else
  {
    [v3 assistiveTouchStepInterval];
    double v9 = v10;
  }
  if (v9 < 0.4)
  {
    objc_super v11 = [(SCATDriver *)self activeElementManager];
    v12 = [v11 numberOfItemsInCurrentScanCycle];
    v13 = (char *)[v12 unsignedIntegerValue];

    if ((unint64_t)(v13 - 1) < 2) {
      double v9 = v9 + v9;
    }
  }
  return v9;
}

- (unint64_t)maxAutoscanCycles
{
  v2 = +[AXSettings sharedInstance];
  id v3 = [v2 assistiveTouchScanCycles];

  return (unint64_t)v3;
}

- (void)_didTransitionToPhase:(int)a3
{
  uint64_t v3 = *(void *)&a3;
  if (a3 == 1)
  {
    [(SCATAutomaticDriver *)self setCurrentCycleCount:0];
    [(SCATAutomaticDriver *)self _autoscanToNextFocusContext];
  }
  else
  {
    [(SCATAutomaticDriver *)self _endAutoscanning];
  }
  v5.receiver = self;
  v5.super_class = (Class)SCATAutomaticDriver;
  [(SCATDriver *)&v5 _didTransitionToPhase:v3];
}

- (void)_autoscanToNextFocusContext
{
  uint64_t v3 = [(SCATAutomaticDriver *)self focusTimer];
  [(SCATAutomaticDriver *)self focusInterval];
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_100045674;
  v4[3] = &unk_1001AAA90;
  v4[4] = self;
  objc_msgSend(v3, "afterDelay:processBlock:", v4);
}

- (void)_endAutoscanning
{
  uint64_t v3 = [(SCATAutomaticDriver *)self focusTimer];
  [v3 cancel];

  [(SCATAutomaticDriver *)self setShouldScanToNextFocusContextAfterSpeaking:0];
}

- (void)outputManager:(id)a3 didSpeakFocusContext:(id)a4
{
  v7.receiver = self;
  v7.super_class = (Class)SCATAutomaticDriver;
  [(SCATDriver *)&v7 outputManager:a3 didSpeakFocusContext:a4];
  if ([(SCATAutomaticDriver *)self shouldScanToNextFocusContextAfterSpeaking])
  {
    objc_super v5 = [(SCATAutomaticDriver *)self focusTimer];
    unsigned __int8 v6 = [v5 isPending];

    if ((v6 & 1) == 0)
    {
      [(SCATDriver *)self _stepToNextFocusContextInDirection:0];
      [(SCATAutomaticDriver *)self _autoscanToNextFocusContext];
    }
    [(SCATAutomaticDriver *)self setShouldScanToNextFocusContextAfterSpeaking:0];
  }
}

- (BOOL)_handleSelectAction
{
  [(SCATAutomaticDriver *)self _endAutoscanning];
  v4.receiver = self;
  v4.super_class = (Class)SCATAutomaticDriver;
  return [(SCATDriver *)&v4 _handleSelectAction];
}

- (BOOL)_handleRunAction
{
  return 1;
}

- (BOOL)_handleStopAction
{
  return 1;
}

- (void)_didWrapInDirection:(int64_t)a3
{
  if ([(SCATDriver *)self lastWrapDirection] == a3) {
    objc_super v5 = (char *)[(SCATAutomaticDriver *)self currentCycleCount] + 1;
  }
  else {
    objc_super v5 = 0;
  }
  [(SCATAutomaticDriver *)self setCurrentCycleCount:v5];
  v6.receiver = self;
  v6.super_class = (Class)SCATAutomaticDriver;
  [(SCATDriver *)&v6 _didWrapInDirection:a3];
}

- (void)_idleTimerDidFire
{
  v2.receiver = self;
  v2.super_class = (Class)SCATAutomaticDriver;
  [(SCATDriver *)&v2 _idleTimerDidFire];
}

- (void)_willStepToNextFocusContext:(id)a3 inDirection:(int64_t)a4
{
  id v6 = a3;
  v26.receiver = self;
  v26.super_class = (Class)SCATAutomaticDriver;
  [(SCATDriver *)&v26 _willStepToNextFocusContext:v6 inDirection:a4];
  unsigned int v7 = [v6 selectBehavior];
  if ([(SCATDriver *)self _canAutomaticallyPauseScanner] && v7 != 4)
  {
    double v8 = [v6 element];
    int v25 = 0;
    double v9 = [(SCATDriver *)self activeElementManager];
    double v10 = v9;
    if (a4 == 1)
    {
      objc_super v11 = [v9 lastElementWithOptions:&v25];
      unsigned __int8 v12 = [v8 isEqual:v11];

      if ((v12 & 1) == 0)
      {
        v13 = [v8 parentGroup];
        if (!v13
          || (v14 = v13,
              [v13 lastChild],
              v15 = objc_claimAutoreleasedReturnValue(),
              unsigned __int8 v16 = [v8 isEqual:v15],
              v15,
              v14,
              (v16 & 1) == 0))
        {
LABEL_13:

          goto LABEL_14;
        }
      }
    }
    else
    {
      v17 = [v9 firstElementWithOptions:&v25];
      unsigned __int8 v18 = [v8 isEqual:v17];

      if ((v18 & 1) == 0)
      {
        v19 = [v8 parentGroup];
        if (!v19) {
          goto LABEL_13;
        }
        v20 = v19;
        v21 = [v19 firstChild];
        unsigned int v22 = [v8 isEqual:v21];

        if (!v22) {
          goto LABEL_13;
        }
      }
    }
    unint64_t v23 = [(SCATAutomaticDriver *)self currentCycleCount];
    unint64_t v24 = [(SCATAutomaticDriver *)self maxAutoscanCycles];

    if (v23 >= v24) {
      [(SCATAutomaticDriver *)self _pauseForMaximumNumberOfCycles];
    }
  }
LABEL_14:
}

- (void)_pauseForMaximumNumberOfCycles
{
  uint64_t v3 = [(SCATDriver *)self activeElementManager];
  unsigned int v4 = [v3 isMenuElementManager];

  if (v4)
  {
    objc_super v5 = [(SCATDriver *)self activeElementManager];
    [v5 closeCurrentScanningContext];

    [(SCATDriver *)self endScanning];
  }
  else
  {
    [(SCATDriver *)self pauseScanning];
  }
}

- (void)actionHandlerDidFireAction:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)SCATAutomaticDriver;
  [(SCATDriver *)&v4 actionHandlerDidFireAction:a3];
  [(SCATAutomaticDriver *)self _autoscanToNextFocusContext];
}

- (void)actionHandlerDidCancelPendingAction:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)SCATAutomaticDriver;
  [(SCATDriver *)&v4 actionHandlerDidCancelPendingAction:a3];
  [(SCATAutomaticDriver *)self _autoscanToNextFocusContext];
}

- (void)pauseAutoscanning
{
  [(SCATAutomaticDriver *)self setForcePause:1];

  [(SCATAutomaticDriver *)self _endAutoscanning];
}

- (void)resumeAutoscanning:(BOOL)a3
{
  BOOL v3 = a3;
  [(SCATAutomaticDriver *)self setForcePause:0];
  if (v3)
  {
    [(SCATAutomaticDriver *)self _autoscanToNextFocusContext];
  }
}

- (AXDispatchTimer)focusTimer
{
  return self->_focusTimer;
}

- (void)setFocusTimer:(id)a3
{
}

- (int64_t)currentCycleCount
{
  return self->_currentCycleCount;
}

- (void)setCurrentCycleCount:(int64_t)a3
{
  self->_currentCycleCount = a3;
}

- (BOOL)forcePause
{
  return self->_forcePause;
}

- (void)setForcePause:(BOOL)a3
{
  self->_forcePause = a3;
}

- (BOOL)shouldScanToNextFocusContextAfterSpeaking
{
  return self->_shouldScanToNextFocusContextAfterSpeaking;
}

- (void)setShouldScanToNextFocusContextAfterSpeaking:(BOOL)a3
{
  self->_shouldScanToNextFocusContextAfterSpeaking = a3;
}

- (void).cxx_destruct
{
}

@end