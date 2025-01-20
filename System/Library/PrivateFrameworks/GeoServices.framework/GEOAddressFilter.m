@interface GEOAddressFilter
+ (id)filterExcludingAllOptions;
+ (id)filterIncludingAllOptions;
- (BOOL)_applyToSubTypeFilter:(id)a3 error:(id *)a4;
- (BOOL)applyToAutocompleteParameters:(id)a3 error:(id *)a4;
- (BOOL)applyToSearchParameters:(id)a3 error:(id *)a4;
- (GEOAddressFilter)initWithOptionsToInclude:(unint64_t)a3 optionsToExclude:(unint64_t)a4;
- (unint64_t)optionsToExclude;
- (unint64_t)optionsToInclude;
@end

@implementation GEOAddressFilter

+ (id)filterIncludingAllOptions
{
  v2 = (void *)[objc_alloc((Class)objc_opt_class()) initWithOptionsToInclude:-1 optionsToExclude:0];

  return v2;
}

+ (id)filterExcludingAllOptions
{
  v2 = (void *)[objc_alloc((Class)objc_opt_class()) initWithOptionsToInclude:0 optionsToExclude:-1];

  return v2;
}

- (GEOAddressFilter)initWithOptionsToInclude:(unint64_t)a3 optionsToExclude:(unint64_t)a4
{
  v7.receiver = self;
  v7.super_class = (Class)GEOAddressFilter;
  result = [(GEOAddressFilter *)&v7 init];
  if (result)
  {
    result->_optionsToInclude = a3;
    result->_optionsToExclude = a4;
  }
  return result;
}

- (BOOL)_applyToSubTypeFilter:(id)a3 error:(id *)a4
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  BOOL v7 = 0;
  unint64_t v8 = 0;
  v9 = MEMORY[0x1E4F14500];
  while (1)
  {
    uint64_t v10 = _applyToSubTypeFilter_error__allOptions[v8];
    unint64_t v11 = self->_optionsToInclude & v10;
    unint64_t v12 = self->_optionsToExclude & v10;
    if (v11 | v12) {
      break;
    }
LABEL_28:
    BOOL v7 = v8++ > 4;
    if (v8 == 6)
    {
      BOOL v7 = 1;
      goto LABEL_47;
    }
  }
  if (v11) {
    BOOL v13 = v12 == 0;
  }
  else {
    BOOL v13 = 1;
  }
  if (v13)
  {
    switch(v10)
    {
      case 0:
      case 8:
        if (!v11) {
          goto LABEL_26;
        }
        goto LABEL_24;
      case 1:
        if (!v11) {
          goto LABEL_26;
        }
        goto LABEL_24;
      case 2:
        if (!v11) {
          goto LABEL_26;
        }
        goto LABEL_24;
      case 3:
      case 5:
      case 6:
      case 7:
        goto LABEL_15;
      case 4:
        if (!v11) {
          goto LABEL_26;
        }
        goto LABEL_24;
      default:
        if (v10 == 16)
        {
          if (v11) {
            goto LABEL_24;
          }
        }
        else if (v10 == 32)
        {
          if (v11) {
            goto LABEL_24;
          }
        }
        else
        {
LABEL_15:
          if (os_log_type_enabled(v9, OS_LOG_TYPE_FAULT))
          {
            *(_DWORD *)buf = 67109120;
            LODWORD(v21) = v10;
            _os_log_fault_impl(&dword_188D96000, v9, OS_LOG_TYPE_FAULT, "Unreachable reached: Invalid single option: %#x", buf, 8u);
          }
          if (v11)
          {
LABEL_24:
            -[GEOPDAddressResultSubTypeFilter addIncludeAddressSubTypeFilter:]((uint64_t)v6);
            goto LABEL_28;
          }
        }
LABEL_26:
        if (v12) {
          -[GEOPDAddressResultSubTypeFilter addExcludeAddressSubTypeFilter:]((uint64_t)v6);
        }
        break;
    }
    goto LABEL_28;
  }
  v14 = @"<none>";
  switch(v10)
  {
    case 0:
      break;
    case 1:
      v14 = @"Country";
      break;
    case 2:
      v14 = @"AdministrativeArea";
      break;
    case 3:
    case 5:
    case 6:
    case 7:
      goto LABEL_35;
    case 4:
      v14 = @"SubAdministrativeArea";
      break;
    case 8:
      v14 = @"Locality";
      break;
    default:
      if (v10 == 16)
      {
        v14 = @"SubLocality";
      }
      else if (v10 == 32)
      {
        v14 = @"PostalCode";
      }
      else
      {
LABEL_35:
        if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT))
        {
          *(_DWORD *)buf = 67109120;
          LODWORD(v21) = v10;
          _os_log_fault_impl(&dword_188D96000, MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT, "Unreachable reached: Invalid single option: %#x", buf, 8u);
        }
        v14 = @"<invalid>";
      }
      break;
  }
  v15 = (void *)MEMORY[0x1E4F28C58];
  v16 = [NSString stringWithFormat:@"Option %@ is both included and excluded", v14];
  v17 = [v15 GEOErrorWithCode:-12 reason:v16];

  v18 = GEOGetPlaceRequestLog();
  if (os_log_type_enabled(v18, OS_LOG_TYPE_FAULT))
  {
    *(_DWORD *)buf = 138412290;
    v21 = v14;
    _os_log_impl(&dword_188D96000, v18, OS_LOG_TYPE_FAULT, "Invalid GEOAddressFilter: option %@ is both included and excluded", buf, 0xCu);
  }

  if (a4) {
    *a4 = v17;
  }

