@interface _ASCABLEPowerLogger
- (_ASCABLEPowerLogger)init;
- (void)dealloc;
- (void)logAuthenticationFinishedEventIfNeeded;
- (void)logAuthenticationStartedEventIfNeeded;
@end

@implementation _ASCABLEPowerLogger

- (_ASCABLEPowerLogger)init
{
  v6.receiver = self;
  v6.super_class = (Class)_ASCABLEPowerLogger;
  v2 = [(_ASCABLEPowerLogger *)&v6 init];
  v3 = v2;
  if (v2)
  {
    v2->_lock._os_unfair_lock_opaque = 0;
    v4 = v2;
  }

  return v3;
}

- (void)dealloc
{
  [(_ASCABLEPowerLogger *)self logAuthenticationFinishedEventIfNeeded];
  v3.receiver = self;
  v3.super_class = (Class)_ASCABLEPowerLogger;
  [(_ASCABLEPowerLogger *)&v3 dealloc];
}

- (void)logAuthenticationStartedEventIfNeeded
{
  v8[1] = *MEMORY[0x263EF8340];
  os_unfair_lock_lock(&self->_lock);
  id v3 = objc_alloc_init(MEMORY[0x263F663B8]);
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __60___ASCABLEPowerLogger_logAuthenticationStartedEventIfNeeded__block_invoke;
  v6[3] = &unk_26439ED00;
  v6[4] = self;
  [v3 setHandler:v6];
  if (!self->_didSendStartedEvent && PLShouldLogRegisteredEvent())
  {
    v4 = WBS_LOG_CHANNEL_PREFIXAuthorization();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v5 = 0;
      _os_log_impl(&dword_219326000, v4, OS_LOG_TYPE_INFO, "Sending caBLE authentication started PowerLog event", v5, 2u);
    }
    v7 = @"AuthenticationDidStart";
    v8[0] = MEMORY[0x263EFFA88];
    [NSDictionary dictionaryWithObjects:v8 forKeys:&v7 count:1];
    PLLogRegisteredEvent();
    self->_didSendStartedEvent = 1;
  }
}

- (void)logAuthenticationFinishedEventIfNeeded
{
  v8[1] = *MEMORY[0x263EF8340];
  os_unfair_lock_lock(&self->_lock);
  id v3 = objc_alloc_init(MEMORY[0x263F663B8]);
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __61___ASCABLEPowerLogger_logAuthenticationFinishedEventIfNeeded__block_invoke;
  v6[3] = &unk_26439ED00;
  v6[4] = self;
  [v3 setHandler:v6];
  if (self->_didSendStartedEvent && !self->_didSendFinishedEvent && PLShouldLogRegisteredEvent())
  {
    v4 = WBS_LOG_CHANNEL_PREFIXAuthorization();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v5 = 0;
      _os_log_impl(&dword_219326000, v4, OS_LOG_TYPE_INFO, "Sending caBLE authentication finished PowerLog event", v5, 2u);
    }
    v7 = @"AuthenticationDidStart";
    v8[0] = MEMORY[0x263EFFA80];
    [NSDictionary dictionaryWithObjects:v8 forKeys:&v7 count:1];
    PLLogRegisteredEvent();
    self->_didSendFinishedEvent = 1;
  }
}

@end