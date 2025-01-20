@interface GTTransport
@end

@implementation GTTransport

void __34__GTTransport_relayMessage_error___block_invoke(uint64_t a1)
{
  if (*(unsigned char *)(a1 + 48)) {
    dispatch_resume(*(dispatch_object_t *)(*(void *)(a1 + 32) + 24));
  }
  if (!*(unsigned char *)(*(void *)(a1 + 32) + 52))
  {
    [*(id *)(a1 + 32) _sendMessage:*(void *)(a1 + 40) error:0];
  }
}

id __63__GTTransport_send_inReplyTo_error_replyQueue_timeout_handler___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _handleReplyTimeout:*(unsigned int *)(a1 + 40) count:0];
}

id __63__GTTransport_send_inReplyTo_error_replyQueue_timeout_handler___block_invoke_2(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 72) setObject:*(void *)(a1 + 40) forIntKey:*(unsigned int *)(a1 + 48)];
}

void __63__GTTransport_send_inReplyTo_error_replyQueue_timeout_handler___block_invoke_3(uint64_t a1)
{
  if (*(unsigned char *)(a1 + 60)) {
    dispatch_resume(*(dispatch_object_t *)(*(void *)(a1 + 32) + 24));
  }
  if (*(unsigned char *)(*(void *)(a1 + 32) + 52))
  {
    [*(id *)(a1 + 40) dispatchError:[GTError_replayer errorWithDomain:@"DYErrorDomain" code:32 userInfo:0]];
    atomic_fetch_add((atomic_uint *volatile)(*(void *)(a1 + 32) + 48), 0xFFFFFFFF);
    v10 = *(void **)(a1 + 48);
    [v10 setEncodedAttributes:0];
  }
  else
  {
    id v13 = 0;
    if (*(void *)(a1 + 40)) {
      v3 = &v13;
    }
    else {
      v3 = 0;
    }
    id v4 = [*(id *)(a1 + 32) _sendMessage:*(void *)(a1 + 48) error:v3];
    id v5 = v13;
    atomic_fetch_add((atomic_uint *volatile)(*(void *)(a1 + 32) + 48), 0xFFFFFFFF);
    if (v4 == (id)-1)
    {
      uint64_t v6 = *(void *)(a1 + 40);
      if (v6)
      {
        uint64_t v7 = *(void *)(a1 + 32);
        v8 = *(NSObject **)(v7 + 24);
        block[0] = _NSConcreteStackBlock;
        block[1] = 3221225472;
        block[2] = __63__GTTransport_send_inReplyTo_error_replyQueue_timeout_handler___block_invoke_4;
        block[3] = &unk_7452A0;
        int v12 = *(_DWORD *)(a1 + 56);
        block[4] = v7;
        block[5] = v6;
        block[6] = v13;
        dispatch_async(v8, block);
      }
    }
  }
}

id __63__GTTransport_send_inReplyTo_error_replyQueue_timeout_handler___block_invoke_4(uint64_t a1)
{
  [*(id *)(*(void *)(a1 + 32) + 72) removeObjectForIntKey:*(unsigned int *)(a1 + 56)];
  v2 = *(void **)(a1 + 40);
  uint64_t v3 = *(void *)(a1 + 48);

  return [v2 dispatchError:v3];
}

uint64_t __30__GTTransport_setSynchronous___block_invoke(uint64_t result)
{
  v1 = &_dispatch_sync;
  if (!*(unsigned char *)(result + 40)) {
    v1 = &_dispatch_async;
  }
  *(void *)(*(void *)(result + 32) + 96) = v1;
  return result;
}

id *__37__GTTransport__scheduleInvalidation___block_invoke(id *result)
{
  if (!*((void *)result[4] + 10))
  {
    v1 = result;
    *((void *)result[4] + 10) = result[5];
    id v2 = v1[4];
    return (id *)[v2 _invalidate];
  }
  return result;
}

void __32__GTTransport__dispatchMessage___block_invoke(void *a1)
{
  uint64_t v1 = a1[4];
  if (!*(unsigned char *)(v1 + 24))
  {
    char v3 = (*(uint64_t (**)(void))(*(void *)(v1 + 16) + 16))();
    uint64_t v4 = a1[4];
    if (v3)
    {
      int64_t v5 = *(void *)(v4 + 32);
      if (v5)
      {
        dispatch_time_t v6 = dispatch_time(0, v5);
        uint64_t v7 = a1[6];
        v8 = *(NSObject **)(v7 + 24);
        v11[0] = _NSConcreteStackBlock;
        v11[1] = 3221225472;
        v11[2] = __32__GTTransport__dispatchMessage___block_invoke_3;
        v11[3] = &unk_7463C0;
        v11[4] = v7;
        v11[5] = a1[7];
        dispatch_after(v6, v8, v11);
      }
    }
    else
    {
      *(unsigned char *)(v4 + 24) = 1;
      uint64_t v9 = a1[6];
      v10 = *(NSObject **)(v9 + 24);
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472;
      block[2] = __32__GTTransport__dispatchMessage___block_invoke_2;
      block[3] = &unk_745228;
      block[4] = v9;
      int v13 = *((_DWORD *)a1 + 14);
      dispatch_async(v10, block);
    }
  }
}

id __32__GTTransport__dispatchMessage___block_invoke_2(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 72) removeObjectForIntKey:*(unsigned int *)(a1 + 40)];
}

id __32__GTTransport__dispatchMessage___block_invoke_3(uint64_t a1)
{
  return [*(id *)(a1 + 32) _handleReplyTimeout:*(unsigned int *)(a1 + 40) count:*(unsigned int *)(a1 + 44)];
}

id __26__GTTransport__invalidate__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  return [a3 dispatchError:*(void *)(*(void *)(a1 + 32) + 80)];
}

id __29__GTTransport__cancelSource___block_invoke(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 64) removeObject:*(void *)(a1 + 40)];
}

void *__31__GTTransport__activateSource___block_invoke(void *result)
{
  uint64_t v1 = result[4];
  if (!*(unsigned char *)(v1 + 52))
  {
    id v2 = result;
    result = [*(id *)(v1 + 64) addObject:result[5]];
    *(unsigned char *)(*(void *)(v2[6] + 8) + 24) = 1;
  }
  return result;
}

void *__34__GTTransport_newSourceWithQueue___block_invoke(void *result)
{
  if (!*(unsigned char *)(result[4] + 52))
  {
    uint64_t v1 = result;
    result = [[GTTransportSource_replayer alloc] _initWithQueue:v1[5] transport:v1[4]];
    *(void *)(*(void *)(v1[6] + 8) + 40) = result;
  }
  return result;
}

id __18__GTTransport_url__block_invoke(uint64_t a1)
{
  id result = *(id *)(*(void *)(a1 + 32) + 8);
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = result;
  return result;
}

@end