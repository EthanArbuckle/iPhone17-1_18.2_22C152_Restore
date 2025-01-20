@interface GEOPDAutocompleteFilter
+ (BOOL)isValid:(id)a3;
- (BOOL)hasAddressResultSubTypeFilter;
- (BOOL)hasIsStrictMapRegion;
- (BOOL)hasPoiIconCategoryFilter;
- (BOOL)isEqual:(id)a3;
- (BOOL)isStrictMapRegion;
- (BOOL)readFrom:(id)a3;
- (GEOPDAddressResultSubTypeFilter)addressResultSubTypeFilter;
- (GEOPDAutocompleteFilter)init;
- (GEOPDAutocompleteFilter)initWithData:(id)a3;
- (GEOPDAutocompleteFilter)initWithDictionary:(id)a3;
- (GEOPDAutocompleteFilter)initWithJSON:(id)a3;
- (GEOPDPoiIconCategoryFilter)poiIconCategoryFilter;
- (PBUnknownFields)unknownFields;
- (id)_dictionaryRepresentation:(uint64_t)a1;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)jsonRepresentation;
- (id)placeTypeFiltersAsString:(int)a3;
- (id)requestedEntryTypesAsString:(int)a3;
- (id)resultTypeFiltersAsString:(int)a3;
- (int)StringAsPlaceTypeFilters:(id)a3;
- (int)StringAsRequestedEntryTypes:(id)a3;
- (int)StringAsResultTypeFilters:(id)a3;
- (int)placeTypeFilterAtIndex:(unint64_t)a3;
- (int)placeTypeFilters;
- (int)requestedEntryTypeAtIndex:(unint64_t)a3;
- (int)requestedEntryTypes;
- (int)resultTypeFilterAtIndex:(unint64_t)a3;
- (int)resultTypeFilters;
- (unint64_t)hash;
- (unint64_t)placeTypeFiltersCount;
- (unint64_t)requestedEntryTypesCount;
- (unint64_t)resultTypeFiltersCount;
- (void)_initWithDictionary:(int)a3 isJSON:;
- (void)_readAddressResultSubTypeFilter;
- (void)_readPlaceTypeFilters;
- (void)_readPoiIconCategoryFilter;
- (void)_readRequestedEntryTypes;
- (void)_readResultTypeFilters;
- (void)addPlaceTypeFilter:(int)a3;
- (void)addRequestedEntryType:(int)a3;
- (void)addResultTypeFilter:(int)a3;
- (void)clearPlaceTypeFilters;
- (void)clearRequestedEntryTypes;
- (void)clearResultTypeFilters;
- (void)clearUnknownFields:(BOOL)a3;
- (void)copyTo:(id)a3;
- (void)dealloc;
- (void)mergeFrom:(id)a3;
- (void)readAll:(BOOL)a3;
- (void)setAddressResultSubTypeFilter:(id)a3;
- (void)setHasIsStrictMapRegion:(BOOL)a3;
- (void)setIsStrictMapRegion:(BOOL)a3;
- (void)setPlaceTypeFilters:(int *)a3 count:(unint64_t)a4;
- (void)setPoiIconCategoryFilter:(id)a3;
- (void)setRequestedEntryTypes:(int *)a3 count:(unint64_t)a4;
- (void)setResultTypeFilters:(int *)a3 count:(unint64_t)a4;
- (void)writeTo:(id)a3;
@end

@implementation GEOPDAutocompleteFilter

- (GEOPDAutocompleteFilter)init
{
  v6.receiver = self;
  v6.super_class = (Class)GEOPDAutocompleteFilter;
  v2 = [(GEOPDAutocompleteFilter *)&v6 init];
  v3 = v2;
  if (v2)
  {
    v2->_readerLock._os_unfair_lock_opaque = 0;
    v4 = v2;
  }

  return v3;
}

- (GEOPDAutocompleteFilter)initWithData:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)GEOPDAutocompleteFilter;
  v3 = [(GEOPDAutocompleteFilter *)&v7 initWithData:a3];
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
  PBRepeatedInt32Clear();
  v3.receiver = self;
  v3.super_class = (Class)GEOPDAutocompleteFilter;
  [(GEOPDAutocompleteFilter *)&v3 dealloc];
}

- (void)_readRequestedEntryTypes
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 120));
    if ((*(unsigned char *)(a1 + 128) & 8) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOPDAutocompleteFilterReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readRequestedEntryTypes_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 120));
  }
}

- (unint64_t)requestedEntryTypesCount
{
  return self->_requestedEntryTypes.count;
}

- (int)requestedEntryTypes
{
  return self->_requestedEntryTypes.list;
}

- (void)clearRequestedEntryTypes
{
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(unsigned char *)&self->_flags |= 8u;
  os_unfair_lock_unlock(p_readerLock);
  *(unsigned char *)&self->_flags |= 0x80u;

  PBRepeatedInt32Clear();
}

- (void)addRequestedEntryType:(int)a3
{
  if (self) {
    PBRepeatedInt32Add();
  }
  os_unfair_lock_lock_with_options();
  *(unsigned char *)&self->_flags |= 8u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(unsigned char *)&self->_flags |= 0x80u;
}

- (int)requestedEntryTypeAtIndex:(unint64_t)a3
{
  -[GEOPDAutocompleteFilter _readRequestedEntryTypes]((uint64_t)self);
  p_requestedEntryTypes = &self->_requestedEntryTypes;
  unint64_t count = self->_requestedEntryTypes.count;
  if (count <= a3)
  {
    objc_super v7 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v8 = *MEMORY[0x1E4F1C4A8];
    v9 = objc_msgSend(NSString, "stringWithFormat:", @"idx (%tu) is out of range (%tu)", a3, count);
    v10 = [v7 exceptionWithName:v8 reason:v9 userInfo:0];
    [v10 raise];
  }
  return p_requestedEntryTypes->list[a3];
}

- (void)setRequestedEntryTypes:(int *)a3 count:(unint64_t)a4
{
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(unsigned char *)&self->_flags |= 8u;
  os_unfair_lock_unlock(p_readerLock);
  *(unsigned char *)&self->_flags |= 0x80u;

  MEMORY[0x1F4147390](&self->_requestedEntryTypes, a3, a4);
}

- (id)requestedEntryTypesAsString:(int)a3
{
  if (a3 >= 0xA)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
    id v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v3 = off_1E53DC760[a3];
  }

  return v3;
}

