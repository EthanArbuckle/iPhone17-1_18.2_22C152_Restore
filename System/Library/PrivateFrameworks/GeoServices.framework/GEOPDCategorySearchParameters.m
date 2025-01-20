@interface GEOPDCategorySearchParameters
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (GEOPDCategorySearchParameters)init;
- (GEOPDCategorySearchParameters)initWithData:(id)a3;
- (id)_dictionaryRepresentation:(uint64_t)a1;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)etaFilter;
- (id)jsonRepresentation;
- (uint64_t)hasGreenTeaWithValue:(uint64_t)result;
- (unint64_t)hash;
- (void)_addNoFlagsSearchEnrichmentRevisionMetadata:(uint64_t)a1;
- (void)_readEtaFilter;
- (void)_readKnownRefinementTypes;
- (void)_readPreviousSearchViewport;
- (void)_readResultRefinementQuery;
- (void)_readSearchOriginationInfo;
- (void)_readSupportedPlaceSummaryFormatTypes;
- (void)_readSupportedRelatedEntitySectionTypes;
- (void)_readSupportedSearchSectionTypes;
- (void)_readSupportedSearchTierTypes;
- (void)_readViewportInfo;
- (void)addKnownRefinementType:(os_unfair_lock_s *)a1;
- (void)addSearchEnrichmentRevisionMetadata:(uint64_t)a1;
- (void)addSupportedPlaceSummaryFormatType:(os_unfair_lock_s *)a1;
- (void)addSupportedRelatedEntitySectionType:(os_unfair_lock_s *)a1;
- (void)addSupportedSearchSectionType:(os_unfair_lock_s *)a1;
- (void)addSupportedSearchTierType:(os_unfair_lock_s *)a1;
- (void)dealloc;
- (void)readAll:(uint64_t)a1;
- (void)setEnrichmentCampaignNamespace:(uint64_t)a1;
- (void)setEtaFilter:(uint64_t)a1;
- (void)setEvChargingParameters:(uint64_t)a1;
- (void)setPaginationParameters:(uint64_t)a1;
- (void)setPreviousSearchViewport:(uint64_t)a1;
- (void)setRecentRouteInfo:(uint64_t)a1;
- (void)setResultRefinementQuery:(uint64_t)a1;
- (void)setSearchOriginationInfo:(uint64_t)a1;
- (void)setSearchSessionData:(uint64_t)a1;
- (void)setSessionUserActionMetadata:(uint64_t)a1;
- (void)setSuggestionEntryMetadata:(uint64_t)a1;
- (void)setViewportInfo:(uint64_t)a1;
- (void)writeTo:(id)a3;
@end

@implementation GEOPDCategorySearchParameters

- (void)readAll:(uint64_t)a1
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 256));
    v4 = *(void **)(a1 + 8);
    if (v4)
    {
      id v5 = v4;
      objc_sync_enter(v5);
      if (a2) {
        v6 = (int *)&readAll__recursiveTag_2505;
      }
      else {
        v6 = (int *)&readAll__nonRecursiveTag_2506;
      }
      GEOPDCategorySearchParametersReadSpecified(a1, *(void *)(a1 + 8), v6);
      objc_sync_exit(v5);
    }
    if (a2) {
      _GEOPDCategorySearchParametersCallReadAllRecursiveWithoutSynchronized(a1);
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 256));
  }
}

- (GEOPDCategorySearchParameters)init
{
  v6.receiver = self;
  v6.super_class = (Class)GEOPDCategorySearchParameters;
  v2 = [(GEOPDCategorySearchParameters *)&v6 init];
  v3 = v2;
  if (v2)
  {
    v2->_readerLock._os_unfair_lock_opaque = 0;
    v4 = v2;
  }

  return v3;
}

- (GEOPDCategorySearchParameters)initWithData:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)GEOPDCategorySearchParameters;
  v3 = [(GEOPDCategorySearchParameters *)&v7 initWithData:a3];
  v4 = v3;
  if (v3)
  {
    v3->_readerLock._os_unfair_lock_opaque = 0;
    id v5 = v3;
  }

  return v4;
}

- (void)dealloc
{
  PBRepeatedInt32Clear();
  PBRepeatedInt32Clear();
  PBRepeatedInt32Clear();
  PBRepeatedInt32Clear();
  PBRepeatedInt32Clear();
  v3.receiver = self;
  v3.super_class = (Class)GEOPDCategorySearchParameters;
  [(GEOPDCategorySearchParameters *)&v3 dealloc];
}

- (void)_readViewportInfo
{
  os_unfair_lock_lock((os_unfair_lock_t)(a1 + 256));
  if ((*(unsigned char *)(a1 + 291) & 8) == 0)
  {
    v2 = *(void **)(a1 + 8);
    if (v2)
    {
      id v3 = v2;
      objc_sync_enter(v3);
      GEOPDCategorySearchParametersReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readViewportInfo_tags_2379);
      objc_sync_exit(v3);
    }
  }

  os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 256));
}

- (void)setViewportInfo:(uint64_t)a1
{
  id v4 = a2;
  if (a1)
  {
    *(_DWORD *)(a1 + 288) |= 0x8000000u;
    *(_DWORD *)(a1 + 288) |= 0x10000000u;
    objc_storeStrong((id *)(a1 + 240), a2);
  }
}

- (void)setSuggestionEntryMetadata:(uint64_t)a1
{
  id v4 = a2;
  if (a1)
  {
    *(_DWORD *)(a1 + 288) |= 0x4000000u;
    *(_DWORD *)(a1 + 288) |= 0x10000000u;
    objc_storeStrong((id *)(a1 + 232), a2);
  }
}

- (void)setRecentRouteInfo:(uint64_t)a1
{
  id v4 = a2;
  if (a1)
  {
    *(_DWORD *)(a1 + 288) |= 0x100000u;
    *(_DWORD *)(a1 + 288) |= 0x10000000u;
    objc_storeStrong((id *)(a1 + 184), a2);
  }
}

- (void)setEvChargingParameters:(uint64_t)a1
{
  id v4 = a2;
  if (a1)
  {
    *(_DWORD *)(a1 + 288) |= 0x20000u;
    *(_DWORD *)(a1 + 288) |= 0x10000000u;
    objc_storeStrong((id *)(a1 + 160), a2);
  }
}

- (void)_readSupportedRelatedEntitySectionTypes
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 256));
    if ((*(unsigned char *)(a1 + 289) & 0x10) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOPDCategorySearchParametersReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readSupportedRelatedEntitySectionTypes_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 256));
  }
}

- (void)addSupportedRelatedEntitySectionType:(os_unfair_lock_s *)a1
{
  if (a1)
  {
    -[GEOPDCategorySearchParameters _readSupportedRelatedEntitySectionTypes]((uint64_t)a1);
    PBRepeatedInt32Add();
    os_unfair_lock_lock_with_options();
    a1[72]._os_unfair_lock_opaque |= 0x1000u;
    os_unfair_lock_unlock(a1 + 64);
    a1[72]._os_unfair_lock_opaque |= 0x10000000u;
  }
}

- (void)_readEtaFilter
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 256));
    if ((*(unsigned char *)(a1 + 290) & 1) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOPDCategorySearchParametersReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readEtaFilter_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 256));
  }
}

- (id)etaFilter
{
  if (a1)
  {
    v2 = a1;
    -[GEOPDCategorySearchParameters _readEtaFilter]((uint64_t)a1);
    a1 = (id *)v2[19];
    uint64_t v1 = vars8;
  }
  return a1;
}

- (void)setEtaFilter:(uint64_t)a1
{
  id v4 = a2;
  if (a1)
  {
    *(_DWORD *)(a1 + 288) |= 0x10000u;
    *(_DWORD *)(a1 + 288) |= 0x10000000u;
    objc_storeStrong((id *)(a1 + 152), a2);
  }
}

- (void)_readSupportedSearchTierTypes
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 256));
    if ((*(unsigned char *)(a1 + 289) & 0x40) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOPDCategorySearchParametersReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readSupportedSearchTierTypes_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 256));
  }
}

