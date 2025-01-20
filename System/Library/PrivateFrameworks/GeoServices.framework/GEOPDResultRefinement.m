@interface GEOPDResultRefinement
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (GEOPDResultRefinement)init;
- (GEOPDResultRefinement)initWithData:(id)a3;
- (id)_dictionaryRepresentation:(uint64_t)a1;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)jsonRepresentation;
- (id)multiSelect;
- (id)openOptions;
- (id)sort;
- (id)toggle;
- (uint64_t)_initWithDictionary:(int)a3 isJSON:;
- (uint64_t)hasGreenTeaWithValue:(uint64_t)result;
- (uint64_t)resultRefinementType;
- (unint64_t)hash;
- (void)_readGuidesHome;
- (void)_readMultiSelect;
- (void)_readOpenOptions;
- (void)_readSort;
- (void)_readToggle;
- (void)clearUnknownFields:(uint64_t)a1;
- (void)readAll:(uint64_t)a1;
- (void)setMultiSelect:(uint64_t)a1;
- (void)setOpenOptions:(uint64_t)a1;
- (void)setSort:(uint64_t)a1;
- (void)setToggle:(uint64_t)a1;
- (void)writeTo:(id)a3;
@end

@implementation GEOPDResultRefinement

- (void)readAll:(uint64_t)a1
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 80));
    v4 = *(void **)(a1 + 8);
    if (v4)
    {
      id v5 = v4;
      objc_sync_enter(v5);
      if (a2) {
        v6 = (int *)&readAll__recursiveTag_445;
      }
      else {
        v6 = (int *)&readAll__nonRecursiveTag_446;
      }
      GEOPDResultRefinementReadSpecified(a1, *(void *)(a1 + 8), v6);
      objc_sync_exit(v5);
    }
    if (a2) {
      _GEOPDResultRefinementCallReadAllRecursiveWithoutSynchronized((uint64_t *)a1);
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 80));
  }
}

- (GEOPDResultRefinement)init
{
  v6.receiver = self;
  v6.super_class = (Class)GEOPDResultRefinement;
  v2 = [(GEOPDResultRefinement *)&v6 init];
  v3 = v2;
  if (v2)
  {
    v2->_readerLock._os_unfair_lock_opaque = 0;
    v4 = v2;
  }

  return v3;
}

- (GEOPDResultRefinement)initWithData:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)GEOPDResultRefinement;
  v3 = [(GEOPDResultRefinement *)&v7 initWithData:a3];
  v4 = v3;
  if (v3)
  {
    v3->_readerLock._os_unfair_lock_opaque = 0;
    id v5 = v3;
  }

  return v4;
}

- (uint64_t)resultRefinementType
{
  if (result)
  {
    uint64_t v1 = result;
    os_unfair_lock_lock_with_options();
    __int16 v2 = *(_WORD *)(v1 + 88);
    os_unfair_lock_unlock((os_unfair_lock_t)(v1 + 80));
    if (v2) {
      return *(unsigned int *)(v1 + 84);
    }
    else {
      return 0;
    }
  }
  return result;
}

- (void)_readToggle
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 80));
    if ((*(_WORD *)(a1 + 88) & 0x80) == 0)
    {
      __int16 v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOPDResultRefinementReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readToggle_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 80));
  }
}

- (id)toggle
{
  if (a1)
  {
    __int16 v2 = a1;
    -[GEOPDResultRefinement _readToggle]((uint64_t)a1);
    a1 = (id *)v2[8];
    uint64_t v1 = vars8;
  }
  return a1;
}

- (void)setToggle:(uint64_t)a1
{
  id v4 = a2;
  if (a1)
  {
    *(_WORD *)(a1 + 88) |= 0x80u;
    *(_WORD *)(a1 + 88) |= 0x100u;
    objc_storeStrong((id *)(a1 + 64), a2);
  }
}

- (void)_readMultiSelect
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 80));
    if ((*(_WORD *)(a1 + 88) & 8) == 0)
    {
      __int16 v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOPDResultRefinementReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readMultiSelect_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 80));
  }
}

- (id)multiSelect
{
  if (a1)
  {
    __int16 v2 = a1;
    -[GEOPDResultRefinement _readMultiSelect]((uint64_t)a1);
    a1 = (id *)v2[4];
    uint64_t v1 = vars8;
  }
  return a1;
}

- (void)setMultiSelect:(uint64_t)a1
{
  id v4 = a2;
  if (a1)
  {
    *(_WORD *)(a1 + 88) |= 8u;
    *(_WORD *)(a1 + 88) |= 0x100u;
    objc_storeStrong((id *)(a1 + 32), a2);
  }
}

- (void)_readSort
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 80));
    if ((*(_WORD *)(a1 + 88) & 0x40) == 0)
    {
      __int16 v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOPDResultRefinementReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readSort_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 80));
  }
}

- (id)sort
{
  if (a1)
  {
    __int16 v2 = a1;
    -[GEOPDResultRefinement _readSort]((uint64_t)a1);
    a1 = (id *)v2[7];
    uint64_t v1 = vars8;
  }
  return a1;
}

- (void)setSort:(uint64_t)a1
{
  id v4 = a2;
  if (a1)
  {
    *(_WORD *)(a1 + 88) |= 0x40u;
    *(_WORD *)(a1 + 88) |= 0x100u;
    objc_storeStrong((id *)(a1 + 56), a2);
  }
}

- (void)_readGuidesHome
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 80));
    if ((*(_WORD *)(a1 + 88) & 4) == 0)
    {
      __int16 v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOPDResultRefinementReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readGuidesHome_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 80));
  }
}

- (void)_readOpenOptions
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 80));
    if ((*(_WORD *)(a1 + 88) & 0x10) == 0)
    {
      __int16 v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOPDResultRefinementReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readOpenOptions_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 80));
  }
}

- (id)openOptions
{
  if (a1)
  {
    __int16 v2 = a1;
    -[GEOPDResultRefinement _readOpenOptions]((uint64_t)a1);
    a1 = (id *)v2[5];
    uint64_t v1 = vars8;
  }
  return a1;
}

- (void)setOpenOptions:(uint64_t)a1
{
  id v4 = a2;
  if (a1)
  {
    *(_WORD *)(a1 + 88) |= 0x10u;
    *(_WORD *)(a1 + 88) |= 0x100u;
    objc_storeStrong((id *)(a1 + 40), a2);
  }
}