- (int)StringAsRequestedEntryTypes:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"QUERY"])
  {
    int v4 = 0;
  }
  else if ([v3 isEqualToString:@"BUSINESS"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"ADDRESS"])
  {
    int v4 = 2;
  }
  else if ([v3 isEqualToString:@"CATEGORY"])
  {
    int v4 = 3;
  }
  else if ([v3 isEqualToString:@"BRAND_PROFILE"])
  {
    int v4 = 4;
  }
  else if ([v3 isEqualToString:@"OFFLINE_AREA"])
  {
    int v4 = 5;
  }
  else if ([v3 isEqualToString:@"CLIENT_RESOLVED"])
  {
    int v4 = 6;
  }
  else if ([v3 isEqualToString:@"DIRECTION_INTENT"])
  {
    int v4 = 7;
  }
  else if ([v3 isEqualToString:@"COLLECTION"])
  {
    int v4 = 8;
  }
  else if ([v3 isEqualToString:@"PUBLISHER"])
  {
    int v4 = 9;
  }
  else
  {
    int v4 = 0;
  }

  return v4;
}

- (void)_readPoiIconCategoryFilter
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 120));
    if ((*(unsigned char *)(a1 + 128) & 0x40) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOPDAutocompleteFilterReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readPoiIconCategoryFilter_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 120));
  }
}

- (BOOL)hasPoiIconCategoryFilter
{
  return self->_poiIconCategoryFilter != 0;
}

- (GEOPDPoiIconCategoryFilter)poiIconCategoryFilter
{
  -[GEOPDAutocompleteFilter _readPoiIconCategoryFilter]((uint64_t)self);
  poiIconCategoryFilter = self->_poiIconCategoryFilter;

  return poiIconCategoryFilter;
}

- (void)setPoiIconCategoryFilter:(id)a3
{
  *(unsigned char *)&self->_flags |= 0xC0u;
  objc_storeStrong((id *)&self->_poiIconCategoryFilter, a3);
}

- (void)_readPlaceTypeFilters
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 120));
    if ((*(unsigned char *)(a1 + 128) & 4) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOPDAutocompleteFilterReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readPlaceTypeFilters_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 120));
  }
}

- (unint64_t)placeTypeFiltersCount
{
  return self->_placeTypeFilters.count;
}

- (int)placeTypeFilters
{
  return self->_placeTypeFilters.list;
}

- (void)clearPlaceTypeFilters
{
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(unsigned char *)&self->_flags |= 4u;
  os_unfair_lock_unlock(p_readerLock);
  *(unsigned char *)&self->_flags |= 0x80u;

  PBRepeatedInt32Clear();
}

- (void)addPlaceTypeFilter:(int)a3
{
  if (self) {
    PBRepeatedInt32Add();
  }
  os_unfair_lock_lock_with_options();
  *(unsigned char *)&self->_flags |= 4u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(unsigned char *)&self->_flags |= 0x80u;
}

- (int)placeTypeFilterAtIndex:(unint64_t)a3
{
  -[GEOPDAutocompleteFilter _readPlaceTypeFilters]((uint64_t)self);
  p_placeTypeFilters = &self->_placeTypeFilters;
  unint64_t count = self->_placeTypeFilters.count;
  if (count <= a3)
  {
    objc_super v7 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v8 = *MEMORY[0x1E4F1C4A8];
    v9 = objc_msgSend(NSString, "stringWithFormat:", @"idx (%tu) is out of range (%tu)", a3, count);
    v10 = [v7 exceptionWithName:v8 reason:v9 userInfo:0];
    [v10 raise];
  }
  return p_placeTypeFilters->list[a3];
}

- (void)setPlaceTypeFilters:(int *)a3 count:(unint64_t)a4
{
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(unsigned char *)&self->_flags |= 4u;
  os_unfair_lock_unlock(p_readerLock);
  *(unsigned char *)&self->_flags |= 0x80u;

  MEMORY[0x1F4147390](&self->_placeTypeFilters, a3, a4);
}

- (id)placeTypeFiltersAsString:(int)a3
{
  switch(a3)
  {
    case '#':
      int v4 = @"TIME_ZONE";
      break;
    case '$':
    case '%':
    case '&':
    case '\'':
    case '(':
    case ')':
    case '*':
    case '4':
    case '5':
    case '8':
    case ':':
    case ';':
    case '<':
    case '>':
LABEL_13:
      objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
      int v4 = (__CFString *)objc_claimAutoreleasedReturnValue();
LABEL_14:
      break;
    case '+':
      int v4 = @"SUB_LOCALITY";
      break;
    case ',':
      int v4 = @"OCEAN";
      break;
    case '-':
      int v4 = @"AOI";
      break;
    case '.':
      int v4 = @"INLAND_WATER";
      break;
    case '/':
      int v4 = @"BUSINESS";
      break;
    case '0':
      int v4 = @"ISLAND";
      break;
    case '1':
      int v4 = @"STREET";
      break;
    case '2':
      int v4 = @"ADMIN";
      break;
    case '3':
      int v4 = @"POSTAL";
      break;
    case '6':
      int v4 = @"INTERSECTION";
      break;
    case '7':
      int v4 = @"BUILDING";
      break;
    case '9':
      int v4 = @"ADDRESS";
      break;
    case '=':
      int v4 = @"CONTINENT";
      break;
    case '?':
      int v4 = @"REGION";
      break;
    case '@':
      int v4 = @"DIVISION";
      break;
    case 'A':
      int v4 = @"PHYSICAL_FEATURE";
      break;
    default:
      int v4 = @"UNKNOWN_PLACE_TYPE";
      switch(a3)
      {
        case 0:
          goto LABEL_14;
        case 1:
          int v4 = @"COUNTRY";
          break;
        case 2:
          int v4 = @"ADMINISTRATIVE_AREA";
          break;
        case 3:
          goto LABEL_13;
        case 4:
          int v4 = @"SUB_ADMINISTRATIVE_AREA";
          break;
        default:
          if (a3 != 16) {
            goto LABEL_13;
          }
          int v4 = @"LOCALITY";
          break;
      }
      break;
  }
  return v4;
}