- (void)addSupportedSearchTierType:(os_unfair_lock_s *)a1
{
  if (a1)
  {
    -[GEOPDCategorySearchParameters _readSupportedSearchTierTypes]((uint64_t)a1);
    PBRepeatedInt32Add();
    os_unfair_lock_lock_with_options();
    a1[72]._os_unfair_lock_opaque |= 0x4000u;
    os_unfair_lock_unlock(a1 + 64);
    a1[72]._os_unfair_lock_opaque |= 0x10000000u;
  }
}

- (void)_readResultRefinementQuery
{
  os_unfair_lock_lock((os_unfair_lock_t)(a1 + 256));
  if ((*(unsigned char *)(a1 + 290) & 0x20) == 0)
  {
    v2 = *(void **)(a1 + 8);
    if (v2)
    {
      id v3 = v2;
      objc_sync_enter(v3);
      GEOPDCategorySearchParametersReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readResultRefinementQuery_tags);
      objc_sync_exit(v3);
    }
  }

  os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 256));
}

- (void)setResultRefinementQuery:(uint64_t)a1
{
  id v4 = a2;
  if (a1)
  {
    *(_DWORD *)(a1 + 288) |= 0x200000u;
    *(_DWORD *)(a1 + 288) |= 0x10000000u;
    objc_storeStrong((id *)(a1 + 192), a2);
  }
}

- (void)_readKnownRefinementTypes
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 256));
    if ((*(unsigned char *)(a1 + 289) & 4) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOPDCategorySearchParametersReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readKnownRefinementTypes_tags_2381);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 256));
  }
}

- (void)addKnownRefinementType:(os_unfair_lock_s *)a1
{
  if (a1)
  {
    -[GEOPDCategorySearchParameters _readKnownRefinementTypes]((uint64_t)a1);
    PBRepeatedInt32Add();
    os_unfair_lock_lock_with_options();
    a1[72]._os_unfair_lock_opaque |= 0x400u;
    os_unfair_lock_unlock(a1 + 64);
    a1[72]._os_unfair_lock_opaque |= 0x10000000u;
  }
}

- (void)_readPreviousSearchViewport
{
  os_unfair_lock_lock((os_unfair_lock_t)(a1 + 256));
  if ((*(unsigned char *)(a1 + 290) & 8) == 0)
  {
    v2 = *(void **)(a1 + 8);
    if (v2)
    {
      id v3 = v2;
      objc_sync_enter(v3);
      GEOPDCategorySearchParametersReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readPreviousSearchViewport_tags);
      objc_sync_exit(v3);
    }
  }

  os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 256));
}

- (void)setPreviousSearchViewport:(uint64_t)a1
{
  id v4 = a2;
  if (a1)
  {
    *(_DWORD *)(a1 + 288) |= 0x80000u;
    *(_DWORD *)(a1 + 288) |= 0x10000000u;
    objc_storeStrong((id *)(a1 + 176), a2);
  }
}

- (void)_readSupportedPlaceSummaryFormatTypes
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 256));
    if ((*(unsigned char *)(a1 + 289) & 8) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOPDCategorySearchParametersReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readSupportedPlaceSummaryFormatTypes_tags_2382);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 256));
  }
}

- (void)addSupportedPlaceSummaryFormatType:(os_unfair_lock_s *)a1
{
  if (a1)
  {
    -[GEOPDCategorySearchParameters _readSupportedPlaceSummaryFormatTypes]((uint64_t)a1);
    PBRepeatedInt32Add();
    os_unfair_lock_lock_with_options();
    a1[72]._os_unfair_lock_opaque |= 0x800u;
    os_unfair_lock_unlock(a1 + 64);
    a1[72]._os_unfair_lock_opaque |= 0x10000000u;
  }
}

- (void)_readSupportedSearchSectionTypes
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 256));
    if ((*(unsigned char *)(a1 + 289) & 0x20) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOPDCategorySearchParametersReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readSupportedSearchSectionTypes_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 256));
  }
}

- (void)addSupportedSearchSectionType:(os_unfair_lock_s *)a1
{
  if (a1)
  {
    -[GEOPDCategorySearchParameters _readSupportedSearchSectionTypes]((uint64_t)a1);
    PBRepeatedInt32Add();
    os_unfair_lock_lock_with_options();
    a1[72]._os_unfair_lock_opaque |= 0x2000u;
    os_unfair_lock_unlock(a1 + 64);
    a1[72]._os_unfair_lock_opaque |= 0x10000000u;
  }
}

- (void)_readSearchOriginationInfo
{
  os_unfair_lock_lock((os_unfair_lock_t)(a1 + 256));
  if ((*(unsigned char *)(a1 + 290) & 0x80) == 0)
  {
    v2 = *(void **)(a1 + 8);
    if (v2)
    {
      id v3 = v2;
      objc_sync_enter(v3);
      GEOPDCategorySearchParametersReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readSearchOriginationInfo_tags);
      objc_sync_exit(v3);
    }
  }

  os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 256));
}

- (void)setSearchOriginationInfo:(uint64_t)a1
{
  id v4 = a2;
  if (a1)
  {
    *(_DWORD *)(a1 + 288) |= 0x800000u;
    *(_DWORD *)(a1 + 288) |= 0x10000000u;
    objc_storeStrong((id *)(a1 + 208), a2);
  }
}

- (void)setEnrichmentCampaignNamespace:(uint64_t)a1
{
  id v4 = a2;
  *(_DWORD *)(a1 + 288) |= 0x8000u;
  *(_DWORD *)(a1 + 288) |= 0x10000000u;
  objc_storeStrong((id *)(a1 + 144), a2);
}

- (void)addSearchEnrichmentRevisionMetadata:(uint64_t)a1
{
  if (a1)
  {
    id v3 = a2;
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 256));
    if ((*(unsigned char *)(a1 + 290) & 0x40) == 0)
    {
      id v4 = *(void **)(a1 + 8);
      if (v4)
      {
        id v5 = v4;
        objc_sync_enter(v5);
        GEOPDCategorySearchParametersReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readSearchEnrichmentRevisionMetadatas_tags);
        objc_sync_exit(v5);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 256));
    -[GEOPDCategorySearchParameters _addNoFlagsSearchEnrichmentRevisionMetadata:](a1, v3);

    os_unfair_lock_lock_with_options();
    *(_DWORD *)(a1 + 288) |= 0x400000u;
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 256));
    *(_DWORD *)(a1 + 288) |= 0x10000000u;
  }
}

- (void)_addNoFlagsSearchEnrichmentRevisionMetadata:(uint64_t)a1
{
  id v3 = a2;
  if (a1)
  {
    id v4 = *(void **)(a1 + 200);
    id v7 = v3;
    if (!v4)
    {
      id v5 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
      objc_super v6 = *(void **)(a1 + 200);
      *(void *)(a1 + 200) = v5;

      id v4 = *(void **)(a1 + 200);
    }
    [v4 addObject:v7];
    id v3 = v7;
  }
}

- (void)setSearchSessionData:(uint64_t)a1
{
  id v4 = a2;
  if (a1)
  {
    *(_DWORD *)(a1 + 288) |= 0x1000000u;
    *(_DWORD *)(a1 + 288) |= 0x10000000u;
    objc_storeStrong((id *)(a1 + 216), a2);
  }
}

- (void)setSessionUserActionMetadata:(uint64_t)a1
{
  id v4 = a2;
  if (a1)
  {
    *(_DWORD *)(a1 + 288) |= 0x2000000u;
    *(_DWORD *)(a1 + 288) |= 0x10000000u;
    objc_storeStrong((id *)(a1 + 224), a2);
  }
}

- (void)setPaginationParameters:(uint64_t)a1
{
  id v4 = a2;
  *(_DWORD *)(a1 + 288) |= 0x40000u;
  *(_DWORD *)(a1 + 288) |= 0x10000000u;
  objc_storeStrong((id *)(a1 + 168), a2);
}

