@interface GEOPDAutocompleteParameters
+ (BOOL)isValid:(id)a3;
- (BOOL)hasAddressOnly;
- (BOOL)hasAllEntries;
- (BOOL)hasAllEntriesWithBrowse;
- (BOOL)hasAutocompleteFilter;
- (BOOL)hasAutocompleteSessionData;
- (BOOL)hasBrandProfileSearch;
- (BOOL)hasCollectionOnly;
- (BOOL)hasFullEntries;
- (BOOL)hasGreenTeaWithValue:(BOOL)a3;
- (BOOL)hasLocalitiesAndLandmarks;
- (BOOL)hasOfflineRegionSearch;
- (BOOL)hasPoiAddressOnly;
- (BOOL)hasRequestType;
- (BOOL)hasShouldPopulateMapsIdentifier;
- (BOOL)hasSiriSearch;
- (BOOL)hasSupportAutocompleteSessionData;
- (BOOL)hasVenueSearch;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (BOOL)shouldPopulateMapsIdentifier;
- (BOOL)supportAutocompleteSessionData;
- (GEOPDAutocompleteFilter)autocompleteFilter;
- (GEOPDAutocompleteParameters)init;
- (GEOPDAutocompleteParameters)initWithData:(id)a3;
- (GEOPDAutocompleteParameters)initWithDictionary:(id)a3;
- (GEOPDAutocompleteParameters)initWithJSON:(id)a3;
- (GEOPDAutocompleteParametersAddressOnly)addressOnly;
- (GEOPDAutocompleteParametersAllEntries)allEntries;
- (GEOPDAutocompleteParametersAllEntriesWithBrowse)allEntriesWithBrowse;
- (GEOPDAutocompleteParametersBrandProfileSearch)brandProfileSearch;
- (GEOPDAutocompleteParametersCollectionOnly)collectionOnly;
- (GEOPDAutocompleteParametersFullEntriesOnly)fullEntries;
- (GEOPDAutocompleteParametersLocalitiesAndLandmarks)localitiesAndLandmarks;
- (GEOPDAutocompleteParametersOfflineRegionSearch)offlineRegionSearch;
- (GEOPDAutocompleteParametersPoiAddressOnly)poiAddressOnly;
- (GEOPDAutocompleteParametersSiriSearch)siriSearch;
- (GEOPDAutocompleteParametersVenueSearch)venueSearch;
- (GEOPDAutocompleteSessionData)autocompleteSessionData;
- (PBUnknownFields)unknownFields;
- (id)_dictionaryRepresentation:(uint64_t)a1;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)jsonRepresentation;
- (id)requestTypeAsString:(int)a3;
- (id)supportedClientResolvedTypeWithSetupPromptsAsString:(int)a3;
- (int)StringAsRequestType:(id)a3;
- (int)StringAsSupportedClientResolvedTypeWithSetupPrompts:(id)a3;
- (int)requestType;
- (int)supportedClientResolvedTypeWithSetupPromptAtIndex:(unint64_t)a3;
- (int)supportedClientResolvedTypeWithSetupPrompts;
- (unint64_t)hash;
- (unint64_t)supportedClientResolvedTypeWithSetupPromptsCount;
- (void)_initWithDictionary:(int)a3 isJSON:;
- (void)_readAddressOnly;
- (void)_readAllEntries;
- (void)_readAllEntriesWithBrowse;
- (void)_readAutocompleteFilter;
- (void)_readAutocompleteSessionData;
- (void)_readBrandProfileSearch;
- (void)_readCollectionOnly;
- (void)_readFullEntries;
- (void)_readLocalitiesAndLandmarks;
- (void)_readOfflineRegionSearch;
- (void)_readPoiAddressOnly;
- (void)_readSiriSearch;
- (void)_readSupportedClientResolvedTypeWithSetupPrompts;
- (void)_readVenueSearch;
- (void)addSupportedClientResolvedTypeWithSetupPrompt:(int)a3;
- (void)clearSensitiveFields:(unint64_t)a3;
- (void)clearSupportedClientResolvedTypeWithSetupPrompts;
- (void)clearUnknownFields:(BOOL)a3;
- (void)copyTo:(id)a3;
- (void)dealloc;
- (void)mergeFrom:(id)a3;
- (void)readAll:(BOOL)a3;
- (void)setAddressOnly:(id)a3;
- (void)setAllEntries:(id)a3;
- (void)setAllEntriesWithBrowse:(id)a3;
- (void)setAutocompleteFilter:(id)a3;
- (void)setAutocompleteSessionData:(id)a3;
- (void)setBrandProfileSearch:(id)a3;
- (void)setCollectionOnly:(id)a3;
- (void)setFullEntries:(id)a3;
- (void)setHasRequestType:(BOOL)a3;
- (void)setHasShouldPopulateMapsIdentifier:(BOOL)a3;
- (void)setHasSupportAutocompleteSessionData:(BOOL)a3;
- (void)setLocalitiesAndLandmarks:(id)a3;
- (void)setOfflineRegionSearch:(id)a3;
- (void)setPoiAddressOnly:(id)a3;
- (void)setRequestType:(int)a3;
- (void)setShouldPopulateMapsIdentifier:(BOOL)a3;
- (void)setSiriSearch:(id)a3;
- (void)setSupportAutocompleteSessionData:(BOOL)a3;
- (void)setSupportedClientResolvedTypeWithSetupPrompts:(int *)a3 count:(unint64_t)a4;
- (void)setVenueSearch:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation GEOPDAutocompleteParameters

- (GEOPDAutocompleteParameters)init
{
  v6.receiver = self;
  v6.super_class = (Class)GEOPDAutocompleteParameters;
  v2 = [(GEOPDAutocompleteParameters *)&v6 init];
  v3 = v2;
  if (v2)
  {
    v2->_readerLock._os_unfair_lock_opaque = 0;
    v4 = v2;
  }

  return v3;
}

- (GEOPDAutocompleteParameters)initWithData:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)GEOPDAutocompleteParameters;
  v3 = [(GEOPDAutocompleteParameters *)&v7 initWithData:a3];
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
  v3.receiver = self;
  v3.super_class = (Class)GEOPDAutocompleteParameters;
  [(GEOPDAutocompleteParameters *)&v3 dealloc];
}

- (int)requestType
{
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  $5C80C8B0C09BC17277FBA3E6A168903A flags = self->_flags;
  os_unfair_lock_unlock(p_readerLock);
  if (*(unsigned char *)&flags) {
    return self->_requestType;
  }
  else {
    return 0;
  }
}

- (void)setRequestType:(int)a3
{
  *(_DWORD *)&self->_flags |= 0x40001u;
  self->_requestType = a3;
}

- (void)setHasRequestType:(BOOL)a3
{
  self->_$5C80C8B0C09BC17277FBA3E6A168903A flags = ($5C80C8B0C09BC17277FBA3E6A168903A)(*(_DWORD *)&self->_flags & 0xFFFFFFFE | a3 | 0x40000);
}

- (BOOL)hasRequestType
{
  return *(_DWORD *)&self->_flags & 1;
}

- (id)requestTypeAsString:(int)a3
{
  if (a3 >= 0xB)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
    objc_super v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_super v3 = off_1E53DC678[a3];
  }

  return v3;
}

- (int)StringAsRequestType:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"AUTOCOMPLETE_PARAMETERS_FULL_ENTRIES_ONLY"])
  {
    int v4 = 0;
  }
  else if ([v3 isEqualToString:@"AUTOCOMPLETE_PARAMETERS_ALL_ENTRIES"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"AUTOCOMPLETE_PARAMETERS_LOCALITIES_AND_LANDMARKS"])
  {
    int v4 = 2;
  }
  else if ([v3 isEqualToString:@"AUTOCOMPLETE_PARAMETERS_ALL_ENTRIES_WITH_BROWSE"])
  {
    int v4 = 3;
  }
  else if ([v3 isEqualToString:@"AUTOCOMPLETE_PARAMETERS_SIRI_SEARCH"])
  {
    int v4 = 4;
  }
  else if ([v3 isEqualToString:@"AUTOCOMPLETE_PARAMETERS_ADDRESS_ONLY"])
  {
    int v4 = 5;
  }
  else if ([v3 isEqualToString:@"AUTOCOMPLETE_PARAMETERS_VENUE_SEARCH"])
  {
    int v4 = 6;
  }
  else if ([v3 isEqualToString:@"AUTOCOMPLETE_PARAMETERS_BRAND_PROFILE_SEARCH"])
  {
    int v4 = 7;
  }
  else if ([v3 isEqualToString:@"AUTOCOMPLETE_PARAMETERS_OFFLINE_REGION_SEARCH"])
  {
    int v4 = 8;
  }
  else if ([v3 isEqualToString:@"AUTOCOMPLETE_PARAMETERS_POI_ADDRESS_ONLY"])
  {
    int v4 = 9;
  }
  else if ([v3 isEqualToString:@"AUTOCOMPLETE_PARAMETERS_COLLECTIONS_ONLY"])
  {
    int v4 = 10;
  }
  else
  {
    int v4 = 0;
  }

  return v4;
}

- (void)_readFullEntries
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 160));
    if ((*(unsigned char *)(a1 + 173) & 0x10) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOPDAutocompleteParametersReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readFullEntries_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 160));
  }
}

- (BOOL)hasFullEntries
{
  return self->_fullEntries != 0;
}

- (GEOPDAutocompleteParametersFullEntriesOnly)fullEntries
{
  -[GEOPDAutocompleteParameters _readFullEntries]((uint64_t)self);
  fullEntries = self->_fullEntries;

  return fullEntries;
}

- (void)setFullEntries:(id)a3
{
  *(_DWORD *)&self->_flags |= 0x41000u;
  objc_storeStrong((id *)&self->_fullEntries, a3);
}

- (void)_readAllEntries
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 160));
    if ((*(unsigned char *)(a1 + 172) & 0x80) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOPDAutocompleteParametersReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readAllEntries_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 160));
  }
}

- (BOOL)hasAllEntries
{
  return self->_allEntries != 0;
}

- (GEOPDAutocompleteParametersAllEntries)allEntries
{
  -[GEOPDAutocompleteParameters _readAllEntries]((uint64_t)self);
  allEntries = self->_allEntries;

  return allEntries;
}

- (void)setAllEntries:(id)a3
{
  *(_DWORD *)&self->_flags |= 0x40080u;
  objc_storeStrong((id *)&self->_allEntries, a3);
}

