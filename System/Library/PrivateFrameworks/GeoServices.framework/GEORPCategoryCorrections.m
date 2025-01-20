@interface GEORPCategoryCorrections
+ (BOOL)isValid:(id)a3;
+ (Class)addedType;
+ (Class)removedType;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (GEORPCategoryCorrections)init;
- (GEORPCategoryCorrections)initWithData:(id)a3;
- (GEORPCategoryCorrections)initWithDictionary:(id)a3;
- (GEORPCategoryCorrections)initWithJSON:(id)a3;
- (NSMutableArray)addeds;
- (NSMutableArray)removeds;
- (PBUnknownFields)unknownFields;
- (id)_dictionaryRepresentation:(void *)a1;
- (id)addedAtIndex:(unint64_t)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)jsonRepresentation;
- (id)removedAtIndex:(unint64_t)a3;
- (unint64_t)addedsCount;
- (unint64_t)hash;
- (unint64_t)removedsCount;
- (void)_addNoFlagsAdded:(uint64_t)a1;
- (void)_addNoFlagsRemoved:(uint64_t)a1;
- (void)_initWithDictionary:(void *)a1 isJSON:(void *)a2;
- (void)_readAddeds;
- (void)_readRemoveds;
- (void)addAdded:(id)a3;
- (void)addRemoved:(id)a3;
- (void)clearAddeds;
- (void)clearRemoveds;
- (void)clearUnknownFields:(BOOL)a3;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)readAll:(BOOL)a3;
- (void)setAddeds:(id)a3;
- (void)setRemoveds:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation GEORPCategoryCorrections

- (GEORPCategoryCorrections)init
{
  v6.receiver = self;
  v6.super_class = (Class)GEORPCategoryCorrections;
  v2 = [(GEORPCategoryCorrections *)&v6 init];
  v3 = v2;
  if (v2)
  {
    v2->_readerLock._os_unfair_lock_opaque = 0;
    v4 = v2;
  }

  return v3;
}

- (GEORPCategoryCorrections)initWithData:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)GEORPCategoryCorrections;
  v3 = [(GEORPCategoryCorrections *)&v7 initWithData:a3];
  v4 = v3;
  if (v3)
  {
    v3->_readerLock._os_unfair_lock_opaque = 0;
    v5 = v3;
  }

  return v4;
}

- (void)_readAddeds
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 48));
    if ((*(unsigned char *)(a1 + 52) & 2) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEORPCategoryCorrectionsReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readAddeds_tags_353);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 48));
  }
}

- (NSMutableArray)addeds
{
  -[GEORPCategoryCorrections _readAddeds]((uint64_t)self);
  addeds = self->_addeds;

  return addeds;
}

- (void)setAddeds:(id)a3
{
  v4 = (NSMutableArray *)a3;
  os_unfair_lock_lock_with_options();
  *(unsigned char *)&self->_flags |= 2u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(unsigned char *)&self->_flags |= 8u;
  addeds = self->_addeds;
  self->_addeds = v4;
}

- (void)clearAddeds
{
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(unsigned char *)&self->_flags |= 2u;
  os_unfair_lock_unlock(p_readerLock);
  *(unsigned char *)&self->_flags |= 8u;
  addeds = self->_addeds;

  [(NSMutableArray *)addeds removeAllObjects];
}

- (void)addAdded:(id)a3
{
  id v4 = a3;
  -[GEORPCategoryCorrections _readAddeds]((uint64_t)self);
  -[GEORPCategoryCorrections _addNoFlagsAdded:]((uint64_t)self, v4);

  os_unfair_lock_lock_with_options();
  *(unsigned char *)&self->_flags |= 2u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(unsigned char *)&self->_flags |= 8u;
}

- (void)_addNoFlagsAdded:(uint64_t)a1
{
  id v3 = a2;
  if (a1)
  {
    id v4 = *(void **)(a1 + 24);
    id v7 = v3;
    if (!v4)
    {
      id v5 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
      objc_super v6 = *(void **)(a1 + 24);
      *(void *)(a1 + 24) = v5;

      id v4 = *(void **)(a1 + 24);
    }
    [v4 addObject:v7];
    id v3 = v7;
  }
}

- (unint64_t)addedsCount
{
  -[GEORPCategoryCorrections _readAddeds]((uint64_t)self);
  addeds = self->_addeds;

  return [(NSMutableArray *)addeds count];
}

