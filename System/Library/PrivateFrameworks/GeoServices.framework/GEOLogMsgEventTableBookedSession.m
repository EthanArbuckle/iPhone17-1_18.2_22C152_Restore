@interface GEOLogMsgEventTableBookedSession
+ (BOOL)isValid:(id)a3;
+ (Class)bookedTableType;
- (BOOL)hasBookedTableSessionId;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (GEOLogMsgEventTableBookedSession)init;
- (GEOLogMsgEventTableBookedSession)initWithData:(id)a3;
- (GEOLogMsgEventTableBookedSession)initWithDictionary:(id)a3;
- (GEOLogMsgEventTableBookedSession)initWithJSON:(id)a3;
- (NSMutableArray)bookedTables;
- (NSString)bookedTableSessionId;
- (id)_dictionaryRepresentation:(id *)a1;
- (id)bookedTableAtIndex:(unint64_t)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)jsonRepresentation;
- (unint64_t)bookedTablesCount;
- (unint64_t)hash;
- (void)_addNoFlagsBookedTable:(uint64_t)a1;
- (void)_initWithDictionary:(int)a3 isJSON:;
- (void)_readBookedTableSessionId;
- (void)_readBookedTables;
- (void)addBookedTable:(id)a3;
- (void)clearBookedTables;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)readAll:(BOOL)a3;
- (void)setBookedTableSessionId:(id)a3;
- (void)setBookedTables:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation GEOLogMsgEventTableBookedSession

- (GEOLogMsgEventTableBookedSession)init
{
  v6.receiver = self;
  v6.super_class = (Class)GEOLogMsgEventTableBookedSession;
  v2 = [(GEOLogMsgEventTableBookedSession *)&v6 init];
  v3 = v2;
  if (v2)
  {
    v2->_readerLock._os_unfair_lock_opaque = 0;
    v4 = v2;
  }

  return v3;
}

- (GEOLogMsgEventTableBookedSession)initWithData:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)GEOLogMsgEventTableBookedSession;
  v3 = [(GEOLogMsgEventTableBookedSession *)&v7 initWithData:a3];
  v4 = v3;
  if (v3)
  {
    v3->_readerLock._os_unfair_lock_opaque = 0;
    v5 = v3;
  }

  return v4;
}

- (void)_readBookedTableSessionId
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
        GEOLogMsgEventTableBookedSessionReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readBookedTableSessionId_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 40));
  }
}

- (BOOL)hasBookedTableSessionId
{
  return self->_bookedTableSessionId != 0;
}

- (NSString)bookedTableSessionId
{
  -[GEOLogMsgEventTableBookedSession _readBookedTableSessionId]((uint64_t)self);
  bookedTableSessionId = self->_bookedTableSessionId;

  return bookedTableSessionId;
}

- (void)setBookedTableSessionId:(id)a3
{
  *(unsigned char *)&self->_flags |= 5u;
  objc_storeStrong((id *)&self->_bookedTableSessionId, a3);
}

- (void)_readBookedTables
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
        GEOLogMsgEventTableBookedSessionReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readBookedTables_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 40));
  }
}

- (NSMutableArray)bookedTables
{
  -[GEOLogMsgEventTableBookedSession _readBookedTables]((uint64_t)self);
  bookedTables = self->_bookedTables;

  return bookedTables;
}

- (void)setBookedTables:(id)a3
{
  v4 = (NSMutableArray *)a3;
  os_unfair_lock_lock_with_options();
  *(unsigned char *)&self->_flags |= 2u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(unsigned char *)&self->_flags |= 4u;
  bookedTables = self->_bookedTables;
  self->_bookedTables = v4;
}

- (void)clearBookedTables
{
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(unsigned char *)&self->_flags |= 2u;
  os_unfair_lock_unlock(p_readerLock);
  *(unsigned char *)&self->_flags |= 4u;
  bookedTables = self->_bookedTables;

  [(NSMutableArray *)bookedTables removeAllObjects];
}

