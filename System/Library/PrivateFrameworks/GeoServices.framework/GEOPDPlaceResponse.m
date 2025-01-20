@interface GEOPDPlaceResponse
+ (BOOL)isValid:(id)a3;
+ (Class)displayLanguageType;
+ (Class)dotPlaceType;
+ (Class)legacyPlaceResultType;
+ (Class)mapsResultType;
+ (Class)spokenLanguageType;
- (BOOL)hasAnalyticData;
- (BOOL)hasClientMetrics;
- (BOOL)hasDatasetAbStatus;
- (BOOL)hasDebugApiKey;
- (BOOL)hasDebugLatencyMs;
- (BOOL)hasDisplayRegion;
- (BOOL)hasGlobalResult;
- (BOOL)hasGreenTeaWithValue:(BOOL)a3;
- (BOOL)hasRequestType;
- (BOOL)hasStatus;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (GEOClientMetrics)clientMetrics;
- (GEOPDDatasetABStatus)datasetAbStatus;
- (GEOPDPlaceGlobalResult)globalResult;
- (GEOPDPlaceResponse)init;
- (GEOPDPlaceResponse)initWithData:(id)a3;
- (GEOPDPlaceResponse)initWithDictionary:(id)a3;
- (GEOPDPlaceResponse)initWithJSON:(id)a3;
- (GEOPDPlaceResponse)initWithPlace:(id)a3 forRequestType:(int)a4;
- (GEOPDPlacesRequestResponseAnalyticsData)analyticData;
- (NSMutableArray)displayLanguages;
- (NSMutableArray)dotPlaces;
- (NSMutableArray)legacyPlaceResults;
- (NSMutableArray)mapsResults;
- (NSMutableArray)spokenLanguages;
- (NSString)debugApiKey;
- (NSString)displayRegion;
- (PBUnknownFields)unknownFields;
- (id)_dictionaryRepresentation:(uint64_t)a1;
- (id)_disambiguationLabels;
- (id)_initWithDictionary:(unsigned int)a3 isJSON:;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)displayLanguageAtIndex:(unint64_t)a3;
- (id)dotPlaceAtIndex:(unint64_t)a3;
- (id)jsonRepresentation;
- (id)legacyPlaceResultAtIndex:(unint64_t)a3;
- (id)mapsResultAtIndex:(unint64_t)a3;
- (id)requestTypeAsString:(int)a3;
- (id)resultsWithResultType:(int)a3;
- (id)spokenLanguageAtIndex:(unint64_t)a3;
- (id)statusAsString:(int)a3;
- (int)StringAsRequestType:(id)a3;
- (int)StringAsStatus:(id)a3;
- (int)requestType;
- (int)status;
- (unint64_t)debugLatencyMs;
- (unint64_t)displayLanguagesCount;
- (unint64_t)dotPlacesCount;
- (unint64_t)hash;
- (unint64_t)legacyPlaceResultsCount;
- (unint64_t)mapsResultsCount;
- (unint64_t)resultsCountWithResultType:(int)a3;
- (unint64_t)spokenLanguagesCount;
- (void)_addNoFlagsDisplayLanguage:(uint64_t)a1;
- (void)_addNoFlagsDotPlace:(uint64_t)a1;
- (void)_addNoFlagsLegacyPlaceResult:(uint64_t)a1;
- (void)_addNoFlagsMapsResult:(uint64_t)a1;
- (void)_addNoFlagsSpokenLanguage:(uint64_t)a1;
- (void)_readAnalyticData;
- (void)_readClientMetrics;
- (void)_readDatasetAbStatus;
- (void)_readDebugApiKey;
- (void)_readDisplayLanguages;
- (void)_readDisplayRegion;
- (void)_readDotPlaces;
- (void)_readGlobalResult;
- (void)_readLegacyPlaceResults;
- (void)_readMapsResults;
- (void)_readSpokenLanguages;
- (void)addDisplayLanguage:(id)a3;
- (void)addDotPlace:(id)a3;
- (void)addLegacyPlaceResult:(id)a3;
- (void)addMapsResult:(id)a3;
- (void)addSpokenLanguage:(id)a3;
- (void)clearDisplayLanguages;
- (void)clearDotPlaces;
- (void)clearLegacyPlaceResults;
- (void)clearMapsResults;
- (void)clearSensitiveFields:(unint64_t)a3;
- (void)clearSpokenLanguages;
- (void)clearUnknownFields:(BOOL)a3;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)readAll:(BOOL)a3;
- (void)setAnalyticData:(id)a3;
- (void)setClientMetrics:(id)a3;
- (void)setDatasetAbStatus:(id)a3;
- (void)setDebugApiKey:(id)a3;
- (void)setDebugLatencyMs:(unint64_t)a3;
- (void)setDisplayLanguages:(id)a3;
- (void)setDisplayRegion:(id)a3;
- (void)setDotPlaces:(id)a3;
- (void)setGlobalResult:(id)a3;
- (void)setHasDebugLatencyMs:(BOOL)a3;
- (void)setHasRequestType:(BOOL)a3;
- (void)setHasStatus:(BOOL)a3;
- (void)setLegacyPlaceResults:(id)a3;
- (void)setMapsResults:(id)a3;
- (void)setRequestType:(int)a3;
- (void)setSpokenLanguages:(id)a3;
- (void)setStatus:(int)a3;
- (void)writeTo:(id)a3;
@end

@implementation GEOPDPlaceResponse

- (unint64_t)resultsCountWithResultType:(int)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  if ([(GEOPDPlaceResponse *)self mapsResultsCount])
  {
    long long v16 = 0u;
    long long v17 = 0u;
    long long v14 = 0u;
    long long v15 = 0u;
    v5 = [(GEOPDPlaceResponse *)self mapsResults];
    uint64_t v6 = [v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
    if (v6)
    {
      uint64_t v7 = v6;
      unint64_t v8 = 0;
      uint64_t v9 = *(void *)v15;
      do
      {
        for (uint64_t i = 0; i != v7; ++i)
        {
          if (*(void *)v15 != v9) {
            objc_enumerationMutation(v5);
          }
          v11 = *(void **)(*((void *)&v14 + 1) + 8 * i);
          if ([v11 resultType] == a3)
          {
            switch(a3)
            {
              case 1:
                unsigned int v12 = [v11 hasPlace];
                goto LABEL_14;
              case 2:
                unsigned int v12 = [v11 hasCollection];
                goto LABEL_14;
              case 3:
                unsigned int v12 = [v11 hasPublisher];
                goto LABEL_14;
              case 4:
                unsigned int v12 = [v11 hasPlaceQuestionnaire];
                goto LABEL_14;
              case 5:
                unsigned int v12 = [v11 hasBatchReverseGeocode];
LABEL_14:
                v8 += v12;
                break;
              default:
                continue;
            }
          }
        }
        uint64_t v7 = [v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
      }
      while (v7);
    }
    else
    {
      unint64_t v8 = 0;
    }

    return v8;
  }
  if (a3 != 1) {
    return 0;
  }

  return [(GEOPDPlaceResponse *)self legacyPlaceResultsCount];
}

id __52__GEOPDPlaceResponse_Extras__resultsWithResultType___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  int v4 = [v3 resultType];
  if (v4 == *(_DWORD *)(a1 + 32))
  {
    switch(v4)
    {
      case 1:
        uint64_t v5 = [v3 place];
        break;
      case 2:
        uint64_t v5 = [v3 collection];
        break;
      case 3:
        uint64_t v5 = [v3 publisher];
        break;
      case 4:
        uint64_t v5 = [v3 placeQuestionnaire];
        break;
      case 5:
        uint64_t v5 = [v3 batchReverseGeocode];
        break;
      default:
        goto LABEL_4;
    }
    uint64_t v6 = (void *)v5;
  }
  else
  {
LABEL_4:
    uint64_t v6 = 0;
  }

  return v6;
}

- (GEOPDPlaceResponse)initWithData:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)GEOPDPlaceResponse;
  id v3 = [(GEOPDPlaceResponse *)&v7 initWithData:a3];
  int v4 = v3;
  if (v3)
  {
    v3->_readerLock._os_unfair_lock_opaque = 0;
    uint64_t v5 = v3;
  }

  return v4;
}

- (int)status
{
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  __int16 flags = (__int16)self->_flags;
  os_unfair_lock_unlock(p_readerLock);
  if ((flags & 4) != 0) {
    return self->_status;
  }
  else {
    return 0;
  }
}

- (NSMutableArray)legacyPlaceResults
{
  -[GEOPDPlaceResponse _readLegacyPlaceResults]((uint64_t)self);
  legacyPlaceResults = self->_legacyPlaceResults;

  return legacyPlaceResults;
}

- (void)_readLegacyPlaceResults
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 128));
    if ((*(_WORD *)(a1 + 140) & 0x2000) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOPDPlaceResponseReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readLegacyPlaceResults_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 128));
  }
}

- (GEOPDDatasetABStatus)datasetAbStatus
{
  -[GEOPDPlaceResponse _readDatasetAbStatus]((uint64_t)self);
  datasetAbStatus = self->_datasetAbStatus;

  return datasetAbStatus;
}

- (void)_readDatasetAbStatus
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 128));
    if ((*(_WORD *)(a1 + 140) & 0x40) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOPDPlaceResponseReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readDatasetAbStatus_tags_0);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 128));
  }
}

- (BOOL)hasGlobalResult
{
  return self->_globalResult != 0;
}

- (GEOPDPlaceGlobalResult)globalResult
{
  -[GEOPDPlaceResponse _readGlobalResult]((uint64_t)self);
  globalResult = self->_globalResult;

  return globalResult;
}

- (void)_readGlobalResult
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 128));
    if ((*(_WORD *)(a1 + 140) & 0x800) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOPDPlaceResponseReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readGlobalResult_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 128));
  }
}

- (id)resultsWithResultType:(int)a3
{
  if ([(GEOPDPlaceResponse *)self mapsResultsCount])
  {
    uint64_t v5 = [(GEOPDPlaceResponse *)self mapsResults];
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __52__GEOPDPlaceResponse_Extras__resultsWithResultType___block_invoke;
    v9[3] = &__block_descriptor_36_e25__16__0__GEOPDMapsResult_8l;
    int v10 = a3;
    uint64_t v6 = objc_msgSend(v5, "_geo_compactMap:", v9);
  }
  else if (a3 == 1)
  {
    uint64_t v6 = [(GEOPDPlaceResponse *)self legacyPlaceResults];
  }
  else
  {
    uint64_t v6 = 0;
  }
  if ([v6 count]) {
    objc_super v7 = (void *)[v6 copy];
  }
  else {
    objc_super v7 = 0;
  }

  return v7;
}

- (unint64_t)mapsResultsCount
{
  -[GEOPDPlaceResponse _readMapsResults]((uint64_t)self);
  mapsResults = self->_mapsResults;

  return [(NSMutableArray *)mapsResults count];
}

- (NSMutableArray)mapsResults
{
  -[GEOPDPlaceResponse _readMapsResults]((uint64_t)self);
  mapsResults = self->_mapsResults;

  return mapsResults;
}

- (void)_readMapsResults
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 128));
    if ((*(_WORD *)(a1 + 140) & 0x1000) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOPDPlaceResponseReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readMapsResults_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 128));
  }
}

- (id)_disambiguationLabels
{
  if (![(GEOPDPlaceResponse *)self hasGlobalResult])
  {
    objc_super v7 = 0;
    goto LABEL_12;
  }
  uint64_t v3 = [(GEOPDPlaceResponse *)self globalResult];
  uint64_t v4 = v3;
  if (!v3) {
    goto LABEL_15;
  }
  -[GEOPDPlaceGlobalResult _readSearchResult](v3);
  if (!*(void *)(v4 + 368))
  {
    -[GEOPDPlaceGlobalResult _readGeocodingResult](v4);
    if (*(void *)(v4 + 184))
    {
      -[GEOPDPlaceGlobalResult geocodingResult]((id *)v4);
      uint64_t v5 = (id *)objc_claimAutoreleasedReturnValue();
      uint64_t v6 = -[GEOPDGeocodingResult disambiguationLabels](v5);
      goto LABEL_10;
    }
    -[GEOPDPlaceGlobalResult _readLocationDirectedSearchResult](v4);
    if (*(void *)(v4 + 216))
    {
      -[GEOPDPlaceGlobalResult locationDirectedSearchResult]((id *)v4);
      uint64_t v5 = (id *)objc_claimAutoreleasedReturnValue();
      uint64_t v6 = -[GEOPDLocationDirectedSearchResult disambiguationLabels](v5);
      goto LABEL_10;
    }
LABEL_15:
    objc_super v7 = 0;
    goto LABEL_11;
  }
  -[GEOPDPlaceGlobalResult searchResult]((id *)v4);
  uint64_t v5 = (id *)objc_claimAutoreleasedReturnValue();
  uint64_t v6 = -[GEOPDSearchResult disambiguationLabels](v5);
LABEL_10:
  objc_super v7 = (void *)v6;

LABEL_11:
LABEL_12:

  return v7;
}

- (unint64_t)dotPlacesCount
{
  -[GEOPDPlaceResponse _readDotPlaces]((uint64_t)self);
  dotPlaces = self->_dotPlaces;

  return [(NSMutableArray *)dotPlaces count];
}

- (void)_readDotPlaces
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 128));
    if ((*(_WORD *)(a1 + 140) & 0x400) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOPDPlaceResponseReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readDotPlaces_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 128));
  }
}

- (void)setClientMetrics:(id)a3
{
  *(_WORD *)&self->_flags |= 0x8020u;
  objc_storeStrong((id *)&self->_clientMetrics, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_spokenLanguages, 0);
  objc_storeStrong((id *)&self->_legacyPlaceResults, 0);
  objc_storeStrong((id *)&self->_mapsResults, 0);
  objc_storeStrong((id *)&self->_globalResult, 0);
  objc_storeStrong((id *)&self->_dotPlaces, 0);
  objc_storeStrong((id *)&self->_displayRegion, 0);
  objc_storeStrong((id *)&self->_displayLanguages, 0);
  objc_storeStrong((id *)&self->_debugApiKey, 0);
  objc_storeStrong((id *)&self->_datasetAbStatus, 0);
  objc_storeStrong((id *)&self->_clientMetrics, 0);
  objc_storeStrong((id *)&self->_analyticData, 0);
  objc_storeStrong((id *)&self->_unknownFields, 0);

  objc_storeStrong((id *)&self->_reader, 0);
}

- (id)_initWithDictionary:(unsigned int)a3 isJSON:
{
  uint64_t v118 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  if (!a1) {
    goto LABEL_286;
  }
  a1 = (id)[a1 init];

  if (!a1) {
    goto LABEL_286;
  }
  uint64_t v6 = [v5 objectForKeyedSubscript:@"status"];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v7 = v6;
    if ([v7 isEqualToString:@"STATUS_SUCCESS"])
    {
      uint64_t v8 = 0;
    }
    else if ([v7 isEqualToString:@"STATUS_FAILED"])
    {
      uint64_t v8 = 1;
    }
    else if ([v7 isEqualToString:@"STATUS_INCOMPLETE"])
    {
      uint64_t v8 = 2;
    }
    else if ([v7 isEqualToString:@"INVALID_REQUEST"])
    {
      uint64_t v8 = 5;
    }
    else if ([v7 isEqualToString:@"FAILED_NO_RESULT"])
    {
      uint64_t v8 = 20;
    }
    else if ([v7 isEqualToString:@"NEEDS_REFINEMENT"])
    {
      uint64_t v8 = 30;
    }
    else if ([v7 isEqualToString:@"FAILED_NOT_AUTHORIZED"])
    {
      uint64_t v8 = 40;
    }
    else if ([v7 isEqualToString:@"STATUS_DEDUPED"])
    {
      uint64_t v8 = 50;
    }
    else if ([v7 isEqualToString:@"VERSION_MISMATCH"])
    {
      uint64_t v8 = 60;
    }
    else
    {
      uint64_t v8 = 0;
    }
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0) {
      goto LABEL_27;
    }
    uint64_t v8 = [v6 intValue];
  }
  [a1 setStatus:v8];
