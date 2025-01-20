@interface GEOPDSearchParameters
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (GEOPDSearchParameters)init;
- (GEOPDSearchParameters)initWithData:(id)a3;
- (GEOPDSearchParameters)initWithGeoMapItemIdentifier:(id)a3 categoryID:(id)a4 maxResults:(unsigned int)a5 traits:(id)a6 searchSessionData:(id)a7;
- (GEOPDSearchParameters)initWithSearchQuery:(id)a3 entryMetadata:(id)a4 metadata:(id)a5 autocompleteEntry:(id)a6 retainedSearch:(id)a7 maxResults:(unsigned int)a8 traits:(id)a9 routeInfo:(id)a10 searchSessionData:(id)a11;
- (char)_initWithDictionary:(uint64_t)a3 isJSON:;
- (id)_dictionaryRepresentation:(uint64_t)a1;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)etaFilter;
- (id)jsonRepresentation;
- (id)recentRouteInfo;
- (id)searchFilter;
- (id)searchOriginationInfo;
- (id)searchString;
- (id)suggestionEntry;
- (uint64_t)hasGreenTeaWithValue:(uint64_t)result;
- (uint64_t)searchType;
- (unint64_t)hash;
- (void)_addNoFlagsSearchEnrichmentRevisionMetadata:(uint64_t)a1;
- (void)_readEtaFilter;
- (void)_readKnownRefinementTypes;
- (void)_readPreviousSearchViewport;
- (void)_readPunchInHints;
- (void)_readRecentRouteInfo;
- (void)_readResultRefinementQuery;
- (void)_readSearchFilter;
- (void)_readSearchOriginationInfo;
- (void)_readSearchString;
- (void)_readSuggestionEntry;
- (void)_readSupportedPlaceSummaryFormatTypes;
- (void)_readSupportedRelatedEntitySectionTypes;
- (void)_readSupportedSearchSectionTypes;
- (void)_readSupportedSearchTierTypes;
- (void)_readViewportInfo;
- (void)addKnownRefinementType:(uint64_t)a1;
- (void)addPlaceSummaryRevision:(id)a3;
- (void)addSearchEnrichmentRevisionMetadata:(uint64_t)a1;
- (void)addSearchImplicitInfo:(id)a3 idenitfier:(id)a4 categoryID:(id)a5;
- (void)addSupportedPlaceSummaryFormatType:(uint64_t)a1;
- (void)addSupportedRelatedEntitySectionType:(uint64_t)a1;
- (void)addSupportedSearchSectionType:(uint64_t)a1;
- (void)addSupportedSearchTierType:(uint64_t)a1;
- (void)dealloc;
- (void)readAll:(uint64_t)a1;
- (void)setEnrichmentCampaignNamespace:(uint64_t)a1;
- (void)setEtaFilter:(uint64_t)a1;
- (void)setEvChargingParameters:(uint64_t)a1;
- (void)setInferredSignals:(uint64_t)a1;
- (void)setMostRecentAutocompleteRequestSessionData:(uint64_t)a1;
- (void)setPaginationParameters:(uint64_t)a1;
- (void)setPreviousSearchViewport:(uint64_t)a1;
- (void)setPunchInHints:(uint64_t)a1;
- (void)setRecentRouteInfo:(uint64_t)a1;
- (void)setResultRefinementQuery:(uint64_t)a1;
- (void)setRetainedSearch:(uint64_t)a1;
- (void)setSearchFilter:(uint64_t)a1;
- (void)setSearchLocationParameters:(uint64_t)a1;
- (void)setSearchOriginationInfo:(uint64_t)a1;
- (void)setSearchSessionData:(uint64_t)a1;
- (void)setSearchString:(uint64_t)a1;
- (void)setSearchStructureIntentType:(uint64_t)a1;
- (void)setSessionUserActionMetadata:(uint64_t)a1;
- (void)setSuggestionEntry:(uint64_t)a1;
- (void)setSuggestionEntryMetadata:(uint64_t)a1;
- (void)setSuggestionMetadata:(uint64_t)a1;
- (void)setViewportInfo:(uint64_t)a1;
- (void)writeTo:(id)a3;
@end

@implementation GEOPDSearchParameters

- (void)_readSupportedPlaceSummaryFormatTypes
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 336));
    if ((*(unsigned char *)(a1 + 373) & 0x40) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOPDSearchParametersReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readSupportedPlaceSummaryFormatTypes_tags_6766);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 336));
  }
}

- (void)readAll:(uint64_t)a1
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 336));
    v4 = *(void **)(a1 + 8);
    if (v4)
    {
      id v5 = v4;
      objc_sync_enter(v5);
      if (a2) {
        v6 = (int *)&readAll__recursiveTag_6838;
      }
      else {
        v6 = (int *)&readAll__nonRecursiveTag_6839;
      }
      GEOPDSearchParametersReadSpecified(a1, *(void *)(a1 + 8), v6);
      objc_sync_exit(v5);
    }
    if (a2) {
      _GEOPDSearchParametersCallReadAllRecursiveWithoutSynchronized(a1);
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 336));
  }
}

- (void)_readResultRefinementQuery
{
  os_unfair_lock_lock((os_unfair_lock_t)(a1 + 336));
  if ((*(unsigned char *)(a1 + 375) & 8) == 0)
  {
    v2 = *(void **)(a1 + 8);
    if (v2)
    {
      id v3 = v2;
      objc_sync_enter(v3);
      GEOPDSearchParametersReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readResultRefinementQuery_tags_6763);
      objc_sync_exit(v3);
    }
  }

  os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 336));
}