- (void)addBookedTable:(id)a3
{
  id v4 = a3;
  -[GEOLogMsgEventTableBookedSession _readBookedTables]((uint64_t)self);
  -[GEOLogMsgEventTableBookedSession _addNoFlagsBookedTable:]((uint64_t)self, v4);

  os_unfair_lock_lock_with_options();
  *(unsigned char *)&self->_flags |= 2u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(unsigned char *)&self->_flags |= 4u;
}

- (void)_addNoFlagsBookedTable:(uint64_t)a1
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

- (unint64_t)bookedTablesCount
{
  -[GEOLogMsgEventTableBookedSession _readBookedTables]((uint64_t)self);
  bookedTables = self->_bookedTables;

  return [(NSMutableArray *)bookedTables count];
}

- (id)bookedTableAtIndex:(unint64_t)a3
{
  -[GEOLogMsgEventTableBookedSession _readBookedTables]((uint64_t)self);
  bookedTables = self->_bookedTables;

  return (id)[(NSMutableArray *)bookedTables objectAtIndex:a3];
}

+ (Class)bookedTableType
{
  return (Class)objc_opt_class();
}

- (id)description
{
  id v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)GEOLogMsgEventTableBookedSession;
  id v4 = [(GEOLogMsgEventTableBookedSession *)&v8 description];
  id v5 = [(GEOLogMsgEventTableBookedSession *)self dictionaryRepresentation];
  objc_super v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEOLogMsgEventTableBookedSession _dictionaryRepresentation:]((id *)&self->super.super.isa, 0);
}

- (id)_dictionaryRepresentation:(id *)a1
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  if (a1)
  {
    [a1 readAll:1];
    id v4 = [MEMORY[0x1E4F1CA60] dictionary];
    id v5 = [a1 bookedTableSessionId];
    if (v5)
    {
      if (a2) {
        objc_super v6 = @"bookedTableSessionId";
      }
      else {
        objc_super v6 = @"booked_table_session_id";
      }
      [v4 setObject:v5 forKey:v6];
    }

    if ([a1[3] count])
    {
      id v7 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(a1[3], "count"));
      long long v17 = 0u;
      long long v18 = 0u;
      long long v19 = 0u;
      long long v20 = 0u;
      id v8 = a1[3];
      uint64_t v9 = [v8 countByEnumeratingWithState:&v17 objects:v21 count:16];
      if (v9)
      {
        uint64_t v10 = v9;
        uint64_t v11 = *(void *)v18;
        do
        {
          for (uint64_t i = 0; i != v10; ++i)
          {
            if (*(void *)v18 != v11) {
              objc_enumerationMutation(v8);
            }
            v13 = *(void **)(*((void *)&v17 + 1) + 8 * i);
            if (a2) {
              [v13 jsonRepresentation];
            }
            else {
            v14 = objc_msgSend(v13, "dictionaryRepresentation", (void)v17);
            }
            objc_msgSend(v7, "addObject:", v14, (void)v17);
          }
          uint64_t v10 = [v8 countByEnumeratingWithState:&v17 objects:v21 count:16];
        }
        while (v10);
      }

      if (a2) {
        v15 = @"bookedTable";
      }
      else {
        v15 = @"booked_table";
      }
      objc_msgSend(v4, "setObject:forKey:", v7, v15, (void)v17);
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
  return -[GEOLogMsgEventTableBookedSession _dictionaryRepresentation:]((id *)&self->super.super.isa, 1);
}

- (GEOLogMsgEventTableBookedSession)initWithDictionary:(id)a3
{
  return (GEOLogMsgEventTableBookedSession *)-[GEOLogMsgEventTableBookedSession _initWithDictionary:isJSON:](self, a3, 0);
}

