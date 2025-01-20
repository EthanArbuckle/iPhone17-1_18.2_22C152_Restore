@interface DCTransitURLGenerator
- (id)host;
- (id)path;
- (id)scheme;
- (void)populateQueryDictionary;
@end

@implementation DCTransitURLGenerator

- (void)populateQueryDictionary
{
  id v6 = [(DCMapsURLGenerator *)self queryDictionary];
  v3 = [(DCMapsURLGenerator *)self mapsLink];
  id v4 = [v3 destinationAddress];
  if (!v4)
  {
    id v4 = [v3 centerLocation];
    if (!v4)
    {
      v5 = [v3 searchQuery];
      if (v5)
      {
        id v4 = v5;
      }
      else
      {
        id v4 = [v3 searchLocation];
        if (!v4) {
          goto LABEL_7;
        }
      }
    }
  }
  [v6 setObject:v4 forKey:@"to"];

LABEL_7:
}

- (id)path
{
  return 0;
}

- (id)host
{
  return @"directions";
}

- (id)scheme
{
  v2 = @"transit";
  return @"transit";
}

@end