LABEL_47:
  return v7;
}

- (BOOL)applyToSearchParameters:(id)a3 error:(id *)a4
{
  id v6 = (id *)a3;
  BOOL v7 = v6;
  if (*(_OWORD *)&self->_optionsToInclude == 0)
  {
    BOOL v11 = 1;
  }
  else
  {
    -[GEOPDSearchParameters searchFilter](v6);
    unint64_t v8 = (GEOPDSSearchFilter *)objc_claimAutoreleasedReturnValue();
    if (!v8)
    {
      unint64_t v8 = objc_alloc_init(GEOPDSSearchFilter);
      -[GEOPDSearchParameters setSearchFilter:]((uint64_t)v7, v8);
    }
    -[GEOPDSSearchFilter addressResultSubTypeFilter]((id *)&v8->super.super.isa);
    v9 = (GEOPDAddressResultSubTypeFilter *)objc_claimAutoreleasedReturnValue();
    if (!v9)
    {
      v9 = objc_alloc_init(GEOPDAddressResultSubTypeFilter);
      -[GEOPDSSearchFilter setAddressResultSubTypeFilter:]((uint64_t)v8, v9);
    }
    BOOL v11 = [(GEOAddressFilter *)self _applyToSubTypeFilter:v9 error:a4];
  }
  return v11;
}

- (BOOL)applyToAutocompleteParameters:(id)a3 error:(id *)a4
{
  id v6 = a3;
  BOOL v7 = v6;
  if (*(_OWORD *)&self->_optionsToInclude == 0)
  {
    BOOL v11 = 1;
  }
  else
  {
    unint64_t v8 = [v6 autocompleteFilter];
    if (!v8)
    {
      unint64_t v8 = objc_alloc_init(GEOPDAutocompleteFilter);
      [v7 setAutocompleteFilter:v8];
    }
    v9 = [(GEOPDAutocompleteFilter *)v8 addressResultSubTypeFilter];
    if (!v9)
    {
      v9 = objc_alloc_init(GEOPDAddressResultSubTypeFilter);
      [(GEOPDAutocompleteFilter *)v8 setAddressResultSubTypeFilter:v9];
    }
    BOOL v11 = [(GEOAddressFilter *)self _applyToSubTypeFilter:v9 error:a4];
  }
  return v11;
}

- (unint64_t)optionsToInclude
{
  return self->_optionsToInclude;
}

- (unint64_t)optionsToExclude
{
  return self->_optionsToExclude;
}

@end