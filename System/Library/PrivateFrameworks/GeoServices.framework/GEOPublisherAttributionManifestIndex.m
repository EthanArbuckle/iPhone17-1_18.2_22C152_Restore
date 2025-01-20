@interface GEOPublisherAttributionManifestIndex
+ (BOOL)isValid:(id)a3;
+ (Class)publisherAttributionFilesType;
+ (Class)publisherToFileIndexType;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (GEOPublisherAttributionManifestIndex)init;
- (GEOPublisherAttributionManifestIndex)initWithData:(id)a3;
- (GEOPublisherAttributionManifestIndex)initWithDictionary:(id)a3;
- (GEOPublisherAttributionManifestIndex)initWithJSON:(id)a3;
- (NSMutableArray)publisherAttributionFiles;
- (NSMutableDictionary)publisherToFileIndex;
- (id)_dictionaryRepresentation:(uint64_t)a1;
- (id)_initWithDictionary:(id *)a1 isJSON:(void *)a2;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)publisherAttributionFilesAtIndex:(unint64_t)a3;
- (unint64_t)hash;
- (unint64_t)publisherAttributionFilesCount;
- (unint64_t)publisherToFileIndexCount;
- (unsigned)publisherToFileIndexForKey:(id)a3;
- (void)_addNoFlagsPublisherAttributionFiles:(uint64_t)a1;
- (void)_readPublisherAttributionFiles;
- (void)_readPublisherToFileIndex;
- (void)_setNoFlagsPublisherToFileIndexValue:(void *)a3 forKey:;
- (void)addPublisherAttributionFiles:(id)a3;
- (void)clearPublisherAttributionFiles;
- (void)clearPublisherToFileIndex;
- (void)copyTo:(id)a3;
- (void)enumeratePublisherToFileIndexUsingBlock:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)readAll:(BOOL)a3;
- (void)setPublisherAttributionFiles:(id)a3;
- (void)setPublisherToFileIndex:(id)a3;
- (void)setPublisherToFileIndexValue:(unsigned int)a3 forKey:(id)a4;
- (void)writeTo:(id)a3;
@end

@implementation GEOPublisherAttributionManifestIndex

- (unint64_t)hash
{
  [(GEOPublisherAttributionManifestIndex *)self readAll:1];
  uint64_t v3 = [(NSMutableArray *)self->_publisherAttributionFiles hash];
  return [(NSMutableDictionary *)self->_publisherToFileIndex hash] ^ v3;
}

- (void)readAll:(BOOL)a3
{
  BOOL v3 = a3;
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  reader = self->_reader;
  if (reader)
  {
    v7 = reader;
    objc_sync_enter(v7);
    if (v3) {
      v8 = (int *)&readAll__recursiveTag_42;
    }
    else {
      v8 = (int *)&readAll__nonRecursiveTag_42;
    }
    GEOPublisherAttributionManifestIndexReadSpecified((uint64_t)self, (unint64_t)self->_reader, v8);
    objc_sync_exit(v7);
  }

  os_unfair_lock_unlock(p_readerLock);
}

- (void)_setNoFlagsPublisherToFileIndexValue:(void *)a3 forKey:
{
  id v5 = a3;
  if (a1)
  {
    id v10 = v5;
    v6 = *(void **)(a1 + 24);
    if (!v6)
    {
      id v7 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
      v8 = *(void **)(a1 + 24);
      *(void *)(a1 + 24) = v7;

      v6 = *(void **)(a1 + 24);
    }
    v9 = [NSNumber numberWithUnsignedInt:a2];
    [v6 setObject:v9 forKey:v10];

    id v5 = v10;
  }
}

- (NSMutableDictionary)publisherToFileIndex
{
  -[GEOPublisherAttributionManifestIndex _readPublisherToFileIndex]((uint64_t)self);
  publisherToFileIndex = self->_publisherToFileIndex;

  return publisherToFileIndex;
}

