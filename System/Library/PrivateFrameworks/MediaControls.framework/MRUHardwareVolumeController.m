@interface MRUHardwareVolumeController
+ (MRUHardwareVolumeController)sharedInstance;
- (MRUHardwareVolumeController)init;
- (NSArray)invalidators;
- (NSHashTable)assertions;
- (id)requestControlsForVolumeDataSource:(id)a3 reason:(id)a4;
- (void)relinquishHardwareVolumeButtons;
- (void)setAssertions:(id)a3;
- (void)setInvalidators:(id)a3;
- (void)unregisterAssertion:(id)a3;
- (void)updateControlsForAssertion:(id)a3;
@end

@implementation MRUHardwareVolumeController

+ (MRUHardwareVolumeController)sharedInstance
{
  if (sharedInstance_onceToken_0 != -1) {
    dispatch_once(&sharedInstance_onceToken_0, &__block_literal_global_36);
  }
  v2 = (void *)sharedInstance___sharedInstance_0;

  return (MRUHardwareVolumeController *)v2;
}

void __45__MRUHardwareVolumeController_sharedInstance__block_invoke()
{
  uint64_t v0 = objc_opt_new();
  v1 = (void *)sharedInstance___sharedInstance_0;
  sharedInstance___sharedInstance_0 = v0;
}

- (MRUHardwareVolumeController)init
{
  v6.receiver = self;
  v6.super_class = (Class)MRUHardwareVolumeController;
  v2 = [(MRUHardwareVolumeController *)&v6 init];
  if (v2)
  {
    uint64_t v3 = [MEMORY[0x1E4F28D30] weakObjectsHashTable];
    assertions = v2->_assertions;
    v2->_assertions = (NSHashTable *)v3;
  }
  return v2;
}

- (id)requestControlsForVolumeDataSource:(id)a3 reason:(id)a4
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  v8 = [[MRUHardwareVolumeAssertion alloc] initWithHardwareVolumeController:self volumeDataSource:v6 reason:v7];

  v9 = MCLogCategoryVolume();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    int v12 = 138543618;
    id v13 = v6;
    __int16 v14 = 2114;
    v15 = v8;
    _os_log_impl(&dword_1AE7DF000, v9, OS_LOG_TYPE_DEFAULT, "%{public}@ requesting control for: %{public}@", (uint8_t *)&v12, 0x16u);
  }

  v10 = [(MRUHardwareVolumeController *)self assertions];
  [v10 addObject:v8];

  [(MRUHardwareVolumeController *)self updateControlsForAssertion:v8];

  return v8;
}

- (void)unregisterAssertion:(id)a3
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = MCLogCategoryVolume();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v10 = 138543618;
    uint64_t v11 = objc_opt_class();
    __int16 v12 = 2114;
    id v13 = v4;
    _os_log_impl(&dword_1AE7DF000, v5, OS_LOG_TYPE_DEFAULT, "%{public}@ relinquishing control for: %{public}@", (uint8_t *)&v10, 0x16u);
  }

  id v6 = [(MRUHardwareVolumeController *)self assertions];
  [v6 removeObject:v4];

  id v7 = [(MRUHardwareVolumeController *)self assertions];
  v8 = [v7 objectEnumerator];
  v9 = [v8 nextObject];

  [(MRUHardwareVolumeController *)self updateControlsForAssertion:v9];
}

- (void)updateControlsForAssertion:(id)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  [(MRUHardwareVolumeController *)self relinquishHardwareVolumeButtons];
  v5 = [v4 volumeDataSource];
  if ([v5 applicationShouldOverrideHardwareVolumeBehavior])
  {
    id v6 = MCLogCategoryVolume();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543618;
      uint64_t v16 = objc_opt_class();
      __int16 v17 = 2114;
      id v18 = v4;
      _os_log_impl(&dword_1AE7DF000, v6, OS_LOG_TYPE_DEFAULT, "%{public}@ creating consumers for: %{public}@", buf, 0x16u);
    }

    id v7 = [[MRUHardwareVolumeDataSource alloc] initWithVolumeDataSource:v5];
    v8 = [MEMORY[0x1E4FA6AA8] sharedInstance];
    v9 = [v8 beginConsumingPressesForButtonKind:4 eventConsumer:v7 priority:0];
    int v10 = objc_msgSend(MEMORY[0x1E4FA6AA8], "sharedInstance", v9);
    uint64_t v11 = [v10 beginConsumingPressesForButtonKind:3 eventConsumer:v7 priority:0];
    v14[1] = v11;
    __int16 v12 = [MEMORY[0x1E4F1C978] arrayWithObjects:v14 count:2];
    invalidators = self->_invalidators;
    self->_invalidators = v12;
  }
}

- (void)relinquishHardwareVolumeButtons
{
  [(NSArray *)self->_invalidators makeObjectsPerformSelector:sel_invalidate];
  invalidators = self->_invalidators;
  self->_invalidators = 0;
}

- (NSHashTable)assertions
{
  return self->_assertions;
}

- (void)setAssertions:(id)a3
{
}

- (NSArray)invalidators
{
  return self->_invalidators;
}

- (void)setInvalidators:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_invalidators, 0);

  objc_storeStrong((id *)&self->_assertions, 0);
}

@end