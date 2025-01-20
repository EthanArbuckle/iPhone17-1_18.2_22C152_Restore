@interface GEOPhotoInfoSource
- (GEOPhotoInfoProvider)principalPhotoInfoProvider;
- (GEOPhotoInfoSource)initWithPhotoContent:(id)a3;
- (NSArray)allPhotoInfoProviders;
- (double)sizeRatio;
- (id)bestPhotoForSize:(CGSize)a3 options:(id)a4;
- (id)largestPhoto;
@end

@implementation GEOPhotoInfoSource

- (id)bestPhotoForSize:(CGSize)a3 options:(id)a4
{
  double height = a3.height;
  double width = a3.width;
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v7 = a4;
  memset(v11, 0, sizeof(v11));
  v8 = [(GEOPhotoInfoSource *)self allPhotoInfoProviders];
  if ([v8 countByEnumeratingWithState:v11 objects:v12 count:16])
  {
    v9 = objc_msgSend(**((id **)&v11[0] + 1), "bestPhotoForSize:options:", v7, width, height);
  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (NSArray)allPhotoInfoProviders
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  v4 = v3;
  if (self->_ampPhotoInfoProvider) {
    objc_msgSend(v3, "addObject:");
  }
  if (self->_defaultPhotoInfoProvider) {
    objc_msgSend(v4, "addObject:");
  }
  v5 = (void *)[v4 copy];

  return (NSArray *)v5;
}

- (GEOPhotoInfoSource)initWithPhotoContent:(id)a3
{
  id v5 = a3;
  v14.receiver = self;
  v14.super_class = (Class)GEOPhotoInfoSource;
  v6 = [(GEOPhotoInfoSource *)&v14 init];
  id v7 = v6;
  if (!v6) {
    goto LABEL_4;
  }
  objc_storeStrong((id *)&v6->_originalPhotoContent, a3);
  v8 = [[GEOAMPPhotoInfoProvider alloc] initWithPhotoContent:v7->_originalPhotoContent];
  ampPhotoInfoProvider = v7->_ampPhotoInfoProvider;
  v7->_ampPhotoInfoProvider = v8;

  v10 = [[GEODefaultPhotoInfoProvider alloc] initWithPhotoContent:v7->_originalPhotoContent];
  defaultPhotoInfoProvider = v7->_defaultPhotoInfoProvider;
  v7->_defaultPhotoInfoProvider = v10;

  if (v7->_ampPhotoInfoProvider || v7->_defaultPhotoInfoProvider) {
LABEL_4:
  }
    v12 = v7;
  else {
    v12 = 0;
  }

  return v12;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_defaultPhotoInfoProvider, 0);
  objc_storeStrong((id *)&self->_ampPhotoInfoProvider, 0);

  objc_storeStrong((id *)&self->_originalPhotoContent, 0);
}

- (GEOPhotoInfoProvider)principalPhotoInfoProvider
{
  ampPhotoInfoProvider = self->_ampPhotoInfoProvider;
  if (!ampPhotoInfoProvider) {
    ampPhotoInfoProvider = self->_defaultPhotoInfoProvider;
  }
  id v3 = ampPhotoInfoProvider;

  return (GEOPhotoInfoProvider *)v3;
}

- (double)sizeRatio
{
  v2 = [(GEOPhotoInfoSource *)self principalPhotoInfoProvider];
  [v2 sizeRatio];
  double v4 = v3;

  return v4;
}

- (id)largestPhoto
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  v2 = [(GEOPhotoInfoSource *)self allPhotoInfoProviders];
  uint64_t v3 = [v2 countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    id v5 = 0;
    uint64_t v6 = *(void *)v19;
    do
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v19 != v6) {
          objc_enumerationMutation(v2);
        }
        v8 = [*(id *)(*((void *)&v18 + 1) + 8 * i) largestPhoto];
        v9 = v8;
        if (!v5
          || ([v8 size], double v11 = v10, objc_msgSend(v5, "size"), v11 > v12)
          && ([v9 size], double v14 = v13, objc_msgSend(v5, "size"), v14 > v15))
        {
          id v16 = v9;

          id v5 = v16;
        }
      }
      uint64_t v4 = [v2 countByEnumeratingWithState:&v18 objects:v22 count:16];
    }
    while (v4);
  }
  else
  {
    id v5 = 0;
  }

  return v5;
}

@end