- (unsigned)publisherToFileIndexForKey:(id)a3
{
  id v4 = a3;
  -[GEOPublisherAttributionManifestIndex _readPublisherToFileIndex]((uint64_t)self);
  id v5 = [(NSMutableDictionary *)self->_publisherToFileIndex objectForKey:v4];

  LODWORD(v4) = [v5 unsignedIntValue];
  return v4;
}

- (void)_readPublisherToFileIndex
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
        GEOPublisherAttributionManifestIndexReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readPublisherToFileIndex_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 40));
  }
}

- (NSMutableArray)publisherAttributionFiles
{
  -[GEOPublisherAttributionManifestIndex _readPublisherAttributionFiles]((uint64_t)self);
  publisherAttributionFiles = self->_publisherAttributionFiles;

  return publisherAttributionFiles;
}

- (unint64_t)publisherAttributionFilesCount
{
  -[GEOPublisherAttributionManifestIndex _readPublisherAttributionFiles]((uint64_t)self);
  publisherAttributionFiles = self->_publisherAttributionFiles;

  return [(NSMutableArray *)publisherAttributionFiles count];
}

- (void)_readPublisherAttributionFiles
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
        GEOPublisherAttributionManifestIndexReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readPublisherAttributionFiles_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 40));
  }
}

- (BOOL)readFrom:(id)a3
{
  return GEOPublisherAttributionManifestIndexReadAllFrom((uint64_t)self, a3, 0);
}

- (GEOPublisherAttributionManifestIndex)initWithData:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)GEOPublisherAttributionManifestIndex;
  id v3 = [(GEOPublisherAttributionManifestIndex *)&v7 initWithData:a3];
  id v4 = v3;
  if (v3)
  {
    v3->_readerLock._os_unfair_lock_opaque = 0;
    id v5 = v3;
  }

  return v4;
}

- (void)_addNoFlagsPublisherAttributionFiles:(uint64_t)a1
{
  id v3 = a2;
  if (a1)
  {
    id v4 = *(void **)(a1 + 16);
    id v7 = v3;
    if (!v4)
    {
      id v5 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
      v6 = *(void **)(a1 + 16);
      *(void *)(a1 + 16) = v5;

      id v4 = *(void **)(a1 + 16);
    }
    [v4 addObject:v7];
    id v3 = v7;
  }
}

- (GEOPublisherAttributionManifestIndex)init
{
  v6.receiver = self;
  v6.super_class = (Class)GEOPublisherAttributionManifestIndex;
  v2 = [(GEOPublisherAttributionManifestIndex *)&v6 init];
  id v3 = v2;
  if (v2)
  {
    v2->_readerLock._os_unfair_lock_opaque = 0;
    id v4 = v2;
  }

  return v3;
}

- (void)setPublisherAttributionFiles:(id)a3
{
  id v4 = (NSMutableArray *)a3;
  os_unfair_lock_lock_with_options();
  *(unsigned char *)&self->_flags |= 1u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(unsigned char *)&self->_flags |= 4u;
  publisherAttributionFiles = self->_publisherAttributionFiles;
  self->_publisherAttributionFiles = v4;
}

- (void)clearPublisherAttributionFiles
{
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(unsigned char *)&self->_flags |= 1u;
  os_unfair_lock_unlock(p_readerLock);
  *(unsigned char *)&self->_flags |= 4u;
  publisherAttributionFiles = self->_publisherAttributionFiles;

  [(NSMutableArray *)publisherAttributionFiles removeAllObjects];
}

- (void)addPublisherAttributionFiles:(id)a3
{
  id v4 = a3;
  -[GEOPublisherAttributionManifestIndex _readPublisherAttributionFiles]((uint64_t)self);
  -[GEOPublisherAttributionManifestIndex _addNoFlagsPublisherAttributionFiles:]((uint64_t)self, v4);

  os_unfair_lock_lock_with_options();
  *(unsigned char *)&self->_flags |= 1u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(unsigned char *)&self->_flags |= 4u;
}

