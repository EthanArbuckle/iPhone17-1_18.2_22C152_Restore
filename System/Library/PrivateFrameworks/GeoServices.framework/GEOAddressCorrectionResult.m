@interface GEOAddressCorrectionResult
+ (BOOL)isValid:(id)a3;
+ (Class)significantLocationType;
- (BOOL)hasAddressID;
- (BOOL)hasGreenTeaWithValue:(BOOL)a3;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (GEOAddressCorrectionResult)init;
- (GEOAddressCorrectionResult)initWithData:(id)a3;
- (GEOAddressCorrectionResult)initWithDictionary:(id)a3;
- (GEOAddressCorrectionResult)initWithJSON:(id)a3;
- (NSMutableArray)significantLocations;
- (NSString)addressID;
- (id)_dictionaryRepresentation:(id *)a1;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)jsonRepresentation;
- (id)significantLocationAtIndex:(unint64_t)a3;
- (unint64_t)hash;
- (unint64_t)significantLocationsCount;
- (void)_addNoFlagsSignificantLocation:(uint64_t)a1;
- (void)_initWithDictionary:(char)a3 isJSON:;
- (void)_readAddressID;
- (void)_readSignificantLocations;
- (void)addSignificantLocation:(id)a3;
- (void)clearSensitiveFields:(unint64_t)a3;
- (void)clearSignificantLocations;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)readAll:(BOOL)a3;
- (void)setAddressID:(id)a3;
- (void)setSignificantLocations:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation GEOAddressCorrectionResult

- (GEOAddressCorrectionResult)init
{
  v6.receiver = self;
  v6.super_class = (Class)GEOAddressCorrectionResult;
  v2 = [(GEOAddressCorrectionResult *)&v6 init];
  v3 = v2;
  if (v2)
  {
    v2->_readerLock._os_unfair_lock_opaque = 0;
    v4 = v2;
  }

  return v3;
}

- (GEOAddressCorrectionResult)initWithData:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)GEOAddressCorrectionResult;
  v3 = [(GEOAddressCorrectionResult *)&v7 initWithData:a3];
  v4 = v3;
  if (v3)
  {
    v3->_readerLock._os_unfair_lock_opaque = 0;
    v5 = v3;
  }

  return v4;
}

- (void)_readAddressID
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
        GEOAddressCorrectionResultReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readAddressID_tags_204);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 40));
  }
}

- (BOOL)hasAddressID
{
  return self->_addressID != 0;
}

- (NSString)addressID
{
  -[GEOAddressCorrectionResult _readAddressID]((uint64_t)self);
  addressID = self->_addressID;

  return addressID;
}

- (void)setAddressID:(id)a3
{
  *(unsigned char *)&self->_flags |= 5u;
  objc_storeStrong((id *)&self->_addressID, a3);
}

- (void)_readSignificantLocations
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
        GEOAddressCorrectionResultReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readSignificantLocations_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 40));
  }
}

- (NSMutableArray)significantLocations
{
  -[GEOAddressCorrectionResult _readSignificantLocations]((uint64_t)self);
  significantLocations = self->_significantLocations;

  return significantLocations;
}

- (void)setSignificantLocations:(id)a3
{
  v4 = (NSMutableArray *)a3;
  os_unfair_lock_lock_with_options();
  *(unsigned char *)&self->_flags |= 2u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(unsigned char *)&self->_flags |= 4u;
  significantLocations = self->_significantLocations;
  self->_significantLocations = v4;
}

- (void)clearSignificantLocations
{
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(unsigned char *)&self->_flags |= 2u;
  os_unfair_lock_unlock(p_readerLock);
  *(unsigned char *)&self->_flags |= 4u;
  significantLocations = self->_significantLocations;

  [(NSMutableArray *)significantLocations removeAllObjects];
}

