@interface GEOAttributeKeyValue
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (GEOAttributeKeyValue)init;
- (GEOAttributeKeyValue)initWithData:(id)a3;
- (id)_dictionaryRepresentation:(uint64_t)a1;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)jsonRepresentation;
- (uint64_t)_initWithDictionary:(uint64_t)a1 isJSON:(void *)a2;
- (unint64_t)hash;
- (void)clearUnknownFields:(uint64_t)a1;
- (void)readAll:(uint64_t)a1;
- (void)writeTo:(id)a3;
@end

@implementation GEOAttributeKeyValue

- (GEOAttributeKeyValue)init
{
  v6.receiver = self;
  v6.super_class = (Class)GEOAttributeKeyValue;
  v2 = [(GEOAttributeKeyValue *)&v6 init];
  v3 = v2;
  if (v2)
  {
    v2->_readerLock._os_unfair_lock_opaque = 0;
    v4 = v2;
  }

  return v3;
}

- (GEOAttributeKeyValue)initWithData:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)GEOAttributeKeyValue;
  v3 = [(GEOAttributeKeyValue *)&v7 initWithData:a3];
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
  v8.super_class = (Class)GEOAttributeKeyValue;
  v4 = [(GEOAttributeKeyValue *)&v8 description];
  v5 = [(GEOAttributeKeyValue *)self dictionaryRepresentation];
  objc_super v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEOAttributeKeyValue _dictionaryRepresentation:]((uint64_t)self, 0);
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  if (a1)
  {
    -[GEOAttributeKeyValue readAll:](a1, 1);
    v4 = [MEMORY[0x1E4F1CA60] dictionary];
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 48));
    if ((*(unsigned char *)(a1 + 52) & 2) == 0)
    {
      v5 = *(void **)(a1 + 8);
      if (v5)
      {
        id v6 = v5;
        objc_sync_enter(v6);
        GEOAttributeKeyValueReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readAttributeKey_tags);
        objc_sync_exit(v6);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 48));
    id v7 = *(id *)(a1 + 24);
    if (v7) {
      [v4 setObject:v7 forKey:@"attributeKey"];
    }

    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 48));
    if ((*(unsigned char *)(a1 + 52) & 4) == 0)
    {
      objc_super v8 = *(void **)(a1 + 8);
      if (v8)
      {
        id v9 = v8;
        objc_sync_enter(v9);
        GEOAttributeKeyValueReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readAttributeValue_tags_0);
        objc_sync_exit(v9);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 48));
    id v10 = *(id *)(a1 + 32);
    if (v10) {
      [v4 setObject:v10 forKey:@"attributeValue"];
    }

    v11 = *(void **)(a1 + 16);
    if (v11)
    {
      v12 = [v11 dictionaryRepresentation];
      v13 = v12;
      if (a2)
      {
        v14 = objc_msgSend(MEMORY[0x1E4F1CA60], "dictionaryWithCapacity:", objc_msgSend(v12, "count"));
        v18[0] = MEMORY[0x1E4F143A8];
        v18[1] = 3221225472;
        v18[2] = __50__GEOAttributeKeyValue__dictionaryRepresentation___block_invoke;
        v18[3] = &unk_1E53D8860;
        id v15 = v14;
        id v19 = v15;
        [v13 enumerateKeysAndObjectsUsingBlock:v18];
        id v16 = v15;

        v13 = v16;
      }
      [v4 setObject:v13 forKey:@"Unknown Fields"];
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
  return -[GEOAttributeKeyValue _dictionaryRepresentation:]((uint64_t)self, 1);
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
        id v6 = (int *)&readAll__recursiveTag_162_0;
      }
      else {
        id v6 = (int *)&readAll__nonRecursiveTag_163_0;
      }
      GEOAttributeKeyValueReadSpecified(a1, *(void *)(a1 + 8), v6);
      objc_sync_exit(v5);
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 48));
  }
}

void __50__GEOAttributeKeyValue__dictionaryRepresentation___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v10 = a2;
  id v5 = a3;
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();
  id v7 = *(void **)(a1 + 32);
  if (isKindOfClass)
  {
    objc_super v8 = [v5 base64EncodedStringWithOptions:0];
    id v9 = [v10 description];
    [v7 setObject:v8 forKey:v9];
  }
  else
  {
    objc_super v8 = [v10 description];
    [v7 setObject:v5 forKey:v8];
  }
}