- (id)publisherAttributionFilesAtIndex:(unint64_t)a3
{
  -[GEOPublisherAttributionManifestIndex _readPublisherAttributionFiles]((uint64_t)self);
  publisherAttributionFiles = self->_publisherAttributionFiles;

  return (id)[(NSMutableArray *)publisherAttributionFiles objectAtIndex:a3];
}

+ (Class)publisherAttributionFilesType
{
  return (Class)objc_opt_class();
}

- (void)setPublisherToFileIndex:(id)a3
{
  id v4 = (NSMutableDictionary *)a3;
  os_unfair_lock_lock_with_options();
  *(unsigned char *)&self->_flags |= 2u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(unsigned char *)&self->_flags |= 4u;
  publisherToFileIndex = self->_publisherToFileIndex;
  self->_publisherToFileIndex = v4;
}

- (void)clearPublisherToFileIndex
{
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(unsigned char *)&self->_flags |= 2u;
  os_unfair_lock_unlock(p_readerLock);
  *(unsigned char *)&self->_flags |= 4u;
  publisherToFileIndex = self->_publisherToFileIndex;

  [(NSMutableDictionary *)publisherToFileIndex removeAllObjects];
}

- (void)setPublisherToFileIndexValue:(unsigned int)a3 forKey:(id)a4
{
  uint64_t v4 = *(void *)&a3;
  id v6 = a4;
  -[GEOPublisherAttributionManifestIndex _readPublisherToFileIndex]((uint64_t)self);
  -[GEOPublisherAttributionManifestIndex _setNoFlagsPublisherToFileIndexValue:forKey:]((uint64_t)self, v4, v6);

  os_unfair_lock_lock_with_options();
  *(unsigned char *)&self->_flags |= 2u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(unsigned char *)&self->_flags |= 4u;
}

- (void)enumeratePublisherToFileIndexUsingBlock:(id)a3
{
  id v4 = a3;
  -[GEOPublisherAttributionManifestIndex _readPublisherToFileIndex]((uint64_t)self);
  publisherToFileIndex = self->_publisherToFileIndex;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __80__GEOPublisherAttributionManifestIndex_enumeratePublisherToFileIndexUsingBlock___block_invoke;
  v7[3] = &unk_1E53E5898;
  id v8 = v4;
  id v6 = v4;
  [(NSMutableDictionary *)publisherToFileIndex enumerateKeysAndObjectsUsingBlock:v7];
}

void __80__GEOPublisherAttributionManifestIndex_enumeratePublisherToFileIndexUsingBlock___block_invoke(uint64_t a1, void *a2, void *a3, uint64_t a4)
{
  uint64_t v6 = *(void *)(a1 + 32);
  id v7 = a2;
  (*(void (**)(uint64_t, id, uint64_t, uint64_t))(v6 + 16))(v6, v7, [a3 unsignedIntValue], a4);
}

- (unint64_t)publisherToFileIndexCount
{
  -[GEOPublisherAttributionManifestIndex _readPublisherToFileIndex]((uint64_t)self);
  publisherToFileIndex = self->_publisherToFileIndex;

  return [(NSMutableDictionary *)publisherToFileIndex count];
}

+ (Class)publisherToFileIndexType
{
  return (Class)objc_opt_class();
}

- (id)description
{
  id v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)GEOPublisherAttributionManifestIndex;
  id v4 = [(GEOPublisherAttributionManifestIndex *)&v8 description];
  id v5 = [(GEOPublisherAttributionManifestIndex *)self dictionaryRepresentation];
  uint64_t v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  if (a1)
  {
    [(id)a1 readAll:1];
    v2 = [MEMORY[0x1E4F1CA60] dictionary];
    if (*(void *)(a1 + 16))
    {
      id v3 = [(id)a1 publisherAttributionFiles];
      [v2 setObject:v3 forKey:@"publisherAttributionFiles"];
    }
    if ([*(id *)(a1 + 24) count])
    {
      id v4 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA60]), "initWithCapacity:", objc_msgSend(*(id *)(a1 + 24), "count"));
      id v5 = *(void **)(a1 + 24);
      v8[0] = MEMORY[0x1E4F143A8];
      v8[1] = 3221225472;
      v8[2] = __66__GEOPublisherAttributionManifestIndex__dictionaryRepresentation___block_invoke;
      v8[3] = &unk_1E53E0928;
      id v9 = v4;
      id v6 = v4;
      [v5 enumerateKeysAndObjectsUsingBlock:v8];
      [v2 setObject:v6 forKey:@"publisherToFileIndex"];
    }
  }
  else
  {
    v2 = 0;
  }

  return v2;
}

