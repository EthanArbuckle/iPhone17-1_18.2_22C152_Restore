@interface GEOComposedRouteMutableData
+ (BOOL)supportsSecureCoding;
- (GEOComposedRouteMutableData)initWithCoder:(id)a3;
- (GEOComposedRouteTraffic)traffic;
- (NSArray)rideSelections;
- (NSArray)trafficDelayInfos;
- (NSArray)updateableCameraInfos;
- (id)chargingStationInfoForLegIndex:(unint64_t)a3;
- (id)description;
- (id)destinationDisplayInfoForLeg:(unint64_t)a3;
- (id)evInfoForStepID:(unint64_t)a3;
- (id)originDisplayInfoForLeg:(unint64_t)a3;
- (void)encodeWithCoder:(id)a3;
- (void)initializeForRoute:(id)a3;
- (void)setRideSelections:(id)a3;
- (void)setTraffic:(id)a3;
- (void)setTrafficDelayInfos:(id)a3;
- (void)setUpdateableCameraInfos:(id)a3;
- (void)updateForRoute:(id)a3 etaRoute:(id)a4;
@end

@implementation GEOComposedRouteMutableData

- (id)evInfoForStepID:(unint64_t)a3
{
  stepsIDToEVInfos = self->_stepsIDToEVInfos;
  v4 = [NSNumber numberWithUnsignedInteger:a3];
  v5 = [(NSDictionary *)stepsIDToEVInfos objectForKeyedSubscript:v4];

  return v5;
}

- (id)chargingStationInfoForLegIndex:(unint64_t)a3
{
  legIndexToChargingStationInfos = self->_legIndexToChargingStationInfos;
  v4 = [NSNumber numberWithUnsignedInteger:a3];
  v5 = [(NSDictionary *)legIndexToChargingStationInfos objectForKeyedSubscript:v4];

  return v5;
}

- (id)originDisplayInfoForLeg:(unint64_t)a3
{
  originDisplayInfos = self->_originDisplayInfos;
  v4 = [NSNumber numberWithUnsignedInteger:a3];
  v5 = [(NSDictionary *)originDisplayInfos objectForKeyedSubscript:v4];

  return v5;
}

- (id)destinationDisplayInfoForLeg:(unint64_t)a3
{
  destinationDisplayInfos = self->_destinationDisplayInfos;
  v4 = [NSNumber numberWithUnsignedInteger:a3];
  v5 = [(NSDictionary *)destinationDisplayInfos objectForKeyedSubscript:v4];

  return v5;
}

