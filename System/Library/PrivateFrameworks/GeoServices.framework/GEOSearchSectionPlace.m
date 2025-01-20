@interface GEOSearchSectionPlace
- (GEOSearchSectionPlace)init;
- (GEOSearchSectionPlace)initWithMapItemIds:(id)a3;
- (GEOSearchSectionPlace)initWithSearchSectionPlace:(id)a3;
- (NSArray)mapItemIds;
@end

@implementation GEOSearchSectionPlace

- (GEOSearchSectionPlace)init
{
  result = (GEOSearchSectionPlace *)[MEMORY[0x1E4F1CA00] raise:@"GEOMethodNotAvailableException" format:@"This method is unavailable."];
  __break(1u);
  return result;
}

- (GEOSearchSectionPlace)initWithMapItemIds:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)GEOSearchSectionPlace;
  v5 = [(GEOSearchSectionPlace *)&v9 init];
  if (v5)
  {
    uint64_t v6 = [v4 copy];
    mapItemIds = v5->_mapItemIds;
    v5->_mapItemIds = (NSArray *)v6;
  }
  return v5;
}

- (GEOSearchSectionPlace)initWithSearchSectionPlace:(id)a3
{
  id v4 = -[GEOPDSearchSectionPlace placeIds]((id *)a3);
  v5 = +[GEOMapItemIdentifier mapItemIdentifiersFromMapsIdentifiers:v4];
  uint64_t v6 = [(GEOSearchSectionPlace *)self initWithMapItemIds:v5];

  return v6;
}

- (NSArray)mapItemIds
{
  return self->_mapItemIds;
}

- (void).cxx_destruct
{
}

@end