- (void)_readLocalitiesAndLandmarks
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 160));
    if ((*(unsigned char *)(a1 + 173) & 0x20) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOPDAutocompleteParametersReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readLocalitiesAndLandmarks_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 160));
  }
}

- (BOOL)hasLocalitiesAndLandmarks
{
  return self->_localitiesAndLandmarks != 0;
}

- (GEOPDAutocompleteParametersLocalitiesAndLandmarks)localitiesAndLandmarks
{
  -[GEOPDAutocompleteParameters _readLocalitiesAndLandmarks]((uint64_t)self);
  localitiesAndLandmarks = self->_localitiesAndLandmarks;

  return localitiesAndLandmarks;
}

- (void)setLocalitiesAndLandmarks:(id)a3
{
  *(_DWORD *)&self->_flags |= 0x42000u;
  objc_storeStrong((id *)&self->_localitiesAndLandmarks, a3);
}

- (void)_readAllEntriesWithBrowse
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 160));
    if ((*(unsigned char *)(a1 + 172) & 0x40) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOPDAutocompleteParametersReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readAllEntriesWithBrowse_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 160));
  }
}

- (BOOL)hasAllEntriesWithBrowse
{
  return self->_allEntriesWithBrowse != 0;
}

- (GEOPDAutocompleteParametersAllEntriesWithBrowse)allEntriesWithBrowse
{
  -[GEOPDAutocompleteParameters _readAllEntriesWithBrowse]((uint64_t)self);
  allEntriesWithBrowse = self->_allEntriesWithBrowse;

  return allEntriesWithBrowse;
}

- (void)setAllEntriesWithBrowse:(id)a3
{
  *(_DWORD *)&self->_flags |= 0x40040u;
  objc_storeStrong((id *)&self->_allEntriesWithBrowse, a3);
}

- (void)_readSiriSearch
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 160));
    if ((*(unsigned char *)(a1 + 174) & 1) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOPDAutocompleteParametersReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readSiriSearch_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 160));
  }
}

- (BOOL)hasSiriSearch
{
  return self->_siriSearch != 0;
}

- (GEOPDAutocompleteParametersSiriSearch)siriSearch
{
  -[GEOPDAutocompleteParameters _readSiriSearch]((uint64_t)self);
  siriSearch = self->_siriSearch;

  return siriSearch;
}

- (void)setSiriSearch:(id)a3
{
  *(_DWORD *)&self->_flags |= 0x50000u;
  objc_storeStrong((id *)&self->_siriSearch, a3);
}

- (void)_readAddressOnly
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 160));
    if ((*(unsigned char *)(a1 + 172) & 0x20) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOPDAutocompleteParametersReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readAddressOnly_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 160));
  }
}

- (BOOL)hasAddressOnly
{
  return self->_addressOnly != 0;
}

- (GEOPDAutocompleteParametersAddressOnly)addressOnly
{
  -[GEOPDAutocompleteParameters _readAddressOnly]((uint64_t)self);
  addressOnly = self->_addressOnly;

  return addressOnly;
}

- (void)setAddressOnly:(id)a3
{
  *(_DWORD *)&self->_flags |= 0x40020u;
  objc_storeStrong((id *)&self->_addressOnly, a3);
}

- (void)_readVenueSearch
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 160));
    if ((*(unsigned char *)(a1 + 174) & 2) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOPDAutocompleteParametersReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readVenueSearch_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 160));
  }
}

- (BOOL)hasVenueSearch
{
  return self->_venueSearch != 0;
}

- (GEOPDAutocompleteParametersVenueSearch)venueSearch
{
  -[GEOPDAutocompleteParameters _readVenueSearch]((uint64_t)self);
  venueSearch = self->_venueSearch;

  return venueSearch;
}

- (void)setVenueSearch:(id)a3
{
  *(_DWORD *)&self->_flags |= 0x60000u;
  objc_storeStrong((id *)&self->_venueSearch, a3);
}

- (void)_readBrandProfileSearch
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 160));
    if ((*(unsigned char *)(a1 + 173) & 4) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOPDAutocompleteParametersReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readBrandProfileSearch_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 160));
  }
}

- (BOOL)hasBrandProfileSearch
{
  return self->_brandProfileSearch != 0;
}

- (GEOPDAutocompleteParametersBrandProfileSearch)brandProfileSearch
{
  -[GEOPDAutocompleteParameters _readBrandProfileSearch]((uint64_t)self);
  brandProfileSearch = self->_brandProfileSearch;

  return brandProfileSearch;
}

- (void)setBrandProfileSearch:(id)a3
{
  *(_DWORD *)&self->_flags |= 0x40400u;
  objc_storeStrong((id *)&self->_brandProfileSearch, a3);
}

- (void)_readOfflineRegionSearch
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 160));
    if ((*(unsigned char *)(a1 + 173) & 0x40) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOPDAutocompleteParametersReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readOfflineRegionSearch_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 160));
  }
}

- (BOOL)hasOfflineRegionSearch
{
  return self->_offlineRegionSearch != 0;
}

- (GEOPDAutocompleteParametersOfflineRegionSearch)offlineRegionSearch
{
  -[GEOPDAutocompleteParameters _readOfflineRegionSearch]((uint64_t)self);
  offlineRegionSearch = self->_offlineRegionSearch;

  return offlineRegionSearch;
}

- (void)setOfflineRegionSearch:(id)a3
{
  *(_DWORD *)&self->_flags |= 0x44000u;
  objc_storeStrong((id *)&self->_offlineRegionSearch, a3);
}

- (void)_readPoiAddressOnly
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 160));
    if ((*(unsigned char *)(a1 + 173) & 0x80) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOPDAutocompleteParametersReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readPoiAddressOnly_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 160));
  }
}

- (BOOL)hasPoiAddressOnly
{
  return self->_poiAddressOnly != 0;
}

- (GEOPDAutocompleteParametersPoiAddressOnly)poiAddressOnly
{
  -[GEOPDAutocompleteParameters _readPoiAddressOnly]((uint64_t)self);
  poiAddressOnly = self->_poiAddressOnly;

  return poiAddressOnly;
}

- (void)setPoiAddressOnly:(id)a3
{
  *(_DWORD *)&self->_flags |= 0x48000u;
  objc_storeStrong((id *)&self->_poiAddressOnly, a3);
}

- (void)_readAutocompleteFilter
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 160));
    if ((*(unsigned char *)(a1 + 173) & 1) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOPDAutocompleteParametersReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readAutocompleteFilter_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 160));
  }
}

- (BOOL)hasAutocompleteFilter
{
  return self->_autocompleteFilter != 0;
}

- (GEOPDAutocompleteFilter)autocompleteFilter
{
  -[GEOPDAutocompleteParameters _readAutocompleteFilter]((uint64_t)self);
  autocompleteFilter = self->_autocompleteFilter;

  return autocompleteFilter;
}

- (void)setAutocompleteFilter:(id)a3
{
  *(_DWORD *)&self->_flags |= 0x40100u;
  objc_storeStrong((id *)&self->_autocompleteFilter, a3);
}

- (BOOL)shouldPopulateMapsIdentifier
{
  return self->_shouldPopulateMapsIdentifier;
}

- (void)setShouldPopulateMapsIdentifier:(BOOL)a3
{
  *(_DWORD *)&self->_flags |= 0x40002u;
  self->_shouldPopulateMapsIdentifier = a3;
}

- (void)setHasShouldPopulateMapsIdentifier:(BOOL)a3
{
  if (a3) {
    int v3 = 262146;
  }
  else {
    int v3 = 0x40000;
  }
  self->_$5C80C8B0C09BC17277FBA3E6A168903A flags = ($5C80C8B0C09BC17277FBA3E6A168903A)(*(_DWORD *)&self->_flags & 0xFFFFFFFD | v3);
}

- (BOOL)hasShouldPopulateMapsIdentifier
{
  return (*(unsigned char *)&self->_flags >> 1) & 1;
}

- (BOOL)supportAutocompleteSessionData
{
  return self->_supportAutocompleteSessionData;
}

- (void)setSupportAutocompleteSessionData:(BOOL)a3
{
  *(_DWORD *)&self->_flags |= 0x40004u;
  self->_supportAutocompleteSessionData = a3;
}

- (void)setHasSupportAutocompleteSessionData:(BOOL)a3
{
  if (a3) {
    int v3 = 262148;
  }
  else {
    int v3 = 0x40000;
  }
  self->_$5C80C8B0C09BC17277FBA3E6A168903A flags = ($5C80C8B0C09BC17277FBA3E6A168903A)(*(_DWORD *)&self->_flags & 0xFFFBFFFB | v3);
}

- (BOOL)hasSupportAutocompleteSessionData
{
  return (*(unsigned char *)&self->_flags >> 2) & 1;
}

- (void)_readAutocompleteSessionData
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 160));
    if ((*(unsigned char *)(a1 + 173) & 2) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOPDAutocompleteParametersReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readAutocompleteSessionData_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 160));
  }
}

- (BOOL)hasAutocompleteSessionData
{
  return self->_autocompleteSessionData != 0;
}

- (GEOPDAutocompleteSessionData)autocompleteSessionData
{
  -[GEOPDAutocompleteParameters _readAutocompleteSessionData]((uint64_t)self);
  autocompleteSessionData = self->_autocompleteSessionData;

  return autocompleteSessionData;
}

- (void)setAutocompleteSessionData:(id)a3
{
  *(_DWORD *)&self->_flags |= 0x40200u;
  objc_storeStrong((id *)&self->_autocompleteSessionData, a3);
}

- (void)_readCollectionOnly
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 160));
    if ((*(unsigned char *)(a1 + 173) & 8) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOPDAutocompleteParametersReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readCollectionOnly_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 160));
  }
}

- (BOOL)hasCollectionOnly
{
  return self->_collectionOnly != 0;
}

- (GEOPDAutocompleteParametersCollectionOnly)collectionOnly
{
  -[GEOPDAutocompleteParameters _readCollectionOnly]((uint64_t)self);
  collectionOnly = self->_collectionOnly;

  return collectionOnly;
}

- (void)setCollectionOnly:(id)a3
{
  *(_DWORD *)&self->_flags |= 0x40800u;
  objc_storeStrong((id *)&self->_collectionOnly, a3);
}

- (void)_readSupportedClientResolvedTypeWithSetupPrompts
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 160));
    if ((*(unsigned char *)(a1 + 172) & 0x10) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOPDAutocompleteParametersReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readSupportedClientResolvedTypeWithSetupPrompts_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 160));
  }
}

- (unint64_t)supportedClientResolvedTypeWithSetupPromptsCount
{
  return self->_supportedClientResolvedTypeWithSetupPrompts.count;
}

