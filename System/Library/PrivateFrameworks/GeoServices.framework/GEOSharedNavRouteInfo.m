@interface GEOSharedNavRouteInfo
+ (BOOL)isValid:(id)a3;
+ (Class)chargingStationsType;
+ (Class)routingPathLegType;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (GEOSharedNavRouteInfo)init;
- (GEOSharedNavRouteInfo)initWithData:(id)a3;
- (GEOSharedNavRouteInfo)initWithDictionary:(id)a3;
- (GEOSharedNavRouteInfo)initWithJSON:(id)a3;
- (NSMutableArray)chargingStations;
- (NSMutableArray)routingPathLegs;
- (PBUnknownFields)unknownFields;
- (double)coordinates;
- (double)coordinatesAtIndex:(unint64_t)a3;
- (id)_dictionaryRepresentation:(uint64_t)a1;
- (id)chargingStationsAtIndex:(unint64_t)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)jsonRepresentation;
- (id)routingPathLegAtIndex:(unint64_t)a3;
- (unint64_t)chargingStationsCount;
- (unint64_t)coordinatesCount;
- (unint64_t)hash;
- (unint64_t)routingPathLegsCount;
- (unint64_t)trafficColorOffsetsCount;
- (unint64_t)trafficColorsCount;
- (unsigned)trafficColorAtIndex:(unint64_t)a3;
- (unsigned)trafficColorOffsetAtIndex:(unint64_t)a3;
- (unsigned)trafficColorOffsets;
- (unsigned)trafficColors;
- (void)_addNoFlagsChargingStations:(uint64_t)a1;
- (void)_addNoFlagsRoutingPathLeg:(uint64_t)a1;
- (void)_initWithDictionary:(int)a3 isJSON:;
- (void)_readChargingStations;
- (void)_readCoordinates;
- (void)_readRoutingPathLegs;
- (void)_readTrafficColorOffsets;
- (void)_readTrafficColors;
- (void)addChargingStations:(id)a3;
- (void)addCoordinates:(double)a3;
- (void)addRoutingPathLeg:(id)a3;
- (void)addTrafficColor:(unsigned int)a3;
- (void)addTrafficColorOffset:(unsigned int)a3;
- (void)clearChargingStations;
- (void)clearCoordinates;
- (void)clearRoutingPathLegs;
- (void)clearTrafficColorOffsets;
- (void)clearTrafficColors;
- (void)clearUnknownFields:(BOOL)a3;
- (void)copyTo:(id)a3;
- (void)dealloc;
- (void)mergeFrom:(id)a3;
- (void)readAll:(BOOL)a3;
- (void)setChargingStations:(id)a3;
- (void)setCoordinates:(double *)a3 count:(unint64_t)a4;
- (void)setRoutingPathLegs:(id)a3;
- (void)setTrafficColorOffsets:(unsigned int *)a3 count:(unint64_t)a4;
- (void)setTrafficColors:(unsigned int *)a3 count:(unint64_t)a4;
- (void)writeTo:(id)a3;
@end

@implementation GEOSharedNavRouteInfo

- (GEOSharedNavRouteInfo)init
{
  v6.receiver = self;
  v6.super_class = (Class)GEOSharedNavRouteInfo;
  v2 = [(GEOSharedNavRouteInfo *)&v6 init];
  v3 = v2;
  if (v2)
  {
    v2->_readerLock._os_unfair_lock_opaque = 0;
    v4 = v2;
  }

  return v3;
}

- (GEOSharedNavRouteInfo)initWithData:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)GEOSharedNavRouteInfo;
  v3 = [(GEOSharedNavRouteInfo *)&v7 initWithData:a3];
  v4 = v3;
  if (v3)
  {
    v3->_readerLock._os_unfair_lock_opaque = 0;
    v5 = v3;
  }

  return v4;
}

- (void)dealloc
{
  PBRepeatedDoubleClear();
  PBRepeatedUInt32Clear();
  PBRepeatedUInt32Clear();
  v3.receiver = self;
  v3.super_class = (Class)GEOSharedNavRouteInfo;
  [(GEOSharedNavRouteInfo *)&v3 dealloc];
}

- (void)_readCoordinates
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 120));
    if ((*(unsigned char *)(a1 + 124) & 2) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOSharedNavRouteInfoReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readCoordinates_tags_1);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 120));
  }
}

- (unint64_t)coordinatesCount
{
  return self->_coordinates.count;
}

- (double)coordinates
{
  return self->_coordinates.list;
}

- (void)clearCoordinates
{
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(unsigned char *)&self->_flags |= 2u;
  os_unfair_lock_unlock(p_readerLock);
  *(unsigned char *)&self->_flags |= 0x40u;

  PBRepeatedDoubleClear();
}

- (void)addCoordinates:(double)a3
{
  if (self) {
    PBRepeatedDoubleAdd();
  }
  os_unfair_lock_lock_with_options();
  *(unsigned char *)&self->_flags |= 2u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(unsigned char *)&self->_flags |= 0x40u;
}

- (double)coordinatesAtIndex:(unint64_t)a3
{
  -[GEOSharedNavRouteInfo _readCoordinates]((uint64_t)self);
  p_coordinates = &self->_coordinates;
  unint64_t count = self->_coordinates.count;
  if (count <= a3)
  {
    objc_super v7 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v8 = *MEMORY[0x1E4F1C4A8];
    v9 = objc_msgSend(NSString, "stringWithFormat:", @"idx (%tu) is out of range (%tu)", a3, count);
    v10 = [v7 exceptionWithName:v8 reason:v9 userInfo:0];
    [v10 raise];
  }
  return p_coordinates->list[a3];
}

