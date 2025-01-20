@interface HKWatchAppInstallationManager
- (HKWatchAppInstallationManager)initWithBundleIdentifier:(id)a3;
- (NSString)bundleIdentifier;
- (id)isWatchAppInstalledWithError:(id *)a3;
- (void)_queue_notifyObservers;
- (void)registerObserver:(id)a3;
- (void)registerObserver:(id)a3 queue:(id)a4;
- (void)startObserving;
- (void)stopObserving;
- (void)unregisterObserver:(id)a3;
@end

@implementation HKWatchAppInstallationManager

- (HKWatchAppInstallationManager)initWithBundleIdentifier:(id)a3
{
  id v5 = a3;
  v16.receiver = self;
  v16.super_class = (Class)HKWatchAppInstallationManager;
  v6 = [(HKWatchAppInstallationManager *)&v16 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_bundleIdentifier, a3);
    uint64_t v8 = HKCreateSerialDispatchQueue(v7, @"HKWatchAppInstallationManager private queue");
    queue = v7->_queue;
    v7->_queue = (OS_dispatch_queue *)v8;

    v10 = [HKObserverSet alloc];
    v11 = [(HKWatchAppInstallationManager *)v7 description];
    v12 = HKLogInfrastructure();
    uint64_t v13 = [(HKObserverSet *)v10 initWithName:v11 loggingCategory:v12];
    observers = v7->_observers;
    v7->_observers = (HKObserverSet *)v13;
  }
  return v7;
}

- (void)registerObserver:(id)a3
{
}

- (void)registerObserver:(id)a3 queue:(id)a4
{
  observers = self->_observers;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __56__HKWatchAppInstallationManager_registerObserver_queue___block_invoke;
  v5[3] = &unk_1E58BBA00;
  v5[4] = self;
  [(HKObserverSet *)observers registerObserver:a3 queue:a4 runIfFirstObserver:v5];
}

uint64_t __56__HKWatchAppInstallationManager_registerObserver_queue___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) startObserving];
}

- (void)unregisterObserver:(id)a3
{
  observers = self->_observers;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __52__HKWatchAppInstallationManager_unregisterObserver___block_invoke;
  v4[3] = &unk_1E58BBA00;
  v4[4] = self;
  [(HKObserverSet *)observers unregisterObserver:a3 runIfLastObserver:v4];
}

uint64_t __52__HKWatchAppInstallationManager_unregisterObserver___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) stopObserving];
}

- (void)_queue_notifyObservers
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  observers = self->_observers;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __55__HKWatchAppInstallationManager__queue_notifyObservers__block_invoke;
  v4[3] = &unk_1E58BE518;
  v4[4] = self;
  [(HKObserverSet *)observers notifyObservers:v4];
}

uint64_t __55__HKWatchAppInstallationManager__queue_notifyObservers__block_invoke(uint64_t a1, void *a2)
{
  return [a2 watchAppInstallationManagerDidObserveChange:*(void *)(a1 + 32)];
}

- (NSString)bundleIdentifier
{
  return self->_bundleIdentifier;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_bundleIdentifier, 0);
  objc_storeStrong((id *)&self->_observers, 0);

  objc_storeStrong((id *)&self->_queue, 0);
}

- (id)isWatchAppInstalledWithError:(id *)a3
{
  return 0;
}

- (void)startObserving
{
  objc_opt_class();
  OUTLINED_FUNCTION_0_2();

  NSRequestConcreteImplementation();
}

- (void)stopObserving
{
  objc_opt_class();
  OUTLINED_FUNCTION_0_2();

  NSRequestConcreteImplementation();
}

@end