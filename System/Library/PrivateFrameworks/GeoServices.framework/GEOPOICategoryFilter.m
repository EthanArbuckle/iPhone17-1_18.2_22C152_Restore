@interface GEOPOICategoryFilter
+ (id)filterExcludingAllCategories;
+ (id)filterIncludingAllCategories;
- (BOOL)applyToAutocompleteParameters:(id)a3 error:(id *)a4;
- (BOOL)applyToSearchParameters:(id)a3 error:(id *)a4;
- (BOOL)shouldDisplayPOIWithType:(int)a3;
- (GEOPOICategoryFilter)initWithCategoriesToInclude:(id)a3 categoriesToExclude:(id)a4;
- (NSArray)categoriesToExclude;
- (NSArray)categoriesToInclude;
- (void)applyFilterToPlaceParameters:(id)a3;
@end

@implementation GEOPOICategoryFilter

+ (id)filterIncludingAllCategories
{
  v2 = (void *)[objc_alloc((Class)objc_opt_class()) initWithCategoriesToInclude:0 categoriesToExclude:MEMORY[0x1E4F1CBF0]];

  return v2;
}

+ (id)filterExcludingAllCategories
{
  v2 = (void *)[objc_alloc((Class)objc_opt_class()) initWithCategoriesToInclude:MEMORY[0x1E4F1CBF0] categoriesToExclude:0];

  return v2;
}

- (GEOPOICategoryFilter)initWithCategoriesToInclude:(id)a3 categoriesToExclude:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v15.receiver = self;
  v15.super_class = (Class)GEOPOICategoryFilter;
  v8 = [(GEOPOICategoryFilter *)&v15 init];
  if (v8)
  {
    uint64_t v9 = [v6 copy];
    categoriesToInclude = v8->_categoriesToInclude;
    v8->_categoriesToInclude = (NSArray *)v9;

    uint64_t v11 = [v7 copy];
    categoriesToExclude = v8->_categoriesToExclude;
    v8->_categoriesToExclude = (NSArray *)v11;

    v13 = v8;
  }

  return v8;
}

- (void)applyFilterToPlaceParameters:(id)a3
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if ([(NSArray *)self->_categoriesToInclude count] || [(NSArray *)self->_categoriesToExclude count])
  {
    v5 = objc_alloc_init(GEOPDPoiIconCategoryFilter);
    if (self->_categoriesToInclude)
    {
      long long v24 = 0u;
      long long v25 = 0u;
      long long v22 = 0u;
      long long v23 = 0u;
      id v6 = +[GEOPOITypeMapping sharedMapping];
      id v7 = [v6 typesForPOICategories:self->_categoriesToInclude];

      uint64_t v8 = [v7 countByEnumeratingWithState:&v22 objects:v27 count:16];
      if (v8)
      {
        uint64_t v9 = v8;
        uint64_t v10 = *(void *)v23;
        do
        {
          uint64_t v11 = 0;
          do
          {
            if (*(void *)v23 != v10) {
              objc_enumerationMutation(v7);
            }
            [*(id *)(*((void *)&v22 + 1) + 8 * v11) unsignedIntValue];
            -[GEOPDPoiIconCategoryFilter addIncludeCategoryFilter:]((uint64_t)v5);
            ++v11;
          }
          while (v9 != v11);
          uint64_t v9 = [v7 countByEnumeratingWithState:&v22 objects:v27 count:16];
        }
        while (v9);
      }
    }
    if (self->_categoriesToExclude)
    {
      long long v20 = 0u;
      long long v21 = 0u;
      long long v18 = 0u;
      long long v19 = 0u;
      v12 = +[GEOPOITypeMapping sharedMapping];
      v13 = [v12 typesForPOICategories:self->_categoriesToExclude];

      uint64_t v14 = [v13 countByEnumeratingWithState:&v18 objects:v26 count:16];
      if (v14)
      {
        uint64_t v15 = v14;
        uint64_t v16 = *(void *)v19;
        do
        {
          uint64_t v17 = 0;
          do
          {
            if (*(void *)v19 != v16) {
              objc_enumerationMutation(v13);
            }
            [*(id *)(*((void *)&v18 + 1) + 8 * v17) unsignedIntValue];
            -[GEOPDPoiIconCategoryFilter addExcludeCategoryFilter:]((uint64_t)v5);
            ++v17;
          }
          while (v15 != v17);
          uint64_t v15 = [v13 countByEnumeratingWithState:&v18 objects:v26 count:16];
        }
        while (v15);
      }
    }
    -[GEOPDSpatialPlaceLookupParameters setPoiIconCategoryFilter:]((uint64_t)v4, v5);
  }
  else
  {
    -[GEOPDSpatialPlaceLookupParameters setPoiIconCategoryFilter:]((uint64_t)v4, 0);
  }
}

