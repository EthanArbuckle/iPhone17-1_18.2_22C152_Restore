@interface GEOLogMsgStateDetailLookAroundLog
+ (BOOL)isValid:(id)a3;
+ (Class)lookAroundPipRecordsType;
+ (Class)lookAroundViewRecordsType;
- (BOOL)hasDurationSec;
- (BOOL)hasPoisShown;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (GEOLogMsgStateDetailLookAroundLog)init;
- (GEOLogMsgStateDetailLookAroundLog)initWithData:(id)a3;
- (GEOLogMsgStateDetailLookAroundLog)initWithDictionary:(id)a3;
- (GEOLogMsgStateDetailLookAroundLog)initWithJSON:(id)a3;
- (NSMutableArray)lookAroundPipRecords;
- (NSMutableArray)lookAroundViewRecords;
- (double)durationSec;
- (id)_dictionaryRepresentation:(uint64_t)a1;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)jsonRepresentation;
- (id)lookAroundPipRecordsAtIndex:(unint64_t)a3;
- (id)lookAroundViewRecordsAtIndex:(unint64_t)a3;
- (unint64_t)hash;
- (unint64_t)lookAroundPipRecordsCount;
- (unint64_t)lookAroundViewRecordsCount;
- (unsigned)poisShown;
- (void)_addNoFlagsLookAroundPipRecords:(uint64_t)a1;
- (void)_addNoFlagsLookAroundViewRecords:(uint64_t)a1;
- (void)_initWithDictionary:(int)a3 isJSON:;
- (void)_readLookAroundPipRecords;
- (void)_readLookAroundViewRecords;
- (void)addLookAroundPipRecords:(id)a3;
- (void)addLookAroundViewRecords:(id)a3;
- (void)clearLookAroundPipRecords;
- (void)clearLookAroundViewRecords;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)readAll:(BOOL)a3;
- (void)setDurationSec:(double)a3;
- (void)setHasDurationSec:(BOOL)a3;
- (void)setHasPoisShown:(BOOL)a3;
- (void)setLookAroundPipRecords:(id)a3;
- (void)setLookAroundViewRecords:(id)a3;
- (void)setPoisShown:(unsigned int)a3;
- (void)writeTo:(id)a3;
@end

@implementation GEOLogMsgStateDetailLookAroundLog

- (GEOLogMsgStateDetailLookAroundLog)init
{
  v6.receiver = self;
  v6.super_class = (Class)GEOLogMsgStateDetailLookAroundLog;
  v2 = [(GEOLogMsgStateDetailLookAroundLog *)&v6 init];
  v3 = v2;
  if (v2)
  {
    v2->_readerLock._os_unfair_lock_opaque = 0;
    v4 = v2;
  }

  return v3;
}

- (GEOLogMsgStateDetailLookAroundLog)initWithData:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)GEOLogMsgStateDetailLookAroundLog;
  v3 = [(GEOLogMsgStateDetailLookAroundLog *)&v7 initWithData:a3];
  v4 = v3;
  if (v3)
  {
    v3->_readerLock._os_unfair_lock_opaque = 0;
    v5 = v3;
  }

  return v4;
}

- (double)durationSec
{
  return self->_durationSec;
}

- (void)setDurationSec:(double)a3
{
  *(unsigned char *)&self->_flags |= 0x11u;
  self->_durationSec = a3;
}

- (void)setHasDurationSec:(BOOL)a3
{
  *(unsigned char *)&self->_flags = *(unsigned char *)&self->_flags & 0xFE | a3 | 0x10;
}

- (BOOL)hasDurationSec
{
  return *(unsigned char *)&self->_flags & 1;
}

- (unsigned)poisShown
{
  return self->_poisShown;
}

- (void)setPoisShown:(unsigned int)a3
{
  *(unsigned char *)&self->_flags |= 0x12u;
  self->_poisShown = a3;
}

