@interface DCBaiduMapsURLGenerator
- (id)directionsMode;
- (id)host;
- (id)path;
- (id)scheme;
- (void)populateQueryDictionary;
@end

@implementation DCBaiduMapsURLGenerator

- (id)directionsMode
{
  v2 = [(DCMapsURLGenerator *)self mapsLink];
  uint64_t v3 = [v2 directionsMode];

  if ((unint64_t)(v3 - 1) > 3) {
    return 0;
  }
  else {
    return *(&off_26428ABC0 + v3 - 1);
  }
}

- (void)populateQueryDictionary
{
  id v8 = [(DCMapsURLGenerator *)self mapsLink];
  uint64_t v3 = [(DCBaiduMapsURLGenerator *)self directionsMode];
  [(DCMapsURLGenerator *)self setString:v3 forQueryKey:@"mode"];

  id v4 = [v8 destinationAddress];
  if (!v4)
  {
    id v4 = [v8 centerLocation];
    if (!v4)
    {
      v5 = [v8 searchQuery];
      if (v5)
      {
        id v4 = v5;
      }
      else
      {
        id v4 = [v8 searchLocation];
        if (!v4) {
          goto LABEL_7;
        }
      }
    }
  }
  [(DCMapsURLGenerator *)self setString:v4 forQueryKey:@"destination"];

LABEL_7:
  v6 = [v8 startAddress];

  if (v6)
  {
    v7 = [v8 startAddress];
    [(DCMapsURLGenerator *)self setString:v7 forQueryKey:@"origin"];
  }
}

- (id)path
{
  return @"/direction";
}

- (id)host
{
  return @"map";
}

- (id)scheme
{
  v2 = @"baidumap";
  return @"baidumap";
}

@end