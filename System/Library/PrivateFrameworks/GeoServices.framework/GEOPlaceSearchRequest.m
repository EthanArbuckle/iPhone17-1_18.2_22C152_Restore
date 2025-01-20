@interface GEOPlaceSearchRequest
+ (BOOL)isValid:(id)a3;
+ (Class)filterByBusinessCategoryType;
+ (Class)limitToCountryCodeIso2Type;
+ (Class)searchSubstringType;
+ (Class)serviceTagType;
- (BOOL)excludeAddressInResults;
- (BOOL)hasAdditionalEnabledMarkets;
- (BOOL)hasAddress;
- (BOOL)hasBusinessOptions;
- (BOOL)hasBusinessSortOrder;
- (BOOL)hasClientCapabilities;
- (BOOL)hasDeviceCountryCode;
- (BOOL)hasDeviceLocation;
- (BOOL)hasDeviceLocationCountryCode;
- (BOOL)hasDeviceTimeZone;
- (BOOL)hasExcludeAddressInResults;
- (BOOL)hasGeoId;
- (BOOL)hasGreenTeaWithValue:(BOOL)a3;
- (BOOL)hasIncludeBusinessCategories;
- (BOOL)hasIncludeBusinessRating;
- (BOOL)hasIncludeEntryPoints;
- (BOOL)hasIncludeFeatureSets;
- (BOOL)hasIncludeGeoId;
- (BOOL)hasIncludeMatchedToken;
- (BOOL)hasIncludeNameForForwardGeocodingResults;
- (BOOL)hasIncludePhonetics;
- (BOOL)hasIncludeQuads;
- (BOOL)hasIncludeRoadAccessPoints;
- (BOOL)hasIncludeSpokenNames;
- (BOOL)hasIncludeStatusCodeInfo;
- (BOOL)hasIncludeSuggestionsOnly;
- (BOOL)hasIncludeTravelDistance;
- (BOOL)hasIncludeTravelTime;
- (BOOL)hasIncludeUnmatchedStrings;
- (BOOL)hasIndexFilter;
- (BOOL)hasInputLanguage;
- (BOOL)hasIntersectingGeoId;
- (BOOL)hasIsCanonicalLocationSearch;
- (BOOL)hasIsFromAPI;
- (BOOL)hasIsPopularNearbyRequest;
- (BOOL)hasIsStrictGeocoding;
- (BOOL)hasIsStrictMapRegion;
- (BOOL)hasKnownAccuracy;
- (BOOL)hasKnownLocation;
- (BOOL)hasLocalSearchProviderID;
- (BOOL)hasLocation;
- (BOOL)hasMapMode;
- (BOOL)hasMapRegion;
- (BOOL)hasMaxBusinessReviews;
- (BOOL)hasMaxResults;
- (BOOL)hasPhoneticLocaleIdentifier;
- (BOOL)hasPlaceTypeLimit;
- (BOOL)hasPreserveFields;
- (BOOL)hasSearch;
- (BOOL)hasSearchContext;
- (BOOL)hasSearchContextSubstring;
- (BOOL)hasSearchLocation;
- (BOOL)hasSearchSource;
- (BOOL)hasSequenceNumber;
- (BOOL)hasSessionGUID;
- (BOOL)hasStructuredSearch;
- (BOOL)hasSuggestionsOptions;
- (BOOL)hasSuggestionsPrefix;
- (BOOL)hasSuppressResultsRequiringAttribution;
- (BOOL)hasTimeSinceMapEnteredForeground;
- (BOOL)hasTimeSinceMapViewportChanged;
- (BOOL)hasTimestamp;
- (BOOL)hasTransportTypeForTravelTimes;
- (BOOL)hasViewportCenterCountryCode;
- (BOOL)hasZilchPoints;
- (BOOL)includeBusinessCategories;
- (BOOL)includeBusinessRating;
- (BOOL)includeEntryPoints;
- (BOOL)includeFeatureSets;
- (BOOL)includeGeoId;
- (BOOL)includeMatchedToken;
- (BOOL)includeNameForForwardGeocodingResults;
- (BOOL)includePhonetics;
- (BOOL)includeQuads;
- (BOOL)includeRoadAccessPoints;
- (BOOL)includeSpokenNames;
- (BOOL)includeStatusCodeInfo;
- (BOOL)includeSuggestionsOnly;
- (BOOL)includeTravelDistance;
- (BOOL)includeTravelTime;
- (BOOL)includeUnmatchedStrings;
- (BOOL)isCanonicalLocationSearch;
- (BOOL)isEqual:(id)a3;
- (BOOL)isFromAPI;
- (BOOL)isPopularNearbyRequest;
- (BOOL)isStrictGeocoding;
- (BOOL)isStrictMapRegion;
- (BOOL)readFrom:(id)a3;
- (BOOL)structuredSearch;
- (BOOL)suppressResultsRequiringAttribution;
- (Class)responseClass;
- (GEOAdditionalEnabledMarkets)additionalEnabledMarkets;
- (GEOAddress)address;
- (GEOAddress)preserveFields;
- (GEOBusinessOptions)businessOptions;
- (GEOClientCapabilities)clientCapabilities;
- (GEOIndexQueryNode)indexFilter;
- (GEOLatLng)deviceLocation;
- (GEOLatLng)knownLocation;
- (GEOLatLng)searchLocation;
- (GEOLocation)location;
- (GEOMapRegion)mapRegion;
- (GEOPlaceSearchRequest)init;
- (GEOPlaceSearchRequest)initWithData:(id)a3;
- (GEOPlaceSearchRequest)initWithDictionary:(id)a3;
- (GEOPlaceSearchRequest)initWithJSON:(id)a3;
- (GEOPlaceSearchRequest)initWithTraits:(id)a3;
- (GEOSearchSubstring)searchContextSubstring;
- (GEOSessionID)sessionGUID;
- (GEOSuggestionsOptions)suggestionsOptions;
- (NSData)zilchPoints;
- (NSMutableArray)filterByBusinessCategorys;
- (NSMutableArray)limitToCountryCodeIso2s;
- (NSMutableArray)searchSubstrings;
- (NSMutableArray)serviceTags;
- (NSString)deviceCountryCode;
- (NSString)deviceLocationCountryCode;
- (NSString)deviceTimeZone;
- (NSString)inputLanguage;
- (NSString)phoneticLocaleIdentifier;
- (NSString)search;
- (NSString)searchContext;
- (NSString)suggestionsPrefix;
- (NSString)viewportCenterCountryCode;
- (PBUnknownFields)unknownFields;
- (double)timeSinceMapEnteredForeground;
- (double)timeSinceMapViewportChanged;
- (double)timestamp;
- (id)_dictionaryRepresentation:(uint64_t)a1;
- (id)_initWithDictionary:(int)a3 isJSON:;
- (id)additionalPlaceTypesAsString:(int)a3;
- (id)businessSortOrderAsString:(int)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)filterByBusinessCategoryAtIndex:(unint64_t)a3;
- (id)jsonRepresentation;
- (id)knownAccuracyAsString:(int)a3;
- (id)limitToCountryCodeIso2AtIndex:(unint64_t)a3;
- (id)mapModeAsString:(int)a3;
- (id)optionalSuppressionReasonsAsString:(int)a3;
- (id)placeTypeLimitAsString:(int)a3;
- (id)searchSourceAsString:(int)a3;
- (id)searchSubstringAtIndex:(unint64_t)a3;
- (id)serviceTagAtIndex:(unint64_t)a3;
- (id)transportTypeForTravelTimesAsString:(int)a3;
- (int)StringAsAdditionalPlaceTypes:(id)a3;
- (int)StringAsBusinessSortOrder:(id)a3;
- (int)StringAsKnownAccuracy:(id)a3;
- (int)StringAsMapMode:(id)a3;
- (int)StringAsOptionalSuppressionReasons:(id)a3;
- (int)StringAsPlaceTypeLimit:(id)a3;
- (int)StringAsSearchSource:(id)a3;
- (int)StringAsTransportTypeForTravelTimes:(id)a3;
- (int)additionalPlaceTypeAtIndex:(unint64_t)a3;
- (int)additionalPlaceTypes;
- (int)businessSortOrder;
- (int)knownAccuracy;
- (int)localSearchProviderID;
- (int)mapMode;
- (int)maxBusinessReviews;
- (int)maxResults;
- (int)optionalSuppressionReasonAtIndex:(unint64_t)a3;
- (int)optionalSuppressionReasons;
- (int)placeTypeLimit;
- (int)searchSource;
- (int)sequenceNumber;
- (int)transportTypeForTravelTimes;
- (int64_t)geoId;
- (unint64_t)additionalPlaceTypesCount;
- (unint64_t)businessIDAtIndex:(unint64_t)a3;
- (unint64_t)businessIDs;
- (unint64_t)businessIDsCount;
- (unint64_t)filterByBusinessCategorysCount;
- (unint64_t)hash;
- (unint64_t)intersectingGeoId;
- (unint64_t)limitToCountryCodeIso2sCount;
- (unint64_t)optionalSuppressionReasonsCount;
- (unint64_t)searchSubstringsCount;
- (unint64_t)serviceTagsCount;
- (unsigned)requestTypeCode;
- (void)_addNoFlagsFilterByBusinessCategory:(uint64_t)a1;
- (void)_addNoFlagsLimitToCountryCodeIso2:(uint64_t)a1;
- (void)_addNoFlagsSearchSubstring:(uint64_t)a1;
- (void)_addNoFlagsServiceTag:(uint64_t)a1;
- (void)_readAdditionalEnabledMarkets;
- (void)_readAdditionalPlaceTypes;
- (void)_readAddress;
- (void)_readBusinessIDs;
- (void)_readBusinessOptions;
- (void)_readClientCapabilities;
- (void)_readDeviceCountryCode;
- (void)_readDeviceLocation;
- (void)_readDeviceLocationCountryCode;
- (void)_readDeviceTimeZone;
- (void)_readFilterByBusinessCategorys;
- (void)_readIndexFilter;
- (void)_readInputLanguage;
- (void)_readKnownLocation;
- (void)_readLimitToCountryCodeIso2s;
- (void)_readLocation;
- (void)_readMapRegion;
- (void)_readOptionalSuppressionReasons;
- (void)_readPhoneticLocaleIdentifier;
- (void)_readPreserveFields;
- (void)_readSearch;
- (void)_readSearchContext;
- (void)_readSearchContextSubstring;
- (void)_readSearchLocation;
- (void)_readSearchSubstrings;
- (void)_readServiceTags;
- (void)_readSuggestionsOptions;
- (void)_readSuggestionsPrefix;
- (void)_readViewportCenterCountryCode;
- (void)_readZilchPoints;
- (void)addAdditionalPlaceType:(int)a3;
- (void)addBusinessID:(unint64_t)a3;
- (void)addFilterByBusinessCategory:(id)a3;
- (void)addLimitToCountryCodeIso2:(id)a3;
- (void)addOptionalSuppressionReason:(int)a3;
- (void)addSearchSubstring:(id)a3;
- (void)addServiceTag:(id)a3;
- (void)clearAdditionalPlaceTypes;
- (void)clearBusinessIDs;
- (void)clearFilterByBusinessCategorys;
- (void)clearLimitToCountryCodeIso2s;
- (void)clearOptionalSuppressionReasons;
- (void)clearSearchSubstrings;
- (void)clearSensitiveFields:(unint64_t)a3;
- (void)clearServiceTags;
- (void)clearUnknownFields:(BOOL)a3;
- (void)copyTo:(id)a3;
- (void)dealloc;
- (void)mergeFrom:(id)a3;
- (void)readAll:(BOOL)a3;
- (void)setAdditionalEnabledMarkets:(id)a3;
- (void)setAdditionalPlaceTypes:(int *)a3 count:(unint64_t)a4;
- (void)setAddress:(id)a3;
- (void)setBusinessIDs:(unint64_t *)a3 count:(unint64_t)a4;
- (void)setBusinessOptions:(id)a3;
- (void)setBusinessSortOrder:(int)a3;
- (void)setClientCapabilities:(id)a3;
- (void)setDeviceCountryCode:(id)a3;
- (void)setDeviceLocation:(id)a3;
- (void)setDeviceLocationCountryCode:(id)a3;
- (void)setDeviceTimeZone:(id)a3;
- (void)setExcludeAddressInResults:(BOOL)a3;
- (void)setFilterByBusinessCategorys:(id)a3;
- (void)setGeoId:(int64_t)a3;
- (void)setHasBusinessSortOrder:(BOOL)a3;
- (void)setHasExcludeAddressInResults:(BOOL)a3;
- (void)setHasGeoId:(BOOL)a3;
- (void)setHasIncludeBusinessCategories:(BOOL)a3;
- (void)setHasIncludeBusinessRating:(BOOL)a3;
- (void)setHasIncludeEntryPoints:(BOOL)a3;
- (void)setHasIncludeFeatureSets:(BOOL)a3;
- (void)setHasIncludeGeoId:(BOOL)a3;
- (void)setHasIncludeMatchedToken:(BOOL)a3;
- (void)setHasIncludeNameForForwardGeocodingResults:(BOOL)a3;
- (void)setHasIncludePhonetics:(BOOL)a3;
- (void)setHasIncludeQuads:(BOOL)a3;
- (void)setHasIncludeRoadAccessPoints:(BOOL)a3;
- (void)setHasIncludeSpokenNames:(BOOL)a3;
- (void)setHasIncludeStatusCodeInfo:(BOOL)a3;
- (void)setHasIncludeSuggestionsOnly:(BOOL)a3;
- (void)setHasIncludeTravelDistance:(BOOL)a3;
- (void)setHasIncludeTravelTime:(BOOL)a3;
- (void)setHasIncludeUnmatchedStrings:(BOOL)a3;
- (void)setHasIntersectingGeoId:(BOOL)a3;
- (void)setHasIsCanonicalLocationSearch:(BOOL)a3;
- (void)setHasIsFromAPI:(BOOL)a3;
- (void)setHasIsPopularNearbyRequest:(BOOL)a3;
- (void)setHasIsStrictGeocoding:(BOOL)a3;
- (void)setHasIsStrictMapRegion:(BOOL)a3;
- (void)setHasKnownAccuracy:(BOOL)a3;
- (void)setHasLocalSearchProviderID:(BOOL)a3;
- (void)setHasMapMode:(BOOL)a3;
- (void)setHasMaxBusinessReviews:(BOOL)a3;
- (void)setHasMaxResults:(BOOL)a3;
- (void)setHasPlaceTypeLimit:(BOOL)a3;
- (void)setHasSearchSource:(BOOL)a3;
- (void)setHasSequenceNumber:(BOOL)a3;
- (void)setHasSessionGUID:(BOOL)a3;
- (void)setHasStructuredSearch:(BOOL)a3;
- (void)setHasSuppressResultsRequiringAttribution:(BOOL)a3;
- (void)setHasTimeSinceMapEnteredForeground:(BOOL)a3;
- (void)setHasTimeSinceMapViewportChanged:(BOOL)a3;
- (void)setHasTimestamp:(BOOL)a3;
- (void)setHasTransportTypeForTravelTimes:(BOOL)a3;
- (void)setIncludeBusinessCategories:(BOOL)a3;
- (void)setIncludeBusinessRating:(BOOL)a3;
- (void)setIncludeEntryPoints:(BOOL)a3;
- (void)setIncludeFeatureSets:(BOOL)a3;
- (void)setIncludeGeoId:(BOOL)a3;
- (void)setIncludeMatchedToken:(BOOL)a3;
- (void)setIncludeNameForForwardGeocodingResults:(BOOL)a3;
- (void)setIncludePhonetics:(BOOL)a3;
- (void)setIncludeQuads:(BOOL)a3;
- (void)setIncludeRoadAccessPoints:(BOOL)a3;
- (void)setIncludeSpokenNames:(BOOL)a3;
- (void)setIncludeStatusCodeInfo:(BOOL)a3;
- (void)setIncludeSuggestionsOnly:(BOOL)a3;
- (void)setIncludeTravelDistance:(BOOL)a3;
- (void)setIncludeTravelTime:(BOOL)a3;
- (void)setIncludeUnmatchedStrings:(BOOL)a3;
- (void)setIndexFilter:(id)a3;
- (void)setInputLanguage:(id)a3;
- (void)setIntersectingGeoId:(unint64_t)a3;
- (void)setIsCanonicalLocationSearch:(BOOL)a3;
- (void)setIsFromAPI:(BOOL)a3;
- (void)setIsPopularNearbyRequest:(BOOL)a3;
- (void)setIsStrictGeocoding:(BOOL)a3;
- (void)setIsStrictMapRegion:(BOOL)a3;
- (void)setKnownAccuracy:(int)a3;
- (void)setKnownLocation:(id)a3;
- (void)setLimitToCountryCodeIso2s:(id)a3;
- (void)setLocalSearchProviderID:(int)a3;
- (void)setLocation:(id)a3;
- (void)setMapMode:(int)a3;
- (void)setMapRegion:(id)a3;
- (void)setMaxBusinessReviews:(int)a3;
- (void)setMaxResults:(int)a3;
- (void)setOptionalSuppressionReasons:(int *)a3 count:(unint64_t)a4;
- (void)setPhoneticLocaleIdentifier:(id)a3;
- (void)setPlaceTypeLimit:(int)a3;
- (void)setPreserveFields:(id)a3;
- (void)setSearch:(id)a3;
- (void)setSearchContext:(id)a3;
- (void)setSearchContextSubstring:(id)a3;
- (void)setSearchLocation:(id)a3;
- (void)setSearchSource:(int)a3;
- (void)setSearchSubstrings:(id)a3;
- (void)setSequenceNumber:(int)a3;
- (void)setServiceTags:(id)a3;
- (void)setSessionGUID:(GEOSessionID)a3;
- (void)setStructuredSearch:(BOOL)a3;
- (void)setSuggestionsOptions:(id)a3;
- (void)setSuggestionsPrefix:(id)a3;
- (void)setSuppressResultsRequiringAttribution:(BOOL)a3;
- (void)setTimeSinceMapEnteredForeground:(double)a3;
- (void)setTimeSinceMapViewportChanged:(double)a3;
- (void)setTimestamp:(double)a3;
- (void)setTransportTypeForTravelTimes:(int)a3;
- (void)setViewportCenterCountryCode:(id)a3;
- (void)setZilchPoints:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation GEOPlaceSearchRequest

- (GEOPlaceSearchRequest)initWithTraits:(id)a3
{
  id v4 = a3;
  v29.receiver = self;
  v29.super_class = (Class)GEOPlaceSearchRequest;
  v5 = [(GEOPlaceSearchRequest *)&v29 init];
  if (v5)
  {
    v6 = [v4 deviceLocation];

    if (v6)
    {
      v7 = [v4 deviceLocation];
      v8 = [v7 latLng];
      [(GEOPlaceSearchRequest *)v5 setDeviceLocation:v8];

      v9 = +[GEOCountryConfiguration sharedConfiguration];
      if ([v9 currentCountrySupportsDirections])
      {
        uint64_t v10 = [v4 transportTypesCount];

        if (v10)
        {
          [(GEOPlaceSearchRequest *)v5 setIncludeTravelTime:1];
          [(GEOPlaceSearchRequest *)v5 setIncludeTravelDistance:1];
        }
      }
      else
      {
      }
    }
    if ([v4 hasMapRegion])
    {
      v11 = [v4 mapRegion];
      [(GEOPlaceSearchRequest *)v5 setMapRegion:v11];
    }
    if ([v4 deviceDisplayLanguagesCount])
    {
      v12 = [v4 deviceDisplayLanguages];
      v13 = [v12 firstObject];
      [(GEOPlaceSearchRequest *)v5 setInputLanguage:v13];
    }
    if ([v4 hasDeviceSpokenLocale])
    {
      [(GEOPlaceSearchRequest *)v5 setIncludeSpokenNames:1];
      v14 = [v4 deviceSpokenLocale];
      [(GEOPlaceSearchRequest *)v5 setPhoneticLocaleIdentifier:v14];
    }
    if ([v4 hasSessionId])
    {
      uint64_t v15 = [v4 sessionId];
      -[GEOPlaceSearchRequest setSessionGUID:](v5, "setSessionGUID:", v15, v16);
    }
    if ([v4 hasSequenceNumber]) {
      -[GEOPlaceSearchRequest setSequenceNumber:](v5, "setSequenceNumber:", [v4 sequenceNumber]);
    }
    v17 = +[GEOMapService sharedService];
    uint64_t v18 = [v17 localSearchProviderID];

    if (v18) {
      [(GEOPlaceSearchRequest *)v5 setLocalSearchProviderID:v18];
    }
    v19 = +[GEOCountryConfiguration sharedConfiguration];
    v20 = [v19 countryCode];
    [(GEOPlaceSearchRequest *)v5 setDeviceCountryCode:v20];

    v21 = [MEMORY[0x1E4F1CAF0] systemTimeZone];
    v22 = [v21 abbreviation];
    [(GEOPlaceSearchRequest *)v5 setDeviceTimeZone:v22];

    if ([v4 hasIsAPICall]) {
      -[GEOPlaceSearchRequest setIsFromAPI:](v5, "setIsFromAPI:", [v4 isAPICall]);
    }
    if ([v4 hasSource])
    {
      unsigned int v23 = [v4 source];
      if (v23 - 1 >= 0x17) {
        uint64_t v24 = 0;
      }
      else {
        uint64_t v24 = v23;
      }
      [(GEOPlaceSearchRequest *)v5 setSearchSource:v24];
    }
    v25 = +[GEOGeoServiceTag defaultTag];
    [(GEOPlaceSearchRequest *)v5 addServiceTag:v25];

    if ([v4 hasTimeSinceMapEnteredForeground]) {
      -[GEOPlaceSearchRequest setTimeSinceMapEnteredForeground:](v5, "setTimeSinceMapEnteredForeground:", (double)[v4 timeSinceMapEnteredForeground]);
    }
    if ([v4 hasTimeSinceMapViewportChanged]) {
      -[GEOPlaceSearchRequest setTimeSinceMapViewportChanged:](v5, "setTimeSinceMapViewportChanged:", (double)[v4 timeSinceMapViewportChanged]);
    }
    if ([v4 hasMode])
    {
      uint64_t v26 = [v4 mode];
      if (v26 <= 4) {
        [(GEOPlaceSearchRequest *)v5 setMapMode:v26];
      }
    }
    v27 = v5;
  }

  return v5;
}

- (GEOPlaceSearchRequest)init
{
  v6.receiver = self;
  v6.super_class = (Class)GEOPlaceSearchRequest;
  v2 = [(GEOPlaceSearchRequest *)&v6 init];
  v3 = v2;
  if (v2)
  {
    v2->_readerLock._os_unfair_lock_opaque = 0;
    id v4 = v2;
  }

  return v3;
}

- (GEOPlaceSearchRequest)initWithData:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)GEOPlaceSearchRequest;
  v3 = [(GEOPlaceSearchRequest *)&v7 initWithData:a3];
  id v4 = v3;
  if (v3)
  {
    v3->_readerLock._os_unfair_lock_opaque = 0;
    v5 = v3;
  }

  return v4;
}

- (void)dealloc
{
  PBRepeatedUInt64Clear();
  PBRepeatedInt32Clear();
  PBRepeatedInt32Clear();
  v3.receiver = self;
  v3.super_class = (Class)GEOPlaceSearchRequest;
  [(GEOPlaceSearchRequest *)&v3 dealloc];
}

- (void)_readBusinessIDs
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 376));
    if ((*(void *)(a1 + 444) & 0x40000000000) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOPlaceSearchRequestReadSpecified(a1, *(char **)(a1 + 8), (int *)&_readBusinessIDs_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 376));
  }
}

- (unint64_t)businessIDsCount
{
  return self->_businessIDs.count;
}

- (unint64_t)businessIDs
{
  return self->_businessIDs.list;
}

- (void)clearBusinessIDs
{
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(void *)&self->_flags |= 0x40000000000uLL;
  os_unfair_lock_unlock(p_readerLock);
  *((unsigned char *)&self->_flags + 8) |= 0x80u;

  PBRepeatedUInt64Clear();
}

- (void)addBusinessID:(unint64_t)a3
{
  -[GEOPlaceSearchRequest _readBusinessIDs]((uint64_t)self);
  if (self) {
    PBRepeatedUInt64Add();
  }
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  p_flags = &self->_flags;
  *(void *)p_flags |= 0x40000000000uLL;
  os_unfair_lock_unlock(p_readerLock);
  *((unsigned char *)p_flags + 8) |= 0x80u;
}

- (unint64_t)businessIDAtIndex:(unint64_t)a3
{
  -[GEOPlaceSearchRequest _readBusinessIDs]((uint64_t)self);
  p_businessIDs = &self->_businessIDs;
  unint64_t count = self->_businessIDs.count;
  if (count <= a3)
  {
    objc_super v7 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v8 = *MEMORY[0x1E4F1C4A8];
    v9 = objc_msgSend(NSString, "stringWithFormat:", @"idx (%tu) is out of range (%tu)", a3, count);
    uint64_t v10 = [v7 exceptionWithName:v8 reason:v9 userInfo:0];
    [v10 raise];
  }
  return p_businessIDs->list[a3];
}

- (void)setBusinessIDs:(unint64_t *)a3 count:(unint64_t)a4
{
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(void *)&self->_flags |= 0x40000000000uLL;
  os_unfair_lock_unlock(p_readerLock);
  *((unsigned char *)&self->_flags + 8) |= 0x80u;

  MEMORY[0x1F4147438](&self->_businessIDs, a3, a4);
}

- (void)_readAddress
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 376));
    if ((*(void *)(a1 + 444) & 0x200000000000) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOPlaceSearchRequestReadSpecified(a1, *(char **)(a1 + 8), (int *)&_readAddress_tags_2238);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 376));
  }
}

- (BOOL)hasAddress
{
  return self->_address != 0;
}

- (GEOAddress)address
{
  -[GEOPlaceSearchRequest _readAddress]((uint64_t)self);
  address = self->_address;

  return address;
}

- (void)setAddress:(id)a3
{
  char v3 = *((unsigned char *)&self->_flags + 8) | 0x80;
  *(void *)&self->_flags |= 0x200000000000uLL;
  *((unsigned char *)&self->_flags + 8) = v3;
  objc_storeStrong((id *)&self->_address, a3);
}

- (void)_readLocation
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 376));
    if ((*(void *)(a1 + 444) & 0x200000000000000) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOPlaceSearchRequestReadSpecified(a1, *(char **)(a1 + 8), (int *)&_readLocation_tags_8);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 376));
  }
}

- (BOOL)hasLocation
{
  return self->_location != 0;
}

- (GEOLocation)location
{
  -[GEOPlaceSearchRequest _readLocation]((uint64_t)self);
  location = self->_location;

  return location;
}

- (void)setLocation:(id)a3
{
  char v3 = *((unsigned char *)&self->_flags + 8) | 0x80;
  *(void *)&self->_flags |= 0x200000000000000uLL;
  *((unsigned char *)&self->_flags + 8) = v3;
  objc_storeStrong((id *)&self->_location, a3);
}

- (void)_readSearch
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 376));
    if ((*(unsigned char *)(a1 + 452) & 2) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOPlaceSearchRequestReadSpecified(a1, *(char **)(a1 + 8), (int *)&_readSearch_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 376));
  }
}

- (BOOL)hasSearch
{
  return self->_search != 0;
}

- (NSString)search
{
  -[GEOPlaceSearchRequest _readSearch]((uint64_t)self);
  search = self->_search;

  return search;
}

- (void)setSearch:(id)a3
{
  *((unsigned char *)&self->_flags + 8) |= 0x82u;
  objc_storeStrong((id *)&self->_search, a3);
}

- (void)_readMapRegion
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 376));
    if ((*(void *)(a1 + 444) & 0x400000000000000) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOPlaceSearchRequestReadSpecified(a1, *(char **)(a1 + 8), (int *)&_readMapRegion_tags_2239);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 376));
  }
}

- (BOOL)hasMapRegion
{
  return self->_mapRegion != 0;
}

- (GEOMapRegion)mapRegion
{
  -[GEOPlaceSearchRequest _readMapRegion]((uint64_t)self);
  mapRegion = self->_mapRegion;

  return mapRegion;
}

- (void)setMapRegion:(id)a3
{
  char v3 = *((unsigned char *)&self->_flags + 8) | 0x80;
  *(void *)&self->_flags |= 0x400000000000000uLL;
  *((unsigned char *)&self->_flags + 8) = v3;
  objc_storeStrong((id *)&self->_mapRegion, a3);
}

- (void)_readAdditionalPlaceTypes
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 376));
    if ((*(void *)(a1 + 444) & 0x20000000000) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOPlaceSearchRequestReadSpecified(a1, *(char **)(a1 + 8), (int *)&_readAdditionalPlaceTypes_tags_0);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 376));
  }
}

- (unint64_t)additionalPlaceTypesCount
{
  return self->_additionalPlaceTypes.count;
}

- (int)additionalPlaceTypes
{
  return self->_additionalPlaceTypes.list;
}

- (void)clearAdditionalPlaceTypes
{
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(void *)&self->_flags |= 0x20000000000uLL;
  os_unfair_lock_unlock(p_readerLock);
  *((unsigned char *)&self->_flags + 8) |= 0x80u;

  PBRepeatedInt32Clear();
}

- (void)addAdditionalPlaceType:(int)a3
{
  -[GEOPlaceSearchRequest _readAdditionalPlaceTypes]((uint64_t)self);
  if (self) {
    PBRepeatedInt32Add();
  }
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  p_flags = &self->_flags;
  *(void *)p_flags |= 0x20000000000uLL;
  os_unfair_lock_unlock(p_readerLock);
  *((unsigned char *)p_flags + 8) |= 0x80u;
}

- (int)additionalPlaceTypeAtIndex:(unint64_t)a3
{
  -[GEOPlaceSearchRequest _readAdditionalPlaceTypes]((uint64_t)self);
  p_additionalPlaceTypes = &self->_additionalPlaceTypes;
  unint64_t count = self->_additionalPlaceTypes.count;
  if (count <= a3)
  {
    objc_super v7 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v8 = *MEMORY[0x1E4F1C4A8];
    v9 = objc_msgSend(NSString, "stringWithFormat:", @"idx (%tu) is out of range (%tu)", a3, count);
    uint64_t v10 = [v7 exceptionWithName:v8 reason:v9 userInfo:0];
    [v10 raise];
  }
  return p_additionalPlaceTypes->list[a3];
}

- (void)setAdditionalPlaceTypes:(int *)a3 count:(unint64_t)a4
{
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(void *)&self->_flags |= 0x20000000000uLL;
  os_unfair_lock_unlock(p_readerLock);
  *((unsigned char *)&self->_flags + 8) |= 0x80u;

  MEMORY[0x1F4147390](&self->_additionalPlaceTypes, a3, a4);
}

- (id)additionalPlaceTypesAsString:(int)a3
{
  if (a3 > 99)
  {
    switch(a3)
    {
      case 'd':
        id v4 = @"DMA";
        break;
      case 'e':
        id v4 = @"CAT_10284_POSTAL";
        break;
      case 'f':
        id v4 = @"CAT_10285_CITY";
        break;
      case 'g':
        id v4 = @"CAT_10286_COUNTY";
        break;
      case 'h':
        id v4 = @"CAT_10287_STATE";
        break;
      case 'i':
        id v4 = @"CAT_10288_COUNTRY";
        break;
      case 'j':
        id v4 = @"CAT_10288_COUNTRY_CODE";
        break;
      case 'k':
        id v4 = @"CAT_10287_STATE_CODE";
        break;
      default:
        if (a3 == 1016)
        {
          id v4 = @"PERDU_CITY";
        }
        else
        {
LABEL_94:
          objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
          id v4 = (__CFString *)objc_claimAutoreleasedReturnValue();
LABEL_95:
        }
        break;
    }
  }
  else
  {
    switch(a3)
    {
      case '#':
        id v4 = @"TIME_ZONE";
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
      case '<':
      case '>':
      case '?':
      case '@':
        goto LABEL_94;
      case '+':
        id v4 = @"NEIGHBORHOOD";
        break;
      case ',':
        id v4 = @"OCEAN";
        break;
      case '-':
        id v4 = @"AOI";
        break;
      case '.':
        id v4 = @"INLAND_WATER";
        break;
      case '/':
        id v4 = @"POI";
        break;
      case '0':
        id v4 = @"ISLAND";
        break;
      case '1':
        id v4 = @"STREET";
        break;
      case '2':
        id v4 = @"ADMIN";
        break;
      case '3':
        id v4 = @"POSTAL";
        break;
      case '6':
        id v4 = @"INTERSECTION";
        break;
      case '7':
        id v4 = @"BUILDING";
        break;
      case '9':
        id v4 = @"ADDRESS";
        break;
      case ';':
        id v4 = @"ZCTAS";
        break;
      case '=':
        id v4 = @"CONTINENT";
        break;
      case 'A':
        id v4 = @"PHYSICAL_FEATURE";
        break;
      default:
        id v4 = @"PT_UNKNOWN";
        switch(a3)
        {
          case 0:
            goto LABEL_95;
          case 1:
            id v4 = @"COUNTRY";
            break;
          case 2:
            id v4 = @"STATE";
            break;
          case 3:
            goto LABEL_94;
          case 4:
            id v4 = @"COUNTY";
            break;
          default:
            if (a3 != 16) {
              goto LABEL_94;
            }
            id v4 = @"CITY";
            break;
        }
        break;
    }
  }
  return v4;
}

- (int)StringAsAdditionalPlaceTypes:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"PT_UNKNOWN"])
  {
    int v4 = 0;
  }
  else if ([v3 isEqualToString:@"COUNTRY"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"STATE"])
  {
    int v4 = 2;
  }
  else if ([v3 isEqualToString:@"COUNTY"])
  {
    int v4 = 4;
  }
  else if ([v3 isEqualToString:@"CITY"])
  {
    int v4 = 16;
  }
  else if ([v3 isEqualToString:@"TIME_ZONE"])
  {
    int v4 = 35;
  }
  else if ([v3 isEqualToString:@"NEIGHBORHOOD"])
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
  else if ([v3 isEqualToString:@"POI"])
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
  else if ([v3 isEqualToString:@"ZCTAS"])
  {
    int v4 = 59;
  }
  else if ([v3 isEqualToString:@"CONTINENT"])
  {
    int v4 = 61;
  }
  else if ([v3 isEqualToString:@"PHYSICAL_FEATURE"])
  {
    int v4 = 65;
  }
  else if ([v3 isEqualToString:@"PERDU_CITY"])
  {
    int v4 = 1016;
  }
  else if ([v3 isEqualToString:@"DMA"])
  {
    int v4 = 100;
  }
  else if ([v3 isEqualToString:@"CAT_10284_POSTAL"])
  {
    int v4 = 101;
  }
  else if ([v3 isEqualToString:@"CAT_10285_CITY"])
  {
    int v4 = 102;
  }
  else if ([v3 isEqualToString:@"CAT_10286_COUNTY"])
  {
    int v4 = 103;
  }
  else if ([v3 isEqualToString:@"CAT_10287_STATE"])
  {
    int v4 = 104;
  }
  else if ([v3 isEqualToString:@"CAT_10288_COUNTRY"])
  {
    int v4 = 105;
  }
  else if ([v3 isEqualToString:@"CAT_10288_COUNTRY_CODE"])
  {
    int v4 = 106;
  }
  else if ([v3 isEqualToString:@"CAT_10287_STATE_CODE"])
  {
    int v4 = 107;
  }
  else
  {
    int v4 = 0;
  }

  return v4;
}

- (BOOL)includePhonetics
{
  return self->_includePhonetics;
}

- (void)setIncludePhonetics:(BOOL)a3
{
  char v3 = *((unsigned char *)&self->_flags + 8) | 0x80;
  *(void *)&self->_flags |= 0x1000000uLL;
  *((unsigned char *)&self->_flags + 8) = v3;
  self->_includePhonetics = a3;
}

- (void)setHasIncludePhonetics:(BOOL)a3
{
  char v3 = *((unsigned char *)&self->_flags + 8);
  uint64_t v4 = 0x1000000;
  if (!a3) {
    uint64_t v4 = 0;
  }
  *(void *)&self->_flags = *(void *)&self->_flags & 0xFFFFFFFFFEFFFFFFLL | v4;
  *((unsigned char *)&self->_flags + 8) = v3 | 0x80;
}

- (BOOL)hasIncludePhonetics
{
  return (*(void *)&self->_flags >> 24) & 1;
}

- (int)maxResults
{
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  uint64_t flags = (uint64_t)self->_flags;
  os_unfair_lock_unlock(p_readerLock);
  if ((flags & 0x800) != 0) {
    return self->_maxResults;
  }
  else {
    return 10;
  }
}

- (void)setMaxResults:(int)a3
{
  char v3 = *((unsigned char *)&self->_flags + 8) | 0x80;
  *(void *)&self->_flags |= 0x800uLL;
  *((unsigned char *)&self->_flags + 8) = v3;
  self->_maxResults = a3;
}

- (void)setHasMaxResults:(BOOL)a3
{
  char v3 = *((unsigned char *)&self->_flags + 8);
  uint64_t v4 = 2048;
  if (!a3) {
    uint64_t v4 = 0;
  }
  *(void *)&self->_uint64_t flags = *(void *)&self->_flags & 0xFFFFFFFFFFFFF7FFLL | v4;
  *((unsigned char *)&self->_flags + 8) = v3 | 0x80;
}

- (BOOL)hasMaxResults
{
  return (*(void *)&self->_flags >> 11) & 1;
}

- (GEOSessionID)sessionGUID
{
  p_sessionGUID = &self->_sessionGUID;
  unint64_t high = self->_sessionGUID._high;
  unint64_t low = p_sessionGUID->_low;
  result._unint64_t low = low;
  result._unint64_t high = high;
  return result;
}

- (void)setSessionGUID:(GEOSessionID)a3
{
  char v3 = *((unsigned char *)&self->_flags + 8) | 0x80;
  *(void *)&self->_flags |= 1uLL;
  *((unsigned char *)&self->_flags + 8) = v3;
  self->_sessionGUID = a3;
}

- (void)setHasSessionGUID:(BOOL)a3
{
  char v3 = *((unsigned char *)&self->_flags + 8) | 0x80;
  *(void *)&self->_uint64_t flags = *(void *)&self->_flags & 0xFFFFFFFFFFFFFFFELL | a3;
  *((unsigned char *)&self->_flags + 8) = v3;
}

- (BOOL)hasSessionGUID
{
  return *(_DWORD *)&self->_flags & 1;
}

- (int)businessSortOrder
{
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  uint64_t flags = (uint64_t)self->_flags;
  os_unfair_lock_unlock(p_readerLock);
  if ((flags & 0x40) != 0) {
    return self->_businessSortOrder;
  }
  else {
    return 0;
  }
}

- (void)setBusinessSortOrder:(int)a3
{
  char v3 = *((unsigned char *)&self->_flags + 8) | 0x80;
  *(void *)&self->_flags |= 0x40uLL;
  *((unsigned char *)&self->_flags + 8) = v3;
  self->_businessSortOrder = a3;
}

- (void)setHasBusinessSortOrder:(BOOL)a3
{
  char v3 = *((unsigned char *)&self->_flags + 8);
  uint64_t v4 = 64;
  if (!a3) {
    uint64_t v4 = 0;
  }
  *(void *)&self->_uint64_t flags = *(void *)&self->_flags & 0xFFFFFFFFFFFFFFBFLL | v4;
  *((unsigned char *)&self->_flags + 8) = v3 | 0x80;
}

- (BOOL)hasBusinessSortOrder
{
  return (*(void *)&self->_flags >> 6) & 1;
}

- (id)businessSortOrderAsString:(int)a3
{
  if (a3 >= 3)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
    char v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    char v3 = off_1E53E7080[a3];
  }

  return v3;
}

- (int)StringAsBusinessSortOrder:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"RELEVANCE"])
  {
    int v4 = 0;
  }
  else if ([v3 isEqualToString:@"RATING"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"DISTANCE"])
  {
    int v4 = 2;
  }
  else
  {
    int v4 = 0;
  }

  return v4;
}

- (BOOL)includeBusinessRating
{
  return self->_includeBusinessRating;
}

- (void)setIncludeBusinessRating:(BOOL)a3
{
  char v3 = *((unsigned char *)&self->_flags + 8) | 0x80;
  *(void *)&self->_flags |= 0x40000uLL;
  *((unsigned char *)&self->_flags + 8) = v3;
  self->_includeBusinessRating = a3;
}

- (void)setHasIncludeBusinessRating:(BOOL)a3
{
  char v3 = *((unsigned char *)&self->_flags + 8);
  uint64_t v4 = 0x40000;
  if (!a3) {
    uint64_t v4 = 0;
  }
  *(void *)&self->_uint64_t flags = *(void *)&self->_flags & 0xFFFFFFFFFFFBFFFFLL | v4;
  *((unsigned char *)&self->_flags + 8) = v3 | 0x80;
}

- (BOOL)hasIncludeBusinessRating
{
  return (*(void *)&self->_flags >> 18) & 1;
}

- (BOOL)includeBusinessCategories
{
  return self->_includeBusinessCategories;
}

- (void)setIncludeBusinessCategories:(BOOL)a3
{
  char v3 = *((unsigned char *)&self->_flags + 8) | 0x80;
  *(void *)&self->_flags |= 0x20000uLL;
  *((unsigned char *)&self->_flags + 8) = v3;
  self->_includeBusinessCategories = a3;
}

- (void)setHasIncludeBusinessCategories:(BOOL)a3
{
  char v3 = *((unsigned char *)&self->_flags + 8);
  uint64_t v4 = 0x20000;
  if (!a3) {
    uint64_t v4 = 0;
  }
  *(void *)&self->_uint64_t flags = *(void *)&self->_flags & 0xFFFFFFFFFFFDFFFFLL | v4;
  *((unsigned char *)&self->_flags + 8) = v3 | 0x80;
}

- (BOOL)hasIncludeBusinessCategories
{
  return (*(void *)&self->_flags >> 17) & 1;
}

- (int)maxBusinessReviews
{
  return self->_maxBusinessReviews;
}

- (void)setMaxBusinessReviews:(int)a3
{
  char v3 = *((unsigned char *)&self->_flags + 8) | 0x80;
  *(void *)&self->_flags |= 0x400uLL;
  *((unsigned char *)&self->_flags + 8) = v3;
  self->_maxBusinessReviews = a3;
}

- (void)setHasMaxBusinessReviews:(BOOL)a3
{
  char v3 = *((unsigned char *)&self->_flags + 8);
  uint64_t v4 = 1024;
  if (!a3) {
    uint64_t v4 = 0;
  }
  *(void *)&self->_uint64_t flags = *(void *)&self->_flags & 0xFFFFFFFFFFFFFBFFLL | v4;
  *((unsigned char *)&self->_flags + 8) = v3 | 0x80;
}

- (BOOL)hasMaxBusinessReviews
{
  return (*(void *)&self->_flags >> 10) & 1;
}

- (void)_readFilterByBusinessCategorys
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 376));
    if ((*(void *)(a1 + 444) & 0x10000000000000) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOPlaceSearchRequestReadSpecified(a1, *(char **)(a1 + 8), (int *)&_readFilterByBusinessCategorys_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 376));
  }
}

- (NSMutableArray)filterByBusinessCategorys
{
  -[GEOPlaceSearchRequest _readFilterByBusinessCategorys]((uint64_t)self);
  filterByBusinessCategorys = self->_filterByBusinessCategorys;

  return filterByBusinessCategorys;
}

- (void)setFilterByBusinessCategorys:(id)a3
{
  uint64_t v4 = (NSMutableArray *)a3;
  os_unfair_lock_lock_with_options();
  *(void *)&self->_flags |= 0x10000000000000uLL;
  os_unfair_lock_unlock(&self->_readerLock);
  *((unsigned char *)&self->_flags + 8) |= 0x80u;
  filterByBusinessCategorys = self->_filterByBusinessCategorys;
  self->_filterByBusinessCategorys = v4;
}

- (void)clearFilterByBusinessCategorys
{
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(void *)&self->_flags |= 0x10000000000000uLL;
  os_unfair_lock_unlock(p_readerLock);
  *((unsigned char *)&self->_flags + 8) |= 0x80u;
  filterByBusinessCategorys = self->_filterByBusinessCategorys;

  [(NSMutableArray *)filterByBusinessCategorys removeAllObjects];
}

- (void)addFilterByBusinessCategory:(id)a3
{
  id v4 = a3;
  -[GEOPlaceSearchRequest _readFilterByBusinessCategorys]((uint64_t)self);
  -[GEOPlaceSearchRequest _addNoFlagsFilterByBusinessCategory:]((uint64_t)self, v4);

  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  self = (GEOPlaceSearchRequest *)((char *)self + 444);
  self->super.super.super.isa = (Class)((unint64_t)self->super.super.super.isa | 0x10000000000000);
  os_unfair_lock_unlock(p_readerLock);
  LOBYTE(self->_reader) |= 0x80u;
}

- (void)_addNoFlagsFilterByBusinessCategory:(uint64_t)a1
{
  id v3 = a2;
  if (a1)
  {
    id v4 = *(void **)(a1 + 176);
    id v7 = v3;
    if (!v4)
    {
      id v5 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
      objc_super v6 = *(void **)(a1 + 176);
      *(void *)(a1 + 176) = v5;

      id v4 = *(void **)(a1 + 176);
    }
    [v4 addObject:v7];
    id v3 = v7;
  }
}

- (unint64_t)filterByBusinessCategorysCount
{
  -[GEOPlaceSearchRequest _readFilterByBusinessCategorys]((uint64_t)self);
  filterByBusinessCategorys = self->_filterByBusinessCategorys;

  return [(NSMutableArray *)filterByBusinessCategorys count];
}

- (id)filterByBusinessCategoryAtIndex:(unint64_t)a3
{
  -[GEOPlaceSearchRequest _readFilterByBusinessCategorys]((uint64_t)self);
  filterByBusinessCategorys = self->_filterByBusinessCategorys;

  return (id)[(NSMutableArray *)filterByBusinessCategorys objectAtIndex:a3];
}

+ (Class)filterByBusinessCategoryType
{
  return (Class)objc_opt_class();
}

- (BOOL)isStrictMapRegion
{
  return self->_isStrictMapRegion;
}

- (void)setIsStrictMapRegion:(BOOL)a3
{
  char v3 = *((unsigned char *)&self->_flags + 8) | 0x80;
  *(void *)&self->_flags |= 0x1000000000uLL;
  *((unsigned char *)&self->_flags + 8) = v3;
  self->_isStrictMapRegion = a3;
}

- (void)setHasIsStrictMapRegion:(BOOL)a3
{
  char v3 = *((unsigned char *)&self->_flags + 8);
  uint64_t v4 = 0x1000000000;
  if (!a3) {
    uint64_t v4 = 0;
  }
  *(void *)&self->_uint64_t flags = *(void *)&self->_flags & 0xFFFFFFEFFFFFFFFFLL | v4;
  *((unsigned char *)&self->_flags + 8) = v3 | 0x80;
}

- (BOOL)hasIsStrictMapRegion
{
  return (*(void *)&self->_flags >> 36) & 1;
}

- (double)timestamp
{
  return self->_timestamp;
}

- (void)setTimestamp:(double)a3
{
  char v3 = *((unsigned char *)&self->_flags + 8) | 0x80;
  *(void *)&self->_flags |= 0x20uLL;
  *((unsigned char *)&self->_flags + 8) = v3;
  self->_timestamp = a3;
}

- (void)setHasTimestamp:(BOOL)a3
{
  char v3 = *((unsigned char *)&self->_flags + 8);
  uint64_t v4 = 32;
  if (!a3) {
    uint64_t v4 = 0;
  }
  *(void *)&self->_uint64_t flags = *(void *)&self->_flags & 0xFFFFFFFFFFFFFFDFLL | v4;
  *((unsigned char *)&self->_flags + 8) = v3 | 0x80;
}

- (BOOL)hasTimestamp
{
  return (*(void *)&self->_flags >> 5) & 1;
}

- (void)_readZilchPoints
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 376));
    if ((*(unsigned char *)(a1 + 452) & 0x40) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOPlaceSearchRequestReadSpecified(a1, *(char **)(a1 + 8), (int *)&_readZilchPoints_tags_3);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 376));
  }
}

- (BOOL)hasZilchPoints
{
  return self->_zilchPoints != 0;
}

- (NSData)zilchPoints
{
  -[GEOPlaceSearchRequest _readZilchPoints]((uint64_t)self);
  zilchPoints = self->_zilchPoints;

  return zilchPoints;
}

- (void)setZilchPoints:(id)a3
{
  *((unsigned char *)&self->_flags + 8) |= 0xC0u;
  objc_storeStrong((id *)&self->_zilchPoints, a3);
}

- (BOOL)includeEntryPoints
{
  return self->_includeEntryPoints;
}

- (void)setIncludeEntryPoints:(BOOL)a3
{
  char v3 = *((unsigned char *)&self->_flags + 8) | 0x80;
  *(void *)&self->_flags |= 0x80000uLL;
  *((unsigned char *)&self->_flags + 8) = v3;
  self->_includeEntryPoints = a3;
}

- (void)setHasIncludeEntryPoints:(BOOL)a3
{
  char v3 = *((unsigned char *)&self->_flags + 8);
  uint64_t v4 = 0x80000;
  if (!a3) {
    uint64_t v4 = 0;
  }
  *(void *)&self->_uint64_t flags = *(void *)&self->_flags & 0xFFFFFFFFFFF7FFFFLL | v4;
  *((unsigned char *)&self->_flags + 8) = v3 | 0x80;
}

- (BOOL)hasIncludeEntryPoints
{
  return (*(void *)&self->_flags >> 19) & 1;
}

- (void)_readBusinessOptions
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 376));
    if ((*(void *)(a1 + 444) & 0x400000000000) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOPlaceSearchRequestReadSpecified(a1, *(char **)(a1 + 8), (int *)&_readBusinessOptions_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 376));
  }
}

- (BOOL)hasBusinessOptions
{
  return self->_businessOptions != 0;
}

- (GEOBusinessOptions)businessOptions
{
  -[GEOPlaceSearchRequest _readBusinessOptions]((uint64_t)self);
  businessOptions = self->_businessOptions;

  return businessOptions;
}

- (void)setBusinessOptions:(id)a3
{
  char v3 = *((unsigned char *)&self->_flags + 8) | 0x80;
  *(void *)&self->_flags |= 0x400000000000uLL;
  *((unsigned char *)&self->_flags + 8) = v3;
  objc_storeStrong((id *)&self->_businessOptions, a3);
}

- (int)localSearchProviderID
{
  return self->_localSearchProviderID;
}

- (void)setLocalSearchProviderID:(int)a3
{
  char v3 = *((unsigned char *)&self->_flags + 8) | 0x80;
  *(void *)&self->_flags |= 0x100uLL;
  *((unsigned char *)&self->_flags + 8) = v3;
  self->_localSearchProviderID = a3;
}

- (void)setHasLocalSearchProviderID:(BOOL)a3
{
  char v3 = *((unsigned char *)&self->_flags + 8);
  uint64_t v4 = 256;
  if (!a3) {
    uint64_t v4 = 0;
  }
  *(void *)&self->_uint64_t flags = *(void *)&self->_flags & 0xFFFFFFFFFFFFFEFFLL | v4;
  *((unsigned char *)&self->_flags + 8) = v3 | 0x80;
}

- (BOOL)hasLocalSearchProviderID
{
  return (*(void *)&self->_flags >> 8) & 1;
}

- (BOOL)includeSuggestionsOnly
{
  return self->_includeSuggestionsOnly;
}

- (void)setIncludeSuggestionsOnly:(BOOL)a3
{
  char v3 = *((unsigned char *)&self->_flags + 8) | 0x80;
  *(void *)&self->_flags |= 0x20000000uLL;
  *((unsigned char *)&self->_flags + 8) = v3;
  self->_includeSuggestionsOnly = a3;
}

- (void)setHasIncludeSuggestionsOnly:(BOOL)a3
{
  char v3 = *((unsigned char *)&self->_flags + 8);
  uint64_t v4 = 0x20000000;
  if (!a3) {
    uint64_t v4 = 0;
  }
  *(void *)&self->_uint64_t flags = *(void *)&self->_flags & 0xFFFFFFFFDFFFFFFFLL | v4;
  *((unsigned char *)&self->_flags + 8) = v3 | 0x80;
}

- (BOOL)hasIncludeSuggestionsOnly
{
  return (*(void *)&self->_flags >> 29) & 1;
}

- (BOOL)structuredSearch
{
  return self->_structuredSearch;
}

- (void)setStructuredSearch:(BOOL)a3
{
  char v3 = *((unsigned char *)&self->_flags + 8) | 0x80;
  *(void *)&self->_flags |= 0x4000000000uLL;
  *((unsigned char *)&self->_flags + 8) = v3;
  self->_structuredSearch = a3;
}

- (void)setHasStructuredSearch:(BOOL)a3
{
  char v3 = *((unsigned char *)&self->_flags + 8);
  uint64_t v4 = 0x4000000000;
  if (!a3) {
    uint64_t v4 = 0;
  }
  *(void *)&self->_uint64_t flags = *(void *)&self->_flags & 0xFFFFFFBFFFFFFFFFLL | v4;
  *((unsigned char *)&self->_flags + 8) = v3 | 0x80;
}

- (BOOL)hasStructuredSearch
{
  return (*(void *)&self->_flags >> 38) & 1;
}

- (void)_readSuggestionsPrefix
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 376));
    if ((*(unsigned char *)(a1 + 452) & 0x10) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOPlaceSearchRequestReadSpecified(a1, *(char **)(a1 + 8), (int *)&_readSuggestionsPrefix_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 376));
  }
}

- (BOOL)hasSuggestionsPrefix
{
  return self->_suggestionsPrefix != 0;
}

- (NSString)suggestionsPrefix
{
  -[GEOPlaceSearchRequest _readSuggestionsPrefix]((uint64_t)self);
  suggestionsPrefix = self->_suggestionsPrefix;

  return suggestionsPrefix;
}

- (void)setSuggestionsPrefix:(id)a3
{
  *((unsigned char *)&self->_flags + 8) |= 0x90u;
  objc_storeStrong((id *)&self->_suggestionsPrefix, a3);
}

- (void)_readDeviceCountryCode
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 376));
    if ((*(void *)(a1 + 444) & 0x1000000000000) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOPlaceSearchRequestReadSpecified(a1, *(char **)(a1 + 8), (int *)&_readDeviceCountryCode_tags_2240);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 376));
  }
}

- (BOOL)hasDeviceCountryCode
{
  return self->_deviceCountryCode != 0;
}

- (NSString)deviceCountryCode
{
  -[GEOPlaceSearchRequest _readDeviceCountryCode]((uint64_t)self);
  deviceCountryCode = self->_deviceCountryCode;

  return deviceCountryCode;
}

- (void)setDeviceCountryCode:(id)a3
{
  char v3 = *((unsigned char *)&self->_flags + 8) | 0x80;
  *(void *)&self->_flags |= 0x1000000000000uLL;
  *((unsigned char *)&self->_flags + 8) = v3;
  objc_storeStrong((id *)&self->_deviceCountryCode, a3);
}

- (void)_readDeviceLocation
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 376));
    if ((*(void *)(a1 + 444) & 0x2000000000000) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOPlaceSearchRequestReadSpecified(a1, *(char **)(a1 + 8), (int *)&_readDeviceLocation_tags_0);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 376));
  }
}

- (BOOL)hasDeviceLocation
{
  return self->_deviceLocation != 0;
}

- (GEOLatLng)deviceLocation
{
  -[GEOPlaceSearchRequest _readDeviceLocation]((uint64_t)self);
  deviceLocation = self->_deviceLocation;

  return deviceLocation;
}

- (void)setDeviceLocation:(id)a3
{
  char v3 = *((unsigned char *)&self->_flags + 8) | 0x80;
  *(void *)&self->_flags |= 0x2000000000000uLL;
  *((unsigned char *)&self->_flags + 8) = v3;
  objc_storeStrong((id *)&self->_deviceLocation, a3);
}

- (void)_readInputLanguage
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 376));
    if ((*(void *)(a1 + 444) & 0x40000000000000) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOPlaceSearchRequestReadSpecified(a1, *(char **)(a1 + 8), (int *)&_readInputLanguage_tags_0);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 376));
  }
}

- (BOOL)hasInputLanguage
{
  return self->_inputLanguage != 0;
}

- (NSString)inputLanguage
{
  -[GEOPlaceSearchRequest _readInputLanguage]((uint64_t)self);
  inputLanguage = self->_inputLanguage;

  return inputLanguage;
}

- (void)setInputLanguage:(id)a3
{
  char v3 = *((unsigned char *)&self->_flags + 8) | 0x80;
  *(void *)&self->_flags |= 0x40000000000000uLL;
  *((unsigned char *)&self->_flags + 8) = v3;
  objc_storeStrong((id *)&self->_inputLanguage, a3);
}

- (void)_readPhoneticLocaleIdentifier
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 376));
    if ((*(void *)(a1 + 444) & 0x800000000000000) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOPlaceSearchRequestReadSpecified(a1, *(char **)(a1 + 8), (int *)&_readPhoneticLocaleIdentifier_tags_2241);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 376));
  }
}

- (BOOL)hasPhoneticLocaleIdentifier
{
  return self->_phoneticLocaleIdentifier != 0;
}

- (NSString)phoneticLocaleIdentifier
{
  -[GEOPlaceSearchRequest _readPhoneticLocaleIdentifier]((uint64_t)self);
  phoneticLocaleIdentifier = self->_phoneticLocaleIdentifier;

  return phoneticLocaleIdentifier;
}

- (void)setPhoneticLocaleIdentifier:(id)a3
{
  char v3 = *((unsigned char *)&self->_flags + 8) | 0x80;
  *(void *)&self->_flags |= 0x800000000000000uLL;
  *((unsigned char *)&self->_flags + 8) = v3;
  objc_storeStrong((id *)&self->_phoneticLocaleIdentifier, a3);
}

- (int)sequenceNumber
{
  return self->_sequenceNumber;
}

- (void)setSequenceNumber:(int)a3
{
  char v3 = *((unsigned char *)&self->_flags + 8) | 0x80;
  *(void *)&self->_flags |= 0x4000uLL;
  *((unsigned char *)&self->_flags + 8) = v3;
  self->_sequenceNumber = a3;
}

- (void)setHasSequenceNumber:(BOOL)a3
{
  char v3 = *((unsigned char *)&self->_flags + 8);
  uint64_t v4 = 0x4000;
  if (!a3) {
    uint64_t v4 = 0;
  }
  *(void *)&self->_uint64_t flags = *(void *)&self->_flags & 0xFFFFFFFFFFFFBFFFLL | v4;
  *((unsigned char *)&self->_flags + 8) = v3 | 0x80;
}

- (BOOL)hasSequenceNumber
{
  return (*(void *)&self->_flags >> 14) & 1;
}

- (BOOL)suppressResultsRequiringAttribution
{
  return self->_suppressResultsRequiringAttribution;
}

- (void)setSuppressResultsRequiringAttribution:(BOOL)a3
{
  char v3 = *((unsigned char *)&self->_flags + 8) | 0x80;
  *(void *)&self->_flags |= 0x8000000000uLL;
  *((unsigned char *)&self->_flags + 8) = v3;
  self->_suppressResultsRequiringAttribution = a3;
}

- (void)setHasSuppressResultsRequiringAttribution:(BOOL)a3
{
  char v3 = *((unsigned char *)&self->_flags + 8);
  uint64_t v4 = 0x8000000000;
  if (!a3) {
    uint64_t v4 = 0;
  }
  *(void *)&self->_uint64_t flags = *(void *)&self->_flags & 0xFFFFFF7FFFFFFFFFLL | v4;
  *((unsigned char *)&self->_flags + 8) = v3 | 0x80;
}

- (BOOL)hasSuppressResultsRequiringAttribution
{
  return (*(void *)&self->_flags >> 39) & 1;
}

- (BOOL)isFromAPI
{
  return self->_isFromAPI;
}

- (void)setIsFromAPI:(BOOL)a3
{
  char v3 = *((unsigned char *)&self->_flags + 8) | 0x80;
  *(void *)&self->_flags |= 0x400000000uLL;
  *((unsigned char *)&self->_flags + 8) = v3;
  self->_isFromAPI = a3;
}

- (void)setHasIsFromAPI:(BOOL)a3
{
  char v3 = *((unsigned char *)&self->_flags + 8);
  uint64_t v4 = 0x400000000;
  if (!a3) {
    uint64_t v4 = 0;
  }
  *(void *)&self->_uint64_t flags = *(void *)&self->_flags & 0xFFFFFFFBFFFFFFFFLL | v4;
  *((unsigned char *)&self->_flags + 8) = v3 | 0x80;
}

- (BOOL)hasIsFromAPI
{
  return (*(void *)&self->_flags >> 34) & 1;
}

- (double)timeSinceMapEnteredForeground
{
  return self->_timeSinceMapEnteredForeground;
}

- (void)setTimeSinceMapEnteredForeground:(double)a3
{
  char v3 = *((unsigned char *)&self->_flags + 8) | 0x80;
  *(void *)&self->_flags |= 8uLL;
  *((unsigned char *)&self->_flags + 8) = v3;
  self->_timeSinceMapEnteredForeground = a3;
}

- (void)setHasTimeSinceMapEnteredForeground:(BOOL)a3
{
  char v3 = *((unsigned char *)&self->_flags + 8);
  uint64_t v4 = 8;
  if (!a3) {
    uint64_t v4 = 0;
  }
  *(void *)&self->_uint64_t flags = *(void *)&self->_flags & 0xFFFFFFFFFFFFFFF7 | v4;
  *((unsigned char *)&self->_flags + 8) = v3 | 0x80;
}

- (BOOL)hasTimeSinceMapEnteredForeground
{
  return (*(void *)&self->_flags >> 3) & 1;
}

- (double)timeSinceMapViewportChanged
{
  return self->_timeSinceMapViewportChanged;
}

- (void)setTimeSinceMapViewportChanged:(double)a3
{
  char v3 = *((unsigned char *)&self->_flags + 8) | 0x80;
  *(void *)&self->_flags |= 0x10uLL;
  *((unsigned char *)&self->_flags + 8) = v3;
  self->_timeSinceMapViewportChanged = a3;
}

- (void)setHasTimeSinceMapViewportChanged:(BOOL)a3
{
  char v3 = *((unsigned char *)&self->_flags + 8);
  uint64_t v4 = 16;
  if (!a3) {
    uint64_t v4 = 0;
  }
  *(void *)&self->_uint64_t flags = *(void *)&self->_flags & 0xFFFFFFFFFFFFFFEFLL | v4;
  *((unsigned char *)&self->_flags + 8) = v3 | 0x80;
}

- (BOOL)hasTimeSinceMapViewportChanged
{
  return (*(void *)&self->_flags >> 4) & 1;
}

- (BOOL)includeSpokenNames
{
  return self->_includeSpokenNames;
}

- (void)setIncludeSpokenNames:(BOOL)a3
{
  char v3 = *((unsigned char *)&self->_flags + 8) | 0x80;
  *(void *)&self->_flags |= 0x8000000uLL;
  *((unsigned char *)&self->_flags + 8) = v3;
  self->_includeSpokenNames = a3;
}

- (void)setHasIncludeSpokenNames:(BOOL)a3
{
  char v3 = *((unsigned char *)&self->_flags + 8);
  uint64_t v4 = 0x8000000;
  if (!a3) {
    uint64_t v4 = 0;
  }
  *(void *)&self->_uint64_t flags = *(void *)&self->_flags & 0xFFFFFFFFF7FFFFFFLL | v4;
  *((unsigned char *)&self->_flags + 8) = v3 | 0x80;
}

- (BOOL)hasIncludeSpokenNames
{
  return (*(void *)&self->_flags >> 27) & 1;
}

- (void)_readDeviceTimeZone
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 376));
    if ((*(void *)(a1 + 444) & 0x4000000000000) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOPlaceSearchRequestReadSpecified(a1, *(char **)(a1 + 8), (int *)&_readDeviceTimeZone_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 376));
  }
}

- (BOOL)hasDeviceTimeZone
{
  return self->_deviceTimeZone != 0;
}

- (NSString)deviceTimeZone
{
  -[GEOPlaceSearchRequest _readDeviceTimeZone]((uint64_t)self);
  deviceTimeZone = self->_deviceTimeZone;

  return deviceTimeZone;
}

- (void)setDeviceTimeZone:(id)a3
{
  char v3 = *((unsigned char *)&self->_flags + 8) | 0x80;
  *(void *)&self->_flags |= 0x4000000000000uLL;
  *((unsigned char *)&self->_flags + 8) = v3;
  objc_storeStrong((id *)&self->_deviceTimeZone, a3);
}

- (void)_readClientCapabilities
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 376));
    if ((*(void *)(a1 + 444) & 0x800000000000) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOPlaceSearchRequestReadSpecified(a1, *(char **)(a1 + 8), (int *)&_readClientCapabilities_tags_2);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 376));
  }
}

- (BOOL)hasClientCapabilities
{
  return self->_clientCapabilities != 0;
}

- (GEOClientCapabilities)clientCapabilities
{
  -[GEOPlaceSearchRequest _readClientCapabilities]((uint64_t)self);
  clientCapabilities = self->_clientCapabilities;

  return clientCapabilities;
}

- (void)setClientCapabilities:(id)a3
{
  char v3 = *((unsigned char *)&self->_flags + 8) | 0x80;
  *(void *)&self->_flags |= 0x800000000000uLL;
  *((unsigned char *)&self->_flags + 8) = v3;
  objc_storeStrong((id *)&self->_clientCapabilities, a3);
}

- (BOOL)includeTravelTime
{
  return self->_includeTravelTime;
}

- (void)setIncludeTravelTime:(BOOL)a3
{
  char v3 = *((unsigned char *)&self->_flags + 8) | 0x80;
  *(void *)&self->_flags |= 0x80000000uLL;
  *((unsigned char *)&self->_flags + 8) = v3;
  self->_includeTravelTime = a3;
}

- (void)setHasIncludeTravelTime:(BOOL)a3
{
  char v3 = *((unsigned char *)&self->_flags + 8);
  uint64_t v4 = 0x80000000;
  if (!a3) {
    uint64_t v4 = 0;
  }
  *(void *)&self->_uint64_t flags = *(void *)&self->_flags & 0xFFFFFFFF7FFFFFFFLL | v4;
  *((unsigned char *)&self->_flags + 8) = v3 | 0x80;
}

- (BOOL)hasIncludeTravelTime
{
  return (*(void *)&self->_flags >> 31) & 1;
}

- (int)transportTypeForTravelTimes
{
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  uint64_t flags = (uint64_t)self->_flags;
  os_unfair_lock_unlock(p_readerLock);
  if ((flags & 0x8000) != 0) {
    return self->_transportTypeForTravelTimes;
  }
  else {
    return 0;
  }
}

- (void)setTransportTypeForTravelTimes:(int)a3
{
  char v3 = *((unsigned char *)&self->_flags + 8) | 0x80;
  *(void *)&self->_flags |= 0x8000uLL;
  *((unsigned char *)&self->_flags + 8) = v3;
  self->_transportTypeForTravelTimes = a3;
}

- (void)setHasTransportTypeForTravelTimes:(BOOL)a3
{
  char v3 = *((unsigned char *)&self->_flags + 8);
  uint64_t v4 = 0x8000;
  if (!a3) {
    uint64_t v4 = 0;
  }
  *(void *)&self->_uint64_t flags = *(void *)&self->_flags & 0xFFFFFFFFFFFF7FFFLL | v4;
  *((unsigned char *)&self->_flags + 8) = v3 | 0x80;
}

- (BOOL)hasTransportTypeForTravelTimes
{
  return (*(void *)&self->_flags >> 15) & 1;
}

- (id)transportTypeForTravelTimesAsString:(int)a3
{
  if (a3 >= 7)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
    char v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    char v3 = off_1E53E7098[a3];
  }

  return v3;
}

- (int)StringAsTransportTypeForTravelTimes:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"AUTOMOBILE"])
  {
    int v4 = 0;
  }
  else if ([v3 isEqualToString:@"TRANSIT"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"WALKING"])
  {
    int v4 = 2;
  }
  else if ([v3 isEqualToString:@"BICYCLE"])
  {
    int v4 = 3;
  }
  else if ([v3 isEqualToString:@"UNKNOWN_TRANSPORT_TYPE"])
  {
    int v4 = 4;
  }
  else if ([v3 isEqualToString:@"FERRY"])
  {
    int v4 = 5;
  }
  else if ([v3 isEqualToString:@"RIDESHARE"])
  {
    int v4 = 6;
  }
  else
  {
    int v4 = 0;
  }

  return v4;
}

- (void)_readSuggestionsOptions
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 376));
    if ((*(unsigned char *)(a1 + 452) & 8) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOPlaceSearchRequestReadSpecified(a1, *(char **)(a1 + 8), (int *)&_readSuggestionsOptions_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 376));
  }
}

- (BOOL)hasSuggestionsOptions
{
  return self->_suggestionsOptions != 0;
}

- (GEOSuggestionsOptions)suggestionsOptions
{
  -[GEOPlaceSearchRequest _readSuggestionsOptions]((uint64_t)self);
  suggestionsOptions = self->_suggestionsOptions;

  return suggestionsOptions;
}

- (void)setSuggestionsOptions:(id)a3
{
  *((unsigned char *)&self->_flags + 8) |= 0x88u;
  objc_storeStrong((id *)&self->_suggestionsOptions, a3);
}

- (int)placeTypeLimit
{
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  uint64_t flags = (uint64_t)self->_flags;
  os_unfair_lock_unlock(p_readerLock);
  if ((flags & 0x1000) != 0) {
    return self->_placeTypeLimit;
  }
  else {
    return 0;
  }
}

- (void)setPlaceTypeLimit:(int)a3
{
  char v3 = *((unsigned char *)&self->_flags + 8) | 0x80;
  *(void *)&self->_flags |= 0x1000uLL;
  *((unsigned char *)&self->_flags + 8) = v3;
  self->_placeTypeLimit = a3;
}

- (void)setHasPlaceTypeLimit:(BOOL)a3
{
  char v3 = *((unsigned char *)&self->_flags + 8);
  uint64_t v4 = 4096;
  if (!a3) {
    uint64_t v4 = 0;
  }
  *(void *)&self->_uint64_t flags = *(void *)&self->_flags & 0xFFFFFFFFFFFFEFFFLL | v4;
  *((unsigned char *)&self->_flags + 8) = v3 | 0x80;
}

- (BOOL)hasPlaceTypeLimit
{
  return (*(void *)&self->_flags >> 12) & 1;
}

- (id)placeTypeLimitAsString:(int)a3
{
  if (a3 > 99)
  {
    switch(a3)
    {
      case 'd':
        uint64_t v4 = @"DMA";
        break;
      case 'e':
        uint64_t v4 = @"CAT_10284_POSTAL";
        break;
      case 'f':
        uint64_t v4 = @"CAT_10285_CITY";
        break;
      case 'g':
        uint64_t v4 = @"CAT_10286_COUNTY";
        break;
      case 'h':
        uint64_t v4 = @"CAT_10287_STATE";
        break;
      case 'i':
        uint64_t v4 = @"CAT_10288_COUNTRY";
        break;
      case 'j':
        uint64_t v4 = @"CAT_10288_COUNTRY_CODE";
        break;
      case 'k':
        uint64_t v4 = @"CAT_10287_STATE_CODE";
        break;
      default:
        if (a3 == 1016)
        {
          uint64_t v4 = @"PERDU_CITY";
        }
        else
        {
LABEL_94:
          objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
          uint64_t v4 = (__CFString *)objc_claimAutoreleasedReturnValue();
LABEL_95:
        }
        break;
    }
  }
  else
  {
    switch(a3)
    {
      case '#':
        uint64_t v4 = @"TIME_ZONE";
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
      case '<':
      case '>':
      case '?':
      case '@':
        goto LABEL_94;
      case '+':
        uint64_t v4 = @"NEIGHBORHOOD";
        break;
      case ',':
        uint64_t v4 = @"OCEAN";
        break;
      case '-':
        uint64_t v4 = @"AOI";
        break;
      case '.':
        uint64_t v4 = @"INLAND_WATER";
        break;
      case '/':
        uint64_t v4 = @"POI";
        break;
      case '0':
        uint64_t v4 = @"ISLAND";
        break;
      case '1':
        uint64_t v4 = @"STREET";
        break;
      case '2':
        uint64_t v4 = @"ADMIN";
        break;
      case '3':
        uint64_t v4 = @"POSTAL";
        break;
      case '6':
        uint64_t v4 = @"INTERSECTION";
        break;
      case '7':
        uint64_t v4 = @"BUILDING";
        break;
      case '9':
        uint64_t v4 = @"ADDRESS";
        break;
      case ';':
        uint64_t v4 = @"ZCTAS";
        break;
      case '=':
        uint64_t v4 = @"CONTINENT";
        break;
      case 'A':
        uint64_t v4 = @"PHYSICAL_FEATURE";
        break;
      default:
        uint64_t v4 = @"PT_UNKNOWN";
        switch(a3)
        {
          case 0:
            goto LABEL_95;
          case 1:
            uint64_t v4 = @"COUNTRY";
            break;
          case 2:
            uint64_t v4 = @"STATE";
            break;
          case 3:
            goto LABEL_94;
          case 4:
            uint64_t v4 = @"COUNTY";
            break;
          default:
            if (a3 != 16) {
              goto LABEL_94;
            }
            uint64_t v4 = @"CITY";
            break;
        }
        break;
    }
  }
  return v4;
}

- (int)StringAsPlaceTypeLimit:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"PT_UNKNOWN"])
  {
    int v4 = 0;
  }
  else if ([v3 isEqualToString:@"COUNTRY"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"STATE"])
  {
    int v4 = 2;
  }
  else if ([v3 isEqualToString:@"COUNTY"])
  {
    int v4 = 4;
  }
  else if ([v3 isEqualToString:@"CITY"])
  {
    int v4 = 16;
  }
  else if ([v3 isEqualToString:@"TIME_ZONE"])
  {
    int v4 = 35;
  }
  else if ([v3 isEqualToString:@"NEIGHBORHOOD"])
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
  else if ([v3 isEqualToString:@"POI"])
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
  else if ([v3 isEqualToString:@"ZCTAS"])
  {
    int v4 = 59;
  }
  else if ([v3 isEqualToString:@"CONTINENT"])
  {
    int v4 = 61;
  }
  else if ([v3 isEqualToString:@"PHYSICAL_FEATURE"])
  {
    int v4 = 65;
  }
  else if ([v3 isEqualToString:@"PERDU_CITY"])
  {
    int v4 = 1016;
  }
  else if ([v3 isEqualToString:@"DMA"])
  {
    int v4 = 100;
  }
  else if ([v3 isEqualToString:@"CAT_10284_POSTAL"])
  {
    int v4 = 101;
  }
  else if ([v3 isEqualToString:@"CAT_10285_CITY"])
  {
    int v4 = 102;
  }
  else if ([v3 isEqualToString:@"CAT_10286_COUNTY"])
  {
    int v4 = 103;
  }
  else if ([v3 isEqualToString:@"CAT_10287_STATE"])
  {
    int v4 = 104;
  }
  else if ([v3 isEqualToString:@"CAT_10288_COUNTRY"])
  {
    int v4 = 105;
  }
  else if ([v3 isEqualToString:@"CAT_10288_COUNTRY_CODE"])
  {
    int v4 = 106;
  }
  else if ([v3 isEqualToString:@"CAT_10287_STATE_CODE"])
  {
    int v4 = 107;
  }
  else
  {
    int v4 = 0;
  }

  return v4;
}

- (BOOL)isStrictGeocoding
{
  return self->_isStrictGeocoding;
}

- (void)setIsStrictGeocoding:(BOOL)a3
{
  char v3 = *((unsigned char *)&self->_flags + 8) | 0x80;
  *(void *)&self->_flags |= 0x800000000uLL;
  *((unsigned char *)&self->_flags + 8) = v3;
  self->_isStrictGeocoding = a3;
}

- (void)setHasIsStrictGeocoding:(BOOL)a3
{
  char v3 = *((unsigned char *)&self->_flags + 8);
  uint64_t v4 = 0x800000000;
  if (!a3) {
    uint64_t v4 = 0;
  }
  *(void *)&self->_uint64_t flags = *(void *)&self->_flags & 0xFFFFFFF7FFFFFFFFLL | v4;
  *((unsigned char *)&self->_flags + 8) = v3 | 0x80;
}

- (BOOL)hasIsStrictGeocoding
{
  return (*(void *)&self->_flags >> 35) & 1;
}

- (BOOL)includeTravelDistance
{
  return self->_includeTravelDistance;
}

- (void)setIncludeTravelDistance:(BOOL)a3
{
  char v3 = *((unsigned char *)&self->_flags + 8) | 0x80;
  *(void *)&self->_flags |= 0x40000000uLL;
  *((unsigned char *)&self->_flags + 8) = v3;
  self->_includeTravelDistance = a3;
}

- (void)setHasIncludeTravelDistance:(BOOL)a3
{
  char v3 = *((unsigned char *)&self->_flags + 8);
  uint64_t v4 = 0x40000000;
  if (!a3) {
    uint64_t v4 = 0;
  }
  *(void *)&self->_uint64_t flags = *(void *)&self->_flags & 0xFFFFFFFFBFFFFFFFLL | v4;
  *((unsigned char *)&self->_flags + 8) = v3 | 0x80;
}

- (BOOL)hasIncludeTravelDistance
{
  return (*(void *)&self->_flags >> 30) & 1;
}

- (BOOL)includeRoadAccessPoints
{
  return self->_includeRoadAccessPoints;
}

- (void)setIncludeRoadAccessPoints:(BOOL)a3
{
  char v3 = *((unsigned char *)&self->_flags + 8) | 0x80;
  *(void *)&self->_flags |= 0x4000000uLL;
  *((unsigned char *)&self->_flags + 8) = v3;
  self->_includeRoadAccessPoints = a3;
}

- (void)setHasIncludeRoadAccessPoints:(BOOL)a3
{
  char v3 = *((unsigned char *)&self->_flags + 8);
  uint64_t v4 = 0x4000000;
  if (!a3) {
    uint64_t v4 = 0;
  }
  *(void *)&self->_uint64_t flags = *(void *)&self->_flags & 0xFFFFFFFFFBFFFFFFLL | v4;
  *((unsigned char *)&self->_flags + 8) = v3 | 0x80;
}

- (BOOL)hasIncludeRoadAccessPoints
{
  return (*(void *)&self->_flags >> 26) & 1;
}

- (void)_readLimitToCountryCodeIso2s
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 376));
    if ((*(void *)(a1 + 444) & 0x100000000000000) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOPlaceSearchRequestReadSpecified(a1, *(char **)(a1 + 8), (int *)&_readLimitToCountryCodeIso2s_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 376));
  }
}

- (NSMutableArray)limitToCountryCodeIso2s
{
  -[GEOPlaceSearchRequest _readLimitToCountryCodeIso2s]((uint64_t)self);
  limitToCountryCodeIso2s = self->_limitToCountryCodeIso2s;

  return limitToCountryCodeIso2s;
}

- (void)setLimitToCountryCodeIso2s:(id)a3
{
  uint64_t v4 = (NSMutableArray *)a3;
  os_unfair_lock_lock_with_options();
  *(void *)&self->_flags |= 0x100000000000000uLL;
  os_unfair_lock_unlock(&self->_readerLock);
  *((unsigned char *)&self->_flags + 8) |= 0x80u;
  limitToCountryCodeIso2s = self->_limitToCountryCodeIso2s;
  self->_limitToCountryCodeIso2s = v4;
}

- (void)clearLimitToCountryCodeIso2s
{
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(void *)&self->_flags |= 0x100000000000000uLL;
  os_unfair_lock_unlock(p_readerLock);
  *((unsigned char *)&self->_flags + 8) |= 0x80u;
  limitToCountryCodeIso2s = self->_limitToCountryCodeIso2s;

  [(NSMutableArray *)limitToCountryCodeIso2s removeAllObjects];
}

- (void)addLimitToCountryCodeIso2:(id)a3
{
  id v4 = a3;
  -[GEOPlaceSearchRequest _readLimitToCountryCodeIso2s]((uint64_t)self);
  -[GEOPlaceSearchRequest _addNoFlagsLimitToCountryCodeIso2:]((uint64_t)self, v4);

  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  self = (GEOPlaceSearchRequest *)((char *)self + 444);
  self->super.super.super.isa = (Class)((unint64_t)self->super.super.super.isa | 0x100000000000000);
  os_unfair_lock_unlock(p_readerLock);
  LOBYTE(self->_reader) |= 0x80u;
}

- (void)_addNoFlagsLimitToCountryCodeIso2:(uint64_t)a1
{
  id v3 = a2;
  if (a1)
  {
    id v4 = *(void **)(a1 + 224);
    id v7 = v3;
    if (!v4)
    {
      id v5 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
      objc_super v6 = *(void **)(a1 + 224);
      *(void *)(a1 + 224) = v5;

      id v4 = *(void **)(a1 + 224);
    }
    [v4 addObject:v7];
    id v3 = v7;
  }
}

- (unint64_t)limitToCountryCodeIso2sCount
{
  -[GEOPlaceSearchRequest _readLimitToCountryCodeIso2s]((uint64_t)self);
  limitToCountryCodeIso2s = self->_limitToCountryCodeIso2s;

  return [(NSMutableArray *)limitToCountryCodeIso2s count];
}

- (id)limitToCountryCodeIso2AtIndex:(unint64_t)a3
{
  -[GEOPlaceSearchRequest _readLimitToCountryCodeIso2s]((uint64_t)self);
  limitToCountryCodeIso2s = self->_limitToCountryCodeIso2s;

  return (id)[(NSMutableArray *)limitToCountryCodeIso2s objectAtIndex:a3];
}

+ (Class)limitToCountryCodeIso2Type
{
  return (Class)objc_opt_class();
}

- (BOOL)isCanonicalLocationSearch
{
  return self->_isCanonicalLocationSearch;
}

- (void)setIsCanonicalLocationSearch:(BOOL)a3
{
  char v3 = *((unsigned char *)&self->_flags + 8) | 0x80;
  *(void *)&self->_flags |= 0x200000000uLL;
  *((unsigned char *)&self->_flags + 8) = v3;
  self->_isCanonicalLocationSearch = a3;
}

- (void)setHasIsCanonicalLocationSearch:(BOOL)a3
{
  char v3 = *((unsigned char *)&self->_flags + 8);
  uint64_t v4 = 0x200000000;
  if (!a3) {
    uint64_t v4 = 0;
  }
  *(void *)&self->_uint64_t flags = *(void *)&self->_flags & 0xFFFFFFFDFFFFFFFFLL | v4;
  *((unsigned char *)&self->_flags + 8) = v3 | 0x80;
}

- (BOOL)hasIsCanonicalLocationSearch
{
  return (*(void *)&self->_flags >> 33) & 1;
}

- (int64_t)geoId
{
  return self->_geoId;
}

- (void)setGeoId:(int64_t)a3
{
  char v3 = *((unsigned char *)&self->_flags + 8) | 0x80;
  *(void *)&self->_flags |= 2uLL;
  *((unsigned char *)&self->_flags + 8) = v3;
  self->_geoId = a3;
}

- (void)setHasGeoId:(BOOL)a3
{
  char v3 = *((unsigned char *)&self->_flags + 8);
  uint64_t v4 = 2;
  if (!a3) {
    uint64_t v4 = 0;
  }
  *(void *)&self->_uint64_t flags = *(void *)&self->_flags & 0xFFFFFFFFFFFFFFFDLL | v4;
  *((unsigned char *)&self->_flags + 8) = v3 | 0x80;
}

- (BOOL)hasGeoId
{
  return (*(void *)&self->_flags >> 1) & 1;
}

- (BOOL)includeQuads
{
  return self->_includeQuads;
}

- (void)setIncludeQuads:(BOOL)a3
{
  char v3 = *((unsigned char *)&self->_flags + 8) | 0x80;
  *(void *)&self->_flags |= 0x2000000uLL;
  *((unsigned char *)&self->_flags + 8) = v3;
  self->_includeQuads = a3;
}

- (void)setHasIncludeQuads:(BOOL)a3
{
  char v3 = *((unsigned char *)&self->_flags + 8);
  uint64_t v4 = 0x2000000;
  if (!a3) {
    uint64_t v4 = 0;
  }
  *(void *)&self->_uint64_t flags = *(void *)&self->_flags & 0xFFFFFFFFFDFFFFFFLL | v4;
  *((unsigned char *)&self->_flags + 8) = v3 | 0x80;
}

- (BOOL)hasIncludeQuads
{
  return (*(void *)&self->_flags >> 25) & 1;
}

- (BOOL)excludeAddressInResults
{
  return self->_excludeAddressInResults;
}

- (void)setExcludeAddressInResults:(BOOL)a3
{
  char v3 = *((unsigned char *)&self->_flags + 8) | 0x80;
  *(void *)&self->_flags |= 0x10000uLL;
  *((unsigned char *)&self->_flags + 8) = v3;
  self->_excludeAddressInResults = a3;
}

- (void)setHasExcludeAddressInResults:(BOOL)a3
{
  char v3 = *((unsigned char *)&self->_flags + 8);
  uint64_t v4 = 0x10000;
  if (!a3) {
    uint64_t v4 = 0;
  }
  *(void *)&self->_uint64_t flags = *(void *)&self->_flags & 0xFFFFFFFFFFFEFFFFLL | v4;
  *((unsigned char *)&self->_flags + 8) = v3 | 0x80;
}

- (BOOL)hasExcludeAddressInResults
{
  return (*(void *)&self->_flags >> 16) & 1;
}

- (void)_readSearchSubstrings
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 376));
    if ((*(unsigned char *)(a1 + 452) & 1) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOPlaceSearchRequestReadSpecified(a1, *(char **)(a1 + 8), (int *)&_readSearchSubstrings_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 376));
  }
}

- (NSMutableArray)searchSubstrings
{
  -[GEOPlaceSearchRequest _readSearchSubstrings]((uint64_t)self);
  searchSubstrings = self->_searchSubstrings;

  return searchSubstrings;
}

- (void)setSearchSubstrings:(id)a3
{
  uint64_t v4 = (NSMutableArray *)a3;
  os_unfair_lock_lock_with_options();
  *((unsigned char *)&self->_flags + 8) |= 1u;
  os_unfair_lock_unlock(&self->_readerLock);
  *((unsigned char *)&self->_flags + 8) |= 0x80u;
  searchSubstrings = self->_searchSubstrings;
  self->_searchSubstrings = v4;
}

- (void)clearSearchSubstrings
{
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *((unsigned char *)&self->_flags + 8) |= 1u;
  os_unfair_lock_unlock(p_readerLock);
  *((unsigned char *)&self->_flags + 8) |= 0x80u;
  searchSubstrings = self->_searchSubstrings;

  [(NSMutableArray *)searchSubstrings removeAllObjects];
}

- (void)addSearchSubstring:(id)a3
{
  id v4 = a3;
  -[GEOPlaceSearchRequest _readSearchSubstrings]((uint64_t)self);
  -[GEOPlaceSearchRequest _addNoFlagsSearchSubstring:]((uint64_t)self, v4);

  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  self = (GEOPlaceSearchRequest *)((char *)self + 444);
  LOBYTE(self->_reader) |= 1u;
  os_unfair_lock_unlock(p_readerLock);
  LOBYTE(self->_reader) |= 0x80u;
}

- (void)_addNoFlagsSearchSubstring:(uint64_t)a1
{
  id v3 = a2;
  if (a1)
  {
    id v4 = *(void **)(a1 + 288);
    id v7 = v3;
    if (!v4)
    {
      id v5 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
      objc_super v6 = *(void **)(a1 + 288);
      *(void *)(a1 + 288) = v5;

      id v4 = *(void **)(a1 + 288);
    }
    [v4 addObject:v7];
    id v3 = v7;
  }
}

- (unint64_t)searchSubstringsCount
{
  -[GEOPlaceSearchRequest _readSearchSubstrings]((uint64_t)self);
  searchSubstrings = self->_searchSubstrings;

  return [(NSMutableArray *)searchSubstrings count];
}

- (id)searchSubstringAtIndex:(unint64_t)a3
{
  -[GEOPlaceSearchRequest _readSearchSubstrings]((uint64_t)self);
  searchSubstrings = self->_searchSubstrings;

  return (id)[(NSMutableArray *)searchSubstrings objectAtIndex:a3];
}

+ (Class)searchSubstringType
{
  return (Class)objc_opt_class();
}

- (BOOL)includeGeoId
{
  return self->_includeGeoId;
}

- (void)setIncludeGeoId:(BOOL)a3
{
  char v3 = *((unsigned char *)&self->_flags + 8) | 0x80;
  *(void *)&self->_flags |= 0x200000uLL;
  *((unsigned char *)&self->_flags + 8) = v3;
  self->_includeGeoId = a3;
}

- (void)setHasIncludeGeoId:(BOOL)a3
{
  char v3 = *((unsigned char *)&self->_flags + 8);
  uint64_t v4 = 0x200000;
  if (!a3) {
    uint64_t v4 = 0;
  }
  *(void *)&self->_uint64_t flags = *(void *)&self->_flags & 0xFFFFFFFFFFDFFFFFLL | v4;
  *((unsigned char *)&self->_flags + 8) = v3 | 0x80;
}

- (BOOL)hasIncludeGeoId
{
  return (*(void *)&self->_flags >> 21) & 1;
}

- (void)_readSearchContext
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 376));
    if ((*(void *)(a1 + 444) & 0x4000000000000000) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOPlaceSearchRequestReadSpecified(a1, *(char **)(a1 + 8), (int *)&_readSearchContext_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 376));
  }
}

- (BOOL)hasSearchContext
{
  return self->_searchContext != 0;
}

- (NSString)searchContext
{
  -[GEOPlaceSearchRequest _readSearchContext]((uint64_t)self);
  searchContext = self->_searchContext;

  return searchContext;
}

- (void)setSearchContext:(id)a3
{
  char v3 = *((unsigned char *)&self->_flags + 8) | 0x80;
  *(void *)&self->_flags |= 0x4000000000000000uLL;
  *((unsigned char *)&self->_flags + 8) = v3;
  objc_storeStrong((id *)&self->_searchContext, a3);
}

- (void)_readSearchContextSubstring
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 376));
    if ((*(void *)(a1 + 444) & 0x2000000000000000) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOPlaceSearchRequestReadSpecified(a1, *(char **)(a1 + 8), (int *)&_readSearchContextSubstring_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 376));
  }
}

- (BOOL)hasSearchContextSubstring
{
  return self->_searchContextSubstring != 0;
}

- (GEOSearchSubstring)searchContextSubstring
{
  -[GEOPlaceSearchRequest _readSearchContextSubstring]((uint64_t)self);
  searchContextSubstring = self->_searchContextSubstring;

  return searchContextSubstring;
}

- (void)setSearchContextSubstring:(id)a3
{
  char v3 = *((unsigned char *)&self->_flags + 8) | 0x80;
  *(void *)&self->_flags |= 0x2000000000000000uLL;
  *((unsigned char *)&self->_flags + 8) = v3;
  objc_storeStrong((id *)&self->_searchContextSubstring, a3);
}

- (BOOL)includeStatusCodeInfo
{
  return self->_includeStatusCodeInfo;
}

- (void)setIncludeStatusCodeInfo:(BOOL)a3
{
  char v3 = *((unsigned char *)&self->_flags + 8) | 0x80;
  *(void *)&self->_flags |= 0x10000000uLL;
  *((unsigned char *)&self->_flags + 8) = v3;
  self->_includeStatusCodeInfo = a3;
}

- (void)setHasIncludeStatusCodeInfo:(BOOL)a3
{
  char v3 = *((unsigned char *)&self->_flags + 8);
  uint64_t v4 = 0x10000000;
  if (!a3) {
    uint64_t v4 = 0;
  }
  *(void *)&self->_uint64_t flags = *(void *)&self->_flags & 0xFFFFFFFFEFFFFFFFLL | v4;
  *((unsigned char *)&self->_flags + 8) = v3 | 0x80;
}

- (BOOL)hasIncludeStatusCodeInfo
{
  return (*(void *)&self->_flags >> 28) & 1;
}

- (void)_readPreserveFields
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 376));
    if ((*(void *)(a1 + 444) & 0x1000000000000000) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOPlaceSearchRequestReadSpecified(a1, *(char **)(a1 + 8), (int *)&_readPreserveFields_tags_0);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 376));
  }
}

- (BOOL)hasPreserveFields
{
  return self->_preserveFields != 0;
}

- (GEOAddress)preserveFields
{
  -[GEOPlaceSearchRequest _readPreserveFields]((uint64_t)self);
  preserveFields = self->_preserveFields;

  return preserveFields;
}

- (void)setPreserveFields:(id)a3
{
  char v3 = *((unsigned char *)&self->_flags + 8) | 0x80;
  *(void *)&self->_flags |= 0x1000000000000000uLL;
  *((unsigned char *)&self->_flags + 8) = v3;
  objc_storeStrong((id *)&self->_preserveFields, a3);
}

- (BOOL)includeUnmatchedStrings
{
  return self->_includeUnmatchedStrings;
}

- (void)setIncludeUnmatchedStrings:(BOOL)a3
{
  char v3 = *((unsigned char *)&self->_flags + 8) | 0x80;
  *(void *)&self->_flags |= 0x100000000uLL;
  *((unsigned char *)&self->_flags + 8) = v3;
  self->_includeUnmatchedStrings = a3;
}

- (void)setHasIncludeUnmatchedStrings:(BOOL)a3
{
  char v3 = *((unsigned char *)&self->_flags + 8);
  uint64_t v4 = 0x100000000;
  if (!a3) {
    uint64_t v4 = 0;
  }
  *(void *)&self->_uint64_t flags = *(void *)&self->_flags & 0xFFFFFFFEFFFFFFFFLL | v4;
  *((unsigned char *)&self->_flags + 8) = v3 | 0x80;
}

- (BOOL)hasIncludeUnmatchedStrings
{
  return HIDWORD(*(void *)&self->_flags) & 1;
}

- (void)_readIndexFilter
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 376));
    if ((*(void *)(a1 + 444) & 0x20000000000000) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOPlaceSearchRequestReadSpecified(a1, *(char **)(a1 + 8), (int *)&_readIndexFilter_tags_0);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 376));
  }
}

- (BOOL)hasIndexFilter
{
  return self->_indexFilter != 0;
}

- (GEOIndexQueryNode)indexFilter
{
  -[GEOPlaceSearchRequest _readIndexFilter]((uint64_t)self);
  indexFilter = self->_indexFilter;

  return indexFilter;
}

- (void)setIndexFilter:(id)a3
{
  char v3 = *((unsigned char *)&self->_flags + 8) | 0x80;
  *(void *)&self->_flags |= 0x20000000000000uLL;
  *((unsigned char *)&self->_flags + 8) = v3;
  objc_storeStrong((id *)&self->_indexFilter, a3);
}

- (BOOL)includeFeatureSets
{
  return self->_includeFeatureSets;
}

- (void)setIncludeFeatureSets:(BOOL)a3
{
  char v3 = *((unsigned char *)&self->_flags + 8) | 0x80;
  *(void *)&self->_flags |= 0x100000uLL;
  *((unsigned char *)&self->_flags + 8) = v3;
  self->_includeFeatureSets = a3;
}

- (void)setHasIncludeFeatureSets:(BOOL)a3
{
  char v3 = *((unsigned char *)&self->_flags + 8);
  uint64_t v4 = 0x100000;
  if (!a3) {
    uint64_t v4 = 0;
  }
  *(void *)&self->_uint64_t flags = *(void *)&self->_flags & 0xFFFFFFFFFFEFFFFFLL | v4;
  *((unsigned char *)&self->_flags + 8) = v3 | 0x80;
}

- (BOOL)hasIncludeFeatureSets
{
  return (*(void *)&self->_flags >> 20) & 1;
}

- (void)_readServiceTags
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 376));
    if ((*(unsigned char *)(a1 + 452) & 4) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOPlaceSearchRequestReadSpecified(a1, *(char **)(a1 + 8), (int *)&_readServiceTags_tags_1);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 376));
  }
}

- (NSMutableArray)serviceTags
{
  -[GEOPlaceSearchRequest _readServiceTags]((uint64_t)self);
  serviceTags = self->_serviceTags;

  return serviceTags;
}

- (void)setServiceTags:(id)a3
{
  uint64_t v4 = (NSMutableArray *)a3;
  os_unfair_lock_lock_with_options();
  *((unsigned char *)&self->_flags + 8) |= 4u;
  os_unfair_lock_unlock(&self->_readerLock);
  *((unsigned char *)&self->_flags + 8) |= 0x80u;
  serviceTags = self->_serviceTags;
  self->_serviceTags = v4;
}

- (void)clearServiceTags
{
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *((unsigned char *)&self->_flags + 8) |= 4u;
  os_unfair_lock_unlock(p_readerLock);
  *((unsigned char *)&self->_flags + 8) |= 0x80u;
  serviceTags = self->_serviceTags;

  [(NSMutableArray *)serviceTags removeAllObjects];
}

- (void)addServiceTag:(id)a3
{
  id v4 = a3;
  -[GEOPlaceSearchRequest _readServiceTags]((uint64_t)self);
  -[GEOPlaceSearchRequest _addNoFlagsServiceTag:]((uint64_t)self, v4);

  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  self = (GEOPlaceSearchRequest *)((char *)self + 444);
  LOBYTE(self->_reader) |= 4u;
  os_unfair_lock_unlock(p_readerLock);
  LOBYTE(self->_reader) |= 0x80u;
}

- (void)_addNoFlagsServiceTag:(uint64_t)a1
{
  id v3 = a2;
  if (a1)
  {
    id v4 = *(void **)(a1 + 304);
    id v7 = v3;
    if (!v4)
    {
      id v5 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
      objc_super v6 = *(void **)(a1 + 304);
      *(void *)(a1 + 304) = v5;

      id v4 = *(void **)(a1 + 304);
    }
    [v4 addObject:v7];
    id v3 = v7;
  }
}

- (unint64_t)serviceTagsCount
{
  -[GEOPlaceSearchRequest _readServiceTags]((uint64_t)self);
  serviceTags = self->_serviceTags;

  return [(NSMutableArray *)serviceTags count];
}

- (id)serviceTagAtIndex:(unint64_t)a3
{
  -[GEOPlaceSearchRequest _readServiceTags]((uint64_t)self);
  serviceTags = self->_serviceTags;

  return (id)[(NSMutableArray *)serviceTags objectAtIndex:a3];
}

+ (Class)serviceTagType
{
  return (Class)objc_opt_class();
}

- (unint64_t)intersectingGeoId
{
  return self->_intersectingGeoId;
}

- (void)setIntersectingGeoId:(unint64_t)a3
{
  char v3 = *((unsigned char *)&self->_flags + 8) | 0x80;
  *(void *)&self->_flags |= 4uLL;
  *((unsigned char *)&self->_flags + 8) = v3;
  self->_intersectingGeoId = a3;
}

- (void)setHasIntersectingGeoId:(BOOL)a3
{
  char v3 = *((unsigned char *)&self->_flags + 8);
  uint64_t v4 = 4;
  if (!a3) {
    uint64_t v4 = 0;
  }
  *(void *)&self->_uint64_t flags = *(void *)&self->_flags & 0xFFFFFFFFFFFFFFFBLL | v4;
  *((unsigned char *)&self->_flags + 8) = v3 | 0x80;
}

- (BOOL)hasIntersectingGeoId
{
  return (*(void *)&self->_flags >> 2) & 1;
}

- (void)_readKnownLocation
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 376));
    if ((*(void *)(a1 + 444) & 0x80000000000000) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOPlaceSearchRequestReadSpecified(a1, *(char **)(a1 + 8), (int *)&_readKnownLocation_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 376));
  }
}

- (BOOL)hasKnownLocation
{
  return self->_knownLocation != 0;
}

- (GEOLatLng)knownLocation
{
  -[GEOPlaceSearchRequest _readKnownLocation]((uint64_t)self);
  knownLocation = self->_knownLocation;

  return knownLocation;
}

- (void)setKnownLocation:(id)a3
{
  char v3 = *((unsigned char *)&self->_flags + 8) | 0x80;
  *(void *)&self->_flags |= 0x80000000000000uLL;
  *((unsigned char *)&self->_flags + 8) = v3;
  objc_storeStrong((id *)&self->_knownLocation, a3);
}

- (int)knownAccuracy
{
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  uint64_t flags = (uint64_t)self->_flags;
  os_unfair_lock_unlock(p_readerLock);
  if ((flags & 0x80) != 0) {
    return self->_knownAccuracy;
  }
  else {
    return 0;
  }
}

- (void)setKnownAccuracy:(int)a3
{
  char v3 = *((unsigned char *)&self->_flags + 8) | 0x80;
  *(void *)&self->_flags |= 0x80uLL;
  *((unsigned char *)&self->_flags + 8) = v3;
  self->_knownAccuracy = a3;
}

- (void)setHasKnownAccuracy:(BOOL)a3
{
  char v3 = *((unsigned char *)&self->_flags + 8);
  uint64_t v4 = 128;
  if (!a3) {
    uint64_t v4 = 0;
  }
  *(void *)&self->_uint64_t flags = *(void *)&self->_flags & 0xFFFFFFFFFFFFFF7FLL | v4;
  *((unsigned char *)&self->_flags + 8) = v3 | 0x80;
}

- (BOOL)hasKnownAccuracy
{
  return (*(void *)&self->_flags >> 7) & 1;
}

- (id)knownAccuracyAsString:(int)a3
{
  if (a3 >= 6)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
    char v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    char v3 = off_1E53E70D0[a3];
  }

  return v3;
}

- (int)StringAsKnownAccuracy:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"POINT"])
  {
    int v4 = 0;
  }
  else if ([v3 isEqualToString:@"INTERPOLATION"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"APPROXIMATE"])
  {
    int v4 = 2;
  }
  else if ([v3 isEqualToString:@"POSTAL"])
  {
    int v4 = 3;
  }
  else if ([v3 isEqualToString:@"PARCEL"])
  {
    int v4 = 4;
  }
  else if ([v3 isEqualToString:@"SUBPREMISE"])
  {
    int v4 = 5;
  }
  else
  {
    int v4 = 0;
  }

  return v4;
}

- (BOOL)includeMatchedToken
{
  return self->_includeMatchedToken;
}

- (void)setIncludeMatchedToken:(BOOL)a3
{
  char v3 = *((unsigned char *)&self->_flags + 8) | 0x80;
  *(void *)&self->_flags |= 0x400000uLL;
  *((unsigned char *)&self->_flags + 8) = v3;
  self->_includeMatchedToken = a3;
}

- (void)setHasIncludeMatchedToken:(BOOL)a3
{
  char v3 = *((unsigned char *)&self->_flags + 8);
  uint64_t v4 = 0x400000;
  if (!a3) {
    uint64_t v4 = 0;
  }
  *(void *)&self->_uint64_t flags = *(void *)&self->_flags & 0xFFFFFFFFFFBFFFFFLL | v4;
  *((unsigned char *)&self->_flags + 8) = v3 | 0x80;
}

- (BOOL)hasIncludeMatchedToken
{
  return (*(void *)&self->_flags >> 22) & 1;
}

- (int)searchSource
{
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  uint64_t flags = (uint64_t)self->_flags;
  os_unfair_lock_unlock(p_readerLock);
  if ((flags & 0x2000) != 0) {
    return self->_searchSource;
  }
  else {
    return 0;
  }
}

- (void)setSearchSource:(int)a3
{
  char v3 = *((unsigned char *)&self->_flags + 8) | 0x80;
  *(void *)&self->_flags |= 0x2000uLL;
  *((unsigned char *)&self->_flags + 8) = v3;
  self->_searchSource = a3;
}

- (void)setHasSearchSource:(BOOL)a3
{
  char v3 = *((unsigned char *)&self->_flags + 8);
  uint64_t v4 = 0x2000;
  if (!a3) {
    uint64_t v4 = 0;
  }
  *(void *)&self->_uint64_t flags = *(void *)&self->_flags & 0xFFFFFFFFFFFFDFFFLL | v4;
  *((unsigned char *)&self->_flags + 8) = v3 | 0x80;
}

- (BOOL)hasSearchSource
{
  return (*(void *)&self->_flags >> 13) & 1;
}

- (id)searchSourceAsString:(int)a3
{
  if (a3 >= 0x18)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
    char v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    char v3 = off_1E53E7100[a3];
  }

  return v3;
}

- (int)StringAsSearchSource:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"UNKNOWN"])
  {
    int v4 = 0;
  }
  else if ([v3 isEqualToString:@"URL"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"USER"])
  {
    int v4 = 2;
  }
  else if ([v3 isEqualToString:@"REFINEMENT"])
  {
    int v4 = 3;
  }
  else if ([v3 isEqualToString:@"SPELLING"])
  {
    int v4 = 4;
  }
  else if ([v3 isEqualToString:@"HINT_CONTACTS"])
  {
    int v4 = 5;
  }
  else if ([v3 isEqualToString:@"STARK_USER"])
  {
    int v4 = 6;
  }
  else if ([v3 isEqualToString:@"HINT_COMPLETION"])
  {
    int v4 = 7;
  }
  else if ([v3 isEqualToString:@"STARK_HINT_COMPLETION"])
  {
    int v4 = 8;
  }
  else if ([v3 isEqualToString:@"HINT_HISTORY"])
  {
    int v4 = 9;
  }
  else if ([v3 isEqualToString:@"STARK_HINT_HISTORY"])
  {
    int v4 = 10;
  }
  else if ([v3 isEqualToString:@"AUTOCOMPLETE_SEARCH"])
  {
    int v4 = 11;
  }
  else if ([v3 isEqualToString:@"STARK_AUTOCOMPLETE_SEARCH"])
  {
    int v4 = 12;
  }
  else if ([v3 isEqualToString:@"AUTOCOMPLETE_NAV_FROM"])
  {
    int v4 = 13;
  }
  else if ([v3 isEqualToString:@"AUTOCOMPLETE_NAV_TO"])
  {
    int v4 = 14;
  }
  else if ([v3 isEqualToString:@"NAV_FROM"])
  {
    int v4 = 15;
  }
  else if ([v3 isEqualToString:@"NAV_TO"])
  {
    int v4 = 16;
  }
  else if ([v3 isEqualToString:@"BOOKMARK_REFRESH"])
  {
    int v4 = 17;
  }
  else if ([v3 isEqualToString:@"ROUTING"])
  {
    int v4 = 18;
  }
  else if ([v3 isEqualToString:@"PRELOADER"])
  {
    int v4 = 19;
  }
  else if ([v3 isEqualToString:@"USER_NO_TYPING"])
  {
    int v4 = 20;
  }
  else if ([v3 isEqualToString:@"ADD_TO_FAVORITES"])
  {
    int v4 = 21;
  }
  else if ([v3 isEqualToString:@"ADD_TO_COLLECTIONS"])
  {
    int v4 = 22;
  }
  else if ([v3 isEqualToString:@"RAP_HINT_COMPLETION"])
  {
    int v4 = 23;
  }
  else
  {
    int v4 = 0;
  }

  return v4;
}

- (void)_readOptionalSuppressionReasons
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 376));
    if ((*(void *)(a1 + 444) & 0x80000000000) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOPlaceSearchRequestReadSpecified(a1, *(char **)(a1 + 8), (int *)&_readOptionalSuppressionReasons_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 376));
  }
}

- (unint64_t)optionalSuppressionReasonsCount
{
  return self->_optionalSuppressionReasons.count;
}

- (int)optionalSuppressionReasons
{
  return self->_optionalSuppressionReasons.list;
}

- (void)clearOptionalSuppressionReasons
{
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(void *)&self->_flags |= 0x80000000000uLL;
  os_unfair_lock_unlock(p_readerLock);
  *((unsigned char *)&self->_flags + 8) |= 0x80u;

  PBRepeatedInt32Clear();
}

- (void)addOptionalSuppressionReason:(int)a3
{
  -[GEOPlaceSearchRequest _readOptionalSuppressionReasons]((uint64_t)self);
  if (self) {
    PBRepeatedInt32Add();
  }
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  p_uint64_t flags = &self->_flags;
  *(void *)p_flags |= 0x80000000000uLL;
  os_unfair_lock_unlock(p_readerLock);
  *((unsigned char *)p_flags + 8) |= 0x80u;
}

- (int)optionalSuppressionReasonAtIndex:(unint64_t)a3
{
  -[GEOPlaceSearchRequest _readOptionalSuppressionReasons]((uint64_t)self);
  p_optionalSuppressionReasons = &self->_optionalSuppressionReasons;
  unint64_t count = self->_optionalSuppressionReasons.count;
  if (count <= a3)
  {
    id v7 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v8 = *MEMORY[0x1E4F1C4A8];
    v9 = objc_msgSend(NSString, "stringWithFormat:", @"idx (%tu) is out of range (%tu)", a3, count);
    uint64_t v10 = [v7 exceptionWithName:v8 reason:v9 userInfo:0];
    [v10 raise];
  }
  return p_optionalSuppressionReasons->list[a3];
}

- (void)setOptionalSuppressionReasons:(int *)a3 count:(unint64_t)a4
{
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(void *)&self->_flags |= 0x80000000000uLL;
  os_unfair_lock_unlock(p_readerLock);
  *((unsigned char *)&self->_flags + 8) |= 0x80u;

  MEMORY[0x1F4147390](&self->_optionalSuppressionReasons, a3, a4);
}

- (id)optionalSuppressionReasonsAsString:(int)a3
{
  if (a3 == 1)
  {
    int v4 = @"OBSCURE";
  }
  else
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
    int v4 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  return v4;
}

- (int)StringAsOptionalSuppressionReasons:(id)a3
{
  return 1;
}

- (void)_readSearchLocation
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 376));
    if ((*(void *)(a1 + 444) & 0x8000000000000000) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOPlaceSearchRequestReadSpecified(a1, *(char **)(a1 + 8), (int *)&_readSearchLocation_tags_0);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 376));
  }
}

- (BOOL)hasSearchLocation
{
  return self->_searchLocation != 0;
}

- (GEOLatLng)searchLocation
{
  -[GEOPlaceSearchRequest _readSearchLocation]((uint64_t)self);
  searchLocation = self->_searchLocation;

  return searchLocation;
}

- (void)setSearchLocation:(id)a3
{
  char v3 = *((unsigned char *)&self->_flags + 8) | 0x80;
  *(void *)&self->_flags |= 0x8000000000000000;
  *((unsigned char *)&self->_flags + 8) = v3;
  objc_storeStrong((id *)&self->_searchLocation, a3);
}

- (BOOL)includeNameForForwardGeocodingResults
{
  return self->_includeNameForForwardGeocodingResults;
}

- (void)setIncludeNameForForwardGeocodingResults:(BOOL)a3
{
  char v3 = *((unsigned char *)&self->_flags + 8) | 0x80;
  *(void *)&self->_flags |= 0x800000uLL;
  *((unsigned char *)&self->_flags + 8) = v3;
  self->_includeNameForForwardGeocodingResults = a3;
}

- (void)setHasIncludeNameForForwardGeocodingResults:(BOOL)a3
{
  char v3 = *((unsigned char *)&self->_flags + 8);
  uint64_t v4 = 0x800000;
  if (!a3) {
    uint64_t v4 = 0;
  }
  *(void *)&self->_uint64_t flags = *(void *)&self->_flags & 0xFFFFFFFFFF7FFFFFLL | v4;
  *((unsigned char *)&self->_flags + 8) = v3 | 0x80;
}

- (BOOL)hasIncludeNameForForwardGeocodingResults
{
  return (*(void *)&self->_flags >> 23) & 1;
}

- (void)_readAdditionalEnabledMarkets
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 376));
    if ((*(void *)(a1 + 444) & 0x100000000000) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOPlaceSearchRequestReadSpecified(a1, *(char **)(a1 + 8), (int *)&_readAdditionalEnabledMarkets_tags_0);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 376));
  }
}

- (BOOL)hasAdditionalEnabledMarkets
{
  return self->_additionalEnabledMarkets != 0;
}

- (GEOAdditionalEnabledMarkets)additionalEnabledMarkets
{
  -[GEOPlaceSearchRequest _readAdditionalEnabledMarkets]((uint64_t)self);
  additionalEnabledMarkets = self->_additionalEnabledMarkets;

  return additionalEnabledMarkets;
}

- (void)setAdditionalEnabledMarkets:(id)a3
{
  char v3 = *((unsigned char *)&self->_flags + 8) | 0x80;
  *(void *)&self->_flags |= 0x100000000000uLL;
  *((unsigned char *)&self->_flags + 8) = v3;
  objc_storeStrong((id *)&self->_additionalEnabledMarkets, a3);
}

- (int)mapMode
{
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  uint64_t flags = (uint64_t)self->_flags;
  os_unfair_lock_unlock(p_readerLock);
  if ((flags & 0x200) != 0) {
    return self->_mapMode;
  }
  else {
    return 0;
  }
}

- (void)setMapMode:(int)a3
{
  char v3 = *((unsigned char *)&self->_flags + 8) | 0x80;
  *(void *)&self->_flags |= 0x200uLL;
  *((unsigned char *)&self->_flags + 8) = v3;
  self->_mapMode = a3;
}

- (void)setHasMapMode:(BOOL)a3
{
  char v3 = *((unsigned char *)&self->_flags + 8);
  uint64_t v4 = 512;
  if (!a3) {
    uint64_t v4 = 0;
  }
  *(void *)&self->_uint64_t flags = *(void *)&self->_flags & 0xFFFFFFFFFFFFFDFFLL | v4;
  *((unsigned char *)&self->_flags + 8) = v3 | 0x80;
}

- (BOOL)hasMapMode
{
  return (*(void *)&self->_flags >> 9) & 1;
}

- (id)mapModeAsString:(int)a3
{
  if (a3 >= 5)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
    char v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    char v3 = off_1E53E71C0[a3];
  }

  return v3;
}

- (int)StringAsMapMode:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"NONE"])
  {
    int v4 = 0;
  }
  else if ([v3 isEqualToString:@"STANDARD"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"SATELLITE"])
  {
    int v4 = 2;
  }
  else if ([v3 isEqualToString:@"HYBRID"])
  {
    int v4 = 3;
  }
  else if ([v3 isEqualToString:@"TRANSIT"])
  {
    int v4 = 4;
  }
  else
  {
    int v4 = 0;
  }

  return v4;
}

- (BOOL)isPopularNearbyRequest
{
  return self->_isPopularNearbyRequest;
}

- (void)setIsPopularNearbyRequest:(BOOL)a3
{
  char v3 = *((unsigned char *)&self->_flags + 8) | 0x80;
  *(void *)&self->_flags |= 0x2000000000uLL;
  *((unsigned char *)&self->_flags + 8) = v3;
  self->_isPopularNearbyRequest = a3;
}

- (void)setHasIsPopularNearbyRequest:(BOOL)a3
{
  char v3 = *((unsigned char *)&self->_flags + 8);
  uint64_t v4 = 0x2000000000;
  if (!a3) {
    uint64_t v4 = 0;
  }
  *(void *)&self->_uint64_t flags = *(void *)&self->_flags & 0xFFFFFFDFFFFFFFFFLL | v4;
  *((unsigned char *)&self->_flags + 8) = v3 | 0x80;
}

- (BOOL)hasIsPopularNearbyRequest
{
  return (*(void *)&self->_flags >> 37) & 1;
}

- (void)_readDeviceLocationCountryCode
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 376));
    if ((*(void *)(a1 + 444) & 0x8000000000000) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOPlaceSearchRequestReadSpecified(a1, *(char **)(a1 + 8), (int *)&_readDeviceLocationCountryCode_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 376));
  }
}

- (BOOL)hasDeviceLocationCountryCode
{
  return self->_deviceLocationCountryCode != 0;
}

- (NSString)deviceLocationCountryCode
{
  -[GEOPlaceSearchRequest _readDeviceLocationCountryCode]((uint64_t)self);
  deviceLocationCountryCode = self->_deviceLocationCountryCode;

  return deviceLocationCountryCode;
}

- (void)setDeviceLocationCountryCode:(id)a3
{
  char v3 = *((unsigned char *)&self->_flags + 8) | 0x80;
  *(void *)&self->_flags |= 0x8000000000000uLL;
  *((unsigned char *)&self->_flags + 8) = v3;
  objc_storeStrong((id *)&self->_deviceLocationCountryCode, a3);
}

- (void)_readViewportCenterCountryCode
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 376));
    if ((*(unsigned char *)(a1 + 452) & 0x20) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOPlaceSearchRequestReadSpecified(a1, *(char **)(a1 + 8), (int *)&_readViewportCenterCountryCode_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 376));
  }
}

- (BOOL)hasViewportCenterCountryCode
{
  return self->_viewportCenterCountryCode != 0;
}

- (NSString)viewportCenterCountryCode
{
  -[GEOPlaceSearchRequest _readViewportCenterCountryCode]((uint64_t)self);
  viewportCenterCountryCode = self->_viewportCenterCountryCode;

  return viewportCenterCountryCode;
}

- (void)setViewportCenterCountryCode:(id)a3
{
  *((unsigned char *)&self->_flags + 8) |= 0xA0u;
  objc_storeStrong((id *)&self->_viewportCenterCountryCode, a3);
}

- (id)description
{
  id v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)GEOPlaceSearchRequest;
  uint64_t v4 = [(GEOPlaceSearchRequest *)&v8 description];
  id v5 = [(GEOPlaceSearchRequest *)self dictionaryRepresentation];
  objc_super v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEOPlaceSearchRequest _dictionaryRepresentation:]((uint64_t)self, 0);
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  uint64_t v164 = *MEMORY[0x1E4F143B8];
  if (!a1)
  {
    id v148 = 0;
    goto LABEL_284;
  }
  [(id)a1 readAll:1];
  uint64_t v4 = [MEMORY[0x1E4F1CA60] dictionary];
  if (*(void *)(a1 + 56))
  {
    id v5 = PBRepeatedUInt64NSArray();
    [v4 setObject:v5 forKey:@"businessID"];
  }
  objc_super v6 = [(id)a1 address];
  id v7 = v6;
  if (v6)
  {
    if (a2) {
      [v6 jsonRepresentation];
    }
    else {
    id v8 = [v6 dictionaryRepresentation];
    }

    [v4 setObject:v8 forKey:@"address"];
  }

  v9 = [(id)a1 location];
  uint64_t v10 = v9;
  if (v9)
  {
    if (a2) {
      [v9 jsonRepresentation];
    }
    else {
    id v11 = [v9 dictionaryRepresentation];
    }

    [v4 setObject:v11 forKey:@"location"];
  }

  v12 = [(id)a1 search];
  if (v12) {
    [v4 setObject:v12 forKey:@"search"];
  }

  v13 = [(id)a1 mapRegion];
  v14 = v13;
  if (v13)
  {
    if (a2) {
      [v13 jsonRepresentation];
    }
    else {
    id v15 = [v13 dictionaryRepresentation];
    }

    [v4 setObject:v15 forKey:@"mapRegion"];
  }

  if (*(void *)(a1 + 32))
  {
    uint64_t v16 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:");
    v17 = (void *)(a1 + 24);
    if (*(void *)(a1 + 32))
    {
      unint64_t v18 = 0;
      do
      {
        uint64_t v19 = *(unsigned int *)(*v17 + 4 * v18);
        if ((int)v19 > 99)
        {
          switch((int)v19)
          {
            case 'd':
              v20 = @"DMA";
              break;
            case 'e':
              v20 = @"CAT_10284_POSTAL";
              break;
            case 'f':
              v20 = @"CAT_10285_CITY";
              break;
            case 'g':
              v20 = @"CAT_10286_COUNTY";
              break;
            case 'h':
              v20 = @"CAT_10287_STATE";
              break;
            case 'i':
              v20 = @"CAT_10288_COUNTRY";
              break;
            case 'j':
              v20 = @"CAT_10288_COUNTRY_CODE";
              break;
            case 'k':
              v20 = @"CAT_10287_STATE_CODE";
              break;
            default:
              if (v19 == 1016)
              {
                v20 = @"PERDU_CITY";
              }
              else
              {
LABEL_35:
                objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", v19);
                v20 = (__CFString *)objc_claimAutoreleasedReturnValue();
              }
              break;
          }
        }
        else
        {
          switch((int)v19)
          {
            case '#':
              v20 = @"TIME_ZONE";
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
            case '<':
            case '>':
            case '?':
            case '@':
              goto LABEL_35;
            case '+':
              v20 = @"NEIGHBORHOOD";
              break;
            case ',':
              v20 = @"OCEAN";
              break;
            case '-':
              v20 = @"AOI";
              break;
            case '.':
              v20 = @"INLAND_WATER";
              break;
            case '/':
              v20 = @"POI";
              break;
            case '0':
              v20 = @"ISLAND";
              break;
            case '1':
              v20 = @"STREET";
              break;
            case '2':
              v20 = @"ADMIN";
              break;
            case '3':
              v20 = @"POSTAL";
              break;
            case '6':
              v20 = @"INTERSECTION";
              break;
            case '7':
              v20 = @"BUILDING";
              break;
            case '9':
              v20 = @"ADDRESS";
              break;
            case ';':
              v20 = @"ZCTAS";
              break;
            case '=':
              v20 = @"CONTINENT";
              break;
            case 'A':
              v20 = @"PHYSICAL_FEATURE";
              break;
            default:
              v20 = @"PT_UNKNOWN";
              switch((int)v19)
              {
                case 0:
                  goto LABEL_60;
                case 1:
                  v20 = @"COUNTRY";
                  break;
                case 2:
                  v20 = @"STATE";
                  break;
                case 3:
                  goto LABEL_35;
                case 4:
                  v20 = @"COUNTY";
                  break;
                default:
                  if (v19 != 16) {
                    goto LABEL_35;
                  }
                  v20 = @"CITY";
                  break;
              }
              break;
          }
        }
LABEL_60:
        [v16 addObject:v20];

        ++v18;
        v17 = (void *)(a1 + 24);
      }
      while (v18 < *(void *)(a1 + 32));
    }
    [v4 setObject:v16 forKey:@"additionalPlaceType"];
  }
  uint64_t v21 = *(void *)(a1 + 444);
  if ((v21 & 0x1000000) != 0)
  {
    v30 = [NSNumber numberWithBool:*(unsigned __int8 *)(a1 + 428)];
    [v4 setObject:v30 forKey:@"includePhonetics"];

    uint64_t v21 = *(void *)(a1 + 444);
    if ((v21 & 0x800) == 0)
    {
LABEL_64:
      if ((v21 & 1) == 0) {
        goto LABEL_65;
      }
      goto LABEL_81;
    }
  }
  else if ((v21 & 0x800) == 0)
  {
    goto LABEL_64;
  }
  v31 = [NSNumber numberWithInt:*(unsigned int *)(a1 + 400)];
  [v4 setObject:v31 forKey:@"maxResults"];

  uint64_t v21 = *(void *)(a1 + 444);
  if ((v21 & 1) == 0)
  {
LABEL_65:
    if ((v21 & 0x40) == 0) {
      goto LABEL_66;
    }
    goto LABEL_82;
  }
LABEL_81:
  _GEOSessionIDDictionaryRepresentation((void *)(a1 + 96));
  id v32 = (id)objc_claimAutoreleasedReturnValue();

  [v4 setObject:v32 forKey:@"sessionGUID"];
  uint64_t v21 = *(void *)(a1 + 444);
  if ((v21 & 0x40) == 0)
  {
LABEL_66:
    if ((v21 & 0x40000) == 0) {
      goto LABEL_67;
    }
    goto LABEL_139;
  }
LABEL_82:
  uint64_t v33 = *(int *)(a1 + 380);
  if (v33 >= 3)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(int *)(a1 + 380));
    v34 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v34 = off_1E53E7080[v33];
  }
  [v4 setObject:v34 forKey:@"businessSortOrder"];

  uint64_t v21 = *(void *)(a1 + 444);
  if ((v21 & 0x40000) == 0)
  {
LABEL_67:
    if ((v21 & 0x20000) == 0) {
      goto LABEL_68;
    }
    goto LABEL_140;
  }
LABEL_139:
  v65 = [NSNumber numberWithBool:*(unsigned __int8 *)(a1 + 422)];
  [v4 setObject:v65 forKey:@"includeBusinessRating"];

  uint64_t v21 = *(void *)(a1 + 444);
  if ((v21 & 0x20000) == 0)
  {
LABEL_68:
    if ((v21 & 0x400) == 0) {
      goto LABEL_70;
    }
    goto LABEL_69;
  }
LABEL_140:
  v66 = [NSNumber numberWithBool:*(unsigned __int8 *)(a1 + 421)];
  [v4 setObject:v66 forKey:@"includeBusinessCategories"];

  if ((*(void *)(a1 + 444) & 0x400) != 0)
  {
LABEL_69:
    v22 = [NSNumber numberWithInt:*(unsigned int *)(a1 + 396)];
    [v4 setObject:v22 forKey:@"maxBusinessReviews"];
  }
LABEL_70:
  if (*(void *)(a1 + 176))
  {
    unsigned int v23 = [(id)a1 filterByBusinessCategorys];
    [v4 setObject:v23 forKey:@"filterByBusinessCategory"];
  }
  uint64_t v24 = *(void *)(a1 + 444);
  if ((v24 & 0x1000000000) != 0)
  {
    v25 = [NSNumber numberWithBool:*(unsigned __int8 *)(a1 + 440)];
    [v4 setObject:v25 forKey:@"isStrictMapRegion"];

    uint64_t v24 = *(void *)(a1 + 444);
  }
  if ((v24 & 0x20) != 0)
  {
    uint64_t v26 = [NSNumber numberWithDouble:*(double *)(a1 + 344)];
    [v4 setObject:v26 forKey:@"timestamp"];
  }
  v27 = [(id)a1 zilchPoints];
  v28 = v27;
  if (v27)
  {
    if (a2)
    {
      objc_super v29 = [v27 base64EncodedStringWithOptions:0];
      [v4 setObject:v29 forKey:@"zilchPoints"];
    }
    else
    {
      [v4 setObject:v27 forKey:@"zilchPoints"];
    }
  }

  if ((*(void *)(a1 + 444) & 0x80000) != 0)
  {
    v35 = [NSNumber numberWithBool:*(unsigned __int8 *)(a1 + 423)];
    [v4 setObject:v35 forKey:@"includeEntryPoints"];
  }
  v36 = [(id)a1 businessOptions];
  v37 = v36;
  if (v36)
  {
    if (a2) {
      [v36 jsonRepresentation];
    }
    else {
    id v38 = [v36 dictionaryRepresentation];
    }

    [v4 setObject:v38 forKey:@"businessOptions"];
  }

  uint64_t v39 = *(void *)(a1 + 444);
  if ((v39 & 0x100) != 0)
  {
    v45 = [NSNumber numberWithInt:*(unsigned int *)(a1 + 388)];
    [v4 setObject:v45 forKey:@"localSearchProviderID"];

    uint64_t v39 = *(void *)(a1 + 444);
    if ((v39 & 0x20000000) == 0)
    {
LABEL_94:
      if ((v39 & 0x4000000000) == 0) {
        goto LABEL_96;
      }
      goto LABEL_95;
    }
  }
  else if ((v39 & 0x20000000) == 0)
  {
    goto LABEL_94;
  }
  v46 = [NSNumber numberWithBool:*(unsigned __int8 *)(a1 + 433)];
  [v4 setObject:v46 forKey:@"includeSuggestionsOnly"];

  if ((*(void *)(a1 + 444) & 0x4000000000) != 0)
  {
LABEL_95:
    v40 = [NSNumber numberWithBool:*(unsigned __int8 *)(a1 + 442)];
    [v4 setObject:v40 forKey:@"structuredSearch"];
  }
LABEL_96:
  v41 = [(id)a1 suggestionsPrefix];
  if (v41) {
    [v4 setObject:v41 forKey:@"suggestionsPrefix"];
  }

  v42 = [(id)a1 deviceCountryCode];
  if (v42) {
    [v4 setObject:v42 forKey:@"deviceCountryCode"];
  }

  v43 = [(id)a1 deviceLocation];
  v44 = v43;
  if (v43)
  {
    if (a2) {
      [v43 jsonRepresentation];
    }
    else {
    id v47 = [v43 dictionaryRepresentation];
    }

    [v4 setObject:v47 forKey:@"deviceLocation"];
  }

  v48 = [(id)a1 inputLanguage];
  if (v48) {
    [v4 setObject:v48 forKey:@"inputLanguage"];
  }

  v49 = [(id)a1 phoneticLocaleIdentifier];
  if (v49) {
    [v4 setObject:v49 forKey:@"phoneticLocaleIdentifier"];
  }

  uint64_t v50 = *(void *)(a1 + 444);
  if ((v50 & 0x4000) != 0)
  {
    v55 = [NSNumber numberWithInt:*(unsigned int *)(a1 + 412)];
    [v4 setObject:v55 forKey:@"sequenceNumber"];

    uint64_t v50 = *(void *)(a1 + 444);
    if ((v50 & 0x8000000000) == 0)
    {
LABEL_114:
      if ((v50 & 0x400000000) == 0) {
        goto LABEL_115;
      }
      goto LABEL_126;
    }
  }
  else if ((v50 & 0x8000000000) == 0)
  {
    goto LABEL_114;
  }
  v56 = [NSNumber numberWithBool:*(unsigned __int8 *)(a1 + 443)];
  [v4 setObject:v56 forKey:@"suppressResultsRequiringAttribution"];

  uint64_t v50 = *(void *)(a1 + 444);
  if ((v50 & 0x400000000) == 0)
  {
LABEL_115:
    if ((v50 & 8) == 0) {
      goto LABEL_116;
    }
    goto LABEL_127;
  }
LABEL_126:
  v57 = [NSNumber numberWithBool:*(unsigned __int8 *)(a1 + 438)];
  [v4 setObject:v57 forKey:@"isFromAPI"];

  uint64_t v50 = *(void *)(a1 + 444);
  if ((v50 & 8) == 0)
  {
LABEL_116:
    if ((v50 & 0x10) == 0) {
      goto LABEL_117;
    }
    goto LABEL_128;
  }
LABEL_127:
  v58 = [NSNumber numberWithDouble:*(double *)(a1 + 328)];
  [v4 setObject:v58 forKey:@"timeSinceMapEnteredForeground"];

  uint64_t v50 = *(void *)(a1 + 444);
  if ((v50 & 0x10) == 0)
  {
LABEL_117:
    if ((v50 & 0x8000000) == 0) {
      goto LABEL_119;
    }
    goto LABEL_118;
  }
LABEL_128:
  v59 = [NSNumber numberWithDouble:*(double *)(a1 + 336)];
  [v4 setObject:v59 forKey:@"timeSinceMapViewportChanged"];

  if ((*(void *)(a1 + 444) & 0x8000000) != 0)
  {
LABEL_118:
    v51 = [NSNumber numberWithBool:*(unsigned __int8 *)(a1 + 431)];
    [v4 setObject:v51 forKey:@"includeSpokenNames"];
  }
LABEL_119:
  v52 = [(id)a1 deviceTimeZone];
  if (v52) {
    [v4 setObject:v52 forKey:@"deviceTimeZone"];
  }

  v53 = [(id)a1 clientCapabilities];
  v54 = v53;
  if (v53)
  {
    if (a2) {
      [v53 jsonRepresentation];
    }
    else {
    id v60 = [v53 dictionaryRepresentation];
    }

    [v4 setObject:v60 forKey:@"clientCapabilities"];
  }

  uint64_t v61 = *(void *)(a1 + 444);
  if ((v61 & 0x80000000) != 0)
  {
    v62 = [NSNumber numberWithBool:*(unsigned __int8 *)(a1 + 435)];
    [v4 setObject:v62 forKey:@"includeTravelTime"];

    uint64_t v61 = *(void *)(a1 + 444);
  }
  if ((v61 & 0x8000) != 0)
  {
    uint64_t v63 = *(int *)(a1 + 416);
    if (v63 >= 7)
    {
      objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(int *)(a1 + 416));
      v64 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v64 = off_1E53E7098[v63];
    }
    [v4 setObject:v64 forKey:@"transportTypeForTravelTimes"];
  }
  v67 = [(id)a1 suggestionsOptions];
  v68 = v67;
  if (v67)
  {
    if (a2) {
      [v67 jsonRepresentation];
    }
    else {
    id v69 = [v67 dictionaryRepresentation];
    }

    [v4 setObject:v69 forKey:@"suggestionsOptions"];
  }

  uint64_t v70 = *(void *)(a1 + 444);
  if ((v70 & 0x1000) != 0)
  {
    int v87 = *(_DWORD *)(a1 + 404);
    if (v87 > 99)
    {
      switch(v87)
      {
        case 'd':
          v88 = @"DMA";
          break;
        case 'e':
          v88 = @"CAT_10284_POSTAL";
          break;
        case 'f':
          v88 = @"CAT_10285_CITY";
          break;
        case 'g':
          v88 = @"CAT_10286_COUNTY";
          break;
        case 'h':
          v88 = @"CAT_10287_STATE";
          break;
        case 'i':
          v88 = @"CAT_10288_COUNTRY";
          break;
        case 'j':
          v88 = @"CAT_10288_COUNTRY_CODE";
          break;
        case 'k':
          v88 = @"CAT_10287_STATE_CODE";
          break;
        default:
          if (v87 == 1016)
          {
            v88 = @"PERDU_CITY";
          }
          else
          {
LABEL_295:
            objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(unsigned int *)(a1 + 404));
            v88 = (__CFString *)objc_claimAutoreleasedReturnValue();
          }
          break;
      }
    }
    else
    {
      switch(v87)
      {
        case '#':
          v88 = @"TIME_ZONE";
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
        case '<':
        case '>':
        case '?':
        case '@':
          goto LABEL_295;
        case '+':
          v88 = @"NEIGHBORHOOD";
          break;
        case ',':
          v88 = @"OCEAN";
          break;
        case '-':
          v88 = @"AOI";
          break;
        case '.':
          v88 = @"INLAND_WATER";
          break;
        case '/':
          v88 = @"POI";
          break;
        case '0':
          v88 = @"ISLAND";
          break;
        case '1':
          v88 = @"STREET";
          break;
        case '2':
          v88 = @"ADMIN";
          break;
        case '3':
          v88 = @"POSTAL";
          break;
        case '6':
          v88 = @"INTERSECTION";
          break;
        case '7':
          v88 = @"BUILDING";
          break;
        case '9':
          v88 = @"ADDRESS";
          break;
        case ';':
          v88 = @"ZCTAS";
          break;
        case '=':
          v88 = @"CONTINENT";
          break;
        case 'A':
          v88 = @"PHYSICAL_FEATURE";
          break;
        default:
          v88 = @"PT_UNKNOWN";
          switch(v87)
          {
            case 0:
              goto LABEL_320;
            case 1:
              v88 = @"COUNTRY";
              break;
            case 2:
              v88 = @"STATE";
              break;
            case 3:
              goto LABEL_295;
            case 4:
              v88 = @"COUNTY";
              break;
            default:
              if (v87 != 16) {
                goto LABEL_295;
              }
              v88 = @"CITY";
              break;
          }
          break;
      }
    }
LABEL_320:
    [v4 setObject:v88 forKey:@"placeTypeLimit"];

    uint64_t v70 = *(void *)(a1 + 444);
    if ((v70 & 0x800000000) == 0)
    {
LABEL_151:
      if ((v70 & 0x40000000) == 0) {
        goto LABEL_152;
      }
      goto LABEL_322;
    }
  }
  else if ((v70 & 0x800000000) == 0)
  {
    goto LABEL_151;
  }
  v150 = [NSNumber numberWithBool:*(unsigned __int8 *)(a1 + 439)];
  [v4 setObject:v150 forKey:@"isStrictGeocoding"];

  uint64_t v70 = *(void *)(a1 + 444);
  if ((v70 & 0x40000000) == 0)
  {
LABEL_152:
    if ((v70 & 0x4000000) == 0) {
      goto LABEL_154;
    }
    goto LABEL_153;
  }
LABEL_322:
  v151 = [NSNumber numberWithBool:*(unsigned __int8 *)(a1 + 434)];
  [v4 setObject:v151 forKey:@"includeTravelDistance"];

  if ((*(void *)(a1 + 444) & 0x4000000) != 0)
  {
LABEL_153:
    v71 = [NSNumber numberWithBool:*(unsigned __int8 *)(a1 + 430)];
    [v4 setObject:v71 forKey:@"includeRoadAccessPoints"];
  }
LABEL_154:
  if (*(void *)(a1 + 224))
  {
    v72 = [(id)a1 limitToCountryCodeIso2s];
    [v4 setObject:v72 forKey:@"limitToCountryCodeIso2"];
  }
  uint64_t v73 = *(void *)(a1 + 444);
  if ((v73 & 0x200000000) != 0)
  {
    v89 = [NSNumber numberWithBool:*(unsigned __int8 *)(a1 + 437)];
    [v4 setObject:v89 forKey:@"isCanonicalLocationSearch"];

    uint64_t v73 = *(void *)(a1 + 444);
    if ((v73 & 2) == 0)
    {
LABEL_158:
      if ((v73 & 0x2000000) == 0) {
        goto LABEL_159;
      }
      goto LABEL_185;
    }
  }
  else if ((v73 & 2) == 0)
  {
    goto LABEL_158;
  }
  v90 = [NSNumber numberWithLongLong:*(void *)(a1 + 184)];
  [v4 setObject:v90 forKey:@"geoId"];

  uint64_t v73 = *(void *)(a1 + 444);
  if ((v73 & 0x2000000) == 0)
  {
LABEL_159:
    if ((v73 & 0x10000) == 0) {
      goto LABEL_161;
    }
    goto LABEL_160;
  }
LABEL_185:
  v91 = [NSNumber numberWithBool:*(unsigned __int8 *)(a1 + 429)];
  [v4 setObject:v91 forKey:@"includeQuads"];

  if ((*(void *)(a1 + 444) & 0x10000) != 0)
  {
LABEL_160:
    v74 = [NSNumber numberWithBool:*(unsigned __int8 *)(a1 + 420)];
    [v4 setObject:v74 forKey:@"excludeAddressInResults"];
  }
LABEL_161:
  if ([*(id *)(a1 + 288) count])
  {
    v75 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(*(id *)(a1 + 288), "count"));
    long long v158 = 0u;
    long long v159 = 0u;
    long long v160 = 0u;
    long long v161 = 0u;
    id v76 = *(id *)(a1 + 288);
    uint64_t v77 = [v76 countByEnumeratingWithState:&v158 objects:v163 count:16];
    if (v77)
    {
      uint64_t v78 = v77;
      uint64_t v79 = *(void *)v159;
      do
      {
        for (uint64_t i = 0; i != v78; ++i)
        {
          if (*(void *)v159 != v79) {
            objc_enumerationMutation(v76);
          }
          v81 = *(void **)(*((void *)&v158 + 1) + 8 * i);
          if (a2) {
            [v81 jsonRepresentation];
          }
          else {
          id v82 = [v81 dictionaryRepresentation];
          }

          [v75 addObject:v82];
        }
        uint64_t v78 = [v76 countByEnumeratingWithState:&v158 objects:v163 count:16];
      }
      while (v78);
    }

    [v4 setObject:v75 forKey:@"searchSubstring"];
  }
  if ((*(void *)(a1 + 444) & 0x200000) != 0)
  {
    v83 = [NSNumber numberWithBool:*(unsigned __int8 *)(a1 + 425)];
    [v4 setObject:v83 forKey:@"includeGeoId"];
  }
  v84 = [(id)a1 searchContext];
  if (v84) {
    [v4 setObject:v84 forKey:@"searchContext"];
  }

  v85 = [(id)a1 searchContextSubstring];
  v86 = v85;
  if (v85)
  {
    if (a2) {
      [v85 jsonRepresentation];
    }
    else {
    id v92 = [v85 dictionaryRepresentation];
    }

    [v4 setObject:v92 forKey:@"searchContextSubstring"];
  }

  if ((*(void *)(a1 + 444) & 0x10000000) != 0)
  {
    v93 = [NSNumber numberWithBool:*(unsigned __int8 *)(a1 + 432)];
    [v4 setObject:v93 forKey:@"includeStatusCodeInfo"];
  }
  v94 = [(id)a1 preserveFields];
  v95 = v94;
  if (v94)
  {
    if (a2) {
      [v94 jsonRepresentation];
    }
    else {
    id v96 = [v94 dictionaryRepresentation];
    }

    [v4 setObject:v96 forKey:@"preserveFields"];
  }

  if ((*(void *)(a1 + 444) & 0x100000000) != 0)
  {
    v97 = [NSNumber numberWithBool:*(unsigned __int8 *)(a1 + 436)];
    [v4 setObject:v97 forKey:@"includeUnmatchedStrings"];
  }
  v98 = [(id)a1 indexFilter];
  v99 = v98;
  if (v98)
  {
    if (a2) {
      [v98 jsonRepresentation];
    }
    else {
    id v100 = [v98 dictionaryRepresentation];
    }

    [v4 setObject:v100 forKey:@"indexFilter"];
  }

  if ((*(void *)(a1 + 444) & 0x100000) != 0)
  {
    v101 = [NSNumber numberWithBool:*(unsigned __int8 *)(a1 + 424)];
    [v4 setObject:v101 forKey:@"includeFeatureSets"];
  }
  if ([*(id *)(a1 + 304) count])
  {
    v102 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(*(id *)(a1 + 304), "count"));
    long long v154 = 0u;
    long long v155 = 0u;
    long long v156 = 0u;
    long long v157 = 0u;
    id v103 = *(id *)(a1 + 304);
    uint64_t v104 = [v103 countByEnumeratingWithState:&v154 objects:v162 count:16];
    if (v104)
    {
      uint64_t v105 = v104;
      uint64_t v106 = *(void *)v155;
      do
      {
        for (uint64_t j = 0; j != v105; ++j)
        {
          if (*(void *)v155 != v106) {
            objc_enumerationMutation(v103);
          }
          v108 = *(void **)(*((void *)&v154 + 1) + 8 * j);
          if (a2) {
            [v108 jsonRepresentation];
          }
          else {
          id v109 = [v108 dictionaryRepresentation];
          }

          [v102 addObject:v109];
        }
        uint64_t v105 = [v103 countByEnumeratingWithState:&v154 objects:v162 count:16];
      }
      while (v105);
    }

    [v4 setObject:v102 forKey:@"serviceTag"];
  }
  if ((*(void *)(a1 + 444) & 4) != 0)
  {
    v110 = [NSNumber numberWithUnsignedLongLong:*(void *)(a1 + 208)];
    [v4 setObject:v110 forKey:@"intersectingGeoId"];
  }
  v111 = [(id)a1 knownLocation];
  v112 = v111;
  if (v111)
  {
    if (a2) {
      [v111 jsonRepresentation];
    }
    else {
    id v113 = [v111 dictionaryRepresentation];
    }

    [v4 setObject:v113 forKey:@"knownLocation"];
  }

  uint64_t v114 = *(void *)(a1 + 444);
  if ((v114 & 0x80) != 0)
  {
    uint64_t v115 = *(int *)(a1 + 384);
    if (v115 >= 6)
    {
      objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(int *)(a1 + 384));
      v116 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v116 = off_1E53E70D0[v115];
    }
    [v4 setObject:v116 forKey:@"knownAccuracy"];

    uint64_t v114 = *(void *)(a1 + 444);
    if ((v114 & 0x400000) == 0)
    {
LABEL_226:
      if ((v114 & 0x2000) == 0) {
        goto LABEL_237;
      }
LABEL_233:
      uint64_t v118 = *(int *)(a1 + 408);
      if (v118 >= 0x18)
      {
        objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(int *)(a1 + 408));
        v119 = (__CFString *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v119 = off_1E53E7100[v118];
      }
      [v4 setObject:v119 forKey:@"searchSource"];

      goto LABEL_237;
    }
  }
  else if ((v114 & 0x400000) == 0)
  {
    goto LABEL_226;
  }
  v117 = [NSNumber numberWithBool:*(unsigned __int8 *)(a1 + 426)];
  [v4 setObject:v117 forKey:@"includeMatchedToken"];

  if ((*(void *)(a1 + 444) & 0x2000) != 0) {
    goto LABEL_233;
  }
LABEL_237:
  if (*(void *)(a1 + 80))
  {
    v120 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:");
    v121 = (void *)(a1 + 72);
    if (*(void *)(a1 + 80))
    {
      unint64_t v122 = 0;
      do
      {
        uint64_t v123 = *(unsigned int *)(*v121 + 4 * v122);
        v124 = @"OBSCURE";
        if (v123 != 1)
        {
          objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", v123);
          v124 = (__CFString *)objc_claimAutoreleasedReturnValue();
        }
        [v120 addObject:v124];

        ++v122;
        v121 = (void *)(a1 + 72);
      }
      while (v122 < *(void *)(a1 + 80));
    }
    [v4 setObject:v120 forKey:@"optionalSuppressionReason"];
  }
  v125 = [(id)a1 searchLocation];
  v126 = v125;
  if (v125)
  {
    if (a2) {
      [v125 jsonRepresentation];
    }
    else {
    id v127 = [v125 dictionaryRepresentation];
    }

    [v4 setObject:v127 forKey:@"searchLocation"];
  }

  if ((*(void *)(a1 + 444) & 0x800000) != 0)
  {
    v128 = [NSNumber numberWithBool:*(unsigned __int8 *)(a1 + 427)];
    [v4 setObject:v128 forKey:@"includeNameForForwardGeocodingResults"];
  }
  v129 = [(id)a1 additionalEnabledMarkets];
  v130 = v129;
  if (v129)
  {
    if (a2) {
      [v129 jsonRepresentation];
    }
    else {
    id v131 = [v129 dictionaryRepresentation];
    }

    [v4 setObject:v131 forKey:@"additionalEnabledMarkets"];
  }

  uint64_t v132 = *(void *)(a1 + 444);
  if ((v132 & 0x200) != 0)
  {
    uint64_t v133 = *(int *)(a1 + 392);
    if (v133 >= 5)
    {
      objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(int *)(a1 + 392));
      v134 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v134 = off_1E53E71C0[v133];
    }
    if (a2) {
      v135 = @"mapMode";
    }
    else {
      v135 = @"map_mode";
    }
    [v4 setObject:v134 forKey:v135];

    uint64_t v132 = *(void *)(a1 + 444);
  }
  if ((v132 & 0x2000000000) != 0)
  {
    v136 = [NSNumber numberWithBool:*(unsigned __int8 *)(a1 + 441)];
    if (a2) {
      v137 = @"isPopularNearbyRequest";
    }
    else {
      v137 = @"is_popular_nearby_request";
    }
    [v4 setObject:v136 forKey:v137];
  }
  v138 = [(id)a1 deviceLocationCountryCode];
  if (v138)
  {
    if (a2) {
      v139 = @"deviceLocationCountryCode";
    }
    else {
      v139 = @"device_location_country_code";
    }
    [v4 setObject:v138 forKey:v139];
  }

  v140 = [(id)a1 viewportCenterCountryCode];
  if (v140)
  {
    if (a2) {
      v141 = @"viewportCenterCountryCode";
    }
    else {
      v141 = @"viewport_center_country_code";
    }
    [v4 setObject:v140 forKey:v141];
  }

  v142 = *(void **)(a1 + 16);
  if (v142)
  {
    v143 = [v142 dictionaryRepresentation];
    v144 = v143;
    if (a2)
    {
      v145 = objc_msgSend(MEMORY[0x1E4F1CA60], "dictionaryWithCapacity:", objc_msgSend(v143, "count"));
      v152[0] = MEMORY[0x1E4F143A8];
      v152[1] = 3221225472;
      v152[2] = __51__GEOPlaceSearchRequest__dictionaryRepresentation___block_invoke;
      v152[3] = &unk_1E53D8860;
      id v146 = v145;
      id v153 = v146;
      [v144 enumerateKeysAndObjectsUsingBlock:v152];
      id v147 = v146;

      v144 = v147;
    }
    [v4 setObject:v144 forKey:@"Unknown Fields"];
  }
  id v148 = v4;

LABEL_284:

  return v148;
}

- (id)jsonRepresentation
{
  return -[GEOPlaceSearchRequest _dictionaryRepresentation:]((uint64_t)self, 1);
}

void __51__GEOPlaceSearchRequest__dictionaryRepresentation___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v10 = a2;
  id v5 = a3;
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();
  id v7 = *(void **)(a1 + 32);
  if (isKindOfClass)
  {
    id v8 = [v5 base64EncodedStringWithOptions:0];
    v9 = [v10 description];
    [v7 setObject:v8 forKey:v9];
  }
  else
  {
    id v8 = [v10 description];
    [v7 setObject:v5 forKey:v8];
  }
}

- (GEOPlaceSearchRequest)initWithDictionary:(id)a3
{
  return (GEOPlaceSearchRequest *)-[GEOPlaceSearchRequest _initWithDictionary:isJSON:](self, a3, 0);
}

- (id)_initWithDictionary:(int)a3 isJSON:
{
  uint64_t v250 = *MEMORY[0x1E4F143B8];
  id v4 = a2;
  if (!a1) {
    goto LABEL_548;
  }
  id v5 = (id)[a1 init];

  if (!v5)
  {
    a1 = 0;
    goto LABEL_548;
  }
  objc_super v6 = [v4 objectForKeyedSubscript:@"businessID"];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    long long v241 = 0u;
    long long v242 = 0u;
    long long v239 = 0u;
    long long v240 = 0u;
    id v7 = v6;
    uint64_t v8 = [v7 countByEnumeratingWithState:&v239 objects:v249 count:16];
    if (v8)
    {
      uint64_t v9 = v8;
      uint64_t v10 = *(void *)v240;
      do
      {
        for (uint64_t i = 0; i != v9; ++i)
        {
          if (*(void *)v240 != v10) {
            objc_enumerationMutation(v7);
          }
          v12 = *(void **)(*((void *)&v239 + 1) + 8 * i);
          objc_opt_class();
          if (objc_opt_isKindOfClass()) {
            objc_msgSend(v5, "addBusinessID:", objc_msgSend(v12, "unsignedLongLongValue"));
          }
        }
        uint64_t v9 = [v7 countByEnumeratingWithState:&v239 objects:v249 count:16];
      }
      while (v9);
    }
  }
  v13 = [v4 objectForKeyedSubscript:@"address"];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v14 = [GEOAddress alloc];
    if (a3) {
      uint64_t v15 = [(GEOAddress *)v14 initWithJSON:v13];
    }
    else {
      uint64_t v15 = [(GEOAddress *)v14 initWithDictionary:v13];
    }
    uint64_t v16 = (void *)v15;
    [v5 setAddress:v15];
  }
  v17 = [v4 objectForKeyedSubscript:@"location"];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    unint64_t v18 = [GEOLocation alloc];
    if (a3) {
      uint64_t v19 = [(GEOLocation *)v18 initWithJSON:v17];
    }
    else {
      uint64_t v19 = [(GEOLocation *)v18 initWithDictionary:v17];
    }
    v20 = (void *)v19;
    [v5 setLocation:v19];
  }
  uint64_t v21 = [v4 objectForKeyedSubscript:@"search"];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v22 = (void *)[v21 copy];
    [v5 setSearch:v22];
  }
  unsigned int v23 = [v4 objectForKeyedSubscript:@"mapRegion"];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v24 = [GEOMapRegion alloc];
    if (a3) {
      uint64_t v25 = [(GEOMapRegion *)v24 initWithJSON:v23];
    }
    else {
      uint64_t v25 = [(GEOMapRegion *)v24 initWithDictionary:v23];
    }
    uint64_t v26 = (void *)v25;
    [v5 setMapRegion:v25];
  }
  v27 = [v4 objectForKeyedSubscript:@"additionalPlaceType"];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v210 = v27;
    id v211 = v4;
    long long v237 = 0u;
    long long v238 = 0u;
    long long v235 = 0u;
    long long v236 = 0u;
    id v28 = v27;
    uint64_t v29 = [v28 countByEnumeratingWithState:&v235 objects:v248 count:16];
    if (!v29) {
      goto LABEL_106;
    }
    uint64_t v30 = v29;
    uint64_t v31 = *(void *)v236;
    while (1)
    {
      for (uint64_t j = 0; j != v30; ++j)
      {
        if (*(void *)v236 != v31) {
          objc_enumerationMutation(v28);
        }
        uint64_t v33 = *(void **)(*((void *)&v235 + 1) + 8 * j);
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          id v34 = v33;
          if ([v34 isEqualToString:@"PT_UNKNOWN"])
          {
            uint64_t v35 = 0;
          }
          else if ([v34 isEqualToString:@"COUNTRY"])
          {
            uint64_t v35 = 1;
          }
          else if ([v34 isEqualToString:@"STATE"])
          {
            uint64_t v35 = 2;
          }
          else if ([v34 isEqualToString:@"COUNTY"])
          {
            uint64_t v35 = 4;
          }
          else if ([v34 isEqualToString:@"CITY"])
          {
            uint64_t v35 = 16;
          }
          else if ([v34 isEqualToString:@"TIME_ZONE"])
          {
            uint64_t v35 = 35;
          }
          else if ([v34 isEqualToString:@"NEIGHBORHOOD"])
          {
            uint64_t v35 = 43;
          }
          else if ([v34 isEqualToString:@"OCEAN"])
          {
            uint64_t v35 = 44;
          }
          else if ([v34 isEqualToString:@"AOI"])
          {
            uint64_t v35 = 45;
          }
          else if ([v34 isEqualToString:@"INLAND_WATER"])
          {
            uint64_t v35 = 46;
          }
          else if ([v34 isEqualToString:@"POI"])
          {
            uint64_t v35 = 47;
          }
          else if ([v34 isEqualToString:@"ISLAND"])
          {
            uint64_t v35 = 48;
          }
          else if ([v34 isEqualToString:@"STREET"])
          {
            uint64_t v35 = 49;
          }
          else if ([v34 isEqualToString:@"ADMIN"])
          {
            uint64_t v35 = 50;
          }
          else if ([v34 isEqualToString:@"POSTAL"])
          {
            uint64_t v35 = 51;
          }
          else if ([v34 isEqualToString:@"INTERSECTION"])
          {
            uint64_t v35 = 54;
          }
          else if ([v34 isEqualToString:@"BUILDING"])
          {
            uint64_t v35 = 55;
          }
          else if ([v34 isEqualToString:@"ADDRESS"])
          {
            uint64_t v35 = 57;
          }
          else if ([v34 isEqualToString:@"ZCTAS"])
          {
            uint64_t v35 = 59;
          }
          else if ([v34 isEqualToString:@"CONTINENT"])
          {
            uint64_t v35 = 61;
          }
          else if ([v34 isEqualToString:@"PHYSICAL_FEATURE"])
          {
            uint64_t v35 = 65;
          }
          else if ([v34 isEqualToString:@"PERDU_CITY"])
          {
            uint64_t v35 = 1016;
          }
          else if ([v34 isEqualToString:@"DMA"])
          {
            uint64_t v35 = 100;
          }
          else if ([v34 isEqualToString:@"CAT_10284_POSTAL"])
          {
            uint64_t v35 = 101;
          }
          else if ([v34 isEqualToString:@"CAT_10285_CITY"])
          {
            uint64_t v35 = 102;
          }
          else if ([v34 isEqualToString:@"CAT_10286_COUNTY"])
          {
            uint64_t v35 = 103;
          }
          else if ([v34 isEqualToString:@"CAT_10287_STATE"])
          {
            uint64_t v35 = 104;
          }
          else if ([v34 isEqualToString:@"CAT_10288_COUNTRY"])
          {
            uint64_t v35 = 105;
          }
          else if ([v34 isEqualToString:@"CAT_10288_COUNTRY_CODE"])
          {
            uint64_t v35 = 106;
          }
          else if ([v34 isEqualToString:@"CAT_10287_STATE_CODE"])
          {
            uint64_t v35 = 107;
          }
          else
          {
            uint64_t v35 = 0;
          }
        }
        else
        {
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0) {
            continue;
          }
          uint64_t v35 = [v33 intValue];
        }
        [v5 addAdditionalPlaceType:v35];
      }
      uint64_t v30 = [v28 countByEnumeratingWithState:&v235 objects:v248 count:16];
      if (!v30)
      {
LABEL_106:

        v27 = v210;
        id v4 = v211;
        break;
      }
    }
  }

  v36 = [v4 objectForKeyedSubscript:@"includePhonetics"];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    objc_msgSend(v5, "setIncludePhonetics:", objc_msgSend(v36, "BOOLValue"));
  }

  v37 = [v4 objectForKeyedSubscript:@"maxResults"];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    objc_msgSend(v5, "setMaxResults:", objc_msgSend(v37, "intValue"));
  }

  id v38 = [v4 objectForKeyedSubscript:@"sessionGUID"];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v233 = 0;
    uint64_t v234 = 0;
    _GEOSessionIDFromDictionaryRepresentation(v38, &v233);
    objc_msgSend(v5, "setSessionGUID:", v233, v234);
  }

  uint64_t v39 = [v4 objectForKeyedSubscript:@"businessSortOrder"];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v40 = v39;
    if ([v40 isEqualToString:@"RELEVANCE"])
    {
      uint64_t v41 = 0;
    }
    else if ([v40 isEqualToString:@"RATING"])
    {
      uint64_t v41 = 1;
    }
    else if ([v40 isEqualToString:@"DISTANCE"])
    {
      uint64_t v41 = 2;
    }
    else
    {
      uint64_t v41 = 0;
    }
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0) {
      goto LABEL_125;
    }
    uint64_t v41 = [v39 intValue];
  }
  [v5 setBusinessSortOrder:v41];
LABEL_125:

  v42 = [v4 objectForKeyedSubscript:@"includeBusinessRating"];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    objc_msgSend(v5, "setIncludeBusinessRating:", objc_msgSend(v42, "BOOLValue"));
  }

  v43 = [v4 objectForKeyedSubscript:@"includeBusinessCategories"];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    objc_msgSend(v5, "setIncludeBusinessCategories:", objc_msgSend(v43, "BOOLValue"));
  }

  v44 = [v4 objectForKeyedSubscript:@"maxBusinessReviews"];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    objc_msgSend(v5, "setMaxBusinessReviews:", objc_msgSend(v44, "intValue"));
  }

  v45 = [v4 objectForKeyedSubscript:@"filterByBusinessCategory"];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    long long v231 = 0u;
    long long v232 = 0u;
    long long v229 = 0u;
    long long v230 = 0u;
    id v46 = v45;
    uint64_t v47 = [v46 countByEnumeratingWithState:&v229 objects:v247 count:16];
    if (v47)
    {
      uint64_t v48 = v47;
      uint64_t v49 = *(void *)v230;
      do
      {
        for (uint64_t k = 0; k != v48; ++k)
        {
          if (*(void *)v230 != v49) {
            objc_enumerationMutation(v46);
          }
          v51 = *(void **)(*((void *)&v229 + 1) + 8 * k);
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            v52 = (void *)[v51 copy];
            [v5 addFilterByBusinessCategory:v52];
          }
        }
        uint64_t v48 = [v46 countByEnumeratingWithState:&v229 objects:v247 count:16];
      }
      while (v48);
    }
  }
  v53 = [v4 objectForKeyedSubscript:@"isStrictMapRegion"];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    objc_msgSend(v5, "setIsStrictMapRegion:", objc_msgSend(v53, "BOOLValue"));
  }

  v54 = [v4 objectForKeyedSubscript:@"timestamp"];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    [v54 doubleValue];
    objc_msgSend(v5, "setTimestamp:");
  }

  v55 = [v4 objectForKeyedSubscript:@"zilchPoints"];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v56 = (void *)[objc_alloc(MEMORY[0x1E4F1C9B8]) initWithBase64EncodedString:v55 options:0];
    [v5 setZilchPoints:v56];
  }
  v57 = [v4 objectForKeyedSubscript:@"includeEntryPoints"];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    objc_msgSend(v5, "setIncludeEntryPoints:", objc_msgSend(v57, "BOOLValue"));
  }

  v58 = [v4 objectForKeyedSubscript:@"businessOptions"];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v59 = [GEOBusinessOptions alloc];
    if (a3) {
      uint64_t v60 = [(GEOBusinessOptions *)v59 initWithJSON:v58];
    }
    else {
      uint64_t v60 = [(GEOBusinessOptions *)v59 initWithDictionary:v58];
    }
    uint64_t v61 = (void *)v60;
    [v5 setBusinessOptions:v60];
  }
  v62 = [v4 objectForKeyedSubscript:@"localSearchProviderID"];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    objc_msgSend(v5, "setLocalSearchProviderID:", objc_msgSend(v62, "intValue"));
  }

  uint64_t v63 = [v4 objectForKeyedSubscript:@"includeSuggestionsOnly"];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    objc_msgSend(v5, "setIncludeSuggestionsOnly:", objc_msgSend(v63, "BOOLValue"));
  }

  v64 = [v4 objectForKeyedSubscript:@"structuredSearch"];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    objc_msgSend(v5, "setStructuredSearch:", objc_msgSend(v64, "BOOLValue"));
  }

  v65 = [v4 objectForKeyedSubscript:@"suggestionsPrefix"];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v66 = (void *)[v65 copy];
    [v5 setSuggestionsPrefix:v66];
  }
  v67 = [v4 objectForKeyedSubscript:@"deviceCountryCode"];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v68 = (void *)[v67 copy];
    [v5 setDeviceCountryCode:v68];
  }
  id v69 = [v4 objectForKeyedSubscript:@"deviceLocation"];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v70 = [GEOLatLng alloc];
    if (a3) {
      uint64_t v71 = [(GEOLatLng *)v70 initWithJSON:v69];
    }
    else {
      uint64_t v71 = [(GEOLatLng *)v70 initWithDictionary:v69];
    }
    v72 = (void *)v71;
    [v5 setDeviceLocation:v71];
  }
  uint64_t v73 = [v4 objectForKeyedSubscript:@"inputLanguage"];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v74 = (void *)[v73 copy];
    [v5 setInputLanguage:v74];
  }
  v75 = [v4 objectForKeyedSubscript:@"phoneticLocaleIdentifier"];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v76 = (void *)[v75 copy];
    [v5 setPhoneticLocaleIdentifier:v76];
  }
  uint64_t v77 = [v4 objectForKeyedSubscript:@"sequenceNumber"];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    objc_msgSend(v5, "setSequenceNumber:", objc_msgSend(v77, "intValue"));
  }

  uint64_t v78 = [v4 objectForKeyedSubscript:@"suppressResultsRequiringAttribution"];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    objc_msgSend(v5, "setSuppressResultsRequiringAttribution:", objc_msgSend(v78, "BOOLValue"));
  }

  uint64_t v79 = [v4 objectForKeyedSubscript:@"isFromAPI"];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    objc_msgSend(v5, "setIsFromAPI:", objc_msgSend(v79, "BOOLValue"));
  }

  v80 = [v4 objectForKeyedSubscript:@"timeSinceMapEnteredForeground"];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    [v80 doubleValue];
    objc_msgSend(v5, "setTimeSinceMapEnteredForeground:");
  }

  v81 = [v4 objectForKeyedSubscript:@"timeSinceMapViewportChanged"];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    [v81 doubleValue];
    objc_msgSend(v5, "setTimeSinceMapViewportChanged:");
  }

  id v82 = [v4 objectForKeyedSubscript:@"includeSpokenNames"];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    objc_msgSend(v5, "setIncludeSpokenNames:", objc_msgSend(v82, "BOOLValue"));
  }

  v83 = [v4 objectForKeyedSubscript:@"deviceTimeZone"];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v84 = (void *)[v83 copy];
    [v5 setDeviceTimeZone:v84];
  }
  v85 = [v4 objectForKeyedSubscript:@"clientCapabilities"];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v86 = [GEOClientCapabilities alloc];
    if (a3) {
      uint64_t v87 = [(GEOClientCapabilities *)v86 initWithJSON:v85];
    }
    else {
      uint64_t v87 = [(GEOClientCapabilities *)v86 initWithDictionary:v85];
    }
    v88 = (void *)v87;
    [v5 setClientCapabilities:v87];
  }
  v89 = [v4 objectForKeyedSubscript:@"includeTravelTime"];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    objc_msgSend(v5, "setIncludeTravelTime:", objc_msgSend(v89, "BOOLValue"));
  }

  v90 = [v4 objectForKeyedSubscript:@"transportTypeForTravelTimes"];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v91 = v90;
    if ([v91 isEqualToString:@"AUTOMOBILE"])
    {
      uint64_t v92 = 0;
    }
    else if ([v91 isEqualToString:@"TRANSIT"])
    {
      uint64_t v92 = 1;
    }
    else if ([v91 isEqualToString:@"WALKING"])
    {
      uint64_t v92 = 2;
    }
    else if ([v91 isEqualToString:@"BICYCLE"])
    {
      uint64_t v92 = 3;
    }
    else if ([v91 isEqualToString:@"UNKNOWN_TRANSPORT_TYPE"])
    {
      uint64_t v92 = 4;
    }
    else if ([v91 isEqualToString:@"FERRY"])
    {
      uint64_t v92 = 5;
    }
    else if ([v91 isEqualToString:@"RIDESHARE"])
    {
      uint64_t v92 = 6;
    }
    else
    {
      uint64_t v92 = 0;
    }
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0) {
      goto LABEL_215;
    }
    uint64_t v92 = [v90 intValue];
  }
  [v5 setTransportTypeForTravelTimes:v92];
LABEL_215:

  v93 = [v4 objectForKeyedSubscript:@"suggestionsOptions"];
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    goto LABEL_261;
  }
  v94 = [GEOSuggestionsOptions alloc];
  if (!v94)
  {
    uint64_t v97 = 0;
    goto LABEL_260;
  }
  v95 = v94;
  id v96 = v93;
  uint64_t v97 = [(GEOSuggestionsOptions *)v95 init];
  if (v97)
  {
    v98 = [v96 objectForKeyedSubscript:@"listType"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v99 = v98;
      if ([v99 isEqualToString:@"INTERLEAVED"])
      {
        int v100 = 0;
      }
      else if ([v99 isEqualToString:@"SECTIONED"])
      {
        int v100 = 1;
      }
      else if ([v99 isEqualToString:@"LEGACY_LIST"])
      {
        int v100 = 2;
      }
      else
      {
        int v100 = 0;
      }
    }
    else
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0) {
        goto LABEL_230;
      }
      int v100 = [v98 intValue];
    }
    *(unsigned char *)(v97 + 64) |= 0x80u;
    *(unsigned char *)(v97 + 64) |= 2u;
    *(_DWORD *)(v97 + 56) = v100;
LABEL_230:

    v101 = [v96 objectForKeyedSubscript:@"entriesType"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v102 = v101;
      if ([v102 isEqualToString:@"INSTANT_SEARCH"])
      {
        int v103 = 0;
      }
      else if ([v102 isEqualToString:@"AUTOCOMPLETE"])
      {
        int v103 = 1;
      }
      else if ([v102 isEqualToString:@"LEGACY_ENTRIES"])
      {
        int v103 = 2;
      }
      else if ([v102 isEqualToString:@"PARSEC"])
      {
        int v103 = 3;
      }
      else if ([v102 isEqualToString:@"ADDRESSES_ONLY"])
      {
        int v103 = 4;
      }
      else if ([v102 isEqualToString:@"LOCALITIES_AND_LANDMARKS"])
      {
        int v103 = 5;
      }
      else if ([v102 isEqualToString:@"PARSEC_LOCALITIES_AND_LANDMARKS"])
      {
        int v103 = 6;
      }
      else
      {
        int v103 = 0;
      }
    }
    else
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
LABEL_250:

        uint64_t v104 = [v96 objectForKeyedSubscript:@"suggestionMetadata"];
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          uint64_t v105 = (void *)[objc_alloc(MEMORY[0x1E4F1C9B8]) initWithBase64EncodedString:v104 options:0];
          -[GEOSuggestionsOptions setSuggestionMetadata:](v97, v105);
        }
        uint64_t v106 = [v96 objectForKeyedSubscript:@"suggestionEntryMetadata"];
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          v107 = (void *)[objc_alloc(MEMORY[0x1E4F1C9B8]) initWithBase64EncodedString:v106 options:0];
          -[GEOSuggestionsOptions setSuggestionEntryMetadata:](v97, v107);
        }
        v108 = [v96 objectForKeyedSubscript:@"normalizePOIs"];
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          char v109 = [v108 BOOLValue];
          *(unsigned char *)(v97 + 64) |= 0x80u;
          *(unsigned char *)(v97 + 64) |= 8u;
          *(unsigned char *)(v97 + 61) = v109;
        }

        v110 = [v96 objectForKeyedSubscript:@"includeRankingFeatures"];
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          char v111 = [v110 BOOLValue];
          *(unsigned char *)(v97 + 64) |= 0x80u;
          *(unsigned char *)(v97 + 64) |= 4u;
          *(unsigned char *)(v97 + 60) = v111;
        }

        goto LABEL_259;
      }
      int v103 = [v101 intValue];
    }
    *(unsigned char *)(v97 + 64) |= 0x80u;
    *(unsigned char *)(v97 + 64) |= 1u;
    *(_DWORD *)(v97 + 52) = v103;
    goto LABEL_250;
  }
LABEL_259:

LABEL_260:
  [v5 setSuggestionsOptions:v97];

LABEL_261:
  v112 = [v4 objectForKeyedSubscript:@"placeTypeLimit"];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v113 = v112;
    if ([v113 isEqualToString:@"PT_UNKNOWN"])
    {
      uint64_t v114 = 0;
    }
    else if ([v113 isEqualToString:@"COUNTRY"])
    {
      uint64_t v114 = 1;
    }
    else if ([v113 isEqualToString:@"STATE"])
    {
      uint64_t v114 = 2;
    }
    else if ([v113 isEqualToString:@"COUNTY"])
    {
      uint64_t v114 = 4;
    }
    else if ([v113 isEqualToString:@"CITY"])
    {
      uint64_t v114 = 16;
    }
    else if ([v113 isEqualToString:@"TIME_ZONE"])
    {
      uint64_t v114 = 35;
    }
    else if ([v113 isEqualToString:@"NEIGHBORHOOD"])
    {
      uint64_t v114 = 43;
    }
    else if ([v113 isEqualToString:@"OCEAN"])
    {
      uint64_t v114 = 44;
    }
    else if ([v113 isEqualToString:@"AOI"])
    {
      uint64_t v114 = 45;
    }
    else if ([v113 isEqualToString:@"INLAND_WATER"])
    {
      uint64_t v114 = 46;
    }
    else if ([v113 isEqualToString:@"POI"])
    {
      uint64_t v114 = 47;
    }
    else if ([v113 isEqualToString:@"ISLAND"])
    {
      uint64_t v114 = 48;
    }
    else if ([v113 isEqualToString:@"STREET"])
    {
      uint64_t v114 = 49;
    }
    else if ([v113 isEqualToString:@"ADMIN"])
    {
      uint64_t v114 = 50;
    }
    else if ([v113 isEqualToString:@"POSTAL"])
    {
      uint64_t v114 = 51;
    }
    else if ([v113 isEqualToString:@"INTERSECTION"])
    {
      uint64_t v114 = 54;
    }
    else if ([v113 isEqualToString:@"BUILDING"])
    {
      uint64_t v114 = 55;
    }
    else if ([v113 isEqualToString:@"ADDRESS"])
    {
      uint64_t v114 = 57;
    }
    else if ([v113 isEqualToString:@"ZCTAS"])
    {
      uint64_t v114 = 59;
    }
    else if ([v113 isEqualToString:@"CONTINENT"])
    {
      uint64_t v114 = 61;
    }
    else if ([v113 isEqualToString:@"PHYSICAL_FEATURE"])
    {
      uint64_t v114 = 65;
    }
    else if ([v113 isEqualToString:@"PERDU_CITY"])
    {
      uint64_t v114 = 1016;
    }
    else if ([v113 isEqualToString:@"DMA"])
    {
      uint64_t v114 = 100;
    }
    else if ([v113 isEqualToString:@"CAT_10284_POSTAL"])
    {
      uint64_t v114 = 101;
    }
    else if ([v113 isEqualToString:@"CAT_10285_CITY"])
    {
      uint64_t v114 = 102;
    }
    else if ([v113 isEqualToString:@"CAT_10286_COUNTY"])
    {
      uint64_t v114 = 103;
    }
    else if ([v113 isEqualToString:@"CAT_10287_STATE"])
    {
      uint64_t v114 = 104;
    }
    else if ([v113 isEqualToString:@"CAT_10288_COUNTRY"])
    {
      uint64_t v114 = 105;
    }
    else if ([v113 isEqualToString:@"CAT_10288_COUNTRY_CODE"])
    {
      uint64_t v114 = 106;
    }
    else if ([v113 isEqualToString:@"CAT_10287_STATE_CODE"])
    {
      uint64_t v114 = 107;
    }
    else
    {
      uint64_t v114 = 0;
    }
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0) {
      goto LABEL_328;
    }
    uint64_t v114 = [v112 intValue];
  }
  [v5 setPlaceTypeLimit:v114];
LABEL_328:

  uint64_t v115 = [v4 objectForKeyedSubscript:@"isStrictGeocoding"];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    objc_msgSend(v5, "setIsStrictGeocoding:", objc_msgSend(v115, "BOOLValue"));
  }

  v116 = [v4 objectForKeyedSubscript:@"includeTravelDistance"];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    objc_msgSend(v5, "setIncludeTravelDistance:", objc_msgSend(v116, "BOOLValue"));
  }

  v117 = [v4 objectForKeyedSubscript:@"includeRoadAccessPoints"];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    objc_msgSend(v5, "setIncludeRoadAccessPoints:", objc_msgSend(v117, "BOOLValue"));
  }

  uint64_t v118 = [v4 objectForKeyedSubscript:@"limitToCountryCodeIso2"];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    long long v227 = 0u;
    long long v228 = 0u;
    long long v225 = 0u;
    long long v226 = 0u;
    id v119 = v118;
    uint64_t v120 = [v119 countByEnumeratingWithState:&v225 objects:v246 count:16];
    if (v120)
    {
      uint64_t v121 = v120;
      uint64_t v122 = *(void *)v226;
      do
      {
        for (uint64_t m = 0; m != v121; ++m)
        {
          if (*(void *)v226 != v122) {
            objc_enumerationMutation(v119);
          }
          v124 = *(void **)(*((void *)&v225 + 1) + 8 * m);
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            v125 = (void *)[v124 copy];
            [v5 addLimitToCountryCodeIso2:v125];
          }
        }
        uint64_t v121 = [v119 countByEnumeratingWithState:&v225 objects:v246 count:16];
      }
      while (v121);
    }
  }
  v126 = [v4 objectForKeyedSubscript:@"isCanonicalLocationSearch"];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    objc_msgSend(v5, "setIsCanonicalLocationSearch:", objc_msgSend(v126, "BOOLValue"));
  }

  id v127 = [v4 objectForKeyedSubscript:@"geoId"];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    objc_msgSend(v5, "setGeoId:", objc_msgSend(v127, "longLongValue"));
  }

  v128 = [v4 objectForKeyedSubscript:@"includeQuads"];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    objc_msgSend(v5, "setIncludeQuads:", objc_msgSend(v128, "BOOLValue"));
  }

  v129 = [v4 objectForKeyedSubscript:@"excludeAddressInResults"];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    objc_msgSend(v5, "setExcludeAddressInResults:", objc_msgSend(v129, "BOOLValue"));
  }

  v130 = [v4 objectForKeyedSubscript:@"searchSubstring"];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    long long v223 = 0u;
    long long v224 = 0u;
    long long v221 = 0u;
    long long v222 = 0u;
    id v131 = v130;
    uint64_t v132 = [v131 countByEnumeratingWithState:&v221 objects:v245 count:16];
    if (v132)
    {
      uint64_t v133 = v132;
      uint64_t v134 = *(void *)v222;
      do
      {
        for (uint64_t n = 0; n != v133; ++n)
        {
          if (*(void *)v222 != v134) {
            objc_enumerationMutation(v131);
          }
          uint64_t v136 = *(void *)(*((void *)&v221 + 1) + 8 * n);
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            v137 = [GEOSearchSubstring alloc];
            if (a3) {
              uint64_t v138 = [(GEOSearchSubstring *)v137 initWithJSON:v136];
            }
            else {
              uint64_t v138 = [(GEOSearchSubstring *)v137 initWithDictionary:v136];
            }
            v139 = (void *)v138;
            [v5 addSearchSubstring:v138];
          }
        }
        uint64_t v133 = [v131 countByEnumeratingWithState:&v221 objects:v245 count:16];
      }
      while (v133);
    }
  }
  v140 = [v4 objectForKeyedSubscript:@"includeGeoId"];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    objc_msgSend(v5, "setIncludeGeoId:", objc_msgSend(v140, "BOOLValue"));
  }

  v141 = [v4 objectForKeyedSubscript:@"searchContext"];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v142 = (void *)[v141 copy];
    [v5 setSearchContext:v142];
  }
  v143 = [v4 objectForKeyedSubscript:@"searchContextSubstring"];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v144 = [GEOSearchSubstring alloc];
    if (a3) {
      uint64_t v145 = [(GEOSearchSubstring *)v144 initWithJSON:v143];
    }
    else {
      uint64_t v145 = [(GEOSearchSubstring *)v144 initWithDictionary:v143];
    }
    id v146 = (void *)v145;
    [v5 setSearchContextSubstring:v145];
  }
  id v147 = [v4 objectForKeyedSubscript:@"includeStatusCodeInfo"];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    objc_msgSend(v5, "setIncludeStatusCodeInfo:", objc_msgSend(v147, "BOOLValue"));
  }

  id v148 = [v4 objectForKeyedSubscript:@"preserveFields"];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v149 = [GEOAddress alloc];
    if (a3) {
      uint64_t v150 = [(GEOAddress *)v149 initWithJSON:v148];
    }
    else {
      uint64_t v150 = [(GEOAddress *)v149 initWithDictionary:v148];
    }
    v151 = (void *)v150;
    [v5 setPreserveFields:v150];
  }
  v152 = [v4 objectForKeyedSubscript:@"includeUnmatchedStrings"];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    objc_msgSend(v5, "setIncludeUnmatchedStrings:", objc_msgSend(v152, "BOOLValue"));
  }

  id v153 = [v4 objectForKeyedSubscript:@"indexFilter"];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    long long v154 = [GEOIndexQueryNode alloc];
    if (v154) {
      long long v155 = (void *)-[GEOIndexQueryNode _initWithDictionary:isJSON:](v154, v153);
    }
    else {
      long long v155 = 0;
    }
    [v5 setIndexFilter:v155];
  }
  long long v156 = [v4 objectForKeyedSubscript:@"includeFeatureSets"];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    objc_msgSend(v5, "setIncludeFeatureSets:", objc_msgSend(v156, "BOOLValue"));
  }

  long long v157 = [v4 objectForKeyedSubscript:@"serviceTag"];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    long long v219 = 0u;
    long long v220 = 0u;
    long long v217 = 0u;
    long long v218 = 0u;
    id v158 = v157;
    uint64_t v159 = [v158 countByEnumeratingWithState:&v217 objects:v244 count:16];
    if (v159)
    {
      uint64_t v160 = v159;
      uint64_t v161 = *(void *)v218;
      do
      {
        for (iuint64_t i = 0; ii != v160; ++ii)
        {
          if (*(void *)v218 != v161) {
            objc_enumerationMutation(v158);
          }
          uint64_t v163 = *(void *)(*((void *)&v217 + 1) + 8 * ii);
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            uint64_t v164 = [GEOGeoServiceTag alloc];
            if (a3) {
              uint64_t v165 = [(GEOGeoServiceTag *)v164 initWithJSON:v163];
            }
            else {
              uint64_t v165 = [(GEOGeoServiceTag *)v164 initWithDictionary:v163];
            }
            v166 = (void *)v165;
            [v5 addServiceTag:v165];
          }
        }
        uint64_t v160 = [v158 countByEnumeratingWithState:&v217 objects:v244 count:16];
      }
      while (v160);
    }
  }
  v167 = [v4 objectForKeyedSubscript:@"intersectingGeoId"];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    objc_msgSend(v5, "setIntersectingGeoId:", objc_msgSend(v167, "unsignedLongLongValue"));
  }

  v168 = [v4 objectForKeyedSubscript:@"knownLocation"];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v169 = [GEOLatLng alloc];
    if (a3) {
      uint64_t v170 = [(GEOLatLng *)v169 initWithJSON:v168];
    }
    else {
      uint64_t v170 = [(GEOLatLng *)v169 initWithDictionary:v168];
    }
    v171 = (void *)v170;
    [v5 setKnownLocation:v170];
  }
  v172 = [v4 objectForKeyedSubscript:@"knownAccuracy"];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v173 = v172;
    if ([v173 isEqualToString:@"POINT"])
    {
      uint64_t v174 = 0;
    }
    else if ([v173 isEqualToString:@"INTERPOLATION"])
    {
      uint64_t v174 = 1;
    }
    else if ([v173 isEqualToString:@"APPROXIMATE"])
    {
      uint64_t v174 = 2;
    }
    else if ([v173 isEqualToString:@"POSTAL"])
    {
      uint64_t v174 = 3;
    }
    else if ([v173 isEqualToString:@"PARCEL"])
    {
      uint64_t v174 = 4;
    }
    else if ([v173 isEqualToString:@"SUBPREMISE"])
    {
      uint64_t v174 = 5;
    }
    else
    {
      uint64_t v174 = 0;
    }
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0) {
      goto LABEL_430;
    }
    uint64_t v174 = [v172 intValue];
  }
  [v5 setKnownAccuracy:v174];
LABEL_430:

  v175 = [v4 objectForKeyedSubscript:@"includeMatchedToken"];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    objc_msgSend(v5, "setIncludeMatchedToken:", objc_msgSend(v175, "BOOLValue"));
  }

  v176 = [v4 objectForKeyedSubscript:@"searchSource"];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v177 = v176;
    if ([v177 isEqualToString:@"UNKNOWN"])
    {
      uint64_t v178 = 0;
    }
    else if ([v177 isEqualToString:@"URL"])
    {
      uint64_t v178 = 1;
    }
    else if ([v177 isEqualToString:@"USER"])
    {
      uint64_t v178 = 2;
    }
    else if ([v177 isEqualToString:@"REFINEMENT"])
    {
      uint64_t v178 = 3;
    }
    else if ([v177 isEqualToString:@"SPELLING"])
    {
      uint64_t v178 = 4;
    }
    else if ([v177 isEqualToString:@"HINT_CONTACTS"])
    {
      uint64_t v178 = 5;
    }
    else if ([v177 isEqualToString:@"STARK_USER"])
    {
      uint64_t v178 = 6;
    }
    else if ([v177 isEqualToString:@"HINT_COMPLETION"])
    {
      uint64_t v178 = 7;
    }
    else if ([v177 isEqualToString:@"STARK_HINT_COMPLETION"])
    {
      uint64_t v178 = 8;
    }
    else if ([v177 isEqualToString:@"HINT_HISTORY"])
    {
      uint64_t v178 = 9;
    }
    else if ([v177 isEqualToString:@"STARK_HINT_HISTORY"])
    {
      uint64_t v178 = 10;
    }
    else if ([v177 isEqualToString:@"AUTOCOMPLETE_SEARCH"])
    {
      uint64_t v178 = 11;
    }
    else if ([v177 isEqualToString:@"STARK_AUTOCOMPLETE_SEARCH"])
    {
      uint64_t v178 = 12;
    }
    else if ([v177 isEqualToString:@"AUTOCOMPLETE_NAV_FROM"])
    {
      uint64_t v178 = 13;
    }
    else if ([v177 isEqualToString:@"AUTOCOMPLETE_NAV_TO"])
    {
      uint64_t v178 = 14;
    }
    else if ([v177 isEqualToString:@"NAV_FROM"])
    {
      uint64_t v178 = 15;
    }
    else if ([v177 isEqualToString:@"NAV_TO"])
    {
      uint64_t v178 = 16;
    }
    else if ([v177 isEqualToString:@"BOOKMARK_REFRESH"])
    {
      uint64_t v178 = 17;
    }
    else if ([v177 isEqualToString:@"ROUTING"])
    {
      uint64_t v178 = 18;
    }
    else if ([v177 isEqualToString:@"PRELOADER"])
    {
      uint64_t v178 = 19;
    }
    else if ([v177 isEqualToString:@"USER_NO_TYPING"])
    {
      uint64_t v178 = 20;
    }
    else if ([v177 isEqualToString:@"ADD_TO_FAVORITES"])
    {
      uint64_t v178 = 21;
    }
    else if ([v177 isEqualToString:@"ADD_TO_COLLECTIONS"])
    {
      uint64_t v178 = 22;
    }
    else if ([v177 isEqualToString:@"RAP_HINT_COMPLETION"])
    {
      uint64_t v178 = 23;
    }
    else
    {
      uint64_t v178 = 0;
    }

    goto LABEL_486;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v178 = [v176 intValue];
LABEL_486:
    [v5 setSearchSource:v178];
  }

  v179 = [v4 objectForKeyedSubscript:@"optionalSuppressionReason"];
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    goto LABEL_501;
  }
  long long v215 = 0u;
  long long v216 = 0u;
  long long v213 = 0u;
  long long v214 = 0u;
  id v180 = v179;
  uint64_t v181 = [v180 countByEnumeratingWithState:&v213 objects:v243 count:16];
  if (!v181) {
    goto LABEL_500;
  }
  uint64_t v182 = v181;
  uint64_t v183 = *(void *)v214;
  do
  {
    for (juint64_t j = 0; jj != v182; ++jj)
    {
      if (*(void *)v214 != v183) {
        objc_enumerationMutation(v180);
      }
      v185 = *(void **)(*((void *)&v213 + 1) + 8 * jj);
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        id v186 = v185;
        [v186 isEqualToString:@"OBSCURE"];

        uint64_t v187 = 1;
      }
      else
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0) {
          continue;
        }
        uint64_t v187 = [v185 intValue];
      }
      [v5 addOptionalSuppressionReason:v187];
    }
    uint64_t v182 = [v180 countByEnumeratingWithState:&v213 objects:v243 count:16];
  }
  while (v182);
LABEL_500:

LABEL_501:
  v188 = [v4 objectForKeyedSubscript:@"searchLocation"];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v189 = [GEOLatLng alloc];
    if (a3) {
      uint64_t v190 = [(GEOLatLng *)v189 initWithJSON:v188];
    }
    else {
      uint64_t v190 = [(GEOLatLng *)v189 initWithDictionary:v188];
    }
    v191 = (void *)v190;
    [v5 setSearchLocation:v190];
  }
  v192 = [v4 objectForKeyedSubscript:@"includeNameForForwardGeocodingResults"];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    objc_msgSend(v5, "setIncludeNameForForwardGeocodingResults:", objc_msgSend(v192, "BOOLValue"));
  }

  v193 = [v4 objectForKeyedSubscript:@"additionalEnabledMarkets"];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v194 = [GEOAdditionalEnabledMarkets alloc];
    if (a3) {
      uint64_t v195 = [(GEOAdditionalEnabledMarkets *)v194 initWithJSON:v193];
    }
    else {
      uint64_t v195 = [(GEOAdditionalEnabledMarkets *)v194 initWithDictionary:v193];
    }
    v196 = (void *)v195;
    [v5 setAdditionalEnabledMarkets:v195];
  }
  if (a3) {
    v197 = @"mapMode";
  }
  else {
    v197 = @"map_mode";
  }
  v198 = [v4 objectForKeyedSubscript:v197];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v199 = v198;
    if ([v199 isEqualToString:@"NONE"])
    {
      uint64_t v200 = 0;
    }
    else if ([v199 isEqualToString:@"STANDARD"])
    {
      uint64_t v200 = 1;
    }
    else if ([v199 isEqualToString:@"SATELLITE"])
    {
      uint64_t v200 = 2;
    }
    else if ([v199 isEqualToString:@"HYBRID"])
    {
      uint64_t v200 = 3;
    }
    else if ([v199 isEqualToString:@"TRANSIT"])
    {
      uint64_t v200 = 4;
    }
    else
    {
      uint64_t v200 = 0;
    }

LABEL_531:
    [v5 setMapMode:v200];
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      uint64_t v200 = [v198 intValue];
      goto LABEL_531;
    }
  }

  if (a3) {
    v201 = @"isPopularNearbyRequest";
  }
  else {
    v201 = @"is_popular_nearby_request";
  }
  v202 = [v4 objectForKeyedSubscript:v201];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    objc_msgSend(v5, "setIsPopularNearbyRequest:", objc_msgSend(v202, "BOOLValue"));
  }

  if (a3) {
    v203 = @"deviceLocationCountryCode";
  }
  else {
    v203 = @"device_location_country_code";
  }
  v204 = [v4 objectForKeyedSubscript:v203];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v205 = (void *)[v204 copy];
    [v5 setDeviceLocationCountryCode:v205];
  }
  if (a3) {
    v206 = @"viewportCenterCountryCode";
  }
  else {
    v206 = @"viewport_center_country_code";
  }
  v207 = [v4 objectForKeyedSubscript:v206];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v208 = (void *)[v207 copy];
    [v5 setViewportCenterCountryCode:v208];
  }
  a1 = v5;

LABEL_548:
  return a1;
}

- (GEOPlaceSearchRequest)initWithJSON:(id)a3
{
  return (GEOPlaceSearchRequest *)-[GEOPlaceSearchRequest _initWithDictionary:isJSON:](self, a3, 1);
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
      uint64_t v8 = (int *)&readAll__recursiveTag_2453;
    }
    else {
      uint64_t v8 = (int *)&readAll__nonRecursiveTag_2454;
    }
    GEOPlaceSearchRequestReadSpecified((uint64_t)self, (char *)self->_reader, v8);
    objc_sync_exit(v7);
  }
  if (v3) {
    _GEOPlaceSearchRequestCallReadAllRecursiveWithoutSynchronized((uint64_t)self);
  }

  os_unfair_lock_unlock(p_readerLock);
}

+ (BOOL)isValid:(id)a3
{
  return GEOPlaceSearchRequestIsValid((char *)a3);
}

- (BOOL)readFrom:(id)a3
{
  return GEOPlaceSearchRequestReadAllFrom((uint64_t)self, a3, 0);
}

- (void)writeTo:(id)a3
{
  uint64_t v58 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  p_readerLocuint64_t k = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  if (self->_reader && (_GEOPlaceSearchRequestIsDirty((uint64_t)self) & 1) == 0)
  {
    uint64_t v35 = self->_reader;
    objc_sync_enter(v35);
    *(void *)((char *)self->_reader + (int)*MEMORY[0x1E4F940E0]) = self->_readerMarkLength;
    [(PBDataReader *)self->_reader seekToOffset:self->_readerMarkPos];
    v36 = [(PBDataReader *)self->_reader readBytes:self->_readerMarkLength - self->_readerMarkPos];
    [v4 writeData:v36];
    os_unfair_lock_unlock(p_readerLock);

    objc_sync_exit(v35);
    goto LABEL_169;
  }
  os_unfair_lock_unlock(&self->_readerLock);
  [(GEOPlaceSearchRequest *)self readAll:0];
  if (self->_businessIDs.count)
  {
    unint64_t v6 = 0;
    do
    {
      PBDataWriterWriteUint64Field();
      ++v6;
    }
    while (v6 < self->_businessIDs.count);
  }
  if (self->_address) {
    PBDataWriterWriteSubmessage();
  }
  if (self->_location) {
    PBDataWriterWriteSubmessage();
  }
  if (self->_search) {
    PBDataWriterWriteStringField();
  }
  if (self->_mapRegion) {
    PBDataWriterWriteSubmessage();
  }
  if (self->_additionalPlaceTypes.count)
  {
    unint64_t v7 = 0;
    do
    {
      PBDataWriterWriteInt32Field();
      ++v7;
    }
    while (v7 < self->_additionalPlaceTypes.count);
  }
  p_uint64_t flags = &self->_flags;
  uint64_t flags = (uint64_t)self->_flags;
  if ((flags & 0x1000000) != 0)
  {
    PBDataWriterWriteBOOLField();
    uint64_t flags = *(void *)p_flags;
    if ((*(void *)p_flags & 0x800) == 0)
    {
LABEL_19:
      if ((flags & 1) == 0) {
        goto LABEL_20;
      }
      goto LABEL_27;
    }
  }
  else if ((flags & 0x800) == 0)
  {
    goto LABEL_19;
  }
  PBDataWriterWriteInt32Field();
  uint64_t flags = (uint64_t)self->_flags;
  if ((flags & 1) == 0)
  {
LABEL_20:
    if ((flags & 0x40) == 0) {
      goto LABEL_21;
    }
    goto LABEL_28;
  }
LABEL_27:
  uint64_t v53 = 0;
  PBDataWriterPlaceMark();
  PBDataWriterWriteUint64Field();
  PBDataWriterWriteUint64Field();
  PBDataWriterRecallMark();
  uint64_t flags = (uint64_t)self->_flags;
  if ((flags & 0x40) == 0)
  {
LABEL_21:
    if ((flags & 0x40000) == 0) {
      goto LABEL_22;
    }
    goto LABEL_29;
  }
LABEL_28:
  PBDataWriterWriteInt32Field();
  uint64_t flags = (uint64_t)self->_flags;
  if ((flags & 0x40000) == 0)
  {
LABEL_22:
    if ((flags & 0x20000) == 0) {
      goto LABEL_23;
    }
    goto LABEL_30;
  }
LABEL_29:
  PBDataWriterWriteBOOLField();
  uint64_t flags = (uint64_t)self->_flags;
  if ((flags & 0x20000) == 0)
  {
LABEL_23:
    if ((flags & 0x400) == 0) {
      goto LABEL_32;
    }
    goto LABEL_31;
  }
LABEL_30:
  PBDataWriterWriteBOOLField();
  if ((*(void *)&self->_flags & 0x400) != 0) {
LABEL_31:
  }
    PBDataWriterWriteInt32Field();
LABEL_32:
  long long v51 = 0u;
  long long v52 = 0u;
  long long v49 = 0u;
  long long v50 = 0u;
  uint64_t v10 = self->_filterByBusinessCategorys;
  uint64_t v11 = [(NSMutableArray *)v10 countByEnumeratingWithState:&v49 objects:v57 count:16];
  if (v11)
  {
    uint64_t v12 = *(void *)v50;
    do
    {
      uint64_t v13 = 0;
      do
      {
        if (*(void *)v50 != v12) {
          objc_enumerationMutation(v10);
        }
        PBDataWriterWriteStringField();
        ++v13;
      }
      while (v11 != v13);
      uint64_t v11 = [(NSMutableArray *)v10 countByEnumeratingWithState:&v49 objects:v57 count:16];
    }
    while (v11);
  }

  uint64_t v14 = (uint64_t)self->_flags;
  if ((v14 & 0x1000000000) != 0)
  {
    PBDataWriterWriteBOOLField();
    uint64_t v14 = (uint64_t)self->_flags;
  }
  if ((v14 & 0x20) != 0) {
    PBDataWriterWriteDoubleField();
  }
  if (self->_zilchPoints) {
    PBDataWriterWriteDataField();
  }
  if ((*(void *)&self->_flags & 0x80000) != 0) {
    PBDataWriterWriteBOOLField();
  }
  if (self->_businessOptions) {
    PBDataWriterWriteSubmessage();
  }
  uint64_t v15 = (uint64_t)self->_flags;
  if ((v15 & 0x100) != 0)
  {
    PBDataWriterWriteInt32Field();
    uint64_t v15 = (uint64_t)self->_flags;
  }
  if ((v15 & 0x20000000) != 0)
  {
    PBDataWriterWriteBOOLField();
    uint64_t v15 = (uint64_t)self->_flags;
  }
  if ((v15 & 0x4000000000) != 0) {
    PBDataWriterWriteBOOLField();
  }
  if (self->_suggestionsPrefix) {
    PBDataWriterWriteStringField();
  }
  if (self->_deviceCountryCode) {
    PBDataWriterWriteStringField();
  }
  if (self->_deviceLocation) {
    PBDataWriterWriteSubmessage();
  }
  if (self->_inputLanguage) {
    PBDataWriterWriteStringField();
  }
  if (self->_phoneticLocaleIdentifier) {
    PBDataWriterWriteStringField();
  }
  uint64_t v16 = (uint64_t)self->_flags;
  if ((v16 & 0x4000) != 0)
  {
    PBDataWriterWriteInt32Field();
    uint64_t v16 = (uint64_t)self->_flags;
  }
  if ((v16 & 0x8000000000) != 0)
  {
    PBDataWriterWriteBOOLField();
    uint64_t v16 = (uint64_t)self->_flags;
  }
  if ((v16 & 0x400000000) != 0)
  {
    PBDataWriterWriteBOOLField();
    uint64_t v16 = (uint64_t)self->_flags;
  }
  if ((v16 & 8) != 0)
  {
    PBDataWriterWriteDoubleField();
    uint64_t v16 = (uint64_t)self->_flags;
  }
  if ((v16 & 0x10) != 0)
  {
    PBDataWriterWriteDoubleField();
    uint64_t v16 = (uint64_t)self->_flags;
  }
  if ((v16 & 0x8000000) != 0) {
    PBDataWriterWriteBOOLField();
  }
  if (self->_deviceTimeZone) {
    PBDataWriterWriteStringField();
  }
  if (self->_clientCapabilities) {
    PBDataWriterWriteSubmessage();
  }
  uint64_t v17 = (uint64_t)self->_flags;
  if ((v17 & 0x80000000) != 0)
  {
    PBDataWriterWriteBOOLField();
    uint64_t v17 = (uint64_t)self->_flags;
  }
  if ((v17 & 0x8000) != 0) {
    PBDataWriterWriteInt32Field();
  }
  if (self->_suggestionsOptions) {
    PBDataWriterWriteSubmessage();
  }
  uint64_t v18 = (uint64_t)self->_flags;
  if ((v18 & 0x1000) != 0)
  {
    PBDataWriterWriteInt32Field();
    uint64_t v18 = (uint64_t)self->_flags;
  }
  if ((v18 & 0x800000000) != 0)
  {
    PBDataWriterWriteBOOLField();
    uint64_t v18 = (uint64_t)self->_flags;
  }
  if ((v18 & 0x40000000) != 0)
  {
    PBDataWriterWriteBOOLField();
    uint64_t v18 = (uint64_t)self->_flags;
  }
  if ((v18 & 0x4000000) != 0) {
    PBDataWriterWriteBOOLField();
  }
  long long v47 = 0u;
  long long v48 = 0u;
  long long v45 = 0u;
  long long v46 = 0u;
  uint64_t v19 = self->_limitToCountryCodeIso2s;
  uint64_t v20 = [(NSMutableArray *)v19 countByEnumeratingWithState:&v45 objects:v56 count:16];
  if (v20)
  {
    uint64_t v21 = *(void *)v46;
    do
    {
      uint64_t v22 = 0;
      do
      {
        if (*(void *)v46 != v21) {
          objc_enumerationMutation(v19);
        }
        PBDataWriterWriteStringField();
        ++v22;
      }
      while (v20 != v22);
      uint64_t v20 = [(NSMutableArray *)v19 countByEnumeratingWithState:&v45 objects:v56 count:16];
    }
    while (v20);
  }

  uint64_t v23 = (uint64_t)self->_flags;
  if ((v23 & 0x200000000) != 0)
  {
    PBDataWriterWriteBOOLField();
    uint64_t v23 = (uint64_t)self->_flags;
  }
  if ((v23 & 2) != 0)
  {
    PBDataWriterWriteInt64Field();
    uint64_t v23 = (uint64_t)self->_flags;
  }
  if ((v23 & 0x2000000) != 0)
  {
    PBDataWriterWriteBOOLField();
    uint64_t v23 = (uint64_t)self->_flags;
  }
  if ((v23 & 0x10000) != 0) {
    PBDataWriterWriteBOOLField();
  }
  long long v43 = 0u;
  long long v44 = 0u;
  long long v41 = 0u;
  long long v42 = 0u;
  uint64_t v24 = self->_searchSubstrings;
  uint64_t v25 = [(NSMutableArray *)v24 countByEnumeratingWithState:&v41 objects:v55 count:16];
  if (v25)
  {
    uint64_t v26 = *(void *)v42;
    do
    {
      uint64_t v27 = 0;
      do
      {
        if (*(void *)v42 != v26) {
          objc_enumerationMutation(v24);
        }
        PBDataWriterWriteSubmessage();
        ++v27;
      }
      while (v25 != v27);
      uint64_t v25 = [(NSMutableArray *)v24 countByEnumeratingWithState:&v41 objects:v55 count:16];
    }
    while (v25);
  }

  if ((*(void *)&self->_flags & 0x200000) != 0) {
    PBDataWriterWriteBOOLField();
  }
  if (self->_searchContext) {
    PBDataWriterWriteStringField();
  }
  if (self->_searchContextSubstring) {
    PBDataWriterWriteSubmessage();
  }
  if ((*(void *)&self->_flags & 0x10000000) != 0) {
    PBDataWriterWriteBOOLField();
  }
  if (self->_preserveFields) {
    PBDataWriterWriteSubmessage();
  }
  if ((*(void *)&self->_flags & 0x100000000) != 0) {
    PBDataWriterWriteBOOLField();
  }
  if (self->_indexFilter) {
    PBDataWriterWriteSubmessage();
  }
  if ((*(void *)&self->_flags & 0x100000) != 0) {
    PBDataWriterWriteBOOLField();
  }
  long long v39 = 0u;
  long long v40 = 0u;
  long long v37 = 0u;
  long long v38 = 0u;
  id v28 = self->_serviceTags;
  uint64_t v29 = [(NSMutableArray *)v28 countByEnumeratingWithState:&v37 objects:v54 count:16];
  if (v29)
  {
    uint64_t v30 = *(void *)v38;
    do
    {
      uint64_t v31 = 0;
      do
      {
        if (*(void *)v38 != v30) {
          objc_enumerationMutation(v28);
        }
        PBDataWriterWriteSubmessage();
        ++v31;
      }
      while (v29 != v31);
      uint64_t v29 = [(NSMutableArray *)v28 countByEnumeratingWithState:&v37 objects:v54 count:16];
    }
    while (v29);
  }

  if ((*(void *)&self->_flags & 4) != 0) {
    PBDataWriterWriteUint64Field();
  }
  if (self->_knownLocation) {
    PBDataWriterWriteSubmessage();
  }
  uint64_t v32 = (uint64_t)self->_flags;
  if ((v32 & 0x80) != 0)
  {
    PBDataWriterWriteInt32Field();
    uint64_t v32 = (uint64_t)self->_flags;
  }
  if ((v32 & 0x400000) != 0)
  {
    PBDataWriterWriteBOOLField();
    uint64_t v32 = (uint64_t)self->_flags;
  }
  if ((v32 & 0x2000) != 0) {
    PBDataWriterWriteInt32Field();
  }
  if (self->_optionalSuppressionReasons.count)
  {
    unint64_t v33 = 0;
    do
    {
      PBDataWriterWriteInt32Field();
      ++v33;
    }
    while (v33 < self->_optionalSuppressionReasons.count);
  }
  if (self->_searchLocation) {
    PBDataWriterWriteSubmessage();
  }
  if ((*(void *)&self->_flags & 0x800000) != 0) {
    PBDataWriterWriteBOOLField();
  }
  if (self->_additionalEnabledMarkets) {
    PBDataWriterWriteSubmessage();
  }
  uint64_t v34 = (uint64_t)self->_flags;
  if ((v34 & 0x200) != 0)
  {
    PBDataWriterWriteInt32Field();
    uint64_t v34 = (uint64_t)self->_flags;
  }
  if ((v34 & 0x2000000000) != 0) {
    PBDataWriterWriteBOOLField();
  }
  if (self->_deviceLocationCountryCode) {
    PBDataWriterWriteStringField();
  }
  if (self->_viewportCenterCountryCode) {
    PBDataWriterWriteStringField();
  }
  -[PBUnknownFields writeTo:](self->_unknownFields, "writeTo:", v4, v37);
LABEL_169:
}

- (void)clearSensitiveFields:(unint64_t)a3
{
}

- (BOOL)hasGreenTeaWithValue:(BOOL)a3
{
  BOOL v3 = a3;
  -[GEOPlaceSearchRequest _readDeviceLocation]((uint64_t)self);
  if ([(GEOLatLng *)self->_deviceLocation hasGreenTeaWithValue:v3]) {
    return 1;
  }
  -[GEOPlaceSearchRequest _readKnownLocation]((uint64_t)self);
  if ([(GEOLatLng *)self->_knownLocation hasGreenTeaWithValue:v3]) {
    return 1;
  }
  -[GEOPlaceSearchRequest _readLocation]((uint64_t)self);
  if ([(GEOLocation *)self->_location hasGreenTeaWithValue:v3]) {
    return 1;
  }
  -[GEOPlaceSearchRequest _readMapRegion]((uint64_t)self);
  if ([(GEOMapRegion *)self->_mapRegion hasGreenTeaWithValue:v3]) {
    return 1;
  }
  -[GEOPlaceSearchRequest _readSearchLocation]((uint64_t)self);
  searchLocatiouint64_t n = self->_searchLocation;

  return [(GEOLatLng *)searchLocation hasGreenTeaWithValue:v3];
}

- (unsigned)requestTypeCode
{
  return 43;
}

- (Class)responseClass
{
  return (Class)objc_opt_class();
}

- (void)copyTo:(id)a3
{
  long long v48 = (char *)a3;
  [(GEOPlaceSearchRequest *)self readAll:0];
  os_unfair_lock_lock_with_options();
  objc_storeStrong((id *)v48 + 1, self->_reader);
  *((_DWORD *)v48 + 92) = self->_readerMarkPos;
  *((_DWORD *)v48 + 93) = self->_readerMarkLength;
  os_unfair_lock_unlock(&self->_readerLock);
  if ([(GEOPlaceSearchRequest *)self businessIDsCount])
  {
    [v48 clearBusinessIDs];
    unint64_t v4 = [(GEOPlaceSearchRequest *)self businessIDsCount];
    if (v4)
    {
      unint64_t v5 = v4;
      for (uint64_t i = 0; i != v5; ++i)
        objc_msgSend(v48, "addBusinessID:", -[GEOPlaceSearchRequest businessIDAtIndex:](self, "businessIDAtIndex:", i));
    }
  }
  if (self->_address) {
    objc_msgSend(v48, "setAddress:");
  }
  if (self->_location) {
    objc_msgSend(v48, "setLocation:");
  }
  if (self->_search) {
    objc_msgSend(v48, "setSearch:");
  }
  if (self->_mapRegion) {
    objc_msgSend(v48, "setMapRegion:");
  }
  if ([(GEOPlaceSearchRequest *)self additionalPlaceTypesCount])
  {
    [v48 clearAdditionalPlaceTypes];
    unint64_t v7 = [(GEOPlaceSearchRequest *)self additionalPlaceTypesCount];
    if (v7)
    {
      unint64_t v8 = v7;
      for (uint64_t j = 0; j != v8; ++j)
        objc_msgSend(v48, "addAdditionalPlaceType:", -[GEOPlaceSearchRequest additionalPlaceTypeAtIndex:](self, "additionalPlaceTypeAtIndex:", j));
    }
  }
  p_uint64_t flags = &self->_flags;
  uint64_t flags = (uint64_t)self->_flags;
  if ((flags & 0x1000000) != 0)
  {
    v48[428] = self->_includePhonetics;
    *(void *)(v48 + 444) |= 0x1000000uLL;
    uint64_t flags = *(void *)p_flags;
    if ((*(void *)p_flags & 0x800) == 0)
    {
LABEL_19:
      if ((flags & 1) == 0) {
        goto LABEL_20;
      }
      goto LABEL_139;
    }
  }
  else if ((flags & 0x800) == 0)
  {
    goto LABEL_19;
  }
  *((_DWORD *)v48 + 100) = self->_maxResults;
  *(void *)(v48 + 444) |= 0x800uLL;
  uint64_t flags = (uint64_t)self->_flags;
  if ((flags & 1) == 0)
  {
LABEL_20:
    if ((flags & 0x40) == 0) {
      goto LABEL_21;
    }
    goto LABEL_140;
  }
LABEL_139:
  *((_OWORD *)v48 + 6) = self->_sessionGUID;
  *(void *)(v48 + 444) |= 1uLL;
  uint64_t flags = (uint64_t)self->_flags;
  if ((flags & 0x40) == 0)
  {
LABEL_21:
    if ((flags & 0x40000) == 0) {
      goto LABEL_22;
    }
    goto LABEL_141;
  }
LABEL_140:
  *((_DWORD *)v48 + 95) = self->_businessSortOrder;
  *(void *)(v48 + 444) |= 0x40uLL;
  uint64_t flags = (uint64_t)self->_flags;
  if ((flags & 0x40000) == 0)
  {
LABEL_22:
    if ((flags & 0x20000) == 0) {
      goto LABEL_23;
    }
LABEL_142:
    v48[421] = self->_includeBusinessCategories;
    *(void *)(v48 + 444) |= 0x20000uLL;
    if ((*(void *)&self->_flags & 0x400) == 0) {
      goto LABEL_25;
    }
    goto LABEL_24;
  }
LABEL_141:
  v48[422] = self->_includeBusinessRating;
  *(void *)(v48 + 444) |= 0x40000uLL;
  uint64_t flags = (uint64_t)self->_flags;
  if ((flags & 0x20000) != 0) {
    goto LABEL_142;
  }
LABEL_23:
  if ((flags & 0x400) != 0)
  {
LABEL_24:
    *((_DWORD *)v48 + 99) = self->_maxBusinessReviews;
    *(void *)(v48 + 444) |= 0x400uLL;
  }
LABEL_25:
  if ([(GEOPlaceSearchRequest *)self filterByBusinessCategorysCount])
  {
    [v48 clearFilterByBusinessCategorys];
    unint64_t v12 = [(GEOPlaceSearchRequest *)self filterByBusinessCategorysCount];
    if (v12)
    {
      unint64_t v13 = v12;
      for (uint64_t k = 0; k != v13; ++k)
      {
        uint64_t v15 = [(GEOPlaceSearchRequest *)self filterByBusinessCategoryAtIndex:k];
        [v48 addFilterByBusinessCategory:v15];
      }
    }
  }
  uint64_t v16 = (uint64_t)self->_flags;
  uint64_t v17 = v48;
  if ((v16 & 0x1000000000) != 0)
  {
    v48[440] = self->_isStrictMapRegion;
    *(void *)(v48 + 444) |= 0x1000000000uLL;
    uint64_t v16 = (uint64_t)self->_flags;
  }
  if ((v16 & 0x20) != 0)
  {
    *((void *)v48 + 43) = *(void *)&self->_timestamp;
    *(void *)(v48 + 444) |= 0x20uLL;
  }
  if (self->_zilchPoints)
  {
    objc_msgSend(v48, "setZilchPoints:");
    uint64_t v17 = v48;
  }
  if ((*(void *)&self->_flags & 0x80000) != 0)
  {
    v17[423] = self->_includeEntryPoints;
    *(void *)(v17 + 444) |= 0x80000uLL;
  }
  if (self->_businessOptions)
  {
    objc_msgSend(v48, "setBusinessOptions:");
    uint64_t v17 = v48;
  }
  uint64_t v18 = &self->_flags;
  uint64_t v19 = (uint64_t)self->_flags;
  if ((v19 & 0x100) != 0)
  {
    *((_DWORD *)v17 + 97) = self->_localSearchProviderID;
    *(void *)(v17 + 444) |= 0x100uLL;
    uint64_t v19 = *(void *)v18;
    if ((*(void *)v18 & 0x20000000) == 0)
    {
LABEL_41:
      if ((v19 & 0x4000000000) == 0) {
        goto LABEL_43;
      }
      goto LABEL_42;
    }
  }
  else if ((v19 & 0x20000000) == 0)
  {
    goto LABEL_41;
  }
  v17[433] = self->_includeSuggestionsOnly;
  *(void *)(v17 + 444) |= 0x20000000uLL;
  if ((*(void *)&self->_flags & 0x4000000000) != 0)
  {
LABEL_42:
    v17[442] = self->_structuredSearch;
    *(void *)(v17 + 444) |= 0x4000000000uLL;
  }
LABEL_43:
  if (self->_suggestionsPrefix)
  {
    objc_msgSend(v48, "setSuggestionsPrefix:");
    uint64_t v17 = v48;
  }
  if (self->_deviceCountryCode)
  {
    objc_msgSend(v48, "setDeviceCountryCode:");
    uint64_t v17 = v48;
  }
  if (self->_deviceLocation)
  {
    objc_msgSend(v48, "setDeviceLocation:");
    uint64_t v17 = v48;
  }
  if (self->_inputLanguage)
  {
    objc_msgSend(v48, "setInputLanguage:");
    uint64_t v17 = v48;
  }
  if (self->_phoneticLocaleIdentifier)
  {
    objc_msgSend(v48, "setPhoneticLocaleIdentifier:");
    uint64_t v17 = v48;
  }
  uint64_t v20 = &self->_flags;
  uint64_t v21 = (uint64_t)self->_flags;
  if ((v21 & 0x4000) != 0)
  {
    *((_DWORD *)v17 + 103) = self->_sequenceNumber;
    *(void *)(v17 + 444) |= 0x4000uLL;
    uint64_t v21 = *(void *)v20;
    if ((*(void *)v20 & 0x8000000000) == 0)
    {
LABEL_55:
      if ((v21 & 0x400000000) == 0) {
        goto LABEL_56;
      }
      goto LABEL_149;
    }
  }
  else if ((v21 & 0x8000000000) == 0)
  {
    goto LABEL_55;
  }
  v17[443] = self->_suppressResultsRequiringAttribution;
  *(void *)(v17 + 444) |= 0x8000000000uLL;
  uint64_t v21 = (uint64_t)self->_flags;
  if ((v21 & 0x400000000) == 0)
  {
LABEL_56:
    if ((v21 & 8) == 0) {
      goto LABEL_57;
    }
    goto LABEL_150;
  }
LABEL_149:
  v17[438] = self->_isFromAPI;
  *(void *)(v17 + 444) |= 0x400000000uLL;
  uint64_t v21 = (uint64_t)self->_flags;
  if ((v21 & 8) == 0)
  {
LABEL_57:
    if ((v21 & 0x10) == 0) {
      goto LABEL_58;
    }
    goto LABEL_151;
  }
LABEL_150:
  *((void *)v17 + 41) = *(void *)&self->_timeSinceMapEnteredForeground;
  *(void *)(v17 + 444) |= 8uLL;
  uint64_t v21 = (uint64_t)self->_flags;
  if ((v21 & 0x10) == 0)
  {
LABEL_58:
    if ((v21 & 0x8000000) == 0) {
      goto LABEL_60;
    }
    goto LABEL_59;
  }
LABEL_151:
  *((void *)v17 + 42) = *(void *)&self->_timeSinceMapViewportChanged;
  *(void *)(v17 + 444) |= 0x10uLL;
  if ((*(void *)&self->_flags & 0x8000000) != 0)
  {
LABEL_59:
    v17[431] = self->_includeSpokenNames;
    *(void *)(v17 + 444) |= 0x8000000uLL;
  }
LABEL_60:
  if (self->_deviceTimeZone)
  {
    objc_msgSend(v48, "setDeviceTimeZone:");
    uint64_t v17 = v48;
  }
  if (self->_clientCapabilities)
  {
    objc_msgSend(v48, "setClientCapabilities:");
    uint64_t v17 = v48;
  }
  uint64_t v22 = (uint64_t)self->_flags;
  if ((v22 & 0x80000000) != 0)
  {
    v17[435] = self->_includeTravelTime;
    *(void *)(v17 + 444) |= 0x80000000uLL;
    uint64_t v22 = (uint64_t)self->_flags;
  }
  if ((v22 & 0x8000) != 0)
  {
    *((_DWORD *)v17 + 104) = self->_transportTypeForTravelTimes;
    *(void *)(v17 + 444) |= 0x8000uLL;
  }
  if (self->_suggestionsOptions)
  {
    objc_msgSend(v48, "setSuggestionsOptions:");
    uint64_t v17 = v48;
  }
  uint64_t v23 = &self->_flags;
  uint64_t v24 = (uint64_t)self->_flags;
  if ((v24 & 0x1000) != 0)
  {
    *((_DWORD *)v17 + 101) = self->_placeTypeLimit;
    *(void *)(v17 + 444) |= 0x1000uLL;
    uint64_t v24 = *(void *)v23;
    if ((*(void *)v23 & 0x800000000) == 0)
    {
LABEL_72:
      if ((v24 & 0x40000000) == 0) {
        goto LABEL_73;
      }
LABEL_155:
      v17[434] = self->_includeTravelDistance;
      *(void *)(v17 + 444) |= 0x40000000uLL;
      if ((*(void *)&self->_flags & 0x4000000) == 0) {
        goto LABEL_75;
      }
      goto LABEL_74;
    }
  }
  else if ((v24 & 0x800000000) == 0)
  {
    goto LABEL_72;
  }
  v17[439] = self->_isStrictGeocoding;
  *(void *)(v17 + 444) |= 0x800000000uLL;
  uint64_t v24 = (uint64_t)self->_flags;
  if ((v24 & 0x40000000) != 0) {
    goto LABEL_155;
  }
LABEL_73:
  if ((v24 & 0x4000000) != 0)
  {
LABEL_74:
    v17[430] = self->_includeRoadAccessPoints;
    *(void *)(v17 + 444) |= 0x4000000uLL;
  }
LABEL_75:
  if ([(GEOPlaceSearchRequest *)self limitToCountryCodeIso2sCount])
  {
    [v48 clearLimitToCountryCodeIso2s];
    unint64_t v25 = [(GEOPlaceSearchRequest *)self limitToCountryCodeIso2sCount];
    if (v25)
    {
      unint64_t v26 = v25;
      for (uint64_t m = 0; m != v26; ++m)
      {
        id v28 = [(GEOPlaceSearchRequest *)self limitToCountryCodeIso2AtIndex:m];
        [v48 addLimitToCountryCodeIso2:v28];
      }
    }
  }
  uint64_t v29 = &self->_flags;
  uint64_t v30 = (uint64_t)self->_flags;
  if ((v30 & 0x200000000) != 0)
  {
    v48[437] = self->_isCanonicalLocationSearch;
    *(void *)(v48 + 444) |= 0x200000000uLL;
    uint64_t v30 = *(void *)v29;
    if ((*(void *)v29 & 2) == 0)
    {
LABEL_81:
      if ((v30 & 0x2000000) == 0) {
        goto LABEL_82;
      }
LABEL_159:
      v48[429] = self->_includeQuads;
      *(void *)(v48 + 444) |= 0x2000000uLL;
      if ((*(void *)&self->_flags & 0x10000) == 0) {
        goto LABEL_84;
      }
      goto LABEL_83;
    }
  }
  else if ((v30 & 2) == 0)
  {
    goto LABEL_81;
  }
  *((void *)v48 + 23) = self->_geoId;
  *(void *)(v48 + 444) |= 2uLL;
  uint64_t v30 = (uint64_t)self->_flags;
  if ((v30 & 0x2000000) != 0) {
    goto LABEL_159;
  }
LABEL_82:
  if ((v30 & 0x10000) != 0)
  {
LABEL_83:
    v48[420] = self->_excludeAddressInResults;
    *(void *)(v48 + 444) |= 0x10000uLL;
  }
LABEL_84:
  if ([(GEOPlaceSearchRequest *)self searchSubstringsCount])
  {
    [v48 clearSearchSubstrings];
    unint64_t v31 = [(GEOPlaceSearchRequest *)self searchSubstringsCount];
    if (v31)
    {
      unint64_t v32 = v31;
      for (uint64_t n = 0; n != v32; ++n)
      {
        uint64_t v34 = [(GEOPlaceSearchRequest *)self searchSubstringAtIndex:n];
        [v48 addSearchSubstring:v34];
      }
    }
  }
  uint64_t v35 = v48;
  if ((*(void *)&self->_flags & 0x200000) != 0)
  {
    v48[425] = self->_includeGeoId;
    *(void *)(v48 + 444) |= 0x200000uLL;
  }
  if (self->_searchContext)
  {
    objc_msgSend(v48, "setSearchContext:");
    uint64_t v35 = v48;
  }
  if (self->_searchContextSubstring)
  {
    objc_msgSend(v48, "setSearchContextSubstring:");
    uint64_t v35 = v48;
  }
  if ((*(void *)&self->_flags & 0x10000000) != 0)
  {
    v35[432] = self->_includeStatusCodeInfo;
    *(void *)(v35 + 444) |= 0x10000000uLL;
  }
  if (self->_preserveFields)
  {
    objc_msgSend(v48, "setPreserveFields:");
    uint64_t v35 = v48;
  }
  if ((*(void *)&self->_flags & 0x100000000) != 0)
  {
    v35[436] = self->_includeUnmatchedStrings;
    *(void *)(v35 + 444) |= 0x100000000uLL;
  }
  if (self->_indexFilter)
  {
    objc_msgSend(v48, "setIndexFilter:");
    uint64_t v35 = v48;
  }
  if ((*(void *)&self->_flags & 0x100000) != 0)
  {
    v35[424] = self->_includeFeatureSets;
    *(void *)(v35 + 444) |= 0x100000uLL;
  }
  if ([(GEOPlaceSearchRequest *)self serviceTagsCount])
  {
    [v48 clearServiceTags];
    unint64_t v36 = [(GEOPlaceSearchRequest *)self serviceTagsCount];
    if (v36)
    {
      unint64_t v37 = v36;
      for (iuint64_t i = 0; ii != v37; ++ii)
      {
        long long v39 = [(GEOPlaceSearchRequest *)self serviceTagAtIndex:ii];
        [v48 addServiceTag:v39];
      }
    }
  }
  long long v40 = v48;
  if ((*(void *)&self->_flags & 4) != 0)
  {
    *((void *)v48 + 26) = self->_intersectingGeoId;
    *(void *)(v48 + 444) |= 4uLL;
  }
  if (self->_knownLocation)
  {
    objc_msgSend(v48, "setKnownLocation:");
    long long v40 = v48;
  }
  long long v41 = &self->_flags;
  uint64_t v42 = (uint64_t)self->_flags;
  if ((v42 & 0x80) == 0)
  {
    if ((v42 & 0x400000) == 0) {
      goto LABEL_114;
    }
LABEL_162:
    v40[426] = self->_includeMatchedToken;
    *(void *)(v40 + 444) |= 0x400000uLL;
    if ((*(void *)&self->_flags & 0x2000) == 0) {
      goto LABEL_116;
    }
    goto LABEL_115;
  }
  *((_DWORD *)v40 + 96) = self->_knownAccuracy;
  *(void *)(v40 + 444) |= 0x80uLL;
  uint64_t v42 = *(void *)v41;
  if ((*(void *)v41 & 0x400000) != 0) {
    goto LABEL_162;
  }
LABEL_114:
  if ((v42 & 0x2000) != 0)
  {
LABEL_115:
    *((_DWORD *)v40 + 102) = self->_searchSource;
    *(void *)(v40 + 444) |= 0x2000uLL;
  }
LABEL_116:
  if ([(GEOPlaceSearchRequest *)self optionalSuppressionReasonsCount])
  {
    [v48 clearOptionalSuppressionReasons];
    unint64_t v43 = [(GEOPlaceSearchRequest *)self optionalSuppressionReasonsCount];
    if (v43)
    {
      unint64_t v44 = v43;
      for (juint64_t j = 0; jj != v44; ++jj)
        objc_msgSend(v48, "addOptionalSuppressionReason:", -[GEOPlaceSearchRequest optionalSuppressionReasonAtIndex:](self, "optionalSuppressionReasonAtIndex:", jj));
    }
  }
  if (self->_searchLocation) {
    objc_msgSend(v48, "setSearchLocation:");
  }
  long long v46 = v48;
  if ((*(void *)&self->_flags & 0x800000) != 0)
  {
    v48[427] = self->_includeNameForForwardGeocodingResults;
    *(void *)(v48 + 444) |= 0x800000uLL;
  }
  if (self->_additionalEnabledMarkets)
  {
    objc_msgSend(v48, "setAdditionalEnabledMarkets:");
    long long v46 = v48;
  }
  uint64_t v47 = (uint64_t)self->_flags;
  if ((v47 & 0x200) != 0)
  {
    *((_DWORD *)v46 + 98) = self->_mapMode;
    *(void *)(v46 + 444) |= 0x200uLL;
    uint64_t v47 = (uint64_t)self->_flags;
  }
  if ((v47 & 0x2000000000) != 0)
  {
    v46[441] = self->_isPopularNearbyRequest;
    *(void *)(v46 + 444) |= 0x2000000000uLL;
  }
  if (self->_deviceLocationCountryCode)
  {
    objc_msgSend(v48, "setDeviceLocationCountryCode:");
    long long v46 = v48;
  }
  if (self->_viewportCenterCountryCode)
  {
    objc_msgSend(v48, "setViewportCenterCountryCode:");
    long long v46 = v48;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v112 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  os_unfair_lock_lock(&self->_readerLock);
  reader = self->_reader;
  if (reader)
  {
    unint64_t v7 = reader;
    objc_sync_enter(v7);
    if ((*((char *)&self->_flags + 8) & 0x8000000000000000) == 0)
    {
      *(void *)((char *)self->_reader + (int)*MEMORY[0x1E4F940E0]) = self->_readerMarkLength;
      [(PBDataReader *)self->_reader seekToOffset:self->_readerMarkPos];
      GEOPlaceSearchRequestReadAllFrom(v5, self->_reader, 0);
      os_unfair_lock_unlock(&self->_readerLock);
      id v8 = (id)v5;
      objc_sync_exit(v7);

      goto LABEL_93;
    }
    objc_sync_exit(v7);
  }
  os_unfair_lock_unlock(&self->_readerLock);
  [(GEOPlaceSearchRequest *)self readAll:0];
  PBRepeatedUInt64Copy();
  id v9 = [(GEOAddress *)self->_address copyWithZone:a3];
  uint64_t v10 = *(void **)(v5 + 120);
  *(void *)(v5 + 120) = v9;

  id v11 = [(GEOLocation *)self->_location copyWithZone:a3];
  unint64_t v12 = *(void **)(v5 + 232);
  *(void *)(v5 + 232) = v11;

  uint64_t v13 = [(NSString *)self->_search copyWithZone:a3];
  uint64_t v14 = *(void **)(v5 + 296);
  *(void *)(v5 + 296) = v13;

  id v15 = [(GEOMapRegion *)self->_mapRegion copyWithZone:a3];
  uint64_t v16 = *(void **)(v5 + 240);
  *(void *)(v5 + 240) = v15;

  PBRepeatedInt32Copy();
  p_uint64_t flags = &self->_flags;
  uint64_t flags = (uint64_t)self->_flags;
  if ((flags & 0x1000000) != 0)
  {
    *(unsigned char *)(v5 + 428) = self->_includePhonetics;
    *(void *)(v5 + 444) |= 0x1000000uLL;
    uint64_t flags = *(void *)p_flags;
    if ((*(void *)p_flags & 0x800) == 0)
    {
LABEL_7:
      if ((flags & 1) == 0) {
        goto LABEL_8;
      }
      goto LABEL_96;
    }
  }
  else if ((flags & 0x800) == 0)
  {
    goto LABEL_7;
  }
  *(_DWORD *)(v5 + 400) = self->_maxResults;
  *(void *)(v5 + 444) |= 0x800uLL;
  uint64_t flags = (uint64_t)self->_flags;
  if ((flags & 1) == 0)
  {
LABEL_8:
    if ((flags & 0x40) == 0) {
      goto LABEL_9;
    }
    goto LABEL_97;
  }
LABEL_96:
  *(GEOSessionID *)(v5 + 96) = self->_sessionGUID;
  *(void *)(v5 + 444) |= 1uLL;
  uint64_t flags = (uint64_t)self->_flags;
  if ((flags & 0x40) == 0)
  {
LABEL_9:
    if ((flags & 0x40000) == 0) {
      goto LABEL_10;
    }
    goto LABEL_98;
  }
LABEL_97:
  *(_DWORD *)(v5 + 380) = self->_businessSortOrder;
  *(void *)(v5 + 444) |= 0x40uLL;
  uint64_t flags = (uint64_t)self->_flags;
  if ((flags & 0x40000) == 0)
  {
LABEL_10:
    if ((flags & 0x20000) == 0) {
      goto LABEL_11;
    }
    goto LABEL_99;
  }
LABEL_98:
  *(unsigned char *)(v5 + 422) = self->_includeBusinessRating;
  *(void *)(v5 + 444) |= 0x40000uLL;
  uint64_t flags = (uint64_t)self->_flags;
  if ((flags & 0x20000) == 0)
  {
LABEL_11:
    if ((flags & 0x400) == 0) {
      goto LABEL_13;
    }
    goto LABEL_12;
  }
LABEL_99:
  *(unsigned char *)(v5 + 421) = self->_includeBusinessCategories;
  *(void *)(v5 + 444) |= 0x20000uLL;
  if ((*(void *)&self->_flags & 0x400) != 0)
  {
LABEL_12:
    *(_DWORD *)(v5 + 396) = self->_maxBusinessReviews;
    *(void *)(v5 + 444) |= 0x400uLL;
  }
LABEL_13:
  long long v106 = 0u;
  long long v107 = 0u;
  long long v104 = 0u;
  long long v105 = 0u;
  uint64_t v19 = self->_filterByBusinessCategorys;
  uint64_t v20 = [(NSMutableArray *)v19 countByEnumeratingWithState:&v104 objects:v111 count:16];
  if (v20)
  {
    uint64_t v21 = *(void *)v105;
    do
    {
      uint64_t v22 = 0;
      do
      {
        if (*(void *)v105 != v21) {
          objc_enumerationMutation(v19);
        }
        uint64_t v23 = (void *)[*(id *)(*((void *)&v104 + 1) + 8 * v22) copyWithZone:a3];
        [(id)v5 addFilterByBusinessCategory:v23];

        ++v22;
      }
      while (v20 != v22);
      uint64_t v20 = [(NSMutableArray *)v19 countByEnumeratingWithState:&v104 objects:v111 count:16];
    }
    while (v20);
  }

  uint64_t v24 = (uint64_t)self->_flags;
  if ((v24 & 0x1000000000) != 0)
  {
    *(unsigned char *)(v5 + 440) = self->_isStrictMapRegion;
    *(void *)(v5 + 444) |= 0x1000000000uLL;
    uint64_t v24 = (uint64_t)self->_flags;
  }
  if ((v24 & 0x20) != 0)
  {
    *(double *)(v5 + 344) = self->_timestamp;
    *(void *)(v5 + 444) |= 0x20uLL;
  }
  uint64_t v25 = [(NSData *)self->_zilchPoints copyWithZone:a3];
  unint64_t v26 = *(void **)(v5 + 360);
  *(void *)(v5 + 360) = v25;

  if ((*(void *)&self->_flags & 0x80000) != 0)
  {
    *(unsigned char *)(v5 + 423) = self->_includeEntryPoints;
    *(void *)(v5 + 444) |= 0x80000uLL;
  }
  id v27 = [(GEOBusinessOptions *)self->_businessOptions copyWithZone:a3];
  id v28 = *(void **)(v5 + 128);
  *(void *)(v5 + 128) = v27;

  uint64_t v29 = &self->_flags;
  uint64_t v30 = (uint64_t)self->_flags;
  if ((v30 & 0x100) != 0)
  {
    *(_DWORD *)(v5 + 388) = self->_localSearchProviderID;
    *(void *)(v5 + 444) |= 0x100uLL;
    uint64_t v30 = *(void *)v29;
    if ((*(void *)v29 & 0x20000000) == 0)
    {
LABEL_28:
      if ((v30 & 0x4000000000) == 0) {
        goto LABEL_30;
      }
      goto LABEL_29;
    }
  }
  else if ((v30 & 0x20000000) == 0)
  {
    goto LABEL_28;
  }
  *(unsigned char *)(v5 + 433) = self->_includeSuggestionsOnly;
  *(void *)(v5 + 444) |= 0x20000000uLL;
  if ((*(void *)&self->_flags & 0x4000000000) != 0)
  {
LABEL_29:
    *(unsigned char *)(v5 + 442) = self->_structuredSearch;
    *(void *)(v5 + 444) |= 0x4000000000uLL;
  }
LABEL_30:
  uint64_t v31 = [(NSString *)self->_suggestionsPrefix copyWithZone:a3];
  unint64_t v32 = *(void **)(v5 + 320);
  *(void *)(v5 + 320) = v31;

  uint64_t v33 = [(NSString *)self->_deviceCountryCode copyWithZone:a3];
  uint64_t v34 = *(void **)(v5 + 144);
  *(void *)(v5 + 144) = v33;

  id v35 = [(GEOLatLng *)self->_deviceLocation copyWithZone:a3];
  unint64_t v36 = *(void **)(v5 + 152);
  *(void *)(v5 + 152) = v35;

  uint64_t v37 = [(NSString *)self->_inputLanguage copyWithZone:a3];
  long long v38 = *(void **)(v5 + 200);
  *(void *)(v5 + 200) = v37;

  uint64_t v39 = [(NSString *)self->_phoneticLocaleIdentifier copyWithZone:a3];
  long long v40 = *(void **)(v5 + 248);
  *(void *)(v5 + 248) = v39;

  long long v41 = &self->_flags;
  uint64_t v42 = (uint64_t)self->_flags;
  if ((v42 & 0x4000) != 0)
  {
    *(_DWORD *)(v5 + 412) = self->_sequenceNumber;
    *(void *)(v5 + 444) |= 0x4000uLL;
    uint64_t v42 = *(void *)v41;
    if ((*(void *)v41 & 0x8000000000) == 0)
    {
LABEL_32:
      if ((v42 & 0x400000000) == 0) {
        goto LABEL_33;
      }
      goto LABEL_106;
    }
  }
  else if ((v42 & 0x8000000000) == 0)
  {
    goto LABEL_32;
  }
  *(unsigned char *)(v5 + 443) = self->_suppressResultsRequiringAttribution;
  *(void *)(v5 + 444) |= 0x8000000000uLL;
  uint64_t v42 = (uint64_t)self->_flags;
  if ((v42 & 0x400000000) == 0)
  {
LABEL_33:
    if ((v42 & 8) == 0) {
      goto LABEL_34;
    }
    goto LABEL_107;
  }
LABEL_106:
  *(unsigned char *)(v5 + 438) = self->_isFromAPI;
  *(void *)(v5 + 444) |= 0x400000000uLL;
  uint64_t v42 = (uint64_t)self->_flags;
  if ((v42 & 8) == 0)
  {
LABEL_34:
    if ((v42 & 0x10) == 0) {
      goto LABEL_35;
    }
    goto LABEL_108;
  }
LABEL_107:
  *(double *)(v5 + 328) = self->_timeSinceMapEnteredForeground;
  *(void *)(v5 + 444) |= 8uLL;
  uint64_t v42 = (uint64_t)self->_flags;
  if ((v42 & 0x10) == 0)
  {
LABEL_35:
    if ((v42 & 0x8000000) == 0) {
      goto LABEL_37;
    }
    goto LABEL_36;
  }
LABEL_108:
  *(double *)(v5 + 336) = self->_timeSinceMapViewportChanged;
  *(void *)(v5 + 444) |= 0x10uLL;
  if ((*(void *)&self->_flags & 0x8000000) != 0)
  {
LABEL_36:
    *(unsigned char *)(v5 + 431) = self->_includeSpokenNames;
    *(void *)(v5 + 444) |= 0x8000000uLL;
  }
LABEL_37:
  uint64_t v43 = [(NSString *)self->_deviceTimeZone copyWithZone:a3];
  unint64_t v44 = *(void **)(v5 + 160);
  *(void *)(v5 + 160) = v43;

  id v45 = [(GEOClientCapabilities *)self->_clientCapabilities copyWithZone:a3];
  long long v46 = *(void **)(v5 + 136);
  *(void *)(v5 + 136) = v45;

  uint64_t v47 = (uint64_t)self->_flags;
  if ((v47 & 0x80000000) != 0)
  {
    *(unsigned char *)(v5 + 435) = self->_includeTravelTime;
    *(void *)(v5 + 444) |= 0x80000000uLL;
    uint64_t v47 = (uint64_t)self->_flags;
  }
  if ((v47 & 0x8000) != 0)
  {
    *(_DWORD *)(v5 + 416) = self->_transportTypeForTravelTimes;
    *(void *)(v5 + 444) |= 0x8000uLL;
  }
  id v48 = [(GEOSuggestionsOptions *)self->_suggestionsOptions copyWithZone:a3];
  long long v49 = *(void **)(v5 + 312);
  *(void *)(v5 + 312) = v48;

  long long v50 = &self->_flags;
  uint64_t v51 = (uint64_t)self->_flags;
  if ((v51 & 0x1000) != 0)
  {
    *(_DWORD *)(v5 + 404) = self->_placeTypeLimit;
    *(void *)(v5 + 444) |= 0x1000uLL;
    uint64_t v51 = *(void *)v50;
    if ((*(void *)v50 & 0x800000000) == 0)
    {
LABEL_43:
      if ((v51 & 0x40000000) == 0) {
        goto LABEL_44;
      }
      goto LABEL_112;
    }
  }
  else if ((v51 & 0x800000000) == 0)
  {
    goto LABEL_43;
  }
  *(unsigned char *)(v5 + 439) = self->_isStrictGeocoding;
  *(void *)(v5 + 444) |= 0x800000000uLL;
  uint64_t v51 = (uint64_t)self->_flags;
  if ((v51 & 0x40000000) == 0)
  {
LABEL_44:
    if ((v51 & 0x4000000) == 0) {
      goto LABEL_46;
    }
    goto LABEL_45;
  }
LABEL_112:
  *(unsigned char *)(v5 + 434) = self->_includeTravelDistance;
  *(void *)(v5 + 444) |= 0x40000000uLL;
  if ((*(void *)&self->_flags & 0x4000000) != 0)
  {
LABEL_45:
    *(unsigned char *)(v5 + 430) = self->_includeRoadAccessPoints;
    *(void *)(v5 + 444) |= 0x4000000uLL;
  }
LABEL_46:
  long long v102 = 0u;
  long long v103 = 0u;
  long long v100 = 0u;
  long long v101 = 0u;
  long long v52 = self->_limitToCountryCodeIso2s;
  uint64_t v53 = [(NSMutableArray *)v52 countByEnumeratingWithState:&v100 objects:v110 count:16];
  if (v53)
  {
    uint64_t v54 = *(void *)v101;
    do
    {
      uint64_t v55 = 0;
      do
      {
        if (*(void *)v101 != v54) {
          objc_enumerationMutation(v52);
        }
        v56 = (void *)[*(id *)(*((void *)&v100 + 1) + 8 * v55) copyWithZone:a3];
        [(id)v5 addLimitToCountryCodeIso2:v56];

        ++v55;
      }
      while (v53 != v55);
      uint64_t v53 = [(NSMutableArray *)v52 countByEnumeratingWithState:&v100 objects:v110 count:16];
    }
    while (v53);
  }

  v57 = &self->_flags;
  uint64_t v58 = (uint64_t)self->_flags;
  if ((v58 & 0x200000000) != 0)
  {
    *(unsigned char *)(v5 + 437) = self->_isCanonicalLocationSearch;
    *(void *)(v5 + 444) |= 0x200000000uLL;
    uint64_t v58 = *(void *)v57;
    if ((*(void *)v57 & 2) == 0)
    {
LABEL_55:
      if ((v58 & 0x2000000) == 0) {
        goto LABEL_56;
      }
      goto LABEL_116;
    }
  }
  else if ((v58 & 2) == 0)
  {
    goto LABEL_55;
  }
  *(void *)(v5 + 184) = self->_geoId;
  *(void *)(v5 + 444) |= 2uLL;
  uint64_t v58 = (uint64_t)self->_flags;
  if ((v58 & 0x2000000) == 0)
  {
LABEL_56:
    if ((v58 & 0x10000) == 0) {
      goto LABEL_58;
    }
    goto LABEL_57;
  }
LABEL_116:
  *(unsigned char *)(v5 + 429) = self->_includeQuads;
  *(void *)(v5 + 444) |= 0x2000000uLL;
  if ((*(void *)&self->_flags & 0x10000) != 0)
  {
LABEL_57:
    *(unsigned char *)(v5 + 420) = self->_excludeAddressInResults;
    *(void *)(v5 + 444) |= 0x10000uLL;
  }
LABEL_58:
  long long v98 = 0u;
  long long v99 = 0u;
  long long v96 = 0u;
  long long v97 = 0u;
  v59 = self->_searchSubstrings;
  uint64_t v60 = [(NSMutableArray *)v59 countByEnumeratingWithState:&v96 objects:v109 count:16];
  if (v60)
  {
    uint64_t v61 = *(void *)v97;
    do
    {
      uint64_t v62 = 0;
      do
      {
        if (*(void *)v97 != v61) {
          objc_enumerationMutation(v59);
        }
        uint64_t v63 = (void *)[*(id *)(*((void *)&v96 + 1) + 8 * v62) copyWithZone:a3];
        [(id)v5 addSearchSubstring:v63];

        ++v62;
      }
      while (v60 != v62);
      uint64_t v60 = [(NSMutableArray *)v59 countByEnumeratingWithState:&v96 objects:v109 count:16];
    }
    while (v60);
  }

  if ((*(void *)&self->_flags & 0x200000) != 0)
  {
    *(unsigned char *)(v5 + 425) = self->_includeGeoId;
    *(void *)(v5 + 444) |= 0x200000uLL;
  }
  uint64_t v64 = [(NSString *)self->_searchContext copyWithZone:a3];
  v65 = *(void **)(v5 + 272);
  *(void *)(v5 + 272) = v64;

  id v66 = [(GEOSearchSubstring *)self->_searchContextSubstring copyWithZone:a3];
  v67 = *(void **)(v5 + 264);
  *(void *)(v5 + 264) = v66;

  if ((*(void *)&self->_flags & 0x10000000) != 0)
  {
    *(unsigned char *)(v5 + 432) = self->_includeStatusCodeInfo;
    *(void *)(v5 + 444) |= 0x10000000uLL;
  }
  id v68 = [(GEOAddress *)self->_preserveFields copyWithZone:a3];
  id v69 = *(void **)(v5 + 256);
  *(void *)(v5 + 256) = v68;

  if ((*(void *)&self->_flags & 0x100000000) != 0)
  {
    *(unsigned char *)(v5 + 436) = self->_includeUnmatchedStrings;
    *(void *)(v5 + 444) |= 0x100000000uLL;
  }
  id v70 = [(GEOIndexQueryNode *)self->_indexFilter copyWithZone:a3];
  uint64_t v71 = *(void **)(v5 + 192);
  *(void *)(v5 + 192) = v70;

  if ((*(void *)&self->_flags & 0x100000) != 0)
  {
    *(unsigned char *)(v5 + 424) = self->_includeFeatureSets;
    *(void *)(v5 + 444) |= 0x100000uLL;
  }
  long long v94 = 0u;
  long long v95 = 0u;
  long long v92 = 0u;
  long long v93 = 0u;
  v72 = self->_serviceTags;
  uint64_t v73 = [(NSMutableArray *)v72 countByEnumeratingWithState:&v92 objects:v108 count:16];
  if (v73)
  {
    uint64_t v74 = *(void *)v93;
    do
    {
      uint64_t v75 = 0;
      do
      {
        if (*(void *)v93 != v74) {
          objc_enumerationMutation(v72);
        }
        id v76 = objc_msgSend(*(id *)(*((void *)&v92 + 1) + 8 * v75), "copyWithZone:", a3, (void)v92);
        [(id)v5 addServiceTag:v76];

        ++v75;
      }
      while (v73 != v75);
      uint64_t v73 = [(NSMutableArray *)v72 countByEnumeratingWithState:&v92 objects:v108 count:16];
    }
    while (v73);
  }

  if ((*(void *)&self->_flags & 4) != 0)
  {
    *(void *)(v5 + 208) = self->_intersectingGeoId;
    *(void *)(v5 + 444) |= 4uLL;
  }
  id v77 = -[GEOLatLng copyWithZone:](self->_knownLocation, "copyWithZone:", a3, (void)v92);
  uint64_t v78 = *(void **)(v5 + 216);
  *(void *)(v5 + 216) = v77;

  uint64_t v79 = &self->_flags;
  uint64_t v80 = (uint64_t)self->_flags;
  if ((v80 & 0x80) == 0)
  {
    if ((v80 & 0x400000) == 0) {
      goto LABEL_84;
    }
LABEL_119:
    *(unsigned char *)(v5 + 426) = self->_includeMatchedToken;
    *(void *)(v5 + 444) |= 0x400000uLL;
    if ((*(void *)&self->_flags & 0x2000) == 0) {
      goto LABEL_86;
    }
    goto LABEL_85;
  }
  *(_DWORD *)(v5 + 384) = self->_knownAccuracy;
  *(void *)(v5 + 444) |= 0x80uLL;
  uint64_t v80 = *(void *)v79;
  if ((*(void *)v79 & 0x400000) != 0) {
    goto LABEL_119;
  }
LABEL_84:
  if ((v80 & 0x2000) != 0)
  {
LABEL_85:
    *(_DWORD *)(v5 + 408) = self->_searchSource;
    *(void *)(v5 + 444) |= 0x2000uLL;
  }
LABEL_86:
  PBRepeatedInt32Copy();
  id v81 = [(GEOLatLng *)self->_searchLocation copyWithZone:a3];
  id v82 = *(void **)(v5 + 280);
  *(void *)(v5 + 280) = v81;

  if ((*(void *)&self->_flags & 0x800000) != 0)
  {
    *(unsigned char *)(v5 + 427) = self->_includeNameForForwardGeocodingResults;
    *(void *)(v5 + 444) |= 0x800000uLL;
  }
  id v83 = [(GEOAdditionalEnabledMarkets *)self->_additionalEnabledMarkets copyWithZone:a3];
  v84 = *(void **)(v5 + 112);
  *(void *)(v5 + 112) = v83;

  uint64_t v85 = (uint64_t)self->_flags;
  if ((v85 & 0x200) != 0)
  {
    *(_DWORD *)(v5 + 392) = self->_mapMode;
    *(void *)(v5 + 444) |= 0x200uLL;
    uint64_t v85 = (uint64_t)self->_flags;
  }
  if ((v85 & 0x2000000000) != 0)
  {
    *(unsigned char *)(v5 + 441) = self->_isPopularNearbyRequest;
    *(void *)(v5 + 444) |= 0x2000000000uLL;
  }
  uint64_t v86 = [(NSString *)self->_deviceLocationCountryCode copyWithZone:a3];
  uint64_t v87 = *(void **)(v5 + 168);
  *(void *)(v5 + 168) = v86;

  uint64_t v88 = [(NSString *)self->_viewportCenterCountryCode copyWithZone:a3];
  v89 = *(void **)(v5 + 352);
  *(void *)(v5 + 352) = v88;

  objc_storeStrong((id *)(v5 + 16), self->_unknownFields);
  id v90 = (id)v5;
LABEL_93:

  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  unint64_t v4 = (char *)a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_346;
  }
  [(GEOPlaceSearchRequest *)self readAll:1];
  [v4 readAll:1];
  if (!PBRepeatedUInt64IsEqual()) {
    goto LABEL_346;
  }
  address = self->_address;
  if ((unint64_t)address | *((void *)v4 + 15))
  {
    if (!-[GEOAddress isEqual:](address, "isEqual:")) {
      goto LABEL_346;
    }
  }
  locatiouint64_t n = self->_location;
  if ((unint64_t)location | *((void *)v4 + 29))
  {
    if (!-[GEOLocation isEqual:](location, "isEqual:")) {
      goto LABEL_346;
    }
  }
  search = self->_search;
  if ((unint64_t)search | *((void *)v4 + 37))
  {
    if (!-[NSString isEqual:](search, "isEqual:")) {
      goto LABEL_346;
    }
  }
  mapRegiouint64_t n = self->_mapRegion;
  if ((unint64_t)mapRegion | *((void *)v4 + 30))
  {
    if (!-[GEOMapRegion isEqual:](mapRegion, "isEqual:")) {
      goto LABEL_346;
    }
  }
  if (!PBRepeatedInt32IsEqual()) {
    goto LABEL_346;
  }
  uint64_t flags = (uint64_t)self->_flags;
  uint64_t v10 = *(void *)(v4 + 444);
  if ((flags & 0x1000000) != 0)
  {
    if ((v10 & 0x1000000) == 0) {
      goto LABEL_346;
    }
    if (self->_includePhonetics)
    {
      if (!v4[428]) {
        goto LABEL_346;
      }
    }
    else if (v4[428])
    {
      goto LABEL_346;
    }
  }
  else if ((v10 & 0x1000000) != 0)
  {
    goto LABEL_346;
  }
  if ((flags & 0x800) != 0)
  {
    if ((v10 & 0x800) == 0 || self->_maxResults != *((_DWORD *)v4 + 100)) {
      goto LABEL_346;
    }
  }
  else if ((v10 & 0x800) != 0)
  {
    goto LABEL_346;
  }
  if (flags & 1) != 0 && (v10)
  {
    if (self->_sessionGUID._high != *((void *)v4 + 12) || self->_sessionGUID._low != *((void *)v4 + 13)) {
      goto LABEL_346;
    }
  }
  else if ((flags | v10))
  {
    goto LABEL_346;
  }
  if ((flags & 0x40) != 0)
  {
    if ((v10 & 0x40) == 0 || self->_businessSortOrder != *((_DWORD *)v4 + 95)) {
      goto LABEL_346;
    }
  }
  else if ((v10 & 0x40) != 0)
  {
    goto LABEL_346;
  }
  if ((flags & 0x40000) != 0)
  {
    if ((v10 & 0x40000) == 0) {
      goto LABEL_346;
    }
    if (self->_includeBusinessRating)
    {
      if (!v4[422]) {
        goto LABEL_346;
      }
    }
    else if (v4[422])
    {
      goto LABEL_346;
    }
  }
  else if ((v10 & 0x40000) != 0)
  {
    goto LABEL_346;
  }
  if ((flags & 0x20000) != 0)
  {
    if ((v10 & 0x20000) == 0) {
      goto LABEL_346;
    }
    if (self->_includeBusinessCategories)
    {
      if (!v4[421]) {
        goto LABEL_346;
      }
    }
    else if (v4[421])
    {
      goto LABEL_346;
    }
  }
  else if ((v10 & 0x20000) != 0)
  {
    goto LABEL_346;
  }
  if ((flags & 0x400) != 0)
  {
    if ((v10 & 0x400) == 0 || self->_maxBusinessReviews != *((_DWORD *)v4 + 99)) {
      goto LABEL_346;
    }
  }
  else if ((v10 & 0x400) != 0)
  {
    goto LABEL_346;
  }
  filterByBusinessCategorys = self->_filterByBusinessCategorys;
  if ((unint64_t)filterByBusinessCategorys | *((void *)v4 + 22))
  {
    if (!-[NSMutableArray isEqual:](filterByBusinessCategorys, "isEqual:")) {
      goto LABEL_346;
    }
    uint64_t flags = (uint64_t)self->_flags;
    uint64_t v10 = *(void *)(v4 + 444);
  }
  if ((flags & 0x1000000000) != 0)
  {
    if ((v10 & 0x1000000000) == 0) {
      goto LABEL_346;
    }
    if (self->_isStrictMapRegion)
    {
      if (!v4[440]) {
        goto LABEL_346;
      }
    }
    else if (v4[440])
    {
      goto LABEL_346;
    }
  }
  else if ((v10 & 0x1000000000) != 0)
  {
    goto LABEL_346;
  }
  if ((flags & 0x20) != 0)
  {
    if ((v10 & 0x20) == 0 || self->_timestamp != *((double *)v4 + 43)) {
      goto LABEL_346;
    }
  }
  else if ((v10 & 0x20) != 0)
  {
    goto LABEL_346;
  }
  zilchPoints = self->_zilchPoints;
  if ((unint64_t)zilchPoints | *((void *)v4 + 45))
  {
    if (!-[NSData isEqual:](zilchPoints, "isEqual:")) {
      goto LABEL_346;
    }
    uint64_t flags = (uint64_t)self->_flags;
    uint64_t v10 = *(void *)(v4 + 444);
  }
  if ((flags & 0x80000) != 0)
  {
    if ((v10 & 0x80000) == 0) {
      goto LABEL_346;
    }
    if (self->_includeEntryPoints)
    {
      if (!v4[423]) {
        goto LABEL_346;
      }
    }
    else if (v4[423])
    {
      goto LABEL_346;
    }
  }
  else if ((v10 & 0x80000) != 0)
  {
    goto LABEL_346;
  }
  businessOptions = self->_businessOptions;
  if ((unint64_t)businessOptions | *((void *)v4 + 16))
  {
    if (!-[GEOBusinessOptions isEqual:](businessOptions, "isEqual:")) {
      goto LABEL_346;
    }
    uint64_t flags = (uint64_t)self->_flags;
    uint64_t v10 = *(void *)(v4 + 444);
  }
  if ((flags & 0x100) != 0)
  {
    if ((v10 & 0x100) == 0 || self->_localSearchProviderID != *((_DWORD *)v4 + 97)) {
      goto LABEL_346;
    }
  }
  else if ((v10 & 0x100) != 0)
  {
    goto LABEL_346;
  }
  if ((flags & 0x20000000) != 0)
  {
    if ((v10 & 0x20000000) == 0) {
      goto LABEL_346;
    }
    if (self->_includeSuggestionsOnly)
    {
      if (!v4[433]) {
        goto LABEL_346;
      }
    }
    else if (v4[433])
    {
      goto LABEL_346;
    }
  }
  else if ((v10 & 0x20000000) != 0)
  {
    goto LABEL_346;
  }
  if ((flags & 0x4000000000) != 0)
  {
    if ((v10 & 0x4000000000) == 0) {
      goto LABEL_346;
    }
    if (self->_structuredSearch)
    {
      if (!v4[442]) {
        goto LABEL_346;
      }
    }
    else if (v4[442])
    {
      goto LABEL_346;
    }
  }
  else if ((v10 & 0x4000000000) != 0)
  {
    goto LABEL_346;
  }
  suggestionsPrefix = self->_suggestionsPrefix;
  if ((unint64_t)suggestionsPrefix | *((void *)v4 + 40)
    && !-[NSString isEqual:](suggestionsPrefix, "isEqual:"))
  {
    goto LABEL_346;
  }
  deviceCountryCode = self->_deviceCountryCode;
  if ((unint64_t)deviceCountryCode | *((void *)v4 + 18))
  {
    if (!-[NSString isEqual:](deviceCountryCode, "isEqual:")) {
      goto LABEL_346;
    }
  }
  deviceLocatiouint64_t n = self->_deviceLocation;
  if ((unint64_t)deviceLocation | *((void *)v4 + 19))
  {
    if (!-[GEOLatLng isEqual:](deviceLocation, "isEqual:")) {
      goto LABEL_346;
    }
  }
  inputLanguage = self->_inputLanguage;
  if ((unint64_t)inputLanguage | *((void *)v4 + 25))
  {
    if (!-[NSString isEqual:](inputLanguage, "isEqual:")) {
      goto LABEL_346;
    }
  }
  phoneticLocaleIdentifier = self->_phoneticLocaleIdentifier;
  if ((unint64_t)phoneticLocaleIdentifier | *((void *)v4 + 31))
  {
    if (!-[NSString isEqual:](phoneticLocaleIdentifier, "isEqual:")) {
      goto LABEL_346;
    }
  }
  uint64_t v20 = (uint64_t)self->_flags;
  uint64_t v21 = *(void *)(v4 + 444);
  if ((v20 & 0x4000) != 0)
  {
    if ((v21 & 0x4000) == 0 || self->_sequenceNumber != *((_DWORD *)v4 + 103)) {
      goto LABEL_346;
    }
  }
  else if ((v21 & 0x4000) != 0)
  {
    goto LABEL_346;
  }
  if ((v20 & 0x8000000000) != 0)
  {
    if ((v21 & 0x8000000000) == 0) {
      goto LABEL_346;
    }
    if (self->_suppressResultsRequiringAttribution)
    {
      if (!v4[443]) {
        goto LABEL_346;
      }
    }
    else if (v4[443])
    {
      goto LABEL_346;
    }
  }
  else if ((v21 & 0x8000000000) != 0)
  {
    goto LABEL_346;
  }
  if ((v20 & 0x400000000) != 0)
  {
    if ((v21 & 0x400000000) == 0) {
      goto LABEL_346;
    }
    if (self->_isFromAPI)
    {
      if (!v4[438]) {
        goto LABEL_346;
      }
    }
    else if (v4[438])
    {
      goto LABEL_346;
    }
  }
  else if ((v21 & 0x400000000) != 0)
  {
    goto LABEL_346;
  }
  if ((v20 & 8) != 0)
  {
    if ((v21 & 8) == 0 || self->_timeSinceMapEnteredForeground != *((double *)v4 + 41)) {
      goto LABEL_346;
    }
  }
  else if ((v21 & 8) != 0)
  {
    goto LABEL_346;
  }
  if ((v20 & 0x10) != 0)
  {
    if ((v21 & 0x10) == 0 || self->_timeSinceMapViewportChanged != *((double *)v4 + 42)) {
      goto LABEL_346;
    }
  }
  else if ((v21 & 0x10) != 0)
  {
    goto LABEL_346;
  }
  if ((v20 & 0x8000000) != 0)
  {
    if ((v21 & 0x8000000) == 0) {
      goto LABEL_346;
    }
    if (self->_includeSpokenNames)
    {
      if (!v4[431]) {
        goto LABEL_346;
      }
    }
    else if (v4[431])
    {
      goto LABEL_346;
    }
  }
  else if ((v21 & 0x8000000) != 0)
  {
    goto LABEL_346;
  }
  deviceTimeZone = self->_deviceTimeZone;
  if ((unint64_t)deviceTimeZone | *((void *)v4 + 20)
    && !-[NSString isEqual:](deviceTimeZone, "isEqual:"))
  {
    goto LABEL_346;
  }
  clientCapabilities = self->_clientCapabilities;
  if ((unint64_t)clientCapabilities | *((void *)v4 + 17))
  {
    if (!-[GEOClientCapabilities isEqual:](clientCapabilities, "isEqual:")) {
      goto LABEL_346;
    }
  }
  uint64_t v24 = (uint64_t)self->_flags;
  uint64_t v25 = *(void *)(v4 + 444);
  if ((v24 & 0x80000000) != 0)
  {
    if ((v25 & 0x80000000) == 0) {
      goto LABEL_346;
    }
    if (self->_includeTravelTime)
    {
      if (!v4[435]) {
        goto LABEL_346;
      }
    }
    else if (v4[435])
    {
      goto LABEL_346;
    }
  }
  else if ((v25 & 0x80000000) != 0)
  {
    goto LABEL_346;
  }
  if ((v24 & 0x8000) != 0)
  {
    if ((v25 & 0x8000) == 0 || self->_transportTypeForTravelTimes != *((_DWORD *)v4 + 104)) {
      goto LABEL_346;
    }
  }
  else if ((v25 & 0x8000) != 0)
  {
    goto LABEL_346;
  }
  suggestionsOptions = self->_suggestionsOptions;
  if ((unint64_t)suggestionsOptions | *((void *)v4 + 39))
  {
    if (!-[GEOSuggestionsOptions isEqual:](suggestionsOptions, "isEqual:")) {
      goto LABEL_346;
    }
    uint64_t v24 = (uint64_t)self->_flags;
    uint64_t v25 = *(void *)(v4 + 444);
  }
  if ((v24 & 0x1000) != 0)
  {
    if ((v25 & 0x1000) == 0 || self->_placeTypeLimit != *((_DWORD *)v4 + 101)) {
      goto LABEL_346;
    }
  }
  else if ((v25 & 0x1000) != 0)
  {
    goto LABEL_346;
  }
  if ((v24 & 0x800000000) != 0)
  {
    if ((v25 & 0x800000000) == 0) {
      goto LABEL_346;
    }
    if (self->_isStrictGeocoding)
    {
      if (!v4[439]) {
        goto LABEL_346;
      }
    }
    else if (v4[439])
    {
      goto LABEL_346;
    }
  }
  else if ((v25 & 0x800000000) != 0)
  {
    goto LABEL_346;
  }
  if ((v24 & 0x40000000) != 0)
  {
    if ((v25 & 0x40000000) == 0) {
      goto LABEL_346;
    }
    if (self->_includeTravelDistance)
    {
      if (!v4[434]) {
        goto LABEL_346;
      }
    }
    else if (v4[434])
    {
      goto LABEL_346;
    }
  }
  else if ((v25 & 0x40000000) != 0)
  {
    goto LABEL_346;
  }
  if ((v24 & 0x4000000) != 0)
  {
    if ((v25 & 0x4000000) == 0) {
      goto LABEL_346;
    }
    if (self->_includeRoadAccessPoints)
    {
      if (!v4[430]) {
        goto LABEL_346;
      }
    }
    else if (v4[430])
    {
      goto LABEL_346;
    }
  }
  else if ((v25 & 0x4000000) != 0)
  {
    goto LABEL_346;
  }
  limitToCountryCodeIso2s = self->_limitToCountryCodeIso2s;
  if ((unint64_t)limitToCountryCodeIso2s | *((void *)v4 + 28))
  {
    if (!-[NSMutableArray isEqual:](limitToCountryCodeIso2s, "isEqual:")) {
      goto LABEL_346;
    }
    uint64_t v24 = (uint64_t)self->_flags;
    uint64_t v25 = *(void *)(v4 + 444);
  }
  if ((v24 & 0x200000000) != 0)
  {
    if ((v25 & 0x200000000) == 0) {
      goto LABEL_346;
    }
    if (self->_isCanonicalLocationSearch)
    {
      if (!v4[437]) {
        goto LABEL_346;
      }
    }
    else if (v4[437])
    {
      goto LABEL_346;
    }
  }
  else if ((v25 & 0x200000000) != 0)
  {
    goto LABEL_346;
  }
  if ((v24 & 2) != 0)
  {
    if ((v25 & 2) == 0 || self->_geoId != *((void *)v4 + 23)) {
      goto LABEL_346;
    }
  }
  else if ((v25 & 2) != 0)
  {
    goto LABEL_346;
  }
  if ((v24 & 0x2000000) != 0)
  {
    if ((v25 & 0x2000000) == 0) {
      goto LABEL_346;
    }
    if (self->_includeQuads)
    {
      if (!v4[429]) {
        goto LABEL_346;
      }
    }
    else if (v4[429])
    {
      goto LABEL_346;
    }
  }
  else if ((v25 & 0x2000000) != 0)
  {
    goto LABEL_346;
  }
  if ((v24 & 0x10000) != 0)
  {
    if ((v25 & 0x10000) == 0) {
      goto LABEL_346;
    }
    if (self->_excludeAddressInResults)
    {
      if (!v4[420]) {
        goto LABEL_346;
      }
    }
    else if (v4[420])
    {
      goto LABEL_346;
    }
  }
  else if ((v25 & 0x10000) != 0)
  {
    goto LABEL_346;
  }
  searchSubstrings = self->_searchSubstrings;
  if ((unint64_t)searchSubstrings | *((void *)v4 + 36))
  {
    if (!-[NSMutableArray isEqual:](searchSubstrings, "isEqual:")) {
      goto LABEL_346;
    }
    uint64_t v24 = (uint64_t)self->_flags;
    uint64_t v25 = *(void *)(v4 + 444);
  }
  if ((v24 & 0x200000) != 0)
  {
    if ((v25 & 0x200000) == 0) {
      goto LABEL_346;
    }
    if (self->_includeGeoId)
    {
      if (!v4[425]) {
        goto LABEL_346;
      }
    }
    else if (v4[425])
    {
      goto LABEL_346;
    }
  }
  else if ((v25 & 0x200000) != 0)
  {
    goto LABEL_346;
  }
  searchContext = self->_searchContext;
  if ((unint64_t)searchContext | *((void *)v4 + 34)
    && !-[NSString isEqual:](searchContext, "isEqual:"))
  {
    goto LABEL_346;
  }
  searchContextSubstring = self->_searchContextSubstring;
  if ((unint64_t)searchContextSubstring | *((void *)v4 + 33))
  {
    if (!-[GEOSearchSubstring isEqual:](searchContextSubstring, "isEqual:")) {
      goto LABEL_346;
    }
  }
  uint64_t v31 = (uint64_t)self->_flags;
  uint64_t v32 = *(void *)(v4 + 444);
  if ((v31 & 0x10000000) != 0)
  {
    if ((v32 & 0x10000000) == 0) {
      goto LABEL_346;
    }
    if (self->_includeStatusCodeInfo)
    {
      if (!v4[432]) {
        goto LABEL_346;
      }
    }
    else if (v4[432])
    {
      goto LABEL_346;
    }
  }
  else if ((v32 & 0x10000000) != 0)
  {
    goto LABEL_346;
  }
  preserveFields = self->_preserveFields;
  if ((unint64_t)preserveFields | *((void *)v4 + 32))
  {
    if (!-[GEOAddress isEqual:](preserveFields, "isEqual:")) {
      goto LABEL_346;
    }
    uint64_t v31 = (uint64_t)self->_flags;
    uint64_t v32 = *(void *)(v4 + 444);
  }
  if ((v31 & 0x100000000) != 0)
  {
    if ((v32 & 0x100000000) == 0) {
      goto LABEL_346;
    }
    if (self->_includeUnmatchedStrings)
    {
      if (!v4[436]) {
        goto LABEL_346;
      }
    }
    else if (v4[436])
    {
      goto LABEL_346;
    }
  }
  else if ((v32 & 0x100000000) != 0)
  {
    goto LABEL_346;
  }
  indexFilter = self->_indexFilter;
  if ((unint64_t)indexFilter | *((void *)v4 + 24))
  {
    if (!-[GEOIndexQueryNode isEqual:](indexFilter, "isEqual:")) {
      goto LABEL_346;
    }
    uint64_t v31 = (uint64_t)self->_flags;
    uint64_t v32 = *(void *)(v4 + 444);
  }
  if ((v31 & 0x100000) != 0)
  {
    if ((v32 & 0x100000) == 0) {
      goto LABEL_346;
    }
    if (self->_includeFeatureSets)
    {
      if (!v4[424]) {
        goto LABEL_346;
      }
    }
    else if (v4[424])
    {
      goto LABEL_346;
    }
  }
  else if ((v32 & 0x100000) != 0)
  {
    goto LABEL_346;
  }
  serviceTags = self->_serviceTags;
  if ((unint64_t)serviceTags | *((void *)v4 + 38))
  {
    if (!-[NSMutableArray isEqual:](serviceTags, "isEqual:")) {
      goto LABEL_346;
    }
    uint64_t v31 = (uint64_t)self->_flags;
    uint64_t v32 = *(void *)(v4 + 444);
  }
  if ((v31 & 4) != 0)
  {
    if ((v32 & 4) == 0 || self->_intersectingGeoId != *((void *)v4 + 26)) {
      goto LABEL_346;
    }
  }
  else if ((v32 & 4) != 0)
  {
    goto LABEL_346;
  }
  knownLocatiouint64_t n = self->_knownLocation;
  if ((unint64_t)knownLocation | *((void *)v4 + 27))
  {
    if (!-[GEOLatLng isEqual:](knownLocation, "isEqual:")) {
      goto LABEL_346;
    }
    uint64_t v31 = (uint64_t)self->_flags;
    uint64_t v32 = *(void *)(v4 + 444);
  }
  if ((v31 & 0x80) != 0)
  {
    if ((v32 & 0x80) == 0 || self->_knownAccuracy != *((_DWORD *)v4 + 96)) {
      goto LABEL_346;
    }
  }
  else if ((v32 & 0x80) != 0)
  {
    goto LABEL_346;
  }
  if ((v31 & 0x400000) != 0)
  {
    if ((v32 & 0x400000) == 0) {
      goto LABEL_346;
    }
    if (self->_includeMatchedToken)
    {
      if (!v4[426]) {
        goto LABEL_346;
      }
    }
    else if (v4[426])
    {
      goto LABEL_346;
    }
  }
  else if ((v32 & 0x400000) != 0)
  {
    goto LABEL_346;
  }
  if ((v31 & 0x2000) != 0)
  {
    if ((v32 & 0x2000) == 0 || self->_searchSource != *((_DWORD *)v4 + 102)) {
      goto LABEL_346;
    }
  }
  else if ((v32 & 0x2000) != 0)
  {
    goto LABEL_346;
  }
  if (!PBRepeatedInt32IsEqual()) {
    goto LABEL_346;
  }
  searchLocatiouint64_t n = self->_searchLocation;
  if ((unint64_t)searchLocation | *((void *)v4 + 35))
  {
    if (!-[GEOLatLng isEqual:](searchLocation, "isEqual:")) {
      goto LABEL_346;
    }
  }
  uint64_t v38 = (uint64_t)self->_flags;
  uint64_t v39 = *(void *)(v4 + 444);
  if ((v38 & 0x800000) != 0)
  {
    if ((v39 & 0x800000) == 0) {
      goto LABEL_346;
    }
    if (self->_includeNameForForwardGeocodingResults)
    {
      if (!v4[427]) {
        goto LABEL_346;
      }
    }
    else if (v4[427])
    {
      goto LABEL_346;
    }
  }
  else if ((v39 & 0x800000) != 0)
  {
    goto LABEL_346;
  }
  additionalEnabledMarkets = self->_additionalEnabledMarkets;
  if ((unint64_t)additionalEnabledMarkets | *((void *)v4 + 14))
  {
    if (!-[GEOAdditionalEnabledMarkets isEqual:](additionalEnabledMarkets, "isEqual:")) {
      goto LABEL_346;
    }
    uint64_t v38 = (uint64_t)self->_flags;
    uint64_t v39 = *(void *)(v4 + 444);
  }
  if ((v38 & 0x200) != 0)
  {
    if ((v39 & 0x200) == 0 || self->_mapMode != *((_DWORD *)v4 + 98)) {
      goto LABEL_346;
    }
  }
  else if ((v39 & 0x200) != 0)
  {
    goto LABEL_346;
  }
  if ((v38 & 0x2000000000) == 0)
  {
    if ((v39 & 0x2000000000) == 0) {
      goto LABEL_342;
    }
LABEL_346:
    char v43 = 0;
    goto LABEL_347;
  }
  if ((v39 & 0x2000000000) == 0) {
    goto LABEL_346;
  }
  if (self->_isPopularNearbyRequest)
  {
    if (!v4[441]) {
      goto LABEL_346;
    }
  }
  else if (v4[441])
  {
    goto LABEL_346;
  }
LABEL_342:
  deviceLocationCountryCode = self->_deviceLocationCountryCode;
  if ((unint64_t)deviceLocationCountryCode | *((void *)v4 + 21)
    && !-[NSString isEqual:](deviceLocationCountryCode, "isEqual:"))
  {
    goto LABEL_346;
  }
  viewportCenterCountryCode = self->_viewportCenterCountryCode;
  if ((unint64_t)viewportCenterCountryCode | *((void *)v4 + 44)) {
    char v43 = -[NSString isEqual:](viewportCenterCountryCode, "isEqual:");
  }
  else {
    char v43 = 1;
  }
LABEL_347:

  return v43;
}

- (unint64_t)hash
{
  [(GEOPlaceSearchRequest *)self readAll:1];
  uint64_t v95 = PBRepeatedUInt64Hash();
  unint64_t v94 = [(GEOAddress *)self->_address hash];
  unint64_t v93 = [(GEOLocation *)self->_location hash];
  NSUInteger v92 = [(NSString *)self->_search hash];
  unint64_t v91 = [(GEOMapRegion *)self->_mapRegion hash];
  uint64_t v90 = PBRepeatedInt32Hash();
  uint64_t flags = (uint64_t)self->_flags;
  if ((flags & 0x1000000) != 0)
  {
    uint64_t v89 = 2654435761 * self->_includePhonetics;
    if ((flags & 0x800) != 0)
    {
LABEL_3:
      uint64_t v88 = 2654435761 * self->_maxResults;
      if (flags) {
        goto LABEL_4;
      }
      goto LABEL_11;
    }
  }
  else
  {
    uint64_t v89 = 0;
    if ((flags & 0x800) != 0) {
      goto LABEL_3;
    }
  }
  uint64_t v88 = 0;
  if (flags)
  {
LABEL_4:
    uint64_t v87 = PBHashBytes();
    uint64_t flags = (uint64_t)self->_flags;
    if ((flags & 0x40) != 0) {
      goto LABEL_5;
    }
    goto LABEL_12;
  }
LABEL_11:
  uint64_t v87 = 0;
  if ((flags & 0x40) != 0)
  {
LABEL_5:
    uint64_t v86 = 2654435761 * self->_businessSortOrder;
    if ((flags & 0x40000) != 0) {
      goto LABEL_6;
    }
    goto LABEL_13;
  }
LABEL_12:
  uint64_t v86 = 0;
  if ((flags & 0x40000) != 0)
  {
LABEL_6:
    uint64_t v85 = 2654435761 * self->_includeBusinessRating;
    if ((flags & 0x20000) != 0) {
      goto LABEL_7;
    }
LABEL_14:
    uint64_t v84 = 0;
    if ((flags & 0x400) != 0) {
      goto LABEL_8;
    }
    goto LABEL_15;
  }
LABEL_13:
  uint64_t v85 = 0;
  if ((flags & 0x20000) == 0) {
    goto LABEL_14;
  }
LABEL_7:
  uint64_t v84 = 2654435761 * self->_includeBusinessCategories;
  if ((flags & 0x400) != 0)
  {
LABEL_8:
    uint64_t v83 = 2654435761 * self->_maxBusinessReviews;
    goto LABEL_16;
  }
LABEL_15:
  uint64_t v83 = 0;
LABEL_16:
  uint64_t v82 = [(NSMutableArray *)self->_filterByBusinessCategorys hash];
  uint64_t v4 = (uint64_t)self->_flags;
  if ((v4 & 0x1000000000) != 0)
  {
    uint64_t v81 = 2654435761 * self->_isStrictMapRegion;
    if ((v4 & 0x20) != 0) {
      goto LABEL_18;
    }
LABEL_23:
    unint64_t v9 = 0;
    goto LABEL_26;
  }
  uint64_t v81 = 0;
  if ((v4 & 0x20) == 0) {
    goto LABEL_23;
  }
LABEL_18:
  double timestamp = self->_timestamp;
  double v6 = -timestamp;
  if (timestamp >= 0.0) {
    double v6 = self->_timestamp;
  }
  long double v7 = floor(v6 + 0.5);
  double v8 = (v6 - v7) * 1.84467441e19;
  unint64_t v9 = 2654435761u * (unint64_t)fmod(v7, 1.84467441e19);
  if (v8 >= 0.0)
  {
    if (v8 > 0.0) {
      v9 += (unint64_t)v8;
    }
  }
  else
  {
    v9 -= (unint64_t)fabs(v8);
  }
LABEL_26:
  unint64_t v80 = v9;
  uint64_t v79 = [(NSData *)self->_zilchPoints hash];
  if ((*(void *)&self->_flags & 0x80000) != 0) {
    uint64_t v78 = 2654435761 * self->_includeEntryPoints;
  }
  else {
    uint64_t v78 = 0;
  }
  unint64_t v77 = [(GEOBusinessOptions *)self->_businessOptions hash];
  uint64_t v10 = (uint64_t)self->_flags;
  if ((v10 & 0x100) == 0)
  {
    uint64_t v76 = 0;
    if ((v10 & 0x20000000) != 0) {
      goto LABEL_31;
    }
LABEL_34:
    uint64_t v75 = 0;
    if ((v10 & 0x4000000000) != 0) {
      goto LABEL_32;
    }
    goto LABEL_35;
  }
  uint64_t v76 = 2654435761 * self->_localSearchProviderID;
  if ((v10 & 0x20000000) == 0) {
    goto LABEL_34;
  }
LABEL_31:
  uint64_t v75 = 2654435761 * self->_includeSuggestionsOnly;
  if ((v10 & 0x4000000000) != 0)
  {
LABEL_32:
    uint64_t v74 = 2654435761 * self->_structuredSearch;
    goto LABEL_36;
  }
LABEL_35:
  uint64_t v74 = 0;
LABEL_36:
  NSUInteger v73 = [(NSString *)self->_suggestionsPrefix hash];
  NSUInteger v72 = [(NSString *)self->_deviceCountryCode hash];
  unint64_t v71 = [(GEOLatLng *)self->_deviceLocation hash];
  NSUInteger v70 = [(NSString *)self->_inputLanguage hash];
  NSUInteger v69 = [(NSString *)self->_phoneticLocaleIdentifier hash];
  uint64_t v11 = (uint64_t)self->_flags;
  if ((v11 & 0x4000) != 0)
  {
    uint64_t v68 = 2654435761 * self->_sequenceNumber;
    if ((v11 & 0x8000000000) != 0)
    {
LABEL_38:
      uint64_t v67 = 2654435761 * self->_suppressResultsRequiringAttribution;
      if ((v11 & 0x400000000) != 0) {
        goto LABEL_39;
      }
LABEL_46:
      uint64_t v66 = 0;
      if ((v11 & 8) != 0) {
        goto LABEL_40;
      }
LABEL_47:
      unint64_t v16 = 0;
      goto LABEL_50;
    }
  }
  else
  {
    uint64_t v68 = 0;
    if ((v11 & 0x8000000000) != 0) {
      goto LABEL_38;
    }
  }
  uint64_t v67 = 0;
  if ((v11 & 0x400000000) == 0) {
    goto LABEL_46;
  }
LABEL_39:
  uint64_t v66 = 2654435761 * self->_isFromAPI;
  if ((v11 & 8) == 0) {
    goto LABEL_47;
  }
LABEL_40:
  double timeSinceMapEnteredForeground = self->_timeSinceMapEnteredForeground;
  double v13 = -timeSinceMapEnteredForeground;
  if (timeSinceMapEnteredForeground >= 0.0) {
    double v13 = self->_timeSinceMapEnteredForeground;
  }
  long double v14 = floor(v13 + 0.5);
  double v15 = (v13 - v14) * 1.84467441e19;
  unint64_t v16 = 2654435761u * (unint64_t)fmod(v14, 1.84467441e19);
  if (v15 >= 0.0)
  {
    if (v15 > 0.0) {
      v16 += (unint64_t)v15;
    }
  }
  else
  {
    v16 -= (unint64_t)fabs(v15);
  }
LABEL_50:
  if ((v11 & 0x10) != 0)
  {
    double timeSinceMapViewportChanged = self->_timeSinceMapViewportChanged;
    double v19 = -timeSinceMapViewportChanged;
    if (timeSinceMapViewportChanged >= 0.0) {
      double v19 = self->_timeSinceMapViewportChanged;
    }
    long double v20 = floor(v19 + 0.5);
    double v21 = (v19 - v20) * 1.84467441e19;
    unint64_t v17 = 2654435761u * (unint64_t)fmod(v20, 1.84467441e19);
    if (v21 >= 0.0)
    {
      if (v21 > 0.0) {
        v17 += (unint64_t)v21;
      }
    }
    else
    {
      v17 -= (unint64_t)fabs(v21);
    }
  }
  else
  {
    unint64_t v17 = 0;
  }
  unint64_t v65 = v17;
  if ((v11 & 0x8000000) != 0) {
    uint64_t v64 = 2654435761 * self->_includeSpokenNames;
  }
  else {
    uint64_t v64 = 0;
  }
  NSUInteger v63 = [(NSString *)self->_deviceTimeZone hash];
  unint64_t v62 = [(GEOClientCapabilities *)self->_clientCapabilities hash];
  uint64_t v22 = (uint64_t)self->_flags;
  if ((v22 & 0x80000000) != 0)
  {
    uint64_t v61 = 2654435761 * self->_includeTravelTime;
    if ((v22 & 0x8000) != 0) {
      goto LABEL_63;
    }
  }
  else
  {
    uint64_t v61 = 0;
    if ((v22 & 0x8000) != 0)
    {
LABEL_63:
      uint64_t v60 = 2654435761 * self->_transportTypeForTravelTimes;
      goto LABEL_66;
    }
  }
  uint64_t v60 = 0;
LABEL_66:
  unint64_t v59 = [(GEOSuggestionsOptions *)self->_suggestionsOptions hash];
  uint64_t v23 = (uint64_t)self->_flags;
  if ((v23 & 0x1000) != 0)
  {
    uint64_t v58 = 2654435761 * self->_placeTypeLimit;
    if ((v23 & 0x800000000) != 0)
    {
LABEL_68:
      uint64_t v57 = 2654435761 * self->_isStrictGeocoding;
      if ((v23 & 0x40000000) != 0) {
        goto LABEL_69;
      }
LABEL_73:
      uint64_t v56 = 0;
      if ((v23 & 0x4000000) != 0) {
        goto LABEL_70;
      }
      goto LABEL_74;
    }
  }
  else
  {
    uint64_t v58 = 0;
    if ((v23 & 0x800000000) != 0) {
      goto LABEL_68;
    }
  }
  uint64_t v57 = 0;
  if ((v23 & 0x40000000) == 0) {
    goto LABEL_73;
  }
LABEL_69:
  uint64_t v56 = 2654435761 * self->_includeTravelDistance;
  if ((v23 & 0x4000000) != 0)
  {
LABEL_70:
    uint64_t v55 = 2654435761 * self->_includeRoadAccessPoints;
    goto LABEL_75;
  }
LABEL_74:
  uint64_t v55 = 0;
LABEL_75:
  uint64_t v54 = [(NSMutableArray *)self->_limitToCountryCodeIso2s hash];
  uint64_t v24 = (uint64_t)self->_flags;
  if ((v24 & 0x200000000) != 0)
  {
    uint64_t v53 = 2654435761 * self->_isCanonicalLocationSearch;
    if ((v24 & 2) != 0)
    {
LABEL_77:
      uint64_t v52 = 2654435761 * self->_geoId;
      if ((v24 & 0x2000000) != 0) {
        goto LABEL_78;
      }
LABEL_82:
      uint64_t v51 = 0;
      if ((v24 & 0x10000) != 0) {
        goto LABEL_79;
      }
      goto LABEL_83;
    }
  }
  else
  {
    uint64_t v53 = 0;
    if ((v24 & 2) != 0) {
      goto LABEL_77;
    }
  }
  uint64_t v52 = 0;
  if ((v24 & 0x2000000) == 0) {
    goto LABEL_82;
  }
LABEL_78:
  uint64_t v51 = 2654435761 * self->_includeQuads;
  if ((v24 & 0x10000) != 0)
  {
LABEL_79:
    uint64_t v50 = 2654435761 * self->_excludeAddressInResults;
    goto LABEL_84;
  }
LABEL_83:
  uint64_t v50 = 0;
LABEL_84:
  uint64_t v49 = [(NSMutableArray *)self->_searchSubstrings hash];
  if ((*(void *)&self->_flags & 0x200000) != 0) {
    uint64_t v48 = 2654435761 * self->_includeGeoId;
  }
  else {
    uint64_t v48 = 0;
  }
  NSUInteger v47 = [(NSString *)self->_searchContext hash];
  unint64_t v46 = [(GEOSearchSubstring *)self->_searchContextSubstring hash];
  if ((*(void *)&self->_flags & 0x10000000) != 0) {
    uint64_t v45 = 2654435761 * self->_includeStatusCodeInfo;
  }
  else {
    uint64_t v45 = 0;
  }
  unint64_t v44 = [(GEOAddress *)self->_preserveFields hash];
  if ((*(void *)&self->_flags & 0x100000000) != 0) {
    uint64_t v43 = 2654435761 * self->_includeUnmatchedStrings;
  }
  else {
    uint64_t v43 = 0;
  }
  unint64_t v42 = [(GEOIndexQueryNode *)self->_indexFilter hash];
  if ((*(void *)&self->_flags & 0x100000) != 0) {
    uint64_t v41 = 2654435761 * self->_includeFeatureSets;
  }
  else {
    uint64_t v41 = 0;
  }
  uint64_t v40 = [(NSMutableArray *)self->_serviceTags hash];
  if ((*(void *)&self->_flags & 4) != 0) {
    unint64_t v39 = 2654435761u * self->_intersectingGeoId;
  }
  else {
    unint64_t v39 = 0;
  }
  unint64_t v38 = [(GEOLatLng *)self->_knownLocation hash];
  uint64_t v25 = (uint64_t)self->_flags;
  if ((v25 & 0x80) == 0)
  {
    uint64_t v26 = 0;
    if ((v25 & 0x400000) != 0) {
      goto LABEL_101;
    }
LABEL_104:
    uint64_t v27 = 0;
    if ((v25 & 0x2000) != 0) {
      goto LABEL_102;
    }
    goto LABEL_105;
  }
  uint64_t v26 = 2654435761 * self->_knownAccuracy;
  if ((v25 & 0x400000) == 0) {
    goto LABEL_104;
  }
LABEL_101:
  uint64_t v27 = 2654435761 * self->_includeMatchedToken;
  if ((v25 & 0x2000) != 0)
  {
LABEL_102:
    uint64_t v28 = 2654435761 * self->_searchSource;
    goto LABEL_106;
  }
LABEL_105:
  uint64_t v28 = 0;
LABEL_106:
  uint64_t v29 = PBRepeatedInt32Hash();
  unint64_t v30 = [(GEOLatLng *)self->_searchLocation hash];
  if ((*(void *)&self->_flags & 0x800000) != 0) {
    uint64_t v31 = 2654435761 * self->_includeNameForForwardGeocodingResults;
  }
  else {
    uint64_t v31 = 0;
  }
  unint64_t v32 = [(GEOAdditionalEnabledMarkets *)self->_additionalEnabledMarkets hash];
  uint64_t v33 = (uint64_t)self->_flags;
  if ((v33 & 0x200) != 0)
  {
    uint64_t v34 = 2654435761 * self->_mapMode;
    if ((v33 & 0x2000000000) != 0) {
      goto LABEL_111;
    }
LABEL_113:
    uint64_t v35 = 0;
    goto LABEL_114;
  }
  uint64_t v34 = 0;
  if ((v33 & 0x2000000000) == 0) {
    goto LABEL_113;
  }
LABEL_111:
  uint64_t v35 = 2654435761 * self->_isPopularNearbyRequest;
LABEL_114:
  NSUInteger v36 = v26 ^ v27 ^ v28 ^ v29 ^ v30 ^ v31 ^ v32 ^ v34 ^ v35 ^ [(NSString *)self->_deviceLocationCountryCode hash];
  return v94 ^ v95 ^ v93 ^ v92 ^ v91 ^ v90 ^ v89 ^ v88 ^ v87 ^ v86 ^ v85 ^ v84 ^ v83 ^ v82 ^ v81 ^ v80 ^ v79 ^ v78 ^ v77 ^ v76 ^ v75 ^ v74 ^ v73 ^ v72 ^ v71 ^ v70 ^ v69 ^ v68 ^ v67 ^ v66 ^ v16 ^ v65 ^ v64 ^ v63 ^ v62 ^ v61 ^ v60 ^ v59 ^ v58 ^ v57 ^ v56 ^ v55 ^ v54 ^ v53 ^ v52 ^ v51 ^ v50 ^ v49 ^ v48 ^ v47 ^ v46 ^ v45 ^ v44 ^ v43 ^ v42 ^ v41 ^ v40 ^ v39 ^ v38 ^ v36 ^ [(NSString *)self->_viewportCenterCountryCode hash];
}

- (void)mergeFrom:(id)a3
{
  uint64_t v113 = *MEMORY[0x1E4F143B8];
  uint64_t v4 = (char *)a3;
  [v4 readAll:0];
  uint64_t v5 = [v4 businessIDsCount];
  if (v5)
  {
    uint64_t v6 = v5;
    for (uint64_t i = 0; i != v6; ++i)
      -[GEOPlaceSearchRequest addBusinessID:](self, "addBusinessID:", [v4 businessIDAtIndex:i]);
  }
  address = self->_address;
  uint64_t v9 = *((void *)v4 + 15);
  if (address)
  {
    if (v9) {
      -[GEOAddress mergeFrom:](address, "mergeFrom:");
    }
  }
  else if (v9)
  {
    -[GEOPlaceSearchRequest setAddress:](self, "setAddress:");
  }
  locatiouint64_t n = self->_location;
  uint64_t v11 = *((void *)v4 + 29);
  if (location)
  {
    if (v11) {
      -[GEOLocation mergeFrom:](location, "mergeFrom:");
    }
  }
  else if (v11)
  {
    -[GEOPlaceSearchRequest setLocation:](self, "setLocation:");
  }
  if (*((void *)v4 + 37)) {
    -[GEOPlaceSearchRequest setSearch:](self, "setSearch:");
  }
  mapRegiouint64_t n = self->_mapRegion;
  uint64_t v13 = *((void *)v4 + 30);
  if (mapRegion)
  {
    if (v13) {
      -[GEOMapRegion mergeFrom:](mapRegion, "mergeFrom:");
    }
  }
  else if (v13)
  {
    -[GEOPlaceSearchRequest setMapRegion:](self, "setMapRegion:");
  }
  uint64_t v14 = [v4 additionalPlaceTypesCount];
  if (v14)
  {
    uint64_t v15 = v14;
    for (uint64_t j = 0; j != v15; ++j)
      -[GEOPlaceSearchRequest addAdditionalPlaceType:](self, "addAdditionalPlaceType:", [v4 additionalPlaceTypeAtIndex:j]);
  }
  unint64_t v17 = (uint64_t *)(v4 + 444);
  uint64_t v18 = *(void *)(v4 + 444);
  if ((v18 & 0x1000000) != 0)
  {
    self->_includePhonetics = v4[428];
    *(void *)&self->_flags |= 0x1000000uLL;
    uint64_t v18 = *v17;
    if ((*v17 & 0x800) == 0)
    {
LABEL_26:
      if ((v18 & 1) == 0) {
        goto LABEL_27;
      }
      goto LABEL_52;
    }
  }
  else if ((v18 & 0x800) == 0)
  {
    goto LABEL_26;
  }
  self->_maxResults = *((_DWORD *)v4 + 100);
  *(void *)&self->_flags |= 0x800uLL;
  uint64_t v18 = *(void *)(v4 + 444);
  if ((v18 & 1) == 0)
  {
LABEL_27:
    if ((v18 & 0x40) == 0) {
      goto LABEL_28;
    }
    goto LABEL_53;
  }
LABEL_52:
  self->_sessionGUID = (GEOSessionID)*((_OWORD *)v4 + 6);
  *(void *)&self->_flags |= 1uLL;
  uint64_t v18 = *(void *)(v4 + 444);
  if ((v18 & 0x40) == 0)
  {
LABEL_28:
    if ((v18 & 0x40000) == 0) {
      goto LABEL_29;
    }
    goto LABEL_54;
  }
LABEL_53:
  self->_businessSortOrder = *((_DWORD *)v4 + 95);
  *(void *)&self->_flags |= 0x40uLL;
  uint64_t v18 = *(void *)(v4 + 444);
  if ((v18 & 0x40000) == 0)
  {
LABEL_29:
    if ((v18 & 0x20000) == 0) {
      goto LABEL_30;
    }
    goto LABEL_55;
  }
LABEL_54:
  self->_includeBusinessRating = v4[422];
  *(void *)&self->_flags |= 0x40000uLL;
  uint64_t v18 = *(void *)(v4 + 444);
  if ((v18 & 0x20000) == 0)
  {
LABEL_30:
    if ((v18 & 0x400) == 0) {
      goto LABEL_32;
    }
    goto LABEL_31;
  }
LABEL_55:
  self->_includeBusinessCategories = v4[421];
  *(void *)&self->_flags |= 0x20000uLL;
  if ((*(void *)(v4 + 444) & 0x400) != 0)
  {
LABEL_31:
    self->_maxBusinessReviews = *((_DWORD *)v4 + 99);
    *(void *)&self->_flags |= 0x400uLL;
  }
LABEL_32:
  long long v102 = 0u;
  long long v103 = 0u;
  long long v100 = 0u;
  long long v101 = 0u;
  id v19 = *((id *)v4 + 22);
  uint64_t v20 = [v19 countByEnumeratingWithState:&v100 objects:v111 count:16];
  if (v20)
  {
    uint64_t v21 = v20;
    uint64_t v22 = *(void *)v101;
    do
    {
      for (uint64_t k = 0; k != v21; ++k)
      {
        if (*(void *)v101 != v22) {
          objc_enumerationMutation(v19);
        }
        [(GEOPlaceSearchRequest *)self addFilterByBusinessCategory:*(void *)(*((void *)&v100 + 1) + 8 * k)];
      }
      uint64_t v21 = [v19 countByEnumeratingWithState:&v100 objects:v111 count:16];
    }
    while (v21);
  }

  uint64_t v24 = *(void *)(v4 + 444);
  if ((v24 & 0x1000000000) != 0)
  {
    self->_isStrictMapRegiouint64_t n = v4[440];
    *(void *)&self->_flags |= 0x1000000000uLL;
    uint64_t v24 = *(void *)(v4 + 444);
  }
  if ((v24 & 0x20) != 0)
  {
    self->_double timestamp = *((double *)v4 + 43);
    *(void *)&self->_flags |= 0x20uLL;
  }
  if (*((void *)v4 + 45)) {
    -[GEOPlaceSearchRequest setZilchPoints:](self, "setZilchPoints:");
  }
  if ((*(void *)(v4 + 444) & 0x80000) != 0)
  {
    self->_includeEntryPoints = v4[423];
    *(void *)&self->_flags |= 0x80000uLL;
  }
  businessOptions = self->_businessOptions;
  uint64_t v26 = *((void *)v4 + 16);
  if (businessOptions)
  {
    if (v26) {
      -[GEOBusinessOptions mergeFrom:](businessOptions, "mergeFrom:");
    }
  }
  else if (v26)
  {
    -[GEOPlaceSearchRequest setBusinessOptions:](self, "setBusinessOptions:");
  }
  uint64_t v27 = (uint64_t *)(v4 + 444);
  uint64_t v28 = *(void *)(v4 + 444);
  if ((v28 & 0x100) != 0)
  {
    self->_localSearchProviderID = *((_DWORD *)v4 + 97);
    *(void *)&self->_flags |= 0x100uLL;
    uint64_t v28 = *v27;
    if ((*v27 & 0x20000000) == 0)
    {
LABEL_61:
      if ((v28 & 0x4000000000) == 0) {
        goto LABEL_63;
      }
      goto LABEL_62;
    }
  }
  else if ((v28 & 0x20000000) == 0)
  {
    goto LABEL_61;
  }
  self->_includeSuggestionsOnly = v4[433];
  *(void *)&self->_flags |= 0x20000000uLL;
  if ((*(void *)(v4 + 444) & 0x4000000000) != 0)
  {
LABEL_62:
    self->_structuredSearch = v4[442];
    *(void *)&self->_flags |= 0x4000000000uLL;
  }
LABEL_63:
  if (*((void *)v4 + 40)) {
    -[GEOPlaceSearchRequest setSuggestionsPrefix:](self, "setSuggestionsPrefix:");
  }
  if (*((void *)v4 + 18)) {
    -[GEOPlaceSearchRequest setDeviceCountryCode:](self, "setDeviceCountryCode:");
  }
  deviceLocatiouint64_t n = self->_deviceLocation;
  uint64_t v30 = *((void *)v4 + 19);
  if (deviceLocation)
  {
    if (v30) {
      -[GEOLatLng mergeFrom:](deviceLocation, "mergeFrom:");
    }
  }
  else if (v30)
  {
    -[GEOPlaceSearchRequest setDeviceLocation:](self, "setDeviceLocation:");
  }
  if (*((void *)v4 + 25)) {
    -[GEOPlaceSearchRequest setInputLanguage:](self, "setInputLanguage:");
  }
  if (*((void *)v4 + 31)) {
    -[GEOPlaceSearchRequest setPhoneticLocaleIdentifier:](self, "setPhoneticLocaleIdentifier:");
  }
  uint64_t v31 = (uint64_t *)(v4 + 444);
  uint64_t v32 = *(void *)(v4 + 444);
  if ((v32 & 0x4000) != 0)
  {
    self->_sequenceNumber = *((_DWORD *)v4 + 103);
    *(void *)&self->_flags |= 0x4000uLL;
    uint64_t v32 = *v31;
    if ((*v31 & 0x8000000000) == 0)
    {
LABEL_81:
      if ((v32 & 0x400000000) == 0) {
        goto LABEL_82;
      }
      goto LABEL_93;
    }
  }
  else if ((v32 & 0x8000000000) == 0)
  {
    goto LABEL_81;
  }
  self->_suppressResultsRequiringAttributiouint64_t n = v4[443];
  *(void *)&self->_flags |= 0x8000000000uLL;
  uint64_t v32 = *(void *)(v4 + 444);
  if ((v32 & 0x400000000) == 0)
  {
LABEL_82:
    if ((v32 & 8) == 0) {
      goto LABEL_83;
    }
    goto LABEL_94;
  }
LABEL_93:
  self->_isFromAPI = v4[438];
  *(void *)&self->_flags |= 0x400000000uLL;
  uint64_t v32 = *(void *)(v4 + 444);
  if ((v32 & 8) == 0)
  {
LABEL_83:
    if ((v32 & 0x10) == 0) {
      goto LABEL_84;
    }
    goto LABEL_95;
  }
LABEL_94:
  self->_double timeSinceMapEnteredForeground = *((double *)v4 + 41);
  *(void *)&self->_flags |= 8uLL;
  uint64_t v32 = *(void *)(v4 + 444);
  if ((v32 & 0x10) == 0)
  {
LABEL_84:
    if ((v32 & 0x8000000) == 0) {
      goto LABEL_86;
    }
    goto LABEL_85;
  }
LABEL_95:
  self->_double timeSinceMapViewportChanged = *((double *)v4 + 42);
  *(void *)&self->_flags |= 0x10uLL;
  if ((*(void *)(v4 + 444) & 0x8000000) != 0)
  {
LABEL_85:
    self->_includeSpokenNames = v4[431];
    *(void *)&self->_flags |= 0x8000000uLL;
  }
LABEL_86:
  if (*((void *)v4 + 20)) {
    -[GEOPlaceSearchRequest setDeviceTimeZone:](self, "setDeviceTimeZone:");
  }
  clientCapabilities = self->_clientCapabilities;
  uint64_t v34 = *((void *)v4 + 17);
  if (clientCapabilities)
  {
    if (v34) {
      -[GEOClientCapabilities mergeFrom:](clientCapabilities, "mergeFrom:");
    }
  }
  else if (v34)
  {
    -[GEOPlaceSearchRequest setClientCapabilities:](self, "setClientCapabilities:");
  }
  uint64_t v35 = *(void *)(v4 + 444);
  if ((v35 & 0x80000000) != 0)
  {
    self->_includeTravelTime = v4[435];
    *(void *)&self->_flags |= 0x80000000uLL;
    uint64_t v35 = *(void *)(v4 + 444);
  }
  if ((v35 & 0x8000) != 0)
  {
    self->_transportTypeForTravelTimes = *((_DWORD *)v4 + 104);
    *(void *)&self->_flags |= 0x8000uLL;
  }
  suggestionsOptions = self->_suggestionsOptions;
  uint64_t v37 = (void *)*((void *)v4 + 39);
  if (suggestionsOptions)
  {
    if (v37)
    {
      id v38 = v37;
      -[GEOSuggestionsOptions readAll:]((uint64_t)v38, 0);
      char v39 = *((unsigned char *)v38 + 64);
      if ((v39 & 2) != 0)
      {
        suggestionsOptions->_listType = *((_DWORD *)v38 + 14);
        *(unsigned char *)&suggestionsOptions->_flags |= 2u;
        char v39 = *((unsigned char *)v38 + 64);
      }
      if (v39)
      {
        suggestionsOptions->_entriesType = *((_DWORD *)v38 + 13);
        *(unsigned char *)&suggestionsOptions->_flags |= 1u;
      }
      uint64_t v40 = (void *)*((void *)v38 + 4);
      if (v40) {
        -[GEOSuggestionsOptions setSuggestionMetadata:]((uint64_t)suggestionsOptions, v40);
      }
      uint64_t v41 = (void *)*((void *)v38 + 3);
      if (v41) {
        -[GEOSuggestionsOptions setSuggestionEntryMetadata:]((uint64_t)suggestionsOptions, v41);
      }
      char v42 = *((unsigned char *)v38 + 64);
      if ((v42 & 8) != 0)
      {
        suggestionsOptions->_normalizePOIs = *((unsigned char *)v38 + 61);
        *(unsigned char *)&suggestionsOptions->_flags |= 8u;
        char v42 = *((unsigned char *)v38 + 64);
      }
      if ((v42 & 4) != 0)
      {
        suggestionsOptions->_includeRankingFeatures = *((unsigned char *)v38 + 60);
        *(unsigned char *)&suggestionsOptions->_flags |= 4u;
      }
    }
  }
  else if (v37)
  {
    -[GEOPlaceSearchRequest setSuggestionsOptions:](self, "setSuggestionsOptions:");
  }
  uint64_t v43 = (uint64_t *)(v4 + 444);
  uint64_t v44 = *(void *)(v4 + 444);
  if ((v44 & 0x1000) != 0)
  {
    self->_placeTypeLimit = *((_DWORD *)v4 + 101);
    *(void *)&self->_flags |= 0x1000uLL;
    uint64_t v44 = *v43;
    if ((*v43 & 0x800000000) == 0)
    {
LABEL_122:
      if ((v44 & 0x40000000) == 0) {
        goto LABEL_123;
      }
      goto LABEL_153;
    }
  }
  else if ((v44 & 0x800000000) == 0)
  {
    goto LABEL_122;
  }
  self->_isStrictGeocoding = v4[439];
  *(void *)&self->_flags |= 0x800000000uLL;
  uint64_t v44 = *(void *)(v4 + 444);
  if ((v44 & 0x40000000) == 0)
  {
LABEL_123:
    if ((v44 & 0x4000000) == 0) {
      goto LABEL_125;
    }
    goto LABEL_124;
  }
LABEL_153:
  self->_includeTravelDistance = v4[434];
  *(void *)&self->_flags |= 0x40000000uLL;
  if ((*(void *)(v4 + 444) & 0x4000000) != 0)
  {
LABEL_124:
    self->_includeRoadAccessPoints = v4[430];
    *(void *)&self->_flags |= 0x4000000uLL;
  }
LABEL_125:
  long long v98 = 0u;
  long long v99 = 0u;
  long long v96 = 0u;
  long long v97 = 0u;
  id v45 = *((id *)v4 + 28);
  uint64_t v46 = [v45 countByEnumeratingWithState:&v96 objects:v110 count:16];
  if (v46)
  {
    uint64_t v47 = v46;
    uint64_t v48 = *(void *)v97;
    do
    {
      for (uint64_t m = 0; m != v47; ++m)
      {
        if (*(void *)v97 != v48) {
          objc_enumerationMutation(v45);
        }
        [(GEOPlaceSearchRequest *)self addLimitToCountryCodeIso2:*(void *)(*((void *)&v96 + 1) + 8 * m)];
      }
      uint64_t v47 = [v45 countByEnumeratingWithState:&v96 objects:v110 count:16];
    }
    while (v47);
  }

  uint64_t v50 = (uint64_t *)(v4 + 444);
  uint64_t v51 = *(void *)(v4 + 444);
  if ((v51 & 0x200000000) != 0)
  {
    self->_isCanonicalLocationSearch = v4[437];
    *(void *)&self->_flags |= 0x200000000uLL;
    uint64_t v51 = *v50;
    if ((*v50 & 2) == 0)
    {
LABEL_134:
      if ((v51 & 0x2000000) == 0) {
        goto LABEL_135;
      }
      goto LABEL_157;
    }
  }
  else if ((v51 & 2) == 0)
  {
    goto LABEL_134;
  }
  self->_geoId = *((void *)v4 + 23);
  *(void *)&self->_flags |= 2uLL;
  uint64_t v51 = *(void *)(v4 + 444);
  if ((v51 & 0x2000000) == 0)
  {
LABEL_135:
    if ((v51 & 0x10000) == 0) {
      goto LABEL_137;
    }
    goto LABEL_136;
  }
LABEL_157:
  self->_includeQuads = v4[429];
  *(void *)&self->_flags |= 0x2000000uLL;
  if ((*(void *)(v4 + 444) & 0x10000) != 0)
  {
LABEL_136:
    self->_excludeAddressInResults = v4[420];
    *(void *)&self->_flags |= 0x10000uLL;
  }
LABEL_137:
  long long v94 = 0u;
  long long v95 = 0u;
  long long v92 = 0u;
  long long v93 = 0u;
  id v52 = *((id *)v4 + 36);
  uint64_t v53 = [v52 countByEnumeratingWithState:&v92 objects:v109 count:16];
  if (v53)
  {
    uint64_t v54 = v53;
    uint64_t v55 = *(void *)v93;
    do
    {
      for (uint64_t n = 0; n != v54; ++n)
      {
        if (*(void *)v93 != v55) {
          objc_enumerationMutation(v52);
        }
        [(GEOPlaceSearchRequest *)self addSearchSubstring:*(void *)(*((void *)&v92 + 1) + 8 * n)];
      }
      uint64_t v54 = [v52 countByEnumeratingWithState:&v92 objects:v109 count:16];
    }
    while (v54);
  }

  if ((*(void *)(v4 + 444) & 0x200000) != 0)
  {
    self->_includeGeoId = v4[425];
    *(void *)&self->_flags |= 0x200000uLL;
  }
  if (*((void *)v4 + 34)) {
    -[GEOPlaceSearchRequest setSearchContext:](self, "setSearchContext:");
  }
  searchContextSubstring = self->_searchContextSubstring;
  uint64_t v58 = *((void *)v4 + 33);
  if (searchContextSubstring)
  {
    if (v58) {
      -[GEOSearchSubstring mergeFrom:](searchContextSubstring, "mergeFrom:");
    }
  }
  else if (v58)
  {
    -[GEOPlaceSearchRequest setSearchContextSubstring:](self, "setSearchContextSubstring:");
  }
  if ((*(void *)(v4 + 444) & 0x10000000) != 0)
  {
    self->_includeStatusCodeInfo = v4[432];
    *(void *)&self->_flags |= 0x10000000uLL;
  }
  preserveFields = self->_preserveFields;
  uint64_t v60 = *((void *)v4 + 32);
  if (preserveFields)
  {
    if (v60) {
      -[GEOAddress mergeFrom:](preserveFields, "mergeFrom:");
    }
  }
  else if (v60)
  {
    -[GEOPlaceSearchRequest setPreserveFields:](self, "setPreserveFields:");
  }
  if ((*(void *)(v4 + 444) & 0x100000000) != 0)
  {
    self->_includeUnmatchedStrings = v4[436];
    *(void *)&self->_flags |= 0x100000000uLL;
  }
  indexFilter = self->_indexFilter;
  unint64_t v62 = (void *)*((void *)v4 + 24);
  if (indexFilter)
  {
    if (v62)
    {
      id v63 = v62;
      -[GEOIndexQueryNode readAll:]((uint64_t)v63, 0);
      indexFilter->_type = *((_DWORD *)v63 + 15);
      uint64_t v64 = (void *)*((void *)v63 + 3);
      if (v64) {
        -[GEOIndexQueryNode setField:]((uint64_t)indexFilter, v64);
      }
      unint64_t v65 = (void *)*((void *)v63 + 5);
      if (v65) {
        -[GEOIndexQueryNode setValue:]((uint64_t)indexFilter, v65);
      }
      long long v106 = 0u;
      long long v107 = 0u;
      long long v104 = 0u;
      long long v105 = 0u;
      id v66 = *((id *)v63 + 4);
      uint64_t v67 = [v66 countByEnumeratingWithState:&v104 objects:v112 count:16];
      if (v67)
      {
        uint64_t v68 = v67;
        uint64_t v69 = *(void *)v105;
        do
        {
          for (iuint64_t i = 0; ii != v68; ++ii)
          {
            if (*(void *)v105 != v69) {
              objc_enumerationMutation(v66);
            }
            -[GEOIndexQueryNode addOperands:]((uint64_t)indexFilter, *(void **)(*((void *)&v104 + 1) + 8 * ii));
          }
          uint64_t v68 = [v66 countByEnumeratingWithState:&v104 objects:v112 count:16];
        }
        while (v68);
      }
    }
  }
  else if (v62)
  {
    -[GEOPlaceSearchRequest setIndexFilter:](self, "setIndexFilter:");
  }
  if ((*(void *)(v4 + 444) & 0x100000) != 0)
  {
    self->_includeFeatureSets = v4[424];
    *(void *)&self->_flags |= 0x100000uLL;
  }
  long long v90 = 0u;
  long long v91 = 0u;
  long long v88 = 0u;
  long long v89 = 0u;
  id v71 = *((id *)v4 + 38);
  uint64_t v72 = [v71 countByEnumeratingWithState:&v88 objects:v108 count:16];
  if (v72)
  {
    uint64_t v73 = v72;
    uint64_t v74 = *(void *)v89;
    do
    {
      for (juint64_t j = 0; jj != v73; ++jj)
      {
        if (*(void *)v89 != v74) {
          objc_enumerationMutation(v71);
        }
        -[GEOPlaceSearchRequest addServiceTag:](self, "addServiceTag:", *(void *)(*((void *)&v88 + 1) + 8 * jj), (void)v88);
      }
      uint64_t v73 = [v71 countByEnumeratingWithState:&v88 objects:v108 count:16];
    }
    while (v73);
  }

  if ((*(void *)(v4 + 444) & 4) != 0)
  {
    self->_intersectingGeoId = *((void *)v4 + 26);
    *(void *)&self->_flags |= 4uLL;
  }
  knownLocatiouint64_t n = self->_knownLocation;
  uint64_t v77 = *((void *)v4 + 27);
  if (knownLocation)
  {
    if (v77) {
      -[GEOLatLng mergeFrom:](knownLocation, "mergeFrom:");
    }
  }
  else if (v77)
  {
    -[GEOPlaceSearchRequest setKnownLocation:](self, "setKnownLocation:");
  }
  uint64_t v78 = (uint64_t *)(v4 + 444);
  uint64_t v79 = *(void *)(v4 + 444);
  if ((v79 & 0x80) != 0)
  {
    self->_knownAccuracy = *((_DWORD *)v4 + 96);
    *(void *)&self->_flags |= 0x80uLL;
    uint64_t v79 = *v78;
    if ((*v78 & 0x400000) == 0)
    {
LABEL_204:
      if ((v79 & 0x2000) == 0) {
        goto LABEL_206;
      }
      goto LABEL_205;
    }
  }
  else if ((v79 & 0x400000) == 0)
  {
    goto LABEL_204;
  }
  self->_includeMatchedTokeuint64_t n = v4[426];
  *(void *)&self->_flags |= 0x400000uLL;
  if ((*(void *)(v4 + 444) & 0x2000) != 0)
  {
LABEL_205:
    self->_searchSource = *((_DWORD *)v4 + 102);
    *(void *)&self->_flags |= 0x2000uLL;
  }
LABEL_206:
  uint64_t v80 = objc_msgSend(v4, "optionalSuppressionReasonsCount", (void)v88);
  if (v80)
  {
    uint64_t v81 = v80;
    for (kuint64_t k = 0; kk != v81; ++kk)
      -[GEOPlaceSearchRequest addOptionalSuppressionReason:](self, "addOptionalSuppressionReason:", [v4 optionalSuppressionReasonAtIndex:kk]);
  }
  searchLocatiouint64_t n = self->_searchLocation;
  uint64_t v84 = *((void *)v4 + 35);
  if (searchLocation)
  {
    if (v84) {
      -[GEOLatLng mergeFrom:](searchLocation, "mergeFrom:");
    }
  }
  else if (v84)
  {
    -[GEOPlaceSearchRequest setSearchLocation:](self, "setSearchLocation:");
  }
  if ((*(void *)(v4 + 444) & 0x800000) != 0)
  {
    self->_includeNameForForwardGeocodingResults = v4[427];
    *(void *)&self->_flags |= 0x800000uLL;
  }
  additionalEnabledMarkets = self->_additionalEnabledMarkets;
  uint64_t v86 = *((void *)v4 + 14);
  if (additionalEnabledMarkets)
  {
    if (v86) {
      -[GEOAdditionalEnabledMarkets mergeFrom:](additionalEnabledMarkets, "mergeFrom:");
    }
  }
  else if (v86)
  {
    -[GEOPlaceSearchRequest setAdditionalEnabledMarkets:](self, "setAdditionalEnabledMarkets:");
  }
  uint64_t v87 = *(void *)(v4 + 444);
  if ((v87 & 0x200) != 0)
  {
    self->_mapMode = *((_DWORD *)v4 + 98);
    *(void *)&self->_flags |= 0x200uLL;
    uint64_t v87 = *(void *)(v4 + 444);
  }
  if ((v87 & 0x2000000000) != 0)
  {
    self->_isPopularNearbyRequest = v4[441];
    *(void *)&self->_flags |= 0x2000000000uLL;
  }
  if (*((void *)v4 + 21)) {
    -[GEOPlaceSearchRequest setDeviceLocationCountryCode:](self, "setDeviceLocationCountryCode:");
  }
  if (*((void *)v4 + 44)) {
    -[GEOPlaceSearchRequest setViewportCenterCountryCode:](self, "setViewportCenterCountryCode:");
  }
}

- (PBUnknownFields)unknownFields
{
  p_readerLocuint64_t k = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  if ((*(void *)&self->_flags & 0x10000000000) == 0)
  {
    reader = self->_reader;
    if (reader)
    {
      uint64_t v5 = reader;
      objc_sync_enter(v5);
      GEOPlaceSearchRequestReadSpecified((uint64_t)self, (char *)self->_reader, (int *)&unknownFields_tags_2459);
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
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  p_readerLocuint64_t k = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  char v6 = *((unsigned char *)&self->_flags + 8) | 0x80;
  *(void *)&self->_flags |= 0x10000000000uLL;
  *((unsigned char *)&self->_flags + 8) = v6;
  os_unfair_lock_unlock(p_readerLock);
  unknownFields = self->_unknownFields;
  self->_unknownFields = 0;

  if (v3)
  {
    [(GEOPlaceSearchRequest *)self readAll:0];
    [(GEOAddress *)self->_address clearUnknownFields:1];
    [(GEOLocation *)self->_location clearUnknownFields:1];
    [(GEOMapRegion *)self->_mapRegion clearUnknownFields:1];
    [(GEOBusinessOptions *)self->_businessOptions clearUnknownFields:1];
    [(GEOLatLng *)self->_deviceLocation clearUnknownFields:1];
    [(GEOClientCapabilities *)self->_clientCapabilities clearUnknownFields:1];
    suggestionsOptions = self->_suggestionsOptions;
    if (suggestionsOptions)
    {
      os_unfair_lock_lock_with_options();
      *(unsigned char *)&suggestionsOptions->_flags |= 0x10u;
      *(unsigned char *)&suggestionsOptions->_flags |= 0x80u;
      os_unfair_lock_unlock(&suggestionsOptions->_readerLock);
      uint64_t v9 = suggestionsOptions->_unknownFields;
      suggestionsOptions->_unknownFields = 0;

      -[GEOSuggestionsOptions readAll:]((uint64_t)suggestionsOptions, 0);
    }
    long long v26 = 0u;
    long long v27 = 0u;
    long long v24 = 0u;
    long long v25 = 0u;
    uint64_t v10 = self->_searchSubstrings;
    uint64_t v11 = [(NSMutableArray *)v10 countByEnumeratingWithState:&v24 objects:v29 count:16];
    if (v11)
    {
      uint64_t v12 = v11;
      uint64_t v13 = *(void *)v25;
      do
      {
        uint64_t v14 = 0;
        do
        {
          if (*(void *)v25 != v13) {
            objc_enumerationMutation(v10);
          }
          [*(id *)(*((void *)&v24 + 1) + 8 * v14++) clearUnknownFields:1];
        }
        while (v12 != v14);
        uint64_t v12 = [(NSMutableArray *)v10 countByEnumeratingWithState:&v24 objects:v29 count:16];
      }
      while (v12);
    }

    [(GEOSearchSubstring *)self->_searchContextSubstring clearUnknownFields:1];
    [(GEOAddress *)self->_preserveFields clearUnknownFields:1];
    -[GEOIndexQueryNode clearUnknownFields:]((uint64_t)self->_indexFilter);
    long long v22 = 0u;
    long long v23 = 0u;
    long long v20 = 0u;
    long long v21 = 0u;
    uint64_t v15 = self->_serviceTags;
    uint64_t v16 = [(NSMutableArray *)v15 countByEnumeratingWithState:&v20 objects:v28 count:16];
    if (v16)
    {
      uint64_t v17 = v16;
      uint64_t v18 = *(void *)v21;
      do
      {
        uint64_t v19 = 0;
        do
        {
          if (*(void *)v21 != v18) {
            objc_enumerationMutation(v15);
          }
          objc_msgSend(*(id *)(*((void *)&v20 + 1) + 8 * v19++), "clearUnknownFields:", 1, (void)v20);
        }
        while (v17 != v19);
        uint64_t v17 = [(NSMutableArray *)v15 countByEnumeratingWithState:&v20 objects:v28 count:16];
      }
      while (v17);
    }

    [(GEOLatLng *)self->_knownLocation clearUnknownFields:1];
    [(GEOLatLng *)self->_searchLocation clearUnknownFields:1];
    [(GEOAdditionalEnabledMarkets *)self->_additionalEnabledMarkets clearUnknownFields:1];
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_zilchPoints, 0);
  objc_storeStrong((id *)&self->_viewportCenterCountryCode, 0);
  objc_storeStrong((id *)&self->_suggestionsPrefix, 0);
  objc_storeStrong((id *)&self->_suggestionsOptions, 0);
  objc_storeStrong((id *)&self->_serviceTags, 0);
  objc_storeStrong((id *)&self->_search, 0);
  objc_storeStrong((id *)&self->_searchSubstrings, 0);
  objc_storeStrong((id *)&self->_searchLocation, 0);
  objc_storeStrong((id *)&self->_searchContext, 0);
  objc_storeStrong((id *)&self->_searchContextSubstring, 0);
  objc_storeStrong((id *)&self->_preserveFields, 0);
  objc_storeStrong((id *)&self->_phoneticLocaleIdentifier, 0);
  objc_storeStrong((id *)&self->_mapRegion, 0);
  objc_storeStrong((id *)&self->_location, 0);
  objc_storeStrong((id *)&self->_limitToCountryCodeIso2s, 0);
  objc_storeStrong((id *)&self->_knownLocation, 0);
  objc_storeStrong((id *)&self->_inputLanguage, 0);
  objc_storeStrong((id *)&self->_indexFilter, 0);
  objc_storeStrong((id *)&self->_filterByBusinessCategorys, 0);
  objc_storeStrong((id *)&self->_deviceLocationCountryCode, 0);
  objc_storeStrong((id *)&self->_deviceTimeZone, 0);
  objc_storeStrong((id *)&self->_deviceLocation, 0);
  objc_storeStrong((id *)&self->_deviceCountryCode, 0);
  objc_storeStrong((id *)&self->_clientCapabilities, 0);
  objc_storeStrong((id *)&self->_businessOptions, 0);
  objc_storeStrong((id *)&self->_address, 0);
  objc_storeStrong((id *)&self->_additionalEnabledMarkets, 0);
  objc_storeStrong((id *)&self->_unknownFields, 0);

  objc_storeStrong((id *)&self->_reader, 0);
}

@end