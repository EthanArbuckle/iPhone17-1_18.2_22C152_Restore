@interface GEONavigationRouteTransitSummary
+ (BOOL)isValid:(id)a3;
+ (Class)possibleStopType;
+ (Class)scheduledLinkType;
- (BOOL)hasGreenTeaWithValue:(BOOL)a3;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (GEONavigationRouteTransitSummary)init;
- (GEONavigationRouteTransitSummary)initWithData:(id)a3;
- (GEONavigationRouteTransitSummary)initWithDictionary:(id)a3;
- (GEONavigationRouteTransitSummary)initWithJSON:(id)a3;
- (NSMutableArray)possibleStops;
- (NSMutableArray)scheduledLinks;
- (id)_dictionaryRepresentation:(id *)a1;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)jsonRepresentation;
- (id)possibleStopAtIndex:(unint64_t)a3;
- (id)scheduledLinkAtIndex:(unint64_t)a3;
- (unint64_t)hash;
- (unint64_t)possibleStopsCount;
- (unint64_t)scheduledLinksCount;
- (void)_addNoFlagsPossibleStop:(uint64_t)a1;
- (void)_addNoFlagsScheduledLink:(uint64_t)a1;
- (void)_initWithDictionary:(char)a3 isJSON:;
- (void)_readPossibleStops;
- (void)_readScheduledLinks;
- (void)addPossibleStop:(id)a3;
- (void)addScheduledLink:(id)a3;
- (void)clearPossibleStops;
- (void)clearScheduledLinks;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)readAll:(BOOL)a3;
- (void)setPossibleStops:(id)a3;
- (void)setScheduledLinks:(id)a3;
- (void)updateRoute:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation GEONavigationRouteTransitSummary

- (GEONavigationRouteTransitSummary)init
{
  v6.receiver = self;
  v6.super_class = (Class)GEONavigationRouteTransitSummary;
  v2 = [(GEONavigationRouteTransitSummary *)&v6 init];
  v3 = v2;
  if (v2)
  {
    v2->_readerLock._os_unfair_lock_opaque = 0;
    v4 = v2;
  }

  return v3;
}

- (GEONavigationRouteTransitSummary)initWithData:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)GEONavigationRouteTransitSummary;
  v3 = [(GEONavigationRouteTransitSummary *)&v7 initWithData:a3];
  v4 = v3;
  if (v3)
  {
    v3->_readerLock._os_unfair_lock_opaque = 0;
    v5 = v3;
  }

  return v4;
}

- (void)_readScheduledLinks
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 40));
    if ((*(unsigned char *)(a1 + 44) & 2) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEONavigationRouteTransitSummaryReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readScheduledLinks_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 40));
  }
}

- (NSMutableArray)scheduledLinks
{
  -[GEONavigationRouteTransitSummary _readScheduledLinks]((uint64_t)self);
  scheduledLinks = self->_scheduledLinks;

  return scheduledLinks;
}

- (void)setScheduledLinks:(id)a3
{
  v4 = (NSMutableArray *)a3;
  os_unfair_lock_lock_with_options();
  *(unsigned char *)&self->_flags |= 2u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(unsigned char *)&self->_flags |= 4u;
  scheduledLinks = self->_scheduledLinks;
  self->_scheduledLinks = v4;
}

- (void)clearScheduledLinks
{
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(unsigned char *)&self->_flags |= 2u;
  os_unfair_lock_unlock(p_readerLock);
  *(unsigned char *)&self->_flags |= 4u;
  scheduledLinks = self->_scheduledLinks;

  [(NSMutableArray *)scheduledLinks removeAllObjects];
}

- (void)addScheduledLink:(id)a3
{
  id v4 = a3;
  -[GEONavigationRouteTransitSummary _readScheduledLinks]((uint64_t)self);
  -[GEONavigationRouteTransitSummary _addNoFlagsScheduledLink:]((uint64_t)self, v4);

  os_unfair_lock_lock_with_options();
  *(unsigned char *)&self->_flags |= 2u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(unsigned char *)&self->_flags |= 4u;
}

