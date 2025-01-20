@interface AVHapticSequenceEntry
- (AVHapticSequenceEntry)initWithHandler:(id)a3;
- (BOOL)detached;
- (BOOL)running;
- (id)handler;
- (void)setDetached:(BOOL)a3;
- (void)setHandler:(id)a3;
- (void)setRunning:(BOOL)a3;
@end

@implementation AVHapticSequenceEntry

- (AVHapticSequenceEntry)initWithHandler:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)AVHapticSequenceEntry;
  v5 = [(AVHapticSequenceEntry *)&v9 init];
  if (v5)
  {
    uint64_t v6 = MEMORY[0x1BA9F2D90](v4);
    id handler = v5->_handler;
    v5->_id handler = (id)v6;
  }
  return v5;
}

- (id)handler
{
  return objc_getProperty(self, a2, 8, 1);
}

- (void)setHandler:(id)a3
{
}

- (BOOL)running
{
  return self->_running;
}

- (void)setRunning:(BOOL)a3
{
  self->_running = a3;
}

- (BOOL)detached
{
  return self->_detached;
}

- (void)setDetached:(BOOL)a3
{
  self->_detached = a3;
}

- (void).cxx_destruct
{
}

@end