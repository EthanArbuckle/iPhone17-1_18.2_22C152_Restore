@interface _GEOMapItemTransitInfo
- (BOOL)hasTransitIncidentComponent;
- (BOOL)isTransitIncidentsTTLExpired;
- (GEOComposedRoute)composedRoute;
- (GEOTransitNearbySchedule)nearbySchedule;
- (NSArray)connections;
- (NSArray)departureSequences;
- (NSArray)incidents;
- (NSArray)labelItems;
- (NSArray)lines;
- (NSArray)systems;
- (NSArray)transitTripStops;
- (NSDate)lastFullScheduleValidDate;
- (NSString)displayName;
- (NSString)subtitle;
- (NSString)title;
- (_GEOMapItemTransitInfo)initWithTransitInfo:(id)a3 schedule:(id)a4 timeZone:(id)a5 incidents:(id)a6 hasTransitIncidentComponent:(BOOL)a7 incidentExpirationDate:(id)a8 providerID:(int)a9 coordinate:(id)a10 transitStops:(id)a11 composedRoute:(id)a12 nearbySchedule:(id)a13;
- (double)timeToLive;
- (id)_departureSequencesForSystem:(id)a3 excludingIncidentEntities:(id)a4 container:(id)a5 validForDateFromBlock:(id)a6;
- (id)_departureSequencesForSystem:(id)a3 excludingIncidentEntities:(id)a4 ignoreDirectionFilter:(BOOL)a5 direction:(id)a6 validForDateFromBlock:(id)a7;
- (id)allSequencesForSystem:(id)a3 container:(id)a4;
- (id)allSequencesForSystem:(id)a3 direction:(id)a4;
- (id)departureSequenceContainersForSystem:(id)a3 excludingIncidentEntities:(id)a4 validForDateFromBlock:(id)a5;
- (id)departureSequencesForSystem:(id)a3 excludingIncidentEntities:(id)a4 direction:(id)a5 validForDateFromBlock:(id)a6;
- (id)directionsForSystem:(id)a3 excludingIncidentEntities:(id)a4 validForDateFromBlock:(id)a5 hasSequencesWithNoDirection:(BOOL *)a6;
- (id)headSignsForLine:(id)a3;
- (id)inactiveLinesForSystem:(id)a3 relativeToDateFromBlock:(id)a4 excludingIncidentEntities:(id)a5 usingContainers:(BOOL)a6;
- (id)linesForSystem:(id)a3;
- (id)serviceResumesResultForLine:(id)a3 excludingIncidentEntities:(id)a4 afterDate:(id)a5 usingContainers:(BOOL)a6;
- (unint64_t)linesCount;
- (unint64_t)numAdditionalDeparturesForSequence:(id)a3;
- (unint64_t)systemsCount;
@end

@implementation _GEOMapItemTransitInfo

- (_GEOMapItemTransitInfo)initWithTransitInfo:(id)a3 schedule:(id)a4 timeZone:(id)a5 incidents:(id)a6 hasTransitIncidentComponent:(BOOL)a7 incidentExpirationDate:(id)a8 providerID:(int)a9 coordinate:(id)a10 transitStops:(id)a11 composedRoute:(id)a12 nearbySchedule:(id)a13
{
  double var1 = a10.var1;
  double var0 = a10.var0;
  uint64_t v58 = *MEMORY[0x1E4F143B8];
  id v50 = a3;
  id v49 = a4;
  id v48 = a5;
  id v47 = a6;
  id v46 = a8;
  id v51 = a11;
  id v45 = a12;
  id v44 = a13;
  v56.receiver = self;
  v56.super_class = (Class)_GEOMapItemTransitInfo;
  v22 = [(_GEOMapItemTransitInfo *)&v56 init];
  v23 = v22;
  if (v22)
  {
    p_transitInfo = (uint64_t *)&v22->_transitInfo;
    objc_storeStrong((id *)&v22->_transitInfo, a3);
    objc_storeStrong((id *)&v23->_transitSchedule, a4);
    objc_storeStrong((id *)&v23->_timeZone, a5);
    objc_storeStrong((id *)&v23->_incidents, a6);
    objc_storeStrong((id *)&v23->_incidentExpirationDate, a8);
    v23->_hasTransitIncidentComponent = a7;
    v23->_coordinate.latitude = var0;
    v23->_coordinate.longitude = var1;
    uint64_t v25 = [v51 copy];
    transitStops = v23->_transitStops;
    v23->_transitStops = (NSArray *)v25;

    objc_storeStrong((id *)&v23->_composedRoute, a12);
    objc_storeStrong((id *)&v23->_unprocessedNearbySchedule, a13);
    transitInfo = v23->_transitInfo;
    if (transitInfo)
    {
      -[GEOPDTransitInfo _readTransitConnections]((uint64_t)v23->_transitInfo);
      if ([(NSMutableArray *)transitInfo->_transitConnections count])
      {
        id v28 = objc_alloc(MEMORY[0x1E4F1CA48]);
        uint64_t v29 = *p_transitInfo;
        if (*p_transitInfo)
        {
          -[GEOPDTransitInfo _readTransitConnections](*p_transitInfo);
          uint64_t v30 = [*(id *)(v29 + 80) count];
        }
        else
        {
          uint64_t v30 = 0;
        }
        v31 = (NSArray *)[v28 initWithCapacity:v30];
        long long v52 = 0u;
        long long v53 = 0u;
        long long v54 = 0u;
        long long v55 = 0u;
        v32 = -[GEOPDTransitInfo transitConnections]((id *)*p_transitInfo);
        uint64_t v33 = [v32 countByEnumeratingWithState:&v52 objects:v57 count:16];
        if (v33)
        {
          uint64_t v34 = v33;
          uint64_t v35 = *(void *)v53;
          do
          {
            for (uint64_t i = 0; i != v34; ++i)
            {
              if (*(void *)v53 != v35) {
                objc_enumerationMutation(v32);
              }
              v37 = [[_GEOTransitConnectionInfo alloc] initWithConnection:*(void *)(*((void *)&v52 + 1) + 8 * i) providerID:a9];
              [(NSArray *)v31 addObject:v37];
            }
            uint64_t v34 = [v32 countByEnumeratingWithState:&v52 objects:v57 count:16];
          }
          while (v34);
        }

        connections = v23->_connections;
        v23->_connections = v31;
      }
      uint64_t v39 = *p_transitInfo;
      if (*p_transitInfo)
      {
        -[GEOPDTransitInfo _readSearchDisplayName](*p_transitInfo);
        if (*(void *)(v39 + 40))
        {
          v40 = -[GEOPDTransitInfo searchDisplayName]((id *)&v23->_transitInfo->super.super.isa);
          uint64_t v41 = [v40 copy];
          displayName = v23->_displayName;
          v23->_displayName = (NSString *)v41;
        }
      }
    }
  }

  return v23;
}

