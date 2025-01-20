@interface GEOPDLocalizedSpokenStructuredAddress
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (GEOPDLocalizedSpokenStructuredAddress)init;
- (GEOPDLocalizedSpokenStructuredAddress)initWithData:(id)a3;
- (id)_dictionaryRepresentation:(uint64_t)a1;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)jsonRepresentation;
- (id)spokenStructuredAddress;
- (unint64_t)hash;
- (void)_readSpokenStructuredAddress;
- (void)readAll:(uint64_t)a1;
- (void)setSpokenStructuredAddress:(uint64_t)a1;
- (void)writeTo:(id)a3;
@end

@implementation GEOPDLocalizedSpokenStructuredAddress

- (void)setSpokenStructuredAddress:(uint64_t)a1
{
  id v4 = a2;
  if (a1)
  {
    *(unsigned char *)(a1 + 52) |= 4u;
    *(unsigned char *)(a1 + 52) |= 8u;
    objc_storeStrong((id *)(a1 + 32), a2);
  }
}

- (GEOPDLocalizedSpokenStructuredAddress)init
{
  v6.receiver = self;
  v6.super_class = (Class)GEOPDLocalizedSpokenStructuredAddress;
  v2 = [(GEOPDLocalizedSpokenStructuredAddress *)&v6 init];
  v3 = v2;
  if (v2)
  {
    v2->_readerLock._os_unfair_lock_opaque = 0;
    id v4 = v2;
  }

  return v3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_spokenStructuredAddress, 0);
  objc_storeStrong((id *)&self->_language, 0);
  objc_storeStrong((id *)&self->_unknownFields, 0);

  objc_storeStrong((id *)&self->_reader, 0);
}

- (void)_readSpokenStructuredAddress
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 48));
    if ((*(unsigned char *)(a1 + 52) & 4) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOPDLocalizedSpokenStructuredAddressReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readSpokenStructuredAddress_tags_6158);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 48));
  }
}

- (GEOPDLocalizedSpokenStructuredAddress)initWithData:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)GEOPDLocalizedSpokenStructuredAddress;
  id v3 = [(GEOPDLocalizedSpokenStructuredAddress *)&v7 initWithData:a3];
  id v4 = v3;
  if (v3)
  {
    v3->_readerLock._os_unfair_lock_opaque = 0;
    v5 = v3;
  }

  return v4;
}

- (id)spokenStructuredAddress
{
  if (a1)
  {
    v2 = a1;
    -[GEOPDLocalizedSpokenStructuredAddress _readSpokenStructuredAddress]((uint64_t)a1);
    a1 = (id *)v2[4];
    uint64_t v1 = vars8;
  }
  return a1;
}

- (id)description
{
  id v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)GEOPDLocalizedSpokenStructuredAddress;
  id v4 = [(GEOPDLocalizedSpokenStructuredAddress *)&v8 description];
  v5 = [(GEOPDLocalizedSpokenStructuredAddress *)self dictionaryRepresentation];
  objc_super v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEOPDLocalizedSpokenStructuredAddress _dictionaryRepresentation:]((uint64_t)self, 0);
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  if (a1)
  {
    -[GEOPDLocalizedSpokenStructuredAddress readAll:](a1, 1);
    id v4 = [MEMORY[0x1E4F1CA60] dictionary];
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 48));
    if ((*(unsigned char *)(a1 + 52) & 2) == 0)
    {
      v5 = *(void **)(a1 + 8);
      if (v5)
      {
        id v6 = v5;
        objc_sync_enter(v6);
        GEOPDLocalizedSpokenStructuredAddressReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readLanguage_tags_6157);
        objc_sync_exit(v6);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 48));
    id v7 = *(id *)(a1 + 24);
    if (v7) {
      [v4 setObject:v7 forKey:@"language"];
    }

    objc_super v8 = -[GEOPDLocalizedSpokenStructuredAddress spokenStructuredAddress]((id *)a1);
    v9 = v8;
    if (v8)
    {
      if (a2)
      {
        v10 = [v8 jsonRepresentation];
        v11 = @"spokenStructuredAddress";
      }
      else
      {
        v10 = [v8 dictionaryRepresentation];
        v11 = @"spoken_structured_address";
      }
      [v4 setObject:v10 forKey:v11];
    }
    v12 = *(void **)(a1 + 16);
    if (v12)
    {
      v13 = [v12 dictionaryRepresentation];
      v14 = v13;
      if (a2)
      {
        v15 = objc_msgSend(MEMORY[0x1E4F1CA60], "dictionaryWithCapacity:", objc_msgSend(v13, "count"));
        v19[0] = MEMORY[0x1E4F143A8];
        v19[1] = 3221225472;
        v19[2] = __67__GEOPDLocalizedSpokenStructuredAddress__dictionaryRepresentation___block_invoke;
        v19[3] = &unk_1E53D8860;
        id v16 = v15;
        id v20 = v16;
        [v14 enumerateKeysAndObjectsUsingBlock:v19];
        id v17 = v16;

        v14 = v17;
      }
      [v4 setObject:v14 forKey:@"Unknown Fields"];
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
  return -[GEOPDLocalizedSpokenStructuredAddress _dictionaryRepresentation:]((uint64_t)self, 1);
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
        id v6 = (int *)&readAll__recursiveTag_6160;
      }
      else {
        id v6 = (int *)&readAll__nonRecursiveTag_6161;
      }
      GEOPDLocalizedSpokenStructuredAddressReadSpecified(a1, *(void *)(a1 + 8), v6);
      objc_sync_exit(v5);
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 48));
  }
}

