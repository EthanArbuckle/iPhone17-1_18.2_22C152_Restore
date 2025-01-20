@interface GEOPDAddressResultSubTypeFilter
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (GEOPDAddressResultSubTypeFilter)init;
- (GEOPDAddressResultSubTypeFilter)initWithData:(id)a3;
- (id)_dictionaryRepresentation:(void *)a1;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)jsonRepresentation;
- (uint64_t)_initWithDictionary:(int)a3 isJSON:;
- (uint64_t)excludeAddressSubTypeFilterAtIndex:(uint64_t)result;
- (uint64_t)includeAddressSubTypeFilterAtIndex:(uint64_t)result;
- (unint64_t)hash;
- (void)_readExcludeAddressSubTypeFilters;
- (void)_readIncludeAddressSubTypeFilters;
- (void)addExcludeAddressSubTypeFilter:(uint64_t)a1;
- (void)addIncludeAddressSubTypeFilter:(uint64_t)a1;
- (void)clearUnknownFields:(uint64_t)a1;
- (void)dealloc;
- (void)mergeFrom:(uint64_t)a1;
- (void)readAll:(uint64_t)a1;
- (void)writeTo:(id)a3;
@end

@implementation GEOPDAddressResultSubTypeFilter

- (GEOPDAddressResultSubTypeFilter)init
{
  v6.receiver = self;
  v6.super_class = (Class)GEOPDAddressResultSubTypeFilter;
  v2 = [(GEOPDAddressResultSubTypeFilter *)&v6 init];
  v3 = v2;
  if (v2)
  {
    v2->_readerLock._os_unfair_lock_opaque = 0;
    v4 = v2;
  }

  return v3;
}

- (GEOPDAddressResultSubTypeFilter)initWithData:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)GEOPDAddressResultSubTypeFilter;
  v3 = [(GEOPDAddressResultSubTypeFilter *)&v7 initWithData:a3];
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
  PBRepeatedInt32Clear();
  PBRepeatedInt32Clear();
  v3.receiver = self;
  v3.super_class = (Class)GEOPDAddressResultSubTypeFilter;
  [(GEOPDAddressResultSubTypeFilter *)&v3 dealloc];
}

- (void)_readIncludeAddressSubTypeFilters
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
        GEOPDAddressResultSubTypeFilterReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readIncludeAddressSubTypeFilters_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 80));
  }
}

- (void)addIncludeAddressSubTypeFilter:(uint64_t)a1
{
  if (a1)
  {
    -[GEOPDAddressResultSubTypeFilter _readIncludeAddressSubTypeFilters](a1);
    PBRepeatedInt32Add();
    os_unfair_lock_lock_with_options();
    *(unsigned char *)(a1 + 84) |= 4u;
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 80));
    *(unsigned char *)(a1 + 84) |= 8u;
  }
}

- (uint64_t)includeAddressSubTypeFilterAtIndex:(uint64_t)result
{
  if (result)
  {
    uint64_t v3 = result;
    -[GEOPDAddressResultSubTypeFilter _readIncludeAddressSubTypeFilters](result);
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

- (void)_readExcludeAddressSubTypeFilters
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
        GEOPDAddressResultSubTypeFilterReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readExcludeAddressSubTypeFilters_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 80));
  }
}

- (void)addExcludeAddressSubTypeFilter:(uint64_t)a1
{
  if (a1)
  {
    -[GEOPDAddressResultSubTypeFilter _readExcludeAddressSubTypeFilters](a1);
    PBRepeatedInt32Add();
    os_unfair_lock_lock_with_options();
    *(unsigned char *)(a1 + 84) |= 2u;
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 80));
    *(unsigned char *)(a1 + 84) |= 8u;
  }
}

- (uint64_t)excludeAddressSubTypeFilterAtIndex:(uint64_t)result
{
  if (result)
  {
    uint64_t v3 = result;
    -[GEOPDAddressResultSubTypeFilter _readExcludeAddressSubTypeFilters](result);
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
  v8.super_class = (Class)GEOPDAddressResultSubTypeFilter;
  unint64_t v4 = [(GEOPDAddressResultSubTypeFilter *)&v8 description];
  v5 = [(GEOPDAddressResultSubTypeFilter *)self dictionaryRepresentation];
  uint64_t v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEOPDAddressResultSubTypeFilter _dictionaryRepresentation:](self, 0);
}

