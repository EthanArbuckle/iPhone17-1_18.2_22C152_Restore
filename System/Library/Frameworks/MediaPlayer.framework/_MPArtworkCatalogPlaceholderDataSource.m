@interface _MPArtworkCatalogPlaceholderDataSource
+ (id)sharedDataSource;
- (BOOL)areRepresentationsAvailableForCatalog:(id)a3;
- (BOOL)isRepresentation:(id)a3 bestRepresentationForArtworkCatalog:(id)a4;
- (id)existingRepresentationForArtworkCatalog:(id)a3;
- (id)visualIdenticalityIdentifierForCatalog:(id)a3;
- (void)loadRepresentationForArtworkCatalog:(id)a3 completionHandler:(id)a4;
@end

@implementation _MPArtworkCatalogPlaceholderDataSource

- (void).cxx_destruct
{
}

- (id)visualIdenticalityIdentifierForCatalog:(id)a3
{
  v3 = NSString;
  id v4 = a3;
  v5 = [v4 token];
  [v4 scaledFittingSize];
  CGFloat v7 = v6;
  CGFloat v9 = v8;

  v14.width = v7;
  v14.height = v9;
  v10 = NSStringFromCGSize(v14);
  v11 = [v3 stringWithFormat:@"%@-%@", v5, v10];

  return v11;
}

- (void)loadRepresentationForArtworkCatalog:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  CGFloat v7 = (void (**)(id, void *, void))a4;
  [v6 scaledFittingSize];
  double v10 = v9;
  double v11 = v8;
  if (v9 == *(double *)&MPArtworkCatalogOriginalSize && v8 == *((double *)&MPArtworkCatalogOriginalSize + 1))
  {
    MSVGetMaximumScreenSize();
    double v10 = v13;
    double v11 = v14;
  }
  v15 = objc_msgSend(objc_alloc(MEMORY[0x1E4FB17D8]), "initWithSize:", v10, v11);
  v22[0] = MEMORY[0x1E4F143A8];
  v22[1] = 3221225472;
  v22[2] = __96___MPArtworkCatalogPlaceholderDataSource_loadRepresentationForArtworkCatalog_completionHandler___block_invoke;
  v22[3] = &unk_1E57F0170;
  id v16 = v6;
  id v23 = v16;
  v17 = [v15 imageWithActions:v22];
  v18 = [(_MPArtworkCatalogPlaceholderDataSource *)self visualIdenticalityIdentifierForCatalog:v16];
  [v17 size];
  v19 = +[MPArtworkRepresentation representationForVisualIdentity:withSize:image:](MPArtworkRepresentation, "representationForVisualIdentity:withSize:image:", v18, v17);
  fallbackCache = [v16 cache];
  v21 = fallbackCache;
  if (!fallbackCache) {
    fallbackCache = self->_fallbackCache;
  }
  [fallbackCache setObject:v19 forKey:v18];

  v7[2](v7, v19, 0);
}

- (id)existingRepresentationForArtworkCatalog:(id)a3
{
  id v4 = a3;
  v5 = [v4 cache];
  fallbackCache = v5;
  if (!v5) {
    fallbackCache = self->_fallbackCache;
  }
  CGFloat v7 = [(_MPArtworkCatalogPlaceholderDataSource *)self visualIdenticalityIdentifierForCatalog:v4];

  double v8 = [v7 stringRepresentation];
  double v9 = [(NSCache *)fallbackCache objectForKey:v8];

  return v9;
}

- (BOOL)isRepresentation:(id)a3 bestRepresentationForArtworkCatalog:(id)a4
{
  id v5 = a4;
  id v6 = [a3 image];
  [v6 size];
  double v8 = v7;
  double v10 = v9;
  [v5 scaledFittingSize];
  double v12 = v11;
  double v14 = v13;

  BOOL v15 = v10 == v14 && v8 == v12;
  return v15;
}

- (BOOL)areRepresentationsAvailableForCatalog:(id)a3
{
  return 1;
}

+ (id)sharedDataSource
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __58___MPArtworkCatalogPlaceholderDataSource_sharedDataSource__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (sharedDataSource_onceToken != -1) {
    dispatch_once(&sharedDataSource_onceToken, block);
  }
  v2 = (void *)sharedDataSource___dataSource;

  return v2;
}

@end