LABEL_27:

  if (a3) {
    uint64_t v9 = @"requestType";
  }
  else {
    uint64_t v9 = @"request_type";
  }
  int v10 = [v5 objectForKeyedSubscript:v9];
  objc_opt_class();
  id v92 = v5;
  if (objc_opt_isKindOfClass())
  {
    id v11 = v10;
    if ([v11 isEqualToString:@"REQUEST_TYPE_UNKNOWN"])
    {
      uint64_t v12 = 0;
    }
    else if ([v11 isEqualToString:@"REQUEST_TYPE_SEARCH"])
    {
      uint64_t v12 = 1;
    }
    else if ([v11 isEqualToString:@"REQUEST_TYPE_GEOCODING"])
    {
      uint64_t v12 = 2;
    }
    else if ([v11 isEqualToString:@"REQUEST_TYPE_CANONICAL_LOCATION_SEARCH"])
    {
      uint64_t v12 = 3;
    }
    else if ([v11 isEqualToString:@"REQUEST_TYPE_REVERSE_GEOCODING"])
    {
      uint64_t v12 = 4;
    }
    else if ([v11 isEqualToString:@"REQUEST_TYPE_PLACE_LOOKUP"])
    {
      uint64_t v12 = 5;
    }
    else if ([v11 isEqualToString:@"REQUEST_TYPE_MERCHANT_LOOKUP"])
    {
      uint64_t v12 = 6;
    }
    else if ([v11 isEqualToString:@"REQUEST_TYPE_PLACE_REFINEMENT"])
    {
      uint64_t v12 = 7;
    }
    else if ([v11 isEqualToString:@"REQUEST_TYPE_SIRI_SEARCH"])
    {
      uint64_t v12 = 8;
    }
    else if ([v11 isEqualToString:@"REQUEST_TYPE_LOCATION_DIRECTED_SEARCH"])
    {
      uint64_t v12 = 9;
    }
    else if ([v11 isEqualToString:@"REQUEST_TYPE_AUTOCOMPLETE"])
    {
      uint64_t v12 = 10;
    }
    else if ([v11 isEqualToString:@"REQUEST_TYPE_BROWSE_CATEGORY_SUGGESTION"])
    {
      uint64_t v12 = 11;
    }
    else if ([v11 isEqualToString:@"REQUEST_TYPE_CATEGORY_SEARCH"])
    {
      uint64_t v12 = 12;
    }
    else if ([v11 isEqualToString:@"REQUEST_TYPE_POPULAR_NEARBY_SEARCH"])
    {
      uint64_t v12 = 13;
    }
    else if ([v11 isEqualToString:@"REQUEST_TYPE_ZERO_KEYWORD_CATEGORY_SUGGESTION"])
    {
      uint64_t v12 = 14;
    }
    else if ([v11 isEqualToString:@"REQUEST_TYPE_SEARCH_FIELD_PLACEHOLDER"])
    {
      uint64_t v12 = 15;
    }
    else if ([v11 isEqualToString:@"REQUEST_TYPE_BATCH_POPULAR_NEARBY_SEARCH"])
    {
      uint64_t v12 = 16;
    }
    else if ([v11 isEqualToString:@"REQUEST_TYPE_VENDOR_SPECIFIC_PLACE_REFINEMENT"])
    {
      uint64_t v12 = 17;
    }
    else if ([v11 isEqualToString:@"REQUEST_TYPE_NEARBY_SEARCH"])
    {
      uint64_t v12 = 18;
    }
    else if ([v11 isEqualToString:@"REQUEST_TYPE_ADDRESS_OBJECT_GEOCODING"])
    {
      uint64_t v12 = 19;
    }
    else if ([v11 isEqualToString:@"REQUEST_TYPE_ZERO_KEYWORD_WITH_SEARCH_RESULTS_SUGGESTION"])
    {
      uint64_t v12 = 20;
    }
    else if ([v11 isEqualToString:@"REQUEST_TYPE_EXTERNAL_TRANSIT_LOOKUP"])
    {
      uint64_t v12 = 21;
    }
    else if ([v11 isEqualToString:@"REQUEST_TYPE_FEATURE_ID_GEOCODING"])
    {
      uint64_t v12 = 22;
    }
    else if ([v11 isEqualToString:@"REQUEST_TYPE_MAPS_IDENTIFIER_PLACE_LOOKUP"])
    {
      uint64_t v12 = 23;
    }
    else if ([v11 isEqualToString:@"REQUEST_TYPE_DATASET_STATUS_CHECK"])
    {
      uint64_t v12 = 24;
    }
    else if ([v11 isEqualToString:@"REQUEST_TYPE_OFFLINE_AREA_LOOKUP"])
    {
      uint64_t v12 = 25;
    }
    else if ([v11 isEqualToString:@"REQUEST_TYPE_BATCH_REVERSE_GEOCODING"])
    {
      uint64_t v12 = 26;
    }
    else if ([v11 isEqualToString:@"REQUEST_TYPE_OFFLINE_SUGGESTED_REGIONS"])
    {
      uint64_t v12 = 27;
    }
    else if ([v11 isEqualToString:@"REQUEST_TYPE_OFFLINE_POLYGON_QUAD_NODES"])
    {
      uint64_t v12 = 28;
    }
    else if ([v11 isEqualToString:@"REQUEST_TYPE_OFFLINE_PROACTIVE_REGIONS"])
    {
      uint64_t v12 = 29;
    }
    else if ([v11 isEqualToString:@"REQUEST_TYPE_BRAND_LOOKUP"])
    {
      uint64_t v12 = 30;
    }
    else if ([v11 isEqualToString:@"REQUEST_TYPE_OFFLINE_UPDATE_MANIFEST"])
    {
      uint64_t v12 = 31;
    }
    else if ([v11 isEqualToString:@"REQUEST_TYPE_WIFI_FINGERPRINT_LOOKUP"])
    {
      uint64_t v12 = 32;
    }
    else if ([v11 isEqualToString:@"REQUEST_TYPE_INITIAL_OFFLINE_SUGGESTION"])
    {
      uint64_t v12 = 33;
    }
    else if ([v11 isEqualToString:@"REQUEST_TYPE_IP_GEO_LOOKUP"])
    {
      uint64_t v12 = 34;
    }
    else if ([v11 isEqualToString:@"REQUEST_TYPE_GROUND_VIEW_LABEL"])
    {
      uint64_t v12 = 35;
    }
    else if ([v11 isEqualToString:@"REQUEST_TYPE_BATCH_SPATIAL_LOOKUP"])
    {
      uint64_t v12 = 36;
    }
    else if ([v11 isEqualToString:@"REQUEST_TYPE_TRANSIT_VEHICLE_POSITION"])
    {
      uint64_t v12 = 37;
    }
    else if ([v11 isEqualToString:@"REQUEST_TYPE_PLACE_COLLECTION_LOOKUP"])
    {
      uint64_t v12 = 38;
    }
    else if ([v11 isEqualToString:@"REQUEST_TYPE_TRANSIT_SCHEDULE_LOOKUP"])
    {
      uint64_t v12 = 39;
    }
    else if ([v11 isEqualToString:@"REQUEST_TYPE_BATCH_CATEGORY_LOOKUP"])
    {
      uint64_t v12 = 40;
    }
    else if ([v11 isEqualToString:@"REQUEST_TYPE_BATCH_MERCHANT_LOOKUP_BRAND"])
    {
      uint64_t v12 = 41;
    }
    else if ([v11 isEqualToString:@"REQUEST_TYPE_CHILD_PLACE_LOOKUP_BY_CATEGORY"])
    {
      uint64_t v12 = 42;
    }
    else if ([v11 isEqualToString:@"REQUEST_TYPE_COLLECTION_SUGGESTION"])
    {
      uint64_t v12 = 43;
    }
    else if ([v11 isEqualToString:@"REQUEST_TYPE_MAPS_SEARCH_HOME"])
    {
      uint64_t v12 = 44;
    }
    else if ([v11 isEqualToString:@"REQUEST_TYPE_PLACE_QUESTIONNAIRE_LOOKUP"])
    {
      uint64_t v12 = 45;
    }
    else if ([v11 isEqualToString:@"REQUEST_TYPE_PUBLISHER_VIEW"])
    {
      uint64_t v12 = 46;
    }
    else if ([v11 isEqualToString:@"REQUEST_TYPE_ALL_COLLECTIONS_VIEW"])
    {
      uint64_t v12 = 47;
    }
    else if ([v11 isEqualToString:@"REQUEST_TYPE_AIRPORT_ENTITY_PLACE_LOOKUP"])
    {
      uint64_t v12 = 48;
    }
    else if ([v11 isEqualToString:@"REQUEST_TYPE_TERRITORY_LOOKUP"])
    {
      uint64_t v12 = 49;
    }
    else if ([v11 isEqualToString:@"REQUEST_TYPE_TRANSIT_NEARBY_SCHEDULE_LOOKUP"])
    {
      uint64_t v12 = 50;
    }
    else if ([v11 isEqualToString:@"REQUEST_TYPE_MAPS_HOME"])
    {
      uint64_t v12 = 51;
    }
    else if ([v11 isEqualToString:@"REQUEST_TYPE_ALL_GUIDES_LOCATIONS"])
    {
      uint64_t v12 = 52;
    }
    else if ([v11 isEqualToString:@"REQUEST_TYPE_GUIDES_HOME"])
    {
      uint64_t v12 = 53;
    }
    else if ([v11 isEqualToString:@"REQUEST_TYPE_EXTENDED_GEO_LOOKUP"])
    {
      uint64_t v12 = 54;
    }
    else if ([v11 isEqualToString:@"REQUEST_TYPE_QUERY_UNDERSTANDING"])
    {
      uint64_t v12 = 55;
    }
    else if ([v11 isEqualToString:@"REQUEST_TYPE_POI_AT_ADDRESS_LOOKUP"])
    {
      uint64_t v12 = 56;
    }
    else if ([v11 isEqualToString:@"REQUEST_TYPE_TRANSIT_NEARBY_PAYMENT_METHOD_LOOKUP"])
    {
      uint64_t v12 = 57;
    }
    else if ([v11 isEqualToString:@"REQUEST_TYPE_PLACECARD_ENRICHMENT"])
    {
      uint64_t v12 = 58;
    }
    else if ([v11 isEqualToString:@"REQUEST_TYPE_OFFLINE_REGION_NAME"])
    {
      uint64_t v12 = 59;
    }
    else if ([v11 isEqualToString:@"REQUEST_TYPE_SEARCH_CAPABILITIES"])
    {
      uint64_t v12 = 60;
    }
    else if ([v11 isEqualToString:@"REQUEST_TYPE_REFRESH_ID_LOOKUP"])
    {
      uint64_t v12 = 61;
    }
    else if ([v11 isEqualToString:@"REQUEST_TYPE_ADDRESS_RECOMMENDATION"])
    {
      uint64_t v12 = 62;
    }
    else
    {
      uint64_t v12 = 0;
    }

    goto LABEL_161;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v12 = [v10 intValue];
LABEL_161:
    [a1 setRequestType:v12];
  }

  if (a3) {
    v13 = @"globalResult";
  }
  else {
    v13 = @"global_result";
  }
  long long v14 = [v5 objectForKeyedSubscript:v13];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    long long v15 = [GEOPDPlaceGlobalResult alloc];
    if (v15) {
      long long v16 = -[GEOPDPlaceGlobalResult _initWithDictionary:isJSON:](v15, v14, a3);
    }
    else {
      long long v16 = 0;
    }
    [a1 setGlobalResult:v16];
  }
  if (a3) {
    long long v17 = @"placeResult";
  }
  else {
    long long v17 = @"place_result";
  }
  v18 = [v5 objectForKeyedSubscript:v17];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    long long v111 = 0u;
    long long v112 = 0u;
    long long v109 = 0u;
    long long v110 = 0u;
    v91 = v18;
    id v19 = v18;
    uint64_t v20 = [v19 countByEnumeratingWithState:&v109 objects:v117 count:16];
    if (v20)
    {
      uint64_t v21 = v20;
      uint64_t v22 = *(void *)v110;
      do
      {
        for (uint64_t i = 0; i != v21; ++i)
        {
          if (*(void *)v110 != v22) {
            objc_enumerationMutation(v19);
          }
          uint64_t v24 = *(void *)(*((void *)&v109 + 1) + 8 * i);
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            v25 = [GEOPDPlace alloc];
            if (a3) {
              uint64_t v26 = [(GEOPDPlace *)v25 initWithJSON:v24];
            }
            else {
              uint64_t v26 = [(GEOPDPlace *)v25 initWithDictionary:v24];
            }
            v27 = (void *)v26;
            objc_msgSend(a1, "addLegacyPlaceResult:", v26, v91);
          }
        }
        uint64_t v21 = [v19 countByEnumeratingWithState:&v109 objects:v117 count:16];
      }
      while (v21);
    }

    v18 = v91;
  }

  if (a3) {
    v28 = @"displayLanguage";
  }
  else {
    v28 = @"display_language";
  }
  v29 = objc_msgSend(v5, "objectForKeyedSubscript:", v28, v91);
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    long long v107 = 0u;
    long long v108 = 0u;
    long long v105 = 0u;
    long long v106 = 0u;
    id v30 = v29;
    uint64_t v31 = [v30 countByEnumeratingWithState:&v105 objects:v116 count:16];
    if (v31)
    {
      uint64_t v32 = v31;
      uint64_t v33 = *(void *)v106;
      do
      {
        for (uint64_t j = 0; j != v32; ++j)
        {
          if (*(void *)v106 != v33) {
            objc_enumerationMutation(v30);
          }
          v35 = *(void **)(*((void *)&v105 + 1) + 8 * j);
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            v36 = (void *)[v35 copy];
            [a1 addDisplayLanguage:v36];
          }
        }
        uint64_t v32 = [v30 countByEnumeratingWithState:&v105 objects:v116 count:16];
      }
      while (v32);
    }

    id v5 = v92;
  }

  if (a3) {
    v37 = @"displayRegion";
  }
  else {
    v37 = @"display_region";
  }
  v38 = [v5 objectForKeyedSubscript:v37];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v39 = (void *)[v38 copy];
    [a1 setDisplayRegion:v39];
  }
  if (a3) {
    v40 = @"spokenLanguage";
  }
  else {
    v40 = @"spoken_language";
  }
  v41 = [v5 objectForKeyedSubscript:v40];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    long long v103 = 0u;
    long long v104 = 0u;
    long long v101 = 0u;
    long long v102 = 0u;
    id v42 = v41;
    uint64_t v43 = [v42 countByEnumeratingWithState:&v101 objects:v115 count:16];
    if (v43)
    {
      uint64_t v44 = v43;
      uint64_t v45 = *(void *)v102;
      do
      {
        for (uint64_t k = 0; k != v44; ++k)
        {
          if (*(void *)v102 != v45) {
            objc_enumerationMutation(v42);
          }
          v47 = *(void **)(*((void *)&v101 + 1) + 8 * k);
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            v48 = (void *)[v47 copy];
            [a1 addSpokenLanguage:v48];
          }
        }
        uint64_t v44 = [v42 countByEnumeratingWithState:&v101 objects:v115 count:16];
      }
      while (v44);
    }

    id v5 = v92;
  }

  if (a3) {
    v49 = @"debugApiKey";
  }
  else {
    v49 = @"debug_api_key";
  }
  v50 = [v5 objectForKeyedSubscript:v49];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v51 = (void *)[v50 copy];
    [a1 setDebugApiKey:v51];
  }
  if (a3) {
    v52 = @"datasetAbStatus";
  }
  else {
    v52 = @"dataset_ab_status";
  }
  v53 = [v5 objectForKeyedSubscript:v52];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v54 = [GEOPDDatasetABStatus alloc];
    if (a3) {
      uint64_t v55 = [(GEOPDDatasetABStatus *)v54 initWithJSON:v53];
    }
    else {
      uint64_t v55 = [(GEOPDDatasetABStatus *)v54 initWithDictionary:v53];
    }
    v56 = (void *)v55;
    [a1 setDatasetAbStatus:v55];
  }
  if (a3) {
    v57 = @"mapsResult";
  }
  else {
    v57 = @"maps_result";
  }
  v58 = [v5 objectForKeyedSubscript:v57];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    long long v99 = 0u;
    long long v100 = 0u;
    long long v97 = 0u;
    long long v98 = 0u;
    id v59 = v58;
    uint64_t v60 = [v59 countByEnumeratingWithState:&v97 objects:v114 count:16];
    if (v60)
    {
      uint64_t v61 = v60;
      uint64_t v62 = *(void *)v98;
      do
      {
        for (uint64_t m = 0; m != v61; ++m)
        {
          if (*(void *)v98 != v62) {
            objc_enumerationMutation(v59);
          }
          uint64_t v64 = *(void *)(*((void *)&v97 + 1) + 8 * m);
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            v65 = [GEOPDMapsResult alloc];
            if (a3) {
              uint64_t v66 = [(GEOPDMapsResult *)v65 initWithJSON:v64];
            }
            else {
              uint64_t v66 = [(GEOPDMapsResult *)v65 initWithDictionary:v64];
            }
            v67 = (void *)v66;
            [a1 addMapsResult:v66];
          }
        }
        uint64_t v61 = [v59 countByEnumeratingWithState:&v97 objects:v114 count:16];
      }
      while (v61);
    }

    id v5 = v92;
  }

  if (a3) {
    v68 = @"dotPlace";
  }
  else {
    v68 = @"dot_place";
  }
  v69 = [v5 objectForKeyedSubscript:v68];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    long long v95 = 0u;
    long long v96 = 0u;
    long long v93 = 0u;
    long long v94 = 0u;
    id v70 = v69;
    uint64_t v71 = [v70 countByEnumeratingWithState:&v93 objects:v113 count:16];
    if (v71)
    {
      uint64_t v72 = v71;
      uint64_t v73 = *(void *)v94;
      do
      {
        uint64_t v74 = 0;
        do
        {
          if (*(void *)v94 != v73) {
            objc_enumerationMutation(v70);
          }
          v75 = *(void **)(*((void *)&v93 + 1) + 8 * v74);
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            v76 = [GEOPDDotPlace alloc];
            if (v76) {
              v77 = (void *)-[GEOPDDotPlace _initWithDictionary:isJSON:]((uint64_t)v76, v75, a3);
            }
            else {
              v77 = 0;
            }
            [a1 addDotPlace:v77];
          }
          ++v74;
        }
        while (v72 != v74);
        uint64_t v78 = [v70 countByEnumeratingWithState:&v93 objects:v113 count:16];
        uint64_t v72 = v78;
      }
      while (v78);
    }

    id v5 = v92;
  }

  if (a3) {
    v79 = @"analyticData";
  }
  else {
    v79 = @"analytic_data";
  }
  v80 = [v5 objectForKeyedSubscript:v79];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v81 = [GEOPDPlacesRequestResponseAnalyticsData alloc];
    if (a3) {
      uint64_t v82 = [(GEOPDPlacesRequestResponseAnalyticsData *)v81 initWithJSON:v80];
    }
    else {
      uint64_t v82 = [(GEOPDPlacesRequestResponseAnalyticsData *)v81 initWithDictionary:v80];
    }
    v83 = (void *)v82;
    [a1 setAnalyticData:v82];
  }
  if (a3) {
    v84 = @"debugLatencyMs";
  }
  else {
    v84 = @"debug_latency_ms";
  }
  v85 = [v5 objectForKeyedSubscript:v84];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    objc_msgSend(a1, "setDebugLatencyMs:", objc_msgSend(v85, "unsignedLongLongValue"));
  }

  v86 = [v5 objectForKeyedSubscript:@"clientMetrics"];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v87 = [GEOClientMetrics alloc];
    if (a3) {
      uint64_t v88 = [(GEOClientMetrics *)v87 initWithJSON:v86];
    }
    else {
      uint64_t v88 = [(GEOClientMetrics *)v87 initWithDictionary:v86];
    }
    v89 = (void *)v88;
    [a1 setClientMetrics:v88];
  }
  a1 = a1;

