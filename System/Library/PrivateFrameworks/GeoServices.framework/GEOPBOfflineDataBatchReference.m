@interface GEOPBOfflineDataBatchReference
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (GEOPBOfflineDataBatchReference)init;
- (GEOPBOfflineDataBatchReference)initWithData:(id)a3;
- (id)_dictionaryRepresentation:(uint64_t)a1;
- (id)batchIdentifier;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)jsonRepresentation;
- (id)url;
- (unint64_t)hash;
- (void)_readBatchIdentifier;
- (void)_readUrl;
- (void)readAll:(uint64_t)a1;
- (void)writeTo:(id)a3;
@end

@implementation GEOPBOfflineDataBatchReference

- (GEOPBOfflineDataBatchReference)init
{
  v6.receiver = self;
  v6.super_class = (Class)GEOPBOfflineDataBatchReference;
  v2 = [(GEOPBOfflineDataBatchReference *)&v6 init];
  v3 = v2;
  if (v2)
  {
    v2->_readerLock._os_unfair_lock_opaque = 0;
    v4 = v2;
  }

  return v3;
}

- (GEOPBOfflineDataBatchReference)initWithData:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)GEOPBOfflineDataBatchReference;
  v3 = [(GEOPBOfflineDataBatchReference *)&v7 initWithData:a3];
  v4 = v3;
  if (v3)
  {
    v3->_readerLock._os_unfair_lock_opaque = 0;
    v5 = v3;
  }

  return v4;
}

- (void)_readBatchIdentifier
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 56));
    if ((*(unsigned char *)(a1 + 60) & 4) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOPBOfflineDataBatchReferenceReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readBatchIdentifier_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 56));
  }
}

- (id)batchIdentifier
{
  if (a1)
  {
    v2 = a1;
    -[GEOPBOfflineDataBatchReference _readBatchIdentifier]((uint64_t)a1);
    a1 = (id *)v2[3];
    uint64_t v1 = vars8;
  }
  return a1;
}

- (void)_readUrl
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 56));
    if ((*(unsigned char *)(a1 + 60) & 8) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOPBOfflineDataBatchReferenceReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readUrl_tags_9);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 56));
  }
}

- (id)url
{
  if (a1)
  {
    v2 = a1;
    -[GEOPBOfflineDataBatchReference _readUrl]((uint64_t)a1);
    a1 = (id *)v2[5];
    uint64_t v1 = vars8;
  }
  return a1;
}

- (id)description
{
  id v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)GEOPBOfflineDataBatchReference;
  v4 = [(GEOPBOfflineDataBatchReference *)&v8 description];
  v5 = [(GEOPBOfflineDataBatchReference *)self dictionaryRepresentation];
  objc_super v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEOPBOfflineDataBatchReference _dictionaryRepresentation:]((uint64_t)self, 0);
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  if (a1)
  {
    -[GEOPBOfflineDataBatchReference readAll:](a1, 1);
    v4 = [MEMORY[0x1E4F1CA60] dictionary];
    v5 = -[GEOPBOfflineDataBatchReference batchIdentifier]((id *)a1);
    objc_super v6 = v5;
    if (v5)
    {
      if (a2)
      {
        objc_super v7 = [v5 base64EncodedStringWithOptions:0];
        [v4 setObject:v7 forKey:@"batchIdentifier"];
      }
      else
      {
        [v4 setObject:v5 forKey:@"batch_identifier"];
      }
    }

    objc_super v8 = -[GEOPBOfflineDataBatchReference url]((id *)a1);
    if (v8) {
      [v4 setObject:v8 forKey:@"url"];
    }

    char v9 = *(unsigned char *)(a1 + 60);
    if ((v9 & 2) != 0)
    {
      v10 = [NSNumber numberWithUnsignedLongLong:*(void *)(a1 + 32)];
      if (a2) {
        v11 = @"batchSizeBytes";
      }
      else {
        v11 = @"batch_size_bytes";
      }
      [v4 setObject:v10 forKey:v11];

      char v9 = *(unsigned char *)(a1 + 60);
    }
    if (v9)
    {
      v12 = [NSNumber numberWithUnsignedLongLong:*(void *)(a1 + 16)];
      if (a2) {
        v13 = @"batchCompressedSizeBytes";
      }
      else {
        v13 = @"batch_compressed_size_bytes";
      }
      [v4 setObject:v12 forKey:v13];
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
  return -[GEOPBOfflineDataBatchReference _dictionaryRepresentation:]((uint64_t)self, 1);
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
        objc_super v6 = (int *)&readAll__recursiveTag_88;
      }
      else {
        objc_super v6 = (int *)&readAll__nonRecursiveTag_88;
      }
      GEOPBOfflineDataBatchReferenceReadSpecified(a1, *(void *)(a1 + 8), v6);
      objc_sync_exit(v5);
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 56));
  }
}