- (id)description
{
  id v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)GEOPDResultRefinement;
  id v4 = [(GEOPDResultRefinement *)&v8 description];
  id v5 = [(GEOPDResultRefinement *)self dictionaryRepresentation];
  objc_super v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEOPDResultRefinement _dictionaryRepresentation:]((uint64_t)self, 0);
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  if (a1)
  {
    -[GEOPDResultRefinement readAll:](a1, 1);
    id v4 = [MEMORY[0x1E4F1CA60] dictionary];
    if (*(_WORD *)(a1 + 88))
    {
      uint64_t v5 = *(int *)(a1 + 84);
      if (v5 >= 7)
      {
        objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(int *)(a1 + 84));
        objc_super v6 = (__CFString *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        objc_super v6 = off_1E53E5C38[v5];
      }
      if (a2) {
        objc_super v7 = @"resultRefinementType";
      }
      else {
        objc_super v7 = @"result_refinement_type";
      }
      [v4 setObject:v6 forKey:v7];
    }
    objc_super v8 = -[GEOPDResultRefinement toggle]((id *)a1);
    v9 = v8;
    if (v8)
    {
      if (a2) {
        [v8 jsonRepresentation];
      }
      else {
      v10 = [v8 dictionaryRepresentation];
      }
      [v4 setObject:v10 forKey:@"toggle"];
    }
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 80));
    if ((*(_WORD *)(a1 + 88) & 0x20) == 0)
    {
      v11 = *(void **)(a1 + 8);
      if (v11)
      {
        id v12 = v11;
        objc_sync_enter(v12);
        GEOPDResultRefinementReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readRange_tags);
        objc_sync_exit(v12);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 80));
    id v13 = *(id *)(a1 + 48);
    v14 = v13;
    if (v13)
    {
      if (a2) {
        [v13 jsonRepresentation];
      }
      else {
      v15 = [v13 dictionaryRepresentation];
      }
      [v4 setObject:v15 forKey:@"range"];
    }
    v16 = -[GEOPDResultRefinement multiSelect]((id *)a1);
    v17 = v16;
    if (v16)
    {
      if (a2)
      {
        v18 = [v16 jsonRepresentation];
        v19 = @"multiSelect";
      }
      else
      {
        v18 = [v16 dictionaryRepresentation];
        v19 = @"multi_select";
      }
      [v4 setObject:v18 forKey:v19];
    }
    v20 = -[GEOPDResultRefinement sort]((id *)a1);
    v21 = v20;
    if (v20)
    {
      if (a2) {
        [v20 jsonRepresentation];
      }
      else {
      v22 = [v20 dictionaryRepresentation];
      }
      [v4 setObject:v22 forKey:@"sort"];
    }
    -[GEOPDResultRefinement _readGuidesHome](a1);
    id v23 = *(id *)(a1 + 24);
    v24 = v23;
    if (v23)
    {
      if (a2)
      {
        v25 = [v23 jsonRepresentation];
        v26 = @"guidesHome";
      }
      else
      {
        v25 = [v23 dictionaryRepresentation];
        v26 = @"guides_home";
      }
      [v4 setObject:v25 forKey:v26];
    }
    v27 = -[GEOPDResultRefinement openOptions]((id *)a1);
    v28 = v27;
    if (v27)
    {
      if (a2)
      {
        v29 = [v27 jsonRepresentation];
        v30 = @"openOptions";
      }
      else
      {
        v29 = [v27 dictionaryRepresentation];
        v30 = @"open_options";
      }
      [v4 setObject:v29 forKey:v30];
    }
    v31 = *(void **)(a1 + 16);
    if (v31)
    {
      v32 = [v31 dictionaryRepresentation];
      v33 = v32;
      if (a2)
      {
        v34 = objc_msgSend(MEMORY[0x1E4F1CA60], "dictionaryWithCapacity:", objc_msgSend(v32, "count"));
        v38[0] = MEMORY[0x1E4F143A8];
        v38[1] = 3221225472;
        v38[2] = __51__GEOPDResultRefinement__dictionaryRepresentation___block_invoke;
        v38[3] = &unk_1E53D8860;
        id v35 = v34;
        id v39 = v35;
        [v33 enumerateKeysAndObjectsUsingBlock:v38];
        id v36 = v35;

        v33 = v36;
      }
      [v4 setObject:v33 forKey:@"Unknown Fields"];
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
  return -[GEOPDResultRefinement _dictionaryRepresentation:]((uint64_t)self, 1);
}

void __51__GEOPDResultRefinement__dictionaryRepresentation___block_invoke(uint64_t a1, void *a2, void *a3)
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

- (uint64_t)_initWithDictionary:(int)a3 isJSON:
{
  uint64_t v236 = *MEMORY[0x1E4F143B8];
  id v4 = a2;
  if (!a1 || (uint64_t v214 = [a1 init]) == 0)
  {
    uint64_t v214 = 0;
    goto LABEL_362;
  }
  if (a3) {
    id v5 = @"resultRefinementType";
  }
  else {
    id v5 = @"result_refinement_type";
  }
  objc_super v6 = [v4 objectForKeyedSubscript:v5];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v7 = v6;
    if ([v7 isEqualToString:@"RESULT_REFINEMENT_TYPE_UNKNOWN"])
    {
      int v8 = 0;
    }
    else if ([v7 isEqualToString:@"RESULT_REFINEMENT_TYPE_TOGGLE"])
    {
      int v8 = 1;
    }
    else if ([v7 isEqualToString:@"RESULT_REFINEMENT_TYPE_RANGE"])
    {
      int v8 = 2;
    }
    else if ([v7 isEqualToString:@"RESULT_REFINEMENT_TYPE_MULTI_SELECT"])
    {
      int v8 = 3;
    }
    else if ([v7 isEqualToString:@"RESULT_REFINEMENT_TYPE_SORT"])
    {
      int v8 = 4;
    }
    else if ([v7 isEqualToString:@"RESULT_REFINEMENT_GUIDES_HOME"])
    {
      int v8 = 5;
    }
    else if ([v7 isEqualToString:@"RESULT_REFINEMENT_TYPE_OPEN_OPTIONS"])
    {
      int v8 = 6;
    }
    else
    {
      int v8 = 0;
    }
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0) {
      goto LABEL_27;
    }
    int v8 = [v6 intValue];
  }
  *(_WORD *)(v214 + 88) |= 0x100u;
  *(_WORD *)(v214 + 88) |= 1u;
  *(_DWORD *)(v214 + 84) = v8;