- (NSArray)labelItems
{
  return (NSArray *)-[GEOPDTransitInfo labels]((id *)&self->_transitInfo->super.super.isa);
}

- (NSArray)connections
{
  return self->_connections;
}

- (NSArray)systems
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  systems = self->_systems;
  if (!systems)
  {
    id v4 = objc_alloc(MEMORY[0x1E4F1CA48]);
    transitInfo = self->_transitInfo;
    if (transitInfo)
    {
      -[GEOPDTransitInfo _readSystems]((uint64_t)self->_transitInfo);
      uint64_t v6 = [(NSMutableArray *)transitInfo->_systems count];
    }
    else
    {
      uint64_t v6 = 0;
    }
    v7 = (void *)[v4 initWithCapacity:v6];
    long long v17 = 0u;
    long long v18 = 0u;
    long long v19 = 0u;
    long long v20 = 0u;
    v8 = -[GEOPDTransitInfo systems]((id *)&self->_transitInfo->super.super.isa);
    uint64_t v9 = [v8 countByEnumeratingWithState:&v17 objects:v21 count:16];
    if (v9)
    {
      uint64_t v10 = v9;
      uint64_t v11 = *(void *)v18;
      do
      {
        uint64_t v12 = 0;
        do
        {
          if (*(void *)v18 != v11) {
            objc_enumerationMutation(v8);
          }
          v13 = objc_msgSend(*(id *)(*((void *)&v17 + 1) + 8 * v12), "geoTransitSystem", (void)v17);
          [v7 addObject:v13];

          ++v12;
        }
        while (v10 != v12);
        uint64_t v10 = [v8 countByEnumeratingWithState:&v17 objects:v21 count:16];
      }
      while (v10);
    }

    v14 = (NSArray *)[objc_alloc(MEMORY[0x1E4F1C978]) initWithArray:v7];
    v15 = self->_systems;
    self->_systems = v14;

    systems = self->_systems;
  }

  return systems;
}

- (unint64_t)systemsCount
{
  v2 = [(_GEOMapItemTransitInfo *)self systems];
  unint64_t v3 = [v2 count];

  return v3;
}

- (NSArray)lines
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  lines = self->_lines;
  if (!lines)
  {
    id v4 = objc_alloc(MEMORY[0x1E4F1CA48]);
    transitInfo = self->_transitInfo;
    if (transitInfo)
    {
      -[GEOPDTransitInfo _readLines]((uint64_t)self->_transitInfo);
      uint64_t v6 = [(NSMutableArray *)transitInfo->_lines count];
    }
    else
    {
      uint64_t v6 = 0;
    }
    v7 = (void *)[v4 initWithCapacity:v6];
    long long v21 = 0u;
    long long v22 = 0u;
    long long v23 = 0u;
    long long v24 = 0u;
    v8 = -[GEOPDTransitInfo lines]((id *)&self->_transitInfo->super.super.isa);
    uint64_t v9 = [v8 countByEnumeratingWithState:&v21 objects:v25 count:16];
    if (v9)
    {
      uint64_t v10 = v9;
      uint64_t v11 = *(void *)v22;
      do
      {
        for (uint64_t i = 0; i != v10; ++i)
        {
          if (*(void *)v22 != v11) {
            objc_enumerationMutation(v8);
          }
          v13 = *(void **)(*((void *)&v21 + 1) + 8 * i);
          unsigned int v14 = objc_msgSend(v13, "systemIndex", (void)v21);
          if ([(_GEOMapItemTransitInfo *)self systemsCount] <= v14)
          {
            v16 = 0;
          }
          else
          {
            v15 = [(_GEOMapItemTransitInfo *)self systems];
            v16 = [v15 objectAtIndex:v14];
          }
          long long v17 = objc_msgSend(v13, "geoTransitLineWithSystem:locationHint:", v16, self->_coordinate.latitude, self->_coordinate.longitude);
          [v7 addObject:v17];
        }
        uint64_t v10 = [v8 countByEnumeratingWithState:&v21 objects:v25 count:16];
      }
      while (v10);
    }

    long long v18 = (NSArray *)[objc_alloc(MEMORY[0x1E4F1C978]) initWithArray:v7];
    long long v19 = self->_lines;
    self->_lines = v18;

    lines = self->_lines;
  }

  return lines;
}

