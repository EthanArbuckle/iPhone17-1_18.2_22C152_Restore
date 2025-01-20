@interface GEOPDDirectionIntent
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (GEOPDDirectionIntent)init;
- (GEOPDDirectionIntent)initWithData:(id)a3;
- (id)_dictionaryRepresentation:(uint64_t)a1;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)destination;
- (id)dictionaryRepresentation;
- (id)jsonRepresentation;
- (id)origin;
- (uint64_t)_initWithDictionary:(int)a3 isJSON:;
- (uint64_t)mergeFrom:(uint64_t)a1;
- (uint64_t)transportType;
- (unint64_t)hash;
- (void)_readDestination;
- (void)_readOrigin;
- (void)clearUnknownFields:(uint64_t)a1;
- (void)readAll:(uint64_t)a1;
- (void)setDestination:(uint64_t)a1;
- (void)setOrigin:(uint64_t)a1;
- (void)writeTo:(id)a3;
@end

@implementation GEOPDDirectionIntent

- (GEOPDDirectionIntent)init
{
  v6.receiver = self;
  v6.super_class = (Class)GEOPDDirectionIntent;
  v2 = [(GEOPDDirectionIntent *)&v6 init];
  v3 = v2;
  if (v2)
  {
    v2->_readerLock._os_unfair_lock_opaque = 0;
    v4 = v2;
  }

  return v3;
}

- (GEOPDDirectionIntent)initWithData:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)GEOPDDirectionIntent;
  v3 = [(GEOPDDirectionIntent *)&v7 initWithData:a3];
  v4 = v3;
  if (v3)
  {
    v3->_readerLock._os_unfair_lock_opaque = 0;
    v5 = v3;
  }

  return v4;
}

- (void)_readOrigin
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
        GEOPDDirectionIntentReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readOrigin_tags_1);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 48));
  }
}

- (id)origin
{
  if (a1)
  {
    v2 = a1;
    -[GEOPDDirectionIntent _readOrigin]((uint64_t)a1);
    a1 = (id *)v2[4];
    uint64_t v1 = vars8;
  }
  return a1;
}

- (void)setOrigin:(uint64_t)a1
{
  id v4 = a2;
  if (a1)
  {
    *(unsigned char *)(a1 + 56) |= 8u;
    *(unsigned char *)(a1 + 56) |= 0x10u;
    objc_storeStrong((id *)(a1 + 32), a2);
  }
}

- (void)_readDestination
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
        GEOPDDirectionIntentReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readDestination_tags_1);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 48));
  }
}

- (id)destination
{
  if (a1)
  {
    v2 = a1;
    -[GEOPDDirectionIntent _readDestination]((uint64_t)a1);
    a1 = (id *)v2[3];
    uint64_t v1 = vars8;
  }
  return a1;
}

- (void)setDestination:(uint64_t)a1
{
  id v4 = a2;
  if (a1)
  {
    *(unsigned char *)(a1 + 56) |= 4u;
    *(unsigned char *)(a1 + 56) |= 0x10u;
    objc_storeStrong((id *)(a1 + 24), a2);
  }
}

- (uint64_t)transportType
{
  if (result)
  {
    uint64_t v1 = result;
    os_unfair_lock_lock_with_options();
    char v2 = *(unsigned char *)(v1 + 56);
    os_unfair_lock_unlock((os_unfair_lock_t)(v1 + 48));
    if (v2) {
      return *(unsigned int *)(v1 + 52);
    }
    else {
      return 0;
    }
  }
  return result;
}