- (void)setCoordinates:(double *)a3 count:(unint64_t)a4
{
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(unsigned char *)&self->_flags |= 2u;
  os_unfair_lock_unlock(p_readerLock);
  *(unsigned char *)&self->_flags |= 0x40u;

  MEMORY[0x1F4147320](&self->_coordinates, a3, a4);
}

- (void)_readTrafficColors
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 120));
    if ((*(unsigned char *)(a1 + 124) & 8) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOSharedNavRouteInfoReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readTrafficColors_tags_1);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 120));
  }
}

- (unint64_t)trafficColorsCount
{
  return self->_trafficColors.count;
}

- (unsigned)trafficColors
{
  return self->_trafficColors.list;
}

- (void)clearTrafficColors
{
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(unsigned char *)&self->_flags |= 8u;
  os_unfair_lock_unlock(p_readerLock);
  *(unsigned char *)&self->_flags |= 0x40u;

  PBRepeatedUInt32Clear();
}

- (void)addTrafficColor:(unsigned int)a3
{
  if (self) {
    PBRepeatedUInt32Add();
  }
  os_unfair_lock_lock_with_options();
  *(unsigned char *)&self->_flags |= 8u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(unsigned char *)&self->_flags |= 0x40u;
}

- (unsigned)trafficColorAtIndex:(unint64_t)a3
{
  -[GEOSharedNavRouteInfo _readTrafficColors]((uint64_t)self);
  p_trafficColors = &self->_trafficColors;
  unint64_t count = self->_trafficColors.count;
  if (count <= a3)
  {
    objc_super v7 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v8 = *MEMORY[0x1E4F1C4A8];
    v9 = objc_msgSend(NSString, "stringWithFormat:", @"idx (%tu) is out of range (%tu)", a3, count);
    v10 = [v7 exceptionWithName:v8 reason:v9 userInfo:0];
    [v10 raise];
  }
  return p_trafficColors->list[a3];
}

- (void)setTrafficColors:(unsigned int *)a3 count:(unint64_t)a4
{
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(unsigned char *)&self->_flags |= 8u;
  os_unfair_lock_unlock(p_readerLock);
  *(unsigned char *)&self->_flags |= 0x40u;

  MEMORY[0x1F4147400](&self->_trafficColors, a3, a4);
}

- (void)_readTrafficColorOffsets
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 120));
    if ((*(unsigned char *)(a1 + 124) & 4) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOSharedNavRouteInfoReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readTrafficColorOffsets_tags_1);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 120));
  }
}

- (unint64_t)trafficColorOffsetsCount
{
  return self->_trafficColorOffsets.count;
}

- (unsigned)trafficColorOffsets
{
  return self->_trafficColorOffsets.list;
}

- (void)clearTrafficColorOffsets
{
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(unsigned char *)&self->_flags |= 4u;
  os_unfair_lock_unlock(p_readerLock);
  *(unsigned char *)&self->_flags |= 0x40u;

  PBRepeatedUInt32Clear();
}

- (void)addTrafficColorOffset:(unsigned int)a3
{
  if (self) {
    PBRepeatedUInt32Add();
  }
  os_unfair_lock_lock_with_options();
  *(unsigned char *)&self->_flags |= 4u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(unsigned char *)&self->_flags |= 0x40u;
}

- (unsigned)trafficColorOffsetAtIndex:(unint64_t)a3
{
  -[GEOSharedNavRouteInfo _readTrafficColorOffsets]((uint64_t)self);
  p_trafficColorOffsets = &self->_trafficColorOffsets;
  unint64_t count = self->_trafficColorOffsets.count;
  if (count <= a3)
  {
    objc_super v7 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v8 = *MEMORY[0x1E4F1C4A8];
    v9 = objc_msgSend(NSString, "stringWithFormat:", @"idx (%tu) is out of range (%tu)", a3, count);
    v10 = [v7 exceptionWithName:v8 reason:v9 userInfo:0];
    [v10 raise];
  }
  return p_trafficColorOffsets->list[a3];
}

- (void)setTrafficColorOffsets:(unsigned int *)a3 count:(unint64_t)a4
{
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(unsigned char *)&self->_flags |= 4u;
  os_unfair_lock_unlock(p_readerLock);
  *(unsigned char *)&self->_flags |= 0x40u;

  MEMORY[0x1F4147400](&self->_trafficColorOffsets, a3, a4);
}

- (void)_readChargingStations
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 120));
    if ((*(unsigned char *)(a1 + 124) & 0x10) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOSharedNavRouteInfoReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readChargingStations_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 120));
  }
}

- (NSMutableArray)chargingStations
{
  -[GEOSharedNavRouteInfo _readChargingStations]((uint64_t)self);
  chargingStations = self->_chargingStations;

  return chargingStations;
}

- (void)setChargingStations:(id)a3
{
  v4 = (NSMutableArray *)a3;
  os_unfair_lock_lock_with_options();
  *(unsigned char *)&self->_flags |= 0x10u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(unsigned char *)&self->_flags |= 0x40u;
  chargingStations = self->_chargingStations;
  self->_chargingStations = v4;
}

