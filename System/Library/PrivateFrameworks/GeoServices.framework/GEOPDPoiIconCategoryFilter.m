@interface GEOPDPoiIconCategoryFilter
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (GEOPDPoiIconCategoryFilter)init;
- (GEOPDPoiIconCategoryFilter)initWithData:(id)a3;
- (id)_dictionaryRepresentation:(void *)a1;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)jsonRepresentation;
- (uint64_t)excludeCategoryFilterAtIndex:(uint64_t)result;
- (uint64_t)includeCategoryFilterAtIndex:(uint64_t)result;
- (unint64_t)hash;
- (void)_initWithDictionary:(int)a3 isJSON:;
- (void)_readExcludeCategoryFilters;
- (void)_readIncludeCategoryFilters;
- (void)addExcludeCategoryFilter:(uint64_t)a1;
- (void)addIncludeCategoryFilter:(uint64_t)a1;
- (void)clearUnknownFields:(uint64_t)a1;
- (void)dealloc;
- (void)mergeFrom:(uint64_t)a1;
- (void)readAll:(uint64_t)a1;
- (void)writeTo:(id)a3;
@end

@implementation GEOPDPoiIconCategoryFilter

- (GEOPDPoiIconCategoryFilter)init
{
  v6.receiver = self;
  v6.super_class = (Class)GEOPDPoiIconCategoryFilter;
  v2 = [(GEOPDPoiIconCategoryFilter *)&v6 init];
  v3 = v2;
  if (v2)
  {
    v2->_readerLock._os_unfair_lock_opaque = 0;
    v4 = v2;
  }

  return v3;
}

- (GEOPDPoiIconCategoryFilter)initWithData:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)GEOPDPoiIconCategoryFilter;
  v3 = [(GEOPDPoiIconCategoryFilter *)&v7 initWithData:a3];
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
  PBRepeatedUInt32Clear();
  PBRepeatedUInt32Clear();
  v3.receiver = self;
  v3.super_class = (Class)GEOPDPoiIconCategoryFilter;
  [(GEOPDPoiIconCategoryFilter *)&v3 dealloc];
}

- (void)_readIncludeCategoryFilters
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 80));
    if ((*(unsigned char *)(a1 + 84) & 4) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOPDPoiIconCategoryFilterReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readIncludeCategoryFilters_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 80));
  }
}

- (void)addIncludeCategoryFilter:(uint64_t)a1
{
  if (a1)
  {
    -[GEOPDPoiIconCategoryFilter _readIncludeCategoryFilters](a1);
    PBRepeatedUInt32Add();
    os_unfair_lock_lock_with_options();
    *(unsigned char *)(a1 + 84) |= 4u;
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 80));
    *(unsigned char *)(a1 + 84) |= 8u;
  }
}

- (uint64_t)includeCategoryFilterAtIndex:(uint64_t)result
{
  if (result)
  {
    uint64_t v3 = result;
    -[GEOPDPoiIconCategoryFilter _readIncludeCategoryFilters](result);
    unint64_t v4 = *(void *)(v3 + 56);
    if (v4 <= a2)
    {
      v5 = (void *)MEMORY[0x1E4F1CA00];
      uint64_t v6 = *MEMORY[0x1E4F1C4A8];
      objc_super v7 = objc_msgSend(NSString, "stringWithFormat:", @"idx (%tu) is out of range (%tu)", a2, v4);
      v8 = [v5 exceptionWithName:v6 reason:v7 userInfo:0];
      [v8 raise];
    }
    return *(unsigned int *)(*(void *)(v3 + 48) + 4 * a2);
  }
  return result;
}

- (void)_readExcludeCategoryFilters
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 80));
    if ((*(unsigned char *)(a1 + 84) & 2) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOPDPoiIconCategoryFilterReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readExcludeCategoryFilters_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 80));
  }
}

- (void)addExcludeCategoryFilter:(uint64_t)a1
{
  if (a1)
  {
    -[GEOPDPoiIconCategoryFilter _readExcludeCategoryFilters](a1);
    PBRepeatedUInt32Add();
    os_unfair_lock_lock_with_options();
    *(unsigned char *)(a1 + 84) |= 2u;
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 80));
    *(unsigned char *)(a1 + 84) |= 8u;
  }
}

