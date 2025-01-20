@interface GEOResultTypeSearchFilter
- (BOOL)_legacy_applyToSearchParameters:(id)a3 error:(id *)a4;
- (BOOL)_modern_applyToSearchParameters:(id)a3 error:(id *)a4;
- (BOOL)applyToSearchParameters:(id)a3 error:(id *)a4;
- (GEOResultTypeSearchFilter)init;
- (GEOResultTypeSearchFilter)initWithResultTypes:(unint64_t)a3;
- (unint64_t)types;
@end

@implementation GEOResultTypeSearchFilter

- (GEOResultTypeSearchFilter)init
{
  result = (GEOResultTypeSearchFilter *)[MEMORY[0x1E4F1CA00] raise:@"GEOMethodNotAvailableException" format:@"This method is unavailable."];
  __break(1u);
  return result;
}

- (GEOResultTypeSearchFilter)initWithResultTypes:(unint64_t)a3
{
  v8.receiver = self;
  v8.super_class = (Class)GEOResultTypeSearchFilter;
  v4 = [(GEOResultTypeSearchFilter *)&v8 init];
  v5 = v4;
  if (v4)
  {
    v4->_types = a3;
    v6 = v4;
  }

  return v5;
}

- (BOOL)applyToSearchParameters:(id)a3 error:(id *)a4
{
  int v6 = MapsFeaturesConfig_UseSearchResultTypeFilter;
  v7 = off_1E9111F38;
  id v8 = a3;
  if (GEOConfigGetBOOL(v6, (uint64_t)v7)) {
    BOOL v9 = [(GEOResultTypeSearchFilter *)self _modern_applyToSearchParameters:v8 error:a4];
  }
  else {
    BOOL v9 = [(GEOResultTypeSearchFilter *)self _legacy_applyToSearchParameters:v8 error:a4];
  }
  BOOL v10 = v9;

  return v10;
}

- (BOOL)_legacy_applyToSearchParameters:(id)a3 error:(id *)a4
{
  id v6 = a3;
  uint64_t v7 = (uint64_t)v6;
  if (!v6 || (-[GEOPDSearchParameters _readSearchFilter]((uint64_t)v6), !*(void *)(v7 + 240)))
  {
    id v8 = objc_alloc_init(GEOPDSSearchFilter);
    -[GEOPDSearchParameters setSearchFilter:](v7, v8);
  }
  unint64_t types = self->_types;
  -[GEOPDSearchParameters searchFilter]((id *)v7);
  BOOL v10 = (_WORD *)objc_claimAutoreleasedReturnValue();
  if (!v10 || (__int16 v11 = v10[58], v10, (v11 & 1) == 0))
  {
    if ((~(_BYTE)types & 3) == 0)
    {
      uint64_t v12 = -[GEOPDSearchParameters searchFilter]((id *)v7);
      if (v12)
      {
        *(_WORD *)(v12 + 116) |= 0x400u;
        *(_WORD *)(v12 + 116) |= 1u;
        int v13 = 3;
LABEL_23:
        *(_DWORD *)(v12 + 108) = v13;
        goto LABEL_24;
      }
      goto LABEL_24;
    }
    if (types)
    {
      uint64_t v12 = -[GEOPDSearchParameters searchFilter]((id *)v7);
      if (v12)
      {
        *(_WORD *)(v12 + 116) |= 0x400u;
        *(_WORD *)(v12 + 116) |= 1u;
        int v13 = 2;
        goto LABEL_23;
      }
      goto LABEL_24;
    }
    if ((types & 2) != 0)
    {
      uint64_t v12 = -[GEOPDSearchParameters searchFilter]((id *)v7);
      if (v12)
      {
        *(_WORD *)(v12 + 116) |= 0x400u;
        *(_WORD *)(v12 + 116) |= 1u;
        int v13 = 1;
        goto LABEL_23;
      }
LABEL_24:
    }
LABEL_25:
    BOOL v16 = 1;
    goto LABEL_26;
  }
  v14 = -[GEOPDSearchParameters searchFilter]((id *)v7);
  int v15 = -[GEOPDSSearchFilter searchIntentFilter]((uint64_t)v14);

  if (v15 == 1)
  {
    if ((types & 2) != 0) {
      goto LABEL_25;
    }
    if (!a4) {
      goto LABEL_13;
    }
LABEL_20:
    [MEMORY[0x1E4F28C58] GEOErrorWithCode:-10 reason:@"ResultType filter conflicts with previous filter"];
    BOOL v16 = 0;
    *a4 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_26;
  }
  if (v15 != 2 || (types & 1) != 0) {
    goto LABEL_25;
  }
  if (a4) {
    goto LABEL_20;
  }
LABEL_13:
  BOOL v16 = 0;
LABEL_26:

  return v16;
}

- (BOOL)_modern_applyToSearchParameters:(id)a3 error:(id *)a4
{
  v5 = (id *)a3;
  id v6 = v5;
  if (self->_types)
  {
    -[GEOPDSearchParameters searchFilter](v5);
    uint64_t v7 = (GEOPDSSearchFilter *)objc_claimAutoreleasedReturnValue();
    if (!v7)
    {
      uint64_t v7 = objc_alloc_init(GEOPDSSearchFilter);
      -[GEOPDSearchParameters setSearchFilter:]((uint64_t)v6, v7);
    }
    unint64_t types = self->_types;
    if (types)
    {
      -[GEOPDSSearchFilter addResultTypeFilter:]((uint64_t)v7);
      unint64_t types = self->_types;
      if ((types & 2) == 0)
      {
LABEL_6:
        if ((types & 4) == 0)
        {
LABEL_8:

          goto LABEL_9;
        }
LABEL_7:
        -[GEOPDSSearchFilter addResultTypeFilter:]((uint64_t)v7);
        goto LABEL_8;
      }
    }
    else if ((types & 2) == 0)
    {
      goto LABEL_6;
    }
    -[GEOPDSSearchFilter addResultTypeFilter:]((uint64_t)v7);
    if ((self->_types & 4) == 0) {
      goto LABEL_8;
    }
    goto LABEL_7;
  }
LABEL_9:

  return 1;
}

- (unint64_t)types
{
  return self->_types;
}

@end