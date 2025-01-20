@interface HUApplicationManager
+ (id)sharedInstance;
- (BOOL)isIdleTimerDisabled;
- (BOOL)isStatusBarHidden;
- (BOOL)wasStatusBarVisible;
- (HUApplicationManager)init;
- (HUStatusBarVisibilityHandling)statusBarVisibilityHandler;
- (NSHashTable)idleTimerDisabledRequesters;
- (NSHashTable)statusBarHidingRequesters;
- (void)setIdleTimerDisabled:(BOOL)a3 forRequester:(id)a4;
- (void)setIdleTimerDisabledRequesters:(id)a3;
- (void)setStatusBarHidden:(BOOL)a3 forRequester:(id)a4;
- (void)setStatusBarHidden:(BOOL)a3 forRequester:(id)a4 withAnimationSettings:(id)a5;
- (void)setStatusBarHidingRequesters:(id)a3;
- (void)setStatusBarVisibilityHandler:(id)a3;
- (void)setWasStatusBarVisible:(BOOL)a3;
@end

@implementation HUApplicationManager

+ (id)sharedInstance
{
  if (qword_1EBA478D0 != -1) {
    dispatch_once(&qword_1EBA478D0, &__block_literal_global_173);
  }
  v2 = (void *)_MergedGlobals_629;

  return v2;
}

void __38__HUApplicationManager_sharedInstance__block_invoke()
{
  v0 = objc_alloc_init(HUApplicationManager);
  v1 = (void *)_MergedGlobals_629;
  _MergedGlobals_629 = (uint64_t)v0;
}

- (HUApplicationManager)init
{
  v7.receiver = self;
  v7.super_class = (Class)HUApplicationManager;
  v2 = [(HUApplicationManager *)&v7 init];
  if (v2)
  {
    v3 = [MEMORY[0x1E4F28D30] weakObjectsHashTable];
    [(HUApplicationManager *)v2 setStatusBarHidingRequesters:v3];

    v4 = [MEMORY[0x1E4F28D30] weakObjectsHashTable];
    [(HUApplicationManager *)v2 setIdleTimerDisabledRequesters:v4];

    v5 = objc_alloc_init(HUDefaultStatusBarVisiblityHandler);
    [(HUApplicationManager *)v2 setStatusBarVisibilityHandler:v5];
  }
  return v2;
}

- (BOOL)isStatusBarHidden
{
  v2 = [(HUApplicationManager *)self statusBarVisibilityHandler];
  char v3 = [v2 isStatusBarHidden];

  return v3;
}

- (void)setStatusBarHidden:(BOOL)a3 forRequester:(id)a4
{
}

- (void)setStatusBarHidden:(BOOL)a3 forRequester:(id)a4 withAnimationSettings:(id)a5
{
  BOOL v6 = a3;
  id v18 = a5;
  id v8 = a4;
  v9 = [(HUApplicationManager *)self statusBarHidingRequesters];
  uint64_t v10 = [v9 count];

  v11 = [(HUApplicationManager *)self statusBarHidingRequesters];
  v12 = v11;
  if (v6) {
    [v11 addObject:v8];
  }
  else {
    [v11 removeObject:v8];
  }
  BOOL v13 = v10 == 0;

  v14 = [(HUApplicationManager *)self statusBarHidingRequesters];
  uint64_t v15 = [v14 count];

  if (((v13 ^ (v15 != 0)) & 1) == 0)
  {
    if (v15)
    {
      [(HUApplicationManager *)self setWasStatusBarVisible:[(HUApplicationManager *)self isStatusBarHidden] ^ 1];
      if ([(HUApplicationManager *)self isStatusBarHidden]) {
        goto LABEL_10;
      }
      uint64_t v16 = 1;
    }
    else
    {
      uint64_t v16 = [(HUApplicationManager *)self wasStatusBarVisible] ^ 1;
      if ([(HUApplicationManager *)self isStatusBarHidden] == v16) {
        goto LABEL_10;
      }
    }
    v17 = [(HUApplicationManager *)self statusBarVisibilityHandler];
    [v17 setStatusBarHidden:v16 withAnimationSettings:v18];
  }
LABEL_10:
}

- (BOOL)isIdleTimerDisabled
{
  return [(id)*MEMORY[0x1E4F43630] isIdleTimerDisabled];
}

- (void)setIdleTimerDisabled:(BOOL)a3 forRequester:(id)a4
{
  BOOL v4 = a3;
  id v6 = a4;
  objc_super v7 = [(HUApplicationManager *)self idleTimerDisabledRequesters];
  id v8 = v7;
  if (v4) {
    [v7 addObject:v6];
  }
  else {
    [v7 removeObject:v6];
  }

  id v10 = [(HUApplicationManager *)self idleTimerDisabledRequesters];
  BOOL v9 = [v10 count] != 0;
  [(id)*MEMORY[0x1E4F43630] setIdleTimerDisabled:v9];
}

- (HUStatusBarVisibilityHandling)statusBarVisibilityHandler
{
  return self->_statusBarVisibilityHandler;
}

- (void)setStatusBarVisibilityHandler:(id)a3
{
}

- (NSHashTable)statusBarHidingRequesters
{
  return self->_statusBarHidingRequesters;
}

- (void)setStatusBarHidingRequesters:(id)a3
{
}

- (NSHashTable)idleTimerDisabledRequesters
{
  return self->_idleTimerDisabledRequesters;
}

- (void)setIdleTimerDisabledRequesters:(id)a3
{
}

- (BOOL)wasStatusBarVisible
{
  return self->_wasStatusBarVisible;
}

- (void)setWasStatusBarVisible:(BOOL)a3
{
  self->_wasStatusBarVisible = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_idleTimerDisabledRequesters, 0);
  objc_storeStrong((id *)&self->_statusBarHidingRequesters, 0);

  objc_storeStrong((id *)&self->_statusBarVisibilityHandler, 0);
}

@end