- (int)StringAsPlaceTypeFilters:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"UNKNOWN_PLACE_TYPE"])
  {
    int v4 = 0;
  }
  else if ([v3 isEqualToString:@"COUNTRY"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"ADMINISTRATIVE_AREA"])
  {
    int v4 = 2;
  }
  else if ([v3 isEqualToString:@"SUB_ADMINISTRATIVE_AREA"])
  {
    int v4 = 4;
  }
  else if ([v3 isEqualToString:@"LOCALITY"])
  {
    int v4 = 16;
  }
  else if ([v3 isEqualToString:@"TIME_ZONE"])
  {
    int v4 = 35;
  }
  else if ([v3 isEqualToString:@"SUB_LOCALITY"])
  {
    int v4 = 43;
  }
  else if ([v3 isEqualToString:@"OCEAN"])
  {
    int v4 = 44;
  }
  else if ([v3 isEqualToString:@"AOI"])
  {
    int v4 = 45;
  }
  else if ([v3 isEqualToString:@"INLAND_WATER"])
  {
    int v4 = 46;
  }
  else if ([v3 isEqualToString:@"BUSINESS"])
  {
    int v4 = 47;
  }
  else if ([v3 isEqualToString:@"ISLAND"])
  {
    int v4 = 48;
  }
  else if ([v3 isEqualToString:@"STREET"])
  {
    int v4 = 49;
  }
  else if ([v3 isEqualToString:@"ADMIN"])
  {
    int v4 = 50;
  }
  else if ([v3 isEqualToString:@"POSTAL"])
  {
    int v4 = 51;
  }
  else if ([v3 isEqualToString:@"INTERSECTION"])
  {
    int v4 = 54;
  }
  else if ([v3 isEqualToString:@"BUILDING"])
  {
    int v4 = 55;
  }
  else if ([v3 isEqualToString:@"ADDRESS"])
  {
    int v4 = 57;
  }
  else if ([v3 isEqualToString:@"CONTINENT"])
  {
    int v4 = 61;
  }
  else if ([v3 isEqualToString:@"REGION"])
  {
    int v4 = 63;
  }
  else if ([v3 isEqualToString:@"DIVISION"])
  {
    int v4 = 64;
  }
  else if ([v3 isEqualToString:@"PHYSICAL_FEATURE"])
  {
    int v4 = 65;
  }
  else
  {
    int v4 = 0;
  }

  return v4;
}

- (BOOL)isStrictMapRegion
{
  return self->_isStrictMapRegion;
}

- (void)setIsStrictMapRegion:(BOOL)a3
{
  *(unsigned char *)&self->_flags |= 0x81u;
  self->_isStrictMapRegion = a3;
}

- (void)setHasIsStrictMapRegion:(BOOL)a3
{
  *(unsigned char *)&self->_flags = *(unsigned char *)&self->_flags & 0x7E | a3 | 0x80;
}

- (BOOL)hasIsStrictMapRegion
{
  return *(unsigned char *)&self->_flags & 1;
}

- (void)_readResultTypeFilters
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 120));
    if ((*(unsigned char *)(a1 + 128) & 0x10) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOPDAutocompleteFilterReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readResultTypeFilters_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 120));
  }
}

- (unint64_t)resultTypeFiltersCount
{
  return self->_resultTypeFilters.count;
}

- (int)resultTypeFilters
{
  return self->_resultTypeFilters.list;
}

- (void)clearResultTypeFilters
{
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(unsigned char *)&self->_flags |= 0x10u;
  os_unfair_lock_unlock(p_readerLock);
  *(unsigned char *)&self->_flags |= 0x80u;

  PBRepeatedInt32Clear();
}

- (void)addResultTypeFilter:(int)a3
{
  if (self) {
    PBRepeatedInt32Add();
  }
  os_unfair_lock_lock_with_options();
  *(unsigned char *)&self->_flags |= 0x10u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(unsigned char *)&self->_flags |= 0x80u;
}

- (int)resultTypeFilterAtIndex:(unint64_t)a3
{
  -[GEOPDAutocompleteFilter _readResultTypeFilters]((uint64_t)self);
  p_resultTypeFilters = &self->_resultTypeFilters;
  unint64_t count = self->_resultTypeFilters.count;
  if (count <= a3)
  {
    objc_super v7 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v8 = *MEMORY[0x1E4F1C4A8];
    v9 = objc_msgSend(NSString, "stringWithFormat:", @"idx (%tu) is out of range (%tu)", a3, count);
    v10 = [v7 exceptionWithName:v8 reason:v9 userInfo:0];
    [v10 raise];
  }
  return p_resultTypeFilters->list[a3];
}

- (void)setResultTypeFilters:(int *)a3 count:(unint64_t)a4
{
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(unsigned char *)&self->_flags |= 0x10u;
  os_unfair_lock_unlock(p_readerLock);
  *(unsigned char *)&self->_flags |= 0x80u;

  MEMORY[0x1F4147390](&self->_resultTypeFilters, a3, a4);
}

- (id)resultTypeFiltersAsString:(int)a3
{
  if (a3 >= 5)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
    id v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v3 = off_1E53DC600[a3];
  }

  return v3;
}

- (int)StringAsResultTypeFilters:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"AUTOCOMPLETE_RESULT_TYPE_FILTER_UNKNOWN"])
  {
    int v4 = 0;
  }
  else if ([v3 isEqualToString:@"AUTOCOMPLETE_RESULT_TYPE_FILTER_POI"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"AUTOCOMPLETE_RESULT_TYPE_FILTER_PHYSICAL_FEATURE"])
  {
    int v4 = 2;
  }
  else if ([v3 isEqualToString:@"AUTOCOMPLETE_RESULT_TYPE_FILTER_ADDRESS"])
  {
    int v4 = 3;
  }
  else if ([v3 isEqualToString:@"AUTOCOMPLETE_RESULT_TYPE_FILTER_QUERY"])
  {
    int v4 = 4;
  }
  else
  {
    int v4 = 0;
  }

  return v4;
}

- (void)_readAddressResultSubTypeFilter
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 120));
    if ((*(unsigned char *)(a1 + 128) & 0x20) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOPDAutocompleteFilterReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readAddressResultSubTypeFilter_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 120));
  }
}

- (BOOL)hasAddressResultSubTypeFilter
{
  return self->_addressResultSubTypeFilter != 0;
}

- (GEOPDAddressResultSubTypeFilter)addressResultSubTypeFilter
{
  -[GEOPDAutocompleteFilter _readAddressResultSubTypeFilter]((uint64_t)self);
  addressResultSubTypeFilter = self->_addressResultSubTypeFilter;

  return addressResultSubTypeFilter;
}

- (void)setAddressResultSubTypeFilter:(id)a3
{
  *(unsigned char *)&self->_flags |= 0xA0u;
  objc_storeStrong((id *)&self->_addressResultSubTypeFilter, a3);
}

