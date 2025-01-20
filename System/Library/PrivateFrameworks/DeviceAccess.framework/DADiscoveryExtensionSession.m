@interface DADiscoveryExtensionSession
- (id)eventHandler;
- (void)invalidate;
- (void)reportEvent:(id)a3;
- (void)setEventHandler:(id)a3;
@end

@implementation DADiscoveryExtensionSession

- (void)invalidate
{
  self->_eventHandler = 0;
  MEMORY[0x270F9A758]();
}

- (void)reportEvent:(id)a3
{
  id v6 = a3;
  v4 = _Block_copy(self->_eventHandler);
  v5 = v4;
  if (v4) {
    (*((void (**)(void *, id))v4 + 2))(v4, v6);
  }
}

- (id)eventHandler
{
  return self->_eventHandler;
}

- (void)setEventHandler:(id)a3
{
}

- (void).cxx_destruct
{
}

@end