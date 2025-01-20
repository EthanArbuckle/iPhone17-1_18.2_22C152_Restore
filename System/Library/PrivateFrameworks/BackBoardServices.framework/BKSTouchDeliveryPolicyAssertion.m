@interface BKSTouchDeliveryPolicyAssertion
- (BKSTouchDeliveryPolicyAssertion)init;
- (id)endpoint;
- (void)dealloc;
- (void)invalidate;
@end

@implementation BKSTouchDeliveryPolicyAssertion

- (void).cxx_destruct
{
}

- (void)invalidate
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  if (self->_listener)
  {
    v3 = BKLogTouchDeliveryPolicy();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      listener = self->_listener;
      int v6 = 134217984;
      v7 = listener;
      _os_log_impl(&dword_18AA0B000, v3, OS_LOG_TYPE_DEFAULT, "TDPS client policy assertion invalidating <xpc_object:%p>", (uint8_t *)&v6, 0xCu);
    }

    v5 = self->_listener;
    self->_listener = 0;
  }
}

- (id)endpoint
{
  listener = self->_listener;
  if (!listener)
  {
    id v5 = [MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3B8] reason:@"Getting an endpoint from an invalidated BKSTouchDeliveryPolicyAssertion" userInfo:0];
    objc_exception_throw(v5);
  }
  xpc_endpoint_t v3 = xpc_endpoint_create(listener);
  return v3;
}

- (void)dealloc
{
  [(BKSTouchDeliveryPolicyAssertion *)self invalidate];
  v3.receiver = self;
  v3.super_class = (Class)BKSTouchDeliveryPolicyAssertion;
  [(BKSTouchDeliveryPolicyAssertion *)&v3 dealloc];
}

- (BKSTouchDeliveryPolicyAssertion)init
{
  v6.receiver = self;
  v6.super_class = (Class)BKSTouchDeliveryPolicyAssertion;
  v2 = [(BKSTouchDeliveryPolicyAssertion *)&v6 init];
  if (v2)
  {
    xpc_connection_t v3 = xpc_connection_create(0, 0);
    listener = v2->_listener;
    v2->_listener = v3;

    xpc_connection_set_event_handler(v2->_listener, &__block_literal_global_6841);
    xpc_connection_resume(v2->_listener);
  }
  return v2;
}

void __39__BKSTouchDeliveryPolicyAssertion_init__block_invoke(uint64_t a1, void *a2)
{
  connection = a2;
  if (MEMORY[0x18C124150]() == MEMORY[0x1E4F14578])
  {
    xpc_connection_set_event_handler(connection, &__block_literal_global_2);
    xpc_connection_resume(connection);
  }
}

@end