- (void)setHasPoisShown:(BOOL)a3
{
  if (a3) {
    char v3 = 18;
  }
  else {
    char v3 = 16;
  }
  *(unsigned char *)&self->_flags = *(unsigned char *)&self->_flags & 0xFD | v3;
}

- (BOOL)hasPoisShown
{
  return (*(unsigned char *)&self->_flags >> 1) & 1;
}

- (void)_readLookAroundPipRecords
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 48));
    if ((*(unsigned char *)(a1 + 56) & 4) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOLogMsgStateDetailLookAroundLogReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readLookAroundPipRecords_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 48));
  }
}

- (NSMutableArray)lookAroundPipRecords
{
  -[GEOLogMsgStateDetailLookAroundLog _readLookAroundPipRecords]((uint64_t)self);
  lookAroundPipRecords = self->_lookAroundPipRecords;

  return lookAroundPipRecords;
}

- (void)setLookAroundPipRecords:(id)a3
{
  v4 = (NSMutableArray *)a3;
  os_unfair_lock_lock_with_options();
  *(unsigned char *)&self->_flags |= 4u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(unsigned char *)&self->_flags |= 0x10u;
  lookAroundPipRecords = self->_lookAroundPipRecords;
  self->_lookAroundPipRecords = v4;
}

- (void)clearLookAroundPipRecords
{
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(unsigned char *)&self->_flags |= 4u;
  os_unfair_lock_unlock(p_readerLock);
  *(unsigned char *)&self->_flags |= 0x10u;
  lookAroundPipRecords = self->_lookAroundPipRecords;

  [(NSMutableArray *)lookAroundPipRecords removeAllObjects];
}

- (void)addLookAroundPipRecords:(id)a3
{
  id v4 = a3;
  -[GEOLogMsgStateDetailLookAroundLog _readLookAroundPipRecords]((uint64_t)self);
  -[GEOLogMsgStateDetailLookAroundLog _addNoFlagsLookAroundPipRecords:]((uint64_t)self, v4);

  os_unfair_lock_lock_with_options();
  *(unsigned char *)&self->_flags |= 4u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(unsigned char *)&self->_flags |= 0x10u;
}

- (void)_addNoFlagsLookAroundPipRecords:(uint64_t)a1
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

- (unint64_t)lookAroundPipRecordsCount
{
  -[GEOLogMsgStateDetailLookAroundLog _readLookAroundPipRecords]((uint64_t)self);
  lookAroundPipRecords = self->_lookAroundPipRecords;

  return [(NSMutableArray *)lookAroundPipRecords count];
}

- (id)lookAroundPipRecordsAtIndex:(unint64_t)a3
{
  -[GEOLogMsgStateDetailLookAroundLog _readLookAroundPipRecords]((uint64_t)self);
  lookAroundPipRecords = self->_lookAroundPipRecords;

  return (id)[(NSMutableArray *)lookAroundPipRecords objectAtIndex:a3];
}

+ (Class)lookAroundPipRecordsType
{
  return (Class)objc_opt_class();
}

- (void)_readLookAroundViewRecords
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 48));
    if ((*(unsigned char *)(a1 + 56) & 8) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOLogMsgStateDetailLookAroundLogReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readLookAroundViewRecords_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 48));
  }
}

- (NSMutableArray)lookAroundViewRecords
{
  -[GEOLogMsgStateDetailLookAroundLog _readLookAroundViewRecords]((uint64_t)self);
  lookAroundViewRecords = self->_lookAroundViewRecords;

  return lookAroundViewRecords;
}

- (void)setLookAroundViewRecords:(id)a3
{
  id v4 = (NSMutableArray *)a3;
  os_unfair_lock_lock_with_options();
  *(unsigned char *)&self->_flags |= 8u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(unsigned char *)&self->_flags |= 0x10u;
  lookAroundViewRecords = self->_lookAroundViewRecords;
  self->_lookAroundViewRecords = v4;
}

- (void)clearLookAroundViewRecords
{
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(unsigned char *)&self->_flags |= 8u;
  os_unfair_lock_unlock(p_readerLock);
  *(unsigned char *)&self->_flags |= 0x10u;
  lookAroundViewRecords = self->_lookAroundViewRecords;

  [(NSMutableArray *)lookAroundViewRecords removeAllObjects];
}

