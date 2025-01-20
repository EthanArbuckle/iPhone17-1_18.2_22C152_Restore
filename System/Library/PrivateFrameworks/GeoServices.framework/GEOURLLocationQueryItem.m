@interface GEOURLLocationQueryItem
+ (id)locationQueryItemsWithArray:(id)a3;
+ (id)locationQueryItemsWithValue:(id)a3;
+ (id)serializedJsonStringFromLocationQueryItems:(id)a3;
- ($F24F406B2B787EFB06265DBA3D28CBD5)coordinate;
- (GEOMapItemIdentifier)mapItemIdentifier;
- (GEOURLLocationQueryItem)init;
- (GEOURLLocationQueryItem)initWithDictionary:(id)a3;
- (GEOURLLocationQueryItem)initWithQueryItemValue:(id)a3;
- (NSString)address;
- (NSString)name;
- (NSString)resolvedLocation;
- (id)_dictionaryRepresentation;
- (void)setAddress:(id)a3;
- (void)setCoordinate:(id)a3;
- (void)setMapItemIdentifier:(id)a3;
- (void)setName:(id)a3;
@end

@implementation GEOURLLocationQueryItem

- (GEOURLLocationQueryItem)init
{
  v3.receiver = self;
  v3.super_class = (Class)GEOURLLocationQueryItem;
  result = [(GEOURLLocationQueryItem *)&v3 init];
  if (result) {
    result->_coordinate = ($AB5116BA7E623E054F959CECB034F4E7)kGEOLocationCoordinate2DInvalid_0;
  }
  return result;
}

- (GEOURLLocationQueryItem)initWithQueryItemValue:(id)a3
{
  v4 = (GEOMapItemIdentifier *)a3;
  v5 = [(GEOURLLocationQueryItem *)self init];
  if (v5 && [(GEOMapItemIdentifier *)v4 length])
  {
    v6 = [(GEOMapItemIdentifier *)v4 componentsSeparatedByString:@","];
    if ([v6 count] != 2) {
      goto LABEL_9;
    }
    v7 = [v6 objectAtIndexedSubscript:0];
    [v7 doubleValue];
    double v9 = v8;

    v10 = [v6 objectAtIndexedSubscript:1];
    [v10 doubleValue];
    double v12 = v11;

    if (v12 < -180.0) {
      goto LABEL_9;
    }
    if (v12 <= 180.0 && v9 >= -90.0 && v9 <= 90.0)
    {
      v5->_coordinate.latitude = v9;
      v5->_coordinate.longitude = v12;
    }
    else
    {
LABEL_9:
      v13 = [[GEOMapItemIdentifier alloc] initWithMapsIdentifierString:v4];
      BOOL v14 = [(GEOMapItemIdentifier *)v13 isValid];
      if (v14) {
        uint64_t v15 = 8;
      }
      else {
        uint64_t v15 = 16;
      }
      if (v14) {
        v16 = v13;
      }
      else {
        v16 = v4;
      }
      v17 = v16;
      v18 = *(Class *)((char *)&v5->super.isa + v15);
      *(Class *)((char *)&v5->super.isa + v15) = v17;
    }
  }

  return v5;
}

+ (id)locationQueryItemsWithValue:(id)a3
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  v4 = [a3 stringByRemovingPercentEncoding];
  v5 = [v4 dataUsingEncoding:4];
  id v26 = 0;
  v6 = [MEMORY[0x1E4F28D90] JSONObjectWithData:v5 options:0 error:&v26];
  id v7 = v26;
  if (v7) {
    BOOL v8 = 1;
  }
  else {
    BOOL v8 = v6 == 0;
  }
  if (v8)
  {
    double v9 = (void *)MEMORY[0x1E4F1CBF0];
    goto LABEL_25;
  }
  v10 = [MEMORY[0x1E4F1CA48] array];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();
  if (isKindOfClass)
  {
    long long v24 = 0u;
    long long v25 = 0u;
    long long v22 = 0u;
    long long v23 = 0u;
    id v12 = v6;
    uint64_t v13 = [v12 countByEnumeratingWithState:&v22 objects:v27 count:16];
    if (v13)
    {
      uint64_t v14 = v13;
      v20 = v5;
      v21 = v4;
      uint64_t v15 = *(void *)v23;
      do
      {
        for (uint64_t i = 0; i != v14; ++i)
        {
          if (*(void *)v23 != v15) {
            objc_enumerationMutation(v12);
          }
          uint64_t v17 = *(void *)(*((void *)&v22 + 1) + 8 * i);
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            v18 = (void *)[objc_alloc((Class)a1) initWithDictionary:v17];
            if (v18) {
              [v10 addObject:v18];
            }
          }
        }
        uint64_t v14 = [v12 countByEnumeratingWithState:&v22 objects:v27 count:16];
      }
      while (v14);
      v5 = v20;
    }
LABEL_23:

    goto LABEL_24;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v12 = (id)[objc_alloc((Class)a1) initWithDictionary:v6];
    if (v12) {
      [v10 addObject:v12];
    }
    goto LABEL_23;
  }
LABEL_24:
  double v9 = objc_msgSend(v10, "copy", v20, v21, (void)v22);

LABEL_25:

  return v9;
}

+ (id)locationQueryItemsWithArray:(id)a3
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  v4 = [MEMORY[0x1E4F1CA48] array];
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v5 = v3;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v16;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v16 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = *(void *)(*((void *)&v15 + 1) + 8 * i);
        double v11 = [GEOURLLocationQueryItem alloc];
        id v12 = -[GEOURLLocationQueryItem initWithQueryItemValue:](v11, "initWithQueryItemValue:", v10, (void)v15);
        [v4 addObject:v12];
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v7);
  }

  uint64_t v13 = (void *)[v4 copy];

  return v13;
}

