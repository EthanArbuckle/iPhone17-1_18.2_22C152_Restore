@interface GEOPBOfflineDataKeyValueReference
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (GEOPBOfflineDataKeyValueReference)init;
- (GEOPBOfflineDataKeyValueReference)initWithData:(id)a3;
- (id)_dictionaryRepresentation:(uint64_t)a1;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)jsonRepresentation;
- (unint64_t)hash;
- (void)readAll:(uint64_t)a1;
- (void)writeTo:(id)a3;
@end

@implementation GEOPBOfflineDataKeyValueReference

- (GEOPBOfflineDataKeyValueReference)init
{
  v6.receiver = self;
  v6.super_class = (Class)GEOPBOfflineDataKeyValueReference;
  v2 = [(GEOPBOfflineDataKeyValueReference *)&v6 init];
  v3 = v2;
  if (v2)
  {
    v2->_readerLock._os_unfair_lock_opaque = 0;
    v4 = v2;
  }

  return v3;
}

- (GEOPBOfflineDataKeyValueReference)initWithData:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)GEOPBOfflineDataKeyValueReference;
  v3 = [(GEOPBOfflineDataKeyValueReference *)&v7 initWithData:a3];
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
  v8.super_class = (Class)GEOPBOfflineDataKeyValueReference;
  v4 = [(GEOPBOfflineDataKeyValueReference *)&v8 description];
  v5 = [(GEOPBOfflineDataKeyValueReference *)self dictionaryRepresentation];
  objc_super v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEOPBOfflineDataKeyValueReference _dictionaryRepresentation:]((uint64_t)self, 0);
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  if (a1)
  {
    -[GEOPBOfflineDataKeyValueReference readAll:](a1, 1);
    v4 = [MEMORY[0x1E4F1CA60] dictionary];
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 56));
    if ((*(unsigned char *)(a1 + 60) & 4) == 0)
    {
      v5 = *(void **)(a1 + 8);
      if (v5)
      {
        id v6 = v5;
        objc_sync_enter(v6);
        GEOPBOfflineDataKeyValueReferenceReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readServiceKey_tags);
        objc_sync_exit(v6);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 56));
    id v7 = *(id *)(a1 + 16);
    objc_super v8 = v7;
    if (v7)
    {
      if (a2)
      {
        v9 = [v7 base64EncodedStringWithOptions:0];
        [v4 setObject:v9 forKey:@"serviceKey"];
      }
      else
      {
        [v4 setObject:v7 forKey:@"service_key"];
      }
    }

    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 56));
    if ((*(unsigned char *)(a1 + 60) & 8) == 0)
    {
      v10 = *(void **)(a1 + 8);
      if (v10)
      {
        id v11 = v10;
        objc_sync_enter(v11);
        GEOPBOfflineDataKeyValueReferenceReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readUrl_tags_252);
        objc_sync_exit(v11);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 56));
    id v12 = *(id *)(a1 + 24);
    if (v12) {
      [v4 setObject:v12 forKey:@"url"];
    }

    char v13 = *(unsigned char *)(a1 + 60);
    if ((v13 & 2) != 0)
    {
      v14 = [NSNumber numberWithUnsignedLongLong:*(void *)(a1 + 40)];
      if (a2) {
        v15 = @"valueSizeBytes";
      }
      else {
        v15 = @"value_size_bytes";
      }
      [v4 setObject:v14 forKey:v15];

      char v13 = *(unsigned char *)(a1 + 60);
    }
    if (v13)
    {
      v16 = [NSNumber numberWithUnsignedLongLong:*(void *)(a1 + 32)];
      if (a2) {
        v17 = @"valueCompressedSizeBytes";
      }
      else {
        v17 = @"value_compressed_size_bytes";
      }
      [v4 setObject:v16 forKey:v17];
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
  return -[GEOPBOfflineDataKeyValueReference _dictionaryRepresentation:]((uint64_t)self, 1);
}

- (void)readAll:(uint64_t)a1
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 56));
    v4 = *(void **)(a1 + 8);
    if (v4)
    {
      id v5 = v4;
      objc_sync_enter(v5);
      if (a2) {
        id v6 = (int *)&readAll__recursiveTag_271;
      }
      else {
        id v6 = (int *)&readAll__nonRecursiveTag_272;
      }
      GEOPBOfflineDataKeyValueReferenceReadSpecified(a1, *(void *)(a1 + 8), v6);
      objc_sync_exit(v5);
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 56));
  }
}

- (BOOL)readFrom:(id)a3
{
  return GEOPBOfflineDataKeyValueReferenceReadAllFrom((uint64_t)self, a3);
}

