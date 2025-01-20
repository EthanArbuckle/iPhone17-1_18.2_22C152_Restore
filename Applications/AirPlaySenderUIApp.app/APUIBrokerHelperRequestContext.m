@interface APUIBrokerHelperRequestContext
- (APUIBrokerHelperRequestContext)init;
- (NSDictionary)response;
- (OS_dispatch_semaphore)semaphore;
- (int)status;
- (void)setResponse:(id)a3;
- (void)setStatus:(int)a3;
@end

@implementation APUIBrokerHelperRequestContext

- (APUIBrokerHelperRequestContext)init
{
  v6.receiver = self;
  v6.super_class = (Class)APUIBrokerHelperRequestContext;
  v2 = [(APUIBrokerHelperRequestContext *)&v6 init];
  if (v2)
  {
    dispatch_semaphore_t v3 = dispatch_semaphore_create(0);
    semaphore = v2->_semaphore;
    v2->_semaphore = (OS_dispatch_semaphore *)v3;
  }
  return v2;
}

- (OS_dispatch_semaphore)semaphore
{
  return self->_semaphore;
}

- (NSDictionary)response
{
  return self->_response;
}

- (void)setResponse:(id)a3
{
}

- (int)status
{
  return self->_status;
}

- (void)setStatus:(int)a3
{
  self->_status = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_response, 0);

  objc_storeStrong((id *)&self->_semaphore, 0);
}

@end