- (void)clearChargingStations
{
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(unsigned char *)&self->_flags |= 0x10u;
  os_unfair_lock_unlock(p_readerLock);
  *(unsigned char *)&self->_flags |= 0x40u;
  chargingStations = self->_chargingStations;

  [(NSMutableArray *)chargingStations removeAllObjects];
}

- (void)addChargingStations:(id)a3
{
  id v4 = a3;
  -[GEOSharedNavRouteInfo _readChargingStations]((uint64_t)self);
  -[GEOSharedNavRouteInfo _addNoFlagsChargingStations:]((uint64_t)self, v4);

  os_unfair_lock_lock_with_options();
  *(unsigned char *)&self->_flags |= 0x10u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(unsigned char *)&self->_flags |= 0x40u;
}

- (void)_addNoFlagsChargingStations:(uint64_t)a1
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

- (unint64_t)chargingStationsCount
{
  -[GEOSharedNavRouteInfo _readChargingStations]((uint64_t)self);
  chargingStations = self->_chargingStations;

  return [(NSMutableArray *)chargingStations count];
}

- (id)chargingStationsAtIndex:(unint64_t)a3
{
  -[GEOSharedNavRouteInfo _readChargingStations]((uint64_t)self);
  chargingStations = self->_chargingStations;

  return (id)[(NSMutableArray *)chargingStations objectAtIndex:a3];
}

+ (Class)chargingStationsType
{
  return (Class)objc_opt_class();
}

- (void)_readRoutingPathLegs
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 120));
    if ((*(unsigned char *)(a1 + 124) & 0x20) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOSharedNavRouteInfoReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readRoutingPathLegs_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 120));
  }
}

- (NSMutableArray)routingPathLegs
{
  -[GEOSharedNavRouteInfo _readRoutingPathLegs]((uint64_t)self);
  routingPathLegs = self->_routingPathLegs;

  return routingPathLegs;
}

- (void)setRoutingPathLegs:(id)a3
{
  id v4 = (NSMutableArray *)a3;
  os_unfair_lock_lock_with_options();
  *(unsigned char *)&self->_flags |= 0x20u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(unsigned char *)&self->_flags |= 0x40u;
  routingPathLegs = self->_routingPathLegs;
  self->_routingPathLegs = v4;
}

- (void)clearRoutingPathLegs
{
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(unsigned char *)&self->_flags |= 0x20u;
  os_unfair_lock_unlock(p_readerLock);
  *(unsigned char *)&self->_flags |= 0x40u;
  routingPathLegs = self->_routingPathLegs;

  [(NSMutableArray *)routingPathLegs removeAllObjects];
}

- (void)addRoutingPathLeg:(id)a3
{
  id v4 = a3;
  -[GEOSharedNavRouteInfo _readRoutingPathLegs]((uint64_t)self);
  -[GEOSharedNavRouteInfo _addNoFlagsRoutingPathLeg:]((uint64_t)self, v4);

  os_unfair_lock_lock_with_options();
  *(unsigned char *)&self->_flags |= 0x20u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(unsigned char *)&self->_flags |= 0x40u;
}

- (void)_addNoFlagsRoutingPathLeg:(uint64_t)a1
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

- (unint64_t)routingPathLegsCount
{
  -[GEOSharedNavRouteInfo _readRoutingPathLegs]((uint64_t)self);
  routingPathLegs = self->_routingPathLegs;

  return [(NSMutableArray *)routingPathLegs count];
}

- (id)routingPathLegAtIndex:(unint64_t)a3
{
  -[GEOSharedNavRouteInfo _readRoutingPathLegs]((uint64_t)self);
  routingPathLegs = self->_routingPathLegs;

  return (id)[(NSMutableArray *)routingPathLegs objectAtIndex:a3];
}

+ (Class)routingPathLegType
{
  return (Class)objc_opt_class();
}

