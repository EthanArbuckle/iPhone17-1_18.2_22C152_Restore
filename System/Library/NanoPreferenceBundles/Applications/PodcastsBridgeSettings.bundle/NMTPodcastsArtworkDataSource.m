@interface NMTPodcastsArtworkDataSource
+ (id)_backgroundColorFromCatalog:(id)a3;
+ (id)_keyFromCatalog:(id)a3;
+ (id)imageURLSharedDataSource;
+ (id)uuidSharedDataSource;
- (BOOL)areRepresentationsAvailableForCatalog:(id)a3;
- (BOOL)isRepresentation:(id)a3 bestRepresentationForArtworkCatalog:(id)a4;
- (id)_cacheKeyForSize:(CGSize)a3 withBaseKey:(id)a4;
- (id)_initWithIsImageURLKey:(BOOL)a3;
- (id)existingArtworkEffectResultForEffectType:(int64_t)a3 catalog:(id)a4 options:(id)a5;
- (id)existingRepresentationForArtworkCatalog:(id)a3;
- (id)visualIdenticalityIdentifierForCatalog:(id)a3;
- (void)loadRepresentationForArtworkCatalog:(id)a3 completionHandler:(id)a4;
@end

@implementation NMTPodcastsArtworkDataSource

+ (id)uuidSharedDataSource
{
  if (qword_23360 != -1) {
    dispatch_once(&qword_23360, &stru_1C7D8);
  }
  v2 = (void *)qword_23358;

  return v2;
}

+ (id)imageURLSharedDataSource
{
  if (qword_23370 != -1) {
    dispatch_once(&qword_23370, &stru_1C7F8);
  }
  v2 = (void *)qword_23368;

  return v2;
}

- (id)_initWithIsImageURLKey:(BOOL)a3
{
  v5.receiver = self;
  v5.super_class = (Class)NMTPodcastsArtworkDataSource;
  id result = [(NMTPodcastsArtworkDataSource *)&v5 init];
  if (result) {
    *((unsigned char *)result + 8) = a3;
  }
  return result;
}

- (BOOL)areRepresentationsAvailableForCatalog:(id)a3
{
  return 1;
}

- (BOOL)isRepresentation:(id)a3 bestRepresentationForArtworkCatalog:(id)a4
{
  return a3 != 0;
}

- (id)existingRepresentationForArtworkCatalog:(id)a3
{
  id v4 = a3;
  objc_super v5 = [(id)objc_opt_class() _keyFromCatalog:v4];
  [v4 scaledFittingSize];
  double v7 = v6;
  double v9 = v8;
  v10 = -[NMTPodcastsArtworkDataSource _cacheKeyForSize:withBaseKey:](self, "_cacheKeyForSize:withBaseKey:", v5);
  v11 = [v4 cache];
  v12 = [v11 objectForKey:v10];

  if (v12)
  {
    id v13 = v12;
    goto LABEL_14;
  }
  if (([v4 renderHint] & 8) != 0) {
    goto LABEL_13;
  }
  [v4 fittingSize];
  double v15 = v14;
  double v17 = v16;
  if (v7 == MPArtworkCatalogOriginalSize[0] && v9 == MPArtworkCatalogOriginalSize[1])
  {
    v21 = +[MTImageStore defaultStore];
    uint64_t v22 = [v21 imageForKey:v5];
  }
  else
  {
    v19 = +[MTImageStore defaultStore];
    unsigned int v20 = objc_msgSend(v19, "hasItemForKey:size:", v5, v15, v17);

    if (!v20) {
      goto LABEL_13;
    }
    v21 = +[MTImageStore defaultStore];
    uint64_t v22 = objc_msgSend(v21, "imageForKey:size:", v5, v15, v17);
  }
  v23 = (void *)v22;

  if (v23)
  {
    id v24 = [objc_alloc((Class)PFStaticArtworkVisualIdenticality) initWithArtworkIdentifier:v10];
    +[MPArtworkRepresentation representationForVisualIdentity:withSize:image:](MPArtworkRepresentation, "representationForVisualIdentity:withSize:image:", v24, v23, v7, v9);
    id v13 = (id)objc_claimAutoreleasedReturnValue();
    v25 = [v4 cache];
    [v25 setObject:v13 forKey:v10];

    goto LABEL_14;
  }
LABEL_13:
  id v13 = 0;
LABEL_14:

  return v13;
}

