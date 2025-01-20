@interface _GEOMapItemHandleCacheDelegate
- (void)cache:(id)a3 willEvictObject:(id)a4;
@end

@implementation _GEOMapItemHandleCacheDelegate

- (void)cache:(id)a3 willEvictObject:(id)a4
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v4 = a4;
  v5 = GEOFindOrCreateLog("com.apple.GeoServices", "GEOMapService");
  BOOL v6 = os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG);

  if (v6)
  {
    id v7 = v4;
    v8 = [GEOMapItemStorage alloc];
    v9 = [v7 data];
    v10 = [(GEOMapItemStorage *)v8 initWithData:v9];

    v11 = GEOFindOrCreateLog("com.apple.GeoServices", "GEOMapService");
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
    {
      int v12 = 138477827;
      v13 = v10;
      _os_log_impl(&dword_188D96000, v11, OS_LOG_TYPE_DEBUG, "Handle cache evicting map item: %{private}@", (uint8_t *)&v12, 0xCu);
    }
  }
}

@end