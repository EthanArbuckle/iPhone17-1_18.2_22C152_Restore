@interface GEOMapService
+ (BOOL)shouldResolveAttribution;
+ (id)sharedService;
+ (void)_attributedGeoMapItemsForPlaceDatasWithType:(int)a3 placeDatas:(id)a4 disambiguationLabels:(id)a5 handler:(id)a6;
+ (void)setShouldResolveAttribution:(BOOL)a3;
- (GEOMapService)init;
- (double)wiFiQualitySearchRadiusMeters;
- (double)wiFiQualitySmallSearchRadiusMeters;
- (id)_cachedMapItemForHandle:(id)a3 enforceMaxAge:(BOOL)a4;
- (id)_cl_ticketForForwardGeocodeAddressDictionary:(id)a3 maxResults:(unsigned int)a4 traits:(id)a5;
- (id)_cl_ticketForForwardGeocodePostalAddress:(id)a3 maxResults:(unsigned int)a4 traits:(id)a5;
- (id)_cl_ticketForForwardGeocodeString:(id)a3 maxResults:(unsigned int)a4 traits:(id)a5;
- (id)_geoMapItemForData:(id)a3;
- (id)_geoMapItemsForPlacesInDetails:(id)a3;
- (id)_preferredLanguages;
- (id)_searchable_ticketForReverseGeocodeCoordinate:(id)a3 floor:(int)a4 includeEntryPoints:(BOOL)a5 shiftLocationsIfNeeded:(BOOL)a6 preserveOriginalLocation:(BOOL)a7 traits:(id)a8;
- (id)_searchable_ticketForReverseGeocodeCoordinate:(id)a3 includeEntryPoints:(BOOL)a4 shiftLocationsIfNeeded:(BOOL)a5 preserveOriginalLocation:(BOOL)a6 traits:(id)a7;
- (id)_ticketForAutocompleteFragment:(id)a3 type:(int)a4 traits:(id)a5 filters:(id)a6 retainedSearch:(id)a7 tappedQuerySuggestion:(id)a8 sessionData:(id)a9;
- (id)_ticketForLegacyBatchReverseGeocodeLocations:(id)a3 locationShifter:(id)a4 additionalPlaceTypes:(int *)a5 additionalPlaceTypesCount:(unsigned int)a6 placeTypeLimit:(int)a7 traits:(id)a8;
- (id)_ticketForRefreshingHandle:(id)a3 traits:(id)a4;
- (id)defaultBackgroundTraits;
- (id)defaultTraits;
- (id)defaultUserInitiatedTraits;
- (id)handleForMapItem:(id)a3;
- (id)locallyResolvedMapItemFromHandle:(id)a3 error:(id *)a4;
- (id)searchAroundPOITicketWithIdentifier:(id)a3 categoryID:(id)a4 maxResults:(unsigned int)a5 traits:(id)a6;
- (id)serializedClientMetadataForParsec;
- (id)serializedClientMetadataForSiri;
- (id)serializedClientMetadataForTraits:(id)a3;
- (id)serializedETAFilterForSiriWithRouteAttributes:(id)a3;
- (id)serializedSearchEvChargingParametersForSiriFromPorts:(id)a3;
- (id)ticketForAirportCode:(id)a3 terminalCode:(id)a4 gateCode:(id)a5 traits:(id)a6;
- (id)ticketForAllCollectionViewWithBatchSize:(unsigned int)a3 keywordFilter:(id)a4 addressFilter:(id)a5 withTraits:(id)a6;
- (id)ticketForBatchReverseGeocodeLocations:(id)a3 locationShifter:(id)a4 additionalPlaceTypes:(int *)a5 additionalPlaceTypesCount:(unsigned int)a6 placeTypeLimit:(int)a7 traits:(id)a8;
- (id)ticketForBatchReverseGeocodeLocations:(id)a3 shiftLocationsIfNeeded:(BOOL)a4 additionalPlaceTypes:(int *)a5 additionalPlaceTypesCount:(unsigned int)a6 placeTypeLimit:(int)a7 traits:(id)a8;
- (id)ticketForBatchReverseGeocodeLocations:(id)a3 shiftLocationsIfNeeded:(BOOL)a4 additionalPlaceTypes:(int *)a5 additionalPlaceTypesCount:(unsigned int)a6 traits:(id)a7;
- (id)ticketForBatchReverseGeocodeLocations:(id)a3 shiftLocationsIfNeeded:(BOOL)a4 traits:(id)a5;
- (id)ticketForBrandLookupWithIMessageUid:(id)a3 traits:(id)a4;
- (id)ticketForCanonicalLocationSearchQueryString:(id)a3 traits:(id)a4;
- (id)ticketForCategoryIdentifier:(id)a3 mapItemIdentifier:(id)a4 range:(_NSRange)a5 traits:(id)a6;
- (id)ticketForCategoryListWithTraits:(id)a3 isFromNoQueryState:(BOOL)a4;
- (id)ticketForCitySelectorViewWithTraits:(id)a3 batchSize:(unsigned int)a4;
- (id)ticketForCuratedCollectionItems:(id)a3 collection:(id)a4 traits:(id)a5;
- (id)ticketForCuratedCollections:(id)a3 isBatchLookup:(BOOL)a4 overrideSuppress:(BOOL)a5 traits:(id)a6;
- (id)ticketForDFRCategoryListWithTraits:(id)a3;
- (id)ticketForDatasetCheckWithTraits:(id)a3;
- (id)ticketForExternalBusinessID:(id)a3 contentProvider:(id)a4 traits:(id)a5;
- (id)ticketForExternalTransitStationCodes:(id)a3 sourceID:(id)a4 transactionDate:(id)a5 transactionLocation:(id)a6 traits:(id)a7;
- (id)ticketForFeedbackRequest:(id)a3 traits:(id)a4;
- (id)ticketForFeedbackRequestData:(id)a3 traits:(id)a4;
- (id)ticketForFeedbackRequestParameters:(id)a3 placeForProblemContext:(id)a4 userCredentials:(id)a5 pushToken:(id)a6 allowContactBackAtEmailAddress:(id)a7 traits:(id)a8;
- (id)ticketForForwardGeocodeAddress:(id)a3 maxResults:(unsigned int)a4 traits:(id)a5;
- (id)ticketForForwardGeocodeAddressDictionary:(id)a3 maxResults:(unsigned int)a4 traits:(id)a5;
- (id)ticketForForwardGeocodePostalAddress:(id)a3 maxResults:(unsigned int)a4 traits:(id)a5;
- (id)ticketForForwardGeocodeString:(id)a3 maxResults:(unsigned int)a4 traits:(id)a5;
- (id)ticketForFreshBusinessClaimComponentWithIdentifier:(id)a3 resultProviderID:(int)a4 traits:(id)a5;
- (id)ticketForFreshComponents:(id)a3 identifier:(id)a4 resultProviderID:(int)a5 contentProvider:(id)a6 traits:(id)a7;
- (id)ticketForFreshIdentifier:(id)a3 resultProviderID:(int)a4 contentProvider:(id)a5 traits:(id)a6;
- (id)ticketForGeoIpLookupForIpAddr:(id)a3;
- (id)ticketForGuideHomeWithFilter:(id)a3 guideLocation:(id)a4 withTraits:(id)a5;
- (id)ticketForGuideLocationLookupWithIds:(id)a3 identifiers:(id)a4 traits:(id)a5;
- (id)ticketForHikingIntroTipWithMapItemIdentifier:(id)a3 traits:(id)a4;
- (id)ticketForIdentifiers:(id)a3 resultProviderID:(int)a4 contentProvider:(id)a5 traits:(id)a6;
- (id)ticketForIdentifiers:(id)a3 traits:(id)a4;
- (id)ticketForInterleavedAutoCompletePoiAddressOnly:(id)a3 sessionData:(id)a4 traits:(id)a5;
- (id)ticketForInterleavedAutoCompleteSearchFragment:(id)a3 filters:(id)a4 sessionData:(id)a5 traits:(id)a6;
- (id)ticketForInterleavedAutoCompleteWithBrowseSearchFragment:(id)a3 filters:(id)a4 retainedSearch:(id)a5 tappedQuerySuggestion:(id)a6 sessionData:(id)a7 traits:(id)a8;
- (id)ticketForInterleavedInstantSearchFragment:(id)a3 filters:(id)a4 sessionData:(id)a5 traits:(id)a6;
- (id)ticketForInterleavedLocalitiesAndLandmarksSearchFragment:(id)a3 sessionData:(id)a4 traits:(id)a5;
- (id)ticketForMUIDs:(id)a3 resultProviderID:(int)a4 contentProvider:(id)a5 traits:(id)a6;
- (id)ticketForMUIDs:(id)a3 traits:(id)a4;
- (id)ticketForMapItemToRefine:(id)a3 traits:(id)a4;
- (id)ticketForMapsHomeWithTraits:(id)a3;
- (id)ticketForMerchantCode:(id)a3 rawMerchantCode:(id)a4 industryCategory:(id)a5 industryCode:(id)a6 paymentNetwork:(id)a7 transactionDate:(id)a8 transactionLocation:(id)a9 traits:(id)a10;
- (id)ticketForMerchantCode:(id)a3 rawMerchantCode:(id)a4 relyingPartyIdentifier:(id)a5 industryCategory:(id)a6 industryCode:(id)a7 paymentNetwork:(id)a8 transactionDate:(id)a9 transactionLocation:(id)a10 terminalId:(id)a11 transactionCurrencyCode:(id)a12 transactionType:(int)a13 transactionId:(id)a14 warsawMerchantDomain:(id)a15 warsawMerchantName:(id)a16 warsawMerchantId:(id)a17 adamId:(id)a18 merchantId:(id)a19 merchantDoingBizAsName:(id)a20 merchantEnhancedName:(id)a21 merchantCity:(id)a22 merchantRawCity:(id)a23 merchantState:(id)a24 merchantRawState:(id)a25 merchantZip:(id)a26 merchantAddress:(id)a27 merchantRawAddress:(id)a28 merchantCountryCode:(id)a29 merchantType:(id)a30 merchantCleanConfidenceLevel:(id)a31 merchantAdditionalData:(id)a32 merchantCanl:(id)a33 fuzzyMatched:(id)a34 coarseLocationUsed:(id)a35 bankTransactionType:(int)a36 bankTransactionStatus:(int)a37 bankAnonymisedUserId:(id)a38 otherBankTransactionLocations:(id)a39 bankTransactionDescription:(id)a40 bankTransactionTimestamp:(id)a41 bankRawMerchantCode:(id)a42 bankIndustryCategory:(id)a43 bankIndustryCode:(id)a44 bankTransactionCurrencyCode:(id)a45 bankMerchantInfo:(id)a46 baaCerts:(id)a47 baaSignature:(id)a48 bankBrandMUIDFallbackEnabled:(id)a49 bankIdentifier:(id)a50 bankTransactionDescriptionClean:(id)a51 bankPIIRedactionIsApplied:(id)a52 bankRotationPeriodsSinceEpoch:(id)a53 traits:(id)a54;
- (id)ticketForNearbyTransitDeparturesWithLookupOrigin:(id)a3 userLocation:(id)a4 traits:(id)a5;
- (id)ticketForNearbyTransitPaymentInfoForLocations:(id)a3 traits:(id)a4;
- (id)ticketForNearestTransitStation:(id)a3 coordinate:(id)a4 traits:(id)a5;
- (id)ticketForNonExpiredIdentifier:(id)a3 resultProviderID:(int)a4 contentProvider:(id)a5 traits:(id)a6;
- (id)ticketForOfflineRegionNameSuggestionWithRegion:(id)a3 traits:(id)a4;
- (id)ticketForOfflineRegionSearchFragment:(id)a3 sessionData:(id)a4 traits:(id)a5;
- (id)ticketForPhoneNumbers:(id)a3 allowCellularDataForLookup:(BOOL)a4 traits:(id)a5;
- (id)ticketForPlaceEnrichmentWithEnrichmentInfo:(id)a3 mapsIdentifier:(id)a4 traits:(id)a5;
- (id)ticketForPlaceLookupWithSearchCategory:(id)a3 parentMuid:(unint64_t)a4 traits:(id)a5;
- (id)ticketForPlaceRefinementRequestParameters:(id)a3 traits:(id)a4;
- (id)ticketForPlaceRefinementRequestWithCoordinate:(id *)a3 addressLine:(id)a4 placeName:(id)a5 traits:(id)a6;
- (id)ticketForPublisherViewPublisherIdentifier:(id)a3 keywordFilter:(id)a4 addressFilter:(id)a5 batchSize:(unsigned int)a6 withTraits:(id)a7;
- (id)ticketForRefreshingEVChargersWithIdentifiers:(id)a3 traits:(id)a4;
- (id)ticketForReverseGeocodeCoordinate:(id)a3 floor:(int)a4 includeEntryPoints:(BOOL)a5 shiftLocationsIfNeeded:(BOOL)a6 preserveOriginalLocation:(BOOL)a7 traits:(id)a8;
- (id)ticketForReverseGeocodeCoordinate:(id)a3 includeEntryPoints:(BOOL)a4 shiftLocationsIfNeeded:(BOOL)a5 preserveOriginalLocation:(BOOL)a6 traits:(id)a7;
- (id)ticketForReverseGeocodeCoordinate:(id)a3 includeEntryPoints:(BOOL)a4 shiftLocationsIfNeeded:(BOOL)a5 traits:(id)a6;
- (id)ticketForReverseGeocodeCoordinate:(id)a3 shiftLocationsIfNeeded:(BOOL)a4 preserveOriginalLocation:(BOOL)a5 traits:(id)a6;
- (id)ticketForReverseGeocodeCoordinate:(id)a3 shiftLocationsIfNeeded:(BOOL)a4 traits:(id)a5;
- (id)ticketForReverseGeocodeLocation:(id)a3 placeTypeLimit:(int)a4 traits:(id)a5;
- (id)ticketForReverseGeocodeLocation:(id)a3 preserveOriginalLocation:(BOOL)a4 placeTypeLimit:(int)a5 traits:(id)a6;
- (id)ticketForReverseGeocodeLocation:(id)a3 traits:(id)a4;
- (id)ticketForSearchAlongRouteWithCategory:(id)a3 searchQuery:(id)a4 completionItem:(id)a5 originalWaypointRouteData:(id)a6 zilchData:(id)a7 sessionState:(id)a8 routeId:(id)a9 routeAttributes:(id)a10 maxResults:(unsigned int)a11 traits:(id)a12 searchSessionData:(id)a13;
- (id)ticketForSearchCapabilitiesWithTraits:(id)a3;
- (id)ticketForSearchCategory:(id)a3 venueIdentifier:(id)a4 maxResults:(unsigned int)a5 traits:(id)a6;
- (id)ticketForSearchFieldPlaceholderWithTraits:(id)a3;
- (id)ticketForSearchHomeWithTraits:(id)a3;
- (id)ticketForSearchPoisForBrandMUID:(unint64_t)a3 traits:(id)a4;
- (id)ticketForSearchQuery:(id)a3 completionItem:(id)a4 maxResults:(unsigned int)a5 traits:(id)a6;
- (id)ticketForSearchQuery:(id)a3 completionItem:(id)a4 maxResults:(unsigned int)a5 traits:(id)a6 searchSessionData:(id)a7;
- (id)ticketForSearchQuery:(id)a3 completionItem:(id)a4 relatedSearchSuggestion:(id)a5 retainedSearch:(id)a6 maxResults:(unsigned int)a7 traits:(id)a8;
- (id)ticketForSearchQuery:(id)a3 completionItem:(id)a4 relatedSearchSuggestion:(id)a5 retainedSearch:(id)a6 maxResults:(unsigned int)a7 traits:(id)a8 searchSessionData:(id)a9;
- (id)ticketForSearchQuery:(id)a3 completionItem:(id)a4 retainedSearch:(id)a5 maxResults:(unsigned int)a6 suppressResultsRequiringAttribution:(BOOL)a7 traits:(id)a8;
- (id)ticketForSearchQuery:(id)a3 completionItem:(id)a4 retainedSearch:(id)a5 maxResults:(unsigned int)a6 suppressResultsRequiringAttribution:(BOOL)a7 traits:(id)a8 searchSessionData:(id)a9;
- (id)ticketForSearchQuery:(id)a3 completionItem:(id)a4 retainedSearch:(id)a5 maxResults:(unsigned int)a6 traits:(id)a7;
- (id)ticketForSearchQuery:(id)a3 completionItem:(id)a4 retainedSearch:(id)a5 maxResults:(unsigned int)a6 traits:(id)a7 searchSessionData:(id)a8;
- (id)ticketForSearchQuery:(id)a3 filters:(id)a4 completionItem:(id)a5 retainedSearch:(id)a6 maxResults:(unsigned int)a7 suppressResultsRequiringAttribution:(BOOL)a8 traits:(id)a9;
- (id)ticketForSearchQuery:(id)a3 filters:(id)a4 completionItem:(id)a5 retainedSearch:(id)a6 maxResults:(unsigned int)a7 suppressResultsRequiringAttribution:(BOOL)a8 traits:(id)a9 searchSessionData:(id)a10;
- (id)ticketForSearchQuery:(id)a3 filters:(id)a4 maxResults:(unsigned int)a5 suppressResultsRequiringAttribution:(BOOL)a6 traits:(id)a7;
- (id)ticketForSearchQuery:(id)a3 filters:(id)a4 maxResults:(unsigned int)a5 suppressResultsRequiringAttribution:(BOOL)a6 traits:(id)a7 searchSessionData:(id)a8;
- (id)ticketForSearchQuery:(id)a3 filters:(id)a4 maxResults:(unsigned int)a5 traits:(id)a6;
- (id)ticketForSearchQuery:(id)a3 filters:(id)a4 maxResults:(unsigned int)a5 traits:(id)a6 searchSessionData:(id)a7;
- (id)ticketForSectionedAutoCompleteSearchFragment:(id)a3 filters:(id)a4 sessionData:(id)a5 traits:(id)a6;
- (id)ticketForSectionedInstantSearchFragment:(id)a3 filters:(id)a4 sessionData:(id)a5 traits:(id)a6;
- (id)ticketForSectionedLocalitiesAndLandmarksSearchFragment:(id)a3 sessionData:(id)a4 traits:(id)a5;
- (id)ticketForSpatialEventLookupParameters:(id)a3 traits:(id)a4;
- (id)ticketForSpatialLookupParameters:(id)a3 traits:(id)a4;
- (id)ticketForSpatialPlaceLookupParameters:(id)a3 traits:(id)a4;
- (id)ticketForTerritoryForLocations:(id)a3 shiftLocationsIfNeeded:(BOOL)a4 traits:(id)a5;
- (id)ticketForTransitDeparturesAtStation:(unint64_t)a3 line:(unint64_t)a4 referenceTripID:(unint64_t)a5 includeAllDirectionNames:(BOOL)a6 traits:(id)a7;
- (id)ticketForTransitIdentifiers:(id)a3 endDateForPlacecardSchedulesForThisBatch:(id)a4 traits:(id)a5;
- (id)ticketForTransitLines:(id)a3 withTraits:(id)a4;
- (id)ticketForTransitScheduleAtStation:(unint64_t)a3 line:(unint64_t)a4 referenceTripID:(unint64_t)a5 includeAllDirectionNames:(BOOL)a6 routingParameters:(id)a7 traits:(id)a8;
- (id)ticketForTransitTripDetailsAtStation:(unint64_t)a3 line:(unint64_t)a4 referenceTripID:(unint64_t)a5 includeAllDirectionNames:(BOOL)a6 routingParameters:(id)a7 traits:(id)a8;
- (id)ticketForTransitTripIdentifiers:(id)a3 traits:(id)a4;
- (id)ticketForURLQuery:(id)a3 identifier:(id)a4 resultProviderId:(int)a5 contentProvider:(id)a6 maxResults:(unsigned int)a7 traits:(id)a8;
- (id)ticketForUpdatedTransitScheduleDetailsAtStation:(unint64_t)a3 line:(unint64_t)a4 referenceTripID:(unint64_t)a5 includeAllDirectionNames:(BOOL)a6 routingParameters:(id)a7 traits:(id)a8;
- (id)ticketForVendorIdentifier:(id)a3 mapItemIdentifier:(id)a4 range:(_NSRange)a5 traits:(id)a6;
- (id)ticketForVendorSpecificPlaceRefinementRequestParameters:(id)a3 traits:(id)a4;
- (id)ticketForWiFiQualityLocationServiceRequest:(id)a3;
- (id)ticketForWiFiQualityNetworkServiceRequest:(id)a3;
- (id)ticketForWiFiQualityTileLoadForKey:(id)a3 eTag:(id)a4;
- (id)ticketForWifiFingerprintWithLocations:(id)a3 wifiAccessPoints:(id)a4 maxLabels:(unsigned int)a5 entryTime:(unint64_t)a6 exitTime:(unint64_t)a7 traits:(id)a8;
- (id)ticketForWifiFingerprintWithLocations:(id)a3 wifiAccessPoints:(id)a4 maxLabels:(unsigned int)a5 traits:(id)a6;
- (id)ticketforCategory:(id)a3 maxResults:(unsigned int)a4 traits:(id)a5 searchSessionData:(id)a6;
- (int)_loadOverriddenResultProviderID;
- (int)localSearchProviderID;
- (int64_t)wiFiQualitySearchZoomLevel;
- (os_unfair_lock_s)handleCache;
- (unint64_t)maxParametersCountForSpatialEventLookup;
- (unint64_t)maxParametersCountForSpatialPlaceLookup;
- (void)_countryCodeChanged:(id)a3;
- (void)_geoMapItemsForResponseData:(id)a3 handler:(id)a4;
- (void)_localeChanged:(id)a3;
- (void)_resolveMapItemFromHandle:(id)a3 withTraits:(id)a4 cachePolicy:(unint64_t)a5 completionHandler:(id)a6;
- (void)_resolveMapItemFromHandle:(id)a3 withTraits:(id)a4 cachePolicy:(unint64_t)a5 coordinateOnlyRefinement:(BOOL)a6 completionHandler:(id)a7;
- (void)_sendInvalidateDataToSiriAndParSec;
- (void)dealloc;
- (void)resolveMapItemFromHandle:(id)a3 completionHandler:(id)a4;
- (void)resolveMapItemFromHandle:(id)a3 traits:(id)a4 completionHandler:(id)a5;
- (void)resolveMapItemFromHandle:(id)a3 withTraits:(id)a4 useCache:(BOOL)a5 completionHandler:(id)a6;
- (void)resolveMapItemFromHandle:(id)a3 withTraits:(id)a4 useCache:(BOOL)a5 coordinateOnlyRefinement:(BOOL)a6 completionHandler:(id)a7;
- (void)resolveMapItemLocallyFromHandle:(id)a3 completionHandler:(id)a4;
- (void)setDefaultTraits:(id)a3;
- (void)setDefaultTraitsHardwareIdentifier:(id)a3;
- (void)trackMapItem:(id)a3;
- (void)trackSerializedPlaceData:(id)a3;
@end

