@interface DDDiscoverySession
- (id)eventHandler;
- (void)invalidate;
- (void)reportEvent:(DDDeviceEvent *)inEvent;
- (void)setEventHandler:(id)a3;
@end

@implementation DDDiscoverySession

- (void)invalidate
{
  self->_eventHandler = 0;
  MEMORY[0x270F9A758]();
}

- (void)reportEvent:(DDDeviceEvent *)inEvent
{
  v6 = inEvent;
  v4 = _Block_copy(self->_eventHandler);
  v5 = v4;
  if (v4) {
    (*((void (**)(void *, DDDeviceEvent *))v4 + 2))(v4, v6);
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