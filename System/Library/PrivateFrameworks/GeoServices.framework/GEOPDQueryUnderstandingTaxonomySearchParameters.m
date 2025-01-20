@interface GEOPDQueryUnderstandingTaxonomySearchParameters
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (GEOPDQueryUnderstandingTaxonomySearchParameters)init;
- (GEOPDQueryUnderstandingTaxonomySearchParameters)initWithData:(id)a3;
- (id)_dictionaryRepresentation:(uint64_t)a1;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)jsonRepresentation;
- (unint64_t)hash;
- (void)_addNoFlagsCategoryBranch:(uint64_t)a1;
- (void)_readCategoryBranchs;
- (void)addCategoryBranch:(uint64_t)a1;
- (void)readAll:(uint64_t)a1;
- (void)setSearchString:(uint64_t)a1;
- (void)writeTo:(id)a3;
@end

@implementation GEOPDQueryUnderstandingTaxonomySearchParameters

- (GEOPDQueryUnderstandingTaxonomySearchParameters)init
{
  v6.receiver = self;
  v6.super_class = (Class)GEOPDQueryUnderstandingTaxonomySearchParameters;
  v2 = [(GEOPDQueryUnderstandingTaxonomySearchParameters *)&v6 init];
  v3 = v2;
  if (v2)
  {
    v2->_readerLock._os_unfair_lock_opaque = 0;
    v4 = v2;
  }

  return v3;
}

- (GEOPDQueryUnderstandingTaxonomySearchParameters)initWithData:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)GEOPDQueryUnderstandingTaxonomySearchParameters;
  v3 = [(GEOPDQueryUnderstandingTaxonomySearchParameters *)&v7 initWithData:a3];
  v4 = v3;
  if (v3)
  {
    v3->_readerLock._os_unfair_lock_opaque = 0;
    v5 = v3;
  }

  return v4;
}

- (void)setSearchString:(uint64_t)a1
{
  id v4 = a2;
  *(unsigned char *)(a1 + 56) |= 8u;
  *(unsigned char *)(a1 + 56) |= 0x10u;
  objc_storeStrong((id *)(a1 + 32), a2);
}

- (void)_readCategoryBranchs
{
  os_unfair_lock_lock((os_unfair_lock_t)(a1 + 48));
  if ((*(unsigned char *)(a1 + 56) & 4) == 0)
  {
    v2 = *(void **)(a1 + 8);
    if (v2)
    {
      id v3 = v2;
      objc_sync_enter(v3);
      GEOPDQueryUnderstandingTaxonomySearchParametersReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readCategoryBranchs_tags_6417);
      objc_sync_exit(v3);
    }
  }

  os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 48));
}

- (void)addCategoryBranch:(uint64_t)a1
{
  if (a1)
  {
    id v3 = a2;
    -[GEOPDQueryUnderstandingTaxonomySearchParameters _readCategoryBranchs](a1);
    -[GEOPDQueryUnderstandingTaxonomySearchParameters _addNoFlagsCategoryBranch:](a1, v3);

    os_unfair_lock_lock_with_options();
    *(unsigned char *)(a1 + 56) |= 4u;
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 48));
    *(unsigned char *)(a1 + 56) |= 0x10u;
  }
}

- (void)_addNoFlagsCategoryBranch:(uint64_t)a1
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