- (void)_addNoFlagsScheduledLink:(uint64_t)a1
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

- (unint64_t)scheduledLinksCount
{
  -[GEONavigationRouteTransitSummary _readScheduledLinks]((uint64_t)self);
  scheduledLinks = self->_scheduledLinks;

  return [(NSMutableArray *)scheduledLinks count];
}

- (id)scheduledLinkAtIndex:(unint64_t)a3
{
  -[GEONavigationRouteTransitSummary _readScheduledLinks]((uint64_t)self);
  scheduledLinks = self->_scheduledLinks;

  return (id)[(NSMutableArray *)scheduledLinks objectAtIndex:a3];
}

+ (Class)scheduledLinkType
{
  return (Class)objc_opt_class();
}

- (void)_readPossibleStops
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 40));
    if ((*(unsigned char *)(a1 + 44) & 1) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEONavigationRouteTransitSummaryReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readPossibleStops_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 40));
  }
}

- (NSMutableArray)possibleStops
{
  -[GEONavigationRouteTransitSummary _readPossibleStops]((uint64_t)self);
  possibleStops = self->_possibleStops;

  return possibleStops;
}

- (void)setPossibleStops:(id)a3
{
  id v4 = (NSMutableArray *)a3;
  os_unfair_lock_lock_with_options();
  *(unsigned char *)&self->_flags |= 1u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(unsigned char *)&self->_flags |= 4u;
  possibleStops = self->_possibleStops;
  self->_possibleStops = v4;
}

- (void)clearPossibleStops
{
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(unsigned char *)&self->_flags |= 1u;
  os_unfair_lock_unlock(p_readerLock);
  *(unsigned char *)&self->_flags |= 4u;
  possibleStops = self->_possibleStops;

  [(NSMutableArray *)possibleStops removeAllObjects];
}

- (void)addPossibleStop:(id)a3
{
  id v4 = a3;
  -[GEONavigationRouteTransitSummary _readPossibleStops]((uint64_t)self);
  -[GEONavigationRouteTransitSummary _addNoFlagsPossibleStop:]((uint64_t)self, v4);

  os_unfair_lock_lock_with_options();
  *(unsigned char *)&self->_flags |= 1u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(unsigned char *)&self->_flags |= 4u;
}

- (void)_addNoFlagsPossibleStop:(uint64_t)a1
{
  id v3 = a2;
  if (a1)
  {
    id v4 = *(void **)(a1 + 16);
    id v7 = v3;
    if (!v4)
    {
      id v5 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
      objc_super v6 = *(void **)(a1 + 16);
      *(void *)(a1 + 16) = v5;

      id v4 = *(void **)(a1 + 16);
    }
    [v4 addObject:v7];
    id v3 = v7;
  }
}

- (unint64_t)possibleStopsCount
{
  -[GEONavigationRouteTransitSummary _readPossibleStops]((uint64_t)self);
  possibleStops = self->_possibleStops;

  return [(NSMutableArray *)possibleStops count];
}

- (id)possibleStopAtIndex:(unint64_t)a3
{
  -[GEONavigationRouteTransitSummary _readPossibleStops]((uint64_t)self);
  possibleStops = self->_possibleStops;

  return (id)[(NSMutableArray *)possibleStops objectAtIndex:a3];
}

+ (Class)possibleStopType
{
  return (Class)objc_opt_class();
}

- (id)description
{
  id v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)GEONavigationRouteTransitSummary;
  id v4 = [(GEONavigationRouteTransitSummary *)&v8 description];
  id v5 = [(GEONavigationRouteTransitSummary *)self dictionaryRepresentation];
  objc_super v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEONavigationRouteTransitSummary _dictionaryRepresentation:]((id *)&self->super.super.isa, 0);
}

