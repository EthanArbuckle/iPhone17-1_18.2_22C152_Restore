@interface GEOTransitDecoderData
+ (BOOL)isValid:(id)a3;
+ (Class)accessPointType;
+ (Class)artworkType;
+ (Class)hallType;
+ (Class)lineType;
+ (Class)paymentMethodType;
+ (Class)stationType;
+ (Class)stepType;
+ (Class)stopType;
+ (Class)systemType;
+ (Class)transitIncidentMessageType;
+ (Class)transitIncidentType;
+ (Class)walkingType;
+ (Class)zilchPointsType;
- (BOOL)hasGreenTeaWithValue:(BOOL)a3;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (GEOTransitDecoderData)init;
- (GEOTransitDecoderData)initWithData:(id)a3;
- (GEOTransitDecoderData)initWithDictionary:(id)a3;
- (GEOTransitDecoderData)initWithJSON:(id)a3;
- (NSMutableArray)accessPoints;
- (NSMutableArray)artworks;
- (NSMutableArray)halls;
- (NSMutableArray)lines;
- (NSMutableArray)paymentMethods;
- (NSMutableArray)stations;
- (NSMutableArray)steps;
- (NSMutableArray)stops;
- (NSMutableArray)systems;
- (NSMutableArray)transitIncidentMessages;
- (NSMutableArray)transitIncidents;
- (NSMutableArray)walkings;
- (NSMutableArray)zilchPoints;
- (PBUnknownFields)unknownFields;
- (id)_dictionaryRepresentation:(uint64_t)a1;
- (id)_initWithDictionary:(int)a3 isJSON:;
- (id)accessPointAtIndex:(unint64_t)a3;
- (id)artworkAtIndex:(unint64_t)a3;
- (id)artworkFromIndices:(unsigned int *)a3 count:(unint64_t)a4;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)hallAtIndex:(unint64_t)a3;
- (id)jsonRepresentation;
- (id)lineAtIndex:(unint64_t)a3;
- (id)paymentMethodAtIndex:(unint64_t)a3;
- (id)stationAtIndex:(unint64_t)a3;
- (id)stepAtIndex:(unint64_t)a3;
- (id)stopAtIndex:(unint64_t)a3;
- (id)systemAtIndex:(unint64_t)a3;
- (id)transitIncidentAtIndex:(unint64_t)a3;
- (id)transitIncidentMessageAtIndex:(unint64_t)a3;
- (id)walkingAtIndex:(unint64_t)a3;
- (id)zilchPointsAtIndex:(unint64_t)a3;
- (unint64_t)accessPointsCount;
- (unint64_t)artworksCount;
- (unint64_t)hallsCount;
- (unint64_t)hash;
- (unint64_t)linesCount;
- (unint64_t)paymentMethodsCount;
- (unint64_t)stationsCount;
- (unint64_t)stepsCount;
- (unint64_t)stopsCount;
- (unint64_t)systemsCount;
- (unint64_t)transitIncidentMessagesCount;
- (unint64_t)transitIncidentsCount;
- (unint64_t)walkingsCount;
- (unint64_t)zilchPointsCount;
- (void)_addNoFlagsAccessPoint:(uint64_t)a1;
- (void)_addNoFlagsArtwork:(uint64_t)a1;
- (void)_addNoFlagsHall:(uint64_t)a1;
- (void)_addNoFlagsLine:(uint64_t)a1;
- (void)_addNoFlagsPaymentMethod:(uint64_t)a1;
- (void)_addNoFlagsStation:(uint64_t)a1;
- (void)_addNoFlagsStep:(uint64_t)a1;
- (void)_addNoFlagsStop:(uint64_t)a1;
- (void)_addNoFlagsSystem:(uint64_t)a1;
- (void)_addNoFlagsTransitIncident:(uint64_t)a1;
- (void)_addNoFlagsTransitIncidentMessage:(uint64_t)a1;
- (void)_addNoFlagsWalking:(uint64_t)a1;
- (void)_addNoFlagsZilchPoints:(uint64_t)a1;
- (void)_readAccessPoints;
- (void)_readArtworks;
- (void)_readHalls;
- (void)_readLines;
- (void)_readPaymentMethods;
- (void)_readStations;
- (void)_readSteps;
- (void)_readStops;
- (void)_readSystems;
- (void)_readTransitIncidentMessages;
- (void)_readTransitIncidents;
- (void)_readWalkings;
- (void)_readZilchPoints;
- (void)addAccessPoint:(id)a3;
- (void)addArtwork:(id)a3;
- (void)addHall:(id)a3;
- (void)addLine:(id)a3;
- (void)addPaymentMethod:(id)a3;
- (void)addStation:(id)a3;
- (void)addStep:(id)a3;
- (void)addStop:(id)a3;
- (void)addSystem:(id)a3;
- (void)addTransitIncident:(id)a3;
- (void)addTransitIncidentMessage:(id)a3;
- (void)addWalking:(id)a3;
- (void)addZilchPoints:(id)a3;
- (void)clearAccessPoints;
- (void)clearArtworks;
- (void)clearHalls;
- (void)clearLines;
- (void)clearPaymentMethods;
- (void)clearStations;
- (void)clearSteps;
- (void)clearStops;
- (void)clearSystems;
- (void)clearTransitIncidentMessages;
- (void)clearTransitIncidents;
- (void)clearUnknownFields:(BOOL)a3;
- (void)clearWalkings;
- (void)clearZilchPoints;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)readAll:(BOOL)a3;
- (void)setAccessPoints:(id)a3;
- (void)setArtworks:(id)a3;
- (void)setHalls:(id)a3;
- (void)setLines:(id)a3;
- (void)setPaymentMethods:(id)a3;
- (void)setStations:(id)a3;
- (void)setSteps:(id)a3;
- (void)setStops:(id)a3;
- (void)setSystems:(id)a3;
- (void)setTransitIncidentMessages:(id)a3;
- (void)setTransitIncidents:(id)a3;
- (void)setWalkings:(id)a3;
- (void)setZilchPoints:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation GEOTransitDecoderData

- (GEOTransitDecoderData)init
{
  v6.receiver = self;
  v6.super_class = (Class)GEOTransitDecoderData;
  v2 = [(GEOTransitDecoderData *)&v6 init];
  v3 = v2;
  if (v2)
  {
    v2->_readerLock._os_unfair_lock_opaque = 0;
    v4 = v2;
  }

  return v3;
}

- (GEOTransitDecoderData)initWithData:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)GEOTransitDecoderData;
  v3 = [(GEOTransitDecoderData *)&v7 initWithData:a3];
  v4 = v3;
  if (v3)
  {
    v3->_readerLock._os_unfair_lock_opaque = 0;
    v5 = v3;
  }

  return v4;
}

- (void)_readStations
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 136));
    if ((*(_WORD *)(a1 + 140) & 0x40) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOTransitDecoderDataReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readStations_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 136));
  }
}

- (NSMutableArray)stations
{
  -[GEOTransitDecoderData _readStations]((uint64_t)self);
  stations = self->_stations;

  return stations;
}

- (void)setStations:(id)a3
{
  v4 = (NSMutableArray *)a3;
  os_unfair_lock_lock_with_options();
  *(_WORD *)&self->_flags |= 0x40u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(_WORD *)&self->_flags |= 0x4000u;
  stations = self->_stations;
  self->_stations = v4;
}

- (void)clearStations
{
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(_WORD *)&self->_flags |= 0x40u;
  os_unfair_lock_unlock(p_readerLock);
  *(_WORD *)&self->_flags |= 0x4000u;
  stations = self->_stations;

  [(NSMutableArray *)stations removeAllObjects];
}

- (void)addStation:(id)a3
{
  id v4 = a3;
  -[GEOTransitDecoderData _readStations]((uint64_t)self);
  -[GEOTransitDecoderData _addNoFlagsStation:]((uint64_t)self, v4);

  os_unfair_lock_lock_with_options();
  *(_WORD *)&self->_flags |= 0x40u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(_WORD *)&self->_flags |= 0x4000u;
}

- (void)_addNoFlagsStation:(uint64_t)a1
{
  id v3 = a2;
  if (a1)
  {
    id v4 = *(void **)(a1 + 64);
    id v7 = v3;
    if (!v4)
    {
      id v5 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
      objc_super v6 = *(void **)(a1 + 64);
      *(void *)(a1 + 64) = v5;

      id v4 = *(void **)(a1 + 64);
    }
    [v4 addObject:v7];
    id v3 = v7;
  }
}

- (unint64_t)stationsCount
{
  -[GEOTransitDecoderData _readStations]((uint64_t)self);
  stations = self->_stations;

  return [(NSMutableArray *)stations count];
}

- (id)stationAtIndex:(unint64_t)a3
{
  -[GEOTransitDecoderData _readStations]((uint64_t)self);
  stations = self->_stations;

  return (id)[(NSMutableArray *)stations objectAtIndex:a3];
}

+ (Class)stationType
{
  return (Class)objc_opt_class();
}

- (void)_readLines
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 136));
    if ((*(_WORD *)(a1 + 140) & 0x10) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOTransitDecoderDataReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readLines_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 136));
  }
}

- (NSMutableArray)lines
{
  -[GEOTransitDecoderData _readLines]((uint64_t)self);
  lines = self->_lines;

  return lines;
}

- (void)setLines:(id)a3
{
  id v4 = (NSMutableArray *)a3;
  os_unfair_lock_lock_with_options();
  *(_WORD *)&self->_flags |= 0x10u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(_WORD *)&self->_flags |= 0x4000u;
  lines = self->_lines;
  self->_lines = v4;
}

- (void)clearLines
{
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(_WORD *)&self->_flags |= 0x10u;
  os_unfair_lock_unlock(p_readerLock);
  *(_WORD *)&self->_flags |= 0x4000u;
  lines = self->_lines;

  [(NSMutableArray *)lines removeAllObjects];
}

- (void)addLine:(id)a3
{
  id v4 = a3;
  -[GEOTransitDecoderData _readLines]((uint64_t)self);
  -[GEOTransitDecoderData _addNoFlagsLine:]((uint64_t)self, v4);

  os_unfair_lock_lock_with_options();
  *(_WORD *)&self->_flags |= 0x10u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(_WORD *)&self->_flags |= 0x4000u;
}

- (void)_addNoFlagsLine:(uint64_t)a1
{
  id v3 = a2;
  if (a1)
  {
    id v4 = *(void **)(a1 + 48);
    id v7 = v3;
    if (!v4)
    {
      id v5 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
      objc_super v6 = *(void **)(a1 + 48);
      *(void *)(a1 + 48) = v5;

      id v4 = *(void **)(a1 + 48);
    }
    [v4 addObject:v7];
    id v3 = v7;
  }
}

- (unint64_t)linesCount
{
  -[GEOTransitDecoderData _readLines]((uint64_t)self);
  lines = self->_lines;

  return [(NSMutableArray *)lines count];
}

- (id)lineAtIndex:(unint64_t)a3
{
  -[GEOTransitDecoderData _readLines]((uint64_t)self);
  lines = self->_lines;

  return (id)[(NSMutableArray *)lines objectAtIndex:a3];
}

+ (Class)lineType
{
  return (Class)objc_opt_class();
}

- (void)_readAccessPoints
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 136));
    if ((*(_WORD *)(a1 + 140) & 2) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOTransitDecoderDataReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readAccessPoints_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 136));
  }
}

- (NSMutableArray)accessPoints
{
  -[GEOTransitDecoderData _readAccessPoints]((uint64_t)self);
  accessPoints = self->_accessPoints;

  return accessPoints;
}

- (void)setAccessPoints:(id)a3
{
  id v4 = (NSMutableArray *)a3;
  os_unfair_lock_lock_with_options();
  *(_WORD *)&self->_flags |= 2u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(_WORD *)&self->_flags |= 0x4000u;
  accessPoints = self->_accessPoints;
  self->_accessPoints = v4;
}

- (void)clearAccessPoints
{
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(_WORD *)&self->_flags |= 2u;
  os_unfair_lock_unlock(p_readerLock);
  *(_WORD *)&self->_flags |= 0x4000u;
  accessPoints = self->_accessPoints;

  [(NSMutableArray *)accessPoints removeAllObjects];
}

- (void)addAccessPoint:(id)a3
{
  id v4 = a3;
  -[GEOTransitDecoderData _readAccessPoints]((uint64_t)self);
  -[GEOTransitDecoderData _addNoFlagsAccessPoint:]((uint64_t)self, v4);

  os_unfair_lock_lock_with_options();
  *(_WORD *)&self->_flags |= 2u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(_WORD *)&self->_flags |= 0x4000u;
}

- (void)_addNoFlagsAccessPoint:(uint64_t)a1
{
  id v3 = a2;
  if (a1)
  {
    id v4 = *(void **)(a1 + 24);
    id v7 = v3;
    if (!v4)
    {
      id v5 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
      objc_super v6 = *(void **)(a1 + 24);
      *(void *)(a1 + 24) = v5;

      id v4 = *(void **)(a1 + 24);
    }
    [v4 addObject:v7];
    id v3 = v7;
  }
}

- (unint64_t)accessPointsCount
{
  -[GEOTransitDecoderData _readAccessPoints]((uint64_t)self);
  accessPoints = self->_accessPoints;

  return [(NSMutableArray *)accessPoints count];
}

- (id)accessPointAtIndex:(unint64_t)a3
{
  -[GEOTransitDecoderData _readAccessPoints]((uint64_t)self);
  accessPoints = self->_accessPoints;

  return (id)[(NSMutableArray *)accessPoints objectAtIndex:a3];
}

+ (Class)accessPointType
{
  return (Class)objc_opt_class();
}

- (void)_readWalkings
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 136));
    if ((*(_WORD *)(a1 + 140) & 0x1000) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOTransitDecoderDataReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readWalkings_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 136));
  }
}

- (NSMutableArray)walkings
{
  -[GEOTransitDecoderData _readWalkings]((uint64_t)self);
  walkings = self->_walkings;

  return walkings;
}

- (void)setWalkings:(id)a3
{
  id v4 = (NSMutableArray *)a3;
  os_unfair_lock_lock_with_options();
  *(_WORD *)&self->_flags |= 0x1000u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(_WORD *)&self->_flags |= 0x4000u;
  walkings = self->_walkings;
  self->_walkings = v4;
}

- (void)clearWalkings
{
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(_WORD *)&self->_flags |= 0x1000u;
  os_unfair_lock_unlock(p_readerLock);
  *(_WORD *)&self->_flags |= 0x4000u;
  walkings = self->_walkings;

  [(NSMutableArray *)walkings removeAllObjects];
}

- (void)addWalking:(id)a3
{
  id v4 = a3;
  -[GEOTransitDecoderData _readWalkings]((uint64_t)self);
  -[GEOTransitDecoderData _addNoFlagsWalking:]((uint64_t)self, v4);

  os_unfair_lock_lock_with_options();
  *(_WORD *)&self->_flags |= 0x1000u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(_WORD *)&self->_flags |= 0x4000u;
}

- (void)_addNoFlagsWalking:(uint64_t)a1
{
  id v3 = a2;
  if (a1)
  {
    id v4 = *(void **)(a1 + 112);
    id v7 = v3;
    if (!v4)
    {
      id v5 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
      objc_super v6 = *(void **)(a1 + 112);
      *(void *)(a1 + 112) = v5;

      id v4 = *(void **)(a1 + 112);
    }
    [v4 addObject:v7];
    id v3 = v7;
  }
}

- (unint64_t)walkingsCount
{
  -[GEOTransitDecoderData _readWalkings]((uint64_t)self);
  walkings = self->_walkings;

  return [(NSMutableArray *)walkings count];
}

- (id)walkingAtIndex:(unint64_t)a3
{
  -[GEOTransitDecoderData _readWalkings]((uint64_t)self);
  walkings = self->_walkings;

  return (id)[(NSMutableArray *)walkings objectAtIndex:a3];
}

+ (Class)walkingType
{
  return (Class)objc_opt_class();
}

- (void)_readStops
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 136));
    if ((*(_WORD *)(a1 + 140) & 0x100) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOTransitDecoderDataReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readStops_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 136));
  }
}

- (NSMutableArray)stops
{
  -[GEOTransitDecoderData _readStops]((uint64_t)self);
  stops = self->_stops;

  return stops;
}

- (void)setStops:(id)a3
{
  id v4 = (NSMutableArray *)a3;
  os_unfair_lock_lock_with_options();
  *(_WORD *)&self->_flags |= 0x100u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(_WORD *)&self->_flags |= 0x4000u;
  stops = self->_stops;
  self->_stops = v4;
}

- (void)clearStops
{
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(_WORD *)&self->_flags |= 0x100u;
  os_unfair_lock_unlock(p_readerLock);
  *(_WORD *)&self->_flags |= 0x4000u;
  stops = self->_stops;

  [(NSMutableArray *)stops removeAllObjects];
}

