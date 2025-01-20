@interface EspressoSharedKernelCacheEntry
- (EspressoMetalKernelsCache)cached;
- (void)setCached:(id)a3;
@end

@implementation EspressoSharedKernelCacheEntry

- (void).cxx_destruct
{
}

- (void)setCached:(id)a3
{
}

- (EspressoMetalKernelsCache)cached
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_cached);

  return (EspressoMetalKernelsCache *)WeakRetained;
}

@end