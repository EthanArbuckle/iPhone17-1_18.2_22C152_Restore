@interface GEOTransitOptions
+ (BOOL)isValid:(id)a3;
- (BOOL)enableIncidents;
- (BOOL)hasEnableIncidents;
- (BOOL)hasFareOptions;
- (BOOL)hasPrioritization;
- (BOOL)hasRoutingBehavior;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (GEOFareOptions)fareOptions;
- (GEOTransitOptions)init;
- (GEOTransitOptions)initWithData:(id)a3;
- (GEOTransitOptions)initWithDictionary:(id)a3;
- (GEOTransitOptions)initWithJSON:(id)a3;
- (PBUnknownFields)unknownFields;
- (id)_dictionaryRepresentation:(uint64_t)a1;
- (id)avoidedModesAsString:(int)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)jsonRepresentation;
- (id)prioritizationAsString:(int)a3;
- (id)routingBehaviorAsString:(int)a3;
- (int)StringAsAvoidedModes:(id)a3;
- (int)StringAsPrioritization:(id)a3;
- (int)StringAsRoutingBehavior:(id)a3;
- (int)avoidedModeAtIndex:(unint64_t)a3;
- (int)avoidedModes;
- (int)prioritization;
- (int)routingBehavior;
- (unint64_t)avoidedModesCount;
- (unint64_t)hash;
- (void)_initWithDictionary:(int)a3 isJSON:;
- (void)_readAvoidedModes;
- (void)_readFareOptions;
- (void)addAvoidedMode:(int)a3;
- (void)clearAvoidedModes;
- (void)clearUnknownFields:(BOOL)a3;
- (void)copyTo:(id)a3;
- (void)dealloc;
- (void)mergeFrom:(id)a3;
- (void)readAll:(BOOL)a3;
- (void)setAvoidedModes:(int *)a3 count:(unint64_t)a4;
- (void)setEnableIncidents:(BOOL)a3;
- (void)setFareOptions:(id)a3;
- (void)setHasEnableIncidents:(BOOL)a3;
- (void)setHasPrioritization:(BOOL)a3;
- (void)setHasRoutingBehavior:(BOOL)a3;
- (void)setPrioritization:(int)a3;
- (void)setRoutingBehavior:(int)a3;
- (void)writeTo:(id)a3;
@end

@implementation GEOTransitOptions

- (void)setRoutingBehavior:(int)a3
{
  *(unsigned char *)&self->_flags |= 0x42u;
  self->_routingBehavior = a3;
}

- (void)setPrioritization:(int)a3
{
  *(unsigned char *)&self->_flags |= 0x41u;
  self->_prioritization = a3;
}

- (void)setFareOptions:(id)a3
{
  *(unsigned char *)&self->_flags |= 0x60u;
  objc_storeStrong((id *)&self->_fareOptions, a3);
}

- (void)dealloc
{
  PBRepeatedInt32Clear();
  v3.receiver = self;
  v3.super_class = (Class)GEOTransitOptions;
  [(GEOTransitOptions *)&v3 dealloc];
}

- (GEOTransitOptions)init
{
  v6.receiver = self;
  v6.super_class = (Class)GEOTransitOptions;
  v2 = [(GEOTransitOptions *)&v6 init];
  objc_super v3 = v2;
  if (v2)
  {
    v2->_readerLock._os_unfair_lock_opaque = 0;
    v4 = v2;
  }

  return v3;
}

