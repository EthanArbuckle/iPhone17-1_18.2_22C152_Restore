@interface GEOPDPlaceRequestParameters
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (GEOPDPlaceRequestParameters)init;
- (GEOPDPlaceRequestParameters)initWithAirportCode:(id)a3 terminalCode:(id)a4 gateCode:(id)a5 traits:(id)a6;
- (GEOPDPlaceRequestParameters)initWithBatchReverseGeocodeLocations:(id)a3 additionalPlaceTypes:(int *)a4 additionalPlaceTypesCount:(unint64_t)a5 traits:(id)a6;
- (GEOPDPlaceRequestParameters)initWithBrandMUID:(unint64_t)a3 traits:(id)a4;
- (GEOPDPlaceRequestParameters)initWithCanonicalLocationSearchQueryString:(id)a3;
- (GEOPDPlaceRequestParameters)initWithData:(id)a3;
- (GEOPDPlaceRequestParameters)initWithExternalBusinessID:(id)a3 contentProvider:(id)a4;
- (GEOPDPlaceRequestParameters)initWithExternalTransitStationCodes:(id)a3 sourceID:(id)a4 transactionDate:(id)a5 transactionLocation:(id)a6;
- (GEOPDPlaceRequestParameters)initWithForwardGeocodeAddress:(id)a3 maxResults:(unsigned int)a4 traits:(id)a5;
- (GEOPDPlaceRequestParameters)initWithForwardGeocodeAddressString:(id)a3 maxResults:(unsigned int)a4 traits:(id)a5;
- (GEOPDPlaceRequestParameters)initWithIdentifiers:(id)a3 resultProviderID:(int)a4;
- (GEOPDPlaceRequestParameters)initWithMapItemToRefine:(id)a3 coordinate:(id)a4 traits:(id)a5;
- (GEOPDPlaceRequestParameters)initWithMapItemToRefine:(id)a3 traits:(id)a4;
- (GEOPDPlaceRequestParameters)initWithMerchantCode:(id)a3 rawMerchantCode:(id)a4 relyingPartyIdentifier:(id)a5 industryCategory:(id)a6 industryCode:(id)a7 paymentNetwork:(id)a8 transactionDate:(id)a9 transactionLocation:(id)a10 terminalId:(id)a11 transactionCurrencyCode:(id)a12 transactionType:(int)a13 transactionId:(id)a14 warsawMerchantDomain:(id)a15 warsawMerchantName:(id)a16 warsawMerchantId:(id)a17 adamId:(id)a18 merchantId:(id)a19 merchantDoingBizAsName:(id)a20 merchantEnhancedName:(id)a21 merchantCity:(id)a22 merchantRawCity:(id)a23 merchantState:(id)a24 merchantRawState:(id)a25 merchantZip:(id)a26 merchantAddress:(id)a27 merchantRawAddress:(id)a28 merchantCountryCode:(id)a29 merchantType:(id)a30 merchantCleanConfidenceLevel:(id)a31 merchantAdditionalData:(id)a32 merchantCanl:(id)a33 brandFallbackSupported:(BOOL)a34 isSettlement:(BOOL)a35 isRefund:(BOOL)a36 fuzzyMatched:(id)a37 coarseLocationUsed:(id)a38 bankTransactionType:(int)a39 bankTransactionStatus:(int)a40 bankAnonymisedUserId:(id)a41 otherBankTransactionLocations:(id)a42 bankTransactionDescription:(id)a43 bankTransactionTimestamp:(id)a44 bankRawMerchantCode:(id)a45 bankIndustryCategory:(id)a46 bankIndustryCode:(id)a47 bankTransactionCurrencyCode:(id)a48 bankMerchantInfo:(id)a49 baaCerts:(id)a50 baaSignature:(id)a51 bankBrandMUIDFallbackEnabled:(id)a52 bankIdentifier:(id)a53 bankTransactionDescriptionClean:(id)a54 bankPIIRedactionIsApplied:(id)a55 bankRotationPeriodsSinceEpoch:(id)a56 traits:(id)a57;
- (GEOPDPlaceRequestParameters)initWithPlaceRefinementParameters:(id)a3 traits:(id)a4;
- (GEOPDPlaceRequestParameters)initWithReverseGeocodeCoordinate:(id)a3;
- (GEOPDPlaceRequestParameters)initWithReverseGeocodeCoordinate:(id)a3 preserveOriginalLocation:(BOOL)a4;
- (GEOPDPlaceRequestParameters)initWithReverseGeocodeCoordinate:(id)a3 preserveOriginalLocation:(BOOL)a4 floorOrdinal:(int)a5;
- (GEOPDPlaceRequestParameters)initWithReverseGeocodeLocation:(id)a3 preserveOriginalLocation:(BOOL)a4 placeTypeLimit:(int)a5;
- (GEOPDPlaceRequestParameters)initWithSearchQuery:(id)a3 entryMetadata:(id)a4 metadata:(id)a5 autocompleteEntry:(id)a6 retainedSearch:(id)a7 maxResults:(unsigned int)a8 filters:(id)a9 traits:(id)a10 routeInfo:(id)a11 error:(id *)a12 searchSessionData:(id)a13;
- (GEOPDPlaceRequestParameters)initWithSearchURLQuery:(id)a3 coordinate:(id)a4 maxResults:(unsigned int)a5 traits:(id)a6;
- (GEOPDPlaceRequestParameters)initWithSearchURLQuery:(id)a3 coordinate:(id)a4 muid:(unint64_t)a5 resultProviderId:(int)a6 contentProvider:(id)a7;
- (GEOPDPlaceRequestParameters)initWithSearchURLQuery:(id)a3 identifier:(id)a4;
- (GEOPDPlaceRequestParameters)initWithVendorSpecificPlaceRefinementParameters:(id)a3 traits:(id)a4;
- (id)_dictionaryRepresentation:(uint64_t)a1;
- (id)_initWithDictionary:(uint64_t)a3 isJSON:;
- (id)autocompleteParameters;
- (id)batchReverseGeocodingParameters;
- (id)brandLookupParameters;
- (id)canonicalLocationSearchParameters;
- (id)categorySearchParameters;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)externalTransitLookupParameters;
- (id)featureIdGeocodingParameters;
- (id)geocodingParameters;
- (id)groundViewLabelParameters;
- (id)ipGeoLookupParameters;
- (id)jsonRepresentation;
- (id)locationDirectedSearchParameters;
- (id)mapsIdentifierPlaceLookupParameters;
- (id)merchantLookupParameters;
- (id)placeLookupParameters;
- (id)placeRefinementParameters;
- (id)reverseGeocodingParameters;
- (id)searchParameters;
- (id)searchZeroKeywordCategorySuggestionParameters;
- (id)territoryLookupParameters;
- (id)transitNearbyPaymentMethodLookupParameters;
- (id)transitNearbyScheduleLookupParameters;
- (id)vendorSpecificPlaceRefinementParameters;
- (id)wifiFingerprintParameters;
- (uint64_t)hasGreenTeaWithValue:(uint64_t)result;
- (unint64_t)hash;
- (void)_readAddressObjectGeocodingParameters;
- (void)_readAllCollectionsViewParameters;
- (void)_readAllGuidesLocationsViewParameters;
- (void)_readAutocompleteParameters;
- (void)_readBatchPopularNearbySearchParameters;
- (void)_readBatchReverseGeocodingParameters;
- (void)_readBatchSpatialLookupParameters;
- (void)_readBrandLookupParameters;
- (void)_readBrowseCategorySuggestionParameters;
- (void)_readCanonicalLocationSearchParameters;
- (void)_readCategorySearchParameters;
- (void)_readCollectionSuggestionParameters;
- (void)_readExtendedGeoLookupParameters;
- (void)_readExternalTransitLookupParameters;
- (void)_readFeatureIdGeocodingParameters;
- (void)_readGeocodingParameters;
- (void)_readGroundViewLabelParameters;
- (void)_readGuidesHomeParameters;
- (void)_readIpGeoLookupParameters;
- (void)_readLocationDirectedSearchParameters;
- (void)_readMapsHomeParameters;
- (void)_readMapsIdentifierPlaceLookupParameters;
- (void)_readMapsSearchHomeParameters;
- (void)_readMerchantLookupParameters;
- (void)_readNearbySearchParameters;
- (void)_readOfflineRegionNameParameters;
- (void)_readPlaceCollectionLookupParameter;
- (void)_readPlaceLookupParameters;
- (void)_readPlaceQuestionnaireLookupParameters;
- (void)_readPlaceRefinementParameters;
- (void)_readPlacecardEnrichmentParameters;
- (void)_readPoiAtAddressLookupParameters;
- (void)_readPopularNearbySearchParameters;
- (void)_readPublisherViewParameters;
- (void)_readQueryUnderstandingParameters;
- (void)_readRefreshIdLookUpParameters;
- (void)_readReverseGeocodingParameters;
- (void)_readSearchCapabilitiesParameters;
- (void)_readSearchParameters;
- (void)_readSearchZeroKeywordCategorySuggestionParameters;
- (void)_readSiriSearchParameters;
- (void)_readTerritoryLookupParameters;
- (void)_readTransitNearbyPaymentMethodLookupParameters;
- (void)_readTransitNearbyScheduleLookupParameters;
- (void)_readVendorSpecificPlaceRefinementParameters;
- (void)_readWifiFingerprintParameters;
- (void)clearLocations;
- (void)clearUnknownFields:(uint64_t)a1;
- (void)mergeFrom:(void *)a1;
- (void)readAll:(uint64_t)a1;
- (void)setAddressObjectGeocodingParameters:(uint64_t)a1;
- (void)setAddressRecommendationParameters:(uint64_t)a1;
- (void)setAirportEntityPlaceLookupParameters:(uint64_t)a1;
- (void)setAllCollectionsViewParameters:(uint64_t)a1;
- (void)setAllGuidesLocationsViewParameters:(uint64_t)a1;
- (void)setAutocompleteParameters:(uint64_t)a1;
- (void)setBatchCategoryLookupParameters:(uint64_t)a1;
- (void)setBatchMerchantLookupBrandParameters:(uint64_t)a1;
- (void)setBatchPopularNearbySearchParameters:(uint64_t)a1;
- (void)setBatchReverseGeocodingParameters:(uint64_t)a1;
- (void)setBatchSpatialLookupParameters:(uint64_t)a1;
- (void)setBrandLookupParameters:(uint64_t)a1;
- (void)setBrowseCategorySuggestionParameters:(uint64_t)a1;
- (void)setCanonicalLocationSearchParameters:(uint64_t)a1;
- (void)setCategorySearchParameters:(uint64_t)a1;
- (void)setChildPlaceLookupByCategoryParameters:(uint64_t)a1;
- (void)setCollectionSuggestionParameters:(uint64_t)a1;
- (void)setExtendedGeoLookupParameters:(uint64_t)a1;
- (void)setExternalTransitLookupParameters:(uint64_t)a1;
- (void)setFeatureIdGeocodingParameters:(uint64_t)a1;
- (void)setGeocodingParameters:(uint64_t)a1;
- (void)setGroundViewLabelParameters:(uint64_t)a1;
- (void)setGuidesHomeParameters:(uint64_t)a1;
- (void)setIpGeoLookupParameters:(uint64_t)a1;
- (void)setLocationDirectedSearchParameters:(uint64_t)a1;
- (void)setMapsHomeParameters:(uint64_t)a1;
- (void)setMapsIdentifierPlaceLookupParameters:(uint64_t)a1;
- (void)setMapsSearchHomeParameters:(uint64_t)a1;
- (void)setMerchantLookupParameters:(uint64_t)a1;
- (void)setNearbySearchParameters:(uint64_t)a1;
- (void)setOfflineRegionNameParameters:(uint64_t)a1;
- (void)setPlaceCollectionLookupParameter:(uint64_t)a1;
- (void)setPlaceLookupParameters:(uint64_t)a1;
- (void)setPlaceQuestionnaireLookupParameters:(uint64_t)a1;
- (void)setPlaceRefinementParameters:(uint64_t)a1;
- (void)setPlacecardEnrichmentParameters:(uint64_t)a1;
- (void)setPoiAtAddressLookupParameters:(uint64_t)a1;
- (void)setPopularNearbySearchParameters:(uint64_t)a1;
- (void)setPublisherViewParameters:(uint64_t)a1;
- (void)setQueryUnderstandingParameters:(uint64_t)a1;
- (void)setRefreshIdLookUpParameters:(uint64_t)a1;
- (void)setReverseGeocodingParameters:(uint64_t)a1;
- (void)setSearchCapabilitiesParameters:(uint64_t)a1;
- (void)setSearchFieldPlaceholderParameters:(uint64_t)a1;
- (void)setSearchParameters:(uint64_t)a1;
- (void)setSearchZeroKeywordCategorySuggestionParameters:(uint64_t)a1;
- (void)setSearchZeroKeywordWithSearchResultsSuggestionParameters:(uint64_t)a1;
- (void)setSiriSearchParameters:(uint64_t)a1;
- (void)setTerritoryLookupParameters:(uint64_t)a1;
- (void)setTransitNearbyPaymentMethodLookupParameters:(uint64_t)a1;
- (void)setTransitNearbyScheduleLookupParameters:(uint64_t)a1;
- (void)setTransitScheduleLookupParameter:(uint64_t)a1;
- (void)setTransitVehiclePositionParameters:(uint64_t)a1;
- (void)setVendorSpecificPlaceRefinementParameters:(uint64_t)a1;
- (void)setWifiFingerprintParameters:(uint64_t)a1;
- (void)writeTo:(id)a3;
@end

@implementation GEOPDPlaceRequestParameters

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  os_unfair_lock_lock(&self->_readerLock);
  reader = self->_reader;
  if (!reader) {
    goto LABEL_5;
  }
  v7 = reader;
  objc_sync_enter(v7);
  if (*((unsigned char *)&self->_flags + 7))
  {
    objc_sync_exit(v7);

LABEL_5:
    os_unfair_lock_unlock(&self->_readerLock);
    -[GEOPDPlaceRequestParameters readAll:]((uint64_t)self, 0);
    id v8 = [(GEOPDSearchParameters *)self->_searchParameters copyWithZone:a3];
    v9 = *(void **)(v5 + 376);
    *(void *)(v5 + 376) = v8;

    id v10 = [(GEOPDGeocodingParameters *)self->_geocodingParameters copyWithZone:a3];
    v11 = *(void **)(v5 + 184);
    *(void *)(v5 + 184) = v10;

    id v12 = [(GEOPDCanonicalLocationSearchParameters *)self->_canonicalLocationSearchParameters copyWithZone:a3];
    v13 = *(void **)(v5 + 128);
    *(void *)(v5 + 128) = v12;

    id v14 = [(GEOPDReverseGeocodingParameters *)self->_reverseGeocodingParameters copyWithZone:a3];
    v15 = *(void **)(v5 + 352);
    *(void *)(v5 + 352) = v14;

    id v16 = [(GEOPDPlaceLookupParameters *)self->_placeLookupParameters copyWithZone:a3];
    v17 = *(void **)(v5 + 280);
    *(void *)(v5 + 280) = v16;

    id v18 = [(GEOPDMerchantLookupParameters *)self->_merchantLookupParameters copyWithZone:a3];
    v19 = *(void **)(v5 + 248);
    *(void *)(v5 + 248) = v18;

    id v20 = [(GEOPDPlaceRefinementParameters *)self->_placeRefinementParameters copyWithZone:a3];
    v21 = *(void **)(v5 + 296);
    *(void *)(v5 + 296) = v20;

    id v22 = [(GEOPDSiriSearchParameters *)self->_siriSearchParameters copyWithZone:a3];
    v23 = *(void **)(v5 + 400);
    *(void *)(v5 + 400) = v22;

    id v24 = [(GEOPDLocationDirectedSearchParameters *)self->_locationDirectedSearchParameters copyWithZone:a3];
    v25 = *(void **)(v5 + 216);
    *(void *)(v5 + 216) = v24;

    id v26 = [(GEOPDAutocompleteParameters *)self->_autocompleteParameters copyWithZone:a3];
    v27 = *(void **)(v5 + 64);
    *(void *)(v5 + 64) = v26;

    id v28 = [(GEOPDSearchBrowseCategorySuggestionParameters *)self->_browseCategorySuggestionParameters copyWithZone:a3];
    v29 = *(void **)(v5 + 120);
    *(void *)(v5 + 120) = v28;

    id v30 = [(GEOPDCategorySearchParameters *)self->_categorySearchParameters copyWithZone:a3];
    v31 = *(void **)(v5 + 136);
    *(void *)(v5 + 136) = v30;

    id v32 = [(GEOPDPopularNearbySearchParameters *)self->_popularNearbySearchParameters copyWithZone:a3];
    v33 = *(void **)(v5 + 320);
    *(void *)(v5 + 320) = v32;

    id v34 = [(GEOPDSearchZeroKeywordCategorySuggestionParameters *)self->_searchZeroKeywordCategorySuggestionParameters copyWithZone:a3];
    v35 = *(void **)(v5 + 384);
    *(void *)(v5 + 384) = v34;

    id v36 = [(GEOPDSearchFieldPlaceholderParameters *)self->_searchFieldPlaceholderParameters copyWithZone:a3];
    v37 = *(void **)(v5 + 368);
    *(void *)(v5 + 368) = v36;

    id v38 = [(GEOPDBatchPopularNearbySearchParameters *)self->_batchPopularNearbySearchParameters copyWithZone:a3];
    v39 = *(void **)(v5 + 88);
    *(void *)(v5 + 88) = v38;

    id v40 = [(GEOPDVendorSpecificPlaceRefinementParameters *)self->_vendorSpecificPlaceRefinementParameters copyWithZone:a3];
    v41 = *(void **)(v5 + 448);
    *(void *)(v5 + 448) = v40;

    id v42 = [(GEOPDNearbySearchParameters *)self->_nearbySearchParameters copyWithZone:a3];
    v43 = *(void **)(v5 + 256);
    *(void *)(v5 + 256) = v42;

    id v44 = [(GEOPDAddressObjectGeocodingParameters *)self->_addressObjectGeocodingParameters copyWithZone:a3];
    v45 = *(void **)(v5 + 24);
    *(void *)(v5 + 24) = v44;

    id v46 = [(GEOPDSearchZeroKeywordWithSearchResultsSuggestionParameters *)self->_searchZeroKeywordWithSearchResultsSuggestionParameters copyWithZone:a3];
    v47 = *(void **)(v5 + 392);
    *(void *)(v5 + 392) = v46;

    id v48 = [(GEOPDExternalTransitLookupParameters *)self->_externalTransitLookupParameters copyWithZone:a3];
    v49 = *(void **)(v5 + 168);
    *(void *)(v5 + 168) = v48;

    id v50 = [(GEOPDFeatureIdGeocodingParameters *)self->_featureIdGeocodingParameters copyWithZone:a3];
    v51 = *(void **)(v5 + 176);
    *(void *)(v5 + 176) = v50;

    id v52 = [(GEOPDMapsIdentifierPlaceLookupParameters *)self->_mapsIdentifierPlaceLookupParameters copyWithZone:a3];
    v53 = *(void **)(v5 + 232);
    *(void *)(v5 + 232) = v52;

    id v54 = [(GEOPDBatchReverseGeocodingParameters *)self->_batchReverseGeocodingParameters copyWithZone:a3];
    v55 = *(void **)(v5 + 96);
    *(void *)(v5 + 96) = v54;

    id v56 = [(GEOPDBrandLookupParameters *)self->_brandLookupParameters copyWithZone:a3];
    v57 = *(void **)(v5 + 112);
    *(void *)(v5 + 112) = v56;

    id v58 = [(GEOPDWifiFingerprintParameters *)self->_wifiFingerprintParameters copyWithZone:a3];
    v59 = *(void **)(v5 + 456);
    *(void *)(v5 + 456) = v58;

    id v60 = [(GEOPDIpGeoLookupParameters *)self->_ipGeoLookupParameters copyWithZone:a3];
    v61 = *(void **)(v5 + 208);
    *(void *)(v5 + 208) = v60;

    id v62 = [(GEOPDGroundViewLabelParameters *)self->_groundViewLabelParameters copyWithZone:a3];
    v63 = *(void **)(v5 + 192);
    *(void *)(v5 + 192) = v62;

    id v64 = [(GEOPDBatchSpatialLookupParameters *)self->_batchSpatialLookupParameters copyWithZone:a3];
    v65 = *(void **)(v5 + 104);
    *(void *)(v5 + 104) = v64;

    id v66 = [(GEOPDTransitVehiclePositionParameters *)self->_transitVehiclePositionParameters copyWithZone:a3];
    v67 = *(void **)(v5 + 440);
    *(void *)(v5 + 440) = v66;

    id v68 = [(GEOPDPlaceCollectionLookupParameters *)self->_placeCollectionLookupParameter copyWithZone:a3];
    v69 = *(void **)(v5 + 272);
    *(void *)(v5 + 272) = v68;

    id v70 = [(GEOPBTransitScheduleLookupParameters *)self->_transitScheduleLookupParameter copyWithZone:a3];
    v71 = *(void **)(v5 + 432);
    *(void *)(v5 + 432) = v70;

    id v72 = [(GEOPDBatchCategoryLookupParameters *)self->_batchCategoryLookupParameters copyWithZone:a3];
    v73 = *(void **)(v5 + 72);
    *(void *)(v5 + 72) = v72;

    id v74 = [(GEOPDBatchMerchantLookupBrandParameters *)self->_batchMerchantLookupBrandParameters copyWithZone:a3];
    v75 = *(void **)(v5 + 80);
    *(void *)(v5 + 80) = v74;

    id v76 = [(GEOPDChildPlaceLookupByCategoryParameters *)self->_childPlaceLookupByCategoryParameters copyWithZone:a3];
    v77 = *(void **)(v5 + 144);
    *(void *)(v5 + 144) = v76;

    id v78 = [(GEOPDCollectionSuggestionParameters *)self->_collectionSuggestionParameters copyWithZone:a3];
    v79 = *(void **)(v5 + 152);
    *(void *)(v5 + 152) = v78;

    id v80 = [(GEOPDMapsSearchHomeParameters *)self->_mapsSearchHomeParameters copyWithZone:a3];
    v81 = *(void **)(v5 + 240);
    *(void *)(v5 + 240) = v80;

    id v82 = [(GEOPDPlaceQuestionnaireLookupParameters *)self->_placeQuestionnaireLookupParameters copyWithZone:a3];
    v83 = *(void **)(v5 + 288);
    *(void *)(v5 + 288) = v82;

    id v84 = [(GEOPDPublisherViewParameters *)self->_publisherViewParameters copyWithZone:a3];
    v85 = *(void **)(v5 + 328);
    *(void *)(v5 + 328) = v84;

    id v86 = [(GEOPDAllCollectionsViewParameters *)self->_allCollectionsViewParameters copyWithZone:a3];
    v87 = *(void **)(v5 + 48);
    *(void *)(v5 + 48) = v86;

    id v88 = [(GEOPDAirportEntityPlaceLookupParameters *)self->_airportEntityPlaceLookupParameters copyWithZone:a3];
    v89 = *(void **)(v5 + 40);
    *(void *)(v5 + 40) = v88;

    id v90 = [(GEOPDTerritoryLookupParameters *)self->_territoryLookupParameters copyWithZone:a3];
    v91 = *(void **)(v5 + 408);
    *(void *)(v5 + 408) = v90;

    id v92 = [(GEOPDTransitNearbyScheduleLookupParameters *)self->_transitNearbyScheduleLookupParameters copyWithZone:a3];
    v93 = *(void **)(v5 + 424);
    *(void *)(v5 + 424) = v92;

    id v94 = [(GEOPDMapsHomeParameters *)self->_mapsHomeParameters copyWithZone:a3];
    v95 = *(void **)(v5 + 224);
    *(void *)(v5 + 224) = v94;

    id v96 = [(GEOPDAllGuidesLocationsViewParameters *)self->_allGuidesLocationsViewParameters copyWithZone:a3];
    v97 = *(void **)(v5 + 56);
    *(void *)(v5 + 56) = v96;

    id v98 = [(GEOPDGuidesHomeParameters *)self->_guidesHomeParameters copyWithZone:a3];
    v99 = *(void **)(v5 + 200);
    *(void *)(v5 + 200) = v98;

    id v100 = [(GEOPDExtendedGeoLookupParameters *)self->_extendedGeoLookupParameters copyWithZone:a3];
    v101 = *(void **)(v5 + 160);
    *(void *)(v5 + 160) = v100;

    id v102 = [(GEOPDQueryUnderstandingParameters *)self->_queryUnderstandingParameters copyWithZone:a3];
    v103 = *(void **)(v5 + 336);
    *(void *)(v5 + 336) = v102;

    id v104 = [(GEOPDPoiAtAddressLookupParameters *)self->_poiAtAddressLookupParameters copyWithZone:a3];
    v105 = *(void **)(v5 + 312);
    *(void *)(v5 + 312) = v104;

    id v106 = [(GEOPDTransitNearbyPaymentMethodLookupParameters *)self->_transitNearbyPaymentMethodLookupParameters copyWithZone:a3];
    v107 = *(void **)(v5 + 416);
    *(void *)(v5 + 416) = v106;

    id v108 = [(GEOPDPlacecardEnrichmentParameters *)self->_placecardEnrichmentParameters copyWithZone:a3];
    v109 = *(void **)(v5 + 304);
    *(void *)(v5 + 304) = v108;

    id v110 = [(GEOPDOfflineRegionNameParameters *)self->_offlineRegionNameParameters copyWithZone:a3];
    v111 = *(void **)(v5 + 264);
    *(void *)(v5 + 264) = v110;

    id v112 = [(GEOPDSearchCapabilitiesParameters *)self->_searchCapabilitiesParameters copyWithZone:a3];
    v113 = *(void **)(v5 + 360);
    *(void *)(v5 + 360) = v112;

    id v114 = [(GEOPDRefreshIdLookUpParameters *)self->_refreshIdLookUpParameters copyWithZone:a3];
    v115 = *(void **)(v5 + 344);
    *(void *)(v5 + 344) = v114;

    id v116 = [(GEOPDAddressRecommendationParameters *)self->_addressRecommendationParameters copyWithZone:a3];
    v117 = *(void **)(v5 + 32);
    *(void *)(v5 + 32) = v116;

    objc_storeStrong((id *)(v5 + 16), self->_unknownFields);
    return (id)v5;
  }
  *(void *)((char *)self->_reader + (int)*MEMORY[0x1E4F940E0]) = self->_readerMarkLength;
  [(PBDataReader *)self->_reader seekToOffset:self->_readerMarkPos];
  GEOPDPlaceRequestParametersReadAllFrom(v5, self->_reader, 0);
  os_unfair_lock_unlock(&self->_readerLock);
  objc_sync_exit(v7);

  return (id)v5;
}

- (GEOPDPlaceRequestParameters)init
{
  v6.receiver = self;
  v6.super_class = (Class)GEOPDPlaceRequestParameters;
  v2 = [(GEOPDPlaceRequestParameters *)&v6 init];
  v3 = v2;
  if (v2)
  {
    v2->_readerLock._os_unfair_lock_opaque = 0;
    v4 = v2;
  }

  return v3;
}

- (void)readAll:(uint64_t)a1
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 472));
    v4 = *(void **)(a1 + 8);
    if (v4)
    {
      id v5 = v4;
      objc_sync_enter(v5);
      if (a2) {
        objc_super v6 = (int *)&readAll__recursiveTag_5776;
      }
      else {
        objc_super v6 = (int *)&readAll__nonRecursiveTag_5777;
      }
      GEOPDPlaceRequestParametersReadSpecified(a1, *(void *)(a1 + 8), v6);
      objc_sync_exit(v5);
    }
    if (a2) {
      _GEOPDPlaceRequestParametersCallReadAllRecursiveWithoutSynchronized(a1);
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 472));
  }
}

- (void)_readMapsIdentifierPlaceLookupParameters
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 472));
    if ((*(unsigned char *)(a1 + 479) & 8) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOPDPlaceRequestParametersReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readMapsIdentifierPlaceLookupParameters_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 472));
  }
}

- (id)placeRefinementParameters
{
  if (a1)
  {
    v2 = a1;
    -[GEOPDPlaceRequestParameters _readPlaceRefinementParameters]((uint64_t)a1);
    a1 = (id *)v2[37];
    uint64_t v1 = vars8;
  }
  return a1;
}

- (void)_readPlaceRefinementParameters
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 472));
    if ((*(unsigned char *)(a1 + 480) & 8) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOPDPlaceRequestParametersReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readPlaceRefinementParameters_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 472));
  }
}

- (GEOPDPlaceRequestParameters)initWithMapItemToRefine:(id)a3 coordinate:(id)a4 traits:(id)a5
{
  double var1 = a4.var1;
  double var0 = a4.var0;
  id v8 = a3;
  v13.receiver = self;
  v13.super_class = (Class)GEOPDPlaceRequestParameters;
  v9 = [(GEOPDPlaceRequestParameters *)&v13 init];
  if (v9)
  {
    id v10 = -[GEOPDPlaceRefinementParameters initWithMapItemToRefine:coordinate:]([GEOPDPlaceRefinementParameters alloc], "initWithMapItemToRefine:coordinate:", v8, var0, var1);
    -[GEOPDPlaceRequestParameters setPlaceRefinementParameters:]((uint64_t)v9, v10);
    v11 = v9;
  }
  return v9;
}

- (void)setPlaceRefinementParameters:(uint64_t)a1
{
  id v4 = a2;
  if (a1)
  {
    *(void *)(a1 + 476) |= 0x100000800000000uLL;
    objc_storeStrong((id *)(a1 + 296), a2);
  }
}

- (GEOPDPlaceRequestParameters)initWithReverseGeocodeLocation:(id)a3 preserveOriginalLocation:(BOOL)a4 placeTypeLimit:(int)a5
{
  id v8 = a3;
  v14.receiver = self;
  v14.super_class = (Class)GEOPDPlaceRequestParameters;
  v9 = [(GEOPDPlaceRequestParameters *)&v14 init];
  if (v9)
  {
    id v10 = objc_alloc_init(GEOPDReverseGeocodingParameters);
    -[GEOPDReverseGeocodingParameters addExtendedLocation:]((uint64_t)v10, v8);
    if (v10)
    {
      *(unsigned char *)&v10->_flags |= 0x20u;
      *(unsigned char *)&v10->_flags |= 2u;
      v10->_preserveOriginalLocation = a4;
      if (a5)
      {
        int v11 = _PDPlaceTypeForMapItemPlaceType(a5);
        *(unsigned char *)&v10->_flags |= 0x20u;
        *(unsigned char *)&v10->_flags |= 1u;
        v10->_placeTypeLimit = v11;
      }
    }
    -[GEOPDPlaceRequestParameters setReverseGeocodingParameters:]((uint64_t)v9, v10);
    id v12 = v9;
  }
  return v9;
}

- (void)setReverseGeocodingParameters:(uint64_t)a1
{
  id v4 = a2;
  if (a1)
  {
    *(void *)(a1 + 476) |= 0x100040000000000uLL;
    objc_storeStrong((id *)(a1 + 352), a2);
  }
}

- (void)setMapsHomeParameters:(uint64_t)a1
{
  id v4 = a2;
  if (a1)
  {
    *(void *)(a1 + 476) |= 0x100000004000000uLL;
    objc_storeStrong((id *)(a1 + 224), a2);
  }
}

- (id)reverseGeocodingParameters
{
  if (a1)
  {
    v2 = a1;
    -[GEOPDPlaceRequestParameters _readReverseGeocodingParameters]((uint64_t)a1);
    a1 = (id *)v2[44];
    uint64_t v1 = vars8;
  }
  return a1;
}

- (void)_readReverseGeocodingParameters
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 472));
    if ((*(unsigned char *)(a1 + 481) & 4) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOPDPlaceRequestParametersReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readReverseGeocodingParameters_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 472));
  }
}

- (id)searchParameters
{
  if (a1)
  {
    v2 = a1;
    -[GEOPDPlaceRequestParameters _readSearchParameters]((uint64_t)a1);
    a1 = (id *)v2[47];
    uint64_t v1 = vars8;
  }
  return a1;
}

- (void)_readSearchParameters
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 472));
    if ((*(unsigned char *)(a1 + 481) & 0x20) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOPDPlaceRequestParametersReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readSearchParameters_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 472));
  }
}

- (id)wifiFingerprintParameters
{
  if (a1)
  {
    v2 = a1;
    -[GEOPDPlaceRequestParameters _readWifiFingerprintParameters]((uint64_t)a1);
    a1 = (id *)v2[57];
    uint64_t v1 = vars8;
  }
  return a1;
}

- (void)_readWifiFingerprintParameters
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 472));
    if ((*(unsigned char *)(a1 + 482) & 0x80) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOPDPlaceRequestParametersReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readWifiFingerprintParameters_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 472));
  }
}

- (id)transitNearbyScheduleLookupParameters
{
  if (a1)
  {
    v2 = a1;
    -[GEOPDPlaceRequestParameters _readTransitNearbyScheduleLookupParameters]((uint64_t)a1);
    a1 = (id *)v2[53];
    uint64_t v1 = vars8;
  }
  return a1;
}

- (void)_readTransitNearbyScheduleLookupParameters
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 472));
    if ((*(unsigned char *)(a1 + 482) & 8) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOPDPlaceRequestParametersReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readTransitNearbyScheduleLookupParameters_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 472));
  }
}

- (id)transitNearbyPaymentMethodLookupParameters
{
  if (a1)
  {
    v2 = a1;
    -[GEOPDPlaceRequestParameters _readTransitNearbyPaymentMethodLookupParameters]((uint64_t)a1);
    a1 = (id *)v2[52];
    uint64_t v1 = vars8;
  }
  return a1;
}

- (void)_readTransitNearbyPaymentMethodLookupParameters
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 472));
    if ((*(unsigned char *)(a1 + 482) & 4) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOPDPlaceRequestParametersReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readTransitNearbyPaymentMethodLookupParameters_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 472));
  }
}

- (id)merchantLookupParameters
{
  if (a1)
  {
    v2 = a1;
    -[GEOPDPlaceRequestParameters _readMerchantLookupParameters]((uint64_t)a1);
    a1 = (id *)v2[31];
    uint64_t v1 = vars8;
  }
  return a1;
}

- (void)_readMerchantLookupParameters
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 472));
    if ((*(unsigned char *)(a1 + 479) & 0x20) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOPDPlaceRequestParametersReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readMerchantLookupParameters_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 472));
  }
}

- (id)groundViewLabelParameters
{
  if (a1)
  {
    v2 = a1;
    -[GEOPDPlaceRequestParameters _readGroundViewLabelParameters]((uint64_t)a1);
    a1 = (id *)v2[24];
    uint64_t v1 = vars8;
  }
  return a1;
}

- (void)_readGroundViewLabelParameters
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 472));
    if ((*(unsigned char *)(a1 + 478) & 0x40) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOPDPlaceRequestParametersReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readGroundViewLabelParameters_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 472));
  }
}

- (id)externalTransitLookupParameters
{
  if (a1)
  {
    v2 = a1;
    -[GEOPDPlaceRequestParameters _readExternalTransitLookupParameters]((uint64_t)a1);
    a1 = (id *)v2[21];
    uint64_t v1 = vars8;
  }
  return a1;
}

- (void)_readExternalTransitLookupParameters
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 472));
    if ((*(unsigned char *)(a1 + 478) & 8) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOPDPlaceRequestParametersReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readExternalTransitLookupParameters_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 472));
  }
}

- (id)batchReverseGeocodingParameters
{
  if (a1)
  {
    v2 = a1;
    -[GEOPDPlaceRequestParameters _readBatchReverseGeocodingParameters]((uint64_t)a1);
    a1 = (id *)v2[12];
    uint64_t v1 = vars8;
  }
  return a1;
}

- (void)_readBatchReverseGeocodingParameters
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 472));
    if ((*(unsigned char *)(a1 + 477) & 4) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOPDPlaceRequestParametersReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readBatchReverseGeocodingParameters_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 472));
  }
}

- (id)autocompleteParameters
{
  if (a1)
  {
    v2 = a1;
    -[GEOPDPlaceRequestParameters _readAutocompleteParameters]((uint64_t)a1);
    a1 = (id *)v2[8];
    uint64_t v1 = vars8;
  }
  return a1;
}

- (void)_readAutocompleteParameters
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 472));
    if ((*(unsigned char *)(a1 + 476) & 0x40) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOPDPlaceRequestParametersReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readAutocompleteParameters_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 472));
  }
}

- (unint64_t)hash
{
  -[GEOPDPlaceRequestParameters readAll:]((uint64_t)self, 1);
  unint64_t v3 = [(GEOPDSearchParameters *)self->_searchParameters hash];
  unint64_t v4 = [(GEOPDGeocodingParameters *)self->_geocodingParameters hash] ^ v3;
  unint64_t v5 = [(GEOPDCanonicalLocationSearchParameters *)self->_canonicalLocationSearchParameters hash];
  unint64_t v6 = v4 ^ v5 ^ [(GEOPDReverseGeocodingParameters *)self->_reverseGeocodingParameters hash];
  unint64_t v7 = [(GEOPDPlaceLookupParameters *)self->_placeLookupParameters hash];
  unint64_t v8 = v7 ^ [(GEOPDMerchantLookupParameters *)self->_merchantLookupParameters hash];
  unint64_t v9 = v6 ^ v8 ^ [(GEOPDPlaceRefinementParameters *)self->_placeRefinementParameters hash];
  unint64_t v10 = [(GEOPDSiriSearchParameters *)self->_siriSearchParameters hash];
  unint64_t v11 = v10 ^ [(GEOPDLocationDirectedSearchParameters *)self->_locationDirectedSearchParameters hash];
  unint64_t v12 = v9 ^ v11 ^ [(GEOPDAutocompleteParameters *)self->_autocompleteParameters hash];
  unint64_t v13 = [(GEOPDSearchBrowseCategorySuggestionParameters *)self->_browseCategorySuggestionParameters hash];
  unint64_t v14 = v13 ^ [(GEOPDCategorySearchParameters *)self->_categorySearchParameters hash];
  unint64_t v15 = v14 ^ [(GEOPDPopularNearbySearchParameters *)self->_popularNearbySearchParameters hash];
  unint64_t v16 = v15 ^ [(GEOPDSearchZeroKeywordCategorySuggestionParameters *)self->_searchZeroKeywordCategorySuggestionParameters hash];
  unint64_t v17 = v12 ^ v16 ^ [(GEOPDSearchFieldPlaceholderParameters *)self->_searchFieldPlaceholderParameters hash];
  unint64_t v18 = [(GEOPDBatchPopularNearbySearchParameters *)self->_batchPopularNearbySearchParameters hash];
  unint64_t v19 = v18 ^ [(GEOPDVendorSpecificPlaceRefinementParameters *)self->_vendorSpecificPlaceRefinementParameters hash];
  unint64_t v20 = v19 ^ [(GEOPDNearbySearchParameters *)self->_nearbySearchParameters hash];
  unint64_t v21 = v20 ^ [(GEOPDAddressObjectGeocodingParameters *)self->_addressObjectGeocodingParameters hash];
  unint64_t v22 = v17 ^ v21 ^ [(GEOPDSearchZeroKeywordWithSearchResultsSuggestionParameters *)self->_searchZeroKeywordWithSearchResultsSuggestionParameters hash];
  unint64_t v23 = [(GEOPDExternalTransitLookupParameters *)self->_externalTransitLookupParameters hash];
  unint64_t v24 = v23 ^ [(GEOPDFeatureIdGeocodingParameters *)self->_featureIdGeocodingParameters hash];
  unint64_t v25 = v24 ^ [(GEOPDMapsIdentifierPlaceLookupParameters *)self->_mapsIdentifierPlaceLookupParameters hash];
  unint64_t v26 = v25 ^ [(GEOPDBatchReverseGeocodingParameters *)self->_batchReverseGeocodingParameters hash];
  unint64_t v27 = v26 ^ [(GEOPDBrandLookupParameters *)self->_brandLookupParameters hash];
  unint64_t v28 = v27 ^ [(GEOPDWifiFingerprintParameters *)self->_wifiFingerprintParameters hash];
  unint64_t v29 = v22 ^ v28 ^ [(GEOPDIpGeoLookupParameters *)self->_ipGeoLookupParameters hash];
  unint64_t v30 = [(GEOPDGroundViewLabelParameters *)self->_groundViewLabelParameters hash];
  unint64_t v31 = v30 ^ [(GEOPDBatchSpatialLookupParameters *)self->_batchSpatialLookupParameters hash];
  unint64_t v32 = v31 ^ [(GEOPDTransitVehiclePositionParameters *)self->_transitVehiclePositionParameters hash];
  unint64_t v33 = v32 ^ [(GEOPDPlaceCollectionLookupParameters *)self->_placeCollectionLookupParameter hash];
  unint64_t v34 = v33 ^ [(GEOPBTransitScheduleLookupParameters *)self->_transitScheduleLookupParameter hash];
  unint64_t v35 = v34 ^ [(GEOPDBatchCategoryLookupParameters *)self->_batchCategoryLookupParameters hash];
  unint64_t v36 = v35 ^ [(GEOPDBatchMerchantLookupBrandParameters *)self->_batchMerchantLookupBrandParameters hash];
  unint64_t v37 = v29 ^ v36 ^ [(GEOPDChildPlaceLookupByCategoryParameters *)self->_childPlaceLookupByCategoryParameters hash];
  unint64_t v38 = [(GEOPDCollectionSuggestionParameters *)self->_collectionSuggestionParameters hash];
  unint64_t v39 = v38 ^ [(GEOPDMapsSearchHomeParameters *)self->_mapsSearchHomeParameters hash];
  unint64_t v40 = v39 ^ [(GEOPDPlaceQuestionnaireLookupParameters *)self->_placeQuestionnaireLookupParameters hash];
  unint64_t v41 = v40 ^ [(GEOPDPublisherViewParameters *)self->_publisherViewParameters hash];
  unint64_t v42 = v41 ^ [(GEOPDAllCollectionsViewParameters *)self->_allCollectionsViewParameters hash];
  unint64_t v43 = v42 ^ [(GEOPDAirportEntityPlaceLookupParameters *)self->_airportEntityPlaceLookupParameters hash];
  unint64_t v44 = v43 ^ [(GEOPDTerritoryLookupParameters *)self->_territoryLookupParameters hash];
  unint64_t v45 = v37 ^ v44 ^ [(GEOPDTransitNearbyScheduleLookupParameters *)self->_transitNearbyScheduleLookupParameters hash];
  unint64_t v46 = [(GEOPDMapsHomeParameters *)self->_mapsHomeParameters hash];
  unint64_t v47 = v46 ^ [(GEOPDAllGuidesLocationsViewParameters *)self->_allGuidesLocationsViewParameters hash];
  unint64_t v48 = v47 ^ [(GEOPDGuidesHomeParameters *)self->_guidesHomeParameters hash];
  unint64_t v49 = v48 ^ [(GEOPDExtendedGeoLookupParameters *)self->_extendedGeoLookupParameters hash];
  unint64_t v50 = v49 ^ [(GEOPDQueryUnderstandingParameters *)self->_queryUnderstandingParameters hash];
  unint64_t v51 = v50 ^ [(GEOPDPoiAtAddressLookupParameters *)self->_poiAtAddressLookupParameters hash];
  unint64_t v52 = v51 ^ [(GEOPDTransitNearbyPaymentMethodLookupParameters *)self->_transitNearbyPaymentMethodLookupParameters hash];
  unint64_t v53 = v52 ^ [(GEOPDPlacecardEnrichmentParameters *)self->_placecardEnrichmentParameters hash];
  unint64_t v54 = v53 ^ [(GEOPDOfflineRegionNameParameters *)self->_offlineRegionNameParameters hash];
  unint64_t v55 = v45 ^ v54 ^ [(GEOPDSearchCapabilitiesParameters *)self->_searchCapabilitiesParameters hash];
  unint64_t v56 = [(GEOPDRefreshIdLookUpParameters *)self->_refreshIdLookUpParameters hash];
  return v55 ^ v56 ^ [(GEOPDAddressRecommendationParameters *)self->_addressRecommendationParameters hash];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_wifiFingerprintParameters, 0);
  objc_storeStrong((id *)&self->_vendorSpecificPlaceRefinementParameters, 0);
  objc_storeStrong((id *)&self->_transitVehiclePositionParameters, 0);
  objc_storeStrong((id *)&self->_transitScheduleLookupParameter, 0);
  objc_storeStrong((id *)&self->_transitNearbyScheduleLookupParameters, 0);
  objc_storeStrong((id *)&self->_transitNearbyPaymentMethodLookupParameters, 0);
  objc_storeStrong((id *)&self->_territoryLookupParameters, 0);
  objc_storeStrong((id *)&self->_siriSearchParameters, 0);
  objc_storeStrong((id *)&self->_searchZeroKeywordWithSearchResultsSuggestionParameters, 0);
  objc_storeStrong((id *)&self->_searchZeroKeywordCategorySuggestionParameters, 0);
  objc_storeStrong((id *)&self->_searchParameters, 0);
  objc_storeStrong((id *)&self->_searchFieldPlaceholderParameters, 0);
  objc_storeStrong((id *)&self->_searchCapabilitiesParameters, 0);
  objc_storeStrong((id *)&self->_reverseGeocodingParameters, 0);
  objc_storeStrong((id *)&self->_refreshIdLookUpParameters, 0);
  objc_storeStrong((id *)&self->_queryUnderstandingParameters, 0);
  objc_storeStrong((id *)&self->_publisherViewParameters, 0);
  objc_storeStrong((id *)&self->_popularNearbySearchParameters, 0);
  objc_storeStrong((id *)&self->_poiAtAddressLookupParameters, 0);
  objc_storeStrong((id *)&self->_placecardEnrichmentParameters, 0);
  objc_storeStrong((id *)&self->_placeRefinementParameters, 0);
  objc_storeStrong((id *)&self->_placeQuestionnaireLookupParameters, 0);
  objc_storeStrong((id *)&self->_placeLookupParameters, 0);
  objc_storeStrong((id *)&self->_placeCollectionLookupParameter, 0);
  objc_storeStrong((id *)&self->_offlineRegionNameParameters, 0);
  objc_storeStrong((id *)&self->_nearbySearchParameters, 0);
  objc_storeStrong((id *)&self->_merchantLookupParameters, 0);
  objc_storeStrong((id *)&self->_mapsSearchHomeParameters, 0);
  objc_storeStrong((id *)&self->_mapsIdentifierPlaceLookupParameters, 0);
  objc_storeStrong((id *)&self->_mapsHomeParameters, 0);
  objc_storeStrong((id *)&self->_locationDirectedSearchParameters, 0);
  objc_storeStrong((id *)&self->_ipGeoLookupParameters, 0);
  objc_storeStrong((id *)&self->_guidesHomeParameters, 0);
  objc_storeStrong((id *)&self->_groundViewLabelParameters, 0);
  objc_storeStrong((id *)&self->_geocodingParameters, 0);
  objc_storeStrong((id *)&self->_featureIdGeocodingParameters, 0);
  objc_storeStrong((id *)&self->_externalTransitLookupParameters, 0);
  objc_storeStrong((id *)&self->_extendedGeoLookupParameters, 0);
  objc_storeStrong((id *)&self->_collectionSuggestionParameters, 0);
  objc_storeStrong((id *)&self->_childPlaceLookupByCategoryParameters, 0);
  objc_storeStrong((id *)&self->_categorySearchParameters, 0);
  objc_storeStrong((id *)&self->_canonicalLocationSearchParameters, 0);
  objc_storeStrong((id *)&self->_browseCategorySuggestionParameters, 0);
  objc_storeStrong((id *)&self->_brandLookupParameters, 0);
  objc_storeStrong((id *)&self->_batchSpatialLookupParameters, 0);
  objc_storeStrong((id *)&self->_batchReverseGeocodingParameters, 0);
  objc_storeStrong((id *)&self->_batchPopularNearbySearchParameters, 0);
  objc_storeStrong((id *)&self->_batchMerchantLookupBrandParameters, 0);
  objc_storeStrong((id *)&self->_batchCategoryLookupParameters, 0);
  objc_storeStrong((id *)&self->_autocompleteParameters, 0);
  objc_storeStrong((id *)&self->_allGuidesLocationsViewParameters, 0);
  objc_storeStrong((id *)&self->_allCollectionsViewParameters, 0);
  objc_storeStrong((id *)&self->_airportEntityPlaceLookupParameters, 0);
  objc_storeStrong((id *)&self->_addressRecommendationParameters, 0);
  objc_storeStrong((id *)&self->_addressObjectGeocodingParameters, 0);
  objc_storeStrong((id *)&self->_unknownFields, 0);

  objc_storeStrong((id *)&self->_reader, 0);
}

- (void)setSearchFieldPlaceholderParameters:(uint64_t)a1
{
  id v4 = a2;
  if (a1)
  {
    *(void *)(a1 + 476) |= 0x100100000000000uLL;
    objc_storeStrong((id *)(a1 + 368), a2);
  }
}

- (void)writeTo:(id)a3
{
  id v8 = a3;
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  if (self->_reader && (_GEOPDPlaceRequestParametersIsDirty((uint64_t)self) & 1) == 0)
  {
    unint64_t v6 = self->_reader;
    objc_sync_enter(v6);
    *(void *)((char *)self->_reader + (int)*MEMORY[0x1E4F940E0]) = self->_readerMarkLength;
    [(PBDataReader *)self->_reader seekToOffset:self->_readerMarkPos];
    unint64_t v7 = [(PBDataReader *)self->_reader readBytes:self->_readerMarkLength - self->_readerMarkPos];
    [v8 writeData:v7];
    os_unfair_lock_unlock(p_readerLock);

    objc_sync_exit(v6);
  }
  else
  {
    os_unfair_lock_unlock(&self->_readerLock);
    -[GEOPDPlaceRequestParameters readAll:]((uint64_t)self, 0);
    if (self->_searchParameters) {
      PBDataWriterWriteSubmessage();
    }
    id v5 = v8;
    if (self->_geocodingParameters)
    {
      PBDataWriterWriteSubmessage();
      id v5 = v8;
    }
    if (self->_canonicalLocationSearchParameters)
    {
      PBDataWriterWriteSubmessage();
      id v5 = v8;
    }
    if (self->_reverseGeocodingParameters)
    {
      PBDataWriterWriteSubmessage();
      id v5 = v8;
    }
    if (self->_placeLookupParameters)
    {
      PBDataWriterWriteSubmessage();
      id v5 = v8;
    }
    if (self->_merchantLookupParameters)
    {
      PBDataWriterWriteSubmessage();
      id v5 = v8;
    }
    if (self->_placeRefinementParameters)
    {
      PBDataWriterWriteSubmessage();
      id v5 = v8;
    }
    if (self->_siriSearchParameters)
    {
      PBDataWriterWriteSubmessage();
      id v5 = v8;
    }
    if (self->_locationDirectedSearchParameters)
    {
      PBDataWriterWriteSubmessage();
      id v5 = v8;
    }
    if (self->_autocompleteParameters)
    {
      PBDataWriterWriteSubmessage();
      id v5 = v8;
    }
    if (self->_browseCategorySuggestionParameters)
    {
      PBDataWriterWriteSubmessage();
      id v5 = v8;
    }
    if (self->_categorySearchParameters)
    {
      PBDataWriterWriteSubmessage();
      id v5 = v8;
    }
    if (self->_popularNearbySearchParameters)
    {
      PBDataWriterWriteSubmessage();
      id v5 = v8;
    }
    if (self->_searchZeroKeywordCategorySuggestionParameters)
    {
      PBDataWriterWriteSubmessage();
      id v5 = v8;
    }
    if (self->_searchFieldPlaceholderParameters)
    {
      PBDataWriterWriteSubmessage();
      id v5 = v8;
    }
    if (self->_batchPopularNearbySearchParameters)
    {
      PBDataWriterWriteSubmessage();
      id v5 = v8;
    }
    if (self->_vendorSpecificPlaceRefinementParameters)
    {
      PBDataWriterWriteSubmessage();
      id v5 = v8;
    }
    if (self->_nearbySearchParameters)
    {
      PBDataWriterWriteSubmessage();
      id v5 = v8;
    }
    if (self->_addressObjectGeocodingParameters)
    {
      PBDataWriterWriteSubmessage();
      id v5 = v8;
    }
    if (self->_searchZeroKeywordWithSearchResultsSuggestionParameters)
    {
      PBDataWriterWriteSubmessage();
      id v5 = v8;
    }
    if (self->_externalTransitLookupParameters)
    {
      PBDataWriterWriteSubmessage();
      id v5 = v8;
    }
    if (self->_featureIdGeocodingParameters)
    {
      PBDataWriterWriteSubmessage();
      id v5 = v8;
    }
    if (self->_mapsIdentifierPlaceLookupParameters)
    {
      PBDataWriterWriteSubmessage();
      id v5 = v8;
    }
    if (self->_batchReverseGeocodingParameters)
    {
      PBDataWriterWriteSubmessage();
      id v5 = v8;
    }
    if (self->_brandLookupParameters)
    {
      PBDataWriterWriteSubmessage();
      id v5 = v8;
    }
    if (self->_wifiFingerprintParameters)
    {
      PBDataWriterWriteSubmessage();
      id v5 = v8;
    }
    if (self->_ipGeoLookupParameters)
    {
      PBDataWriterWriteSubmessage();
      id v5 = v8;
    }
    if (self->_groundViewLabelParameters)
    {
      PBDataWriterWriteSubmessage();
      id v5 = v8;
    }
    if (self->_batchSpatialLookupParameters)
    {
      PBDataWriterWriteSubmessage();
      id v5 = v8;
    }
    if (self->_transitVehiclePositionParameters)
    {
      PBDataWriterWriteSubmessage();
      id v5 = v8;
    }
    if (self->_placeCollectionLookupParameter)
    {
      PBDataWriterWriteSubmessage();
      id v5 = v8;
    }
    if (self->_transitScheduleLookupParameter)
    {
      PBDataWriterWriteSubmessage();
      id v5 = v8;
    }
    if (self->_batchCategoryLookupParameters)
    {
      PBDataWriterWriteSubmessage();
      id v5 = v8;
    }
    if (self->_batchMerchantLookupBrandParameters)
    {
      PBDataWriterWriteSubmessage();
      id v5 = v8;
    }
    if (self->_childPlaceLookupByCategoryParameters)
    {
      PBDataWriterWriteSubmessage();
      id v5 = v8;
    }
    if (self->_collectionSuggestionParameters)
    {
      PBDataWriterWriteSubmessage();
      id v5 = v8;
    }
    if (self->_mapsSearchHomeParameters)
    {
      PBDataWriterWriteSubmessage();
      id v5 = v8;
    }
    if (self->_placeQuestionnaireLookupParameters)
    {
      PBDataWriterWriteSubmessage();
      id v5 = v8;
    }
    if (self->_publisherViewParameters)
    {
      PBDataWriterWriteSubmessage();
      id v5 = v8;
    }
    if (self->_allCollectionsViewParameters)
    {
      PBDataWriterWriteSubmessage();
      id v5 = v8;
    }
    if (self->_airportEntityPlaceLookupParameters)
    {
      PBDataWriterWriteSubmessage();
      id v5 = v8;
    }
    if (self->_territoryLookupParameters)
    {
      PBDataWriterWriteSubmessage();
      id v5 = v8;
    }
    if (self->_transitNearbyScheduleLookupParameters)
    {
      PBDataWriterWriteSubmessage();
      id v5 = v8;
    }
    if (self->_mapsHomeParameters)
    {
      PBDataWriterWriteSubmessage();
      id v5 = v8;
    }
    if (self->_allGuidesLocationsViewParameters)
    {
      PBDataWriterWriteSubmessage();
      id v5 = v8;
    }
    if (self->_guidesHomeParameters)
    {
      PBDataWriterWriteSubmessage();
      id v5 = v8;
    }
    if (self->_extendedGeoLookupParameters)
    {
      PBDataWriterWriteSubmessage();
      id v5 = v8;
    }
    if (self->_queryUnderstandingParameters)
    {
      PBDataWriterWriteSubmessage();
      id v5 = v8;
    }
    if (self->_poiAtAddressLookupParameters)
    {
      PBDataWriterWriteSubmessage();
      id v5 = v8;
    }
    if (self->_transitNearbyPaymentMethodLookupParameters)
    {
      PBDataWriterWriteSubmessage();
      id v5 = v8;
    }
    if (self->_placecardEnrichmentParameters)
    {
      PBDataWriterWriteSubmessage();
      id v5 = v8;
    }
    if (self->_offlineRegionNameParameters)
    {
      PBDataWriterWriteSubmessage();
      id v5 = v8;
    }
    if (self->_searchCapabilitiesParameters)
    {
      PBDataWriterWriteSubmessage();
      id v5 = v8;
    }
    if (self->_refreshIdLookUpParameters)
    {
      PBDataWriterWriteSubmessage();
      id v5 = v8;
    }
    if (self->_addressRecommendationParameters)
    {
      PBDataWriterWriteSubmessage();
      id v5 = v8;
    }
    [(PBUnknownFields *)self->_unknownFields writeTo:v5];
  }
}

- (void)setPlaceCollectionLookupParameter:(uint64_t)a1
{
  id v4 = a2;
  *(void *)(a1 + 476) |= 0x100000100000000uLL;
  objc_storeStrong((id *)(a1 + 272), a2);
}

- (void)setTransitScheduleLookupParameter:(uint64_t)a1
{
  id v4 = a2;
  if (a1)
  {
    *(void *)(a1 + 476) |= 0x110000000000000uLL;
    objc_storeStrong((id *)(a1 + 432), a2);
  }
}

- (void)setBatchMerchantLookupBrandParameters:(uint64_t)a1
{
  id v4 = a2;
  *(void *)(a1 + 476) |= 0x100000000000100uLL;
  objc_storeStrong((id *)(a1 + 80), a2);
}

- (void)mergeFrom:(void *)a1
{
  uint64_t v712 = *MEMORY[0x1E4F143B8];
  id v690 = a2;
  if (!a1) {
    goto LABEL_1282;
  }
  -[GEOPDPlaceRequestParameters readAll:]((uint64_t)v690, 0);
  uint64_t v3 = a1[47];
  id v4 = (void *)*((void *)v690 + 47);
  v689 = a1;
  if (v3)
  {
    if (!v4) {
      goto LABEL_162;
    }
    id v5 = v4;
    -[GEOPDSearchParameters readAll:]((uint64_t)v5, 0);
    uint64_t v6 = *(void *)(v5 + 372);
    if ((v6 & 0x20) != 0)
    {
      *(_DWORD *)(v3 + 360) = *((_DWORD *)v5 + 90);
      *(void *)(v3 + 372) |= 0x20uLL;
      uint64_t v6 = *(void *)(v5 + 372);
    }
    if ((v6 & 2) != 0)
    {
      *(_DWORD *)(v3 + 344) = *((_DWORD *)v5 + 86);
      *(void *)(v3 + 372) |= 2uLL;
    }
    unint64_t v7 = (void *)*((void *)v5 + 34);
    if (v7) {
      -[GEOPDSearchParameters setSearchString:](v3, v7);
    }
    id v8 = *(void **)(v3 + 320);
    uint64_t v9 = *((void *)v5 + 40);
    if (v8)
    {
      if (v9) {
        objc_msgSend(v8, "mergeFrom:");
      }
    }
    else if (v9)
    {
      -[GEOPDSearchParameters setViewportInfo:](v3, *((void **)v5 + 40));
    }
    unint64_t v10 = (void *)*((void *)v5 + 39);
    if (v10) {
      -[GEOPDSearchParameters setSuggestionMetadata:](v3, v10);
    }
    unint64_t v11 = (void *)*((void *)v5 + 37);
    if (v11) {
      -[GEOPDSearchParameters setSuggestionEntryMetadata:](v3, v11);
    }
    unint64_t v12 = *(void **)(v3 + 304);
    uint64_t v13 = *((void *)v5 + 38);
    if (v12)
    {
      if (v13) {
        objc_msgSend(v12, "mergeFrom:");
      }
    }
    else if (v13)
    {
      -[GEOPDSearchParameters setSuggestionEntry:](v3, *((void **)v5 + 38));
    }
    if ((v5[372] & 8) != 0)
    {
      *(_DWORD *)(v3 + 352) = *((_DWORD *)v5 + 88);
      *(void *)(v3 + 372) |= 8uLL;
    }
    uint64_t v14 = *(void *)(v3 + 280);
    unint64_t v15 = (void *)*((void *)v5 + 35);
    if (v14)
    {
      if (v15) {
        -[GEOPDSSearchStructureIntentRequestType mergeFrom:](v14, v15);
      }
    }
    else if (v15)
    {
      -[GEOPDSearchParameters setSearchStructureIntentType:](v3, v15);
    }
    uint64_t v16 = *(void *)(v3 + 248);
    unint64_t v17 = (void *)*((void *)v5 + 31);
    if (v16)
    {
      if (v17) {
        -[GEOPDSSearchLocationParameters mergeFrom:](v16, v17);
      }
    }
    else if (v17)
    {
      -[GEOPDSearchParameters setSearchLocationParameters:](v3, v17);
    }
    uint64_t v18 = *(void *)(v3 + 208);
    unint64_t v19 = (void *)*((void *)v5 + 26);
    if (v18)
    {
      if (v19) {
        -[GEOPDRecentRouteInfo mergeFrom:](v18, v19);
      }
    }
    else if (v19)
    {
      -[GEOPDSearchParameters setRecentRouteInfo:](v3, v19);
    }
    uint64_t v20 = *(void *)(v3 + 240);
    unint64_t v21 = (void *)*((void *)v5 + 30);
    if (v20)
    {
      if (v21) {
        -[GEOPDSSearchFilter mergeFrom:](v20, v21);
      }
    }
    else if (v21)
    {
      -[GEOPDSearchParameters setSearchFilter:](v3, v21);
    }
    uint64_t v22 = *(void *)(v5 + 372);
    if ((v22 & 0x80) != 0)
    {
      *(unsigned char *)(v3 + 365) = v5[365];
      *(void *)(v3 + 372) |= 0x80uLL;
      uint64_t v22 = *(void *)(v5 + 372);
    }
    if ((v22 & 0x40) != 0)
    {
      *(unsigned char *)(v3 + 364) = v5[364];
      *(void *)(v3 + 372) |= 0x40uLL;
    }
    uint64_t v23 = *(void *)(v3 + 224);
    unint64_t v24 = (void *)*((void *)v5 + 28);
    if (v23)
    {
      if (v24) {
        -[GEOPDRetainedSearchMetadata mergeFrom:](v23, v24);
      }
    }
    else if (v24)
    {
      -[GEOPDSearchParameters setRetainedSearch:](v3, v24);
    }
    uint64_t v25 = *(void *)(v5 + 372);
    if ((v25 & 0x800) != 0)
    {
      *(unsigned char *)(v3 + 369) = v5[369];
      *(void *)(v3 + 372) |= 0x800uLL;
      uint64_t v25 = *(void *)(v5 + 372);
      if ((v25 & 0x200) == 0)
      {
LABEL_59:
        if ((v25 & 0x10) == 0)
        {
LABEL_61:
          uint64_t v26 = *(void *)(v3 + 168);
          unint64_t v27 = (void *)*((void *)v5 + 21);
          if (v26)
          {
            if (v27) {
              -[GEOPDSInferredSignals mergeFrom:](v26, v27);
            }
          }
          else if (v27)
          {
            -[GEOPDSearchParameters setInferredSignals:](v3, v27);
          }
          -[GEOPDSearchParameters _readSupportedRelatedEntitySectionTypes]((uint64_t)v5);
          uint64_t v28 = *((void *)v5 + 10);
          if (v28)
          {
            unint64_t v29 = 0;
            uint64_t v30 = *MEMORY[0x1E4F1C4A8];
            do
            {
              -[GEOPDSearchParameters _readSupportedRelatedEntitySectionTypes]((uint64_t)v5);
              unint64_t v31 = *((void *)v5 + 10);
              if (v31 <= v29)
              {
                unint64_t v32 = (void *)MEMORY[0x1E4F1CA00];
                unint64_t v33 = objc_msgSend(NSString, "stringWithFormat:", @"idx (%tu) is out of range (%tu)", v29, v31);
                unint64_t v34 = [v32 exceptionWithName:v30 reason:v33 userInfo:0];
                [v34 raise];
              }
              -[GEOPDSearchParameters addSupportedRelatedEntitySectionType:](v3);
              ++v29;
            }
            while (v28 != v29);
          }
          uint64_t v35 = *(void *)(v3 + 160);
          unint64_t v36 = (void *)*((void *)v5 + 20);
          if (v35)
          {
            if (v36) {
              -[GEOPDSSearchEvChargingParameters mergeFrom:](v35, v36);
            }
          }
          else if (v36)
          {
            -[GEOPDSearchParameters setEvChargingParameters:](v3, v36);
          }
          uint64_t v37 = *(void *)(v3 + 152);
          unint64_t v38 = (void *)*((void *)v5 + 19);
          if (v37)
          {
            if (v38) {
              -[GEOPDETAFilter mergeFrom:](v37, v38);
            }
          }
          else if (v38)
          {
            -[GEOPDSearchParameters setEtaFilter:](v3, v38);
          }
          -[GEOPDSearchParameters _readSupportedSearchTierTypes]((uint64_t)v5);
          uint64_t v39 = *((void *)v5 + 16);
          if (v39)
          {
            unint64_t v40 = 0;
            uint64_t v41 = *MEMORY[0x1E4F1C4A8];
            do
            {
              -[GEOPDSearchParameters _readSupportedSearchTierTypes]((uint64_t)v5);
              unint64_t v42 = *((void *)v5 + 16);
              if (v42 <= v40)
              {
                unint64_t v43 = (void *)MEMORY[0x1E4F1CA00];
                unint64_t v44 = objc_msgSend(NSString, "stringWithFormat:", @"idx (%tu) is out of range (%tu)", v40, v42);
                unint64_t v45 = [v43 exceptionWithName:v41 reason:v44 userInfo:0];
                [v45 raise];
              }
              -[GEOPDSearchParameters addSupportedSearchTierType:](v3);
              ++v40;
            }
            while (v39 != v40);
          }
          if (v5[372])
          {
            *(_DWORD *)(v3 + 340) = *((_DWORD *)v5 + 85);
            *(void *)(v3 + 372) |= 1uLL;
          }
          unint64_t v46 = *(void **)(v3 + 216);
          uint64_t v47 = *((void *)v5 + 27);
          if (v46)
          {
            if (v47) {
              objc_msgSend(v46, "mergeFrom:");
            }
          }
          else if (v47)
          {
            -[GEOPDSearchParameters setResultRefinementQuery:](v3, *((void **)v5 + 27));
          }
          -[GEOPDSearchParameters _readKnownRefinementTypes]((uint64_t)v5);
          uint64_t v48 = *((void *)v5 + 4);
          if (v48)
          {
            unint64_t v49 = 0;
            uint64_t v50 = *MEMORY[0x1E4F1C4A8];
            do
            {
              -[GEOPDSearchParameters _readKnownRefinementTypes]((uint64_t)v5);
              unint64_t v51 = *((void *)v5 + 4);
              if (v51 <= v49)
              {
                unint64_t v52 = (void *)MEMORY[0x1E4F1CA00];
                unint64_t v53 = objc_msgSend(NSString, "stringWithFormat:", @"idx (%tu) is out of range (%tu)", v49, v51);
                unint64_t v54 = [v52 exceptionWithName:v50 reason:v53 userInfo:0];
                [v54 raise];
              }
              -[GEOPDSearchParameters addKnownRefinementType:](v3);
              ++v49;
            }
            while (v48 != v49);
          }
          if ((v5[372] & 4) != 0)
          {
            *(_DWORD *)(v3 + 348) = *((_DWORD *)v5 + 87);
            *(void *)(v3 + 372) |= 4uLL;
          }
          unint64_t v55 = *(void **)(v3 + 192);
          uint64_t v56 = *((void *)v5 + 24);
          if (v55)
          {
            if (v56) {
              objc_msgSend(v55, "mergeFrom:");
            }
          }
          else if (v56)
          {
            -[GEOPDSearchParameters setPreviousSearchViewport:](v3, *((void **)v5 + 24));
          }
          -[GEOPDSearchParameters _readSupportedPlaceSummaryFormatTypes]((uint64_t)v5);
          uint64_t v57 = *((void *)v5 + 7);
          if (v57)
          {
            unint64_t v58 = 0;
            uint64_t v59 = *MEMORY[0x1E4F1C4A8];
            do
            {
              -[GEOPDSearchParameters _readSupportedPlaceSummaryFormatTypes]((uint64_t)v5);
              unint64_t v60 = *((void *)v5 + 7);
              if (v60 <= v58)
              {
                v61 = (void *)MEMORY[0x1E4F1CA00];
                id v62 = objc_msgSend(NSString, "stringWithFormat:", @"idx (%tu) is out of range (%tu)", v58, v60);
                v63 = [v61 exceptionWithName:v59 reason:v62 userInfo:0];
                [v63 raise];
              }
              -[GEOPDSearchParameters addSupportedPlaceSummaryFormatType:](v3);
              ++v58;
            }
            while (v57 != v58);
          }
          -[GEOPDSearchParameters _readSupportedSearchSectionTypes]((uint64_t)v5);
          uint64_t v64 = *((void *)v5 + 13);
          if (v64)
          {
            unint64_t v65 = 0;
            uint64_t v66 = *MEMORY[0x1E4F1C4A8];
            do
            {
              -[GEOPDSearchParameters _readSupportedSearchSectionTypes]((uint64_t)v5);
              unint64_t v67 = *((void *)v5 + 13);
              if (v67 <= v65)
              {
                id v68 = (void *)MEMORY[0x1E4F1CA00];
                v69 = objc_msgSend(NSString, "stringWithFormat:", @"idx (%tu) is out of range (%tu)", v65, v67);
                id v70 = [v68 exceptionWithName:v66 reason:v69 userInfo:0];
                [v70 raise];
              }
              -[GEOPDSearchParameters addSupportedSearchSectionType:](v3);
              ++v65;
            }
            while (v64 != v65);
          }
          if (v5[373])
          {
            *(unsigned char *)(v3 + 366) = v5[366];
            *(void *)(v3 + 372) |= 0x100uLL;
          }
          uint64_t v71 = *(void *)(v3 + 256);
          id v72 = (void *)*((void *)v5 + 32);
          a1 = v689;
          if (v71)
          {
            if (v72) {
              -[GEOPDSearchOriginationInfo mergeFrom:](v71, v72);
            }
          }
          else if (v72)
          {
            -[GEOPDSearchParameters setSearchOriginationInfo:](v3, v72);
          }
          if ((v5[373] & 4) != 0)
          {
            *(unsigned char *)(v3 + 368) = v5[368];
            *(void *)(v3 + 372) |= 0x400uLL;
          }
          v73 = (void *)*((void *)v5 + 18);
          if (v73) {
            -[GEOPDSearchParameters setEnrichmentCampaignNamespace:](v3, v73);
          }
          long long v709 = 0u;
          long long v710 = 0u;
          long long v707 = 0u;
          long long v708 = 0u;
          id v74 = *((id *)v5 + 29);
          uint64_t v75 = [v74 countByEnumeratingWithState:&v707 objects:v711 count:16];
          if (v75)
          {
            uint64_t v76 = v75;
            uint64_t v77 = *(void *)v708;
            do
            {
              for (uint64_t i = 0; i != v76; ++i)
              {
                if (*(void *)v708 != v77) {
                  objc_enumerationMutation(v74);
                }
                -[GEOPDSearchParameters addSearchEnrichmentRevisionMetadata:](v3, *(void **)(*((void *)&v707 + 1) + 8 * i));
              }
              uint64_t v76 = [v74 countByEnumeratingWithState:&v707 objects:v711 count:16];
            }
            while (v76);
          }

          v79 = (void *)*((void *)v5 + 33);
          if (*(void *)(v3 + 264)) {
            BOOL v80 = 1;
          }
          else {
            BOOL v80 = v79 == 0;
          }
          if (!v80) {
            -[GEOPDSearchParameters setSearchSessionData:](v3, v79);
          }
          v81 = *(void **)(v3 + 176);
          uint64_t v82 = *((void *)v5 + 22);
          if (v81)
          {
            if (v82) {
              objc_msgSend(v81, "mergeFrom:");
            }
          }
          else if (v82)
          {
            -[GEOPDSearchParameters setMostRecentAutocompleteRequestSessionData:](v3, *((void **)v5 + 22));
          }
          uint64_t v83 = *(void *)(v3 + 200);
          id v84 = (void *)*((void *)v5 + 25);
          if (v83)
          {
            if (v84) {
              -[GEOPDSPunchInHints mergeFrom:](v83, v84);
            }
          }
          else if (v84)
          {
            -[GEOPDSearchParameters setPunchInHints:](v3, v84);
          }
          v85 = *(void **)(v3 + 288);
          uint64_t v86 = *((void *)v5 + 36);
          if (v85)
          {
            if (v86) {
              objc_msgSend(v85, "mergeFrom:");
            }
          }
          else if (v86)
          {
            -[GEOPDSearchParameters setSessionUserActionMetadata:](v3, *((void **)v5 + 36));
          }
          uint64_t v87 = *(void *)(v3 + 184);
          id v88 = (void *)*((void *)v5 + 23);
          if (v87)
          {
            if (v88) {
              -[GEOPDPaginationParameters mergeFrom:](v87, v88);
            }
          }
          else if (v88)
          {
            -[GEOPDSearchParameters setPaginationParameters:](v3, v88);
          }

          goto LABEL_162;
        }
LABEL_60:
        *(_DWORD *)(v3 + 356) = *((_DWORD *)v5 + 89);
        *(void *)(v3 + 372) |= 0x10uLL;
        goto LABEL_61;
      }
    }
    else if ((v25 & 0x200) == 0)
    {
      goto LABEL_59;
    }
    *(unsigned char *)(v3 + 367) = v5[367];
    *(void *)(v3 + 372) |= 0x200uLL;
    if ((*(void *)(v5 + 372) & 0x10) == 0) {
      goto LABEL_61;
    }
    goto LABEL_60;
  }
  if (v4) {
    -[GEOPDPlaceRequestParameters setSearchParameters:]((uint64_t)a1, v4);
  }
LABEL_162:
  uint64_t v89 = a1[23];
  id v90 = (void *)*((void *)v690 + 23);
  if (v89)
  {
    if (v90)
    {
      id v91 = v90;
      -[GEOPDGeocodingParameters readAll:]((uint64_t)v91, 0);
      id v92 = (void *)*((void *)v91 + 5);
      if (v92) {
        -[GEOPDGeocodingParameters setQueryString:](v89, v92);
      }
      if (*((_WORD *)v91 + 42))
      {
        *(_DWORD *)(v89 + 76) = *((_DWORD *)v91 + 19);
        *(_WORD *)(v89 + 84) |= 1u;
      }
      v93 = *(void **)(v89 + 56);
      uint64_t v94 = *((void *)v91 + 7);
      if (v93)
      {
        if (v94) {
          objc_msgSend(v93, "mergeFrom:");
        }
      }
      else if (v94)
      {
        -[GEOPDGeocodingParameters setViewportInfo:](v89, *((void **)v91 + 7));
      }
      v95 = *(void **)(v89 + 48);
      uint64_t v96 = *((void *)v91 + 6);
      if (v95)
      {
        if (v96) {
          objc_msgSend(v95, "mergeFrom:");
        }
      }
      else if (v96)
      {
        -[GEOPDGeocodingParameters setStructuredAddress:](v89, *((void **)v91 + 6));
      }
      uint64_t v97 = *(void *)(v89 + 32);
      id v98 = (void *)*((void *)v91 + 4);
      if (v97)
      {
        if (v98) {
          -[GEOPDSPunchInHints mergeFrom:](v97, v98);
        }
      }
      else if (v98)
      {
        -[GEOPDGeocodingParameters setPunchInHints:](v89, v98);
      }
      if ((*((_WORD *)v91 + 42) & 2) != 0)
      {
        *(unsigned char *)(v89 + 80) = *((unsigned char *)v91 + 80);
        *(_WORD *)(v89 + 84) |= 2u;
      }
      uint64_t v99 = *(void *)(v89 + 24);
      id v100 = (void *)*((void *)v91 + 3);
      if (v99)
      {
        if (v100) {
          -[GEOPDAddressResultSubTypeFilter mergeFrom:](v99, v100);
        }
      }
      else if (v100)
      {
        -[GEOPDGeocodingParameters setAddressResultSubTypeFilter:](v89, v100);
      }
    }
  }
  else if (v90)
  {
    -[GEOPDPlaceRequestParameters setGeocodingParameters:]((uint64_t)a1, v90);
  }
  uint64_t v101 = a1[16];
  id v102 = (void *)*((void *)v690 + 16);
  if (v101)
  {
    if (v102)
    {
      v103 = (void *)v102[2];
      if (v103) {
        -[GEOPDCanonicalLocationSearchParameters setQueryString:](v101, v103);
      }
    }
  }
  else if (v102)
  {
    -[GEOPDPlaceRequestParameters setCanonicalLocationSearchParameters:]((uint64_t)a1, v102);
  }
  uint64_t v104 = a1[44];
  v105 = (void *)*((void *)v690 + 44);
  if (v104)
  {
    if (v105)
    {
      id v106 = v105;
      -[GEOPDReverseGeocodingParameters readAll:]((uint64_t)v106, 0);
      long long v705 = 0u;
      long long v706 = 0u;
      long long v703 = 0u;
      long long v704 = 0u;
      id v107 = v106[4];
      uint64_t v108 = [v107 countByEnumeratingWithState:&v703 objects:v711 count:16];
      if (v108)
      {
        uint64_t v109 = v108;
        uint64_t v110 = *(void *)v704;
        do
        {
          for (uint64_t j = 0; j != v109; ++j)
          {
            if (*(void *)v704 != v110) {
              objc_enumerationMutation(v107);
            }
            -[GEOPDReverseGeocodingParameters addLocation:](v104, *(void **)(*((void *)&v703 + 1) + 8 * j));
          }
          uint64_t v109 = [v107 countByEnumeratingWithState:&v703 objects:v711 count:16];
        }
        while (v109);
      }

      char v112 = *((unsigned char *)v106 + 60);
      if (v112)
      {
        *(_DWORD *)(v104 + 52) = *((_DWORD *)v106 + 13);
        *(unsigned char *)(v104 + 60) |= 1u;
        char v112 = *((unsigned char *)v106 + 60);
      }
      if ((v112 & 2) != 0)
      {
        *(unsigned char *)(v104 + 56) = *((unsigned char *)v106 + 56);
        *(unsigned char *)(v104 + 60) |= 2u;
      }
      long long v701 = 0u;
      long long v702 = 0u;
      long long v699 = 0u;
      long long v700 = 0u;
      id v113 = v106[3];
      uint64_t v114 = [v113 countByEnumeratingWithState:&v699 objects:&v707 count:16];
      if (v114)
      {
        uint64_t v115 = v114;
        uint64_t v116 = *(void *)v700;
        do
        {
          for (uint64_t k = 0; k != v115; ++k)
          {
            if (*(void *)v700 != v116) {
              objc_enumerationMutation(v113);
            }
            -[GEOPDReverseGeocodingParameters addExtendedLocation:](v104, *(void **)(*((void *)&v699 + 1) + 8 * k));
          }
          uint64_t v115 = [v113 countByEnumeratingWithState:&v699 objects:&v707 count:16];
        }
        while (v115);
      }
    }
  }
  else if (v105)
  {
    -[GEOPDPlaceRequestParameters setReverseGeocodingParameters:]((uint64_t)a1, v105);
  }
  uint64_t v118 = a1[35];
  v119 = (void *)*((void *)v690 + 35);
  if (v118)
  {
    if (v119)
    {
      id v120 = v119;
      -[GEOPDPlaceLookupParameters readAll:]((uint64_t)v120, 0);
      if (*((unsigned char *)v120 + 76))
      {
        *(_DWORD *)(v118 + 68) = *((_DWORD *)v120 + 17);
        *(unsigned char *)(v118 + 76) |= 1u;
      }
      -[GEOPDPlaceLookupParameters _readMuids]((uint64_t)v120);
      uint64_t v121 = *((void *)v120 + 4);
      if (v121)
      {
        unint64_t v122 = 0;
        uint64_t v123 = *MEMORY[0x1E4F1C4A8];
        do
        {
          -[GEOPDPlaceLookupParameters _readMuids]((uint64_t)v120);
          unint64_t v124 = *((void *)v120 + 4);
          if (v124 <= v122)
          {
            v125 = (void *)MEMORY[0x1E4F1CA00];
            v126 = objc_msgSend(NSString, "stringWithFormat:", @"idx (%tu) is out of range (%tu)", v122, v124);
            v127 = [v125 exceptionWithName:v123 reason:v126 userInfo:0];
            [v127 raise];
          }
          -[GEOPDPlaceLookupParameters addMuid:](v118);
          ++v122;
        }
        while (v121 != v122);
      }
      if ((*((unsigned char *)v120 + 76) & 2) != 0)
      {
        *(unsigned char *)(v118 + 72) = *((unsigned char *)v120 + 72);
        *(unsigned char *)(v118 + 76) |= 2u;
      }
      long long v709 = 0u;
      long long v710 = 0u;
      long long v707 = 0u;
      long long v708 = 0u;
      id v128 = *((id *)v120 + 6);
      uint64_t v129 = [v128 countByEnumeratingWithState:&v707 objects:v711 count:16];
      a1 = v689;
      if (v129)
      {
        uint64_t v130 = v129;
        uint64_t v131 = *(void *)v708;
        do
        {
          for (uint64_t m = 0; m != v130; ++m)
          {
            if (*(void *)v708 != v131) {
              objc_enumerationMutation(v128);
            }
            [(id)v118 addIdentifier:*(void *)(*((void *)&v707 + 1) + 8 * m)];
          }
          uint64_t v130 = [v128 countByEnumeratingWithState:&v707 objects:v711 count:16];
        }
        while (v130);
      }
    }
  }
  else if (v119)
  {
    -[GEOPDPlaceRequestParameters setPlaceLookupParameters:]((uint64_t)a1, v119);
  }
  v133 = (void *)a1[31];
  uint64_t v134 = *((void *)v690 + 31);
  if (v133)
  {
    if (v134) {
      objc_msgSend(v133, "mergeFrom:");
    }
  }
  else if (v134)
  {
    -[GEOPDPlaceRequestParameters setMerchantLookupParameters:]((uint64_t)a1, *((void **)v690 + 31));
  }
  uint64_t v135 = a1[37];
  v136 = (void *)*((void *)v690 + 37);
  if (v135)
  {
    if (v136) {
      -[GEOPDPlaceRefinementParameters mergeFrom:](v135, v136);
    }
  }
  else if (v136)
  {
    -[GEOPDPlaceRequestParameters setPlaceRefinementParameters:]((uint64_t)a1, v136);
  }
  uint64_t v137 = a1[50];
  v138 = (void *)*((void *)v690 + 50);
  if (v137)
  {
    if (v138)
    {
      id v139 = v138;
      -[GEOPDSiriSearchParameters readAll:]((uint64_t)v139, 0);
      __int16 v140 = *((_WORD *)v139 + 52);
      if ((v140 & 2) != 0)
      {
        *(_DWORD *)(v137 + 96) = *((_DWORD *)v139 + 24);
        *(_WORD *)(v137 + 104) |= 2u;
        __int16 v140 = *((_WORD *)v139 + 52);
      }
      if (v140)
      {
        *(_DWORD *)(v137 + 92) = *((_DWORD *)v139 + 23);
        *(_WORD *)(v137 + 104) |= 1u;
      }
      v141 = (void *)*((void *)v139 + 7);
      if (v141) {
        -[GEOPDSiriSearchParameters setSearchString:](v137, v141);
      }
      v142 = *(void **)(v137 + 72);
      uint64_t v143 = *((void *)v139 + 9);
      if (v142)
      {
        if (v143) {
          objc_msgSend(v142, "mergeFrom:");
        }
      }
      else if (v143)
      {
        -[GEOPDSiriSearchParameters setViewportInfo:](v137, *((void **)v139 + 9));
      }
      v144 = *(void **)(v137 + 24);
      uint64_t v145 = *((void *)v139 + 3);
      if (v144)
      {
        if (v145) {
          objc_msgSend(v144, "mergeFrom:");
        }
      }
      else if (v145)
      {
        -[GEOPDSiriSearchParameters setAddress:](v137, *((void **)v139 + 3));
      }
      long long v697 = 0u;
      long long v698 = 0u;
      long long v695 = 0u;
      long long v696 = 0u;
      id v146 = *((id *)v139 + 4);
      uint64_t v147 = [v146 countByEnumeratingWithState:&v695 objects:&v707 count:16];
      if (v147)
      {
        uint64_t v148 = v147;
        uint64_t v149 = *(void *)v696;
        do
        {
          for (uint64_t n = 0; n != v148; ++n)
          {
            if (*(void *)v696 != v149) {
              objc_enumerationMutation(v146);
            }
            -[GEOPDSiriSearchParameters addBusinessCategoryFilter:](v137, *(void **)(*((void *)&v695 + 1) + 8 * n));
          }
          uint64_t v148 = [v146 countByEnumeratingWithState:&v695 objects:&v707 count:16];
        }
        while (v148);
      }

      __int16 v151 = *((_WORD *)v139 + 52);
      if ((v151 & 4) != 0)
      {
        *(unsigned char *)(v137 + 100) = *((unsigned char *)v139 + 100);
        *(_WORD *)(v137 + 104) |= 4u;
        __int16 v151 = *((_WORD *)v139 + 52);
      }
      if ((v151 & 8) != 0)
      {
        *(unsigned char *)(v137 + 101) = *((unsigned char *)v139 + 101);
        *(_WORD *)(v137 + 104) |= 8u;
      }
      long long v693 = 0u;
      long long v694 = 0u;
      long long v691 = 0u;
      long long v692 = 0u;
      id v152 = *((id *)v139 + 8);
      uint64_t v153 = [v152 countByEnumeratingWithState:&v691 objects:&v703 count:16];
      if (v153)
      {
        uint64_t v154 = v153;
        uint64_t v155 = *(void *)v692;
        do
        {
          for (iuint64_t i = 0; ii != v154; ++ii)
          {
            if (*(void *)v692 != v155) {
              objc_enumerationMutation(v152);
            }
            -[GEOPDSiriSearchParameters addSearchSubstringDescriptor:](v137, *(void **)(*((void *)&v691 + 1) + 8 * ii));
          }
          uint64_t v154 = [v152 countByEnumeratingWithState:&v691 objects:&v703 count:16];
        }
        while (v154);
      }

      uint64_t v157 = *(void *)(v137 + 40);
      v158 = (void *)*((void *)v139 + 5);
      if (v157)
      {
        if (v158)
        {
          id v159 = v158;
          -[GEOPDIndexQueryNode readAll:]((uint64_t)v159, 0);
          *(_DWORD *)(v157 + 60) = *((_DWORD *)v159 + 15);
          v160 = (void *)*((void *)v159 + 3);
          if (v160) {
            -[GEOPDIndexQueryNode setField:](v157, v160);
          }
          v161 = (void *)*((void *)v159 + 5);
          if (v161) {
            -[GEOPDIndexQueryNode setValue:](v157, v161);
          }
          long long v701 = 0u;
          long long v702 = 0u;
          long long v699 = 0u;
          long long v700 = 0u;
          id v162 = *((id *)v159 + 4);
          uint64_t v163 = [v162 countByEnumeratingWithState:&v699 objects:v711 count:16];
          if (v163)
          {
            uint64_t v164 = v163;
            uint64_t v165 = *(void *)v700;
            do
            {
              for (juint64_t j = 0; jj != v164; ++jj)
              {
                if (*(void *)v700 != v165) {
                  objc_enumerationMutation(v162);
                }
                -[GEOPDIndexQueryNode addOperand:](v157, *(void **)(*((void *)&v699 + 1) + 8 * jj));
              }
              uint64_t v164 = [v162 countByEnumeratingWithState:&v699 objects:v711 count:16];
            }
            while (v164);
          }
        }
      }
      else if (v158)
      {
        -[GEOPDSiriSearchParameters setIndexFilter:](v137, v158);
      }
      uint64_t v167 = *(void *)(v137 + 48);
      v168 = (void *)*((void *)v139 + 6);
      if (v167)
      {
        if (v168) {
          -[GEOPDRecentRouteInfo mergeFrom:](v167, v168);
        }
      }
      else if (v168)
      {
        -[GEOPDSiriSearchParameters setRecentRouteInfo:](v137, v168);
      }
    }
  }
  else if (v138)
  {
    -[GEOPDPlaceRequestParameters setSiriSearchParameters:]((uint64_t)a1, v138);
  }
  uint64_t v169 = a1[27];
  v170 = (void *)*((void *)v690 + 27);
  if (v169)
  {
    if (v170)
    {
      id v171 = v170;
      -[GEOPDLocationDirectedSearchParameters readAll:]((uint64_t)v171, 0);
      __int16 v172 = *((_WORD *)v171 + 48);
      if ((v172 & 4) != 0)
      {
        *(_DWORD *)(v169 + 92) = *((_DWORD *)v171 + 23);
        *(_WORD *)(v169 + 96) |= 4u;
        __int16 v172 = *((_WORD *)v171 + 48);
      }
      if (v172)
      {
        *(_DWORD *)(v169 + 84) = *((_DWORD *)v171 + 21);
        *(_WORD *)(v169 + 96) |= 1u;
      }
      v173 = (void *)*((void *)v171 + 7);
      if (v173) {
        -[GEOPDLocationDirectedSearchParameters setSearchString:](v169, v173);
      }
      v174 = *(void **)(v169 + 64);
      uint64_t v175 = *((void *)v171 + 8);
      if (v174)
      {
        if (v175) {
          objc_msgSend(v174, "mergeFrom:");
        }
      }
      else if (v175)
      {
        -[GEOPDLocationDirectedSearchParameters setViewportInfo:](v169, *((void **)v171 + 8));
      }
      v176 = *(void **)(v169 + 48);
      uint64_t v177 = *((void *)v171 + 6);
      if (v176)
      {
        if (v177) {
          objc_msgSend(v176, "mergeFrom:");
        }
      }
      else if (v177)
      {
        -[GEOPDLocationDirectedSearchParameters setSearchLocation:](v169, *((void **)v171 + 6));
      }
      if ((*((_WORD *)v171 + 48) & 2) != 0)
      {
        *(_DWORD *)(v169 + 88) = *((_DWORD *)v171 + 22);
        *(_WORD *)(v169 + 96) |= 2u;
      }
      uint64_t v178 = *(void *)(v169 + 24);
      v179 = (void *)*((void *)v171 + 3);
      if (v178)
      {
        if (v179)
        {
          v180 = v179;
          char v181 = v180[28];
          if (v181)
          {
            *(void *)(v178 + 16) = *((void *)v180 + 2);
            *(unsigned char *)(v178 + 28) |= 1u;
            char v181 = v180[28];
          }
          if ((v181 & 2) != 0)
          {
            *(unsigned char *)(v178 + 24) = v180[24];
            *(unsigned char *)(v178 + 28) |= 2u;
          }
        }
      }
      else if (v179)
      {
        -[GEOPDLocationDirectedSearchParameters setNearestTransitParameters:](v169, v179);
      }
      uint64_t v182 = *(void *)(v169 + 32);
      v183 = (void *)*((void *)v171 + 4);
      if (v182)
      {
        if (v183) {
          -[GEOPDPaginationParameters mergeFrom:](v182, v183);
        }
      }
      else if (v183)
      {
        -[GEOPDLocationDirectedSearchParameters setPaginationParameters:](v169, v183);
      }
      uint64_t v184 = *(void *)(v169 + 40);
      v185 = (void *)*((void *)v171 + 5);
      if (v184)
      {
        if (v185) {
          -[GEOPDSSearchFilter mergeFrom:](v184, v185);
        }
      }
      else if (v185)
      {
        -[GEOPDLocationDirectedSearchParameters setSearchFilter:](v169, v185);
      }
    }
  }
  else if (v170)
  {
    -[GEOPDPlaceRequestParameters setLocationDirectedSearchParameters:]((uint64_t)a1, v170);
  }
  v186 = (void *)a1[8];
  uint64_t v187 = *((void *)v690 + 8);
  if (v186)
  {
    if (v187) {
      objc_msgSend(v186, "mergeFrom:");
    }
  }
  else if (v187)
  {
    -[GEOPDPlaceRequestParameters setAutocompleteParameters:]((uint64_t)a1, *((void **)v690 + 8));
  }
  uint64_t v188 = a1[15];
  v189 = (void *)*((void *)v690 + 15);
  if (v188)
  {
    if (v189) {
      -[GEOPDSearchBrowseCategorySuggestionParameters mergeFrom:](v188, v189);
    }
  }
  else if (v189)
  {
    -[GEOPDPlaceRequestParameters setBrowseCategorySuggestionParameters:]((uint64_t)a1, v189);
  }
  uint64_t v190 = a1[17];
  v191 = (void *)*((void *)v690 + 17);
  if (v190)
  {
    if (!v191) {
      goto LABEL_475;
    }
    id v192 = v191;
    -[GEOPDCategorySearchParameters readAll:]((uint64_t)v192, 0);
    if ((*((unsigned char *)v192 + 288) & 8) != 0)
    {
      *(_DWORD *)(v190 + 272) = *((_DWORD *)v192 + 68);
      *(_DWORD *)(v190 + 288) |= 8u;
    }
    v193 = *(void **)(v190 + 240);
    uint64_t v194 = *((void *)v192 + 30);
    if (v193)
    {
      if (v194) {
        objc_msgSend(v193, "mergeFrom:");
      }
    }
    else if (v194)
    {
      -[GEOPDCategorySearchParameters setViewportInfo:](v190, *((void **)v192 + 30));
    }
    v195 = (void *)*((void *)v192 + 29);
    if (v195) {
      -[GEOPDCategorySearchParameters setSuggestionEntryMetadata:](v190, v195);
    }
    int v196 = *((_DWORD *)v192 + 72);
    if ((v196 & 2) != 0)
    {
      *(_DWORD *)(v190 + 264) = *((_DWORD *)v192 + 66);
      *(_DWORD *)(v190 + 288) |= 2u;
      int v196 = *((_DWORD *)v192 + 72);
      if ((v196 & 4) == 0)
      {
LABEL_380:
        if ((v196 & 0x20) == 0)
        {
LABEL_382:
          uint64_t v197 = *(void *)(v190 + 184);
          v198 = (void *)*((void *)v192 + 23);
          if (v197)
          {
            if (v198) {
              -[GEOPDRecentRouteInfo mergeFrom:](v197, v198);
            }
          }
          else if (v198)
          {
            -[GEOPDCategorySearchParameters setRecentRouteInfo:](v190, v198);
          }
          if ((*((unsigned char *)v192 + 288) & 0x40) != 0)
          {
            *(unsigned char *)(v190 + 284) = *((unsigned char *)v192 + 284);
            *(_DWORD *)(v190 + 288) |= 0x40u;
          }
          uint64_t v199 = *(void *)(v190 + 160);
          v200 = (void *)*((void *)v192 + 20);
          if (v199)
          {
            if (v200) {
              -[GEOPDSSearchEvChargingParameters mergeFrom:](v199, v200);
            }
          }
          else if (v200)
          {
            -[GEOPDCategorySearchParameters setEvChargingParameters:](v190, v200);
          }
          -[GEOPDCategorySearchParameters _readSupportedRelatedEntitySectionTypes]((uint64_t)v192);
          uint64_t v201 = *((void *)v192 + 10);
          if (v201)
          {
            unint64_t v202 = 0;
            uint64_t v203 = *MEMORY[0x1E4F1C4A8];
            do
            {
              -[GEOPDCategorySearchParameters _readSupportedRelatedEntitySectionTypes]((uint64_t)v192);
              unint64_t v204 = *((void *)v192 + 10);
              if (v204 <= v202)
              {
                v205 = (void *)MEMORY[0x1E4F1CA00];
                v206 = objc_msgSend(NSString, "stringWithFormat:", @"idx (%tu) is out of range (%tu)", v202, v204);
                v207 = [v205 exceptionWithName:v203 reason:v206 userInfo:0];
                [v207 raise];
              }
              -[GEOPDCategorySearchParameters addSupportedRelatedEntitySectionType:]((os_unfair_lock_s *)v190);
              ++v202;
            }
            while (v201 != v202);
          }
          uint64_t v208 = *(void *)(v190 + 152);
          v209 = (void *)*((void *)v192 + 19);
          if (v208)
          {
            if (v209) {
              -[GEOPDETAFilter mergeFrom:](v208, v209);
            }
          }
          else if (v209)
          {
            -[GEOPDCategorySearchParameters setEtaFilter:](v190, v209);
          }
          -[GEOPDCategorySearchParameters _readSupportedSearchTierTypes]((uint64_t)v192);
          uint64_t v210 = *((void *)v192 + 16);
          if (v210)
          {
            unint64_t v211 = 0;
            uint64_t v212 = *MEMORY[0x1E4F1C4A8];
            do
            {
              -[GEOPDCategorySearchParameters _readSupportedSearchTierTypes]((uint64_t)v192);
              unint64_t v213 = *((void *)v192 + 16);
              if (v213 <= v211)
              {
                v214 = (void *)MEMORY[0x1E4F1CA00];
                v215 = objc_msgSend(NSString, "stringWithFormat:", @"idx (%tu) is out of range (%tu)", v211, v213);
                v216 = [v214 exceptionWithName:v212 reason:v215 userInfo:0];
                [v216 raise];
              }
              -[GEOPDCategorySearchParameters addSupportedSearchTierType:]((os_unfair_lock_s *)v190);
              ++v211;
            }
            while (v210 != v211);
          }
          if (*((unsigned char *)v192 + 288))
          {
            *(_DWORD *)(v190 + 260) = *((_DWORD *)v192 + 65);
            *(_DWORD *)(v190 + 288) |= 1u;
          }
          v217 = *(void **)(v190 + 192);
          uint64_t v218 = *((void *)v192 + 24);
          if (v217)
          {
            if (v218) {
              objc_msgSend(v217, "mergeFrom:");
            }
          }
          else if (v218)
          {
            -[GEOPDCategorySearchParameters setResultRefinementQuery:](v190, *((void **)v192 + 24));
          }
          -[GEOPDCategorySearchParameters _readKnownRefinementTypes]((uint64_t)v192);
          uint64_t v219 = *((void *)v192 + 4);
          if (v219)
          {
            unint64_t v220 = 0;
            uint64_t v221 = *MEMORY[0x1E4F1C4A8];
            do
            {
              -[GEOPDCategorySearchParameters _readKnownRefinementTypes]((uint64_t)v192);
              unint64_t v222 = *((void *)v192 + 4);
              if (v222 <= v220)
              {
                v223 = (void *)MEMORY[0x1E4F1CA00];
                v224 = objc_msgSend(NSString, "stringWithFormat:", @"idx (%tu) is out of range (%tu)", v220, v222);
                v225 = [v223 exceptionWithName:v221 reason:v224 userInfo:0];
                [v225 raise];
              }
              -[GEOPDCategorySearchParameters addKnownRefinementType:]((os_unfair_lock_s *)v190);
              ++v220;
            }
            while (v219 != v220);
          }
          if ((*((unsigned char *)v192 + 288) & 0x10) != 0)
          {
            *(_DWORD *)(v190 + 276) = *((_DWORD *)v192 + 69);
            *(_DWORD *)(v190 + 288) |= 0x10u;
          }
          v226 = *(void **)(v190 + 176);
          uint64_t v227 = *((void *)v192 + 22);
          if (v226)
          {
            if (v227) {
              objc_msgSend(v226, "mergeFrom:");
            }
          }
          else if (v227)
          {
            -[GEOPDCategorySearchParameters setPreviousSearchViewport:](v190, *((void **)v192 + 22));
          }
          -[GEOPDCategorySearchParameters _readSupportedPlaceSummaryFormatTypes]((uint64_t)v192);
          uint64_t v228 = *((void *)v192 + 7);
          if (v228)
          {
            unint64_t v229 = 0;
            uint64_t v230 = *MEMORY[0x1E4F1C4A8];
            do
            {
              -[GEOPDCategorySearchParameters _readSupportedPlaceSummaryFormatTypes]((uint64_t)v192);
              unint64_t v231 = *((void *)v192 + 7);
              if (v231 <= v229)
              {
                v232 = (void *)MEMORY[0x1E4F1CA00];
                v233 = objc_msgSend(NSString, "stringWithFormat:", @"idx (%tu) is out of range (%tu)", v229, v231);
                v234 = [v232 exceptionWithName:v230 reason:v233 userInfo:0];
                [v234 raise];
              }
              -[GEOPDCategorySearchParameters addSupportedPlaceSummaryFormatType:]((os_unfair_lock_s *)v190);
              ++v229;
            }
            while (v228 != v229);
          }
          -[GEOPDCategorySearchParameters _readSupportedSearchSectionTypes]((uint64_t)v192);
          uint64_t v235 = *((void *)v192 + 13);
          if (v235)
          {
            unint64_t v236 = 0;
            uint64_t v237 = *MEMORY[0x1E4F1C4A8];
            do
            {
              -[GEOPDCategorySearchParameters _readSupportedSearchSectionTypes]((uint64_t)v192);
              unint64_t v238 = *((void *)v192 + 13);
              if (v238 <= v236)
              {
                v239 = (void *)MEMORY[0x1E4F1CA00];
                v240 = objc_msgSend(NSString, "stringWithFormat:", @"idx (%tu) is out of range (%tu)", v236, v238);
                v241 = [v239 exceptionWithName:v237 reason:v240 userInfo:0];
                [v241 raise];
              }
              -[GEOPDCategorySearchParameters addSupportedSearchSectionType:]((os_unfair_lock_s *)v190);
              ++v236;
            }
            while (v235 != v236);
          }
          int v242 = *((_DWORD *)v192 + 72);
          if ((v242 & 0x80) != 0)
          {
            *(unsigned char *)(v190 + 285) = *((unsigned char *)v192 + 285);
            *(_DWORD *)(v190 + 288) |= 0x80u;
            int v242 = *((_DWORD *)v192 + 72);
          }
          a1 = v689;
          if ((v242 & 0x100) != 0)
          {
            *(unsigned char *)(v190 + 286) = *((unsigned char *)v192 + 286);
            *(_DWORD *)(v190 + 288) |= 0x100u;
          }
          uint64_t v243 = *(void *)(v190 + 208);
          v244 = (void *)*((void *)v192 + 26);
          if (v243)
          {
            if (v244) {
              -[GEOPDSearchOriginationInfo mergeFrom:](v243, v244);
            }
          }
          else if (v244)
          {
            -[GEOPDCategorySearchParameters setSearchOriginationInfo:](v190, v244);
          }
          v245 = (void *)*((void *)v192 + 18);
          if (v245) {
            -[GEOPDCategorySearchParameters setEnrichmentCampaignNamespace:](v190, v245);
          }
          long long v709 = 0u;
          long long v710 = 0u;
          long long v707 = 0u;
          long long v708 = 0u;
          id v246 = *((id *)v192 + 25);
          uint64_t v247 = [v246 countByEnumeratingWithState:&v707 objects:v711 count:16];
          if (v247)
          {
            uint64_t v248 = v247;
            uint64_t v249 = *(void *)v708;
            do
            {
              for (kuint64_t k = 0; kk != v248; ++kk)
              {
                if (*(void *)v708 != v249) {
                  objc_enumerationMutation(v246);
                }
                -[GEOPDCategorySearchParameters addSearchEnrichmentRevisionMetadata:](v190, *(void **)(*((void *)&v707 + 1) + 8 * kk));
              }
              uint64_t v248 = [v246 countByEnumeratingWithState:&v707 objects:v711 count:16];
            }
            while (v248);
          }

          v251 = (void *)*((void *)v192 + 27);
          if (*(void *)(v190 + 216)) {
            BOOL v252 = 1;
          }
          else {
            BOOL v252 = v251 == 0;
          }
          if (!v252) {
            -[GEOPDCategorySearchParameters setSearchSessionData:](v190, v251);
          }
          v253 = *(void **)(v190 + 224);
          uint64_t v254 = *((void *)v192 + 28);
          if (v253)
          {
            if (v254) {
              objc_msgSend(v253, "mergeFrom:");
            }
          }
          else if (v254)
          {
            -[GEOPDCategorySearchParameters setSessionUserActionMetadata:](v190, *((void **)v192 + 28));
          }
          uint64_t v255 = *(void *)(v190 + 168);
          v256 = (void *)*((void *)v192 + 21);
          if (v255)
          {
            if (v256) {
              -[GEOPDPaginationParameters mergeFrom:](v255, v256);
            }
          }
          else if (v256)
          {
            -[GEOPDCategorySearchParameters setPaginationParameters:](v190, v256);
          }

          goto LABEL_475;
        }
LABEL_381:
        *(_DWORD *)(v190 + 280) = *((_DWORD *)v192 + 70);
        *(_DWORD *)(v190 + 288) |= 0x20u;
        goto LABEL_382;
      }
    }
    else if ((v196 & 4) == 0)
    {
      goto LABEL_380;
    }
    *(_DWORD *)(v190 + 268) = *((_DWORD *)v192 + 67);
    *(_DWORD *)(v190 + 288) |= 4u;
    if ((*((_DWORD *)v192 + 72) & 0x20) == 0) {
      goto LABEL_382;
    }
    goto LABEL_381;
  }
  if (v191) {
    -[GEOPDPlaceRequestParameters setCategorySearchParameters:]((uint64_t)a1, v191);
  }
LABEL_475:
  uint64_t v257 = a1[40];
  v258 = (void *)*((void *)v690 + 40);
  if (v257)
  {
    if (v258)
    {
      id v259 = v258;
      -[GEOPDPopularNearbySearchParameters readAll:]((uint64_t)v259, 0);
      if (*((unsigned char *)v259 + 60))
      {
        *(_DWORD *)(v257 + 52) = *((_DWORD *)v259 + 13);
        *(unsigned char *)(v257 + 60) |= 1u;
      }
      v260 = *(void **)(v257 + 32);
      uint64_t v261 = *((void *)v259 + 4);
      if (v260)
      {
        if (v261) {
          objc_msgSend(v260, "mergeFrom:");
        }
      }
      else if (v261)
      {
        -[GEOPDPopularNearbySearchParameters setViewportInfo:](v257, *((void **)v259 + 4));
      }
      v262 = (void *)*((void *)v259 + 3);
      if (v262) {
        -[GEOPDPopularNearbySearchParameters setSuggestionEntryMetadata:](v257, v262);
      }
      if ((*((unsigned char *)v259 + 60) & 2) != 0)
      {
        *(_DWORD *)(v257 + 56) = *((_DWORD *)v259 + 14);
        *(unsigned char *)(v257 + 60) |= 2u;
      }
    }
  }
  else if (v258)
  {
    -[GEOPDPlaceRequestParameters setPopularNearbySearchParameters:]((uint64_t)a1, v258);
  }
  uint64_t v263 = a1[48];
  v264 = (void *)*((void *)v690 + 48);
  if (v263)
  {
    if (!v264) {
      goto LABEL_507;
    }
    v265 = v264;
    id v266 = v265;
    if (*((unsigned char *)v265 + 44))
    {
      *(void *)(v263 + 16) = v265[2];
      *(unsigned char *)(v263 + 44) |= 1u;
    }
    v267 = *(void **)(v263 + 24);
    uint64_t v268 = *((void *)v266 + 3);
    if (v267)
    {
      if (v268) {
        objc_msgSend(v267, "mergeFrom:");
      }
    }
    else if (v268)
    {
      -[GEOPDSearchZeroKeywordCategorySuggestionParameters setSignificantLocation:](v263, *((void **)v266 + 3));
    }
    char v269 = *((unsigned char *)v266 + 44);
    if ((v269 & 2) != 0)
    {
      *(_DWORD *)(v263 + 32) = *((_DWORD *)v266 + 8);
      *(unsigned char *)(v263 + 44) |= 2u;
      char v269 = *((unsigned char *)v266 + 44);
      if ((v269 & 4) == 0)
      {
LABEL_504:
        if ((v269 & 8) == 0)
        {
LABEL_506:

          goto LABEL_507;
        }
LABEL_505:
        *(unsigned char *)(v263 + 40) = *((unsigned char *)v266 + 40);
        *(unsigned char *)(v263 + 44) |= 8u;
        goto LABEL_506;
      }
    }
    else if ((*((unsigned char *)v266 + 44) & 4) == 0)
    {
      goto LABEL_504;
    }
    *(_DWORD *)(v263 + 36) = *((_DWORD *)v266 + 9);
    *(unsigned char *)(v263 + 44) |= 4u;
    if ((*((unsigned char *)v266 + 44) & 8) == 0) {
      goto LABEL_506;
    }
    goto LABEL_505;
  }
  if (v264) {
    -[GEOPDPlaceRequestParameters setSearchZeroKeywordCategorySuggestionParameters:]((uint64_t)a1, v264);
  }
LABEL_507:
  uint64_t v270 = a1[46];
  v271 = (void *)*((void *)v690 + 46);
  if (v270)
  {
    if (v271)
    {
      v272 = v271;
      char v273 = v272[24];
      if (v273)
      {
        *(_DWORD *)(v270 + 16) = *((_DWORD *)v272 + 4);
        *(unsigned char *)(v270 + 24) |= 1u;
        char v273 = v272[24];
      }
      if ((v273 & 2) != 0)
      {
        *(unsigned char *)(v270 + 20) = v272[20];
        *(unsigned char *)(v270 + 24) |= 2u;
      }
    }
  }
  else if (v271)
  {
    -[GEOPDPlaceRequestParameters setSearchFieldPlaceholderParameters:]((uint64_t)a1, v271);
  }
  uint64_t v274 = a1[11];
  v275 = (void *)*((void *)v690 + 11);
  if (v274)
  {
    if (v275)
    {
      id v276 = v275;
      -[GEOPDBatchPopularNearbySearchParameters readAll:]((uint64_t)v276, 0);
      if ((*((unsigned char *)v276 + 64) & 2) != 0)
      {
        *(_DWORD *)(v274 + 60) = *((_DWORD *)v276 + 15);
        *(unsigned char *)(v274 + 64) |= 2u;
      }
      v277 = *(void **)(v274 + 40);
      uint64_t v278 = *((void *)v276 + 5);
      if (v277)
      {
        if (v278) {
          objc_msgSend(v277, "mergeFrom:");
        }
      }
      else if (v278)
      {
        -[GEOPDBatchPopularNearbySearchParameters setViewportInfo:](v274, *((void **)v276 + 5));
      }
      if (*((unsigned char *)v276 + 64))
      {
        *(void *)(v274 + 24) = *((void *)v276 + 3);
        *(unsigned char *)(v274 + 64) |= 1u;
      }
      long long v709 = 0u;
      long long v710 = 0u;
      long long v707 = 0u;
      long long v708 = 0u;
      id v279 = *((id *)v276 + 4);
      uint64_t v280 = [v279 countByEnumeratingWithState:&v707 objects:v711 count:16];
      if (v280)
      {
        uint64_t v281 = v280;
        uint64_t v282 = *(void *)v708;
        do
        {
          for (muint64_t m = 0; mm != v281; ++mm)
          {
            if (*(void *)v708 != v282) {
              objc_enumerationMutation(v279);
            }
            -[GEOPDBatchPopularNearbySearchParameters addSuggestionEntryMetadata:](v274, *(void **)(*((void *)&v707 + 1) + 8 * mm));
          }
          uint64_t v281 = [v279 countByEnumeratingWithState:&v707 objects:v711 count:16];
        }
        while (v281);
      }
    }
  }
  else if (v275)
  {
    -[GEOPDPlaceRequestParameters setBatchPopularNearbySearchParameters:]((uint64_t)a1, v275);
  }
  uint64_t v284 = a1[56];
  v285 = (void *)*((void *)v690 + 56);
  if (v284)
  {
    if (v285)
    {
      id v286 = v285;
      -[GEOPDVendorSpecificPlaceRefinementParameters readAll:]((uint64_t)v286, 0);
      __int16 v287 = *((_WORD *)v286 + 56);
      if ((v287 & 8) != 0)
      {
        *(_DWORD *)(v284 + 108) = *((_DWORD *)v286 + 27);
        *(_WORD *)(v284 + 112) |= 8u;
        __int16 v287 = *((_WORD *)v286 + 56);
      }
      if (v287)
      {
        *(void *)(v284 + 64) = *((void *)v286 + 8);
        *(_WORD *)(v284 + 112) |= 1u;
      }
      v288 = (void *)*((void *)v286 + 10);
      if (v288) {
        -[GEOPDVendorSpecificPlaceRefinementParameters setVendorId:](v284, v288);
      }
      v289 = (void *)*((void *)v286 + 5);
      if (v289) {
        -[GEOPDVendorSpecificPlaceRefinementParameters setExternalItemId:](v284, v289);
      }
      v290 = *(void **)(v284 + 56);
      uint64_t v291 = *((void *)v286 + 7);
      if (v290)
      {
        if (v291) {
          objc_msgSend(v290, "mergeFrom:");
        }
      }
      else if (v291)
      {
        -[GEOPDVendorSpecificPlaceRefinementParameters setLocationHint:](v284, *((void **)v286 + 7));
      }
      v292 = *(void **)(v284 + 24);
      uint64_t v293 = *((void *)v286 + 3);
      if (v292)
      {
        if (v293) {
          objc_msgSend(v292, "mergeFrom:");
        }
      }
      else if (v293)
      {
        -[GEOPDVendorSpecificPlaceRefinementParameters setAddressHint:](v284, *((void **)v286 + 3));
      }
      v294 = (void *)*((void *)v286 + 9);
      if (v294) {
        -[GEOPDVendorSpecificPlaceRefinementParameters setPlaceNameHint:](v284, v294);
      }
      long long v709 = 0u;
      long long v710 = 0u;
      long long v707 = 0u;
      long long v708 = 0u;
      id v295 = *((id *)v286 + 6);
      uint64_t v296 = [v295 countByEnumeratingWithState:&v707 objects:v711 count:16];
      if (v296)
      {
        uint64_t v297 = v296;
        uint64_t v298 = *(void *)v708;
        do
        {
          for (nuint64_t n = 0; nn != v297; ++nn)
          {
            if (*(void *)v708 != v298) {
              objc_enumerationMutation(v295);
            }
            -[GEOPDVendorSpecificPlaceRefinementParameters addFormattedAddressLineHint:](v284, *(void **)(*((void *)&v707 + 1) + 8 * nn));
          }
          uint64_t v297 = [v295 countByEnumeratingWithState:&v707 objects:v711 count:16];
        }
        while (v297);
      }

      __int16 v300 = *((_WORD *)v286 + 56);
      if ((v300 & 4) != 0)
      {
        *(_DWORD *)(v284 + 104) = *((_DWORD *)v286 + 26);
        *(_WORD *)(v284 + 112) |= 4u;
        __int16 v300 = *((_WORD *)v286 + 56);
      }
      if ((v300 & 2) != 0)
      {
        *(_DWORD *)(v284 + 100) = *((_DWORD *)v286 + 25);
        *(_WORD *)(v284 + 112) |= 2u;
      }
      v301 = (void *)*((void *)v286 + 4);
      if (v301) {
        -[GEOPDVendorSpecificPlaceRefinementParameters setAddressObjectHint:](v284, v301);
      }
    }
  }
  else if (v285)
  {
    -[GEOPDPlaceRequestParameters setVendorSpecificPlaceRefinementParameters:]((uint64_t)a1, v285);
  }
  uint64_t v302 = a1[32];
  v303 = (void *)*((void *)v690 + 32);
  if (v302)
  {
    if (v303)
    {
      id v304 = v303;
      -[GEOPDNearbySearchParameters readAll:]((uint64_t)v304, 0);
      char v305 = *((unsigned char *)v304 + 60);
      if ((v305 & 2) != 0)
      {
        *(_DWORD *)(v302 + 56) = *((_DWORD *)v304 + 14);
        *(unsigned char *)(v302 + 60) |= 2u;
        char v305 = *((unsigned char *)v304 + 60);
      }
      if (v305)
      {
        *(_DWORD *)(v302 + 52) = *((_DWORD *)v304 + 13);
        *(unsigned char *)(v302 + 60) |= 1u;
      }
      v306 = *(void **)(v302 + 32);
      uint64_t v307 = *((void *)v304 + 4);
      if (v306)
      {
        if (v307) {
          objc_msgSend(v306, "mergeFrom:");
        }
      }
      else if (v307)
      {
        -[GEOPDNearbySearchParameters setViewportInfo:](v302, *((void **)v304 + 4));
      }
      uint64_t v308 = *(void *)(v302 + 24);
      v309 = (void *)*((void *)v304 + 3);
      if (v308)
      {
        if (v309)
        {
          v310 = v309;
          long long v707 = 0u;
          long long v708 = 0u;
          long long v709 = 0u;
          long long v710 = 0u;
          id v311 = v310[2];
          uint64_t v312 = [v311 countByEnumeratingWithState:&v707 objects:v711 count:16];
          if (v312)
          {
            uint64_t v313 = v312;
            uint64_t v314 = *(void *)v708;
            do
            {
              for (uint64_t i1 = 0; i1 != v313; ++i1)
              {
                if (*(void *)v708 != v314) {
                  objc_enumerationMutation(v311);
                }
                -[GEOPDNearbySearchFilter addIncludedCategoryFilter:](v308, *(void **)(*((void *)&v707 + 1) + 8 * i1));
              }
              uint64_t v313 = [v311 countByEnumeratingWithState:&v707 objects:v711 count:16];
            }
            while (v313);
          }

          if (*((unsigned char *)v310 + 28))
          {
            *(_DWORD *)(v308 + 24) = *((_DWORD *)v310 + 6);
            *(unsigned char *)(v308 + 28) |= 1u;
          }
        }
      }
      else if (v309)
      {
        -[GEOPDNearbySearchParameters setNearbySearchFilter:](v302, v309);
      }
    }
  }
  else if (v303)
  {
    -[GEOPDPlaceRequestParameters setNearbySearchParameters:]((uint64_t)a1, v303);
  }
  uint64_t v316 = a1[3];
  v317 = (void *)*((void *)v690 + 3);
  if (v316)
  {
    if (v317)
    {
      id v318 = v317;
      -[GEOPDAddressObjectGeocodingParameters readAll:]((uint64_t)v318, 0);
      v319 = (void *)*((void *)v318 + 3);
      if (v319) {
        -[GEOPDAddressObjectGeocodingParameters setAddressObject:](v316, v319);
      }
      if (*((unsigned char *)v318 + 56))
      {
        *(_DWORD *)(v316 + 52) = *((_DWORD *)v318 + 13);
        *(unsigned char *)(v316 + 56) |= 1u;
      }
      v320 = *(void **)(v316 + 32);
      uint64_t v321 = *((void *)v318 + 4);
      if (v320)
      {
        if (v321) {
          objc_msgSend(v320, "mergeFrom:");
        }
      }
      else if (v321)
      {
        -[GEOPDAddressObjectGeocodingParameters setViewportInfo:](v316, *((void **)v318 + 4));
      }
    }
  }
  else if (v317)
  {
    -[GEOPDPlaceRequestParameters setAddressObjectGeocodingParameters:]((uint64_t)a1, v317);
  }
  uint64_t v322 = a1[49];
  v323 = (void *)*((void *)v690 + 49);
  if (!v322)
  {
    if (v323) {
      -[GEOPDPlaceRequestParameters setSearchZeroKeywordWithSearchResultsSuggestionParameters:]((uint64_t)a1, v323);
    }
    goto LABEL_631;
  }
  if (v323)
  {
    v324 = v323;
    char v325 = v324[32];
    if ((v325 & 4) != 0)
    {
      *(_DWORD *)(v322 + 24) = *((_DWORD *)v324 + 6);
      *(unsigned char *)(v322 + 32) |= 4u;
      char v325 = v324[32];
    }
    if ((v325 & 8) != 0)
    {
      *(_DWORD *)(v322 + 28) = *((_DWORD *)v324 + 7);
      *(unsigned char *)(v322 + 32) |= 8u;
      char v325 = v324[32];
      if ((v325 & 1) == 0)
      {
LABEL_626:
        if ((v325 & 2) == 0)
        {
LABEL_628:

          goto LABEL_631;
        }
LABEL_627:
        *(_DWORD *)(v322 + 20) = *((_DWORD *)v324 + 5);
        *(unsigned char *)(v322 + 32) |= 2u;
        goto LABEL_628;
      }
    }
    else if ((v325 & 1) == 0)
    {
      goto LABEL_626;
    }
    *(_DWORD *)(v322 + 16) = *((_DWORD *)v324 + 4);
    *(unsigned char *)(v322 + 32) |= 1u;
    if ((v324[32] & 2) == 0) {
      goto LABEL_628;
    }
    goto LABEL_627;
  }
LABEL_631:
  uint64_t v326 = a1[21];
  v327 = (void *)*((void *)v690 + 21);
  if (v326)
  {
    if (v327)
    {
      id v328 = v327;
      -[GEOPDExternalTransitLookupParameters readAll:]((uint64_t)v328, 0);
      if (*((unsigned char *)v328 + 68))
      {
        *(void *)(v326 + 48) = *((void *)v328 + 6);
        *(unsigned char *)(v326 + 68) |= 1u;
      }
      v329 = *(void **)(v326 + 40);
      uint64_t v330 = *((void *)v328 + 5);
      if (v329)
      {
        if (v330) {
          objc_msgSend(v329, "mergeFrom:");
        }
      }
      else if (v330)
      {
        -[GEOPDExternalTransitLookupParameters setTransactionLocation:](v326, *((void **)v328 + 5));
      }
      v331 = (void *)*((void *)v328 + 4);
      if (v331) {
        -[GEOPDExternalTransitLookupParameters setSourceId:](v326, v331);
      }
      long long v709 = 0u;
      long long v710 = 0u;
      long long v707 = 0u;
      long long v708 = 0u;
      id v332 = *((id *)v328 + 3);
      uint64_t v333 = [v332 countByEnumeratingWithState:&v707 objects:v711 count:16];
      if (v333)
      {
        uint64_t v334 = v333;
        uint64_t v335 = *(void *)v708;
        do
        {
          for (uint64_t i2 = 0; i2 != v334; ++i2)
          {
            if (*(void *)v708 != v335) {
              objc_enumerationMutation(v332);
            }
            -[GEOPDExternalTransitLookupParameters addExternalTransitStationCode:](v326, *(void **)(*((void *)&v707 + 1) + 8 * i2));
          }
          uint64_t v334 = [v332 countByEnumeratingWithState:&v707 objects:v711 count:16];
        }
        while (v334);
      }
    }
  }
  else if (v327)
  {
    -[GEOPDPlaceRequestParameters setExternalTransitLookupParameters:]((uint64_t)a1, v327);
  }
  uint64_t v337 = a1[22];
  v338 = (void *)*((void *)v690 + 22);
  if (v337)
  {
    if (v338)
    {
      id v339 = v338;
      -[GEOPDFeatureIdGeocodingParameters readAll:]((uint64_t)v339, 0);
      if (*((unsigned char *)v339 + 80))
      {
        *(void *)(v337 + 48) = *((void *)v339 + 6);
        *(unsigned char *)(v337 + 80) |= 1u;
      }
      -[GEOPDFeatureIdGeocodingParameters _readEncryptedFeatureIds]((uint64_t)v339);
      uint64_t v340 = *((void *)v339 + 4);
      if (v340)
      {
        unint64_t v341 = 0;
        uint64_t v342 = *MEMORY[0x1E4F1C4A8];
        do
        {
          -[GEOPDFeatureIdGeocodingParameters _readEncryptedFeatureIds]((uint64_t)v339);
          unint64_t v343 = *((void *)v339 + 4);
          if (v343 <= v341)
          {
            v344 = (void *)MEMORY[0x1E4F1CA00];
            v345 = objc_msgSend(NSString, "stringWithFormat:", @"idx (%tu) is out of range (%tu)", v341, v343);
            v346 = [v344 exceptionWithName:v342 reason:v345 userInfo:0];
            [v346 raise];
          }
          -[GEOPDFeatureIdGeocodingParameters addEncryptedFeatureId:](v337);
          ++v341;
        }
        while (v340 != v341);
      }
      v347 = *(void **)(v337 + 56);
      uint64_t v348 = *((void *)v339 + 7);
      if (v347)
      {
        a1 = v689;
        if (v348) {
          objc_msgSend(v347, "mergeFrom:");
        }
      }
      else
      {
        a1 = v689;
        if (v348) {
          -[GEOPDFeatureIdGeocodingParameters setLocation:](v337, *((void **)v339 + 7));
        }
      }
      if ((*((unsigned char *)v339 + 80) & 2) != 0)
      {
        *(_DWORD *)(v337 + 76) = *((_DWORD *)v339 + 19);
        *(unsigned char *)(v337 + 80) |= 2u;
      }
    }
  }
  else if (v338)
  {
    -[GEOPDPlaceRequestParameters setFeatureIdGeocodingParameters:]((uint64_t)a1, v338);
  }
  uint64_t v349 = a1[29];
  v350 = (void *)*((void *)v690 + 29);
  if (v349)
  {
    if (v350)
    {
      id v351 = v350;
      v352 = v351;
      if (*((unsigned char *)v351 + 32))
      {
        *(_DWORD *)(v349 + 24) = *((_DWORD *)v351 + 6);
        *(unsigned char *)(v349 + 32) |= 1u;
      }
      long long v709 = 0u;
      long long v710 = 0u;
      long long v707 = 0u;
      long long v708 = 0u;
      id v353 = *((id *)v351 + 2);
      uint64_t v354 = [v353 countByEnumeratingWithState:&v707 objects:v711 count:16];
      if (v354)
      {
        uint64_t v355 = v354;
        uint64_t v356 = *(void *)v708;
        do
        {
          for (uint64_t i3 = 0; i3 != v355; ++i3)
          {
            if (*(void *)v708 != v356) {
              objc_enumerationMutation(v353);
            }
            -[GEOPDMapsIdentifierPlaceLookupParameters addMapsId:](v349, *(void **)(*((void *)&v707 + 1) + 8 * i3));
          }
          uint64_t v355 = [v353 countByEnumeratingWithState:&v707 objects:v711 count:16];
        }
        while (v355);
      }

      if ((v352[32] & 2) != 0)
      {
        *(unsigned char *)(v349 + 28) = v352[28];
        *(unsigned char *)(v349 + 32) |= 2u;
      }
    }
  }
  else if (v350)
  {
    -[GEOPDPlaceRequestParameters setMapsIdentifierPlaceLookupParameters:]((uint64_t)a1, v350);
  }
  uint64_t v358 = a1[12];
  v359 = (void *)*((void *)v690 + 12);
  if (v358)
  {
    if (v359)
    {
      v360 = v359;
      -[GEOPDBatchReverseGeocodingParameters readAll:]((uint64_t)v360, 0);
      long long v709 = 0u;
      long long v710 = 0u;
      long long v707 = 0u;
      long long v708 = 0u;
      id v361 = v360[6];
      uint64_t v362 = [v361 countByEnumeratingWithState:&v707 objects:v711 count:16];
      if (v362)
      {
        uint64_t v363 = v362;
        uint64_t v364 = *(void *)v708;
        do
        {
          for (uint64_t i4 = 0; i4 != v363; ++i4)
          {
            if (*(void *)v708 != v364) {
              objc_enumerationMutation(v361);
            }
            -[GEOPDBatchReverseGeocodingParameters addAssetLocation:](v358, *(void **)(*((void *)&v707 + 1) + 8 * i4));
          }
          uint64_t v363 = [v361 countByEnumeratingWithState:&v707 objects:v711 count:16];
        }
        while (v363);
      }

      -[GEOPDBatchReverseGeocodingParameters _readAdditionalPlaceTypes]((uint64_t)v360);
      v366 = (char *)v360[4];
      if (v366)
      {
        v367 = 0;
        uint64_t v368 = *MEMORY[0x1E4F1C4A8];
        do
        {
          -[GEOPDBatchReverseGeocodingParameters _readAdditionalPlaceTypes]((uint64_t)v360);
          v369 = (char *)v360[4];
          if (v369 <= v367)
          {
            v370 = (void *)MEMORY[0x1E4F1CA00];
            v371 = objc_msgSend(NSString, "stringWithFormat:", @"idx (%tu) is out of range (%tu)", v367, v369);
            v372 = [v370 exceptionWithName:v368 reason:v371 userInfo:0];
            [v372 raise];
          }
          -[GEOPDBatchReverseGeocodingParameters addAdditionalPlaceType:](v358);
          ++v367;
        }
        while (v366 != v367);
      }

      a1 = v689;
    }
  }
  else if (v359)
  {
    -[GEOPDPlaceRequestParameters setBatchReverseGeocodingParameters:]((uint64_t)a1, v359);
  }
  uint64_t v373 = a1[14];
  v374 = (void *)*((void *)v690 + 14);
  if (v373)
  {
    if (v374)
    {
      v375 = (void *)v374[2];
      if (v375) {
        -[GEOPDBrandLookupParameters setImessageUid:](v373, v375);
      }
    }
  }
  else if (v374)
  {
    -[GEOPDPlaceRequestParameters setBrandLookupParameters:]((uint64_t)a1, v374);
  }
  uint64_t v376 = a1[57];
  v377 = (void *)*((void *)v690 + 57);
  if (v376)
  {
    if (v377)
    {
      v378 = v377;
      long long v707 = 0u;
      long long v708 = 0u;
      long long v709 = 0u;
      long long v710 = 0u;
      id v379 = v378[2];
      uint64_t v380 = [v379 countByEnumeratingWithState:&v707 objects:v711 count:16];
      if (v380)
      {
        uint64_t v381 = v380;
        uint64_t v382 = *(void *)v708;
        do
        {
          for (uint64_t i5 = 0; i5 != v381; ++i5)
          {
            if (*(void *)v708 != v382) {
              objc_enumerationMutation(v379);
            }
            -[GEOPDWifiFingerprintParameters addMeasurement:](v376, *(void **)(*((void *)&v707 + 1) + 8 * i5));
          }
          uint64_t v381 = [v379 countByEnumeratingWithState:&v707 objects:v711 count:16];
        }
        while (v381);
      }

      if (*((unsigned char *)v378 + 28))
      {
        *(_DWORD *)(v376 + 24) = *((_DWORD *)v378 + 6);
        *(unsigned char *)(v376 + 28) |= 1u;
      }
    }
  }
  else if (v377)
  {
    -[GEOPDPlaceRequestParameters setWifiFingerprintParameters:]((uint64_t)a1, v377);
  }
  uint64_t v384 = a1[26];
  v385 = (void *)*((void *)v690 + 26);
  if (v384)
  {
    if (v385)
    {
      v386 = (void *)v385[2];
      if (v386) {
        -[GEOPDIpGeoLookupParameters setIpAddress:](v384, v386);
      }
    }
  }
  else if (v385)
  {
    -[GEOPDPlaceRequestParameters setIpGeoLookupParameters:]((uint64_t)a1, v385);
  }
  uint64_t v387 = a1[24];
  v388 = (void *)*((void *)v690 + 24);
  if (v387)
  {
    if (v388)
    {
      v389 = v388;
      v390 = v389;
      if ((_BYTE)v389[4])
      {
        *(void *)(v387 + 16) = v389[2];
        *(unsigned char *)(v387 + 32) |= 1u;
      }
      v391 = *(void **)(v387 + 24);
      v392 = v390[3];
      if (v391)
      {
        if (v392) {
          objc_msgSend(v391, "mergeFrom:");
        }
      }
      else if (v392)
      {
        -[GEOPDGroundViewLabelParameters setLocation:](v387, v390[3]);
      }
    }
  }
  else if (v388)
  {
    -[GEOPDPlaceRequestParameters setGroundViewLabelParameters:]((uint64_t)a1, v388);
  }
  uint64_t v393 = a1[13];
  v394 = (void *)*((void *)v690 + 13);
  if (v393)
  {
    if (v394)
    {
      v395 = v394;
      -[GEOPDBatchSpatialLookupParameters readAll:]((uint64_t)v395, 0);
      long long v705 = 0u;
      long long v706 = 0u;
      long long v703 = 0u;
      long long v704 = 0u;
      id v396 = v395[4];
      uint64_t v397 = [v396 countByEnumeratingWithState:&v703 objects:v711 count:16];
      if (v397)
      {
        uint64_t v398 = v397;
        uint64_t v399 = *(void *)v704;
        do
        {
          for (uint64_t i6 = 0; i6 != v398; ++i6)
          {
            if (*(void *)v704 != v399) {
              objc_enumerationMutation(v396);
            }
            -[GEOPDBatchSpatialLookupParameters addSpatialPlaceLookup:](v393, *(void **)(*((void *)&v703 + 1) + 8 * i6));
          }
          uint64_t v398 = [v396 countByEnumeratingWithState:&v703 objects:v711 count:16];
        }
        while (v398);
      }

      long long v701 = 0u;
      long long v702 = 0u;
      long long v699 = 0u;
      long long v700 = 0u;
      id v401 = v395[3];
      uint64_t v402 = [v401 countByEnumeratingWithState:&v699 objects:&v707 count:16];
      if (v402)
      {
        uint64_t v403 = v402;
        uint64_t v404 = *(void *)v700;
        do
        {
          for (uint64_t i7 = 0; i7 != v403; ++i7)
          {
            if (*(void *)v700 != v404) {
              objc_enumerationMutation(v401);
            }
            -[GEOPDBatchSpatialLookupParameters addSpatialEventLookup:](v393, *(void **)(*((void *)&v699 + 1) + 8 * i7));
          }
          uint64_t v403 = [v401 countByEnumeratingWithState:&v699 objects:&v707 count:16];
        }
        while (v403);
      }
    }
  }
  else if (v394)
  {
    -[GEOPDPlaceRequestParameters setBatchSpatialLookupParameters:]((uint64_t)a1, v394);
  }
  v406 = (void *)*((void *)v690 + 55);
  if (a1[55])
  {
    if (v406)
    {
      v407 = v406;
      uint64_t v408 = v407[3];
      if (v408)
      {
        unint64_t v409 = 0;
        uint64_t v410 = *MEMORY[0x1E4F1C4A8];
        do
        {
          unint64_t v411 = v407[3];
          if (v411 <= v409)
          {
            v412 = (void *)MEMORY[0x1E4F1CA00];
            v413 = objc_msgSend(NSString, "stringWithFormat:", @"idx (%tu) is out of range (%tu)", v409, v411);
            v414 = [v412 exceptionWithName:v410 reason:v413 userInfo:0];
            [v414 raise];
          }
          PBRepeatedUInt64Add();
          ++v409;
        }
        while (v408 != v409);
      }

      a1 = v689;
    }
  }
  else if (v406)
  {
    -[GEOPDPlaceRequestParameters setTransitVehiclePositionParameters:]((uint64_t)a1, v406);
  }
  uint64_t v415 = a1[34];
  v416 = (void *)*((void *)v690 + 34);
  if (v415)
  {
    if (v416)
    {
      v417 = v416;
      -[GEOPDPlaceCollectionLookupParameters readAll:]((uint64_t)v417, 0);
      v418 = *(void **)(v415 + 24);
      v419 = v417[3];
      if (v418)
      {
        if (v419) {
          objc_msgSend(v418, "mergeFrom:");
        }
      }
      else if (v419)
      {
        -[GEOPDPlaceCollectionLookupParameters setCenter:](v415, v417[3]);
      }
      long long v709 = 0u;
      long long v710 = 0u;
      long long v707 = 0u;
      long long v708 = 0u;
      id v420 = v417[4];
      uint64_t v421 = [v420 countByEnumeratingWithState:&v707 objects:v711 count:16];
      if (v421)
      {
        uint64_t v422 = v421;
        uint64_t v423 = *(void *)v708;
        do
        {
          for (uint64_t i8 = 0; i8 != v422; ++i8)
          {
            if (*(void *)v708 != v423) {
              objc_enumerationMutation(v420);
            }
            -[GEOPDPlaceCollectionLookupParameters addCollectionId:](v415, *(void **)(*((void *)&v707 + 1) + 8 * i8));
          }
          uint64_t v422 = [v420 countByEnumeratingWithState:&v707 objects:v711 count:16];
        }
        while (v422);
      }
    }
  }
  else if (v416)
  {
    -[GEOPDPlaceRequestParameters setPlaceCollectionLookupParameter:]((uint64_t)a1, v416);
  }
  v425 = (void *)a1[54];
  uint64_t v426 = *((void *)v690 + 54);
  if (v425)
  {
    if (v426) {
      objc_msgSend(v425, "mergeFrom:");
    }
  }
  else if (v426)
  {
    -[GEOPDPlaceRequestParameters setTransitScheduleLookupParameter:]((uint64_t)a1, *((void **)v690 + 54));
  }
  uint64_t v427 = a1[9];
  v428 = (id *)*((void *)v690 + 9);
  if (v427)
  {
    if (v428)
    {
      long long v707 = 0u;
      long long v708 = 0u;
      long long v709 = 0u;
      long long v710 = 0u;
      id v429 = v428[2];
      uint64_t v430 = [v429 countByEnumeratingWithState:&v707 objects:v711 count:16];
      if (v430)
      {
        uint64_t v431 = v430;
        uint64_t v432 = *(void *)v708;
        do
        {
          for (uint64_t i9 = 0; i9 != v431; ++i9)
          {
            if (*(void *)v708 != v432) {
              objc_enumerationMutation(v429);
            }
            -[GEOPDBatchCategoryLookupParameters addCategoryLookupParameter:](v427, *(void **)(*((void *)&v707 + 1) + 8 * i9));
          }
          uint64_t v431 = [v429 countByEnumeratingWithState:&v707 objects:v711 count:16];
        }
        while (v431);
      }
    }
  }
  else if (v428)
  {
    -[GEOPDPlaceRequestParameters setBatchCategoryLookupParameters:]((uint64_t)a1, v428);
  }
  uint64_t v434 = a1[10];
  v435 = (id *)*((void *)v690 + 10);
  if (v434)
  {
    if (v435)
    {
      long long v707 = 0u;
      long long v708 = 0u;
      long long v709 = 0u;
      long long v710 = 0u;
      id v436 = v435[2];
      uint64_t v437 = [v436 countByEnumeratingWithState:&v707 objects:v711 count:16];
      if (v437)
      {
        uint64_t v438 = v437;
        uint64_t v439 = *(void *)v708;
        do
        {
          for (uint64_t i10 = 0; i10 != v438; ++i10)
          {
            if (*(void *)v708 != v439) {
              objc_enumerationMutation(v436);
            }
            -[GEOPDBatchMerchantLookupBrandParameters addMerchantLookupBrandParameter:](v434, *(void **)(*((void *)&v707 + 1) + 8 * i10));
          }
          uint64_t v438 = [v436 countByEnumeratingWithState:&v707 objects:v711 count:16];
        }
        while (v438);
      }
    }
  }
  else if (v435)
  {
    -[GEOPDPlaceRequestParameters setBatchMerchantLookupBrandParameters:]((uint64_t)a1, v435);
  }
  uint64_t v441 = a1[18];
  v442 = (void *)*((void *)v690 + 18);
  if (v441)
  {
    if (v442)
    {
      v443 = v442;
      v444 = (void *)v443[2];
      if (v444) {
        -[GEOPDChildPlaceLookupByCategoryParameters setCategoryMetadata:](v441, v444);
      }
      if (v443[4])
      {
        *(void *)(v441 + 24) = v443[3];
        *(unsigned char *)(v441 + 32) |= 1u;
      }
    }
  }
  else if (v442)
  {
    -[GEOPDPlaceRequestParameters setChildPlaceLookupByCategoryParameters:]((uint64_t)a1, v442);
  }
  uint64_t v445 = a1[19];
  v446 = (void *)*((void *)v690 + 19);
  if (v445)
  {
    if (v446) {
      -[GEOPDCollectionSuggestionParameters mergeFrom:](v445, v446);
    }
  }
  else if (v446)
  {
    -[GEOPDPlaceRequestParameters setCollectionSuggestionParameters:]((uint64_t)a1, v446);
  }
  v447 = (void *)a1[30];
  v448 = (void *)*((void *)v690 + 30);
  if (v447)
  {
    if (v448)
    {
      v449 = v448;
      -[GEOPDMapsSearchHomeParameters readAll:]((uint64_t)v449, 0);
      -[GEOPDMapsSearchHomeParameters _readSupportedSectionTypes]((uint64_t)v449);
      uint64_t v450 = v449[4];
      if (v450)
      {
        unint64_t v451 = 0;
        uint64_t v452 = *MEMORY[0x1E4F1C4A8];
        do
        {
          -[GEOPDMapsSearchHomeParameters _readSupportedSectionTypes]((uint64_t)v449);
          unint64_t v453 = v449[4];
          if (v453 <= v451)
          {
            v454 = (void *)MEMORY[0x1E4F1CA00];
            v455 = objc_msgSend(NSString, "stringWithFormat:", @"idx (%tu) is out of range (%tu)", v451, v453);
            v456 = [v454 exceptionWithName:v452 reason:v455 userInfo:0];
            [v456 raise];
          }
          -[GEOPDMapsSearchHomeParameters addSupportedSectionType:]((uint64_t)v447);
          ++v451;
        }
        while (v450 != v451);
      }
      uint64_t v457 = v447[10];
      v458 = (void *)v449[10];
      if (v457)
      {
        if (v458) {
          -[GEOPDSearchBrowseCategorySuggestionParameters mergeFrom:](v457, v458);
        }
      }
      else if (v458)
      {
        -[GEOPDMapsSearchHomeParameters setSearchBrowseCategorySuggestionParameters:]((uint64_t)v447, v458);
      }
      uint64_t v459 = v447[6];
      v460 = (void *)v449[6];
      if (v459)
      {
        a1 = v689;
        if (v460) {
          -[GEOPDCollectionSuggestionParameters mergeFrom:](v459, v460);
        }
      }
      else
      {
        a1 = v689;
        if (v460) {
          -[GEOPDMapsSearchHomeParameters setCollectionSuggestionParameters:]((uint64_t)v447, v460);
        }
      }
      uint64_t v461 = v447[9];
      v462 = (void *)v449[9];
      if (v461)
      {
        if (v462) {
          -[GEOPDPublisherSuggestionParameters mergeFrom:](v461, v462);
        }
      }
      else if (v462)
      {
        -[GEOPDMapsSearchHomeParameters setPublisherSuggestionParameters:]((uint64_t)v447, v462);
      }
      uint64_t v463 = v447[8];
      v464 = (void *)v449[8];
      if (v463)
      {
        if (v464)
        {
          v465 = v464;
          -[GEOPDPlaceSuggestionParameters readAll:]((uint64_t)v465, 0);
          v466 = *(void **)(v463 + 40);
          id v467 = v465[5];
          if (v466)
          {
            if (v467) {
              objc_msgSend(v466, "mergeFrom:");
            }
          }
          else if (v467)
          {
            -[GEOPDPlaceSuggestionParameters setViewportInfo:](v463, v465[5]);
          }
          long long v705 = 0u;
          long long v706 = 0u;
          long long v703 = 0u;
          long long v704 = 0u;
          id v468 = v465[3];
          uint64_t v469 = [v468 countByEnumeratingWithState:&v703 objects:v711 count:16];
          if (v469)
          {
            uint64_t v470 = v469;
            uint64_t v471 = *(void *)v704;
            do
            {
              for (uint64_t i11 = 0; i11 != v470; ++i11)
              {
                if (*(void *)v704 != v471) {
                  objc_enumerationMutation(v468);
                }
                -[GEOPDPlaceSuggestionParameters addMapsCategoryId:](v463, *(void **)(*((void *)&v703 + 1) + 8 * i11));
              }
              uint64_t v470 = [v468 countByEnumeratingWithState:&v703 objects:v711 count:16];
            }
            while (v470);
          }

          long long v701 = 0u;
          long long v702 = 0u;
          long long v699 = 0u;
          long long v700 = 0u;
          id v473 = v465[4];
          uint64_t v474 = [v473 countByEnumeratingWithState:&v699 objects:&v707 count:16];
          if (v474)
          {
            uint64_t v475 = v474;
            uint64_t v476 = *(void *)v700;
            do
            {
              for (uint64_t i12 = 0; i12 != v475; ++i12)
              {
                if (*(void *)v700 != v476) {
                  objc_enumerationMutation(v473);
                }
                -[GEOPDPlaceSuggestionParameters addSuggestedPlaceId:](v463, *(void **)(*((void *)&v699 + 1) + 8 * i12));
              }
              uint64_t v475 = [v473 countByEnumeratingWithState:&v699 objects:&v707 count:16];
            }
            while (v475);
          }
        }
      }
      else if (v464)
      {
        -[GEOPDMapsSearchHomeParameters setPlaceSuggestionParameters:]((uint64_t)v447, v464);
      }
      uint64_t v478 = v447[7];
      v479 = (void *)v449[7];
      if (v478)
      {
        if (v479)
        {
          v480 = v479;
          v481 = *(void **)(v478 + 16);
          v482 = v480[2];
          if (v481)
          {
            if (v482) {
              objc_msgSend(v481, "mergeFrom:");
            }
          }
          else if (v482)
          {
            -[GEOPDGuidesLocationsSuggestionParameters setViewportInfo:](v478, v480[2]);
          }
        }
      }
      else if (v479)
      {
        -[GEOPDMapsSearchHomeParameters setGuidesLocationsSuggestionParameters:]((uint64_t)v447, v479);
      }
      uint64_t v483 = v447[11];
      v484 = (void *)v449[11];
      if (v483)
      {
        if (v484) {
          -[GEOPDSearchOriginationInfo mergeFrom:](v483, v484);
        }
      }
      else if (v484)
      {
        -[GEOPDMapsSearchHomeParameters setSearchOriginationInfo:]((uint64_t)v447, v484);
      }
    }
  }
  else if (v448)
  {
    -[GEOPDPlaceRequestParameters setMapsSearchHomeParameters:]((uint64_t)a1, v448);
  }
  uint64_t v485 = a1[36];
  v486 = (void *)*((void *)v690 + 36);
  if (v485)
  {
    if (v486) {
      -[GEOPDPlaceQuestionnaireLookupParameters mergeFrom:](v485, (uint64_t)v486);
    }
  }
  else if (v486)
  {
    -[GEOPDPlaceRequestParameters setPlaceQuestionnaireLookupParameters:]((uint64_t)a1, v486);
  }
  uint64_t v487 = a1[41];
  v488 = (void *)*((void *)v690 + 41);
  if (v487)
  {
    if (v488)
    {
      id v489 = v488;
      -[GEOPDPublisherViewParameters readAll:]((uint64_t)v489, 0);
      v490 = *(void **)(v487 + 24);
      uint64_t v491 = *((void *)v489 + 3);
      if (v490)
      {
        if (v491) {
          objc_msgSend(v490, "mergeFrom:");
        }
      }
      else if (v491)
      {
        -[GEOPDPublisherViewParameters setPublisherId:](v487, *((void **)v489 + 3));
      }
      if (*((unsigned char *)v489 + 64))
      {
        *(_DWORD *)(v487 + 60) = *((_DWORD *)v489 + 15);
        *(unsigned char *)(v487 + 64) |= 1u;
      }
      uint64_t v492 = *(void *)(v487 + 32);
      v493 = (void *)*((void *)v489 + 4);
      if (v492)
      {
        if (v493)
        {
          v494 = v493;
          -[GEOPDPublisherViewResultFilter readAll:]((uint64_t)v494, 0);
          if (v494[14])
          {
            *(_DWORD *)(v492 + 52) = v494[13];
            *(unsigned char *)(v492 + 56) |= 1u;
          }
          uint64_t v495 = *(void *)(v492 + 24);
          v496 = (void *)*((void *)v494 + 3);
          if (v495)
          {
            if (v496)
            {
              v497 = v496;
              v498 = *(void **)(v495 + 16);
              v499 = v497[2];
              if (v498)
              {
                if (v499) {
                  objc_msgSend(v498, "mergeFrom:");
                }
              }
              else if (v499)
              {
                -[GEOPDPublisherViewResultFilterAddress setGeoId:](v495, v497[2]);
              }
            }
          }
          else if (v496)
          {
            -[GEOPDPublisherViewResultFilter setFilterAddress:](v492, v496);
          }
          uint64_t v500 = *(void *)(v492 + 32);
          v501 = (void *)*((void *)v494 + 4);
          if (v500)
          {
            if (v501)
            {
              v502 = v501;
              uint64_t v503 = *(void *)(v500 + 16);
              v504 = (void *)v502[2];
              if (v503)
              {
                if (v504) {
                  -[GEOPDRelatedSearchSuggestion mergeFrom:](v503, v504);
                }
              }
              else if (v504)
              {
                -[GEOPDPublisherViewResultFilterKeyword setRelatedSearchSuggestion:](v500, v504);
              }
            }
          }
          else if (v501)
          {
            -[GEOPDPublisherViewResultFilter setFilterKeyword:](v492, v501);
          }
        }
      }
      else if (v493)
      {
        -[GEOPDPublisherViewParameters setResultFilter:](v487, v493);
      }
      v505 = *(void **)(v487 + 40);
      uint64_t v506 = *((void *)v489 + 5);
      if (v505)
      {
        if (v506) {
          objc_msgSend(v505, "mergeFrom:");
        }
      }
      else if (v506)
      {
        -[GEOPDPublisherViewParameters setViewportInfo:](v487, *((void **)v489 + 5));
      }
    }
  }
  else if (v488)
  {
    -[GEOPDPlaceRequestParameters setPublisherViewParameters:]((uint64_t)a1, v488);
  }
  uint64_t v507 = a1[6];
  v508 = (void *)*((void *)v690 + 6);
  if (v507)
  {
    if (v508)
    {
      id v509 = v508;
      -[GEOPDAllCollectionsViewParameters readAll:]((uint64_t)v509, 0);
      uint64_t v510 = *(void *)(v507 + 24);
      v511 = (void *)*((void *)v509 + 3);
      if (v510)
      {
        if (v511) {
          -[GEOPDPublisherSuggestionParameters mergeFrom:](v510, v511);
        }
      }
      else if (v511)
      {
        -[GEOPDAllCollectionsViewParameters setPublisherSuggestionParameters:](v507, v511);
      }
      if (*((unsigned char *)v509 + 64))
      {
        *(_DWORD *)(v507 + 60) = *((_DWORD *)v509 + 15);
        *(unsigned char *)(v507 + 64) |= 1u;
      }
      uint64_t v512 = *(void *)(v507 + 32);
      v513 = (void *)*((void *)v509 + 4);
      if (v512)
      {
        if (v513)
        {
          v514 = v513;
          -[GEOPDAllCollectionsViewResultFilter readAll:]((uint64_t)v514, 0);
          if (v514[14])
          {
            *(_DWORD *)(v512 + 52) = v514[13];
            *(unsigned char *)(v512 + 56) |= 1u;
          }
          uint64_t v515 = *(void *)(v512 + 24);
          v516 = (void *)*((void *)v514 + 3);
          if (v515)
          {
            if (v516)
            {
              v517 = v516;
              v518 = *(void **)(v515 + 16);
              v519 = v517[2];
              if (v518)
              {
                if (v519) {
                  objc_msgSend(v518, "mergeFrom:");
                }
              }
              else if (v519)
              {
                -[GEOPDAllCollectionsViewResultFilterTypeAddress setGeoId:](v515, v517[2]);
              }
            }
          }
          else if (v516)
          {
            -[GEOPDAllCollectionsViewResultFilter setFilterAddress:](v512, v516);
          }
          uint64_t v520 = *(void *)(v512 + 32);
          v521 = (void *)*((void *)v514 + 4);
          if (v520)
          {
            if (v521)
            {
              v522 = v521;
              uint64_t v523 = *(void *)(v520 + 16);
              v524 = (void *)v522[2];
              if (v523)
              {
                if (v524) {
                  -[GEOPDRelatedSearchSuggestion mergeFrom:](v523, v524);
                }
              }
              else if (v524)
              {
                -[GEOPDAllCollectionsViewResultFilterTypeKeyword setRelatedSearchSuggestion:](v520, v524);
              }
            }
          }
          else if (v521)
          {
            -[GEOPDAllCollectionsViewResultFilter setFilterKeyword:](v512, v521);
          }
        }
      }
      else if (v513)
      {
        -[GEOPDAllCollectionsViewParameters setResultFilter:](v507, v513);
      }
      v525 = *(void **)(v507 + 40);
      uint64_t v526 = *((void *)v509 + 5);
      if (v525)
      {
        if (v526) {
          objc_msgSend(v525, "mergeFrom:");
        }
      }
      else if (v526)
      {
        -[GEOPDAllCollectionsViewParameters setViewportInfo:](v507, *((void **)v509 + 5));
      }
    }
  }
  else if (v508)
  {
    -[GEOPDPlaceRequestParameters setAllCollectionsViewParameters:]((uint64_t)a1, v508);
  }
  uint64_t v527 = a1[5];
  v528 = (void *)*((void *)v690 + 5);
  if (v527)
  {
    if (v528)
    {
      v529 = v528;
      -[GEOPDAirportEntityPlaceLookupParameters readAll:]((uint64_t)v529, 0);
      v530 = (void *)v529[3];
      if (v530) {
        -[GEOPDAirportEntityPlaceLookupParameters setAirportCode:](v527, v530);
      }
      v531 = (void *)v529[5];
      if (v531) {
        -[GEOPDAirportEntityPlaceLookupParameters setTerminalCode:](v527, v531);
      }
      v532 = (void *)v529[4];
      if (v532) {
        -[GEOPDAirportEntityPlaceLookupParameters setGateCode:](v527, v532);
      }
    }
  }
  else if (v528)
  {
    -[GEOPDPlaceRequestParameters setAirportEntityPlaceLookupParameters:]((uint64_t)a1, v528);
  }
  uint64_t v533 = a1[51];
  v534 = (id *)*((void *)v690 + 51);
  if (v533)
  {
    if (v534)
    {
      long long v707 = 0u;
      long long v708 = 0u;
      long long v709 = 0u;
      long long v710 = 0u;
      id v535 = v534[2];
      uint64_t v536 = [v535 countByEnumeratingWithState:&v707 objects:v711 count:16];
      if (v536)
      {
        uint64_t v537 = v536;
        uint64_t v538 = *(void *)v708;
        do
        {
          for (uint64_t i13 = 0; i13 != v537; ++i13)
          {
            if (*(void *)v708 != v538) {
              objc_enumerationMutation(v535);
            }
            -[GEOPDTerritoryLookupParameters addLocation:](v533, *(void **)(*((void *)&v707 + 1) + 8 * i13));
          }
          uint64_t v537 = [v535 countByEnumeratingWithState:&v707 objects:v711 count:16];
        }
        while (v537);
      }
    }
  }
  else if (v534)
  {
    -[GEOPDPlaceRequestParameters setTerritoryLookupParameters:]((uint64_t)a1, v534);
  }
  uint64_t v540 = a1[53];
  v541 = (void *)*((void *)v690 + 53);
  if (v540)
  {
    if (v541)
    {
      v542 = v541;
      -[GEOPDTransitNearbyScheduleLookupParameters readAll:]((uint64_t)v542, 0);
      long long v709 = 0u;
      long long v710 = 0u;
      long long v707 = 0u;
      long long v708 = 0u;
      id v543 = v542[3];
      uint64_t v544 = [v543 countByEnumeratingWithState:&v707 objects:v711 count:16];
      if (v544)
      {
        uint64_t v545 = v544;
        uint64_t v546 = *(void *)v708;
        do
        {
          for (uint64_t i14 = 0; i14 != v545; ++i14)
          {
            if (*(void *)v708 != v546) {
              objc_enumerationMutation(v543);
            }
            -[GEOPDTransitNearbyScheduleLookupParameters addTransitNearbyScheduleLookupOrigin:](v540, *(void **)(*((void *)&v707 + 1) + 8 * i14));
          }
          uint64_t v545 = [v543 countByEnumeratingWithState:&v707 objects:v711 count:16];
        }
        while (v545);
      }

      v548 = *(void **)(v540 + 32);
      id v549 = v542[4];
      if (v548)
      {
        if (v549) {
          objc_msgSend(v548, "mergeFrom:");
        }
      }
      else if (v549)
      {
        -[GEOPDTransitNearbyScheduleLookupParameters setUserLocation:](v540, v542[4]);
      }
    }
  }
  else if (v541)
  {
    -[GEOPDPlaceRequestParameters setTransitNearbyScheduleLookupParameters:]((uint64_t)a1, v541);
  }
  uint64_t v550 = a1[28];
  v551 = (void *)*((void *)v690 + 28);
  if (v550)
  {
    if (v551)
    {
      v552 = v551;
      uint64_t v553 = *(void *)(v550 + 16);
      v554 = (void *)v552[2];
      if (v553)
      {
        if (v554) {
          -[GEOPDCollectionSuggestionParameters mergeFrom:](v553, v554);
        }
      }
      else if (v554)
      {
        -[GEOPDMapsHomeParameters setCollectionSuggestionParameters:](v550, v554);
      }
      if (*((unsigned char *)v552 + 28))
      {
        *(unsigned char *)(v550 + 24) = *((unsigned char *)v552 + 24);
        *(unsigned char *)(v550 + 28) |= 1u;
      }
    }
  }
  else if (v551)
  {
    -[GEOPDPlaceRequestParameters setMapsHomeParameters:]((uint64_t)a1, v551);
  }
  uint64_t v555 = a1[7];
  v556 = (void *)*((void *)v690 + 7);
  if (v555)
  {
    if (v556)
    {
      id v557 = v556;
      v558 = *(void **)(v555 + 16);
      uint64_t v559 = *((void *)v557 + 2);
      if (v558)
      {
        if (v559) {
          objc_msgSend(v558, "mergeFrom:");
        }
      }
      else if (v559)
      {
        -[GEOPDAllGuidesLocationsViewParameters setViewportInfo:](v555, *((void **)v557 + 2));
      }
      if (*((unsigned char *)v557 + 28))
      {
        *(_DWORD *)(v555 + 24) = *((_DWORD *)v557 + 6);
        *(unsigned char *)(v555 + 28) |= 1u;
      }
    }
  }
  else if (v556)
  {
    -[GEOPDPlaceRequestParameters setAllGuidesLocationsViewParameters:]((uint64_t)a1, v556);
  }
  v560 = (void *)a1[25];
  v561 = (void *)*((void *)v690 + 25);
  if (v560)
  {
    if (v561)
    {
      id v562 = v561;
      -[GEOPDGuidesHomeParameters readAll:]((uint64_t)v562, 0);
      -[GEOPDGuidesHomeParameters _readSupportedFixedSectionTypes]((uint64_t)v562);
      uint64_t v563 = *((void *)v562 + 4);
      if (v563)
      {
        unint64_t v564 = 0;
        uint64_t v565 = *MEMORY[0x1E4F1C4A8];
        do
        {
          -[GEOPDGuidesHomeParameters _readSupportedFixedSectionTypes]((uint64_t)v562);
          unint64_t v566 = *((void *)v562 + 4);
          if (v566 <= v564)
          {
            v567 = (void *)MEMORY[0x1E4F1CA00];
            v568 = objc_msgSend(NSString, "stringWithFormat:", @"idx (%tu) is out of range (%tu)", v564, v566);
            v569 = [v567 exceptionWithName:v565 reason:v568 userInfo:0];
            [v569 raise];
          }
          -[GEOPDGuidesHomeParameters addSupportedFixedSectionType:]((uint64_t)v560);
          ++v564;
        }
        while (v563 != v564);
      }
      -[GEOPDGuidesHomeParameters _readSupportedRepeatableSectionTypes]((uint64_t)v562);
      uint64_t v570 = *((void *)v562 + 7);
      if (v570)
      {
        unint64_t v571 = 0;
        uint64_t v572 = *MEMORY[0x1E4F1C4A8];
        do
        {
          -[GEOPDGuidesHomeParameters _readSupportedRepeatableSectionTypes]((uint64_t)v562);
          unint64_t v573 = *((void *)v562 + 7);
          if (v573 <= v571)
          {
            v574 = (void *)MEMORY[0x1E4F1CA00];
            v575 = objc_msgSend(NSString, "stringWithFormat:", @"idx (%tu) is out of range (%tu)", v571, v573);
            v576 = [v574 exceptionWithName:v572 reason:v575 userInfo:0];
            [v576 raise];
          }
          -[GEOPDGuidesHomeParameters addSupportedRepeatableSectionType:]((uint64_t)v560);
          ++v571;
        }
        while (v570 != v571);
      }
      v577 = (void *)v560[12];
      uint64_t v578 = *((void *)v562 + 12);
      if (v577)
      {
        if (v578) {
          objc_msgSend(v577, "mergeFrom:");
        }
      }
      else if (v578)
      {
        -[GEOPDGuidesHomeParameters setViewportInfo:]((uint64_t)v560, *((void **)v562 + 12));
      }
      uint64_t v579 = v560[9];
      v580 = (void *)*((void *)v562 + 9);
      a1 = v689;
      if (v579)
      {
        if (v580) {
          -[GEOPDGuidesLocationEntry mergeFrom:](v579, v580);
        }
      }
      else if (v580)
      {
        -[GEOPDGuidesHomeParameters setGuidesLocationEntry:]((uint64_t)v560, v580);
      }
      uint64_t v581 = v560[11];
      v582 = (void *)*((void *)v562 + 11);
      if (v581)
      {
        if (v582)
        {
          id v583 = v582;
          -[GEOPDGuidesHomeResultFilter readAll:]((uint64_t)v583, 0);
          if (*((unsigned char *)v583 + 56))
          {
            *(_DWORD *)(v581 + 52) = *((_DWORD *)v583 + 13);
            *(unsigned char *)(v581 + 56) |= 1u;
          }
          uint64_t v584 = *(void *)(v581 + 24);
          v585 = (void *)*((void *)v583 + 3);
          if (v584)
          {
            if (v585)
            {
              v586 = v585;
              uint64_t v587 = *(void *)(v584 + 16);
              v588 = (void *)v586[2];
              if (v587)
              {
                if (v588) {
                  -[GEOPDRelatedSearchSuggestion mergeFrom:](v587, v588);
                }
              }
              else if (v588)
              {
                -[GEOPDGuidesHomeResultFilterTypeConcept setRelatedSearchSuggestion:](v584, v588);
              }
            }
          }
          else if (v585)
          {
            -[GEOPDGuidesHomeResultFilter setFilterConcept:](v581, v585);
          }
          long long v709 = 0u;
          long long v710 = 0u;
          long long v707 = 0u;
          long long v708 = 0u;
          id v589 = *((id *)v583 + 4);
          uint64_t v590 = [v589 countByEnumeratingWithState:&v707 objects:v711 count:16];
          if (v590)
          {
            uint64_t v591 = v590;
            uint64_t v592 = *(void *)v708;
            do
            {
              for (uint64_t i15 = 0; i15 != v591; ++i15)
              {
                if (*(void *)v708 != v592) {
                  objc_enumerationMutation(v589);
                }
                -[GEOPDGuidesHomeResultFilter addSubFilter:](v581, *(void **)(*((void *)&v707 + 1) + 8 * i15));
              }
              uint64_t v591 = [v589 countByEnumeratingWithState:&v707 objects:v711 count:16];
            }
            while (v591);
          }
        }
      }
      else if (v582)
      {
        -[GEOPDGuidesHomeParameters setResultFilter:]((uint64_t)v560, v582);
      }
      uint64_t v594 = v560[10];
      v595 = (void *)*((void *)v562 + 10);
      if (v594)
      {
        if (v595) {
          -[GEOPDResultRefinementGuidesHome mergeFrom:](v594, v595);
        }
      }
      else if (v595)
      {
        -[GEOPDGuidesHomeParameters setRefinementGuidesHome:]((uint64_t)v560, v595);
      }
    }
  }
  else if (v561)
  {
    -[GEOPDPlaceRequestParameters setGuidesHomeParameters:]((uint64_t)a1, v561);
  }
  uint64_t v596 = a1[20];
  v597 = (void *)*((void *)v690 + 20);
  if (v596)
  {
    if (v597)
    {
      id v598 = v597;
      -[GEOPDExtendedGeoLookupParameters readAll:]((uint64_t)v598, 0);
      v599 = *(void **)(v596 + 64);
      uint64_t v600 = *((void *)v598 + 8);
      if (v599)
      {
        if (v600) {
          objc_msgSend(v599, "mergeFrom:");
        }
      }
      else if (v600)
      {
        -[GEOPDExtendedGeoLookupParameters setPreserveFields:](v596, *((void **)v598 + 8));
      }
      if (*((_WORD *)v598 + 56))
      {
        *(void *)(v596 + 72) = *((void *)v598 + 9);
        *(_WORD *)(v596 + 112) |= 1u;
      }
      v601 = *(void **)(v596 + 80);
      uint64_t v602 = *((void *)v598 + 10);
      if (v601)
      {
        if (v602) {
          objc_msgSend(v601, "mergeFrom:");
        }
      }
      else if (v602)
      {
        -[GEOPDExtendedGeoLookupParameters setPrimaryFeatureLocation:](v596, *((void **)v598 + 10));
      }
      -[GEOPDExtendedGeoLookupParameters _readIntersectingFeatureGeoIds]((uint64_t)v598);
      uint64_t v603 = *((void *)v598 + 4);
      if (v603)
      {
        unint64_t v604 = 0;
        uint64_t v605 = *MEMORY[0x1E4F1C4A8];
        do
        {
          -[GEOPDExtendedGeoLookupParameters _readIntersectingFeatureGeoIds]((uint64_t)v598);
          unint64_t v606 = *((void *)v598 + 4);
          if (v606 <= v604)
          {
            v607 = (void *)MEMORY[0x1E4F1CA00];
            v608 = objc_msgSend(NSString, "stringWithFormat:", @"idx (%tu) is out of range (%tu)", v604, v606);
            v609 = [v607 exceptionWithName:v605 reason:v608 userInfo:0];
            [v609 raise];
          }
          -[GEOPDExtendedGeoLookupParameters addIntersectingFeatureGeoId:](v596);
          ++v604;
        }
        while (v603 != v604);
      }
      __int16 v610 = *((_WORD *)v598 + 56);
      if ((v610 & 8) != 0)
      {
        *(unsigned char *)(v596 + 109) = *((unsigned char *)v598 + 109);
        *(_WORD *)(v596 + 112) |= 8u;
        __int16 v610 = *((_WORD *)v598 + 56);
      }
      a1 = v689;
      if ((v610 & 2) != 0)
      {
        *(void *)(v596 + 88) = *((void *)v598 + 11);
        *(_WORD *)(v596 + 112) |= 2u;
      }
      v611 = (void *)*((void *)v598 + 6);
      if (v611) {
        -[GEOPDExtendedGeoLookupParameters setDataSourceId:](v596, v611);
      }
      if ((*((_WORD *)v598 + 56) & 4) != 0)
      {
        *(unsigned char *)(v596 + 108) = *((unsigned char *)v598 + 108);
        *(_WORD *)(v596 + 112) |= 4u;
      }
      v612 = *(void **)(v596 + 56);
      uint64_t v613 = *((void *)v598 + 7);
      if (v612)
      {
        if (v613) {
          objc_msgSend(v612, "mergeFrom:");
        }
      }
      else if (v613)
      {
        -[GEOPDExtendedGeoLookupParameters setInterpolationParameter:](v596, *((void **)v598 + 7));
      }
    }
  }
  else if (v597)
  {
    -[GEOPDPlaceRequestParameters setExtendedGeoLookupParameters:]((uint64_t)a1, v597);
  }
  uint64_t v614 = a1[42];
  v615 = (void *)*((void *)v690 + 42);
  if (v614)
  {
    if (v615)
    {
      id v616 = v615;
      -[GEOPDQueryUnderstandingParameters readAll:]((uint64_t)v616, 0);
      if (*((unsigned char *)v616 + 76))
      {
        *(_DWORD *)(v614 + 68) = *((_DWORD *)v616 + 17);
        *(unsigned char *)(v614 + 76) |= 1u;
      }
      v617 = (void *)*((void *)v616 + 3);
      if (v617) {
        -[GEOPDQueryUnderstandingParameters setSearchString:](v614, v617);
      }
      v618 = *(void **)(v614 + 48);
      uint64_t v619 = *((void *)v616 + 6);
      if (v618)
      {
        if (v619) {
          objc_msgSend(v618, "mergeFrom:");
        }
      }
      else if (v619)
      {
        -[GEOPDQueryUnderstandingParameters setViewportInfo:](v614, *((void **)v616 + 6));
      }
      if ((*((unsigned char *)v616 + 76) & 2) != 0)
      {
        *(_DWORD *)(v614 + 72) = *((_DWORD *)v616 + 18);
        *(unsigned char *)(v614 + 76) |= 2u;
      }
      uint64_t v620 = *(void *)(v614 + 40);
      v621 = (void *)*((void *)v616 + 5);
      if (v620)
      {
        if (v621)
        {
          id v622 = v621;
          -[GEOPDQueryUnderstandingTaxonomySearchParameters readAll:]((uint64_t)v622, 0);
          if (*((unsigned char *)v622 + 56))
          {
            *(_DWORD *)(v620 + 52) = *((_DWORD *)v622 + 13);
            *(unsigned char *)(v620 + 56) |= 1u;
          }
          v623 = (void *)*((void *)v622 + 4);
          if (v623) {
            -[GEOPDQueryUnderstandingTaxonomySearchParameters setSearchString:](v620, v623);
          }
          long long v709 = 0u;
          long long v710 = 0u;
          long long v707 = 0u;
          long long v708 = 0u;
          id v624 = *((id *)v622 + 3);
          uint64_t v625 = [v624 countByEnumeratingWithState:&v707 objects:v711 count:16];
          if (v625)
          {
            uint64_t v626 = v625;
            uint64_t v627 = *(void *)v708;
            do
            {
              for (uint64_t i16 = 0; i16 != v626; ++i16)
              {
                if (*(void *)v708 != v627) {
                  objc_enumerationMutation(v624);
                }
                -[GEOPDQueryUnderstandingTaxonomySearchParameters addCategoryBranch:](v620, *(void **)(*((void *)&v707 + 1) + 8 * i16));
              }
              uint64_t v626 = [v624 countByEnumeratingWithState:&v707 objects:v711 count:16];
            }
            while (v626);
          }
        }
      }
      else if (v621)
      {
        -[GEOPDQueryUnderstandingParameters setTaxonomySearchParameters:](v614, v621);
      }
      uint64_t v629 = *(void *)(v614 + 32);
      v630 = (void *)*((void *)v616 + 4);
      if (v629)
      {
        if (v630)
        {
          v631 = v630;
          -[GEOPDQueryUnderstandingTaxonomyLookupParameters readAll:]((uint64_t)v631, 0);
          long long v705 = 0u;
          long long v706 = 0u;
          long long v703 = 0u;
          long long v704 = 0u;
          id v632 = v631[4];
          uint64_t v633 = [v632 countByEnumeratingWithState:&v703 objects:v711 count:16];
          if (v633)
          {
            uint64_t v634 = v633;
            uint64_t v635 = *(void *)v704;
            do
            {
              for (uint64_t i17 = 0; i17 != v634; ++i17)
              {
                if (*(void *)v704 != v635) {
                  objc_enumerationMutation(v632);
                }
                -[GEOPDQueryUnderstandingTaxonomyLookupParameters addIdentifier:](v629, *(void **)(*((void *)&v703 + 1) + 8 * i17));
              }
              uint64_t v634 = [v632 countByEnumeratingWithState:&v703 objects:v711 count:16];
            }
            while (v634);
          }

          long long v701 = 0u;
          long long v702 = 0u;
          long long v699 = 0u;
          long long v700 = 0u;
          id v637 = v631[3];
          uint64_t v638 = [v637 countByEnumeratingWithState:&v699 objects:&v707 count:16];
          if (v638)
          {
            uint64_t v639 = v638;
            uint64_t v640 = *(void *)v700;
            do
            {
              for (uint64_t i18 = 0; i18 != v639; ++i18)
              {
                if (*(void *)v700 != v640) {
                  objc_enumerationMutation(v637);
                }
                -[GEOPDQueryUnderstandingTaxonomyLookupParameters addCategoryBranch:](v629, *(void **)(*((void *)&v699 + 1) + 8 * i18));
              }
              uint64_t v639 = [v637 countByEnumeratingWithState:&v699 objects:&v707 count:16];
            }
            while (v639);
          }
        }
      }
      else if (v630)
      {
        -[GEOPDQueryUnderstandingParameters setTaxonomyLookupParameters:](v614, v630);
      }
    }
  }
  else if (v615)
  {
    -[GEOPDPlaceRequestParameters setQueryUnderstandingParameters:]((uint64_t)a1, v615);
  }
  uint64_t v642 = a1[39];
  v643 = (id *)*((void *)v690 + 39);
  if (v642)
  {
    if (v643)
    {
      long long v707 = 0u;
      long long v708 = 0u;
      long long v709 = 0u;
      long long v710 = 0u;
      id v644 = v643[2];
      uint64_t v645 = [v644 countByEnumeratingWithState:&v707 objects:v711 count:16];
      if (v645)
      {
        uint64_t v646 = v645;
        uint64_t v647 = *(void *)v708;
        do
        {
          for (uint64_t i19 = 0; i19 != v646; ++i19)
          {
            if (*(void *)v708 != v647) {
              objc_enumerationMutation(v644);
            }
            -[GEOPDPoiAtAddressLookupParameters addComponent:](v642, *(void **)(*((void *)&v707 + 1) + 8 * i19));
          }
          uint64_t v646 = [v644 countByEnumeratingWithState:&v707 objects:v711 count:16];
        }
        while (v646);
      }
    }
  }
  else if (v643)
  {
    -[GEOPDPlaceRequestParameters setPoiAtAddressLookupParameters:]((uint64_t)a1, v643);
  }
  uint64_t v649 = a1[52];
  v650 = (id *)*((void *)v690 + 52);
  if (v649)
  {
    if (v650)
    {
      long long v707 = 0u;
      long long v708 = 0u;
      long long v709 = 0u;
      long long v710 = 0u;
      id v651 = v650[2];
      uint64_t v652 = [v651 countByEnumeratingWithState:&v707 objects:v711 count:16];
      if (v652)
      {
        uint64_t v653 = v652;
        uint64_t v654 = *(void *)v708;
        do
        {
          for (uint64_t i20 = 0; i20 != v653; ++i20)
          {
            if (*(void *)v708 != v654) {
              objc_enumerationMutation(v651);
            }
            -[GEOPDTransitNearbyPaymentMethodLookupParameters addTransitNearbyPaymentMethodLookupOrigin:](v649, *(void **)(*((void *)&v707 + 1) + 8 * i20));
          }
          uint64_t v653 = [v651 countByEnumeratingWithState:&v707 objects:v711 count:16];
        }
        while (v653);
      }
    }
  }
  else if (v650)
  {
    -[GEOPDPlaceRequestParameters setTransitNearbyPaymentMethodLookupParameters:]((uint64_t)a1, v650);
  }
  uint64_t v656 = a1[38];
  v657 = (void *)*((void *)v690 + 38);
  if (v656)
  {
    if (v657)
    {
      id v658 = v657;
      -[GEOPDPlacecardEnrichmentParameters readAll:]((uint64_t)v658, 0);
      v659 = *(void **)(v656 + 32);
      uint64_t v660 = *((void *)v658 + 4);
      if (v659)
      {
        if (v660) {
          objc_msgSend(v659, "mergeFrom:");
        }
      }
      else if (v660)
      {
        -[GEOPDPlacecardEnrichmentParameters setMapsId:](v656, *((void **)v658 + 4));
      }
      long long v709 = 0u;
      long long v710 = 0u;
      long long v707 = 0u;
      long long v708 = 0u;
      id v661 = *((id *)v658 + 3);
      uint64_t v662 = [v661 countByEnumeratingWithState:&v707 objects:v711 count:16];
      if (v662)
      {
        uint64_t v663 = v662;
        uint64_t v664 = *(void *)v708;
        do
        {
          for (uint64_t i21 = 0; i21 != v663; ++i21)
          {
            if (*(void *)v708 != v664) {
              objc_enumerationMutation(v661);
            }
            -[GEOPDPlacecardEnrichmentParameters addEnrichmentInfo:](v656, *(void **)(*((void *)&v707 + 1) + 8 * i21));
          }
          uint64_t v663 = [v661 countByEnumeratingWithState:&v707 objects:v711 count:16];
        }
        while (v663);
      }

      if (*((unsigned char *)v658 + 56))
      {
        *(unsigned char *)(v656 + 52) = *((unsigned char *)v658 + 52);
        *(unsigned char *)(v656 + 56) |= 1u;
      }
    }
  }
  else if (v657)
  {
    -[GEOPDPlaceRequestParameters setPlacecardEnrichmentParameters:]((uint64_t)a1, v657);
  }
  uint64_t v666 = a1[33];
  v667 = (void *)*((void *)v690 + 33);
  if (v666)
  {
    if (v667)
    {
      v668 = v667;
      v669 = *(void **)(v666 + 16);
      v670 = v668[2];
      if (v669)
      {
        if (v670) {
          objc_msgSend(v669, "mergeFrom:");
        }
      }
      else if (v670)
      {
        -[GEOPDOfflineRegionNameParameters setRegion:](v666, v668[2]);
      }
    }
  }
  else if (v667)
  {
    -[GEOPDPlaceRequestParameters setOfflineRegionNameParameters:]((uint64_t)a1, v667);
  }
  uint64_t v671 = a1[45];
  v672 = (void *)*((void *)v690 + 45);
  if (v671)
  {
    if (v672)
    {
      v673 = v672;
      v674 = *(void **)(v671 + 16);
      v675 = v673[2];
      if (v674)
      {
        if (v675) {
          objc_msgSend(v674, "mergeFrom:");
        }
      }
      else if (v675)
      {
        -[GEOPDSearchCapabilitiesParameters setViewportInfo:](v671, v673[2]);
      }
    }
  }
  else if (v672)
  {
    -[GEOPDPlaceRequestParameters setSearchCapabilitiesParameters:]((uint64_t)a1, v672);
  }
  uint64_t v676 = a1[43];
  v677 = (id *)*((void *)v690 + 43);
  if (v676)
  {
    if (v677)
    {
      long long v707 = 0u;
      long long v708 = 0u;
      long long v709 = 0u;
      long long v710 = 0u;
      id v678 = v677[2];
      uint64_t v679 = [v678 countByEnumeratingWithState:&v707 objects:v711 count:16];
      if (v679)
      {
        uint64_t v680 = v679;
        uint64_t v681 = *(void *)v708;
        do
        {
          for (uint64_t i22 = 0; i22 != v680; ++i22)
          {
            if (*(void *)v708 != v681) {
              objc_enumerationMutation(v678);
            }
            -[GEOPDRefreshIdLookUpParameters addMapsId:](v676, *(void **)(*((void *)&v707 + 1) + 8 * i22));
          }
          uint64_t v680 = [v678 countByEnumeratingWithState:&v707 objects:v711 count:16];
        }
        while (v680);
      }
    }
  }
  else if (v677)
  {
    -[GEOPDPlaceRequestParameters setRefreshIdLookUpParameters:]((uint64_t)a1, v677);
  }
  uint64_t v683 = a1[4];
  v684 = (void *)*((void *)v690 + 4);
  if (v683)
  {
    if (v684)
    {
      v685 = v684;
      -[GEOPDAddressRecommendationParameters readAll:]((uint64_t)v685, 0);
      v686 = (void *)v685[4];
      if (v686) {
        -[GEOPDAddressRecommendationParameters setCountryOrRegion:](v683, v686);
      }
      uint64_t v687 = *(void *)(v683 + 24);
      v688 = (void *)v685[3];
      if (v687)
      {
        if (v688) {
          -[GEOPDAddressWithComponents mergeFrom:](v687, v688);
        }
      }
      else if (v688)
      {
        -[GEOPDAddressRecommendationParameters setAddressWithComponents:](v683, v688);
      }
    }
  }
  else if (v684)
  {
    -[GEOPDPlaceRequestParameters setAddressRecommendationParameters:]((uint64_t)a1, v684);
  }
LABEL_1282:
}

- (id)_initWithDictionary:(uint64_t)a3 isJSON:
{
  uint64_t v1450 = *MEMORY[0x1E4F143B8];
  id v1357 = a2;
  if (!a1) {
    goto LABEL_2655;
  }
  a1 = (id)[a1 init];

  v1335 = a1;
  if (!a1) {
    goto LABEL_2655;
  }
  if (a3) {
    id v5 = @"searchParameters";
  }
  else {
    id v5 = @"search_parameters";
  }
  uint64_t v6 = [v1357 objectForKeyedSubscript:v5];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    unint64_t v7 = [GEOPDSearchParameters alloc];
    if (v7) {
      id v8 = -[GEOPDSearchParameters _initWithDictionary:isJSON:](v7, v6, a3);
    }
    else {
      id v8 = 0;
    }
    -[GEOPDPlaceRequestParameters setSearchParameters:]((uint64_t)v1335, v8);
  }
  if (a3) {
    uint64_t v9 = @"geocodingParameters";
  }
  else {
    uint64_t v9 = @"geocoding_parameters";
  }
  unint64_t v10 = [v1357 objectForKeyedSubscript:v9];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    unint64_t v11 = [GEOPDGeocodingParameters alloc];
    if (v11)
    {
      id v12 = v10;
      unint64_t v11 = [(GEOPDGeocodingParameters *)v11 init];
      if (v11)
      {
        if (a3) {
          uint64_t v13 = @"queryString";
        }
        else {
          uint64_t v13 = @"query_string";
        }
        uint64_t v14 = [v12 objectForKeyedSubscript:v13];
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          unint64_t v15 = (void *)[v14 copy];
          -[GEOPDGeocodingParameters setQueryString:]((uint64_t)v11, v15);
        }
        if (a3) {
          uint64_t v16 = @"maxResults";
        }
        else {
          uint64_t v16 = @"max_results";
        }
        unint64_t v17 = [v12 objectForKeyedSubscript:v16];
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          unsigned int v18 = [v17 unsignedIntValue];
          *(_WORD *)&v11->_flags |= 0x100u;
          *(_WORD *)&v11->_flags |= 1u;
          v11->_maxResults = v18;
        }

        if (a3) {
          unint64_t v19 = @"viewportInfo";
        }
        else {
          unint64_t v19 = @"viewport_info";
        }
        uint64_t v20 = [v12 objectForKeyedSubscript:v19];
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          unint64_t v21 = [GEOPDViewportInfo alloc];
          if (a3) {
            uint64_t v22 = [(GEOPDViewportInfo *)v21 initWithJSON:v20];
          }
          else {
            uint64_t v22 = [(GEOPDViewportInfo *)v21 initWithDictionary:v20];
          }
          uint64_t v23 = v22;
          -[GEOPDGeocodingParameters setViewportInfo:]((uint64_t)v11, v22);
        }
        if (a3) {
          unint64_t v24 = @"structuredAddress";
        }
        else {
          unint64_t v24 = @"structured_address";
        }
        uint64_t v25 = [v12 objectForKeyedSubscript:v24];
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          uint64_t v26 = [GEOStructuredAddress alloc];
          if (a3) {
            unint64_t v27 = [(GEOStructuredAddress *)v26 initWithJSON:v25];
          }
          else {
            unint64_t v27 = [(GEOStructuredAddress *)v26 initWithDictionary:v25];
          }
          uint64_t v28 = v27;
          -[GEOPDGeocodingParameters setStructuredAddress:]((uint64_t)v11, v27);
        }
        if (a3) {
          unint64_t v29 = @"punchInHints";
        }
        else {
          unint64_t v29 = @"punch_in_hints";
        }
        uint64_t v30 = [v12 objectForKeyedSubscript:v29];
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          unint64_t v31 = [GEOPDSPunchInHints alloc];
          if (v31) {
            unint64_t v32 = -[GEOPDSPunchInHints _initWithDictionary:isJSON:](v31, v30, a3);
          }
          else {
            unint64_t v32 = 0;
          }
          -[GEOPDGeocodingParameters setPunchInHints:]((uint64_t)v11, v32);
        }
        if (a3) {
          unint64_t v33 = @"isStrictMapRegion";
        }
        else {
          unint64_t v33 = @"is_strict_map_region";
        }
        unint64_t v34 = [v12 objectForKeyedSubscript:v33];
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          char v35 = [v34 BOOLValue];
          *(_WORD *)&v11->_flags |= 0x100u;
          *(_WORD *)&v11->_flags |= 2u;
          v11->_isStrictMapRegiouint64_t n = v35;
        }

        if (a3) {
          unint64_t v36 = @"addressResultSubTypeFilter";
        }
        else {
          unint64_t v36 = @"address_result_sub_type_filter";
        }
        uint64_t v37 = [v12 objectForKeyedSubscript:v36];
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          unint64_t v38 = [GEOPDAddressResultSubTypeFilter alloc];
          if (v38) {
            uint64_t v39 = (void *)-[GEOPDAddressResultSubTypeFilter _initWithDictionary:isJSON:](v38, v37, a3);
          }
          else {
            uint64_t v39 = 0;
          }
          -[GEOPDGeocodingParameters setAddressResultSubTypeFilter:]((uint64_t)v11, v39);
        }
      }
    }
    -[GEOPDPlaceRequestParameters setGeocodingParameters:]((uint64_t)v1335, v11);
  }
  if (a3) {
    unint64_t v40 = @"canonicalLocationSearchParameters";
  }
  else {
    unint64_t v40 = @"canonical_location_search_parameters";
  }
  uint64_t v41 = [v1357 objectForKeyedSubscript:v40];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    unint64_t v42 = [GEOPDCanonicalLocationSearchParameters alloc];
    if (v42)
    {
      id v43 = v41;
      unint64_t v42 = [(GEOPDCanonicalLocationSearchParameters *)v42 init];
      if (v42)
      {
        if (a3) {
          unint64_t v44 = @"queryString";
        }
        else {
          unint64_t v44 = @"query_string";
        }
        unint64_t v45 = [v43 objectForKeyedSubscript:v44];
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          unint64_t v46 = (void *)[v45 copy];
          -[GEOPDCanonicalLocationSearchParameters setQueryString:]((uint64_t)v42, v46);
        }
      }
    }
    -[GEOPDPlaceRequestParameters setCanonicalLocationSearchParameters:]((uint64_t)v1335, v42);
  }
  if (a3) {
    uint64_t v47 = @"reverseGeocodingParameters";
  }
  else {
    uint64_t v47 = @"reverse_geocoding_parameters";
  }
  uint64_t v48 = [v1357 objectForKeyedSubscript:v47];
  objc_opt_class();
  unsigned int v1379 = a3;
  if (objc_opt_isKindOfClass())
  {
    unint64_t v49 = [GEOPDReverseGeocodingParameters alloc];
    if (!v49)
    {
      uint64_t v52 = 0;
LABEL_180:
      -[GEOPDPlaceRequestParameters setReverseGeocodingParameters:]((uint64_t)v1335, (void *)v52);

      goto LABEL_181;
    }
    uint64_t v50 = v49;
    id v51 = v48;
    uint64_t v52 = [(GEOPDReverseGeocodingParameters *)v50 init];
    if (!v52)
    {
LABEL_179:

      goto LABEL_180;
    }
    unint64_t v53 = [v51 objectForKeyedSubscript:@"location"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      long long v1443 = 0u;
      long long v1444 = 0u;
      long long v1441 = 0u;
      long long v1442 = 0u;
      id v54 = v53;
      uint64_t v55 = [v54 countByEnumeratingWithState:&v1441 objects:v1449 count:16];
      if (v55)
      {
        uint64_t v56 = v55;
        uint64_t v57 = *(void *)v1442;
        do
        {
          for (uint64_t i = 0; i != v56; ++i)
          {
            if (*(void *)v1442 != v57) {
              objc_enumerationMutation(v54);
            }
            uint64_t v59 = *(void *)(*((void *)&v1441 + 1) + 8 * i);
            objc_opt_class();
            if (objc_opt_isKindOfClass())
            {
              unint64_t v60 = [GEOLatLng alloc];
              if (v1379) {
                v61 = [(GEOLatLng *)v60 initWithJSON:v59];
              }
              else {
                v61 = [(GEOLatLng *)v60 initWithDictionary:v59];
              }
              id v62 = v61;
              -[GEOPDReverseGeocodingParameters addLocation:](v52, v61);
            }
          }
          uint64_t v56 = [v54 countByEnumeratingWithState:&v1441 objects:v1449 count:16];
        }
        while (v56);
      }

      a3 = v1379;
    }

    if (a3) {
      v63 = @"placeTypeLimit";
    }
    else {
      v63 = @"place_type_limit";
    }
    uint64_t v64 = [v51 objectForKeyedSubscript:v63];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v65 = v64;
      if ([v65 isEqualToString:@"UNKNOWN_PLACE_TYPE"])
      {
        int v66 = 0;
      }
      else if ([v65 isEqualToString:@"COUNTRY"])
      {
        int v66 = 1;
      }
      else if ([v65 isEqualToString:@"ADMINISTRATIVE_AREA"])
      {
        int v66 = 2;
      }
      else if ([v65 isEqualToString:@"SUB_ADMINISTRATIVE_AREA"])
      {
        int v66 = 4;
      }
      else if ([v65 isEqualToString:@"LOCALITY"])
      {
        int v66 = 16;
      }
      else if ([v65 isEqualToString:@"TIME_ZONE"])
      {
        int v66 = 35;
      }
      else if ([v65 isEqualToString:@"SUB_LOCALITY"])
      {
        int v66 = 43;
      }
      else if ([v65 isEqualToString:@"OCEAN"])
      {
        int v66 = 44;
      }
      else if ([v65 isEqualToString:@"AOI"])
      {
        int v66 = 45;
      }
      else if ([v65 isEqualToString:@"INLAND_WATER"])
      {
        int v66 = 46;
      }
      else if ([v65 isEqualToString:@"BUSINESS"])
      {
        int v66 = 47;
      }
      else
      {
        if ([v65 isEqualToString:@"ISLAND"])
        {
          int v66 = 48;
        }
        else if ([v65 isEqualToString:@"STREET"])
        {
          int v66 = 49;
        }
        else if ([v65 isEqualToString:@"ADMIN"])
        {
          int v66 = 50;
        }
        else if ([v65 isEqualToString:@"POSTAL"])
        {
          int v66 = 51;
        }
        else if ([v65 isEqualToString:@"INTERSECTION"])
        {
          int v66 = 54;
        }
        else if ([v65 isEqualToString:@"BUILDING"])
        {
          int v66 = 55;
        }
        else if ([v65 isEqualToString:@"ADDRESS"])
        {
          int v66 = 57;
        }
        else if ([v65 isEqualToString:@"CONTINENT"])
        {
          int v66 = 61;
        }
        else if ([v65 isEqualToString:@"REGION"])
        {
          int v66 = 63;
        }
        else if ([v65 isEqualToString:@"DIVISION"])
        {
          int v66 = 64;
        }
        else if ([v65 isEqualToString:@"PHYSICAL_FEATURE"])
        {
          int v66 = 65;
        }
        else
        {
          int v66 = 0;
        }
        a3 = v1379;
      }
    }
    else
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
LABEL_156:

        if (a3) {
          unint64_t v67 = @"preserveOriginalLocation";
        }
        else {
          unint64_t v67 = @"preserve_original_location";
        }
        id v68 = [v51 objectForKeyedSubscript:v67];
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          char v69 = [v68 BOOLValue];
          *(unsigned char *)(v52 + 60) |= 0x20u;
          *(unsigned char *)(v52 + 60) |= 2u;
          *(unsigned char *)(v52 + 56) = v69;
        }

        if (a3) {
          id v70 = @"extendedLocation";
        }
        else {
          id v70 = @"extended_location";
        }
        uint64_t v71 = [v51 objectForKeyedSubscript:v70];
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          long long v1439 = 0u;
          long long v1440 = 0u;
          long long v1437 = 0u;
          long long v1438 = 0u;
          id v72 = v71;
          uint64_t v73 = [v72 countByEnumeratingWithState:&v1437 objects:&v1445 count:16];
          if (v73)
          {
            uint64_t v74 = v73;
            uint64_t v75 = *(void *)v1438;
            do
            {
              for (uint64_t j = 0; j != v74; ++j)
              {
                if (*(void *)v1438 != v75) {
                  objc_enumerationMutation(v72);
                }
                uint64_t v77 = *(void *)(*((void *)&v1437 + 1) + 8 * j);
                objc_opt_class();
                if (objc_opt_isKindOfClass())
                {
                  id v78 = [GEOLocation alloc];
                  if (v1379) {
                    v79 = [(GEOLocation *)v78 initWithJSON:v77];
                  }
                  else {
                    v79 = [(GEOLocation *)v78 initWithDictionary:v77];
                  }
                  BOOL v80 = v79;
                  -[GEOPDReverseGeocodingParameters addExtendedLocation:](v52, v79);
                }
              }
              uint64_t v74 = [v72 countByEnumeratingWithState:&v1437 objects:&v1445 count:16];
            }
            while (v74);
          }

          a3 = v1379;
        }

        goto LABEL_179;
      }
      int v66 = [v64 intValue];
    }
    *(unsigned char *)(v52 + 60) |= 0x20u;
    *(unsigned char *)(v52 + 60) |= 1u;
    *(_DWORD *)(v52 + 52) = v66;
    goto LABEL_156;
  }
LABEL_181:

  if (a3) {
    v81 = @"placeLookupParameters";
  }
  else {
    v81 = @"place_lookup_parameters";
  }
  uint64_t v82 = [v1357 objectForKeyedSubscript:v81];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v83 = [GEOPDPlaceLookupParameters alloc];
    if (v83)
    {
      id v84 = v82;
      uint64_t v83 = [(GEOPDPlaceLookupParameters *)v83 init];
      if (v83)
      {
        if (a3) {
          v85 = @"resultProviderId";
        }
        else {
          v85 = @"result_provider_id";
        }
        uint64_t v86 = [v84 objectForKeyedSubscript:v85];
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          int v87 = [v86 intValue];
          *(unsigned char *)&v83->_flags |= 0x20u;
          *(unsigned char *)&v83->_flags |= 1u;
          v83->_resultProviderId = v87;
        }

        id v88 = [v84 objectForKeyedSubscript:@"muid"];
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          long long v1443 = 0u;
          long long v1444 = 0u;
          long long v1441 = 0u;
          long long v1442 = 0u;
          id v89 = v88;
          uint64_t v90 = [v89 countByEnumeratingWithState:&v1441 objects:v1449 count:16];
          if (v90)
          {
            uint64_t v91 = v90;
            uint64_t v92 = *(void *)v1442;
            do
            {
              for (uint64_t k = 0; k != v91; ++k)
              {
                if (*(void *)v1442 != v92) {
                  objc_enumerationMutation(v89);
                }
                uint64_t v94 = *(void **)(*((void *)&v1441 + 1) + 8 * k);
                objc_opt_class();
                if (objc_opt_isKindOfClass())
                {
                  [v94 unsignedLongLongValue];
                  -[GEOPDPlaceLookupParameters addMuid:]((uint64_t)v83);
                }
              }
              uint64_t v91 = [v89 countByEnumeratingWithState:&v1441 objects:v1449 count:16];
            }
            while (v91);
          }
        }
        if (v1379) {
          v95 = @"enablePartialClientization";
        }
        else {
          v95 = @"enable_partial_clientization";
        }
        uint64_t v96 = [v84 objectForKeyedSubscript:v95];
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          char v97 = [v96 BOOLValue];
          *(unsigned char *)&v83->_flags |= 0x20u;
          *(unsigned char *)&v83->_flags |= 2u;
          v83->_enablePartialClientizatiouint64_t n = v97;
        }

        id v98 = [v84 objectForKeyedSubscript:@"identifier"];
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          long long v1439 = 0u;
          long long v1440 = 0u;
          long long v1437 = 0u;
          long long v1438 = 0u;
          id v99 = v98;
          uint64_t v100 = [v99 countByEnumeratingWithState:&v1437 objects:&v1445 count:16];
          if (v100)
          {
            uint64_t v101 = v100;
            uint64_t v102 = *(void *)v1438;
            do
            {
              uint64_t v103 = 0;
              do
              {
                if (*(void *)v1438 != v102) {
                  objc_enumerationMutation(v99);
                }
                uint64_t v104 = *(void **)(*((void *)&v1437 + 1) + 8 * v103);
                objc_opt_class();
                if (objc_opt_isKindOfClass())
                {
                  v105 = [GEOPlaceIdentifier alloc];
                  if (v105) {
                    id v106 = (void *)-[GEOPlaceIdentifier _initWithDictionary:isJSON:]((uint64_t)v105, v104, v1379);
                  }
                  else {
                    id v106 = 0;
                  }
                  [(GEOPDPlaceLookupParameters *)v83 addIdentifier:v106];
                }
                ++v103;
              }
              while (v101 != v103);
              uint64_t v107 = [v99 countByEnumeratingWithState:&v1437 objects:&v1445 count:16];
              uint64_t v101 = v107;
            }
            while (v107);
          }
        }
        a3 = v1379;
      }
    }
    -[GEOPDPlaceRequestParameters setPlaceLookupParameters:]((uint64_t)v1335, v83);
  }
  if (a3) {
    uint64_t v108 = @"merchantLookupParameters";
  }
  else {
    uint64_t v108 = @"merchant_lookup_parameters";
  }
  uint64_t v109 = [v1357 objectForKeyedSubscript:v108];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v110 = [GEOPDMerchantLookupParameters alloc];
    if (a3) {
      v111 = [(GEOPDMerchantLookupParameters *)v110 initWithJSON:v109];
    }
    else {
      v111 = [(GEOPDMerchantLookupParameters *)v110 initWithDictionary:v109];
    }
    char v112 = v111;
    -[GEOPDPlaceRequestParameters setMerchantLookupParameters:]((uint64_t)v1335, v111);
  }
  if (a3) {
    id v113 = @"placeRefinementParameters";
  }
  else {
    id v113 = @"place_refinement_parameters";
  }
  uint64_t v114 = [v1357 objectForKeyedSubscript:v113];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v115 = [GEOPDPlaceRefinementParameters alloc];
    if (v115) {
      uint64_t v116 = (void *)-[GEOPDPlaceRefinementParameters _initWithDictionary:isJSON:]((uint64_t)v115, v114, a3);
    }
    else {
      uint64_t v116 = 0;
    }
    -[GEOPDPlaceRequestParameters setPlaceRefinementParameters:]((uint64_t)v1335, v116);
  }
  if (a3) {
    v117 = @"siriSearchParameters";
  }
  else {
    v117 = @"siri_search_parameters";
  }
  uint64_t v118 = [v1357 objectForKeyedSubscript:v117];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v119 = [GEOPDSiriSearchParameters alloc];
    if (!v119)
    {
      v1392 = 0;
      goto LABEL_386;
    }
    id v120 = v119;
    id v121 = v118;
    v1392 = [(GEOPDSiriSearchParameters *)v120 init];
    if (!v1392)
    {
LABEL_385:

LABEL_386:
      -[GEOPDPlaceRequestParameters setSiriSearchParameters:]((uint64_t)v1335, v1392);

      goto LABEL_387;
    }
    if (a3) {
      unint64_t v122 = @"sortOrder";
    }
    else {
      unint64_t v122 = @"sort_order";
    }
    uint64_t v123 = [v121 objectForKeyedSubscript:v122];
    objc_opt_class();
    v1336 = v118;
    v1339 = v121;
    if (objc_opt_isKindOfClass())
    {
      id v124 = v123;
      if ([v124 isEqualToString:@"RELEVANCE"])
      {
        int v125 = 0;
      }
      else if ([v124 isEqualToString:@"RATING"])
      {
        int v125 = 1;
      }
      else if ([v124 isEqualToString:@"DISTANCE"])
      {
        int v125 = 2;
      }
      else if ([v124 isEqualToString:@"PRICE"])
      {
        int v125 = 3;
      }
      else
      {
        int v125 = 0;
      }

      id v121 = v1339;
    }
    else
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
LABEL_264:

        if (a3) {
          v126 = @"maxResultCount";
        }
        else {
          v126 = @"max_result_count";
        }
        v127 = [v121 objectForKeyedSubscript:v126];
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          unsigned int v128 = [v127 unsignedIntValue];
          *(_WORD *)&v1392->_flags |= 0x1000u;
          *(_WORD *)&v1392->_flags |= 1u;
          v1392->_maxResultCount = v128;
        }

        if (a3) {
          uint64_t v129 = @"searchString";
        }
        else {
          uint64_t v129 = @"search_string";
        }
        uint64_t v130 = v1339;
        uint64_t v131 = [v1339 objectForKeyedSubscript:v129];
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          v132 = (void *)[v131 copy];
          -[GEOPDSiriSearchParameters setSearchString:]((uint64_t)v1392, v132);

          uint64_t v130 = v1339;
        }

        if (a3) {
          v133 = @"viewportInfo";
        }
        else {
          v133 = @"viewport_info";
        }
        uint64_t v134 = [v130 objectForKeyedSubscript:v133];
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          uint64_t v135 = [GEOPDViewportInfo alloc];
          if (a3) {
            v136 = [(GEOPDViewportInfo *)v135 initWithJSON:v134];
          }
          else {
            v136 = [(GEOPDViewportInfo *)v135 initWithDictionary:v134];
          }
          uint64_t v137 = v136;
          -[GEOPDSiriSearchParameters setViewportInfo:]((uint64_t)v1392, v136);

          uint64_t v130 = v1339;
        }

        v138 = [v130 objectForKeyedSubscript:@"address"];
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          id v139 = [GEOAddress alloc];
          if (a3) {
            __int16 v140 = [(GEOAddress *)v139 initWithJSON:v138];
          }
          else {
            __int16 v140 = [(GEOAddress *)v139 initWithDictionary:v138];
          }
          v141 = v140;
          -[GEOPDSiriSearchParameters setAddress:]((uint64_t)v1392, v140);

          uint64_t v130 = v1339;
        }

        if (a3) {
          v142 = @"businessCategoryFilter";
        }
        else {
          v142 = @"business_category_filter";
        }
        uint64_t v143 = [v130 objectForKeyedSubscript:v142];
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          long long v1435 = 0u;
          long long v1436 = 0u;
          long long v1433 = 0u;
          long long v1434 = 0u;
          id v144 = v143;
          uint64_t v145 = [v144 countByEnumeratingWithState:&v1433 objects:&v1445 count:16];
          if (v145)
          {
            uint64_t v146 = v145;
            uint64_t v147 = *(void *)v1434;
            do
            {
              for (uint64_t m = 0; m != v146; ++m)
              {
                if (*(void *)v1434 != v147) {
                  objc_enumerationMutation(v144);
                }
                uint64_t v149 = *(void **)(*((void *)&v1433 + 1) + 8 * m);
                objc_opt_class();
                if (objc_opt_isKindOfClass())
                {
                  v150 = (void *)[v149 copy];
                  -[GEOPDSiriSearchParameters addBusinessCategoryFilter:]((uint64_t)v1392, v150);
                }
              }
              uint64_t v146 = [v144 countByEnumeratingWithState:&v1433 objects:&v1445 count:16];
            }
            while (v146);
          }

          uint64_t v130 = v1339;
        }

        if (a3) {
          __int16 v151 = @"isStrictMapRegion";
        }
        else {
          __int16 v151 = @"is_strict_map_region";
        }
        id v152 = [v130 objectForKeyedSubscript:v151];
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          char v153 = [v152 BOOLValue];
          *(_WORD *)&v1392->_flags |= 0x1000u;
          *(_WORD *)&v1392->_flags |= 4u;
          v1392->_isStrictMapRegiouint64_t n = v153;
        }

        if (a3) {
          uint64_t v154 = @"structuredSearch";
        }
        else {
          uint64_t v154 = @"structured_search";
        }
        uint64_t v155 = [v1339 objectForKeyedSubscript:v154];
        objc_opt_class();
        uint64_t v118 = v1336;
        if (objc_opt_isKindOfClass())
        {
          char v156 = [v155 BOOLValue];
          *(_WORD *)&v1392->_flags |= 0x1000u;
          *(_WORD *)&v1392->_flags |= 8u;
          v1392->_structuredSearch = v156;
        }

        if (a3) {
          uint64_t v157 = @"searchSubstringDescriptor";
        }
        else {
          uint64_t v157 = @"search_substring_descriptor";
        }
        id v121 = v1339;
        v158 = [v1339 objectForKeyedSubscript:v157];
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          long long v1431 = 0u;
          long long v1432 = 0u;
          long long v1429 = 0u;
          long long v1430 = 0u;
          obuint64_t j = v158;
          uint64_t v159 = [obj countByEnumeratingWithState:&v1429 objects:&v1441 count:16];
          if (!v159) {
            goto LABEL_369;
          }
          uint64_t v160 = v159;
          uint64_t v161 = *(void *)v1430;
          if (a3) {
            id v162 = @"stringType";
          }
          else {
            id v162 = @"string_type";
          }
          uint64_t v163 = @"begin_index";
          if (a3) {
            uint64_t v163 = @"beginIndex";
          }
          v1348 = v163;
          v1351 = v162;
          if (a3) {
            uint64_t v164 = @"endIndex";
          }
          else {
            uint64_t v164 = @"end_index";
          }
          uint64_t v165 = @"span_data";
          if (a3) {
            uint64_t v165 = @"spanData";
          }
          v1342 = v165;
          v1345 = v164;
          id v1354 = v158;
          uint64_t v1358 = *(void *)v1430;
          while (1)
          {
            uint64_t v166 = 0;
            uint64_t v1364 = v160;
            do
            {
              if (*(void *)v1430 != v161) {
                objc_enumerationMutation(obj);
              }
              uint64_t v167 = *(void **)(*((void *)&v1429 + 1) + 8 * v166);
              objc_opt_class();
              if (objc_opt_isKindOfClass())
              {
                v168 = [GEOPDSearchSubstringDescriptor alloc];
                if (v168)
                {
                  id v169 = v167;
                  v168 = [(GEOPDSearchSubstringDescriptor *)v168 init];
                  if (v168)
                  {
                    v170 = [v169 objectForKeyedSubscript:v1351];
                    objc_opt_class();
                    if (objc_opt_isKindOfClass())
                    {
                      id v171 = v170;
                      if ([v171 isEqualToString:@"PLACE"])
                      {
                        int v172 = 0;
                      }
                      else if ([v171 isEqualToString:@"BUSINESS"])
                      {
                        int v172 = 1;
                      }
                      else if ([v171 isEqualToString:@"CATEGORY"])
                      {
                        int v172 = 2;
                      }
                      else if ([v171 isEqualToString:@"IGNORE"])
                      {
                        int v172 = 3;
                      }
                      else if ([v171 isEqualToString:@"ATTRIBUTE"])
                      {
                        int v172 = 4;
                      }
                      else
                      {
                        int v172 = 0;
                      }

                      v158 = v1354;
LABEL_348:
                      v168->_stringType = v172;
                      a3 = v1379;
                    }
                    else
                    {
                      objc_opt_class();
                      if (objc_opt_isKindOfClass())
                      {
                        int v172 = [v170 intValue];
                        goto LABEL_348;
                      }
                    }

                    v173 = [v169 objectForKeyedSubscript:v1348];
                    objc_opt_class();
                    if (objc_opt_isKindOfClass()) {
                      v168->_beginIndex = [v173 intValue];
                    }

                    v174 = [v169 objectForKeyedSubscript:v1345];
                    objc_opt_class();
                    if (objc_opt_isKindOfClass()) {
                      v168->_endIndex = [v174 intValue];
                    }

                    uint64_t v175 = [v169 objectForKeyedSubscript:v1342];
                    objc_opt_class();
                    if (objc_opt_isKindOfClass())
                    {
                      long long v1439 = 0u;
                      long long v1440 = 0u;
                      long long v1437 = 0u;
                      long long v1438 = 0u;
                      id v176 = v175;
                      uint64_t v177 = [v176 countByEnumeratingWithState:&v1437 objects:v1449 count:16];
                      if (v177)
                      {
                        uint64_t v178 = v177;
                        uint64_t v179 = *(void *)v1438;
                        do
                        {
                          for (uint64_t n = 0; n != v178; ++n)
                          {
                            if (*(void *)v1438 != v179) {
                              objc_enumerationMutation(v176);
                            }
                            char v181 = *(void **)(*((void *)&v1437 + 1) + 8 * n);
                            objc_opt_class();
                            if (objc_opt_isKindOfClass())
                            {
                              uint64_t v182 = (void *)[v181 copy];
                              -[GEOPDSearchSubstringDescriptor addSpanData:]((uint64_t)v168, v182);
                            }
                          }
                          uint64_t v178 = [v176 countByEnumeratingWithState:&v1437 objects:v1449 count:16];
                        }
                        while (v178);
                      }

                      a3 = v1379;
                      v158 = v1354;
                    }
                  }
                }
                -[GEOPDSiriSearchParameters addSearchSubstringDescriptor:]((uint64_t)v1392, v168);

                uint64_t v161 = v1358;
                uint64_t v160 = v1364;
              }
              ++v166;
            }
            while (v166 != v160);
            uint64_t v160 = [obj countByEnumeratingWithState:&v1429 objects:&v1441 count:16];
            if (!v160)
            {
LABEL_369:

              uint64_t v118 = v1336;
              id v121 = v1339;
              break;
            }
          }
        }

        if (a3) {
          v183 = @"indexFilter";
        }
        else {
          v183 = @"index_filter";
        }
        uint64_t v184 = [v121 objectForKeyedSubscript:v183];
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          v185 = [GEOPDIndexQueryNode alloc];
          if (v185) {
            v186 = (void *)-[GEOPDIndexQueryNode _initWithDictionary:isJSON:](v185, v184);
          }
          else {
            v186 = 0;
          }
          -[GEOPDSiriSearchParameters setIndexFilter:]((uint64_t)v1392, v186);

          id v121 = v1339;
        }

        if (a3) {
          uint64_t v187 = @"recentRouteInfo";
        }
        else {
          uint64_t v187 = @"recent_route_info";
        }
        uint64_t v188 = [v121 objectForKeyedSubscript:v187];
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          v189 = [GEOPDRecentRouteInfo alloc];
          if (v189) {
            uint64_t v190 = (void *)-[GEOPDRecentRouteInfo _initWithDictionary:isJSON:](v189, v188, a3);
          }
          else {
            uint64_t v190 = 0;
          }
          -[GEOPDSiriSearchParameters setRecentRouteInfo:]((uint64_t)v1392, v190);

          id v121 = v1339;
        }

        goto LABEL_385;
      }
      int v125 = [v123 intValue];
    }
    *(_WORD *)&v1392->_flags |= 0x1000u;
    *(_WORD *)&v1392->_flags |= 2u;
    v1392->_sortOrder = v125;
    goto LABEL_264;
  }
LABEL_387:

  if (a3) {
    v191 = @"locationDirectedSearchParameters";
  }
  else {
    v191 = @"location_directed_search_parameters";
  }
  id v192 = [v1357 objectForKeyedSubscript:v191];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v193 = [GEOPDLocationDirectedSearchParameters alloc];
    if (!v193)
    {
      uint64_t v196 = 0;
      goto LABEL_486;
    }
    uint64_t v194 = v193;
    id v195 = v192;
    uint64_t v196 = [(GEOPDLocationDirectedSearchParameters *)v194 init];
    if (!v196)
    {
LABEL_485:

LABEL_486:
      -[GEOPDPlaceRequestParameters setLocationDirectedSearchParameters:]((uint64_t)v1335, (void *)v196);

      goto LABEL_487;
    }
    if (a3) {
      uint64_t v197 = @"sortOrder";
    }
    else {
      uint64_t v197 = @"sort_order";
    }
    v198 = [v195 objectForKeyedSubscript:v197];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v199 = v198;
      if ([v199 isEqualToString:@"RELEVANCE"])
      {
        int v200 = 0;
      }
      else if ([v199 isEqualToString:@"RATING"])
      {
        int v200 = 1;
      }
      else if ([v199 isEqualToString:@"DISTANCE"])
      {
        int v200 = 2;
      }
      else if ([v199 isEqualToString:@"PRICE"])
      {
        int v200 = 3;
      }
      else
      {
        int v200 = 0;
      }
    }
    else
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0) {
        goto LABEL_410;
      }
      int v200 = [v198 intValue];
    }
    *(_WORD *)(v196 + 96) |= 0x400u;
    *(_WORD *)(v196 + 96) |= 4u;
    *(_DWORD *)(v196 + 92) = v200;
LABEL_410:

    if (v1379) {
      uint64_t v201 = @"maxResults";
    }
    else {
      uint64_t v201 = @"max_results";
    }
    unint64_t v202 = [v195 objectForKeyedSubscript:v201];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      int v203 = [v202 unsignedIntValue];
      *(_WORD *)(v196 + 96) |= 0x400u;
      *(_WORD *)(v196 + 96) |= 1u;
      *(_DWORD *)(v196 + 84) = v203;
    }

    if (v1379) {
      unint64_t v204 = @"searchString";
    }
    else {
      unint64_t v204 = @"search_string";
    }
    v205 = [v195 objectForKeyedSubscript:v204];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v206 = (void *)[v205 copy];
      -[GEOPDLocationDirectedSearchParameters setSearchString:](v196, v206);
    }
    unsigned int v207 = v1379;
    if (v1379) {
      uint64_t v208 = @"viewportInfo";
    }
    else {
      uint64_t v208 = @"viewport_info";
    }
    v209 = [v195 objectForKeyedSubscript:v208];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      uint64_t v210 = [GEOPDViewportInfo alloc];
      if (v1379) {
        unint64_t v211 = [(GEOPDViewportInfo *)v210 initWithJSON:v209];
      }
      else {
        unint64_t v211 = [(GEOPDViewportInfo *)v210 initWithDictionary:v209];
      }
      uint64_t v212 = v211;
      -[GEOPDLocationDirectedSearchParameters setViewportInfo:](v196, v211);

      unsigned int v207 = v1379;
    }

    if (v207) {
      unint64_t v213 = @"searchLocation";
    }
    else {
      unint64_t v213 = @"search_location";
    }
    v214 = [v195 objectForKeyedSubscript:v213];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v215 = [GEOLatLng alloc];
      if (v207) {
        v216 = [(GEOLatLng *)v215 initWithJSON:v214];
      }
      else {
        v216 = [(GEOLatLng *)v215 initWithDictionary:v214];
      }
      v217 = v216;
      -[GEOPDLocationDirectedSearchParameters setSearchLocation:](v196, v216);

      unsigned int v207 = v1379;
    }

    if (v207) {
      uint64_t v218 = @"searchType";
    }
    else {
      uint64_t v218 = @"search_type";
    }
    uint64_t v219 = [v195 objectForKeyedSubscript:v218];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v220 = v219;
      a3 = v1379;
      if ([v220 isEqualToString:@"SEARCH_TYPE_UNKNOWN"])
      {
        int v221 = 0;
      }
      else if ([v220 isEqualToString:@"SEARCH_TYPE_DEFAULT"])
      {
        int v221 = 1;
      }
      else if ([v220 isEqualToString:@"SEARCH_TYPE_NEAREST_TRANSIT"])
      {
        int v221 = 2;
      }
      else
      {
        int v221 = 0;
      }
    }
    else
    {
      objc_opt_class();
      a3 = v1379;
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
LABEL_451:

        if (a3) {
          unint64_t v222 = @"nearestTransitParameters";
        }
        else {
          unint64_t v222 = @"nearest_transit_parameters";
        }
        v223 = [v195 objectForKeyedSubscript:v222];
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          v224 = [GEOPDNearestTransitParameters alloc];
          if (v224)
          {
            id v225 = v223;
            v224 = [(GEOPDNearestTransitParameters *)v224 init];
            if (v224)
            {
              if (a3) {
                v226 = @"lineMuid";
              }
              else {
                v226 = @"line_muid";
              }
              uint64_t v227 = [v225 objectForKeyedSubscript:v226];
              objc_opt_class();
              if (objc_opt_isKindOfClass())
              {
                uint64_t v228 = [v227 unsignedLongLongValue];
                *(unsigned char *)&v224->_flags |= 1u;
                v224->_lineMuid = v228;
              }

              if (a3) {
                unint64_t v229 = @"isTransitOnly";
              }
              else {
                unint64_t v229 = @"is_transit_only";
              }
              uint64_t v230 = [v225 objectForKeyedSubscript:v229];
              objc_opt_class();
              if (objc_opt_isKindOfClass())
              {
                char v231 = [v230 BOOLValue];
                *(unsigned char *)&v224->_flags |= 2u;
                v224->_isTransitOnly = v231;
              }
            }
          }
          -[GEOPDLocationDirectedSearchParameters setNearestTransitParameters:](v196, v224);
        }
        if (a3) {
          v232 = @"paginationParameters";
        }
        else {
          v232 = @"pagination_parameters";
        }
        v233 = [v195 objectForKeyedSubscript:v232];
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          v234 = [GEOPDPaginationParameters alloc];
          if (v234) {
            uint64_t v235 = (void *)-[GEOPDPaginationParameters _initWithDictionary:isJSON:](v234, v233, a3);
          }
          else {
            uint64_t v235 = 0;
          }
          -[GEOPDLocationDirectedSearchParameters setPaginationParameters:](v196, v235);
        }
        if (a3) {
          unint64_t v236 = @"searchFilter";
        }
        else {
          unint64_t v236 = @"search_filter";
        }
        uint64_t v237 = [v195 objectForKeyedSubscript:v236];
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          unint64_t v238 = [GEOPDSSearchFilter alloc];
          if (v238) {
            v239 = (void *)-[GEOPDSSearchFilter _initWithDictionary:isJSON:](v238, v237, a3);
          }
          else {
            v239 = 0;
          }
          -[GEOPDLocationDirectedSearchParameters setSearchFilter:](v196, v239);
        }
        goto LABEL_485;
      }
      int v221 = [v219 intValue];
    }
    *(_WORD *)(v196 + 96) |= 0x400u;
    *(_WORD *)(v196 + 96) |= 2u;
    *(_DWORD *)(v196 + 88) = v221;
    goto LABEL_451;
  }
LABEL_487:

  if (a3) {
    v240 = @"autocompleteParameters";
  }
  else {
    v240 = @"autocomplete_parameters";
  }
  v241 = [v1357 objectForKeyedSubscript:v240];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    int v242 = [GEOPDAutocompleteParameters alloc];
    if (a3) {
      uint64_t v243 = [(GEOPDAutocompleteParameters *)v242 initWithJSON:v241];
    }
    else {
      uint64_t v243 = [(GEOPDAutocompleteParameters *)v242 initWithDictionary:v241];
    }
    v244 = v243;
    -[GEOPDPlaceRequestParameters setAutocompleteParameters:]((uint64_t)v1335, v243);
  }
  if (a3) {
    v245 = @"browseCategorySuggestionParameters";
  }
  else {
    v245 = @"browse_category_suggestion_parameters";
  }
  id v246 = [v1357 objectForKeyedSubscript:v245];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v247 = [GEOPDSearchBrowseCategorySuggestionParameters alloc];
    if (v247) {
      uint64_t v248 = (void *)-[GEOPDSearchBrowseCategorySuggestionParameters _initWithDictionary:isJSON:](v247, v246, a3);
    }
    else {
      uint64_t v248 = 0;
    }
    -[GEOPDPlaceRequestParameters setBrowseCategorySuggestionParameters:]((uint64_t)v1335, v248);
  }
  if (a3) {
    uint64_t v249 = @"categorySearchParameters";
  }
  else {
    uint64_t v249 = @"category_search_parameters";
  }
  v250 = [v1357 objectForKeyedSubscript:v249];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v251 = [GEOPDCategorySearchParameters alloc];
    if (!v251)
    {
      uint64_t v254 = 0;
LABEL_870:
      -[GEOPDPlaceRequestParameters setCategorySearchParameters:]((uint64_t)v1335, v254);

      goto LABEL_871;
    }
    BOOL v252 = v251;
    id v253 = v250;
    uint64_t v254 = [(GEOPDCategorySearchParameters *)v252 init];

    if (!v254)
    {
LABEL_869:

      goto LABEL_870;
    }
    if (a3) {
      uint64_t v255 = @"maxResults";
    }
    else {
      uint64_t v255 = @"max_results";
    }
    v256 = [v253 objectForKeyedSubscript:v255];
    objc_opt_class();
    uint64_t v257 = &OBJC_IVAR___GEOMapDataSubscriptionDownloadGroup__completedSubscriptions;
    if (objc_opt_isKindOfClass())
    {
      uint32_t v258 = [v256 unsignedIntValue];
      v254[72]._os_unfair_lock_opaque |= 0x10000000u;
      v254[72]._os_unfair_lock_opaque |= 8u;
      v254[68]._os_unfair_lock_opaque = v258;
    }

    if (a3) {
      id v259 = @"viewportInfo";
    }
    else {
      id v259 = @"viewport_info";
    }
    v260 = [v253 objectForKeyedSubscript:v259];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      uint64_t v261 = [GEOPDViewportInfo alloc];
      if (a3) {
        v262 = [(GEOPDViewportInfo *)v261 initWithJSON:v260];
      }
      else {
        v262 = [(GEOPDViewportInfo *)v261 initWithDictionary:v260];
      }
      uint64_t v263 = v262;
      -[GEOPDCategorySearchParameters setViewportInfo:]((uint64_t)v254, v262);
    }
    id obja = v250;

    if (a3) {
      v264 = @"suggestionEntryMetadata";
    }
    else {
      v264 = @"suggestion_entry_metadata";
    }
    v265 = [v253 objectForKeyedSubscript:v264];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v266 = (void *)[objc_alloc(MEMORY[0x1E4F1C9B8]) initWithBase64EncodedString:v265 options:0];
      -[GEOPDCategorySearchParameters setSuggestionEntryMetadata:]((uint64_t)v254, v266);
    }
    if (a3) {
      v267 = @"blurredHourOfDay";
    }
    else {
      v267 = @"blurred_hour_of_day";
    }
    uint64_t v268 = [v253 objectForKeyedSubscript:v267];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      uint32_t v269 = [v268 unsignedIntValue];
      v254[72]._os_unfair_lock_opaque |= 0x10000000u;
      v254[72]._os_unfair_lock_opaque |= 2u;
      v254[66]._os_unfair_lock_opaque = v269;
    }

    if (a3) {
      uint64_t v270 = @"dayOfWeek";
    }
    else {
      uint64_t v270 = @"day_of_week";
    }
    v271 = [v253 objectForKeyedSubscript:v270];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      uint32_t v272 = [v271 unsignedIntValue];
      v254[72]._os_unfair_lock_opaque |= 0x10000000u;
      v254[72]._os_unfair_lock_opaque |= 4u;
      v254[67]._os_unfair_lock_opaque = v272;
    }

    if (a3) {
      char v273 = @"searchType";
    }
    else {
      char v273 = @"search_type";
    }
    uint64_t v274 = [v253 objectForKeyedSubscript:v273];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v275 = v274;
      if ([v275 isEqualToString:@"CATEGORY_SEARCH_TYPE_UNKNOWN"])
      {
        int v276 = 0;
      }
      else if ([v275 isEqualToString:@"CATEGORY_SEARCH_TYPE_DEFAULT"])
      {
        int v276 = 1;
      }
      else if ([v275 isEqualToString:@"CATEGORY_SEARCH_TYPE_REDO"])
      {
        int v276 = 2;
      }
      else if ([v275 isEqualToString:@"CATEGORY_SEARCH_TYPE_NAV"])
      {
        int v276 = 3;
      }
      else if ([v275 isEqualToString:@"CATEGORY_SEARCH_TYPE_REDO_NAV"])
      {
        int v276 = 4;
      }
      else if ([v275 isEqualToString:@"CATEGORY_SEARCH_TYPE_AUTO_REDO"])
      {
        int v276 = 5;
      }
      else
      {
        int v276 = 0;
      }
    }
    else
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0) {
        goto LABEL_557;
      }
      int v276 = [v274 intValue];
    }
    v254[72]._os_unfair_lock_opaque |= 0x10000000u;
    v254[72]._os_unfair_lock_opaque |= 0x20u;
    v254[70]._os_unfair_lock_opaque = v276;
LABEL_557:

    if (a3) {
      v277 = @"recentRouteInfo";
    }
    else {
      v277 = @"recent_route_info";
    }
    uint64_t v278 = [v253 objectForKeyedSubscript:v277];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v279 = [GEOPDRecentRouteInfo alloc];
      if (v279) {
        uint64_t v280 = (void *)-[GEOPDRecentRouteInfo _initWithDictionary:isJSON:](v279, v278, a3);
      }
      else {
        uint64_t v280 = 0;
      }
      -[GEOPDCategorySearchParameters setRecentRouteInfo:]((uint64_t)v254, v280);
    }
    if (a3) {
      uint64_t v281 = @"supportCategorySearchResultSection";
    }
    else {
      uint64_t v281 = @"support_category_search_result_section";
    }
    uint64_t v282 = [v253 objectForKeyedSubscript:v281];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      char v283 = [v282 BOOLValue];
      v254[72]._os_unfair_lock_opaque |= 0x10000000u;
      v254[72]._os_unfair_lock_opaque |= 0x40u;
      LOBYTE(v254[71]._os_unfair_lock_opaque) = v283;
    }

    if (a3) {
      uint64_t v284 = @"evChargingParameters";
    }
    else {
      uint64_t v284 = @"ev_charging_parameters";
    }
    v285 = [v253 objectForKeyedSubscript:v284];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v286 = [GEOPDSSearchEvChargingParameters alloc];
      if (v286) {
        __int16 v287 = -[GEOPDSSearchEvChargingParameters _initWithDictionary:isJSON:](v286, v285, a3);
      }
      else {
        __int16 v287 = 0;
      }
      -[GEOPDCategorySearchParameters setEvChargingParameters:]((uint64_t)v254, v287);
    }
    if (a3) {
      v288 = @"supportedRelatedEntitySectionType";
    }
    else {
      v288 = @"supported_related_entity_section_type";
    }
    v289 = [v253 objectForKeyedSubscript:v288];
    objc_opt_class();
    id v1393 = v253;
    if (objc_opt_isKindOfClass())
    {
      long long v1427 = 0u;
      long long v1428 = 0u;
      long long v1425 = 0u;
      long long v1426 = 0u;
      v1365 = v289;
      id v290 = v289;
      uint64_t v291 = [v290 countByEnumeratingWithState:&v1425 objects:v1449 count:16];
      if (!v291) {
        goto LABEL_595;
      }
      uint64_t v292 = v291;
      uint64_t v293 = *(void *)v1426;
      while (1)
      {
        for (iuint64_t i = 0; ii != v292; ++ii)
        {
          if (*(void *)v1426 != v293) {
            objc_enumerationMutation(v290);
          }
          id v295 = *(void **)(*((void *)&v1425 + 1) + 8 * ii);
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            id v296 = v295;
            if (([v296 isEqualToString:@"RELATED_ENTITY_SECTION_TYPE_UNKNOWN"] & 1) == 0) {
              [v296 isEqualToString:@"RELATED_ENTITY_SECTION_TYPE_COLLECTION"];
            }
          }
          else
          {
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) == 0) {
              continue;
            }
            [v295 intValue];
          }
          -[GEOPDCategorySearchParameters addSupportedRelatedEntitySectionType:](v254);
        }
        uint64_t v292 = [v290 countByEnumeratingWithState:&v1425 objects:v1449 count:16];
        if (!v292)
        {
LABEL_595:

          a3 = v1379;
          id v253 = v1393;
          uint64_t v257 = &OBJC_IVAR___GEOMapDataSubscriptionDownloadGroup__completedSubscriptions;
          v289 = v1365;
          break;
        }
      }
    }

    if (a3) {
      uint64_t v297 = @"etaFilter";
    }
    else {
      uint64_t v297 = @"eta_filter";
    }
    uint64_t v298 = [v253 objectForKeyedSubscript:v297];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v299 = [GEOPDETAFilter alloc];
      if (v299) {
        __int16 v300 = (void *)-[GEOPDETAFilter _initWithDictionary:isJSON:](v299, v298, a3);
      }
      else {
        __int16 v300 = 0;
      }
      -[GEOPDCategorySearchParameters setEtaFilter:]((uint64_t)v254, v300);
    }
    if (a3) {
      v301 = @"supportedSearchTierType";
    }
    else {
      v301 = @"supported_search_tier_type";
    }
    uint64_t v302 = [v253 objectForKeyedSubscript:v301];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      long long v1423 = 0u;
      long long v1424 = 0u;
      long long v1421 = 0u;
      long long v1422 = 0u;
      v1366 = v302;
      id v303 = v302;
      uint64_t v304 = [v303 countByEnumeratingWithState:&v1421 objects:&v1445 count:16];
      if (!v304) {
        goto LABEL_623;
      }
      uint64_t v305 = v304;
      uint64_t v306 = *(void *)v1422;
      while (1)
      {
        for (juint64_t j = 0; jj != v305; ++jj)
        {
          if (*(void *)v1422 != v306) {
            objc_enumerationMutation(v303);
          }
          uint64_t v308 = *(void **)(*((void *)&v1421 + 1) + 8 * jj);
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            id v309 = v308;
            if (([v309 isEqualToString:@"SEARCH_TIER_METADATA_UNKNOWN"] & 1) == 0
              && ([v309 isEqualToString:@"SEARCH_TIER_METADATA_PRIMARY"] & 1) == 0)
            {
              [v309 isEqualToString:@"SEARCH_TIER_METADATA_AUXILIARY"];
            }
          }
          else
          {
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) == 0) {
              continue;
            }
            [v308 intValue];
          }
          -[GEOPDCategorySearchParameters addSupportedSearchTierType:](v254);
          a3 = v1379;
        }
        uint64_t v305 = [v303 countByEnumeratingWithState:&v1421 objects:&v1445 count:16];
        if (!v305)
        {
LABEL_623:

          id v253 = v1393;
          uint64_t v257 = &OBJC_IVAR___GEOMapDataSubscriptionDownloadGroup__completedSubscriptions;
          uint64_t v302 = v1366;
          break;
        }
      }
    }

    if (a3) {
      v310 = @"auxiliaryTierNumResults";
    }
    else {
      v310 = @"auxiliary_tier_num_results";
    }
    id v311 = [v253 objectForKeyedSubscript:v310];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      uint32_t v312 = [v311 unsignedIntValue];
      *(uint32_t *)((char *)&v254->_os_unfair_lock_opaque + v257[206]) |= 0x10000000u;
      *(uint32_t *)((char *)&v254->_os_unfair_lock_opaque + v257[206]) |= 1u;
      v254[65]._os_unfair_lock_opaque = v312;
    }

    if (a3) {
      uint64_t v313 = @"resultRefinementQuery";
    }
    else {
      uint64_t v313 = @"result_refinement_query";
    }
    uint64_t v314 = [v253 objectForKeyedSubscript:v313];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v315 = [GEOPDResultRefinementQuery alloc];
      if (a3) {
        uint64_t v316 = [(GEOPDResultRefinementQuery *)v315 initWithJSON:v314];
      }
      else {
        uint64_t v316 = [(GEOPDResultRefinementQuery *)v315 initWithDictionary:v314];
      }
      v317 = v316;
      -[GEOPDCategorySearchParameters setResultRefinementQuery:]((uint64_t)v254, v316);
    }
    if (a3) {
      id v318 = @"knownRefinementType";
    }
    else {
      id v318 = @"known_refinement_type";
    }
    v319 = [v253 objectForKeyedSubscript:v318];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      long long v1419 = 0u;
      long long v1420 = 0u;
      long long v1417 = 0u;
      long long v1418 = 0u;
      v1367 = v319;
      id v320 = v319;
      uint64_t v321 = [v320 countByEnumeratingWithState:&v1417 objects:&v1441 count:16];
      if (!v321) {
        goto LABEL_661;
      }
      uint64_t v322 = v321;
      uint64_t v323 = *(void *)v1418;
      while (1)
      {
        for (kuint64_t k = 0; kk != v322; ++kk)
        {
          if (*(void *)v1418 != v323) {
            objc_enumerationMutation(v320);
          }
          char v325 = *(void **)(*((void *)&v1417 + 1) + 8 * kk);
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            id v326 = v325;
            if (([v326 isEqualToString:@"RESULT_REFINEMENT_TYPE_UNKNOWN"] & 1) == 0
              && ([v326 isEqualToString:@"RESULT_REFINEMENT_TYPE_TOGGLE"] & 1) == 0
              && ([v326 isEqualToString:@"RESULT_REFINEMENT_TYPE_RANGE"] & 1) == 0
              && ([v326 isEqualToString:@"RESULT_REFINEMENT_TYPE_MULTI_SELECT"] & 1) == 0
              && ([v326 isEqualToString:@"RESULT_REFINEMENT_TYPE_SORT"] & 1) == 0
              && ([v326 isEqualToString:@"RESULT_REFINEMENT_GUIDES_HOME"] & 1) == 0)
            {
              [v326 isEqualToString:@"RESULT_REFINEMENT_TYPE_OPEN_OPTIONS"];
            }
          }
          else
          {
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) == 0) {
              continue;
            }
            [v325 intValue];
          }
          -[GEOPDCategorySearchParameters addKnownRefinementType:](v254);
        }
        uint64_t v322 = [v320 countByEnumeratingWithState:&v1417 objects:&v1441 count:16];
        if (!v322)
        {
LABEL_661:

          a3 = v1379;
          id v253 = v1393;
          uint64_t v257 = &OBJC_IVAR___GEOMapDataSubscriptionDownloadGroup__completedSubscriptions;
          v319 = v1367;
          break;
        }
      }
    }

    if (a3) {
      v327 = @"placeSummaryRevision";
    }
    else {
      v327 = @"place_summary_revision";
    }
    id v328 = [v253 objectForKeyedSubscript:v327];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v329 = v328;
      if ([v329 isEqualToString:@"UNKNOWN"])
      {
        int v330 = 0;
      }
      else if ([v329 isEqualToString:@"NAME"])
      {
        int v330 = 1;
      }
      else if ([v329 isEqualToString:@"CATEGORY"])
      {
        int v330 = 2;
      }
      else if ([v329 isEqualToString:@"DISTANCE"])
      {
        int v330 = 3;
      }
      else if ([v329 isEqualToString:@"PRICE"])
      {
        int v330 = 4;
      }
      else if ([v329 isEqualToString:@"HOURS"])
      {
        int v330 = 5;
      }
      else if ([v329 isEqualToString:@"ADDRESS"])
      {
        int v330 = 6;
      }
      else if ([v329 isEqualToString:@"RATINGS"])
      {
        int v330 = 7;
      }
      else if ([v329 isEqualToString:@"TRANSIT_SHIELDS"])
      {
        int v330 = 8;
      }
      else if ([v329 isEqualToString:@"USER_GENERATED_GUIDES"])
      {
        int v330 = 9;
      }
      else if ([v329 isEqualToString:@"CURATED_GUIDES"])
      {
        int v330 = 10;
      }
      else
      {
        if ([v329 isEqualToString:@"EV_CHARGERS_NUMBER"])
        {
          int v330 = 11;
        }
        else if ([v329 isEqualToString:@"UGC_USER_SUBMITTED_RECOMMENDATIONS"])
        {
          int v330 = 12;
        }
        else if ([v329 isEqualToString:@"STRING"])
        {
          int v330 = 13;
        }
        else if ([v329 isEqualToString:@"SERVER_OVERRIDE"])
        {
          int v330 = 14;
        }
        else if ([v329 isEqualToString:@"CONTAINMENT"])
        {
          int v330 = 15;
        }
        else if ([v329 isEqualToString:@"RECENT"])
        {
          int v330 = 16;
        }
        else if ([v329 isEqualToString:@"HIGHLIGHT_MAIN"])
        {
          int v330 = 17;
        }
        else if ([v329 isEqualToString:@"HIGHLIGHT_EXTRA"])
        {
          int v330 = 18;
        }
        else if ([v329 isEqualToString:@"PUBLISHER_NAME_FOR_GUIDE"])
        {
          int v330 = 19;
        }
        else if ([v329 isEqualToString:@"NUM_PLACES_IN_GUIDE"])
        {
          int v330 = 20;
        }
        else if ([v329 isEqualToString:@"PUBLISHER_DESCRIPTION"])
        {
          int v330 = 21;
        }
        else if ([v329 isEqualToString:@"SECONDARY_NAME"])
        {
          int v330 = 22;
        }
        else if ([v329 isEqualToString:@"FACTOID"])
        {
          int v330 = 23;
        }
        else if ([v329 isEqualToString:@"ARP_RATINGS"])
        {
          int v330 = 24;
        }
        else if ([v329 isEqualToString:@"REAL_TIME_EV_CHARGER_AVAILABILITY"])
        {
          int v330 = 25;
        }
        else if ([v329 isEqualToString:@"DETOUR_TIME"])
        {
          int v330 = 26;
        }
        else if ([v329 isEqualToString:@"HIKING_DIFFICULTY"])
        {
          int v330 = 27;
        }
        else if ([v329 isEqualToString:@"HIKING_TRAIL_LENGTH"])
        {
          int v330 = 28;
        }
        else if ([v329 isEqualToString:@"PHOTO_CAROUSEL"])
        {
          int v330 = 29;
        }
        else if ([v329 isEqualToString:@"IN_USER_LIBRARY"])
        {
          int v330 = 30;
        }
        else if ([v329 isEqualToString:@"USER_NOTE"])
        {
          int v330 = 31;
        }
        else if ([v329 isEqualToString:@"HIKE_ROUTE_FACTOID_ELEVATION_GAIN_LOSS"])
        {
          int v330 = 32;
        }
        else if ([v329 isEqualToString:@"HIKE_ROUTE_TYPE"])
        {
          int v330 = 33;
        }
        else if ([v329 isEqualToString:@"HIKE_ROUTE_DURATION"])
        {
          int v330 = 34;
        }
        else if ([v329 isEqualToString:@"HIKE_ROUTE_LENGTH"])
        {
          int v330 = 35;
        }
        else
        {
          int v330 = 0;
        }
        a3 = v1379;
        id v253 = v1393;
      }
    }
    else
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
LABEL_756:

        if (a3) {
          v331 = @"previousSearchViewport";
        }
        else {
          v331 = @"previous_search_viewport";
        }
        id v332 = [v253 objectForKeyedSubscript:v331];
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          uint64_t v333 = [GEOPDViewportInfo alloc];
          if (a3) {
            uint64_t v334 = [(GEOPDViewportInfo *)v333 initWithJSON:v332];
          }
          else {
            uint64_t v334 = [(GEOPDViewportInfo *)v333 initWithDictionary:v332];
          }
          uint64_t v335 = v334;
          -[GEOPDCategorySearchParameters setPreviousSearchViewport:]((uint64_t)v254, v334);
        }
        if (a3) {
          v336 = @"supportedPlaceSummaryFormatType";
        }
        else {
          v336 = @"supported_place_summary_format_type";
        }
        uint64_t v337 = [v253 objectForKeyedSubscript:v336];
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          long long v1415 = 0u;
          long long v1416 = 0u;
          long long v1413 = 0u;
          long long v1414 = 0u;
          id v338 = v337;
          uint64_t v339 = [v338 countByEnumeratingWithState:&v1413 objects:&v1437 count:16];
          if (!v339) {
            goto LABEL_786;
          }
          uint64_t v340 = v339;
          uint64_t v341 = *(void *)v1414;
          while (1)
          {
            for (muint64_t m = 0; mm != v340; ++mm)
            {
              if (*(void *)v1414 != v341) {
                objc_enumerationMutation(v338);
              }
              unint64_t v343 = *(void **)(*((void *)&v1413 + 1) + 8 * mm);
              objc_opt_class();
              if (objc_opt_isKindOfClass())
              {
                id v344 = v343;
                if (([v344 isEqualToString:@"PLACE_SUMMARY_FORMAT_TYPE_UNKNOWN"] & 1) == 0
                  && ([v344 isEqualToString:@"PLACE_SUMMARY_FORMAT_TYPE_BOLD"] & 1) == 0
                  && ([v344 isEqualToString:@"PLACE_SUMMARY_FORMAT_TYPE_ITALICS"] & 1) == 0
                  && ([v344 isEqualToString:@"PLACE_SUMMARY_FORMAT_TYPE_STRIKETHROUGH"] & 1) == 0)
                {
                  [v344 isEqualToString:@"PLACE_SUMMARY_FORMAT_TYPE_TAPPABLE_ENTITY"];
                }
              }
              else
              {
                objc_opt_class();
                if ((objc_opt_isKindOfClass() & 1) == 0) {
                  continue;
                }
                [v343 intValue];
              }
              -[GEOPDCategorySearchParameters addSupportedPlaceSummaryFormatType:](v254);
            }
            uint64_t v340 = [v338 countByEnumeratingWithState:&v1413 objects:&v1437 count:16];
            if (!v340)
            {
LABEL_786:

              a3 = v1379;
              id v253 = v1393;
              uint64_t v257 = &OBJC_IVAR___GEOMapDataSubscriptionDownloadGroup__completedSubscriptions;
              break;
            }
          }
        }

        if (a3) {
          v345 = @"supportedSearchSectionType";
        }
        else {
          v345 = @"supported_search_section_type";
        }
        v346 = [v253 objectForKeyedSubscript:v345];
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          long long v1411 = 0u;
          long long v1412 = 0u;
          long long v1409 = 0u;
          long long v1410 = 0u;
          v1368 = v346;
          id v347 = v346;
          uint64_t v348 = [v347 countByEnumeratingWithState:&v1409 objects:&v1433 count:16];
          if (!v348) {
            goto LABEL_807;
          }
          uint64_t v349 = v348;
          uint64_t v350 = *(void *)v1410;
          while (1)
          {
            for (nuint64_t n = 0; nn != v349; ++nn)
            {
              if (*(void *)v1410 != v350) {
                objc_enumerationMutation(v347);
              }
              v352 = *(void **)(*((void *)&v1409 + 1) + 8 * nn);
              objc_opt_class();
              if (objc_opt_isKindOfClass())
              {
                id v353 = v352;
                if (([v353 isEqualToString:@"SEARCH_SECTION_TYPE_UNKNOWN"] & 1) == 0
                  && ([v353 isEqualToString:@"SEARCH_SECTION_TYPE_PLACE"] & 1) == 0)
                {
                  [v353 isEqualToString:@"SEARCH_SECTION_TYPE_GUIDE"];
                }
              }
              else
              {
                objc_opt_class();
                if ((objc_opt_isKindOfClass() & 1) == 0) {
                  continue;
                }
                [v352 intValue];
              }
              -[GEOPDCategorySearchParameters addSupportedSearchSectionType:](v254);
              a3 = v1379;
            }
            uint64_t v349 = [v347 countByEnumeratingWithState:&v1409 objects:&v1433 count:16];
            if (!v349)
            {
LABEL_807:

              id v253 = v1393;
              uint64_t v257 = &OBJC_IVAR___GEOMapDataSubscriptionDownloadGroup__completedSubscriptions;
              v346 = v1368;
              break;
            }
          }
        }

        if (a3) {
          uint64_t v354 = @"supportSearchEnrichment";
        }
        else {
          uint64_t v354 = @"support_search_enrichment";
        }
        uint64_t v355 = [v253 objectForKeyedSubscript:v354];
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          char v356 = [v355 BOOLValue];
          *(uint32_t *)((char *)&v254->_os_unfair_lock_opaque + v257[206]) |= 0x10000000u;
          *(uint32_t *)((char *)&v254->_os_unfair_lock_opaque + v257[206]) |= 0x80u;
          BYTE1(v254[71]._os_unfair_lock_opaque) = v356;
        }

        if (a3) {
          v357 = @"supportStructuredRapAffordance";
        }
        else {
          v357 = @"support_structured_rap_affordance";
        }
        uint64_t v358 = [v253 objectForKeyedSubscript:v357];
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          char v359 = [v358 BOOLValue];
          *(uint32_t *)((char *)&v254->_os_unfair_lock_opaque + v257[206]) |= 0x10000000u;
          *(uint32_t *)((char *)&v254->_os_unfair_lock_opaque + v257[206]) |= 0x100u;
          BYTE2(v254[71]._os_unfair_lock_opaque) = v359;
        }

        if (a3) {
          v360 = @"searchOriginationInfo";
        }
        else {
          v360 = @"search_origination_info";
        }
        id v361 = [v253 objectForKeyedSubscript:v360];
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          uint64_t v362 = [GEOPDSearchOriginationInfo alloc];
          if (v362) {
            uint64_t v363 = (void *)-[GEOPDSearchOriginationInfo _initWithDictionary:isJSON:]((uint64_t)v362, v361, a3);
          }
          else {
            uint64_t v363 = 0;
          }
          -[GEOPDCategorySearchParameters setSearchOriginationInfo:]((uint64_t)v254, v363);
        }
        if (a3) {
          uint64_t v364 = @"enrichmentCampaignNamespace";
        }
        else {
          uint64_t v364 = @"enrichment_campaign_namespace";
        }
        v365 = [v253 objectForKeyedSubscript:v364];
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          v366 = (void *)[v365 copy];
          -[GEOPDCategorySearchParameters setEnrichmentCampaignNamespace:]((uint64_t)v254, v366);
        }
        if (a3) {
          v367 = @"searchEnrichmentRevisionMetadata";
        }
        else {
          v367 = @"search_enrichment_revision_metadata";
        }
        uint64_t v368 = [v253 objectForKeyedSubscript:v367];
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          long long v1407 = 0u;
          long long v1408 = 0u;
          long long v1405 = 0u;
          long long v1406 = 0u;
          id v369 = v368;
          uint64_t v370 = [v369 countByEnumeratingWithState:&v1405 objects:&v1429 count:16];
          if (v370)
          {
            uint64_t v371 = v370;
            uint64_t v372 = *(void *)v1406;
            do
            {
              uint64_t v373 = 0;
              do
              {
                if (*(void *)v1406 != v372) {
                  objc_enumerationMutation(v369);
                }
                v374 = *(void **)(*((void *)&v1405 + 1) + 8 * v373);
                objc_opt_class();
                if (objc_opt_isKindOfClass())
                {
                  v375 = [GEOPDSearchEnrichmentRevisionMetadata alloc];
                  if (v375) {
                    uint64_t v376 = (void *)-[GEOPDSearchEnrichmentRevisionMetadata _initWithDictionary:isJSON:]((uint64_t)v375, v374, a3);
                  }
                  else {
                    uint64_t v376 = 0;
                  }
                  -[GEOPDCategorySearchParameters addSearchEnrichmentRevisionMetadata:]((uint64_t)v254, v376);
                }
                ++v373;
              }
              while (v371 != v373);
              uint64_t v377 = [v369 countByEnumeratingWithState:&v1405 objects:&v1429 count:16];
              uint64_t v371 = v377;
            }
            while (v377);
          }

          id v253 = v1393;
        }

        if (a3) {
          v378 = @"searchSessionData";
        }
        else {
          v378 = @"search_session_data";
        }
        id v379 = [v253 objectForKeyedSubscript:v378];
        objc_opt_class();
        v250 = obja;
        if (objc_opt_isKindOfClass())
        {
          uint64_t v380 = -[GEOACResult _initWithDictionary:isJSON:]([GEOPDSSearchSessionData alloc], v379);
          -[GEOPDCategorySearchParameters setSearchSessionData:]((uint64_t)v254, v380);
        }
        if (a3) {
          uint64_t v381 = @"sessionUserActionMetadata";
        }
        else {
          uint64_t v381 = @"session_user_action_metadata";
        }
        uint64_t v382 = [v253 objectForKeyedSubscript:v381];
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          v383 = [GEOPDSSessionUserActionMetadata alloc];
          if (a3) {
            uint64_t v384 = [(GEOPDSSessionUserActionMetadata *)v383 initWithJSON:v382];
          }
          else {
            uint64_t v384 = [(GEOPDSSessionUserActionMetadata *)v383 initWithDictionary:v382];
          }
          v385 = v384;
          -[GEOPDCategorySearchParameters setSessionUserActionMetadata:]((uint64_t)v254, v384);
        }
        if (a3) {
          v386 = @"paginationParameters";
        }
        else {
          v386 = @"pagination_parameters";
        }
        uint64_t v387 = [v253 objectForKeyedSubscript:v386];
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          v388 = [GEOPDPaginationParameters alloc];
          if (v388) {
            v389 = (void *)-[GEOPDPaginationParameters _initWithDictionary:isJSON:](v388, v387, a3);
          }
          else {
            v389 = 0;
          }
          -[GEOPDCategorySearchParameters setPaginationParameters:]((uint64_t)v254, v389);
        }
        goto LABEL_869;
      }
      int v330 = [v328 intValue];
    }
    *(uint32_t *)((char *)&v254->_os_unfair_lock_opaque + v257[206]) |= 0x10000000u;
    *(uint32_t *)((char *)&v254->_os_unfair_lock_opaque + v257[206]) |= 0x10u;
    v254[69]._os_unfair_lock_opaque = v330;
    goto LABEL_756;
  }
LABEL_871:

  if (a3) {
    v390 = @"popularNearbySearchParameters";
  }
  else {
    v390 = @"popular_nearby_search_parameters";
  }
  v391 = [v1357 objectForKeyedSubscript:v390];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v392 = [GEOPDPopularNearbySearchParameters alloc];
    if (!v392)
    {
LABEL_912:
      -[GEOPDPlaceRequestParameters setPopularNearbySearchParameters:]((uint64_t)v1335, v392);

      goto LABEL_913;
    }
    id v393 = v391;
    v392 = [(GEOPDPopularNearbySearchParameters *)v392 init];
    if (!v392)
    {
LABEL_911:

      goto LABEL_912;
    }
    if (a3) {
      v394 = @"maxResults";
    }
    else {
      v394 = @"max_results";
    }
    v395 = [v393 objectForKeyedSubscript:v394];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      unsigned int v396 = [v395 unsignedIntValue];
      *(unsigned char *)&v392->_flags |= 0x20u;
      *(unsigned char *)&v392->_flags |= 1u;
      v392->_maxResults = v396;
    }

    if (a3) {
      uint64_t v397 = @"viewportInfo";
    }
    else {
      uint64_t v397 = @"viewport_info";
    }
    uint64_t v398 = [v393 objectForKeyedSubscript:v397];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      uint64_t v399 = [GEOPDViewportInfo alloc];
      if (a3) {
        v400 = [(GEOPDViewportInfo *)v399 initWithJSON:v398];
      }
      else {
        v400 = [(GEOPDViewportInfo *)v399 initWithDictionary:v398];
      }
      id v401 = v400;
      -[GEOPDPopularNearbySearchParameters setViewportInfo:]((uint64_t)v392, v400);
    }
    if (a3) {
      uint64_t v402 = @"suggestionEntryMetadata";
    }
    else {
      uint64_t v402 = @"suggestion_entry_metadata";
    }
    uint64_t v403 = [v393 objectForKeyedSubscript:v402];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      uint64_t v404 = (void *)[objc_alloc(MEMORY[0x1E4F1C9B8]) initWithBase64EncodedString:v403 options:0];
      -[GEOPDPopularNearbySearchParameters setSuggestionEntryMetadata:]((uint64_t)v392, v404);
    }
    if (a3) {
      v405 = @"searchType";
    }
    else {
      v405 = @"search_type";
    }
    v406 = [v393 objectForKeyedSubscript:v405];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v407 = v406;
      if ([v407 isEqualToString:@"POPULAR_NEARBY_SEARCH_TYPE_UNKNOWN"])
      {
        int v408 = 0;
      }
      else if ([v407 isEqualToString:@"POPULAR_NEARBY_SEARCH_TYPE_DEFAULT"])
      {
        int v408 = 1;
      }
      else if ([v407 isEqualToString:@"POPULAR_NEARBY_SEARCH_TYPE_REDO"])
      {
        int v408 = 2;
      }
      else
      {
        int v408 = 0;
      }
    }
    else
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
LABEL_910:

        goto LABEL_911;
      }
      int v408 = [v406 intValue];
    }
    *(unsigned char *)&v392->_flags |= 0x20u;
    *(unsigned char *)&v392->_flags |= 2u;
    v392->_searchType = v408;
    goto LABEL_910;
  }
LABEL_913:

  if (a3) {
    unint64_t v409 = @"searchZeroKeywordCategorySuggestionParameters";
  }
  else {
    unint64_t v409 = @"search_zero_keyword_category_suggestion_parameters";
  }
  uint64_t v410 = [v1357 objectForKeyedSubscript:v409];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    unint64_t v411 = [GEOPDSearchZeroKeywordCategorySuggestionParameters alloc];
    if (!v411)
    {
LABEL_965:
      -[GEOPDPlaceRequestParameters setSearchZeroKeywordCategorySuggestionParameters:]((uint64_t)v1335, v411);

      goto LABEL_966;
    }
    id v412 = v410;
    unint64_t v411 = [(GEOPDSearchZeroKeywordCategorySuggestionParameters *)v411 init];
    if (!v411)
    {
LABEL_964:

      goto LABEL_965;
    }
    if (a3) {
      v413 = @"requestLocalTimestamp";
    }
    else {
      v413 = @"request_local_timestamp";
    }
    v414 = [v412 objectForKeyedSubscript:v413];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      [v414 doubleValue];
      *(unsigned char *)&v411->_flags |= 1u;
      v411->_requestLocalTimestamp = v415;
    }

    if (a3) {
      v416 = @"significantLocation";
    }
    else {
      v416 = @"significant_location";
    }
    v417 = [v412 objectForKeyedSubscript:v416];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v418 = [GEOLatLng alloc];
      if (a3) {
        v419 = [(GEOLatLng *)v418 initWithJSON:v417];
      }
      else {
        v419 = [(GEOLatLng *)v418 initWithDictionary:v417];
      }
      id v420 = v419;
      -[GEOPDSearchZeroKeywordCategorySuggestionParameters setSignificantLocation:]((uint64_t)v411, v419);
    }
    if (a3) {
      uint64_t v421 = @"maxNumCategoriesPerEntry";
    }
    else {
      uint64_t v421 = @"max_num_categories_per_entry";
    }
    uint64_t v422 = [v412 objectForKeyedSubscript:v421];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      unsigned int v423 = [v422 unsignedIntValue];
      *(unsigned char *)&v411->_flags |= 2u;
      v411->_maxNumCategoriesPerEntry = v423;
    }

    if (a3) {
      v424 = @"userPreferredTransportType";
    }
    else {
      v424 = @"user_preferred_transport_type";
    }
    v425 = [v412 objectForKeyedSubscript:v424];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v426 = v425;
      if ([v426 isEqualToString:@"PREFERRED_TRANSPORT_TYPE_NONE"])
      {
        int v427 = 0;
      }
      else if ([v426 isEqualToString:@"PREFERRED_TRANSPORT_TYPE_DRIVING"])
      {
        int v427 = 1;
      }
      else if ([v426 isEqualToString:@"PREFERRED_TRANSPORT_TYPE_WALKING"])
      {
        int v427 = 2;
      }
      else if ([v426 isEqualToString:@"PREFERRED_TRANSPORT_TYPE_TRANSIT"])
      {
        int v427 = 3;
      }
      else if ([v426 isEqualToString:@"PREFERRED_TRANSPORT_TYPE_RIDESHARE"])
      {
        int v427 = 4;
      }
      else if ([v426 isEqualToString:@"PREFERRED_TRANSPORT_TYPE_CYCLING"])
      {
        int v427 = 5;
      }
      else
      {
        int v427 = 0;
      }
    }
    else
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
LABEL_958:

        if (a3) {
          v428 = @"shouldMatchNoQueryStateSuggestions";
        }
        else {
          v428 = @"should_match_no_query_state_suggestions";
        }
        id v429 = [v412 objectForKeyedSubscript:v428];
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          char v430 = [v429 BOOLValue];
          *(unsigned char *)&v411->_flags |= 8u;
          v411->_shouldMatchNoQueryStateSuggestions = v430;
        }

        goto LABEL_964;
      }
      int v427 = [v425 intValue];
    }
    *(unsigned char *)&v411->_flags |= 4u;
    v411->_userPreferredTransportType = v427;
    goto LABEL_958;
  }
LABEL_966:

  if (a3) {
    uint64_t v431 = @"searchFieldPlaceholderParameters";
  }
  else {
    uint64_t v431 = @"search_field_placeholder_parameters";
  }
  uint64_t v432 = [v1357 objectForKeyedSubscript:v431];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v433 = [GEOPDSearchFieldPlaceholderParameters alloc];
    if (!v433)
    {
LABEL_987:
      -[GEOPDPlaceRequestParameters setSearchFieldPlaceholderParameters:]((uint64_t)v1335, v433);

      goto LABEL_988;
    }
    id v434 = v432;
    v433 = [(GEOPDSearchFieldPlaceholderParameters *)v433 init];
    if (!v433)
    {
LABEL_986:

      goto LABEL_987;
    }
    v435 = [v434 objectForKeyedSubscript:@"version"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v436 = v435;
      if ([v436 isEqualToString:@"VERSION_1"]) {
        int v437 = 0;
      }
      else {
        int v437 = [v436 isEqualToString:@"VERSION_2"];
      }
    }
    else
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
LABEL_980:

        if (a3) {
          uint64_t v438 = @"isEditServerRecommendedStop";
        }
        else {
          uint64_t v438 = @"is_edit_server_recommended_stop";
        }
        uint64_t v439 = [v434 objectForKeyedSubscript:v438];
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          char v440 = [v439 BOOLValue];
          *(unsigned char *)&v433->_flags |= 2u;
          v433->_isEditServerRecommendedStop = v440;
        }

        goto LABEL_986;
      }
      int v437 = [v435 intValue];
    }
    *(unsigned char *)&v433->_flags |= 1u;
    v433->_versiouint64_t n = v437;
    goto LABEL_980;
  }
LABEL_988:

  if (a3) {
    uint64_t v441 = @"batchPopularNearbySearchParameters";
  }
  else {
    uint64_t v441 = @"batch_popular_nearby_search_parameters";
  }
  v442 = [v1357 objectForKeyedSubscript:v441];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v443 = [GEOPDBatchPopularNearbySearchParameters alloc];
    if (v443)
    {
      id v444 = v442;
      v443 = [(GEOPDBatchPopularNearbySearchParameters *)v443 init];
      if (v443)
      {
        if (a3) {
          uint64_t v445 = @"maxResults";
        }
        else {
          uint64_t v445 = @"max_results";
        }
        v446 = [v444 objectForKeyedSubscript:v445];
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          unsigned int v447 = [v446 unsignedIntValue];
          *(unsigned char *)&v443->_flags |= 0x20u;
          *(unsigned char *)&v443->_flags |= 2u;
          v443->_maxResults = v447;
        }

        if (a3) {
          v448 = @"viewportInfo";
        }
        else {
          v448 = @"viewport_info";
        }
        v449 = [v444 objectForKeyedSubscript:v448];
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          uint64_t v450 = [GEOPDViewportInfo alloc];
          if (a3) {
            unint64_t v451 = [(GEOPDViewportInfo *)v450 initWithJSON:v449];
          }
          else {
            unint64_t v451 = [(GEOPDViewportInfo *)v450 initWithDictionary:v449];
          }
          uint64_t v452 = v451;
          -[GEOPDBatchPopularNearbySearchParameters setViewportInfo:]((uint64_t)v443, v451);
        }
        if (a3) {
          unint64_t v453 = @"requestLocalTimestamp";
        }
        else {
          unint64_t v453 = @"request_local_timestamp";
        }
        v454 = [v444 objectForKeyedSubscript:v453];
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          [v454 doubleValue];
          *(unsigned char *)&v443->_flags |= 0x20u;
          *(unsigned char *)&v443->_flags |= 1u;
          v443->_requestLocalTimestamp = v455;
        }

        if (a3) {
          v456 = @"suggestionEntryMetadata";
        }
        else {
          v456 = @"suggestion_entry_metadata";
        }
        uint64_t v457 = [v444 objectForKeyedSubscript:v456];
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          id v1394 = v444;
          long long v1448 = 0u;
          long long v1447 = 0u;
          long long v1446 = 0u;
          long long v1445 = 0u;
          id v458 = v457;
          uint64_t v459 = [v458 countByEnumeratingWithState:&v1445 objects:v1449 count:16];
          if (v459)
          {
            uint64_t v460 = v459;
            uint64_t v461 = *(void *)v1446;
            do
            {
              for (uint64_t i1 = 0; i1 != v460; ++i1)
              {
                if (*(void *)v1446 != v461) {
                  objc_enumerationMutation(v458);
                }
                uint64_t v463 = *(void *)(*((void *)&v1445 + 1) + 8 * i1);
                objc_opt_class();
                if (objc_opt_isKindOfClass())
                {
                  v464 = (void *)[objc_alloc(MEMORY[0x1E4F1C9B8]) initWithBase64EncodedString:v463 options:0];
                  -[GEOPDBatchPopularNearbySearchParameters addSuggestionEntryMetadata:]((uint64_t)v443, v464);
                }
              }
              uint64_t v460 = [v458 countByEnumeratingWithState:&v1445 objects:v1449 count:16];
            }
            while (v460);
          }

          a3 = v1379;
          id v444 = v1394;
        }
      }
    }
    -[GEOPDPlaceRequestParameters setBatchPopularNearbySearchParameters:]((uint64_t)v1335, v443);
  }
  if (a3) {
    v465 = @"vendorSpecificPlaceRefinementParameters";
  }
  else {
    v465 = @"vendor_specific_place_refinement_parameters";
  }
  v466 = [v1357 objectForKeyedSubscript:v465];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v467 = [GEOPDVendorSpecificPlaceRefinementParameters alloc];
    if (!v467)
    {
      uint64_t v470 = 0;
LABEL_1171:
      -[GEOPDPlaceRequestParameters setVendorSpecificPlaceRefinementParameters:]((uint64_t)v1335, (void *)v470);

      goto LABEL_1172;
    }
    id v468 = v467;
    id v469 = v466;
    uint64_t v470 = [(GEOPDVendorSpecificPlaceRefinementParameters *)v468 init];
    if (!v470)
    {
LABEL_1170:

      goto LABEL_1171;
    }
    if (a3) {
      uint64_t v471 = @"resultProviderId";
    }
    else {
      uint64_t v471 = @"result_provider_id";
    }
    v472 = [v469 objectForKeyedSubscript:v471];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      int v473 = [v472 intValue];
      *(_WORD *)(v470 + 112) |= 0x1000u;
      *(_WORD *)(v470 + 112) |= 8u;
      *(_DWORD *)(v470 + 108) = v473;
    }

    uint64_t v474 = [v469 objectForKeyedSubscript:@"muid"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      uint64_t v475 = [v474 unsignedLongLongValue];
      *(_WORD *)(v470 + 112) |= 0x1000u;
      *(_WORD *)(v470 + 112) |= 1u;
      *(void *)(v470 + 64) = v475;
    }

    if (a3) {
      uint64_t v476 = @"vendorId";
    }
    else {
      uint64_t v476 = @"vendor_id";
    }
    v477 = [v469 objectForKeyedSubscript:v476];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      uint64_t v478 = (void *)[v477 copy];
      -[GEOPDVendorSpecificPlaceRefinementParameters setVendorId:](v470, v478);
    }
    if (v1379) {
      v479 = @"externalItemId";
    }
    else {
      v479 = @"external_item_id";
    }
    v480 = [v469 objectForKeyedSubscript:v479];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v481 = (void *)[v480 copy];
      -[GEOPDVendorSpecificPlaceRefinementParameters setExternalItemId:](v470, v481);
    }
    unsigned int v482 = v1379;
    if (v1379) {
      uint64_t v483 = @"locationHint";
    }
    else {
      uint64_t v483 = @"location_hint";
    }
    v484 = [v469 objectForKeyedSubscript:v483];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      uint64_t v485 = [GEOLatLng alloc];
      if (v1379) {
        v486 = [(GEOLatLng *)v485 initWithJSON:v484];
      }
      else {
        v486 = [(GEOLatLng *)v485 initWithDictionary:v484];
      }
      uint64_t v487 = v486;
      -[GEOPDVendorSpecificPlaceRefinementParameters setLocationHint:](v470, v486);

      unsigned int v482 = v1379;
    }

    if (v482) {
      v488 = @"addressHint";
    }
    else {
      v488 = @"address_hint";
    }
    id v489 = [v469 objectForKeyedSubscript:v488];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v490 = [GEOStructuredAddress alloc];
      if (v482) {
        uint64_t v491 = [(GEOStructuredAddress *)v490 initWithJSON:v489];
      }
      else {
        uint64_t v491 = [(GEOStructuredAddress *)v490 initWithDictionary:v489];
      }
      uint64_t v492 = v491;
      -[GEOPDVendorSpecificPlaceRefinementParameters setAddressHint:](v470, v491);

      unsigned int v482 = v1379;
    }

    if (v482) {
      v493 = @"placeNameHint";
    }
    else {
      v493 = @"place_name_hint";
    }
    v494 = [v469 objectForKeyedSubscript:v493];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      uint64_t v495 = (void *)[v494 copy];
      -[GEOPDVendorSpecificPlaceRefinementParameters setPlaceNameHint:](v470, v495);
    }
    if (v1379) {
      v496 = @"formattedAddressLineHint";
    }
    else {
      v496 = @"formatted_address_line_hint";
    }
    v497 = [v469 objectForKeyedSubscript:v496];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      long long v1448 = 0u;
      long long v1447 = 0u;
      long long v1446 = 0u;
      long long v1445 = 0u;
      id v498 = v497;
      uint64_t v499 = [v498 countByEnumeratingWithState:&v1445 objects:v1449 count:16];
      if (v499)
      {
        uint64_t v500 = v499;
        uint64_t v501 = *(void *)v1446;
        do
        {
          for (uint64_t i2 = 0; i2 != v500; ++i2)
          {
            if (*(void *)v1446 != v501) {
              objc_enumerationMutation(v498);
            }
            uint64_t v503 = *(void **)(*((void *)&v1445 + 1) + 8 * i2);
            objc_opt_class();
            if (objc_opt_isKindOfClass())
            {
              v504 = (void *)[v503 copy];
              -[GEOPDVendorSpecificPlaceRefinementParameters addFormattedAddressLineHint:](v470, v504);
            }
          }
          uint64_t v500 = [v498 countByEnumeratingWithState:&v1445 objects:v1449 count:16];
        }
        while (v500);
      }
    }
    if (v1379) {
      v505 = @"placeTypeHint";
    }
    else {
      v505 = @"place_type_hint";
    }
    uint64_t v506 = [v469 objectForKeyedSubscript:v505];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v507 = v506;
      if ([v507 isEqualToString:@"UNKNOWN_PLACE_TYPE"])
      {
        int v508 = 0;
      }
      else if ([v507 isEqualToString:@"COUNTRY"])
      {
        int v508 = 1;
      }
      else if ([v507 isEqualToString:@"ADMINISTRATIVE_AREA"])
      {
        int v508 = 2;
      }
      else if ([v507 isEqualToString:@"SUB_ADMINISTRATIVE_AREA"])
      {
        int v508 = 4;
      }
      else if ([v507 isEqualToString:@"LOCALITY"])
      {
        int v508 = 16;
      }
      else if ([v507 isEqualToString:@"TIME_ZONE"])
      {
        int v508 = 35;
      }
      else if ([v507 isEqualToString:@"SUB_LOCALITY"])
      {
        int v508 = 43;
      }
      else if ([v507 isEqualToString:@"OCEAN"])
      {
        int v508 = 44;
      }
      else if ([v507 isEqualToString:@"AOI"])
      {
        int v508 = 45;
      }
      else if ([v507 isEqualToString:@"INLAND_WATER"])
      {
        int v508 = 46;
      }
      else if ([v507 isEqualToString:@"BUSINESS"])
      {
        int v508 = 47;
      }
      else if ([v507 isEqualToString:@"ISLAND"])
      {
        int v508 = 48;
      }
      else if ([v507 isEqualToString:@"STREET"])
      {
        int v508 = 49;
      }
      else if ([v507 isEqualToString:@"ADMIN"])
      {
        int v508 = 50;
      }
      else if ([v507 isEqualToString:@"POSTAL"])
      {
        int v508 = 51;
      }
      else if ([v507 isEqualToString:@"INTERSECTION"])
      {
        int v508 = 54;
      }
      else if ([v507 isEqualToString:@"BUILDING"])
      {
        int v508 = 55;
      }
      else if ([v507 isEqualToString:@"ADDRESS"])
      {
        int v508 = 57;
      }
      else if ([v507 isEqualToString:@"CONTINENT"])
      {
        int v508 = 61;
      }
      else if ([v507 isEqualToString:@"REGION"])
      {
        int v508 = 63;
      }
      else if ([v507 isEqualToString:@"DIVISION"])
      {
        int v508 = 64;
      }
      else if ([v507 isEqualToString:@"PHYSICAL_FEATURE"])
      {
        int v508 = 65;
      }
      else
      {
        int v508 = 0;
      }
    }
    else
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0) {
        goto LABEL_1143;
      }
      int v508 = [v506 intValue];
    }
    *(_WORD *)(v470 + 112) |= 0x1000u;
    *(_WORD *)(v470 + 112) |= 4u;
    *(_DWORD *)(v470 + 104) = v508;
LABEL_1143:

    if (v1379) {
      id v509 = @"addressGeocodeAccuracyHint";
    }
    else {
      id v509 = @"address_geocode_accuracy_hint";
    }
    uint64_t v510 = [v469 objectForKeyedSubscript:v509];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v511 = v510;
      if ([v511 isEqualToString:@"POINT"])
      {
        int v512 = 0;
      }
      else if ([v511 isEqualToString:@"INTERPOLATION"])
      {
        int v512 = 1;
      }
      else if ([v511 isEqualToString:@"APPROXIMATE"])
      {
        int v512 = 2;
      }
      else if ([v511 isEqualToString:@"POSTAL_ZIP"])
      {
        int v512 = 3;
      }
      else if ([v511 isEqualToString:@"PARCEL"])
      {
        int v512 = 4;
      }
      else if ([v511 isEqualToString:@"SUBPREMISE"])
      {
        int v512 = 5;
      }
      else
      {
        int v512 = 0;
      }
    }
    else
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
LABEL_1164:

        if (v1379) {
          v513 = @"addressObjectHint";
        }
        else {
          v513 = @"address_object_hint";
        }
        v514 = [v469 objectForKeyedSubscript:v513];
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          uint64_t v515 = (void *)[objc_alloc(MEMORY[0x1E4F1C9B8]) initWithBase64EncodedString:v514 options:0];
          -[GEOPDVendorSpecificPlaceRefinementParameters setAddressObjectHint:](v470, v515);
        }
        a3 = v1379;
        goto LABEL_1170;
      }
      int v512 = [v510 intValue];
    }
    *(_WORD *)(v470 + 112) |= 0x1000u;
    *(_WORD *)(v470 + 112) |= 2u;
    *(_DWORD *)(v470 + 100) = v512;
    goto LABEL_1164;
  }
LABEL_1172:

  if (a3) {
    v516 = @"nearbySearchParameters";
  }
  else {
    v516 = @"nearby_search_parameters";
  }
  v517 = [v1357 objectForKeyedSubscript:v516];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v518 = [GEOPDNearbySearchParameters alloc];
    if (!v518)
    {
LABEL_1250:
      -[GEOPDPlaceRequestParameters setNearbySearchParameters:]((uint64_t)v1335, v518);

      goto LABEL_1251;
    }
    id v519 = v517;
    v518 = [(GEOPDNearbySearchParameters *)v518 init];
    if (!v518)
    {
LABEL_1249:

      goto LABEL_1250;
    }
    if (a3) {
      uint64_t v520 = @"sortOrder";
    }
    else {
      uint64_t v520 = @"sort_order";
    }
    v521 = [v519 objectForKeyedSubscript:v520];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v522 = v521;
      if ([v522 isEqualToString:@"RELEVANCE"])
      {
        int v523 = 0;
      }
      else if ([v522 isEqualToString:@"RATING"])
      {
        int v523 = 1;
      }
      else if ([v522 isEqualToString:@"DISTANCE"])
      {
        int v523 = 2;
      }
      else if ([v522 isEqualToString:@"PRICE"])
      {
        int v523 = 3;
      }
      else
      {
        int v523 = 0;
      }
    }
    else
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0) {
        goto LABEL_1195;
      }
      int v523 = [v521 intValue];
    }
    *(unsigned char *)&v518->_flags |= 0x20u;
    *(unsigned char *)&v518->_flags |= 2u;
    v518->_sortOrder = v523;
LABEL_1195:

    if (a3) {
      v524 = @"maxResults";
    }
    else {
      v524 = @"max_results";
    }
    v525 = [v519 objectForKeyedSubscript:v524];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      unsigned int v526 = [v525 unsignedIntValue];
      *(unsigned char *)&v518->_flags |= 0x20u;
      *(unsigned char *)&v518->_flags |= 1u;
      v518->_maxResults = v526;
    }

    if (a3) {
      uint64_t v527 = @"viewportInfo";
    }
    else {
      uint64_t v527 = @"viewport_info";
    }
    v528 = [v519 objectForKeyedSubscript:v527];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v529 = [GEOPDViewportInfo alloc];
      if (a3) {
        v530 = [(GEOPDViewportInfo *)v529 initWithJSON:v528];
      }
      else {
        v530 = [(GEOPDViewportInfo *)v529 initWithDictionary:v528];
      }
      v531 = v530;
      -[GEOPDNearbySearchParameters setViewportInfo:]((uint64_t)v518, v530);
    }
    if (a3) {
      v532 = @"nearbySearchFilter";
    }
    else {
      v532 = @"nearby_search_filter";
    }
    uint64_t v533 = [v519 objectForKeyedSubscript:v532];
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0) {
      goto LABEL_1248;
    }
    v534 = [GEOPDNearbySearchFilter alloc];
    if (!v534)
    {
LABEL_1247:
      -[GEOPDNearbySearchParameters setNearbySearchFilter:]((uint64_t)v518, v534);

LABEL_1248:
      goto LABEL_1249;
    }
    id v535 = v533;
    v534 = [(GEOPDNearbySearchFilter *)v534 init];
    if (!v534)
    {
LABEL_1246:

      goto LABEL_1247;
    }
    if (a3) {
      uint64_t v536 = @"includedCategoryFilter";
    }
    else {
      uint64_t v536 = @"included_category_filter";
    }
    uint64_t v537 = [v535 objectForKeyedSubscript:v536];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id objb = v535;
      id v1395 = v533;
      long long v1448 = 0u;
      long long v1447 = 0u;
      long long v1446 = 0u;
      long long v1445 = 0u;
      v1369 = v537;
      id v538 = v537;
      uint64_t v539 = [v538 countByEnumeratingWithState:&v1445 objects:v1449 count:16];
      if (v539)
      {
        uint64_t v540 = v539;
        uint64_t v541 = *(void *)v1446;
        do
        {
          for (uint64_t i3 = 0; i3 != v540; ++i3)
          {
            if (*(void *)v1446 != v541) {
              objc_enumerationMutation(v538);
            }
            id v543 = *(void **)(*((void *)&v1445 + 1) + 8 * i3);
            objc_opt_class();
            if (objc_opt_isKindOfClass())
            {
              uint64_t v544 = (void *)[v543 copy];
              -[GEOPDNearbySearchFilter addIncludedCategoryFilter:]((uint64_t)v534, v544);
            }
          }
          uint64_t v540 = [v538 countByEnumeratingWithState:&v1445 objects:v1449 count:16];
        }
        while (v540);
      }

      a3 = v1379;
      id v535 = objb;
      uint64_t v533 = v1395;
      uint64_t v537 = v1369;
    }

    if (a3) {
      uint64_t v545 = @"poiAgeFilter";
    }
    else {
      uint64_t v545 = @"poi_age_filter";
    }
    uint64_t v546 = [v535 objectForKeyedSubscript:v545];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v547 = v535;
      id v548 = v546;
      if ([v548 isEqualToString:@"POI_AGE_FILTER_NONE"])
      {
        int v549 = 0;
      }
      else if ([v548 isEqualToString:@"POI_AGE_FILTER_LAST_MONTH"])
      {
        int v549 = 1;
      }
      else if ([v548 isEqualToString:@"POI_AGE_FILTER_LAST_6_MONTHS"])
      {
        int v549 = 2;
      }
      else if ([v548 isEqualToString:@"POI_AGE_FILTER_SERVER"])
      {
        int v549 = 10;
      }
      else
      {
        int v549 = 0;
      }

      id v535 = v547;
    }
    else
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
LABEL_1245:

        goto LABEL_1246;
      }
      int v549 = [v546 intValue];
    }
    *(unsigned char *)&v534->_flags |= 1u;
    v534->_poiAgeFilter = v549;
    a3 = v1379;
    goto LABEL_1245;
  }
LABEL_1251:

  if (a3) {
    uint64_t v550 = @"addressObjectGeocodingParameters";
  }
  else {
    uint64_t v550 = @"address_object_geocoding_parameters";
  }
  v551 = [v1357 objectForKeyedSubscript:v550];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v552 = [GEOPDAddressObjectGeocodingParameters alloc];
    if (v552)
    {
      id v553 = v551;
      v552 = [(GEOPDAddressObjectGeocodingParameters *)v552 init];
      if (v552)
      {
        if (a3) {
          v554 = @"addressObject";
        }
        else {
          v554 = @"address_object";
        }
        uint64_t v555 = [v553 objectForKeyedSubscript:v554];
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          v556 = (void *)[objc_alloc(MEMORY[0x1E4F1C9B8]) initWithBase64EncodedString:v555 options:0];
          -[GEOPDAddressObjectGeocodingParameters setAddressObject:]((uint64_t)v552, v556);
        }
        if (a3) {
          id v557 = @"maxResults";
        }
        else {
          id v557 = @"max_results";
        }
        v558 = [v553 objectForKeyedSubscript:v557];
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          unsigned int v559 = [v558 unsignedIntValue];
          *(unsigned char *)&v552->_flags |= 0x10u;
          *(unsigned char *)&v552->_flags |= 1u;
          v552->_maxResults = v559;
        }

        if (a3) {
          v560 = @"viewportInfo";
        }
        else {
          v560 = @"viewport_info";
        }
        v561 = [v553 objectForKeyedSubscript:v560];
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          id v562 = [GEOPDViewportInfo alloc];
          if (a3) {
            uint64_t v563 = [(GEOPDViewportInfo *)v562 initWithJSON:v561];
          }
          else {
            uint64_t v563 = [(GEOPDViewportInfo *)v562 initWithDictionary:v561];
          }
          unint64_t v564 = v563;
          -[GEOPDAddressObjectGeocodingParameters setViewportInfo:]((uint64_t)v552, v563);
        }
      }
    }
    -[GEOPDPlaceRequestParameters setAddressObjectGeocodingParameters:]((uint64_t)v1335, v552);
  }
  if (a3) {
    uint64_t v565 = @"searchZeroKeywordWithSearchResultsSuggestionParameters";
  }
  else {
    uint64_t v565 = @"search_zero_keyword_with_search_results_suggestion_parameters";
  }
  unint64_t v566 = [v1357 objectForKeyedSubscript:v565];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v567 = [GEOPDSearchZeroKeywordWithSearchResultsSuggestionParameters alloc];
    if (v567)
    {
      id v568 = v566;
      v567 = [(GEOPDSearchZeroKeywordWithSearchResultsSuggestionParameters *)v567 init];
      if (v567)
      {
        if (a3) {
          v569 = @"maxCategories";
        }
        else {
          v569 = @"max_categories";
        }
        uint64_t v570 = [v568 objectForKeyedSubscript:v569];
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          unsigned int v571 = [v570 unsignedIntValue];
          *(unsigned char *)&v567->_flags |= 4u;
          v567->_maxCategories = v571;
        }

        if (a3) {
          uint64_t v572 = @"maxResultsPerCategory";
        }
        else {
          uint64_t v572 = @"max_results_per_category";
        }
        unint64_t v573 = [v568 objectForKeyedSubscript:v572];
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          unsigned int v574 = [v573 unsignedIntValue];
          *(unsigned char *)&v567->_flags |= 8u;
          v567->_maxResultsPerCategory = v574;
        }

        if (a3) {
          v575 = @"blurredHourOfDay";
        }
        else {
          v575 = @"blurred_hour_of_day";
        }
        v576 = [v568 objectForKeyedSubscript:v575];
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          unsigned int v577 = [v576 unsignedIntValue];
          *(unsigned char *)&v567->_flags |= 1u;
          v567->_blurredHourOfDay = v577;
        }

        if (a3) {
          uint64_t v578 = @"dayOfWeek";
        }
        else {
          uint64_t v578 = @"day_of_week";
        }
        uint64_t v579 = [v568 objectForKeyedSubscript:v578];
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          unsigned int v580 = [v579 unsignedIntValue];
          *(unsigned char *)&v567->_flags |= 2u;
          v567->_dayOfWeeuint64_t k = v580;
        }
      }
    }
    -[GEOPDPlaceRequestParameters setSearchZeroKeywordWithSearchResultsSuggestionParameters:]((uint64_t)v1335, v567);
  }
  if (a3) {
    uint64_t v581 = @"externalTransitLookupParameters";
  }
  else {
    uint64_t v581 = @"external_transit_lookup_parameters";
  }
  v582 = [v1357 objectForKeyedSubscript:v581];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v583 = [GEOPDExternalTransitLookupParameters alloc];
    if (v583)
    {
      id v584 = v582;
      id v583 = [(GEOPDExternalTransitLookupParameters *)v583 init];
      if (v583)
      {
        if (a3) {
          v585 = @"transactionTimestamp";
        }
        else {
          v585 = @"transaction_timestamp";
        }
        v586 = [v584 objectForKeyedSubscript:v585];
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          [v586 doubleValue];
          *(unsigned char *)&v583->_flags |= 0x20u;
          *(unsigned char *)&v583->_flags |= 1u;
          v583->_transactionTimestamp = v587;
        }

        if (a3) {
          v588 = @"transactionLocation";
        }
        else {
          v588 = @"transaction_location";
        }
        id v589 = [v584 objectForKeyedSubscript:v588];
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          uint64_t v590 = [GEOLocation alloc];
          if (a3) {
            uint64_t v591 = [(GEOLocation *)v590 initWithJSON:v589];
          }
          else {
            uint64_t v591 = [(GEOLocation *)v590 initWithDictionary:v589];
          }
          uint64_t v592 = v591;
          -[GEOPDExternalTransitLookupParameters setTransactionLocation:]((uint64_t)v583, v591);
        }
        if (a3) {
          v593 = @"sourceId";
        }
        else {
          v593 = @"source_id";
        }
        uint64_t v594 = [v584 objectForKeyedSubscript:v593];
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          v595 = (void *)[v594 copy];
          -[GEOPDExternalTransitLookupParameters setSourceId:]((uint64_t)v583, v595);
        }
        if (a3) {
          uint64_t v596 = @"externalTransitStationCode";
        }
        else {
          uint64_t v596 = @"external_transit_station_code";
        }
        v597 = [v584 objectForKeyedSubscript:v596];
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          id v1396 = v584;
          long long v1448 = 0u;
          long long v1447 = 0u;
          long long v1446 = 0u;
          long long v1445 = 0u;
          id v598 = v597;
          uint64_t v599 = [v598 countByEnumeratingWithState:&v1445 objects:v1449 count:16];
          if (v599)
          {
            uint64_t v600 = v599;
            uint64_t v601 = *(void *)v1446;
            do
            {
              for (uint64_t i4 = 0; i4 != v600; ++i4)
              {
                if (*(void *)v1446 != v601) {
                  objc_enumerationMutation(v598);
                }
                uint64_t v603 = *(void *)(*((void *)&v1445 + 1) + 8 * i4);
                objc_opt_class();
                if (objc_opt_isKindOfClass())
                {
                  unint64_t v604 = (void *)[objc_alloc(MEMORY[0x1E4F1C9B8]) initWithBase64EncodedString:v603 options:0];
                  -[GEOPDExternalTransitLookupParameters addExternalTransitStationCode:]((uint64_t)v583, v604);
                }
              }
              uint64_t v600 = [v598 countByEnumeratingWithState:&v1445 objects:v1449 count:16];
            }
            while (v600);
          }

          a3 = v1379;
          id v584 = v1396;
        }
      }
    }
    -[GEOPDPlaceRequestParameters setExternalTransitLookupParameters:]((uint64_t)v1335, v583);
  }
  if (a3) {
    uint64_t v605 = @"featureIdGeocodingParameters";
  }
  else {
    uint64_t v605 = @"feature_id_geocoding_parameters";
  }
  unint64_t v606 = [v1357 objectForKeyedSubscript:v605];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v607 = [GEOPDFeatureIdGeocodingParameters alloc];
    if (!v607)
    {
LABEL_1395:
      -[GEOPDPlaceRequestParameters setFeatureIdGeocodingParameters:]((uint64_t)v1335, v607);

      goto LABEL_1396;
    }
    id v608 = v606;
    v607 = [(GEOPDFeatureIdGeocodingParameters *)v607 init];
    if (!v607)
    {
LABEL_1394:

      goto LABEL_1395;
    }
    if (a3) {
      v609 = @"featureId";
    }
    else {
      v609 = @"feature_id";
    }
    __int16 v610 = [v608 objectForKeyedSubscript:v609];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      uint64_t v611 = [v610 unsignedLongLongValue];
      *(unsigned char *)&v607->_flags |= 0x20u;
      *(unsigned char *)&v607->_flags |= 1u;
      v607->_featureId = v611;
    }

    if (v1379) {
      v612 = @"encryptedFeatureId";
    }
    else {
      v612 = @"encrypted_feature_id";
    }
    uint64_t v613 = [v608 objectForKeyedSubscript:v612];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      long long v1448 = 0u;
      long long v1447 = 0u;
      long long v1446 = 0u;
      long long v1445 = 0u;
      id v614 = v613;
      uint64_t v615 = [v614 countByEnumeratingWithState:&v1445 objects:v1449 count:16];
      if (v615)
      {
        uint64_t v616 = v615;
        uint64_t v617 = *(void *)v1446;
        do
        {
          for (uint64_t i5 = 0; i5 != v616; ++i5)
          {
            if (*(void *)v1446 != v617) {
              objc_enumerationMutation(v614);
            }
            uint64_t v619 = *(void **)(*((void *)&v1445 + 1) + 8 * i5);
            objc_opt_class();
            if (objc_opt_isKindOfClass())
            {
              [v619 unsignedLongLongValue];
              -[GEOPDFeatureIdGeocodingParameters addEncryptedFeatureId:]((uint64_t)v607);
            }
          }
          uint64_t v616 = [v614 countByEnumeratingWithState:&v1445 objects:v1449 count:16];
        }
        while (v616);
      }
    }
    uint64_t v620 = [v608 objectForKeyedSubscript:@"location"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v621 = [GEOLatLng alloc];
      if (v1379) {
        id v622 = [(GEOLatLng *)v621 initWithJSON:v620];
      }
      else {
        id v622 = [(GEOLatLng *)v621 initWithDictionary:v620];
      }
      v623 = v622;
      -[GEOPDFeatureIdGeocodingParameters setLocation:]((uint64_t)v607, v622);
    }
    if (v1379) {
      id v624 = @"formattedAddressType";
    }
    else {
      id v624 = @"formatted_address_type";
    }
    uint64_t v625 = [v608 objectForKeyedSubscript:v624];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v626 = v625;
      if ([v626 isEqualToString:@"FULL"])
      {
        int v627 = 0;
        a3 = v1379;
      }
      else
      {
        a3 = v1379;
        if ([v626 isEqualToString:@"SHORT"])
        {
          int v627 = 1;
        }
        else if ([v626 isEqualToString:@"SPOKEN"])
        {
          int v627 = 2;
        }
        else
        {
          int v627 = 0;
        }
      }
    }
    else
    {
      objc_opt_class();
      a3 = v1379;
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
LABEL_1393:

        goto LABEL_1394;
      }
      int v627 = [v625 intValue];
    }
    *(unsigned char *)&v607->_flags |= 0x20u;
    *(unsigned char *)&v607->_flags |= 2u;
    v607->_formattedAddressType = v627;
    goto LABEL_1393;
  }
LABEL_1396:

  if (a3) {
    v628 = @"mapsIdentifierPlaceLookupParameters";
  }
  else {
    v628 = @"maps_identifier_place_lookup_parameters";
  }
  uint64_t v629 = [v1357 objectForKeyedSubscript:v628];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v630 = [GEOPDMapsIdentifierPlaceLookupParameters alloc];
    if (v630)
    {
      id v631 = v629;
      v630 = [(GEOPDMapsIdentifierPlaceLookupParameters *)v630 init];
      if (v630)
      {
        if (a3) {
          id v632 = @"resultProviderId";
        }
        else {
          id v632 = @"result_provider_id";
        }
        uint64_t v633 = [v631 objectForKeyedSubscript:v632];
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          int v634 = [v633 intValue];
          *(unsigned char *)&v630->_flags |= 1u;
          v630->_resultProviderId = v634;
        }

        if (a3) {
          uint64_t v635 = @"mapsId";
        }
        else {
          uint64_t v635 = @"maps_id";
        }
        v636 = [v631 objectForKeyedSubscript:v635];
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          long long v1448 = 0u;
          long long v1447 = 0u;
          long long v1446 = 0u;
          long long v1445 = 0u;
          id v637 = v636;
          uint64_t v638 = [v637 countByEnumeratingWithState:&v1445 objects:v1449 count:16];
          if (v638)
          {
            uint64_t v639 = v638;
            uint64_t v640 = *(void *)v1446;
            do
            {
              for (uint64_t i6 = 0; i6 != v639; ++i6)
              {
                if (*(void *)v1446 != v640) {
                  objc_enumerationMutation(v637);
                }
                uint64_t v642 = *(void *)(*((void *)&v1445 + 1) + 8 * i6);
                objc_opt_class();
                if (objc_opt_isKindOfClass())
                {
                  v643 = [GEOPDMapsIdentifier alloc];
                  if (v1379) {
                    id v644 = [(GEOPDMapsIdentifier *)v643 initWithJSON:v642];
                  }
                  else {
                    id v644 = [(GEOPDMapsIdentifier *)v643 initWithDictionary:v642];
                  }
                  uint64_t v645 = v644;
                  -[GEOPDMapsIdentifierPlaceLookupParameters addMapsId:]((uint64_t)v630, v644);
                }
              }
              uint64_t v639 = [v637 countByEnumeratingWithState:&v1445 objects:v1449 count:16];
            }
            while (v639);
          }

          a3 = v1379;
        }

        if (a3) {
          uint64_t v646 = @"enablePartialClientization";
        }
        else {
          uint64_t v646 = @"enable_partial_clientization";
        }
        uint64_t v647 = [v631 objectForKeyedSubscript:v646];
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          char v648 = [v647 BOOLValue];
          *(unsigned char *)&v630->_flags |= 2u;
          v630->_enablePartialClientizatiouint64_t n = v648;
        }
      }
    }
    -[GEOPDPlaceRequestParameters setMapsIdentifierPlaceLookupParameters:]((uint64_t)v1335, v630);
  }
  if (a3) {
    uint64_t v649 = @"batchReverseGeocodingParameters";
  }
  else {
    uint64_t v649 = @"batch_reverse_geocoding_parameters";
  }
  v650 = [v1357 objectForKeyedSubscript:v649];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v651 = [GEOPDBatchReverseGeocodingParameters alloc];
    if (v651)
    {
      id v652 = v650;
      id v651 = [(GEOPDBatchReverseGeocodingParameters *)v651 init];
      if (v651)
      {
        if (a3) {
          uint64_t v653 = @"assetLocation";
        }
        else {
          uint64_t v653 = @"asset_location";
        }
        uint64_t v654 = [v652 objectForKeyedSubscript:v653];
        objc_opt_class();
        id objc = v652;
        if (objc_opt_isKindOfClass())
        {
          long long v1443 = 0u;
          long long v1444 = 0u;
          long long v1441 = 0u;
          long long v1442 = 0u;
          id v655 = v654;
          uint64_t v656 = [v655 countByEnumeratingWithState:&v1441 objects:v1449 count:16];
          if (v656)
          {
            uint64_t v657 = v656;
            uint64_t v658 = *(void *)v1442;
            do
            {
              for (uint64_t i7 = 0; i7 != v657; ++i7)
              {
                if (*(void *)v1442 != v658) {
                  objc_enumerationMutation(v655);
                }
                uint64_t v660 = *(void *)(*((void *)&v1441 + 1) + 8 * i7);
                objc_opt_class();
                if (objc_opt_isKindOfClass())
                {
                  id v661 = [GEOLocation alloc];
                  if (v1379) {
                    uint64_t v662 = [(GEOLocation *)v661 initWithJSON:v660];
                  }
                  else {
                    uint64_t v662 = [(GEOLocation *)v661 initWithDictionary:v660];
                  }
                  uint64_t v663 = v662;
                  -[GEOPDBatchReverseGeocodingParameters addAssetLocation:]((uint64_t)v651, v662);
                }
              }
              uint64_t v657 = [v655 countByEnumeratingWithState:&v1441 objects:v1449 count:16];
            }
            while (v657);
          }

          a3 = v1379;
          id v652 = objc;
        }

        if (a3) {
          uint64_t v664 = @"additionalPlaceType";
        }
        else {
          uint64_t v664 = @"additional_place_type";
        }
        v665 = [v652 objectForKeyedSubscript:v664];
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          long long v1439 = 0u;
          long long v1440 = 0u;
          long long v1437 = 0u;
          long long v1438 = 0u;
          v1370 = v665;
          id v666 = v665;
          uint64_t v667 = [v666 countByEnumeratingWithState:&v1437 objects:&v1445 count:16];
          if (!v667) {
            goto LABEL_1494;
          }
          uint64_t v668 = v667;
          uint64_t v669 = *(void *)v1438;
          while (1)
          {
            for (uint64_t i8 = 0; i8 != v668; ++i8)
            {
              if (*(void *)v1438 != v669) {
                objc_enumerationMutation(v666);
              }
              uint64_t v671 = *(void **)(*((void *)&v1437 + 1) + 8 * i8);
              objc_opt_class();
              if (objc_opt_isKindOfClass())
              {
                id v672 = v671;
                if (([v672 isEqualToString:@"UNKNOWN_PLACE_TYPE"] & 1) == 0
                  && ([v672 isEqualToString:@"COUNTRY"] & 1) == 0
                  && ([v672 isEqualToString:@"ADMINISTRATIVE_AREA"] & 1) == 0
                  && ([v672 isEqualToString:@"SUB_ADMINISTRATIVE_AREA"] & 1) == 0
                  && ([v672 isEqualToString:@"LOCALITY"] & 1) == 0
                  && ([v672 isEqualToString:@"TIME_ZONE"] & 1) == 0
                  && ([v672 isEqualToString:@"SUB_LOCALITY"] & 1) == 0
                  && ([v672 isEqualToString:@"OCEAN"] & 1) == 0
                  && ([v672 isEqualToString:@"AOI"] & 1) == 0
                  && ([v672 isEqualToString:@"INLAND_WATER"] & 1) == 0
                  && ([v672 isEqualToString:@"BUSINESS"] & 1) == 0
                  && ([v672 isEqualToString:@"ISLAND"] & 1) == 0
                  && ([v672 isEqualToString:@"STREET"] & 1) == 0
                  && ([v672 isEqualToString:@"ADMIN"] & 1) == 0
                  && ([v672 isEqualToString:@"POSTAL"] & 1) == 0
                  && ([v672 isEqualToString:@"INTERSECTION"] & 1) == 0
                  && ([v672 isEqualToString:@"BUILDING"] & 1) == 0
                  && ([v672 isEqualToString:@"ADDRESS"] & 1) == 0
                  && ([v672 isEqualToString:@"CONTINENT"] & 1) == 0
                  && ([v672 isEqualToString:@"REGION"] & 1) == 0
                  && ([v672 isEqualToString:@"DIVISION"] & 1) == 0)
                {
                  [v672 isEqualToString:@"PHYSICAL_FEATURE"];
                }
              }
              else
              {
                objc_opt_class();
                if ((objc_opt_isKindOfClass() & 1) == 0) {
                  continue;
                }
                [v671 intValue];
              }
              -[GEOPDBatchReverseGeocodingParameters addAdditionalPlaceType:]((uint64_t)v651);
            }
            uint64_t v668 = [v666 countByEnumeratingWithState:&v1437 objects:&v1445 count:16];
            if (!v668)
            {
LABEL_1494:

              a3 = v1379;
              id v652 = objc;
              v665 = v1370;
              break;
            }
          }
        }
      }
    }
    -[GEOPDPlaceRequestParameters setBatchReverseGeocodingParameters:]((uint64_t)v1335, v651);
  }
  if (a3) {
    v673 = @"brandLookupParameters";
  }
  else {
    v673 = @"brand_lookup_parameters";
  }
  v674 = [v1357 objectForKeyedSubscript:v673];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v675 = [GEOPDBrandLookupParameters alloc];
    if (v675)
    {
      id v676 = v674;
      v675 = [(GEOPDBrandLookupParameters *)v675 init];
      if (v675)
      {
        if (a3) {
          v677 = @"imessageUid";
        }
        else {
          v677 = @"imessage_uid";
        }
        id v678 = [v676 objectForKeyedSubscript:v677];
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          uint64_t v679 = (void *)[v678 copy];
          -[GEOPDBrandLookupParameters setImessageUid:]((uint64_t)v675, v679);
        }
      }
    }
    -[GEOPDPlaceRequestParameters setBrandLookupParameters:]((uint64_t)v1335, v675);
  }
  if (a3) {
    uint64_t v680 = @"wifiFingerprintParameters";
  }
  else {
    uint64_t v680 = @"wifi_fingerprint_parameters";
  }
  uint64_t v681 = [v1357 objectForKeyedSubscript:v680];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v682 = [GEOPDWifiFingerprintParameters alloc];
    if (v682)
    {
      uint64_t v683 = v682;
      id v684 = v681;
      uint64_t v1352 = [(GEOPDWifiFingerprintParameters *)v683 init];
      if (v1352)
      {
        v685 = [v684 objectForKeyedSubscript:@"measurement"];
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          id v1333 = v684;
          v1334 = v681;
          long long v1431 = 0u;
          long long v1432 = 0u;
          long long v1429 = 0u;
          long long v1430 = 0u;
          v1332 = v685;
          id v1355 = v685;
          uint64_t v686 = [v1355 countByEnumeratingWithState:&v1429 objects:&v1441 count:16];
          if (v686)
          {
            uint64_t v687 = v686;
            uint64_t v688 = *(void *)v1430;
            if (a3) {
              v689 = @"wifiAccessPoint";
            }
            else {
              v689 = @"wifi_access_point";
            }
            id v690 = @"mac_id";
            if (a3) {
              id v690 = @"macId";
            }
            v1397 = v690;
            long long v691 = @"scan_timestamp";
            if (a3) {
              long long v691 = @"scanTimestamp";
            }
            objd = v691;
            long long v692 = @"entryTime";
            if (!a3) {
              long long v692 = @"entry_time";
            }
            v1340 = v692;
            v1343 = v689;
            long long v693 = @"exit_time";
            if (a3) {
              long long v693 = @"exitTime";
            }
            v1337 = v693;
            uint64_t v1346 = *(void *)v1430;
            do
            {
              uint64_t v694 = 0;
              uint64_t v1349 = v687;
              do
              {
                if (*(void *)v1430 != v688) {
                  objc_enumerationMutation(v1355);
                }
                long long v695 = *(void **)(*((void *)&v1429 + 1) + 8 * v694);
                objc_opt_class();
                if (objc_opt_isKindOfClass())
                {
                  long long v696 = [GEOPDWifiMeasurement alloc];
                  if (v696)
                  {
                    long long v697 = v696;
                    id v698 = v695;
                    uint64_t v699 = [(GEOPDWifiMeasurement *)v697 init];
                    if (v699)
                    {
                      v1371 = v698;
                      long long v700 = [v698 objectForKeyedSubscript:@"location"];
                      objc_opt_class();
                      uint64_t v1359 = v694;
                      if (objc_opt_isKindOfClass())
                      {
                        long long v1439 = 0u;
                        long long v1440 = 0u;
                        long long v1437 = 0u;
                        long long v1438 = 0u;
                        id v701 = v700;
                        uint64_t v702 = [v701 countByEnumeratingWithState:&v1437 objects:v1449 count:16];
                        if (v702)
                        {
                          uint64_t v703 = v702;
                          uint64_t v704 = *(void *)v1438;
                          do
                          {
                            for (uint64_t i9 = 0; i9 != v703; ++i9)
                            {
                              if (*(void *)v1438 != v704) {
                                objc_enumerationMutation(v701);
                              }
                              uint64_t v706 = *(void *)(*((void *)&v1437 + 1) + 8 * i9);
                              objc_opt_class();
                              if (objc_opt_isKindOfClass())
                              {
                                long long v707 = [GEOLocation alloc];
                                if (a3) {
                                  long long v708 = [(GEOLocation *)v707 initWithJSON:v706];
                                }
                                else {
                                  long long v708 = [(GEOLocation *)v707 initWithDictionary:v706];
                                }
                                long long v709 = v708;
                                -[GEOPDWifiMeasurement addLocation:](v699, v708);
                              }
                            }
                            uint64_t v703 = [v701 countByEnumeratingWithState:&v1437 objects:v1449 count:16];
                          }
                          while (v703);
                        }

                        uint64_t v688 = v1346;
                        uint64_t v687 = v1349;
                        uint64_t v694 = v1359;
                      }

                      long long v710 = v1371;
                      v711 = [v1371 objectForKeyedSubscript:v1343];
                      objc_opt_class();
                      if (objc_opt_isKindOfClass())
                      {
                        long long v1435 = 0u;
                        long long v1436 = 0u;
                        long long v1433 = 0u;
                        long long v1434 = 0u;
                        id v712 = v711;
                        uint64_t v713 = [v712 countByEnumeratingWithState:&v1433 objects:&v1445 count:16];
                        if (v713)
                        {
                          uint64_t v714 = v713;
                          uint64_t v715 = *(void *)v1434;
                          do
                          {
                            for (uint64_t i10 = 0; i10 != v714; ++i10)
                            {
                              if (*(void *)v1434 != v715) {
                                objc_enumerationMutation(v712);
                              }
                              v717 = *(void **)(*((void *)&v1433 + 1) + 8 * i10);
                              objc_opt_class();
                              if (objc_opt_isKindOfClass())
                              {
                                v718 = [GEOPDWifiAccessPoint alloc];
                                if (v718)
                                {
                                  id v719 = v717;
                                  v718 = [(GEOPDWifiAccessPoint *)v718 init];
                                  if (v718)
                                  {
                                    v720 = [v719 objectForKeyedSubscript:v1397];
                                    objc_opt_class();
                                    if (objc_opt_isKindOfClass())
                                    {
                                      v721 = (void *)[v720 copy];
                                      -[GEOPDWifiAccessPoint setMacId:]((uint64_t)v718, v721);
                                    }
                                    v722 = [v719 objectForKeyedSubscript:@"rssi"];
                                    objc_opt_class();
                                    if (objc_opt_isKindOfClass())
                                    {
                                      int v723 = [v722 intValue];
                                      *(unsigned char *)&v718->_flags |= 8u;
                                      v718->_rssuint64_t i = v723;
                                    }

                                    v724 = [v719 objectForKeyedSubscript:@"channel"];
                                    objc_opt_class();
                                    if (objc_opt_isKindOfClass())
                                    {
                                      int v725 = [v724 intValue];
                                      *(unsigned char *)&v718->_flags |= 4u;
                                      v718->_channel = v725;
                                    }

                                    v726 = [v719 objectForKeyedSubscript:objd];
                                    objc_opt_class();
                                    if (objc_opt_isKindOfClass())
                                    {
                                      uint64_t v727 = [v726 unsignedLongLongValue];
                                      *(unsigned char *)&v718->_flags |= 1u;
                                      v718->_scanTimestamp = v727;
                                    }

                                    v728 = [v719 objectForKeyedSubscript:@"age"];
                                    objc_opt_class();
                                    if (objc_opt_isKindOfClass())
                                    {
                                      unsigned int v729 = [v728 unsignedIntValue];
                                      *(unsigned char *)&v718->_flags |= 2u;
                                      v718->_age = v729;
                                    }
                                  }
                                }
                                -[GEOPDWifiMeasurement addWifiAccessPoint:](v699, v718);
                              }
                            }
                            uint64_t v714 = [v712 countByEnumeratingWithState:&v1433 objects:&v1445 count:16];
                          }
                          while (v714);
                        }

                        a3 = v1379;
                        uint64_t v688 = v1346;
                        uint64_t v687 = v1349;
                        uint64_t v694 = v1359;
                        long long v710 = v1371;
                      }

                      v730 = [v710 objectForKeyedSubscript:v1340];
                      objc_opt_class();
                      if (objc_opt_isKindOfClass())
                      {
                        uint64_t v731 = [v730 unsignedLongLongValue];
                        *(unsigned char *)(v699 + 68) |= 0x20u;
                        *(unsigned char *)(v699 + 68) |= 1u;
                        *(void *)(v699 + 24) = v731;
                      }

                      v732 = [v1371 objectForKeyedSubscript:v1337];
                      objc_opt_class();
                      if (objc_opt_isKindOfClass())
                      {
                        uint64_t v733 = [v732 unsignedLongLongValue];
                        *(unsigned char *)(v699 + 68) |= 0x20u;
                        *(unsigned char *)(v699 + 68) |= 2u;
                        *(void *)(v699 + 32) = v733;
                      }

                      id v698 = v1371;
                    }
                  }
                  else
                  {
                    uint64_t v699 = 0;
                  }
                  -[GEOPDWifiFingerprintParameters addMeasurement:](v1352, (void *)v699);
                }
                ++v694;
              }
              while (v694 != v687);
              uint64_t v734 = [v1355 countByEnumeratingWithState:&v1429 objects:&v1441 count:16];
              uint64_t v687 = v734;
            }
            while (v734);
          }

          id v684 = v1333;
          uint64_t v681 = v1334;
          v685 = v1332;
        }

        if (a3) {
          v735 = @"maxLabels";
        }
        else {
          v735 = @"max_labels";
        }
        v736 = [v684 objectForKeyedSubscript:v735];
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          int v737 = [v736 unsignedIntValue];
          *(unsigned char *)(v1352 + 28) |= 1u;
          *(_DWORD *)(v1352 + 24) = v737;
        }
      }
    }
    else
    {
      uint64_t v1352 = 0;
    }
    -[GEOPDPlaceRequestParameters setWifiFingerprintParameters:]((uint64_t)v1335, (void *)v1352);
  }
  if (a3) {
    v738 = @"ipGeoLookupParameters";
  }
  else {
    v738 = @"ip_geo_lookup_parameters";
  }
  v739 = [v1357 objectForKeyedSubscript:v738];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v740 = [GEOPDIpGeoLookupParameters alloc];
    if (v740)
    {
      id v741 = v739;
      v740 = [(GEOPDIpGeoLookupParameters *)v740 init];
      if (v740)
      {
        if (a3) {
          v742 = @"ipAddress";
        }
        else {
          v742 = @"ip_address";
        }
        v743 = [v741 objectForKeyedSubscript:v742];
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          v744 = (void *)[v743 copy];
          -[GEOPDIpGeoLookupParameters setIpAddress:]((uint64_t)v740, v744);
        }
      }
    }
    -[GEOPDPlaceRequestParameters setIpGeoLookupParameters:]((uint64_t)v1335, v740);
  }
  if (a3) {
    v745 = @"groundViewLabelParameters";
  }
  else {
    v745 = @"ground_view_label_parameters";
  }
  v746 = [v1357 objectForKeyedSubscript:v745];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v747 = [GEOPDGroundViewLabelParameters alloc];
    if (v747)
    {
      id v748 = v746;
      v747 = [(GEOPDGroundViewLabelParameters *)v747 init];
      if (v747)
      {
        if (a3) {
          v749 = @"locationId";
        }
        else {
          v749 = @"location_id";
        }
        v750 = [v748 objectForKeyedSubscript:v749];
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          uint64_t v751 = [v750 unsignedLongLongValue];
          *(unsigned char *)&v747->_flags |= 1u;
          v747->_locationId = v751;
        }

        v752 = [v748 objectForKeyedSubscript:@"location"];
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          v753 = [GEOLocation alloc];
          if (a3) {
            v754 = [(GEOLocation *)v753 initWithJSON:v752];
          }
          else {
            v754 = [(GEOLocation *)v753 initWithDictionary:v752];
          }
          v755 = v754;
          -[GEOPDGroundViewLabelParameters setLocation:]((uint64_t)v747, v754);
        }
      }
    }
    -[GEOPDPlaceRequestParameters setGroundViewLabelParameters:]((uint64_t)v1335, v747);
  }
  if (a3) {
    v756 = @"batchSpatialLookupParameters";
  }
  else {
    v756 = @"batch_spatial_lookup_parameters";
  }
  v757 = [v1357 objectForKeyedSubscript:v756];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v758 = [GEOPDBatchSpatialLookupParameters alloc];
    if (v758)
    {
      id v759 = v757;
      v758 = [(GEOPDBatchSpatialLookupParameters *)v758 init];
      if (v758)
      {
        if (a3) {
          v760 = @"spatialPlaceLookup";
        }
        else {
          v760 = @"spatial_place_lookup";
        }
        v761 = [v759 objectForKeyedSubscript:v760];
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          long long v1443 = 0u;
          long long v1444 = 0u;
          long long v1441 = 0u;
          long long v1442 = 0u;
          id v762 = v761;
          uint64_t v763 = [v762 countByEnumeratingWithState:&v1441 objects:v1449 count:16];
          if (v763)
          {
            uint64_t v764 = v763;
            uint64_t v765 = *(void *)v1442;
            do
            {
              uint64_t v766 = 0;
              do
              {
                if (*(void *)v1442 != v765) {
                  objc_enumerationMutation(v762);
                }
                v767 = *(void **)(*((void *)&v1441 + 1) + 8 * v766);
                objc_opt_class();
                if (objc_opt_isKindOfClass())
                {
                  v768 = [GEOPDSpatialPlaceLookupParameters alloc];
                  if (v768) {
                    v769 = (void *)-[GEOPDSpatialPlaceLookupParameters _initWithDictionary:isJSON:](v768, v767, v1379);
                  }
                  else {
                    v769 = 0;
                  }
                  -[GEOPDBatchSpatialLookupParameters addSpatialPlaceLookup:]((uint64_t)v758, v769);
                }
                ++v766;
              }
              while (v764 != v766);
              uint64_t v770 = [v762 countByEnumeratingWithState:&v1441 objects:v1449 count:16];
              uint64_t v764 = v770;
            }
            while (v770);
          }

          a3 = v1379;
        }

        if (a3) {
          v771 = @"spatialEventLookup";
        }
        else {
          v771 = @"spatial_event_lookup";
        }
        v772 = [v759 objectForKeyedSubscript:v771];
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          long long v1439 = 0u;
          long long v1440 = 0u;
          long long v1437 = 0u;
          long long v1438 = 0u;
          id v773 = v772;
          uint64_t v774 = [v773 countByEnumeratingWithState:&v1437 objects:&v1445 count:16];
          if (v774)
          {
            uint64_t v775 = v774;
            uint64_t v776 = *(void *)v1438;
            do
            {
              uint64_t v777 = 0;
              do
              {
                if (*(void *)v1438 != v776) {
                  objc_enumerationMutation(v773);
                }
                v778 = *(void **)(*((void *)&v1437 + 1) + 8 * v777);
                objc_opt_class();
                if (objc_opt_isKindOfClass())
                {
                  v779 = [GEOPDSpatialEventLookupParameters alloc];
                  if (v779) {
                    v780 = (void *)-[GEOPDSpatialEventLookupParameters _initWithDictionary:isJSON:](v779, v778, v1379);
                  }
                  else {
                    v780 = 0;
                  }
                  -[GEOPDBatchSpatialLookupParameters addSpatialEventLookup:]((uint64_t)v758, v780);
                }
                ++v777;
              }
              while (v775 != v777);
              uint64_t v781 = [v773 countByEnumeratingWithState:&v1437 objects:&v1445 count:16];
              uint64_t v775 = v781;
            }
            while (v781);
          }

          a3 = v1379;
        }
      }
    }
    -[GEOPDPlaceRequestParameters setBatchSpatialLookupParameters:]((uint64_t)v1335, v758);
  }
  if (a3) {
    v782 = @"transitVehiclePositionParameters";
  }
  else {
    v782 = @"transit_vehicle_position_parameters";
  }
  v783 = [v1357 objectForKeyedSubscript:v782];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v784 = [GEOPDTransitVehiclePositionParameters alloc];
    if (v784)
    {
      id v785 = v783;
      v784 = [(GEOPDTransitVehiclePositionParameters *)v784 init];
      if (v784)
      {
        if (a3) {
          v786 = @"tripId";
        }
        else {
          v786 = @"trip_id";
        }
        v787 = [v785 objectForKeyedSubscript:v786];
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          long long v1448 = 0u;
          long long v1447 = 0u;
          long long v1446 = 0u;
          long long v1445 = 0u;
          id v1398 = v787;
          id v788 = v787;
          uint64_t v789 = [v788 countByEnumeratingWithState:&v1445 objects:v1449 count:16];
          if (v789)
          {
            uint64_t v790 = v789;
            uint64_t v791 = *(void *)v1446;
            do
            {
              for (uint64_t i11 = 0; i11 != v790; ++i11)
              {
                if (*(void *)v1446 != v791) {
                  objc_enumerationMutation(v788);
                }
                v793 = *(void **)(*((void *)&v1445 + 1) + 8 * i11);
                objc_opt_class();
                if (objc_opt_isKindOfClass())
                {
                  [v793 unsignedLongLongValue];
                  PBRepeatedUInt64Add();
                }
              }
              uint64_t v790 = [v788 countByEnumeratingWithState:&v1445 objects:v1449 count:16];
            }
            while (v790);
          }

          a3 = v1379;
          v787 = v1398;
        }
      }
    }
    -[GEOPDPlaceRequestParameters setTransitVehiclePositionParameters:]((uint64_t)v1335, v784);
  }
  if (a3) {
    v794 = @"placeCollectionLookupParameter";
  }
  else {
    v794 = @"place_collection_lookup_parameter";
  }
  v795 = [v1357 objectForKeyedSubscript:v794];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v796 = [GEOPDPlaceCollectionLookupParameters alloc];
    if (v796)
    {
      id v797 = v795;
      v796 = [(GEOPDPlaceCollectionLookupParameters *)v796 init];
      if (v796)
      {
        v798 = [v797 objectForKeyedSubscript:@"center"];
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          v799 = [GEOLatLng alloc];
          if (a3) {
            v800 = [(GEOLatLng *)v799 initWithJSON:v798];
          }
          else {
            v800 = [(GEOLatLng *)v799 initWithDictionary:v798];
          }
          v801 = v800;
          -[GEOPDPlaceCollectionLookupParameters setCenter:]((uint64_t)v796, v800);
        }
        if (a3) {
          v802 = @"collectionId";
        }
        else {
          v802 = @"collection_id";
        }
        v803 = [v797 objectForKeyedSubscript:v802];
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          long long v1448 = 0u;
          long long v1447 = 0u;
          long long v1446 = 0u;
          long long v1445 = 0u;
          id v804 = v803;
          uint64_t v805 = [v804 countByEnumeratingWithState:&v1445 objects:v1449 count:16];
          if (v805)
          {
            uint64_t v806 = v805;
            uint64_t v807 = *(void *)v1446;
            do
            {
              for (uint64_t i12 = 0; i12 != v806; ++i12)
              {
                if (*(void *)v1446 != v807) {
                  objc_enumerationMutation(v804);
                }
                uint64_t v809 = *(void *)(*((void *)&v1445 + 1) + 8 * i12);
                objc_opt_class();
                if (objc_opt_isKindOfClass())
                {
                  v810 = [GEOPDMapsIdentifier alloc];
                  if (v1379) {
                    v811 = [(GEOPDMapsIdentifier *)v810 initWithJSON:v809];
                  }
                  else {
                    v811 = [(GEOPDMapsIdentifier *)v810 initWithDictionary:v809];
                  }
                  v812 = v811;
                  -[GEOPDPlaceCollectionLookupParameters addCollectionId:]((uint64_t)v796, v811);
                }
              }
              uint64_t v806 = [v804 countByEnumeratingWithState:&v1445 objects:v1449 count:16];
            }
            while (v806);
          }

          a3 = v1379;
        }
      }
    }
    -[GEOPDPlaceRequestParameters setPlaceCollectionLookupParameter:]((uint64_t)v1335, v796);
  }
  if (a3) {
    v813 = @"transitScheduleLookupParameter";
  }
  else {
    v813 = @"transit_schedule_lookup_parameter";
  }
  v814 = [v1357 objectForKeyedSubscript:v813];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v815 = [GEOPBTransitScheduleLookupParameters alloc];
    if (a3) {
      v816 = [(GEOPBTransitScheduleLookupParameters *)v815 initWithJSON:v814];
    }
    else {
      v816 = [(GEOPBTransitScheduleLookupParameters *)v815 initWithDictionary:v814];
    }
    v817 = v816;
    -[GEOPDPlaceRequestParameters setTransitScheduleLookupParameter:]((uint64_t)v1335, v816);
  }
  if (a3) {
    v818 = @"batchCategoryLookupParameters";
  }
  else {
    v818 = @"batch_category_lookup_parameters";
  }
  v819 = [v1357 objectForKeyedSubscript:v818];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v820 = [GEOPDBatchCategoryLookupParameters alloc];
    if (v820)
    {
      id v821 = v819;
      v820 = [(GEOPDBatchCategoryLookupParameters *)v820 init];
      if (v820)
      {
        if (a3) {
          v822 = @"categoryLookupParameter";
        }
        else {
          v822 = @"category_lookup_parameter";
        }
        v823 = [v821 objectForKeyedSubscript:v822];
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          long long v1448 = 0u;
          long long v1447 = 0u;
          long long v1446 = 0u;
          long long v1445 = 0u;
          id v824 = v823;
          uint64_t v825 = [v824 countByEnumeratingWithState:&v1445 objects:v1449 count:16];
          if (v825)
          {
            uint64_t v826 = v825;
            uint64_t v827 = *(void *)v1446;
            do
            {
              uint64_t v828 = 0;
              do
              {
                if (*(void *)v1446 != v827) {
                  objc_enumerationMutation(v824);
                }
                v829 = *(void **)(*((void *)&v1445 + 1) + 8 * v828);
                objc_opt_class();
                if (objc_opt_isKindOfClass())
                {
                  v830 = [GEOPDCategoryLookupParameters alloc];
                  if (v830) {
                    v831 = (void *)-[GEOPDCategoryLookupParameters _initWithDictionary:isJSON:]((uint64_t)v830, v829, v1379);
                  }
                  else {
                    v831 = 0;
                  }
                  -[GEOPDBatchCategoryLookupParameters addCategoryLookupParameter:]((uint64_t)v820, v831);
                }
                ++v828;
              }
              while (v826 != v828);
              uint64_t v832 = [v824 countByEnumeratingWithState:&v1445 objects:v1449 count:16];
              uint64_t v826 = v832;
            }
            while (v832);
          }

          a3 = v1379;
        }
      }
    }
    -[GEOPDPlaceRequestParameters setBatchCategoryLookupParameters:]((uint64_t)v1335, v820);
  }
  if (a3) {
    v833 = @"batchMerchantLookupBrandParameters";
  }
  else {
    v833 = @"batch_merchant_lookup_brand_parameters";
  }
  v834 = [v1357 objectForKeyedSubscript:v833];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v835 = [GEOPDBatchMerchantLookupBrandParameters alloc];
    if (v835)
    {
      v836 = v835;
      id v837 = v834;
      obje = [(GEOPDBatchMerchantLookupBrandParameters *)v836 init];
      if (obje)
      {
        if (a3) {
          v838 = @"merchantLookupBrandParameter";
        }
        else {
          v838 = @"merchant_lookup_brand_parameter";
        }
        v839 = [v837 objectForKeyedSubscript:v838];
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          id v1338 = v837;
          v1341 = v834;
          long long v1448 = 0u;
          long long v1447 = 0u;
          long long v1446 = 0u;
          long long v1445 = 0u;
          id v1399 = v839;
          uint64_t v840 = [v1399 countByEnumeratingWithState:&v1445 objects:v1449 count:16];
          if (v840)
          {
            uint64_t v841 = v840;
            uint64_t v842 = *(void *)v1446;
            if (a3) {
              v843 = @"merchantCode";
            }
            else {
              v843 = @"merchant_code";
            }
            v844 = @"rawMerchantCode";
            if (!a3) {
              v844 = @"raw_merchant_code";
            }
            v1360 = v844;
            v1372 = v843;
            v845 = @"warsaw_identifier";
            if (a3) {
              v845 = @"warsawIdentifier";
            }
            v1356 = v845;
            if (a3) {
              v846 = @"appIdentifier";
            }
            else {
              v846 = @"app_identifier";
            }
            v1353 = v846;
            if (a3) {
              v847 = @"merchantId";
            }
            else {
              v847 = @"merchant_id";
            }
            v848 = @"merchant_canl";
            if (a3) {
              v848 = @"merchantCanl";
            }
            v1347 = v848;
            v1350 = v847;
            v849 = @"identity_merchant_information";
            if (a3) {
              v849 = @"identityMerchantInformation";
            }
            v1344 = v849;
            do
            {
              uint64_t v850 = 0;
              do
              {
                if (*(void *)v1446 != v842) {
                  objc_enumerationMutation(v1399);
                }
                v851 = *(void **)(*((void *)&v1445 + 1) + 8 * v850);
                objc_opt_class();
                if (objc_opt_isKindOfClass())
                {
                  v852 = [GEOPDMerchantLookupBrandParameters alloc];
                  if (v852)
                  {
                    v853 = v852;
                    id v854 = v851;
                    uint64_t v855 = [(GEOPDMerchantLookupBrandParameters *)v853 init];
                    if (v855)
                    {
                      v856 = [v854 objectForKeyedSubscript:v1372];
                      objc_opt_class();
                      if (objc_opt_isKindOfClass())
                      {
                        v857 = (void *)[v856 copy];
                        id v858 = v857;
                        *(_WORD *)(v855 + 92) |= 0x10u;
                        *(_WORD *)(v855 + 92) |= 0x100u;
                        objc_storeStrong((id *)(v855 + 48), v857);
                      }
                      v859 = [v854 objectForKeyedSubscript:v1360];
                      objc_opt_class();
                      if (objc_opt_isKindOfClass())
                      {
                        v860 = (void *)[v859 copy];
                        id v861 = v860;
                        *(_WORD *)(v855 + 92) |= 0x40u;
                        *(_WORD *)(v855 + 92) |= 0x100u;
                        objc_storeStrong((id *)(v855 + 64), v860);
                      }
                      v862 = [v854 objectForKeyedSubscript:v1356];
                      objc_opt_class();
                      if (objc_opt_isKindOfClass())
                      {
                        v863 = [GEOPDWarsawMerchantIdentifier alloc];
                        if (v863) {
                          v864 = (void *)-[GEOPDWarsawMerchantIdentifier _initWithDictionary:isJSON:](v863, v862, v1379);
                        }
                        else {
                          v864 = 0;
                        }
                        id v865 = v864;
                        *(_WORD *)(v855 + 92) |= 0x80u;
                        *(_WORD *)(v855 + 92) |= 0x100u;
                        objc_storeStrong((id *)(v855 + 72), v864);
                      }
                      v866 = [v854 objectForKeyedSubscript:v1353];
                      objc_opt_class();
                      if (objc_opt_isKindOfClass())
                      {
                        v867 = [GEOPDAdamAppIdentifier alloc];
                        if (v867) {
                          v868 = (void *)-[GEOPDAdamAppIdentifier _initWithDictionary:isJSON:](v867, v866, v1379);
                        }
                        else {
                          v868 = 0;
                        }
                        id v869 = v868;
                        *(_WORD *)(v855 + 92) |= 2u;
                        *(_WORD *)(v855 + 92) |= 0x100u;
                        objc_storeStrong((id *)(v855 + 24), v868);
                      }
                      v870 = [v854 objectForKeyedSubscript:v1350];
                      objc_opt_class();
                      if (objc_opt_isKindOfClass())
                      {
                        v871 = (void *)[v870 copy];
                        id v872 = v871;
                        *(_WORD *)(v855 + 92) |= 0x20u;
                        *(_WORD *)(v855 + 92) |= 0x100u;
                        objc_storeStrong((id *)(v855 + 56), v871);
                      }
                      v873 = [v854 objectForKeyedSubscript:v1347];
                      objc_opt_class();
                      if (objc_opt_isKindOfClass())
                      {
                        v874 = (void *)[v873 copy];
                        id v875 = v874;
                        *(_WORD *)(v855 + 92) |= 8u;
                        *(_WORD *)(v855 + 92) |= 0x100u;
                        objc_storeStrong((id *)(v855 + 40), v874);
                      }
                      v876 = [v854 objectForKeyedSubscript:v1344];
                      objc_opt_class();
                      if (objc_opt_isKindOfClass())
                      {
                        v877 = [GEOPDIdentityMerchantInformation alloc];
                        if (v877) {
                          v878 = (void *)-[GEOPDIdentityMerchantInformation _initWithDictionary:isJSON:](v877, v876, v1379);
                        }
                        else {
                          v878 = 0;
                        }
                        id v879 = v878;
                        *(_WORD *)(v855 + 92) |= 4u;
                        *(_WORD *)(v855 + 92) |= 0x100u;
                        objc_storeStrong((id *)(v855 + 32), v878);
                      }
                    }
                  }
                  else
                  {
                    uint64_t v855 = 0;
                  }
                  -[GEOPDBatchMerchantLookupBrandParameters addMerchantLookupBrandParameter:]((uint64_t)obje, (void *)v855);

                  a3 = v1379;
                }
                ++v850;
              }
              while (v841 != v850);
              uint64_t v880 = [v1399 countByEnumeratingWithState:&v1445 objects:v1449 count:16];
              uint64_t v841 = v880;
            }
            while (v880);
          }

          id v837 = v1338;
          v834 = v1341;
        }
      }
    }
    else
    {
      obje = 0;
    }
    -[GEOPDPlaceRequestParameters setBatchMerchantLookupBrandParameters:]((uint64_t)v1335, obje);
  }
  if (a3) {
    v881 = @"childPlaceLookupByCategoryParameters";
  }
  else {
    v881 = @"child_place_lookup_by_category_parameters";
  }
  v882 = [v1357 objectForKeyedSubscript:v881];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v883 = [GEOPDChildPlaceLookupByCategoryParameters alloc];
    if (v883)
    {
      id v884 = v882;
      v883 = [(GEOPDChildPlaceLookupByCategoryParameters *)v883 init];
      if (v883)
      {
        if (a3) {
          v885 = @"categoryMetadata";
        }
        else {
          v885 = @"category_metadata";
        }
        v886 = [v884 objectForKeyedSubscript:v885];
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          v887 = (void *)[objc_alloc(MEMORY[0x1E4F1C9B8]) initWithBase64EncodedString:v886 options:0];
          -[GEOPDChildPlaceLookupByCategoryParameters setCategoryMetadata:]((uint64_t)v883, v887);
        }
        if (a3) {
          v888 = @"parentMuid";
        }
        else {
          v888 = @"parent_muid";
        }
        v889 = [v884 objectForKeyedSubscript:v888];
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          uint64_t v890 = [v889 unsignedLongLongValue];
          *(unsigned char *)&v883->_flags |= 1u;
          v883->_parentMuid = v890;
        }
      }
    }
    -[GEOPDPlaceRequestParameters setChildPlaceLookupByCategoryParameters:]((uint64_t)v1335, v883);
  }
  if (a3) {
    v891 = @"collectionSuggestionParameters";
  }
  else {
    v891 = @"collection_suggestion_parameters";
  }
  v892 = [v1357 objectForKeyedSubscript:v891];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v893 = [GEOPDCollectionSuggestionParameters alloc];
    if (v893) {
      v894 = (void *)-[GEOPDCollectionSuggestionParameters _initWithDictionary:isJSON:](v893, v892, a3);
    }
    else {
      v894 = 0;
    }
    -[GEOPDPlaceRequestParameters setCollectionSuggestionParameters:]((uint64_t)v1335, v894);
  }
  if (a3) {
    v895 = @"mapsSearchHomeParameters";
  }
  else {
    v895 = @"maps_search_home_parameters";
  }
  v896 = [v1357 objectForKeyedSubscript:v895];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v897 = [GEOPDMapsSearchHomeParameters alloc];
    if (v897)
    {
      v898 = v897;
      id v899 = v896;
      v900 = [(GEOPDMapsSearchHomeParameters *)v898 init];
      if (v900)
      {
        if (a3) {
          v901 = @"supportedSectionType";
        }
        else {
          v901 = @"supported_section_type";
        }
        v902 = [v899 objectForKeyedSubscript:v901];
        objc_opt_class();
        id objf = v899;
        if (objc_opt_isKindOfClass())
        {
          v1373 = v896;
          long long v1431 = 0u;
          long long v1432 = 0u;
          long long v1429 = 0u;
          long long v1430 = 0u;
          id v903 = v902;
          uint64_t v904 = [v903 countByEnumeratingWithState:&v1429 objects:&v1441 count:16];
          if (!v904) {
            goto LABEL_1888;
          }
          uint64_t v905 = v904;
          uint64_t v906 = *(void *)v1430;
          while (1)
          {
            for (uint64_t i13 = 0; i13 != v905; ++i13)
            {
              if (*(void *)v1430 != v906) {
                objc_enumerationMutation(v903);
              }
              v908 = *(void **)(*((void *)&v1429 + 1) + 8 * i13);
              objc_opt_class();
              if (objc_opt_isKindOfClass())
              {
                id v909 = v908;
                if (([v909 isEqualToString:@"UNKNOWN"] & 1) == 0
                  && ([v909 isEqualToString:@"SEARCH_BROWSE_CATEGORY_SUGGESTION_RESULT"] & 1) == 0
                  && ([v909 isEqualToString:@"COLLECTION_SUGGESTION_RESULT"] & 1) == 0
                  && ([v909 isEqualToString:@"PUBLISHER_SUGGESTION_RESULT"] & 1) == 0
                  && ([v909 isEqualToString:@"PLACE_SUGGESTION_RESULT"] & 1) == 0)
                {
                  [v909 isEqualToString:@"GUIDE_LOCATION_SUGGESTION_RESULT"];
                }
              }
              else
              {
                objc_opt_class();
                if ((objc_opt_isKindOfClass() & 1) == 0) {
                  continue;
                }
                [v908 intValue];
              }
              -[GEOPDMapsSearchHomeParameters addSupportedSectionType:]((uint64_t)v900);
            }
            uint64_t v905 = [v903 countByEnumeratingWithState:&v1429 objects:&v1441 count:16];
            if (!v905)
            {
LABEL_1888:

              a3 = v1379;
              id v899 = objf;
              v896 = v1373;
              break;
            }
          }
        }

        if (a3) {
          v910 = @"searchBrowseCategorySuggestionParameters";
        }
        else {
          v910 = @"search_browse_category_suggestion_parameters";
        }
        v911 = [v899 objectForKeyedSubscript:v910];
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          v912 = [GEOPDSearchBrowseCategorySuggestionParameters alloc];
          if (v912) {
            v913 = (void *)-[GEOPDSearchBrowseCategorySuggestionParameters _initWithDictionary:isJSON:](v912, v911, a3);
          }
          else {
            v913 = 0;
          }
          -[GEOPDMapsSearchHomeParameters setSearchBrowseCategorySuggestionParameters:]((uint64_t)v900, v913);
        }
        v914 = [v899 objectForKeyedSubscript:v891];
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          v915 = [GEOPDCollectionSuggestionParameters alloc];
          if (v915) {
            v916 = (void *)-[GEOPDCollectionSuggestionParameters _initWithDictionary:isJSON:](v915, v914, a3);
          }
          else {
            v916 = 0;
          }
          -[GEOPDMapsSearchHomeParameters setCollectionSuggestionParameters:]((uint64_t)v900, v916);
        }
        if (a3) {
          v917 = @"publisherSuggestionParameters";
        }
        else {
          v917 = @"publisher_suggestion_parameters";
        }
        v918 = [v899 objectForKeyedSubscript:v917];
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          v919 = [GEOPDPublisherSuggestionParameters alloc];
          if (v919) {
            v920 = (void *)-[GEOPDPublisherSuggestionParameters _initWithDictionary:isJSON:](v919, v918, a3);
          }
          else {
            v920 = 0;
          }
          -[GEOPDMapsSearchHomeParameters setPublisherSuggestionParameters:]((uint64_t)v900, v920);
        }
        if (a3) {
          v921 = @"placeSuggestionParameters";
        }
        else {
          v921 = @"place_suggestion_parameters";
        }
        v922 = [v899 objectForKeyedSubscript:v921];
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          v923 = [GEOPDPlaceSuggestionParameters alloc];
          if (v923)
          {
            id v924 = v922;
            v923 = [(GEOPDPlaceSuggestionParameters *)v923 init];
            if (v923)
            {
              if (a3) {
                v925 = @"viewportInfo";
              }
              else {
                v925 = @"viewport_info";
              }
              v1361 = v924;
              v926 = [v924 objectForKeyedSubscript:v925];
              objc_opt_class();
              if (objc_opt_isKindOfClass())
              {
                v927 = [GEOPDViewportInfo alloc];
                if (a3) {
                  v928 = [(GEOPDViewportInfo *)v927 initWithJSON:v926];
                }
                else {
                  v928 = [(GEOPDViewportInfo *)v927 initWithDictionary:v926];
                }
                v929 = v928;
                -[GEOPDPlaceSuggestionParameters setViewportInfo:]((uint64_t)v923, v928);
              }
              if (a3) {
                v930 = @"mapsCategoryId";
              }
              else {
                v930 = @"maps_category_id";
              }
              v931 = [v1361 objectForKeyedSubscript:v930];
              objc_opt_class();
              v1400 = v891;
              v1374 = v896;
              if (objc_opt_isKindOfClass())
              {
                long long v1439 = 0u;
                long long v1440 = 0u;
                long long v1437 = 0u;
                long long v1438 = 0u;
                id v932 = v931;
                uint64_t v933 = [v932 countByEnumeratingWithState:&v1437 objects:v1449 count:16];
                if (v933)
                {
                  uint64_t v934 = v933;
                  uint64_t v935 = *(void *)v1438;
                  do
                  {
                    for (uint64_t i14 = 0; i14 != v934; ++i14)
                    {
                      if (*(void *)v1438 != v935) {
                        objc_enumerationMutation(v932);
                      }
                      v937 = *(void **)(*((void *)&v1437 + 1) + 8 * i14);
                      objc_opt_class();
                      if (objc_opt_isKindOfClass())
                      {
                        v938 = (void *)[v937 copy];
                        -[GEOPDPlaceSuggestionParameters addMapsCategoryId:]((uint64_t)v923, v938);
                      }
                    }
                    uint64_t v934 = [v932 countByEnumeratingWithState:&v1437 objects:v1449 count:16];
                  }
                  while (v934);
                }

                a3 = v1379;
                id v899 = objf;
                v891 = v1400;
                v896 = v1374;
              }

              if (a3) {
                v939 = @"suggestedPlaceId";
              }
              else {
                v939 = @"suggested_place_id";
              }
              v940 = [v1361 objectForKeyedSubscript:v939];
              objc_opt_class();
              if (objc_opt_isKindOfClass())
              {
                long long v1435 = 0u;
                long long v1436 = 0u;
                long long v1433 = 0u;
                long long v1434 = 0u;
                id v941 = v940;
                uint64_t v942 = [v941 countByEnumeratingWithState:&v1433 objects:&v1445 count:16];
                if (v942)
                {
                  uint64_t v943 = v942;
                  uint64_t v944 = *(void *)v1434;
                  do
                  {
                    for (uint64_t i15 = 0; i15 != v943; ++i15)
                    {
                      if (*(void *)v1434 != v944) {
                        objc_enumerationMutation(v941);
                      }
                      uint64_t v946 = *(void *)(*((void *)&v1433 + 1) + 8 * i15);
                      objc_opt_class();
                      if (objc_opt_isKindOfClass())
                      {
                        v947 = [GEOPDMapsIdentifier alloc];
                        if (v1379) {
                          v948 = [(GEOPDMapsIdentifier *)v947 initWithJSON:v946];
                        }
                        else {
                          v948 = [(GEOPDMapsIdentifier *)v947 initWithDictionary:v946];
                        }
                        v949 = v948;
                        -[GEOPDPlaceSuggestionParameters addSuggestedPlaceId:]((uint64_t)v923, v948);
                      }
                    }
                    uint64_t v943 = [v941 countByEnumeratingWithState:&v1433 objects:&v1445 count:16];
                  }
                  while (v943);
                }

                a3 = v1379;
                id v899 = objf;
                v891 = v1400;
                v896 = v1374;
              }

              id v924 = v1361;
            }
          }
          -[GEOPDMapsSearchHomeParameters setPlaceSuggestionParameters:]((uint64_t)v900, v923);
        }
        if (a3) {
          v950 = @"guidesLocationsSuggestionParameters";
        }
        else {
          v950 = @"guides_locations_suggestion_parameters";
        }
        v951 = [v899 objectForKeyedSubscript:v950];
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          v952 = [GEOPDGuidesLocationsSuggestionParameters alloc];
          if (v952)
          {
            id v953 = v951;
            v952 = [(GEOPDGuidesLocationsSuggestionParameters *)v952 init];
            if (v952)
            {
              if (a3) {
                v954 = @"viewportInfo";
              }
              else {
                v954 = @"viewport_info";
              }
              v955 = [v953 objectForKeyedSubscript:v954];
              objc_opt_class();
              if (objc_opt_isKindOfClass())
              {
                v956 = [GEOPDViewportInfo alloc];
                if (a3) {
                  v957 = [(GEOPDViewportInfo *)v956 initWithJSON:v955];
                }
                else {
                  v957 = [(GEOPDViewportInfo *)v956 initWithDictionary:v955];
                }
                v958 = v957;
                -[GEOPDGuidesLocationsSuggestionParameters setViewportInfo:]((uint64_t)v952, v957);

                id v899 = objf;
              }
            }
          }
          -[GEOPDMapsSearchHomeParameters setGuidesLocationsSuggestionParameters:]((uint64_t)v900, v952);
        }
        if (a3) {
          v959 = @"searchOriginationInfo";
        }
        else {
          v959 = @"search_origination_info";
        }
        v960 = [v899 objectForKeyedSubscript:v959];
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          v961 = [GEOPDSearchOriginationInfo alloc];
          if (v961) {
            v962 = (void *)-[GEOPDSearchOriginationInfo _initWithDictionary:isJSON:]((uint64_t)v961, v960, a3);
          }
          else {
            v962 = 0;
          }
          -[GEOPDMapsSearchHomeParameters setSearchOriginationInfo:]((uint64_t)v900, v962);
        }
      }
    }
    else
    {
      v900 = 0;
    }
    -[GEOPDPlaceRequestParameters setMapsSearchHomeParameters:]((uint64_t)v1335, v900);
  }
  if (a3) {
    v963 = @"placeQuestionnaireLookupParameters";
  }
  else {
    v963 = @"place_questionnaire_lookup_parameters";
  }
  v964 = [v1357 objectForKeyedSubscript:v963];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v965 = [GEOPDPlaceQuestionnaireLookupParameters alloc];
    if (v965) {
      v966 = (void *)-[GEOPDPlaceQuestionnaireLookupParameters _initWithDictionary:isJSON:](v965, v964, a3);
    }
    else {
      v966 = 0;
    }
    -[GEOPDPlaceRequestParameters setPlaceQuestionnaireLookupParameters:]((uint64_t)v1335, v966);
  }
  if (a3) {
    v967 = @"publisherViewParameters";
  }
  else {
    v967 = @"publisher_view_parameters";
  }
  v968 = [v1357 objectForKeyedSubscript:v967];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v969 = [GEOPDPublisherViewParameters alloc];
    if (v969)
    {
      id v970 = v968;
      v969 = [(GEOPDPublisherViewParameters *)v969 init];
      if (v969)
      {
        if (a3) {
          v971 = @"publisherId";
        }
        else {
          v971 = @"publisher_id";
        }
        v972 = [v970 objectForKeyedSubscript:v971];
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          v973 = [GEOPDMapsIdentifier alloc];
          if (a3) {
            v974 = [(GEOPDMapsIdentifier *)v973 initWithJSON:v972];
          }
          else {
            v974 = [(GEOPDMapsIdentifier *)v973 initWithDictionary:v972];
          }
          v975 = v974;
          -[GEOPDPublisherViewParameters setPublisherId:]((uint64_t)v969, v974);
        }
        if (a3) {
          v976 = @"numClientizedResults";
        }
        else {
          v976 = @"num_clientized_results";
        }
        v977 = [v970 objectForKeyedSubscript:v976];
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          unsigned int v978 = [v977 unsignedIntValue];
          *(unsigned char *)&v969->_flags |= 0x20u;
          *(unsigned char *)&v969->_flags |= 1u;
          v969->_numClientizedResults = v978;
        }

        if (a3) {
          v979 = @"resultFilter";
        }
        else {
          v979 = @"result_filter";
        }
        v980 = [v970 objectForKeyedSubscript:v979];
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          v981 = [GEOPDPublisherViewResultFilter alloc];
          if (v981) {
            v982 = (void *)-[GEOPDPublisherViewResultFilter _initWithDictionary:isJSON:](v981, v980, a3);
          }
          else {
            v982 = 0;
          }
          -[GEOPDPublisherViewParameters setResultFilter:]((uint64_t)v969, v982);
        }
        if (a3) {
          v983 = @"viewportInfo";
        }
        else {
          v983 = @"viewport_info";
        }
        v984 = [v970 objectForKeyedSubscript:v983];
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          v985 = [GEOPDViewportInfo alloc];
          if (a3) {
            v986 = [(GEOPDViewportInfo *)v985 initWithJSON:v984];
          }
          else {
            v986 = [(GEOPDViewportInfo *)v985 initWithDictionary:v984];
          }
          v987 = v986;
          -[GEOPDPublisherViewParameters setViewportInfo:]((uint64_t)v969, v986);
        }
      }
    }
    -[GEOPDPlaceRequestParameters setPublisherViewParameters:]((uint64_t)v1335, v969);
  }
  if (a3) {
    v988 = @"allCollectionsViewParameters";
  }
  else {
    v988 = @"all_collections_view_parameters";
  }
  v989 = [v1357 objectForKeyedSubscript:v988];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v990 = [GEOPDAllCollectionsViewParameters alloc];
    if (v990)
    {
      id v991 = v989;
      v990 = [(GEOPDAllCollectionsViewParameters *)v990 init];
      if (v990)
      {
        if (a3) {
          v992 = @"publisherSuggestionParameters";
        }
        else {
          v992 = @"publisher_suggestion_parameters";
        }
        v993 = [v991 objectForKeyedSubscript:v992];
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          v994 = [GEOPDPublisherSuggestionParameters alloc];
          if (v994) {
            v995 = (void *)-[GEOPDPublisherSuggestionParameters _initWithDictionary:isJSON:](v994, v993, a3);
          }
          else {
            v995 = 0;
          }
          -[GEOPDAllCollectionsViewParameters setPublisherSuggestionParameters:]((uint64_t)v990, v995);
        }
        if (a3) {
          v996 = @"numClientizedResults";
        }
        else {
          v996 = @"num_clientized_results";
        }
        v997 = [v991 objectForKeyedSubscript:v996];
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          unsigned int v998 = [v997 unsignedIntValue];
          *(unsigned char *)&v990->_flags |= 0x20u;
          *(unsigned char *)&v990->_flags |= 1u;
          v990->_numClientizedResults = v998;
        }

        if (a3) {
          v999 = @"resultFilter";
        }
        else {
          v999 = @"result_filter";
        }
        v1000 = [v991 objectForKeyedSubscript:v999];
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          v1001 = [GEOPDAllCollectionsViewResultFilter alloc];
          if (v1001) {
            v1002 = (void *)-[GEOPDAllCollectionsViewResultFilter _initWithDictionary:isJSON:](v1001, v1000, a3);
          }
          else {
            v1002 = 0;
          }
          -[GEOPDAllCollectionsViewParameters setResultFilter:]((uint64_t)v990, v1002);
        }
        if (a3) {
          v1003 = @"viewportInfo";
        }
        else {
          v1003 = @"viewport_info";
        }
        v1004 = [v991 objectForKeyedSubscript:v1003];
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          v1005 = [GEOPDViewportInfo alloc];
          if (a3) {
            v1006 = [(GEOPDViewportInfo *)v1005 initWithJSON:v1004];
          }
          else {
            v1006 = [(GEOPDViewportInfo *)v1005 initWithDictionary:v1004];
          }
          v1007 = v1006;
          -[GEOPDAllCollectionsViewParameters setViewportInfo:]((uint64_t)v990, v1006);
        }
      }
    }
    -[GEOPDPlaceRequestParameters setAllCollectionsViewParameters:]((uint64_t)v1335, v990);
  }
  if (a3) {
    v1008 = @"airportEntityPlaceLookupParameters";
  }
  else {
    v1008 = @"airport_entity_place_lookup_parameters";
  }
  v1009 = [v1357 objectForKeyedSubscript:v1008];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v1010 = [GEOPDAirportEntityPlaceLookupParameters alloc];
    if (v1010)
    {
      id v1011 = v1009;
      v1010 = [(GEOPDAirportEntityPlaceLookupParameters *)v1010 init];
      if (v1010)
      {
        if (a3) {
          v1012 = @"airportCode";
        }
        else {
          v1012 = @"airport_code";
        }
        v1013 = [v1011 objectForKeyedSubscript:v1012];
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          v1014 = (void *)[v1013 copy];
          -[GEOPDAirportEntityPlaceLookupParameters setAirportCode:]((uint64_t)v1010, v1014);
        }
        if (a3) {
          v1015 = @"terminalCode";
        }
        else {
          v1015 = @"terminal_code";
        }
        v1016 = [v1011 objectForKeyedSubscript:v1015];
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          v1017 = (void *)[v1016 copy];
          -[GEOPDAirportEntityPlaceLookupParameters setTerminalCode:]((uint64_t)v1010, v1017);
        }
        if (a3) {
          v1018 = @"gateCode";
        }
        else {
          v1018 = @"gate_code";
        }
        v1019 = [v1011 objectForKeyedSubscript:v1018];
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          v1020 = (void *)[v1019 copy];
          -[GEOPDAirportEntityPlaceLookupParameters setGateCode:]((uint64_t)v1010, v1020);
        }
      }
    }
    -[GEOPDPlaceRequestParameters setAirportEntityPlaceLookupParameters:]((uint64_t)v1335, v1010);
  }
  if (a3) {
    v1021 = @"territoryLookupParameters";
  }
  else {
    v1021 = @"territory_lookup_parameters";
  }
  v1022 = [v1357 objectForKeyedSubscript:v1021];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v1023 = [GEOPDTerritoryLookupParameters alloc];
    if (v1023)
    {
      id v1024 = v1022;
      v1023 = [(GEOPDTerritoryLookupParameters *)v1023 init];
      if (v1023)
      {
        v1025 = [v1024 objectForKeyedSubscript:@"location"];
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          v1401 = v891;
          long long v1448 = 0u;
          long long v1447 = 0u;
          long long v1446 = 0u;
          long long v1445 = 0u;
          id v1026 = v1025;
          uint64_t v1027 = [v1026 countByEnumeratingWithState:&v1445 objects:v1449 count:16];
          if (v1027)
          {
            uint64_t v1028 = v1027;
            uint64_t v1029 = *(void *)v1446;
            do
            {
              for (uint64_t i16 = 0; i16 != v1028; ++i16)
              {
                if (*(void *)v1446 != v1029) {
                  objc_enumerationMutation(v1026);
                }
                uint64_t v1031 = *(void *)(*((void *)&v1445 + 1) + 8 * i16);
                objc_opt_class();
                if (objc_opt_isKindOfClass())
                {
                  v1032 = [GEOLatLngE7 alloc];
                  if (v1379) {
                    v1033 = [(GEOLatLngE7 *)v1032 initWithJSON:v1031];
                  }
                  else {
                    v1033 = [(GEOLatLngE7 *)v1032 initWithDictionary:v1031];
                  }
                  v1034 = v1033;
                  -[GEOPDTerritoryLookupParameters addLocation:]((uint64_t)v1023, v1033);
                }
              }
              uint64_t v1028 = [v1026 countByEnumeratingWithState:&v1445 objects:v1449 count:16];
            }
            while (v1028);
          }

          a3 = v1379;
          v891 = v1401;
        }
      }
    }
    -[GEOPDPlaceRequestParameters setTerritoryLookupParameters:]((uint64_t)v1335, v1023);
  }
  if (a3) {
    v1035 = @"transitNearbyScheduleLookupParameters";
  }
  else {
    v1035 = @"transit_nearby_schedule_lookup_parameters";
  }
  v1036 = [v1357 objectForKeyedSubscript:v1035];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v1037 = [GEOPDTransitNearbyScheduleLookupParameters alloc];
    if (v1037)
    {
      id v1038 = v1036;
      v1037 = [(GEOPDTransitNearbyScheduleLookupParameters *)v1037 init];
      if (v1037)
      {
        if (a3) {
          v1039 = @"transitNearbyScheduleLookupOrigin";
        }
        else {
          v1039 = @"transit_nearby_schedule_lookup_origin";
        }
        v1040 = [v1038 objectForKeyedSubscript:v1039];
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          v1362 = v1040;
          id v1375 = v1038;
          id objg = v1036;
          v1402 = v891;
          long long v1448 = 0u;
          long long v1447 = 0u;
          long long v1446 = 0u;
          long long v1445 = 0u;
          id v1041 = v1040;
          uint64_t v1042 = [v1041 countByEnumeratingWithState:&v1445 objects:v1449 count:16];
          if (v1042)
          {
            uint64_t v1043 = v1042;
            uint64_t v1044 = *(void *)v1446;
            if (a3) {
              v1045 = @"waypointTyped";
            }
            else {
              v1045 = @"waypoint_typed";
            }
            do
            {
              uint64_t v1046 = 0;
              do
              {
                if (*(void *)v1446 != v1044) {
                  objc_enumerationMutation(v1041);
                }
                v1047 = *(void **)(*((void *)&v1445 + 1) + 8 * v1046);
                objc_opt_class();
                if (objc_opt_isKindOfClass())
                {
                  v1048 = [GEOPDTransitNearbyScheduleLookupOrigin alloc];
                  if (v1048)
                  {
                    v1049 = v1048;
                    id v1050 = v1047;
                    v1051 = [(GEOPDTransitNearbyScheduleLookupOrigin *)v1049 init];
                    if (v1051)
                    {
                      v1052 = [v1050 objectForKeyedSubscript:v1045];
                      objc_opt_class();
                      if (objc_opt_isKindOfClass())
                      {
                        v1053 = [GEOWaypointTyped alloc];
                        if (v1379) {
                          v1054 = [(GEOWaypointTyped *)v1053 initWithJSON:v1052];
                        }
                        else {
                          v1054 = [(GEOWaypointTyped *)v1053 initWithDictionary:v1052];
                        }
                        v1055 = v1054;
                        -[GEOPDTransitNearbyScheduleLookupOrigin setWaypointTyped:]((uint64_t)v1051, v1054);
                      }
                    }
                  }
                  else
                  {
                    v1051 = 0;
                  }
                  -[GEOPDTransitNearbyScheduleLookupParameters addTransitNearbyScheduleLookupOrigin:]((uint64_t)v1037, v1051);

                  a3 = v1379;
                }
                ++v1046;
              }
              while (v1043 != v1046);
              uint64_t v1056 = [v1041 countByEnumeratingWithState:&v1445 objects:v1449 count:16];
              uint64_t v1043 = v1056;
            }
            while (v1056);
          }

          v1036 = objg;
          v891 = v1402;
          v1040 = v1362;
          id v1038 = v1375;
        }

        if (a3) {
          v1057 = @"userLocation";
        }
        else {
          v1057 = @"user_location";
        }
        v1058 = [v1038 objectForKeyedSubscript:v1057];
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          v1059 = [GEOWaypointTyped alloc];
          if (a3) {
            v1060 = [(GEOWaypointTyped *)v1059 initWithJSON:v1058];
          }
          else {
            v1060 = [(GEOWaypointTyped *)v1059 initWithDictionary:v1058];
          }
          v1061 = v1060;
          -[GEOPDTransitNearbyScheduleLookupParameters setUserLocation:]((uint64_t)v1037, v1060);
        }
      }
    }
    -[GEOPDPlaceRequestParameters setTransitNearbyScheduleLookupParameters:]((uint64_t)v1335, v1037);
  }
  if (a3) {
    v1062 = @"mapsHomeParameters";
  }
  else {
    v1062 = @"maps_home_parameters";
  }
  v1063 = [v1357 objectForKeyedSubscript:v1062];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v1064 = [GEOPDMapsHomeParameters alloc];
    if (v1064)
    {
      id v1065 = v1063;
      v1064 = [(GEOPDMapsHomeParameters *)v1064 init];
      if (v1064)
      {
        v1066 = [v1065 objectForKeyedSubscript:v891];
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          v1067 = [GEOPDCollectionSuggestionParameters alloc];
          if (v1067) {
            v1068 = (void *)-[GEOPDCollectionSuggestionParameters _initWithDictionary:isJSON:](v1067, v1066, a3);
          }
          else {
            v1068 = 0;
          }
          -[GEOPDMapsHomeParameters setCollectionSuggestionParameters:]((uint64_t)v1064, v1068);
        }
        if (a3) {
          v1069 = @"shouldPopulateExploreGuidesEntry";
        }
        else {
          v1069 = @"should_populate_explore_guides_entry";
        }
        v1070 = [v1065 objectForKeyedSubscript:v1069];
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          char v1071 = [v1070 BOOLValue];
          *(unsigned char *)&v1064->_flags |= 1u;
          v1064->_shouldPopulateExploreGuidesEntry = v1071;
        }
      }
    }
    -[GEOPDPlaceRequestParameters setMapsHomeParameters:]((uint64_t)v1335, v1064);
  }
  if (a3) {
    v1072 = @"allGuidesLocationsViewParameters";
  }
  else {
    v1072 = @"all_guides_locations_view_parameters";
  }
  v1073 = [v1357 objectForKeyedSubscript:v1072];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v1074 = [GEOPDAllGuidesLocationsViewParameters alloc];
    if (v1074)
    {
      id v1075 = v1073;
      v1074 = [(GEOPDAllGuidesLocationsViewParameters *)v1074 init];
      if (v1074)
      {
        if (a3) {
          v1076 = @"viewportInfo";
        }
        else {
          v1076 = @"viewport_info";
        }
        v1077 = [v1075 objectForKeyedSubscript:v1076];
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          v1078 = [GEOPDViewportInfo alloc];
          if (a3) {
            v1079 = [(GEOPDViewportInfo *)v1078 initWithJSON:v1077];
          }
          else {
            v1079 = [(GEOPDViewportInfo *)v1078 initWithDictionary:v1077];
          }
          v1080 = v1079;
          -[GEOPDAllGuidesLocationsViewParameters setViewportInfo:]((uint64_t)v1074, v1079);
        }
        if (a3) {
          v1081 = @"numClientizedResults";
        }
        else {
          v1081 = @"num_clientized_results";
        }
        v1082 = [v1075 objectForKeyedSubscript:v1081];
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          unsigned int v1083 = [v1082 unsignedIntValue];
          *(unsigned char *)&v1074->_flags |= 1u;
          v1074->_numClientizedResults = v1083;
        }
      }
    }
    -[GEOPDPlaceRequestParameters setAllGuidesLocationsViewParameters:]((uint64_t)v1335, v1074);
  }
  if (a3) {
    v1084 = @"guidesHomeParameters";
  }
  else {
    v1084 = @"guides_home_parameters";
  }
  v1085 = [v1357 objectForKeyedSubscript:v1084];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v1086 = [GEOPDGuidesHomeParameters alloc];
    if (v1086)
    {
      v1087 = v1086;
      id v1088 = v1085;
      v1089 = [(GEOPDGuidesHomeParameters *)v1087 init];
      if (v1089)
      {
        if (a3) {
          v1090 = @"supportedFixedSectionType";
        }
        else {
          v1090 = @"supported_fixed_section_type";
        }
        v1091 = [v1088 objectForKeyedSubscript:v1090];
        objc_opt_class();
        id objh = v1088;
        if (objc_opt_isKindOfClass())
        {
          long long v1443 = 0u;
          long long v1444 = 0u;
          long long v1441 = 0u;
          long long v1442 = 0u;
          id v1092 = v1091;
          uint64_t v1093 = [v1092 countByEnumeratingWithState:&v1441 objects:v1449 count:16];
          if (!v1093) {
            goto LABEL_2220;
          }
          uint64_t v1094 = v1093;
          uint64_t v1095 = *(void *)v1442;
          while (1)
          {
            for (uint64_t i17 = 0; i17 != v1094; ++i17)
            {
              if (*(void *)v1442 != v1095) {
                objc_enumerationMutation(v1092);
              }
              v1097 = *(void **)(*((void *)&v1441 + 1) + 8 * i17);
              objc_opt_class();
              if (objc_opt_isKindOfClass())
              {
                id v1098 = v1097;
                if (([v1098 isEqualToString:@"GUIDES_HOME_FIXED_SECTION_TYPE_UNKNOWN"] & 1) == 0
                  && ([v1098 isEqualToString:@"GUIDES_HOME_FIXED_SECTION_TYPE_FEATURED_GUIDES"] & 1) == 0
                  && ([v1098 isEqualToString:@"GUIDES_HOME_FIXED_SECTION_TYPE_FILTERS"] & 1) == 0)
                {
                  [v1098 isEqualToString:@"GUIDES_HOME_FIXED_SECTION_TYPE_FILTERED_GUIDES"];
                }
              }
              else
              {
                objc_opt_class();
                if ((objc_opt_isKindOfClass() & 1) == 0) {
                  continue;
                }
                [v1097 intValue];
              }
              -[GEOPDGuidesHomeParameters addSupportedFixedSectionType:]((uint64_t)v1089);
            }
            uint64_t v1094 = [v1092 countByEnumeratingWithState:&v1441 objects:v1449 count:16];
            if (!v1094)
            {
LABEL_2220:

              a3 = v1379;
              id v1088 = objh;
              break;
            }
          }
        }

        if (a3) {
          v1099 = @"supportedRepeatableSectionType";
        }
        else {
          v1099 = @"supported_repeatable_section_type";
        }
        v1100 = [v1088 objectForKeyedSubscript:v1099];
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          long long v1439 = 0u;
          long long v1440 = 0u;
          long long v1437 = 0u;
          long long v1438 = 0u;
          id v1101 = v1100;
          uint64_t v1102 = [v1101 countByEnumeratingWithState:&v1437 objects:&v1445 count:16];
          if (!v1102) {
            goto LABEL_2243;
          }
          uint64_t v1103 = v1102;
          uint64_t v1104 = *(void *)v1438;
          while (1)
          {
            for (uint64_t i18 = 0; i18 != v1103; ++i18)
            {
              if (*(void *)v1438 != v1104) {
                objc_enumerationMutation(v1101);
              }
              v1106 = *(void **)(*((void *)&v1437 + 1) + 8 * i18);
              objc_opt_class();
              if (objc_opt_isKindOfClass())
              {
                id v1107 = v1106;
                if (([v1107 isEqualToString:@"GUIDES_HOME_REPEATABLE_SECTION_TYPE_UNKNOWN"] & 1) == 0
                  && ([v1107 isEqualToString:@"GUIDES_HOME_REPEATABLE_SECTION_TYPE_GUIDES_HORIZONTAL_CAROUSEL"] & 1) == 0&& (objc_msgSend(v1107, "isEqualToString:", @"GUIDES_HOME_REPEATABLE_SECTION_TYPE_PUBLISHER") & 1) == 0&& (objc_msgSend(v1107, "isEqualToString:", @"GUIDES_HOME_REPEATABLE_SECTION_TYPE_GUIDES_VERTICAL_CAROUSEL") & 1) == 0)
                {
                  [v1107 isEqualToString:@"GUIDES_HOME_REPEATABLE_SECTION_TYPE_LOCATIONS"];
                }
              }
              else
              {
                objc_opt_class();
                if ((objc_opt_isKindOfClass() & 1) == 0) {
                  continue;
                }
                [v1106 intValue];
              }
              -[GEOPDGuidesHomeParameters addSupportedRepeatableSectionType:]((uint64_t)v1089);
            }
            uint64_t v1103 = [v1101 countByEnumeratingWithState:&v1437 objects:&v1445 count:16];
            if (!v1103)
            {
LABEL_2243:

              a3 = v1379;
              id v1088 = objh;
              break;
            }
          }
        }

        if (a3) {
          v1108 = @"viewportInfo";
        }
        else {
          v1108 = @"viewport_info";
        }
        v1109 = [v1088 objectForKeyedSubscript:v1108];
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          v1110 = [GEOPDViewportInfo alloc];
          if (a3) {
            v1111 = [(GEOPDViewportInfo *)v1110 initWithJSON:v1109];
          }
          else {
            v1111 = [(GEOPDViewportInfo *)v1110 initWithDictionary:v1109];
          }
          v1112 = v1111;
          -[GEOPDGuidesHomeParameters setViewportInfo:]((uint64_t)v1089, v1111);
        }
        if (a3) {
          v1113 = @"guidesLocationEntry";
        }
        else {
          v1113 = @"guides_location_entry";
        }
        v1114 = [v1088 objectForKeyedSubscript:v1113];
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          v1115 = [GEOPDGuidesLocationEntry alloc];
          if (v1115) {
            v1116 = (void *)-[GEOPDGuidesLocationEntry _initWithDictionary:isJSON:]((uint64_t)v1115, v1114, a3);
          }
          else {
            v1116 = 0;
          }
          -[GEOPDGuidesHomeParameters setGuidesLocationEntry:]((uint64_t)v1089, v1116);
        }
        if (a3) {
          v1117 = @"resultFilter";
        }
        else {
          v1117 = @"result_filter";
        }
        v1118 = [v1088 objectForKeyedSubscript:v1117];
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          v1119 = [GEOPDGuidesHomeResultFilter alloc];
          if (v1119) {
            v1120 = (void *)-[GEOPDGuidesHomeResultFilter _initWithDictionary:isJSON:](v1119, v1118, a3);
          }
          else {
            v1120 = 0;
          }
          -[GEOPDGuidesHomeParameters setResultFilter:]((uint64_t)v1089, v1120);
        }
        if (a3) {
          v1121 = @"refinementGuidesHome";
        }
        else {
          v1121 = @"refinement_guides_home";
        }
        v1122 = [v1088 objectForKeyedSubscript:v1121];
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          v1123 = [GEOPDResultRefinementGuidesHome alloc];
          if (v1123) {
            v1124 = (void *)-[GEOPDResultRefinementGuidesHome _initWithDictionary:isJSON:]((uint64_t)v1123, v1122, a3);
          }
          else {
            v1124 = 0;
          }
          -[GEOPDGuidesHomeParameters setRefinementGuidesHome:]((uint64_t)v1089, v1124);
        }
      }
    }
    else
    {
      v1089 = 0;
    }
    -[GEOPDPlaceRequestParameters setGuidesHomeParameters:]((uint64_t)v1335, v1089);
  }
  if (a3) {
    v1125 = @"extendedGeoLookupParameters";
  }
  else {
    v1125 = @"extended_geo_lookup_parameters";
  }
  v1126 = [v1357 objectForKeyedSubscript:v1125];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v1127 = [GEOPDExtendedGeoLookupParameters alloc];
    if (v1127)
    {
      id v1128 = v1126;
      v1127 = [(GEOPDExtendedGeoLookupParameters *)v1127 init];
      if (v1127)
      {
        if (a3) {
          v1129 = @"preserveFields";
        }
        else {
          v1129 = @"preserve_fields";
        }
        v1130 = [v1128 objectForKeyedSubscript:v1129];
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          v1131 = [GEOAddress alloc];
          if (a3) {
            v1132 = [(GEOAddress *)v1131 initWithJSON:v1130];
          }
          else {
            v1132 = [(GEOAddress *)v1131 initWithDictionary:v1130];
          }
          v1133 = v1132;
          -[GEOPDExtendedGeoLookupParameters setPreserveFields:]((uint64_t)v1127, v1132);
        }
        if (a3) {
          v1134 = @"primaryFeatureGeoId";
        }
        else {
          v1134 = @"primary_feature_geo_id";
        }
        v1135 = [v1128 objectForKeyedSubscript:v1134];
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          uint64_t v1136 = [v1135 unsignedLongLongValue];
          *(_WORD *)&v1127->_flags |= 0x400u;
          *(_WORD *)&v1127->_flags |= 1u;
          v1127->_primaryFeatureGeoId = v1136;
        }

        unsigned int v1137 = v1379;
        if (v1379) {
          v1138 = @"primaryFeatureLocation";
        }
        else {
          v1138 = @"primary_feature_location";
        }
        v1139 = [v1128 objectForKeyedSubscript:v1138];
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          v1140 = [GEOLatLng alloc];
          if (v1379) {
            v1141 = [(GEOLatLng *)v1140 initWithJSON:v1139];
          }
          else {
            v1141 = [(GEOLatLng *)v1140 initWithDictionary:v1139];
          }
          v1142 = v1141;
          -[GEOPDExtendedGeoLookupParameters setPrimaryFeatureLocation:]((uint64_t)v1127, v1141);

          unsigned int v1137 = v1379;
        }

        if (v1137) {
          v1143 = @"intersectingFeatureGeoId";
        }
        else {
          v1143 = @"intersecting_feature_geo_id";
        }
        v1144 = [v1128 objectForKeyedSubscript:v1143];
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          long long v1448 = 0u;
          long long v1447 = 0u;
          long long v1446 = 0u;
          long long v1445 = 0u;
          id v1145 = v1144;
          uint64_t v1146 = [v1145 countByEnumeratingWithState:&v1445 objects:v1449 count:16];
          if (v1146)
          {
            uint64_t v1147 = v1146;
            uint64_t v1148 = *(void *)v1446;
            do
            {
              for (uint64_t i19 = 0; i19 != v1147; ++i19)
              {
                if (*(void *)v1446 != v1148) {
                  objc_enumerationMutation(v1145);
                }
                v1150 = *(void **)(*((void *)&v1445 + 1) + 8 * i19);
                objc_opt_class();
                if (objc_opt_isKindOfClass())
                {
                  [v1150 unsignedLongLongValue];
                  -[GEOPDExtendedGeoLookupParameters addIntersectingFeatureGeoId:]((uint64_t)v1127);
                }
              }
              uint64_t v1147 = [v1145 countByEnumeratingWithState:&v1445 objects:v1449 count:16];
            }
            while (v1147);
          }
        }
        if (v1379) {
          v1151 = @"isLatlngRequest";
        }
        else {
          v1151 = @"is_latlng_request";
        }
        v1152 = [v1128 objectForKeyedSubscript:v1151];
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          char v1153 = [v1152 BOOLValue];
          *(_WORD *)&v1127->_flags |= 0x400u;
          *(_WORD *)&v1127->_flags |= 8u;
          v1127->_isLatlngRequest = v1153;
        }

        if (v1379) {
          v1154 = @"streetSubPostalGeoId";
        }
        else {
          v1154 = @"street_sub_postal_geo_id";
        }
        v1155 = [v1128 objectForKeyedSubscript:v1154];
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          uint64_t v1156 = [v1155 unsignedLongLongValue];
          *(_WORD *)&v1127->_flags |= 0x400u;
          *(_WORD *)&v1127->_flags |= 2u;
          v1127->_streetSubPostalGeoId = v1156;
        }

        if (v1379) {
          v1157 = @"dataSourceId";
        }
        else {
          v1157 = @"data_source_id";
        }
        v1158 = [v1128 objectForKeyedSubscript:v1157];
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          v1159 = (void *)[v1158 copy];
          -[GEOPDExtendedGeoLookupParameters setDataSourceId:]((uint64_t)v1127, v1159);
        }
        if (v1379) {
          v1160 = @"dataSourceIdRequired";
        }
        else {
          v1160 = @"data_source_id_required";
        }
        v1161 = [v1128 objectForKeyedSubscript:v1160];
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          char v1162 = [v1161 BOOLValue];
          *(_WORD *)&v1127->_flags |= 0x400u;
          *(_WORD *)&v1127->_flags |= 4u;
          v1127->_dataSourceIdRequired = v1162;
        }

        LODWORD(a3) = v1379;
        if (v1379) {
          v1163 = @"interpolationParameter";
        }
        else {
          v1163 = @"interpolation_parameter";
        }
        v1164 = [v1128 objectForKeyedSubscript:v1163];
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          v1165 = [GEOInterpolationParameters alloc];
          if (v1379) {
            v1166 = [(GEOInterpolationParameters *)v1165 initWithJSON:v1164];
          }
          else {
            v1166 = [(GEOInterpolationParameters *)v1165 initWithDictionary:v1164];
          }
          v1167 = v1166;
          -[GEOPDExtendedGeoLookupParameters setInterpolationParameter:]((uint64_t)v1127, v1166);
        }
      }
    }
    -[GEOPDPlaceRequestParameters setExtendedGeoLookupParameters:]((uint64_t)v1335, v1127);
  }
  if (a3) {
    v1168 = @"queryUnderstandingParameters";
  }
  else {
    v1168 = @"query_understanding_parameters";
  }
  v1169 = [v1357 objectForKeyedSubscript:v1168];
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    goto LABEL_2476;
  }
  v1170 = [GEOPDQueryUnderstandingParameters alloc];
  if (!v1170)
  {
    uint64_t v1173 = 0;
    goto LABEL_2475;
  }
  v1171 = v1170;
  id v1172 = v1169;
  uint64_t v1173 = [(GEOPDQueryUnderstandingParameters *)v1171 init];
  if (v1173)
  {
    v1174 = [v1172 objectForKeyedSubscript:@"type"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v1175 = v1174;
      if ([v1175 isEqualToString:@"QUERY_UNDERSTANDING_TYPE_UNKNOWN"])
      {
        int v1176 = 0;
      }
      else if ([v1175 isEqualToString:@"QUERY_UNDERSTANDING_TYPE_AUTOCOMPLETE"])
      {
        int v1176 = 1;
      }
      else if ([v1175 isEqualToString:@"QUERY_UNDERSTANDING_TYPE_CORE_SEARCH"])
      {
        int v1176 = 2;
      }
      else if ([v1175 isEqualToString:@"QUERY_UNDERSTANDING_TYPE_TAXONOMY_SEARCH"])
      {
        int v1176 = 3;
      }
      else if ([v1175 isEqualToString:@"QUERY_UNDERSTANDING_TYPE_TAXONOMY_LOOKUP"])
      {
        int v1176 = 4;
      }
      else
      {
        int v1176 = 0;
      }
    }
    else
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0) {
        goto LABEL_2370;
      }
      int v1176 = [v1174 intValue];
    }
    *(unsigned char *)(v1173 + 76) |= 0x80u;
    *(unsigned char *)(v1173 + 76) |= 1u;
    *(_DWORD *)(v1173 + 68) = v1176;
LABEL_2370:

    if (a3) {
      v1177 = @"searchString";
    }
    else {
      v1177 = @"search_string";
    }
    v1178 = [v1172 objectForKeyedSubscript:v1177];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v1179 = (void *)[v1178 copy];
      -[GEOPDQueryUnderstandingParameters setSearchString:](v1173, v1179);
    }
    if (a3) {
      v1180 = @"viewportInfo";
    }
    else {
      v1180 = @"viewport_info";
    }
    v1181 = [v1172 objectForKeyedSubscript:v1180];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v1182 = [GEOPDViewportInfo alloc];
      if (a3) {
        v1183 = [(GEOPDViewportInfo *)v1182 initWithJSON:v1181];
      }
      else {
        v1183 = [(GEOPDViewportInfo *)v1182 initWithDictionary:v1181];
      }
      v1184 = v1183;
      -[GEOPDQueryUnderstandingParameters setViewportInfo:](v1173, v1183);
    }
    v1185 = [v1172 objectForKeyedSubscript:@"workflow"];
    objc_opt_class();
    id v1403 = v1172;
    if (objc_opt_isKindOfClass())
    {
      id v1186 = v1185;
      if ([v1186 isEqualToString:@"QUERY_PROCESSING_WORKFLOW_TYPE_UNKNOWN"])
      {
        int v1187 = 0;
      }
      else if ([v1186 isEqualToString:@"QUERY_PROCESSING_WORKFLOW_TYPE_NORMALIZE"])
      {
        int v1187 = 1;
      }
      else if ([v1186 isEqualToString:@"QUERY_PROCESSING_WORKFLOW_TYPE_REWRITE"])
      {
        int v1187 = 2;
      }
      else if ([v1186 isEqualToString:@"QUERY_PROCESSING_WORKFLOW_TYPE_ENRICHMENTS"])
      {
        int v1187 = 3;
      }
      else if ([v1186 isEqualToString:@"QUERY_PROCESSING_WORKFLOW_TYPE_FULL_PROCESSING"])
      {
        int v1187 = 4;
      }
      else
      {
        int v1187 = 0;
      }
    }
    else
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0) {
        goto LABEL_2399;
      }
      int v1187 = [v1185 intValue];
    }
    *(unsigned char *)(v1173 + 76) |= 0x80u;
    *(unsigned char *)(v1173 + 76) |= 2u;
    *(_DWORD *)(v1173 + 72) = v1187;
    id v1172 = v1403;
LABEL_2399:

    if (a3) {
      v1188 = @"taxonomySearchParameters";
    }
    else {
      v1188 = @"taxonomy_search_parameters";
    }
    v1189 = [v1172 objectForKeyedSubscript:v1188];
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0) {
      goto LABEL_2439;
    }
    v1190 = [GEOPDQueryUnderstandingTaxonomySearchParameters alloc];
    if (!v1190)
    {
      uint64_t v1193 = 0;
      goto LABEL_2438;
    }
    v1191 = v1190;
    id v1192 = v1189;
    uint64_t v1193 = [(GEOPDQueryUnderstandingTaxonomySearchParameters *)v1191 init];
    if (!v1193)
    {
LABEL_2437:

LABEL_2438:
      -[GEOPDQueryUnderstandingParameters setTaxonomySearchParameters:](v1173, (void *)v1193);

      id v1172 = v1403;
LABEL_2439:

      if (a3) {
        v1208 = @"taxonomyLookupParameters";
      }
      else {
        v1208 = @"taxonomy_lookup_parameters";
      }
      v1209 = [v1172 objectForKeyedSubscript:v1208];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        v1210 = [GEOPDQueryUnderstandingTaxonomyLookupParameters alloc];
        if (v1210)
        {
          id v1211 = v1209;
          v1210 = [(GEOPDQueryUnderstandingTaxonomyLookupParameters *)v1210 init];
          if (v1210)
          {
            v1377 = v1169;
            v1212 = [v1211 objectForKeyedSubscript:@"identifier"];
            objc_opt_class();
            objuint64_t j = v1211;
            if (objc_opt_isKindOfClass())
            {
              long long v1443 = 0u;
              long long v1444 = 0u;
              long long v1441 = 0u;
              long long v1442 = 0u;
              id v1213 = v1212;
              uint64_t v1214 = [v1213 countByEnumeratingWithState:&v1441 objects:v1449 count:16];
              if (v1214)
              {
                uint64_t v1215 = v1214;
                uint64_t v1216 = *(void *)v1442;
                do
                {
                  for (uint64_t i20 = 0; i20 != v1215; ++i20)
                  {
                    if (*(void *)v1442 != v1216) {
                      objc_enumerationMutation(v1213);
                    }
                    v1218 = *(void **)(*((void *)&v1441 + 1) + 8 * i20);
                    objc_opt_class();
                    if (objc_opt_isKindOfClass())
                    {
                      v1219 = (void *)[v1218 copy];
                      -[GEOPDQueryUnderstandingTaxonomyLookupParameters addIdentifier:]((uint64_t)v1210, v1219);
                    }
                  }
                  uint64_t v1215 = [v1213 countByEnumeratingWithState:&v1441 objects:v1449 count:16];
                }
                while (v1215);
              }

              LODWORD(a3) = v1379;
              id v1211 = objj;
              id v1172 = v1403;
            }

            if (a3) {
              v1220 = @"categoryBranch";
            }
            else {
              v1220 = @"category_branch";
            }
            v1221 = [v1211 objectForKeyedSubscript:v1220];
            objc_opt_class();
            v1169 = v1377;
            if (objc_opt_isKindOfClass())
            {
              long long v1439 = 0u;
              long long v1440 = 0u;
              long long v1437 = 0u;
              long long v1438 = 0u;
              v1363 = v1221;
              id v1222 = v1221;
              uint64_t v1223 = [v1222 countByEnumeratingWithState:&v1437 objects:&v1445 count:16];
              if (v1223)
              {
                uint64_t v1224 = v1223;
                uint64_t v1225 = *(void *)v1438;
                do
                {
                  for (uint64_t i21 = 0; i21 != v1224; ++i21)
                  {
                    if (*(void *)v1438 != v1225) {
                      objc_enumerationMutation(v1222);
                    }
                    v1227 = *(void **)(*((void *)&v1437 + 1) + 8 * i21);
                    objc_opt_class();
                    if (objc_opt_isKindOfClass())
                    {
                      v1228 = (void *)[v1227 copy];
                      -[GEOPDQueryUnderstandingTaxonomyLookupParameters addCategoryBranch:]((uint64_t)v1210, v1228);
                    }
                  }
                  uint64_t v1224 = [v1222 countByEnumeratingWithState:&v1437 objects:&v1445 count:16];
                }
                while (v1224);
              }

              LODWORD(a3) = v1379;
              id v1211 = objj;
              id v1172 = v1403;
              v1221 = v1363;
            }
          }
        }
        -[GEOPDQueryUnderstandingParameters setTaxonomyLookupParameters:](v1173, v1210);
      }
      goto LABEL_2474;
    }
    if (a3) {
      v1194 = @"taxonomyType";
    }
    else {
      v1194 = @"taxonomy_type";
    }
    v1195 = [v1192 objectForKeyedSubscript:v1194];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      a3 = v1195;
      if ([(id)a3 isEqualToString:@"QUERY_UNDERSTANDING_TAXONOMY_TYPE_UNKNOWN"])
      {
        int v1196 = 0;
      }
      else if ([(id)a3 isEqualToString:@"QUERY_UNDERSTANDING_TAXONOMY_TYPE_CATEGORY"])
      {
        int v1196 = 1;
      }
      else if ([(id)a3 isEqualToString:@"QUERY_UNDERSTANDING_TAXONOMY_TYPE_BRAND"])
      {
        int v1196 = 2;
      }
      else
      {
        int v1196 = 0;
      }

      LODWORD(a3) = v1379;
    }
    else
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
LABEL_2420:

        v1197 = [v1192 objectForKeyedSubscript:v1177];
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          v1198 = (void *)[v1197 copy];
          -[GEOPDQueryUnderstandingTaxonomySearchParameters setSearchString:](v1193, v1198);
        }
        if (a3) {
          v1199 = @"categoryBranch";
        }
        else {
          v1199 = @"category_branch";
        }
        v1200 = [v1192 objectForKeyedSubscript:v1199];
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          objuint64_t i = v1192;
          long long v1448 = 0u;
          long long v1447 = 0u;
          long long v1446 = 0u;
          long long v1445 = 0u;
          v1376 = v1200;
          id v1201 = v1200;
          uint64_t v1202 = [v1201 countByEnumeratingWithState:&v1445 objects:v1449 count:16];
          if (v1202)
          {
            uint64_t v1203 = v1202;
            uint64_t v1204 = *(void *)v1446;
            do
            {
              for (uint64_t i22 = 0; i22 != v1203; ++i22)
              {
                if (*(void *)v1446 != v1204) {
                  objc_enumerationMutation(v1201);
                }
                v1206 = *(void **)(*((void *)&v1445 + 1) + 8 * i22);
                objc_opt_class();
                if (objc_opt_isKindOfClass())
                {
                  v1207 = (void *)[v1206 copy];
                  -[GEOPDQueryUnderstandingTaxonomySearchParameters addCategoryBranch:](v1193, v1207);
                }
              }
              uint64_t v1203 = [v1201 countByEnumeratingWithState:&v1445 objects:v1449 count:16];
            }
            while (v1203);
          }

          LODWORD(a3) = v1379;
          id v1192 = obji;
          v1200 = v1376;
        }

        goto LABEL_2437;
      }
      int v1196 = [v1195 intValue];
    }
    *(unsigned char *)(v1193 + 56) |= 0x10u;
    *(unsigned char *)(v1193 + 56) |= 1u;
    *(_DWORD *)(v1193 + 52) = v1196;
    goto LABEL_2420;
  }
LABEL_2474:

LABEL_2475:
  -[GEOPDPlaceRequestParameters setQueryUnderstandingParameters:]((uint64_t)v1335, (void *)v1173);

LABEL_2476:
  if (a3) {
    v1229 = @"poiAtAddressLookupParameters";
  }
  else {
    v1229 = @"poi_at_address_lookup_parameters";
  }
  v1230 = [v1357 objectForKeyedSubscript:v1229];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v1231 = [GEOPDPoiAtAddressLookupParameters alloc];
    if (v1231)
    {
      id v1232 = v1230;
      v1231 = [(GEOPDPoiAtAddressLookupParameters *)v1231 init];
      if (v1231)
      {
        v1233 = [v1232 objectForKeyedSubscript:@"component"];
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          long long v1448 = 0u;
          long long v1447 = 0u;
          long long v1446 = 0u;
          long long v1445 = 0u;
          id v1234 = v1233;
          uint64_t v1235 = [v1234 countByEnumeratingWithState:&v1445 objects:v1449 count:16];
          if (v1235)
          {
            uint64_t v1236 = v1235;
            uint64_t v1237 = *(void *)v1446;
            do
            {
              uint64_t v1238 = 0;
              do
              {
                if (*(void *)v1446 != v1237) {
                  objc_enumerationMutation(v1234);
                }
                v1239 = *(void **)(*((void *)&v1445 + 1) + 8 * v1238);
                objc_opt_class();
                if (objc_opt_isKindOfClass())
                {
                  v1240 = [GEOPDComponent alloc];
                  if (v1240) {
                    v1241 = -[GEOPDComponent _initWithDictionary:isJSON:]((char *)v1240, v1239, v1379);
                  }
                  else {
                    v1241 = 0;
                  }
                  -[GEOPDPoiAtAddressLookupParameters addComponent:]((uint64_t)v1231, v1241);
                }
                ++v1238;
              }
              while (v1236 != v1238);
              uint64_t v1242 = [v1234 countByEnumeratingWithState:&v1445 objects:v1449 count:16];
              uint64_t v1236 = v1242;
            }
            while (v1242);
          }

          LODWORD(a3) = v1379;
        }
      }
    }
    -[GEOPDPlaceRequestParameters setPoiAtAddressLookupParameters:]((uint64_t)v1335, v1231);
  }
  if (a3) {
    v1243 = @"transitNearbyPaymentMethodLookupParameters";
  }
  else {
    v1243 = @"transit_nearby_payment_method_lookup_parameters";
  }
  v1244 = [v1357 objectForKeyedSubscript:v1243];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v1245 = [GEOPDTransitNearbyPaymentMethodLookupParameters alloc];
    if (v1245)
    {
      id v1246 = v1244;
      v1245 = [(GEOPDTransitNearbyPaymentMethodLookupParameters *)v1245 init];
      if (v1245)
      {
        if (a3) {
          v1247 = @"transitNearbyPaymentMethodLookupOrigin";
        }
        else {
          v1247 = @"transit_nearby_payment_method_lookup_origin";
        }
        v1248 = [v1246 objectForKeyedSubscript:v1247];
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          objuint64_t k = v1246;
          id v1404 = v1244;
          long long v1448 = 0u;
          long long v1447 = 0u;
          long long v1446 = 0u;
          long long v1445 = 0u;
          v1378 = v1248;
          id v1249 = v1248;
          uint64_t v1250 = [v1249 countByEnumeratingWithState:&v1445 objects:v1449 count:16];
          if (v1250)
          {
            uint64_t v1251 = v1250;
            uint64_t v1252 = *(void *)v1446;
            if (a3) {
              v1253 = @"waypointTyped";
            }
            else {
              v1253 = @"waypoint_typed";
            }
            do
            {
              uint64_t v1254 = 0;
              do
              {
                if (*(void *)v1446 != v1252) {
                  objc_enumerationMutation(v1249);
                }
                v1255 = *(void **)(*((void *)&v1445 + 1) + 8 * v1254);
                objc_opt_class();
                if (objc_opt_isKindOfClass())
                {
                  v1256 = [GEOPDTransitNearbyPaymentMethodLookupOrigin alloc];
                  if (v1256)
                  {
                    v1257 = v1256;
                    id v1258 = v1255;
                    v1259 = [(GEOPDTransitNearbyPaymentMethodLookupOrigin *)v1257 init];
                    if (v1259)
                    {
                      v1260 = [v1258 objectForKeyedSubscript:v1253];
                      objc_opt_class();
                      if (objc_opt_isKindOfClass())
                      {
                        v1261 = [GEOWaypointTyped alloc];
                        if (v1379) {
                          v1262 = [(GEOWaypointTyped *)v1261 initWithJSON:v1260];
                        }
                        else {
                          v1262 = [(GEOWaypointTyped *)v1261 initWithDictionary:v1260];
                        }
                        v1263 = v1262;
                        -[GEOPDTransitNearbyPaymentMethodLookupOrigin setWaypointTyped:]((uint64_t)v1259, v1262);
                      }
                    }
                  }
                  else
                  {
                    v1259 = 0;
                  }
                  -[GEOPDTransitNearbyPaymentMethodLookupParameters addTransitNearbyPaymentMethodLookupOrigin:]((uint64_t)v1245, v1259);

                  LODWORD(a3) = v1379;
                }
                ++v1254;
              }
              while (v1251 != v1254);
              uint64_t v1264 = [v1249 countByEnumeratingWithState:&v1445 objects:v1449 count:16];
              uint64_t v1251 = v1264;
            }
            while (v1264);
          }

          id v1246 = objk;
          v1244 = v1404;
          v1248 = v1378;
        }
      }
    }
    -[GEOPDPlaceRequestParameters setTransitNearbyPaymentMethodLookupParameters:]((uint64_t)v1335, v1245);
  }
  if (a3) {
    v1265 = @"placecardEnrichmentParameters";
  }
  else {
    v1265 = @"placecard_enrichment_parameters";
  }
  v1266 = [v1357 objectForKeyedSubscript:v1265];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v1267 = [GEOPDPlacecardEnrichmentParameters alloc];
    if (v1267)
    {
      id v1268 = v1266;
      v1267 = [(GEOPDPlacecardEnrichmentParameters *)v1267 init];
      if (v1267)
      {
        if (a3) {
          v1269 = @"mapsId";
        }
        else {
          v1269 = @"maps_id";
        }
        v1270 = [v1268 objectForKeyedSubscript:v1269];
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          v1271 = [GEOPDMapsIdentifier alloc];
          if (a3) {
            v1272 = [(GEOPDMapsIdentifier *)v1271 initWithJSON:v1270];
          }
          else {
            v1272 = [(GEOPDMapsIdentifier *)v1271 initWithDictionary:v1270];
          }
          v1273 = v1272;
          -[GEOPDPlacecardEnrichmentParameters setMapsId:]((uint64_t)v1267, v1272);
        }
        if (a3) {
          v1274 = @"enrichmentInfo";
        }
        else {
          v1274 = @"enrichment_info";
        }
        v1275 = [v1268 objectForKeyedSubscript:v1274];
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          long long v1448 = 0u;
          long long v1447 = 0u;
          long long v1446 = 0u;
          long long v1445 = 0u;
          id v1276 = v1275;
          uint64_t v1277 = [v1276 countByEnumeratingWithState:&v1445 objects:v1449 count:16];
          if (v1277)
          {
            uint64_t v1278 = v1277;
            uint64_t v1279 = *(void *)v1446;
            do
            {
              uint64_t v1280 = 0;
              do
              {
                if (*(void *)v1446 != v1279) {
                  objc_enumerationMutation(v1276);
                }
                v1281 = *(void **)(*((void *)&v1445 + 1) + 8 * v1280);
                objc_opt_class();
                if (objc_opt_isKindOfClass())
                {
                  v1282 = [GEOPDEnrichmentInfo alloc];
                  if (v1282) {
                    v1283 = (void *)-[GEOPDEnrichmentInfo _initWithDictionary:isJSON:]((uint64_t)v1282, v1281, v1379);
                  }
                  else {
                    v1283 = 0;
                  }
                  -[GEOPDPlacecardEnrichmentParameters addEnrichmentInfo:]((uint64_t)v1267, v1283);
                }
                ++v1280;
              }
              while (v1278 != v1280);
              uint64_t v1284 = [v1276 countByEnumeratingWithState:&v1445 objects:v1449 count:16];
              uint64_t v1278 = v1284;
            }
            while (v1284);
          }

          LODWORD(a3) = v1379;
        }

        if (a3) {
          v1285 = @"skipHtml";
        }
        else {
          v1285 = @"skip_html";
        }
        v1286 = [v1268 objectForKeyedSubscript:v1285];
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          char v1287 = [v1286 BOOLValue];
          *(unsigned char *)&v1267->_flags |= 0x10u;
          *(unsigned char *)&v1267->_flags |= 1u;
          v1267->_skipHtml = v1287;
        }
      }
    }
    -[GEOPDPlaceRequestParameters setPlacecardEnrichmentParameters:]((uint64_t)v1335, v1267);
  }
  if (a3) {
    v1288 = @"offlineRegionNameParameters";
  }
  else {
    v1288 = @"offline_region_name_parameters";
  }
  v1289 = [v1357 objectForKeyedSubscript:v1288];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v1290 = [GEOPDOfflineRegionNameParameters alloc];
    if (v1290)
    {
      id v1291 = v1289;
      v1290 = [(GEOPDOfflineRegionNameParameters *)v1290 init];
      if (v1290)
      {
        v1292 = [v1291 objectForKeyedSubscript:@"region"];
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          v1293 = [GEOMapRegion alloc];
          if (a3) {
            v1294 = [(GEOMapRegion *)v1293 initWithJSON:v1292];
          }
          else {
            v1294 = [(GEOMapRegion *)v1293 initWithDictionary:v1292];
          }
          v1295 = v1294;
          -[GEOPDOfflineRegionNameParameters setRegion:]((uint64_t)v1290, v1294);
        }
      }
    }
    -[GEOPDPlaceRequestParameters setOfflineRegionNameParameters:]((uint64_t)v1335, v1290);
  }
  if (a3) {
    v1296 = @"searchCapabilitiesParameters";
  }
  else {
    v1296 = @"search_capabilities_parameters";
  }
  v1297 = [v1357 objectForKeyedSubscript:v1296];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v1298 = [GEOPDSearchCapabilitiesParameters alloc];
    if (v1298)
    {
      id v1299 = v1297;
      v1298 = [(GEOPDSearchCapabilitiesParameters *)v1298 init];
      if (v1298)
      {
        if (a3) {
          v1300 = @"viewportInfo";
        }
        else {
          v1300 = @"viewport_info";
        }
        v1301 = [v1299 objectForKeyedSubscript:v1300];
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          v1302 = [GEOPDViewportInfo alloc];
          if (a3) {
            v1303 = [(GEOPDViewportInfo *)v1302 initWithJSON:v1301];
          }
          else {
            v1303 = [(GEOPDViewportInfo *)v1302 initWithDictionary:v1301];
          }
          v1304 = v1303;
          -[GEOPDSearchCapabilitiesParameters setViewportInfo:]((uint64_t)v1298, v1303);
        }
      }
    }
    -[GEOPDPlaceRequestParameters setSearchCapabilitiesParameters:]((uint64_t)v1335, v1298);
  }
  if (a3) {
    v1305 = @"refreshIdLookUpParameters";
  }
  else {
    v1305 = @"refresh_id_look_up_parameters";
  }
  v1306 = [v1357 objectForKeyedSubscript:v1305];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v1307 = [GEOPDRefreshIdLookUpParameters alloc];
    if (v1307)
    {
      id v1308 = v1306;
      v1307 = [(GEOPDRefreshIdLookUpParameters *)v1307 init];
      if (v1307)
      {
        if (a3) {
          v1309 = @"mapsId";
        }
        else {
          v1309 = @"maps_id";
        }
        v1310 = [v1308 objectForKeyedSubscript:v1309];
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          long long v1448 = 0u;
          long long v1447 = 0u;
          long long v1446 = 0u;
          long long v1445 = 0u;
          id v1311 = v1310;
          uint64_t v1312 = [v1311 countByEnumeratingWithState:&v1445 objects:v1449 count:16];
          if (v1312)
          {
            uint64_t v1313 = v1312;
            uint64_t v1314 = *(void *)v1446;
            do
            {
              for (uint64_t i23 = 0; i23 != v1313; ++i23)
              {
                if (*(void *)v1446 != v1314) {
                  objc_enumerationMutation(v1311);
                }
                uint64_t v1316 = *(void *)(*((void *)&v1445 + 1) + 8 * i23);
                objc_opt_class();
                if (objc_opt_isKindOfClass())
                {
                  v1317 = [GEOPDMapsIdentifier alloc];
                  if (v1379) {
                    v1318 = [(GEOPDMapsIdentifier *)v1317 initWithJSON:v1316];
                  }
                  else {
                    v1318 = [(GEOPDMapsIdentifier *)v1317 initWithDictionary:v1316];
                  }
                  v1319 = v1318;
                  -[GEOPDRefreshIdLookUpParameters addMapsId:]((uint64_t)v1307, v1318);
                }
              }
              uint64_t v1313 = [v1311 countByEnumeratingWithState:&v1445 objects:v1449 count:16];
            }
            while (v1313);
          }

          LODWORD(a3) = v1379;
        }
      }
    }
    -[GEOPDPlaceRequestParameters setRefreshIdLookUpParameters:]((uint64_t)v1335, v1307);
  }
  if (a3) {
    v1320 = @"addressRecommendationParameters";
  }
  else {
    v1320 = @"address_recommendation_parameters";
  }
  v1321 = [v1357 objectForKeyedSubscript:v1320];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v1322 = [GEOPDAddressRecommendationParameters alloc];
    if (v1322)
    {
      id v1323 = v1321;
      v1322 = [(GEOPDAddressRecommendationParameters *)v1322 init];
      if (v1322)
      {
        if (a3) {
          v1324 = @"countryOrRegion";
        }
        else {
          v1324 = @"country_or_region";
        }
        v1325 = [v1323 objectForKeyedSubscript:v1324];
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          v1326 = (void *)[v1325 copy];
          -[GEOPDAddressRecommendationParameters setCountryOrRegion:]((uint64_t)v1322, v1326);
        }
        if (a3) {
          v1327 = @"addressWithComponents";
        }
        else {
          v1327 = @"address_with_components";
        }
        v1328 = [v1323 objectForKeyedSubscript:v1327];
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          v1329 = [GEOPDAddressWithComponents alloc];
          if (v1329) {
            v1330 = -[GEOPDAddressWithComponents _initWithDictionary:isJSON:](v1329, v1328, a3);
          }
          else {
            v1330 = 0;
          }
          -[GEOPDAddressRecommendationParameters setAddressWithComponents:]((uint64_t)v1322, v1330);
        }
      }
    }
    -[GEOPDPlaceRequestParameters setAddressRecommendationParameters:]((uint64_t)v1335, v1322);
  }
  a1 = v1335;

LABEL_2655:
  return a1;
}

- (void)setSearchZeroKeywordCategorySuggestionParameters:(uint64_t)a1
{
  id v4 = a2;
  *(void *)(a1 + 476) |= 0x100400000000000uLL;
  objc_storeStrong((id *)(a1 + 384), a2);
}

- (uint64_t)hasGreenTeaWithValue:(uint64_t)result
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  if (result)
  {
    uint64_t v3 = result;
    -[GEOPDPlaceRequestParameters _readAddressObjectGeocodingParameters](result);
    uint64_t v4 = *(void *)(v3 + 24);
    if (v4)
    {
      -[GEOPDAddressObjectGeocodingParameters _readViewportInfo](*(void *)(v3 + 24));
      if ([*(id *)(v4 + 32) hasGreenTeaWithValue:a2]) {
        return 1;
      }
    }
    -[GEOPDPlaceRequestParameters _readAllCollectionsViewParameters](v3);
    uint64_t v5 = *(void *)(v3 + 48);
    if (v5)
    {
      -[GEOPDAllCollectionsViewParameters _readPublisherSuggestionParameters](*(void *)(v3 + 48));
      uint64_t v6 = *(void *)(v5 + 24);
      if (v6)
      {
        if ([*(id *)(v6 + 24) hasGreenTeaWithValue:a2]) {
          return 1;
        }
      }
      -[GEOPDAllCollectionsViewParameters _readResultFilter](v5);
      if (-[GEOPDAllCollectionsViewResultFilter hasGreenTeaWithValue:](*(void *)(v5 + 32), a2)) {
        return 1;
      }
      -[GEOPDAllCollectionsViewParameters _readViewportInfo](v5);
      if ([*(id *)(v5 + 40) hasGreenTeaWithValue:a2]) {
        return 1;
      }
    }
    -[GEOPDPlaceRequestParameters _readAllGuidesLocationsViewParameters](v3);
    uint64_t v7 = *(void *)(v3 + 56);
    if (v7)
    {
      if ([*(id *)(v7 + 16) hasGreenTeaWithValue:a2]) {
        return 1;
      }
    }
    -[GEOPDPlaceRequestParameters _readAutocompleteParameters](v3);
    if ([*(id *)(v3 + 64) hasGreenTeaWithValue:a2]) {
      return 1;
    }
    -[GEOPDPlaceRequestParameters _readBatchPopularNearbySearchParameters](v3);
    uint64_t v8 = *(void *)(v3 + 88);
    if (v8)
    {
      -[GEOPDBatchPopularNearbySearchParameters _readViewportInfo](*(void *)(v3 + 88));
      if ([*(id *)(v8 + 40) hasGreenTeaWithValue:a2]) {
        return 1;
      }
    }
    -[GEOPDPlaceRequestParameters _readBatchReverseGeocodingParameters](v3);
    uint64_t v9 = *(void *)(v3 + 96);
    if (v9)
    {
      -[GEOPDBatchReverseGeocodingParameters _readAssetLocations](*(void *)(v3 + 96));
      long long v32 = 0u;
      long long v33 = 0u;
      long long v30 = 0u;
      long long v31 = 0u;
      id v10 = *(id *)(v9 + 48);
      uint64_t v11 = [v10 countByEnumeratingWithState:&v30 objects:v34 count:16];
      if (v11)
      {
        uint64_t v12 = v11;
        uint64_t v13 = *(void *)v31;
        while (2)
        {
          for (uint64_t i = 0; i != v12; ++i)
          {
            if (*(void *)v31 != v13) {
              objc_enumerationMutation(v10);
            }
            if (objc_msgSend(*(id *)(*((void *)&v30 + 1) + 8 * i), "hasGreenTeaWithValue:", a2, (void)v30))
            {

              return 1;
            }
          }
          uint64_t v12 = [v10 countByEnumeratingWithState:&v30 objects:v34 count:16];
          if (v12) {
            continue;
          }
          break;
        }
      }
    }
    -[GEOPDPlaceRequestParameters _readBatchSpatialLookupParameters](v3);
    if (-[GEOPDBatchSpatialLookupParameters hasGreenTeaWithValue:](*(void *)(v3 + 104), a2)) {
      return 1;
    }
    -[GEOPDPlaceRequestParameters _readBrowseCategorySuggestionParameters](v3);
    if (-[GEOPDSearchBrowseCategorySuggestionParameters hasGreenTeaWithValue:](*(void *)(v3 + 120), a2)) {
      return 1;
    }
    -[GEOPDPlaceRequestParameters _readCategorySearchParameters](v3);
    if (-[GEOPDCategorySearchParameters hasGreenTeaWithValue:](*(void *)(v3 + 136), a2)) {
      return 1;
    }
    -[GEOPDPlaceRequestParameters _readCollectionSuggestionParameters](v3);
    if (-[GEOPDCollectionSuggestionParameters hasGreenTeaWithValue:](*(void *)(v3 + 152), a2)) {
      return 1;
    }
    -[GEOPDPlaceRequestParameters _readExtendedGeoLookupParameters](v3);
    uint64_t v15 = *(void *)(v3 + 160);
    if (v15)
    {
      -[GEOPDExtendedGeoLookupParameters _readPrimaryFeatureLocation](*(void *)(v3 + 160));
      if ([*(id *)(v15 + 80) hasGreenTeaWithValue:a2]) {
        return 1;
      }
    }
    -[GEOPDPlaceRequestParameters _readExternalTransitLookupParameters](v3);
    uint64_t v16 = *(void *)(v3 + 168);
    if (v16)
    {
      -[GEOPDExternalTransitLookupParameters _readTransactionLocation](*(void *)(v3 + 168));
      if ([*(id *)(v16 + 40) hasGreenTeaWithValue:a2]) {
        return 1;
      }
    }
    -[GEOPDPlaceRequestParameters _readFeatureIdGeocodingParameters](v3);
    uint64_t v17 = *(void *)(v3 + 176);
    if (v17)
    {
      -[GEOPDFeatureIdGeocodingParameters _readLocation](*(void *)(v3 + 176));
      if ([*(id *)(v17 + 56) hasGreenTeaWithValue:a2]) {
        return 1;
      }
    }
    -[GEOPDPlaceRequestParameters _readGeocodingParameters](v3);
    if (-[GEOPDGeocodingParameters hasGreenTeaWithValue:](*(void *)(v3 + 184), a2)) {
      return 1;
    }
    -[GEOPDPlaceRequestParameters _readGroundViewLabelParameters](v3);
    uint64_t v18 = *(void *)(v3 + 192);
    if (v18)
    {
      if ([*(id *)(v18 + 24) hasGreenTeaWithValue:a2]) {
        return 1;
      }
    }
    -[GEOPDPlaceRequestParameters _readGuidesHomeParameters](v3);
    if (-[GEOPDGuidesHomeParameters hasGreenTeaWithValue:](*(void *)(v3 + 200), a2)) {
      return 1;
    }
    -[GEOPDPlaceRequestParameters _readLocationDirectedSearchParameters](v3);
    if (-[GEOPDLocationDirectedSearchParameters hasGreenTeaWithValue:](*(void *)(v3 + 216), a2)) {
      return 1;
    }
    -[GEOPDPlaceRequestParameters _readMapsHomeParameters](v3);
    uint64_t v19 = *(void *)(v3 + 224);
    if (v19)
    {
      if (-[GEOPDCollectionSuggestionParameters hasGreenTeaWithValue:](*(void *)(v19 + 16), a2)) {
        return 1;
      }
    }
    -[GEOPDPlaceRequestParameters _readMapsIdentifierPlaceLookupParameters](v3);
    if (-[GEOPDMapsIdentifierPlaceLookupParameters hasGreenTeaWithValue:](*(void *)(v3 + 232), a2)) {
      return 1;
    }
    -[GEOPDPlaceRequestParameters _readMapsSearchHomeParameters](v3);
    if (-[GEOPDMapsSearchHomeParameters hasGreenTeaWithValue:](*(void *)(v3 + 240), a2)) {
      return 1;
    }
    -[GEOPDPlaceRequestParameters _readMerchantLookupParameters](v3);
    if ([*(id *)(v3 + 248) hasGreenTeaWithValue:a2]) {
      return 1;
    }
    -[GEOPDPlaceRequestParameters _readNearbySearchParameters](v3);
    uint64_t v20 = *(void *)(v3 + 256);
    if (v20)
    {
      -[GEOPDNearbySearchParameters _readViewportInfo](*(void *)(v3 + 256));
      if ([*(id *)(v20 + 32) hasGreenTeaWithValue:a2]) {
        return 1;
      }
    }
    -[GEOPDPlaceRequestParameters _readOfflineRegionNameParameters](v3);
    uint64_t v21 = *(void *)(v3 + 264);
    if (v21)
    {
      if ([*(id *)(v21 + 16) hasGreenTeaWithValue:a2]) {
        return 1;
      }
    }
    -[GEOPDPlaceRequestParameters _readPlaceCollectionLookupParameter](v3);
    if (-[GEOPDPlaceCollectionLookupParameters hasGreenTeaWithValue:](*(void *)(v3 + 272), a2)) {
      return 1;
    }
    -[GEOPDPlaceRequestParameters _readPlaceQuestionnaireLookupParameters](v3);
    if (-[GEOPDPlaceQuestionnaireLookupParameters hasGreenTeaWithValue:](*(void *)(v3 + 288), a2)) {
      return 1;
    }
    -[GEOPDPlaceRequestParameters _readPlaceRefinementParameters](v3);
    if (-[GEOPDPlaceRefinementParameters hasGreenTeaWithValue:](*(void *)(v3 + 296), a2)) {
      return 1;
    }
    -[GEOPDPlaceRequestParameters _readPlacecardEnrichmentParameters](v3);
    uint64_t v22 = *(void *)(v3 + 304);
    if (v22)
    {
      -[GEOPDPlacecardEnrichmentParameters _readMapsId](*(void *)(v3 + 304));
      if ([*(id *)(v22 + 32) hasGreenTeaWithValue:a2]) {
        return 1;
      }
    }
    -[GEOPDPlaceRequestParameters _readPoiAtAddressLookupParameters](v3);
    if (-[GEOPDPoiAtAddressLookupParameters hasGreenTeaWithValue:](*(void *)(v3 + 312), a2)) {
      return 1;
    }
    -[GEOPDPlaceRequestParameters _readPopularNearbySearchParameters](v3);
    uint64_t v23 = *(void *)(v3 + 320);
    if (v23)
    {
      -[GEOPDPopularNearbySearchParameters _readViewportInfo](*(void *)(v3 + 320));
      if ([*(id *)(v23 + 32) hasGreenTeaWithValue:a2]) {
        return 1;
      }
    }
    -[GEOPDPlaceRequestParameters _readPublisherViewParameters](v3);
    if (-[GEOPDPublisherViewParameters hasGreenTeaWithValue:](*(void *)(v3 + 328), a2)) {
      return 1;
    }
    -[GEOPDPlaceRequestParameters _readQueryUnderstandingParameters](v3);
    uint64_t v24 = *(void *)(v3 + 336);
    if (v24)
    {
      -[GEOPDQueryUnderstandingParameters _readViewportInfo](*(void *)(v3 + 336));
      if ([*(id *)(v24 + 48) hasGreenTeaWithValue:a2]) {
        return 1;
      }
    }
    -[GEOPDPlaceRequestParameters _readRefreshIdLookUpParameters](v3);
    if (-[GEOPDRefreshIdLookUpParameters hasGreenTeaWithValue:](*(void *)(v3 + 344), a2)) {
      return 1;
    }
    -[GEOPDPlaceRequestParameters _readReverseGeocodingParameters](v3);
    if (-[GEOPDReverseGeocodingParameters hasGreenTeaWithValue:](*(void *)(v3 + 352), a2)) {
      return 1;
    }
    -[GEOPDPlaceRequestParameters _readSearchCapabilitiesParameters](v3);
    uint64_t v25 = *(void *)(v3 + 360);
    if (v25)
    {
      if ([*(id *)(v25 + 16) hasGreenTeaWithValue:a2]) {
        return 1;
      }
    }
    -[GEOPDPlaceRequestParameters _readSearchParameters](v3);
    if (-[GEOPDSearchParameters hasGreenTeaWithValue:](*(void *)(v3 + 376), a2)) {
      return 1;
    }
    -[GEOPDPlaceRequestParameters _readSearchZeroKeywordCategorySuggestionParameters](v3);
    uint64_t v26 = *(void *)(v3 + 384);
    if (v26)
    {
      if ([*(id *)(v26 + 24) hasGreenTeaWithValue:a2]) {
        return 1;
      }
    }
    -[GEOPDPlaceRequestParameters _readSiriSearchParameters](v3);
    uint64_t v27 = *(void *)(v3 + 400);
    if (v27)
    {
      -[GEOPDSiriSearchParameters _readViewportInfo](*(void *)(v3 + 400));
      if ([*(id *)(v27 + 72) hasGreenTeaWithValue:a2]) {
        return 1;
      }
    }
    -[GEOPDPlaceRequestParameters _readTransitNearbyPaymentMethodLookupParameters](v3);
    if (-[GEOPDTransitNearbyPaymentMethodLookupParameters hasGreenTeaWithValue:](*(void *)(v3 + 416), a2)) {
      return 1;
    }
    -[GEOPDPlaceRequestParameters _readTransitNearbyScheduleLookupParameters](v3);
    if (-[GEOPDTransitNearbyScheduleLookupParameters hasGreenTeaWithValue:](*(void *)(v3 + 424), a2)) {
      return 1;
    }
    -[GEOPDPlaceRequestParameters _readVendorSpecificPlaceRefinementParameters](v3);
    uint64_t v28 = *(void *)(v3 + 448);
    if (v28
      && (-[GEOPDVendorSpecificPlaceRefinementParameters _readLocationHint](*(void *)(v3 + 448)),
          ([*(id *)(v28 + 56) hasGreenTeaWithValue:a2] & 1) != 0))
    {
      return 1;
    }
    else
    {
      -[GEOPDPlaceRequestParameters _readWifiFingerprintParameters](v3);
      uint64_t v29 = *(void *)(v3 + 456);
      return -[GEOPDWifiFingerprintParameters hasGreenTeaWithValue:](v29, a2);
    }
  }
  return result;
}

- (void)clearUnknownFields:(uint64_t)a1
{
  uint64_t v284 = *MEMORY[0x1E4F143B8];
  if (a1)
  {
    os_unfair_lock_lock_with_options();
    *(void *)(a1 + 476) |= 0x100000000000001uLL;
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 472));
    v2 = *(void **)(a1 + 16);
    *(void *)(a1 + 16) = 0;

    -[GEOPDPlaceRequestParameters readAll:](a1, 0);
    uint64_t v3 = *(void *)(a1 + 376);
    if (v3)
    {
      os_unfair_lock_lock_with_options();
      *(void *)(v3 + 372) |= 0x20000001000uLL;
      os_unfair_lock_unlock((os_unfair_lock_t)(v3 + 336));
      uint64_t v4 = *(void **)(v3 + 16);
      *(void *)(v3 + 16) = 0;

      -[GEOPDSearchParameters readAll:](v3, 0);
      [*(id *)(v3 + 320) clearUnknownFields:1];
      [*(id *)(v3 + 304) clearUnknownFields:1];
      uint64_t v5 = *(void *)(v3 + 280);
      if (v5)
      {
        uint64_t v6 = *(void **)(v5 + 8);
        *(void *)(v5 + 8) = 0;
      }
      -[GEOPDSSearchLocationParameters clearUnknownFields:](*(void *)(v3 + 248), 1);
      -[GEOPDRecentRouteInfo clearUnknownFields:](*(void *)(v3 + 208));
      -[GEOPDSSearchFilter clearUnknownFields:](*(void *)(v3 + 240), 1);
      -[GEOPDRetainedSearchMetadata clearUnknownFields:](*(void *)(v3 + 224), 1);
      -[GEOPDSInferredSignals clearUnknownFields:](*(void *)(v3 + 168), 1);
      -[GEOPDSSearchEvChargingParameters clearUnknownFields:](*(void *)(v3 + 160), 1);
      -[GEOPDETAFilter clearUnknownFields:](*(void *)(v3 + 152), 1);
      [*(id *)(v3 + 216) clearUnknownFields:1];
      [*(id *)(v3 + 192) clearUnknownFields:1];
      -[GEOPDSearchOriginationInfo clearUnknownFields:](*(void *)(v3 + 256), 1);
      long long v281 = 0u;
      long long v282 = 0u;
      long long v279 = 0u;
      long long v280 = 0u;
      id v7 = *(id *)(v3 + 232);
      uint64_t v8 = [v7 countByEnumeratingWithState:&v279 objects:v283 count:16];
      if (v8)
      {
        uint64_t v9 = v8;
        uint64_t v10 = *(void *)v280;
        do
        {
          for (uint64_t i = 0; i != v9; ++i)
          {
            if (*(void *)v280 != v10) {
              objc_enumerationMutation(v7);
            }
            uint64_t v12 = *(void *)(*((void *)&v279 + 1) + 8 * i);
            if (v12)
            {
              uint64_t v13 = *(void **)(v12 + 8);
              *(void *)(v12 + 8) = 0;
            }
          }
          uint64_t v9 = [v7 countByEnumeratingWithState:&v279 objects:v283 count:16];
        }
        while (v9);
      }

      uint64_t v14 = *(void *)(v3 + 264);
      if (v14)
      {
        uint64_t v15 = *(void **)(v14 + 8);
        *(void *)(v14 + 8) = 0;
      }
      [*(id *)(v3 + 176) clearUnknownFields:1];
      -[GEOPDSPunchInHints clearUnknownFields:](*(void *)(v3 + 200), 1);
      [*(id *)(v3 + 288) clearUnknownFields:1];
      uint64_t v16 = *(void *)(v3 + 184);
      if (v16)
      {
        uint64_t v17 = *(void **)(v16 + 8);
        *(void *)(v16 + 8) = 0;
      }
    }
    uint64_t v18 = *(void *)(a1 + 184);
    if (v18)
    {
      os_unfair_lock_lock_with_options();
      *(_WORD *)(v18 + 84) |= 4u;
      *(_WORD *)(v18 + 84) |= 0x100u;
      os_unfair_lock_unlock((os_unfair_lock_t)(v18 + 72));
      uint64_t v19 = *(void **)(v18 + 16);
      *(void *)(v18 + 16) = 0;

      -[GEOPDGeocodingParameters readAll:](v18, 0);
      [*(id *)(v18 + 56) clearUnknownFields:1];
      [*(id *)(v18 + 48) clearUnknownFields:1];
      -[GEOPDSPunchInHints clearUnknownFields:](*(void *)(v18 + 32), 1);
      -[GEOPDAddressResultSubTypeFilter clearUnknownFields:](*(void *)(v18 + 24), 1);
    }
    uint64_t v20 = *(void *)(a1 + 128);
    if (v20)
    {
      uint64_t v21 = *(void **)(v20 + 8);
      *(void *)(v20 + 8) = 0;
    }
    uint64_t v22 = *(void *)(a1 + 352);
    if (v22)
    {
      os_unfair_lock_lock_with_options();
      *(unsigned char *)(v22 + 60) |= 4u;
      *(unsigned char *)(v22 + 60) |= 0x20u;
      os_unfair_lock_unlock((os_unfair_lock_t)(v22 + 48));
      uint64_t v23 = *(void **)(v22 + 16);
      *(void *)(v22 + 16) = 0;

      -[GEOPDReverseGeocodingParameters readAll:](v22, 0);
      long long v277 = 0u;
      long long v278 = 0u;
      long long v275 = 0u;
      long long v276 = 0u;
      id v24 = *(id *)(v22 + 32);
      uint64_t v25 = [v24 countByEnumeratingWithState:&v275 objects:v283 count:16];
      if (v25)
      {
        uint64_t v26 = v25;
        uint64_t v27 = *(void *)v276;
        do
        {
          for (uint64_t j = 0; j != v26; ++j)
          {
            if (*(void *)v276 != v27) {
              objc_enumerationMutation(v24);
            }
            [*(id *)(*((void *)&v275 + 1) + 8 * j) clearUnknownFields:1];
          }
          uint64_t v26 = [v24 countByEnumeratingWithState:&v275 objects:v283 count:16];
        }
        while (v26);
      }

      long long v273 = 0u;
      long long v274 = 0u;
      long long v271 = 0u;
      long long v272 = 0u;
      id v29 = *(id *)(v22 + 24);
      uint64_t v30 = [v29 countByEnumeratingWithState:&v271 objects:&v279 count:16];
      if (v30)
      {
        uint64_t v31 = v30;
        uint64_t v32 = *(void *)v272;
        do
        {
          for (uint64_t k = 0; k != v31; ++k)
          {
            if (*(void *)v272 != v32) {
              objc_enumerationMutation(v29);
            }
            [*(id *)(*((void *)&v271 + 1) + 8 * k) clearUnknownFields:1];
          }
          uint64_t v31 = [v29 countByEnumeratingWithState:&v271 objects:&v279 count:16];
        }
        while (v31);
      }
    }
    uint64_t v34 = *(void *)(a1 + 280);
    if (v34)
    {
      os_unfair_lock_lock_with_options();
      *(unsigned char *)(v34 + 76) |= 4u;
      *(unsigned char *)(v34 + 76) |= 0x20u;
      os_unfair_lock_unlock((os_unfair_lock_t)(v34 + 64));
      uint64_t v35 = *(void **)(v34 + 16);
      *(void *)(v34 + 16) = 0;

      -[GEOPDPlaceLookupParameters readAll:](v34, 0);
      long long v281 = 0u;
      long long v282 = 0u;
      long long v279 = 0u;
      long long v280 = 0u;
      id v36 = *(id *)(v34 + 48);
      uint64_t v37 = [v36 countByEnumeratingWithState:&v279 objects:v283 count:16];
      if (v37)
      {
        uint64_t v38 = v37;
        uint64_t v39 = *(void *)v280;
        do
        {
          for (uint64_t m = 0; m != v38; ++m)
          {
            if (*(void *)v280 != v39) {
              objc_enumerationMutation(v36);
            }
            -[GEOPlaceIdentifier clearUnknownFields:](*(void *)(*((void *)&v279 + 1) + 8 * m), 1);
          }
          uint64_t v38 = [v36 countByEnumeratingWithState:&v279 objects:v283 count:16];
        }
        while (v38);
      }
    }
    [*(id *)(a1 + 248) clearUnknownFields:1];
    uint64_t v41 = *(void *)(a1 + 296);
    if (v41)
    {
      os_unfair_lock_lock_with_options();
      *(_WORD *)(v41 + 108) |= 0x20u;
      *(_WORD *)(v41 + 108) |= 0x1000u;
      os_unfair_lock_unlock((os_unfair_lock_t)(v41 + 88));
      unint64_t v42 = *(void **)(v41 + 16);
      *(void *)(v41 + 16) = 0;

      -[GEOPDPlaceRefinementParameters readAll:](v41, 0);
      [*(id *)(v41 + 48) clearUnknownFields:1];
      [*(id *)(v41 + 24) clearUnknownFields:1];
      [*(id *)(v41 + 56) clearUnknownFields:1];
    }
    uint64_t v43 = *(void *)(a1 + 400);
    if (v43)
    {
      os_unfair_lock_lock_with_options();
      *(_WORD *)(v43 + 104) |= 0x10u;
      *(_WORD *)(v43 + 104) |= 0x1000u;
      os_unfair_lock_unlock((os_unfair_lock_t)(v43 + 88));
      unint64_t v44 = *(void **)(v43 + 16);
      *(void *)(v43 + 16) = 0;

      -[GEOPDSiriSearchParameters readAll:](v43, 0);
      [*(id *)(v43 + 72) clearUnknownFields:1];
      [*(id *)(v43 + 24) clearUnknownFields:1];
      long long v281 = 0u;
      long long v282 = 0u;
      long long v279 = 0u;
      long long v280 = 0u;
      id v45 = *(id *)(v43 + 64);
      uint64_t v46 = [v45 countByEnumeratingWithState:&v279 objects:v283 count:16];
      if (v46)
      {
        uint64_t v47 = v46;
        uint64_t v48 = *(void *)v280;
        do
        {
          for (uint64_t n = 0; n != v47; ++n)
          {
            if (*(void *)v280 != v48) {
              objc_enumerationMutation(v45);
            }
            uint64_t v50 = *(void *)(*((void *)&v279 + 1) + 8 * n);
            if (v50)
            {
              id v51 = *(void **)(v50 + 8);
              *(void *)(v50 + 8) = 0;
            }
          }
          uint64_t v47 = [v45 countByEnumeratingWithState:&v279 objects:v283 count:16];
        }
        while (v47);
      }

      -[GEOPDIndexQueryNode clearUnknownFields:](*(void *)(v43 + 40));
      -[GEOPDRecentRouteInfo clearUnknownFields:](*(void *)(v43 + 48));
    }
    uint64_t v52 = *(void *)(a1 + 216);
    if (v52)
    {
      os_unfair_lock_lock_with_options();
      *(_WORD *)(v52 + 96) |= 8u;
      *(_WORD *)(v52 + 96) |= 0x400u;
      os_unfair_lock_unlock((os_unfair_lock_t)(v52 + 80));
      unint64_t v53 = *(void **)(v52 + 16);
      *(void *)(v52 + 16) = 0;

      -[GEOPDLocationDirectedSearchParameters readAll:](v52, 0);
      [*(id *)(v52 + 64) clearUnknownFields:1];
      [*(id *)(v52 + 48) clearUnknownFields:1];
      uint64_t v54 = *(void *)(v52 + 24);
      if (v54)
      {
        uint64_t v55 = *(void **)(v54 + 8);
        *(void *)(v54 + 8) = 0;
      }
      uint64_t v56 = *(void *)(v52 + 32);
      if (v56)
      {
        uint64_t v57 = *(void **)(v56 + 8);
        *(void *)(v56 + 8) = 0;
      }
      -[GEOPDSSearchFilter clearUnknownFields:](*(void *)(v52 + 40), 1);
    }
    [*(id *)(a1 + 64) clearUnknownFields:1];
    -[GEOPDSearchBrowseCategorySuggestionParameters clearUnknownFields:](*(void *)(a1 + 120));
    uint64_t v58 = *(void *)(a1 + 136);
    if (v58)
    {
      os_unfair_lock_lock_with_options();
      *(_DWORD *)(v58 + 288) |= 0x200u;
      *(_DWORD *)(v58 + 288) |= 0x10000000u;
      os_unfair_lock_unlock((os_unfair_lock_t)(v58 + 256));
      uint64_t v59 = *(void **)(v58 + 16);
      *(void *)(v58 + 16) = 0;

      -[GEOPDCategorySearchParameters readAll:](v58, 0);
      [*(id *)(v58 + 240) clearUnknownFields:1];
      -[GEOPDRecentRouteInfo clearUnknownFields:](*(void *)(v58 + 184));
      -[GEOPDSSearchEvChargingParameters clearUnknownFields:](*(void *)(v58 + 160), 1);
      -[GEOPDETAFilter clearUnknownFields:](*(void *)(v58 + 152), 1);
      [*(id *)(v58 + 192) clearUnknownFields:1];
      [*(id *)(v58 + 176) clearUnknownFields:1];
      -[GEOPDSearchOriginationInfo clearUnknownFields:](*(void *)(v58 + 208), 1);
      long long v281 = 0u;
      long long v282 = 0u;
      long long v279 = 0u;
      long long v280 = 0u;
      id v60 = *(id *)(v58 + 200);
      uint64_t v61 = [v60 countByEnumeratingWithState:&v279 objects:v283 count:16];
      if (v61)
      {
        uint64_t v62 = v61;
        uint64_t v63 = *(void *)v280;
        do
        {
          for (iuint64_t i = 0; ii != v62; ++ii)
          {
            if (*(void *)v280 != v63) {
              objc_enumerationMutation(v60);
            }
            uint64_t v65 = *(void *)(*((void *)&v279 + 1) + 8 * ii);
            if (v65)
            {
              int v66 = *(void **)(v65 + 8);
              *(void *)(v65 + 8) = 0;
            }
          }
          uint64_t v62 = [v60 countByEnumeratingWithState:&v279 objects:v283 count:16];
        }
        while (v62);
      }

      uint64_t v67 = *(void *)(v58 + 216);
      if (v67)
      {
        id v68 = *(void **)(v67 + 8);
        *(void *)(v67 + 8) = 0;
      }
      [*(id *)(v58 + 224) clearUnknownFields:1];
      uint64_t v69 = *(void *)(v58 + 168);
      if (v69)
      {
        id v70 = *(void **)(v69 + 8);
        *(void *)(v69 + 8) = 0;
      }
    }
    uint64_t v71 = *(void *)(a1 + 320);
    if (v71)
    {
      os_unfair_lock_lock_with_options();
      *(unsigned char *)(v71 + 60) |= 4u;
      *(unsigned char *)(v71 + 60) |= 0x20u;
      os_unfair_lock_unlock((os_unfair_lock_t)(v71 + 48));
      id v72 = *(void **)(v71 + 16);
      *(void *)(v71 + 16) = 0;

      -[GEOPDPopularNearbySearchParameters readAll:](v71, 0);
      [*(id *)(v71 + 32) clearUnknownFields:1];
    }
    uint64_t v73 = *(void *)(a1 + 384);
    if (v73)
    {
      uint64_t v74 = *(void **)(v73 + 8);
      *(void *)(v73 + 8) = 0;

      [*(id *)(v73 + 24) clearUnknownFields:1];
    }
    uint64_t v75 = *(void *)(a1 + 368);
    if (v75)
    {
      uint64_t v76 = *(void **)(v75 + 8);
      *(void *)(v75 + 8) = 0;
    }
    uint64_t v77 = *(void *)(a1 + 88);
    if (v77)
    {
      os_unfair_lock_lock_with_options();
      *(unsigned char *)(v77 + 64) |= 4u;
      *(unsigned char *)(v77 + 64) |= 0x20u;
      os_unfair_lock_unlock((os_unfair_lock_t)(v77 + 56));
      id v78 = *(void **)(v77 + 16);
      *(void *)(v77 + 16) = 0;

      -[GEOPDBatchPopularNearbySearchParameters readAll:](v77, 0);
      [*(id *)(v77 + 40) clearUnknownFields:1];
    }
    uint64_t v79 = *(void *)(a1 + 448);
    if (v79)
    {
      os_unfair_lock_lock_with_options();
      *(_WORD *)(v79 + 112) |= 0x10u;
      *(_WORD *)(v79 + 112) |= 0x1000u;
      os_unfair_lock_unlock((os_unfair_lock_t)(v79 + 96));
      BOOL v80 = *(void **)(v79 + 16);
      *(void *)(v79 + 16) = 0;

      -[GEOPDVendorSpecificPlaceRefinementParameters readAll:](v79, 0);
      [*(id *)(v79 + 56) clearUnknownFields:1];
      [*(id *)(v79 + 24) clearUnknownFields:1];
    }
    uint64_t v81 = *(void *)(a1 + 256);
    if (v81)
    {
      os_unfair_lock_lock_with_options();
      *(unsigned char *)(v81 + 60) |= 4u;
      *(unsigned char *)(v81 + 60) |= 0x20u;
      os_unfair_lock_unlock((os_unfair_lock_t)(v81 + 48));
      uint64_t v82 = *(void **)(v81 + 16);
      *(void *)(v81 + 16) = 0;

      -[GEOPDNearbySearchParameters readAll:](v81, 0);
      [*(id *)(v81 + 32) clearUnknownFields:1];
      uint64_t v83 = *(void *)(v81 + 24);
      if (v83)
      {
        id v84 = *(void **)(v83 + 8);
        *(void *)(v83 + 8) = 0;
      }
    }
    uint64_t v85 = *(void *)(a1 + 24);
    if (v85)
    {
      os_unfair_lock_lock_with_options();
      *(unsigned char *)(v85 + 56) |= 2u;
      *(unsigned char *)(v85 + 56) |= 0x10u;
      os_unfair_lock_unlock((os_unfair_lock_t)(v85 + 48));
      uint64_t v86 = *(void **)(v85 + 16);
      *(void *)(v85 + 16) = 0;

      -[GEOPDAddressObjectGeocodingParameters readAll:](v85, 0);
      [*(id *)(v85 + 32) clearUnknownFields:1];
    }
    uint64_t v87 = *(void *)(a1 + 392);
    if (v87)
    {
      id v88 = *(void **)(v87 + 8);
      *(void *)(v87 + 8) = 0;
    }
    uint64_t v89 = *(void *)(a1 + 168);
    if (v89)
    {
      os_unfair_lock_lock_with_options();
      *(unsigned char *)(v89 + 68) |= 2u;
      *(unsigned char *)(v89 + 68) |= 0x20u;
      os_unfair_lock_unlock((os_unfair_lock_t)(v89 + 64));
      uint64_t v90 = *(void **)(v89 + 16);
      *(void *)(v89 + 16) = 0;

      -[GEOPDExternalTransitLookupParameters readAll:](v89, 0);
      [*(id *)(v89 + 40) clearUnknownFields:1];
    }
    uint64_t v91 = *(void *)(a1 + 176);
    if (v91)
    {
      os_unfair_lock_lock_with_options();
      *(unsigned char *)(v91 + 80) |= 4u;
      *(unsigned char *)(v91 + 80) |= 0x20u;
      os_unfair_lock_unlock((os_unfair_lock_t)(v91 + 72));
      uint64_t v92 = *(void **)(v91 + 16);
      *(void *)(v91 + 16) = 0;

      -[GEOPDFeatureIdGeocodingParameters readAll:](v91, 0);
      [*(id *)(v91 + 56) clearUnknownFields:1];
    }
    uint64_t v93 = *(void *)(a1 + 232);
    if (v93)
    {
      uint64_t v94 = *(void **)(v93 + 8);
      *(void *)(v93 + 8) = 0;

      long long v281 = 0u;
      long long v282 = 0u;
      long long v279 = 0u;
      long long v280 = 0u;
      id v95 = *(id *)(v93 + 16);
      uint64_t v96 = [v95 countByEnumeratingWithState:&v279 objects:v283 count:16];
      if (v96)
      {
        uint64_t v97 = v96;
        uint64_t v98 = *(void *)v280;
        do
        {
          for (juint64_t j = 0; jj != v97; ++jj)
          {
            if (*(void *)v280 != v98) {
              objc_enumerationMutation(v95);
            }
            [*(id *)(*((void *)&v279 + 1) + 8 * jj) clearUnknownFields:1];
          }
          uint64_t v97 = [v95 countByEnumeratingWithState:&v279 objects:v283 count:16];
        }
        while (v97);
      }
    }
    uint64_t v100 = *(void *)(a1 + 96);
    if (v100)
    {
      os_unfair_lock_lock_with_options();
      *(unsigned char *)(v100 + 68) |= 1u;
      *(unsigned char *)(v100 + 68) |= 8u;
      os_unfair_lock_unlock((os_unfair_lock_t)(v100 + 64));
      uint64_t v101 = *(void **)(v100 + 16);
      *(void *)(v100 + 16) = 0;

      -[GEOPDBatchReverseGeocodingParameters readAll:](v100, 0);
      long long v281 = 0u;
      long long v282 = 0u;
      long long v279 = 0u;
      long long v280 = 0u;
      id v102 = *(id *)(v100 + 48);
      uint64_t v103 = [v102 countByEnumeratingWithState:&v279 objects:v283 count:16];
      if (v103)
      {
        uint64_t v104 = v103;
        uint64_t v105 = *(void *)v280;
        do
        {
          for (kuint64_t k = 0; kk != v104; ++kk)
          {
            if (*(void *)v280 != v105) {
              objc_enumerationMutation(v102);
            }
            [*(id *)(*((void *)&v279 + 1) + 8 * kk) clearUnknownFields:1];
          }
          uint64_t v104 = [v102 countByEnumeratingWithState:&v279 objects:v283 count:16];
        }
        while (v104);
      }
    }
    uint64_t v107 = *(void *)(a1 + 112);
    if (v107)
    {
      uint64_t v108 = *(void **)(v107 + 8);
      *(void *)(v107 + 8) = 0;
    }
    uint64_t v261 = (void *)a1;
    uint64_t v109 = *(void *)(a1 + 456);
    if (v109)
    {
      uint64_t v110 = *(void **)(v109 + 8);
      *(void *)(v109 + 8) = 0;

      long long v265 = 0u;
      long long v266 = 0u;
      long long v263 = 0u;
      long long v264 = 0u;
      obuint64_t j = *(id *)(v109 + 16);
      uint64_t v111 = [obj countByEnumeratingWithState:&v263 objects:&v275 count:16];
      if (v111)
      {
        uint64_t v112 = v111;
        uint64_t v113 = *(void *)v264;
        do
        {
          for (muint64_t m = 0; mm != v112; ++mm)
          {
            if (*(void *)v264 != v113) {
              objc_enumerationMutation(obj);
            }
            uint64_t v115 = *(void *)(*((void *)&v263 + 1) + 8 * mm);
            if (v115)
            {
              os_unfair_lock_lock_with_options();
              *(unsigned char *)(v115 + 68) |= 4u;
              *(unsigned char *)(v115 + 68) |= 0x20u;
              os_unfair_lock_unlock((os_unfair_lock_t)(v115 + 64));
              uint64_t v116 = *(void **)(v115 + 16);
              *(void *)(v115 + 16) = 0;

              -[GEOPDWifiMeasurement readAll:](v115, 0);
              long long v273 = 0u;
              long long v274 = 0u;
              long long v271 = 0u;
              long long v272 = 0u;
              id v117 = *(id *)(v115 + 40);
              uint64_t v118 = [v117 countByEnumeratingWithState:&v271 objects:v283 count:16];
              if (v118)
              {
                uint64_t v119 = v118;
                uint64_t v120 = *(void *)v272;
                do
                {
                  for (nuint64_t n = 0; nn != v119; ++nn)
                  {
                    if (*(void *)v272 != v120) {
                      objc_enumerationMutation(v117);
                    }
                    objc_msgSend(*(id *)(*((void *)&v271 + 1) + 8 * nn), "clearUnknownFields:", 1, v261);
                  }
                  uint64_t v119 = [v117 countByEnumeratingWithState:&v271 objects:v283 count:16];
                }
                while (v119);
              }

              long long v269 = 0u;
              long long v270 = 0u;
              long long v267 = 0u;
              long long v268 = 0u;
              id v122 = *(id *)(v115 + 48);
              uint64_t v123 = [v122 countByEnumeratingWithState:&v267 objects:&v279 count:16];
              if (v123)
              {
                uint64_t v124 = v123;
                uint64_t v125 = *(void *)v268;
                do
                {
                  for (uint64_t i1 = 0; i1 != v124; ++i1)
                  {
                    if (*(void *)v268 != v125) {
                      objc_enumerationMutation(v122);
                    }
                    uint64_t v127 = *(void *)(*((void *)&v267 + 1) + 8 * i1);
                    if (v127)
                    {
                      unsigned int v128 = *(void **)(v127 + 8);
                      *(void *)(v127 + 8) = 0;
                    }
                  }
                  uint64_t v124 = [v122 countByEnumeratingWithState:&v267 objects:&v279 count:16];
                }
                while (v124);
              }
            }
          }
          uint64_t v112 = [obj countByEnumeratingWithState:&v263 objects:&v275 count:16];
        }
        while (v112);
      }
    }
    uint64_t v129 = v261;
    uint64_t v130 = v261[26];
    if (v130)
    {
      uint64_t v131 = *(void **)(v130 + 8);
      *(void *)(v130 + 8) = 0;
    }
    uint64_t v132 = v261[24];
    if (v132)
    {
      v133 = *(void **)(v132 + 8);
      *(void *)(v132 + 8) = 0;

      [*(id *)(v132 + 24) clearUnknownFields:1];
    }
    uint64_t v134 = v261[13];
    if (v134)
    {
      os_unfair_lock_lock_with_options();
      *(unsigned char *)(v134 + 52) |= 1u;
      *(unsigned char *)(v134 + 52) |= 8u;
      os_unfair_lock_unlock((os_unfair_lock_t)(v134 + 48));
      uint64_t v135 = *(void **)(v134 + 16);
      *(void *)(v134 + 16) = 0;

      -[GEOPDBatchSpatialLookupParameters readAll:](v134, 0);
      long long v277 = 0u;
      long long v278 = 0u;
      long long v275 = 0u;
      long long v276 = 0u;
      id v136 = *(id *)(v134 + 32);
      uint64_t v137 = [v136 countByEnumeratingWithState:&v275 objects:v283 count:16];
      if (v137)
      {
        uint64_t v138 = v137;
        uint64_t v139 = *(void *)v276;
        do
        {
          for (uint64_t i2 = 0; i2 != v138; ++i2)
          {
            if (*(void *)v276 != v139) {
              objc_enumerationMutation(v136);
            }
            -[GEOPDSpatialPlaceLookupParameters clearUnknownFields:](*(void *)(*((void *)&v275 + 1) + 8 * i2), 1);
          }
          uint64_t v138 = [v136 countByEnumeratingWithState:&v275 objects:v283 count:16];
        }
        while (v138);
      }

      long long v273 = 0u;
      long long v274 = 0u;
      long long v271 = 0u;
      long long v272 = 0u;
      id v141 = *(id *)(v134 + 24);
      uint64_t v142 = [v141 countByEnumeratingWithState:&v271 objects:&v279 count:16];
      if (v142)
      {
        uint64_t v143 = v142;
        uint64_t v144 = *(void *)v272;
        do
        {
          for (uint64_t i3 = 0; i3 != v143; ++i3)
          {
            if (*(void *)v272 != v144) {
              objc_enumerationMutation(v141);
            }
            -[GEOPDSpatialEventLookupParameters clearUnknownFields:](*(void *)(*((void *)&v271 + 1) + 8 * i3), 1);
          }
          uint64_t v143 = [v141 countByEnumeratingWithState:&v271 objects:&v279 count:16];
        }
        while (v143);
      }
    }
    uint64_t v146 = v261[55];
    if (v146)
    {
      uint64_t v147 = *(void **)(v146 + 8);
      *(void *)(v146 + 8) = 0;
    }
    uint64_t v148 = v261[34];
    if (v148)
    {
      os_unfair_lock_lock_with_options();
      *(unsigned char *)(v148 + 52) |= 1u;
      *(unsigned char *)(v148 + 52) |= 8u;
      os_unfair_lock_unlock((os_unfair_lock_t)(v148 + 48));
      uint64_t v149 = *(void **)(v148 + 16);
      *(void *)(v148 + 16) = 0;

      -[GEOPDPlaceCollectionLookupParameters readAll:](v148, 0);
      [*(id *)(v148 + 24) clearUnknownFields:1];
      long long v281 = 0u;
      long long v282 = 0u;
      long long v279 = 0u;
      long long v280 = 0u;
      id v150 = *(id *)(v148 + 32);
      uint64_t v151 = [v150 countByEnumeratingWithState:&v279 objects:v283 count:16];
      if (v151)
      {
        uint64_t v152 = v151;
        uint64_t v153 = *(void *)v280;
        do
        {
          for (uint64_t i4 = 0; i4 != v152; ++i4)
          {
            if (*(void *)v280 != v153) {
              objc_enumerationMutation(v150);
            }
            objc_msgSend(*(id *)(*((void *)&v279 + 1) + 8 * i4), "clearUnknownFields:", 1, v261);
          }
          uint64_t v152 = [v150 countByEnumeratingWithState:&v279 objects:v283 count:16];
        }
        while (v152);
      }
    }
    objc_msgSend((id)v129[54], "clearUnknownFields:", 1, v261);
    uint64_t v155 = v129[9];
    if (v155)
    {
      char v156 = *(void **)(v155 + 8);
      *(void *)(v155 + 8) = 0;

      long long v281 = 0u;
      long long v282 = 0u;
      long long v279 = 0u;
      long long v280 = 0u;
      id v157 = *(id *)(v155 + 16);
      uint64_t v158 = [v157 countByEnumeratingWithState:&v279 objects:v283 count:16];
      if (v158)
      {
        uint64_t v159 = v158;
        uint64_t v160 = *(void *)v280;
        do
        {
          for (uint64_t i5 = 0; i5 != v159; ++i5)
          {
            if (*(void *)v280 != v160) {
              objc_enumerationMutation(v157);
            }
            -[GEOPDCategoryLookupParameters clearUnknownFields:](*(void *)(*((void *)&v279 + 1) + 8 * i5), 1);
          }
          uint64_t v159 = [v157 countByEnumeratingWithState:&v279 objects:v283 count:16];
        }
        while (v159);
      }
    }
    uint64_t v162 = v129[10];
    if (v162)
    {
      uint64_t v163 = *(void **)(v162 + 8);
      *(void *)(v162 + 8) = 0;

      long long v281 = 0u;
      long long v282 = 0u;
      long long v279 = 0u;
      long long v280 = 0u;
      id v164 = *(id *)(v162 + 16);
      uint64_t v165 = [v164 countByEnumeratingWithState:&v279 objects:v283 count:16];
      if (v165)
      {
        uint64_t v166 = v165;
        uint64_t v167 = *(void *)v280;
        do
        {
          for (uint64_t i6 = 0; i6 != v166; ++i6)
          {
            if (*(void *)v280 != v167) {
              objc_enumerationMutation(v164);
            }
            uint64_t v169 = *(void *)(*((void *)&v279 + 1) + 8 * i6);
            if (v169)
            {
              os_unfair_lock_lock_with_options();
              *(_WORD *)(v169 + 92) |= 1u;
              *(_WORD *)(v169 + 92) |= 0x100u;
              os_unfair_lock_unlock((os_unfair_lock_t)(v169 + 88));
              v170 = *(void **)(v169 + 16);
              *(void *)(v169 + 16) = 0;

              -[GEOPDMerchantLookupBrandParameters readAll:](v169, 0);
              -[GEOPDWarsawMerchantIdentifier clearUnknownFields:](*(void *)(v169 + 72));
              uint64_t v171 = *(void *)(v169 + 24);
              if (v171)
              {
                int v172 = *(void **)(v171 + 8);
                *(void *)(v171 + 8) = 0;
              }
              uint64_t v173 = *(void *)(v169 + 32);
              if (v173)
              {
                v174 = *(void **)(v173 + 8);
                *(void *)(v173 + 8) = 0;
              }
            }
          }
          uint64_t v166 = [v164 countByEnumeratingWithState:&v279 objects:v283 count:16];
        }
        while (v166);
      }
    }
    uint64_t v175 = v129[18];
    if (v175)
    {
      id v176 = *(void **)(v175 + 8);
      *(void *)(v175 + 8) = 0;
    }
    -[GEOPDCollectionSuggestionParameters clearUnknownFields:](v129[19]);
    uint64_t v177 = v129[30];
    if (v177)
    {
      os_unfair_lock_lock_with_options();
      *(_WORD *)(v177 + 108) |= 1u;
      *(_WORD *)(v177 + 108) |= 0x100u;
      os_unfair_lock_unlock((os_unfair_lock_t)(v177 + 104));
      uint64_t v178 = *(void **)(v177 + 16);
      *(void *)(v177 + 16) = 0;

      -[GEOPDMapsSearchHomeParameters readAll:](v177, 0);
      -[GEOPDSearchBrowseCategorySuggestionParameters clearUnknownFields:](*(void *)(v177 + 80));
      -[GEOPDCollectionSuggestionParameters clearUnknownFields:](*(void *)(v177 + 48));
      -[GEOPDPublisherSuggestionParameters clearUnknownFields:](*(void *)(v177 + 72));
      uint64_t v179 = *(void *)(v177 + 64);
      if (v179)
      {
        os_unfair_lock_lock_with_options();
        *(unsigned char *)(v179 + 60) |= 1u;
        *(unsigned char *)(v179 + 60) |= 0x10u;
        os_unfair_lock_unlock((os_unfair_lock_t)(v179 + 56));
        v180 = *(void **)(v179 + 16);
        *(void *)(v179 + 16) = 0;

        -[GEOPDPlaceSuggestionParameters readAll:](v179, 0);
        [*(id *)(v179 + 40) clearUnknownFields:1];
        long long v281 = 0u;
        long long v282 = 0u;
        long long v279 = 0u;
        long long v280 = 0u;
        id v181 = *(id *)(v179 + 32);
        uint64_t v182 = [v181 countByEnumeratingWithState:&v279 objects:v283 count:16];
        if (v182)
        {
          uint64_t v183 = v182;
          uint64_t v184 = *(void *)v280;
          do
          {
            for (uint64_t i7 = 0; i7 != v183; ++i7)
            {
              if (*(void *)v280 != v184) {
                objc_enumerationMutation(v181);
              }
              [*(id *)(*((void *)&v279 + 1) + 8 * i7) clearUnknownFields:1];
            }
            uint64_t v183 = [v181 countByEnumeratingWithState:&v279 objects:v283 count:16];
          }
          while (v183);
        }
      }
      uint64_t v186 = *(void *)(v177 + 56);
      if (v186)
      {
        uint64_t v187 = *(void **)(v186 + 8);
        *(void *)(v186 + 8) = 0;

        [*(id *)(v186 + 16) clearUnknownFields:1];
      }
      -[GEOPDSearchOriginationInfo clearUnknownFields:](*(void *)(v177 + 88), 1);
    }
    uint64_t v188 = v129[41];
    if (v188)
    {
      os_unfair_lock_lock_with_options();
      *(unsigned char *)(v188 + 64) |= 2u;
      *(unsigned char *)(v188 + 64) |= 0x20u;
      os_unfair_lock_unlock((os_unfair_lock_t)(v188 + 56));
      v189 = *(void **)(v188 + 16);
      *(void *)(v188 + 16) = 0;

      -[GEOPDPublisherViewParameters readAll:](v188, 0);
      [*(id *)(v188 + 24) clearUnknownFields:1];
      -[GEOPDPublisherViewResultFilter clearUnknownFields:](*(void *)(v188 + 32));
      [*(id *)(v188 + 40) clearUnknownFields:1];
    }
    uint64_t v190 = v129[6];
    if (v190)
    {
      os_unfair_lock_lock_with_options();
      *(unsigned char *)(v190 + 64) |= 2u;
      *(unsigned char *)(v190 + 64) |= 0x20u;
      os_unfair_lock_unlock((os_unfair_lock_t)(v190 + 56));
      v191 = *(void **)(v190 + 16);
      *(void *)(v190 + 16) = 0;

      -[GEOPDAllCollectionsViewParameters readAll:](v190, 0);
      -[GEOPDPublisherSuggestionParameters clearUnknownFields:](*(void *)(v190 + 24));
      -[GEOPDAllCollectionsViewResultFilter clearUnknownFields:](*(void *)(v190 + 32));
      [*(id *)(v190 + 40) clearUnknownFields:1];
    }
    uint64_t v192 = v129[5];
    if (v192)
    {
      os_unfair_lock_lock_with_options();
      *(unsigned char *)(v192 + 60) |= 1u;
      *(unsigned char *)(v192 + 60) |= 0x10u;
      os_unfair_lock_unlock((os_unfair_lock_t)(v192 + 56));
      v193 = *(void **)(v192 + 16);
      *(void *)(v192 + 16) = 0;

      -[GEOPDAirportEntityPlaceLookupParameters readAll:](v192, 0);
    }
    uint64_t v194 = v129[51];
    if (v194)
    {
      id v195 = *(void **)(v194 + 8);
      *(void *)(v194 + 8) = 0;

      long long v281 = 0u;
      long long v282 = 0u;
      long long v279 = 0u;
      long long v280 = 0u;
      id v196 = *(id *)(v194 + 16);
      uint64_t v197 = [v196 countByEnumeratingWithState:&v279 objects:v283 count:16];
      if (v197)
      {
        uint64_t v198 = v197;
        uint64_t v199 = *(void *)v280;
        do
        {
          for (uint64_t i8 = 0; i8 != v198; ++i8)
          {
            if (*(void *)v280 != v199) {
              objc_enumerationMutation(v196);
            }
            [*(id *)(*((void *)&v279 + 1) + 8 * i8) clearUnknownFields:1];
          }
          uint64_t v198 = [v196 countByEnumeratingWithState:&v279 objects:v283 count:16];
        }
        while (v198);
      }
    }
    uint64_t v201 = v129[53];
    if (v201)
    {
      os_unfair_lock_lock_with_options();
      *(unsigned char *)(v201 + 52) |= 1u;
      *(unsigned char *)(v201 + 52) |= 8u;
      os_unfair_lock_unlock((os_unfair_lock_t)(v201 + 48));
      unint64_t v202 = *(void **)(v201 + 16);
      *(void *)(v201 + 16) = 0;

      -[GEOPDTransitNearbyScheduleLookupParameters readAll:](v201, 0);
      long long v281 = 0u;
      long long v282 = 0u;
      long long v279 = 0u;
      long long v280 = 0u;
      id v203 = *(id *)(v201 + 24);
      uint64_t v204 = [v203 countByEnumeratingWithState:&v279 objects:v283 count:16];
      if (v204)
      {
        uint64_t v205 = v204;
        uint64_t v206 = *(void *)v280;
        do
        {
          for (uint64_t i9 = 0; i9 != v205; ++i9)
          {
            if (*(void *)v280 != v206) {
              objc_enumerationMutation(v203);
            }
            uint64_t v208 = *(void *)(*((void *)&v279 + 1) + 8 * i9);
            if (v208)
            {
              v209 = *(void **)(v208 + 8);
              *(void *)(v208 + 8) = 0;

              [*(id *)(v208 + 16) clearUnknownFields:1];
            }
          }
          uint64_t v205 = [v203 countByEnumeratingWithState:&v279 objects:v283 count:16];
        }
        while (v205);
      }

      [*(id *)(v201 + 32) clearUnknownFields:1];
    }
    uint64_t v210 = v129[28];
    if (v210)
    {
      unint64_t v211 = *(void **)(v210 + 8);
      *(void *)(v210 + 8) = 0;

      -[GEOPDCollectionSuggestionParameters clearUnknownFields:](*(void *)(v210 + 16));
    }
    uint64_t v212 = v129[7];
    if (v212)
    {
      unint64_t v213 = *(void **)(v212 + 8);
      *(void *)(v212 + 8) = 0;

      [*(id *)(v212 + 16) clearUnknownFields:1];
    }
    uint64_t v214 = v129[25];
    if (v214)
    {
      os_unfair_lock_lock_with_options();
      *(unsigned char *)(v214 + 116) |= 1u;
      *(unsigned char *)(v214 + 116) |= 0x80u;
      os_unfair_lock_unlock((os_unfair_lock_t)(v214 + 112));
      v215 = *(void **)(v214 + 16);
      *(void *)(v214 + 16) = 0;

      -[GEOPDGuidesHomeParameters readAll:](v214, 0);
      [*(id *)(v214 + 96) clearUnknownFields:1];
      -[GEOPDGuidesLocationEntry clearUnknownFields:](*(void *)(v214 + 72), 1);
      -[GEOPDGuidesHomeResultFilter clearUnknownFields:](*(void *)(v214 + 88));
      -[GEOPDResultRefinementGuidesHome clearUnknownFields:](*(void *)(v214 + 80), 1);
    }
    uint64_t v216 = v129[20];
    if (v216)
    {
      os_unfair_lock_lock_with_options();
      *(_WORD *)(v216 + 112) |= 0x10u;
      *(_WORD *)(v216 + 112) |= 0x400u;
      os_unfair_lock_unlock((os_unfair_lock_t)(v216 + 104));
      v217 = *(void **)(v216 + 16);
      *(void *)(v216 + 16) = 0;

      -[GEOPDExtendedGeoLookupParameters readAll:](v216, 0);
      [*(id *)(v216 + 64) clearUnknownFields:1];
      [*(id *)(v216 + 80) clearUnknownFields:1];
      [*(id *)(v216 + 56) clearUnknownFields:1];
    }
    uint64_t v218 = v129[42];
    if (v218)
    {
      os_unfair_lock_lock_with_options();
      *(unsigned char *)(v218 + 76) |= 4u;
      *(unsigned char *)(v218 + 76) |= 0x80u;
      os_unfair_lock_unlock((os_unfair_lock_t)(v218 + 64));
      uint64_t v219 = *(void **)(v218 + 16);
      *(void *)(v218 + 16) = 0;

      -[GEOPDQueryUnderstandingParameters readAll:](v218, 0);
      [*(id *)(v218 + 48) clearUnknownFields:1];
      uint64_t v220 = *(void *)(v218 + 40);
      if (v220)
      {
        os_unfair_lock_lock_with_options();
        *(unsigned char *)(v220 + 56) |= 2u;
        *(unsigned char *)(v220 + 56) |= 0x10u;
        os_unfair_lock_unlock((os_unfair_lock_t)(v220 + 48));
        int v221 = *(void **)(v220 + 16);
        *(void *)(v220 + 16) = 0;

        -[GEOPDQueryUnderstandingTaxonomySearchParameters readAll:](v220, 0);
      }
      uint64_t v222 = *(void *)(v218 + 32);
      if (v222)
      {
        os_unfair_lock_lock_with_options();
        *(unsigned char *)(v222 + 52) |= 1u;
        *(unsigned char *)(v222 + 52) |= 8u;
        os_unfair_lock_unlock((os_unfair_lock_t)(v222 + 48));
        v223 = *(void **)(v222 + 16);
        *(void *)(v222 + 16) = 0;

        -[GEOPDQueryUnderstandingTaxonomyLookupParameters readAll:](v222, 0);
      }
    }
    uint64_t v224 = v129[39];
    if (v224)
    {
      id v225 = *(void **)(v224 + 8);
      *(void *)(v224 + 8) = 0;

      long long v281 = 0u;
      long long v282 = 0u;
      long long v279 = 0u;
      long long v280 = 0u;
      id v226 = *(id *)(v224 + 16);
      uint64_t v227 = [v226 countByEnumeratingWithState:&v279 objects:v283 count:16];
      if (v227)
      {
        uint64_t v228 = v227;
        uint64_t v229 = *(void *)v280;
        do
        {
          for (uint64_t i10 = 0; i10 != v228; ++i10)
          {
            if (*(void *)v280 != v229) {
              objc_enumerationMutation(v226);
            }
            -[GEOPDComponent clearUnknownFields:](*(void *)(*((void *)&v279 + 1) + 8 * i10), 1);
          }
          uint64_t v228 = [v226 countByEnumeratingWithState:&v279 objects:v283 count:16];
        }
        while (v228);
      }
    }
    uint64_t v231 = v129[52];
    if (v231)
    {
      v232 = *(void **)(v231 + 8);
      *(void *)(v231 + 8) = 0;

      long long v281 = 0u;
      long long v282 = 0u;
      long long v279 = 0u;
      long long v280 = 0u;
      id v233 = *(id *)(v231 + 16);
      uint64_t v234 = [v233 countByEnumeratingWithState:&v279 objects:v283 count:16];
      if (v234)
      {
        uint64_t v235 = v234;
        uint64_t v236 = *(void *)v280;
        do
        {
          for (uint64_t i11 = 0; i11 != v235; ++i11)
          {
            if (*(void *)v280 != v236) {
              objc_enumerationMutation(v233);
            }
            uint64_t v238 = *(void *)(*((void *)&v279 + 1) + 8 * i11);
            if (v238)
            {
              v239 = *(void **)(v238 + 8);
              *(void *)(v238 + 8) = 0;

              [*(id *)(v238 + 16) clearUnknownFields:1];
            }
          }
          uint64_t v235 = [v233 countByEnumeratingWithState:&v279 objects:v283 count:16];
        }
        while (v235);
      }
    }
    uint64_t v240 = v129[38];
    if (v240)
    {
      os_unfair_lock_lock_with_options();
      *(unsigned char *)(v240 + 56) |= 2u;
      *(unsigned char *)(v240 + 56) |= 0x10u;
      os_unfair_lock_unlock((os_unfair_lock_t)(v240 + 48));
      v241 = *(void **)(v240 + 16);
      *(void *)(v240 + 16) = 0;

      -[GEOPDPlacecardEnrichmentParameters readAll:](v240, 0);
      [*(id *)(v240 + 32) clearUnknownFields:1];
      long long v281 = 0u;
      long long v282 = 0u;
      long long v279 = 0u;
      long long v280 = 0u;
      id v242 = *(id *)(v240 + 24);
      uint64_t v243 = [v242 countByEnumeratingWithState:&v279 objects:v283 count:16];
      if (v243)
      {
        uint64_t v244 = v243;
        uint64_t v245 = *(void *)v280;
        do
        {
          for (uint64_t i12 = 0; i12 != v244; ++i12)
          {
            if (*(void *)v280 != v245) {
              objc_enumerationMutation(v242);
            }
            -[GEOPDEnrichmentInfo clearUnknownFields:](*(void *)(*((void *)&v279 + 1) + 8 * i12), 1);
          }
          uint64_t v244 = [v242 countByEnumeratingWithState:&v279 objects:v283 count:16];
        }
        while (v244);
      }
    }
    uint64_t v247 = v129[33];
    if (v247)
    {
      uint64_t v248 = *(void **)(v247 + 8);
      *(void *)(v247 + 8) = 0;

      [*(id *)(v247 + 16) clearUnknownFields:1];
    }
    uint64_t v249 = v129[45];
    if (v249)
    {
      v250 = *(void **)(v249 + 8);
      *(void *)(v249 + 8) = 0;

      [*(id *)(v249 + 16) clearUnknownFields:1];
    }
    uint64_t v251 = v129[43];
    if (v251)
    {
      BOOL v252 = *(void **)(v251 + 8);
      *(void *)(v251 + 8) = 0;

      long long v281 = 0u;
      long long v282 = 0u;
      long long v279 = 0u;
      long long v280 = 0u;
      id v253 = *(id *)(v251 + 16);
      uint64_t v254 = [v253 countByEnumeratingWithState:&v279 objects:v283 count:16];
      if (v254)
      {
        uint64_t v255 = v254;
        uint64_t v256 = *(void *)v280;
        do
        {
          for (uint64_t i13 = 0; i13 != v255; ++i13)
          {
            if (*(void *)v280 != v256) {
              objc_enumerationMutation(v253);
            }
            [*(id *)(*((void *)&v279 + 1) + 8 * i13) clearUnknownFields:1];
          }
          uint64_t v255 = [v253 countByEnumeratingWithState:&v279 objects:v283 count:16];
        }
        while (v255);
      }
    }
    uint64_t v258 = v129[4];
    if (v258)
    {
      os_unfair_lock_lock_with_options();
      *(unsigned char *)(v258 + 52) |= 1u;
      *(unsigned char *)(v258 + 52) |= 8u;
      os_unfair_lock_unlock((os_unfair_lock_t)(v258 + 48));
      id v259 = *(void **)(v258 + 16);
      *(void *)(v258 + 16) = 0;

      -[GEOPDAddressRecommendationParameters readAll:](v258, 0);
      uint64_t v260 = *(void *)(v258 + 24);
      -[GEOPDAddressWithComponents clearUnknownFields:](v260, 1);
    }
  }
}

- (GEOPDPlaceRequestParameters)initWithData:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)GEOPDPlaceRequestParameters;
  uint64_t v3 = [(GEOPDPlaceRequestParameters *)&v7 initWithData:a3];
  uint64_t v4 = v3;
  if (v3)
  {
    v3->_readerLock._os_unfair_lock_opaque = 0;
    uint64_t v5 = v3;
  }

  return v4;
}

- (void)setSearchParameters:(uint64_t)a1
{
  id v4 = a2;
  if (a1)
  {
    *(void *)(a1 + 476) |= 0x100200000000000uLL;
    objc_storeStrong((id *)(a1 + 376), a2);
  }
}

- (void)_readGeocodingParameters
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 472));
    if ((*(unsigned char *)(a1 + 478) & 0x20) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOPDPlaceRequestParametersReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readGeocodingParameters_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 472));
  }
}

- (id)geocodingParameters
{
  if (a1)
  {
    v2 = a1;
    -[GEOPDPlaceRequestParameters _readGeocodingParameters]((uint64_t)a1);
    a1 = (id *)v2[23];
    uint64_t v1 = vars8;
  }
  return a1;
}

- (void)setGeocodingParameters:(uint64_t)a1
{
  id v4 = a2;
  if (a1)
  {
    *(void *)(a1 + 476) |= 0x100000000200000uLL;
    objc_storeStrong((id *)(a1 + 184), a2);
  }
}

- (void)_readCanonicalLocationSearchParameters
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 472));
    if ((*(unsigned char *)(a1 + 477) & 0x40) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOPDPlaceRequestParametersReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readCanonicalLocationSearchParameters_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 472));
  }
}

- (id)canonicalLocationSearchParameters
{
  if (a1)
  {
    v2 = a1;
    -[GEOPDPlaceRequestParameters _readCanonicalLocationSearchParameters]((uint64_t)a1);
    a1 = (id *)v2[16];
    uint64_t v1 = vars8;
  }
  return a1;
}

- (void)setCanonicalLocationSearchParameters:(uint64_t)a1
{
  id v4 = a2;
  if (a1)
  {
    *(void *)(a1 + 476) |= 0x100000000004000uLL;
    objc_storeStrong((id *)(a1 + 128), a2);
  }
}

- (void)_readPlaceLookupParameters
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 472));
    if ((*(unsigned char *)(a1 + 480) & 2) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOPDPlaceRequestParametersReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readPlaceLookupParameters_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 472));
  }
}

- (id)placeLookupParameters
{
  if (a1)
  {
    v2 = a1;
    -[GEOPDPlaceRequestParameters _readPlaceLookupParameters]((uint64_t)a1);
    a1 = (id *)v2[35];
    uint64_t v1 = vars8;
  }
  return a1;
}

- (void)setPlaceLookupParameters:(uint64_t)a1
{
  id v4 = a2;
  if (a1)
  {
    *(void *)(a1 + 476) |= 0x100000200000000uLL;
    objc_storeStrong((id *)(a1 + 280), a2);
  }
}

- (void)setMerchantLookupParameters:(uint64_t)a1
{
  id v4 = a2;
  if (a1)
  {
    *(void *)(a1 + 476) |= 0x100000020000000uLL;
    objc_storeStrong((id *)(a1 + 248), a2);
  }
}

- (void)_readSiriSearchParameters
{
  os_unfair_lock_lock((os_unfair_lock_t)(a1 + 472));
  if ((*(unsigned char *)(a1 + 482) & 1) == 0)
  {
    v2 = *(void **)(a1 + 8);
    if (v2)
    {
      id v3 = v2;
      objc_sync_enter(v3);
      GEOPDPlaceRequestParametersReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readSiriSearchParameters_tags);
      objc_sync_exit(v3);
    }
  }

  os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 472));
}

- (void)setSiriSearchParameters:(uint64_t)a1
{
  id v4 = a2;
  *(void *)(a1 + 476) |= 0x101000000000000uLL;
  objc_storeStrong((id *)(a1 + 400), a2);
}

- (void)_readLocationDirectedSearchParameters
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 472));
    if ((*(unsigned char *)(a1 + 479) & 2) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOPDPlaceRequestParametersReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readLocationDirectedSearchParameters_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 472));
  }
}

- (id)locationDirectedSearchParameters
{
  if (a1)
  {
    v2 = a1;
    -[GEOPDPlaceRequestParameters _readLocationDirectedSearchParameters]((uint64_t)a1);
    a1 = (id *)v2[27];
    uint64_t v1 = vars8;
  }
  return a1;
}

- (void)setLocationDirectedSearchParameters:(uint64_t)a1
{
  id v4 = a2;
  if (a1)
  {
    *(void *)(a1 + 476) |= 0x100000002000000uLL;
    objc_storeStrong((id *)(a1 + 216), a2);
  }
}

- (void)setAutocompleteParameters:(uint64_t)a1
{
  id v4 = a2;
  if (a1)
  {
    *(void *)(a1 + 476) |= 0x100000000000040uLL;
    objc_storeStrong((id *)(a1 + 64), a2);
  }
}

- (void)_readBrowseCategorySuggestionParameters
{
  os_unfair_lock_lock((os_unfair_lock_t)(a1 + 472));
  if ((*(unsigned char *)(a1 + 477) & 0x20) == 0)
  {
    v2 = *(void **)(a1 + 8);
    if (v2)
    {
      id v3 = v2;
      objc_sync_enter(v3);
      GEOPDPlaceRequestParametersReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readBrowseCategorySuggestionParameters_tags);
      objc_sync_exit(v3);
    }
  }

  os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 472));
}

- (void)setBrowseCategorySuggestionParameters:(uint64_t)a1
{
  id v4 = a2;
  if (a1)
  {
    *(void *)(a1 + 476) |= 0x100000000002000uLL;
    objc_storeStrong((id *)(a1 + 120), a2);
  }
}

- (void)_readCategorySearchParameters
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 472));
    if ((*(unsigned char *)(a1 + 477) & 0x80) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOPDPlaceRequestParametersReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readCategorySearchParameters_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 472));
  }
}

- (id)categorySearchParameters
{
  if (a1)
  {
    v2 = a1;
    -[GEOPDPlaceRequestParameters _readCategorySearchParameters]((uint64_t)a1);
    a1 = (id *)v2[17];
    uint64_t v1 = vars8;
  }
  return a1;
}

- (void)setCategorySearchParameters:(uint64_t)a1
{
  id v4 = a2;
  if (a1)
  {
    *(void *)(a1 + 476) |= 0x100000000008000uLL;
    objc_storeStrong((id *)(a1 + 136), a2);
  }
}

- (void)_readPopularNearbySearchParameters
{
  os_unfair_lock_lock((os_unfair_lock_t)(a1 + 472));
  if ((*(unsigned char *)(a1 + 480) & 0x40) == 0)
  {
    v2 = *(void **)(a1 + 8);
    if (v2)
    {
      id v3 = v2;
      objc_sync_enter(v3);
      GEOPDPlaceRequestParametersReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readPopularNearbySearchParameters_tags);
      objc_sync_exit(v3);
    }
  }

  os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 472));
}

- (void)setPopularNearbySearchParameters:(uint64_t)a1
{
  id v4 = a2;
  *(void *)(a1 + 476) |= 0x100004000000000uLL;
  objc_storeStrong((id *)(a1 + 320), a2);
}

- (void)_readSearchZeroKeywordCategorySuggestionParameters
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 472));
    if ((*(unsigned char *)(a1 + 481) & 0x40) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOPDPlaceRequestParametersReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readSearchZeroKeywordCategorySuggestionParameters_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 472));
  }
}

- (id)searchZeroKeywordCategorySuggestionParameters
{
  if (a1)
  {
    v2 = a1;
    -[GEOPDPlaceRequestParameters _readSearchZeroKeywordCategorySuggestionParameters]((uint64_t)a1);
    a1 = (id *)v2[48];
    uint64_t v1 = vars8;
  }
  return a1;
}

- (void)_readBatchPopularNearbySearchParameters
{
  os_unfair_lock_lock((os_unfair_lock_t)(a1 + 472));
  if ((*(unsigned char *)(a1 + 477) & 2) == 0)
  {
    v2 = *(void **)(a1 + 8);
    if (v2)
    {
      id v3 = v2;
      objc_sync_enter(v3);
      GEOPDPlaceRequestParametersReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readBatchPopularNearbySearchParameters_tags);
      objc_sync_exit(v3);
    }
  }

  os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 472));
}

- (void)setBatchPopularNearbySearchParameters:(uint64_t)a1
{
  id v4 = a2;
  *(void *)(a1 + 476) |= 0x100000000000200uLL;
  objc_storeStrong((id *)(a1 + 88), a2);
}

- (void)_readVendorSpecificPlaceRefinementParameters
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 472));
    if ((*(unsigned char *)(a1 + 482) & 0x40) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOPDPlaceRequestParametersReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readVendorSpecificPlaceRefinementParameters_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 472));
  }
}

- (id)vendorSpecificPlaceRefinementParameters
{
  if (a1)
  {
    v2 = a1;
    -[GEOPDPlaceRequestParameters _readVendorSpecificPlaceRefinementParameters]((uint64_t)a1);
    a1 = (id *)v2[56];
    uint64_t v1 = vars8;
  }
  return a1;
}

- (void)setVendorSpecificPlaceRefinementParameters:(uint64_t)a1
{
  id v4 = a2;
  if (a1)
  {
    *(void *)(a1 + 476) |= 0x140000000000000uLL;
    objc_storeStrong((id *)(a1 + 448), a2);
  }
}

- (void)_readNearbySearchParameters
{
  os_unfair_lock_lock((os_unfair_lock_t)(a1 + 472));
  if ((*(unsigned char *)(a1 + 479) & 0x40) == 0)
  {
    v2 = *(void **)(a1 + 8);
    if (v2)
    {
      id v3 = v2;
      objc_sync_enter(v3);
      GEOPDPlaceRequestParametersReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readNearbySearchParameters_tags);
      objc_sync_exit(v3);
    }
  }

  os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 472));
}

- (void)setNearbySearchParameters:(uint64_t)a1
{
  id v4 = a2;
  *(void *)(a1 + 476) |= 0x100000040000000uLL;
  objc_storeStrong((id *)(a1 + 256), a2);
}

- (void)_readAddressObjectGeocodingParameters
{
  os_unfair_lock_lock((os_unfair_lock_t)(a1 + 472));
  if ((*(unsigned char *)(a1 + 476) & 2) == 0)
  {
    v2 = *(void **)(a1 + 8);
    if (v2)
    {
      id v3 = v2;
      objc_sync_enter(v3);
      GEOPDPlaceRequestParametersReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readAddressObjectGeocodingParameters_tags);
      objc_sync_exit(v3);
    }
  }

  os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 472));
}

- (void)setAddressObjectGeocodingParameters:(uint64_t)a1
{
  id v4 = a2;
  *(void *)(a1 + 476) |= 0x100000000000002uLL;
  objc_storeStrong((id *)(a1 + 24), a2);
}

- (void)setSearchZeroKeywordWithSearchResultsSuggestionParameters:(uint64_t)a1
{
  id v4 = a2;
  *(void *)(a1 + 476) |= 0x100800000000000uLL;
  objc_storeStrong((id *)(a1 + 392), a2);
}

- (void)setExternalTransitLookupParameters:(uint64_t)a1
{
  id v4 = a2;
  if (a1)
  {
    *(void *)(a1 + 476) |= 0x100000000080000uLL;
    objc_storeStrong((id *)(a1 + 168), a2);
  }
}

- (void)_readFeatureIdGeocodingParameters
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 472));
    if ((*(unsigned char *)(a1 + 478) & 0x10) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOPDPlaceRequestParametersReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readFeatureIdGeocodingParameters_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 472));
  }
}

- (id)featureIdGeocodingParameters
{
  if (a1)
  {
    v2 = a1;
    -[GEOPDPlaceRequestParameters _readFeatureIdGeocodingParameters]((uint64_t)a1);
    a1 = (id *)v2[22];
    uint64_t v1 = vars8;
  }
  return a1;
}

- (void)setFeatureIdGeocodingParameters:(uint64_t)a1
{
  id v4 = a2;
  *(void *)(a1 + 476) |= 0x100000000100000uLL;
  objc_storeStrong((id *)(a1 + 176), a2);
}

- (id)mapsIdentifierPlaceLookupParameters
{
  if (a1)
  {
    v2 = a1;
    -[GEOPDPlaceRequestParameters _readMapsIdentifierPlaceLookupParameters]((uint64_t)a1);
    a1 = (id *)v2[29];
    uint64_t v1 = vars8;
  }
  return a1;
}

- (void)setMapsIdentifierPlaceLookupParameters:(uint64_t)a1
{
  id v4 = a2;
  if (a1)
  {
    *(void *)(a1 + 476) |= 0x100000008000000uLL;
    objc_storeStrong((id *)(a1 + 232), a2);
  }
}

- (void)setBatchReverseGeocodingParameters:(uint64_t)a1
{
  id v4 = a2;
  if (a1)
  {
    *(void *)(a1 + 476) |= 0x100000000000400uLL;
    objc_storeStrong((id *)(a1 + 96), a2);
  }
}

- (void)_readBrandLookupParameters
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 472));
    if ((*(unsigned char *)(a1 + 477) & 0x10) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOPDPlaceRequestParametersReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readBrandLookupParameters_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 472));
  }
}

- (id)brandLookupParameters
{
  if (a1)
  {
    v2 = a1;
    -[GEOPDPlaceRequestParameters _readBrandLookupParameters]((uint64_t)a1);
    a1 = (id *)v2[14];
    uint64_t v1 = vars8;
  }
  return a1;
}

- (void)setBrandLookupParameters:(uint64_t)a1
{
  id v4 = a2;
  if (a1)
  {
    *(void *)(a1 + 476) |= 0x100000000001000uLL;
    objc_storeStrong((id *)(a1 + 112), a2);
  }
}

- (void)setWifiFingerprintParameters:(uint64_t)a1
{
  id v4 = a2;
  if (a1)
  {
    *(void *)(a1 + 476) |= 0x180000000000000uLL;
    objc_storeStrong((id *)(a1 + 456), a2);
  }
}

- (void)_readIpGeoLookupParameters
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 472));
    if ((*(unsigned char *)(a1 + 479) & 1) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOPDPlaceRequestParametersReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readIpGeoLookupParameters_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 472));
  }
}

- (id)ipGeoLookupParameters
{
  if (a1)
  {
    v2 = a1;
    -[GEOPDPlaceRequestParameters _readIpGeoLookupParameters]((uint64_t)a1);
    a1 = (id *)v2[26];
    uint64_t v1 = vars8;
  }
  return a1;
}

- (void)setIpGeoLookupParameters:(uint64_t)a1
{
  id v4 = a2;
  if (a1)
  {
    *(void *)(a1 + 476) |= 0x100000001000000uLL;
    objc_storeStrong((id *)(a1 + 208), a2);
  }
}

- (void)setGroundViewLabelParameters:(uint64_t)a1
{
  id v4 = a2;
  if (a1)
  {
    *(void *)(a1 + 476) |= 0x100000000400000uLL;
    objc_storeStrong((id *)(a1 + 192), a2);
  }
}

- (void)_readBatchSpatialLookupParameters
{
  os_unfair_lock_lock((os_unfair_lock_t)(a1 + 472));
  if ((*(unsigned char *)(a1 + 477) & 8) == 0)
  {
    v2 = *(void **)(a1 + 8);
    if (v2)
    {
      id v3 = v2;
      objc_sync_enter(v3);
      GEOPDPlaceRequestParametersReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readBatchSpatialLookupParameters_tags);
      objc_sync_exit(v3);
    }
  }

  os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 472));
}

- (void)setBatchSpatialLookupParameters:(uint64_t)a1
{
  id v4 = a2;
  if (a1)
  {
    *(void *)(a1 + 476) |= 0x100000000000800uLL;
    objc_storeStrong((id *)(a1 + 104), a2);
  }
}

- (void)setTransitVehiclePositionParameters:(uint64_t)a1
{
  id v4 = a2;
  if (a1)
  {
    *(void *)(a1 + 476) |= 0x120000000000000uLL;
    objc_storeStrong((id *)(a1 + 440), a2);
  }
}

- (void)_readPlaceCollectionLookupParameter
{
  os_unfair_lock_lock((os_unfair_lock_t)(a1 + 472));
  if ((*(unsigned char *)(a1 + 480) & 1) == 0)
  {
    v2 = *(void **)(a1 + 8);
    if (v2)
    {
      id v3 = v2;
      objc_sync_enter(v3);
      GEOPDPlaceRequestParametersReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readPlaceCollectionLookupParameter_tags);
      objc_sync_exit(v3);
    }
  }

  os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 472));
}

- (void)setBatchCategoryLookupParameters:(uint64_t)a1
{
  id v4 = a2;
  *(void *)(a1 + 476) |= 0x100000000000080uLL;
  objc_storeStrong((id *)(a1 + 72), a2);
}

- (void)setChildPlaceLookupByCategoryParameters:(uint64_t)a1
{
  id v4 = a2;
  if (a1)
  {
    *(void *)(a1 + 476) |= 0x100000000010000uLL;
    objc_storeStrong((id *)(a1 + 144), a2);
  }
}

- (void)_readCollectionSuggestionParameters
{
  os_unfair_lock_lock((os_unfair_lock_t)(a1 + 472));
  if ((*(unsigned char *)(a1 + 478) & 2) == 0)
  {
    v2 = *(void **)(a1 + 8);
    if (v2)
    {
      id v3 = v2;
      objc_sync_enter(v3);
      GEOPDPlaceRequestParametersReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readCollectionSuggestionParameters_tags_5398);
      objc_sync_exit(v3);
    }
  }

  os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 472));
}

- (void)setCollectionSuggestionParameters:(uint64_t)a1
{
  id v4 = a2;
  *(void *)(a1 + 476) |= 0x100000000020000uLL;
  objc_storeStrong((id *)(a1 + 152), a2);
}

- (void)_readMapsSearchHomeParameters
{
  os_unfair_lock_lock((os_unfair_lock_t)(a1 + 472));
  if ((*(unsigned char *)(a1 + 479) & 0x10) == 0)
  {
    v2 = *(void **)(a1 + 8);
    if (v2)
    {
      id v3 = v2;
      objc_sync_enter(v3);
      GEOPDPlaceRequestParametersReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readMapsSearchHomeParameters_tags);
      objc_sync_exit(v3);
    }
  }

  os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 472));
}

- (void)setMapsSearchHomeParameters:(uint64_t)a1
{
  id v4 = a2;
  if (a1)
  {
    *(void *)(a1 + 476) |= 0x100000010000000uLL;
    objc_storeStrong((id *)(a1 + 240), a2);
  }
}

- (void)_readPlaceQuestionnaireLookupParameters
{
  os_unfair_lock_lock((os_unfair_lock_t)(a1 + 472));
  if ((*(unsigned char *)(a1 + 480) & 4) == 0)
  {
    v2 = *(void **)(a1 + 8);
    if (v2)
    {
      id v3 = v2;
      objc_sync_enter(v3);
      GEOPDPlaceRequestParametersReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readPlaceQuestionnaireLookupParameters_tags);
      objc_sync_exit(v3);
    }
  }

  os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 472));
}

- (void)setPlaceQuestionnaireLookupParameters:(uint64_t)a1
{
  id v4 = a2;
  *(void *)(a1 + 476) |= 0x100000400000000uLL;
  objc_storeStrong((id *)(a1 + 288), a2);
}

- (void)_readPublisherViewParameters
{
  os_unfair_lock_lock((os_unfair_lock_t)(a1 + 472));
  if ((*(unsigned char *)(a1 + 480) & 0x80) == 0)
  {
    v2 = *(void **)(a1 + 8);
    if (v2)
    {
      id v3 = v2;
      objc_sync_enter(v3);
      GEOPDPlaceRequestParametersReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readPublisherViewParameters_tags);
      objc_sync_exit(v3);
    }
  }

  os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 472));
}

- (void)setPublisherViewParameters:(uint64_t)a1
{
  id v4 = a2;
  if (a1)
  {
    *(void *)(a1 + 476) |= 0x100008000000000uLL;
    objc_storeStrong((id *)(a1 + 328), a2);
  }
}

- (void)_readAllCollectionsViewParameters
{
  os_unfair_lock_lock((os_unfair_lock_t)(a1 + 472));
  if ((*(unsigned char *)(a1 + 476) & 0x10) == 0)
  {
    v2 = *(void **)(a1 + 8);
    if (v2)
    {
      id v3 = v2;
      objc_sync_enter(v3);
      GEOPDPlaceRequestParametersReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readAllCollectionsViewParameters_tags);
      objc_sync_exit(v3);
    }
  }

  os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 472));
}

- (void)setAllCollectionsViewParameters:(uint64_t)a1
{
  id v4 = a2;
  if (a1)
  {
    *(void *)(a1 + 476) |= 0x100000000000010uLL;
    objc_storeStrong((id *)(a1 + 48), a2);
  }
}

- (void)setAirportEntityPlaceLookupParameters:(uint64_t)a1
{
  id v4 = a2;
  if (a1)
  {
    *(void *)(a1 + 476) |= 0x100000000000008uLL;
    objc_storeStrong((id *)(a1 + 40), a2);
  }
}

- (void)_readTerritoryLookupParameters
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 472));
    if ((*(unsigned char *)(a1 + 482) & 2) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOPDPlaceRequestParametersReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readTerritoryLookupParameters_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 472));
  }
}

- (id)territoryLookupParameters
{
  if (a1)
  {
    v2 = a1;
    -[GEOPDPlaceRequestParameters _readTerritoryLookupParameters]((uint64_t)a1);
    a1 = (id *)v2[51];
    uint64_t v1 = vars8;
  }
  return a1;
}

- (void)setTerritoryLookupParameters:(uint64_t)a1
{
  id v4 = a2;
  if (a1)
  {
    *(void *)(a1 + 476) |= 0x102000000000000uLL;
    objc_storeStrong((id *)(a1 + 408), a2);
  }
}

- (void)setTransitNearbyScheduleLookupParameters:(uint64_t)a1
{
  id v4 = a2;
  if (a1)
  {
    *(void *)(a1 + 476) |= 0x108000000000000uLL;
    objc_storeStrong((id *)(a1 + 424), a2);
  }
}

- (void)_readMapsHomeParameters
{
  os_unfair_lock_lock((os_unfair_lock_t)(a1 + 472));
  if ((*(unsigned char *)(a1 + 479) & 4) == 0)
  {
    v2 = *(void **)(a1 + 8);
    if (v2)
    {
      id v3 = v2;
      objc_sync_enter(v3);
      GEOPDPlaceRequestParametersReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readMapsHomeParameters_tags);
      objc_sync_exit(v3);
    }
  }

  os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 472));
}

- (void)_readAllGuidesLocationsViewParameters
{
  os_unfair_lock_lock((os_unfair_lock_t)(a1 + 472));
  if ((*(unsigned char *)(a1 + 476) & 0x20) == 0)
  {
    v2 = *(void **)(a1 + 8);
    if (v2)
    {
      id v3 = v2;
      objc_sync_enter(v3);
      GEOPDPlaceRequestParametersReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readAllGuidesLocationsViewParameters_tags);
      objc_sync_exit(v3);
    }
  }

  os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 472));
}

- (void)setAllGuidesLocationsViewParameters:(uint64_t)a1
{
  id v4 = a2;
  if (a1)
  {
    *(void *)(a1 + 476) |= 0x100000000000020uLL;
    objc_storeStrong((id *)(a1 + 56), a2);
  }
}

- (void)_readGuidesHomeParameters
{
  os_unfair_lock_lock((os_unfair_lock_t)(a1 + 472));
  if ((*(unsigned char *)(a1 + 478) & 0x80) == 0)
  {
    v2 = *(void **)(a1 + 8);
    if (v2)
    {
      id v3 = v2;
      objc_sync_enter(v3);
      GEOPDPlaceRequestParametersReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readGuidesHomeParameters_tags);
      objc_sync_exit(v3);
    }
  }

  os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 472));
}

- (void)setGuidesHomeParameters:(uint64_t)a1
{
  id v4 = a2;
  if (a1)
  {
    *(void *)(a1 + 476) |= 0x100000000800000uLL;
    objc_storeStrong((id *)(a1 + 200), a2);
  }
}

- (void)_readExtendedGeoLookupParameters
{
  os_unfair_lock_lock((os_unfair_lock_t)(a1 + 472));
  if ((*(unsigned char *)(a1 + 478) & 4) == 0)
  {
    v2 = *(void **)(a1 + 8);
    if (v2)
    {
      id v3 = v2;
      objc_sync_enter(v3);
      GEOPDPlaceRequestParametersReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readExtendedGeoLookupParameters_tags);
      objc_sync_exit(v3);
    }
  }

  os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 472));
}

- (void)setExtendedGeoLookupParameters:(uint64_t)a1
{
  id v4 = a2;
  *(void *)(a1 + 476) |= 0x100000000040000uLL;
  objc_storeStrong((id *)(a1 + 160), a2);
}

- (void)_readQueryUnderstandingParameters
{
  os_unfair_lock_lock((os_unfair_lock_t)(a1 + 472));
  if ((*(unsigned char *)(a1 + 481) & 1) == 0)
  {
    v2 = *(void **)(a1 + 8);
    if (v2)
    {
      id v3 = v2;
      objc_sync_enter(v3);
      GEOPDPlaceRequestParametersReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readQueryUnderstandingParameters_tags);
      objc_sync_exit(v3);
    }
  }

  os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 472));
}

- (void)setQueryUnderstandingParameters:(uint64_t)a1
{
  id v4 = a2;
  *(void *)(a1 + 476) |= 0x100010000000000uLL;
  objc_storeStrong((id *)(a1 + 336), a2);
}

- (void)_readPoiAtAddressLookupParameters
{
  os_unfair_lock_lock((os_unfair_lock_t)(a1 + 472));
  if ((*(unsigned char *)(a1 + 480) & 0x20) == 0)
  {
    v2 = *(void **)(a1 + 8);
    if (v2)
    {
      id v3 = v2;
      objc_sync_enter(v3);
      GEOPDPlaceRequestParametersReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readPoiAtAddressLookupParameters_tags);
      objc_sync_exit(v3);
    }
  }

  os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 472));
}

- (void)setPoiAtAddressLookupParameters:(uint64_t)a1
{
  id v4 = a2;
  *(void *)(a1 + 476) |= 0x100002000000000uLL;
  objc_storeStrong((id *)(a1 + 312), a2);
}

- (void)setTransitNearbyPaymentMethodLookupParameters:(uint64_t)a1
{
  id v4 = a2;
  if (a1)
  {
    *(void *)(a1 + 476) |= 0x104000000000000uLL;
    objc_storeStrong((id *)(a1 + 416), a2);
  }
}

- (void)_readPlacecardEnrichmentParameters
{
  os_unfair_lock_lock((os_unfair_lock_t)(a1 + 472));
  if ((*(unsigned char *)(a1 + 480) & 0x10) == 0)
  {
    v2 = *(void **)(a1 + 8);
    if (v2)
    {
      id v3 = v2;
      objc_sync_enter(v3);
      GEOPDPlaceRequestParametersReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readPlacecardEnrichmentParameters_tags);
      objc_sync_exit(v3);
    }
  }

  os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 472));
}

- (void)setPlacecardEnrichmentParameters:(uint64_t)a1
{
  id v4 = a2;
  if (a1)
  {
    *(void *)(a1 + 476) |= 0x100001000000000uLL;
    objc_storeStrong((id *)(a1 + 304), a2);
  }
}

- (void)_readOfflineRegionNameParameters
{
  os_unfair_lock_lock((os_unfair_lock_t)(a1 + 472));
  if ((*(unsigned char *)(a1 + 479) & 0x80) == 0)
  {
    v2 = *(void **)(a1 + 8);
    if (v2)
    {
      id v3 = v2;
      objc_sync_enter(v3);
      GEOPDPlaceRequestParametersReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readOfflineRegionNameParameters_tags);
      objc_sync_exit(v3);
    }
  }

  os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 472));
}

- (void)setOfflineRegionNameParameters:(uint64_t)a1
{
  id v4 = a2;
  if (a1)
  {
    *(void *)(a1 + 476) |= 0x100000080000000uLL;
    objc_storeStrong((id *)(a1 + 264), a2);
  }
}

- (void)_readSearchCapabilitiesParameters
{
  os_unfair_lock_lock((os_unfair_lock_t)(a1 + 472));
  if ((*(unsigned char *)(a1 + 481) & 8) == 0)
  {
    v2 = *(void **)(a1 + 8);
    if (v2)
    {
      id v3 = v2;
      objc_sync_enter(v3);
      GEOPDPlaceRequestParametersReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readSearchCapabilitiesParameters_tags);
      objc_sync_exit(v3);
    }
  }

  os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 472));
}

- (void)setSearchCapabilitiesParameters:(uint64_t)a1
{
  id v4 = a2;
  if (a1)
  {
    *(void *)(a1 + 476) |= 0x100080000000000uLL;
    objc_storeStrong((id *)(a1 + 360), a2);
  }
}

- (void)_readRefreshIdLookUpParameters
{
  os_unfair_lock_lock((os_unfair_lock_t)(a1 + 472));
  if ((*(unsigned char *)(a1 + 481) & 2) == 0)
  {
    v2 = *(void **)(a1 + 8);
    if (v2)
    {
      id v3 = v2;
      objc_sync_enter(v3);
      GEOPDPlaceRequestParametersReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readRefreshIdLookUpParameters_tags);
      objc_sync_exit(v3);
    }
  }

  os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 472));
}

- (void)setRefreshIdLookUpParameters:(uint64_t)a1
{
  id v4 = a2;
  *(void *)(a1 + 476) |= 0x100020000000000uLL;
  objc_storeStrong((id *)(a1 + 344), a2);
}

- (void)setAddressRecommendationParameters:(uint64_t)a1
{
  id v4 = a2;
  *(void *)(a1 + 476) |= 0x100000000000004uLL;
  objc_storeStrong((id *)(a1 + 32), a2);
}

- (id)description
{
  id v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)GEOPDPlaceRequestParameters;
  id v4 = [(GEOPDPlaceRequestParameters *)&v8 description];
  uint64_t v5 = [(GEOPDPlaceRequestParameters *)self dictionaryRepresentation];
  uint64_t v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEOPDPlaceRequestParameters _dictionaryRepresentation:]((uint64_t)self, 0);
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  if (a1)
  {
    -[GEOPDPlaceRequestParameters readAll:](a1, 1);
    id v4 = [MEMORY[0x1E4F1CA60] dictionary];
    uint64_t v5 = -[GEOPDPlaceRequestParameters searchParameters]((id *)a1);
    uint64_t v6 = v5;
    if (v5)
    {
      if (a2)
      {
        objc_super v7 = [v5 jsonRepresentation];
        objc_super v8 = @"searchParameters";
      }
      else
      {
        objc_super v7 = [v5 dictionaryRepresentation];
        objc_super v8 = @"search_parameters";
      }
      id v9 = v7;

      [v4 setObject:v9 forKey:v8];
    }

    uint64_t v10 = -[GEOPDPlaceRequestParameters geocodingParameters]((id *)a1);
    uint64_t v11 = v10;
    if (v10)
    {
      if (a2)
      {
        uint64_t v12 = [v10 jsonRepresentation];
        uint64_t v13 = @"geocodingParameters";
      }
      else
      {
        uint64_t v12 = [v10 dictionaryRepresentation];
        uint64_t v13 = @"geocoding_parameters";
      }
      id v14 = v12;

      [v4 setObject:v14 forKey:v13];
    }

    uint64_t v15 = -[GEOPDPlaceRequestParameters canonicalLocationSearchParameters]((id *)a1);
    uint64_t v16 = v15;
    if (v15)
    {
      if (a2)
      {
        uint64_t v17 = [v15 jsonRepresentation];
        uint64_t v18 = @"canonicalLocationSearchParameters";
      }
      else
      {
        uint64_t v17 = [v15 dictionaryRepresentation];
        uint64_t v18 = @"canonical_location_search_parameters";
      }
      id v19 = v17;

      [v4 setObject:v19 forKey:v18];
    }

    uint64_t v20 = -[GEOPDPlaceRequestParameters reverseGeocodingParameters]((id *)a1);
    uint64_t v21 = v20;
    if (v20)
    {
      if (a2)
      {
        uint64_t v22 = [v20 jsonRepresentation];
        uint64_t v23 = @"reverseGeocodingParameters";
      }
      else
      {
        uint64_t v22 = [v20 dictionaryRepresentation];
        uint64_t v23 = @"reverse_geocoding_parameters";
      }
      id v24 = v22;

      [v4 setObject:v24 forKey:v23];
    }

    uint64_t v25 = -[GEOPDPlaceRequestParameters placeLookupParameters]((id *)a1);
    uint64_t v26 = v25;
    if (v25)
    {
      if (a2)
      {
        uint64_t v27 = [v25 jsonRepresentation];
        uint64_t v28 = @"placeLookupParameters";
      }
      else
      {
        uint64_t v27 = [v25 dictionaryRepresentation];
        uint64_t v28 = @"place_lookup_parameters";
      }
      id v29 = v27;

      [v4 setObject:v29 forKey:v28];
    }

    uint64_t v30 = -[GEOPDPlaceRequestParameters merchantLookupParameters]((id *)a1);
    uint64_t v31 = v30;
    if (v30)
    {
      if (a2)
      {
        uint64_t v32 = [v30 jsonRepresentation];
        long long v33 = @"merchantLookupParameters";
      }
      else
      {
        uint64_t v32 = [v30 dictionaryRepresentation];
        long long v33 = @"merchant_lookup_parameters";
      }
      id v34 = v32;

      [v4 setObject:v34 forKey:v33];
    }

    uint64_t v35 = -[GEOPDPlaceRequestParameters placeRefinementParameters]((id *)a1);
    id v36 = v35;
    if (v35)
    {
      if (a2)
      {
        uint64_t v37 = [v35 jsonRepresentation];
        uint64_t v38 = @"placeRefinementParameters";
      }
      else
      {
        uint64_t v37 = [v35 dictionaryRepresentation];
        uint64_t v38 = @"place_refinement_parameters";
      }
      id v39 = v37;

      [v4 setObject:v39 forKey:v38];
    }

    -[GEOPDPlaceRequestParameters _readSiriSearchParameters](a1);
    id v40 = *(id *)(a1 + 400);
    uint64_t v41 = v40;
    if (v40)
    {
      if (a2)
      {
        unint64_t v42 = [v40 jsonRepresentation];
        uint64_t v43 = @"siriSearchParameters";
      }
      else
      {
        unint64_t v42 = [v40 dictionaryRepresentation];
        uint64_t v43 = @"siri_search_parameters";
      }
      id v44 = v42;

      [v4 setObject:v44 forKey:v43];
    }

    id v45 = -[GEOPDPlaceRequestParameters locationDirectedSearchParameters]((id *)a1);
    uint64_t v46 = v45;
    if (v45)
    {
      if (a2)
      {
        uint64_t v47 = [v45 jsonRepresentation];
        uint64_t v48 = @"locationDirectedSearchParameters";
      }
      else
      {
        uint64_t v47 = [v45 dictionaryRepresentation];
        uint64_t v48 = @"location_directed_search_parameters";
      }
      id v49 = v47;

      [v4 setObject:v49 forKey:v48];
    }

    uint64_t v50 = -[GEOPDPlaceRequestParameters autocompleteParameters]((id *)a1);
    id v51 = v50;
    if (v50)
    {
      if (a2)
      {
        uint64_t v52 = [v50 jsonRepresentation];
        unint64_t v53 = @"autocompleteParameters";
      }
      else
      {
        uint64_t v52 = [v50 dictionaryRepresentation];
        unint64_t v53 = @"autocomplete_parameters";
      }
      id v54 = v52;

      [v4 setObject:v54 forKey:v53];
    }

    -[GEOPDPlaceRequestParameters _readBrowseCategorySuggestionParameters](a1);
    id v55 = *(id *)(a1 + 120);
    uint64_t v56 = v55;
    if (v55)
    {
      if (a2)
      {
        uint64_t v57 = [v55 jsonRepresentation];
        uint64_t v58 = @"browseCategorySuggestionParameters";
      }
      else
      {
        uint64_t v57 = [v55 dictionaryRepresentation];
        uint64_t v58 = @"browse_category_suggestion_parameters";
      }
      id v59 = v57;

      [v4 setObject:v59 forKey:v58];
    }

    id v60 = -[GEOPDPlaceRequestParameters categorySearchParameters]((id *)a1);
    uint64_t v61 = v60;
    if (v60)
    {
      if (a2)
      {
        uint64_t v62 = [v60 jsonRepresentation];
        uint64_t v63 = @"categorySearchParameters";
      }
      else
      {
        uint64_t v62 = [v60 dictionaryRepresentation];
        uint64_t v63 = @"category_search_parameters";
      }
      id v64 = v62;

      [v4 setObject:v64 forKey:v63];
    }

    -[GEOPDPlaceRequestParameters _readPopularNearbySearchParameters](a1);
    id v65 = *(id *)(a1 + 320);
    int v66 = v65;
    if (v65)
    {
      if (a2)
      {
        uint64_t v67 = [v65 jsonRepresentation];
        id v68 = @"popularNearbySearchParameters";
      }
      else
      {
        uint64_t v67 = [v65 dictionaryRepresentation];
        id v68 = @"popular_nearby_search_parameters";
      }
      id v69 = v67;

      [v4 setObject:v69 forKey:v68];
    }

    id v70 = -[GEOPDPlaceRequestParameters searchZeroKeywordCategorySuggestionParameters]((id *)a1);
    uint64_t v71 = v70;
    if (v70)
    {
      if (a2)
      {
        id v72 = [v70 jsonRepresentation];
        uint64_t v73 = @"searchZeroKeywordCategorySuggestionParameters";
      }
      else
      {
        id v72 = [v70 dictionaryRepresentation];
        uint64_t v73 = @"search_zero_keyword_category_suggestion_parameters";
      }
      id v74 = v72;

      [v4 setObject:v74 forKey:v73];
    }

    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 472));
    if ((*(unsigned char *)(a1 + 481) & 0x10) == 0)
    {
      uint64_t v75 = *(void **)(a1 + 8);
      if (v75)
      {
        id v76 = v75;
        objc_sync_enter(v76);
        GEOPDPlaceRequestParametersReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readSearchFieldPlaceholderParameters_tags);
        objc_sync_exit(v76);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 472));
    id v77 = *(id *)(a1 + 368);
    id v78 = v77;
    if (v77)
    {
      if (a2)
      {
        uint64_t v79 = [v77 jsonRepresentation];
        BOOL v80 = @"searchFieldPlaceholderParameters";
      }
      else
      {
        uint64_t v79 = [v77 dictionaryRepresentation];
        BOOL v80 = @"search_field_placeholder_parameters";
      }
      id v81 = v79;

      [v4 setObject:v81 forKey:v80];
    }

    -[GEOPDPlaceRequestParameters _readBatchPopularNearbySearchParameters](a1);
    id v82 = *(id *)(a1 + 88);
    uint64_t v83 = v82;
    if (v82)
    {
      if (a2)
      {
        id v84 = [v82 jsonRepresentation];
        uint64_t v85 = @"batchPopularNearbySearchParameters";
      }
      else
      {
        id v84 = [v82 dictionaryRepresentation];
        uint64_t v85 = @"batch_popular_nearby_search_parameters";
      }
      id v86 = v84;

      [v4 setObject:v86 forKey:v85];
    }

    uint64_t v87 = -[GEOPDPlaceRequestParameters vendorSpecificPlaceRefinementParameters]((id *)a1);
    id v88 = v87;
    if (v87)
    {
      if (a2)
      {
        uint64_t v89 = [v87 jsonRepresentation];
        uint64_t v90 = @"vendorSpecificPlaceRefinementParameters";
      }
      else
      {
        uint64_t v89 = [v87 dictionaryRepresentation];
        uint64_t v90 = @"vendor_specific_place_refinement_parameters";
      }
      id v91 = v89;

      [v4 setObject:v91 forKey:v90];
    }

    -[GEOPDPlaceRequestParameters _readNearbySearchParameters](a1);
    id v92 = *(id *)(a1 + 256);
    uint64_t v93 = v92;
    if (v92)
    {
      if (a2)
      {
        uint64_t v94 = [v92 jsonRepresentation];
        id v95 = @"nearbySearchParameters";
      }
      else
      {
        uint64_t v94 = [v92 dictionaryRepresentation];
        id v95 = @"nearby_search_parameters";
      }
      id v96 = v94;

      [v4 setObject:v96 forKey:v95];
    }

    -[GEOPDPlaceRequestParameters _readAddressObjectGeocodingParameters](a1);
    id v97 = *(id *)(a1 + 24);
    uint64_t v98 = v97;
    if (v97)
    {
      if (a2)
      {
        id v99 = [v97 jsonRepresentation];
        uint64_t v100 = @"addressObjectGeocodingParameters";
      }
      else
      {
        id v99 = [v97 dictionaryRepresentation];
        uint64_t v100 = @"address_object_geocoding_parameters";
      }
      id v101 = v99;

      [v4 setObject:v101 forKey:v100];
    }

    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 472));
    if ((*(unsigned char *)(a1 + 481) & 0x80) == 0)
    {
      id v102 = *(void **)(a1 + 8);
      if (v102)
      {
        id v103 = v102;
        objc_sync_enter(v103);
        GEOPDPlaceRequestParametersReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readSearchZeroKeywordWithSearchResultsSuggestionParameters_tags);
        objc_sync_exit(v103);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 472));
    id v104 = *(id *)(a1 + 392);
    uint64_t v105 = v104;
    if (v104)
    {
      if (a2)
      {
        id v106 = [v104 jsonRepresentation];
        uint64_t v107 = @"searchZeroKeywordWithSearchResultsSuggestionParameters";
      }
      else
      {
        id v106 = [v104 dictionaryRepresentation];
        uint64_t v107 = @"search_zero_keyword_with_search_results_suggestion_parameters";
      }
      id v108 = v106;

      [v4 setObject:v108 forKey:v107];
    }

    uint64_t v109 = -[GEOPDPlaceRequestParameters externalTransitLookupParameters]((id *)a1);
    uint64_t v110 = v109;
    if (v109)
    {
      if (a2)
      {
        uint64_t v111 = [v109 jsonRepresentation];
        uint64_t v112 = @"externalTransitLookupParameters";
      }
      else
      {
        uint64_t v111 = [v109 dictionaryRepresentation];
        uint64_t v112 = @"external_transit_lookup_parameters";
      }
      id v113 = v111;

      [v4 setObject:v113 forKey:v112];
    }

    uint64_t v114 = -[GEOPDPlaceRequestParameters featureIdGeocodingParameters]((id *)a1);
    uint64_t v115 = v114;
    if (v114)
    {
      if (a2)
      {
        uint64_t v116 = [v114 jsonRepresentation];
        id v117 = @"featureIdGeocodingParameters";
      }
      else
      {
        uint64_t v116 = [v114 dictionaryRepresentation];
        id v117 = @"feature_id_geocoding_parameters";
      }
      id v118 = v116;

      [v4 setObject:v118 forKey:v117];
    }

    uint64_t v119 = -[GEOPDPlaceRequestParameters mapsIdentifierPlaceLookupParameters]((id *)a1);
    uint64_t v120 = v119;
    if (v119)
    {
      if (a2)
      {
        id v121 = [v119 jsonRepresentation];
        id v122 = @"mapsIdentifierPlaceLookupParameters";
      }
      else
      {
        id v121 = [v119 dictionaryRepresentation];
        id v122 = @"maps_identifier_place_lookup_parameters";
      }
      id v123 = v121;

      [v4 setObject:v123 forKey:v122];
    }

    uint64_t v124 = -[GEOPDPlaceRequestParameters batchReverseGeocodingParameters]((id *)a1);
    uint64_t v125 = v124;
    if (v124)
    {
      if (a2)
      {
        v126 = [v124 jsonRepresentation];
        uint64_t v127 = @"batchReverseGeocodingParameters";
      }
      else
      {
        v126 = [v124 dictionaryRepresentation];
        uint64_t v127 = @"batch_reverse_geocoding_parameters";
      }
      id v128 = v126;

      [v4 setObject:v128 forKey:v127];
    }

    uint64_t v129 = -[GEOPDPlaceRequestParameters brandLookupParameters]((id *)a1);
    uint64_t v130 = v129;
    if (v129)
    {
      if (a2)
      {
        uint64_t v131 = [v129 jsonRepresentation];
        uint64_t v132 = @"brandLookupParameters";
      }
      else
      {
        uint64_t v131 = [v129 dictionaryRepresentation];
        uint64_t v132 = @"brand_lookup_parameters";
      }
      id v133 = v131;

      [v4 setObject:v133 forKey:v132];
    }

    uint64_t v134 = -[GEOPDPlaceRequestParameters wifiFingerprintParameters]((id *)a1);
    uint64_t v135 = v134;
    if (v134)
    {
      if (a2)
      {
        id v136 = [v134 jsonRepresentation];
        uint64_t v137 = @"wifiFingerprintParameters";
      }
      else
      {
        id v136 = [v134 dictionaryRepresentation];
        uint64_t v137 = @"wifi_fingerprint_parameters";
      }
      id v138 = v136;

      [v4 setObject:v138 forKey:v137];
    }

    uint64_t v139 = -[GEOPDPlaceRequestParameters ipGeoLookupParameters]((id *)a1);
    __int16 v140 = v139;
    if (v139)
    {
      if (a2)
      {
        id v141 = [v139 jsonRepresentation];
        uint64_t v142 = @"ipGeoLookupParameters";
      }
      else
      {
        id v141 = [v139 dictionaryRepresentation];
        uint64_t v142 = @"ip_geo_lookup_parameters";
      }
      id v143 = v141;

      [v4 setObject:v143 forKey:v142];
    }

    uint64_t v144 = -[GEOPDPlaceRequestParameters groundViewLabelParameters]((id *)a1);
    uint64_t v145 = v144;
    if (v144)
    {
      if (a2)
      {
        uint64_t v146 = [v144 jsonRepresentation];
        uint64_t v147 = @"groundViewLabelParameters";
      }
      else
      {
        uint64_t v146 = [v144 dictionaryRepresentation];
        uint64_t v147 = @"ground_view_label_parameters";
      }
      id v148 = v146;

      [v4 setObject:v148 forKey:v147];
    }

    -[GEOPDPlaceRequestParameters _readBatchSpatialLookupParameters](a1);
    id v149 = *(id *)(a1 + 104);
    id v150 = v149;
    if (v149)
    {
      if (a2)
      {
        uint64_t v151 = [v149 jsonRepresentation];
        uint64_t v152 = @"batchSpatialLookupParameters";
      }
      else
      {
        uint64_t v151 = [v149 dictionaryRepresentation];
        uint64_t v152 = @"batch_spatial_lookup_parameters";
      }
      id v153 = v151;

      [v4 setObject:v153 forKey:v152];
    }

    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 472));
    if ((*(unsigned char *)(a1 + 482) & 0x20) == 0)
    {
      uint64_t v154 = *(void **)(a1 + 8);
      if (v154)
      {
        id v155 = v154;
        objc_sync_enter(v155);
        GEOPDPlaceRequestParametersReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readTransitVehiclePositionParameters_tags);
        objc_sync_exit(v155);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 472));
    id v156 = *(id *)(a1 + 440);
    id v157 = v156;
    if (v156)
    {
      if (a2)
      {
        uint64_t v158 = [v156 jsonRepresentation];
        uint64_t v159 = @"transitVehiclePositionParameters";
      }
      else
      {
        uint64_t v158 = [v156 dictionaryRepresentation];
        uint64_t v159 = @"transit_vehicle_position_parameters";
      }
      id v160 = v158;

      [v4 setObject:v160 forKey:v159];
    }

    -[GEOPDPlaceRequestParameters _readPlaceCollectionLookupParameter](a1);
    id v161 = *(id *)(a1 + 272);
    uint64_t v162 = v161;
    if (v161)
    {
      if (a2)
      {
        uint64_t v163 = [v161 jsonRepresentation];
        id v164 = @"placeCollectionLookupParameter";
      }
      else
      {
        uint64_t v163 = [v161 dictionaryRepresentation];
        id v164 = @"place_collection_lookup_parameter";
      }
      id v165 = v163;

      [v4 setObject:v165 forKey:v164];
    }

    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 472));
    if ((*(unsigned char *)(a1 + 482) & 0x10) == 0)
    {
      uint64_t v166 = *(void **)(a1 + 8);
      if (v166)
      {
        id v167 = v166;
        objc_sync_enter(v167);
        GEOPDPlaceRequestParametersReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readTransitScheduleLookupParameter_tags);
        objc_sync_exit(v167);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 472));
    id v168 = *(id *)(a1 + 432);
    uint64_t v169 = v168;
    if (v168)
    {
      if (a2)
      {
        v170 = [v168 jsonRepresentation];
        uint64_t v171 = @"transitScheduleLookupParameter";
      }
      else
      {
        v170 = [v168 dictionaryRepresentation];
        uint64_t v171 = @"transit_schedule_lookup_parameter";
      }
      id v172 = v170;

      [v4 setObject:v172 forKey:v171];
    }

    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 472));
    if ((*(unsigned char *)(a1 + 476) & 0x80) == 0)
    {
      uint64_t v173 = *(void **)(a1 + 8);
      if (v173)
      {
        id v174 = v173;
        objc_sync_enter(v174);
        GEOPDPlaceRequestParametersReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readBatchCategoryLookupParameters_tags);
        objc_sync_exit(v174);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 472));
    id v175 = *(id *)(a1 + 72);
    id v176 = v175;
    if (v175)
    {
      if (a2)
      {
        uint64_t v177 = [v175 jsonRepresentation];
        uint64_t v178 = @"batchCategoryLookupParameters";
      }
      else
      {
        uint64_t v177 = [v175 dictionaryRepresentation];
        uint64_t v178 = @"batch_category_lookup_parameters";
      }
      id v179 = v177;

      [v4 setObject:v179 forKey:v178];
    }

    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 472));
    if ((*(unsigned char *)(a1 + 477) & 1) == 0)
    {
      v180 = *(void **)(a1 + 8);
      if (v180)
      {
        id v181 = v180;
        objc_sync_enter(v181);
        GEOPDPlaceRequestParametersReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readBatchMerchantLookupBrandParameters_tags);
        objc_sync_exit(v181);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 472));
    id v182 = *(id *)(a1 + 80);
    uint64_t v183 = v182;
    if (v182)
    {
      if (a2)
      {
        uint64_t v184 = [v182 jsonRepresentation];
        v185 = @"batchMerchantLookupBrandParameters";
      }
      else
      {
        uint64_t v184 = [v182 dictionaryRepresentation];
        v185 = @"batch_merchant_lookup_brand_parameters";
      }
      id v186 = v184;

      [v4 setObject:v186 forKey:v185];
    }

    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 472));
    if ((*(unsigned char *)(a1 + 478) & 1) == 0)
    {
      uint64_t v187 = *(void **)(a1 + 8);
      if (v187)
      {
        id v188 = v187;
        objc_sync_enter(v188);
        GEOPDPlaceRequestParametersReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readChildPlaceLookupByCategoryParameters_tags);
        objc_sync_exit(v188);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 472));
    id v189 = *(id *)(a1 + 144);
    uint64_t v190 = v189;
    if (v189)
    {
      if (a2)
      {
        v191 = [v189 jsonRepresentation];
        uint64_t v192 = @"childPlaceLookupByCategoryParameters";
      }
      else
      {
        v191 = [v189 dictionaryRepresentation];
        uint64_t v192 = @"child_place_lookup_by_category_parameters";
      }
      id v193 = v191;

      [v4 setObject:v193 forKey:v192];
    }

    -[GEOPDPlaceRequestParameters _readCollectionSuggestionParameters](a1);
    id v194 = *(id *)(a1 + 152);
    id v195 = v194;
    if (v194)
    {
      if (a2)
      {
        id v196 = [v194 jsonRepresentation];
        uint64_t v197 = @"collectionSuggestionParameters";
      }
      else
      {
        id v196 = [v194 dictionaryRepresentation];
        uint64_t v197 = @"collection_suggestion_parameters";
      }
      id v198 = v196;

      [v4 setObject:v198 forKey:v197];
    }

    -[GEOPDPlaceRequestParameters _readMapsSearchHomeParameters](a1);
    id v199 = *(id *)(a1 + 240);
    int v200 = v199;
    if (v199)
    {
      if (a2)
      {
        uint64_t v201 = [v199 jsonRepresentation];
        unint64_t v202 = @"mapsSearchHomeParameters";
      }
      else
      {
        uint64_t v201 = [v199 dictionaryRepresentation];
        unint64_t v202 = @"maps_search_home_parameters";
      }
      id v203 = v201;

      [v4 setObject:v203 forKey:v202];
    }

    -[GEOPDPlaceRequestParameters _readPlaceQuestionnaireLookupParameters](a1);
    id v204 = *(id *)(a1 + 288);
    uint64_t v205 = v204;
    if (v204)
    {
      if (a2)
      {
        uint64_t v206 = [v204 jsonRepresentation];
        unsigned int v207 = @"placeQuestionnaireLookupParameters";
      }
      else
      {
        uint64_t v206 = [v204 dictionaryRepresentation];
        unsigned int v207 = @"place_questionnaire_lookup_parameters";
      }
      id v208 = v206;

      [v4 setObject:v208 forKey:v207];
    }

    -[GEOPDPlaceRequestParameters _readPublisherViewParameters](a1);
    id v209 = *(id *)(a1 + 328);
    uint64_t v210 = v209;
    if (v209)
    {
      if (a2)
      {
        unint64_t v211 = [v209 jsonRepresentation];
        uint64_t v212 = @"publisherViewParameters";
      }
      else
      {
        unint64_t v211 = [v209 dictionaryRepresentation];
        uint64_t v212 = @"publisher_view_parameters";
      }
      id v213 = v211;

      [v4 setObject:v213 forKey:v212];
    }

    -[GEOPDPlaceRequestParameters _readAllCollectionsViewParameters](a1);
    id v214 = *(id *)(a1 + 48);
    v215 = v214;
    if (v214)
    {
      if (a2)
      {
        uint64_t v216 = [v214 jsonRepresentation];
        v217 = @"allCollectionsViewParameters";
      }
      else
      {
        uint64_t v216 = [v214 dictionaryRepresentation];
        v217 = @"all_collections_view_parameters";
      }
      id v218 = v216;

      [v4 setObject:v218 forKey:v217];
    }

    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 472));
    if ((*(unsigned char *)(a1 + 476) & 8) == 0)
    {
      uint64_t v219 = *(void **)(a1 + 8);
      if (v219)
      {
        id v220 = v219;
        objc_sync_enter(v220);
        GEOPDPlaceRequestParametersReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readAirportEntityPlaceLookupParameters_tags);
        objc_sync_exit(v220);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 472));
    id v221 = *(id *)(a1 + 40);
    uint64_t v222 = v221;
    if (v221)
    {
      if (a2)
      {
        v223 = [v221 jsonRepresentation];
        uint64_t v224 = @"airportEntityPlaceLookupParameters";
      }
      else
      {
        v223 = [v221 dictionaryRepresentation];
        uint64_t v224 = @"airport_entity_place_lookup_parameters";
      }
      id v225 = v223;

      [v4 setObject:v225 forKey:v224];
    }

    id v226 = -[GEOPDPlaceRequestParameters territoryLookupParameters]((id *)a1);
    uint64_t v227 = v226;
    if (v226)
    {
      if (a2)
      {
        uint64_t v228 = [v226 jsonRepresentation];
        uint64_t v229 = @"territoryLookupParameters";
      }
      else
      {
        uint64_t v228 = [v226 dictionaryRepresentation];
        uint64_t v229 = @"territory_lookup_parameters";
      }
      id v230 = v228;

      [v4 setObject:v230 forKey:v229];
    }

    uint64_t v231 = -[GEOPDPlaceRequestParameters transitNearbyScheduleLookupParameters]((id *)a1);
    v232 = v231;
    if (v231)
    {
      if (a2)
      {
        id v233 = [v231 jsonRepresentation];
        uint64_t v234 = @"transitNearbyScheduleLookupParameters";
      }
      else
      {
        id v233 = [v231 dictionaryRepresentation];
        uint64_t v234 = @"transit_nearby_schedule_lookup_parameters";
      }
      id v235 = v233;

      [v4 setObject:v235 forKey:v234];
    }

    -[GEOPDPlaceRequestParameters _readMapsHomeParameters](a1);
    id v236 = *(id *)(a1 + 224);
    uint64_t v237 = v236;
    if (v236)
    {
      if (a2)
      {
        uint64_t v238 = [v236 jsonRepresentation];
        v239 = @"mapsHomeParameters";
      }
      else
      {
        uint64_t v238 = [v236 dictionaryRepresentation];
        v239 = @"maps_home_parameters";
      }
      id v240 = v238;

      [v4 setObject:v240 forKey:v239];
    }

    -[GEOPDPlaceRequestParameters _readAllGuidesLocationsViewParameters](a1);
    id v241 = *(id *)(a1 + 56);
    id v242 = v241;
    if (v241)
    {
      if (a2)
      {
        uint64_t v243 = [v241 jsonRepresentation];
        uint64_t v244 = @"allGuidesLocationsViewParameters";
      }
      else
      {
        uint64_t v243 = [v241 dictionaryRepresentation];
        uint64_t v244 = @"all_guides_locations_view_parameters";
      }
      id v245 = v243;

      [v4 setObject:v245 forKey:v244];
    }

    -[GEOPDPlaceRequestParameters _readGuidesHomeParameters](a1);
    id v246 = *(id *)(a1 + 200);
    uint64_t v247 = v246;
    if (v246)
    {
      if (a2)
      {
        uint64_t v248 = [v246 jsonRepresentation];
        uint64_t v249 = @"guidesHomeParameters";
      }
      else
      {
        uint64_t v248 = [v246 dictionaryRepresentation];
        uint64_t v249 = @"guides_home_parameters";
      }
      id v250 = v248;

      [v4 setObject:v250 forKey:v249];
    }

    -[GEOPDPlaceRequestParameters _readExtendedGeoLookupParameters](a1);
    id v251 = *(id *)(a1 + 160);
    BOOL v252 = v251;
    if (v251)
    {
      if (a2)
      {
        id v253 = [v251 jsonRepresentation];
        uint64_t v254 = @"extendedGeoLookupParameters";
      }
      else
      {
        id v253 = [v251 dictionaryRepresentation];
        uint64_t v254 = @"extended_geo_lookup_parameters";
      }
      id v255 = v253;

      [v4 setObject:v255 forKey:v254];
    }

    -[GEOPDPlaceRequestParameters _readQueryUnderstandingParameters](a1);
    id v256 = *(id *)(a1 + 336);
    uint64_t v257 = v256;
    if (v256)
    {
      if (a2)
      {
        uint64_t v258 = [v256 jsonRepresentation];
        id v259 = @"queryUnderstandingParameters";
      }
      else
      {
        uint64_t v258 = [v256 dictionaryRepresentation];
        id v259 = @"query_understanding_parameters";
      }
      id v260 = v258;

      [v4 setObject:v260 forKey:v259];
    }

    -[GEOPDPlaceRequestParameters _readPoiAtAddressLookupParameters](a1);
    id v261 = *(id *)(a1 + 312);
    v262 = v261;
    if (v261)
    {
      if (a2)
      {
        long long v263 = [v261 jsonRepresentation];
        long long v264 = @"poiAtAddressLookupParameters";
      }
      else
      {
        long long v263 = [v261 dictionaryRepresentation];
        long long v264 = @"poi_at_address_lookup_parameters";
      }
      id v265 = v263;

      [v4 setObject:v265 forKey:v264];
    }

    long long v266 = -[GEOPDPlaceRequestParameters transitNearbyPaymentMethodLookupParameters]((id *)a1);
    long long v267 = v266;
    if (v266)
    {
      if (a2)
      {
        long long v268 = [v266 jsonRepresentation];
        long long v269 = @"transitNearbyPaymentMethodLookupParameters";
      }
      else
      {
        long long v268 = [v266 dictionaryRepresentation];
        long long v269 = @"transit_nearby_payment_method_lookup_parameters";
      }
      id v270 = v268;

      [v4 setObject:v270 forKey:v269];
    }

    -[GEOPDPlaceRequestParameters _readPlacecardEnrichmentParameters](a1);
    id v271 = *(id *)(a1 + 304);
    long long v272 = v271;
    if (v271)
    {
      if (a2)
      {
        long long v273 = [v271 jsonRepresentation];
        long long v274 = @"placecardEnrichmentParameters";
      }
      else
      {
        long long v273 = [v271 dictionaryRepresentation];
        long long v274 = @"placecard_enrichment_parameters";
      }
      id v275 = v273;

      [v4 setObject:v275 forKey:v274];
    }

    -[GEOPDPlaceRequestParameters _readOfflineRegionNameParameters](a1);
    id v276 = *(id *)(a1 + 264);
    long long v277 = v276;
    if (v276)
    {
      if (a2)
      {
        long long v278 = [v276 jsonRepresentation];
        long long v279 = @"offlineRegionNameParameters";
      }
      else
      {
        long long v278 = [v276 dictionaryRepresentation];
        long long v279 = @"offline_region_name_parameters";
      }
      id v280 = v278;

      [v4 setObject:v280 forKey:v279];
    }

    -[GEOPDPlaceRequestParameters _readSearchCapabilitiesParameters](a1);
    id v281 = *(id *)(a1 + 360);
    long long v282 = v281;
    if (v281)
    {
      if (a2)
      {
        char v283 = [v281 jsonRepresentation];
        uint64_t v284 = @"searchCapabilitiesParameters";
      }
      else
      {
        char v283 = [v281 dictionaryRepresentation];
        uint64_t v284 = @"search_capabilities_parameters";
      }
      id v285 = v283;

      [v4 setObject:v285 forKey:v284];
    }

    -[GEOPDPlaceRequestParameters _readRefreshIdLookUpParameters](a1);
    id v286 = *(id *)(a1 + 344);
    __int16 v287 = v286;
    if (v286)
    {
      if (a2)
      {
        v288 = [v286 jsonRepresentation];
        v289 = @"refreshIdLookUpParameters";
      }
      else
      {
        v288 = [v286 dictionaryRepresentation];
        v289 = @"refresh_id_look_up_parameters";
      }
      id v290 = v288;

      [v4 setObject:v290 forKey:v289];
    }

    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 472));
    if ((*(unsigned char *)(a1 + 476) & 4) == 0)
    {
      uint64_t v291 = *(void **)(a1 + 8);
      if (v291)
      {
        id v292 = v291;
        objc_sync_enter(v292);
        GEOPDPlaceRequestParametersReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readAddressRecommendationParameters_tags);
        objc_sync_exit(v292);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 472));
    id v293 = *(id *)(a1 + 32);
    v294 = v293;
    if (v293)
    {
      if (a2)
      {
        id v295 = [v293 jsonRepresentation];
        id v296 = @"addressRecommendationParameters";
      }
      else
      {
        id v295 = [v293 dictionaryRepresentation];
        id v296 = @"address_recommendation_parameters";
      }
      id v297 = v295;

      [v4 setObject:v297 forKey:v296];
    }

    uint64_t v298 = *(void **)(a1 + 16);
    if (v298)
    {
      v299 = [v298 dictionaryRepresentation];
      __int16 v300 = v299;
      if (a2)
      {
        v301 = objc_msgSend(MEMORY[0x1E4F1CA60], "dictionaryWithCapacity:", objc_msgSend(v299, "count"));
        v306[0] = MEMORY[0x1E4F143A8];
        v306[1] = 3221225472;
        v306[2] = __57__GEOPDPlaceRequestParameters__dictionaryRepresentation___block_invoke;
        v306[3] = &unk_1E53D8860;
        id v302 = v301;
        id v307 = v302;
        [v300 enumerateKeysAndObjectsUsingBlock:v306];
        id v303 = v302;

        __int16 v300 = v303;
      }
      [v4 setObject:v300 forKey:@"Unknown Fields"];
    }
    id v304 = v4;
  }
  else
  {
    id v304 = 0;
  }

  return v304;
}

- (id)jsonRepresentation
{
  return -[GEOPDPlaceRequestParameters _dictionaryRepresentation:]((uint64_t)self, 1);
}

void __57__GEOPDPlaceRequestParameters__dictionaryRepresentation___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v10 = a2;
  id v5 = a3;
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();
  objc_super v7 = *(void **)(a1 + 32);
  if (isKindOfClass)
  {
    objc_super v8 = [v5 base64EncodedStringWithOptions:0];
    id v9 = [v10 description];
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
  return GEOPDPlaceRequestParametersReadAllFrom((uint64_t)self, a3, 0);
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_112;
  }
  -[GEOPDPlaceRequestParameters readAll:]((uint64_t)self, 1);
  -[GEOPDPlaceRequestParameters readAll:]((uint64_t)v4, 1);
  searchParameters = self->_searchParameters;
  if ((unint64_t)searchParameters | v4[47])
  {
    if (!-[GEOPDSearchParameters isEqual:](searchParameters, "isEqual:")) {
      goto LABEL_112;
    }
  }
  geocodingParameters = self->_geocodingParameters;
  if ((unint64_t)geocodingParameters | v4[23]
    && !-[GEOPDGeocodingParameters isEqual:](geocodingParameters, "isEqual:"))
  {
    goto LABEL_112;
  }
  canonicalLocationSearchParameters = self->_canonicalLocationSearchParameters;
  if ((unint64_t)canonicalLocationSearchParameters | v4[16]
    && !-[GEOPDCanonicalLocationSearchParameters isEqual:](canonicalLocationSearchParameters, "isEqual:"))
  {
    goto LABEL_112;
  }
  reverseGeocodingParameters = self->_reverseGeocodingParameters;
  if ((unint64_t)reverseGeocodingParameters | v4[44]
    && !-[GEOPDReverseGeocodingParameters isEqual:](reverseGeocodingParameters, "isEqual:"))
  {
    goto LABEL_112;
  }
  placeLookupParameters = self->_placeLookupParameters;
  if ((unint64_t)placeLookupParameters | v4[35]
    && !-[GEOPDPlaceLookupParameters isEqual:](placeLookupParameters, "isEqual:"))
  {
    goto LABEL_112;
  }
  merchantLookupParameters = self->_merchantLookupParameters;
  if ((unint64_t)merchantLookupParameters | v4[31]
    && !-[GEOPDMerchantLookupParameters isEqual:](merchantLookupParameters, "isEqual:"))
  {
    goto LABEL_112;
  }
  placeRefinementParameters = self->_placeRefinementParameters;
  if ((unint64_t)placeRefinementParameters | v4[37]
    && !-[GEOPDPlaceRefinementParameters isEqual:](placeRefinementParameters, "isEqual:"))
  {
    goto LABEL_112;
  }
  siriSearchParameters = self->_siriSearchParameters;
  if ((unint64_t)siriSearchParameters | v4[50]
    && !-[GEOPDSiriSearchParameters isEqual:](siriSearchParameters, "isEqual:"))
  {
    goto LABEL_112;
  }
  locationDirectedSearchParameters = self->_locationDirectedSearchParameters;
  if ((unint64_t)locationDirectedSearchParameters | v4[27]
    && !-[GEOPDLocationDirectedSearchParameters isEqual:](locationDirectedSearchParameters, "isEqual:"))
  {
    goto LABEL_112;
  }
  autocompleteParameters = self->_autocompleteParameters;
  if ((unint64_t)autocompleteParameters | v4[8]
    && !-[GEOPDAutocompleteParameters isEqual:](autocompleteParameters, "isEqual:"))
  {
    goto LABEL_112;
  }
  browseCategorySuggestionParameters = self->_browseCategorySuggestionParameters;
  if ((unint64_t)browseCategorySuggestionParameters | v4[15]
    && !-[GEOPDSearchBrowseCategorySuggestionParameters isEqual:](browseCategorySuggestionParameters, "isEqual:"))
  {
    goto LABEL_112;
  }
  categorySearchParameters = self->_categorySearchParameters;
  if ((unint64_t)categorySearchParameters | v4[17]
    && !-[GEOPDCategorySearchParameters isEqual:](categorySearchParameters, "isEqual:"))
  {
    goto LABEL_112;
  }
  popularNearbySearchParameters = self->_popularNearbySearchParameters;
  if ((unint64_t)popularNearbySearchParameters | v4[40]
    && !-[GEOPDPopularNearbySearchParameters isEqual:](popularNearbySearchParameters, "isEqual:"))
  {
    goto LABEL_112;
  }
  searchZeroKeywordCategorySuggestionParameters = self->_searchZeroKeywordCategorySuggestionParameters;
  if ((unint64_t)searchZeroKeywordCategorySuggestionParameters | v4[48]
    && !-[GEOPDSearchZeroKeywordCategorySuggestionParameters isEqual:](searchZeroKeywordCategorySuggestionParameters, "isEqual:"))
  {
    goto LABEL_112;
  }
  searchFieldPlaceholderParameters = self->_searchFieldPlaceholderParameters;
  if ((unint64_t)searchFieldPlaceholderParameters | v4[46]
    && !-[GEOPDSearchFieldPlaceholderParameters isEqual:](searchFieldPlaceholderParameters, "isEqual:"))
  {
    goto LABEL_112;
  }
  batchPopularNearbySearchParameters = self->_batchPopularNearbySearchParameters;
  if ((unint64_t)batchPopularNearbySearchParameters | v4[11]
    && !-[GEOPDBatchPopularNearbySearchParameters isEqual:](batchPopularNearbySearchParameters, "isEqual:"))
  {
    goto LABEL_112;
  }
  vendorSpecificPlaceRefinementParameters = self->_vendorSpecificPlaceRefinementParameters;
  if ((unint64_t)vendorSpecificPlaceRefinementParameters | v4[56]
    && !-[GEOPDVendorSpecificPlaceRefinementParameters isEqual:](vendorSpecificPlaceRefinementParameters, "isEqual:"))
  {
    goto LABEL_112;
  }
  nearbySearchParameters = self->_nearbySearchParameters;
  if ((unint64_t)nearbySearchParameters | v4[32]
    && !-[GEOPDNearbySearchParameters isEqual:](nearbySearchParameters, "isEqual:"))
  {
    goto LABEL_112;
  }
  addressObjectGeocodingParameters = self->_addressObjectGeocodingParameters;
  if ((unint64_t)addressObjectGeocodingParameters | v4[3]
    && !-[GEOPDAddressObjectGeocodingParameters isEqual:](addressObjectGeocodingParameters, "isEqual:"))
  {
    goto LABEL_112;
  }
  searchZeroKeywordWithSearchResultsSuggestionParameters = self->_searchZeroKeywordWithSearchResultsSuggestionParameters;
  if ((unint64_t)searchZeroKeywordWithSearchResultsSuggestionParameters | v4[49]
    && !-[GEOPDSearchZeroKeywordWithSearchResultsSuggestionParameters isEqual:](searchZeroKeywordWithSearchResultsSuggestionParameters, "isEqual:"))
  {
    goto LABEL_112;
  }
  externalTransitLookupParameters = self->_externalTransitLookupParameters;
  if ((unint64_t)externalTransitLookupParameters | v4[21]
    && !-[GEOPDExternalTransitLookupParameters isEqual:](externalTransitLookupParameters, "isEqual:"))
  {
    goto LABEL_112;
  }
  featureIdGeocodingParameters = self->_featureIdGeocodingParameters;
  if ((unint64_t)featureIdGeocodingParameters | v4[22]
    && !-[GEOPDFeatureIdGeocodingParameters isEqual:](featureIdGeocodingParameters, "isEqual:"))
  {
    goto LABEL_112;
  }
  mapsIdentifierPlaceLookupParameters = self->_mapsIdentifierPlaceLookupParameters;
  if ((unint64_t)mapsIdentifierPlaceLookupParameters | v4[29]
    && !-[GEOPDMapsIdentifierPlaceLookupParameters isEqual:](mapsIdentifierPlaceLookupParameters, "isEqual:"))
  {
    goto LABEL_112;
  }
  batchReverseGeocodingParameters = self->_batchReverseGeocodingParameters;
  if ((unint64_t)batchReverseGeocodingParameters | v4[12]
    && !-[GEOPDBatchReverseGeocodingParameters isEqual:](batchReverseGeocodingParameters, "isEqual:"))
  {
    goto LABEL_112;
  }
  brandLookupParameters = self->_brandLookupParameters;
  if ((unint64_t)brandLookupParameters | v4[14]
    && !-[GEOPDBrandLookupParameters isEqual:](brandLookupParameters, "isEqual:"))
  {
    goto LABEL_112;
  }
  wifiFingerprintParameters = self->_wifiFingerprintParameters;
  if ((unint64_t)wifiFingerprintParameters | v4[57]
    && !-[GEOPDWifiFingerprintParameters isEqual:](wifiFingerprintParameters, "isEqual:"))
  {
    goto LABEL_112;
  }
  ipGeoLookupParameters = self->_ipGeoLookupParameters;
  if ((unint64_t)ipGeoLookupParameters | v4[26]
    && !-[GEOPDIpGeoLookupParameters isEqual:](ipGeoLookupParameters, "isEqual:"))
  {
    goto LABEL_112;
  }
  groundViewLabelParameters = self->_groundViewLabelParameters;
  if ((unint64_t)groundViewLabelParameters | v4[24]
    && !-[GEOPDGroundViewLabelParameters isEqual:](groundViewLabelParameters, "isEqual:"))
  {
    goto LABEL_112;
  }
  batchSpatialLookupParameters = self->_batchSpatialLookupParameters;
  if ((unint64_t)batchSpatialLookupParameters | v4[13]
    && !-[GEOPDBatchSpatialLookupParameters isEqual:](batchSpatialLookupParameters, "isEqual:"))
  {
    goto LABEL_112;
  }
  transitVehiclePositionParameters = self->_transitVehiclePositionParameters;
  if ((unint64_t)transitVehiclePositionParameters | v4[55]
    && !-[GEOPDTransitVehiclePositionParameters isEqual:](transitVehiclePositionParameters, "isEqual:"))
  {
    goto LABEL_112;
  }
  placeCollectionLookupParameter = self->_placeCollectionLookupParameter;
  if ((unint64_t)placeCollectionLookupParameter | v4[34]
    && !-[GEOPDPlaceCollectionLookupParameters isEqual:](placeCollectionLookupParameter, "isEqual:"))
  {
    goto LABEL_112;
  }
  transitScheduleLookupParameter = self->_transitScheduleLookupParameter;
  if ((unint64_t)transitScheduleLookupParameter | v4[54]
    && !-[GEOPBTransitScheduleLookupParameters isEqual:](transitScheduleLookupParameter, "isEqual:"))
  {
    goto LABEL_112;
  }
  batchCategoryLookupParameters = self->_batchCategoryLookupParameters;
  if ((unint64_t)batchCategoryLookupParameters | v4[9]
    && !-[GEOPDBatchCategoryLookupParameters isEqual:](batchCategoryLookupParameters, "isEqual:"))
  {
    goto LABEL_112;
  }
  batchMerchantLookupBrandParameters = self->_batchMerchantLookupBrandParameters;
  if ((unint64_t)batchMerchantLookupBrandParameters | v4[10]
    && !-[GEOPDBatchMerchantLookupBrandParameters isEqual:](batchMerchantLookupBrandParameters, "isEqual:"))
  {
    goto LABEL_112;
  }
  childPlaceLookupByCategoryParameters = self->_childPlaceLookupByCategoryParameters;
  if ((unint64_t)childPlaceLookupByCategoryParameters | v4[18]
    && !-[GEOPDChildPlaceLookupByCategoryParameters isEqual:](childPlaceLookupByCategoryParameters, "isEqual:"))
  {
    goto LABEL_112;
  }
  collectionSuggestionParameters = self->_collectionSuggestionParameters;
  if ((unint64_t)collectionSuggestionParameters | v4[19]
    && !-[GEOPDCollectionSuggestionParameters isEqual:](collectionSuggestionParameters, "isEqual:"))
  {
    goto LABEL_112;
  }
  mapsSearchHomeParameters = self->_mapsSearchHomeParameters;
  if ((unint64_t)mapsSearchHomeParameters | v4[30]
    && !-[GEOPDMapsSearchHomeParameters isEqual:](mapsSearchHomeParameters, "isEqual:"))
  {
    goto LABEL_112;
  }
  placeQuestionnaireLookupParameters = self->_placeQuestionnaireLookupParameters;
  if ((unint64_t)placeQuestionnaireLookupParameters | v4[36]
    && !-[GEOPDPlaceQuestionnaireLookupParameters isEqual:](placeQuestionnaireLookupParameters, "isEqual:"))
  {
    goto LABEL_112;
  }
  publisherViewParameters = self->_publisherViewParameters;
  if ((unint64_t)publisherViewParameters | v4[41]
    && !-[GEOPDPublisherViewParameters isEqual:](publisherViewParameters, "isEqual:"))
  {
    goto LABEL_112;
  }
  allCollectionsViewParameters = self->_allCollectionsViewParameters;
  if ((unint64_t)allCollectionsViewParameters | v4[6]
    && !-[GEOPDAllCollectionsViewParameters isEqual:](allCollectionsViewParameters, "isEqual:"))
  {
    goto LABEL_112;
  }
  airportEntityPlaceLookupParameters = self->_airportEntityPlaceLookupParameters;
  if ((unint64_t)airportEntityPlaceLookupParameters | v4[5]
    && !-[GEOPDAirportEntityPlaceLookupParameters isEqual:](airportEntityPlaceLookupParameters, "isEqual:"))
  {
    goto LABEL_112;
  }
  territoryLookupParameters = self->_territoryLookupParameters;
  if ((unint64_t)territoryLookupParameters | v4[51]
    && !-[GEOPDTerritoryLookupParameters isEqual:](territoryLookupParameters, "isEqual:"))
  {
    goto LABEL_112;
  }
  transitNearbyScheduleLookupParameters = self->_transitNearbyScheduleLookupParameters;
  if ((unint64_t)transitNearbyScheduleLookupParameters | v4[53]
    && !-[GEOPDTransitNearbyScheduleLookupParameters isEqual:](transitNearbyScheduleLookupParameters, "isEqual:"))
  {
    goto LABEL_112;
  }
  mapsHomeParameters = self->_mapsHomeParameters;
  if ((unint64_t)mapsHomeParameters | v4[28]
    && !-[GEOPDMapsHomeParameters isEqual:](mapsHomeParameters, "isEqual:"))
  {
    goto LABEL_112;
  }
  allGuidesLocationsViewParameters = self->_allGuidesLocationsViewParameters;
  if ((unint64_t)allGuidesLocationsViewParameters | v4[7]
    && !-[GEOPDAllGuidesLocationsViewParameters isEqual:](allGuidesLocationsViewParameters, "isEqual:"))
  {
    goto LABEL_112;
  }
  guidesHomeParameters = self->_guidesHomeParameters;
  if ((unint64_t)guidesHomeParameters | v4[25]
    && !-[GEOPDGuidesHomeParameters isEqual:](guidesHomeParameters, "isEqual:"))
  {
    goto LABEL_112;
  }
  extendedGeoLookupParameters = self->_extendedGeoLookupParameters;
  if ((unint64_t)extendedGeoLookupParameters | v4[20]
    && !-[GEOPDExtendedGeoLookupParameters isEqual:](extendedGeoLookupParameters, "isEqual:"))
  {
    goto LABEL_112;
  }
  if (((queryUnderstandingParameters = self->_queryUnderstandingParameters,
         !((unint64_t)queryUnderstandingParameters | v4[42]))
     || -[GEOPDQueryUnderstandingParameters isEqual:](queryUnderstandingParameters, "isEqual:"))
    && ((poiAtAddressLookupParameters = self->_poiAtAddressLookupParameters,
         !((unint64_t)poiAtAddressLookupParameters | v4[39]))
     || -[GEOPDPoiAtAddressLookupParameters isEqual:](poiAtAddressLookupParameters, "isEqual:"))
    && ((transitNearbyPaymentMethodLookupParameters = self->_transitNearbyPaymentMethodLookupParameters,
         !((unint64_t)transitNearbyPaymentMethodLookupParameters | v4[52]))
     || -[GEOPDTransitNearbyPaymentMethodLookupParameters isEqual:](transitNearbyPaymentMethodLookupParameters, "isEqual:"))&& ((placecardEnrichmentParameters = self->_placecardEnrichmentParameters, !((unint64_t)placecardEnrichmentParameters | v4[38]))|| -[GEOPDPlacecardEnrichmentParameters isEqual:](placecardEnrichmentParameters, "isEqual:"))&& ((offlineRegionNameParameters = self->_offlineRegionNameParameters, !((unint64_t)offlineRegionNameParameters | v4[33]))|| -[GEOPDOfflineRegionNameParameters isEqual:](offlineRegionNameParameters, "isEqual:"))&& ((searchCapabilitiesParameters = self->_searchCapabilitiesParameters, !((unint64_t)searchCapabilitiesParameters | v4[45]))|| -[GEOPDSearchCapabilitiesParameters isEqual:](searchCapabilitiesParameters, "isEqual:"))&& ((refreshIdLookUpParameters = self->_refreshIdLookUpParameters, !((unint64_t)refreshIdLookUpParameters | v4[43]))|| -[GEOPDRefreshIdLookUpParameters isEqual:](refreshIdLookUpParameters, "isEqual:")))
  {
    addressRecommendationParameters = self->_addressRecommendationParameters;
    if ((unint64_t)addressRecommendationParameters | v4[4]) {
      char v60 = -[GEOPDAddressRecommendationParameters isEqual:](addressRecommendationParameters, "isEqual:");
    }
    else {
      char v60 = 1;
    }
  }
  else
  {
LABEL_112:
    char v60 = 0;
  }

  return v60;
}

- (GEOPDPlaceRequestParameters)initWithIdentifiers:(id)a3 resultProviderID:(int)a4
{
  uint64_t v4 = *(void *)&a4;
  id v6 = a3;
  v11.receiver = self;
  v11.super_class = (Class)GEOPDPlaceRequestParameters;
  objc_super v7 = [(GEOPDPlaceRequestParameters *)&v11 init];
  if (v7)
  {
    objc_super v8 = [[GEOPDMapsIdentifierPlaceLookupParameters alloc] initWithIdentifiers:v6 resultProviderID:v4];
    -[GEOPDPlaceRequestParameters setMapsIdentifierPlaceLookupParameters:]((uint64_t)v7, v8);

    id v9 = v7;
  }

  return v7;
}

- (GEOPDPlaceRequestParameters)initWithExternalBusinessID:(id)a3 contentProvider:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v12.receiver = self;
  v12.super_class = (Class)GEOPDPlaceRequestParameters;
  objc_super v8 = [(GEOPDPlaceRequestParameters *)&v12 init];
  if (v8)
  {
    id v9 = [[GEOPDVendorSpecificPlaceRefinementParameters alloc] initWithExternalBusinessID:v6 contentProvider:v7];
    -[GEOPDPlaceRequestParameters setVendorSpecificPlaceRefinementParameters:]((uint64_t)v8, v9);
    id v10 = v8;
  }
  return v8;
}

- (GEOPDPlaceRequestParameters)initWithMerchantCode:(id)a3 rawMerchantCode:(id)a4 relyingPartyIdentifier:(id)a5 industryCategory:(id)a6 industryCode:(id)a7 paymentNetwork:(id)a8 transactionDate:(id)a9 transactionLocation:(id)a10 terminalId:(id)a11 transactionCurrencyCode:(id)a12 transactionType:(int)a13 transactionId:(id)a14 warsawMerchantDomain:(id)a15 warsawMerchantName:(id)a16 warsawMerchantId:(id)a17 adamId:(id)a18 merchantId:(id)a19 merchantDoingBizAsName:(id)a20 merchantEnhancedName:(id)a21 merchantCity:(id)a22 merchantRawCity:(id)a23 merchantState:(id)a24 merchantRawState:(id)a25 merchantZip:(id)a26 merchantAddress:(id)a27 merchantRawAddress:(id)a28 merchantCountryCode:(id)a29 merchantType:(id)a30 merchantCleanConfidenceLevel:(id)a31 merchantAdditionalData:(id)a32 merchantCanl:(id)a33 brandFallbackSupported:(BOOL)a34 isSettlement:(BOOL)a35 isRefund:(BOOL)a36 fuzzyMatched:(id)a37 coarseLocationUsed:(id)a38 bankTransactionType:(int)a39 bankTransactionStatus:(int)a40 bankAnonymisedUserId:(id)a41 otherBankTransactionLocations:(id)a42 bankTransactionDescription:(id)a43 bankTransactionTimestamp:(id)a44 bankRawMerchantCode:(id)a45 bankIndustryCategory:(id)a46 bankIndustryCode:(id)a47 bankTransactionCurrencyCode:(id)a48 bankMerchantInfo:(id)a49 baaCerts:(id)a50 baaSignature:(id)a51 bankBrandMUIDFallbackEnabled:(id)a52 bankIdentifier:(id)a53 bankTransactionDescriptionClean:(id)a54 bankPIIRedactionIsApplied:(id)a55 bankRotationPeriodsSinceEpoch:(id)a56 traits:(id)a57
{
  uint64_t v186 = *MEMORY[0x1E4F143B8];
  id v158 = a3;
  id v174 = a4;
  id v152 = a5;
  id v60 = a6;
  id v162 = a7;
  id v160 = a8;
  id v61 = a9;
  id v62 = a10;
  id v157 = a11;
  id v63 = a12;
  id v156 = a14;
  id v64 = a15;
  id v65 = a16;
  id v66 = a17;
  id v155 = a18;
  id v67 = a19;
  id v68 = a20;
  id v172 = a21;
  id v171 = a22;
  id v170 = a23;
  id v169 = a24;
  id v168 = a25;
  id v167 = a26;
  id v166 = a27;
  id v165 = a28;
  id v164 = a29;
  id v163 = a30;
  id v148 = a31;
  id v147 = a32;
  id v173 = a33;
  id v154 = a37;
  id v153 = a38;
  id v146 = a41;
  id v151 = a42;
  id v131 = a43;
  id v145 = a44;
  id v144 = a45;
  id v143 = a46;
  id v142 = a47;
  id v141 = a48;
  id v130 = a49;
  id v150 = a50;
  id v140 = a51;
  id v139 = a52;
  id v138 = a53;
  id v137 = a54;
  id v136 = a55;
  id v149 = a56;
  id v129 = a57;
  v183.receiver = self;
  v183.super_class = (Class)GEOPDPlaceRequestParameters;
  id v69 = [(GEOPDPlaceRequestParameters *)&v183 init];

  if (v69)
  {
    id v132 = v68;
    id v133 = v67;
    id v135 = v63;
    if (v61)
    {
      id v70 = [MEMORY[0x1E4F1C9A8] calendarWithIdentifier:*MEMORY[0x1E4F1C318]];
      uint64_t v71 = [v70 components:124 fromDate:v61];
      objc_msgSend(v71, "setMinute:", 15 * (objc_msgSend(v71, "minute") / 15));
      id v128 = [v70 dateFromComponents:v71];
    }
    else
    {
      id v128 = 0;
    }
    id v72 = objc_alloc_init(GEOPDMerchantLookupParameters);
    [(GEOPDMerchantLookupParameters *)v72 setMerchantCode:v158];
    if (v174) {
      [(GEOPDMerchantLookupParameters *)v72 setRawMerchantCode:v174];
    }
    if (v60) {
      [(GEOPDMerchantLookupParameters *)v72 setIndustryCategory:v60];
    }
    if (v162) {
      -[GEOPDMerchantLookupParameters setIndustryCode:](v72, "setIndustryCode:", [v162 longLongValue]);
    }
    [(GEOPDMerchantLookupParameters *)v72 setPaymentNetwork:v160];
    if (v128)
    {
      [v128 timeIntervalSinceReferenceDate];
      -[GEOPDMerchantLookupParameters setTransactionTimestamp:](v72, "setTransactionTimestamp:");
    }
    id v126 = v60;
    uint64_t v73 = (void *)[v62 copy];
    [v73 setHasTimestamp:0];
    [(GEOPDMerchantLookupParameters *)v72 setTransactionLocation:v73];
    int v74 = [v62 hasTimestamp];
    if (v61 && v74)
    {
      [v61 timeIntervalSinceReferenceDate];
      double v76 = v75;
      [v62 timestamp];
      [(GEOPDMerchantLookupParameters *)v72 setTransactionLocationAge:v76 - v77];
    }
    if (v157) {
      [(GEOPDMerchantLookupParameters *)v72 setTerminalId:v157];
    }
    if (v63) {
      -[GEOPDMerchantLookupParameters setTransactionCurrencyCode:](v72, "setTransactionCurrencyCode:");
    }
    if (a13)
    {
      [(GEOPDMerchantLookupParameters *)v72 setTransactionType:a13];
      if (v152)
      {
        if (a13 == 6)
        {
          id v78 = objc_alloc_init(GEOPDIdentityMerchantInformation);
          -[GEOPDIdentityMerchantInformation setRpIdentifier:]((uint64_t)v78, v152);
          [(GEOPDMerchantLookupParameters *)v72 setIdentityMerchantInformation:v78];
        }
      }
    }
    if (v156) {
      [(GEOPDMerchantLookupParameters *)v72 setTransactionId:v156];
    }
    if (v64 || v65 || v66)
    {
      uint64_t v79 = objc_alloc_init(GEOPDWarsawMerchantIdentifier);
      [(GEOPDMerchantLookupParameters *)v72 setWarsawMerchantIdentifier:v79];

      if (v64)
      {
        BOOL v80 = [(GEOPDMerchantLookupParameters *)v72 warsawMerchantIdentifier];
        -[GEOPDWarsawMerchantIdentifier setMerchantDomain:]((uint64_t)v80, v64);
      }
      if (v65)
      {
        id v81 = [(GEOPDMerchantLookupParameters *)v72 warsawMerchantIdentifier];
        -[GEOPDWarsawMerchantIdentifier setMerchantName:]((uint64_t)v81, v65);
      }
      if (v66)
      {
        id v82 = [(GEOPDMerchantLookupParameters *)v72 warsawMerchantIdentifier];
        -[GEOPDWarsawMerchantIdentifier setMerchantId:]((uint64_t)v82, v66);
      }
    }
    id v122 = v65;
    id v124 = v62;
    id v127 = v64;
    id v83 = v61;
    if (v155)
    {
      id v84 = objc_alloc_init(GEOPDAdamAppIdentifier);
      [(GEOPDMerchantLookupParameters *)v72 setAppIdentifier:v84];

      uint64_t v85 = [(GEOPDMerchantLookupParameters *)v72 appIdentifier];
      -[GEOPDAdamAppIdentifier setAdamId:]((uint64_t)v85, v155);

      id v61 = v83;
    }
    if (v133 || v132 || v172 || v171 || v170 || v169 || v168 || v167 || v166 || v165 || v164 || v163 || v173)
    {
      id v86 = objc_alloc_init(GEOPDMerchantInformation);
      [(GEOPDMerchantLookupParameters *)v72 setMerchantInformation:v86];

      if (v133)
      {
        uint64_t v87 = [(GEOPDMerchantLookupParameters *)v72 merchantInformation];
        [v87 setMerchantId:v133];
      }
      if (v132)
      {
        id v88 = [(GEOPDMerchantLookupParameters *)v72 merchantInformation];
        [v88 setMerchantDoingBusinessAsName:v132];
      }
      if (v172)
      {
        uint64_t v89 = [(GEOPDMerchantLookupParameters *)v72 merchantInformation];
        [v89 setMerchantEnhancedName:v172];
      }
      if (v171)
      {
        uint64_t v90 = [(GEOPDMerchantLookupParameters *)v72 merchantInformation];
        [v90 setMerchantCity:v171];
      }
      if (v170)
      {
        id v91 = [(GEOPDMerchantLookupParameters *)v72 merchantInformation];
        [v91 setMerchantRawCity:v170];
      }
      if (v169)
      {
        id v92 = [(GEOPDMerchantLookupParameters *)v72 merchantInformation];
        [v92 setMerchantState:v169];
      }
      if (v168)
      {
        uint64_t v93 = [(GEOPDMerchantLookupParameters *)v72 merchantInformation];
        [v93 setMerchantRawState:v168];
      }
      if (v167)
      {
        uint64_t v94 = [(GEOPDMerchantLookupParameters *)v72 merchantInformation];
        [v94 setMerchantZip:v167];
      }
      if (v166)
      {
        id v95 = [(GEOPDMerchantLookupParameters *)v72 merchantInformation];
        [v95 setMerchantAddress:v166];
      }
      if (v165)
      {
        id v96 = [(GEOPDMerchantLookupParameters *)v72 merchantInformation];
        [v96 setMerchantRawAddress:v165];
      }
      if (v164)
      {
        id v97 = [(GEOPDMerchantLookupParameters *)v72 merchantInformation];
        [v97 setMerchantCountryCode:v164];
      }
      if (v163)
      {
        uint64_t v98 = [(GEOPDMerchantLookupParameters *)v72 merchantInformation];
        [v98 setMerchantType:v163];
      }
      if (v148)
      {
        uint64_t v99 = [v148 intValue];
        [(GEOPDMerchantLookupParameters *)v72 merchantInformation];
        v101 = id v100 = v66;
        [v101 setMerchantCleanConfidenceLevel:v99];

        id v66 = v100;
      }
      if (v147)
      {
        id v102 = [(GEOPDMerchantLookupParameters *)v72 merchantInformation];
        [v102 setMerchantAdditionalData:v147];
      }
      id v61 = v83;
      if (v173)
      {
        id v103 = [(GEOPDMerchantLookupParameters *)v72 merchantInformation];
        [v103 setMerchantCanl:v173];

        id v61 = v83;
      }
    }
    -[GEOPDMerchantLookupParameters setEnableBrandMuidFallback:](v72, "setEnableBrandMuidFallback:", a34, v122, v124);
    if (a35) {
      unsigned int v104 = 2;
    }
    else {
      unsigned int v104 = 1;
    }
    if (a36) {
      uint64_t v105 = 3;
    }
    else {
      uint64_t v105 = v104;
    }
    [(GEOPDMerchantLookupParameters *)v72 setTransactionStatus:v105];
    if (v154) {
      -[GEOPDMerchantLookupParameters setFuzzyMatched:](v72, "setFuzzyMatched:", [v154 BOOLValue]);
    }
    id v60 = v126;
    if (v153) {
      -[GEOPDMerchantLookupParameters setCoarseLocationUsed:](v72, "setCoarseLocationUsed:", [v153 BOOLValue]);
    }
    -[GEOPDPlaceRequestParameters setMerchantLookupParameters:]((uint64_t)v69, v72);
    if (!GEOConfigGetBOOL(GeoServicesConfig_Maps_493532, (uint64_t)off_1E9114E88)) {
      goto LABEL_140;
    }
    id v106 = v66;
    uint64_t v107 = objc_alloc_init(GEOPDBankTransactionInformation);
    id v108 = v107;
    BOOL v109 = a39 != 0;
    if (a39) {
      [(GEOPDBankTransactionInformation *)v107 setBankTransactionType:a39];
    }
    if (a40)
    {
      [(GEOPDBankTransactionInformation *)v108 setTransactionStatus:a40];
      BOOL v109 = 1;
    }
    id v61 = v83;
    [(GEOPDBankTransactionInformation *)v108 setAnonymisedUserId:v146];
    if ([v151 count])
    {
      long long v181 = 0u;
      long long v182 = 0u;
      long long v179 = 0u;
      long long v180 = 0u;
      id v110 = v151;
      uint64_t v111 = [v110 countByEnumeratingWithState:&v179 objects:v185 count:16];
      if (v111)
      {
        uint64_t v112 = v111;
        uint64_t v113 = *(void *)v180;
        do
        {
          for (uint64_t i = 0; i != v112; ++i)
          {
            if (*(void *)v180 != v113) {
              objc_enumerationMutation(v110);
            }
            [(GEOPDBankTransactionInformation *)v108 addOtherTransactionLocations:*(void *)(*((void *)&v179 + 1) + 8 * i)];
          }
          uint64_t v112 = [v110 countByEnumeratingWithState:&v179 objects:v185 count:16];
        }
        while (v112);
      }

      BOOL v109 = 1;
      id v61 = v83;
      id v64 = v127;
      id v66 = v106;
    }
    if (GEOConfigGetBOOL(GeoServicesConfig_Maps_133492, (uint64_t)off_1E9114E78))
    {
      [(GEOPDBankTransactionInformation *)v108 setBankTransactionDescription:v131];
      BOOL v109 = 1;
    }
    if (v145)
    {
      [v145 doubleValue];
      -[GEOPDBankTransactionInformation setTransactionTimestamp:](v108, "setTransactionTimestamp:");
      BOOL v109 = 1;
    }
    if (v144)
    {
      -[GEOPDBankTransactionInformation setRawMerchantCode:](v108, "setRawMerchantCode:");
      BOOL v109 = 1;
    }
    if (v143)
    {
      -[GEOPDBankTransactionInformation setIndustryCategory:](v108, "setIndustryCategory:");
      BOOL v109 = 1;
    }
    if (v142)
    {
      -[GEOPDBankTransactionInformation setIndustryCode:](v108, "setIndustryCode:", (int)[v142 intValue]);
      BOOL v109 = 1;
    }
    if (v141)
    {
      -[GEOPDBankTransactionInformation setTransactionCurrencyCode:](v108, "setTransactionCurrencyCode:");
      BOOL v109 = 1;
    }
    if ([v150 count])
    {
      long long v177 = 0u;
      long long v178 = 0u;
      long long v175 = 0u;
      long long v176 = 0u;
      id v115 = v150;
      uint64_t v116 = [v115 countByEnumeratingWithState:&v175 objects:v184 count:16];
      if (v116)
      {
        uint64_t v117 = v116;
        uint64_t v118 = *(void *)v176;
        do
        {
          for (uint64_t j = 0; j != v117; ++j)
          {
            if (*(void *)v176 != v118) {
              objc_enumerationMutation(v115);
            }
            [(GEOPDBankTransactionInformation *)v108 addBaaCertificate:*(void *)(*((void *)&v175 + 1) + 8 * j)];
          }
          uint64_t v117 = [v115 countByEnumeratingWithState:&v175 objects:v184 count:16];
        }
        while (v117);
      }

      BOOL v109 = 1;
      id v61 = v83;
      id v64 = v127;
      id v66 = v106;
    }
    if (v140)
    {
      -[GEOPDBankTransactionInformation setBaaSignature:](v108, "setBaaSignature:");
      BOOL v109 = 1;
    }
    if (v139)
    {
      -[GEOPDBankTransactionInformation setEnableBrandMuidFallback:](v108, "setEnableBrandMuidFallback:", [v139 BOOLValue]);
      BOOL v109 = 1;
    }
    if (v138)
    {
      [(GEOPDBankTransactionInformation *)v108 setBankIdentifier:v138];
      BOOL v109 = 1;
    }
    if (v137)
    {
      -[GEOPDBankTransactionInformation setBankTransactionDescriptionClean:](v108, "setBankTransactionDescriptionClean:");
      BOOL v109 = 1;
    }
    if (v136)
    {
      -[GEOPDBankTransactionInformation setPiiRedactionApplied:](v108, "setPiiRedactionApplied:", [v136 BOOLValue]);
      if (!v149) {
        goto LABEL_138;
      }
    }
    else if (!v149)
    {
      if (!v109) {
        goto LABEL_139;
      }
      goto LABEL_138;
    }
    -[GEOPDBankTransactionInformation setRotationPeriodsSinceEpoch:](v108, "setRotationPeriodsSinceEpoch:", [v149 intValue]);
LABEL_138:
    [(GEOPDMerchantLookupParameters *)v72 setBankTransactionInformation:v108];
LABEL_139:

    id v60 = v126;
    id v63 = v135;
LABEL_140:
    uint64_t v120 = v69;

    id v65 = v123;
    id v62 = v125;
    id v68 = v132;
    id v67 = v133;
  }

  return v69;
}

- (GEOPDPlaceRequestParameters)initWithAirportCode:(id)a3 terminalCode:(id)a4 gateCode:(id)a5 traits:(id)a6
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v16.receiver = self;
  v16.super_class = (Class)GEOPDPlaceRequestParameters;
  objc_super v12 = [(GEOPDPlaceRequestParameters *)&v16 init];
  if (v12)
  {
    uint64_t v13 = objc_alloc_init(GEOPDAirportEntityPlaceLookupParameters);
    -[GEOPDAirportEntityPlaceLookupParameters setAirportCode:]((uint64_t)v13, v9);
    -[GEOPDAirportEntityPlaceLookupParameters setTerminalCode:]((uint64_t)v13, v10);
    -[GEOPDAirportEntityPlaceLookupParameters setGateCode:]((uint64_t)v13, v11);
    -[GEOPDPlaceRequestParameters setAirportEntityPlaceLookupParameters:]((uint64_t)v12, v13);
    id v14 = v12;
  }
  return v12;
}

- (GEOPDPlaceRequestParameters)initWithExternalTransitStationCodes:(id)a3 sourceID:(id)a4 transactionDate:(id)a5 transactionLocation:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  v25.receiver = self;
  v25.super_class = (Class)GEOPDPlaceRequestParameters;
  id v14 = [(GEOPDPlaceRequestParameters *)&v25 init];
  if (v14)
  {
    if (v12)
    {
      uint64_t v15 = [MEMORY[0x1E4F1C9A8] currentCalendar];
      objc_super v16 = [v15 components:124 fromDate:v12];

      objc_msgSend(v16, "setMinute:", 15 * (objc_msgSend(v16, "minute") / 15));
      uint64_t v17 = [MEMORY[0x1E4F1C9A8] currentCalendar];
      uint64_t v18 = [v17 dateFromComponents:v16];
    }
    else
    {
      uint64_t v18 = 0;
    }
    id v19 = objc_alloc_init(GEOPDExternalTransitLookupParameters);
    uint64_t v20 = (void *)[v10 mutableCopy];
    -[GEOPDExternalTransitLookupParameters setExternalTransitStationCodes:]((uint64_t)v19, v20);

    -[GEOPDExternalTransitLookupParameters setSourceId:]((uint64_t)v19, v11);
    if (v18)
    {
      [v18 timeIntervalSinceReferenceDate];
      if (v19)
      {
        *(unsigned char *)&v19->_flags |= 0x20u;
        *(unsigned char *)&v19->_flags |= 1u;
        v19->_transactionTimestamp = v21;
      }
    }
    uint64_t v22 = (void *)[v13 copy];
    [v22 setTimestamp:0.0];
    [v22 setHasTimestamp:0];
    -[GEOPDExternalTransitLookupParameters setTransactionLocation:]((uint64_t)v19, v22);
    -[GEOPDPlaceRequestParameters setExternalTransitLookupParameters:]((uint64_t)v14, v19);
    uint64_t v23 = v14;
  }
  return v14;
}

- (GEOPDPlaceRequestParameters)initWithReverseGeocodeCoordinate:(id)a3 preserveOriginalLocation:(BOOL)a4 floorOrdinal:(int)a5
{
  uint64_t v5 = *(void *)&a5;
  double var1 = a3.var1;
  double var0 = a3.var0;
  v14.receiver = self;
  v14.super_class = (Class)GEOPDPlaceRequestParameters;
  id v9 = [(GEOPDPlaceRequestParameters *)&v14 init];
  if (v9)
  {
    id v10 = objc_alloc_init(GEOPDReverseGeocodingParameters);
    id v11 = -[GEOLocation initWithGEOCoordinate:floorOrdinal:]([GEOLocation alloc], "initWithGEOCoordinate:floorOrdinal:", v5, var0, var1);
    -[GEOPDReverseGeocodingParameters addExtendedLocation:]((uint64_t)v10, v11);
    if (v10)
    {
      *(unsigned char *)&v10->_flags |= 0x20u;
      *(unsigned char *)&v10->_flags |= 2u;
      v10->_preserveOriginalLocatiouint64_t n = a4;
    }
    -[GEOPDPlaceRequestParameters setReverseGeocodingParameters:]((uint64_t)v9, v10);
    id v12 = v9;
  }
  return v9;
}

- (GEOPDPlaceRequestParameters)initWithReverseGeocodeCoordinate:(id)a3
{
  return -[GEOPDPlaceRequestParameters initWithReverseGeocodeCoordinate:preserveOriginalLocation:](self, "initWithReverseGeocodeCoordinate:preserveOriginalLocation:", 0, a3.var0, a3.var1);
}

- (GEOPDPlaceRequestParameters)initWithReverseGeocodeCoordinate:(id)a3 preserveOriginalLocation:(BOOL)a4
{
  return -[GEOPDPlaceRequestParameters initWithReverseGeocodeCoordinate:preserveOriginalLocation:floorOrdinal:](self, "initWithReverseGeocodeCoordinate:preserveOriginalLocation:floorOrdinal:", a4, 0x7FFFFFFFLL, a3.var0, a3.var1);
}

- (GEOPDPlaceRequestParameters)initWithBatchReverseGeocodeLocations:(id)a3 additionalPlaceTypes:(int *)a4 additionalPlaceTypesCount:(unint64_t)a5 traits:(id)a6
{
  id v9 = a3;
  v16.receiver = self;
  v16.super_class = (Class)GEOPDPlaceRequestParameters;
  id v10 = [(GEOPDPlaceRequestParameters *)&v16 init];
  if (v10)
  {
    id v11 = objc_alloc_init(GEOPDBatchReverseGeocodingParameters);
    id v12 = (void *)[v9 mutableCopy];
    -[GEOPDBatchReverseGeocodingParameters setAssetLocations:]((uint64_t)v11, v12);

    for (; a5; --a5)
    {
      int v13 = *a4++;
      _PDPlaceTypeForMapItemPlaceType(v13);
      -[GEOPDBatchReverseGeocodingParameters addAdditionalPlaceType:]((uint64_t)v11);
    }
    -[GEOPDPlaceRequestParameters setBatchReverseGeocodingParameters:]((uint64_t)v10, v11);
    objc_super v14 = v10;
  }
  return v10;
}

- (GEOPDPlaceRequestParameters)initWithForwardGeocodeAddress:(id)a3 maxResults:(unsigned int)a4 traits:(id)a5
{
  uint64_t v6 = *(void *)&a4;
  id v8 = a3;
  id v9 = a5;
  v14.receiver = self;
  v14.super_class = (Class)GEOPDPlaceRequestParameters;
  id v10 = [(GEOPDPlaceRequestParameters *)&v14 init];
  if (v10)
  {
    id v11 = [[GEOPDGeocodingParameters alloc] initWithForwardGeocodeAddress:v8 maxResults:v6 traits:v9];
    -[GEOPDPlaceRequestParameters setGeocodingParameters:]((uint64_t)v10, v11);
    id v12 = v10;
  }
  return v10;
}

- (GEOPDPlaceRequestParameters)initWithForwardGeocodeAddressString:(id)a3 maxResults:(unsigned int)a4 traits:(id)a5
{
  uint64_t v6 = *(void *)&a4;
  id v8 = a3;
  id v9 = a5;
  v14.receiver = self;
  v14.super_class = (Class)GEOPDPlaceRequestParameters;
  id v10 = [(GEOPDPlaceRequestParameters *)&v14 init];
  if (v10)
  {
    id v11 = [[GEOPDGeocodingParameters alloc] initWithForwardGeocodeAddressString:v8 maxResults:v6 traits:v9];
    -[GEOPDPlaceRequestParameters setGeocodingParameters:]((uint64_t)v10, v11);
    id v12 = v10;
  }
  return v10;
}

- (GEOPDPlaceRequestParameters)initWithMapItemToRefine:(id)a3 traits:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  [v7 coordinate];
  id v8 = -[GEOPDPlaceRequestParameters initWithMapItemToRefine:coordinate:traits:](self, "initWithMapItemToRefine:coordinate:traits:", v7, v6);

  return v8;
}

- (GEOPDPlaceRequestParameters)initWithPlaceRefinementParameters:(id)a3 traits:(id)a4
{
  id v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)GEOPDPlaceRequestParameters;
  id v6 = [(GEOPDPlaceRequestParameters *)&v10 init];
  id v7 = v6;
  if (v6)
  {
    -[GEOPDPlaceRequestParameters setPlaceRefinementParameters:]((uint64_t)v6, v5);
    id v8 = v7;
  }

  return v7;
}

- (GEOPDPlaceRequestParameters)initWithVendorSpecificPlaceRefinementParameters:(id)a3 traits:(id)a4
{
  id v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)GEOPDPlaceRequestParameters;
  id v6 = [(GEOPDPlaceRequestParameters *)&v10 init];
  id v7 = v6;
  if (v6)
  {
    -[GEOPDPlaceRequestParameters setVendorSpecificPlaceRefinementParameters:]((uint64_t)v6, v5);
    id v8 = v7;
  }

  return v7;
}

- (GEOPDPlaceRequestParameters)initWithCanonicalLocationSearchQueryString:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)GEOPDPlaceRequestParameters;
  id v5 = [(GEOPDPlaceRequestParameters *)&v9 init];
  if (v5)
  {
    id v6 = objc_alloc_init(GEOPDCanonicalLocationSearchParameters);
    -[GEOPDCanonicalLocationSearchParameters setQueryString:]((uint64_t)v6, v4);
    -[GEOPDPlaceRequestParameters setCanonicalLocationSearchParameters:]((uint64_t)v5, v6);
    id v7 = v5;
  }
  return v5;
}

- (GEOPDPlaceRequestParameters)initWithBrandMUID:(unint64_t)a3 traits:(id)a4
{
  id v6 = a4;
  v15.receiver = self;
  v15.super_class = (Class)GEOPDPlaceRequestParameters;
  id v7 = [(GEOPDPlaceRequestParameters *)&v15 init];
  if (v7)
  {
    id v8 = objc_alloc_init(GEOPDSBrandFilter);
    objc_super v9 = v8;
    if (v8)
    {
      *(unsigned char *)&v8->_flags |= 1u;
      v8->_brandMuid = a3;
    }
    objc_super v10 = objc_alloc_init(GEOPDSSearchFilter);
    -[GEOPDSSearchFilter setBrandFilter:]((uint64_t)v10, v9);
    id v11 = objc_alloc_init(GEOPDSearchParameters);
    -[GEOPDSearchParameters setSearchFilter:]((uint64_t)v11, v10);
    id v12 = +[GEOPDViewportInfo viewportInfoForTraits:v6];
    -[GEOPDSearchParameters setViewportInfo:]((uint64_t)v11, v12);

    int v13 = +[GEOPDETAFilter etaFilterForTraits:v6];
    -[GEOPDSearchParameters setEtaFilter:]((uint64_t)v11, v13);

    -[GEOPDPlaceRequestParameters setSearchParameters:]((uint64_t)v7, v11);
  }

  return v7;
}

- (GEOPDPlaceRequestParameters)initWithSearchQuery:(id)a3 entryMetadata:(id)a4 metadata:(id)a5 autocompleteEntry:(id)a6 retainedSearch:(id)a7 maxResults:(unsigned int)a8 filters:(id)a9 traits:(id)a10 routeInfo:(id)a11 error:(id *)a12 searchSessionData:(id)a13
{
  uint64_t v49 = *MEMORY[0x1E4F143B8];
  id v17 = a3;
  id v18 = a4;
  id v19 = a5;
  id v20 = a6;
  id v21 = a7;
  id v22 = a9;
  id v23 = a10;
  id v24 = a11;
  id v25 = a13;
  v47.receiver = self;
  v47.super_class = (Class)GEOPDPlaceRequestParameters;
  uint64_t v26 = [(GEOPDPlaceRequestParameters *)&v47 init];
  uint64_t v41 = v23;
  unint64_t v42 = v22;
  if (v26)
  {
    id v40 = v17;
    id v36 = v19;
    id v37 = v18;
    id v35 = v20;
    uint64_t v27 = [[GEOPDSearchParameters alloc] initWithSearchQuery:v17 entryMetadata:v18 metadata:v19 autocompleteEntry:v20 retainedSearch:v21 maxResults:a8 traits:v23 routeInfo:v24 searchSessionData:v25];
    long long v43 = 0u;
    long long v44 = 0u;
    long long v45 = 0u;
    long long v46 = 0u;
    id v28 = v22;
    uint64_t v29 = [v28 countByEnumeratingWithState:&v43 objects:v48 count:16];
    if (v29)
    {
      uint64_t v30 = v29;
      uint64_t v31 = *(void *)v44;
      while (2)
      {
        for (uint64_t i = 0; i != v30; ++i)
        {
          if (*(void *)v44 != v31) {
            objc_enumerationMutation(v28);
          }
          if (![*(id *)(*((void *)&v43 + 1) + 8 * i) applyToSearchParameters:v27 error:a12])
          {

            long long v33 = 0;
            goto LABEL_12;
          }
        }
        uint64_t v30 = [v28 countByEnumeratingWithState:&v43 objects:v48 count:16];
        if (v30) {
          continue;
        }
        break;
      }
    }

    -[GEOPDPlaceRequestParameters setSearchParameters:]((uint64_t)v26, v27);
    long long v33 = v26;
LABEL_12:

    id v17 = v40;
    id v19 = v36;
    id v18 = v37;
    id v20 = v35;
  }
  else
  {
    long long v33 = 0;
  }

  return v33;
}

- (GEOPDPlaceRequestParameters)initWithSearchURLQuery:(id)a3 identifier:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v12.receiver = self;
  v12.super_class = (Class)GEOPDPlaceRequestParameters;
  id v8 = [(GEOPDPlaceRequestParameters *)&v12 init];
  if (v8)
  {
    objc_super v9 = [[GEOPDPlaceRefinementParameters alloc] initWithSearchURLQuery:v6 identifier:v7];
    -[GEOPDPlaceRequestParameters setPlaceRefinementParameters:]((uint64_t)v8, v9);
    objc_super v10 = v8;
  }
  return v8;
}

- (GEOPDPlaceRequestParameters)initWithSearchURLQuery:(id)a3 coordinate:(id)a4 muid:(unint64_t)a5 resultProviderId:(int)a6 contentProvider:(id)a7
{
  uint64_t v8 = *(void *)&a6;
  double var1 = a4.var1;
  double var0 = a4.var0;
  id v13 = a3;
  id v14 = a7;
  v19.receiver = self;
  v19.super_class = (Class)GEOPDPlaceRequestParameters;
  objc_super v15 = [(GEOPDPlaceRequestParameters *)&v19 init];
  if (v15)
  {
    objc_super v16 = -[GEOPDVendorSpecificPlaceRefinementParameters initWithSearchURLQuery:coordinate:muid:resultProviderId:contentProvider:]([GEOPDVendorSpecificPlaceRefinementParameters alloc], "initWithSearchURLQuery:coordinate:muid:resultProviderId:contentProvider:", v13, a5, v8, v14, var0, var1);
    -[GEOPDPlaceRequestParameters setVendorSpecificPlaceRefinementParameters:]((uint64_t)v15, v16);
    id v17 = v15;
  }
  return v15;
}

- (GEOPDPlaceRequestParameters)initWithSearchURLQuery:(id)a3 coordinate:(id)a4 maxResults:(unsigned int)a5 traits:(id)a6
{
  uint64_t v7 = *(void *)&a5;
  double var1 = a4.var1;
  double var0 = a4.var0;
  id v11 = a3;
  id v12 = a6;
  v17.receiver = self;
  v17.super_class = (Class)GEOPDPlaceRequestParameters;
  id v13 = [(GEOPDPlaceRequestParameters *)&v17 init];
  if (v13)
  {
    id v14 = -[GEOPDLocationDirectedSearchParameters initWithSearchURLQuery:coordinate:maxResults:traits:]([GEOPDLocationDirectedSearchParameters alloc], "initWithSearchURLQuery:coordinate:maxResults:traits:", v11, v7, v12, var0, var1);
    -[GEOPDPlaceRequestParameters setLocationDirectedSearchParameters:]((uint64_t)v13, v14);
    objc_super v15 = v13;
  }
  return v13;
}

- (void)clearLocations
{
  if (self)
  {
    -[GEOPDPlaceRequestParameters _readBatchReverseGeocodingParameters]((uint64_t)self);
    if (self->_batchReverseGeocodingParameters)
    {
      id v3 = objc_opt_new();
      id v4 = -[GEOPDPlaceRequestParameters batchReverseGeocodingParameters]((id *)&self->super.super.isa);
      -[GEOPDBatchReverseGeocodingParameters setAssetLocations:]((uint64_t)v4, v3);
    }
    -[GEOPDPlaceRequestParameters _readExternalTransitLookupParameters]((uint64_t)self);
    if (self->_externalTransitLookupParameters)
    {
      id v5 = -[GEOPDPlaceRequestParameters externalTransitLookupParameters]((id *)&self->super.super.isa);
      -[GEOPDExternalTransitLookupParameters setTransactionLocation:]((uint64_t)v5, 0);
    }
    -[GEOPDPlaceRequestParameters _readFeatureIdGeocodingParameters]((uint64_t)self);
    if (self->_featureIdGeocodingParameters)
    {
      id v6 = -[GEOPDPlaceRequestParameters featureIdGeocodingParameters]((id *)&self->super.super.isa);
      -[GEOPDFeatureIdGeocodingParameters setLocation:]((uint64_t)v6, 0);
    }
    -[GEOPDPlaceRequestParameters _readLocationDirectedSearchParameters]((uint64_t)self);
    if (self->_locationDirectedSearchParameters)
    {
      uint64_t v7 = -[GEOPDPlaceRequestParameters locationDirectedSearchParameters]((id *)&self->super.super.isa);
      -[GEOPDLocationDirectedSearchParameters setSearchLocation:]((uint64_t)v7, 0);
    }
    -[GEOPDPlaceRequestParameters _readMerchantLookupParameters]((uint64_t)self);
    if (self->_merchantLookupParameters)
    {
      uint64_t v8 = -[GEOPDPlaceRequestParameters merchantLookupParameters]((id *)&self->super.super.isa);
      [v8 setTransactionLocation:0];
    }
    -[GEOPDPlaceRequestParameters _readSearchZeroKeywordCategorySuggestionParameters]((uint64_t)self);
    if (self->_searchZeroKeywordCategorySuggestionParameters)
    {
      objc_super v9 = -[GEOPDPlaceRequestParameters searchZeroKeywordCategorySuggestionParameters]((id *)&self->super.super.isa);
      -[GEOPDSearchZeroKeywordCategorySuggestionParameters setSignificantLocation:]((uint64_t)v9, 0);
    }
    -[GEOPDPlaceRequestParameters _readVendorSpecificPlaceRefinementParameters]((uint64_t)self);
    if (self->_vendorSpecificPlaceRefinementParameters)
    {
      objc_super v10 = -[GEOPDPlaceRequestParameters vendorSpecificPlaceRefinementParameters]((id *)&self->super.super.isa);
      -[GEOPDVendorSpecificPlaceRefinementParameters setLocationHint:]((uint64_t)v10, 0);
    }
    -[GEOPDPlaceRequestParameters _readSearchParameters]((uint64_t)self);
    if (self->_searchParameters)
    {
      -[GEOPDPlaceRequestParameters setSearchParameters:]((uint64_t)self, 0);
    }
  }
}

@end