- (id)_dictionaryRepresentation:(id *)a1
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  if (a1)
  {
    [a1 readAll:1];
    id v4 = [MEMORY[0x1E4F1CA60] dictionary];
    if ([a1[3] count])
    {
      id v5 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(a1[3], "count"));
      long long v26 = 0u;
      long long v27 = 0u;
      long long v28 = 0u;
      long long v29 = 0u;
      id v6 = a1[3];
      uint64_t v7 = [v6 countByEnumeratingWithState:&v26 objects:v31 count:16];
      if (v7)
      {
        uint64_t v8 = v7;
        uint64_t v9 = *(void *)v27;
        do
        {
          for (uint64_t i = 0; i != v8; ++i)
          {
            if (*(void *)v27 != v9) {
              objc_enumerationMutation(v6);
            }
            v11 = *(void **)(*((void *)&v26 + 1) + 8 * i);
            if (a2) {
              [v11 jsonRepresentation];
            }
            else {
            v12 = [v11 dictionaryRepresentation];
            }
            [v5 addObject:v12];
          }
          uint64_t v8 = [v6 countByEnumeratingWithState:&v26 objects:v31 count:16];
        }
        while (v8);
      }

      [v4 setObject:v5 forKey:@"scheduledLink"];
    }
    if ([a1[2] count])
    {
      v13 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(a1[2], "count"));
      long long v22 = 0u;
      long long v23 = 0u;
      long long v24 = 0u;
      long long v25 = 0u;
      id v14 = a1[2];
      uint64_t v15 = [v14 countByEnumeratingWithState:&v22 objects:v30 count:16];
      if (v15)
      {
        uint64_t v16 = v15;
        uint64_t v17 = *(void *)v23;
        do
        {
          for (uint64_t j = 0; j != v16; ++j)
          {
            if (*(void *)v23 != v17) {
              objc_enumerationMutation(v14);
            }
            v19 = *(void **)(*((void *)&v22 + 1) + 8 * j);
            if (a2) {
              [v19 jsonRepresentation];
            }
            else {
            v20 = objc_msgSend(v19, "dictionaryRepresentation", (void)v22);
            }
            objc_msgSend(v13, "addObject:", v20, (void)v22);
          }
          uint64_t v16 = [v14 countByEnumeratingWithState:&v22 objects:v30 count:16];
        }
        while (v16);
      }

      [v4 setObject:v13 forKey:@"possibleStop"];
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
  return -[GEONavigationRouteTransitSummary _dictionaryRepresentation:]((id *)&self->super.super.isa, 1);
}

- (GEONavigationRouteTransitSummary)initWithDictionary:(id)a3
{
  return (GEONavigationRouteTransitSummary *)-[GEONavigationRouteTransitSummary _initWithDictionary:isJSON:](self, a3, 0);
}