- (id)addedAtIndex:(unint64_t)a3
{
  -[GEORPCategoryCorrections _readAddeds]((uint64_t)self);
  addeds = self->_addeds;

  return (id)[(NSMutableArray *)addeds objectAtIndex:a3];
}

+ (Class)addedType
{
  return (Class)objc_opt_class();
}

- (void)_readRemoveds
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
        GEORPCategoryCorrectionsReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readRemoveds_tags_354);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 48));
  }
}

- (NSMutableArray)removeds
{
  -[GEORPCategoryCorrections _readRemoveds]((uint64_t)self);
  removeds = self->_removeds;

  return removeds;
}

- (void)setRemoveds:(id)a3
{
  id v4 = (NSMutableArray *)a3;
  os_unfair_lock_lock_with_options();
  *(unsigned char *)&self->_flags |= 4u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(unsigned char *)&self->_flags |= 8u;
  removeds = self->_removeds;
  self->_removeds = v4;
}

- (void)clearRemoveds
{
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(unsigned char *)&self->_flags |= 4u;
  os_unfair_lock_unlock(p_readerLock);
  *(unsigned char *)&self->_flags |= 8u;
  removeds = self->_removeds;

  [(NSMutableArray *)removeds removeAllObjects];
}

- (void)addRemoved:(id)a3
{
  id v4 = a3;
  -[GEORPCategoryCorrections _readRemoveds]((uint64_t)self);
  -[GEORPCategoryCorrections _addNoFlagsRemoved:]((uint64_t)self, v4);

  os_unfair_lock_lock_with_options();
  *(unsigned char *)&self->_flags |= 4u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(unsigned char *)&self->_flags |= 8u;
}

- (void)_addNoFlagsRemoved:(uint64_t)a1
{
  id v3 = a2;
  if (a1)
  {
    id v4 = *(void **)(a1 + 32);
    id v7 = v3;
    if (!v4)
    {
      id v5 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
      objc_super v6 = *(void **)(a1 + 32);
      *(void *)(a1 + 32) = v5;

      id v4 = *(void **)(a1 + 32);
    }
    [v4 addObject:v7];
    id v3 = v7;
  }
}

- (unint64_t)removedsCount
{
  -[GEORPCategoryCorrections _readRemoveds]((uint64_t)self);
  removeds = self->_removeds;

  return [(NSMutableArray *)removeds count];
}

- (id)removedAtIndex:(unint64_t)a3
{
  -[GEORPCategoryCorrections _readRemoveds]((uint64_t)self);
  removeds = self->_removeds;

  return (id)[(NSMutableArray *)removeds objectAtIndex:a3];
}

+ (Class)removedType
{
  return (Class)objc_opt_class();
}

- (id)description
{
  id v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)GEORPCategoryCorrections;
  id v4 = [(GEORPCategoryCorrections *)&v8 description];
  id v5 = [(GEORPCategoryCorrections *)self dictionaryRepresentation];
  objc_super v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEORPCategoryCorrections _dictionaryRepresentation:](self, 0);
}

