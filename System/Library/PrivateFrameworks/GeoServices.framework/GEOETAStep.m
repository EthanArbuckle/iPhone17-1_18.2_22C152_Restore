@interface GEOETAStep
+ (BOOL)isValid:(id)a3;
- (BOOL)hasDistanceCm;
- (BOOL)hasEvInfo;
- (BOOL)hasEvStateInfo;
- (BOOL)hasExpectedTime;
- (BOOL)hasStepID;
- (BOOL)hasTimeCheckpoints;
- (BOOL)hasZilchPathIndex;
- (BOOL)hasZilchPointIndex;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (GEOETAStep)init;
- (GEOETAStep)initWithData:(id)a3;
- (GEOETAStep)initWithDictionary:(id)a3;
- (GEOETAStep)initWithJSON:(id)a3;
- (GEOEVStateInfo)evStateInfo;
- (GEOStopStepEVInfo)evInfo;
- (GEOTimeCheckpoints)timeCheckpoints;
- (PBUnknownFields)unknownFields;
- (id)_dictionaryRepresentation:(uint64_t)a1;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)jsonRepresentation;
- (int)zilchPointIndex;
- (unint64_t)hash;
- (unsigned)distanceCm;
- (unsigned)expectedTime;
- (unsigned)stepID;
- (unsigned)zilchPathIndex;
- (void)_initWithDictionary:(int)a3 isJSON:;
- (void)_readEvInfo;
- (void)_readEvStateInfo;
- (void)_readTimeCheckpoints;
- (void)clearUnknownFields:(BOOL)a3;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)readAll:(BOOL)a3;
- (void)setDistanceCm:(unsigned int)a3;
- (void)setEvInfo:(id)a3;
- (void)setEvStateInfo:(id)a3;
- (void)setExpectedTime:(unsigned int)a3;
- (void)setHasDistanceCm:(BOOL)a3;
- (void)setHasExpectedTime:(BOOL)a3;
- (void)setHasStepID:(BOOL)a3;
- (void)setHasZilchPathIndex:(BOOL)a3;
- (void)setHasZilchPointIndex:(BOOL)a3;
- (void)setStepID:(unsigned int)a3;
- (void)setTimeCheckpoints:(id)a3;
- (void)setZilchPathIndex:(unsigned int)a3;
- (void)setZilchPointIndex:(int)a3;
- (void)writeTo:(id)a3;
@end

@implementation GEOETAStep

- (GEOETAStep)init
{
  v6.receiver = self;
  v6.super_class = (Class)GEOETAStep;
  v2 = [(GEOETAStep *)&v6 init];
  v3 = v2;
  if (v2)
  {
    v2->_readerLock._os_unfair_lock_opaque = 0;
    v4 = v2;
  }

  return v3;
}

- (GEOETAStep)initWithData:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)GEOETAStep;
  v3 = [(GEOETAStep *)&v7 initWithData:a3];
  v4 = v3;
  if (v3)
  {
    v3->_readerLock._os_unfair_lock_opaque = 0;
    v5 = v3;
  }

  return v4;
}

- (unsigned)stepID
{
  return self->_stepID;
}

- (void)setStepID:(unsigned int)a3
{
  *(_WORD *)&self->_flags |= 0x204u;
  self->_stepID = a3;
}

- (void)setHasStepID:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 516;
  }
  else {
    __int16 v3 = 512;
  }
  *(_WORD *)&self->_flags = *(_WORD *)&self->_flags & 0xFFFB | v3;
}

- (BOOL)hasStepID
{
  return (*(_WORD *)&self->_flags >> 2) & 1;
}

- (unsigned)expectedTime
{
  return self->_expectedTime;
}

- (void)setExpectedTime:(unsigned int)a3
{
  *(_WORD *)&self->_flags |= 0x202u;
  self->_expectedTime = a3;
}

- (void)setHasExpectedTime:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 514;
  }
  else {
    __int16 v3 = 512;
  }
  *(_WORD *)&self->_flags = *(_WORD *)&self->_flags & 0xFFFD | v3;
}

