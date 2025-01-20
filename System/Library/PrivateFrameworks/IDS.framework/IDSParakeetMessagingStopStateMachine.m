@interface IDSParakeetMessagingStopStateMachine
- (IMDispatchTimer)finalAckTimer;
- (NSString)identifier;
- (id)messageHandler;
- (unint64_t)state;
- (void)dealloc;
- (void)setFinalAckTimer:(id)a3;
- (void)setIdentifier:(id)a3;
- (void)setMessageHandler:(id)a3;
- (void)setState:(unint64_t)a3;
@end

@implementation IDSParakeetMessagingStopStateMachine

- (void)dealloc
{
  v3 = [(IDSParakeetMessagingStopStateMachine *)self finalAckTimer];
  [v3 invalidate];

  v4.receiver = self;
  v4.super_class = (Class)IDSParakeetMessagingStopStateMachine;
  [(IDSParakeetMessagingStopStateMachine *)&v4 dealloc];
}

- (NSString)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(id)a3
{
}

- (unint64_t)state
{
  return self->_state;
}

- (void)setState:(unint64_t)a3
{
  self->_state = a3;
}

- (id)messageHandler
{
  return self->_messageHandler;
}

- (void)setMessageHandler:(id)a3
{
}

- (IMDispatchTimer)finalAckTimer
{
  return self->_finalAckTimer;
}

- (void)setFinalAckTimer:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_finalAckTimer, 0);
  objc_storeStrong(&self->_messageHandler, 0);

  objc_storeStrong((id *)&self->_identifier, 0);
}

@end