- (int)supportedClientResolvedTypeWithSetupPrompts
{
  return self->_supportedClientResolvedTypeWithSetupPrompts.list;
}

- (void)clearSupportedClientResolvedTypeWithSetupPrompts
{
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(_DWORD *)&self->_flags |= 0x10u;
  os_unfair_lock_unlock(p_readerLock);
  *(_DWORD *)&self->_flags |= 0x40000u;

  PBRepeatedInt32Clear();
}

- (void)addSupportedClientResolvedTypeWithSetupPrompt:(int)a3
{
  if (self) {
    PBRepeatedInt32Add();
  }
  os_unfair_lock_lock_with_options();
  *(_DWORD *)&self->_flags |= 0x10u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(_DWORD *)&self->_flags |= 0x40000u;
}

- (int)supportedClientResolvedTypeWithSetupPromptAtIndex:(unint64_t)a3
{
  -[GEOPDAutocompleteParameters _readSupportedClientResolvedTypeWithSetupPrompts]((uint64_t)self);
  p_supportedClientResolvedTypeWithSetupPrompts = &self->_supportedClientResolvedTypeWithSetupPrompts;
  unint64_t count = self->_supportedClientResolvedTypeWithSetupPrompts.count;
  if (count <= a3)
  {
    objc_super v7 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v8 = *MEMORY[0x1E4F1C4A8];
    v9 = objc_msgSend(NSString, "stringWithFormat:", @"idx (%tu) is out of range (%tu)", a3, count);
    v10 = [v7 exceptionWithName:v8 reason:v9 userInfo:0];
    [v10 raise];
  }
  return p_supportedClientResolvedTypeWithSetupPrompts->list[a3];
}

- (void)setSupportedClientResolvedTypeWithSetupPrompts:(int *)a3 count:(unint64_t)a4
{
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(_DWORD *)&self->_flags |= 0x10u;
  os_unfair_lock_unlock(p_readerLock);
  *(_DWORD *)&self->_flags |= 0x40000u;

  MEMORY[0x1F4147390](&self->_supportedClientResolvedTypeWithSetupPrompts, a3, a4);
}

- (id)supportedClientResolvedTypeWithSetupPromptsAsString:(int)a3
{
  if (a3 >= 7)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
    id v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v3 = off_1E53DC710[a3];
  }

  return v3;
}

- (int)StringAsSupportedClientResolvedTypeWithSetupPrompts:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"RESOLVED_ITEM_TYPE_UNKNOWN"])
  {
    int v4 = 0;
  }
  else if ([v3 isEqualToString:@"RESOLVED_ITEM_TYPE_HOME"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"RESOLVED_ITEM_TYPE_WORK"])
  {
    int v4 = 2;
  }
  else if ([v3 isEqualToString:@"RESOLVED_ITEM_TYPE_PARKED_CAR"])
  {
    int v4 = 3;
  }
  else if ([v3 isEqualToString:@"RESOLVED_ITEM_TYPE_CURRENT_LOCATION"])
  {
    int v4 = 4;
  }
  else if ([v3 isEqualToString:@"RESOLVED_ITEM_TYPE_SERVER"])
  {
    int v4 = 5;
  }
  else if ([v3 isEqualToString:@"RESOLVED_ITEM_TYPE_SCHOOL"])
  {
    int v4 = 6;
  }
  else
  {
    int v4 = 0;
  }

  return v4;
}

