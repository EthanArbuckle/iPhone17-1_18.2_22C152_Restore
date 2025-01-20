@interface GEOPlacePhotoLookupResult
+ (void)buildLookupResultForPlaceWithPhotoCategories:(id)a3 mapItemIdentifier:(id)a4 originalRange:(_NSRange)a5 completion:(id)a6;
+ (void)buildVendorLookupResultForPlaceWithCaptionedPhotos:(id)a3 mapItemIdentifier:(id)a4 originalRange:(_NSRange)a5 completion:(id)a6;
- (GEOMapItemIdentifier)mapItemIdentifier;
- (GEOPlacePhotoLookupResult)initWithPhotos:(id)a3 totalPhotoCount:(unint64_t)a4 mapItemItemIdentifier:(id)a5 originalRange:(_NSRange)a6;
- (NSArray)photos;
- (unint64_t)totalPhotoCount;
@end

@implementation GEOPlacePhotoLookupResult

- (GEOPlacePhotoLookupResult)initWithPhotos:(id)a3 totalPhotoCount:(unint64_t)a4 mapItemItemIdentifier:(id)a5 originalRange:(_NSRange)a6
{
  NSUInteger length = a6.length;
  NSUInteger location = a6.location;
  id v11 = a3;
  id v12 = a5;
  v17.receiver = self;
  v17.super_class = (Class)GEOPlacePhotoLookupResult;
  v13 = [(GEOPlacePhotoLookupResult *)&v17 init];
  if (v13)
  {
    uint64_t v14 = [v11 copy];
    photos = v13->_photos;
    v13->_photos = (NSArray *)v14;

    objc_storeStrong((id *)&v13->_mapItemIdentifier, a5);
    v13->_originalRange.NSUInteger location = location;
    v13->_originalRange.NSUInteger length = length;
    v13->_totalPhotoCount = a4;
  }

  return v13;
}

+ (void)buildVendorLookupResultForPlaceWithCaptionedPhotos:(id)a3 mapItemIdentifier:(id)a4 originalRange:(_NSRange)a5 completion:(id)a6
{
  NSUInteger length = a5.length;
  NSUInteger location = a5.location;
  v34[1] = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a4;
  id v12 = a6;
  v13 = +[GEOPDCaptionedPhoto captionedPhotosForPlaceData:v10];
  uint64_t v14 = +[GEOPDAttribution componentLevelAttributionForPlaceDataPhotos:v10];
  v15 = -[GEOPDAttribution vendorId](v14);
  uint64_t v16 = [v15 length];

  if (v16)
  {
    objc_super v17 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(v13, "count"));
    v18 = (void *)MEMORY[0x1E4F1CAD0];
    v19 = -[GEOPDAttribution vendorId](v14);
    v20 = [v18 setWithObject:v19];
    v24[0] = MEMORY[0x1E4F143A8];
    v24[1] = 3221225472;
    v24[2] = __123__GEOPlacePhotoLookupResult_buildVendorLookupResultForPlaceWithCaptionedPhotos_mapItemIdentifier_originalRange_completion___block_invoke;
    v24[3] = &unk_1E53F5C70;
    v25 = v14;
    id v30 = v12;
    id v26 = v13;
    id v27 = v17;
    id v28 = v10;
    id v29 = v11;
    NSUInteger v31 = location;
    NSUInteger v32 = length;
    id v21 = v17;
    _loadAttributions(v20, v24);
  }
  else
  {
    v22 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v33 = *MEMORY[0x1E4F1D140];
    v34[0] = @"There is no attribution in the captioned photos component. ";
    v23 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v34 forKeys:&v33 count:1];
    id v21 = [v22 GEOErrorWithCode:-11 userInfo:v23];

    (*((void (**)(id, void, id))v12 + 2))(v12, 0, v21);
  }
}

