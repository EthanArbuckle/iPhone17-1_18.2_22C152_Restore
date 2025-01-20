@interface SSSDittoDismissTimer
- (BOOL)_timerShouldBeRunning;
- (BOOL)inDragAndDrop;
- (BOOL)performingDismissAnimation;
- (BOOL)showingSharingUI;
- (BOOL)showingWaitingForImageIdentifierUpdatesUI;
- (BOOL)timerIsRunning;
- (BOOL)userInterfaceHidden;
- (SSSDittoDismissTimer)init;
- (SSSDittoDismissTimerDelegate)delegate;
- (id)_stateDescription;
- (unint64_t)viewState;
- (void)_significantTimerEventOccured;
- (void)_timerFired;
- (void)setDelegate:(id)a3;
- (void)setInDragAndDrop:(BOOL)a3;
- (void)setPerformingDismissAnimation:(BOOL)a3;
- (void)setShowingSharingUI:(BOOL)a3;
- (void)setShowingWaitingForImageIdentifierUpdatesUI:(BOOL)a3;
- (void)setUserInterfaceHidden:(BOOL)a3;
- (void)setViewState:(unint64_t)a3;
@end

@implementation SSSDittoDismissTimer

- (SSSDittoDismissTimer)init
{
  v3.receiver = self;
  v3.super_class = (Class)SSSDittoDismissTimer;
  return [(SSSDittoDismissTimer *)&v3 init];
}

- (id)_stateDescription
{
  objc_super v3 = +[NSMutableString string];
  v4 = sub_10002CA3C([(SSSDittoDismissTimer *)self viewState]);
  v5 = +[NSString stringWithFormat:@"viewState: %@", v4];
  [v3 appendString:v5];

  v6 = +[NSString stringWithFormat:@" inDragAndDrop: %d", [(SSSDittoDismissTimer *)self inDragAndDrop]];
  [v3 appendString:v6];

  v7 = +[NSString stringWithFormat:@" showingSharingUI: %d", [(SSSDittoDismissTimer *)self showingSharingUI]];
  [v3 appendString:v7];

  v8 = +[NSString stringWithFormat:@" showingWaitingForImageIdentifierUpdatesUI: %d", [(SSSDittoDismissTimer *)self showingWaitingForImageIdentifierUpdatesUI]];
  [v3 appendString:v8];

  v9 = +[NSString stringWithFormat:@" performingDismissAnimation: %d", [(SSSDittoDismissTimer *)self performingDismissAnimation]];
  [v3 appendString:v9];

  v10 = +[NSString stringWithFormat:@" userInterfaceHidden: %d", [(SSSDittoDismissTimer *)self userInterfaceHidden]];
  [v3 appendString:v10];

  return v3;
}

- (BOOL)_timerShouldBeRunning
{
  if ([(SSSDittoDismissTimer *)self viewState]
    || [(SSSDittoDismissTimer *)self inDragAndDrop]
    || [(SSSDittoDismissTimer *)self showingSharingUI]
    || [(SSSDittoDismissTimer *)self showingWaitingForImageIdentifierUpdatesUI]|| [(SSSDittoDismissTimer *)self performingDismissAnimation])
  {
    return 0;
  }
  else
  {
    return ![(SSSDittoDismissTimer *)self userInterfaceHidden];
  }
}

- (void)_significantTimerEventOccured
{
  unsigned int v3 = [(SSSDittoDismissTimer *)self _timerShouldBeRunning];
  v4 = os_log_create("com.apple.screenshotservices", "DismissTimer");
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    v5 = [(SSSDittoDismissTimer *)self _stateDescription];
    v11[0] = 67109378;
    v11[1] = v3;
    __int16 v12 = 2112;
    v13 = v5;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "Moving timer to running %d with state %@", (uint8_t *)v11, 0x12u);
  }
  unsigned int v6 = [(SSSDittoDismissTimer *)self _timerShouldBeRunning];
  [(NSTimer *)self->_currentTimer invalidate];
  if (v6)
  {
    currentTimer = self->_currentTimer;
    self->_currentTimer = 0;

    UIAnimationDragCoefficient();
    v9 = +[NSTimer scheduledTimerWithTimeInterval:self target:"_timerFired" selector:0 userInfo:0 repeats:v8 * 6.0];
    v10 = self->_currentTimer;
    self->_currentTimer = v9;
  }
}