- (void)addLookAroundViewRecords:(id)a3
{
  id v4 = a3;
  -[GEOLogMsgStateDetailLookAroundLog _readLookAroundViewRecords]((uint64_t)self);
  -[GEOLogMsgStateDetailLookAroundLog _addNoFlagsLookAroundViewRecords:]((uint64_t)self, v4);

  os_unfair_lock_lock_with_options();
  *(unsigned char *)&self->_flags |= 8u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(unsigned char *)&self->_flags |= 0x10u;
}

- (void)_addNoFlagsLookAroundViewRecords:(uint64_t)a1
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

- (unint64_t)lookAroundViewRecordsCount
{
  -[GEOLogMsgStateDetailLookAroundLog _readLookAroundViewRecords]((uint64_t)self);
  lookAroundViewRecords = self->_lookAroundViewRecords;

  return [(NSMutableArray *)lookAroundViewRecords count];
}

- (id)lookAroundViewRecordsAtIndex:(unint64_t)a3
{
  -[GEOLogMsgStateDetailLookAroundLog _readLookAroundViewRecords]((uint64_t)self);
  lookAroundViewRecords = self->_lookAroundViewRecords;

  return (id)[(NSMutableArray *)lookAroundViewRecords objectAtIndex:a3];
}

+ (Class)lookAroundViewRecordsType
{
  return (Class)objc_opt_class();
}

- (id)description
{
  id v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)GEOLogMsgStateDetailLookAroundLog;
  id v4 = [(GEOLogMsgStateDetailLookAroundLog *)&v8 description];
  id v5 = [(GEOLogMsgStateDetailLookAroundLog *)self dictionaryRepresentation];
  objc_super v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEOLogMsgStateDetailLookAroundLog _dictionaryRepresentation:]((uint64_t)self, 0);
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  uint64_t v39 = *MEMORY[0x1E4F143B8];
  if (a1)
  {
    [(id)a1 readAll:1];
    id v4 = [MEMORY[0x1E4F1CA60] dictionary];
    char v5 = *(unsigned char *)(a1 + 56);
    if (v5)
    {
      objc_super v6 = [NSNumber numberWithDouble:*(double *)(a1 + 16)];
      if (a2) {
        id v7 = @"durationSec";
      }
      else {
        id v7 = @"duration_sec";
      }
      [v4 setObject:v6 forKey:v7];

      char v5 = *(unsigned char *)(a1 + 56);
    }
    if ((v5 & 2) != 0)
    {
      objc_super v8 = [NSNumber numberWithUnsignedInt:*(unsigned int *)(a1 + 52)];
      if (a2) {
        v9 = @"poisShown";
      }
      else {
        v9 = @"pois_shown";
      }
      [v4 setObject:v8 forKey:v9];
    }
    if ([*(id *)(a1 + 24) count])
    {
      v10 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(*(id *)(a1 + 24), "count"));
      long long v33 = 0u;
      long long v34 = 0u;
      long long v35 = 0u;
      long long v36 = 0u;
      id v11 = *(id *)(a1 + 24);
      uint64_t v12 = [v11 countByEnumeratingWithState:&v33 objects:v38 count:16];
      if (v12)
      {
        uint64_t v13 = v12;
        uint64_t v14 = *(void *)v34;
        do
        {
          for (uint64_t i = 0; i != v13; ++i)
          {
            if (*(void *)v34 != v14) {
              objc_enumerationMutation(v11);
            }
            v16 = *(void **)(*((void *)&v33 + 1) + 8 * i);
            if (a2) {
              [v16 jsonRepresentation];
            }
            else {
            v17 = [v16 dictionaryRepresentation];
            }
            [v10 addObject:v17];
          }
          uint64_t v13 = [v11 countByEnumeratingWithState:&v33 objects:v38 count:16];
        }
        while (v13);
      }

      if (a2) {
        v18 = @"lookAroundPipRecords";
      }
      else {
        v18 = @"look_around_pip_records";
      }
      [v4 setObject:v10 forKey:v18];
    }
    if ([*(id *)(a1 + 32) count])
    {
      v19 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(*(id *)(a1 + 32), "count"));
      long long v29 = 0u;
      long long v30 = 0u;
      long long v31 = 0u;
      long long v32 = 0u;
      id v20 = *(id *)(a1 + 32);
      uint64_t v21 = [v20 countByEnumeratingWithState:&v29 objects:v37 count:16];
      if (v21)
      {
        uint64_t v22 = v21;
        uint64_t v23 = *(void *)v30;
        do
        {
          for (uint64_t j = 0; j != v22; ++j)
          {
            if (*(void *)v30 != v23) {
              objc_enumerationMutation(v20);
            }
            v25 = *(void **)(*((void *)&v29 + 1) + 8 * j);
            if (a2) {
              [v25 jsonRepresentation];
            }
            else {
            v26 = objc_msgSend(v25, "dictionaryRepresentation", (void)v29);
            }
            objc_msgSend(v19, "addObject:", v26, (void)v29);
          }
          uint64_t v22 = [v20 countByEnumeratingWithState:&v29 objects:v37 count:16];
        }
        while (v22);
      }

      if (a2) {
        v27 = @"lookAroundViewRecords";
      }
      else {
        v27 = @"look_around_view_records";
      }
      objc_msgSend(v4, "setObject:forKey:", v19, v27, (void)v29);
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
  return -[GEOLogMsgStateDetailLookAroundLog _dictionaryRepresentation:]((uint64_t)self, 1);
}