- (void)initializeForRoute:(id)a3
{
  uint64_t v76 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if ([v4 transportType] != 1)
  {
    v8 = [GEOComposedRouteTraffic alloc];
    v9 = [v4 routeInitializerData];
    v10 = [(GEOComposedRouteTraffic *)v8 initWithRoute:v4 initializerData:v9];
    traffic = self->_traffic;
    self->_traffic = v10;

    v12 = [v4 geoWaypointRoute];
    v13 = [v4 coordinates];
    v14 = +[GEOComposedRouteVisualInfo visualInfosForGeoWaypointRoute:v12 coordinates:v13 updateable:1];
    trafficDelayInfos = self->_trafficDelayInfos;
    self->_trafficDelayInfos = v14;

    v16 = [v4 geoWaypointRoute];
    v17 = [v4 coordinates];
    v18 = +[GEOComposedRouteVisualInfo cameraInfosForGeoWaypointRoute:v16 coordinates:v17 updateable:1];
    updateableCameraInfos = self->_updateableCameraInfos;
    self->_updateableCameraInfos = v18;

    long long v72 = 0u;
    long long v73 = 0u;
    long long v70 = 0u;
    long long v71 = 0u;
    v20 = [v4 steps];
    uint64_t v21 = [v20 countByEnumeratingWithState:&v70 objects:v75 count:16];
    if (v21)
    {
      uint64_t v22 = v21;
      v23 = 0;
      uint64_t v24 = *(void *)v71;
      do
      {
        for (uint64_t i = 0; i != v22; ++i)
        {
          if (*(void *)v71 != v24) {
            objc_enumerationMutation(v20);
          }
          v26 = *(void **)(*((void *)&v70 + 1) + 8 * i);
          v27 = [v26 evInfo];
          if (v27)
          {
            if (!v23)
            {
              v23 = [MEMORY[0x1E4F1CA60] dictionary];
            }
            v28 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", objc_msgSend(v26, "stepID"));
            [v23 setObject:v27 forKeyedSubscript:v28];
          }
        }
        uint64_t v22 = [v20 countByEnumeratingWithState:&v70 objects:v75 count:16];
      }
      while (v22);
    }
    else
    {
      v23 = 0;
    }

    v58 = v23;
    v59 = self;
    objc_storeStrong((id *)&self->_stepsIDToEVInfos, v23);
    long long v68 = 0u;
    long long v69 = 0u;
    long long v66 = 0u;
    long long v67 = 0u;
    v61 = v4;
    id obj = [v4 legs];
    uint64_t v63 = [obj countByEnumeratingWithState:&v66 objects:v74 count:16];
    v29 = 0;
    if (!v63)
    {
      v64 = 0;
      v65 = 0;
      goto LABEL_34;
    }
    v64 = 0;
    v65 = 0;
    uint64_t v62 = *(void *)v67;
    while (1)
    {
      uint64_t v30 = 0;
      do
      {
        if (*(void *)v67 != v62) {
          objc_enumerationMutation(obj);
        }
        v31 = *(void **)(*((void *)&v66 + 1) + 8 * v30);
        v32 = objc_msgSend(v31, "destination", v58);
        v33 = [v32 chargingInfo];

        if (v33)
        {
          v34 = v64;
          if (!v64)
          {
            v35 = (void *)MEMORY[0x1E4F1CA60];
            v36 = [v61 legs];
            objc_msgSend(v35, "dictionaryWithCapacity:", objc_msgSend(v36, "count"));
            v34 = (NSDictionary *)objc_claimAutoreleasedReturnValue();
          }
          v37 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v31, "legIndex"));
          v64 = v34;
          [(NSDictionary *)v34 setObject:v33 forKeyedSubscript:v37];
        }
        if (v65)
        {
          if (v29) {
            goto LABEL_27;
          }
        }
        else
        {
          v48 = (void *)MEMORY[0x1E4F1CA60];
          v49 = [v61 legs];
          objc_msgSend(v48, "dictionaryWithCapacity:", objc_msgSend(v49, "count"));
          v65 = (NSDictionary *)objc_claimAutoreleasedReturnValue();

          if (v29) {
            goto LABEL_27;
          }
        }
        v50 = (void *)MEMORY[0x1E4F1CA60];
        v51 = [v61 legs];
        objc_msgSend(v50, "dictionaryWithCapacity:", objc_msgSend(v51, "count"));
        v29 = (NSDictionary *)objc_claimAutoreleasedReturnValue();

LABEL_27:
        v38 = [GEOComposedWaypointDisplayInfo alloc];
        v39 = [v31 geoOriginWaypointInfo];
        v40 = [v31 origin];
        v41 = [(GEOComposedWaypointDisplayInfo *)v38 initWithGeoWaypointInfo:v39 waypoint:v40];

        v42 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v31, "legIndex"));
        [(NSDictionary *)v65 setObject:v41 forKeyedSubscript:v42];

        v43 = [GEOComposedWaypointDisplayInfo alloc];
        v44 = [v31 geoDestinationWaypointInfo];
        v45 = [v31 destination];
        v46 = [(GEOComposedWaypointDisplayInfo *)v43 initWithGeoWaypointInfo:v44 waypoint:v45];

        v47 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v31, "legIndex"));
        [(NSDictionary *)v29 setObject:v46 forKeyedSubscript:v47];

        ++v30;
      }
      while (v63 != v30);
      uint64_t v52 = [obj countByEnumeratingWithState:&v66 objects:v74 count:16];
      uint64_t v63 = v52;
      if (!v52)
      {
LABEL_34:

        legIndexToChargingStationInfos = v59->_legIndexToChargingStationInfos;
        v59->_legIndexToChargingStationInfos = v64;
        v54 = v64;

        originDisplayInfos = v59->_originDisplayInfos;
        v59->_originDisplayInfos = v65;
        v56 = v65;

        destinationDisplayInfos = v59->_destinationDisplayInfos;
        v59->_destinationDisplayInfos = v29;

        id v4 = v61;
        goto LABEL_35;
      }
    }
  }
  v5 = [v4 rideSelections];
  v6 = (NSArray *)[v5 copy];
  rideSelections = self->_rideSelections;
  self->_rideSelections = v6;