- (void)_readEtaFilter
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 336));
    if ((*(unsigned char *)(a1 + 374) & 8) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOPDSearchParametersReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readEtaFilter_tags_6761);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 336));
  }
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  uint64_t v213 = *MEMORY[0x1E4F143B8];
  if (a1)
  {
    -[GEOPDSearchParameters readAll:](a1, 1);
    v205 = [MEMORY[0x1E4F1CA60] dictionary];
    uint64_t v4 = *(void *)(a1 + 372);
    if ((v4 & 0x20) != 0)
    {
      uint64_t v5 = *(int *)(a1 + 360);
      if (v5 >= 4)
      {
        objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(int *)(a1 + 360));
        v6 = (__CFString *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v6 = off_1E53DD1C8[v5];
      }
      if (a2) {
        v7 = @"sortOrder";
      }
      else {
        v7 = @"sort_order";
      }
      [v205 setObject:v6 forKey:v7];

      uint64_t v4 = *(void *)(a1 + 372);
    }
    if ((v4 & 2) != 0)
    {
      v8 = [NSNumber numberWithUnsignedInt:*(unsigned int *)(a1 + 344)];
      if (a2) {
        v9 = @"maxResults";
      }
      else {
        v9 = @"max_results";
      }
      [v205 setObject:v8 forKey:v9];
    }
    v10 = -[GEOPDSearchParameters searchString]((id *)a1);
    if (v10)
    {
      if (a2) {
        v11 = @"searchString";
      }
      else {
        v11 = @"search_string";
      }
      [v205 setObject:v10 forKey:v11];
    }

    -[GEOPDSearchParameters _readViewportInfo](a1);
    id v12 = *(id *)(a1 + 320);
    v13 = v12;
    if (v12)
    {
      if (a2)
      {
        v14 = [v12 jsonRepresentation];
        v15 = @"viewportInfo";
      }
      else
      {
        v14 = [v12 dictionaryRepresentation];
        v15 = @"viewport_info";
      }
      id v16 = v14;

      [v205 setObject:v16 forKey:v15];
    }

    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 336));
    if ((*(unsigned char *)(a1 + 376) & 0x80) == 0)
    {
      v17 = *(void **)(a1 + 8);
      if (v17)
      {
        id v18 = v17;
        objc_sync_enter(v18);
        GEOPDSearchParametersReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readSuggestionMetadata_tags);
        objc_sync_exit(v18);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 336));
    id v19 = *(id *)(a1 + 312);
    v20 = v19;
    if (v19)
    {
      if (a2)
      {
        v21 = [v19 base64EncodedStringWithOptions:0];
        [v205 setObject:v21 forKey:@"suggestionMetadata"];
      }
      else
      {
        [v205 setObject:v19 forKey:@"suggestion_metadata"];
      }
    }

    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 336));
    if ((*(unsigned char *)(a1 + 376) & 0x20) == 0)
    {
      v22 = *(void **)(a1 + 8);
      if (v22)
      {
        id v23 = v22;
        objc_sync_enter(v23);
        GEOPDSearchParametersReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readSuggestionEntryMetadata_tags_6755);
        objc_sync_exit(v23);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 336));
    id v24 = *(id *)(a1 + 296);
    v25 = v24;
    if (v24)
    {
      if (a2)
      {
        v26 = [v24 base64EncodedStringWithOptions:0];
        [v205 setObject:v26 forKey:@"suggestionEntryMetadata"];
      }
      else
      {
        [v205 setObject:v24 forKey:@"suggestion_entry_metadata"];
      }
    }

    v27 = -[GEOPDSearchParameters suggestionEntry]((id *)a1);
    v28 = v27;
    if (v27)
    {
      if (a2)
      {
        v29 = [v27 jsonRepresentation];
        v30 = @"suggestionEntry";
      }
      else
      {
        v29 = [v27 dictionaryRepresentation];
        v30 = @"suggestion_entry";
      }
      id v31 = v29;

      [v205 setObject:v31 forKey:v30];
    }

    if ((*(unsigned char *)(a1 + 372) & 8) != 0)
    {
      uint64_t v32 = *(int *)(a1 + 352);
      if (v32 >= 6)
      {
        objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(int *)(a1 + 352));
        v33 = (__CFString *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v33 = off_1E53DCF38[v32];
      }
      if (a2) {
        v34 = @"searchType";
      }
      else {
        v34 = @"search_type";
      }
      [v205 setObject:v33 forKey:v34];
    }
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 336));
    if ((*(unsigned char *)(a1 + 376) & 8) == 0)
    {
      v35 = *(void **)(a1 + 8);
      if (v35)
      {
        id v36 = v35;
        objc_sync_enter(v36);
        GEOPDSearchParametersReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readSearchStructureIntentType_tags);
        objc_sync_exit(v36);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 336));
    id v37 = *(id *)(a1 + 280);
    v38 = v37;
    if (v37)
    {
      if (a2)
      {
        v39 = [v37 jsonRepresentation];
        v40 = @"searchStructureIntentType";
      }
      else
      {
        v39 = [v37 dictionaryRepresentation];
        v40 = @"search_structure_intent_type";
      }
      id v41 = v39;

      [v205 setObject:v41 forKey:v40];
    }

    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 336));
    if ((*(unsigned char *)(a1 + 375) & 0x80) == 0)
    {
      v42 = *(void **)(a1 + 8);
      if (v42)
      {
        id v43 = v42;
        objc_sync_enter(v43);
        GEOPDSearchParametersReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readSearchLocationParameters_tags);
        objc_sync_exit(v43);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 336));
    id v44 = *(id *)(a1 + 248);
    v45 = v44;
    if (v44)
    {
      if (a2)
      {
        v46 = [v44 jsonRepresentation];
        v47 = @"searchLocationParameters";
      }
      else
      {
        v46 = [v44 dictionaryRepresentation];
        v47 = @"search_location_parameters";
      }
      id v48 = v46;

      [v205 setObject:v48 forKey:v47];
    }

    v49 = -[GEOPDSearchParameters recentRouteInfo]((id *)a1);
    v50 = v49;
    if (v49)
    {
      if (a2)
      {
        v51 = [v49 jsonRepresentation];
        v52 = @"recentRouteInfo";
      }
      else
      {
        v51 = [v49 dictionaryRepresentation];
        v52 = @"recent_route_info";
      }
      id v53 = v51;

      [v205 setObject:v53 forKey:v52];
    }

    v54 = -[GEOPDSearchParameters searchFilter]((id *)a1);
    v55 = v54;
    if (v54)
    {
      if (a2)
      {
        v56 = [v54 jsonRepresentation];
        v57 = @"searchFilter";
      }
      else
      {
        v56 = [v54 dictionaryRepresentation];
        v57 = @"search_filter";
      }
      id v58 = v56;

      [v205 setObject:v58 forKey:v57];
    }

    uint64_t v59 = *(void *)(a1 + 372);
    if ((v59 & 0x80) != 0)
    {
      v60 = [NSNumber numberWithBool:*(unsigned __int8 *)(a1 + 365)];
      if (a2) {
        v61 = @"supportDymSuggestion";
      }
      else {
        v61 = @"support_dym_suggestion";
      }
      [v205 setObject:v60 forKey:v61];

      uint64_t v59 = *(void *)(a1 + 372);
    }
    if ((v59 & 0x40) != 0)
    {
      v62 = [NSNumber numberWithBool:*(unsigned __int8 *)(a1 + 364)];
      if (a2) {
        v63 = @"supportDirectionIntentSearch";
      }
      else {
        v63 = @"support_direction_intent_search";
      }
      [v205 setObject:v62 forKey:v63];
    }
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 336));
    if ((*(unsigned char *)(a1 + 375) & 0x10) == 0)
    {
      v64 = *(void **)(a1 + 8);
      if (v64)
      {
        id v65 = v64;
        objc_sync_enter(v65);
        GEOPDSearchParametersReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readRetainedSearch_tags_6758);
        objc_sync_exit(v65);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 336));
    id v66 = *(id *)(a1 + 224);
    v67 = v66;
    if (v66)
    {
      if (a2)
      {
        v68 = [v66 jsonRepresentation];
        v69 = @"retainedSearch";
      }
      else
      {
        v68 = [v66 dictionaryRepresentation];
        v69 = @"retained_search";
      }
      id v70 = v68;

      [v205 setObject:v70 forKey:v69];
    }

    uint64_t v71 = *(void *)(a1 + 372);
    if ((v71 & 0x800) != 0)
    {
      v72 = [NSNumber numberWithBool:*(unsigned __int8 *)(a1 + 369)];
      if (a2) {
        v73 = @"supportUnresolvedDirectionIntent";
      }
      else {
        v73 = @"support_unresolved_direction_intent";
      }
      [v205 setObject:v72 forKey:v73];

      uint64_t v71 = *(void *)(a1 + 372);
    }
    if ((v71 & 0x200) != 0)
    {
      v74 = [NSNumber numberWithBool:*(unsigned __int8 *)(a1 + 367)];
      if (a2) {
        v75 = @"supportSearchResultSection";
      }
      else {
        v75 = @"support_search_result_section";
      }
      [v205 setObject:v74 forKey:v75];

      uint64_t v71 = *(void *)(a1 + 372);
    }
    if ((v71 & 0x10) != 0)
    {
      uint64_t v76 = *(int *)(a1 + 356);
      if (v76 >= 3)
      {
        objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(int *)(a1 + 356));
        v77 = (__CFString *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v77 = off_1E53DCF68[v76];
      }
      if (a2) {
        v78 = @"sortDirection";
      }
      else {
        v78 = @"sort_direction";
      }
      [v205 setObject:v77 forKey:v78];
    }
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 336));
    if ((*(unsigned char *)(a1 + 374) & 0x20) == 0)
    {
      v79 = *(void **)(a1 + 8);
      if (v79)
      {
        id v80 = v79;
        objc_sync_enter(v80);
        GEOPDSearchParametersReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readInferredSignals_tags);
        objc_sync_exit(v80);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 336));
    id v81 = *(id *)(a1 + 168);
    v82 = v81;
    if (v81)
    {
      if (a2)
      {
        v83 = [v81 jsonRepresentation];
        v84 = @"inferredSignals";
      }
      else
      {
        v83 = [v81 dictionaryRepresentation];
        v84 = @"inferred_signals";
      }
      id v85 = v83;

      [v205 setObject:v85 forKey:v84];
    }

    if (*(void *)(a1 + 80))
    {
      v86 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:");
      v87 = (void *)(a1 + 72);
      if (*(void *)(a1 + 80))
      {
        unint64_t v88 = 0;
        do
        {
          uint64_t v89 = *(unsigned int *)(*v87 + 4 * v88);
          if (v89)
          {
            if (v89 == 1)
            {
              v90 = @"RELATED_ENTITY_SECTION_TYPE_COLLECTION";
            }
            else
            {
              objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", v89);
              v90 = (__CFString *)objc_claimAutoreleasedReturnValue();
            }
          }
          else
          {
            v90 = @"RELATED_ENTITY_SECTION_TYPE_UNKNOWN";
          }
          [v86 addObject:v90];

          ++v88;
          v87 = (void *)(a1 + 72);
        }
        while (v88 < *(void *)(a1 + 80));
      }
      if (a2) {
        v91 = @"supportedRelatedEntitySectionType";
      }
      else {
        v91 = @"supported_related_entity_section_type";
      }
      [v205 setObject:v86 forKey:v91];
    }
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 336));
    if ((*(unsigned char *)(a1 + 374) & 0x10) == 0)
    {
      v92 = *(void **)(a1 + 8);
      if (v92)
      {
        id v93 = v92;
        objc_sync_enter(v93);
        GEOPDSearchParametersReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readEvChargingParameters_tags_6760);
        objc_sync_exit(v93);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 336));
    id v94 = *(id *)(a1 + 160);
    v95 = v94;
    if (v94)
    {
      if (a2)
      {
        v96 = [v94 jsonRepresentation];
        v97 = @"evChargingParameters";
      }
      else
      {
        v96 = [v94 dictionaryRepresentation];
        v97 = @"ev_charging_parameters";
      }
      id v98 = v96;

      [v205 setObject:v98 forKey:v97];
    }

    v99 = -[GEOPDSearchParameters etaFilter]((id *)a1);
    v100 = v99;
    if (v99)
    {
      if (a2)
      {
        v101 = [v99 jsonRepresentation];
        v102 = @"etaFilter";
      }
      else
      {
        v101 = [v99 dictionaryRepresentation];
        v102 = @"eta_filter";
      }
      id v103 = v101;

      [v205 setObject:v103 forKey:v102];
    }

    if (*(void *)(a1 + 128))
    {
      v104 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:");
      v105 = (void *)(a1 + 120);
      if (*(void *)(a1 + 128))
      {
        unint64_t v106 = 0;
        do
        {
          uint64_t v107 = *(int *)(*v105 + 4 * v106);
          if (v107 >= 3)
          {
            objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", v107);
            v108 = (__CFString *)objc_claimAutoreleasedReturnValue();
          }
          else
          {
            v108 = off_1E53DCF80[v107];
          }
          [v104 addObject:v108];

          ++v106;
          v105 = (void *)(a1 + 120);
        }
        while (v106 < *(void *)(a1 + 128));
      }
      if (a2) {
        v109 = @"supportedSearchTierType";
      }
      else {
        v109 = @"supported_search_tier_type";
      }
      [v205 setObject:v104 forKey:v109];
    }
    if (*(unsigned char *)(a1 + 372))
    {
      v110 = [NSNumber numberWithUnsignedInt:*(unsigned int *)(a1 + 340)];
      if (a2) {
        v111 = @"auxiliaryTierNumResults";
      }
      else {
        v111 = @"auxiliary_tier_num_results";
      }
      [v205 setObject:v110 forKey:v111];
    }
    -[GEOPDSearchParameters _readResultRefinementQuery](a1);
    id v112 = *(id *)(a1 + 216);
    v113 = v112;
    if (v112)
    {
      if (a2)
      {
        v114 = [v112 jsonRepresentation];
        v115 = @"resultRefinementQuery";
      }
      else
      {
        v114 = [v112 dictionaryRepresentation];
        v115 = @"result_refinement_query";
      }
      id v116 = v114;

      [v205 setObject:v116 forKey:v115];
    }

    if (*(void *)(a1 + 32))
    {
      v117 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:");
      v118 = (void *)(a1 + 24);
      if (*(void *)(a1 + 32))
      {
        unint64_t v119 = 0;
        do
        {
          uint64_t v120 = *(int *)(*v118 + 4 * v119);
          if (v120 >= 7)
          {
            objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", v120);
            v121 = (__CFString *)objc_claimAutoreleasedReturnValue();
          }
          else
          {
            v121 = off_1E53DCF98[v120];
          }
          [v117 addObject:v121];

          ++v119;
          v118 = (void *)(a1 + 24);
        }
        while (v119 < *(void *)(a1 + 32));
      }
      if (a2) {
        v122 = @"knownRefinementType";
      }
      else {
        v122 = @"known_refinement_type";
      }
      [v205 setObject:v117 forKey:v122];
    }
    if ((*(unsigned char *)(a1 + 372) & 4) != 0)
    {
      uint64_t v123 = *(int *)(a1 + 348);
      if (v123 >= 0x24)
      {
        objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(int *)(a1 + 348));
        v124 = (__CFString *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v124 = off_1E53DCFD0[v123];
      }
      if (a2) {
        v125 = @"placeSummaryRevision";
      }
      else {
        v125 = @"place_summary_revision";
      }
      [v205 setObject:v124 forKey:v125];
    }
    -[GEOPDSearchParameters _readPreviousSearchViewport](a1);
    id v126 = *(id *)(a1 + 192);
    v127 = v126;
    if (v126)
    {
      if (a2)
      {
        v128 = [v126 jsonRepresentation];
        v129 = @"previousSearchViewport";
      }
      else
      {
        v128 = [v126 dictionaryRepresentation];
        v129 = @"previous_search_viewport";
      }
      id v130 = v128;

      [v205 setObject:v130 forKey:v129];
    }

    if (*(void *)(a1 + 56))
    {
      v131 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:");
      v132 = (void *)(a1 + 48);
      if (*(void *)(a1 + 56))
      {
        unint64_t v133 = 0;
        do
        {
          uint64_t v134 = *(int *)(*v132 + 4 * v133);
          if (v134 >= 5)
          {
            objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", v134);
            v135 = (__CFString *)objc_claimAutoreleasedReturnValue();
          }
          else
          {
            v135 = off_1E53DD0F0[v134];
          }
          [v131 addObject:v135];

          ++v133;
          v132 = (void *)(a1 + 48);
        }
        while (v133 < *(void *)(a1 + 56));
      }
      if (a2) {
        v136 = @"supportedPlaceSummaryFormatType";
      }
      else {
        v136 = @"supported_place_summary_format_type";
      }
      [v205 setObject:v131 forKey:v136];
    }
    if (*(void *)(a1 + 104))
    {
      v137 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:");
      v138 = (void *)(a1 + 96);
      if (*(void *)(a1 + 104))
      {
        unint64_t v139 = 0;
        do
        {
          uint64_t v140 = *(int *)(*v138 + 4 * v139);
          if (v140 >= 3)
          {
            objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", v140);
            v141 = (__CFString *)objc_claimAutoreleasedReturnValue();
          }
          else
          {
            v141 = off_1E53DD118[v140];
          }
          [v137 addObject:v141];

          ++v139;
          v138 = (void *)(a1 + 96);
        }
        while (v139 < *(void *)(a1 + 104));
      }
      if (a2) {
        v142 = @"supportedSearchSectionType";
      }
      else {
        v142 = @"supported_search_section_type";
      }
      [v205 setObject:v137 forKey:v142];
    }
    if (*(unsigned char *)(a1 + 373))
    {
      v143 = [NSNumber numberWithBool:*(unsigned __int8 *)(a1 + 366)];
      if (a2) {
        v144 = @"supportSearchEnrichment";
      }
      else {
        v144 = @"support_search_enrichment";
      }
      [v205 setObject:v143 forKey:v144];
    }
    v145 = -[GEOPDSearchParameters searchOriginationInfo]((id *)a1);
    v146 = v145;
    if (v145)
    {
      if (a2)
      {
        v147 = [v145 jsonRepresentation];
        v148 = @"searchOriginationInfo";
      }
      else
      {
        v147 = [v145 dictionaryRepresentation];
        v148 = @"search_origination_info";
      }
      id v149 = v147;

      [v205 setObject:v149 forKey:v148];
    }

    if ((*(unsigned char *)(a1 + 373) & 4) != 0)
    {
      v150 = [NSNumber numberWithBool:*(unsigned __int8 *)(a1 + 368)];
      if (a2) {
        v151 = @"supportStructuredRapAffordance";
      }
      else {
        v151 = @"support_structured_rap_affordance";
      }
      [v205 setObject:v150 forKey:v151];
    }
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 336));
    if ((*(unsigned char *)(a1 + 374) & 4) == 0)
    {
      v152 = *(void **)(a1 + 8);
      if (v152)
      {
        id v153 = v152;
        objc_sync_enter(v153);
        GEOPDSearchParametersReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readEnrichmentCampaignNamespace_tags_6769);
        objc_sync_exit(v153);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 336));
    id v154 = *(id *)(a1 + 144);
    if (v154)
    {
      if (a2) {
        v155 = @"enrichmentCampaignNamespace";
      }
      else {
        v155 = @"enrichment_campaign_namespace";
      }
      [v205 setObject:v154 forKey:v155];
    }

    if ([*(id *)(a1 + 232) count])
    {
      v156 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(*(id *)(a1 + 232), "count"));
      long long v208 = 0u;
      long long v209 = 0u;
      long long v210 = 0u;
      long long v211 = 0u;
      id v157 = *(id *)(a1 + 232);
      uint64_t v158 = [v157 countByEnumeratingWithState:&v208 objects:v212 count:16];
      if (v158)
      {
        uint64_t v159 = *(void *)v209;
        do
        {
          for (uint64_t i = 0; i != v158; ++i)
          {
            if (*(void *)v209 != v159) {
              objc_enumerationMutation(v157);
            }
            v161 = *(void **)(*((void *)&v208 + 1) + 8 * i);
            if (a2) {
              [v161 jsonRepresentation];
            }
            else {
            id v162 = [v161 dictionaryRepresentation];
            }

            [v156 addObject:v162];
          }
          uint64_t v158 = [v157 countByEnumeratingWithState:&v208 objects:v212 count:16];
        }
        while (v158);
      }

      if (a2) {
        v163 = @"searchEnrichmentRevisionMetadata";
      }
      else {
        v163 = @"search_enrichment_revision_metadata";
      }
      [v205 setObject:v156 forKey:v163];
    }
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 336));
    if ((*(unsigned char *)(a1 + 376) & 2) == 0)
    {
      v164 = *(void **)(a1 + 8);
      if (v164)
      {
        id v165 = v164;
        objc_sync_enter(v165);
        GEOPDSearchParametersReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readSearchSessionData_tags_6771);
        objc_sync_exit(v165);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 336));
    id v166 = *(id *)(a1 + 264);
    v167 = v166;
    if (v166)
    {
      if (a2)
      {
        v168 = [v166 jsonRepresentation];
        v169 = @"searchSessionData";
      }
      else
      {
        v168 = [v166 dictionaryRepresentation];
        v169 = @"search_session_data";
      }
      id v170 = v168;

      [v205 setObject:v170 forKey:v169];
    }

    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 336));
    if ((*(unsigned char *)(a1 + 374) & 0x40) == 0)
    {
      v171 = *(void **)(a1 + 8);
      if (v171)
      {
        id v172 = v171;
        objc_sync_enter(v172);
        GEOPDSearchParametersReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readMostRecentAutocompleteRequestSessionData_tags);
        objc_sync_exit(v172);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 336));
    id v173 = *(id *)(a1 + 176);
    v174 = v173;
    if (v173)
    {
      if (a2)
      {
        v175 = [v173 jsonRepresentation];
        v176 = @"mostRecentAutocompleteRequestSessionData";
      }
      else
      {
        v175 = [v173 dictionaryRepresentation];
        v176 = @"most_recent_autocomplete_request_session_data";
      }
      id v177 = v175;

      [v205 setObject:v177 forKey:v176];
    }

    -[GEOPDSearchParameters _readPunchInHints](a1);
    id v178 = *(id *)(a1 + 200);
    v179 = v178;
    if (v178)
    {
      if (a2)
      {
        v180 = [v178 jsonRepresentation];
        v181 = @"punchInHints";
      }
      else
      {
        v180 = [v178 dictionaryRepresentation];
        v181 = @"punch_in_hints";
      }
      id v182 = v180;

      [v205 setObject:v182 forKey:v181];
    }

    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 336));
    if ((*(unsigned char *)(a1 + 376) & 0x10) == 0)
    {
      v183 = *(void **)(a1 + 8);
      if (v183)
      {
        id v184 = v183;
        objc_sync_enter(v184);
        GEOPDSearchParametersReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readSessionUserActionMetadata_tags_6773);
        objc_sync_exit(v184);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 336));
    id v185 = *(id *)(a1 + 288);
    v186 = v185;
    if (v185)
    {
      if (a2)
      {
        v187 = [v185 jsonRepresentation];
        v188 = @"sessionUserActionMetadata";
      }
      else
      {
        v187 = [v185 dictionaryRepresentation];
        v188 = @"session_user_action_metadata";
      }
      id v189 = v187;

      [v205 setObject:v189 forKey:v188];
    }

    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 336));
    if ((*(unsigned char *)(a1 + 374) & 0x80) == 0)
    {
      v190 = *(void **)(a1 + 8);
      if (v190)
      {
        id v191 = v190;
        objc_sync_enter(v191);
        GEOPDSearchParametersReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readPaginationParameters_tags_6774);
        objc_sync_exit(v191);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 336));
    id v192 = *(id *)(a1 + 184);
    v193 = v192;
    if (v192)
    {
      if (a2)
      {
        v194 = [v192 jsonRepresentation];
        v195 = @"paginationParameters";
      }
      else
      {
        v194 = [v192 dictionaryRepresentation];
        v195 = @"pagination_parameters";
      }
      id v196 = v194;

      [v205 setObject:v196 forKey:v195];
    }

    v197 = *(void **)(a1 + 16);
    if (v197)
    {
      v198 = [v197 dictionaryRepresentation];
      v199 = v198;
      if (a2)
      {
        v200 = objc_msgSend(MEMORY[0x1E4F1CA60], "dictionaryWithCapacity:", objc_msgSend(v198, "count"));
        v206[0] = MEMORY[0x1E4F143A8];
        v206[1] = 3221225472;
        v206[2] = __51__GEOPDSearchParameters__dictionaryRepresentation___block_invoke;
        v206[3] = &unk_1E53D8860;
        id v201 = v200;
        id v207 = v201;
        [v199 enumerateKeysAndObjectsUsingBlock:v206];
        id v202 = v201;
      }
      else
      {
        id v202 = v198;
      }
      [v205 setObject:v202 forKey:@"Unknown Fields"];
    }
    id v203 = v205;
  }
  else
  {
    id v203 = 0;
  }

  return v203;
}

- (void)setEnrichmentCampaignNamespace:(uint64_t)a1
{
  id v4 = a2;
  *(void *)(a1 + 372) |= 0x20000040000uLL;
  objc_storeStrong((id *)(a1 + 144), a2);
}

- (void)setPreviousSearchViewport:(uint64_t)a1
{
  id v4 = a2;
  if (a1)
  {
    *(void *)(a1 + 372) |= 0x20001000000uLL;
    objc_storeStrong((id *)(a1 + 192), a2);
  }
}

- (uint64_t)hasGreenTeaWithValue:(uint64_t)result
{
  if (result)
  {
    uint64_t v3 = result;
    -[GEOPDSearchParameters _readPreviousSearchViewport](result);
    if ([*(id *)(v3 + 192) hasGreenTeaWithValue:a2]) {
      return 1;
    }
    -[GEOPDSearchParameters _readPunchInHints](v3);
    if (-[GEOPDSPunchInHints hasGreenTeaWithValue:](*(void *)(v3 + 200), a2)) {
      return 1;
    }
    -[GEOPDSearchParameters _readResultRefinementQuery](v3);
    if ([*(id *)(v3 + 216) hasGreenTeaWithValue:a2]) {
      return 1;
    }
    -[GEOPDSearchParameters _readSearchFilter](v3);
    if (-[GEOPDSSearchFilter hasGreenTeaWithValue:](*(void *)(v3 + 240), a2)) {
      return 1;
    }
    -[GEOPDSearchParameters _readSearchOriginationInfo](v3);
    if (-[GEOPDSearchOriginationInfo hasGreenTeaWithValue:](*(void *)(v3 + 256), a2)) {
      return 1;
    }
    -[GEOPDSearchParameters _readSuggestionEntry](v3);
    if ([*(id *)(v3 + 304) hasGreenTeaWithValue:a2])
    {
      return 1;
    }
    else
    {
      -[GEOPDSearchParameters _readViewportInfo](v3);
      id v4 = *(void **)(v3 + 320);
      return [v4 hasGreenTeaWithValue:a2];
    }
  }
  return result;
}

- (GEOPDSearchParameters)init
{
  v6.receiver = self;
  v6.super_class = (Class)GEOPDSearchParameters;
  v2 = [(GEOPDSearchParameters *)&v6 init];
  uint64_t v3 = v2;
  if (v2)
  {
    v2->_readerLock._os_unfair_lock_opaque = 0;
    id v4 = v2;
  }

  return v3;
}

- (GEOPDSearchParameters)initWithData:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)GEOPDSearchParameters;
  uint64_t v3 = [(GEOPDSearchParameters *)&v7 initWithData:a3];
  id v4 = v3;
  if (v3)
  {
    v3->_readerLock._os_unfair_lock_opaque = 0;
    uint64_t v5 = v3;
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
  v3.super_class = (Class)GEOPDSearchParameters;
  [(GEOPDSearchParameters *)&v3 dealloc];
}

- (void)_readSearchString
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 336));
    if ((*(unsigned char *)(a1 + 376) & 4) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOPDSearchParametersReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readSearchString_tags_6753);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 336));
  }
}

- (id)searchString
{
  if (a1)
  {
    v2 = a1;
    -[GEOPDSearchParameters _readSearchString]((uint64_t)a1);
    a1 = (id *)v2[34];
    uint64_t v1 = vars8;
  }
  return a1;
}

- (void)setSearchString:(uint64_t)a1
{
  id v4 = a2;
  if (a1)
  {
    *(void *)(a1 + 372) |= 0x20400000000uLL;
    objc_storeStrong((id *)(a1 + 272), a2);
  }
}