- (GEOLogMsgStateDetailLookAroundLog)initWithDictionary:(id)a3
{
  return (GEOLogMsgStateDetailLookAroundLog *)-[GEOLogMsgStateDetailLookAroundLog _initWithDictionary:isJSON:](self, a3, 0);
}

- (void)_initWithDictionary:(int)a3 isJSON:
{
  uint64_t v44 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  if (a1)
  {
    a1 = (void *)[a1 init];
    if (a1)
    {
      if (a3) {
        objc_super v6 = @"durationSec";
      }
      else {
        objc_super v6 = @"duration_sec";
      }
      id v7 = [v5 objectForKeyedSubscript:v6];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        [v7 doubleValue];
        objc_msgSend(a1, "setDurationSec:");
      }

      if (a3) {
        objc_super v8 = @"poisShown";
      }
      else {
        objc_super v8 = @"pois_shown";
      }
      v9 = [v5 objectForKeyedSubscript:v8];
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        objc_msgSend(a1, "setPoisShown:", objc_msgSend(v9, "unsignedIntValue"));
      }

      if (a3) {
        v10 = @"lookAroundPipRecords";
      }
      else {
        v10 = @"look_around_pip_records";
      }
      id v11 = [v5 objectForKeyedSubscript:v10];
      objc_opt_class();
      id v33 = v5;
      if (objc_opt_isKindOfClass())
      {
        long long v40 = 0u;
        long long v41 = 0u;
        long long v38 = 0u;
        long long v39 = 0u;
        id v12 = v11;
        uint64_t v13 = [v12 countByEnumeratingWithState:&v38 objects:v43 count:16];
        if (v13)
        {
          uint64_t v14 = v13;
          uint64_t v15 = *(void *)v39;
          do
          {
            for (uint64_t i = 0; i != v14; ++i)
            {
              if (*(void *)v39 != v15) {
                objc_enumerationMutation(v12);
              }
              uint64_t v17 = *(void *)(*((void *)&v38 + 1) + 8 * i);
              objc_opt_class();
              if (objc_opt_isKindOfClass())
              {
                v18 = [GEOLogMsgStateDetailLookAroundLogRecord alloc];
                if (a3) {
                  uint64_t v19 = [(GEOLogMsgStateDetailLookAroundLogRecord *)v18 initWithJSON:v17];
                }
                else {
                  uint64_t v19 = [(GEOLogMsgStateDetailLookAroundLogRecord *)v18 initWithDictionary:v17];
                }
                id v20 = (void *)v19;
                [a1 addLookAroundPipRecords:v19];
              }
            }
            uint64_t v14 = [v12 countByEnumeratingWithState:&v38 objects:v43 count:16];
          }
          while (v14);
        }

        id v5 = v33;
      }

      if (a3) {
        uint64_t v21 = @"lookAroundViewRecords";
      }
      else {
        uint64_t v21 = @"look_around_view_records";
      }
      uint64_t v22 = [v5 objectForKeyedSubscript:v21];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        long long v36 = 0u;
        long long v37 = 0u;
        long long v34 = 0u;
        long long v35 = 0u;
        id v23 = v22;
        uint64_t v24 = [v23 countByEnumeratingWithState:&v34 objects:v42 count:16];
        if (v24)
        {
          uint64_t v25 = v24;
          uint64_t v26 = *(void *)v35;
          do
          {
            for (uint64_t j = 0; j != v25; ++j)
            {
              if (*(void *)v35 != v26) {
                objc_enumerationMutation(v23);
              }
              uint64_t v28 = *(void *)(*((void *)&v34 + 1) + 8 * j);
              objc_opt_class();
              if (objc_opt_isKindOfClass())
              {
                long long v29 = [GEOLogMsgStateDetailLookAroundLogRecord alloc];
                if (a3) {
                  uint64_t v30 = [(GEOLogMsgStateDetailLookAroundLogRecord *)v29 initWithJSON:v28];
                }
                else {
                  uint64_t v30 = [(GEOLogMsgStateDetailLookAroundLogRecord *)v29 initWithDictionary:v28];
                }
                long long v31 = (void *)v30;
                [a1 addLookAroundViewRecords:v30];
              }
            }
            uint64_t v25 = [v23 countByEnumeratingWithState:&v34 objects:v42 count:16];
          }
          while (v25);
        }

        id v5 = v33;
      }
    }
  }

  return a1;
}

