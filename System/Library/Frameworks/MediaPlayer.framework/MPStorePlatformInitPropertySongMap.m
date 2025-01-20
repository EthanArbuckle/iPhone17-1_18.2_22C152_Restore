@interface MPStorePlatformInitPropertySongMap
@end

@implementation MPStorePlatformInitPropertySongMap

void ___MPStorePlatformInitPropertySongMap_block_invoke_7_197(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  id v5 = a4;
  id v6 = a2;
  v7 = [v6 objectForKeyedSubscript:@"kind"];
  [v5 setObject:v7 forKeyedSubscript:@"kind"];

  id v8 = [v6 objectForKeyedSubscript:@"shouldBookmarkPlayPosition"];

  [v5 setObject:v8 forKeyedSubscript:@"shouldBookmarkPlayPosition"];
}

void ___MPStorePlatformInitPropertySongMap_block_invoke_5_183(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  id v5 = a4;
  id v6 = a2;
  v7 = [v6 objectForKeyedSubscript:@"hasLyrics"];
  [v5 setObject:v7 forKeyedSubscript:@"hasLyrics"];

  id v8 = [v6 objectForKeyedSubscript:@"hasTimeSyncedLyrics"];

  [v5 setObject:v8 forKeyedSubscript:@"hasTimeSyncedLyrics"];
}

void ___MPStorePlatformInitPropertySongMap_block_invoke_4_179(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  id v5 = a4;
  id v6 = a2;
  v7 = [v6 objectForKeyedSubscript:@"genreNames"];
  [v5 setObject:v7 forKeyedSubscript:@"genreNames"];

  id v8 = [v6 objectForKeyedSubscript:@"genres"];

  [v5 setObject:v8 forKeyedSubscript:@"genres"];
}

void ___MPStorePlatformInitPropertySongMap_block_invoke_3_172(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  id v5 = a4;
  id v6 = [a2 valueForKeyPath:@"composer.name"];
  [v5 setObject:v6 forKeyedSubscript:@"name"];
}

void ___MPStorePlatformInitPropertySongMap_block_invoke_2_162(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  id v5 = a4;
  id v6 = a2;
  v7 = [v6 objectForKeyedSubscript:@"artistId"];
  [v5 setObject:v7 forKeyedSubscript:@"id"];

  id v8 = [v6 objectForKeyedSubscript:@"artistName"];

  [v5 setObject:v8 forKeyedSubscript:@"name"];
}

void ___MPStorePlatformInitPropertySongMap_block_invoke_136(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  id v5 = a4;
  id v6 = a2;
  v7 = [v6 objectForKeyedSubscript:@"collectionId"];
  [v5 setObject:v7 forKeyedSubscript:@"id"];

  id v8 = [v6 objectForKeyedSubscript:@"collectionName"];
  [v5 setObject:v8 forKeyedSubscript:@"name"];

  v9 = [v6 objectForKeyedSubscript:@"releaseDate"];
  [v5 setObject:v9 forKeyedSubscript:@"releaseDate"];

  v10 = [v6 objectForKeyedSubscript:@"trackCount"];
  [v5 setObject:v10 forKeyedSubscript:@"trackCount"];

  v11 = [v6 objectForKeyedSubscript:@"discCount"];
  [v5 setObject:v11 forKeyedSubscript:@"discCount"];

  v12 = [v6 objectForKeyedSubscript:@"children"];
  [v5 setObject:v12 forKeyedSubscript:@"children"];

  v13 = [v6 objectForKeyedSubscript:@"copyright"];
  [v5 setObject:v13 forKeyedSubscript:@"copyright"];

  v14 = [v6 objectForKeyedSubscript:@"isPreorder"];
  [v5 setObject:v14 forKeyedSubscript:@"isPreorder"];

  v15 = [v6 objectForKeyedSubscript:@"genreNames"];
  [v5 setObject:v15 forKeyedSubscript:@"genreNames"];

  id v16 = [v6 objectForKeyedSubscript:@"genres"];

  [v5 setObject:v16 forKeyedSubscript:@"genres"];
}

