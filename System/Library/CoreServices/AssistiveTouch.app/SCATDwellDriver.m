@interface SCATDwellDriver
- (BOOL)_actuallyHandleSelectAction;
- (BOOL)_handleStepAction:(int64_t)a3;
- (BOOL)_handleStepNextAction;
- (BOOL)_handleStepPreviousAction;
- (BOOL)_shouldUseDwellSelection;
- (BOOL)_shouldUseScanAbortTimer;
- (BOOL)handleInputAction:(id)a3;
- (BOOL)isReadyForSelect;
- (double)dwellDelay;
- (int)driverType;
- (void)_cancelDwellRelatedTimers;
- (void)_didTransitionToPhase:(int)a3;
- (void)_dwellTimerFired;
- (void)_idleTimerDidFire;
- (void)_resetDwellTimer;
- (void)_scanAbortTimerFired;
- (void)_startDwellTimer;
- (void)_startScanAbortTimer;
- (void)outputManager:(id)a3 didSpeakFocusContext:(id)a4;
- (void)setIsReadyForSelect:(BOOL)a3;
@end

@implementation SCATDwellDriver

- (int)driverType
{
  return 2;
}

- (BOOL)handleInputAction:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)SCATDwellDriver;
  BOOL v4 = [(SCATDriver *)&v6 handleInputAction:a3];
  [(SCATDwellDriver *)self _resetDwellTimer];
  return v4;
}

- (BOOL)_actuallyHandleSelectAction
{
  v3.receiver = self;
  v3.super_class = (Class)SCATDwellDriver;
  return [(SCATDriver *)&v3 _handleSelectAction];
}

- (BOOL)_handleStepAction:(int64_t)a3
{
  if ([(SCATDwellDriver *)self isReadyForSelect]) {
    [(SCATDwellDriver *)self _actuallyHandleSelectAction];
  }
  else {
    [(SCATDriver *)self _stepToNextFocusContextInDirection:a3];
  }
  return 1;
}

- (BOOL)_handleStepNextAction
{
  if ([(SCATDwellDriver *)self _shouldUseDwellSelection])
  {
    return [(SCATDwellDriver *)self _handleStepAction:0];
  }
  else
  {
    return [(SCATDwellDriver *)self _actuallyHandleSelectAction];
  }
}

- (BOOL)_handleStepPreviousAction
{
  if ([(SCATDwellDriver *)self _shouldUseDwellSelection])
  {
    return [(SCATDwellDriver *)self _handleStepAction:1];
  }
  else
  {
    return [(SCATDwellDriver *)self _actuallyHandleSelectAction];
  }
}

- (BOOL)_shouldUseDwellSelection
{
  v2 = [(SCATDriver *)self activeElementManager];
  unsigned __int8 v3 = [v2 allowsDwellSelection];

  return v3;
}

- (BOOL)_shouldUseScanAbortTimer
{
  unsigned __int8 v3 = [(SCATDriver *)self focusContext];
  BOOL v4 = [v3 element];

  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v5 = [(SCATDriver *)self focusContext];
    objc_super v6 = [v5 element];
    unsigned __int8 v7 = [v6 allowsDwellScanningToAbortAfterTimeout];

    if (v7)
    {
      int v8 = 0;
      goto LABEL_6;
    }
  }
  v5 = [(SCATDriver *)self activeElementManager];
  if ([v5 allowsDwellScanningToAbortAfterTimeout])
  {
    int v8 = 1;
LABEL_6:
    v9 = [(SCATDriver *)self focusContext];
    BOOL v10 = [v9 selectBehavior] != 4;

    if (!v8) {
      goto LABEL_10;
    }
    goto LABEL_9;
  }
  BOOL v10 = 0;
LABEL_9:

LABEL_10:
  return v10;
}

- (void)_idleTimerDidFire
{
  if (![(SCATDwellDriver *)self _shouldUseDwellSelection]
    && [(SCATDriver *)self _canAutomaticallyPauseScanner])
  {
    [(SCATDriver *)self endScanning];
  }
}

