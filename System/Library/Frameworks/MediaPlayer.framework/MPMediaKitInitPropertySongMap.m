@interface MPMediaKitInitPropertySongMap
@end

@implementation MPMediaKitInitPropertySongMap

void ___MPMediaKitInitPropertySongMap_block_invoke_8_201(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  id v5 = a4;
  id v6 = [a2 objectForKeyedSubscript:@"previews"];
  [v5 setObject:v6 forKeyedSubscript:@"previews"];
}

void ___MPMediaKitInitPropertySongMap_block_invoke_7_191(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  id v5 = a4;
  id v6 = a2;
  v7 = [v6 objectForKeyedSubscript:@"playParams"];
  [v5 setObject:v7 forKeyedSubscript:@"playParams"];

  id v8 = [v6 objectForKeyedSubscript:@"videoKind"];

  [v5 setObject:v8 forKeyedSubscript:@"videoKind"];
}

void ___MPMediaKitInitPropertySongMap_block_invoke_6_181(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  id v5 = a4;
  id v6 = a2;
  v7 = [v6 objectForKeyedSubscript:@"hasLyrics"];
  [v5 setObject:v7 forKeyedSubscript:@"hasLyrics"];

  id v8 = [v6 objectForKeyedSubscript:@"hasTimeSyncedLyrics"];

  [v5 setObject:v8 forKeyedSubscript:@"hasTimeSyncedLyrics"];
}

void ___MPMediaKitInitPropertySongMap_block_invoke_5_174(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  id v5 = a4;
  id v7 = [a2 objectForKeyedSubscript:@"genreNames"];
  id v6 = [v7 firstObject];
  [v5 setObject:v6 forKeyedSubscript:@"name"];
}

void ___MPMediaKitInitPropertySongMap_block_invoke_4_170(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  id v5 = a4;
  id v6 = [a2 objectForKeyedSubscript:@"attribution"];
  [v5 setObject:v6 forKeyedSubscript:@"name"];
}

void ___MPMediaKitInitPropertySongMap_block_invoke_3_160(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  id v5 = a4;
  id v6 = a2;
  id v7 = [v6 valueForKeyPath:@"relationships.artists.data.id.@firstObject"];
  [v5 setIdentifier:v7];

  id v9 = [v6 valueForKeyPath:@"attributes.artistName"];

  id v8 = [v5 attributes];

  [v8 setObject:v9 forKeyedSubscript:@"name"];
}

void ___MPMediaKitInitPropertySongMap_block_invoke_2_147(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  id v5 = a4;
  id v6 = a2;
  id v7 = [v6 valueForKeyPath:@"relationships.albums.data.id.@firstObject"];
  [v5 setIdentifier:v7];

  id v9 = [v6 valueForKeyPath:@"attributes.albumName"];

  id v8 = [v5 attributes];

  [v8 setObject:v9 forKeyedSubscript:@"name"];
}

id ___MPMediaKitInitPropertySongMap_block_invoke_125(uint64_t a1, void *a2)
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
  id v8 = [NSNumber numberWithUnsignedInteger:v4];

  return v8;
}

void *___MPMediaKitInitPropertySongMap_block_invoke_9()
{
  return &unk_1EE6EE3E0;
}