- (void)addStop:(id)a3
{
  id v4 = a3;
  -[GEOTransitDecoderData _readStops]((uint64_t)self);
  -[GEOTransitDecoderData _addNoFlagsStop:]((uint64_t)self, v4);

  os_unfair_lock_lock_with_options();
  *(_WORD *)&self->_flags |= 0x100u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(_WORD *)&self->_flags |= 0x4000u;
}

- (void)_addNoFlagsStop:(uint64_t)a1
{
  id v3 = a2;
  if (a1)
  {
    id v4 = *(void **)(a1 + 80);
    id v7 = v3;
    if (!v4)
    {
      id v5 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
      objc_super v6 = *(void **)(a1 + 80);
      *(void *)(a1 + 80) = v5;

      id v4 = *(void **)(a1 + 80);
    }
    [v4 addObject:v7];
    id v3 = v7;
  }
}

- (unint64_t)stopsCount
{
  -[GEOTransitDecoderData _readStops]((uint64_t)self);
  stops = self->_stops;

  return [(NSMutableArray *)stops count];
}

- (id)stopAtIndex:(unint64_t)a3
{
  -[GEOTransitDecoderData _readStops]((uint64_t)self);
  stops = self->_stops;

  return (id)[(NSMutableArray *)stops objectAtIndex:a3];
}

+ (Class)stopType
{
  return (Class)objc_opt_class();
}

- (void)_readZilchPoints
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 136));
    if ((*(_WORD *)(a1 + 140) & 0x2000) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOTransitDecoderDataReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readZilchPoints_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 136));
  }
}

- (NSMutableArray)zilchPoints
{
  -[GEOTransitDecoderData _readZilchPoints]((uint64_t)self);
  zilchPoints = self->_zilchPoints;

  return zilchPoints;
}

- (void)setZilchPoints:(id)a3
{
  id v4 = (NSMutableArray *)a3;
  os_unfair_lock_lock_with_options();
  *(_WORD *)&self->_flags |= 0x2000u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(_WORD *)&self->_flags |= 0x4000u;
  zilchPoints = self->_zilchPoints;
  self->_zilchPoints = v4;
}

- (void)clearZilchPoints
{
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(_WORD *)&self->_flags |= 0x2000u;
  os_unfair_lock_unlock(p_readerLock);
  *(_WORD *)&self->_flags |= 0x4000u;
  zilchPoints = self->_zilchPoints;

  [(NSMutableArray *)zilchPoints removeAllObjects];
}

- (void)addZilchPoints:(id)a3
{
  id v4 = a3;
  -[GEOTransitDecoderData _readZilchPoints]((uint64_t)self);
  -[GEOTransitDecoderData _addNoFlagsZilchPoints:]((uint64_t)self, v4);

  os_unfair_lock_lock_with_options();
  *(_WORD *)&self->_flags |= 0x2000u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(_WORD *)&self->_flags |= 0x4000u;
}

- (void)_addNoFlagsZilchPoints:(uint64_t)a1
{
  id v3 = a2;
  if (a1)
  {
    id v4 = *(void **)(a1 + 120);
    id v7 = v3;
    if (!v4)
    {
      id v5 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
      objc_super v6 = *(void **)(a1 + 120);
      *(void *)(a1 + 120) = v5;

      id v4 = *(void **)(a1 + 120);
    }
    [v4 addObject:v7];
    id v3 = v7;
  }
}

- (unint64_t)zilchPointsCount
{
  -[GEOTransitDecoderData _readZilchPoints]((uint64_t)self);
  zilchPoints = self->_zilchPoints;

  return [(NSMutableArray *)zilchPoints count];
}

- (id)zilchPointsAtIndex:(unint64_t)a3
{
  -[GEOTransitDecoderData _readZilchPoints]((uint64_t)self);
  zilchPoints = self->_zilchPoints;

  return (id)[(NSMutableArray *)zilchPoints objectAtIndex:a3];
}

+ (Class)zilchPointsType
{
  return (Class)objc_opt_class();
}

- (void)_readSystems
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 136));
    if ((*(_WORD *)(a1 + 140) & 0x200) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOTransitDecoderDataReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readSystems_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 136));
  }
}

- (NSMutableArray)systems
{
  -[GEOTransitDecoderData _readSystems]((uint64_t)self);
  systems = self->_systems;

  return systems;
}

- (void)setSystems:(id)a3
{
  id v4 = (NSMutableArray *)a3;
  os_unfair_lock_lock_with_options();
  *(_WORD *)&self->_flags |= 0x200u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(_WORD *)&self->_flags |= 0x4000u;
  systems = self->_systems;
  self->_systems = v4;
}

- (void)clearSystems
{
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(_WORD *)&self->_flags |= 0x200u;
  os_unfair_lock_unlock(p_readerLock);
  *(_WORD *)&self->_flags |= 0x4000u;
  systems = self->_systems;

  [(NSMutableArray *)systems removeAllObjects];
}

- (void)addSystem:(id)a3
{
  id v4 = a3;
  -[GEOTransitDecoderData _readSystems]((uint64_t)self);
  -[GEOTransitDecoderData _addNoFlagsSystem:]((uint64_t)self, v4);

  os_unfair_lock_lock_with_options();
  *(_WORD *)&self->_flags |= 0x200u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(_WORD *)&self->_flags |= 0x4000u;
}

- (void)_addNoFlagsSystem:(uint64_t)a1
{
  id v3 = a2;
  if (a1)
  {
    id v4 = *(void **)(a1 + 88);
    id v7 = v3;
    if (!v4)
    {
      id v5 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
      objc_super v6 = *(void **)(a1 + 88);
      *(void *)(a1 + 88) = v5;

      id v4 = *(void **)(a1 + 88);
    }
    [v4 addObject:v7];
    id v3 = v7;
  }
}

- (unint64_t)systemsCount
{
  -[GEOTransitDecoderData _readSystems]((uint64_t)self);
  systems = self->_systems;

  return [(NSMutableArray *)systems count];
}

- (id)systemAtIndex:(unint64_t)a3
{
  -[GEOTransitDecoderData _readSystems]((uint64_t)self);
  systems = self->_systems;

  return (id)[(NSMutableArray *)systems objectAtIndex:a3];
}

+ (Class)systemType
{
  return (Class)objc_opt_class();
}

- (void)_readTransitIncidents
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 136));
    if ((*(_WORD *)(a1 + 140) & 0x800) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOTransitDecoderDataReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readTransitIncidents_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 136));
  }
}

- (NSMutableArray)transitIncidents
{
  -[GEOTransitDecoderData _readTransitIncidents]((uint64_t)self);
  transitIncidents = self->_transitIncidents;

  return transitIncidents;
}

- (void)setTransitIncidents:(id)a3
{
  id v4 = (NSMutableArray *)a3;
  os_unfair_lock_lock_with_options();
  *(_WORD *)&self->_flags |= 0x800u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(_WORD *)&self->_flags |= 0x4000u;
  transitIncidents = self->_transitIncidents;
  self->_transitIncidents = v4;
}

- (void)clearTransitIncidents
{
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(_WORD *)&self->_flags |= 0x800u;
  os_unfair_lock_unlock(p_readerLock);
  *(_WORD *)&self->_flags |= 0x4000u;
  transitIncidents = self->_transitIncidents;

  [(NSMutableArray *)transitIncidents removeAllObjects];
}

- (void)addTransitIncident:(id)a3
{
  id v4 = a3;
  -[GEOTransitDecoderData _readTransitIncidents]((uint64_t)self);
  -[GEOTransitDecoderData _addNoFlagsTransitIncident:]((uint64_t)self, v4);

  os_unfair_lock_lock_with_options();
  *(_WORD *)&self->_flags |= 0x800u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(_WORD *)&self->_flags |= 0x4000u;
}

- (void)_addNoFlagsTransitIncident:(uint64_t)a1
{
  id v3 = a2;
  if (a1)
  {
    id v4 = *(void **)(a1 + 104);
    id v7 = v3;
    if (!v4)
    {
      id v5 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
      objc_super v6 = *(void **)(a1 + 104);
      *(void *)(a1 + 104) = v5;

      id v4 = *(void **)(a1 + 104);
    }
    [v4 addObject:v7];
    id v3 = v7;
  }
}

- (unint64_t)transitIncidentsCount
{
  -[GEOTransitDecoderData _readTransitIncidents]((uint64_t)self);
  transitIncidents = self->_transitIncidents;

  return [(NSMutableArray *)transitIncidents count];
}

- (id)transitIncidentAtIndex:(unint64_t)a3
{
  -[GEOTransitDecoderData _readTransitIncidents]((uint64_t)self);
  transitIncidents = self->_transitIncidents;

  return (id)[(NSMutableArray *)transitIncidents objectAtIndex:a3];
}

+ (Class)transitIncidentType
{
  return (Class)objc_opt_class();
}

- (void)_readHalls
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 136));
    if ((*(_WORD *)(a1 + 140) & 8) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOTransitDecoderDataReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readHalls_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 136));
  }
}

- (NSMutableArray)halls
{
  -[GEOTransitDecoderData _readHalls]((uint64_t)self);
  halls = self->_halls;

  return halls;
}

- (void)setHalls:(id)a3
{
  id v4 = (NSMutableArray *)a3;
  os_unfair_lock_lock_with_options();
  *(_WORD *)&self->_flags |= 8u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(_WORD *)&self->_flags |= 0x4000u;
  halls = self->_halls;
  self->_halls = v4;
}

- (void)clearHalls
{
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(_WORD *)&self->_flags |= 8u;
  os_unfair_lock_unlock(p_readerLock);
  *(_WORD *)&self->_flags |= 0x4000u;
  halls = self->_halls;

  [(NSMutableArray *)halls removeAllObjects];
}

- (void)addHall:(id)a3
{
  id v4 = a3;
  -[GEOTransitDecoderData _readHalls]((uint64_t)self);
  -[GEOTransitDecoderData _addNoFlagsHall:]((uint64_t)self, v4);

  os_unfair_lock_lock_with_options();
  *(_WORD *)&self->_flags |= 8u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(_WORD *)&self->_flags |= 0x4000u;
}

- (void)_addNoFlagsHall:(uint64_t)a1
{
  id v3 = a2;
  if (a1)
  {
    id v4 = *(void **)(a1 + 40);
    id v7 = v3;
    if (!v4)
    {
      id v5 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
      objc_super v6 = *(void **)(a1 + 40);
      *(void *)(a1 + 40) = v5;

      id v4 = *(void **)(a1 + 40);
    }
    [v4 addObject:v7];
    id v3 = v7;
  }
}

- (unint64_t)hallsCount
{
  -[GEOTransitDecoderData _readHalls]((uint64_t)self);
  halls = self->_halls;

  return [(NSMutableArray *)halls count];
}

- (id)hallAtIndex:(unint64_t)a3
{
  -[GEOTransitDecoderData _readHalls]((uint64_t)self);
  halls = self->_halls;

  return (id)[(NSMutableArray *)halls objectAtIndex:a3];
}

+ (Class)hallType
{
  return (Class)objc_opt_class();
}

- (void)_readArtworks
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 136));
    if ((*(_WORD *)(a1 + 140) & 4) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOTransitDecoderDataReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readArtworks_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 136));
  }
}

- (NSMutableArray)artworks
{
  -[GEOTransitDecoderData _readArtworks]((uint64_t)self);
  artworks = self->_artworks;

  return artworks;
}

- (void)setArtworks:(id)a3
{
  id v4 = (NSMutableArray *)a3;
  os_unfair_lock_lock_with_options();
  *(_WORD *)&self->_flags |= 4u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(_WORD *)&self->_flags |= 0x4000u;
  artworks = self->_artworks;
  self->_artworks = v4;
}

- (void)clearArtworks
{
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(_WORD *)&self->_flags |= 4u;
  os_unfair_lock_unlock(p_readerLock);
  *(_WORD *)&self->_flags |= 0x4000u;
  artworks = self->_artworks;

  [(NSMutableArray *)artworks removeAllObjects];
}

- (void)addArtwork:(id)a3
{
  id v4 = a3;
  -[GEOTransitDecoderData _readArtworks]((uint64_t)self);
  -[GEOTransitDecoderData _addNoFlagsArtwork:]((uint64_t)self, v4);

  os_unfair_lock_lock_with_options();
  *(_WORD *)&self->_flags |= 4u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(_WORD *)&self->_flags |= 0x4000u;
}

- (void)_addNoFlagsArtwork:(uint64_t)a1
{
  id v3 = a2;
  if (a1)
  {
    id v4 = *(void **)(a1 + 32);
    id v7 = v3;
    if (!v4)
    {
      id v5 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
      objc_super v6 = *(void **)(a1 + 32);
      *(void *)(a1 + 32) = v5;

      id v4 = *(void **)(a1 + 32);
    }
    [v4 addObject:v7];
    id v3 = v7;
  }
}

- (unint64_t)artworksCount
{
  -[GEOTransitDecoderData _readArtworks]((uint64_t)self);
  artworks = self->_artworks;

  return [(NSMutableArray *)artworks count];
}

- (id)artworkAtIndex:(unint64_t)a3
{
  -[GEOTransitDecoderData _readArtworks]((uint64_t)self);
  artworks = self->_artworks;

  return (id)[(NSMutableArray *)artworks objectAtIndex:a3];
}

+ (Class)artworkType
{
  return (Class)objc_opt_class();
}

- (void)_readTransitIncidentMessages
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 136));
    if ((*(_WORD *)(a1 + 140) & 0x400) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOTransitDecoderDataReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readTransitIncidentMessages_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 136));
  }
}

- (NSMutableArray)transitIncidentMessages
{
  -[GEOTransitDecoderData _readTransitIncidentMessages]((uint64_t)self);
  transitIncidentMessages = self->_transitIncidentMessages;

  return transitIncidentMessages;
}

- (void)setTransitIncidentMessages:(id)a3
{
  id v4 = (NSMutableArray *)a3;
  os_unfair_lock_lock_with_options();
  *(_WORD *)&self->_flags |= 0x400u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(_WORD *)&self->_flags |= 0x4000u;
  transitIncidentMessages = self->_transitIncidentMessages;
  self->_transitIncidentMessages = v4;
}

- (void)clearTransitIncidentMessages
{
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(_WORD *)&self->_flags |= 0x400u;
  os_unfair_lock_unlock(p_readerLock);
  *(_WORD *)&self->_flags |= 0x4000u;
  transitIncidentMessages = self->_transitIncidentMessages;

  [(NSMutableArray *)transitIncidentMessages removeAllObjects];
}

- (void)addTransitIncidentMessage:(id)a3
{
  id v4 = a3;
  -[GEOTransitDecoderData _readTransitIncidentMessages]((uint64_t)self);
  -[GEOTransitDecoderData _addNoFlagsTransitIncidentMessage:]((uint64_t)self, v4);

  os_unfair_lock_lock_with_options();
  *(_WORD *)&self->_flags |= 0x400u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(_WORD *)&self->_flags |= 0x4000u;
}

- (void)_addNoFlagsTransitIncidentMessage:(uint64_t)a1
{
  id v3 = a2;
  if (a1)
  {
    id v4 = *(void **)(a1 + 96);
    id v7 = v3;
    if (!v4)
    {
      id v5 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
      objc_super v6 = *(void **)(a1 + 96);
      *(void *)(a1 + 96) = v5;

      id v4 = *(void **)(a1 + 96);
    }
    [v4 addObject:v7];
    id v3 = v7;
  }
}

- (unint64_t)transitIncidentMessagesCount
{
  -[GEOTransitDecoderData _readTransitIncidentMessages]((uint64_t)self);
  transitIncidentMessages = self->_transitIncidentMessages;

  return [(NSMutableArray *)transitIncidentMessages count];
}

- (id)transitIncidentMessageAtIndex:(unint64_t)a3
{
  -[GEOTransitDecoderData _readTransitIncidentMessages]((uint64_t)self);
  transitIncidentMessages = self->_transitIncidentMessages;

  return (id)[(NSMutableArray *)transitIncidentMessages objectAtIndex:a3];
}

+ (Class)transitIncidentMessageType
{
  return (Class)objc_opt_class();
}

- (void)_readSteps
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 136));
    if ((*(_WORD *)(a1 + 140) & 0x80) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOTransitDecoderDataReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readSteps_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 136));
  }
}

- (NSMutableArray)steps
{
  -[GEOTransitDecoderData _readSteps]((uint64_t)self);
  steps = self->_steps;

  return steps;
}

- (void)setSteps:(id)a3
{
  id v4 = (NSMutableArray *)a3;
  os_unfair_lock_lock_with_options();
  *(_WORD *)&self->_flags |= 0x80u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(_WORD *)&self->_flags |= 0x4000u;
  steps = self->_steps;
  self->_steps = v4;
}

- (void)clearSteps
{
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(_WORD *)&self->_flags |= 0x80u;
  os_unfair_lock_unlock(p_readerLock);
  *(_WORD *)&self->_flags |= 0x4000u;
  steps = self->_steps;

  [(NSMutableArray *)steps removeAllObjects];
}

