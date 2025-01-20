@interface _HDProcessQueryCollection
- (id)queryServers;
- (void)queue_cancelStateChangeTimer;
@end

@implementation _HDProcessQueryCollection

- (id)queryServers
{
  if (a1)
  {
    a1 = [a1[1] allValues];
    uint64_t v1 = vars8;
  }
  return a1;
}

- (void)queue_cancelStateChangeTimer
{
  if (a1)
  {
    dispatch_assert_queue_V2(*(dispatch_queue_t *)(a1 + 24));
    v2 = *(NSObject **)(a1 + 16);
    if (v2)
    {
      dispatch_source_cancel(v2);
      v3 = *(void **)(a1 + 16);
      *(void *)(a1 + 16) = 0;
    }
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_clientState, 0);
  objc_storeStrong((id *)&self->_processBundleIdentifier, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_timer, 0);

  objc_storeStrong((id *)&self->_queryServersByUUID, 0);
}

@end