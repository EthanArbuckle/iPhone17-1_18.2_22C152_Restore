@interface MPStorePlatformInitPropertyTVEpisodeMap
@end

@implementation MPStorePlatformInitPropertyTVEpisodeMap

void ___MPStorePlatformInitPropertyTVEpisodeMap_block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v6 = a2;
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = ___MPStorePlatformInitPropertyTVEpisodeMap_block_invoke_2;
  v14[3] = &unk_1E57FA390;
  id v7 = v6;
  id v15 = v7;
  id v8 = a4;
  id v9 = a3;
  [v8 setUniversalStoreIdentifiersWithBlock:v14];
  v10 = [v9 personID];

  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = ___MPStorePlatformInitPropertyTVEpisodeMap_block_invoke_3;
  v12[3] = &unk_1E57F96C8;
  id v13 = v7;
  id v11 = v7;
  [v8 setPersonalStoreIdentifiersWithPersonID:v10 block:v12];
}

void ___MPStorePlatformInitPropertyTVEpisodeMap_block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = [*(id *)(a1 + 32) objectForKeyedSubscript:@"id"];
  if (_NSIsNSNumber() & 1) != 0 || (_NSIsNSString() & 1) != 0 || (objc_opt_respondsToSelector()) {
    uint64_t v5 = [v4 longLongValue];
  }
  else {
    uint64_t v5 = 0;
  }

  [v3 setAdamID:v5];
  id v6 = [*(id *)(a1 + 32) objectForKeyedSubscript:@"libraryTrackId"];
  if (_NSIsNSString())
  {
    CFStringRef v7 = (CFStringRef)v6;
  }
  else
  {
    if (!_NSIsNSNumber())
    {
      id v15 = 0;
      goto LABEL_22;
    }
    id v8 = v6;
    if (_NSIsNSNumber() & 1) != 0 || (_NSIsNSString() & 1) != 0 || (objc_opt_respondsToSelector()) {
      uint64_t v9 = [v8 longLongValue];
    }
    else {
      uint64_t v9 = 0;
    }

    v10 = (char *)&v16 + 1;
    uint64_t quot = v9;
    do
    {
      lldiv_t v12 = lldiv(quot, 10);
      uint64_t quot = v12.quot;
      if (v12.rem >= 0) {
        LOBYTE(v13) = v12.rem;
      }
      else {
        uint64_t v13 = -v12.rem;
      }
      *(v10 - 2) = v13 + 48;
      v14 = (const UInt8 *)(v10 - 2);
      --v10;
    }
    while (v12.quot);
    if (v9 < 0)
    {
      *(v10 - 2) = 45;
      v14 = (const UInt8 *)(v10 - 2);
    }
    CFStringRef v7 = CFStringCreateWithBytes(0, v14, (char *)&v16 - (char *)v14, 0x8000100u, 0);
  }
  id v15 = (__CFString *)v7;
LABEL_22:

  [v3 setUniversalCloudLibraryID:v15];
}

void ___MPStorePlatformInitPropertyTVEpisodeMap_block_invoke_3(uint64_t a1, void *a2)
{
  v2 = *(void **)(a1 + 32);
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