- (void)addStep:(id)a3
{
  id v4 = a3;
  -[GEOTransitDecoderData _readSteps]((uint64_t)self);
  -[GEOTransitDecoderData _addNoFlagsStep:]((uint64_t)self, v4);

  os_unfair_lock_lock_with_options();
  *(_WORD *)&self->_flags |= 0x80u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(_WORD *)&self->_flags |= 0x4000u;
}

- (void)_addNoFlagsStep:(uint64_t)a1
{
  id v3 = a2;
  if (a1)
  {
    id v4 = *(void **)(a1 + 72);
    id v7 = v3;
    if (!v4)
    {
      id v5 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
      objc_super v6 = *(void **)(a1 + 72);
      *(void *)(a1 + 72) = v5;

      id v4 = *(void **)(a1 + 72);
    }
    [v4 addObject:v7];
    id v3 = v7;
  }
}

- (unint64_t)stepsCount
{
  -[GEOTransitDecoderData _readSteps]((uint64_t)self);
  steps = self->_steps;

  return [(NSMutableArray *)steps count];
}

- (id)stepAtIndex:(unint64_t)a3
{
  -[GEOTransitDecoderData _readSteps]((uint64_t)self);
  steps = self->_steps;

  return (id)[(NSMutableArray *)steps objectAtIndex:a3];
}

+ (Class)stepType
{
  return (Class)objc_opt_class();
}

- (void)_readPaymentMethods
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 136));
    if ((*(_WORD *)(a1 + 140) & 0x20) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOTransitDecoderDataReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readPaymentMethods_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 136));
  }
}

- (NSMutableArray)paymentMethods
{
  -[GEOTransitDecoderData _readPaymentMethods]((uint64_t)self);
  paymentMethods = self->_paymentMethods;

  return paymentMethods;
}

- (void)setPaymentMethods:(id)a3
{
  id v4 = (NSMutableArray *)a3;
  os_unfair_lock_lock_with_options();
  *(_WORD *)&self->_flags |= 0x20u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(_WORD *)&self->_flags |= 0x4000u;
  paymentMethods = self->_paymentMethods;
  self->_paymentMethods = v4;
}

- (void)clearPaymentMethods
{
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(_WORD *)&self->_flags |= 0x20u;
  os_unfair_lock_unlock(p_readerLock);
  *(_WORD *)&self->_flags |= 0x4000u;
  paymentMethods = self->_paymentMethods;

  [(NSMutableArray *)paymentMethods removeAllObjects];
}

- (void)addPaymentMethod:(id)a3
{
  id v4 = a3;
  -[GEOTransitDecoderData _readPaymentMethods]((uint64_t)self);
  -[GEOTransitDecoderData _addNoFlagsPaymentMethod:]((uint64_t)self, v4);

  os_unfair_lock_lock_with_options();
  *(_WORD *)&self->_flags |= 0x20u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(_WORD *)&self->_flags |= 0x4000u;
}

- (void)_addNoFlagsPaymentMethod:(uint64_t)a1
{
  id v3 = a2;
  if (a1)
  {
    id v4 = *(void **)(a1 + 56);
    id v7 = v3;
    if (!v4)
    {
      id v5 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
      objc_super v6 = *(void **)(a1 + 56);
      *(void *)(a1 + 56) = v5;

      id v4 = *(void **)(a1 + 56);
    }
    [v4 addObject:v7];
    id v3 = v7;
  }
}

- (unint64_t)paymentMethodsCount
{
  -[GEOTransitDecoderData _readPaymentMethods]((uint64_t)self);
  paymentMethods = self->_paymentMethods;

  return [(NSMutableArray *)paymentMethods count];
}

- (id)paymentMethodAtIndex:(unint64_t)a3
{
  -[GEOTransitDecoderData _readPaymentMethods]((uint64_t)self);
  paymentMethods = self->_paymentMethods;

  return (id)[(NSMutableArray *)paymentMethods objectAtIndex:a3];
}

+ (Class)paymentMethodType
{
  return (Class)objc_opt_class();
}

- (id)description
{
  id v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)GEOTransitDecoderData;
  id v4 = [(GEOTransitDecoderData *)&v8 description];
  id v5 = [(GEOTransitDecoderData *)self dictionaryRepresentation];
  objc_super v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEOTransitDecoderData _dictionaryRepresentation:]((uint64_t)self, 0);
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  uint64_t v190 = *MEMORY[0x1E4F143B8];
  if (a1)
  {
    [(id)a1 readAll:1];
    id v4 = [MEMORY[0x1E4F1CA60] dictionary];
    if ([*(id *)(a1 + 64) count])
    {
      id v5 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(*(id *)(a1 + 64), "count"));
      long long v173 = 0u;
      long long v174 = 0u;
      long long v175 = 0u;
      long long v176 = 0u;
      id v6 = *(id *)(a1 + 64);
      uint64_t v7 = [v6 countByEnumeratingWithState:&v173 objects:v189 count:16];
      if (v7)
      {
        uint64_t v8 = v7;
        uint64_t v9 = *(void *)v174;
        do
        {
          for (uint64_t i = 0; i != v8; ++i)
          {
            if (*(void *)v174 != v9) {
              objc_enumerationMutation(v6);
            }
            v11 = *(void **)(*((void *)&v173 + 1) + 8 * i);
            if (a2) {
              [v11 jsonRepresentation];
            }
            else {
            id v12 = [v11 dictionaryRepresentation];
            }

            [v5 addObject:v12];
          }
          uint64_t v8 = [v6 countByEnumeratingWithState:&v173 objects:v189 count:16];
        }
        while (v8);
      }

      [v4 setObject:v5 forKey:@"station"];
    }
    if ([*(id *)(a1 + 48) count])
    {
      v13 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(*(id *)(a1 + 48), "count"));
      long long v169 = 0u;
      long long v170 = 0u;
      long long v171 = 0u;
      long long v172 = 0u;
      id v14 = *(id *)(a1 + 48);
      uint64_t v15 = [v14 countByEnumeratingWithState:&v169 objects:v188 count:16];
      if (v15)
      {
        uint64_t v16 = v15;
        uint64_t v17 = *(void *)v170;
        do
        {
          for (uint64_t j = 0; j != v16; ++j)
          {
            if (*(void *)v170 != v17) {
              objc_enumerationMutation(v14);
            }
            v19 = *(void **)(*((void *)&v169 + 1) + 8 * j);
            if (a2) {
              [v19 jsonRepresentation];
            }
            else {
            id v20 = [v19 dictionaryRepresentation];
            }

            [v13 addObject:v20];
          }
          uint64_t v16 = [v14 countByEnumeratingWithState:&v169 objects:v188 count:16];
        }
        while (v16);
      }

      [v4 setObject:v13 forKey:@"line"];
    }
    if ([*(id *)(a1 + 24) count])
    {
      v21 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(*(id *)(a1 + 24), "count"));
      long long v165 = 0u;
      long long v166 = 0u;
      long long v167 = 0u;
      long long v168 = 0u;
      id v22 = *(id *)(a1 + 24);
      uint64_t v23 = [v22 countByEnumeratingWithState:&v165 objects:v187 count:16];
      if (v23)
      {
        uint64_t v24 = v23;
        uint64_t v25 = *(void *)v166;
        do
        {
          for (uint64_t k = 0; k != v24; ++k)
          {
            if (*(void *)v166 != v25) {
              objc_enumerationMutation(v22);
            }
            v27 = *(void **)(*((void *)&v165 + 1) + 8 * k);
            if (a2) {
              [v27 jsonRepresentation];
            }
            else {
            id v28 = [v27 dictionaryRepresentation];
            }

            [v21 addObject:v28];
          }
          uint64_t v24 = [v22 countByEnumeratingWithState:&v165 objects:v187 count:16];
        }
        while (v24);
      }

      if (a2) {
        v29 = @"accessPoint";
      }
      else {
        v29 = @"access_point";
      }
      [v4 setObject:v21 forKey:v29];
    }
    if ([*(id *)(a1 + 112) count])
    {
      v30 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(*(id *)(a1 + 112), "count"));
      long long v161 = 0u;
      long long v162 = 0u;
      long long v163 = 0u;
      long long v164 = 0u;
      id v31 = *(id *)(a1 + 112);
      uint64_t v32 = [v31 countByEnumeratingWithState:&v161 objects:v186 count:16];
      if (v32)
      {
        uint64_t v33 = v32;
        uint64_t v34 = *(void *)v162;
        do
        {
          for (uint64_t m = 0; m != v33; ++m)
          {
            if (*(void *)v162 != v34) {
              objc_enumerationMutation(v31);
            }
            v36 = *(void **)(*((void *)&v161 + 1) + 8 * m);
            if (a2) {
              [v36 jsonRepresentation];
            }
            else {
            id v37 = [v36 dictionaryRepresentation];
            }

            [v30 addObject:v37];
          }
          uint64_t v33 = [v31 countByEnumeratingWithState:&v161 objects:v186 count:16];
        }
        while (v33);
      }

      [v4 setObject:v30 forKey:@"walking"];
    }
    if ([*(id *)(a1 + 80) count])
    {
      v38 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(*(id *)(a1 + 80), "count"));
      long long v157 = 0u;
      long long v158 = 0u;
      long long v159 = 0u;
      long long v160 = 0u;
      id v39 = *(id *)(a1 + 80);
      uint64_t v40 = [v39 countByEnumeratingWithState:&v157 objects:v185 count:16];
      if (v40)
      {
        uint64_t v41 = v40;
        uint64_t v42 = *(void *)v158;
        do
        {
          for (uint64_t n = 0; n != v41; ++n)
          {
            if (*(void *)v158 != v42) {
              objc_enumerationMutation(v39);
            }
            v44 = *(void **)(*((void *)&v157 + 1) + 8 * n);
            if (a2) {
              [v44 jsonRepresentation];
            }
            else {
            id v45 = [v44 dictionaryRepresentation];
            }

            [v38 addObject:v45];
          }
          uint64_t v41 = [v39 countByEnumeratingWithState:&v157 objects:v185 count:16];
        }
        while (v41);
      }

      [v4 setObject:v38 forKey:@"stop"];
    }
    if (*(void *)(a1 + 120))
    {
      if (a2)
      {
        v46 = (void *)MEMORY[0x1E4F1CA48];
        v47 = [(id)a1 zilchPoints];
        v48 = objc_msgSend(v46, "arrayWithCapacity:", objc_msgSend(v47, "count"));

        long long v155 = 0u;
        long long v156 = 0u;
        long long v153 = 0u;
        long long v154 = 0u;
        v49 = [(id)a1 zilchPoints];
        uint64_t v50 = [v49 countByEnumeratingWithState:&v153 objects:v184 count:16];
        if (v50)
        {
          uint64_t v51 = v50;
          uint64_t v52 = *(void *)v154;
          do
          {
            for (iuint64_t i = 0; ii != v51; ++ii)
            {
              if (*(void *)v154 != v52) {
                objc_enumerationMutation(v49);
              }
              v54 = [*(id *)(*((void *)&v153 + 1) + 8 * ii) base64EncodedStringWithOptions:0];
              [v48 addObject:v54];
            }
            uint64_t v51 = [v49 countByEnumeratingWithState:&v153 objects:v184 count:16];
          }
          while (v51);
        }

        v55 = @"zilchPoints";
      }
      else
      {
        v48 = [(id)a1 zilchPoints];
        v55 = @"zilch_points";
      }
      [v4 setObject:v48 forKey:v55];
    }
    if ([*(id *)(a1 + 88) count])
    {
      v56 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(*(id *)(a1 + 88), "count"));
      long long v149 = 0u;
      long long v150 = 0u;
      long long v151 = 0u;
      long long v152 = 0u;
      id v57 = *(id *)(a1 + 88);
      uint64_t v58 = [v57 countByEnumeratingWithState:&v149 objects:v183 count:16];
      if (v58)
      {
        uint64_t v59 = v58;
        uint64_t v60 = *(void *)v150;
        do
        {
          for (juint64_t j = 0; jj != v59; ++jj)
          {
            if (*(void *)v150 != v60) {
              objc_enumerationMutation(v57);
            }
            v62 = *(void **)(*((void *)&v149 + 1) + 8 * jj);
            if (a2) {
              [v62 jsonRepresentation];
            }
            else {
            id v63 = [v62 dictionaryRepresentation];
            }

            [v56 addObject:v63];
          }
          uint64_t v59 = [v57 countByEnumeratingWithState:&v149 objects:v183 count:16];
        }
        while (v59);
      }

      [v4 setObject:v56 forKey:@"system"];
    }
    if ([*(id *)(a1 + 104) count])
    {
      v64 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(*(id *)(a1 + 104), "count"));
      long long v145 = 0u;
      long long v146 = 0u;
      long long v147 = 0u;
      long long v148 = 0u;
      id v65 = *(id *)(a1 + 104);
      uint64_t v66 = [v65 countByEnumeratingWithState:&v145 objects:v182 count:16];
      if (v66)
      {
        uint64_t v67 = v66;
        uint64_t v68 = *(void *)v146;
        do
        {
          for (kuint64_t k = 0; kk != v67; ++kk)
          {
            if (*(void *)v146 != v68) {
              objc_enumerationMutation(v65);
            }
            v70 = *(void **)(*((void *)&v145 + 1) + 8 * kk);
            if (a2) {
              [v70 jsonRepresentation];
            }
            else {
            id v71 = [v70 dictionaryRepresentation];
            }

            [v64 addObject:v71];
          }
          uint64_t v67 = [v65 countByEnumeratingWithState:&v145 objects:v182 count:16];
        }
        while (v67);
      }

      if (a2) {
        v72 = @"transitIncident";
      }
      else {
        v72 = @"transit_incident";
      }
      [v4 setObject:v64 forKey:v72];
    }
    if ([*(id *)(a1 + 40) count])
    {
      v73 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(*(id *)(a1 + 40), "count"));
      long long v141 = 0u;
      long long v142 = 0u;
      long long v143 = 0u;
      long long v144 = 0u;
      id v74 = *(id *)(a1 + 40);
      uint64_t v75 = [v74 countByEnumeratingWithState:&v141 objects:v181 count:16];
      if (v75)
      {
        uint64_t v76 = v75;
        uint64_t v77 = *(void *)v142;
        do
        {
          for (muint64_t m = 0; mm != v76; ++mm)
          {
            if (*(void *)v142 != v77) {
              objc_enumerationMutation(v74);
            }
            v79 = *(void **)(*((void *)&v141 + 1) + 8 * mm);
            if (a2) {
              [v79 jsonRepresentation];
            }
            else {
            id v80 = [v79 dictionaryRepresentation];
            }

            [v73 addObject:v80];
          }
          uint64_t v76 = [v74 countByEnumeratingWithState:&v141 objects:v181 count:16];
        }
        while (v76);
      }

      [v4 setObject:v73 forKey:@"hall"];
    }
    if ([*(id *)(a1 + 32) count])
    {
      v81 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(*(id *)(a1 + 32), "count"));
      long long v137 = 0u;
      long long v138 = 0u;
      long long v139 = 0u;
      long long v140 = 0u;
      id v82 = *(id *)(a1 + 32);
      uint64_t v83 = [v82 countByEnumeratingWithState:&v137 objects:v180 count:16];
      if (v83)
      {
        uint64_t v84 = v83;
        uint64_t v85 = *(void *)v138;
        do
        {
          for (nuint64_t n = 0; nn != v84; ++nn)
          {
            if (*(void *)v138 != v85) {
              objc_enumerationMutation(v82);
            }
            v87 = *(void **)(*((void *)&v137 + 1) + 8 * nn);
            if (a2) {
              [v87 jsonRepresentation];
            }
            else {
            id v88 = [v87 dictionaryRepresentation];
            }

            [v81 addObject:v88];
          }
          uint64_t v84 = [v82 countByEnumeratingWithState:&v137 objects:v180 count:16];
        }
        while (v84);
      }

      [v4 setObject:v81 forKey:@"artwork"];
    }
    if ([*(id *)(a1 + 96) count])
    {
      v89 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(*(id *)(a1 + 96), "count"));
      long long v133 = 0u;
      long long v134 = 0u;
      long long v135 = 0u;
      long long v136 = 0u;
      id v90 = *(id *)(a1 + 96);
      uint64_t v91 = [v90 countByEnumeratingWithState:&v133 objects:v179 count:16];
      if (v91)
      {
        uint64_t v92 = v91;
        uint64_t v93 = *(void *)v134;
        do
        {
          for (uint64_t i1 = 0; i1 != v92; ++i1)
          {
            if (*(void *)v134 != v93) {
              objc_enumerationMutation(v90);
            }
            v95 = *(void **)(*((void *)&v133 + 1) + 8 * i1);
            if (a2) {
              [v95 jsonRepresentation];
            }
            else {
            id v96 = [v95 dictionaryRepresentation];
            }

            [v89 addObject:v96];
          }
          uint64_t v92 = [v90 countByEnumeratingWithState:&v133 objects:v179 count:16];
        }
        while (v92);
      }

      if (a2) {
        v97 = @"transitIncidentMessage";
      }
      else {
        v97 = @"transit_incident_message";
      }
      [v4 setObject:v89 forKey:v97];
    }
    if ([*(id *)(a1 + 72) count])
    {
      v98 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(*(id *)(a1 + 72), "count"));
      long long v129 = 0u;
      long long v130 = 0u;
      long long v131 = 0u;
      long long v132 = 0u;
      id v99 = *(id *)(a1 + 72);
      uint64_t v100 = [v99 countByEnumeratingWithState:&v129 objects:v178 count:16];
      if (v100)
      {
        uint64_t v101 = v100;
        uint64_t v102 = *(void *)v130;
        do
        {
          for (uint64_t i2 = 0; i2 != v101; ++i2)
          {
            if (*(void *)v130 != v102) {
              objc_enumerationMutation(v99);
            }
            v104 = *(void **)(*((void *)&v129 + 1) + 8 * i2);
            if (a2) {
              [v104 jsonRepresentation];
            }
            else {
            id v105 = [v104 dictionaryRepresentation];
            }

            [v98 addObject:v105];
          }
          uint64_t v101 = [v99 countByEnumeratingWithState:&v129 objects:v178 count:16];
        }
        while (v101);
      }

      [v4 setObject:v98 forKey:@"step"];
    }
    if ([*(id *)(a1 + 56) count])
    {
      v106 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(*(id *)(a1 + 56), "count"));
      long long v125 = 0u;
      long long v126 = 0u;
      long long v127 = 0u;
      long long v128 = 0u;
      id v107 = *(id *)(a1 + 56);
      uint64_t v108 = [v107 countByEnumeratingWithState:&v125 objects:v177 count:16];
      if (v108)
      {
        uint64_t v109 = v108;
        uint64_t v110 = *(void *)v126;
        do
        {
          for (uint64_t i3 = 0; i3 != v109; ++i3)
          {
            if (*(void *)v126 != v110) {
              objc_enumerationMutation(v107);
            }
            v112 = *(void **)(*((void *)&v125 + 1) + 8 * i3);
            if (a2) {
              [v112 jsonRepresentation];
            }
            else {
            id v113 = [v112 dictionaryRepresentation];
            }

            [v106 addObject:v113];
          }
          uint64_t v109 = [v107 countByEnumeratingWithState:&v125 objects:v177 count:16];
        }
        while (v109);
      }

      if (a2) {
        v114 = @"paymentMethod";
      }
      else {
        v114 = @"payment_method";
      }
      [v4 setObject:v106 forKey:v114];
    }
    v115 = *(void **)(a1 + 16);
    if (v115)
    {
      v116 = [v115 dictionaryRepresentation];
      v117 = v116;
      if (a2)
      {
        v118 = objc_msgSend(MEMORY[0x1E4F1CA60], "dictionaryWithCapacity:", objc_msgSend(v116, "count"));
        v123[0] = MEMORY[0x1E4F143A8];
        v123[1] = 3221225472;
        v123[2] = __51__GEOTransitDecoderData__dictionaryRepresentation___block_invoke;
        v123[3] = &unk_1E53D8860;
        id v119 = v118;
        id v124 = v119;
        [v117 enumerateKeysAndObjectsUsingBlock:v123];
        id v120 = v119;

        v117 = v120;
      }
      [v4 setObject:v117 forKey:@"Unknown Fields"];
    }
    id v121 = v4;
  }
  else
  {
    id v121 = 0;
  }

  return v121;
}