- (void)_initWithDictionary:(char)a3 isJSON:
{
  uint64_t v38 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  if (a1)
  {
    a1 = (void *)[a1 init];
    if (a1)
    {
      id v6 = [v5 objectForKeyedSubscript:@"scheduledLink"];
      objc_opt_class();
      id v27 = v5;
      if (objc_opt_isKindOfClass())
      {
        long long v34 = 0u;
        long long v35 = 0u;
        long long v32 = 0u;
        long long v33 = 0u;
        id v7 = v6;
        uint64_t v8 = [v7 countByEnumeratingWithState:&v32 objects:v37 count:16];
        if (v8)
        {
          uint64_t v9 = v8;
          uint64_t v10 = *(void *)v33;
          do
          {
            for (uint64_t i = 0; i != v9; ++i)
            {
              if (*(void *)v33 != v10) {
                objc_enumerationMutation(v7);
              }
              uint64_t v12 = *(void *)(*((void *)&v32 + 1) + 8 * i);
              objc_opt_class();
              if (objc_opt_isKindOfClass())
              {
                v13 = [GEONavigationScheduledTransitLinkSummary alloc];
                if (a3) {
                  uint64_t v14 = [(GEONavigationScheduledTransitLinkSummary *)v13 initWithJSON:v12];
                }
                else {
                  uint64_t v14 = [(GEONavigationScheduledTransitLinkSummary *)v13 initWithDictionary:v12];
                }
                uint64_t v15 = (void *)v14;
                [a1 addScheduledLink:v14];
              }
            }
            uint64_t v9 = [v7 countByEnumeratingWithState:&v32 objects:v37 count:16];
          }
          while (v9);
        }

        id v5 = v27;
      }

      uint64_t v16 = [v5 objectForKeyedSubscript:@"possibleStop"];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        long long v30 = 0u;
        long long v31 = 0u;
        long long v28 = 0u;
        long long v29 = 0u;
        id v17 = v16;
        uint64_t v18 = [v17 countByEnumeratingWithState:&v28 objects:v36 count:16];
        if (v18)
        {
          uint64_t v19 = v18;
          uint64_t v20 = *(void *)v29;
          do
          {
            for (uint64_t j = 0; j != v19; ++j)
            {
              if (*(void *)v29 != v20) {
                objc_enumerationMutation(v17);
              }
              uint64_t v22 = *(void *)(*((void *)&v28 + 1) + 8 * j);
              objc_opt_class();
              if (objc_opt_isKindOfClass())
              {
                long long v23 = [GEONavigationTransitStopSummary alloc];
                if (a3) {
                  uint64_t v24 = [(GEONavigationTransitStopSummary *)v23 initWithJSON:v22];
                }
                else {
                  uint64_t v24 = [(GEONavigationTransitStopSummary *)v23 initWithDictionary:v22];
                }
                long long v25 = (void *)v24;
                [a1 addPossibleStop:v24];
              }
            }
            uint64_t v19 = [v17 countByEnumeratingWithState:&v28 objects:v36 count:16];
          }
          while (v19);
        }

        id v5 = v27;
      }
    }
  }

  return a1;
}

- (GEONavigationRouteTransitSummary)initWithJSON:(id)a3
{
  return (GEONavigationRouteTransitSummary *)-[GEONavigationRouteTransitSummary _initWithDictionary:isJSON:](self, a3, 1);
}

- (void)readAll:(BOOL)a3
{
  BOOL v3 = a3;
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  reader = self->_reader;
  if (reader)
  {
    id v7 = reader;
    objc_sync_enter(v7);
    if (v3) {
      uint64_t v8 = (int *)&readAll__recursiveTag_371_0;
    }
    else {
      uint64_t v8 = (int *)&readAll__nonRecursiveTag_372_0;
    }
    GEONavigationRouteTransitSummaryReadSpecified((uint64_t)self, (unint64_t)self->_reader, v8);
    objc_sync_exit(v7);
  }
  if (v3) {
    _GEONavigationRouteTransitSummaryCallReadAllRecursiveWithoutSynchronized((uint64_t)self);
  }

  os_unfair_lock_unlock(p_readerLock);
}

+ (BOOL)isValid:(id)a3
{
  return GEONavigationRouteTransitSummaryIsValid((char *)a3);
}

- (BOOL)readFrom:(id)a3
{
  return GEONavigationRouteTransitSummaryReadAllFrom((uint64_t)self, a3, 0);
}