void __67__GEOPDLocalizedSpokenStructuredAddress__dictionaryRepresentation___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v10 = a2;
  id v5 = a3;
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();
  id v7 = *(void **)(a1 + 32);
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

- (BOOL)readFrom:(id)a3
{
  return GEOPDLocalizedSpokenStructuredAddressReadAllFrom((uint64_t)self, a3, 0);
}

- (void)writeTo:(id)a3
{
  id v8 = a3;
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  if (self->_reader && (os_unfair_lock_assert_owner(&self->_readerLock), (*(unsigned char *)&self->_flags & 0xE) == 0))
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
    -[GEOPDLocalizedSpokenStructuredAddress readAll:]((uint64_t)self, 0);
    if (self->_language) {
      PBDataWriterWriteStringField();
    }
    id v5 = v8;
    if (self->_spokenStructuredAddress)
    {
      PBDataWriterWriteSubmessage();
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
  if (!reader) {
    goto LABEL_5;
  }
  id v7 = reader;
  objc_sync_enter(v7);
  if ((*(unsigned char *)&self->_flags & 8) != 0)
  {
    objc_sync_exit(v7);

LABEL_5:
    os_unfair_lock_unlock(&self->_readerLock);
    -[GEOPDLocalizedSpokenStructuredAddress readAll:]((uint64_t)self, 0);
    uint64_t v8 = [(NSString *)self->_language copyWithZone:a3];
    v9 = *(void **)(v5 + 24);
    *(void *)(v5 + 24) = v8;

    id v10 = [(GEOStructuredAddress *)self->_spokenStructuredAddress copyWithZone:a3];
    v11 = *(void **)(v5 + 32);
    *(void *)(v5 + 32) = v10;

    objc_storeStrong((id *)(v5 + 16), self->_unknownFields);
    return (id)v5;
  }
  *(void *)((char *)self->_reader + (int)*MEMORY[0x1E4F940E0]) = self->_readerMarkLength;
  [(PBDataReader *)self->_reader seekToOffset:self->_readerMarkPos];
  GEOPDLocalizedSpokenStructuredAddressReadAllFrom(v5, self->_reader, 0);
  os_unfair_lock_unlock(&self->_readerLock);
  objc_sync_exit(v7);

  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if ([v4 isMemberOfClass:objc_opt_class()]
    && ((-[GEOPDLocalizedSpokenStructuredAddress readAll:]((uint64_t)self, 1),
         -[GEOPDLocalizedSpokenStructuredAddress readAll:]((uint64_t)v4, 1),
         language = self->_language,
         !((unint64_t)language | v4[3]))
     || -[NSString isEqual:](language, "isEqual:")))
  {
    spokenStructuredAddress = self->_spokenStructuredAddress;
    if ((unint64_t)spokenStructuredAddress | v4[4]) {
      char v7 = -[GEOStructuredAddress isEqual:](spokenStructuredAddress, "isEqual:");
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
  -[GEOPDLocalizedSpokenStructuredAddress readAll:]((uint64_t)self, 1);
  NSUInteger v3 = [(NSString *)self->_language hash];
  return [(GEOStructuredAddress *)self->_spokenStructuredAddress hash] ^ v3;
}

@end