- (id)description
{
  id v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)GEOPDAutocompleteParameters;
  int v4 = [(GEOPDAutocompleteParameters *)&v8 description];
  v5 = [(GEOPDAutocompleteParameters *)self dictionaryRepresentation];
  objc_super v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEOPDAutocompleteParameters _dictionaryRepresentation:]((uint64_t)self, 0);
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  if (a1)
  {
    [(id)a1 readAll:1];
    int v4 = [MEMORY[0x1E4F1CA60] dictionary];
    if (*(unsigned char *)(a1 + 172))
    {
      uint64_t v5 = *(int *)(a1 + 164);
      if (v5 >= 0xB)
      {
        objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(int *)(a1 + 164));
        objc_super v6 = (__CFString *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        objc_super v6 = off_1E53DC678[v5];
      }
      if (a2) {
        objc_super v7 = @"requestType";
      }
      else {
        objc_super v7 = @"request_type";
      }
      [v4 setObject:v6 forKey:v7];
    }
    objc_super v8 = [(id)a1 fullEntries];
    v9 = v8;
    if (v8)
    {
      if (a2)
      {
        v10 = [v8 jsonRepresentation];
        v11 = @"fullEntries";
      }
      else
      {
        v10 = [v8 dictionaryRepresentation];
        v11 = @"full_entries";
      }
      [v4 setObject:v10 forKey:v11];
    }
    v12 = [(id)a1 allEntries];
    v13 = v12;
    if (v12)
    {
      if (a2)
      {
        v14 = [v12 jsonRepresentation];
        v15 = @"allEntries";
      }
      else
      {
        v14 = [v12 dictionaryRepresentation];
        v15 = @"all_entries";
      }
      [v4 setObject:v14 forKey:v15];
    }
    v16 = [(id)a1 localitiesAndLandmarks];
    v17 = v16;
    if (v16)
    {
      if (a2)
      {
        v18 = [v16 jsonRepresentation];
        v19 = @"localitiesAndLandmarks";
      }
      else
      {
        v18 = [v16 dictionaryRepresentation];
        v19 = @"localities_and_landmarks";
      }
      [v4 setObject:v18 forKey:v19];
    }
    v20 = [(id)a1 allEntriesWithBrowse];
    v21 = v20;
    if (v20)
    {
      if (a2)
      {
        v22 = [v20 jsonRepresentation];
        v23 = @"allEntriesWithBrowse";
      }
      else
      {
        v22 = [v20 dictionaryRepresentation];
        v23 = @"all_entries_with_browse";
      }
      [v4 setObject:v22 forKey:v23];
    }
    v24 = [(id)a1 siriSearch];
    v25 = v24;
    if (v24)
    {
      if (a2)
      {
        v26 = [v24 jsonRepresentation];
        v27 = @"siriSearch";
      }
      else
      {
        v26 = [v24 dictionaryRepresentation];
        v27 = @"siri_search";
      }
      [v4 setObject:v26 forKey:v27];
    }
    v28 = [(id)a1 addressOnly];
    v29 = v28;
    if (v28)
    {
      if (a2)
      {
        v30 = [v28 jsonRepresentation];
        v31 = @"addressOnly";
      }
      else
      {
        v30 = [v28 dictionaryRepresentation];
        v31 = @"address_only";
      }
      [v4 setObject:v30 forKey:v31];
    }
    v32 = [(id)a1 venueSearch];
    v33 = v32;
    if (v32)
    {
      if (a2)
      {
        v34 = [v32 jsonRepresentation];
        v35 = @"venueSearch";
      }
      else
      {
        v34 = [v32 dictionaryRepresentation];
        v35 = @"venue_search";
      }
      [v4 setObject:v34 forKey:v35];
    }
    v36 = [(id)a1 brandProfileSearch];
    v37 = v36;
    if (v36)
    {
      if (a2)
      {
        v38 = [v36 jsonRepresentation];
        v39 = @"brandProfileSearch";
      }
      else
      {
        v38 = [v36 dictionaryRepresentation];
        v39 = @"brand_profile_search";
      }
      [v4 setObject:v38 forKey:v39];
    }
    v40 = [(id)a1 offlineRegionSearch];
    v41 = v40;
    if (v40)
    {
      if (a2)
      {
        v42 = [v40 jsonRepresentation];
        v43 = @"offlineRegionSearch";
      }
      else
      {
        v42 = [v40 dictionaryRepresentation];
        v43 = @"offline_region_search";
      }
      [v4 setObject:v42 forKey:v43];
    }
    v44 = [(id)a1 poiAddressOnly];
    v45 = v44;
    if (v44)
    {
      if (a2)
      {
        v46 = [v44 jsonRepresentation];
        v47 = @"poiAddressOnly";
      }
      else
      {
        v46 = [v44 dictionaryRepresentation];
        v47 = @"poi_address_only";
      }
      [v4 setObject:v46 forKey:v47];
    }
    v48 = [(id)a1 autocompleteFilter];
    v49 = v48;
    if (v48)
    {
      if (a2)
      {
        v50 = [v48 jsonRepresentation];
        v51 = @"autocompleteFilter";
      }
      else
      {
        v50 = [v48 dictionaryRepresentation];
        v51 = @"autocomplete_filter";
      }
      [v4 setObject:v50 forKey:v51];
    }
    int v52 = *(_DWORD *)(a1 + 172);
    if ((v52 & 2) != 0)
    {
      v53 = [NSNumber numberWithBool:*(unsigned __int8 *)(a1 + 168)];
      if (a2) {
        v54 = @"shouldPopulateMapsIdentifier";
      }
      else {
        v54 = @"should_populate_maps_identifier";
      }
      [v4 setObject:v53 forKey:v54];

      int v52 = *(_DWORD *)(a1 + 172);
    }
    if ((v52 & 4) != 0)
    {
      v55 = [NSNumber numberWithBool:*(unsigned __int8 *)(a1 + 169)];
      if (a2) {
        v56 = @"supportAutocompleteSessionData";
      }
      else {
        v56 = @"support_autocomplete_session_data";
      }
      [v4 setObject:v55 forKey:v56];
    }
    v57 = [(id)a1 autocompleteSessionData];
    v58 = v57;
    if (v57)
    {
      if (a2)
      {
        v59 = [v57 jsonRepresentation];
        v60 = @"autocompleteSessionData";
      }
      else
      {
        v59 = [v57 dictionaryRepresentation];
        v60 = @"autocomplete_session_data";
      }
      [v4 setObject:v59 forKey:v60];
    }
    v61 = [(id)a1 collectionOnly];
    v62 = v61;
    if (v61)
    {
      if (a2)
      {
        v63 = [v61 jsonRepresentation];
        v64 = @"collectionOnly";
      }
      else
      {
        v63 = [v61 dictionaryRepresentation];
        v64 = @"collection_only";
      }
      [v4 setObject:v63 forKey:v64];
    }
    if (*(void *)(a1 + 32))
    {
      v65 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:");
      v66 = (void *)(a1 + 24);
      if (*(void *)(a1 + 32))
      {
        unint64_t v67 = 0;
        do
        {
          uint64_t v68 = *(int *)(*v66 + 4 * v67);
          if (v68 >= 7)
          {
            objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", v68);
            v69 = (__CFString *)objc_claimAutoreleasedReturnValue();
          }
          else
          {
            v69 = off_1E53DC710[v68];
          }
          [v65 addObject:v69];

          ++v67;
          v66 = (void *)(a1 + 24);
        }
        while (v67 < *(void *)(a1 + 32));
      }
      if (a2) {
        v70 = @"supportedClientResolvedTypeWithSetupPrompt";
      }
      else {
        v70 = @"supported_client_resolved_type_with_setup_prompt";
      }
      [v4 setObject:v65 forKey:v70];
    }
    v71 = *(void **)(a1 + 16);
    if (v71)
    {
      v72 = [v71 dictionaryRepresentation];
      v73 = v72;
      if (a2)
      {
        v74 = objc_msgSend(MEMORY[0x1E4F1CA60], "dictionaryWithCapacity:", objc_msgSend(v72, "count"));
        v78[0] = MEMORY[0x1E4F143A8];
        v78[1] = 3221225472;
        v78[2] = __57__GEOPDAutocompleteParameters__dictionaryRepresentation___block_invoke;
        v78[3] = &unk_1E53D8860;
        id v75 = v74;
        id v79 = v75;
        [v73 enumerateKeysAndObjectsUsingBlock:v78];
        id v76 = v75;

        v73 = v76;
      }
      [v4 setObject:v73 forKey:@"Unknown Fields"];
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
  return -[GEOPDAutocompleteParameters _dictionaryRepresentation:]((uint64_t)self, 1);
}

void __57__GEOPDAutocompleteParameters__dictionaryRepresentation___block_invoke(uint64_t a1, void *a2, void *a3)
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

- (GEOPDAutocompleteParameters)initWithDictionary:(id)a3
{
  return (GEOPDAutocompleteParameters *)-[GEOPDAutocompleteParameters _initWithDictionary:isJSON:](self, a3, 0);
}

- (void)_initWithDictionary:(int)a3 isJSON:
{
  uint64_t v98 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  if (!a1)
  {
    objc_super v6 = 0;
    goto LABEL_181;
  }
  objc_super v6 = (void *)[a1 init];
  if (v6)
  {
    if (a3) {
      objc_super v7 = @"requestType";
    }
    else {
      objc_super v7 = @"request_type";
    }
    objc_super v8 = [v5 objectForKeyedSubscript:v7];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v9 = v8;
      if ([v9 isEqualToString:@"AUTOCOMPLETE_PARAMETERS_FULL_ENTRIES_ONLY"])
      {
        uint64_t v10 = 0;
      }
      else if ([v9 isEqualToString:@"AUTOCOMPLETE_PARAMETERS_ALL_ENTRIES"])
      {
        uint64_t v10 = 1;
      }
      else if ([v9 isEqualToString:@"AUTOCOMPLETE_PARAMETERS_LOCALITIES_AND_LANDMARKS"])
      {
        uint64_t v10 = 2;
      }
      else if ([v9 isEqualToString:@"AUTOCOMPLETE_PARAMETERS_ALL_ENTRIES_WITH_BROWSE"])
      {
        uint64_t v10 = 3;
      }
      else if ([v9 isEqualToString:@"AUTOCOMPLETE_PARAMETERS_SIRI_SEARCH"])
      {
        uint64_t v10 = 4;
      }
      else if ([v9 isEqualToString:@"AUTOCOMPLETE_PARAMETERS_ADDRESS_ONLY"])
      {
        uint64_t v10 = 5;
      }
      else if ([v9 isEqualToString:@"AUTOCOMPLETE_PARAMETERS_VENUE_SEARCH"])
      {
        uint64_t v10 = 6;
      }
      else if ([v9 isEqualToString:@"AUTOCOMPLETE_PARAMETERS_BRAND_PROFILE_SEARCH"])
      {
        uint64_t v10 = 7;
      }
      else if ([v9 isEqualToString:@"AUTOCOMPLETE_PARAMETERS_OFFLINE_REGION_SEARCH"])
      {
        uint64_t v10 = 8;
      }
      else if ([v9 isEqualToString:@"AUTOCOMPLETE_PARAMETERS_POI_ADDRESS_ONLY"])
      {
        uint64_t v10 = 9;
      }
      else if ([v9 isEqualToString:@"AUTOCOMPLETE_PARAMETERS_COLLECTIONS_ONLY"])
      {
        uint64_t v10 = 10;
      }
      else
      {
        uint64_t v10 = 0;
      }
    }
    else
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
LABEL_34:

        if (a3) {
          v11 = @"fullEntries";
        }
        else {
          v11 = @"full_entries";
        }
        v12 = [v5 objectForKeyedSubscript:v11];
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          v13 = [GEOPDAutocompleteParametersFullEntriesOnly alloc];
          if (a3) {
            uint64_t v14 = [(GEOPDAutocompleteParametersFullEntriesOnly *)v13 initWithJSON:v12];
          }
          else {
            uint64_t v14 = [(GEOPDAutocompleteParametersFullEntriesOnly *)v13 initWithDictionary:v12];
          }
          v15 = (void *)v14;
          [v6 setFullEntries:v14];
        }
        if (a3) {
          v16 = @"allEntries";
        }
        else {
          v16 = @"all_entries";
        }
        v17 = [v5 objectForKeyedSubscript:v16];
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          v18 = [GEOPDAutocompleteParametersAllEntries alloc];
          if (a3) {
            uint64_t v19 = [(GEOPDAutocompleteParametersAllEntries *)v18 initWithJSON:v17];
          }
          else {
            uint64_t v19 = [(GEOPDAutocompleteParametersAllEntries *)v18 initWithDictionary:v17];
          }
          v20 = (void *)v19;
          [v6 setAllEntries:v19];
        }
        if (a3) {
          v21 = @"localitiesAndLandmarks";
        }
        else {
          v21 = @"localities_and_landmarks";
        }
        v22 = [v5 objectForKeyedSubscript:v21];
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          v23 = [GEOPDAutocompleteParametersLocalitiesAndLandmarks alloc];
          if (a3) {
            uint64_t v24 = [(GEOPDAutocompleteParametersLocalitiesAndLandmarks *)v23 initWithJSON:v22];
          }
          else {
            uint64_t v24 = [(GEOPDAutocompleteParametersLocalitiesAndLandmarks *)v23 initWithDictionary:v22];
          }
          v25 = (void *)v24;
          [v6 setLocalitiesAndLandmarks:v24];
        }
        if (a3) {
          v26 = @"allEntriesWithBrowse";
        }
        else {
          v26 = @"all_entries_with_browse";
        }
        v27 = [v5 objectForKeyedSubscript:v26];
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          v28 = [GEOPDAutocompleteParametersAllEntriesWithBrowse alloc];
          if (a3) {
            uint64_t v29 = [(GEOPDAutocompleteParametersAllEntriesWithBrowse *)v28 initWithJSON:v27];
          }
          else {
            uint64_t v29 = [(GEOPDAutocompleteParametersAllEntriesWithBrowse *)v28 initWithDictionary:v27];
          }
          v30 = (void *)v29;
          [v6 setAllEntriesWithBrowse:v29];
        }
        if (a3) {
          v31 = @"siriSearch";
        }
        else {
          v31 = @"siri_search";
        }
        v32 = [v5 objectForKeyedSubscript:v31];
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          v33 = [GEOPDAutocompleteParametersSiriSearch alloc];
          if (a3) {
            uint64_t v34 = [(GEOPDAutocompleteParametersSiriSearch *)v33 initWithJSON:v32];
          }
          else {
            uint64_t v34 = [(GEOPDAutocompleteParametersSiriSearch *)v33 initWithDictionary:v32];
          }
          v35 = (void *)v34;
          [v6 setSiriSearch:v34];
        }
        if (a3) {
          v36 = @"addressOnly";
        }
        else {
          v36 = @"address_only";
        }
        v37 = [v5 objectForKeyedSubscript:v36];
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          v38 = [GEOPDAutocompleteParametersAddressOnly alloc];
          if (a3) {
            uint64_t v39 = [(GEOPDAutocompleteParametersAddressOnly *)v38 initWithJSON:v37];
          }
          else {
            uint64_t v39 = [(GEOPDAutocompleteParametersAddressOnly *)v38 initWithDictionary:v37];
          }
          v40 = (void *)v39;
          [v6 setAddressOnly:v39];
        }
        if (a3) {
          v41 = @"venueSearch";
        }
        else {
          v41 = @"venue_search";
        }
        v42 = [v5 objectForKeyedSubscript:v41];
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          v43 = [GEOPDAutocompleteParametersVenueSearch alloc];
          if (a3) {
            uint64_t v44 = [(GEOPDAutocompleteParametersVenueSearch *)v43 initWithJSON:v42];
          }
          else {
            uint64_t v44 = [(GEOPDAutocompleteParametersVenueSearch *)v43 initWithDictionary:v42];
          }
          v45 = (void *)v44;
          [v6 setVenueSearch:v44];
        }
        if (a3) {
          v46 = @"brandProfileSearch";
        }
        else {
          v46 = @"brand_profile_search";
        }
        v47 = [v5 objectForKeyedSubscript:v46];
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          v48 = [GEOPDAutocompleteParametersBrandProfileSearch alloc];
          if (a3) {
            uint64_t v49 = [(GEOPDAutocompleteParametersBrandProfileSearch *)v48 initWithJSON:v47];
          }
          else {
            uint64_t v49 = [(GEOPDAutocompleteParametersBrandProfileSearch *)v48 initWithDictionary:v47];
          }
          v50 = (void *)v49;
          [v6 setBrandProfileSearch:v49];
        }
        if (a3) {
          v51 = @"offlineRegionSearch";
        }
        else {
          v51 = @"offline_region_search";
        }
        int v52 = [v5 objectForKeyedSubscript:v51];
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          v53 = [GEOPDAutocompleteParametersOfflineRegionSearch alloc];
          if (a3) {
            uint64_t v54 = [(GEOPDAutocompleteParametersOfflineRegionSearch *)v53 initWithJSON:v52];
          }
          else {
            uint64_t v54 = [(GEOPDAutocompleteParametersOfflineRegionSearch *)v53 initWithDictionary:v52];
          }
          v55 = (void *)v54;
          [v6 setOfflineRegionSearch:v54];
        }
        if (a3) {
          v56 = @"poiAddressOnly";
        }
        else {
          v56 = @"poi_address_only";
        }
        v57 = [v5 objectForKeyedSubscript:v56];
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          v58 = [GEOPDAutocompleteParametersPoiAddressOnly alloc];
          if (a3) {
            uint64_t v59 = [(GEOPDAutocompleteParametersPoiAddressOnly *)v58 initWithJSON:v57];
          }
          else {
            uint64_t v59 = [(GEOPDAutocompleteParametersPoiAddressOnly *)v58 initWithDictionary:v57];
          }
          v60 = (void *)v59;
          [v6 setPoiAddressOnly:v59];
        }
        if (a3) {
          v61 = @"autocompleteFilter";
        }
        else {
          v61 = @"autocomplete_filter";
        }
        v62 = [v5 objectForKeyedSubscript:v61];
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          v63 = [GEOPDAutocompleteFilter alloc];
          if (a3) {
            uint64_t v64 = [(GEOPDAutocompleteFilter *)v63 initWithJSON:v62];
          }
          else {
            uint64_t v64 = [(GEOPDAutocompleteFilter *)v63 initWithDictionary:v62];
          }
          v65 = (void *)v64;
          [v6 setAutocompleteFilter:v64];
        }
        if (a3) {
          v66 = @"shouldPopulateMapsIdentifier";
        }
        else {
          v66 = @"should_populate_maps_identifier";
        }
        unint64_t v67 = [v5 objectForKeyedSubscript:v66];
        objc_opt_class();
        if (objc_opt_isKindOfClass()) {
          objc_msgSend(v6, "setShouldPopulateMapsIdentifier:", objc_msgSend(v67, "BOOLValue"));
        }

        if (a3) {
          uint64_t v68 = @"supportAutocompleteSessionData";
        }
        else {
          uint64_t v68 = @"support_autocomplete_session_data";
        }
        v69 = [v5 objectForKeyedSubscript:v68];
        objc_opt_class();
        if (objc_opt_isKindOfClass()) {
          objc_msgSend(v6, "setSupportAutocompleteSessionData:", objc_msgSend(v69, "BOOLValue"));
        }

        if (a3) {
          v70 = @"autocompleteSessionData";
        }
        else {
          v70 = @"autocomplete_session_data";
        }
        v71 = [v5 objectForKeyedSubscript:v70];
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          v72 = [GEOPDAutocompleteSessionData alloc];
          if (a3) {
            uint64_t v73 = [(GEOPDAutocompleteSessionData *)v72 initWithJSON:v71];
          }
          else {
            uint64_t v73 = [(GEOPDAutocompleteSessionData *)v72 initWithDictionary:v71];
          }
          v74 = (void *)v73;
          [v6 setAutocompleteSessionData:v73];
        }
        if (a3) {
          id v75 = @"collectionOnly";
        }
        else {
          id v75 = @"collection_only";
        }
        id v76 = [v5 objectForKeyedSubscript:v75];
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          v77 = [GEOPDAutocompleteParametersCollectionOnly alloc];
          if (a3) {
            uint64_t v78 = [(GEOPDAutocompleteParametersCollectionOnly *)v77 initWithJSON:v76];
          }
          else {
            uint64_t v78 = [(GEOPDAutocompleteParametersCollectionOnly *)v77 initWithDictionary:v76];
          }
          id v79 = (void *)v78;
          [v6 setCollectionOnly:v78];
        }
        if (a3) {
          v80 = @"supportedClientResolvedTypeWithSetupPrompt";
        }
        else {
          v80 = @"supported_client_resolved_type_with_setup_prompt";
        }
        v81 = [v5 objectForKeyedSubscript:v80];
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          v91 = v81;
          id v92 = v5;
          long long v95 = 0u;
          long long v96 = 0u;
          long long v93 = 0u;
          long long v94 = 0u;
          id v82 = v81;
          uint64_t v83 = [v82 countByEnumeratingWithState:&v93 objects:v97 count:16];
          if (!v83) {
            goto LABEL_179;
          }
          uint64_t v84 = v83;
          uint64_t v85 = *(void *)v94;
          while (1)
          {
            for (uint64_t i = 0; i != v84; ++i)
            {
              if (*(void *)v94 != v85) {
                objc_enumerationMutation(v82);
              }
              v87 = *(void **)(*((void *)&v93 + 1) + 8 * i);
              objc_opt_class();
              if (objc_opt_isKindOfClass())
              {
                id v88 = v87;
                if ([v88 isEqualToString:@"RESOLVED_ITEM_TYPE_UNKNOWN"])
                {
                  uint64_t v89 = 0;
                }
                else if ([v88 isEqualToString:@"RESOLVED_ITEM_TYPE_HOME"])
                {
                  uint64_t v89 = 1;
                }
                else if ([v88 isEqualToString:@"RESOLVED_ITEM_TYPE_WORK"])
                {
                  uint64_t v89 = 2;
                }
                else if ([v88 isEqualToString:@"RESOLVED_ITEM_TYPE_PARKED_CAR"])
                {
                  uint64_t v89 = 3;
                }
                else if ([v88 isEqualToString:@"RESOLVED_ITEM_TYPE_CURRENT_LOCATION"])
                {
                  uint64_t v89 = 4;
                }
                else if ([v88 isEqualToString:@"RESOLVED_ITEM_TYPE_SERVER"])
                {
                  uint64_t v89 = 5;
                }
                else if ([v88 isEqualToString:@"RESOLVED_ITEM_TYPE_SCHOOL"])
                {
                  uint64_t v89 = 6;
                }
                else
                {
                  uint64_t v89 = 0;
                }
              }
              else
              {
                objc_opt_class();
                if ((objc_opt_isKindOfClass() & 1) == 0) {
                  continue;
                }
                uint64_t v89 = [v87 intValue];
              }
              objc_msgSend(v6, "addSupportedClientResolvedTypeWithSetupPrompt:", v89, v91, v92, (void)v93);
            }
            uint64_t v84 = [v82 countByEnumeratingWithState:&v93 objects:v97 count:16];
            if (!v84)
            {
LABEL_179:

              v81 = v91;
              id v5 = v92;
              break;
            }
          }
        }

        goto LABEL_181;
      }
      uint64_t v10 = [v8 intValue];
    }
    [v6 setRequestType:v10];
    goto LABEL_34;
  }
