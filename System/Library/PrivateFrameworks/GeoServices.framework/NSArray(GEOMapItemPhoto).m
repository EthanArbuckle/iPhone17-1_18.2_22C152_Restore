@interface NSArray(GEOMapItemPhoto)
- (id)_geo_firstPhotoOfAtLeastSize:()GEOMapItemPhoto;
@end

@implementation NSArray(GEOMapItemPhoto)

- (id)_geo_firstPhotoOfAtLeastSize:()GEOMapItemPhoto
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  id v5 = a1;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v22 objects:v27 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v23;
LABEL_3:
    uint64_t v9 = 0;
    while (1)
    {
      if (*(void *)v23 != v8) {
        objc_enumerationMutation(v5);
      }
      uint64_t v10 = objc_msgSend(*(id *)(*((void *)&v22 + 1) + 8 * v9), "bestPhotoForSize:allowSmaller:", 0, a2, a3);
      if (v10) {
        goto LABEL_18;
      }
      if (v7 == ++v9)
      {
        uint64_t v7 = [v5 countByEnumeratingWithState:&v22 objects:v27 count:16];
        if (v7) {
          goto LABEL_3;
        }
        break;
      }
    }
  }

  long long v20 = 0u;
  long long v21 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id v11 = v5;
  uint64_t v12 = [v11 countByEnumeratingWithState:&v18 objects:v26 count:16];
  if (v12)
  {
    uint64_t v13 = v12;
    uint64_t v14 = *(void *)v19;
LABEL_11:
    uint64_t v15 = 0;
    while (1)
    {
      if (*(void *)v19 != v14) {
        objc_enumerationMutation(v11);
      }
      uint64_t v10 = objc_msgSend(*(id *)(*((void *)&v18 + 1) + 8 * v15), "bestPhotoForSize:allowSmaller:", 1, a2, a3, (void)v18);
      if (v10) {
        break;
      }
      if (v13 == ++v15)
      {
        uint64_t v13 = [v11 countByEnumeratingWithState:&v18 objects:v26 count:16];
        v16 = 0;
        if (v13) {
          goto LABEL_11;
        }
        goto LABEL_19;
      }
    }
LABEL_18:
    v16 = (void *)v10;
    goto LABEL_19;
  }
  v16 = 0;
LABEL_19:

  return v16;
}

@end