LABEL_27:

  v9 = [v4 objectForKeyedSubscript:@"toggle"];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v10 = [GEOPDResultRefinementToggle alloc];
    if (v10) {
      v11 = (void *)-[GEOPDResultRefinementToggle _initWithDictionary:isJSON:](v10, v9, a3);
    }
    else {
      v11 = 0;
    }
    -[GEOPDResultRefinement setToggle:](v214, v11);
  }
  id v12 = [v4 objectForKeyedSubscript:@"range"];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v13 = [GEOPDResultRefinementRange alloc];
    if (!v13)
    {
      uint64_t v16 = 0;
      goto LABEL_125;
    }
    v14 = v13;
    id v15 = v12;
    uint64_t v16 = [(GEOPDResultRefinementRange *)v14 init];
    if (!v16)
    {
LABEL_124:

LABEL_125:
      id v74 = (id)v16;
      *(_WORD *)(v214 + 88) |= 0x20u;
      *(_WORD *)(v214 + 88) |= 0x100u;
      objc_storeStrong((id *)(v214 + 48), (id)v16);

      goto LABEL_126;
    }
    if (a3) {
      v17 = @"rangeType";
    }
    else {
      v17 = @"range_type";
    }
    v18 = [v15 objectForKeyedSubscript:v17];
    objc_opt_class();
    v19 = &OBJC_IVAR___GEOPDRelatedCollectionSection__collectionIds;
    if (objc_opt_isKindOfClass())
    {
      id v20 = v18;
      if ([v20 isEqualToString:@"RESULT_REFINEMENT_RANGE_TYPE_UNKNOWN"])
      {
        int v21 = 0;
      }
      else if ([v20 isEqualToString:@"RESULT_REFINEMENT_RANGE_TYPE_CONTINUOUS"])
      {
        int v21 = 1;
      }
      else if ([v20 isEqualToString:@"RESULT_REFINEMENT_RANGE_TYPE_DISCRETE"])
      {
        int v21 = 2;
      }
      else
      {
        int v21 = 0;
      }
    }
    else
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
LABEL_49:

        if (a3) {
          v22 = @"displayName";
        }
        else {
          v22 = @"display_name";
        }
        id v23 = [v15 objectForKeyedSubscript:v22];
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          v24 = (void *)[v23 copy];
          id v25 = v24;
          *(unsigned char *)(v16 + 64) |= 4u;
          *(unsigned char *)(v16 + 64) |= 0x20u;
          objc_storeStrong((id *)(v16 + 24), v24);
        }
        if (a3) {
          v26 = @"rangeContinuous";
        }
        else {
          v26 = @"range_continuous";
        }
        v27 = [v15 objectForKeyedSubscript:v26];
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          v28 = [GEOPDResultRefinementRangeContinuous alloc];
          if (v28)
          {
            id v29 = v27;
            v28 = [(GEOPDResultRefinementRangeContinuous *)v28 init];
            if (v28)
            {
              if (a3) {
                v30 = @"elementMinimum";
              }
              else {
                v30 = @"element_minimum";
              }
              v31 = [v29 objectForKeyedSubscript:v30];
              objc_opt_class();
              if (objc_opt_isKindOfClass())
              {
                id v32 = v15;
                v33 = [GEOPDResultRefinementRangeElement alloc];
                id v34 = v4;
                if (v33) {
                  id v35 = (void *)-[GEOPDResultRefinementRangeElement _initWithDictionary:isJSON:](v33, v31, a3);
                }
                else {
                  id v35 = 0;
                }
                id v36 = v35;
                *(unsigned char *)&v28->_flags |= 0x20u;
                *(unsigned char *)&v28->_flags |= 0x40u;
                objc_storeStrong((id *)&v28->_elementMinimum, v35);

                id v4 = v34;
                id v15 = v32;
                v19 = &OBJC_IVAR___GEOPDRelatedCollectionSection__collectionIds;
              }

              if (a3) {
                v37 = @"elementMaximum";
              }
              else {
                v37 = @"element_maximum";
              }
              v38 = [v29 objectForKeyedSubscript:v37];
              objc_opt_class();
              if (objc_opt_isKindOfClass())
              {
                id v39 = v15;
                v40 = [GEOPDResultRefinementRangeElement alloc];
                id v41 = v4;
                if (v40) {
                  v42 = (void *)-[GEOPDResultRefinementRangeElement _initWithDictionary:isJSON:](v40, v38, a3);
                }
                else {
                  v42 = 0;
                }
                id v43 = v42;
                *(unsigned char *)&v28->_flags |= 0x10u;
                *(unsigned char *)&v28->_flags |= 0x40u;
                objc_storeStrong((id *)&v28->_elementMaximum, v42);

                id v4 = v41;
                id v15 = v39;
                v19 = &OBJC_IVAR___GEOPDRelatedCollectionSection__collectionIds;
              }

              v44 = [v29 objectForKeyedSubscript:@"increment"];
              objc_opt_class();
              if (objc_opt_isKindOfClass())
              {
                [v44 doubleValue];
                *(unsigned char *)&v28->_flags |= 0x40u;
                *(unsigned char *)&v28->_flags |= 4u;
                v28->_increment = v45;
              }

              if (a3) {
                v46 = @"currentMinValue";
              }
              else {
                v46 = @"current_min_value";
              }
              v47 = [v29 objectForKeyedSubscript:v46];
              objc_opt_class();
              if (objc_opt_isKindOfClass())
              {
                [v47 doubleValue];
                *(unsigned char *)&v28->_flags |= 0x40u;
                *(unsigned char *)&v28->_flags |= 2u;
                v28->_currentMinValue = v48;
              }

              if (a3) {
                v49 = @"currentMaxValue";
              }
              else {
                v49 = @"current_max_value";
              }
              v50 = [v29 objectForKeyedSubscript:v49];
              objc_opt_class();
              if (objc_opt_isKindOfClass())
              {
                [v50 doubleValue];
                *(unsigned char *)&v28->_flags |= 0x40u;
                *(unsigned char *)&v28->_flags |= 1u;
                v28->_currentMaxValue = v51;
              }
            }
          }
          v52 = v28;
          *(unsigned char *)(v16 + v19[82]) |= 8u;
          *(unsigned char *)(v16 + v19[82]) |= 0x20u;
          objc_storeStrong((id *)(v16 + 32), v28);
        }
        if (a3) {
          v53 = @"rangeDiscrete";
        }
        else {
          v53 = @"range_discrete";
        }
        v54 = [v15 objectForKeyedSubscript:v53];
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          v55 = [GEOPDResultRefinementRangeDiscrete alloc];
          if (v55)
          {
            id v56 = v54;
            v55 = [(GEOPDResultRefinementRangeDiscrete *)v55 init];
            if (v55)
            {
              v57 = [v56 objectForKeyedSubscript:@"element"];
              objc_opt_class();
              if (objc_opt_isKindOfClass())
              {
                id v224 = v56;
                id v227 = v15;
                id v211 = v4;
                long long v233 = 0u;
                long long v234 = 0u;
                long long v231 = 0u;
                long long v232 = 0u;
                id v58 = v57;
                uint64_t v59 = [v58 countByEnumeratingWithState:&v231 objects:v235 count:16];
                if (v59)
                {
                  uint64_t v60 = v59;
                  uint64_t v61 = *(void *)v232;
                  do
                  {
                    uint64_t v62 = 0;
                    do
                    {
                      if (*(void *)v232 != v61) {
                        objc_enumerationMutation(v58);
                      }
                      v63 = *(void **)(*((void *)&v231 + 1) + 8 * v62);
                      objc_opt_class();
                      if (objc_opt_isKindOfClass())
                      {
                        v64 = [GEOPDResultRefinementRangeElement alloc];
                        if (v64) {
                          v65 = (void *)-[GEOPDResultRefinementRangeElement _initWithDictionary:isJSON:](v64, v63, a3);
                        }
                        else {
                          v65 = 0;
                        }
                        -[GEOPDResultRefinementRangeDiscrete addElement:]((uint64_t)v55, v65);
                      }
                      ++v62;
                    }
                    while (v60 != v62);
                    uint64_t v66 = [v58 countByEnumeratingWithState:&v231 objects:v235 count:16];
                    uint64_t v60 = v66;
                  }
                  while (v66);
                }

                id v4 = v211;
                id v56 = v224;
                id v15 = v227;
                v19 = &OBJC_IVAR___GEOPDRelatedCollectionSection__collectionIds;
              }

              if (a3) {
                v67 = @"selectedMinElementIndex";
              }
              else {
                v67 = @"selected_min_element_index";
              }
              v68 = [v56 objectForKeyedSubscript:v67];
              objc_opt_class();
              if (objc_opt_isKindOfClass())
              {
                unsigned int v69 = [v68 unsignedIntValue];
                *(unsigned char *)&v55->_flags |= 2u;
                v55->_selectedMinElementIndex = v69;
              }

              if (a3) {
                v70 = @"selectedMaxElementIndex";
              }
              else {
                v70 = @"selected_max_element_index";
              }
              v71 = [v56 objectForKeyedSubscript:v70];
              objc_opt_class();
              if (objc_opt_isKindOfClass())
              {
                unsigned int v72 = [v71 unsignedIntValue];
                *(unsigned char *)&v55->_flags |= 1u;
                v55->_selectedMaxElementIndex = v72;
              }
            }
          }
          v73 = v55;
          *(unsigned char *)(v16 + v19[82]) |= 0x10u;
          *(unsigned char *)(v16 + v19[82]) |= 0x20u;
          objc_storeStrong((id *)(v16 + 40), v55);
        }
        goto LABEL_124;
      }
      int v21 = [v18 intValue];
    }
    *(unsigned char *)(v16 + 64) |= 0x20u;
    *(unsigned char *)(v16 + 64) |= 1u;
    *(_DWORD *)(v16 + 60) = v21;
    goto LABEL_49;
  }
