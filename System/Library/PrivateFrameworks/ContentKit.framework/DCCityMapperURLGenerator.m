@interface DCCityMapperURLGenerator
+ (void)generateURLWithMapsLink:(id)a3 completionHandler:(id)a4;
- (NSString)endCoordinate;
- (NSString)startCoordinate;
- (id)host;
- (id)path;
- (id)scheme;
- (void)populateQueryDictionary;
- (void)setEndCoordinate:(id)a3;
- (void)setStartCoordinate:(id)a3;
@end

@implementation DCCityMapperURLGenerator

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_endCoordinate, 0);
  objc_storeStrong((id *)&self->_startCoordinate, 0);
}

- (void)setEndCoordinate:(id)a3
{
}

- (NSString)endCoordinate
{
  return self->_endCoordinate;
}

- (void)setStartCoordinate:(id)a3
{
}

- (NSString)startCoordinate
{
  return self->_startCoordinate;
}

- (void)populateQueryDictionary
{
  id v19 = [(DCMapsURLGenerator *)self queryDictionary];
  v3 = [(DCMapsURLGenerator *)self mapsLink];
  v4 = [(DCCityMapperURLGenerator *)self startCoordinate];
  v5 = v4;
  if (v4)
  {
    id v6 = v4;
  }
  else
  {
    v7 = [v3 centerLocation];
    v8 = v7;
    if (v7)
    {
      id v9 = v7;
    }
    else
    {
      id v9 = [v3 searchLocation];
    }
    id v6 = v9;
  }
  if ([v6 length]) {
    [v19 setObject:v6 forKey:@"startcoord"];
  }
  v10 = [(DCCityMapperURLGenerator *)self endCoordinate];
  uint64_t v11 = [v10 length];

  if (v11)
  {
    v12 = [(DCCityMapperURLGenerator *)self endCoordinate];
    [v19 setObject:v12 forKey:@"endcoord"];
  }
  v13 = [v3 startAddress];
  uint64_t v14 = [v13 length];

  if (v14)
  {
    v15 = [v3 startAddress];
    [v19 setObject:v15 forKey:@"startaddress"];
  }
  v16 = [v3 destinationAddress];
  uint64_t v17 = [v16 length];

  if (v17)
  {
    v18 = [v3 destinationAddress];
    [v19 setObject:v18 forKey:@"endaddress"];
  }
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
  v2 = @"citymapper";
  return @"citymapper";
}

+ (void)generateURLWithMapsLink:(id)a3 completionHandler:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  if (v6)
  {
    v7[0] = MEMORY[0x263EF8330];
    v7[1] = 3221225472;
    v7[2] = __70__DCCityMapperURLGenerator_generateURLWithMapsLink_completionHandler___block_invoke;
    v7[3] = &unk_2642876E0;
    id v8 = v5;
    id v9 = v6;
    [v8 geocodeDirectionsEndpointsWithCompletionHandler:v7];
  }
}

void __70__DCCityMapperURLGenerator_generateURLWithMapsLink_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v23 = a2;
  id v5 = a3;
  id v6 = [(DCMapsURLGenerator *)[DCCityMapperURLGenerator alloc] initWithMapsLink:*(void *)(a1 + 32)];
  if (v23)
  {
    v7 = NSString;
    id v8 = [v23 location];
    [v8 coordinate];
    uint64_t v10 = v9;
    uint64_t v11 = [v23 location];
    [v11 coordinate];
    v13 = objc_msgSend(v7, "stringWithFormat:", @"%f,%f", v10, v12);
    [(DCCityMapperURLGenerator *)v6 setStartCoordinate:v13];
  }
  if (v5)
  {
    uint64_t v14 = NSString;
    v15 = [v5 location];
    [v15 coordinate];
    uint64_t v17 = v16;
    v18 = [v5 location];
    [v18 coordinate];
    v20 = objc_msgSend(v14, "stringWithFormat:", @"%f,%f", v17, v19);
    [(DCCityMapperURLGenerator *)v6 setEndCoordinate:v20];
  }
  uint64_t v21 = *(void *)(a1 + 40);
  v22 = [(DCMapsURLGenerator *)v6 URL];
  (*(void (**)(uint64_t, void *, void))(v21 + 16))(v21, v22, 0);
}

@end