- (void)_readViewportInfo
{
  os_unfair_lock_lock((os_unfair_lock_t)(a1 + 336));
  if ((*(unsigned char *)(a1 + 377) & 1) == 0)
  {
    v2 = *(void **)(a1 + 8);
    if (v2)
    {
      id v3 = v2;
      objc_sync_enter(v3);
      GEOPDSearchParametersReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readViewportInfo_tags_6754);
      objc_sync_exit(v3);
    }
  }

  os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 336));
}

- (void)setViewportInfo:(uint64_t)a1
{
  id v4 = a2;
  if (a1)
  {
    *(void *)(a1 + 372) |= 0x30000000000uLL;
    objc_storeStrong((id *)(a1 + 320), a2);
  }
}

- (void)setSuggestionMetadata:(uint64_t)a1
{
  id v4 = a2;
  if (a1)
  {
    *(void *)(a1 + 372) |= 0x28000000000uLL;
    objc_storeStrong((id *)(a1 + 312), a2);
  }
}

- (void)setSuggestionEntryMetadata:(uint64_t)a1
{
  id v4 = a2;
  if (a1)
  {
    *(void *)(a1 + 372) |= 0x22000000000uLL;
    objc_storeStrong((id *)(a1 + 296), a2);
  }
}

- (void)_readSuggestionEntry
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 336));
    if ((*(unsigned char *)(a1 + 376) & 0x40) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOPDSearchParametersReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readSuggestionEntry_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 336));
  }
}

- (id)suggestionEntry
{
  if (a1)
  {
    v2 = a1;
    -[GEOPDSearchParameters _readSuggestionEntry]((uint64_t)a1);
    a1 = (id *)v2[38];
    uint64_t v1 = vars8;
  }
  return a1;
}

- (void)setSuggestionEntry:(uint64_t)a1
{
  id v4 = a2;
  if (a1)
  {
    *(void *)(a1 + 372) |= 0x24000000000uLL;
    objc_storeStrong((id *)(a1 + 304), a2);
  }
}

- (uint64_t)searchType
{
  if (result)
  {
    uint64_t v1 = result;
    os_unfair_lock_lock_with_options();
    uint64_t v2 = *(void *)(v1 + 372);
    os_unfair_lock_unlock((os_unfair_lock_t)(v1 + 336));
    if ((v2 & 8) != 0) {
      return *(unsigned int *)(v1 + 352);
    }
    else {
      return 0;
    }
  }
  return result;
}

- (void)setSearchStructureIntentType:(uint64_t)a1
{
  id v4 = a2;
  *(void *)(a1 + 372) |= 0x20800000000uLL;
  objc_storeStrong((id *)(a1 + 280), a2);
}

- (void)setSearchLocationParameters:(uint64_t)a1
{
  id v4 = a2;
  *(void *)(a1 + 372) |= 0x20080000000uLL;
  objc_storeStrong((id *)(a1 + 248), a2);
}

- (void)_readRecentRouteInfo
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 336));
    if ((*(unsigned char *)(a1 + 375) & 4) == 0)
    {
      uint64_t v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOPDSearchParametersReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readRecentRouteInfo_tags_6756);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 336));
  }
}

- (id)recentRouteInfo
{
  if (a1)
  {
    uint64_t v2 = a1;
    -[GEOPDSearchParameters _readRecentRouteInfo]((uint64_t)a1);
    a1 = (id *)v2[26];
    uint64_t v1 = vars8;
  }
  return a1;
}

- (void)setRecentRouteInfo:(uint64_t)a1
{
  id v4 = a2;
  if (a1)
  {
    *(void *)(a1 + 372) |= 0x20004000000uLL;
    objc_storeStrong((id *)(a1 + 208), a2);
  }
}

- (void)_readSearchFilter
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 336));
    if ((*(unsigned char *)(a1 + 375) & 0x40) == 0)
    {
      uint64_t v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOPDSearchParametersReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readSearchFilter_tags_6757);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 336));
  }
}

- (id)searchFilter
{
  if (a1)
  {
    uint64_t v2 = a1;
    -[GEOPDSearchParameters _readSearchFilter]((uint64_t)a1);
    a1 = (id *)v2[30];
    uint64_t v1 = vars8;
  }
  return a1;
}

- (void)setSearchFilter:(uint64_t)a1
{
  id v4 = a2;
  if (a1)
  {
    *(void *)(a1 + 372) |= 0x20040000000uLL;
    objc_storeStrong((id *)(a1 + 240), a2);
  }
}

- (void)setRetainedSearch:(uint64_t)a1
{
  id v4 = a2;
  if (a1)
  {
    *(void *)(a1 + 372) |= 0x20010000000uLL;
    objc_storeStrong((id *)(a1 + 224), a2);
  }
}

- (void)setInferredSignals:(uint64_t)a1
{
  id v4 = a2;
  *(void *)(a1 + 372) |= 0x20000200000uLL;
  objc_storeStrong((id *)(a1 + 168), a2);
}

- (void)_readSupportedRelatedEntitySectionTypes
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 336));
    if ((*(unsigned char *)(a1 + 373) & 0x80) == 0)
    {
      uint64_t v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOPDSearchParametersReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readSupportedRelatedEntitySectionTypes_tags_6759);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 336));
  }
}

- (void)addSupportedRelatedEntitySectionType:(uint64_t)a1
{
  if (a1)
  {
    -[GEOPDSearchParameters _readSupportedRelatedEntitySectionTypes](a1);
    PBRepeatedInt32Add();
    os_unfair_lock_lock_with_options();
    *(void *)(a1 + 372) |= 0x8000uLL;
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 336));
    *(void *)(a1 + 372) |= 0x20000000000uLL;
  }
}

- (void)setEvChargingParameters:(uint64_t)a1
{
  id v4 = a2;
  if (a1)
  {
    *(void *)(a1 + 372) |= 0x20000100000uLL;
    objc_storeStrong((id *)(a1 + 160), a2);
  }
}

- (id)etaFilter
{
  if (a1)
  {
    uint64_t v2 = a1;
    -[GEOPDSearchParameters _readEtaFilter]((uint64_t)a1);
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
    *(void *)(a1 + 372) |= 0x20000080000uLL;
    objc_storeStrong((id *)(a1 + 152), a2);
  }
}

- (void)_readSupportedSearchTierTypes
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 336));
    if ((*(unsigned char *)(a1 + 374) & 2) == 0)
    {
      uint64_t v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOPDSearchParametersReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readSupportedSearchTierTypes_tags_6762);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 336));
  }
}

- (void)addSupportedSearchTierType:(uint64_t)a1
{
  if (a1)
  {
    -[GEOPDSearchParameters _readSupportedSearchTierTypes](a1);
    PBRepeatedInt32Add();
    os_unfair_lock_lock_with_options();
    *(void *)(a1 + 372) |= 0x20000uLL;
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 336));
    *(void *)(a1 + 372) |= 0x20000000000uLL;
  }
}

- (void)setResultRefinementQuery:(uint64_t)a1
{
  id v4 = a2;
  if (a1)
  {
    *(void *)(a1 + 372) |= 0x20008000000uLL;
    objc_storeStrong((id *)(a1 + 216), a2);
  }
}

- (void)_readKnownRefinementTypes
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 336));
    if ((*(unsigned char *)(a1 + 373) & 0x20) == 0)
    {
      uint64_t v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOPDSearchParametersReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readKnownRefinementTypes_tags_6764);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 336));
  }
}

- (void)addKnownRefinementType:(uint64_t)a1
{
  if (a1)
  {
    -[GEOPDSearchParameters _readKnownRefinementTypes](a1);
    PBRepeatedInt32Add();
    os_unfair_lock_lock_with_options();
    *(void *)(a1 + 372) |= 0x2000uLL;
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 336));
    *(void *)(a1 + 372) |= 0x20000000000uLL;
  }
}

- (void)_readPreviousSearchViewport
{
  os_unfair_lock_lock((os_unfair_lock_t)(a1 + 336));
  if ((*(unsigned char *)(a1 + 375) & 1) == 0)
  {
    uint64_t v2 = *(void **)(a1 + 8);
    if (v2)
    {
      id v3 = v2;
      objc_sync_enter(v3);
      GEOPDSearchParametersReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readPreviousSearchViewport_tags_6765);
      objc_sync_exit(v3);
    }
  }

  os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 336));
}

- (void)addSupportedPlaceSummaryFormatType:(uint64_t)a1
{
  if (a1)
  {
    -[GEOPDSearchParameters _readSupportedPlaceSummaryFormatTypes](a1);
    PBRepeatedInt32Add();
    os_unfair_lock_lock_with_options();
    *(void *)(a1 + 372) |= 0x4000uLL;
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 336));
    *(void *)(a1 + 372) |= 0x20000000000uLL;
  }
}

- (void)_readSupportedSearchSectionTypes
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 336));
    if ((*(unsigned char *)(a1 + 374) & 1) == 0)
    {
      uint64_t v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOPDSearchParametersReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readSupportedSearchSectionTypes_tags_6767);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 336));
  }
}

- (void)addSupportedSearchSectionType:(uint64_t)a1
{
  if (a1)
  {
    -[GEOPDSearchParameters _readSupportedSearchSectionTypes](a1);
    PBRepeatedInt32Add();
    os_unfair_lock_lock_with_options();
    *(void *)(a1 + 372) |= 0x10000uLL;
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 336));
    *(void *)(a1 + 372) |= 0x20000000000uLL;
  }
}

- (void)_readSearchOriginationInfo
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 336));
    if ((*(unsigned char *)(a1 + 376) & 1) == 0)
    {
      uint64_t v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOPDSearchParametersReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readSearchOriginationInfo_tags_6768);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 336));
  }
}

- (id)searchOriginationInfo
{
  if (a1)
  {
    uint64_t v2 = a1;
    -[GEOPDSearchParameters _readSearchOriginationInfo]((uint64_t)a1);
    a1 = (id *)v2[32];
    uint64_t v1 = vars8;
  }
  return a1;
}

- (void)setSearchOriginationInfo:(uint64_t)a1
{
  id v4 = a2;
  if (a1)
  {
    *(void *)(a1 + 372) |= 0x20100000000uLL;
    objc_storeStrong((id *)(a1 + 256), a2);
  }
}

- (void)addSearchEnrichmentRevisionMetadata:(uint64_t)a1
{
  if (a1)
  {
    id v3 = a2;
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 336));
    if ((*(unsigned char *)(a1 + 375) & 0x20) == 0)
    {
      id v4 = *(void **)(a1 + 8);
      if (v4)
      {
        id v5 = v4;
        objc_sync_enter(v5);
        GEOPDSearchParametersReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readSearchEnrichmentRevisionMetadatas_tags_6770);
        objc_sync_exit(v5);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 336));
    -[GEOPDSearchParameters _addNoFlagsSearchEnrichmentRevisionMetadata:](a1, v3);

    os_unfair_lock_lock_with_options();
    *(void *)(a1 + 372) |= 0x20000000uLL;
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 336));
    *(void *)(a1 + 372) |= 0x20000000000uLL;
  }
}

- (void)_addNoFlagsSearchEnrichmentRevisionMetadata:(uint64_t)a1
{
  id v3 = a2;
  if (a1)
  {
    id v4 = *(void **)(a1 + 232);
    id v7 = v3;
    if (!v4)
    {
      id v5 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
      objc_super v6 = *(void **)(a1 + 232);
      *(void *)(a1 + 232) = v5;

      id v4 = *(void **)(a1 + 232);
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
    *(void *)(a1 + 372) |= 0x20200000000uLL;
    objc_storeStrong((id *)(a1 + 264), a2);
  }
}

- (void)setMostRecentAutocompleteRequestSessionData:(uint64_t)a1
{
  id v4 = a2;
  if (a1)
  {
    *(void *)(a1 + 372) |= 0x20000400000uLL;
    objc_storeStrong((id *)(a1 + 176), a2);
  }
}

- (void)_readPunchInHints
{
  os_unfair_lock_lock((os_unfair_lock_t)(a1 + 336));
  if ((*(unsigned char *)(a1 + 375) & 2) == 0)
  {
    uint64_t v2 = *(void **)(a1 + 8);
    if (v2)
    {
      id v3 = v2;
      objc_sync_enter(v3);
      GEOPDSearchParametersReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readPunchInHints_tags_6772);
      objc_sync_exit(v3);
    }
  }

  os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 336));
}

- (void)setPunchInHints:(uint64_t)a1
{
  id v4 = a2;
  if (a1)
  {
    *(void *)(a1 + 372) |= 0x20002000000uLL;
    objc_storeStrong((id *)(a1 + 200), a2);
  }
}

- (void)setSessionUserActionMetadata:(uint64_t)a1
{
  id v4 = a2;
  if (a1)
  {
    *(void *)(a1 + 372) |= 0x21000000000uLL;
    objc_storeStrong((id *)(a1 + 288), a2);
  }
}

- (void)setPaginationParameters:(uint64_t)a1
{
  id v4 = a2;
  *(void *)(a1 + 372) |= 0x20000800000uLL;
  objc_storeStrong((id *)(a1 + 184), a2);
}

- (id)description
{
  id v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)GEOPDSearchParameters;
  id v4 = [(GEOPDSearchParameters *)&v8 description];
  id v5 = [(GEOPDSearchParameters *)self dictionaryRepresentation];
  objc_super v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEOPDSearchParameters _dictionaryRepresentation:]((uint64_t)self, 0);
}

- (id)jsonRepresentation
{
  return -[GEOPDSearchParameters _dictionaryRepresentation:]((uint64_t)self, 1);
}

void __51__GEOPDSearchParameters__dictionaryRepresentation___block_invoke(uint64_t a1, void *a2, void *a3)
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

- (char)_initWithDictionary:(uint64_t)a3 isJSON:
{
  uint64_t v230 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  objc_super v6 = (char *)(id)[a1 init];

  if (!v6) {
    goto LABEL_464;
  }
  if (a3) {
    id v7 = @"sortOrder";
  }
  else {
    id v7 = @"sort_order";
  }
  objc_super v8 = [v5 objectForKeyedSubscript:v7];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v9 = v8;
    if ([v9 isEqualToString:@"RELEVANCE"])
    {
      int v10 = 0;
    }
    else if ([v9 isEqualToString:@"RATING"])
    {
      int v10 = 1;
    }
    else if ([v9 isEqualToString:@"DISTANCE"])
    {
      int v10 = 2;
    }
    else if ([v9 isEqualToString:@"PRICE"])
    {
      int v10 = 3;
    }
    else
    {
      int v10 = 0;
    }
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0) {
      goto LABEL_19;
    }
    int v10 = [v8 intValue];
  }
  *(void *)(v6 + 372) |= 0x20000000020uLL;
  *((_DWORD *)v6 + 90) = v10;
LABEL_19:

  if (a3) {
    v11 = @"maxResults";
  }
  else {
    v11 = @"max_results";
  }
  id v12 = [v5 objectForKeyedSubscript:v11];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    int v13 = [v12 unsignedIntValue];
    *(void *)(v6 + 372) |= 0x20000000002uLL;
    *((_DWORD *)v6 + 86) = v13;
  }

  if (a3) {
    v14 = @"searchString";
  }
  else {
    v14 = @"search_string";
  }
  v15 = [v5 objectForKeyedSubscript:v14];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v16 = (void *)[v15 copy];
    -[GEOPDSearchParameters setSearchString:]((uint64_t)v6, v16);
  }
  if (a3) {
    v17 = @"viewportInfo";
  }
  else {
    v17 = @"viewport_info";
  }
  id v18 = [v5 objectForKeyedSubscript:v17];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v19 = [GEOPDViewportInfo alloc];
    if (a3) {
      v20 = [(GEOPDViewportInfo *)v19 initWithJSON:v18];
    }
    else {
      v20 = [(GEOPDViewportInfo *)v19 initWithDictionary:v18];
    }
    v21 = v20;
    -[GEOPDSearchParameters setViewportInfo:]((uint64_t)v6, v20);
  }
  if (a3) {
    v22 = @"suggestionMetadata";
  }
  else {
    v22 = @"suggestion_metadata";
  }
  id v23 = [v5 objectForKeyedSubscript:v22];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v24 = (void *)[objc_alloc(MEMORY[0x1E4F1C9B8]) initWithBase64EncodedString:v23 options:0];
    -[GEOPDSearchParameters setSuggestionMetadata:]((uint64_t)v6, v24);
  }
  if (a3) {
    v25 = @"suggestionEntryMetadata";
  }
  else {
    v25 = @"suggestion_entry_metadata";
  }
  v26 = [v5 objectForKeyedSubscript:v25];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v27 = (void *)[objc_alloc(MEMORY[0x1E4F1C9B8]) initWithBase64EncodedString:v26 options:0];
    -[GEOPDSearchParameters setSuggestionEntryMetadata:]((uint64_t)v6, v27);
  }
  if (a3) {
    v28 = @"suggestionEntry";
  }
  else {
    v28 = @"suggestion_entry";
  }
  v29 = [v5 objectForKeyedSubscript:v28];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v30 = [GEOPDAutocompleteEntry alloc];
    if (a3) {
      id v31 = [(GEOPDAutocompleteEntry *)v30 initWithJSON:v29];
    }
    else {
      id v31 = [(GEOPDAutocompleteEntry *)v30 initWithDictionary:v29];
    }
    uint64_t v32 = v31;
    -[GEOPDSearchParameters setSuggestionEntry:]((uint64_t)v6, v31);
  }
  if (a3) {
    v33 = @"searchType";
  }
  else {
    v33 = @"search_type";
  }
  v34 = [v5 objectForKeyedSubscript:v33];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v35 = v34;
    if ([v35 isEqualToString:@"SEARCH_TYPE_UNKNOWN"])
    {
      int v36 = 0;
    }
    else if ([v35 isEqualToString:@"SEARCH_TYPE_DEFAULT"])
    {
      int v36 = 1;
    }
    else if ([v35 isEqualToString:@"SEARCH_TYPE_REDO"])
    {
      int v36 = 2;
    }
    else if ([v35 isEqualToString:@"SEARCH_TYPE_BRAND_PROFILE"])
    {
      int v36 = 3;
    }
    else if ([v35 isEqualToString:@"SEARCH_TYPE_AUTO_REDO"])
    {
      int v36 = 4;
    }
    else if ([v35 isEqualToString:@"SEARCH_TYPE_BEACH_AND_RELATED_CONCEPT"])
    {
      int v36 = 5;
    }
    else
    {
      int v36 = 0;
    }
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0) {
      goto LABEL_76;
    }
    int v36 = [v34 intValue];
  }
  *(void *)(v6 + 372) |= 0x20000000008uLL;
  *((_DWORD *)v6 + 88) = v36;