- (GEOURLLocationQueryItem)initWithDictionary:(id)a3
{
  id v4 = a3;
  id v5 = [(GEOURLLocationQueryItem *)self init];
  if (v5)
  {
    uint64_t v6 = [v4 objectForKeyedSubscript:@"place-id"];
    uint64_t v7 = [v4 objectForKeyedSubscript:@"address"];
    uint64_t v8 = [v4 objectForKeyedSubscript:@"coordinate"];
    double v9 = [[GEOMapItemIdentifier alloc] initWithMapsIdentifierString:v6];
    if ([(GEOMapItemIdentifier *)v9 isValid]) {
      objc_storeStrong((id *)&v5->_mapItemIdentifier, v9);
    }
    if ([v7 length]) {
      objc_storeStrong((id *)&v5->_address, v7);
    }
    uint64_t v10 = [v8 componentsSeparatedByString:@","];
    if ([v10 count] == 2)
    {
      double v11 = [v10 objectAtIndexedSubscript:0];
      [v11 doubleValue];
      double v13 = v12;

      uint64_t v14 = [v10 objectAtIndexedSubscript:1];
      [v14 doubleValue];
      double v16 = v15;

      if (v16 >= -180.0 && v16 <= 180.0 && v13 >= -90.0 && v13 <= 90.0)
      {
        v5->_coordinate.latitude = v13;
        v5->_coordinate.longitude = v16;
      }
    }
  }
  return v5;
}

- (NSString)resolvedLocation
{
  mapItemIdentifier = self->_mapItemIdentifier;
  if (mapItemIdentifier)
  {
    id v4 = [(GEOMapItemIdentifier *)mapItemIdentifier mapsIdentifierString];
  }
  else
  {
    address = self->_address;
    if (address)
    {
      id v4 = address;
    }
    else
    {
      id v4 = 0;
      double longitude = self->_coordinate.longitude;
      if (longitude >= -180.0 && longitude <= 180.0)
      {
        double latitude = self->_coordinate.latitude;
        if (latitude >= -90.0 && latitude <= 90.0)
        {
          objc_msgSend(NSString, "stringWithFormat:", @"%f,%f", *(void *)&latitude, *(void *)&longitude);
          id v4 = (NSString *)objc_claimAutoreleasedReturnValue();
        }
      }
    }
  }

  return v4;
}

- (id)_dictionaryRepresentation
{
  id v3 = (void *)[objc_alloc(MEMORY[0x1E4F1CA60]) initWithCapacity:3];
  if ([(GEOMapItemIdentifier *)self->_mapItemIdentifier hasMapsIdentifierString])
  {
    id v4 = [(GEOMapItemIdentifier *)self->_mapItemIdentifier mapsIdentifierString];
    [v3 setObject:v4 forKeyedSubscript:@"place-id"];
  }
  if ([(NSString *)self->_address length]) {
    [v3 setObject:self->_address forKeyedSubscript:@"address"];
  }
  double longitude = self->_coordinate.longitude;
  if (longitude >= -180.0 && longitude <= 180.0)
  {
    double latitude = self->_coordinate.latitude;
    if (latitude >= -90.0 && latitude <= 90.0)
    {
      uint64_t v7 = objc_msgSend(NSString, "stringWithFormat:", @"%f,%f", *(void *)&self->_coordinate.latitude, *(void *)&longitude);
      [v3 setObject:v7 forKeyedSubscript:@"coordinate"];
    }
  }

  return v3;
}

+ (id)serializedJsonStringFromLocationQueryItems:(id)a3
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  if ([v3 count] == 1)
  {
    id v4 = [v3 firstObject];
    id v5 = [v4 _dictionaryRepresentation];
  }
  else
  {
    id v5 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    long long v15 = 0u;
    long long v16 = 0u;
    long long v17 = 0u;
    long long v18 = 0u;
    id v4 = v3;
    uint64_t v6 = [v4 countByEnumeratingWithState:&v15 objects:v19 count:16];
    if (v6)
    {
      uint64_t v7 = v6;
      uint64_t v8 = *(void *)v16;
      do
      {
        for (uint64_t i = 0; i != v7; ++i)
        {
          if (*(void *)v16 != v8) {
            objc_enumerationMutation(v4);
          }
          uint64_t v10 = [*(id *)(*((void *)&v15 + 1) + 8 * i) _dictionaryRepresentation];
          [v5 addObject:v10];
        }
        uint64_t v7 = [v4 countByEnumeratingWithState:&v15 objects:v19 count:16];
      }
      while (v7);
    }
  }

  uint64_t v14 = 0;
  double v11 = [MEMORY[0x1E4F28D90] dataWithJSONObject:v5 options:0 error:&v14];
  double v12 = 0;
  if (!v14) {
    double v12 = (void *)[[NSString alloc] initWithData:v11 encoding:4];
  }

  return v12;
}

- ($F24F406B2B787EFB06265DBA3D28CBD5)coordinate
{
  double latitude = self->_coordinate.latitude;
  double longitude = self->_coordinate.longitude;
  result.var1 = longitude;
  result.var0 = latitude;
  return result;
}

- (void)setCoordinate:(id)a3
{
  self->_coordinate = ($AB5116BA7E623E054F959CECB034F4E7)a3;
}

- (GEOMapItemIdentifier)mapItemIdentifier
{
  return self->_mapItemIdentifier;
}

- (void)setMapItemIdentifier:(id)a3
{
}

- (NSString)address
{
  return self->_address;
}

- (void)setAddress:(id)a3
{
}

- (NSString)name
{
  return self->_name;
}

- (void)setName:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_address, 0);

  objc_storeStrong((id *)&self->_mapItemIdentifier, 0);
}

@end