- (BOOL)hasExpectedTime
{
  return (*(_WORD *)&self->_flags >> 1) & 1;
}

- (int)zilchPointIndex
{
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  __int16 flags = (__int16)self->_flags;
  os_unfair_lock_unlock(p_readerLock);
  if ((flags & 0x10) != 0) {
    return self->_zilchPointIndex;
  }
  else {
    return -1;
  }
}

- (void)setZilchPointIndex:(int)a3
{
  *(_WORD *)&self->_flags |= 0x210u;
  self->_zilchPointIndex = a3;
}

- (void)setHasZilchPointIndex:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 528;
  }
  else {
    __int16 v3 = 512;
  }
  *(_WORD *)&self->___int16 flags = *(_WORD *)&self->_flags & 0xFFEF | v3;
}

- (BOOL)hasZilchPointIndex
{
  return (*(_WORD *)&self->_flags >> 4) & 1;
}

- (void)_readTimeCheckpoints
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 56));
    if ((*(_WORD *)(a1 + 80) & 0x100) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOETAStepReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readTimeCheckpoints_tags_0);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 56));
  }
}

- (BOOL)hasTimeCheckpoints
{
  return self->_timeCheckpoints != 0;
}

- (GEOTimeCheckpoints)timeCheckpoints
{
  -[GEOETAStep _readTimeCheckpoints]((uint64_t)self);
  timeCheckpoints = self->_timeCheckpoints;

  return timeCheckpoints;
}

- (void)setTimeCheckpoints:(id)a3
{
  *(_WORD *)&self->_flags |= 0x300u;
  objc_storeStrong((id *)&self->_timeCheckpoints, a3);
}

- (unsigned)zilchPathIndex
{
  return self->_zilchPathIndex;
}

- (void)setZilchPathIndex:(unsigned int)a3
{
  *(_WORD *)&self->_flags |= 0x208u;
  self->_zilchPathIndex = a3;
}

- (void)setHasZilchPathIndex:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 520;
  }
  else {
    __int16 v3 = 512;
  }
  *(_WORD *)&self->___int16 flags = *(_WORD *)&self->_flags & 0xFFF7 | v3;
}

- (BOOL)hasZilchPathIndex
{
  return (*(_WORD *)&self->_flags >> 3) & 1;
}

- (void)_readEvInfo
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 56));
    if ((*(_WORD *)(a1 + 80) & 0x40) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOETAStepReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readEvInfo_tags_1);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 56));
  }
}

- (BOOL)hasEvInfo
{
  return self->_evInfo != 0;
}

- (GEOStopStepEVInfo)evInfo
{
  -[GEOETAStep _readEvInfo]((uint64_t)self);
  evInfo = self->_evInfo;

  return evInfo;
}

- (void)setEvInfo:(id)a3
{
  *(_WORD *)&self->_flags |= 0x240u;
  objc_storeStrong((id *)&self->_evInfo, a3);
}

- (void)_readEvStateInfo
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 56));
    if ((*(_WORD *)(a1 + 80) & 0x80) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOETAStepReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readEvStateInfo_tags_0);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 56));
  }
}

- (BOOL)hasEvStateInfo
{
  return self->_evStateInfo != 0;
}

- (GEOEVStateInfo)evStateInfo
{
  -[GEOETAStep _readEvStateInfo]((uint64_t)self);
  evStateInfo = self->_evStateInfo;

  return evStateInfo;
}

- (void)setEvStateInfo:(id)a3
{
  *(_WORD *)&self->_flags |= 0x280u;
  objc_storeStrong((id *)&self->_evStateInfo, a3);
}

- (unsigned)distanceCm
{
  return self->_distanceCm;
}

- (void)setDistanceCm:(unsigned int)a3
{
  *(_WORD *)&self->_flags |= 0x201u;
  self->_distanceCm = a3;
}

- (void)setHasDistanceCm:(BOOL)a3
{
  *(_WORD *)&self->___int16 flags = *(_WORD *)&self->_flags & 0xFFFE | a3 | 0x200;
}

- (BOOL)hasDistanceCm
{
  return *(_WORD *)&self->_flags & 1;
}