- (BOOL)applyToAutocompleteParameters:(id)a3 error:(id *)a4
{
  uint64_t v60 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  if (([v6 hasAutocompleteFilter] & 1) == 0)
  {
    id v7 = objc_alloc_init(GEOPDAutocompleteFilter);
    [v6 setAutocompleteFilter:v7];
  }
  if (self->_categoriesToExclude
    || (categoriesToInclude = self->_categoriesToInclude) == 0
    || [(NSArray *)categoriesToInclude count])
  {
    if (!self->_categoriesToInclude && !self->_categoriesToExclude) {
      goto LABEL_26;
    }
    uint64_t v8 = objc_alloc_init(GEOPDPoiIconCategoryFilter);
    if (self->_categoriesToInclude)
    {
      long long v56 = 0u;
      long long v57 = 0u;
      long long v54 = 0u;
      long long v55 = 0u;
      uint64_t v9 = +[GEOPOITypeMapping sharedMapping];
      uint64_t v10 = [v9 typesForPOICategories:self->_categoriesToInclude];

      uint64_t v11 = [v10 countByEnumeratingWithState:&v54 objects:v59 count:16];
      if (v11)
      {
        uint64_t v12 = v11;
        uint64_t v13 = *(void *)v55;
        do
        {
          for (uint64_t i = 0; i != v12; ++i)
          {
            if (*(void *)v55 != v13) {
              objc_enumerationMutation(v10);
            }
            [*(id *)(*((void *)&v54 + 1) + 8 * i) unsignedIntValue];
            -[GEOPDPoiIconCategoryFilter addIncludeCategoryFilter:]((uint64_t)v8);
          }
          uint64_t v12 = [v10 countByEnumeratingWithState:&v54 objects:v59 count:16];
        }
        while (v12);
      }
    }
    if (self->_categoriesToExclude)
    {
      long long v52 = 0u;
      long long v53 = 0u;
      long long v50 = 0u;
      long long v51 = 0u;
      uint64_t v15 = +[GEOPOITypeMapping sharedMapping];
      uint64_t v16 = [v15 typesForPOICategories:self->_categoriesToExclude];

      uint64_t v17 = [v16 countByEnumeratingWithState:&v50 objects:v58 count:16];
      if (v17)
      {
        uint64_t v18 = v17;
        uint64_t v19 = *(void *)v51;
        do
        {
          for (uint64_t j = 0; j != v18; ++j)
          {
            if (*(void *)v51 != v19) {
              objc_enumerationMutation(v16);
            }
            [*(id *)(*((void *)&v50 + 1) + 8 * j) unsignedIntValue];
            -[GEOPDPoiIconCategoryFilter addExcludeCategoryFilter:]((uint64_t)v8);
          }
          uint64_t v18 = [v16 countByEnumeratingWithState:&v50 objects:v58 count:16];
        }
        while (v18);
      }
    }
    long long v21 = [v6 autocompleteFilter];
    [v21 setPoiIconCategoryFilter:v8];

LABEL_25:
LABEL_26:
    BOOL v22 = 1;
    goto LABEL_27;
  }
  long long v25 = [v6 autocompleteFilter];
  uint64_t v26 = [v25 requestedEntryTypesCount];

  v27 = [v6 autocompleteFilter];
  uint64_t v28 = v27;
  if (!v26)
  {
    [v27 addRequestedEntryType:0];

    uint64_t v8 = [v6 autocompleteFilter];
    [(GEOPDPoiIconCategoryFilter *)v8 addRequestedEntryType:2];
    goto LABEL_25;
  }
  uint64_t v29 = [v27 requestedEntryTypesCount];

  if (!v29) {
    goto LABEL_26;
  }
  char v30 = 0;
  unint64_t v31 = 0;
  do
  {
    v32 = [v6 autocompleteFilter];
    int v33 = [v32 requestedEntryTypeAtIndex:v31];

    v30 |= v33 == 1;
    ++v31;
    v34 = [v6 autocompleteFilter];
    unint64_t v35 = [v34 requestedEntryTypesCount];
  }
  while (v31 < v35);
  if ((v30 & 1) == 0) {
    goto LABEL_26;
  }
  v36 = [v6 autocompleteFilter];
  uint64_t v37 = [v36 requestedEntryTypesCount];

  if (v37 != 1)
  {
    v38 = [v6 autocompleteFilter];
    v39 = malloc_type_malloc(4 * [v38 requestedEntryTypesCount] - 4, 0x100004052888210uLL);

    v40 = [v6 autocompleteFilter];
    uint64_t v41 = [v40 requestedEntryTypesCount];

    if (v41)
    {
      uint64_t v42 = 0;
      unint64_t v43 = 0;
      do
      {
        v44 = [v6 autocompleteFilter];
        int v45 = [v44 requestedEntryTypeAtIndex:v43];

        if (v45 != 1) {
          v39[v42++] = v45;
        }
        ++v43;
        v46 = [v6 autocompleteFilter];
        unint64_t v47 = [v46 requestedEntryTypesCount];
      }
      while (v43 < v47);
    }
    v48 = [v6 autocompleteFilter];
    v49 = [v6 autocompleteFilter];
    objc_msgSend(v48, "setRequestedEntryTypes:count:", v39, objc_msgSend(v49, "requestedEntryTypesCount") - 1);

    free(v39);
    goto LABEL_26;
  }
  if (a4)
  {
    [MEMORY[0x1E4F28C58] GEOErrorWithCode:-8];
    BOOL v22 = 0;
    *a4 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    BOOL v22 = 0;
  }
LABEL_27:

  return v22;
}