- (unint64_t)linesCount
{
  v2 = [(_GEOMapItemTransitInfo *)self lines];
  unint64_t v3 = [v2 count];

  return v3;
}

- (id)linesForSystem:(id)a3
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", -[_GEOMapItemTransitInfo linesCount](self, "linesCount"));
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  uint64_t v6 = [(_GEOMapItemTransitInfo *)self lines];
  uint64_t v7 = [v6 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v17;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v17 != v9) {
          objc_enumerationMutation(v6);
        }
        uint64_t v11 = *(void **)(*((void *)&v16 + 1) + 8 * i);
        uint64_t v12 = [v11 system];
        uint64_t v13 = [v12 muid];
        uint64_t v14 = [v4 muid];

        if (v13 == v14) {
          [v5 addObject:v11];
        }
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v8);
  }

  return v5;
}

- (NSArray)incidents
{
  return self->_incidents;
}

- (BOOL)isTransitIncidentsTTLExpired
{
  incidentExpirationDate = self->_incidentExpirationDate;
  if (incidentExpirationDate)
  {
    [(NSDate *)incidentExpirationDate timeIntervalSinceNow];
    LOBYTE(incidentExpirationDate) = v3 <= 0.0;
  }
  return (char)incidentExpirationDate;
}

- (NSString)displayName
{
  return self->_displayName;
}

