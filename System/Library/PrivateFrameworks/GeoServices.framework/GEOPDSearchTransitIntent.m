@interface GEOPDSearchTransitIntent
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (GEOPDSearchTransitIntent)init;
- (GEOPDSearchTransitIntent)initWithData:(id)a3;
- (id)_dictionaryRepresentation:(uint64_t)a1;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)jsonRepresentation;
- (unint64_t)hash;
- (void)readAll:(uint64_t)a1;
- (void)writeTo:(id)a3;
@end

@implementation GEOPDSearchTransitIntent

- (GEOPDSearchTransitIntent)init
{
  v6.receiver = self;
  v6.super_class = (Class)GEOPDSearchTransitIntent;
  v2 = [(GEOPDSearchTransitIntent *)&v6 init];
  v3 = v2;
  if (v2)
  {
    v2->_readerLock._os_unfair_lock_opaque = 0;
    v4 = v2;
  }

  return v3;
}

- (GEOPDSearchTransitIntent)initWithData:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)GEOPDSearchTransitIntent;
  v3 = [(GEOPDSearchTransitIntent *)&v7 initWithData:a3];
  v4 = v3;
  if (v3)
  {
    v3->_readerLock._os_unfair_lock_opaque = 0;
    v5 = v3;
  }

  return v4;
}

- (id)description
{
  v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)GEOPDSearchTransitIntent;
  v4 = [(GEOPDSearchTransitIntent *)&v8 description];
  v5 = [(GEOPDSearchTransitIntent *)self dictionaryRepresentation];
  objc_super v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEOPDSearchTransitIntent _dictionaryRepresentation:]((uint64_t)self, 0);
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  if (a1)
  {
    -[GEOPDSearchTransitIntent readAll:](a1, 1);
    v4 = [MEMORY[0x1E4F1CA60] dictionary];
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 48));
    if ((*(unsigned char *)(a1 + 56) & 4) == 0)
    {
      v5 = *(void **)(a1 + 8);
      if (v5)
      {
        id v6 = v5;
        objc_sync_enter(v6);
        GEOPDSearchTransitIntentReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readName_tags_2480);
        objc_sync_exit(v6);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 48));
    id v7 = *(id *)(a1 + 16);
    if (v7) {
      [v4 setObject:v7 forKey:@"name"];
    }

    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 48));
    if ((*(unsigned char *)(a1 + 56) & 8) == 0)
    {
      objc_super v8 = *(void **)(a1 + 8);
      if (v8)
      {
        id v9 = v8;
        objc_sync_enter(v9);
        GEOPDSearchTransitIntentReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readTokenSet_tags_2481);
        objc_sync_exit(v9);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 48));
    id v10 = *(id *)(a1 + 24);
    v11 = v10;
    if (v10)
    {
      if (a2)
      {
        v12 = [v10 jsonRepresentation];
        v13 = @"tokenSet";
      }
      else
      {
        v12 = [v10 dictionaryRepresentation];
        v13 = @"token_set";
      }
      [v4 setObject:v12 forKey:v13];
    }
    char v14 = *(unsigned char *)(a1 + 56);
    if (v14)
    {
      v15 = [NSNumber numberWithUnsignedLongLong:*(void *)(a1 + 32)];
      if (a2) {
        v16 = @"transitId";
      }
      else {
        v16 = @"transit_id";
      }
      [v4 setObject:v15 forKey:v16];

      char v14 = *(unsigned char *)(a1 + 56);
    }
    if ((v14 & 2) != 0)
    {
      uint64_t v17 = *(int *)(a1 + 52);
      if (v17 >= 3)
      {
        objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(int *)(a1 + 52));
        v18 = (__CFString *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v18 = off_1E53E2AD0[v17];
      }
      if (a2) {
        v19 = @"transitType";
      }
      else {
        v19 = @"transit_type";
      }
      [v4 setObject:v18 forKey:v19];
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
  return -[GEOPDSearchTransitIntent _dictionaryRepresentation:]((uint64_t)self, 1);
}

- (void)readAll:(uint64_t)a1
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 48));
    v4 = *(void **)(a1 + 8);
    if (v4)
    {
      id v5 = v4;
      objc_sync_enter(v5);
      if (a2) {
        id v6 = (int *)&readAll__recursiveTag_2494;
      }
      else {
        id v6 = (int *)&readAll__nonRecursiveTag_2495;
      }
      GEOPDSearchTransitIntentReadSpecified(a1, *(void *)(a1 + 8), v6);
      objc_sync_exit(v5);
    }
    if (a2) {
      -[GEOPDSearchTokenSet readAll:](*(void *)(a1 + 24), 1);
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 48));
  }
}

- (BOOL)readFrom:(id)a3
{
  return GEOPDSearchTransitIntentReadAllFrom((uint64_t)self, a3, 0);
}