- (id)description
{
  id v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)GEOETAStep;
  v4 = [(GEOETAStep *)&v8 description];
  v5 = [(GEOETAStep *)self dictionaryRepresentation];
  objc_super v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEOETAStep _dictionaryRepresentation:]((uint64_t)self, 0);
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  if (!a1)
  {
    v4 = 0;
    goto LABEL_35;
  }
  [(id)a1 readAll:1];
  v4 = [MEMORY[0x1E4F1CA60] dictionary];
  __int16 v5 = *(_WORD *)(a1 + 80);
  if ((v5 & 4) == 0)
  {
    if ((v5 & 2) == 0) {
      goto LABEL_4;
    }
LABEL_10:
    v10 = [NSNumber numberWithUnsignedInt:*(unsigned int *)(a1 + 64)];
    [v4 setObject:v10 forKey:@"expectedTime"];

    if ((*(_WORD *)(a1 + 80) & 0x10) == 0) {
      goto LABEL_6;
    }
    goto LABEL_5;
  }
  v9 = [NSNumber numberWithUnsignedInt:*(unsigned int *)(a1 + 68)];
  [v4 setObject:v9 forKey:@"stepID"];

  __int16 v5 = *(_WORD *)(a1 + 80);
  if ((v5 & 2) != 0) {
    goto LABEL_10;
  }
LABEL_4:
  if ((v5 & 0x10) != 0)
  {
LABEL_5:
    objc_super v6 = [NSNumber numberWithInt:*(unsigned int *)(a1 + 76)];
    [v4 setObject:v6 forKey:@"zilchPointIndex"];
  }
LABEL_6:
  objc_super v7 = [(id)a1 timeCheckpoints];
  objc_super v8 = v7;
  if (v7)
  {
    if (a2) {
      [v7 jsonRepresentation];
    }
    else {
    v11 = [v7 dictionaryRepresentation];
    }
    [v4 setObject:v11 forKey:@"timeCheckpoints"];
  }
  if ((*(_WORD *)(a1 + 80) & 8) != 0)
  {
    v12 = [NSNumber numberWithUnsignedInt:*(unsigned int *)(a1 + 72)];
    [v4 setObject:v12 forKey:@"zilchPathIndex"];
  }
  v13 = [(id)a1 evInfo];
  v14 = v13;
  if (v13)
  {
    if (a2)
    {
      v15 = [v13 jsonRepresentation];
      v16 = @"evInfo";
    }
    else
    {
      v15 = [v13 dictionaryRepresentation];
      v16 = @"ev_info";
    }
    [v4 setObject:v15 forKey:v16];
  }
  v17 = [(id)a1 evStateInfo];
  v18 = v17;
  if (v17)
  {
    if (a2)
    {
      v19 = [v17 jsonRepresentation];
      v20 = @"evStateInfo";
    }
    else
    {
      v19 = [v17 dictionaryRepresentation];
      v20 = @"ev_state_info";
    }
    [v4 setObject:v19 forKey:v20];
  }
  if (*(_WORD *)(a1 + 80))
  {
    v21 = [NSNumber numberWithUnsignedInt:*(unsigned int *)(a1 + 60)];
    if (a2) {
      v22 = @"distanceCm";
    }
    else {
      v22 = @"distance_cm";
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
      v30[2] = __40__GEOETAStep__dictionaryRepresentation___block_invoke;
      v30[3] = &unk_1E53D8860;
      id v27 = v26;
      id v31 = v27;
      [v25 enumerateKeysAndObjectsUsingBlock:v30];
      id v28 = v27;

      v25 = v28;
    }
    [v4 setObject:v25 forKey:@"Unknown Fields"];
  }
LABEL_35:

  return v4;
}

- (id)jsonRepresentation
{
  return -[GEOETAStep _dictionaryRepresentation:]((uint64_t)self, 1);
}

void __40__GEOETAStep__dictionaryRepresentation___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v10 = a2;
  id v5 = a3;
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();
  objc_super v7 = *(void **)(a1 + 32);
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

