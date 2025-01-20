@interface GEOPDSiriSearchParameters
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (GEOPDSiriSearchParameters)init;
- (GEOPDSiriSearchParameters)initWithData:(id)a3;
- (id)_dictionaryRepresentation:(uint64_t)a1;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)jsonRepresentation;
- (unint64_t)hash;
- (void)_addNoFlagsBusinessCategoryFilter:(uint64_t)a1;
- (void)_addNoFlagsSearchSubstringDescriptor:(uint64_t)a1;
- (void)_readBusinessCategoryFilters;
- (void)_readViewportInfo;
- (void)addBusinessCategoryFilter:(uint64_t)a1;
- (void)addSearchSubstringDescriptor:(uint64_t)a1;
- (void)readAll:(uint64_t)a1;
- (void)setAddress:(uint64_t)a1;
- (void)setIndexFilter:(uint64_t)a1;
- (void)setRecentRouteInfo:(uint64_t)a1;
- (void)setSearchString:(uint64_t)a1;
- (void)setViewportInfo:(uint64_t)a1;
- (void)writeTo:(id)a3;
@end

@implementation GEOPDSiriSearchParameters

- (void)readAll:(uint64_t)a1
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 88));
    v4 = *(void **)(a1 + 8);
    if (v4)
    {
      id v5 = v4;
      objc_sync_enter(v5);
      if (a2) {
        v6 = (int *)&readAll__recursiveTag_7176;
      }
      else {
        v6 = (int *)&readAll__nonRecursiveTag_7177;
      }
      GEOPDSiriSearchParametersReadSpecified(a1, *(void *)(a1 + 8), v6);
      objc_sync_exit(v5);
    }
    if (a2) {
      _GEOPDSiriSearchParametersCallReadAllRecursiveWithoutSynchronized(a1);
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 88));
  }
}

- (GEOPDSiriSearchParameters)init
{
  v6.receiver = self;
  v6.super_class = (Class)GEOPDSiriSearchParameters;
  v2 = [(GEOPDSiriSearchParameters *)&v6 init];
  v3 = v2;
  if (v2)
  {
    v2->_readerLock._os_unfair_lock_opaque = 0;
    v4 = v2;
  }

  return v3;
}

- (GEOPDSiriSearchParameters)initWithData:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)GEOPDSiriSearchParameters;
  v3 = [(GEOPDSiriSearchParameters *)&v7 initWithData:a3];
  v4 = v3;
  if (v3)
  {
    v3->_readerLock._os_unfair_lock_opaque = 0;
    id v5 = v3;
  }

  return v4;
}

- (void)setSearchString:(uint64_t)a1
{
  id v4 = a2;
  *(_WORD *)(a1 + 104) |= 0x200u;
  *(_WORD *)(a1 + 104) |= 0x1000u;
  objc_storeStrong((id *)(a1 + 56), a2);
}

- (void)_readViewportInfo
{
  os_unfair_lock_lock((os_unfair_lock_t)(a1 + 88));
  if ((*(_WORD *)(a1 + 104) & 0x800) == 0)
  {
    v2 = *(void **)(a1 + 8);
    if (v2)
    {
      id v3 = v2;
      objc_sync_enter(v3);
      GEOPDSiriSearchParametersReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readViewportInfo_tags_7140);
      objc_sync_exit(v3);
    }
  }

  os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 88));
}

- (void)setViewportInfo:(uint64_t)a1
{
  id v4 = a2;
  *(_WORD *)(a1 + 104) |= 0x800u;
  *(_WORD *)(a1 + 104) |= 0x1000u;
  objc_storeStrong((id *)(a1 + 72), a2);
}

- (void)setAddress:(uint64_t)a1
{
  id v4 = a2;
  *(_WORD *)(a1 + 104) |= 0x20u;
  *(_WORD *)(a1 + 104) |= 0x1000u;
  objc_storeStrong((id *)(a1 + 24), a2);
}

- (void)_readBusinessCategoryFilters
{
  os_unfair_lock_lock((os_unfair_lock_t)(a1 + 88));
  if ((*(_WORD *)(a1 + 104) & 0x40) == 0)
  {
    v2 = *(void **)(a1 + 8);
    if (v2)
    {
      id v3 = v2;
      objc_sync_enter(v3);
      GEOPDSiriSearchParametersReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readBusinessCategoryFilters_tags);
      objc_sync_exit(v3);
    }
  }

  os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 88));
}