- (id)description
{
  id v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)GEOPDAutocompleteFilter;
  int v4 = [(GEOPDAutocompleteFilter *)&v8 description];
  v5 = [(GEOPDAutocompleteFilter *)self dictionaryRepresentation];
  objc_super v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEOPDAutocompleteFilter _dictionaryRepresentation:]((uint64_t)self, 0);
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  if (a1)
  {
    [(id)a1 readAll:1];
    int v4 = [MEMORY[0x1E4F1CA60] dictionary];
    if (*(void *)(a1 + 56))
    {
      v5 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:");
      objc_super v6 = (void *)(a1 + 48);
      if (*(void *)(a1 + 56))
      {
        unint64_t v7 = 0;
        do
        {
          uint64_t v8 = *(int *)(*v6 + 4 * v7);
          if (v8 >= 0xA)
          {
            objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", v8);
            v9 = (__CFString *)objc_claimAutoreleasedReturnValue();
          }
          else
          {
            v9 = off_1E53DC760[v8];
          }
          [v5 addObject:v9];

          ++v7;
          objc_super v6 = (void *)(a1 + 48);
        }
        while (v7 < *(void *)(a1 + 56));
      }
      if (a2) {
        v10 = @"requestedEntryType";
      }
      else {
        v10 = @"requested_entry_type";
      }
      [v4 setObject:v5 forKey:v10];
    }
    v11 = [(id)a1 poiIconCategoryFilter];
    v12 = v11;
    if (v11)
    {
      if (a2)
      {
        v13 = [v11 jsonRepresentation];
        v14 = @"poiIconCategoryFilter";
      }
      else
      {
        v13 = [v11 dictionaryRepresentation];
        v14 = @"poi_icon_category_filter";
      }
      [v4 setObject:v13 forKey:v14];
    }
    if (*(void *)(a1 + 32))
    {
      v15 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:");
      v16 = (void *)(a1 + 24);
      if (*(void *)(a1 + 32))
      {
        unint64_t v17 = 0;
        do
        {
          uint64_t v18 = *(unsigned int *)(*v16 + 4 * v17);
          switch((int)v18)
          {
            case '#':
              v19 = @"TIME_ZONE";
              break;
            case '$':
            case '%':
            case '&':
            case '\'':
            case '(':
            case ')':
            case '*':
            case '4':
            case '5':
            case '8':
            case ':':
            case ';':
            case '<':
            case '>':
LABEL_27:
              objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", v18);
              v19 = (__CFString *)objc_claimAutoreleasedReturnValue();
              break;
            case '+':
              v19 = @"SUB_LOCALITY";
              break;
            case ',':
              v19 = @"OCEAN";
              break;
            case '-':
              v19 = @"AOI";
              break;
            case '.':
              v19 = @"INLAND_WATER";
              break;
            case '/':
              v19 = @"BUSINESS";
              break;
            case '0':
              v19 = @"ISLAND";
              break;
            case '1':
              v19 = @"STREET";
              break;
            case '2':
              v19 = @"ADMIN";
              break;
            case '3':
              v19 = @"POSTAL";
              break;
            case '6':
              v19 = @"INTERSECTION";
              break;
            case '7':
              v19 = @"BUILDING";
              break;
            case '9':
              v19 = @"ADDRESS";
              break;
            case '=':
              v19 = @"CONTINENT";
              break;
            case '?':
              v19 = @"REGION";
              break;
            case '@':
              v19 = @"DIVISION";
              break;
            case 'A':
              v19 = @"PHYSICAL_FEATURE";
              break;
            default:
              v19 = @"UNKNOWN_PLACE_TYPE";
              switch((int)v18)
              {
                case 0:
                  goto LABEL_46;
                case 1:
                  v19 = @"COUNTRY";
                  break;
                case 2:
                  v19 = @"ADMINISTRATIVE_AREA";
                  break;
                case 3:
                  goto LABEL_27;
                case 4:
                  v19 = @"SUB_ADMINISTRATIVE_AREA";
                  break;
                default:
                  if (v18 != 16) {
                    goto LABEL_27;
                  }
                  v19 = @"LOCALITY";
                  break;
              }
              break;
          }
LABEL_46:
          [v15 addObject:v19];

          ++v17;
          v16 = (void *)(a1 + 24);
        }
        while (v17 < *(void *)(a1 + 32));
      }
      if (a2) {
        v20 = @"placeTypeFilter";
      }
      else {
        v20 = @"place_type_filter";
      }
      [v4 setObject:v15 forKey:v20];
    }
    if (*(unsigned char *)(a1 + 128))
    {
      v21 = [NSNumber numberWithBool:*(unsigned __int8 *)(a1 + 124)];
      if (a2) {
        v22 = @"isStrictMapRegion";
      }
      else {
        v22 = @"is_strict_map_region";
      }
      [v4 setObject:v21 forKey:v22];
    }
    if (*(void *)(a1 + 80))
    {
      v23 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:");
      v24 = (void *)(a1 + 72);
      if (*(void *)(a1 + 80))
      {
        unint64_t v25 = 0;
        do
        {
          uint64_t v26 = *(int *)(*v24 + 4 * v25);
          if (v26 >= 5)
          {
            objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", v26);
            v27 = (__CFString *)objc_claimAutoreleasedReturnValue();
          }
          else
          {
            v27 = off_1E53DC600[v26];
          }
          [v23 addObject:v27];

          ++v25;
          v24 = (void *)(a1 + 72);
        }
        while (v25 < *(void *)(a1 + 80));
      }
      if (a2) {
        v28 = @"resultTypeFilter";
      }
      else {
        v28 = @"result_type_filter";
      }
      [v4 setObject:v23 forKey:v28];
    }
    v29 = [(id)a1 addressResultSubTypeFilter];
    v30 = v29;
    if (v29)
    {
      if (a2)
      {
        v31 = [v29 jsonRepresentation];
        v32 = @"addressResultSubTypeFilter";
      }
      else
      {
        v31 = [v29 dictionaryRepresentation];
        v32 = @"address_result_sub_type_filter";
      }
      [v4 setObject:v31 forKey:v32];
    }
    v33 = *(void **)(a1 + 16);
    if (v33)
    {
      v34 = [v33 dictionaryRepresentation];
      v35 = v34;
      if (a2)
      {
        v36 = objc_msgSend(MEMORY[0x1E4F1CA60], "dictionaryWithCapacity:", objc_msgSend(v34, "count"));
        v40[0] = MEMORY[0x1E4F143A8];
        v40[1] = 3221225472;
        v40[2] = __53__GEOPDAutocompleteFilter__dictionaryRepresentation___block_invoke;
        v40[3] = &unk_1E53D8860;
        id v37 = v36;
        id v41 = v37;
        [v35 enumerateKeysAndObjectsUsingBlock:v40];
        id v38 = v37;

        v35 = v38;
      }
      [v4 setObject:v35 forKey:@"Unknown Fields"];
    }
  }
  else
  {
    int v4 = 0;
  }

  return v4;
}

