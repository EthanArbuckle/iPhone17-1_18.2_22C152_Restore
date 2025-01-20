@interface _GEOCountryConfigurationUpdateHandler
- (OS_dispatch_queue)callbackQueue;
- (id)callback;
- (void)setCallback:(id)a3;
- (void)setCallbackQueue:(id)a3;
@end

@implementation _GEOCountryConfigurationUpdateHandler

- (void)setCallbackQueue:(id)a3
{
}

- (void)setCallback:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_callbackQueue, 0);

  objc_storeStrong(&self->_callback, 0);
}

- (id)callback
{
  return self->_callback;
}

- (OS_dispatch_queue)callbackQueue
{
  return self->_callbackQueue;
}

@end