- (id)description
{
  id v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)GEOPDCategorySearchParameters;
  id v4 = [(GEOPDCategorySearchParameters *)&v8 description];
  id v5 = [(GEOPDCategorySearchParameters *)self dictionaryRepresentation];
  objc_super v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEOPDCategorySearchParameters _dictionaryRepresentation:]((uint64_t)self, 0);
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  uint64_t v149 = *MEMORY[0x1E4F143B8];
  if (a1)
  {
    -[GEOPDCategorySearchParameters readAll:](a1, 1);
    v141 = [MEMORY[0x1E4F1CA60] dictionary];
    if ((*(unsigned char *)(a1 + 288) & 8) != 0)
    {
      id v4 = [NSNumber numberWithUnsignedInt:*(unsigned int *)(a1 + 272)];
      if (a2) {
        id v5 = @"maxResults";
      }
      else {
        id v5 = @"max_results";
      }
      [v141 setObject:v4 forKey:v5];
    }
    -[GEOPDCategorySearchParameters _readViewportInfo](a1);
    id v6 = *(id *)(a1 + 240);
    id v7 = v6;
    if (v6)
    {
      if (a2)
      {
        objc_super v8 = [v6 jsonRepresentation];
        v9 = @"viewportInfo";
      }
      else
      {
        objc_super v8 = [v6 dictionaryRepresentation];
        v9 = @"viewport_info";
      }
      id v10 = v8;

      [v141 setObject:v10 forKey:v9];
    }

    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 256));
    if ((*(unsigned char *)(a1 + 291) & 4) == 0)
    {
      v11 = *(void **)(a1 + 8);
      if (v11)
      {
        id v12 = v11;
        objc_sync_enter(v12);
        GEOPDCategorySearchParametersReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readSuggestionEntryMetadata_tags);
        objc_sync_exit(v12);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 256));
    id v13 = *(id *)(a1 + 232);
    v14 = v13;
    if (v13)
    {
      if (a2)
      {
        v15 = [v13 base64EncodedStringWithOptions:0];
        [v141 setObject:v15 forKey:@"suggestionEntryMetadata"];
      }
      else
      {
        [v141 setObject:v13 forKey:@"suggestion_entry_metadata"];
      }
    }

    int v16 = *(_DWORD *)(a1 + 288);
    if ((v16 & 2) != 0)
    {
      v17 = [NSNumber numberWithUnsignedInt:*(unsigned int *)(a1 + 264)];
      if (a2) {
        v18 = @"blurredHourOfDay";
      }
      else {
        v18 = @"blurred_hour_of_day";
      }
      [v141 setObject:v17 forKey:v18];

      int v16 = *(_DWORD *)(a1 + 288);
    }
    if ((v16 & 4) != 0)
    {
      v19 = [NSNumber numberWithUnsignedInt:*(unsigned int *)(a1 + 268)];
      if (a2) {
        v20 = @"dayOfWeek";
      }
      else {
        v20 = @"day_of_week";
      }
      [v141 setObject:v19 forKey:v20];

      int v16 = *(_DWORD *)(a1 + 288);
    }
    if ((v16 & 0x20) != 0)
    {
      uint64_t v21 = *(int *)(a1 + 280);
      if (v21 >= 6)
      {
        objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(int *)(a1 + 280));
        v22 = (__CFString *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v22 = off_1E53DCA68[v21];
      }
      if (a2) {
        v23 = @"searchType";
      }
      else {
        v23 = @"search_type";
      }
      [v141 setObject:v22 forKey:v23];
    }
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 256));
    if ((*(unsigned char *)(a1 + 290) & 0x10) == 0)
    {
      v24 = *(void **)(a1 + 8);
      if (v24)
      {
        id v25 = v24;
        objc_sync_enter(v25);
        GEOPDCategorySearchParametersReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readRecentRouteInfo_tags);
        objc_sync_exit(v25);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 256));
    id v26 = *(id *)(a1 + 184);
    v27 = v26;
    if (v26)
    {
      if (a2)
      {
        v28 = [v26 jsonRepresentation];
        v29 = @"recentRouteInfo";
      }
      else
      {
        v28 = [v26 dictionaryRepresentation];
        v29 = @"recent_route_info";
      }
      id v30 = v28;

      [v141 setObject:v30 forKey:v29];
    }

    if ((*(unsigned char *)(a1 + 288) & 0x40) != 0)
    {
      v31 = [NSNumber numberWithBool:*(unsigned __int8 *)(a1 + 284)];
      if (a2) {
        v32 = @"supportCategorySearchResultSection";
      }
      else {
        v32 = @"support_category_search_result_section";
      }
      [v141 setObject:v31 forKey:v32];
    }
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 256));
    if ((*(unsigned char *)(a1 + 290) & 2) == 0)
    {
      v33 = *(void **)(a1 + 8);
      if (v33)
      {
        id v34 = v33;
        objc_sync_enter(v34);
        GEOPDCategorySearchParametersReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readEvChargingParameters_tags_2380);
        objc_sync_exit(v34);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 256));
    id v35 = *(id *)(a1 + 160);
    v36 = v35;
    if (v35)
    {
      if (a2)
      {
        v37 = [v35 jsonRepresentation];
        v38 = @"evChargingParameters";
      }
      else
      {
        v37 = [v35 dictionaryRepresentation];
        v38 = @"ev_charging_parameters";
      }
      id v39 = v37;

      [v141 setObject:v39 forKey:v38];
    }

    if (*(void *)(a1 + 80))
    {
      v40 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:");
      v41 = (void *)(a1 + 72);
      if (*(void *)(a1 + 80))
      {
        unint64_t v42 = 0;
        do
        {
          uint64_t v43 = *(unsigned int *)(*v41 + 4 * v42);
          if (v43)
          {
            if (v43 == 1)
            {
              v44 = @"RELATED_ENTITY_SECTION_TYPE_COLLECTION";
            }
            else
            {
              objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", v43);
              v44 = (__CFString *)objc_claimAutoreleasedReturnValue();
            }
          }
          else
          {
            v44 = @"RELATED_ENTITY_SECTION_TYPE_UNKNOWN";
          }
          [v40 addObject:v44];

          ++v42;
          v41 = (void *)(a1 + 72);
        }
        while (v42 < *(void *)(a1 + 80));
      }
      if (a2) {
        v45 = @"supportedRelatedEntitySectionType";
      }
      else {
        v45 = @"supported_related_entity_section_type";
      }
      [v141 setObject:v40 forKey:v45];
    }
    v46 = -[GEOPDCategorySearchParameters etaFilter]((id *)a1);
    v47 = v46;
    if (v46)
    {
      if (a2)
      {
        v48 = [v46 jsonRepresentation];
        v49 = @"etaFilter";
      }
      else
      {
        v48 = [v46 dictionaryRepresentation];
        v49 = @"eta_filter";
      }
      id v50 = v48;

      [v141 setObject:v50 forKey:v49];
    }

    if (*(void *)(a1 + 128))
    {
      v51 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:");
      v52 = (void *)(a1 + 120);
      if (*(void *)(a1 + 128))
      {
        unint64_t v53 = 0;
        do
        {
          uint64_t v54 = *(int *)(*v52 + 4 * v53);
          if (v54 >= 3)
          {
            objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", v54);
            v55 = (__CFString *)objc_claimAutoreleasedReturnValue();
          }
          else
          {
            v55 = off_1E53DCF80[v54];
          }
          [v51 addObject:v55];

          ++v53;
          v52 = (void *)(a1 + 120);
        }
        while (v53 < *(void *)(a1 + 128));
      }
      if (a2) {
        v56 = @"supportedSearchTierType";
      }
      else {
        v56 = @"supported_search_tier_type";
      }
      [v141 setObject:v51 forKey:v56];
    }
    if (*(unsigned char *)(a1 + 288))
    {
      v57 = [NSNumber numberWithUnsignedInt:*(unsigned int *)(a1 + 260)];
      if (a2) {
        v58 = @"auxiliaryTierNumResults";
      }
      else {
        v58 = @"auxiliary_tier_num_results";
      }
      [v141 setObject:v57 forKey:v58];
    }
    -[GEOPDCategorySearchParameters _readResultRefinementQuery](a1);
    id v59 = *(id *)(a1 + 192);
    v60 = v59;
    if (v59)
    {
      if (a2)
      {
        v61 = [v59 jsonRepresentation];
        v62 = @"resultRefinementQuery";
      }
      else
      {
        v61 = [v59 dictionaryRepresentation];
        v62 = @"result_refinement_query";
      }
      id v63 = v61;

      [v141 setObject:v63 forKey:v62];
    }

    if (*(void *)(a1 + 32))
    {
      v64 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:");
      v65 = (void *)(a1 + 24);
      if (*(void *)(a1 + 32))
      {
        unint64_t v66 = 0;
        do
        {
          uint64_t v67 = *(int *)(*v65 + 4 * v66);
          if (v67 >= 7)
          {
            objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", v67);
            v68 = (__CFString *)objc_claimAutoreleasedReturnValue();
          }
          else
          {
            v68 = off_1E53DCF98[v67];
          }
          [v64 addObject:v68];

          ++v66;
          v65 = (void *)(a1 + 24);
        }
        while (v66 < *(void *)(a1 + 32));
      }
      if (a2) {
        v69 = @"knownRefinementType";
      }
      else {
        v69 = @"known_refinement_type";
      }
      [v141 setObject:v64 forKey:v69];
    }
    if ((*(unsigned char *)(a1 + 288) & 0x10) != 0)
    {
      uint64_t v70 = *(int *)(a1 + 276);
      if (v70 >= 0x24)
      {
        objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(int *)(a1 + 276));
        v71 = (__CFString *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v71 = off_1E53DCFD0[v70];
      }
      if (a2) {
        v72 = @"placeSummaryRevision";
      }
      else {
        v72 = @"place_summary_revision";
      }
      [v141 setObject:v71 forKey:v72];
    }
    -[GEOPDCategorySearchParameters _readPreviousSearchViewport](a1);
    id v73 = *(id *)(a1 + 176);
    v74 = v73;
    if (v73)
    {
      if (a2)
      {
        v75 = [v73 jsonRepresentation];
        v76 = @"previousSearchViewport";
      }
      else
      {
        v75 = [v73 dictionaryRepresentation];
        v76 = @"previous_search_viewport";
      }
      id v77 = v75;

      [v141 setObject:v77 forKey:v76];
    }

    if (*(void *)(a1 + 56))
    {
      v78 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:");
      v79 = (void *)(a1 + 48);
      if (*(void *)(a1 + 56))
      {
        unint64_t v80 = 0;
        do
        {
          uint64_t v81 = *(int *)(*v79 + 4 * v80);
          if (v81 >= 5)
          {
            objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", v81);
            v82 = (__CFString *)objc_claimAutoreleasedReturnValue();
          }
          else
          {
            v82 = off_1E53DD0F0[v81];
          }
          [v78 addObject:v82];

          ++v80;
          v79 = (void *)(a1 + 48);
        }
        while (v80 < *(void *)(a1 + 56));
      }
      if (a2) {
        v83 = @"supportedPlaceSummaryFormatType";
      }
      else {
        v83 = @"supported_place_summary_format_type";
      }
      [v141 setObject:v78 forKey:v83];
    }
    if (*(void *)(a1 + 104))
    {
      v84 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:");
      v85 = (void *)(a1 + 96);
      if (*(void *)(a1 + 104))
      {
        unint64_t v86 = 0;
        do
        {
          uint64_t v87 = *(int *)(*v85 + 4 * v86);
          if (v87 >= 3)
          {
            objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", v87);
            v88 = (__CFString *)objc_claimAutoreleasedReturnValue();
          }
          else
          {
            v88 = off_1E53DD118[v87];
          }
          [v84 addObject:v88];

          ++v86;
          v85 = (void *)(a1 + 96);
        }
        while (v86 < *(void *)(a1 + 104));
      }
      if (a2) {
        v89 = @"supportedSearchSectionType";
      }
      else {
        v89 = @"supported_search_section_type";
      }
      [v141 setObject:v84 forKey:v89];
    }
    int v90 = *(_DWORD *)(a1 + 288);
    if ((v90 & 0x80) != 0)
    {
      v91 = [NSNumber numberWithBool:*(unsigned __int8 *)(a1 + 285)];
      if (a2) {
        v92 = @"supportSearchEnrichment";
      }
      else {
        v92 = @"support_search_enrichment";
      }
      [v141 setObject:v91 forKey:v92];

      int v90 = *(_DWORD *)(a1 + 288);
    }
    if ((v90 & 0x100) != 0)
    {
      v93 = [NSNumber numberWithBool:*(unsigned __int8 *)(a1 + 286)];
      if (a2) {
        v94 = @"supportStructuredRapAffordance";
      }
      else {
        v94 = @"support_structured_rap_affordance";
      }
      [v141 setObject:v93 forKey:v94];
    }
    -[GEOPDCategorySearchParameters _readSearchOriginationInfo](a1);
    id v95 = *(id *)(a1 + 208);
    v96 = v95;
    if (v95)
    {
      if (a2)
      {
        v97 = [v95 jsonRepresentation];
        v98 = @"searchOriginationInfo";
      }
      else
      {
        v97 = [v95 dictionaryRepresentation];
        v98 = @"search_origination_info";
      }
      id v99 = v97;

      [v141 setObject:v99 forKey:v98];
    }

    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 256));
    if ((*(unsigned char *)(a1 + 289) & 0x80) == 0)
    {
      v100 = *(void **)(a1 + 8);
      if (v100)
      {
        id v101 = v100;
        objc_sync_enter(v101);
        GEOPDCategorySearchParametersReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readEnrichmentCampaignNamespace_tags);
        objc_sync_exit(v101);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 256));
    id v102 = *(id *)(a1 + 144);
    if (v102)
    {
      if (a2) {
        v103 = @"enrichmentCampaignNamespace";
      }
      else {
        v103 = @"enrichment_campaign_namespace";
      }
      [v141 setObject:v102 forKey:v103];
    }

    if ([*(id *)(a1 + 200) count])
    {
      v104 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(*(id *)(a1 + 200), "count"));
      long long v144 = 0u;
      long long v145 = 0u;
      long long v146 = 0u;
      long long v147 = 0u;
      id v105 = *(id *)(a1 + 200);
      uint64_t v106 = [v105 countByEnumeratingWithState:&v144 objects:v148 count:16];
      if (v106)
      {
        uint64_t v107 = *(void *)v145;
        do
        {
          for (uint64_t i = 0; i != v106; ++i)
          {
            if (*(void *)v145 != v107) {
              objc_enumerationMutation(v105);
            }
            v109 = *(void **)(*((void *)&v144 + 1) + 8 * i);
            if (a2) {
              [v109 jsonRepresentation];
            }
            else {
            id v110 = [v109 dictionaryRepresentation];
            }

            [v104 addObject:v110];
          }
          uint64_t v106 = [v105 countByEnumeratingWithState:&v144 objects:v148 count:16];
        }
        while (v106);
      }

      if (a2) {
        v111 = @"searchEnrichmentRevisionMetadata";
      }
      else {
        v111 = @"search_enrichment_revision_metadata";
      }
      [v141 setObject:v104 forKey:v111];
    }
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 256));
    if ((*(unsigned char *)(a1 + 291) & 1) == 0)
    {
      v112 = *(void **)(a1 + 8);
      if (v112)
      {
        id v113 = v112;
        objc_sync_enter(v113);
        GEOPDCategorySearchParametersReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readSearchSessionData_tags);
        objc_sync_exit(v113);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 256));
    id v114 = *(id *)(a1 + 216);
    v115 = v114;
    if (v114)
    {
      if (a2)
      {
        v116 = [v114 jsonRepresentation];
        v117 = @"searchSessionData";
      }
      else
      {
        v116 = [v114 dictionaryRepresentation];
        v117 = @"search_session_data";
      }
      id v118 = v116;

      [v141 setObject:v118 forKey:v117];
    }

    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 256));
    if ((*(unsigned char *)(a1 + 291) & 2) == 0)
    {
      v119 = *(void **)(a1 + 8);
      if (v119)
      {
        id v120 = v119;
        objc_sync_enter(v120);
        GEOPDCategorySearchParametersReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readSessionUserActionMetadata_tags);
        objc_sync_exit(v120);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 256));
    id v121 = *(id *)(a1 + 224);
    v122 = v121;
    if (v121)
    {
      if (a2)
      {
        v123 = [v121 jsonRepresentation];
        v124 = @"sessionUserActionMetadata";
      }
      else
      {
        v123 = [v121 dictionaryRepresentation];
        v124 = @"session_user_action_metadata";
      }
      id v125 = v123;

      [v141 setObject:v125 forKey:v124];
    }

    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 256));
    if ((*(unsigned char *)(a1 + 290) & 4) == 0)
    {
      v126 = *(void **)(a1 + 8);
      if (v126)
      {
        id v127 = v126;
        objc_sync_enter(v127);
        GEOPDCategorySearchParametersReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readPaginationParameters_tags);
        objc_sync_exit(v127);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 256));
    id v128 = *(id *)(a1 + 168);
    v129 = v128;
    if (v128)
    {
      if (a2)
      {
        v130 = [v128 jsonRepresentation];
        v131 = @"paginationParameters";
      }
      else
      {
        v130 = [v128 dictionaryRepresentation];
        v131 = @"pagination_parameters";
      }
      id v132 = v130;

      [v141 setObject:v132 forKey:v131];
    }

    v133 = *(void **)(a1 + 16);
    if (v133)
    {
      v134 = [v133 dictionaryRepresentation];
      v135 = v134;
      if (a2)
      {
        v136 = objc_msgSend(MEMORY[0x1E4F1CA60], "dictionaryWithCapacity:", objc_msgSend(v134, "count"));
        v142[0] = MEMORY[0x1E4F143A8];
        v142[1] = 3221225472;
        v142[2] = __59__GEOPDCategorySearchParameters__dictionaryRepresentation___block_invoke;
        v142[3] = &unk_1E53D8860;
        id v137 = v136;
        id v143 = v137;
        [v135 enumerateKeysAndObjectsUsingBlock:v142];
        id v138 = v137;
      }
      else
      {
        id v138 = v134;
      }
      [v141 setObject:v138 forKey:@"Unknown Fields"];
    }
    id v139 = v141;
  }
  else
  {
    id v139 = 0;
  }

  return v139;
}

