@interface AFUISiriTapPanDismissalPolicyManager
- (AFUISiriTapPanDismissalPolicyManager)initWithPolicy:(int64_t)a3 delegate:(id)a4;
- (AFUISiriTapPanDismissalPolicyManagerDelegate)_delegate;
- (BOOL)_dimmingLayerVisible;
- (BOOL)_idleAndQuiet;
- (BOOL)_shouldDismissForTapsAndPans;
- (int64_t)_dismissalPolicy;
- (void)_dismissalPolicyForPassThroughAlways:(BOOL)a3 forSessionState:(int64_t)a4;
- (void)_dismissalPolicyForPassThroughUnlessDimmed:(BOOL)a3 forSessionState:(int64_t)a4;
- (void)_dismissalPolicyForPassThroughUnlessTypeToSiri:(int64_t)a3;
- (void)_setDelegate:(id)a3;
- (void)_setDimmingLayerVisible:(BOOL)a3;
- (void)_setDismissalPolicy:(int64_t)a3;
- (void)_setIdleAndQuiet:(BOOL)a3;
- (void)_setShouldDismissForTapsAndPans:(BOOL)a3;
- (void)_setShouldDismissForTapsAndPans:(BOOL)a3 shouldDelayDelegateUpdate:(BOOL)a4;
- (void)_updateDelegateOfPolicyChange;
- (void)dimmingLayerVisibilityDidChange:(BOOL)a3 forSessionState:(int64_t)a4;
- (void)idleAndQuietDidChange:(BOOL)a3 forSessionState:(int64_t)a4;
- (void)inputTypeDidChange:(int64_t)a3;
- (void)invalidate;
@end

@implementation AFUISiriTapPanDismissalPolicyManager

- (AFUISiriTapPanDismissalPolicyManager)initWithPolicy:(int64_t)a3 delegate:(id)a4
{
  id v6 = a4;
  v10.receiver = self;
  v10.super_class = (Class)AFUISiriTapPanDismissalPolicyManager;
  v7 = [(AFUISiriTapPanDismissalPolicyManager *)&v10 init];
  v8 = v7;
  if (v7)
  {
    [(AFUISiriTapPanDismissalPolicyManager *)v7 _setDismissalPolicy:a3];
    [(AFUISiriTapPanDismissalPolicyManager *)v8 _setShouldDismissForTapsAndPans:0];
    [(AFUISiriTapPanDismissalPolicyManager *)v8 _setDelegate:v6];
  }

  return v8;
}

- (void)idleAndQuietDidChange:(BOOL)a3 forSessionState:(int64_t)a4
{
  BOOL v5 = a3;
  uint64_t v19 = *MEMORY[0x263EF8340];
  -[AFUISiriTapPanDismissalPolicyManager _setIdleAndQuiet:](self, "_setIdleAndQuiet:");
  v7 = (void *)*MEMORY[0x263F28348];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_DEFAULT))
  {
    v8 = NSNumber;
    v9 = v7;
    objc_super v10 = [v8 numberWithInteger:a4];
    v11 = [NSNumber numberWithBool:v5];
    int v13 = 136315650;
    v14 = "-[AFUISiriTapPanDismissalPolicyManager idleAndQuietDidChange:forSessionState:]";
    __int16 v15 = 2112;
    v16 = v10;
    __int16 v17 = 2112;
    v18 = v11;
    _os_log_impl(&dword_223099000, v9, OS_LOG_TYPE_DEFAULT, "%s #dismissal: updating taps and pans should dismiss Siri for state:%@ siriIsIdleAndQuiet:%@", (uint8_t *)&v13, 0x20u);
  }
  int64_t v12 = [(AFUISiriTapPanDismissalPolicyManager *)self _dismissalPolicy];
  if (v12 == 2)
  {
    [(AFUISiriTapPanDismissalPolicyManager *)self _dismissalPolicyForPassThroughUnlessDimmed:[(AFUISiriTapPanDismissalPolicyManager *)self _dimmingLayerVisible] forSessionState:a4];
  }
  else if (!v12)
  {
    [(AFUISiriTapPanDismissalPolicyManager *)self _dismissalPolicyForPassThroughAlways:v5 forSessionState:a4];
  }
}