LABEL_286:
  return a1;
}

- (void)writeTo:(id)a3
{
  uint64_t v54 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  p_readerLocuint64_t k = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  if (self->_reader && (_GEOPDPlaceResponseIsDirty((uint64_t)self) & 1) == 0)
  {
    v27 = self->_reader;
    objc_sync_enter(v27);
    *(void *)((char *)self->_reader + (int)*MEMORY[0x1E4F940E0]) = self->_readerMarkLength;
    [(PBDataReader *)self->_reader seekToOffset:self->_readerMarkPos];
    v28 = [(PBDataReader *)self->_reader readBytes:self->_readerMarkLength - self->_readerMarkPos];
    [v4 writeData:v28];
    os_unfair_lock_unlock(p_readerLock);

    objc_sync_exit(v27);
  }
  else
  {
    os_unfair_lock_unlock(&self->_readerLock);
    [(GEOPDPlaceResponse *)self readAll:0];
    __int16 flags = (__int16)self->_flags;
    if ((flags & 4) != 0)
    {
      PBDataWriterWriteInt32Field();
      __int16 flags = (__int16)self->_flags;
    }
    if ((flags & 2) != 0) {
      PBDataWriterWriteInt32Field();
    }
    if (self->_globalResult) {
      PBDataWriterWriteSubmessage();
    }
    long long v47 = 0u;
    long long v48 = 0u;
    long long v45 = 0u;
    long long v46 = 0u;
    id v7 = self->_legacyPlaceResults;
    uint64_t v8 = [(NSMutableArray *)v7 countByEnumeratingWithState:&v45 objects:v53 count:16];
    if (v8)
    {
      uint64_t v9 = *(void *)v46;
      do
      {
        uint64_t v10 = 0;
        do
        {
          if (*(void *)v46 != v9) {
            objc_enumerationMutation(v7);
          }
          PBDataWriterWriteSubmessage();
          ++v10;
        }
        while (v8 != v10);
        uint64_t v8 = [(NSMutableArray *)v7 countByEnumeratingWithState:&v45 objects:v53 count:16];
      }
      while (v8);
    }

    long long v43 = 0u;
    long long v44 = 0u;
    long long v41 = 0u;
    long long v42 = 0u;
    id v11 = self->_displayLanguages;
    uint64_t v12 = [(NSMutableArray *)v11 countByEnumeratingWithState:&v41 objects:v52 count:16];
    if (v12)
    {
      uint64_t v13 = *(void *)v42;
      do
      {
        uint64_t v14 = 0;
        do
        {
          if (*(void *)v42 != v13) {
            objc_enumerationMutation(v11);
          }
          PBDataWriterWriteStringField();
          ++v14;
        }
        while (v12 != v14);
        uint64_t v12 = [(NSMutableArray *)v11 countByEnumeratingWithState:&v41 objects:v52 count:16];
      }
      while (v12);
    }

    if (self->_displayRegion) {
      PBDataWriterWriteStringField();
    }
    long long v39 = 0u;
    long long v40 = 0u;
    long long v37 = 0u;
    long long v38 = 0u;
    long long v15 = self->_spokenLanguages;
    uint64_t v16 = [(NSMutableArray *)v15 countByEnumeratingWithState:&v37 objects:v51 count:16];
    if (v16)
    {
      uint64_t v17 = *(void *)v38;
      do
      {
        uint64_t v18 = 0;
        do
        {
          if (*(void *)v38 != v17) {
            objc_enumerationMutation(v15);
          }
          PBDataWriterWriteStringField();
          ++v18;
        }
        while (v16 != v18);
        uint64_t v16 = [(NSMutableArray *)v15 countByEnumeratingWithState:&v37 objects:v51 count:16];
      }
      while (v16);
    }

    if (self->_debugApiKey) {
      PBDataWriterWriteStringField();
    }
    if (self->_datasetAbStatus) {
      PBDataWriterWriteSubmessage();
    }
    long long v35 = 0u;
    long long v36 = 0u;
    long long v33 = 0u;
    long long v34 = 0u;
    id v19 = self->_mapsResults;
    uint64_t v20 = [(NSMutableArray *)v19 countByEnumeratingWithState:&v33 objects:v50 count:16];
    if (v20)
    {
      uint64_t v21 = *(void *)v34;
      do
      {
        uint64_t v22 = 0;
        do
        {
          if (*(void *)v34 != v21) {
            objc_enumerationMutation(v19);
          }
          PBDataWriterWriteSubmessage();
          ++v22;
        }
        while (v20 != v22);
        uint64_t v20 = [(NSMutableArray *)v19 countByEnumeratingWithState:&v33 objects:v50 count:16];
      }
      while (v20);
    }

    long long v31 = 0u;
    long long v32 = 0u;
    long long v29 = 0u;
    long long v30 = 0u;
    v23 = self->_dotPlaces;
    uint64_t v24 = [(NSMutableArray *)v23 countByEnumeratingWithState:&v29 objects:v49 count:16];
    if (v24)
    {
      uint64_t v25 = *(void *)v30;
      do
      {
        uint64_t v26 = 0;
        do
        {
          if (*(void *)v30 != v25) {
            objc_enumerationMutation(v23);
          }
          PBDataWriterWriteSubmessage();
          ++v26;
        }
        while (v24 != v26);
        uint64_t v24 = [(NSMutableArray *)v23 countByEnumeratingWithState:&v29 objects:v49 count:16];
      }
      while (v24);
    }

    if (self->_analyticData) {
      PBDataWriterWriteSubmessage();
    }
    if (*(_WORD *)&self->_flags) {
      PBDataWriterWriteUint64Field();
    }
    if (self->_clientMetrics) {
      PBDataWriterWriteSubmessage();
    }
    -[PBUnknownFields writeTo:](self->_unknownFields, "writeTo:", v4, v29);
  }
}

- (void)readAll:(BOOL)a3
{
  BOOL v3 = a3;
  p_readerLocuint64_t k = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  reader = self->_reader;
  if (reader)
  {
    id v7 = reader;
    objc_sync_enter(v7);
    if (v3) {
      uint64_t v8 = (int *)&readAll__recursiveTag_5957;
    }
    else {
      uint64_t v8 = (int *)&readAll__nonRecursiveTag_5958;
    }
    GEOPDPlaceResponseReadSpecified((uint64_t)self, (unint64_t)self->_reader, v8);
    objc_sync_exit(v7);
  }
  if (v3) {
    _GEOPDPlaceResponseCallReadAllRecursiveWithoutSynchronized((uint64_t)self);
  }

  os_unfair_lock_unlock(p_readerLock);
}

- (void)_addNoFlagsMapsResult:(uint64_t)a1
{
  id v3 = a2;
  if (a1)
  {
    id v4 = *(void **)(a1 + 96);
    id v7 = v3;
    if (!v4)
    {
      id v5 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
      uint64_t v6 = *(void **)(a1 + 96);
      *(void *)(a1 + 96) = v5;

      id v4 = *(void **)(a1 + 96);
    }
    [v4 addObject:v7];
    id v3 = v7;
  }
}

- (void)_addNoFlagsDisplayLanguage:(uint64_t)a1
{
  id v3 = a2;
  if (a1)
  {
    id v4 = *(void **)(a1 + 64);
    id v7 = v3;
    if (!v4)
    {
      id v5 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
      uint64_t v6 = *(void **)(a1 + 64);
      *(void *)(a1 + 64) = v5;

      id v4 = *(void **)(a1 + 64);
    }
    [v4 addObject:v7];
    id v3 = v7;
  }
}

- (BOOL)readFrom:(id)a3
{
  return GEOPDPlaceResponseReadAllFrom((uint64_t)self, a3, 0);
}

- (GEOPDPlaceResponse)init
{
  v6.receiver = self;
  v6.super_class = (Class)GEOPDPlaceResponse;
  v2 = [(GEOPDPlaceResponse *)&v6 init];
  id v3 = v2;
  if (v2)
  {
    v2->_readerLock._os_unfair_lock_opaque = 0;
    id v4 = v2;
  }

  return v3;
}

+ (BOOL)isValid:(id)a3
{
  return GEOPDPlaceResponseIsValid((char *)a3);
}

- (void)setMapsResults:(id)a3
{
  id v4 = (NSMutableArray *)a3;
  os_unfair_lock_lock_with_options();
  *(_WORD *)&self->_flags |= 0x1000u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(_WORD *)&self->_flags |= 0x8000u;
  mapsResults = self->_mapsResults;
  self->_mapsResults = v4;
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  uint64_t v88 = *MEMORY[0x1E4F143B8];
  if (!a1)
  {
    id v5 = 0;
    goto LABEL_123;
  }
  [(id)a1 readAll:1];
  unint64_t v4 = 0x1E4F1C000uLL;
  id v5 = [MEMORY[0x1E4F1CA60] dictionary];
  __int16 v6 = *(_WORD *)(a1 + 140);
  if ((v6 & 4) != 0)
  {
    int v7 = *(_DWORD *)(a1 + 136);
    if (v7 <= 29)
    {
      uint64_t v8 = @"STATUS_SUCCESS";
      switch(v7)
      {
        case 0:
          goto LABEL_20;
        case 1:
          uint64_t v8 = @"STATUS_FAILED";
          break;
        case 2:
          uint64_t v8 = @"STATUS_INCOMPLETE";
          break;
        case 3:
        case 4:
          goto LABEL_15;
        case 5:
          uint64_t v8 = @"INVALID_REQUEST";
          break;
        default:
          if (v7 != 20) {
            goto LABEL_15;
          }
          uint64_t v8 = @"FAILED_NO_RESULT";
          break;
      }
      goto LABEL_20;
    }
    if (v7 > 49)
    {
      if (v7 == 50)
      {
        uint64_t v8 = @"STATUS_DEDUPED";
        goto LABEL_20;
      }
      if (v7 == 60)
      {
        uint64_t v8 = @"VERSION_MISMATCH";
        goto LABEL_20;
      }
    }
    else
    {
      if (v7 == 30)
      {
        uint64_t v8 = @"NEEDS_REFINEMENT";
        goto LABEL_20;
      }
      if (v7 == 40)
      {
        uint64_t v8 = @"FAILED_NOT_AUTHORIZED";
LABEL_20:
        [v5 setObject:v8 forKey:@"status"];

        __int16 v6 = *(_WORD *)(a1 + 140);
        goto LABEL_21;
      }
    }
LABEL_15:
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(unsigned int *)(a1 + 136));
    uint64_t v8 = (__CFString *)objc_claimAutoreleasedReturnValue();
    goto LABEL_20;
  }
LABEL_21:
  if ((v6 & 2) != 0)
  {
    uint64_t v9 = *(int *)(a1 + 132);
    if (v9 >= 0x3F)
    {
      objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(int *)(a1 + 132));
      uint64_t v10 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      uint64_t v10 = off_1E53DCC68[v9];
    }
    if (a2) {
      id v11 = @"requestType";
    }
    else {
      id v11 = @"request_type";
    }
    [v5 setObject:v10 forKey:v11];
  }
  uint64_t v12 = [(id)a1 globalResult];
  uint64_t v13 = v12;
  if (v12)
  {
    if (a2)
    {
      uint64_t v14 = [v12 jsonRepresentation];
      long long v15 = @"globalResult";
    }
    else
    {
      uint64_t v14 = [v12 dictionaryRepresentation];
      long long v15 = @"global_result";
    }
    [v5 setObject:v14 forKey:v15];
  }
  if ([*(id *)(a1 + 104) count])
  {
    uint64_t v16 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(*(id *)(a1 + 104), "count"));
    long long v81 = 0u;
    long long v82 = 0u;
    long long v83 = 0u;
    long long v84 = 0u;
    id v17 = *(id *)(a1 + 104);
    uint64_t v18 = [v17 countByEnumeratingWithState:&v81 objects:v87 count:16];
    if (v18)
    {
      uint64_t v19 = v18;
      uint64_t v20 = *(void *)v82;
      do
      {
        for (uint64_t i = 0; i != v19; ++i)
        {
          if (*(void *)v82 != v20) {
            objc_enumerationMutation(v17);
          }
          uint64_t v22 = *(void **)(*((void *)&v81 + 1) + 8 * i);
          if (a2) {
            [v22 jsonRepresentation];
          }
          else {
          v23 = [v22 dictionaryRepresentation];
          }
          [v16 addObject:v23];
        }
        uint64_t v19 = [v17 countByEnumeratingWithState:&v81 objects:v87 count:16];
      }
      while (v19);
    }

    if (a2) {
      uint64_t v24 = @"placeResult";
    }
    else {
      uint64_t v24 = @"place_result";
    }
    [v5 setObject:v16 forKey:v24];

    unint64_t v4 = 0x1E4F1C000;
  }
  if (*(void *)(a1 + 64))
  {
    uint64_t v25 = [(id)a1 displayLanguages];
    if (a2) {
      uint64_t v26 = @"displayLanguage";
    }
    else {
      uint64_t v26 = @"display_language";
    }
    [v5 setObject:v25 forKey:v26];
  }
  v27 = [(id)a1 displayRegion];
  if (v27)
  {
    if (a2) {
      v28 = @"displayRegion";
    }
    else {
      v28 = @"display_region";
    }
    [v5 setObject:v27 forKey:v28];
  }

  if (*(void *)(a1 + 112))
  {
    long long v29 = [(id)a1 spokenLanguages];
    if (a2) {
      long long v30 = @"spokenLanguage";
    }
    else {
      long long v30 = @"spoken_language";
    }
    [v5 setObject:v29 forKey:v30];
  }
  long long v31 = [(id)a1 debugApiKey];
  if (v31)
  {
    if (a2) {
      long long v32 = @"debugApiKey";
    }
    else {
      long long v32 = @"debug_api_key";
    }
    [v5 setObject:v31 forKey:v32];
  }

  long long v33 = [(id)a1 datasetAbStatus];
  long long v34 = v33;
  if (v33)
  {
    if (a2)
    {
      long long v35 = [v33 jsonRepresentation];
      long long v36 = @"datasetAbStatus";
    }
    else
    {
      long long v35 = [v33 dictionaryRepresentation];
      long long v36 = @"dataset_ab_status";
    }
    [v5 setObject:v35 forKey:v36];
  }
  if ([*(id *)(a1 + 96) count])
  {
    long long v37 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(*(id *)(a1 + 96), "count"));
    long long v77 = 0u;
    long long v78 = 0u;
    long long v79 = 0u;
    long long v80 = 0u;
    id v38 = *(id *)(a1 + 96);
    uint64_t v39 = [v38 countByEnumeratingWithState:&v77 objects:v86 count:16];
    if (v39)
    {
      uint64_t v40 = v39;
      uint64_t v41 = *(void *)v78;
      do
      {
        for (uint64_t j = 0; j != v40; ++j)
        {
          if (*(void *)v78 != v41) {
            objc_enumerationMutation(v38);
          }
          long long v43 = *(void **)(*((void *)&v77 + 1) + 8 * j);
          if (a2) {
            [v43 jsonRepresentation];
          }
          else {
          long long v44 = [v43 dictionaryRepresentation];
          }
          [v37 addObject:v44];
        }
        uint64_t v40 = [v38 countByEnumeratingWithState:&v77 objects:v86 count:16];
      }
      while (v40);
    }

    if (a2) {
      long long v45 = @"mapsResult";
    }
    else {
      long long v45 = @"maps_result";
    }
    [v5 setObject:v37 forKey:v45];

    unint64_t v4 = 0x1E4F1C000uLL;
  }
  if ([*(id *)(a1 + 80) count])
  {
    long long v46 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(*(id *)(a1 + 80), "count"));
    long long v73 = 0u;
    long long v74 = 0u;
    long long v75 = 0u;
    long long v76 = 0u;
    id v47 = *(id *)(a1 + 80);
    uint64_t v48 = [v47 countByEnumeratingWithState:&v73 objects:v85 count:16];
    if (v48)
    {
      uint64_t v49 = v48;
      uint64_t v50 = *(void *)v74;
      do
      {
        for (uint64_t k = 0; k != v49; ++k)
        {
          if (*(void *)v74 != v50) {
            objc_enumerationMutation(v47);
          }
          v52 = *(void **)(*((void *)&v73 + 1) + 8 * k);
          if (a2) {
            [v52 jsonRepresentation];
          }
          else {
          v53 = [v52 dictionaryRepresentation];
          }
          [v46 addObject:v53];
        }
        uint64_t v49 = [v47 countByEnumeratingWithState:&v73 objects:v85 count:16];
      }
      while (v49);
    }

    if (a2) {
      uint64_t v54 = @"dotPlace";
    }
    else {
      uint64_t v54 = @"dot_place";
    }
    [v5 setObject:v46 forKey:v54];
  }
  uint64_t v55 = [(id)a1 analyticData];
  v56 = v55;
  if (v55)
  {
    if (a2)
    {
      v57 = [v55 jsonRepresentation];
      v58 = @"analyticData";
    }
    else
    {
      v57 = [v55 dictionaryRepresentation];
      v58 = @"analytic_data";
    }
    [v5 setObject:v57 forKey:v58];
  }
  if (*(_WORD *)(a1 + 140))
  {
    id v59 = [NSNumber numberWithUnsignedLongLong:*(void *)(a1 + 56)];
    if (a2) {
      uint64_t v60 = @"debugLatencyMs";
    }
    else {
      uint64_t v60 = @"debug_latency_ms";
    }
    [v5 setObject:v59 forKey:v60];
  }
  uint64_t v61 = [(id)a1 clientMetrics];
  uint64_t v62 = v61;
  if (v61)
  {
    if (a2) {
      [v61 jsonRepresentation];
    }
    else {
    v63 = [v61 dictionaryRepresentation];
    }
    [v5 setObject:v63 forKey:@"clientMetrics"];
  }
  uint64_t v64 = *(void **)(a1 + 16);
  if (v64)
  {
    v65 = [v64 dictionaryRepresentation];
    uint64_t v66 = v65;
    if (a2)
    {
      v67 = objc_msgSend(*(id *)(v4 + 2656), "dictionaryWithCapacity:", objc_msgSend(v65, "count"));
      v71[0] = MEMORY[0x1E4F143A8];
      v71[1] = 3221225472;
      v71[2] = __48__GEOPDPlaceResponse__dictionaryRepresentation___block_invoke;
      v71[3] = &unk_1E53D8860;
      id v68 = v67;
      id v72 = v68;
      [v66 enumerateKeysAndObjectsUsingBlock:v71];
      id v69 = v68;

      uint64_t v66 = v69;
    }
    [v5 setObject:v66 forKey:@"Unknown Fields"];
  }