- (id)_dictionaryRepresentation:(void *)a1
{
  if (a1)
  {
    [a1 readAll:1];
    id v4 = [MEMORY[0x1E4F1CA60] dictionary];
    if (a1[3])
    {
      id v5 = [a1 addeds];
      [v4 setObject:v5 forKey:@"added"];
    }
    if (a1[4])
    {
      objc_super v6 = [a1 removeds];
      [v4 setObject:v6 forKey:@"removed"];
    }
    id v7 = (void *)a1[2];
    if (v7)
    {
      objc_super v8 = [v7 dictionaryRepresentation];
      v9 = v8;
      if (a2)
      {
        v10 = objc_msgSend(MEMORY[0x1E4F1CA60], "dictionaryWithCapacity:", objc_msgSend(v8, "count"));
        v14[0] = MEMORY[0x1E4F143A8];
        v14[1] = 3221225472;
        v14[2] = __54__GEORPCategoryCorrections__dictionaryRepresentation___block_invoke;
        v14[3] = &unk_1E53D8860;
        id v11 = v10;
        id v15 = v11;
        [v9 enumerateKeysAndObjectsUsingBlock:v14];
        id v12 = v11;

        v9 = v12;
      }
      [v4 setObject:v9 forKey:@"Unknown Fields"];
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
  return -[GEORPCategoryCorrections _dictionaryRepresentation:](self, 1);
}

void __54__GEORPCategoryCorrections__dictionaryRepresentation___block_invoke(uint64_t a1, void *a2, void *a3)
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

- (GEORPCategoryCorrections)initWithDictionary:(id)a3
{
  return (GEORPCategoryCorrections *)-[GEORPCategoryCorrections _initWithDictionary:isJSON:](self, a3);
}

- (void)_initWithDictionary:(void *)a1 isJSON:(void *)a2
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if (a1)
  {
    a1 = (void *)[a1 init];
    if (a1)
    {
      id v4 = [v3 objectForKeyedSubscript:@"added"];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        long long v27 = 0u;
        long long v28 = 0u;
        long long v25 = 0u;
        long long v26 = 0u;
        id v5 = v4;
        uint64_t v6 = [v5 countByEnumeratingWithState:&v25 objects:v30 count:16];
        if (v6)
        {
          uint64_t v7 = v6;
          uint64_t v8 = *(void *)v26;
          do
          {
            uint64_t v9 = 0;
            do
            {
              if (*(void *)v26 != v8) {
                objc_enumerationMutation(v5);
              }
              id v10 = *(void **)(*((void *)&v25 + 1) + 8 * v9);
              objc_opt_class();
              if (objc_opt_isKindOfClass())
              {
                id v11 = (void *)[v10 copy];
                [a1 addAdded:v11];
              }
              ++v9;
            }
            while (v7 != v9);
            uint64_t v7 = [v5 countByEnumeratingWithState:&v25 objects:v30 count:16];
          }
          while (v7);
        }
      }
      id v12 = [v3 objectForKeyedSubscript:@"removed"];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        long long v23 = 0u;
        long long v24 = 0u;
        long long v21 = 0u;
        long long v22 = 0u;
        id v13 = v12;
        uint64_t v14 = [v13 countByEnumeratingWithState:&v21 objects:v29 count:16];
        if (v14)
        {
          uint64_t v15 = v14;
          uint64_t v16 = *(void *)v22;
          do
          {
            uint64_t v17 = 0;
            do
            {
              if (*(void *)v22 != v16) {
                objc_enumerationMutation(v13);
              }
              v18 = *(void **)(*((void *)&v21 + 1) + 8 * v17);
              objc_opt_class();
              if (objc_opt_isKindOfClass())
              {
                v19 = objc_msgSend(v18, "copy", (void)v21);
                [a1 addRemoved:v19];
              }
              ++v17;
            }
            while (v15 != v17);
            uint64_t v15 = [v13 countByEnumeratingWithState:&v21 objects:v29 count:16];
          }
          while (v15);
        }
      }
    }
  }

  return a1;
}

- (GEORPCategoryCorrections)initWithJSON:(id)a3
{
  return (GEORPCategoryCorrections *)-[GEORPCategoryCorrections _initWithDictionary:isJSON:](self, a3);
}

- (void)readAll:(BOOL)a3
{
  BOOL v3 = a3;
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  reader = self->_reader;
  if (reader)
  {
    uint64_t v7 = reader;
    objc_sync_enter(v7);
    if (v3) {
      uint64_t v8 = (int *)&readAll__recursiveTag_355;
    }
    else {
      uint64_t v8 = (int *)&readAll__nonRecursiveTag_356;
    }
    GEORPCategoryCorrectionsReadSpecified((uint64_t)self, (unint64_t)self->_reader, v8);
    objc_sync_exit(v7);
  }

  os_unfair_lock_unlock(p_readerLock);
}

+ (BOOL)isValid:(id)a3
{
  return GEORPCategoryCorrectionsIsValid((char *)a3);
}

- (BOOL)readFrom:(id)a3
{
  return GEORPCategoryCorrectionsReadAllFrom((uint64_t)self, a3, 0);
}