void __123__GEOPlacePhotoLookupResult_buildVendorLookupResultForPlaceWithCaptionedPhotos_mapItemIdentifier_originalRange_completion___block_invoke(uint64_t a1, void *a2)
{
  v36[1] = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if ([v3 count] == 1)
  {
    v4 = -[GEOPDAttribution vendorId](*(id **)(a1 + 32));
    v5 = [v3 objectForKey:v4];

    if (v5 && ([v5 hasAttributionRequirement:3] & 1) != 0)
    {
      v6 = +[GEOMapItemAttribution attributionWithDataAttribution:*(void *)(a1 + 32) searchInfo:v5 class:objc_opt_class()];
      long long v28 = 0u;
      long long v29 = 0u;
      long long v30 = 0u;
      long long v31 = 0u;
      id v7 = *(id *)(a1 + 40);
      uint64_t v8 = [v7 countByEnumeratingWithState:&v28 objects:v32 count:16];
      if (v8)
      {
        uint64_t v9 = v8;
        uint64_t v10 = *(void *)v29;
        do
        {
          uint64_t v11 = 0;
          do
          {
            if (*(void *)v29 != v10) {
              objc_enumerationMutation(v7);
            }
            id v12 = [[_GEOPlaceDataPhoto alloc] initWithCaptionedPhoto:*(void *)(*((void *)&v28 + 1) + 8 * v11) attribution:v6];
            [*(id *)(a1 + 48) addObject:v12];

            ++v11;
          }
          while (v9 != v11);
          uint64_t v9 = [v7 countByEnumeratingWithState:&v28 objects:v32 count:16];
        }
        while (v9);
      }

      v13 = [*(id *)(a1 + 56) componentOfType:26 options:3];
      if (v13) {
        uint64_t v14 = v13[23];
      }
      else {
        uint64_t v14 = 0;
      }

      v15 = [GEOPlacePhotoLookupResult alloc];
      uint64_t v16 = (void *)[*(id *)(a1 + 48) copy];
      objc_super v17 = -[GEOPlacePhotoLookupResult initWithPhotos:totalPhotoCount:mapItemItemIdentifier:originalRange:](v15, "initWithPhotos:totalPhotoCount:mapItemItemIdentifier:originalRange:", v16, v14, *(void *)(a1 + 64), *(void *)(a1 + 80), *(void *)(a1 + 88));

      (*(void (**)(void))(*(void *)(a1 + 72) + 16))();
    }
    else
    {
      v25 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v33 = *MEMORY[0x1E4F1D140];
      id v26 = [NSString stringWithFormat:@"Error in creating photos map item attribution with info %@", v5];
      v34 = v26;
      id v27 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v34 forKeys:&v33 count:1];
      v6 = [v25 GEOErrorWithCode:-11 userInfo:v27];

      (*(void (**)(void))(*(void *)(a1 + 72) + 16))();
    }
  }
  else
  {
    v18 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v35 = *MEMORY[0x1E4F1D140];
    v19 = NSString;
    v20 = -[GEOPDAttribution vendorId](*(id **)(a1 + 32));
    id v21 = [v3 keyEnumerator];
    v22 = [v21 allObjects];
    v23 = [v19 stringWithFormat:@"Error in fetching vendor identifiers. Requested %@ but received %@", v20, v22];
    v36[0] = v23;
    v24 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v36 forKeys:&v35 count:1];
    v5 = [v18 GEOErrorWithCode:-11 userInfo:v24];

    (*(void (**)(void))(*(void *)(a1 + 72) + 16))();
  }
}

+ (void)buildLookupResultForPlaceWithPhotoCategories:(id)a3 mapItemIdentifier:(id)a4 originalRange:(_NSRange)a5 completion:(id)a6
{
  uint64_t v40 = *MEMORY[0x1E4F143B8];
  id v8 = a4;
  id v9 = a6;
  uint64_t v10 = [a3 successfulComponentWithValuesOfType:84];
  id v11 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
  long long v28 = v10;
  id v12 = -[GEOPDComponent values](v10);
  v13 = [v12 firstObject];
  -[GEOPDComponentValue categorizedPhotos](v13);
  uint64_t v14 = (id *)objc_claimAutoreleasedReturnValue();

  long long v37 = 0u;
  long long v38 = 0u;
  long long v35 = 0u;
  long long v36 = 0u;
  v15 = -[GEOPDCategorizedPhotos photos](v14);
  uint64_t v16 = [v15 countByEnumeratingWithState:&v35 objects:v39 count:16];
  if (v16)
  {
    uint64_t v17 = v16;
    uint64_t v18 = *(void *)v36;
    do
    {
      uint64_t v19 = 0;
      do
      {
        if (*(void *)v36 != v18) {
          objc_enumerationMutation(v15);
        }
        -[GEOPDCaptionedPhoto attribution](*(id **)(*((void *)&v35 + 1) + 8 * v19));
        v20 = (id *)objc_claimAutoreleasedReturnValue();
        id v21 = -[GEOPDAttribution vendorId](v20);

        if ([v21 length]) {
          [v11 addObject:v21];
        }

        ++v19;
      }
      while (v17 != v19);
      uint64_t v17 = [v15 countByEnumeratingWithState:&v35 objects:v39 count:16];
    }
    while (v17);
  }

  v22 = (void *)[v11 copy];
  v29[0] = MEMORY[0x1E4F143A8];
  v29[1] = 3221225472;
  v29[2] = __117__GEOPlacePhotoLookupResult_buildLookupResultForPlaceWithPhotoCategories_mapItemIdentifier_originalRange_completion___block_invoke;
  v29[3] = &unk_1E53F5C98;
  id v30 = v11;
  long long v31 = v14;
  id v32 = v8;
  id v33 = v9;
  _NSRange v34 = a5;
  id v23 = v8;
  v24 = v14;
  id v25 = v9;
  id v26 = v11;
  _loadAttributions(v22, v29);
}