- (void)_initWithDictionary:(int)a3 isJSON:
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  if (a1)
  {
    a1 = (void *)[a1 init];
    if (a1)
    {
      if (a3) {
        objc_super v6 = @"bookedTableSessionId";
      }
      else {
        objc_super v6 = @"booked_table_session_id";
      }
      id v7 = [v5 objectForKeyedSubscript:v6];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        id v8 = (void *)[v7 copy];
        [a1 setBookedTableSessionId:v8];
      }
      if (a3) {
        uint64_t v9 = @"bookedTable";
      }
      else {
        uint64_t v9 = @"booked_table";
      }
      uint64_t v10 = [v5 objectForKeyedSubscript:v9];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        long long v24 = 0u;
        long long v25 = 0u;
        long long v22 = 0u;
        long long v23 = 0u;
        v21 = v10;
        id v11 = v10;
        uint64_t v12 = [v11 countByEnumeratingWithState:&v22 objects:v26 count:16];
        if (v12)
        {
          uint64_t v13 = v12;
          uint64_t v14 = *(void *)v23;
          do
          {
            for (uint64_t i = 0; i != v13; ++i)
            {
              if (*(void *)v23 != v14) {
                objc_enumerationMutation(v11);
              }
              uint64_t v16 = *(void *)(*((void *)&v22 + 1) + 8 * i);
              objc_opt_class();
              if (objc_opt_isKindOfClass())
              {
                long long v17 = [GEOBookedTable alloc];
                if (a3) {
                  uint64_t v18 = [(GEOBookedTable *)v17 initWithJSON:v16];
                }
                else {
                  uint64_t v18 = [(GEOBookedTable *)v17 initWithDictionary:v16];
                }
                long long v19 = (void *)v18;
                [a1 addBookedTable:v18];
              }
            }
            uint64_t v13 = [v11 countByEnumeratingWithState:&v22 objects:v26 count:16];
          }
          while (v13);
        }

        uint64_t v10 = v21;
      }
    }
  }

  return a1;
}

- (GEOLogMsgEventTableBookedSession)initWithJSON:(id)a3
{
  return (GEOLogMsgEventTableBookedSession *)-[GEOLogMsgEventTableBookedSession _initWithDictionary:isJSON:](self, a3, 1);
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
      id v8 = (int *)&readAll__recursiveTag_78;
    }
    else {
      id v8 = (int *)&readAll__nonRecursiveTag_78;
    }
    GEOLogMsgEventTableBookedSessionReadSpecified((uint64_t)self, (unint64_t)self->_reader, v8);
    objc_sync_exit(v7);
  }
  if (v3) {
    _GEOLogMsgEventTableBookedSessionCallReadAllRecursiveWithoutSynchronized((uint64_t)self);
  }

  os_unfair_lock_unlock(p_readerLock);
}

+ (BOOL)isValid:(id)a3
{
  return GEOLogMsgEventTableBookedSessionIsValid((char *)a3);
}

- (BOOL)readFrom:(id)a3
{
  return GEOLogMsgEventTableBookedSessionReadAllFrom((uint64_t)self, a3, 0);
}

- (void)writeTo:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  if (self->_reader && (os_unfair_lock_assert_owner(&self->_readerLock), (*(unsigned char *)&self->_flags & 7) == 0))
  {
    uint64_t v10 = self->_reader;
    objc_sync_enter(v10);
    *(void *)((char *)self->_reader + (int)*MEMORY[0x1E4F940E0]) = self->_readerMarkLength;
    [(PBDataReader *)self->_reader seekToOffset:self->_readerMarkPos];
    id v11 = [(PBDataReader *)self->_reader readBytes:self->_readerMarkLength - self->_readerMarkPos];
    [v4 writeData:v11];
    os_unfair_lock_unlock(p_readerLock);

    objc_sync_exit(v10);
  }
  else
  {
    os_unfair_lock_unlock(&self->_readerLock);
    [(GEOLogMsgEventTableBookedSession *)self readAll:0];
    if (self->_bookedTableSessionId) {
      PBDataWriterWriteStringField();
    }
    long long v14 = 0u;
    long long v15 = 0u;
    long long v12 = 0u;
    long long v13 = 0u;
    objc_super v6 = self->_bookedTables;
    uint64_t v7 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v12 objects:v16 count:16];
    if (v7)
    {
      uint64_t v8 = *(void *)v13;
      do
      {
        uint64_t v9 = 0;
        do
        {
          if (*(void *)v13 != v8) {
            objc_enumerationMutation(v6);
          }
          PBDataWriterWriteSubmessage();
          ++v9;
        }
        while (v7 != v9);
        uint64_t v7 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v12 objects:v16 count:16];
      }
      while (v7);
    }
  }
}