uint64_t __66__GEOPublisherAttributionManifestIndex__dictionaryRepresentation___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return [*(id *)(a1 + 32) setObject:a3 forKey:a2];
}

- (GEOPublisherAttributionManifestIndex)initWithDictionary:(id)a3
{
  return (GEOPublisherAttributionManifestIndex *)-[GEOPublisherAttributionManifestIndex _initWithDictionary:isJSON:]((id *)&self->super.super.isa, a3);
}

- (id)_initWithDictionary:(id *)a1 isJSON:(void *)a2
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if (a1)
  {
    a1 = [a1 init];
    if (a1)
    {
      id v4 = [v3 objectForKeyedSubscript:@"publisherAttributionFiles"];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        long long v29 = 0u;
        long long v30 = 0u;
        long long v27 = 0u;
        long long v28 = 0u;
        id v5 = v4;
        uint64_t v6 = [v5 countByEnumeratingWithState:&v27 objects:v32 count:16];
        if (v6)
        {
          uint64_t v7 = v6;
          uint64_t v8 = *(void *)v28;
          do
          {
            for (uint64_t i = 0; i != v7; ++i)
            {
              if (*(void *)v28 != v8) {
                objc_enumerationMutation(v5);
              }
              id v10 = *(void **)(*((void *)&v27 + 1) + 8 * i);
              objc_opt_class();
              if (objc_opt_isKindOfClass())
              {
                v11 = (void *)[v10 copy];
                [a1 addPublisherAttributionFiles:v11];
              }
            }
            uint64_t v7 = [v5 countByEnumeratingWithState:&v27 objects:v32 count:16];
          }
          while (v7);
        }
      }
      v12 = [v3 objectForKeyedSubscript:@"publisherToFileIndex"];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        uint64_t v13 = [MEMORY[0x1E4F1CA60] dictionary];
        id v14 = a1[3];
        a1[3] = (id)v13;

        long long v25 = 0u;
        long long v26 = 0u;
        long long v23 = 0u;
        long long v24 = 0u;
        id v15 = v12;
        uint64_t v16 = [v15 countByEnumeratingWithState:&v23 objects:v31 count:16];
        if (v16)
        {
          uint64_t v17 = v16;
          uint64_t v18 = *(void *)v24;
          do
          {
            for (uint64_t j = 0; j != v17; ++j)
            {
              if (*(void *)v24 != v18) {
                objc_enumerationMutation(v15);
              }
              uint64_t v20 = *(void *)(*((void *)&v23 + 1) + 8 * j);
              v21 = objc_msgSend(v15, "objectForKeyedSubscript:", v20, (void)v23);
              [a1[3] setObject:v21 forKey:v20];
            }
            uint64_t v17 = [v15 countByEnumeratingWithState:&v23 objects:v31 count:16];
          }
          while (v17);
        }
      }
    }
  }

  return a1;
}

- (GEOPublisherAttributionManifestIndex)initWithJSON:(id)a3
{
  return (GEOPublisherAttributionManifestIndex *)-[GEOPublisherAttributionManifestIndex _initWithDictionary:isJSON:]((id *)&self->super.super.isa, a3);
}

+ (BOOL)isValid:(id)a3
{
  return GEOPublisherAttributionManifestIndexIsValid((char *)a3);
}