LABEL_126:

  if (a3) {
    v75 = @"multiSelect";
  }
  else {
    v75 = @"multi_select";
  }
  v76 = [v4 objectForKeyedSubscript:v75];
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    goto LABEL_250;
  }
  v77 = [GEOPDResultRefinementMultiSelect alloc];
  if (!v77)
  {
    uint64_t v228 = 0;
    goto LABEL_249;
  }
  v78 = v77;
  id v79 = v76;
  uint64_t v228 = [(GEOPDResultRefinementMultiSelect *)v78 init];
  if (v228)
  {
    if (a3) {
      v80 = @"displayName";
    }
    else {
      v80 = @"display_name";
    }
    v225 = v80;
    v81 = objc_msgSend(v79, "objectForKeyedSubscript:");
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v82 = (void *)[v81 copy];
      -[GEOPDResultRefinementMultiSelect setDisplayName:](v228, v82);
    }
    v83 = [v79 objectForKeyedSubscript:v75];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v209 = v79;
      v210 = v76;
      id v212 = v4;
      long long v233 = 0u;
      long long v234 = 0u;
      long long v231 = 0u;
      long long v232 = 0u;
      v208 = v83;
      id v84 = v83;
      uint64_t v85 = [v84 countByEnumeratingWithState:&v231 objects:v235 count:16];
      if (!v85) {
        goto LABEL_215;
      }
      uint64_t v86 = v85;
      uint64_t v87 = *(void *)v232;
      if (a3) {
        v88 = @"isSelected";
      }
      else {
        v88 = @"is_selected";
      }
      v89 = @"style_attributes";
      if (a3) {
        v89 = @"styleAttributes";
      }
      v220 = v89;
      v222 = v88;
      if (a3) {
        v90 = @"elementType";
      }
      else {
        v90 = @"element_type";
      }
      v91 = @"evChargingConnectorType";
      if (!a3) {
        v91 = @"ev_charging_connector_type";
      }
      v216 = v91;
      v218 = v90;
      v92 = @"selection_sequence_number";
      if (a3) {
        v92 = @"selectionSequenceNumber";
      }
      v215 = v92;
      while (1)
      {
        for (uint64_t i = 0; i != v86; ++i)
        {
          if (*(void *)v232 != v87) {
            objc_enumerationMutation(v84);
          }
          v94 = *(void **)(*((void *)&v231 + 1) + 8 * i);
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            v95 = [GEOPDResultRefinementMultiSelectElement alloc];
            if (v95)
            {
              id v96 = v94;
              v95 = [(GEOPDResultRefinementMultiSelectElement *)v95 init];
              if (v95)
              {
                v97 = [v96 objectForKeyedSubscript:v225];
                objc_opt_class();
                if (objc_opt_isKindOfClass())
                {
                  v98 = (void *)[v97 copy];
                  -[GEOPDResultRefinementMultiSelectElement setDisplayName:]((uint64_t)v95, v98);
                }
                v99 = [v96 objectForKeyedSubscript:v222];
                objc_opt_class();
                if (objc_opt_isKindOfClass())
                {
                  char v100 = [v99 BOOLValue];
                  *(_WORD *)&v95->_flags |= 0x100u;
                  *(_WORD *)&v95->_flags |= 8u;
                  v95->_isSelected = v100;
                }

                v101 = [v96 objectForKeyedSubscript:v220];
                objc_opt_class();
                if (objc_opt_isKindOfClass())
                {
                  v102 = [GEOStyleAttributes alloc];
                  if (a3) {
                    v103 = [(GEOStyleAttributes *)v102 initWithJSON:v101];
                  }
                  else {
                    v103 = [(GEOStyleAttributes *)v102 initWithDictionary:v101];
                  }
                  v104 = v103;
                  v105 = v103;
                  *(_WORD *)&v95->_flags |= 0x80u;
                  *(_WORD *)&v95->_flags |= 0x100u;
                  objc_storeStrong((id *)&v95->_styleAttributes, v104);
                }
                v106 = [v96 objectForKeyedSubscript:@"metadata"];
                objc_opt_class();
                if (objc_opt_isKindOfClass())
                {
                  v107 = [GEOPDResultRefinementMetadata alloc];
                  if (a3) {
                    v108 = [(GEOPDResultRefinementMetadata *)v107 initWithJSON:v106];
                  }
                  else {
                    v108 = [(GEOPDResultRefinementMetadata *)v107 initWithDictionary:v106];
                  }
                  v109 = v108;
                  -[GEOPDResultRefinementMultiSelectElement setMetadata:]((uint64_t)v95, v108);
                }
                v110 = [v96 objectForKeyedSubscript:v218];
                objc_opt_class();
                if (objc_opt_isKindOfClass())
                {
                  id v111 = v110;
                  if ([v111 isEqualToString:@"RESULT_REFINEMENT_MULTI_SELECT_ELEMENT_TYPE_DEFAULT"])int v112 = 0; {
                  else
                  }
                    int v112 = [v111 isEqualToString:@"RESULT_REFINEMENT_MULTI_SELECT_ELEMENT_TYPE_EV_CHARGING"];

LABEL_179:
                  *(_WORD *)&v95->_flags |= 0x100u;
                  *(_WORD *)&v95->_flags |= 1u;
                  v95->_elementType = v112;
                }
                else
                {
                  objc_opt_class();
                  if (objc_opt_isKindOfClass())
                  {
                    int v112 = [v110 intValue];
                    goto LABEL_179;
                  }
                }

                v113 = [v96 objectForKeyedSubscript:v216];
                objc_opt_class();
                if (objc_opt_isKindOfClass())
                {
                  id v114 = v113;
                  if ([v114 isEqualToString:@"CONNECTOR_TYPE_UNKNOWN"])
                  {
                    int v115 = 0;
                  }
                  else if ([v114 isEqualToString:@"CONNECTOR_TYPE_CHADEMO"])
                  {
                    int v115 = 1;
                  }
                  else if ([v114 isEqualToString:@"CONNECTOR_TYPE_J1772"])
                  {
                    int v115 = 2;
                  }
                  else if ([v114 isEqualToString:@"CONNECTOR_TYPE_TESLA"])
                  {
                    int v115 = 3;
                  }
                  else if ([v114 isEqualToString:@"CONNECTOR_TYPE_CCS1"])
                  {
                    int v115 = 4;
                  }
                  else if ([v114 isEqualToString:@"CONNECTOR_TYPE_CCS2"])
                  {
                    int v115 = 5;
                  }
                  else if ([v114 isEqualToString:@"CONNECTOR_TYPE_GBT1"])
                  {
                    int v115 = 6;
                  }
                  else if ([v114 isEqualToString:@"CONNECTOR_TYPE_GBT2"])
                  {
                    int v115 = 7;
                  }
                  else if ([v114 isEqualToString:@"CONNECTOR_TYPE_MENNEKES"])
                  {
                    int v115 = 8;
                  }
                  else if ([v114 isEqualToString:@"CONNECTOR_TYPE_NACS_AC"])
                  {
                    int v115 = 9;
                  }
                  else if ([v114 isEqualToString:@"CONNECTOR_TYPE_NACS_DC"])
                  {
                    int v115 = 10;
                  }
                  else
                  {
                    int v115 = 0;
                  }

LABEL_207:
                  *(_WORD *)&v95->_flags |= 0x100u;
                  *(_WORD *)&v95->_flags |= 2u;
                  v95->_evChargingConnectorType = v115;
                }
                else
                {
                  objc_opt_class();
                  if (objc_opt_isKindOfClass())
                  {
                    int v115 = [v113 intValue];
                    goto LABEL_207;
                  }
                }

                v116 = [v96 objectForKeyedSubscript:v215];
                objc_opt_class();
                if (objc_opt_isKindOfClass())
                {
                  unsigned int v117 = [v116 unsignedIntValue];
                  *(_WORD *)&v95->_flags |= 0x100u;
                  *(_WORD *)&v95->_flags |= 4u;
                  v95->_selectionSequenceNumber = v117;
                }
              }
            }
            -[GEOPDResultRefinementMultiSelect addMultiSelect:](v228, v95);

            continue;
          }
        }
        uint64_t v86 = [v84 countByEnumeratingWithState:&v231 objects:v235 count:16];
        if (!v86)
        {
LABEL_215:

          v76 = v210;
          id v4 = v212;
          v83 = v208;
          id v79 = v209;
          break;
        }
      }
    }

    if (a3) {
      v118 = @"maxNumSelectElements";
    }
    else {
      v118 = @"max_num_select_elements";
    }
    v119 = [v79 objectForKeyedSubscript:v118];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      int v120 = [v119 unsignedIntValue];
      *(_WORD *)(v228 + 80) |= 0x100u;
      *(_WORD *)(v228 + 80) |= 2u;
      *(_DWORD *)(v228 + 72) = v120;
    }

    if (a3) {
      v121 = @"clauseType";
    }
    else {
      v121 = @"clause_type";
    }
    v122 = [v79 objectForKeyedSubscript:v121];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v123 = v122;
      if ([v123 isEqualToString:@"RESULT_REFINEMENT_MULTI_SELECT_CLAUSE_TYPE_ANY"]) {
        int v124 = 0;
      }
      else {
        int v124 = [v123 isEqualToString:@"RESULT_REFINEMENT_MULTI_SELECT_CLAUSE_TYPE_ALL"];
      }
    }
    else
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
LABEL_232:

        if (a3) {
          v125 = @"showEqualWidthButtonsOnFilterView";
        }
        else {
          v125 = @"show_equal_width_buttons_on_filter_view";
        }
        v126 = [v79 objectForKeyedSubscript:v125];
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          char v127 = [v126 BOOLValue];
          *(_WORD *)(v228 + 80) |= 0x100u;
          *(_WORD *)(v228 + 80) |= 4u;
          *(unsigned char *)(v228 + 76) = v127;
        }

        if (a3) {
          v128 = @"displayNameForMultiSelected";
        }
        else {
          v128 = @"display_name_for_multi_selected";
        }
        v129 = [v79 objectForKeyedSubscript:v128];
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          v130 = (void *)[v129 copy];
          -[GEOPDResultRefinementMultiSelect setDisplayNameForMultiSelected:](v228, v130);
        }
        if (a3) {
          v131 = @"multiSelectIdentifier";
        }
        else {
          v131 = @"multi_select_identifier";
        }
        v132 = [v79 objectForKeyedSubscript:v131];
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          v133 = (void *)[v132 copy];
          -[GEOPDResultRefinementMultiSelect setMultiSelectIdentifier:](v228, v133);
        }
        goto LABEL_248;
      }
      int v124 = [v122 intValue];
    }
    *(_WORD *)(v228 + 80) |= 0x100u;
    *(_WORD *)(v228 + 80) |= 1u;
    *(_DWORD *)(v228 + 68) = v124;
    goto LABEL_232;
  }