void *___MPStorePlatformInitPropertySongMap_block_invoke_10()
{
  return &unk_1EE6EE420;
}

id ___MPStorePlatformInitPropertySongMap_block_invoke_9(uint64_t a1, void *a2)
{
  v2 = [a2 objectForKeyedSubscript:@"releaseDate"];
  v3 = _MPStorePlatformDateFromString(v2);

  if (v3)
  {
    v4 = _MPStorePlatformCalendar();
    uint64_t v5 = [v4 component:4 fromDate:v3];
  }
  else
  {
    uint64_t v5 = 0;
  }
  id v6 = [NSNumber numberWithInteger:v5];

  return v6;
}

id ___MPStorePlatformInitPropertySongMap_block_invoke_8(uint64_t a1, void *a2)
{
  id v2 = a2;
  v3 = [v2 objectForKeyedSubscript:@"kind"];
  if ([v3 isEqual:@"uploadedAudio"]) {
    unsigned int v4 = 0;
  }
  else {
    unsigned int v4 = [v3 isEqual:@"uploadedVideo"] ^ 1;
  }
  uint64_t v5 = [v2 objectForKeyedSubscript:@"offers.type"];
  uint64_t v6 = [v5 countForObject:@"subscription"];

  if (v6) {
    uint64_t v7 = v4;
  }
  else {
    uint64_t v7 = 0;
  }
  id v8 = [NSNumber numberWithInt:v7];

  return v8;
}

uint64_t ___MPStorePlatformInitPropertySongMap_block_invoke_7()
{
  return 0;
}

id ___MPStorePlatformInitPropertySongMap_block_invoke_6(uint64_t a1, void *a2)
{
  id v2 = [a2 objectForKeyedSubscript:@"kind"];
  v3 = NSNumber;
  if ([v2 isEqual:@"musicVideo"]) {
    uint64_t v4 = 1;
  }
  else {
    uint64_t v4 = [v2 isEqual:@"uploadedVideo"];
  }
  uint64_t v5 = [v3 numberWithInt:v4];

  return v5;
}

id ___MPStorePlatformInitPropertySongMap_block_invoke_5(uint64_t a1, void *a2)
{
  id v2 = [a2 objectForKeyedSubscript:@"kind"];
  if ([v2 isEqual:@"uploadedAudio"]) {
    uint64_t v3 = 1;
  }
  else {
    uint64_t v3 = [v2 isEqual:@"uploadedVideo"];
  }
  uint64_t v4 = [NSNumber numberWithBool:v3];

  return v4;
}

id ___MPStorePlatformInitPropertySongMap_block_invoke_4(uint64_t a1, void *a2)
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v2 = a2;
  uint64_t v3 = [v2 objectForKeyedSubscript:@"durationInMillis"];
  if (_NSIsNSNumber())
  {
    uint64_t v4 = NSNumber;
    [v3 doubleValue];
    double v6 = v5 / 1000.0;
    uint64_t v7 = v4;
  }
  else
  {
    long long v21 = 0u;
    long long v22 = 0u;
    long long v19 = 0u;
    long long v20 = 0u;
    id v8 = objc_msgSend(v2, "objectForKeyedSubscript:", @"offers", 0);
    uint64_t v9 = [v8 countByEnumeratingWithState:&v19 objects:v23 count:16];
    if (v9)
    {
      uint64_t v10 = v9;
      uint64_t v11 = *(void *)v20;
      double v12 = 0.0;
      do
      {
        for (uint64_t i = 0; i != v10; ++i)
        {
          if (*(void *)v20 != v11) {
            objc_enumerationMutation(v8);
          }
          v14 = [*(id *)(*((void *)&v19 + 1) + 8 * i) valueForKeyPath:@"assets.@max.duration"];
          [v14 doubleValue];
          double v16 = v15;

          if (v12 < v16) {
            double v12 = v16;
          }
        }
        uint64_t v10 = [v8 countByEnumeratingWithState:&v19 objects:v23 count:16];
      }
      while (v10);
    }
    else
    {
      double v12 = 0.0;
    }

    uint64_t v7 = NSNumber;
    double v6 = v12;
  }
  v17 = [v7 numberWithDouble:v6];

  return v17;
}