- (void)writeTo:(id)a3
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  if (self->_reader && (os_unfair_lock_assert_owner(&self->_readerLock), (*(unsigned char *)&self->_flags & 7) == 0))
  {
    uint64_t v14 = self->_reader;
    objc_sync_enter(v14);
    *(void *)((char *)self->_reader + (int)*MEMORY[0x1E4F940E0]) = self->_readerMarkLength;
    [(PBDataReader *)self->_reader seekToOffset:self->_readerMarkPos];
    uint64_t v15 = [(PBDataReader *)self->_reader readBytes:self->_readerMarkLength - self->_readerMarkPos];
    [v4 writeData:v15];
    os_unfair_lock_unlock(p_readerLock);

    objc_sync_exit(v14);
  }
  else
  {
    os_unfair_lock_unlock(&self->_readerLock);
    [(GEONavigationRouteTransitSummary *)self readAll:0];
    long long v22 = 0u;
    long long v23 = 0u;
    long long v20 = 0u;
    long long v21 = 0u;
    id v6 = self->_scheduledLinks;
    uint64_t v7 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v20 objects:v25 count:16];
    if (v7)
    {
      uint64_t v8 = *(void *)v21;
      do
      {
        for (uint64_t i = 0; i != v7; ++i)
        {
          if (*(void *)v21 != v8) {
            objc_enumerationMutation(v6);
          }
          PBDataWriterWriteSubmessage();
        }
        uint64_t v7 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v20 objects:v25 count:16];
      }
      while (v7);
    }

    long long v18 = 0u;
    long long v19 = 0u;
    long long v16 = 0u;
    long long v17 = 0u;
    uint64_t v10 = self->_possibleStops;
    uint64_t v11 = [(NSMutableArray *)v10 countByEnumeratingWithState:&v16 objects:v24 count:16];
    if (v11)
    {
      uint64_t v12 = *(void *)v17;
      do
      {
        for (uint64_t j = 0; j != v11; ++j)
        {
          if (*(void *)v17 != v12) {
            objc_enumerationMutation(v10);
          }
          PBDataWriterWriteSubmessage();
        }
        uint64_t v11 = [(NSMutableArray *)v10 countByEnumeratingWithState:&v16 objects:v24 count:16];
      }
      while (v11);
    }
  }
}

- (BOOL)hasGreenTeaWithValue:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  -[GEONavigationRouteTransitSummary _readPossibleStops]((uint64_t)self);
  long long v22 = 0u;
  long long v23 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  id v5 = self->_possibleStops;
  uint64_t v6 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v20 objects:v25 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v21;
LABEL_3:
    uint64_t v9 = 0;
    while (1)
    {
      if (*(void *)v21 != v8) {
        objc_enumerationMutation(v5);
      }
      if ([*(id *)(*((void *)&v20 + 1) + 8 * v9) hasGreenTeaWithValue:v3]) {
        goto LABEL_18;
      }
      if (v7 == ++v9)
      {
        uint64_t v7 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v20 objects:v25 count:16];
        if (v7) {
          goto LABEL_3;
        }
        break;
      }
    }
  }

  -[GEONavigationRouteTransitSummary _readScheduledLinks]((uint64_t)self);
  long long v18 = 0u;
  long long v19 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v5 = self->_scheduledLinks;
  uint64_t v10 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v16 objects:v24 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v17;
LABEL_11:
    uint64_t v13 = 0;
    while (1)
    {
      if (*(void *)v17 != v12) {
        objc_enumerationMutation(v5);
      }
      if (objc_msgSend(*(id *)(*((void *)&v16 + 1) + 8 * v13), "hasGreenTeaWithValue:", v3, (void)v16)) {
        break;
      }
      if (v11 == ++v13)
      {
        uint64_t v11 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v16 objects:v24 count:16];
        if (v11) {
          goto LABEL_11;
        }
        goto LABEL_17;
      }
    }
LABEL_18:
    BOOL v14 = 1;
    goto LABEL_19;
  }
LABEL_17:
  BOOL v14 = 0;
LABEL_19:

  return v14;
}

