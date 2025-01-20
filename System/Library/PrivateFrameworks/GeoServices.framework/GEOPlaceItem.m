@interface GEOPlaceItem
@end

@implementation GEOPlaceItem

void __30___GEOPlaceItem_addressObject__block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  if (!*(void *)(v1 + 32))
  {
    uint64_t v3 = GEOAddressObjectOfGEOPlace(*(void **)(v1 + 16));
    uint64_t v4 = *(void *)(a1 + 32);
    v5 = *(void **)(v4 + 32);
    *(void *)(v4 + 32) = v3;
  }
}

@end