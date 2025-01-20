@interface DCStandardMapsLink
+ (BOOL)isMapsURL:(id)a3;
+ (BOOL)isStandardAppleMapsURL:(id)a3;
+ (BOOL)isStandardGoogleMapsURL:(id)a3;
+ (id)mapsLinkWithURL:(id)a3;
- (BOOL)showsBicycling;
- (BOOL)showsStreetView;
- (BOOL)showsTraffic;
- (BOOL)showsTransit;
- (DCStandardMapsLink)initWithURL:(id)a3;
- (NSDictionary)queryDictionary;
- (NSURL)URL;
- (id)centerLocation;
- (id)destinationAddress;
- (id)searchLocation;
- (id)searchNearQuery;
- (id)searchQuery;
- (id)startAddress;
- (id)streetViewLocation;
- (int64_t)zoomLevel;
- (unint64_t)directionsMode;
- (unint64_t)mapType;
- (void)setQueryDictionary:(id)a3;
- (void)setURL:(id)a3;
@end

@implementation DCStandardMapsLink

+ (id)mapsLinkWithURL:(id)a3
{
  id v4 = a3;
  if ([a1 isMapsURL:v4]) {
    v5 = (void *)[objc_alloc((Class)a1) initWithURL:v4];
  }
  else {
    v5 = 0;
  }

  return v5;
}

+ (BOOL)isMapsURL:(id)a3
{
  id v4 = a3;
  if ([a1 isStandardAppleMapsURL:v4]) {
    char v5 = 1;
  }
  else {
    char v5 = [a1 isStandardGoogleMapsURL:v4];
  }

  return v5;
}

+ (BOOL)isStandardGoogleMapsURL:(id)a3
{
  id v3 = a3;
  id v4 = [v3 query];
  uint64_t v5 = [v4 length];

  if (v5)
  {
    v6 = [v3 host];
    v7 = [v6 componentsSeparatedByString:@"."];

    if ((unint64_t)([v7 count] - 5) >= 0xFFFFFFFFFFFFFFFDLL)
    {
      v9 = [v7 objectAtIndex:0];
      v10 = [v7 objectAtIndex:1];
      BOOL v8 = 1;
      if (![v9 isEqualToString:@"maps"]
        || ([v10 isEqualToString:@"google"] & 1) == 0)
      {
        v11 = [v3 path];
        int v12 = [v11 hasPrefix:@"/maps"];

        if (!v12
          || ([v9 isEqualToString:@"google"] & 1) == 0
          && (![v9 isEqualToString:@"www"]
           || ([v10 isEqualToString:@"google"] & 1) == 0))
        {
          BOOL v8 = 0;
        }
      }
    }
    else
    {
      BOOL v8 = 0;
    }
  }
  else
  {
    BOOL v8 = 0;
  }

  return v8;
}

+ (BOOL)isStandardAppleMapsURL:(id)a3
{
  id v3 = a3;
  id v4 = [v3 host];
  if ([v4 isEqualToString:@"maps.apple.com"])
  {
    uint64_t v5 = [v3 pathComponents];
    if ((unint64_t)[v5 count] > 2)
    {
      BOOL v7 = 0;
    }
    else
    {
      v6 = [v3 query];
      BOOL v7 = [v6 length] != 0;
    }
  }
  else
  {
    BOOL v7 = 0;
  }

  return v7;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queryDictionary, 0);
  objc_storeStrong((id *)&self->_URL, 0);
}

- (void)setQueryDictionary:(id)a3
{
}

- (void)setURL:(id)a3
{
}

- (NSURL)URL
{
  return self->_URL;
}

- (NSDictionary)queryDictionary
{
  queryDictionary = self->_queryDictionary;
  if (!queryDictionary)
  {
    id v4 = [(DCStandardMapsLink *)self URL];
    objc_msgSend(v4, "dc_queryDictionary");
    uint64_t v5 = (NSDictionary *)objc_claimAutoreleasedReturnValue();
    v6 = self->_queryDictionary;
    self->_queryDictionary = v5;

    queryDictionary = self->_queryDictionary;
  }
  return queryDictionary;
}

- (id)streetViewLocation
{
  v2 = [(DCStandardMapsLink *)self queryDictionary];
  id v3 = [v2 objectForKey:@"cbll"];

  return v3;
}