- (id)description
{
  id v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)GEOPDDirectionIntent;
  id v4 = [(GEOPDDirectionIntent *)&v8 description];
  v5 = [(GEOPDDirectionIntent *)self dictionaryRepresentation];
  objc_super v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEOPDDirectionIntent _dictionaryRepresentation:]((uint64_t)self, 0);
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  if (a1)
  {
    -[GEOPDDirectionIntent readAll:](a1, 1);
    id v4 = [MEMORY[0x1E4F1CA60] dictionary];
    v5 = -[GEOPDDirectionIntent origin]((id *)a1);
    objc_super v6 = v5;
    if (v5)
    {
      if (a2) {
        [v5 jsonRepresentation];
      }
      else {
      objc_super v7 = [v5 dictionaryRepresentation];
      }
      [v4 setObject:v7 forKey:@"origin"];
    }
    objc_super v8 = -[GEOPDDirectionIntent destination]((id *)a1);
    v9 = v8;
    if (v8)
    {
      if (a2) {
        [v8 jsonRepresentation];
      }
      else {
      v10 = [v8 dictionaryRepresentation];
      }
      [v4 setObject:v10 forKey:@"destination"];
    }
    if (*(unsigned char *)(a1 + 56))
    {
      uint64_t v11 = *(int *)(a1 + 52);
      if (v11 >= 7)
      {
        objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(int *)(a1 + 52));
        v12 = (__CFString *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v12 = off_1E53E3898[v11];
      }
      if (a2) {
        v13 = @"transportType";
      }
      else {
        v13 = @"transport_type";
      }
      [v4 setObject:v12 forKey:v13];
    }
    v14 = *(void **)(a1 + 16);
    if (v14)
    {
      v15 = [v14 dictionaryRepresentation];
      v16 = v15;
      if (a2)
      {
        v17 = objc_msgSend(MEMORY[0x1E4F1CA60], "dictionaryWithCapacity:", objc_msgSend(v15, "count"));
        v21[0] = MEMORY[0x1E4F143A8];
        v21[1] = 3221225472;
        v21[2] = __50__GEOPDDirectionIntent__dictionaryRepresentation___block_invoke;
        v21[3] = &unk_1E53D8860;
        id v18 = v17;
        id v22 = v18;
        [v16 enumerateKeysAndObjectsUsingBlock:v21];
        id v19 = v18;

        v16 = v19;
      }
      [v4 setObject:v16 forKey:@"Unknown Fields"];
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
  return -[GEOPDDirectionIntent _dictionaryRepresentation:]((uint64_t)self, 1);
}

- (void)readAll:(uint64_t)a1
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 48));
    id v4 = *(void **)(a1 + 8);
    if (v4)
    {
      id v5 = v4;
      objc_sync_enter(v5);
      if (a2) {
        objc_super v6 = (int *)&readAll__recursiveTag_4048;
      }
      else {
        objc_super v6 = (int *)&readAll__nonRecursiveTag_4049;
      }
      GEOPDDirectionIntentReadSpecified(a1, *(void *)(a1 + 8), v6);
      objc_sync_exit(v5);
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 48));
  }
}

void __50__GEOPDDirectionIntent__dictionaryRepresentation___block_invoke(uint64_t a1, void *a2, void *a3)
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

- (uint64_t)_initWithDictionary:(int)a3 isJSON:
{
  id v5 = a2;
  if (a1)
  {
    a1 = [(id)a1 init];
    if (a1)
    {
      objc_super v6 = [v5 objectForKeyedSubscript:@"origin"];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        objc_super v7 = [GEOPDResolvedItem alloc];
        if (v7) {
          objc_super v8 = (void *)-[GEOPDResolvedItem _initWithDictionary:isJSON:]((uint64_t)v7, v6, a3);
        }
        else {
          objc_super v8 = 0;
        }
        -[GEOPDDirectionIntent setOrigin:](a1, v8);
      }
      v9 = [v5 objectForKeyedSubscript:@"destination"];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        id v10 = [GEOPDResolvedItem alloc];
        if (v10) {
          uint64_t v11 = (void *)-[GEOPDResolvedItem _initWithDictionary:isJSON:]((uint64_t)v10, v9, a3);
        }
        else {
          uint64_t v11 = 0;
        }
        -[GEOPDDirectionIntent setDestination:](a1, v11);
      }
      if (a3) {
        v12 = @"transportType";
      }
      else {
        v12 = @"transport_type";
      }
      v13 = [v5 objectForKeyedSubscript:v12];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        id v14 = v13;
        if ([v14 isEqualToString:@"AUTOMOBILE"])
        {
          int v15 = 0;
        }
        else if ([v14 isEqualToString:@"TRANSIT"])
        {
          int v15 = 1;
        }
        else if ([v14 isEqualToString:@"WALKING"])
        {
          int v15 = 2;
        }
        else if ([v14 isEqualToString:@"BICYCLE"])
        {
          int v15 = 3;
        }
        else if ([v14 isEqualToString:@"UNKNOWN_TRANSPORT_TYPE"])
        {
          int v15 = 4;
        }
        else if ([v14 isEqualToString:@"FERRY"])
        {
          int v15 = 5;
        }
        else if ([v14 isEqualToString:@"RIDESHARE"])
        {
          int v15 = 6;
        }
        else
        {
          int v15 = 0;
        }
      }
      else
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
LABEL_34:

          goto LABEL_35;
        }
        int v15 = [v13 intValue];
      }
      *(unsigned char *)(a1 + 56) |= 0x10u;
      *(unsigned char *)(a1 + 56) |= 1u;
      *(_DWORD *)(a1 + 52) = v15;
      goto LABEL_34;
    }
  }