- (id)jsonRepresentation
{
  return -[GEOPDAutocompleteFilter _dictionaryRepresentation:]((uint64_t)self, 1);
}

void __53__GEOPDAutocompleteFilter__dictionaryRepresentation___block_invoke(uint64_t a1, void *a2, void *a3)
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

- (GEOPDAutocompleteFilter)initWithDictionary:(id)a3
{
  return (GEOPDAutocompleteFilter *)-[GEOPDAutocompleteFilter _initWithDictionary:isJSON:](self, a3, 0);
}

- (void)_initWithDictionary:(int)a3 isJSON:
{
  uint64_t v68 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  if (a1)
  {
    objc_super v6 = (void *)[a1 init];
    if (v6)
    {
      if (a3) {
        unint64_t v7 = @"requestedEntryType";
      }
      else {
        unint64_t v7 = @"requested_entry_type";
      }
      uint64_t v8 = [v5 objectForKeyedSubscript:v7];
      objc_opt_class();
      id v52 = v5;
      int v51 = a3;
      if (objc_opt_isKindOfClass())
      {
        long long v63 = 0u;
        long long v64 = 0u;
        long long v61 = 0u;
        long long v62 = 0u;
        v48 = v8;
        id v9 = v8;
        uint64_t v10 = [v9 countByEnumeratingWithState:&v61 objects:v67 count:16];
        if (!v10) {
          goto LABEL_40;
        }
        uint64_t v11 = v10;
        uint64_t v12 = *(void *)v62;
        while (1)
        {
          for (uint64_t i = 0; i != v11; ++i)
          {
            if (*(void *)v62 != v12) {
              objc_enumerationMutation(v9);
            }
            v14 = *(void **)(*((void *)&v61 + 1) + 8 * i);
            objc_opt_class();
            if (objc_opt_isKindOfClass())
            {
              id v15 = v14;
              if ([v15 isEqualToString:@"QUERY"])
              {
                uint64_t v16 = 0;
              }
              else if ([v15 isEqualToString:@"BUSINESS"])
              {
                uint64_t v16 = 1;
              }
              else if ([v15 isEqualToString:@"ADDRESS"])
              {
                uint64_t v16 = 2;
              }
              else if ([v15 isEqualToString:@"CATEGORY"])
              {
                uint64_t v16 = 3;
              }
              else if ([v15 isEqualToString:@"BRAND_PROFILE"])
              {
                uint64_t v16 = 4;
              }
              else if ([v15 isEqualToString:@"OFFLINE_AREA"])
              {
                uint64_t v16 = 5;
              }
              else if ([v15 isEqualToString:@"CLIENT_RESOLVED"])
              {
                uint64_t v16 = 6;
              }
              else if ([v15 isEqualToString:@"DIRECTION_INTENT"])
              {
                uint64_t v16 = 7;
              }
              else if ([v15 isEqualToString:@"COLLECTION"])
              {
                uint64_t v16 = 8;
              }
              else if ([v15 isEqualToString:@"PUBLISHER"])
              {
                uint64_t v16 = 9;
              }
              else
              {
                uint64_t v16 = 0;
              }
            }
            else
            {
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) == 0) {
                continue;
              }
              uint64_t v16 = [v14 intValue];
            }
            [v6 addRequestedEntryType:v16];
          }
          uint64_t v11 = [v9 countByEnumeratingWithState:&v61 objects:v67 count:16];
          if (!v11)
          {
LABEL_40:

            id v5 = v52;
            uint64_t v8 = v48;
            break;
          }
        }
      }

      if (a3) {
        unint64_t v17 = @"poiIconCategoryFilter";
      }
      else {
        unint64_t v17 = @"poi_icon_category_filter";
      }
      uint64_t v18 = [v5 objectForKeyedSubscript:v17];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        v19 = [GEOPDPoiIconCategoryFilter alloc];
        if (v19) {
          v20 = -[GEOPDPoiIconCategoryFilter _initWithDictionary:isJSON:](v19, v18, a3);
        }
        else {
          v20 = 0;
        }
        [v6 setPoiIconCategoryFilter:v20];
      }
      if (a3) {
        v21 = @"placeTypeFilter";
      }
      else {
        v21 = @"place_type_filter";
      }
      v22 = [v5 objectForKeyedSubscript:v21];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        long long v59 = 0u;
        long long v60 = 0u;
        long long v57 = 0u;
        long long v58 = 0u;
        v49 = v22;
        id v23 = v22;
        uint64_t v24 = [v23 countByEnumeratingWithState:&v57 objects:v66 count:16];
        if (!v24) {
          goto LABEL_109;
        }
        uint64_t v25 = v24;
        uint64_t v26 = *(void *)v58;
        while (1)
        {
          for (uint64_t j = 0; j != v25; ++j)
          {
            if (*(void *)v58 != v26) {
              objc_enumerationMutation(v23);
            }
            v28 = *(void **)(*((void *)&v57 + 1) + 8 * j);
            objc_opt_class();
            if (objc_opt_isKindOfClass())
            {
              id v29 = v28;
              if ([v29 isEqualToString:@"UNKNOWN_PLACE_TYPE"])
              {
                uint64_t v30 = 0;
              }
              else if ([v29 isEqualToString:@"COUNTRY"])
              {
                uint64_t v30 = 1;
              }
              else if ([v29 isEqualToString:@"ADMINISTRATIVE_AREA"])
              {
                uint64_t v30 = 2;
              }
              else if ([v29 isEqualToString:@"SUB_ADMINISTRATIVE_AREA"])
              {
                uint64_t v30 = 4;
              }
              else if ([v29 isEqualToString:@"LOCALITY"])
              {
                uint64_t v30 = 16;
              }
              else if ([v29 isEqualToString:@"TIME_ZONE"])
              {
                uint64_t v30 = 35;
              }
              else if ([v29 isEqualToString:@"SUB_LOCALITY"])
              {
                uint64_t v30 = 43;
              }
              else if ([v29 isEqualToString:@"OCEAN"])
              {
                uint64_t v30 = 44;
              }
              else if ([v29 isEqualToString:@"AOI"])
              {
                uint64_t v30 = 45;
              }
              else if ([v29 isEqualToString:@"INLAND_WATER"])
              {
                uint64_t v30 = 46;
              }
              else if ([v29 isEqualToString:@"BUSINESS"])
              {
                uint64_t v30 = 47;
              }
              else if ([v29 isEqualToString:@"ISLAND"])
              {
                uint64_t v30 = 48;
              }
              else if ([v29 isEqualToString:@"STREET"])
              {
                uint64_t v30 = 49;
              }
              else if ([v29 isEqualToString:@"ADMIN"])
              {
                uint64_t v30 = 50;
              }
              else if ([v29 isEqualToString:@"POSTAL"])
              {
                uint64_t v30 = 51;
              }
              else if ([v29 isEqualToString:@"INTERSECTION"])
              {
                uint64_t v30 = 54;
              }
              else if ([v29 isEqualToString:@"BUILDING"])
              {
                uint64_t v30 = 55;
              }
              else if ([v29 isEqualToString:@"ADDRESS"])
              {
                uint64_t v30 = 57;
              }
              else if ([v29 isEqualToString:@"CONTINENT"])
              {
                uint64_t v30 = 61;
              }
              else if ([v29 isEqualToString:@"REGION"])
              {
                uint64_t v30 = 63;
              }
              else if ([v29 isEqualToString:@"DIVISION"])
              {
                uint64_t v30 = 64;
              }
              else if ([v29 isEqualToString:@"PHYSICAL_FEATURE"])
              {
                uint64_t v30 = 65;
              }
              else
              {
                uint64_t v30 = 0;
              }
            }
            else
            {
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) == 0) {
                continue;
              }
              uint64_t v30 = [v28 intValue];
            }
            [v6 addPlaceTypeFilter:v30];
          }
          uint64_t v25 = [v23 countByEnumeratingWithState:&v57 objects:v66 count:16];
          if (!v25)
          {
LABEL_109:

            id v5 = v52;
            a3 = v51;
            v22 = v49;
            break;
          }
        }
      }

      if (a3) {
        v31 = @"isStrictMapRegion";
      }
      else {
        v31 = @"is_strict_map_region";
      }
      v32 = [v5 objectForKeyedSubscript:v31];
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        objc_msgSend(v6, "setIsStrictMapRegion:", objc_msgSend(v32, "BOOLValue"));
      }

      if (a3) {
        v33 = @"resultTypeFilter";
      }
      else {
        v33 = @"result_type_filter";
      }
      v34 = [v5 objectForKeyedSubscript:v33];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        long long v55 = 0u;
        long long v56 = 0u;
        long long v53 = 0u;
        long long v54 = 0u;
        v50 = v34;
        id v35 = v34;
        uint64_t v36 = [v35 countByEnumeratingWithState:&v53 objects:v65 count:16];
        if (!v36) {
          goto LABEL_142;
        }
        uint64_t v37 = v36;
        uint64_t v38 = *(void *)v54;
        while (1)
        {
          for (uint64_t k = 0; k != v37; ++k)
          {
            if (*(void *)v54 != v38) {
              objc_enumerationMutation(v35);
            }
            v40 = *(void **)(*((void *)&v53 + 1) + 8 * k);
            objc_opt_class();
            if (objc_opt_isKindOfClass())
            {
              id v41 = v40;
              if ([v41 isEqualToString:@"AUTOCOMPLETE_RESULT_TYPE_FILTER_UNKNOWN"])
              {
                uint64_t v42 = 0;
              }
              else if ([v41 isEqualToString:@"AUTOCOMPLETE_RESULT_TYPE_FILTER_POI"])
              {
                uint64_t v42 = 1;
              }
              else if ([v41 isEqualToString:@"AUTOCOMPLETE_RESULT_TYPE_FILTER_PHYSICAL_FEATURE"])
              {
                uint64_t v42 = 2;
              }
              else if ([v41 isEqualToString:@"AUTOCOMPLETE_RESULT_TYPE_FILTER_ADDRESS"])
              {
                uint64_t v42 = 3;
              }
              else if ([v41 isEqualToString:@"AUTOCOMPLETE_RESULT_TYPE_FILTER_QUERY"])
              {
                uint64_t v42 = 4;
              }
              else
              {
                uint64_t v42 = 0;
              }
            }
            else
            {
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) == 0) {
                continue;
              }
              uint64_t v42 = [v40 intValue];
            }
            [v6 addResultTypeFilter:v42];
          }
          uint64_t v37 = [v35 countByEnumeratingWithState:&v53 objects:v65 count:16];
          if (!v37)
          {
LABEL_142:

            id v5 = v52;
            a3 = v51;
            v34 = v50;
            break;
          }
        }
      }

      if (a3) {
        v43 = @"addressResultSubTypeFilter";
      }
      else {
        v43 = @"address_result_sub_type_filter";
      }
      v44 = [v5 objectForKeyedSubscript:v43];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        v45 = [GEOPDAddressResultSubTypeFilter alloc];
        if (v45) {
          v46 = (void *)-[GEOPDAddressResultSubTypeFilter _initWithDictionary:isJSON:](v45, v44, a3);
        }
        else {
          v46 = 0;
        }
        [v6 setAddressResultSubTypeFilter:v46];
      }
    }
  }
  else
  {
    objc_super v6 = 0;
  }

  return v6;
}