LABEL_123:

  return v5;
}

- (void)_addNoFlagsSpokenLanguage:(uint64_t)a1
{
  id v3 = a2;
  if (a1)
  {
    unint64_t v4 = *(void **)(a1 + 112);
    id v7 = v3;
    if (!v4)
    {
      id v5 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
      __int16 v6 = *(void **)(a1 + 112);
      *(void *)(a1 + 112) = v5;

      unint64_t v4 = *(void **)(a1 + 112);
    }
    [v4 addObject:v7];
    id v3 = v7;
  }
}

- (void)setStatus:(int)a3
{
  *(_WORD *)&self->_flags |= 0x8004u;
  self->_status = a3;
}

- (void)setHasStatus:(BOOL)a3
{
  if (a3) {
    __int16 v3 = -32764;
  }
  else {
    __int16 v3 = 0x8000;
  }
  *(_WORD *)&self->___int16 flags = *(_WORD *)&self->_flags & 0xFFFB | v3;
}

- (BOOL)hasStatus
{
  return (*(_WORD *)&self->_flags >> 2) & 1;
}

- (id)statusAsString:(int)a3
{
  if (a3 <= 29)
  {
    unint64_t v4 = @"STATUS_SUCCESS";
    switch(a3)
    {
      case 0:
        goto LABEL_22;
      case 1:
        unint64_t v4 = @"STATUS_FAILED";
        break;
      case 2:
        unint64_t v4 = @"STATUS_INCOMPLETE";
        break;
      case 3:
      case 4:
        goto LABEL_21;
      case 5:
        unint64_t v4 = @"INVALID_REQUEST";
        break;
      default:
        if (a3 != 20) {
          goto LABEL_21;
        }
        unint64_t v4 = @"FAILED_NO_RESULT";
        break;
    }
    return v4;
  }
  if (a3 > 49)
  {
    if (a3 == 50)
    {
      unint64_t v4 = @"STATUS_DEDUPED";
    }
    else
    {
      if (a3 != 60) {
        goto LABEL_21;
      }
      unint64_t v4 = @"VERSION_MISMATCH";
    }
  }
  else
  {
    if (a3 != 30)
    {
      if (a3 == 40)
      {
        unint64_t v4 = @"FAILED_NOT_AUTHORIZED";
        return v4;
      }
LABEL_21:
      objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
      unint64_t v4 = (__CFString *)objc_claimAutoreleasedReturnValue();
LABEL_22:
      return v4;
    }
    unint64_t v4 = @"NEEDS_REFINEMENT";
  }
  return v4;
}

- (int)StringAsStatus:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"STATUS_SUCCESS"])
  {
    int v4 = 0;
  }
  else if ([v3 isEqualToString:@"STATUS_FAILED"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"STATUS_INCOMPLETE"])
  {
    int v4 = 2;
  }
  else if ([v3 isEqualToString:@"INVALID_REQUEST"])
  {
    int v4 = 5;
  }
  else if ([v3 isEqualToString:@"FAILED_NO_RESULT"])
  {
    int v4 = 20;
  }
  else if ([v3 isEqualToString:@"NEEDS_REFINEMENT"])
  {
    int v4 = 30;
  }
  else if ([v3 isEqualToString:@"FAILED_NOT_AUTHORIZED"])
  {
    int v4 = 40;
  }
  else if ([v3 isEqualToString:@"STATUS_DEDUPED"])
  {
    int v4 = 50;
  }
  else if ([v3 isEqualToString:@"VERSION_MISMATCH"])
  {
    int v4 = 60;
  }
  else
  {
    int v4 = 0;
  }

  return v4;
}

- (int)requestType
{
  p_readerLocuint64_t k = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  __int16 flags = (__int16)self->_flags;
  os_unfair_lock_unlock(p_readerLock);
  if ((flags & 2) != 0) {
    return self->_requestType;
  }
  else {
    return 0;
  }
}

- (void)setRequestType:(int)a3
{
  *(_WORD *)&self->_flags |= 0x8002u;
  self->_requestType = a3;
}

- (void)setHasRequestType:(BOOL)a3
{
  if (a3) {
    __int16 v3 = -32766;
  }
  else {
    __int16 v3 = 0x8000;
  }
  *(_WORD *)&self->___int16 flags = *(_WORD *)&self->_flags & 0xFFFD | v3;
}

- (BOOL)hasRequestType
{
  return (*(_WORD *)&self->_flags >> 1) & 1;
}

- (id)requestTypeAsString:(int)a3
{
  if (a3 >= 0x3F)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
    __int16 v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    __int16 v3 = off_1E53DCC68[a3];
  }

  return v3;
}

- (int)StringAsRequestType:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"REQUEST_TYPE_UNKNOWN"])
  {
    int v4 = 0;
  }
  else if ([v3 isEqualToString:@"REQUEST_TYPE_SEARCH"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"REQUEST_TYPE_GEOCODING"])
  {
    int v4 = 2;
  }
  else if ([v3 isEqualToString:@"REQUEST_TYPE_CANONICAL_LOCATION_SEARCH"])
  {
    int v4 = 3;
  }
  else if ([v3 isEqualToString:@"REQUEST_TYPE_REVERSE_GEOCODING"])
  {
    int v4 = 4;
  }
  else if ([v3 isEqualToString:@"REQUEST_TYPE_PLACE_LOOKUP"])
  {
    int v4 = 5;
  }
  else if ([v3 isEqualToString:@"REQUEST_TYPE_MERCHANT_LOOKUP"])
  {
    int v4 = 6;
  }
  else if ([v3 isEqualToString:@"REQUEST_TYPE_PLACE_REFINEMENT"])
  {
    int v4 = 7;
  }
  else if ([v3 isEqualToString:@"REQUEST_TYPE_SIRI_SEARCH"])
  {
    int v4 = 8;
  }
  else if ([v3 isEqualToString:@"REQUEST_TYPE_LOCATION_DIRECTED_SEARCH"])
  {
    int v4 = 9;
  }
  else if ([v3 isEqualToString:@"REQUEST_TYPE_AUTOCOMPLETE"])
  {
    int v4 = 10;
  }
  else if ([v3 isEqualToString:@"REQUEST_TYPE_BROWSE_CATEGORY_SUGGESTION"])
  {
    int v4 = 11;
  }
  else if ([v3 isEqualToString:@"REQUEST_TYPE_CATEGORY_SEARCH"])
  {
    int v4 = 12;
  }
  else if ([v3 isEqualToString:@"REQUEST_TYPE_POPULAR_NEARBY_SEARCH"])
  {
    int v4 = 13;
  }
  else if ([v3 isEqualToString:@"REQUEST_TYPE_ZERO_KEYWORD_CATEGORY_SUGGESTION"])
  {
    int v4 = 14;
  }
  else if ([v3 isEqualToString:@"REQUEST_TYPE_SEARCH_FIELD_PLACEHOLDER"])
  {
    int v4 = 15;
  }
  else if ([v3 isEqualToString:@"REQUEST_TYPE_BATCH_POPULAR_NEARBY_SEARCH"])
  {
    int v4 = 16;
  }
  else if ([v3 isEqualToString:@"REQUEST_TYPE_VENDOR_SPECIFIC_PLACE_REFINEMENT"])
  {
    int v4 = 17;
  }
  else if ([v3 isEqualToString:@"REQUEST_TYPE_NEARBY_SEARCH"])
  {
    int v4 = 18;
  }
  else if ([v3 isEqualToString:@"REQUEST_TYPE_ADDRESS_OBJECT_GEOCODING"])
  {
    int v4 = 19;
  }
  else if ([v3 isEqualToString:@"REQUEST_TYPE_ZERO_KEYWORD_WITH_SEARCH_RESULTS_SUGGESTION"])
  {
    int v4 = 20;
  }
  else if ([v3 isEqualToString:@"REQUEST_TYPE_EXTERNAL_TRANSIT_LOOKUP"])
  {
    int v4 = 21;
  }
  else if ([v3 isEqualToString:@"REQUEST_TYPE_FEATURE_ID_GEOCODING"])
  {
    int v4 = 22;
  }
  else if ([v3 isEqualToString:@"REQUEST_TYPE_MAPS_IDENTIFIER_PLACE_LOOKUP"])
  {
    int v4 = 23;
  }
  else if ([v3 isEqualToString:@"REQUEST_TYPE_DATASET_STATUS_CHECK"])
  {
    int v4 = 24;
  }
  else if ([v3 isEqualToString:@"REQUEST_TYPE_OFFLINE_AREA_LOOKUP"])
  {
    int v4 = 25;
  }
  else if ([v3 isEqualToString:@"REQUEST_TYPE_BATCH_REVERSE_GEOCODING"])
  {
    int v4 = 26;
  }
  else if ([v3 isEqualToString:@"REQUEST_TYPE_OFFLINE_SUGGESTED_REGIONS"])
  {
    int v4 = 27;
  }
  else if ([v3 isEqualToString:@"REQUEST_TYPE_OFFLINE_POLYGON_QUAD_NODES"])
  {
    int v4 = 28;
  }
  else if ([v3 isEqualToString:@"REQUEST_TYPE_OFFLINE_PROACTIVE_REGIONS"])
  {
    int v4 = 29;
  }
  else if ([v3 isEqualToString:@"REQUEST_TYPE_BRAND_LOOKUP"])
  {
    int v4 = 30;
  }
  else if ([v3 isEqualToString:@"REQUEST_TYPE_OFFLINE_UPDATE_MANIFEST"])
  {
    int v4 = 31;
  }
  else if ([v3 isEqualToString:@"REQUEST_TYPE_WIFI_FINGERPRINT_LOOKUP"])
  {
    int v4 = 32;
  }
  else if ([v3 isEqualToString:@"REQUEST_TYPE_INITIAL_OFFLINE_SUGGESTION"])
  {
    int v4 = 33;
  }
  else if ([v3 isEqualToString:@"REQUEST_TYPE_IP_GEO_LOOKUP"])
  {
    int v4 = 34;
  }
  else if ([v3 isEqualToString:@"REQUEST_TYPE_GROUND_VIEW_LABEL"])
  {
    int v4 = 35;
  }
  else if ([v3 isEqualToString:@"REQUEST_TYPE_BATCH_SPATIAL_LOOKUP"])
  {
    int v4 = 36;
  }
  else if ([v3 isEqualToString:@"REQUEST_TYPE_TRANSIT_VEHICLE_POSITION"])
  {
    int v4 = 37;
  }
  else if ([v3 isEqualToString:@"REQUEST_TYPE_PLACE_COLLECTION_LOOKUP"])
  {
    int v4 = 38;
  }
  else if ([v3 isEqualToString:@"REQUEST_TYPE_TRANSIT_SCHEDULE_LOOKUP"])
  {
    int v4 = 39;
  }
  else if ([v3 isEqualToString:@"REQUEST_TYPE_BATCH_CATEGORY_LOOKUP"])
  {
    int v4 = 40;
  }
  else if ([v3 isEqualToString:@"REQUEST_TYPE_BATCH_MERCHANT_LOOKUP_BRAND"])
  {
    int v4 = 41;
  }
  else if ([v3 isEqualToString:@"REQUEST_TYPE_CHILD_PLACE_LOOKUP_BY_CATEGORY"])
  {
    int v4 = 42;
  }
  else if ([v3 isEqualToString:@"REQUEST_TYPE_COLLECTION_SUGGESTION"])
  {
    int v4 = 43;
  }
  else if ([v3 isEqualToString:@"REQUEST_TYPE_MAPS_SEARCH_HOME"])
  {
    int v4 = 44;
  }
  else if ([v3 isEqualToString:@"REQUEST_TYPE_PLACE_QUESTIONNAIRE_LOOKUP"])
  {
    int v4 = 45;
  }
  else if ([v3 isEqualToString:@"REQUEST_TYPE_PUBLISHER_VIEW"])
  {
    int v4 = 46;
  }
  else if ([v3 isEqualToString:@"REQUEST_TYPE_ALL_COLLECTIONS_VIEW"])
  {
    int v4 = 47;
  }
  else if ([v3 isEqualToString:@"REQUEST_TYPE_AIRPORT_ENTITY_PLACE_LOOKUP"])
  {
    int v4 = 48;
  }
  else if ([v3 isEqualToString:@"REQUEST_TYPE_TERRITORY_LOOKUP"])
  {
    int v4 = 49;
  }
  else if ([v3 isEqualToString:@"REQUEST_TYPE_TRANSIT_NEARBY_SCHEDULE_LOOKUP"])
  {
    int v4 = 50;
  }
  else if ([v3 isEqualToString:@"REQUEST_TYPE_MAPS_HOME"])
  {
    int v4 = 51;
  }
  else if ([v3 isEqualToString:@"REQUEST_TYPE_ALL_GUIDES_LOCATIONS"])
  {
    int v4 = 52;
  }
  else if ([v3 isEqualToString:@"REQUEST_TYPE_GUIDES_HOME"])
  {
    int v4 = 53;
  }
  else if ([v3 isEqualToString:@"REQUEST_TYPE_EXTENDED_GEO_LOOKUP"])
  {
    int v4 = 54;
  }
  else if ([v3 isEqualToString:@"REQUEST_TYPE_QUERY_UNDERSTANDING"])
  {
    int v4 = 55;
  }
  else if ([v3 isEqualToString:@"REQUEST_TYPE_POI_AT_ADDRESS_LOOKUP"])
  {
    int v4 = 56;
  }
  else if ([v3 isEqualToString:@"REQUEST_TYPE_TRANSIT_NEARBY_PAYMENT_METHOD_LOOKUP"])
  {
    int v4 = 57;
  }
  else if ([v3 isEqualToString:@"REQUEST_TYPE_PLACECARD_ENRICHMENT"])
  {
    int v4 = 58;
  }
  else if ([v3 isEqualToString:@"REQUEST_TYPE_OFFLINE_REGION_NAME"])
  {
    int v4 = 59;
  }
  else if ([v3 isEqualToString:@"REQUEST_TYPE_SEARCH_CAPABILITIES"])
  {
    int v4 = 60;
  }
  else if ([v3 isEqualToString:@"REQUEST_TYPE_REFRESH_ID_LOOKUP"])
  {
    int v4 = 61;
  }
  else if ([v3 isEqualToString:@"REQUEST_TYPE_ADDRESS_RECOMMENDATION"])
  {
    int v4 = 62;
  }
  else
  {
    int v4 = 0;
  }

  return v4;
}