LABEL_35:

  return a1;
}

- (BOOL)readFrom:(id)a3
{
  return GEOPDDirectionIntentReadAllFrom((uint64_t)self, a3, 0);
}

- (void)writeTo:(id)a3
{
  id v8 = a3;
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  if (self->_reader && (os_unfair_lock_assert_owner(&self->_readerLock), (*(unsigned char *)&self->_flags & 0x1C) == 0))
  {
    objc_super v6 = self->_reader;
    objc_sync_enter(v6);
    *(void *)((char *)self->_reader + (int)*MEMORY[0x1E4F940E0]) = self->_readerMarkLength;
    [(PBDataReader *)self->_reader seekToOffset:self->_readerMarkPos];
    objc_super v7 = [(PBDataReader *)self->_reader readBytes:self->_readerMarkLength - self->_readerMarkPos];
    [v8 writeData:v7];
    os_unfair_lock_unlock(p_readerLock);

    objc_sync_exit(v6);
  }
  else
  {
    os_unfair_lock_unlock(&self->_readerLock);
    -[GEOPDDirectionIntent readAll:]((uint64_t)self, 0);
    if (self->_origin) {
      PBDataWriterWriteSubmessage();
    }
    id v5 = v8;
    if (self->_destination)
    {
      PBDataWriterWriteSubmessage();
      id v5 = v8;
    }
    if (*(unsigned char *)&self->_flags)
    {
      PBDataWriterWriteInt32Field();
      id v5 = v8;
    }
    [(PBUnknownFields *)self->_unknownFields writeTo:v5];
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
    if ((*(unsigned char *)&self->_flags & 0x10) == 0)
    {
      *(void *)((char *)self->_reader + (int)*MEMORY[0x1E4F940E0]) = self->_readerMarkLength;
      [(PBDataReader *)self->_reader seekToOffset:self->_readerMarkPos];
      GEOPDDirectionIntentReadAllFrom(v5, self->_reader, 0);
      os_unfair_lock_unlock(&self->_readerLock);
      id v8 = (id)v5;
      objc_sync_exit(v7);

      goto LABEL_8;
    }
    objc_sync_exit(v7);
  }
  os_unfair_lock_unlock(&self->_readerLock);
  -[GEOPDDirectionIntent readAll:]((uint64_t)self, 0);
  id v9 = [(GEOPDResolvedItem *)self->_origin copyWithZone:a3];
  id v10 = *(void **)(v5 + 32);
  *(void *)(v5 + 32) = v9;

  id v11 = [(GEOPDResolvedItem *)self->_destination copyWithZone:a3];
  v12 = *(void **)(v5 + 24);
  *(void *)(v5 + 24) = v11;

  if (*(unsigned char *)&self->_flags)
  {
    *(_DWORD *)(v5 + 52) = self->_transportType;
    *(unsigned char *)(v5 + 56) |= 1u;
  }
  v13 = self->_unknownFields;
  id v8 = *(id *)(v5 + 16);
  *(void *)(v5 + 16) = v13;
LABEL_8:

  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_10;
  }
  -[GEOPDDirectionIntent readAll:]((uint64_t)self, 1);
  -[GEOPDDirectionIntent readAll:]((uint64_t)v4, 1);
  origin = self->_origin;
  if ((unint64_t)origin | *((void *)v4 + 4))
  {
    if (!-[GEOPDResolvedItem isEqual:](origin, "isEqual:")) {
      goto LABEL_10;
    }
  }
  destination = self->_destination;
  if ((unint64_t)destination | *((void *)v4 + 3))
  {
    if (!-[GEOPDResolvedItem isEqual:](destination, "isEqual:")) {
      goto LABEL_10;
    }
  }
  BOOL v7 = (*((unsigned char *)v4 + 56) & 1) == 0;
  if (*(unsigned char *)&self->_flags)
  {
    if ((*((unsigned char *)v4 + 56) & 1) != 0 && self->_transportType == *((_DWORD *)v4 + 13))
    {
      BOOL v7 = 1;
      goto LABEL_11;
    }
LABEL_10:
    BOOL v7 = 0;
  }
