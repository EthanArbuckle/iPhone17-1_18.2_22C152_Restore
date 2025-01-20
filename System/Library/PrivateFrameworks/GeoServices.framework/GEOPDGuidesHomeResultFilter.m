@interface GEOPDGuidesHomeResultFilter
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (GEOPDGuidesHomeResultFilter)init;
- (GEOPDGuidesHomeResultFilter)initWithData:(id)a3;
- (id)_dictionaryRepresentation:(uint64_t)a1;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)filterConcept;
- (id)jsonRepresentation;
- (uint64_t)_initWithDictionary:(uint64_t)a3 isJSON:;
- (uint64_t)filterType;
- (unint64_t)hash;
- (void)_addNoFlagsSubFilter:(uint64_t)a1;
- (void)_readFilterConcept;
- (void)addSubFilter:(uint64_t)a1;
- (void)clearUnknownFields:(uint64_t)a1;
- (void)readAll:(uint64_t)a1;
- (void)setFilterConcept:(uint64_t)a1;
- (void)writeTo:(id)a3;
@end

@implementation GEOPDGuidesHomeResultFilter

- (void)clearUnknownFields:(uint64_t)a1
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  if (a1)
  {
    os_unfair_lock_lock_with_options();
    *(unsigned char *)(a1 + 56) |= 2u;
    *(unsigned char *)(a1 + 56) |= 0x10u;
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 48));
    v2 = *(void **)(a1 + 16);
    *(void *)(a1 + 16) = 0;

    -[GEOPDGuidesHomeResultFilter readAll:](a1, 0);
    uint64_t v3 = *(void *)(a1 + 24);
    if (v3)
    {
      v4 = *(void **)(v3 + 8);
      *(void *)(v3 + 8) = 0;

      -[GEOPDRelatedSearchSuggestion clearUnknownFields:](*(void *)(v3 + 16), 1);
    }
    long long v12 = 0u;
    long long v13 = 0u;
    long long v10 = 0u;
    long long v11 = 0u;
    id v5 = *(id *)(a1 + 32);
    uint64_t v6 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
    if (v6)
    {
      uint64_t v7 = v6;
      uint64_t v8 = *(void *)v11;
      do
      {
        uint64_t v9 = 0;
        do
        {
          if (*(void *)v11 != v8) {
            objc_enumerationMutation(v5);
          }
          -[GEOPDGuidesHomeResultFilter clearUnknownFields:](*(void *)(*((void *)&v10 + 1) + 8 * v9++));
        }
        while (v7 != v9);
        uint64_t v7 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
      }
      while (v7);
    }
  }
}

- (GEOPDGuidesHomeResultFilter)init
{
  v6.receiver = self;
  v6.super_class = (Class)GEOPDGuidesHomeResultFilter;
  v2 = [(GEOPDGuidesHomeResultFilter *)&v6 init];
  uint64_t v3 = v2;
  if (v2)
  {
    v2->_readerLock._os_unfair_lock_opaque = 0;
    v4 = v2;
  }

  return v3;
}

- (GEOPDGuidesHomeResultFilter)initWithData:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)GEOPDGuidesHomeResultFilter;
  uint64_t v3 = [(GEOPDGuidesHomeResultFilter *)&v7 initWithData:a3];
  v4 = v3;
  if (v3)
  {
    v3->_readerLock._os_unfair_lock_opaque = 0;
    id v5 = v3;
  }

  return v4;
}

- (uint64_t)filterType
{
  if (result)
  {
    uint64_t v1 = result;
    os_unfair_lock_lock_with_options();
    char v2 = *(unsigned char *)(v1 + 56);
    os_unfair_lock_unlock((os_unfair_lock_t)(v1 + 48));
    if (v2) {
      return *(unsigned int *)(v1 + 52);
    }
    else {
      return 0;
    }
  }
  return result;
}

- (void)_readFilterConcept
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 48));
    if ((*(unsigned char *)(a1 + 56) & 4) == 0)
    {
      char v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOPDGuidesHomeResultFilterReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readFilterConcept_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 48));
  }
}

- (id)filterConcept
{
  if (a1)
  {
    char v2 = a1;
    -[GEOPDGuidesHomeResultFilter _readFilterConcept]((uint64_t)a1);
    a1 = (id *)v2[3];
    uint64_t v1 = vars8;
  }
  return a1;
}

- (void)setFilterConcept:(uint64_t)a1
{
  id v4 = a2;
  if (a1)
  {
    *(unsigned char *)(a1 + 56) |= 4u;
    *(unsigned char *)(a1 + 56) |= 0x10u;
    objc_storeStrong((id *)(a1 + 24), a2);
  }
}

