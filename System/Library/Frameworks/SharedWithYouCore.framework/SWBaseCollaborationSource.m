@interface SWBaseCollaborationSource
@end

@implementation SWBaseCollaborationSource

uint64_t __65___SWBaseCollaborationSource_listener_shouldAcceptNewConnection___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) invalidate];
}

void __65___SWBaseCollaborationSource_listener_shouldAcceptNewConnection___block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained invalidate];
}

@end