@interface HMFHTTPClientHandleReachabilityChange
@end

@implementation HMFHTTPClientHandleReachabilityChange

void ____HMFHTTPClientHandleReachabilityChange_block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (!a3)
  {
    id v5 = WeakRetained;
    [WeakRetained setReachable:1];
    id WeakRetained = v5;
  }
}

@end