void __117__GEOPlacePhotoLookupResult_buildLookupResultForPlaceWithPhotoCategories_mapItemIdentifier_originalRange_completion___block_invoke(uint64_t a1, void *a2)
{
  v34[1] = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  uint64_t v4 = [*(id *)(a1 + 32) count];
  if (v4 == [v3 count])
  {
    id v5 = objc_alloc(MEMORY[0x1E4F1CA48]);
    v6 = -[GEOPDCategorizedPhotos photos](*(id **)(a1 + 40));
    id v7 = objc_msgSend(v5, "initWithCapacity:", objc_msgSend(v6, "count"));

    long long v30 = 0u;
    long long v31 = 0u;
    long long v28 = 0u;
    long long v29 = 0u;
    id v26 = (uint64_t *)a1;
    -[GEOPDCategorizedPhotos photos](*(id **)(a1 + 40));
    id obj = (id)objc_claimAutoreleasedReturnValue();
    uint64_t v8 = [obj countByEnumeratingWithState:&v28 objects:v32 count:16];
    if (v8)
    {
      uint64_t v9 = v8;
      uint64_t v10 = *(void *)v29;
      do
      {
        for (uint64_t i = 0; i != v9; ++i)
        {
          if (*(void *)v29 != v10) {
            objc_enumerationMutation(obj);
          }
          id v12 = *(id **)(*((void *)&v28 + 1) + 8 * i);
          -[GEOPDCaptionedPhoto attribution](v12);
          v13 = (id *)objc_claimAutoreleasedReturnValue();
          uint64_t v14 = -[GEOPDAttribution vendorId](v13);
          v15 = [v3 objectForKey:v14];

          uint64_t v16 = -[GEOPDCaptionedPhoto attribution](v12);
          uint64_t v17 = +[GEOMapItemAttribution attributionWithDataAttribution:v16 searchInfo:v15 class:objc_opt_class()];

          uint64_t v18 = [[_GEOPlaceDataPhoto alloc] initWithCaptionedPhoto:v12 attribution:v17];
          [v7 addObject:v18];
        }
        uint64_t v9 = [obj countByEnumeratingWithState:&v28 objects:v32 count:16];
      }
      while (v9);
    }

    uint64_t v19 = [GEOPlacePhotoLookupResult alloc];
    uint64_t v20 = v26[5];
    if (v20)
    {
      -[GEOPDCategorizedPhotos _readPhotos](v26[5]);
      uint64_t v21 = [*(id *)(v20 + 40) count];
    }
    else
    {
      uint64_t v21 = 0;
    }
    v22 = -[GEOPlacePhotoLookupResult initWithPhotos:totalPhotoCount:mapItemItemIdentifier:originalRange:](v19, "initWithPhotos:totalPhotoCount:mapItemItemIdentifier:originalRange:", v7, v21, v26[6], v26[8], v26[9]);
    (*(void (**)(void))(v26[7] + 16))();
  }
  else
  {
    id v23 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v33 = *MEMORY[0x1E4F1D140];
    v24 = [NSString stringWithFormat:@"Error in loading attribution map"];
    v34[0] = v24;
    id v25 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v34 forKeys:&v33 count:1];
    id v7 = [v23 GEOErrorWithCode:-11 userInfo:v25];

    (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
  }
}

- (NSArray)photos
{
  return self->_photos;
}

- (GEOMapItemIdentifier)mapItemIdentifier
{
  return self->_mapItemIdentifier;
}

- (unint64_t)totalPhotoCount
{
  return self->_totalPhotoCount;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_mapItemIdentifier, 0);

  objc_storeStrong((id *)&self->_photos, 0);
}

@end