LABEL_248:

LABEL_249:
  -[GEOPDResultRefinement setMultiSelect:](v214, (void *)v228);

LABEL_250:
  v134 = [v4 objectForKeyedSubscript:@"sort"];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v135 = [GEOPDResultRefinementSort alloc];
    if (v135)
    {
      v136 = v135;
      id v137 = v134;
      uint64_t v138 = [(GEOPDResultRefinementSort *)v136 init];
      if (v138)
      {
        if (a3) {
          v139 = @"displayName";
        }
        else {
          v139 = @"display_name";
        }
        v229 = v139;
        v140 = objc_msgSend(v137, "objectForKeyedSubscript:");
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          v141 = (void *)[v140 copy];
          -[GEOPDResultRefinementSort setDisplayName:](v138, v141);
        }
        v142 = [v137 objectForKeyedSubscript:@"sort"];
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          id v219 = v137;
          v221 = v134;
          id v213 = v4;
          long long v233 = 0u;
          long long v234 = 0u;
          long long v231 = 0u;
          long long v232 = 0u;
          v217 = v142;
          id v143 = v142;
          uint64_t v144 = [v143 countByEnumeratingWithState:&v231 objects:v235 count:16];
          if (v144)
          {
            uint64_t v145 = v144;
            uint64_t v146 = *(void *)v232;
            if (a3) {
              v147 = @"styleAttributes";
            }
            else {
              v147 = @"style_attributes";
            }
            v148 = @"displayNameInBar";
            if (!a3) {
              v148 = @"display_name_in_bar";
            }
            v223 = v148;
            v226 = v147;
            do
            {
              for (uint64_t j = 0; j != v145; ++j)
              {
                if (*(void *)v232 != v146) {
                  objc_enumerationMutation(v143);
                }
                v150 = *(void **)(*((void *)&v231 + 1) + 8 * j);
                objc_opt_class();
                if (objc_opt_isKindOfClass())
                {
                  v151 = [GEOPDResultRefinementSortElement alloc];
                  if (v151)
                  {
                    id v152 = v150;
                    v151 = [(GEOPDResultRefinementSortElement *)v151 init];
                    if (v151)
                    {
                      v153 = [v152 objectForKeyedSubscript:v229];
                      objc_opt_class();
                      if (objc_opt_isKindOfClass())
                      {
                        v154 = (void *)[v153 copy];
                        -[GEOPDResultRefinementSortElement setDisplayName:]((uint64_t)v151, v154);
                      }
                      v155 = [v152 objectForKeyedSubscript:v226];
                      objc_opt_class();
                      if (objc_opt_isKindOfClass())
                      {
                        v156 = [GEOStyleAttributes alloc];
                        if (a3) {
                          v157 = [(GEOStyleAttributes *)v156 initWithJSON:v155];
                        }
                        else {
                          v157 = [(GEOStyleAttributes *)v156 initWithDictionary:v155];
                        }
                        v158 = v157;
                        v159 = v157;
                        *(unsigned char *)&v151->_flags |= 0x10u;
                        *(unsigned char *)&v151->_flags |= 0x20u;
                        objc_storeStrong((id *)&v151->_styleAttributes, v158);
                      }
                      v160 = [v152 objectForKeyedSubscript:@"metadata"];
                      objc_opt_class();
                      if (objc_opt_isKindOfClass())
                      {
                        v161 = [GEOPDResultRefinementMetadata alloc];
                        if (a3) {
                          v162 = [(GEOPDResultRefinementMetadata *)v161 initWithJSON:v160];
                        }
                        else {
                          v162 = [(GEOPDResultRefinementMetadata *)v161 initWithDictionary:v160];
                        }
                        v163 = v162;
                        -[GEOPDResultRefinementSortElement setMetadata:]((uint64_t)v151, v162);
                      }
                      v164 = [v152 objectForKeyedSubscript:v223];
                      objc_opt_class();
                      if (objc_opt_isKindOfClass())
                      {
                        v165 = (void *)[v164 copy];
                        id v166 = v165;
                        *(unsigned char *)&v151->_flags |= 2u;
                        *(unsigned char *)&v151->_flags |= 0x20u;
                        objc_storeStrong((id *)&v151->_displayNameInBar, v165);
                      }
                    }
                  }
                  -[GEOPDResultRefinementSort addSort:](v138, v151);
                }
              }
              uint64_t v145 = [v143 countByEnumeratingWithState:&v231 objects:v235 count:16];
            }
            while (v145);
          }

          id v4 = v213;
          id v137 = v219;
          v134 = v221;
          v142 = v217;
        }

        if (a3) {
          v167 = @"selectedElementIndex";
        }
        else {
          v167 = @"selected_element_index";
        }
        v168 = [v137 objectForKeyedSubscript:v167];
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          int v169 = [v168 unsignedIntValue];
          *(unsigned char *)(v138 + 60) |= 0x20u;
          *(unsigned char *)(v138 + 60) |= 2u;
          *(_DWORD *)(v138 + 56) = v169;
        }

        if (a3) {
          v170 = @"defaultSelectedElementIndex";
        }
        else {
          v170 = @"default_selected_element_index";
        }
        v171 = [v137 objectForKeyedSubscript:v170];
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          int v172 = [v171 unsignedIntValue];
          *(unsigned char *)(v138 + 60) |= 0x20u;
          *(unsigned char *)(v138 + 60) |= 1u;
          *(_DWORD *)(v138 + 52) = v172;
        }
      }
    }
    else
    {
      uint64_t v138 = 0;
    }
    -[GEOPDResultRefinement setSort:](v214, (void *)v138);
  }
  if (a3) {
    v173 = @"guidesHome";
  }
  else {
    v173 = @"guides_home";
  }
  v174 = [v4 objectForKeyedSubscript:v173];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v175 = [GEOPDResultRefinementGuidesHome alloc];
    if (v175) {
      v176 = (void *)-[GEOPDResultRefinementGuidesHome _initWithDictionary:isJSON:]((uint64_t)v175, v174, a3);
    }
    else {
      v176 = 0;
    }
    id v177 = v176;
    *(_WORD *)(v214 + 88) |= 4u;
    *(_WORD *)(v214 + 88) |= 0x100u;
    objc_storeStrong((id *)(v214 + 24), v176);
  }
  if (a3) {
    v178 = @"openOptions";
  }
  else {
    v178 = @"open_options";
  }
  v179 = [v4 objectForKeyedSubscript:v178];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v180 = [GEOPDResultRefinementOpenOptions alloc];
    if (v180)
    {
      id v181 = v179;
      v180 = [(GEOPDResultRefinementOpenOptions *)v180 init];
      if (v180)
      {
        if (a3) {
          v182 = @"displayName";
        }
        else {
          v182 = @"display_name";
        }
        v183 = [v181 objectForKeyedSubscript:v182];
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          v184 = (void *)[v183 copy];
          -[GEOPDResultRefinementOpenOptions setDisplayName:]((uint64_t)v180, v184);
        }
        if (a3) {
          v185 = @"openNow";
        }
        else {
          v185 = @"open_now";
        }
        v186 = [v181 objectForKeyedSubscript:v185];
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          v187 = [GEOPDResultRefinementToggle alloc];
          if (v187) {
            v188 = (void *)-[GEOPDResultRefinementToggle _initWithDictionary:isJSON:](v187, v186, a3);
          }
          else {
            v188 = 0;
          }
          -[GEOPDResultRefinementOpenOptions setOpenNow:]((uint64_t)v180, v188);
        }
        if (a3) {
          v189 = @"openAt";
        }
        else {
          v189 = @"open_at";
        }
        v190 = [v181 objectForKeyedSubscript:v189];
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          v191 = [GEOPDResultRefinementTime alloc];
          if (v191)
          {
            id v192 = v190;
            v191 = [(GEOPDResultRefinementTime *)v191 init];
            if (v191)
            {
              v193 = [v192 objectForKeyedSubscript:v182];
              objc_opt_class();
              if (objc_opt_isKindOfClass())
              {
                v194 = (void *)[v193 copy];
                -[GEOPDResultRefinementTime setDisplayName:]((uint64_t)v191, v194);
              }
              v195 = [v192 objectForKeyedSubscript:@"timestamp"];
              objc_opt_class();
              if (objc_opt_isKindOfClass())
              {
                [v195 doubleValue];
                *(unsigned char *)&v191->_flags |= 0x40u;
                *(unsigned char *)&v191->_flags |= 1u;
                v191->_timestamp = v196;
              }

              if (a3) {
                v197 = @"isSelected";
              }
              else {
                v197 = @"is_selected";
              }
              v198 = [v192 objectForKeyedSubscript:v197];
              objc_opt_class();
              if (objc_opt_isKindOfClass())
              {
                char v199 = [v198 BOOLValue];
                *(unsigned char *)&v191->_flags |= 0x40u;
                *(unsigned char *)&v191->_flags |= 2u;
                v191->_isSelected = v199;
              }

              v200 = [v192 objectForKeyedSubscript:@"metadata"];
              objc_opt_class();
              if (objc_opt_isKindOfClass())
              {
                v201 = [GEOPDResultRefinementMetadata alloc];
                if (a3) {
                  v202 = [(GEOPDResultRefinementMetadata *)v201 initWithJSON:v200];
                }
                else {
                  v202 = [(GEOPDResultRefinementMetadata *)v201 initWithDictionary:v200];
                }
                v203 = v202;
                -[GEOPDResultRefinementTime setMetadata:]((uint64_t)v191, v202);
              }
              if (a3) {
                v204 = @"usedNextDayForFilteration";
              }
              else {
                v204 = @"used_next_day_for_filteration";
              }
              v205 = [v192 objectForKeyedSubscript:v204];
              objc_opt_class();
              if (objc_opt_isKindOfClass())
              {
                char v206 = [v205 BOOLValue];
                *(unsigned char *)&v191->_flags |= 0x40u;
                *(unsigned char *)&v191->_flags |= 4u;
                v191->_usedNextDayForFilteration = v206;
              }
            }
          }
          -[GEOPDResultRefinementOpenOptions setOpenAt:]((uint64_t)v180, v191);
        }
      }
    }
    -[GEOPDResultRefinement setOpenOptions:](v214, v180);
  }
