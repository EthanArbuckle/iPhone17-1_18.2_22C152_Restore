@interface GEOPDSearchCategoryMapping
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (GEOPDSearchCategoryMapping)init;
- (GEOPDSearchCategoryMapping)initWithData:(id)a3;
- (id)_dictionaryRepresentation:(uint64_t)a1;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)jsonRepresentation;
- (unint64_t)hash;
- (void)_addNoFlagsRelatedCategories:(uint64_t)a1;
- (void)addRelatedCategories:(uint64_t)a1;
- (void)readAll:(uint64_t)a1;
- (void)writeTo:(id)a3;
@end

@implementation GEOPDSearchCategoryMapping

- (GEOPDSearchCategoryMapping)init
{
  v6.receiver = self;
  v6.super_class = (Class)GEOPDSearchCategoryMapping;
  v2 = [(GEOPDSearchCategoryMapping *)&v6 init];
  v3 = v2;
  if (v2)
  {
    v2->_readerLock._os_unfair_lock_opaque = 0;
    v4 = v2;
  }

  return v3;
}

- (GEOPDSearchCategoryMapping)initWithData:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)GEOPDSearchCategoryMapping;
  v3 = [(GEOPDSearchCategoryMapping *)&v7 initWithData:a3];
  v4 = v3;
  if (v3)
  {
    v3->_readerLock._os_unfair_lock_opaque = 0;
    v5 = v3;
  }

  return v4;
}

- (void)addRelatedCategories:(uint64_t)a1
{
  if (a1)
  {
    id v3 = a2;
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 48));
    if ((*(unsigned char *)(a1 + 52) & 4) == 0)
    {
      v4 = *(void **)(a1 + 8);
      if (v4)
      {
        id v5 = v4;
        objc_sync_enter(v5);
        GEOPDSearchCategoryMappingReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readRelatedCategories_tags);
        objc_sync_exit(v5);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 48));
    -[GEOPDSearchCategoryMapping _addNoFlagsRelatedCategories:](a1, v3);

    os_unfair_lock_lock_with_options();
    *(unsigned char *)(a1 + 52) |= 4u;
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 48));
    *(unsigned char *)(a1 + 52) |= 8u;
  }
}

- (void)_addNoFlagsRelatedCategories:(uint64_t)a1
{
  id v3 = a2;
  if (a1)
  {
    v4 = *(void **)(a1 + 32);
    id v7 = v3;
    if (!v4)
    {
      id v5 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
      objc_super v6 = *(void **)(a1 + 32);
      *(void *)(a1 + 32) = v5;

      v4 = *(void **)(a1 + 32);
    }
    [v4 addObject:v7];
    id v3 = v7;
  }
}

- (id)description
{
  id v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)GEOPDSearchCategoryMapping;
  v4 = [(GEOPDSearchCategoryMapping *)&v8 description];
  id v5 = [(GEOPDSearchCategoryMapping *)self dictionaryRepresentation];
  objc_super v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEOPDSearchCategoryMapping _dictionaryRepresentation:]((uint64_t)self, 0);
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  if (a1)
  {
    -[GEOPDSearchCategoryMapping readAll:](a1, 1);
    v4 = [MEMORY[0x1E4F1CA60] dictionary];
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 48));
    if ((*(unsigned char *)(a1 + 52) & 2) == 0)
    {
      id v5 = *(void **)(a1 + 8);
      if (v5)
      {
        id v6 = v5;
        objc_sync_enter(v6);
        GEOPDSearchCategoryMappingReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readCategoryId_tags);
        objc_sync_exit(v6);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 48));
    id v7 = *(id *)(a1 + 16);
    if (v7)
    {
      if (a2) {
        objc_super v8 = @"categoryId";
      }
      else {
        objc_super v8 = @"category_id";
      }
      [v4 setObject:v7 forKey:v8];
    }

    if (*(unsigned char *)(a1 + 52))
    {
      v9 = [NSNumber numberWithLongLong:*(void *)(a1 + 24)];
      if (a2) {
        v10 = @"densityScore";
      }
      else {
        v10 = @"density_score";
      }
      [v4 setObject:v9 forKey:v10];
    }
    if ([*(id *)(a1 + 32) count])
    {
      v11 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(*(id *)(a1 + 32), "count"));
      long long v20 = 0u;
      long long v21 = 0u;
      long long v22 = 0u;
      long long v23 = 0u;
      id v12 = *(id *)(a1 + 32);
      uint64_t v13 = [v12 countByEnumeratingWithState:&v20 objects:v24 count:16];
      if (v13)
      {
        uint64_t v14 = *(void *)v21;
        do
        {
          for (uint64_t i = 0; i != v13; ++i)
          {
            if (*(void *)v21 != v14) {
              objc_enumerationMutation(v12);
            }
            v16 = *(void **)(*((void *)&v20 + 1) + 8 * i);
            if (a2) {
              [v16 jsonRepresentation];
            }
            else {
            v17 = objc_msgSend(v16, "dictionaryRepresentation", (void)v20);
            }
            objc_msgSend(v11, "addObject:", v17, (void)v20);
          }
          uint64_t v13 = [v12 countByEnumeratingWithState:&v20 objects:v24 count:16];
        }
        while (v13);
      }

      if (a2) {
        v18 = @"relatedCategories";
      }
      else {
        v18 = @"related_categories";
      }
      objc_msgSend(v4, "setObject:forKey:", v11, v18, (void)v20);
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
  return -[GEOPDSearchCategoryMapping _dictionaryRepresentation:]((uint64_t)self, 1);
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
        id v6 = (int *)&readAll__recursiveTag_477;
      }
      else {
        id v6 = (int *)&readAll__nonRecursiveTag_478;
      }
      GEOPDSearchCategoryMappingReadSpecified(a1, *(void *)(a1 + 8), v6);
      objc_sync_exit(v5);
    }
    if (a2) {
      _GEOPDSearchCategoryMappingCallReadAllRecursiveWithoutSynchronized(a1);
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 48));
  }
}

