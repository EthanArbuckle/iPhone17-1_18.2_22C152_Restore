@interface FCAppInstallationObserver
- (BOOL)fitnessAppInstalled;
- (FCAppInstallationObserver)init;
- (void)_applicationsInstalled:(id)a3;
- (void)_applicationsUninstalled:(id)a3;
- (void)_setAppInstalled:(BOOL)a3;
- (void)_updateApplicationInstalled;
@end

@implementation FCAppInstallationObserver

- (FCAppInstallationObserver)init
{
  v8.receiver = self;
  v8.super_class = (Class)FCAppInstallationObserver;
  v2 = [(FCAppInstallationObserver *)&v8 init];
  if (v2)
  {
    v3 = (FCCAppInstallationUtility *)objc_alloc_init(MEMORY[0x1E4F62088]);
    appInstallationUtility = v2->_appInstallationUtility;
    v2->_appInstallationUtility = v3;

    v2->_unfairLock._os_unfair_lock_opaque = 0;
    [(FCAppInstallationObserver *)v2 _setAppInstalled:[(FCCAppInstallationUtility *)v2->_appInstallationUtility fitnessAppInstalled]];
    v5 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v5 addObserver:v2 selector:sel__applicationsInstalled_ name:*MEMORY[0x1E4F659D8] object:0];

    v6 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v6 addObserver:v2 selector:sel__applicationsUninstalled_ name:*MEMORY[0x1E4F659E8] object:0];
  }
  return v2;
}

- (BOOL)fitnessAppInstalled
{
  v2 = self;
  p_unfairLock = &self->_unfairLock;
  os_unfair_lock_lock(&self->_unfairLock);
  LOBYTE(v2) = v2->_isAppInstalled;
  os_unfair_lock_unlock(p_unfairLock);
  return (char)v2;
}

- (void)_setAppInstalled:(BOOL)a3
{
  p_unfairLock = &self->_unfairLock;
  os_unfair_lock_lock(&self->_unfairLock);
  self->_isAppInstalled = a3;
  os_unfair_lock_unlock(p_unfairLock);
}

- (void)_applicationsInstalled:(id)a3
{
  v4 = [a3 userInfo];
  id v5 = [v4 objectForKeyedSubscript:*MEMORY[0x1E4F659D0]];

  if ([v5 containsObject:*MEMORY[0x1E4F61FF8]]) {
    [(FCAppInstallationObserver *)self _updateApplicationInstalled];
  }
}

- (void)_applicationsUninstalled:(id)a3
{
  v4 = [a3 userInfo];
  id v5 = [v4 objectForKeyedSubscript:*MEMORY[0x1E4F659E0]];

  if ([v5 containsObject:*MEMORY[0x1E4F61FF8]]) {
    [(FCAppInstallationObserver *)self _updateApplicationInstalled];
  }
}

- (void)_updateApplicationInstalled
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  int v3 = [(FCAppInstallationObserver *)self fitnessAppInstalled];
  uint64_t v4 = [(FCCAppInstallationUtility *)self->_appInstallationUtility fitnessAppInstalled];
  if (v3 != v4)
  {
    int v5 = v4;
    [(FCAppInstallationObserver *)self _setAppInstalled:v4];
    _HKInitializeLogging();
    v6 = *MEMORY[0x1E4F29F08];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29F08], OS_LOG_TYPE_DEFAULT))
    {
      v8[0] = 67240448;
      v8[1] = v3;
      __int16 v9 = 1026;
      int v10 = v5;
      _os_log_impl(&dword_1D3B3E000, v6, OS_LOG_TYPE_DEFAULT, "Fitness app installed state changed: %{public}d -> %{public}d", (uint8_t *)v8, 0xEu);
    }
    v7 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v7 postNotificationName:@"FCFitnessInstallStateChangedNotification" object:0];
  }
}

- (void).cxx_destruct
{
}

@end