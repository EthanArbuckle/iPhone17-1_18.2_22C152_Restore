@interface GEODefaultPhotoInfoProvider
+ (id)sortedPhotoInfoFromPhotoVersions:(id)a3;
- (GEODefaultPhotoInfoProvider)initWithPhotoContent:(id)a3;
- (double)sizeRatio;
- (id)bestPhotoForSize:(CGSize)a3 options:(id)a4;
- (id)largestPhoto;
- (int)designatedURLType;
@end

@implementation GEODefaultPhotoInfoProvider

- (id)bestPhotoForSize:(CGSize)a3 options:(id)a4
{
  double height = a3.height;
  double width = a3.width;
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  id v7 = a4;
  sortedPhotoInfos = self->_sortedPhotoInfos;
  int v9 = [v7 allowSmaller];
  v10 = sortedPhotoInfos;
  if ([(NSArray *)v10 count])
  {
    if (v9)
    {
      id v11 = [(NSArray *)v10 firstObject];
    }
    else
    {
      id v11 = 0;
    }
    long long v31 = 0u;
    long long v32 = 0u;
    long long v29 = 0u;
    long long v30 = 0u;
    v13 = v10;
    uint64_t v14 = [(NSArray *)v13 countByEnumeratingWithState:&v29 objects:v33 count:16];
    if (v14)
    {
      uint64_t v15 = v14;
      uint64_t v16 = *(void *)v30;
      while (2)
      {
        for (uint64_t i = 0; i != v15; ++i)
        {
          if (*(void *)v30 != v16) {
            objc_enumerationMutation(v13);
          }
          v18 = *(void **)(*((void *)&v29 + 1) + 8 * i);
          objc_msgSend(v18, "size", (void)v29);
          if (v19 >= width || ([v18 size], v20 >= height))
          {
            id v12 = v18;

            goto LABEL_21;
          }
          if (v9)
          {
            [v18 size];
            double v22 = v21;
            [v11 size];
            if (v22 >= v23 || ([v18 size], double v25 = v24, objc_msgSend(v11, "size"), v25 >= v26))
            {
              id v27 = v18;

              id v11 = v27;
            }
          }
        }
        uint64_t v15 = [(NSArray *)v13 countByEnumeratingWithState:&v29 objects:v33 count:16];
        if (v15) {
          continue;
        }
        break;
      }
    }

    id v11 = v11;
    id v12 = v11;
LABEL_21:
  }
  else
  {
    id v12 = 0;
  }

  return v12;
}

- (double)sizeRatio
{
  if (![(NSArray *)self->_sortedPhotoInfos count]) {
    return 0.0;
  }
  v3 = [(NSArray *)self->_sortedPhotoInfos lastObject];
  [v3 size];
  double v4 = 0.0;
  if (v5 > 0.0)
  {
    [v3 size];
    double v7 = v6;
    [v3 size];
    double v4 = v7 / v8;
  }

  return v4;
}

uint64_t __64__GEODefaultPhotoInfoProvider_sortedPhotoInfoFromPhotoVersions___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4 = a2;
  id v5 = a3;
  [v4 size];
  double v7 = v6;
  [v4 size];
  double v9 = v8;
  [v4 size];
  if (v7 <= v9) {
    double v12 = v11;
  }
  else {
    double v12 = v10;
  }
  [v5 size];
  double v14 = v13;
  [v5 size];
  double v16 = v15;
  [v5 size];
  if (v14 <= v16) {
    double v17 = v18;
  }
  if (v12 >= v17)
  {
    if (v12 <= v17)
    {
      [v4 size];
      double v21 = v20;
      [v4 size];
      double v23 = v22;
      [v4 size];
      if (v21 >= v23) {
        double v26 = v25;
      }
      else {
        double v26 = v24;
      }
      [v5 size];
      double v28 = v27;
      [v5 size];
      double v30 = v29;
      [v5 size];
      if (v28 >= v30) {
        double v31 = v32;
      }
      if (v26 < v31) {
        uint64_t v19 = -1;
      }
      else {
        uint64_t v19 = v26 > v31;
      }
    }
    else
    {
      uint64_t v19 = 1;
    }
  }
  else
  {
    uint64_t v19 = -1;
  }

  return v19;
}