- (id)jsonRepresentation
{
  return -[GEOTransitDecoderData _dictionaryRepresentation:]((uint64_t)self, 1);
}

void __51__GEOTransitDecoderData__dictionaryRepresentation___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v10 = a2;
  id v5 = a3;
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();
  uint64_t v7 = *(void **)(a1 + 32);
  if (isKindOfClass)
  {
    uint64_t v8 = [v5 base64EncodedStringWithOptions:0];
    uint64_t v9 = [v10 description];
    [v7 setObject:v8 forKey:v9];
  }
  else
  {
    uint64_t v8 = [v10 description];
    [v7 setObject:v5 forKey:v8];
  }
}

- (GEOTransitDecoderData)initWithDictionary:(id)a3
{
  return (GEOTransitDecoderData *)-[GEOTransitDecoderData _initWithDictionary:isJSON:](self, a3, 0);
}

- (id)_initWithDictionary:(int)a3 isJSON:
{
  uint64_t v208 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  if (a1 && (id v6 = (id)[a1 init], v6, v6))
  {
    uint64_t v7 = [v5 objectForKeyedSubscript:@"station"];
    objc_opt_class();
    id v142 = v5;
    if (objc_opt_isKindOfClass())
    {
      long long v193 = 0u;
      long long v194 = 0u;
      long long v191 = 0u;
      long long v192 = 0u;
      id v8 = v7;
      uint64_t v9 = [v8 countByEnumeratingWithState:&v191 objects:v207 count:16];
      if (v9)
      {
        uint64_t v10 = v9;
        uint64_t v11 = *(void *)v192;
        do
        {
          for (uint64_t i = 0; i != v10; ++i)
          {
            if (*(void *)v192 != v11) {
              objc_enumerationMutation(v8);
            }
            uint64_t v13 = *(void *)(*((void *)&v191 + 1) + 8 * i);
            objc_opt_class();
            if (objc_opt_isKindOfClass())
            {
              id v14 = [GEOPBTransitStation alloc];
              if (a3) {
                uint64_t v15 = [(GEOPBTransitStation *)v14 initWithJSON:v13];
              }
              else {
                uint64_t v15 = [(GEOPBTransitStation *)v14 initWithDictionary:v13];
              }
              uint64_t v16 = (void *)v15;
              [v6 addStation:v15];
            }
          }
          uint64_t v10 = [v8 countByEnumeratingWithState:&v191 objects:v207 count:16];
        }
        while (v10);
      }

      id v5 = v142;
    }

    uint64_t v17 = [v5 objectForKeyedSubscript:@"line"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      long long v189 = 0u;
      long long v190 = 0u;
      long long v187 = 0u;
      long long v188 = 0u;
      id v18 = v17;
      uint64_t v19 = [v18 countByEnumeratingWithState:&v187 objects:v206 count:16];
      if (v19)
      {
        uint64_t v20 = v19;
        uint64_t v21 = *(void *)v188;
        do
        {
          for (uint64_t j = 0; j != v20; ++j)
          {
            if (*(void *)v188 != v21) {
              objc_enumerationMutation(v18);
            }
            uint64_t v23 = *(void *)(*((void *)&v187 + 1) + 8 * j);
            objc_opt_class();
            if (objc_opt_isKindOfClass())
            {
              uint64_t v24 = [GEOPBTransitLine alloc];
              if (a3) {
                uint64_t v25 = [(GEOPBTransitLine *)v24 initWithJSON:v23];
              }
              else {
                uint64_t v25 = [(GEOPBTransitLine *)v24 initWithDictionary:v23];
              }
              v26 = (void *)v25;
              [v6 addLine:v25];
            }
          }
          uint64_t v20 = [v18 countByEnumeratingWithState:&v187 objects:v206 count:16];
        }
        while (v20);
      }

      id v5 = v142;
    }

    if (a3) {
      v27 = @"accessPoint";
    }
    else {
      v27 = @"access_point";
    }
    id v28 = [v5 objectForKeyedSubscript:v27];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      long long v185 = 0u;
      long long v186 = 0u;
      long long v183 = 0u;
      long long v184 = 0u;
      id v29 = v28;
      uint64_t v30 = [v29 countByEnumeratingWithState:&v183 objects:v205 count:16];
      if (v30)
      {
        uint64_t v31 = v30;
        uint64_t v32 = *(void *)v184;
        do
        {
          for (uint64_t k = 0; k != v31; ++k)
          {
            if (*(void *)v184 != v32) {
              objc_enumerationMutation(v29);
            }
            uint64_t v34 = *(void *)(*((void *)&v183 + 1) + 8 * k);
            objc_opt_class();
            if (objc_opt_isKindOfClass())
            {
              v35 = [GEOPBTransitAccessPoint alloc];
              if (a3) {
                uint64_t v36 = [(GEOPBTransitAccessPoint *)v35 initWithJSON:v34];
              }
              else {
                uint64_t v36 = [(GEOPBTransitAccessPoint *)v35 initWithDictionary:v34];
              }
              id v37 = (void *)v36;
              [v6 addAccessPoint:v36];
            }
          }
          uint64_t v31 = [v29 countByEnumeratingWithState:&v183 objects:v205 count:16];
        }
        while (v31);
      }

      id v5 = v142;
    }

    v38 = [v5 objectForKeyedSubscript:@"walking"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      long long v181 = 0u;
      long long v182 = 0u;
      long long v179 = 0u;
      long long v180 = 0u;
      id v39 = v38;
      uint64_t v40 = [v39 countByEnumeratingWithState:&v179 objects:v204 count:16];
      if (v40)
      {
        uint64_t v41 = v40;
        uint64_t v42 = *(void *)v180;
        do
        {
          for (uint64_t m = 0; m != v41; ++m)
          {
            if (*(void *)v180 != v42) {
              objc_enumerationMutation(v39);
            }
            uint64_t v44 = *(void *)(*((void *)&v179 + 1) + 8 * m);
            objc_opt_class();
            if (objc_opt_isKindOfClass())
            {
              id v45 = [GEORoute alloc];
              if (a3) {
                uint64_t v46 = [(GEORoute *)v45 initWithJSON:v44];
              }
              else {
                uint64_t v46 = [(GEORoute *)v45 initWithDictionary:v44];
              }
              v47 = (void *)v46;
              [v6 addWalking:v46];
            }
          }
          uint64_t v41 = [v39 countByEnumeratingWithState:&v179 objects:v204 count:16];
        }
        while (v41);
      }

      id v5 = v142;
    }

    v48 = [v5 objectForKeyedSubscript:@"stop"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      long long v177 = 0u;
      long long v178 = 0u;
      long long v175 = 0u;
      long long v176 = 0u;
      id v49 = v48;
      uint64_t v50 = [v49 countByEnumeratingWithState:&v175 objects:v203 count:16];
      if (v50)
      {
        uint64_t v51 = v50;
        uint64_t v52 = *(void *)v176;
        do
        {
          for (uint64_t n = 0; n != v51; ++n)
          {
            if (*(void *)v176 != v52) {
              objc_enumerationMutation(v49);
            }
            uint64_t v54 = *(void *)(*((void *)&v175 + 1) + 8 * n);
            objc_opt_class();
            if (objc_opt_isKindOfClass())
            {
              v55 = [GEOPBTransitStop alloc];
              if (a3) {
                uint64_t v56 = [(GEOPBTransitStop *)v55 initWithJSON:v54];
              }
              else {
                uint64_t v56 = [(GEOPBTransitStop *)v55 initWithDictionary:v54];
              }
              id v57 = (void *)v56;
              [v6 addStop:v56];
            }
          }
          uint64_t v51 = [v49 countByEnumeratingWithState:&v175 objects:v203 count:16];
        }
        while (v51);
      }

      id v5 = v142;
    }

    if (a3) {
      uint64_t v58 = @"zilchPoints";
    }
    else {
      uint64_t v58 = @"zilch_points";
    }
    uint64_t v59 = [v5 objectForKeyedSubscript:v58];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      long long v173 = 0u;
      long long v174 = 0u;
      long long v171 = 0u;
      long long v172 = 0u;
      id v60 = v59;
      uint64_t v61 = [v60 countByEnumeratingWithState:&v171 objects:v202 count:16];
      if (v61)
      {
        uint64_t v62 = v61;
        uint64_t v63 = *(void *)v172;
        do
        {
          for (iuint64_t i = 0; ii != v62; ++ii)
          {
            if (*(void *)v172 != v63) {
              objc_enumerationMutation(v60);
            }
            uint64_t v65 = *(void *)(*((void *)&v171 + 1) + 8 * ii);
            objc_opt_class();
            if (objc_opt_isKindOfClass())
            {
              uint64_t v66 = (void *)[objc_alloc(MEMORY[0x1E4F1C9B8]) initWithBase64EncodedString:v65 options:0];
              [v6 addZilchPoints:v66];
            }
          }
          uint64_t v62 = [v60 countByEnumeratingWithState:&v171 objects:v202 count:16];
        }
        while (v62);
      }

      id v5 = v142;
    }

    uint64_t v67 = [v5 objectForKeyedSubscript:@"system"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      long long v169 = 0u;
      long long v170 = 0u;
      long long v167 = 0u;
      long long v168 = 0u;
      id v68 = v67;
      uint64_t v69 = [v68 countByEnumeratingWithState:&v167 objects:v201 count:16];
      if (v69)
      {
        uint64_t v70 = v69;
        uint64_t v71 = *(void *)v168;
        do
        {
          for (juint64_t j = 0; jj != v70; ++jj)
          {
            if (*(void *)v168 != v71) {
              objc_enumerationMutation(v68);
            }
            uint64_t v73 = *(void *)(*((void *)&v167 + 1) + 8 * jj);
            objc_opt_class();
            if (objc_opt_isKindOfClass())
            {
              id v74 = [GEOPBTransitSystem alloc];
              if (a3) {
                uint64_t v75 = [(GEOPBTransitSystem *)v74 initWithJSON:v73];
              }
              else {
                uint64_t v75 = [(GEOPBTransitSystem *)v74 initWithDictionary:v73];
              }
              uint64_t v76 = (void *)v75;
              [v6 addSystem:v75];
            }
          }
          uint64_t v70 = [v68 countByEnumeratingWithState:&v167 objects:v201 count:16];
        }
        while (v70);
      }

      id v5 = v142;
    }

    if (a3) {
      uint64_t v77 = @"transitIncident";
    }
    else {
      uint64_t v77 = @"transit_incident";
    }
    v78 = [v5 objectForKeyedSubscript:v77];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      long long v165 = 0u;
      long long v166 = 0u;
      long long v163 = 0u;
      long long v164 = 0u;
      id v79 = v78;
      uint64_t v80 = [v79 countByEnumeratingWithState:&v163 objects:v200 count:16];
      if (v80)
      {
        uint64_t v81 = v80;
        uint64_t v82 = *(void *)v164;
        do
        {
          uint64_t v83 = 0;
          do
          {
            if (*(void *)v164 != v82) {
              objc_enumerationMutation(v79);
            }
            uint64_t v84 = *(void **)(*((void *)&v163 + 1) + 8 * v83);
            objc_opt_class();
            if (objc_opt_isKindOfClass())
            {
              uint64_t v85 = [GEOPBTransitIncident alloc];
              if (v85) {
                v86 = (void *)-[GEOPBTransitIncident _initWithDictionary:isJSON:](v85, v84, a3);
              }
              else {
                v86 = 0;
              }
              [v6 addTransitIncident:v86];
            }
            ++v83;
          }
          while (v81 != v83);
          uint64_t v87 = [v79 countByEnumeratingWithState:&v163 objects:v200 count:16];
          uint64_t v81 = v87;
        }
        while (v87);
      }

      id v5 = v142;
    }

    id v88 = [v5 objectForKeyedSubscript:@"hall"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      long long v161 = 0u;
      long long v162 = 0u;
      long long v159 = 0u;
      long long v160 = 0u;
      id v89 = v88;
      uint64_t v90 = [v89 countByEnumeratingWithState:&v159 objects:v199 count:16];
      if (v90)
      {
        uint64_t v91 = v90;
        uint64_t v92 = *(void *)v160;
        do
        {
          for (kuint64_t k = 0; kk != v91; ++kk)
          {
            if (*(void *)v160 != v92) {
              objc_enumerationMutation(v89);
            }
            uint64_t v94 = *(void *)(*((void *)&v159 + 1) + 8 * kk);
            objc_opt_class();
            if (objc_opt_isKindOfClass())
            {
              v95 = [GEOPBTransitHall alloc];
              if (a3) {
                uint64_t v96 = [(GEOPBTransitHall *)v95 initWithJSON:v94];
              }
              else {
                uint64_t v96 = [(GEOPBTransitHall *)v95 initWithDictionary:v94];
              }
              v97 = (void *)v96;
              [v6 addHall:v96];
            }
          }
          uint64_t v91 = [v89 countByEnumeratingWithState:&v159 objects:v199 count:16];
        }
        while (v91);
      }

      id v5 = v142;
    }

    v98 = [v5 objectForKeyedSubscript:@"artwork"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      long long v157 = 0u;
      long long v158 = 0u;
      long long v155 = 0u;
      long long v156 = 0u;
      id v99 = v98;
      uint64_t v100 = [v99 countByEnumeratingWithState:&v155 objects:v198 count:16];
      if (v100)
      {
        uint64_t v101 = v100;
        uint64_t v102 = *(void *)v156;
        do
        {
          for (muint64_t m = 0; mm != v101; ++mm)
          {
            if (*(void *)v156 != v102) {
              objc_enumerationMutation(v99);
            }
            uint64_t v104 = *(void *)(*((void *)&v155 + 1) + 8 * mm);
            objc_opt_class();
            if (objc_opt_isKindOfClass())
            {
              id v105 = [GEOPBTransitArtwork alloc];
              if (a3) {
                uint64_t v106 = [(GEOPBTransitArtwork *)v105 initWithJSON:v104];
              }
              else {
                uint64_t v106 = [(GEOPBTransitArtwork *)v105 initWithDictionary:v104];
              }
              id v107 = (void *)v106;
              [v6 addArtwork:v106];
            }
          }
          uint64_t v101 = [v99 countByEnumeratingWithState:&v155 objects:v198 count:16];
        }
        while (v101);
      }

      id v5 = v142;
    }

    if (a3) {
      uint64_t v108 = @"transitIncidentMessage";
    }
    else {
      uint64_t v108 = @"transit_incident_message";
    }
    uint64_t v109 = [v5 objectForKeyedSubscript:v108];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      long long v153 = 0u;
      long long v154 = 0u;
      long long v151 = 0u;
      long long v152 = 0u;
      id v110 = v109;
      uint64_t v111 = [v110 countByEnumeratingWithState:&v151 objects:v197 count:16];
      if (v111)
      {
        uint64_t v112 = v111;
        uint64_t v113 = *(void *)v152;
        do
        {
          uint64_t v114 = 0;
          do
          {
            if (*(void *)v152 != v113) {
              objc_enumerationMutation(v110);
            }
            v115 = *(void **)(*((void *)&v151 + 1) + 8 * v114);
            objc_opt_class();
            if (objc_opt_isKindOfClass())
            {
              v116 = [GEOPBTransitRoutingIncidentMessage alloc];
              if (v116) {
                v117 = (void *)-[GEOPBTransitRoutingIncidentMessage _initWithDictionary:isJSON:]((uint64_t)v116, v115, a3);
              }
              else {
                v117 = 0;
              }
              [v6 addTransitIncidentMessage:v117];
            }
            ++v114;
          }
          while (v112 != v114);
          uint64_t v118 = [v110 countByEnumeratingWithState:&v151 objects:v197 count:16];
          uint64_t v112 = v118;
        }
        while (v118);
      }

      id v5 = v142;
    }

    id v119 = [v5 objectForKeyedSubscript:@"step"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      long long v149 = 0u;
      long long v150 = 0u;
      long long v147 = 0u;
      long long v148 = 0u;
      id v120 = v119;
      uint64_t v121 = [v120 countByEnumeratingWithState:&v147 objects:v196 count:16];
      if (v121)
      {
        uint64_t v122 = v121;
        uint64_t v123 = *(void *)v148;
        do
        {
          for (nuint64_t n = 0; nn != v122; ++nn)
          {
            if (*(void *)v148 != v123) {
              objc_enumerationMutation(v120);
            }
            uint64_t v125 = *(void *)(*((void *)&v147 + 1) + 8 * nn);
            objc_opt_class();
            if (objc_opt_isKindOfClass())
            {
              long long v126 = [GEOTransitStep alloc];
              if (a3) {
                uint64_t v127 = [(GEOTransitStep *)v126 initWithJSON:v125];
              }
              else {
                uint64_t v127 = [(GEOTransitStep *)v126 initWithDictionary:v125];
              }
              long long v128 = (void *)v127;
              [v6 addStep:v127];
            }
          }
          uint64_t v122 = [v120 countByEnumeratingWithState:&v147 objects:v196 count:16];
        }
        while (v122);
      }

      id v5 = v142;
    }

    if (a3) {
      long long v129 = @"paymentMethod";
    }
    else {
      long long v129 = @"payment_method";
    }
    long long v130 = [v5 objectForKeyedSubscript:v129];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      long long v145 = 0u;
      long long v146 = 0u;
      long long v143 = 0u;
      long long v144 = 0u;
      id v131 = v130;
      uint64_t v132 = [v131 countByEnumeratingWithState:&v143 objects:v195 count:16];
      if (v132)
      {
        uint64_t v133 = v132;
        uint64_t v134 = *(void *)v144;
        do
        {
          for (uint64_t i1 = 0; i1 != v133; ++i1)
          {
            if (*(void *)v144 != v134) {
              objc_enumerationMutation(v131);
            }
            uint64_t v136 = *(void *)(*((void *)&v143 + 1) + 8 * i1);
            objc_opt_class();
            if (objc_opt_isKindOfClass())
            {
              long long v137 = [GEOPBTransitPaymentMethod alloc];
              if (a3) {
                uint64_t v138 = [(GEOPBTransitPaymentMethod *)v137 initWithJSON:v136];
              }
              else {
                uint64_t v138 = [(GEOPBTransitPaymentMethod *)v137 initWithDictionary:v136];
              }
              long long v139 = (void *)v138;
              [v6 addPaymentMethod:v138];
            }
          }
          uint64_t v133 = [v131 countByEnumeratingWithState:&v143 objects:v195 count:16];
        }
        while (v133);
      }

      id v5 = v142;
    }

    id v140 = v6;
  }
  else
  {
    id v140 = 0;
  }

  return v140;
}