@implementation GEOMapService

+ (BOOL)shouldResolveAttribution
{
  return _shouldResolveAttribution;
}

- (id)serializedClientMetadataForSiri
{
  v3 = [GEOPDClientMetadata alloc];
  v4 = [(GEOMapService *)self defaultTraits];
  v5 = [(GEOPDClientMetadata *)v3 initWithTraits:v4];

  v6 = objc_alloc_init(GEOPDClientMetadata);
  v7 = [(GEOPDClientMetadata *)v5 additionalEnabledMarkets];
  [(GEOPDClientMetadata *)v6 setAdditionalEnabledMarkets:v7];

  [(GEOPDClientMetadata *)v6 setRequiredVersion:[(GEOPDClientMetadata *)v5 requiredVersion]];
  [(GEOPDClientMetadata *)v6 setResultListAttributionSupport:[(GEOPDClientMetadata *)v5 resultListAttributionSupport]];
  v8 = +[GEOExperimentConfiguration sharedConfiguration];
  v9 = [v8 _siriClientMetadata];
  [(GEOPDClientMetadata *)v6 setAbClientMetadata:v9];

  [(GEOPDClientMetadata *)v6 setEnablePreflightVenues:[(GEOPDClientMetadata *)v5 enablePreflightVenues]];
  v10 = [(GEOPDClientMetadata *)v5 businessChatPreflightIdentifiers];
  [(GEOPDClientMetadata *)v6 setBusinessChatPreflightIdentifiers:v10];

  v11 = [(GEOPDClientMetadata *)v6 data];

  return v11;
}

- (id)handleForMapItem:(id)a3
{
  return +[GEOMapItemHandle handleDataForMapItem:a3];
}

- (void)_resolveMapItemFromHandle:(id)a3 withTraits:(id)a4 cachePolicy:(unint64_t)a5 completionHandler:(id)a6
{
}

double __30__GEOMapService_defaultTraits__block_invoke_55(uint64_t a1)
{
  uint64_t v2 = [(id)qword_1EB29FAA0 copy];
  uint64_t v3 = *(void *)(*(void *)(a1 + 32) + 8);
  v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;

  double result = *(double *)&qword_1EB29FAB0;
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = qword_1EB29FAB0;
  return result;
}

- (void)resolveMapItemLocallyFromHandle:(id)a3 completionHandler:(id)a4
{
}

- (void)_sendInvalidateDataToSiriAndParSec
{
  uint64_t v2 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v2 postNotificationName:@"GEOMapServiceSerializedClientMetadataForParsecDidInvalidateNotification" object:0];

  uint64_t v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v3 postNotificationName:@"GEOMapServiceSerializedClientMetadataForSiriDidInvalidateNotification" object:0];

  v4 = objc_alloc_init(GEOSiriSyncHandlerHelper);
  [(GEOSiriSyncHandlerHelper *)v4 notifySiriIfNecessary];
}

+ (id)sharedService
{
  if (qword_1EB29FA98 != -1) {
    dispatch_once(&qword_1EB29FA98, &__block_literal_global_83);
  }
  uint64_t v2 = (void *)_MergedGlobals_235;

  return v2;
}

void __30__GEOMapService_defaultTraits__block_invoke(uint64_t a1)
{
  uint64_t v65 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = geo_isolater_create();
  uint64_t v3 = (void *)qword_1EB29FAA8;
  qword_1EB29FAA8 = v2;

  uint64_t v4 = [MEMORY[0x1E4F1CA48] array];
  v5 = (void *)qword_1EB29FAB8;
  qword_1EB29FAB8 = v4;

  v6 = +[GEOPlatform sharedPlatform];
  [v6 deviceScreenScale];
  double v8 = v7;

  v9 = [MEMORY[0x1E4F1CA48] arrayWithCapacity:2];
  v10 = objc_alloc_init(GEOTraitsPhotoSize);
  [(GEOTraitsPhotoSize *)v10 setWidth:600];
  [(GEOTraitsPhotoSize *)v10 setHeight:400];
  [v9 addObject:v10];
  v11 = objc_alloc_init(GEOTraitsPhotoSize);

  if (v8 == 1.0) {
    uint64_t v12 = 100;
  }
  else {
    uint64_t v12 = 248;
  }
  if (v8 == 1.0) {
    uint64_t v13 = 100;
  }
  else {
    uint64_t v13 = 186;
  }
  [(GEOTraitsPhotoSize *)v11 setWidth:v12];
  [(GEOTraitsPhotoSize *)v11 setHeight:v13];
  [v9 addObject:v11];
  if (v8 >= 3.0)
  {
    v14 = objc_alloc_init(GEOTraitsPhotoSize);

    [(GEOTraitsPhotoSize *)v14 setWidth:1200];
    [(GEOTraitsPhotoSize *)v14 setHeight:800];
    [v9 addObject:v14];
    v11 = v14;
  }
  v15 = (void *)[v9 copy];
  v16 = [MEMORY[0x1E4F1CA48] arrayWithCapacity:2];

  v17 = objc_alloc_init(GEOTraitsPhotoSize);
  if (v8 == 1.0) {
    uint64_t v18 = 30;
  }
  else {
    uint64_t v18 = 60;
  }
  [(GEOTraitsPhotoSize *)v17 setWidth:v18];
  [(GEOTraitsPhotoSize *)v17 setHeight:v18];
  [v16 addObject:v17];
  v19 = (void *)[v16 copy];

  v20 = objc_alloc_init(GEOMapServiceTraits);
  v21 = (void *)qword_1EB29FAA0;
  qword_1EB29FAA0 = (uint64_t)v20;

  v22 = GEOApplicationIdentifierOrProcessName();
  [(id)qword_1EB29FAA0 setAppIdentifier:v22];

  v54 = [MEMORY[0x1E4F28B50] mainBundle];
  v23 = [v54 infoDictionary];
  v24 = [v23 objectForKey:@"CFBundleShortVersionString"];
  [(id)qword_1EB29FAA0 setAppMajorVersion:v24];

  v25 = [v23 objectForKey:*MEMORY[0x1E4F1D020]];
  [(id)qword_1EB29FAA0 setAppMinorVersion:v25];

  v26 = [*(id *)(a1 + 32) _preferredLanguages];
  v27 = (void *)[v26 mutableCopy];
  [(id)qword_1EB29FAA0 setDeviceDisplayLanguages:v27];

  long long v61 = 0u;
  long long v62 = 0u;
  long long v59 = 0u;
  long long v60 = 0u;
  id v28 = v15;
  uint64_t v29 = [v28 countByEnumeratingWithState:&v59 objects:v64 count:16];
  if (v29)
  {
    uint64_t v30 = v29;
    uint64_t v31 = *(void *)v60;
    do
    {
      for (uint64_t i = 0; i != v30; ++i)
      {
        if (*(void *)v60 != v31) {
          objc_enumerationMutation(v28);
        }
        uint64_t v33 = *(void *)(*((void *)&v59 + 1) + 8 * i);
        v34 = [(id)qword_1EB29FAA0 photoSizes];
        char v35 = [v34 containsObject:v33];

        if ((v35 & 1) == 0) {
          [(id)qword_1EB29FAA0 addPhotoSizes:v33];
        }
      }
      uint64_t v30 = [v28 countByEnumeratingWithState:&v59 objects:v64 count:16];
    }
    while (v30);
  }

  if (([(id)qword_1EB29FAA0 hasPhotosCount] & 1) == 0) {
    objc_msgSend((id)qword_1EB29FAA0, "setPhotosCount:", GEOConfigGetUInteger(GeoServicesConfig_DefaultNumberOfPhotosToRequest, (uint64_t)off_1E9115198));
  }
  if (([(id)qword_1EB29FAA0 hasRatingsCount] & 1) == 0) {
    [(id)qword_1EB29FAA0 setRatingsCount:4];
  }
  if (([(id)qword_1EB29FAA0 hasPhotoAlbumCount] & 1) == 0) {
    objc_msgSend((id)qword_1EB29FAA0, "setPhotoAlbumCount:", GEOConfigGetUInteger(GeoServicesConfig_DefaultNumberOfPhotoAlbumsToRequest, (uint64_t)off_1E91151A8));
  }
  if (([(id)qword_1EB29FAA0 hasRelatedPlaceItemCount] & 1) == 0) {
    [(id)qword_1EB29FAA0 setRelatedPlaceItemCount:18];
  }
  long long v57 = 0u;
  long long v58 = 0u;
  long long v55 = 0u;
  long long v56 = 0u;
  id v36 = v19;
  uint64_t v37 = [v36 countByEnumeratingWithState:&v55 objects:v63 count:16];
  if (v37)
  {
    uint64_t v38 = v37;
    uint64_t v39 = *(void *)v56;
    do
    {
      for (uint64_t j = 0; j != v38; ++j)
      {
        if (*(void *)v56 != v39) {
          objc_enumerationMutation(v36);
        }
        uint64_t v41 = *(void *)(*((void *)&v55 + 1) + 8 * j);
        v42 = [(id)qword_1EB29FAA0 reviewUserPhotoSizes];
        char v43 = [v42 containsObject:v41];

        if ((v43 & 1) == 0) {
          [(id)qword_1EB29FAA0 addReviewUserPhotoSizes:v41];
        }
      }
      uint64_t v38 = [v36 countByEnumeratingWithState:&v55 objects:v63 count:16];
    }
    while (v38);
  }

  if (([(id)qword_1EB29FAA0 hasReviewUserPhotosCount] & 1) == 0) {
    [(id)qword_1EB29FAA0 setReviewUserPhotosCount:3];
  }
  if (([(id)qword_1EB29FAA0 hasTransitScheduleFilter] & 1) == 0)
  {
    v44 = objc_alloc_init(GEOTraitsTransitScheduleFilter);
    [(id)qword_1EB29FAA0 setTransitScheduleFilter:v44];
  }
  v45 = [(id)qword_1EB29FAA0 transitScheduleFilter];
  if (([v45 hasHighFrequencyFilter] & 1) == 0)
  {
    v46 = objc_alloc_init(GEOTraitsTransitScheduleModeFilter);
    [v45 setHighFrequencyFilter:v46];
  }
  if (([v45 hasLowFrequencyFilter] & 1) == 0)
  {
    v47 = objc_alloc_init(GEOTraitsTransitScheduleModeFilter);
    [v45 setLowFrequencyFilter:v47];
  }
  geo_isolate_sync();
  global_queue = (void *)geo_get_global_queue();
  v49 = _GEOConfigAddBlockListenerForKey(GeoServicesConfig_DefaultTimeFilterDuration, (uint64_t)off_1E91151B8, global_queue, &__block_literal_global_44);

  [(id)qword_1EB29FAB8 addObject:v49];
  geo_isolate_sync();
  v50 = (void *)geo_get_global_queue();
  v51 = _GEOConfigAddBlockListenerForKey(GeoServicesConfig_DefaultRequestPriority, (uint64_t)off_1E91151C8, v50, &__block_literal_global_48);

  [(id)qword_1EB29FAB8 addObject:v51];
  geo_isolate_sync();
  v52 = (void *)geo_get_global_queue();
  v53 = _GEOConfigAddBlockListenerForKey(GeoServicesConfig_DefaultBrandFallbackSupport, (uint64_t)off_1E91151D8, v52, &__block_literal_global_52_1);

  [(id)qword_1EB29FAB8 addObject:v53];
  [(id)qword_1EB29FAA0 addSupportedAutocompleteListType:1];
}

- (id)defaultTraits
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __30__GEOMapService_defaultTraits__block_invoke;
  block[3] = &unk_1E53D79D8;
  block[4] = self;
  if (qword_1EB29FAC0 != -1) {
    dispatch_once(&qword_1EB29FAC0, block);
  }
  uint64_t v18 = 0;
  v19 = &v18;
  uint64_t v20 = 0x3032000000;
  v21 = __Block_byref_object_copy__39;
  v22 = __Block_byref_object_dispose__39;
  id v23 = 0;
  uint64_t v14 = 0;
  v15 = (double *)&v14;
  uint64_t v16 = 0x2020000000;
  uint64_t v17 = 0;
  geo_isolate_sync_data();
  uint64_t v2 = [MEMORY[0x1E4F1CA20] currentLocale];
  uint64_t v3 = [v2 objectForKey:*MEMORY[0x1E4F1C400]];
  [(id)v19[5] setDisplayRegion:v3];

  uint64_t v4 = [MEMORY[0x1E4F1C9C8] date];
  [v4 timeIntervalSinceReferenceDate];
  double v6 = v5;

  double v7 = [(id)v19[5] transitScheduleFilter];
  double v8 = [v7 highFrequencyFilter];
  [v8 configureWithDefaultStartTime:4 duration:v6 numAdditionalDepartures:v15[3]];
  v9 = [v7 lowFrequencyFilter];
  [v9 configureWithDefaultStartTime:4 duration:v6 numAdditionalDepartures:v15[3]];
  v10 = [v9 timeRange];
  v11 = (void *)[v10 copy];
  [v7 setOperatingHoursRange:v11];

  id v12 = (id)v19[5];
  _Block_object_dispose(&v14, 8);
  _Block_object_dispose(&v18, 8);

  return v12;
}

- (id)_preferredLanguages
{
  p_preferredLanguagesLock = &self->_preferredLanguagesLock;
  os_unfair_lock_lock(&self->_preferredLanguagesLock);
  preferredLanguages = self->_preferredLanguages;
  if (!preferredLanguages)
  {
    double v5 = [MEMORY[0x1E4F1CA20] preferredLanguages];
    double v6 = (NSArray *)[v5 copy];
    double v7 = self->_preferredLanguages;
    self->_preferredLanguages = v6;

    preferredLanguages = self->_preferredLanguages;
  }
  double v8 = preferredLanguages;
  os_unfair_lock_unlock(p_preferredLanguagesLock);

  return v8;
}

uint64_t __30__GEOMapService_defaultTraits__block_invoke_6()
{
  return geo_isolate_sync();
}

- (void)_resolveMapItemFromHandle:(id)a3 withTraits:(id)a4 cachePolicy:(unint64_t)a5 coordinateOnlyRefinement:(BOOL)a6 completionHandler:(id)a7
{
  uint64_t v43 = *MEMORY[0x1E4F143B8];
  id v13 = a3;
  id v14 = a4;
  v15 = (void (**)(id, void, GEOMapItemHandle *))a7;
  if (v15)
  {
    if (!v13)
    {
      uint64_t v16 = [MEMORY[0x1E4F28C58] GEOErrorWithCode:-12 reason:@"handle cannot be nil"];
      v15[2](v15, 0, v16);
LABEL_31:

      goto LABEL_32;
    }
    uint64_t v16 = [[GEOMapItemHandle alloc] initWithData:v13];
    uint64_t v17 = [(GEOMapItemHandle *)v16 placeRefinementParameters];
    if (v17)
    {
      *(_WORD *)(v17 + 108) |= 0x1000u;
      *(_WORD *)(v17 + 108) |= 0x10u;
      *(unsigned char *)(v17 + 104) = a6;
    }

    if (v16 && a5 != 1 && a5 != 4)
    {
      uint64_t v18 = [(GEOMapService *)self _cachedMapItemForHandle:v16 enforceMaxAge:a5 < 2];
      if (v18)
      {
        v19 = (void *)v18;
        v15[2](v15, v18, 0);
LABEL_30:

        goto LABEL_31;
      }
      uint64_t v20 = GEOFindOrCreateLog("com.apple.GeoServices", "GEOMapService");
      if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138477827;
        v40 = v16;
        _os_log_impl(&dword_188D96000, v20, OS_LOG_TYPE_DEBUG, "Client-side cache miss for handle: %{private}@", buf, 0xCu);
      }
    }
    if ([(GEOMapItemHandle *)v16 handleType] == 1)
    {
      if (a5 != 3)
      {
        id v28 = +[GEOMapService sharedService];
        v19 = [v28 _ticketForRefreshingHandle:v16 traits:v14];

        if (!v19)
        {
          uint64_t v29 = GEOFindOrCreateLog("com.apple.GeoServices", "GEOMapService");
          if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
          {
            NSStringFromSelector(a2);
            uint64_t v30 = (GEOMapItemHandle *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138543618;
            v40 = v30;
            __int16 v41 = 2114;
            v42 = @"mapItemHandle is invalid";
            _os_log_impl(&dword_188D96000, v29, OS_LOG_TYPE_ERROR, "%{public}@ was unable to resolve mapItemHandle because %{public}@", buf, 0x16u);
          }
          uint64_t v31 = [MEMORY[0x1E4F28C58] GEOErrorWithCode:-13 reason:@"mapItemHandle is invalid"];
          v15[2](v15, 0, v31);
        }
        v34[0] = MEMORY[0x1E4F143A8];
        v34[1] = 3221225472;
        v34[2] = __109__GEOMapService__resolveMapItemFromHandle_withTraits_cachePolicy_coordinateOnlyRefinement_completionHandler___block_invoke;
        v34[3] = &unk_1E53E2348;
        unint64_t v38 = a5;
        char v35 = v16;
        id v36 = self;
        uint64_t v37 = v15;
        [v19 submitWithHandler:v34 networkActivity:0];

        goto LABEL_30;
      }
      _mapItemFromHandleContents(v16);
      v21 = (__CFString *)objc_claimAutoreleasedReturnValue();
      if (v21)
      {
        ((void (**)(id, __CFString *, GEOMapItemHandle *))v15)[2](v15, v21, 0);
LABEL_24:

        goto LABEL_31;
      }
      v32 = GEOFindOrCreateLog("com.apple.GeoServices", "GEOMapService");
      if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
      {
        NSStringFromSelector(a2);
        uint64_t v33 = (GEOMapItemHandle *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v40 = v33;
        __int16 v41 = 2114;
        v42 = @"mapItemHandle is invalid";
        _os_log_impl(&dword_188D96000, v32, OS_LOG_TYPE_ERROR, "%{public}@ was unable to resolve mapItemHandle because %{public}@", buf, 0x16u);
      }
      v25 = (void *)MEMORY[0x1E4F28C58];
      v26 = @"mapItemHandle is invalid";
    }
    else
    {
      v22 = @"mapItemHandle had an unexpected handleType";
      if (!v16) {
        v22 = @"mapItemHandle was nil";
      }
      v21 = v22;
      id v23 = GEOFindOrCreateLog("com.apple.GeoServices", "GEOMapService");
      if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
      {
        NSStringFromSelector(a2);
        v24 = (GEOMapItemHandle *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v40 = v24;
        __int16 v41 = 2114;
        v42 = v21;
        _os_log_impl(&dword_188D96000, v23, OS_LOG_TYPE_ERROR, "%{public}@ was unable to resolve mapItemHandle because %{public}@", buf, 0x16u);
      }
      v25 = (void *)MEMORY[0x1E4F28C58];
      v26 = v21;
    }
    v27 = [v25 GEOErrorWithCode:-13 reason:v26];
    v15[2](v15, 0, v27);

    goto LABEL_24;
  }
LABEL_32:
}

- (id)_cachedMapItemForHandle:(id)a3 enforceMaxAge:(BOOL)a4
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  double v7 = -[GEOMapService handleCache]((os_unfair_lock_s *)self);
  double v8 = [v7 objectForKey:v6];

  if (v8)
  {
    v9 = [MEMORY[0x1E4F1C9C8] date];
    v10 = [v8 timestamp];
    [v9 timeIntervalSinceDate:v10];
    double v12 = v11;

    double Double = GEOConfigGetDouble(GeoServicesConfig_MapItemHandleCacheMaxItemAge, (uint64_t)off_1E9115258);
    id v14 = GEOFindOrCreateLog("com.apple.GeoServices", "GEOMapService");
    BOOL v15 = os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG);
    if (v12 >= Double && a4)
    {
      if (v15)
      {
        int v20 = 138477827;
        id v21 = v6;
        _os_log_impl(&dword_188D96000, v14, OS_LOG_TYPE_DEBUG, "Client-side cache hit was too old (ignoring cached value) for handle: %{private}@", (uint8_t *)&v20, 0xCu);
      }
      uint64_t v16 = 0;
    }
    else
    {
      if (v15)
      {
        int v20 = 138477827;
        id v21 = v6;
        _os_log_impl(&dword_188D96000, v14, OS_LOG_TYPE_DEBUG, "Client-side cache hit for handle: %{private}@", (uint8_t *)&v20, 0xCu);
      }

      uint64_t v17 = [GEOMapItemStorage alloc];
      uint64_t v18 = [v8 data];
      uint64_t v16 = [(GEOMapItemStorage *)v17 initWithData:v18];

      id v14 = [v6 clientAttributes];
      [(GEOMapItemStorage *)v16 setClientAttributes:v14];
    }
  }
  else
  {
    uint64_t v16 = 0;
  }

  return v16;
}

