@interface MPHomeSharingArtworkDataSource
+ (NSString)artworkDataSourceShortDescription;
+ (id)artworkDataSourceWithIdentifier:(id)a3;
- (BOOL)areRepresentationsAvailableForCatalog:(id)a3;
- (BOOL)shouldLookForLargerImageRepresentationsWhenBestRepresentationIsUnavailable;
- (HSHomeSharingLibrary)library;
- (NSString)artworkDataSourceIdentifier;
- (id)cacheKeyForCatalog:(id)a3 size:(CGSize)a4;
- (id)requestForCatalog:(id)a3 size:(CGSize)a4;
- (id)supportedSizesForCatalog:(id)a3;
- (void)loadRepresentationForArtworkCatalog:(id)a3 completionHandler:(id)a4;
- (void)setLibrary:(id)a3;
@end

@implementation MPHomeSharingArtworkDataSource

- (void).cxx_destruct
{
}

- (void)setLibrary:(id)a3
{
}

- (HSHomeSharingLibrary)library
{
  return self->_library;
}

- (NSString)artworkDataSourceIdentifier
{
  v2 = [(MPHomeSharingArtworkDataSource *)self library];
  v3 = [v2 uniqueIdentifier];

  return (NSString *)v3;
}

- (void)loadRepresentationForArtworkCatalog:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = dispatch_get_global_queue(0, 0);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __88__MPHomeSharingArtworkDataSource_loadRepresentationForArtworkCatalog_completionHandler___block_invoke;
  block[3] = &unk_1E57F8408;
  v13 = self;
  id v14 = v7;
  id v12 = v6;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(v8, block);
}

id __88__MPHomeSharingArtworkDataSource_loadRepresentationForArtworkCatalog_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  uint64_t v2 = *(void *)(a1 + 48);
  v4.receiver = *(id *)(a1 + 40);
  v4.super_class = (Class)MPHomeSharingArtworkDataSource;
  return objc_msgSendSuper2(&v4, sel_loadRepresentationForArtworkCatalog_completionHandler_, v1, v2);
}

- (id)requestForCatalog:(id)a3 size:(CGSize)a4
{
  double height = a4.height;
  double width = a4.width;
  id v7 = [a3 token];
  v8 = (void *)MEMORY[0x1E4F79B50];
  uint64_t v9 = [v7 libraryID];
  id v10 = [v7 musicLibrary];
  v11 = (void *)[v8 newWithPersistentID:v9 inLibrary:v10];

  id v12 = [v11 valueForProperty:*MEMORY[0x1E4F796A0]];
  v13 = (void *)MEMORY[0x1E4F6A340];
  id v14 = [(MPHomeSharingArtworkDataSource *)self library];
  v15 = objc_msgSend(v13, "requestWithDatabaseID:itemID:size:", objc_msgSend(v14, "databaseID"), objc_msgSend(v12, "unsignedLongLongValue"), width, height);

  v16 = [(MPHomeSharingArtworkDataSource *)self library];
  v17 = [v16 urlForRequest:v15];

  v18 = [MEMORY[0x1E4F290D0] requestWithURL:v17];
  v19 = [(MPHomeSharingArtworkDataSource *)self library];
  v20 = [v19 signedRequestFromURLRequest:v18];

  return v20;
}

- (id)supportedSizesForCatalog:(id)a3
{
  v3 = [a3 token];
  objc_super v4 = +[MPArtworkConfiguration systemConfiguration];
  v5 = objc_msgSend(v4, "supportedSizesForMediaType:artworkType:", objc_msgSend(v3, "mediaType"), objc_msgSend(v3, "artworkType"));

  id v6 = [v5 allObjects];

  return v6;
}

- (BOOL)shouldLookForLargerImageRepresentationsWhenBestRepresentationIsUnavailable
{
  return 0;
}

- (id)cacheKeyForCatalog:(id)a3 size:(CGSize)a4
{
  double height = a4.height;
  double width = a4.width;
  id v6 = [a3 token];
  id v7 = -[_MPHomeSharingArtworkCacheKey initWithPersistentID:size:]([_MPHomeSharingArtworkCacheKey alloc], "initWithPersistentID:size:", [v6 libraryID], width, height);

  return v7;
}

- (BOOL)areRepresentationsAvailableForCatalog:(id)a3
{
  v3 = [a3 token];
  BOOL v4 = [v3 artworkType] != 4
    && [v3 artworkType] != 3
    && [v3 artworkType] != 2
    && [v3 artworkType] != 5;

  return v4;
}

+ (id)artworkDataSourceWithIdentifier:(id)a3
{
  v3 = +[MPMediaLibrary mediaLibraryWithUniqueIdentifier:a3 allowsLoadingFromDisk:1];
  BOOL v4 = [v3 libraryDataProvider];
  v5 = [v4 artworkDataSource];

  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v6 = v5;
  }
  else {
    id v6 = 0;
  }

  return v6;
}

+ (NSString)artworkDataSourceShortDescription
{
  return (NSString *)@"home-sharing";
}

@end