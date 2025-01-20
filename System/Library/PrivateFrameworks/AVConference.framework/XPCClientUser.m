@interface XPCClientUser
- (OS_dispatch_queue)queue;
- (XPCClientUser)init;
- (id)block;
- (int)eventLogLevel;
- (void)dealloc;
- (void)setBlock:(id)a3;
- (void)setEventLogLevel:(int)a3;
- (void)setQueue:(id)a3;
@end

@implementation XPCClientUser

- (int)eventLogLevel
{
  return self->_eventLogLevel;
}

- (void)setQueue:(id)a3
{
}

- (void)setEventLogLevel:(int)a3
{
  self->_eventLogLevel = a3;
}

- (void)setBlock:(id)a3
{
}

- (XPCClientUser)init
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  v3.receiver = self;
  v3.super_class = (Class)XPCClientUser;
  result = [(XPCClientUser *)&v3 init];
  if (result) {
    result->_eventLogLevel = 7;
  }
  return result;
}

- (OS_dispatch_queue)queue
{
  return self->queue;
}

- (id)block
{
  return self->block;
}

- (void)dealloc
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  queue = self->queue;
  if (queue) {
    dispatch_release(queue);
  }

  v4.receiver = self;
  v4.super_class = (Class)XPCClientUser;
  [(XPCClientUser *)&v4 dealloc];
}

@end