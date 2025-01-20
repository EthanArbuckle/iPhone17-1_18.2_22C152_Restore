@interface DBSiriMonitor
- (BOOL)siriEnabled;
- (CARObserverHashTable)observers;
- (DBSiriMonitor)init;
- (void)_updateSiriEnabled;
- (void)addObserver:(id)a3;
- (void)dealloc;
- (void)removeObserver:(id)a3;
- (void)setObservers:(id)a3;
- (void)setSiriEnabled:(BOOL)a3;
@end

@implementation DBSiriMonitor

- (DBSiriMonitor)init
{
  v8.receiver = self;
  v8.super_class = (Class)DBSiriMonitor;
  v2 = [(DBSiriMonitor *)&v8 init];
  if (v2)
  {
    uint64_t v3 = [objc_alloc(MEMORY[0x263F30E18]) initWithProtocol:&unk_26E1E2D68];
    observers = v2->_observers;
    v2->_observers = (CARObserverHashTable *)v3;

    v5 = [MEMORY[0x263F08A00] defaultCenter];
    [v5 addObserver:v2 selector:sel_handleAssistantLanguageChanged_ name:*MEMORY[0x263F282E8] object:0];

    v6 = [MEMORY[0x263F08A00] defaultCenter];
    [v6 addObserver:v2 selector:sel_handleAssistantPreferencesChanged_ name:*MEMORY[0x263F28318] object:0];

    [(DBSiriMonitor *)v2 _updateSiriEnabled];
  }
  return v2;
}

- (void)dealloc
{
  uint64_t v3 = [MEMORY[0x263F08A00] defaultCenter];
  [v3 removeObserver:self];

  v4.receiver = self;
  v4.super_class = (Class)DBSiriMonitor;
  [(DBSiriMonitor *)&v4 dealloc];
}

- (void)setSiriEnabled:(BOOL)a3
{
  if (self->_siriEnabled != a3)
  {
    self->_siriEnabled = a3;
    id v4 = [(DBSiriMonitor *)self observers];
    [v4 siriMonitorDidChangeEnabled:self];
  }
}

- (void)addObserver:(id)a3
{
  id v4 = a3;
  id v5 = [(DBSiriMonitor *)self observers];
  [v5 addObserver:v4];
}

- (void)removeObserver:(id)a3
{
  id v4 = a3;
  id v5 = [(DBSiriMonitor *)self observers];
  [v5 removeObserver:v4];
}

- (void)_updateSiriEnabled
{
  uint64_t v3 = [MEMORY[0x263F285A0] sharedPreferences];
  uint64_t v4 = [v3 assistantIsEnabled];

  if (v4)
  {
    id v5 = [MEMORY[0x263F284A0] currentLanguageCode];
    if (v5) {
      uint64_t v4 = [MEMORY[0x263F284A0] assistantIsSupportedForLanguageCode:v5 error:0];
    }
    else {
      uint64_t v4 = 1;
    }
  }
  [(DBSiriMonitor *)self setSiriEnabled:v4];
}

- (BOOL)siriEnabled
{
  return self->_siriEnabled;
}

- (CARObserverHashTable)observers
{
  return (CARObserverHashTable *)objc_getProperty(self, a2, 16, 1);
}

- (void)setObservers:(id)a3
{
}

- (void).cxx_destruct
{
}

@end