@interface SCATActionHandler
- (AXDispatchTimer)actionTimeoutTimer;
- (BOOL)_shouldHandleSelectActionImmediately;
- (BOOL)isPending;
- (BOOL)shouldShowMenuOnFirstSelectAction;
- (SCATActionHandler)initWithAction:(int64_t)a3 timeoutDuration:(double)a4;
- (SCATActionHandlerDelegate)delegate;
- (SCATActionHandlerUIDelegate)uiDelegate;
- (double)timeoutDuration;
- (int64_t)action;
- (unint64_t)actionCount;
- (void)_handleFireActionAndResumeAutoscanning:(BOOL)a3;
- (void)_resetWithActionSource:(id)a3;
- (void)cancelPendingAction;
- (void)notifyDidReceiveAction:(id)a3;
- (void)setAction:(int64_t)a3;
- (void)setActionCount:(unint64_t)a3;
- (void)setActionTimeoutTimer:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setTimeoutDuration:(double)a3;
- (void)setUiDelegate:(id)a3;
@end

@implementation SCATActionHandler

- (SCATActionHandler)initWithAction:(int64_t)a3 timeoutDuration:(double)a4
{
  v11.receiver = self;
  v11.super_class = (Class)SCATActionHandler;
  v6 = [(SCATActionHandler *)&v11 init];
  v7 = v6;
  if (v6)
  {
    v6->_action = a3;
    v6->_timeoutDuration = a4;
    v8 = (AXDispatchTimer *)[objc_alloc((Class)AXDispatchTimer) initWithTargetSerialQueue:&_dispatch_main_q];
    actionTimeoutTimer = v7->_actionTimeoutTimer;
    v7->_actionTimeoutTimer = v8;

    [(AXDispatchTimer *)v7->_actionTimeoutTimer setLabel:@"ActionTimeout"];
    [(AXDispatchTimer *)v7->_actionTimeoutTimer setAutomaticallyCancelPendingBlockUponSchedulingNewBlock:1];
  }
  return v7;
}

- (BOOL)shouldShowMenuOnFirstSelectAction
{
  v2 = +[AXSettings sharedInstance];
  BOOL v3 = [v2 switchControlTapBehavior] != (id)1;

  return v3;
}

- (BOOL)_shouldHandleSelectActionImmediately
{
  v2 = +[AXSettings sharedInstance];
  if ([v2 switchControlTapBehavior] == (id)1)
  {
    BOOL v3 = +[AXSettings sharedInstance];
    unsigned __int8 v4 = [v3 switchControlHasEmptyTopLevelMenu];
  }
  else
  {
    unsigned __int8 v4 = 1;
  }

  return v4;
}

- (void)notifyDidReceiveAction:(id)a3
{
  id v4 = a3;
  v5 = [(SCATActionHandler *)self delegate];
  unsigned __int8 v6 = [v5 isEqual:v4];

  if ((v6 & 1) == 0) {
    [(SCATActionHandler *)self _resetWithActionSource:v4];
  }
  [(SCATActionHandler *)self setActionCount:(char *)[(SCATActionHandler *)self actionCount] + 1];
  int64_t v7 = [(SCATActionHandler *)self action];
  int64_t v8 = v7;
  if (v7 == 109 || v7 == 103) {
    unsigned __int8 v9 = [(SCATActionHandler *)self _shouldHandleSelectActionImmediately];
  }
  else {
    unsigned __int8 v9 = 0;
  }
  BOOL v10 = v8 == 109;
  if (v8 == 100
    || (v9 & 1) != 0
    || ([(SCATActionHandler *)self delegate],
        objc_super v11 = objc_claimAutoreleasedReturnValue(),
        unsigned int v12 = objc_msgSend(v11, "actionHandler:shouldActImmediatelyOnActionCount:", self, -[SCATActionHandler actionCount](self, "actionCount")), v11, v12))
  {
    v13 = [(SCATActionHandler *)self actionTimeoutTimer];
    [v13 cancel];

    [(SCATActionHandler *)self _handleFireActionAndResumeAutoscanning:v8 == 109];
  }
  else
  {
    v14 = [(SCATActionHandler *)self uiDelegate];
    v15 = [(SCATActionHandler *)self delegate];
    v16 = [v15 focusContextForActionHandler:self];
    objc_msgSend(v14, "actionHandlerForUI:willPerformDelayedActionOnContext:withCount:", self, v16, -[SCATActionHandler actionCount](self, "actionCount"));

    v17 = [(SCATActionHandler *)self actionTimeoutTimer];
    [(SCATActionHandler *)self timeoutDuration];
    v18[0] = _NSConcreteStackBlock;
    v18[1] = 3221225472;
    v18[2] = sub_10009DE94;
    v18[3] = &unk_1001AB0E8;
    v18[4] = self;
    BOOL v19 = v10;
    objc_msgSend(v17, "afterDelay:processBlock:", v18);
  }
}