- (GEOLogMsgStateDetailLookAroundLog)initWithJSON:(id)a3
{
  return (GEOLogMsgStateDetailLookAroundLog *)-[GEOLogMsgStateDetailLookAroundLog _initWithDictionary:isJSON:](self, a3, 1);
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
      objc_super v8 = (int *)&readAll__recursiveTag_6834;
    }
    else {
      objc_super v8 = (int *)&readAll__nonRecursiveTag_6835;
    }
    GEOLogMsgStateDetailLookAroundLogReadSpecified((uint64_t)self, (unint64_t)self->_reader, v8);
    objc_sync_exit(v7);
  }
  if (v3) {
    _GEOLogMsgStateDetailLookAroundLogCallReadAllRecursiveWithoutSynchronized((uint64_t)self);
  }

  os_unfair_lock_unlock(p_readerLock);
}

+ (BOOL)isValid:(id)a3
{
  return GEOLogMsgStateDetailLookAroundLogIsValid((char *)a3);
}

- (BOOL)readFrom:(id)a3
{
  return GEOLogMsgStateDetailLookAroundLogReadAllFrom((uint64_t)self, a3, 0);
}

- (void)writeTo:(id)a3
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  if (self->_reader && (os_unfair_lock_assert_owner(&self->_readerLock), (*(unsigned char *)&self->_flags & 0x1C) == 0))
  {
    uint64_t v15 = self->_reader;
    objc_sync_enter(v15);
    *(void *)((char *)self->_reader + (int)*MEMORY[0x1E4F940E0]) = self->_readerMarkLength;
    [(PBDataReader *)self->_reader seekToOffset:self->_readerMarkPos];
    v16 = [(PBDataReader *)self->_reader readBytes:self->_readerMarkLength - self->_readerMarkPos];
    [v4 writeData:v16];
    os_unfair_lock_unlock(p_readerLock);

    objc_sync_exit(v15);
  }
  else
  {
    os_unfair_lock_unlock(&self->_readerLock);
    [(GEOLogMsgStateDetailLookAroundLog *)self readAll:0];
    char flags = (char)self->_flags;
    if (flags)
    {
      PBDataWriterWriteDoubleField();
      char flags = (char)self->_flags;
    }
    if ((flags & 2) != 0) {
      PBDataWriterWriteUint32Field();
    }
    long long v23 = 0u;
    long long v24 = 0u;
    long long v21 = 0u;
    long long v22 = 0u;
    id v7 = self->_lookAroundPipRecords;
    uint64_t v8 = [(NSMutableArray *)v7 countByEnumeratingWithState:&v21 objects:v26 count:16];
    if (v8)
    {
      uint64_t v9 = *(void *)v22;
      do
      {
        for (uint64_t i = 0; i != v8; ++i)
        {
          if (*(void *)v22 != v9) {
            objc_enumerationMutation(v7);
          }
          PBDataWriterWriteSubmessage();
        }
        uint64_t v8 = [(NSMutableArray *)v7 countByEnumeratingWithState:&v21 objects:v26 count:16];
      }
      while (v8);
    }

    long long v19 = 0u;
    long long v20 = 0u;
    long long v17 = 0u;
    long long v18 = 0u;
    id v11 = self->_lookAroundViewRecords;
    uint64_t v12 = [(NSMutableArray *)v11 countByEnumeratingWithState:&v17 objects:v25 count:16];
    if (v12)
    {
      uint64_t v13 = *(void *)v18;
      do
      {
        for (uint64_t j = 0; j != v12; ++j)
        {
          if (*(void *)v18 != v13) {
            objc_enumerationMutation(v11);
          }
          PBDataWriterWriteSubmessage();
        }
        uint64_t v12 = [(NSMutableArray *)v11 countByEnumeratingWithState:&v17 objects:v25 count:16];
      }
      while (v12);
    }
  }
}

