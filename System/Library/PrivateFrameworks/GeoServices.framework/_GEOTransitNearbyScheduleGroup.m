@interface _GEOTransitNearbyScheduleGroup
+ (id)lineSectionsForNearbyTransitGroup:(id)a3 departureSequenceContainers:(id)a4 departureSequences:(id)a5;
- (BOOL)hasWalkingDetails;
- (NSArray)incidents;
- (NSArray)lineCells;
- (NSString)displayName;
- (NSString)pinnedDisplayName;
- (_GEOTransitNearbyScheduleGroup)initWithTransitScheduleGroup:(id)a3 departureSequenceContainers:(id)a4 scheduledDepartureSequences:(id)a5 incidentsMap:(id)a6;
- (int64_t)groupType;
- (unint64_t)maxWalkingDistance;
- (unint64_t)maxWalkingTime;
- (unint64_t)minWalkingDistance;
- (unint64_t)minWalkingTime;
@end

@implementation _GEOTransitNearbyScheduleGroup

- (_GEOTransitNearbyScheduleGroup)initWithTransitScheduleGroup:(id)a3 departureSequenceContainers:(id)a4 scheduledDepartureSequences:(id)a5 incidentsMap:(id)a6
{
  v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  v27.receiver = self;
  v27.super_class = (Class)_GEOTransitNearbyScheduleGroup;
  v15 = [(_GEOTransitNearbyScheduleGroup *)&v27 init];
  v16 = v15;
  if (v15)
  {
    objc_storeStrong((id *)&v15->_transitScheduleGroup, a3);
    uint64_t v17 = +[_GEOTransitNearbyScheduleGroup lineSectionsForNearbyTransitGroup:v11 departureSequenceContainers:v12 departureSequences:v13];
    lineCells = v16->_lineCells;
    v16->_lineCells = (NSArray *)v17;

    v19 = [MEMORY[0x1E4F1CA48] array];
    if (v11)
    {
      -[GEOPDTransitScheduleGroup _readIncidentIds]((uint64_t)v11);
      uint64_t v20 = v11[10];
      if (v20)
      {
        for (unint64_t i = 0; i != v20; ++i)
        {
          v22 = objc_msgSend(NSNumber, "numberWithUnsignedLongLong:", -[GEOPDTransitScheduleGroup incidentIdAtIndex:]((uint64_t)v11, i));
          v23 = [v14 objectForKeyedSubscript:v22];

          if (v23) {
            [v19 addObject:v23];
          }
        }
      }
    }
    uint64_t v24 = [v19 copy];
    incidents = v16->_incidents;
    v16->_incidents = (NSArray *)v24;
  }
  return v16;
}

+ (id)lineSectionsForNearbyTransitGroup:(id)a3 departureSequenceContainers:(id)a4 departureSequences:(id)a5
{
  v7 = (char *)a3;
  id v8 = a4;
  id v9 = a5;
  [MEMORY[0x1E4F1CA48] array];
  uint64_t v24 = v23 = v8;
  unint64_t v10 = 0;
  v11 = &OBJC_IVAR___GEOPDGroundViewLabelInfo__flags;
  if (!v7) {
    goto LABEL_14;
  }
LABEL_2:
  -[GEOPDTransitScheduleGroup _readDepartureSequenceContainerIndexs]((uint64_t)v7);
  for (unint64_t i = *(void *)&v7[v11[544] + 8]; v10 < i; unint64_t i = 0)
  {
    unsigned int v13 = -[GEOPDTransitScheduleGroup departureSequenceContainerIndexAtIndex:]((uint64_t)v7, v10);
    if ([v8 count] > (unint64_t)v13)
    {
      id v14 = [v8 objectAtIndexedSubscript:v13];
      v15 = [MEMORY[0x1E4F1CA48] array];
      unint64_t v16 = 0;
      if (v14)
      {
LABEL_6:
        -[GEOPDDepartureSequenceContainer _readDepartureSequenceIndexs]((uint64_t)v14);
        unint64_t v17 = v14[4];
        goto LABEL_7;
      }
      while (1)
      {
        unint64_t v17 = 0;
LABEL_7:
        if (v16 >= v17) {
          break;
        }
        unint64_t v18 = -[GEOPDDepartureSequenceContainer departureSequenceIndexAtIndex:]((uint64_t)v14, v16);
        if (v18 < [v9 count])
        {
          v19 = [v9 objectAtIndexedSubscript:v18];
          [v15 addObject:v19];
        }
        ++v16;
        if (v14) {
          goto LABEL_6;
        }
      }
      uint64_t v20 = [[_GEOTransitNearbyScheduleLine alloc] initWithDepartureSequenceContainer:v14 departureSequences:v15];
      [v24 addObject:v20];

      id v8 = v23;
      v11 = &OBJC_IVAR___GEOPDGroundViewLabelInfo__flags;
    }
    ++v10;
    if (v7) {
      goto LABEL_2;
    }
LABEL_14:
    ;
  }
  v21 = (void *)[v24 copy];

  return v21;
}

- (NSString)displayName
{
  return -[GEOPDTransitScheduleGroup displayName]((id *)&self->_transitScheduleGroup->super.super.isa);
}

- (unint64_t)minWalkingTime
{
  transitScheduleGroup = self->_transitScheduleGroup;
  if (transitScheduleGroup) {
    return transitScheduleGroup->_minWalkingTime;
  }
  else {
    return 0;
  }
}

- (unint64_t)maxWalkingTime
{
  transitScheduleGroup = self->_transitScheduleGroup;
  if (transitScheduleGroup) {
    return transitScheduleGroup->_maxWalkingTime;
  }
  else {
    return 0;
  }
}

- (unint64_t)minWalkingDistance
{
  transitScheduleGroup = self->_transitScheduleGroup;
  if (transitScheduleGroup) {
    return transitScheduleGroup->_minWalkingDistance;
  }
  else {
    return 0;
  }
}

- (unint64_t)maxWalkingDistance
{
  transitScheduleGroup = self->_transitScheduleGroup;
  if (transitScheduleGroup) {
    return transitScheduleGroup->_maxWalkingDistance;
  }
  else {
    return 0;
  }
}

- (BOOL)hasWalkingDetails
{
  transitScheduleGroup = self->_transitScheduleGroup;
  if (transitScheduleGroup)
  {
    $AD7F0884CB9BC500B55353D60B56FA2E flags = transitScheduleGroup->_flags;
    if ((*(unsigned char *)&flags & 0x10) != 0) {
      LOBYTE(v4) = 1;
    }
    else {
      return (*(unsigned int *)&flags >> 3) & 1;
    }
  }
  else
  {
    LOBYTE(v4) = 0;
  }
  return v4;
}

- (NSString)pinnedDisplayName
{
  return -[GEOPDTransitScheduleGroup pinnedDisplayName]((id *)&self->_transitScheduleGroup->super.super.isa);
}

- (int64_t)groupType
{
  uint64_t v2 = -[GEOPDTransitScheduleGroup groupType]((uint64_t)self->_transitScheduleGroup) - 1;
  if (v2 < 4) {
    return v2 + 1;
  }
  else {
    return 0;
  }
}

- (NSArray)lineCells
{
  return self->_lineCells;
}

- (NSArray)incidents
{
  return self->_incidents;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_incidents, 0);
  objc_storeStrong((id *)&self->_lineCells, 0);

  objc_storeStrong((id *)&self->_transitScheduleGroup, 0);
}

@end