- (void)addBusinessCategoryFilter:(uint64_t)a1
{
  if (a1)
  {
    id v3 = a2;
    -[GEOPDSiriSearchParameters _readBusinessCategoryFilters](a1);
    -[GEOPDSiriSearchParameters _addNoFlagsBusinessCategoryFilter:](a1, v3);

    os_unfair_lock_lock_with_options();
    *(_WORD *)(a1 + 104) |= 0x40u;
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 88));
    *(_WORD *)(a1 + 104) |= 0x1000u;
  }
}

- (void)_addNoFlagsBusinessCategoryFilter:(uint64_t)a1
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

- (void)addSearchSubstringDescriptor:(uint64_t)a1
{
  if (a1)
  {
    id v3 = a2;
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 88));
    if ((*(_WORD *)(a1 + 104) & 0x400) == 0)
    {
      id v4 = *(void **)(a1 + 8);
      if (v4)
      {
        id v5 = v4;
        objc_sync_enter(v5);
        GEOPDSiriSearchParametersReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readSearchSubstringDescriptors_tags);
        objc_sync_exit(v5);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 88));
    -[GEOPDSiriSearchParameters _addNoFlagsSearchSubstringDescriptor:](a1, v3);

    os_unfair_lock_lock_with_options();
    *(_WORD *)(a1 + 104) |= 0x400u;
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 88));
    *(_WORD *)(a1 + 104) |= 0x1000u;
  }
}

- (void)_addNoFlagsSearchSubstringDescriptor:(uint64_t)a1
{
  id v3 = a2;
  if (a1)
  {
    id v4 = *(void **)(a1 + 64);
    id v7 = v3;
    if (!v4)
    {
      id v5 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
      objc_super v6 = *(void **)(a1 + 64);
      *(void *)(a1 + 64) = v5;

      id v4 = *(void **)(a1 + 64);
    }
    [v4 addObject:v7];
    id v3 = v7;
  }
}

- (void)setIndexFilter:(uint64_t)a1
{
  id v4 = a2;
  *(_WORD *)(a1 + 104) |= 0x80u;
  *(_WORD *)(a1 + 104) |= 0x1000u;
  objc_storeStrong((id *)(a1 + 40), a2);
}

- (void)setRecentRouteInfo:(uint64_t)a1
{
  id v4 = a2;
  *(_WORD *)(a1 + 104) |= 0x100u;
  *(_WORD *)(a1 + 104) |= 0x1000u;
  objc_storeStrong((id *)(a1 + 48), a2);
}