- (void)_didTransitionToPhase:(int)a3
{
  v4.receiver = self;
  v4.super_class = (Class)SCATDwellDriver;
  [(SCATDriver *)&v4 _didTransitionToPhase:*(void *)&a3];
  [(SCATDwellDriver *)self _resetDwellTimer];
}

- (void)_resetDwellTimer
{
  if ([(SCATDriver *)self isActive]
    && [(SCATDwellDriver *)self _shouldUseDwellSelection])
  {
    [(SCATDwellDriver *)self _startDwellTimer];
  }
  else
  {
    [(SCATDwellDriver *)self _cancelDwellRelatedTimers];
  }
}

- (void)_startDwellTimer
{
  [(SCATDwellDriver *)self _cancelDwellRelatedTimers];
  [(SCATDwellDriver *)self dwellDelay];

  -[SCATDwellDriver performSelector:withObject:afterDelay:](self, "performSelector:withObject:afterDelay:", "_dwellTimerFired", 0);
}

- (void)_startScanAbortTimer
{
  [(SCATDwellDriver *)self _cancelDwellRelatedTimers];
  [(SCATDwellDriver *)self setIsReadyForSelect:1];
  unsigned __int8 v3 = [(SCATDriver *)self delegate];
  [v3 driver:self indicateDwellScanningWillAbort:1];

  id v4 = +[AXSettings sharedInstance];
  [v4 assistiveTouchScanTimeout];
  -[SCATDwellDriver performSelector:withObject:afterDelay:](self, "performSelector:withObject:afterDelay:", "_scanAbortTimerFired", 0);
}

- (void)_dwellTimerFired
{
  if ([(SCATDwellDriver *)self _shouldUseScanAbortTimer])
  {
    [(SCATDwellDriver *)self _startScanAbortTimer];
  }
  else
  {
    [(SCATDwellDriver *)self _actuallyHandleSelectAction];
    [(SCATDwellDriver *)self _resetDwellTimer];
  }
}

- (void)_scanAbortTimerFired
{
  if (![(SCATDriver *)self isSpeakingFocusContext])
  {
    [(SCATDwellDriver *)self _cancelDwellRelatedTimers];
    if ([(SCATDriver *)self _canAutomaticallyPauseScanner])
    {
      [(SCATDriver *)self endScanning];
    }
  }
}

- (void)_cancelDwellRelatedTimers
{
  [(SCATDwellDriver *)self setIsReadyForSelect:0];
  unsigned __int8 v3 = [(SCATDriver *)self delegate];
  [v3 driver:self indicateDwellScanningWillAbort:0];

  +[NSObject cancelPreviousPerformRequestsWithTarget:self selector:"_dwellTimerFired" object:0];

  +[NSObject cancelPreviousPerformRequestsWithTarget:self selector:"_scanAbortTimerFired" object:0];
}

- (double)dwellDelay
{
  unsigned __int8 v3 = +[AXSettings sharedInstance];
  if ([v3 assistiveTouchDelayAfterInputEnabled]
    && ([(SCATDriver *)self focusContext],
        id v4 = objc_claimAutoreleasedReturnValue(),
        unsigned int v5 = [v4 isFirstInSequence],
        v4,
        v5))
  {
    [v3 switchControlDwellTime];
    double v7 = v6;
    [v3 assistiveTouchDelayAfterInput];
    double v9 = v7 + v8;
  }
  else
  {
    [v3 switchControlDwellTime];
    double v9 = v10;
  }

  return v9;
}

- (void)outputManager:(id)a3 didSpeakFocusContext:(id)a4
{
  v6.receiver = self;
  v6.super_class = (Class)SCATDwellDriver;
  [(SCATDriver *)&v6 outputManager:a3 didSpeakFocusContext:a4];
  unsigned int v5 = +[AXSettings sharedInstance];
  [v5 assistiveTouchScanTimeout];
  -[SCATDwellDriver performSelector:withObject:afterDelay:](self, "performSelector:withObject:afterDelay:", "_scanAbortTimerFired", 0);
}

- (BOOL)isReadyForSelect
{
  return self->_isReadyForSelect;
}

- (void)setIsReadyForSelect:(BOOL)a3
{
  self->_isReadyForSelect = a3;
}

@end