- (BOOL)readFrom:(id)a3
{
  return GEOPBOfflineDataBatchReferenceReadAllFrom((uint64_t)self, a3);
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
    -[GEOPBOfflineDataBatchReference readAll:]((uint64_t)self, 0);
    if (self->_batchIdentifier) {
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
    objc_super v7 = reader;
    objc_sync_enter(v7);
    if ((*(unsigned char *)&self->_flags & 0x10) == 0)
    {
      *(void *)((char *)self->_reader + (int)*MEMORY[0x1E4F940E0]) = self->_readerMarkLength;
      [(PBDataReader *)self->_reader seekToOffset:self->_readerMarkPos];
      GEOPBOfflineDataBatchReferenceReadAllFrom(v5, self->_reader);
      os_unfair_lock_unlock(&self->_readerLock);
      id v8 = (id)v5;
      objc_sync_exit(v7);

      return (id)v5;
    }
    objc_sync_exit(v7);
  }
  os_unfair_lock_unlock(&self->_readerLock);
  -[GEOPBOfflineDataBatchReference readAll:]((uint64_t)self, 0);
  uint64_t v9 = [(NSData *)self->_batchIdentifier copyWithZone:a3];
  v10 = *(void **)(v5 + 24);
  *(void *)(v5 + 24) = v9;

  uint64_t v11 = [(NSString *)self->_url copyWithZone:a3];
  v12 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v11;

  char flags = (char)self->_flags;
  if ((flags & 2) != 0)
  {
    *(void *)(v5 + 32) = self->_batchSizeBytes;
    *(unsigned char *)(v5 + 60) |= 2u;
    char flags = (char)self->_flags;
  }
  if (flags)
  {
    *(void *)(v5 + 16) = self->_batchCompressedSizeBytes;
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
  -[GEOPBOfflineDataBatchReference readAll:]((uint64_t)self, 1);
  -[GEOPBOfflineDataBatchReference readAll:]((uint64_t)v4, 1);
  batchIdentifier = self->_batchIdentifier;
  if ((unint64_t)batchIdentifier | *((void *)v4 + 3))
  {
    if (!-[NSData isEqual:](batchIdentifier, "isEqual:")) {
      goto LABEL_15;
    }
  }
  url = self->_url;
  if ((unint64_t)url | *((void *)v4 + 5))
  {
    if (!-[NSString isEqual:](url, "isEqual:")) {
      goto LABEL_15;
    }
  }
  if ((*(unsigned char *)&self->_flags & 2) != 0)
  {
    if ((*((unsigned char *)v4 + 60) & 2) == 0 || self->_batchSizeBytes != *((void *)v4 + 4)) {
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
    if ((*((unsigned char *)v4 + 60) & 1) == 0 || self->_batchCompressedSizeBytes != *((void *)v4 + 2)) {
      goto LABEL_15;
    }
    BOOL v7 = 1;
  }
LABEL_16:

  return v7;
}

- (unint64_t)hash
{
  -[GEOPBOfflineDataBatchReference readAll:]((uint64_t)self, 1);
  uint64_t v3 = [(NSData *)self->_batchIdentifier hash];
  NSUInteger v4 = [(NSString *)self->_url hash];
  if ((*(unsigned char *)&self->_flags & 2) != 0)
  {
    unint64_t v5 = 2654435761u * self->_batchSizeBytes;
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
  unint64_t v6 = 2654435761u * self->_batchCompressedSizeBytes;
  return v4 ^ v3 ^ v5 ^ v6;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_url, 0);
  objc_storeStrong((id *)&self->_batchIdentifier, 0);

  objc_storeStrong((id *)&self->_reader, 0);
}

@end