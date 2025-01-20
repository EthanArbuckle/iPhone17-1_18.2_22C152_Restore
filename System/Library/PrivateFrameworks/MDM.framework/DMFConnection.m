@interface DMFConnection
@end

@implementation DMFConnection

void __52__DMFConnection_MDMUtilities__performRequest_error___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v8 = a2;
  id v6 = a3;
  v7 = v6;
  if (v6)
  {
    if (*(void *)(a1 + 48)) {
      **(void **)(a1 + 48) = v6;
    }
  }
  else
  {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a2);
  }
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

@end