@interface GEOTimeCheckpoints
+ (BOOL)isValid:(id)a3;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (GEOTimeCheckpoints)init;
- (GEOTimeCheckpoints)initWithData:(id)a3;
- (GEOTimeCheckpoints)initWithDictionary:(id)a3;
- (GEOTimeCheckpoints)initWithJSON:(id)a3;
- (PBUnknownFields)unknownFields;
- (id)_dictionaryRepresentation:(void *)a1;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)jsonRepresentation;
- (unint64_t)distToNextCheckpointsCount;
- (unint64_t)hash;
- (unint64_t)timeToNextCheckpointsCount;
- (unsigned)distToNextCheckpointAtIndex:(unint64_t)a3;
- (unsigned)distToNextCheckpoints;
- (unsigned)timeToNextCheckpointAtIndex:(unint64_t)a3;
- (unsigned)timeToNextCheckpoints;
- (void)_initWithDictionary:(void *)a1 isJSON:(void *)a2;
- (void)_readDistToNextCheckpoints;
- (void)_readTimeToNextCheckpoints;
- (void)addDistToNextCheckpoint:(unsigned int)a3;
- (void)addTimeToNextCheckpoint:(unsigned int)a3;
- (void)clearDistToNextCheckpoints;
- (void)clearTimeToNextCheckpoints;
- (void)clearUnknownFields:(BOOL)a3;
- (void)copyTo:(id)a3;
- (void)dealloc;
- (void)mergeFrom:(id)a3;
- (void)readAll:(BOOL)a3;
- (void)setDistToNextCheckpoints:(unsigned int *)a3 count:(unint64_t)a4;
- (void)setTimeToNextCheckpoints:(unsigned int *)a3 count:(unint64_t)a4;
- (void)writeTo:(id)a3;
@end

@implementation GEOTimeCheckpoints

- (GEOTimeCheckpoints)init
{
  v6.receiver = self;
  v6.super_class = (Class)GEOTimeCheckpoints;
  v2 = [(GEOTimeCheckpoints *)&v6 init];
  v3 = v2;
  if (v2)
  {
    v2->_readerLock._os_unfair_lock_opaque = 0;
    v4 = v2;
  }

  return v3;
}

- (GEOTimeCheckpoints)initWithData:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)GEOTimeCheckpoints;
  v3 = [(GEOTimeCheckpoints *)&v7 initWithData:a3];
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
  PBRepeatedUInt32Clear();
  PBRepeatedUInt32Clear();
  v3.receiver = self;
  v3.super_class = (Class)GEOTimeCheckpoints;
  [(GEOTimeCheckpoints *)&v3 dealloc];
}

- (void)_readDistToNextCheckpoints
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 80));
    if ((*(unsigned char *)(a1 + 84) & 2) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOTimeCheckpointsReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readDistToNextCheckpoints_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 80));
  }
}

- (unint64_t)distToNextCheckpointsCount
{
  return self->_distToNextCheckpoints.count;
}

- (unsigned)distToNextCheckpoints
{
  return self->_distToNextCheckpoints.list;
}

- (void)clearDistToNextCheckpoints
{
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(unsigned char *)&self->_flags |= 2u;
  os_unfair_lock_unlock(p_readerLock);
  *(unsigned char *)&self->_flags |= 8u;

  PBRepeatedUInt32Clear();
}

- (void)addDistToNextCheckpoint:(unsigned int)a3
{
  if (self) {
    PBRepeatedUInt32Add();
  }
  os_unfair_lock_lock_with_options();
  *(unsigned char *)&self->_flags |= 2u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(unsigned char *)&self->_flags |= 8u;
}

- (unsigned)distToNextCheckpointAtIndex:(unint64_t)a3
{
  -[GEOTimeCheckpoints _readDistToNextCheckpoints]((uint64_t)self);
  p_distToNextCheckpoints = &self->_distToNextCheckpoints;
  unint64_t count = self->_distToNextCheckpoints.count;
  if (count <= a3)
  {
    objc_super v7 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v8 = *MEMORY[0x1E4F1C4A8];
    v9 = objc_msgSend(NSString, "stringWithFormat:", @"idx (%tu) is out of range (%tu)", a3, count);
    v10 = [v7 exceptionWithName:v8 reason:v9 userInfo:0];
    [v10 raise];
  }
  return p_distToNextCheckpoints->list[a3];
}

- (void)setDistToNextCheckpoints:(unsigned int *)a3 count:(unint64_t)a4
{
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(unsigned char *)&self->_flags |= 2u;
  os_unfair_lock_unlock(p_readerLock);
  *(unsigned char *)&self->_flags |= 8u;

  MEMORY[0x1F4147400](&self->_distToNextCheckpoints, a3, a4);
}