- (void)writeTo:(id)a3
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  if (self->_reader && (os_unfair_lock_assert_owner(&self->_readerLock), (*(unsigned char *)&self->_flags & 0xE) == 0))
  {
    uint64_t v14 = self->_reader;
    objc_sync_enter(v14);
    *(void *)((char *)self->_reader + (int)*MEMORY[0x1E4F940E0]) = self->_readerMarkLength;
    [(PBDataReader *)self->_reader seekToOffset:self->_readerMarkPos];
    uint64_t v15 = [(PBDataReader *)self->_reader readBytes:self->_readerMarkLength - self->_readerMarkPos];
    [v4 writeData:v15];
    os_unfair_lock_unlock(p_readerLock);

    objc_sync_exit(v14);
  }
  else
  {
    os_unfair_lock_unlock(&self->_readerLock);
    [(GEORPCategoryCorrections *)self readAll:0];
    long long v22 = 0u;
    long long v23 = 0u;
    long long v20 = 0u;
    long long v21 = 0u;
    uint64_t v6 = self->_addeds;
    uint64_t v7 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v20 objects:v25 count:16];
    if (v7)
    {
      uint64_t v8 = *(void *)v21;
      do
      {
        for (uint64_t i = 0; i != v7; ++i)
        {
          if (*(void *)v21 != v8) {
            objc_enumerationMutation(v6);
          }
          PBDataWriterWriteStringField();
        }
        uint64_t v7 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v20 objects:v25 count:16];
      }
      while (v7);
    }

    long long v18 = 0u;
    long long v19 = 0u;
    long long v16 = 0u;
    long long v17 = 0u;
    id v10 = self->_removeds;
    uint64_t v11 = [(NSMutableArray *)v10 countByEnumeratingWithState:&v16 objects:v24 count:16];
    if (v11)
    {
      uint64_t v12 = *(void *)v17;
      do
      {
        for (uint64_t j = 0; j != v11; ++j)
        {
          if (*(void *)v17 != v12) {
            objc_enumerationMutation(v10);
          }
          PBDataWriterWriteStringField();
        }
        uint64_t v11 = [(NSMutableArray *)v10 countByEnumeratingWithState:&v16 objects:v24 count:16];
      }
      while (v11);
    }

    -[PBUnknownFields writeTo:](self->_unknownFields, "writeTo:", v4, v16);
  }
}

- (void)copyTo:(id)a3
{
  uint64_t v12 = (id *)a3;
  [(GEORPCategoryCorrections *)self readAll:0];
  os_unfair_lock_lock_with_options();
  objc_storeStrong(v12 + 1, self->_reader);
  *((_DWORD *)v12 + 10) = self->_readerMarkPos;
  *((_DWORD *)v12 + 11) = self->_readerMarkLength;
  os_unfair_lock_unlock(&self->_readerLock);
  if ([(GEORPCategoryCorrections *)self addedsCount])
  {
    [v12 clearAddeds];
    unint64_t v4 = [(GEORPCategoryCorrections *)self addedsCount];
    if (v4)
    {
      unint64_t v5 = v4;
      for (uint64_t i = 0; i != v5; ++i)
      {
        uint64_t v7 = [(GEORPCategoryCorrections *)self addedAtIndex:i];
        [v12 addAdded:v7];
      }
    }
  }
  if ([(GEORPCategoryCorrections *)self removedsCount])
  {
    [v12 clearRemoveds];
    unint64_t v8 = [(GEORPCategoryCorrections *)self removedsCount];
    if (v8)
    {
      unint64_t v9 = v8;
      for (uint64_t j = 0; j != v9; ++j)
      {
        uint64_t v11 = [(GEORPCategoryCorrections *)self removedAtIndex:j];
        [v12 addRemoved:v11];
      }
    }
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  unint64_t v5 = (id *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  os_unfair_lock_lock(&self->_readerLock);
  reader = self->_reader;
  if (reader)
  {
    uint64_t v7 = reader;
    objc_sync_enter(v7);
    if ((*(unsigned char *)&self->_flags & 8) == 0)
    {
      *(void *)((char *)self->_reader + (int)*MEMORY[0x1E4F940E0]) = self->_readerMarkLength;
      [(PBDataReader *)self->_reader seekToOffset:self->_readerMarkPos];
      GEORPCategoryCorrectionsReadAllFrom((uint64_t)v5, self->_reader, 0);
      os_unfair_lock_unlock(&self->_readerLock);
      objc_sync_exit(v7);

      return v5;
    }
    objc_sync_exit(v7);
  }
  os_unfair_lock_unlock(&self->_readerLock);
  [(GEORPCategoryCorrections *)self readAll:0];
  long long v25 = 0u;
  long long v26 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  unint64_t v8 = self->_addeds;
  uint64_t v9 = [(NSMutableArray *)v8 countByEnumeratingWithState:&v23 objects:v28 count:16];
  if (v9)
  {
    uint64_t v10 = *(void *)v24;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v24 != v10) {
          objc_enumerationMutation(v8);
        }
        uint64_t v12 = (void *)[*(id *)(*((void *)&v23 + 1) + 8 * i) copyWithZone:a3];
        [v5 addAdded:v12];
      }
      uint64_t v9 = [(NSMutableArray *)v8 countByEnumeratingWithState:&v23 objects:v28 count:16];
    }
    while (v9);
  }

  long long v21 = 0u;
  long long v22 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  id v13 = self->_removeds;
  uint64_t v14 = [(NSMutableArray *)v13 countByEnumeratingWithState:&v19 objects:v27 count:16];
  if (v14)
  {
    uint64_t v15 = *(void *)v20;
    do
    {
      for (uint64_t j = 0; j != v14; ++j)
      {
        if (*(void *)v20 != v15) {
          objc_enumerationMutation(v13);
        }
        long long v17 = objc_msgSend(*(id *)(*((void *)&v19 + 1) + 8 * j), "copyWithZone:", a3, (void)v19);
        [v5 addRemoved:v17];
      }
      uint64_t v14 = [(NSMutableArray *)v13 countByEnumeratingWithState:&v19 objects:v27 count:16];
    }
    while (v14);
  }

  objc_storeStrong(v5 + 2, self->_unknownFields);
  return v5;
}

