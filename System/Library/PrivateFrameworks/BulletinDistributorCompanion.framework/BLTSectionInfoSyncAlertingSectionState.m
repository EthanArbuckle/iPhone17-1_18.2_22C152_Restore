@interface BLTSectionInfoSyncAlertingSectionState
- (OS_dispatch_queue)clientQueue;
- (id)clientCompletion;
- (id)description;
- (unint64_t)state;
- (void)setClientCompletion:(id)a3;
- (void)setClientQueue:(id)a3;
- (void)setState:(unint64_t)a3;
@end

@implementation BLTSectionInfoSyncAlertingSectionState

- (id)description
{
  v3 = [MEMORY[0x263F29C40] builderWithObject:self];
  id v4 = (id)[v3 appendUnsignedInteger:self->_state withName:@"state"];
  v5 = [v3 build];

  return v5;
}

- (unint64_t)state
{
  return self->_state;
}

- (void)setState:(unint64_t)a3
{
  self->_state = a3;
}

- (id)clientCompletion
{
  return self->_clientCompletion;
}

- (void)setClientCompletion:(id)a3
{
}

- (OS_dispatch_queue)clientQueue
{
  return self->_clientQueue;
}

- (void)setClientQueue:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_clientQueue, 0);
  objc_storeStrong(&self->_clientCompletion, 0);
}

@end