- (os_unfair_lock_s)handleCache
{
  if (a1)
  {
    uint64_t v2 = a1;
    uint64_t v3 = a1 + 9;
    os_unfair_lock_lock_with_options();
    if (!*(void *)&v2[10]._os_unfair_lock_opaque)
    {
      id v4 = objc_alloc_init(MEMORY[0x1E4F1C998]);
      double v5 = *(void **)&v2[10]._os_unfair_lock_opaque;
      *(void *)&v2[10]._os_unfair_lock_opaque = v4;

      objc_msgSend(*(id *)&v2[10]._os_unfair_lock_opaque, "setCountLimit:", GEOConfigGetUInteger(GeoServicesConfig_MapItemHandleCacheMaxItemCount, (uint64_t)off_1E9115158));
      objc_msgSend(*(id *)&v2[10]._os_unfair_lock_opaque, "setTotalCostLimit:", GEOConfigGetUInteger(GeoServicesConfig_MapItemHandleCacheMaxItemCost, (uint64_t)off_1E9115168));
    }
    os_unfair_lock_unlock(v3);
    a1 = (os_unfair_lock_s *)*(id *)&v2[10]._os_unfair_lock_opaque;
    uint64_t v1 = vars8;
  }
  return a1;
}

- (id)serializedClientMetadataForParsec
{
  uint64_t v3 = [GEOPDClientMetadata alloc];
  id v4 = [(GEOMapService *)self defaultTraits];
  double v5 = [(GEOPDClientMetadata *)v3 initWithTraits:v4];

  id v6 = objc_alloc_init(GEOPDClientMetadata);
  double v7 = [(GEOPDClientMetadata *)v5 additionalEnabledMarkets];
  [(GEOPDClientMetadata *)v6 setAdditionalEnabledMarkets:v7];

  [(GEOPDClientMetadata *)v6 setRequiredVersion:[(GEOPDClientMetadata *)v5 requiredVersion]];
  [(GEOPDClientMetadata *)v6 setResultListAttributionSupport:[(GEOPDClientMetadata *)v5 resultListAttributionSupport]];
  double v8 = +[GEOExperimentConfiguration sharedConfiguration];
  v9 = [v8 _parsecClientMetadata];
  [(GEOPDClientMetadata *)v6 setAbClientMetadata:v9];

  [(GEOPDClientMetadata *)v6 setEnablePreflightVenues:[(GEOPDClientMetadata *)v5 enablePreflightVenues]];
  v10 = [(GEOPDClientMetadata *)v5 businessChatPreflightIdentifiers];
  [(GEOPDClientMetadata *)v6 setBusinessChatPreflightIdentifiers:v10];

  double v11 = [(GEOPDClientMetadata *)v6 data];

  return v11;
}

- (id)serializedClientMetadataForTraits:(id)a3
{
  id v3 = a3;
  id v4 = [[GEOPDClientMetadata alloc] initWithTraits:v3];

  double v5 = [(GEOPDClientMetadata *)v4 data];

  return v5;
}

uint64_t __30__GEOMapService_defaultTraits__block_invoke_7()
{
  uint64_t BOOL = GEOConfigGetBOOL(GeoServicesConfig_DefaultBrandFallbackSupport, (uint64_t)off_1E91151D8);
  uint64_t v1 = (void *)qword_1EB29FAA0;

  return [v1 setSupportsBrandFallback:BOOL];
}

void __30__GEOMapService_defaultTraits__block_invoke_3()
{
  qword_1EB29FAB0 = GEOConfigGetDouble(GeoServicesConfig_DefaultTimeFilterDuration, (uint64_t)off_1E91151B8);
}

- (void)_countryCodeChanged:(id)a3
{
  id v4 = objc_msgSend(MEMORY[0x1E4F28EB8], "defaultCenter", a3);
  [v4 postNotificationName:@"GEOMapServiceSerializedClientMetadataDidInvalidateNotification" object:self];

  id v5 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v5 postNotificationName:@"GEOMapServiceSerializedClientMetadataForSiriDidInvalidateNotification" object:0];
}

uint64_t __21__GEOMapService_init__block_invoke(uint64_t a1)
{
  uint64_t v2 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v2 postNotificationName:@"GEOMapServiceSerializedClientMetadataDidInvalidateNotification" object:0];

  id v3 = *(void **)(a1 + 32);

  return [v3 _sendInvalidateDataToSiriAndParSec];
}

void __30__GEOMapService_sharedService__block_invoke()
{
  v0 = objc_alloc_init(GEOMapService);
  uint64_t v1 = (void *)_MergedGlobals_235;
  _MergedGlobals_235 = (uint64_t)v0;
}

- (GEOMapService)init
{
  v15.receiver = self;
  v15.super_class = (Class)GEOMapService;
  uint64_t v2 = [(GEOMapService *)&v15 init];
  if (v2)
  {
    id v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v3 addObserver:v2 selector:sel__localeChanged_ name:*MEMORY[0x1E4F1C370] object:0];

    id v4 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v4 addObserver:v2 selector:sel__countryCodeChanged_ name:@"GEOCountryConfigurationCountryCodeDidChangeNotification" object:0];

    v2->_preferredLanguagesLock._os_unfair_lock_opaque = 0;
    v2->_overriddenResultProviderID = [(GEOMapService *)v2 _loadOverriddenResultProviderID];
    v2->_handleCacheLock._os_unfair_lock_opaque = 0;
    handler[0] = MEMORY[0x1E4F143A8];
    handler[1] = 3221225472;
    handler[2] = __21__GEOMapService_init__block_invoke;
    handler[3] = &unk_1E53E2238;
    id v5 = v2;
    id v14 = v5;
    id v6 = MEMORY[0x1E4F14428];
    notify_register_dispatch("com.apple.GeoServices.additionalEnabledMarketsChanged", &v2->_additionalEnabledMarketsChangedToken, MEMORY[0x1E4F14428], handler);
    p_experimentsChangedToken = &v5->_experimentsChangedToken;
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __21__GEOMapService_init__block_invoke_2;
    v11[3] = &unk_1E53E2238;
    double v8 = v5;
    double v12 = v8;
    notify_register_dispatch("com.apple.GeoServices.experimentsChanged", p_experimentsChangedToken, v6, v11);

    v9 = v8;
  }

  return v2;
}

- (int)_loadOverriddenResultProviderID
{
  return GEOConfigGetInteger(GeoServicesConfig_OverriddedResultProviderID, (uint64_t)off_1E9115178);
}

uint64_t __30__GEOMapService_defaultTraits__block_invoke_5()
{
  uint64_t Uint64 = GEOConfigGetUint64(GeoServicesConfig_DefaultRequestPriority, (uint64_t)off_1E91151C8);
  uint64_t v1 = (void *)qword_1EB29FAA0;

  return [v1 setHttpRequestPriority:Uint64];
}

- (id)ticketForIdentifiers:(id)a3 resultProviderID:(int)a4 contentProvider:(id)a5 traits:(id)a6
{
  LODWORD(v7) = a4;
  id v9 = a3;
  id v10 = a6;
  unsigned int overriddenResultProviderID = self->_overriddenResultProviderID;
  if (!v10)
  {
    id v10 = [(GEOMapService *)self defaultTraits];
  }
  if (overriddenResultProviderID) {
    uint64_t v7 = overriddenResultProviderID;
  }
  else {
    uint64_t v7 = v7;
  }
  double v12 = [[_GEOIdentifiersTicket alloc] initWithIdentifiers:v9 resultProviderID:v7 contentProvider:0 traits:v10 options:7];

  return v12;
}

- (id)ticketForSearchFieldPlaceholderWithTraits:(id)a3
{
  id v4 = a3;
  if (!v4)
  {
    id v4 = [(GEOMapService *)self defaultTraits];
  }
  id v5 = [[GEOPDPlaceRequest alloc] initForSearchFieldPlaceholderWithTraits:v4];
  id v6 = [(GEOAbstractRequestResponseTicket *)[_GEOPlaceSearchPlaceholderTicket alloc] initWithRequest:v5 traits:v4];

  return v6;
}

- (id)ticketForDatasetCheckWithTraits:(id)a3
{
  id v4 = a3;
  if (GEOConfigGetBOOL(GeoServicesConfig_ShouldPassABClientMetadata, (uint64_t)off_1E9115238))
  {
    if (!v4)
    {
      id v4 = [(GEOMapService *)self defaultTraits];
    }
    id v5 = [[GEOPDPlaceRequest alloc] initForDatasetCheckWithTraits:v4];
    id v6 = [[_GEOPlaceRequestTicket alloc] initWithRequest:v5 traits:v4];
  }
  else
  {
    id v6 = 0;
  }

  return v6;
}

- (id)ticketForMapsHomeWithTraits:(id)a3
{
  id v4 = a3;
  if (!v4)
  {
    id v4 = [(GEOMapService *)self defaultTraits];
  }
  id v5 = [[GEOPDPlaceRequest alloc] initForMapsHomeWithTraits:v4];
  id v6 = [(GEOAbstractRequestResponseTicket *)[_GEOMapsHomeTicket alloc] initWithRequest:v5 traits:v4];

  return v6;
}

- (id)ticketForReverseGeocodeLocation:(id)a3 traits:(id)a4
{
  int v6 = GeoServicesConfig_RevGeoRequestShouldAlwaysPreserveRequestedLatLong;
  uint64_t v7 = off_1E9115218;
  id v8 = a4;
  id v9 = a3;
  id v10 = [(GEOMapService *)self ticketForReverseGeocodeLocation:v9 preserveOriginalLocation:GEOConfigGetBOOL(v6, (uint64_t)v7) placeTypeLimit:0 traits:v8];

  return v10;
}

- (id)ticketForReverseGeocodeLocation:(id)a3 preserveOriginalLocation:(BOOL)a4 placeTypeLimit:(int)a5 traits:(id)a6
{
  uint64_t v7 = *(void *)&a5;
  BOOL v8 = a4;
  id v10 = a3;
  id v11 = a6;
  if (!v11)
  {
    id v11 = [(GEOMapService *)self defaultTraits];
  }
  [v11 setIsAPICall:1];
  [v11 setAnalyticsOptOut:1];
  BOOL v12 = [v10 referenceFrame] == 1;
  id v13 = [[GEOPDPlaceRequest alloc] initWithReverseGeocodeLocation:v10 includeEntryPoints:1 preserveOriginalLocation:v8 placeTypeLimit:v7 traits:v11];
  id v14 = [[_GEOReverseGeocodeRequestTicket alloc] initWithRequest:v13 shiftLocationsIfNeeded:v12 traits:v11];

  return v14;
}

- (id)ticketForIdentifiers:(id)a3 traits:(id)a4
{
  return [(GEOMapService *)self ticketForIdentifiers:a3 resultProviderID:0 contentProvider:0 traits:a4];
}

void __52__GEOMapService_setDefaultTraitsHardwareIdentifier___block_invoke(uint64_t a1)
{
  id v1 = (id)[*(id *)(a1 + 32) copy];
  [(id)qword_1EB29FAA0 setHardwareIdentifier:v1];
}

- (void)setDefaultTraitsHardwareIdentifier:(id)a3
{
  id v4 = a3;
  if (!qword_1EB29FAA0) {
    id v5 = [(GEOMapService *)self defaultTraits];
  }
  uint64_t v7 = v4;
  id v6 = v4;
  geo_isolate_sync_data();
}

- (id)ticketForPhoneNumbers:(id)a3 allowCellularDataForLookup:(BOOL)a4 traits:(id)a5
{
  BOOL v6 = a4;
  id v8 = a3;
  id v9 = a5;
  if (!v9)
  {
    id v9 = [(GEOMapService *)self defaultTraits];
  }
  id v10 = [[_GEOPhoneNumbersTicket alloc] initWithPhoneNumbers:v8 allowCellularDataForLookup:v6 traits:v9];

  return v10;
}

- (id)_ticketForLegacyBatchReverseGeocodeLocations:(id)a3 locationShifter:(id)a4 additionalPlaceTypes:(int *)a5 additionalPlaceTypesCount:(unsigned int)a6 placeTypeLimit:(int)a7 traits:(id)a8
{
  uint64_t v44 = *MEMORY[0x1E4F143B8];
  id v13 = a3;
  id v14 = a4;
  id v15 = a8;
  uint64_t v16 = objc_alloc_init(GEOBatchRevGeocodeRequest);
  uint64_t v17 = [MEMORY[0x1E4F1CA48] arrayWithArray:v13];
  [(GEOBatchRevGeocodeRequest *)v16 setLocations:v17];

  uint64_t v18 = +[GEOGeoServiceTag defaultTag];
  [(GEOBatchRevGeocodeRequest *)v16 addServiceTag:v18];

  uint64_t v19 = a6;
  int v20 = malloc_type_malloc(4 * a6, 0x100004052888210uLL);
  id v21 = v20;
  if (a6)
  {
    uint64_t v22 = v20;
    uint64_t v23 = v19;
    do
    {
      int v24 = *a5++;
      *v22++ = _PlaceTypeForMapItemPlaceType(v24);
      --v23;
    }
    while (v23);
  }
  [(GEOBatchRevGeocodeRequest *)v16 setAdditionalPlaceTypes:v21 count:v19];
  free(v21);
  v25 = +[GEOCountryConfiguration sharedConfiguration];
  v26 = [v25 countryCode];
  [(GEOBatchRevGeocodeRequest *)v16 setDeviceCountryCode:v26];

  v27 = [MEMORY[0x1E4F1CA20] currentLocale];
  id v28 = [v27 objectForKey:*MEMORY[0x1E4F1C400]];
  [(GEOBatchRevGeocodeRequest *)v16 setDisplayRegion:v28];

  uint64_t v29 = +[GEOPlatform sharedPlatform];
  uint64_t v30 = [v29 deviceCountrySKUForServiceRequests];
  [(GEOBatchRevGeocodeRequest *)v16 setDeviceSku:v30];

  if (a7 && a7 < 44)
  {
    uint64_t v31 = objc_alloc_init(GEOCoarseLocationMetadata);
    [(GEOCoarseLocationMetadata *)v31 setType:1];
    long long v41 = 0u;
    long long v42 = 0u;
    long long v39 = 0u;
    long long v40 = 0u;
    v32 = [(GEOBatchRevGeocodeRequest *)v16 locations];
    uint64_t v33 = [v32 countByEnumeratingWithState:&v39 objects:v43 count:16];
    if (v33)
    {
      uint64_t v34 = v33;
      uint64_t v35 = *(void *)v40;
      do
      {
        for (uint64_t i = 0; i != v34; ++i)
        {
          if (*(void *)v40 != v35) {
            objc_enumerationMutation(v32);
          }
          [*(id *)(*((void *)&v39 + 1) + 8 * i) setCoarseMetadata:v31];
        }
        uint64_t v34 = [v32 countByEnumeratingWithState:&v39 objects:v43 count:16];
      }
      while (v34);
    }
  }
  uint64_t v37 = [[_GEOLegacyBatchReverseGeocodeTicket alloc] initWithBatchReverseGeocodeRequest:v16 locationShifter:v14 traits:v15];

  return v37;
}

uint64_t __21__GEOMapService_init__block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) _sendInvalidateDataToSiriAndParSec];
}

- (void)dealloc
{
  notify_cancel(self->_additionalEnabledMarketsChangedToken);
  notify_cancel(self->_experimentsChangedToken);
  id v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v3 removeObserver:self];

  v4.receiver = self;
  v4.super_class = (Class)GEOMapService;
  [(GEOMapService *)&v4 dealloc];
}

- (int)localSearchProviderID
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  if (!self->_overriddenResultProviderID) {
    return GEOConfigGetInteger(GeoServicesConfig_VoltaireSearchURLProviderID, (uint64_t)off_1E9115188);
  }
  id v3 = GEOFindOrCreateLog("com.apple.GeoServices", "GEOMapService");
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    int overriddenResultProviderID = self->_overriddenResultProviderID;
    v6[0] = 67109120;
    v6[1] = overriddenResultProviderID;
    _os_log_impl(&dword_188D96000, v3, OS_LOG_TYPE_INFO, "IMPORTANT: Using an overridden resultProviderID of %d", (uint8_t *)v6, 8u);
  }

  return self->_overriddenResultProviderID;
}

- (void)_localeChanged:(id)a3
{
  p_preferredLanguagesLock = &self->_preferredLanguagesLock;
  os_unfair_lock_lock_with_options();
  preferredLanguages = self->_preferredLanguages;
  self->_preferredLanguages = 0;

  os_unfair_lock_unlock(p_preferredLanguagesLock);
  BOOL v6 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v6 postNotificationName:@"GEOMapServiceSerializedClientMetadataDidInvalidateNotification" object:self];

  id v7 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v7 postNotificationName:@"GEOMapServiceSerializedClientMetadataForSiriDidInvalidateNotification" object:0];
}

uint64_t __30__GEOMapService_defaultTraits__block_invoke_2()
{
  return geo_isolate_sync();
}

uint64_t __30__GEOMapService_defaultTraits__block_invoke_4()
{
  return geo_isolate_sync();
}

- (id)defaultBackgroundTraits
{
  uint64_t v2 = [(GEOMapService *)self defaultTraits];
  [v2 setRequestPriority:1];
  objc_msgSend(v2, "setHttpRequestPriority:", GEOConfigGetUint64(GeoServicesConfig_DefaultBackgroundRequestPriority, (uint64_t)off_1E91151E8));

  return v2;
}

