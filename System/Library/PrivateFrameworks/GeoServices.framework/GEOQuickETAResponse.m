@interface GEOQuickETAResponse
- (GEOLocation)destinationLocation;
- (GEOLocation)sourceLocation;
- (GEOQuickETAResponse)initWithDirectionsResponse:(id)a3 fromRequest:(id)a4;
- (GEOQuickETAResponse)initWithETAResult:(id)a3 fromRequest:(id)a4;
- (GEOQuickETATransitDeparturesInfo)transitDeparturesInfo;
- (NSMutableArray)sortedETAs;
- (NSString)routeDescription;
- (double)distance;
- (double)distanceToDepartureStop;
- (double)walkingDurationToDepartureStop;
- (unsigned)baselineETASeconds;
- (unsigned)responseETASeconds;
@end

@implementation GEOQuickETAResponse

- (unsigned)responseETASeconds
{
  return self->_responseETASeconds;
}

- (GEOLocation)sourceLocation
{
  return self->_sourceLocation;
}

- (NSMutableArray)sortedETAs
{
  return self->_sortedETAs;
}

- (double)distance
{
  return self->_distance;
}

- (GEOQuickETAResponse)initWithETAResult:(id)a3 fromRequest:(id)a4
{
  uint64_t v45 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  v43.receiver = self;
  v43.super_class = (Class)GEOQuickETAResponse;
  v8 = [(GEOQuickETAResponse *)&v43 init];
  if (v8)
  {
    v9 = [GEOLocation alloc];
    v10 = [v7 sourceWaypoint];
    v11 = [v10 latLng];
    uint64_t v12 = [(GEOLocation *)v9 initWithLocation:v11];
    sourceLocation = v8->_sourceLocation;
    v8->_sourceLocation = (GEOLocation *)v12;

    v14 = [GEOLocation alloc];
    v15 = [v7 destinationWaypoint];
    v16 = [v15 latLng];
    uint64_t v17 = [(GEOLocation *)v14 initWithLocation:v16];
    destinationLocation = v8->_destinationLocation;
    v8->_destinationLocation = (GEOLocation *)v17;

    v19 = -[GEOETAResult sortedETAs]((id *)v6);

    if (v19)
    {
      long long v41 = 0u;
      long long v42 = 0u;
      long long v39 = 0u;
      long long v40 = 0u;
      v21 = -[GEOETAResult sortedETAs]((id *)v6);
      uint64_t v22 = [v21 countByEnumeratingWithState:&v39 objects:v44 count:16];
      if (v22)
      {
        uint64_t v23 = v22;
        uint64_t v24 = *(void *)v40;
        while (2)
        {
          for (uint64_t i = 0; i != v23; ++i)
          {
            if (*(void *)v40 != v24) {
              objc_enumerationMutation(v21);
            }
            v26 = *(void **)(*((void *)&v39 + 1) + 8 * i);
            int v27 = objc_msgSend(v7, "transportType", (void)v39);
            if (v27 == [v26 transportType])
            {
              v8->_responseETASeconds = [v26 travelTimeBestEstimate];
              v8->_baselineETASeconds = [v26 historicTravelTime];
              v8->_distance = (double)[v26 distance];
              v28 = [v26 summaryForPredictedDestinations];
              v29 = [v28 firstObject];

              v30 = [v29 formatStrings];
              v31 = [v30 firstObject];
              uint64_t v32 = [v31 copy];
              routeDescription = v8->_routeDescription;
              v8->_routeDescription = (NSString *)v32;

              goto LABEL_13;
            }
          }
          uint64_t v23 = [v21 countByEnumeratingWithState:&v39 objects:v44 count:16];
          if (v23) {
            continue;
          }
          break;
        }
      }
LABEL_13:
    }
    else
    {
      if (v6)
      {
        v8->_responseETASeconds = *((_DWORD *)v6 + 17);
        v8->_baselineETASeconds = *((_DWORD *)v6 + 16);
        LODWORD(v20) = *((_DWORD *)v6 + 15);
        double v34 = (double)v20;
      }
      else
      {
        *(void *)&v8->_responseETASeconds = 0;
        double v34 = 0.0;
      }
      v8->_distance = v34;
    }
    uint64_t v35 = -[GEOETAResult sortedETAs]((id *)v6);
    sortedETAs = v8->_sortedETAs;
    v8->_sortedETAs = (NSMutableArray *)v35;

    v37 = v8;
  }

  return v8;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sortedETAs, 0);
  objc_storeStrong((id *)&self->_transitDeparturesInfo, 0);
  objc_storeStrong((id *)&self->_routeDescription, 0);
  objc_storeStrong((id *)&self->_destinationLocation, 0);

  objc_storeStrong((id *)&self->_sourceLocation, 0);
}

