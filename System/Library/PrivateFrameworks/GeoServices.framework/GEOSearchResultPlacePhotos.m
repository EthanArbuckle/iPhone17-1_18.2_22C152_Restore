@interface GEOSearchResultPlacePhotos
- (GEOSearchResultPlacePhotos)initWithSearchResultPlacePhotos:(id)a3;
- (NSArray)photos;
@end

@implementation GEOSearchResultPlacePhotos

- (GEOSearchResultPlacePhotos)initWithSearchResultPlacePhotos:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)GEOSearchResultPlacePhotos;
  v6 = [(GEOSearchResultPlacePhotos *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_searchResultPlacePhotos, a3);
  }

  return v7;
}

- (NSArray)photos
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  v4 = self->_searchResultPlacePhotos;
  uint64_t v5 = [(NSArray *)v4 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v15;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v15 != v7) {
          objc_enumerationMutation(v4);
        }
        uint64_t v9 = *(void *)(*((void *)&v14 + 1) + 8 * i);
        v10 = [_GEOPlaceDataPhoto alloc];
        v11 = -[_GEOPlaceDataPhoto initWithCaptionedPhoto:](v10, "initWithCaptionedPhoto:", v9, (void)v14);
        if (v11) {
          [v3 addObject:v11];
        }
      }
      uint64_t v6 = [(NSArray *)v4 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v6);
  }

  v12 = (void *)[v3 copy];

  return (NSArray *)v12;
}

- (void).cxx_destruct
{
}

@end