- (id)description
{
  id v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)GEOPDSiriSearchParameters;
  id v4 = [(GEOPDSiriSearchParameters *)&v8 description];
  id v5 = [(GEOPDSiriSearchParameters *)self dictionaryRepresentation];
  objc_super v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEOPDSiriSearchParameters _dictionaryRepresentation:]((uint64_t)self, 0);
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  uint64_t v65 = *MEMORY[0x1E4F143B8];
  if (a1)
  {
    -[GEOPDSiriSearchParameters readAll:](a1, 1);
    id v4 = [MEMORY[0x1E4F1CA60] dictionary];
    __int16 v5 = *(_WORD *)(a1 + 104);
    if ((v5 & 2) != 0)
    {
      uint64_t v6 = *(int *)(a1 + 96);
      if (v6 >= 4)
      {
        objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(int *)(a1 + 96));
        id v7 = (__CFString *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        id v7 = off_1E53DD1C8[v6];
      }
      if (a2) {
        objc_super v8 = @"sortOrder";
      }
      else {
        objc_super v8 = @"sort_order";
      }
      [v4 setObject:v7 forKey:v8];

      __int16 v5 = *(_WORD *)(a1 + 104);
    }
    if (v5)
    {
      v9 = [NSNumber numberWithUnsignedInt:*(unsigned int *)(a1 + 92)];
      if (a2) {
        v10 = @"maxResultCount";
      }
      else {
        v10 = @"max_result_count";
      }
      [v4 setObject:v9 forKey:v10];
    }
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 88));
    if ((*(_WORD *)(a1 + 104) & 0x200) == 0)
    {
      v11 = *(void **)(a1 + 8);
      if (v11)
      {
        id v12 = v11;
        objc_sync_enter(v12);
        GEOPDSiriSearchParametersReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readSearchString_tags_7139);
        objc_sync_exit(v12);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 88));
    id v13 = *(id *)(a1 + 56);
    if (v13)
    {
      if (a2) {
        v14 = @"searchString";
      }
      else {
        v14 = @"search_string";
      }
      [v4 setObject:v13 forKey:v14];
    }

    -[GEOPDSiriSearchParameters _readViewportInfo](a1);
    id v15 = *(id *)(a1 + 72);
    v16 = v15;
    if (v15)
    {
      if (a2)
      {
        v17 = [v15 jsonRepresentation];
        v18 = @"viewportInfo";
      }
      else
      {
        v17 = [v15 dictionaryRepresentation];
        v18 = @"viewport_info";
      }
      [v4 setObject:v17 forKey:v18];
    }
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 88));
    if ((*(_WORD *)(a1 + 104) & 0x20) == 0)
    {
      v19 = *(void **)(a1 + 8);
      if (v19)
      {
        id v20 = v19;
        objc_sync_enter(v20);
        GEOPDSiriSearchParametersReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readAddress_tags_0);
        objc_sync_exit(v20);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 88));
    id v21 = *(id *)(a1 + 24);
    v22 = v21;
    if (v21)
    {
      if (a2) {
        [v21 jsonRepresentation];
      }
      else {
      v23 = [v21 dictionaryRepresentation];
      }
      [v4 setObject:v23 forKey:@"address"];
    }
    if (*(void *)(a1 + 32))
    {
      -[GEOPDSiriSearchParameters _readBusinessCategoryFilters](a1);
      id v24 = *(id *)(a1 + 32);
      if (a2) {
        v25 = @"businessCategoryFilter";
      }
      else {
        v25 = @"business_category_filter";
      }
      [v4 setObject:v24 forKey:v25];
    }
    __int16 v26 = *(_WORD *)(a1 + 104);
    if ((v26 & 4) != 0)
    {
      v27 = [NSNumber numberWithBool:*(unsigned __int8 *)(a1 + 100)];
      if (a2) {
        v28 = @"isStrictMapRegion";
      }
      else {
        v28 = @"is_strict_map_region";
      }
      [v4 setObject:v27 forKey:v28];

      __int16 v26 = *(_WORD *)(a1 + 104);
    }
    if ((v26 & 8) != 0)
    {
      v29 = [NSNumber numberWithBool:*(unsigned __int8 *)(a1 + 101)];
      if (a2) {
        v30 = @"structuredSearch";
      }
      else {
        v30 = @"structured_search";
      }
      [v4 setObject:v29 forKey:v30];
    }
    if ([*(id *)(a1 + 64) count])
    {
      v31 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(*(id *)(a1 + 64), "count"));
      long long v60 = 0u;
      long long v61 = 0u;
      long long v62 = 0u;
      long long v63 = 0u;
      id v32 = *(id *)(a1 + 64);
      uint64_t v33 = [v32 countByEnumeratingWithState:&v60 objects:v64 count:16];
      if (v33)
      {
        uint64_t v34 = *(void *)v61;
        do
        {
          for (uint64_t i = 0; i != v33; ++i)
          {
            if (*(void *)v61 != v34) {
              objc_enumerationMutation(v32);
            }
            v36 = *(void **)(*((void *)&v60 + 1) + 8 * i);
            if (a2) {
              [v36 jsonRepresentation];
            }
            else {
            v37 = [v36 dictionaryRepresentation];
            }
            [v31 addObject:v37];
          }
          uint64_t v33 = [v32 countByEnumeratingWithState:&v60 objects:v64 count:16];
        }
        while (v33);
      }

      if (a2) {
        v38 = @"searchSubstringDescriptor";
      }
      else {
        v38 = @"search_substring_descriptor";
      }
      [v4 setObject:v31 forKey:v38];
    }
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 88));
    if ((*(_WORD *)(a1 + 104) & 0x80) == 0)
    {
      v39 = *(void **)(a1 + 8);
      if (v39)
      {
        id v40 = v39;
        objc_sync_enter(v40);
        GEOPDSiriSearchParametersReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readIndexFilter_tags);
        objc_sync_exit(v40);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 88));
    id v41 = *(id *)(a1 + 40);
    v42 = v41;
    if (v41)
    {
      if (a2)
      {
        v43 = [v41 jsonRepresentation];
        v44 = @"indexFilter";
      }
      else
      {
        v43 = [v41 dictionaryRepresentation];
        v44 = @"index_filter";
      }
      [v4 setObject:v43 forKey:v44];
    }
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 88));
    if ((*(_WORD *)(a1 + 104) & 0x100) == 0)
    {
      v45 = *(void **)(a1 + 8);
      if (v45)
      {
        id v46 = v45;
        objc_sync_enter(v46);
        GEOPDSiriSearchParametersReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readRecentRouteInfo_tags_7142);
        objc_sync_exit(v46);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 88));
    id v47 = *(id *)(a1 + 48);
    v48 = v47;
    if (v47)
    {
      if (a2)
      {
        v49 = [v47 jsonRepresentation];
        v50 = @"recentRouteInfo";
      }
      else
      {
        v49 = [v47 dictionaryRepresentation];
        v50 = @"recent_route_info";
      }
      [v4 setObject:v49 forKey:v50];
    }
    v51 = *(void **)(a1 + 16);
    if (v51)
    {
      v52 = [v51 dictionaryRepresentation];
      v53 = v52;
      if (a2)
      {
        v54 = objc_msgSend(MEMORY[0x1E4F1CA60], "dictionaryWithCapacity:", objc_msgSend(v52, "count"));
        v58[0] = MEMORY[0x1E4F143A8];
        v58[1] = 3221225472;
        v58[2] = __55__GEOPDSiriSearchParameters__dictionaryRepresentation___block_invoke;
        v58[3] = &unk_1E53D8860;
        id v55 = v54;
        id v59 = v55;
        [v53 enumerateKeysAndObjectsUsingBlock:v58];
        id v56 = v55;
      }
      else
      {
        id v56 = v52;
      }
      [v4 setObject:v56 forKey:@"Unknown Fields"];
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
  return -[GEOPDSiriSearchParameters _dictionaryRepresentation:]((uint64_t)self, 1);
}

