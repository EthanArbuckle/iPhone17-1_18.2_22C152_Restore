@interface MPStoreItemImportTrackData
+ (id)_importPropertiesDictFromImportMetadataDict:(id)a3;
- (MPStoreItemImportTrackData)initWithImportElements:(id)a3;
- (NSArray)importElements;
- (id)_associatedElementForPropertyDict:(id)a3;
- (id)parsedStoreItemsImportProperties;
@end

@implementation MPStoreItemImportTrackData

- (void).cxx_destruct
{
}

- (NSArray)importElements
{
  return self->_importElements;
}

- (id)_associatedElementForPropertyDict:(id)a3
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  v5 = self->_importElements;
  uint64_t v6 = [(NSArray *)v5 countByEnumeratingWithState:&v22 objects:v26 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v23;
    while (2)
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v23 != v8) {
          objc_enumerationMutation(v5);
        }
        v10 = *(void **)(*((void *)&v22 + 1) + 8 * i);
        v11 = objc_msgSend(v4, "objectForKeyedSubscript:", &unk_1EE6ED298, (void)v22);
        uint64_t v12 = [v11 longLongValue];
        uint64_t v13 = [v10 storeItemID];

        if (v12 == v13) {
          goto LABEL_12;
        }
        v14 = [v4 objectForKeyedSubscript:&unk_1EE6ED2B0];
        uint64_t v15 = [v14 longLongValue];
        uint64_t v16 = [v10 storeItemID];

        if (v15 != v16)
        {
          v17 = [v4 objectForKeyedSubscript:&unk_1EE6ED2C8];
          uint64_t v18 = [v17 longLongValue];
          uint64_t v19 = [v10 storeItemID];

          if (v18 != v19) {
            continue;
          }
        }
LABEL_12:
        id v20 = v10;
        goto LABEL_14;
      }
      uint64_t v7 = [(NSArray *)v5 countByEnumeratingWithState:&v22 objects:v26 count:16];
      id v20 = 0;
      if (v7) {
        continue;
      }
      break;
    }
  }
  else
  {
    id v20 = 0;
  }
LABEL_14:

  return v20;
}

- (id)parsedStoreItemsImportProperties
{
  v11.receiver = self;
  v11.super_class = (Class)MPStoreItemImportTrackData;
  v3 = [(ML3StoreItemTrackData *)&v11 parsedStoreItemsImportProperties];
  id v4 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(v3, "count"));
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __62__MPStoreItemImportTrackData_parsedStoreItemsImportProperties__block_invoke;
  v9[3] = &unk_1E57F3F68;
  v9[4] = self;
  id v5 = v4;
  id v10 = v5;
  [v3 enumerateObjectsUsingBlock:v9];
  uint64_t v6 = v10;
  id v7 = v5;

  return v7;
}

void __62__MPStoreItemImportTrackData_parsedStoreItemsImportProperties__block_invoke(uint64_t a1, void *a2)
{
  v3 = *(void **)(a1 + 32);
  id v4 = a2;
  id v10 = [v3 _associatedElementForPropertyDict:v4];
  id v5 = (void *)[v4 mutableCopy];

  uint64_t v6 = [v10 additionalTrackMetadata];

  if (v6)
  {
    id v7 = objc_opt_class();
    uint64_t v8 = [v10 additionalTrackMetadata];
    v9 = [v7 _importPropertiesDictFromImportMetadataDict:v8];

    [v5 addEntriesFromDictionary:v9];
  }
  [*(id *)(a1 + 40) addObject:v5];
}

- (MPStoreItemImportTrackData)initWithImportElements:(id)a3
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  uint64_t v6 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(v5, "count"));
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  id v7 = v5;
  uint64_t v8 = [v7 countByEnumeratingWithState:&v19 objects:v23 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v20;
    do
    {
      uint64_t v11 = 0;
      do
      {
        if (*(void *)v20 != v10) {
          objc_enumerationMutation(v7);
        }
        uint64_t v12 = [*(id *)(*((void *)&v19 + 1) + 8 * v11) storeItem];
        if (!v12)
        {
          uint64_t v13 = [MEMORY[0x1E4F28B00] currentHandler];
          [v13 handleFailureInMethod:a2 object:self file:@"MPStoreItemImportTrackData.m" lineNumber:25 description:@"we should have a complete set of metadata here."];
        }
        [v6 addObject:v12];

        ++v11;
      }
      while (v9 != v11);
      uint64_t v9 = [v7 countByEnumeratingWithState:&v19 objects:v23 count:16];
    }
    while (v9);
  }

  v18.receiver = self;
  v18.super_class = (Class)MPStoreItemImportTrackData;
  v14 = [(ML3StoreItemTrackData *)&v18 initWithLookupItems:v6];
  if (v14)
  {
    uint64_t v15 = [v7 copy];
    importElements = v14->_importElements;
    v14->_importElements = (NSArray *)v15;
  }
  return v14;
}

+ (id)_importPropertiesDictFromImportMetadataDict:(id)a3
{
  v14[2] = *MEMORY[0x1E4F143B8];
  v13[0] = @"MPStoreItemLibraryImportMetadataKeyAlbumLikedState";
  v13[1] = @"MPStoreItemLibraryImportMetadataKeyTrackLikedState";
  v14[0] = &unk_1EE6ED268;
  v14[1] = &unk_1EE6ED280;
  v3 = (void *)MEMORY[0x1E4F1C9E8];
  id v4 = a3;
  id v5 = [v3 dictionaryWithObjects:v14 forKeys:v13 count:2];
  uint64_t v6 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA60]), "initWithCapacity:", objc_msgSend(v4, "count"));
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __74__MPStoreItemImportTrackData__importPropertiesDictFromImportMetadataDict___block_invoke;
  v11[3] = &unk_1E57F7428;
  v11[4] = v5;
  id v7 = v6;
  id v12 = v7;
  [v4 enumerateKeysAndObjectsUsingBlock:v11];

  uint64_t v8 = v12;
  id v9 = v7;

  return v9;
}

void __74__MPStoreItemImportTrackData__importPropertiesDictFromImportMetadataDict___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  id v7 = [*(id *)(a1 + 32) objectForKey:v5];
  if (v7)
  {
    [*(id *)(a1 + 40) setObject:v6 forKey:v7];
  }
  else
  {
    uint64_t v8 = os_log_create("com.apple.amp.mediaplayer", "Default");
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      int v9 = 138543362;
      id v10 = v5;
      _os_log_impl(&dword_1952E8000, v8, OS_LOG_TYPE_ERROR, "[MPStoreItemImportTrackData] Unknown import property for metadata key %{public}@", (uint8_t *)&v9, 0xCu);
    }
  }
}

@end