id ___MPMediaKitInitPropertySongMap_block_invoke_8(uint64_t a1, void *a2)
{
  id v2 = [a2 valueForKeyPath:@"attributes.releaseDate"];
  v3 = _MPMediaKitDateFromString(v2);

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

id ___MPMediaKitInitPropertySongMap_block_invoke_7(uint64_t a1, void *a2)
{
  id v2 = [a2 valueForKeyPath:@"attributes.attribution"];
  v3 = objc_msgSend(NSNumber, "numberWithInt:", objc_msgSend(v2, "length") != 0);

  return v3;
}

id ___MPMediaKitInitPropertySongMap_block_invoke_6(uint64_t a1, void *a2, void *a3)
{
  v13[2] = *MEMORY[0x1E4F143B8];
  v13[0] = @"_MPMKT_transformedType";
  v13[1] = @"type";
  uint64_t v4 = (void *)MEMORY[0x1E4F1C978];
  id v5 = a3;
  id v6 = a2;
  id v7 = [v4 arrayWithObjects:v13 count:2];
  id v8 = _MPKeyPathValueTransformFirstNonnullKeyPath(v7, v6);

  id v9 = NSNumber;
  if ([v8 isEqual:@"music-videos"]) {
    uint64_t v10 = 1;
  }
  else {
    uint64_t v10 = [v8 isEqual:@"uploaded-videos"];
  }
  v11 = [v9 numberWithInt:v10];

  return v11;
}

id ___MPMediaKitInitPropertySongMap_block_invoke_5(uint64_t a1, void *a2, void *a3)
{
  v13[2] = *MEMORY[0x1E4F143B8];
  v13[0] = @"_MPMKT_transformedType";
  v13[1] = @"type";
  uint64_t v4 = (void *)MEMORY[0x1E4F1C978];
  id v5 = a3;
  id v6 = a2;
  id v7 = [v4 arrayWithObjects:v13 count:2];
  id v8 = _MPKeyPathValueTransformFirstNonnullKeyPath(v7, v6);

  id v9 = NSNumber;
  if ([v8 isEqual:@"uploaded-audios"]) {
    uint64_t v10 = 1;
  }
  else {
    uint64_t v10 = [v8 isEqual:@"uploaded-videos"];
  }
  v11 = [v9 numberWithInt:v10];

  return v11;
}

id ___MPMediaKitInitPropertySongMap_block_invoke_4(uint64_t a1, void *a2)
{
  id v2 = [a2 valueForKeyPath:@"attributes.contentRating"];
  v3 = objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(v2, "isEqualToString:", @"explicit"));

  return v3;
}

void ___MPMediaKitInitPropertySongMap_block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v6 = a2;
  id v7 = a3;
  uint64_t v12 = MEMORY[0x1E4F143A8];
  uint64_t v13 = 3221225472;
  v14 = ___MPMediaKitInitPropertySongMap_block_invoke_2;
  v15 = &unk_1E57F9580;
  id v16 = v6;
  id v17 = v7;
  id v8 = v7;
  id v9 = v6;
  id v10 = a4;
  [v10 setUniversalStoreIdentifiersWithBlock:&v12];
  v11 = objc_msgSend(v8, "personID", v12, v13, v14, v15);
  [v10 setPersonalStoreIdentifiersWithPersonID:v11 block:&__block_literal_global_35];
}