- (id)jsonRepresentation
{
  return -[GEOPDCategorySearchParameters _dictionaryRepresentation:]((uint64_t)self, 1);
}

void __59__GEOPDCategorySearchParameters__dictionaryRepresentation___block_invoke(uint64_t a1, void *a2, void *a3)
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
  return GEOPDCategorySearchParametersReadAllFrom((uint64_t)self, a3, 0);
}

- (void)writeTo:(id)a3
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  if (self->_reader && (_GEOPDCategorySearchParametersIsDirty((uint64_t)self) & 1) == 0)
  {
    v17 = self->_reader;
    objc_sync_enter(v17);
    *(void *)((char *)self->_reader + (int)*MEMORY[0x1E4F940E0]) = self->_readerMarkLength;
    [(PBDataReader *)self->_reader seekToOffset:self->_readerMarkPos];
    v18 = [(PBDataReader *)self->_reader readBytes:self->_readerMarkLength - self->_readerMarkPos];
    [v4 writeData:v18];
    os_unfair_lock_unlock(p_readerLock);

    objc_sync_exit(v17);
    goto LABEL_70;
  }
  os_unfair_lock_unlock(&self->_readerLock);
  -[GEOPDCategorySearchParameters readAll:]((uint64_t)self, 0);
  if ((*(unsigned char *)&self->_flags & 8) != 0) {
    PBDataWriterWriteUint32Field();
  }
  if (self->_viewportInfo) {
    PBDataWriterWriteSubmessage();
  }
  if (self->_suggestionEntryMetadata) {
    PBDataWriterWriteDataField();
  }
  $B1EDBE28F93122CC43DE0324E96A3F6C flags = self->_flags;
  if ((*(unsigned char *)&flags & 2) == 0)
  {
    if ((*(unsigned char *)&flags & 4) == 0) {
      goto LABEL_11;
    }
LABEL_67:
    PBDataWriterWriteUint32Field();
    if ((*(_DWORD *)&self->_flags & 0x20) == 0) {
      goto LABEL_13;
    }
    goto LABEL_12;
  }
  PBDataWriterWriteUint32Field();
  $B1EDBE28F93122CC43DE0324E96A3F6C flags = self->_flags;
  if ((*(unsigned char *)&flags & 4) != 0) {
    goto LABEL_67;
  }