- (GEOETAStep)initWithDictionary:(id)a3
{
  return (GEOETAStep *)-[GEOETAStep _initWithDictionary:isJSON:](self, a3, 0);
}

- (void)_initWithDictionary:(int)a3 isJSON:
{
  id v5 = a2;
  if (a1)
  {
    a1 = (void *)[a1 init];
    if (a1)
    {
      objc_super v6 = [v5 objectForKeyedSubscript:@"stepID"];
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        objc_msgSend(a1, "setStepID:", objc_msgSend(v6, "unsignedIntValue"));
      }

      objc_super v7 = [v5 objectForKeyedSubscript:@"expectedTime"];
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        objc_msgSend(a1, "setExpectedTime:", objc_msgSend(v7, "unsignedIntValue"));
      }

      objc_super v8 = [v5 objectForKeyedSubscript:@"zilchPointIndex"];
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        objc_msgSend(a1, "setZilchPointIndex:", objc_msgSend(v8, "intValue"));
      }

      v9 = [v5 objectForKeyedSubscript:@"timeCheckpoints"];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        id v10 = [GEOTimeCheckpoints alloc];
        if (a3) {
          uint64_t v11 = [(GEOTimeCheckpoints *)v10 initWithJSON:v9];
        }
        else {
          uint64_t v11 = [(GEOTimeCheckpoints *)v10 initWithDictionary:v9];
        }
        v12 = (void *)v11;
        [a1 setTimeCheckpoints:v11];
      }
      v13 = [v5 objectForKeyedSubscript:@"zilchPathIndex"];
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        objc_msgSend(a1, "setZilchPathIndex:", objc_msgSend(v13, "unsignedIntValue"));
      }

      if (a3) {
        v14 = @"evInfo";
      }
      else {
        v14 = @"ev_info";
      }
      v15 = [v5 objectForKeyedSubscript:v14];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        v16 = [GEOStopStepEVInfo alloc];
        if (a3) {
          uint64_t v17 = [(GEOStopStepEVInfo *)v16 initWithJSON:v15];
        }
        else {
          uint64_t v17 = [(GEOStopStepEVInfo *)v16 initWithDictionary:v15];
        }
        v18 = (void *)v17;
        [a1 setEvInfo:v17];
      }
      if (a3) {
        v19 = @"evStateInfo";
      }
      else {
        v19 = @"ev_state_info";
      }
      v20 = [v5 objectForKeyedSubscript:v19];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        v21 = [GEOEVStateInfo alloc];
        if (a3) {
          uint64_t v22 = [(GEOEVStateInfo *)v21 initWithJSON:v20];
        }
        else {
          uint64_t v22 = [(GEOEVStateInfo *)v21 initWithDictionary:v20];
        }
        v23 = (void *)v22;
        [a1 setEvStateInfo:v22];
      }
      if (a3) {
        v24 = @"distanceCm";
      }
      else {
        v24 = @"distance_cm";
      }
      v25 = [v5 objectForKeyedSubscript:v24];
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        objc_msgSend(a1, "setDistanceCm:", objc_msgSend(v25, "unsignedIntValue"));
      }
    }
  }

  return a1;
}

- (GEOETAStep)initWithJSON:(id)a3
{
  return (GEOETAStep *)-[GEOETAStep _initWithDictionary:isJSON:](self, a3, 1);
}

- (void)readAll:(BOOL)a3
{
  BOOL v3 = a3;
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  reader = self->_reader;
  if (reader)
  {
    objc_super v7 = reader;
    objc_sync_enter(v7);
    if (v3) {
      objc_super v8 = (int *)&readAll__recursiveTag_1307_0;
    }
    else {
      objc_super v8 = (int *)&readAll__nonRecursiveTag_1308_0;
    }
    GEOETAStepReadSpecified((uint64_t)self, (unint64_t)self->_reader, v8);
    objc_sync_exit(v7);
  }
  if (v3)
  {
    [(GEOTimeCheckpoints *)self->_timeCheckpoints readAll:1];
    [(GEOStopStepEVInfo *)self->_evInfo readAll:1];
    [(GEOEVStateInfo *)self->_evStateInfo readAll:1];
  }

  os_unfair_lock_unlock(p_readerLock);
}

