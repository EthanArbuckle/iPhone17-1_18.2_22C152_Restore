@interface TKSmartCardStateRequest
- (id)replyFlushedState;
- (id)replyNextState;
- (int64_t)stateWhenRequested;
- (unint64_t)activeStateNotifications;
- (void)setActiveStateNotifications:(unint64_t)a3;
- (void)setReplyFlushedState:(id)a3;
- (void)setReplyNextState:(id)a3;
- (void)setStateWhenRequested:(int64_t)a3;
@end

@implementation TKSmartCardStateRequest

- (unint64_t)activeStateNotifications
{
  return self->_activeStateNotifications;
}

- (void)setActiveStateNotifications:(unint64_t)a3
{
  self->_activeStateNotifications = a3;
}

- (int64_t)stateWhenRequested
{
  return self->_stateWhenRequested;
}

- (void)setStateWhenRequested:(int64_t)a3
{
  self->_stateWhenRequested = a3;
}

- (id)replyNextState
{
  return objc_getProperty(self, a2, 24, 1);
}

- (void)setReplyNextState:(id)a3
{
}

- (id)replyFlushedState
{
  return objc_getProperty(self, a2, 32, 1);
}

- (void)setReplyFlushedState:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_replyFlushedState, 0);

  objc_storeStrong(&self->_replyNextState, 0);
}

@end