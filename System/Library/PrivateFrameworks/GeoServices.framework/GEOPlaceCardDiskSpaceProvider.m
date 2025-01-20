@interface GEOPlaceCardDiskSpaceProvider
- (NSString)identifier;
- (int)minimumUrgency;
- (unint64_t)freePurgableDiskSpace:(unint64_t)a3 urgency:(int)a4;
- (unint64_t)purgableDiskSpaceForUrgency:(int)a3;
@end

@implementation GEOPlaceCardDiskSpaceProvider

- (NSString)identifier
{
  return (NSString *)@"com.apple.geod.PlaceCache";
}

- (int)minimumUrgency
{
  return 2;
}

- (unint64_t)purgableDiskSpaceForUrgency:(int)a3
{
  if ([(GEOPlaceCardDiskSpaceProvider *)self minimumUrgency] > a3) {
    return 0;
  }
  v4 = +[GEOPlaceDataLocalProxy shared];
  id v5 = [v4 calculateFreeableSpaceSync];

  return (unint64_t)v5;
}

- (unint64_t)freePurgableDiskSpace:(unint64_t)a3 urgency:(int)a4
{
  uint64_t v4 = *(void *)&a4;
  if ([(GEOPlaceCardDiskSpaceProvider *)self minimumUrgency] > a4) {
    return 0;
  }
  unint64_t v8 = [(GEOPlaceCardDiskSpaceProvider *)self purgableDiskSpaceForUrgency:v4];
  if (v8 >= a3) {
    unint64_t v9 = v8 - a3;
  }
  else {
    unint64_t v9 = 0;
  }
  v10 = +[GEOPlaceDataLocalProxy shared];
  id v11 = [v10 shrinkBySizeSync:v9];

  return (unint64_t)v11;
}

@end