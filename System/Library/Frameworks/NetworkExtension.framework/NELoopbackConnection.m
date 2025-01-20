@interface NELoopbackConnection
- (void)dealloc;
- (void)notifyInputHandler;
@end

@implementation NELoopbackConnection

- (void).cxx_destruct
{
}

- (void)dealloc
{
  v3 = ne_log_obj();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_19DDAF000, v3, OS_LOG_TYPE_DEFAULT, "Deallocating loopback connection", buf, 2u);
  }

  v4.receiver = self;
  v4.super_class = (Class)NELoopbackConnection;
  [(NELoopbackConnection *)&v4 dealloc];
}

- (void)notifyInputHandler
{
  if (result)
  {
    objc_getProperty(result, a2, 120, 1);
    return (void *)nw_queue_context_async();
  }
  return result;
}

uint64_t __42__NELoopbackConnection_notifyInputHandler__block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  if (v1) {
    uint64_t v2 = v1 + 40;
  }
  else {
    uint64_t v2 = 0;
  }
  uint64_t result = *(void *)(v2 + 48);
  if (result) {
    return (*(uint64_t (**)(void))(*(void *)(result + 24) + 64))();
  }
  return result;
}

uint64_t __90__NELoopbackConnection_addInputFramesToArray_maximumBytes_minimumBytes_maximumFrameCount___block_invoke(uint64_t a1)
{
  *(_DWORD *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) += nw_frame_unclaimed_length();
  return 1;
}

@end