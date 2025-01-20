@interface MPMediaKitInitPropertyAlbumMap
@end

@implementation MPMediaKitInitPropertyAlbumMap

void ___MPMediaKitInitPropertyAlbumMap_block_invoke_20(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  id v5 = a4;
  id v7 = [a2 objectForKeyedSubscript:@"genreNames"];
  v6 = [v7 firstObject];
  [v5 setObject:v6 forKeyedSubscript:@"name"];
}

void ___MPMediaKitInitPropertyAlbumMap_block_invoke_19(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  id v5 = a4;
  id v6 = a2;
  id v7 = [v6 valueForKeyPath:@"relationships.artists.data.id.@firstObject"];
  [v5 setIdentifier:v7];

  id v9 = [v6 valueForKeyPath:@"attributes.artistName"];

  v8 = [v5 attributes];

  [v8 setObject:v9 forKeyedSubscript:@"name"];
}

id ___MPMediaKitInitPropertyAlbumMap_block_invoke_18(uint64_t a1, void *a2)
{
  v2 = [a2 valueForKeyPath:@"attributes.classicalUrl"];
  if (v2) {
    v3 = (void *)MEMORY[0x1E4F1CC38];
  }
  else {
    v3 = (void *)MEMORY[0x1E4F1CC28];
  }
  id v4 = v3;

  return v4;
}

id ___MPMediaKitInitPropertyAlbumMap_block_invoke_17(uint64_t a1, void *a2)
{
  id v2 = a2;
  v3 = [v2 valueForKeyPath:@"attributes.isMasteredForItunes"];
  LODWORD(v4) = [v3 BOOLValue];

  uint64_t v4 = v4;
  id v5 = +[MPCloudController sharedCloudController];
  int v6 = [v5 isEnhancedAudioAvailable];

  if (v6)
  {
    id v7 = [v2 valueForKeyPath:@"attributes.audioTraits"];
    if ([v7 containsObject:@"spatial"]) {
      uint64_t v4 = v4 | 8;
    }
    if ([v7 containsObject:@"atmos"]) {
      v4 |= 0x10uLL;
    }
    if ([v7 containsObject:@"surround"]) {
      v4 |= 0x20uLL;
    }
    if ([v7 containsObject:@"lossless"]) {
      v4 |= 2uLL;
    }
    if ([v7 containsObject:@"hi-res-lossless"]) {
      v4 |= 4uLL;
    }
  }
  v8 = [NSNumber numberWithUnsignedInteger:v4];

  return v8;
}

id ___MPMediaKitInitPropertyAlbumMap_block_invoke_9(uint64_t a1, void *a2, void *a3)
{
  uint64_t v72 = *MEMORY[0x1E4F143B8];
  id v4 = a2;
  id v5 = a3;
  int v6 = [v4 valueForKeyPath:@"relationships.tracks.data"];
  id v52 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  v54 = v5;
  if (v6)
  {
    id v7 = objc_msgSend(v6, "firstObject", v4);
    if (_NSIsNSDictionary())
    {
      v8 = [v6 firstObject];
      id v9 = [v8 valueForKeyPath:@"meta.popularity"];

      if (v9) {
        goto LABEL_17;
      }
    }
    else
    {
    }
  }
  else
  {
    v10 = [MPIdentifierSet alloc];
    v11 = +[MPModelAlbumKind identityKind];
    v67[0] = MEMORY[0x1E4F143A8];
    v67[1] = 3221225472;
    v67[2] = ___MPMediaKitInitPropertyAlbumMap_block_invoke_10;
    v67[3] = &unk_1E57F95D0;
    id v68 = v4;
    id v12 = v5;
    id v69 = v12;
    v13 = [(MPIdentifierSet *)v10 initWithSource:@"MediaAPI" modelKind:v11 block:v67];

    v14 = [v12 relationshipPayloadProvider];
    v15 = [v14 payloadForRelatedEntityWithIdentifierSet:v13];

    int v6 = [v15 valueForKeyPath:@"relationships.tracks.data"];
  }
  v53 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(v6, "count"));
  long long v63 = 0u;
  long long v64 = 0u;
  long long v65 = 0u;
  long long v66 = 0u;
  id obj = v6;
  uint64_t v16 = [obj countByEnumeratingWithState:&v63 objects:v71 count:16];
  if (v16)
  {
    uint64_t v17 = v16;
    uint64_t v18 = *(void *)v64;
    do
    {
      for (uint64_t i = 0; i != v17; ++i)
      {
        if (*(void *)v64 != v18) {
          objc_enumerationMutation(obj);
        }
        uint64_t v20 = *(void *)(*((void *)&v63 + 1) + 8 * i);
        v21 = [MPIdentifierSet alloc];
        v22 = +[MPModelSongKind identityKind];
        v61[0] = MEMORY[0x1E4F143A8];
        v61[1] = 3221225472;
        v61[2] = ___MPMediaKitInitPropertyAlbumMap_block_invoke_13;
        v61[3] = &unk_1E57F95D0;
        v61[4] = v20;
        id v23 = v5;
        id v62 = v23;
        v24 = [(MPIdentifierSet *)v21 initWithSource:@"MediaAPI" modelKind:v22 block:v61];

        v25 = [v23 relationshipPayloadProvider];
        v26 = [v25 payloadForRelatedEntityWithIdentifierSet:v24];

        if (v26) {
          [v53 addObject:v26];
        }
      }
      uint64_t v17 = [obj countByEnumeratingWithState:&v63 objects:v71 count:16];
    }
    while (v17);
  }

  int v6 = (void *)[v53 copy];
