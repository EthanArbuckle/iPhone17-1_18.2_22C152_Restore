@interface HAP2CoAPIOConsumerInfo
- (HAP2CoAPIOConsumerInfo)initWithConsumer:(id)a3;
- (coap_session_t)session;
- (void)setSession:(coap_session_t *)a3;
@end

@implementation HAP2CoAPIOConsumerInfo

- (void)setSession:(coap_session_t *)a3
{
  self->_session = a3;
}

- (coap_session_t)session
{
  return self->_session;
}

- (HAP2CoAPIOConsumerInfo)initWithConsumer:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)HAP2CoAPIOConsumerInfo;
  result = [(HAP2CoAPIOConsumerWeakHolder *)&v4 initWithConsumer:a3];
  if (result) {
    result->_session = 0;
  }
  return result;
}

@end