- (void)dimmingLayerVisibilityDidChange:(BOOL)a3 forSessionState:(int64_t)a4
{
  BOOL v5 = a3;
  uint64_t v18 = *MEMORY[0x263EF8340];
  -[AFUISiriTapPanDismissalPolicyManager _setDimmingLayerVisible:](self, "_setDimmingLayerVisible:");
  v7 = (void *)*MEMORY[0x263F28348];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_DEFAULT))
  {
    v8 = NSNumber;
    v9 = v7;
    objc_super v10 = [v8 numberWithBool:v5];
    v11 = [NSNumber numberWithInteger:a4];
    int v12 = 136315650;
    int v13 = "-[AFUISiriTapPanDismissalPolicyManager dimmingLayerVisibilityDidChange:forSessionState:]";
    __int16 v14 = 2112;
    __int16 v15 = v10;
    __int16 v16 = 2112;
    __int16 v17 = v11;
    _os_log_impl(&dword_223099000, v9, OS_LOG_TYPE_DEFAULT, "%s #dismissal: updating taps and pans should dismiss for dimming layer change:%@ sessiontState:%@", (uint8_t *)&v12, 0x20u);
  }
  if ([(AFUISiriTapPanDismissalPolicyManager *)self _dismissalPolicy] == 2) {
    [(AFUISiriTapPanDismissalPolicyManager *)self _dismissalPolicyForPassThroughUnlessDimmed:v5 forSessionState:a4];
  }
}

- (void)inputTypeDidChange:(int64_t)a3
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  BOOL v5 = (void *)*MEMORY[0x263F28348];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_DEFAULT))
  {
    id v6 = NSNumber;
    v7 = v5;
    v8 = [v6 numberWithInteger:a3];
    int v9 = 136315394;
    objc_super v10 = "-[AFUISiriTapPanDismissalPolicyManager inputTypeDidChange:]";
    __int16 v11 = 2112;
    int v12 = v8;
    _os_log_impl(&dword_223099000, v7, OS_LOG_TYPE_DEFAULT, "%s #dismissal: updating taps and pans should dismiss for input type:%@", (uint8_t *)&v9, 0x16u);
  }
  if ([(AFUISiriTapPanDismissalPolicyManager *)self _dismissalPolicy] == 3) {
    [(AFUISiriTapPanDismissalPolicyManager *)self _dismissalPolicyForPassThroughUnlessTypeToSiri:a3];
  }
}

- (void)invalidate
{
  if ([(AFUISiriTapPanDismissalPolicyManager *)self _dismissalPolicy] != 1)
  {
    [(id)objc_opt_class() cancelPreviousPerformRequestsWithTarget:self selector:sel__updateDelegateOfPolicyChange object:0];
    [(AFUISiriTapPanDismissalPolicyManager *)self _setShouldDismissForTapsAndPans:0];
    [(AFUISiriTapPanDismissalPolicyManager *)self _updateDelegateOfPolicyChange];
  }
}

- (void)_dismissalPolicyForPassThroughAlways:(BOOL)a3 forSessionState:(int64_t)a4
{
  BOOL v5 = a3;
  if (self->_dismissalPolicy)
  {
    int v9 = [MEMORY[0x263F08690] currentHandler];
    [v9 handleFailureInMethod:a2 object:self file:@"AFUISiriTapPanDismissalPolicyManager.m" lineNumber:99 description:@"Can't perform policy updates for iPad from a different device class"];
  }
  switch(a4)
  {
    case 4:
      goto LABEL_6;
    case 3:
      uint64_t v7 = 1;
      break;
    case 0:
LABEL_6:
      uint64_t v7 = 0;
      BOOL v5 = 1;
      break;
    default:
      BOOL v5 = 0;
      uint64_t v7 = 0;
      break;
  }

  [(AFUISiriTapPanDismissalPolicyManager *)self _setShouldDismissForTapsAndPans:v5 shouldDelayDelegateUpdate:v7];
}

- (void)_dismissalPolicyForPassThroughUnlessDimmed:(BOOL)a3 forSessionState:(int64_t)a4
{
  BOOL v5 = a3;
  uint64_t v12 = *MEMORY[0x263EF8340];
  if ([(AFUISiriTapPanDismissalPolicyManager *)self _dismissalPolicy] == 1)
  {
    uint64_t v7 = *MEMORY[0x263F28348];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_DEFAULT))
    {
      int v10 = 136315138;
      __int16 v11 = "-[AFUISiriTapPanDismissalPolicyManager _dismissalPolicyForPassThroughUnlessDimmed:forSessionState:]";
      _os_log_impl(&dword_223099000, v7, OS_LOG_TYPE_DEFAULT, "%s #dismissal Not updating tap pan dismissal policy on phone, feature flag not enabled.", (uint8_t *)&v10, 0xCu);
    }
  }
  else
  {
    if ((unint64_t)(a4 - 1) >= 4) {
      uint64_t v8 = a4 == 0;
    }
    else {
      uint64_t v8 = v5;
    }
    BOOL v9 = (unint64_t)(a4 - 1) < 4 && v5;
    [(AFUISiriTapPanDismissalPolicyManager *)self _setShouldDismissForTapsAndPans:v8 shouldDelayDelegateUpdate:v9];
  }
}