- (void)_timerFired
{
  [(NSTimer *)self->_currentTimer invalidate];
  unsigned int v3 = os_log_create("com.apple.screenshotservices", "DismissTimer");
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    v4 = [(SSSDittoDismissTimer *)self _stateDescription];
    int v6 = 138412290;
    v7 = v4;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "Dismiss timer fired with state %@", (uint8_t *)&v6, 0xCu);
  }
  v5 = [(SSSDittoDismissTimer *)self delegate];
  [v5 dittoDismissTimerFired:self];
}

- (BOOL)timerIsRunning
{
  return [(NSTimer *)self->_currentTimer isValid];
}

- (void)setViewState:(unint64_t)a3
{
  if (self->_viewState != a3 || !self->_hasSetViewState)
  {
    self->_viewState = a3;
    [(SSSDittoDismissTimer *)self _significantTimerEventOccured];
  }
  self->_hasSetViewState = 1;
}

- (void)setInDragAndDrop:(BOOL)a3
{
  if (self->_inDragAndDrop != a3 || !self->_hasSetInDragAndDrop)
  {
    self->_inDragAndDrop = a3;
    [(SSSDittoDismissTimer *)self _significantTimerEventOccured];
  }
  self->_hasSetInDragAndDrop = 1;
}

- (void)setShowingSharingUI:(BOOL)a3
{
  if (self->_showingSharingUI != a3 || !self->_hasSetShowingSharingUI)
  {
    self->_showingSharingUI = a3;
    [(SSSDittoDismissTimer *)self _significantTimerEventOccured];
  }
  self->_hasSetShowingSharingUI = 1;
}

- (void)setShowingWaitingForImageIdentifierUpdatesUI:(BOOL)a3
{
  if (self->_showingWaitingForImageIdentifierUpdatesUI != a3 || !self->_hasSetShowingWaitingForImageIdentifierUpdatesUI)
  {
    self->_showingWaitingForImageIdentifierUpdatesUI = a3;
    [(SSSDittoDismissTimer *)self _significantTimerEventOccured];
  }
  self->_hasSetShowingWaitingForImageIdentifierUpdatesUI = 1;
}

- (void)setPerformingDismissAnimation:(BOOL)a3
{
  if (self->_performingDismissAnimation != a3 || !self->_hasSetPerformingDismissAnimation)
  {
    self->_performingDismissAnimation = a3;
    [(SSSDittoDismissTimer *)self _significantTimerEventOccured];
  }
  self->_hasSetPerformingDismissAnimation = 1;
}

- (void)setUserInterfaceHidden:(BOOL)a3
{
  if (self->_userInterfaceHidden != a3 || !self->_hasSetUserInterfaceHidden)
  {
    self->_userInterfaceHidden = a3;
    [(SSSDittoDismissTimer *)self _significantTimerEventOccured];
  }
  self->_hasSetUserInterfaceHidden = 0;
}

- (unint64_t)viewState
{
  return self->_viewState;
}

- (BOOL)inDragAndDrop
{
  return self->_inDragAndDrop;
}

- (BOOL)showingSharingUI
{
  return self->_showingSharingUI;
}

- (BOOL)showingWaitingForImageIdentifierUpdatesUI
{
  return self->_showingWaitingForImageIdentifierUpdatesUI;
}

- (BOOL)performingDismissAnimation
{
  return self->_performingDismissAnimation;
}

- (BOOL)userInterfaceHidden
{
  return self->_userInterfaceHidden;
}

- (SSSDittoDismissTimerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (SSSDittoDismissTimerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);

  objc_storeStrong((id *)&self->_currentTimer, 0);
}

@end