- (void)writeTo:(id)a3
{
  id v10 = a3;
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  if (self->_reader && (os_unfair_lock_assert_owner(&self->_readerLock), (*(unsigned char *)&self->_flags & 0x70) == 0))
  {
    v8 = self->_reader;
    objc_sync_enter(v8);
    *(void *)((char *)self->_reader + (int)*MEMORY[0x1E4F940E0]) = self->_readerMarkLength;
    [(PBDataReader *)self->_reader seekToOffset:self->_readerMarkPos];
    v9 = [(PBDataReader *)self->_reader readBytes:self->_readerMarkLength - self->_readerMarkPos];
    [v10 writeData:v9];
    os_unfair_lock_unlock(p_readerLock);

    objc_sync_exit(v8);
  }
  else
  {
    os_unfair_lock_unlock(&self->_readerLock);
    [(GEOTransitOptions *)self readAll:0];
    id v5 = v10;
    if (self->_avoidedModes.count)
    {
      unint64_t v6 = 0;
      do
      {
        PBDataWriterWriteInt32Field();
        id v5 = v10;
        ++v6;
      }
      while (v6 < self->_avoidedModes.count);
    }
    if (*(unsigned char *)&self->_flags)
    {
      PBDataWriterWriteInt32Field();
      id v5 = v10;
    }
    if (self->_fareOptions)
    {
      PBDataWriterWriteSubmessage();
      id v5 = v10;
    }
    char flags = (char)self->_flags;
    if ((flags & 2) != 0)
    {
      PBDataWriterWriteInt32Field();
      id v5 = v10;
      char flags = (char)self->_flags;
    }
    if ((flags & 4) != 0)
    {
      PBDataWriterWriteBOOLField();
      id v5 = v10;
    }
    [(PBUnknownFields *)self->_unknownFields writeTo:v5];
  }
}

- (void)readAll:(BOOL)a3
{
  BOOL v3 = a3;
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  reader = self->_reader;
  if (reader)
  {
    v7 = reader;
    objc_sync_enter(v7);
    if (v3) {
      v8 = (int *)&readAll__recursiveTag_8369;
    }
    else {
      v8 = (int *)&readAll__nonRecursiveTag_8370;
    }
    GEOTransitOptionsReadSpecified((uint64_t)self, (unint64_t)self->_reader, v8);
    objc_sync_exit(v7);
  }
  if (v3) {
    [(GEOFareOptions *)self->_fareOptions readAll:1];
  }

  os_unfair_lock_unlock(p_readerLock);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_fareOptions, 0);
  objc_storeStrong((id *)&self->_unknownFields, 0);

  objc_storeStrong((id *)&self->_reader, 0);
}

- (GEOTransitOptions)initWithData:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)GEOTransitOptions;
  BOOL v3 = [(GEOTransitOptions *)&v7 initWithData:a3];
  v4 = v3;
  if (v3)
  {
    v3->_readerLock._os_unfair_lock_opaque = 0;
    id v5 = v3;
  }

  return v4;
}

- (void)_readAvoidedModes
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 64));
    if ((*(unsigned char *)(a1 + 80) & 0x10) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOTransitOptionsReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readAvoidedModes_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 64));
  }
}

- (unint64_t)avoidedModesCount
{
  return self->_avoidedModes.count;
}

- (int)avoidedModes
{
  return self->_avoidedModes.list;
}

- (void)clearAvoidedModes
{
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(unsigned char *)&self->_flags |= 0x10u;
  os_unfair_lock_unlock(p_readerLock);
  *(unsigned char *)&self->_flags |= 0x40u;

  PBRepeatedInt32Clear();
}

- (void)addAvoidedMode:(int)a3
{
  if (self) {
    PBRepeatedInt32Add();
  }
  os_unfair_lock_lock_with_options();
  *(unsigned char *)&self->_flags |= 0x10u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(unsigned char *)&self->_flags |= 0x40u;
}

- (int)avoidedModeAtIndex:(unint64_t)a3
{
  -[GEOTransitOptions _readAvoidedModes]((uint64_t)self);
  p_avoidedModes = &self->_avoidedModes;
  unint64_t count = self->_avoidedModes.count;
  if (count <= a3)
  {
    objc_super v7 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v8 = *MEMORY[0x1E4F1C4A8];
    v9 = objc_msgSend(NSString, "stringWithFormat:", @"idx (%tu) is out of range (%tu)", a3, count);
    id v10 = [v7 exceptionWithName:v8 reason:v9 userInfo:0];
    [v10 raise];
  }
  return p_avoidedModes->list[a3];
}

