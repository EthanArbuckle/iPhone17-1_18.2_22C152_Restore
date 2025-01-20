@interface LNListenerEndpointProvider
+ (id)sharedProvider;
- (LNListenerEndpointProviderDelegate)delegate;
- (void)setDelegate:(id)a3;
@end

@implementation LNListenerEndpointProvider

- (void).cxx_destruct
{
}

- (void)setDelegate:(id)a3
{
}

- (LNListenerEndpointProviderDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (LNListenerEndpointProviderDelegate *)WeakRetained;
}

+ (id)sharedProvider
{
  if (sharedProvider_onceToken != -1) {
    dispatch_once(&sharedProvider_onceToken, &__block_literal_global_5641);
  }
  v2 = (void *)sharedProvider_provider;
  return v2;
}

uint64_t __44__LNListenerEndpointProvider_sharedProvider__block_invoke()
{
  sharedProvider_provider = objc_alloc_init(LNListenerEndpointProvider);
  return MEMORY[0x1F41817F8]();
}

@end