- (void)addSignificantLocation:(id)a3
{
  id v4 = a3;
  -[GEOAddressCorrectionResult _readSignificantLocations]((uint64_t)self);
  -[GEOAddressCorrectionResult _addNoFlagsSignificantLocation:]((uint64_t)self, v4);

  os_unfair_lock_lock_with_options();
  *(unsigned char *)&self->_flags |= 2u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(unsigned char *)&self->_flags |= 4u;
}

- (void)_addNoFlagsSignificantLocation:(uint64_t)a1
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

- (unint64_t)significantLocationsCount
{
  -[GEOAddressCorrectionResult _readSignificantLocations]((uint64_t)self);
  significantLocations = self->_significantLocations;

  return [(NSMutableArray *)significantLocations count];
}

- (id)significantLocationAtIndex:(unint64_t)a3
{
  -[GEOAddressCorrectionResult _readSignificantLocations]((uint64_t)self);
  significantLocations = self->_significantLocations;

  return (id)[(NSMutableArray *)significantLocations objectAtIndex:a3];
}

+ (Class)significantLocationType
{
  return (Class)objc_opt_class();
}

- (id)description
{
  id v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)GEOAddressCorrectionResult;
  id v4 = [(GEOAddressCorrectionResult *)&v8 description];
  id v5 = [(GEOAddressCorrectionResult *)self dictionaryRepresentation];
  objc_super v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEOAddressCorrectionResult _dictionaryRepresentation:]((id *)&self->super.super.isa, 0);
}

- (id)_dictionaryRepresentation:(id *)a1
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  if (a1)
  {
    [a1 readAll:1];
    id v4 = [MEMORY[0x1E4F1CA60] dictionary];
    id v5 = [a1 addressID];
    if (v5) {
      [v4 setObject:v5 forKey:@"addressID"];
    }

    if ([a1[3] count])
    {
      objc_super v6 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(a1[3], "count"));
      long long v15 = 0u;
      long long v16 = 0u;
      long long v17 = 0u;
      long long v18 = 0u;
      id v7 = a1[3];
      uint64_t v8 = [v7 countByEnumeratingWithState:&v15 objects:v19 count:16];
      if (v8)
      {
        uint64_t v9 = v8;
        uint64_t v10 = *(void *)v16;
        do
        {
          for (uint64_t i = 0; i != v9; ++i)
          {
            if (*(void *)v16 != v10) {
              objc_enumerationMutation(v7);
            }
            v12 = *(void **)(*((void *)&v15 + 1) + 8 * i);
            if (a2) {
              [v12 jsonRepresentation];
            }
            else {
            v13 = objc_msgSend(v12, "dictionaryRepresentation", (void)v15);
            }
            objc_msgSend(v6, "addObject:", v13, (void)v15);
          }
          uint64_t v9 = [v7 countByEnumeratingWithState:&v15 objects:v19 count:16];
        }
        while (v9);
      }

      [v4 setObject:v6 forKey:@"significantLocation"];
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
  return -[GEOAddressCorrectionResult _dictionaryRepresentation:]((id *)&self->super.super.isa, 1);
}

- (GEOAddressCorrectionResult)initWithDictionary:(id)a3
{
  return (GEOAddressCorrectionResult *)-[GEOAddressCorrectionResult _initWithDictionary:isJSON:](self, a3, 0);
}