LABEL_76:

  if (a3) {
    id v37 = @"searchStructureIntentType";
  }
  else {
    id v37 = @"search_structure_intent_type";
  }
  v38 = [v5 objectForKeyedSubscript:v37];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v39 = [GEOPDSSearchStructureIntentRequestType alloc];
    if (v39) {
      v40 = (void *)-[GEOPDSSearchStructureIntentRequestType _initWithDictionary:isJSON:]((uint64_t)v39, v38, a3);
    }
    else {
      v40 = 0;
    }
    -[GEOPDSearchParameters setSearchStructureIntentType:]((uint64_t)v6, v40);
  }
  if (a3) {
    id v41 = @"searchLocationParameters";
  }
  else {
    id v41 = @"search_location_parameters";
  }
  v42 = [v5 objectForKeyedSubscript:v41];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v43 = [GEOPDSSearchLocationParameters alloc];
    if (v43) {
      id v44 = (void *)-[GEOPDSSearchLocationParameters _initWithDictionary:isJSON:]((uint64_t)v43, v42, a3);
    }
    else {
      id v44 = 0;
    }
    -[GEOPDSearchParameters setSearchLocationParameters:]((uint64_t)v6, v44);
  }
  if (a3) {
    v45 = @"recentRouteInfo";
  }
  else {
    v45 = @"recent_route_info";
  }
  v46 = [v5 objectForKeyedSubscript:v45];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v47 = [GEOPDRecentRouteInfo alloc];
    if (v47) {
      id v48 = (void *)-[GEOPDRecentRouteInfo _initWithDictionary:isJSON:](v47, v46, a3);
    }
    else {
      id v48 = 0;
    }
    -[GEOPDSearchParameters setRecentRouteInfo:]((uint64_t)v6, v48);
  }
  if (a3) {
    v49 = @"searchFilter";
  }
  else {
    v49 = @"search_filter";
  }
  v50 = [v5 objectForKeyedSubscript:v49];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v51 = [GEOPDSSearchFilter alloc];
    if (v51) {
      v52 = (void *)-[GEOPDSSearchFilter _initWithDictionary:isJSON:](v51, v50, a3);
    }
    else {
      v52 = 0;
    }
    -[GEOPDSearchParameters setSearchFilter:]((uint64_t)v6, v52);
  }
  if (a3) {
    id v53 = @"supportDymSuggestion";
  }
  else {
    id v53 = @"support_dym_suggestion";
  }
  v54 = [v5 objectForKeyedSubscript:v53];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    char v55 = [v54 BOOLValue];
    *(void *)(v6 + 372) |= 0x20000000080uLL;
    v6[365] = v55;
  }

  if (a3) {
    v56 = @"supportDirectionIntentSearch";
  }
  else {
    v56 = @"support_direction_intent_search";
  }
  v57 = [v5 objectForKeyedSubscript:v56];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    char v58 = [v57 BOOLValue];
    *(void *)(v6 + 372) |= 0x20000000040uLL;
    v6[364] = v58;
  }

  if (a3) {
    uint64_t v59 = @"retainedSearch";
  }
  else {
    uint64_t v59 = @"retained_search";
  }
  v60 = [v5 objectForKeyedSubscript:v59];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v61 = [GEOPDRetainedSearchMetadata alloc];
    if (v61) {
      v62 = (void *)-[GEOPDRetainedSearchMetadata _initWithDictionary:isJSON:]((uint64_t)v61, v60, a3);
    }
    else {
      v62 = 0;
    }
    -[GEOPDSearchParameters setRetainedSearch:]((uint64_t)v6, v62);
  }
  if (a3) {
    v63 = @"supportUnresolvedDirectionIntent";
  }
  else {
    v63 = @"support_unresolved_direction_intent";
  }
  v64 = [v5 objectForKeyedSubscript:v63];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    char v65 = [v64 BOOLValue];
    *(void *)(v6 + 372) |= 0x20000000800uLL;
    v6[369] = v65;
  }

  if (a3) {
    id v66 = @"supportSearchResultSection";
  }
  else {
    id v66 = @"support_search_result_section";
  }
  v67 = [v5 objectForKeyedSubscript:v66];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    char v68 = [v67 BOOLValue];
    *(void *)(v6 + 372) |= 0x20000000200uLL;
    v6[367] = v68;
  }

  if (a3) {
    v69 = @"sortDirection";
  }
  else {
    v69 = @"sort_direction";
  }
  id v70 = [v5 objectForKeyedSubscript:v69];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v71 = v70;
    if ([v71 isEqualToString:@"SORT_DIRECTION_UNKNOWN"])
    {
      int v72 = 0;
    }
    else if ([v71 isEqualToString:@"SORT_DIRECTION_ASCENDING"])
    {
      int v72 = 1;
    }
    else if ([v71 isEqualToString:@"SORT_DIRECTION_DESCENDING"])
    {
      int v72 = 2;
    }
    else
    {
      int v72 = 0;
    }
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0) {
      goto LABEL_146;
    }
    int v72 = [v70 intValue];
  }
  *(void *)(v6 + 372) |= 0x20000000010uLL;
  *((_DWORD *)v6 + 89) = v72;
LABEL_146:

  if (a3) {
    v73 = @"inferredSignals";
  }
  else {
    v73 = @"inferred_signals";
  }
  v74 = [v5 objectForKeyedSubscript:v73];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v75 = [GEOPDSInferredSignals alloc];
    if (v75) {
      uint64_t v76 = -[GEOPDSInferredSignals _initWithDictionary:isJSON:](v75, v74, a3);
    }
    else {
      uint64_t v76 = 0;
    }
    -[GEOPDSearchParameters setInferredSignals:]((uint64_t)v6, v76);
  }
  if (a3) {
    v77 = @"supportedRelatedEntitySectionType";
  }
  else {
    v77 = @"supported_related_entity_section_type";
  }
  v78 = [v5 objectForKeyedSubscript:v77];
  objc_opt_class();
  id v198 = v5;
  int v199 = a3;
  if (objc_opt_isKindOfClass())
  {
    long long v222 = 0u;
    long long v223 = 0u;
    long long v220 = 0u;
    long long v221 = 0u;
    v193 = v78;
    id v79 = v78;
    uint64_t v80 = [v79 countByEnumeratingWithState:&v220 objects:v229 count:16];
    if (!v80) {
      goto LABEL_172;
    }
    uint64_t v81 = v80;
    uint64_t v82 = *(void *)v221;
    while (1)
    {
      for (uint64_t i = 0; i != v81; ++i)
      {
        if (*(void *)v221 != v82) {
          objc_enumerationMutation(v79);
        }
        v84 = *(void **)(*((void *)&v220 + 1) + 8 * i);
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          id v85 = v84;
          if (([v85 isEqualToString:@"RELATED_ENTITY_SECTION_TYPE_UNKNOWN"] & 1) == 0) {
            [v85 isEqualToString:@"RELATED_ENTITY_SECTION_TYPE_COLLECTION"];
          }
        }
        else
        {
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0) {
            continue;
          }
          [v84 intValue];
        }
        -[GEOPDSearchParameters addSupportedRelatedEntitySectionType:]((uint64_t)v6);
      }
      uint64_t v81 = [v79 countByEnumeratingWithState:&v220 objects:v229 count:16];
      if (!v81)
      {
LABEL_172:

        v78 = v193;
        LODWORD(a3) = v199;
        break;
      }
    }
  }

  if (a3) {
    v86 = @"evChargingParameters";
  }
  else {
    v86 = @"ev_charging_parameters";
  }
  v87 = [v5 objectForKeyedSubscript:v86];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    unint64_t v88 = [GEOPDSSearchEvChargingParameters alloc];
    if (v88) {
      uint64_t v89 = -[GEOPDSSearchEvChargingParameters _initWithDictionary:isJSON:](v88, v87, a3);
    }
    else {
      uint64_t v89 = 0;
    }
    -[GEOPDSearchParameters setEvChargingParameters:]((uint64_t)v6, v89);
  }
  if (a3) {
    v90 = @"etaFilter";
  }
  else {
    v90 = @"eta_filter";
  }
  v91 = [v5 objectForKeyedSubscript:v90];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v92 = [GEOPDETAFilter alloc];
    if (v92) {
      id v93 = (void *)-[GEOPDETAFilter _initWithDictionary:isJSON:](v92, v91, a3);
    }
    else {
      id v93 = 0;
    }
    -[GEOPDSearchParameters setEtaFilter:]((uint64_t)v6, v93);
  }
  if (a3) {
    id v94 = @"supportedSearchTierType";
  }
  else {
    id v94 = @"supported_search_tier_type";
  }
  v95 = [v5 objectForKeyedSubscript:v94];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    long long v218 = 0u;
    long long v219 = 0u;
    long long v216 = 0u;
    long long v217 = 0u;
    v194 = v95;
    id v96 = v95;
    uint64_t v97 = [v96 countByEnumeratingWithState:&v216 objects:v228 count:16];
    if (!v97) {
      goto LABEL_207;
    }
    uint64_t v98 = v97;
    uint64_t v99 = *(void *)v217;
    while (1)
    {
      for (uint64_t j = 0; j != v98; ++j)
      {
        if (*(void *)v217 != v99) {
          objc_enumerationMutation(v96);
        }
        v101 = *(void **)(*((void *)&v216 + 1) + 8 * j);
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          id v102 = v101;
          if (([v102 isEqualToString:@"SEARCH_TIER_METADATA_UNKNOWN"] & 1) == 0
            && ([v102 isEqualToString:@"SEARCH_TIER_METADATA_PRIMARY"] & 1) == 0)
          {
            [v102 isEqualToString:@"SEARCH_TIER_METADATA_AUXILIARY"];
          }
        }
        else
        {
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0) {
            continue;
          }
          [v101 intValue];
        }
        -[GEOPDSearchParameters addSupportedSearchTierType:]((uint64_t)v6);
      }
      uint64_t v98 = [v96 countByEnumeratingWithState:&v216 objects:v228 count:16];
      if (!v98)
      {
LABEL_207:

        v95 = v194;
        LODWORD(a3) = v199;
        break;
      }
    }
  }

  if (a3) {
    id v103 = @"auxiliaryTierNumResults";
  }
  else {
    id v103 = @"auxiliary_tier_num_results";
  }
  v104 = [v5 objectForKeyedSubscript:v103];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    int v105 = [v104 unsignedIntValue];
    *(void *)(v6 + 372) |= 0x20000000001uLL;
    *((_DWORD *)v6 + 85) = v105;
  }

  if (a3) {
    unint64_t v106 = @"resultRefinementQuery";
  }
  else {
    unint64_t v106 = @"result_refinement_query";
  }
  uint64_t v107 = [v5 objectForKeyedSubscript:v106];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v108 = [GEOPDResultRefinementQuery alloc];
    if (a3) {
      v109 = [(GEOPDResultRefinementQuery *)v108 initWithJSON:v107];
    }
    else {
      v109 = [(GEOPDResultRefinementQuery *)v108 initWithDictionary:v107];
    }
    v110 = v109;
    -[GEOPDSearchParameters setResultRefinementQuery:]((uint64_t)v6, v109);
  }
  if (a3) {
    v111 = @"knownRefinementType";
  }
  else {
    v111 = @"known_refinement_type";
  }
  id v112 = [v5 objectForKeyedSubscript:v111];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    long long v214 = 0u;
    long long v215 = 0u;
    long long v212 = 0u;
    long long v213 = 0u;
    v195 = v112;
    id v113 = v112;
    uint64_t v114 = [v113 countByEnumeratingWithState:&v212 objects:v227 count:16];
    if (!v114) {
      goto LABEL_245;
    }
    uint64_t v115 = v114;
    uint64_t v116 = *(void *)v213;
    while (1)
    {
      for (uint64_t k = 0; k != v115; ++k)
      {
        if (*(void *)v213 != v116) {
          objc_enumerationMutation(v113);
        }
        v118 = *(void **)(*((void *)&v212 + 1) + 8 * k);
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          id v119 = v118;
          if (([v119 isEqualToString:@"RESULT_REFINEMENT_TYPE_UNKNOWN"] & 1) == 0
            && ([v119 isEqualToString:@"RESULT_REFINEMENT_TYPE_TOGGLE"] & 1) == 0
            && ([v119 isEqualToString:@"RESULT_REFINEMENT_TYPE_RANGE"] & 1) == 0
            && ([v119 isEqualToString:@"RESULT_REFINEMENT_TYPE_MULTI_SELECT"] & 1) == 0
            && ([v119 isEqualToString:@"RESULT_REFINEMENT_TYPE_SORT"] & 1) == 0
            && ([v119 isEqualToString:@"RESULT_REFINEMENT_GUIDES_HOME"] & 1) == 0)
          {
            [v119 isEqualToString:@"RESULT_REFINEMENT_TYPE_OPEN_OPTIONS"];
          }
        }
        else
        {
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0) {
            continue;
          }
          [v118 intValue];
        }
        -[GEOPDSearchParameters addKnownRefinementType:]((uint64_t)v6);
      }
      uint64_t v115 = [v113 countByEnumeratingWithState:&v212 objects:v227 count:16];
      if (!v115)
      {
LABEL_245:

        id v112 = v195;
        LODWORD(a3) = v199;
        break;
      }
    }
  }

  if (a3) {
    uint64_t v120 = @"placeSummaryRevision";
  }
  else {
    uint64_t v120 = @"place_summary_revision";
  }
  v121 = [v5 objectForKeyedSubscript:v120];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v122 = v121;
    if ([v122 isEqualToString:@"UNKNOWN"])
    {
      int v123 = 0;
    }
    else if ([v122 isEqualToString:@"NAME"])
    {
      int v123 = 1;
    }
    else if ([v122 isEqualToString:@"CATEGORY"])
    {
      int v123 = 2;
    }
    else if ([v122 isEqualToString:@"DISTANCE"])
    {
      int v123 = 3;
    }
    else if ([v122 isEqualToString:@"PRICE"])
    {
      int v123 = 4;
    }
    else if ([v122 isEqualToString:@"HOURS"])
    {
      int v123 = 5;
    }
    else if ([v122 isEqualToString:@"ADDRESS"])
    {
      int v123 = 6;
    }
    else if ([v122 isEqualToString:@"RATINGS"])
    {
      int v123 = 7;
    }
    else if ([v122 isEqualToString:@"TRANSIT_SHIELDS"])
    {
      int v123 = 8;
    }
    else if ([v122 isEqualToString:@"USER_GENERATED_GUIDES"])
    {
      int v123 = 9;
    }
    else if ([v122 isEqualToString:@"CURATED_GUIDES"])
    {
      int v123 = 10;
    }
    else if ([v122 isEqualToString:@"EV_CHARGERS_NUMBER"])
    {
      int v123 = 11;
    }
    else
    {
      if ([v122 isEqualToString:@"UGC_USER_SUBMITTED_RECOMMENDATIONS"])
      {
        int v123 = 12;
      }
      else if ([v122 isEqualToString:@"STRING"])
      {
        int v123 = 13;
      }
      else if ([v122 isEqualToString:@"SERVER_OVERRIDE"])
      {
        int v123 = 14;
      }
      else if ([v122 isEqualToString:@"CONTAINMENT"])
      {
        int v123 = 15;
      }
      else if ([v122 isEqualToString:@"RECENT"])
      {
        int v123 = 16;
      }
      else if ([v122 isEqualToString:@"HIGHLIGHT_MAIN"])
      {
        int v123 = 17;
      }
      else if ([v122 isEqualToString:@"HIGHLIGHT_EXTRA"])
      {
        int v123 = 18;
      }
      else if ([v122 isEqualToString:@"PUBLISHER_NAME_FOR_GUIDE"])
      {
        int v123 = 19;
      }
      else if ([v122 isEqualToString:@"NUM_PLACES_IN_GUIDE"])
      {
        int v123 = 20;
      }
      else if ([v122 isEqualToString:@"PUBLISHER_DESCRIPTION"])
      {
        int v123 = 21;
      }
      else if ([v122 isEqualToString:@"SECONDARY_NAME"])
      {
        int v123 = 22;
      }
      else if ([v122 isEqualToString:@"FACTOID"])
      {
        int v123 = 23;
      }
      else if ([v122 isEqualToString:@"ARP_RATINGS"])
      {
        int v123 = 24;
      }
      else if ([v122 isEqualToString:@"REAL_TIME_EV_CHARGER_AVAILABILITY"])
      {
        int v123 = 25;
      }
      else if ([v122 isEqualToString:@"DETOUR_TIME"])
      {
        int v123 = 26;
      }
      else if ([v122 isEqualToString:@"HIKING_DIFFICULTY"])
      {
        int v123 = 27;
      }
      else if ([v122 isEqualToString:@"HIKING_TRAIL_LENGTH"])
      {
        int v123 = 28;
      }
      else if ([v122 isEqualToString:@"PHOTO_CAROUSEL"])
      {
        int v123 = 29;
      }
      else if ([v122 isEqualToString:@"IN_USER_LIBRARY"])
      {
        int v123 = 30;
      }
      else if ([v122 isEqualToString:@"USER_NOTE"])
      {
        int v123 = 31;
      }
      else if ([v122 isEqualToString:@"HIKE_ROUTE_FACTOID_ELEVATION_GAIN_LOSS"])
      {
        int v123 = 32;
      }
      else if ([v122 isEqualToString:@"HIKE_ROUTE_TYPE"])
      {
        int v123 = 33;
      }
      else if ([v122 isEqualToString:@"HIKE_ROUTE_DURATION"])
      {
        int v123 = 34;
      }
      else if ([v122 isEqualToString:@"HIKE_ROUTE_LENGTH"])
      {
        int v123 = 35;
      }
      else
      {
        int v123 = 0;
      }
      LODWORD(a3) = v199;
    }

    goto LABEL_335;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    int v123 = [v121 intValue];