LABEL_11:
  if ((*(unsigned char *)&flags & 0x20) != 0) {
LABEL_12:
  }
    PBDataWriterWriteInt32Field();
LABEL_13:
  if (self->_recentRouteInfo) {
    PBDataWriterWriteSubmessage();
  }
  if ((*(unsigned char *)&self->_flags & 0x40) != 0) {
    PBDataWriterWriteBOOLField();
  }
  if (self->_evChargingParameters) {
    PBDataWriterWriteSubmessage();
  }
  if (self->_supportedRelatedEntitySectionTypes.count)
  {
    unint64_t v7 = 0;
    do
    {
      PBDataWriterWriteInt32Field();
      ++v7;
    }
    while (v7 < self->_supportedRelatedEntitySectionTypes.count);
  }
  if (self->_etaFilter) {
    PBDataWriterWriteSubmessage();
  }
  if (self->_supportedSearchTierTypes.count)
  {
    unint64_t v8 = 0;
    do
    {
      PBDataWriterWriteInt32Field();
      ++v8;
    }
    while (v8 < self->_supportedSearchTierTypes.count);
  }
  if (*(unsigned char *)&self->_flags) {
    PBDataWriterWriteUint32Field();
  }
  if (self->_resultRefinementQuery) {
    PBDataWriterWriteSubmessage();
  }
  if (self->_knownRefinementTypes.count)
  {
    unint64_t v9 = 0;
    do
    {
      PBDataWriterWriteInt32Field();
      ++v9;
    }
    while (v9 < self->_knownRefinementTypes.count);
  }
  if ((*(unsigned char *)&self->_flags & 0x10) != 0) {
    PBDataWriterWriteInt32Field();
  }
  if (self->_previousSearchViewport) {
    PBDataWriterWriteSubmessage();
  }
  if (self->_supportedPlaceSummaryFormatTypes.count)
  {
    unint64_t v10 = 0;
    do
    {
      PBDataWriterWriteInt32Field();
      ++v10;
    }
    while (v10 < self->_supportedPlaceSummaryFormatTypes.count);
  }
  if (self->_supportedSearchSectionTypes.count)
  {
    unint64_t v11 = 0;
    do
    {
      PBDataWriterWriteInt32Field();
      ++v11;
    }
    while (v11 < self->_supportedSearchSectionTypes.count);
  }
  $B1EDBE28F93122CC43DE0324E96A3F6C v12 = self->_flags;
  if ((*(unsigned char *)&v12 & 0x80) != 0)
  {
    PBDataWriterWriteBOOLField();
    $B1EDBE28F93122CC43DE0324E96A3F6C v12 = self->_flags;
  }
  if ((*(_WORD *)&v12 & 0x100) != 0) {
    PBDataWriterWriteBOOLField();
  }
  if (self->_searchOriginationInfo) {
    PBDataWriterWriteSubmessage();
  }
  if (self->_enrichmentCampaignNamespace) {
    PBDataWriterWriteStringField();
  }
  long long v21 = 0u;
  long long v22 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  id v13 = self->_searchEnrichmentRevisionMetadatas;
  uint64_t v14 = [(NSMutableArray *)v13 countByEnumeratingWithState:&v19 objects:v23 count:16];
  if (v14)
  {
    uint64_t v15 = *(void *)v20;
    do
    {
      uint64_t v16 = 0;
      do
      {
        if (*(void *)v20 != v15) {
          objc_enumerationMutation(v13);
        }
        PBDataWriterWriteSubmessage();
        ++v16;
      }
      while (v14 != v16);
      uint64_t v14 = [(NSMutableArray *)v13 countByEnumeratingWithState:&v19 objects:v23 count:16];
    }
    while (v14);
  }

  if (self->_searchSessionData) {
    PBDataWriterWriteSubmessage();
  }
  if (self->_sessionUserActionMetadata) {
    PBDataWriterWriteSubmessage();
  }
  if (self->_paginationParameters) {
    PBDataWriterWriteSubmessage();
  }
  -[PBUnknownFields writeTo:](self->_unknownFields, "writeTo:", v4, v19);