- (id)description
{
  id v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)GEOSharedNavRouteInfo;
  id v4 = [(GEOSharedNavRouteInfo *)&v8 description];
  id v5 = [(GEOSharedNavRouteInfo *)self dictionaryRepresentation];
  objc_super v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEOSharedNavRouteInfo _dictionaryRepresentation:]((uint64_t)self, 0);
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  uint64_t v47 = *MEMORY[0x1E4F143B8];
  if (a1)
  {
    [(id)a1 readAll:1];
    id v4 = [MEMORY[0x1E4F1CA60] dictionary];
    if (*(void *)(a1 + 32))
    {
      id v5 = PBRepeatedDoubleNSArray();
      [v4 setObject:v5 forKey:@"coordinates"];
    }
    if (*(void *)(a1 + 80))
    {
      objc_super v6 = PBRepeatedUInt32NSArray();
      if (a2) {
        id v7 = @"trafficColor";
      }
      else {
        id v7 = @"traffic_color";
      }
      [v4 setObject:v6 forKey:v7];
    }
    if (*(void *)(a1 + 56))
    {
      objc_super v8 = PBRepeatedUInt32NSArray();
      if (a2) {
        v9 = @"trafficColorOffset";
      }
      else {
        v9 = @"traffic_color_offset";
      }
      [v4 setObject:v8 forKey:v9];
    }
    if ([*(id *)(a1 + 96) count])
    {
      v10 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(*(id *)(a1 + 96), "count"));
      long long v41 = 0u;
      long long v42 = 0u;
      long long v43 = 0u;
      long long v44 = 0u;
      id v11 = *(id *)(a1 + 96);
      uint64_t v12 = [v11 countByEnumeratingWithState:&v41 objects:v46 count:16];
      if (v12)
      {
        uint64_t v13 = v12;
        uint64_t v14 = *(void *)v42;
        do
        {
          for (uint64_t i = 0; i != v13; ++i)
          {
            if (*(void *)v42 != v14) {
              objc_enumerationMutation(v11);
            }
            v16 = *(void **)(*((void *)&v41 + 1) + 8 * i);
            if (a2) {
              [v16 jsonRepresentation];
            }
            else {
            v17 = [v16 dictionaryRepresentation];
            }
            [v10 addObject:v17];
          }
          uint64_t v13 = [v11 countByEnumeratingWithState:&v41 objects:v46 count:16];
        }
        while (v13);
      }

      [v4 setObject:v10 forKey:@"chargingStations"];
    }
    if (*(void *)(a1 + 104))
    {
      if (a2)
      {
        v18 = (void *)MEMORY[0x1E4F1CA48];
        v19 = [(id)a1 routingPathLegs];
        v20 = objc_msgSend(v18, "arrayWithCapacity:", objc_msgSend(v19, "count"));

        long long v39 = 0u;
        long long v40 = 0u;
        long long v37 = 0u;
        long long v38 = 0u;
        v21 = [(id)a1 routingPathLegs];
        uint64_t v22 = [v21 countByEnumeratingWithState:&v37 objects:v45 count:16];
        if (v22)
        {
          uint64_t v23 = v22;
          uint64_t v24 = *(void *)v38;
          do
          {
            for (uint64_t j = 0; j != v23; ++j)
            {
              if (*(void *)v38 != v24) {
                objc_enumerationMutation(v21);
              }
              v26 = [*(id *)(*((void *)&v37 + 1) + 8 * j) base64EncodedStringWithOptions:0];
              [v20 addObject:v26];
            }
            uint64_t v23 = [v21 countByEnumeratingWithState:&v37 objects:v45 count:16];
          }
          while (v23);
        }

        v27 = @"routingPathLeg";
      }
      else
      {
        v20 = [(id)a1 routingPathLegs];
        v27 = @"routing_path_leg";
      }
      [v4 setObject:v20 forKey:v27];
    }
    v28 = *(void **)(a1 + 16);
    if (v28)
    {
      v29 = [v28 dictionaryRepresentation];
      v30 = v29;
      if (a2)
      {
        v31 = objc_msgSend(MEMORY[0x1E4F1CA60], "dictionaryWithCapacity:", objc_msgSend(v29, "count"));
        v35[0] = MEMORY[0x1E4F143A8];
        v35[1] = 3221225472;
        v35[2] = __51__GEOSharedNavRouteInfo__dictionaryRepresentation___block_invoke;
        v35[3] = &unk_1E53D8860;
        id v32 = v31;
        id v36 = v32;
        [v30 enumerateKeysAndObjectsUsingBlock:v35];
        id v33 = v32;

        v30 = v33;
      }
      [v4 setObject:v30 forKey:@"Unknown Fields"];
    }
  }
  else
  {
    id v4 = 0;
  }

  return v4;
}

- (id)jsonRepresentation
{
  return -[GEOSharedNavRouteInfo _dictionaryRepresentation:]((uint64_t)self, 1);
}

void __51__GEOSharedNavRouteInfo__dictionaryRepresentation___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v10 = a2;
  id v5 = a3;
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();
  id v7 = *(void **)(a1 + 32);
  if (isKindOfClass)
  {
    objc_super v8 = [v5 base64EncodedStringWithOptions:0];
    v9 = [v10 description];
    [v7 setObject:v8 forKey:v9];
  }
  else
  {
    objc_super v8 = [v10 description];
    [v7 setObject:v5 forKey:v8];
  }
}

- (GEOSharedNavRouteInfo)initWithDictionary:(id)a3
{
  return (GEOSharedNavRouteInfo *)-[GEOSharedNavRouteInfo _initWithDictionary:isJSON:](self, a3, 0);
}