- (void)setAvoidedModes:(int *)a3 count:(unint64_t)a4
{
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(unsigned char *)&self->_flags |= 0x10u;
  os_unfair_lock_unlock(p_readerLock);
  *(unsigned char *)&self->_flags |= 0x40u;

  MEMORY[0x1F4147390](&self->_avoidedModes, a3, a4);
}

- (id)avoidedModesAsString:(int)a3
{
  if (a3 >= 6)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
    id v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v3 = off_1E53E07D0[a3];
  }

  return v3;
}

- (int)StringAsAvoidedModes:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"AVOID_OTHER"])
  {
    int v4 = 0;
  }
  else if ([v3 isEqualToString:@"AVOID_METRO"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"AVOID_RAIL"])
  {
    int v4 = 2;
  }
  else if ([v3 isEqualToString:@"AVOID_LIGHT_RAIL"])
  {
    int v4 = 3;
  }
  else if ([v3 isEqualToString:@"AVOID_BUS"])
  {
    int v4 = 4;
  }
  else if ([v3 isEqualToString:@"AVOID_FERRY"])
  {
    int v4 = 5;
  }
  else
  {
    int v4 = 0;
  }

  return v4;
}

- (int)prioritization
{
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  char flags = (char)self->_flags;
  os_unfair_lock_unlock(p_readerLock);
  if (flags) {
    return self->_prioritization;
  }
  else {
    return 0;
  }
}

- (void)setHasPrioritization:(BOOL)a3
{
  *(unsigned char *)&self->_char flags = *(unsigned char *)&self->_flags & 0xFE | a3 | 0x40;
}

- (BOOL)hasPrioritization
{
  return *(unsigned char *)&self->_flags & 1;
}

- (id)prioritizationAsString:(int)a3
{
  if (a3 >= 4)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
    id v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v3 = off_1E53E0800[a3];
  }

  return v3;
}

- (int)StringAsPrioritization:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"TRANSIT_PRIORITIZE_DEFAULT"])
  {
    int v4 = 0;
  }
  else if ([v3 isEqualToString:@"TRANSIT_PRIORITIZE_BY_TRAVEL_TIME"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"TRANSIT_PRIORITIZE_BY_TRANSFER_COUNT"])
  {
    int v4 = 2;
  }
  else if ([v3 isEqualToString:@"TRANSIT_PRIORITIZE_BY_WALKING_DISTANCE"])
  {
    int v4 = 3;
  }
  else
  {
    int v4 = 0;
  }

  return v4;
}

- (void)_readFareOptions
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 64));
    if ((*(unsigned char *)(a1 + 80) & 0x20) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOTransitOptionsReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readFareOptions_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 64));
  }
}

- (BOOL)hasFareOptions
{
  return self->_fareOptions != 0;
}

- (GEOFareOptions)fareOptions
{
  -[GEOTransitOptions _readFareOptions]((uint64_t)self);
  fareOptions = self->_fareOptions;

  return fareOptions;
}

- (int)routingBehavior
{
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  char flags = (char)self->_flags;
  os_unfair_lock_unlock(p_readerLock);
  if ((flags & 2) != 0) {
    return self->_routingBehavior;
  }
  else {
    return 0;
  }
}

- (void)setHasRoutingBehavior:(BOOL)a3
{
  if (a3) {
    char v3 = 66;
  }
  else {
    char v3 = 64;
  }
  *(unsigned char *)&self->_char flags = *(unsigned char *)&self->_flags & 0xFD | v3;
}

- (BOOL)hasRoutingBehavior
{
  return (*(unsigned char *)&self->_flags >> 1) & 1;
}

- (id)routingBehaviorAsString:(int)a3
{
  if (a3 >= 3)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
    char v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    char v3 = off_1E53E0820[a3];
  }

  return v3;
}