LABEL_70:
}

- (uint64_t)hasGreenTeaWithValue:(uint64_t)result
{
  if (result)
  {
    uint64_t v3 = result;
    -[GEOPDCategorySearchParameters _readPreviousSearchViewport](result);
    if ([*(id *)(v3 + 176) hasGreenTeaWithValue:a2]) {
      return 1;
    }
    -[GEOPDCategorySearchParameters _readResultRefinementQuery](v3);
    if ([*(id *)(v3 + 192) hasGreenTeaWithValue:a2]) {
      return 1;
    }
    -[GEOPDCategorySearchParameters _readSearchOriginationInfo](v3);
    if (-[GEOPDSearchOriginationInfo hasGreenTeaWithValue:](*(void *)(v3 + 208), a2))
    {
      return 1;
    }
    else
    {
      -[GEOPDCategorySearchParameters _readViewportInfo](v3);
      id v4 = *(void **)(v3 + 240);
      return [v4 hasGreenTeaWithValue:a2];
    }
  }
  return result;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v47 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  os_unfair_lock_lock(&self->_readerLock);
  reader = self->_reader;
  if (reader)
  {
    unint64_t v7 = reader;
    objc_sync_enter(v7);
    if ((*((unsigned char *)&self->_flags + 3) & 0x10) == 0)
    {
      *(void *)((char *)self->_reader + (int)*MEMORY[0x1E4F940E0]) = self->_readerMarkLength;
      [(PBDataReader *)self->_reader seekToOffset:self->_readerMarkPos];
      GEOPDCategorySearchParametersReadAllFrom(v5, self->_reader, 0);
      os_unfair_lock_unlock(&self->_readerLock);
      id v8 = (id)v5;
      objc_sync_exit(v7);

      goto LABEL_29;
    }
    objc_sync_exit(v7);
  }
  os_unfair_lock_unlock(&self->_readerLock);
  -[GEOPDCategorySearchParameters readAll:]((uint64_t)self, 0);
  if ((*(unsigned char *)&self->_flags & 8) != 0)
  {
    *(_DWORD *)(v5 + 272) = self->_maxResults;
    *(_DWORD *)(v5 + 288) |= 8u;
  }
  id v9 = [(GEOPDViewportInfo *)self->_viewportInfo copyWithZone:a3];
  unint64_t v10 = *(void **)(v5 + 240);
  *(void *)(v5 + 240) = v9;

  uint64_t v11 = [(NSData *)self->_suggestionEntryMetadata copyWithZone:a3];
  $B1EDBE28F93122CC43DE0324E96A3F6C v12 = *(void **)(v5 + 232);
  *(void *)(v5 + 232) = v11;

  $B1EDBE28F93122CC43DE0324E96A3F6C flags = self->_flags;
  if ((*(unsigned char *)&flags & 2) == 0)
  {
    if ((*(unsigned char *)&flags & 4) == 0) {
      goto LABEL_9;
    }
LABEL_31:
    *(_DWORD *)(v5 + 268) = self->_dayOfWeek;
    *(_DWORD *)(v5 + 288) |= 4u;
    if ((*(_DWORD *)&self->_flags & 0x20) == 0) {
      goto LABEL_11;
    }
    goto LABEL_10;
  }
  *(_DWORD *)(v5 + 264) = self->_blurredHourOfDay;
  *(_DWORD *)(v5 + 288) |= 2u;
  $B1EDBE28F93122CC43DE0324E96A3F6C flags = self->_flags;
  if ((*(unsigned char *)&flags & 4) != 0) {
    goto LABEL_31;
  }
LABEL_9:
  if ((*(unsigned char *)&flags & 0x20) != 0)
  {
LABEL_10:
    *(_DWORD *)(v5 + 280) = self->_searchType;
    *(_DWORD *)(v5 + 288) |= 0x20u;
  }
LABEL_11:
  id v14 = [(GEOPDRecentRouteInfo *)self->_recentRouteInfo copyWithZone:a3];
  uint64_t v15 = *(void **)(v5 + 184);
  *(void *)(v5 + 184) = v14;

  if ((*(unsigned char *)&self->_flags & 0x40) != 0)
  {
    *(unsigned char *)(v5 + 284) = self->_supportCategorySearchResultSection;
    *(_DWORD *)(v5 + 288) |= 0x40u;
  }
  id v16 = [(GEOPDSSearchEvChargingParameters *)self->_evChargingParameters copyWithZone:a3];
  v17 = *(void **)(v5 + 160);
  *(void *)(v5 + 160) = v16;

  PBRepeatedInt32Copy();
  id v18 = [(GEOPDETAFilter *)self->_etaFilter copyWithZone:a3];
  long long v19 = *(void **)(v5 + 152);
  *(void *)(v5 + 152) = v18;

  PBRepeatedInt32Copy();
  if (*(unsigned char *)&self->_flags)
  {
    *(_DWORD *)(v5 + 260) = self->_auxiliaryTierNumResults;
    *(_DWORD *)(v5 + 288) |= 1u;
  }
  id v20 = [(GEOPDResultRefinementQuery *)self->_resultRefinementQuery copyWithZone:a3];
  long long v21 = *(void **)(v5 + 192);
  *(void *)(v5 + 192) = v20;

  PBRepeatedInt32Copy();
  if ((*(unsigned char *)&self->_flags & 0x10) != 0)
  {
    *(_DWORD *)(v5 + 276) = self->_placeSummaryRevision;
    *(_DWORD *)(v5 + 288) |= 0x10u;
  }
  id v22 = [(GEOPDViewportInfo *)self->_previousSearchViewport copyWithZone:a3];
  v23 = *(void **)(v5 + 176);
  *(void *)(v5 + 176) = v22;

  PBRepeatedInt32Copy();
  PBRepeatedInt32Copy();
  $B1EDBE28F93122CC43DE0324E96A3F6C v24 = self->_flags;
  if ((*(unsigned char *)&v24 & 0x80) != 0)
  {
    *(unsigned char *)(v5 + 285) = self->_supportSearchEnrichment;
    *(_DWORD *)(v5 + 288) |= 0x80u;
    $B1EDBE28F93122CC43DE0324E96A3F6C v24 = self->_flags;
  }
  if ((*(_WORD *)&v24 & 0x100) != 0)
  {
    *(unsigned char *)(v5 + 286) = self->_supportStructuredRapAffordance;
    *(_DWORD *)(v5 + 288) |= 0x100u;
  }
  id v25 = [(GEOPDSearchOriginationInfo *)self->_searchOriginationInfo copyWithZone:a3];
  id v26 = *(void **)(v5 + 208);
  *(void *)(v5 + 208) = v25;

  uint64_t v27 = [(NSString *)self->_enrichmentCampaignNamespace copyWithZone:a3];
  v28 = *(void **)(v5 + 144);
  *(void *)(v5 + 144) = v27;

  long long v44 = 0u;
  long long v45 = 0u;
  long long v42 = 0u;
  long long v43 = 0u;
  v29 = self->_searchEnrichmentRevisionMetadatas;
  uint64_t v30 = [(NSMutableArray *)v29 countByEnumeratingWithState:&v42 objects:v46 count:16];
  if (v30)
  {
    uint64_t v31 = *(void *)v43;
    do
    {
      for (uint64_t i = 0; i != v30; ++i)
      {
        if (*(void *)v43 != v31) {
          objc_enumerationMutation(v29);
        }
        v33 = objc_msgSend(*(id *)(*((void *)&v42 + 1) + 8 * i), "copyWithZone:", a3, (void)v42);
        -[GEOPDCategorySearchParameters addSearchEnrichmentRevisionMetadata:](v5, v33);
      }
      uint64_t v30 = [(NSMutableArray *)v29 countByEnumeratingWithState:&v42 objects:v46 count:16];
    }
    while (v30);
  }

  id v34 = [(GEOPDSSearchSessionData *)self->_searchSessionData copyWithZone:a3];
  id v35 = *(void **)(v5 + 216);
  *(void *)(v5 + 216) = v34;

  id v36 = [(GEOPDSSessionUserActionMetadata *)self->_sessionUserActionMetadata copyWithZone:a3];
  v37 = *(void **)(v5 + 224);
  *(void *)(v5 + 224) = v36;

  id v38 = [(GEOPDPaginationParameters *)self->_paginationParameters copyWithZone:a3];
  id v39 = *(void **)(v5 + 168);
  *(void *)(v5 + 168) = v38;

  v40 = self->_unknownFields;
  id v8 = *(id *)(v5 + 16);
  *(void *)(v5 + 16) = v40;
LABEL_29:

  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_88;
  }
  -[GEOPDCategorySearchParameters readAll:]((uint64_t)self, 1);
  -[GEOPDCategorySearchParameters readAll:]((uint64_t)v4, 1);
  int v5 = *((_DWORD *)v4 + 72);
  if ((*(unsigned char *)&self->_flags & 8) != 0)
  {
    if ((v5 & 8) == 0 || self->_maxResults != *((_DWORD *)v4 + 68)) {
      goto LABEL_88;
    }
  }
  else if ((v5 & 8) != 0)
  {
    goto LABEL_88;
  }
  viewportInfo = self->_viewportInfo;
  if ((unint64_t)viewportInfo | *((void *)v4 + 30) && !-[GEOPDViewportInfo isEqual:](viewportInfo, "isEqual:")) {
    goto LABEL_88;
  }
  suggestionEntryMetadata = self->_suggestionEntryMetadata;
  if ((unint64_t)suggestionEntryMetadata | *((void *)v4 + 29))
  {
    if (!-[NSData isEqual:](suggestionEntryMetadata, "isEqual:")) {
      goto LABEL_88;
    }
  }
  $B1EDBE28F93122CC43DE0324E96A3F6C flags = self->_flags;
  int v9 = *((_DWORD *)v4 + 72);
  if ((*(unsigned char *)&flags & 2) != 0)
  {
    if ((v9 & 2) == 0 || self->_blurredHourOfDay != *((_DWORD *)v4 + 66)) {
      goto LABEL_88;
    }
  }
  else if ((v9 & 2) != 0)
  {
    goto LABEL_88;
  }
  if ((*(unsigned char *)&flags & 4) != 0)
  {
    if ((v9 & 4) == 0 || self->_dayOfWeek != *((_DWORD *)v4 + 67)) {
      goto LABEL_88;
    }
  }
  else if ((v9 & 4) != 0)
  {
    goto LABEL_88;
  }
  if ((*(unsigned char *)&flags & 0x20) != 0)
  {
    if ((v9 & 0x20) == 0 || self->_searchType != *((_DWORD *)v4 + 70)) {
      goto LABEL_88;
    }
  }
  else if ((v9 & 0x20) != 0)
  {
    goto LABEL_88;
  }
  recentRouteInfo = self->_recentRouteInfo;
  if ((unint64_t)recentRouteInfo | *((void *)v4 + 23))
  {
    if (!-[GEOPDRecentRouteInfo isEqual:](recentRouteInfo, "isEqual:")) {
      goto LABEL_88;
    }
    $B1EDBE28F93122CC43DE0324E96A3F6C flags = self->_flags;
    int v9 = *((_DWORD *)v4 + 72);
  }
  if ((*(unsigned char *)&flags & 0x40) != 0)
  {
    if ((v9 & 0x40) == 0) {
      goto LABEL_88;
    }
    if (self->_supportCategorySearchResultSection)
    {
      if (!*((unsigned char *)v4 + 284)) {
        goto LABEL_88;
      }
    }
    else if (*((unsigned char *)v4 + 284))
    {
      goto LABEL_88;
    }
  }
  else if ((v9 & 0x40) != 0)
  {
    goto LABEL_88;
  }
  evChargingParameters = self->_evChargingParameters;
  if ((unint64_t)evChargingParameters | *((void *)v4 + 20)
    && !-[GEOPDSSearchEvChargingParameters isEqual:](evChargingParameters, "isEqual:"))
  {
    goto LABEL_88;
  }
  if (!PBRepeatedInt32IsEqual()) {
    goto LABEL_88;
  }
  etaFilter = self->_etaFilter;
  if ((unint64_t)etaFilter | *((void *)v4 + 19))
  {
    if (!-[GEOPDETAFilter isEqual:](etaFilter, "isEqual:")) {
      goto LABEL_88;
    }
  }
  if (!PBRepeatedInt32IsEqual()) {
    goto LABEL_88;
  }
  int v13 = *((_DWORD *)v4 + 72);
  if (*(unsigned char *)&self->_flags)
  {
    if ((v13 & 1) == 0 || self->_auxiliaryTierNumResults != *((_DWORD *)v4 + 65)) {
      goto LABEL_88;
    }
  }
  else if (v13)
  {
    goto LABEL_88;
  }
  resultRefinementQuery = self->_resultRefinementQuery;
  if ((unint64_t)resultRefinementQuery | *((void *)v4 + 24)
    && !-[GEOPDResultRefinementQuery isEqual:](resultRefinementQuery, "isEqual:")
    || !PBRepeatedInt32IsEqual())
  {
    goto LABEL_88;
  }
  int v15 = *((_DWORD *)v4 + 72);
  if ((*(unsigned char *)&self->_flags & 0x10) != 0)
  {
    if ((v15 & 0x10) == 0 || self->_placeSummaryRevision != *((_DWORD *)v4 + 69)) {
      goto LABEL_88;
    }
  }
  else if ((v15 & 0x10) != 0)
  {
    goto LABEL_88;
  }
  previousSearchViewport = self->_previousSearchViewport;
  if ((unint64_t)previousSearchViewport | *((void *)v4 + 22)
    && !-[GEOPDViewportInfo isEqual:](previousSearchViewport, "isEqual:")
    || !PBRepeatedInt32IsEqual()
    || !PBRepeatedInt32IsEqual())
  {
    goto LABEL_88;
  }
  $B1EDBE28F93122CC43DE0324E96A3F6C v17 = self->_flags;
  int v18 = *((_DWORD *)v4 + 72);
  if ((*(unsigned char *)&v17 & 0x80) != 0)
  {
    if ((v18 & 0x80) == 0) {
      goto LABEL_88;
    }
    if (self->_supportSearchEnrichment)
    {
      if (!*((unsigned char *)v4 + 285)) {
        goto LABEL_88;
      }
    }
    else if (*((unsigned char *)v4 + 285))
    {
      goto LABEL_88;
    }
  }
  else if ((v18 & 0x80) != 0)
  {
    goto LABEL_88;
  }
  if ((*(_WORD *)&v17 & 0x100) != 0)
  {
    if ((v18 & 0x100) != 0)
    {
      if (self->_supportStructuredRapAffordance)
      {
        if (!*((unsigned char *)v4 + 286)) {
          goto LABEL_88;
        }
        goto LABEL_76;
      }
      if (!*((unsigned char *)v4 + 286)) {
        goto LABEL_76;
      }
    }
LABEL_88:
    char v25 = 0;
    goto LABEL_89;
  }
  if ((v18 & 0x100) != 0) {
    goto LABEL_88;
  }