LABEL_11:

  return v7;
}

- (unint64_t)hash
{
  -[GEOPDDirectionIntent readAll:]((uint64_t)self, 1);
  unint64_t v3 = [(GEOPDResolvedItem *)self->_origin hash];
  unint64_t v4 = [(GEOPDResolvedItem *)self->_destination hash];
  if (*(unsigned char *)&self->_flags) {
    uint64_t v5 = 2654435761 * self->_transportType;
  }
  else {
    uint64_t v5 = 0;
  }
  return v4 ^ v3 ^ v5;
}

- (uint64_t)mergeFrom:(uint64_t)a1
{
  unint64_t v3 = a2;
  if (!a1) {
    goto LABEL_16;
  }
  id v10 = v3;
  -[GEOPDDirectionIntent readAll:]((uint64_t)v3, 0);
  unint64_t v4 = v10;
  uint64_t v5 = *(void *)(a1 + 32);
  objc_super v6 = (void *)v10[4];
  if (v5)
  {
    if (!v6) {
      goto LABEL_8;
    }
    -[GEOPDResolvedItem mergeFrom:](v5, v6);
  }
  else
  {
    if (!v6) {
      goto LABEL_8;
    }
    -[GEOPDDirectionIntent setOrigin:](a1, v6);
  }
  unint64_t v4 = v10;
LABEL_8:
  uint64_t v7 = *(void *)(a1 + 24);
  id v8 = (void *)v4[3];
  if (v7)
  {
    if (!v8) {
      goto LABEL_14;
    }
    -[GEOPDResolvedItem mergeFrom:](v7, v8);
  }
  else
  {
    if (!v8) {
      goto LABEL_14;
    }
    -[GEOPDDirectionIntent setDestination:](a1, v8);
  }
  unint64_t v4 = v10;
LABEL_14:
  if (v4[7])
  {
    *(_DWORD *)(a1 + 52) = *((_DWORD *)v4 + 13);
    *(unsigned char *)(a1 + 56) |= 1u;
  }
LABEL_16:

  return MEMORY[0x1F4181820]();
}

- (void)clearUnknownFields:(uint64_t)a1
{
  if (a1)
  {
    os_unfair_lock_lock_with_options();
    *(unsigned char *)(a1 + 56) |= 2u;
    *(unsigned char *)(a1 + 56) |= 0x10u;
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 48));
    unint64_t v4 = *(void **)(a1 + 16);
    *(void *)(a1 + 16) = 0;

    if (a2)
    {
      -[GEOPDDirectionIntent readAll:](a1, 0);
      uint64_t v5 = *(void *)(a1 + 32);
      if (v5)
      {
        objc_super v6 = *(void **)(v5 + 8);
        *(void *)(v5 + 8) = 0;
      }
      uint64_t v7 = *(void *)(a1 + 24);
      if (v7)
      {
        id v8 = *(void **)(v7 + 8);
        *(void *)(v7 + 8) = 0;
      }
    }
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_origin, 0);
  objc_storeStrong((id *)&self->_destination, 0);
  objc_storeStrong((id *)&self->_unknownFields, 0);

  objc_storeStrong((id *)&self->_reader, 0);
}

@end