@interface SpeakThisUIStateManager
+ (SpeakThisUIStateManager)sharedInstance;
- (AXDispatchTimer)collapseTimer;
- (BOOL)inTabMode;
- (NSMutableSet)observers;
- (NSString)currentAppBundleIdentifier;
- (NSString)currentControllerTitle;
- (SpeakThisUIStateManager)init;
- (int64_t)currentState;
- (void)_updateObservers;
- (void)addObserver:(id)a3;
- (void)removeObserver:(id)a3;
- (void)setCollapseTimer:(id)a3;
- (void)setCurrentAppBundleIdentifier:(id)a3;
- (void)setCurrentControllerTitle:(id)a3;
- (void)setCurrentState:(int64_t)a3;
- (void)setInTabMode:(BOOL)a3;
- (void)setObservers:(id)a3;
@end

@implementation SpeakThisUIStateManager

+ (SpeakThisUIStateManager)sharedInstance
{
  if (qword_30238 != -1) {
    dispatch_once(&qword_30238, &stru_28BF0);
  }
  v2 = (void *)qword_30240;

  return (SpeakThisUIStateManager *)v2;
}

- (SpeakThisUIStateManager)init
{
  v8.receiver = self;
  v8.super_class = (Class)SpeakThisUIStateManager;
  v2 = [(SpeakThisUIStateManager *)&v8 init];
  if (v2)
  {
    uint64_t v3 = +[NSMutableSet set];
    observers = v2->_observers;
    v2->_observers = (NSMutableSet *)v3;

    v2->_inTabMode = 1;
    v2->_currentState = 0;
    v5 = (AXDispatchTimer *)[objc_alloc((Class)AXDispatchTimer) initWithTargetSerialQueue:&_dispatch_main_q];
    collapseTimer = v2->_collapseTimer;
    v2->_collapseTimer = v5;
  }
  return v2;
}

- (void)setCurrentControllerTitle:(id)a3
{
  objc_storeStrong((id *)&self->_currentControllerTitle, a3);

  [(SpeakThisUIStateManager *)self _updateObservers];
}

- (void)addObserver:(id)a3
{
  if (a3)
  {
    id v4 = a3;
    id v5 = [(SpeakThisUIStateManager *)self observers];
    [v5 addObject:v4];
  }
}

- (void)removeObserver:(id)a3
{
  if (a3)
  {
    id v4 = a3;
    id v5 = [(SpeakThisUIStateManager *)self observers];
    [v5 removeObject:v4];
  }
}

- (void)_updateObservers
{
  long long v7 = 0u;
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  v2 = [(SpeakThisUIStateManager *)self observers];
  id v3 = [v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
  if (v3)
  {
    id v4 = v3;
    uint64_t v5 = *(void *)v8;
    do
    {
      v6 = 0;
      do
      {
        if (*(void *)v8 != v5) {
          objc_enumerationMutation(v2);
        }
        [*(id *)(*((void *)&v7 + 1) + 8 * (void)v6) uiStateChanged];
        v6 = (char *)v6 + 1;
      }
      while (v4 != v6);
      id v4 = [v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
    }
    while (v4);
  }
}

- (BOOL)inTabMode
{
  return self->_inTabMode;
}

- (void)setInTabMode:(BOOL)a3
{
  self->_inTabMode = a3;
}

- (int64_t)currentState
{
  return self->_currentState;
}

- (void)setCurrentState:(int64_t)a3
{
  self->_currentState = a3;
}

- (AXDispatchTimer)collapseTimer
{
  return self->_collapseTimer;
}

- (void)setCollapseTimer:(id)a3
{
}

- (NSString)currentAppBundleIdentifier
{
  return self->_currentAppBundleIdentifier;
}

- (void)setCurrentAppBundleIdentifier:(id)a3
{
}

- (NSString)currentControllerTitle
{
  return self->_currentControllerTitle;
}

- (NSMutableSet)observers
{
  return self->_observers;
}

- (void)setObservers:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_observers, 0);
  objc_storeStrong((id *)&self->_currentControllerTitle, 0);
  objc_storeStrong((id *)&self->_currentAppBundleIdentifier, 0);

  objc_storeStrong((id *)&self->_collapseTimer, 0);
}

@end