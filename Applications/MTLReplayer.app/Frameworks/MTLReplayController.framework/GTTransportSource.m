@interface GTTransportSource
@end

@implementation GTTransportSource

uint64_t __31__GTTransportSource__dispatch___block_invoke(uint64_t result)
{
  char v1 = atomic_load((unsigned int *)(*(void *)(result + 32) + 56));
  if ((v1 & 1) == 0)
  {
    uint64_t v2 = *(void *)(*(void *)(result + 32) + 8);
    if (v2) {
      return (*(uint64_t (**)(void, void))(v2 + 16))(*(void *)(*(void *)(result + 32) + 8), *(void *)(result + 40));
    }
  }
  return result;
}

id __28__GTTransportSource__cancel__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _callCancellationHandler];
}

id __30__GTTransportSource__register__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _callRegistrationHandler];
}

void __44__GTTransportSource_setRegistrationHandler___block_invoke(uint64_t a1)
{
  char v1 = atomic_load((unsigned int *)(*(void *)(a1 + 32) + 56));
  if ((v1 & 1) == 0)
  {
    uint64_t v3 = *(void *)(a1 + 32);
    if (!*(void *)(v3 + 24))
    {
      char v4 = atomic_load((unsigned int *)(v3 + 56));
      uint64_t v3 = *(void *)(a1 + 32);
      if ((v4 & 2) != 0)
      {
        v5 = *(NSObject **)(v3 + 40);
        block[0] = _NSConcreteStackBlock;
        block[1] = 3221225472;
        block[2] = __44__GTTransportSource_setRegistrationHandler___block_invoke_2;
        block[3] = &unk_746170;
        block[4] = v3;
        dispatch_async(v5, block);
        uint64_t v3 = *(void *)(a1 + 32);
      }
    }

    *(void *)(*(void *)(a1 + 32) + 24) = *(void *)(a1 + 40);
    dispatch_resume(*(dispatch_object_t *)(*(void *)(a1 + 32) + 40));
  }
}

id __44__GTTransportSource_setRegistrationHandler___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) _callRegistrationHandler];
}

void __44__GTTransportSource_setCancellationHandler___block_invoke(uint64_t a1)
{
  char v1 = atomic_load((unsigned int *)(*(void *)(a1 + 32) + 56));
  if ((v1 & 1) == 0)
  {

    *(void *)(*(void *)(a1 + 32) + 16) = *(void *)(a1 + 40);
    uint64_t v3 = *(NSObject **)(*(void *)(a1 + 32) + 40);
    dispatch_resume(v3);
  }
}

void __39__GTTransportSource_setMessageHandler___block_invoke(uint64_t a1)
{
  char v1 = atomic_load((unsigned int *)(*(void *)(a1 + 32) + 56));
  if ((v1 & 1) == 0)
  {

    *(void *)(*(void *)(a1 + 32) + 8) = *(void *)(a1 + 40);
    uint64_t v3 = *(NSObject **)(*(void *)(a1 + 32) + 40);
    dispatch_resume(v3);
  }
}

void __27__GTTransportSource_cancel__block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) _cancel];
  uint64_t v2 = *(NSObject **)(*(void *)(a1 + 32) + 40);

  dispatch_resume(v2);
}

void __46__GTTransportSource__initWithQueue_transport___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) _register];
  uint64_t v2 = *(NSObject **)(*(void *)(a1 + 32) + 40);

  dispatch_resume(v2);
}

@end