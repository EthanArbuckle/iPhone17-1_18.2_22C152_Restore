@interface DYSocketTransport
- (DYSocketTransport)init;
- (DYSocketTransport)initWithSocketDescriptor:(int)a3;
- (id)connect;
@end

@implementation DYSocketTransport

- (DYSocketTransport)init
{
  return 0;
}

- (DYSocketTransport)initWithSocketDescriptor:(int)a3
{
  v5.receiver = self;
  v5.super_class = (Class)DYSocketTransport;
  result = [(DYBaseSocketTransport *)&v5 init];
  if (result) {
    *(_DWORD *)(&result->super._scheduledReadOnWritableSocket + 3) = a3;
  }
  return result;
}

- (id)connect
{
  id v3 = +[DYFuture future];
  queue = self->super.super.super._queue;
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __28__DYSocketTransport_connect__block_invoke;
  v6[3] = &unk_265335F20;
  v6[4] = self;
  v6[5] = v3;
  dispatch_async(queue, v6);
  return v3;
}

uint64_t __28__DYSocketTransport_connect__block_invoke(uint64_t a1)
{
  v2 = *(unsigned char **)(a1 + 32);
  if (v2[52])
  {
    id v3 = +[DYError errorWithDomain:@"DYErrorDomain" code:32 userInfo:0];
    objc_super v5 = *(void **)(a1 + 40);
    v4 = (void **)(a1 + 40);
    [v5 setError:v3];
    uint64_t v6 = [NSNumber numberWithBool:0];
  }
  else
  {
    if (![v2 connected]) {
      [*(id *)(a1 + 32) runWithSocket:*(unsigned int *)(*(void *)(a1 + 32) + 268)];
    }
    uint64_t v6 = [NSNumber numberWithBool:1];
    v4 = (void **)(a1 + 40);
  }
  v7 = *v4;

  return [v7 setResult:v6];
}

@end