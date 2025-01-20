@interface GEOComposedRouteTraffic
+ (BOOL)supportsSecureCoding;
- (GEOComposedRouteTraffic)initWithCoder:(id)a3;
- (GEOComposedRouteTraffic)initWithColorInfos:(id)a3 incidentInfos:(id)a4;
- (GEOComposedRouteTraffic)initWithRoute:(id)a3 etaRoute:(id)a4;
- (GEOComposedRouteTraffic)initWithRoute:(id)a3 initializerData:(id)a4;
- (NSArray)offRouteIncidents;
- (NSArray)routeIncidents;
- (NSArray)routeTrafficColors;
- (NSArray)trafficIncidentOffsets;
- (NSArray)trafficIncidents;
- (id)_incidentsForRoute:(id)a3;
- (id)_incidentsForRoute:(id)a3 etaRoute:(id)a4;
- (id)_trafficColorInfosFromDebugSettingsForRoute:(id)a3;
- (id)_trafficColorInfosFromTrafficBuilder:(id)a3 route:(id)a4;
- (id)description;
- (unint64_t)trafficColorOffsetsCount;
- (unint64_t)trafficColorsCount;
- (unsigned)trafficColorOffsets;
- (unsigned)trafficColors;
- (void)_buildIncidentsForRoute:(id)a3 etaRoute:(id)a4 initializerData:(id)a5;
- (void)encodeWithCoder:(id)a3;
@end

@implementation GEOComposedRouteTraffic

- (GEOComposedRouteTraffic)initWithRoute:(id)a3 initializerData:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v15.receiver = self;
  v15.super_class = (Class)GEOComposedRouteTraffic;
  v8 = [(GEOComposedRouteTraffic *)&v15 init];
  if (v8)
  {
    if (GEOConfigGetUInteger(GeoServicesConfig_NavdDebugTrafficOnRouteSection, (uint64_t)off_1E9114728))
    {
      uint64_t v9 = [(GEOComposedRouteTraffic *)v8 _trafficColorInfosFromDebugSettingsForRoute:v6];
      trafficColors = (GEORouteTrafficBuilder *)v8->_trafficColors;
      v8->_trafficColors = (NSArray *)v9;
    }
    else
    {
      trafficColors = objc_alloc_init(GEORouteTrafficBuilder);
      [(GEORouteTrafficBuilder *)trafficColors buildTrafficForRoute:v6];
      uint64_t v11 = [(GEOComposedRouteTraffic *)v8 _trafficColorInfosFromTrafficBuilder:trafficColors route:v6];
      v12 = v8->_trafficColors;
      v8->_trafficColors = (NSArray *)v11;
    }
    [(GEOComposedRouteTraffic *)v8 _buildIncidentsForRoute:v6 etaRoute:0 initializerData:v7];
    v13 = v8;
  }

  return v8;
}