- (void)loadRepresentationForArtworkCatalog:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  double v8 = [(id)objc_opt_class() _keyFromCatalog:v6];
  [v6 scaledFittingSize];
  uint64_t v10 = v9;
  double v12 = v11;
  [v6 fittingSize];
  uint64_t v14 = v13;
  uint64_t v16 = v15;
  if (self->_isImageURLKey)
  {
    double v17 = +[UIScreen mainScreen];
    [v17 scale];
    unint64_t v19 = (unint64_t)(v12 * v18);

    unsigned int v20 = +[MTResizedArtworkURLProvider sharedInstance];
    uint64_t v21 = [v20 resizedArtworkURLString:v8 withDimension:v19];

    double v8 = (void *)v21;
  }
  v41[0] = _NSConcreteStackBlock;
  v41[1] = 3221225472;
  v41[2] = sub_34B4;
  v41[3] = &unk_1C848;
  id v22 = v8;
  uint64_t v46 = v14;
  uint64_t v47 = v16;
  uint64_t v48 = v10;
  double v49 = v12;
  id v42 = v22;
  v43 = self;
  id v23 = v6;
  id v44 = v23;
  id v24 = v7;
  id v45 = v24;
  v25 = objc_retainBlock(v41);
  v26 = +[MTImageStore defaultStore];
  unsigned int v27 = [v26 hasItemForKey:v22];

  if (v27)
  {
    ((void (*)(void *))v25[2])(v25);
  }
  else
  {
    v33 = _NSConcreteStackBlock;
    uint64_t v34 = 3221225472;
    v35 = sub_3774;
    v36 = &unk_1C870;
    v39 = v25;
    v37 = self;
    id v28 = v22;
    id v38 = v28;
    id v40 = v24;
    v29 = objc_retainBlock(&v33);
    if (self->_isImageURLKey)
    {
      id v30 = objc_alloc((Class)_TtC18PodcastsFoundation22DownloadableURLOptions);
      id v31 = objc_msgSend(v30, "init:nonAppInitiated:", v28, 0, v33, v34, v35, v36, v37, v38, v39);
      v32 = +[MTImageDownloader sharedInstance];
      [v32 downloadImageUrl:v31 cacheKey:v28 userInitiated:1 callback:v29];
    }
    else
    {
      id v31 = +[MTImageDownloader sharedInstance];
      [v31 downloadImageForPodcastUuid:v28 userInitiated:1 backgroundFetch:0 callback:v29];
    }
  }
}

- (id)visualIdenticalityIdentifierForCatalog:(id)a3
{
  id v3 = a3;
  id v4 = [(id)objc_opt_class() _keyFromCatalog:v3];

  id v5 = [objc_alloc((Class)PFStaticArtworkVisualIdenticality) initWithArtworkIdentifier:v4];

  return v5;
}

- (id)existingArtworkEffectResultForEffectType:(int64_t)a3 catalog:(id)a4 options:(id)a5
{
  if (a3 == 1)
  {
    id v5 = a4;
    id v6 = [(id)objc_opt_class() _backgroundColorFromCatalog:v5];

    if (v6)
    {
      id v7 = objc_alloc_init((Class)MPMutableArtworkColorAnalysis);
      [v7 setBackgroundColor:v6];
      id v8 = [v7 copy];
    }
    else
    {
      id v8 = 0;
    }
  }
  else
  {
    id v8 = 0;
  }

  return v8;
}

- (id)_cacheKeyForSize:(CGSize)a3 withBaseKey:(id)a4
{
  double height = a3.height;
  double width = a3.width;
  id v6 = a4;
  id v7 = v6;
  if (width == MPArtworkCatalogOriginalSize[0] && height == MPArtworkCatalogOriginalSize[1])
  {
    id v9 = v6;
  }
  else
  {
    id v9 = +[NSString stringWithFormat:@"%@-{%f,%f}", v6, *(void *)&width, *(void *)&height];
  }
  uint64_t v10 = v9;

  return v10;
}

+ (id)_keyFromCatalog:(id)a3
{
  id v3 = [a3 token];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v4 = v3;
  }
  else
  {
    id v4 = [v3 key];
  }
  id v5 = v4;

  return v5;
}

+ (id)_backgroundColorFromCatalog:(id)a3
{
  id v3 = [a3 token];
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0 || (id v4 = [v3 backgroundColor]) == 0)
  {
    id v5 = 0;
  }
  else
  {
    id v5 = +[UIColor colorWithCGColor:v4];
  }

  return v5;
}

@end