- (GEOTransitDecoderData)initWithJSON:(id)a3
{
  return (GEOTransitDecoderData *)-[GEOTransitDecoderData _initWithDictionary:isJSON:](self, a3, 1);
}

- (void)readAll:(BOOL)a3
{
  BOOL v3 = a3;
  p_readerLocuint64_t k = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  reader = self->_reader;
  if (reader)
  {
    uint64_t v7 = reader;
    objc_sync_enter(v7);
    if (v3) {
      id v8 = (int *)&readAll__recursiveTag_571;
    }
    else {
      id v8 = (int *)&readAll__nonRecursiveTag_572;
    }
    GEOTransitDecoderDataReadSpecified((uint64_t)self, (unint64_t)self->_reader, v8);
    objc_sync_exit(v7);
  }
  if (v3) {
    _GEOTransitDecoderDataCallReadAllRecursiveWithoutSynchronized((id *)&self->super.super.isa);
  }

  os_unfair_lock_unlock(p_readerLock);
}

+ (BOOL)isValid:(id)a3
{
  return GEOTransitDecoderDataIsValid((char *)a3);
}

- (BOOL)readFrom:(id)a3
{
  return GEOTransitDecoderDataReadAllFrom((uint64_t)self, a3, 0);
}

- (void)writeTo:(id)a3
{
  uint64_t v125 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  p_readerLocuint64_t k = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  if (self->_reader && (_GEOTransitDecoderDataIsDirty((uint64_t)self) & 1) == 0)
  {
    uint64_t v58 = self->_reader;
    objc_sync_enter(v58);
    *(void *)((char *)self->_reader + (int)*MEMORY[0x1E4F940E0]) = self->_readerMarkLength;
    [(PBDataReader *)self->_reader seekToOffset:self->_readerMarkPos];
    uint64_t v59 = [(PBDataReader *)self->_reader readBytes:self->_readerMarkLength - self->_readerMarkPos];
    [v4 writeData:v59];
    os_unfair_lock_unlock(p_readerLock);

    objc_sync_exit(v58);
  }
  else
  {
    os_unfair_lock_unlock(&self->_readerLock);
    [(GEOTransitDecoderData *)self readAll:0];
    long long v110 = 0u;
    long long v111 = 0u;
    long long v108 = 0u;
    long long v109 = 0u;
    id v6 = self->_stations;
    uint64_t v7 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v108 objects:v124 count:16];
    if (v7)
    {
      uint64_t v8 = *(void *)v109;
      do
      {
        uint64_t v9 = 0;
        do
        {
          if (*(void *)v109 != v8) {
            objc_enumerationMutation(v6);
          }
          PBDataWriterWriteSubmessage();
          ++v9;
        }
        while (v7 != v9);
        uint64_t v7 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v108 objects:v124 count:16];
      }
      while (v7);
    }

    long long v106 = 0u;
    long long v107 = 0u;
    long long v104 = 0u;
    long long v105 = 0u;
    uint64_t v10 = self->_lines;
    uint64_t v11 = [(NSMutableArray *)v10 countByEnumeratingWithState:&v104 objects:v123 count:16];
    if (v11)
    {
      uint64_t v12 = *(void *)v105;
      do
      {
        uint64_t v13 = 0;
        do
        {
          if (*(void *)v105 != v12) {
            objc_enumerationMutation(v10);
          }
          PBDataWriterWriteSubmessage();
          ++v13;
        }
        while (v11 != v13);
        uint64_t v11 = [(NSMutableArray *)v10 countByEnumeratingWithState:&v104 objects:v123 count:16];
      }
      while (v11);
    }

    long long v102 = 0u;
    long long v103 = 0u;
    long long v100 = 0u;
    long long v101 = 0u;
    id v14 = self->_accessPoints;
    uint64_t v15 = [(NSMutableArray *)v14 countByEnumeratingWithState:&v100 objects:v122 count:16];
    if (v15)
    {
      uint64_t v16 = *(void *)v101;
      do
      {
        uint64_t v17 = 0;
        do
        {
          if (*(void *)v101 != v16) {
            objc_enumerationMutation(v14);
          }
          PBDataWriterWriteSubmessage();
          ++v17;
        }
        while (v15 != v17);
        uint64_t v15 = [(NSMutableArray *)v14 countByEnumeratingWithState:&v100 objects:v122 count:16];
      }
      while (v15);
    }

    long long v98 = 0u;
    long long v99 = 0u;
    long long v96 = 0u;
    long long v97 = 0u;
    id v18 = self->_walkings;
    uint64_t v19 = [(NSMutableArray *)v18 countByEnumeratingWithState:&v96 objects:v121 count:16];
    if (v19)
    {
      uint64_t v20 = *(void *)v97;
      do
      {
        uint64_t v21 = 0;
        do
        {
          if (*(void *)v97 != v20) {
            objc_enumerationMutation(v18);
          }
          PBDataWriterWriteSubmessage();
          ++v21;
        }
        while (v19 != v21);
        uint64_t v19 = [(NSMutableArray *)v18 countByEnumeratingWithState:&v96 objects:v121 count:16];
      }
      while (v19);
    }

    long long v94 = 0u;
    long long v95 = 0u;
    long long v92 = 0u;
    long long v93 = 0u;
    id v22 = self->_stops;
    uint64_t v23 = [(NSMutableArray *)v22 countByEnumeratingWithState:&v92 objects:v120 count:16];
    if (v23)
    {
      uint64_t v24 = *(void *)v93;
      do
      {
        uint64_t v25 = 0;
        do
        {
          if (*(void *)v93 != v24) {
            objc_enumerationMutation(v22);
          }
          PBDataWriterWriteSubmessage();
          ++v25;
        }
        while (v23 != v25);
        uint64_t v23 = [(NSMutableArray *)v22 countByEnumeratingWithState:&v92 objects:v120 count:16];
      }
      while (v23);
    }

    long long v90 = 0u;
    long long v91 = 0u;
    long long v88 = 0u;
    long long v89 = 0u;
    v26 = self->_zilchPoints;
    uint64_t v27 = [(NSMutableArray *)v26 countByEnumeratingWithState:&v88 objects:v119 count:16];
    if (v27)
    {
      uint64_t v28 = *(void *)v89;
      do
      {
        uint64_t v29 = 0;
        do
        {
          if (*(void *)v89 != v28) {
            objc_enumerationMutation(v26);
          }
          PBDataWriterWriteDataField();
          ++v29;
        }
        while (v27 != v29);
        uint64_t v27 = [(NSMutableArray *)v26 countByEnumeratingWithState:&v88 objects:v119 count:16];
      }
      while (v27);
    }

    long long v86 = 0u;
    long long v87 = 0u;
    long long v84 = 0u;
    long long v85 = 0u;
    uint64_t v30 = self->_systems;
    uint64_t v31 = [(NSMutableArray *)v30 countByEnumeratingWithState:&v84 objects:v118 count:16];
    if (v31)
    {
      uint64_t v32 = *(void *)v85;
      do
      {
        uint64_t v33 = 0;
        do
        {
          if (*(void *)v85 != v32) {
            objc_enumerationMutation(v30);
          }
          PBDataWriterWriteSubmessage();
          ++v33;
        }
        while (v31 != v33);
        uint64_t v31 = [(NSMutableArray *)v30 countByEnumeratingWithState:&v84 objects:v118 count:16];
      }
      while (v31);
    }

    long long v82 = 0u;
    long long v83 = 0u;
    long long v80 = 0u;
    long long v81 = 0u;
    uint64_t v34 = self->_transitIncidents;
    uint64_t v35 = [(NSMutableArray *)v34 countByEnumeratingWithState:&v80 objects:v117 count:16];
    if (v35)
    {
      uint64_t v36 = *(void *)v81;
      do
      {
        uint64_t v37 = 0;
        do
        {
          if (*(void *)v81 != v36) {
            objc_enumerationMutation(v34);
          }
          PBDataWriterWriteSubmessage();
          ++v37;
        }
        while (v35 != v37);
        uint64_t v35 = [(NSMutableArray *)v34 countByEnumeratingWithState:&v80 objects:v117 count:16];
      }
      while (v35);
    }

    long long v78 = 0u;
    long long v79 = 0u;
    long long v76 = 0u;
    long long v77 = 0u;
    v38 = self->_halls;
    uint64_t v39 = [(NSMutableArray *)v38 countByEnumeratingWithState:&v76 objects:v116 count:16];
    if (v39)
    {
      uint64_t v40 = *(void *)v77;
      do
      {
        uint64_t v41 = 0;
        do
        {
          if (*(void *)v77 != v40) {
            objc_enumerationMutation(v38);
          }
          PBDataWriterWriteSubmessage();
          ++v41;
        }
        while (v39 != v41);
        uint64_t v39 = [(NSMutableArray *)v38 countByEnumeratingWithState:&v76 objects:v116 count:16];
      }
      while (v39);
    }

    long long v74 = 0u;
    long long v75 = 0u;
    long long v72 = 0u;
    long long v73 = 0u;
    uint64_t v42 = self->_artworks;
    uint64_t v43 = [(NSMutableArray *)v42 countByEnumeratingWithState:&v72 objects:v115 count:16];
    if (v43)
    {
      uint64_t v44 = *(void *)v73;
      do
      {
        uint64_t v45 = 0;
        do
        {
          if (*(void *)v73 != v44) {
            objc_enumerationMutation(v42);
          }
          PBDataWriterWriteSubmessage();
          ++v45;
        }
        while (v43 != v45);
        uint64_t v43 = [(NSMutableArray *)v42 countByEnumeratingWithState:&v72 objects:v115 count:16];
      }
      while (v43);
    }

    long long v70 = 0u;
    long long v71 = 0u;
    long long v68 = 0u;
    long long v69 = 0u;
    uint64_t v46 = self->_transitIncidentMessages;
    uint64_t v47 = [(NSMutableArray *)v46 countByEnumeratingWithState:&v68 objects:v114 count:16];
    if (v47)
    {
      uint64_t v48 = *(void *)v69;
      do
      {
        uint64_t v49 = 0;
        do
        {
          if (*(void *)v69 != v48) {
            objc_enumerationMutation(v46);
          }
          PBDataWriterWriteSubmessage();
          ++v49;
        }
        while (v47 != v49);
        uint64_t v47 = [(NSMutableArray *)v46 countByEnumeratingWithState:&v68 objects:v114 count:16];
      }
      while (v47);
    }

    long long v66 = 0u;
    long long v67 = 0u;
    long long v64 = 0u;
    long long v65 = 0u;
    uint64_t v50 = self->_steps;
    uint64_t v51 = [(NSMutableArray *)v50 countByEnumeratingWithState:&v64 objects:v113 count:16];
    if (v51)
    {
      uint64_t v52 = *(void *)v65;
      do
      {
        uint64_t v53 = 0;
        do
        {
          if (*(void *)v65 != v52) {
            objc_enumerationMutation(v50);
          }
          PBDataWriterWriteSubmessage();
          ++v53;
        }
        while (v51 != v53);
        uint64_t v51 = [(NSMutableArray *)v50 countByEnumeratingWithState:&v64 objects:v113 count:16];
      }
      while (v51);
    }

    long long v62 = 0u;
    long long v63 = 0u;
    long long v60 = 0u;
    long long v61 = 0u;
    uint64_t v54 = self->_paymentMethods;
    uint64_t v55 = [(NSMutableArray *)v54 countByEnumeratingWithState:&v60 objects:v112 count:16];
    if (v55)
    {
      uint64_t v56 = *(void *)v61;
      do
      {
        uint64_t v57 = 0;
        do
        {
          if (*(void *)v61 != v56) {
            objc_enumerationMutation(v54);
          }
          PBDataWriterWriteSubmessage();
          ++v57;
        }
        while (v55 != v57);
        uint64_t v55 = [(NSMutableArray *)v54 countByEnumeratingWithState:&v60 objects:v112 count:16];
      }
      while (v55);
    }

    -[PBUnknownFields writeTo:](self->_unknownFields, "writeTo:", v4, v60);
  }
}

- (BOOL)hasGreenTeaWithValue:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v62 = *MEMORY[0x1E4F143B8];
  -[GEOTransitDecoderData _readAccessPoints]((uint64_t)self);
  long long v54 = 0u;
  long long v55 = 0u;
  long long v52 = 0u;
  long long v53 = 0u;
  id v5 = self->_accessPoints;
  uint64_t v6 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v52 objects:v61 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v53;