- (NSArray)departureSequences
{
  uint64_t v74 = *MEMORY[0x1E4F143B8];
  departureSequences = self->_departureSequences;
  if (!departureSequences)
  {
    id v4 = [MEMORY[0x1E4F1CA60] dictionary];
    long long v67 = 0u;
    long long v68 = 0u;
    long long v69 = 0u;
    long long v70 = 0u;
    v5 = -[GEOPDTransitInfo stopInfos]((id *)&self->_transitInfo->super.super.isa);
    uint64_t v6 = [v5 countByEnumeratingWithState:&v67 objects:v73 count:16];
    if (v6)
    {
      uint64_t v7 = v6;
      uint64_t v8 = *(void *)v68;
      do
      {
        uint64_t v9 = 0;
        do
        {
          if (*(void *)v68 != v8) {
            objc_enumerationMutation(v5);
          }
          uint64_t v10 = *(void *)(*((void *)&v67 + 1) + 8 * v9);
          if (v10) {
            uint64_t v11 = *(void *)(v10 + 16);
          }
          else {
            uint64_t v11 = 0;
          }
          uint64_t v12 = [NSNumber numberWithUnsignedLongLong:v11];
          [v4 setObject:v10 forKeyedSubscript:v12];

          ++v9;
        }
        while (v7 != v9);
        uint64_t v13 = [v5 countByEnumeratingWithState:&v67 objects:v73 count:16];
        uint64_t v7 = v13;
      }
      while (v13);
    }
    long long v55 = v4;

    uint64_t v14 = [MEMORY[0x1E4F1CA60] dictionary];
    long long v63 = 0u;
    long long v64 = 0u;
    long long v65 = 0u;
    long long v66 = 0u;
    -[GEOPDTransitSchedule departureSequenceContainers]((id *)&self->_transitSchedule->super.super.isa);
    id obj = (id)objc_claimAutoreleasedReturnValue();
    uint64_t v15 = [obj countByEnumeratingWithState:&v63 objects:v72 count:16];
    if (v15)
    {
      uint64_t v16 = v15;
      uint64_t v17 = *(void *)v64;
      do
      {
        for (uint64_t i = 0; i != v16; ++i)
        {
          if (*(void *)v64 != v17) {
            objc_enumerationMutation(obj);
          }
          unint64_t v19 = 0;
          uint64_t v20 = *(void *)(*((void *)&v63 + 1) + 8 * i);
          if (v20)
          {
LABEL_19:
            -[GEOPDDepartureSequenceContainer _readDepartureSequenceIndexs](v20);
            unint64_t v21 = *(void *)(v20 + 32);
            goto LABEL_20;
          }
          while (1)
          {
            unint64_t v21 = 0;
LABEL_20:
            if (v19 >= v21) {
              break;
            }
            long long v22 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[GEOPDDepartureSequenceContainer departureSequenceIndexAtIndex:](v20, v19));
            [v14 setObject:v20 forKeyedSubscript:v22];

            ++v19;
            if (v20) {
              goto LABEL_19;
            }
          }
        }
        uint64_t v16 = [obj countByEnumeratingWithState:&v63 objects:v72 count:16];
      }
      while (v16);
    }

    id v23 = objc_alloc(MEMORY[0x1E4F1CA48]);
    long long v24 = (uint64_t *)self;
    transitSchedule = self->_transitSchedule;
    uint64_t v26 = &OBJC_IVAR___GEOPDGroundViewLabelInfo__flags;
    if (transitSchedule)
    {
      -[GEOPDTransitSchedule _readDepartureSequences]((uint64_t)self->_transitSchedule);
      uint64_t v27 = [(NSMutableArray *)transitSchedule->_departureSequences count];
    }
    else
    {
      uint64_t v27 = 0;
    }
    long long v54 = (void *)[v23 initWithCapacity:v27];
    unint64_t v28 = 0;
    uint64_t v29 = v4;
    while (1)
    {
      uint64_t v30 = v24[2];
      if (v30)
      {
        -[GEOPDTransitSchedule _readDepartureSequences](v24[2]);
        unint64_t v31 = [*(id *)(v30 + v26[526]) count];
      }
      else
      {
        unint64_t v31 = 0;
      }
      if (v28 >= v31)
      {
        uint64_t v51 = [objc_alloc(MEMORY[0x1E4F1C978]) initWithArray:v54];
        long long v52 = (void *)v24[5];
        v24[5] = v51;

        departureSequences = (NSArray *)v24[5];
        goto LABEL_53;
      }
      v32 = -[GEOPDTransitSchedule departureSequenceAtIndex:]((id *)v24[2], v28);
      long long v59 = 0u;
      long long v60 = 0u;
      long long v61 = 0u;
      long long v62 = 0u;
      uint64_t v33 = [v24 lines];
      uint64_t v34 = [v33 countByEnumeratingWithState:&v59 objects:v71 count:16];
      if (!v34) {
        goto LABEL_48;
      }
      uint64_t v35 = v34;
      unint64_t v56 = v28;
      v36 = 0;
      uint64_t v37 = *(void *)v60;
LABEL_33:
      uint64_t v38 = 0;
      obja = &v36[v35];
      while (1)
      {
        if (*(void *)v60 != v37) {
          objc_enumerationMutation(v33);
        }
        uint64_t v39 = *(void **)(*((void *)&v59 + 1) + 8 * v38);
        uint64_t v40 = [v39 muid];
        uint64_t v41 = v32 ? v32[15] : 0;
        if (v40 == v41) {
          break;
        }
        if (v35 == ++v38)
        {
          uint64_t v42 = [v33 countByEnumeratingWithState:&v59 objects:v71 count:16];
          uint64_t v35 = v42;
          v36 = obja;
          if (!v42)
          {
            long long v24 = (uint64_t *)self;
            unint64_t v28 = v56;
            goto LABEL_48;
          }
          goto LABEL_33;
        }
      }
      id v43 = v39;

      long long v24 = (uint64_t *)self;
      unint64_t v28 = v56;
      if (v43) {
        break;
      }
LABEL_49:

      ++v28;
      uint64_t v29 = v55;
      uint64_t v26 = &OBJC_IVAR___GEOPDGroundViewLabelInfo__flags;
    }
    id v44 = -[GEOPDTransitInfo lineAtIndex:]((id *)&self->_transitInfo->super.super.isa, (uint64_t)&v36[v38]);
    if (v32) {
      uint64_t v45 = v32[17];
    }
    else {
      uint64_t v45 = 0;
    }
    id v46 = [NSNumber numberWithUnsignedLongLong:v45];
    id v47 = [v55 objectForKeyedSubscript:v46];

    id v48 = [NSNumber numberWithUnsignedInteger:v56];
    id v49 = [v14 objectForKeyedSubscript:v48];

    id v50 = [[_GEOTransitDepartureSequence alloc] initWithSequence:v32 line:v43 pbLine:v44 stopInfo:v47 container:v49];
    [v54 addObject:v50];

    unint64_t v28 = v56;
    uint64_t v33 = v43;
    long long v24 = (uint64_t *)self;
LABEL_48:

    goto LABEL_49;
  }
LABEL_53:

  return departureSequences;
}

- (double)timeToLive
{
  transitSchedule = self->_transitSchedule;
  double result = 0.0;
  if (transitSchedule)
  {
    if ((*(unsigned char *)&transitSchedule->_flags & 2) != 0) {
      return (double)transitSchedule->_ttlSeconds;
    }
  }
  return result;
}