- (void)writeTo:(id)a3
{
  id v8 = a3;
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  if (self->_reader && !_GEOPDSearchTransitIntentIsDirty((uint64_t)self))
  {
    id v6 = self->_reader;
    objc_sync_enter(v6);
    *(void *)((char *)self->_reader + (int)*MEMORY[0x1E4F940E0]) = self->_readerMarkLength;
    [(PBDataReader *)self->_reader seekToOffset:self->_readerMarkPos];
    id v7 = [(PBDataReader *)self->_reader readBytes:self->_readerMarkLength - self->_readerMarkPos];
    [v8 writeData:v7];
    os_unfair_lock_unlock(p_readerLock);

    objc_sync_exit(v6);
  }
  else
  {
    os_unfair_lock_unlock(&self->_readerLock);
    -[GEOPDSearchTransitIntent readAll:]((uint64_t)self, 0);
    if (self->_name) {
      PBDataWriterWriteStringField();
    }
    if (self->_tokenSet) {
      PBDataWriterWriteSubmessage();
    }
    char flags = (char)self->_flags;
    if (flags)
    {
      PBDataWriterWriteUint64Field();
      char flags = (char)self->_flags;
    }
    if ((flags & 2) != 0) {
      PBDataWriterWriteInt32Field();
    }
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
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
      GEOPDSearchTransitIntentReadAllFrom(v5, self->_reader, 0);
      os_unfair_lock_unlock(&self->_readerLock);
      id v8 = (id)v5;
      objc_sync_exit(v7);

      return (id)v5;
    }
    objc_sync_exit(v7);
  }
  os_unfair_lock_unlock(&self->_readerLock);
  -[GEOPDSearchTransitIntent readAll:]((uint64_t)self, 0);
  uint64_t v9 = [(NSString *)self->_name copyWithZone:a3];
  id v10 = *(void **)(v5 + 16);
  *(void *)(v5 + 16) = v9;

  id v11 = [(GEOPDSearchTokenSet *)self->_tokenSet copyWithZone:a3];
  v12 = *(void **)(v5 + 24);
  *(void *)(v5 + 24) = v11;

  char flags = (char)self->_flags;
  if (flags)
  {
    *(void *)(v5 + 32) = self->_transitId;
    *(unsigned char *)(v5 + 56) |= 1u;
    char flags = (char)self->_flags;
  }
  if ((flags & 2) != 0)
  {
    *(_DWORD *)(v5 + 52) = self->_transitType;
    *(unsigned char *)(v5 + 56) |= 2u;
  }
  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_15;
  }
  -[GEOPDSearchTransitIntent readAll:]((uint64_t)self, 1);
  -[GEOPDSearchTransitIntent readAll:]((uint64_t)v4, 1);
  name = self->_name;
  if ((unint64_t)name | *((void *)v4 + 2))
  {
    if (!-[NSString isEqual:](name, "isEqual:")) {
      goto LABEL_15;
    }
  }
  tokenSet = self->_tokenSet;
  if ((unint64_t)tokenSet | *((void *)v4 + 3))
  {
    if (!-[GEOPDSearchTokenSet isEqual:](tokenSet, "isEqual:")) {
      goto LABEL_15;
    }
  }
  if (*(unsigned char *)&self->_flags)
  {
    if ((*((unsigned char *)v4 + 56) & 1) == 0 || self->_transitId != *((void *)v4 + 4)) {
      goto LABEL_15;
    }
  }
  else if (*((unsigned char *)v4 + 56))
  {
LABEL_15:
    BOOL v7 = 0;
    goto LABEL_16;
  }
  BOOL v7 = (*((unsigned char *)v4 + 56) & 2) == 0;
  if ((*(unsigned char *)&self->_flags & 2) != 0)
  {
    if ((*((unsigned char *)v4 + 56) & 2) == 0 || self->_transitType != *((_DWORD *)v4 + 13)) {
      goto LABEL_15;
    }
    BOOL v7 = 1;
  }
LABEL_16:

  return v7;
}

- (unint64_t)hash
{
  -[GEOPDSearchTransitIntent readAll:]((uint64_t)self, 1);
  NSUInteger v3 = [(NSString *)self->_name hash];
  unint64_t v4 = [(GEOPDSearchTokenSet *)self->_tokenSet hash];
  if (*(unsigned char *)&self->_flags)
  {
    unint64_t v5 = 2654435761u * self->_transitId;
    if ((*(unsigned char *)&self->_flags & 2) != 0) {
      goto LABEL_3;
    }
LABEL_5:
    uint64_t v6 = 0;
    return v4 ^ v3 ^ v5 ^ v6;
  }
  unint64_t v5 = 0;
  if ((*(unsigned char *)&self->_flags & 2) == 0) {
    goto LABEL_5;
  }
LABEL_3:
  uint64_t v6 = 2654435761 * self->_transitType;
  return v4 ^ v3 ^ v5 ^ v6;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_tokenSet, 0);
  objc_storeStrong((id *)&self->_name, 0);

  objc_storeStrong((id *)&self->_reader, 0);
}

@end