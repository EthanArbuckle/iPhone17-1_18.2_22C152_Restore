@interface FIUITransition
- (FIUIState)toState;
- (NSString)label;
- (id)gate;
- (id)handler;
- (int64_t)event;
- (void)setEvent:(int64_t)a3;
- (void)setGate:(id)a3;
- (void)setHandler:(id)a3;
- (void)setLabel:(id)a3;
- (void)setToState:(id)a3;
@end

@implementation FIUITransition

- (void)setToState:(id)a3
{
}

- (void)setHandler:(id)a3
{
}

- (void)setGate:(id)a3
{
}

- (void)setEvent:(int64_t)a3
{
  self->_event = a3;
}

- (void)setLabel:(id)a3
{
}

- (NSString)label
{
  return self->_label;
}

- (FIUIState)toState
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_toState);
  return (FIUIState *)WeakRetained;
}

- (int64_t)event
{
  return self->_event;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_gate, 0);
  objc_storeStrong(&self->_handler, 0);
  objc_destroyWeak((id *)&self->_toState);
  objc_storeStrong((id *)&self->_label, 0);
}

- (id)handler
{
  return self->_handler;
}

- (id)gate
{
  return self->_gate;
}

@end