- (GEOQuickETAResponse)initWithDirectionsResponse:(id)a3 fromRequest:(id)a4
{
  v73[2] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  v71.receiver = self;
  v71.super_class = (Class)GEOQuickETAResponse;
  v8 = [(GEOQuickETAResponse *)&v71 init];
  if (v8)
  {
    uint64_t v9 = [v7 sourceWaypoint];
    if (v9
      && (v10 = (void *)v9,
          [v7 destinationWaypoint],
          v11 = objc_claimAutoreleasedReturnValue(),
          v11,
          v10,
          v11))
    {
      uint64_t v12 = [GEOLocation alloc];
      v13 = [v7 sourceWaypoint];
      v14 = [v13 latLng];
      uint64_t v15 = [(GEOLocation *)v12 initWithLocation:v14];
      sourceLocation = v8->_sourceLocation;
      v8->_sourceLocation = (GEOLocation *)v15;

      uint64_t v17 = [GEOLocation alloc];
      v18 = [v7 destinationWaypoint];
      v19 = [v18 latLng];
      uint64_t v20 = [(GEOLocation *)v17 initWithLocation:v19];
      destinationLocation = v8->_destinationLocation;
      v8->_destinationLocation = (GEOLocation *)v20;
    }
    else
    {
      v18 = [v6 placeSearchResponses];
      v19 = [v18 objectAtIndex:0];
      destinationLocation = [v18 lastObject];
      uint64_t v22 = [v19 placeResults];
      uint64_t v23 = [v22 objectAtIndex:0];

      uint64_t v24 = [destinationLocation placeResults];
      v25 = [v24 objectAtIndex:0];

      v26 = [GEOLocation alloc];
      int v27 = [v23 place];
      [v27 coordinate];
      uint64_t v28 = -[GEOLocation initWithGEOCoordinate:](v26, "initWithGEOCoordinate:");
      v29 = v8->_sourceLocation;
      v8->_sourceLocation = (GEOLocation *)v28;

      v30 = [GEOLocation alloc];
      v31 = [v25 place];
      [v31 coordinate];
      uint64_t v32 = -[GEOLocation initWithGEOCoordinate:](v30, "initWithGEOCoordinate:");
      v33 = v8->_destinationLocation;
      v8->_destinationLocation = (GEOLocation *)v32;
    }
    if ([v7 transportType] == 1 && objc_msgSend(v6, "suggestedRoutesCount"))
    {
      double v34 = [v6 suggestedRouteAtIndex:0];
      int v35 = [v34 absEndTime];
      v8->_responseETASeconds = v35 - [v34 absStartTime];
      v8->_baselineETASeconds = 0;
      v36 = [GEORouteInitializerData alloc];
      v37 = [v7 sourceWaypoint];
      v73[0] = v37;
      v38 = [v7 destinationWaypoint];
      v73[1] = v38;
      long long v39 = [MEMORY[0x1E4F1C978] arrayWithObjects:v73 count:2];
      long long v40 = [(GEORouteInitializerData *)v36 initWithWaypoints:v39 routeAttributes:0 directionsResponse:v6];

      long long v41 = [[GEOComposedRoute alloc] initWithSuggestedRoute:v34 initializerData:v40];
      long long v42 = [[GEOQuickETATransitDeparturesInfo alloc] initWithComposedRoute:v41];
      transitDeparturesInfo = v8->_transitDeparturesInfo;
      v8->_transitDeparturesInfo = v42;

      v44 = [(GEOComposedRoute *)v41 segments];
      uint64_t v45 = [v44 firstObject];

      v8->_distanceToDepartureStop = 0.0;
      v8->_walkingDurationToDepartureStop = 0.0;
      if ([v45 type] == 2)
      {
        if (v8->_transitDeparturesInfo)
        {
          v65 = v45;
          v66 = v40;
          long long v69 = 0u;
          long long v70 = 0u;
          long long v67 = 0u;
          long long v68 = 0u;
          v46 = [v45 steps];
          uint64_t v47 = [v46 countByEnumeratingWithState:&v67 objects:v72 count:16];
          if (v47)
          {
            uint64_t v48 = v47;
            uint64_t v49 = *(void *)v68;
            do
            {
              for (uint64_t i = 0; i != v48; ++i)
              {
                if (*(void *)v68 != v49) {
                  objc_enumerationMutation(v46);
                }
                v51 = *(void **)(*((void *)&v67 + 1) + 8 * i);
                [v51 distance];
                v8->_distanceToDepartureStop = v52 + v8->_distanceToDepartureStop;
                v8->_walkingDurationToDepartureStop = v8->_walkingDurationToDepartureStop
                                                    + (double)[v51 duration];
              }
              uint64_t v48 = [v46 countByEnumeratingWithState:&v67 objects:v72 count:16];
            }
            while (v48);
          }

          uint64_t v45 = v65;
          long long v40 = v66;
        }
        else
        {
          [(GEOComposedRoute *)v41 distance];
          v8->_distance = v62;
        }
      }

      goto LABEL_29;
    }
    v53 = [v6 waypointRoutes];
    uint64_t v54 = [v53 count];

    if (v54)
    {
      v55 = [v6 waypointRoutes];
      double v34 = [v55 firstObject];

      v56 = [v34 traversalTimes];
      v8->_responseETASeconds = [v56 estimatedSeconds];

      v57 = [v34 traversalTimes];
      v8->_baselineETASeconds = [v57 historicalEstimatedSeconds];

      if ([v7 includeDistance])
      {
        unsigned int v58 = [v34 distanceMeters];
LABEL_26:
        v8->_distance = (double)v58;
      }
    }
    else
    {
      v59 = [v6 routes];
      uint64_t v60 = [v59 count];

      if (!v60)
      {
LABEL_30:
        v63 = v8;
        goto LABEL_31;
      }
      double v34 = [v6 routeAtIndex:0];
      v8->_responseETASeconds = [v34 expectedTime];
      unsigned int v61 = [v34 hasHistoricTravelTime];
      if (v61) {
        unsigned int v61 = [v34 historicTravelTime];
      }
      v8->_baselineETASeconds = v61;
      if ([v7 includeDistance])
      {
        unsigned int v58 = [v34 distance];
        goto LABEL_26;
      }
    }
LABEL_29:

    goto LABEL_30;
  }
LABEL_31:

  return v8;
}

- (GEOLocation)destinationLocation
{
  return self->_destinationLocation;
}

- (unsigned)baselineETASeconds
{
  return self->_baselineETASeconds;
}

- (NSString)routeDescription
{
  return self->_routeDescription;
}

- (GEOQuickETATransitDeparturesInfo)transitDeparturesInfo
{
  return self->_transitDeparturesInfo;
}

- (double)distanceToDepartureStop
{
  return self->_distanceToDepartureStop;
}

- (double)walkingDurationToDepartureStop
{
  return self->_walkingDurationToDepartureStop;
}

@end