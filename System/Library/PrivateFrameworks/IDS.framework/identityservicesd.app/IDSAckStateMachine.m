@interface IDSAckStateMachine
- (BOOL)successful;
- (IDSAckStateMachine)init;
- (NSError)error;
- (int64_t)state;
- (void)setError:(id)a3;
- (void)setState:(int64_t)a3;
- (void)setSuccessful:(BOOL)a3;
@end

@implementation IDSAckStateMachine

- (IDSAckStateMachine)init
{
  v6.receiver = self;
  v6.super_class = (Class)IDSAckStateMachine;
  v2 = [(IDSAckStateMachine *)&v6 init];
  v3 = v2;
  if (v2)
  {
    error = v2->_error;
    v2->_state = 0;
    v2->_error = 0;
    v2->_successful = 1;
  }
  return v3;
}

- (int64_t)state
{
  return self->_state;
}

- (void)setState:(int64_t)a3
{
  self->_state = a3;
}

- (BOOL)successful
{
  return self->_successful;
}

- (void)setSuccessful:(BOOL)a3
{
  self->_successful = a3;
}

- (NSError)error
{
  return self->_error;
}

- (void)setError:(id)a3
{
}

- (void).cxx_destruct
{
}

@end