LABEL_35:
}

- (void)updateForRoute:(id)a3 etaRoute:(id)a4
{
  uint64_t v49 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  v41 = v6;
  if ([v6 transportType] != 1)
  {
    v8 = [[GEOComposedRouteTraffic alloc] initWithRoute:v6 etaRoute:v7];
    traffic = self->_traffic;
    self->_traffic = v8;

    v10 = +[GEOComposedRouteVisualInfo visualInfosForRoute:v6 etaRoute:v7];
    trafficDelayInfos = self->_trafficDelayInfos;
    self->_trafficDelayInfos = v10;

    v12 = +[GEOComposedRouteVisualInfo cameraInfosForRoute:v6 etaRoute:v7];
    updateableCameraInfos = self->_updateableCameraInfos;
    self->_updateableCameraInfos = v12;

    if (self->_stepsIDToEVInfos)
    {
      v14 = [v7 evStepInfos];
      v15 = (NSDictionary *)[(NSDictionary *)self->_stepsIDToEVInfos mutableCopy];
      [(NSDictionary *)v15 addEntriesFromDictionary:v14];
      stepsIDToEVInfos = self->_stepsIDToEVInfos;
      self->_stepsIDToEVInfos = v15;
    }
    if (self->_legIndexToChargingStationInfos)
    {
      v17 = [v7 evChargingStationInfos];
      v18 = (NSDictionary *)[(NSDictionary *)self->_legIndexToChargingStationInfos mutableCopy];
      [(NSDictionary *)v18 addEntriesFromDictionary:v17];
      legIndexToChargingStationInfos = self->_legIndexToChargingStationInfos;
      self->_legIndexToChargingStationInfos = v18;
    }
    if (self->_originDisplayInfos || self->_destinationDisplayInfos)
    {
      long long v46 = 0u;
      long long v47 = 0u;
      long long v44 = 0u;
      long long v45 = 0u;
      id v39 = v7;
      id obj = [v7 legs];
      uint64_t v43 = [obj countByEnumeratingWithState:&v44 objects:v48 count:16];
      if (v43)
      {
        uint64_t v42 = *(void *)v45;
        do
        {
          for (uint64_t i = 0; i != v43; ++i)
          {
            if (*(void *)v45 != v42) {
              objc_enumerationMutation(obj);
            }
            uint64_t v21 = *(void **)(*((void *)&v44 + 1) + 8 * i);
            uint64_t v22 = [v21 originWaypointInfo];
            v23 = [v21 destinationWaypointInfo];
            unint64_t v24 = [v21 originalLegIndex];
            originDisplayInfos = self->_originDisplayInfos;
            v26 = [NSNumber numberWithUnsignedInteger:v24];
            v27 = [(NSDictionary *)originDisplayInfos objectForKeyedSubscript:v26];

            if (v27)
            {
              if (v24)
              {
                destinationDisplayInfos = self->_destinationDisplayInfos;
                v29 = [NSNumber numberWithUnsignedInteger:v24 - 1];
                uint64_t v30 = [(NSDictionary *)destinationDisplayInfos objectForKeyedSubscript:v29];
              }
              else
              {
                uint64_t v30 = 0;
              }
              [v27 setWaypointInfo:v22];
              [v30 setWaypointInfo:v22];
            }
            v31 = self->_destinationDisplayInfos;
            v32 = [NSNumber numberWithUnsignedInteger:v24];
            v33 = [(NSDictionary *)v31 objectForKeyedSubscript:v32];

            if (v33)
            {
              v34 = [v41 legs];
              unint64_t v35 = [v34 count] - 1;

              if (v24 >= v35)
              {
                v38 = 0;
              }
              else
              {
                v36 = self->_originDisplayInfos;
                v37 = [NSNumber numberWithUnsignedInteger:v24 + 1];
                v38 = [(NSDictionary *)v36 objectForKeyedSubscript:v37];
              }
              [v33 setWaypointInfo:v23];
              [v38 setWaypointInfo:v23];
            }
          }
          uint64_t v43 = [obj countByEnumeratingWithState:&v44 objects:v48 count:16];
        }
        while (v43);
      }

      id v7 = v39;
    }
  }
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (GEOComposedRouteMutableData)initWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [(GEOComposedRouteMutableData *)self init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_traffic"];
    traffic = v5->_traffic;
    v5->_traffic = (GEOComposedRouteTraffic *)v6;

    uint64_t v8 = [v4 decodeArrayOfObjectsOfClass:objc_opt_class() forKey:@"_trafficDelayInfos"];
    trafficDelayInfos = v5->_trafficDelayInfos;
    v5->_trafficDelayInfos = (NSArray *)v8;

    uint64_t v10 = [v4 decodeArrayOfObjectsOfClass:objc_opt_class() forKey:@"_updateableCameraInfos"];
    updateableCameraInfos = v5->_updateableCameraInfos;
    v5->_updateableCameraInfos = (NSArray *)v10;

    uint64_t v12 = objc_opt_class();
    uint64_t v13 = [v4 decodeDictionaryWithKeysOfClass:v12 objectsOfClass:objc_opt_class() forKey:@"_stepsIDToEVInfos"];
    stepsIDToEVInfos = v5->_stepsIDToEVInfos;
    v5->_stepsIDToEVInfos = (NSDictionary *)v13;

    uint64_t v15 = objc_opt_class();
    uint64_t v16 = [v4 decodeDictionaryWithKeysOfClass:v15 objectsOfClass:objc_opt_class() forKey:@"_legIndexToChargingStationInfos"];
    legIndexToChargingStationInfos = v5->_legIndexToChargingStationInfos;
    v5->_legIndexToChargingStationInfos = (NSDictionary *)v16;

    uint64_t v18 = objc_opt_class();
    uint64_t v19 = [v4 decodeDictionaryWithKeysOfClass:v18 objectsOfClass:objc_opt_class() forKey:@"_originDisplayInfos"];
    originDisplayInfos = v5->_originDisplayInfos;
    v5->_originDisplayInfos = (NSDictionary *)v19;

    uint64_t v21 = objc_opt_class();
    uint64_t v22 = [v4 decodeDictionaryWithKeysOfClass:v21 objectsOfClass:objc_opt_class() forKey:@"_destinationDisplayInfos"];
    destinationDisplayInfos = v5->_destinationDisplayInfos;
    v5->_destinationDisplayInfos = (NSDictionary *)v22;

    uint64_t v24 = [v4 decodeArrayOfObjectsOfClass:objc_opt_class() forKey:@"_rideSelections"];
    rideSelections = v5->_rideSelections;
    v5->_rideSelections = (NSArray *)v24;

    v26 = v5;
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  traffic = self->_traffic;
  id v5 = a3;
  [v5 encodeObject:traffic forKey:@"_traffic"];
  [v5 encodeObject:self->_trafficDelayInfos forKey:@"_trafficDelayInfos"];
  [v5 encodeObject:self->_updateableCameraInfos forKey:@"_updateableCameraInfos"];
  [v5 encodeObject:self->_stepsIDToEVInfos forKey:@"_stepsIDToEVInfos"];
  [v5 encodeObject:self->_legIndexToChargingStationInfos forKey:@"_legIndexToChargingStationInfos"];
  [v5 encodeObject:self->_originDisplayInfos forKey:@"_originDisplayInfos"];
  [v5 encodeObject:self->_destinationDisplayInfos forKey:@"_destinationDisplayInfos"];
  [v5 encodeObject:self->_rideSelections forKey:@"_rideSelections"];
}

- (id)description
{
  uint64_t v70 = *MEMORY[0x1E4F143B8];
  v3 = [MEMORY[0x1E4F28E78] string];
  [v3 appendFormat:@"Traffic: %@\n", self->_traffic];
  uint64_t v49 = v3;
  if ([(NSDictionary *)self->_stepsIDToEVInfos count])
  {
    id v4 = [MEMORY[0x1E4F28E78] string];
    id v5 = [(NSDictionary *)self->_stepsIDToEVInfos allKeys];
    uint64_t v6 = [v5 sortedArrayUsingSelector:sel_compare_];

    double v7 = log10((double)(unint64_t)[v6 count]);
    long long v62 = 0u;
    long long v63 = 0u;
    long long v64 = 0u;
    long long v65 = 0u;
    id v8 = v6;
    uint64_t v9 = [v8 countByEnumeratingWithState:&v62 objects:v69 count:16];
    if (v9)
    {
      uint64_t v10 = v9;
      uint64_t v11 = *(void *)v63;
      do
      {
        for (uint64_t i = 0; i != v10; ++i)
        {
          if (*(void *)v63 != v11) {
            objc_enumerationMutation(v8);
          }
          uint64_t v13 = *(void **)(*((void *)&v62 + 1) + 8 * i);
          v14 = [(NSDictionary *)self->_stepsIDToEVInfos objectForKeyedSubscript:v13];
          [v4 appendFormat:@"  %*d: %@\n", ((int)v7 + 1), objc_msgSend(v13, "unsignedIntValue"), v14];
        }
        uint64_t v10 = [v8 countByEnumeratingWithState:&v62 objects:v69 count:16];
      }
      while (v10);
    }

    v3 = v49;
    [v49 appendFormat:@"EV Step Info:\n%@\n", v4];
  }
  if ([(NSDictionary *)self->_legIndexToChargingStationInfos count])
  {
    uint64_t v15 = [MEMORY[0x1E4F28E78] string];
    uint64_t v16 = [(NSDictionary *)self->_legIndexToChargingStationInfos allKeys];
    v17 = [v16 sortedArrayUsingSelector:sel_compare_];

    double v18 = log10((double)(unint64_t)[v17 count]);
    long long v58 = 0u;
    long long v59 = 0u;
    long long v60 = 0u;
    long long v61 = 0u;
    id v19 = v17;
    uint64_t v20 = [v19 countByEnumeratingWithState:&v58 objects:v68 count:16];
    if (v20)
    {
      uint64_t v21 = v20;
      uint64_t v22 = *(void *)v59;
      do
      {
        for (uint64_t j = 0; j != v21; ++j)
        {
          if (*(void *)v59 != v22) {
            objc_enumerationMutation(v19);
          }
          uint64_t v24 = *(void **)(*((void *)&v58 + 1) + 8 * j);
          v25 = [(NSDictionary *)self->_legIndexToChargingStationInfos objectForKeyedSubscript:v24];
          [v15 appendFormat:@"  %*d: %@\n", ((int)v18 + 1), objc_msgSend(v24, "unsignedIntValue"), v25];
        }
        uint64_t v21 = [v19 countByEnumeratingWithState:&v58 objects:v68 count:16];
      }
      while (v21);
    }

    v3 = v49;
    [v49 appendFormat:@"EV Charging Station Info: \n%@\n", v15];
  }
  if ([(NSDictionary *)self->_originDisplayInfos count])
  {
    v26 = [MEMORY[0x1E4F28E78] string];
    v27 = [(NSDictionary *)self->_originDisplayInfos allKeys];
    v28 = [v27 sortedArrayUsingSelector:sel_compare_];

    double v29 = log10((double)(unint64_t)[v28 count]);
    long long v54 = 0u;
    long long v55 = 0u;
    long long v56 = 0u;
    long long v57 = 0u;
    id v30 = v28;
    uint64_t v31 = [v30 countByEnumeratingWithState:&v54 objects:v67 count:16];
    if (v31)
    {
      uint64_t v32 = v31;
      uint64_t v33 = *(void *)v55;
      do
      {
        for (uint64_t k = 0; k != v32; ++k)
        {
          if (*(void *)v55 != v33) {
            objc_enumerationMutation(v30);
          }
          unint64_t v35 = *(void **)(*((void *)&v54 + 1) + 8 * k);
          v36 = [(NSDictionary *)self->_originDisplayInfos objectForKeyedSubscript:v35];
          [v26 appendFormat:@"  %*d: %@\n", ((int)v29 + 1), objc_msgSend(v35, "unsignedIntValue"), v36];
        }
        uint64_t v32 = [v30 countByEnumeratingWithState:&v54 objects:v67 count:16];
      }
      while (v32);
    }

    v3 = v49;
    [v49 appendFormat:@"Origin Display Info: \n%@\n", v26];
  }
  if ([(NSDictionary *)self->_destinationDisplayInfos count])
  {
    v37 = [MEMORY[0x1E4F28E78] string];
    v38 = [(NSDictionary *)self->_destinationDisplayInfos allKeys];
    id v39 = [v38 sortedArrayUsingSelector:sel_compare_];

    double v40 = log10((double)(unint64_t)[v39 count]);
    long long v50 = 0u;
    long long v51 = 0u;
    long long v52 = 0u;
    long long v53 = 0u;
    id v41 = v39;
    uint64_t v42 = [v41 countByEnumeratingWithState:&v50 objects:v66 count:16];
    if (v42)
    {
      uint64_t v43 = v42;
      uint64_t v44 = *(void *)v51;
      do
      {
        for (uint64_t m = 0; m != v43; ++m)
        {
          if (*(void *)v51 != v44) {
            objc_enumerationMutation(v41);
          }
          long long v46 = *(void **)(*((void *)&v50 + 1) + 8 * m);
          long long v47 = [(NSDictionary *)self->_destinationDisplayInfos objectForKeyedSubscript:v46];
          [v37 appendFormat:@"  %*d: %@\n", ((int)v40 + 1), objc_msgSend(v46, "unsignedIntValue"), v47];
        }
        uint64_t v43 = [v41 countByEnumeratingWithState:&v50 objects:v66 count:16];
      }
      while (v43);
    }

    v3 = v49;
    [v49 appendFormat:@"Origin Display Info: \n%@\n", v37];
  }
  if (self->_rideSelections) {
    [v3 appendFormat:@"Ride Selections: %@\n", self->_rideSelections];
  }

  return v3;
}

- (GEOComposedRouteTraffic)traffic
{
  return self->_traffic;
}

- (void)setTraffic:(id)a3
{
}

- (NSArray)trafficDelayInfos
{
  return self->_trafficDelayInfos;
}

- (void)setTrafficDelayInfos:(id)a3
{
}

- (NSArray)updateableCameraInfos
{
  return self->_updateableCameraInfos;
}

- (void)setUpdateableCameraInfos:(id)a3
{
}

- (NSArray)rideSelections
{
  return self->_rideSelections;
}

- (void)setRideSelections:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_rideSelections, 0);
  objc_storeStrong((id *)&self->_destinationDisplayInfos, 0);
  objc_storeStrong((id *)&self->_originDisplayInfos, 0);
  objc_storeStrong((id *)&self->_legIndexToChargingStationInfos, 0);
  objc_storeStrong((id *)&self->_stepsIDToEVInfos, 0);
  objc_storeStrong((id *)&self->_updateableCameraInfos, 0);
  objc_storeStrong((id *)&self->_trafficDelayInfos, 0);

  objc_storeStrong((id *)&self->_traffic, 0);
}

@end