@interface GTSharedMemoryTransport
@end

@implementation GTSharedMemoryTransport

id __34__GTSharedMemoryTransport_connect__block_invoke(uint64_t a1)
{
  v2 = *(unsigned char **)(a1 + 32);
  if (!v2[52])
  {
    unsigned int v7 = [v2 connected];
    uint64_t v8 = *(void *)(a1 + 32);
    if (v7 && !*(unsigned char *)(v8 + 304))
    {
      uint64_t v3 = 1;
      goto LABEL_3;
    }
    uint64_t v13 = 0;
    if (*(_DWORD *)(v8 + 300) == 2)
    {
      if (([(id)v8 _serverConnect:&v13] & 1) == 0)
      {
        v9 = *(unsigned char **)(a1 + 32);
LABEL_15:
        [v9 _tearDownSharedMemory];
        uint64_t v11 = 0;
        goto LABEL_16;
      }
    }
    else if (([(id)v8 _clientConnect:&v13] & 1) == 0)
    {
      v9 = *(unsigned char **)(a1 + 32);
      if (!v9[304]) {
        goto LABEL_15;
      }
      uint64_t v13 = 0;
      global_queue = dispatch_get_global_queue(0, 0);
      v12[0] = _NSConcreteStackBlock;
      v12[1] = 3221225472;
      v12[2] = __34__GTSharedMemoryTransport_connect__block_invoke_2;
      v12[3] = &unk_746170;
      v12[4] = v9;
      dispatch_async(global_queue, v12);
      v9 = *(unsigned char **)(a1 + 32);
      if (!v9[304]) {
        goto LABEL_15;
      }
    }
    uint64_t v11 = 1;
LABEL_16:
    [*(id *)(a1 + 40) setError:v13];
    return [*(id *)(a1 + 40) setResult:[NSNumber numberWithBool:v11]];
  }
  [*(id *)(a1 + 40) setError:[GTError_replayer errorWithDomain:@"DYErrorDomain" code:32 userInfo:0]];
  uint64_t v3 = 0;
LABEL_3:
  v4 = +[NSNumber numberWithBool:v3];
  v5 = *(void **)(a1 + 40);

  return [v5 setResult:v4];
}

id __34__GTSharedMemoryTransport_connect__block_invoke_2(uint64_t a1)
{
  if (([*(id *)(a1 + 32) _clientConnect:0] & 1) == 0)
  {
    do
      usleep(0x3D090u);
    while (![*(id *)(a1 + 32) _clientConnect:0]);
  }
  *(unsigned char *)(*(void *)(a1 + 32) + 304) = 0;
  id result = [*(id *)(*(void *)(a1 + 32) + 312) count];
  if (result)
  {
    uint64_t v3 = 0;
    unsigned int v4 = 1;
    do
    {
      id v5 = [*(id *)(*(void *)(a1 + 32) + 312) objectAtIndex:v3];
      v6 = *(void **)(a1 + 32);
      id v7 = [v5 message];
      id v8 = [v5 replyTo];
      id v9 = [v5 queue];
      id v10 = [v5 timeout];
      id v11 = [v5 replyBlock];
      v13.receiver = v6;
      v13.super_class = (Class)GTSharedMemoryTransport_replayer;
      [super send:v7 inReplyTo:v8 error:0 replyQueue:v9 timeout:v10 handler:v11];
      uint64_t v3 = v4;
      id result = [*(id *)(*(void *)(a1 + 32) + 312) count];
    }
    while ((unint64_t)result > v4++);
  }
  return result;
}

id __48__GTSharedMemoryTransport__createAndRunSources___block_invoke(id result)
{
  uint64_t v1 = *((void *)result + 4);
  if (*(unsigned char *)(v1 + 52))
  {
    *(unsigned char *)(*(void *)(*(void *)(*((void *)result + 5) + 8) + 40) + 24) = 1;
  }
  else
  {
    unsigned int v2 = atomic_load((unsigned int *)(v1 + 48));
    atomic_store(v2, *(unsigned int **)(*((void *)result + 4) + 232));
    return [*((id *)result + 4) _dequeueIncomingMessages];
  }
  return result;
}

void *__45__GTSharedMemoryTransport_setRelayTransport___block_invoke(void *result)
{
  uint64_t v1 = *(void **)(result[4] + 272);
  if (v1 != (void *)result[5])
  {
    unsigned int v2 = result;

    *(void *)(v2[4] + 272) = (id)v2[5];
    uint64_t v3 = v2[4];
    uint64_t v4 = *(void *)(v3 + 272);
    id v5 = (const char **)(v3 + 288);
    if (v4) {
      v6 = "_relayPacket";
    }
    else {
      v6 = "_accumulateMessageBytes";
    }
    void *v5 = v6;
    id v7 = (void *)v2[4];
    if (v7[36]) {
      uint64_t v8 = v7[36];
    }
    else {
      uint64_t v8 = 0;
    }
    id result = [v7 methodForSelector:v8];
    *(void *)(v2[4] + 280) = result;
    if (!*(void *)(v2[4] + 280)) {
      __assert_rtn("-[GTSharedMemoryTransport setRelayTransport:]_block_invoke", ", 0, "_consumeBytesIMP"");
    }
  }
  return result;
}

void *__34__GTSharedMemoryTransport_setUrl___block_invoke(void *result)
{
  uint64_t v1 = *(void **)(result[5] + 8);
  if ((void *)result[4] != v1)
  {
    unsigned int v2 = result;

    *(void *)(v2[5] + 8) = (id)v2[4];
    id result = objc_msgSend(objc_msgSend(*(id *)(v2[5] + 8), "scheme"), "isEqualToString:", @"dysmtdeferred");
    uint64_t v3 = v2[5];
    if (result) {
      BOOL v4 = *(_DWORD *)(v3 + 300) != 2;
    }
    else {
      BOOL v4 = 0;
    }
    *(unsigned char *)(v3 + 304) = v4;
  }
  return result;
}

@end