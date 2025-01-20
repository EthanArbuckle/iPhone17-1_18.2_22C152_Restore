@interface MPMediaKitInitPropertyPlaylistMap
@end

@implementation MPMediaKitInitPropertyPlaylistMap

void ___MPMediaKitInitPropertyPlaylistMap_block_invoke_9(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  id v5 = a4;
  id v6 = a2;
  v7 = [v6 objectForKeyedSubscript:@"curatorName"];
  [v5 setObject:v7 forKeyedSubscript:@"name"];

  id v8 = [v6 objectForKeyedSubscript:@"curatorSocialHandle"];

  [v5 setObject:v8 forKeyedSubscript:@"handle"];
}

id ___MPMediaKitInitPropertyPlaylistMap_block_invoke_8(uint64_t a1, void *a2)
{
  id v2 = a2;
  v3 = [v2 valueForKeyPath:@"attributes.supportsSing"];
  int v4 = [v3 BOOLValue];

  if (v4) {
    uint64_t v5 = 256;
  }
  else {
    uint64_t v5 = 0;
  }
  id v6 = +[MPCloudController sharedCloudController];
  int v7 = [v6 isEnhancedAudioAvailable];

  if (v7)
  {
    id v8 = [v2 valueForKeyPath:@"attributes.audioTraits"];
    if ([v8 containsObject:@"spatial"]) {
      v5 |= 8uLL;
    }
    if ([v8 containsObject:@"atmos"]) {
      v5 |= 0x10uLL;
    }
    if ([v8 containsObject:@"surround"]) {
      v5 |= 0x20uLL;
    }
  }
  v9 = [NSNumber numberWithUnsignedInteger:v5];

  return v9;
}

id ___MPMediaKitInitPropertyPlaylistMap_block_invoke_7(uint64_t a1, void *a2)
{
  id v2 = [a2 valueForKeyPath:@"attributes.url"];
  if (v2)
  {
    v3 = [MEMORY[0x1E4F1CB10] URLWithString:v2];
  }
  else
  {
    v3 = 0;
  }

  return v3;
}

id ___MPMediaKitInitPropertyPlaylistMap_block_invoke_6(uint64_t a1, void *a2)
{
  id v2 = a2;
  v3 = [v2 valueForKeyPath:@"attributes.playlistType"];
  if ([v3 isEqualToString:@"editorial"])
  {
    int v4 = [v2 valueForKeyPath:@"attributes.isChart"];
    int v5 = [v4 BOOLValue];

    if (v5) {
      uint64_t v6 = 8;
    }
    else {
      uint64_t v6 = 4;
    }
  }
  else if ([v3 isEqualToString:@"external"])
  {
    uint64_t v6 = 5;
  }
  else if ([v3 isEqualToString:@"user-shared"])
  {
    uint64_t v6 = 6;
  }
  else if ([v3 isEqualToString:@"personal-mix"])
  {
    uint64_t v6 = 7;
  }
  else
  {
    uint64_t v6 = 0;
  }
  int v7 = [NSNumber numberWithInteger:v6];

  return v7;
}

id ___MPMediaKitInitPropertyPlaylistMap_block_invoke_5(uint64_t a1, void *a2)
{
  id v2 = [a2 valueForKeyPath:@"attributes.lastModifiedDate"];
  v3 = _MPMediaKitDateAndTimeFromString(v2);

  if (v3)
  {
    int v4 = _MPMediaKitCalendar();
    int v5 = [v4 components:3145982 fromDate:v3];
  }
  else
  {
    int v5 = 0;
  }

  return v5;
}

id ___MPMediaKitInitPropertyPlaylistMap_block_invoke_4(uint64_t a1, void *a2)
{
  id v2 = [a2 valueForKeyPath:@"attributes.releaseDate"];
  v3 = _MPMediaKitDateFromString(v2);

  if (v3)
  {
    int v4 = _MPMediaKitCalendar();
    int v5 = [v4 components:1048606 fromDate:v3];
  }
  else
  {
    int v5 = 0;
  }

  return v5;
}

void ___MPMediaKitInitPropertyPlaylistMap_block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v6 = a2;
  id v7 = a3;
  uint64_t v13 = MEMORY[0x1E4F143A8];
  uint64_t v14 = 3221225472;
  v15 = ___MPMediaKitInitPropertyPlaylistMap_block_invoke_2;
  v16 = &unk_1E57F9580;
  id v17 = v6;
  id v18 = v7;
  id v8 = v7;
  id v9 = v6;
  id v10 = a4;
  [v10 setUniversalStoreIdentifiersWithBlock:&v13];
  v11 = objc_msgSend(v8, "personID", v13, v14, v15, v16);
  [v10 setPersonalStoreIdentifiersWithPersonID:v11 block:&__block_literal_global_369];

  v12 = [v9 valueForKeyPath:@"attributes.playParams.versionHash"];
  [v10 setVersionHash:v12];
}

void ___MPMediaKitInitPropertyPlaylistMap_block_invoke_2(uint64_t a1, void *a2)
{
  v8[2] = *MEMORY[0x1E4F143B8];
  v8[0] = @"_MPMKT_transformedType";
  v8[1] = @"type";
  v3 = (void *)MEMORY[0x1E4F1C978];
  id v4 = a2;
  int v5 = [v3 arrayWithObjects:v8 count:2];
  id v6 = _MPKeyPathValueTransformFirstNonnullKeyPath(v5, *(void **)(a1 + 32));

  LODWORD(v5) = [v6 isEqual:@"library-playlists"];
  id v7 = [*(id *)(a1 + 32) objectForKeyedSubscript:@"id"];
  if (v5) {
    [v4 setUniversalCloudLibraryID:v7];
  }
  else {
    [v4 setGlobalPlaylistID:v7];
  }
}

@end