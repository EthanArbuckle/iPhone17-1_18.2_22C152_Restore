@interface MPStorePlatformInitPropertyAlbumMap
@end

@implementation MPStorePlatformInitPropertyAlbumMap

void ___MPStorePlatformInitPropertyAlbumMap_block_invoke_14(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  id v5 = a4;
  id v6 = a2;
  v7 = [v6 objectForKeyedSubscript:@"genreNames"];
  [v5 setObject:v7 forKeyedSubscript:@"genreNames"];

  id v8 = [v6 objectForKeyedSubscript:@"genres"];

  [v5 setObject:v8 forKeyedSubscript:@"genres"];
}

void ___MPStorePlatformInitPropertyAlbumMap_block_invoke_13(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  id v5 = a4;
  id v6 = a2;
  v7 = [v6 objectForKeyedSubscript:@"artistId"];
  [v5 setObject:v7 forKeyedSubscript:@"id"];

  id v8 = [v6 objectForKeyedSubscript:@"artistName"];

  [v5 setObject:v8 forKeyedSubscript:@"name"];
}

id ___MPStorePlatformInitPropertyAlbumMap_block_invoke_12(uint64_t a1, void *a2)
{
  v2 = [a2 objectForKeyedSubscript:@"classicalUrl"];
  if (v2) {
    v3 = (void *)MEMORY[0x1E4F1CC38];
  }
  else {
    v3 = (void *)MEMORY[0x1E4F1CC28];
  }
  id v4 = v3;

  return v4;
}

uint64_t ___MPStorePlatformInitPropertyAlbumMap_block_invoke_11()
{
  return 0;
}

void *___MPStorePlatformInitPropertyAlbumMap_block_invoke_10()
{
  return &unk_1EE6EE420;
}

id ___MPStorePlatformInitPropertyAlbumMap_block_invoke_9(uint64_t a1, void *a2)
{
  v2 = [a2 objectForKeyedSubscript:@"releaseDate"];
  v3 = _MPStorePlatformDateFromString(v2);

  if (v3)
  {
    id v4 = _MPStorePlatformCalendar();
    uint64_t v5 = [v4 component:4 fromDate:v3];
  }
  else
  {
    uint64_t v5 = 0;
  }
  id v6 = [NSNumber numberWithInteger:v5];

  return v6;
}

id ___MPStorePlatformInitPropertyAlbumMap_block_invoke_8(uint64_t a1, void *a2)
{
  id v2 = a2;
  v3 = [v2 objectForKeyedSubscript:@"isAvailable"];
  id v4 = v3;
  if (v3)
  {
    id v5 = v3;
  }
  else
  {
    id v6 = [v2 objectForKeyedSubscript:@"children.offers.type"];
    BOOL v7 = [v6 countForObject:@"subscription"] != 0;

    id v5 = [NSNumber numberWithBool:v7];
  }
  id v8 = v5;

  return v8;
}

uint64_t ___MPStorePlatformInitPropertyAlbumMap_block_invoke_7()
{
  return 0;
}

id ___MPStorePlatformInitPropertyAlbumMap_block_invoke_6(uint64_t a1, void *a2)
{
  id v2 = [a2 objectForKeyedSubscript:@"releaseDate"];
  v3 = _MPStorePlatformDateFromString(v2);

  if (v3)
  {
    id v4 = _MPStorePlatformCalendar();
    id v5 = [v4 components:1048606 fromDate:v3];
  }
  else
  {
    id v5 = 0;
  }

  return v5;
}

id ___MPStorePlatformInitPropertyAlbumMap_block_invoke_5(uint64_t a1, void *a2)
{
  id v2 = a2;
  v3 = [v2 objectForKeyedSubscript:@"children.contentRatingsBySystem.riaa.value"];
  id v4 = [v2 objectForKeyedSubscript:@"contentRatingsBySystem.riaa.value"];

  if ([v3 count])
  {
    id v5 = [v3 valueForKeyPath:@"@max.self"];
    uint64_t v6 = [v5 integerValue];
  }
  else if (v4)
  {
    uint64_t v6 = [v4 integerValue];
  }
  else
  {
    uint64_t v6 = 0;
  }
  BOOL v7 = [NSNumber numberWithInt:v6 > 499];

  return v7;
}

id ___MPStorePlatformInitPropertyAlbumMap_block_invoke_4(uint64_t a1, void *a2)
{
  id v2 = a2;
  v3 = [v2 objectForKeyedSubscript:@"children.contentRatingsBySystem.riaa.value"];
  id v4 = [v2 objectForKeyedSubscript:@"contentRatingsBySystem.riaa.value"];

  if ([v3 count])
  {
    id v5 = [v3 valueForKeyPath:@"@min.self"];
    uint64_t v6 = [v5 integerValue];
  }
  else if (v4)
  {
    uint64_t v6 = [v4 integerValue];
  }
  else
  {
    uint64_t v6 = 1000;
  }
  BOOL v7 = [NSNumber numberWithInt:v6 < 500];

  return v7;
}

void ___MPStorePlatformInitPropertyAlbumMap_block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v6 = a2;
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = ___MPStorePlatformInitPropertyAlbumMap_block_invoke_2;
  v14[3] = &unk_1E57FA390;
  id v7 = v6;
  id v15 = v7;
  id v8 = a4;
  id v9 = a3;
  [v8 setUniversalStoreIdentifiersWithBlock:v14];
  v10 = [v9 personID];

  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = ___MPStorePlatformInitPropertyAlbumMap_block_invoke_3;
  v12[3] = &unk_1E57F96C8;
  id v13 = v7;
  id v11 = v7;
  [v8 setPersonalStoreIdentifiersWithPersonID:v10 block:v12];
}

void ___MPStorePlatformInitPropertyAlbumMap_block_invoke_2(uint64_t a1, void *a2)
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

void ___MPStorePlatformInitPropertyAlbumMap_block_invoke_3(uint64_t a1, void *a2)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = [*(id *)(a1 + 32) objectForKeyedSubscript:@"libraryAlbumId"];
  if (_NSIsNSString())
  {
    CFStringRef v5 = (CFStringRef)v4;
  }
  else
  {
    if (!_NSIsNSNumber())
    {
      id v13 = 0;
      goto LABEL_18;
    }
    id v6 = v4;
    if (_NSIsNSNumber() & 1) != 0 || (_NSIsNSString() & 1) != 0 || (objc_opt_respondsToSelector()) {
      uint64_t v7 = [v6 longLongValue];
    }
    else {
      uint64_t v7 = 0;
    }

    id v8 = (char *)&v14 + 1;
    uint64_t quot = v7;
    do
    {
      lldiv_t v10 = lldiv(quot, 10);
      uint64_t quot = v10.quot;
      if (v10.rem >= 0) {
        LOBYTE(v11) = v10.rem;
      }
      else {
        uint64_t v11 = -v10.rem;
      }
      *(v8 - 2) = v11 + 48;
      v12 = (const UInt8 *)(v8 - 2);
      --v8;
    }
    while (v10.quot);
    if (v7 < 0)
    {
      *(v8 - 2) = 45;
      v12 = (const UInt8 *)(v8 - 2);
    }
    CFStringRef v5 = CFStringCreateWithBytes(0, v12, (char *)&v14 - (char *)v12, 0x8000100u, 0);
  }
  id v13 = (__CFString *)v5;
LABEL_18:

  [v3 setCloudAlbumID:v13];
}

@end