- (BOOL)applyToSearchParameters:(id)a3 error:(id *)a4
{
  uint64_t v39 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  uint64_t v7 = (uint64_t)v6;
  if (!v6 || (-[GEOPDSearchParameters _readSearchFilter]((uint64_t)v6), !*(void *)(v7 + 240)))
  {
    uint64_t v8 = objc_alloc_init(GEOPDSSearchFilter);
    -[GEOPDSearchParameters setSearchFilter:](v7, v8);
  }
  if (self->_categoriesToExclude
    || (categoriesToInclude = self->_categoriesToInclude) == 0
    || [(NSArray *)categoriesToInclude count])
  {
    if (self->_categoriesToInclude || self->_categoriesToExclude)
    {
      uint64_t v9 = objc_alloc_init(GEOPDPoiIconCategoryFilter);
      if (self->_categoriesToInclude)
      {
        long long v35 = 0u;
        long long v36 = 0u;
        long long v33 = 0u;
        long long v34 = 0u;
        uint64_t v10 = +[GEOPOITypeMapping sharedMapping];
        uint64_t v11 = [v10 typesForPOICategories:self->_categoriesToInclude];

        uint64_t v12 = [v11 countByEnumeratingWithState:&v33 objects:v38 count:16];
        if (v12)
        {
          uint64_t v13 = v12;
          uint64_t v14 = *(void *)v34;
          do
          {
            for (uint64_t i = 0; i != v13; ++i)
            {
              if (*(void *)v34 != v14) {
                objc_enumerationMutation(v11);
              }
              [*(id *)(*((void *)&v33 + 1) + 8 * i) unsignedIntValue];
              -[GEOPDPoiIconCategoryFilter addIncludeCategoryFilter:]((uint64_t)v9);
            }
            uint64_t v13 = [v11 countByEnumeratingWithState:&v33 objects:v38 count:16];
          }
          while (v13);
        }
      }
      if (self->_categoriesToExclude)
      {
        long long v31 = 0u;
        long long v32 = 0u;
        long long v29 = 0u;
        long long v30 = 0u;
        uint64_t v16 = +[GEOPOITypeMapping sharedMapping];
        uint64_t v17 = [v16 typesForPOICategories:self->_categoriesToExclude];

        uint64_t v18 = [v17 countByEnumeratingWithState:&v29 objects:v37 count:16];
        if (v18)
        {
          uint64_t v19 = v18;
          uint64_t v20 = *(void *)v30;
          do
          {
            for (uint64_t j = 0; j != v19; ++j)
            {
              if (*(void *)v30 != v20) {
                objc_enumerationMutation(v17);
              }
              [*(id *)(*((void *)&v29 + 1) + 8 * j) unsignedIntValue];
              -[GEOPDPoiIconCategoryFilter addExcludeCategoryFilter:]((uint64_t)v9);
            }
            uint64_t v19 = [v17 countByEnumeratingWithState:&v29 objects:v37 count:16];
          }
          while (v19);
        }
      }
      BOOL v22 = -[GEOPDSearchParameters searchFilter]((id *)v7);
      -[GEOPDSSearchFilter setPoiIconCategoryFilter:]((uint64_t)v22, v9);
    }
    goto LABEL_26;
  }
  uint64_t v26 = -[GEOPDSearchParameters searchFilter]((id *)v7);
  int v27 = -[GEOPDSSearchFilter searchIntentFilter]((uint64_t)v26);

  if (v27 == 3) {
    goto LABEL_33;
  }
  if (v27 != 1)
  {
    if (v27)
    {
LABEL_26:
      BOOL v23 = 1;
      goto LABEL_27;
    }
LABEL_33:
    uint64_t v28 = -[GEOPDSearchParameters searchFilter]((id *)v7);
    if (v28)
    {
      *(_WORD *)(v28 + 116) |= 0x400u;
      *(_WORD *)(v28 + 116) |= 1u;
      *(_DWORD *)(v28 + 108) = 1;
    }

    goto LABEL_26;
  }
  if (a4)
  {
    [MEMORY[0x1E4F28C58] GEOErrorWithCode:-8];
    BOOL v23 = 0;
    *a4 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    BOOL v23 = 0;
  }
LABEL_27:

  return v23;
}