- (id)defaultUserInitiatedTraits
{
  uint64_t v2 = [(GEOMapService *)self defaultTraits];
  [v2 setRequestPriority:2];
  objc_msgSend(v2, "setHttpRequestPriority:", GEOConfigGetUint64(GeoServicesConfig_UserInitiatedRequestPriority, (uint64_t)off_1E91151F8));

  return v2;
}

- (void)setDefaultTraits:(id)a3
{
  id v4 = a3;
  id v8 = v4;
  if (!qword_1EB29FAA0)
  {
    id v5 = [(GEOMapService *)self defaultTraits];
    id v4 = v8;
  }
  uint64_t v6 = [v4 copy];
  id v7 = (void *)qword_1EB29FAA0;
  qword_1EB29FAA0 = v6;
}

- (id)ticketForMUIDs:(id)a3 traits:(id)a4
{
  return [(GEOMapService *)self ticketForMUIDs:a3 resultProviderID:0 contentProvider:0 traits:a4];
}

- (id)ticketForMUIDs:(id)a3 resultProviderID:(int)a4 contentProvider:(id)a5 traits:(id)a6
{
  LODWORD(v8) = a4;
  id v10 = a3;
  id v11 = a5;
  id v12 = a6;
  unsigned int overriddenResultProviderID = self->_overriddenResultProviderID;
  if (!v12)
  {
    id v12 = [(GEOMapService *)self defaultTraits];
  }
  if (overriddenResultProviderID) {
    uint64_t v8 = overriddenResultProviderID;
  }
  else {
    uint64_t v8 = v8;
  }
  id v14 = [[_GEOIdentifiersTicket alloc] initWithMUIDs:v10 resultProviderID:v8 contentProvider:v11 traits:v12 options:7];

  return v14;
}

- (id)ticketForFreshIdentifier:(id)a3 resultProviderID:(int)a4 contentProvider:(id)a5 traits:(id)a6
{
  LODWORD(v8) = a4;
  v18[1] = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a5;
  id v12 = a6;
  unsigned int overriddenResultProviderID = self->_overriddenResultProviderID;
  if (!v12)
  {
    id v12 = [(GEOMapService *)self defaultTraits];
  }
  if (overriddenResultProviderID) {
    uint64_t v8 = overriddenResultProviderID;
  }
  else {
    uint64_t v8 = v8;
  }
  id v14 = [_GEOIdentifiersTicket alloc];
  v18[0] = v10;
  id v15 = [MEMORY[0x1E4F1C978] arrayWithObjects:v18 count:1];
  uint64_t v16 = [(_GEOIdentifiersTicket *)v14 initWithIdentifiers:v15 resultProviderID:v8 contentProvider:v11 traits:v12 options:1];

  return v16;
}

- (id)ticketForNonExpiredIdentifier:(id)a3 resultProviderID:(int)a4 contentProvider:(id)a5 traits:(id)a6
{
  LODWORD(v8) = a4;
  v20[1] = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a5;
  id v12 = a6;
  id v13 = v12;
  unsigned int overriddenResultProviderID = self->_overriddenResultProviderID;
  if (overriddenResultProviderID) {
    uint64_t v8 = overriddenResultProviderID;
  }
  else {
    uint64_t v8 = v8;
  }
  if (!v12)
  {
    id v13 = [(GEOMapService *)self defaultTraits];
  }
  id v15 = [_GEOIdentifiersTicket alloc];
  uint64_t v16 = v15;
  if (v10)
  {
    v20[0] = v10;
    uint64_t v17 = [MEMORY[0x1E4F1C978] arrayWithObjects:v20 count:1];
    uint64_t v18 = [(_GEOIdentifiersTicket *)v16 initWithIdentifiers:v17 resultProviderID:v8 contentProvider:v11 traits:v13 options:3];
  }
  else
  {
    uint64_t v18 = [(_GEOIdentifiersTicket *)v15 initWithIdentifiers:0 resultProviderID:v8 contentProvider:v11 traits:v13 options:3];
  }

  return v18;
}

- (id)ticketForFreshComponents:(id)a3 identifier:(id)a4 resultProviderID:(int)a5 contentProvider:(id)a6 traits:(id)a7
{
  LODWORD(v9) = a5;
  id v12 = a3;
  id v13 = a4;
  id v14 = a6;
  id v15 = a7;
  unsigned int overriddenResultProviderID = self->_overriddenResultProviderID;
  if (!v15)
  {
    id v15 = [(GEOMapService *)self defaultTraits];
  }
  if (overriddenResultProviderID) {
    uint64_t v9 = overriddenResultProviderID;
  }
  else {
    uint64_t v9 = v9;
  }
  uint64_t v17 = [[_GEOComponentsTicket alloc] initWithComponents:v12 identifier:v13 resultProviderID:v9 contentProvider:v14 traits:v15];

  return v17;
}

- (id)ticketForFreshBusinessClaimComponentWithIdentifier:(id)a3 resultProviderID:(int)a4 traits:(id)a5
{
  uint64_t v6 = *(void *)&a4;
  v15[4] = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a5;
  v14[0] = &unk_1ED73DCC0;
  v14[1] = &unk_1ED73DCF0;
  v15[0] = &unk_1ED73DCD8;
  v15[1] = &unk_1ED73DCD8;
  v14[2] = &unk_1ED73DD08;
  v14[3] = &unk_1ED73DD20;
  v15[2] = &unk_1ED73DCD8;
  v15[3] = &unk_1ED73DCD8;
  id v10 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v15 forKeys:v14 count:4];
  if (GEOConfigGetBOOL(GeoServicesConfig_RequestLegacyAddressComponent, (uint64_t)off_1E9115208))
  {
    id v11 = (void *)[v10 mutableCopy];
    [v11 setObject:&unk_1ED73DCD8 forKeyedSubscript:&unk_1ED73DD38];

    id v10 = v11;
  }
  id v12 = [(GEOMapService *)self ticketForFreshComponents:v10 identifier:v8 resultProviderID:v6 contentProvider:0 traits:v9];

  return v12;
}

- (id)ticketForExternalBusinessID:(id)a3 contentProvider:(id)a4 traits:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if (!v10)
  {
    id v10 = [(GEOMapService *)self defaultTraits];
  }
  id v11 = [[GEOPDPlaceRequest alloc] initWithExternalBusinessID:v8 contentProvider:v9 traits:v10];
  id v12 = [[_GEOPlaceRequestTicket alloc] initWithRequest:v11 traits:v10];

  return v12;
}

- (id)ticketForTransitIdentifiers:(id)a3 endDateForPlacecardSchedulesForThisBatch:(id)a4 traits:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if (!v10)
  {
    id v10 = [(GEOMapService *)self defaultTraits];
  }
  [v9 timeIntervalSinceNow];
  if (v11 > 0.0)
  {
    double v12 = v11;
    id v13 = [v10 transitScheduleFilter];
    id v14 = [v13 highFrequencyFilter];
    id v15 = [v14 timeRange];
    [v15 setDuration:v12];

    uint64_t v16 = [v10 transitScheduleFilter];
    uint64_t v17 = [v16 lowFrequencyFilter];
    uint64_t v18 = [v17 timeRange];
    [v18 setDuration:v12];
  }
  uint64_t v19 = [(GEOMapService *)self ticketForIdentifiers:v8 traits:v10];

  return v19;
}

- (id)ticketForForwardGeocodeAddress:(id)a3 maxResults:(unsigned int)a4 traits:(id)a5
{
  LODWORD(v6) = a4;
  id v8 = a3;
  id v9 = a5;
  if (!v9)
  {
    id v9 = [(GEOMapService *)self defaultTraits];
  }
  if (v6 <= 1) {
    uint64_t v6 = 1;
  }
  else {
    uint64_t v6 = v6;
  }
  id v10 = [[GEOPDPlaceRequest alloc] initWithForwardGeocodeAddress:v8 maxResults:v6 traits:v9];
  double v11 = [[_GEOPlaceRequestTicket alloc] initWithRequest:v10 traits:v9];

  return v11;
}

- (id)ticketForForwardGeocodeAddressDictionary:(id)a3 maxResults:(unsigned int)a4 traits:(id)a5
{
  uint64_t v6 = *(void *)&a4;
  id v8 = a3;
  id v9 = a5;
  if (!v9)
  {
    id v9 = [(GEOMapService *)self defaultTraits];
  }
  id v10 = [[GEOAddress alloc] initWithAddressDictionary:v8];
  double v11 = [(GEOMapService *)self ticketForForwardGeocodeAddress:v10 maxResults:v6 traits:v9];

  return v11;
}

- (id)ticketForForwardGeocodeString:(id)a3 maxResults:(unsigned int)a4 traits:(id)a5
{
  LODWORD(v6) = a4;
  id v8 = a3;
  id v9 = a5;
  if (!v9)
  {
    id v9 = [(GEOMapService *)self defaultTraits];
  }
  if (v6 <= 1) {
    uint64_t v6 = 1;
  }
  else {
    uint64_t v6 = v6;
  }
  id v10 = [[GEOPDPlaceRequest alloc] initWithForwardGeocodeAddressString:v8 maxResults:v6 traits:v9];
  double v11 = [[_GEOPlaceRequestTicket alloc] initWithRequest:v10 traits:v9];

  return v11;
}

- (id)ticketForForwardGeocodePostalAddress:(id)a3 maxResults:(unsigned int)a4 traits:(id)a5
{
  uint64_t v6 = *(void *)&a4;
  id v8 = a3;
  id v9 = a5;
  if (!v9)
  {
    id v9 = [(GEOMapService *)self defaultTraits];
  }
  id v10 = [[GEOAddress alloc] initWithPostalAddress:v8];
  double v11 = [(GEOMapService *)self ticketForForwardGeocodeAddress:v10 maxResults:v6 traits:v9];

  return v11;
}

- (id)_cl_ticketForForwardGeocodeString:(id)a3 maxResults:(unsigned int)a4 traits:(id)a5
{
  uint64_t v6 = *(void *)&a4;
  id v8 = a3;
  id v9 = a5;
  if (!v9)
  {
    id v9 = [(GEOMapService *)self defaultTraits];
  }
  [v9 setIsAPICall:1];
  id v10 = [(GEOMapService *)self ticketForForwardGeocodeString:v8 maxResults:v6 traits:v9];

  return v10;
}

- (id)_cl_ticketForForwardGeocodeAddressDictionary:(id)a3 maxResults:(unsigned int)a4 traits:(id)a5
{
  uint64_t v6 = *(void *)&a4;
  id v8 = a3;
  id v9 = a5;
  if (!v9)
  {
    id v9 = [(GEOMapService *)self defaultTraits];
  }
  [v9 setIsAPICall:1];
  id v10 = [(GEOMapService *)self ticketForForwardGeocodeAddressDictionary:v8 maxResults:v6 traits:v9];

  return v10;
}

- (id)_cl_ticketForForwardGeocodePostalAddress:(id)a3 maxResults:(unsigned int)a4 traits:(id)a5
{
  uint64_t v6 = *(void *)&a4;
  id v8 = a3;
  id v9 = a5;
  if (!v9)
  {
    id v9 = [(GEOMapService *)self defaultTraits];
  }
  [v9 setIsAPICall:1];
  id v10 = [(GEOMapService *)self ticketForForwardGeocodePostalAddress:v8 maxResults:v6 traits:v9];

  return v10;
}

- (id)ticketForReverseGeocodeCoordinate:(id)a3 shiftLocationsIfNeeded:(BOOL)a4 traits:(id)a5
{
  return -[GEOMapService ticketForReverseGeocodeCoordinate:includeEntryPoints:shiftLocationsIfNeeded:traits:](self, "ticketForReverseGeocodeCoordinate:includeEntryPoints:shiftLocationsIfNeeded:traits:", 1, a4, a5, a3.var0, a3.var1);
}

- (id)ticketForReverseGeocodeCoordinate:(id)a3 shiftLocationsIfNeeded:(BOOL)a4 preserveOriginalLocation:(BOOL)a5 traits:(id)a6
{
  return -[GEOMapService ticketForReverseGeocodeCoordinate:includeEntryPoints:shiftLocationsIfNeeded:preserveOriginalLocation:traits:](self, "ticketForReverseGeocodeCoordinate:includeEntryPoints:shiftLocationsIfNeeded:preserveOriginalLocation:traits:", 1, a4, a5, a6, a3.var0, a3.var1);
}

- (id)_searchable_ticketForReverseGeocodeCoordinate:(id)a3 includeEntryPoints:(BOOL)a4 shiftLocationsIfNeeded:(BOOL)a5 preserveOriginalLocation:(BOOL)a6 traits:(id)a7
{
  BOOL v7 = a6;
  BOOL v8 = a5;
  BOOL v9 = a4;
  double var1 = a3.var1;
  double var0 = a3.var0;
  id v12 = a7;
  id v13 = -[GEOPDPlaceRequest initWithReverseGeocodeCoordinate:includeEntryPoints:preserveOriginalLocation:traits:]([GEOPDPlaceRequest alloc], "initWithReverseGeocodeCoordinate:includeEntryPoints:preserveOriginalLocation:traits:", v9, v7, v12, var0, var1);
  id v14 = [[_GEOReverseGeocodeRequestTicket alloc] initWithRequest:v13 shiftLocationsIfNeeded:v8 traits:v12];

  return v14;
}

- (id)ticketForReverseGeocodeCoordinate:(id)a3 includeEntryPoints:(BOOL)a4 shiftLocationsIfNeeded:(BOOL)a5 traits:(id)a6
{
  BOOL v6 = a5;
  BOOL v7 = a4;
  double var1 = a3.var1;
  double var0 = a3.var0;
  int v11 = GeoServicesConfig_RevGeoRequestShouldAlwaysPreserveRequestedLatLong;
  id v12 = off_1E9115218;
  id v13 = a6;
  id v14 = -[GEOMapService ticketForReverseGeocodeCoordinate:includeEntryPoints:shiftLocationsIfNeeded:preserveOriginalLocation:traits:](self, "ticketForReverseGeocodeCoordinate:includeEntryPoints:shiftLocationsIfNeeded:preserveOriginalLocation:traits:", v7, v6, GEOConfigGetBOOL(v11, (uint64_t)v12), v13, var0, var1);

  return v14;
}

- (id)ticketForReverseGeocodeCoordinate:(id)a3 includeEntryPoints:(BOOL)a4 shiftLocationsIfNeeded:(BOOL)a5 preserveOriginalLocation:(BOOL)a6 traits:(id)a7
{
  BOOL v7 = a6;
  BOOL v8 = a5;
  BOOL v9 = a4;
  double var1 = a3.var1;
  double var0 = a3.var0;
  id v13 = a7;
  if (!v13)
  {
    id v13 = [(GEOMapService *)self defaultTraits];
  }
  id v14 = -[GEOMapService _searchable_ticketForReverseGeocodeCoordinate:includeEntryPoints:shiftLocationsIfNeeded:preserveOriginalLocation:traits:](self, "_searchable_ticketForReverseGeocodeCoordinate:includeEntryPoints:shiftLocationsIfNeeded:preserveOriginalLocation:traits:", v9, v8, v7, v13, var0, var1);

  return v14;
}

- (id)ticketForReverseGeocodeCoordinate:(id)a3 floor:(int)a4 includeEntryPoints:(BOOL)a5 shiftLocationsIfNeeded:(BOOL)a6 preserveOriginalLocation:(BOOL)a7 traits:(id)a8
{
  BOOL v8 = a7;
  BOOL v9 = a6;
  BOOL v10 = a5;
  uint64_t v11 = *(void *)&a4;
  double var1 = a3.var1;
  double var0 = a3.var0;
  id v15 = a8;
  if (!v15)
  {
    id v15 = [(GEOMapService *)self defaultTraits];
  }
  uint64_t v16 = -[GEOMapService _searchable_ticketForReverseGeocodeCoordinate:floor:includeEntryPoints:shiftLocationsIfNeeded:preserveOriginalLocation:traits:](self, "_searchable_ticketForReverseGeocodeCoordinate:floor:includeEntryPoints:shiftLocationsIfNeeded:preserveOriginalLocation:traits:", v11, v10, v9, v8, v15, var0, var1);

  return v16;
}

- (id)_searchable_ticketForReverseGeocodeCoordinate:(id)a3 floor:(int)a4 includeEntryPoints:(BOOL)a5 shiftLocationsIfNeeded:(BOOL)a6 preserveOriginalLocation:(BOOL)a7 traits:(id)a8
{
  BOOL v8 = a7;
  BOOL v9 = a6;
  BOOL v10 = a5;
  uint64_t v11 = *(void *)&a4;
  double var1 = a3.var1;
  double var0 = a3.var0;
  id v14 = a8;
  id v15 = -[GEOPDPlaceRequest initWithReverseGeocodeCoordinate:floorOrdinal:includeEntryPoints:preserveOriginalLocation:traits:]([GEOPDPlaceRequest alloc], "initWithReverseGeocodeCoordinate:floorOrdinal:includeEntryPoints:preserveOriginalLocation:traits:", v11, v10, v8, v14, var0, var1);
  uint64_t v16 = [[_GEOReverseGeocodeRequestTicket alloc] initWithRequest:v15 shiftLocationsIfNeeded:v9 traits:v14];

  return v16;
}

- (id)ticketForReverseGeocodeLocation:(id)a3 placeTypeLimit:(int)a4 traits:(id)a5
{
  uint64_t v5 = *(void *)&a4;
  int v8 = GeoServicesConfig_RevGeoRequestShouldAlwaysPreserveRequestedLatLong;
  BOOL v9 = off_1E9115218;
  id v10 = a5;
  id v11 = a3;
  id v12 = [(GEOMapService *)self ticketForReverseGeocodeLocation:v11 preserveOriginalLocation:GEOConfigGetBOOL(v8, (uint64_t)v9) placeTypeLimit:v5 traits:v10];

  return v12;
}

- (id)ticketForBatchReverseGeocodeLocations:(id)a3 shiftLocationsIfNeeded:(BOOL)a4 traits:(id)a5
{
  return [(GEOMapService *)self ticketForBatchReverseGeocodeLocations:a3 shiftLocationsIfNeeded:a4 additionalPlaceTypes:0 additionalPlaceTypesCount:0 traits:a5];
}

- (id)ticketForBatchReverseGeocodeLocations:(id)a3 shiftLocationsIfNeeded:(BOOL)a4 additionalPlaceTypes:(int *)a5 additionalPlaceTypesCount:(unsigned int)a6 traits:(id)a7
{
  return [(GEOMapService *)self ticketForBatchReverseGeocodeLocations:a3 shiftLocationsIfNeeded:a4 additionalPlaceTypes:a5 additionalPlaceTypesCount:*(void *)&a6 placeTypeLimit:0 traits:a7];
}

- (id)ticketForBatchReverseGeocodeLocations:(id)a3 shiftLocationsIfNeeded:(BOOL)a4 additionalPlaceTypes:(int *)a5 additionalPlaceTypesCount:(unsigned int)a6 placeTypeLimit:(int)a7 traits:(id)a8
{
  if (a4) {
    int v8 = &__block_literal_global_79_0;
  }
  else {
    int v8 = 0;
  }
  return [(GEOMapService *)self ticketForBatchReverseGeocodeLocations:a3 locationShifter:v8 additionalPlaceTypes:a5 additionalPlaceTypesCount:*(void *)&a6 placeTypeLimit:*(void *)&a7 traits:a8];
}

GEOLocationShifter *__147__GEOMapService_ticketForBatchReverseGeocodeLocations_shiftLocationsIfNeeded_additionalPlaceTypes_additionalPlaceTypesCount_placeTypeLimit_traits___block_invoke()
{
  v0 = objc_alloc_init(GEOLocationShifter);

  return v0;
}

