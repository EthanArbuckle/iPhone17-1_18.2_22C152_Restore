@interface BLJaliscoItem
- (id)artworkCatalog;
@end

@implementation BLJaliscoItem

- (id)artworkCatalog
{
  id v3 = objc_alloc((Class)MPArtworkCatalog);
  v4 = [(BLJaliscoItem *)self artworkURLString];
  v5 = +[NBJaliscoArtworkCatalogDataSource instance];
  id v6 = [v3 initWithToken:v4 dataSource:v5];

  return v6;
}

@end