- (void)_initWithDictionary:(char)a3 isJSON:
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  if (a1)
  {
    a1 = (void *)[a1 init];
    if (a1)
    {
      objc_super v6 = [v5 objectForKeyedSubscript:@"addressID"];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        id v7 = (void *)[v6 copy];
        [a1 setAddressID:v7];
      }
      uint64_t v8 = [v5 objectForKeyedSubscript:@"significantLocation"];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        long long v22 = 0u;
        long long v23 = 0u;
        long long v20 = 0u;
        long long v21 = 0u;
        v19 = v8;
        id v9 = v8;
        uint64_t v10 = [v9 countByEnumeratingWithState:&v20 objects:v24 count:16];
        if (v10)
        {
          uint64_t v11 = v10;
          uint64_t v12 = *(void *)v21;
          do
          {
            for (uint64_t i = 0; i != v11; ++i)
            {
              if (*(void *)v21 != v12) {
                objc_enumerationMutation(v9);
              }
              uint64_t v14 = *(void *)(*((void *)&v20 + 1) + 8 * i);
              objc_opt_class();
              if (objc_opt_isKindOfClass())
              {
                long long v15 = [GEOSignificantLocation alloc];
                if (a3) {
                  uint64_t v16 = [(GEOSignificantLocation *)v15 initWithJSON:v14];
                }
                else {
                  uint64_t v16 = [(GEOSignificantLocation *)v15 initWithDictionary:v14];
                }
                long long v17 = (void *)v16;
                [a1 addSignificantLocation:v16];
              }
            }
            uint64_t v11 = [v9 countByEnumeratingWithState:&v20 objects:v24 count:16];
          }
          while (v11);
        }

        uint64_t v8 = v19;
      }
    }
  }

  return a1;
}

- (GEOAddressCorrectionResult)initWithJSON:(id)a3
{
  return (GEOAddressCorrectionResult *)-[GEOAddressCorrectionResult _initWithDictionary:isJSON:](self, a3, 1);
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
      uint64_t v8 = (int *)&readAll__recursiveTag_209;
    }
    else {
      uint64_t v8 = (int *)&readAll__nonRecursiveTag_210;
    }
    GEOAddressCorrectionResultReadSpecified((uint64_t)self, (unint64_t)self->_reader, v8);
    objc_sync_exit(v7);
  }
  if (v3) {
    _GEOAddressCorrectionResultCallReadAllRecursiveWithoutSynchronized((uint64_t)self);
  }

  os_unfair_lock_unlock(p_readerLock);
}

+ (BOOL)isValid:(id)a3
{
  return GEOAddressCorrectionResultIsValid((char *)a3);
}

- (BOOL)readFrom:(id)a3
{
  return GEOAddressCorrectionResultReadAllFrom((uint64_t)self, a3, 0);
}

- (void)writeTo:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  if (self->_reader && (_GEOAddressCorrectionResultIsDirty((uint64_t)self) & 1) == 0)
  {
    uint64_t v10 = self->_reader;
    objc_sync_enter(v10);
    *(void *)((char *)self->_reader + (int)*MEMORY[0x1E4F940E0]) = self->_readerMarkLength;
    [(PBDataReader *)self->_reader seekToOffset:self->_readerMarkPos];
    uint64_t v11 = [(PBDataReader *)self->_reader readBytes:self->_readerMarkLength - self->_readerMarkPos];
    [v4 writeData:v11];
    os_unfair_lock_unlock(p_readerLock);

    objc_sync_exit(v10);
  }
  else
  {
    os_unfair_lock_unlock(&self->_readerLock);
    [(GEOAddressCorrectionResult *)self readAll:0];
    if (self->_addressID) {
      PBDataWriterWriteStringField();
    }
    long long v14 = 0u;
    long long v15 = 0u;
    long long v12 = 0u;
    long long v13 = 0u;
    objc_super v6 = self->_significantLocations;
    uint64_t v7 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v12 objects:v16 count:16];
    if (v7)
    {
      uint64_t v8 = *(void *)v13;
      do
      {
        for (uint64_t i = 0; i != v7; ++i)
        {
          if (*(void *)v13 != v8) {
            objc_enumerationMutation(v6);
          }
          PBDataWriterWriteSubmessage();
        }
        uint64_t v7 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v12 objects:v16 count:16];
      }
      while (v7);
    }
  }
}

- (void)clearSensitiveFields:(unint64_t)a3
{
}

