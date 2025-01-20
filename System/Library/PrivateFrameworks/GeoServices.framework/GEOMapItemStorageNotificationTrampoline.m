@interface GEOMapItemStorageNotificationTrampoline
@end

@implementation GEOMapItemStorageNotificationTrampoline

void __75___GEOMapItemStorageNotificationTrampoline_initWithMapItem_mapItemStorage___block_invoke(uint64_t a1)
{
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v4 = WeakRetained;
    id v2 = objc_loadWeakRetained(WeakRetained + 2);
    if (v2)
    {
      v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
      [v3 postNotificationName:@"GEOMapItemDidResolveAttribution" object:v2];
    }
    WeakRetained = v4;
  }
}

@end