LABEL_3:
    uint64_t v9 = 0;
    while (1)
    {
      if (*(void *)v53 != v8) {
        objc_enumerationMutation(v5);
      }
      if ([*(id *)(*((void *)&v52 + 1) + 8 * v9) hasGreenTeaWithValue:v3]) {
        goto LABEL_50;
      }
      if (v7 == ++v9)
      {
        uint64_t v7 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v52 objects:v61 count:16];
        if (v7) {
          goto LABEL_3;
        }
        break;
      }
    }
  }

  -[GEOTransitDecoderData _readHalls]((uint64_t)self);
  long long v50 = 0u;
  long long v51 = 0u;
  long long v48 = 0u;
  long long v49 = 0u;
  id v5 = self->_halls;
  uint64_t v10 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v48 objects:v60 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v49;
LABEL_11:
    uint64_t v13 = 0;
    while (1)
    {
      if (*(void *)v49 != v12) {
        objc_enumerationMutation(v5);
      }
      if ([*(id *)(*((void *)&v48 + 1) + 8 * v13) hasGreenTeaWithValue:v3]) {
        goto LABEL_50;
      }
      if (v11 == ++v13)
      {
        uint64_t v11 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v48 objects:v60 count:16];
        if (v11) {
          goto LABEL_11;
        }
        break;
      }
    }
  }

  -[GEOTransitDecoderData _readStations]((uint64_t)self);
  long long v46 = 0u;
  long long v47 = 0u;
  long long v44 = 0u;
  long long v45 = 0u;
  id v5 = self->_stations;
  uint64_t v14 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v44 objects:v59 count:16];
  if (v14)
  {
    uint64_t v15 = v14;
    uint64_t v16 = *(void *)v45;
LABEL_19:
    uint64_t v17 = 0;
    while (1)
    {
      if (*(void *)v45 != v16) {
        objc_enumerationMutation(v5);
      }
      if ([*(id *)(*((void *)&v44 + 1) + 8 * v17) hasGreenTeaWithValue:v3]) {
        goto LABEL_50;
      }
      if (v15 == ++v17)
      {
        uint64_t v15 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v44 objects:v59 count:16];
        if (v15) {
          goto LABEL_19;
        }
        break;
      }
    }
  }

  -[GEOTransitDecoderData _readSteps]((uint64_t)self);
  long long v42 = 0u;
  long long v43 = 0u;
  long long v40 = 0u;
  long long v41 = 0u;
  id v5 = self->_steps;
  uint64_t v18 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v40 objects:v58 count:16];
  if (v18)
  {
    uint64_t v19 = v18;
    uint64_t v20 = *(void *)v41;
LABEL_27:
    uint64_t v21 = 0;
    while (1)
    {
      if (*(void *)v41 != v20) {
        objc_enumerationMutation(v5);
      }
      if ([*(id *)(*((void *)&v40 + 1) + 8 * v21) hasGreenTeaWithValue:v3]) {
        goto LABEL_50;
      }
      if (v19 == ++v21)
      {
        uint64_t v19 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v40 objects:v58 count:16];
        if (v19) {
          goto LABEL_27;
        }
        break;
      }
    }
  }

  -[GEOTransitDecoderData _readStops]((uint64_t)self);
  long long v38 = 0u;
  long long v39 = 0u;
  long long v36 = 0u;
  long long v37 = 0u;
  id v5 = self->_stops;
  uint64_t v22 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v36 objects:v57 count:16];
  if (v22)
  {
    uint64_t v23 = v22;
    uint64_t v24 = *(void *)v37;
LABEL_35:
    uint64_t v25 = 0;
    while (1)
    {
      if (*(void *)v37 != v24) {
        objc_enumerationMutation(v5);
      }
      if ([*(id *)(*((void *)&v36 + 1) + 8 * v25) hasGreenTeaWithValue:v3]) {
        goto LABEL_50;
      }
      if (v23 == ++v25)
      {
        uint64_t v23 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v36 objects:v57 count:16];
        if (v23) {
          goto LABEL_35;
        }
        break;
      }
    }
  }

  -[GEOTransitDecoderData _readWalkings]((uint64_t)self);
  long long v34 = 0u;
  long long v35 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  id v5 = self->_walkings;
  uint64_t v26 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v32 objects:v56 count:16];
  if (v26)
  {
    uint64_t v27 = v26;
    uint64_t v28 = *(void *)v33;
LABEL_43:
    uint64_t v29 = 0;
    while (1)
    {
      if (*(void *)v33 != v28) {
        objc_enumerationMutation(v5);
      }
      if (objc_msgSend(*(id *)(*((void *)&v32 + 1) + 8 * v29), "hasGreenTeaWithValue:", v3, (void)v32)) {
        break;
      }
      if (v27 == ++v29)
      {
        uint64_t v27 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v32 objects:v56 count:16];
        if (v27) {
          goto LABEL_43;
        }
        goto LABEL_49;
      }
    }
LABEL_50:
    BOOL v30 = 1;
    goto LABEL_51;
  }
LABEL_49:
  BOOL v30 = 0;
LABEL_51:

  return v30;
}