- (NSDate)lastFullScheduleValidDate
{
  p_isa = &self->_transitSchedule->super.super.isa;
  if (p_isa)
  {
    -[GEOPDTransitSchedule _readDeparturePredicateCountdown]((uint64_t)self->_transitSchedule);
    if (p_isa[3])
    {
      uint64_t v5 = -[GEOPDTransitSchedule departurePredicateCountdown]((id *)&self->_transitSchedule->super.super.isa);
      uint64_t v7 = (void *)v5;
      if (v5 && (*(unsigned char *)(v5 + 32) & 1) != 0 && (~*(_DWORD *)(v5 + 24) & 3) == 0)
      {
        LODWORD(v2) = *(_DWORD *)(v5 + 16);
        LODWORD(v6) = *(_DWORD *)(v5 + 20);
        uint64_t v8 = [MEMORY[0x1E4F1C9C8] dateWithTimeIntervalSinceReferenceDate:(double)v6];
        p_isa = [v8 dateByAddingTimeInterval:(double)v2];
      }
      else
      {
        p_isa = 0;
      }
    }
    else
    {
      p_isa = 0;
    }
    transitSchedule = self->_transitSchedule;
    if (transitSchedule)
    {
      -[GEOPDTransitSchedule _readDeparturePredicateStamp]((uint64_t)self->_transitSchedule);
      if (transitSchedule->_departurePredicateStamp)
      {
        uint64_t v10 = -[GEOPDTransitSchedule departurePredicateStamp]((id *)&self->_transitSchedule->super.super.isa);
        uint64_t v12 = (void *)v10;
        if (v10 && (*(unsigned char *)(v10 + 32) & 1) != 0 && (~*(_DWORD *)(v10 + 24) & 3) == 0)
        {
          LODWORD(v2) = *(_DWORD *)(v10 + 16);
          LODWORD(v11) = *(_DWORD *)(v10 + 20);
          uint64_t v13 = [MEMORY[0x1E4F1C9C8] dateWithTimeIntervalSinceReferenceDate:(double)v11];
          uint64_t v14 = [v13 dateByAddingTimeInterval:(double)v2];

          if (p_isa)
          {
            uint64_t v15 = [p_isa earlierDate:v14];

            p_isa = (void *)v15;
          }
          else
          {
            p_isa = v14;
          }
        }
      }
      uint64_t v16 = self->_transitSchedule;
      if (v16)
      {
        if (*(unsigned char *)&v16->_flags)
        {
          p_operatingHoursRange = &v16->_operatingHoursRange;
          if ((~*(_DWORD *)&p_operatingHoursRange->_has & 3) == 0)
          {
            long long v18 = [MEMORY[0x1E4F1C9C8] dateWithTimeIntervalSinceReferenceDate:(double)(p_operatingHoursRange->_startTime + p_operatingHoursRange->_duration)];
            unint64_t v19 = v18;
            if (p_isa)
            {
              uint64_t v20 = [p_isa earlierDate:v18];

              p_isa = (void *)v20;
            }
            else
            {
              p_isa = v18;
            }
          }
        }
      }
    }
  }

  return (NSDate *)p_isa;
}

- (unint64_t)numAdditionalDeparturesForSequence:(id)a3
{
  id v4 = [a3 line];
  int v5 = [v4 departuresAreVehicleSpecific];

  transitSchedule = self->_transitSchedule;
  if (v5)
  {
    if (transitSchedule)
    {
      -[GEOPDTransitSchedule _readDeparturePredicateStamp]((uint64_t)self->_transitSchedule);
      if (transitSchedule->_departurePredicateStamp)
      {
        uint64_t v7 = -[GEOPDTransitSchedule departurePredicateStamp]((id *)&self->_transitSchedule->super.super.isa);
        if (!v7) {
          goto LABEL_10;
        }
LABEL_9:
        if ((*(unsigned char *)(v7 + 32) & 2) != 0)
        {
          unsigned int v8 = *(_DWORD *)(v7 + 28);
          goto LABEL_13;
        }
LABEL_10:
        unsigned int v8 = 0;
LABEL_13:

        return v8;
      }
    }
  }
  else if (transitSchedule)
  {
    -[GEOPDTransitSchedule _readDeparturePredicateCountdown]((uint64_t)self->_transitSchedule);
    if (transitSchedule->_departurePredicateCountdown)
    {
      uint64_t v7 = -[GEOPDTransitSchedule departurePredicateCountdown]((id *)&self->_transitSchedule->super.super.isa);
      if (!v7) {
        goto LABEL_10;
      }
      goto LABEL_9;
    }
  }
  return 0;
}

- (id)_departureSequencesForSystem:(id)a3 excludingIncidentEntities:(id)a4 ignoreDirectionFilter:(BOOL)a5 direction:(id)a6 validForDateFromBlock:(id)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a6;
  id v15 = a7;
  uint64_t v16 = [(_GEOMapItemTransitInfo *)self departureSequences];
  uint64_t v24 = MEMORY[0x1E4F143A8];
  uint64_t v25 = 3221225472;
  uint64_t v26 = __135___GEOMapItemTransitInfo__departureSequencesForSystem_excludingIncidentEntities_ignoreDirectionFilter_direction_validForDateFromBlock___block_invoke;
  uint64_t v27 = &unk_1E53F5BD0;
  BOOL v33 = a5;
  id v28 = v12;
  id v29 = v14;
  id v31 = v13;
  id v32 = v15;
  uint64_t v30 = self;
  id v17 = v13;
  id v18 = v15;
  id v19 = v14;
  id v20 = v12;
  unint64_t v21 = [v16 indexesOfObjectsPassingTest:&v24];
  long long v22 = objc_msgSend(v16, "objectsAtIndexes:", v21, v24, v25, v26, v27);

  return v22;
}

