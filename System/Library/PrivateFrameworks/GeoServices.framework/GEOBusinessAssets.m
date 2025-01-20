@interface GEOBusinessAssets
+ (GEOBusinessAssets)businessAssetsWithPlaceData:(id)a3;
- (GEOBusinessAssets)initWithBusinessAssets:(id)a3;
- (GEOMapItemPhoto)coverPhoto;
- (GEOMapItemPhoto)croppedPhoto;
- (NSArray)coverPhotos;
- (NSArray)croppedPhotos;
@end

@implementation GEOBusinessAssets

- (GEOBusinessAssets)initWithBusinessAssets:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)GEOBusinessAssets;
  v6 = [(GEOBusinessAssets *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_businessAssets, a3);
  }

  return v7;
}

- (GEOMapItemPhoto)coverPhoto
{
  v2 = [(GEOBusinessAssets *)self coverPhotos];
  v3 = [v2 firstObject];

  return (GEOMapItemPhoto *)v3;
}

- (GEOMapItemPhoto)croppedPhoto
{
  v2 = [(GEOBusinessAssets *)self croppedPhotos];
  v3 = [v2 firstObject];

  return (GEOMapItemPhoto *)v3;
}

- (NSArray)coverPhotos
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  coverPhotos = self->_coverPhotos;
  if (!coverPhotos)
  {
    v4 = (void *)MEMORY[0x1E4F1CA48];
    id v5 = -[GEOPDBusinessAssets coverPhotos]((id *)&self->_businessAssets->super.super.isa);
    v6 = objc_msgSend(v4, "arrayWithCapacity:", objc_msgSend(v5, "count"));

    long long v20 = 0u;
    long long v21 = 0u;
    long long v18 = 0u;
    long long v19 = 0u;
    v7 = -[GEOPDBusinessAssets coverPhotos]((id *)&self->_businessAssets->super.super.isa);
    uint64_t v8 = [v7 countByEnumeratingWithState:&v18 objects:v22 count:16];
    if (v8)
    {
      uint64_t v9 = v8;
      uint64_t v10 = *(void *)v19;
      do
      {
        uint64_t v11 = 0;
        do
        {
          if (*(void *)v19 != v10) {
            objc_enumerationMutation(v7);
          }
          uint64_t v12 = *(void *)(*((void *)&v18 + 1) + 8 * v11);
          v13 = [_GEOPlaceDataPhoto alloc];
          v14 = -[_GEOPlaceDataPhoto initWithCaptionedPhoto:](v13, "initWithCaptionedPhoto:", v12, (void)v18);
          [v6 addObject:v14];

          ++v11;
        }
        while (v9 != v11);
        uint64_t v9 = [v7 countByEnumeratingWithState:&v18 objects:v22 count:16];
      }
      while (v9);
    }

    v15 = (NSArray *)[v6 copy];
    v16 = self->_coverPhotos;
    self->_coverPhotos = v15;

    coverPhotos = self->_coverPhotos;
  }

  return coverPhotos;
}

- (NSArray)croppedPhotos
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  croppedPhotos = self->_croppedPhotos;
  if (!croppedPhotos)
  {
    v4 = (void *)MEMORY[0x1E4F1CA48];
    id v5 = -[GEOPDBusinessAssets croppedCoverPhotos]((id *)&self->_businessAssets->super.super.isa);
    v6 = objc_msgSend(v4, "arrayWithCapacity:", objc_msgSend(v5, "count"));

    long long v20 = 0u;
    long long v21 = 0u;
    long long v18 = 0u;
    long long v19 = 0u;
    v7 = -[GEOPDBusinessAssets croppedCoverPhotos]((id *)&self->_businessAssets->super.super.isa);
    uint64_t v8 = [v7 countByEnumeratingWithState:&v18 objects:v22 count:16];
    if (v8)
    {
      uint64_t v9 = v8;
      uint64_t v10 = *(void *)v19;
      do
      {
        uint64_t v11 = 0;
        do
        {
          if (*(void *)v19 != v10) {
            objc_enumerationMutation(v7);
          }
          uint64_t v12 = *(void *)(*((void *)&v18 + 1) + 8 * v11);
          v13 = [_GEOPlaceDataPhoto alloc];
          v14 = -[_GEOPlaceDataPhoto initWithCaptionedPhoto:](v13, "initWithCaptionedPhoto:", v12, (void)v18);
          [v6 addObject:v14];

          ++v11;
        }
        while (v9 != v11);
        uint64_t v9 = [v7 countByEnumeratingWithState:&v18 objects:v22 count:16];
      }
      while (v9);
    }

    v15 = (NSArray *)[v6 copy];
    v16 = self->_croppedPhotos;
    self->_croppedPhotos = v15;

    croppedPhotos = self->_croppedPhotos;
  }

  return croppedPhotos;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_croppedPhotos, 0);
  objc_storeStrong((id *)&self->_coverPhotos, 0);

  objc_storeStrong((id *)&self->_businessAssets, 0);
}

+ (GEOBusinessAssets)businessAssetsWithPlaceData:(id)a3
{
  id v3 = a3;
  uint64_t v7 = 0;
  uint64_t v8 = &v7;
  uint64_t v9 = 0x3032000000;
  uint64_t v10 = __Block_byref_object_copy__37;
  uint64_t v11 = __Block_byref_object_dispose__37;
  id v12 = 0;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __66__GEOBusinessAssets_PlaceDataExtras__businessAssetsWithPlaceData___block_invoke;
  v6[3] = &unk_1E53E16F0;
  v6[4] = &v7;
  [v3 enumerateValidComponentValuesOfType:92 usingBlock:v6];
  id v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return (GEOBusinessAssets *)v4;
}

void __66__GEOBusinessAssets_PlaceDataExtras__businessAssetsWithPlaceData___block_invoke(uint64_t a1, id *a2, unsigned char *a3)
{
  -[GEOPDComponentValue businessAssets](a2);
  id v8 = (id)objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    id v5 = [[GEOBusinessAssets alloc] initWithBusinessAssets:v8];
    uint64_t v6 = *(void *)(*(void *)(a1 + 32) + 8);
    uint64_t v7 = *(void **)(v6 + 40);
    *(void *)(v6 + 40) = v5;

    *a3 = 1;
  }
}

@end