LABEL_181:

  return v6;
}

- (GEOPDAutocompleteParameters)initWithJSON:(id)a3
{
  return (GEOPDAutocompleteParameters *)-[GEOPDAutocompleteParameters _initWithDictionary:isJSON:](self, a3, 1);
}

- (void)readAll:(BOOL)a3
{
  BOOL v3 = a3;
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  reader = self->_reader;
  if (reader)
  {
    objc_super v7 = reader;
    objc_sync_enter(v7);
    if (v3) {
      objc_super v8 = (int *)&readAll__recursiveTag_760;
    }
    else {
      objc_super v8 = (int *)&readAll__nonRecursiveTag_761;
    }
    GEOPDAutocompleteParametersReadSpecified((uint64_t)self, (unint64_t)self->_reader, v8);
    objc_sync_exit(v7);
  }
  if (v3) {
    _GEOPDAutocompleteParametersCallReadAllRecursiveWithoutSynchronized((uint64_t)self);
  }

  os_unfair_lock_unlock(p_readerLock);
}

+ (BOOL)isValid:(id)a3
{
  return GEOPDAutocompleteParametersIsValid((char *)a3);
}

- (BOOL)readFrom:(id)a3
{
  return GEOPDAutocompleteParametersReadAllFrom((uint64_t)self, a3, 0);
}

- (void)writeTo:(id)a3
{
  id v10 = a3;
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  if (self->_reader && (_GEOPDAutocompleteParametersIsDirty((uint64_t)self) & 1) == 0)
  {
    objc_super v8 = self->_reader;
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
    [(GEOPDAutocompleteParameters *)self readAll:0];
    if (*(unsigned char *)&self->_flags) {
      PBDataWriterWriteInt32Field();
    }
    id v5 = v10;
    if (self->_fullEntries)
    {
      PBDataWriterWriteSubmessage();
      id v5 = v10;
    }
    if (self->_allEntries)
    {
      PBDataWriterWriteSubmessage();
      id v5 = v10;
    }
    if (self->_localitiesAndLandmarks)
    {
      PBDataWriterWriteSubmessage();
      id v5 = v10;
    }
    if (self->_allEntriesWithBrowse)
    {
      PBDataWriterWriteSubmessage();
      id v5 = v10;
    }
    if (self->_siriSearch)
    {
      PBDataWriterWriteSubmessage();
      id v5 = v10;
    }
    if (self->_addressOnly)
    {
      PBDataWriterWriteSubmessage();
      id v5 = v10;
    }
    if (self->_venueSearch)
    {
      PBDataWriterWriteSubmessage();
      id v5 = v10;
    }
    if (self->_brandProfileSearch)
    {
      PBDataWriterWriteSubmessage();
      id v5 = v10;
    }
    if (self->_offlineRegionSearch)
    {
      PBDataWriterWriteSubmessage();
      id v5 = v10;
    }
    if (self->_poiAddressOnly)
    {
      PBDataWriterWriteSubmessage();
      id v5 = v10;
    }
    if (self->_autocompleteFilter)
    {
      PBDataWriterWriteSubmessage();
      id v5 = v10;
    }
    $5C80C8B0C09BC17277FBA3E6A168903A flags = self->_flags;
    if ((*(unsigned char *)&flags & 2) != 0)
    {
      PBDataWriterWriteBOOLField();
      id v5 = v10;
      $5C80C8B0C09BC17277FBA3E6A168903A flags = self->_flags;
    }
    if ((*(unsigned char *)&flags & 4) != 0)
    {
      PBDataWriterWriteBOOLField();
      id v5 = v10;
    }
    if (self->_autocompleteSessionData)
    {
      PBDataWriterWriteSubmessage();
      id v5 = v10;
    }
    if (self->_collectionOnly)
    {
      PBDataWriterWriteSubmessage();
      id v5 = v10;
    }
    if (self->_supportedClientResolvedTypeWithSetupPrompts.count)
    {
      unint64_t v7 = 0;
      do
      {
        PBDataWriterWriteInt32Field();
        id v5 = v10;
        ++v7;
      }
      while (v7 < self->_supportedClientResolvedTypeWithSetupPrompts.count);
    }
    [(PBUnknownFields *)self->_unknownFields writeTo:v5];
  }
}

- (void)clearSensitiveFields:(unint64_t)a3
{
}