- (id)description
{
  id v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)GEOPDQueryUnderstandingTaxonomySearchParameters;
  id v4 = [(GEOPDQueryUnderstandingTaxonomySearchParameters *)&v8 description];
  id v5 = [(GEOPDQueryUnderstandingTaxonomySearchParameters *)self dictionaryRepresentation];
  objc_super v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEOPDQueryUnderstandingTaxonomySearchParameters _dictionaryRepresentation:]((uint64_t)self, 0);
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  if (a1)
  {
    -[GEOPDQueryUnderstandingTaxonomySearchParameters readAll:](a1, 1);
    id v4 = [MEMORY[0x1E4F1CA60] dictionary];
    if (*(unsigned char *)(a1 + 56))
    {
      uint64_t v5 = *(int *)(a1 + 52);
      if (v5 >= 3)
      {
        objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(int *)(a1 + 52));
        objc_super v6 = (__CFString *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        objc_super v6 = off_1E53DCEE0[v5];
      }
      if (a2) {
        id v7 = @"taxonomyType";
      }
      else {
        id v7 = @"taxonomy_type";
      }
      [v4 setObject:v6 forKey:v7];
    }
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 48));
    if ((*(unsigned char *)(a1 + 56) & 8) == 0)
    {
      objc_super v8 = *(void **)(a1 + 8);
      if (v8)
      {
        id v9 = v8;
        objc_sync_enter(v9);
        GEOPDQueryUnderstandingTaxonomySearchParametersReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readSearchString_tags_6416);
        objc_sync_exit(v9);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 48));
    id v10 = *(id *)(a1 + 32);
    if (v10)
    {
      if (a2) {
        v11 = @"searchString";
      }
      else {
        v11 = @"search_string";
      }
      [v4 setObject:v10 forKey:v11];
    }

    if (*(void *)(a1 + 24))
    {
      -[GEOPDQueryUnderstandingTaxonomySearchParameters _readCategoryBranchs](a1);
      id v12 = *(id *)(a1 + 24);
      if (a2) {
        v13 = @"categoryBranch";
      }
      else {
        v13 = @"category_branch";
      }
      [v4 setObject:v12 forKey:v13];
    }
    v14 = *(void **)(a1 + 16);
    if (v14)
    {
      v15 = [v14 dictionaryRepresentation];
      v16 = v15;
      if (a2)
      {
        v17 = objc_msgSend(MEMORY[0x1E4F1CA60], "dictionaryWithCapacity:", objc_msgSend(v15, "count"));
        v21[0] = MEMORY[0x1E4F143A8];
        v21[1] = 3221225472;
        v21[2] = __77__GEOPDQueryUnderstandingTaxonomySearchParameters__dictionaryRepresentation___block_invoke;
        v21[3] = &unk_1E53D8860;
        id v18 = v17;
        id v22 = v18;
        [v16 enumerateKeysAndObjectsUsingBlock:v21];
        id v19 = v18;

        v16 = v19;
      }
      [v4 setObject:v16 forKey:@"Unknown Fields"];
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
  return -[GEOPDQueryUnderstandingTaxonomySearchParameters _dictionaryRepresentation:]((uint64_t)self, 1);
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
        objc_super v6 = (int *)&readAll__recursiveTag_6424;
      }
      else {
        objc_super v6 = (int *)&readAll__nonRecursiveTag_6425;
      }
      GEOPDQueryUnderstandingTaxonomySearchParametersReadSpecified(a1, *(void *)(a1 + 8), v6);
      objc_sync_exit(v5);
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 48));
  }
}

void __77__GEOPDQueryUnderstandingTaxonomySearchParameters__dictionaryRepresentation___block_invoke(uint64_t a1, void *a2, void *a3)
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

- (BOOL)readFrom:(id)a3
{
  return GEOPDQueryUnderstandingTaxonomySearchParametersReadAllFrom((uint64_t)self, a3, 0);
}

