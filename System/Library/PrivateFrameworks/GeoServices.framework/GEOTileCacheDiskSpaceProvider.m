@interface GEOTileCacheDiskSpaceProvider
- (NSString)identifier;
- (int)minimumUregency;
- (unint64_t)freePurgableDiskSpace:(unint64_t)a3 urgency:(int)a4;
- (unint64_t)purgableDiskSpaceForUrgency:(int)a3;
@end

@implementation GEOTileCacheDiskSpaceProvider

- (NSString)identifier
{
  return (NSString *)@"com.apple.geod.TileCache";
}

- (int)minimumUregency
{
  return 3;
}

- (unint64_t)purgableDiskSpaceForUrgency:(int)a3
{
  if ([(GEOTileCacheDiskSpaceProvider *)self minimumUregency] > a3) {
    return 0;
  }
  v4 = +[NSUUID UUID];
  v5 = [v4 UUIDString];
  v6 = +[NSString stringWithFormat:@"GEODiskSpaceManager-%@", v5];

  v7 = +[GEOTileLoader modernLoader];
  [v7 openForClient:v6];

  v8 = +[GEOTileLoader modernLoader];
  id v9 = [v8 calculateFreeableSizeSync];

  v10 = +[GEOTileLoader modernLoader];
  [v10 closeForClient:v6];

  return (unint64_t)v9;
}

- (unint64_t)freePurgableDiskSpace:(unint64_t)a3 urgency:(int)a4
{
  uint64_t v4 = *(void *)&a4;
  if ([(GEOTileCacheDiskSpaceProvider *)self minimumUregency] > a4) {
    return 0;
  }
  unint64_t v8 = [(GEOTileCacheDiskSpaceProvider *)self purgableDiskSpaceForUrgency:v4];
  if (v8 >= a3) {
    unint64_t v9 = v8 - a3;
  }
  else {
    unint64_t v9 = 0;
  }
  v10 = +[NSUUID UUID];
  v11 = [v10 UUIDString];
  v12 = +[NSString stringWithFormat:@"GEODiskSpaceManager-%@", v11];

  v13 = +[GEOTileLoader modernLoader];
  [v13 openForClient:v12];

  v14 = +[GEOTileLoader modernLoader];
  id v15 = [v14 shrinkDiskCacheToSizeSync:v9];

  v16 = +[GEOTileLoader modernLoader];
  [v16 closeForClient:v12];

  return (unint64_t)v15;
}

@end