void ___MPMediaKitInitPropertySongMap_block_invoke_2(uint64_t a1, void *a2)
{
  v42[16] = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = [*(id *)(a1 + 32) objectForKeyedSubscript:@"id"];
  if (_NSIsNSNumber() & 1) != 0 || (_NSIsNSString() & 1) != 0 || (objc_opt_respondsToSelector()) {
    uint64_t v5 = [v4 longLongValue];
  }
  else {
    uint64_t v5 = 0;
  }

  [v3 setAdamID:v5];
  id v6 = [*(id *)(a1 + 32) valueForKeyPath:@"meta.formerIds"];
  if (_NSIsNSArray())
  {
    long long v36 = 0u;
    long long v37 = 0u;
    long long v38 = 0u;
    long long v39 = 0u;
    id v7 = v6;
    uint64_t v8 = [v7 countByEnumeratingWithState:&v36 objects:v42 count:16];
    if (!v8)
    {
LABEL_14:

      id v12 = v7;
      goto LABEL_31;
    }
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v37;
LABEL_8:
    uint64_t v11 = 0;
    while (1)
    {
      if (*(void *)v37 != v10) {
        objc_enumerationMutation(v7);
      }
      if (!_NSIsNSNumber()) {
        break;
      }
      if (v9 == ++v11)
      {
        uint64_t v9 = [v7 countByEnumeratingWithState:&v36 objects:v42 count:16];
        if (!v9) {
          goto LABEL_14;
        }
        goto LABEL_8;
      }
    }
    id v28 = v6;
    uint64_t v29 = v5;
    uint64_t v30 = a1;
    id v31 = v3;

    objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(v7, "count"));
    id v12 = (id)objc_claimAutoreleasedReturnValue();
    long long v32 = 0u;
    long long v33 = 0u;
    long long v34 = 0u;
    long long v35 = 0u;
    id v13 = v7;
    uint64_t v14 = [v13 countByEnumeratingWithState:&v32 objects:v41 count:16];
    if (!v14) {
      goto LABEL_30;
    }
    uint64_t v15 = v14;
    uint64_t v16 = *(void *)v33;
LABEL_19:
    uint64_t v17 = 0;
    while (1)
    {
      if (*(void *)v33 != v16) {
        objc_enumerationMutation(v13);
      }
      id v18 = *(id *)(*((void *)&v32 + 1) + 8 * v17);
      if ((_NSIsNSNumber() & 1) == 0 && (_NSIsNSString() & 1) == 0 && (objc_opt_respondsToSelector() & 1) == 0) {
        goto LABEL_27;
      }
      uint64_t v19 = objc_msgSend(v18, "longLongValue", v28, v29, v30, v31, (void)v32);

      if (v19) {
        break;
      }
LABEL_28:
      if (v15 == ++v17)
      {
        uint64_t v15 = [v13 countByEnumeratingWithState:&v32 objects:v41 count:16];
        if (!v15)
        {
LABEL_30:

          a1 = v30;
          id v3 = v31;
          id v6 = v28;
          uint64_t v5 = v29;
LABEL_31:

          goto LABEL_40;
        }
        goto LABEL_19;
      }
    }
    id v18 = [NSNumber numberWithLongLong:v19];
    [v12 addObject:v18];
LABEL_27:

    goto LABEL_28;
  }
  if (_NSIsNSNumber())
  {
    v42[0] = v6;
    id v12 = [MEMORY[0x1E4F1C978] arrayWithObjects:v42 count:1];
    goto LABEL_40;
  }
  id v20 = v6;
  if (_NSIsNSNumber() & 1) != 0 || (_NSIsNSString() & 1) != 0 || (objc_opt_respondsToSelector())
  {
    uint64_t v21 = [v20 longLongValue];

    if (v21)
    {
      v22 = [NSNumber numberWithLongLong:v21];
      v42[0] = v22;
      id v12 = [MEMORY[0x1E4F1C978] arrayWithObjects:v42 count:1];

      goto LABEL_40;
    }
  }
  else
  {
  }
  id v12 = (id)MEMORY[0x1E4F1CBF0];
LABEL_40:

  [v3 setFormerAdamIDs:v12];
  v23 = [*(id *)(a1 + 32) valueForKeyPath:@"attributes.playParams"];

  if (!v23)
  {
    v40[0] = @"_MPMKT_transformedType";
    v40[1] = @"type";
    v24 = [MEMORY[0x1E4F1C978] arrayWithObjects:v40 count:2];
    v25 = _MPKeyPathValueTransformFirstNonnullKeyPath(v24, *(void **)(a1 + 32));

    if (([v25 isEqual:@"uploaded-audios"] & 1) != 0
      || ([v25 isEqual:@"uploaded-videos"] & 1) != 0)
    {
    }
    else
    {
      v26 = [*(id *)(a1 + 32) valueForKeyPath:@"attributes.offers.kind"];
      char v27 = [v26 containsObject:@"subscription"];

      if ((v27 & 1) == 0) {
        goto LABEL_45;
      }
    }
  }
  objc_msgSend(v3, "setSubscriptionAdamID:", v5, v28, v29, v30, v31);
LABEL_45:
}

@end