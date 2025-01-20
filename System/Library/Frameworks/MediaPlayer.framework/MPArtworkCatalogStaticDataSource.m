@interface MPArtworkCatalogStaticDataSource
@end

@implementation MPArtworkCatalogStaticDataSource

void __53___MPArtworkCatalogStaticDataSource_sharedDataSource__block_invoke(uint64_t a1)
{
  id v1 = objc_alloc_init(*(Class *)(a1 + 32));
  v2 = (void *)sharedDataSource___dataSource_493;
  sharedDataSource___dataSource_493 = (uint64_t)v1;
}

@end