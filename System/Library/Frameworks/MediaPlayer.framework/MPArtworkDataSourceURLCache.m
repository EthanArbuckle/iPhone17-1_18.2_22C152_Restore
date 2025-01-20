@interface MPArtworkDataSourceURLCache
@end

@implementation MPArtworkDataSourceURLCache

void __65___MPArtworkDataSourceURLCache_setRepresentationSize_forRequest___block_invoke(uint64_t a1)
{
  v2 = *(void **)(*(void *)(a1 + 32) + 16);
  NSStringFromCGSize(*(CGSize *)(a1 + 48));
  id v4 = (id)objc_claimAutoreleasedReturnValue();
  v3 = [*(id *)(a1 + 40) URL];
  [v2 setObject:v4 forKey:v3];
}

void __63___MPArtworkDataSourceURLCache_storeCachedResponse_forRequest___block_invoke(uint64_t a1)
{
  v2 = *(void **)(*(void *)(a1 + 32) + 16);
  id v6 = [*(id *)(a1 + 40) URL];
  uint64_t v3 = [v2 objectForKey:v6];
  uint64_t v4 = *(void *)(*(void *)(a1 + 48) + 8);
  v5 = *(void **)(v4 + 40);
  *(void *)(v4 + 40) = v3;
}

@end