- (uint64_t)excludeCategoryFilterAtIndex:(uint64_t)result
{
  if (result)
  {
    uint64_t v3 = result;
    -[GEOPDPoiIconCategoryFilter _readExcludeCategoryFilters](result);
    unint64_t v4 = *(void *)(v3 + 32);
    if (v4 <= a2)
    {
      v5 = (void *)MEMORY[0x1E4F1CA00];
      uint64_t v6 = *MEMORY[0x1E4F1C4A8];
      objc_super v7 = objc_msgSend(NSString, "stringWithFormat:", @"idx (%tu) is out of range (%tu)", a2, v4);
      v8 = [v5 exceptionWithName:v6 reason:v7 userInfo:0];
      [v8 raise];
    }
    return *(unsigned int *)(*(void *)(v3 + 24) + 4 * a2);
  }
  return result;
}

- (id)description
{
  uint64_t v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)GEOPDPoiIconCategoryFilter;
  unint64_t v4 = [(GEOPDPoiIconCategoryFilter *)&v8 description];
  v5 = [(GEOPDPoiIconCategoryFilter *)self dictionaryRepresentation];
  uint64_t v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEOPDPoiIconCategoryFilter _dictionaryRepresentation:](self, 0);
}

- (id)_dictionaryRepresentation:(void *)a1
{
  if (a1)
  {
    -[GEOPDPoiIconCategoryFilter readAll:]((uint64_t)a1, 1);
    unint64_t v4 = [MEMORY[0x1E4F1CA60] dictionary];
    if (a1[7])
    {
      v5 = PBRepeatedUInt32NSArray();
      if (a2) {
        uint64_t v6 = @"includeCategoryFilter";
      }
      else {
        uint64_t v6 = @"include_category_filter";
      }
      [v4 setObject:v5 forKey:v6];
    }
    if (a1[4])
    {
      objc_super v7 = PBRepeatedUInt32NSArray();
      if (a2) {
        objc_super v8 = @"excludeCategoryFilter";
      }
      else {
        objc_super v8 = @"exclude_category_filter";
      }
      [v4 setObject:v7 forKey:v8];
    }
    v9 = (void *)a1[2];
    if (v9)
    {
      v10 = [v9 dictionaryRepresentation];
      v11 = v10;
      if (a2)
      {
        v12 = objc_msgSend(MEMORY[0x1E4F1CA60], "dictionaryWithCapacity:", objc_msgSend(v10, "count"));
        v16[0] = MEMORY[0x1E4F143A8];
        v16[1] = 3221225472;
        v16[2] = __56__GEOPDPoiIconCategoryFilter__dictionaryRepresentation___block_invoke;
        v16[3] = &unk_1E53D8860;
        id v13 = v12;
        id v17 = v13;
        [v11 enumerateKeysAndObjectsUsingBlock:v16];
        id v14 = v13;

        v11 = v14;
      }
      [v4 setObject:v11 forKey:@"Unknown Fields"];
    }
  }
  else
  {
    unint64_t v4 = 0;
  }

  return v4;
}

- (id)jsonRepresentation
{
  return -[GEOPDPoiIconCategoryFilter _dictionaryRepresentation:](self, 1);
}

- (void)readAll:(uint64_t)a1
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 80));
    unint64_t v4 = *(void **)(a1 + 8);
    if (v4)
    {
      id v5 = v4;
      objc_sync_enter(v5);
      if (a2) {
        uint64_t v6 = (int *)&readAll__recursiveTag_256;
      }
      else {
        uint64_t v6 = (int *)&readAll__nonRecursiveTag_257;
      }
      GEOPDPoiIconCategoryFilterReadSpecified(a1, *(void *)(a1 + 8), v6);
      objc_sync_exit(v5);
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 80));
  }
}

void __56__GEOPDPoiIconCategoryFilter__dictionaryRepresentation___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v10 = a2;
  id v5 = a3;
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();
  objc_super v7 = *(void **)(a1 + 32);
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

