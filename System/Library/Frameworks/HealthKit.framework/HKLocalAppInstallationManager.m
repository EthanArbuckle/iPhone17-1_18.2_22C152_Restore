@interface HKLocalAppInstallationManager
- (HKLocalAppInstallationManager)initWithBundleIdentifier:(id)a3;
- (id)isWatchAppInstalledWithError:(id *)a3;
- (void)applicationsDidInstall:(id)a3;
- (void)applicationsDidUninstall:(id)a3;
- (void)startObserving;
- (void)stopObserving;
@end

@implementation HKLocalAppInstallationManager

- (HKLocalAppInstallationManager)initWithBundleIdentifier:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)HKLocalAppInstallationManager;
  return [(HKWatchAppInstallationManager *)&v4 initWithBundleIdentifier:a3];
}

- (id)isWatchAppInstalledWithError:(id *)a3
{
  objc_super v4 = NSNumber;
  v5 = objc_msgSend(MEMORY[0x1E4F223E0], "defaultWorkspace", a3);
  v6 = [(HKWatchAppInstallationManager *)self bundleIdentifier];
  v7 = objc_msgSend(v4, "numberWithBool:", objc_msgSend(v5, "applicationIsInstalled:", v6));

  return v7;
}

- (void)startObserving
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  _HKInitializeLogging();
  v3 = HKLogInfrastructure();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    int v5 = 138543362;
    v6 = self;
    _os_log_impl(&dword_19C023000, v3, OS_LOG_TYPE_DEFAULT, "[%{public}@] Starting observation", (uint8_t *)&v5, 0xCu);
  }

  objc_super v4 = [MEMORY[0x1E4F223E0] defaultWorkspace];
  [v4 addObserver:self];
}

- (void)stopObserving
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  _HKInitializeLogging();
  v3 = HKLogInfrastructure();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    int v5 = 138543362;
    v6 = self;
    _os_log_impl(&dword_19C023000, v3, OS_LOG_TYPE_DEFAULT, "[%{public}@] Stopping observation", (uint8_t *)&v5, 0xCu);
  }

  objc_super v4 = [MEMORY[0x1E4F223E0] defaultWorkspace];
  [v4 removeObserver:self];
}

- (void)applicationsDidInstall:(id)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  uint64_t v5 = [v4 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v15;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v15 != v7) {
          objc_enumerationMutation(v4);
        }
        v9 = [*(id *)(*((void *)&v14 + 1) + 8 * v8) bundleIdentifier];
        v10 = [(HKWatchAppInstallationManager *)self bundleIdentifier];
        int v11 = [v9 isEqualToString:v10];

        if (v11)
        {
          queue = self->super._queue;
          block[0] = MEMORY[0x1E4F143A8];
          block[1] = 3221225472;
          block[2] = __56__HKLocalAppInstallationManager_applicationsDidInstall___block_invoke;
          block[3] = &unk_1E58BBA00;
          block[4] = self;
          dispatch_async(queue, block);
        }
        ++v8;
      }
      while (v6 != v8);
      uint64_t v6 = [v4 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v6);
  }
}

uint64_t __56__HKLocalAppInstallationManager_applicationsDidInstall___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_queue_notifyObservers");
}

- (void)applicationsDidUninstall:(id)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  uint64_t v5 = [v4 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v15;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v15 != v7) {
          objc_enumerationMutation(v4);
        }
        v9 = [*(id *)(*((void *)&v14 + 1) + 8 * v8) bundleIdentifier];
        v10 = [(HKWatchAppInstallationManager *)self bundleIdentifier];
        int v11 = [v9 isEqualToString:v10];

        if (v11)
        {
          queue = self->super._queue;
          block[0] = MEMORY[0x1E4F143A8];
          block[1] = 3221225472;
          block[2] = __58__HKLocalAppInstallationManager_applicationsDidUninstall___block_invoke;
          block[3] = &unk_1E58BBA00;
          block[4] = self;
          dispatch_async(queue, block);
        }
        ++v8;
      }
      while (v6 != v8);
      uint64_t v6 = [v4 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v6);
  }
}

uint64_t __58__HKLocalAppInstallationManager_applicationsDidUninstall___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_queue_notifyObservers");
}

@end