- (GEOPDAutocompleteFilter)initWithJSON:(id)a3
{
  return (GEOPDAutocompleteFilter *)-[GEOPDAutocompleteFilter _initWithDictionary:isJSON:](self, a3, 1);
}

- (void)readAll:(BOOL)a3
{
  BOOL v3 = a3;
  p_readerLocuint64_t k = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  reader = self->_reader;
  if (reader)
  {
    unint64_t v7 = reader;
    objc_sync_enter(v7);
    if (v3) {
      uint64_t v8 = (int *)&readAll__recursiveTag_449_0;
    }
    else {
      uint64_t v8 = (int *)&readAll__nonRecursiveTag_450_0;
    }
    GEOPDAutocompleteFilterReadSpecified((uint64_t)self, (unint64_t)self->_reader, v8);
    objc_sync_exit(v7);
  }
  if (v3)
  {
    -[GEOPDPoiIconCategoryFilter readAll:]((uint64_t)self->_poiIconCategoryFilter, 1);
    -[GEOPDAddressResultSubTypeFilter readAll:]((uint64_t)self->_addressResultSubTypeFilter, 1);
  }

  os_unfair_lock_unlock(p_readerLock);
}

+ (BOOL)isValid:(id)a3
{
  return GEOPDAutocompleteFilterIsValid((char *)a3);
}

- (BOOL)readFrom:(id)a3
{
  return GEOPDAutocompleteFilterReadAllFrom((uint64_t)self, a3, 0);
}