- (void)_readTimeToNextCheckpoints
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 80));
    if ((*(unsigned char *)(a1 + 84) & 4) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOTimeCheckpointsReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readTimeToNextCheckpoints_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 80));
  }
}

- (unint64_t)timeToNextCheckpointsCount
{
  return self->_timeToNextCheckpoints.count;
}

- (unsigned)timeToNextCheckpoints
{
  return self->_timeToNextCheckpoints.list;
}

- (void)clearTimeToNextCheckpoints
{
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(unsigned char *)&self->_flags |= 4u;
  os_unfair_lock_unlock(p_readerLock);
  *(unsigned char *)&self->_flags |= 8u;

  PBRepeatedUInt32Clear();
}

- (void)addTimeToNextCheckpoint:(unsigned int)a3
{
  if (self) {
    PBRepeatedUInt32Add();
  }
  os_unfair_lock_lock_with_options();
  *(unsigned char *)&self->_flags |= 4u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(unsigned char *)&self->_flags |= 8u;
}

- (unsigned)timeToNextCheckpointAtIndex:(unint64_t)a3
{
  -[GEOTimeCheckpoints _readTimeToNextCheckpoints]((uint64_t)self);
  p_timeToNextCheckpoints = &self->_timeToNextCheckpoints;
  unint64_t count = self->_timeToNextCheckpoints.count;
  if (count <= a3)
  {
    objc_super v7 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v8 = *MEMORY[0x1E4F1C4A8];
    v9 = objc_msgSend(NSString, "stringWithFormat:", @"idx (%tu) is out of range (%tu)", a3, count);
    v10 = [v7 exceptionWithName:v8 reason:v9 userInfo:0];
    [v10 raise];
  }
  return p_timeToNextCheckpoints->list[a3];
}

- (void)setTimeToNextCheckpoints:(unsigned int *)a3 count:(unint64_t)a4
{
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(unsigned char *)&self->_flags |= 4u;
  os_unfair_lock_unlock(p_readerLock);
  *(unsigned char *)&self->_flags |= 8u;

  MEMORY[0x1F4147400](&self->_timeToNextCheckpoints, a3, a4);
}

- (id)description
{
  id v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)GEOTimeCheckpoints;
  v4 = [(GEOTimeCheckpoints *)&v8 description];
  v5 = [(GEOTimeCheckpoints *)self dictionaryRepresentation];
  objc_super v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEOTimeCheckpoints _dictionaryRepresentation:](self, 0);
}

- (id)_dictionaryRepresentation:(void *)a1
{
  if (a1)
  {
    [a1 readAll:1];
    v4 = [MEMORY[0x1E4F1CA60] dictionary];
    if (a1[4])
    {
      v5 = PBRepeatedUInt32NSArray();
      [v4 setObject:v5 forKey:@"distToNextCheckpoint"];
    }
    if (a1[7])
    {
      objc_super v6 = PBRepeatedUInt32NSArray();
      [v4 setObject:v6 forKey:@"timeToNextCheckpoint"];
    }
    objc_super v7 = (void *)a1[2];
    if (v7)
    {
      objc_super v8 = [v7 dictionaryRepresentation];
      v9 = v8;
      if (a2)
      {
        v10 = objc_msgSend(MEMORY[0x1E4F1CA60], "dictionaryWithCapacity:", objc_msgSend(v8, "count"));
        v14[0] = MEMORY[0x1E4F143A8];
        v14[1] = 3221225472;
        v14[2] = __48__GEOTimeCheckpoints__dictionaryRepresentation___block_invoke;
        v14[3] = &unk_1E53D8860;
        id v11 = v10;
        id v15 = v11;
        [v9 enumerateKeysAndObjectsUsingBlock:v14];
        id v12 = v11;

        v9 = v12;
      }
      [v4 setObject:v9 forKey:@"Unknown Fields"];
    }
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (id)jsonRepresentation
{
  return -[GEOTimeCheckpoints _dictionaryRepresentation:](self, 1);
}

void __48__GEOTimeCheckpoints__dictionaryRepresentation___block_invoke(uint64_t a1, void *a2, void *a3)
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

- (GEOTimeCheckpoints)initWithDictionary:(id)a3
{
  return (GEOTimeCheckpoints *)-[GEOTimeCheckpoints _initWithDictionary:isJSON:](self, a3);
}

- (void)_initWithDictionary:(void *)a1 isJSON:(void *)a2
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if (a1)
  {
    a1 = (void *)[a1 init];
    if (a1)
    {
      v4 = [v3 objectForKeyedSubscript:@"distToNextCheckpoint"];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        long long v25 = 0u;
        long long v26 = 0u;
        long long v23 = 0u;
        long long v24 = 0u;
        id v5 = v4;
        uint64_t v6 = [v5 countByEnumeratingWithState:&v23 objects:v28 count:16];
        if (v6)
        {
          uint64_t v7 = v6;
          uint64_t v8 = *(void *)v24;
          do
          {
            uint64_t v9 = 0;
            do
            {
              if (*(void *)v24 != v8) {
                objc_enumerationMutation(v5);
              }
              id v10 = *(void **)(*((void *)&v23 + 1) + 8 * v9);
              objc_opt_class();
              if (objc_opt_isKindOfClass()) {
                objc_msgSend(a1, "addDistToNextCheckpoint:", objc_msgSend(v10, "unsignedIntValue"));
              }
              ++v9;
            }
            while (v7 != v9);
            uint64_t v7 = [v5 countByEnumeratingWithState:&v23 objects:v28 count:16];
          }
          while (v7);
        }
      }
      id v11 = [v3 objectForKeyedSubscript:@"timeToNextCheckpoint"];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        long long v21 = 0u;
        long long v22 = 0u;
        long long v19 = 0u;
        long long v20 = 0u;
        id v12 = v11;
        uint64_t v13 = [v12 countByEnumeratingWithState:&v19 objects:v27 count:16];
        if (v13)
        {
          uint64_t v14 = v13;
          uint64_t v15 = *(void *)v20;
          do
          {
            uint64_t v16 = 0;
            do
            {
              if (*(void *)v20 != v15) {
                objc_enumerationMutation(v12);
              }
              v17 = *(void **)(*((void *)&v19 + 1) + 8 * v16);
              objc_opt_class();
              if (objc_opt_isKindOfClass()) {
                objc_msgSend(a1, "addTimeToNextCheckpoint:", objc_msgSend(v17, "unsignedIntValue", (void)v19));
              }
              ++v16;
            }
            while (v14 != v16);
            uint64_t v14 = [v12 countByEnumeratingWithState:&v19 objects:v27 count:16];
          }
          while (v14);
        }
      }
    }
  }

  return a1;
}

