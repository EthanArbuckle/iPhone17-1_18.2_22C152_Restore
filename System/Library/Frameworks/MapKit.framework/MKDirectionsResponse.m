@interface MKDirectionsResponse
+ (id)_responseWithGEODirectionsRouteResponse:(id)a3 routeRequest:(id)a4 request:(id)a5 origin:(id)a6 destination:(id)a7 error:(id *)a8;
- (GEODirectionsResponse)_geoResponse;
- (MKMapItem)destination;
- (MKMapItem)source;
- (NSArray)routes;
- (NSString)_incidentDescription;
- (NSURL)_mapsURL;
- (id)_initWithGEORouteResponse:(id)a3 routeRequest:(id)a4 request:(id)a5 origin:(id)a6 destination:(id)a7;
@end

@implementation MKDirectionsResponse

- (id)_initWithGEORouteResponse:(id)a3 routeRequest:(id)a4 request:(id)a5 origin:(id)a6 destination:(id)a7
{
  v79[2] = *MEMORY[0x1E4F143B8];
  id v13 = a3;
  id v14 = a4;
  id v15 = a5;
  id v16 = a6;
  id v17 = a7;
  v76.receiver = self;
  v76.super_class = (Class)MKDirectionsResponse;
  v18 = [(MKDirectionsResponse *)&v76 init];
  p_isa = (id *)&v18->super.isa;
  if (!v18) {
    goto LABEL_31;
  }
  objc_storeStrong((id *)&v18->_geoResponse, a3);
  v20 = [v16 geoMapItem];
  uint64_t v21 = +[MKMapItem _itemWithGeoMapItem:v20];
  id v22 = p_isa[2];
  p_isa[2] = (id)v21;

  v23 = [v17 geoMapItem];
  uint64_t v24 = +[MKMapItem _itemWithGeoMapItem:v23];
  id v25 = p_isa[3];
  p_isa[3] = (id)v24;

  uint64_t v26 = [p_isa[2] name];
  if (!v26
    || (v27 = (void *)v26,
        [p_isa[2] name],
        v28 = objc_claimAutoreleasedReturnValue(),
        uint64_t v29 = [v28 length],
        v28,
        v27,
        !v29))
  {
    v30 = [v15 source];
    v31 = [v30 name];
    [p_isa[2] setName:v31];
  }
  uint64_t v32 = [p_isa[3] name];
  if (!v32
    || (v33 = (void *)v32,
        [p_isa[3] name],
        v34 = objc_claimAutoreleasedReturnValue(),
        uint64_t v35 = [v34 length],
        v34,
        v33,
        !v35))
  {
    v36 = [v15 destination];
    v37 = [v36 name];
    [p_isa[3] setName:v37];
  }
  if ([v15 _includeRoutePoints])
  {
    id v38 = objc_alloc(MEMORY[0x1E4F649D0]);
    id v64 = v17;
    id v65 = v16;
    v79[0] = v16;
    v79[1] = v17;
    v39 = [MEMORY[0x1E4F1C978] arrayWithObjects:v79 count:2];
    id v66 = v14;
    v40 = [v14 routeAttributes];
    v41 = (void *)[v38 initWithWaypoints:v39 routeAttributes:v40 directionsResponse:v13];

    id v42 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    id v43 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    long long v72 = 0u;
    long long v73 = 0u;
    long long v74 = 0u;
    long long v75 = 0u;
    v63 = v41;
    v44 = [v41 allRoutes];
    uint64_t v45 = [v44 countByEnumeratingWithState:&v72 objects:v78 count:16];
    if (v45)
    {
      uint64_t v46 = v45;
      uint64_t v47 = *(void *)v73;
      do
      {
        for (uint64_t i = 0; i != v46; ++i)
        {
          if (*(void *)v73 != v47) {
            objc_enumerationMutation(v44);
          }
          v49 = *(void **)(*((void *)&v72 + 1) + 8 * i);
          int v50 = [v49 routeType];
          v51 = v43;
          if (v50)
          {
            int v52 = [v49 routeType];
            v51 = v42;
            if (v52 != 1) {
              continue;
            }
          }
          [v51 addObject:v49];
        }
        uint64_t v46 = [v44 countByEnumeratingWithState:&v72 objects:v78 count:16];
      }
      while (v46);
    }
    id v67 = v13;

    [v43 addObjectsFromArray:v42];
    v53 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(v43, "count"));
    long long v68 = 0u;
    long long v69 = 0u;
    long long v70 = 0u;
    long long v71 = 0u;
    id v54 = v43;
    uint64_t v55 = [v54 countByEnumeratingWithState:&v68 objects:v77 count:16];
    if (v55)
    {
      uint64_t v56 = v55;
      uint64_t v57 = *(void *)v69;
      do
      {
        for (uint64_t j = 0; j != v56; ++j)
        {
          if (*(void *)v69 != v57) {
            objc_enumerationMutation(v54);
          }
          id v59 = [[MKRoute alloc] _initWithGEOComposedRoute:*(void *)(*((void *)&v68 + 1) + 8 * j)];
          if (v59) {
            [v53 addObject:v59];
          }
        }
        uint64_t v56 = [v54 countByEnumeratingWithState:&v68 objects:v77 count:16];
      }
      while (v56);
    }

    id v60 = p_isa[4];
    p_isa[4] = v53;

    id v14 = v66;
    id v13 = v67;
    id v17 = v64;
    id v16 = v65;
  }
  if ([p_isa[4] count]) {
    v61 = p_isa;
  }
  else {
LABEL_31:
  }
    v61 = 0;

  return v61;
}

