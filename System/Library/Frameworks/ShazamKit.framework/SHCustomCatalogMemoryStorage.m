@interface SHCustomCatalogMemoryStorage
- (NSArray)referenceSignatures;
- (NSMutableDictionary)mediaItems;
- (NSMutableDictionary)signatures;
- (SHCustomCatalogMemoryStorage)init;
- (id)mediaItemsForReferenceSignature:(id)a3;
- (id)referenceSignatureForTrackID:(unint64_t)a3;
- (void)addSignature:(id)a3 representingMediaItems:(id)a4;
- (void)producedMediaItem:(id)a3 forID:(id)a4;
- (void)producedSignature:(id)a3 forID:(id)a4;
- (void)setMediaItems:(id)a3;
- (void)setSignatures:(id)a3;
@end

@implementation SHCustomCatalogMemoryStorage

- (SHCustomCatalogMemoryStorage)init
{
  v8.receiver = self;
  v8.super_class = (Class)SHCustomCatalogMemoryStorage;
  v2 = [(SHCustomCatalogMemoryStorage *)&v8 init];
  if (v2)
  {
    uint64_t v3 = [MEMORY[0x263EFF9A0] dictionary];
    signatures = v2->_signatures;
    v2->_signatures = (NSMutableDictionary *)v3;

    uint64_t v5 = [MEMORY[0x263EFF9A0] dictionary];
    mediaItems = v2->_mediaItems;
    v2->_mediaItems = (NSMutableDictionary *)v5;
  }
  return v2;
}

- (NSArray)referenceSignatures
{
  uint64_t v36 = *MEMORY[0x263EF8340];
  referenceSignatures = self->_referenceSignatures;
  if (referenceSignatures)
  {
    uint64_t v3 = referenceSignatures;
  }
  else
  {
    v4 = self;
    uint64_t v5 = [MEMORY[0x263EFF980] array];
    long long v30 = 0u;
    long long v31 = 0u;
    long long v32 = 0u;
    long long v33 = 0u;
    v6 = [(SHCustomCatalogMemoryStorage *)v4 signatures];
    v7 = [v6 allKeys];

    uint64_t v24 = [v7 countByEnumeratingWithState:&v30 objects:v35 count:16];
    if (v24)
    {
      uint64_t v8 = 0;
      v22 = v4;
      uint64_t v23 = *(void *)v31;
      do
      {
        for (uint64_t i = 0; i != v24; ++i)
        {
          if (*(void *)v31 != v23) {
            objc_enumerationMutation(v7);
          }
          uint64_t v10 = *(void *)(*((void *)&v30 + 1) + 8 * i);
          v11 = [(SHCustomCatalogMemoryStorage *)v4 signatures];
          v12 = [v11 objectForKeyedSubscript:v10];

          long long v28 = 0u;
          long long v29 = 0u;
          long long v26 = 0u;
          long long v27 = 0u;
          id v13 = v12;
          uint64_t v14 = [v13 countByEnumeratingWithState:&v26 objects:v34 count:16];
          if (v14)
          {
            uint64_t v15 = v14;
            uint64_t v25 = i;
            uint64_t v16 = *(void *)v27;
            do
            {
              for (uint64_t j = 0; j != v15; ++j)
              {
                if (*(void *)v27 != v16) {
                  objc_enumerationMutation(v13);
                }
                v18 = [[SHReferenceSignature alloc] initWithID:v10 trackID:v8 + j signature:*(void *)(*((void *)&v26 + 1) + 8 * j)];
                [v5 addObject:v18];
              }
              uint64_t v15 = [v13 countByEnumeratingWithState:&v26 objects:v34 count:16];
              v8 += j;
            }
            while (v15);
            v4 = v22;
            uint64_t i = v25;
          }
        }
        uint64_t v24 = [v7 countByEnumeratingWithState:&v30 objects:v35 count:16];
      }
      while (v24);
    }

    uint64_t v19 = [v5 copy];
    v20 = v4->_referenceSignatures;
    v4->_referenceSignatures = (NSArray *)v19;

    uint64_t v3 = v4->_referenceSignatures;
  }

  return v3;
}