- (BOOL)readFrom:(id)a3
{
  return GEOPDSearchCategoryMappingReadAllFrom((uint64_t)self, a3, 0);
}

- (void)writeTo:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  if (self->_reader && (os_unfair_lock_assert_owner(&self->_readerLock), (*(unsigned char *)&self->_flags & 0xE) == 0))
  {
    v10 = self->_reader;
    objc_sync_enter(v10);
    *(void *)((char *)self->_reader + (int)*MEMORY[0x1E4F940E0]) = self->_readerMarkLength;
    [(PBDataReader *)self->_reader seekToOffset:self->_readerMarkPos];
    v11 = [(PBDataReader *)self->_reader readBytes:self->_readerMarkLength - self->_readerMarkPos];
    [v4 writeData:v11];
    os_unfair_lock_unlock(p_readerLock);

    objc_sync_exit(v10);
  }
  else
  {
    os_unfair_lock_unlock(&self->_readerLock);
    -[GEOPDSearchCategoryMapping readAll:]((uint64_t)self, 0);
    PBDataWriterWriteStringField();
    if (*(unsigned char *)&self->_flags) {
      PBDataWriterWriteInt64Field();
    }
    long long v14 = 0u;
    long long v15 = 0u;
    long long v12 = 0u;
    long long v13 = 0u;
    id v6 = self->_relatedCategories;
    uint64_t v7 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v12 objects:v16 count:16];
    if (v7)
    {
      uint64_t v8 = *(void *)v13;
      do
      {
        for (uint64_t i = 0; i != v7; ++i)
        {
          if (*(void *)v13 != v8) {
            objc_enumerationMutation(v6);
          }
          PBDataWriterWriteSubmessage();
        }
        uint64_t v7 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v12 objects:v16 count:16];
      }
      while (v7);
    }
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
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
      GEOPDSearchCategoryMappingReadAllFrom(v5, self->_reader, 0);
      os_unfair_lock_unlock(&self->_readerLock);
      uint64_t v8 = (NSMutableArray *)(id)v5;
      objc_sync_exit(v7);

      goto LABEL_14;
    }
    objc_sync_exit(v7);
  }
  os_unfair_lock_unlock(&self->_readerLock);
  -[GEOPDSearchCategoryMapping readAll:]((uint64_t)self, 0);
  uint64_t v9 = [(NSString *)self->_categoryId copyWithZone:a3];
  v10 = *(void **)(v5 + 16);
  *(void *)(v5 + 16) = v9;

  if (*(unsigned char *)&self->_flags)
  {
    *(void *)(v5 + 24) = self->_densityScore;
    *(unsigned char *)(v5 + 52) |= 1u;
  }
  long long v18 = 0u;
  long long v19 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  uint64_t v8 = self->_relatedCategories;
  uint64_t v11 = [(NSMutableArray *)v8 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v11)
  {
    uint64_t v12 = *(void *)v17;
    do
    {
      for (uint64_t i = 0; i != v11; ++i)
      {
        if (*(void *)v17 != v12) {
          objc_enumerationMutation(v8);
        }
        long long v14 = objc_msgSend(*(id *)(*((void *)&v16 + 1) + 8 * i), "copyWithZone:", a3, (void)v16);
        -[GEOPDSearchCategoryMapping addRelatedCategories:](v5, v14);
      }
      uint64_t v11 = [(NSMutableArray *)v8 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v11);
  }
LABEL_14:

  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_11;
  }
  -[GEOPDSearchCategoryMapping readAll:]((uint64_t)self, 1);
  -[GEOPDSearchCategoryMapping readAll:]((uint64_t)v4, 1);
  categoryId = self->_categoryId;
  if ((unint64_t)categoryId | *((void *)v4 + 2))
  {
    if (!-[NSString isEqual:](categoryId, "isEqual:")) {
      goto LABEL_11;
    }
  }
  if (*(unsigned char *)&self->_flags)
  {
    if ((*((unsigned char *)v4 + 52) & 1) == 0 || self->_densityScore != *((void *)v4 + 3)) {
      goto LABEL_11;
    }
  }
  else if (*((unsigned char *)v4 + 52))
  {
LABEL_11:
    char v7 = 0;
    goto LABEL_12;
  }
  relatedCategories = self->_relatedCategories;
  if ((unint64_t)relatedCategories | *((void *)v4 + 4)) {
    char v7 = -[NSMutableArray isEqual:](relatedCategories, "isEqual:");
  }
  else {
    char v7 = 1;
  }
LABEL_12:

  return v7;
}

- (unint64_t)hash
{
  -[GEOPDSearchCategoryMapping readAll:]((uint64_t)self, 1);
  NSUInteger v3 = [(NSString *)self->_categoryId hash];
  if (*(unsigned char *)&self->_flags) {
    uint64_t v4 = 2654435761 * self->_densityScore;
  }
  else {
    uint64_t v4 = 0;
  }
  return v4 ^ [(NSMutableArray *)self->_relatedCategories hash] ^ v3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_relatedCategories, 0);
  objc_storeStrong((id *)&self->_categoryId, 0);

  objc_storeStrong((id *)&self->_reader, 0);
}

@end