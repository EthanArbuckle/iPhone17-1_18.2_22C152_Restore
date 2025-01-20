@interface IKJSInspectorNetworkLoader
@end

@implementation IKJSInspectorNetworkLoader

uint64_t __54___IKJSInspectorNetworkLoader_dispatchEventWithBlock___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  id v3 = WeakRetained;
  if (WeakRetained)
  {
    id v5 = WeakRetained;
    id WeakRetained = (id)(*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
    id v3 = v5;
  }
  return MEMORY[0x1F41817F8](WeakRetained, v3);
}

@end