- (void)setGlobalResult:(id)a3
{
  *(_WORD *)&self->_flags |= 0x8800u;
  objc_storeStrong((id *)&self->_globalResult, a3);
}

- (void)setLegacyPlaceResults:(id)a3
{
  int v4 = (NSMutableArray *)a3;
  os_unfair_lock_lock_with_options();
  *(_WORD *)&self->_flags |= 0x2000u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(_WORD *)&self->_flags |= 0x8000u;
  legacyPlaceResults = self->_legacyPlaceResults;
  self->_legacyPlaceResults = v4;
}

- (void)clearLegacyPlaceResults
{
  p_readerLocuint64_t k = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(_WORD *)&self->_flags |= 0x2000u;
  os_unfair_lock_unlock(p_readerLock);
  *(_WORD *)&self->_flags |= 0x8000u;
  legacyPlaceResults = self->_legacyPlaceResults;

  [(NSMutableArray *)legacyPlaceResults removeAllObjects];
}

- (void)addLegacyPlaceResult:(id)a3
{
  id v4 = a3;
  -[GEOPDPlaceResponse _readLegacyPlaceResults]((uint64_t)self);
  -[GEOPDPlaceResponse _addNoFlagsLegacyPlaceResult:]((uint64_t)self, v4);

  os_unfair_lock_lock_with_options();
  *(_WORD *)&self->_flags |= 0x2000u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(_WORD *)&self->_flags |= 0x8000u;
}

- (void)_addNoFlagsLegacyPlaceResult:(uint64_t)a1
{
  id v3 = a2;
  if (a1)
  {
    id v4 = *(void **)(a1 + 104);
    id v7 = v3;
    if (!v4)
    {
      id v5 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
      __int16 v6 = *(void **)(a1 + 104);
      *(void *)(a1 + 104) = v5;

      id v4 = *(void **)(a1 + 104);
    }
    [v4 addObject:v7];
    id v3 = v7;
  }
}

- (unint64_t)legacyPlaceResultsCount
{
  -[GEOPDPlaceResponse _readLegacyPlaceResults]((uint64_t)self);
  legacyPlaceResults = self->_legacyPlaceResults;

  return [(NSMutableArray *)legacyPlaceResults count];
}

- (id)legacyPlaceResultAtIndex:(unint64_t)a3
{
  -[GEOPDPlaceResponse _readLegacyPlaceResults]((uint64_t)self);
  legacyPlaceResults = self->_legacyPlaceResults;

  return (id)[(NSMutableArray *)legacyPlaceResults objectAtIndex:a3];
}

+ (Class)legacyPlaceResultType
{
  return (Class)objc_opt_class();
}

- (void)_readDisplayLanguages
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 128));
    if ((*(_WORD *)(a1 + 140) & 0x100) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOPDPlaceResponseReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readDisplayLanguages_tags_5897);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 128));
  }
}

- (NSMutableArray)displayLanguages
{
  -[GEOPDPlaceResponse _readDisplayLanguages]((uint64_t)self);
  displayLanguages = self->_displayLanguages;

  return displayLanguages;
}

- (void)setDisplayLanguages:(id)a3
{
  id v4 = (NSMutableArray *)a3;
  os_unfair_lock_lock_with_options();
  *(_WORD *)&self->_flags |= 0x100u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(_WORD *)&self->_flags |= 0x8000u;
  displayLanguages = self->_displayLanguages;
  self->_displayLanguages = v4;
}

- (void)clearDisplayLanguages
{
  p_readerLocuint64_t k = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(_WORD *)&self->_flags |= 0x100u;
  os_unfair_lock_unlock(p_readerLock);
  *(_WORD *)&self->_flags |= 0x8000u;
  displayLanguages = self->_displayLanguages;

  [(NSMutableArray *)displayLanguages removeAllObjects];
}

- (void)addDisplayLanguage:(id)a3
{
  id v4 = a3;
  -[GEOPDPlaceResponse _readDisplayLanguages]((uint64_t)self);
  -[GEOPDPlaceResponse _addNoFlagsDisplayLanguage:]((uint64_t)self, v4);

  os_unfair_lock_lock_with_options();
  *(_WORD *)&self->_flags |= 0x100u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(_WORD *)&self->_flags |= 0x8000u;
}

- (unint64_t)displayLanguagesCount
{
  -[GEOPDPlaceResponse _readDisplayLanguages]((uint64_t)self);
  displayLanguages = self->_displayLanguages;

  return [(NSMutableArray *)displayLanguages count];
}

- (id)displayLanguageAtIndex:(unint64_t)a3
{
  -[GEOPDPlaceResponse _readDisplayLanguages]((uint64_t)self);
  displayLanguages = self->_displayLanguages;

  return (id)[(NSMutableArray *)displayLanguages objectAtIndex:a3];
}

+ (Class)displayLanguageType
{
  return (Class)objc_opt_class();
}

- (void)_readDisplayRegion
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 128));
    if ((*(_WORD *)(a1 + 140) & 0x200) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOPDPlaceResponseReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readDisplayRegion_tags_5898);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 128));
  }
}

- (BOOL)hasDisplayRegion
{
  return self->_displayRegion != 0;
}

- (NSString)displayRegion
{
  -[GEOPDPlaceResponse _readDisplayRegion]((uint64_t)self);
  displayRegion = self->_displayRegion;

  return displayRegion;
}

- (void)setDisplayRegion:(id)a3
{
  *(_WORD *)&self->_flags |= 0x8200u;
  objc_storeStrong((id *)&self->_displayRegion, a3);
}

- (void)_readSpokenLanguages
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 128));
    if ((*(_WORD *)(a1 + 140) & 0x4000) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOPDPlaceResponseReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readSpokenLanguages_tags_5899);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 128));
  }
}

- (NSMutableArray)spokenLanguages
{
  -[GEOPDPlaceResponse _readSpokenLanguages]((uint64_t)self);
  spokenLanguages = self->_spokenLanguages;

  return spokenLanguages;
}

- (void)setSpokenLanguages:(id)a3
{
  id v4 = (NSMutableArray *)a3;
  os_unfair_lock_lock_with_options();
  *(_WORD *)&self->_flags |= 0x4000u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(_WORD *)&self->_flags |= 0x8000u;
  spokenLanguages = self->_spokenLanguages;
  self->_spokenLanguages = v4;
}

- (void)clearSpokenLanguages
{
  p_readerLocuint64_t k = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(_WORD *)&self->_flags |= 0x4000u;
  os_unfair_lock_unlock(p_readerLock);
  *(_WORD *)&self->_flags |= 0x8000u;
  spokenLanguages = self->_spokenLanguages;

  [(NSMutableArray *)spokenLanguages removeAllObjects];
}

- (void)addSpokenLanguage:(id)a3
{
  id v4 = a3;
  -[GEOPDPlaceResponse _readSpokenLanguages]((uint64_t)self);
  -[GEOPDPlaceResponse _addNoFlagsSpokenLanguage:]((uint64_t)self, v4);

  os_unfair_lock_lock_with_options();
  *(_WORD *)&self->_flags |= 0x4000u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(_WORD *)&self->_flags |= 0x8000u;
}

- (unint64_t)spokenLanguagesCount
{
  -[GEOPDPlaceResponse _readSpokenLanguages]((uint64_t)self);
  spokenLanguages = self->_spokenLanguages;

  return [(NSMutableArray *)spokenLanguages count];
}

- (id)spokenLanguageAtIndex:(unint64_t)a3
{
  -[GEOPDPlaceResponse _readSpokenLanguages]((uint64_t)self);
  spokenLanguages = self->_spokenLanguages;

  return (id)[(NSMutableArray *)spokenLanguages objectAtIndex:a3];
}

+ (Class)spokenLanguageType
{
  return (Class)objc_opt_class();
}

- (void)_readDebugApiKey
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 128));
    if ((*(_WORD *)(a1 + 140) & 0x80) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOPDPlaceResponseReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readDebugApiKey_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 128));
  }
}

- (BOOL)hasDebugApiKey
{
  return self->_debugApiKey != 0;
}

- (NSString)debugApiKey
{
  -[GEOPDPlaceResponse _readDebugApiKey]((uint64_t)self);
  debugApiKey = self->_debugApiKey;

  return debugApiKey;
}

- (void)setDebugApiKey:(id)a3
{
  *(_WORD *)&self->_flags |= 0x8080u;
  objc_storeStrong((id *)&self->_debugApiKey, a3);
}

- (BOOL)hasDatasetAbStatus
{
  return self->_datasetAbStatus != 0;
}

- (void)setDatasetAbStatus:(id)a3
{
  *(_WORD *)&self->_flags |= 0x8040u;
  objc_storeStrong((id *)&self->_datasetAbStatus, a3);
}

- (void)clearMapsResults
{
  p_readerLocuint64_t k = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(_WORD *)&self->_flags |= 0x1000u;
  os_unfair_lock_unlock(p_readerLock);
  *(_WORD *)&self->_flags |= 0x8000u;
  mapsResults = self->_mapsResults;

  [(NSMutableArray *)mapsResults removeAllObjects];
}

- (void)addMapsResult:(id)a3
{
  id v4 = a3;
  -[GEOPDPlaceResponse _readMapsResults]((uint64_t)self);
  -[GEOPDPlaceResponse _addNoFlagsMapsResult:]((uint64_t)self, v4);

  os_unfair_lock_lock_with_options();
  *(_WORD *)&self->_flags |= 0x1000u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(_WORD *)&self->_flags |= 0x8000u;
}

- (id)mapsResultAtIndex:(unint64_t)a3
{
  -[GEOPDPlaceResponse _readMapsResults]((uint64_t)self);
  mapsResults = self->_mapsResults;

  return (id)[(NSMutableArray *)mapsResults objectAtIndex:a3];
}

+ (Class)mapsResultType
{
  return (Class)objc_opt_class();
}

- (NSMutableArray)dotPlaces
{
  -[GEOPDPlaceResponse _readDotPlaces]((uint64_t)self);
  dotPlaces = self->_dotPlaces;

  return dotPlaces;
}

- (void)setDotPlaces:(id)a3
{
  id v4 = (NSMutableArray *)a3;
  os_unfair_lock_lock_with_options();
  *(_WORD *)&self->_flags |= 0x400u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(_WORD *)&self->_flags |= 0x8000u;
  dotPlaces = self->_dotPlaces;
  self->_dotPlaces = v4;
}

- (void)clearDotPlaces
{
  p_readerLocuint64_t k = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(_WORD *)&self->_flags |= 0x400u;
  os_unfair_lock_unlock(p_readerLock);
  *(_WORD *)&self->_flags |= 0x8000u;
  dotPlaces = self->_dotPlaces;

  [(NSMutableArray *)dotPlaces removeAllObjects];
}

- (void)addDotPlace:(id)a3
{
  id v4 = a3;
  -[GEOPDPlaceResponse _readDotPlaces]((uint64_t)self);
  -[GEOPDPlaceResponse _addNoFlagsDotPlace:]((uint64_t)self, v4);

  os_unfair_lock_lock_with_options();
  *(_WORD *)&self->_flags |= 0x400u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(_WORD *)&self->_flags |= 0x8000u;
}

- (void)_addNoFlagsDotPlace:(uint64_t)a1
{
  id v3 = a2;
  if (a1)
  {
    id v4 = *(void **)(a1 + 80);
    id v7 = v3;
    if (!v4)
    {
      id v5 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
      __int16 v6 = *(void **)(a1 + 80);
      *(void *)(a1 + 80) = v5;

      id v4 = *(void **)(a1 + 80);
    }
    [v4 addObject:v7];
    id v3 = v7;
  }
}

- (id)dotPlaceAtIndex:(unint64_t)a3
{
  -[GEOPDPlaceResponse _readDotPlaces]((uint64_t)self);
  dotPlaces = self->_dotPlaces;

  return (id)[(NSMutableArray *)dotPlaces objectAtIndex:a3];
}

+ (Class)dotPlaceType
{
  return (Class)objc_opt_class();
}

- (void)_readAnalyticData
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 128));
    if ((*(_WORD *)(a1 + 140) & 0x10) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOPDPlaceResponseReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readAnalyticData_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 128));
  }
}

- (BOOL)hasAnalyticData
{
  return self->_analyticData != 0;
}

- (GEOPDPlacesRequestResponseAnalyticsData)analyticData
{
  -[GEOPDPlaceResponse _readAnalyticData]((uint64_t)self);
  analyticData = self->_analyticData;

  return analyticData;
}

- (void)setAnalyticData:(id)a3
{
  *(_WORD *)&self->_flags |= 0x8010u;
  objc_storeStrong((id *)&self->_analyticData, a3);
}

- (id)description
{
  id v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)GEOPDPlaceResponse;
  id v4 = [(GEOPDPlaceResponse *)&v8 description];
  id v5 = [(GEOPDPlaceResponse *)self dictionaryRepresentation];
  __int16 v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEOPDPlaceResponse _dictionaryRepresentation:]((uint64_t)self, 0);
}

- (id)jsonRepresentation
{
  return -[GEOPDPlaceResponse _dictionaryRepresentation:]((uint64_t)self, 1);
}

void __48__GEOPDPlaceResponse__dictionaryRepresentation___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v10 = a2;
  id v5 = a3;
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();
  id v7 = *(void **)(a1 + 32);
  if (isKindOfClass)
  {
    objc_super v8 = [v5 base64EncodedStringWithOptions:0];
    uint64_t v9 = [v10 description];
    [v7 setObject:v8 forKey:v9];
  }
  else
  {
    objc_super v8 = [v10 description];
    [v7 setObject:v5 forKey:v8];
  }
}

- (GEOPDPlaceResponse)initWithDictionary:(id)a3
{
  return (GEOPDPlaceResponse *)-[GEOPDPlaceResponse _initWithDictionary:isJSON:](self, a3, 0);
}

- (GEOPDPlaceResponse)initWithJSON:(id)a3
{
  return (GEOPDPlaceResponse *)-[GEOPDPlaceResponse _initWithDictionary:isJSON:](self, a3, 1u);
}

- (void)clearSensitiveFields:(unint64_t)a3
{
}

- (BOOL)hasGreenTeaWithValue:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v136 = *MEMORY[0x1E4F143B8];
  -[GEOPDPlaceResponse _readDotPlaces]((uint64_t)self);
  long long v110 = 0u;
  long long v111 = 0u;
  long long v108 = 0u;
  long long v109 = 0u;
  id v5 = self->_dotPlaces;
  uint64_t v6 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v108 objects:v126 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v109;