- (int)StringAsRoutingBehavior:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"STATIC"])
  {
    int v4 = 0;
  }
  else if ([v3 isEqualToString:@"REAL_TIME_DISPLAY"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"REAL_TIME_ROUTING"])
  {
    int v4 = 2;
  }
  else
  {
    int v4 = 0;
  }

  return v4;
}

- (BOOL)enableIncidents
{
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  char flags = (char)self->_flags;
  os_unfair_lock_unlock(p_readerLock);
  return (flags & 4) == 0 || self->_enableIncidents;
}

- (void)setEnableIncidents:(BOOL)a3
{
  *(unsigned char *)&self->_flags |= 0x44u;
  self->_enableIncidents = a3;
}

- (void)setHasEnableIncidents:(BOOL)a3
{
  if (a3) {
    char v3 = 68;
  }
  else {
    char v3 = 64;
  }
  *(unsigned char *)&self->_char flags = *(unsigned char *)&self->_flags & 0xFB | v3;
}

- (BOOL)hasEnableIncidents
{
  return (*(unsigned char *)&self->_flags >> 2) & 1;
}

- (id)description
{
  char v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)GEOTransitOptions;
  int v4 = [(GEOTransitOptions *)&v8 description];
  id v5 = [(GEOTransitOptions *)self dictionaryRepresentation];
  unint64_t v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEOTransitOptions _dictionaryRepresentation:]((uint64_t)self, 0);
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  if (a1)
  {
    [(id)a1 readAll:1];
    int v4 = [MEMORY[0x1E4F1CA60] dictionary];
    if (*(void *)(a1 + 32))
    {
      id v5 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:");
      unint64_t v6 = (void *)(a1 + 24);
      if (*(void *)(a1 + 32))
      {
        unint64_t v7 = 0;
        do
        {
          uint64_t v8 = *(int *)(*v6 + 4 * v7);
          if (v8 >= 6)
          {
            objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", v8);
            v9 = (__CFString *)objc_claimAutoreleasedReturnValue();
          }
          else
          {
            v9 = off_1E53E07D0[v8];
          }
          [v5 addObject:v9];

          ++v7;
          unint64_t v6 = (void *)(a1 + 24);
        }
        while (v7 < *(void *)(a1 + 32));
      }
      if (a2) {
        id v10 = @"avoidedMode";
      }
      else {
        id v10 = @"avoided_mode";
      }
      [v4 setObject:v5 forKey:v10];
    }
    if (*(unsigned char *)(a1 + 80))
    {
      uint64_t v11 = *(int *)(a1 + 68);
      if (v11 >= 4)
      {
        objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(int *)(a1 + 68));
        v12 = (__CFString *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v12 = off_1E53E0800[v11];
      }
      [v4 setObject:v12 forKey:@"prioritization"];
    }
    v13 = [(id)a1 fareOptions];
    v14 = v13;
    if (v13)
    {
      if (a2)
      {
        v15 = [v13 jsonRepresentation];
        v16 = @"fareOptions";
      }
      else
      {
        v15 = [v13 dictionaryRepresentation];
        v16 = @"fare_options";
      }
      [v4 setObject:v15 forKey:v16];
    }
    char v17 = *(unsigned char *)(a1 + 80);
    if ((v17 & 2) != 0)
    {
      uint64_t v18 = *(int *)(a1 + 72);
      if (v18 >= 3)
      {
        objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(int *)(a1 + 72));
        v19 = (__CFString *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v19 = off_1E53E0820[v18];
      }
      if (a2) {
        v20 = @"routingBehavior";
      }
      else {
        v20 = @"routing_behavior";
      }
      [v4 setObject:v19 forKey:v20];

      char v17 = *(unsigned char *)(a1 + 80);
    }
    if ((v17 & 4) != 0)
    {
      v21 = [NSNumber numberWithBool:*(unsigned __int8 *)(a1 + 76)];
      if (a2) {
        v22 = @"enableIncidents";
      }
      else {
        v22 = @"enable_incidents";
      }
      [v4 setObject:v21 forKey:v22];
    }
    v23 = *(void **)(a1 + 16);
    if (v23)
    {
      v24 = [v23 dictionaryRepresentation];
      v25 = v24;
      if (a2)
      {
        v26 = objc_msgSend(MEMORY[0x1E4F1CA60], "dictionaryWithCapacity:", objc_msgSend(v24, "count"));
        v30[0] = MEMORY[0x1E4F143A8];
        v30[1] = 3221225472;
        v30[2] = __47__GEOTransitOptions__dictionaryRepresentation___block_invoke;
        v30[3] = &unk_1E53D8860;
        id v27 = v26;
        id v31 = v27;
        [v25 enumerateKeysAndObjectsUsingBlock:v30];
        id v28 = v27;

        v25 = v28;
      }
      [v4 setObject:v25 forKey:@"Unknown Fields"];
    }
  }
  else
  {
    int v4 = 0;
  }

  return v4;
}