- (BOOL)hasGreenTeaWithValue:(BOOL)a3
{
  BOOL v3 = a3;
  -[GEOPDAutocompleteParameters _readAddressOnly]((uint64_t)self);
  if ([(GEOPDAutocompleteParametersAddressOnly *)self->_addressOnly hasGreenTeaWithValue:v3]) {
    return 1;
  }
  -[GEOPDAutocompleteParameters _readAllEntries]((uint64_t)self);
  if ([(GEOPDAutocompleteParametersAllEntries *)self->_allEntries hasGreenTeaWithValue:v3]) {
    return 1;
  }
  -[GEOPDAutocompleteParameters _readAllEntriesWithBrowse]((uint64_t)self);
  if ([(GEOPDAutocompleteParametersAllEntriesWithBrowse *)self->_allEntriesWithBrowse hasGreenTeaWithValue:v3])
  {
    return 1;
  }
  -[GEOPDAutocompleteParameters _readBrandProfileSearch]((uint64_t)self);
  if ([(GEOPDAutocompleteParametersBrandProfileSearch *)self->_brandProfileSearch hasGreenTeaWithValue:v3])
  {
    return 1;
  }
  -[GEOPDAutocompleteParameters _readCollectionOnly]((uint64_t)self);
  if ([(GEOPDAutocompleteParametersCollectionOnly *)self->_collectionOnly hasGreenTeaWithValue:v3])
  {
    return 1;
  }
  -[GEOPDAutocompleteParameters _readFullEntries]((uint64_t)self);
  if ([(GEOPDAutocompleteParametersFullEntriesOnly *)self->_fullEntries hasGreenTeaWithValue:v3])
  {
    return 1;
  }
  -[GEOPDAutocompleteParameters _readLocalitiesAndLandmarks]((uint64_t)self);
  if ([(GEOPDAutocompleteParametersLocalitiesAndLandmarks *)self->_localitiesAndLandmarks hasGreenTeaWithValue:v3])
  {
    return 1;
  }
  -[GEOPDAutocompleteParameters _readOfflineRegionSearch]((uint64_t)self);
  if ([(GEOPDAutocompleteParametersOfflineRegionSearch *)self->_offlineRegionSearch hasGreenTeaWithValue:v3])
  {
    return 1;
  }
  -[GEOPDAutocompleteParameters _readPoiAddressOnly]((uint64_t)self);
  if ([(GEOPDAutocompleteParametersPoiAddressOnly *)self->_poiAddressOnly hasGreenTeaWithValue:v3])
  {
    return 1;
  }
  -[GEOPDAutocompleteParameters _readSiriSearch]((uint64_t)self);
  if ([(GEOPDAutocompleteParametersSiriSearch *)self->_siriSearch hasGreenTeaWithValue:v3]) {
    return 1;
  }
  -[GEOPDAutocompleteParameters _readVenueSearch]((uint64_t)self);
  venueSearch = self->_venueSearch;

  return [(GEOPDAutocompleteParametersVenueSearch *)venueSearch hasGreenTeaWithValue:v3];
}

- (void)copyTo:(id)a3
{
  id v9 = (id *)a3;
  [(GEOPDAutocompleteParameters *)self readAll:0];
  os_unfair_lock_lock_with_options();
  objc_storeStrong(v9 + 1, self->_reader);
  *((_DWORD *)v9 + 38) = self->_readerMarkPos;
  *((_DWORD *)v9 + 39) = self->_readerMarkLength;
  os_unfair_lock_unlock(&self->_readerLock);
  int v4 = v9;
  if (*(unsigned char *)&self->_flags)
  {
    *((_DWORD *)v9 + 41) = self->_requestType;
    *((_DWORD *)v9 + 43) |= 1u;
  }
  if (self->_fullEntries)
  {
    objc_msgSend(v9, "setFullEntries:");
    int v4 = v9;
  }
  if (self->_allEntries)
  {
    objc_msgSend(v9, "setAllEntries:");
    int v4 = v9;
  }
  if (self->_localitiesAndLandmarks)
  {
    objc_msgSend(v9, "setLocalitiesAndLandmarks:");
    int v4 = v9;
  }
  if (self->_allEntriesWithBrowse)
  {
    objc_msgSend(v9, "setAllEntriesWithBrowse:");
    int v4 = v9;
  }
  if (self->_siriSearch)
  {
    objc_msgSend(v9, "setSiriSearch:");
    int v4 = v9;
  }
  if (self->_addressOnly)
  {
    objc_msgSend(v9, "setAddressOnly:");
    int v4 = v9;
  }
  if (self->_venueSearch)
  {
    objc_msgSend(v9, "setVenueSearch:");
    int v4 = v9;
  }
  if (self->_brandProfileSearch)
  {
    objc_msgSend(v9, "setBrandProfileSearch:");
    int v4 = v9;
  }
  if (self->_offlineRegionSearch)
  {
    objc_msgSend(v9, "setOfflineRegionSearch:");
    int v4 = v9;
  }
  if (self->_poiAddressOnly)
  {
    objc_msgSend(v9, "setPoiAddressOnly:");
    int v4 = v9;
  }
  if (self->_autocompleteFilter)
  {
    objc_msgSend(v9, "setAutocompleteFilter:");
    int v4 = v9;
  }
  $5C80C8B0C09BC17277FBA3E6A168903A flags = self->_flags;
  if ((*(unsigned char *)&flags & 2) != 0)
  {
    *((unsigned char *)v4 + 168) = self->_shouldPopulateMapsIdentifier;
    *((_DWORD *)v4 + 43) |= 2u;
    $5C80C8B0C09BC17277FBA3E6A168903A flags = self->_flags;
  }
  if ((*(unsigned char *)&flags & 4) != 0)
  {
    *((unsigned char *)v4 + 169) = self->_supportAutocompleteSessionData;
    *((_DWORD *)v4 + 43) |= 4u;
  }
  if (self->_autocompleteSessionData) {
    objc_msgSend(v9, "setAutocompleteSessionData:");
  }
  if (self->_collectionOnly) {
    objc_msgSend(v9, "setCollectionOnly:");
  }
  if ([(GEOPDAutocompleteParameters *)self supportedClientResolvedTypeWithSetupPromptsCount])
  {
    [v9 clearSupportedClientResolvedTypeWithSetupPrompts];
    unint64_t v6 = [(GEOPDAutocompleteParameters *)self supportedClientResolvedTypeWithSetupPromptsCount];
    if (v6)
    {
      unint64_t v7 = v6;
      for (uint64_t i = 0; i != v7; ++i)
        objc_msgSend(v9, "addSupportedClientResolvedTypeWithSetupPrompt:", -[GEOPDAutocompleteParameters supportedClientResolvedTypeWithSetupPromptAtIndex:](self, "supportedClientResolvedTypeWithSetupPromptAtIndex:", i));
    }
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
    if ((*((unsigned char *)&self->_flags + 2) & 4) == 0)
    {
      *(void *)((char *)self->_reader + (int)*MEMORY[0x1E4F940E0]) = self->_readerMarkLength;
      [(PBDataReader *)self->_reader seekToOffset:self->_readerMarkPos];
      GEOPDAutocompleteParametersReadAllFrom(v5, self->_reader, 0);
      os_unfair_lock_unlock(&self->_readerLock);
      id v8 = (id)v5;
      objc_sync_exit(v7);

      goto LABEL_12;
    }
    objc_sync_exit(v7);
  }
  os_unfair_lock_unlock(&self->_readerLock);
  [(GEOPDAutocompleteParameters *)self readAll:0];
  if (*(unsigned char *)&self->_flags)
  {
    *(_DWORD *)(v5 + 164) = self->_requestType;
    *(_DWORD *)(v5 + 172) |= 1u;
  }
  id v9 = [(GEOPDAutocompleteParametersFullEntriesOnly *)self->_fullEntries copyWithZone:a3];
  id v10 = *(void **)(v5 + 104);
  *(void *)(v5 + 104) = v9;

  id v11 = [(GEOPDAutocompleteParametersAllEntries *)self->_allEntries copyWithZone:a3];
  v12 = *(void **)(v5 + 64);
  *(void *)(v5 + 64) = v11;

  id v13 = [(GEOPDAutocompleteParametersLocalitiesAndLandmarks *)self->_localitiesAndLandmarks copyWithZone:a3];
  uint64_t v14 = *(void **)(v5 + 112);
  *(void *)(v5 + 112) = v13;

  id v15 = [(GEOPDAutocompleteParametersAllEntriesWithBrowse *)self->_allEntriesWithBrowse copyWithZone:a3];
  v16 = *(void **)(v5 + 56);
  *(void *)(v5 + 56) = v15;

  id v17 = [(GEOPDAutocompleteParametersSiriSearch *)self->_siriSearch copyWithZone:a3];
  v18 = *(void **)(v5 + 136);
  *(void *)(v5 + 136) = v17;

  id v19 = [(GEOPDAutocompleteParametersAddressOnly *)self->_addressOnly copyWithZone:a3];
  v20 = *(void **)(v5 + 48);
  *(void *)(v5 + 48) = v19;

  id v21 = [(GEOPDAutocompleteParametersVenueSearch *)self->_venueSearch copyWithZone:a3];
  v22 = *(void **)(v5 + 144);
  *(void *)(v5 + 144) = v21;

  id v23 = [(GEOPDAutocompleteParametersBrandProfileSearch *)self->_brandProfileSearch copyWithZone:a3];
  uint64_t v24 = *(void **)(v5 + 88);
  *(void *)(v5 + 88) = v23;

  id v25 = [(GEOPDAutocompleteParametersOfflineRegionSearch *)self->_offlineRegionSearch copyWithZone:a3];
  v26 = *(void **)(v5 + 120);
  *(void *)(v5 + 120) = v25;

  id v27 = [(GEOPDAutocompleteParametersPoiAddressOnly *)self->_poiAddressOnly copyWithZone:a3];
  v28 = *(void **)(v5 + 128);
  *(void *)(v5 + 128) = v27;

  id v29 = [(GEOPDAutocompleteFilter *)self->_autocompleteFilter copyWithZone:a3];
  v30 = *(void **)(v5 + 72);
  *(void *)(v5 + 72) = v29;

  $5C80C8B0C09BC17277FBA3E6A168903A flags = self->_flags;
  if ((*(unsigned char *)&flags & 2) != 0)
  {
    *(unsigned char *)(v5 + 168) = self->_shouldPopulateMapsIdentifier;
    *(_DWORD *)(v5 + 172) |= 2u;
    $5C80C8B0C09BC17277FBA3E6A168903A flags = self->_flags;
  }
  if ((*(unsigned char *)&flags & 4) != 0)
  {
    *(unsigned char *)(v5 + 169) = self->_supportAutocompleteSessionData;
    *(_DWORD *)(v5 + 172) |= 4u;
  }
  id v32 = [(GEOPDAutocompleteSessionData *)self->_autocompleteSessionData copyWithZone:a3];
  v33 = *(void **)(v5 + 80);
  *(void *)(v5 + 80) = v32;

  id v34 = [(GEOPDAutocompleteParametersCollectionOnly *)self->_collectionOnly copyWithZone:a3];
  v35 = *(void **)(v5 + 96);
  *(void *)(v5 + 96) = v34;

  PBRepeatedInt32Copy();
  v36 = self->_unknownFields;
  id v8 = *(id *)(v5 + 16);
  *(void *)(v5 + 16) = v36;
LABEL_12:

  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_50;
  }
  [(GEOPDAutocompleteParameters *)self readAll:1];
  [v4 readAll:1];
  int v5 = *((_DWORD *)v4 + 43);
  if (*(unsigned char *)&self->_flags)
  {
    if ((v5 & 1) == 0 || self->_requestType != *((_DWORD *)v4 + 41)) {
      goto LABEL_50;
    }
  }
  else if (v5)
  {
    goto LABEL_50;
  }
  fullEntries = self->_fullEntries;
  if ((unint64_t)fullEntries | *((void *)v4 + 13)
    && !-[GEOPDAutocompleteParametersFullEntriesOnly isEqual:](fullEntries, "isEqual:"))
  {
    goto LABEL_50;
  }
  allEntries = self->_allEntries;
  if ((unint64_t)allEntries | *((void *)v4 + 8))
  {
    if (!-[GEOPDAutocompleteParametersAllEntries isEqual:](allEntries, "isEqual:")) {
      goto LABEL_50;
    }
  }
  localitiesAndLandmarks = self->_localitiesAndLandmarks;
  if ((unint64_t)localitiesAndLandmarks | *((void *)v4 + 14))
  {
    if (!-[GEOPDAutocompleteParametersLocalitiesAndLandmarks isEqual:](localitiesAndLandmarks, "isEqual:")) {
      goto LABEL_50;
    }
  }
  allEntriesWithBrowse = self->_allEntriesWithBrowse;
  if ((unint64_t)allEntriesWithBrowse | *((void *)v4 + 7))
  {
    if (!-[GEOPDAutocompleteParametersAllEntriesWithBrowse isEqual:](allEntriesWithBrowse, "isEqual:")) {
      goto LABEL_50;
    }
  }
  siriSearch = self->_siriSearch;
  if ((unint64_t)siriSearch | *((void *)v4 + 17))
  {
    if (!-[GEOPDAutocompleteParametersSiriSearch isEqual:](siriSearch, "isEqual:")) {
      goto LABEL_50;
    }
  }
  addressOnly = self->_addressOnly;
  if ((unint64_t)addressOnly | *((void *)v4 + 6))
  {
    if (!-[GEOPDAutocompleteParametersAddressOnly isEqual:](addressOnly, "isEqual:")) {
      goto LABEL_50;
    }
  }
  venueSearch = self->_venueSearch;
  if ((unint64_t)venueSearch | *((void *)v4 + 18))
  {
    if (!-[GEOPDAutocompleteParametersVenueSearch isEqual:](venueSearch, "isEqual:")) {
      goto LABEL_50;
    }
  }
  brandProfileSearch = self->_brandProfileSearch;
  if ((unint64_t)brandProfileSearch | *((void *)v4 + 11))
  {
    if (!-[GEOPDAutocompleteParametersBrandProfileSearch isEqual:](brandProfileSearch, "isEqual:")) {
      goto LABEL_50;
    }
  }
  offlineRegionSearch = self->_offlineRegionSearch;
  if ((unint64_t)offlineRegionSearch | *((void *)v4 + 15))
  {
    if (!-[GEOPDAutocompleteParametersOfflineRegionSearch isEqual:](offlineRegionSearch, "isEqual:")) {
      goto LABEL_50;
    }
  }
  poiAddressOnly = self->_poiAddressOnly;
  if ((unint64_t)poiAddressOnly | *((void *)v4 + 16))
  {
    if (!-[GEOPDAutocompleteParametersPoiAddressOnly isEqual:](poiAddressOnly, "isEqual:")) {
      goto LABEL_50;
    }
  }
  autocompleteFilter = self->_autocompleteFilter;
  if ((unint64_t)autocompleteFilter | *((void *)v4 + 9))
  {
    if (!-[GEOPDAutocompleteFilter isEqual:](autocompleteFilter, "isEqual:")) {
      goto LABEL_50;
    }
  }
  $5C80C8B0C09BC17277FBA3E6A168903A flags = self->_flags;
  int v18 = *((_DWORD *)v4 + 43);
  if ((*(unsigned char *)&flags & 2) != 0)
  {
    if ((v18 & 2) == 0) {
      goto LABEL_50;
    }
    if (self->_shouldPopulateMapsIdentifier)
    {
      if (!*((unsigned char *)v4 + 168)) {
        goto LABEL_50;
      }
    }
    else if (*((unsigned char *)v4 + 168))
    {
      goto LABEL_50;
    }
  }
  else if ((v18 & 2) != 0)
  {
    goto LABEL_50;
  }
  if ((*(unsigned char *)&flags & 4) != 0)
  {
    if ((v18 & 4) != 0)
    {
      if (self->_supportAutocompleteSessionData)
      {
        if (!*((unsigned char *)v4 + 169)) {
          goto LABEL_50;
        }
        goto LABEL_45;
      }
      if (!*((unsigned char *)v4 + 169)) {
        goto LABEL_45;
      }
    }
LABEL_50:
    char IsEqual = 0;
    goto LABEL_51;
  }
  if ((v18 & 4) != 0) {
    goto LABEL_50;
  }
