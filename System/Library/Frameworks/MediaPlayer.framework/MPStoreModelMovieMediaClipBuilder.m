@interface MPStoreModelMovieMediaClipBuilder
+ (id)allSupportedProperties;
- (id)mediaClipWithStoreItemMetadata:(id)a3 storeItemMovieClip:(id)a4;
- (id)modelObjectWithStoreItemMetadata:(id)a3 sourceModelObject:(id)a4 userIdentity:(id)a5;
@end

@implementation MPStoreModelMovieMediaClipBuilder

+ (id)allSupportedProperties
{
  v12[2] = *MEMORY[0x1E4F143B8];
  v2 = [MPPropertySet alloc];
  v12[0] = @"MPModelPropertyMediaClipPreviewArtwork";
  v12[1] = @"MPModelPropertyMediaClipTitle";
  v3 = [MEMORY[0x1E4F1C978] arrayWithObjects:v12 count:2];
  v9[0] = @"MPModelPropertyStaticAssetDuration";
  v9[1] = @"MPModelPropertyStaticAssetFlavorType";
  v9[2] = @"MPModelPropertyStaticAssetMediaType";
  v9[3] = @"MPModelPropertyStaticAssetURL";
  v10 = @"MPModelRelationshipMediaClipStaticAssets";
  v4 = [MEMORY[0x1E4F1C978] arrayWithObjects:v9 count:4];
  v5 = +[MPPropertySet propertySetWithProperties:v4];
  v11 = v5;
  v6 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v11 forKeys:&v10 count:1];
  v7 = [(MPPropertySet *)v2 initWithProperties:v3 relationships:v6];

  return v7;
}