- (void)copyTo:(id)a3
{
  uint64_t v13 = (id *)a3;
  [(GEOLogMsgStateDetailLookAroundLog *)self readAll:0];
  os_unfair_lock_lock_with_options();
  objc_storeStrong(v13 + 1, self->_reader);
  *((_DWORD *)v13 + 10) = self->_readerMarkPos;
  *((_DWORD *)v13 + 11) = self->_readerMarkLength;
  os_unfair_lock_unlock(&self->_readerLock);
  char flags = (char)self->_flags;
  if (flags)
  {
    v13[2] = *(id *)&self->_durationSec;
    *((unsigned char *)v13 + 56) |= 1u;
    char flags = (char)self->_flags;
  }
  if ((flags & 2) != 0)
  {
    *((_DWORD *)v13 + 13) = self->_poisShown;
    *((unsigned char *)v13 + 56) |= 2u;
  }
  if ([(GEOLogMsgStateDetailLookAroundLog *)self lookAroundPipRecordsCount])
  {
    [v13 clearLookAroundPipRecords];
    unint64_t v5 = [(GEOLogMsgStateDetailLookAroundLog *)self lookAroundPipRecordsCount];
    if (v5)
    {
      unint64_t v6 = v5;
      for (uint64_t i = 0; i != v6; ++i)
      {
        uint64_t v8 = [(GEOLogMsgStateDetailLookAroundLog *)self lookAroundPipRecordsAtIndex:i];
        [v13 addLookAroundPipRecords:v8];
      }
    }
  }
  if ([(GEOLogMsgStateDetailLookAroundLog *)self lookAroundViewRecordsCount])
  {
    [v13 clearLookAroundViewRecords];
    unint64_t v9 = [(GEOLogMsgStateDetailLookAroundLog *)self lookAroundViewRecordsCount];
    if (v9)
    {
      unint64_t v10 = v9;
      for (uint64_t j = 0; j != v10; ++j)
      {
        uint64_t v12 = [(GEOLogMsgStateDetailLookAroundLog *)self lookAroundViewRecordsAtIndex:j];
        [v13 addLookAroundViewRecords:v12];
      }
    }
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  os_unfair_lock_lock(&self->_readerLock);
  reader = self->_reader;
  if (reader)
  {
    id v7 = reader;
    objc_sync_enter(v7);
    if ((*(unsigned char *)&self->_flags & 0x10) == 0)
    {
      *(void *)((char *)self->_reader + (int)*MEMORY[0x1E4F940E0]) = self->_readerMarkLength;
      [(PBDataReader *)self->_reader seekToOffset:self->_readerMarkPos];
      GEOLogMsgStateDetailLookAroundLogReadAllFrom(v5, self->_reader, 0);
      os_unfair_lock_unlock(&self->_readerLock);
      uint64_t v8 = (NSMutableArray *)(id)v5;
      objc_sync_exit(v7);

      goto LABEL_23;
    }
    objc_sync_exit(v7);
  }
  os_unfair_lock_unlock(&self->_readerLock);
  [(GEOLogMsgStateDetailLookAroundLog *)self readAll:0];
  char flags = (char)self->_flags;
  if (flags)
  {
    *(double *)(v5 + 16) = self->_durationSec;
    *(unsigned char *)(v5 + 56) |= 1u;
    char flags = (char)self->_flags;
  }
  if ((flags & 2) != 0)
  {
    *(_DWORD *)(v5 + 52) = self->_poisShown;
    *(unsigned char *)(v5 + 56) |= 2u;
  }
  long long v26 = 0u;
  long long v27 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  unint64_t v10 = self->_lookAroundPipRecords;
  uint64_t v11 = [(NSMutableArray *)v10 countByEnumeratingWithState:&v24 objects:v29 count:16];
  if (v11)
  {
    uint64_t v12 = *(void *)v25;
    do
    {
      for (uint64_t i = 0; i != v11; ++i)
      {
        if (*(void *)v25 != v12) {
          objc_enumerationMutation(v10);
        }
        uint64_t v14 = (void *)[*(id *)(*((void *)&v24 + 1) + 8 * i) copyWithZone:a3];
        [(id)v5 addLookAroundPipRecords:v14];
      }
      uint64_t v11 = [(NSMutableArray *)v10 countByEnumeratingWithState:&v24 objects:v29 count:16];
    }
    while (v11);
  }

  long long v22 = 0u;
  long long v23 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  uint64_t v8 = self->_lookAroundViewRecords;
  uint64_t v15 = [(NSMutableArray *)v8 countByEnumeratingWithState:&v20 objects:v28 count:16];
  if (v15)
  {
    uint64_t v16 = *(void *)v21;
    do
    {
      for (uint64_t j = 0; j != v15; ++j)
      {
        if (*(void *)v21 != v16) {
          objc_enumerationMutation(v8);
        }
        long long v18 = objc_msgSend(*(id *)(*((void *)&v20 + 1) + 8 * j), "copyWithZone:", a3, (void)v20);
        [(id)v5 addLookAroundViewRecords:v18];
      }
      uint64_t v15 = [(NSMutableArray *)v8 countByEnumeratingWithState:&v20 objects:v28 count:16];
    }
    while (v15);
  }
LABEL_23:

  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_16;
  }
  [(GEOLogMsgStateDetailLookAroundLog *)self readAll:1];
  [v4 readAll:1];
  if (*(unsigned char *)&self->_flags)
  {
    if ((*((unsigned char *)v4 + 56) & 1) == 0 || self->_durationSec != *((double *)v4 + 2)) {
      goto LABEL_16;
    }
  }
  else if (*((unsigned char *)v4 + 56))
  {
LABEL_16:
    char v7 = 0;
    goto LABEL_17;
  }
  if ((*(unsigned char *)&self->_flags & 2) != 0)
  {
    if ((*((unsigned char *)v4 + 56) & 2) == 0 || self->_poisShown != *((_DWORD *)v4 + 13)) {
      goto LABEL_16;
    }
  }
  else if ((*((unsigned char *)v4 + 56) & 2) != 0)
  {
    goto LABEL_16;
  }
  lookAroundPipRecords = self->_lookAroundPipRecords;
  if ((unint64_t)lookAroundPipRecords | *((void *)v4 + 3)
    && !-[NSMutableArray isEqual:](lookAroundPipRecords, "isEqual:"))
  {
    goto LABEL_16;
  }
  lookAroundViewRecords = self->_lookAroundViewRecords;
  if ((unint64_t)lookAroundViewRecords | *((void *)v4 + 4)) {
    char v7 = -[NSMutableArray isEqual:](lookAroundViewRecords, "isEqual:");
  }
  else {
    char v7 = 1;
  }
LABEL_17:

  return v7;
}