- (void)_initWithDictionary:(int)a3 isJSON:
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  if (a1)
  {
    a1 = (void *)[a1 init];
    if (a1)
    {
      if (a3) {
        uint64_t v6 = @"includeCategoryFilter";
      }
      else {
        uint64_t v6 = @"include_category_filter";
      }
      objc_super v7 = [v5 objectForKeyedSubscript:v6];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        long long v29 = 0u;
        long long v30 = 0u;
        long long v27 = 0u;
        long long v28 = 0u;
        id v8 = v7;
        uint64_t v9 = [v8 countByEnumeratingWithState:&v27 objects:v32 count:16];
        if (v9)
        {
          uint64_t v10 = v9;
          uint64_t v11 = *(void *)v28;
          do
          {
            uint64_t v12 = 0;
            do
            {
              if (*(void *)v28 != v11) {
                objc_enumerationMutation(v8);
              }
              id v13 = *(void **)(*((void *)&v27 + 1) + 8 * v12);
              objc_opt_class();
              if (objc_opt_isKindOfClass())
              {
                [v13 unsignedIntValue];
                -[GEOPDPoiIconCategoryFilter addIncludeCategoryFilter:]((uint64_t)a1);
              }
              ++v12;
            }
            while (v10 != v12);
            uint64_t v10 = [v8 countByEnumeratingWithState:&v27 objects:v32 count:16];
          }
          while (v10);
        }
      }
      if (a3) {
        id v14 = @"excludeCategoryFilter";
      }
      else {
        id v14 = @"exclude_category_filter";
      }
      v15 = [v5 objectForKeyedSubscript:v14];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        long long v25 = 0u;
        long long v26 = 0u;
        long long v23 = 0u;
        long long v24 = 0u;
        id v16 = v15;
        uint64_t v17 = [v16 countByEnumeratingWithState:&v23 objects:v31 count:16];
        if (v17)
        {
          uint64_t v18 = v17;
          uint64_t v19 = *(void *)v24;
          do
          {
            uint64_t v20 = 0;
            do
            {
              if (*(void *)v24 != v19) {
                objc_enumerationMutation(v16);
              }
              v21 = *(void **)(*((void *)&v23 + 1) + 8 * v20);
              objc_opt_class();
              if (objc_opt_isKindOfClass())
              {
                objc_msgSend(v21, "unsignedIntValue", (void)v23);
                -[GEOPDPoiIconCategoryFilter addExcludeCategoryFilter:]((uint64_t)a1);
              }
              ++v20;
            }
            while (v18 != v20);
            uint64_t v18 = [v16 countByEnumeratingWithState:&v23 objects:v31 count:16];
          }
          while (v18);
        }
      }
    }
  }

  return a1;
}

- (BOOL)readFrom:(id)a3
{
  return GEOPDPoiIconCategoryFilterReadAllFrom((uint64_t)self, a3, 0);
}