- (void)writeTo:(id)a3
{
  id v8 = a3;
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  if (self->_reader && (os_unfair_lock_assert_owner(&self->_readerLock), (*(unsigned char *)&self->_flags & 0x1C) == 0))
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
    -[GEOPBOfflineDataKeyValueReference readAll:]((uint64_t)self, 0);
    if (self->_serviceKey) {
      PBDataWriterWriteDataField();
    }
    if (self->_url) {
      PBDataWriterWriteStringField();
    }
    char flags = (char)self->_flags;
    if ((flags & 2) != 0)
    {
      PBDataWriterWriteUint64Field();
      char flags = (char)self->_flags;
    }
    if (flags) {
      PBDataWriterWriteUint64Field();
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
      GEOPBOfflineDataKeyValueReferenceReadAllFrom(v5, self->_reader);
      os_unfair_lock_unlock(&self->_readerLock);
      id v8 = (id)v5;
      objc_sync_exit(v7);

      return (id)v5;
    }
    objc_sync_exit(v7);
  }
  os_unfair_lock_unlock(&self->_readerLock);
  -[GEOPBOfflineDataKeyValueReference readAll:]((uint64_t)self, 0);
  uint64_t v9 = [(NSData *)self->_serviceKey copyWithZone:a3];
  v10 = *(void **)(v5 + 16);
  *(void *)(v5 + 16) = v9;

  uint64_t v11 = [(NSString *)self->_url copyWithZone:a3];
  id v12 = *(void **)(v5 + 24);
  *(void *)(v5 + 24) = v11;

  char flags = (char)self->_flags;
  if ((flags & 2) != 0)
  {
    *(void *)(v5 + 40) = self->_valueSizeBytes;
    *(unsigned char *)(v5 + 60) |= 2u;
    char flags = (char)self->_flags;
  }
  if (flags)
  {
    *(void *)(v5 + 32) = self->_valueCompressedSizeBytes;
    *(unsigned char *)(v5 + 60) |= 1u;
  }
  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_15;
  }
  -[GEOPBOfflineDataKeyValueReference readAll:]((uint64_t)self, 1);
  -[GEOPBOfflineDataKeyValueReference readAll:]((uint64_t)v4, 1);
  serviceKey = self->_serviceKey;
  if ((unint64_t)serviceKey | *((void *)v4 + 2))
  {
    if (!-[NSData isEqual:](serviceKey, "isEqual:")) {
      goto LABEL_15;
    }
  }
  url = self->_url;
  if ((unint64_t)url | *((void *)v4 + 3))
  {
    if (!-[NSString isEqual:](url, "isEqual:")) {
      goto LABEL_15;
    }
  }
  if ((*(unsigned char *)&self->_flags & 2) != 0)
  {
    if ((*((unsigned char *)v4 + 60) & 2) == 0 || self->_valueSizeBytes != *((void *)v4 + 5)) {
      goto LABEL_15;
    }
  }
  else if ((*((unsigned char *)v4 + 60) & 2) != 0)
  {
LABEL_15:
    BOOL v7 = 0;
    goto LABEL_16;
  }
  BOOL v7 = (*((unsigned char *)v4 + 60) & 1) == 0;
  if (*(unsigned char *)&self->_flags)
  {
    if ((*((unsigned char *)v4 + 60) & 1) == 0 || self->_valueCompressedSizeBytes != *((void *)v4 + 4)) {
      goto LABEL_15;
    }
    BOOL v7 = 1;
  }
LABEL_16:

  return v7;
}

- (unint64_t)hash
{
  -[GEOPBOfflineDataKeyValueReference readAll:]((uint64_t)self, 1);
  uint64_t v3 = [(NSData *)self->_serviceKey hash];
  NSUInteger v4 = [(NSString *)self->_url hash];
  if ((*(unsigned char *)&self->_flags & 2) != 0)
  {
    unint64_t v5 = 2654435761u * self->_valueSizeBytes;
    if (*(unsigned char *)&self->_flags) {
      goto LABEL_3;
    }
LABEL_5:
    unint64_t v6 = 0;
    return v4 ^ v3 ^ v5 ^ v6;
  }
  unint64_t v5 = 0;
  if ((*(unsigned char *)&self->_flags & 1) == 0) {
    goto LABEL_5;
  }
LABEL_3:
  unint64_t v6 = 2654435761u * self->_valueCompressedSizeBytes;
  return v4 ^ v3 ^ v5 ^ v6;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_url, 0);
  objc_storeStrong((id *)&self->_serviceKey, 0);

  objc_storeStrong((id *)&self->_reader, 0);
}

@end