- (uint64_t)_initWithDictionary:(uint64_t)a1 isJSON:(void *)a2
{
  id v3 = a2;
  if (a1)
  {
    a1 = [(id)a1 init];
    if (a1)
    {
      v4 = [v3 objectForKeyedSubscript:@"attributeKey"];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        id v5 = (void *)[v4 copy];
        id v6 = v5;
        *(unsigned char *)(a1 + 52) |= 2u;
        *(unsigned char *)(a1 + 52) |= 8u;
        objc_storeStrong((id *)(a1 + 24), v5);
      }
      id v7 = [v3 objectForKeyedSubscript:@"attributeValue"];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        objc_super v8 = (void *)[v7 copy];
        id v9 = v8;
        *(unsigned char *)(a1 + 52) |= 4u;
        *(unsigned char *)(a1 + 52) |= 8u;
        objc_storeStrong((id *)(a1 + 32), v8);
      }
    }
  }

  return a1;
}

- (BOOL)readFrom:(id)a3
{
  return GEOAttributeKeyValueReadAllFrom((uint64_t)self, a3, 0);
}

- (void)writeTo:(id)a3
{
  id v7 = a3;
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  if (self->_reader && (os_unfair_lock_assert_owner(&self->_readerLock), (*(unsigned char *)&self->_flags & 0xE) == 0))
  {
    id v5 = self->_reader;
    objc_sync_enter(v5);
    *(void *)((char *)self->_reader + (int)*MEMORY[0x1E4F940E0]) = self->_readerMarkLength;
    [(PBDataReader *)self->_reader seekToOffset:self->_readerMarkPos];
    id v6 = [(PBDataReader *)self->_reader readBytes:self->_readerMarkLength - self->_readerMarkPos];
    [v7 writeData:v6];
    os_unfair_lock_unlock(p_readerLock);

    objc_sync_exit(v5);
  }
  else
  {
    os_unfair_lock_unlock(&self->_readerLock);
    -[GEOAttributeKeyValue readAll:]((uint64_t)self, 0);
    PBDataWriterWriteStringField();
    PBDataWriterWriteStringField();
    [(PBUnknownFields *)self->_unknownFields writeTo:v7];
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
    -[GEOAttributeKeyValue readAll:]((uint64_t)self, 0);
    uint64_t v8 = [(NSString *)self->_attributeKey copyWithZone:a3];
    id v9 = *(void **)(v5 + 24);
    *(void *)(v5 + 24) = v8;

    uint64_t v10 = [(NSString *)self->_attributeValue copyWithZone:a3];
    v11 = *(void **)(v5 + 32);
    *(void *)(v5 + 32) = v10;

    objc_storeStrong((id *)(v5 + 16), self->_unknownFields);
    return (id)v5;
  }
  *(void *)((char *)self->_reader + (int)*MEMORY[0x1E4F940E0]) = self->_readerMarkLength;
  [(PBDataReader *)self->_reader seekToOffset:self->_readerMarkPos];
  GEOAttributeKeyValueReadAllFrom(v5, self->_reader, 0);
  os_unfair_lock_unlock(&self->_readerLock);
  objc_sync_exit(v7);

  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  v4 = a3;
  if ([v4 isMemberOfClass:objc_opt_class()]
    && ((-[GEOAttributeKeyValue readAll:]((uint64_t)self, 1),
         -[GEOAttributeKeyValue readAll:]((uint64_t)v4, 1),
         attributeKey = self->_attributeKey,
         !((unint64_t)attributeKey | v4[3]))
     || -[NSString isEqual:](attributeKey, "isEqual:")))
  {
    attributeValue = self->_attributeValue;
    if ((unint64_t)attributeValue | v4[4]) {
      char v7 = -[NSString isEqual:](attributeValue, "isEqual:");
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
  -[GEOAttributeKeyValue readAll:]((uint64_t)self, 1);
  NSUInteger v3 = [(NSString *)self->_attributeKey hash];
  return [(NSString *)self->_attributeValue hash] ^ v3;
}

- (void)clearUnknownFields:(uint64_t)a1
{
  if (a1)
  {
    os_unfair_lock_lock_with_options();
    *(unsigned char *)(a1 + 52) |= 1u;
    *(unsigned char *)(a1 + 52) |= 8u;
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 48));
    v4 = *(void **)(a1 + 16);
    *(void *)(a1 + 16) = 0;

    if (a2)
    {
      -[GEOAttributeKeyValue readAll:](a1, 0);
    }
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_attributeValue, 0);
  objc_storeStrong((id *)&self->_attributeKey, 0);
  objc_storeStrong((id *)&self->_unknownFields, 0);

  objc_storeStrong((id *)&self->_reader, 0);
}

@end