- (GEOTimeCheckpoints)initWithJSON:(id)a3
{
  return (GEOTimeCheckpoints *)-[GEOTimeCheckpoints _initWithDictionary:isJSON:](self, a3);
}

- (void)readAll:(BOOL)a3
{
  BOOL v3 = a3;
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  reader = self->_reader;
  if (reader)
  {
    uint64_t v7 = reader;
    objc_sync_enter(v7);
    if (v3) {
      uint64_t v8 = (int *)&readAll__recursiveTag_7518;
    }
    else {
      uint64_t v8 = (int *)&readAll__nonRecursiveTag_7519;
    }
    GEOTimeCheckpointsReadSpecified((uint64_t)self, (unint64_t)self->_reader, v8);
    objc_sync_exit(v7);
  }

  os_unfair_lock_unlock(p_readerLock);
}

+ (BOOL)isValid:(id)a3
{
  return GEOTimeCheckpointsIsValid((char *)a3);
}

- (BOOL)readFrom:(id)a3
{
  return GEOTimeCheckpointsReadAllFrom((uint64_t)self, a3, 0);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  if (self->_reader && (os_unfair_lock_assert_owner(&self->_readerLock), (*(unsigned char *)&self->_flags & 0xE) == 0))
  {
    uint64_t v8 = self->_reader;
    objc_sync_enter(v8);
    *(void *)((char *)self->_reader + (int)*MEMORY[0x1E4F940E0]) = self->_readerMarkLength;
    [(PBDataReader *)self->_reader seekToOffset:self->_readerMarkPos];
    uint64_t v9 = [(PBDataReader *)self->_reader readBytes:self->_readerMarkLength - self->_readerMarkPos];
    [v4 writeData:v9];
    os_unfair_lock_unlock(p_readerLock);

    objc_sync_exit(v8);
  }
  else
  {
    os_unfair_lock_unlock(&self->_readerLock);
    [(GEOTimeCheckpoints *)self readAll:0];
    if (self->_distToNextCheckpoints.count)
    {
      PBDataWriterPlaceMark();
      if (self->_distToNextCheckpoints.count)
      {
        unint64_t v6 = 0;
        do
        {
          PBDataWriterWriteUint32Field();
          ++v6;
        }
        while (v6 < self->_distToNextCheckpoints.count);
      }
      PBDataWriterRecallMark();
    }
    if (self->_timeToNextCheckpoints.count)
    {
      PBDataWriterPlaceMark();
      if (self->_timeToNextCheckpoints.count)
      {
        unint64_t v7 = 0;
        do
        {
          PBDataWriterWriteUint32Field();
          ++v7;
        }
        while (v7 < self->_timeToNextCheckpoints.count);
      }
      PBDataWriterRecallMark();
    }
    [(PBUnknownFields *)self->_unknownFields writeTo:v4];
  }
}

