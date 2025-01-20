@interface GEOPDTransitConnection
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (GEOPDTransitConnection)init;
- (GEOPDTransitConnection)initWithData:(id)a3;
- (id)_dictionaryRepresentation:(uint64_t)a1;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)entityNameString;
- (id)jsonRepresentation;
- (id)mapsId;
- (id)transitLabels;
- (unint64_t)hash;
- (void)_addNoFlagsTransitLabel:(uint64_t)a1;
- (void)_readEntityNameString;
- (void)_readMapsId;
- (void)_readTransitLabels;
- (void)addTransitLabel:(uint64_t)a1;
- (void)readAll:(uint64_t)a1;
- (void)writeTo:(id)a3;
@end

@implementation GEOPDTransitConnection

- (GEOPDTransitConnection)init
{
  v6.receiver = self;
  v6.super_class = (Class)GEOPDTransitConnection;
  v2 = [(GEOPDTransitConnection *)&v6 init];
  v3 = v2;
  if (v2)
  {
    v2->_readerLock._os_unfair_lock_opaque = 0;
    v4 = v2;
  }

  return v3;
}

- (GEOPDTransitConnection)initWithData:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)GEOPDTransitConnection;
  v3 = [(GEOPDTransitConnection *)&v7 initWithData:a3];
  v4 = v3;
  if (v3)
  {
    v3->_readerLock._os_unfair_lock_opaque = 0;
    v5 = v3;
  }

  return v4;
}

- (void)_readTransitLabels
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 64));
    if ((*(unsigned char *)(a1 + 68) & 0x10) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOPDTransitConnectionReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readTransitLabels_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 64));
  }
}

- (id)transitLabels
{
  if (a1)
  {
    v2 = a1;
    -[GEOPDTransitConnection _readTransitLabels]((uint64_t)a1);
    a1 = (id *)v2[6];
    uint64_t v1 = vars8;
  }
  return a1;
}

- (void)addTransitLabel:(uint64_t)a1
{
  if (a1)
  {
    id v3 = a2;
    -[GEOPDTransitConnection _readTransitLabels](a1);
    -[GEOPDTransitConnection _addNoFlagsTransitLabel:](a1, v3);

    os_unfair_lock_lock_with_options();
    *(unsigned char *)(a1 + 68) |= 0x10u;
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 64));
    *(unsigned char *)(a1 + 68) |= 0x20u;
  }
}

- (void)_addNoFlagsTransitLabel:(uint64_t)a1
{
  id v3 = a2;
  if (a1)
  {
    v4 = *(void **)(a1 + 48);
    id v7 = v3;
    if (!v4)
    {
      id v5 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
      objc_super v6 = *(void **)(a1 + 48);
      *(void *)(a1 + 48) = v5;

      v4 = *(void **)(a1 + 48);
    }
    [v4 addObject:v7];
    id v3 = v7;
  }
}

- (void)_readEntityNameString
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 64));
    if ((*(unsigned char *)(a1 + 68) & 4) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOPDTransitConnectionReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readEntityNameString_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 64));
  }
}

- (id)entityNameString
{
  if (a1)
  {
    v2 = a1;
    -[GEOPDTransitConnection _readEntityNameString]((uint64_t)a1);
    a1 = (id *)v2[3];
    uint64_t v1 = vars8;
  }
  return a1;
}

- (void)_readMapsId
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 64));
    if ((*(unsigned char *)(a1 + 68) & 8) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOPDTransitConnectionReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readMapsId_tags_9205);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 64));
  }
}

- (id)mapsId
{
  if (a1)
  {
    v2 = a1;
    -[GEOPDTransitConnection _readMapsId]((uint64_t)a1);
    a1 = (id *)v2[4];
    uint64_t v1 = vars8;
  }
  return a1;
}