- (void)addSubFilter:(uint64_t)a1
{
  if (a1)
  {
    id v3 = a2;
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 48));
    if ((*(unsigned char *)(a1 + 56) & 8) == 0)
    {
      id v4 = *(void **)(a1 + 8);
      if (v4)
      {
        id v5 = v4;
        objc_sync_enter(v5);
        GEOPDGuidesHomeResultFilterReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readSubFilters_tags);
        objc_sync_exit(v5);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 48));
    -[GEOPDGuidesHomeResultFilter _addNoFlagsSubFilter:](a1, v3);

    os_unfair_lock_lock_with_options();
    *(unsigned char *)(a1 + 56) |= 8u;
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 48));
    *(unsigned char *)(a1 + 56) |= 0x10u;
  }
}

- (void)_addNoFlagsSubFilter:(uint64_t)a1
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

- (id)description
{
  id v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)GEOPDGuidesHomeResultFilter;
  id v4 = [(GEOPDGuidesHomeResultFilter *)&v8 description];
  id v5 = [(GEOPDGuidesHomeResultFilter *)self dictionaryRepresentation];
  objc_super v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEOPDGuidesHomeResultFilter _dictionaryRepresentation:]((uint64_t)self, 0);
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  if (a1)
  {
    -[GEOPDGuidesHomeResultFilter readAll:](a1, 1);
    id v4 = [MEMORY[0x1E4F1CA60] dictionary];
    if (*(unsigned char *)(a1 + 56))
    {
      int v5 = *(_DWORD *)(a1 + 52);
      if (v5)
      {
        if (v5 == 1)
        {
          objc_super v6 = @"GUIDES_HOME_RESULT_FILTER_TYPE_CONCEPT";
        }
        else
        {
          objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(unsigned int *)(a1 + 52));
          objc_super v6 = (__CFString *)objc_claimAutoreleasedReturnValue();
        }
      }
      else
      {
        objc_super v6 = @"GUIDES_HOME_RESULT_FILTER_TYPE_UNKNOWN";
      }
      if (a2) {
        id v7 = @"filterType";
      }
      else {
        id v7 = @"filter_type";
      }
      [v4 setObject:v6 forKey:v7];
    }
    objc_super v8 = -[GEOPDGuidesHomeResultFilter filterConcept]((id *)a1);
    uint64_t v9 = v8;
    if (v8)
    {
      if (a2)
      {
        long long v10 = [v8 jsonRepresentation];
        long long v11 = @"filterConcept";
      }
      else
      {
        long long v10 = [v8 dictionaryRepresentation];
        long long v11 = @"filter_concept";
      }
      [v4 setObject:v10 forKey:v11];
    }
    if ([*(id *)(a1 + 32) count])
    {
      long long v12 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(*(id *)(a1 + 32), "count"));
      long long v30 = 0u;
      long long v31 = 0u;
      long long v32 = 0u;
      long long v33 = 0u;
      id v13 = *(id *)(a1 + 32);
      uint64_t v14 = [v13 countByEnumeratingWithState:&v30 objects:v34 count:16];
      if (v14)
      {
        uint64_t v15 = v14;
        uint64_t v16 = *(void *)v31;
        do
        {
          for (uint64_t i = 0; i != v15; ++i)
          {
            if (*(void *)v31 != v16) {
              objc_enumerationMutation(v13);
            }
            v18 = *(void **)(*((void *)&v30 + 1) + 8 * i);
            if (a2) {
              [v18 jsonRepresentation];
            }
            else {
            v19 = [v18 dictionaryRepresentation];
            }
            [v12 addObject:v19];
          }
          uint64_t v15 = [v13 countByEnumeratingWithState:&v30 objects:v34 count:16];
        }
        while (v15);
      }

      if (a2) {
        v20 = @"subFilter";
      }
      else {
        v20 = @"sub_filter";
      }
      [v4 setObject:v12 forKey:v20];
    }
    v21 = *(void **)(a1 + 16);
    if (v21)
    {
      v22 = [v21 dictionaryRepresentation];
      v23 = v22;
      if (a2)
      {
        v24 = objc_msgSend(MEMORY[0x1E4F1CA60], "dictionaryWithCapacity:", objc_msgSend(v22, "count"));
        v28[0] = MEMORY[0x1E4F143A8];
        v28[1] = 3221225472;
        v28[2] = __57__GEOPDGuidesHomeResultFilter__dictionaryRepresentation___block_invoke;
        v28[3] = &unk_1E53D8860;
        id v25 = v24;
        id v29 = v25;
        [v23 enumerateKeysAndObjectsUsingBlock:v28];
        id v26 = v25;

        v23 = v26;
      }
      [v4 setObject:v23 forKey:@"Unknown Fields"];
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
  return -[GEOPDGuidesHomeResultFilter _dictionaryRepresentation:]((uint64_t)self, 1);
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
        objc_super v6 = (int *)&readAll__recursiveTag_3253;
      }
      else {
        objc_super v6 = (int *)&readAll__nonRecursiveTag_3254;
      }
      GEOPDGuidesHomeResultFilterReadSpecified(a1, *(void *)(a1 + 8), v6);
      objc_sync_exit(v5);
    }
    if (a2) {
      _GEOPDGuidesHomeResultFilterCallReadAllRecursiveWithoutSynchronized(a1);
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 48));
  }
}