- (BOOL)showsBicycling
{
  return 0;
}

- (BOOL)showsStreetView
{
  v2 = [(DCStandardMapsLink *)self queryDictionary];
  id v3 = [v2 objectForKey:@"cbp"];
  BOOL v4 = v3 != 0;

  return v4;
}

- (BOOL)showsTransit
{
  v2 = [(DCStandardMapsLink *)self queryDictionary];
  id v3 = [v2 objectForKey:@"lci"];
  BOOL v4 = [v3 componentsSeparatedByString:@","];

  LOBYTE(v2) = [v4 containsObject:@"transit"];
  return (char)v2;
}

- (BOOL)showsTraffic
{
  v2 = [(DCStandardMapsLink *)self queryDictionary];
  id v3 = [v2 objectForKey:@"layer"];
  BOOL v4 = [v3 componentsSeparatedByString:@","];

  LOBYTE(v2) = [v4 containsObject:@"t"];
  return (char)v2;
}

- (unint64_t)mapType
{
  v2 = [(DCStandardMapsLink *)self queryDictionary];
  id v3 = [v2 objectForKey:@"t"];

  if ([v3 isEqualToString:@"m"])
  {
    unint64_t v4 = 1;
  }
  else if ([v3 isEqualToString:@"h"])
  {
    unint64_t v4 = 3;
  }
  else if (([v3 isEqualToString:@"k"] & 1) != 0 {
         || ([v3 isEqualToString:@"p"] & 1) != 0)
  }
  {
    unint64_t v4 = 2;
  }
  else if ([v3 isEqualToString:@"e"])
  {
    unint64_t v4 = 2;
  }
  else
  {
    unint64_t v4 = 0;
  }

  return v4;
}

- (int64_t)zoomLevel
{
  v2 = [(DCStandardMapsLink *)self queryDictionary];
  id v3 = [v2 objectForKey:@"z"];
  int64_t v4 = [v3 integerValue];

  return v4;
}

- (id)centerLocation
{
  v2 = [(DCStandardMapsLink *)self queryDictionary];
  id v3 = [v2 objectForKey:@"ll"];

  return v3;
}

- (unint64_t)directionsMode
{
  v2 = [(DCStandardMapsLink *)self queryDictionary];
  id v3 = [v2 objectForKey:@"dirflg"];

  if ([v3 isEqualToString:@"d"])
  {
    unint64_t v4 = 1;
  }
  else if ([v3 isEqualToString:@"w"])
  {
    unint64_t v4 = 3;
  }
  else if ([v3 isEqualToString:@"r"])
  {
    unint64_t v4 = 4;
  }
  else if ([v3 isEqualToString:@"b"])
  {
    unint64_t v4 = 2;
  }
  else if ([v3 isEqualToString:@"f"])
  {
    unint64_t v4 = 5;
  }
  else
  {
    unint64_t v4 = 0;
  }

  return v4;
}

- (id)destinationAddress
{
  v2 = [(DCStandardMapsLink *)self queryDictionary];
  id v3 = [v2 objectForKey:@"daddr"];

  return v3;
}

- (id)startAddress
{
  v2 = [(DCStandardMapsLink *)self queryDictionary];
  id v3 = [v2 objectForKey:@"saddr"];

  return v3;
}

- (id)searchLocation
{
  v2 = [(DCStandardMapsLink *)self queryDictionary];
  id v3 = [v2 objectForKey:@"sll"];

  return v3;
}

- (id)searchNearQuery
{
  v2 = [(DCStandardMapsLink *)self queryDictionary];
  id v3 = [v2 objectForKey:@"near"];

  return v3;
}

- (id)searchQuery
{
  id v3 = [(DCStandardMapsLink *)self queryDictionary];
  unint64_t v4 = [v3 objectForKey:@"q"];
  uint64_t v5 = v4;
  if (v4)
  {
    id v6 = v4;
  }
  else
  {
    BOOL v7 = [(DCStandardMapsLink *)self queryDictionary];
    id v6 = [v7 objectForKey:@"address"];
  }
  return v6;
}

- (DCStandardMapsLink)initWithURL:(id)a3
{
  id v5 = a3;
  id v6 = [(DCStandardMapsLink *)self init];
  BOOL v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_URL, a3);
    BOOL v8 = v7;
  }

  return v7;
}

@end