- (void)copyTo:(id)a3
{
  id v10 = (id *)a3;
  [(GEOTimeCheckpoints *)self readAll:0];
  os_unfair_lock_lock_with_options();
  objc_storeStrong(v10 + 1, self->_reader);
  *((_DWORD *)v10 + 18) = self->_readerMarkPos;
  *((_DWORD *)v10 + 19) = self->_readerMarkLength;
  os_unfair_lock_unlock(&self->_readerLock);
  if ([(GEOTimeCheckpoints *)self distToNextCheckpointsCount])
  {
    [v10 clearDistToNextCheckpoints];
    unint64_t v4 = [(GEOTimeCheckpoints *)self distToNextCheckpointsCount];
    if (v4)
    {
      unint64_t v5 = v4;
      for (uint64_t i = 0; i != v5; ++i)
        objc_msgSend(v10, "addDistToNextCheckpoint:", -[GEOTimeCheckpoints distToNextCheckpointAtIndex:](self, "distToNextCheckpointAtIndex:", i));
    }
  }
  if ([(GEOTimeCheckpoints *)self timeToNextCheckpointsCount])
  {
    [v10 clearTimeToNextCheckpoints];
    unint64_t v7 = [(GEOTimeCheckpoints *)self timeToNextCheckpointsCount];
    if (v7)
    {
      unint64_t v8 = v7;
      for (uint64_t j = 0; j != v8; ++j)
        objc_msgSend(v10, "addTimeToNextCheckpoint:", -[GEOTimeCheckpoints timeToNextCheckpointAtIndex:](self, "timeToNextCheckpointAtIndex:", j));
    }
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  unint64_t v4 = (id *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  os_unfair_lock_lock(&self->_readerLock);
  reader = self->_reader;
  if (!reader) {
    goto LABEL_5;
  }
  unint64_t v6 = reader;
  objc_sync_enter(v6);
  if ((*(unsigned char *)&self->_flags & 8) != 0)
  {
    objc_sync_exit(v6);

LABEL_5:
    os_unfair_lock_unlock(&self->_readerLock);
    [(GEOTimeCheckpoints *)self readAll:0];
    PBRepeatedUInt32Copy();
    PBRepeatedUInt32Copy();
    objc_storeStrong(v4 + 2, self->_unknownFields);
    return v4;
  }
  *(void *)((char *)self->_reader + (int)*MEMORY[0x1E4F940E0]) = self->_readerMarkLength;
  [(PBDataReader *)self->_reader seekToOffset:self->_readerMarkPos];
  GEOTimeCheckpointsReadAllFrom((uint64_t)v4, self->_reader, 0);
  os_unfair_lock_unlock(&self->_readerLock);
  objc_sync_exit(v6);

  return v4;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if ([v4 isMemberOfClass:objc_opt_class()]
    && ([(GEOTimeCheckpoints *)self readAll:1],
        [v4 readAll:1],
        PBRepeatedUInt32IsEqual()))
  {
    char IsEqual = PBRepeatedUInt32IsEqual();
  }
  else
  {
    char IsEqual = 0;
  }

  return IsEqual;
}

- (unint64_t)hash
{
  [(GEOTimeCheckpoints *)self readAll:1];
  uint64_t v2 = PBRepeatedUInt32Hash();
  return PBRepeatedUInt32Hash() ^ v2;
}

- (void)mergeFrom:(id)a3
{
  id v10 = a3;
  [v10 readAll:0];
  uint64_t v4 = [v10 distToNextCheckpointsCount];
  if (v4)
  {
    uint64_t v5 = v4;
    for (uint64_t i = 0; i != v5; ++i)
      -[GEOTimeCheckpoints addDistToNextCheckpoint:](self, "addDistToNextCheckpoint:", [v10 distToNextCheckpointAtIndex:i]);
  }
  uint64_t v7 = [v10 timeToNextCheckpointsCount];
  if (v7)
  {
    uint64_t v8 = v7;
    for (uint64_t j = 0; j != v8; ++j)
      -[GEOTimeCheckpoints addTimeToNextCheckpoint:](self, "addTimeToNextCheckpoint:", [v10 timeToNextCheckpointAtIndex:j]);
  }
}

- (PBUnknownFields)unknownFields
{
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  if ((*(unsigned char *)&self->_flags & 1) == 0)
  {
    reader = self->_reader;
    if (reader)
    {
      uint64_t v5 = reader;
      objc_sync_enter(v5);
      GEOTimeCheckpointsReadSpecified((uint64_t)self, (unint64_t)self->_reader, (int *)&unknownFields_tags_7523);
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
  *(unsigned char *)&self->_flags |= 9u;
  os_unfair_lock_unlock(p_readerLock);
  unknownFields = self->_unknownFields;
  self->_unknownFields = 0;

  if (v3)
  {
    [(GEOTimeCheckpoints *)self readAll:0];
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_unknownFields, 0);

  objc_storeStrong((id *)&self->_reader, 0);
}

@end