- (GEOComposedRouteTraffic)initWithRoute:(id)a3 etaRoute:(id)a4
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  v8 = [v6 uniqueRouteID];
  uint64_t v9 = [v7 uniqueRouteID];
  char v10 = [v8 isEqual:v9];

  if ((v10 & 1) == 0)
  {
    v13 = GEOGetGEOComposedRouteTrafficLog();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      v14 = [v7 uniqueRouteID];
      objc_super v15 = [v6 uniqueRouteID];
      *(_DWORD *)buf = 138412546;
      v25 = v14;
      __int16 v26 = 2112;
      v27 = v15;
      _os_log_impl(&dword_188D96000, v13, OS_LOG_TYPE_ERROR, "GEOComposedETARoute ID (%@) is not equal to GEOComposedRoute ID (%@). Skipping traffic creation.", buf, 0x16u);
    }
    v16 = [v6 uniqueRouteID];
    v17 = [v7 uniqueRouteID];
    char v18 = [v16 isEqual:v17];

    if ((v18 & 1) == 0 && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_fault_impl(&dword_188D96000, MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT, "Assertion failed: [route.uniqueRouteID isEqual:etaRoute.uniqueRouteID]", buf, 2u);
    }
    goto LABEL_8;
  }
  v23.receiver = self;
  v23.super_class = (Class)GEOComposedRouteTraffic;
  self = [(GEOComposedRouteTraffic *)&v23 init];
  if (!self)
  {
LABEL_8:
    v19 = 0;
    goto LABEL_11;
  }
  if (GEOConfigGetUInteger(GeoServicesConfig_NavdDebugTrafficOnRouteSection, (uint64_t)off_1E9114728))
  {
    uint64_t v11 = [(GEOComposedRouteTraffic *)self _trafficColorInfosFromDebugSettingsForRoute:v6];
    trafficColors = (GEORouteTrafficBuilder *)self->_trafficColors;
    self->_trafficColors = v11;
  }
  else
  {
    trafficColors = objc_alloc_init(GEORouteTrafficBuilder);
    [(GEORouteTrafficBuilder *)trafficColors buildTrafficForRoute:v6 etaRoute:v7];
    v20 = [(GEOComposedRouteTraffic *)self _trafficColorInfosFromTrafficBuilder:trafficColors route:v6];
    v21 = self->_trafficColors;
    self->_trafficColors = v20;
  }
  [(GEOComposedRouteTraffic *)self _buildIncidentsForRoute:v6 etaRoute:v7 initializerData:0];
  self = self;
  v19 = self;
LABEL_11:

  return v19;
}

- (GEOComposedRouteTraffic)initWithColorInfos:(id)a3 incidentInfos:(id)a4
{
  v18[1] = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  v17.receiver = self;
  v17.super_class = (Class)GEOComposedRouteTraffic;
  uint64_t v9 = [(GEOComposedRouteTraffic *)&v17 init];
  char v10 = v9;
  if (v9)
  {
    p_trafficColors = (void **)&v9->_trafficColors;
    objc_storeStrong((id *)&v9->_trafficColors, a3);
    objc_storeStrong((id *)&v10->_incidents, a4);
    if (![(NSArray *)v10->_trafficColors count])
    {
      v12 = objc_alloc_init(GEOComposedRouteTrafficColorInfo);
      [(GEOComposedRouteTrafficColorInfo *)v12 setColor:4];
      [(GEOComposedRouteTrafficColorInfo *)v12 setOffsetMeters:0.0];
      [(GEOComposedRouteTrafficColorInfo *)v12 setRouteCoordinate:0];
      v18[0] = v12;
      uint64_t v13 = [MEMORY[0x1E4F1C978] arrayWithObjects:v18 count:1];
      v14 = *p_trafficColors;
      *p_trafficColors = (void *)v13;
    }
    objc_super v15 = v10;
  }

  return v10;
}

- (id)_trafficColorInfosFromTrafficBuilder:(id)a3 route:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  id v7 = [v5 trafficColors];
  id v8 = [v5 trafficOffsets];
  uint64_t v9 = [v7 count];
  if (v9 != [v8 count])
  {
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)v20 = 0;
      _os_log_fault_impl(&dword_188D96000, MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT, "Assertion failed: trafficBuilderColors.count == trafficBuilderOffsets.count", v20, 2u);
    }
    goto LABEL_9;
  }
  uint64_t v10 = [v7 count];
  if (v10 != [v8 count])
  {
LABEL_9:
    uint64_t v11 = 0;
    goto LABEL_10;
  }
  uint64_t v11 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(v7, "count"));
  if ([v7 count])
  {
    unint64_t v12 = 0;
    do
    {
      uint64_t v13 = [v7 objectAtIndexedSubscript:v12];
      unsigned int v14 = [v13 unsignedIntegerValue];

      objc_super v15 = [v8 objectAtIndexedSubscript:v12];
      [v15 doubleValue];
      double v17 = v16;

      char v18 = objc_alloc_init(GEOComposedRouteTrafficColorInfo);
      [(GEOComposedRouteTrafficColorInfo *)v18 setColor:v14];
      [(GEOComposedRouteTrafficColorInfo *)v18 setOffsetMeters:v17];
      [(GEOComposedRouteTrafficColorInfo *)v18 offsetMeters];
      -[GEOComposedRouteTrafficColorInfo setRouteCoordinate:](v18, "setRouteCoordinate:", objc_msgSend(v6, "coordinateAtOffset:"));
      [v11 addObject:v18];

      ++v12;
    }
    while (v12 < [v7 count]);
  }