- (id)_dictionaryRepresentation:(void *)a1
{
  if (a1)
  {
    -[GEOPDAddressResultSubTypeFilter readAll:]((uint64_t)a1, 1);
    unint64_t v4 = [MEMORY[0x1E4F1CA60] dictionary];
    if (a1[7])
    {
      v5 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:");
      uint64_t v6 = a1 + 6;
      if (a1[7])
      {
        unint64_t v7 = 0;
        do
        {
          uint64_t v8 = *(int *)(*v6 + 4 * v7);
          if (v8 >= 7)
          {
            objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", v8);
            v9 = (__CFString *)objc_claimAutoreleasedReturnValue();
          }
          else
          {
            v9 = off_1E53E5B40[v8];
          }
          [v5 addObject:v9];

          ++v7;
          uint64_t v6 = a1 + 6;
        }
        while (v7 < a1[7]);
      }
      if (a2) {
        v10 = @"includeAddressSubTypeFilter";
      }
      else {
        v10 = @"include_address_sub_type_filter";
      }
      [v4 setObject:v5 forKey:v10];
    }
    if (a1[4])
    {
      v11 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:");
      v12 = a1 + 3;
      if (a1[4])
      {
        unint64_t v13 = 0;
        do
        {
          uint64_t v14 = *(int *)(*v12 + 4 * v13);
          if (v14 >= 7)
          {
            objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", v14);
            v15 = (__CFString *)objc_claimAutoreleasedReturnValue();
          }
          else
          {
            v15 = off_1E53E5B40[v14];
          }
          [v11 addObject:v15];

          ++v13;
          v12 = a1 + 3;
        }
        while (v13 < a1[4]);
      }
      if (a2) {
        v16 = @"excludeAddressSubTypeFilter";
      }
      else {
        v16 = @"exclude_address_sub_type_filter";
      }
      [v4 setObject:v11 forKey:v16];
    }
    v17 = (void *)a1[2];
    if (v17)
    {
      v18 = [v17 dictionaryRepresentation];
      v19 = v18;
      if (a2)
      {
        v20 = objc_msgSend(MEMORY[0x1E4F1CA60], "dictionaryWithCapacity:", objc_msgSend(v18, "count"));
        v24[0] = MEMORY[0x1E4F143A8];
        v24[1] = 3221225472;
        v24[2] = __61__GEOPDAddressResultSubTypeFilter__dictionaryRepresentation___block_invoke;
        v24[3] = &unk_1E53D8860;
        id v21 = v20;
        id v25 = v21;
        [v19 enumerateKeysAndObjectsUsingBlock:v24];
        id v22 = v21;

        v19 = v22;
      }
      [v4 setObject:v19 forKey:@"Unknown Fields"];
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
  return -[GEOPDAddressResultSubTypeFilter _dictionaryRepresentation:](self, 1);
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
        uint64_t v6 = (int *)&readAll__recursiveTag_43;
      }
      else {
        uint64_t v6 = (int *)&readAll__nonRecursiveTag_43;
      }
      GEOPDAddressResultSubTypeFilterReadSpecified(a1, *(void *)(a1 + 8), v6);
      objc_sync_exit(v5);
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 80));
  }
}

void __61__GEOPDAddressResultSubTypeFilter__dictionaryRepresentation___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v10 = a2;
  id v5 = a3;
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();
  unint64_t v7 = *(void **)(a1 + 32);
  if (isKindOfClass)
  {
    uint64_t v8 = [v5 base64EncodedStringWithOptions:0];
    v9 = [v10 description];
    [v7 setObject:v8 forKey:v9];
  }
  else
  {
    uint64_t v8 = [v10 description];
    [v7 setObject:v5 forKey:v8];
  }
}