- (BOOL)hasGreenTeaWithValue:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  -[GEOAddressCorrectionResult _readSignificantLocations]((uint64_t)self);
  long long v14 = 0u;
  long long v15 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v5 = self->_significantLocations;
  uint64_t v6 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v13;
    while (2)
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v13 != v8) {
          objc_enumerationMutation(v5);
        }
        if (objc_msgSend(*(id *)(*((void *)&v12 + 1) + 8 * i), "hasGreenTeaWithValue:", v3, (void)v12))
        {
          BOOL v10 = 1;
          goto LABEL_11;
        }
      }
      uint64_t v7 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
      if (v7) {
        continue;
      }
      break;
    }
  }
  BOOL v10 = 0;
LABEL_11:

  return v10;
}

- (void)copyTo:(id)a3
{
  uint64_t v8 = (id *)a3;
  [(GEOAddressCorrectionResult *)self readAll:0];
  os_unfair_lock_lock_with_options();
  objc_storeStrong(v8 + 1, self->_reader);
  *((_DWORD *)v8 + 8) = self->_readerMarkPos;
  *((_DWORD *)v8 + 9) = self->_readerMarkLength;
  os_unfair_lock_unlock(&self->_readerLock);
  if (self->_addressID) {
    objc_msgSend(v8, "setAddressID:");
  }
  if ([(GEOAddressCorrectionResult *)self significantLocationsCount])
  {
    [v8 clearSignificantLocations];
    unint64_t v4 = [(GEOAddressCorrectionResult *)self significantLocationsCount];
    if (v4)
    {
      unint64_t v5 = v4;
      for (uint64_t i = 0; i != v5; ++i)
      {
        uint64_t v7 = [(GEOAddressCorrectionResult *)self significantLocationAtIndex:i];
        [v8 addSignificantLocation:v7];
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
      GEOAddressCorrectionResultReadAllFrom((uint64_t)v5, self->_reader, 0);
      os_unfair_lock_unlock(&self->_readerLock);
      objc_sync_exit(v7);

      return v5;
    }
    objc_sync_exit(v7);
  }
  os_unfair_lock_unlock(&self->_readerLock);
  [(GEOAddressCorrectionResult *)self readAll:0];
  uint64_t v8 = [(NSString *)self->_addressID copyWithZone:a3];
  id v9 = (void *)v5[2];
  v5[2] = v8;

  long long v18 = 0u;
  long long v19 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  BOOL v10 = self->_significantLocations;
  uint64_t v11 = [(NSMutableArray *)v10 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v11)
  {
    uint64_t v12 = *(void *)v17;
    do
    {
      for (uint64_t i = 0; i != v11; ++i)
      {
        if (*(void *)v17 != v12) {
          objc_enumerationMutation(v10);
        }
        long long v14 = objc_msgSend(*(id *)(*((void *)&v16 + 1) + 8 * i), "copyWithZone:", a3, (void)v16);
        [v5 addSignificantLocation:v14];
      }
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
    && (([(GEOAddressCorrectionResult *)self readAll:1],
         [v4 readAll:1],
         addressID = self->_addressID,
         !((unint64_t)addressID | v4[2]))
     || -[NSString isEqual:](addressID, "isEqual:")))
  {
    significantLocations = self->_significantLocations;
    if ((unint64_t)significantLocations | v4[3]) {
      char v7 = -[NSMutableArray isEqual:](significantLocations, "isEqual:");
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
  [(GEOAddressCorrectionResult *)self readAll:1];
  NSUInteger v3 = [(NSString *)self->_addressID hash];
  return [(NSMutableArray *)self->_significantLocations hash] ^ v3;
}

- (void)mergeFrom:(id)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  unint64_t v4 = (id *)a3;
  [v4 readAll:0];
  if (v4[2]) {
    -[GEOAddressCorrectionResult setAddressID:](self, "setAddressID:");
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
        -[GEOAddressCorrectionResult addSignificantLocation:](self, "addSignificantLocation:", *(void *)(*((void *)&v10 + 1) + 8 * i), (void)v10);
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v7);
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_significantLocations, 0);
  objc_storeStrong((id *)&self->_addressID, 0);

  objc_storeStrong((id *)&self->_reader, 0);
}

@end