- (id)_departureSequencesForSystem:(id)a3 excludingIncidentEntities:(id)a4 container:(id)a5 validForDateFromBlock:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  uint64_t v14 = [(_GEOMapItemTransitInfo *)self departureSequences];
  if (v12)
  {
    uint64_t v37 = (void *)v14;
    id v38 = v11;
    id v39 = v10;
    for (unint64_t i = 0; ; ++i)
    {
      transitSchedule = self->_transitSchedule;
      if (transitSchedule)
      {
        -[GEOPDTransitSchedule _readDepartureSequenceContainers]((uint64_t)self->_transitSchedule);
        unint64_t v17 = [(NSMutableArray *)transitSchedule->_departureSequenceContainers count];
      }
      else
      {
        unint64_t v17 = 0;
      }
      if (i >= v17) {
        break;
      }
      uint64_t v18 = -[GEOPDTransitSchedule departureSequenceContainerAtIndex:]((id *)&self->_transitSchedule->super.super.isa, i);
      id v19 = NSString;
      id v20 = -[GEOPDDepartureSequenceContainer displayName]((id *)v18);
      uint64_t v21 = [NSNumber numberWithUnsignedInteger:i];
      long long v22 = [v19 stringWithFormat:@"%@_%@", v20, v21];

      LOBYTE(v21) = [v22 isEqualToString:v12];
      if (v21) {
        goto LABEL_11;
      }
    }
    uint64_t v18 = 0;
LABEL_11:
    uint64_t v24 = [(_GEOMapItemTransitInfo *)self departureSequences];
    id v25 = objc_alloc(MEMORY[0x1E4F1CA48]);
    if (v18)
    {
      -[GEOPDDepartureSequenceContainer _readDepartureSequenceIndexs](v18);
      uint64_t v26 = *(void *)(v18 + 32);
    }
    else
    {
      uint64_t v26 = 0;
    }
    id v23 = (void *)[v25 initWithCapacity:v26];
    unint64_t v27 = 0;
    if (!v18) {
      goto LABEL_19;
    }
LABEL_14:
    -[GEOPDDepartureSequenceContainer _readDepartureSequenceIndexs](v18);
    for (unint64_t j = *(void *)(v18 + 32); v27 < j; unint64_t j = 0)
    {
      unint64_t v29 = -[GEOPDDepartureSequenceContainer departureSequenceIndexAtIndex:](v18, v27);
      if (v29 < [v24 count])
      {
        uint64_t v30 = [v24 objectAtIndexedSubscript:v29];
        [v23 addObject:v30];
      }
      ++v27;
      if (v18) {
        goto LABEL_14;
      }
LABEL_19:
      ;
    }

    id v11 = v38;
    id v10 = v39;
  }
  else
  {
    id v23 = (void *)v14;
  }
  v40[0] = MEMORY[0x1E4F143A8];
  v40[1] = 3221225472;
  v40[2] = __113___GEOMapItemTransitInfo__departureSequencesForSystem_excludingIncidentEntities_container_validForDateFromBlock___block_invoke;
  v40[3] = &unk_1E53F5BF8;
  v40[4] = self;
  id v41 = v10;
  id v42 = v11;
  id v43 = v13;
  id v31 = v11;
  id v32 = v10;
  id v33 = v13;
  uint64_t v34 = [v23 indexesOfObjectsPassingTest:v40];
  uint64_t v35 = [v23 objectsAtIndexes:v34];

  return v35;
}

- (id)departureSequencesForSystem:(id)a3 excludingIncidentEntities:(id)a4 direction:(id)a5 validForDateFromBlock:(id)a6
{
  return [(_GEOMapItemTransitInfo *)self _departureSequencesForSystem:a3 excludingIncidentEntities:a4 ignoreDirectionFilter:0 direction:a5 validForDateFromBlock:a6];
}

- (id)directionsForSystem:(id)a3 excludingIncidentEntities:(id)a4 validForDateFromBlock:(id)a5 hasSequencesWithNoDirection:(BOOL *)a6
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  uint64_t v7 = [(_GEOMapItemTransitInfo *)self _departureSequencesForSystem:a3 excludingIncidentEntities:a4 ignoreDirectionFilter:1 direction:0 validForDateFromBlock:a5];
  unsigned int v8 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA70]), "initWithCapacity:", objc_msgSend(v7, "count"));
  if (a6) {
    *a6 = 0;
  }
  long long v22 = 0u;
  long long v23 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  id v9 = v7;
  uint64_t v10 = [v9 countByEnumeratingWithState:&v20 objects:v24 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v21;
    do
    {
      uint64_t v13 = 0;
      do
      {
        if (*(void *)v21 != v12) {
          objc_enumerationMutation(v9);
        }
        uint64_t v14 = *(void **)(*((void *)&v20 + 1) + 8 * v13);
        id v15 = objc_msgSend(v14, "direction", (void)v20);

        if (v15)
        {
          uint64_t v16 = [v14 direction];
          [v8 addObject:v16];
        }
        else if (a6 && !*a6)
        {
          *a6 = 1;
        }
        ++v13;
      }
      while (v11 != v13);
      uint64_t v17 = [v9 countByEnumeratingWithState:&v20 objects:v24 count:16];
      uint64_t v11 = v17;
    }
    while (v17);
  }

  uint64_t v18 = [v8 array];

  return v18;
}