LABEL_3:
    uint64_t v9 = 0;
    while (1)
    {
      if (*(void *)v109 != v8) {
        objc_enumerationMutation(v5);
      }
      if (-[GEOPDDotPlace hasGreenTeaWithValue:](*(void *)(*((void *)&v108 + 1) + 8 * v9), v3)) {
        goto LABEL_156;
      }
      if (v7 == ++v9)
      {
        uint64_t v7 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v108 objects:v126 count:16];
        if (v7) {
          goto LABEL_3;
        }
        break;
      }
    }
  }

  -[GEOPDPlaceResponse _readGlobalResult]((uint64_t)self);
  globalResult = (uint64_t *)self->_globalResult;
  if (!globalResult) {
    goto LABEL_139;
  }
  -[GEOPDPlaceGlobalResult _readAllCollectionsViewResult]((uint64_t)self->_globalResult);
  uint64_t v11 = globalResult[6];
  if (v11)
  {
    -[GEOPDAllCollectionsViewResult _readCollectionIds](globalResult[6]);
    long long v129 = 0u;
    long long v130 = 0u;
    long long v127 = 0u;
    long long v128 = 0u;
    id v12 = *(id *)(v11 + 24);
    uint64_t v13 = [v12 countByEnumeratingWithState:&v127 objects:v135 count:16];
    if (v13)
    {
      uint64_t v14 = v13;
      uint64_t v15 = *(void *)v128;
LABEL_13:
      uint64_t v16 = 0;
      while (1)
      {
        if (*(void *)v128 != v15) {
          objc_enumerationMutation(v12);
        }
        if ([*(id *)(*((void *)&v127 + 1) + 8 * v16) hasGreenTeaWithValue:v3]) {
          goto LABEL_159;
        }
        if (v14 == ++v16)
        {
          uint64_t v14 = [v12 countByEnumeratingWithState:&v127 objects:v135 count:16];
          if (v14) {
            goto LABEL_13;
          }
          break;
        }
      }
    }

    -[GEOPDAllCollectionsViewResult _readPublisherSuggestionResult](v11);
    if (-[GEOPDPublisherSuggestionResult hasGreenTeaWithValue:](*(void *)(v11 + 32), v3)) {
      return 1;
    }
    -[GEOPDAllCollectionsViewResult _readResultFilters](v11);
    long long v122 = 0u;
    long long v123 = 0u;
    long long v120 = 0u;
    long long v121 = 0u;
    id v12 = *(id *)(v11 + 40);
    uint64_t v17 = [v12 countByEnumeratingWithState:&v120 objects:&v131 count:16];
    if (v17)
    {
      uint64_t v18 = v17;
      uint64_t v19 = *(void *)v121;
LABEL_22:
      uint64_t v20 = 0;
      while (1)
      {
        if (*(void *)v121 != v19) {
          objc_enumerationMutation(v12);
        }
        if (-[GEOPDAllCollectionsViewResultFilter hasGreenTeaWithValue:](*(void *)(*((void *)&v120 + 1) + 8 * v20), v3))
        {
          goto LABEL_159;
        }
        if (v18 == ++v20)
        {
          uint64_t v18 = [v12 countByEnumeratingWithState:&v120 objects:&v131 count:16];
          if (v18) {
            goto LABEL_22;
          }
          break;
        }
      }
    }
  }
  -[GEOPDPlaceGlobalResult _readAllGuidesLocationsViewresult]((uint64_t)globalResult);
  uint64_t v21 = globalResult[7];
  if (v21)
  {
    -[GEOPDAllGuidesLocationsViewResult _readAllGuidesLocationsSections](globalResult[7]);
    long long v122 = 0u;
    long long v123 = 0u;
    long long v120 = 0u;
    long long v121 = 0u;
    id v12 = *(id *)(v21 + 24);
    uint64_t v22 = [v12 countByEnumeratingWithState:&v120 objects:&v131 count:16];
    if (v22)
    {
      uint64_t v23 = *(void *)v121;
      uint64_t v24 = &OBJC_IVAR___GEOMapDataSubscriptionDownloadGroup__completedSubscriptions;
      uint64_t v94 = *(void *)v121;
LABEL_32:
      uint64_t v25 = 0;
      uint64_t v97 = v22;
      while (1)
      {
        if (*(void *)v121 != v23) {
          objc_enumerationMutation(v12);
        }
        uint64_t v26 = *(void *)(*((void *)&v120 + 1) + 8 * v25);
        if (v26)
        {
          -[GEOPDAllGuidesLocationsSection _readEntrys](*(void *)(*((void *)&v120 + 1) + 8 * v25));
          long long v129 = 0u;
          long long v130 = 0u;
          long long v127 = 0u;
          long long v128 = 0u;
          id v27 = *(id *)(v26 + v24[131]);
          uint64_t v28 = [v27 countByEnumeratingWithState:&v127 objects:v135 count:16];
          if (v28)
          {
            uint64_t v29 = v28;
            uint64_t v30 = *(void *)v128;
            while (2)
            {
              for (uint64_t i = 0; i != v29; ++i)
              {
                if (*(void *)v128 != v30) {
                  objc_enumerationMutation(v27);
                }
                if (-[GEOPDGuidesLocationEntry hasGreenTeaWithValue:](*(void *)(*((void *)&v127 + 1) + 8 * i), v3))
                {

                  goto LABEL_159;
                }
              }
              uint64_t v29 = [v27 countByEnumeratingWithState:&v127 objects:v135 count:16];
              if (v29) {
                continue;
              }
              break;
            }
          }

          -[GEOPDAllGuidesLocationsSection _readSectionHeader](v26);
          uint64_t v32 = *(void *)(v26 + 32);
          uint64_t v24 = &OBJC_IVAR___GEOMapDataSubscriptionDownloadGroup__completedSubscriptions;
          if (v32)
          {
            -[GEOPDAllGuidesLocationsSectionHeader _readPlaceId](v32);
            if ([*(id *)(v32 + 32) hasGreenTeaWithValue:v3]) {
              break;
            }
          }
        }
        ++v25;
        uint64_t v23 = v94;
        if (v25 == v97)
        {
          uint64_t v22 = [v12 countByEnumeratingWithState:&v120 objects:&v131 count:16];
          if (v22) {
            goto LABEL_32;
          }
          goto LABEL_48;
        }
      }
LABEL_159:

      return 1;
    }
LABEL_48:
  }
  -[GEOPDPlaceGlobalResult _readAutocompleteResult]((uint64_t)globalResult);
  uint64_t v33 = globalResult[8];
  if (!v33) {
    goto LABEL_69;
  }
  -[GEOPDAutocompleteResult _readPlaceSummaryLayoutMetadata](globalResult[8]);
  if ([*(id *)(v33 + 48) hasGreenTeaWithValue:v3]) {
    return 1;
  }
  -[GEOPDAutocompleteResult _readSections](v33);
  long long v122 = 0u;
  long long v123 = 0u;
  long long v120 = 0u;
  long long v121 = 0u;
  id v12 = *(id *)(v33 + 56);
  uint64_t v34 = [v12 countByEnumeratingWithState:&v120 objects:&v131 count:16];
  if (v34)
  {
    uint64_t v35 = v34;
    uint64_t v36 = *(void *)v121;
    long long v37 = &OBJC_IVAR___GEOMapDataSubscriptionDownloadGroup__completedSubscriptions;
    uint64_t v98 = *(void *)v121;
    do
    {
      for (uint64_t j = 0; j != v35; ++j)
      {
        if (*(void *)v121 != v36) {
          objc_enumerationMutation(v12);
        }
        uint64_t v39 = *(void *)(*((void *)&v120 + 1) + 8 * j);
        if (v39)
        {
          -[GEOPDAutocompleteResultSection _readEntries](*(void *)(*((void *)&v120 + 1) + 8 * j));
          long long v129 = 0u;
          long long v130 = 0u;
          long long v127 = 0u;
          long long v128 = 0u;
          id v40 = *(id *)(v39 + v37[168]);
          uint64_t v41 = [v40 countByEnumeratingWithState:&v127 objects:v135 count:16];
          if (v41)
          {
            uint64_t v42 = v41;
            uint64_t v43 = *(void *)v128;
            while (2)
            {
              for (uint64_t k = 0; k != v42; ++k)
              {
                if (*(void *)v128 != v43) {
                  objc_enumerationMutation(v40);
                }
                if ([*(id *)(*((void *)&v127 + 1) + 8 * k) hasGreenTeaWithValue:v3])
                {

                  goto LABEL_159;
                }
              }
              uint64_t v42 = [v40 countByEnumeratingWithState:&v127 objects:v135 count:16];
              if (v42) {
                continue;
              }
              break;
            }
          }
        }
        uint64_t v36 = v98;
        long long v37 = &OBJC_IVAR___GEOMapDataSubscriptionDownloadGroup__completedSubscriptions;
      }
      uint64_t v35 = [v12 countByEnumeratingWithState:&v120 objects:&v131 count:16];
    }
    while (v35);
  }

LABEL_69:
  -[GEOPDPlaceGlobalResult _readBatchSpatialLookupResult]((uint64_t)globalResult);
  uint64_t v45 = globalResult[13];
  if (v45)
  {
    -[GEOPDBatchSpatialLookupResult _readSpatialEventLookupResults](globalResult[13]);
    long long v118 = 0u;
    long long v119 = 0u;
    long long v116 = 0u;
    long long v117 = 0u;
    id v12 = *(id *)(v45 + 24);
    uint64_t v46 = [v12 countByEnumeratingWithState:&v116 objects:&v131 count:16];
    if (v46)
    {
      uint64_t v47 = *(void *)v117;
      uint64_t v48 = &OBJC_IVAR___GEOPDAutocompleteParametersAllEntriesWithBrowse__querySuggestionEntry;
      uint64_t v49 = &OBJC_IVAR___GEOMapDataSubscriptionDownloadGroup__completedSubscriptions;
      long long v99 = v12;
      uint64_t v93 = *(void *)v117;
      do
      {
        uint64_t v50 = 0;
        uint64_t v95 = v46;
        do
        {
          if (*(void *)v117 != v47) {
            objc_enumerationMutation(v12);
          }
          uint64_t v51 = *(void *)(*((void *)&v116 + 1) + 8 * v50);
          if (v51)
          {
            -[GEOPDSpatialEventLookupResult _readDisplayMapRegion](*(void *)(*((void *)&v116 + 1) + 8 * v50));
            v52 = v48;
            if ([*(id *)(v51 + v48[816]) hasGreenTeaWithValue:v3]) {
              goto LABEL_159;
            }
            -[GEOPDSpatialEventLookupResult _readEvents](v51);
            long long v122 = 0u;
            long long v123 = 0u;
            long long v120 = 0u;
            long long v121 = 0u;
            id v53 = *(id *)(v51 + v49[635]);
            uint64_t v54 = [v53 countByEnumeratingWithState:&v120 objects:v135 count:16];
            if (v54)
            {
              uint64_t v55 = v54;
              uint64_t v56 = *(void *)v121;
              while (2)
              {
                for (uint64_t m = 0; m != v55; ++m)
                {
                  if (*(void *)v121 != v56) {
                    objc_enumerationMutation(v53);
                  }
                  if ([*(id *)(*((void *)&v120 + 1) + 8 * m) hasGreenTeaWithValue:v3])
                  {

LABEL_165:
                    id v12 = v99;
                    goto LABEL_159;
                  }
                }
                uint64_t v55 = [v53 countByEnumeratingWithState:&v120 objects:v135 count:16];
                if (v55) {
                  continue;
                }
                break;
              }
            }
          }
          else
          {
            v52 = v48;
          }
          ++v50;
          id v12 = v99;
          uint64_t v47 = v93;
          uint64_t v48 = v52;
          uint64_t v49 = &OBJC_IVAR___GEOMapDataSubscriptionDownloadGroup__completedSubscriptions;
        }
        while (v50 != v95);
        uint64_t v46 = [v99 countByEnumeratingWithState:&v116 objects:&v131 count:16];
      }
      while (v46);
    }

    -[GEOPDBatchSpatialLookupResult _readSpatialPlaceLookupResults](v45);
    long long v114 = 0u;
    long long v115 = 0u;
    long long v112 = 0u;
    long long v113 = 0u;
    id v58 = *(id *)(v45 + 32);
    uint64_t v59 = [v58 countByEnumeratingWithState:&v112 objects:&v127 count:16];
    if (v59)
    {
      uint64_t v60 = v59;
      uint64_t v61 = *(void *)v113;
      uint64_t v62 = &OBJC_IVAR___GEOMapDataSubscriptionDownloadGroup__completedSubscriptions;
      v63 = &OBJC_IVAR___GEOMapDataSubscriptionDownloadGroup__completedSubscriptions;
      uint64_t v96 = *(void *)v113;
      long long v99 = v58;
      do
      {
        uint64_t v64 = 0;
        do
        {
          if (*(void *)v113 != v61) {
            objc_enumerationMutation(v58);
          }
          uint64_t v65 = *(void *)(*((void *)&v112 + 1) + 8 * v64);
          if (v65)
          {
            -[GEOPDSpatialPlaceLookupResult _readDisplayMapRegion](*(void *)(*((void *)&v112 + 1) + 8 * v64));
            uint64_t v66 = v62;
            if ([*(id *)(v65 + v62[641]) hasGreenTeaWithValue:v3]) {
              goto LABEL_165;
            }
            -[GEOPDSpatialPlaceLookupResult _readPlaces](v65);
            long long v122 = 0u;
            long long v123 = 0u;
            long long v120 = 0u;
            long long v121 = 0u;
            id v67 = *(id *)(v65 + v63[640]);
            uint64_t v68 = [v67 countByEnumeratingWithState:&v120 objects:v135 count:16];
            if (v68)
            {
              uint64_t v69 = v68;
              uint64_t v70 = *(void *)v121;
              while (2)
              {
                for (uint64_t n = 0; n != v69; ++n)
                {
                  if (*(void *)v121 != v70) {
                    objc_enumerationMutation(v67);
                  }
                  if ([*(id *)(*((void *)&v120 + 1) + 8 * n) hasGreenTeaWithValue:v3])
                  {

                    goto LABEL_165;
                  }
                }
                uint64_t v69 = [v67 countByEnumeratingWithState:&v120 objects:v135 count:16];
                if (v69) {
                  continue;
                }
                break;
              }
            }
          }
          else
          {
            uint64_t v66 = v62;
          }
          ++v64;
          uint64_t v61 = v96;
          id v58 = v99;
          uint64_t v62 = v66;
          v63 = &OBJC_IVAR___GEOMapDataSubscriptionDownloadGroup__completedSubscriptions;
        }
        while (v64 != v60);
        uint64_t v72 = [v99 countByEnumeratingWithState:&v112 objects:&v127 count:16];
        uint64_t v60 = v72;
      }
      while (v72);
    }
  }
  -[GEOPDPlaceGlobalResult _readCategorySearchResult]((uint64_t)globalResult);
  uint64_t v73 = globalResult[17];
  if (v73)
  {
    -[GEOPDCategorySearchResult _readDisplayMapRegion](globalResult[17]);
    if ([*(id *)(v73 + 56) hasGreenTeaWithValue:v3]) {
      return 1;
    }
    -[GEOPDCategorySearchResult _readPlaceSummaryLayoutMetadata](v73);
    if ([*(id *)(v73 + 80) hasGreenTeaWithValue:v3]) {
      return 1;
    }
    -[GEOPDCategorySearchResult _readRelatedEntitySections](v73);
    long long v133 = 0u;
    long long v134 = 0u;
    long long v131 = 0u;
    long long v132 = 0u;
    id v74 = *(id *)(v73 + 96);
    uint64_t v75 = [v74 countByEnumeratingWithState:&v131 objects:v135 count:16];
    if (v75)
    {
      uint64_t v76 = v75;
      uint64_t v77 = *(void *)v132;
      while (2)
      {
        for (iuint64_t i = 0; ii != v76; ++ii)
        {
          if (*(void *)v132 != v77) {
            objc_enumerationMutation(v74);
          }
          if (-[GEOPDRelatedEntitySection hasGreenTeaWithValue:](*(void *)(*((void *)&v131 + 1) + 8 * ii), v3))
          {

            return 1;
          }
        }
        uint64_t v76 = [v74 countByEnumeratingWithState:&v131 objects:v135 count:16];
        if (v76) {
          continue;
        }
        break;
      }
    }

    -[GEOPDCategorySearchResult _readResultRefinementGroup](v73);
    if (-[GEOPDResultRefinementGroup hasGreenTeaWithValue:](*(void *)(v73 + 120), v3)) {
      return 1;
    }
    -[GEOPDCategorySearchResult _readSectionList](v73);
    if (-[GEOPDSearchSectionList hasGreenTeaWithValue:](*(void *)(v73 + 152), v3)) {
      return 1;
    }
  }
  -[GEOPDPlaceGlobalResult _readCollectionSuggestionResult]((uint64_t)globalResult);
  if (-[GEOPDCollectionSuggestionResult hasGreenTeaWithValue:](globalResult[19], v3)) {
    return 1;
  }
  -[GEOPDPlaceGlobalResult _readGuidesHomeResult]((uint64_t)globalResult);
  if (-[GEOPDGuidesHomeResult hasGreenTeaWithValue:](globalResult[25], v3)) {
    return 1;
  }
  -[GEOPDPlaceGlobalResult _readIpGeoLookupResult]((uint64_t)globalResult);
  uint64_t v79 = globalResult[26];
  if (v79)
  {
    -[GEOPDIpGeoLookupResult _readLocation](globalResult[26]);
    if ([*(id *)(v79 + 40) hasGreenTeaWithValue:v3]) {
      return 1;
    }
  }
  -[GEOPDPlaceGlobalResult _readLocationDirectedSearchResult]((uint64_t)globalResult);
  uint64_t v80 = globalResult[27];
  if (v80)
  {
    -[GEOPDLocationDirectedSearchResult _readDisplayMapRegion](globalResult[27]);
    if ([*(id *)(v80 + 32) hasGreenTeaWithValue:v3]) {
      return 1;
    }
  }
  -[GEOPDPlaceGlobalResult _readMapsHomeResult]((uint64_t)globalResult);
  if (-[GEOPDMapsHomeResult hasGreenTeaWithValue:](globalResult[28], v3)) {
    return 1;
  }
  -[GEOPDPlaceGlobalResult _readMapsSearchHomeResult]((uint64_t)globalResult);
  if (-[GEOPDMapsSearchHomeResult hasGreenTeaWithValue:](globalResult[30], v3)) {
    return 1;
  }
  -[GEOPDPlaceGlobalResult _readPlaceCollectionLookupResult]((uint64_t)globalResult);
  uint64_t v81 = globalResult[34];
  if (v81)
  {
    if (-[GEOPDComponent hasGreenTeaWithValue:](*(void *)(v81 + 16), v3)) {
      return 1;
    }
  }
  -[GEOPDPlaceGlobalResult _readPopularNearbySearchResult]((uint64_t)globalResult);
  uint64_t v82 = globalResult[40];
  if (v82)
  {
    -[GEOPDPopularNearbySearchResult _readDisplayMapRegion](globalResult[40]);
    if ([*(id *)(v82 + 24) hasGreenTeaWithValue:v3]) {
      return 1;
    }
  }
  -[GEOPDPlaceGlobalResult _readPublisherViewResult]((uint64_t)globalResult);
  if (-[GEOPDPublisherViewResult hasGreenTeaWithValue:](globalResult[41], v3)) {
    return 1;
  }
  -[GEOPDPlaceGlobalResult _readQueryUnderstandingResult]((uint64_t)globalResult);
  if (-[GEOPDQueryUnderstandingResult hasGreenTeaWithValue:](globalResult[42], v3)) {
    return 1;
  }
  -[GEOPDPlaceGlobalResult _readSearchResult]((uint64_t)globalResult);
  if (-[GEOPDSearchResult hasGreenTeaWithValue:](globalResult[46], v3)) {
    return 1;
  }