- (void)copyTo:(id)a3
{
  uint64_t v8 = (id *)a3;
  [(GEOLogMsgEventTableBookedSession *)self readAll:0];
  os_unfair_lock_lock_with_options();
  objc_storeStrong(v8 + 1, self->_reader);
  *((_DWORD *)v8 + 8) = self->_readerMarkPos;
  *((_DWORD *)v8 + 9) = self->_readerMarkLength;
  os_unfair_lock_unlock(&self->_readerLock);
  if (self->_bookedTableSessionId) {
    objc_msgSend(v8, "setBookedTableSessionId:");
  }
  if ([(GEOLogMsgEventTableBookedSession *)self bookedTablesCount])
  {
    [v8 clearBookedTables];
    unint64_t v4 = [(GEOLogMsgEventTableBookedSession *)self bookedTablesCount];
    if (v4)
    {
      unint64_t v5 = v4;
      for (uint64_t i = 0; i != v5; ++i)
      {
        uint64_t v7 = [(GEOLogMsgEventTableBookedSession *)self bookedTableAtIndex:i];
        [v8 addBookedTable:v7];
      }
    }
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
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
      GEOLogMsgEventTableBookedSessionReadAllFrom((uint64_t)v5, self->_reader, 0);
      os_unfair_lock_unlock(&self->_readerLock);
      objc_sync_exit(v7);

      return v5;
    }
    objc_sync_exit(v7);
  }
  os_unfair_lock_unlock(&self->_readerLock);
  [(GEOLogMsgEventTableBookedSession *)self readAll:0];
  uint64_t v8 = [(NSString *)self->_bookedTableSessionId copyWithZone:a3];
  uint64_t v9 = (void *)v5[2];
  v5[2] = v8;

  long long v18 = 0u;
  long long v19 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  uint64_t v10 = self->_bookedTables;
  uint64_t v11 = [(NSMutableArray *)v10 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v11)
  {
    uint64_t v12 = *(void *)v17;
    do
    {
      uint64_t v13 = 0;
      do
      {
        if (*(void *)v17 != v12) {
          objc_enumerationMutation(v10);
        }
        long long v14 = objc_msgSend(*(id *)(*((void *)&v16 + 1) + 8 * v13), "copyWithZone:", a3, (void)v16);
        [v5 addBookedTable:v14];

        ++v13;
      }
      while (v11 != v13);
      uint64_t v11 = [(NSMutableArray *)v10 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v11);
  }

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  unint64_t v4 = a3;
  if ([v4 isMemberOfClass:objc_opt_class()]
    && (([(GEOLogMsgEventTableBookedSession *)self readAll:1],
         [v4 readAll:1],
         bookedTableSessionId = self->_bookedTableSessionId,
         !((unint64_t)bookedTableSessionId | v4[2]))
     || -[NSString isEqual:](bookedTableSessionId, "isEqual:")))
  {
    bookedTables = self->_bookedTables;
    if ((unint64_t)bookedTables | v4[3]) {
      char v7 = -[NSMutableArray isEqual:](bookedTables, "isEqual:");
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
  [(GEOLogMsgEventTableBookedSession *)self readAll:1];
  NSUInteger v3 = [(NSString *)self->_bookedTableSessionId hash];
  return [(NSMutableArray *)self->_bookedTables hash] ^ v3;
}

- (void)mergeFrom:(id)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  unint64_t v4 = (id *)a3;
  [v4 readAll:0];
  if (v4[2]) {
    -[GEOLogMsgEventTableBookedSession setBookedTableSessionId:](self, "setBookedTableSessionId:");
  }
  long long v12 = 0u;
  long long v13 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  id v5 = v4[3];
  uint64_t v6 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v11;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v11 != v8) {
          objc_enumerationMutation(v5);
        }
        -[GEOLogMsgEventTableBookedSession addBookedTable:](self, "addBookedTable:", *(void *)(*((void *)&v10 + 1) + 8 * i), (void)v10);
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v7);
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_bookedTables, 0);
  objc_storeStrong((id *)&self->_bookedTableSessionId, 0);

  objc_storeStrong((id *)&self->_reader, 0);
}

@end