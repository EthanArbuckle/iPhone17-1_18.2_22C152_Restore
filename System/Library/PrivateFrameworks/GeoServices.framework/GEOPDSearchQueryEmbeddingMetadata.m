@interface GEOPDSearchQueryEmbeddingMetadata
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (GEOPDSearchQueryEmbeddingMetadata)init;
- (GEOPDSearchQueryEmbeddingMetadata)initWithData:(id)a3;
- (id)_dictionaryRepresentation:(uint64_t)a1;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)jsonRepresentation;
- (unint64_t)hash;
- (void)_addNoFlagsModelVersion:(uint64_t)a1;
- (void)addModelVersion:(uint64_t)a1;
- (void)dealloc;
- (void)readAll:(uint64_t)a1;
- (void)writeTo:(id)a3;
@end

@implementation GEOPDSearchQueryEmbeddingMetadata

- (GEOPDSearchQueryEmbeddingMetadata)init
{
  v6.receiver = self;
  v6.super_class = (Class)GEOPDSearchQueryEmbeddingMetadata;
  v2 = [(GEOPDSearchQueryEmbeddingMetadata *)&v6 init];
  v3 = v2;
  if (v2)
  {
    v2->_readerLock._os_unfair_lock_opaque = 0;
    v4 = v2;
  }

  return v3;
}

- (GEOPDSearchQueryEmbeddingMetadata)initWithData:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)GEOPDSearchQueryEmbeddingMetadata;
  v3 = [(GEOPDSearchQueryEmbeddingMetadata *)&v7 initWithData:a3];
  v4 = v3;
  if (v3)
  {
    v3->_readerLock._os_unfair_lock_opaque = 0;
    v5 = v3;
  }

  return v4;
}

- (void)dealloc
{
  PBRepeatedFloatClear();
  v3.receiver = self;
  v3.super_class = (Class)GEOPDSearchQueryEmbeddingMetadata;
  [(GEOPDSearchQueryEmbeddingMetadata *)&v3 dealloc];
}

- (void)addModelVersion:(uint64_t)a1
{
  if (a1)
  {
    id v3 = a2;
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 64));
    if ((*(unsigned char *)(a1 + 68) & 4) == 0)
    {
      v4 = *(void **)(a1 + 8);
      if (v4)
      {
        id v5 = v4;
        objc_sync_enter(v5);
        GEOPDSearchQueryEmbeddingMetadataReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readModelVersions_tags_1334);
        objc_sync_exit(v5);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 64));
    -[GEOPDSearchQueryEmbeddingMetadata _addNoFlagsModelVersion:](a1, v3);

    os_unfair_lock_lock_with_options();
    *(unsigned char *)(a1 + 68) |= 4u;
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 64));
    *(unsigned char *)(a1 + 68) |= 8u;
  }
}

- (void)_addNoFlagsModelVersion:(uint64_t)a1
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

- (id)description
{
  id v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)GEOPDSearchQueryEmbeddingMetadata;
  v4 = [(GEOPDSearchQueryEmbeddingMetadata *)&v8 description];
  id v5 = [(GEOPDSearchQueryEmbeddingMetadata *)self dictionaryRepresentation];
  objc_super v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEOPDSearchQueryEmbeddingMetadata _dictionaryRepresentation:]((uint64_t)self, 0);
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  if (a1)
  {
    -[GEOPDSearchQueryEmbeddingMetadata readAll:](a1, 1);
    v4 = [MEMORY[0x1E4F1CA60] dictionary];
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 64));
    if ((*(unsigned char *)(a1 + 68) & 2) == 0)
    {
      id v5 = *(void **)(a1 + 8);
      if (v5)
      {
        id v6 = v5;
        objc_sync_enter(v6);
        GEOPDSearchQueryEmbeddingMetadataReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readEmbeddingId_tags);
        objc_sync_exit(v6);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 64));
    id v7 = *(id *)(a1 + 40);
    if (v7)
    {
      if (a2) {
        objc_super v8 = @"embeddingId";
      }
      else {
        objc_super v8 = @"embedding_id";
      }
      [v4 setObject:v7 forKey:v8];
    }

    if (*(void *)(a1 + 24))
    {
      v9 = PBRepeatedFloatNSArray();
      [v4 setObject:v9 forKey:@"embedding"];
    }
    if ([*(id *)(a1 + 48) count])
    {
      v10 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(*(id *)(a1 + 48), "count"));
      long long v19 = 0u;
      long long v20 = 0u;
      long long v21 = 0u;
      long long v22 = 0u;
      id v11 = *(id *)(a1 + 48);
      uint64_t v12 = [v11 countByEnumeratingWithState:&v19 objects:v23 count:16];
      if (v12)
      {
        uint64_t v13 = *(void *)v20;
        do
        {
          for (uint64_t i = 0; i != v12; ++i)
          {
            if (*(void *)v20 != v13) {
              objc_enumerationMutation(v11);
            }
            v15 = *(void **)(*((void *)&v19 + 1) + 8 * i);
            if (a2) {
              [v15 jsonRepresentation];
            }
            else {
            v16 = objc_msgSend(v15, "dictionaryRepresentation", (void)v19);
            }
            objc_msgSend(v10, "addObject:", v16, (void)v19);
          }
          uint64_t v12 = [v11 countByEnumeratingWithState:&v19 objects:v23 count:16];
        }
        while (v12);
      }

      if (a2) {
        v17 = @"modelVersion";
      }
      else {
        v17 = @"model_version";
      }
      objc_msgSend(v4, "setObject:forKey:", v10, v17, (void)v19);
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
  return -[GEOPDSearchQueryEmbeddingMetadata _dictionaryRepresentation:]((uint64_t)self, 1);
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
        id v6 = (int *)&readAll__recursiveTag_1344;
      }
      else {
        id v6 = (int *)&readAll__nonRecursiveTag_1345;
      }
      GEOPDSearchQueryEmbeddingMetadataReadSpecified(a1, *(void *)(a1 + 8), v6);
      objc_sync_exit(v5);
    }
    if (a2) {
      _GEOPDSearchQueryEmbeddingMetadataCallReadAllRecursiveWithoutSynchronized(a1);
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 64));
  }
}