LABEL_10:

  return v11;
}

- (id)_trafficColorInfosFromDebugSettingsForRoute:(id)a3
{
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  uint64_t UInteger = GEOConfigGetUInteger(GeoServicesConfig_NavdDebugTrafficOnRouteSection, (uint64_t)off_1E9114728);
  uint64_t v5 = GEOConfigGetUInteger(GeoServicesConfig_NavdDebugTrafficOnRouteColor, (uint64_t)off_1E9114738);
  double v6 = (double)(unint64_t)GEOConfigGetUInteger(GeoServicesConfig_NavdDebugTrafficOnRouteStart, (uint64_t)off_1E9114748)* 0.01;
  double v7 = (double)(unint64_t)GEOConfigGetUInteger(GeoServicesConfig_NavdDebugTrafficOnRouteEnd, (uint64_t)off_1E9114758)* 0.01;
  if (v7 <= v6)
  {
    v20 = 0;
  }
  else
  {
    [v3 distance];
    if (UInteger == 2)
    {
      long long v34 = 0u;
      long long v35 = 0u;
      long long v32 = 0u;
      long long v33 = 0u;
      uint64_t v9 = objc_msgSend(v3, "steps", 0);
      uint64_t v10 = [v9 countByEnumeratingWithState:&v32 objects:v36 count:16];
      if (v10)
      {
        uint64_t v11 = v10;
        unint64_t v12 = 0;
        uint64_t v13 = *(void *)v33;
        do
        {
          for (uint64_t i = 0; i != v11; ++i)
          {
            if (*(void *)v33 != v13) {
              objc_enumerationMutation(v9);
            }
            objc_super v15 = *(void **)(*((void *)&v32 + 1) + 8 * i);
            [v15 distance];
            double v17 = v16;
            [v12 distance];
            if (v17 > v18)
            {
              id v19 = v15;

              unint64_t v12 = v19;
            }
          }
          uint64_t v11 = [v9 countByEnumeratingWithState:&v32 objects:v36 count:16];
        }
        while (v11);
      }
      else
      {
        unint64_t v12 = 0;
      }

      objc_msgSend(v3, "distanceFromStartToRouteCoordinate:", objc_msgSend(v12, "startRouteCoordinate"));
      double v22 = v23;
      [v12 distance];
      double v21 = v24;
    }
    else
    {
      double v21 = v8;
      double v22 = 0.0;
    }
    double v25 = v22 + v6 * v21;
    double v26 = v22 + v7 * v21;
    v20 = [MEMORY[0x1E4F1CA48] arrayWithCapacity:3];
    if (v25 > 0.0)
    {
      v27 = objc_alloc_init(GEOComposedRouteTrafficColorInfo);
      [(GEOComposedRouteTrafficColorInfo *)v27 setColor:4];
      [(GEOComposedRouteTrafficColorInfo *)v27 setOffsetMeters:0.0];
      [(GEOComposedRouteTrafficColorInfo *)v27 offsetMeters];
      -[GEOComposedRouteTrafficColorInfo setRouteCoordinate:](v27, "setRouteCoordinate:", objc_msgSend(v3, "coordinateAtOffset:"));
      [v20 addObject:v27];
    }
    uint64_t v28 = objc_alloc_init(GEOComposedRouteTrafficColorInfo);
    [(GEOComposedRouteTrafficColorInfo *)v28 setColor:v5];
    [(GEOComposedRouteTrafficColorInfo *)v28 setOffsetMeters:v25];
    [(GEOComposedRouteTrafficColorInfo *)v28 offsetMeters];
    -[GEOComposedRouteTrafficColorInfo setRouteCoordinate:](v28, "setRouteCoordinate:", objc_msgSend(v3, "coordinateAtOffset:"));
    [v20 addObject:v28];
    [v3 distance];
    if (v26 < v29)
    {
      v30 = objc_alloc_init(GEOComposedRouteTrafficColorInfo);
      [(GEOComposedRouteTrafficColorInfo *)v30 setColor:4];
      [(GEOComposedRouteTrafficColorInfo *)v30 setOffsetMeters:v26];
      [(GEOComposedRouteTrafficColorInfo *)v30 offsetMeters];
      -[GEOComposedRouteTrafficColorInfo setRouteCoordinate:](v30, "setRouteCoordinate:", objc_msgSend(v3, "coordinateAtOffset:"));
      [v20 addObject:v30];
    }
  }

  return v20;
}

