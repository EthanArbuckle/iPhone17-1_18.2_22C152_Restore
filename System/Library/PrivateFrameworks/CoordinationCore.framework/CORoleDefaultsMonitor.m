@interface CORoleDefaultsMonitor
- (CORoleDefaultsMonitor)initWithDelegate:(id)a3;
- (CORoleDefaultsMonitorDelegate)delegate;
- (NSUserDefaults)SoundBoardDefaults;
- (unint64_t)_getCurrentResult;
- (unint64_t)result;
- (void)_notifyDelegate:(unint64_t)a3;
- (void)_updateState;
- (void)activate;
- (void)dealloc;
- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6;
- (void)setResult:(unint64_t)a3;
@end

@implementation CORoleDefaultsMonitor

- (CORoleDefaultsMonitor)initWithDelegate:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)CORoleDefaultsMonitor;
  v5 = [(CORoleDefaultsMonitor *)&v10 init];
  v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->_delegate, v4);
    v6->_result = 0;
    uint64_t v7 = [objc_alloc(MEMORY[0x263EFFA40]) initWithSuiteName:@"com.apple.soundboard"];
    SoundBoardDefaults = v6->_SoundBoardDefaults;
    v6->_SoundBoardDefaults = (NSUserDefaults *)v7;
  }
  return v6;
}

- (void)dealloc
{
  v3 = [(CORoleDefaultsMonitor *)self SoundBoardDefaults];
  [v3 removeObserver:self forKeyPath:@"stereo_leader_info" context:0];

  id v4 = [(CORoleDefaultsMonitor *)self SoundBoardDefaults];
  [v4 removeObserver:self forKeyPath:@"stereo_temporary_leader" context:0];

  v5.receiver = self;
  v5.super_class = (Class)CORoleDefaultsMonitor;
  [(CORoleDefaultsMonitor *)&v5 dealloc];
}

- (void)activate
{
  [(NSUserDefaults *)self->_SoundBoardDefaults addObserver:self forKeyPath:@"stereo_leader_info" options:4 context:0];
  SoundBoardDefaults = self->_SoundBoardDefaults;
  [(NSUserDefaults *)SoundBoardDefaults addObserver:self forKeyPath:@"stereo_temporary_leader" options:4 context:0];
}

- (void)_updateState
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  unint64_t v3 = [(CORoleDefaultsMonitor *)self result];
  unint64_t v4 = [(CORoleDefaultsMonitor *)self _getCurrentResult];
  if (v4 != v3)
  {
    unint64_t v5 = v4;
    v6 = COCoreLogForCategory(4);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      int v7 = 134218240;
      unint64_t v8 = v3;
      __int16 v9 = 2048;
      unint64_t v10 = v5;
      _os_log_impl(&dword_2217C1000, v6, OS_LOG_TYPE_DEFAULT, "Monitored result changed from %lu to %lu", (uint8_t *)&v7, 0x16u);
    }

    [(CORoleDefaultsMonitor *)self setResult:v5];
    [(CORoleDefaultsMonitor *)self _notifyDelegate:v5];
  }
}

- (unint64_t)_getCurrentResult
{
  v2 = [(CORoleDefaultsMonitor *)self SoundBoardDefaults];
  char v3 = [v2 BOOLForKey:@"stereo_temporary_leader"];
  unint64_t v4 = [v2 dictionaryForKey:@"stereo_leader_info"];
  unint64_t v5 = v4;
  if (v3)
  {
    unint64_t v6 = 2;
  }
  else if (v4)
  {
    int v7 = [v4 valueForKey:@"stereo_leader"];
    int v8 = [v7 BOOLValue];

    if (v8) {
      unint64_t v6 = 2;
    }
    else {
      unint64_t v6 = 3;
    }
  }
  else
  {
    unint64_t v6 = 1;
  }

  return v6;
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  id v7 = a3;
  if (([v7 isEqualToString:@"stereo_leader_info"] & 1) != 0
    || [v7 isEqualToString:@"stereo_temporary_leader"])
  {
    [(CORoleDefaultsMonitor *)self _updateState];
  }
}

- (void)_notifyDelegate:(unint64_t)a3
{
  unint64_t v5 = [(CORoleDefaultsMonitor *)self delegate];
  if (v5)
  {
    id v6 = v5;
    [v5 monitor:self defaultChanged:a3];
    unint64_t v5 = v6;
  }
}

- (CORoleDefaultsMonitorDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (CORoleDefaultsMonitorDelegate *)WeakRetained;
}

- (unint64_t)result
{
  return self->_result;
}

- (void)setResult:(unint64_t)a3
{
  self->_result = a3;
}

- (NSUserDefaults)SoundBoardDefaults
{
  return self->_SoundBoardDefaults;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_SoundBoardDefaults, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end