- (id)ticketForBatchReverseGeocodeLocations:(id)a3 locationShifter:(id)a4 additionalPlaceTypes:(int *)a5 additionalPlaceTypesCount:(unsigned int)a6 placeTypeLimit:(int)a7 traits:(id)a8
{
  uint64_t v9 = *(void *)&a7;
  uint64_t v10 = *(void *)&a6;
  id v14 = a3;
  id v15 = a4;
  id v16 = a8;
  if (!v16)
  {
    id v16 = [(GEOMapService *)self defaultTraits];
  }
  [v16 setAnalyticsOptOut:1];
  if (GEOConfigGetBOOL(GeoServicesConfig_BatchRevGeoUsePlaceRequest, (uint64_t)off_1E9115228)
    && (GEOGetURLWithSource(55, 0), uint64_t v17 = objc_claimAutoreleasedReturnValue(), v17, v17))
  {
    if (v9 && (int)v9 <= 43)
    {
      uint64_t v18 = objc_alloc_init(GEOCoarseLocationMetadata);
      [(GEOCoarseLocationMetadata *)v18 setType:1];
      v24[0] = MEMORY[0x1E4F143A8];
      v24[1] = 3221225472;
      v24[2] = __140__GEOMapService_ticketForBatchReverseGeocodeLocations_locationShifter_additionalPlaceTypes_additionalPlaceTypesCount_placeTypeLimit_traits___block_invoke;
      v24[3] = &unk_1E53E2280;
      v25 = v18;
      uint64_t v19 = v18;
      uint64_t v20 = objc_msgSend(v14, "_geo_map:", v24);

      id v14 = (id)v20;
    }
    id v21 = [[GEOPDPlaceRequest alloc] initWithBatchReverseGeocodeLocations:v14 additionalPlaceTypes:a5 additionalPlaceTypesCount:v10 traits:v16];
    uint64_t v22 = [[_GEOBatchReverseGeocodeRequestTicket alloc] initWithRequest:v21 locationShifter:v15 traits:v16];
  }
  else
  {
    uint64_t v22 = [(GEOMapService *)self _ticketForLegacyBatchReverseGeocodeLocations:v14 locationShifter:v15 additionalPlaceTypes:a5 additionalPlaceTypesCount:v10 placeTypeLimit:v9 traits:v16];
  }

  return v22;
}

id __140__GEOMapService_ticketForBatchReverseGeocodeLocations_locationShifter_additionalPlaceTypes_additionalPlaceTypesCount_placeTypeLimit_traits___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if ([v3 hasCoarseMetadata])
  {
    id v4 = v3;
  }
  else
  {
    id v4 = (id)[v3 copy];
    [v4 setCoarseMetadata:*(void *)(a1 + 32)];
  }

  return v4;
}

- (id)ticketForAirportCode:(id)a3 terminalCode:(id)a4 gateCode:(id)a5 traits:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  if (!v13)
  {
    id v13 = [(GEOMapService *)self defaultTraits];
  }
  id v14 = [[GEOPDPlaceRequest alloc] initWithAirportCode:v10 terminalCode:v11 gateCode:v12 traits:v13];
  id v15 = [[_GEOPlaceRequestTicket alloc] initWithRequest:v14 traits:v13];

  return v15;
}

- (id)ticketForExternalTransitStationCodes:(id)a3 sourceID:(id)a4 transactionDate:(id)a5 transactionLocation:(id)a6 traits:(id)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  id v16 = a7;
  if (!v16)
  {
    id v16 = [(GEOMapService *)self defaultTraits];
  }
  uint64_t v17 = [[GEOPDPlaceRequest alloc] initWithExternalTransitStationCodes:v12 sourceID:v13 transactionDate:v14 transactionLocation:v15 traits:v16];
  uint64_t v18 = [[_GEOPlaceRequestTicket alloc] initWithRequest:v17 traits:v16];

  return v18;
}

- (id)ticketForSpatialLookupParameters:(id)a3 traits:(id)a4
{
  uint64_t v42 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  if (!v7)
  {
    id v7 = [(GEOMapService *)self defaultTraits];
  }
  uint64_t v31 = v7;
  int v8 = objc_alloc_init(GEOSpatialLookupBatchRequest);
  uint64_t v9 = +[GEOCountryConfiguration sharedConfiguration];
  id v10 = [v9 countryCode];
  [(GEOSpatialLookupBatchRequest *)v8 setDeviceCountryCode:v10];

  id v11 = +[GEOPlatform sharedPlatform];
  id v12 = [v11 deviceCountrySKUForServiceRequests];
  [(GEOSpatialLookupBatchRequest *)v8 setDeviceSku:v12];

  long long v38 = 0u;
  long long v39 = 0u;
  long long v36 = 0u;
  long long v37 = 0u;
  id v13 = v6;
  uint64_t v14 = [v13 countByEnumeratingWithState:&v36 objects:v41 count:16];
  if (v14)
  {
    uint64_t v15 = v14;
    uint64_t v16 = *(void *)v37;
    do
    {
      for (uint64_t i = 0; i != v15; ++i)
      {
        if (*(void *)v37 != v16) {
          objc_enumerationMutation(v13);
        }
        uint64_t v18 = *(void **)(*((void *)&v36 + 1) + 8 * i);
        uint64_t v19 = objc_alloc_init(GEOSpatialLookupRequest);
        uint64_t v20 = [GEOLatLng alloc];
        [v18 coordinate];
        id v21 = -[GEOLatLng initWithCoordinate:](v20, "initWithCoordinate:");
        [(GEOSpatialLookupRequest *)v19 setCenter:v21];

        [v18 radius];
        if (v22 > 0.0)
        {
          [v18 radius];
          [(GEOSpatialLookupRequest *)v19 setRadius:(int)v23];
        }
        long long v34 = 0u;
        long long v35 = 0u;
        long long v32 = 0u;
        long long v33 = 0u;
        int v24 = [v18 categories];
        uint64_t v25 = [v24 countByEnumeratingWithState:&v32 objects:v40 count:16];
        if (v25)
        {
          uint64_t v26 = v25;
          uint64_t v27 = *(void *)v33;
          do
          {
            for (uint64_t j = 0; j != v26; ++j)
            {
              if (*(void *)v33 != v27) {
                objc_enumerationMutation(v24);
              }
              -[GEOSpatialLookupRequest addCategory:](v19, "addCategory:", _GEOPDSpatialLookupCategoryForCategory([*(id *)(*((void *)&v32 + 1) + 8 * j) integerValue]));
            }
            uint64_t v26 = [v24 countByEnumeratingWithState:&v32 objects:v40 count:16];
          }
          while (v26);
        }

        [(GEOSpatialLookupBatchRequest *)v8 addRequest:v19];
      }
      uint64_t v15 = [v13 countByEnumeratingWithState:&v36 objects:v41 count:16];
    }
    while (v15);
  }

  uint64_t v29 = [[_GEOBatchSpatialLookupTicket alloc] initWithRequest:v8 forParameters:v13 traits:v31];

  return v29;
}

- (unint64_t)maxParametersCountForSpatialPlaceLookup
{
  return +[_GEOMapServiceSpatialPlaceLookupTicket maxParametersCount];
}

- (id)ticketForSpatialPlaceLookupParameters:(id)a3 traits:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if ([v6 count])
  {
    if (!v7)
    {
      id v7 = [(GEOMapService *)self defaultTraits];
    }
    int v8 = [[GEOPDPlaceRequest alloc] initWithSpatialPlaceLookupParameters:v6 traits:v7];
    uint64_t v9 = [[_GEOMapServiceSpatialPlaceLookupTicket alloc] initWithRequest:v8 parameters:v6 traits:v7];
  }
  else
  {
    uint64_t v9 = 0;
  }

  return v9;
}

- (unint64_t)maxParametersCountForSpatialEventLookup
{
  return +[_GEOMapServiceSpatialEventLookupTicket maxParametersCount];
}

- (id)ticketForSpatialEventLookupParameters:(id)a3 traits:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if ([v6 count])
  {
    if (!v7)
    {
      id v7 = [(GEOMapService *)self defaultTraits];
    }
    int v8 = [[GEOPDPlaceRequest alloc] initWithSpatialEventLookupParameters:v6 traits:v7];
    uint64_t v9 = [[_GEOMapServiceSpatialEventLookupTicket alloc] initWithRequest:v8 parameters:v6 traits:v7];
  }
  else
  {
    uint64_t v9 = 0;
  }

  return v9;
}

- (id)ticketForFeedbackRequestParameters:(id)a3 placeForProblemContext:(id)a4 userCredentials:(id)a5 pushToken:(id)a6 allowContactBackAtEmailAddress:(id)a7 traits:(id)a8
{
  id v14 = a3;
  id v15 = a4;
  id v16 = a5;
  id v17 = a6;
  id v18 = a7;
  id v19 = a8;
  if (!v19)
  {
    id v19 = [(GEOMapService *)self defaultTraits];
  }
  uint64_t v20 = [[_GEORPFeedbackTicket alloc] initWithFeedbackRequestParameters:v14 placeForProblemContext:v15 userCredentials:v16 pushToken:v17 allowContactBackAtEmailAddress:v18 traits:v19];

  return v20;
}

- (id)ticketForFeedbackRequestData:(id)a3 traits:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (!v7)
  {
    id v7 = [(GEOMapService *)self defaultTraits];
  }
  int v8 = [[_GEORPFeedbackTicket alloc] initWithFeedbackRequestData:v6 traits:v7];

  return v8;
}

- (id)ticketForFeedbackRequest:(id)a3 traits:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (!v7)
  {
    id v7 = [(GEOMapService *)self defaultTraits];
  }
  int v8 = [[_GEORPFeedbackTicket alloc] initWithFeedbackRequest:v6 traits:v7];

  return v8;
}

- (id)ticketForPlaceLookupWithSearchCategory:(id)a3 parentMuid:(unint64_t)a4 traits:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  if (!v9)
  {
    id v9 = [(GEOMapService *)self defaultTraits];
  }
  id v10 = [GEOPDPlaceRequest alloc];
  id v11 = [v8 _suggestionEntryMetadata];
  id v12 = [(GEOPDPlaceRequest *)v10 initWithCategoryMetadata:v11 parentMuid:a4 traits:v9];

  id v13 = [(_GEOPlaceRequestTicket *)[_GEOPlaceSearchRequestTicket alloc] initWithRequest:v12 traits:v9];

  return v13;
}

- (id)ticketForSearchPoisForBrandMUID:(unint64_t)a3 traits:(id)a4
{
  id v6 = a4;
  if (!v6)
  {
    id v6 = [(GEOMapService *)self defaultTraits];
  }
  id v7 = [[GEOPDPlaceRequest alloc] initWithBrandMUID:a3 traits:v6];
  id v8 = [(_GEOPlaceRequestTicket *)[_GEOPlaceSearchRequestTicket alloc] initWithRequest:v7 traits:v6];

  return v8;
}

- (id)ticketForTransitScheduleAtStation:(unint64_t)a3 line:(unint64_t)a4 referenceTripID:(unint64_t)a5 includeAllDirectionNames:(BOOL)a6 routingParameters:(id)a7 traits:(id)a8
{
  BOOL v9 = a6;
  id v13 = a8;
  id v14 = a7;
  id v15 = [[GEOPDPlaceRequest alloc] initWithTransitScheduleAtStation:a3 line:a4 referenceTripId:a5 includeAllDirectionNames:v9 routingParameters:v14 traits:v13];

  id v16 = [(_GEOPlaceRequestTicket *)[_GEOPlaceSearchRequestTicket alloc] initWithRequest:v15 traits:v13];

  return v16;
}

- (id)ticketForUpdatedTransitScheduleDetailsAtStation:(unint64_t)a3 line:(unint64_t)a4 referenceTripID:(unint64_t)a5 includeAllDirectionNames:(BOOL)a6 routingParameters:(id)a7 traits:(id)a8
{
  BOOL v9 = a6;
  id v13 = a8;
  id v14 = a7;
  id v15 = [[GEOPDPlaceRequest alloc] initWithUpdatedTransitScheduleDetailsAtStation:a3 line:a4 referenceTripId:a5 includeAllDirectionNames:v9 routingParameters:v14 traits:v13];

  id v16 = [(_GEOPlaceRequestTicket *)[_GEOPlaceSearchRequestTicket alloc] initWithRequest:v15 traits:v13];

  return v16;
}

- (id)ticketForTransitDeparturesAtStation:(unint64_t)a3 line:(unint64_t)a4 referenceTripID:(unint64_t)a5 includeAllDirectionNames:(BOOL)a6 traits:(id)a7
{
  BOOL v7 = a6;
  id v11 = a7;
  id v12 = [[GEOPDPlaceRequest alloc] initWithTransitDeparturesAtStation:a3 line:a4 referenceTripId:a5 includeAllDirectionNames:v7 routingParameters:0 traits:v11];
  id v13 = [(_GEOPlaceRequestTicket *)[_GEOPlaceSearchRequestTicket alloc] initWithRequest:v12 traits:v11];

  return v13;
}

- (id)ticketForTransitTripDetailsAtStation:(unint64_t)a3 line:(unint64_t)a4 referenceTripID:(unint64_t)a5 includeAllDirectionNames:(BOOL)a6 routingParameters:(id)a7 traits:(id)a8
{
  BOOL v9 = a6;
  id v13 = a8;
  id v14 = a7;
  id v15 = [[GEOPDPlaceRequest alloc] initWithTransitTripDetailsAtStation:a3 line:a4 referenceTripId:a5 includeAllDirectionNames:v9 routingParameters:v14 traits:v13];

  id v16 = [(_GEOPlaceRequestTicket *)[_GEOPlaceSearchRequestTicket alloc] initWithRequest:v15 traits:v13];

  return v16;
}

- (id)ticketForTransitTripIdentifiers:(id)a3 traits:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  BOOL v7 = [[GEOPDPlaceRequest alloc] initWithTripIds:v6 traits:v5];

  id v8 = [(_GEOPlaceRequestTicket *)[_GEOPlaceSearchRequestTicket alloc] initWithRequest:v7 traits:v5];

  return v8;
}

- (id)ticketForNearbyTransitDeparturesWithLookupOrigin:(id)a3 userLocation:(id)a4 traits:(id)a5
{
  id v7 = a5;
  id v8 = a4;
  id v9 = a3;
  id v10 = [[GEOPDPlaceRequest alloc] initWithNearbyTransitDeparturesWithLookupOrigin:v9 userLocation:v8 traits:v7];

  id v11 = [(_GEOPlaceRequestTicket *)[_GEOPlaceSearchRequestTicket alloc] initWithRequest:v10 traits:v7];

  return v11;
}

- (id)ticketForNearbyTransitPaymentInfoForLocations:(id)a3 traits:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  id v7 = [[GEOPDPlaceRequest alloc] initForNearbyTransitPaymentLookupAtLocations:v6 traits:v5];

  id v8 = [(_GEOPlaceRequestTicket *)[_GEOPlaceSearchRequestTicket alloc] initWithRequest:v7 traits:v5];

  return v8;
}

- (id)ticketForSearchQuery:(id)a3 completionItem:(id)a4 maxResults:(unsigned int)a5 traits:(id)a6
{
  return [(GEOMapService *)self ticketForSearchQuery:a3 completionItem:a4 maxResults:*(void *)&a5 traits:a6 searchSessionData:0];
}

- (id)ticketForSearchQuery:(id)a3 completionItem:(id)a4 maxResults:(unsigned int)a5 traits:(id)a6 searchSessionData:(id)a7
{
  return [(GEOMapService *)self ticketForSearchQuery:a3 completionItem:a4 retainedSearch:0 maxResults:*(void *)&a5 suppressResultsRequiringAttribution:0 traits:a6 searchSessionData:a7];
}

- (id)ticketForSearchQuery:(id)a3 completionItem:(id)a4 retainedSearch:(id)a5 maxResults:(unsigned int)a6 traits:(id)a7
{
  return [(GEOMapService *)self ticketForSearchQuery:a3 completionItem:a4 retainedSearch:a5 maxResults:*(void *)&a6 traits:a7 searchSessionData:0];
}

- (id)ticketForSearchQuery:(id)a3 completionItem:(id)a4 retainedSearch:(id)a5 maxResults:(unsigned int)a6 traits:(id)a7 searchSessionData:(id)a8
{
  return [(GEOMapService *)self ticketForSearchQuery:a3 completionItem:a4 retainedSearch:a5 maxResults:*(void *)&a6 suppressResultsRequiringAttribution:0 traits:a7 searchSessionData:a8];
}

- (id)ticketForSearchQuery:(id)a3 completionItem:(id)a4 relatedSearchSuggestion:(id)a5 retainedSearch:(id)a6 maxResults:(unsigned int)a7 traits:(id)a8
{
  return [(GEOMapService *)self ticketForSearchQuery:a3 completionItem:a4 relatedSearchSuggestion:a5 retainedSearch:a6 maxResults:*(void *)&a7 traits:a8 searchSessionData:0];
}

- (id)ticketForSearchQuery:(id)a3 completionItem:(id)a4 relatedSearchSuggestion:(id)a5 retainedSearch:(id)a6 maxResults:(unsigned int)a7 traits:(id)a8 searchSessionData:(id)a9
{
  id v33 = a3;
  id v15 = a4;
  id v16 = a5;
  id v17 = a6;
  id v18 = a8;
  id v19 = a9;
  if (!v18)
  {
    id v18 = [(GEOMapService *)self defaultTraits];
  }
  if (a7 <= 1) {
    uint64_t v20 = 1;
  }
  else {
    uint64_t v20 = a7;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v21 = [v15 entry];
  }
  else
  {
    id v21 = 0;
  }
  double v22 = [GEOPDPlaceRequest alloc];
  long long v32 = v16;
  double v23 = [v16 _suggestionEntryMetadata];
  int v24 = [v15 metadata];
  uint64_t v25 = [v17 _retainedSearchMetadata];
  id v34 = 0;
  LOBYTE(v31) = 0;
  uint64_t v26 = [(GEOPDPlaceRequest *)v22 initWithSearchQuery:v33 entryMetadata:v23 metadata:v24 autocompleteEntry:v21 retainedSearch:v25 maxResults:v20 filters:MEMORY[0x1E4F1CBF0] suppressResultsRequiringAttribution:v31 traits:v18 routeInfo:0 error:&v34 searchSessionData:v19];
  id v27 = v34;

  if (v26) {
    id v28 = [(_GEOPlaceRequestTicket *)[_GEOPlaceSearchRequestTicket alloc] initWithRequest:v26 traits:v18];
  }
  else {
    id v28 = [(_GEOFailedTicket *)[_GEOFailedSearchTicket alloc] initWithError:v27 traits:v18];
  }
  uint64_t v29 = v28;

  return v29;
}

- (id)ticketForSearchQuery:(id)a3 completionItem:(id)a4 retainedSearch:(id)a5 maxResults:(unsigned int)a6 suppressResultsRequiringAttribution:(BOOL)a7 traits:(id)a8
{
  return [(GEOMapService *)self ticketForSearchQuery:a3 completionItem:a4 retainedSearch:a5 maxResults:*(void *)&a6 suppressResultsRequiringAttribution:a7 traits:a8 searchSessionData:0];
}

- (id)ticketForSearchQuery:(id)a3 completionItem:(id)a4 retainedSearch:(id)a5 maxResults:(unsigned int)a6 suppressResultsRequiringAttribution:(BOOL)a7 traits:(id)a8 searchSessionData:(id)a9
{
  return [(GEOMapService *)self ticketForSearchQuery:a3 filters:MEMORY[0x1E4F1CBF0] completionItem:a4 retainedSearch:a5 maxResults:*(void *)&a6 suppressResultsRequiringAttribution:a7 traits:a8 searchSessionData:a9];
}

- (id)ticketForSearchQuery:(id)a3 filters:(id)a4 completionItem:(id)a5 retainedSearch:(id)a6 maxResults:(unsigned int)a7 suppressResultsRequiringAttribution:(BOOL)a8 traits:(id)a9
{
  return [(GEOMapService *)self ticketForSearchQuery:a3 filters:a4 completionItem:a5 retainedSearch:a6 maxResults:*(void *)&a7 suppressResultsRequiringAttribution:a8 traits:a9 searchSessionData:0];
}

