@interface DCGoogleMapsURLGenerator
- (id)directionsMode;
- (id)host;
- (id)path;
- (id)scheme;
- (void)populateQueryDictionary;
@end

@implementation DCGoogleMapsURLGenerator

- (id)directionsMode
{
  v2 = [(DCMapsURLGenerator *)self mapsLink];
  uint64_t v3 = [v2 directionsMode];

  if ((unint64_t)(v3 - 1) > 4) {
    return 0;
  }
  else {
    return off_264285888[v3 - 1];
  }
}

- (void)populateQueryDictionary
{
  id v17 = [(DCMapsURLGenerator *)self mapsLink];
  uint64_t v3 = [MEMORY[0x263F089D8] string];
  if ([v17 showsTraffic]) {
    [v3 appendString:@"traffic,"];
  }
  if ([v17 showsTransit]) {
    [v3 appendString:@"transit,"];
  }
  if ([v17 showsBicycling]) {
    [v3 appendString:@"bicycling,"];
  }
  if (([v17 mapType] & 0xFFFFFFFFFFFFFFFELL) == 2) {
    [v3 appendString:@"satellite,"];
  }
  v4 = [(DCMapsURLGenerator *)self queryDictionary];
  v5 = (void *)[v3 copy];
  [v4 setObject:v5 forKey:@"views"];

  if ([v17 zoomLevel])
  {
    v6 = objc_msgSend(NSString, "stringWithFormat:", @"%ld", objc_msgSend(v17, "zoomLevel"));
    [(DCMapsURLGenerator *)self setString:v6 forQueryKey:@"zoom"];
  }
  if ([v17 showsStreetView])
  {
    [(DCMapsURLGenerator *)self setString:@"streetview" forQueryKey:@"mapmode"];
    v7 = [v17 streetViewLocation];
  }
  else
  {
    v8 = [v17 centerLocation];
    v9 = v8;
    if (v8)
    {
      id v10 = v8;
    }
    else
    {
      id v10 = [v17 searchLocation];
    }
    v7 = v10;
  }
  [(DCMapsURLGenerator *)self setString:v7 forQueryKey:@"center"];
  v11 = [(DCGoogleMapsURLGenerator *)self directionsMode];
  [(DCMapsURLGenerator *)self setString:v11 forQueryKey:@"directionsmode"];

  v12 = [v17 destinationAddress];
  [(DCMapsURLGenerator *)self setString:v12 forQueryKey:@"daddr"];

  v13 = [v17 searchQuery];
  [(DCMapsURLGenerator *)self setString:v13 forQueryKey:@"q"];

  v14 = [v17 startAddress];

  if (v14)
  {
    v15 = [(DCMapsURLGenerator *)self queryDictionary];
    v16 = [v17 startAddress];
    [v15 setValue:v16 forKey:@"saddr"];
  }
}

- (id)path
{
  return 0;
}

- (id)host
{
  return 0;
}

- (id)scheme
{
  v2 = @"comgooglemaps";
  return @"comgooglemaps";
}

@end