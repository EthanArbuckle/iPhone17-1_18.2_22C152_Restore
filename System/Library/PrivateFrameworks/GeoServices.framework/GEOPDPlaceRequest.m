@interface GEOPDPlaceRequest
+ (BOOL)isValid:(id)a3;
+ (Class)auxiliaryTierRequestedComponentType;
+ (Class)displayLanguageType;
+ (Class)partiallyComposedSearchResultRequestedComponentType;
+ (Class)requestedComponentType;
+ (Class)spokenLanguageType;
+ (id)collectionComponentInfoForReason:(unint64_t)a3 count:(unsigned int)a4 traits:(id)a5;
+ (id)comingledPhotoLookupRequestWithCategoryIdentifier:(id)a3 mapItemIdentifier:(id)a4 range:(_NSRange)a5 traits:(id)a6;
+ (id)componentInfoWithType:(int)a3 count:(unsigned int)a4 traits:(id)a5;
+ (id)createRequestedComponentsForReason:(unint64_t)a3 traits:(id)a4 count:(unsigned int)a5;
+ (id)photoLookupRequestWithVendorIdentifier:(id)a3 mapItemIdentifier:(id)a4 range:(_NSRange)a5 traits:(id)a6;
+ (id)publisherComponentInfoForReason:(unint64_t)a3 count:(unsigned int)a4 traits:(id)a5;
- (BOOL)hasAnalyticMetadata;
- (BOOL)hasClientMetadata;
- (BOOL)hasDisplayRegion;
- (BOOL)hasGreenTeaWithValue:(BOOL)a3;
- (BOOL)hasHandleData;
- (BOOL)hasNeedLatency;
- (BOOL)hasPlaceRequestParameters;
- (BOOL)hasPrivacyMetadata;
- (BOOL)hasRequestType;
- (BOOL)hasResultProviderID;
- (BOOL)hasSuppressResultsRequiringAttribution;
- (BOOL)isBrandLookupRequest;
- (BOOL)isCanonicalLocationSearchRequest;
- (BOOL)isEqual:(id)a3;
- (BOOL)isForwardGeocoderRequest;
- (BOOL)isMerchantRequest;
- (BOOL)isPlaceRefinementRequest;
- (BOOL)needLatency;
- (BOOL)readFrom:(id)a3;
- (BOOL)shouldConsiderCaching;
- (BOOL)suppressResultsRequiringAttribution;
- (Class)responseClass;
- (GEOPDAnalyticMetadata)analyticMetadata;
- (GEOPDClientMetadata)clientMetadata;
- (GEOPDPlaceRequest)init;
- (GEOPDPlaceRequest)initWithAirportCode:(id)a3 terminalCode:(id)a4 gateCode:(id)a5 traits:(id)a6;
- (GEOPDPlaceRequest)initWithAllCollectionViewWithBatchSize:(unsigned int)a3 keywordFilter:(id)a4 addressFilter:(id)a5 withTraits:(id)a6;
- (GEOPDPlaceRequest)initWithAutocompleteFragment:(id)a3 type:(int)a4 traits:(id)a5 filters:(id)a6 retainedSearch:(id)a7 tappedQuerySuggestion:(id)a8 sessionData:(id)a9 error:(id *)a10;
- (GEOPDPlaceRequest)initWithBatchReverseGeocodeLocations:(id)a3 additionalPlaceTypes:(int *)a4 additionalPlaceTypesCount:(unint64_t)a5 traits:(id)a6;
- (GEOPDPlaceRequest)initWithBrandMUID:(unint64_t)a3 traits:(id)a4;
- (GEOPDPlaceRequest)initWithCanonicalLocationSearchQueryString:(id)a3 traits:(id)a4;
- (GEOPDPlaceRequest)initWithCategory:(id)a3 maxResults:(unsigned int)a4 traits:(id)a5 searchSessionData:(id)a6;
- (GEOPDPlaceRequest)initWithCategory:(id)a3 routeInfo:(id)a4 maxResults:(unsigned int)a5 traits:(id)a6 searchSessionData:(id)a7;
- (GEOPDPlaceRequest)initWithCategoryMetadata:(id)a3 parentMuid:(unint64_t)a4 traits:(id)a5;
- (GEOPDPlaceRequest)initWithComponents:(id)a3 identifier:(id)a4 resultProviderID:(int)a5 traits:(id)a6;
- (GEOPDPlaceRequest)initWithData:(id)a3;
- (GEOPDPlaceRequest)initWithDictionary:(id)a3;
- (GEOPDPlaceRequest)initWithExternalBusinessID:(id)a3 contentProvider:(id)a4 traits:(id)a5;
- (GEOPDPlaceRequest)initWithExternalTransitStationCodes:(id)a3 sourceID:(id)a4 transactionDate:(id)a5 transactionLocation:(id)a6 traits:(id)a7;
- (GEOPDPlaceRequest)initWithForwardGeocodeAddress:(id)a3 maxResults:(unsigned int)a4 traits:(id)a5;
- (GEOPDPlaceRequest)initWithForwardGeocodeAddressString:(id)a3 maxResults:(unsigned int)a4 traits:(id)a5;
- (GEOPDPlaceRequest)initWithGeoMapItemIdentifier:(id)a3 categoryID:(id)a4 maxResults:(unsigned int)a5 traits:(id)a6 searchSessionData:(id)a7;
- (GEOPDPlaceRequest)initWithGuideHomeWithFilter:(id)a3 guideLocation:(id)a4 withTraits:(id)a5;
- (GEOPDPlaceRequest)initWithIdentifiers:(id)a3 resultProviderID:(int)a4 traits:(id)a5;
- (GEOPDPlaceRequest)initWithInitialRequestData:(id)a3 traits:(id)a4;
- (GEOPDPlaceRequest)initWithJSON:(id)a3;
- (GEOPDPlaceRequest)initWithMapItemToRefine:(id)a3 coordinate:(id)a4 traits:(id)a5;
- (GEOPDPlaceRequest)initWithMapItemToRefine:(id)a3 traits:(id)a4;
- (GEOPDPlaceRequest)initWithMerchantCode:(id)a3 rawMerchantCode:(id)a4 industryCategory:(id)a5 industryCode:(id)a6 paymentNetwork:(id)a7 transactionDate:(id)a8 transactionLocation:(id)a9 traits:(id)a10;
- (GEOPDPlaceRequest)initWithMerchantCode:(id)a3 rawMerchantCode:(id)a4 relyingPartyIdentifier:(id)a5 industryCategory:(id)a6 industryCode:(id)a7 paymentNetwork:(id)a8 transactionDate:(id)a9 transactionLocation:(id)a10 terminalId:(id)a11 transactionCurrencyCode:(id)a12 transactionType:(int)a13 transactionId:(id)a14 warsawMerchantDomain:(id)a15 warsawMerchantName:(id)a16 warsawMerchantId:(id)a17 adamId:(id)a18 merchantId:(id)a19 merchantDoingBizAsName:(id)a20 merchantEnhancedName:(id)a21 merchantCity:(id)a22 merchantRawCity:(id)a23 merchantState:(id)a24 merchantRawState:(id)a25 merchantZip:(id)a26 merchantAddress:(id)a27 merchantRawAddress:(id)a28 merchantCountryCode:(id)a29 merchantType:(id)a30 merchantCleanConfidenceLevel:(id)a31 merchantAdditionalData:(id)a32 merchantCanl:(id)a33 fuzzyMatched:(id)a34 coarseLocationUsed:(id)a35 bankTransactionType:(int)a36 bankTransactionStatus:(int)a37 bankAnonymisedUserId:(id)a38 otherBankTransactionLocations:(id)a39 bankTransactionDescription:(id)a40 bankTransactionTimestamp:(id)a41 bankRawMerchantCode:(id)a42 bankIndustryCategory:(id)a43 bankIndustryCode:(id)a44 bankTransactionCurrencyCode:(id)a45 bankMerchantInfo:(id)a46 baaCerts:(id)a47 baaSignature:(id)a48 bankBrandMUIDFallbackEnabled:(id)a49 bankIdentifier:(id)a50 bankTransactionDescriptionClean:(id)a51 bankPIIRedactionIsApplied:(id)a52 bankRotationPeriodsSinceEpoch:(id)a53 traits:(id)a54;
- (GEOPDPlaceRequest)initWithNearbyTransitDeparturesWithLookupOrigin:(id)a3 userLocation:(id)a4 traits:(id)a5;
- (GEOPDPlaceRequest)initWithPlaceRefinementParameters:(id)a3 traits:(id)a4;
- (GEOPDPlaceRequest)initWithReverseGeocodeCoordinate:(id)a3 floorOrdinal:(int)a4 includeEntryPoints:(BOOL)a5 preserveOriginalLocation:(BOOL)a6 traits:(id)a7;
- (GEOPDPlaceRequest)initWithReverseGeocodeCoordinate:(id)a3 includeEntryPoints:(BOOL)a4 preserveOriginalLocation:(BOOL)a5 traits:(id)a6;
- (GEOPDPlaceRequest)initWithReverseGeocodeLocation:(id)a3 includeEntryPoints:(BOOL)a4 preserveOriginalLocation:(BOOL)a5 placeTypeLimit:(int)a6 traits:(id)a7;
- (GEOPDPlaceRequest)initWithSearchCategory:(id)a3 venueIdentifier:(id)a4 maxResults:(unsigned int)a5 traits:(id)a6;
- (GEOPDPlaceRequest)initWithSearchQuery:(id)a3 entryMetadata:(id)a4 metadata:(id)a5 autocompleteEntry:(id)a6 retainedSearch:(id)a7 maxResults:(unsigned int)a8 filters:(id)a9 suppressResultsRequiringAttribution:(BOOL)a10 traits:(id)a11 routeInfo:(id)a12 error:(id *)a13 searchSessionData:(id)a14;
- (GEOPDPlaceRequest)initWithSearchURLQuery:(id)a3 coordinate:(id)a4 maxResults:(unsigned int)a5 traits:(id)a6;
- (GEOPDPlaceRequest)initWithSearchURLQuery:(id)a3 identifier:(id)a4 resultProviderId:(int)a5 contentProvider:(id)a6 maxResults:(unsigned int)a7 traits:(id)a8;
- (GEOPDPlaceRequest)initWithSpatialEventLookupParameters:(id)a3 traits:(id)a4;
- (GEOPDPlaceRequest)initWithSpatialPlaceLookupParameters:(id)a3 traits:(id)a4;
- (GEOPDPlaceRequest)initWithTransitDeparturesAtStation:(unint64_t)a3 line:(unint64_t)a4 referenceTripId:(unint64_t)a5 includeAllDirectionNames:(BOOL)a6 routingParameters:(id)a7 traits:(id)a8;
- (GEOPDPlaceRequest)initWithTransitScheduleAtStation:(unint64_t)a3 line:(unint64_t)a4 referenceTripId:(unint64_t)a5 includeAllDirectionNames:(BOOL)a6 routingParameters:(id)a7 traits:(id)a8;
- (GEOPDPlaceRequest)initWithTransitTripDetailsAtStation:(unint64_t)a3 line:(unint64_t)a4 referenceTripId:(unint64_t)a5 includeAllDirectionNames:(BOOL)a6 routingParameters:(id)a7 traits:(id)a8;
- (GEOPDPlaceRequest)initWithTripIds:(id)a3 traits:(id)a4;
- (GEOPDPlaceRequest)initWithUpdatedTransitScheduleDetailsAtStation:(unint64_t)a3 line:(unint64_t)a4 referenceTripId:(unint64_t)a5 includeAllDirectionNames:(BOOL)a6 routingParameters:(id)a7 traits:(id)a8;
- (GEOPDPlaceRequest)initWithVendorSpecificPlaceRefinementParameters:(id)a3 traits:(id)a4;
- (GEOPDPlaceRequestParameters)placeRequestParameters;
- (GEOPrivacyMetadata)privacyMetadata;
- (NSData)handleData;
- (NSMutableArray)auxiliaryTierRequestedComponents;
- (NSMutableArray)displayLanguages;
- (NSMutableArray)partiallyComposedSearchResultRequestedComponents;
- (NSMutableArray)requestedComponents;
- (NSMutableArray)spokenLanguages;
- (NSString)displayRegion;
- (PBUnknownFields)unknownFields;
- (double)localTimestamp;
- (id)_dictionaryRepresentation:(uint64_t)a1;
- (id)_initWithTraits:(id)a3 includeHistoricalLocations:(BOOL)a4 supportedMapsResultTypes:(id)a5;
- (id)_initWithTransitScheduleRequestForStation:(unint64_t)a3 line:(unint64_t)a4 referenceTripId:(unint64_t)a5 includeAllDirectionNames:(BOOL)a6 routingParameters:(id)a7 traits:(id)a8;
- (id)auxiliaryTierRequestedComponentAtIndex:(unint64_t)a3;
- (id)browseCategorySuggestionparametersWithTraits:(id)a3 isFromNoQueryState:(BOOL)a4;
- (id)cacheKey;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)displayLanguageAtIndex:(unint64_t)a3;
- (id)initCitySelectorViewWithTraits:(id)a3 batchSize:(unsigned int)a4;
- (id)initEVChargerRefreshRequestWithMapsIdentifier:(id)a3 traits:(id)a4;
- (id)initForAutocompleteWithTraits:(id)a3 count:(unsigned int)a4;
- (id)initForBrandLookupWithIMessageUid:(id)a3 traits:(id)a4;
- (id)initForCategoryListWithTraits:(id)a3 isFromNoQueryState:(BOOL)a4;
- (id)initForCuratedCollectionItemLookupWithIdentifiers:(id)a3 collectionIdentifier:(id)a4 traits:(id)a5;
- (id)initForCuratedCollectionLookupWithIdentifiers:(id)a3 isBatchLookup:(BOOL)a4 overrideSuppress:(BOOL)a5 traits:(id)a6;
- (id)initForDFRCategoryListWithTraits:(id)a3;
- (id)initForDatasetCheckWithTraits:(id)a3;
- (id)initForGeoIpLookupWithIpAddress:(id)a3 traits:(id)a4;
- (id)initForGuideLocationLookupWithIdentifiers:(id)a3 traits:(id)a4;
- (id)initForHikingIntroTipWithMapItemIdentifier:(id)a3 traits:(id)a4;
- (id)initForMapsHomeWithTraits:(id)a3;
- (id)initForNearbyTransitPaymentLookupAtLocations:(id)a3 traits:(id)a4;
- (id)initForNearestTransitStationWithLine:(id)a3 coordinate:(id)a4 traits:(id)a5;
- (id)initForOfflineRegionNameSuggestionWithRegion:(id)a3 traits:(id)a4;
- (id)initForSearchCapabilitiesWithTraits:(id)a3;
- (id)initForSearchFieldPlaceholderWithTraits:(id)a3;
- (id)initForSearchHomeWithTraits:(id)a3;
- (id)initForTerritoryForLatLngsE7:(id)a3 traits:(id)a4;
- (id)initForWifiFingerprintLookupWithLocations:(id)a3 wifiAccessPoints:(id)a4 maxLabels:(unsigned int)a5 entryTime:(unint64_t)a6 exitTime:(unint64_t)a7 traits:(id)a8;
- (id)initPlaceEnrichmentWithEnrichmentInfo:(id)a3 mapsIdentifier:(id)a4 traits:(id)a5;
- (id)initPublisherViewWithPublisherIdentifier:(id)a3 keywordFilter:(id)a4 addressFilter:(id)a5 batchSize:(unsigned int)a6 withTraits:(id)a7;
- (id)jsonRepresentation;
- (id)partiallyComposedSearchResultRequestedComponentAtIndex:(unint64_t)a3;
- (id)pdSpatialEventLookupParametersArrayForParameters:(id)a3;
- (id)pdSpatialEventLookupParametersForParameters:(id)a3;
- (id)pdSpatialPlaceLookupParametersArrayForParameters:(id)a3;
- (id)pdSpatialPlaceLookupParametersForParameters:(id)a3;
- (id)requestTypeAsString:(int)a3;
- (id)requestedComponentAtIndex:(unint64_t)a3;
- (id)spokenLanguageAtIndex:(unint64_t)a3;
- (int)StringAsRequestType:(id)a3;
- (int)autocompleteOriginationTypeFromTraits:(id)a3;
- (int)requestType;
- (int)resultProviderID;
- (int)userPreferredTransportTypeFromTransportType:(int)a3;
- (unint64_t)auxiliaryTierRequestedComponentsCount;
- (unint64_t)displayLanguagesCount;
- (unint64_t)hash;
- (unint64_t)partiallyComposedSearchResultRequestedComponentsCount;
- (unint64_t)requestedComponentsCount;
- (unint64_t)spokenLanguagesCount;
- (unsigned)requestTypeCode;
- (void)_addNoFlagsAuxiliaryTierRequestedComponent:(uint64_t)a1;
- (void)_addNoFlagsDisplayLanguage:(uint64_t)a1;
- (void)_addNoFlagsPartiallyComposedSearchResultRequestedComponent:(uint64_t)a1;
- (void)_addNoFlagsRequestedComponent:(uint64_t)a1;
- (void)_addNoFlagsSpokenLanguage:(uint64_t)a1;
- (void)_initWithDictionary:(uint64_t)a3 isJSON:;
- (void)_readAnalyticMetadata;
- (void)_readAuxiliaryTierRequestedComponents;
- (void)_readClientMetadata;
- (void)_readDisplayLanguages;
- (void)_readDisplayRegion;
- (void)_readHandleData;
- (void)_readPartiallyComposedSearchResultRequestedComponents;
- (void)_readPlaceRequestParameters;
- (void)_readPrivacyMetadata;
- (void)_readRequestedComponents;
- (void)_readSpokenLanguages;
- (void)addAuxiliaryTierRequestedComponent:(id)a3;
- (void)addDisplayLanguage:(id)a3;
- (void)addPartiallyComposedSearchResultRequestedComponent:(id)a3;
- (void)addPartiallyComposedSearchResultRequestedComponents:(id)a3;
- (void)addRequestedComponent:(id)a3;
- (void)addRequestedComponents:(id)a3;
- (void)addRequestedComponentsForReason:(unint64_t)a3 traits:(id)a4 count:(unsigned int)a5;
- (void)addSpokenLanguage:(id)a3;
- (void)clearAuxiliaryTierRequestedComponents;
- (void)clearDisplayLanguages;
- (void)clearPartiallyComposedSearchResultRequestedComponents;
- (void)clearRequestedComponents;
- (void)clearSensitiveFields:(unint64_t)a3;
- (void)clearSpokenLanguages;
- (void)clearUnknownFields:(BOOL)a3;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)readAll:(BOOL)a3;
- (void)setAnalyticMetadata:(id)a3;
- (void)setAuxiliaryTierRequestedComponents:(id)a3;
- (void)setClientMetadata:(id)a3;
- (void)setDisplayLanguages:(id)a3;
- (void)setDisplayRegion:(id)a3;
- (void)setHandleData:(id)a3;
- (void)setHasNeedLatency:(BOOL)a3;
- (void)setHasRequestType:(BOOL)a3;
- (void)setHasSuppressResultsRequiringAttribution:(BOOL)a3;
- (void)setNeedLatency:(BOOL)a3;
- (void)setPartiallyComposedSearchResultRequestedComponents:(id)a3;
- (void)setPlaceRequestParameters:(id)a3;
- (void)setPrivacyMetadata:(id)a3;
- (void)setRequestType:(int)a3;
- (void)setRequestedComponents:(id)a3;
- (void)setSpokenLanguages:(id)a3;
- (void)setSuppressResultsRequiringAttribution:(BOOL)a3;
- (void)writeTo:(id)a3;
@end

@implementation GEOPDPlaceRequest

- (GEOPDPlaceRequest)initWithData:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)GEOPDPlaceRequest;
  v3 = [(GEOPDPlaceRequest *)&v7 initWithData:a3];
  v4 = v3;
  if (v3)
  {
    v3->_readerLock._os_unfair_lock_opaque = 0;
    v5 = v3;
  }

  return v4;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_spokenLanguages, 0);
  objc_storeStrong((id *)&self->_requestedComponents, 0);
  objc_storeStrong((id *)&self->_privacyMetadata, 0);
  objc_storeStrong((id *)&self->_placeRequestParameters, 0);
  objc_storeStrong((id *)&self->_partiallyComposedSearchResultRequestedComponents, 0);
  objc_storeStrong((id *)&self->_handleData, 0);
  objc_storeStrong((id *)&self->_displayRegion, 0);
  objc_storeStrong((id *)&self->_displayLanguages, 0);
  objc_storeStrong((id *)&self->_clientMetadata, 0);
  objc_storeStrong((id *)&self->_auxiliaryTierRequestedComponents, 0);
  objc_storeStrong((id *)&self->_analyticMetadata, 0);
  objc_storeStrong((id *)&self->_unknownFields, 0);

  objc_storeStrong((id *)&self->_reader, 0);
}

- (id)_initWithTraits:(id)a3 includeHistoricalLocations:(BOOL)a4 supportedMapsResultTypes:(id)a5
{
  BOOL v6 = a4;
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a5;
  v34.receiver = self;
  v34.super_class = (Class)GEOPDPlaceRequest;
  v10 = [(GEOPDPlaceRequest *)&v34 init];
  if (v10)
  {
    v11 = [[GEOPDAnalyticMetadata alloc] initWithTraits:v8];
    [(GEOPDPlaceRequest *)v10 setAnalyticMetadata:v11];
    v12 = [[GEOPDClientMetadata alloc] initWithTraits:v8];
    if (GEOConfigGetBOOL(MapsFeaturesConfig_PlaceCardShowcase, (uint64_t)off_1E9111D28)) {
      [(GEOPDClientMetadata *)v12 setSupportEnrichment:1];
    }
    if (v9)
    {
      long long v32 = 0u;
      long long v33 = 0u;
      long long v30 = 0u;
      long long v31 = 0u;
      id v13 = v9;
      uint64_t v14 = [v13 countByEnumeratingWithState:&v30 objects:v35 count:16];
      if (v14)
      {
        uint64_t v15 = v14;
        uint64_t v16 = *(void *)v31;
        do
        {
          for (uint64_t i = 0; i != v15; ++i)
          {
            if (*(void *)v31 != v16) {
              objc_enumerationMutation(v13);
            }
            -[GEOPDClientMetadata addSupportedMapsResultType:](v12, "addSupportedMapsResultType:", objc_msgSend(*(id *)(*((void *)&v30 + 1) + 8 * i), "intValue", (void)v30));
          }
          uint64_t v15 = [v13 countByEnumeratingWithState:&v30 objects:v35 count:16];
        }
        while (v15);
      }
    }
    else
    {
      [(GEOPDClientMetadata *)v12 addSupportedMapsResultType:1];
    }
    -[GEOPDPlaceRequest setClientMetadata:](v10, "setClientMetadata:", v12, (void)v30);
    if ([v8 deviceDisplayLanguagesCount])
    {
      v18 = [v8 deviceDisplayLanguages];
      v19 = (void *)[v18 mutableCopy];
      [(GEOPDPlaceRequest *)v10 setDisplayLanguages:v19];
    }
    if ([v8 hasDeviceSpokenLocale])
    {
      v20 = [v8 deviceSpokenLocale];
      [(GEOPDPlaceRequest *)v10 addSpokenLanguage:v20];
    }
    if ([v8 hasDisplayRegion])
    {
      v21 = [v8 displayRegion];
      [(GEOPDPlaceRequest *)v10 setDisplayRegion:v21];
    }
    if (v6)
    {
      v22 = [v8 historicalLocations];

      if (v22)
      {
        v23 = [v8 historicalLocations];
        v24 = [(GEOPDPlaceRequest *)v10 clientMetadata];
        [v24 setDeviceHistoricalLocations:v23];
      }
    }
    if ([v8 hasIsTourist])
    {
      v25 = objc_alloc_init(GEOPDMapsSuggestionsTouristInfo);
      [v8 isTourist];
      if (v25)
      {
        *(unsigned char *)&v25->_flags |= 1u;
        v25->_isTourist = v26;
      }
      v27 = [(GEOPDPlaceRequest *)v10 clientMetadata];
      [v27 setMapsSuggestionsTouristInfo:v25];
    }
    v28 = v10;
  }
  return v10;
}

- (void)setClientMetadata:(id)a3
{
  *(_WORD *)&self->_flags |= 0x8040u;
  objc_storeStrong((id *)&self->_clientMetadata, a3);
}

- (void)setAnalyticMetadata:(id)a3
{
  *(_WORD *)&self->_flags |= 0x8010u;
  objc_storeStrong((id *)&self->_analyticMetadata, a3);
}

- (void)setDisplayRegion:(id)a3
{
  *(_WORD *)&self->_flags |= 0x8100u;
  objc_storeStrong((id *)&self->_displayRegion, a3);
}

- (void)setDisplayLanguages:(id)a3
{
  v4 = (NSMutableArray *)a3;
  os_unfair_lock_lock_with_options();
  *(_WORD *)&self->_flags |= 0x80u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(_WORD *)&self->_flags |= 0x8000u;
  displayLanguages = self->_displayLanguages;
  self->_displayLanguages = v4;
}

- (GEOPDAnalyticMetadata)analyticMetadata
{
  -[GEOPDPlaceRequest _readAnalyticMetadata]((uint64_t)self);
  analyticMetadata = self->_analyticMetadata;

  return analyticMetadata;
}

- (void)_readAnalyticMetadata
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 120));
    if ((*(_WORD *)(a1 + 132) & 0x10) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOPDPlaceRequestReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readAnalyticMetadata_tags_0);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 120));
  }
}

- (void)addSpokenLanguage:(id)a3
{
  id v4 = a3;
  -[GEOPDPlaceRequest _readSpokenLanguages]((uint64_t)self);
  -[GEOPDPlaceRequest _addNoFlagsSpokenLanguage:]((uint64_t)self, v4);

  os_unfair_lock_lock_with_options();
  *(_WORD *)&self->_flags |= 0x4000u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(_WORD *)&self->_flags |= 0x8000u;
}

- (void)_addNoFlagsSpokenLanguage:(uint64_t)a1
{
  id v3 = a2;
  if (a1)
  {
    id v4 = *(void **)(a1 + 104);
    id v7 = v3;
    if (!v4)
    {
      id v5 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
      BOOL v6 = *(void **)(a1 + 104);
      *(void *)(a1 + 104) = v5;

      id v4 = *(void **)(a1 + 104);
    }
    [v4 addObject:v7];
    id v3 = v7;
  }
}

- (void)_readSpokenLanguages
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 120));
    if ((*(_WORD *)(a1 + 132) & 0x4000) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOPDPlaceRequestReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readSpokenLanguages_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 120));
  }
}

- (BOOL)readFrom:(id)a3
{
  return GEOPDPlaceRequestReadAllFrom((uint64_t)self, a3, 0);
}

- (int)requestType
{
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  __int16 flags = (__int16)self->_flags;
  os_unfair_lock_unlock(p_readerLock);
  if (flags) {
    return self->_requestType;
  }
  else {
    return 0;
  }
}

- (GEOPDClientMetadata)clientMetadata
{
  -[GEOPDPlaceRequest _readClientMetadata]((uint64_t)self);
  clientMetadata = self->_clientMetadata;

  return clientMetadata;
}

- (void)_readClientMetadata
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 120));
    if ((*(_WORD *)(a1 + 132) & 0x40) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOPDPlaceRequestReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readClientMetadata_tags_0);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 120));
  }
}

- (void)_addNoFlagsDisplayLanguage:(uint64_t)a1
{
  id v3 = a2;
  if (a1)
  {
    id v4 = *(void **)(a1 + 48);
    id v7 = v3;
    if (!v4)
    {
      id v5 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
      BOOL v6 = *(void **)(a1 + 48);
      *(void *)(a1 + 48) = v5;

      id v4 = *(void **)(a1 + 48);
    }
    [v4 addObject:v7];
    id v3 = v7;
  }
}

- (BOOL)hasPlaceRequestParameters
{
  return self->_placeRequestParameters != 0;
}

- (GEOPDPlaceRequestParameters)placeRequestParameters
{
  -[GEOPDPlaceRequest _readPlaceRequestParameters]((uint64_t)self);
  placeRequestParameters = self->_placeRequestParameters;

  return placeRequestParameters;
}

- (void)_readPlaceRequestParameters
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 120));
    if ((*(_WORD *)(a1 + 132) & 0x800) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOPDPlaceRequestReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readPlaceRequestParameters_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 120));
  }
}

- (void)addRequestedComponents:(id)a3
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  uint64_t v5 = [v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v10;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v10 != v7) {
          objc_enumerationMutation(v4);
        }
        [(GEOPDPlaceRequest *)self addRequestedComponent:*(void *)(*((void *)&v9 + 1) + 8 * v8++)];
      }
      while (v6 != v8);
      uint64_t v6 = [v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v6);
  }
}

- (void)addRequestedComponent:(id)a3
{
  id v4 = a3;
  -[GEOPDPlaceRequest _readRequestedComponents]((uint64_t)self);
  -[GEOPDPlaceRequest _addNoFlagsRequestedComponent:]((uint64_t)self, v4);

  os_unfair_lock_lock_with_options();
  *(_WORD *)&self->_flags |= 0x2000u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(_WORD *)&self->_flags |= 0x8000u;
}

- (void)_addNoFlagsRequestedComponent:(uint64_t)a1
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

- (void)_readRequestedComponents
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 120));
    if ((*(_WORD *)(a1 + 132) & 0x2000) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOPDPlaceRequestReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readRequestedComponents_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 120));
  }
}

- (BOOL)hasClientMetadata
{
  return self->_clientMetadata != 0;
}

- (void)clearSensitiveFields:(unint64_t)a3
{
}

- (void)addRequestedComponentsForReason:(unint64_t)a3 traits:(id)a4 count:(unsigned int)a5
{
  uint64_t v5 = *(void *)&a5;
  id v8 = a4;
  id v9 = [(id)objc_opt_class() createRequestedComponentsForReason:a3 traits:v8 count:v5];

  [(GEOPDPlaceRequest *)self addRequestedComponents:v9];
}

+ (id)createRequestedComponentsForReason:(unint64_t)a3 traits:(id)a4 count:(unsigned int)a5
{
  uint64_t v5 = *(void *)&a5;
  id v8 = a4;
  id v9 = [MEMORY[0x1E4F1CA80] set];
  v253[0] = MEMORY[0x1E4F143A8];
  v253[1] = 3221225472;
  v253[2] = __86__GEOPDPlaceRequest_PlaceDataExtras__createRequestedComponentsForReason_traits_count___block_invoke;
  v253[3] = &unk_1E53F6200;
  id v10 = v9;
  id v254 = v10;
  long long v11 = (void (**)(void, uint64_t))MEMORY[0x18C120660](v253);
  int v12 = 0;
  if ((uint64_t)a3 <= 10)
  {
    if (a3 && a3 != 3) {
      goto LABEL_22;
    }
    goto LABEL_21;
  }
  if (a3 == 31)
  {
LABEL_21:
    int v12 = 1;
    goto LABEL_22;
  }
  if (a3 == 11)
  {
    int v12 = 1;
    id v13 = [a1 componentInfoWithType:51 count:1 traits:v8];
    v11[2](v11, (uint64_t)v13);

LABEL_8:
    if (v5)
    {
      if (GEOConfigGetBOOL(GeoServicesConfig_RequestLegacyAddressComponent, (uint64_t)off_1E9115208))
      {
        uint64_t v14 = [a1 componentInfoWithType:5 count:v5 traits:v8];
        v11[2](v11, (uint64_t)v14);
      }
      uint64_t v15 = [a1 componentInfoWithType:31 count:1 traits:v8];
      v11[2](v11, (uint64_t)v15);

      uint64_t v16 = [a1 componentInfoWithType:1 count:1 traits:v8];
      v11[2](v11, (uint64_t)v16);

      v17 = [a1 componentInfoWithType:2 count:1 traits:v8];
      v11[2](v11, (uint64_t)v17);
    }
    if (GEOConfigGetBOOL(GeoServicesConfig_RequestLegacyHoursComponent, (uint64_t)off_1E9114BA8))
    {
      v18 = [a1 componentInfoWithType:9 count:0x7FFFFFFFLL traits:v8];
      v11[2](v11, (uint64_t)v18);
    }
    if (v12)
    {
      v19 = [a1 componentInfoWithType:3 count:1 traits:v8];
      v11[2](v11, (uint64_t)v19);
    }
    v20 = [a1 componentInfoWithType:64 count:1 traits:v8];
    v21 = v11 + 2;
    v11[2](v11, (uint64_t)v20);
LABEL_17:

    id v22 = a1;
    uint64_t v23 = 77;
LABEL_18:
    uint64_t v24 = 1;
LABEL_19:
    uint64_t v25 = [v22 componentInfoWithType:v23 count:v24 traits:v8];
LABEL_20:
    double v26 = (void *)v25;
    (*v21)(v11, v25);
    goto LABEL_125;
  }
LABEL_22:
  switch(a3)
  {
    case 0uLL:
    case 1uLL:
    case 3uLL:
      if (v5)
      {
        if (GEOConfigGetBOOL(GeoServicesConfig_RequestLegacyAddressComponent, (uint64_t)off_1E9115208))
        {
          v27 = [a1 componentInfoWithType:5 count:v5 traits:v8];
          v11[2](v11, (uint64_t)v27);
        }
        v28 = [a1 componentInfoWithType:31 count:v5 traits:v8];
        v11[2](v11, (uint64_t)v28);

        v29 = [a1 componentInfoWithType:1 count:v5 traits:v8];
        v11[2](v11, (uint64_t)v29);

        long long v30 = [a1 componentInfoWithType:2 count:v5 traits:v8];
        v11[2](v11, (uint64_t)v30);
      }
      if (v12)
      {
        long long v31 = [a1 componentInfoWithType:3 count:1 traits:v8];
        v11[2](v11, (uint64_t)v31);
      }
      long long v32 = [a1 componentInfoWithType:52 count:2 traits:v8];
      v11[2](v11, (uint64_t)v32);

      long long v33 = [a1 componentInfoWithType:77 count:1 traits:v8];
      v11[2](v11, (uint64_t)v33);

      objc_super v34 = [a1 componentInfoWithType:4 count:1 traits:v8];
      v11[2](v11, (uint64_t)v34);

      v35 = [a1 componentInfoWithType:64 count:0x7FFFFFFFLL traits:v8];
      v11[2](v11, (uint64_t)v35);

      if (GEOConfigGetBOOL(GeoServicesConfig_RequestLegacyHoursComponent, (uint64_t)off_1E9114BA8))
      {
        uint64_t v36 = [a1 componentInfoWithType:9 count:0x7FFFFFFFLL traits:v8];
        v11[2](v11, (uint64_t)v36);
      }
      v37 = [a1 componentInfoWithType:53 count:1 traits:v8];
      v11[2](v11, (uint64_t)v37);

      v38 = objc_msgSend(a1, "componentInfoWithType:count:traits:", 6, objc_msgSend(v8, "ratingsCount"), v8);
      v11[2](v11, (uint64_t)v38);

      v39 = [a1 componentInfoWithType:24 count:1 traits:v8];
      v11[2](v11, (uint64_t)v39);

      v40 = [a1 componentInfoWithType:20 count:1 traits:v8];
      v11[2](v11, (uint64_t)v40);

      v41 = [a1 componentInfoWithType:10 count:1 traits:v8];
      v11[2](v11, (uint64_t)v41);

      v42 = [a1 componentInfoWithType:11 count:1 traits:v8];
      v11[2](v11, (uint64_t)v42);

      v43 = [a1 componentInfoWithType:21 count:1 traits:v8];
      v11[2](v11, (uint64_t)v43);

      v44 = [a1 componentInfoWithType:16 count:0x7FFFFFFFLL traits:v8];
      v11[2](v11, (uint64_t)v44);

      v45 = [a1 componentInfoWithType:23 count:6 traits:v8];
      v11[2](v11, (uint64_t)v45);

      if (GEOConfigGetBOOL(MapsFeaturesConfig_RealTimeEVCharger, (uint64_t)off_1E9111E18))
      {
        v46 = [a1 componentInfoWithType:97 count:1 traits:v8];
        v11[2](v11, (uint64_t)v46);
      }
      if (GEOConfigGetBOOL(MapsFeaturesConfig_HikingWatchEnabled, (uint64_t)off_1E9111E28))
      {
        v47 = [a1 componentInfoWithType:98 count:1 traits:v8];
        v11[2](v11, (uint64_t)v47);
      }
      v48 = [a1 componentInfoWithType:105 count:1 traits:v8];
      v11[2](v11, (uint64_t)v48);

      v49 = [a1 componentInfoWithType:106 count:1 traits:v8];
      v11[2](v11, (uint64_t)v49);

      v50 = [a1 componentInfoWithType:104 count:1 traits:v8];
      v11[2](v11, (uint64_t)v50);

      v51 = objc_msgSend(a1, "componentInfoWithType:count:traits:", 84, objc_msgSend(v8, "photoAlbumCount"), v8);
      v11[2](v11, (uint64_t)v51);

      if ([v8 photosCount])
      {
        v52 = objc_msgSend(a1, "componentInfoWithType:count:traits:", 26, objc_msgSend(v8, "photosCount"), v8);
        v11[2](v11, (uint64_t)v52);
      }
      if (GEOConfigGetBOOL(MapsFeaturesConfig_SearchAndDiscovery, (uint64_t)off_1E9111EB8))
      {
        v53 = [a1 componentInfoWithType:102 count:0x7FFFFFFFLL traits:v8];
        v11[2](v11, (uint64_t)v53);
      }
      v54 = [a1 componentInfoWithType:15 count:0x7FFFFFFFLL traits:v8];
      v11[2](v11, (uint64_t)v54);

      v55 = [a1 componentInfoWithType:86 count:1 traits:v8];
      v11[2](v11, (uint64_t)v55);

      v56 = [a1 componentInfoWithType:22 count:1 traits:v8];
      v11[2](v11, (uint64_t)v56);

      v57 = [a1 componentInfoWithType:83 count:1 traits:v8];
      v11[2](v11, (uint64_t)v57);

      v58 = [a1 componentInfoWithType:92 count:1 traits:v8];
      v11[2](v11, (uint64_t)v58);

      v59 = [a1 componentInfoWithType:103 count:1 traits:v8];
      v11[2](v11, (uint64_t)v59);

      if (v5)
      {
        v60 = [a1 componentInfoWithType:41 count:v5 traits:v8];
        v11[2](v11, (uint64_t)v60);
      }
      if ([v8 reviewUserPhotosCount])
      {
        v61 = objc_msgSend(a1, "componentInfoWithType:count:traits:", 7, objc_msgSend(v8, "reviewUserPhotosCount"), v8);
        v11[2](v11, (uint64_t)v61);
      }
      v62 = +[GEOResourceManifestManager modernManager];
      int v63 = [v62 isMuninEnabled];

      if (v63)
      {
        v64 = [a1 componentInfoWithType:56 count:1 traits:v8];
        v11[2](v11, (uint64_t)v64);

        v65 = [a1 componentInfoWithType:55 count:1 traits:v8];
        v11[2](v11, (uint64_t)v65);

        v66 = [a1 componentInfoWithType:59 count:1 traits:v8];
        v11[2](v11, (uint64_t)v66);
      }
      if (GEOConfigGetBOOL(GeoServicesConfig_PlaceCardUseDynamicLayout, (uint64_t)off_1E9114818))
      {
        v67 = [a1 componentInfoWithType:60 count:1 traits:v8];
        v11[2](v11, (uint64_t)v67);
      }
      v68 = [a1 componentInfoWithType:57 count:1 traits:v8];
      v11[2](v11, (uint64_t)v68);

      v69 = [a1 componentInfoWithType:38 count:1 traits:v8];
      v11[2](v11, (uint64_t)v69);

      v70 = [a1 componentInfoWithType:54 count:1 traits:v8];
      v11[2](v11, (uint64_t)v70);

      v71 = [a1 componentInfoWithType:50 count:1 traits:v8];
      v11[2](v11, (uint64_t)v71);

      v72 = [a1 componentInfoWithType:13 count:1 traits:v8];
      v11[2](v11, (uint64_t)v72);

      v73 = [a1 componentInfoWithType:63 count:0x7FFFFFFFLL traits:v8];
      v11[2](v11, (uint64_t)v73);

      v74 = [a1 componentInfoWithType:39 count:1 traits:v8];
      v11[2](v11, (uint64_t)v74);

      if (GEOConfigGetBOOL(MapsFeaturesConfig_ShelbyvilleStonehenge, (uint64_t)off_1E9111CA8))
      {
        v75 = [a1 componentInfoWithType:72 count:1 traits:v8];
        v11[2](v11, (uint64_t)v75);

        v76 = [a1 componentInfoWithType:70 count:1 traits:v8];
        v11[2](v11, (uint64_t)v76);
      }
      v77 = [a1 componentInfoWithType:40 count:4 traits:v8];
      v11[2](v11, (uint64_t)v77);

      v78 = [a1 componentInfoWithType:66 count:0x7FFFFFFFLL traits:v8];
      v11[2](v11, (uint64_t)v78);

      v79 = [a1 componentInfoWithType:89 count:0x7FFFFFFFLL traits:v8];
      v11[2](v11, (uint64_t)v79);

      v80 = [a1 componentInfoWithType:33 count:1 traits:v8];
      v11[2](v11, (uint64_t)v80);

      v81 = [a1 componentInfoWithType:30 count:v5 traits:v8];
      v11[2](v11, (uint64_t)v81);

      v82 = [a1 componentInfoWithType:36 count:3 traits:v8];
      v11[2](v11, (uint64_t)v82);

      v83 = [a1 componentInfoWithType:62 count:1 traits:v8];
      v11[2](v11, (uint64_t)v83);

      v84 = [a1 componentInfoWithType:48 count:1 traits:v8];
      v11[2](v11, (uint64_t)v84);

      if (GEOConfigGetBOOL(MapsFeaturesConfig_ShouldEnableLagunaBeach, (uint64_t)off_1E9111C08))
      {
        v85 = [a1 componentInfoWithType:73 count:1 traits:v8];
        v11[2](v11, (uint64_t)v85);
      }
      v86 = [a1 collectionComponentInfoForReason:a3 count:5 traits:v8];
      v11[2](v11, (uint64_t)v86);

      v87 = [a1 publisherComponentInfoForReason:a3 count:1 traits:v8];
      v11[2](v11, (uint64_t)v87);

      if (GEOConfigGetBOOL(MapsFeaturesConfig_Maps269Enabled, (uint64_t)off_1E9111CE8))
      {
        v88 = [a1 componentInfoWithType:85 count:1 traits:v8];
        v11[2](v11, (uint64_t)v88);
      }
      v89 = [a1 componentInfoWithType:88 count:1 traits:v8];
      v11[2](v11, (uint64_t)v89);

      v90 = [a1 componentInfoWithType:87 count:1 traits:v8];
      v11[2](v11, (uint64_t)v90);

      v91 = [a1 componentInfoWithType:96 count:1 traits:v8];
      v11[2](v11, (uint64_t)v91);

      v92 = [a1 componentInfoWithType:94 count:0x7FFFFFFFLL traits:v8];
      v11[2](v11, (uint64_t)v92);

      v93 = [a1 componentInfoWithType:76 count:1 traits:v8];
      v11[2](v11, (uint64_t)v93);

      v94 = [a1 componentInfoWithType:83 count:1 traits:v8];
      v11[2](v11, (uint64_t)v94);

      if (GEOConfigGetBOOL(MapsFeaturesConfig_PlaceCardShowcase, (uint64_t)off_1E9111D28))
      {
        v95 = [a1 componentInfoWithType:93 count:1 traits:v8];
        v11[2](v11, (uint64_t)v95);
      }
      if (GEOConfigGetBOOL(MapsFeaturesConfig_HikingiOSEnabled, (uint64_t)off_1E9111E38)
        && [v8 wantsRouteCreationTip])
      {
        v96 = [a1 componentInfoWithType:99 count:1 traits:v8];
        v11[2](v11, (uint64_t)v96);
      }
      v97 = [a1 componentInfoWithType:42 count:1 traits:v8];
      v11[2](v11, (uint64_t)v97);

      double v26 = [a1 componentInfoWithType:44 count:1 traits:v8];
      v11[2](v11, (uint64_t)v26);
      goto LABEL_125;
    case 2uLL:
      if (v5)
      {
        if (GEOConfigGetBOOL(GeoServicesConfig_RequestLegacyAddressComponent_AC, (uint64_t)off_1E9114B98))
        {
          v101 = [a1 componentInfoWithType:5 count:v5 traits:v8];
          v11[2](v11, (uint64_t)v101);
        }
        v102 = [a1 componentInfoWithType:31 count:v5 traits:v8];
        v11[2](v11, (uint64_t)v102);

        v103 = [a1 componentInfoWithType:64 count:0x7FFFFFFFLL traits:v8];
        v11[2](v11, (uint64_t)v103);

        v104 = [a1 componentInfoWithType:1 count:v5 traits:v8];
        v11[2](v11, (uint64_t)v104);

        if (GEOConfigGetBOOL(GeoServicesConfig_RequestLegacyHoursComponent_AC, (uint64_t)off_1E9114BB8))
        {
          v105 = [a1 componentInfoWithType:9 count:0x7FFFFFFFLL traits:v8];
          v11[2](v11, (uint64_t)v105);
        }
        v106 = [a1 componentInfoWithType:2 count:v5 traits:v8];
        v11[2](v11, (uint64_t)v106);
      }
      if ([v8 photosCount])
      {
        v107 = objc_msgSend(a1, "componentInfoWithType:count:traits:", 26, objc_msgSend(v8, "photosCount"), v8);
        v11[2](v11, (uint64_t)v107);
      }
      v108 = objc_msgSend(a1, "componentInfoWithType:count:traits:", 6, objc_msgSend(v8, "ratingsCount"), v8);
      v11[2](v11, (uint64_t)v108);

      v109 = [a1 componentInfoWithType:30 count:v5 traits:v8];
      v11[2](v11, (uint64_t)v109);

      v110 = [a1 componentInfoWithType:16 count:0x7FFFFFFFLL traits:v8];
      v11[2](v11, (uint64_t)v110);

      v111 = [a1 componentInfoWithType:27 count:1 traits:v8];
      v11[2](v11, (uint64_t)v111);

      v112 = [a1 componentInfoWithType:48 count:1 traits:v8];
      v11[2](v11, (uint64_t)v112);

      v113 = [a1 collectionComponentInfoForReason:2 count:v5 traits:v8];
      v11[2](v11, (uint64_t)v113);

      v114 = [a1 publisherComponentInfoForReason:2 count:v5 traits:v8];
      v11[2](v11, (uint64_t)v114);

      v115 = [a1 componentInfoWithType:83 count:1 traits:v8];
      v11[2](v11, (uint64_t)v115);

      v116 = [a1 componentInfoWithType:104 count:1 traits:v8];
      v11[2](v11, (uint64_t)v116);

      v117 = [a1 componentInfoWithType:23 count:6 traits:v8];
      v11[2](v11, (uint64_t)v117);

      if (GEOConfigGetBOOL(MapsFeaturesConfig_PlaceCardShowcase, (uint64_t)off_1E9111D28))
      {
        v118 = [a1 componentInfoWithType:93 count:1 traits:v8];
        v11[2](v11, (uint64_t)v118);
      }
      v119 = [a1 componentInfoWithType:42 count:1 traits:v8];
      v11[2](v11, (uint64_t)v119);

      v120 = [a1 componentInfoWithType:44 count:1 traits:v8];
      v11[2](v11, (uint64_t)v120);

      id v121 = a1;
      uint64_t v122 = 103;
      goto LABEL_100;
    case 4uLL:
      v123 = [a1 componentInfoWithType:10 count:1 traits:v8];
      v21 = v11 + 2;
      v11[2](v11, (uint64_t)v123);

      v124 = [a1 componentInfoWithType:24 count:1 traits:v8];
      v11[2](v11, (uint64_t)v124);

      v125 = [a1 componentInfoWithType:20 count:1 traits:v8];
      v11[2](v11, (uint64_t)v125);

      v126 = [a1 componentInfoWithType:11 count:1 traits:v8];
      v11[2](v11, (uint64_t)v126);

      v127 = [a1 componentInfoWithType:4 count:1 traits:v8];
      v11[2](v11, (uint64_t)v127);

      v128 = [a1 componentInfoWithType:69 count:1 traits:v8];
      v11[2](v11, (uint64_t)v128);

      v129 = [a1 componentInfoWithType:67 count:1 traits:v8];
      v11[2](v11, (uint64_t)v129);

      id v22 = a1;
      uint64_t v23 = 68;
      goto LABEL_18;
    case 5uLL:
      v130 = [a1 componentInfoWithType:20 count:1 traits:v8];
      v21 = v11 + 2;
      v11[2](v11, (uint64_t)v130);

      v131 = [a1 componentInfoWithType:11 count:1 traits:v8];
      v11[2](v11, (uint64_t)v131);

      v132 = [a1 componentInfoWithType:67 count:1 traits:v8];
      v11[2](v11, (uint64_t)v132);

      v133 = [a1 componentInfoWithType:68 count:1 traits:v8];
      v11[2](v11, (uint64_t)v133);

      id v22 = a1;
      uint64_t v23 = 10;
      goto LABEL_18;
    case 6uLL:
      v134 = [a1 componentInfoWithType:10 count:1 traits:v8];
      v21 = v11 + 2;
      v11[2](v11, (uint64_t)v134);

      v135 = [a1 componentInfoWithType:11 count:1 traits:v8];
      v11[2](v11, (uint64_t)v135);

      v136 = [a1 componentInfoWithType:4 count:1 traits:v8];
      v11[2](v11, (uint64_t)v136);

      v137 = [a1 componentInfoWithType:69 count:1 traits:v8];
      v11[2](v11, (uint64_t)v137);

      v138 = [a1 componentInfoWithType:67 count:1 traits:v8];
      v11[2](v11, (uint64_t)v138);

      v139 = [a1 componentInfoWithType:68 count:1 traits:v8];
      v11[2](v11, (uint64_t)v139);

      id v22 = a1;
      uint64_t v23 = 20;
      goto LABEL_18;
    case 7uLL:
      v140 = [a1 componentInfoWithType:10 count:1 traits:v8];
      v21 = v11 + 2;
      v11[2](v11, (uint64_t)v140);

      v141 = [a1 componentInfoWithType:20 count:1 traits:v8];
      v11[2](v11, (uint64_t)v141);

      id v22 = a1;
      uint64_t v23 = 11;
      goto LABEL_18;
    case 8uLL:
      if (GEOConfigGetBOOL(GeoServicesConfig_PlaceCardUseDynamicLayout, (uint64_t)off_1E9114818))
      {
        v142 = [a1 componentInfoWithType:60 count:1 traits:v8];
        v11[2](v11, (uint64_t)v142);
      }
      v143 = [a1 componentInfoWithType:31 count:1 traits:v8];
      v11[2](v11, (uint64_t)v143);

      v144 = [a1 componentInfoWithType:57 count:1 traits:v8];
      v11[2](v11, (uint64_t)v144);

      v145 = [a1 componentInfoWithType:4 count:1 traits:v8];
      v11[2](v11, (uint64_t)v145);

      v146 = [a1 componentInfoWithType:54 count:1 traits:v8];
      v11[2](v11, (uint64_t)v146);

      v147 = [a1 componentInfoWithType:64 count:0x7FFFFFFFLL traits:v8];
      v11[2](v11, (uint64_t)v147);

      v148 = [a1 componentInfoWithType:26 count:1 traits:v8];
      v11[2](v11, (uint64_t)v148);

      v149 = [a1 componentInfoWithType:50 count:1 traits:v8];
      v11[2](v11, (uint64_t)v149);

      v150 = [a1 componentInfoWithType:1 count:1 traits:v8];
      v11[2](v11, (uint64_t)v150);

      if (GEOConfigGetBOOL(GeoServicesConfig_RequestLegacyHoursComponent, (uint64_t)off_1E9114BA8))
      {
        v151 = [a1 componentInfoWithType:9 count:0x7FFFFFFFLL traits:v8];
        v11[2](v11, (uint64_t)v151);
      }
      v152 = [a1 componentInfoWithType:2 count:1 traits:v8];
      v11[2](v11, (uint64_t)v152);

      v153 = [a1 componentInfoWithType:40 count:1 traits:v8];
      v11[2](v11, (uint64_t)v153);

      v154 = objc_msgSend(a1, "componentInfoWithType:count:traits:", 6, objc_msgSend(v8, "ratingsCount"), v8);
      v11[2](v11, (uint64_t)v154);

      v155 = [a1 componentInfoWithType:66 count:0x7FFFFFFFLL traits:v8];
      v11[2](v11, (uint64_t)v155);

      v156 = [a1 componentInfoWithType:89 count:0x7FFFFFFFLL traits:v8];
      v11[2](v11, (uint64_t)v156);

      v157 = [a1 componentInfoWithType:16 count:0x7FFFFFFFLL traits:v8];
      v11[2](v11, (uint64_t)v157);

      v158 = [a1 componentInfoWithType:48 count:1 traits:v8];
      v11[2](v11, (uint64_t)v158);

      v159 = objc_msgSend(a1, "componentInfoWithType:count:traits:", 84, objc_msgSend(v8, "photoAlbumCount"), v8);
      v11[2](v11, (uint64_t)v159);

      v160 = [a1 componentInfoWithType:83 count:1 traits:v8];
      v11[2](v11, (uint64_t)v160);

      v161 = [a1 componentInfoWithType:86 count:1 traits:v8];
      v11[2](v11, (uint64_t)v161);

      v162 = [a1 componentInfoWithType:88 count:1 traits:v8];
      v11[2](v11, (uint64_t)v162);

      if (GEOConfigGetBOOL(MapsFeaturesConfig_SearchAndDiscovery, (uint64_t)off_1E9111EB8))
      {
        v163 = [a1 componentInfoWithType:102 count:0x7FFFFFFFLL traits:v8];
        v11[2](v11, (uint64_t)v163);
      }
      v164 = [a1 componentInfoWithType:92 count:1 traits:v8];
      v11[2](v11, (uint64_t)v164);

      v165 = [a1 componentInfoWithType:52 count:2 traits:v8];
      v11[2](v11, (uint64_t)v165);

      v166 = [a1 componentInfoWithType:96 count:1 traits:v8];
      v11[2](v11, (uint64_t)v166);

      v167 = [a1 componentInfoWithType:94 count:0x7FFFFFFFLL traits:v8];
      v11[2](v11, (uint64_t)v167);

      v168 = [a1 componentInfoWithType:42 count:1 traits:v8];
      v11[2](v11, (uint64_t)v168);

      id v169 = a1;
      uint64_t v170 = 44;
      goto LABEL_145;
    case 9uLL:
      v171 = [a1 componentInfoWithType:31 count:1 traits:v8];
      v21 = v11 + 2;
      v11[2](v11, (uint64_t)v171);

      v172 = [a1 componentInfoWithType:4 count:1 traits:v8];
      v11[2](v11, (uint64_t)v172);

      v173 = [a1 componentInfoWithType:1 count:1 traits:v8];
      v11[2](v11, (uint64_t)v173);

      v174 = [a1 componentInfoWithType:2 count:1 traits:v8];
      v11[2](v11, (uint64_t)v174);

      id v22 = a1;
      uint64_t v23 = 16;
      goto LABEL_103;
    case 0xAuLL:
      v175 = [a1 componentInfoWithType:2 count:1 traits:v8];
      v21 = v11 + 2;
      v11[2](v11, (uint64_t)v175);

      id v22 = a1;
      uint64_t v23 = 58;
      goto LABEL_18;
    case 0xBuLL:
      goto LABEL_8;
    case 0xCuLL:
      id v99 = a1;
      uint64_t v100 = 26;
      uint64_t v176 = v5;
      goto LABEL_123;
    case 0xDuLL:
      v177 = [a1 collectionComponentInfoForReason:13 count:0x7FFFFFFFLL traits:v8];
      v21 = v11 + 2;
      v11[2](v11, (uint64_t)v177);

      v178 = [a1 publisherComponentInfoForReason:13 count:1 traits:v8];
      v11[2](v11, (uint64_t)v178);
      goto LABEL_102;
    case 0xEuLL:
      v179 = [a1 componentInfoWithType:4 count:1 traits:v8];
      v11[2](v11, (uint64_t)v179);

      v180 = [a1 componentInfoWithType:64 count:0x7FFFFFFFLL traits:v8];
      v11[2](v11, (uint64_t)v180);

      if (GEOConfigGetBOOL(GeoServicesConfig_RequestLegacyHoursComponent, (uint64_t)off_1E9114BA8))
      {
        v181 = [a1 componentInfoWithType:9 count:0x7FFFFFFFLL traits:v8];
        v11[2](v11, (uint64_t)v181);
      }
      v182 = [a1 componentInfoWithType:53 count:1 traits:v8];
      v11[2](v11, (uint64_t)v182);

      v183 = objc_msgSend(a1, "componentInfoWithType:count:traits:", 6, objc_msgSend(v8, "ratingsCount"), v8);
      v11[2](v11, (uint64_t)v183);

      v184 = [a1 componentInfoWithType:24 count:1 traits:v8];
      v11[2](v11, (uint64_t)v184);

      v185 = [a1 componentInfoWithType:20 count:1 traits:v8];
      v11[2](v11, (uint64_t)v185);

      v186 = [a1 componentInfoWithType:10 count:1 traits:v8];
      v11[2](v11, (uint64_t)v186);

      v187 = [a1 componentInfoWithType:11 count:1 traits:v8];
      v11[2](v11, (uint64_t)v187);

      if (GEOConfigGetBOOL(MapsFeaturesConfig_Maps269Enabled, (uint64_t)off_1E9111CE8)
        && ([v8 navigating] & 1) == 0)
      {
        v188 = [a1 componentInfoWithType:82 count:1 traits:v8];
        v11[2](v11, (uint64_t)v188);

        v189 = [a1 componentInfoWithType:31 count:1 traits:v8];
        v11[2](v11, (uint64_t)v189);

        v190 = [a1 componentInfoWithType:2 count:1 traits:v8];
        v11[2](v11, (uint64_t)v190);

        v191 = [a1 componentInfoWithType:1 count:1 traits:v8];
        v11[2](v11, (uint64_t)v191);
      }
      if ([v8 navigating]) {
        goto LABEL_126;
      }
      v192 = [a1 collectionComponentInfoForReason:14 count:1 traits:v8];
      v11[2](v11, (uint64_t)v192);

      uint64_t v98 = [a1 publisherComponentInfoForReason:14 count:1 traits:v8];
      break;
    case 0xFuLL:
    case 0x12uLL:
      uint64_t v98 = [a1 collectionComponentInfoForReason:a3 count:v5 traits:v8];
      break;
    case 0x10uLL:
      if (GEOConfigGetBOOL(GeoServicesConfig_RequestLegacyAddressComponent, (uint64_t)off_1E9115208))
      {
        v193 = [a1 componentInfoWithType:5 count:v5 traits:v8];
        v11[2](v11, (uint64_t)v193);
      }
      v194 = [a1 componentInfoWithType:31 count:v5 traits:v8];
      v11[2](v11, (uint64_t)v194);

      v195 = [a1 componentInfoWithType:1 count:v5 traits:v8];
      v11[2](v11, (uint64_t)v195);

      v196 = [a1 componentInfoWithType:2 count:v5 traits:v8];
      v11[2](v11, (uint64_t)v196);

      v197 = [a1 componentInfoWithType:64 count:0x7FFFFFFFLL traits:v8];
      v11[2](v11, (uint64_t)v197);

      v198 = objc_msgSend(a1, "componentInfoWithType:count:traits:", 6, objc_msgSend(v8, "ratingsCount"), v8);
      v11[2](v11, (uint64_t)v198);

      v199 = [a1 componentInfoWithType:16 count:0x7FFFFFFFLL traits:v8];
      v11[2](v11, (uint64_t)v199);

      v200 = [a1 componentInfoWithType:26 count:1 traits:v8];
      v11[2](v11, (uint64_t)v200);

      v201 = [a1 collectionComponentInfoForReason:16 count:v5 traits:v8];
      v11[2](v11, (uint64_t)v201);

      v202 = [a1 componentInfoWithType:74 count:0x7FFFFFFFLL traits:v8];
      v11[2](v11, (uint64_t)v202);

      v203 = [a1 componentInfoWithType:76 count:1 traits:v8];
      v11[2](v11, (uint64_t)v203);

      if (GEOConfigGetBOOL(MapsFeaturesConfig_Maps269Enabled, (uint64_t)off_1E9111CE8))
      {
        v204 = [a1 componentInfoWithType:40 count:1 traits:v8];
        v11[2](v11, (uint64_t)v204);
      }
      id v121 = a1;
      uint64_t v122 = 88;
LABEL_100:
      double v26 = [v121 componentInfoWithType:v122 count:1 traits:v8];
      v11[2](v11, (uint64_t)v26);
      goto LABEL_125;
    case 0x11uLL:
      v178 = [a1 collectionComponentInfoForReason:17 count:v5 traits:v8];
      v21 = v11 + 2;
      v11[2](v11, (uint64_t)v178);
LABEL_102:

      id v22 = a1;
      uint64_t v23 = 1;
LABEL_103:
      uint64_t v24 = 0x7FFFFFFFLL;
      goto LABEL_19;
    case 0x13uLL:
      id v99 = a1;
      uint64_t v100 = 77;
      goto LABEL_122;
    case 0x14uLL:
      if (GEOConfigGetBOOL(GeoServicesConfig_RequestLegacyAddressComponent, (uint64_t)off_1E9115208))
      {
        v205 = [a1 componentInfoWithType:5 count:1 traits:v8];
        v11[2](v11, (uint64_t)v205);
      }
      v206 = [a1 componentInfoWithType:31 count:1 traits:v8];
      v21 = v11 + 2;
      v11[2](v11, (uint64_t)v206);

      v207 = [a1 componentInfoWithType:1 count:1 traits:v8];
      v11[2](v11, (uint64_t)v207);

      v208 = [a1 componentInfoWithType:2 count:1 traits:v8];
      v11[2](v11, (uint64_t)v208);

      v20 = [a1 componentInfoWithType:4 count:1 traits:v8];
      v11[2](v11, (uint64_t)v20);
      goto LABEL_17;
    case 0x15uLL:
      v209 = [a1 componentInfoWithType:10 count:1 traits:v8];
      v21 = v11 + 2;
      v11[2](v11, (uint64_t)v209);

      v210 = [a1 componentInfoWithType:24 count:1 traits:v8];
      v11[2](v11, (uint64_t)v210);

      v211 = [a1 componentInfoWithType:20 count:1 traits:v8];
      v11[2](v11, (uint64_t)v211);

      v212 = [a1 componentInfoWithType:11 count:1 traits:v8];
      v11[2](v11, (uint64_t)v212);

      v213 = [a1 componentInfoWithType:79 count:1 traits:v8];
      v11[2](v11, (uint64_t)v213);

      id v22 = a1;
      uint64_t v23 = 21;
      goto LABEL_18;
    case 0x16uLL:
      v214 = [a1 collectionComponentInfoForReason:22 count:1 traits:v8];
      v21 = v11 + 2;
      v11[2](v11, (uint64_t)v214);

      uint64_t v25 = [a1 publisherComponentInfoForReason:22 count:1 traits:v8];
      goto LABEL_20;
    case 0x17uLL:
      if (!GEOConfigGetBOOL(MapsFeaturesConfig_Maps269Enabled, (uint64_t)off_1E9111CE8)) {
        goto LABEL_126;
      }
      v215 = [a1 componentInfoWithType:82 count:1 traits:v8];
      v21 = v11 + 2;
      v11[2](v11, (uint64_t)v215);
      goto LABEL_114;
    case 0x18uLL:
      if (!GEOConfigGetBOOL(MapsFeaturesConfig_Maps269Enabled, (uint64_t)off_1E9111CE8)) {
        goto LABEL_126;
      }
      v216 = [a1 collectionComponentInfoForReason:24 count:0x7FFFFFFFLL traits:v8];
      v21 = v11 + 2;
      v11[2](v11, (uint64_t)v216);

      v217 = [a1 publisherComponentInfoForReason:24 count:1 traits:v8];
      v11[2](v11, (uint64_t)v217);

      v215 = [a1 componentInfoWithType:82 count:1 traits:v8];
      v11[2](v11, (uint64_t)v215);
LABEL_114:

      v218 = [a1 componentInfoWithType:31 count:1 traits:v8];
      (*v21)(v11, (uint64_t)v218);

      v219 = [a1 componentInfoWithType:2 count:1 traits:v8];
      (*v21)(v11, (uint64_t)v219);

      id v22 = a1;
      uint64_t v23 = 1;
      goto LABEL_18;
    case 0x19uLL:
      id v99 = a1;
      uint64_t v100 = 84;
      goto LABEL_122;
    case 0x1AuLL:
      id v99 = a1;
      uint64_t v100 = 91;
      goto LABEL_122;
    case 0x1BuLL:
      if (!GEOConfigGetBOOL(MapsFeaturesConfig_PlaceCardShowcase, (uint64_t)off_1E9111D28)) {
        goto LABEL_126;
      }
      id v99 = a1;
      uint64_t v100 = 95;
      goto LABEL_122;
    case 0x1CuLL:
      id v99 = a1;
      uint64_t v100 = 1;
      goto LABEL_122;
    case 0x1DuLL:
      if (!GEOConfigGetBOOL(MapsFeaturesConfig_RealTimeEVCharger, (uint64_t)off_1E9111E18)) {
        goto LABEL_126;
      }
      v220 = [a1 componentInfoWithType:97 count:1 traits:v8];
      v11[2](v11, (uint64_t)v220);

      v221 = [a1 componentInfoWithType:1 count:v5 traits:v8];
      v11[2](v11, (uint64_t)v221);

      v222 = [a1 componentInfoWithType:2 count:v5 traits:v8];
      v11[2](v11, (uint64_t)v222);

      double v26 = [a1 componentInfoWithType:23 count:v5 traits:v8];
      v11[2](v11, (uint64_t)v26);
      goto LABEL_125;
    case 0x1EuLL:
      if (!GEOConfigGetBOOL(MapsFeaturesConfig_HikingWatchEnabled, (uint64_t)off_1E9111E28)) {
        goto LABEL_126;
      }
      id v99 = a1;
      uint64_t v100 = 99;
LABEL_122:
      uint64_t v176 = 1;
LABEL_123:
      uint64_t v98 = [v99 componentInfoWithType:v100 count:v176 traits:v8];
      break;
    case 0x1FuLL:
      if (v5)
      {
        if (GEOConfigGetBOOL(GeoServicesConfig_RequestLegacyAddressComponent, (uint64_t)off_1E9115208))
        {
          v225 = [a1 componentInfoWithType:5 count:v5 traits:v8];
          v11[2](v11, (uint64_t)v225);
        }
        v226 = [a1 componentInfoWithType:31 count:v5 traits:v8];
        v11[2](v11, (uint64_t)v226);

        v227 = [a1 componentInfoWithType:1 count:v5 traits:v8];
        v11[2](v11, (uint64_t)v227);

        v228 = [a1 componentInfoWithType:2 count:v5 traits:v8];
        v11[2](v11, (uint64_t)v228);
      }
      if (v12)
      {
        v229 = [a1 componentInfoWithType:3 count:1 traits:v8];
        v11[2](v11, (uint64_t)v229);
      }
      v230 = [a1 componentInfoWithType:52 count:2 traits:v8];
      v11[2](v11, (uint64_t)v230);

      v231 = [a1 componentInfoWithType:77 count:1 traits:v8];
      v11[2](v11, (uint64_t)v231);

      v232 = [a1 componentInfoWithType:4 count:1 traits:v8];
      v11[2](v11, (uint64_t)v232);

      v233 = [a1 componentInfoWithType:64 count:0x7FFFFFFFLL traits:v8];
      v11[2](v11, (uint64_t)v233);

      if (GEOConfigGetBOOL(GeoServicesConfig_RequestLegacyHoursComponent, (uint64_t)off_1E9114BA8))
      {
        v234 = [a1 componentInfoWithType:9 count:0x7FFFFFFFLL traits:v8];
        v11[2](v11, (uint64_t)v234);
      }
      v235 = [a1 componentInfoWithType:53 count:1 traits:v8];
      v11[2](v11, (uint64_t)v235);

      v236 = objc_msgSend(a1, "componentInfoWithType:count:traits:", 6, objc_msgSend(v8, "ratingsCount"), v8);
      v11[2](v11, (uint64_t)v236);

      v237 = [a1 componentInfoWithType:24 count:1 traits:v8];
      v11[2](v11, (uint64_t)v237);

      v238 = [a1 componentInfoWithType:10 count:1 traits:v8];
      v11[2](v11, (uint64_t)v238);

      v239 = [a1 componentInfoWithType:16 count:0x7FFFFFFFLL traits:v8];
      v11[2](v11, (uint64_t)v239);

      v240 = [a1 componentInfoWithType:23 count:6 traits:v8];
      v11[2](v11, (uint64_t)v240);

      if ([v8 photosCount])
      {
        v241 = objc_msgSend(a1, "componentInfoWithType:count:traits:", 26, objc_msgSend(v8, "photosCount"), v8);
        v11[2](v11, (uint64_t)v241);
      }
      v242 = [a1 collectionComponentInfoForReason:31 count:5 traits:v8];
      v11[2](v11, (uint64_t)v242);

      v243 = [a1 publisherComponentInfoForReason:31 count:1 traits:v8];
      v11[2](v11, (uint64_t)v243);

      v244 = [a1 componentInfoWithType:88 count:1 traits:v8];
      v11[2](v11, (uint64_t)v244);

      v245 = [a1 componentInfoWithType:87 count:1 traits:v8];
      v11[2](v11, (uint64_t)v245);

      v246 = objc_msgSend(a1, "componentInfoWithType:count:traits:", 84, objc_msgSend(v8, "photoAlbumCount"), v8);
      v11[2](v11, (uint64_t)v246);

      v247 = [a1 componentInfoWithType:50 count:1 traits:v8];
      v11[2](v11, (uint64_t)v247);

      if (GEOConfigGetBOOL(MapsFeaturesConfig_PlaceCardShowcase, (uint64_t)off_1E9111D28))
      {
        v248 = [a1 componentInfoWithType:93 count:1 traits:v8];
        v11[2](v11, (uint64_t)v248);
      }
      if (GEOConfigGetBOOL(MapsFeaturesConfig_SearchAndDiscovery, (uint64_t)off_1E9111EB8))
      {
        v249 = [a1 componentInfoWithType:102 count:0x7FFFFFFFLL traits:v8];
        v11[2](v11, (uint64_t)v249);
      }
      v250 = [a1 componentInfoWithType:105 count:1 traits:v8];
      v11[2](v11, (uint64_t)v250);

      v251 = [a1 componentInfoWithType:106 count:1 traits:v8];
      v11[2](v11, (uint64_t)v251);

      v252 = [a1 componentInfoWithType:104 count:1 traits:v8];
      v11[2](v11, (uint64_t)v252);

      if (!GEOConfigGetBOOL(MapsFeaturesConfig_RealTimeEVCharger, (uint64_t)off_1E9111E18)) {
        goto LABEL_126;
      }
      id v169 = a1;
      uint64_t v170 = 97;
LABEL_145:
      uint64_t v98 = [v169 componentInfoWithType:v170 count:1 traits:v8];
      break;
    default:
      goto LABEL_126;
  }
  double v26 = (void *)v98;
  v11[2](v11, v98);
LABEL_125:

LABEL_126:
  v223 = (void *)[v10 copy];

  return v223;
}

uint64_t __86__GEOPDPlaceRequest_PlaceDataExtras__createRequestedComponentsForReason_traits_count___block_invoke(uint64_t result, uint64_t a2)
{
  if (a2) {
    return [*(id *)(result + 32) addObject:a2];
  }
  return result;
}

+ (id)componentInfoWithType:(int)a3 count:(unsigned int)a4 traits:(id)a5
{
  uint64_t v5 = *(void *)&a4;
  uint64_t v6 = *(void *)&a3;
  id v7 = a5;
  id v8 = [[GEOPDComponentInfo alloc] initWithType:v6 count:v5];
  if ((int)v6 > 54)
  {
    if ((int)v6 > 67)
    {
      if ((int)v6 > 98)
      {
        if (v6 == 99)
        {
          v28 = objc_alloc_init(GEOPDComponentFilter);
          -[GEOPDComponentInfo setFilter:]((uint64_t)v8, v28);

          v29 = objc_alloc_init(GEOPDTooltipFilter);
          long long v30 = -[GEOPDComponentInfo filter]((id *)&v8->super.super.isa);
          -[GEOPDComponentFilter setToolTipFilter:]((uint64_t)v30, v29);

          char v31 = [v7 wantsRouteCreationTip];
          -[GEOPDComponentInfo filter]((id *)&v8->super.super.isa);
          uint64_t v16 = (GEOPDForwardInfoFilter *)objc_claimAutoreleasedReturnValue();
          -[GEOPDComponentFilter toolTipFilter]((id *)&v16->super.super.isa);
          v17 = (unsigned char *)objc_claimAutoreleasedReturnValue();
          if (v17)
          {
            v17[20] |= 1u;
            v17[16] = v31;
          }
          goto LABEL_47;
        }
        if (v6 != 103) {
          goto LABEL_52;
        }
        uint64_t v24 = objc_alloc_init(GEOPDComponentFilter);
        -[GEOPDComponentInfo setFilter:]((uint64_t)v8, v24);

        uint64_t v16 = objc_alloc_init(GEOPDForwardInfoFilter);
        uint64_t v25 = -[GEOPDComponentInfo filter]((id *)&v8->super.super.isa);
        -[GEOPDComponentFilter setForwardInfoFilter:]((uint64_t)v25, v16);
LABEL_50:

        goto LABEL_51;
      }
      if (v6 == 68)
      {
        if (![v7 hasTransitTripStopTimeFilter]) {
          goto LABEL_52;
        }
        id v9 = [[GEOPDComponentFilter alloc] initTransitTripStopTimeFilterWithTraits:v7];
        goto LABEL_25;
      }
      if (v6 != 84) {
        goto LABEL_52;
      }
      id v10 = objc_alloc_init(GEOPDComponentFilter);
      -[GEOPDComponentInfo setFilter:]((uint64_t)v8, v10);

      long long v11 = objc_alloc_init(GEOPDCategorizedPhotosFilter);
      int v12 = -[GEOPDComponentInfo filter]((id *)&v8->super.super.isa);
      -[GEOPDComponentFilter setCategorizedPhotosFilter:]((uint64_t)v12, v11);

      -[GEOPDComponentInfo filter]((id *)&v8->super.super.isa);
      id v13 = (id *)objc_claimAutoreleasedReturnValue();
      uint64_t v14 = -[GEOPDComponentFilter categorizedPhotosFilter](v13);
      if (v14)
      {
        *(unsigned char *)(v14 + 80) |= 0x80u;
        *(unsigned char *)(v14 + 80) |= 2u;
        *(_DWORD *)(v14 + 72) = 0;
      }

      int v15 = [v7 photosCount];
      -[GEOPDComponentInfo filter]((id *)&v8->super.super.isa);
      uint64_t v16 = (GEOPDForwardInfoFilter *)objc_claimAutoreleasedReturnValue();
      -[GEOPDComponentFilter categorizedPhotosFilter]((id *)&v16->super.super.isa);
      v17 = (unsigned char *)objc_claimAutoreleasedReturnValue();
      if (!v17)
      {
LABEL_47:

        goto LABEL_51;
      }
      v17[80] |= 0x80u;
      v17[80] |= 1u;
      uint64_t v18 = 68;
    }
    else
    {
      if ((int)v6 <= 58)
      {
        if (v6 != 55)
        {
          if (v6 != 57) {
            goto LABEL_52;
          }
          id v9 = [[GEOPDComponentFilter alloc] initAnnotatedItemListFilterWithTraits:v7];
          goto LABEL_25;
        }
        double v26 = objc_alloc_init(GEOPDComponentFilter);
        -[GEOPDComponentInfo setFilter:]((uint64_t)v8, v26);

        uint64_t v16 = objc_alloc_init(GEOPDStorefrontFilter);
        uint64_t v25 = -[GEOPDComponentInfo filter]((id *)&v8->super.super.isa);
        -[GEOPDComponentFilter setStorefrontFilter:]((uint64_t)v25, v16);
        goto LABEL_50;
      }
      if (v6 == 59)
      {
        v27 = objc_alloc_init(GEOPDComponentFilter);
        -[GEOPDComponentInfo setFilter:]((uint64_t)v8, v27);

        uint64_t v16 = objc_alloc_init(GEOPDStorefrontPresentationFilter);
        uint64_t v25 = -[GEOPDComponentInfo filter]((id *)&v8->super.super.isa);
        -[GEOPDComponentFilter setStorefrontPresentationFilter:]((uint64_t)v25, v16);
        goto LABEL_50;
      }
      if (v6 != 66) {
        goto LABEL_52;
      }
      v19 = objc_alloc_init(GEOPDComponentFilter);
      -[GEOPDComponentInfo setFilter:]((uint64_t)v8, v19);

      v20 = objc_alloc_init(GEOPDRelatedPlaceFilter);
      v21 = -[GEOPDComponentInfo filter]((id *)&v8->super.super.isa);
      -[GEOPDComponentFilter setRelatedPlaceFilter:]((uint64_t)v21, v20);

      -[GEOPDComponentInfo filter]((id *)&v8->super.super.isa);
      id v22 = (id *)objc_claimAutoreleasedReturnValue();
      -[GEOPDComponentFilter relatedPlaceFilter](v22);
      uint64_t v23 = (unsigned char *)objc_claimAutoreleasedReturnValue();
      if (v23)
      {
        v23[24] |= 2u;
        v23[20] = 1;
      }

      int v15 = [v7 relatedPlaceItemCount];
      -[GEOPDComponentInfo filter]((id *)&v8->super.super.isa);
      uint64_t v16 = (GEOPDForwardInfoFilter *)objc_claimAutoreleasedReturnValue();
      -[GEOPDComponentFilter relatedPlaceFilter]((id *)&v16->super.super.isa);
      v17 = (unsigned char *)objc_claimAutoreleasedReturnValue();
      if (!v17) {
        goto LABEL_47;
      }
      v17[24] |= 1u;
      uint64_t v18 = 16;
    }
    *(_DWORD *)&v17[v18] = v15;
    goto LABEL_47;
  }
  if ((int)v6 > 14)
  {
    switch((int)v6)
    {
      case '$':
        id v9 = [[GEOPDComponentFilter alloc] initTipUserPhotoFilterWithTraits:v7];
        goto LABEL_25;
      case '%':
      case '&':
      case '\'':
      case ')':
      case '+':
        goto LABEL_52;
      case '(':
        v35 = objc_alloc_init(GEOPDComponentFilter);
        -[GEOPDComponentInfo setFilter:]((uint64_t)v8, v35);

        uint64_t v36 = objc_alloc_init(GEOPDQuickLinkFilter);
        v37 = -[GEOPDComponentInfo filter]((id *)&v8->super.super.isa);
        -[GEOPDComponentFilter setQuickLinkFilter:]((uint64_t)v37, v36);

        int Integer = GEOConfigGetInteger(GeoServicesConfig_MaxQuickLinkItemsCount, (uint64_t)off_1E9114B88);
        -[GEOPDComponentInfo filter]((id *)&v8->super.super.isa);
        uint64_t v16 = (GEOPDForwardInfoFilter *)objc_claimAutoreleasedReturnValue();
        -[GEOPDComponentFilter quickLinkFilter]((id *)&v16->super.super.isa);
        v17 = (unsigned char *)objc_claimAutoreleasedReturnValue();
        if (v17)
        {
          v17[20] |= 1u;
          *((_DWORD *)v17 + 4) = Integer;
        }
        goto LABEL_47;
      case '*':
        v39 = objc_alloc_init(GEOPDComponentFilter);
        -[GEOPDComponentInfo setFilter:]((uint64_t)v8, v39);

        uint64_t v16 = objc_alloc_init(GEOPDOfflineAreaFilter);
        uint64_t v25 = -[GEOPDComponentInfo filter]((id *)&v8->super.super.isa);
        -[GEOPDComponentFilter setOfflineAreaFilter:]((uint64_t)v25, v16);
        goto LABEL_50;
      case ',':
        v40 = objc_alloc_init(GEOPDComponentFilter);
        -[GEOPDComponentInfo setFilter:]((uint64_t)v8, v40);

        uint64_t v16 = objc_alloc_init(GEOPDSupportsOfflineMapsFilter);
        uint64_t v25 = -[GEOPDComponentInfo filter]((id *)&v8->super.super.isa);
        -[GEOPDComponentFilter setSupportsOfflineMapsFilter:]((uint64_t)v25, v16);
        goto LABEL_50;
      default:
        if (v6 != 15) {
          goto LABEL_52;
        }
        long long v32 = objc_alloc_init(GEOPDComponentFilter);
        -[GEOPDComponentInfo setFilter:]((uint64_t)v8, v32);

        long long v33 = objc_alloc_init(GEOPDAmenitiesFilter);
        objc_super v34 = -[GEOPDComponentInfo filter]((id *)&v8->super.super.isa);
        -[GEOPDComponentFilter setAmenitiesFilter:]((uint64_t)v34, v33);

        -[GEOPDComponentInfo filter]((id *)&v8->super.super.isa);
        uint64_t v16 = (GEOPDForwardInfoFilter *)objc_claimAutoreleasedReturnValue();
        -[GEOPDComponentFilter amenitiesFilter]((id *)&v16->super.super.isa);
        v17 = (unsigned char *)objc_claimAutoreleasedReturnValue();
        if (v17)
        {
          v17[20] |= 1u;
          v17[16] = 1;
        }
        break;
    }
    goto LABEL_47;
  }
  if (v6 == 1)
  {
    if (![v7 hasDeviceSpokenLocale]) {
      goto LABEL_52;
    }
    id v9 = [[GEOPDComponentFilter alloc] initEntityFilterWithSpokenNames];
    goto LABEL_25;
  }
  if (v6 == 7)
  {
    id v9 = [[GEOPDComponentFilter alloc] initReviewUserPhotoFilterWithTraits:v7];
    goto LABEL_25;
  }
  if (v6 == 11 && [v7 hasTransitScheduleFilter])
  {
    id v9 = [[GEOPDComponentFilter alloc] initTransitScheduleFilterWithTraits:v7];
LABEL_25:
    uint64_t v16 = v9;
    -[GEOPDComponentInfo setFilter:]((uint64_t)v8, v9);
LABEL_51:
  }
LABEL_52:

  return v8;
}

- (GEOPDPlaceRequest)initWithMapItemToRefine:(id)a3 traits:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  [v7 coordinate];
  id v8 = -[GEOPDPlaceRequest initWithMapItemToRefine:coordinate:traits:](self, "initWithMapItemToRefine:coordinate:traits:", v7, v6);

  return v8;
}

- (id)initForMapsHomeWithTraits:(id)a3
{
  id v4 = a3;
  id v5 = [(GEOPDPlaceRequest *)self _initWithTraits:v4 includeHistoricalLocations:0 supportedMapsResultTypes:&unk_1ED73F2E0];
  id v6 = v5;
  if (v5)
  {
    [v5 setRequestType:51];
    id v7 = objc_alloc_init(GEOPDCollectionSuggestionParameters);
    [v6 localTimestamp];
    if (v7)
    {
      *(unsigned char *)&v7->_flags |= 0x40u;
      *(unsigned char *)&v7->_flags |= 1u;
      v7->_requestLocalTimestamp = v8;
    }
    id v9 = objc_alloc_init(GEOPDMapsHomeParameters);
    -[GEOPDMapsHomeParameters setCollectionSuggestionParameters:]((uint64_t)v9, v7);
    int BOOL = GEOConfigGetBOOL(MapsFeaturesConfig_Maps269Enabled, (uint64_t)off_1E9111CE8);
    if (v9 && BOOL)
    {
      *(unsigned char *)&v9->_flags |= 1u;
      v9->_shouldPopulateExploreGuidesEntry = 1;
    }
    long long v11 = objc_alloc_init(GEOPDPlaceRequestParameters);
    -[GEOPDPlaceRequestParameters setMapsHomeParameters:]((uint64_t)v11, v9);
    [v6 setPlaceRequestParameters:v11];
    [v6 addRequestedComponentsForReason:22 traits:v4 count:0];
  }
  return v6;
}

- (GEOPDPlaceRequest)initWithReverseGeocodeLocation:(id)a3 includeEntryPoints:(BOOL)a4 preserveOriginalLocation:(BOOL)a5 placeTypeLimit:(int)a6 traits:(id)a7
{
  uint64_t v8 = *(void *)&a6;
  BOOL v9 = a5;
  BOOL v10 = a4;
  id v12 = a3;
  id v13 = a7;
  uint64_t v14 = [(GEOPDPlaceRequest *)self _initWithTraits:v13 includeHistoricalLocations:1 supportedMapsResultTypes:0];
  int v15 = v14;
  if (v14)
  {
    [(GEOPDPlaceRequest *)v14 addRequestedComponentsForReason:!v10 traits:v13 count:1];
    uint64_t v16 = [[GEOPDPlaceRequestParameters alloc] initWithReverseGeocodeLocation:v12 preserveOriginalLocation:v9 placeTypeLimit:v8];
    [(GEOPDPlaceRequest *)v15 setPlaceRequestParameters:v16];
    [(GEOPDPlaceRequest *)v15 setRequestType:4];
    v17 = v15;
  }
  return v15;
}

- (GEOPDPlaceRequest)initWithMapItemToRefine:(id)a3 coordinate:(id)a4 traits:(id)a5
{
  double var1 = a4.var1;
  double var0 = a4.var0;
  id v9 = a3;
  id v10 = a5;
  long long v11 = [(GEOPDPlaceRequest *)self _initWithTraits:v10 includeHistoricalLocations:1 supportedMapsResultTypes:0];
  id v12 = v11;
  if (v11)
  {
    [(GEOPDPlaceRequest *)v11 addRequestedComponentsForReason:0 traits:v10 count:1];
    id v13 = -[GEOPDPlaceRequestParameters initWithMapItemToRefine:coordinate:traits:]([GEOPDPlaceRequestParameters alloc], "initWithMapItemToRefine:coordinate:traits:", v9, v10, var0, var1);
    [(GEOPDPlaceRequest *)v12 setPlaceRequestParameters:v13];
    [(GEOPDPlaceRequest *)v12 setRequestType:7];
    uint64_t v14 = v12;
  }
  return v12;
}

- (void)setPlaceRequestParameters:(id)a3
{
  *(_WORD *)&self->_flags |= 0x8800u;
  objc_storeStrong((id *)&self->_placeRequestParameters, a3);
}

- (void)setRequestType:(int)a3
{
  *(_WORD *)&self->_flags |= 0x8001u;
  self->_requestType = a3;
}

- (double)localTimestamp
{
  v2 = [MEMORY[0x1E4F1C9A8] calendarWithIdentifier:*MEMORY[0x1E4F1C318]];
  id v3 = [MEMORY[0x1E4F1C9C8] date];
  id v4 = [v2 components:60 fromDate:v3];

  id v5 = [v2 dateFromComponents:v4];
  id v6 = [v2 components:28 fromDate:v5];
  id v7 = [v2 dateFromComponents:v6];
  [v5 timeIntervalSinceDate:v7];
  double v9 = v8;

  return v9;
}

- (void)writeTo:(id)a3
{
  uint64_t v54 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  if (self->_reader && (_GEOPDPlaceRequestIsDirty((uint64_t)self) & 1) == 0)
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
    [(GEOPDPlaceRequest *)self readAll:0];
    if (self->_analyticMetadata) {
      PBDataWriterWriteSubmessage();
    }
    if (self->_clientMetadata) {
      PBDataWriterWriteSubmessage();
    }
    long long v47 = 0u;
    long long v48 = 0u;
    long long v45 = 0u;
    long long v46 = 0u;
    id v6 = self->_displayLanguages;
    uint64_t v7 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v45 objects:v53 count:16];
    if (v7)
    {
      uint64_t v8 = *(void *)v46;
      do
      {
        uint64_t v9 = 0;
        do
        {
          if (*(void *)v46 != v8) {
            objc_enumerationMutation(v6);
          }
          PBDataWriterWriteStringField();
          ++v9;
        }
        while (v7 != v9);
        uint64_t v7 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v45 objects:v53 count:16];
      }
      while (v7);
    }

    long long v43 = 0u;
    long long v44 = 0u;
    long long v41 = 0u;
    long long v42 = 0u;
    id v10 = self->_spokenLanguages;
    uint64_t v11 = [(NSMutableArray *)v10 countByEnumeratingWithState:&v41 objects:v52 count:16];
    if (v11)
    {
      uint64_t v12 = *(void *)v42;
      do
      {
        uint64_t v13 = 0;
        do
        {
          if (*(void *)v42 != v12) {
            objc_enumerationMutation(v10);
          }
          PBDataWriterWriteStringField();
          ++v13;
        }
        while (v11 != v13);
        uint64_t v11 = [(NSMutableArray *)v10 countByEnumeratingWithState:&v41 objects:v52 count:16];
      }
      while (v11);
    }

    long long v39 = 0u;
    long long v40 = 0u;
    long long v37 = 0u;
    long long v38 = 0u;
    uint64_t v14 = self->_requestedComponents;
    uint64_t v15 = [(NSMutableArray *)v14 countByEnumeratingWithState:&v37 objects:v51 count:16];
    if (v15)
    {
      uint64_t v16 = *(void *)v38;
      do
      {
        uint64_t v17 = 0;
        do
        {
          if (*(void *)v38 != v16) {
            objc_enumerationMutation(v14);
          }
          PBDataWriterWriteSubmessage();
          ++v17;
        }
        while (v15 != v17);
        uint64_t v15 = [(NSMutableArray *)v14 countByEnumeratingWithState:&v37 objects:v51 count:16];
      }
      while (v15);
    }

    __int16 flags = (__int16)self->_flags;
    if ((flags & 4) != 0)
    {
      PBDataWriterWriteBOOLField();
      __int16 flags = (__int16)self->_flags;
    }
    if (flags) {
      PBDataWriterWriteInt32Field();
    }
    if (self->_placeRequestParameters) {
      PBDataWriterWriteSubmessage();
    }
    if (self->_displayRegion) {
      PBDataWriterWriteStringField();
    }
    long long v35 = 0u;
    long long v36 = 0u;
    long long v33 = 0u;
    long long v34 = 0u;
    v19 = self->_auxiliaryTierRequestedComponents;
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

    if (self->_privacyMetadata) {
      PBDataWriterWriteSubmessage();
    }
    long long v31 = 0u;
    long long v32 = 0u;
    long long v29 = 0u;
    long long v30 = 0u;
    uint64_t v23 = self->_partiallyComposedSearchResultRequestedComponents;
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

    if ((*(_WORD *)&self->_flags & 2) != 0) {
      PBDataWriterWriteBOOLField();
    }
    if (self->_handleData) {
      PBDataWriterWriteDataField();
    }
    -[PBUnknownFields writeTo:](self->_unknownFields, "writeTo:", v4, v29);
  }
}

- (void)readAll:(BOOL)a3
{
  BOOL v3 = a3;
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  reader = self->_reader;
  if (reader)
  {
    uint64_t v7 = reader;
    objc_sync_enter(v7);
    if (v3) {
      uint64_t v8 = (int *)&readAll__recursiveTag_5280;
    }
    else {
      uint64_t v8 = (int *)&readAll__nonRecursiveTag_5281;
    }
    GEOPDPlaceRequestReadSpecified((uint64_t)self, (unint64_t)self->_reader, v8);
    objc_sync_exit(v7);
  }
  if (v3) {
    _GEOPDPlaceRequestCallReadAllRecursiveWithoutSynchronized((uint64_t)self);
  }

  os_unfair_lock_unlock(p_readerLock);
}

- (unsigned)requestTypeCode
{
  return 60;
}

- (NSMutableArray)requestedComponents
{
  -[GEOPDPlaceRequest _readRequestedComponents]((uint64_t)self);
  requestedComponents = self->_requestedComponents;

  return requestedComponents;
}

- (Class)responseClass
{
  return (Class)objc_opt_class();
}

+ (id)publisherComponentInfoForReason:(unint64_t)a3 count:(unsigned int)a4 traits:(id)a5
{
  id v6 = [[GEOPDComponentInfo alloc] initWithType:71 count:*(void *)&a4];
  uint64_t v7 = objc_alloc_init(GEOPDComponentFilter);
  uint64_t v8 = objc_alloc_init(GEOPDPublisherFilter);
  uint64_t v9 = v8;
  char v10 = a3 - 2;
  if (a3 - 2 <= 0x1D && ((0x20001801u >> v10) & 1) != 0 && v8)
  {
    *(unsigned char *)&v8->_flags |= 1u;
    v8->_partiallyClientize = (0x3FFFF7FFu >> v10) & 1;
  }
  -[GEOPDComponentFilter setPublisherFilter:]((uint64_t)v7, v8);
  -[GEOPDComponentInfo setFilter:]((uint64_t)v6, v7);

  return v6;
}

- (BOOL)shouldConsiderCaching
{
  if ([(GEOPDPlaceRequest *)self isForwardGeocoderRequest]
    || [(GEOPDPlaceRequest *)self isCanonicalLocationSearchRequest]
    || [(GEOPDPlaceRequest *)self isMerchantRequest]
    || [(GEOPDPlaceRequest *)self isPlaceRefinementRequest])
  {
    return 1;
  }

  return [(GEOPDPlaceRequest *)self isBrandLookupRequest];
}

- (BOOL)isPlaceRefinementRequest
{
  if ([(GEOPDPlaceRequest *)self requestType] != 7
    || ![(GEOPDPlaceRequest *)self hasPlaceRequestParameters])
  {
    return 0;
  }
  uint64_t v3 = [(GEOPDPlaceRequest *)self placeRequestParameters];
  id v4 = (void *)v3;
  if (v3)
  {
    -[GEOPDPlaceRequestParameters _readPlaceRefinementParameters](v3);
    BOOL v5 = v4[37] != 0;
  }
  else
  {
    BOOL v5 = 0;
  }

  return v5;
}

- (BOOL)isMerchantRequest
{
  if ([(GEOPDPlaceRequest *)self requestType] != 6
    || ![(GEOPDPlaceRequest *)self hasPlaceRequestParameters])
  {
    return 0;
  }
  uint64_t v3 = [(GEOPDPlaceRequest *)self placeRequestParameters];
  id v4 = (void *)v3;
  if (v3)
  {
    -[GEOPDPlaceRequestParameters _readMerchantLookupParameters](v3);
    BOOL v5 = v4[31] != 0;
  }
  else
  {
    BOOL v5 = 0;
  }

  return v5;
}

- (BOOL)isForwardGeocoderRequest
{
  if ([(GEOPDPlaceRequest *)self requestType] != 2
    || ![(GEOPDPlaceRequest *)self hasPlaceRequestParameters])
  {
    return 0;
  }
  uint64_t v3 = [(GEOPDPlaceRequest *)self placeRequestParameters];
  id v4 = (void *)v3;
  if (v3)
  {
    -[GEOPDPlaceRequestParameters _readGeocodingParameters](v3);
    BOOL v5 = v4[23] != 0;
  }
  else
  {
    BOOL v5 = 0;
  }

  return v5;
}

- (BOOL)isCanonicalLocationSearchRequest
{
  if ([(GEOPDPlaceRequest *)self requestType] != 3
    || ![(GEOPDPlaceRequest *)self hasPlaceRequestParameters])
  {
    return 0;
  }
  uint64_t v3 = [(GEOPDPlaceRequest *)self placeRequestParameters];
  id v4 = (void *)v3;
  if (v3)
  {
    -[GEOPDPlaceRequestParameters _readCanonicalLocationSearchParameters](v3);
    BOOL v5 = v4[16] != 0;
  }
  else
  {
    BOOL v5 = 0;
  }

  return v5;
}

- (NSData)handleData
{
  -[GEOPDPlaceRequest _readHandleData]((uint64_t)self);
  handleData = self->_handleData;

  return handleData;
}

- (void)_readHandleData
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 120));
    if ((*(_WORD *)(a1 + 132) & 0x200) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOPDPlaceRequestReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readHandleData_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 120));
  }
}

+ (id)collectionComponentInfoForReason:(unint64_t)a3 count:(unsigned int)a4 traits:(id)a5
{
  id v6 = [[GEOPDComponentInfo alloc] initWithType:65 count:*(void *)&a4];
  uint64_t v7 = objc_alloc_init(GEOPDComponentFilter);
  uint64_t v8 = objc_alloc_init(GEOPDPlaceCollectionFilter);
  uint64_t v9 = v8;
  switch(a3)
  {
    case 0uLL:
      if (v8)
      {
        char v10 = 0;
        uint64_t v11 = &OBJC_IVAR___GEOPDPlaceCollectionFilter__partiallyClientize;
        char v12 = 64;
        char v13 = 1;
        char v14 = 2;
        uint64_t v15 = &OBJC_IVAR___GEOPDPlaceCollectionFilter__enableCollectionItemDescription;
        goto LABEL_17;
      }
      break;
    case 1uLL:
    case 4uLL:
    case 5uLL:
    case 6uLL:
    case 7uLL:
    case 8uLL:
    case 9uLL:
    case 0xAuLL:
    case 0xBuLL:
    case 0xCuLL:
    case 0x13uLL:
    case 0x14uLL:
    case 0x15uLL:
    case 0x17uLL:
      break;
    case 2uLL:
    case 0xDuLL:
    case 0xEuLL:
    case 0x11uLL:
    case 0x12uLL:
    case 0x16uLL:
    case 0x18uLL:
      if (v8)
      {
        char v10 = 1;
        uint64_t v11 = &OBJC_IVAR___GEOPDPlaceCollectionFilter__partiallyClientize;
        char v12 = 64;
        goto LABEL_18;
      }
      break;
    case 3uLL:
      if (v8)
      {
        char v13 = 0;
        uint64_t v15 = &OBJC_IVAR___GEOPDPlaceCollectionFilter__partiallyClientize;
        char v14 = 64;
        char v16 = 1;
        char v17 = 2;
        uint64_t v18 = &OBJC_IVAR___GEOPDPlaceCollectionFilter__enableCollectionItemDescription;
        goto LABEL_13;
      }
      break;
    case 0xFuLL:
      if (v8)
      {
        char v16 = 0;
        char v13 = 1;
        uint64_t v15 = &OBJC_IVAR___GEOPDPlaceCollectionFilter__isCollectionView;
        char v14 = 16;
        char v17 = 64;
        uint64_t v18 = &OBJC_IVAR___GEOPDPlaceCollectionFilter__partiallyClientize;
LABEL_13:
        *(unsigned char *)&v8->_flags |= v17;
        *((unsigned char *)&v8->super.super.isa + *v18) = v16;
        char v10 = 1;
        uint64_t v11 = &OBJC_IVAR___GEOPDPlaceCollectionFilter__enableMediaLink;
        char v12 = 4;
        goto LABEL_17;
      }
      break;
    case 0x10uLL:
      if (v8)
      {
        uint64_t v11 = &OBJC_IVAR___GEOPDPlaceCollectionFilter__isCollectionView;
        char v12 = 16;
        char v13 = 1;
        char v14 = 64;
        char v10 = 1;
        goto LABEL_16;
      }
      break;
    default:
      if (a3 == 31 && v8)
      {
        char v13 = 0;
        char v10 = 0;
        uint64_t v11 = &OBJC_IVAR___GEOPDPlaceCollectionFilter__isCollectionView;
        char v12 = 16;
        char v14 = 64;
LABEL_16:
        uint64_t v15 = &OBJC_IVAR___GEOPDPlaceCollectionFilter__partiallyClientize;
LABEL_17:
        *(unsigned char *)&v8->_flags |= v14;
        *((unsigned char *)&v8->super.super.isa + *v15) = v13;
LABEL_18:
        *(unsigned char *)&v8->_flags |= v12;
        *((unsigned char *)&v8->super.super.isa + *v11) = v10;
      }
      break;
  }
  -[GEOPDComponentFilter setPlaceCollectionFilter:]((uint64_t)v7, v8);
  -[GEOPDComponentInfo setFilter:]((uint64_t)v6, v7);

  return v6;
}

- (BOOL)isBrandLookupRequest
{
  if ([(GEOPDPlaceRequest *)self requestType] != 30
    || ![(GEOPDPlaceRequest *)self hasPlaceRequestParameters])
  {
    return 0;
  }
  uint64_t v3 = [(GEOPDPlaceRequest *)self placeRequestParameters];
  id v4 = (void *)v3;
  if (v3)
  {
    -[GEOPDPlaceRequestParameters _readBrandLookupParameters](v3);
    BOOL v5 = v4[14] != 0;
  }
  else
  {
    BOOL v5 = 0;
  }

  return v5;
}

- (id)initForSearchFieldPlaceholderWithTraits:(id)a3
{
  id v4 = a3;
  id v5 = [(GEOPDPlaceRequest *)self _initWithTraits:v4 includeHistoricalLocations:1 supportedMapsResultTypes:0];
  id v6 = v5;
  if (v5)
  {
    [v5 addRequestedComponentsForReason:1 traits:v4 count:0];
    [v6 setRequestType:15];
    uint64_t v7 = objc_alloc_init(GEOPDSearchFieldPlaceholderParameters);
    uint64_t v8 = v7;
    if (v7)
    {
      *(unsigned char *)&v7->_flags |= 1u;
      v7->_version = 1;
    }
    uint64_t v9 = objc_alloc_init(GEOPDPlaceRequestParameters);
    -[GEOPDPlaceRequestParameters setSearchFieldPlaceholderParameters:]((uint64_t)v9, v8);
    [v6 setPlaceRequestParameters:v9];
    id v10 = v6;
  }
  return v6;
}

- (id)initForDatasetCheckWithTraits:(id)a3
{
  id v4 = a3;
  id v5 = [(GEOPDPlaceRequest *)self _initWithTraits:v4 includeHistoricalLocations:1 supportedMapsResultTypes:0];
  id v6 = v5;
  if (v5)
  {
    [v5 addRequestedComponentsForReason:1 traits:v4 count:0];
    [v6 setRequestType:24];
    id v7 = v6;
  }

  return v6;
}

- (id)cacheKey
{
  int v3 = [(GEOPDPlaceRequest *)self requestType];
  id v4 = 0;
  if (v3 > 6)
  {
    if (v3 == 7)
    {
      id v5 = [(GEOPDPlaceRequest *)self placeRequestParameters];
      id v6 = -[GEOPDPlaceRequestParameters placeRefinementParameters](v5);
      unsigned int v7 = 5;
    }
    else
    {
      if (v3 != 30) {
        goto LABEL_13;
      }
      id v5 = [(GEOPDPlaceRequest *)self placeRequestParameters];
      id v6 = -[GEOPDPlaceRequestParameters brandLookupParameters](v5);
      unsigned int v7 = 4;
    }
  }
  else if (v3 == 2)
  {
    id v5 = [(GEOPDPlaceRequest *)self placeRequestParameters];
    id v6 = -[GEOPDPlaceRequestParameters geocodingParameters](v5);
    unsigned int v7 = 1;
  }
  else
  {
    if (v3 != 3) {
      goto LABEL_13;
    }
    id v5 = [(GEOPDPlaceRequest *)self placeRequestParameters];
    id v6 = -[GEOPDPlaceRequestParameters canonicalLocationSearchParameters](v5);
    unsigned int v7 = 2;
  }
  uint64_t v8 = [v6 data];

  if (v8)
  {
    uint64_t v9 = [(GEOPDPlaceRequest *)self displayLanguages];
    id v10 = [v9 componentsJoinedByString:&stru_1ED51F370];

    uint64_t v11 = [v10 dataUsingEncoding:4];
    char v12 = (void *)[v8 mutableCopy];
    [v12 appendData:v11];
    unint64_t v15 = 0;
    uint64_t v16 = 0;
    id v13 = v12;
    _GEOMurmurHash3_128_realign((const void *)[v13 bytes], objc_msgSend(v13, "length"), v7, &v15);
    id v4 = objc_msgSend(NSString, "stringWithFormat:", @"%llx%llx", v15, v16);
  }
  else
  {
    id v4 = 0;
  }
LABEL_13:

  return v4;
}

- (GEOPDPlaceRequest)init
{
  v6.receiver = self;
  v6.super_class = (Class)GEOPDPlaceRequest;
  v2 = [(GEOPDPlaceRequest *)&v6 init];
  int v3 = v2;
  if (v2)
  {
    v2->_readerLock._os_unfair_lock_opaque = 0;
    id v4 = v2;
  }

  return v3;
}

- (BOOL)hasAnalyticMetadata
{
  return self->_analyticMetadata != 0;
}

- (void)_readDisplayLanguages
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 120));
    if ((*(_WORD *)(a1 + 132) & 0x80) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOPDPlaceRequestReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readDisplayLanguages_tags_0);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 120));
  }
}

- (NSMutableArray)displayLanguages
{
  -[GEOPDPlaceRequest _readDisplayLanguages]((uint64_t)self);
  displayLanguages = self->_displayLanguages;

  return displayLanguages;
}

- (void)clearDisplayLanguages
{
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(_WORD *)&self->_flags |= 0x80u;
  os_unfair_lock_unlock(p_readerLock);
  *(_WORD *)&self->_flags |= 0x8000u;
  displayLanguages = self->_displayLanguages;

  [(NSMutableArray *)displayLanguages removeAllObjects];
}

- (void)addDisplayLanguage:(id)a3
{
  id v4 = a3;
  -[GEOPDPlaceRequest _readDisplayLanguages]((uint64_t)self);
  -[GEOPDPlaceRequest _addNoFlagsDisplayLanguage:]((uint64_t)self, v4);

  os_unfair_lock_lock_with_options();
  *(_WORD *)&self->_flags |= 0x80u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(_WORD *)&self->_flags |= 0x8000u;
}

- (unint64_t)displayLanguagesCount
{
  -[GEOPDPlaceRequest _readDisplayLanguages]((uint64_t)self);
  displayLanguages = self->_displayLanguages;

  return [(NSMutableArray *)displayLanguages count];
}

- (id)displayLanguageAtIndex:(unint64_t)a3
{
  -[GEOPDPlaceRequest _readDisplayLanguages]((uint64_t)self);
  displayLanguages = self->_displayLanguages;

  return (id)[(NSMutableArray *)displayLanguages objectAtIndex:a3];
}

+ (Class)displayLanguageType
{
  return (Class)objc_opt_class();
}

- (NSMutableArray)spokenLanguages
{
  -[GEOPDPlaceRequest _readSpokenLanguages]((uint64_t)self);
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
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(_WORD *)&self->_flags |= 0x4000u;
  os_unfair_lock_unlock(p_readerLock);
  *(_WORD *)&self->_flags |= 0x8000u;
  spokenLanguages = self->_spokenLanguages;

  [(NSMutableArray *)spokenLanguages removeAllObjects];
}

- (unint64_t)spokenLanguagesCount
{
  -[GEOPDPlaceRequest _readSpokenLanguages]((uint64_t)self);
  spokenLanguages = self->_spokenLanguages;

  return [(NSMutableArray *)spokenLanguages count];
}

- (id)spokenLanguageAtIndex:(unint64_t)a3
{
  -[GEOPDPlaceRequest _readSpokenLanguages]((uint64_t)self);
  spokenLanguages = self->_spokenLanguages;

  return (id)[(NSMutableArray *)spokenLanguages objectAtIndex:a3];
}

+ (Class)spokenLanguageType
{
  return (Class)objc_opt_class();
}

- (void)setRequestedComponents:(id)a3
{
  id v4 = (NSMutableArray *)a3;
  os_unfair_lock_lock_with_options();
  *(_WORD *)&self->_flags |= 0x2000u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(_WORD *)&self->_flags |= 0x8000u;
  requestedComponents = self->_requestedComponents;
  self->_requestedComponents = v4;
}

- (void)clearRequestedComponents
{
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(_WORD *)&self->_flags |= 0x2000u;
  os_unfair_lock_unlock(p_readerLock);
  *(_WORD *)&self->_flags |= 0x8000u;
  requestedComponents = self->_requestedComponents;

  [(NSMutableArray *)requestedComponents removeAllObjects];
}

- (unint64_t)requestedComponentsCount
{
  -[GEOPDPlaceRequest _readRequestedComponents]((uint64_t)self);
  requestedComponents = self->_requestedComponents;

  return [(NSMutableArray *)requestedComponents count];
}

- (id)requestedComponentAtIndex:(unint64_t)a3
{
  -[GEOPDPlaceRequest _readRequestedComponents]((uint64_t)self);
  requestedComponents = self->_requestedComponents;

  return (id)[(NSMutableArray *)requestedComponents objectAtIndex:a3];
}

+ (Class)requestedComponentType
{
  return (Class)objc_opt_class();
}

- (BOOL)suppressResultsRequiringAttribution
{
  return self->_suppressResultsRequiringAttribution;
}

- (void)setSuppressResultsRequiringAttribution:(BOOL)a3
{
  *(_WORD *)&self->_flags |= 0x8004u;
  self->_suppressResultsRequiringAttribution = a3;
}

- (void)setHasSuppressResultsRequiringAttribution:(BOOL)a3
{
  if (a3) {
    __int16 v3 = -32764;
  }
  else {
    __int16 v3 = 0x8000;
  }
  *(_WORD *)&self->___int16 flags = *(_WORD *)&self->_flags & 0xFFFB | v3;
}

- (BOOL)hasSuppressResultsRequiringAttribution
{
  return (*(_WORD *)&self->_flags >> 2) & 1;
}

- (void)setHasRequestType:(BOOL)a3
{
  *(_WORD *)&self->___int16 flags = *(_WORD *)&self->_flags & 0x7FFE | a3 | 0x8000;
}

- (BOOL)hasRequestType
{
  return *(_WORD *)&self->_flags & 1;
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

- (void)_readDisplayRegion
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 120));
    if ((*(_WORD *)(a1 + 132) & 0x100) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOPDPlaceRequestReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readDisplayRegion_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 120));
  }
}

- (BOOL)hasDisplayRegion
{
  return self->_displayRegion != 0;
}

- (NSString)displayRegion
{
  -[GEOPDPlaceRequest _readDisplayRegion]((uint64_t)self);
  displayRegion = self->_displayRegion;

  return displayRegion;
}

- (void)_readAuxiliaryTierRequestedComponents
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 120));
    if ((*(_WORD *)(a1 + 132) & 0x20) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOPDPlaceRequestReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readAuxiliaryTierRequestedComponents_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 120));
  }
}

- (NSMutableArray)auxiliaryTierRequestedComponents
{
  -[GEOPDPlaceRequest _readAuxiliaryTierRequestedComponents]((uint64_t)self);
  auxiliaryTierRequestedComponents = self->_auxiliaryTierRequestedComponents;

  return auxiliaryTierRequestedComponents;
}

- (void)setAuxiliaryTierRequestedComponents:(id)a3
{
  int v4 = (NSMutableArray *)a3;
  os_unfair_lock_lock_with_options();
  *(_WORD *)&self->_flags |= 0x20u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(_WORD *)&self->_flags |= 0x8000u;
  auxiliaryTierRequestedComponents = self->_auxiliaryTierRequestedComponents;
  self->_auxiliaryTierRequestedComponents = v4;
}

- (void)clearAuxiliaryTierRequestedComponents
{
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(_WORD *)&self->_flags |= 0x20u;
  os_unfair_lock_unlock(p_readerLock);
  *(_WORD *)&self->_flags |= 0x8000u;
  auxiliaryTierRequestedComponents = self->_auxiliaryTierRequestedComponents;

  [(NSMutableArray *)auxiliaryTierRequestedComponents removeAllObjects];
}

- (void)addAuxiliaryTierRequestedComponent:(id)a3
{
  id v4 = a3;
  -[GEOPDPlaceRequest _readAuxiliaryTierRequestedComponents]((uint64_t)self);
  -[GEOPDPlaceRequest _addNoFlagsAuxiliaryTierRequestedComponent:]((uint64_t)self, v4);

  os_unfair_lock_lock_with_options();
  *(_WORD *)&self->_flags |= 0x20u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(_WORD *)&self->_flags |= 0x8000u;
}

- (void)_addNoFlagsAuxiliaryTierRequestedComponent:(uint64_t)a1
{
  id v3 = a2;
  if (a1)
  {
    id v4 = *(void **)(a1 + 32);
    id v7 = v3;
    if (!v4)
    {
      id v5 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
      objc_super v6 = *(void **)(a1 + 32);
      *(void *)(a1 + 32) = v5;

      id v4 = *(void **)(a1 + 32);
    }
    [v4 addObject:v7];
    id v3 = v7;
  }
}

- (unint64_t)auxiliaryTierRequestedComponentsCount
{
  -[GEOPDPlaceRequest _readAuxiliaryTierRequestedComponents]((uint64_t)self);
  auxiliaryTierRequestedComponents = self->_auxiliaryTierRequestedComponents;

  return [(NSMutableArray *)auxiliaryTierRequestedComponents count];
}

- (id)auxiliaryTierRequestedComponentAtIndex:(unint64_t)a3
{
  -[GEOPDPlaceRequest _readAuxiliaryTierRequestedComponents]((uint64_t)self);
  auxiliaryTierRequestedComponents = self->_auxiliaryTierRequestedComponents;

  return (id)[(NSMutableArray *)auxiliaryTierRequestedComponents objectAtIndex:a3];
}

+ (Class)auxiliaryTierRequestedComponentType
{
  return (Class)objc_opt_class();
}

- (void)_readPrivacyMetadata
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 120));
    if ((*(_WORD *)(a1 + 132) & 0x1000) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOPDPlaceRequestReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readPrivacyMetadata_tags_0);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 120));
  }
}

- (BOOL)hasPrivacyMetadata
{
  return self->_privacyMetadata != 0;
}

- (GEOPrivacyMetadata)privacyMetadata
{
  -[GEOPDPlaceRequest _readPrivacyMetadata]((uint64_t)self);
  privacyMetadata = self->_privacyMetadata;

  return privacyMetadata;
}

- (void)setPrivacyMetadata:(id)a3
{
  *(_WORD *)&self->_flags |= 0x9000u;
  objc_storeStrong((id *)&self->_privacyMetadata, a3);
}

- (void)_readPartiallyComposedSearchResultRequestedComponents
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 120));
    if ((*(_WORD *)(a1 + 132) & 0x400) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOPDPlaceRequestReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readPartiallyComposedSearchResultRequestedComponents_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 120));
  }
}

- (NSMutableArray)partiallyComposedSearchResultRequestedComponents
{
  -[GEOPDPlaceRequest _readPartiallyComposedSearchResultRequestedComponents]((uint64_t)self);
  partiallyComposedSearchResultRequestedComponents = self->_partiallyComposedSearchResultRequestedComponents;

  return partiallyComposedSearchResultRequestedComponents;
}

- (void)setPartiallyComposedSearchResultRequestedComponents:(id)a3
{
  id v4 = (NSMutableArray *)a3;
  os_unfair_lock_lock_with_options();
  *(_WORD *)&self->_flags |= 0x400u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(_WORD *)&self->_flags |= 0x8000u;
  partiallyComposedSearchResultRequestedComponents = self->_partiallyComposedSearchResultRequestedComponents;
  self->_partiallyComposedSearchResultRequestedComponents = v4;
}

- (void)clearPartiallyComposedSearchResultRequestedComponents
{
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(_WORD *)&self->_flags |= 0x400u;
  os_unfair_lock_unlock(p_readerLock);
  *(_WORD *)&self->_flags |= 0x8000u;
  partiallyComposedSearchResultRequestedComponents = self->_partiallyComposedSearchResultRequestedComponents;

  [(NSMutableArray *)partiallyComposedSearchResultRequestedComponents removeAllObjects];
}

- (void)addPartiallyComposedSearchResultRequestedComponent:(id)a3
{
  id v4 = a3;
  -[GEOPDPlaceRequest _readPartiallyComposedSearchResultRequestedComponents]((uint64_t)self);
  -[GEOPDPlaceRequest _addNoFlagsPartiallyComposedSearchResultRequestedComponent:]((uint64_t)self, v4);

  os_unfair_lock_lock_with_options();
  *(_WORD *)&self->_flags |= 0x400u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(_WORD *)&self->_flags |= 0x8000u;
}

- (void)_addNoFlagsPartiallyComposedSearchResultRequestedComponent:(uint64_t)a1
{
  id v3 = a2;
  if (a1)
  {
    id v4 = *(void **)(a1 + 72);
    id v7 = v3;
    if (!v4)
    {
      id v5 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
      objc_super v6 = *(void **)(a1 + 72);
      *(void *)(a1 + 72) = v5;

      id v4 = *(void **)(a1 + 72);
    }
    [v4 addObject:v7];
    id v3 = v7;
  }
}

- (unint64_t)partiallyComposedSearchResultRequestedComponentsCount
{
  -[GEOPDPlaceRequest _readPartiallyComposedSearchResultRequestedComponents]((uint64_t)self);
  partiallyComposedSearchResultRequestedComponents = self->_partiallyComposedSearchResultRequestedComponents;

  return [(NSMutableArray *)partiallyComposedSearchResultRequestedComponents count];
}

- (id)partiallyComposedSearchResultRequestedComponentAtIndex:(unint64_t)a3
{
  -[GEOPDPlaceRequest _readPartiallyComposedSearchResultRequestedComponents]((uint64_t)self);
  partiallyComposedSearchResultRequestedComponents = self->_partiallyComposedSearchResultRequestedComponents;

  return (id)[(NSMutableArray *)partiallyComposedSearchResultRequestedComponents objectAtIndex:a3];
}

+ (Class)partiallyComposedSearchResultRequestedComponentType
{
  return (Class)objc_opt_class();
}

- (id)description
{
  id v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)GEOPDPlaceRequest;
  id v4 = [(GEOPDPlaceRequest *)&v8 description];
  id v5 = [(GEOPDPlaceRequest *)self dictionaryRepresentation];
  objc_super v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEOPDPlaceRequest _dictionaryRepresentation:]((uint64_t)self, 0);
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  uint64_t v89 = *MEMORY[0x1E4F143B8];
  if (a1)
  {
    [(id)a1 readAll:1];
    id v4 = [MEMORY[0x1E4F1CA60] dictionary];
    id v5 = [(id)a1 analyticMetadata];
    objc_super v6 = v5;
    if (v5)
    {
      if (a2)
      {
        id v7 = [v5 jsonRepresentation];
        objc_super v8 = @"analyticMetadata";
      }
      else
      {
        id v7 = [v5 dictionaryRepresentation];
        objc_super v8 = @"analytic_metadata";
      }
      [v4 setObject:v7 forKey:v8];
    }
    uint64_t v9 = [(id)a1 clientMetadata];
    id v10 = v9;
    if (v9)
    {
      if (a2)
      {
        uint64_t v11 = [v9 jsonRepresentation];
        char v12 = @"clientMetadata";
      }
      else
      {
        uint64_t v11 = [v9 dictionaryRepresentation];
        char v12 = @"client_metadata";
      }
      [v4 setObject:v11 forKey:v12];
    }
    if (*(void *)(a1 + 48))
    {
      id v13 = [(id)a1 displayLanguages];
      if (a2) {
        char v14 = @"displayLanguage";
      }
      else {
        char v14 = @"display_language";
      }
      [v4 setObject:v13 forKey:v14];
    }
    if (*(void *)(a1 + 104))
    {
      unint64_t v15 = [(id)a1 spokenLanguages];
      if (a2) {
        uint64_t v16 = @"spokenLanguage";
      }
      else {
        uint64_t v16 = @"spoken_language";
      }
      [v4 setObject:v15 forKey:v16];
    }
    if ([*(id *)(a1 + 96) count])
    {
      char v17 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(*(id *)(a1 + 96), "count"));
      long long v82 = 0u;
      long long v83 = 0u;
      long long v84 = 0u;
      long long v85 = 0u;
      id v18 = *(id *)(a1 + 96);
      uint64_t v19 = [v18 countByEnumeratingWithState:&v82 objects:v88 count:16];
      if (v19)
      {
        uint64_t v20 = v19;
        uint64_t v21 = *(void *)v83;
        do
        {
          for (uint64_t i = 0; i != v20; ++i)
          {
            if (*(void *)v83 != v21) {
              objc_enumerationMutation(v18);
            }
            uint64_t v23 = *(void **)(*((void *)&v82 + 1) + 8 * i);
            if (a2) {
              [v23 jsonRepresentation];
            }
            else {
            uint64_t v24 = [v23 dictionaryRepresentation];
            }
            [v17 addObject:v24];
          }
          uint64_t v20 = [v18 countByEnumeratingWithState:&v82 objects:v88 count:16];
        }
        while (v20);
      }

      if (a2) {
        uint64_t v25 = @"requestedComponent";
      }
      else {
        uint64_t v25 = @"requested_component";
      }
      [v4 setObject:v17 forKey:v25];
    }
    __int16 v26 = *(_WORD *)(a1 + 132);
    if ((v26 & 4) != 0)
    {
      v27 = [NSNumber numberWithBool:*(unsigned __int8 *)(a1 + 129)];
      if (a2) {
        v28 = @"suppressResultsRequiringAttribution";
      }
      else {
        v28 = @"suppress_results_requiring_attribution";
      }
      [v4 setObject:v27 forKey:v28];

      __int16 v26 = *(_WORD *)(a1 + 132);
    }
    if (v26)
    {
      uint64_t v29 = *(int *)(a1 + 124);
      if (v29 >= 0x3F)
      {
        objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(int *)(a1 + 124));
        long long v30 = (__CFString *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        long long v30 = off_1E53DCC68[v29];
      }
      if (a2) {
        long long v31 = @"requestType";
      }
      else {
        long long v31 = @"request_type";
      }
      [v4 setObject:v30 forKey:v31];
    }
    long long v32 = [(id)a1 placeRequestParameters];
    long long v33 = v32;
    if (v32)
    {
      if (a2)
      {
        long long v34 = [v32 jsonRepresentation];
        long long v35 = @"placeRequestParameters";
      }
      else
      {
        long long v34 = [v32 dictionaryRepresentation];
        long long v35 = @"place_request_parameters";
      }
      [v4 setObject:v34 forKey:v35];
    }
    long long v36 = [(id)a1 displayRegion];
    if (v36)
    {
      if (a2) {
        long long v37 = @"displayRegion";
      }
      else {
        long long v37 = @"display_region";
      }
      [v4 setObject:v36 forKey:v37];
    }

    if ([*(id *)(a1 + 32) count])
    {
      long long v38 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(*(id *)(a1 + 32), "count"));
      long long v78 = 0u;
      long long v79 = 0u;
      long long v80 = 0u;
      long long v81 = 0u;
      id v39 = *(id *)(a1 + 32);
      uint64_t v40 = [v39 countByEnumeratingWithState:&v78 objects:v87 count:16];
      if (v40)
      {
        uint64_t v41 = v40;
        uint64_t v42 = *(void *)v79;
        do
        {
          for (uint64_t j = 0; j != v41; ++j)
          {
            if (*(void *)v79 != v42) {
              objc_enumerationMutation(v39);
            }
            long long v44 = *(void **)(*((void *)&v78 + 1) + 8 * j);
            if (a2) {
              [v44 jsonRepresentation];
            }
            else {
            long long v45 = [v44 dictionaryRepresentation];
            }
            [v38 addObject:v45];
          }
          uint64_t v41 = [v39 countByEnumeratingWithState:&v78 objects:v87 count:16];
        }
        while (v41);
      }

      if (a2) {
        long long v46 = @"auxiliaryTierRequestedComponent";
      }
      else {
        long long v46 = @"auxiliary_tier_requested_component";
      }
      [v4 setObject:v38 forKey:v46];
    }
    long long v47 = [(id)a1 privacyMetadata];
    long long v48 = v47;
    if (v47)
    {
      if (a2)
      {
        v49 = [v47 jsonRepresentation];
        v50 = @"privacyMetadata";
      }
      else
      {
        v49 = [v47 dictionaryRepresentation];
        v50 = @"privacy_metadata";
      }
      [v4 setObject:v49 forKey:v50];
    }
    if ([*(id *)(a1 + 72) count])
    {
      v51 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(*(id *)(a1 + 72), "count"));
      long long v74 = 0u;
      long long v75 = 0u;
      long long v76 = 0u;
      long long v77 = 0u;
      id v52 = *(id *)(a1 + 72);
      uint64_t v53 = [v52 countByEnumeratingWithState:&v74 objects:v86 count:16];
      if (v53)
      {
        uint64_t v54 = v53;
        uint64_t v55 = *(void *)v75;
        do
        {
          for (uint64_t k = 0; k != v54; ++k)
          {
            if (*(void *)v75 != v55) {
              objc_enumerationMutation(v52);
            }
            v57 = *(void **)(*((void *)&v74 + 1) + 8 * k);
            if (a2) {
              [v57 jsonRepresentation];
            }
            else {
            v58 = [v57 dictionaryRepresentation];
            }
            [v51 addObject:v58];
          }
          uint64_t v54 = [v52 countByEnumeratingWithState:&v74 objects:v86 count:16];
        }
        while (v54);
      }

      if (a2) {
        v59 = @"partiallyComposedSearchResultRequestedComponent";
      }
      else {
        v59 = @"partially_composed_search_result_requested_component";
      }
      [v4 setObject:v51 forKey:v59];
    }
    if ((*(_WORD *)(a1 + 132) & 2) != 0)
    {
      v60 = [NSNumber numberWithBool:*(unsigned __int8 *)(a1 + 128)];
      if (a2) {
        v61 = @"needLatency";
      }
      else {
        v61 = @"need_latency";
      }
      [v4 setObject:v60 forKey:v61];
    }
    v62 = [(id)a1 handleData];
    int v63 = v62;
    if (v62)
    {
      if (a2)
      {
        v64 = [v62 base64EncodedStringWithOptions:0];
        [v4 setObject:v64 forKey:@"handleData"];
      }
      else
      {
        [v4 setObject:v62 forKey:@"handle_data"];
      }
    }

    v65 = *(void **)(a1 + 16);
    if (v65)
    {
      v66 = [v65 dictionaryRepresentation];
      v67 = v66;
      if (a2)
      {
        v68 = objc_msgSend(MEMORY[0x1E4F1CA60], "dictionaryWithCapacity:", objc_msgSend(v66, "count"));
        v72[0] = MEMORY[0x1E4F143A8];
        v72[1] = 3221225472;
        v72[2] = __47__GEOPDPlaceRequest__dictionaryRepresentation___block_invoke;
        v72[3] = &unk_1E53D8860;
        id v69 = v68;
        id v73 = v69;
        [v67 enumerateKeysAndObjectsUsingBlock:v72];
        id v70 = v69;

        v67 = v70;
      }
      [v4 setObject:v67 forKey:@"Unknown Fields"];
    }
  }
  else
  {
    id v4 = 0;
  }

  return v4;
}

- (id)jsonRepresentation
{
  return -[GEOPDPlaceRequest _dictionaryRepresentation:]((uint64_t)self, 1);
}

void __47__GEOPDPlaceRequest__dictionaryRepresentation___block_invoke(uint64_t a1, void *a2, void *a3)
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

- (GEOPDPlaceRequest)initWithDictionary:(id)a3
{
  return (GEOPDPlaceRequest *)-[GEOPDPlaceRequest _initWithDictionary:isJSON:](self, a3, 0);
}

- (void)_initWithDictionary:(uint64_t)a3 isJSON:
{
  uint64_t v120 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  if (!a1) {
    goto LABEL_273;
  }
  a1 = (void *)[a1 init];
  if (!a1) {
    goto LABEL_273;
  }
  if (a3) {
    objc_super v6 = @"analyticMetadata";
  }
  else {
    objc_super v6 = @"analytic_metadata";
  }
  id v7 = [v5 objectForKeyedSubscript:v6];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    objc_super v8 = [GEOPDAnalyticMetadata alloc];
    if (a3) {
      uint64_t v9 = [(GEOPDAnalyticMetadata *)v8 initWithJSON:v7];
    }
    else {
      uint64_t v9 = [(GEOPDAnalyticMetadata *)v8 initWithDictionary:v7];
    }
    id v10 = (void *)v9;
    [a1 setAnalyticMetadata:v9];
  }
  if (a3) {
    uint64_t v11 = @"clientMetadata";
  }
  else {
    uint64_t v11 = @"client_metadata";
  }
  char v12 = [v5 objectForKeyedSubscript:v11];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v13 = [GEOPDClientMetadata alloc];
    if (a3) {
      uint64_t v14 = [(GEOPDClientMetadata *)v13 initWithJSON:v12];
    }
    else {
      uint64_t v14 = [(GEOPDClientMetadata *)v13 initWithDictionary:v12];
    }
    unint64_t v15 = (void *)v14;
    [a1 setClientMetadata:v14];
  }
  if (a3) {
    uint64_t v16 = @"displayLanguage";
  }
  else {
    uint64_t v16 = @"display_language";
  }
  char v17 = [v5 objectForKeyedSubscript:v16];
  objc_opt_class();
  id v94 = v5;
  if (objc_opt_isKindOfClass())
  {
    long long v113 = 0u;
    long long v114 = 0u;
    long long v111 = 0u;
    long long v112 = 0u;
    id v18 = v17;
    uint64_t v19 = [v18 countByEnumeratingWithState:&v111 objects:v119 count:16];
    if (v19)
    {
      uint64_t v20 = v19;
      uint64_t v21 = *(void *)v112;
      do
      {
        for (uint64_t i = 0; i != v20; ++i)
        {
          if (*(void *)v112 != v21) {
            objc_enumerationMutation(v18);
          }
          uint64_t v23 = *(void **)(*((void *)&v111 + 1) + 8 * i);
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            uint64_t v24 = (void *)[v23 copy];
            [a1 addDisplayLanguage:v24];
          }
        }
        uint64_t v20 = [v18 countByEnumeratingWithState:&v111 objects:v119 count:16];
      }
      while (v20);
    }

    id v5 = v94;
  }

  if (a3) {
    uint64_t v25 = @"spokenLanguage";
  }
  else {
    uint64_t v25 = @"spoken_language";
  }
  __int16 v26 = [v5 objectForKeyedSubscript:v25];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    long long v109 = 0u;
    long long v110 = 0u;
    long long v107 = 0u;
    long long v108 = 0u;
    id v27 = v26;
    uint64_t v28 = [v27 countByEnumeratingWithState:&v107 objects:v118 count:16];
    if (v28)
    {
      uint64_t v29 = v28;
      uint64_t v30 = *(void *)v108;
      do
      {
        for (uint64_t j = 0; j != v29; ++j)
        {
          if (*(void *)v108 != v30) {
            objc_enumerationMutation(v27);
          }
          long long v32 = *(void **)(*((void *)&v107 + 1) + 8 * j);
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            long long v33 = (void *)[v32 copy];
            [a1 addSpokenLanguage:v33];
          }
        }
        uint64_t v29 = [v27 countByEnumeratingWithState:&v107 objects:v118 count:16];
      }
      while (v29);
    }

    id v5 = v94;
  }

  if (a3) {
    long long v34 = @"requestedComponent";
  }
  else {
    long long v34 = @"requested_component";
  }
  long long v35 = [v5 objectForKeyedSubscript:v34];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    long long v105 = 0u;
    long long v106 = 0u;
    long long v103 = 0u;
    long long v104 = 0u;
    v91 = v35;
    id v36 = v35;
    uint64_t v37 = [v36 countByEnumeratingWithState:&v103 objects:v117 count:16];
    if (v37)
    {
      uint64_t v38 = v37;
      uint64_t v39 = *(void *)v104;
      do
      {
        uint64_t v40 = 0;
        do
        {
          if (*(void *)v104 != v39) {
            objc_enumerationMutation(v36);
          }
          uint64_t v41 = *(void **)(*((void *)&v103 + 1) + 8 * v40);
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            uint64_t v42 = [GEOPDComponentInfo alloc];
            if (v42) {
              long long v43 = (void *)-[GEOPDComponentInfo _initWithDictionary:isJSON:]((uint64_t)v42, v41, a3);
            }
            else {
              long long v43 = 0;
            }
            objc_msgSend(a1, "addRequestedComponent:", v43, v91);
          }
          ++v40;
        }
        while (v38 != v40);
        uint64_t v44 = [v36 countByEnumeratingWithState:&v103 objects:v117 count:16];
        uint64_t v38 = v44;
      }
      while (v44);
    }

    long long v35 = v91;
    id v5 = v94;
  }

  if (a3) {
    long long v45 = @"suppressResultsRequiringAttribution";
  }
  else {
    long long v45 = @"suppress_results_requiring_attribution";
  }
  long long v46 = objc_msgSend(v5, "objectForKeyedSubscript:", v45, v91);
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    objc_msgSend(a1, "setSuppressResultsRequiringAttribution:", objc_msgSend(v46, "BOOLValue"));
  }

  if (a3) {
    long long v47 = @"requestType";
  }
  else {
    long long v47 = @"request_type";
  }
  long long v48 = [v5 objectForKeyedSubscript:v47];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v49 = v48;
    if ([v49 isEqualToString:@"REQUEST_TYPE_UNKNOWN"])
    {
      uint64_t v50 = 0;
    }
    else if ([v49 isEqualToString:@"REQUEST_TYPE_SEARCH"])
    {
      uint64_t v50 = 1;
    }
    else if ([v49 isEqualToString:@"REQUEST_TYPE_GEOCODING"])
    {
      uint64_t v50 = 2;
    }
    else if ([v49 isEqualToString:@"REQUEST_TYPE_CANONICAL_LOCATION_SEARCH"])
    {
      uint64_t v50 = 3;
    }
    else if ([v49 isEqualToString:@"REQUEST_TYPE_REVERSE_GEOCODING"])
    {
      uint64_t v50 = 4;
    }
    else if ([v49 isEqualToString:@"REQUEST_TYPE_PLACE_LOOKUP"])
    {
      uint64_t v50 = 5;
    }
    else if ([v49 isEqualToString:@"REQUEST_TYPE_MERCHANT_LOOKUP"])
    {
      uint64_t v50 = 6;
    }
    else if ([v49 isEqualToString:@"REQUEST_TYPE_PLACE_REFINEMENT"])
    {
      uint64_t v50 = 7;
    }
    else if ([v49 isEqualToString:@"REQUEST_TYPE_SIRI_SEARCH"])
    {
      uint64_t v50 = 8;
    }
    else if ([v49 isEqualToString:@"REQUEST_TYPE_LOCATION_DIRECTED_SEARCH"])
    {
      uint64_t v50 = 9;
    }
    else if ([v49 isEqualToString:@"REQUEST_TYPE_AUTOCOMPLETE"])
    {
      uint64_t v50 = 10;
    }
    else if ([v49 isEqualToString:@"REQUEST_TYPE_BROWSE_CATEGORY_SUGGESTION"])
    {
      uint64_t v50 = 11;
    }
    else
    {
      if ([v49 isEqualToString:@"REQUEST_TYPE_CATEGORY_SEARCH"])
      {
        uint64_t v50 = 12;
      }
      else if ([v49 isEqualToString:@"REQUEST_TYPE_POPULAR_NEARBY_SEARCH"])
      {
        uint64_t v50 = 13;
      }
      else if ([v49 isEqualToString:@"REQUEST_TYPE_ZERO_KEYWORD_CATEGORY_SUGGESTION"])
      {
        uint64_t v50 = 14;
      }
      else if ([v49 isEqualToString:@"REQUEST_TYPE_SEARCH_FIELD_PLACEHOLDER"])
      {
        uint64_t v50 = 15;
      }
      else if ([v49 isEqualToString:@"REQUEST_TYPE_BATCH_POPULAR_NEARBY_SEARCH"])
      {
        uint64_t v50 = 16;
      }
      else if ([v49 isEqualToString:@"REQUEST_TYPE_VENDOR_SPECIFIC_PLACE_REFINEMENT"])
      {
        uint64_t v50 = 17;
      }
      else if ([v49 isEqualToString:@"REQUEST_TYPE_NEARBY_SEARCH"])
      {
        uint64_t v50 = 18;
      }
      else if ([v49 isEqualToString:@"REQUEST_TYPE_ADDRESS_OBJECT_GEOCODING"])
      {
        uint64_t v50 = 19;
      }
      else if ([v49 isEqualToString:@"REQUEST_TYPE_ZERO_KEYWORD_WITH_SEARCH_RESULTS_SUGGESTION"])
      {
        uint64_t v50 = 20;
      }
      else if ([v49 isEqualToString:@"REQUEST_TYPE_EXTERNAL_TRANSIT_LOOKUP"])
      {
        uint64_t v50 = 21;
      }
      else if ([v49 isEqualToString:@"REQUEST_TYPE_FEATURE_ID_GEOCODING"])
      {
        uint64_t v50 = 22;
      }
      else if ([v49 isEqualToString:@"REQUEST_TYPE_MAPS_IDENTIFIER_PLACE_LOOKUP"])
      {
        uint64_t v50 = 23;
      }
      else if ([v49 isEqualToString:@"REQUEST_TYPE_DATASET_STATUS_CHECK"])
      {
        uint64_t v50 = 24;
      }
      else if ([v49 isEqualToString:@"REQUEST_TYPE_OFFLINE_AREA_LOOKUP"])
      {
        uint64_t v50 = 25;
      }
      else if ([v49 isEqualToString:@"REQUEST_TYPE_BATCH_REVERSE_GEOCODING"])
      {
        uint64_t v50 = 26;
      }
      else if ([v49 isEqualToString:@"REQUEST_TYPE_OFFLINE_SUGGESTED_REGIONS"])
      {
        uint64_t v50 = 27;
      }
      else if ([v49 isEqualToString:@"REQUEST_TYPE_OFFLINE_POLYGON_QUAD_NODES"])
      {
        uint64_t v50 = 28;
      }
      else if ([v49 isEqualToString:@"REQUEST_TYPE_OFFLINE_PROACTIVE_REGIONS"])
      {
        uint64_t v50 = 29;
      }
      else if ([v49 isEqualToString:@"REQUEST_TYPE_BRAND_LOOKUP"])
      {
        uint64_t v50 = 30;
      }
      else if ([v49 isEqualToString:@"REQUEST_TYPE_OFFLINE_UPDATE_MANIFEST"])
      {
        uint64_t v50 = 31;
      }
      else if ([v49 isEqualToString:@"REQUEST_TYPE_WIFI_FINGERPRINT_LOOKUP"])
      {
        uint64_t v50 = 32;
      }
      else if ([v49 isEqualToString:@"REQUEST_TYPE_INITIAL_OFFLINE_SUGGESTION"])
      {
        uint64_t v50 = 33;
      }
      else if ([v49 isEqualToString:@"REQUEST_TYPE_IP_GEO_LOOKUP"])
      {
        uint64_t v50 = 34;
      }
      else if ([v49 isEqualToString:@"REQUEST_TYPE_GROUND_VIEW_LABEL"])
      {
        uint64_t v50 = 35;
      }
      else if ([v49 isEqualToString:@"REQUEST_TYPE_BATCH_SPATIAL_LOOKUP"])
      {
        uint64_t v50 = 36;
      }
      else if ([v49 isEqualToString:@"REQUEST_TYPE_TRANSIT_VEHICLE_POSITION"])
      {
        uint64_t v50 = 37;
      }
      else if ([v49 isEqualToString:@"REQUEST_TYPE_PLACE_COLLECTION_LOOKUP"])
      {
        uint64_t v50 = 38;
      }
      else if ([v49 isEqualToString:@"REQUEST_TYPE_TRANSIT_SCHEDULE_LOOKUP"])
      {
        uint64_t v50 = 39;
      }
      else if ([v49 isEqualToString:@"REQUEST_TYPE_BATCH_CATEGORY_LOOKUP"])
      {
        uint64_t v50 = 40;
      }
      else if ([v49 isEqualToString:@"REQUEST_TYPE_BATCH_MERCHANT_LOOKUP_BRAND"])
      {
        uint64_t v50 = 41;
      }
      else if ([v49 isEqualToString:@"REQUEST_TYPE_CHILD_PLACE_LOOKUP_BY_CATEGORY"])
      {
        uint64_t v50 = 42;
      }
      else if ([v49 isEqualToString:@"REQUEST_TYPE_COLLECTION_SUGGESTION"])
      {
        uint64_t v50 = 43;
      }
      else if ([v49 isEqualToString:@"REQUEST_TYPE_MAPS_SEARCH_HOME"])
      {
        uint64_t v50 = 44;
      }
      else if ([v49 isEqualToString:@"REQUEST_TYPE_PLACE_QUESTIONNAIRE_LOOKUP"])
      {
        uint64_t v50 = 45;
      }
      else if ([v49 isEqualToString:@"REQUEST_TYPE_PUBLISHER_VIEW"])
      {
        uint64_t v50 = 46;
      }
      else if ([v49 isEqualToString:@"REQUEST_TYPE_ALL_COLLECTIONS_VIEW"])
      {
        uint64_t v50 = 47;
      }
      else if ([v49 isEqualToString:@"REQUEST_TYPE_AIRPORT_ENTITY_PLACE_LOOKUP"])
      {
        uint64_t v50 = 48;
      }
      else if ([v49 isEqualToString:@"REQUEST_TYPE_TERRITORY_LOOKUP"])
      {
        uint64_t v50 = 49;
      }
      else if ([v49 isEqualToString:@"REQUEST_TYPE_TRANSIT_NEARBY_SCHEDULE_LOOKUP"])
      {
        uint64_t v50 = 50;
      }
      else if ([v49 isEqualToString:@"REQUEST_TYPE_MAPS_HOME"])
      {
        uint64_t v50 = 51;
      }
      else if ([v49 isEqualToString:@"REQUEST_TYPE_ALL_GUIDES_LOCATIONS"])
      {
        uint64_t v50 = 52;
      }
      else if ([v49 isEqualToString:@"REQUEST_TYPE_GUIDES_HOME"])
      {
        uint64_t v50 = 53;
      }
      else if ([v49 isEqualToString:@"REQUEST_TYPE_EXTENDED_GEO_LOOKUP"])
      {
        uint64_t v50 = 54;
      }
      else if ([v49 isEqualToString:@"REQUEST_TYPE_QUERY_UNDERSTANDING"])
      {
        uint64_t v50 = 55;
      }
      else if ([v49 isEqualToString:@"REQUEST_TYPE_POI_AT_ADDRESS_LOOKUP"])
      {
        uint64_t v50 = 56;
      }
      else if ([v49 isEqualToString:@"REQUEST_TYPE_TRANSIT_NEARBY_PAYMENT_METHOD_LOOKUP"])
      {
        uint64_t v50 = 57;
      }
      else if ([v49 isEqualToString:@"REQUEST_TYPE_PLACECARD_ENRICHMENT"])
      {
        uint64_t v50 = 58;
      }
      else if ([v49 isEqualToString:@"REQUEST_TYPE_OFFLINE_REGION_NAME"])
      {
        uint64_t v50 = 59;
      }
      else if ([v49 isEqualToString:@"REQUEST_TYPE_SEARCH_CAPABILITIES"])
      {
        uint64_t v50 = 60;
      }
      else if ([v49 isEqualToString:@"REQUEST_TYPE_REFRESH_ID_LOOKUP"])
      {
        uint64_t v50 = 61;
      }
      else if ([v49 isEqualToString:@"REQUEST_TYPE_ADDRESS_RECOMMENDATION"])
      {
        uint64_t v50 = 62;
      }
      else
      {
        uint64_t v50 = 0;
      }
      id v5 = v94;
    }

    goto LABEL_205;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v50 = [v48 intValue];
LABEL_205:
    [a1 setRequestType:v50];
  }

  if (a3) {
    v51 = @"placeRequestParameters";
  }
  else {
    v51 = @"place_request_parameters";
  }
  id v52 = [v5 objectForKeyedSubscript:v51];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v53 = [GEOPDPlaceRequestParameters alloc];
    if (v53) {
      id v54 = -[GEOPDPlaceRequestParameters _initWithDictionary:isJSON:](v53, v52, a3);
    }
    else {
      id v54 = 0;
    }
    [a1 setPlaceRequestParameters:v54];
  }
  if (a3) {
    uint64_t v55 = @"displayRegion";
  }
  else {
    uint64_t v55 = @"display_region";
  }
  v56 = [v5 objectForKeyedSubscript:v55];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v57 = (void *)[v56 copy];
    [a1 setDisplayRegion:v57];
  }
  if (a3) {
    v58 = @"auxiliaryTierRequestedComponent";
  }
  else {
    v58 = @"auxiliary_tier_requested_component";
  }
  v59 = [v5 objectForKeyedSubscript:v58];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    long long v101 = 0u;
    long long v102 = 0u;
    long long v99 = 0u;
    long long v100 = 0u;
    v92 = v59;
    id v60 = v59;
    uint64_t v61 = [v60 countByEnumeratingWithState:&v99 objects:v116 count:16];
    if (v61)
    {
      uint64_t v62 = v61;
      uint64_t v63 = *(void *)v100;
      do
      {
        uint64_t v64 = 0;
        do
        {
          if (*(void *)v100 != v63) {
            objc_enumerationMutation(v60);
          }
          v65 = *(void **)(*((void *)&v99 + 1) + 8 * v64);
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            v66 = [GEOPDComponentInfo alloc];
            if (v66) {
              v67 = (void *)-[GEOPDComponentInfo _initWithDictionary:isJSON:]((uint64_t)v66, v65, a3);
            }
            else {
              v67 = 0;
            }
            objc_msgSend(a1, "addAuxiliaryTierRequestedComponent:", v67, v92);
          }
          ++v64;
        }
        while (v62 != v64);
        uint64_t v68 = [v60 countByEnumeratingWithState:&v99 objects:v116 count:16];
        uint64_t v62 = v68;
      }
      while (v68);
    }

    v59 = v92;
    id v5 = v94;
  }

  if (a3) {
    id v69 = @"privacyMetadata";
  }
  else {
    id v69 = @"privacy_metadata";
  }
  id v70 = objc_msgSend(v5, "objectForKeyedSubscript:", v69, v92);
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v71 = [GEOPrivacyMetadata alloc];
    if (a3) {
      uint64_t v72 = [(GEOPrivacyMetadata *)v71 initWithJSON:v70];
    }
    else {
      uint64_t v72 = [(GEOPrivacyMetadata *)v71 initWithDictionary:v70];
    }
    id v73 = (void *)v72;
    [a1 setPrivacyMetadata:v72];
  }
  if (a3) {
    long long v74 = @"partiallyComposedSearchResultRequestedComponent";
  }
  else {
    long long v74 = @"partially_composed_search_result_requested_component";
  }
  long long v75 = [v5 objectForKeyedSubscript:v74];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    long long v97 = 0u;
    long long v98 = 0u;
    long long v95 = 0u;
    long long v96 = 0u;
    v93 = v75;
    id v76 = v75;
    uint64_t v77 = [v76 countByEnumeratingWithState:&v95 objects:v115 count:16];
    if (v77)
    {
      uint64_t v78 = v77;
      uint64_t v79 = *(void *)v96;
      do
      {
        uint64_t v80 = 0;
        do
        {
          if (*(void *)v96 != v79) {
            objc_enumerationMutation(v76);
          }
          long long v81 = *(void **)(*((void *)&v95 + 1) + 8 * v80);
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            long long v82 = [GEOPDComponentInfo alloc];
            if (v82) {
              long long v83 = (void *)-[GEOPDComponentInfo _initWithDictionary:isJSON:]((uint64_t)v82, v81, a3);
            }
            else {
              long long v83 = 0;
            }
            objc_msgSend(a1, "addPartiallyComposedSearchResultRequestedComponent:", v83, v93);
          }
          ++v80;
        }
        while (v78 != v80);
        uint64_t v84 = [v76 countByEnumeratingWithState:&v95 objects:v115 count:16];
        uint64_t v78 = v84;
      }
      while (v84);
    }

    long long v75 = v93;
    id v5 = v94;
  }

  if (a3) {
    long long v85 = @"needLatency";
  }
  else {
    long long v85 = @"need_latency";
  }
  v86 = objc_msgSend(v5, "objectForKeyedSubscript:", v85, v93);
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    objc_msgSend(a1, "setNeedLatency:", objc_msgSend(v86, "BOOLValue"));
  }

  if (a3) {
    v87 = @"handleData";
  }
  else {
    v87 = @"handle_data";
  }
  v88 = [v5 objectForKeyedSubscript:v87];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v89 = (void *)[objc_alloc(MEMORY[0x1E4F1C9B8]) initWithBase64EncodedString:v88 options:0];
    [a1 setHandleData:v89];
  }
LABEL_273:

  return a1;
}

- (GEOPDPlaceRequest)initWithJSON:(id)a3
{
  return (GEOPDPlaceRequest *)-[GEOPDPlaceRequest _initWithDictionary:isJSON:](self, a3, 1);
}

+ (BOOL)isValid:(id)a3
{
  return GEOPDPlaceRequestIsValid((char *)a3);
}

- (BOOL)hasGreenTeaWithValue:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v38 = *MEMORY[0x1E4F143B8];
  -[GEOPDPlaceRequest _readAuxiliaryTierRequestedComponents]((uint64_t)self);
  long long v33 = 0u;
  long long v34 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  id v5 = self->_auxiliaryTierRequestedComponents;
  uint64_t v6 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v31 objects:v37 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v32;
LABEL_3:
    uint64_t v9 = 0;
    while (1)
    {
      if (*(void *)v32 != v8) {
        objc_enumerationMutation(v5);
      }
      uint64_t v10 = *(void *)(*((void *)&v31 + 1) + 8 * v9);
      if (v10)
      {
        if (-[GEOPDComponentFilter hasGreenTeaWithValue:](*(void *)(v10 + 16), v3)) {
          goto LABEL_32;
        }
      }
      if (v7 == ++v9)
      {
        uint64_t v7 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v31 objects:v37 count:16];
        if (v7) {
          goto LABEL_3;
        }
        break;
      }
    }
  }

  -[GEOPDPlaceRequest _readClientMetadata]((uint64_t)self);
  if (![(GEOPDClientMetadata *)self->_clientMetadata hasGreenTeaWithValue:v3])
  {
    -[GEOPDPlaceRequest _readPartiallyComposedSearchResultRequestedComponents]((uint64_t)self);
    long long v29 = 0u;
    long long v30 = 0u;
    long long v27 = 0u;
    long long v28 = 0u;
    id v5 = self->_partiallyComposedSearchResultRequestedComponents;
    uint64_t v12 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v27 objects:v36 count:16];
    if (v12)
    {
      uint64_t v13 = v12;
      uint64_t v14 = *(void *)v28;
LABEL_14:
      uint64_t v15 = 0;
      while (1)
      {
        if (*(void *)v28 != v14) {
          objc_enumerationMutation(v5);
        }
        uint64_t v16 = *(void *)(*((void *)&v27 + 1) + 8 * v15);
        if (v16)
        {
          if (-[GEOPDComponentFilter hasGreenTeaWithValue:](*(void *)(v16 + 16), v3)) {
            break;
          }
        }
        if (v13 == ++v15)
        {
          uint64_t v13 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v27 objects:v36 count:16];
          if (v13) {
            goto LABEL_14;
          }
          goto LABEL_21;
        }
      }
    }
    else
    {
LABEL_21:

      -[GEOPDPlaceRequest _readPlaceRequestParameters]((uint64_t)self);
      if (-[GEOPDPlaceRequestParameters hasGreenTeaWithValue:]((uint64_t)self->_placeRequestParameters, v3)) {
        return 1;
      }
      -[GEOPDPlaceRequest _readRequestedComponents]((uint64_t)self);
      long long v25 = 0u;
      long long v26 = 0u;
      long long v23 = 0u;
      long long v24 = 0u;
      id v5 = self->_requestedComponents;
      uint64_t v17 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v23 objects:v35 count:16];
      if (!v17)
      {
LABEL_31:
        BOOL v11 = 0;
LABEL_33:

        return v11;
      }
      uint64_t v18 = v17;
      uint64_t v19 = *(void *)v24;
LABEL_24:
      uint64_t v20 = 0;
      while (1)
      {
        if (*(void *)v24 != v19) {
          objc_enumerationMutation(v5);
        }
        uint64_t v21 = *(void *)(*((void *)&v23 + 1) + 8 * v20);
        if (v21)
        {
          if (-[GEOPDComponentFilter hasGreenTeaWithValue:](*(void *)(v21 + 16), v3)) {
            break;
          }
        }
        if (v18 == ++v20)
        {
          uint64_t v18 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v23 objects:v35 count:16];
          if (v18) {
            goto LABEL_24;
          }
          goto LABEL_31;
        }
      }
    }
LABEL_32:
    BOOL v11 = 1;
    goto LABEL_33;
  }
  return 1;
}

- (void)copyTo:(id)a3
{
  long long v26 = (id *)a3;
  [(GEOPDPlaceRequest *)self readAll:0];
  os_unfair_lock_lock_with_options();
  objc_storeStrong(v26 + 1, self->_reader);
  *((_DWORD *)v26 + 28) = self->_readerMarkPos;
  *((_DWORD *)v26 + 29) = self->_readerMarkLength;
  os_unfair_lock_unlock(&self->_readerLock);
  if (self->_analyticMetadata) {
    objc_msgSend(v26, "setAnalyticMetadata:");
  }
  if (self->_clientMetadata) {
    objc_msgSend(v26, "setClientMetadata:");
  }
  if ([(GEOPDPlaceRequest *)self displayLanguagesCount])
  {
    [v26 clearDisplayLanguages];
    unint64_t v4 = [(GEOPDPlaceRequest *)self displayLanguagesCount];
    if (v4)
    {
      unint64_t v5 = v4;
      for (uint64_t i = 0; i != v5; ++i)
      {
        uint64_t v7 = [(GEOPDPlaceRequest *)self displayLanguageAtIndex:i];
        [v26 addDisplayLanguage:v7];
      }
    }
  }
  if ([(GEOPDPlaceRequest *)self spokenLanguagesCount])
  {
    [v26 clearSpokenLanguages];
    unint64_t v8 = [(GEOPDPlaceRequest *)self spokenLanguagesCount];
    if (v8)
    {
      unint64_t v9 = v8;
      for (uint64_t j = 0; j != v9; ++j)
      {
        BOOL v11 = [(GEOPDPlaceRequest *)self spokenLanguageAtIndex:j];
        [v26 addSpokenLanguage:v11];
      }
    }
  }
  if ([(GEOPDPlaceRequest *)self requestedComponentsCount])
  {
    [v26 clearRequestedComponents];
    unint64_t v12 = [(GEOPDPlaceRequest *)self requestedComponentsCount];
    if (v12)
    {
      unint64_t v13 = v12;
      for (uint64_t k = 0; k != v13; ++k)
      {
        uint64_t v15 = [(GEOPDPlaceRequest *)self requestedComponentAtIndex:k];
        [v26 addRequestedComponent:v15];
      }
    }
  }
  __int16 flags = (__int16)self->_flags;
  if ((flags & 4) != 0)
  {
    *((unsigned char *)v26 + 129) = self->_suppressResultsRequiringAttribution;
    *((_WORD *)v26 + 66) |= 4u;
    __int16 flags = (__int16)self->_flags;
  }
  if (flags)
  {
    *((_DWORD *)v26 + 31) = self->_requestType;
    *((_WORD *)v26 + 66) |= 1u;
  }
  if (self->_placeRequestParameters) {
    objc_msgSend(v26, "setPlaceRequestParameters:");
  }
  if (self->_displayRegion) {
    objc_msgSend(v26, "setDisplayRegion:");
  }
  if ([(GEOPDPlaceRequest *)self auxiliaryTierRequestedComponentsCount])
  {
    [v26 clearAuxiliaryTierRequestedComponents];
    unint64_t v17 = [(GEOPDPlaceRequest *)self auxiliaryTierRequestedComponentsCount];
    if (v17)
    {
      unint64_t v18 = v17;
      for (uint64_t m = 0; m != v18; ++m)
      {
        uint64_t v20 = [(GEOPDPlaceRequest *)self auxiliaryTierRequestedComponentAtIndex:m];
        [v26 addAuxiliaryTierRequestedComponent:v20];
      }
    }
  }
  if (self->_privacyMetadata) {
    objc_msgSend(v26, "setPrivacyMetadata:");
  }
  if ([(GEOPDPlaceRequest *)self partiallyComposedSearchResultRequestedComponentsCount])
  {
    [v26 clearPartiallyComposedSearchResultRequestedComponents];
    unint64_t v21 = [(GEOPDPlaceRequest *)self partiallyComposedSearchResultRequestedComponentsCount];
    if (v21)
    {
      unint64_t v22 = v21;
      for (uint64_t n = 0; n != v22; ++n)
      {
        long long v24 = [(GEOPDPlaceRequest *)self partiallyComposedSearchResultRequestedComponentAtIndex:n];
        [v26 addPartiallyComposedSearchResultRequestedComponent:v24];
      }
    }
  }
  long long v25 = v26;
  if ((*(_WORD *)&self->_flags & 2) != 0)
  {
    *((unsigned char *)v26 + 128) = self->_needLatency;
    *((_WORD *)v26 + 66) |= 2u;
  }
  if (self->_handleData)
  {
    objc_msgSend(v26, "setHandleData:");
    long long v25 = v26;
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
      GEOPDPlaceRequestReadAllFrom(v5, self->_reader, 0);
      os_unfair_lock_unlock(&self->_readerLock);
      id v8 = (id)v5;
      objc_sync_exit(v7);

      goto LABEL_47;
    }
    objc_sync_exit(v7);
  }
  os_unfair_lock_unlock(&self->_readerLock);
  [(GEOPDPlaceRequest *)self readAll:0];
  id v9 = [(GEOPDAnalyticMetadata *)self->_analyticMetadata copyWithZone:a3];
  uint64_t v10 = *(void **)(v5 + 24);
  *(void *)(v5 + 24) = v9;

  id v11 = [(GEOPDClientMetadata *)self->_clientMetadata copyWithZone:a3];
  unint64_t v12 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v11;

  long long v67 = 0u;
  long long v68 = 0u;
  long long v65 = 0u;
  long long v66 = 0u;
  unint64_t v13 = self->_displayLanguages;
  uint64_t v14 = [(NSMutableArray *)v13 countByEnumeratingWithState:&v65 objects:v73 count:16];
  if (v14)
  {
    uint64_t v15 = *(void *)v66;
    do
    {
      for (uint64_t i = 0; i != v14; ++i)
      {
        if (*(void *)v66 != v15) {
          objc_enumerationMutation(v13);
        }
        unint64_t v17 = (void *)[*(id *)(*((void *)&v65 + 1) + 8 * i) copyWithZone:a3];
        [(id)v5 addDisplayLanguage:v17];
      }
      uint64_t v14 = [(NSMutableArray *)v13 countByEnumeratingWithState:&v65 objects:v73 count:16];
    }
    while (v14);
  }

  long long v63 = 0u;
  long long v64 = 0u;
  long long v61 = 0u;
  long long v62 = 0u;
  unint64_t v18 = self->_spokenLanguages;
  uint64_t v19 = [(NSMutableArray *)v18 countByEnumeratingWithState:&v61 objects:v72 count:16];
  if (v19)
  {
    uint64_t v20 = *(void *)v62;
    do
    {
      for (uint64_t j = 0; j != v19; ++j)
      {
        if (*(void *)v62 != v20) {
          objc_enumerationMutation(v18);
        }
        unint64_t v22 = (void *)[*(id *)(*((void *)&v61 + 1) + 8 * j) copyWithZone:a3];
        [(id)v5 addSpokenLanguage:v22];
      }
      uint64_t v19 = [(NSMutableArray *)v18 countByEnumeratingWithState:&v61 objects:v72 count:16];
    }
    while (v19);
  }

  long long v59 = 0u;
  long long v60 = 0u;
  long long v57 = 0u;
  long long v58 = 0u;
  long long v23 = self->_requestedComponents;
  uint64_t v24 = [(NSMutableArray *)v23 countByEnumeratingWithState:&v57 objects:v71 count:16];
  if (v24)
  {
    uint64_t v25 = *(void *)v58;
    do
    {
      for (uint64_t k = 0; k != v24; ++k)
      {
        if (*(void *)v58 != v25) {
          objc_enumerationMutation(v23);
        }
        long long v27 = (void *)[*(id *)(*((void *)&v57 + 1) + 8 * k) copyWithZone:a3];
        [(id)v5 addRequestedComponent:v27];
      }
      uint64_t v24 = [(NSMutableArray *)v23 countByEnumeratingWithState:&v57 objects:v71 count:16];
    }
    while (v24);
  }

  __int16 flags = (__int16)self->_flags;
  if ((flags & 4) != 0)
  {
    *(unsigned char *)(v5 + 129) = self->_suppressResultsRequiringAttribution;
    *(_WORD *)(v5 + 132) |= 4u;
    __int16 flags = (__int16)self->_flags;
  }
  if (flags)
  {
    *(_DWORD *)(v5 + 124) = self->_requestType;
    *(_WORD *)(v5 + 132) |= 1u;
  }
  id v29 = [(GEOPDPlaceRequestParameters *)self->_placeRequestParameters copyWithZone:a3];
  long long v30 = *(void **)(v5 + 80);
  *(void *)(v5 + 80) = v29;

  uint64_t v31 = [(NSString *)self->_displayRegion copyWithZone:a3];
  long long v32 = *(void **)(v5 + 56);
  *(void *)(v5 + 56) = v31;

  long long v55 = 0u;
  long long v56 = 0u;
  long long v53 = 0u;
  long long v54 = 0u;
  long long v33 = self->_auxiliaryTierRequestedComponents;
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
        uint64_t v37 = (void *)[*(id *)(*((void *)&v53 + 1) + 8 * m) copyWithZone:a3];
        [(id)v5 addAuxiliaryTierRequestedComponent:v37];
      }
      uint64_t v34 = [(NSMutableArray *)v33 countByEnumeratingWithState:&v53 objects:v70 count:16];
    }
    while (v34);
  }

  id v38 = [(GEOPrivacyMetadata *)self->_privacyMetadata copyWithZone:a3];
  uint64_t v39 = *(void **)(v5 + 88);
  *(void *)(v5 + 88) = v38;

  long long v51 = 0u;
  long long v52 = 0u;
  long long v49 = 0u;
  long long v50 = 0u;
  uint64_t v40 = self->_partiallyComposedSearchResultRequestedComponents;
  uint64_t v41 = [(NSMutableArray *)v40 countByEnumeratingWithState:&v49 objects:v69 count:16];
  if (v41)
  {
    uint64_t v42 = *(void *)v50;
    do
    {
      for (uint64_t n = 0; n != v41; ++n)
      {
        if (*(void *)v50 != v42) {
          objc_enumerationMutation(v40);
        }
        uint64_t v44 = objc_msgSend(*(id *)(*((void *)&v49 + 1) + 8 * n), "copyWithZone:", a3, (void)v49);
        [(id)v5 addPartiallyComposedSearchResultRequestedComponent:v44];
      }
      uint64_t v41 = [(NSMutableArray *)v40 countByEnumeratingWithState:&v49 objects:v69 count:16];
    }
    while (v41);
  }

  if ((*(_WORD *)&self->_flags & 2) != 0)
  {
    *(unsigned char *)(v5 + 128) = self->_needLatency;
    *(_WORD *)(v5 + 132) |= 2u;
  }
  uint64_t v45 = -[NSData copyWithZone:](self->_handleData, "copyWithZone:", a3, (void)v49);
  long long v46 = *(void **)(v5 + 64);
  *(void *)(v5 + 64) = v45;

  long long v47 = self->_unknownFields;
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
  [(GEOPDPlaceRequest *)self readAll:1];
  [v4 readAll:1];
  analyticMetadata = self->_analyticMetadata;
  if ((unint64_t)analyticMetadata | *((void *)v4 + 3))
  {
    if (!-[GEOPDAnalyticMetadata isEqual:](analyticMetadata, "isEqual:")) {
      goto LABEL_39;
    }
  }
  clientMetadata = self->_clientMetadata;
  if ((unint64_t)clientMetadata | *((void *)v4 + 5))
  {
    if (!-[GEOPDClientMetadata isEqual:](clientMetadata, "isEqual:")) {
      goto LABEL_39;
    }
  }
  displayLanguages = self->_displayLanguages;
  if ((unint64_t)displayLanguages | *((void *)v4 + 6))
  {
    if (!-[NSMutableArray isEqual:](displayLanguages, "isEqual:")) {
      goto LABEL_39;
    }
  }
  spokenLanguages = self->_spokenLanguages;
  if ((unint64_t)spokenLanguages | *((void *)v4 + 13))
  {
    if (!-[NSMutableArray isEqual:](spokenLanguages, "isEqual:")) {
      goto LABEL_39;
    }
  }
  requestedComponents = self->_requestedComponents;
  if ((unint64_t)requestedComponents | *((void *)v4 + 12))
  {
    if (!-[NSMutableArray isEqual:](requestedComponents, "isEqual:")) {
      goto LABEL_39;
    }
  }
  __int16 flags = (__int16)self->_flags;
  __int16 v11 = *((_WORD *)v4 + 66);
  if ((flags & 4) != 0)
  {
    if ((v11 & 4) == 0) {
      goto LABEL_39;
    }
    if (self->_suppressResultsRequiringAttribution)
    {
      if (!*((unsigned char *)v4 + 129)) {
        goto LABEL_39;
      }
    }
    else if (*((unsigned char *)v4 + 129))
    {
      goto LABEL_39;
    }
  }
  else if ((v11 & 4) != 0)
  {
    goto LABEL_39;
  }
  if (flags)
  {
    if ((v11 & 1) == 0 || self->_requestType != *((_DWORD *)v4 + 31)) {
      goto LABEL_39;
    }
  }
  else if (v11)
  {
    goto LABEL_39;
  }
  placeRequestParameters = self->_placeRequestParameters;
  if ((unint64_t)placeRequestParameters | *((void *)v4 + 10)
    && !-[GEOPDPlaceRequestParameters isEqual:](placeRequestParameters, "isEqual:"))
  {
    goto LABEL_39;
  }
  displayRegiouint64_t n = self->_displayRegion;
  if ((unint64_t)displayRegion | *((void *)v4 + 7))
  {
    if (!-[NSString isEqual:](displayRegion, "isEqual:")) {
      goto LABEL_39;
    }
  }
  auxiliaryTierRequestedComponents = self->_auxiliaryTierRequestedComponents;
  if ((unint64_t)auxiliaryTierRequestedComponents | *((void *)v4 + 4))
  {
    if (!-[NSMutableArray isEqual:](auxiliaryTierRequestedComponents, "isEqual:")) {
      goto LABEL_39;
    }
  }
  privacyMetadata = self->_privacyMetadata;
  if ((unint64_t)privacyMetadata | *((void *)v4 + 11))
  {
    if (!-[GEOPrivacyMetadata isEqual:](privacyMetadata, "isEqual:")) {
      goto LABEL_39;
    }
  }
  partiallyComposedSearchResultRequestedComponents = self->_partiallyComposedSearchResultRequestedComponents;
  if ((unint64_t)partiallyComposedSearchResultRequestedComponents | *((void *)v4 + 9))
  {
    if (!-[NSMutableArray isEqual:](partiallyComposedSearchResultRequestedComponents, "isEqual:")) {
      goto LABEL_39;
    }
  }
  __int16 v17 = *((_WORD *)v4 + 66);
  if ((*(_WORD *)&self->_flags & 2) == 0)
  {
    if ((v17 & 2) == 0) {
      goto LABEL_45;
    }
LABEL_39:
    char v18 = 0;
    goto LABEL_40;
  }
  if ((v17 & 2) == 0) {
    goto LABEL_39;
  }
  if (!self->_needLatency)
  {
    if (!*((unsigned char *)v4 + 128)) {
      goto LABEL_45;
    }
    goto LABEL_39;
  }
  if (!*((unsigned char *)v4 + 128)) {
    goto LABEL_39;
  }
LABEL_45:
  handleData = self->_handleData;
  if ((unint64_t)handleData | *((void *)v4 + 8)) {
    char v18 = -[NSData isEqual:](handleData, "isEqual:");
  }
  else {
    char v18 = 1;
  }
LABEL_40:

  return v18;
}

- (unint64_t)hash
{
  [(GEOPDPlaceRequest *)self readAll:1];
  unint64_t v17 = [(GEOPDAnalyticMetadata *)self->_analyticMetadata hash];
  unint64_t v16 = [(GEOPDClientMetadata *)self->_clientMetadata hash];
  uint64_t v15 = [(NSMutableArray *)self->_displayLanguages hash];
  uint64_t v14 = [(NSMutableArray *)self->_spokenLanguages hash];
  uint64_t v13 = [(NSMutableArray *)self->_requestedComponents hash];
  __int16 flags = (__int16)self->_flags;
  if ((flags & 4) != 0)
  {
    uint64_t v4 = 2654435761 * self->_suppressResultsRequiringAttribution;
    if (flags) {
      goto LABEL_3;
    }
  }
  else
  {
    uint64_t v4 = 0;
    if (flags)
    {
LABEL_3:
      uint64_t v5 = 2654435761 * self->_requestType;
      goto LABEL_6;
    }
  }
  uint64_t v5 = 0;
LABEL_6:
  unint64_t v6 = [(GEOPDPlaceRequestParameters *)self->_placeRequestParameters hash];
  NSUInteger v7 = [(NSString *)self->_displayRegion hash];
  uint64_t v8 = [(NSMutableArray *)self->_auxiliaryTierRequestedComponents hash];
  unint64_t v9 = [(GEOPrivacyMetadata *)self->_privacyMetadata hash];
  uint64_t v10 = [(NSMutableArray *)self->_partiallyComposedSearchResultRequestedComponents hash];
  if ((*(_WORD *)&self->_flags & 2) != 0) {
    uint64_t v11 = 2654435761 * self->_needLatency;
  }
  else {
    uint64_t v11 = 0;
  }
  return v16 ^ v17 ^ v15 ^ v14 ^ v13 ^ v4 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9 ^ v10 ^ v11 ^ [(NSData *)self->_handleData hash];
}

- (void)mergeFrom:(id)a3
{
  uint64_t v64 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  [v4 readAll:0];
  analyticMetadata = self->_analyticMetadata;
  uint64_t v6 = *((void *)v4 + 3);
  if (analyticMetadata)
  {
    if (v6) {
      -[GEOPDAnalyticMetadata mergeFrom:](analyticMetadata, "mergeFrom:");
    }
  }
  else if (v6)
  {
    -[GEOPDPlaceRequest setAnalyticMetadata:](self, "setAnalyticMetadata:");
  }
  clientMetadata = self->_clientMetadata;
  uint64_t v8 = *((void *)v4 + 5);
  if (clientMetadata)
  {
    if (v8) {
      -[GEOPDClientMetadata mergeFrom:](clientMetadata, "mergeFrom:");
    }
  }
  else if (v8)
  {
    -[GEOPDPlaceRequest setClientMetadata:](self, "setClientMetadata:");
  }
  long long v57 = 0u;
  long long v58 = 0u;
  long long v55 = 0u;
  long long v56 = 0u;
  id v9 = *((id *)v4 + 6);
  uint64_t v10 = [v9 countByEnumeratingWithState:&v55 objects:v63 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v56;
    do
    {
      for (uint64_t i = 0; i != v11; ++i)
      {
        if (*(void *)v56 != v12) {
          objc_enumerationMutation(v9);
        }
        [(GEOPDPlaceRequest *)self addDisplayLanguage:*(void *)(*((void *)&v55 + 1) + 8 * i)];
      }
      uint64_t v11 = [v9 countByEnumeratingWithState:&v55 objects:v63 count:16];
    }
    while (v11);
  }

  long long v53 = 0u;
  long long v54 = 0u;
  long long v51 = 0u;
  long long v52 = 0u;
  id v14 = *((id *)v4 + 13);
  uint64_t v15 = [v14 countByEnumeratingWithState:&v51 objects:v62 count:16];
  if (v15)
  {
    uint64_t v16 = v15;
    uint64_t v17 = *(void *)v52;
    do
    {
      for (uint64_t j = 0; j != v16; ++j)
      {
        if (*(void *)v52 != v17) {
          objc_enumerationMutation(v14);
        }
        [(GEOPDPlaceRequest *)self addSpokenLanguage:*(void *)(*((void *)&v51 + 1) + 8 * j)];
      }
      uint64_t v16 = [v14 countByEnumeratingWithState:&v51 objects:v62 count:16];
    }
    while (v16);
  }

  long long v49 = 0u;
  long long v50 = 0u;
  long long v47 = 0u;
  long long v48 = 0u;
  id v19 = *((id *)v4 + 12);
  uint64_t v20 = [v19 countByEnumeratingWithState:&v47 objects:v61 count:16];
  if (v20)
  {
    uint64_t v21 = v20;
    uint64_t v22 = *(void *)v48;
    do
    {
      for (uint64_t k = 0; k != v21; ++k)
      {
        if (*(void *)v48 != v22) {
          objc_enumerationMutation(v19);
        }
        [(GEOPDPlaceRequest *)self addRequestedComponent:*(void *)(*((void *)&v47 + 1) + 8 * k)];
      }
      uint64_t v21 = [v19 countByEnumeratingWithState:&v47 objects:v61 count:16];
    }
    while (v21);
  }

  __int16 v24 = *((_WORD *)v4 + 66);
  if ((v24 & 4) != 0)
  {
    self->_suppressResultsRequiringAttributiouint64_t n = *((unsigned char *)v4 + 129);
    *(_WORD *)&self->_flags |= 4u;
    __int16 v24 = *((_WORD *)v4 + 66);
  }
  if (v24)
  {
    self->_requestType = *((_DWORD *)v4 + 31);
    *(_WORD *)&self->_flags |= 1u;
  }
  placeRequestParameters = self->_placeRequestParameters;
  long long v26 = (void *)*((void *)v4 + 10);
  if (placeRequestParameters)
  {
    if (v26) {
      -[GEOPDPlaceRequestParameters mergeFrom:](placeRequestParameters, v26);
    }
  }
  else if (v26)
  {
    [(GEOPDPlaceRequest *)self setPlaceRequestParameters:*((void *)v4 + 10)];
  }
  if (*((void *)v4 + 7)) {
    -[GEOPDPlaceRequest setDisplayRegion:](self, "setDisplayRegion:");
  }
  long long v45 = 0u;
  long long v46 = 0u;
  long long v43 = 0u;
  long long v44 = 0u;
  id v27 = *((id *)v4 + 4);
  uint64_t v28 = [v27 countByEnumeratingWithState:&v43 objects:v60 count:16];
  if (v28)
  {
    uint64_t v29 = v28;
    uint64_t v30 = *(void *)v44;
    do
    {
      for (uint64_t m = 0; m != v29; ++m)
      {
        if (*(void *)v44 != v30) {
          objc_enumerationMutation(v27);
        }
        [(GEOPDPlaceRequest *)self addAuxiliaryTierRequestedComponent:*(void *)(*((void *)&v43 + 1) + 8 * m)];
      }
      uint64_t v29 = [v27 countByEnumeratingWithState:&v43 objects:v60 count:16];
    }
    while (v29);
  }

  privacyMetadata = self->_privacyMetadata;
  uint64_t v33 = *((void *)v4 + 11);
  if (privacyMetadata)
  {
    if (v33) {
      -[GEOPrivacyMetadata mergeFrom:](privacyMetadata, "mergeFrom:");
    }
  }
  else if (v33)
  {
    -[GEOPDPlaceRequest setPrivacyMetadata:](self, "setPrivacyMetadata:");
  }
  long long v41 = 0u;
  long long v42 = 0u;
  long long v39 = 0u;
  long long v40 = 0u;
  id v34 = *((id *)v4 + 9);
  uint64_t v35 = [v34 countByEnumeratingWithState:&v39 objects:v59 count:16];
  if (v35)
  {
    uint64_t v36 = v35;
    uint64_t v37 = *(void *)v40;
    do
    {
      for (uint64_t n = 0; n != v36; ++n)
      {
        if (*(void *)v40 != v37) {
          objc_enumerationMutation(v34);
        }
        -[GEOPDPlaceRequest addPartiallyComposedSearchResultRequestedComponent:](self, "addPartiallyComposedSearchResultRequestedComponent:", *(void *)(*((void *)&v39 + 1) + 8 * n), (void)v39);
      }
      uint64_t v36 = [v34 countByEnumeratingWithState:&v39 objects:v59 count:16];
    }
    while (v36);
  }

  if ((*((_WORD *)v4 + 66) & 2) != 0)
  {
    self->_needLatency = *((unsigned char *)v4 + 128);
    *(_WORD *)&self->_flags |= 2u;
  }
  if (*((void *)v4 + 8)) {
    -[GEOPDPlaceRequest setHandleData:](self, "setHandleData:");
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
      uint64_t v5 = reader;
      objc_sync_enter(v5);
      GEOPDPlaceRequestReadSpecified((uint64_t)self, (unint64_t)self->_reader, (int *)&unknownFields_tags_5286);
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
    [(GEOPDPlaceRequest *)self readAll:0];
    [(GEOPDAnalyticMetadata *)self->_analyticMetadata clearUnknownFields:1];
    [(GEOPDClientMetadata *)self->_clientMetadata clearUnknownFields:1];
    long long v32 = 0u;
    long long v33 = 0u;
    long long v30 = 0u;
    long long v31 = 0u;
    NSUInteger v7 = self->_requestedComponents;
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
          -[GEOPDComponentInfo clearUnknownFields:](*(void *)(*((void *)&v30 + 1) + 8 * v11++), 1);
        }
        while (v9 != v11);
        uint64_t v9 = [(NSMutableArray *)v7 countByEnumeratingWithState:&v30 objects:v36 count:16];
      }
      while (v9);
    }

    -[GEOPDPlaceRequestParameters clearUnknownFields:]((uint64_t)self->_placeRequestParameters);
    long long v28 = 0u;
    long long v29 = 0u;
    long long v26 = 0u;
    long long v27 = 0u;
    uint64_t v12 = self->_auxiliaryTierRequestedComponents;
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
          -[GEOPDComponentInfo clearUnknownFields:](*(void *)(*((void *)&v26 + 1) + 8 * v16++), 1);
        }
        while (v14 != v16);
        uint64_t v14 = [(NSMutableArray *)v12 countByEnumeratingWithState:&v26 objects:v35 count:16];
      }
      while (v14);
    }

    [(GEOPrivacyMetadata *)self->_privacyMetadata clearUnknownFields:1];
    long long v24 = 0u;
    long long v25 = 0u;
    long long v22 = 0u;
    long long v23 = 0u;
    uint64_t v17 = self->_partiallyComposedSearchResultRequestedComponents;
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
          -[GEOPDComponentInfo clearUnknownFields:](*(void *)(*((void *)&v22 + 1) + 8 * v21++), 1);
        }
        while (v19 != v21);
        uint64_t v19 = [(NSMutableArray *)v17 countByEnumeratingWithState:&v22 objects:v34 count:16];
      }
      while (v19);
    }
  }
}

- (BOOL)needLatency
{
  return self->_needLatency;
}

- (void)setNeedLatency:(BOOL)a3
{
  *(_WORD *)&self->_flags |= 0x8002u;
  self->_needLatency = a3;
}

- (void)setHasNeedLatency:(BOOL)a3
{
  if (a3) {
    __int16 v3 = -32766;
  }
  else {
    __int16 v3 = 0x8000;
  }
  *(_WORD *)&self->___int16 flags = *(_WORD *)&self->_flags & 0xFFFD | v3;
}

- (BOOL)hasNeedLatency
{
  return (*(_WORD *)&self->_flags >> 1) & 1;
}

- (BOOL)hasHandleData
{
  return self->_handleData != 0;
}

- (void)setHandleData:(id)a3
{
  *(_WORD *)&self->_flags |= 0x8200u;
  objc_storeStrong((id *)&self->_handleData, a3);
}

- (void)addPartiallyComposedSearchResultRequestedComponents:(id)a3
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  uint64_t v5 = [v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v10;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v10 != v7) {
          objc_enumerationMutation(v4);
        }
        [(GEOPDPlaceRequest *)self addPartiallyComposedSearchResultRequestedComponent:*(void *)(*((void *)&v9 + 1) + 8 * v8++)];
      }
      while (v6 != v8);
      uint64_t v6 = [v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v6);
  }
}

- (id)initForAutocompleteWithTraits:(id)a3 count:(unsigned int)a4
{
  uint64_t v4 = *(void *)&a4;
  id v6 = a3;
  v19.receiver = self;
  v19.super_class = (Class)GEOPDPlaceRequest;
  uint64_t v7 = [(GEOPDPlaceRequest *)&v19 init];
  if (v7)
  {
    uint64_t v8 = [[GEOPDAnalyticMetadata alloc] initWithTraits:v6];
    [(GEOPDPlaceRequest *)v7 setAnalyticMetadata:v8];
    long long v9 = [[GEOPDClientMetadata alloc] initWithTraits:v6];
    if (GEOConfigGetBOOL(MapsFeaturesConfig_PlaceCardShowcase, (uint64_t)off_1E9111D28)) {
      [(GEOPDClientMetadata *)v9 setSupportEnrichment:1];
    }
    [(GEOPDClientMetadata *)v9 addSupportedMapsResultType:1];
    if ([v6 supportAutocompletePublisherResults]) {
      [(GEOPDClientMetadata *)v9 addSupportedMapsResultType:3];
    }
    if ([v6 supportAutocompleteGuideResults]) {
      [(GEOPDClientMetadata *)v9 addSupportedMapsResultType:2];
    }
    [(GEOPDPlaceRequest *)v7 setClientMetadata:v9];
    if ([v6 deviceDisplayLanguagesCount])
    {
      long long v10 = [v6 deviceDisplayLanguages];
      long long v11 = (void *)[v10 mutableCopy];
      [(GEOPDPlaceRequest *)v7 setDisplayLanguages:v11];
    }
    if ([v6 hasDeviceSpokenLocale])
    {
      long long v12 = [v6 deviceSpokenLocale];
      [(GEOPDPlaceRequest *)v7 addSpokenLanguage:v12];
    }
    if ([v6 hasDisplayRegion])
    {
      uint64_t v13 = [v6 displayRegion];
      [(GEOPDPlaceRequest *)v7 setDisplayRegion:v13];
    }
    [(GEOPDPlaceRequest *)v7 addRequestedComponentsForReason:2 traits:v6 count:v4];
    if ([v6 hasIsTourist])
    {
      uint64_t v14 = objc_alloc_init(GEOPDMapsSuggestionsTouristInfo);
      [v6 isTourist];
      if (v14)
      {
        *(unsigned char *)&v14->_flags |= 1u;
        v14->_isTourist = v15;
      }
      uint64_t v16 = [(GEOPDPlaceRequest *)v7 clientMetadata];
      [v16 setMapsSuggestionsTouristInfo:v14];
    }
    uint64_t v17 = v7;
  }
  return v7;
}

- (GEOPDPlaceRequest)initWithComponents:(id)a3 identifier:(id)a4 resultProviderID:(int)a5 traits:(id)a6
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a4;
  long long v12 = [(GEOPDPlaceRequest *)self _initWithTraits:a6 includeHistoricalLocations:0 supportedMapsResultTypes:0];
  if (v12)
  {
    long long v31 = 0u;
    long long v32 = 0u;
    long long v29 = 0u;
    long long v30 = 0u;
    id v28 = v10;
    id v13 = v10;
    uint64_t v14 = [v13 countByEnumeratingWithState:&v29 objects:v34 count:16];
    if (v14)
    {
      uint64_t v15 = v14;
      uint64_t v16 = *(void *)v30;
      do
      {
        for (uint64_t i = 0; i != v15; ++i)
        {
          if (*(void *)v30 != v16) {
            objc_enumerationMutation(v13);
          }
          uint64_t v18 = *(void **)(*((void *)&v29 + 1) + 8 * i);
          uint64_t v19 = [v18 intValue];
          uint64_t v20 = [v13 objectForKeyedSubscript:v18];
          uint64_t v21 = [v20 unsignedIntegerValue];

          long long v22 = [[GEOPDComponentInfo alloc] initWithType:v19 count:v21];
          [(GEOPDPlaceRequest *)v12 addRequestedComponent:v22];
        }
        uint64_t v15 = [v13 countByEnumeratingWithState:&v29 objects:v34 count:16];
      }
      while (v15);
    }

    long long v23 = [GEOPDPlaceRequestParameters alloc];
    id v33 = v11;
    long long v24 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v33 count:1];
    long long v25 = [(GEOPDPlaceRequestParameters *)v23 initWithIdentifiers:v24 resultProviderID:a5];

    [(GEOPDPlaceRequest *)v12 setPlaceRequestParameters:v25];
    [(GEOPDPlaceRequest *)v12 setRequestType:23];
    long long v26 = v12;

    id v10 = v28;
  }

  return v12;
}

- (GEOPDPlaceRequest)initWithIdentifiers:(id)a3 resultProviderID:(int)a4 traits:(id)a5
{
  uint64_t v6 = *(void *)&a4;
  id v8 = a3;
  id v9 = a5;
  id v10 = [(GEOPDPlaceRequest *)self _initWithTraits:v9 includeHistoricalLocations:1 supportedMapsResultTypes:&unk_1ED73F1A8];
  id v11 = v10;
  if (v10)
  {
    [(GEOPDPlaceRequest *)v10 addRequestedComponentsForReason:0 traits:v9 count:1];
    long long v12 = [[GEOPDPlaceRequestParameters alloc] initWithIdentifiers:v8 resultProviderID:v6];
    [(GEOPDPlaceRequest *)v11 setPlaceRequestParameters:v12];
    [(GEOPDPlaceRequest *)v11 setRequestType:23];
    id v13 = v11;
  }
  return v11;
}

- (GEOPDPlaceRequest)initWithExternalBusinessID:(id)a3 contentProvider:(id)a4 traits:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = [(GEOPDPlaceRequest *)self _initWithTraits:v10 includeHistoricalLocations:1 supportedMapsResultTypes:0];
  long long v12 = v11;
  if (v11)
  {
    [(GEOPDPlaceRequest *)v11 addRequestedComponentsForReason:0 traits:v10 count:1];
    id v13 = [[GEOPDPlaceRequestParameters alloc] initWithExternalBusinessID:v8 contentProvider:v9];
    [(GEOPDPlaceRequest *)v12 setPlaceRequestParameters:v13];
    [(GEOPDPlaceRequest *)v12 setRequestType:17];
    uint64_t v14 = v12;
  }
  return v12;
}

- (GEOPDPlaceRequest)initWithMerchantCode:(id)a3 rawMerchantCode:(id)a4 industryCategory:(id)a5 industryCode:(id)a6 paymentNetwork:(id)a7 transactionDate:(id)a8 transactionLocation:(id)a9 traits:(id)a10
{
  LODWORD(v11) = 0;
  return -[GEOPDPlaceRequest initWithMerchantCode:rawMerchantCode:relyingPartyIdentifier:industryCategory:industryCode:paymentNetwork:transactionDate:transactionLocation:terminalId:transactionCurrencyCode:transactionType:transactionId:warsawMerchantDomain:warsawMerchantName:warsawMerchantId:adamId:merchantId:merchantDoingBizAsName:merchantEnhancedName:merchantCity:merchantRawCity:merchantState:merchantRawState:merchantZip:merchantAddress:merchantRawAddress:merchantCountryCode:merchantType:merchantCleanConfidenceLevel:merchantAdditionalData:merchantCanl:fuzzyMatched:coarseLocationUsed:bankTransactionType:bankTransactionStatus:bankAnonymisedUserId:otherBankTransactionLocations:bankTransactionDescription:bankTransactionTimestamp:bankRawMerchantCode:bankIndustryCategory:bankIndustryCode:bankTransactionCurrencyCode:bankMerchantInfo:baaCerts:baaSignature:bankBrandMUIDFallbackEnabled:bankIdentifier:bankTransactionDescriptionClean:bankPIIRedactionIsApplied:bankRotationPeriodsSinceEpoch:traits:](self, "initWithMerchantCode:rawMerchantCode:relyingPartyIdentifier:industryCategory:industryCode:paymentNetwork:transactionDate:transactionLocation:terminalId:transactionCurrencyCode:transactionType:transactionId:warsawMerchantDomain:warsawMerchantName:warsawMerchantId:adamId:merchantId:merchantDoingBizAsName:merchantEnhancedName:merchantCity:merchantRawCity:merchantState:merchantRawState:merchantZip:merchantAddress:merchantRawAddress:merchantCountryCode:merchantType:merchantCleanConfidenceLevel:merchantAdditionalData:merchantCanl:fuzzyMatched:coarseLocationUsed:bankTransactionType:bankTransactionStatus:bankAnonymisedUserId:otherBankTransactionLocations:bankTransactionDescription:bankTransactionTimestamp:bankRawMerchantCode:bankIndustryCategory:bankIndustryCode:bankTransactionCurrencyCode:bankMerchantInfo:baaCerts:baaSignature:bankBrandMUIDFallbackEnabled:bankIdentifier:bankTransactionDescriptionClean:bankPIIRedactionIsApplied:bankRotationPeriodsSinceEpoch:traits:", a3, a4, 0, a5, a6, a7, a8, a9, 0,
           0,
           v11,
           0,
           0,
           0,
           0,
           0,
           0,
           0,
           0,
           0,
           0,
           0,
           0,
           0,
           0,
           0,
           0,
           0,
           0,
           0,
           0,
           0,
           0,
           0,
           0,
           0,
           0,
           0,
           0,
           0,
           0,
           0,
           0,
           0,
           0,
           0,
           0,
           0,
           0,
           0,
           a10);
}

- (GEOPDPlaceRequest)initWithMerchantCode:(id)a3 rawMerchantCode:(id)a4 relyingPartyIdentifier:(id)a5 industryCategory:(id)a6 industryCode:(id)a7 paymentNetwork:(id)a8 transactionDate:(id)a9 transactionLocation:(id)a10 terminalId:(id)a11 transactionCurrencyCode:(id)a12 transactionType:(int)a13 transactionId:(id)a14 warsawMerchantDomain:(id)a15 warsawMerchantName:(id)a16 warsawMerchantId:(id)a17 adamId:(id)a18 merchantId:(id)a19 merchantDoingBizAsName:(id)a20 merchantEnhancedName:(id)a21 merchantCity:(id)a22 merchantRawCity:(id)a23 merchantState:(id)a24 merchantRawState:(id)a25 merchantZip:(id)a26 merchantAddress:(id)a27 merchantRawAddress:(id)a28 merchantCountryCode:(id)a29 merchantType:(id)a30 merchantCleanConfidenceLevel:(id)a31 merchantAdditionalData:(id)a32 merchantCanl:(id)a33 fuzzyMatched:(id)a34 coarseLocationUsed:(id)a35 bankTransactionType:(int)a36 bankTransactionStatus:(int)a37 bankAnonymisedUserId:(id)a38 otherBankTransactionLocations:(id)a39 bankTransactionDescription:(id)a40 bankTransactionTimestamp:(id)a41 bankRawMerchantCode:(id)a42 bankIndustryCategory:(id)a43 bankIndustryCode:(id)a44 bankTransactionCurrencyCode:(id)a45 bankMerchantInfo:(id)a46 baaCerts:(id)a47 baaSignature:(id)a48 bankBrandMUIDFallbackEnabled:(id)a49 bankIdentifier:(id)a50 bankTransactionDescriptionClean:(id)a51 bankPIIRedactionIsApplied:(id)a52 bankRotationPeriodsSinceEpoch:(id)a53 traits:(id)a54
{
  id v120 = a3;
  id v119 = a4;
  id v118 = a5;
  id v117 = a6;
  id v116 = a7;
  id v114 = a8;
  id v112 = a9;
  id v111 = a10;
  id v110 = a11;
  id v109 = a12;
  id v108 = a14;
  id v107 = a15;
  id v57 = a16;
  id v106 = a17;
  id v104 = a18;
  id v105 = a19;
  id v101 = a20;
  id v103 = a21;
  id v102 = a22;
  id v58 = a23;
  id v89 = a24;
  id v85 = a25;
  id v87 = a26;
  id v100 = a27;
  id v99 = a28;
  id v98 = a29;
  id v97 = a30;
  id v96 = a31;
  id v95 = a32;
  id v94 = a33;
  id v93 = a34;
  id v92 = a35;
  id v91 = a38;
  id v90 = a39;
  id v88 = a40;
  id v59 = a41;
  id v82 = a42;
  id v80 = a43;
  id v86 = a44;
  id v60 = a45;
  id v79 = a46;
  id v61 = a47;
  id v62 = a48;
  id v84 = a49;
  id v83 = a50;
  id v63 = a51;
  id v81 = a52;
  id v64 = a53;
  id v65 = a54;
  long long v66 = [(GEOPDPlaceRequest *)self _initWithTraits:v65 includeHistoricalLocations:1 supportedMapsResultTypes:0];
  long long v67 = v66;
  if (v66)
  {
    uint64_t v77 = v66;
    [(GEOPDPlaceRequest *)v66 addRequestedComponentsForReason:0 traits:v65 count:1];
    if ([v65 hasSupportsBrandFallback]) {
      char v75 = [v65 supportsBrandFallback];
    }
    else {
      char v75 = 0;
    }
    if ([v65 hasIsSettlement]) {
      char v74 = [v65 isSettlement];
    }
    else {
      char v74 = 0;
    }
    id v76 = v57;
    if ([v65 hasIsRefund]) {
      char v73 = [v65 isRefund];
    }
    else {
      char v73 = 0;
    }
    BYTE2(v72) = v73;
    BYTE1(v72) = v74;
    LOBYTE(v72) = v75;
    LODWORD(v71) = a13;
    long long v68 = -[GEOPDPlaceRequestParameters initWithMerchantCode:rawMerchantCode:relyingPartyIdentifier:industryCategory:industryCode:paymentNetwork:transactionDate:transactionLocation:terminalId:transactionCurrencyCode:transactionType:transactionId:warsawMerchantDomain:warsawMerchantName:warsawMerchantId:adamId:merchantId:merchantDoingBizAsName:merchantEnhancedName:merchantCity:merchantRawCity:merchantState:merchantRawState:merchantZip:merchantAddress:merchantRawAddress:merchantCountryCode:merchantType:merchantCleanConfidenceLevel:merchantAdditionalData:merchantCanl:brandFallbackSupported:isSettlement:isRefund:fuzzyMatched:coarseLocationUsed:bankTransactionType:bankTransactionStatus:bankAnonymisedUserId:otherBankTransactionLocations:bankTransactionDescription:bankTransactionTimestamp:bankRawMerchantCode:bankIndustryCategory:bankIndustryCode:bankTransactionCurrencyCode:bankMerchantInfo:baaCerts:baaSignature:bankBrandMUIDFallbackEnabled:bankIdentifier:bankTransactionDescriptionClean:bankPIIRedactionIsApplied:bankRotationPeriodsSinceEpoch:traits:]([GEOPDPlaceRequestParameters alloc], "initWithMerchantCode:rawMerchantCode:relyingPartyIdentifier:industryCategory:industryCode:paymentNetwork:transactionDate:transactionLocation:terminalId:transactionCurrencyCode:transactionType:transactionId:warsawMerchantDomain:warsawMerchantName:warsawMerchantId:adamId:merchantId:merchantDoingBizAsName:merchantEnhancedName:merchantCity:merchantRawCity:merchantState:merchantRawState:merchantZip:merchantAddress:merchantRawAddress:merchantCountryCode:merchantType:merchantCleanConfidenceLevel:merchantAdditionalData:merchantCanl:brandFallbackSupported:isSettlement:isRefund:fuzzyMatched:coarseLocationUsed:bankTransactionType:bankTransactionStatus:bankAnonymisedUserId:otherBankTransactionLocations:bankTransactionDescription:bankTransactionTimestamp:bankRawMerchantCode:bankIndustryCategory:bankIndustryCode:bankTransactionCurrencyCode:bankMerchantInfo:baaCerts:baaSignature:bankBrandMUIDFallbackEnabled:bankIdentifier:bankTransactionDescriptionClean:bankPIIRedactionIsApplied:bankRotationPeriodsSinceEpoch:traits:", v120, v119, v118, v117, v116, v114, v112, v111,
            v110,
            v109,
            v71,
            v108,
            v107,
            v57,
            v106,
            v104,
            v105,
            v101,
            v103,
            v102,
            v58,
            v89,
            v85,
            v87,
            v100,
            v99,
            v98,
            v97,
            v96,
            v95,
            v94,
            v72,
            v93,
            v92,
            __PAIR64__(a37, a36),
            v91,
            v90,
            v88,
            v59,
            v82,
            v80,
            v86,
            v60,
            v79,
            v61,
            v62,
            v84,
            v83,
            v63,
            v81,
            v64,
            v65);
    long long v67 = v77;
    [(GEOPDPlaceRequest *)v77 setPlaceRequestParameters:v68];

    id v57 = v76;
    [(GEOPDPlaceRequest *)v77 setRequestType:6];
    id v69 = v77;
  }

  return v67;
}

- (GEOPDPlaceRequest)initWithAirportCode:(id)a3 terminalCode:(id)a4 gateCode:(id)a5 traits:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  uint64_t v14 = [(GEOPDPlaceRequest *)self _initWithTraits:v13 includeHistoricalLocations:1 supportedMapsResultTypes:0];
  uint64_t v15 = v14;
  if (v14)
  {
    [(GEOPDPlaceRequest *)v14 addRequestedComponentsForReason:0 traits:v13 count:1];
    uint64_t v16 = [[GEOPDPlaceRequestParameters alloc] initWithAirportCode:v10 terminalCode:v11 gateCode:v12 traits:v13];
    [(GEOPDPlaceRequest *)v15 setPlaceRequestParameters:v16];

    [(GEOPDPlaceRequest *)v15 setRequestType:48];
    uint64_t v17 = v15;
  }

  return v15;
}

- (GEOPDPlaceRequest)initWithExternalTransitStationCodes:(id)a3 sourceID:(id)a4 transactionDate:(id)a5 transactionLocation:(id)a6 traits:(id)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  id v16 = a7;
  uint64_t v17 = [(GEOPDPlaceRequest *)self _initWithTraits:v16 includeHistoricalLocations:1 supportedMapsResultTypes:0];
  if (v17)
  {
    -[GEOPDPlaceRequest addRequestedComponentsForReason:traits:count:](v17, "addRequestedComponentsForReason:traits:count:", 0, v16, [v12 count]);
    uint64_t v18 = [[GEOPDPlaceRequestParameters alloc] initWithExternalTransitStationCodes:v12 sourceID:v13 transactionDate:v14 transactionLocation:v15];
    [(GEOPDPlaceRequest *)v17 setPlaceRequestParameters:v18];
    [(GEOPDPlaceRequest *)v17 setRequestType:21];
    uint64_t v19 = v17;
  }
  return v17;
}

- (GEOPDPlaceRequest)initWithReverseGeocodeCoordinate:(id)a3 includeEntryPoints:(BOOL)a4 preserveOriginalLocation:(BOOL)a5 traits:(id)a6
{
  BOOL v6 = a5;
  BOOL v7 = a4;
  double var1 = a3.var1;
  double var0 = a3.var0;
  id v11 = a6;
  id v12 = [(GEOPDPlaceRequest *)self _initWithTraits:v11 includeHistoricalLocations:1 supportedMapsResultTypes:0];
  id v13 = v12;
  if (v12)
  {
    [(GEOPDPlaceRequest *)v12 addRequestedComponentsForReason:!v7 traits:v11 count:1];
    id v14 = -[GEOPDPlaceRequestParameters initWithReverseGeocodeCoordinate:preserveOriginalLocation:]([GEOPDPlaceRequestParameters alloc], "initWithReverseGeocodeCoordinate:preserveOriginalLocation:", v6, var0, var1);
    [(GEOPDPlaceRequest *)v13 setPlaceRequestParameters:v14];
    [(GEOPDPlaceRequest *)v13 setRequestType:4];
    id v15 = v13;
  }
  return v13;
}

- (GEOPDPlaceRequest)initWithReverseGeocodeCoordinate:(id)a3 floorOrdinal:(int)a4 includeEntryPoints:(BOOL)a5 preserveOriginalLocation:(BOOL)a6 traits:(id)a7
{
  BOOL v7 = a6;
  BOOL v8 = a5;
  uint64_t v9 = *(void *)&a4;
  double var1 = a3.var1;
  double var0 = a3.var0;
  id v13 = a7;
  id v14 = [(GEOPDPlaceRequest *)self _initWithTraits:v13 includeHistoricalLocations:1 supportedMapsResultTypes:0];
  id v15 = v14;
  if (v14)
  {
    [(GEOPDPlaceRequest *)v14 addRequestedComponentsForReason:!v8 traits:v13 count:1];
    id v16 = -[GEOPDPlaceRequestParameters initWithReverseGeocodeCoordinate:preserveOriginalLocation:floorOrdinal:]([GEOPDPlaceRequestParameters alloc], "initWithReverseGeocodeCoordinate:preserveOriginalLocation:floorOrdinal:", v7, v9, var0, var1);
    [(GEOPDPlaceRequest *)v15 setPlaceRequestParameters:v16];
    [(GEOPDPlaceRequest *)v15 setRequestType:4];
    uint64_t v17 = v15;
  }
  return v15;
}

- (GEOPDPlaceRequest)initWithBatchReverseGeocodeLocations:(id)a3 additionalPlaceTypes:(int *)a4 additionalPlaceTypesCount:(unint64_t)a5 traits:(id)a6
{
  id v10 = a3;
  id v11 = a6;
  id v12 = [(GEOPDPlaceRequest *)self _initWithTraits:v11 includeHistoricalLocations:1 supportedMapsResultTypes:&unk_1ED73F1C0];
  id v13 = v12;
  if (v12)
  {
    [(GEOPDPlaceRequest *)v12 addRequestedComponentsForReason:20 traits:v11 count:1];
    id v14 = [[GEOPDPlaceRequestParameters alloc] initWithBatchReverseGeocodeLocations:v10 additionalPlaceTypes:a4 additionalPlaceTypesCount:a5 traits:v11];
    [(GEOPDPlaceRequest *)v13 setPlaceRequestParameters:v14];
    [(GEOPDPlaceRequest *)v13 setRequestType:26];
    id v15 = v13;
  }
  return v13;
}

- (GEOPDPlaceRequest)initWithForwardGeocodeAddress:(id)a3 maxResults:(unsigned int)a4 traits:(id)a5
{
  uint64_t v6 = *(void *)&a4;
  id v8 = a3;
  id v9 = a5;
  id v10 = [(GEOPDPlaceRequest *)self _initWithTraits:v9 includeHistoricalLocations:1 supportedMapsResultTypes:0];
  id v11 = v10;
  if (v10)
  {
    [(GEOPDPlaceRequest *)v10 addRequestedComponentsForReason:0 traits:v9 count:v6];
    id v12 = [[GEOPDPlaceRequestParameters alloc] initWithForwardGeocodeAddress:v8 maxResults:v6 traits:v9];
    [(GEOPDPlaceRequest *)v11 setPlaceRequestParameters:v12];
    [(GEOPDPlaceRequest *)v11 setRequestType:2];
    id v13 = v11;
  }
  return v11;
}

- (GEOPDPlaceRequest)initWithForwardGeocodeAddressString:(id)a3 maxResults:(unsigned int)a4 traits:(id)a5
{
  uint64_t v6 = *(void *)&a4;
  id v8 = a3;
  id v9 = a5;
  id v10 = [(GEOPDPlaceRequest *)self _initWithTraits:v9 includeHistoricalLocations:1 supportedMapsResultTypes:0];
  id v11 = v10;
  if (v10)
  {
    [(GEOPDPlaceRequest *)v10 addRequestedComponentsForReason:0 traits:v9 count:v6];
    id v12 = [[GEOPDPlaceRequestParameters alloc] initWithForwardGeocodeAddressString:v8 maxResults:v6 traits:v9];
    [(GEOPDPlaceRequest *)v11 setPlaceRequestParameters:v12];
    [(GEOPDPlaceRequest *)v11 setRequestType:2];
    id v13 = v11;
  }
  return v11;
}

- (GEOPDPlaceRequest)initWithInitialRequestData:(id)a3 traits:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(GEOPDPlaceRequest *)self _initWithTraits:v7 includeHistoricalLocations:0 supportedMapsResultTypes:0];
  id v9 = v8;
  if (v8)
  {
    [(GEOPDPlaceRequest *)v8 addRequestedComponentsForReason:0 traits:v7 count:1];
    id v10 = [v6 placeRequestParameters];
    [(GEOPDPlaceRequest *)v9 setPlaceRequestParameters:v10];

    -[GEOPDPlaceRequest setRequestType:](v9, "setRequestType:", [v6 requestType]);
    id v11 = v9;
  }

  return v9;
}

- (GEOPDPlaceRequest)initWithPlaceRefinementParameters:(id)a3 traits:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(GEOPDPlaceRequest *)self _initWithTraits:v7 includeHistoricalLocations:1 supportedMapsResultTypes:0];
  id v9 = v8;
  if (v8)
  {
    [(GEOPDPlaceRequest *)v8 addRequestedComponentsForReason:0 traits:v7 count:1];
    id v10 = [[GEOPDPlaceRequestParameters alloc] initWithPlaceRefinementParameters:v6 traits:v7];
    [(GEOPDPlaceRequest *)v9 setPlaceRequestParameters:v10];
    [(GEOPDPlaceRequest *)v9 setRequestType:7];
    id v11 = v9;
  }
  return v9;
}

- (GEOPDPlaceRequest)initWithVendorSpecificPlaceRefinementParameters:(id)a3 traits:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(GEOPDPlaceRequest *)self _initWithTraits:v7 includeHistoricalLocations:1 supportedMapsResultTypes:0];
  id v9 = v8;
  if (v8)
  {
    [(GEOPDPlaceRequest *)v8 addRequestedComponentsForReason:0 traits:v7 count:1];
    id v10 = [[GEOPDPlaceRequestParameters alloc] initWithVendorSpecificPlaceRefinementParameters:v6 traits:v7];
    [(GEOPDPlaceRequest *)v9 setPlaceRequestParameters:v10];
    [(GEOPDPlaceRequest *)v9 setRequestType:17];
    id v11 = v9;
  }
  return v9;
}

- (GEOPDPlaceRequest)initWithBrandMUID:(unint64_t)a3 traits:(id)a4
{
  id v6 = a4;
  id v7 = [(GEOPDPlaceRequest *)self _initWithTraits:v6 includeHistoricalLocations:1 supportedMapsResultTypes:0];
  id v8 = v7;
  if (v7)
  {
    [(GEOPDPlaceRequest *)v7 addRequestedComponentsForReason:0 traits:v6 count:1];
    id v9 = [[GEOPDPlaceRequestParameters alloc] initWithBrandMUID:a3 traits:v6];
    [(GEOPDPlaceRequest *)v8 setPlaceRequestParameters:v9];
    [(GEOPDPlaceRequest *)v8 setRequestType:1];
    id v10 = v8;
  }
  return v8;
}

- (id)_initWithTransitScheduleRequestForStation:(unint64_t)a3 line:(unint64_t)a4 referenceTripId:(unint64_t)a5 includeAllDirectionNames:(BOOL)a6 routingParameters:(id)a7 traits:(id)a8
{
  BOOL v9 = a6;
  id v14 = a7;
  id v15 = [(GEOPDPlaceRequest *)self _initWithTraits:a8 includeHistoricalLocations:1 supportedMapsResultTypes:0];
  if (v15)
  {
    id v16 = objc_alloc_init(GEOPDPlaceRequestParameters);
    uint64_t v17 = objc_alloc_init(GEOPBTransitScheduleLookupParameters);
    -[GEOPDPlaceRequestParameters setTransitScheduleLookupParameter:]((uint64_t)v16, v17);
    [(GEOPBTransitScheduleLookupParameters *)v17 setLineId:a4];
    [(GEOPBTransitScheduleLookupParameters *)v17 setReferenceTripId:a5];
    [(GEOPBTransitScheduleLookupParameters *)v17 setTransitId:a3];
    [(GEOPBTransitScheduleLookupParameters *)v17 setRoutingParameters:v14];
    [(GEOPBTransitScheduleLookupParameters *)v17 setIncludeAllHeadsigns:1];
    [(GEOPBTransitScheduleLookupParameters *)v17 setIncludeAllDirectionNames:v9];
    [v15 setPlaceRequestParameters:v16];
    [v15 setRequestType:39];
    id v18 = v15;
  }
  return v15;
}

- (GEOPDPlaceRequest)initWithTransitScheduleAtStation:(unint64_t)a3 line:(unint64_t)a4 referenceTripId:(unint64_t)a5 includeAllDirectionNames:(BOOL)a6 routingParameters:(id)a7 traits:(id)a8
{
  BOOL v9 = a6;
  id v14 = a8;
  id v15 = [(GEOPDPlaceRequest *)self _initWithTransitScheduleRequestForStation:a3 line:a4 referenceTripId:a5 includeAllDirectionNames:v9 routingParameters:a7 traits:v14];
  id v16 = v15;
  if (v15)
  {
    [(GEOPDPlaceRequest *)v15 addRequestedComponentsForReason:4 traits:v14 count:1];
    uint64_t v17 = v16;
  }

  return v16;
}

- (GEOPDPlaceRequest)initWithUpdatedTransitScheduleDetailsAtStation:(unint64_t)a3 line:(unint64_t)a4 referenceTripId:(unint64_t)a5 includeAllDirectionNames:(BOOL)a6 routingParameters:(id)a7 traits:(id)a8
{
  BOOL v9 = a6;
  id v14 = a8;
  id v15 = [(GEOPDPlaceRequest *)self _initWithTransitScheduleRequestForStation:a3 line:a4 referenceTripId:a5 includeAllDirectionNames:v9 routingParameters:a7 traits:v14];
  id v16 = v15;
  if (v15) {
    [(GEOPDPlaceRequest *)v15 addRequestedComponentsForReason:5 traits:v14 count:1];
  }

  return v16;
}

- (GEOPDPlaceRequest)initWithTransitTripDetailsAtStation:(unint64_t)a3 line:(unint64_t)a4 referenceTripId:(unint64_t)a5 includeAllDirectionNames:(BOOL)a6 routingParameters:(id)a7 traits:(id)a8
{
  BOOL v9 = a6;
  id v14 = a8;
  id v15 = [(GEOPDPlaceRequest *)self _initWithTransitScheduleRequestForStation:a3 line:a4 referenceTripId:a5 includeAllDirectionNames:v9 routingParameters:a7 traits:v14];
  id v16 = v15;
  if (v15) {
    [(GEOPDPlaceRequest *)v15 addRequestedComponentsForReason:6 traits:v14 count:1];
  }

  return v16;
}

- (GEOPDPlaceRequest)initWithTransitDeparturesAtStation:(unint64_t)a3 line:(unint64_t)a4 referenceTripId:(unint64_t)a5 includeAllDirectionNames:(BOOL)a6 routingParameters:(id)a7 traits:(id)a8
{
  BOOL v9 = a6;
  id v14 = a8;
  id v15 = [(GEOPDPlaceRequest *)self _initWithTransitScheduleRequestForStation:a3 line:a4 referenceTripId:a5 includeAllDirectionNames:v9 routingParameters:a7 traits:v14];
  id v16 = v15;
  if (v15) {
    [(GEOPDPlaceRequest *)v15 addRequestedComponentsForReason:7 traits:v14 count:1];
  }

  return v16;
}

- (GEOPDPlaceRequest)initWithNearbyTransitDeparturesWithLookupOrigin:(id)a3 userLocation:(id)a4 traits:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = [(GEOPDPlaceRequest *)self _initWithTraits:v10 includeHistoricalLocations:1 supportedMapsResultTypes:0];
  id v12 = v11;
  if (v11)
  {
    [(GEOPDPlaceRequest *)v11 addRequestedComponentsForReason:21 traits:v10 count:1];
    id v13 = objc_alloc_init(GEOPDPlaceRequestParameters);
    id v14 = objc_alloc_init(GEOWaypointLocation);
    id v22 = v8;
    [(GEOWaypointLocation *)v14 setLocation:v8];
    id v15 = objc_alloc_init(GEOWaypointTyped);
    [(GEOWaypointTyped *)v15 setWaypointLocation:v14];
    [(GEOWaypointTyped *)v15 setWaypointType:4];
    id v16 = objc_alloc_init(GEOPDTransitNearbyScheduleLookupOrigin);
    -[GEOPDTransitNearbyScheduleLookupOrigin setWaypointTyped:]((uint64_t)v16, v15);
    uint64_t v17 = objc_alloc_init(GEOPDTransitNearbyScheduleLookupParameters);
    -[GEOPDTransitNearbyScheduleLookupParameters addTransitNearbyScheduleLookupOrigin:]((uint64_t)v17, v16);
    if (v9)
    {
      id v18 = objc_alloc_init(GEOWaypointLocation);
      [(GEOWaypointLocation *)v18 setLocation:v9];
      uint64_t v19 = objc_alloc_init(GEOWaypointTyped);
      [(GEOWaypointTyped *)v19 setWaypointLocation:v18];
      [(GEOWaypointTyped *)v19 setWaypointType:4];
      -[GEOPDTransitNearbyScheduleLookupParameters setUserLocation:]((uint64_t)v17, v19);
    }
    -[GEOPDPlaceRequestParameters setTransitNearbyScheduleLookupParameters:]((uint64_t)v13, v17);
    [(GEOPDPlaceRequest *)v12 setPlaceRequestParameters:v13];
    [(GEOPDPlaceRequest *)v12 setRequestType:50];
    uint64_t v20 = v12;

    id v8 = v22;
  }

  return v12;
}

- (id)initForNearbyTransitPaymentLookupAtLocations:(id)a3 traits:(id)a4
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  id v8 = [(GEOPDPlaceRequest *)self _initWithTraits:v7 includeHistoricalLocations:1 supportedMapsResultTypes:0];
  id v9 = v8;
  if (v8)
  {
    id v22 = v8;
    [v8 addRequestedComponentsForReason:26 traits:v7 count:1];
    uint64_t v21 = objc_alloc_init(GEOPDPlaceRequestParameters);
    id v10 = objc_alloc_init(GEOPDTransitNearbyPaymentMethodLookupParameters);
    long long v25 = 0u;
    long long v26 = 0u;
    long long v27 = 0u;
    long long v28 = 0u;
    id v23 = v6;
    obuint64_t j = v6;
    uint64_t v11 = [obj countByEnumeratingWithState:&v25 objects:v29 count:16];
    if (v11)
    {
      uint64_t v12 = v11;
      uint64_t v13 = *(void *)v26;
      do
      {
        for (uint64_t i = 0; i != v12; ++i)
        {
          if (*(void *)v26 != v13) {
            objc_enumerationMutation(obj);
          }
          uint64_t v15 = *(void *)(*((void *)&v25 + 1) + 8 * i);
          id v16 = objc_alloc_init(GEOWaypointLocation);
          [(GEOWaypointLocation *)v16 setLocation:v15];
          uint64_t v17 = objc_alloc_init(GEOWaypointTyped);
          [(GEOWaypointTyped *)v17 setWaypointLocation:v16];
          [(GEOWaypointTyped *)v17 setWaypointType:4];
          id v18 = objc_alloc_init(GEOPDTransitNearbyPaymentMethodLookupOrigin);
          -[GEOPDTransitNearbyPaymentMethodLookupOrigin setWaypointTyped:]((uint64_t)v18, v17);
          -[GEOPDTransitNearbyPaymentMethodLookupParameters addTransitNearbyPaymentMethodLookupOrigin:]((uint64_t)v10, v18);
        }
        uint64_t v12 = [obj countByEnumeratingWithState:&v25 objects:v29 count:16];
      }
      while (v12);
    }

    -[GEOPDPlaceRequestParameters setTransitNearbyPaymentMethodLookupParameters:]((uint64_t)v21, v10);
    id v9 = v22;
    [v22 setPlaceRequestParameters:v21];
    [v22 setRequestType:57];
    id v19 = v22;

    id v6 = v23;
  }

  return v9;
}

- (GEOPDPlaceRequest)initWithTripIds:(id)a3 traits:(id)a4
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  id v8 = [(GEOPDPlaceRequest *)self _initWithTraits:v7 includeHistoricalLocations:1 supportedMapsResultTypes:0];
  id v9 = v8;
  if (v8)
  {
    [(GEOPDPlaceRequest *)v8 addRequestedComponentsForReason:0 traits:v7 count:1];
    id v10 = objc_alloc_init(GEOPDTransitVehiclePositionParameters);
    long long v19 = 0u;
    long long v20 = 0u;
    long long v21 = 0u;
    long long v22 = 0u;
    id v11 = v6;
    uint64_t v12 = [v11 countByEnumeratingWithState:&v19 objects:v23 count:16];
    if (v12)
    {
      uint64_t v13 = v12;
      uint64_t v14 = *(void *)v20;
      do
      {
        uint64_t v15 = 0;
        do
        {
          if (*(void *)v20 != v14) {
            objc_enumerationMutation(v11);
          }
          objc_msgSend(*(id *)(*((void *)&v19 + 1) + 8 * v15), "unsignedLongLongValue", (void)v19);
          if (v10) {
            PBRepeatedUInt64Add();
          }
          ++v15;
        }
        while (v13 != v15);
        uint64_t v13 = [v11 countByEnumeratingWithState:&v19 objects:v23 count:16];
      }
      while (v13);
    }

    id v16 = objc_alloc_init(GEOPDPlaceRequestParameters);
    -[GEOPDPlaceRequestParameters setTransitVehiclePositionParameters:]((uint64_t)v16, v10);
    [(GEOPDPlaceRequest *)v9 setPlaceRequestParameters:v16];
    [(GEOPDPlaceRequest *)v9 setRequestType:37];
    uint64_t v17 = v9;
  }
  return v9;
}

- (GEOPDPlaceRequest)initWithCanonicalLocationSearchQueryString:(id)a3 traits:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(GEOPDPlaceRequest *)self _initWithTraits:v7 includeHistoricalLocations:1 supportedMapsResultTypes:0];
  id v9 = v8;
  if (v8)
  {
    [(GEOPDPlaceRequest *)v8 addRequestedComponentsForReason:0 traits:v7 count:1];
    id v10 = [[GEOPDPlaceRequestParameters alloc] initWithCanonicalLocationSearchQueryString:v6];
    [(GEOPDPlaceRequest *)v9 setPlaceRequestParameters:v10];
    [(GEOPDPlaceRequest *)v9 setRequestType:3];
    id v11 = v9;
  }
  return v9;
}

- (GEOPDPlaceRequest)initWithGeoMapItemIdentifier:(id)a3 categoryID:(id)a4 maxResults:(unsigned int)a5 traits:(id)a6 searchSessionData:(id)a7
{
  uint64_t v8 = *(void *)&a5;
  id v12 = a7;
  id v13 = a6;
  id v14 = a4;
  id v15 = a3;
  id v16 = [(GEOPDPlaceRequest *)self _initWithTraits:v13 includeHistoricalLocations:0 supportedMapsResultTypes:MEMORY[0x1E4F1CBF0]];
  [(GEOPDPlaceRequest *)v16 addRequestedComponentsForReason:0 traits:v13 count:v8];
  uint64_t v17 = objc_alloc_init(GEOPDPlaceRequestParameters);
  id v18 = [[GEOPDSearchParameters alloc] initWithGeoMapItemIdentifier:v15 categoryID:v14 maxResults:v8 traits:v13 searchSessionData:v12];

  -[GEOPDPlaceRequestParameters setSearchParameters:]((uint64_t)v17, v18);
  [(GEOPDPlaceRequest *)v16 setPlaceRequestParameters:v17];
  [(GEOPDPlaceRequest *)v16 setRequestType:1];

  return v16;
}

- (GEOPDPlaceRequest)initWithSearchQuery:(id)a3 entryMetadata:(id)a4 metadata:(id)a5 autocompleteEntry:(id)a6 retainedSearch:(id)a7 maxResults:(unsigned int)a8 filters:(id)a9 suppressResultsRequiringAttribution:(BOOL)a10 traits:(id)a11 routeInfo:(id)a12 error:(id *)a13 searchSessionData:(id)a14
{
  uint64_t v14 = *(void *)&a8;
  id v37 = a3;
  id v20 = a4;
  id v36 = a5;
  id v21 = a6;
  id v22 = a7;
  id v23 = a9;
  id v24 = a11;
  id v25 = a12;
  id v26 = a14;
  id v27 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  [v27 addObject:&unk_1ED73EB60];
  if (![v24 searchOriginationType])
  {
    [v27 addObject:&unk_1ED73EB18];
    [v27 addObject:&unk_1ED73EB30];
  }
  id v28 = [(GEOPDPlaceRequest *)self _initWithTraits:v24 includeHistoricalLocations:1 supportedMapsResultTypes:v27];
  long long v29 = v28;
  if (v28)
  {
    if (v21) {
      uint64_t v30 = 3;
    }
    else {
      uint64_t v30 = 0;
    }
    [v28 addRequestedComponentsForReason:v30 traits:v24 count:v14];
    id v35 = v22;
    long long v31 = [[GEOPDPlaceRequestParameters alloc] initWithSearchQuery:v37 entryMetadata:v20 metadata:v36 autocompleteEntry:v21 retainedSearch:v22 maxResults:v14 filters:v23 traits:v24 routeInfo:v25 error:a13 searchSessionData:v26];
    if (v31)
    {
      [v29 setPlaceRequestParameters:v31];
      if (a10) {
        [v29 setSuppressResultsRequiringAttribution:1];
      }
      if ([v24 optimizeSearchRequestComponents])
      {
        long long v32 = [(id)objc_opt_class() createRequestedComponentsForReason:31 traits:v24 count:v14];
        [v29 addPartiallyComposedSearchResultRequestedComponents:v32];
      }
      [v29 setRequestType:1];
      id v33 = v29;
    }
    else
    {
      id v33 = 0;
    }

    id v22 = v35;
  }
  else
  {
    id v33 = 0;
  }

  return v33;
}

- (GEOPDPlaceRequest)initWithSearchURLQuery:(id)a3 identifier:(id)a4 resultProviderId:(int)a5 contentProvider:(id)a6 maxResults:(unsigned int)a7 traits:(id)a8
{
  uint64_t v9 = *(void *)&a7;
  uint64_t v11 = *(void *)&a5;
  id v14 = a3;
  id v15 = a4;
  id v16 = a6;
  id v17 = a8;
  id v18 = [(GEOPDPlaceRequest *)self _initWithTraits:v17 includeHistoricalLocations:1 supportedMapsResultTypes:0];
  long long v19 = v18;
  if (v18)
  {
    [(GEOPDPlaceRequest *)v18 addRequestedComponentsForReason:0 traits:v17 count:v9];
    if (v16 && [v16 length])
    {
      id v20 = [GEOPDPlaceRequestParameters alloc];
      [v15 coordinate];
      id v23 = -[GEOPDPlaceRequestParameters initWithSearchURLQuery:coordinate:muid:resultProviderId:contentProvider:](v20, "initWithSearchURLQuery:coordinate:muid:resultProviderId:contentProvider:", v14, [v15 muid], v11, v16, v21, v22);
      uint64_t v24 = 17;
    }
    else
    {
      id v23 = [[GEOPDPlaceRequestParameters alloc] initWithSearchURLQuery:v14 identifier:v15];
      uint64_t v24 = 7;
    }
    [(GEOPDPlaceRequest *)v19 setPlaceRequestParameters:v23];
    [(GEOPDPlaceRequest *)v19 setRequestType:v24];
    id v25 = v19;
  }
  return v19;
}

- (GEOPDPlaceRequest)initWithSearchURLQuery:(id)a3 coordinate:(id)a4 maxResults:(unsigned int)a5 traits:(id)a6
{
  uint64_t v7 = *(void *)&a5;
  double var1 = a4.var1;
  double var0 = a4.var0;
  id v11 = a3;
  id v12 = a6;
  id v13 = [(GEOPDPlaceRequest *)self _initWithTraits:v12 includeHistoricalLocations:1 supportedMapsResultTypes:0];
  id v14 = v13;
  if (v13)
  {
    [(GEOPDPlaceRequest *)v13 addRequestedComponentsForReason:0 traits:v12 count:v7];
    id v15 = -[GEOPDPlaceRequestParameters initWithSearchURLQuery:coordinate:maxResults:traits:]([GEOPDPlaceRequestParameters alloc], "initWithSearchURLQuery:coordinate:maxResults:traits:", v11, v7, v12, var0, var1);
    [(GEOPDPlaceRequest *)v14 setPlaceRequestParameters:v15];
    [(GEOPDPlaceRequest *)v14 setRequestType:9];
    id v16 = v14;
  }
  return v14;
}

- (GEOPDPlaceRequest)initWithAutocompleteFragment:(id)a3 type:(int)a4 traits:(id)a5 filters:(id)a6 retainedSearch:(id)a7 tappedQuerySuggestion:(id)a8 sessionData:(id)a9 error:(id *)a10
{
  uint64_t v14 = *(void *)&a4;
  uint64_t v76 = *MEMORY[0x1E4F143B8];
  id v16 = a3;
  id v17 = a5;
  id v18 = a6;
  id v19 = a7;
  id v20 = a8;
  id v21 = a9;
  id v22 = [(GEOPDPlaceRequest *)self initForAutocompleteWithTraits:v17 count:0x7FFFFFFFLL];
  id v23 = v22;
  if (v22)
  {
    id v70 = v20;
    [v22 setRequestType:10];
    uint64_t v24 = objc_alloc_init(GEOPDAutocompleteParameters);
    [(GEOPDAutocompleteParameters *)v24 setRequestType:v14];
    if (v21)
    {
      [(GEOPDAutocompleteParameters *)v24 setSupportAutocompleteSessionData:1];
      id v25 = [v21 autocompleteSessionData];
      [(GEOPDAutocompleteParameters *)v24 setAutocompleteSessionData:v25];
    }
    long long v68 = v21;
    id v69 = v19;
    switch((int)v14)
    {
      case 0:
        id v26 = objc_alloc_init(GEOPDAutocompleteParametersFullEntriesOnly);
        id v27 = +[GEOPDViewportInfo viewportInfoForTraits:v17];
        [(GEOPDAutocompleteParametersFullEntriesOnly *)v26 setViewportInfo:v27];

        [(GEOPDAutocompleteParametersFullEntriesOnly *)v26 setQuery:v16];
        [(GEOPDAutocompleteParameters *)v24 setFullEntries:v26];
        goto LABEL_53;
      case 1:
        id v26 = objc_alloc_init(GEOPDAutocompleteParametersAllEntries);
        uint64_t v30 = +[GEOPDViewportInfo viewportInfoForTraits:v17];
        [(GEOPDAutocompleteParametersFullEntriesOnly *)v26 setViewportInfo:v30];

        [(GEOPDAutocompleteParametersFullEntriesOnly *)v26 setQuery:v16];
        [(GEOPDAutocompleteParameters *)v24 setAllEntries:v26];
        goto LABEL_53;
      case 2:
        id v26 = objc_alloc_init(GEOPDAutocompleteParametersLocalitiesAndLandmarks);
        long long v31 = +[GEOPDViewportInfo viewportInfoForTraits:v17];
        [(GEOPDAutocompleteParametersFullEntriesOnly *)v26 setViewportInfo:v31];

        [(GEOPDAutocompleteParametersFullEntriesOnly *)v26 setQuery:v16];
        [(GEOPDAutocompleteParameters *)v24 setLocalitiesAndLandmarks:v26];
        goto LABEL_53;
      case 3:
        id v26 = objc_alloc_init(GEOPDAutocompleteParametersAllEntriesWithBrowse);
        long long v32 = +[GEOPDViewportInfo viewportInfoForTraits:v17];
        [(GEOPDAutocompleteParametersFullEntriesOnly *)v26 setViewportInfo:v32];

        [(GEOPDAutocompleteParametersFullEntriesOnly *)v26 setQuery:v16];
        id v33 = objc_alloc_init(GEOPDAutocompleteOriginationInfo);
        unsigned int v34 = [v17 devicePlatform] - 1;
        id v35 = v18;
        if (v34 > 3) {
          uint64_t v36 = 0;
        }
        else {
          uint64_t v36 = dword_18A640CF0[v34];
        }
        [(GEOPDAutocompleteOriginationInfo *)v33 setClientSoftwarePlatform:v36];
        -[GEOPDAutocompleteOriginationInfo setAutocompleteOriginationType:](v33, "setAutocompleteOriginationType:", [v23 autocompleteOriginationTypeFromTraits:v17]);
        if ([(GEOPDAutocompleteOriginationInfo *)v33 autocompleteOriginationType] == 1)
        {
          long long v41 = objc_alloc_init(GEOPDAutocompleteOriginationRoutePlanningParameters);
          long long v42 = [v17 autocompleteOriginationPreviousLatlng];
          [(GEOPDAutocompleteOriginationRoutePlanningParameters *)v41 setPreviousLocation:v42];

          -[GEOPDAutocompleteOriginationRoutePlanningParameters setIsEditServerRecommendedStop:](v41, "setIsEditServerRecommendedStop:", [v17 autocompleteOriginationEditingServerWaypoints]);
          -[GEOPDAutocompleteOriginationRoutePlanningParameters setIsRoutePlanningEditStopFillRequest:](v41, "setIsRoutePlanningEditStopFillRequest:", [v17 isRoutePlanningEditStopFillRequest]);
          [(GEOPDAutocompleteOriginationInfo *)v33 setRoutePlanningParameters:v41];
        }
        [(GEOPDAutocompleteParametersFullEntriesOnly *)v26 setAutocompleteOriginationInfo:v33];
        int v43 = [v17 navigating];
        if (v69) {
          -[GEOPDAutocompleteParametersFullEntriesOnly setRetainedSearch:](v26, "setRetainedSearch:");
        }
        [(GEOPDAutocompleteParametersFullEntriesOnly *)v26 setInterleaveCategorySuggestions:1];
        long long v44 = [v17 venueIdentifier];
        [(GEOPDAutocompleteParametersFullEntriesOnly *)v26 setVenueIdentifier:v44];

        -[GEOPDAutocompleteParametersFullEntriesOnly setSupportDirectionIntentSuggestions:](v26, "setSupportDirectionIntentSuggestions:", [v17 supportDirectionIntentAutocomplete] & (v43 ^ 1));
        -[GEOPDAutocompleteParametersFullEntriesOnly setSupportUnresolvedDirectionIntent:](v26, "setSupportUnresolvedDirectionIntent:", [v17 supportUnresolvedDirectionIntent] & (v43 ^ 1));
        if ([v70 conformsToProtocol:&unk_1ED77CBD0])
        {
          long long v45 = [v70 _placeDataAutocompleteEntry];
          [(GEOPDAutocompleteParametersFullEntriesOnly *)v26 setQuerySuggestionEntry:v45];
        }
        if ([v17 supportedAutocompleteListTypesCount])
        {
          unint64_t v46 = 0;
          do
          {
            uint64_t v47 = [v17 supportedAutocompleteListTypeAtIndex:v46];
            if (v47 <= 2) {
              [(GEOPDAutocompleteParametersFullEntriesOnly *)v26 addSupportedListType:v47];
            }
            ++v46;
          }
          while (v46 < [v17 supportedAutocompleteListTypesCount]);
        }
        -[GEOPDAutocompleteParametersFullEntriesOnly setSupportClientRankingFeatureMetadata:](v26, "setSupportClientRankingFeatureMetadata:", [v17 supportClientRankingFeatureMetadata]);
        -[GEOPDAutocompleteParametersFullEntriesOnly setSupportSectionHeader:](v26, "setSupportSectionHeader:", [v17 autocompleteRequestSupportsSectionHeader]);
        if ([v17 supportedAutocompleteResultCellTypesCount])
        {
          unint64_t v48 = 0;
          do
          {
            uint64_t v49 = [v17 supportedAutocompleteResultCellTypeAtIndex:v48];
            switch((int)v49)
            {
              case 0:
              case 3:
                goto LABEL_31;
              case 1:
              case 2:
              case 4:
                if ((v43 & 1) == 0) {
LABEL_31:
                }
                  [(GEOPDAutocompleteParametersFullEntriesOnly *)v26 addSupportedAutocompleteResultCellType:v49];
                break;
              default:
                break;
            }
            ++v48;
          }
          while (v48 < objc_msgSend(v17, "supportedAutocompleteResultCellTypesCount", v49));
        }
        -[GEOPDAutocompleteParametersFullEntriesOnly setPlaceSummaryRevision:](v26, "setPlaceSummaryRevision:", [v17 placeSummaryRevision]);
        if ((v43 & 1) == 0 && [v17 knownRefinementTypesCount])
        {
          unint64_t v50 = 0;
          do
          {
            unsigned int v51 = [v17 knownRefinementTypeAtIndex:v50] - 1;
            if (v51 > 4) {
              uint64_t v52 = 0;
            }
            else {
              uint64_t v52 = dword_18A640D2C[v51];
            }
            [(GEOPDAutocompleteParametersFullEntriesOnly *)v26 addKnownRefinementType:v52];
            ++v50;
          }
          while (v50 < [v17 knownRefinementTypesCount]);
        }
        if ([v17 supportedPlaceSummaryFormatTypesCount])
        {
          unint64_t v53 = 0;
          do
          {
            unsigned int v54 = [v17 supportedPlaceSummaryFormatTypeAtIndex:v53];
            if (v54 - 1 >= 4) {
              uint64_t v55 = 0;
            }
            else {
              uint64_t v55 = v54;
            }
            [(GEOPDAutocompleteParametersFullEntriesOnly *)v26 addSupportedPlaceSummaryFormatType:v55];
            ++v53;
          }
          while (v53 < [v17 supportedPlaceSummaryFormatTypesCount]);
        }
        [(GEOPDAutocompleteParametersFullEntriesOnly *)v26 addSupportedHighlightType:0];
        [(GEOPDAutocompleteParametersFullEntriesOnly *)v26 addSupportedHighlightType:1];
        [(GEOPDAutocompleteParametersFullEntriesOnly *)v26 addSupportedHighlightType:2];
        long long v56 = [v17 evChargingPorts];
        if ([v56 count])
        {
        }
        else
        {
          uint64_t v57 = [v17 preferredBrandsCount];

          if (!v57) {
            goto LABEL_52;
          }
        }
        id v58 = objc_alloc_init(GEOPDSSearchEvChargingParameters);
        id v59 = [v17 evChargingPorts];
        -[GEOPDSSearchEvChargingParameters setPorts:]((uint64_t)v58, v59);

        if ([v17 preferredBrandsCount]) {
          -[GEOPDSSearchEvChargingParameters setPreferredBrands:count:]((uint64_t)v58, [v17 preferredBrands], objc_msgSend(v17, "preferredBrandsCount"));
        }
        [(GEOPDAutocompleteParametersFullEntriesOnly *)v26 setEvChargingParameters:v58];

LABEL_52:
        -[GEOPDAutocompleteParametersFullEntriesOnly setSupportClientRankingCompositeFeatures:](v26, "setSupportClientRankingCompositeFeatures:", [v17 supportClientRankingCompositeFeatures]);
        -[GEOPDAutocompleteParametersFullEntriesOnly setSupportStructuredRapAffordance:](v26, "setSupportStructuredRapAffordance:", [v17 supportStructuredRapAffordance]);
        [(GEOPDAutocompleteParameters *)v24 setAllEntriesWithBrowse:v26];
        [(GEOPDAutocompleteParameters *)v24 setShouldPopulateMapsIdentifier:1];

        id v18 = v35;
LABEL_53:

LABEL_54:
        id v60 = v16;
        long long v73 = 0u;
        long long v74 = 0u;
        long long v71 = 0u;
        long long v72 = 0u;
        id v28 = v18;
        id v61 = (GEOPDPlaceRequestParameters *)v18;
        uint64_t v62 = [(GEOPDPlaceRequestParameters *)v61 countByEnumeratingWithState:&v71 objects:v75 count:16];
        if (!v62) {
          goto LABEL_62;
        }
        uint64_t v63 = v62;
        uint64_t v64 = *(void *)v72;
        break;
      case 5:
        id v26 = objc_alloc_init(GEOPDAutocompleteParametersAddressOnly);
        id v37 = +[GEOPDViewportInfo viewportInfoForTraits:v17];
        [(GEOPDAutocompleteParametersFullEntriesOnly *)v26 setViewportInfo:v37];

        [(GEOPDAutocompleteParametersFullEntriesOnly *)v26 setQuery:v16];
        [(GEOPDAutocompleteParameters *)v24 setAddressOnly:v26];
        goto LABEL_53;
      case 7:
        id v26 = objc_alloc_init(GEOPDAutocompleteParametersBrandProfileSearch);
        id v38 = +[GEOPDViewportInfo viewportInfoForTraits:v17];
        [(GEOPDAutocompleteParametersFullEntriesOnly *)v26 setViewportInfo:v38];

        [(GEOPDAutocompleteParametersFullEntriesOnly *)v26 setQuery:v16];
        [(GEOPDAutocompleteParameters *)v24 setBrandProfileSearch:v26];
        goto LABEL_53;
      case 8:
        id v26 = objc_alloc_init(GEOPDAutocompleteParametersOfflineRegionSearch);
        long long v39 = +[GEOPDViewportInfo viewportInfoForTraits:v17];
        [(GEOPDAutocompleteParametersFullEntriesOnly *)v26 setViewportInfo:v39];

        [(GEOPDAutocompleteParametersFullEntriesOnly *)v26 setQuery:v16];
        [(GEOPDAutocompleteParameters *)v24 setOfflineRegionSearch:v26];
        goto LABEL_53;
      case 9:
        id v26 = objc_alloc_init(GEOPDAutocompleteParametersPoiAddressOnly);
        long long v40 = +[GEOPDViewportInfo viewportInfoForTraits:v17];
        [(GEOPDAutocompleteParametersFullEntriesOnly *)v26 setViewportInfo:v40];

        [(GEOPDAutocompleteParametersFullEntriesOnly *)v26 setQuery:v16];
        [(GEOPDAutocompleteParameters *)v24 setPoiAddressOnly:v26];
        goto LABEL_53;
      default:
        goto LABEL_54;
    }
    while (2)
    {
      for (uint64_t i = 0; i != v63; ++i)
      {
        if (*(void *)v72 != v64) {
          objc_enumerationMutation(v61);
        }
        if (![*(id *)(*((void *)&v71 + 1) + 8 * i) applyToAutocompleteParameters:v24 error:a10])
        {
          long long v29 = 0;
          id v16 = v60;
          id v21 = v68;
          goto LABEL_66;
        }
      }
      uint64_t v63 = [(GEOPDPlaceRequestParameters *)v61 countByEnumeratingWithState:&v71 objects:v75 count:16];
      if (v63) {
        continue;
      }
      break;
    }
LABEL_62:

    id v21 = v68;
    if (v68)
    {
      [(GEOPDAutocompleteParameters *)v24 setSupportAutocompleteSessionData:1];
      long long v66 = [v68 autocompleteSessionData];
      [(GEOPDAutocompleteParameters *)v24 setAutocompleteSessionData:v66];
    }
    id v61 = objc_alloc_init(GEOPDPlaceRequestParameters);
    -[GEOPDPlaceRequestParameters setAutocompleteParameters:]((uint64_t)v61, v24);
    [v23 setPlaceRequestParameters:v61];
    long long v29 = v23;
    id v16 = v60;
LABEL_66:

    id v19 = v69;
    id v20 = v70;
  }
  else
  {
    id v28 = v18;
    long long v29 = 0;
  }

  return v29;
}

- (int)autocompleteOriginationTypeFromTraits:(id)a3
{
  id v3 = a3;
  int v4 = [v3 autocompleteOriginationType];
  int v5 = v4;
  if (v4 != 3)
  {
    if (v4 == 2)
    {
      if ([v3 navigating])
      {
        int v5 = 2;
      }
      else
      {
        if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT))
        {
          *(_WORD *)uint64_t v7 = 0;
          _os_log_fault_impl(&dword_188D96000, MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT, "Assertion failed: 0", v7, 2u);
        }
        int v5 = 0;
      }
    }
    else
    {
      int v5 = v4 == 1;
    }
  }

  return v5;
}

+ (id)comingledPhotoLookupRequestWithCategoryIdentifier:(id)a3 mapItemIdentifier:(id)a4 range:(_NSRange)a5 traits:(id)a6
{
  NSUInteger length = a5.length;
  locatiouint64_t n = a5.location;
  uint64_t v40 = *MEMORY[0x1E4F143B8];
  id v32 = a3;
  id v9 = a4;
  id v10 = a6;
  id v11 = [[GEOPDPlaceRequest alloc] _initWithTraits:v10 includeHistoricalLocations:0 supportedMapsResultTypes:0];
  [v11 setRequestType:5];
  [v11 addRequestedComponentsForReason:25 traits:v10 count:length];
  long long v35 = 0u;
  long long v36 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  id v12 = [v11 requestedComponents];
  uint64_t v13 = [v12 countByEnumeratingWithState:&v33 objects:v39 count:16];
  if (v13)
  {
    uint64_t v14 = v13;
    uint64_t v15 = *(void *)v34;
    while (2)
    {
      for (uint64_t i = 0; i != v14; ++i)
      {
        if (*(void *)v34 != v15) {
          objc_enumerationMutation(v12);
        }
        uint64_t v17 = *(void *)(*((void *)&v33 + 1) + 8 * i);
        if (v17 && (*(unsigned char *)(v17 + 44) & 4) != 0 && *(_DWORD *)(v17 + 32) == 84)
        {
          -[GEOPDComponentInfo filter](*(id **)(*((void *)&v33 + 1) + 8 * i));
          id v18 = (id *)objc_claimAutoreleasedReturnValue();
          uint64_t v19 = -[GEOPDComponentFilter categorizedPhotosFilter](v18);
          if (v19)
          {
            *(unsigned char *)(v19 + 80) |= 0x80u;
            *(unsigned char *)(v19 + 80) |= 2u;
            *(_DWORD *)(v19 + 72) = location;
          }

          -[GEOPDComponentInfo filter]((id *)v17);
          id v20 = (id *)objc_claimAutoreleasedReturnValue();
          uint64_t v21 = -[GEOPDComponentFilter categorizedPhotosFilter](v20);
          if (v21)
          {
            *(unsigned char *)(v21 + 80) |= 0x80u;
            *(unsigned char *)(v21 + 80) |= 1u;
            *(_DWORD *)(v21 + 68) = length;
          }

          -[GEOPDComponentInfo filter]((id *)v17);
          id v22 = (id *)objc_claimAutoreleasedReturnValue();
          id v23 = -[GEOPDComponentFilter categorizedPhotosFilter](v22);
          -[GEOPDCategorizedPhotosFilter setCategoryId:]((uint64_t)v23, v32);

          goto LABEL_17;
        }
      }
      uint64_t v14 = [v12 countByEnumeratingWithState:&v33 objects:v39 count:16];
      if (v14) {
        continue;
      }
      break;
    }
  }
LABEL_17:

  uint64_t v24 = [GEOPDPlaceLookupParameters alloc];
  id v38 = v9;
  id v25 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v38 count:1];
  id v26 = -[GEOPDPlaceLookupParameters initWithIdentifiers:resultProviderID:](v24, "initWithIdentifiers:resultProviderID:", v25, [v9 resultProviderID]);

  id v27 = [GEOPDPlaceRequestParameters alloc];
  id v37 = v9;
  id v28 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v37 count:1];
  long long v29 = -[GEOPDPlaceRequestParameters initWithIdentifiers:resultProviderID:](v27, "initWithIdentifiers:resultProviderID:", v28, [v9 resultProviderID]);

  -[GEOPDPlaceRequestParameters setPlaceLookupParameters:]((uint64_t)v29, v26);
  [v11 setPlaceRequestParameters:v29];

  return v11;
}

+ (id)photoLookupRequestWithVendorIdentifier:(id)a3 mapItemIdentifier:(id)a4 range:(_NSRange)a5 traits:(id)a6
{
  NSUInteger length = a5.length;
  locatiouint64_t n = a5.location;
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  id v28 = a3;
  id v10 = a4;
  id v11 = a6;
  id v12 = [[GEOPDPlaceRequest alloc] _initWithTraits:v11 includeHistoricalLocations:0 supportedMapsResultTypes:0];
  [v12 setRequestType:5];
  [v12 addRequestedComponentsForReason:12 traits:v11 count:length];
  long long v31 = 0u;
  long long v32 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  uint64_t v13 = [v12 requestedComponents];
  uint64_t v14 = [v13 countByEnumeratingWithState:&v29 objects:v35 count:16];
  if (v14)
  {
    uint64_t v15 = v14;
    uint64_t v16 = *(void *)v30;
    while (2)
    {
      for (uint64_t i = 0; i != v15; ++i)
      {
        if (*(void *)v30 != v16) {
          objc_enumerationMutation(v13);
        }
        uint64_t v18 = *(void *)(*((void *)&v29 + 1) + 8 * i);
        if (v18 && (*(unsigned char *)(v18 + 44) & 4) != 0 && *(_DWORD *)(v18 + 32) == 26)
        {
          *(unsigned char *)(v18 + 44) |= 2u;
          *(_DWORD *)(v18 + 28) = location;
          -[GEOPDComponentInfo filter]((id *)v18);
          uint64_t v19 = (id *)objc_claimAutoreleasedReturnValue();
          id v20 = -[GEOPDComponentFilter captionedPhotoFilter](v19);
          -[GEOPDCaptionedPhotoFilter setVendorId:]((uint64_t)v20, v28);

          goto LABEL_13;
        }
      }
      uint64_t v15 = [v13 countByEnumeratingWithState:&v29 objects:v35 count:16];
      if (v15) {
        continue;
      }
      break;
    }
  }
LABEL_13:

  uint64_t v21 = [GEOPDPlaceLookupParameters alloc];
  id v34 = v10;
  id v22 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v34 count:1];
  id v23 = -[GEOPDPlaceLookupParameters initWithIdentifiers:resultProviderID:](v21, "initWithIdentifiers:resultProviderID:", v22, [v10 resultProviderID]);

  uint64_t v24 = [GEOPDPlaceRequestParameters alloc];
  id v33 = v10;
  id v25 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v33 count:1];
  id v26 = -[GEOPDPlaceRequestParameters initWithIdentifiers:resultProviderID:](v24, "initWithIdentifiers:resultProviderID:", v25, [v10 resultProviderID]);

  -[GEOPDPlaceRequestParameters setPlaceLookupParameters:]((uint64_t)v26, v23);
  [v12 setPlaceRequestParameters:v26];

  return v12;
}

- (id)initForCategoryListWithTraits:(id)a3 isFromNoQueryState:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  id v7 = [(GEOPDPlaceRequest *)self _initWithTraits:v6 includeHistoricalLocations:1 supportedMapsResultTypes:0];
  uint64_t v8 = v7;
  if (v7)
  {
    [v7 addRequestedComponentsForReason:1 traits:v6 count:0];
    [v8 setRequestType:11];
    id v9 = objc_alloc_init(GEOPDPlaceRequestParameters);
    id v10 = [v8 browseCategorySuggestionparametersWithTraits:v6 isFromNoQueryState:v4];
    -[GEOPDPlaceRequestParameters setBrowseCategorySuggestionParameters:]((uint64_t)v9, v10);

    [v8 setPlaceRequestParameters:v9];
    id v11 = v8;
  }
  return v8;
}

- (id)browseCategorySuggestionparametersWithTraits:(id)a3 isFromNoQueryState:(BOOL)a4
{
  id v6 = a3;
  id v7 = objc_alloc_init(GEOPDSearchBrowseCategorySuggestionParameters);
  uint64_t v8 = +[GEOPDViewportInfo viewportInfoForTraits:v6];
  -[GEOPDSearchBrowseCategorySuggestionParameters setViewportInfo:]((uint64_t)v7, v8);

  char v9 = [v6 hasCarHeadunitInteractionModel];
  if (v7)
  {
    *(_WORD *)&v7->_flags |= 0x8000u;
    *(_WORD *)&v7->_flags |= 0x10u;
    v7->_isCarplayRequest = v9;
  }
  if ([v6 hasIsWidgetRequest])
  {
    char v10 = [v6 isWidgetRequest];
    if (v7)
    {
      *(_WORD *)&v7->_flags |= 0x8000u;
      *(_WORD *)&v7->_flags |= 0x80u;
      v7->_isWidgetRequest = v10;
    }
  }
  if ([v6 hasNavigationTransportType]) {
    int v11 = -[GEOPDPlaceRequest userPreferredTransportTypeFromTransportType:](self, "userPreferredTransportTypeFromTransportType:", [v6 navigationTransportType]);
  }
  else {
    int v11 = [(GEOPDPlaceRequest *)self geoUserPreferredTransportType];
  }
  if (v7)
  {
    *(_WORD *)&v7->_flags |= 0x8000u;
    *(_WORD *)&v7->_flags |= 4u;
    v7->_preferredTransportType = v11;
  }
  -[GEOPDSearchBrowseCategorySuggestionParameters setEngineTypes:count:]((uint64_t)v7, [v6 engineTypes], objc_msgSend(v6, "engineTypesCount"));
  int v12 = [v6 navigating];
  if (v7)
  {
    if (v12) {
      int v13 = 2;
    }
    else {
      int v13 = 1;
    }
    *(_WORD *)&v7->_flags |= 0x8000u;
    *(_WORD *)&v7->_flags |= 8u;
    v7->_suggestionType = v13;
    [(GEOPDPlaceRequest *)self localTimestamp];
    *(_WORD *)&v7->_flags |= 0x8000u;
    *(_WORD *)&v7->_flags |= 1u;
    v7->_requestLocalTimestamp = v14;
    *(_WORD *)&v7->_flags |= 0x8000u;
    *(_WORD *)&v7->_flags |= 2u;
    v7->_minimumNumberOfCategories = 4;
    *(_WORD *)&v7->_flags |= 0x8000u;
    *(_WORD *)&v7->_flags |= 0x40u;
    v7->_isFromNoQueryState = a4;
  }
  else
  {
    [(GEOPDPlaceRequest *)self localTimestamp];
  }
  uint64_t v15 = [v6 evChargingPorts];
  if ([v15 count])
  {
  }
  else
  {
    uint64_t v16 = [v6 preferredBrandsCount];

    if (!v16) {
      goto LABEL_22;
    }
  }
  uint64_t v17 = objc_alloc_init(GEOPDSSearchEvChargingParameters);
  uint64_t v18 = [v6 evChargingPorts];
  -[GEOPDSSearchEvChargingParameters setPorts:]((uint64_t)v17, v18);

  if ([v6 preferredBrandsCount]) {
    -[GEOPDSSearchEvChargingParameters setPreferredBrands:count:]((uint64_t)v17, [v6 preferredBrands], objc_msgSend(v6, "preferredBrandsCount"));
  }
  -[GEOPDSearchBrowseCategorySuggestionParameters setEvChargingParameters:]((uint64_t)v7, v17);

LABEL_22:
  uint64_t v19 = [[GEOPDSearchOriginationInfo alloc] initWithTraits:v6];
  -[GEOPDSearchBrowseCategorySuggestionParameters setSearchOriginationInfo:]((uint64_t)v7, v19);

  return v7;
}

- (int)userPreferredTransportTypeFromTransportType:(int)a3
{
  if (a3 > 6) {
    return 0;
  }
  else {
    return dword_18A640D10[a3];
  }
}

- (id)initForDFRCategoryListWithTraits:(id)a3
{
  return 0;
}

- (GEOPDPlaceRequest)initWithCategory:(id)a3 maxResults:(unsigned int)a4 traits:(id)a5 searchSessionData:(id)a6
{
  uint64_t v8 = *(void *)&a4;
  id v10 = a3;
  id v11 = a5;
  id v12 = a6;
  int v13 = [(GEOPDPlaceRequest *)self _initWithTraits:v11 includeHistoricalLocations:1 supportedMapsResultTypes:&unk_1ED73F1D8];
  double v14 = v13;
  if (!v13) {
    goto LABEL_48;
  }
  uint64_t v49 = v12;
  [(GEOPDPlaceRequest *)v13 addRequestedComponentsForReason:0 traits:v11 count:v8];
  [(GEOPDPlaceRequest *)v14 setRequestType:12];
  uint64_t v15 = objc_alloc_init(GEOPDCategorySearchParameters);
  uint64_t v16 = [MEMORY[0x1E4F1C9A8] calendarWithIdentifier:*MEMORY[0x1E4F1C318]];
  uint64_t v17 = [MEMORY[0x1E4F1C9C8] date];
  uint64_t v18 = [v16 components:60 fromDate:v17];

  uint64_t v19 = [v16 dateFromComponents:v18];
  unint64_t v48 = v18;
  uint64_t v20 = [v18 hour];
  int v21 = [v16 ordinalityOfUnit:512 inUnit:4096 forDate:v19];
  if (v15)
  {
    if (v20 >= 0) {
      int v22 = v20;
    }
    else {
      int v22 = v20 + 1;
    }
    *(_DWORD *)&v15->_flags |= 0x10000000u;
    *(_DWORD *)&v15->_flags |= 2u;
    v15->_blurredHourOfDay = v22 & 0xFFFFFFFE;
    *(_DWORD *)&v15->_flags |= 0x10000000u;
    *(_DWORD *)&v15->_flags |= 4u;
    v15->_dayOfWeeuint64_t k = v21 - 1;
    *(_DWORD *)&v15->_flags |= 0x10000000u;
    *(_DWORD *)&v15->_flags |= 8u;
    v15->_maxResults = v8;
  }
  id v23 = [v10 _suggestionEntryMetadata];
  -[GEOPDCategorySearchParameters setSuggestionEntryMetadata:]((uint64_t)v15, v23);

  uint64_t v24 = +[GEOPDViewportInfo viewportInfoForTraits:v11];
  -[GEOPDCategorySearchParameters setViewportInfo:]((uint64_t)v15, v24);

  LODWORD(v24) = [v11 searchRequestType];
  int v25 = [v11 navigating];
  int v26 = 1;
  switch((int)v24)
  {
    case 0:
      break;
    case 1:
      if (v25) {
        int v26 = 4;
      }
      else {
        int v26 = 2;
      }
      break;
    case 2:
      int v26 = 5;
      break;
    default:
      int v26 = 0;
      break;
  }
  if (v15)
  {
    *(_DWORD *)&v15->_flags |= 0x10000000u;
    *(_DWORD *)&v15->_flags |= 0x20u;
    v15->_searchType = v26;
    id v27 = +[GEOPDETAFilter etaFilterForTraits:v11];
    -[GEOPDCategorySearchParameters setEtaFilter:]((uint64_t)v15, v27);

    *(_DWORD *)&v15->_flags |= 0x10000000u;
    *(_DWORD *)&v15->_flags |= 0x40u;
    v15->_supportCategorySearchResultSectiouint64_t n = 1;
  }
  else
  {
    uint64_t v47 = +[GEOPDETAFilter etaFilterForTraits:v11];
    -[GEOPDCategorySearchParameters setEtaFilter:](0, v47);
  }
  id v28 = [v11 evChargingPorts];
  if ([v28 count])
  {

LABEL_18:
    long long v30 = objc_alloc_init(GEOPDSSearchEvChargingParameters);
    long long v31 = [v11 evChargingPorts];
    -[GEOPDSSearchEvChargingParameters setPorts:]((uint64_t)v30, v31);

    if ([v11 preferredBrandsCount]) {
      -[GEOPDSSearchEvChargingParameters setPreferredBrands:count:]((uint64_t)v30, [v11 preferredBrands], objc_msgSend(v11, "preferredBrandsCount"));
    }
    -[GEOPDCategorySearchParameters setEvChargingParameters:]((uint64_t)v15, v30);

    goto LABEL_21;
  }
  uint64_t v29 = [v11 preferredBrandsCount];

  if (v29) {
    goto LABEL_18;
  }
LABEL_21:
  if (GEOConfigGetBOOL(MapsFeaturesConfig_ShelbyvilleSearch, (uint64_t)off_1E9111CB8))
  {
    if ([v11 hasAuxiliaryTierNumResults])
    {
      unsigned int v32 = [v11 auxiliaryTierNumResults];
      if (v15)
      {
        *(_DWORD *)&v15->_flags |= 0x10000000u;
        *(_DWORD *)&v15->_flags |= 1u;
        v15->_auxiliaryTierNumResults = v32;
      }
    }
    if ([v11 supportedSearchTierTypesCount])
    {
      unint64_t v33 = 0;
      do
      {
        [v11 supportedSearchTierTypeAtIndex:v33];
        -[GEOPDCategorySearchParameters addSupportedSearchTierType:]((os_unfair_lock_s *)v15);
        ++v33;
      }
      while (v33 < [v11 supportedSearchTierTypesCount]);
    }
    int v34 = [v11 placeSummaryRevision];
    if (v15)
    {
      *(_DWORD *)&v15->_flags |= 0x10000000u;
      *(_DWORD *)&v15->_flags |= 0x10u;
      v15->_placeSummaryRevisiouint64_t n = v34;
    }
    if ([v11 knownRefinementTypesCount])
    {
      unint64_t v35 = 0;
      do
      {
        [v11 knownRefinementTypeAtIndex:v35];
        -[GEOPDCategorySearchParameters addKnownRefinementType:]((os_unfair_lock_s *)v15);
        ++v35;
      }
      while (v35 < [v11 knownRefinementTypesCount]);
    }
    uint64_t v36 = [v11 resultRefinementQuery];
    -[GEOPDCategorySearchParameters setResultRefinementQuery:]((uint64_t)v15, v36);

    id v37 = [v11 previousSearchViewport];
    -[GEOPDCategorySearchParameters setPreviousSearchViewport:]((uint64_t)v15, v37);

    if ([v11 supportedPlaceSummaryFormatTypesCount])
    {
      unint64_t v38 = 0;
      do
      {
        [v11 supportedPlaceSummaryFormatTypeAtIndex:v38];
        -[GEOPDCategorySearchParameters addSupportedPlaceSummaryFormatType:]((os_unfair_lock_s *)v15);
        ++v38;
      }
      while (v38 < [v11 supportedPlaceSummaryFormatTypesCount]);
    }
  }
  if (GEOConfigGetBOOL(MapsFeaturesConfig_ShelbyvilleSearch, (uint64_t)off_1E9111CB8))
  {
    -[GEOPDCategorySearchParameters addSupportedSearchSectionType:]((os_unfair_lock_s *)v15);
    if (([v11 navigating] & 1) == 0) {
      -[GEOPDCategorySearchParameters addSupportedSearchSectionType:]((os_unfair_lock_s *)v15);
    }
  }
  else if (([v11 navigating] & 1) == 0)
  {
    -[GEOPDCategorySearchParameters addSupportedRelatedEntitySectionType:]((os_unfair_lock_s *)v15);
  }
  long long v39 = [[GEOPDSearchOriginationInfo alloc] initWithTraits:v11];
  -[GEOPDCategorySearchParameters setSearchOriginationInfo:]((uint64_t)v15, v39);

  char v40 = [v11 supportStructuredRapAffordance];
  if (v15)
  {
    *(_DWORD *)&v15->_flags |= 0x10000000u;
    *(_DWORD *)&v15->_flags |= 0x100u;
    v15->_supportStructuredRapAffordance = v40;
  }
  long long v41 = objc_alloc_init(GEOPDPlaceRequestParameters);
  -[GEOPDPlaceRequestParameters setCategorySearchParameters:]((uint64_t)v41, v15);
  if ([v11 optimizeSearchRequestComponents])
  {
    long long v42 = [(id)objc_opt_class() createRequestedComponentsForReason:31 traits:v11 count:v8];
    [(GEOPDPlaceRequest *)v14 addPartiallyComposedSearchResultRequestedComponents:v42];
  }
  id v12 = v49;
  if (GEOConfigGetBOOL(MapsFeaturesConfig_SearchAndDiscovery, (uint64_t)off_1E9111EB8))
  {
    int v43 = [v49 searchSessionData];
    -[GEOPDCategorySearchParameters setSearchSessionData:]((uint64_t)v15, v43);

    long long v44 = [v11 userActionMetadata];
    -[GEOPDCategorySearchParameters setSessionUserActionMetadata:]((uint64_t)v15, v44);
  }
  [(GEOPDPlaceRequest *)v14 setPlaceRequestParameters:v41];
  long long v45 = v14;

LABEL_48:
  return v14;
}

- (GEOPDPlaceRequest)initWithCategory:(id)a3 routeInfo:(id)a4 maxResults:(unsigned int)a5 traits:(id)a6 searchSessionData:(id)a7
{
  uint64_t v9 = *(void *)&a5;
  id v12 = a3;
  int v13 = a4;
  id v14 = a6;
  id v15 = a7;
  uint64_t v16 = [(GEOPDPlaceRequest *)self _initWithTraits:v14 includeHistoricalLocations:1 supportedMapsResultTypes:0];
  uint64_t v17 = v16;
  if (!v16) {
    goto LABEL_29;
  }
  [(GEOPDPlaceRequest *)v16 addRequestedComponentsForReason:0 traits:v14 count:v9];
  [(GEOPDPlaceRequest *)v17 setRequestType:12];
  uint64_t v18 = objc_alloc_init(GEOPDCategorySearchParameters);
  uint64_t v19 = (uint64_t)v18;
  if (v18)
  {
    *(_DWORD *)&v18->_flags |= 0x10000000u;
    *(_DWORD *)&v18->_flags |= 8u;
    v18->_maxResults = v9;
    uint64_t v20 = [v12 _suggestionEntryMetadata];
    -[GEOPDCategorySearchParameters setSuggestionEntryMetadata:](v19, v20);

    int v21 = +[GEOPDViewportInfo viewportInfoForTraits:v14];
    -[GEOPDCategorySearchParameters setViewportInfo:](v19, v21);

    *(_DWORD *)(v19 + 288) |= 0x10000000u;
    *(_DWORD *)(v19 + 288) |= 0x20u;
    *(_DWORD *)(v19 + 280) = 3;
  }
  else
  {
    unint64_t v38 = [v12 _suggestionEntryMetadata];
    -[GEOPDCategorySearchParameters setSuggestionEntryMetadata:](0, v38);

    long long v39 = +[GEOPDViewportInfo viewportInfoForTraits:v14];
    -[GEOPDCategorySearchParameters setViewportInfo:](0, v39);
  }
  int v22 = +[GEOPDETAFilter etaFilterForTraits:v14];
  if (v13 && (-[GEOPDRecentRouteInfo _readEtaFilter]((uint64_t)v13), !v13[3]))
  {
    id v23 = [v22 data];
    -[GEOPDRecentRouteInfo setEtaFilter:]((uint64_t)v13, v23);
  }
  else
  {
    -[GEOPDCategorySearchParameters setEtaFilter:](v19, v22);
  }
  -[GEOPDCategorySearchParameters setRecentRouteInfo:](v19, v13);
  uint64_t v24 = [v14 evChargingPorts];
  if ([v24 count])
  {

LABEL_11:
    int v26 = objc_alloc_init(GEOPDSSearchEvChargingParameters);
    id v27 = [v14 evChargingPorts];
    -[GEOPDSSearchEvChargingParameters setPorts:]((uint64_t)v26, v27);

    if ([v14 preferredBrandsCount]) {
      -[GEOPDSSearchEvChargingParameters setPreferredBrands:count:]((uint64_t)v26, [v14 preferredBrands], objc_msgSend(v14, "preferredBrandsCount"));
    }
    -[GEOPDCategorySearchParameters setEvChargingParameters:](v19, v26);

    goto LABEL_14;
  }
  uint64_t v25 = [v14 preferredBrandsCount];

  if (v25) {
    goto LABEL_11;
  }
LABEL_14:
  if (GEOConfigGetBOOL(MapsFeaturesConfig_ShelbyvilleSearch, (uint64_t)off_1E9111CB8))
  {
    id v28 = [v14 previousSearchViewport];
    -[GEOPDCategorySearchParameters setPreviousSearchViewport:](v19, v28);
  }
  uint64_t v29 = [[GEOPDSearchOriginationInfo alloc] initWithTraits:v14];
  -[GEOPDCategorySearchParameters setSearchOriginationInfo:](v19, v29);

  char v30 = [v14 supportStructuredRapAffordance];
  if (v19)
  {
    *(_DWORD *)(v19 + 288) |= 0x10000000u;
    *(_DWORD *)(v19 + 288) |= 0x100u;
    *(unsigned char *)(v19 + 286) = v30;
  }
  if ([v14 placeSummaryRevision])
  {
    int v31 = [v14 placeSummaryRevision];
    if (v19)
    {
      *(_DWORD *)(v19 + 288) |= 0x10000000u;
      *(_DWORD *)(v19 + 288) |= 0x10u;
      *(_DWORD *)(v19 + 276) = v31;
    }
    if ([v14 supportedPlaceSummaryFormatTypesCount])
    {
      unint64_t v32 = 0;
      do
      {
        [v14 supportedPlaceSummaryFormatTypeAtIndex:v32];
        -[GEOPDCategorySearchParameters addSupportedPlaceSummaryFormatType:]((os_unfair_lock_s *)v19);
        ++v32;
      }
      while (v32 < [v14 supportedPlaceSummaryFormatTypesCount]);
    }
  }
  if (GEOConfigGetBOOL(MapsFeaturesConfig_SearchAndDiscovery, (uint64_t)off_1E9111EB8))
  {
    if (v15)
    {
      unint64_t v33 = [v15 searchSessionData];
      -[GEOPDCategorySearchParameters setSearchSessionData:](v19, v33);
    }
    int v34 = [v14 userActionMetadata];
    -[GEOPDCategorySearchParameters setSessionUserActionMetadata:](v19, v34);
  }
  unint64_t v35 = objc_alloc_init(GEOPDPlaceRequestParameters);
  -[GEOPDPlaceRequestParameters setCategorySearchParameters:]((uint64_t)v35, (void *)v19);
  [(GEOPDPlaceRequest *)v17 setPlaceRequestParameters:v35];
  uint64_t v36 = v17;

LABEL_29:
  return v17;
}

- (GEOPDPlaceRequest)initWithSearchCategory:(id)a3 venueIdentifier:(id)a4 maxResults:(unsigned int)a5 traits:(id)a6
{
  uint64_t v7 = *(void *)&a5;
  id v10 = a3;
  id v11 = a4;
  id v12 = a6;
  int v13 = [(GEOPDPlaceRequest *)self _initWithTraits:v12 includeHistoricalLocations:0 supportedMapsResultTypes:0];
  id v14 = v13;
  if (!v13) {
    goto LABEL_26;
  }
  [(GEOPDPlaceRequest *)v13 addRequestedComponentsForReason:8 traits:v12 count:1];
  [(GEOPDPlaceRequest *)v14 setRequestType:1];
  id v15 = objc_alloc_init(GEOPDSearchParameters);
  uint64_t v16 = (uint64_t)v15;
  if (v15)
  {
    *(void *)&v15->_flags |= 0x20000000002uLL;
    v15->_maxResults = v7;
  }
  uint64_t v17 = [v10 _autocompleteEntry];
  -[GEOPDSearchParameters setSuggestionEntry:](v16, v17);

  uint64_t v18 = +[GEOPDViewportInfo viewportInfoForTraits:v12];
  -[GEOPDSearchParameters setViewportInfo:](v16, v18);

  unsigned int v19 = [v12 searchRequestType];
  if (v19 > 3) {
    int v20 = 0;
  }
  else {
    int v20 = dword_18A640D00[v19];
  }
  if (v16)
  {
    *(void *)(v16 + 372) |= 0x20000000008uLL;
    *(_DWORD *)(v16 + 352) = v20;
  }
  int v21 = +[GEOPDETAFilter etaFilterForTraits:v12];
  -[GEOPDSearchParameters setEtaFilter:](v16, v21);

  int v22 = [v12 evChargingPorts];
  if ([v22 count])
  {

LABEL_12:
    uint64_t v24 = objc_alloc_init(GEOPDSSearchEvChargingParameters);
    uint64_t v25 = [v12 evChargingPorts];
    -[GEOPDSSearchEvChargingParameters setPorts:]((uint64_t)v24, v25);

    if ([v12 preferredBrandsCount]) {
      -[GEOPDSSearchEvChargingParameters setPreferredBrands:count:]((uint64_t)v24, [v12 preferredBrands], objc_msgSend(v12, "preferredBrandsCount"));
    }
    -[GEOPDSearchParameters setEvChargingParameters:](v16, v24);

    goto LABEL_15;
  }
  uint64_t v23 = [v12 preferredBrandsCount];

  if (v23) {
    goto LABEL_12;
  }
LABEL_15:
  if (v11)
  {
    int v26 = objc_alloc_init(GEOPDSSearchFilter);
    id v27 = objc_alloc_init(GEOPDSSearchVenueFilter);
    id v28 = [v11 placeDataVenueIdentifier];
    -[GEOPDSSearchVenueFilter setVenueFilter:]((uint64_t)v27, v28);

    if (v27)
    {
      *(unsigned char *)&v27->_flags |= 1u;
      v27->_venueSearchType = 1;
    }
    -[GEOPDSSearchFilter setVenueFilter:]((uint64_t)v26, v27);
    uint64_t v29 = [v10 _suggestionEntryMetadata];
    uint64_t v30 = [v29 length];

    if (v30)
    {
      int v31 = objc_alloc_init(GEOPDSCategoryFilter);
      unint64_t v32 = [v10 _suggestionEntryMetadata];
      -[GEOPDSCategoryFilter setCategoryMetadata:]((uint64_t)v31, v32);

      -[GEOPDSSearchFilter setCategoryFilter:]((uint64_t)v26, v31);
    }
    -[GEOPDSearchParameters setSearchFilter:](v16, v26);
  }
  if (GEOConfigGetBOOL(MapsFeaturesConfig_ShelbyvilleSearch, (uint64_t)off_1E9111CB8))
  {
    unint64_t v33 = [v12 previousSearchViewport];
    -[GEOPDSearchParameters setPreviousSearchViewport:](v16, v33);
  }
  if ([v12 optimizeSearchRequestComponents])
  {
    int v34 = [(id)objc_opt_class() createRequestedComponentsForReason:31 traits:v12 count:v7];
    [(GEOPDPlaceRequest *)v14 addPartiallyComposedSearchResultRequestedComponents:v34];
  }
  unint64_t v35 = objc_alloc_init(GEOPDPlaceRequestParameters);
  -[GEOPDPlaceRequestParameters setSearchParameters:]((uint64_t)v35, (void *)v16);
  [(GEOPDPlaceRequest *)v14 setPlaceRequestParameters:v35];
  uint64_t v36 = v14;

LABEL_26:
  return v14;
}

- (GEOPDPlaceRequest)initWithCategoryMetadata:(id)a3 parentMuid:(unint64_t)a4 traits:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  id v10 = [(GEOPDPlaceRequest *)self _initWithTraits:v9 includeHistoricalLocations:0 supportedMapsResultTypes:0];
  id v11 = v10;
  if (v10)
  {
    [(GEOPDPlaceRequest *)v10 addRequestedComponentsForReason:1 traits:v9 count:1];
    [(GEOPDPlaceRequest *)v11 setRequestType:42];
    id v12 = objc_alloc_init(GEOPDChildPlaceLookupByCategoryParameters);
    -[GEOPDChildPlaceLookupByCategoryParameters setCategoryMetadata:]((uint64_t)v12, v8);
    if (v12)
    {
      *(unsigned char *)&v12->_flags |= 1u;
      v12->_parentMuid = a4;
    }
    int v13 = objc_alloc_init(GEOPDPlaceRequestParameters);
    -[GEOPDPlaceRequestParameters setChildPlaceLookupByCategoryParameters:]((uint64_t)v13, v12);
    [(GEOPDPlaceRequest *)v11 setPlaceRequestParameters:v13];
    id v14 = v11;
  }
  return v11;
}

- (id)initForNearestTransitStationWithLine:(id)a3 coordinate:(id)a4 traits:(id)a5
{
  double var1 = a4.var1;
  double var0 = a4.var0;
  id v9 = a3;
  id v10 = a5;
  id v11 = [(GEOPDPlaceRequest *)self _initWithTraits:v10 includeHistoricalLocations:1 supportedMapsResultTypes:0];
  id v12 = v11;
  if (v11)
  {
    [v11 addRequestedComponentsForReason:0 traits:v10 count:1];
    [v12 setRequestType:9];
    int v13 = objc_alloc_init(GEOPDPlaceRequestParameters);
    id v14 = objc_alloc_init(GEOPDLocationDirectedSearchParameters);
    id v15 = v14;
    if (v14)
    {
      *(_WORD *)&v14->_flags |= 0x400u;
      *(_WORD *)&v14->_flags |= 2u;
      v14->_searchType = 2;
      *(_WORD *)&v14->_flags |= 0x400u;
      *(_WORD *)&v14->_flags |= 1u;
      v14->_maxResults = 1;
      *(_WORD *)&v14->_flags |= 0x400u;
      *(_WORD *)&v14->_flags |= 4u;
      v14->_sortOrder = 2;
    }
    if (var1 >= -180.0 && var1 <= 180.0 && var0 >= -90.0 && var0 <= 90.0)
    {
      uint64_t v16 = objc_alloc_init(GEOLatLng);
      [(GEOLatLng *)v16 setLat:var0];
      [(GEOLatLng *)v16 setLng:var1];
      -[GEOPDLocationDirectedSearchParameters setSearchLocation:]((uint64_t)v15, v16);
    }
    uint64_t v17 = objc_alloc_init(GEOPDNearestTransitParameters);
    uint64_t v18 = v17;
    if (v17)
    {
      *(unsigned char *)&v17->_flags |= 2u;
      v17->_isTransitOnly = 1;
      uint64_t v19 = [v9 muid];
      *(unsigned char *)&v18->_flags |= 1u;
      v18->_lineMuid = v19;
    }
    else
    {
      [v9 muid];
    }
    -[GEOPDLocationDirectedSearchParameters setNearestTransitParameters:]((uint64_t)v15, v18);
    -[GEOPDPlaceRequestParameters setLocationDirectedSearchParameters:]((uint64_t)v13, v15);
    [v12 setPlaceRequestParameters:v13];
    id v20 = v12;
  }
  return v12;
}

- (id)initForBrandLookupWithIMessageUid:(id)a3 traits:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(GEOPDPlaceRequest *)self _initWithTraits:v7 includeHistoricalLocations:1 supportedMapsResultTypes:0];
  id v9 = v8;
  if (v8)
  {
    [v8 addRequestedComponentsForReason:1 traits:v7 count:1];
    [v9 setRequestType:30];
    id v10 = objc_alloc_init(GEOPDPlaceRequestParameters);
    [v9 setPlaceRequestParameters:v10];

    id v11 = objc_alloc_init(GEOPDBrandLookupParameters);
    id v12 = [v9 placeRequestParameters];
    -[GEOPDPlaceRequestParameters setBrandLookupParameters:]((uint64_t)v12, v11);

    int v13 = [v9 placeRequestParameters];
    id v14 = -[GEOPDPlaceRequestParameters brandLookupParameters](v13);
    -[GEOPDBrandLookupParameters setImessageUid:]((uint64_t)v14, v6);

    id v15 = v9;
  }

  return v9;
}

- (id)initForWifiFingerprintLookupWithLocations:(id)a3 wifiAccessPoints:(id)a4 maxLabels:(unsigned int)a5 entryTime:(unint64_t)a6 exitTime:(unint64_t)a7 traits:(id)a8
{
  uint64_t v54 = *MEMORY[0x1E4F143B8];
  id v14 = a3;
  id v15 = a4;
  id v16 = a8;
  id v17 = [(GEOPDPlaceRequest *)self _initWithTraits:v16 includeHistoricalLocations:1 supportedMapsResultTypes:0];
  uint64_t v18 = v17;
  if (!v17) {
    goto LABEL_25;
  }
  unint64_t v42 = a6;
  unsigned int v41 = a5;
  [v17 addRequestedComponentsForReason:11 traits:v16 count:1];
  [v18 setRequestType:32];
  uint64_t v19 = objc_alloc_init(GEOPDPlaceRequestParameters);
  [v18 setPlaceRequestParameters:v19];

  id v20 = objc_alloc_init(GEOPDWifiFingerprintParameters);
  int v21 = [v18 placeRequestParameters];
  -[GEOPDPlaceRequestParameters setWifiFingerprintParameters:]((uint64_t)v21, v20);

  int v22 = objc_alloc_init(GEOPDWifiMeasurement);
  long long v48 = 0u;
  long long v49 = 0u;
  long long v50 = 0u;
  long long v51 = 0u;
  id v43 = v14;
  id v23 = v14;
  uint64_t v24 = [v23 countByEnumeratingWithState:&v48 objects:v53 count:16];
  if (v24)
  {
    uint64_t v25 = v24;
    uint64_t v26 = *(void *)v49;
    do
    {
      for (uint64_t i = 0; i != v25; ++i)
      {
        if (*(void *)v49 != v26) {
          objc_enumerationMutation(v23);
        }
        -[GEOPDWifiMeasurement addLocation:]((uint64_t)v22, *(void **)(*((void *)&v48 + 1) + 8 * i));
      }
      uint64_t v25 = [v23 countByEnumeratingWithState:&v48 objects:v53 count:16];
    }
    while (v25);
  }
  unint64_t v28 = a7;

  long long v46 = 0u;
  long long v47 = 0u;
  long long v44 = 0u;
  long long v45 = 0u;
  id v29 = v15;
  uint64_t v30 = [v29 countByEnumeratingWithState:&v44 objects:v52 count:16];
  if (v30)
  {
    uint64_t v31 = v30;
    uint64_t v32 = *(void *)v45;
    do
    {
      for (uint64_t j = 0; j != v31; ++j)
      {
        if (*(void *)v45 != v32) {
          objc_enumerationMutation(v29);
        }
        int v34 = [[GEOPDWifiAccessPoint alloc] initWithGEOWifiAccessPoint:*(void *)(*((void *)&v44 + 1) + 8 * j)];
        -[GEOPDWifiMeasurement addWifiAccessPoint:]((uint64_t)v22, v34);
      }
      uint64_t v31 = [v29 countByEnumeratingWithState:&v44 objects:v52 count:16];
    }
    while (v31);
  }

  if (!v42) {
    goto LABEL_19;
  }
  if (v22)
  {
    *(unsigned char *)&v22->_flags |= 0x20u;
    *(unsigned char *)&v22->_flags |= 1u;
    v22->_entryTime = v42;
LABEL_19:
    if (v28 && v22)
    {
      *(unsigned char *)&v22->_flags |= 0x20u;
      *(unsigned char *)&v22->_flags |= 2u;
      v22->_exitTime = v28;
    }
  }
  unint64_t v35 = [v18 placeRequestParameters];
  uint64_t v36 = -[GEOPDPlaceRequestParameters wifiFingerprintParameters](v35);
  -[GEOPDWifiFingerprintParameters addMeasurement:]((uint64_t)v36, v22);

  id v37 = [v18 placeRequestParameters];
  uint64_t v38 = -[GEOPDPlaceRequestParameters wifiFingerprintParameters](v37);
  if (v38)
  {
    *(unsigned char *)(v38 + 28) |= 1u;
    *(_DWORD *)(v38 + 24) = v41;
  }

  id v39 = v18;
  id v14 = v43;
LABEL_25:

  return v18;
}

- (id)initForGeoIpLookupWithIpAddress:(id)a3 traits:(id)a4
{
  id v6 = a3;
  id v7 = [(GEOPDPlaceRequest *)self _initWithTraits:a4 includeHistoricalLocations:0 supportedMapsResultTypes:0];
  id v8 = v7;
  if (v7)
  {
    [v7 setRequestType:34];
    id v9 = objc_alloc_init(GEOPDPlaceRequestParameters);
    [v8 setPlaceRequestParameters:v9];

    id v10 = objc_alloc_init(GEOPDIpGeoLookupParameters);
    id v11 = [v8 placeRequestParameters];
    -[GEOPDPlaceRequestParameters setIpGeoLookupParameters:]((uint64_t)v11, v10);

    id v12 = [v8 placeRequestParameters];
    int v13 = -[GEOPDPlaceRequestParameters ipGeoLookupParameters](v12);
    -[GEOPDIpGeoLookupParameters setIpAddress:]((uint64_t)v13, v6);
  }
  return v8;
}

- (id)initForTerritoryForLatLngsE7:(id)a3 traits:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v16.receiver = self;
  v16.super_class = (Class)GEOPDPlaceRequest;
  id v8 = [(GEOPDPlaceRequest *)&v16 init];
  id v9 = v8;
  if (v8)
  {
    [(GEOPDPlaceRequest *)v8 setRequestType:49];
    id v10 = objc_alloc_init(GEOPDTerritoryLookupParameters);
    id v11 = (void *)[v6 mutableCopy];
    -[GEOPDTerritoryLookupParameters setLocations:]((uint64_t)v10, v11);

    id v12 = objc_alloc_init(GEOPDPlaceRequestParameters);
    [(GEOPDPlaceRequest *)v9 setPlaceRequestParameters:v12];

    int v13 = [(GEOPDPlaceRequest *)v9 placeRequestParameters];
    -[GEOPDPlaceRequestParameters setTerritoryLookupParameters:]((uint64_t)v13, v10);

    [(GEOPDPlaceRequest *)v9 addRequestedComponentsForReason:19 traits:v7 count:1];
    id v14 = v9;
  }
  return v9;
}

- (id)initForOfflineRegionNameSuggestionWithRegion:(id)a3 traits:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(GEOPDPlaceRequest *)self _initWithTraits:v7 includeHistoricalLocations:0 supportedMapsResultTypes:0];
  id v9 = v8;
  if (v8)
  {
    [v8 setRequestType:59];
    id v10 = objc_alloc_init(GEOPDOfflineRegionNameParameters);
    -[GEOPDOfflineRegionNameParameters setRegion:]((uint64_t)v10, v6);
    id v11 = objc_alloc_init(GEOPDPlaceRequestParameters);
    [v9 setPlaceRequestParameters:v11];

    id v12 = [v9 placeRequestParameters];
    -[GEOPDPlaceRequestParameters setOfflineRegionNameParameters:]((uint64_t)v12, v10);

    [v9 addRequestedComponentsForReason:28 traits:v7 count:1];
    id v13 = v9;
  }
  return v9;
}

- (id)initForSearchCapabilitiesWithTraits:(id)a3
{
  id v4 = a3;
  id v5 = [(GEOPDPlaceRequest *)self _initWithTraits:v4 includeHistoricalLocations:0 supportedMapsResultTypes:0];
  id v6 = v5;
  if (v5)
  {
    [v5 setRequestType:60];
    id v7 = objc_alloc_init(GEOPDSearchCapabilitiesParameters);
    id v8 = +[GEOPDViewportInfo viewportInfoForTraits:v4];
    -[GEOPDSearchCapabilitiesParameters setViewportInfo:]((uint64_t)v7, v8);

    id v9 = objc_alloc_init(GEOPDPlaceRequestParameters);
    [v6 setPlaceRequestParameters:v9];

    id v10 = [v6 placeRequestParameters];
    -[GEOPDPlaceRequestParameters setSearchCapabilitiesParameters:]((uint64_t)v10, v7);

    id v11 = v6;
  }

  return v6;
}

- (GEOPDPlaceRequest)initWithSpatialPlaceLookupParameters:(id)a3 traits:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(GEOPDPlaceRequest *)self _initWithTraits:v7 includeHistoricalLocations:0 supportedMapsResultTypes:0];
  id v9 = v8;
  if (v8)
  {
    [(GEOPDPlaceRequest *)v8 setRequestType:36];
    [(GEOPDPlaceRequest *)v9 addRequestedComponentsForReason:9 traits:v7 count:1];
    id v10 = objc_alloc_init(GEOPDBatchSpatialLookupParameters);
    id v11 = [(GEOPDPlaceRequest *)v9 pdSpatialPlaceLookupParametersArrayForParameters:v6];
    -[GEOPDBatchSpatialLookupParameters setSpatialPlaceLookups:]((uint64_t)v10, v11);

    id v12 = objc_alloc_init(GEOPDPlaceRequestParameters);
    -[GEOPDPlaceRequestParameters setBatchSpatialLookupParameters:]((uint64_t)v12, v10);
    [(GEOPDPlaceRequest *)v9 setPlaceRequestParameters:v12];
  }
  return v9;
}

- (GEOPDPlaceRequest)initWithSpatialEventLookupParameters:(id)a3 traits:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(GEOPDPlaceRequest *)self _initWithTraits:v7 includeHistoricalLocations:0 supportedMapsResultTypes:0];
  id v9 = v8;
  if (v8)
  {
    [(GEOPDPlaceRequest *)v8 setRequestType:36];
    [(GEOPDPlaceRequest *)v9 addRequestedComponentsForReason:10 traits:v7 count:1];
    id v10 = objc_alloc_init(GEOPDBatchSpatialLookupParameters);
    id v11 = [(GEOPDPlaceRequest *)v9 pdSpatialEventLookupParametersArrayForParameters:v6];
    -[GEOPDBatchSpatialLookupParameters setSpatialEventLookups:]((uint64_t)v10, v11);

    id v12 = objc_alloc_init(GEOPDPlaceRequestParameters);
    -[GEOPDPlaceRequestParameters setBatchSpatialLookupParameters:]((uint64_t)v12, v10);
    [(GEOPDPlaceRequest *)v9 setPlaceRequestParameters:v12];
  }
  return v9;
}

- (id)initForSearchHomeWithTraits:(id)a3
{
  id v4 = a3;
  id v5 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  [v5 addObject:&unk_1ED73EB60];
  int v6 = [v4 navigating];
  if ((v6 & 1) == 0)
  {
    [v5 addObject:&unk_1ED73EB18];
    [v5 addObject:&unk_1ED73EB30];
  }
  id v7 = (void *)[v5 copy];
  id v8 = [(GEOPDPlaceRequest *)self _initWithTraits:v4 includeHistoricalLocations:0 supportedMapsResultTypes:v7];

  if (v8)
  {
    [v8 setRequestType:44];
    id v9 = objc_alloc_init(GEOPDMapsSearchHomeParameters);
    if (((v6 | GEOConfigGetBOOL(MapsFeaturesConfig_Maps269Enabled, (uint64_t)off_1E9111CE8) ^ 1) & 1) == 0) {
      -[GEOPDMapsSearchHomeParameters addSupportedSectionType:]((uint64_t)v9);
    }
    -[GEOPDMapsSearchHomeParameters addSupportedSectionType:]((uint64_t)v9);
    if ((v6 & 1) == 0)
    {
      -[GEOPDMapsSearchHomeParameters addSupportedSectionType:]((uint64_t)v9);
      -[GEOPDMapsSearchHomeParameters addSupportedSectionType:]((uint64_t)v9);
    }
    id v10 = +[GEOPDViewportInfo viewportInfoForTraits:v4];
    [v8 localTimestamp];
    double v12 = v11;
    id v13 = [v8 browseCategorySuggestionparametersWithTraits:v4 isFromNoQueryState:1];
    -[GEOPDMapsSearchHomeParameters setSearchBrowseCategorySuggestionParameters:]((uint64_t)v9, v13);
    if ((v6 & 1) == 0)
    {
      id v14 = objc_alloc_init(GEOPDGuidesLocationsSuggestionParameters);
      -[GEOPDGuidesLocationsSuggestionParameters setViewportInfo:]((uint64_t)v14, v10);
      -[GEOPDMapsSearchHomeParameters setGuidesLocationsSuggestionParameters:]((uint64_t)v9, v14);
      id v15 = objc_alloc_init(GEOPDCollectionSuggestionParameters);
      -[GEOPDCollectionSuggestionParameters setViewportInfo:]((uint64_t)v15, v10);
      if (v15)
      {
        *(unsigned char *)&v15->_flags |= 0x40u;
        *(unsigned char *)&v15->_flags |= 1u;
        v15->_requestLocalTimestamp = v12;
      }
      -[GEOPDMapsSearchHomeParameters setCollectionSuggestionParameters:]((uint64_t)v9, v15);
      objc_super v16 = objc_alloc_init(GEOPDPublisherSuggestionParameters);
      -[GEOPDPublisherSuggestionParameters setViewportInfo:]((uint64_t)v16, v10);
      if (v16)
      {
        *(unsigned char *)&v16->_flags |= 1u;
        v16->_requestLocalTimestamp = v12;
      }
      -[GEOPDMapsSearchHomeParameters setPublisherSuggestionParameters:]((uint64_t)v9, v16);
    }
    id v17 = [[GEOPDSearchOriginationInfo alloc] initWithTraits:v4];
    -[GEOPDMapsSearchHomeParameters setSearchOriginationInfo:]((uint64_t)v9, v17);

    uint64_t v18 = objc_alloc_init(GEOPDPlaceRequestParameters);
    [v8 setPlaceRequestParameters:v18];

    uint64_t v19 = [v8 placeRequestParameters];
    -[GEOPDPlaceRequestParameters setMapsSearchHomeParameters:]((uint64_t)v19, v9);

    [v8 addRequestedComponentsForReason:14 traits:v4 count:0];
  }

  return v8;
}

- (id)initPublisherViewWithPublisherIdentifier:(id)a3 keywordFilter:(id)a4 addressFilter:(id)a5 batchSize:(unsigned int)a6 withTraits:(id)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a7;
  id v16 = [(GEOPDPlaceRequest *)self _initWithTraits:v15 includeHistoricalLocations:0 supportedMapsResultTypes:&unk_1ED73F1F0];
  id v17 = v16;
  if (v16)
  {
    [v16 setRequestType:46];
    uint64_t v18 = objc_alloc_init(GEOPDPublisherViewParameters);
    uint64_t v19 = [v12 mapsIdentifier];
    -[GEOPDPublisherViewParameters setPublisherId:]((uint64_t)v18, v19);

    if (v18)
    {
      *(unsigned char *)&v18->_flags |= 0x20u;
      *(unsigned char *)&v18->_flags |= 1u;
      v18->_numClientizedResults = a6;
    }
    id v20 = +[GEOPDViewportInfo viewportInfoForTraits:v15];
    -[GEOPDPublisherViewParameters setViewportInfo:]((uint64_t)v18, v20);

    if (v13)
    {
      int v21 = objc_alloc_init(GEOPDPublisherViewResultFilter);
      int v22 = [v13 keywordIdentifier];
      -[GEOPDPublisherViewResultFilter setFilterKeyword:]((uint64_t)v21, v22);

      if (v21)
      {
        int v23 = 2;
LABEL_10:
        *(unsigned char *)&v21->_flags |= 0x10u;
        *(unsigned char *)&v21->_flags |= 1u;
        v21->_filterType = v23;
      }
    }
    else
    {
      if (!v14)
      {
LABEL_12:
        [v17 addRequestedComponentsForReason:13 traits:v15 count:1];
        uint64_t v25 = objc_alloc_init(GEOPDPlaceRequestParameters);
        -[GEOPDPlaceRequestParameters setPublisherViewParameters:]((uint64_t)v25, v18);
        [v17 setPlaceRequestParameters:v25];

        goto LABEL_13;
      }
      int v21 = objc_alloc_init(GEOPDPublisherViewResultFilter);
      uint64_t v24 = [v14 addressIdentifier];
      -[GEOPDPublisherViewResultFilter setFilterAddress:]((uint64_t)v21, v24);

      if (v21)
      {
        int v23 = 1;
        goto LABEL_10;
      }
    }
    -[GEOPDPublisherViewParameters setResultFilter:]((uint64_t)v18, v21);

    goto LABEL_12;
  }
LABEL_13:

  return v17;
}

- (GEOPDPlaceRequest)initWithGuideHomeWithFilter:(id)a3 guideLocation:(id)a4 withTraits:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  double v11 = [(GEOPDPlaceRequest *)self _initWithTraits:v10 includeHistoricalLocations:0 supportedMapsResultTypes:&unk_1ED73F208];
  id v12 = v11;
  if (v11)
  {
    [(GEOPDPlaceRequest *)v11 setRequestType:53];
    id v13 = objc_alloc_init(GEOPDGuidesHomeParameters);
    -[GEOPDGuidesHomeParameters addSupportedFixedSectionType:]((uint64_t)v13);
    -[GEOPDGuidesHomeParameters addSupportedFixedSectionType:]((uint64_t)v13);
    -[GEOPDGuidesHomeParameters addSupportedFixedSectionType:]((uint64_t)v13);
    -[GEOPDGuidesHomeParameters addSupportedRepeatableSectionType:]((uint64_t)v13);
    -[GEOPDGuidesHomeParameters addSupportedRepeatableSectionType:]((uint64_t)v13);
    -[GEOPDGuidesHomeParameters addSupportedRepeatableSectionType:]((uint64_t)v13);
    -[GEOPDGuidesHomeParameters addSupportedRepeatableSectionType:]((uint64_t)v13);
    id v14 = +[GEOPDViewportInfo viewportInfoForTraits:v10];
    -[GEOPDGuidesHomeParameters setViewportInfo:]((uint64_t)v13, v14);
    if (v8)
    {
      id v15 = objc_alloc_init(GEOPDGuidesHomeResultFilter);
      id v16 = v15;
      if (v15)
      {
        *(unsigned char *)&v15->_flags |= 0x10u;
        *(unsigned char *)&v15->_flags |= 1u;
        v15->_filterType = 1;
      }
      id v17 = [v8 conceptFilter];
      -[GEOPDGuidesHomeResultFilter setFilterConcept:]((uint64_t)v16, v17);

      -[GEOPDGuidesHomeParameters setResultFilter:]((uint64_t)v13, v16);
    }
    uint64_t v18 = [v9 pdWorldwideLocationEntry];

    if (v18)
    {
      uint64_t v19 = objc_alloc_init(GEOPDGuidesLocationEntry);
      id v20 = [v9 pdWorldwideLocationEntry];
      -[GEOPDGuidesLocationEntry setWorldwide:]((uint64_t)v19, v20);

      if (v19)
      {
        *(_WORD *)&v19->_flags |= 0x100u;
        *(_WORD *)&v19->_flags |= 2u;
        v19->_type = 2;
      }
    }
    else
    {
      int v21 = [v9 pdLocationEntry];

      if (!v21)
      {
LABEL_12:
        [(GEOPDPlaceRequest *)v12 addRequestedComponentsForReason:24 traits:v10 count:1];
        int v22 = objc_alloc_init(GEOPDPlaceRequestParameters);
        -[GEOPDPlaceRequestParameters setGuidesHomeParameters:]((uint64_t)v22, v13);
        [(GEOPDPlaceRequest *)v12 setPlaceRequestParameters:v22];

        goto LABEL_13;
      }
      uint64_t v19 = [v9 pdLocationEntry];
    }
    -[GEOPDGuidesHomeParameters setGuidesLocationEntry:]((uint64_t)v13, v19);

    goto LABEL_12;
  }
LABEL_13:

  return v12;
}

- (id)initForCuratedCollectionLookupWithIdentifiers:(id)a3 isBatchLookup:(BOOL)a4 overrideSuppress:(BOOL)a5 traits:(id)a6
{
  BOOL v7 = a5;
  BOOL v8 = a4;
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a6;
  id v12 = [(GEOPDPlaceRequest *)self _initWithTraits:v11 includeHistoricalLocations:0 supportedMapsResultTypes:&unk_1ED73F220];
  if (v12)
  {
    id v13 = [[GEOPDPlaceRequestParameters alloc] initWithIdentifiers:v10 resultProviderID:0];
    [v12 setPlaceRequestParameters:v13];
    [v12 setRequestType:23];
    if (v8)
    {
      [v12 addRequestedComponentsForReason:18 traits:v11 count:1];
    }
    else
    {
      [v12 addRequestedComponentsForReason:15 traits:v11 count:1];
      if (v7)
      {
        id v23 = v10;
        long long v26 = 0u;
        long long v27 = 0u;
        long long v24 = 0u;
        long long v25 = 0u;
        id v14 = [v12 requestedComponents];
        uint64_t v15 = [v14 countByEnumeratingWithState:&v24 objects:v28 count:16];
        if (v15)
        {
          uint64_t v16 = v15;
          uint64_t v17 = *(void *)v25;
          do
          {
            for (uint64_t i = 0; i != v16; ++i)
            {
              if (*(void *)v25 != v17) {
                objc_enumerationMutation(v14);
              }
              uint64_t v19 = *(void *)(*((void *)&v24 + 1) + 8 * i);
              if (v19 && (*(unsigned char *)(v19 + 44) & 4) != 0 && *(_DWORD *)(v19 + 32) == 65)
              {
                -[GEOPDComponentInfo filter]((id *)v19);
                id v20 = (id *)objc_claimAutoreleasedReturnValue();
                -[GEOPDComponentFilter placeCollectionFilter](v20);
                int v21 = (unsigned char *)objc_claimAutoreleasedReturnValue();

                if (v21)
                {
                  v21[28] |= 0x20u;
                  v21[24] = 1;
                }
              }
            }
            uint64_t v16 = [v14 countByEnumeratingWithState:&v24 objects:v28 count:16];
          }
          while (v16);
        }

        id v10 = v23;
      }
    }
  }
  return v12;
}

- (id)initForGuideLocationLookupWithIdentifiers:(id)a3 traits:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(GEOPDPlaceRequest *)self _initWithTraits:v7 includeHistoricalLocations:0 supportedMapsResultTypes:&unk_1ED73F238];
  if (v8)
  {
    id v9 = [[GEOPDPlaceRequestParameters alloc] initWithIdentifiers:v6 resultProviderID:0];
    [v8 setPlaceRequestParameters:v9];
    [v8 setRequestType:23];
    [v8 addRequestedComponentsForReason:23 traits:v7 count:1];
  }
  return v8;
}

- (id)initForCuratedCollectionItemLookupWithIdentifiers:(id)a3 collectionIdentifier:(id)a4 traits:(id)a5
{
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = [(GEOPDPlaceRequest *)self _initWithTraits:v10 includeHistoricalLocations:0 supportedMapsResultTypes:&unk_1ED73F250];
  if (v11)
  {
    id v12 = [MEMORY[0x1E4F1C978] arrayWithObject:v9];
    uint64_t v29 = v8;
    id v13 = [v12 arrayByAddingObjectsFromArray:v8];

    id v28 = v9;
    long long v26 = -[GEOPDPlaceRequestParameters initWithIdentifiers:resultProviderID:]([GEOPDPlaceRequestParameters alloc], "initWithIdentifiers:resultProviderID:", v13, [v9 resultProviderID]);
    objc_msgSend(v11, "setPlaceRequestParameters:");
    [v11 setRequestType:23];
    [v11 addRequestedComponentsForReason:16 traits:v10 count:1];
    long long v34 = 0u;
    long long v35 = 0u;
    long long v32 = 0u;
    long long v33 = 0u;
    id v27 = v11;
    id v14 = [v11 requestedComponents];
    uint64_t v15 = [v14 countByEnumeratingWithState:&v32 objects:v36 count:16];
    if (v15)
    {
      uint64_t v16 = v15;
      uint64_t v17 = *(void *)v33;
      do
      {
        for (uint64_t i = 0; i != v16; ++i)
        {
          if (*(void *)v33 != v17) {
            objc_enumerationMutation(v14);
          }
          uint64_t v19 = *(void *)(*((void *)&v32 + 1) + 8 * i);
          if (v19 && (*(unsigned char *)(v19 + 44) & 4) != 0 && *(_DWORD *)(v19 + 32) == 74)
          {
            id v20 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
            v30[0] = MEMORY[0x1E4F143A8];
            v30[1] = 3221225472;
            v30[2] = __116__GEOPDPlaceRequest_PlaceDataExtras__initForCuratedCollectionItemLookupWithIdentifiers_collectionIdentifier_traits___block_invoke;
            v30[3] = &unk_1E53F6228;
            id v31 = v20;
            id v21 = v20;
            [v29 enumerateObjectsUsingBlock:v30];
            int v22 = objc_alloc_init(GEOPDPlaceCollectionItemFilter);
            id v23 = (void *)[v21 copy];
            -[GEOPDPlaceCollectionItemFilter setItemIds:]((uint64_t)v22, v23);

            long long v24 = objc_alloc_init(GEOPDComponentFilter);
            -[GEOPDComponentFilter setPlaceCollectionItemFilter:]((uint64_t)v24, v22);
            -[GEOPDComponentInfo setFilter:](v19, v24);
          }
        }
        uint64_t v16 = [v14 countByEnumeratingWithState:&v32 objects:v36 count:16];
      }
      while (v16);
    }

    id v8 = v29;
    id v11 = v27;
    id v9 = v28;
  }

  return v11;
}

void __116__GEOPDPlaceRequest_PlaceDataExtras__initForCuratedCollectionItemLookupWithIdentifiers_collectionIdentifier_traits___block_invoke(uint64_t a1, void *a2)
{
  v2 = *(void **)(a1 + 32);
  id v3 = [a2 mapsIdentifier];
  [v2 addObject:v3];
}

- (GEOPDPlaceRequest)initWithAllCollectionViewWithBatchSize:(unsigned int)a3 keywordFilter:(id)a4 addressFilter:(id)a5 withTraits:(id)a6
{
  id v10 = a4;
  id v11 = a5;
  id v12 = a6;
  id v13 = [(GEOPDPlaceRequest *)self _initWithTraits:v12 includeHistoricalLocations:0 supportedMapsResultTypes:&unk_1ED73F268];
  id v14 = v13;
  if (v13)
  {
    [(GEOPDPlaceRequest *)v13 setRequestType:47];
    uint64_t v15 = objc_alloc_init(GEOPDAllCollectionsViewParameters);
    uint64_t v16 = +[GEOPDViewportInfo viewportInfoForTraits:v12];
    -[GEOPDAllCollectionsViewParameters setViewportInfo:]((uint64_t)v15, v16);

    if (v15)
    {
      *(unsigned char *)&v15->_flags |= 0x20u;
      *(unsigned char *)&v15->_flags |= 1u;
      v15->_numClientizedResults = a3;
    }
    if (v10)
    {
      uint64_t v17 = objc_alloc_init(GEOPDAllCollectionsViewResultFilter);
      uint64_t v18 = [v10 keywordIdentifier];
      -[GEOPDAllCollectionsViewResultFilter setFilterKeyword:]((uint64_t)v17, v18);

      if (v17)
      {
        int v19 = 2;
LABEL_10:
        *(unsigned char *)&v17->_flags |= 0x10u;
        *(unsigned char *)&v17->_flags |= 1u;
        v17->_filterType = v19;
      }
    }
    else
    {
      if (!v11)
      {
LABEL_12:
        [(GEOPDPlaceRequest *)v14 addRequestedComponentsForReason:17 traits:v12 count:1];
        id v21 = objc_alloc_init(GEOPDPlaceRequestParameters);
        -[GEOPDPlaceRequestParameters setAllCollectionsViewParameters:]((uint64_t)v21, v15);
        [(GEOPDPlaceRequest *)v14 setPlaceRequestParameters:v21];

        goto LABEL_13;
      }
      uint64_t v17 = objc_alloc_init(GEOPDAllCollectionsViewResultFilter);
      id v20 = [v11 addressIdentifier];
      -[GEOPDAllCollectionsViewResultFilter setFilterAddress:]((uint64_t)v17, v20);

      if (v17)
      {
        int v19 = 1;
        goto LABEL_10;
      }
    }
    -[GEOPDAllCollectionsViewParameters setResultFilter:]((uint64_t)v15, v17);

    goto LABEL_12;
  }
LABEL_13:

  return v14;
}

- (id)initCitySelectorViewWithTraits:(id)a3 batchSize:(unsigned int)a4
{
  id v6 = a3;
  id v7 = [(GEOPDPlaceRequest *)self _initWithTraits:v6 includeHistoricalLocations:0 supportedMapsResultTypes:&unk_1ED73F280];
  id v8 = v7;
  if (v7)
  {
    [v7 setRequestType:52];
    id v9 = objc_alloc_init(GEOPDAllGuidesLocationsViewParameters);
    id v10 = +[GEOPDViewportInfo viewportInfoForTraits:v6];
    -[GEOPDAllGuidesLocationsViewParameters setViewportInfo:]((uint64_t)v9, v10);

    if (v9)
    {
      *(unsigned char *)&v9->_flags |= 1u;
      v9->_numClientizedResults = a4;
    }
    [v8 addRequestedComponentsForReason:23 traits:v6 count:1];
    id v11 = objc_alloc_init(GEOPDPlaceRequestParameters);
    -[GEOPDPlaceRequestParameters setAllGuidesLocationsViewParameters:]((uint64_t)v11, v9);
    [v8 setPlaceRequestParameters:v11];
  }
  return v8;
}

- (id)initPlaceEnrichmentWithEnrichmentInfo:(id)a3 mapsIdentifier:(id)a4 traits:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = [(GEOPDPlaceRequest *)self _initWithTraits:v10 includeHistoricalLocations:0 supportedMapsResultTypes:&unk_1ED73F298];
  id v12 = v11;
  if (v11)
  {
    [v11 setRequestType:58];
    id v13 = objc_alloc_init(GEOPDPlacecardEnrichmentParameters);
    id v14 = objc_alloc(MEMORY[0x1E4F1CA48]);
    uint64_t v15 = [v8 pdEnrichmentInfo];
    uint64_t v16 = objc_msgSend(v14, "initWithObjects:", v15, 0);
    -[GEOPDPlacecardEnrichmentParameters setEnrichmentInfos:]((uint64_t)v13, v16);

    uint64_t v17 = [v9 mapsIdentifier];
    -[GEOPDPlacecardEnrichmentParameters setMapsId:]((uint64_t)v13, v17);

    [v12 addRequestedComponentsForReason:27 traits:v10 count:1];
    uint64_t v18 = objc_alloc_init(GEOPDPlaceRequestParameters);
    -[GEOPDPlaceRequestParameters setPlacecardEnrichmentParameters:]((uint64_t)v18, v13);
    [v12 setPlaceRequestParameters:v18];
  }
  return v12;
}

- (id)initEVChargerRefreshRequestWithMapsIdentifier:(id)a3 traits:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(GEOPDPlaceRequest *)self _initWithTraits:v7 includeHistoricalLocations:0 supportedMapsResultTypes:&unk_1ED73F2B0];
  if (v8)
  {
    id v9 = [[GEOPDPlaceRequestParameters alloc] initWithIdentifiers:v6 resultProviderID:0];
    [v8 setPlaceRequestParameters:v9];
    [v8 setRequestType:23];
    [v8 addRequestedComponentsForReason:29 traits:v7 count:1];
  }
  return v8;
}

- (id)initForHikingIntroTipWithMapItemIdentifier:(id)a3 traits:(id)a4
{
  v13[1] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  id v8 = [(GEOPDPlaceRequest *)self _initWithTraits:v7 includeHistoricalLocations:0 supportedMapsResultTypes:&unk_1ED73F2C8];
  if (v8)
  {
    id v9 = [GEOPDPlaceRequestParameters alloc];
    v13[0] = v6;
    id v10 = [MEMORY[0x1E4F1C978] arrayWithObjects:v13 count:1];
    id v11 = [(GEOPDPlaceRequestParameters *)v9 initWithIdentifiers:v10 resultProviderID:0];

    [v8 setPlaceRequestParameters:v11];
    [v8 setRequestType:23];
    [v8 addRequestedComponentsForReason:30 traits:v7 count:1];
  }
  return v8;
}

- (BOOL)hasResultProviderID
{
  int v3 = [(GEOPDPlaceRequest *)self requestType];
  if (v3 == 23)
  {
    id v4 = [(GEOPDPlaceRequest *)self placeRequestParameters];
    -[GEOPDPlaceRequestParameters mapsIdentifierPlaceLookupParameters](v4);
    id v5 = (unsigned char *)objc_claimAutoreleasedReturnValue();
    if (v5)
    {
      id v6 = &OBJC_IVAR___GEOPDMapsIdentifierPlaceLookupParameters__flags;
      goto LABEL_7;
    }
LABEL_11:
    BOOL v7 = 0;
    goto LABEL_8;
  }
  if (v3 != 5) {
    return 0;
  }
  id v4 = [(GEOPDPlaceRequest *)self placeRequestParameters];
  -[GEOPDPlaceRequestParameters placeLookupParameters](v4);
  id v5 = (unsigned char *)objc_claimAutoreleasedReturnValue();
  if (!v5) {
    goto LABEL_11;
  }
  id v6 = &OBJC_IVAR___GEOPDPlaceLookupParameters__flags;
LABEL_7:
  BOOL v7 = v5[*v6] & 1;
LABEL_8:

  return v7;
}

- (int)resultProviderID
{
  int v3 = [(GEOPDPlaceRequest *)self requestType];
  if (v3 == 23)
  {
    id v4 = [(GEOPDPlaceRequest *)self placeRequestParameters];
    -[GEOPDPlaceRequestParameters mapsIdentifierPlaceLookupParameters](v4);
    id v5 = (char *)objc_claimAutoreleasedReturnValue();
    if (v5)
    {
      id v6 = &OBJC_IVAR___GEOPDMapsIdentifierPlaceLookupParameters__resultProviderId;
      goto LABEL_7;
    }
LABEL_11:
    int v7 = 0;
    goto LABEL_8;
  }
  if (v3 != 5) {
    return 0;
  }
  id v4 = [(GEOPDPlaceRequest *)self placeRequestParameters];
  -[GEOPDPlaceRequestParameters placeLookupParameters](v4);
  id v5 = (char *)objc_claimAutoreleasedReturnValue();
  if (!v5) {
    goto LABEL_11;
  }
  id v6 = &OBJC_IVAR___GEOPDPlaceLookupParameters__resultProviderId;
LABEL_7:
  int v7 = *(_DWORD *)&v5[*v6];
LABEL_8:

  return v7;
}

- (id)pdSpatialPlaceLookupParametersArrayForParameters:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(v4, "count"));
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v6 = v4;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v14;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v14 != v9) {
          objc_enumerationMutation(v6);
        }
        id v11 = -[GEOPDPlaceRequest pdSpatialPlaceLookupParametersForParameters:](self, "pdSpatialPlaceLookupParametersForParameters:", *(void *)(*((void *)&v13 + 1) + 8 * i), (void)v13);
        [v5 addObject:v11];
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v8);
  }

  return v5;
}

- (id)pdSpatialPlaceLookupParametersForParameters:(id)a3
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  id v4 = objc_alloc_init(GEOPDSpatialPlaceLookupParameters);
  [v3 coordinate];
  if (v6 < -180.0 || v6 > 180.0 || v5 < -90.0 || v5 > 90.0 || ([v3 radius], v7 <= 0.0))
  {
    id v12 = [v3 mapRegion];

    if (v12)
    {
      long long v13 = [v3 mapRegion];
      -[GEOPDSpatialPlaceLookupParameters setMapRegion:]((uint64_t)v4, v13);
    }
    int v11 = [v3 maxResultCount];
    if (v4) {
      goto LABEL_11;
    }
  }
  else
  {
    uint64_t v8 = [GEOLatLng alloc];
    [v3 coordinate];
    uint64_t v9 = -[GEOLatLng initWithCoordinate:](v8, "initWithCoordinate:");
    -[GEOPDSpatialPlaceLookupParameters setCenter:]((uint64_t)v4, v9);

    [v3 radius];
    if (v4)
    {
      *(_WORD *)&v4->_flags |= 0x400u;
      *(_WORD *)&v4->_flags |= 2u;
      v4->_radius = (int)v10;
      int v11 = [v3 maxResultCount];
LABEL_11:
      char v14 = 0;
      *(_WORD *)&v4->_flags |= 0x400u;
      *(_WORD *)&v4->_flags |= 1u;
      v4->_count = v11;
      goto LABEL_12;
    }
    [v3 maxResultCount];
  }
  char v14 = 1;
LABEL_12:
  long long v15 = [v3 categories];
  uint64_t v16 = [v15 count];

  if (v16)
  {
    long long v33 = 0u;
    long long v34 = 0u;
    long long v31 = 0u;
    long long v32 = 0u;
    id v30 = v3;
    uint64_t v17 = [v3 categories];
    uint64_t v18 = [v17 countByEnumeratingWithState:&v31 objects:v35 count:16];
    if (v18)
    {
      uint64_t v19 = v18;
      uint64_t v20 = *(void *)v32;
      do
      {
        for (uint64_t i = 0; i != v19; ++i)
        {
          if (*(void *)v32 != v20) {
            objc_enumerationMutation(v17);
          }
          int v22 = _GEOPDSpatialPlaceLookupCategoryForCategory(*(__CFString **)(*((void *)&v31 + 1) + 8 * i));
          if (v22)
          {
            int v23 = v22;
            -[GEOPDSpatialPlaceLookupParameters addCategoryFilter:]((uint64_t)v4);
            char v24 = v23 == 23 ? v14 : 1;
            if ((v24 & 1) == 0)
            {
              __int16 flags = (__int16)v4->_flags;
              if ((flags & 4) == 0)
              {
                *(_WORD *)&v4->___int16 flags = flags | 0x400;
                *(_WORD *)&v4->_flags |= 4u;
                v4->_spatialPlaceLookupRequestVersiouint64_t n = 2;
              }
            }
          }
        }
        uint64_t v19 = [v17 countByEnumeratingWithState:&v31 objects:v35 count:16];
      }
      while (v19);
    }

    id v3 = v30;
  }
  else
  {
    long long v26 = [v3 poiCategoryFilter];

    if (v26)
    {
      id v27 = [v3 poiCategoryFilter];
      [v27 applyFilterToPlaceParameters:v4];
    }
  }
  if ((v14 & 1) == 0)
  {
    __int16 v28 = (__int16)v4->_flags;
    if ((v28 & 4) == 0)
    {
      *(_WORD *)&v4->___int16 flags = v28 | 0x400;
      *(_WORD *)&v4->_flags |= 4u;
      v4->_spatialPlaceLookupRequestVersiouint64_t n = 1;
    }
  }

  return v4;
}

- (id)pdSpatialEventLookupParametersArrayForParameters:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  double v5 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(v4, "count"));
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v6 = v4;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v14;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v14 != v9) {
          objc_enumerationMutation(v6);
        }
        int v11 = -[GEOPDPlaceRequest pdSpatialEventLookupParametersForParameters:](self, "pdSpatialEventLookupParametersForParameters:", *(void *)(*((void *)&v13 + 1) + 8 * i), (void)v13);
        [v5 addObject:v11];
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v8);
  }

  return v5;
}

- (id)pdSpatialEventLookupParametersForParameters:(id)a3
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  id v4 = objc_alloc_init(GEOPDSpatialEventLookupParameters);
  double v5 = [GEOLatLng alloc];
  [v3 coordinate];
  id v6 = -[GEOLatLng initWithCoordinate:](v5, "initWithCoordinate:");
  -[GEOPDSpatialEventLookupParameters setCenter:]((uint64_t)v4, v6);

  int v7 = [v3 maxResultCount];
  if (v4)
  {
    *(unsigned char *)&v4->_flags |= 0x40u;
    *(unsigned char *)&v4->_flags |= 2u;
    v4->_count = v7;
  }
  uint64_t v8 = [v3 dateInterval];
  uint64_t v9 = [v8 startDate];
  [v9 timeIntervalSinceReferenceDate];
  double v11 = v10;

  id v12 = [v3 dateInterval];
  [v12 duration];
  double v14 = v13;

  if (v4)
  {
    *(unsigned char *)&v4->_flags |= 0x40u;
    *(unsigned char *)&v4->_flags |= 1u;
    *(void *)&v4->_timeRange._duratiouint64_t n = v14 | ((unint64_t)v11 << 32);
    v4->_timeRange._has = ($B85216D09A238EDB5177F50F3CAD2EB5)3;
  }
  [v3 radius];
  if (v15 > 0.0)
  {
    [v3 radius];
    if (v4)
    {
      *(unsigned char *)&v4->_flags |= 0x40u;
      *(unsigned char *)&v4->_flags |= 4u;
      v4->_radius = (int)v16;
    }
  }
  long long v25 = 0u;
  long long v26 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  uint64_t v17 = objc_msgSend(v3, "categories", 0);
  uint64_t v18 = [v17 countByEnumeratingWithState:&v23 objects:v27 count:16];
  if (v18)
  {
    uint64_t v19 = v18;
    uint64_t v20 = *(void *)v24;
    do
    {
      for (uint64_t i = 0; i != v19; ++i)
      {
        if (*(void *)v24 != v20) {
          objc_enumerationMutation(v17);
        }
        if (_GEOPDSpatialEventLookupCategoryForCategory(*(__CFString **)(*((void *)&v23 + 1) + 8 * i))) {
          -[GEOPDSpatialEventLookupParameters addCategoryFilter:]((uint64_t)v4);
        }
      }
      uint64_t v19 = [v17 countByEnumeratingWithState:&v23 objects:v27 count:16];
    }
    while (v19);
  }

  return v4;
}

@end