- (id)jsonRepresentation
{
  return -[GEOTransitOptions _dictionaryRepresentation:]((uint64_t)self, 1);
}

void __47__GEOTransitOptions__dictionaryRepresentation___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v10 = a2;
  id v5 = a3;
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();
  unint64_t v7 = *(void **)(a1 + 32);
  if (isKindOfClass)
  {
    uint64_t v8 = [v5 base64EncodedStringWithOptions:0];
    v9 = [v10 description];
    [v7 setObject:v8 forKey:v9];
  }
  else
  {
    uint64_t v8 = [v10 description];
    [v7 setObject:v5 forKey:v8];
  }
}

- (GEOTransitOptions)initWithDictionary:(id)a3
{
  return (GEOTransitOptions *)-[GEOTransitOptions _initWithDictionary:isJSON:](self, a3, 0);
}

- (void)_initWithDictionary:(int)a3 isJSON:
{
  uint64_t v39 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  if (!a1)
  {
    unint64_t v6 = 0;
    goto LABEL_76;
  }
  unint64_t v6 = (void *)[a1 init];
  if (v6)
  {
    if (a3) {
      unint64_t v7 = @"avoidedMode";
    }
    else {
      unint64_t v7 = @"avoided_mode";
    }
    uint64_t v8 = [v5 objectForKeyedSubscript:v7];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v33 = v5;
      long long v36 = 0u;
      long long v37 = 0u;
      long long v34 = 0u;
      long long v35 = 0u;
      v32 = v8;
      id v9 = v8;
      uint64_t v10 = [v9 countByEnumeratingWithState:&v34 objects:v38 count:16];
      if (!v10) {
        goto LABEL_32;
      }
      uint64_t v11 = v10;
      uint64_t v12 = *(void *)v35;
      while (1)
      {
        for (uint64_t i = 0; i != v11; ++i)
        {
          if (*(void *)v35 != v12) {
            objc_enumerationMutation(v9);
          }
          v14 = *(void **)(*((void *)&v34 + 1) + 8 * i);
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            id v15 = v14;
            if ([v15 isEqualToString:@"AVOID_OTHER"])
            {
              uint64_t v16 = 0;
            }
            else if ([v15 isEqualToString:@"AVOID_METRO"])
            {
              uint64_t v16 = 1;
            }
            else if ([v15 isEqualToString:@"AVOID_RAIL"])
            {
              uint64_t v16 = 2;
            }
            else if ([v15 isEqualToString:@"AVOID_LIGHT_RAIL"])
            {
              uint64_t v16 = 3;
            }
            else if ([v15 isEqualToString:@"AVOID_BUS"])
            {
              uint64_t v16 = 4;
            }
            else if ([v15 isEqualToString:@"AVOID_FERRY"])
            {
              uint64_t v16 = 5;
            }
            else
            {
              uint64_t v16 = 0;
            }
          }
          else
          {
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) == 0) {
              continue;
            }
            uint64_t v16 = [v14 intValue];
          }
          [v6 addAvoidedMode:v16];
        }
        uint64_t v11 = [v9 countByEnumeratingWithState:&v34 objects:v38 count:16];
        if (!v11)
        {
LABEL_32:

          id v5 = v33;
          uint64_t v8 = v32;
          break;
        }
      }
    }

    char v17 = [v5 objectForKeyedSubscript:@"prioritization"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v18 = v17;
      if ([v18 isEqualToString:@"TRANSIT_PRIORITIZE_DEFAULT"])
      {
        uint64_t v19 = 0;
      }
      else if ([v18 isEqualToString:@"TRANSIT_PRIORITIZE_BY_TRAVEL_TIME"])
      {
        uint64_t v19 = 1;
      }
      else if ([v18 isEqualToString:@"TRANSIT_PRIORITIZE_BY_TRANSFER_COUNT"])
      {
        uint64_t v19 = 2;
      }
      else if ([v18 isEqualToString:@"TRANSIT_PRIORITIZE_BY_WALKING_DISTANCE"])
      {
        uint64_t v19 = 3;
      }
      else
      {
        uint64_t v19 = 0;
      }
    }
    else
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0) {
        goto LABEL_47;
      }
      uint64_t v19 = [v17 intValue];
    }
    [v6 setPrioritization:v19];
