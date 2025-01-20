@interface GEOResultTypeAutocompleteFilter
- (BOOL)_legacy_applyToAutocompleteParameters:(id)a3 error:(id *)a4;
- (BOOL)_modern_applyToAutocompleteParameters:(id)a3 error:(id *)a4;
- (BOOL)applyToAutocompleteParameters:(id)a3 error:(id *)a4;
- (GEOResultTypeAutocompleteFilter)init;
- (GEOResultTypeAutocompleteFilter)initWithResultTypes:(unint64_t)a3;
- (unint64_t)types;
@end

@implementation GEOResultTypeAutocompleteFilter

- (GEOResultTypeAutocompleteFilter)init
{
  result = (GEOResultTypeAutocompleteFilter *)[MEMORY[0x1E4F1CA00] raise:@"GEOMethodNotAvailableException" format:@"This method is unavailable."];
  __break(1u);
  return result;
}

- (GEOResultTypeAutocompleteFilter)initWithResultTypes:(unint64_t)a3
{
  v8.receiver = self;
  v8.super_class = (Class)GEOResultTypeAutocompleteFilter;
  v4 = [(GEOResultTypeAutocompleteFilter *)&v8 init];
  v5 = v4;
  if (v4)
  {
    v4->_types = a3;
    v6 = v4;
  }

  return v5;
}

- (BOOL)applyToAutocompleteParameters:(id)a3 error:(id *)a4
{
  int v6 = MapsFeaturesConfig_UseSearchResultTypeFilter;
  v7 = off_1E9111F38;
  id v8 = a3;
  if (GEOConfigGetBOOL(v6, (uint64_t)v7)) {
    BOOL v9 = [(GEOResultTypeAutocompleteFilter *)self _modern_applyToAutocompleteParameters:v8 error:a4];
  }
  else {
    BOOL v9 = [(GEOResultTypeAutocompleteFilter *)self _legacy_applyToAutocompleteParameters:v8 error:a4];
  }
  BOOL v10 = v9;

  return v10;
}

- (BOOL)_legacy_applyToAutocompleteParameters:(id)a3 error:(id *)a4
{
  id v6 = a3;
  if (([v6 hasAutocompleteFilter] & 1) == 0)
  {
    v7 = objc_alloc_init(GEOPDAutocompleteFilter);
    [v6 setAutocompleteFilter:v7];
  }
  unint64_t types = self->_types;
  BOOL v9 = [v6 autocompleteFilter];
  uint64_t v10 = [v9 requestedEntryTypesCount];

  if (v10)
  {
    v11 = [v6 autocompleteFilter];
    uint64_t v12 = [v11 requestedEntryTypesCount];

    if (v12)
    {
      unint64_t v13 = 0;
      while (1)
      {
        v14 = [v6 autocompleteFilter];
        int v15 = [v14 requestedEntryTypeAtIndex:v13];

        if (!v15) {
          goto LABEL_9;
        }
        if (v15 != 2) {
          break;
        }
        if ((types & 1) == 0)
        {
LABEL_18:
          if (a4)
          {
            [MEMORY[0x1E4F28C58] GEOErrorWithCode:-10 reason:@"ResultType filter conflicts with previous filter"];
            BOOL v20 = 0;
            *a4 = (id)objc_claimAutoreleasedReturnValue();
          }
          else
          {
            BOOL v20 = 0;
          }
          goto LABEL_21;
        }
LABEL_12:
        ++v13;
        v16 = [v6 autocompleteFilter];
        unint64_t v17 = [v16 requestedEntryTypesCount];

        if (v13 >= v17) {
          goto LABEL_13;
        }
      }
      if (v15 != 1) {
        goto LABEL_18;
      }
LABEL_9:
      if ((types & 2) == 0) {
        goto LABEL_18;
      }
      goto LABEL_12;
    }
  }
LABEL_13:
  v18 = [v6 autocompleteFilter];
  [v18 clearRequestedEntryTypes];

  if (types)
  {
    v19 = [v6 autocompleteFilter];
    [v19 addRequestedEntryType:2];
  }
  if ((types & 2) != 0)
  {
    v21 = [v6 autocompleteFilter];
    BOOL v20 = 1;
    [v21 addRequestedEntryType:1];

    v22 = [v6 autocompleteFilter];
    [v22 addRequestedEntryType:0];
  }
  else
  {
    BOOL v20 = 1;
  }
LABEL_21:

  return v20;
}

- (BOOL)_modern_applyToAutocompleteParameters:(id)a3 error:(id *)a4
{
  id v5 = a3;
  id v6 = v5;
  if (self->_types)
  {
    v7 = [v5 autocompleteFilter];
    if (!v7)
    {
      v7 = objc_alloc_init(GEOPDAutocompleteFilter);
      [v6 setAutocompleteFilter:v7];
    }
    unint64_t types = self->_types;
    if (types)
    {
      [(GEOPDAutocompleteFilter *)v7 addResultTypeFilter:3];
      unint64_t types = self->_types;
      if ((types & 2) == 0)
      {
LABEL_6:
        if ((types & 4) == 0) {
          goto LABEL_7;
        }
        goto LABEL_13;
      }
    }
    else if ((types & 2) == 0)
    {
      goto LABEL_6;
    }
    [(GEOPDAutocompleteFilter *)v7 addResultTypeFilter:1];
    unint64_t types = self->_types;
    if ((types & 4) == 0)
    {
LABEL_7:
      if ((types & 8) == 0)
      {
LABEL_9:

        goto LABEL_10;
      }
LABEL_8:
      [(GEOPDAutocompleteFilter *)v7 addResultTypeFilter:2];
      goto LABEL_9;
    }
LABEL_13:
    [(GEOPDAutocompleteFilter *)v7 addResultTypeFilter:4];
    if ((self->_types & 8) == 0) {
      goto LABEL_9;
    }
    goto LABEL_8;
  }
LABEL_10:

  return 1;
}

- (unint64_t)types
{
  return self->_types;
}

@end