- (id)mediaClipWithStoreItemMetadata:(id)a3 storeItemMovieClip:(id)a4
{
  uint64_t v48 = *MEMORY[0x1E4F143B8];
  id v37 = a3;
  id v6 = a4;
  p_requestedClipProperties = &self->_requestedClipProperties;
  if ((*(unsigned char *)&self->_requestedClipProperties & 1) == 0)
  {
    v8 = [(MPStoreModelObjectBuilder *)self requestedPropertySet];
    v9 = [v8 properties];
    if ([v9 containsObject:@"MPModelPropertyMediaClipTitle"]) {
      char v10 = 2;
    }
    else {
      char v10 = 0;
    }
    *(unsigned char *)p_requestedClipProperties = *(unsigned char *)p_requestedClipProperties & 0xFD | v10;
    if ([v9 containsObject:@"MPModelPropertyMediaClipPreviewArtwork"]) {
      char v11 = 4;
    }
    else {
      char v11 = 0;
    }
    *(unsigned char *)p_requestedClipProperties = *(unsigned char *)p_requestedClipProperties & 0xFB | v11;
    v12 = [v8 relationships];
    v13 = [v12 objectForKey:@"MPModelRelationshipMediaClipStaticAssets"];

    if (v13)
    {
      *(unsigned char *)&self->_requestedClipProperties.staticAssets |= 1u;
      v14 = [v13 properties];
      if ([v14 containsObject:@"MPModelPropertyStaticAssetDuration"]) {
        char v15 = 2;
      }
      else {
        char v15 = 0;
      }
      *(unsigned char *)&self->_requestedClipProperties.staticAssets = *(unsigned char *)&self->_requestedClipProperties.staticAssets & 0xFD | v15;
      if ([v14 containsObject:@"MPModelPropertyStaticAssetURL"]) {
        char v16 = 16;
      }
      else {
        char v16 = 0;
      }
      *(unsigned char *)&self->_requestedClipProperties.staticAssets = *(unsigned char *)&self->_requestedClipProperties.staticAssets & 0xEF | v16;
      if ([v14 containsObject:@"MPModelPropertyStaticAssetMediaType"]) {
        char v17 = 8;
      }
      else {
        char v17 = 0;
      }
      *(unsigned char *)&self->_requestedClipProperties.staticAssets = *(unsigned char *)&self->_requestedClipProperties.staticAssets & 0xF7 | v17;
      if ([v14 containsObject:@"MPModelPropertyStaticAssetFlavorType"]) {
        char v18 = 4;
      }
      else {
        char v18 = 0;
      }
      *(unsigned char *)&self->_requestedClipProperties.staticAssets = *(unsigned char *)&self->_requestedClipProperties.staticAssets & 0xFB | v18;
    }
    *(unsigned char *)p_requestedClipProperties |= 1u;
  }
  v19 = [v6 assets];
  long long v43 = 0u;
  long long v44 = 0u;
  long long v45 = 0u;
  long long v46 = 0u;
  uint64_t v20 = [v19 countByEnumeratingWithState:&v43 objects:v47 count:16];
  if (v20)
  {
    uint64_t v21 = v20;
    v22 = 0;
    uint64_t v23 = *(void *)v44;
    do
    {
      for (uint64_t i = 0; i != v21; ++i)
      {
        if (*(void *)v44 != v23) {
          objc_enumerationMutation(v19);
        }
        v25 = *(void **)(*((void *)&v43 + 1) + 8 * i);
        v26 = [v25 url];

        if (v26)
        {
          if (!v22) {
            v22 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(v19, "count"));
          }
          [v22 addObject:v25];
        }
      }
      uint64_t v21 = [v19 countByEnumeratingWithState:&v43 objects:v47 count:16];
    }
    while (v21);
  }
  else
  {
    v22 = 0;
  }
  v27 = [v22 sortedArrayUsingComparator:&__block_literal_global_16478];
  v28 = [v27 firstObject];
  v29 = [v28 url];
  v30 = [v29 absoluteString];

  if (v30)
  {
    v31 = [MPModelMediaClip alloc];
    v32 = [MPIdentifierSet alloc];
    v33 = +[MPModelMediaClipKind identityKind];
    v41[0] = MEMORY[0x1E4F143A8];
    v41[1] = 3221225472;
    v41[2] = __87__MPStoreModelMovieMediaClipBuilder_mediaClipWithStoreItemMetadata_storeItemMovieClip___block_invoke_2;
    v41[3] = &unk_1E57FA3B8;
    id v42 = v30;
    v34 = [(MPIdentifierSet *)v32 initWithSource:@"StorePlatform" modelKind:v33 block:v41];
    v38[0] = MEMORY[0x1E4F143A8];
    v38[1] = 3221225472;
    v38[2] = __87__MPStoreModelMovieMediaClipBuilder_mediaClipWithStoreItemMetadata_storeItemMovieClip___block_invoke_4;
    v38[3] = &unk_1E57F0998;
    v38[4] = self;
    id v39 = v6;
    id v40 = v27;
    v35 = [(MPModelObject *)v31 initWithIdentifiers:v34 block:v38];
  }
  else
  {
    v35 = 0;
  }

  return v35;
}

void __87__MPStoreModelMovieMediaClipBuilder_mediaClipWithStoreItemMetadata_storeItemMovieClip___block_invoke_2(uint64_t a1, void *a2)
{
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __87__MPStoreModelMovieMediaClipBuilder_mediaClipWithStoreItemMetadata_storeItemMovieClip___block_invoke_3;
  v3[3] = &unk_1E57FA390;
  id v4 = *(id *)(a1 + 32);
  [a2 setUniversalStoreIdentifiersWithBlock:v3];
}