LABEL_76:
  searchOriginationInfo = self->_searchOriginationInfo;
  if ((unint64_t)searchOriginationInfo | *((void *)v4 + 26)
    && !-[GEOPDSearchOriginationInfo isEqual:](searchOriginationInfo, "isEqual:"))
  {
    goto LABEL_88;
  }
  enrichmentCampaignNamespace = self->_enrichmentCampaignNamespace;
  if ((unint64_t)enrichmentCampaignNamespace | *((void *)v4 + 18))
  {
    if (!-[NSString isEqual:](enrichmentCampaignNamespace, "isEqual:")) {
      goto LABEL_88;
    }
  }
  searchEnrichmentRevisionMetadatas = self->_searchEnrichmentRevisionMetadatas;
  if ((unint64_t)searchEnrichmentRevisionMetadatas | *((void *)v4 + 25))
  {
    if (!-[NSMutableArray isEqual:](searchEnrichmentRevisionMetadatas, "isEqual:")) {
      goto LABEL_88;
    }
  }
  searchSessionData = self->_searchSessionData;
  if ((unint64_t)searchSessionData | *((void *)v4 + 27))
  {
    if (!-[GEOPDSSearchSessionData isEqual:](searchSessionData, "isEqual:")) {
      goto LABEL_88;
    }
  }
  sessionUserActionMetadata = self->_sessionUserActionMetadata;
  if ((unint64_t)sessionUserActionMetadata | *((void *)v4 + 28))
  {
    if (!-[GEOPDSSessionUserActionMetadata isEqual:](sessionUserActionMetadata, "isEqual:")) {
      goto LABEL_88;
    }
  }
  paginationParameters = self->_paginationParameters;
  if ((unint64_t)paginationParameters | *((void *)v4 + 21)) {
    char v25 = -[GEOPDPaginationParameters isEqual:](paginationParameters, "isEqual:");
  }
  else {
    char v25 = 1;
  }