- (void)cancelPendingAction
{
  BOOL v3 = [(SCATActionHandler *)self actionTimeoutTimer];
  unsigned int v4 = [v3 isPending];

  if (v4)
  {
    [(SCATActionHandler *)self setActionCount:0];
    v5 = [(SCATActionHandler *)self actionTimeoutTimer];
    [v5 cancel];

    unsigned __int8 v6 = [(SCATActionHandler *)self uiDelegate];
    [v6 actionHandlerForUIDidCancelPendingAction:self];

    int64_t v7 = [(SCATActionHandler *)self delegate];
    char v8 = objc_opt_respondsToSelector();

    if (v8)
    {
      id v9 = [(SCATActionHandler *)self delegate];
      [v9 actionHandlerDidCancelPendingAction:self];
    }
  }
}

- (BOOL)isPending
{
  v2 = [(SCATActionHandler *)self actionTimeoutTimer];
  unsigned __int8 v3 = [v2 isPending];

  return v3;
}

- (void)_handleFireActionAndResumeAutoscanning:(BOOL)a3
{
  BOOL v3 = a3;
  v5 = [(SCATActionHandler *)self uiDelegate];
  [v5 actionHandlerForUIWillFireAction:self];

  unsigned __int8 v6 = [(SCATActionHandler *)self delegate];
  char v7 = objc_opt_respondsToSelector();

  if (v7)
  {
    char v8 = [(SCATActionHandler *)self delegate];
    [v8 actionHandlerDidFireAction:self];
  }
  [(SCATActionHandler *)self setActionCount:0];
  if (v3)
  {
    id v9 = +[SCATScannerManager sharedManager];
    [v9 resumeAutoscanning];
  }
}

- (void)_resetWithActionSource:(id)a3
{
  id v4 = a3;
  [(SCATActionHandler *)self setActionCount:0];
  [(SCATActionHandler *)self setDelegate:v4];
}

- (int64_t)action
{
  return self->_action;
}

- (void)setAction:(int64_t)a3
{
  self->_action = a3;
}

- (SCATActionHandlerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (SCATActionHandlerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (SCATActionHandlerUIDelegate)uiDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_uiDelegate);

  return (SCATActionHandlerUIDelegate *)WeakRetained;
}

- (void)setUiDelegate:(id)a3
{
}

- (AXDispatchTimer)actionTimeoutTimer
{
  return self->_actionTimeoutTimer;
}

- (void)setActionTimeoutTimer:(id)a3
{
}

- (unint64_t)actionCount
{
  return self->_actionCount;
}

- (void)setActionCount:(unint64_t)a3
{
  self->_actionCount = a3;
}

- (double)timeoutDuration
{
  return self->_timeoutDuration;
}

- (void)setTimeoutDuration:(double)a3
{
  self->_timeoutDuration = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_actionTimeoutTimer, 0);
  objc_destroyWeak((id *)&self->_uiDelegate);

  objc_destroyWeak((id *)&self->_delegate);
}

@end