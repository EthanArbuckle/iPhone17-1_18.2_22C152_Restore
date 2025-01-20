@interface MTPlaylist
+ (id)relationshipKeyPathsForPrefetchingArtworkCatalog;
- (MPArtworkCatalog)artworkCatalog;
@end

@implementation MTPlaylist

+ (id)relationshipKeyPathsForPrefetchingArtworkCatalog
{
  uint64_t v4 = kPlaylistSettings;
  v2 = +[NSArray arrayWithObjects:&v4 count:1];

  return v2;
}

- (MPArtworkCatalog)artworkCatalog
{
  id v3 = objc_alloc_init((Class)MPTiledArtworkRequest);
  objc_initWeak(&location, self);
  v9 = _NSConcreteStackBlock;
  uint64_t v10 = 3221225472;
  v11 = sub_5120;
  v12 = &unk_1C898;
  objc_copyWeak(&v13, &location);
  [v3 setArtworkCatalogsBlock:&v9];
  objc_msgSend(v3, "setNumberOfRows:", 2, v9, v10, v11, v12);
  [v3 setNumberOfColumns:2];
  [v3 setNamespaceIdentifier:@"MTPlaylist"];
  uint64_t v4 = [(MTPlaylist *)self uuid];
  [v3 setEntityIdentifier:v4];

  id v5 = objc_alloc((Class)MPArtworkCatalog);
  v6 = +[MPTiledArtworkDataSource sharedDataSource];
  id v7 = [v5 initWithToken:v3 dataSource:v6];

  objc_destroyWeak(&v13);
  objc_destroyWeak(&location);

  return (MPArtworkCatalog *)v7;
}

@end