- (uint64_t)_initWithDictionary:(int)a3 isJSON:
{
  uint64_t v39 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  if (a1)
  {
    uint64_t v6 = [a1 init];
    if (v6)
    {
      if (a3) {
        unint64_t v7 = @"includeAddressSubTypeFilter";
      }
      else {
        unint64_t v7 = @"include_address_sub_type_filter";
      }
      uint64_t v8 = [v5 objectForKeyedSubscript:v7];
      objc_opt_class();
      id v28 = v5;
      if (objc_opt_isKindOfClass())
      {
        long long v35 = 0u;
        long long v36 = 0u;
        long long v33 = 0u;
        long long v34 = 0u;
        v26 = v8;
        id v9 = v8;
        uint64_t v10 = [v9 countByEnumeratingWithState:&v33 objects:v38 count:16];
        if (!v10) {
          goto LABEL_27;
        }
        uint64_t v11 = v10;
        uint64_t v12 = *(void *)v34;
        while (1)
        {
          for (uint64_t i = 0; i != v11; ++i)
          {
            if (*(void *)v34 != v12) {
              objc_enumerationMutation(v9);
            }
            uint64_t v14 = *(void **)(*((void *)&v33 + 1) + 8 * i);
            objc_opt_class();
            if (objc_opt_isKindOfClass())
            {
              id v15 = v14;
              if (([v15 isEqualToString:@"ADDRESS_SUBTYPE_UNKNOWN"] & 1) == 0
                && ([v15 isEqualToString:@"ADDRESS_SUBTYPE_COUNTRY"] & 1) == 0
                && ([v15 isEqualToString:@"ADDRESS_SUBTYPE_ADMINISTRATIVE_AREA"] & 1) == 0
                && ([v15 isEqualToString:@"ADDRESS_SUBTYPE_SUB_ADMINISTRATIVE_AREA"] & 1) == 0
                && ([v15 isEqualToString:@"ADDRESS_SUBTYPE_LOCALITY"] & 1) == 0
                && ([v15 isEqualToString:@"ADDRESS_SUBTYPE_SUB_LOCALITY"] & 1) == 0)
              {
                [v15 isEqualToString:@"ADDRESS_SUBTYPE_POSTAL_CODE"];
              }
            }
            else
            {
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) == 0) {
                continue;
              }
              [v14 intValue];
            }
            -[GEOPDAddressResultSubTypeFilter addIncludeAddressSubTypeFilter:](v6);
          }
          uint64_t v11 = [v9 countByEnumeratingWithState:&v33 objects:v38 count:16];
          if (!v11)
          {
LABEL_27:

            id v5 = v28;
            uint64_t v8 = v26;
            break;
          }
        }
      }

      if (a3) {
        v16 = @"excludeAddressSubTypeFilter";
      }
      else {
        v16 = @"exclude_address_sub_type_filter";
      }
      v17 = [v5 objectForKeyedSubscript:v16];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        long long v31 = 0u;
        long long v32 = 0u;
        long long v29 = 0u;
        long long v30 = 0u;
        v27 = v17;
        id v18 = v17;
        uint64_t v19 = [v18 countByEnumeratingWithState:&v29 objects:v37 count:16];
        if (!v19) {
          goto LABEL_52;
        }
        uint64_t v20 = v19;
        uint64_t v21 = *(void *)v30;
        while (1)
        {
          for (uint64_t j = 0; j != v20; ++j)
          {
            if (*(void *)v30 != v21) {
              objc_enumerationMutation(v18);
            }
            v23 = *(void **)(*((void *)&v29 + 1) + 8 * j);
            objc_opt_class();
            if (objc_opt_isKindOfClass())
            {
              id v24 = v23;
              if (([v24 isEqualToString:@"ADDRESS_SUBTYPE_UNKNOWN"] & 1) == 0
                && ([v24 isEqualToString:@"ADDRESS_SUBTYPE_COUNTRY"] & 1) == 0
                && ([v24 isEqualToString:@"ADDRESS_SUBTYPE_ADMINISTRATIVE_AREA"] & 1) == 0
                && ([v24 isEqualToString:@"ADDRESS_SUBTYPE_SUB_ADMINISTRATIVE_AREA"] & 1) == 0
                && ([v24 isEqualToString:@"ADDRESS_SUBTYPE_LOCALITY"] & 1) == 0
                && ([v24 isEqualToString:@"ADDRESS_SUBTYPE_SUB_LOCALITY"] & 1) == 0)
              {
                [v24 isEqualToString:@"ADDRESS_SUBTYPE_POSTAL_CODE"];
              }
            }
            else
            {
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) == 0) {
                continue;
              }
              [v23 intValue];
            }
            -[GEOPDAddressResultSubTypeFilter addExcludeAddressSubTypeFilter:](v6);
          }
          uint64_t v20 = [v18 countByEnumeratingWithState:&v29 objects:v37 count:16];
          if (!v20)
          {
LABEL_52:

            v17 = v27;
            id v5 = v28;
            break;
          }
        }
      }
    }
  }
  else
  {
    uint64_t v6 = 0;
  }

  return v6;
}

- (BOOL)readFrom:(id)a3
{
  return GEOPDAddressResultSubTypeFilterReadAllFrom((uint64_t)self, a3, 0);
}