LABEL_362:

  return v214;
}

- (BOOL)readFrom:(id)a3
{
  return GEOPDResultRefinementReadAllFrom((uint64_t)self, a3, 0);
}

- (void)writeTo:(id)a3
{
  id v8 = a3;
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  if (self->_reader && (_GEOPDResultRefinementIsDirty((uint64_t)self) & 1) == 0)
  {
    objc_super v6 = self->_reader;
    objc_sync_enter(v6);
    *(void *)((char *)self->_reader + (int)*MEMORY[0x1E4F940E0]) = self->_readerMarkLength;
    [(PBDataReader *)self->_reader seekToOffset:self->_readerMarkPos];
    id v7 = [(PBDataReader *)self->_reader readBytes:self->_readerMarkLength - self->_readerMarkPos];
    [v8 writeData:v7];
    os_unfair_lock_unlock(p_readerLock);

    objc_sync_exit(v6);
  }
  else
  {
    os_unfair_lock_unlock(&self->_readerLock);
    -[GEOPDResultRefinement readAll:]((uint64_t)self, 0);
    if (*(_WORD *)&self->_flags) {
      PBDataWriterWriteInt32Field();
    }
    id v5 = v8;
    if (self->_toggle)
    {
      PBDataWriterWriteSubmessage();
      id v5 = v8;
    }
    if (self->_range)
    {
      PBDataWriterWriteSubmessage();
      id v5 = v8;
    }
    if (self->_multiSelect)
    {
      PBDataWriterWriteSubmessage();
      id v5 = v8;
    }
    if (self->_sort)
    {
      PBDataWriterWriteSubmessage();
      id v5 = v8;
    }
    if (self->_guidesHome)
    {
      PBDataWriterWriteSubmessage();
      id v5 = v8;
    }
    if (self->_openOptions)
    {
      PBDataWriterWriteSubmessage();
      id v5 = v8;
    }
    [(PBUnknownFields *)self->_unknownFields writeTo:v5];
  }
}