LABEL_45:
  autocompleteSessionData = self->_autocompleteSessionData;
  if ((unint64_t)autocompleteSessionData | *((void *)v4 + 10)
    && !-[GEOPDAutocompleteSessionData isEqual:](autocompleteSessionData, "isEqual:"))
  {
    goto LABEL_50;
  }
  collectionOnly = self->_collectionOnly;
  if ((unint64_t)collectionOnly | *((void *)v4 + 12))
  {
    if (!-[GEOPDAutocompleteParametersCollectionOnly isEqual:](collectionOnly, "isEqual:")) {
      goto LABEL_50;
    }
  }
  char IsEqual = PBRepeatedInt32IsEqual();
LABEL_51:

  return IsEqual;
}

- (unint64_t)hash
{
  [(GEOPDAutocompleteParameters *)self readAll:1];
  if (*(unsigned char *)&self->_flags) {
    uint64_t v20 = 2654435761 * self->_requestType;
  }
  else {
    uint64_t v20 = 0;
  }
  unint64_t v19 = [(GEOPDAutocompleteParametersFullEntriesOnly *)self->_fullEntries hash];
  unint64_t v18 = [(GEOPDAutocompleteParametersAllEntries *)self->_allEntries hash];
  unint64_t v17 = [(GEOPDAutocompleteParametersLocalitiesAndLandmarks *)self->_localitiesAndLandmarks hash];
  unint64_t v3 = [(GEOPDAutocompleteParametersAllEntriesWithBrowse *)self->_allEntriesWithBrowse hash];
  unint64_t v4 = [(GEOPDAutocompleteParametersSiriSearch *)self->_siriSearch hash];
  unint64_t v5 = [(GEOPDAutocompleteParametersAddressOnly *)self->_addressOnly hash];
  unint64_t v6 = [(GEOPDAutocompleteParametersVenueSearch *)self->_venueSearch hash];
  unint64_t v7 = [(GEOPDAutocompleteParametersBrandProfileSearch *)self->_brandProfileSearch hash];
  unint64_t v8 = [(GEOPDAutocompleteParametersOfflineRegionSearch *)self->_offlineRegionSearch hash];
  unint64_t v9 = [(GEOPDAutocompleteParametersPoiAddressOnly *)self->_poiAddressOnly hash];
  unint64_t v10 = [(GEOPDAutocompleteFilter *)self->_autocompleteFilter hash];
  $5C80C8B0C09BC17277FBA3E6A168903A flags = self->_flags;
  if ((*(unsigned char *)&flags & 2) != 0)
  {
    uint64_t v12 = 2654435761 * self->_shouldPopulateMapsIdentifier;
    if ((*(unsigned char *)&flags & 4) != 0) {
      goto LABEL_6;
    }
LABEL_8:
    uint64_t v13 = 0;
    goto LABEL_9;
  }
  uint64_t v12 = 0;
  if ((*(unsigned char *)&flags & 4) == 0) {
    goto LABEL_8;
  }
LABEL_6:
  uint64_t v13 = 2654435761 * self->_supportAutocompleteSessionData;
LABEL_9:
  unint64_t v14 = v10 ^ v12 ^ v13 ^ [(GEOPDAutocompleteSessionData *)self->_autocompleteSessionData hash];
  unint64_t v15 = v19 ^ v20 ^ v18 ^ v17 ^ v3 ^ v4 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9 ^ v14 ^ [(GEOPDAutocompleteParametersCollectionOnly *)self->_collectionOnly hash];
  return v15 ^ PBRepeatedInt32Hash();
}