- (void)writeTo:(id)a3
{
  id v10 = a3;
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  if (self->_reader && (os_unfair_lock_assert_owner(&self->_readerLock), (*(unsigned char *)&self->_flags & 0xE) == 0))
  {
    id v8 = self->_reader;
    objc_sync_enter(v8);
    *(void *)((char *)self->_reader + (int)*MEMORY[0x1E4F940E0]) = self->_readerMarkLength;
    [(PBDataReader *)self->_reader seekToOffset:self->_readerMarkPos];
    uint64_t v9 = [(PBDataReader *)self->_reader readBytes:self->_readerMarkLength - self->_readerMarkPos];
    [v10 writeData:v9];
    os_unfair_lock_unlock(p_readerLock);

    objc_sync_exit(v8);
  }
  else
  {
    os_unfair_lock_unlock(&self->_readerLock);
    -[GEOPDPoiIconCategoryFilter readAll:]((uint64_t)self, 0);
    id v5 = v10;
    if (self->_includeCategoryFilters.count)
    {
      unint64_t v6 = 0;
      do
      {
        PBDataWriterWriteUint32Field();
        id v5 = v10;
        ++v6;
      }
      while (v6 < self->_includeCategoryFilters.count);
    }
    if (self->_excludeCategoryFilters.count)
    {
      unint64_t v7 = 0;
      do
      {
        PBDataWriterWriteUint32Field();
        id v5 = v10;
        ++v7;
      }
      while (v7 < self->_excludeCategoryFilters.count);
    }
    [(PBUnknownFields *)self->_unknownFields writeTo:v5];
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  unint64_t v4 = (id *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  os_unfair_lock_lock(&self->_readerLock);
  reader = self->_reader;
  if (!reader) {
    goto LABEL_5;
  }
  unint64_t v6 = reader;
  objc_sync_enter(v6);
  if ((*(unsigned char *)&self->_flags & 8) != 0)
  {
    objc_sync_exit(v6);

LABEL_5:
    os_unfair_lock_unlock(&self->_readerLock);
    -[GEOPDPoiIconCategoryFilter readAll:]((uint64_t)self, 0);
    PBRepeatedUInt32Copy();
    PBRepeatedUInt32Copy();
    objc_storeStrong(v4 + 2, self->_unknownFields);
    return v4;
  }
  *(void *)((char *)self->_reader + (int)*MEMORY[0x1E4F940E0]) = self->_readerMarkLength;
  [(PBDataReader *)self->_reader seekToOffset:self->_readerMarkPos];
  GEOPDPoiIconCategoryFilterReadAllFrom((uint64_t)v4, self->_reader, 0);
  os_unfair_lock_unlock(&self->_readerLock);
  objc_sync_exit(v6);

  return v4;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if ([v4 isMemberOfClass:objc_opt_class()]
    && (-[GEOPDPoiIconCategoryFilter readAll:]((uint64_t)self, 1),
        -[GEOPDPoiIconCategoryFilter readAll:]((uint64_t)v4, 1),
        PBRepeatedUInt32IsEqual()))
  {
    char IsEqual = PBRepeatedUInt32IsEqual();
  }
  else
  {
    char IsEqual = 0;
  }

  return IsEqual;
}

- (unint64_t)hash
{
  -[GEOPDPoiIconCategoryFilter readAll:]((uint64_t)self, 1);
  uint64_t v2 = PBRepeatedUInt32Hash();
  return PBRepeatedUInt32Hash() ^ v2;
}

- (void)mergeFrom:(uint64_t)a1
{
  id v3 = a2;
  if (a1)
  {
    id v8 = v3;
    -[GEOPDPoiIconCategoryFilter readAll:]((uint64_t)v3, 0);
    id v3 = v8;
    if (v8)
    {
      -[GEOPDPoiIconCategoryFilter _readIncludeCategoryFilters]((uint64_t)v8);
      uint64_t v4 = *((void *)v8 + 7);
      if (v4)
      {
        for (unint64_t i = 0; i != v4; ++i)
        {
          -[GEOPDPoiIconCategoryFilter includeCategoryFilterAtIndex:]((uint64_t)v8, i);
          -[GEOPDPoiIconCategoryFilter addIncludeCategoryFilter:](a1);
        }
      }
      -[GEOPDPoiIconCategoryFilter _readExcludeCategoryFilters]((uint64_t)v8);
      id v3 = v8;
      uint64_t v6 = *((void *)v8 + 4);
      if (v6)
      {
        for (unint64_t j = 0; j != v6; ++j)
        {
          -[GEOPDPoiIconCategoryFilter excludeCategoryFilterAtIndex:]((uint64_t)v8, j);
          -[GEOPDPoiIconCategoryFilter addExcludeCategoryFilter:](a1);
          id v3 = v8;
        }
      }
    }
  }
}

- (void)clearUnknownFields:(uint64_t)a1
{
  if (a1)
  {
    os_unfair_lock_lock_with_options();
    *(unsigned char *)(a1 + 84) |= 1u;
    *(unsigned char *)(a1 + 84) |= 8u;
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 80));
    uint64_t v4 = *(void **)(a1 + 16);
    *(void *)(a1 + 16) = 0;

    if (a2)
    {
      -[GEOPDPoiIconCategoryFilter readAll:](a1, 0);
    }
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_unknownFields, 0);

  objc_storeStrong((id *)&self->_reader, 0);
}

@end