- (void)_buildIncidentsForRoute:(id)a3 etaRoute:(id)a4 initializerData:(id)a5
{
  id v19 = a3;
  id v7 = a4;
  double v8 = [v19 geoWaypointRoute];

  if (v8)
  {
    uint64_t v9 = [v19 uniqueRouteID];
    uint64_t v10 = [v7 uniqueRouteID];
    int v11 = [v9 isEqual:v10];

    if (v11) {
      [(GEOComposedRouteTraffic *)self _incidentsForRoute:v19 etaRoute:v7];
    }
    else {
    unint64_t v12 = [(GEOComposedRouteTraffic *)self _incidentsForRoute:v19];
    }
    incidents = self->_incidents;
    self->_incidents = v12;

    unsigned int v14 = [v19 routeInitializerData];
    objc_super v15 = [v14 directionsResponse];

    double v16 = [v15 incidentsOffRoutes];
    objc_msgSend(v16, "_geo_map:", &__block_literal_global_138);
    double v17 = (NSArray *)objc_claimAutoreleasedReturnValue();
    offRouteIncidents = self->_offRouteIncidents;
    self->_offRouteIncidents = v17;
  }
}

GEOComposedRouteTrafficIncidentInfo *__76__GEOComposedRouteTraffic__buildIncidentsForRoute_etaRoute_initializerData___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  id v3 = objc_alloc_init(GEOComposedRouteTrafficIncidentInfo);
  [(GEOComposedRouteTrafficIncidentInfo *)v3 setIncident:v2];
  v4 = [v2 position];

  [v4 coordinate];
  -[GEOComposedRouteTrafficIncidentInfo setCoordinate:](v3, "setCoordinate:");

  return v3;
}

