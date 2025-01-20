@interface MSPRidesharingInformationSource
- (GEOComposedWaypoint)_endWaypoint;
- (GEOComposedWaypoint)_startWaypoint;
- (MSPRidesharingInformationSource)initWithStartWaypoint:(id)a3 endWaypoint:(id)a4;
- (id)ifGEOStorageRouteRequestStorage;
@end

@implementation MSPRidesharingInformationSource

- (MSPRidesharingInformationSource)initWithStartWaypoint:(id)a3 endWaypoint:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v14.receiver = self;
  v14.super_class = (Class)MSPRidesharingInformationSource;
  v8 = [(MSPRidesharingInformationSource *)&v14 init];
  if (v8)
  {
    uint64_t v9 = [v6 copy];
    startWaypoint = v8->_startWaypoint;
    v8->_startWaypoint = (GEOComposedWaypoint *)v9;

    uint64_t v11 = [v7 copy];
    endWaypoint = v8->_endWaypoint;
    v8->_endWaypoint = (GEOComposedWaypoint *)v11;
  }
  return v8;
}

- (id)ifGEOStorageRouteRequestStorage
{
  return 0;
}

- (GEOComposedWaypoint)_startWaypoint
{
  return self->_startWaypoint;
}

- (GEOComposedWaypoint)_endWaypoint
{
  return self->_endWaypoint;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_endWaypoint, 0);

  objc_storeStrong((id *)&self->_startWaypoint, 0);
}

@end