- (void)writeTo:(id)a3
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  if (self->_reader && (os_unfair_lock_assert_owner(&self->_readerLock), (*(unsigned char *)&self->_flags & 7) == 0))
  {
    v11 = self->_reader;
    objc_sync_enter(v11);
    *(void *)((char *)self->_reader + (int)*MEMORY[0x1E4F940E0]) = self->_readerMarkLength;
    [(PBDataReader *)self->_reader seekToOffset:self->_readerMarkPos];
    v12 = [(PBDataReader *)self->_reader readBytes:self->_readerMarkLength - self->_readerMarkPos];
    [v4 writeData:v12];
    os_unfair_lock_unlock(p_readerLock);

    objc_sync_exit(v11);
  }
  else
  {
    os_unfair_lock_unlock(&self->_readerLock);
    [(GEOPublisherAttributionManifestIndex *)self readAll:0];
    long long v17 = 0u;
    long long v18 = 0u;
    long long v15 = 0u;
    long long v16 = 0u;
    uint64_t v6 = self->_publisherAttributionFiles;
    uint64_t v7 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v15 objects:v19 count:16];
    if (v7)
    {
      uint64_t v8 = *(void *)v16;
      do
      {
        for (uint64_t i = 0; i != v7; ++i)
        {
          if (*(void *)v16 != v8) {
            objc_enumerationMutation(v6);
          }
          PBDataWriterWriteStringField();
        }
        uint64_t v7 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v15 objects:v19 count:16];
      }
      while (v7);
    }

    publisherToFileIndex = self->_publisherToFileIndex;
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __48__GEOPublisherAttributionManifestIndex_writeTo___block_invoke;
    v13[3] = &unk_1E53E0928;
    id v14 = v4;
    [(NSMutableDictionary *)publisherToFileIndex enumerateKeysAndObjectsUsingBlock:v13];
  }
}

uint64_t __48__GEOPublisherAttributionManifestIndex_writeTo___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4 = a3;
  id v5 = a2;
  PBDataWriterPlaceMark();
  PBDataWriterWriteStringField();

  [v4 unsignedIntValue];
  PBDataWriterWriteUint32Field();
  return PBDataWriterRecallMark();
}

- (void)copyTo:(id)a3
{
  id v4 = (id *)a3;
  [(GEOPublisherAttributionManifestIndex *)self readAll:0];
  os_unfair_lock_lock_with_options();
  objc_storeStrong(v4 + 1, self->_reader);
  *((_DWORD *)v4 + 8) = self->_readerMarkPos;
  *((_DWORD *)v4 + 9) = self->_readerMarkLength;
  os_unfair_lock_unlock(&self->_readerLock);
  if ([(GEOPublisherAttributionManifestIndex *)self publisherAttributionFilesCount])
  {
    [v4 clearPublisherAttributionFiles];
    unint64_t v5 = [(GEOPublisherAttributionManifestIndex *)self publisherAttributionFilesCount];
    if (v5)
    {
      unint64_t v6 = v5;
      for (uint64_t i = 0; i != v6; ++i)
      {
        uint64_t v8 = [(GEOPublisherAttributionManifestIndex *)self publisherAttributionFilesAtIndex:i];
        [v4 addPublisherAttributionFiles:v8];
      }
    }
  }
  if ([(GEOPublisherAttributionManifestIndex *)self publisherToFileIndexCount])
  {
    [v4 clearPublisherToFileIndex];
    if (!v4[3])
    {
      id v9 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
      id v10 = v4[3];
      v4[3] = v9;
    }
    publisherToFileIndex = self->_publisherToFileIndex;
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __47__GEOPublisherAttributionManifestIndex_copyTo___block_invoke;
    v12[3] = &unk_1E53E0928;
    uint64_t v13 = v4;
    [(NSMutableDictionary *)publisherToFileIndex enumerateKeysAndObjectsUsingBlock:v12];
  }
}

void __47__GEOPublisherAttributionManifestIndex_copyTo___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = (id)[a3 copy];
  [*(id *)(*(void *)(a1 + 32) + 24) setObject:v6 forKey:v5];
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
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
      GEOPublisherAttributionManifestIndexReadAllFrom((uint64_t)v5, self->_reader, 0);
      os_unfair_lock_unlock(&self->_readerLock);
      uint64_t v8 = v5;
      objc_sync_exit(v7);