- (uint64_t)hasGreenTeaWithValue:(uint64_t)result
{
  if (result)
  {
    uint64_t v3 = result;
    -[GEOPDResultRefinement _readGuidesHome](result);
    uint64_t v4 = *(void *)(v3 + 24);
    return -[GEOPDResultRefinementGuidesHome hasGreenTeaWithValue:](v4, a2);
  }
  return result;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  os_unfair_lock_lock(&self->_readerLock);
  reader = self->_reader;
  if (reader)
  {
    id v7 = reader;
    objc_sync_enter(v7);
    if ((*(_WORD *)&self->_flags & 0x100) == 0)
    {
      *(void *)((char *)self->_reader + (int)*MEMORY[0x1E4F940E0]) = self->_readerMarkLength;
      [(PBDataReader *)self->_reader seekToOffset:self->_readerMarkPos];
      GEOPDResultRefinementReadAllFrom(v5, self->_reader, 0);
      os_unfair_lock_unlock(&self->_readerLock);
      id v8 = (id)v5;
      objc_sync_exit(v7);

      goto LABEL_8;
    }
    objc_sync_exit(v7);
  }
  os_unfair_lock_unlock(&self->_readerLock);
  -[GEOPDResultRefinement readAll:]((uint64_t)self, 0);
  if (*(_WORD *)&self->_flags)
  {
    *(_DWORD *)(v5 + 84) = self->_resultRefinementType;
    *(_WORD *)(v5 + 88) |= 1u;
  }
  id v9 = [(GEOPDResultRefinementToggle *)self->_toggle copyWithZone:a3];
  id v10 = *(void **)(v5 + 64);
  *(void *)(v5 + 64) = v9;

  id v11 = [(GEOPDResultRefinementRange *)self->_range copyWithZone:a3];
  id v12 = *(void **)(v5 + 48);
  *(void *)(v5 + 48) = v11;

  id v13 = [(GEOPDResultRefinementMultiSelect *)self->_multiSelect copyWithZone:a3];
  v14 = *(void **)(v5 + 32);
  *(void *)(v5 + 32) = v13;

  id v15 = [(GEOPDResultRefinementSort *)self->_sort copyWithZone:a3];
  uint64_t v16 = *(void **)(v5 + 56);
  *(void *)(v5 + 56) = v15;

  id v17 = [(GEOPDResultRefinementGuidesHome *)self->_guidesHome copyWithZone:a3];
  v18 = *(void **)(v5 + 24);
  *(void *)(v5 + 24) = v17;

  id v19 = [(GEOPDResultRefinementOpenOptions *)self->_openOptions copyWithZone:a3];
  id v20 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v19;

  int v21 = self->_unknownFields;
  id v8 = *(id *)(v5 + 16);
  *(void *)(v5 + 16) = v21;
LABEL_8:

  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_19;
  }
  -[GEOPDResultRefinement readAll:]((uint64_t)self, 1);
  -[GEOPDResultRefinement readAll:]((uint64_t)v4, 1);
  __int16 v5 = *((_WORD *)v4 + 44);
  if (*(_WORD *)&self->_flags)
  {
    if ((v5 & 1) == 0 || self->_resultRefinementType != *((_DWORD *)v4 + 21)) {
      goto LABEL_19;
    }
  }
  else if (v5)
  {
LABEL_19:
    char v12 = 0;
    goto LABEL_20;
  }
  toggle = self->_toggle;
  if ((unint64_t)toggle | *((void *)v4 + 8) && !-[GEOPDResultRefinementToggle isEqual:](toggle, "isEqual:")) {
    goto LABEL_19;
  }
  range = self->_range;
  if ((unint64_t)range | *((void *)v4 + 6))
  {
    if (!-[GEOPDResultRefinementRange isEqual:](range, "isEqual:")) {
      goto LABEL_19;
    }
  }
  multiSelect = self->_multiSelect;
  if ((unint64_t)multiSelect | *((void *)v4 + 4))
  {
    if (!-[GEOPDResultRefinementMultiSelect isEqual:](multiSelect, "isEqual:")) {
      goto LABEL_19;
    }
  }
  sort = self->_sort;
  if ((unint64_t)sort | *((void *)v4 + 7))
  {
    if (!-[GEOPDResultRefinementSort isEqual:](sort, "isEqual:")) {
      goto LABEL_19;
    }
  }
  guidesHome = self->_guidesHome;
  if ((unint64_t)guidesHome | *((void *)v4 + 3))
  {
    if (!-[GEOPDResultRefinementGuidesHome isEqual:](guidesHome, "isEqual:")) {
      goto LABEL_19;
    }
  }
  openOptions = self->_openOptions;
  if ((unint64_t)openOptions | *((void *)v4 + 5)) {
    char v12 = -[GEOPDResultRefinementOpenOptions isEqual:](openOptions, "isEqual:");
  }
  else {
    char v12 = 1;
  }
