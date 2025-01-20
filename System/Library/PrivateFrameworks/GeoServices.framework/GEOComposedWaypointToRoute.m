@interface GEOComposedWaypointToRoute
+ (BOOL)supportsSecureCoding;
- (GEOComposedRoute)route;
- (GEOComposedWaypointToRoute)initWithCoder:(id)a3;
- (GEOComposedWaypointToRoute)initWithDictionary:(id)a3;
- (GEOComposedWaypointToRoute)initWithRoute:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)dictionaryRepresentation;
- (id)geoWaypointTyped;
- (id)name;
- (void)encodeWithCoder:(id)a3;
@end

@implementation GEOComposedWaypointToRoute

- (GEOComposedWaypointToRoute)initWithRoute:(id)a3
{
  id v5 = a3;
  v14.receiver = self;
  v14.super_class = (Class)GEOComposedWaypointToRoute;
  v6 = [(GEOComposedWaypoint *)&v14 init];
  if (v6)
  {
    v7 = [v5 origin];
    v8 = objc_msgSend(MEMORY[0x1E4F29128], "_geo_dataForUUID");
    [(GEOComposedWaypoint *)v6 setUniqueWaypointID:v8];

    -[GEOComposedWaypoint setType:](v6, "setType:", [v7 type]);
    v9 = [v7 mapItemStorage];
    [(GEOComposedWaypoint *)v6 setMapItemStorage:v9];

    v10 = [v7 location];
    [(GEOComposedWaypoint *)v6 setLocation:v10];

    v11 = [v7 latLng];
    [(GEOComposedWaypoint *)v6 setLatLng:v11];

    objc_storeStrong((id *)&v6->_route, a3);
    v12 = v6;
  }
  return v6;
}

- (id)name
{
  v3 = [(GEOComposedWaypointToRoute *)self route];
  v4 = [v3 userProvidedName];
  uint64_t v5 = [v4 length];

  if (v5)
  {
    uint64_t v6 = [v3 userProvidedName];
  }
  else
  {
    v7 = [v3 name];
    uint64_t v8 = [v7 length];

    if (v8)
    {
      uint64_t v6 = [v3 name];
    }
    else
    {
      v11.receiver = self;
      v11.super_class = (Class)GEOComposedWaypointToRoute;
      uint64_t v6 = [(GEOComposedWaypoint *)&v11 name];
    }
  }
  v9 = (void *)v6;

  return v9;
}

- (id)geoWaypointTyped
{
  v20.receiver = self;
  v20.super_class = (Class)GEOComposedWaypointToRoute;
  v3 = [(GEOComposedWaypoint *)&v20 geoWaypointTyped];
  v4 = [(GEOComposedRoute *)self->_route tourIdentifier];

  if (v4)
  {
    [v3 setWaypointType:2];
    [v3 setWaypointLocation:0];
    [v3 setWaypointPlace:0];
    uint64_t v5 = objc_opt_new();
    uint64_t v6 = [(GEOComposedRoute *)self->_route tourIdentifier];
    objc_msgSend(v5, "setMuid:", objc_msgSend(v6, "muid"));

    v7 = [(GEOComposedRoute *)self->_route name];
    [v5 setPlaceNameHint:v7];

    uint64_t v8 = [(GEOComposedRoute *)self->_route origin];
    v9 = [v8 geoMapItem];

    v10 = [v9 geoAddress];
    if ([v10 hasStructuredAddress])
    {
      objc_super v11 = [v10 structuredAddress];
      [v5 setAddressHint:v11];
    }
    if ([v10 formattedAddressLinesCount])
    {
      v12 = [v10 formattedAddressLines];
      [v5 setFormattedAddressLineHints:v12];
    }
    unsigned int v13 = [v9 _addressGeocodeAccuracy];
    if (v13 < 6 || v13 != -1) {
      objc_msgSend(v5, "setAddressGeocodeAccuracyHint:");
    }
    int v14 = [v9 _placeType];
    if (v14) {
      [v5 setPlaceTypeHint:_PDPlaceTypeForMapItemPlaceType(v14)];
    }
    [v3 setWaypointId:v5];
    [v3 setWaypointLocationSource:3];
  }
  else
  {
    [v3 setWaypointLocationSource:4];
  }
  v15 = [v3 waypointId];
  if (v15 && [(GEOComposedRoute *)self->_route pointCount])
  {
    [(GEOComposedRoute *)self->_route pointAt:0];
    v18 = [[GEOLatLng alloc] initWithLatitude:v16 longitude:v17];
    [v15 setLocationHint:v18];
  }

  return v3;
}

- (GEOComposedWaypointToRoute)initWithDictionary:(id)a3
{
  id v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)GEOComposedWaypointToRoute;
  uint64_t v5 = [(GEOComposedWaypoint *)&v15 initWithDictionary:v4];
  if (v5)
  {
    uint64_t v6 = [v4 objectForKeyedSubscript:@"_private_GEOComposedWaypointToRouteStorageKey"];
    if (v6)
    {
      id v14 = 0;
      v7 = [MEMORY[0x1E4F28DC0] unarchivedObjectOfClass:objc_opt_class() fromData:v6 error:&v14];
      id v8 = v14;
      v9 = [[GEORouteBuilder_PersistentData alloc] initWithPersistentData:v7];
      uint64_t v10 = [(GEORouteBuilderBase *)v9 buildRoute];
      route = v5->_route;
      v5->_route = (GEOComposedRoute *)v10;
    }
    v12 = v5;
  }
  return v5;
}

- (id)dictionaryRepresentation
{
  v11.receiver = self;
  v11.super_class = (Class)GEOComposedWaypointToRoute;
  v3 = [(GEOComposedWaypoint *)&v11 dictionaryRepresentation];
  id v4 = (void *)[v3 mutableCopy];

  uint64_t v5 = (void *)MEMORY[0x1E4F28DB0];
  uint64_t v6 = [(GEOComposedWaypointToRoute *)self route];
  v7 = [v6 persistentData];
  uint64_t v10 = 0;
  id v8 = [v5 archivedDataWithRootObject:v7 requiringSecureCoding:1 error:&v10];

  [v4 setObject:v8 forKeyedSubscript:@"_private_GEOComposedWaypointToRouteStorageKey"];

  return v4;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v6.receiver = self;
  v6.super_class = (Class)GEOComposedWaypointToRoute;
  id v4 = [(GEOComposedWaypoint *)&v6 copyWithZone:a3];
  objc_storeStrong(v4 + 14, self->_route);
  return v4;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)GEOComposedWaypointToRoute;
  id v4 = a3;
  [(GEOComposedWaypointToRoute *)&v5 encodeWithCoder:v4];
  objc_msgSend(v4, "encodeObject:forKey:", self->_route, @"_route", v5.receiver, v5.super_class);
}

- (GEOComposedWaypointToRoute)initWithCoder:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)GEOComposedWaypointToRoute;
  objc_super v5 = [(GEOComposedWaypointToRoute *)&v10 initWithCoder:v4];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_route"];
    route = v5->_route;
    v5->_route = (GEOComposedRoute *)v6;

    id v8 = v5;
  }

  return v5;
}

- (GEOComposedRoute)route
{
  return self->_route;
}

- (void).cxx_destruct
{
}

@end