- (void)writeTo:(id)a3
{
  id v10 = a3;
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  if (self->_reader && (os_unfair_lock_assert_owner(&self->_readerLock), (*(unsigned char *)&self->_flags & 0xE) == 0))
  {
    uint64_t v8 = self->_reader;
    objc_sync_enter(v8);
    *(void *)((char *)self->_reader + (int)*MEMORY[0x1E4F940E0]) = self->_readerMarkLength;
    [(PBDataReader *)self->_reader seekToOffset:self->_readerMarkPos];
    id v9 = [(PBDataReader *)self->_reader readBytes:self->_readerMarkLength - self->_readerMarkPos];
    [v10 writeData:v9];
    os_unfair_lock_unlock(p_readerLock);

    objc_sync_exit(v8);
  }
  else
  {
    os_unfair_lock_unlock(&self->_readerLock);
    -[GEOPDAddressResultSubTypeFilter readAll:]((uint64_t)self, 0);
    id v5 = v10;
    if (self->_includeAddressSubTypeFilters.count)
    {
      unint64_t v6 = 0;
      do
      {
        PBDataWriterWriteInt32Field();
        id v5 = v10;
        ++v6;
      }
      while (v6 < self->_includeAddressSubTypeFilters.count);
    }
    if (self->_excludeAddressSubTypeFilters.count)
    {
      unint64_t v7 = 0;
      do
      {
        PBDataWriterWriteInt32Field();
        id v5 = v10;
        ++v7;
      }
      while (v7 < self->_excludeAddressSubTypeFilters.count);
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
    -[GEOPDAddressResultSubTypeFilter readAll:]((uint64_t)self, 0);
    PBRepeatedInt32Copy();
    PBRepeatedInt32Copy();
    objc_storeStrong(v4 + 2, self->_unknownFields);
    return v4;
  }
  *(void *)((char *)self->_reader + (int)*MEMORY[0x1E4F940E0]) = self->_readerMarkLength;
  [(PBDataReader *)self->_reader seekToOffset:self->_readerMarkPos];
  GEOPDAddressResultSubTypeFilterReadAllFrom((uint64_t)v4, self->_reader, 0);
  os_unfair_lock_unlock(&self->_readerLock);
  objc_sync_exit(v6);

  return v4;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if ([v4 isMemberOfClass:objc_opt_class()]
    && (-[GEOPDAddressResultSubTypeFilter readAll:]((uint64_t)self, 1),
        -[GEOPDAddressResultSubTypeFilter readAll:]((uint64_t)v4, 1),
        PBRepeatedInt32IsEqual()))
  {
    char IsEqual = PBRepeatedInt32IsEqual();
  }
  else
  {
    char IsEqual = 0;
  }

  return IsEqual;
}

- (unint64_t)hash
{
  -[GEOPDAddressResultSubTypeFilter readAll:]((uint64_t)self, 1);
  uint64_t v2 = PBRepeatedInt32Hash();
  return PBRepeatedInt32Hash() ^ v2;
}

- (void)mergeFrom:(uint64_t)a1
{
  id v3 = a2;
  if (a1)
  {
    id v8 = v3;
    -[GEOPDAddressResultSubTypeFilter readAll:]((uint64_t)v3, 0);
    id v3 = v8;
    if (v8)
    {
      -[GEOPDAddressResultSubTypeFilter _readIncludeAddressSubTypeFilters]((uint64_t)v8);
      uint64_t v4 = *((void *)v8 + 7);
      if (v4)
      {
        for (unint64_t i = 0; i != v4; ++i)
        {
          -[GEOPDAddressResultSubTypeFilter includeAddressSubTypeFilterAtIndex:]((uint64_t)v8, i);
          -[GEOPDAddressResultSubTypeFilter addIncludeAddressSubTypeFilter:](a1);
        }
      }
      -[GEOPDAddressResultSubTypeFilter _readExcludeAddressSubTypeFilters]((uint64_t)v8);
      id v3 = v8;
      uint64_t v6 = *((void *)v8 + 4);
      if (v6)
      {
        for (unint64_t j = 0; j != v6; ++j)
        {
          -[GEOPDAddressResultSubTypeFilter excludeAddressSubTypeFilterAtIndex:]((uint64_t)v8, j);
          -[GEOPDAddressResultSubTypeFilter addExcludeAddressSubTypeFilter:](a1);
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
      -[GEOPDAddressResultSubTypeFilter readAll:](a1, 0);
    }
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_unknownFields, 0);

  objc_storeStrong((id *)&self->_reader, 0);
}

@end