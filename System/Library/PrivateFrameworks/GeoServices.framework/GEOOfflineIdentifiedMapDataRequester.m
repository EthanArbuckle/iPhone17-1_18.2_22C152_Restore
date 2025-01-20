@interface GEOOfflineIdentifiedMapDataRequester
+ (unsigned)tileProviderIdentifier;
- (GEOOfflineDataKey)_offlineDataKeyForTileKey:(uint64_t)a3 localeKey:(void *)a4;
- (id)activeTileSetForKey:(uint64_t)a3;
- (uint64_t)tileSetForKey:(uint64_t)a3;
@end

@implementation GEOOfflineIdentifiedMapDataRequester

+ (unsigned)tileProviderIdentifier
{
  return 73;
}

- (uint64_t)tileSetForKey:(uint64_t)a3
{
  return (*(unsigned __int8 *)(a3 + 10) << 8) | 0x800001u;
}

- (id)activeTileSetForKey:(uint64_t)a3
{
  v4 = [a1 resourceManifestManager];
  v5 = [v4 activeTileGroup];
  v6 = [v5 activeTileSetForStyle:*(unsigned __int8 *)(a3 + 10)];

  return v6;
}

- (GEOOfflineDataKey)_offlineDataKeyForTileKey:(uint64_t)a3 localeKey:(void *)a4
{
  id v5 = a4;
  v6 = v5;
  if (a3)
  {
    unint64_t v12 = bswap64(*(void *)(a3 + 1));
    uint64_t v7 = [v5 lengthOfBytesUsingEncoding:1] + 8;
    v8 = (void *)[objc_alloc(MEMORY[0x1E4F1CA58]) initWithCapacity:v7];
    [v8 appendBytes:&v12 length:8];
    if ([v6 length])
    {
      v9 = [v6 dataUsingEncoding:1];
      [v8 appendData:v9];
    }
    v10 = [[GEOOfflineDataKey alloc] initWithLayer:11 serviceKey:v8];
  }
  else
  {
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_fault_impl(&dword_188D96000, MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT, "Assertion failed: onlineTileKey != ((void *)0)", buf, 2u);
    }
    v10 = 0;
  }

  return v10;
}

@end