LABEL_17:
  long long v59 = 0u;
  long long v60 = 0u;
  long long v57 = 0u;
  long long v58 = 0u;
  id v27 = v6;
  uint64_t v28 = [v27 countByEnumeratingWithState:&v57 objects:v70 count:16];
  if (v28)
  {
    uint64_t v29 = v28;
    uint64_t v30 = *(void *)v58;
    do
    {
      uint64_t v31 = 0;
      do
      {
        if (*(void *)v58 != v30) {
          objc_enumerationMutation(v27);
        }
        v32 = *(void **)(*((void *)&v57 + 1) + 8 * v31);
        v33 = [v32 valueForKeyPath:@"id"];
        v34 = NSNumber;
        id v35 = v33;
        if (_NSIsNSNumber() & 1) != 0 || (_NSIsNSString() & 1) != 0 || (objc_opt_respondsToSelector()) {
          uint64_t v36 = [v35 longLongValue];
        }
        else {
          uint64_t v36 = 0;
        }

        v37 = [v34 numberWithLongLong:v36];
        v38 = [v32 valueForKeyPath:@"meta.popularity"];
        v39 = NSNumber;
        id v40 = v38;
        if ((_NSIsNSNumber() & 1) != 0
          || (_NSIsNSString() & 1) != 0
          || (double v41 = 0.0, (objc_opt_respondsToSelector() & 1) != 0))
        {
          [v40 doubleValue];
          double v41 = v42;
        }

        v43 = [v39 numberWithDouble:v41];
        if (v43) {
          BOOL v44 = v37 == 0;
        }
        else {
          BOOL v44 = 1;
        }
        if (!v44) {
          [v52 setObject:v43 forKeyedSubscript:v37];
        }

        ++v31;
      }
      while (v29 != v31);
      uint64_t v45 = [v27 countByEnumeratingWithState:&v57 objects:v70 count:16];
      uint64_t v29 = v45;
    }
    while (v45);
  }

  v55[0] = MEMORY[0x1E4F143A8];
  v55[1] = 3221225472;
  v55[2] = ___MPMediaKitInitPropertyAlbumMap_block_invoke_16;
  v55[3] = &unk_1E57F7C68;
  id v56 = v52;
  id v46 = v52;
  v47 = (void *)MEMORY[0x19971E0F0](v55);
  v48 = (void *)MEMORY[0x19971E0F0]();

  return v48;
}

void ___MPMediaKitInitPropertyAlbumMap_block_invoke_10(uint64_t a1, void *a2)
{
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = ___MPMediaKitInitPropertyAlbumMap_block_invoke_11;
  v6[3] = &unk_1E57FA390;
  id v7 = *(id *)(a1 + 32);
  id v4 = a2;
  [v4 setUniversalStoreIdentifiersWithBlock:v6];
  id v5 = [*(id *)(a1 + 40) personID];
  [v4 setPersonalStoreIdentifiersWithPersonID:v5 block:&__block_literal_global_320];
}

void ___MPMediaKitInitPropertyAlbumMap_block_invoke_13(uint64_t a1, void *a2)
{
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = ___MPMediaKitInitPropertyAlbumMap_block_invoke_14;
  v5[3] = &unk_1E57FA390;
  v5[4] = *(void *)(a1 + 32);
  id v3 = a2;
  [v3 setUniversalStoreIdentifiersWithBlock:v5];
  id v4 = [*(id *)(a1 + 40) personID];
  [v3 setPersonalStoreIdentifiersWithPersonID:v4 block:&__block_literal_global_324];
}

id ___MPMediaKitInitPropertyAlbumMap_block_invoke_16(uint64_t a1, uint64_t a2, void *a3)
{
  id v4 = [a3 universalStore];
  uint64_t v5 = [v4 adamID];

  int v6 = *(void **)(a1 + 32);
  id v7 = [NSNumber numberWithLongLong:v5];
  v8 = [v6 objectForKey:v7];

  return v8;
}