- (void)copyTo:(id)a3
{
  uint64_t v56 = (id *)a3;
  [(GEOTransitDecoderData *)self readAll:0];
  os_unfair_lock_lock_with_options();
  objc_storeStrong(v56 + 1, self->_reader);
  *((_DWORD *)v56 + 32) = self->_readerMarkPos;
  *((_DWORD *)v56 + 33) = self->_readerMarkLength;
  os_unfair_lock_unlock(&self->_readerLock);
  if ([(GEOTransitDecoderData *)self stationsCount])
  {
    [v56 clearStations];
    unint64_t v4 = [(GEOTransitDecoderData *)self stationsCount];
    if (v4)
    {
      unint64_t v5 = v4;
      for (uint64_t i = 0; i != v5; ++i)
      {
        uint64_t v7 = [(GEOTransitDecoderData *)self stationAtIndex:i];
        [v56 addStation:v7];
      }
    }
  }
  if ([(GEOTransitDecoderData *)self linesCount])
  {
    [v56 clearLines];
    unint64_t v8 = [(GEOTransitDecoderData *)self linesCount];
    if (v8)
    {
      unint64_t v9 = v8;
      for (uint64_t j = 0; j != v9; ++j)
      {
        uint64_t v11 = [(GEOTransitDecoderData *)self lineAtIndex:j];
        [v56 addLine:v11];
      }
    }
  }
  if ([(GEOTransitDecoderData *)self accessPointsCount])
  {
    [v56 clearAccessPoints];
    unint64_t v12 = [(GEOTransitDecoderData *)self accessPointsCount];
    if (v12)
    {
      unint64_t v13 = v12;
      for (uint64_t k = 0; k != v13; ++k)
      {
        uint64_t v15 = [(GEOTransitDecoderData *)self accessPointAtIndex:k];
        [v56 addAccessPoint:v15];
      }
    }
  }
  if ([(GEOTransitDecoderData *)self walkingsCount])
  {
    [v56 clearWalkings];
    unint64_t v16 = [(GEOTransitDecoderData *)self walkingsCount];
    if (v16)
    {
      unint64_t v17 = v16;
      for (uint64_t m = 0; m != v17; ++m)
      {
        uint64_t v19 = [(GEOTransitDecoderData *)self walkingAtIndex:m];
        [v56 addWalking:v19];
      }
    }
  }
  if ([(GEOTransitDecoderData *)self stopsCount])
  {
    [v56 clearStops];
    unint64_t v20 = [(GEOTransitDecoderData *)self stopsCount];
    if (v20)
    {
      unint64_t v21 = v20;
      for (uint64_t n = 0; n != v21; ++n)
      {
        uint64_t v23 = [(GEOTransitDecoderData *)self stopAtIndex:n];
        [v56 addStop:v23];
      }
    }
  }
  if ([(GEOTransitDecoderData *)self zilchPointsCount])
  {
    [v56 clearZilchPoints];
    unint64_t v24 = [(GEOTransitDecoderData *)self zilchPointsCount];
    if (v24)
    {
      unint64_t v25 = v24;
      for (iuint64_t i = 0; ii != v25; ++ii)
      {
        uint64_t v27 = [(GEOTransitDecoderData *)self zilchPointsAtIndex:ii];
        [v56 addZilchPoints:v27];
      }
    }
  }
  if ([(GEOTransitDecoderData *)self systemsCount])
  {
    [v56 clearSystems];
    unint64_t v28 = [(GEOTransitDecoderData *)self systemsCount];
    if (v28)
    {
      unint64_t v29 = v28;
      for (juint64_t j = 0; jj != v29; ++jj)
      {
        uint64_t v31 = [(GEOTransitDecoderData *)self systemAtIndex:jj];
        [v56 addSystem:v31];
      }
    }
  }
  if ([(GEOTransitDecoderData *)self transitIncidentsCount])
  {
    [v56 clearTransitIncidents];
    unint64_t v32 = [(GEOTransitDecoderData *)self transitIncidentsCount];
    if (v32)
    {
      unint64_t v33 = v32;
      for (kuint64_t k = 0; kk != v33; ++kk)
      {
        long long v35 = [(GEOTransitDecoderData *)self transitIncidentAtIndex:kk];
        [v56 addTransitIncident:v35];
      }
    }
  }
  if ([(GEOTransitDecoderData *)self hallsCount])
  {
    [v56 clearHalls];
    unint64_t v36 = [(GEOTransitDecoderData *)self hallsCount];
    if (v36)
    {
      unint64_t v37 = v36;
      for (muint64_t m = 0; mm != v37; ++mm)
      {
        long long v39 = [(GEOTransitDecoderData *)self hallAtIndex:mm];
        [v56 addHall:v39];
      }
    }
  }
  if ([(GEOTransitDecoderData *)self artworksCount])
  {
    [v56 clearArtworks];
    unint64_t v40 = [(GEOTransitDecoderData *)self artworksCount];
    if (v40)
    {
      unint64_t v41 = v40;
      for (nuint64_t n = 0; nn != v41; ++nn)
      {
        long long v43 = [(GEOTransitDecoderData *)self artworkAtIndex:nn];
        [v56 addArtwork:v43];
      }
    }
  }
  if ([(GEOTransitDecoderData *)self transitIncidentMessagesCount])
  {
    [v56 clearTransitIncidentMessages];
    unint64_t v44 = [(GEOTransitDecoderData *)self transitIncidentMessagesCount];
    if (v44)
    {
      unint64_t v45 = v44;
      for (uint64_t i1 = 0; i1 != v45; ++i1)
      {
        long long v47 = [(GEOTransitDecoderData *)self transitIncidentMessageAtIndex:i1];
        [v56 addTransitIncidentMessage:v47];
      }
    }
  }
  if ([(GEOTransitDecoderData *)self stepsCount])
  {
    [v56 clearSteps];
    unint64_t v48 = [(GEOTransitDecoderData *)self stepsCount];
    if (v48)
    {
      unint64_t v49 = v48;
      for (uint64_t i2 = 0; i2 != v49; ++i2)
      {
        long long v51 = [(GEOTransitDecoderData *)self stepAtIndex:i2];
        [v56 addStep:v51];
      }
    }
  }
  if ([(GEOTransitDecoderData *)self paymentMethodsCount])
  {
    [v56 clearPaymentMethods];
    unint64_t v52 = [(GEOTransitDecoderData *)self paymentMethodsCount];
    if (v52)
    {
      unint64_t v53 = v52;
      for (uint64_t i3 = 0; i3 != v53; ++i3)
      {
        long long v55 = [(GEOTransitDecoderData *)self paymentMethodAtIndex:i3];
        [v56 addPaymentMethod:v55];
      }
    }
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v139 = *MEMORY[0x1E4F143B8];
  unint64_t v5 = (id *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  os_unfair_lock_lock(&self->_readerLock);
  reader = self->_reader;
  if (reader)
  {
    uint64_t v7 = reader;
    objc_sync_enter(v7);
    if ((*(_WORD *)&self->_flags & 0x4000) == 0)
    {
      *(void *)((char *)self->_reader + (int)*MEMORY[0x1E4F940E0]) = self->_readerMarkLength;
      [(PBDataReader *)self->_reader seekToOffset:self->_readerMarkPos];
      GEOTransitDecoderDataReadAllFrom((uint64_t)v5, self->_reader, 0);
      os_unfair_lock_unlock(&self->_readerLock);
      objc_sync_exit(v7);

      return v5;
    }
    objc_sync_exit(v7);
  }
  os_unfair_lock_unlock(&self->_readerLock);
  [(GEOTransitDecoderData *)self readAll:0];
  long long v124 = 0u;
  long long v125 = 0u;
  long long v122 = 0u;
  long long v123 = 0u;
  unint64_t v8 = self->_stations;
  uint64_t v9 = [(NSMutableArray *)v8 countByEnumeratingWithState:&v122 objects:v138 count:16];
  if (v9)
  {
    uint64_t v10 = *(void *)v123;
    do
    {
      uint64_t v11 = 0;
      do
      {
        if (*(void *)v123 != v10) {
          objc_enumerationMutation(v8);
        }
        unint64_t v12 = (void *)[*(id *)(*((void *)&v122 + 1) + 8 * v11) copyWithZone:a3];
        [v5 addStation:v12];

        ++v11;
      }
      while (v9 != v11);
      uint64_t v9 = [(NSMutableArray *)v8 countByEnumeratingWithState:&v122 objects:v138 count:16];
    }
    while (v9);
  }

  long long v120 = 0u;
  long long v121 = 0u;
  long long v118 = 0u;
  long long v119 = 0u;
  unint64_t v13 = self->_lines;
  uint64_t v14 = [(NSMutableArray *)v13 countByEnumeratingWithState:&v118 objects:v137 count:16];
  if (v14)
  {
    uint64_t v15 = *(void *)v119;
    do
    {
      uint64_t v16 = 0;
      do
      {
        if (*(void *)v119 != v15) {
          objc_enumerationMutation(v13);
        }
        unint64_t v17 = (void *)[*(id *)(*((void *)&v118 + 1) + 8 * v16) copyWithZone:a3];
        [v5 addLine:v17];

        ++v16;
      }
      while (v14 != v16);
      uint64_t v14 = [(NSMutableArray *)v13 countByEnumeratingWithState:&v118 objects:v137 count:16];
    }
    while (v14);
  }

  long long v116 = 0u;
  long long v117 = 0u;
  long long v114 = 0u;
  long long v115 = 0u;
  uint64_t v18 = self->_accessPoints;
  uint64_t v19 = [(NSMutableArray *)v18 countByEnumeratingWithState:&v114 objects:v136 count:16];
  if (v19)
  {
    uint64_t v20 = *(void *)v115;
    do
    {
      uint64_t v21 = 0;
      do
      {
        if (*(void *)v115 != v20) {
          objc_enumerationMutation(v18);
        }
        uint64_t v22 = (void *)[*(id *)(*((void *)&v114 + 1) + 8 * v21) copyWithZone:a3];
        [v5 addAccessPoint:v22];

        ++v21;
      }
      while (v19 != v21);
      uint64_t v19 = [(NSMutableArray *)v18 countByEnumeratingWithState:&v114 objects:v136 count:16];
    }
    while (v19);
  }

  long long v112 = 0u;
  long long v113 = 0u;
  long long v110 = 0u;
  long long v111 = 0u;
  uint64_t v23 = self->_walkings;
  uint64_t v24 = [(NSMutableArray *)v23 countByEnumeratingWithState:&v110 objects:v135 count:16];
  if (v24)
  {
    uint64_t v25 = *(void *)v111;
    do
    {
      uint64_t v26 = 0;
      do
      {
        if (*(void *)v111 != v25) {
          objc_enumerationMutation(v23);
        }
        uint64_t v27 = (void *)[*(id *)(*((void *)&v110 + 1) + 8 * v26) copyWithZone:a3];
        [v5 addWalking:v27];

        ++v26;
      }
      while (v24 != v26);
      uint64_t v24 = [(NSMutableArray *)v23 countByEnumeratingWithState:&v110 objects:v135 count:16];
    }
    while (v24);
  }

  long long v108 = 0u;
  long long v109 = 0u;
  long long v106 = 0u;
  long long v107 = 0u;
  unint64_t v28 = self->_stops;
  uint64_t v29 = [(NSMutableArray *)v28 countByEnumeratingWithState:&v106 objects:v134 count:16];
  if (v29)
  {
    uint64_t v30 = *(void *)v107;
    do
    {
      uint64_t v31 = 0;
      do
      {
        if (*(void *)v107 != v30) {
          objc_enumerationMutation(v28);
        }
        unint64_t v32 = (void *)[*(id *)(*((void *)&v106 + 1) + 8 * v31) copyWithZone:a3];
        [v5 addStop:v32];

        ++v31;
      }
      while (v29 != v31);
      uint64_t v29 = [(NSMutableArray *)v28 countByEnumeratingWithState:&v106 objects:v134 count:16];
    }
    while (v29);
  }

  long long v104 = 0u;
  long long v105 = 0u;
  long long v102 = 0u;
  long long v103 = 0u;
  unint64_t v33 = self->_zilchPoints;
  uint64_t v34 = [(NSMutableArray *)v33 countByEnumeratingWithState:&v102 objects:v133 count:16];
  if (v34)
  {
    uint64_t v35 = *(void *)v103;
    do
    {
      uint64_t v36 = 0;
      do
      {
        if (*(void *)v103 != v35) {
          objc_enumerationMutation(v33);
        }
        unint64_t v37 = (void *)[*(id *)(*((void *)&v102 + 1) + 8 * v36) copyWithZone:a3];
        [v5 addZilchPoints:v37];

        ++v36;
      }
      while (v34 != v36);
      uint64_t v34 = [(NSMutableArray *)v33 countByEnumeratingWithState:&v102 objects:v133 count:16];
    }
    while (v34);
  }

  long long v100 = 0u;
  long long v101 = 0u;
  long long v98 = 0u;
  long long v99 = 0u;
  long long v38 = self->_systems;
  uint64_t v39 = [(NSMutableArray *)v38 countByEnumeratingWithState:&v98 objects:v132 count:16];
  if (v39)
  {
    uint64_t v40 = *(void *)v99;
    do
    {
      uint64_t v41 = 0;
      do
      {
        if (*(void *)v99 != v40) {
          objc_enumerationMutation(v38);
        }
        long long v42 = (void *)[*(id *)(*((void *)&v98 + 1) + 8 * v41) copyWithZone:a3];
        [v5 addSystem:v42];

        ++v41;
      }
      while (v39 != v41);
      uint64_t v39 = [(NSMutableArray *)v38 countByEnumeratingWithState:&v98 objects:v132 count:16];
    }
    while (v39);
  }

  long long v96 = 0u;
  long long v97 = 0u;
  long long v94 = 0u;
  long long v95 = 0u;
  long long v43 = self->_transitIncidents;
  uint64_t v44 = [(NSMutableArray *)v43 countByEnumeratingWithState:&v94 objects:v131 count:16];
  if (v44)
  {
    uint64_t v45 = *(void *)v95;
    do
    {
      uint64_t v46 = 0;
      do
      {
        if (*(void *)v95 != v45) {
          objc_enumerationMutation(v43);
        }
        long long v47 = (void *)[*(id *)(*((void *)&v94 + 1) + 8 * v46) copyWithZone:a3];
        [v5 addTransitIncident:v47];

        ++v46;
      }
      while (v44 != v46);
      uint64_t v44 = [(NSMutableArray *)v43 countByEnumeratingWithState:&v94 objects:v131 count:16];
    }
    while (v44);
  }

  long long v92 = 0u;
  long long v93 = 0u;
  long long v90 = 0u;
  long long v91 = 0u;
  unint64_t v48 = self->_halls;
  uint64_t v49 = [(NSMutableArray *)v48 countByEnumeratingWithState:&v90 objects:v130 count:16];
  if (v49)
  {
    uint64_t v50 = *(void *)v91;
    do
    {
      uint64_t v51 = 0;
      do
      {
        if (*(void *)v91 != v50) {
          objc_enumerationMutation(v48);
        }
        unint64_t v52 = (void *)[*(id *)(*((void *)&v90 + 1) + 8 * v51) copyWithZone:a3];
        [v5 addHall:v52];

        ++v51;
      }
      while (v49 != v51);
      uint64_t v49 = [(NSMutableArray *)v48 countByEnumeratingWithState:&v90 objects:v130 count:16];
    }
    while (v49);
  }

  long long v88 = 0u;
  long long v89 = 0u;
  long long v86 = 0u;
  long long v87 = 0u;
  unint64_t v53 = self->_artworks;
  uint64_t v54 = [(NSMutableArray *)v53 countByEnumeratingWithState:&v86 objects:v129 count:16];
  if (v54)
  {
    uint64_t v55 = *(void *)v87;
    do
    {
      uint64_t v56 = 0;
      do
      {
        if (*(void *)v87 != v55) {
          objc_enumerationMutation(v53);
        }
        uint64_t v57 = (void *)[*(id *)(*((void *)&v86 + 1) + 8 * v56) copyWithZone:a3];
        [v5 addArtwork:v57];

        ++v56;
      }
      while (v54 != v56);
      uint64_t v54 = [(NSMutableArray *)v53 countByEnumeratingWithState:&v86 objects:v129 count:16];
    }
    while (v54);
  }

  long long v84 = 0u;
  long long v85 = 0u;
  long long v82 = 0u;
  long long v83 = 0u;
  uint64_t v58 = self->_transitIncidentMessages;
  uint64_t v59 = [(NSMutableArray *)v58 countByEnumeratingWithState:&v82 objects:v128 count:16];
  if (v59)
  {
    uint64_t v60 = *(void *)v83;
    do
    {
      uint64_t v61 = 0;
      do
      {
        if (*(void *)v83 != v60) {
          objc_enumerationMutation(v58);
        }
        uint64_t v62 = (void *)[*(id *)(*((void *)&v82 + 1) + 8 * v61) copyWithZone:a3];
        [v5 addTransitIncidentMessage:v62];

        ++v61;
      }
      while (v59 != v61);
      uint64_t v59 = [(NSMutableArray *)v58 countByEnumeratingWithState:&v82 objects:v128 count:16];
    }
    while (v59);
  }

  long long v80 = 0u;
  long long v81 = 0u;
  long long v78 = 0u;
  long long v79 = 0u;
  long long v63 = self->_steps;
  uint64_t v64 = [(NSMutableArray *)v63 countByEnumeratingWithState:&v78 objects:v127 count:16];
  if (v64)
  {
    uint64_t v65 = *(void *)v79;
    do
    {
      uint64_t v66 = 0;
      do
      {
        if (*(void *)v79 != v65) {
          objc_enumerationMutation(v63);
        }
        long long v67 = (void *)[*(id *)(*((void *)&v78 + 1) + 8 * v66) copyWithZone:a3];
        [v5 addStep:v67];

        ++v66;
      }
      while (v64 != v66);
      uint64_t v64 = [(NSMutableArray *)v63 countByEnumeratingWithState:&v78 objects:v127 count:16];
    }
    while (v64);
  }

  long long v76 = 0u;
  long long v77 = 0u;
  long long v74 = 0u;
  long long v75 = 0u;
  long long v68 = self->_paymentMethods;
  uint64_t v69 = [(NSMutableArray *)v68 countByEnumeratingWithState:&v74 objects:v126 count:16];
  if (v69)
  {
    uint64_t v70 = *(void *)v75;
    do
    {
      uint64_t v71 = 0;
      do
      {
        if (*(void *)v75 != v70) {
          objc_enumerationMutation(v68);
        }
        long long v72 = objc_msgSend(*(id *)(*((void *)&v74 + 1) + 8 * v71), "copyWithZone:", a3, (void)v74);
        [v5 addPaymentMethod:v72];

        ++v71;
      }
      while (v69 != v71);
      uint64_t v69 = [(NSMutableArray *)v68 countByEnumeratingWithState:&v74 objects:v126 count:16];
    }
    while (v69);
  }

  objc_storeStrong(v5 + 2, self->_unknownFields);
  return v5;
}

- (BOOL)isEqual:(id)a3
{
  unint64_t v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_28;
  }
  [(GEOTransitDecoderData *)self readAll:1];
  [v4 readAll:1];
  stations = self->_stations;
  if ((unint64_t)stations | v4[8])
  {
    if (!-[NSMutableArray isEqual:](stations, "isEqual:")) {
      goto LABEL_28;
    }
  }
  lines = self->_lines;
  if ((unint64_t)lines | v4[6] && !-[NSMutableArray isEqual:](lines, "isEqual:")) {
    goto LABEL_28;
  }
  accessPoints = self->_accessPoints;
  if ((unint64_t)accessPoints | v4[3] && !-[NSMutableArray isEqual:](accessPoints, "isEqual:")) {
    goto LABEL_28;
  }
  walkings = self->_walkings;
  if ((unint64_t)walkings | v4[14] && !-[NSMutableArray isEqual:](walkings, "isEqual:")) {
    goto LABEL_28;
  }
  stops = self->_stops;
  if ((unint64_t)stops | v4[10] && !-[NSMutableArray isEqual:](stops, "isEqual:")) {
    goto LABEL_28;
  }
  if (((zilchPoints = self->_zilchPoints, !((unint64_t)zilchPoints | v4[15]))
     || -[NSMutableArray isEqual:](zilchPoints, "isEqual:"))
    && ((systems = self->_systems, !((unint64_t)systems | v4[11]))
     || -[NSMutableArray isEqual:](systems, "isEqual:"))
    && ((transitIncidents = self->_transitIncidents, !((unint64_t)transitIncidents | v4[13]))
     || -[NSMutableArray isEqual:](transitIncidents, "isEqual:"))
    && ((halls = self->_halls, !((unint64_t)halls | v4[5]))
     || -[NSMutableArray isEqual:](halls, "isEqual:"))
    && ((artworks = self->_artworks, !((unint64_t)artworks | v4[4]))
     || -[NSMutableArray isEqual:](artworks, "isEqual:"))
    && ((transitIncidentMessages = self->_transitIncidentMessages, !((unint64_t)transitIncidentMessages | v4[12]))
     || -[NSMutableArray isEqual:](transitIncidentMessages, "isEqual:"))
    && ((steps = self->_steps, !((unint64_t)steps | v4[9]))
     || -[NSMutableArray isEqual:](steps, "isEqual:")))
  {
    paymentMethods = self->_paymentMethods;
    if ((unint64_t)paymentMethods | v4[7]) {
      char v18 = -[NSMutableArray isEqual:](paymentMethods, "isEqual:");
    }
    else {
      char v18 = 1;
    }
  }
  else
  {
LABEL_28:
    char v18 = 0;
  }

  return v18;
}

- (unint64_t)hash
{
  [(GEOTransitDecoderData *)self readAll:1];
  uint64_t v3 = [(NSMutableArray *)self->_stations hash];
  uint64_t v4 = [(NSMutableArray *)self->_lines hash] ^ v3;
  uint64_t v5 = [(NSMutableArray *)self->_accessPoints hash];
  uint64_t v6 = v4 ^ v5 ^ [(NSMutableArray *)self->_walkings hash];
  uint64_t v7 = [(NSMutableArray *)self->_stops hash];
  uint64_t v8 = v7 ^ [(NSMutableArray *)self->_zilchPoints hash];
  uint64_t v9 = v6 ^ v8 ^ [(NSMutableArray *)self->_systems hash];
  uint64_t v10 = [(NSMutableArray *)self->_transitIncidents hash];
  uint64_t v11 = v10 ^ [(NSMutableArray *)self->_halls hash];
  uint64_t v12 = v11 ^ [(NSMutableArray *)self->_artworks hash];
  uint64_t v13 = v9 ^ v12 ^ [(NSMutableArray *)self->_transitIncidentMessages hash];
  uint64_t v14 = [(NSMutableArray *)self->_steps hash];
  return v13 ^ v14 ^ [(NSMutableArray *)self->_paymentMethods hash];
}

- (void)mergeFrom:(id)a3
{
  uint64_t v135 = *MEMORY[0x1E4F143B8];
  uint64_t v4 = (id *)a3;
  [v4 readAll:0];
  long long v120 = 0u;
  long long v121 = 0u;
  long long v118 = 0u;
  long long v119 = 0u;
  id v5 = v4[8];
  uint64_t v6 = [v5 countByEnumeratingWithState:&v118 objects:v134 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v119;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v119 != v8) {
          objc_enumerationMutation(v5);
        }
        [(GEOTransitDecoderData *)self addStation:*(void *)(*((void *)&v118 + 1) + 8 * v9++)];
      }
      while (v7 != v9);
      uint64_t v7 = [v5 countByEnumeratingWithState:&v118 objects:v134 count:16];
    }
    while (v7);
  }

  long long v116 = 0u;
  long long v117 = 0u;
  long long v114 = 0u;
  long long v115 = 0u;
  id v10 = v4[6];
  uint64_t v11 = [v10 countByEnumeratingWithState:&v114 objects:v133 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v13 = *(void *)v115;
    do
    {
      uint64_t v14 = 0;
      do
      {
        if (*(void *)v115 != v13) {
          objc_enumerationMutation(v10);
        }
        [(GEOTransitDecoderData *)self addLine:*(void *)(*((void *)&v114 + 1) + 8 * v14++)];
      }
      while (v12 != v14);
      uint64_t v12 = [v10 countByEnumeratingWithState:&v114 objects:v133 count:16];
    }
    while (v12);
  }

  long long v112 = 0u;
  long long v113 = 0u;
  long long v110 = 0u;
  long long v111 = 0u;
  id v15 = v4[3];
  uint64_t v16 = [v15 countByEnumeratingWithState:&v110 objects:v132 count:16];
  if (v16)
  {
    uint64_t v17 = v16;
    uint64_t v18 = *(void *)v111;
    do
    {
      uint64_t v19 = 0;
      do
      {
        if (*(void *)v111 != v18) {
          objc_enumerationMutation(v15);
        }
        [(GEOTransitDecoderData *)self addAccessPoint:*(void *)(*((void *)&v110 + 1) + 8 * v19++)];
      }
      while (v17 != v19);
      uint64_t v17 = [v15 countByEnumeratingWithState:&v110 objects:v132 count:16];
    }
    while (v17);
  }

  long long v108 = 0u;
  long long v109 = 0u;
  long long v106 = 0u;
  long long v107 = 0u;
  id v20 = v4[14];
  uint64_t v21 = [v20 countByEnumeratingWithState:&v106 objects:v131 count:16];
  if (v21)
  {
    uint64_t v22 = v21;
    uint64_t v23 = *(void *)v107;
    do
    {
      uint64_t v24 = 0;
      do
      {
        if (*(void *)v107 != v23) {
          objc_enumerationMutation(v20);
        }
        [(GEOTransitDecoderData *)self addWalking:*(void *)(*((void *)&v106 + 1) + 8 * v24++)];
      }
      while (v22 != v24);
      uint64_t v22 = [v20 countByEnumeratingWithState:&v106 objects:v131 count:16];
    }
    while (v22);
  }

  long long v104 = 0u;
  long long v105 = 0u;
  long long v102 = 0u;
  long long v103 = 0u;
  id v25 = v4[10];
  uint64_t v26 = [v25 countByEnumeratingWithState:&v102 objects:v130 count:16];
  if (v26)
  {
    uint64_t v27 = v26;
    uint64_t v28 = *(void *)v103;
    do
    {
      uint64_t v29 = 0;
      do
      {
        if (*(void *)v103 != v28) {
          objc_enumerationMutation(v25);
        }
        [(GEOTransitDecoderData *)self addStop:*(void *)(*((void *)&v102 + 1) + 8 * v29++)];
      }
      while (v27 != v29);
      uint64_t v27 = [v25 countByEnumeratingWithState:&v102 objects:v130 count:16];
    }
    while (v27);
  }

  long long v100 = 0u;
  long long v101 = 0u;
  long long v98 = 0u;
  long long v99 = 0u;
  id v30 = v4[15];
  uint64_t v31 = [v30 countByEnumeratingWithState:&v98 objects:v129 count:16];
  if (v31)
  {
    uint64_t v32 = v31;
    uint64_t v33 = *(void *)v99;
    do
    {
      uint64_t v34 = 0;
      do
      {
        if (*(void *)v99 != v33) {
          objc_enumerationMutation(v30);
        }
        [(GEOTransitDecoderData *)self addZilchPoints:*(void *)(*((void *)&v98 + 1) + 8 * v34++)];
      }
      while (v32 != v34);
      uint64_t v32 = [v30 countByEnumeratingWithState:&v98 objects:v129 count:16];
    }
    while (v32);
  }

  long long v96 = 0u;
  long long v97 = 0u;
  long long v94 = 0u;
  long long v95 = 0u;
  id v35 = v4[11];
  uint64_t v36 = [v35 countByEnumeratingWithState:&v94 objects:v128 count:16];
  if (v36)
  {
    uint64_t v37 = v36;
    uint64_t v38 = *(void *)v95;
    do
    {
      uint64_t v39 = 0;
      do
      {
        if (*(void *)v95 != v38) {
          objc_enumerationMutation(v35);
        }
        [(GEOTransitDecoderData *)self addSystem:*(void *)(*((void *)&v94 + 1) + 8 * v39++)];
      }
      while (v37 != v39);
      uint64_t v37 = [v35 countByEnumeratingWithState:&v94 objects:v128 count:16];
    }
    while (v37);
  }

  long long v92 = 0u;
  long long v93 = 0u;
  long long v90 = 0u;
  long long v91 = 0u;
  id v40 = v4[13];
  uint64_t v41 = [v40 countByEnumeratingWithState:&v90 objects:v127 count:16];
  if (v41)
  {
    uint64_t v42 = v41;
    uint64_t v43 = *(void *)v91;
    do
    {
      uint64_t v44 = 0;
      do
      {
        if (*(void *)v91 != v43) {
          objc_enumerationMutation(v40);
        }
        [(GEOTransitDecoderData *)self addTransitIncident:*(void *)(*((void *)&v90 + 1) + 8 * v44++)];
      }
      while (v42 != v44);
      uint64_t v42 = [v40 countByEnumeratingWithState:&v90 objects:v127 count:16];
    }
    while (v42);
  }

  long long v88 = 0u;
  long long v89 = 0u;
  long long v86 = 0u;
  long long v87 = 0u;
  id v45 = v4[5];
  uint64_t v46 = [v45 countByEnumeratingWithState:&v86 objects:v126 count:16];
  if (v46)
  {
    uint64_t v47 = v46;
    uint64_t v48 = *(void *)v87;
    do
    {
      uint64_t v49 = 0;
      do
      {
        if (*(void *)v87 != v48) {
          objc_enumerationMutation(v45);
        }
        [(GEOTransitDecoderData *)self addHall:*(void *)(*((void *)&v86 + 1) + 8 * v49++)];
      }
      while (v47 != v49);
      uint64_t v47 = [v45 countByEnumeratingWithState:&v86 objects:v126 count:16];
    }
    while (v47);
  }

  long long v84 = 0u;
  long long v85 = 0u;
  long long v82 = 0u;
  long long v83 = 0u;
  id v50 = v4[4];
  uint64_t v51 = [v50 countByEnumeratingWithState:&v82 objects:v125 count:16];
  if (v51)
  {
    uint64_t v52 = v51;
    uint64_t v53 = *(void *)v83;
    do
    {
      uint64_t v54 = 0;
      do
      {
        if (*(void *)v83 != v53) {
          objc_enumerationMutation(v50);
        }
        [(GEOTransitDecoderData *)self addArtwork:*(void *)(*((void *)&v82 + 1) + 8 * v54++)];
      }
      while (v52 != v54);
      uint64_t v52 = [v50 countByEnumeratingWithState:&v82 objects:v125 count:16];
    }
    while (v52);
  }

  long long v80 = 0u;
  long long v81 = 0u;
  long long v78 = 0u;
  long long v79 = 0u;
  id v55 = v4[12];
  uint64_t v56 = [v55 countByEnumeratingWithState:&v78 objects:v124 count:16];
  if (v56)
  {
    uint64_t v57 = v56;
    uint64_t v58 = *(void *)v79;
    do
    {
      uint64_t v59 = 0;
      do
      {
        if (*(void *)v79 != v58) {
          objc_enumerationMutation(v55);
        }
        [(GEOTransitDecoderData *)self addTransitIncidentMessage:*(void *)(*((void *)&v78 + 1) + 8 * v59++)];
      }
      while (v57 != v59);
      uint64_t v57 = [v55 countByEnumeratingWithState:&v78 objects:v124 count:16];
    }
    while (v57);
  }

  long long v76 = 0u;
  long long v77 = 0u;
  long long v74 = 0u;
  long long v75 = 0u;
  id v60 = v4[9];
  uint64_t v61 = [v60 countByEnumeratingWithState:&v74 objects:v123 count:16];
  if (v61)
  {
    uint64_t v62 = v61;
    uint64_t v63 = *(void *)v75;
    do
    {
      uint64_t v64 = 0;
      do
      {
        if (*(void *)v75 != v63) {
          objc_enumerationMutation(v60);
        }
        [(GEOTransitDecoderData *)self addStep:*(void *)(*((void *)&v74 + 1) + 8 * v64++)];
      }
      while (v62 != v64);
      uint64_t v62 = [v60 countByEnumeratingWithState:&v74 objects:v123 count:16];
    }
    while (v62);
  }

  long long v72 = 0u;
  long long v73 = 0u;
  long long v70 = 0u;
  long long v71 = 0u;
  id v65 = v4[7];
  uint64_t v66 = [v65 countByEnumeratingWithState:&v70 objects:v122 count:16];
  if (v66)
  {
    uint64_t v67 = v66;
    uint64_t v68 = *(void *)v71;
    do
    {
      uint64_t v69 = 0;
      do
      {
        if (*(void *)v71 != v68) {
          objc_enumerationMutation(v65);
        }
        -[GEOTransitDecoderData addPaymentMethod:](self, "addPaymentMethod:", *(void *)(*((void *)&v70 + 1) + 8 * v69++), (void)v70);
      }
      while (v67 != v69);
      uint64_t v67 = [v65 countByEnumeratingWithState:&v70 objects:v122 count:16];
    }
    while (v67);
  }
}