+ (BOOL)isValid:(id)a3
{
  return GEOETAStepIsValid((char *)a3);
}

- (BOOL)readFrom:(id)a3
{
  return GEOETAStepReadAllFrom((uint64_t)self, a3, 0);
}

- (void)writeTo:(id)a3
{
  id v9 = a3;
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  if (self->_reader && (_GEOETAStepIsDirty((uint64_t)self) & 1) == 0)
  {
    objc_super v7 = self->_reader;
    objc_sync_enter(v7);
    *(void *)((char *)self->_reader + (int)*MEMORY[0x1E4F940E0]) = self->_readerMarkLength;
    [(PBDataReader *)self->_reader seekToOffset:self->_readerMarkPos];
    objc_super v8 = [(PBDataReader *)self->_reader readBytes:self->_readerMarkLength - self->_readerMarkPos];
    [v9 writeData:v8];
    os_unfair_lock_unlock(p_readerLock);

    objc_sync_exit(v7);
  }
  else
  {
    os_unfair_lock_unlock(&self->_readerLock);
    [(GEOETAStep *)self readAll:0];
    __int16 flags = (__int16)self->_flags;
    if ((flags & 4) != 0)
    {
      PBDataWriterWriteUint32Field();
      __int16 flags = (__int16)self->_flags;
    }
    id v6 = v9;
    if ((flags & 2) != 0)
    {
      PBDataWriterWriteUint32Field();
      id v6 = v9;
      __int16 flags = (__int16)self->_flags;
    }
    if ((flags & 0x10) != 0)
    {
      PBDataWriterWriteInt32Field();
      id v6 = v9;
    }
    if (self->_timeCheckpoints)
    {
      PBDataWriterWriteSubmessage();
      id v6 = v9;
    }
    if ((*(_WORD *)&self->_flags & 8) != 0)
    {
      PBDataWriterWriteUint32Field();
      id v6 = v9;
    }
    if (self->_evInfo)
    {
      PBDataWriterWriteSubmessage();
      id v6 = v9;
    }
    if (self->_evStateInfo)
    {
      PBDataWriterWriteSubmessage();
      id v6 = v9;
    }
    if (*(_WORD *)&self->_flags)
    {
      PBDataWriterWriteUint32Field();
      id v6 = v9;
    }
    [(PBUnknownFields *)self->_unknownFields writeTo:v6];
  }
}