LABEL_335:
    *(void *)(v6 + 372) |= 0x20000000004uLL;
    *((_DWORD *)v6 + 87) = v123;
  }

  if (a3) {
    v124 = @"previousSearchViewport";
  }
  else {
    v124 = @"previous_search_viewport";
  }
  v125 = [v5 objectForKeyedSubscript:v124];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v126 = [GEOPDViewportInfo alloc];
    if (a3) {
      v127 = [(GEOPDViewportInfo *)v126 initWithJSON:v125];
    }
    else {
      v127 = [(GEOPDViewportInfo *)v126 initWithDictionary:v125];
    }
    v128 = v127;
    -[GEOPDSearchParameters setPreviousSearchViewport:]((uint64_t)v6, v127);
  }
  if (a3) {
    v129 = @"supportedPlaceSummaryFormatType";
  }
  else {
    v129 = @"supported_place_summary_format_type";
  }
  id v130 = [v5 objectForKeyedSubscript:v129];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    long long v210 = 0u;
    long long v211 = 0u;
    long long v208 = 0u;
    long long v209 = 0u;
    id v196 = v130;
    id v131 = v130;
    uint64_t v132 = [v131 countByEnumeratingWithState:&v208 objects:v226 count:16];
    if (!v132) {
      goto LABEL_366;
    }
    uint64_t v133 = v132;
    uint64_t v134 = *(void *)v209;
    while (1)
    {
      for (uint64_t m = 0; m != v133; ++m)
      {
        if (*(void *)v209 != v134) {
          objc_enumerationMutation(v131);
        }
        v136 = *(void **)(*((void *)&v208 + 1) + 8 * m);
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          id v137 = v136;
          if (([v137 isEqualToString:@"PLACE_SUMMARY_FORMAT_TYPE_UNKNOWN"] & 1) == 0
            && ([v137 isEqualToString:@"PLACE_SUMMARY_FORMAT_TYPE_BOLD"] & 1) == 0
            && ([v137 isEqualToString:@"PLACE_SUMMARY_FORMAT_TYPE_ITALICS"] & 1) == 0
            && ([v137 isEqualToString:@"PLACE_SUMMARY_FORMAT_TYPE_STRIKETHROUGH"] & 1) == 0)
          {
            [v137 isEqualToString:@"PLACE_SUMMARY_FORMAT_TYPE_TAPPABLE_ENTITY"];
          }
        }
        else
        {
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0) {
            continue;
          }
          [v136 intValue];
        }
        -[GEOPDSearchParameters addSupportedPlaceSummaryFormatType:]((uint64_t)v6);
      }
      uint64_t v133 = [v131 countByEnumeratingWithState:&v208 objects:v226 count:16];
      if (!v133)
      {
LABEL_366:

        id v130 = v196;
        LODWORD(a3) = v199;
        break;
      }
    }
  }

  if (a3) {
    v138 = @"supportedSearchSectionType";
  }
  else {
    v138 = @"supported_search_section_type";
  }
  unint64_t v139 = [v5 objectForKeyedSubscript:v138];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    long long v206 = 0u;
    long long v207 = 0u;
    long long v204 = 0u;
    long long v205 = 0u;
    v197 = v139;
    id v140 = v139;
    uint64_t v141 = [v140 countByEnumeratingWithState:&v204 objects:v225 count:16];
    if (!v141) {
      goto LABEL_387;
    }
    uint64_t v142 = v141;
    uint64_t v143 = *(void *)v205;
    while (1)
    {
      for (uint64_t n = 0; n != v142; ++n)
      {
        if (*(void *)v205 != v143) {
          objc_enumerationMutation(v140);
        }
        v145 = *(void **)(*((void *)&v204 + 1) + 8 * n);
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          id v146 = v145;
          if (([v146 isEqualToString:@"SEARCH_SECTION_TYPE_UNKNOWN"] & 1) == 0
            && ([v146 isEqualToString:@"SEARCH_SECTION_TYPE_PLACE"] & 1) == 0)
          {
            [v146 isEqualToString:@"SEARCH_SECTION_TYPE_GUIDE"];
          }
        }
        else
        {
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0) {
            continue;
          }
          [v145 intValue];
        }
        -[GEOPDSearchParameters addSupportedSearchSectionType:]((uint64_t)v6);
      }
      uint64_t v142 = [v140 countByEnumeratingWithState:&v204 objects:v225 count:16];
      if (!v142)
      {
LABEL_387:

        unint64_t v139 = v197;
        LODWORD(a3) = v199;
        break;
      }
    }
  }

  if (a3) {
    v147 = @"supportSearchEnrichment";
  }
  else {
    v147 = @"support_search_enrichment";
  }
  v148 = [v5 objectForKeyedSubscript:v147];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    char v149 = [v148 BOOLValue];
    *(void *)(v6 + 372) |= 0x20000000100uLL;
    v6[366] = v149;
  }

  if (a3) {
    v150 = @"searchOriginationInfo";
  }
  else {
    v150 = @"search_origination_info";
  }
  v151 = [v5 objectForKeyedSubscript:v150];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v152 = [GEOPDSearchOriginationInfo alloc];
    if (v152) {
      id v153 = (void *)-[GEOPDSearchOriginationInfo _initWithDictionary:isJSON:]((uint64_t)v152, v151, a3);
    }
    else {
      id v153 = 0;
    }
    -[GEOPDSearchParameters setSearchOriginationInfo:]((uint64_t)v6, v153);
  }
  if (a3) {
    id v154 = @"supportStructuredRapAffordance";
  }
  else {
    id v154 = @"support_structured_rap_affordance";
  }
  v155 = [v5 objectForKeyedSubscript:v154];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    char v156 = [v155 BOOLValue];
    *(void *)(v6 + 372) |= 0x20000000400uLL;
    v6[368] = v156;
  }

  if (a3) {
    id v157 = @"enrichmentCampaignNamespace";
  }
  else {
    id v157 = @"enrichment_campaign_namespace";
  }
  uint64_t v158 = [v5 objectForKeyedSubscript:v157];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v159 = (void *)[v158 copy];
    -[GEOPDSearchParameters setEnrichmentCampaignNamespace:]((uint64_t)v6, v159);
  }
  if (a3) {
    v160 = @"searchEnrichmentRevisionMetadata";
  }
  else {
    v160 = @"search_enrichment_revision_metadata";
  }
  v161 = [v5 objectForKeyedSubscript:v160];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    long long v202 = 0u;
    long long v203 = 0u;
    long long v200 = 0u;
    long long v201 = 0u;
    id v162 = v161;
    uint64_t v163 = [v162 countByEnumeratingWithState:&v200 objects:v224 count:16];
    if (v163)
    {
      uint64_t v164 = v163;
      uint64_t v165 = *(void *)v201;
      do
      {
        uint64_t v166 = 0;
        do
        {
          if (*(void *)v201 != v165) {
            objc_enumerationMutation(v162);
          }
          v167 = *(void **)(*((void *)&v200 + 1) + 8 * v166);
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            v168 = [GEOPDSearchEnrichmentRevisionMetadata alloc];
            if (v168) {
              v169 = (void *)-[GEOPDSearchEnrichmentRevisionMetadata _initWithDictionary:isJSON:]((uint64_t)v168, v167, v199);
            }
            else {
              v169 = 0;
            }
            -[GEOPDSearchParameters addSearchEnrichmentRevisionMetadata:]((uint64_t)v6, v169);
          }
          ++v166;
        }
        while (v164 != v166);
        uint64_t v170 = [v162 countByEnumeratingWithState:&v200 objects:v224 count:16];
        uint64_t v164 = v170;
      }
      while (v170);
    }

    id v5 = v198;
    LODWORD(a3) = v199;
  }

  if (a3) {
    v171 = @"searchSessionData";
  }
  else {
    v171 = @"search_session_data";
  }
  id v172 = [v5 objectForKeyedSubscript:v171];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v173 = -[GEOACResult _initWithDictionary:isJSON:]([GEOPDSSearchSessionData alloc], v172);
    -[GEOPDSearchParameters setSearchSessionData:]((uint64_t)v6, v173);
  }
  if (a3) {
    v174 = @"mostRecentAutocompleteRequestSessionData";
  }
  else {
    v174 = @"most_recent_autocomplete_request_session_data";
  }
  v175 = [v5 objectForKeyedSubscript:v174];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v176 = [GEOPDAutocompleteSessionData alloc];
    if (a3) {
      id v177 = [(GEOPDAutocompleteSessionData *)v176 initWithJSON:v175];
    }
    else {
      id v177 = [(GEOPDAutocompleteSessionData *)v176 initWithDictionary:v175];
    }
    id v178 = v177;
    -[GEOPDSearchParameters setMostRecentAutocompleteRequestSessionData:]((uint64_t)v6, v177);
  }
  if (a3) {
    v179 = @"punchInHints";
  }
  else {
    v179 = @"punch_in_hints";
  }
  v180 = [v5 objectForKeyedSubscript:v179];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v181 = [GEOPDSPunchInHints alloc];
    if (v181) {
      id v182 = -[GEOPDSPunchInHints _initWithDictionary:isJSON:](v181, v180, a3);
    }
    else {
      id v182 = 0;
    }
    -[GEOPDSearchParameters setPunchInHints:]((uint64_t)v6, v182);
  }
  if (a3) {
    v183 = @"sessionUserActionMetadata";
  }
  else {
    v183 = @"session_user_action_metadata";
  }
  id v184 = [v5 objectForKeyedSubscript:v183];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v185 = [GEOPDSSessionUserActionMetadata alloc];
    if (a3) {
      v186 = [(GEOPDSSessionUserActionMetadata *)v185 initWithJSON:v184];
    }
    else {
      v186 = [(GEOPDSSessionUserActionMetadata *)v185 initWithDictionary:v184];
    }
    v187 = v186;
    -[GEOPDSearchParameters setSessionUserActionMetadata:]((uint64_t)v6, v186);
  }
  if (a3) {
    v188 = @"paginationParameters";
  }
  else {
    v188 = @"pagination_parameters";
  }
  id v189 = [v5 objectForKeyedSubscript:v188];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v190 = [GEOPDPaginationParameters alloc];
    if (v190) {
      id v191 = (void *)-[GEOPDPaginationParameters _initWithDictionary:isJSON:](v190, v189, a3);
    }
    else {
      id v191 = 0;
    }
    -[GEOPDSearchParameters setPaginationParameters:]((uint64_t)v6, v191);
  }
LABEL_464:

  return v6;
}

- (BOOL)readFrom:(id)a3
{
  return GEOPDSearchParametersReadAllFrom((uint64_t)self, a3, 0);
}

- (void)writeTo:(id)a3
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  p_readerLocuint64_t k = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  if (self->_reader && (_GEOPDSearchParametersIsDirty((uint64_t)self) & 1) == 0)
  {
    id v18 = self->_reader;
    objc_sync_enter(v18);
    *(void *)((char *)self->_reader + (int)*MEMORY[0x1E4F940E0]) = self->_readerMarkLength;
    [(PBDataReader *)self->_reader seekToOffset:self->_readerMarkPos];
    id v19 = [(PBDataReader *)self->_reader readBytes:self->_readerMarkLength - self->_readerMarkPos];
    [v4 writeData:v19];
    os_unfair_lock_unlock(p_readerLock);

    objc_sync_exit(v18);
    goto LABEL_96;
  }
  os_unfair_lock_unlock(&self->_readerLock);
  -[GEOPDSearchParameters readAll:]((uint64_t)self, 0);
  $6960C9CD4445C07EDE163A4FBB4CEEA7 flags = self->_flags;
  if ((*(unsigned char *)&flags & 0x20) != 0)
  {
    PBDataWriterWriteInt32Field();
    $6960C9CD4445C07EDE163A4FBB4CEEA7 flags = self->_flags;
  }
  if ((*(unsigned char *)&flags & 2) != 0) {
    PBDataWriterWriteUint32Field();
  }
  if (self->_searchString) {
    PBDataWriterWriteStringField();
  }
  if (self->_viewportInfo) {
    PBDataWriterWriteSubmessage();
  }
  if (self->_suggestionMetadata) {
    PBDataWriterWriteDataField();
  }
  if (self->_suggestionEntryMetadata) {
    PBDataWriterWriteDataField();
  }
  if (self->_suggestionEntry) {
    PBDataWriterWriteSubmessage();
  }
  if ((*(unsigned char *)&self->_flags & 8) != 0) {
    PBDataWriterWriteInt32Field();
  }
  if (self->_searchStructureIntentType) {
    PBDataWriterWriteSubmessage();
  }
  if (self->_searchLocationParameters) {
    PBDataWriterWriteSubmessage();
  }
  if (self->_recentRouteInfo) {
    PBDataWriterWriteSubmessage();
  }
  if (self->_searchFilter) {
    PBDataWriterWriteSubmessage();
  }
  $6960C9CD4445C07EDE163A4FBB4CEEA7 v7 = self->_flags;
  if ((*(unsigned char *)&v7 & 0x80) != 0)
  {
    PBDataWriterWriteBOOLField();
    $6960C9CD4445C07EDE163A4FBB4CEEA7 v7 = self->_flags;
  }
  if ((*(unsigned char *)&v7 & 0x40) != 0) {
    PBDataWriterWriteBOOLField();
  }
  if (self->_retainedSearch) {
    PBDataWriterWriteSubmessage();
  }
  $6960C9CD4445C07EDE163A4FBB4CEEA7 v8 = self->_flags;
  if ((*(_WORD *)&v8 & 0x800) == 0)
  {
    if ((*(_WORD *)&v8 & 0x200) == 0) {
      goto LABEL_35;
    }
LABEL_93:
    PBDataWriterWriteBOOLField();
    if ((*(void *)&self->_flags & 0x10) == 0) {
      goto LABEL_37;
    }
    goto LABEL_36;
  }
  PBDataWriterWriteBOOLField();
  $6960C9CD4445C07EDE163A4FBB4CEEA7 v8 = self->_flags;
  if ((*(_WORD *)&v8 & 0x200) != 0) {
    goto LABEL_93;
  }
LABEL_35:
  if ((*(unsigned char *)&v8 & 0x10) != 0) {
LABEL_36:
  }
    PBDataWriterWriteInt32Field();