- (void)_initWithDictionary:(int)a3 isJSON:
{
  uint64_t v74 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  if (a1)
  {
    a1 = (void *)[a1 init];
    if (a1)
    {
      objc_super v6 = [v5 objectForKeyedSubscript:@"coordinates"];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        long long v67 = 0u;
        long long v68 = 0u;
        long long v65 = 0u;
        long long v66 = 0u;
        id v7 = v6;
        uint64_t v8 = [v7 countByEnumeratingWithState:&v65 objects:v73 count:16];
        if (v8)
        {
          uint64_t v9 = v8;
          uint64_t v10 = *(void *)v66;
          do
          {
            for (uint64_t i = 0; i != v9; ++i)
            {
              if (*(void *)v66 != v10) {
                objc_enumerationMutation(v7);
              }
              uint64_t v12 = *(void **)(*((void *)&v65 + 1) + 8 * i);
              objc_opt_class();
              if (objc_opt_isKindOfClass())
              {
                [v12 doubleValue];
                objc_msgSend(a1, "addCoordinates:");
              }
            }
            uint64_t v9 = [v7 countByEnumeratingWithState:&v65 objects:v73 count:16];
          }
          while (v9);
        }
      }
      if (a3) {
        uint64_t v13 = @"trafficColor";
      }
      else {
        uint64_t v13 = @"traffic_color";
      }
      uint64_t v14 = [v5 objectForKeyedSubscript:v13];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        long long v63 = 0u;
        long long v64 = 0u;
        long long v61 = 0u;
        long long v62 = 0u;
        id v15 = v14;
        uint64_t v16 = [v15 countByEnumeratingWithState:&v61 objects:v72 count:16];
        if (v16)
        {
          uint64_t v17 = v16;
          uint64_t v18 = *(void *)v62;
          do
          {
            for (uint64_t j = 0; j != v17; ++j)
            {
              if (*(void *)v62 != v18) {
                objc_enumerationMutation(v15);
              }
              v20 = *(void **)(*((void *)&v61 + 1) + 8 * j);
              objc_opt_class();
              if (objc_opt_isKindOfClass()) {
                objc_msgSend(a1, "addTrafficColor:", objc_msgSend(v20, "unsignedIntValue"));
              }
            }
            uint64_t v17 = [v15 countByEnumeratingWithState:&v61 objects:v72 count:16];
          }
          while (v17);
        }
      }
      if (a3) {
        v21 = @"trafficColorOffset";
      }
      else {
        v21 = @"traffic_color_offset";
      }
      uint64_t v22 = [v5 objectForKeyedSubscript:v21];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        long long v59 = 0u;
        long long v60 = 0u;
        long long v57 = 0u;
        long long v58 = 0u;
        id v23 = v22;
        uint64_t v24 = [v23 countByEnumeratingWithState:&v57 objects:v71 count:16];
        if (v24)
        {
          uint64_t v25 = v24;
          uint64_t v26 = *(void *)v58;
          do
          {
            for (uint64_t k = 0; k != v25; ++k)
            {
              if (*(void *)v58 != v26) {
                objc_enumerationMutation(v23);
              }
              v28 = *(void **)(*((void *)&v57 + 1) + 8 * k);
              objc_opt_class();
              if (objc_opt_isKindOfClass()) {
                objc_msgSend(a1, "addTrafficColorOffset:", objc_msgSend(v28, "unsignedIntValue"));
              }
            }
            uint64_t v25 = [v23 countByEnumeratingWithState:&v57 objects:v71 count:16];
          }
          while (v25);
        }
      }
      v29 = [v5 objectForKeyedSubscript:@"chargingStations"];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        long long v55 = 0u;
        long long v56 = 0u;
        long long v53 = 0u;
        long long v54 = 0u;
        id v30 = v29;
        uint64_t v31 = [v30 countByEnumeratingWithState:&v53 objects:v70 count:16];
        if (v31)
        {
          uint64_t v32 = v31;
          uint64_t v33 = *(void *)v54;
          do
          {
            for (uint64_t m = 0; m != v32; ++m)
            {
              if (*(void *)v54 != v33) {
                objc_enumerationMutation(v30);
              }
              uint64_t v35 = *(void *)(*((void *)&v53 + 1) + 8 * m);
              objc_opt_class();
              if (objc_opt_isKindOfClass())
              {
                id v36 = [GEOSharedNavChargingStationInfo alloc];
                if (a3) {
                  uint64_t v37 = [(GEOSharedNavChargingStationInfo *)v36 initWithJSON:v35];
                }
                else {
                  uint64_t v37 = [(GEOSharedNavChargingStationInfo *)v36 initWithDictionary:v35];
                }
                long long v38 = (void *)v37;
                [a1 addChargingStations:v37];
              }
            }
            uint64_t v32 = [v30 countByEnumeratingWithState:&v53 objects:v70 count:16];
          }
          while (v32);
        }
      }
      if (a3) {
        long long v39 = @"routingPathLeg";
      }
      else {
        long long v39 = @"routing_path_leg";
      }
      long long v40 = [v5 objectForKeyedSubscript:v39];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        long long v51 = 0u;
        long long v52 = 0u;
        long long v49 = 0u;
        long long v50 = 0u;
        id v41 = v40;
        uint64_t v42 = [v41 countByEnumeratingWithState:&v49 objects:v69 count:16];
        if (v42)
        {
          uint64_t v43 = v42;
          uint64_t v44 = *(void *)v50;
          do
          {
            for (uint64_t n = 0; n != v43; ++n)
            {
              if (*(void *)v50 != v44) {
                objc_enumerationMutation(v41);
              }
              uint64_t v46 = *(void *)(*((void *)&v49 + 1) + 8 * n);
              objc_opt_class();
              if (objc_opt_isKindOfClass())
              {
                uint64_t v47 = (void *)[objc_alloc(MEMORY[0x1E4F1C9B8]) initWithBase64EncodedString:v46 options:0];
                [a1 addRoutingPathLeg:v47];
              }
            }
            uint64_t v43 = [v41 countByEnumeratingWithState:&v49 objects:v69 count:16];
          }
          while (v43);
        }
      }
    }
  }

  return a1;
}

- (GEOSharedNavRouteInfo)initWithJSON:(id)a3
{
  return (GEOSharedNavRouteInfo *)-[GEOSharedNavRouteInfo _initWithDictionary:isJSON:](self, a3, 1);
}

