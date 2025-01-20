@interface IRDaemon
- (IRDaemon)init;
- (void)_startServices;
- (void)run;
@end

@implementation IRDaemon

- (IRDaemon)init
{
  v6.receiver = self;
  v6.super_class = (Class)IRDaemon;
  v2 = [(IRDaemon *)&v6 init];
  v3 = v2;
  if (v2) {
    v4 = v2;
  }

  return v3;
}

- (void)run
{
  if (+[IRPlatformInfo isSupportedPlatform])
  {
    v3 = *MEMORY[0x263F50090];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F50090], OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v4 = 0;
      _os_log_impl(&dword_25418E000, v3, OS_LOG_TYPE_DEFAULT, "[IRDaemon] run", v4, 2u);
    }
    [(IRDaemon *)self _startServices];
  }
}

- (void)_startServices
{
  v3 = *MEMORY[0x263F50090];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F50090], OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)objc_super v6 = 0;
    _os_log_impl(&dword_25418E000, v3, OS_LOG_TYPE_DEFAULT, "[IRDaemon] startServices", v6, 2u);
  }
  v4 = objc_alloc_init(IRXPCServicesManager);
  xpcManager = self->_xpcManager;
  self->_xpcManager = v4;

  [(IRXPCServicesManager *)self->_xpcManager startServices];
}

- (void).cxx_destruct
{
}

@end