LABEL_37:
  if (self->_inferredSignals) {
    PBDataWriterWriteSubmessage();
  }
  if (self->_supportedRelatedEntitySectionTypes.count)
  {
    unint64_t v9 = 0;
    do
    {
      PBDataWriterWriteInt32Field();
      ++v9;
    }
    while (v9 < self->_supportedRelatedEntitySectionTypes.count);
  }
  if (self->_evChargingParameters) {
    PBDataWriterWriteSubmessage();
  }
  if (self->_etaFilter) {
    PBDataWriterWriteSubmessage();
  }
  if (self->_supportedSearchTierTypes.count)
  {
    unint64_t v10 = 0;
    do
    {
      PBDataWriterWriteInt32Field();
      ++v10;
    }
    while (v10 < self->_supportedSearchTierTypes.count);
  }
  if (*(unsigned char *)&self->_flags) {
    PBDataWriterWriteUint32Field();
  }
  if (self->_resultRefinementQuery) {
    PBDataWriterWriteSubmessage();
  }
  if (self->_knownRefinementTypes.count)
  {
    unint64_t v11 = 0;
    do
    {
      PBDataWriterWriteInt32Field();
      ++v11;
    }
    while (v11 < self->_knownRefinementTypes.count);
  }
  if ((*(unsigned char *)&self->_flags & 4) != 0) {
    PBDataWriterWriteInt32Field();
  }
  if (self->_previousSearchViewport) {
    PBDataWriterWriteSubmessage();
  }
  if (self->_supportedPlaceSummaryFormatTypes.count)
  {
    unint64_t v12 = 0;
    do
    {
      PBDataWriterWriteInt32Field();
      ++v12;
    }
    while (v12 < self->_supportedPlaceSummaryFormatTypes.count);
  }
  if (self->_supportedSearchSectionTypes.count)
  {
    unint64_t v13 = 0;
    do
    {
      PBDataWriterWriteInt32Field();
      ++v13;
    }
    while (v13 < self->_supportedSearchSectionTypes.count);
  }
  if (*((unsigned char *)&self->_flags + 1)) {
    PBDataWriterWriteBOOLField();
  }
  if (self->_searchOriginationInfo) {
    PBDataWriterWriteSubmessage();
  }
  if ((*((unsigned char *)&self->_flags + 1) & 4) != 0) {
    PBDataWriterWriteBOOLField();
  }
  if (self->_enrichmentCampaignNamespace) {
    PBDataWriterWriteStringField();
  }
  long long v22 = 0u;
  long long v23 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  v14 = self->_searchEnrichmentRevisionMetadatas;
  uint64_t v15 = [(NSMutableArray *)v14 countByEnumeratingWithState:&v20 objects:v24 count:16];
  if (v15)
  {
    uint64_t v16 = *(void *)v21;
    do
    {
      uint64_t v17 = 0;
      do
      {
        if (*(void *)v21 != v16) {
          objc_enumerationMutation(v14);
        }
        PBDataWriterWriteSubmessage();
        ++v17;
      }
      while (v15 != v17);
      uint64_t v15 = [(NSMutableArray *)v14 countByEnumeratingWithState:&v20 objects:v24 count:16];
    }
    while (v15);
  }

  if (self->_searchSessionData) {
    PBDataWriterWriteSubmessage();
  }
  if (self->_mostRecentAutocompleteRequestSessionData) {
    PBDataWriterWriteSubmessage();
  }
  if (self->_punchInHints) {
    PBDataWriterWriteSubmessage();
  }
  if (self->_sessionUserActionMetadata) {
    PBDataWriterWriteSubmessage();
  }
  if (self->_paginationParameters) {
    PBDataWriterWriteSubmessage();
  }
  -[PBUnknownFields writeTo:](self->_unknownFields, "writeTo:", v4, v20);
LABEL_96:
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v68 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  os_unfair_lock_lock(&self->_readerLock);
  reader = self->_reader;
  if (reader)
  {
    $6960C9CD4445C07EDE163A4FBB4CEEA7 v7 = reader;
    objc_sync_enter(v7);
    if ((*((unsigned char *)&self->_flags + 5) & 2) == 0)
    {
      *(void *)((char *)self->_reader + (int)*MEMORY[0x1E4F940E0]) = self->_readerMarkLength;
      [(PBDataReader *)self->_reader seekToOffset:self->_readerMarkPos];
      GEOPDSearchParametersReadAllFrom(v5, self->_reader, 0);
      os_unfair_lock_unlock(&self->_readerLock);
      id v8 = (id)v5;
      objc_sync_exit(v7);

      goto LABEL_35;
    }
    objc_sync_exit(v7);
  }
  os_unfair_lock_unlock(&self->_readerLock);
  -[GEOPDSearchParameters readAll:]((uint64_t)self, 0);
  $6960C9CD4445C07EDE163A4FBB4CEEA7 flags = self->_flags;
  if ((*(unsigned char *)&flags & 0x20) != 0)
  {
    *(_DWORD *)(v5 + 360) = self->_sortOrder;
    *(void *)(v5 + 372) |= 0x20uLL;
    $6960C9CD4445C07EDE163A4FBB4CEEA7 flags = self->_flags;
  }
  if ((*(unsigned char *)&flags & 2) != 0)
  {
    *(_DWORD *)(v5 + 344) = self->_maxResults;
    *(void *)(v5 + 372) |= 2uLL;
  }
  uint64_t v10 = [(NSString *)self->_searchString copyWithZone:a3];
  unint64_t v11 = *(void **)(v5 + 272);
  *(void *)(v5 + 272) = v10;

  id v12 = [(GEOPDViewportInfo *)self->_viewportInfo copyWithZone:a3];
  unint64_t v13 = *(void **)(v5 + 320);
  *(void *)(v5 + 320) = v12;

  uint64_t v14 = [(NSData *)self->_suggestionMetadata copyWithZone:a3];
  uint64_t v15 = *(void **)(v5 + 312);
  *(void *)(v5 + 312) = v14;

  uint64_t v16 = [(NSData *)self->_suggestionEntryMetadata copyWithZone:a3];
  uint64_t v17 = *(void **)(v5 + 296);
  *(void *)(v5 + 296) = v16;

  id v18 = [(GEOPDAutocompleteEntry *)self->_suggestionEntry copyWithZone:a3];
  id v19 = *(void **)(v5 + 304);
  *(void *)(v5 + 304) = v18;

  if ((*(unsigned char *)&self->_flags & 8) != 0)
  {
    *(_DWORD *)(v5 + 352) = self->_searchType;
    *(void *)(v5 + 372) |= 8uLL;
  }
  id v20 = [(GEOPDSSearchStructureIntentRequestType *)self->_searchStructureIntentType copyWithZone:a3];
  long long v21 = *(void **)(v5 + 280);
  *(void *)(v5 + 280) = v20;

  id v22 = [(GEOPDSSearchLocationParameters *)self->_searchLocationParameters copyWithZone:a3];
  long long v23 = *(void **)(v5 + 248);
  *(void *)(v5 + 248) = v22;

  id v24 = [(GEOPDRecentRouteInfo *)self->_recentRouteInfo copyWithZone:a3];
  uint64_t v25 = *(void **)(v5 + 208);
  *(void *)(v5 + 208) = v24;

  id v26 = [(GEOPDSSearchFilter *)self->_searchFilter copyWithZone:a3];
  v27 = *(void **)(v5 + 240);
  *(void *)(v5 + 240) = v26;

  $6960C9CD4445C07EDE163A4FBB4CEEA7 v28 = self->_flags;
  if ((*(unsigned char *)&v28 & 0x80) != 0)
  {
    *(unsigned char *)(v5 + 365) = self->_supportDymSuggestion;
    *(void *)(v5 + 372) |= 0x80uLL;
    $6960C9CD4445C07EDE163A4FBB4CEEA7 v28 = self->_flags;
  }
  if ((*(unsigned char *)&v28 & 0x40) != 0)
  {
    *(unsigned char *)(v5 + 364) = self->_supportDirectionIntentSearch;
    *(void *)(v5 + 372) |= 0x40uLL;
  }
  id v29 = [(GEOPDRetainedSearchMetadata *)self->_retainedSearch copyWithZone:a3];
  v30 = *(void **)(v5 + 224);
  *(void *)(v5 + 224) = v29;

  $6960C9CD4445C07EDE163A4FBB4CEEA7 v31 = self->_flags;
  if ((*(_WORD *)&v31 & 0x800) == 0)
  {
    if ((*(_WORD *)&v31 & 0x200) == 0) {
      goto LABEL_17;
    }
LABEL_37:
    *(unsigned char *)(v5 + 367) = self->_supportSearchResultSection;
    *(void *)(v5 + 372) |= 0x200uLL;
    if ((*(void *)&self->_flags & 0x10) == 0) {
      goto LABEL_19;
    }
    goto LABEL_18;
  }
  *(unsigned char *)(v5 + 369) = self->_supportUnresolvedDirectionIntent;
  *(void *)(v5 + 372) |= 0x800uLL;
  $6960C9CD4445C07EDE163A4FBB4CEEA7 v31 = self->_flags;
  if ((*(_WORD *)&v31 & 0x200) != 0) {
    goto LABEL_37;
  }
LABEL_17:
  if ((*(unsigned char *)&v31 & 0x10) != 0)
  {
LABEL_18:
    *(_DWORD *)(v5 + 356) = self->_sortDirection;
    *(void *)(v5 + 372) |= 0x10uLL;
  }
LABEL_19:
  id v32 = [(GEOPDSInferredSignals *)self->_inferredSignals copyWithZone:a3];
  v33 = *(void **)(v5 + 168);
  *(void *)(v5 + 168) = v32;

  PBRepeatedInt32Copy();
  id v34 = [(GEOPDSSearchEvChargingParameters *)self->_evChargingParameters copyWithZone:a3];
  id v35 = *(void **)(v5 + 160);
  *(void *)(v5 + 160) = v34;

  id v36 = [(GEOPDETAFilter *)self->_etaFilter copyWithZone:a3];
  id v37 = *(void **)(v5 + 152);
  *(void *)(v5 + 152) = v36;

  PBRepeatedInt32Copy();
  if (*(unsigned char *)&self->_flags)
  {
    *(_DWORD *)(v5 + 340) = self->_auxiliaryTierNumResults;
    *(void *)(v5 + 372) |= 1uLL;
  }
  id v38 = [(GEOPDResultRefinementQuery *)self->_resultRefinementQuery copyWithZone:a3];
  v39 = *(void **)(v5 + 216);
  *(void *)(v5 + 216) = v38;

  PBRepeatedInt32Copy();
  if ((*(unsigned char *)&self->_flags & 4) != 0)
  {
    *(_DWORD *)(v5 + 348) = self->_placeSummaryRevision;
    *(void *)(v5 + 372) |= 4uLL;
  }
  id v40 = [(GEOPDViewportInfo *)self->_previousSearchViewport copyWithZone:a3];
  id v41 = *(void **)(v5 + 192);
  *(void *)(v5 + 192) = v40;

  PBRepeatedInt32Copy();
  PBRepeatedInt32Copy();
  if (*((unsigned char *)&self->_flags + 1))
  {
    *(unsigned char *)(v5 + 366) = self->_supportSearchEnrichment;
    *(void *)(v5 + 372) |= 0x100uLL;
  }
  id v42 = [(GEOPDSearchOriginationInfo *)self->_searchOriginationInfo copyWithZone:a3];
  id v43 = *(void **)(v5 + 256);
  *(void *)(v5 + 256) = v42;

  if ((*((unsigned char *)&self->_flags + 1) & 4) != 0)
  {
    *(unsigned char *)(v5 + 368) = self->_supportStructuredRapAffordance;
    *(void *)(v5 + 372) |= 0x400uLL;
  }
  uint64_t v44 = [(NSString *)self->_enrichmentCampaignNamespace copyWithZone:a3];
  v45 = *(void **)(v5 + 144);
  *(void *)(v5 + 144) = v44;

  long long v65 = 0u;
  long long v66 = 0u;
  long long v63 = 0u;
  long long v64 = 0u;
  v46 = self->_searchEnrichmentRevisionMetadatas;
  uint64_t v47 = [(NSMutableArray *)v46 countByEnumeratingWithState:&v63 objects:v67 count:16];
  if (v47)
  {
    uint64_t v48 = *(void *)v64;
    do
    {
      uint64_t v49 = 0;
      do
      {
        if (*(void *)v64 != v48) {
          objc_enumerationMutation(v46);
        }
        v50 = objc_msgSend(*(id *)(*((void *)&v63 + 1) + 8 * v49), "copyWithZone:", a3, (void)v63);
        -[GEOPDSearchParameters addSearchEnrichmentRevisionMetadata:](v5, v50);

        ++v49;
      }
      while (v47 != v49);
      uint64_t v47 = [(NSMutableArray *)v46 countByEnumeratingWithState:&v63 objects:v67 count:16];
    }
    while (v47);
  }

  id v51 = [(GEOPDSSearchSessionData *)self->_searchSessionData copyWithZone:a3];
  v52 = *(void **)(v5 + 264);
  *(void *)(v5 + 264) = v51;

  id v53 = [(GEOPDAutocompleteSessionData *)self->_mostRecentAutocompleteRequestSessionData copyWithZone:a3];
  v54 = *(void **)(v5 + 176);
  *(void *)(v5 + 176) = v53;

  id v55 = [(GEOPDSPunchInHints *)self->_punchInHints copyWithZone:a3];
  v56 = *(void **)(v5 + 200);
  *(void *)(v5 + 200) = v55;

  id v57 = [(GEOPDSSessionUserActionMetadata *)self->_sessionUserActionMetadata copyWithZone:a3];
  char v58 = *(void **)(v5 + 288);
  *(void *)(v5 + 288) = v57;

  id v59 = [(GEOPDPaginationParameters *)self->_paginationParameters copyWithZone:a3];
  v60 = *(void **)(v5 + 184);
  *(void *)(v5 + 184) = v59;

  v61 = self->_unknownFields;
  id v8 = *(id *)(v5 + 16);
  *(void *)(v5 + 16) = v61;