LABEL_47:

    if (a3) {
      v20 = @"fareOptions";
    }
    else {
      v20 = @"fare_options";
    }
    v21 = [v5 objectForKeyedSubscript:v20];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v22 = [GEOFareOptions alloc];
      if (a3) {
        uint64_t v23 = [(GEOFareOptions *)v22 initWithJSON:v21];
      }
      else {
        uint64_t v23 = [(GEOFareOptions *)v22 initWithDictionary:v21];
      }
      v24 = (void *)v23;
      [v6 setFareOptions:v23];
    }
    if (a3) {
      v25 = @"routingBehavior";
    }
    else {
      v25 = @"routing_behavior";
    }
    v26 = [v5 objectForKeyedSubscript:v25];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v27 = v26;
      if ([v27 isEqualToString:@"STATIC"])
      {
        uint64_t v28 = 0;
      }
      else if ([v27 isEqualToString:@"REAL_TIME_DISPLAY"])
      {
        uint64_t v28 = 1;
      }
      else if ([v27 isEqualToString:@"REAL_TIME_ROUTING"])
      {
        uint64_t v28 = 2;
      }
      else
      {
        uint64_t v28 = 0;
      }
    }
    else
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
LABEL_70:

        if (a3) {
          v29 = @"enableIncidents";
        }
        else {
          v29 = @"enable_incidents";
        }
        v30 = [v5 objectForKeyedSubscript:v29];
        objc_opt_class();
        if (objc_opt_isKindOfClass()) {
          objc_msgSend(v6, "setEnableIncidents:", objc_msgSend(v30, "BOOLValue"));
        }

        goto LABEL_76;
      }
      uint64_t v28 = [v26 intValue];
    }
    [v6 setRoutingBehavior:v28];
    goto LABEL_70;
  }
LABEL_76:

  return v6;
}

- (GEOTransitOptions)initWithJSON:(id)a3
{
  return (GEOTransitOptions *)-[GEOTransitOptions _initWithDictionary:isJSON:](self, a3, 1);
}

+ (BOOL)isValid:(id)a3
{
  return GEOTransitOptionsIsValid((char *)a3);
}

- (BOOL)readFrom:(id)a3
{
  return GEOTransitOptionsReadAllFrom((uint64_t)self, a3, 0);
}