- (PBUnknownFields)unknownFields
{
  p_readerLocuint64_t k = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  if ((*(_WORD *)&self->_flags & 1) == 0)
  {
    reader = self->_reader;
    if (reader)
    {
      id v5 = reader;
      objc_sync_enter(v5);
      GEOTransitDecoderDataReadSpecified((uint64_t)self, (unint64_t)self->_reader, (int *)&unknownFields_tags_576);
      objc_sync_exit(v5);
    }
  }
  os_unfair_lock_unlock(p_readerLock);
  unknownFields = self->_unknownFields;

  return unknownFields;
}

- (void)clearUnknownFields:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v127 = *MEMORY[0x1E4F143B8];
  p_readerLocuint64_t k = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(_WORD *)&self->_flags |= 0x4001u;
  os_unfair_lock_unlock(p_readerLock);
  unknownFields = self->_unknownFields;
  self->_unknownFields = 0;

  if (v3)
  {
    [(GEOTransitDecoderData *)self readAll:0];
    long long v113 = 0u;
    long long v114 = 0u;
    long long v111 = 0u;
    long long v112 = 0u;
    uint64_t v7 = self->_stations;
    uint64_t v8 = [(NSMutableArray *)v7 countByEnumeratingWithState:&v111 objects:v126 count:16];
    if (v8)
    {
      uint64_t v9 = v8;
      uint64_t v10 = *(void *)v112;
      do
      {
        uint64_t v11 = 0;
        do
        {
          if (*(void *)v112 != v10) {
            objc_enumerationMutation(v7);
          }
          [*(id *)(*((void *)&v111 + 1) + 8 * v11++) clearUnknownFields:1];
        }
        while (v9 != v11);
        uint64_t v9 = [(NSMutableArray *)v7 countByEnumeratingWithState:&v111 objects:v126 count:16];
      }
      while (v9);
    }

    long long v109 = 0u;
    long long v110 = 0u;
    long long v107 = 0u;
    long long v108 = 0u;
    uint64_t v12 = self->_lines;
    uint64_t v13 = [(NSMutableArray *)v12 countByEnumeratingWithState:&v107 objects:v125 count:16];
    if (v13)
    {
      uint64_t v14 = v13;
      uint64_t v15 = *(void *)v108;
      do
      {
        uint64_t v16 = 0;
        do
        {
          if (*(void *)v108 != v15) {
            objc_enumerationMutation(v12);
          }
          [*(id *)(*((void *)&v107 + 1) + 8 * v16++) clearUnknownFields:1];
        }
        while (v14 != v16);
        uint64_t v14 = [(NSMutableArray *)v12 countByEnumeratingWithState:&v107 objects:v125 count:16];
      }
      while (v14);
    }

    long long v105 = 0u;
    long long v106 = 0u;
    long long v103 = 0u;
    long long v104 = 0u;
    uint64_t v17 = self->_accessPoints;
    uint64_t v18 = [(NSMutableArray *)v17 countByEnumeratingWithState:&v103 objects:v124 count:16];
    if (v18)
    {
      uint64_t v19 = v18;
      uint64_t v20 = *(void *)v104;
      do
      {
        uint64_t v21 = 0;
        do
        {
          if (*(void *)v104 != v20) {
            objc_enumerationMutation(v17);
          }
          [*(id *)(*((void *)&v103 + 1) + 8 * v21++) clearUnknownFields:1];
        }
        while (v19 != v21);
        uint64_t v19 = [(NSMutableArray *)v17 countByEnumeratingWithState:&v103 objects:v124 count:16];
      }
      while (v19);
    }

    long long v101 = 0u;
    long long v102 = 0u;
    long long v99 = 0u;
    long long v100 = 0u;
    uint64_t v22 = self->_walkings;
    uint64_t v23 = [(NSMutableArray *)v22 countByEnumeratingWithState:&v99 objects:v123 count:16];
    if (v23)
    {
      uint64_t v24 = v23;
      uint64_t v25 = *(void *)v100;
      do
      {
        uint64_t v26 = 0;
        do
        {
          if (*(void *)v100 != v25) {
            objc_enumerationMutation(v22);
          }
          [*(id *)(*((void *)&v99 + 1) + 8 * v26++) clearUnknownFields:1];
        }
        while (v24 != v26);
        uint64_t v24 = [(NSMutableArray *)v22 countByEnumeratingWithState:&v99 objects:v123 count:16];
      }
      while (v24);
    }

    long long v97 = 0u;
    long long v98 = 0u;
    long long v95 = 0u;
    long long v96 = 0u;
    uint64_t v27 = self->_stops;
    uint64_t v28 = [(NSMutableArray *)v27 countByEnumeratingWithState:&v95 objects:v122 count:16];
    if (v28)
    {
      uint64_t v29 = v28;
      uint64_t v30 = *(void *)v96;
      do
      {
        uint64_t v31 = 0;
        do
        {
          if (*(void *)v96 != v30) {
            objc_enumerationMutation(v27);
          }
          [*(id *)(*((void *)&v95 + 1) + 8 * v31++) clearUnknownFields:1];
        }
        while (v29 != v31);
        uint64_t v29 = [(NSMutableArray *)v27 countByEnumeratingWithState:&v95 objects:v122 count:16];
      }
      while (v29);
    }

    long long v93 = 0u;
    long long v94 = 0u;
    long long v91 = 0u;
    long long v92 = 0u;
    uint64_t v32 = self->_systems;
    uint64_t v33 = [(NSMutableArray *)v32 countByEnumeratingWithState:&v91 objects:v121 count:16];
    if (v33)
    {
      uint64_t v34 = v33;
      uint64_t v35 = *(void *)v92;
      do
      {
        uint64_t v36 = 0;
        do
        {
          if (*(void *)v92 != v35) {
            objc_enumerationMutation(v32);
          }
          [*(id *)(*((void *)&v91 + 1) + 8 * v36++) clearUnknownFields:1];
        }
        while (v34 != v36);
        uint64_t v34 = [(NSMutableArray *)v32 countByEnumeratingWithState:&v91 objects:v121 count:16];
      }
      while (v34);
    }

    long long v89 = 0u;
    long long v90 = 0u;
    long long v87 = 0u;
    long long v88 = 0u;
    uint64_t v37 = self->_transitIncidents;
    uint64_t v38 = [(NSMutableArray *)v37 countByEnumeratingWithState:&v87 objects:v120 count:16];
    if (v38)
    {
      uint64_t v39 = v38;
      uint64_t v40 = *(void *)v88;
      do
      {
        uint64_t v41 = 0;
        do
        {
          if (*(void *)v88 != v40) {
            objc_enumerationMutation(v37);
          }
          -[GEOPBTransitIncident clearUnknownFields:](*(void *)(*((void *)&v87 + 1) + 8 * v41++), 1);
        }
        while (v39 != v41);
        uint64_t v39 = [(NSMutableArray *)v37 countByEnumeratingWithState:&v87 objects:v120 count:16];
      }
      while (v39);
    }

    long long v85 = 0u;
    long long v86 = 0u;
    long long v83 = 0u;
    long long v84 = 0u;
    uint64_t v42 = self->_halls;
    uint64_t v43 = [(NSMutableArray *)v42 countByEnumeratingWithState:&v83 objects:v119 count:16];
    if (v43)
    {
      uint64_t v44 = v43;
      uint64_t v45 = *(void *)v84;
      do
      {
        uint64_t v46 = 0;
        do
        {
          if (*(void *)v84 != v45) {
            objc_enumerationMutation(v42);
          }
          [*(id *)(*((void *)&v83 + 1) + 8 * v46++) clearUnknownFields:1];
        }
        while (v44 != v46);
        uint64_t v44 = [(NSMutableArray *)v42 countByEnumeratingWithState:&v83 objects:v119 count:16];
      }
      while (v44);
    }

    long long v81 = 0u;
    long long v82 = 0u;
    long long v79 = 0u;
    long long v80 = 0u;
    uint64_t v47 = self->_artworks;
    uint64_t v48 = [(NSMutableArray *)v47 countByEnumeratingWithState:&v79 objects:v118 count:16];
    if (v48)
    {
      uint64_t v49 = v48;
      uint64_t v50 = *(void *)v80;
      do
      {
        uint64_t v51 = 0;
        do
        {
          if (*(void *)v80 != v50) {
            objc_enumerationMutation(v47);
          }
          [*(id *)(*((void *)&v79 + 1) + 8 * v51++) clearUnknownFields:1];
        }
        while (v49 != v51);
        uint64_t v49 = [(NSMutableArray *)v47 countByEnumeratingWithState:&v79 objects:v118 count:16];
      }
      while (v49);
    }

    long long v77 = 0u;
    long long v78 = 0u;
    long long v75 = 0u;
    long long v76 = 0u;
    uint64_t v52 = self->_transitIncidentMessages;
    uint64_t v53 = [(NSMutableArray *)v52 countByEnumeratingWithState:&v75 objects:v117 count:16];
    if (v53)
    {
      uint64_t v54 = v53;
      uint64_t v55 = *(void *)v76;
      do
      {
        uint64_t v56 = 0;
        do
        {
          if (*(void *)v76 != v55) {
            objc_enumerationMutation(v52);
          }
          -[GEOPBTransitRoutingIncidentMessage clearUnknownFields:](*(void *)(*((void *)&v75 + 1) + 8 * v56++), 1);
        }
        while (v54 != v56);
        uint64_t v54 = [(NSMutableArray *)v52 countByEnumeratingWithState:&v75 objects:v117 count:16];
      }
      while (v54);
    }

    long long v73 = 0u;
    long long v74 = 0u;
    long long v71 = 0u;
    long long v72 = 0u;
    uint64_t v57 = self->_steps;
    uint64_t v58 = [(NSMutableArray *)v57 countByEnumeratingWithState:&v71 objects:v116 count:16];
    if (v58)
    {
      uint64_t v59 = v58;
      uint64_t v60 = *(void *)v72;
      do
      {
        uint64_t v61 = 0;
        do
        {
          if (*(void *)v72 != v60) {
            objc_enumerationMutation(v57);
          }
          [*(id *)(*((void *)&v71 + 1) + 8 * v61++) clearUnknownFields:1];
        }
        while (v59 != v61);
        uint64_t v59 = [(NSMutableArray *)v57 countByEnumeratingWithState:&v71 objects:v116 count:16];
      }
      while (v59);
    }

    long long v69 = 0u;
    long long v70 = 0u;
    long long v67 = 0u;
    long long v68 = 0u;
    uint64_t v62 = self->_paymentMethods;
    uint64_t v63 = [(NSMutableArray *)v62 countByEnumeratingWithState:&v67 objects:v115 count:16];
    if (v63)
    {
      uint64_t v64 = v63;
      uint64_t v65 = *(void *)v68;
      do
      {
        uint64_t v66 = 0;
        do
        {
          if (*(void *)v68 != v65) {
            objc_enumerationMutation(v62);
          }
          objc_msgSend(*(id *)(*((void *)&v67 + 1) + 8 * v66++), "clearUnknownFields:", 1, (void)v67);
        }
        while (v64 != v66);
        uint64_t v64 = [(NSMutableArray *)v62 countByEnumeratingWithState:&v67 objects:v115 count:16];
      }
      while (v64);
    }
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_zilchPoints, 0);
  objc_storeStrong((id *)&self->_walkings, 0);
  objc_storeStrong((id *)&self->_transitIncidents, 0);
  objc_storeStrong((id *)&self->_transitIncidentMessages, 0);
  objc_storeStrong((id *)&self->_systems, 0);
  objc_storeStrong((id *)&self->_stops, 0);
  objc_storeStrong((id *)&self->_steps, 0);
  objc_storeStrong((id *)&self->_stations, 0);
  objc_storeStrong((id *)&self->_paymentMethods, 0);
  objc_storeStrong((id *)&self->_lines, 0);
  objc_storeStrong((id *)&self->_halls, 0);
  objc_storeStrong((id *)&self->_artworks, 0);
  objc_storeStrong((id *)&self->_accessPoints, 0);
  objc_storeStrong((id *)&self->_unknownFields, 0);

  objc_storeStrong((id *)&self->_reader, 0);
}

- (id)artworkFromIndices:(unsigned int *)a3 count:(unint64_t)a4
{
  unint64_t v4 = a4;
  for (uint64_t i = [MEMORY[0x1E4F1CA48] arrayWithCapacity:a4];
  {
    unsigned int v9 = *a3++;
    uint64_t v8 = v9;
    if ([(GEOTransitDecoderData *)self artworksCount] > v9)
    {
      uint64_t v10 = [(GEOTransitDecoderData *)self artworkAtIndex:v8];
      [i addObject:v10];
    }
  }

  return i;
}

@end