- (id)ticketForSearchQuery:(id)a3 filters:(id)a4 completionItem:(id)a5 retainedSearch:(id)a6 maxResults:(unsigned int)a7 suppressResultsRequiringAttribution:(BOOL)a8 traits:(id)a9 searchSessionData:(id)a10
{
  id v15 = a3;
  id v44 = a4;
  id v16 = a5;
  id v43 = a6;
  id v17 = a9;
  id v42 = a10;
  if (!v17)
  {
    id v17 = [(GEOMapService *)self defaultTraits];
  }
  if (a7 <= 1) {
    uint64_t v18 = 1;
  }
  else {
    uint64_t v18 = a7;
  }
  if ([v17 navigating] && objc_msgSend(v17, "hasAddStopRouteInfo"))
  {
    id v19 = objc_alloc_init(GEOPDRecentRouteInfo);
    uint64_t v20 = [v17 addStopRouteInfo];
    id v21 = [v20 zilchData];

    if (v21)
    {
      double v22 = [v20 zilchData];
      -[GEOPDRecentRouteInfo addZilchPointSegment:]((uint64_t)v19, v22);
    }
    double v23 = [v20 originalWaypointRouteRepresentation];
    -[GEOPDRecentRouteInfo setOriginalWaypointRoute:]((uint64_t)v19, v23);

    int v24 = [v20 sessionState];
    -[GEOPDRecentRouteInfo setSessionState:]((uint64_t)v19, v24);

    uint64_t v25 = [v20 routeId];
    -[GEOPDRecentRouteInfo setRouteId:]((uint64_t)v19, v25);
  }
  else
  {
    id v19 = 0;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v26 = [v16 entry];
  }
  else
  {
    uint64_t v26 = 0;
  }
  id v27 = [GEOPDPlaceRequest alloc];
  id v28 = [v16 entryMetadata];
  long long v41 = v16;
  uint64_t v29 = [v16 metadata];
  uint64_t v30 = [v43 _retainedSearchMetadata];
  id v45 = 0;
  uint64_t v31 = v19;
  long long v39 = v19;
  LOBYTE(v38) = a8;
  long long v32 = v15;
  id v33 = [(GEOPDPlaceRequest *)v27 initWithSearchQuery:v15 entryMetadata:v28 metadata:v29 autocompleteEntry:v26 retainedSearch:v30 maxResults:v18 filters:v44 suppressResultsRequiringAttribution:v38 traits:v17 routeInfo:v39 error:&v45 searchSessionData:v42];
  id v34 = v45;

  if (v33) {
    long long v35 = [(_GEOPlaceRequestTicket *)[_GEOPlaceSearchRequestTicket alloc] initWithRequest:v33 traits:v17];
  }
  else {
    long long v35 = [[_GEOFailedSearchTicket alloc] initWithError:v34 searchQuery:v32 traits:v17];
  }
  long long v36 = v35;

  return v36;
}

- (id)ticketForMapItemToRefine:(id)a3 traits:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (!v7)
  {
    id v7 = [(GEOMapService *)self defaultTraits];
  }
  id v8 = [[GEOPDPlaceRequest alloc] initWithMapItemToRefine:v6 traits:v7];
  id v9 = [[_GEOPlaceRequestTicket alloc] initWithRequest:v8 traits:v7 mapItemToRefine:v6];

  return v9;
}

- (id)ticketForPlaceRefinementRequestWithCoordinate:(id *)a3 addressLine:(id)a4 placeName:(id)a5 traits:(id)a6
{
  id v10 = a4;
  id v11 = a5;
  id v12 = a6;
  id v13 = objc_alloc_init(GEOPDPlaceRefinementParameters);
  id v15 = v13;
  if (v10)
  {
    -[GEOPDPlaceRefinementParameters clearFormattedAddressLineHints]((uint64_t)v13);
    -[GEOPDPlaceRefinementParameters addFormattedAddressLineHint:]((uint64_t)v15, v10);
  }
  if (v11) {
    -[GEOPDPlaceRefinementParameters setPlaceNameHint:]((uint64_t)v15, v11);
  }
  if (a3)
  {
    double var1 = a3->var1;
    if (var1 >= -180.0 && var1 <= 180.0)
    {
      double var1 = a3->var0;
      if (a3->var0 >= -90.0 && var1 <= 90.0)
      {
        id v16 = objc_alloc_init(GEOLatLng);
        [(GEOLatLng *)v16 setLat:a3->var0];
        [(GEOLatLng *)v16 setLng:a3->var1];
        -[GEOPDPlaceRefinementParameters setLocationHint:]((uint64_t)v15, v16);
      }
    }
  }
  id v17 = -[GEOMapService ticketForPlaceRefinementRequestParameters:traits:](self, "ticketForPlaceRefinementRequestParameters:traits:", v15, v12, var1);

  return v17;
}

- (id)ticketForPlaceRefinementRequestParameters:(id)a3 traits:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (!v7)
  {
    id v7 = [(GEOMapService *)self defaultTraits];
  }
  id v8 = [[GEOPDPlaceRequest alloc] initWithPlaceRefinementParameters:v6 traits:v7];
  id v9 = [[_GEOPlaceRequestTicket alloc] initWithRequest:v8 traits:v7];

  return v9;
}

- (id)ticketForVendorSpecificPlaceRefinementRequestParameters:(id)a3 traits:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (!v7)
  {
    id v7 = [(GEOMapService *)self defaultTraits];
  }
  id v8 = [[GEOPDPlaceRequest alloc] initWithVendorSpecificPlaceRefinementParameters:v6 traits:v7];
  id v9 = [[_GEOPlaceRequestTicket alloc] initWithRequest:v8 traits:v7];

  return v9;
}

- (id)ticketForCanonicalLocationSearchQueryString:(id)a3 traits:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (!v7)
  {
    id v7 = [(GEOMapService *)self defaultTraits];
  }
  id v8 = [[GEOPDPlaceRequest alloc] initWithCanonicalLocationSearchQueryString:v6 traits:v7];
  id v9 = [[_GEOPlaceRequestTicket alloc] initWithRequest:v8 traits:v7];

  return v9;
}

- (id)ticketForURLQuery:(id)a3 identifier:(id)a4 resultProviderId:(int)a5 contentProvider:(id)a6 maxResults:(unsigned int)a7 traits:(id)a8
{
  uint64_t v9 = *(void *)&a7;
  LODWORD(v11) = a5;
  id v14 = a3;
  id v15 = a4;
  id v16 = a6;
  id v17 = a8;
  uint64_t v18 = v17;
  unsigned int overriddenResultProviderID = self->_overriddenResultProviderID;
  if (overriddenResultProviderID) {
    uint64_t v11 = overriddenResultProviderID;
  }
  else {
    uint64_t v11 = v11;
  }
  if (!v17)
  {
    uint64_t v18 = [(GEOMapService *)self defaultTraits];
  }
  if ([v15 muid])
  {
    uint64_t v20 = [[GEOPDPlaceRequest alloc] initWithSearchURLQuery:v14 identifier:v15 resultProviderId:v11 contentProvider:v16 maxResults:v9 traits:v18];
    goto LABEL_8;
  }
  uint64_t v24 = [v14 length];
  [v15 coordinate];
  double v27 = v25;
  if (v24)
  {
    double v28 = fabs(v26 + 180.0);
    uint64_t v29 = [GEOPDPlaceRequest alloc];
    uint64_t v30 = v29;
    if (v28 < 0.00000001 && fabs(v27 + 180.0) < 0.00000001)
    {
      id v33 = 0;
      LOBYTE(v32) = 0;
      id v21 = [(GEOPDPlaceRequest *)v29 initWithSearchQuery:v14 entryMetadata:0 metadata:0 autocompleteEntry:0 retainedSearch:0 maxResults:v9 filters:MEMORY[0x1E4F1CBF0] suppressResultsRequiringAttribution:v32 traits:v18 routeInfo:0 error:&v33 searchSessionData:0];
      id v22 = v33;
      if (v21) {
        goto LABEL_9;
      }
      goto LABEL_14;
    }
    [v15 coordinate];
    uint64_t v20 = -[GEOPDPlaceRequest initWithSearchURLQuery:coordinate:maxResults:traits:](v30, "initWithSearchURLQuery:coordinate:maxResults:traits:", v14, v9, v18);
LABEL_8:
    id v21 = v20;
    id v22 = 0;
    if (v20)
    {
LABEL_9:
      double v23 = [(_GEOPlaceRequestTicket *)[_GEOPlaceSearchRequestTicket alloc] initWithRequest:v21 traits:v18];

LABEL_15:
      goto LABEL_16;
    }
LABEL_14:
    double v23 = [[_GEOFailedSearchTicket alloc] initWithError:v22 searchQuery:v14 traits:v18];
    goto LABEL_15;
  }
  double v23 = [(GEOMapService *)self _searchable_ticketForReverseGeocodeCoordinate:1 includeEntryPoints:0 shiftLocationsIfNeeded:0 preserveOriginalLocation:v18 traits:v25];
LABEL_16:

  return v23;
}

- (id)_ticketForAutocompleteFragment:(id)a3 type:(int)a4 traits:(id)a5 filters:(id)a6 retainedSearch:(id)a7 tappedQuerySuggestion:(id)a8 sessionData:(id)a9
{
  uint64_t v13 = *(void *)&a4;
  id v15 = a3;
  id v16 = a5;
  id v17 = a6;
  id v18 = a7;
  id v19 = a8;
  id v20 = a9;
  if (!v16)
  {
    id v16 = [(GEOMapService *)self defaultTraits];
  }
  id v21 = [GEOPDPlaceRequest alloc];
  id v22 = [v18 _retainedSearchMetadata];
  id v28 = 0;
  double v23 = [(GEOPDPlaceRequest *)v21 initWithAutocompleteFragment:v15 type:v13 traits:v16 filters:v17 retainedSearch:v22 tappedQuerySuggestion:v19 sessionData:v20 error:&v28];
  id v24 = v28;

  if (v23) {
    double v25 = [[_GEOPlaceSearchAutocompleteTicket alloc] initWithRequest:v23 traits:v16 searchQuery:v15 sessionData:v20];
  }
  else {
    double v25 = [[_GEOFailedCompletionTicket alloc] initWithError:v24 searchQuery:v15 traits:v16];
  }
  double v26 = v25;

  return v26;
}

- (id)ticketForVendorIdentifier:(id)a3 mapItemIdentifier:(id)a4 range:(_NSRange)a5 traits:(id)a6
{
  NSUInteger length = a5.length;
  NSUInteger location = a5.location;
  id v10 = a6;
  id v11 = a4;
  id v12 = a3;
  uint64_t v13 = -[_GEOPlacePhotoLookupTicket initWithVendorIdentifier:mapItemIdentifier:range:traits:]([_GEOPlacePhotoLookupTicket alloc], "initWithVendorIdentifier:mapItemIdentifier:range:traits:", v12, v11, location, length, v10);

  return v13;
}

- (id)ticketForCategoryIdentifier:(id)a3 mapItemIdentifier:(id)a4 range:(_NSRange)a5 traits:(id)a6
{
  NSUInteger length = a5.length;
  NSUInteger location = a5.location;
  id v10 = a6;
  id v11 = a4;
  id v12 = a3;
  uint64_t v13 = -[_GEOPlaceComingledPhotoLookupTicket initWithPhotoCategoryIdentifier:mapItemIdentifier:range:traits:]([_GEOPlaceComingledPhotoLookupTicket alloc], "initWithPhotoCategoryIdentifier:mapItemIdentifier:range:traits:", v12, v11, location, length, v10);

  return v13;
}

- (id)ticketForInterleavedInstantSearchFragment:(id)a3 filters:(id)a4 sessionData:(id)a5 traits:(id)a6
{
  return [(GEOMapService *)self _ticketForAutocompleteFragment:a3 type:0 traits:a6 filters:a4 retainedSearch:0 tappedQuerySuggestion:0 sessionData:a5];
}

- (id)ticketForInterleavedAutoCompleteSearchFragment:(id)a3 filters:(id)a4 sessionData:(id)a5 traits:(id)a6
{
  return [(GEOMapService *)self _ticketForAutocompleteFragment:a3 type:1 traits:a6 filters:a4 retainedSearch:0 tappedQuerySuggestion:0 sessionData:a5];
}

- (id)ticketForInterleavedLocalitiesAndLandmarksSearchFragment:(id)a3 sessionData:(id)a4 traits:(id)a5
{
  return [(GEOMapService *)self _ticketForAutocompleteFragment:a3 type:2 traits:a5 filters:0 retainedSearch:0 tappedQuerySuggestion:0 sessionData:a4];
}

- (id)ticketForInterleavedAutoCompleteWithBrowseSearchFragment:(id)a3 filters:(id)a4 retainedSearch:(id)a5 tappedQuerySuggestion:(id)a6 sessionData:(id)a7 traits:(id)a8
{
  return [(GEOMapService *)self _ticketForAutocompleteFragment:a3 type:3 traits:a8 filters:a4 retainedSearch:a5 tappedQuerySuggestion:a6 sessionData:a7];
}

- (id)ticketForInterleavedAutoCompletePoiAddressOnly:(id)a3 sessionData:(id)a4 traits:(id)a5
{
  return [(GEOMapService *)self _ticketForAutocompleteFragment:a3 type:9 traits:a5 filters:0 retainedSearch:0 tappedQuerySuggestion:0 sessionData:a4];
}

- (id)ticketForSectionedInstantSearchFragment:(id)a3 filters:(id)a4 sessionData:(id)a5 traits:(id)a6
{
  return [(GEOMapService *)self _ticketForAutocompleteFragment:a3 type:0 traits:a6 filters:0 retainedSearch:0 tappedQuerySuggestion:0 sessionData:a5];
}

- (id)ticketForSectionedAutoCompleteSearchFragment:(id)a3 filters:(id)a4 sessionData:(id)a5 traits:(id)a6
{
  return [(GEOMapService *)self _ticketForAutocompleteFragment:a3 type:1 traits:a6 filters:a4 retainedSearch:0 tappedQuerySuggestion:0 sessionData:a5];
}

- (id)ticketForSectionedLocalitiesAndLandmarksSearchFragment:(id)a3 sessionData:(id)a4 traits:(id)a5
{
  return [(GEOMapService *)self _ticketForAutocompleteFragment:a3 type:2 traits:a5 filters:0 retainedSearch:0 tappedQuerySuggestion:0 sessionData:a4];
}

- (id)ticketForOfflineRegionSearchFragment:(id)a3 sessionData:(id)a4 traits:(id)a5
{
  return [(GEOMapService *)self _ticketForAutocompleteFragment:a3 type:8 traits:a5 filters:0 retainedSearch:0 tappedQuerySuggestion:0 sessionData:a4];
}

- (id)ticketForCategoryListWithTraits:(id)a3 isFromNoQueryState:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  if (!v6)
  {
    id v6 = [(GEOMapService *)self defaultTraits];
  }
  id v7 = [[GEOPDPlaceRequest alloc] initForCategoryListWithTraits:v6 isFromNoQueryState:v4];
  id v8 = [(GEOAbstractRequestResponseTicket *)[_GEOPlaceSearchCategoryTicket alloc] initWithRequest:v7 traits:v6];

  return v8;
}

- (id)ticketForDFRCategoryListWithTraits:(id)a3
{
  return 0;
}

- (id)ticketForTransitLines:(id)a3 withTraits:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (!v7)
  {
    id v7 = [(GEOMapService *)self defaultTraits];
  }
  id v8 = [[GEOPDPlaceRequest alloc] initWithIdentifiers:v6 resultProviderID:0 traits:v7];
  uint64_t v9 = [(GEOAbstractRequestResponseTicket *)[_GEOTransitLineTicket alloc] initWithRequest:v8 traits:v7];

  return v9;
}

- (id)ticketForNearestTransitStation:(id)a3 coordinate:(id)a4 traits:(id)a5
{
  double var1 = a4.var1;
  double var0 = a4.var0;
  id v9 = a3;
  id v10 = a5;
  if (!v10)
  {
    id v10 = [(GEOMapService *)self defaultTraits];
  }
  id v11 = -[GEOPDPlaceRequest initForNearestTransitStationWithLine:coordinate:traits:]([GEOPDPlaceRequest alloc], "initForNearestTransitStationWithLine:coordinate:traits:", v9, v10, var0, var1);
  id v12 = [[_GEOPlaceRequestTicket alloc] initWithRequest:v11 traits:v10];

  return v12;
}

- (id)ticketforCategory:(id)a3 maxResults:(unsigned int)a4 traits:(id)a5 searchSessionData:(id)a6
{
  LODWORD(v8) = a4;
  id v10 = a3;
  id v11 = a5;
  id v12 = a6;
  if (!v11)
  {
    id v11 = [(GEOMapService *)self defaultTraits];
  }
  if (v8 <= 1) {
    uint64_t v8 = 1;
  }
  else {
    uint64_t v8 = v8;
  }
  uint64_t v13 = [v10 _autocompleteEntry];
  if (v13
    && (id v14 = (void *)v13,
        [v10 _suggestionEntryMetadata],
        id v15 = objc_claimAutoreleasedReturnValue(),
        v15,
        v14,
        !v15))
  {
    id v18 = [GEOPDPlaceRequest alloc];
    id v19 = [v10 displayString];
    id v20 = [v10 _autocompleteEntry];
    id v26 = 0;
    LOBYTE(v25) = 0;
    id v21 = [(GEOPDPlaceRequest *)v18 initWithSearchQuery:v19 entryMetadata:0 metadata:0 autocompleteEntry:v20 retainedSearch:0 maxResults:v8 filters:MEMORY[0x1E4F1CBF0] suppressResultsRequiringAttribution:v25 traits:v11 routeInfo:0 error:&v26 searchSessionData:v12];
    id v22 = v26;

    if (v21) {
      double v23 = [(_GEOPlaceRequestTicket *)[_GEOPlaceSearchRequestTicket alloc] initWithRequest:v21 traits:v11];
    }
    else {
      double v23 = [[_GEOFailedTicket alloc] initWithError:v22 traits:v11];
    }
    p_super = &v23->super;
  }
  else
  {
    id v16 = [[GEOPDPlaceRequest alloc] initWithCategory:v10 maxResults:v8 traits:v11 searchSessionData:v12];
    p_super = [[_GEOPlaceRequestTicket alloc] initWithRequest:v16 traits:v11];
  }

  return p_super;
}

- (id)searchAroundPOITicketWithIdentifier:(id)a3 categoryID:(id)a4 maxResults:(unsigned int)a5 traits:(id)a6
{
  LODWORD(v7) = a5;
  id v10 = a3;
  id v11 = a4;
  id v12 = a6;
  if (!v12)
  {
    id v12 = [(GEOMapService *)self defaultTraits];
  }
  if (v7 <= 1) {
    uint64_t v7 = 1;
  }
  else {
    uint64_t v7 = v7;
  }
  uint64_t v13 = [[GEOPDPlaceRequest alloc] initWithGeoMapItemIdentifier:v10 categoryID:v11 maxResults:v7 traits:v12 searchSessionData:0];
  if (v13) {
    id v14 = [(_GEOPlaceRequestTicket *)[_GEOPlaceSearchRequestTicket alloc] initWithRequest:v13 traits:v12];
  }
  else {
    id v14 = [[_GEOFailedTicket alloc] initWithError:0 traits:v12];
  }
  id v15 = v14;

  return v15;
}

- (id)ticketForSearchAlongRouteWithCategory:(id)a3 searchQuery:(id)a4 completionItem:(id)a5 originalWaypointRouteData:(id)a6 zilchData:(id)a7 sessionState:(id)a8 routeId:(id)a9 routeAttributes:(id)a10 maxResults:(unsigned int)a11 traits:(id)a12 searchSessionData:(id)a13
{
  id v47 = a3;
  id v49 = a4;
  id v48 = a5;
  id v18 = a6;
  id v19 = a7;
  id v20 = a8;
  id v21 = a9;
  id v22 = a10;
  id v23 = a12;
  id v50 = a13;
  if (!v23)
  {
    id v23 = [(GEOMapService *)self defaultTraits];
  }
  if (a11 <= 1) {
    uint64_t v24 = 1;
  }
  else {
    uint64_t v24 = a11;
  }
  uint64_t v25 = objc_alloc_init(GEOPDRecentRouteInfo);
  id v26 = v25;
  if (v19) {
    -[GEOPDRecentRouteInfo addZilchPointSegment:]((uint64_t)v25, v19);
  }
  -[GEOPDRecentRouteInfo setOriginalWaypointRoute:]((uint64_t)v26, v18);
  -[GEOPDRecentRouteInfo setSessionState:]((uint64_t)v26, v20);
  -[GEOPDRecentRouteInfo setRouteId:]((uint64_t)v26, v21);
  [v23 useOnlineToOfflineFailoverRequestModeIfAllowed];
  double v27 = v48;
  v46 = v18;
  id v44 = v21;
  if (v47)
  {
    id v28 = [[GEOPDPlaceRequest alloc] initWithCategory:v47 routeInfo:v26 maxResults:v24 traits:v23 searchSessionData:v50];
  }
  else
  {
    id v43 = v19;
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      uint64_t v29 = [v48 entry];
    }
    else
    {
      uint64_t v29 = 0;
    }
    id v30 = v22;
    id v31 = v20;
    uint64_t v32 = [GEOPDPlaceRequest alloc];
    id v33 = [v48 entryMetadata];
    id v34 = [v48 metadata];
    LOBYTE(v41) = 0;
    long long v35 = v32;
    id v20 = v31;
    id v22 = v30;
    id v28 = [(GEOPDPlaceRequest *)v35 initWithSearchQuery:v49 entryMetadata:v33 metadata:v34 autocompleteEntry:v29 retainedSearch:0 maxResults:v24 filters:MEMORY[0x1E4F1CBF0] suppressResultsRequiringAttribution:v41 traits:v23 routeInfo:v26 error:0 searchSessionData:v50];

    double v27 = v48;
    id v19 = v43;
  }
  id v45 = v20;
  if (v22)
  {
    v53[0] = MEMORY[0x1E4F143A8];
    v53[1] = 3221225472;
    v53[2] = __191__GEOMapService_ticketForSearchAlongRouteWithCategory_searchQuery_completionItem_originalWaypointRouteData_zilchData_sessionState_routeId_routeAttributes_maxResults_traits_searchSessionData___block_invoke;
    v53[3] = &unk_1E53E22D0;
    id v36 = v22;
    id v54 = v36;
    id v55 = v47;
    long long v56 = v28;
    long long v37 = (void *)MEMORY[0x18C120660](v53);
    v51[0] = MEMORY[0x1E4F143A8];
    v51[1] = 3221225472;
    v51[2] = __191__GEOMapService_ticketForSearchAlongRouteWithCategory_searchQuery_completionItem_originalWaypointRouteData_zilchData_sessionState_routeId_routeAttributes_maxResults_traits_searchSessionData___block_invoke_3;
    v51[3] = &unk_1E53E22F8;
    id v52 = v36;
    uint64_t v38 = (void *)MEMORY[0x18C120660](v51);
  }
  else
  {
    long long v37 = 0;
    uint64_t v38 = 0;
  }
  long long v39 = [[_GEOPlaceRequestTicket alloc] initWithRequest:v28 traits:v23 preSubmitUpdateRequestBlock:v37 retryForErrorBlock:v38];

  return v39;
}