- (id)mediaItemsForReferenceSignature:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(SHCustomCatalogMemoryStorage *)self mediaItems];
  v6 = [v4 ID];

  v7 = [v5 objectForKeyedSubscript:v6];
  uint64_t v8 = v7;
  if (!v7) {
    v7 = (void *)MEMORY[0x263EFFA68];
  }
  id v9 = v7;

  return v9;
}

- (void)addSignature:(id)a3 representingMediaItems:(id)a4
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [v6 _ID];
  id v9 = [v8 UUIDString];
  [(SHCustomCatalogMemoryStorage *)self producedSignature:v6 forID:v9];

  long long v20 = 0u;
  long long v21 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id v10 = v7;
  uint64_t v11 = [v10 countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v13 = *(void *)v19;
    do
    {
      uint64_t v14 = 0;
      do
      {
        if (*(void *)v19 != v13) {
          objc_enumerationMutation(v10);
        }
        uint64_t v15 = *(void *)(*((void *)&v18 + 1) + 8 * v14);
        uint64_t v16 = objc_msgSend(v6, "_ID", (void)v18);
        v17 = [v16 UUIDString];
        [(SHCustomCatalogMemoryStorage *)self producedMediaItem:v15 forID:v17];

        ++v14;
      }
      while (v12 != v14);
      uint64_t v12 = [v10 countByEnumeratingWithState:&v18 objects:v22 count:16];
    }
    while (v12);
  }
}

- (id)referenceSignatureForTrackID:(unint64_t)a3
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v4 = [(SHCustomCatalogMemoryStorage *)self referenceSignatures];
  uint64_t v5 = [v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v13;
    while (2)
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v13 != v7) {
          objc_enumerationMutation(v4);
        }
        id v9 = *(void **)(*((void *)&v12 + 1) + 8 * i);
        if ([v9 trackID] == a3)
        {
          id v10 = v9;
          goto LABEL_11;
        }
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
      if (v6) {
        continue;
      }
      break;
    }
  }
  id v10 = 0;
LABEL_11:

  return v10;
}

- (void)producedMediaItem:(id)a3 forID:(id)a4
{
  id v14 = a4;
  referenceSignatures = self->_referenceSignatures;
  self->_referenceSignatures = 0;
  id v7 = a3;

  uint64_t v8 = [(SHCustomCatalogMemoryStorage *)self mediaItems];
  id v9 = [v8 objectForKeyedSubscript:v14];

  if (!v9)
  {
    id v10 = [MEMORY[0x263EFF980] array];
    uint64_t v11 = [(SHCustomCatalogMemoryStorage *)self mediaItems];
    [v11 setObject:v10 forKeyedSubscript:v14];
  }
  long long v12 = [(SHCustomCatalogMemoryStorage *)self mediaItems];
  long long v13 = [v12 objectForKeyedSubscript:v14];
  [v13 addObject:v7];
}

- (void)producedSignature:(id)a3 forID:(id)a4
{
  id v14 = a4;
  referenceSignatures = self->_referenceSignatures;
  self->_referenceSignatures = 0;
  id v7 = a3;

  uint64_t v8 = [(SHCustomCatalogMemoryStorage *)self signatures];
  id v9 = [v8 objectForKeyedSubscript:v14];

  if (!v9)
  {
    id v10 = [MEMORY[0x263EFF980] array];
    uint64_t v11 = [(SHCustomCatalogMemoryStorage *)self signatures];
    [v11 setObject:v10 forKeyedSubscript:v14];
  }
  long long v12 = [(SHCustomCatalogMemoryStorage *)self signatures];
  long long v13 = [v12 objectForKeyedSubscript:v14];
  [v13 addObject:v7];
}

- (NSMutableDictionary)signatures
{
  return self->_signatures;
}

- (void)setSignatures:(id)a3
{
}

- (NSMutableDictionary)mediaItems
{
  return self->_mediaItems;
}

- (void)setMediaItems:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_mediaItems, 0);
  objc_storeStrong((id *)&self->_signatures, 0);

  objc_storeStrong((id *)&self->_referenceSignatures, 0);
}

@end