- (void).cxx_destruct
{
}

- (GEODefaultPhotoInfoProvider)initWithPhotoContent:(id)a3
{
  id v4 = a3;
  int v5 = [(GEODefaultPhotoInfoProvider *)self designatedURLType];
  double v6 = (void *)MEMORY[0x1E4F28F60];
  v20[0] = MEMORY[0x1E4F143A8];
  v20[1] = 3221225472;
  v20[2] = ___photoContentForURLType_block_invoke;
  v20[3] = &__block_descriptor_36_e44_B24__0__GEOPDPhotoContent_8__NSDictionary_16l;
  int v21 = v5;
  id v7 = v4;
  double v8 = [v6 predicateWithBlock:v20];
  double v9 = [v7 filteredArrayUsingPredicate:v8];

  if (![v9 count]) {
    goto LABEL_7;
  }
  v19.receiver = self;
  v19.super_class = (Class)GEODefaultPhotoInfoProvider;
  self = [(GEODefaultPhotoInfoProvider *)&v19 init];
  if (self)
  {
    double v10 = +[GEODefaultPhotoInfoProvider sortedPhotoInfoFromPhotoVersions:v9];
    sortedPhotoInfos = self->_sortedPhotoInfos;
    self->_sortedPhotoInfos = v10;

    double v12 = [(NSArray *)self->_sortedPhotoInfos firstObject];
    uint64_t v13 = [v12 url];
    if (v13)
    {
      double v14 = (void *)v13;
      [(GEODefaultPhotoInfoProvider *)self sizeRatio];
      double v16 = v15;

      if (v16 != 0.0) {
        goto LABEL_5;
      }
    }
    else
    {
    }
LABEL_7:
    double v17 = 0;
    goto LABEL_8;
  }
LABEL_5:
  self = self;
  double v17 = self;
LABEL_8:

  return v17;
}

- (int)designatedURLType
{
  return 0;
}

+ (id)sortedPhotoInfoFromPhotoVersions:(id)a3
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  id v4 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(v3, "count"));
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  id obj = v3;
  uint64_t v5 = [obj countByEnumeratingWithState:&v22 objects:v26 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v23;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v23 != v7) {
          objc_enumerationMutation(obj);
        }
        uint64_t v9 = *(void *)(*((void *)&v22 + 1) + 8 * v8);
        double v10 = [_GEOPlaceDataPhotoInfo alloc];
        double v11 = (void *)MEMORY[0x1E4F1CB10];
        double v12 = -[GEOPDPhotoContent url]((id *)v9);
        uint64_t v13 = [v11 URLWithString:v12];
        if (v9)
        {
          LODWORD(v14) = *(_DWORD *)(v9 + 32);
          double v15 = (double)v14;
          unsigned int v16 = *(_DWORD *)(v9 + 24);
        }
        else
        {
          unsigned int v16 = 0;
          double v15 = 0.0;
        }
        double v17 = [(_GEOPlaceDataPhotoInfo *)v10 initWithURL:v13 width:v15 height:(double)v16];

        if (v17) {
          [v4 addObject:v17];
        }

        ++v8;
      }
      while (v6 != v8);
      uint64_t v18 = [obj countByEnumeratingWithState:&v22 objects:v26 count:16];
      uint64_t v6 = v18;
    }
    while (v18);
  }

  objc_super v19 = [v4 sortedArrayUsingComparator:&__block_literal_global_196];

  return v19;
}

- (id)largestPhoto
{
  return [(NSArray *)self->_sortedPhotoInfos lastObject];
}

@end