void __55__GEOPDSiriSearchParameters__dictionaryRepresentation___block_invoke(uint64_t a1, void *a2, void *a3)
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

- (BOOL)readFrom:(id)a3
{
  return GEOPDSiriSearchParametersReadAllFrom((uint64_t)self, a3, 0);
}

- (void)writeTo:(id)a3
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  if (self->_reader && !_GEOPDSiriSearchParametersIsDirty((uint64_t)self))
  {
    v16 = self->_reader;
    objc_sync_enter(v16);
    *(void *)((char *)self->_reader + (int)*MEMORY[0x1E4F940E0]) = self->_readerMarkLength;
    [(PBDataReader *)self->_reader seekToOffset:self->_readerMarkPos];
    v17 = [(PBDataReader *)self->_reader readBytes:self->_readerMarkLength - self->_readerMarkPos];
    [v4 writeData:v17];
    os_unfair_lock_unlock(p_readerLock);

    objc_sync_exit(v16);
  }
  else
  {
    os_unfair_lock_unlock(&self->_readerLock);
    -[GEOPDSiriSearchParameters readAll:]((uint64_t)self, 0);
    __int16 flags = (__int16)self->_flags;
    if ((flags & 2) != 0)
    {
      PBDataWriterWriteInt32Field();
      __int16 flags = (__int16)self->_flags;
    }
    if (flags) {
      PBDataWriterWriteUint32Field();
    }
    if (self->_searchString) {
      PBDataWriterWriteStringField();
    }
    if (self->_viewportInfo) {
      PBDataWriterWriteSubmessage();
    }
    if (self->_address) {
      PBDataWriterWriteSubmessage();
    }
    long long v24 = 0u;
    long long v25 = 0u;
    long long v22 = 0u;
    long long v23 = 0u;
    id v7 = self->_businessCategoryFilters;
    uint64_t v8 = [(NSMutableArray *)v7 countByEnumeratingWithState:&v22 objects:v27 count:16];
    if (v8)
    {
      uint64_t v9 = *(void *)v23;
      do
      {
        for (uint64_t i = 0; i != v8; ++i)
        {
          if (*(void *)v23 != v9) {
            objc_enumerationMutation(v7);
          }
          PBDataWriterWriteStringField();
        }
        uint64_t v8 = [(NSMutableArray *)v7 countByEnumeratingWithState:&v22 objects:v27 count:16];
      }
      while (v8);
    }

    __int16 v11 = (__int16)self->_flags;
    if ((v11 & 4) != 0)
    {
      PBDataWriterWriteBOOLField();
      __int16 v11 = (__int16)self->_flags;
    }
    if ((v11 & 8) != 0) {
      PBDataWriterWriteBOOLField();
    }
    long long v20 = 0u;
    long long v21 = 0u;
    long long v18 = 0u;
    long long v19 = 0u;
    id v12 = self->_searchSubstringDescriptors;
    uint64_t v13 = [(NSMutableArray *)v12 countByEnumeratingWithState:&v18 objects:v26 count:16];
    if (v13)
    {
      uint64_t v14 = *(void *)v19;
      do
      {
        for (uint64_t j = 0; j != v13; ++j)
        {
          if (*(void *)v19 != v14) {
            objc_enumerationMutation(v12);
          }
          PBDataWriterWriteSubmessage();
        }
        uint64_t v13 = [(NSMutableArray *)v12 countByEnumeratingWithState:&v18 objects:v26 count:16];
      }
      while (v13);
    }

    if (self->_indexFilter) {
      PBDataWriterWriteSubmessage();
    }
    if (self->_recentRouteInfo) {
      PBDataWriterWriteSubmessage();
    }
    -[PBUnknownFields writeTo:](self->_unknownFields, "writeTo:", v4, v18);
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v43 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  os_unfair_lock_lock(&self->_readerLock);
  reader = self->_reader;
  if (reader)
  {
    id v7 = reader;
    objc_sync_enter(v7);
    if ((*(_WORD *)&self->_flags & 0x1000) == 0)
    {
      *(void *)((char *)self->_reader + (int)*MEMORY[0x1E4F940E0]) = self->_readerMarkLength;
      [(PBDataReader *)self->_reader seekToOffset:self->_readerMarkPos];
      GEOPDSiriSearchParametersReadAllFrom(v5, self->_reader, 0);
      os_unfair_lock_unlock(&self->_readerLock);
      id v8 = (id)v5;
      objc_sync_exit(v7);

      goto LABEL_28;
    }
    objc_sync_exit(v7);
  }
  os_unfair_lock_unlock(&self->_readerLock);
  -[GEOPDSiriSearchParameters readAll:]((uint64_t)self, 0);
  __int16 flags = (__int16)self->_flags;
  if ((flags & 2) != 0)
  {
    *(_DWORD *)(v5 + 96) = self->_sortOrder;
    *(_WORD *)(v5 + 104) |= 2u;
    __int16 flags = (__int16)self->_flags;
  }
  if (flags)
  {
    *(_DWORD *)(v5 + 92) = self->_maxResultCount;
    *(_WORD *)(v5 + 104) |= 1u;
  }
  uint64_t v10 = [(NSString *)self->_searchString copyWithZone:a3];
  __int16 v11 = *(void **)(v5 + 56);
  *(void *)(v5 + 56) = v10;

  id v12 = [(GEOPDViewportInfo *)self->_viewportInfo copyWithZone:a3];
  uint64_t v13 = *(void **)(v5 + 72);
  *(void *)(v5 + 72) = v12;

  id v14 = [(GEOAddress *)self->_address copyWithZone:a3];
  id v15 = *(void **)(v5 + 24);
  *(void *)(v5 + 24) = v14;

  long long v39 = 0u;
  long long v40 = 0u;
  long long v37 = 0u;
  long long v38 = 0u;
  v16 = self->_businessCategoryFilters;
  uint64_t v17 = [(NSMutableArray *)v16 countByEnumeratingWithState:&v37 objects:v42 count:16];
  if (v17)
  {
    uint64_t v18 = *(void *)v38;
    do
    {
      for (uint64_t i = 0; i != v17; ++i)
      {
        if (*(void *)v38 != v18) {
          objc_enumerationMutation(v16);
        }
        long long v20 = (void *)[*(id *)(*((void *)&v37 + 1) + 8 * i) copyWithZone:a3];
        -[GEOPDSiriSearchParameters addBusinessCategoryFilter:](v5, v20);
      }
      uint64_t v17 = [(NSMutableArray *)v16 countByEnumeratingWithState:&v37 objects:v42 count:16];
    }
    while (v17);
  }

  __int16 v21 = (__int16)self->_flags;
  if ((v21 & 4) != 0)
  {
    *(unsigned char *)(v5 + 100) = self->_isStrictMapRegion;
    *(_WORD *)(v5 + 104) |= 4u;
    __int16 v21 = (__int16)self->_flags;
  }
  if ((v21 & 8) != 0)
  {
    *(unsigned char *)(v5 + 101) = self->_structuredSearch;
    *(_WORD *)(v5 + 104) |= 8u;
  }
  long long v35 = 0u;
  long long v36 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  long long v22 = self->_searchSubstringDescriptors;
  uint64_t v23 = [(NSMutableArray *)v22 countByEnumeratingWithState:&v33 objects:v41 count:16];
  if (v23)
  {
    uint64_t v24 = *(void *)v34;
    do
    {
      for (uint64_t j = 0; j != v23; ++j)
      {
        if (*(void *)v34 != v24) {
          objc_enumerationMutation(v22);
        }
        __int16 v26 = objc_msgSend(*(id *)(*((void *)&v33 + 1) + 8 * j), "copyWithZone:", a3, (void)v33);
        -[GEOPDSiriSearchParameters addSearchSubstringDescriptor:](v5, v26);
      }
      uint64_t v23 = [(NSMutableArray *)v22 countByEnumeratingWithState:&v33 objects:v41 count:16];
    }
    while (v23);
  }

  id v27 = [(GEOPDIndexQueryNode *)self->_indexFilter copyWithZone:a3];
  uint64_t v28 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v27;

  id v29 = [(GEOPDRecentRouteInfo *)self->_recentRouteInfo copyWithZone:a3];
  v30 = *(void **)(v5 + 48);
  *(void *)(v5 + 48) = v29;

  v31 = self->_unknownFields;
  id v8 = *(id *)(v5 + 16);
  *(void *)(v5 + 16) = v31;
LABEL_28:

  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_42;
  }
  -[GEOPDSiriSearchParameters readAll:]((uint64_t)self, 1);
  -[GEOPDSiriSearchParameters readAll:]((uint64_t)v4, 1);
  __int16 flags = (__int16)self->_flags;
  __int16 v6 = *((_WORD *)v4 + 52);
  if ((flags & 2) != 0)
  {
    if ((v6 & 2) == 0 || self->_sortOrder != *((_DWORD *)v4 + 24)) {
      goto LABEL_42;
    }
  }
  else if ((v6 & 2) != 0)
  {
    goto LABEL_42;
  }
  if (flags)
  {
    if ((v6 & 1) == 0 || self->_maxResultCount != *((_DWORD *)v4 + 23)) {
      goto LABEL_42;
    }
  }
  else if (v6)
  {
    goto LABEL_42;
  }
  searchString = self->_searchString;
  if ((unint64_t)searchString | *((void *)v4 + 7)
    && !-[NSString isEqual:](searchString, "isEqual:"))
  {
    goto LABEL_42;
  }
  viewportInfo = self->_viewportInfo;
  if ((unint64_t)viewportInfo | *((void *)v4 + 9))
  {
    if (!-[GEOPDViewportInfo isEqual:](viewportInfo, "isEqual:")) {
      goto LABEL_42;
    }
  }
  address = self->_address;
  if ((unint64_t)address | *((void *)v4 + 3))
  {
    if (!-[GEOAddress isEqual:](address, "isEqual:")) {
      goto LABEL_42;
    }
  }
  businessCategoryFilters = self->_businessCategoryFilters;
  if ((unint64_t)businessCategoryFilters | *((void *)v4 + 4))
  {
    if (!-[NSMutableArray isEqual:](businessCategoryFilters, "isEqual:")) {
      goto LABEL_42;
    }
  }
  __int16 v11 = (__int16)self->_flags;
  __int16 v12 = *((_WORD *)v4 + 52);
  if ((v11 & 4) != 0)
  {
    if ((v12 & 4) == 0) {
      goto LABEL_42;
    }
    if (self->_isStrictMapRegion)
    {
      if (!*((unsigned char *)v4 + 100)) {
        goto LABEL_42;
      }
    }
    else if (*((unsigned char *)v4 + 100))
    {
      goto LABEL_42;
    }
  }
  else if ((v12 & 4) != 0)
  {
    goto LABEL_42;
  }
  if ((v11 & 8) != 0)
  {
    if ((v12 & 8) != 0)
    {
      if (self->_structuredSearch)
      {
        if (!*((unsigned char *)v4 + 101)) {
          goto LABEL_42;
        }
        goto LABEL_36;
      }
      if (!*((unsigned char *)v4 + 101)) {
        goto LABEL_36;
      }
    }
LABEL_42:
    char v16 = 0;
    goto LABEL_43;
  }
  if ((v12 & 8) != 0) {
    goto LABEL_42;
  }