- (BOOL)readFrom:(id)a3
{
  return GEOPDSearchQueryEmbeddingMetadataReadAllFrom((uint64_t)self, a3, 0);
}

- (void)writeTo:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  if (self->_reader && (_GEOPDSearchQueryEmbeddingMetadataIsDirty((uint64_t)self) & 1) == 0)
  {
    id v11 = self->_reader;
    objc_sync_enter(v11);
    *(void *)((char *)self->_reader + (int)*MEMORY[0x1E4F940E0]) = self->_readerMarkLength;
    [(PBDataReader *)self->_reader seekToOffset:self->_readerMarkPos];
    uint64_t v12 = [(PBDataReader *)self->_reader readBytes:self->_readerMarkLength - self->_readerMarkPos];
    [v4 writeData:v12];
    os_unfair_lock_unlock(p_readerLock);

    objc_sync_exit(v11);
  }
  else
  {
    os_unfair_lock_unlock(&self->_readerLock);
    -[GEOPDSearchQueryEmbeddingMetadata readAll:]((uint64_t)self, 0);
    if (self->_embeddingId) {
      PBDataWriterWriteStringField();
    }
    if (self->_embeddings.count)
    {
      unint64_t v6 = 0;
      do
      {
        PBDataWriterWriteFloatField();
        ++v6;
      }
      while (v6 < self->_embeddings.count);
    }
    long long v15 = 0u;
    long long v16 = 0u;
    long long v13 = 0u;
    long long v14 = 0u;
    id v7 = self->_modelVersions;
    uint64_t v8 = [(NSMutableArray *)v7 countByEnumeratingWithState:&v13 objects:v17 count:16];
    if (v8)
    {
      uint64_t v9 = *(void *)v14;
      do
      {
        for (uint64_t i = 0; i != v8; ++i)
        {
          if (*(void *)v14 != v9) {
            objc_enumerationMutation(v7);
          }
          PBDataWriterWriteSubmessage();
        }
        uint64_t v8 = [(NSMutableArray *)v7 countByEnumeratingWithState:&v13 objects:v17 count:16];
      }
      while (v8);
    }
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  os_unfair_lock_lock(&self->_readerLock);
  reader = self->_reader;
  if (reader)
  {
    id v7 = reader;
    objc_sync_enter(v7);
    if ((*(unsigned char *)&self->_flags & 8) == 0)
    {
      *(void *)((char *)self->_reader + (int)*MEMORY[0x1E4F940E0]) = self->_readerMarkLength;
      [(PBDataReader *)self->_reader seekToOffset:self->_readerMarkPos];
      GEOPDSearchQueryEmbeddingMetadataReadAllFrom((uint64_t)v5, self->_reader, 0);
      os_unfair_lock_unlock(&self->_readerLock);
      objc_sync_exit(v7);

      return v5;
    }
    objc_sync_exit(v7);
  }
  os_unfair_lock_unlock(&self->_readerLock);
  -[GEOPDSearchQueryEmbeddingMetadata readAll:]((uint64_t)self, 0);
  uint64_t v8 = [(NSString *)self->_embeddingId copyWithZone:a3];
  uint64_t v9 = (void *)v5[5];
  v5[5] = v8;

  PBRepeatedFloatCopy();
  long long v18 = 0u;
  long long v19 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  v10 = self->_modelVersions;
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
        -[GEOPDSearchQueryEmbeddingMetadata addModelVersion:]((uint64_t)v5, v14);
      }
      uint64_t v11 = [(NSMutableArray *)v10 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v11);
  }

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if ([v4 isMemberOfClass:objc_opt_class()]
    && ((-[GEOPDSearchQueryEmbeddingMetadata readAll:]((uint64_t)self, 1),
         -[GEOPDSearchQueryEmbeddingMetadata readAll:]((uint64_t)v4, 1),
         embeddingId = self->_embeddingId,
         !((unint64_t)embeddingId | v4[5]))
     || -[NSString isEqual:](embeddingId, "isEqual:"))
    && PBRepeatedFloatIsEqual())
  {
    modelVersions = self->_modelVersions;
    if ((unint64_t)modelVersions | v4[6]) {
      char v7 = -[NSMutableArray isEqual:](modelVersions, "isEqual:");
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
  -[GEOPDSearchQueryEmbeddingMetadata readAll:]((uint64_t)self, 1);
  NSUInteger v3 = [(NSString *)self->_embeddingId hash];
  uint64_t v4 = PBRepeatedFloatHash() ^ v3;
  return v4 ^ [(NSMutableArray *)self->_modelVersions hash];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_modelVersions, 0);
  objc_storeStrong((id *)&self->_embeddingId, 0);

  objc_storeStrong((id *)&self->_reader, 0);
}

@end