void __191__GEOMapService_ticketForSearchAlongRouteWithCategory_searchQuery_completionItem_originalWaypointRouteData_zilchData_sessionState_routeId_routeAttributes_maxResults_traits_searchSessionData___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  BOOL v4 = *(void **)(a1 + 32);
  global_queue = (void *)geo_get_global_queue();
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __191__GEOMapService_ticketForSearchAlongRouteWithCategory_searchQuery_completionItem_originalWaypointRouteData_zilchData_sessionState_routeId_routeAttributes_maxResults_traits_searchSessionData___block_invoke_2;
  v7[3] = &unk_1E53E22A8;
  id v8 = *(id *)(a1 + 40);
  id v9 = *(id *)(a1 + 48);
  id v10 = v3;
  id v6 = v3;
  [v4 buildRouteAttributes:global_queue result:v7];
}

void __191__GEOMapService_ticketForSearchAlongRouteWithCategory_searchQuery_completionItem_originalWaypointRouteData_zilchData_sessionState_routeId_routeAttributes_maxResults_traits_searchSessionData___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v18 = a2;
  id v5 = a3;
  uint64_t v6 = *(void *)(a1 + 32);
  uint64_t v7 = [*(id *)(a1 + 40) placeRequestParameters];
  id v8 = v7;
  if (v6)
  {
    -[GEOPDPlaceRequestParameters categorySearchParameters](v7);
    id v9 = (id *)objc_claimAutoreleasedReturnValue();
    -[GEOPDCategorySearchParameters etaFilter](v9);
    id v10 = (GEOPDETAFilter *)objc_claimAutoreleasedReturnValue();

    if (v10) {
      goto LABEL_7;
    }
    id v10 = objc_alloc_init(GEOPDETAFilter);
    id v11 = [*(id *)(a1 + 40) placeRequestParameters];
    id v12 = -[GEOPDPlaceRequestParameters categorySearchParameters](v11);
    -[GEOPDCategorySearchParameters setEtaFilter:]((uint64_t)v12, v10);
  }
  else
  {
    -[GEOPDPlaceRequestParameters searchParameters](v7);
    uint64_t v13 = (id *)objc_claimAutoreleasedReturnValue();
    -[GEOPDSearchParameters etaFilter](v13);
    id v10 = (GEOPDETAFilter *)objc_claimAutoreleasedReturnValue();

    if (v10) {
      goto LABEL_7;
    }
    id v10 = objc_alloc_init(GEOPDETAFilter);
    id v11 = [*(id *)(a1 + 40) placeRequestParameters];
    id v12 = -[GEOPDPlaceRequestParameters searchParameters](v11);
    -[GEOPDSearchParameters setEtaFilter:]((uint64_t)v12, v10);
  }

LABEL_7:
  id v14 = [v18 automobileOptions];

  if (v14)
  {
    id v15 = -[GEOPDETAFilter automobileOptions]((id *)&v10->super.super.isa);

    if (v15)
    {
      id v16 = -[GEOPDETAFilter automobileOptions]((id *)&v10->super.super.isa);
      id v17 = [v18 automobileOptions];
      [v16 mergeFrom:v17];
    }
    else
    {
      id v16 = [v18 automobileOptions];
      -[GEOPDETAFilter setAutomobileOptions:]((uint64_t)v10, v16);
    }
  }
  (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
}

uint64_t __191__GEOMapService_ticketForSearchAlongRouteWithCategory_searchQuery_completionItem_originalWaypointRouteData_zilchData_sessionState_routeId_routeAttributes_maxResults_traits_searchSessionData___block_invoke_3(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) shouldRetryForError:a2];
}

- (id)ticketForSearchQuery:(id)a3 filters:(id)a4 maxResults:(unsigned int)a5 traits:(id)a6
{
  return [(GEOMapService *)self ticketForSearchQuery:a3 filters:a4 maxResults:*(void *)&a5 traits:a6 searchSessionData:0];
}

- (id)ticketForSearchQuery:(id)a3 filters:(id)a4 maxResults:(unsigned int)a5 traits:(id)a6 searchSessionData:(id)a7
{
  return [(GEOMapService *)self ticketForSearchQuery:a3 filters:a4 maxResults:*(void *)&a5 suppressResultsRequiringAttribution:0 traits:a6 searchSessionData:a7];
}

- (id)ticketForSearchQuery:(id)a3 filters:(id)a4 maxResults:(unsigned int)a5 suppressResultsRequiringAttribution:(BOOL)a6 traits:(id)a7
{
  return [(GEOMapService *)self ticketForSearchQuery:a3 filters:a4 maxResults:*(void *)&a5 suppressResultsRequiringAttribution:a6 traits:a7 searchSessionData:0];
}

- (id)ticketForSearchQuery:(id)a3 filters:(id)a4 maxResults:(unsigned int)a5 suppressResultsRequiringAttribution:(BOOL)a6 traits:(id)a7 searchSessionData:(id)a8
{
  LODWORD(v11) = a5;
  id v14 = a3;
  id v15 = a4;
  id v16 = a7;
  id v17 = a8;
  if (!v16)
  {
    id v16 = [(GEOMapService *)self defaultTraits];
  }
  if (v11 <= 1) {
    uint64_t v11 = 1;
  }
  else {
    uint64_t v11 = v11;
  }
  id v24 = 0;
  LOBYTE(v23) = a6;
  id v18 = [[GEOPDPlaceRequest alloc] initWithSearchQuery:v14 entryMetadata:0 metadata:0 autocompleteEntry:0 retainedSearch:0 maxResults:v11 filters:v15 suppressResultsRequiringAttribution:v23 traits:v16 routeInfo:0 error:&v24 searchSessionData:v17];
  id v19 = v24;
  if (v18) {
    id v20 = [[_GEOPlaceRequestTicket alloc] initWithRequest:v18 traits:v16];
  }
  else {
    id v20 = [[_GEOFailedTicket alloc] initWithError:v19 traits:v16];
  }
  id v21 = v20;

  return v21;
}

- (id)ticketForSearchCategory:(id)a3 venueIdentifier:(id)a4 maxResults:(unsigned int)a5 traits:(id)a6
{
  uint64_t v7 = *(void *)&a5;
  id v10 = a3;
  id v11 = a4;
  id v12 = a6;
  uint64_t v13 = v12;
  id v14 = 0;
  if (v10 && v11)
  {
    if (!v12)
    {
      uint64_t v13 = [(GEOMapService *)self defaultTraits];
    }
    id v15 = [[GEOPDPlaceRequest alloc] initWithSearchCategory:v10 venueIdentifier:v11 maxResults:v7 traits:v13];
    id v14 = [[_GEOPlaceRequestTicket alloc] initWithRequest:v15 traits:v13];
  }

  return v14;
}

- (id)ticketForBrandLookupWithIMessageUid:(id)a3 traits:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (!v7)
  {
    id v7 = [(GEOMapService *)self defaultTraits];
  }
  id v8 = [[GEOPDPlaceRequest alloc] initForBrandLookupWithIMessageUid:v6 traits:v7];
  id v9 = [[_GEOPlaceRequestTicket alloc] initWithRequest:v8 traits:v7];

  return v9;
}

- (id)ticketForWifiFingerprintWithLocations:(id)a3 wifiAccessPoints:(id)a4 maxLabels:(unsigned int)a5 traits:(id)a6
{
  return [(GEOMapService *)self ticketForWifiFingerprintWithLocations:a3 wifiAccessPoints:a4 maxLabels:*(void *)&a5 entryTime:0 exitTime:0 traits:a6];
}

- (id)ticketForWifiFingerprintWithLocations:(id)a3 wifiAccessPoints:(id)a4 maxLabels:(unsigned int)a5 entryTime:(unint64_t)a6 exitTime:(unint64_t)a7 traits:(id)a8
{
  uint64_t v11 = *(void *)&a5;
  id v14 = a3;
  id v15 = a4;
  id v16 = a8;
  if (!v16)
  {
    id v16 = [(GEOMapService *)self defaultTraits];
  }
  id v17 = [[GEOPDPlaceRequest alloc] initForWifiFingerprintLookupWithLocations:v14 wifiAccessPoints:v15 maxLabels:v11 entryTime:a6 exitTime:a7 traits:v16];
  id v18 = [[_GEOPlaceRequestTicket alloc] initWithRequest:v17 traits:v16];

  return v18;
}

- (id)ticketForGeoIpLookupForIpAddr:(id)a3
{
  id v3 = a3;
  BOOL v4 = [[_GEOMapServiceGeoIpLookupTicket alloc] initWithIpAddress:v3];

  return v4;
}

- (id)ticketForTerritoryForLocations:(id)a3 shiftLocationsIfNeeded:(BOOL)a4 traits:(id)a5
{
  BOOL v6 = a4;
  id v8 = a3;
  id v9 = a5;
  if (!v9)
  {
    id v9 = [(GEOMapService *)self defaultTraits];
  }
  if (([v9 hasRequestPriority] & 1) == 0
    && GEOConfigGetBOOL(GeoServicesConfig_TerritoryLookupUsesBackgroundDispatcher, (uint64_t)off_1E9115248))
  {
    [v9 setRequestPriority:1];
    objc_msgSend(v9, "setHttpRequestPriority:", GEOConfigGetUint64(GeoServicesConfig_DefaultBackgroundRequestPriority, (uint64_t)off_1E91151E8));
  }
  id v10 = [[_GEOTerritoryLookupRequestTicket alloc] initWithLatLngs:v8 shiftLocationsIfNeeded:v6 traits:v9];

  return v10;
}

- (id)ticketForOfflineRegionNameSuggestionWithRegion:(id)a3 traits:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  if (!v6)
  {
    id v6 = [(GEOMapService *)self defaultTraits];
  }
  id v8 = [[GEOPDPlaceRequest alloc] initForOfflineRegionNameSuggestionWithRegion:v7 traits:v6];

  id v9 = [[_GEOPlaceRequestTicket alloc] initWithRequest:v8 traits:v6];

  return v9;
}

- (id)ticketForSearchCapabilitiesWithTraits:(id)a3
{
  id v4 = a3;
  if (!v4)
  {
    id v4 = [(GEOMapService *)self defaultTraits];
  }
  if ([v4 requestMode] != 4)
  {
    id v5 = (void *)[v4 copy];

    [v5 setRequestMode:4];
    id v4 = v5;
  }
  id v6 = [[GEOPDPlaceRequest alloc] initForSearchCapabilitiesWithTraits:v4];
  id v7 = [(GEOAbstractRequestResponseTicket *)[_GEOMapServiceSearchCapabilitiesTicket alloc] initWithRequest:v6 traits:v4];

  return v7;
}

- (id)_ticketForRefreshingHandle:(id)a3 traits:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (!v7)
  {
    id v7 = [(GEOMapService *)self defaultTraits];
  }
  if ([v6 hasPlaceRequestData])
  {
    id v8 = [GEOPDPlaceRequest alloc];
    id v9 = [v6 placeRequestData];
    uint64_t v10 = [(GEOPDPlaceRequest *)v8 initWithInitialRequestData:v9 traits:v7];
LABEL_7:
    id v12 = (void *)v10;

    uint64_t v13 = [v6 data];
    [v12 setHandleData:v13];

    id v14 = [[_GEOPlaceRequestTicket alloc] initWithRequest:v12 traits:v7];
    goto LABEL_9;
  }
  if ([v6 hasPlaceRefinementParameters])
  {
    uint64_t v11 = [GEOPDPlaceRequest alloc];
    id v9 = [v6 placeRefinementParameters];
    uint64_t v10 = [(GEOPDPlaceRequest *)v11 initWithPlaceRefinementParameters:v9 traits:v7];
    goto LABEL_7;
  }
  id v14 = 0;
LABEL_9:

  return v14;
}

- (id)ticketForSearchHomeWithTraits:(id)a3
{
  id v4 = a3;
  if (!v4)
  {
    id v4 = [(GEOMapService *)self defaultTraits];
  }
  id v5 = [[GEOPDPlaceRequest alloc] initForSearchHomeWithTraits:v4];
  id v6 = [(GEOAbstractRequestResponseTicket *)[_GEOSearchHomeTicket alloc] initWithRequest:v5 traits:v4];

  return v6;
}

- (id)ticketForPublisherViewPublisherIdentifier:(id)a3 keywordFilter:(id)a4 addressFilter:(id)a5 batchSize:(unsigned int)a6 withTraits:(id)a7
{
  uint64_t v8 = *(void *)&a6;
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a7;
  if (!v15)
  {
    id v15 = [(GEOMapService *)self defaultTraits];
  }
  id v16 = [[GEOPDPlaceRequest alloc] initPublisherViewWithPublisherIdentifier:v12 keywordFilter:v13 addressFilter:v14 batchSize:v8 withTraits:v15];
  id v17 = [(GEOAbstractRequestResponseTicket *)[_GEOPublisherViewTicket alloc] initWithRequest:v16 traits:v15];

  return v17;
}

- (id)ticketForGuideHomeWithFilter:(id)a3 guideLocation:(id)a4 withTraits:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if (!v10)
  {
    id v10 = [(GEOMapService *)self defaultTraits];
  }
  uint64_t v11 = [[GEOPDPlaceRequest alloc] initWithGuideHomeWithFilter:v8 guideLocation:v9 withTraits:v10];
  id v12 = [(GEOAbstractRequestResponseTicket *)[_GEOGuideHomeViewTicket alloc] initWithRequest:v11 traits:v10];

  return v12;
}

- (id)ticketForCuratedCollections:(id)a3 isBatchLookup:(BOOL)a4 overrideSuppress:(BOOL)a5 traits:(id)a6
{
  BOOL v7 = a5;
  BOOL v8 = a4;
  id v10 = a3;
  id v11 = a6;
  if (!v11)
  {
    id v11 = [(GEOMapService *)self defaultTraits];
  }
  id v12 = [[GEOPDPlaceRequest alloc] initForCuratedCollectionLookupWithIdentifiers:v10 isBatchLookup:v8 overrideSuppress:v7 traits:v11];
  id v13 = [(GEOAbstractRequestResponseTicket *)[_GEOCuratedCollectionTicket alloc] initWithRequest:v12 traits:v11];
  [(GEOAbstractTicket *)v13 setCachePolicy:4];

  return v13;
}

- (id)ticketForCuratedCollectionItems:(id)a3 collection:(id)a4 traits:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if (!v10)
  {
    id v10 = [(GEOMapService *)self defaultTraits];
  }
  id v11 = [[GEOPDPlaceRequest alloc] initForCuratedCollectionItemLookupWithIdentifiers:v8 collectionIdentifier:v9 traits:v10];
  id v12 = [(GEOAbstractRequestResponseTicket *)[_GEOCuratedCollectionItemsTicket alloc] initWithRequest:v11 traits:v10];
  [(GEOAbstractTicket *)v12 setCachePolicy:4];

  return v12;
}

- (id)ticketForAllCollectionViewWithBatchSize:(unsigned int)a3 keywordFilter:(id)a4 addressFilter:(id)a5 withTraits:(id)a6
{
  uint64_t v8 = *(void *)&a3;
  id v10 = a4;
  id v11 = a5;
  id v12 = a6;
  if (!v12)
  {
    id v12 = [(GEOMapService *)self defaultTraits];
  }
  id v13 = [[GEOPDPlaceRequest alloc] initWithAllCollectionViewWithBatchSize:v8 keywordFilter:v10 addressFilter:v11 withTraits:v12];
  id v14 = [(GEOAbstractRequestResponseTicket *)[_GEOAllCollectionViewTicket alloc] initWithRequest:v13 traits:v12];

  return v14;
}

- (id)ticketForCitySelectorViewWithTraits:(id)a3 batchSize:(unsigned int)a4
{
  uint64_t v4 = *(void *)&a4;
  id v6 = a3;
  if (!v6)
  {
    id v6 = [(GEOMapService *)self defaultTraits];
  }
  id v7 = [[GEOPDPlaceRequest alloc] initCitySelectorViewWithTraits:v6 batchSize:v4];
  uint64_t v8 = [(GEOAbstractRequestResponseTicket *)[_GEOCitySelectorViewTicket alloc] initWithRequest:v7 traits:v6];

  return v8;
}

- (id)ticketForPlaceEnrichmentWithEnrichmentInfo:(id)a3 mapsIdentifier:(id)a4 traits:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if (!v10)
  {
    id v10 = [(GEOMapService *)self defaultTraits];
  }
  id v11 = [[GEOPDPlaceRequest alloc] initPlaceEnrichmentWithEnrichmentInfo:v8 mapsIdentifier:v9 traits:v10];
  id v12 = [(GEOAbstractRequestResponseTicket *)[_GEOPlaceEnrichmentTicket alloc] initWithRequest:v11 traits:v10];

  return v12;
}

- (id)ticketForRefreshingEVChargersWithIdentifiers:(id)a3 traits:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (!v7)
  {
    id v7 = [(GEOMapService *)self defaultTraits];
  }
  id v8 = [[GEOPDPlaceRequest alloc] initEVChargerRefreshRequestWithMapsIdentifier:v6 traits:v7];
  id v9 = [(GEOAbstractRequestResponseTicket *)[_GEOPlaceEVChargerTicket alloc] initWithRequest:v8 traits:v7];
  [(GEOAbstractTicket *)v9 setCachePolicy:4];

  return v9;
}

- (id)ticketForGuideLocationLookupWithIds:(id)a3 identifiers:(id)a4 traits:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if (!v10)
  {
    id v10 = [(GEOMapService *)self defaultTraits];
  }
  id v11 = [[GEOPDPlaceRequest alloc] initForGuideLocationLookupWithIdentifiers:v9 traits:v10];
  id v12 = [[_GEOGuideLocationsLookupTicket alloc] initWithRequest:v11 traits:v10 guideLocationsEntries:v8];

  return v12;
}

- (id)ticketForHikingIntroTipWithMapItemIdentifier:(id)a3 traits:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (!v7)
  {
    id v7 = [(GEOMapService *)self defaultTraits];
  }
  id v8 = [[GEOPDPlaceRequest alloc] initForHikingIntroTipWithMapItemIdentifier:v6 traits:v7];
  id v9 = [(GEOAbstractRequestResponseTicket *)[_GEOHikingIntroTipTicket alloc] initWithRequest:v8 traits:v7];

  return v9;
}

- (void)trackSerializedPlaceData:(id)a3
{
  id v3 = a3;
  id v5 = [[GEOPDPlace alloc] initWithData:v3];

  if (v5)
  {
    uint64_t v4 = +[GEOPlaceCardRequester sharedRequester];
    [v4 trackPlaceData:v5];
  }
}