- (void)readAll:(BOOL)a3
{
  BOOL v3 = a3;
  p_readerLocuint64_t k = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  reader = self->_reader;
  if (reader)
  {
    id v7 = reader;
    objc_sync_enter(v7);
    if (v3) {
      uint64_t v8 = (int *)&readAll__recursiveTag_3354;
    }
    else {
      uint64_t v8 = (int *)&readAll__nonRecursiveTag_3355;
    }
    GEOSharedNavRouteInfoReadSpecified((uint64_t)self, (unint64_t)self->_reader, v8);
    objc_sync_exit(v7);
  }
  if (v3) {
    _GEOSharedNavRouteInfoCallReadAllRecursiveWithoutSynchronized((uint64_t)self);
  }

  os_unfair_lock_unlock(p_readerLock);
}

+ (BOOL)isValid:(id)a3
{
  return GEOSharedNavRouteInfoIsValid((char *)a3);
}

- (BOOL)readFrom:(id)a3
{
  return GEOSharedNavRouteInfoReadAllFrom((uint64_t)self, a3, 0);
}

- (void)writeTo:(id)a3
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  p_readerLocuint64_t k = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  if (self->_reader && (os_unfair_lock_assert_owner(&self->_readerLock), (*(unsigned char *)&self->_flags & 0x7E) == 0))
  {
    uint64_t v17 = self->_reader;
    objc_sync_enter(v17);
    *(void *)((char *)self->_reader + (int)*MEMORY[0x1E4F940E0]) = self->_readerMarkLength;
    [(PBDataReader *)self->_reader seekToOffset:self->_readerMarkPos];
    uint64_t v18 = [(PBDataReader *)self->_reader readBytes:self->_readerMarkLength - self->_readerMarkPos];
    [v4 writeData:v18];
    os_unfair_lock_unlock(p_readerLock);

    objc_sync_exit(v17);
  }
  else
  {
    os_unfair_lock_unlock(&self->_readerLock);
    [(GEOSharedNavRouteInfo *)self readAll:0];
    if (self->_coordinates.count)
    {
      uint64_t v27 = 0;
      PBDataWriterPlaceMark();
      if (self->_coordinates.count)
      {
        unint64_t v6 = 0;
        do
        {
          PBDataWriterWriteDoubleField();
          ++v6;
        }
        while (v6 < self->_coordinates.count);
      }
      PBDataWriterRecallMark();
    }
    if (self->_trafficColors.count)
    {
      unint64_t v7 = 0;
      do
      {
        PBDataWriterWriteUint32Field();
        ++v7;
      }
      while (v7 < self->_trafficColors.count);
    }
    if (self->_trafficColorOffsets.count)
    {
      unint64_t v8 = 0;
      do
      {
        PBDataWriterWriteUint32Field();
        ++v8;
      }
      while (v8 < self->_trafficColorOffsets.count);
    }
    long long v25 = 0u;
    long long v26 = 0u;
    long long v23 = 0u;
    long long v24 = 0u;
    uint64_t v9 = self->_chargingStations;
    uint64_t v10 = [(NSMutableArray *)v9 countByEnumeratingWithState:&v23 objects:v29 count:16];
    if (v10)
    {
      uint64_t v11 = *(void *)v24;
      do
      {
        for (uint64_t i = 0; i != v10; ++i)
        {
          if (*(void *)v24 != v11) {
            objc_enumerationMutation(v9);
          }
          PBDataWriterWriteSubmessage();
        }
        uint64_t v10 = [(NSMutableArray *)v9 countByEnumeratingWithState:&v23 objects:v29 count:16];
      }
      while (v10);
    }

    long long v21 = 0u;
    long long v22 = 0u;
    long long v19 = 0u;
    long long v20 = 0u;
    uint64_t v13 = self->_routingPathLegs;
    uint64_t v14 = [(NSMutableArray *)v13 countByEnumeratingWithState:&v19 objects:v28 count:16];
    if (v14)
    {
      uint64_t v15 = *(void *)v20;
      do
      {
        for (uint64_t j = 0; j != v14; ++j)
        {
          if (*(void *)v20 != v15) {
            objc_enumerationMutation(v13);
          }
          PBDataWriterWriteDataField();
        }
        uint64_t v14 = [(NSMutableArray *)v13 countByEnumeratingWithState:&v19 objects:v28 count:16];
      }
      while (v14);
    }

    -[PBUnknownFields writeTo:](self->_unknownFields, "writeTo:", v4, v19);
  }
}