- (id)description
{
  id v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)GEOPDTransitConnection;
  v4 = [(GEOPDTransitConnection *)&v8 description];
  id v5 = [(GEOPDTransitConnection *)self dictionaryRepresentation];
  objc_super v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEOPDTransitConnection _dictionaryRepresentation:]((uint64_t)self, 0);
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  if (a1)
  {
    -[GEOPDTransitConnection readAll:](a1, 1);
    v4 = [MEMORY[0x1E4F1CA60] dictionary];
    if (*(unsigned char *)(a1 + 68))
    {
      id v5 = [NSNumber numberWithUnsignedLongLong:*(void *)(a1 + 40)];
      [v4 setObject:v5 forKey:@"muid"];
    }
    if ([*(id *)(a1 + 48) count])
    {
      objc_super v6 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(*(id *)(a1 + 48), "count"));
      long long v30 = 0u;
      long long v31 = 0u;
      long long v32 = 0u;
      long long v33 = 0u;
      id v7 = *(id *)(a1 + 48);
      uint64_t v8 = [v7 countByEnumeratingWithState:&v30 objects:v34 count:16];
      if (v8)
      {
        uint64_t v9 = v8;
        uint64_t v10 = *(void *)v31;
        do
        {
          for (uint64_t i = 0; i != v9; ++i)
          {
            if (*(void *)v31 != v10) {
              objc_enumerationMutation(v7);
            }
            v12 = *(void **)(*((void *)&v30 + 1) + 8 * i);
            if (a2) {
              [v12 jsonRepresentation];
            }
            else {
            v13 = [v12 dictionaryRepresentation];
            }
            [v6 addObject:v13];
          }
          uint64_t v9 = [v7 countByEnumeratingWithState:&v30 objects:v34 count:16];
        }
        while (v9);
      }

      if (a2) {
        v14 = @"transitLabel";
      }
      else {
        v14 = @"transit_label";
      }
      [v4 setObject:v6 forKey:v14];
    }
    v15 = -[GEOPDTransitConnection entityNameString]((id *)a1);
    if (v15)
    {
      if (a2) {
        v16 = @"entityNameString";
      }
      else {
        v16 = @"entity_name_string";
      }
      [v4 setObject:v15 forKey:v16];
    }

    v17 = -[GEOPDTransitConnection mapsId]((id *)a1);
    v18 = v17;
    if (v17)
    {
      if (a2)
      {
        v19 = [v17 jsonRepresentation];
        v20 = @"mapsId";
      }
      else
      {
        v19 = [v17 dictionaryRepresentation];
        v20 = @"maps_id";
      }
      [v4 setObject:v19 forKey:v20];
    }
    v21 = *(void **)(a1 + 16);
    if (v21)
    {
      v22 = [v21 dictionaryRepresentation];
      v23 = v22;
      if (a2)
      {
        v24 = objc_msgSend(MEMORY[0x1E4F1CA60], "dictionaryWithCapacity:", objc_msgSend(v22, "count"));
        v28[0] = MEMORY[0x1E4F143A8];
        v28[1] = 3221225472;
        v28[2] = __52__GEOPDTransitConnection__dictionaryRepresentation___block_invoke;
        v28[3] = &unk_1E53D8860;
        id v25 = v24;
        id v29 = v25;
        [v23 enumerateKeysAndObjectsUsingBlock:v28];
        id v26 = v25;

        v23 = v26;
      }
      [v4 setObject:v23 forKey:@"Unknown Fields"];
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
  return -[GEOPDTransitConnection _dictionaryRepresentation:]((uint64_t)self, 1);
}

- (void)readAll:(uint64_t)a1
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 64));
    v4 = *(void **)(a1 + 8);
    if (v4)
    {
      id v5 = v4;
      objc_sync_enter(v5);
      if (a2) {
        objc_super v6 = (int *)&readAll__recursiveTag_9218;
      }
      else {
        objc_super v6 = (int *)&readAll__nonRecursiveTag_9219;
      }
      GEOPDTransitConnectionReadSpecified(a1, *(void *)(a1 + 8), v6);
      objc_sync_exit(v5);
    }
    if (a2) {
      _GEOPDTransitConnectionCallReadAllRecursiveWithoutSynchronized(a1);
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 64));
  }
}

void __52__GEOPDTransitConnection__dictionaryRepresentation___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v10 = a2;
  id v5 = a3;
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();
  id v7 = *(void **)(a1 + 32);
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

- (BOOL)readFrom:(id)a3
{
  return GEOPDTransitConnectionReadAllFrom((uint64_t)self, a3, 0);
}

