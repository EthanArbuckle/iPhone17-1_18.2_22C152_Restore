@interface NSDictionary
@end

@implementation NSDictionary

void __76__NSDictionary_GKCollectionUtils___gkSubDictionaryWithKeys_mappedToNewKeys___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  id v7 = [*(id *)(a1 + 32) objectForKey:a2];
  if (v7)
  {
    v5 = *(void **)(a1 + 40);
    v6 = [*(id *)(a1 + 48) objectAtIndex:a3];
    [v5 setObject:v7 forKey:v6];
  }
}

void __60__NSDictionary_GKImageAdditions___gkImageCacheKeyPathsByKey__block_invoke()
{
  v0 = (void *)_gkImageCacheKeyPathsByKey_sKeyPaths;
  _gkImageCacheKeyPathsByKey_sKeyPaths = (uint64_t)&unk_1F1E7ED18;
}

void __77__NSDictionary_GKImageAdditions___gkClientImageDictionaryForServerImageURLs___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  v4 = *(void **)(a1 + 32);
  v5 = *(void **)(a1 + 40);
  id v6 = a3;
  id v7 = [v5 objectForKey:a2];
  [v4 setObject:v7 forKey:v6];
}

@end