- (void)copyTo:(id)a3
{
  long long v21 = (id *)a3;
  [(GEOSharedNavRouteInfo *)self readAll:0];
  os_unfair_lock_lock_with_options();
  objc_storeStrong(v21 + 1, self->_reader);
  *((_DWORD *)v21 + 28) = self->_readerMarkPos;
  *((_DWORD *)v21 + 29) = self->_readerMarkLength;
  os_unfair_lock_unlock(&self->_readerLock);
  if ([(GEOSharedNavRouteInfo *)self coordinatesCount])
  {
    [v21 clearCoordinates];
    unint64_t v4 = [(GEOSharedNavRouteInfo *)self coordinatesCount];
    if (v4)
    {
      unint64_t v5 = v4;
      for (uint64_t i = 0; i != v5; ++i)
      {
        [(GEOSharedNavRouteInfo *)self coordinatesAtIndex:i];
        objc_msgSend(v21, "addCoordinates:");
      }
    }
  }
  if ([(GEOSharedNavRouteInfo *)self trafficColorsCount])
  {
    [v21 clearTrafficColors];
    unint64_t v7 = [(GEOSharedNavRouteInfo *)self trafficColorsCount];
    if (v7)
    {
      unint64_t v8 = v7;
      for (uint64_t j = 0; j != v8; ++j)
        objc_msgSend(v21, "addTrafficColor:", -[GEOSharedNavRouteInfo trafficColorAtIndex:](self, "trafficColorAtIndex:", j));
    }
  }
  if ([(GEOSharedNavRouteInfo *)self trafficColorOffsetsCount])
  {
    [v21 clearTrafficColorOffsets];
    unint64_t v10 = [(GEOSharedNavRouteInfo *)self trafficColorOffsetsCount];
    if (v10)
    {
      unint64_t v11 = v10;
      for (uint64_t k = 0; k != v11; ++k)
        objc_msgSend(v21, "addTrafficColorOffset:", -[GEOSharedNavRouteInfo trafficColorOffsetAtIndex:](self, "trafficColorOffsetAtIndex:", k));
    }
  }
  if ([(GEOSharedNavRouteInfo *)self chargingStationsCount])
  {
    [v21 clearChargingStations];
    unint64_t v13 = [(GEOSharedNavRouteInfo *)self chargingStationsCount];
    if (v13)
    {
      unint64_t v14 = v13;
      for (uint64_t m = 0; m != v14; ++m)
      {
        uint64_t v16 = [(GEOSharedNavRouteInfo *)self chargingStationsAtIndex:m];
        [v21 addChargingStations:v16];
      }
    }
  }
  if ([(GEOSharedNavRouteInfo *)self routingPathLegsCount])
  {
    [v21 clearRoutingPathLegs];
    unint64_t v17 = [(GEOSharedNavRouteInfo *)self routingPathLegsCount];
    if (v17)
    {
      unint64_t v18 = v17;
      for (uint64_t n = 0; n != v18; ++n)
      {
        long long v20 = [(GEOSharedNavRouteInfo *)self routingPathLegAtIndex:n];
        [v21 addRoutingPathLeg:v20];
      }
    }
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  unint64_t v5 = (id *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  os_unfair_lock_lock(&self->_readerLock);
  reader = self->_reader;
  if (reader)
  {
    unint64_t v7 = reader;
    objc_sync_enter(v7);
    if ((*(unsigned char *)&self->_flags & 0x40) == 0)
    {
      *(void *)((char *)self->_reader + (int)*MEMORY[0x1E4F940E0]) = self->_readerMarkLength;
      [(PBDataReader *)self->_reader seekToOffset:self->_readerMarkPos];
      GEOSharedNavRouteInfoReadAllFrom((uint64_t)v5, self->_reader, 0);
      os_unfair_lock_unlock(&self->_readerLock);
      objc_sync_exit(v7);

      return v5;
    }
    objc_sync_exit(v7);
  }
  os_unfair_lock_unlock(&self->_readerLock);
  [(GEOSharedNavRouteInfo *)self readAll:0];
  PBRepeatedDoubleCopy();
  PBRepeatedUInt32Copy();
  PBRepeatedUInt32Copy();
  long long v25 = 0u;
  long long v26 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  unint64_t v8 = self->_chargingStations;
  uint64_t v9 = [(NSMutableArray *)v8 countByEnumeratingWithState:&v23 objects:v28 count:16];
  if (v9)
  {
    uint64_t v10 = *(void *)v24;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v24 != v10) {
          objc_enumerationMutation(v8);
        }
        uint64_t v12 = (void *)[*(id *)(*((void *)&v23 + 1) + 8 * i) copyWithZone:a3];
        [v5 addChargingStations:v12];
      }
      uint64_t v9 = [(NSMutableArray *)v8 countByEnumeratingWithState:&v23 objects:v28 count:16];
    }
    while (v9);
  }

  long long v21 = 0u;
  long long v22 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  unint64_t v13 = self->_routingPathLegs;
  uint64_t v14 = [(NSMutableArray *)v13 countByEnumeratingWithState:&v19 objects:v27 count:16];
  if (v14)
  {
    uint64_t v15 = *(void *)v20;
    do
    {
      for (uint64_t j = 0; j != v14; ++j)
      {
        if (*(void *)v20 != v15) {
          objc_enumerationMutation(v13);
        }
        unint64_t v17 = objc_msgSend(*(id *)(*((void *)&v19 + 1) + 8 * j), "copyWithZone:", a3, (void)v19);
        [v5 addRoutingPathLeg:v17];
      }
      uint64_t v14 = [(NSMutableArray *)v13 countByEnumeratingWithState:&v19 objects:v27 count:16];
    }
    while (v14);
  }

  objc_storeStrong(v5 + 2, self->_unknownFields);
  return v5;
}

- (BOOL)isEqual:(id)a3
{
  unint64_t v4 = a3;
  if ([v4 isMemberOfClass:objc_opt_class()]
    && ([(GEOSharedNavRouteInfo *)self readAll:1],
        [v4 readAll:1],
        PBRepeatedDoubleIsEqual())
    && PBRepeatedUInt32IsEqual()
    && PBRepeatedUInt32IsEqual()
    && ((chargingStations = self->_chargingStations, !((unint64_t)chargingStations | v4[12]))
     || -[NSMutableArray isEqual:](chargingStations, "isEqual:")))
  {
    routingPathLegs = self->_routingPathLegs;
    if ((unint64_t)routingPathLegs | v4[13]) {
      char v7 = -[NSMutableArray isEqual:](routingPathLegs, "isEqual:");
    }
    else {
      char v7 = 1;
    }
  }
  else
  {
    char v7 = 0;
  }

  return v7;
}

