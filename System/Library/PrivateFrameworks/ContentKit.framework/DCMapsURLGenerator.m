@interface DCMapsURLGenerator
+ (id)URLWithMapsLink:(id)a3;
- (DCMapsLink)mapsLink;
- (DCMapsURLGenerator)initWithMapsLink:(id)a3;
- (NSMutableDictionary)queryDictionary;
- (id)URL;
- (id)directionsMode;
- (id)host;
- (id)mapType;
- (id)path;
- (id)query;
- (id)scheme;
- (void)populateQueryDictionary;
- (void)setString:(id)a3 forQueryKey:(id)a4;
@end

@implementation DCMapsURLGenerator

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_mapsLink, 0);
  objc_storeStrong((id *)&self->_queryDictionary, 0);
}

- (DCMapsLink)mapsLink
{
  return self->_mapsLink;
}

- (void)setString:(id)a3 forQueryKey:(id)a4
{
  id v8 = a3;
  id v6 = a4;
  if ([v8 length])
  {
    v7 = [(DCMapsURLGenerator *)self queryDictionary];
    [v7 setValue:v8 forKey:v6];
  }
}

- (id)mapType
{
  v3 = [(DCMapsURLGenerator *)self mapsLink];
  char v4 = [v3 showsStreetView];

  if (v4)
  {
    v5 = DCStandardMapsLinkMapTypeHybrid;
LABEL_5:
    id v8 = *v5;
    goto LABEL_7;
  }
  id v6 = [(DCMapsURLGenerator *)self mapsLink];
  uint64_t v7 = [v6 mapType];

  if ((unint64_t)(v7 - 1) <= 2)
  {
    v5 = off_264286168[v7 - 1];
    goto LABEL_5;
  }
  id v8 = 0;
LABEL_7:
  return v8;
}

- (id)directionsMode
{
  v2 = [(DCMapsURLGenerator *)self mapsLink];
  uint64_t v3 = [v2 directionsMode];

  if ((unint64_t)(v3 - 1) > 4) {
    char v4 = 0;
  }
  else {
    char v4 = *off_264286140[v3 - 1];
  }
  return v4;
}

- (void)populateQueryDictionary
{
  id v12 = [(DCMapsURLGenerator *)self mapsLink];
  uint64_t v3 = [v12 searchQuery];
  [(DCMapsURLGenerator *)self setString:v3 forQueryKey:@"q"];

  char v4 = [v12 searchNearQuery];
  [(DCMapsURLGenerator *)self setString:v4 forQueryKey:@"near"];

  v5 = [v12 searchLocation];
  [(DCMapsURLGenerator *)self setString:v5 forQueryKey:@"sll"];

  id v6 = [v12 startAddress];
  [(DCMapsURLGenerator *)self setString:v6 forQueryKey:@"saddr"];

  uint64_t v7 = [v12 destinationAddress];
  [(DCMapsURLGenerator *)self setString:v7 forQueryKey:@"daddr"];

  id v8 = [(DCMapsURLGenerator *)self directionsMode];
  [(DCMapsURLGenerator *)self setString:v8 forQueryKey:@"dirflg"];

  v9 = [v12 centerLocation];
  [(DCMapsURLGenerator *)self setString:v9 forQueryKey:@"ll"];

  v10 = [(DCMapsURLGenerator *)self mapType];
  [(DCMapsURLGenerator *)self setString:v10 forQueryKey:@"t"];

  if ([v12 zoomLevel])
  {
    v11 = objc_msgSend(NSString, "stringWithFormat:", @"%ld", objc_msgSend(v12, "zoomLevel"));
    [(DCMapsURLGenerator *)self setString:v11 forQueryKey:@"z"];
  }
  if ([v12 showsTraffic]) {
    [(DCMapsURLGenerator *)self setString:@"t" forQueryKey:@"layer"];
  }
}

- (NSMutableDictionary)queryDictionary
{
  queryDictionary = self->_queryDictionary;
  if (!queryDictionary)
  {
    char v4 = (NSMutableDictionary *)objc_opt_new();
    v5 = self->_queryDictionary;
    self->_queryDictionary = v4;

    [(DCMapsURLGenerator *)self populateQueryDictionary];
    queryDictionary = self->_queryDictionary;
  }
  return queryDictionary;
}

- (id)URL
{
  uint64_t v3 = [(DCMapsURLGenerator *)self queryDictionary];
  uint64_t v4 = [v3 count];

  if (v4)
  {
    v7.receiver = self;
    v7.super_class = (Class)DCMapsURLGenerator;
    v5 = [(DCURLGenerator *)&v7 URL];
  }
  else
  {
    v5 = 0;
  }
  return v5;
}

- (id)query
{
  v2 = NSURL;
  uint64_t v3 = [(DCMapsURLGenerator *)self queryDictionary];
  uint64_t v4 = objc_msgSend(v2, "dc_queryStringWithQueryDictionary:", v3);

  return v4;
}

- (id)path
{
  return @"/";
}

- (id)host
{
  return @"maps.apple.com";
}

- (id)scheme
{
  return @"https";
}

- (DCMapsURLGenerator)initWithMapsLink:(id)a3
{
  id v5 = a3;
  id v6 = [(DCMapsURLGenerator *)self init];
  objc_super v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_mapsLink, a3);
    id v8 = v7;
  }

  return v7;
}

+ (id)URLWithMapsLink:(id)a3
{
  id v4 = a3;
  id v5 = (void *)[objc_alloc((Class)a1) initWithMapsLink:v4];

  id v6 = [v5 URL];

  return v6;
}

@end