- (void)writeTo:(id)a3
{
  id v11 = a3;
  p_readerLocuint64_t k = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  if (self->_reader && !_GEOPDAutocompleteFilterIsDirty((uint64_t)self))
  {
    id v9 = self->_reader;
    objc_sync_enter(v9);
    *(void *)((char *)self->_reader + (int)*MEMORY[0x1E4F940E0]) = self->_readerMarkLength;
    [(PBDataReader *)self->_reader seekToOffset:self->_readerMarkPos];
    uint64_t v10 = [(PBDataReader *)self->_reader readBytes:self->_readerMarkLength - self->_readerMarkPos];
    [v11 writeData:v10];
    os_unfair_lock_unlock(p_readerLock);

    objc_sync_exit(v9);
  }
  else
  {
    os_unfair_lock_unlock(&self->_readerLock);
    [(GEOPDAutocompleteFilter *)self readAll:0];
    id v5 = v11;
    if (self->_requestedEntryTypes.count)
    {
      unint64_t v6 = 0;
      do
      {
        PBDataWriterWriteInt32Field();
        id v5 = v11;
        ++v6;
      }
      while (v6 < self->_requestedEntryTypes.count);
    }
    if (self->_poiIconCategoryFilter)
    {
      PBDataWriterWriteSubmessage();
      id v5 = v11;
    }
    if (self->_placeTypeFilters.count)
    {
      unint64_t v7 = 0;
      do
      {
        PBDataWriterWriteInt32Field();
        id v5 = v11;
        ++v7;
      }
      while (v7 < self->_placeTypeFilters.count);
    }
    if (*(unsigned char *)&self->_flags)
    {
      PBDataWriterWriteBOOLField();
      id v5 = v11;
    }
    if (self->_resultTypeFilters.count)
    {
      unint64_t v8 = 0;
      do
      {
        PBDataWriterWriteInt32Field();
        id v5 = v11;
        ++v8;
      }
      while (v8 < self->_resultTypeFilters.count);
    }
    if (self->_addressResultSubTypeFilter)
    {
      PBDataWriterWriteSubmessage();
      id v5 = v11;
    }
    [(PBUnknownFields *)self->_unknownFields writeTo:v5];
  }
}

- (void)copyTo:(id)a3
{
  v13 = (id *)a3;
  [(GEOPDAutocompleteFilter *)self readAll:0];
  os_unfair_lock_lock_with_options();
  objc_storeStrong(v13 + 1, self->_reader);
  *((_DWORD *)v13 + 28) = self->_readerMarkPos;
  *((_DWORD *)v13 + 29) = self->_readerMarkLength;
  os_unfair_lock_unlock(&self->_readerLock);
  if ([(GEOPDAutocompleteFilter *)self requestedEntryTypesCount])
  {
    [v13 clearRequestedEntryTypes];
    unint64_t v4 = [(GEOPDAutocompleteFilter *)self requestedEntryTypesCount];
    if (v4)
    {
      unint64_t v5 = v4;
      for (uint64_t i = 0; i != v5; ++i)
        objc_msgSend(v13, "addRequestedEntryType:", -[GEOPDAutocompleteFilter requestedEntryTypeAtIndex:](self, "requestedEntryTypeAtIndex:", i));
    }
  }
  if (self->_poiIconCategoryFilter) {
    objc_msgSend(v13, "setPoiIconCategoryFilter:");
  }
  if ([(GEOPDAutocompleteFilter *)self placeTypeFiltersCount])
  {
    [v13 clearPlaceTypeFilters];
    unint64_t v7 = [(GEOPDAutocompleteFilter *)self placeTypeFiltersCount];
    if (v7)
    {
      unint64_t v8 = v7;
      for (uint64_t j = 0; j != v8; ++j)
        objc_msgSend(v13, "addPlaceTypeFilter:", -[GEOPDAutocompleteFilter placeTypeFilterAtIndex:](self, "placeTypeFilterAtIndex:", j));
    }
  }
  if (*(unsigned char *)&self->_flags)
  {
    *((unsigned char *)v13 + 124) = self->_isStrictMapRegion;
    *((unsigned char *)v13 + 128) |= 1u;
  }
  if ([(GEOPDAutocompleteFilter *)self resultTypeFiltersCount])
  {
    [v13 clearResultTypeFilters];
    unint64_t v10 = [(GEOPDAutocompleteFilter *)self resultTypeFiltersCount];
    if (v10)
    {
      unint64_t v11 = v10;
      for (uint64_t k = 0; k != v11; ++k)
        objc_msgSend(v13, "addResultTypeFilter:", -[GEOPDAutocompleteFilter resultTypeFilterAtIndex:](self, "resultTypeFilterAtIndex:", k));
    }
  }
  if (self->_addressResultSubTypeFilter) {
    objc_msgSend(v13, "setAddressResultSubTypeFilter:");
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  os_unfair_lock_lock(&self->_readerLock);
  reader = self->_reader;
  if (reader)
  {
    unint64_t v7 = reader;
    objc_sync_enter(v7);
    if ((*(unsigned char *)&self->_flags & 0x80000000) == 0)
    {
      *(void *)((char *)self->_reader + (int)*MEMORY[0x1E4F940E0]) = self->_readerMarkLength;
      [(PBDataReader *)self->_reader seekToOffset:self->_readerMarkPos];
      GEOPDAutocompleteFilterReadAllFrom(v5, self->_reader, 0);
      os_unfair_lock_unlock(&self->_readerLock);
      id v8 = (id)v5;
      objc_sync_exit(v7);

      goto LABEL_8;
    }
    objc_sync_exit(v7);
  }
  os_unfair_lock_unlock(&self->_readerLock);
  [(GEOPDAutocompleteFilter *)self readAll:0];
  PBRepeatedInt32Copy();
  id v9 = [(GEOPDPoiIconCategoryFilter *)self->_poiIconCategoryFilter copyWithZone:a3];
  unint64_t v10 = *(void **)(v5 + 104);
  *(void *)(v5 + 104) = v9;

  PBRepeatedInt32Copy();
  if (*(unsigned char *)&self->_flags)
  {
    *(unsigned char *)(v5 + 124) = self->_isStrictMapRegion;
    *(unsigned char *)(v5 + 128) |= 1u;
  }
  PBRepeatedInt32Copy();
  id v11 = [(GEOPDAddressResultSubTypeFilter *)self->_addressResultSubTypeFilter copyWithZone:a3];
  uint64_t v12 = *(void **)(v5 + 96);
  *(void *)(v5 + 96) = v11;

  v13 = self->_unknownFields;
  id v8 = *(id *)(v5 + 16);
  *(void *)(v5 + 16) = v13;
LABEL_8:

  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_17;
  }
  [(GEOPDAutocompleteFilter *)self readAll:1];
  [v4 readAll:1];
  if (!PBRepeatedInt32IsEqual()) {
    goto LABEL_17;
  }
  poiIconCategoryFilter = self->_poiIconCategoryFilter;
  if ((unint64_t)poiIconCategoryFilter | *((void *)v4 + 13))
  {
    if (!-[GEOPDPoiIconCategoryFilter isEqual:](poiIconCategoryFilter, "isEqual:")) {
      goto LABEL_17;
    }
  }
  if (!PBRepeatedInt32IsEqual()) {
    goto LABEL_17;
  }
  if (*(unsigned char *)&self->_flags)
  {
    if (*((unsigned char *)v4 + 128))
    {
      if (self->_isStrictMapRegion)
      {
        if (!*((unsigned char *)v4 + 124)) {
          goto LABEL_17;
        }
        goto LABEL_14;
      }
      if (!*((unsigned char *)v4 + 124)) {
        goto LABEL_14;
      }
    }
LABEL_17:
    char v7 = 0;
    goto LABEL_18;
  }
  if (*((unsigned char *)v4 + 128)) {
    goto LABEL_17;
  }
LABEL_14:
  if (!PBRepeatedInt32IsEqual()) {
    goto LABEL_17;
  }
  addressResultSubTypeFilter = self->_addressResultSubTypeFilter;
  if ((unint64_t)addressResultSubTypeFilter | *((void *)v4 + 12)) {
    char v7 = -[GEOPDAddressResultSubTypeFilter isEqual:](addressResultSubTypeFilter, "isEqual:");
  }
  else {
    char v7 = 1;
  }
LABEL_18:

  return v7;
}

