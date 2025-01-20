@interface CPDistributedMessagingDelayedReplyContext
- (BOOL)portPassing;
- (CPDistributedMessagingDelayedReplyContext)initWithReplyPort:(unsigned int)a3 portPassing:(BOOL)a4;
- (unsigned)replyPort;
- (void)dealloc;
- (void)setPortPassing:(BOOL)a3;
- (void)setReplyPort:(unsigned int)a3;
@end

@implementation CPDistributedMessagingDelayedReplyContext

- (CPDistributedMessagingDelayedReplyContext)initWithReplyPort:(unsigned int)a3 portPassing:(BOOL)a4
{
  v7.receiver = self;
  v7.super_class = (Class)CPDistributedMessagingDelayedReplyContext;
  result = [(CPDistributedMessagingDelayedReplyContext *)&v7 init];
  if (result)
  {
    result->_replyPort = a3;
    result->_portPassing = a4;
  }
  return result;
}

- (void)dealloc
{
  mach_port_name_t replyPort = self->_replyPort;
  if (replyPort + 1 >= 2) {
    mach_port_deallocate(*MEMORY[0x1E4F14960], replyPort);
  }
  v4.receiver = self;
  v4.super_class = (Class)CPDistributedMessagingDelayedReplyContext;
  [(CPDistributedMessagingDelayedReplyContext *)&v4 dealloc];
}

- (unsigned)replyPort
{
  return self->_replyPort;
}

- (void)setReplyPort:(unsigned int)a3
{
  self->_mach_port_name_t replyPort = a3;
}

- (BOOL)portPassing
{
  return self->_portPassing;
}

- (void)setPortPassing:(BOOL)a3
{
  self->_portPassing = a3;
}

@end