void ___MPMediaKitInitPropertyAlbumMap_block_invoke_14(uint64_t a1, void *a2)
{
  id v2 = *(void **)(a1 + 32);
  id v3 = a2;
  id v5 = [v2 objectForKeyedSubscript:@"id"];
  if (_NSIsNSNumber() & 1) != 0 || (_NSIsNSString() & 1) != 0 || (objc_opt_respondsToSelector()) {
    uint64_t v4 = [v5 longLongValue];
  }
  else {
    uint64_t v4 = 0;
  }

  [v3 setAdamID:v4];
}

void ___MPMediaKitInitPropertyAlbumMap_block_invoke_11(uint64_t a1, void *a2)
{
  id v2 = *(void **)(a1 + 32);
  id v3 = a2;
  id v5 = [v2 objectForKeyedSubscript:@"id"];
  if (_NSIsNSNumber() & 1) != 0 || (_NSIsNSString() & 1) != 0 || (objc_opt_respondsToSelector()) {
    uint64_t v4 = [v5 longLongValue];
  }
  else {
    uint64_t v4 = 0;
  }

  [v3 setAdamID:v4];
}

void *___MPMediaKitInitPropertyAlbumMap_block_invoke_8()
{
  return &unk_1EE6EE3E0;
}

id ___MPMediaKitInitPropertyAlbumMap_block_invoke_7(uint64_t a1, void *a2)
{
  id v2 = [a2 valueForKeyPath:@"attributes.releaseDate"];
  id v3 = _MPMediaKitDateFromString(v2);

  if (v3)
  {
    uint64_t v4 = _MPMediaKitCalendar();
    uint64_t v5 = [v4 component:4 fromDate:v3];
  }
  else
  {
    uint64_t v5 = 0;
  }
  int v6 = [NSNumber numberWithInteger:v5];

  return v6;
}

id ___MPMediaKitInitPropertyAlbumMap_block_invoke_6(uint64_t a1, void *a2)
{
  id v2 = [a2 valueForKeyPath:@"attributes.releaseDate"];
  id v3 = _MPMediaKitDateFromString(v2);

  if (v3)
  {
    uint64_t v4 = _MPMediaKitCalendar();
    uint64_t v5 = [v4 components:1048606 fromDate:v3];
  }
  else
  {
    uint64_t v5 = 0;
  }

  return v5;
}

id ___MPMediaKitInitPropertyAlbumMap_block_invoke_5(uint64_t a1, void *a2)
{
  id v2 = [a2 valueForKeyPath:@"attributes.contentRating"];
  id v3 = objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(v2, "isEqualToString:", @"explicit"));

  return v3;
}

id ___MPMediaKitInitPropertyAlbumMap_block_invoke_4(uint64_t a1, void *a2)
{
  id v2 = [a2 valueForKeyPath:@"attributes.contentRating"];
  id v3 = objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(v2, "isEqualToString:", @"clean"));

  return v3;
}

void ___MPMediaKitInitPropertyAlbumMap_block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v6 = a2;
  id v7 = a3;
  uint64_t v13 = MEMORY[0x1E4F143A8];
  uint64_t v14 = 3221225472;
  v15 = ___MPMediaKitInitPropertyAlbumMap_block_invoke_2;
  uint64_t v16 = &unk_1E57F9580;
  id v17 = v6;
  id v18 = v7;
  id v8 = v7;
  id v9 = v6;
  id v10 = a4;
  [v10 setUniversalStoreIdentifiersWithBlock:&v13];
  v11 = objc_msgSend(v8, "personID", v13, v14, v15, v16);
  [v10 setPersonalStoreIdentifiersWithPersonID:v11 block:&__block_literal_global_243];

  id v12 = [v9 valueForKeyPath:@"attributes.versionHash"];
  [v10 setVersionHash:v12];
}

void ___MPMediaKitInitPropertyAlbumMap_block_invoke_2(uint64_t a1, void *a2)
{
  v11[2] = *MEMORY[0x1E4F143B8];
  v11[0] = @"_MPMKT_transformedType";
  v11[1] = @"type";
  id v3 = (void *)MEMORY[0x1E4F1C978];
  id v4 = a2;
  uint64_t v5 = [v3 arrayWithObjects:v11 count:2];
  id v6 = _MPKeyPathValueTransformFirstNonnullKeyPath(v5, *(void **)(a1 + 32));

  LODWORD(v5) = [v6 isEqual:@"library-albums"];
  id v7 = [*(id *)(a1 + 32) objectForKeyedSubscript:@"id"];
  id v8 = v7;
  if (v5)
  {
    [v4 setUniversalCloudLibraryID:v7];
  }
  else
  {
    id v9 = v7;
    if (_NSIsNSNumber() & 1) != 0 || (_NSIsNSString() & 1) != 0 || (objc_opt_respondsToSelector()) {
      uint64_t v10 = [v9 longLongValue];
    }
    else {
      uint64_t v10 = 0;
    }

    [v4 setAdamID:v10];
  }
}

@end