- (unint64_t)hash
{
  [(GEOPDAutocompleteFilter *)self readAll:1];
  uint64_t v3 = PBRepeatedInt32Hash();
  unint64_t v4 = [(GEOPDPoiIconCategoryFilter *)self->_poiIconCategoryFilter hash];
  uint64_t v5 = PBRepeatedInt32Hash();
  if (*(unsigned char *)&self->_flags) {
    uint64_t v6 = 2654435761 * self->_isStrictMapRegion;
  }
  else {
    uint64_t v6 = 0;
  }
  unint64_t v7 = v4 ^ v3;
  uint64_t v8 = v5 ^ v6 ^ PBRepeatedInt32Hash();
  return v7 ^ v8 ^ [(GEOPDAddressResultSubTypeFilter *)self->_addressResultSubTypeFilter hash];
}

- (void)mergeFrom:(id)a3
{
  uint64_t v18 = (BOOL *)a3;
  [v18 readAll:0];
  uint64_t v4 = [v18 requestedEntryTypesCount];
  if (v4)
  {
    uint64_t v5 = v4;
    for (uint64_t i = 0; i != v5; ++i)
      -[GEOPDAutocompleteFilter addRequestedEntryType:](self, "addRequestedEntryType:", [v18 requestedEntryTypeAtIndex:i]);
  }
  poiIconCategoryFilter = self->_poiIconCategoryFilter;
  uint64_t v8 = v18;
  id v9 = (void *)*((void *)v18 + 13);
  if (poiIconCategoryFilter)
  {
    if (!v9) {
      goto LABEL_10;
    }
    -[GEOPDPoiIconCategoryFilter mergeFrom:]((uint64_t)poiIconCategoryFilter, v9);
  }
  else
  {
    if (!v9) {
      goto LABEL_10;
    }
    [(GEOPDAutocompleteFilter *)self setPoiIconCategoryFilter:*((void *)v18 + 13)];
  }
  uint64_t v8 = v18;
LABEL_10:
  uint64_t v10 = [v8 placeTypeFiltersCount];
  if (v10)
  {
    uint64_t v11 = v10;
    for (uint64_t j = 0; j != v11; ++j)
      -[GEOPDAutocompleteFilter addPlaceTypeFilter:](self, "addPlaceTypeFilter:", [v18 placeTypeFilterAtIndex:j]);
  }
  if (v18[128])
  {
    self->_isStrictMapRegion = v18[124];
    *(unsigned char *)&self->_flags |= 1u;
  }
  uint64_t v13 = [v18 resultTypeFiltersCount];
  if (v13)
  {
    uint64_t v14 = v13;
    for (uint64_t k = 0; k != v14; ++k)
      -[GEOPDAutocompleteFilter addResultTypeFilter:](self, "addResultTypeFilter:", [v18 resultTypeFilterAtIndex:k]);
  }
  addressResultSubTypeFilter = self->_addressResultSubTypeFilter;
  unint64_t v17 = (void *)*((void *)v18 + 12);
  if (addressResultSubTypeFilter)
  {
    if (v17) {
      -[GEOPDAddressResultSubTypeFilter mergeFrom:]((uint64_t)addressResultSubTypeFilter, v17);
    }
  }
  else if (v17)
  {
    [(GEOPDAutocompleteFilter *)self setAddressResultSubTypeFilter:*((void *)v18 + 12)];
  }

  MEMORY[0x1F4181820]();
}

- (PBUnknownFields)unknownFields
{
  p_readerLocuint64_t k = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  if ((*(unsigned char *)&self->_flags & 2) == 0)
  {
    reader = self->_reader;
    if (reader)
    {
      uint64_t v5 = reader;
      objc_sync_enter(v5);
      GEOPDAutocompleteFilterReadSpecified((uint64_t)self, (unint64_t)self->_reader, (int *)&unknownFields_tags_454_0);
      objc_sync_exit(v5);
    }
  }
  os_unfair_lock_unlock(p_readerLock);
  unknownFields = self->_unknownFields;

  return unknownFields;
}

- (void)clearUnknownFields:(BOOL)a3
{
  BOOL v3 = a3;
  p_readerLocuint64_t k = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(unsigned char *)&self->_flags |= 0x82u;
  os_unfair_lock_unlock(p_readerLock);
  unknownFields = self->_unknownFields;
  self->_unknownFields = 0;

  if (v3)
  {
    [(GEOPDAutocompleteFilter *)self readAll:0];
    -[GEOPDPoiIconCategoryFilter clearUnknownFields:]((uint64_t)self->_poiIconCategoryFilter, 1);
    addressResultSubTypeFilter = self->_addressResultSubTypeFilter;
    -[GEOPDAddressResultSubTypeFilter clearUnknownFields:]((uint64_t)addressResultSubTypeFilter, 1);
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_poiIconCategoryFilter, 0);
  objc_storeStrong((id *)&self->_addressResultSubTypeFilter, 0);
  objc_storeStrong((id *)&self->_unknownFields, 0);

  objc_storeStrong((id *)&self->_reader, 0);
}

@end