- (void)copyTo:(id)a3
{
  id v9 = (id *)a3;
  [(GEOTransitOptions *)self readAll:0];
  os_unfair_lock_lock_with_options();
  objc_storeStrong(v9 + 1, self->_reader);
  *((_DWORD *)v9 + 14) = self->_readerMarkPos;
  *((_DWORD *)v9 + 15) = self->_readerMarkLength;
  os_unfair_lock_unlock(&self->_readerLock);
  if ([(GEOTransitOptions *)self avoidedModesCount])
  {
    [v9 clearAvoidedModes];
    unint64_t v4 = [(GEOTransitOptions *)self avoidedModesCount];
    if (v4)
    {
      unint64_t v5 = v4;
      for (uint64_t i = 0; i != v5; ++i)
        objc_msgSend(v9, "addAvoidedMode:", -[GEOTransitOptions avoidedModeAtIndex:](self, "avoidedModeAtIndex:", i));
    }
  }
  unint64_t v7 = v9;
  if (*(unsigned char *)&self->_flags)
  {
    *((_DWORD *)v9 + 17) = self->_prioritization;
    *((unsigned char *)v9 + 80) |= 1u;
  }
  if (self->_fareOptions)
  {
    objc_msgSend(v9, "setFareOptions:");
    unint64_t v7 = v9;
  }
  char flags = (char)self->_flags;
  if ((flags & 2) != 0)
  {
    *((_DWORD *)v7 + 18) = self->_routingBehavior;
    *((unsigned char *)v7 + 80) |= 2u;
    char flags = (char)self->_flags;
  }
  if ((flags & 4) != 0)
  {
    *((unsigned char *)v7 + 76) = self->_enableIncidents;
    *((unsigned char *)v7 + 80) |= 4u;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
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
      GEOTransitOptionsReadAllFrom(v5, self->_reader, 0);
      os_unfair_lock_unlock(&self->_readerLock);
      id v8 = (id)v5;
      objc_sync_exit(v7);

      goto LABEL_12;
    }
    objc_sync_exit(v7);
  }
  os_unfair_lock_unlock(&self->_readerLock);
  [(GEOTransitOptions *)self readAll:0];
  PBRepeatedInt32Copy();
  if (*(unsigned char *)&self->_flags)
  {
    *(_DWORD *)(v5 + 68) = self->_prioritization;
    *(unsigned char *)(v5 + 80) |= 1u;
  }
  id v9 = [(GEOFareOptions *)self->_fareOptions copyWithZone:a3];
  uint64_t v10 = *(void **)(v5 + 48);
  *(void *)(v5 + 48) = v9;

  char flags = (char)self->_flags;
  if ((flags & 2) != 0)
  {
    *(_DWORD *)(v5 + 72) = self->_routingBehavior;
    *(unsigned char *)(v5 + 80) |= 2u;
    char flags = (char)self->_flags;
  }
  if ((flags & 4) != 0)
  {
    *(unsigned char *)(v5 + 76) = self->_enableIncidents;
    *(unsigned char *)(v5 + 80) |= 4u;
  }
  uint64_t v12 = self->_unknownFields;
  id v8 = *(id *)(v5 + 16);
  *(void *)(v5 + 16) = v12;
LABEL_12:

  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_18;
  }
  [(GEOTransitOptions *)self readAll:1];
  [v4 readAll:1];
  if (!PBRepeatedInt32IsEqual()) {
    goto LABEL_18;
  }
  char flags = (char)self->_flags;
  char v6 = *((unsigned char *)v4 + 80);
  if (flags)
  {
    if ((*((unsigned char *)v4 + 80) & 1) == 0 || self->_prioritization != *((_DWORD *)v4 + 17)) {
      goto LABEL_18;
    }
  }
  else if (*((unsigned char *)v4 + 80))
  {
    goto LABEL_18;
  }
  fareOptions = self->_fareOptions;
  if ((unint64_t)fareOptions | *((void *)v4 + 6))
  {
    if (!-[GEOFareOptions isEqual:](fareOptions, "isEqual:")) {
      goto LABEL_18;
    }
    char flags = (char)self->_flags;
    char v6 = *((unsigned char *)v4 + 80);
  }
  if ((flags & 2) != 0)
  {
    if ((v6 & 2) == 0 || self->_routingBehavior != *((_DWORD *)v4 + 18)) {
      goto LABEL_18;
    }
  }
  else if ((v6 & 2) != 0)
  {
    goto LABEL_18;
  }
  BOOL v8 = (v6 & 4) == 0;
  if ((flags & 4) != 0)
  {
    if ((v6 & 4) != 0)
    {
      if (self->_enableIncidents)
      {
        if (!*((unsigned char *)v4 + 76)) {
          goto LABEL_18;
        }
      }
      else if (*((unsigned char *)v4 + 76))
      {
        goto LABEL_18;
      }
      BOOL v8 = 1;
      goto LABEL_19;
    }
LABEL_18:
    BOOL v8 = 0;
  }