- (unint64_t)hash
{
  [(GEOLogMsgStateDetailLookAroundLog *)self readAll:1];
  char flags = (char)self->_flags;
  if (flags)
  {
    double durationSec = self->_durationSec;
    double v6 = -durationSec;
    if (durationSec >= 0.0) {
      double v6 = self->_durationSec;
    }
    long double v7 = floor(v6 + 0.5);
    double v8 = (v6 - v7) * 1.84467441e19;
    unint64_t v4 = 2654435761u * (unint64_t)fmod(v7, 1.84467441e19);
    if (v8 >= 0.0)
    {
      if (v8 > 0.0) {
        v4 += (unint64_t)v8;
      }
    }
    else
    {
      v4 -= (unint64_t)fabs(v8);
    }
  }
  else
  {
    unint64_t v4 = 0;
  }
  if ((flags & 2) != 0) {
    uint64_t v9 = 2654435761 * self->_poisShown;
  }
  else {
    uint64_t v9 = 0;
  }
  uint64_t v10 = v9 ^ v4 ^ [(NSMutableArray *)self->_lookAroundPipRecords hash];
  return v10 ^ [(NSMutableArray *)self->_lookAroundViewRecords hash];
}

- (void)mergeFrom:(id)a3
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  [v4 readAll:0];
  char v5 = *((unsigned char *)v4 + 56);
  if (v5)
  {
    self->_double durationSec = *((double *)v4 + 2);
    *(unsigned char *)&self->_flags |= 1u;
    char v5 = *((unsigned char *)v4 + 56);
  }
  if ((v5 & 2) != 0)
  {
    self->_poisShown = *((_DWORD *)v4 + 13);
    *(unsigned char *)&self->_flags |= 2u;
  }
  long long v22 = 0u;
  long long v23 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  id v6 = *((id *)v4 + 3);
  uint64_t v7 = [v6 countByEnumeratingWithState:&v20 objects:v25 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v21;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v21 != v9) {
          objc_enumerationMutation(v6);
        }
        [(GEOLogMsgStateDetailLookAroundLog *)self addLookAroundPipRecords:*(void *)(*((void *)&v20 + 1) + 8 * i)];
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v20 objects:v25 count:16];
    }
    while (v8);
  }

  long long v18 = 0u;
  long long v19 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v11 = *((id *)v4 + 4);
  uint64_t v12 = [v11 countByEnumeratingWithState:&v16 objects:v24 count:16];
  if (v12)
  {
    uint64_t v13 = v12;
    uint64_t v14 = *(void *)v17;
    do
    {
      for (uint64_t j = 0; j != v13; ++j)
      {
        if (*(void *)v17 != v14) {
          objc_enumerationMutation(v11);
        }
        -[GEOLogMsgStateDetailLookAroundLog addLookAroundViewRecords:](self, "addLookAroundViewRecords:", *(void *)(*((void *)&v16 + 1) + 8 * j), (void)v16);
      }
      uint64_t v13 = [v11 countByEnumeratingWithState:&v16 objects:v24 count:16];
    }
    while (v13);
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lookAroundViewRecords, 0);
  objc_storeStrong((id *)&self->_lookAroundPipRecords, 0);

  objc_storeStrong((id *)&self->_reader, 0);
}

@end