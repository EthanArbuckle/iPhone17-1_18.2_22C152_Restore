@interface AddDispatchSourceForEventPort
@end

@implementation AddDispatchSourceForEventPort

void ___AddDispatchSourceForEventPort_block_invoke(uint64_t a1)
{
  __lastRecievedPort = dispatch_source_get_handle(*(dispatch_source_t *)(a1 + 32));
  uint64_t v1 = ReceiveEvent(__lastRecievedPort);
  _PurpleEventCallback(v1);
  while (_queue)
    _PurpleEventCallback(0);
}

@end