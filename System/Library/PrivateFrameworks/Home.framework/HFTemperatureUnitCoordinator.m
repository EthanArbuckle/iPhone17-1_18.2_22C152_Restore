@interface HFTemperatureUnitCoordinator
+ (id)sharedCoordinator;
- (BOOL)isCelsius;
- (HFTemperatureUnitCoordinator)init;
- (NSHashTable)observers;
- (void)_temperatureUnitDidChange;
- (void)_updateIsCelsiusNotifyingObservers:(BOOL)a3;
- (void)registerObserver:(id)a3;
- (void)setObservers:(id)a3;
- (void)unregisterObserver:(id)a3;
@end

@implementation HFTemperatureUnitCoordinator

- (void)unregisterObserver:(id)a3
{
  id v4 = a3;
  id v5 = [(HFTemperatureUnitCoordinator *)self observers];
  [v5 removeObject:v4];
}

+ (id)sharedCoordinator
{
  if (qword_26AB2F438 != -1) {
    dispatch_once(&qword_26AB2F438, &__block_literal_global_134);
  }
  v2 = (void *)_MergedGlobals_274;
  return v2;
}

- (BOOL)isCelsius
{
  return self->_isCelsius;
}

- (void)registerObserver:(id)a3
{
  id v4 = a3;
  id v5 = [(HFTemperatureUnitCoordinator *)self observers];
  [v5 addObject:v4];
}

- (NSHashTable)observers
{
  return self->_observers;
}

uint64_t __49__HFTemperatureUnitCoordinator_sharedCoordinator__block_invoke()
{
  uint64_t v0 = objc_opt_new();
  uint64_t v1 = _MergedGlobals_274;
  _MergedGlobals_274 = v0;
  return MEMORY[0x270F9A758](v0, v1);
}

- (HFTemperatureUnitCoordinator)init
{
  v6.receiver = self;
  v6.super_class = (Class)HFTemperatureUnitCoordinator;
  v2 = [(HFTemperatureUnitCoordinator *)&v6 init];
  if (v2)
  {
    v3 = [MEMORY[0x263F088B0] weakObjectsHashTable];
    [(HFTemperatureUnitCoordinator *)v2 setObservers:v3];

    [(HFTemperatureUnitCoordinator *)v2 _updateIsCelsiusNotifyingObservers:0];
    id v4 = [MEMORY[0x263F08A00] defaultCenter];
    [v4 addObserver:v2 selector:sel__temperatureUnitDidChange name:*MEMORY[0x263EFF458] object:0];
  }
  return v2;
}

- (void)setObservers:(id)a3
{
}

- (void)_updateIsCelsiusNotifyingObservers:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v19 = *MEMORY[0x263EF8340];
  BOOL isCelsius = self->_isCelsius;
  objc_super v6 = [MEMORY[0x263EFF960] currentLocale];
  v7 = [v6 objectForKey:*MEMORY[0x263EFF548]];
  self->_BOOL isCelsius = [v7 isEqualToString:*MEMORY[0x263EFF550]];

  if (v3 && isCelsius != self->_isCelsius)
  {
    long long v16 = 0u;
    long long v17 = 0u;
    long long v14 = 0u;
    long long v15 = 0u;
    v8 = [(HFTemperatureUnitCoordinator *)self observers];
    v9 = [v8 allObjects];

    uint64_t v10 = [v9 countByEnumeratingWithState:&v14 objects:v18 count:16];
    if (v10)
    {
      uint64_t v11 = v10;
      uint64_t v12 = *(void *)v15;
      do
      {
        uint64_t v13 = 0;
        do
        {
          if (*(void *)v15 != v12) {
            objc_enumerationMutation(v9);
          }
          [*(id *)(*((void *)&v14 + 1) + 8 * v13++) temperatureUnitObserver:self didChangeTemperatureUnit:self->_isCelsius];
        }
        while (v11 != v13);
        uint64_t v11 = [v9 countByEnumeratingWithState:&v14 objects:v18 count:16];
      }
      while (v11);
    }
  }
}

- (void)_temperatureUnitDidChange
{
}

- (void).cxx_destruct
{
}

@end