LABEL_14:
      return v5;
    }
    objc_sync_exit(v7);
  }
  os_unfair_lock_unlock(&self->_readerLock);
  [(GEOPublisherAttributionManifestIndex *)self readAll:0];
  long long v23 = 0u;
  long long v24 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  id v9 = self->_publisherAttributionFiles;
  uint64_t v10 = [(NSMutableArray *)v9 countByEnumeratingWithState:&v21 objects:v25 count:16];
  if (v10)
  {
    uint64_t v11 = *(void *)v22;
    do
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v22 != v11) {
          objc_enumerationMutation(v9);
        }
        uint64_t v13 = (void *)[*(id *)(*((void *)&v21 + 1) + 8 * i) copyWithZone:a3];
        [v5 addPublisherAttributionFiles:v13];
      }
      uint64_t v10 = [(NSMutableArray *)v9 countByEnumeratingWithState:&v21 objects:v25 count:16];
    }
    while (v10);
  }

  if ([(NSMutableDictionary *)self->_publisherToFileIndex count])
  {
    [v5 clearPublisherToFileIndex];
    id v14 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
    long long v15 = (void *)v5[3];
    v5[3] = v14;

    publisherToFileIndex = self->_publisherToFileIndex;
    v18[0] = MEMORY[0x1E4F143A8];
    v18[1] = 3221225472;
    v18[2] = __53__GEOPublisherAttributionManifestIndex_copyWithZone___block_invoke;
    v18[3] = &unk_1E53E58C0;
    uint64_t v20 = a3;
    v19 = v5;
    [(NSMutableDictionary *)publisherToFileIndex enumerateKeysAndObjectsUsingBlock:v18];
    uint64_t v8 = v19;
    goto LABEL_14;
  }
  return v5;
}

void __53__GEOPublisherAttributionManifestIndex_copyWithZone___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v5 = *(void *)(a1 + 40);
  id v6 = a2;
  id v7 = (id)[a3 copyWithZone:v5];
  [*(id *)(*(void *)(a1 + 32) + 24) setObject:v7 forKey:v6];
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if ([v4 isMemberOfClass:objc_opt_class()]
    && (([(GEOPublisherAttributionManifestIndex *)self readAll:1],
         [v4 readAll:1],
         publisherAttributionFiles = self->_publisherAttributionFiles,
         !((unint64_t)publisherAttributionFiles | v4[2]))
     || -[NSMutableArray isEqual:](publisherAttributionFiles, "isEqual:")))
  {
    publisherToFileIndex = self->_publisherToFileIndex;
    if ((unint64_t)publisherToFileIndex | v4[3]) {
      char v7 = -[NSMutableDictionary isEqual:](publisherToFileIndex, "isEqual:");
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

- (void)mergeFrom:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v4 = (id *)a3;
  [v4 readAll:0];
  long long v15 = 0u;
  long long v16 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v5 = v4[2];
  uint64_t v6 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v14;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v14 != v8) {
          objc_enumerationMutation(v5);
        }
        -[GEOPublisherAttributionManifestIndex addPublisherAttributionFiles:](self, "addPublisherAttributionFiles:", *(void *)(*((void *)&v13 + 1) + 8 * v9++), (void)v13);
      }
      while (v7 != v9);
      uint64_t v7 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v7);
  }

  if (v4[3])
  {
    publisherToFileIndex = self->_publisherToFileIndex;
    if (publisherToFileIndex)
    {
      -[NSMutableDictionary addEntriesFromDictionary:](publisherToFileIndex, "addEntriesFromDictionary:");
    }
    else
    {
      uint64_t v11 = (NSMutableDictionary *)[v4[3] copy];
      v12 = self->_publisherToFileIndex;
      self->_publisherToFileIndex = v11;
    }
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_publisherToFileIndex, 0);
  objc_storeStrong((id *)&self->_publisherAttributionFiles, 0);

  objc_storeStrong((id *)&self->_reader, 0);
}

@end