LABEL_89:

  return v25;
}

- (unint64_t)hash
{
  -[GEOPDCategorySearchParameters readAll:]((uint64_t)self, 1);
  if ((*(unsigned char *)&self->_flags & 8) != 0) {
    uint64_t v31 = 2654435761 * self->_maxResults;
  }
  else {
    uint64_t v31 = 0;
  }
  unint64_t v30 = [(GEOPDViewportInfo *)self->_viewportInfo hash];
  uint64_t v29 = [(NSData *)self->_suggestionEntryMetadata hash];
  $B1EDBE28F93122CC43DE0324E96A3F6C flags = self->_flags;
  if ((*(unsigned char *)&flags & 2) == 0)
  {
    uint64_t v28 = 0;
    if ((*(unsigned char *)&flags & 4) != 0) {
      goto LABEL_6;
    }
LABEL_9:
    uint64_t v27 = 0;
    if ((*(unsigned char *)&flags & 0x20) != 0) {
      goto LABEL_7;
    }
    goto LABEL_10;
  }
  uint64_t v28 = 2654435761 * self->_blurredHourOfDay;
  if ((*(unsigned char *)&flags & 4) == 0) {
    goto LABEL_9;
  }
LABEL_6:
  uint64_t v27 = 2654435761 * self->_dayOfWeek;
  if ((*(unsigned char *)&flags & 0x20) != 0)
  {
LABEL_7:
    uint64_t v26 = 2654435761 * self->_searchType;
    goto LABEL_11;
  }
LABEL_10:
  uint64_t v26 = 0;
LABEL_11:
  unint64_t v25 = [(GEOPDRecentRouteInfo *)self->_recentRouteInfo hash];
  if ((*(unsigned char *)&self->_flags & 0x40) != 0) {
    uint64_t v24 = 2654435761 * self->_supportCategorySearchResultSection;
  }
  else {
    uint64_t v24 = 0;
  }
  unint64_t v23 = [(GEOPDSSearchEvChargingParameters *)self->_evChargingParameters hash];
  uint64_t v22 = PBRepeatedInt32Hash();
  unint64_t v21 = [(GEOPDETAFilter *)self->_etaFilter hash];
  uint64_t v4 = PBRepeatedInt32Hash();
  if (*(unsigned char *)&self->_flags) {
    uint64_t v5 = 2654435761 * self->_auxiliaryTierNumResults;
  }
  else {
    uint64_t v5 = 0;
  }
  unint64_t v6 = [(GEOPDResultRefinementQuery *)self->_resultRefinementQuery hash];
  uint64_t v7 = PBRepeatedInt32Hash();
  if ((*(unsigned char *)&self->_flags & 0x10) != 0) {
    uint64_t v8 = 2654435761 * self->_placeSummaryRevision;
  }
  else {
    uint64_t v8 = 0;
  }
  unint64_t v9 = [(GEOPDViewportInfo *)self->_previousSearchViewport hash];
  uint64_t v10 = PBRepeatedInt32Hash();
  uint64_t v11 = PBRepeatedInt32Hash();
  $B1EDBE28F93122CC43DE0324E96A3F6C v12 = self->_flags;
  if ((*(unsigned char *)&v12 & 0x80) != 0)
  {
    uint64_t v13 = 2654435761 * self->_supportSearchEnrichment;
    if ((*(_WORD *)&v12 & 0x100) != 0) {
      goto LABEL_22;
    }
LABEL_24:
    uint64_t v14 = 0;
    goto LABEL_25;
  }
  uint64_t v13 = 0;
  if ((*(_WORD *)&v12 & 0x100) == 0) {
    goto LABEL_24;
  }
LABEL_22:
  uint64_t v14 = 2654435761 * self->_supportStructuredRapAffordance;
LABEL_25:
  unint64_t v15 = v10 ^ v11 ^ v13 ^ v14 ^ [(GEOPDSearchOriginationInfo *)self->_searchOriginationInfo hash];
  NSUInteger v16 = v15 ^ [(NSString *)self->_enrichmentCampaignNamespace hash];
  uint64_t v17 = v16 ^ [(NSMutableArray *)self->_searchEnrichmentRevisionMetadatas hash];
  unint64_t v18 = v17 ^ [(GEOPDSSearchSessionData *)self->_searchSessionData hash];
  unint64_t v19 = v30 ^ v31 ^ v29 ^ v28 ^ v27 ^ v26 ^ v25 ^ v24 ^ v23 ^ v22 ^ v21 ^ v4 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9 ^ v18 ^ [(GEOPDSSessionUserActionMetadata *)self->_sessionUserActionMetadata hash];
  return v19 ^ [(GEOPDPaginationParameters *)self->_paginationParameters hash];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_viewportInfo, 0);
  objc_storeStrong((id *)&self->_suggestionEntryMetadata, 0);
  objc_storeStrong((id *)&self->_sessionUserActionMetadata, 0);
  objc_storeStrong((id *)&self->_searchSessionData, 0);
  objc_storeStrong((id *)&self->_searchOriginationInfo, 0);
  objc_storeStrong((id *)&self->_searchEnrichmentRevisionMetadatas, 0);
  objc_storeStrong((id *)&self->_resultRefinementQuery, 0);
  objc_storeStrong((id *)&self->_recentRouteInfo, 0);
  objc_storeStrong((id *)&self->_previousSearchViewport, 0);
  objc_storeStrong((id *)&self->_paginationParameters, 0);
  objc_storeStrong((id *)&self->_evChargingParameters, 0);
  objc_storeStrong((id *)&self->_etaFilter, 0);
  objc_storeStrong((id *)&self->_enrichmentCampaignNamespace, 0);
  objc_storeStrong((id *)&self->_unknownFields, 0);

  objc_storeStrong((id *)&self->_reader, 0);
}

@end