- (void)trackMapItem:(id)a3
{
  id v7 = a3;
  int v3 = [v7 conformsToProtocol:&unk_1ED78BC80];
  uint64_t v4 = v7;
  if (v3)
  {
    id v5 = [v7 _placeData];
    if (v5)
    {
      id v6 = +[GEOPlaceCardRequester sharedRequester];
      [v6 trackPlaceData:v5];
    }
    uint64_t v4 = v7;
  }
}

void __109__GEOMapService__resolveMapItemFromHandle_withTraits_cachePolicy_coordinateOnlyRefinement_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a3;
  id v6 = [a2 firstObject];
  if (!v6)
  {
    if ([*(id *)(a1 + 32) hasPlaceRefinementParameters])
    {
      v18[0] = MEMORY[0x1E4F143A8];
      v18[1] = 3221225472;
      void v18[2] = __109__GEOMapService__resolveMapItemFromHandle_withTraits_cachePolicy_coordinateOnlyRefinement_completionHandler___block_invoke_2;
      v18[3] = &unk_1E53E2320;
      id v19 = *(id *)(a1 + 32);
      id v6 = +[GEOMapItemBuilder buildWithSetterBlock:v18];
    }
    else
    {
      id v6 = 0;
    }
  }
  uint64_t v7 = *(void *)(a1 + 56);
  if (v7 != 1 && v7 != 4 && v6 != 0)
  {
    id v10 = +[GEOMapItemStorage mapItemStorageForGEOMapItem:v6];
    id v11 = [_GEOMapItemHandleCacheData alloc];
    id v12 = [MEMORY[0x1E4F1C9C8] date];
    id v13 = [v10 data];
    id v14 = [(_GEOMapItemHandleCacheData *)v11 initWithTimestamp:v12 data:v13];

    id v15 = -[GEOMapService handleCache](*(os_unfair_lock_s **)(a1 + 40));
    objc_msgSend(v15, "setObject:forKey:cost:", v14, *(void *)(a1 + 32), -[_GEOMapItemHandleCacheData cost](v14, "cost"));

LABEL_15:
    id v16 = +[GEOMapItemStorage mapItemStorageForGEOMapItem:v6];
    id v17 = [*(id *)(a1 + 32) clientAttributes];
    [v16 setClientAttributes:v17];

    (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
    goto LABEL_16;
  }
  if (v6) {
    goto LABEL_15;
  }
  (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
LABEL_16:
}

void __109__GEOMapService__resolveMapItemFromHandle_withTraits_cachePolicy_coordinateOnlyRefinement_completionHandler___block_invoke_2(uint64_t a1, void *a2)
{
  id v13 = a2;
  int v3 = [*(id *)(a1 + 32) placeRefinementParameters];
  uint64_t v4 = -[GEOPDPlaceRefinementParameters locationHint](v3);
  [v13 setLatlng:v4];

  id v5 = -[GEOPDPlaceRefinementParameters formattedAddressLineHints](v3);
  if (v5)
  {
  }
  else
  {
    id v6 = -[GEOPDPlaceRefinementParameters addressHint](v3);

    if (!v6) {
      goto LABEL_5;
    }
  }
  uint64_t v7 = objc_alloc_init(GEOAddress);
  [v13 setAddress:v7];

  id v8 = -[GEOPDPlaceRefinementParameters formattedAddressLineHints](v3);
  id v9 = [v13 address];
  [v9 setFormattedAddressLines:v8];

  id v10 = -[GEOPDPlaceRefinementParameters addressHint](v3);
  id v11 = [v13 address];
  [v11 setStructuredAddress:v10];

LABEL_5:
  id v12 = -[GEOPDPlaceRefinementParameters placeNameHint](v3);
  [v13 setName:v12];
}

- (void)resolveMapItemFromHandle:(id)a3 withTraits:(id)a4 useCache:(BOOL)a5 coordinateOnlyRefinement:(BOOL)a6 completionHandler:(id)a7
{
}

- (void)resolveMapItemFromHandle:(id)a3 withTraits:(id)a4 useCache:(BOOL)a5 completionHandler:(id)a6
{
}

- (void)resolveMapItemFromHandle:(id)a3 completionHandler:(id)a4
{
}

- (void)resolveMapItemFromHandle:(id)a3 traits:(id)a4 completionHandler:(id)a5
{
}

- (id)locallyResolvedMapItemFromHandle:(id)a3 error:(id *)a4
{
  id v6 = a3;
  if (v6)
  {
    uint64_t v7 = [[GEOMapItemHandle alloc] initWithData:v6];
    id v8 = v7;
    if (v7)
    {
      uint64_t v9 = [(GEOMapItemHandle *)v7 placeRefinementParameters];
      if (v9)
      {
        *(_WORD *)(v9 + 108) |= 0x1000u;
        *(_WORD *)(v9 + 108) |= 0x10u;
        *(unsigned char *)(v9 + 104) = 0;
      }

      id v10 = [(GEOMapService *)self _cachedMapItemForHandle:v8 enforceMaxAge:0];
      if (!v10)
      {
        uint64_t v11 = _mapItemFromHandleContents(v8);
        id v10 = (void *)v11;
        if (a4)
        {
          if (!v11)
          {
            *a4 = [MEMORY[0x1E4F28C58] GEOErrorWithCode:-13 reason:@"mapItemHandle is invalid"];
          }
        }
      }
      id v12 = v10;
    }
    else if (a4)
    {
      [MEMORY[0x1E4F28C58] GEOErrorWithCode:-12 reason:@"mapItemHandle is invalid"];
      id v12 = 0;
      *a4 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      id v12 = 0;
    }
  }
  else if (a4)
  {
    [MEMORY[0x1E4F28C58] GEOErrorWithCode:-12 reason:@"handle cannot be nil"];
    id v12 = 0;
    *a4 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v12 = 0;
  }

  return v12;
}

- (void)_geoMapItemsForResponseData:(id)a3 handler:(id)a4
{
  id v15 = a3;
  id v5 = (void (**)(id, void, void *))a4;
  if (v5)
  {
    if (![v15 length])
    {
      uint64_t v7 = [MEMORY[0x1E4F28C58] GEOErrorWithCode:-8 reason:0];
      v5[2](v5, 0, v7);
LABEL_14:

      goto LABEL_15;
    }
    id v6 = [[GEOPDPlaceResponse alloc] initWithData:v15];
    uint64_t v7 = v6;
    if (!v6)
    {
      uint64_t v9 = [MEMORY[0x1E4F28C58] GEOErrorWithCode:-11 reason:0];
      v5[2](v5, 0, v9);
      goto LABEL_13;
    }
    if ([(GEOPDPlaceResponse *)v6 hasGlobalResult])
    {
      uint64_t v8 = [v7 globalResult];
      uint64_t v9 = (void *)v8;
      if (!v8)
      {
        uint64_t v11 = 0;
        goto LABEL_8;
      }
      -[GEOPDPlaceGlobalResult _readCategorySearchResult](v8);
      uint64_t v10 = v9[17];

      if (v10)
      {
        uint64_t v11 = [v7 globalResult];
        -[GEOPDPlaceGlobalResult categorySearchResult](v11);
        id v12 = (id *)objc_claimAutoreleasedReturnValue();
        uint64_t v9 = -[GEOPDCategorySearchResult resultDetourInfos](v12);

LABEL_8:
LABEL_11:
        id v13 = [v7 resultsWithResultType:1];
        id v14 = [v7 _disambiguationLabels];
        _attributedGeoMapItemsForPlaceDatasWithHandler(0, v13, v14, v9, 0, 0, v5);

LABEL_13:
        goto LABEL_14;
      }
    }
    uint64_t v9 = 0;
    goto LABEL_11;
  }
LABEL_15:
}

- (id)_geoMapItemForData:(id)a3
{
  id v3 = a3;
  if ([v3 length])
  {
    uint64_t v4 = [[GEOMapItemStorage alloc] initWithData:v3];
    id v5 = v4;
    if (v4)
    {
      id v6 = v4;
    }
    else
    {
      uint64_t v7 = [[GEOPDPlace alloc] initWithData:v3];
      uint64_t v8 = v7;
      if (v7)
      {
        id v6 = [(GEOPDPlace *)v7 geoMapItem];
      }
      else
      {
        uint64_t v9 = [[GEOPlaceResult alloc] initWithData:v3];
        uint64_t v10 = v9;
        if (v9)
        {
          id v6 = [(GEOPlaceResult *)v9 geoMapItem];
        }
        else
        {
          uint64_t v11 = [[GEOPlace alloc] initWithData:v3];
          id v12 = v11;
          if (v11)
          {
            id v6 = [(GEOPlace *)v11 geoMapItem];
          }
          else
          {
            id v6 = 0;
          }
        }
      }
    }
  }
  else
  {
    id v6 = 0;
  }

  return v6;
}

- (id)_geoMapItemsForPlacesInDetails:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  uint64_t v4 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(v3, "placesCount"));
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v5 = objc_msgSend(v3, "places", 0);
  uint64_t v6 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v14;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v14 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = [*(id *)(*((void *)&v13 + 1) + 8 * i) geoMapItem];
        [v4 addObject:v10];
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v7);
  }

  uint64_t v11 = [MEMORY[0x1E4F1C978] arrayWithArray:v4];

  return v11;
}

+ (void)_attributedGeoMapItemsForPlaceDatasWithType:(int)a3 placeDatas:(id)a4 disambiguationLabels:(id)a5 handler:(id)a6
{
}

+ (void)setShouldResolveAttribution:(BOOL)a3
{
  _shouldResolveAttribution = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_handleCacheDelegate, 0);
  objc_storeStrong((id *)&self->_handleCache, 0);

  objc_storeStrong((id *)&self->_preferredLanguages, 0);
}

- (id)serializedETAFilterForSiriWithRouteAttributes:(id)a3
{
  id v3 = +[GEOPDETAFilter etaFilterForRouteAttributes:a3];
  uint64_t v4 = [v3 data];

  return v4;
}

- (id)serializedSearchEvChargingParametersForSiriFromPorts:(id)a3
{
  id v3 = a3;
  uint64_t v4 = objc_alloc_init(GEOPDSSearchEvChargingParameters);
  -[GEOPDSSearchEvChargingParameters setPorts:]((uint64_t)v4, v3);

  id v5 = [(GEOPDSSearchEvChargingParameters *)v4 data];

  return v5;
}

- (id)ticketForMerchantCode:(id)a3 rawMerchantCode:(id)a4 industryCategory:(id)a5 industryCode:(id)a6 paymentNetwork:(id)a7 transactionDate:(id)a8 transactionLocation:(id)a9 traits:(id)a10
{
  id v16 = a3;
  id v17 = a4;
  id v18 = a5;
  id v19 = a6;
  id v20 = a7;
  id v21 = a8;
  id v22 = a9;
  id v23 = a10;
  if (!v23)
  {
    id v23 = [(GEOMapService *)self defaultTraits];
  }
  id v24 = [[GEOPDPlaceRequest alloc] initWithMerchantCode:v16 rawMerchantCode:v17 industryCategory:v18 industryCode:v19 paymentNetwork:v20 transactionDate:v21 transactionLocation:v22 traits:v23];
  uint64_t v25 = [[_GEOPlaceRequestTicket alloc] initWithRequest:v24 traits:v23];

  return v25;
}

- (id)ticketForMerchantCode:(id)a3 rawMerchantCode:(id)a4 relyingPartyIdentifier:(id)a5 industryCategory:(id)a6 industryCode:(id)a7 paymentNetwork:(id)a8 transactionDate:(id)a9 transactionLocation:(id)a10 terminalId:(id)a11 transactionCurrencyCode:(id)a12 transactionType:(int)a13 transactionId:(id)a14 warsawMerchantDomain:(id)a15 warsawMerchantName:(id)a16 warsawMerchantId:(id)a17 adamId:(id)a18 merchantId:(id)a19 merchantDoingBizAsName:(id)a20 merchantEnhancedName:(id)a21 merchantCity:(id)a22 merchantRawCity:(id)a23 merchantState:(id)a24 merchantRawState:(id)a25 merchantZip:(id)a26 merchantAddress:(id)a27 merchantRawAddress:(id)a28 merchantCountryCode:(id)a29 merchantType:(id)a30 merchantCleanConfidenceLevel:(id)a31 merchantAdditionalData:(id)a32 merchantCanl:(id)a33 fuzzyMatched:(id)a34 coarseLocationUsed:(id)a35 bankTransactionType:(int)a36 bankTransactionStatus:(int)a37 bankAnonymisedUserId:(id)a38 otherBankTransactionLocations:(id)a39 bankTransactionDescription:(id)a40 bankTransactionTimestamp:(id)a41 bankRawMerchantCode:(id)a42 bankIndustryCategory:(id)a43 bankIndustryCode:(id)a44 bankTransactionCurrencyCode:(id)a45 bankMerchantInfo:(id)a46 baaCerts:(id)a47 baaSignature:(id)a48 bankBrandMUIDFallbackEnabled:(id)a49 bankIdentifier:(id)a50 bankTransactionDescriptionClean:(id)a51 bankPIIRedactionIsApplied:(id)a52 bankRotationPeriodsSinceEpoch:(id)a53 traits:(id)a54
{
  id v116 = a3;
  id v115 = a4;
  id v114 = a5;
  id v113 = a6;
  id v112 = a7;
  id v111 = a8;
  id v109 = a9;
  id v108 = a10;
  id v107 = a11;
  id v106 = a12;
  id v105 = a14;
  id v101 = a15;
  id v104 = a16;
  id v103 = a17;
  id v99 = a18;
  id v102 = a19;
  id v96 = a20;
  id v100 = a21;
  id v94 = a22;
  id v98 = a23;
  id v91 = a24;
  id v97 = a25;
  id v88 = a26;
  id v95 = a27;
  id v86 = a28;
  id v93 = a29;
  id v85 = a30;
  id v92 = a31;
  id v84 = a32;
  id v90 = a33;
  id v83 = a34;
  id v89 = a35;
  id v82 = a38;
  id v87 = a39;
  id v81 = a40;
  id v75 = a41;
  id v58 = a42;
  id v76 = a43;
  id v59 = a44;
  id v77 = a45;
  id v60 = a46;
  id v78 = a47;
  id v61 = a48;
  id v62 = a49;
  id v63 = a50;
  id v64 = a51;
  id v65 = a52;
  id v66 = a53;
  id v67 = a54;
  if (!v67)
  {
    id v67 = [(GEOMapService *)self defaultTraits];
  }
  id v73 = v65;
  v79 = v65;
  v68 = v64;
  LODWORD(v72) = a36;
  HIDWORD(v72) = a36;
  LODWORD(v71) = a13;
  v69 = -[GEOPDPlaceRequest initWithMerchantCode:rawMerchantCode:relyingPartyIdentifier:industryCategory:industryCode:paymentNetwork:transactionDate:transactionLocation:terminalId:transactionCurrencyCode:transactionType:transactionId:warsawMerchantDomain:warsawMerchantName:warsawMerchantId:adamId:merchantId:merchantDoingBizAsName:merchantEnhancedName:merchantCity:merchantRawCity:merchantState:merchantRawState:merchantZip:merchantAddress:merchantRawAddress:merchantCountryCode:merchantType:merchantCleanConfidenceLevel:merchantAdditionalData:merchantCanl:fuzzyMatched:coarseLocationUsed:bankTransactionType:bankTransactionStatus:bankAnonymisedUserId:otherBankTransactionLocations:bankTransactionDescription:bankTransactionTimestamp:bankRawMerchantCode:bankIndustryCategory:bankIndustryCode:bankTransactionCurrencyCode:bankMerchantInfo:baaCerts:baaSignature:bankBrandMUIDFallbackEnabled:bankIdentifier:bankTransactionDescriptionClean:bankPIIRedactionIsApplied:bankRotationPeriodsSinceEpoch:traits:]([GEOPDPlaceRequest alloc], "initWithMerchantCode:rawMerchantCode:relyingPartyIdentifier:industryCategory:industryCode:paymentNetwork:transactionDate:transactionLocation:terminalId:transactionCurrencyCode:transactionType:transactionId:warsawMerchantDomain:warsawMerchantName:warsawMerchantId:adamId:merchantId:merchantDoingBizAsName:merchantEnhancedName:merchantCity:merchantRawCity:merchantState:merchantRawState:merchantZip:merchantAddress:merchantRawAddress:merchantCountryCode:merchantType:merchantCleanConfidenceLevel:merchantAdditionalData:merchantCanl:fuzzyMatched:coarseLocationUsed:bankTransactionType:bankTransactionStatus:bankAnonymisedUserId:otherBankTransactionLocations:bankTransactionDescription:bankTransactionTimestamp:bankRawMerchantCode:bankIndustryCategory:bankIndustryCode:bankTransactionCurrencyCode:bankMerchantInfo:baaCerts:baaSignature:bankBrandMUIDFallbackEnabled:bankIdentifier:bankTransactionDescriptionClean:bankPIIRedactionIsApplied:bankRotationPeriodsSinceEpoch:traits:", v116, v115, v114, v113, v112, v111, v109, v108, v107,
          v106,
          v71,
          v105,
          v101,
          v104,
          v103,
          v99,
          v102,
          v96,
          v100,
          v94,
          v98,
          v91,
          v97,
          v88,
          v95,
          v86,
          v93,
          v85,
          v92,
          v84,
          v90,
          v83,
          v89,
          v72,
          v82,
          v87,
          v81,
          v75,
          v58,
          v76,
          v59,
          v77,
          v60,
          v78,
          v61,
          v62,
          v63,
          v64,
          v73,
          v66,
          v67);
  v80 = [[_GEOPlaceRequestTicket alloc] initWithRequest:v69 traits:v67];

  return v80;
}

- (id)ticketForWiFiQualityNetworkServiceRequest:(id)a3
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  uint64_t v4 = objc_alloc_init(GEOWiFiQualityServiceRequest);
  id v5 = [GEOPDClientMetadata alloc];
  uint64_t v6 = +[GEOMapService sharedService];
  uint64_t v7 = [v6 defaultTraits];
  uint64_t v8 = [(GEOPDClientMetadata *)v5 initWithTraits:v7];
  [(GEOWiFiQualityServiceRequest *)v4 setClientMetadata:v8];

  long long v21 = 0u;
  long long v22 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  id v9 = v3;
  uint64_t v10 = [v9 countByEnumeratingWithState:&v19 objects:v23 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v20;
    do
    {
      for (uint64_t i = 0; i != v11; ++i)
      {
        if (*(void *)v20 != v12) {
          objc_enumerationMutation(v9);
        }
        -[GEOWiFiQualityServiceRequest addNetworkSearches:](v4, "addNetworkSearches:", *(void *)(*((void *)&v19 + 1) + 8 * i), (void)v19);
      }
      uint64_t v11 = [v9 countByEnumeratingWithState:&v19 objects:v23 count:16];
    }
    while (v11);
  }

  long long v14 = [_GEOMapServiceWiFiQualityLookupTicket alloc];
  long long v15 = [MEMORY[0x1E4F29128] UUID];
  id v16 = [v15 description];
  id v17 = [(_GEOMapServiceWiFiQualityLookupTicket *)v14 initWithRequest:v4 requestId:v16];

  return v17;
}

- (id)ticketForWiFiQualityLocationServiceRequest:(id)a3
{
  return 0;
}

- (id)ticketForWiFiQualityTileLoadForKey:(id)a3 eTag:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  uint64_t v7 = [_GEOMapServiceWiFiQualityLookupTicket alloc];
  uint64_t v8 = [MEMORY[0x1E4F29128] UUID];
  id v9 = [v8 description];
  uint64_t v10 = [(_GEOMapServiceWiFiQualityLookupTicket *)v7 initWithTileKey:v6 eTag:v5 requestId:v9];

  return v10;
}

- (double)wiFiQualitySearchRadiusMeters
{
  return GEOConfigGetDouble(GeoServicesConfig_WifiQualitySearchRadiusMeters, (uint64_t)off_1E9114948);
}

- (int64_t)wiFiQualitySearchZoomLevel
{
  return GEOConfigGetInteger(GeoServicesConfig_WifiQualitySearchZoom, (uint64_t)off_1E9114988);
}

- (double)wiFiQualitySmallSearchRadiusMeters
{
  return GEOConfigGetDouble(GeoServicesConfig_WiFiQualitySmallSearchRadiusMeters, (uint64_t)off_1E9114958);
}

@end