- (id)_incidentsForRoute:(id)a3
{
  uint64_t v43 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  v4 = [MEMORY[0x1E4F1CA48] array];
  uint64_t v5 = [v3 geoWaypointRoute];
  double v6 = [v3 legs];
  uint64_t v7 = [v6 count];
  double v8 = [v5 routeLegs];
  uint64_t v9 = [v8 count];

  if (v7 == v9)
  {
    uint64_t v10 = [v5 incidentsOnRouteLegs];
    int v11 = [v3 legs];
    uint64_t v12 = [v11 count];

    if (v12)
    {
      uint64_t v14 = 0;
      double v15 = 0.0;
      unint64_t v16 = 0x1E53D3000;
      *(void *)&long long v13 = 67109376;
      long long v36 = v13;
      uint64_t v37 = v5;
      while (1)
      {
        double v17 = objc_msgSend(v5, "routeLegs", v36);
        double v18 = [v17 objectAtIndexedSubscript:v14];

        uint64_t v19 = [v18 incidentIndicesCount];
        if (v19 != [v18 incidentEndOffsetsInRoutesCount])
        {
          v20 = GEOGetGEOComposedRouteTrafficLog();
          if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
          {
            int v21 = [v18 incidentIndicesCount];
            int v22 = [v18 incidentEndOffsetsInRoutesCount];
            *(_DWORD *)buf = v36;
            int v40 = v21;
            unint64_t v16 = 0x1E53D3000uLL;
            __int16 v41 = 1024;
            int v42 = v22;
            _os_log_impl(&dword_188D96000, v20, OS_LOG_TYPE_ERROR, "GEORoute incidentIndicesCount (%d) not equal to incidentEndOffsetsInRoutesCount (%d). This is a server error.", buf, 0xEu);
          }

          uint64_t v23 = [v18 incidentIndicesCount];
          if (v23 != [v18 incidentEndOffsetsInRoutesCount]) {
            break;
          }
        }
        uint64_t v38 = v14;
        if ([v18 incidentIndicesCount])
        {
          unint64_t v24 = 0;
          do
          {
            unsigned int v25 = *(_DWORD *)([v18 incidentEndOffsetsInRoutes] + 4 * v24) + v15;
            double v26 = objc_msgSend(v10, "objectAtIndexedSubscript:", *(unsigned int *)(objc_msgSend(v18, "incidentIndices") + 4 * v24));
            id v27 = objc_alloc_init(*(Class *)(v16 + 2712));
            [v27 setIncident:v26];
            uint64_t v28 = [v26 position];
            [v28 coordinate];
            objc_msgSend(v27, "setCoordinate:");

            [v27 setOffsetMeters:(double)v25];
            [v27 offsetMeters];
            objc_msgSend(v27, "setRouteCoordinate:", objc_msgSend(v3, "coordinateAtOffset:"));
            [v4 addObject:v27];

            unint64_t v16 = 0x1E53D3000;
            ++v24;
          }
          while (v24 < [v18 incidentIndicesCount]);
        }
        double v29 = [v3 legs];
        v30 = [v29 objectAtIndexedSubscript:v14];

        [v30 distance];
        double v15 = v15 + v31;

        ++v14;
        long long v32 = [v3 legs];
        unint64_t v33 = [v32 count];

        uint64_t v5 = v37;
        if (v38 + 1 >= v33) {
          goto LABEL_12;
        }
      }
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_fault_impl(&dword_188D96000, MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT, "Assertion failed: geoRouteLeg.incidentIndicesCount == geoRouteLeg.incidentEndOffsetsInRoutesCount", buf, 2u);
      }

      id v34 = 0;
    }
    else
    {
LABEL_12:
      id v34 = v4;
    }
  }
  else
  {
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_fault_impl(&dword_188D96000, MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT, "Assertion failed: route.legs.count == geoWaypointRoute.routeLegs.count", buf, 2u);
    }
    id v34 = 0;
  }

  return v34;
}

- (id)_incidentsForRoute:(id)a3 etaRoute:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  uint64_t v7 = [v6 geoETAWaypointRoute];
  [v5 distance];
  double v9 = v8;
  [v6 length];
  if (v9 < (double)(int)v10)
  {
    if (!os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT))
    {
LABEL_26:
      id v51 = 0;
      goto LABEL_17;
    }
    __int16 v61 = 0;
    v53 = MEMORY[0x1E4F14500];
    v54 = "Assertion failed: route.distance >= (int) etaRoute.length";
    v55 = (uint8_t *)&v61;