void __87__MPStoreModelMovieMediaClipBuilder_mediaClipWithStoreItemMetadata_storeItemMovieClip___block_invoke_4(uint64_t a1, void *a2)
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  uint64_t v4 = *(void *)(a1 + 32);
  char v5 = *(unsigned char *)(v4 + 24);
  if ((v5 & 2) != 0)
  {
    id v6 = [*(id *)(a1 + 40) title];
    [v3 setTitle:v6];

    uint64_t v4 = *(void *)(a1 + 32);
    char v5 = *(unsigned char *)(v4 + 24);
  }
  if ((v5 & 4) != 0)
  {
    v7 = [*(id *)(a1 + 40) previewArtworkRequestToken];
    v32[0] = MEMORY[0x1E4F143A8];
    v32[1] = 3221225472;
    v32[2] = __87__MPStoreModelMovieMediaClipBuilder_mediaClipWithStoreItemMetadata_storeItemMovieClip___block_invoke_5;
    v32[3] = &unk_1E57F0948;
    id v33 = v7;
    id v8 = v7;
    [v3 setPreviewArtworkCatalogBlock:v32];

    uint64_t v4 = *(void *)(a1 + 32);
  }
  if (*(unsigned char *)(v4 + 28))
  {
    uint64_t v23 = v3;
    long long v30 = 0u;
    long long v31 = 0u;
    long long v28 = 0u;
    long long v29 = 0u;
    id obj = *(id *)(a1 + 48);
    uint64_t v9 = [obj countByEnumeratingWithState:&v28 objects:v34 count:16];
    if (v9)
    {
      uint64_t v10 = v9;
      uint64_t v11 = a1;
      v12 = 0;
      uint64_t v13 = *(void *)v29;
      do
      {
        for (uint64_t i = 0; i != v10; ++i)
        {
          if (*(void *)v29 != v13) {
            objc_enumerationMutation(obj);
          }
          char v15 = *(void **)(*((void *)&v28 + 1) + 8 * i);
          char v16 = [v15 url];
          char v17 = [v16 absoluteString];

          if (v17)
          {
            char v18 = [MPModelStaticAsset alloc];
            v19 = [MPIdentifierSet alloc];
            uint64_t v20 = +[MPModelStaticAssetKind identityKind];
            v26[0] = MEMORY[0x1E4F143A8];
            v26[1] = 3221225472;
            v26[2] = __87__MPStoreModelMovieMediaClipBuilder_mediaClipWithStoreItemMetadata_storeItemMovieClip___block_invoke_6;
            v26[3] = &unk_1E57FA3B8;
            id v27 = v17;
            uint64_t v21 = [(MPIdentifierSet *)v19 initWithSource:@"StorePlatform" modelKind:v20 block:v26];
            v25[0] = MEMORY[0x1E4F143A8];
            v25[1] = 3221225472;
            v25[2] = __87__MPStoreModelMovieMediaClipBuilder_mediaClipWithStoreItemMetadata_storeItemMovieClip___block_invoke_8;
            v25[3] = &unk_1E57F0970;
            v25[4] = *(void *)(v11 + 32);
            v25[5] = v15;
            v22 = [(MPModelObject *)v18 initWithIdentifiers:v21 block:v25];

            if (!v12) {
              v12 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(*(id *)(v11 + 48), "count"));
            }
            [v12 addObject:v22];
          }
        }
        uint64_t v10 = [obj countByEnumeratingWithState:&v28 objects:v34 count:16];
      }
      while (v10);
    }
    else
    {
      v12 = 0;
    }

    id v3 = v23;
    [v23 setStaticAssets:v12];
  }
}

MPArtworkCatalog *__87__MPStoreModelMovieMediaClipBuilder_mediaClipWithStoreItemMetadata_storeItemMovieClip___block_invoke_5(uint64_t a1)
{
  if (*(void *)(a1 + 32))
  {
    v2 = [MPArtworkCatalog alloc];
    id v3 = (void *)[*(id *)(a1 + 32) copy];
    uint64_t v4 = +[MPStoreArtworkDataSource sharedStoreArtworkDataSource];
    char v5 = [(MPArtworkCatalog *)v2 initWithToken:v3 dataSource:v4];
  }
  else
  {
    char v5 = 0;
  }

  return v5;
}