- (void)copyTo:(id)a3
{
  id v6 = (id *)a3;
  [(GEOETAStep *)self readAll:0];
  os_unfair_lock_lock_with_options();
  objc_storeStrong(v6 + 1, self->_reader);
  *((_DWORD *)v6 + 12) = self->_readerMarkPos;
  *((_DWORD *)v6 + 13) = self->_readerMarkLength;
  os_unfair_lock_unlock(&self->_readerLock);
  v4 = v6;
  __int16 flags = (__int16)self->_flags;
  if ((flags & 4) != 0)
  {
    *((_DWORD *)v6 + 17) = self->_stepID;
    *((_WORD *)v6 + 40) |= 4u;
    __int16 flags = (__int16)self->_flags;
    if ((flags & 2) == 0)
    {
LABEL_3:
      if ((flags & 0x10) == 0) {
        goto LABEL_5;
      }
      goto LABEL_4;
    }
  }
  else if ((flags & 2) == 0)
  {
    goto LABEL_3;
  }
  *((_DWORD *)v6 + 16) = self->_expectedTime;
  *((_WORD *)v6 + 40) |= 2u;
  if ((*(_WORD *)&self->_flags & 0x10) != 0)
  {
LABEL_4:
    *((_DWORD *)v6 + 19) = self->_zilchPointIndex;
    *((_WORD *)v6 + 40) |= 0x10u;
  }
LABEL_5:
  if (self->_timeCheckpoints)
  {
    objc_msgSend(v6, "setTimeCheckpoints:");
    v4 = v6;
  }
  if ((*(_WORD *)&self->_flags & 8) != 0)
  {
    *((_DWORD *)v4 + 18) = self->_zilchPathIndex;
    *((_WORD *)v4 + 40) |= 8u;
  }
  if (self->_evInfo)
  {
    objc_msgSend(v6, "setEvInfo:");
    v4 = v6;
  }
  if (self->_evStateInfo)
  {
    objc_msgSend(v6, "setEvStateInfo:");
    v4 = v6;
  }
  if (*(_WORD *)&self->_flags)
  {
    *((_DWORD *)v4 + 15) = self->_distanceCm;
    *((_WORD *)v4 + 40) |= 1u;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  os_unfair_lock_lock(&self->_readerLock);
  reader = self->_reader;
  if (reader)
  {
    objc_super v7 = reader;
    objc_sync_enter(v7);
    if ((*(_WORD *)&self->_flags & 0x200) == 0)
    {
      *(void *)((char *)self->_reader + (int)*MEMORY[0x1E4F940E0]) = self->_readerMarkLength;
      [(PBDataReader *)self->_reader seekToOffset:self->_readerMarkPos];
      GEOETAStepReadAllFrom(v5, self->_reader, 0);
      os_unfair_lock_unlock(&self->_readerLock);
      id v8 = (id)v5;
      objc_sync_exit(v7);

      goto LABEL_14;
    }
    objc_sync_exit(v7);
  }
  os_unfair_lock_unlock(&self->_readerLock);
  [(GEOETAStep *)self readAll:0];
  __int16 flags = (__int16)self->_flags;
  if ((flags & 4) == 0)
  {
    if ((flags & 2) == 0) {
      goto LABEL_7;
    }
LABEL_16:
    *(_DWORD *)(v5 + 64) = self->_expectedTime;
    *(_WORD *)(v5 + 80) |= 2u;
    if ((*(_WORD *)&self->_flags & 0x10) == 0) {
      goto LABEL_9;
    }
    goto LABEL_8;
  }
  *(_DWORD *)(v5 + 68) = self->_stepID;
  *(_WORD *)(v5 + 80) |= 4u;
  __int16 flags = (__int16)self->_flags;
  if ((flags & 2) != 0) {
    goto LABEL_16;
  }
LABEL_7:
  if ((flags & 0x10) != 0)
  {
LABEL_8:
    *(_DWORD *)(v5 + 76) = self->_zilchPointIndex;
    *(_WORD *)(v5 + 80) |= 0x10u;
  }
LABEL_9:
  id v10 = [(GEOTimeCheckpoints *)self->_timeCheckpoints copyWithZone:a3];
  uint64_t v11 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v10;

  if ((*(_WORD *)&self->_flags & 8) != 0)
  {
    *(_DWORD *)(v5 + 72) = self->_zilchPathIndex;
    *(_WORD *)(v5 + 80) |= 8u;
  }
  id v12 = [(GEOStopStepEVInfo *)self->_evInfo copyWithZone:a3];
  v13 = *(void **)(v5 + 24);
  *(void *)(v5 + 24) = v12;

  id v14 = [(GEOEVStateInfo *)self->_evStateInfo copyWithZone:a3];
  v15 = *(void **)(v5 + 32);
  *(void *)(v5 + 32) = v14;

  if (*(_WORD *)&self->_flags)
  {
    *(_DWORD *)(v5 + 60) = self->_distanceCm;
    *(_WORD *)(v5 + 80) |= 1u;
  }
  v16 = self->_unknownFields;
  id v8 = *(id *)(v5 + 16);
  *(void *)(v5 + 16) = v16;
LABEL_14:

  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_33;
  }
  [(GEOETAStep *)self readAll:1];
  [v4 readAll:1];
  __int16 flags = (__int16)self->_flags;
  __int16 v6 = *((_WORD *)v4 + 40);
  if ((flags & 4) != 0)
  {
    if ((v6 & 4) == 0 || self->_stepID != *((_DWORD *)v4 + 17)) {
      goto LABEL_33;
    }
  }
  else if ((v6 & 4) != 0)
  {
    goto LABEL_33;
  }
  if ((flags & 2) != 0)
  {
    if ((v6 & 2) == 0 || self->_expectedTime != *((_DWORD *)v4 + 16)) {
      goto LABEL_33;
    }
  }
  else if ((v6 & 2) != 0)
  {
    goto LABEL_33;
  }
  if ((flags & 0x10) != 0)
  {
    if ((v6 & 0x10) == 0 || self->_zilchPointIndex != *((_DWORD *)v4 + 19)) {
      goto LABEL_33;
    }
  }
  else if ((v6 & 0x10) != 0)
  {
    goto LABEL_33;
  }
  timeCheckpoints = self->_timeCheckpoints;
  if ((unint64_t)timeCheckpoints | *((void *)v4 + 5))
  {
    if (!-[GEOTimeCheckpoints isEqual:](timeCheckpoints, "isEqual:"))
    {
LABEL_33:
      BOOL v11 = 0;
      goto LABEL_34;
    }
    __int16 flags = (__int16)self->_flags;
    __int16 v6 = *((_WORD *)v4 + 40);
  }
  if ((flags & 8) != 0)
  {
    if ((v6 & 8) == 0 || self->_zilchPathIndex != *((_DWORD *)v4 + 18)) {
      goto LABEL_33;
    }
  }
  else if ((v6 & 8) != 0)
  {
    goto LABEL_33;
  }
  evInfo = self->_evInfo;
  if ((unint64_t)evInfo | *((void *)v4 + 3) && !-[GEOStopStepEVInfo isEqual:](evInfo, "isEqual:")) {
    goto LABEL_33;
  }
  evStateInfo = self->_evStateInfo;
  if ((unint64_t)evStateInfo | *((void *)v4 + 4))
  {
    if (!-[GEOEVStateInfo isEqual:](evStateInfo, "isEqual:")) {
      goto LABEL_33;
    }
  }
  __int16 v10 = *((_WORD *)v4 + 40);
  BOOL v11 = (v10 & 1) == 0;
  if (*(_WORD *)&self->_flags)
  {
    if ((v10 & 1) == 0 || self->_distanceCm != *((_DWORD *)v4 + 15)) {
      goto LABEL_33;
    }
    BOOL v11 = 1;
  }
LABEL_34:

  return v11;
}