- (id)departureSequenceContainersForSystem:(id)a3 excludingIncidentEntities:(id)a4 validForDateFromBlock:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  uint64_t v11 = [(_GEOMapItemTransitInfo *)self departureSequences];
  id v12 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  uint64_t v13 = -[GEOPDTransitSchedule departureSequenceContainers]((id *)&self->_transitSchedule->super.super.isa);
  v22[0] = MEMORY[0x1E4F143A8];
  v22[1] = 3221225472;
  v22[2] = __111___GEOMapItemTransitInfo_departureSequenceContainersForSystem_excludingIncidentEntities_validForDateFromBlock___block_invoke;
  v22[3] = &unk_1E53F5C20;
  id v28 = v10;
  id v23 = v11;
  uint64_t v24 = self;
  id v25 = v9;
  id v26 = v8;
  id v14 = v12;
  id v27 = v14;
  id v15 = v8;
  id v16 = v9;
  id v17 = v10;
  id v18 = v11;
  [v13 enumerateObjectsUsingBlock:v22];

  id v19 = v27;
  id v20 = v14;

  return v20;
}

- (id)allSequencesForSystem:(id)a3 direction:(id)a4
{
  return [(_GEOMapItemTransitInfo *)self departureSequencesForSystem:a3 excludingIncidentEntities:0 direction:a4 validForDateFromBlock:0];
}

- (id)allSequencesForSystem:(id)a3 container:(id)a4
{
  return [(_GEOMapItemTransitInfo *)self departureSequencesForSystem:a3 excludingIncidentEntities:0 container:a4 validForDateFromBlock:0];
}

- (id)serviceResumesResultForLine:(id)a3 excludingIncidentEntities:(id)a4 afterDate:(id)a5 usingContainers:(BOOL)a6
{
  BOOL v6 = a6;
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  uint64_t v13 = [v10 system];
  if (v6) {
    [(_GEOMapItemTransitInfo *)self _departureSequencesForSystem:v13 excludingIncidentEntities:v11 container:0 validForDateFromBlock:0];
  }
  else {
  id v14 = [(_GEOMapItemTransitInfo *)self _departureSequencesForSystem:v13 excludingIncidentEntities:v11 ignoreDirectionFilter:1 direction:0 validForDateFromBlock:0];
  }

  uint64_t v41 = 0;
  id v42 = &v41;
  uint64_t v43 = 0x3032000000;
  id v44 = __Block_byref_object_copy__97;
  uint64_t v45 = __Block_byref_object_dispose__97;
  id v46 = 0;
  uint64_t v37 = 0;
  id v38 = &v37;
  uint64_t v39 = 0x2020000000;
  char v40 = 0;
  uint64_t v31 = 0;
  id v32 = &v31;
  uint64_t v33 = 0x3032000000;
  uint64_t v34 = __Block_byref_object_copy__97;
  uint64_t v35 = __Block_byref_object_dispose__97;
  id v36 = 0;
  uint64_t v21 = MEMORY[0x1E4F143A8];
  uint64_t v22 = 3221225472;
  id v23 = __106___GEOMapItemTransitInfo_serviceResumesResultForLine_excludingIncidentEntities_afterDate_usingContainers___block_invoke;
  uint64_t v24 = &unk_1E53F5C48;
  id v15 = v10;
  id v25 = v15;
  id v16 = v12;
  id v26 = v16;
  id v17 = v11;
  id v27 = v17;
  id v28 = &v37;
  unint64_t v29 = &v41;
  uint64_t v30 = &v31;
  [v14 enumerateObjectsUsingBlock:&v21];
  if (v42[5]) {
    BOOL v18 = 0;
  }
  else {
    BOOL v18 = *((unsigned char *)v38 + 24) != 0;
  }
  id v19 = objc_alloc_init(GEOMapItemTransitLineResumeResult);
  -[GEOMapItemTransitLineResumeResult setBlocked:](v19, "setBlocked:", v18, v21, v22, v23, v24);
  [(GEOMapItemTransitLineResumeResult *)v19 setEarliestNextDepartureDate:v42[5]];
  [(GEOMapItemTransitLineResumeResult *)v19 setDepartureSequence:v32[5]];

  _Block_object_dispose(&v31, 8);
  _Block_object_dispose(&v37, 8);
  _Block_object_dispose(&v41, 8);

  return v19;
}

- (id)inactiveLinesForSystem:(id)a3 relativeToDateFromBlock:(id)a4 excludingIncidentEntities:(id)a5 usingContainers:(BOOL)a6
{
  BOOL v6 = a6;
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  uint64_t v13 = (void *)MEMORY[0x1E4F1CA48];
  id v14 = [(_GEOMapItemTransitInfo *)self linesForSystem:v10];
  id v15 = [v13 arrayWithArray:v14];

  if (v6) {
    [(_GEOMapItemTransitInfo *)self _departureSequencesForSystem:v10 excludingIncidentEntities:v12 container:0 validForDateFromBlock:v11];
  }
  else {
    [(_GEOMapItemTransitInfo *)self _departureSequencesForSystem:v10 excludingIncidentEntities:v12 ignoreDirectionFilter:1 direction:0 validForDateFromBlock:v11];
  }
  long long v27 = 0u;
  long long v28 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  id v16 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v17 = [v16 countByEnumeratingWithState:&v25 objects:v29 count:16];
  if (v17)
  {
    uint64_t v18 = v17;
    uint64_t v19 = *(void *)v26;
    do
    {
      for (uint64_t i = 0; i != v18; ++i)
      {
        if (*(void *)v26 != v19) {
          objc_enumerationMutation(v16);
        }
        uint64_t v21 = *(void **)(*((void *)&v25 + 1) + 8 * i);
        uint64_t v22 = objc_msgSend(v21, "line", (void)v25);

        if (v22)
        {
          id v23 = [v21 line];
          [v15 removeObject:v23];
        }
      }
      uint64_t v18 = [v16 countByEnumeratingWithState:&v25 objects:v29 count:16];
    }
    while (v18);
  }

  return v15;
}

