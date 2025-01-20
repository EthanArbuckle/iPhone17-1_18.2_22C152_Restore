@interface NSRunLoop
- (CFRunLoopRef)getCFRunLoop;
- (NSRunLoopMode)currentMode;
- (id)_dperf;
- (id)_info;
- (id)_initWithRl:(id)a3 dperf:(id)a4 perft:(id)a5 info:(id)a6 ports:(id)a7;
- (id)_perft;
- (id)_ports;
- (void)_deallocHelper;
@end

@implementation NSRunLoop

- (id)_dperf
{
  return self->_dperf;
}

- (CFRunLoopRef)getCFRunLoop
{
  return (CFRunLoopRef)self->_rl;
}

- (id)_perft
{
  return self->_perft;
}

- (id)_initWithRl:(id)a3 dperf:(id)a4 perft:(id)a5 info:(id)a6 ports:(id)a7
{
  self->_rl = a3;
  self->_dperf = a4;
  self->_perft = a5;
  self->_info = a6;
  self->_ports = a7;
  return self;
}

- (id)_info
{
  return self->_info;
}

- (id)_ports
{
  return self->_ports;
}

- (void)_deallocHelper
{
  objc_sync_enter(self);
  id rl = self->_rl;
  id dperf = self->_dperf;
  id perft = self->_perft;
  id info = self->_info;
  id ports = self->_ports;
  *(_OWORD *)&self->_id rl = 0u;
  *(_OWORD *)&self->_id perft = 0u;
  self->_id ports = 0;

  objc_sync_exit(self);
}

- (NSRunLoopMode)currentMode
{
  return (NSRunLoopMode)objc_getProperty(self, a2, 48, 1);
}

@end