- (unint64_t)hash
{
  [(GEOETAStep *)self readAll:1];
  __int16 flags = (__int16)self->_flags;
  if ((flags & 4) == 0)
  {
    uint64_t v4 = 0;
    if ((flags & 2) != 0) {
      goto LABEL_3;
    }
LABEL_6:
    uint64_t v5 = 0;
    if ((flags & 0x10) != 0) {
      goto LABEL_4;
    }
    goto LABEL_7;
  }
  uint64_t v4 = 2654435761 * self->_stepID;
  if ((flags & 2) == 0) {
    goto LABEL_6;
  }
LABEL_3:
  uint64_t v5 = 2654435761 * self->_expectedTime;
  if ((flags & 0x10) != 0)
  {
LABEL_4:
    uint64_t v6 = 2654435761 * self->_zilchPointIndex;
    goto LABEL_8;
  }
LABEL_7:
  uint64_t v6 = 0;
LABEL_8:
  unint64_t v7 = [(GEOTimeCheckpoints *)self->_timeCheckpoints hash];
  if ((*(_WORD *)&self->_flags & 8) != 0) {
    uint64_t v8 = 2654435761 * self->_zilchPathIndex;
  }
  else {
    uint64_t v8 = 0;
  }
  unint64_t v9 = [(GEOStopStepEVInfo *)self->_evInfo hash];
  unint64_t v10 = [(GEOEVStateInfo *)self->_evStateInfo hash];
  if (*(_WORD *)&self->_flags) {
    uint64_t v11 = 2654435761 * self->_distanceCm;
  }
  else {
    uint64_t v11 = 0;
  }
  return v5 ^ v4 ^ v6 ^ v8 ^ v7 ^ v9 ^ v10 ^ v11;
}