void __87__MPStoreModelMovieMediaClipBuilder_mediaClipWithStoreItemMetadata_storeItemMovieClip___block_invoke_6(uint64_t a1, void *a2)
{
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __87__MPStoreModelMovieMediaClipBuilder_mediaClipWithStoreItemMetadata_storeItemMovieClip___block_invoke_7;
  v3[3] = &unk_1E57FA390;
  id v4 = *(id *)(a1 + 32);
  [a2 setUniversalStoreIdentifiersWithBlock:v3];
}

void __87__MPStoreModelMovieMediaClipBuilder_mediaClipWithStoreItemMetadata_storeItemMovieClip___block_invoke_8(uint64_t a1, void *a2)
{
  id v7 = a2;
  char v3 = *(unsigned char *)(*(void *)(a1 + 32) + 28);
  if ((v3 & 2) != 0)
  {
    [*(id *)(a1 + 40) duration];
    objc_msgSend(v7, "setDuration:");
    char v3 = *(unsigned char *)(*(void *)(a1 + 32) + 28);
    if ((v3 & 8) == 0)
    {
LABEL_3:
      if ((v3 & 0x10) == 0) {
        goto LABEL_4;
      }
      goto LABEL_8;
    }
  }
  else if ((*(unsigned char *)(*(void *)(a1 + 32) + 28) & 8) == 0)
  {
    goto LABEL_3;
  }
  [v7 setMediaType:2];
  char v3 = *(unsigned char *)(*(void *)(a1 + 32) + 28);
  if ((v3 & 0x10) == 0)
  {
LABEL_4:
    if ((v3 & 4) == 0) {
      goto LABEL_13;
    }
    goto LABEL_9;
  }
LABEL_8:
  id v4 = [*(id *)(a1 + 40) url];
  [v7 setUrl:v4];

  if ((*(unsigned char *)(*(void *)(a1 + 32) + 28) & 4) == 0) {
    goto LABEL_13;
  }
LABEL_9:
  char v5 = [*(id *)(a1 + 40) flavor];
  if (([v5 isEqualToString:MPStoreItemMovieClipAssetFlavorSD480PVideo] & 1) != 0
    || ([v5 isEqualToString:MPStoreItemMovieClipAssetFlavorSDVideo] & 1) != 0)
  {
    uint64_t v6 = 1;
  }
  else if ([v5 isEqualToString:MPStoreItemMovieClipAssetFlavorHD720PVideo])
  {
    uint64_t v6 = 2;
  }
  else if ([v5 isEqualToString:MPStoreItemMovieClipAssetFlavorHD1080PVideo])
  {
    uint64_t v6 = 3;
  }
  else
  {
    uint64_t v6 = 0;
  }
  [v7 setFlavorType:v6];

LABEL_13:
}

uint64_t __87__MPStoreModelMovieMediaClipBuilder_mediaClipWithStoreItemMetadata_storeItemMovieClip___block_invoke_7(uint64_t a1, void *a2)
{
  return [a2 setInformalStaticAssetID:*(void *)(a1 + 32)];
}

uint64_t __87__MPStoreModelMovieMediaClipBuilder_mediaClipWithStoreItemMetadata_storeItemMovieClip___block_invoke_3(uint64_t a1, void *a2)
{
  return [a2 setInformalMediaClipID:*(void *)(a1 + 32)];
}

uint64_t __87__MPStoreModelMovieMediaClipBuilder_mediaClipWithStoreItemMetadata_storeItemMovieClip___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4 = a3;
  char v5 = [a2 url];
  uint64_t v6 = [v4 url];

  id v7 = [v5 absoluteString];
  id v8 = [v6 absoluteString];
  uint64_t v9 = [v7 compare:v8];

  return v9;
}

- (id)modelObjectWithStoreItemMetadata:(id)a3 sourceModelObject:(id)a4 userIdentity:(id)a5
{
  return 0;
}

@end