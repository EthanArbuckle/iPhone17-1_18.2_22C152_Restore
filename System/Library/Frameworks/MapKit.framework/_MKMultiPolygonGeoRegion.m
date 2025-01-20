@interface _MKMultiPolygonGeoRegion
- (BOOL)_loadWithJSONObject:(id)a3 error:(id *)a4;
- (BOOL)_loadWithRootJSONObject:(id)a3 error:(id *)a4;
- (BOOL)coordinateLiesInRegion:(CLLocationCoordinate2D)a3;
- (NSArray)polygons;
- (_MKMultiPolygonGeoRegion)initWithContentsOfFile:(id)a3 error:(id *)a4;
- (_MKMultiPolygonGeoRegion)initWithJSONObject:(id)a3 error:(id *)a4;
- (void)setPolygons:(id)a3;
@end

@implementation _MKMultiPolygonGeoRegion

- (_MKMultiPolygonGeoRegion)initWithContentsOfFile:(id)a3 error:(id *)a4
{
  id v6 = a3;
  v13.receiver = self;
  v13.super_class = (Class)_MKMultiPolygonGeoRegion;
  v7 = [(_MKMultiPolygonGeoRegion *)&v13 init];
  if (!v7) {
    goto LABEL_6;
  }
  uint64_t v8 = [objc_alloc(MEMORY[0x1E4F1C9B8]) initWithContentsOfFile:v6 options:0 error:a4];
  if (!v8)
  {
LABEL_8:
    v11 = 0;
    goto LABEL_9;
  }
  v9 = (void *)v8;
  v10 = [MEMORY[0x1E4F28D90] JSONObjectWithData:v8 options:0 error:a4];
  if (!v10
    || ![(_MKMultiPolygonGeoRegion *)v7 _loadWithRootJSONObject:v10 error:a4])
  {

    goto LABEL_8;
  }

LABEL_6:
  v11 = v7;
LABEL_9:

  return v11;
}

- (_MKMultiPolygonGeoRegion)initWithJSONObject:(id)a3 error:(id *)a4
{
  id v6 = a3;
  v10.receiver = self;
  v10.super_class = (Class)_MKMultiPolygonGeoRegion;
  v7 = [(_MKMultiPolygonGeoRegion *)&v10 init];
  uint64_t v8 = v7;
  if (v7) {
    [(_MKMultiPolygonGeoRegion *)v7 _loadWithJSONObject:v6 error:a4];
  }

  return v8;
}

- (BOOL)coordinateLiesInRegion:(CLLocationCoordinate2D)a3
{
  double longitude = a3.longitude;
  double latitude = a3.latitude;
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  v5 = self->_polygons;
  uint64_t v6 = [(NSArray *)v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v6)
  {
    uint64_t v7 = *(void *)v11;
    while (2)
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v11 != v7) {
          objc_enumerationMutation(v5);
        }
        if (objc_msgSend(*(id *)(*((void *)&v10 + 1) + 8 * i), "coordinateLiesInRegion:", latitude, longitude, (void)v10))
        {
          LOBYTE(v6) = 1;
          goto LABEL_11;
        }
      }
      uint64_t v6 = [(NSArray *)v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
      if (v6) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return v6;
}

- (BOOL)_loadWithRootJSONObject:(id)a3 error:(id *)a4
{
  id v6 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v7 = v6;
    uint64_t v8 = [v7 objectForKey:@"type"];
    char v9 = [v8 isEqual:@"MultiPolygon"];

    if (v9)
    {
      long long v10 = [v7 objectForKey:@"coordinates"];
      BOOL v11 = [(_MKMultiPolygonGeoRegion *)self _loadWithJSONObject:v10 error:a4];
    }
    else
    {
      if (!a4)
      {
        BOOL v11 = 0;
        goto LABEL_9;
      }
      long long v10 = [NSString stringWithFormat:@"Expected MultiPolygon as the root type."];
      long long v12 = [MEMORY[0x1E4F1C9E8] dictionaryWithObject:v10 forKey:@"ParseError"];
      *a4 = [MEMORY[0x1E4F28C58] errorWithDomain:@"Maps" code:0 userInfo:v12];

      BOOL v11 = 0;
    }
  }
  else
  {
    if (!a4)
    {
      BOOL v11 = 0;
      goto LABEL_10;
    }
    id v7 = [NSString stringWithFormat:@"Expected JSON root object to be NSDictionary"];
    long long v10 = [MEMORY[0x1E4F1C9E8] dictionaryWithObject:v7 forKey:@"ParseError"];
    [MEMORY[0x1E4F28C58] errorWithDomain:@"Maps" code:0 userInfo:v10];
    BOOL v11 = 0;
    *a4 = (id)objc_claimAutoreleasedReturnValue();
  }

LABEL_9:
LABEL_10:

  return v11;
}

- (BOOL)_loadWithJSONObject:(id)a3 error:(id *)a4
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v7 = v6;
    uint64_t v8 = [v7 count];
    if ((unint64_t)(v8 - 1) >= 0x32)
    {
      if (a4)
      {
        v19 = objc_msgSend(NSString, "stringWithFormat:", @"Invalid number of polygons: %lu. Expected between %lu and %lu.", v8, 1, 50);
        v20 = [MEMORY[0x1E4F1C9E8] dictionaryWithObject:v19 forKey:@"ParseError"];
        *a4 = [MEMORY[0x1E4F28C58] errorWithDomain:@"Maps" code:0 userInfo:v20];

        LOBYTE(a4) = 0;
      }
    }
    else
    {
      v22 = self;
      char v9 = (void *)[objc_alloc(MEMORY[0x1E4F1CA48]) initWithCapacity:v8];
      long long v23 = 0u;
      long long v24 = 0u;
      long long v25 = 0u;
      long long v26 = 0u;
      id v10 = v7;
      uint64_t v11 = [v10 countByEnumeratingWithState:&v23 objects:v27 count:16];
      if (v11)
      {
        uint64_t v12 = v11;
        uint64_t v13 = *(void *)v24;
        while (2)
        {
          for (uint64_t i = 0; i != v12; ++i)
          {
            if (*(void *)v24 != v13) {
              objc_enumerationMutation(v10);
            }
            uint64_t v15 = [[_MKPolygonGeoRegion alloc] initWithJSONObject:*(void *)(*((void *)&v23 + 1) + 8 * i) error:a4];
            if (!v15)
            {

              LOBYTE(a4) = 0;
              goto LABEL_17;
            }
            v16 = v15;
            [v9 addObject:v15];
          }
          uint64_t v12 = [v10 countByEnumeratingWithState:&v23 objects:v27 count:16];
          if (v12) {
            continue;
          }
          break;
        }
      }

      [(_MKMultiPolygonGeoRegion *)v22 setPolygons:v9];
      LOBYTE(a4) = 1;
LABEL_17:
    }
  }
  else if (a4)
  {
    v17 = [NSString stringWithFormat:@"Expected an array in the coordinates field."];
    v18 = [MEMORY[0x1E4F1C9E8] dictionaryWithObject:v17 forKey:@"ParseError"];
    *a4 = [MEMORY[0x1E4F28C58] errorWithDomain:@"Maps" code:0 userInfo:v18];

    LOBYTE(a4) = 0;
  }

  return (char)a4;
}

- (NSArray)polygons
{
  return self->_polygons;
}

- (void)setPolygons:(id)a3
{
}

- (void).cxx_destruct
{
}

@end