LABEL_35:

  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (char *)a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_133;
  }
  -[GEOPDSearchParameters readAll:]((uint64_t)self, 1);
  -[GEOPDSearchParameters readAll:]((uint64_t)v4, 1);
  $6960C9CD4445C07EDE163A4FBB4CEEA7 flags = self->_flags;
  uint64_t v6 = *(void *)(v4 + 372);
  if ((*(unsigned char *)&flags & 0x20) != 0)
  {
    if ((v6 & 0x20) == 0 || self->_sortOrder != *((_DWORD *)v4 + 90)) {
      goto LABEL_133;
    }
  }
  else if ((v6 & 0x20) != 0)
  {
    goto LABEL_133;
  }
  if ((*(unsigned char *)&flags & 2) != 0)
  {
    if ((v6 & 2) == 0 || self->_maxResults != *((_DWORD *)v4 + 86)) {
      goto LABEL_133;
    }
  }
  else if ((v6 & 2) != 0)
  {
    goto LABEL_133;
  }
  searchString = self->_searchString;
  if ((unint64_t)searchString | *((void *)v4 + 34)
    && !-[NSString isEqual:](searchString, "isEqual:"))
  {
    goto LABEL_133;
  }
  viewportInfo = self->_viewportInfo;
  if ((unint64_t)viewportInfo | *((void *)v4 + 40))
  {
    if (!-[GEOPDViewportInfo isEqual:](viewportInfo, "isEqual:")) {
      goto LABEL_133;
    }
  }
  suggestionMetadata = self->_suggestionMetadata;
  if ((unint64_t)suggestionMetadata | *((void *)v4 + 39))
  {
    if (!-[NSData isEqual:](suggestionMetadata, "isEqual:")) {
      goto LABEL_133;
    }
  }
  suggestionEntryMetadata = self->_suggestionEntryMetadata;
  if ((unint64_t)suggestionEntryMetadata | *((void *)v4 + 37))
  {
    if (!-[NSData isEqual:](suggestionEntryMetadata, "isEqual:")) {
      goto LABEL_133;
    }
  }
  suggestionEntry = self->_suggestionEntry;
  if ((unint64_t)suggestionEntry | *((void *)v4 + 38))
  {
    if (!-[GEOPDAutocompleteEntry isEqual:](suggestionEntry, "isEqual:")) {
      goto LABEL_133;
    }
  }
  uint64_t v12 = *(void *)(v4 + 372);
  if ((*(unsigned char *)&self->_flags & 8) != 0)
  {
    if ((v12 & 8) == 0 || self->_searchType != *((_DWORD *)v4 + 88)) {
      goto LABEL_133;
    }
  }
  else if ((v12 & 8) != 0)
  {
    goto LABEL_133;
  }
  searchStructureIntentType = self->_searchStructureIntentType;
  if ((unint64_t)searchStructureIntentType | *((void *)v4 + 35)
    && !-[GEOPDSSearchStructureIntentRequestType isEqual:](searchStructureIntentType, "isEqual:"))
  {
    goto LABEL_133;
  }
  searchLocationParameters = self->_searchLocationParameters;
  if ((unint64_t)searchLocationParameters | *((void *)v4 + 31))
  {
    if (!-[GEOPDSSearchLocationParameters isEqual:](searchLocationParameters, "isEqual:")) {
      goto LABEL_133;
    }
  }
  recentRouteInfo = self->_recentRouteInfo;
  if ((unint64_t)recentRouteInfo | *((void *)v4 + 26))
  {
    if (!-[GEOPDRecentRouteInfo isEqual:](recentRouteInfo, "isEqual:")) {
      goto LABEL_133;
    }
  }
  searchFilter = self->_searchFilter;
  if ((unint64_t)searchFilter | *((void *)v4 + 30))
  {
    if (!-[GEOPDSSearchFilter isEqual:](searchFilter, "isEqual:")) {
      goto LABEL_133;
    }
  }
  $6960C9CD4445C07EDE163A4FBB4CEEA7 v17 = self->_flags;
  uint64_t v18 = *(void *)(v4 + 372);
  if ((*(unsigned char *)&v17 & 0x80) != 0)
  {
    if ((v18 & 0x80) == 0) {
      goto LABEL_133;
    }
    if (self->_supportDymSuggestion)
    {
      if (!v4[365]) {
        goto LABEL_133;
      }
    }
    else if (v4[365])
    {
      goto LABEL_133;
    }
  }
  else if ((v18 & 0x80) != 0)
  {
    goto LABEL_133;
  }
  if ((*(unsigned char *)&v17 & 0x40) != 0)
  {
    if ((v18 & 0x40) == 0) {
      goto LABEL_133;
    }
    if (self->_supportDirectionIntentSearch)
    {
      if (!v4[364]) {
        goto LABEL_133;
      }
    }
    else if (v4[364])
    {
      goto LABEL_133;
    }
  }
  else if ((v18 & 0x40) != 0)
  {
    goto LABEL_133;
  }
  retainedSearch = self->_retainedSearch;
  if ((unint64_t)retainedSearch | *((void *)v4 + 28))
  {
    if (!-[GEOPDRetainedSearchMetadata isEqual:](retainedSearch, "isEqual:")) {
      goto LABEL_133;
    }
    $6960C9CD4445C07EDE163A4FBB4CEEA7 v17 = self->_flags;
    uint64_t v18 = *(void *)(v4 + 372);
  }
  if ((*(_WORD *)&v17 & 0x800) != 0)
  {
    if ((v18 & 0x800) == 0) {
      goto LABEL_133;
    }
    if (self->_supportUnresolvedDirectionIntent)
    {
      if (!v4[369]) {
        goto LABEL_133;
      }
    }
    else if (v4[369])
    {
      goto LABEL_133;
    }
  }
  else if ((v18 & 0x800) != 0)
  {
    goto LABEL_133;
  }
  if ((*(_WORD *)&v17 & 0x200) != 0)
  {
    if ((v18 & 0x200) == 0) {
      goto LABEL_133;
    }
    if (self->_supportSearchResultSection)
    {
      if (!v4[367]) {
        goto LABEL_133;
      }
    }
    else if (v4[367])
    {
      goto LABEL_133;
    }
  }
  else if ((v18 & 0x200) != 0)
  {
    goto LABEL_133;
  }
  if ((*(unsigned char *)&v17 & 0x10) != 0)
  {
    if ((v18 & 0x10) == 0 || self->_sortDirection != *((_DWORD *)v4 + 89)) {
      goto LABEL_133;
    }
  }
  else if ((v18 & 0x10) != 0)
  {
    goto LABEL_133;
  }
  inferredSignals = self->_inferredSignals;
  if ((unint64_t)inferredSignals | *((void *)v4 + 21)
    && !-[GEOPDSInferredSignals isEqual:](inferredSignals, "isEqual:"))
  {
    goto LABEL_133;
  }
  if (!PBRepeatedInt32IsEqual()) {
    goto LABEL_133;
  }
  evChargingParameters = self->_evChargingParameters;
  if ((unint64_t)evChargingParameters | *((void *)v4 + 20))
  {
    if (!-[GEOPDSSearchEvChargingParameters isEqual:](evChargingParameters, "isEqual:")) {
      goto LABEL_133;
    }
  }
  etaFilter = self->_etaFilter;
  if ((unint64_t)etaFilter | *((void *)v4 + 19))
  {
    if (!-[GEOPDETAFilter isEqual:](etaFilter, "isEqual:")) {
      goto LABEL_133;
    }
  }
  if (!PBRepeatedInt32IsEqual()) {
    goto LABEL_133;
  }
  uint64_t v23 = *(void *)(v4 + 372);
  if (*(unsigned char *)&self->_flags)
  {
    if ((v23 & 1) == 0 || self->_auxiliaryTierNumResults != *((_DWORD *)v4 + 85)) {
      goto LABEL_133;
    }
  }
  else if (v23)
  {
    goto LABEL_133;
  }
  resultRefinementQuery = self->_resultRefinementQuery;
  if ((unint64_t)resultRefinementQuery | *((void *)v4 + 27)
    && !-[GEOPDResultRefinementQuery isEqual:](resultRefinementQuery, "isEqual:")
    || !PBRepeatedInt32IsEqual())
  {
    goto LABEL_133;
  }
  uint64_t v25 = *(void *)(v4 + 372);
  if ((*(unsigned char *)&self->_flags & 4) != 0)
  {
    if ((v25 & 4) == 0 || self->_placeSummaryRevision != *((_DWORD *)v4 + 87)) {
      goto LABEL_133;
    }
  }
  else if ((v25 & 4) != 0)
  {
    goto LABEL_133;
  }
  previousSearchViewport = self->_previousSearchViewport;
  if ((unint64_t)previousSearchViewport | *((void *)v4 + 24)
    && !-[GEOPDViewportInfo isEqual:](previousSearchViewport, "isEqual:")
    || !PBRepeatedInt32IsEqual()
    || !PBRepeatedInt32IsEqual())
  {
    goto LABEL_133;
  }
  $6960C9CD4445C07EDE163A4FBB4CEEA7 v27 = self->_flags;
  uint64_t v28 = *(void *)(v4 + 372);
  if ((*(_WORD *)&v27 & 0x100) != 0)
  {
    if ((v28 & 0x100) == 0) {
      goto LABEL_133;
    }
    if (self->_supportSearchEnrichment)
    {
      if (!v4[366]) {
        goto LABEL_133;
      }
    }
    else if (v4[366])
    {
      goto LABEL_133;
    }
  }
  else if ((v28 & 0x100) != 0)
  {
    goto LABEL_133;
  }
  searchOriginationInfo = self->_searchOriginationInfo;
  if ((unint64_t)searchOriginationInfo | *((void *)v4 + 32))
  {
    if (!-[GEOPDSearchOriginationInfo isEqual:](searchOriginationInfo, "isEqual:")) {
      goto LABEL_133;
    }
    $6960C9CD4445C07EDE163A4FBB4CEEA7 v27 = self->_flags;
    uint64_t v28 = *(void *)(v4 + 372);
  }
  if ((*(_WORD *)&v27 & 0x400) != 0)
  {
    if ((v28 & 0x400) != 0)
    {
      if (self->_supportStructuredRapAffordance)
      {
        if (!v4[368]) {
          goto LABEL_133;
        }
        goto LABEL_119;
      }
      if (!v4[368]) {
        goto LABEL_119;
      }
    }
LABEL_133:
    char v37 = 0;
    goto LABEL_134;
  }
  if ((v28 & 0x400) != 0) {
    goto LABEL_133;
  }
LABEL_119:
  enrichmentCampaignNamespace = self->_enrichmentCampaignNamespace;
  if ((unint64_t)enrichmentCampaignNamespace | *((void *)v4 + 18)
    && !-[NSString isEqual:](enrichmentCampaignNamespace, "isEqual:"))
  {
    goto LABEL_133;
  }
  searchEnrichmentRevisionMetadatas = self->_searchEnrichmentRevisionMetadatas;
  if ((unint64_t)searchEnrichmentRevisionMetadatas | *((void *)v4 + 29))
  {
    if (!-[NSMutableArray isEqual:](searchEnrichmentRevisionMetadatas, "isEqual:")) {
      goto LABEL_133;
    }
  }
  searchSessionData = self->_searchSessionData;
  if ((unint64_t)searchSessionData | *((void *)v4 + 33))
  {
    if (!-[GEOPDSSearchSessionData isEqual:](searchSessionData, "isEqual:")) {
      goto LABEL_133;
    }
  }
  mostRecentAutocompleteRequestSessionData = self->_mostRecentAutocompleteRequestSessionData;
  if ((unint64_t)mostRecentAutocompleteRequestSessionData | *((void *)v4 + 22))
  {
    if (!-[GEOPDAutocompleteSessionData isEqual:](mostRecentAutocompleteRequestSessionData, "isEqual:")) {
      goto LABEL_133;
    }
  }
  punchInHints = self->_punchInHints;
  if ((unint64_t)punchInHints | *((void *)v4 + 25))
  {
    if (!-[GEOPDSPunchInHints isEqual:](punchInHints, "isEqual:")) {
      goto LABEL_133;
    }
  }
  sessionUserActionMetadata = self->_sessionUserActionMetadata;
  if ((unint64_t)sessionUserActionMetadata | *((void *)v4 + 36))
  {
    if (!-[GEOPDSSessionUserActionMetadata isEqual:](sessionUserActionMetadata, "isEqual:")) {
      goto LABEL_133;
    }
  }
  paginationParameters = self->_paginationParameters;
  if ((unint64_t)paginationParameters | *((void *)v4 + 23)) {
    char v37 = -[GEOPDPaginationParameters isEqual:](paginationParameters, "isEqual:");
  }
  else {
    char v37 = 1;
  }
LABEL_134:

  return v37;
}

- (unint64_t)hash
{
  -[GEOPDSearchParameters readAll:]((uint64_t)self, 1);
  $6960C9CD4445C07EDE163A4FBB4CEEA7 flags = self->_flags;
  if ((*(unsigned char *)&flags & 0x20) != 0)
  {
    uint64_t v45 = 2654435761 * self->_sortOrder;
    if ((*(unsigned char *)&flags & 2) != 0) {
      goto LABEL_3;
    }
  }
  else
  {
    uint64_t v45 = 0;
    if ((*(unsigned char *)&flags & 2) != 0)
    {
LABEL_3:
      uint64_t v44 = 2654435761 * self->_maxResults;
      goto LABEL_6;
    }
  }
  uint64_t v44 = 0;
LABEL_6:
  NSUInteger v43 = [(NSString *)self->_searchString hash];
  unint64_t v42 = [(GEOPDViewportInfo *)self->_viewportInfo hash];
  uint64_t v41 = [(NSData *)self->_suggestionMetadata hash];
  uint64_t v40 = [(NSData *)self->_suggestionEntryMetadata hash];
  unint64_t v39 = [(GEOPDAutocompleteEntry *)self->_suggestionEntry hash];
  if ((*(unsigned char *)&self->_flags & 8) != 0) {
    uint64_t v38 = 2654435761 * self->_searchType;
  }
  else {
    uint64_t v38 = 0;
  }
  unint64_t v37 = [(GEOPDSSearchStructureIntentRequestType *)self->_searchStructureIntentType hash];
  unint64_t v36 = [(GEOPDSSearchLocationParameters *)self->_searchLocationParameters hash];
  unint64_t v35 = [(GEOPDRecentRouteInfo *)self->_recentRouteInfo hash];
  unint64_t v34 = [(GEOPDSSearchFilter *)self->_searchFilter hash];
  $6960C9CD4445C07EDE163A4FBB4CEEA7 v4 = self->_flags;
  if ((*(unsigned char *)&v4 & 0x80) != 0)
  {
    uint64_t v33 = 2654435761 * self->_supportDymSuggestion;
    if ((*(unsigned char *)&v4 & 0x40) != 0) {
      goto LABEL_11;
    }
  }
  else
  {
    uint64_t v33 = 0;
    if ((*(unsigned char *)&v4 & 0x40) != 0)
    {
LABEL_11:
      uint64_t v32 = 2654435761 * self->_supportDirectionIntentSearch;
      goto LABEL_14;
    }
  }
  uint64_t v32 = 0;
LABEL_14:
  unint64_t v31 = [(GEOPDRetainedSearchMetadata *)self->_retainedSearch hash];
  $6960C9CD4445C07EDE163A4FBB4CEEA7 v5 = self->_flags;
  if ((*(_WORD *)&v5 & 0x800) == 0)
  {
    uint64_t v30 = 0;
    if ((*(_WORD *)&v5 & 0x200) != 0) {
      goto LABEL_16;
    }
LABEL_19:
    uint64_t v29 = 0;
    if ((*(unsigned char *)&v5 & 0x10) != 0) {
      goto LABEL_17;
    }
    goto LABEL_20;
  }
  uint64_t v30 = 2654435761 * self->_supportUnresolvedDirectionIntent;
  if ((*(_WORD *)&v5 & 0x200) == 0) {
    goto LABEL_19;
  }
LABEL_16:
  uint64_t v29 = 2654435761 * self->_supportSearchResultSection;
  if ((*(unsigned char *)&v5 & 0x10) != 0)
  {
LABEL_17:
    uint64_t v28 = 2654435761 * self->_sortDirection;
    goto LABEL_21;
  }
LABEL_20:
  uint64_t v28 = 0;
LABEL_21:
  unint64_t v27 = [(GEOPDSInferredSignals *)self->_inferredSignals hash];
  uint64_t v26 = PBRepeatedInt32Hash();
  unint64_t v25 = [(GEOPDSSearchEvChargingParameters *)self->_evChargingParameters hash];
  unint64_t v24 = [(GEOPDETAFilter *)self->_etaFilter hash];
  uint64_t v23 = PBRepeatedInt32Hash();
  if (*(unsigned char *)&self->_flags) {
    uint64_t v22 = 2654435761 * self->_auxiliaryTierNumResults;
  }
  else {
    uint64_t v22 = 0;
  }
  unint64_t v6 = [(GEOPDResultRefinementQuery *)self->_resultRefinementQuery hash];
  uint64_t v7 = PBRepeatedInt32Hash();
  if ((*(unsigned char *)&self->_flags & 4) != 0) {
    uint64_t v8 = 2654435761 * self->_placeSummaryRevision;
  }
  else {
    uint64_t v8 = 0;
  }
  unint64_t v9 = [(GEOPDViewportInfo *)self->_previousSearchViewport hash];
  uint64_t v10 = PBRepeatedInt32Hash();
  uint64_t v11 = PBRepeatedInt32Hash();
  if (*((unsigned char *)&self->_flags + 1)) {
    uint64_t v12 = 2654435761 * self->_supportSearchEnrichment;
  }
  else {
    uint64_t v12 = 0;
  }
  unint64_t v13 = [(GEOPDSearchOriginationInfo *)self->_searchOriginationInfo hash];
  if ((*((unsigned char *)&self->_flags + 1) & 4) != 0) {
    uint64_t v14 = 2654435761 * self->_supportStructuredRapAffordance;
  }
  else {
    uint64_t v14 = 0;
  }
  NSUInteger v15 = v12 ^ v13 ^ v14 ^ [(NSString *)self->_enrichmentCampaignNamespace hash];
  uint64_t v16 = v15 ^ [(NSMutableArray *)self->_searchEnrichmentRevisionMetadatas hash];
  unint64_t v17 = v16 ^ [(GEOPDSSearchSessionData *)self->_searchSessionData hash];
  unint64_t v18 = v17 ^ [(GEOPDAutocompleteSessionData *)self->_mostRecentAutocompleteRequestSessionData hash];
  unint64_t v19 = v44 ^ v45 ^ v43 ^ v42 ^ v41 ^ v40 ^ v39 ^ v38 ^ v37 ^ v36 ^ v35 ^ v34 ^ v33 ^ v32 ^ v31 ^ v30 ^ v29 ^ v28 ^ v27 ^ v26 ^ v25 ^ v24 ^ v23 ^ v22 ^ v6 ^ v7 ^ v8 ^ v9 ^ v10 ^ v11 ^ v18 ^ [(GEOPDSPunchInHints *)self->_punchInHints hash];
  unint64_t v20 = [(GEOPDSSessionUserActionMetadata *)self->_sessionUserActionMetadata hash];
  return v19 ^ v20 ^ [(GEOPDPaginationParameters *)self->_paginationParameters hash];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_viewportInfo, 0);
  objc_storeStrong((id *)&self->_suggestionMetadata, 0);
  objc_storeStrong((id *)&self->_suggestionEntry, 0);
  objc_storeStrong((id *)&self->_suggestionEntryMetadata, 0);
  objc_storeStrong((id *)&self->_sessionUserActionMetadata, 0);
  objc_storeStrong((id *)&self->_searchStructureIntentType, 0);
  objc_storeStrong((id *)&self->_searchString, 0);
  objc_storeStrong((id *)&self->_searchSessionData, 0);
  objc_storeStrong((id *)&self->_searchOriginationInfo, 0);
  objc_storeStrong((id *)&self->_searchLocationParameters, 0);
  objc_storeStrong((id *)&self->_searchFilter, 0);
  objc_storeStrong((id *)&self->_searchEnrichmentRevisionMetadatas, 0);
  objc_storeStrong((id *)&self->_retainedSearch, 0);
  objc_storeStrong((id *)&self->_resultRefinementQuery, 0);
  objc_storeStrong((id *)&self->_recentRouteInfo, 0);
  objc_storeStrong((id *)&self->_punchInHints, 0);
  objc_storeStrong((id *)&self->_previousSearchViewport, 0);
  objc_storeStrong((id *)&self->_paginationParameters, 0);
  objc_storeStrong((id *)&self->_mostRecentAutocompleteRequestSessionData, 0);
  objc_storeStrong((id *)&self->_inferredSignals, 0);
  objc_storeStrong((id *)&self->_evChargingParameters, 0);
  objc_storeStrong((id *)&self->_etaFilter, 0);
  objc_storeStrong((id *)&self->_enrichmentCampaignNamespace, 0);
  objc_storeStrong((id *)&self->_unknownFields, 0);

  objc_storeStrong((id *)&self->_reader, 0);
}

- (void)addPlaceSummaryRevision:(id)a3
{
  id v6 = a3;
  if ([v6 placeSummaryRevision])
  {
    int v4 = [v6 placeSummaryRevision];
    if (self)
    {
      *(void *)&self->_flags |= 0x20000000004uLL;
      self->_placeSummaryRevisiouint64_t n = v4;
    }
    if ([v6 supportedPlaceSummaryFormatTypesCount])
    {
      unint64_t v5 = 0;
      do
      {
        [v6 supportedPlaceSummaryFormatTypeAtIndex:v5];
        -[GEOPDSearchParameters addSupportedPlaceSummaryFormatType:]((uint64_t)self);
        ++v5;
      }
      while (v5 < [v6 supportedPlaceSummaryFormatTypesCount]);
    }
  }
}

