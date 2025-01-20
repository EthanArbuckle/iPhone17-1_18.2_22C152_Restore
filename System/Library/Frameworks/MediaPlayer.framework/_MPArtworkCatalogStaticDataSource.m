@interface _MPArtworkCatalogStaticDataSource
+ (id)sharedDataSource;
- (BOOL)areRepresentationsAvailableForCatalog:(id)a3;
- (BOOL)areRepresentationsOfKind:(int64_t)a3 availableForCatalog:(id)a4;
- (BOOL)isRepresentation:(id)a3 bestRepresentationForArtworkCatalog:(id)a4;
- (id)existingRepresentationForArtworkCatalog:(id)a3;
- (id)existingRepresentationOfKind:(int64_t)a3 forArtworkCatalog:(id)a4;
- (id)visualIdenticalityIdentifierForCatalog:(id)a3;
- (void)loadRepresentationForArtworkCatalog:(id)a3 completionHandler:(id)a4;
- (void)loadRepresentationOfKind:(int64_t)a3 forArtworkCatalog:(id)a4 completionHandler:(id)a5;
@end

@implementation _MPArtworkCatalogStaticDataSource

- (void)loadRepresentationOfKind:(int64_t)a3 forArtworkCatalog:(id)a4 completionHandler:(id)a5
{
  id v9 = a5;
  id v10 = [(_MPArtworkCatalogStaticDataSource *)self existingRepresentationOfKind:a3 forArtworkCatalog:a4];
  (*((void (**)(id, id, void))a5 + 2))(v9, v10, 0);
}

- (id)existingRepresentationOfKind:(int64_t)a3 forArtworkCatalog:(id)a4
{
  v5 = [a4 token];
  v6 = v5;
  if (a3 == 1)
  {
    uint64_t v7 = [v5 videoRepresentation];
    goto LABEL_5;
  }
  if (!a3)
  {
    uint64_t v7 = [v5 imageRepresentation];
LABEL_5:
    v8 = (void *)v7;
    goto LABEL_7;
  }
  v8 = 0;
LABEL_7:

  return v8;
}

- (BOOL)areRepresentationsOfKind:(int64_t)a3 availableForCatalog:(id)a4
{
  v5 = [a4 token];
  v6 = v5;
  if (a3 == 1)
  {
    uint64_t v7 = [v5 videoRepresentation];
  }
  else
  {
    if (a3)
    {
      BOOL v8 = 0;
      goto LABEL_7;
    }
    uint64_t v7 = [v5 imageRepresentation];
  }
  BOOL v8 = v7 != 0;

LABEL_7:
  return v8;
}

- (id)visualIdenticalityIdentifierForCatalog:(id)a3
{
  v3 = [a3 token];
  v4 = objc_alloc_init(_MPStaticArtworkVisualIdenticalityIdentifier);
  v5 = NSString;
  v6 = [v3 imageRepresentation];
  uint64_t v7 = [v6 image];
  BOOL v8 = objc_msgSend(v5, "stringWithFormat:", @"%lx", v7);
  [(_MPStaticArtworkVisualIdenticalityIdentifier *)v4 setImageArtworkIdentifier:v8];

  id v9 = [v3 videoRepresentation];
  id v10 = [v9 video];

  v11 = NSString;
  if (v10)
  {
    v12 = [v10 URL];
    [v12 absoluteString];
  }
  else
  {
    v12 = [v3 videoRepresentation];
    [v12 video];
  v13 = };
  v14 = [v11 stringWithFormat:@"%@", v13];
  [(_MPStaticArtworkVisualIdenticalityIdentifier *)v4 setVideoArtworkIdentifier:v14];

  return v4;
}

- (void)loadRepresentationForArtworkCatalog:(id)a3 completionHandler:(id)a4
{
  id v7 = a4;
  id v8 = [(_MPArtworkCatalogStaticDataSource *)self existingRepresentationForArtworkCatalog:a3];
  (*((void (**)(id, id, void))a4 + 2))(v7, v8, 0);
}

- (id)existingRepresentationForArtworkCatalog:(id)a3
{
  return [(_MPArtworkCatalogStaticDataSource *)self existingRepresentationOfKind:0 forArtworkCatalog:a3];
}

- (BOOL)isRepresentation:(id)a3 bestRepresentationForArtworkCatalog:(id)a4
{
  id v5 = a3;
  v6 = [a4 token];
  uint64_t v7 = [v5 kind];
  if (v7 == 1)
  {
    id v8 = [v5 video];
    id v9 = [v6 videoRepresentation];
    id v10 = [v9 video];
  }
  else
  {
    if (v7)
    {
      BOOL v11 = 0;
      goto LABEL_7;
    }
    id v8 = [v5 image];
    id v9 = [v6 imageRepresentation];
    id v10 = [v9 image];
  }
  BOOL v11 = v8 == v10;

LABEL_7:
  return v11;
}

- (BOOL)areRepresentationsAvailableForCatalog:(id)a3
{
  return [(_MPArtworkCatalogStaticDataSource *)self areRepresentationsOfKind:0 availableForCatalog:a3];
}

+ (id)sharedDataSource
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __53___MPArtworkCatalogStaticDataSource_sharedDataSource__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (sharedDataSource_onceToken_494 != -1) {
    dispatch_once(&sharedDataSource_onceToken_494, block);
  }
  v2 = (void *)sharedDataSource___dataSource_493;

  return v2;
}

@end