- (void)writeTo:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  if (self->_reader && (os_unfair_lock_assert_owner(&self->_readerLock), (*(unsigned char *)&self->_flags & 0x3C) == 0))
  {
    id v10 = self->_reader;
    objc_sync_enter(v10);
    *(void *)((char *)self->_reader + (int)*MEMORY[0x1E4F940E0]) = self->_readerMarkLength;
    [(PBDataReader *)self->_reader seekToOffset:self->_readerMarkPos];
    v11 = [(PBDataReader *)self->_reader readBytes:self->_readerMarkLength - self->_readerMarkPos];
    [v4 writeData:v11];
    os_unfair_lock_unlock(p_readerLock);

    objc_sync_exit(v10);
  }
  else
  {
    os_unfair_lock_unlock(&self->_readerLock);
    -[GEOPDTransitConnection readAll:]((uint64_t)self, 0);
    if (*(unsigned char *)&self->_flags) {
      PBDataWriterWriteUint64Field();
    }
    long long v14 = 0u;
    long long v15 = 0u;
    long long v12 = 0u;
    long long v13 = 0u;
    objc_super v6 = self->_transitLabels;
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

    if (self->_entityNameString) {
      PBDataWriterWriteStringField();
    }
    if (self->_mapsId) {
      PBDataWriterWriteSubmessage();
    }
    -[PBUnknownFields writeTo:](self->_unknownFields, "writeTo:", v4, v12);
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  os_unfair_lock_lock(&self->_readerLock);
  reader = self->_reader;
  if (reader)
  {
    uint64_t v7 = reader;
    objc_sync_enter(v7);
    if ((*(unsigned char *)&self->_flags & 0x20) == 0)
    {
      *(void *)((char *)self->_reader + (int)*MEMORY[0x1E4F940E0]) = self->_readerMarkLength;
      [(PBDataReader *)self->_reader seekToOffset:self->_readerMarkPos];
      GEOPDTransitConnectionReadAllFrom(v5, self->_reader, 0);
      os_unfair_lock_unlock(&self->_readerLock);
      id v8 = (id)v5;
      objc_sync_exit(v7);

      goto LABEL_15;
    }
    objc_sync_exit(v7);
  }
  os_unfair_lock_unlock(&self->_readerLock);
  -[GEOPDTransitConnection readAll:]((uint64_t)self, 0);
  if (*(unsigned char *)&self->_flags)
  {
    *(void *)(v5 + 40) = self->_muid;
    *(unsigned char *)(v5 + 68) |= 1u;
  }
  long long v22 = 0u;
  long long v23 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  uint64_t v9 = self->_transitLabels;
  uint64_t v10 = [(NSMutableArray *)v9 countByEnumeratingWithState:&v20 objects:v24 count:16];
  if (v10)
  {
    uint64_t v11 = *(void *)v21;
    do
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v21 != v11) {
          objc_enumerationMutation(v9);
        }
        long long v13 = objc_msgSend(*(id *)(*((void *)&v20 + 1) + 8 * i), "copyWithZone:", a3, (void)v20);
        -[GEOPDTransitConnection addTransitLabel:](v5, v13);
      }
      uint64_t v10 = [(NSMutableArray *)v9 countByEnumeratingWithState:&v20 objects:v24 count:16];
    }
    while (v10);
  }

  uint64_t v14 = [(NSString *)self->_entityNameString copyWithZone:a3];
  long long v15 = *(void **)(v5 + 24);
  *(void *)(v5 + 24) = v14;

  id v16 = [(GEOPDMapsIdentifier *)self->_mapsId copyWithZone:a3];
  uint64_t v17 = *(void **)(v5 + 32);
  *(void *)(v5 + 32) = v16;

  v18 = self->_unknownFields;
  id v8 = *(id *)(v5 + 16);
  *(void *)(v5 + 16) = v18;
LABEL_15:

  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_13;
  }
  -[GEOPDTransitConnection readAll:]((uint64_t)self, 1);
  -[GEOPDTransitConnection readAll:]((uint64_t)v4, 1);
  if (*(unsigned char *)&self->_flags)
  {
    if ((*((unsigned char *)v4 + 68) & 1) == 0 || self->_muid != *((void *)v4 + 5)) {
      goto LABEL_13;
    }
  }
  else if (*((unsigned char *)v4 + 68))
  {
LABEL_13:
    char v8 = 0;
    goto LABEL_14;
  }
  transitLabels = self->_transitLabels;
  if ((unint64_t)transitLabels | *((void *)v4 + 6)
    && !-[NSMutableArray isEqual:](transitLabels, "isEqual:"))
  {
    goto LABEL_13;
  }
  entityNameString = self->_entityNameString;
  if ((unint64_t)entityNameString | *((void *)v4 + 3))
  {
    if (!-[NSString isEqual:](entityNameString, "isEqual:")) {
      goto LABEL_13;
    }
  }
  mapsId = self->_mapsId;
  if ((unint64_t)mapsId | *((void *)v4 + 4)) {
    char v8 = -[GEOPDMapsIdentifier isEqual:](mapsId, "isEqual:");
  }
  else {
    char v8 = 1;
  }
LABEL_14:

  return v8;
}

- (unint64_t)hash
{
  -[GEOPDTransitConnection readAll:]((uint64_t)self, 1);
  if (*(unsigned char *)&self->_flags) {
    unint64_t v3 = 2654435761u * self->_muid;
  }
  else {
    unint64_t v3 = 0;
  }
  uint64_t v4 = [(NSMutableArray *)self->_transitLabels hash] ^ v3;
  NSUInteger v5 = [(NSString *)self->_entityNameString hash];
  return v4 ^ v5 ^ [(GEOPDMapsIdentifier *)self->_mapsId hash];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_transitLabels, 0);
  objc_storeStrong((id *)&self->_mapsId, 0);
  objc_storeStrong((id *)&self->_entityNameString, 0);
  objc_storeStrong((id *)&self->_unknownFields, 0);

  objc_storeStrong((id *)&self->_reader, 0);
}

@end