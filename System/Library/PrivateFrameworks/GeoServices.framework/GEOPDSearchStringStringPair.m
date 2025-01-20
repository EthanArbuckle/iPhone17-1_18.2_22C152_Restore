@interface GEOPDSearchStringStringPair
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (GEOPDSearchStringStringPair)init;
- (GEOPDSearchStringStringPair)initWithData:(id)a3;
- (id)_dictionaryRepresentation:(uint64_t)a1;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (uint64_t)_initWithDictionary:(void *)a1 isJSON:(void *)a2;
- (unint64_t)hash;
- (void)readAll:(uint64_t)a1;
- (void)writeTo:(id)a3;
@end

@implementation GEOPDSearchStringStringPair

- (GEOPDSearchStringStringPair)init
{
  v6.receiver = self;
  v6.super_class = (Class)GEOPDSearchStringStringPair;
  v2 = [(GEOPDSearchStringStringPair *)&v6 init];
  v3 = v2;
  if (v2)
  {
    v2->_readerLock._os_unfair_lock_opaque = 0;
    v4 = v2;
  }

  return v3;
}

- (GEOPDSearchStringStringPair)initWithData:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)GEOPDSearchStringStringPair;
  v3 = [(GEOPDSearchStringStringPair *)&v7 initWithData:a3];
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
  v8.super_class = (Class)GEOPDSearchStringStringPair;
  v4 = [(GEOPDSearchStringStringPair *)&v8 description];
  v5 = [(GEOPDSearchStringStringPair *)self dictionaryRepresentation];
  objc_super v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  if (a1)
  {
    -[GEOPDSearchStringStringPair readAll:](a1, 1);
    v2 = [MEMORY[0x1E4F1CA60] dictionary];
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 40));
    if ((*(unsigned char *)(a1 + 44) & 1) == 0)
    {
      v3 = *(void **)(a1 + 8);
      if (v3)
      {
        id v4 = v3;
        objc_sync_enter(v4);
        GEOPDSearchStringStringPairReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readKey_tags_2388);
        objc_sync_exit(v4);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 40));
    id v5 = *(id *)(a1 + 16);
    if (v5) {
      [v2 setObject:v5 forKey:@"key"];
    }

    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 40));
    if ((*(unsigned char *)(a1 + 44) & 2) == 0)
    {
      objc_super v6 = *(void **)(a1 + 8);
      if (v6)
      {
        id v7 = v6;
        objc_sync_enter(v7);
        GEOPDSearchStringStringPairReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readVal_tags);
        objc_sync_exit(v7);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 40));
    id v8 = *(id *)(a1 + 24);
    if (v8) {
      [v2 setObject:v8 forKey:@"val"];
    }
  }
  else
  {
    v2 = 0;
  }

  return v2;
}

- (void)readAll:(uint64_t)a1
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 40));
    id v4 = *(void **)(a1 + 8);
    if (v4)
    {
      id v5 = v4;
      objc_sync_enter(v5);
      if (a2) {
        objc_super v6 = (int *)&readAll__recursiveTag_2389;
      }
      else {
        objc_super v6 = (int *)&readAll__nonRecursiveTag_2390;
      }
      GEOPDSearchStringStringPairReadSpecified(a1, *(void *)(a1 + 8), v6);
      objc_sync_exit(v5);
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 40));
  }
}

- (uint64_t)_initWithDictionary:(void *)a1 isJSON:(void *)a2
{
  id v3 = a2;
  uint64_t v4 = [a1 init];
  if (v4)
  {
    id v5 = [v3 objectForKeyedSubscript:@"key"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      objc_super v6 = (void *)[v5 copy];
      id v7 = v6;
      *(unsigned char *)(v4 + 44) |= 1u;
      *(unsigned char *)(v4 + 44) |= 4u;
      objc_storeStrong((id *)(v4 + 16), v6);
    }
    id v8 = [v3 objectForKeyedSubscript:@"val"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v9 = (void *)[v8 copy];
      id v10 = v9;
      *(unsigned char *)(v4 + 44) |= 2u;
      *(unsigned char *)(v4 + 44) |= 4u;
      objc_storeStrong((id *)(v4 + 24), v9);
    }
  }

  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return GEOPDSearchStringStringPairReadAllFrom((uint64_t)self, a3, 0);
}

- (void)writeTo:(id)a3
{
  id v7 = a3;
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  if (self->_reader && (os_unfair_lock_assert_owner(&self->_readerLock), (*(unsigned char *)&self->_flags & 7) == 0))
  {
    id v5 = self->_reader;
    objc_sync_enter(v5);
    *(void *)((char *)self->_reader + (int)*MEMORY[0x1E4F940E0]) = self->_readerMarkLength;
    [(PBDataReader *)self->_reader seekToOffset:self->_readerMarkPos];
    objc_super v6 = [(PBDataReader *)self->_reader readBytes:self->_readerMarkLength - self->_readerMarkPos];
    [v7 writeData:v6];
    os_unfair_lock_unlock(p_readerLock);

    objc_sync_exit(v5);
  }
  else
  {
    os_unfair_lock_unlock(&self->_readerLock);
    -[GEOPDSearchStringStringPair readAll:]((uint64_t)self, 0);
    PBDataWriterWriteStringField();
    PBDataWriterWriteStringField();
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  os_unfair_lock_lock(&self->_readerLock);
  reader = self->_reader;
  if (!reader) {
    goto LABEL_5;
  }
  id v7 = reader;
  objc_sync_enter(v7);
  if ((*(unsigned char *)&self->_flags & 4) != 0)
  {
    objc_sync_exit(v7);

LABEL_5:
    os_unfair_lock_unlock(&self->_readerLock);
    -[GEOPDSearchStringStringPair readAll:]((uint64_t)self, 0);
    uint64_t v8 = [(NSString *)self->_key copyWithZone:a3];
    v9 = (void *)v5[2];
    v5[2] = v8;

    uint64_t v10 = [(NSString *)self->_val copyWithZone:a3];
    id v7 = (PBDataReader *)v5[3];
    v5[3] = v10;
    goto LABEL_6;
  }
  *(void *)((char *)self->_reader + (int)*MEMORY[0x1E4F940E0]) = self->_readerMarkLength;
  [(PBDataReader *)self->_reader seekToOffset:self->_readerMarkPos];
  GEOPDSearchStringStringPairReadAllFrom((uint64_t)v5, self->_reader, 0);
  os_unfair_lock_unlock(&self->_readerLock);
  objc_sync_exit(v7);
LABEL_6:

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v4 = a3;
  if ([v4 isMemberOfClass:objc_opt_class()]
    && ((-[GEOPDSearchStringStringPair readAll:]((uint64_t)self, 1),
         -[GEOPDSearchStringStringPair readAll:]((uint64_t)v4, 1),
         key = self->_key,
         !((unint64_t)key | v4[2]))
     || -[NSString isEqual:](key, "isEqual:")))
  {
    val = self->_val;
    if ((unint64_t)val | v4[3]) {
      char v7 = -[NSString isEqual:](val, "isEqual:");
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
  -[GEOPDSearchStringStringPair readAll:]((uint64_t)self, 1);
  NSUInteger v3 = [(NSString *)self->_key hash];
  return [(NSString *)self->_val hash] ^ v3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_val, 0);
  objc_storeStrong((id *)&self->_key, 0);

  objc_storeStrong((id *)&self->_reader, 0);
}

@end