- (void)copyTo:(id)a3
{
  uint64_t v12 = (id *)a3;
  [(GEONavigationRouteTransitSummary *)self readAll:0];
  os_unfair_lock_lock_with_options();
  objc_storeStrong(v12 + 1, self->_reader);
  *((_DWORD *)v12 + 8) = self->_readerMarkPos;
  *((_DWORD *)v12 + 9) = self->_readerMarkLength;
  os_unfair_lock_unlock(&self->_readerLock);
  if ([(GEONavigationRouteTransitSummary *)self scheduledLinksCount])
  {
    [v12 clearScheduledLinks];
    unint64_t v4 = [(GEONavigationRouteTransitSummary *)self scheduledLinksCount];
    if (v4)
    {
      unint64_t v5 = v4;
      for (uint64_t i = 0; i != v5; ++i)
      {
        uint64_t v7 = [(GEONavigationRouteTransitSummary *)self scheduledLinkAtIndex:i];
        [v12 addScheduledLink:v7];
      }
    }
  }
  if ([(GEONavigationRouteTransitSummary *)self possibleStopsCount])
  {
    [v12 clearPossibleStops];
    unint64_t v8 = [(GEONavigationRouteTransitSummary *)self possibleStopsCount];
    if (v8)
    {
      unint64_t v9 = v8;
      for (uint64_t j = 0; j != v9; ++j)
      {
        uint64_t v11 = [(GEONavigationRouteTransitSummary *)self possibleStopAtIndex:j];
        [v12 addPossibleStop:v11];
      }
    }
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  unint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  os_unfair_lock_lock(&self->_readerLock);
  reader = self->_reader;
  if (reader)
  {
    uint64_t v7 = reader;
    objc_sync_enter(v7);
    if ((*(unsigned char *)&self->_flags & 4) == 0)
    {
      *(void *)((char *)self->_reader + (int)*MEMORY[0x1E4F940E0]) = self->_readerMarkLength;
      [(PBDataReader *)self->_reader seekToOffset:self->_readerMarkPos];
      GEONavigationRouteTransitSummaryReadAllFrom((uint64_t)v5, self->_reader, 0);
      os_unfair_lock_unlock(&self->_readerLock);
      objc_sync_exit(v7);

      return v5;
    }
    objc_sync_exit(v7);
  }
  os_unfair_lock_unlock(&self->_readerLock);
  [(GEONavigationRouteTransitSummary *)self readAll:0];
  long long v25 = 0u;
  long long v26 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  unint64_t v8 = self->_scheduledLinks;
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
        [v5 addScheduledLink:v12];
      }
      uint64_t v9 = [(NSMutableArray *)v8 countByEnumeratingWithState:&v23 objects:v28 count:16];
    }
    while (v9);
  }

  long long v21 = 0u;
  long long v22 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  uint64_t v13 = self->_possibleStops;
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
        long long v17 = objc_msgSend(*(id *)(*((void *)&v19 + 1) + 8 * j), "copyWithZone:", a3, (void)v19);
        [v5 addPossibleStop:v17];
      }
      uint64_t v14 = [(NSMutableArray *)v13 countByEnumeratingWithState:&v19 objects:v27 count:16];
    }
    while (v14);
  }

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  unint64_t v4 = a3;
  if ([v4 isMemberOfClass:objc_opt_class()]
    && (([(GEONavigationRouteTransitSummary *)self readAll:1],
         [v4 readAll:1],
         scheduledLinks = self->_scheduledLinks,
         !((unint64_t)scheduledLinks | v4[3]))
     || -[NSMutableArray isEqual:](scheduledLinks, "isEqual:")))
  {
    possibleStops = self->_possibleStops;
    if ((unint64_t)possibleStops | v4[2]) {
      char v7 = -[NSMutableArray isEqual:](possibleStops, "isEqual:");
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
  [(GEONavigationRouteTransitSummary *)self readAll:1];
  uint64_t v3 = [(NSMutableArray *)self->_scheduledLinks hash];
  return [(NSMutableArray *)self->_possibleStops hash] ^ v3;
}

- (void)mergeFrom:(id)a3
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  unint64_t v4 = (id *)a3;
  [v4 readAll:0];
  long long v21 = 0u;
  long long v22 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  id v5 = v4[3];
  uint64_t v6 = [v5 countByEnumeratingWithState:&v19 objects:v24 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v20;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v20 != v8) {
          objc_enumerationMutation(v5);
        }
        [(GEONavigationRouteTransitSummary *)self addScheduledLink:*(void *)(*((void *)&v19 + 1) + 8 * v9++)];
      }
      while (v7 != v9);
      uint64_t v7 = [v5 countByEnumeratingWithState:&v19 objects:v24 count:16];
    }
    while (v7);
  }

  long long v17 = 0u;
  long long v18 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v10 = v4[2];
  uint64_t v11 = [v10 countByEnumeratingWithState:&v15 objects:v23 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v13 = *(void *)v16;
    do
    {
      uint64_t v14 = 0;
      do
      {
        if (*(void *)v16 != v13) {
          objc_enumerationMutation(v10);
        }
        -[GEONavigationRouteTransitSummary addPossibleStop:](self, "addPossibleStop:", *(void *)(*((void *)&v15 + 1) + 8 * v14++), (void)v15);
      }
      while (v12 != v14);
      uint64_t v12 = [v10 countByEnumeratingWithState:&v15 objects:v23 count:16];
    }
    while (v12);
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_scheduledLinks, 0);
  objc_storeStrong((id *)&self->_possibleStops, 0);

  objc_storeStrong((id *)&self->_reader, 0);
}