- (void)_dismissalPolicyForPassThroughUnlessTypeToSiri:(int64_t)a3
{
  [(AFUISiriTapPanDismissalPolicyManager *)self _setShouldDismissForTapsAndPans:a3 == 1 shouldDelayDelegateUpdate:0];
}

- (void)_setShouldDismissForTapsAndPans:(BOOL)a3 shouldDelayDelegateUpdate:(BOOL)a4
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  if (self->_shouldDismissForTapsAndPans != a3)
  {
    BOOL v4 = a4;
    BOOL v5 = a3;
    -[AFUISiriTapPanDismissalPolicyManager _setShouldDismissForTapsAndPans:](self, "_setShouldDismissForTapsAndPans:");
    uint64_t v7 = (void *)*MEMORY[0x263F28348];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_DEFAULT))
    {
      if (v4) {
        double v8 = 0.7;
      }
      else {
        double v8 = 0.0;
      }
      BOOL v9 = NSNumber;
      int v10 = v7;
      __int16 v11 = [v9 numberWithDouble:v8];
      uint64_t v12 = [NSNumber numberWithBool:v5];
      int v13 = 136315650;
      __int16 v14 = "-[AFUISiriTapPanDismissalPolicyManager _setShouldDismissForTapsAndPans:shouldDelayDelegateUpdate:]";
      __int16 v15 = 2112;
      __int16 v16 = v11;
      __int16 v17 = 2112;
      uint64_t v18 = v12;
      _os_log_impl(&dword_223099000, v10, OS_LOG_TYPE_DEFAULT, "%s #dismissal: cancelling pending tap/pan dismissal policy update. Scheduling new update with delay:%@ shouldDismiss:%@", (uint8_t *)&v13, 0x20u);
    }
    [(id)objc_opt_class() cancelPreviousPerformRequestsWithTarget:self selector:sel__updateDelegateOfPolicyChange object:0];
    if (v4) {
      [(AFUISiriTapPanDismissalPolicyManager *)self performSelector:sel__updateDelegateOfPolicyChange withObject:0 afterDelay:0.7];
    }
    else {
      [(AFUISiriTapPanDismissalPolicyManager *)self _updateDelegateOfPolicyChange];
    }
  }
}

- (void)_updateDelegateOfPolicyChange
{
  id v3 = [(AFUISiriTapPanDismissalPolicyManager *)self _delegate];
  objc_msgSend(v3, "tapPanDismissalPolicyManager:dismissalPolicyDidChange:", self, -[AFUISiriTapPanDismissalPolicyManager _shouldDismissForTapsAndPans](self, "_shouldDismissForTapsAndPans"));
}

- (BOOL)_shouldDismissForTapsAndPans
{
  return self->_shouldDismissForTapsAndPans;
}

- (void)_setShouldDismissForTapsAndPans:(BOOL)a3
{
  self->_shouldDismissForTapsAndPans = a3;
}

- (BOOL)_idleAndQuiet
{
  return self->_idleAndQuiet;
}

- (void)_setIdleAndQuiet:(BOOL)a3
{
  self->_idleAndQuiet = a3;
}

- (BOOL)_dimmingLayerVisible
{
  return self->_dimmingLayerVisible;
}

- (void)_setDimmingLayerVisible:(BOOL)a3
{
  self->_dimmingLayerVisible = a3;
}

- (int64_t)_dismissalPolicy
{
  return self->_dismissalPolicy;
}

- (void)_setDismissalPolicy:(int64_t)a3
{
  self->_dismissalPolicy = a3;
}

- (AFUISiriTapPanDismissalPolicyManagerDelegate)_delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (AFUISiriTapPanDismissalPolicyManagerDelegate *)WeakRetained;
}

- (void)_setDelegate:(id)a3
{
}

- (void).cxx_destruct
{
}

@end