LABEL_28:
    _os_log_fault_impl(&dword_188D96000, v53, OS_LOG_TYPE_FAULT, v54, v55, 2u);
    goto LABEL_26;
  }
  int v11 = [v5 legs];
  unint64_t v12 = [v11 count];
  long long v13 = [v7 routeLegs];
  unint64_t v14 = [v13 count];

  if (v12 < v14)
  {
    if (!os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT)) {
      goto LABEL_26;
    }
    *(_WORD *)v60 = 0;
    v53 = MEMORY[0x1E4F14500];
    v54 = "Assertion failed: route.legs.count >= geoETAWaypointRoute.routeLegs.count";
    v55 = v60;
    goto LABEL_28;
  }
  [v5 distance];
  double v16 = v15;
  id v56 = v6;
  [v6 length];
  double v18 = v17;
  uint64_t v19 = [v5 legs];
  uint64_t v20 = [v19 count];
  int v21 = [v7 routeLegs];
  uint64_t v22 = [v21 count];

  double v23 = 0.0;
  uint64_t v24 = v20 - v22;
  if (v20 != v22)
  {
    uint64_t v25 = 0;
    do
    {
      double v26 = [v5 legs];
      id v27 = [v26 objectAtIndexedSubscript:v25];
      [v27 distance];
      double v23 = v23 + v28;

      ++v25;
    }
    while (v24 != v25);
  }
  double v29 = [MEMORY[0x1E4F1CA48] array];
  v30 = [v7 incidentsOnUserWaypointRoutes];
  double v31 = [v7 routeLegs];
  uint64_t v32 = [v31 count];

  if (v32)
  {
    unint64_t v33 = 0;
    double v34 = v16 - v18;
    uint64_t v57 = v24;
    v58 = v7;
    while (1)
    {
      long long v35 = [v7 routeLegs];
      long long v36 = [v35 objectAtIndexedSubscript:v33];

      uint64_t v37 = [v36 incidentIndexsCount];
      if (v37 != [v36 incidentEndOffsetsInETARoutesCount]) {
        break;
      }
      if ([v36 incidentIndexsCount])
      {
        unint64_t v38 = 0;
        if (v33) {
          double v39 = v23;
        }
        else {
          double v39 = v34;
        }
        do
        {
          int v40 = objc_msgSend(v30, "objectAtIndexedSubscript:", *(unsigned int *)(objc_msgSend(v36, "incidentIndexs") + 4 * v38));
          LODWORD(v41) = *(_DWORD *)([v36 incidentEndOffsetsInETARoutes] + 4 * v38);
          double v42 = v39 + (double)v41;
          uint64_t v43 = objc_alloc_init(GEOComposedRouteTrafficIncidentInfo);
          [(GEOComposedRouteTrafficIncidentInfo *)v43 setIncident:v40];
          v44 = [v40 position];
          [v44 coordinate];
          -[GEOComposedRouteTrafficIncidentInfo setCoordinate:](v43, "setCoordinate:");

          [(GEOComposedRouteTrafficIncidentInfo *)v43 setOffsetMeters:v42];
          [(GEOComposedRouteTrafficIncidentInfo *)v43 offsetMeters];
          -[GEOComposedRouteTrafficIncidentInfo setRouteCoordinate:](v43, "setRouteCoordinate:", objc_msgSend(v5, "coordinateAtOffset:"));
          [v29 addObject:v43];

          ++v38;
        }
        while (v38 < [v36 incidentIndexsCount]);
      }
      v45 = [v5 legs];
      v46 = [v45 objectAtIndexedSubscript:v33 + v57];

      [v46 distance];
      double v48 = v47;

      double v23 = v23 + v48;
      ++v33;
      uint64_t v7 = v58;
      v49 = [v58 routeLegs];
      unint64_t v50 = [v49 count];

      if (v33 >= v50) {
        goto LABEL_15;
      }
    }
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_fault_impl(&dword_188D96000, MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT, "Assertion failed: geoETARouteLeg.incidentIndexsCount == geoETARouteLeg.incidentEndOffsetsInETARoutesCount", buf, 2u);
    }

    id v51 = 0;
  }
  else
  {
LABEL_15:
    id v51 = v29;
  }
  id v6 = v56;

LABEL_17:

  return v51;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (GEOComposedRouteTraffic)initWithCoder:(id)a3
{
  id v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)GEOComposedRouteTraffic;
  id v5 = [(GEOComposedRouteTraffic *)&v14 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeArrayOfObjectsOfClass:objc_opt_class() forKey:@"_trafficColors"];
    trafficColors = v5->_trafficColors;
    v5->_trafficColors = (NSArray *)v6;

    uint64_t v8 = [v4 decodeArrayOfObjectsOfClass:objc_opt_class() forKey:@"_incidents"];
    incidents = v5->_incidents;
    v5->_incidents = (NSArray *)v8;

    uint64_t v10 = [v4 decodeArrayOfObjectsOfClass:objc_opt_class() forKey:@"_offRouteIncidents"];
    offRouteIncidents = v5->_offRouteIncidents;
    v5->_offRouteIncidents = (NSArray *)v10;

    unint64_t v12 = v5;
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  trafficColors = self->_trafficColors;
  id v5 = a3;
  [v5 encodeObject:trafficColors forKey:@"_trafficColors"];
  [v5 encodeObject:self->_incidents forKey:@"_incidents"];
  [v5 encodeObject:self->_offRouteIncidents forKey:@"_offRouteIncidents"];
}