- (void)updateRoute:(id)a3
{
  uint64_t v42 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  id v4 = objc_alloc(MEMORY[0x1E4F1CA60]);
  id v5 = [v3 stops];
  uint64_t v6 = objc_msgSend(v4, "initWithCapacity:", objc_msgSend(v5, "count"));

  long long v38 = 0u;
  long long v39 = 0u;
  long long v36 = 0u;
  long long v37 = 0u;
  uint64_t v29 = v3;
  uint64_t v7 = [v3 stops];
  uint64_t v8 = [v7 countByEnumeratingWithState:&v36 objects:v41 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v37;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v37 != v10) {
          objc_enumerationMutation(v7);
        }
        uint64_t v12 = [[GEONavigationTransitStopSummary alloc] initWithTransitStop:*(void *)(*((void *)&v36 + 1) + 8 * i)];
        [(GEONavigationRouteTransitSummary *)self addPossibleStop:v12];
        uint64_t v13 = objc_msgSend(NSNumber, "numberWithUnsignedLongLong:", -[GEONavigationTransitStopSummary stopID](v12, "stopID"));
        [v6 setObject:v12 forKey:v13];
      }
      uint64_t v9 = [v7 countByEnumeratingWithState:&v36 objects:v41 count:16];
    }
    while (v9);
  }

  long long v34 = 0u;
  long long v35 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  obuint64_t j = [v29 segments];
  uint64_t v14 = [obj countByEnumeratingWithState:&v32 objects:v40 count:16];
  if (v14)
  {
    uint64_t v15 = v14;
    uint64_t v16 = *(void *)v33;
    do
    {
      for (uint64_t j = 0; j != v15; ++j)
      {
        if (*(void *)v33 != v16) {
          objc_enumerationMutation(obj);
        }
        long long v18 = *(void **)(*((void *)&v32 + 1) + 8 * j);
        if ([v18 type] == 6)
        {
          long long v19 = objc_msgSend(v29, "stepAtIndex:", objc_msgSend(v18, "startStepIndex"));
          long long v20 = NSNumber;
          long long v21 = [v19 originStop];
          long long v22 = objc_msgSend(v20, "numberWithUnsignedLongLong:", objc_msgSend(v21, "muid"));
          long long v23 = [v6 objectForKey:v22];

          long long v24 = NSNumber;
          uint64_t v25 = [v19 destinationStop];
          long long v26 = objc_msgSend(v24, "numberWithUnsignedLongLong:", objc_msgSend(v25, "muid"));
          id v27 = [v6 objectForKey:v26];

          long long v28 = [[GEONavigationScheduledTransitLinkSummary alloc] initWithTransitTripRouteStep:v19 originSummary:v23 destinationSummary:v27];
          [(GEONavigationRouteTransitSummary *)self addScheduledLink:v28];
        }
      }
      uint64_t v15 = [obj countByEnumeratingWithState:&v32 objects:v40 count:16];
    }
    while (v15);
  }
}

@end