LABEL_139:
  -[GEOPDPlaceResponse _readMapsResults]((uint64_t)self);
  long long v106 = 0u;
  long long v107 = 0u;
  long long v104 = 0u;
  long long v105 = 0u;
  id v5 = self->_mapsResults;
  uint64_t v83 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v104 objects:v125 count:16];
  if (v83)
  {
    uint64_t v84 = v83;
    uint64_t v85 = *(void *)v105;
LABEL_141:
    uint64_t v86 = 0;
    while (1)
    {
      if (*(void *)v105 != v85) {
        objc_enumerationMutation(v5);
      }
      if ([*(id *)(*((void *)&v104 + 1) + 8 * v86) hasGreenTeaWithValue:v3]) {
        goto LABEL_156;
      }
      if (v84 == ++v86)
      {
        uint64_t v84 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v104 objects:v125 count:16];
        if (v84) {
          goto LABEL_141;
        }
        break;
      }
    }
  }

  -[GEOPDPlaceResponse _readLegacyPlaceResults]((uint64_t)self);
  long long v102 = 0u;
  long long v103 = 0u;
  long long v100 = 0u;
  long long v101 = 0u;
  id v5 = self->_legacyPlaceResults;
  uint64_t v87 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v100 objects:v124 count:16];
  if (v87)
  {
    uint64_t v88 = v87;
    uint64_t v89 = *(void *)v101;
LABEL_149:
    uint64_t v90 = 0;
    while (1)
    {
      if (*(void *)v101 != v89) {
        objc_enumerationMutation(v5);
      }
      if ([*(id *)(*((void *)&v100 + 1) + 8 * v90) hasGreenTeaWithValue:v3]) {
        break;
      }
      if (v88 == ++v90)
      {
        uint64_t v88 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v100 objects:v124 count:16];
        if (v88) {
          goto LABEL_149;
        }
        goto LABEL_155;
      }
    }
LABEL_156:
    BOOL v91 = 1;
    goto LABEL_157;
  }
LABEL_155:
  BOOL v91 = 0;
LABEL_157:

  return v91;
}

- (void)copyTo:(id)a3
{
  uint64_t v26 = (id *)a3;
  [(GEOPDPlaceResponse *)self readAll:0];
  os_unfair_lock_lock_with_options();
  objc_storeStrong(v26 + 1, self->_reader);
  *((_DWORD *)v26 + 30) = self->_readerMarkPos;
  *((_DWORD *)v26 + 31) = self->_readerMarkLength;
  os_unfair_lock_unlock(&self->_readerLock);
  __int16 flags = (__int16)self->_flags;
  if ((flags & 4) != 0)
  {
    *((_DWORD *)v26 + 34) = self->_status;
    *((_WORD *)v26 + 70) |= 4u;
    __int16 flags = (__int16)self->_flags;
  }
  if ((flags & 2) != 0)
  {
    *((_DWORD *)v26 + 33) = self->_requestType;
    *((_WORD *)v26 + 70) |= 2u;
  }
  if (self->_globalResult) {
    objc_msgSend(v26, "setGlobalResult:");
  }
  if ([(GEOPDPlaceResponse *)self legacyPlaceResultsCount])
  {
    [v26 clearLegacyPlaceResults];
    unint64_t v5 = [(GEOPDPlaceResponse *)self legacyPlaceResultsCount];
    if (v5)
    {
      unint64_t v6 = v5;
      for (uint64_t i = 0; i != v6; ++i)
      {
        uint64_t v8 = [(GEOPDPlaceResponse *)self legacyPlaceResultAtIndex:i];
        [v26 addLegacyPlaceResult:v8];
      }
    }
  }
  if ([(GEOPDPlaceResponse *)self displayLanguagesCount])
  {
    [v26 clearDisplayLanguages];
    unint64_t v9 = [(GEOPDPlaceResponse *)self displayLanguagesCount];
    if (v9)
    {
      unint64_t v10 = v9;
      for (uint64_t j = 0; j != v10; ++j)
      {
        id v12 = [(GEOPDPlaceResponse *)self displayLanguageAtIndex:j];
        [v26 addDisplayLanguage:v12];
      }
    }
  }
  if (self->_displayRegion) {
    objc_msgSend(v26, "setDisplayRegion:");
  }
  if ([(GEOPDPlaceResponse *)self spokenLanguagesCount])
  {
    [v26 clearSpokenLanguages];
    unint64_t v13 = [(GEOPDPlaceResponse *)self spokenLanguagesCount];
    if (v13)
    {
      unint64_t v14 = v13;
      for (uint64_t k = 0; k != v14; ++k)
      {
        uint64_t v16 = [(GEOPDPlaceResponse *)self spokenLanguageAtIndex:k];
        [v26 addSpokenLanguage:v16];
      }
    }
  }
  if (self->_debugApiKey) {
    objc_msgSend(v26, "setDebugApiKey:");
  }
  if (self->_datasetAbStatus) {
    objc_msgSend(v26, "setDatasetAbStatus:");
  }
  if ([(GEOPDPlaceResponse *)self mapsResultsCount])
  {
    [v26 clearMapsResults];
    unint64_t v17 = [(GEOPDPlaceResponse *)self mapsResultsCount];
    if (v17)
    {
      unint64_t v18 = v17;
      for (uint64_t m = 0; m != v18; ++m)
      {
        uint64_t v20 = [(GEOPDPlaceResponse *)self mapsResultAtIndex:m];
        [v26 addMapsResult:v20];
      }
    }
  }
  if ([(GEOPDPlaceResponse *)self dotPlacesCount])
  {
    [v26 clearDotPlaces];
    unint64_t v21 = [(GEOPDPlaceResponse *)self dotPlacesCount];
    if (v21)
    {
      unint64_t v22 = v21;
      for (uint64_t n = 0; n != v22; ++n)
      {
        uint64_t v24 = [(GEOPDPlaceResponse *)self dotPlaceAtIndex:n];
        [v26 addDotPlace:v24];
      }
    }
  }
  if (self->_analyticData) {
    objc_msgSend(v26, "setAnalyticData:");
  }
  uint64_t v25 = v26;
  if (*(_WORD *)&self->_flags)
  {
    v26[7] = self->_debugLatencyMs;
    *((_WORD *)v26 + 70) |= 1u;
  }
  if (self->_clientMetrics)
  {
    objc_msgSend(v26, "setClientMetrics:");
    uint64_t v25 = v26;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v74 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  os_unfair_lock_lock(&self->_readerLock);
  reader = self->_reader;
  if (reader)
  {
    uint64_t v7 = reader;
    objc_sync_enter(v7);
    if ((*(_WORD *)&self->_flags & 0x80000000) == 0)
    {
      *(void *)((char *)self->_reader + (int)*MEMORY[0x1E4F940E0]) = self->_readerMarkLength;
      [(PBDataReader *)self->_reader seekToOffset:self->_readerMarkPos];
      GEOPDPlaceResponseReadAllFrom(v5, self->_reader, 0);
      os_unfair_lock_unlock(&self->_readerLock);
      id v8 = (id)v5;
      objc_sync_exit(v7);

      goto LABEL_47;
    }
    objc_sync_exit(v7);
  }
  os_unfair_lock_unlock(&self->_readerLock);
  [(GEOPDPlaceResponse *)self readAll:0];
  __int16 flags = (__int16)self->_flags;
  if ((flags & 4) != 0)
  {
    *(_DWORD *)(v5 + 136) = self->_status;
    *(_WORD *)(v5 + 140) |= 4u;
    __int16 flags = (__int16)self->_flags;
  }
  if ((flags & 2) != 0)
  {
    *(_DWORD *)(v5 + 132) = self->_requestType;
    *(_WORD *)(v5 + 140) |= 2u;
  }
  id v10 = [(GEOPDPlaceGlobalResult *)self->_globalResult copyWithZone:a3];
  uint64_t v11 = *(void **)(v5 + 88);
  *(void *)(v5 + 88) = v10;

  long long v67 = 0u;
  long long v68 = 0u;
  long long v65 = 0u;
  long long v66 = 0u;
  id v12 = self->_legacyPlaceResults;
  uint64_t v13 = [(NSMutableArray *)v12 countByEnumeratingWithState:&v65 objects:v73 count:16];
  if (v13)
  {
    uint64_t v14 = *(void *)v66;
    do
    {
      for (uint64_t i = 0; i != v13; ++i)
      {
        if (*(void *)v66 != v14) {
          objc_enumerationMutation(v12);
        }
        uint64_t v16 = (void *)[*(id *)(*((void *)&v65 + 1) + 8 * i) copyWithZone:a3];
        [(id)v5 addLegacyPlaceResult:v16];
      }
      uint64_t v13 = [(NSMutableArray *)v12 countByEnumeratingWithState:&v65 objects:v73 count:16];
    }
    while (v13);
  }

  long long v63 = 0u;
  long long v64 = 0u;
  long long v61 = 0u;
  long long v62 = 0u;
  unint64_t v17 = self->_displayLanguages;
  uint64_t v18 = [(NSMutableArray *)v17 countByEnumeratingWithState:&v61 objects:v72 count:16];
  if (v18)
  {
    uint64_t v19 = *(void *)v62;
    do
    {
      for (uint64_t j = 0; j != v18; ++j)
      {
        if (*(void *)v62 != v19) {
          objc_enumerationMutation(v17);
        }
        unint64_t v21 = (void *)[*(id *)(*((void *)&v61 + 1) + 8 * j) copyWithZone:a3];
        [(id)v5 addDisplayLanguage:v21];
      }
      uint64_t v18 = [(NSMutableArray *)v17 countByEnumeratingWithState:&v61 objects:v72 count:16];
    }
    while (v18);
  }

  uint64_t v22 = [(NSString *)self->_displayRegion copyWithZone:a3];
  uint64_t v23 = *(void **)(v5 + 72);
  *(void *)(v5 + 72) = v22;

  long long v59 = 0u;
  long long v60 = 0u;
  long long v57 = 0u;
  long long v58 = 0u;
  uint64_t v24 = self->_spokenLanguages;
  uint64_t v25 = [(NSMutableArray *)v24 countByEnumeratingWithState:&v57 objects:v71 count:16];
  if (v25)
  {
    uint64_t v26 = *(void *)v58;
    do
    {
      for (uint64_t k = 0; k != v25; ++k)
      {
        if (*(void *)v58 != v26) {
          objc_enumerationMutation(v24);
        }
        uint64_t v28 = (void *)[*(id *)(*((void *)&v57 + 1) + 8 * k) copyWithZone:a3];
        [(id)v5 addSpokenLanguage:v28];
      }
      uint64_t v25 = [(NSMutableArray *)v24 countByEnumeratingWithState:&v57 objects:v71 count:16];
    }
    while (v25);
  }

  uint64_t v29 = [(NSString *)self->_debugApiKey copyWithZone:a3];
  uint64_t v30 = *(void **)(v5 + 48);
  *(void *)(v5 + 48) = v29;

  id v31 = [(GEOPDDatasetABStatus *)self->_datasetAbStatus copyWithZone:a3];
  uint64_t v32 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v31;

  long long v55 = 0u;
  long long v56 = 0u;
  long long v53 = 0u;
  long long v54 = 0u;
  uint64_t v33 = self->_mapsResults;
  uint64_t v34 = [(NSMutableArray *)v33 countByEnumeratingWithState:&v53 objects:v70 count:16];
  if (v34)
  {
    uint64_t v35 = *(void *)v54;
    do
    {
      for (uint64_t m = 0; m != v34; ++m)
      {
        if (*(void *)v54 != v35) {
          objc_enumerationMutation(v33);
        }
        long long v37 = (void *)[*(id *)(*((void *)&v53 + 1) + 8 * m) copyWithZone:a3];
        [(id)v5 addMapsResult:v37];
      }
      uint64_t v34 = [(NSMutableArray *)v33 countByEnumeratingWithState:&v53 objects:v70 count:16];
    }
    while (v34);
  }

  long long v51 = 0u;
  long long v52 = 0u;
  long long v49 = 0u;
  long long v50 = 0u;
  id v38 = self->_dotPlaces;
  uint64_t v39 = [(NSMutableArray *)v38 countByEnumeratingWithState:&v49 objects:v69 count:16];
  if (v39)
  {
    uint64_t v40 = *(void *)v50;
    do
    {
      for (uint64_t n = 0; n != v39; ++n)
      {
        if (*(void *)v50 != v40) {
          objc_enumerationMutation(v38);
        }
        uint64_t v42 = objc_msgSend(*(id *)(*((void *)&v49 + 1) + 8 * n), "copyWithZone:", a3, (void)v49);
        [(id)v5 addDotPlace:v42];
      }
      uint64_t v39 = [(NSMutableArray *)v38 countByEnumeratingWithState:&v49 objects:v69 count:16];
    }
    while (v39);
  }

  id v43 = [(GEOPDPlacesRequestResponseAnalyticsData *)self->_analyticData copyWithZone:a3];
  long long v44 = *(void **)(v5 + 24);
  *(void *)(v5 + 24) = v43;

  if (*(_WORD *)&self->_flags)
  {
    *(void *)(v5 + 56) = self->_debugLatencyMs;
    *(_WORD *)(v5 + 140) |= 1u;
  }
  id v45 = -[GEOClientMetrics copyWithZone:](self->_clientMetrics, "copyWithZone:", a3, (void)v49);
  uint64_t v46 = *(void **)(v5 + 32);
  *(void *)(v5 + 32) = v45;

  uint64_t v47 = self->_unknownFields;
  id v8 = *(id *)(v5 + 16);
  *(void *)(v5 + 16) = v47;
LABEL_47:

  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_39;
  }
  [(GEOPDPlaceResponse *)self readAll:1];
  [v4 readAll:1];
  __int16 flags = (__int16)self->_flags;
  __int16 v6 = *((_WORD *)v4 + 70);
  if ((flags & 4) != 0)
  {
    if ((v6 & 4) == 0 || self->_status != *((_DWORD *)v4 + 34)) {
      goto LABEL_39;
    }
  }
  else if ((v6 & 4) != 0)
  {
LABEL_39:
    char v19 = 0;
    goto LABEL_40;
  }
  if ((flags & 2) != 0)
  {
    if ((v6 & 2) == 0 || self->_requestType != *((_DWORD *)v4 + 33)) {
      goto LABEL_39;
    }
  }
  else if ((v6 & 2) != 0)
  {
    goto LABEL_39;
  }
  globalResult = self->_globalResult;
  if ((unint64_t)globalResult | *((void *)v4 + 11)
    && !-[GEOPDPlaceGlobalResult isEqual:](globalResult, "isEqual:"))
  {
    goto LABEL_39;
  }
  legacyPlaceResults = self->_legacyPlaceResults;
  if ((unint64_t)legacyPlaceResults | *((void *)v4 + 13))
  {
    if (!-[NSMutableArray isEqual:](legacyPlaceResults, "isEqual:")) {
      goto LABEL_39;
    }
  }
  displayLanguages = self->_displayLanguages;
  if ((unint64_t)displayLanguages | *((void *)v4 + 8))
  {
    if (!-[NSMutableArray isEqual:](displayLanguages, "isEqual:")) {
      goto LABEL_39;
    }
  }
  displayRegiouint64_t n = self->_displayRegion;
  if ((unint64_t)displayRegion | *((void *)v4 + 9))
  {
    if (!-[NSString isEqual:](displayRegion, "isEqual:")) {
      goto LABEL_39;
    }
  }
  spokenLanguages = self->_spokenLanguages;
  if ((unint64_t)spokenLanguages | *((void *)v4 + 14))
  {
    if (!-[NSMutableArray isEqual:](spokenLanguages, "isEqual:")) {
      goto LABEL_39;
    }
  }
  debugApiKey = self->_debugApiKey;
  if ((unint64_t)debugApiKey | *((void *)v4 + 6))
  {
    if (!-[NSString isEqual:](debugApiKey, "isEqual:")) {
      goto LABEL_39;
    }
  }
  datasetAbStatus = self->_datasetAbStatus;
  if ((unint64_t)datasetAbStatus | *((void *)v4 + 5))
  {
    if (!-[GEOPDDatasetABStatus isEqual:](datasetAbStatus, "isEqual:")) {
      goto LABEL_39;
    }
  }
  mapsResults = self->_mapsResults;
  if ((unint64_t)mapsResults | *((void *)v4 + 12))
  {
    if (!-[NSMutableArray isEqual:](mapsResults, "isEqual:")) {
      goto LABEL_39;
    }
  }
  dotPlaces = self->_dotPlaces;
  if ((unint64_t)dotPlaces | *((void *)v4 + 10))
  {
    if (!-[NSMutableArray isEqual:](dotPlaces, "isEqual:")) {
      goto LABEL_39;
    }
  }
  analyticData = self->_analyticData;
  if ((unint64_t)analyticData | *((void *)v4 + 3))
  {
    if (!-[GEOPDPlacesRequestResponseAnalyticsData isEqual:](analyticData, "isEqual:")) {
      goto LABEL_39;
    }
  }
  __int16 v17 = *((_WORD *)v4 + 70);
  if (*(_WORD *)&self->_flags)
  {
    if ((v17 & 1) == 0 || self->_debugLatencyMs != *((void *)v4 + 7)) {
      goto LABEL_39;
    }
  }
  else if (v17)
  {
    goto LABEL_39;
  }
  clientMetrics = self->_clientMetrics;
  if ((unint64_t)clientMetrics | *((void *)v4 + 4)) {
    char v19 = -[GEOClientMetrics isEqual:](clientMetrics, "isEqual:");
  }
  else {
    char v19 = 1;
  }
LABEL_40:

  return v19;
}