- (void)mergeFrom:(id)a3
{
  id v12 = a3;
  [v12 readAll:0];
  uint64_t v4 = v12;
  __int16 v5 = *((_WORD *)v12 + 40);
  if ((v5 & 4) != 0)
  {
    self->_stepID = *((_DWORD *)v12 + 17);
    *(_WORD *)&self->_flags |= 4u;
    __int16 v5 = *((_WORD *)v12 + 40);
    if ((v5 & 2) == 0)
    {
LABEL_3:
      if ((v5 & 0x10) == 0) {
        goto LABEL_5;
      }
      goto LABEL_4;
    }
  }
  else if ((v5 & 2) == 0)
  {
    goto LABEL_3;
  }
  self->_expectedTime = *((_DWORD *)v12 + 16);
  *(_WORD *)&self->_flags |= 2u;
  if ((*((_WORD *)v12 + 40) & 0x10) != 0)
  {
LABEL_4:
    self->_zilchPointIndex = *((_DWORD *)v12 + 19);
    *(_WORD *)&self->_flags |= 0x10u;
  }
LABEL_5:
  timeCheckpoints = self->_timeCheckpoints;
  uint64_t v7 = *((void *)v12 + 5);
  if (timeCheckpoints)
  {
    if (!v7) {
      goto LABEL_14;
    }
    -[GEOTimeCheckpoints mergeFrom:](timeCheckpoints, "mergeFrom:");
  }
  else
  {
    if (!v7) {
      goto LABEL_14;
    }
    -[GEOETAStep setTimeCheckpoints:](self, "setTimeCheckpoints:");
  }
  uint64_t v4 = v12;
LABEL_14:
  if ((v4[20] & 8) != 0)
  {
    self->_zilchPathIndex = v4[18];
    *(_WORD *)&self->_flags |= 8u;
  }
  evInfo = self->_evInfo;
  uint64_t v9 = *((void *)v4 + 3);
  if (evInfo)
  {
    if (!v9) {
      goto LABEL_22;
    }
    -[GEOStopStepEVInfo mergeFrom:](evInfo, "mergeFrom:");
  }
  else
  {
    if (!v9) {
      goto LABEL_22;
    }
    -[GEOETAStep setEvInfo:](self, "setEvInfo:");
  }
  uint64_t v4 = v12;
LABEL_22:
  evStateInfo = self->_evStateInfo;
  uint64_t v11 = *((void *)v4 + 4);
  if (evStateInfo)
  {
    if (!v11) {
      goto LABEL_28;
    }
    -[GEOEVStateInfo mergeFrom:](evStateInfo, "mergeFrom:");
  }
  else
  {
    if (!v11) {
      goto LABEL_28;
    }
    -[GEOETAStep setEvStateInfo:](self, "setEvStateInfo:");
  }
  uint64_t v4 = v12;
LABEL_28:
  if (v4[20])
  {
    self->_distanceCm = v4[15];
    *(_WORD *)&self->_flags |= 1u;
  }
}

- (PBUnknownFields)unknownFields
{
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  if ((*(_WORD *)&self->_flags & 0x20) == 0)
  {
    reader = self->_reader;
    if (reader)
    {
      __int16 v5 = reader;
      objc_sync_enter(v5);
      GEOETAStepReadSpecified((uint64_t)self, (unint64_t)self->_reader, (int *)&unknownFields_tags_1312_0);
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
  *(_WORD *)&self->_flags |= 0x220u;
  os_unfair_lock_unlock(p_readerLock);
  unknownFields = self->_unknownFields;
  self->_unknownFields = 0;

  if (v3)
  {
    [(GEOETAStep *)self readAll:0];
    [(GEOTimeCheckpoints *)self->_timeCheckpoints clearUnknownFields:1];
    [(GEOStopStepEVInfo *)self->_evInfo clearUnknownFields:1];
    evStateInfo = self->_evStateInfo;
    [(GEOEVStateInfo *)evStateInfo clearUnknownFields:1];
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_timeCheckpoints, 0);
  objc_storeStrong((id *)&self->_evStateInfo, 0);
  objc_storeStrong((id *)&self->_evInfo, 0);
  objc_storeStrong((id *)&self->_unknownFields, 0);

  objc_storeStrong((id *)&self->_reader, 0);
}

@end