- (BOOL)isEqual:(id)a3
{
  unint64_t v4 = a3;
  if ([v4 isMemberOfClass:objc_opt_class()]
    && (([(GEORPCategoryCorrections *)self readAll:1],
         [v4 readAll:1],
         addeds = self->_addeds,
         !((unint64_t)addeds | v4[3]))
     || -[NSMutableArray isEqual:](addeds, "isEqual:")))
  {
    removeds = self->_removeds;
    if ((unint64_t)removeds | v4[4]) {
      char v7 = -[NSMutableArray isEqual:](removeds, "isEqual:");
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
  [(GEORPCategoryCorrections *)self readAll:1];
  uint64_t v3 = [(NSMutableArray *)self->_addeds hash];
  return [(NSMutableArray *)self->_removeds hash] ^ v3;
}

- (void)mergeFrom:(id)a3
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  unint64_t v4 = (id *)a3;
  [v4 readAll:0];
  long long v21 = 0u;
  long long v22 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  id v5 = v4[3];
  uint64_t v6 = [v5 countByEnumeratingWithState:&v19 objects:v24 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v20;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v20 != v8) {
          objc_enumerationMutation(v5);
        }
        [(GEORPCategoryCorrections *)self addAdded:*(void *)(*((void *)&v19 + 1) + 8 * v9++)];
      }
      while (v7 != v9);
      uint64_t v7 = [v5 countByEnumeratingWithState:&v19 objects:v24 count:16];
    }
    while (v7);
  }

  long long v17 = 0u;
  long long v18 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v10 = v4[4];
  uint64_t v11 = [v10 countByEnumeratingWithState:&v15 objects:v23 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v13 = *(void *)v16;
    do
    {
      uint64_t v14 = 0;
      do
      {
        if (*(void *)v16 != v13) {
          objc_enumerationMutation(v10);
        }
        -[GEORPCategoryCorrections addRemoved:](self, "addRemoved:", *(void *)(*((void *)&v15 + 1) + 8 * v14++), (void)v15);
      }
      while (v12 != v14);
      uint64_t v12 = [v10 countByEnumeratingWithState:&v15 objects:v23 count:16];
    }
    while (v12);
  }
}

- (PBUnknownFields)unknownFields
{
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  if ((*(unsigned char *)&self->_flags & 1) == 0)
  {
    reader = self->_reader;
    if (reader)
    {
      id v5 = reader;
      objc_sync_enter(v5);
      GEORPCategoryCorrectionsReadSpecified((uint64_t)self, (unint64_t)self->_reader, (int *)&unknownFields_tags_360);
      objc_sync_exit(v5);
    }
  }
  os_unfair_lock_unlock(p_readerLock);
  unknownFields = self->_unknownFields;

  return unknownFields;
}

- (void)clearUnknownFields:(BOOL)a3
{
  BOOL v3 = a3;
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(unsigned char *)&self->_flags |= 9u;
  os_unfair_lock_unlock(p_readerLock);
  unknownFields = self->_unknownFields;
  self->_unknownFields = 0;

  if (v3)
  {
    [(GEORPCategoryCorrections *)self readAll:0];
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_removeds, 0);
  objc_storeStrong((id *)&self->_addeds, 0);
  objc_storeStrong((id *)&self->_unknownFields, 0);

  objc_storeStrong((id *)&self->_reader, 0);
}

@end