void __57__GEOPDGuidesHomeResultFilter__dictionaryRepresentation___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v10 = a2;
  id v5 = a3;
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();
  id v7 = *(void **)(a1 + 32);
  if (isKindOfClass)
  {
    objc_super v8 = [v5 base64EncodedStringWithOptions:0];
    uint64_t v9 = [v10 description];
    [v7 setObject:v8 forKey:v9];
  }
  else
  {
    objc_super v8 = [v10 description];
    [v7 setObject:v5 forKey:v8];
  }
}

- (uint64_t)_initWithDictionary:(uint64_t)a3 isJSON:
{
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  uint64_t v6 = [a1 init];
  if (!v6) {
    goto LABEL_48;
  }
  if (a3) {
    id v7 = @"filterType";
  }
  else {
    id v7 = @"filter_type";
  }
  objc_super v8 = [v5 objectForKeyedSubscript:v7];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v9 = v8;
    if ([v9 isEqualToString:@"GUIDES_HOME_RESULT_FILTER_TYPE_UNKNOWN"]) {
      int v10 = 0;
    }
    else {
      int v10 = [v9 isEqualToString:@"GUIDES_HOME_RESULT_FILTER_TYPE_CONCEPT"];
    }

    goto LABEL_12;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    int v10 = [v8 intValue];
LABEL_12:
    *(unsigned char *)(v6 + 56) |= 0x10u;
    *(unsigned char *)(v6 + 56) |= 1u;
    *(_DWORD *)(v6 + 52) = v10;
  }

  if (a3) {
    long long v11 = @"filterConcept";
  }
  else {
    long long v11 = @"filter_concept";
  }
  long long v12 = [v5 objectForKeyedSubscript:v11];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v13 = [GEOPDGuidesHomeResultFilterTypeConcept alloc];
    if (v13)
    {
      id v14 = v12;
      id v13 = [(GEOPDGuidesHomeResultFilterTypeConcept *)v13 init];
      if (v13)
      {
        if (a3) {
          uint64_t v15 = @"relatedSearchSuggestion";
        }
        else {
          uint64_t v15 = @"related_search_suggestion";
        }
        uint64_t v16 = [v14 objectForKeyedSubscript:v15];
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          v17 = [GEOPDRelatedSearchSuggestion alloc];
          if (v17) {
            v18 = -[GEOPDRelatedSearchSuggestion _initWithDictionary:isJSON:](v17, v16, a3);
          }
          else {
            v18 = 0;
          }
          -[GEOPDGuidesHomeResultFilterTypeConcept setRelatedSearchSuggestion:]((uint64_t)v13, v18);
        }
      }
    }
    -[GEOPDGuidesHomeResultFilter setFilterConcept:](v6, v13);
  }
  if (a3) {
    v19 = @"subFilter";
  }
  else {
    v19 = @"sub_filter";
  }
  v20 = [v5 objectForKeyedSubscript:v19];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v31 = v5;
    long long v34 = 0u;
    long long v35 = 0u;
    long long v32 = 0u;
    long long v33 = 0u;
    id v21 = v20;
    uint64_t v22 = [v21 countByEnumeratingWithState:&v32 objects:v36 count:16];
    if (v22)
    {
      uint64_t v23 = v22;
      uint64_t v24 = *(void *)v33;
      do
      {
        uint64_t v25 = 0;
        do
        {
          if (*(void *)v33 != v24) {
            objc_enumerationMutation(v21);
          }
          uint64_t v26 = *(void *)(*((void *)&v32 + 1) + 8 * v25);
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            v27 = [GEOPDGuidesHomeResultFilter alloc];
            if (v27) {
              v28 = (void *)-[GEOPDGuidesHomeResultFilter _initWithDictionary:isJSON:](v27, v26, a3);
            }
            else {
              v28 = 0;
            }
            -[GEOPDGuidesHomeResultFilter addSubFilter:](v6, v28);
          }
          ++v25;
        }
        while (v23 != v25);
        uint64_t v29 = [v21 countByEnumeratingWithState:&v32 objects:v36 count:16];
        uint64_t v23 = v29;
      }
      while (v29);
    }

    id v5 = v31;
  }

LABEL_48:
  return v6;
}

- (BOOL)readFrom:(id)a3
{
  return GEOPDGuidesHomeResultFilterReadAllFrom((uint64_t)self, a3, 0);
}