- (unint64_t)hash
{
  [(GEOPDPlaceResponse *)self readAll:1];
  __int16 flags = (__int16)self->_flags;
  if ((flags & 4) != 0)
  {
    uint64_t v17 = 2654435761 * self->_status;
    if ((flags & 2) != 0) {
      goto LABEL_3;
    }
  }
  else
  {
    uint64_t v17 = 0;
    if ((flags & 2) != 0)
    {
LABEL_3:
      uint64_t v16 = 2654435761 * self->_requestType;
      goto LABEL_6;
    }
  }
  uint64_t v16 = 0;
LABEL_6:
  unint64_t v15 = [(GEOPDPlaceGlobalResult *)self->_globalResult hash];
  uint64_t v14 = [(NSMutableArray *)self->_legacyPlaceResults hash];
  uint64_t v4 = [(NSMutableArray *)self->_displayLanguages hash];
  NSUInteger v5 = [(NSString *)self->_displayRegion hash];
  uint64_t v6 = [(NSMutableArray *)self->_spokenLanguages hash];
  NSUInteger v7 = [(NSString *)self->_debugApiKey hash];
  unint64_t v8 = [(GEOPDDatasetABStatus *)self->_datasetAbStatus hash];
  uint64_t v9 = [(NSMutableArray *)self->_mapsResults hash];
  uint64_t v10 = [(NSMutableArray *)self->_dotPlaces hash];
  unint64_t v11 = [(GEOPDPlacesRequestResponseAnalyticsData *)self->_analyticData hash];
  if (*(_WORD *)&self->_flags) {
    unint64_t v12 = 2654435761u * self->_debugLatencyMs;
  }
  else {
    unint64_t v12 = 0;
  }
  return v16 ^ v17 ^ v14 ^ v15 ^ v4 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9 ^ v10 ^ v11 ^ v12 ^ [(GEOClientMetrics *)self->_clientMetrics hash];
}

- (void)mergeFrom:(id)a3
{
  uint64_t v64 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  [v4 readAll:0];
  __int16 v5 = *((_WORD *)v4 + 70);
  if ((v5 & 4) != 0)
  {
    self->_status = *((_DWORD *)v4 + 34);
    *(_WORD *)&self->_flags |= 4u;
    __int16 v5 = *((_WORD *)v4 + 70);
  }
  if ((v5 & 2) != 0)
  {
    self->_requestType = *((_DWORD *)v4 + 33);
    *(_WORD *)&self->_flags |= 2u;
  }
  globalResult = self->_globalResult;
  NSUInteger v7 = (void *)*((void *)v4 + 11);
  if (globalResult)
  {
    if (v7) {
      -[GEOPDPlaceGlobalResult mergeFrom:](globalResult, v7);
    }
  }
  else if (v7)
  {
    [(GEOPDPlaceResponse *)self setGlobalResult:*((void *)v4 + 11)];
  }
  long long v57 = 0u;
  long long v58 = 0u;
  long long v55 = 0u;
  long long v56 = 0u;
  id v8 = *((id *)v4 + 13);
  uint64_t v9 = [v8 countByEnumeratingWithState:&v55 objects:v63 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v56;
    do
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v56 != v11) {
          objc_enumerationMutation(v8);
        }
        [(GEOPDPlaceResponse *)self addLegacyPlaceResult:*(void *)(*((void *)&v55 + 1) + 8 * i)];
      }
      uint64_t v10 = [v8 countByEnumeratingWithState:&v55 objects:v63 count:16];
    }
    while (v10);
  }

  long long v53 = 0u;
  long long v54 = 0u;
  long long v51 = 0u;
  long long v52 = 0u;
  id v13 = *((id *)v4 + 8);
  uint64_t v14 = [v13 countByEnumeratingWithState:&v51 objects:v62 count:16];
  if (v14)
  {
    uint64_t v15 = v14;
    uint64_t v16 = *(void *)v52;
    do
    {
      for (uint64_t j = 0; j != v15; ++j)
      {
        if (*(void *)v52 != v16) {
          objc_enumerationMutation(v13);
        }
        [(GEOPDPlaceResponse *)self addDisplayLanguage:*(void *)(*((void *)&v51 + 1) + 8 * j)];
      }
      uint64_t v15 = [v13 countByEnumeratingWithState:&v51 objects:v62 count:16];
    }
    while (v15);
  }

  if (*((void *)v4 + 9)) {
    -[GEOPDPlaceResponse setDisplayRegion:](self, "setDisplayRegion:");
  }
  long long v49 = 0u;
  long long v50 = 0u;
  long long v47 = 0u;
  long long v48 = 0u;
  id v18 = *((id *)v4 + 14);
  uint64_t v19 = [v18 countByEnumeratingWithState:&v47 objects:v61 count:16];
  if (v19)
  {
    uint64_t v20 = v19;
    uint64_t v21 = *(void *)v48;
    do
    {
      for (uint64_t k = 0; k != v20; ++k)
      {
        if (*(void *)v48 != v21) {
          objc_enumerationMutation(v18);
        }
        [(GEOPDPlaceResponse *)self addSpokenLanguage:*(void *)(*((void *)&v47 + 1) + 8 * k)];
      }
      uint64_t v20 = [v18 countByEnumeratingWithState:&v47 objects:v61 count:16];
    }
    while (v20);
  }

  if (*((void *)v4 + 6)) {
    -[GEOPDPlaceResponse setDebugApiKey:](self, "setDebugApiKey:");
  }
  datasetAbStatus = self->_datasetAbStatus;
  uint64_t v24 = *((void *)v4 + 5);
  if (datasetAbStatus)
  {
    if (v24) {
      -[GEOPDDatasetABStatus mergeFrom:](datasetAbStatus, "mergeFrom:");
    }
  }
  else if (v24)
  {
    -[GEOPDPlaceResponse setDatasetAbStatus:](self, "setDatasetAbStatus:");
  }
  long long v45 = 0u;
  long long v46 = 0u;
  long long v43 = 0u;
  long long v44 = 0u;
  id v25 = *((id *)v4 + 12);
  uint64_t v26 = [v25 countByEnumeratingWithState:&v43 objects:v60 count:16];
  if (v26)
  {
    uint64_t v27 = v26;
    uint64_t v28 = *(void *)v44;
    do
    {
      for (uint64_t m = 0; m != v27; ++m)
      {
        if (*(void *)v44 != v28) {
          objc_enumerationMutation(v25);
        }
        [(GEOPDPlaceResponse *)self addMapsResult:*(void *)(*((void *)&v43 + 1) + 8 * m)];
      }
      uint64_t v27 = [v25 countByEnumeratingWithState:&v43 objects:v60 count:16];
    }
    while (v27);
  }

  long long v41 = 0u;
  long long v42 = 0u;
  long long v39 = 0u;
  long long v40 = 0u;
  id v30 = *((id *)v4 + 10);
  uint64_t v31 = [v30 countByEnumeratingWithState:&v39 objects:v59 count:16];
  if (v31)
  {
    uint64_t v32 = v31;
    uint64_t v33 = *(void *)v40;
    do
    {
      for (uint64_t n = 0; n != v32; ++n)
      {
        if (*(void *)v40 != v33) {
          objc_enumerationMutation(v30);
        }
        -[GEOPDPlaceResponse addDotPlace:](self, "addDotPlace:", *(void *)(*((void *)&v39 + 1) + 8 * n), (void)v39);
      }
      uint64_t v32 = [v30 countByEnumeratingWithState:&v39 objects:v59 count:16];
    }
    while (v32);
  }

  analyticData = self->_analyticData;
  uint64_t v36 = *((void *)v4 + 3);
  if (analyticData)
  {
    if (v36) {
      -[GEOPDPlacesRequestResponseAnalyticsData mergeFrom:](analyticData, "mergeFrom:");
    }
  }
  else if (v36)
  {
    -[GEOPDPlaceResponse setAnalyticData:](self, "setAnalyticData:");
  }
  if (*((_WORD *)v4 + 70))
  {
    self->_debugLatencyMs = *((void *)v4 + 7);
    *(_WORD *)&self->_flags |= 1u;
  }
  clientMetrics = self->_clientMetrics;
  uint64_t v38 = *((void *)v4 + 4);
  if (clientMetrics)
  {
    if (v38) {
      -[GEOClientMetrics mergeFrom:](clientMetrics, "mergeFrom:");
    }
  }
  else if (v38)
  {
    -[GEOPDPlaceResponse setClientMetrics:](self, "setClientMetrics:");
  }
}

- (PBUnknownFields)unknownFields
{
  p_readerLocuint64_t k = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  if ((*(_WORD *)&self->_flags & 8) == 0)
  {
    reader = self->_reader;
    if (reader)
    {
      __int16 v5 = reader;
      objc_sync_enter(v5);
      GEOPDPlaceResponseReadSpecified((uint64_t)self, (unint64_t)self->_reader, (int *)&unknownFields_tags_5962);
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
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  p_readerLocuint64_t k = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(_WORD *)&self->_flags |= 0x8008u;
  os_unfair_lock_unlock(p_readerLock);
  unknownFields = self->_unknownFields;
  self->_unknownFields = 0;

  if (v3)
  {
    [(GEOPDPlaceResponse *)self readAll:0];
    -[GEOPDPlaceGlobalResult clearUnknownFields:]((uint64_t)self->_globalResult);
    long long v32 = 0u;
    long long v33 = 0u;
    long long v30 = 0u;
    long long v31 = 0u;
    NSUInteger v7 = self->_legacyPlaceResults;
    uint64_t v8 = [(NSMutableArray *)v7 countByEnumeratingWithState:&v30 objects:v36 count:16];
    if (v8)
    {
      uint64_t v9 = v8;
      uint64_t v10 = *(void *)v31;
      do
      {
        uint64_t v11 = 0;
        do
        {
          if (*(void *)v31 != v10) {
            objc_enumerationMutation(v7);
          }
          [*(id *)(*((void *)&v30 + 1) + 8 * v11++) clearUnknownFields:1];
        }
        while (v9 != v11);
        uint64_t v9 = [(NSMutableArray *)v7 countByEnumeratingWithState:&v30 objects:v36 count:16];
      }
      while (v9);
    }

    [(GEOPDDatasetABStatus *)self->_datasetAbStatus clearUnknownFields:1];
    long long v28 = 0u;
    long long v29 = 0u;
    long long v26 = 0u;
    long long v27 = 0u;
    unint64_t v12 = self->_mapsResults;
    uint64_t v13 = [(NSMutableArray *)v12 countByEnumeratingWithState:&v26 objects:v35 count:16];
    if (v13)
    {
      uint64_t v14 = v13;
      uint64_t v15 = *(void *)v27;
      do
      {
        uint64_t v16 = 0;
        do
        {
          if (*(void *)v27 != v15) {
            objc_enumerationMutation(v12);
          }
          [*(id *)(*((void *)&v26 + 1) + 8 * v16++) clearUnknownFields:1];
        }
        while (v14 != v16);
        uint64_t v14 = [(NSMutableArray *)v12 countByEnumeratingWithState:&v26 objects:v35 count:16];
      }
      while (v14);
    }

    long long v24 = 0u;
    long long v25 = 0u;
    long long v22 = 0u;
    long long v23 = 0u;
    uint64_t v17 = self->_dotPlaces;
    uint64_t v18 = [(NSMutableArray *)v17 countByEnumeratingWithState:&v22 objects:v34 count:16];
    if (v18)
    {
      uint64_t v19 = v18;
      uint64_t v20 = *(void *)v23;
      do
      {
        uint64_t v21 = 0;
        do
        {
          if (*(void *)v23 != v20) {
            objc_enumerationMutation(v17);
          }
          -[GEOPDDotPlace clearUnknownFields:](*(void *)(*((void *)&v22 + 1) + 8 * v21++), 1);
        }
        while (v19 != v21);
        uint64_t v19 = [(NSMutableArray *)v17 countByEnumeratingWithState:&v22 objects:v34 count:16];
      }
      while (v19);
    }

    -[GEOPDPlacesRequestResponseAnalyticsData clearUnknownFields:](self->_analyticData, "clearUnknownFields:", 1, (void)v22);
    [(GEOClientMetrics *)self->_clientMetrics clearUnknownFields:1];
  }
}

- (unint64_t)debugLatencyMs
{
  return self->_debugLatencyMs;
}

- (void)setDebugLatencyMs:(unint64_t)a3
{
  *(_WORD *)&self->_flags |= 0x8001u;
  self->_debugLatencyMs = a3;
}

- (void)setHasDebugLatencyMs:(BOOL)a3
{
  *(_WORD *)&self->___int16 flags = *(_WORD *)&self->_flags & 0x7FFE | a3 | 0x8000;
}

- (BOOL)hasDebugLatencyMs
{
  return *(_WORD *)&self->_flags & 1;
}

- (void)_readClientMetrics
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 128));
    if ((*(_WORD *)(a1 + 140) & 0x20) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOPDPlaceResponseReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readClientMetrics_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 128));
  }
}

- (BOOL)hasClientMetrics
{
  return self->_clientMetrics != 0;
}

- (GEOClientMetrics)clientMetrics
{
  -[GEOPDPlaceResponse _readClientMetrics]((uint64_t)self);
  clientMetrics = self->_clientMetrics;

  return clientMetrics;
}

- (GEOPDPlaceResponse)initWithPlace:(id)a3 forRequestType:(int)a4
{
  uint64_t v4 = *(void *)&a4;
  id v6 = a3;
  NSUInteger v7 = v6;
  if (v6 && ![v6 status])
  {
    v12.receiver = self;
    v12.super_class = (Class)GEOPDPlaceResponse;
    uint64_t v9 = [(GEOPDPlaceResponse *)&v12 init];
    if (v9)
    {
      uint64_t v10 = objc_alloc_init(GEOPDMapsResult);
      [(GEOPDMapsResult *)v10 setResultType:1];
      [(GEOPDMapsResult *)v10 setPlace:v7];
      [(GEOPDPlaceResponse *)v9 addMapsResult:v10];
      [(GEOPDPlaceResponse *)v9 setStatus:0];
      [(GEOPDPlaceResponse *)v9 setRequestType:v4];
    }
    self = v9;
    uint64_t v8 = self;
  }
  else
  {
    uint64_t v8 = 0;
  }

  return v8;
}

@end