void ___MPStorePlatformInitPropertySongMap_block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v6 = a2;
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = ___MPStorePlatformInitPropertySongMap_block_invoke_2;
  v14[3] = &unk_1E57FA390;
  id v7 = v6;
  id v15 = v7;
  id v8 = a4;
  id v9 = a3;
  [v8 setUniversalStoreIdentifiersWithBlock:v14];
  uint64_t v10 = [v9 personID];

  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = ___MPStorePlatformInitPropertySongMap_block_invoke_3;
  v12[3] = &unk_1E57F96C8;
  id v13 = v7;
  id v11 = v7;
  [v8 setPersonalStoreIdentifiersWithPersonID:v10 block:v12];
}

void ___MPStorePlatformInitPropertySongMap_block_invoke_2(uint64_t a1, void *a2)
{
  *(void *)&v49[104] = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = [*(id *)(a1 + 32) objectForKeyedSubscript:@"id"];
  if (_NSIsNSNumber() & 1) != 0 || (_NSIsNSString() & 1) != 0 || (objc_opt_respondsToSelector()) {
    uint64_t v5 = [v4 longLongValue];
  }
  else {
    uint64_t v5 = 0;
  }

  [v3 setAdamID:v5];
  id v6 = [*(id *)(a1 + 32) objectForKeyedSubscript:@"formerIds"];
  if (_NSIsNSArray())
  {
    long long v43 = 0u;
    long long v44 = 0u;
    long long v45 = 0u;
    long long v46 = 0u;
    id v7 = v6;
    uint64_t v8 = [v7 countByEnumeratingWithState:&v43 objects:v48 count:16];
    if (!v8) {
      goto LABEL_14;
    }
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v44;
    while (1)
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v44 != v10) {
          objc_enumerationMutation(v7);
        }
        if (!_NSIsNSNumber())
        {
          uint64_t v37 = a1;
          id v38 = v3;

          id v13 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(v7, "count"));
          long long v39 = 0u;
          long long v40 = 0u;
          long long v41 = 0u;
          long long v42 = 0u;
          id v14 = v7;
          uint64_t v15 = [v14 countByEnumeratingWithState:&v39 objects:v47 count:16];
          if (!v15) {
            goto LABEL_30;
          }
          uint64_t v16 = v15;
          uint64_t v17 = *(void *)v40;
          while (1)
          {
            for (uint64_t j = 0; j != v16; ++j)
            {
              if (*(void *)v40 != v17) {
                objc_enumerationMutation(v14);
              }
              id v19 = *(id *)(*((void *)&v39 + 1) + 8 * j);
              if (_NSIsNSNumber() & 1) != 0 || (_NSIsNSString() & 1) != 0 || (objc_opt_respondsToSelector())
              {
                uint64_t v20 = [v19 longLongValue];

                if (!v20) {
                  continue;
                }
                id v19 = [NSNumber numberWithLongLong:v20];
                [v13 addObject:v19];
              }
            }
            uint64_t v16 = [v14 countByEnumeratingWithState:&v39 objects:v47 count:16];
            if (!v16)
            {
LABEL_30:

              a1 = v37;
              id v3 = v38;
              goto LABEL_37;
            }
          }
        }
      }
      uint64_t v9 = [v7 countByEnumeratingWithState:&v43 objects:v48 count:16];
      if (!v9)
      {
LABEL_14:

        id v12 = v7;
LABEL_36:
        id v13 = v12;
LABEL_37:

        goto LABEL_38;
      }
    }
  }
  if (_NSIsNSNumber())
  {
    v48[0] = v6;
    id v13 = [MEMORY[0x1E4F1C978] arrayWithObjects:v48 count:1];
  }
  else
  {
    id v21 = v6;
    if (_NSIsNSNumber() & 1) != 0 || (_NSIsNSString() & 1) != 0 || (objc_opt_respondsToSelector())
    {
      uint64_t v22 = [v21 longLongValue];

      if (v22)
      {
        id v7 = [NSNumber numberWithLongLong:v22];
        v48[0] = v7;
        id v12 = [MEMORY[0x1E4F1C978] arrayWithObjects:v48 count:1];
        goto LABEL_36;
      }
    }
    else
    {
    }
    id v13 = (void *)MEMORY[0x1E4F1CBF0];
  }