LABEL_19:

  return v8;
}

- (unint64_t)hash
{
  [(GEOTransitOptions *)self readAll:1];
  uint64_t v3 = PBRepeatedInt32Hash();
  if (*(unsigned char *)&self->_flags) {
    uint64_t v4 = 2654435761 * self->_prioritization;
  }
  else {
    uint64_t v4 = 0;
  }
  unint64_t v5 = [(GEOFareOptions *)self->_fareOptions hash];
  if ((*(unsigned char *)&self->_flags & 2) != 0)
  {
    uint64_t v6 = 2654435761 * self->_routingBehavior;
    if ((*(unsigned char *)&self->_flags & 4) != 0) {
      goto LABEL_6;
    }
LABEL_8:
    uint64_t v7 = 0;
    return v4 ^ v3 ^ v6 ^ v7 ^ v5;
  }
  uint64_t v6 = 0;
  if ((*(unsigned char *)&self->_flags & 4) == 0) {
    goto LABEL_8;
  }
LABEL_6:
  uint64_t v7 = 2654435761 * self->_enableIncidents;
  return v4 ^ v3 ^ v6 ^ v7 ^ v5;
}

- (void)mergeFrom:(id)a3
{
  uint64_t v11 = (int *)a3;
  [v11 readAll:0];
  uint64_t v4 = [v11 avoidedModesCount];
  if (v4)
  {
    uint64_t v5 = v4;
    for (uint64_t i = 0; i != v5; ++i)
      -[GEOTransitOptions addAvoidedMode:](self, "addAvoidedMode:", [v11 avoidedModeAtIndex:i]);
  }
  uint64_t v7 = v11;
  if (v11[20])
  {
    self->_prioritization = v11[17];
    *(unsigned char *)&self->_flags |= 1u;
  }
  fareOptions = self->_fareOptions;
  uint64_t v9 = *((void *)v11 + 6);
  if (fareOptions)
  {
    if (!v9) {
      goto LABEL_12;
    }
    -[GEOFareOptions mergeFrom:](fareOptions, "mergeFrom:");
  }
  else
  {
    if (!v9) {
      goto LABEL_12;
    }
    -[GEOTransitOptions setFareOptions:](self, "setFareOptions:");
  }
  uint64_t v7 = v11;
LABEL_12:
  char v10 = *((unsigned char *)v7 + 80);
  if ((v10 & 2) != 0)
  {
    self->_routingBehavior = v7[18];
    *(unsigned char *)&self->_flags |= 2u;
    char v10 = *((unsigned char *)v7 + 80);
  }
  if ((v10 & 4) != 0)
  {
    self->_enableIncidents = *((unsigned char *)v7 + 76);
    *(unsigned char *)&self->_flags |= 4u;
  }
}

- (PBUnknownFields)unknownFields
{
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  if ((*(unsigned char *)&self->_flags & 8) == 0)
  {
    reader = self->_reader;
    if (reader)
    {
      uint64_t v5 = reader;
      objc_sync_enter(v5);
      GEOTransitOptionsReadSpecified((uint64_t)self, (unint64_t)self->_reader, (int *)&unknownFields_tags_8374);
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
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(unsigned char *)&self->_flags |= 0x48u;
  os_unfair_lock_unlock(p_readerLock);
  unknownFields = self->_unknownFields;
  self->_unknownFields = 0;

  if (v3)
  {
    [(GEOTransitOptions *)self readAll:0];
    fareOptions = self->_fareOptions;
    [(GEOFareOptions *)fareOptions clearUnknownFields:1];
  }
}

@end