LABEL_36:
  searchSubstringDescriptors = self->_searchSubstringDescriptors;
  if ((unint64_t)searchSubstringDescriptors | *((void *)v4 + 8)
    && !-[NSMutableArray isEqual:](searchSubstringDescriptors, "isEqual:"))
  {
    goto LABEL_42;
  }
  indexFilter = self->_indexFilter;
  if ((unint64_t)indexFilter | *((void *)v4 + 5))
  {
    if (!-[GEOPDIndexQueryNode isEqual:](indexFilter, "isEqual:")) {
      goto LABEL_42;
    }
  }
  recentRouteInfo = self->_recentRouteInfo;
  if ((unint64_t)recentRouteInfo | *((void *)v4 + 6)) {
    char v16 = -[GEOPDRecentRouteInfo isEqual:](recentRouteInfo, "isEqual:");
  }
  else {
    char v16 = 1;
  }
LABEL_43:

  return v16;
}

- (unint64_t)hash
{
  -[GEOPDSiriSearchParameters readAll:]((uint64_t)self, 1);
  __int16 flags = (__int16)self->_flags;
  if ((flags & 2) != 0)
  {
    uint64_t v4 = 2654435761 * self->_sortOrder;
    if (flags) {
      goto LABEL_3;
    }
  }
  else
  {
    uint64_t v4 = 0;
    if (flags)
    {
LABEL_3:
      uint64_t v5 = 2654435761 * self->_maxResultCount;
      goto LABEL_6;
    }
  }
  uint64_t v5 = 0;
LABEL_6:
  NSUInteger v6 = [(NSString *)self->_searchString hash];
  unint64_t v7 = [(GEOPDViewportInfo *)self->_viewportInfo hash];
  unint64_t v8 = [(GEOAddress *)self->_address hash];
  uint64_t v9 = [(NSMutableArray *)self->_businessCategoryFilters hash];
  __int16 v10 = (__int16)self->_flags;
  if ((v10 & 4) != 0)
  {
    uint64_t v11 = 2654435761 * self->_isStrictMapRegion;
    if ((v10 & 8) != 0) {
      goto LABEL_8;
    }
LABEL_10:
    uint64_t v12 = 0;
    goto LABEL_11;
  }
  uint64_t v11 = 0;
  if ((v10 & 8) == 0) {
    goto LABEL_10;
  }
LABEL_8:
  uint64_t v12 = 2654435761 * self->_structuredSearch;
LABEL_11:
  NSUInteger v13 = v5 ^ v4 ^ v6 ^ v7 ^ v8 ^ v9 ^ v11 ^ v12;
  uint64_t v14 = [(NSMutableArray *)self->_searchSubstringDescriptors hash];
  unint64_t v15 = v14 ^ [(GEOPDIndexQueryNode *)self->_indexFilter hash];
  return v13 ^ v15 ^ [(GEOPDRecentRouteInfo *)self->_recentRouteInfo hash];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_viewportInfo, 0);
  objc_storeStrong((id *)&self->_searchSubstringDescriptors, 0);
  objc_storeStrong((id *)&self->_searchString, 0);
  objc_storeStrong((id *)&self->_recentRouteInfo, 0);
  objc_storeStrong((id *)&self->_indexFilter, 0);
  objc_storeStrong((id *)&self->_businessCategoryFilters, 0);
  objc_storeStrong((id *)&self->_address, 0);
  objc_storeStrong((id *)&self->_unknownFields, 0);

  objc_storeStrong((id *)&self->_reader, 0);
}

@end