- (id)description
{
  id v3 = [MEMORY[0x1E4F28E78] string];
  id v4 = [(NSArray *)self->_trafficColors componentsJoinedByString:@", "];
  [v3 appendFormat:@"%@", v4];

  if ([(NSArray *)self->_incidents count])
  {
    id v5 = [(NSArray *)self->_incidents componentsJoinedByString:@"\n\t"];
    [v3 appendFormat:@"\nIncidents on route:\n\t%@", v5];
  }
  if ([(NSArray *)self->_offRouteIncidents count])
  {
    uint64_t v6 = [(NSArray *)self->_offRouteIncidents componentsJoinedByString:@"\n\t"];
    [v3 appendFormat:@"\nIncidents off route:\n\t%@", v6];
  }

  return v3;
}

- (NSArray)routeTrafficColors
{
  return self->_trafficColors;
}

- (NSArray)routeIncidents
{
  return self->_incidents;
}

- (NSArray)offRouteIncidents
{
  return self->_offRouteIncidents;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_offRouteIncidents, 0);
  objc_storeStrong((id *)&self->_incidents, 0);

  objc_storeStrong((id *)&self->_trafficColors, 0);
}

- (NSArray)trafficIncidents
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v3 = [MEMORY[0x1E4F1CA48] array];
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v4 = self->_incidents;
  uint64_t v5 = [(NSArray *)v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v12;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v12 != v7) {
          objc_enumerationMutation(v4);
        }
        double v9 = objc_msgSend(*(id *)(*((void *)&v11 + 1) + 8 * i), "incident", (void)v11);
        [v3 addObject:v9];
      }
      uint64_t v6 = [(NSArray *)v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v6);
  }

  return (NSArray *)v3;
}

- (NSArray)trafficIncidentOffsets
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v3 = [MEMORY[0x1E4F1CA48] array];
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v4 = self->_incidents;
  uint64_t v5 = [(NSArray *)v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v13;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v13 != v7) {
          objc_enumerationMutation(v4);
        }
        double v9 = NSNumber;
        objc_msgSend(*(id *)(*((void *)&v12 + 1) + 8 * i), "offsetMeters", (void)v12);
        uint64_t v10 = objc_msgSend(v9, "numberWithDouble:");
        [v3 addObject:v10];
      }
      uint64_t v6 = [(NSArray *)v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v6);
  }

  return (NSArray *)v3;
}

- (unsigned)trafficColors
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v3 = [MEMORY[0x1E4F1CA58] data];
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v4 = self->_trafficColors;
  uint64_t v5 = [(NSArray *)v4 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v15;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v15 != v7) {
          objc_enumerationMutation(v4);
        }
        double v9 = *(void **)(*((void *)&v14 + 1) + 8 * v8);
        int v13 = 0;
        int v13 = [v9 color];
        [v3 appendBytes:&v13 length:4];
        ++v8;
      }
      while (v6 != v8);
      uint64_t v6 = [(NSArray *)v4 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v6);
  }

  id v10 = v3;
  long long v11 = (unsigned int *)[v10 bytes];

  return v11;
}

- (unint64_t)trafficColorsCount
{
  return [(NSArray *)self->_trafficColors count];
}

- (unsigned)trafficColorOffsets
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v3 = [MEMORY[0x1E4F1CA58] data];
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v4 = self->_trafficColors;
  uint64_t v5 = [(NSArray *)v4 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v16;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v16 != v7) {
          objc_enumerationMutation(v4);
        }
        double v9 = *(void **)(*((void *)&v15 + 1) + 8 * v8);
        unsigned int v14 = 0;
        [v9 offsetMeters];
        unsigned int v14 = v10;
        [v3 appendBytes:&v14 length:4];
        ++v8;
      }
      while (v6 != v8);
      uint64_t v6 = [(NSArray *)v4 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v6);
  }

  id v11 = v3;
  long long v12 = (unsigned int *)[v11 bytes];

  return v12;
}

- (unint64_t)trafficColorOffsetsCount
{
  return [(NSArray *)self->_trafficColors count];
}

@end