- (BOOL)shouldDisplayPOIWithType:(int)a3
{
  uint64_t v3 = *(void *)&a3;
  if (!self->_categoriesToInclude && !self->_categoriesToExclude) {
    goto LABEL_4;
  }
  v5 = +[GEOPOITypeMapping sharedMapping];
  char v6 = [v5 isAlwaysVisiblePOIType:v3];

  if (v6) {
    goto LABEL_4;
  }
  if (!self->_categoriesToExclude)
  {
    categoriesToInclude = self->_categoriesToInclude;
    if (!categoriesToInclude) {
      goto LABEL_4;
    }
    uint64_t v7 = [(NSArray *)categoriesToInclude count];
    if (!v7) {
      return v7;
    }
  }
  if (self->_categoriesToInclude)
  {
    uint64_t v8 = +[GEOPOITypeMapping sharedMapping];
    uint64_t v9 = [v8 typesForPOICategories:self->_categoriesToInclude];
    uint64_t v10 = [NSNumber numberWithInt:v3];
    int v11 = [v9 containsObject:v10];

    if (!v11)
    {
      LOBYTE(v7) = 0;
      return v7;
    }
  }
  if (self->_categoriesToExclude)
  {
    uint64_t v12 = +[GEOPOITypeMapping sharedMapping];
    uint64_t v13 = [v12 typesForPOICategories:self->_categoriesToExclude];
    uint64_t v14 = [NSNumber numberWithInt:v3];
    char v15 = [v13 containsObject:v14];

    LOBYTE(v7) = v15 ^ 1;
    return v7;
  }
LABEL_4:
  LOBYTE(v7) = 1;
  return v7;
}

- (NSArray)categoriesToInclude
{
  return self->_categoriesToInclude;
}

- (NSArray)categoriesToExclude
{
  return self->_categoriesToExclude;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_categoriesToExclude, 0);

  objc_storeStrong((id *)&self->_categoriesToInclude, 0);
}

@end