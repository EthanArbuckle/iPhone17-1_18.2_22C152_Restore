@interface MUPlaceHikingTileViewModel
- (GEOTrail)geoTrail;
- (MUPlaceHikingTileViewModel)initWithGEOTrail:(id)a3 hikingItemType:(int)a4;
- (NSString)tileName;
- (id)footerAttributedStringForFont:(id)a3;
- (id)subtitleAttributedStringForFont:(id)a3;
- (int)hikingItemType;
- (unint64_t)expectedNumberOfFooterLines;
- (void)fetchBadgeIconWithCompletion:(id)a3;
- (void)fetchFallbackIconWithCompletion:(id)a3;
- (void)fetchImageTilewWithSize:(CGSize)a3 completion:(id)a4;
- (void)setGeoTrail:(id)a3;
- (void)setHikingItemType:(int)a3;
@end

@implementation MUPlaceHikingTileViewModel

- (MUPlaceHikingTileViewModel)initWithGEOTrail:(id)a3 hikingItemType:(int)a4
{
  uint64_t v4 = *(void *)&a4;
  id v6 = a3;
  v10.receiver = self;
  v10.super_class = (Class)MUPlaceHikingTileViewModel;
  v7 = [(MUPlaceHikingTileViewModel *)&v10 init];
  v8 = v7;
  if (v7)
  {
    [(MUPlaceHikingTileViewModel *)v7 setGeoTrail:v6];
    [(MUPlaceHikingTileViewModel *)v8 setHikingItemType:v4];
  }

  return v8;
}

- (NSString)tileName
{
  v2 = [(MUPlaceHikingTileViewModel *)self geoTrail];
  v3 = [v2 name];

  return (NSString *)v3;
}

- (void)fetchBadgeIconWithCompletion:(id)a3
{
  if (a3)
  {
    id v4 = a3;
    id v6 = [(MUPlaceHikingTileViewModel *)self geoTrail];
    v5 = [v6 styleAttributes];
    _MUFetchBadgeIconWithStyleAttributes(v5, 1, v4);
  }
}

- (void)fetchFallbackIconWithCompletion:(id)a3
{
  if (a3)
  {
    id v4 = a3;
    id v6 = [(MUPlaceHikingTileViewModel *)self geoTrail];
    v5 = [v6 styleAttributes];
    _MUFetchBadgeIconWithStyleAttributes(v5, 1, v4);
  }
}

- (void)fetchImageTilewWithSize:(CGSize)a3 completion:(id)a4
{
  double height = a3.height;
  double width = a3.width;
  id v7 = a4;
  v8 = [MEMORY[0x1E4F31038] sharedInstance];
  [v8 screenScale];
  double v10 = v9;

  v11 = [(MUPlaceHikingTileViewModel *)self geoTrail];
  v12 = [v11 photo];
  v13 = objc_msgSend(v12, "bestPhotoForSize:allowSmaller:", 1, width * v10, height * v10);

  v14 = [v13 url];
  v15 = [v14 absoluteString];
  uint64_t v16 = [v15 length];

  if (v16)
  {
    v17 = [MEMORY[0x1E4F30E38] sharedImageManager];
    v18 = [v13 url];
    v19[0] = MEMORY[0x1E4F143A8];
    v19[1] = 3221225472;
    v19[2] = __65__MUPlaceHikingTileViewModel_fetchImageTilewWithSize_completion___block_invoke;
    v19[3] = &unk_1E574F678;
    id v20 = v7;
    double v21 = width;
    double v22 = height;
    double v23 = v10;
    [v17 loadAppImageAtURL:v18 completionHandler:v19];
  }
  else
  {
    (*((void (**)(id, void, void, void))v7 + 2))(v7, 0, 0, 0);
  }
}

void __65__MUPlaceHikingTileViewModel_fetchImageTilewWithSize_completion___block_invoke(uint64_t a1, uint64_t a2, char a3, uint64_t a4, uint64_t a5)
{
  if (!a2 || a5)
  {
    double v10 = *(void (**)(void))(*(void *)(a1 + 32) + 16);
    v10();
  }
  else
  {
    double v8 = *(double *)(a1 + 56);
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __65__MUPlaceHikingTileViewModel_fetchImageTilewWithSize_completion___block_invoke_2;
    v11[3] = &unk_1E5750288;
    id v9 = *(id *)(a1 + 32);
    id v12 = 0;
    id v13 = v9;
    char v14 = a3;
    +[MapsUIUtilities resizeImageIfNeeded:toFrameSize:displayScale:completion:](MapsUIUtilities, "resizeImageIfNeeded:toFrameSize:displayScale:completion:", a2, v11, *(double *)(a1 + 40), *(double *)(a1 + 48), v8);
  }
}

uint64_t __65__MUPlaceHikingTileViewModel_fetchImageTilewWithSize_completion___block_invoke_2(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void, uint64_t, void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), a2, *(void *)(a1 + 32), *(unsigned __int8 *)(a1 + 48));
}

- (id)footerAttributedStringForFont:(id)a3
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if ([(MUPlaceHikingTileViewModel *)self hikingItemType] - 1 > 1)
  {
    id v6 = 0;
  }
  else
  {
    v5 = [(MUPlaceHikingTileViewModel *)self geoTrail];
    id v6 = [v5 factoids];
  }
  id v7 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  id v8 = v6;
  uint64_t v9 = [v8 countByEnumeratingWithState:&v22 objects:v26 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v23;
    do
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v23 != v11) {
          objc_enumerationMutation(v8);
        }
        uint64_t v13 = *(void *)(*((void *)&v22 + 1) + 8 * i);
        char v14 = _MUFactoidStringForFactoid(v13, v4);
        objc_msgSend(v7, "addObject:", v14, (void)v22);

        v15 = [v8 lastObject];

        if ((void *)v13 != v15)
        {
          id v16 = objc_alloc(MEMORY[0x1E4F28B18]);
          v17 = _MULocalizedStringFromThisBundle(@" · [Interpunct delimeter MapsUI]");
          v18 = (void *)[v16 initWithString:v17];

          [v7 addObject:v18];
        }
      }
      uint64_t v10 = [v8 countByEnumeratingWithState:&v22 objects:v26 count:16];
    }
    while (v10);
  }

  v19 = (void *)[v7 copy];
  id v20 = +[MapsUILayout buildAttributedDisplayStringForComponents:v19 reverseIfRTLLayout:1];

  return v20;
}

- (id)subtitleAttributedStringForFont:(id)a3
{
  v3 = objc_opt_new();
  return v3;
}

- (unint64_t)expectedNumberOfFooterLines
{
  return 1;
}

- (GEOTrail)geoTrail
{
  return self->_geoTrail;
}

- (void)setGeoTrail:(id)a3
{
}

- (int)hikingItemType
{
  return self->_hikingItemType;
}

- (void)setHikingItemType:(int)a3
{
  self->_hikingItemType = a3;
}

- (void).cxx_destruct
{
}

@end