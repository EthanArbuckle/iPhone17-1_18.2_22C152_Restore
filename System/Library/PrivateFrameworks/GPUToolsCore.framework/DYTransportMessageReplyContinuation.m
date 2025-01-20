@interface DYTransportMessageReplyContinuation
- (void)dispatchError:(id)a3;
@end

@implementation DYTransportMessageReplyContinuation

- (void)dispatchError:(id)a3
{
  queue = self->super.queue;
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __53__DYTransportMessageReplyContinuation_dispatchError___block_invoke;
  v4[3] = &unk_265335F20;
  v4[4] = self;
  v4[5] = a3;
  dispatch_async(queue, v4);
}

uint64_t __53__DYTransportMessageReplyContinuation_dispatchError___block_invoke(uint64_t result)
{
  uint64_t v1 = *(void *)(result + 32);
  if (!*(unsigned char *)(v1 + 24))
  {
    uint64_t v2 = result;
    result = (*(uint64_t (**)(void))(*(void *)(v1 + 16) + 16))();
    *(unsigned char *)(*(void *)(v2 + 32) + 24) = 1;
  }
  return result;
}

@end