- (id)headSignsForLine:(id)a3
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (v4)
  {
    int v5 = [(NSMapTable *)self->_cachedHeadSignsForLine objectForKey:v4];
    if (!v5)
    {
      if (!self->_cachedHeadSignsForLine)
      {
        BOOL v6 = [MEMORY[0x1E4F28E10] strongToStrongObjectsMapTable];
        cachedHeadSignsForLine = self->_cachedHeadSignsForLine;
        self->_cachedHeadSignsForLine = v6;
      }
      id v8 = [MEMORY[0x1E4F1CA70] orderedSet];
      long long v23 = 0u;
      long long v24 = 0u;
      long long v25 = 0u;
      long long v26 = 0u;
      uint64_t v22 = self;
      id v9 = [(_GEOMapItemTransitInfo *)self departureSequences];
      uint64_t v10 = [v9 countByEnumeratingWithState:&v23 objects:v27 count:16];
      if (v10)
      {
        uint64_t v11 = v10;
        uint64_t v12 = *(void *)v24;
        do
        {
          for (uint64_t i = 0; i != v11; ++i)
          {
            if (*(void *)v24 != v12) {
              objc_enumerationMutation(v9);
            }
            id v14 = *(void **)(*((void *)&v23 + 1) + 8 * i);
            id v15 = [v14 line];
            uint64_t v16 = [v15 muid];
            uint64_t v17 = [v4 muid];

            if (v16 == v17)
            {
              uint64_t v18 = [v14 headsign];
              uint64_t v19 = [v18 length];

              if (v19)
              {
                id v20 = [v14 headsign];
                [v8 addObject:v20];
              }
            }
          }
          uint64_t v11 = [v9 countByEnumeratingWithState:&v23 objects:v27 count:16];
        }
        while (v11);
      }

      int v5 = (void *)[v8 copy];
      [(NSMapTable *)v22->_cachedHeadSignsForLine setObject:v5 forKey:v4];
    }
  }
  else
  {
    int v5 = 0;
  }

  return v5;
}

- (NSArray)transitTripStops
{
  return self->_transitStops;
}

- (NSString)title
{
  return -[GEOPDTransitInfo title]((id *)&self->_transitInfo->super.super.isa);
}

- (NSString)subtitle
{
  return -[GEOPDTransitInfo subTitle]((id *)&self->_transitInfo->super.super.isa);
}

- (GEOComposedRoute)composedRoute
{
  return self->_composedRoute;
}

- (GEOTransitNearbySchedule)nearbySchedule
{
  nearbySchedule = self->_nearbySchedule;
  if (!nearbySchedule)
  {
    id v4 = [_GEOTransitNearbySchedule alloc];
    unprocessedNearbySchedule = self->_unprocessedNearbySchedule;
    BOOL v6 = -[GEOPDTransitSchedule departureSequenceContainers]((id *)&self->_transitSchedule->super.super.isa);
    uint64_t v7 = [(_GEOMapItemTransitInfo *)self departureSequences];
    id v8 = [(_GEOMapItemTransitInfo *)self incidents];
    id v9 = -[GEOPDTransitInfo stopInfos]((id *)&self->_transitInfo->super.super.isa);
    uint64_t v10 = [(_GEOTransitNearbySchedule *)v4 initWithNearbySchedule:unprocessedNearbySchedule departureSequenceContainers:v6 scheduledDepartureSequences:v7 incidents:v8 stopInfo:v9];
    uint64_t v11 = self->_nearbySchedule;
    self->_nearbySchedule = v10;

    nearbySchedule = self->_nearbySchedule;
  }

  return nearbySchedule;
}

- (BOOL)hasTransitIncidentComponent
{
  return self->_hasTransitIncidentComponent;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_nearbySchedule, 0);
  objc_storeStrong((id *)&self->_unprocessedNearbySchedule, 0);
  objc_storeStrong((id *)&self->_composedRoute, 0);
  objc_storeStrong((id *)&self->_transitStops, 0);
  objc_storeStrong((id *)&self->_cachedHeadSignsForLine, 0);
  objc_storeStrong((id *)&self->_displayName, 0);
  objc_storeStrong((id *)&self->_connections, 0);
  objc_storeStrong((id *)&self->_incidentExpirationDate, 0);
  objc_storeStrong((id *)&self->_incidents, 0);
  objc_storeStrong((id *)&self->_timeZone, 0);
  objc_storeStrong((id *)&self->_departureSequences, 0);
  objc_storeStrong((id *)&self->_lines, 0);
  objc_storeStrong((id *)&self->_systems, 0);
  objc_storeStrong((id *)&self->_transitSchedule, 0);

  objc_storeStrong((id *)&self->_transitInfo, 0);
}

@end