- (GEOPDSearchParameters)initWithGeoMapItemIdentifier:(id)a3 categoryID:(id)a4 maxResults:(unsigned int)a5 traits:(id)a6 searchSessionData:(id)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a6;
  id v15 = a7;
  v29.receiver = self;
  v29.super_class = (Class)GEOPDSearchParameters;
  uint64_t v16 = [(GEOPDSearchParameters *)&v29 init];
  uint64_t v17 = (uint64_t)v16;
  if (!v16) {
    goto LABEL_13;
  }
  *(void *)(v16 + 372) |= 0x20000000002uLL;
  *((_DWORD *)v16 + 86) = a5;
  unint64_t v18 = [v14 evChargingPorts];
  if ([v18 count])
  {

LABEL_5:
    unint64_t v20 = objc_alloc_init(GEOPDSSearchEvChargingParameters);
    long long v21 = [v14 evChargingPorts];
    -[GEOPDSSearchEvChargingParameters setPorts:]((uint64_t)v20, v21);

    if ([v14 preferredBrandsCount]) {
      -[GEOPDSSearchEvChargingParameters setPreferredBrands:count:]((uint64_t)v20, [v14 preferredBrands], objc_msgSend(v14, "preferredBrandsCount"));
    }
    -[GEOPDSearchParameters setEvChargingParameters:](v17, v20);

    goto LABEL_8;
  }
  uint64_t v19 = [v14 preferredBrandsCount];

  if (v19) {
    goto LABEL_5;
  }
LABEL_8:
  [(id)v17 addPlaceSummaryRevision:v14];
  uint64_t v22 = [[GEOPDSearchOriginationInfo alloc] initWithTraits:v14];
  -[GEOPDSearchParameters setSearchOriginationInfo:](v17, v22);
  [(id)v17 addSearchImplicitInfo:v14 idenitfier:v12 categoryID:v13];
  char v23 = [v14 supportStructuredRapAffordance];
  *(void *)(v17 + 372) |= 0x20000000400uLL;
  *(unsigned char *)(v17 + 368) = v23;
  if (GEOConfigGetBOOL(MapsFeaturesConfig_SearchAndDiscovery, (uint64_t)off_1E9111EB8))
  {
    if (v15)
    {
      unint64_t v24 = [v15 searchSessionData];
      -[GEOPDSearchParameters setSearchSessionData:](v17, v24);
    }
    unint64_t v25 = [v14 recentAutocompleteSessionData];
    -[GEOPDSearchParameters setMostRecentAutocompleteRequestSessionData:](v17, v25);

    uint64_t v26 = [v14 userActionMetadata];
    -[GEOPDSearchParameters setSessionUserActionMetadata:](v17, v26);
  }
  id v27 = (id)v17;

LABEL_13:
  return (GEOPDSearchParameters *)v17;
}

- (GEOPDSearchParameters)initWithSearchQuery:(id)a3 entryMetadata:(id)a4 metadata:(id)a5 autocompleteEntry:(id)a6 retainedSearch:(id)a7 maxResults:(unsigned int)a8 traits:(id)a9 routeInfo:(id)a10 searchSessionData:(id)a11
{
  id v17 = a3;
  id v18 = a4;
  id v63 = a5;
  id v19 = a6;
  id v20 = a7;
  id v21 = a9;
  id v22 = a10;
  id v23 = a11;
  v64.receiver = self;
  v64.super_class = (Class)GEOPDSearchParameters;
  unint64_t v24 = [(GEOPDSearchParameters *)&v64 init];
  uint64_t v25 = (uint64_t)v24;
  if (!v24) {
    goto LABEL_48;
  }
  if (a8)
  {
    *(void *)(v24 + 372) |= 0x20000000002uLL;
    *((_DWORD *)v24 + 86) = a8;
  }
  if (objc_msgSend(v17, "length", v23)) {
    -[GEOPDSearchParameters setSearchString:](v25, v17);
  }
  if ([v18 length]) {
    -[GEOPDSearchParameters setSuggestionEntryMetadata:](v25, v18);
  }
  if ([v63 length]) {
    -[GEOPDSearchParameters setSuggestionMetadata:](v25, v63);
  }
  if (v19) {
    -[GEOPDSearchParameters setSuggestionEntry:](v25, v19);
  }
  id v62 = v17;
  if (v20) {
    -[GEOPDSearchParameters setRetainedSearch:](v25, v20);
  }
  char v26 = [v21 supportDirectionIntentSearch];
  *(void *)(v25 + 372) |= 0x20000000040uLL;
  *(unsigned char *)(v25 + 364) = v26;
  char v27 = [v21 supportUnresolvedDirectionIntent];
  *(void *)(v25 + 372) |= 0x20000000800uLL;
  *(unsigned char *)(v25 + 369) = v27;
  char v28 = [v21 supportDymSuggestion];
  *(void *)(v25 + 372) |= 0x20000000080uLL;
  *(unsigned char *)(v25 + 365) = v28;
  objc_super v29 = +[GEOPDViewportInfo viewportInfoForTraits:v21];
  -[GEOPDSearchParameters setViewportInfo:](v25, v29);

  unsigned int v30 = [v21 searchRequestType];
  if (v30 > 3) {
    int v31 = 0;
  }
  else {
    int v31 = dword_18A640D00[v30];
  }
  *(void *)(v25 + 372) |= 0x20000000008uLL;
  *(_DWORD *)(v25 + 352) = v31;
  uint64_t v32 = +[GEOPDETAFilter etaFilterForTraits:v21];
  -[GEOPDSearchParameters setEtaFilter:](v25, v32);

  int v33 = [v21 navigating];
  *(void *)(v25 + 372) |= 0x20000000200uLL;
  *(unsigned char *)(v25 + 367) = v33 ^ 1;
  unint64_t v34 = [v21 evChargingPorts];
  if ([v34 count])
  {

LABEL_20:
    unint64_t v36 = objc_alloc_init(GEOPDSSearchEvChargingParameters);
    unint64_t v37 = [v21 evChargingPorts];
    -[GEOPDSSearchEvChargingParameters setPorts:]((uint64_t)v36, v37);

    if ([v21 preferredBrandsCount]) {
      -[GEOPDSSearchEvChargingParameters setPreferredBrands:count:]((uint64_t)v36, [v21 preferredBrands], objc_msgSend(v21, "preferredBrandsCount"));
    }
    -[GEOPDSearchParameters setEvChargingParameters:](v25, v36);

    goto LABEL_23;
  }
  uint64_t v35 = [v21 preferredBrandsCount];

  if (v35) {
    goto LABEL_20;
  }
LABEL_23:
  id v61 = v19;
  id v38 = v18;
  int v39 = [v21 navigating];
  if (v22 && v39)
  {
    -[GEOPDSearchParameters setRecentRouteInfo:](v25, v22);
    uint64_t v40 = -[GEOPDSearchParameters etaFilter]((id *)v25);
    uint64_t v41 = [v40 data];
    unint64_t v42 = -[GEOPDSearchParameters recentRouteInfo]((id *)v25);
    -[GEOPDRecentRouteInfo setEtaFilter:]((uint64_t)v42, v41);
  }
  if (((v33 | GEOConfigGetBOOL(MapsFeaturesConfig_ShelbyvilleSearch, (uint64_t)off_1E9111CB8) ^ 1) & 1) == 0)
  {
    if ([v21 hasAuxiliaryTierNumResults])
    {
      int v43 = [v21 auxiliaryTierNumResults];
      *(void *)(v25 + 372) |= 0x20000000001uLL;
      *(_DWORD *)(v25 + 340) = v43;
    }
    if ([v21 supportedSearchTierTypesCount])
    {
      unint64_t v44 = 0;
      do
      {
        [v21 supportedSearchTierTypeAtIndex:v44];
        -[GEOPDSearchParameters addSupportedSearchTierType:](v25);
        ++v44;
      }
      while (v44 < [v21 supportedSearchTierTypesCount]);
    }
    if ([v21 knownRefinementTypesCount])
    {
      unint64_t v45 = 0;
      do
      {
        [v21 knownRefinementTypeAtIndex:v45];
        -[GEOPDSearchParameters addKnownRefinementType:](v25);
        ++v45;
      }
      while (v45 < [v21 knownRefinementTypesCount]);
    }
    v46 = [v21 resultRefinementQuery];
    -[GEOPDSearchParameters setResultRefinementQuery:](v25, v46);

    uint64_t v47 = [v21 previousSearchViewport];
    -[GEOPDSearchParameters setPreviousSearchViewport:](v25, v47);
  }
  [(id)v25 addPlaceSummaryRevision:v21];
  if (GEOConfigGetBOOL(MapsFeaturesConfig_ShelbyvilleSearch, (uint64_t)off_1E9111CB8))
  {
    -[GEOPDSearchParameters addSupportedSearchSectionType:](v25);
    id v17 = v62;
    id v18 = v38;
    if (([v21 navigating] & 1) == 0) {
      -[GEOPDSearchParameters addSupportedSearchSectionType:](v25);
    }
  }
  else
  {
    id v17 = v62;
    id v18 = v38;
    if (([v21 navigating] & 1) == 0) {
      -[GEOPDSearchParameters addSupportedRelatedEntitySectionType:](v25);
    }
  }
  uint64_t v48 = [[GEOPDSearchOriginationInfo alloc] initWithTraits:v21];
  -[GEOPDSearchParameters setSearchOriginationInfo:](v25, v48);
  char v49 = [v21 supportStructuredRapAffordance];
  *(void *)(v25 + 372) |= 0x20000000400uLL;
  *(unsigned char *)(v25 + 368) = v49;
  [(id)v25 addSearchImplicitInfo:v21 idenitfier:0 categoryID:0];
  v50 = [v21 spotlightSearchPunchinEncodedString];

  if (v50)
  {
    id v51 = objc_alloc(MEMORY[0x1E4F1C9B8]);
    v52 = [v21 spotlightSearchPunchinEncodedString];
    id v53 = (void *)[v51 initWithBase64EncodedString:v52 options:0];

    v54 = [[GEOPDSPunchInHints alloc] initWithData:v53];
    -[GEOPDSearchParameters setPunchInHints:](v25, v54);

    id v18 = v38;
  }
  id v23 = v60;
  id v19 = v61;
  if (GEOConfigGetBOOL(MapsFeaturesConfig_SearchAndDiscovery, (uint64_t)off_1E9111EB8))
  {
    if (v60)
    {
      id v55 = [v60 searchSessionData];
      -[GEOPDSearchParameters setSearchSessionData:](v25, v55);
    }
    v56 = [v21 recentAutocompleteSessionData];
    -[GEOPDSearchParameters setMostRecentAutocompleteRequestSessionData:](v25, v56);

    id v57 = [v21 userActionMetadata];
    -[GEOPDSearchParameters setSessionUserActionMetadata:](v25, v57);
  }
  id v58 = (id)v25;

LABEL_48:
  return (GEOPDSearchParameters *)v25;
}

- (void)addSearchImplicitInfo:(id)a3 idenitfier:(id)a4 categoryID:(id)a5
{
  id v36 = a3;
  id v8 = a4;
  id v9 = a5;
  uint64_t v10 = [v36 searchImplicitFilterInfo];
  if (v10)
  {
    uint64_t v11 = (void *)v10;
    id v12 = -[GEOPDSearchParameters searchOriginationInfo]((id *)&self->super.super.isa);
    int v13 = -[GEOPDSearchOriginationInfo searchOriginationType]((uint64_t)v12);

    if (v13 == 3)
    {
      id v14 = [v36 searchImplicitFilterInfo];
      if (v14)
      {
        -[GEOPDSearchParameters searchFilter]((id *)&self->super.super.isa);
        id v15 = (id *)objc_claimAutoreleasedReturnValue();
        -[GEOPDSSearchFilter implictQueryCategoryFilter](v15);
        uint64_t v16 = (GEOPDSImplicitQueryCategoryFilter *)objc_claimAutoreleasedReturnValue();

        if (!v16) {
          uint64_t v16 = objc_alloc_init(GEOPDSImplicitQueryCategoryFilter);
        }
        id v17 = -[GEOPDSearchParameters searchFilter]((id *)&self->super.super.isa);

        if (!v17)
        {
          id v18 = objc_alloc_init(GEOPDSSearchFilter);
          -[GEOPDSearchParameters setSearchFilter:]((uint64_t)self, v18);
        }
        id v19 = [v36 searchImplicitFilterInfo];
        int v20 = [v19 searchImplicitType];

        switch(v20)
        {
          case 1:
            id v21 = objc_alloc_init(GEOPDSImplicitQuerySearchForEVCharger);
            if (v16)
            {
              *(unsigned char *)&v16->_flags |= 0x20u;
              *(unsigned char *)&v16->_flags |= 1u;
              v16->_implicitQueryType = 1;
            }
            uint64_t v22 = [v14 searchAlongRouteMuid];
            if (v21)
            {
              *(unsigned char *)&v21->_flags |= 1u;
              v21->_encryptedCurrentEvchargerStopMuid = v22;
            }
            -[GEOPDSImplicitQueryCategoryFilter setImplicitQuerySearchForEvcharger:]((uint64_t)v16, v21);
            goto LABEL_28;
          case 2:
            id v23 = -[GEOPDSImplicitQueryCategoryFilter implicitQuerySearchAroundPoi]((id *)&v16->super.super.isa);

            if (!v23)
            {
              unint64_t v24 = objc_alloc_init(GEOPDSImplicitQuerySearchAroundPOI);
              -[GEOPDSImplicitQueryCategoryFilter setImplicitQuerySearchAroundPoi:]((uint64_t)v16, v24);
            }
            if (v16)
            {
              *(unsigned char *)&v16->_flags |= 0x20u;
              *(unsigned char *)&v16->_flags |= 1u;
              v16->_implicitQueryType = 2;
            }
            uint64_t v25 = [GEOLatLng alloc];
            [v8 coordinate];
            id v21 = -[GEOLatLng initWithCoordinate:](v25, "initWithCoordinate:");
            char v26 = -[GEOPDSImplicitQueryCategoryFilter implicitQuerySearchAroundPoi]((id *)&v16->super.super.isa);
            -[GEOPDSImplicitQuerySearchAroundPOI setReferenceLocation:]((uint64_t)v26, v21);

            char v27 = -[GEOPDSImplicitQueryCategoryFilter implicitQuerySearchAroundPoi]((id *)&v16->super.super.isa);
            -[GEOPDSImplicitQuerySearchAroundPOI setCategoryIdOfPoi:]((uint64_t)v27, v9);

            uint64_t v28 = [v8 muid];
            -[GEOPDSImplicitQueryCategoryFilter implicitQuerySearchAroundPoi]((id *)&v16->super.super.isa);
            objc_super v29 = (unsigned char *)objc_claimAutoreleasedReturnValue();
            if (!v29) {
              goto LABEL_27;
            }
            v29[60] |= 0x10u;
            v29[60] |= 1u;
            uint64_t v30 = 32;
            break;
          case 3:
            int v31 = -[GEOPDSImplicitQueryCategoryFilter implicitQueryIntroTipForHiking]((id *)&v16->super.super.isa);

            if (!v31)
            {
              uint64_t v32 = objc_alloc_init(GEOPDSImplicitQueryIntroTipForHiking);
              -[GEOPDSImplicitQueryCategoryFilter setImplicitQueryIntroTipForHiking:]((uint64_t)v16, v32);
            }
            int v33 = [GEOLatLng alloc];
            [v8 coordinate];
            id v21 = -[GEOLatLng initWithCoordinate:](v33, "initWithCoordinate:");
            if (v16)
            {
              *(unsigned char *)&v16->_flags |= 0x20u;
              *(unsigned char *)&v16->_flags |= 1u;
              v16->_implicitQueryType = 3;
            }
            unint64_t v34 = -[GEOPDSImplicitQueryCategoryFilter implicitQueryIntroTipForHiking]((id *)&v16->super.super.isa);
            -[GEOPDSImplicitQueryIntroTipForHiking setReferenceLocation:]((uint64_t)v34, v21);

            uint64_t v28 = [v14 searchAlongRouteMuid];
            -[GEOPDSImplicitQueryCategoryFilter implicitQueryIntroTipForHiking]((id *)&v16->super.super.isa);
            objc_super v29 = (unsigned char *)objc_claimAutoreleasedReturnValue();
            if (!v29) {
              goto LABEL_27;
            }
            v29[32] |= 1u;
            uint64_t v30 = 16;
            break;
          case 4:
            if (v16)
            {
              *(unsigned char *)&v16->_flags |= 0x20u;
              *(unsigned char *)&v16->_flags |= 1u;
              v16->_implicitQueryType = 4;
            }
            goto LABEL_31;
          default:
            goto LABEL_31;
        }
        *(void *)&v29[v30] = v28;
LABEL_27:

LABEL_28:
LABEL_31:
        uint64_t v35 = -[GEOPDSearchParameters searchFilter]((id *)&self->super.super.isa);
        -[GEOPDSSearchFilter setImplictQueryCategoryFilter:]((uint64_t)v35, v16);
      }
    }
  }
}

@end