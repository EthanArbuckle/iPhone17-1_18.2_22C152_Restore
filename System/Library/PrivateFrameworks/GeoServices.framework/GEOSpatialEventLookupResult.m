@interface GEOSpatialEventLookupResult
- (GEOSpatialEventLookupResult)init;
- (GEOSpatialEventLookupResult)initWithMapTable:(id)a3;
- (id)poiEventsForSpatialLookupParameters:(id)a3;
@end

@implementation GEOSpatialEventLookupResult

- (GEOSpatialEventLookupResult)initWithMapTable:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)GEOSpatialEventLookupResult;
  v6 = [(GEOSpatialEventLookupResult *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_parametersToEventsMap, a3);
  }

  return v7;
}

- (GEOSpatialEventLookupResult)init
{
  result = (GEOSpatialEventLookupResult *)[MEMORY[0x1E4F1CA00] raise:@"GEOMethodNotAvailableException" format:@"This method is unavailable."];
  __break(1u);
  return result;
}

- (id)poiEventsForSpatialLookupParameters:(id)a3
{
  return [(NSMapTable *)self->_parametersToEventsMap objectForKey:a3];
}

- (void).cxx_destruct
{
}

@end