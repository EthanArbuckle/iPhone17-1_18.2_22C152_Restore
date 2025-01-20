@interface GEOSpatialPlaceLookupResult
- (GEOSpatialPlaceLookupResult)init;
- (GEOSpatialPlaceLookupResult)initWithMapItemMap:(id)a3 resultItemMap:(id)a4;
- (id)mapItemsForSpatialLookupParameters:(id)a3;
- (id)resultItemForSpatialLookupParameters:(id)a3;
@end

@implementation GEOSpatialPlaceLookupResult

- (GEOSpatialPlaceLookupResult)initWithMapItemMap:(id)a3 resultItemMap:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)GEOSpatialPlaceLookupResult;
  v9 = [(GEOSpatialPlaceLookupResult *)&v12 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_parametersToMapItemsMap, a3);
    objc_storeStrong((id *)&v10->_parametersToResultItemMap, a4);
  }

  return v10;
}

- (GEOSpatialPlaceLookupResult)init
{
  result = (GEOSpatialPlaceLookupResult *)[MEMORY[0x1E4F1CA00] raise:@"GEOMethodNotAvailableException" format:@"This method is unavailable."];
  __break(1u);
  return result;
}

- (id)mapItemsForSpatialLookupParameters:(id)a3
{
  return [(NSMapTable *)self->_parametersToMapItemsMap objectForKey:a3];
}

- (id)resultItemForSpatialLookupParameters:(id)a3
{
  return [(NSMapTable *)self->_parametersToResultItemMap objectForKey:a3];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_parametersToResultItemMap, 0);

  objc_storeStrong((id *)&self->_parametersToMapItemsMap, 0);
}

@end