- (void)mergeFrom:(id)a3
{
  v35 = (int *)a3;
  [v35 readAll:0];
  unint64_t v4 = v35;
  if (v35[43])
  {
    self->_requestType = v35[41];
    *(_DWORD *)&self->_flags |= 1u;
  }
  fullEntries = self->_fullEntries;
  uint64_t v6 = *((void *)v35 + 13);
  if (fullEntries)
  {
    if (!v6) {
      goto LABEL_9;
    }
    -[GEOPDAutocompleteParametersFullEntriesOnly mergeFrom:](fullEntries, "mergeFrom:");
  }
  else
  {
    if (!v6) {
      goto LABEL_9;
    }
    -[GEOPDAutocompleteParameters setFullEntries:](self, "setFullEntries:");
  }
  unint64_t v4 = v35;
LABEL_9:
  allEntries = self->_allEntries;
  uint64_t v8 = *((void *)v4 + 8);
  if (allEntries)
  {
    if (!v8) {
      goto LABEL_15;
    }
    -[GEOPDAutocompleteParametersAllEntries mergeFrom:](allEntries, "mergeFrom:");
  }
  else
  {
    if (!v8) {
      goto LABEL_15;
    }
    -[GEOPDAutocompleteParameters setAllEntries:](self, "setAllEntries:");
  }
  unint64_t v4 = v35;
LABEL_15:
  localitiesAndLandmarks = self->_localitiesAndLandmarks;
  uint64_t v10 = *((void *)v4 + 14);
  if (localitiesAndLandmarks)
  {
    if (!v10) {
      goto LABEL_21;
    }
    -[GEOPDAutocompleteParametersLocalitiesAndLandmarks mergeFrom:](localitiesAndLandmarks, "mergeFrom:");
  }
  else
  {
    if (!v10) {
      goto LABEL_21;
    }
    -[GEOPDAutocompleteParameters setLocalitiesAndLandmarks:](self, "setLocalitiesAndLandmarks:");
  }
  unint64_t v4 = v35;
LABEL_21:
  allEntriesWithBrowse = self->_allEntriesWithBrowse;
  uint64_t v12 = *((void *)v4 + 7);
  if (allEntriesWithBrowse)
  {
    if (!v12) {
      goto LABEL_27;
    }
    -[GEOPDAutocompleteParametersAllEntriesWithBrowse mergeFrom:](allEntriesWithBrowse, "mergeFrom:");
  }
  else
  {
    if (!v12) {
      goto LABEL_27;
    }
    -[GEOPDAutocompleteParameters setAllEntriesWithBrowse:](self, "setAllEntriesWithBrowse:");
  }
  unint64_t v4 = v35;
LABEL_27:
  siriSearch = self->_siriSearch;
  uint64_t v14 = *((void *)v4 + 17);
  if (siriSearch)
  {
    if (!v14) {
      goto LABEL_33;
    }
    -[GEOPDAutocompleteParametersSiriSearch mergeFrom:](siriSearch, "mergeFrom:");
  }
  else
  {
    if (!v14) {
      goto LABEL_33;
    }
    -[GEOPDAutocompleteParameters setSiriSearch:](self, "setSiriSearch:");
  }
  unint64_t v4 = v35;
LABEL_33:
  addressOnly = self->_addressOnly;
  uint64_t v16 = *((void *)v4 + 6);
  if (addressOnly)
  {
    if (!v16) {
      goto LABEL_39;
    }
    -[GEOPDAutocompleteParametersAddressOnly mergeFrom:](addressOnly, "mergeFrom:");
  }
  else
  {
    if (!v16) {
      goto LABEL_39;
    }
    -[GEOPDAutocompleteParameters setAddressOnly:](self, "setAddressOnly:");
  }
  unint64_t v4 = v35;
LABEL_39:
  venueSearch = self->_venueSearch;
  uint64_t v18 = *((void *)v4 + 18);
  if (venueSearch)
  {
    if (!v18) {
      goto LABEL_45;
    }
    -[GEOPDAutocompleteParametersVenueSearch mergeFrom:](venueSearch, "mergeFrom:");
  }
  else
  {
    if (!v18) {
      goto LABEL_45;
    }
    -[GEOPDAutocompleteParameters setVenueSearch:](self, "setVenueSearch:");
  }
  unint64_t v4 = v35;
LABEL_45:
  brandProfileSearch = self->_brandProfileSearch;
  uint64_t v20 = *((void *)v4 + 11);
  if (brandProfileSearch)
  {
    if (!v20) {
      goto LABEL_51;
    }
    -[GEOPDAutocompleteParametersBrandProfileSearch mergeFrom:](brandProfileSearch, "mergeFrom:");
  }
  else
  {
    if (!v20) {
      goto LABEL_51;
    }
    -[GEOPDAutocompleteParameters setBrandProfileSearch:](self, "setBrandProfileSearch:");
  }
  unint64_t v4 = v35;
LABEL_51:
  offlineRegionSearch = self->_offlineRegionSearch;
  uint64_t v22 = *((void *)v4 + 15);
  if (offlineRegionSearch)
  {
    if (!v22) {
      goto LABEL_57;
    }
    -[GEOPDAutocompleteParametersOfflineRegionSearch mergeFrom:](offlineRegionSearch, "mergeFrom:");
  }
  else
  {
    if (!v22) {
      goto LABEL_57;
    }
    -[GEOPDAutocompleteParameters setOfflineRegionSearch:](self, "setOfflineRegionSearch:");
  }
  unint64_t v4 = v35;
LABEL_57:
  poiAddressOnly = self->_poiAddressOnly;
  uint64_t v24 = *((void *)v4 + 16);
  if (poiAddressOnly)
  {
    if (!v24) {
      goto LABEL_63;
    }
    -[GEOPDAutocompleteParametersPoiAddressOnly mergeFrom:](poiAddressOnly, "mergeFrom:");
  }
  else
  {
    if (!v24) {
      goto LABEL_63;
    }
    -[GEOPDAutocompleteParameters setPoiAddressOnly:](self, "setPoiAddressOnly:");
  }
  unint64_t v4 = v35;
LABEL_63:
  autocompleteFilter = self->_autocompleteFilter;
  uint64_t v26 = *((void *)v4 + 9);
  if (autocompleteFilter)
  {
    if (!v26) {
      goto LABEL_69;
    }
    -[GEOPDAutocompleteFilter mergeFrom:](autocompleteFilter, "mergeFrom:");
  }
  else
  {
    if (!v26) {
      goto LABEL_69;
    }
    -[GEOPDAutocompleteParameters setAutocompleteFilter:](self, "setAutocompleteFilter:");
  }
  unint64_t v4 = v35;
LABEL_69:
  int v27 = v4[43];
  if ((v27 & 2) != 0)
  {
    self->_shouldPopulateMapsIdentifier = *((unsigned char *)v4 + 168);
    *(_DWORD *)&self->_flags |= 2u;
    int v27 = v4[43];
  }
  if ((v27 & 4) != 0)
  {
    self->_supportAutocompleteSessionData = *((unsigned char *)v4 + 169);
    *(_DWORD *)&self->_flags |= 4u;
  }
  autocompleteSessionData = self->_autocompleteSessionData;
  uint64_t v29 = *((void *)v4 + 10);
  if (autocompleteSessionData)
  {
    if (!v29) {
      goto LABEL_79;
    }
    -[GEOPDAutocompleteSessionData mergeFrom:](autocompleteSessionData, "mergeFrom:");
  }
  else
  {
    if (!v29) {
      goto LABEL_79;
    }
    -[GEOPDAutocompleteParameters setAutocompleteSessionData:](self, "setAutocompleteSessionData:");
  }
  unint64_t v4 = v35;
LABEL_79:
  collectionOnly = self->_collectionOnly;
  uint64_t v31 = *((void *)v4 + 12);
  if (collectionOnly)
  {
    if (!v31) {
      goto LABEL_85;
    }
    -[GEOPDAutocompleteParametersCollectionOnly mergeFrom:](collectionOnly, "mergeFrom:");
  }
  else
  {
    if (!v31) {
      goto LABEL_85;
    }
    -[GEOPDAutocompleteParameters setCollectionOnly:](self, "setCollectionOnly:");
  }
  unint64_t v4 = v35;
LABEL_85:
  uint64_t v32 = [v4 supportedClientResolvedTypeWithSetupPromptsCount];
  if (v32)
  {
    uint64_t v33 = v32;
    for (uint64_t i = 0; i != v33; ++i)
      -[GEOPDAutocompleteParameters addSupportedClientResolvedTypeWithSetupPrompt:](self, "addSupportedClientResolvedTypeWithSetupPrompt:", [v35 supportedClientResolvedTypeWithSetupPromptAtIndex:i]);
  }
}

- (PBUnknownFields)unknownFields
{
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  if ((*(unsigned char *)&self->_flags & 8) == 0)
  {
    reader = self->_reader;
    if (reader)
    {
      unint64_t v5 = reader;
      objc_sync_enter(v5);
      GEOPDAutocompleteParametersReadSpecified((uint64_t)self, (unint64_t)self->_reader, (int *)&unknownFields_tags_765);
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
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(_DWORD *)&self->_flags |= 0x40008u;
  os_unfair_lock_unlock(p_readerLock);
  unknownFields = self->_unknownFields;
  self->_unknownFields = 0;

  if (v3)
  {
    [(GEOPDAutocompleteParameters *)self readAll:0];
    [(GEOPDAutocompleteParametersFullEntriesOnly *)self->_fullEntries clearUnknownFields:1];
    [(GEOPDAutocompleteParametersAllEntries *)self->_allEntries clearUnknownFields:1];
    [(GEOPDAutocompleteParametersLocalitiesAndLandmarks *)self->_localitiesAndLandmarks clearUnknownFields:1];
    [(GEOPDAutocompleteParametersAllEntriesWithBrowse *)self->_allEntriesWithBrowse clearUnknownFields:1];
    [(GEOPDAutocompleteParametersSiriSearch *)self->_siriSearch clearUnknownFields:1];
    [(GEOPDAutocompleteParametersAddressOnly *)self->_addressOnly clearUnknownFields:1];
    [(GEOPDAutocompleteParametersVenueSearch *)self->_venueSearch clearUnknownFields:1];
    [(GEOPDAutocompleteParametersBrandProfileSearch *)self->_brandProfileSearch clearUnknownFields:1];
    [(GEOPDAutocompleteParametersOfflineRegionSearch *)self->_offlineRegionSearch clearUnknownFields:1];
    [(GEOPDAutocompleteParametersPoiAddressOnly *)self->_poiAddressOnly clearUnknownFields:1];
    [(GEOPDAutocompleteFilter *)self->_autocompleteFilter clearUnknownFields:1];
    [(GEOPDAutocompleteSessionData *)self->_autocompleteSessionData clearUnknownFields:1];
    collectionOnly = self->_collectionOnly;
    [(GEOPDAutocompleteParametersCollectionOnly *)collectionOnly clearUnknownFields:1];
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_venueSearch, 0);
  objc_storeStrong((id *)&self->_siriSearch, 0);
  objc_storeStrong((id *)&self->_poiAddressOnly, 0);
  objc_storeStrong((id *)&self->_offlineRegionSearch, 0);
  objc_storeStrong((id *)&self->_localitiesAndLandmarks, 0);
  objc_storeStrong((id *)&self->_fullEntries, 0);
  objc_storeStrong((id *)&self->_collectionOnly, 0);
  objc_storeStrong((id *)&self->_brandProfileSearch, 0);
  objc_storeStrong((id *)&self->_autocompleteSessionData, 0);
  objc_storeStrong((id *)&self->_autocompleteFilter, 0);
  objc_storeStrong((id *)&self->_allEntries, 0);
  objc_storeStrong((id *)&self->_allEntriesWithBrowse, 0);
  objc_storeStrong((id *)&self->_addressOnly, 0);
  objc_storeStrong((id *)&self->_unknownFields, 0);

  objc_storeStrong((id *)&self->_reader, 0);
}

@end