LABEL_20:

  return v12;
}

- (unint64_t)hash
{
  -[GEOPDResultRefinement readAll:]((uint64_t)self, 1);
  if (*(_WORD *)&self->_flags) {
    uint64_t v3 = 2654435761 * self->_resultRefinementType;
  }
  else {
    uint64_t v3 = 0;
  }
  unint64_t v4 = [(GEOPDResultRefinementToggle *)self->_toggle hash] ^ v3;
  unint64_t v5 = [(GEOPDResultRefinementRange *)self->_range hash];
  unint64_t v6 = v4 ^ v5 ^ [(GEOPDResultRefinementMultiSelect *)self->_multiSelect hash];
  unint64_t v7 = [(GEOPDResultRefinementSort *)self->_sort hash];
  unint64_t v8 = v7 ^ [(GEOPDResultRefinementGuidesHome *)self->_guidesHome hash];
  return v6 ^ v8 ^ [(GEOPDResultRefinementOpenOptions *)self->_openOptions hash];
}

- (void)clearUnknownFields:(uint64_t)a1
{
  if (a1)
  {
    os_unfair_lock_lock_with_options();
    *(_WORD *)(a1 + 88) |= 2u;
    *(_WORD *)(a1 + 88) |= 0x100u;
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 80));
    unint64_t v4 = *(void **)(a1 + 16);
    *(void *)(a1 + 16) = 0;

    if (a2)
    {
      -[GEOPDResultRefinement readAll:](a1, 0);
      -[GEOPDResultRefinementToggle clearUnknownFields:](*(void *)(a1 + 64), 1);
      -[GEOPDResultRefinementRange clearUnknownFields:](*(void *)(a1 + 48), 1);
      -[GEOPDResultRefinementMultiSelect clearUnknownFields:](*(void *)(a1 + 32), 1);
      -[GEOPDResultRefinementSort clearUnknownFields:](*(void *)(a1 + 56), 1);
      -[GEOPDResultRefinementGuidesHome clearUnknownFields:](*(void *)(a1 + 24), 1);
      uint64_t v5 = *(void *)(a1 + 40);
      -[GEOPDResultRefinementOpenOptions clearUnknownFields:](v5, 1);
    }
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_toggle, 0);
  objc_storeStrong((id *)&self->_sort, 0);
  objc_storeStrong((id *)&self->_range, 0);
  objc_storeStrong((id *)&self->_openOptions, 0);
  objc_storeStrong((id *)&self->_multiSelect, 0);
  objc_storeStrong((id *)&self->_guidesHome, 0);
  objc_storeStrong((id *)&self->_unknownFields, 0);

  objc_storeStrong((id *)&self->_reader, 0);
}

@end