- (void)writeTo:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  if (self->_reader && (_GEOPDGuidesHomeResultFilterIsDirty((uint64_t)self) & 1) == 0)
  {
    int v10 = self->_reader;
    objc_sync_enter(v10);
    *(void *)((char *)self->_reader + (int)*MEMORY[0x1E4F940E0]) = self->_readerMarkLength;
    [(PBDataReader *)self->_reader seekToOffset:self->_readerMarkPos];
    long long v11 = [(PBDataReader *)self->_reader readBytes:self->_readerMarkLength - self->_readerMarkPos];
    [v4 writeData:v11];
    os_unfair_lock_unlock(p_readerLock);

    objc_sync_exit(v10);
  }
  else
  {
    os_unfair_lock_unlock(&self->_readerLock);
    -[GEOPDGuidesHomeResultFilter readAll:]((uint64_t)self, 0);
    if (*(unsigned char *)&self->_flags) {
      PBDataWriterWriteInt32Field();
    }
    if (self->_filterConcept) {
      PBDataWriterWriteSubmessage();
    }
    long long v14 = 0u;
    long long v15 = 0u;
    long long v12 = 0u;
    long long v13 = 0u;
    uint64_t v6 = self->_subFilters;
    uint64_t v7 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v12 objects:v16 count:16];
    if (v7)
    {
      uint64_t v8 = *(void *)v13;
      do
      {
        uint64_t v9 = 0;
        do
        {
          if (*(void *)v13 != v8) {
            objc_enumerationMutation(v6);
          }
          PBDataWriterWriteSubmessage();
          ++v9;
        }
        while (v7 != v9);
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
      GEOPDGuidesHomeResultFilterReadAllFrom(v5, self->_reader, 0);
      os_unfair_lock_unlock(&self->_readerLock);
      id v8 = (id)v5;
      objc_sync_exit(v7);

      goto LABEL_15;
    }
    objc_sync_exit(v7);
  }
  os_unfair_lock_unlock(&self->_readerLock);
  -[GEOPDGuidesHomeResultFilter readAll:]((uint64_t)self, 0);
  if (*(unsigned char *)&self->_flags)
  {
    *(_DWORD *)(v5 + 52) = self->_filterType;
    *(unsigned char *)(v5 + 56) |= 1u;
  }
  id v9 = [(GEOPDGuidesHomeResultFilterTypeConcept *)self->_filterConcept copyWithZone:a3];
  int v10 = *(void **)(v5 + 24);
  *(void *)(v5 + 24) = v9;

  long long v20 = 0u;
  long long v21 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v11 = self->_subFilters;
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
        -[GEOPDGuidesHomeResultFilter addSubFilter:](v5, v15);
      }
      uint64_t v12 = [(NSMutableArray *)v11 countByEnumeratingWithState:&v18 objects:v22 count:16];
    }
    while (v12);
  }

  uint64_t v16 = self->_unknownFields;
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
  -[GEOPDGuidesHomeResultFilter readAll:]((uint64_t)self, 1);
  -[GEOPDGuidesHomeResultFilter readAll:]((uint64_t)v4, 1);
  if (*(unsigned char *)&self->_flags)
  {
    if ((*((unsigned char *)v4 + 56) & 1) == 0 || self->_filterType != *((_DWORD *)v4 + 13)) {
      goto LABEL_11;
    }
  }
  else if (*((unsigned char *)v4 + 56))
  {
LABEL_11:
    char v7 = 0;
    goto LABEL_12;
  }
  filterConcept = self->_filterConcept;
  if ((unint64_t)filterConcept | *((void *)v4 + 3)
    && !-[GEOPDGuidesHomeResultFilterTypeConcept isEqual:](filterConcept, "isEqual:"))
  {
    goto LABEL_11;
  }
  subFilters = self->_subFilters;
  if ((unint64_t)subFilters | *((void *)v4 + 4)) {
    char v7 = -[NSMutableArray isEqual:](subFilters, "isEqual:");
  }
  else {
    char v7 = 1;
  }
LABEL_12:

  return v7;
}

- (unint64_t)hash
{
  -[GEOPDGuidesHomeResultFilter readAll:]((uint64_t)self, 1);
  if (*(unsigned char *)&self->_flags) {
    uint64_t v3 = 2654435761 * self->_filterType;
  }
  else {
    uint64_t v3 = 0;
  }
  unint64_t v4 = [(GEOPDGuidesHomeResultFilterTypeConcept *)self->_filterConcept hash] ^ v3;
  return v4 ^ [(NSMutableArray *)self->_subFilters hash];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_subFilters, 0);
  objc_storeStrong((id *)&self->_filterConcept, 0);
  objc_storeStrong((id *)&self->_unknownFields, 0);

  objc_storeStrong((id *)&self->_reader, 0);
}

@end