LABEL_38:

  [v3 setFormerAdamIDs:v13];
  id v23 = [*(id *)(a1 + 32) objectForKeyedSubscript:@"libraryTrackId"];
  if (_NSIsNSString())
  {
    CFStringRef v24 = (CFStringRef)v23;
  }
  else
  {
    if (!_NSIsNSNumber())
    {
      v32 = 0;
      goto LABEL_55;
    }
    id v25 = v23;
    if (_NSIsNSNumber() & 1) != 0 || (_NSIsNSString() & 1) != 0 || (objc_opt_respondsToSelector()) {
      uint64_t v26 = [v25 longLongValue];
    }
    else {
      uint64_t v26 = 0;
    }

    v27 = &v49[1];
    uint64_t quot = v26;
    do
    {
      lldiv_t v29 = lldiv(quot, 10);
      uint64_t quot = v29.quot;
      if (v29.rem >= 0) {
        LOBYTE(v30) = v29.rem;
      }
      else {
        uint64_t v30 = -v29.rem;
      }
      *(v27 - 2) = v30 + 48;
      v31 = v27 - 2;
      --v27;
    }
    while (v29.quot);
    if (v26 < 0)
    {
      *(v27 - 2) = 45;
      v31 = v27 - 2;
    }
    CFStringRef v24 = CFStringCreateWithBytes(0, v31, v49 - v31, 0x8000100u, 0);
  }
  v32 = (__CFString *)v24;
LABEL_55:

  [v3 setUniversalCloudLibraryID:v32];
  id v33 = [*(id *)(a1 + 32) objectForKeyedSubscript:@"purchasedAdamId"];
  if (_NSIsNSNumber() & 1) != 0 || (_NSIsNSString() & 1) != 0 || (objc_opt_respondsToSelector()) {
    uint64_t v34 = [v33 longLongValue];
  }
  else {
    uint64_t v34 = 0;
  }

  [v3 setPurchasedAdamID:v34];
  id v35 = [*(id *)(a1 + 32) objectForKeyedSubscript:@"subscribedAdamID"];
  if (_NSIsNSNumber() & 1) != 0 || (_NSIsNSString() & 1) != 0 || (objc_opt_respondsToSelector()) {
    uint64_t v36 = [v35 longLongValue];
  }
  else {
    uint64_t v36 = 0;
  }

  [v3 setSubscriptionAdamID:v36];
}

void ___MPStorePlatformInitPropertySongMap_block_invoke_3(uint64_t a1, void *a2)
{
  id v2 = *(void **)(a1 + 32);
  id v3 = a2;
  id v5 = [v2 objectForKeyedSubscript:@"sagaId"];
  if (_NSIsNSNumber() & 1) != 0 || (_NSIsNSString() & 1) != 0 || (objc_opt_respondsToSelector()) {
    uint64_t v4 = [v5 longLongValue];
  }
  else {
    uint64_t v4 = 0;
  }

  [v3 setCloudID:v4];
}

@end