- (void)writeTo:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  if (self->_reader && (os_unfair_lock_assert_owner(&self->_readerLock), (*(unsigned char *)&self->_flags & 0x1C) == 0))
  {
    id v10 = self->_reader;
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
    -[GEOPDQueryUnderstandingTaxonomySearchParameters readAll:]((uint64_t)self, 0);
    if (*(unsigned char *)&self->_flags) {
      PBDataWriterWriteInt32Field();
    }
    if (self->_searchString) {
      PBDataWriterWriteStringField();
    }
    long long v14 = 0u;
    long long v15 = 0u;
    long long v12 = 0u;
    long long v13 = 0u;
    objc_super v6 = self->_categoryBranchs;
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
          PBDataWriterWriteStringField();
        }
        uint64_t v7 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v12 objects:v16 count:16];
      }
      while (v7);
    }

    -[PBUnknownFields writeTo:](self->_unknownFields, "writeTo:", v4, v12);
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  os_unfair_lock_lock(&self->_readerLock);
  reader = self->_reader;
  if (reader)
  {
    uint64_t v7 = reader;
    objc_sync_enter(v7);
    if ((*(unsigned char *)&self->_flags & 0x10) == 0)
    {
      *(void *)((char *)self->_reader + (int)*MEMORY[0x1E4F940E0]) = self->_readerMarkLength;
      [(PBDataReader *)self->_reader seekToOffset:self->_readerMarkPos];
      GEOPDQueryUnderstandingTaxonomySearchParametersReadAllFrom(v5, self->_reader, 0);
      os_unfair_lock_unlock(&self->_readerLock);
      id v8 = (id)v5;
      objc_sync_exit(v7);

      goto LABEL_15;
    }
    objc_sync_exit(v7);
  }
  os_unfair_lock_unlock(&self->_readerLock);
  -[GEOPDQueryUnderstandingTaxonomySearchParameters readAll:]((uint64_t)self, 0);
  if (*(unsigned char *)&self->_flags)
  {
    *(_DWORD *)(v5 + 52) = self->_taxonomyType;
    *(unsigned char *)(v5 + 56) |= 1u;
  }
  uint64_t v9 = [(NSString *)self->_searchString copyWithZone:a3];
  id v10 = *(void **)(v5 + 32);
  *(void *)(v5 + 32) = v9;

  long long v20 = 0u;
  long long v21 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  v11 = self->_categoryBranchs;
  uint64_t v12 = [(NSMutableArray *)v11 countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v12)
  {
    uint64_t v13 = *(void *)v19;
    do
    {
      for (uint64_t i = 0; i != v12; ++i)
      {
        if (*(void *)v19 != v13) {
          objc_enumerationMutation(v11);
        }
        long long v15 = objc_msgSend(*(id *)(*((void *)&v18 + 1) + 8 * i), "copyWithZone:", a3, (void)v18);
        -[GEOPDQueryUnderstandingTaxonomySearchParameters addCategoryBranch:](v5, v15);
      }
      uint64_t v12 = [(NSMutableArray *)v11 countByEnumeratingWithState:&v18 objects:v22 count:16];
    }
    while (v12);
  }

  v16 = self->_unknownFields;
  id v8 = *(id *)(v5 + 16);
  *(void *)(v5 + 16) = v16;
LABEL_15:

  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_11;
  }
  -[GEOPDQueryUnderstandingTaxonomySearchParameters readAll:]((uint64_t)self, 1);
  -[GEOPDQueryUnderstandingTaxonomySearchParameters readAll:]((uint64_t)v4, 1);
  if (*(unsigned char *)&self->_flags)
  {
    if ((*((unsigned char *)v4 + 56) & 1) == 0 || self->_taxonomyType != *((_DWORD *)v4 + 13)) {
      goto LABEL_11;
    }
  }
  else if (*((unsigned char *)v4 + 56))
  {
LABEL_11:
    char v7 = 0;
    goto LABEL_12;
  }
  searchString = self->_searchString;
  if ((unint64_t)searchString | *((void *)v4 + 4)
    && !-[NSString isEqual:](searchString, "isEqual:"))
  {
    goto LABEL_11;
  }
  categoryBranchs = self->_categoryBranchs;
  if ((unint64_t)categoryBranchs | *((void *)v4 + 3)) {
    char v7 = -[NSMutableArray isEqual:](categoryBranchs, "isEqual:");
  }
  else {
    char v7 = 1;
  }
LABEL_12:

  return v7;
}

- (unint64_t)hash
{
  -[GEOPDQueryUnderstandingTaxonomySearchParameters readAll:]((uint64_t)self, 1);
  if (*(unsigned char *)&self->_flags) {
    uint64_t v3 = 2654435761 * self->_taxonomyType;
  }
  else {
    uint64_t v3 = 0;
  }
  NSUInteger v4 = [(NSString *)self->_searchString hash] ^ v3;
  return v4 ^ [(NSMutableArray *)self->_categoryBranchs hash];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_searchString, 0);
  objc_storeStrong((id *)&self->_categoryBranchs, 0);
  objc_storeStrong((id *)&self->_unknownFields, 0);

  objc_storeStrong((id *)&self->_reader, 0);
}

@end