+ (id)_responseWithGEODirectionsRouteResponse:(id)a3 routeRequest:(id)a4 request:(id)a5 origin:(id)a6 destination:(id)a7 error:(id *)a8
{
  id v14 = a3;
  id v15 = a4;
  id v16 = a5;
  id v17 = a6;
  id v18 = a7;
  if ([v14 routesCount] || objc_msgSend(v14, "waypointRoutesCount"))
  {
    v19 = (void *)[objc_alloc((Class)a1) _initWithGEORouteResponse:v14 routeRequest:v15 request:v16 origin:v17 destination:v18];
    if (!a8) {
      goto LABEL_6;
    }
  }
  else
  {
    v19 = 0;
    if (!a8) {
      goto LABEL_6;
    }
  }
  if (!v19)
  {
    id v20 = objc_alloc(MEMORY[0x1E4F28C58]);
    *a8 = (id)[v20 initWithDomain:MKErrorDomain code:5 userInfo:0];
  }
LABEL_6:

  return v19;
}

- (NSString)_incidentDescription
{
  v2 = [(GEODirectionsResponse *)self->_geoResponse incidentsOnRoutesAtIndex:0];
  if (v2)
  {
    v3 = +[MKTrafficSupport sharedTrafficSupport];
    v4 = objc_msgSend(v3, "localizedTitleForGEOIncidentType:laneType:laneCount:", objc_msgSend(v2, "type"), objc_msgSend(v2, "laneClosureType"), objc_msgSend(v2, "laneClosureCount"));
  }
  else
  {
    v4 = 0;
  }

  return (NSString *)v4;
}

- (NSURL)_mapsURL
{
  v11[2] = *MEMORY[0x1E4F143B8];
  destination = self->_destination;
  v11[0] = self->_source;
  v11[1] = destination;
  v4 = [MEMORY[0x1E4F1C978] arrayWithObjects:v11 count:2];
  v9 = @"MKLaunchOptionsLaunchIntoRoute";
  v5 = [(GEODirectionsResponse *)self->_geoResponse data];
  v10 = v5;
  v6 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v10 forKeys:&v9 count:1];
  v7 = +[MKMapItem urlForMapItems:v4 options:v6];

  return (NSURL *)v7;
}

- (GEODirectionsResponse)_geoResponse
{
  return self->_geoResponse;
}

- (MKMapItem)source
{
  return self->_source;
}

- (MKMapItem)destination
{
  return self->_destination;
}

- (NSArray)routes
{
  return self->_routes;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_routes, 0);
  objc_storeStrong((id *)&self->_destination, 0);
  objc_storeStrong((id *)&self->_source, 0);

  objc_storeStrong((id *)&self->_geoResponse, 0);
}

@end