- (unint64_t)hash
{
  [(GEOSharedNavRouteInfo *)self readAll:1];
  uint64_t v3 = PBRepeatedDoubleHash();
  uint64_t v4 = PBRepeatedUInt32Hash() ^ v3;
  uint64_t v5 = v4 ^ PBRepeatedUInt32Hash();
  uint64_t v6 = v5 ^ [(NSMutableArray *)self->_chargingStations hash];
  return v6 ^ [(NSMutableArray *)self->_routingPathLegs hash];
}

- (void)mergeFrom:(id)a3
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  uint64_t v4 = (id *)a3;
  [v4 readAll:0];
  uint64_t v5 = [v4 coordinatesCount];
  if (v5)
  {
    uint64_t v6 = v5;
    for (uint64_t i = 0; i != v6; ++i)
    {
      [v4 coordinatesAtIndex:i];
      -[GEOSharedNavRouteInfo addCoordinates:](self, "addCoordinates:");
    }
  }
  uint64_t v8 = [v4 trafficColorsCount];
  if (v8)
  {
    uint64_t v9 = v8;
    for (uint64_t j = 0; j != v9; ++j)
      -[GEOSharedNavRouteInfo addTrafficColor:](self, "addTrafficColor:", [v4 trafficColorAtIndex:j]);
  }
  uint64_t v11 = [v4 trafficColorOffsetsCount];
  if (v11)
  {
    uint64_t v12 = v11;
    for (uint64_t k = 0; k != v12; ++k)
      -[GEOSharedNavRouteInfo addTrafficColorOffset:](self, "addTrafficColorOffset:", [v4 trafficColorOffsetAtIndex:k]);
  }
  long long v30 = 0u;
  long long v31 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  id v14 = v4[12];
  uint64_t v15 = [v14 countByEnumeratingWithState:&v28 objects:v33 count:16];
  if (v15)
  {
    uint64_t v16 = v15;
    uint64_t v17 = *(void *)v29;
    do
    {
      uint64_t v18 = 0;
      do
      {
        if (*(void *)v29 != v17) {
          objc_enumerationMutation(v14);
        }
        [(GEOSharedNavRouteInfo *)self addChargingStations:*(void *)(*((void *)&v28 + 1) + 8 * v18++)];
      }
      while (v16 != v18);
      uint64_t v16 = [v14 countByEnumeratingWithState:&v28 objects:v33 count:16];
    }
    while (v16);
  }

  long long v26 = 0u;
  long long v27 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  id v19 = v4[13];
  uint64_t v20 = [v19 countByEnumeratingWithState:&v24 objects:v32 count:16];
  if (v20)
  {
    uint64_t v21 = v20;
    uint64_t v22 = *(void *)v25;
    do
    {
      uint64_t v23 = 0;
      do
      {
        if (*(void *)v25 != v22) {
          objc_enumerationMutation(v19);
        }
        -[GEOSharedNavRouteInfo addRoutingPathLeg:](self, "addRoutingPathLeg:", *(void *)(*((void *)&v24 + 1) + 8 * v23++), (void)v24);
      }
      while (v21 != v23);
      uint64_t v21 = [v19 countByEnumeratingWithState:&v24 objects:v32 count:16];
    }
    while (v21);
  }
}

- (PBUnknownFields)unknownFields
{
  p_readerLocuint64_t k = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  if ((*(unsigned char *)&self->_flags & 1) == 0)
  {
    reader = self->_reader;
    if (reader)
    {
      uint64_t v5 = reader;
      objc_sync_enter(v5);
      GEOSharedNavRouteInfoReadSpecified((uint64_t)self, (unint64_t)self->_reader, (int *)&unknownFields_tags_3359);
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
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  p_readerLocuint64_t k = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(unsigned char *)&self->_flags |= 0x41u;
  os_unfair_lock_unlock(p_readerLock);
  unknownFields = self->_unknownFields;
  self->_unknownFields = 0;

  if (v3)
  {
    [(GEOSharedNavRouteInfo *)self readAll:0];
    long long v14 = 0u;
    long long v15 = 0u;
    long long v12 = 0u;
    long long v13 = 0u;
    char v7 = self->_chargingStations;
    uint64_t v8 = [(NSMutableArray *)v7 countByEnumeratingWithState:&v12 objects:v16 count:16];
    if (v8)
    {
      uint64_t v9 = v8;
      uint64_t v10 = *(void *)v13;
      do
      {
        uint64_t v11 = 0;
        do
        {
          if (*(void *)v13 != v10) {
            objc_enumerationMutation(v7);
          }
          objc_msgSend(*(id *)(*((void *)&v12 + 1) + 8 * v11++), "clearUnknownFields:", 1, (void)v12);
        }
        while (v9 != v11);
        uint64_t v9 = [(NSMutableArray *)v7 countByEnumeratingWithState:&v12 objects:v16 count:16];
      }
      while (v9);
    }
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_routingPathLegs, 0);
  objc_storeStrong((id *)&self->_chargingStations, 0);
  objc_storeStrong((id *)&self->_unknownFields, 0);

  objc_storeStrong((id *)&self->_reader, 0);
}

@end