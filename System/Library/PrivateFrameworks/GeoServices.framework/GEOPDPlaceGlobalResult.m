@interface GEOPDPlaceGlobalResult
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (GEOPDPlaceGlobalResult)init;
- (GEOPDPlaceGlobalResult)initWithData:(id)a3;
- (id)_dictionaryRepresentation:(uint64_t)a1;
- (id)allCollectionsViewResult;
- (id)allGuidesLocationsViewresult;
- (id)autocompleteResult;
- (id)batchPopularNearbySearchResult;
- (id)batchSpatialLookupResult;
- (id)browseCategorySuggestionResult;
- (id)categorySearchResult;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)geocodingResult;
- (id)guidesHomeResult;
- (id)ipGeoLookupResult;
- (id)jsonRepresentation;
- (id)locationDirectedSearchResult;
- (id)mapsHomeResult;
- (id)mapsSearchHomeResult;
- (id)merchantLookupResult;
- (id)popularNearbySearchResult;
- (id)publisherViewResult;
- (id)queryUnderstandingResult;
- (id)searchCapabilitiesResult;
- (id)searchFieldPlaceholderResult;
- (id)searchResult;
- (id)searchZeroKeywordCategorySuggestionResult;
- (unint64_t)hash;
- (void)_initWithDictionary:(unsigned int)a3 isJSON:;
- (void)_readAllCollectionsViewResult;
- (void)_readAllGuidesLocationsViewresult;
- (void)_readAutocompleteResult;
- (void)_readBatchPopularNearbySearchResult;
- (void)_readBatchSpatialLookupResult;
- (void)_readBrowseCategorySuggestionResult;
- (void)_readCategorySearchResult;
- (void)_readCollectionSuggestionResult;
- (void)_readGeocodingResult;
- (void)_readGuidesHomeResult;
- (void)_readIpGeoLookupResult;
- (void)_readLocationDirectedSearchResult;
- (void)_readMapsHomeResult;
- (void)_readMapsSearchHomeResult;
- (void)_readMerchantLookupResult;
- (void)_readPlaceCollectionLookupResult;
- (void)_readPopularNearbySearchResult;
- (void)_readPublisherViewResult;
- (void)_readQueryUnderstandingResult;
- (void)_readSearchCapabilitiesResult;
- (void)_readSearchFieldPlaceholderResult;
- (void)_readSearchResult;
- (void)_readSearchZeroKeywordCategorySuggestionResult;
- (void)clearUnknownFields:(uint64_t)a1;
- (void)mergeFrom:(void *)a1;
- (void)readAll:(uint64_t)a1;
- (void)setAddressObjectGeocodingResult:(uint64_t)a1;
- (void)setAddressRecommendationResult:(uint64_t)a1;
- (void)setAirportEntityPlaceLookupResult:(uint64_t)a1;
- (void)setAllCollectionsViewResult:(uint64_t)a1;
- (void)setAllGuidesLocationsViewresult:(uint64_t)a1;
- (void)setAutocompleteResult:(uint64_t)a1;
- (void)setBatchCategoryLookupResult:(uint64_t)a1;
- (void)setBatchMerchantLookupBrandResult:(uint64_t)a1;
- (void)setBatchPopularNearbySearchResult:(uint64_t)a1;
- (void)setBatchReverseGeocodingResult:(uint64_t)a1;
- (void)setBatchSpatialLookupResult:(uint64_t)a1;
- (void)setBrandLookupResult:(uint64_t)a1;
- (void)setBrowseCategorySuggestionResult:(uint64_t)a1;
- (void)setCanonicalSearchResult:(uint64_t)a1;
- (void)setCategorySearchResult:(uint64_t)a1;
- (void)setChildPlaceLookupByCategoryResult:(uint64_t)a1;
- (void)setCollectionSuggestionResult:(uint64_t)a1;
- (void)setExtendedGeoLookupResult:(uint64_t)a1;
- (void)setExternalTransitLookupResult:(uint64_t)a1;
- (void)setFeatureIdGeocodingResult:(uint64_t)a1;
- (void)setGeocodingResult:(uint64_t)a1;
- (void)setGroundViewLabelResult:(uint64_t)a1;
- (void)setGuidesHomeResult:(uint64_t)a1;
- (void)setIpGeoLookupResult:(uint64_t)a1;
- (void)setLocationDirectedSearchResult:(uint64_t)a1;
- (void)setMapsHomeResult:(uint64_t)a1;
- (void)setMapsIdentifierPlaceLookupResult:(uint64_t)a1;
- (void)setMapsSearchHomeResult:(uint64_t)a1;
- (void)setMerchantLookupResult:(uint64_t)a1;
- (void)setNearbySearchResult:(uint64_t)a1;
- (void)setOfflineRegionNameResult:(uint64_t)a1;
- (void)setPlaceCollectionLookupResult:(uint64_t)a1;
- (void)setPlaceGlobalCommonResult:(uint64_t)a1;
- (void)setPlaceLookupResult:(uint64_t)a1;
- (void)setPlaceRefinementResult:(uint64_t)a1;
- (void)setPlacecardEnrichmentResult:(uint64_t)a1;
- (void)setPoiAtAddressLookupResult:(uint64_t)a1;
- (void)setPopularNearbySearchResult:(uint64_t)a1;
- (void)setPublisherViewResult:(uint64_t)a1;
- (void)setQueryUnderstandingResult:(uint64_t)a1;
- (void)setReverseGeocodingResult:(uint64_t)a1;
- (void)setSearchCapabilitiesResult:(uint64_t)a1;
- (void)setSearchFieldPlaceholderResult:(uint64_t)a1;
- (void)setSearchResult:(uint64_t)a1;
- (void)setSearchZeroKeywordCategorySuggestionResult:(uint64_t)a1;
- (void)setSearchZeroKeywordWithSearchResultsSuggestionResult:(uint64_t)a1;
- (void)setSiriSearchResult:(uint64_t)a1;
- (void)setTerritoryLookupResult:(uint64_t)a1;
- (void)setTransitScheduleLookupResult:(uint64_t)a1;
- (void)setVendorSpecificPlaceRefinementResult:(uint64_t)a1;
- (void)setWifiFingerprintResult:(uint64_t)a1;
- (void)writeTo:(id)a3;
@end

@implementation GEOPDPlaceGlobalResult

- (void)_readCategorySearchResult
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 440));
    if ((*(unsigned char *)(a1 + 445) & 0x80) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOPDPlaceGlobalResultReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readCategorySearchResult_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 440));
  }
}

- (void)_readSearchResult
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 440));
    if ((*(unsigned char *)(a1 + 449) & 0x10) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOPDPlaceGlobalResultReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readSearchResult_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 440));
  }
}

- (id)searchResult
{
  if (a1)
  {
    v2 = a1;
    -[GEOPDPlaceGlobalResult _readSearchResult]((uint64_t)a1);
    a1 = (id *)v2[46];
    uint64_t v1 = vars8;
  }
  return a1;
}

- (void)_readPopularNearbySearchResult
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 440));
    if ((*(unsigned char *)(a1 + 448) & 0x40) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOPDPlaceGlobalResultReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readPopularNearbySearchResult_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 440));
  }
}

- (void)_readMerchantLookupResult
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 440));
    if ((*(unsigned char *)(a1 + 447) & 0x20) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOPDPlaceGlobalResultReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readMerchantLookupResult_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 440));
  }
}

- (void)_readLocationDirectedSearchResult
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 440));
    if ((*(unsigned char *)(a1 + 447) & 2) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOPDPlaceGlobalResultReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readLocationDirectedSearchResult_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 440));
  }
}

- (void)_readGeocodingResult
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 440));
    if ((*(unsigned char *)(a1 + 446) & 0x20) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOPDPlaceGlobalResultReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readGeocodingResult_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 440));
  }
}

- (id)searchFieldPlaceholderResult
{
  if (a1)
  {
    v2 = a1;
    -[GEOPDPlaceGlobalResult _readSearchFieldPlaceholderResult]((uint64_t)a1);
    a1 = (id *)v2[45];
    uint64_t v1 = vars8;
  }
  return a1;
}

- (void)_readSearchFieldPlaceholderResult
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 440));
    if ((*(unsigned char *)(a1 + 449) & 8) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOPDPlaceGlobalResultReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readSearchFieldPlaceholderResult_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 440));
  }
}

- (void)writeTo:(id)a3
{
  id v8 = a3;
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  if (self->_reader && (_GEOPDPlaceGlobalResultIsDirty((uint64_t)self) & 1) == 0)
  {
    v6 = self->_reader;
    objc_sync_enter(v6);
    *(void *)((char *)self->_reader + (int)*MEMORY[0x1E4F940E0]) = self->_readerMarkLength;
    [(PBDataReader *)self->_reader seekToOffset:self->_readerMarkPos];
    v7 = [(PBDataReader *)self->_reader readBytes:self->_readerMarkLength - self->_readerMarkPos];
    [v8 writeData:v7];
    os_unfair_lock_unlock(p_readerLock);

    objc_sync_exit(v6);
  }
  else
  {
    os_unfair_lock_unlock(&self->_readerLock);
    -[GEOPDPlaceGlobalResult readAll:]((uint64_t)self, 0);
    if (self->_searchResult) {
      PBDataWriterWriteSubmessage();
    }
    id v5 = v8;
    if (self->_geocodingResult)
    {
      PBDataWriterWriteSubmessage();
      id v5 = v8;
    }
    if (self->_canonicalSearchResult)
    {
      PBDataWriterWriteSubmessage();
      id v5 = v8;
    }
    if (self->_reverseGeocodingResult)
    {
      PBDataWriterWriteSubmessage();
      id v5 = v8;
    }
    if (self->_placeLookupResult)
    {
      PBDataWriterWriteSubmessage();
      id v5 = v8;
    }
    if (self->_merchantLookupResult)
    {
      PBDataWriterWriteSubmessage();
      id v5 = v8;
    }
    if (self->_placeRefinementResult)
    {
      PBDataWriterWriteSubmessage();
      id v5 = v8;
    }
    if (self->_siriSearchResult)
    {
      PBDataWriterWriteSubmessage();
      id v5 = v8;
    }
    if (self->_locationDirectedSearchResult)
    {
      PBDataWriterWriteSubmessage();
      id v5 = v8;
    }
    if (self->_autocompleteResult)
    {
      PBDataWriterWriteSubmessage();
      id v5 = v8;
    }
    if (self->_browseCategorySuggestionResult)
    {
      PBDataWriterWriteSubmessage();
      id v5 = v8;
    }
    if (self->_categorySearchResult)
    {
      PBDataWriterWriteSubmessage();
      id v5 = v8;
    }
    if (self->_popularNearbySearchResult)
    {
      PBDataWriterWriteSubmessage();
      id v5 = v8;
    }
    if (self->_searchZeroKeywordCategorySuggestionResult)
    {
      PBDataWriterWriteSubmessage();
      id v5 = v8;
    }
    if (self->_searchFieldPlaceholderResult)
    {
      PBDataWriterWriteSubmessage();
      id v5 = v8;
    }
    if (self->_batchPopularNearbySearchResult)
    {
      PBDataWriterWriteSubmessage();
      id v5 = v8;
    }
    if (self->_vendorSpecificPlaceRefinementResult)
    {
      PBDataWriterWriteSubmessage();
      id v5 = v8;
    }
    if (self->_nearbySearchResult)
    {
      PBDataWriterWriteSubmessage();
      id v5 = v8;
    }
    if (self->_addressObjectGeocodingResult)
    {
      PBDataWriterWriteSubmessage();
      id v5 = v8;
    }
    if (self->_searchZeroKeywordWithSearchResultsSuggestionResult)
    {
      PBDataWriterWriteSubmessage();
      id v5 = v8;
    }
    if (self->_externalTransitLookupResult)
    {
      PBDataWriterWriteSubmessage();
      id v5 = v8;
    }
    if (self->_featureIdGeocodingResult)
    {
      PBDataWriterWriteSubmessage();
      id v5 = v8;
    }
    if (self->_mapsIdentifierPlaceLookupResult)
    {
      PBDataWriterWriteSubmessage();
      id v5 = v8;
    }
    if (self->_batchReverseGeocodingResult)
    {
      PBDataWriterWriteSubmessage();
      id v5 = v8;
    }
    if (self->_brandLookupResult)
    {
      PBDataWriterWriteSubmessage();
      id v5 = v8;
    }
    if (self->_wifiFingerprintResult)
    {
      PBDataWriterWriteSubmessage();
      id v5 = v8;
    }
    if (self->_ipGeoLookupResult)
    {
      PBDataWriterWriteSubmessage();
      id v5 = v8;
    }
    if (self->_groundViewLabelResult)
    {
      PBDataWriterWriteSubmessage();
      id v5 = v8;
    }
    if (self->_batchSpatialLookupResult)
    {
      PBDataWriterWriteSubmessage();
      id v5 = v8;
    }
    if (self->_placeGlobalCommonResult)
    {
      PBDataWriterWriteSubmessage();
      id v5 = v8;
    }
    if (self->_placeCollectionLookupResult)
    {
      PBDataWriterWriteSubmessage();
      id v5 = v8;
    }
    if (self->_transitScheduleLookupResult)
    {
      PBDataWriterWriteSubmessage();
      id v5 = v8;
    }
    if (self->_batchCategoryLookupResult)
    {
      PBDataWriterWriteSubmessage();
      id v5 = v8;
    }
    if (self->_batchMerchantLookupBrandResult)
    {
      PBDataWriterWriteSubmessage();
      id v5 = v8;
    }
    if (self->_childPlaceLookupByCategoryResult)
    {
      PBDataWriterWriteSubmessage();
      id v5 = v8;
    }
    if (self->_mapsSearchHomeResult)
    {
      PBDataWriterWriteSubmessage();
      id v5 = v8;
    }
    if (self->_collectionSuggestionResult)
    {
      PBDataWriterWriteSubmessage();
      id v5 = v8;
    }
    if (self->_publisherViewResult)
    {
      PBDataWriterWriteSubmessage();
      id v5 = v8;
    }
    if (self->_allCollectionsViewResult)
    {
      PBDataWriterWriteSubmessage();
      id v5 = v8;
    }
    if (self->_airportEntityPlaceLookupResult)
    {
      PBDataWriterWriteSubmessage();
      id v5 = v8;
    }
    if (self->_territoryLookupResult)
    {
      PBDataWriterWriteSubmessage();
      id v5 = v8;
    }
    if (self->_mapsHomeResult)
    {
      PBDataWriterWriteSubmessage();
      id v5 = v8;
    }
    if (self->_allGuidesLocationsViewresult)
    {
      PBDataWriterWriteSubmessage();
      id v5 = v8;
    }
    if (self->_guidesHomeResult)
    {
      PBDataWriterWriteSubmessage();
      id v5 = v8;
    }
    if (self->_extendedGeoLookupResult)
    {
      PBDataWriterWriteSubmessage();
      id v5 = v8;
    }
    if (self->_queryUnderstandingResult)
    {
      PBDataWriterWriteSubmessage();
      id v5 = v8;
    }
    if (self->_poiAtAddressLookupResult)
    {
      PBDataWriterWriteSubmessage();
      id v5 = v8;
    }
    if (self->_placecardEnrichmentResult)
    {
      PBDataWriterWriteSubmessage();
      id v5 = v8;
    }
    if (self->_offlineRegionNameResult)
    {
      PBDataWriterWriteSubmessage();
      id v5 = v8;
    }
    if (self->_searchCapabilitiesResult)
    {
      PBDataWriterWriteSubmessage();
      id v5 = v8;
    }
    if (self->_addressRecommendationResult)
    {
      PBDataWriterWriteSubmessage();
      id v5 = v8;
    }
    [(PBUnknownFields *)self->_unknownFields writeTo:v5];
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_wifiFingerprintResult, 0);
  objc_storeStrong((id *)&self->_vendorSpecificPlaceRefinementResult, 0);
  objc_storeStrong((id *)&self->_transitScheduleLookupResult, 0);
  objc_storeStrong((id *)&self->_territoryLookupResult, 0);
  objc_storeStrong((id *)&self->_siriSearchResult, 0);
  objc_storeStrong((id *)&self->_searchZeroKeywordWithSearchResultsSuggestionResult, 0);
  objc_storeStrong((id *)&self->_searchZeroKeywordCategorySuggestionResult, 0);
  objc_storeStrong((id *)&self->_searchResult, 0);
  objc_storeStrong((id *)&self->_searchFieldPlaceholderResult, 0);
  objc_storeStrong((id *)&self->_searchCapabilitiesResult, 0);
  objc_storeStrong((id *)&self->_reverseGeocodingResult, 0);
  objc_storeStrong((id *)&self->_queryUnderstandingResult, 0);
  objc_storeStrong((id *)&self->_publisherViewResult, 0);
  objc_storeStrong((id *)&self->_popularNearbySearchResult, 0);
  objc_storeStrong((id *)&self->_poiAtAddressLookupResult, 0);
  objc_storeStrong((id *)&self->_placecardEnrichmentResult, 0);
  objc_storeStrong((id *)&self->_placeRefinementResult, 0);
  objc_storeStrong((id *)&self->_placeLookupResult, 0);
  objc_storeStrong((id *)&self->_placeGlobalCommonResult, 0);
  objc_storeStrong((id *)&self->_placeCollectionLookupResult, 0);
  objc_storeStrong((id *)&self->_offlineRegionNameResult, 0);
  objc_storeStrong((id *)&self->_nearbySearchResult, 0);
  objc_storeStrong((id *)&self->_merchantLookupResult, 0);
  objc_storeStrong((id *)&self->_mapsSearchHomeResult, 0);
  objc_storeStrong((id *)&self->_mapsIdentifierPlaceLookupResult, 0);
  objc_storeStrong((id *)&self->_mapsHomeResult, 0);
  objc_storeStrong((id *)&self->_locationDirectedSearchResult, 0);
  objc_storeStrong((id *)&self->_ipGeoLookupResult, 0);
  objc_storeStrong((id *)&self->_guidesHomeResult, 0);
  objc_storeStrong((id *)&self->_groundViewLabelResult, 0);
  objc_storeStrong((id *)&self->_geocodingResult, 0);
  objc_storeStrong((id *)&self->_featureIdGeocodingResult, 0);
  objc_storeStrong((id *)&self->_externalTransitLookupResult, 0);
  objc_storeStrong((id *)&self->_extendedGeoLookupResult, 0);
  objc_storeStrong((id *)&self->_collectionSuggestionResult, 0);
  objc_storeStrong((id *)&self->_childPlaceLookupByCategoryResult, 0);
  objc_storeStrong((id *)&self->_categorySearchResult, 0);
  objc_storeStrong((id *)&self->_canonicalSearchResult, 0);
  objc_storeStrong((id *)&self->_browseCategorySuggestionResult, 0);
  objc_storeStrong((id *)&self->_brandLookupResult, 0);
  objc_storeStrong((id *)&self->_batchSpatialLookupResult, 0);
  objc_storeStrong((id *)&self->_batchReverseGeocodingResult, 0);
  objc_storeStrong((id *)&self->_batchPopularNearbySearchResult, 0);
  objc_storeStrong((id *)&self->_batchMerchantLookupBrandResult, 0);
  objc_storeStrong((id *)&self->_batchCategoryLookupResult, 0);
  objc_storeStrong((id *)&self->_autocompleteResult, 0);
  objc_storeStrong((id *)&self->_allGuidesLocationsViewresult, 0);
  objc_storeStrong((id *)&self->_allCollectionsViewResult, 0);
  objc_storeStrong((id *)&self->_airportEntityPlaceLookupResult, 0);
  objc_storeStrong((id *)&self->_addressRecommendationResult, 0);
  objc_storeStrong((id *)&self->_addressObjectGeocodingResult, 0);
  objc_storeStrong((id *)&self->_unknownFields, 0);

  objc_storeStrong((id *)&self->_reader, 0);
}

- (void)_readAutocompleteResult
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 440));
    if ((*(unsigned char *)(a1 + 444) & 0x40) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOPDPlaceGlobalResultReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readAutocompleteResult_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 440));
  }
}

- (GEOPDPlaceGlobalResult)init
{
  v6.receiver = self;
  v6.super_class = (Class)GEOPDPlaceGlobalResult;
  v2 = [(GEOPDPlaceGlobalResult *)&v6 init];
  id v3 = v2;
  if (v2)
  {
    v2->_readerLock._os_unfair_lock_opaque = 0;
    v4 = v2;
  }

  return v3;
}

- (id)mapsHomeResult
{
  if (a1)
  {
    v2 = a1;
    -[GEOPDPlaceGlobalResult _readMapsHomeResult]((uint64_t)a1);
    a1 = (id *)v2[28];
    uint64_t v1 = vars8;
  }
  return a1;
}

- (void)_readMapsHomeResult
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 440));
    if ((*(unsigned char *)(a1 + 447) & 4) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOPDPlaceGlobalResultReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readMapsHomeResult_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 440));
  }
}

- (GEOPDPlaceGlobalResult)initWithData:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)GEOPDPlaceGlobalResult;
  id v3 = [(GEOPDPlaceGlobalResult *)&v7 initWithData:a3];
  v4 = v3;
  if (v3)
  {
    v3->_readerLock._os_unfair_lock_opaque = 0;
    id v5 = v3;
  }

  return v4;
}

- (void)setSearchResult:(uint64_t)a1
{
  id v4 = a2;
  *(void *)(a1 + 444) |= 0x10100000000000uLL;
  objc_storeStrong((id *)(a1 + 368), a2);
}

- (id)geocodingResult
{
  if (a1)
  {
    v2 = a1;
    -[GEOPDPlaceGlobalResult _readGeocodingResult]((uint64_t)a1);
    a1 = (id *)v2[23];
    uint64_t v1 = vars8;
  }
  return a1;
}

- (void)setGeocodingResult:(uint64_t)a1
{
  id v4 = a2;
  *(void *)(a1 + 444) |= 0x10000000200000uLL;
  objc_storeStrong((id *)(a1 + 184), a2);
}

- (void)setCanonicalSearchResult:(uint64_t)a1
{
  id v4 = a2;
  *(void *)(a1 + 444) |= 0x10000000004000uLL;
  objc_storeStrong((id *)(a1 + 128), a2);
}

- (void)setReverseGeocodingResult:(uint64_t)a1
{
  id v4 = a2;
  *(void *)(a1 + 444) |= 0x10020000000000uLL;
  objc_storeStrong((id *)(a1 + 344), a2);
}

- (void)setPlaceLookupResult:(uint64_t)a1
{
  id v4 = a2;
  *(void *)(a1 + 444) |= 0x10000400000000uLL;
  objc_storeStrong((id *)(a1 + 288), a2);
}

- (id)merchantLookupResult
{
  if (a1)
  {
    v2 = a1;
    -[GEOPDPlaceGlobalResult _readMerchantLookupResult]((uint64_t)a1);
    a1 = (id *)v2[31];
    uint64_t v1 = vars8;
  }
  return a1;
}

- (void)setMerchantLookupResult:(uint64_t)a1
{
  id v4 = a2;
  *(void *)(a1 + 444) |= 0x10000020000000uLL;
  objc_storeStrong((id *)(a1 + 248), a2);
}

- (void)setPlaceRefinementResult:(uint64_t)a1
{
  id v4 = a2;
  *(void *)(a1 + 444) |= 0x10000800000000uLL;
  objc_storeStrong((id *)(a1 + 296), a2);
}

- (void)setSiriSearchResult:(uint64_t)a1
{
  id v4 = a2;
  *(void *)(a1 + 444) |= 0x10800000000000uLL;
  objc_storeStrong((id *)(a1 + 392), a2);
}

- (id)locationDirectedSearchResult
{
  if (a1)
  {
    v2 = a1;
    -[GEOPDPlaceGlobalResult _readLocationDirectedSearchResult]((uint64_t)a1);
    a1 = (id *)v2[27];
    uint64_t v1 = vars8;
  }
  return a1;
}

- (void)setLocationDirectedSearchResult:(uint64_t)a1
{
  id v4 = a2;
  *(void *)(a1 + 444) |= 0x10000002000000uLL;
  objc_storeStrong((id *)(a1 + 216), a2);
}

- (id)autocompleteResult
{
  if (a1)
  {
    v2 = a1;
    -[GEOPDPlaceGlobalResult _readAutocompleteResult]((uint64_t)a1);
    a1 = (id *)v2[8];
    uint64_t v1 = vars8;
  }
  return a1;
}

- (void)setAutocompleteResult:(uint64_t)a1
{
  id v4 = a2;
  if (a1)
  {
    *(void *)(a1 + 444) |= 0x10000000000040uLL;
    objc_storeStrong((id *)(a1 + 64), a2);
  }
}

- (void)_readBrowseCategorySuggestionResult
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 440));
    if ((*(unsigned char *)(a1 + 445) & 0x20) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOPDPlaceGlobalResultReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readBrowseCategorySuggestionResult_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 440));
  }
}

- (id)browseCategorySuggestionResult
{
  if (a1)
  {
    v2 = a1;
    -[GEOPDPlaceGlobalResult _readBrowseCategorySuggestionResult]((uint64_t)a1);
    a1 = (id *)v2[15];
    uint64_t v1 = vars8;
  }
  return a1;
}

- (void)setBrowseCategorySuggestionResult:(uint64_t)a1
{
  id v4 = a2;
  *(void *)(a1 + 444) |= 0x10000000002000uLL;
  objc_storeStrong((id *)(a1 + 120), a2);
}

- (id)categorySearchResult
{
  if (a1)
  {
    v2 = a1;
    -[GEOPDPlaceGlobalResult _readCategorySearchResult]((uint64_t)a1);
    a1 = (id *)v2[17];
    uint64_t v1 = vars8;
  }
  return a1;
}

- (void)setCategorySearchResult:(uint64_t)a1
{
  id v4 = a2;
  *(void *)(a1 + 444) |= 0x10000000008000uLL;
  objc_storeStrong((id *)(a1 + 136), a2);
}

- (id)popularNearbySearchResult
{
  if (a1)
  {
    v2 = a1;
    -[GEOPDPlaceGlobalResult _readPopularNearbySearchResult]((uint64_t)a1);
    a1 = (id *)v2[40];
    uint64_t v1 = vars8;
  }
  return a1;
}

- (void)setPopularNearbySearchResult:(uint64_t)a1
{
  id v4 = a2;
  *(void *)(a1 + 444) |= 0x10004000000000uLL;
  objc_storeStrong((id *)(a1 + 320), a2);
}

- (void)_readSearchZeroKeywordCategorySuggestionResult
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 440));
    if ((*(unsigned char *)(a1 + 449) & 0x20) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOPDPlaceGlobalResultReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readSearchZeroKeywordCategorySuggestionResult_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 440));
  }
}

- (id)searchZeroKeywordCategorySuggestionResult
{
  if (a1)
  {
    v2 = a1;
    -[GEOPDPlaceGlobalResult _readSearchZeroKeywordCategorySuggestionResult]((uint64_t)a1);
    a1 = (id *)v2[47];
    uint64_t v1 = vars8;
  }
  return a1;
}

- (void)setSearchZeroKeywordCategorySuggestionResult:(uint64_t)a1
{
  id v4 = a2;
  *(void *)(a1 + 444) |= 0x10200000000000uLL;
  objc_storeStrong((id *)(a1 + 376), a2);
}

- (void)setSearchFieldPlaceholderResult:(uint64_t)a1
{
  id v4 = a2;
  *(void *)(a1 + 444) |= 0x10080000000000uLL;
  objc_storeStrong((id *)(a1 + 360), a2);
}

- (void)_readBatchPopularNearbySearchResult
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 440));
    if ((*(unsigned char *)(a1 + 445) & 2) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOPDPlaceGlobalResultReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readBatchPopularNearbySearchResult_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 440));
  }
}

- (id)batchPopularNearbySearchResult
{
  if (a1)
  {
    v2 = a1;
    -[GEOPDPlaceGlobalResult _readBatchPopularNearbySearchResult]((uint64_t)a1);
    a1 = (id *)v2[11];
    uint64_t v1 = vars8;
  }
  return a1;
}

- (void)setBatchPopularNearbySearchResult:(uint64_t)a1
{
  id v4 = a2;
  *(void *)(a1 + 444) |= 0x10000000000200uLL;
  objc_storeStrong((id *)(a1 + 88), a2);
}

- (void)setVendorSpecificPlaceRefinementResult:(uint64_t)a1
{
  id v4 = a2;
  *(void *)(a1 + 444) |= 0x14000000000000uLL;
  objc_storeStrong((id *)(a1 + 416), a2);
}

- (void)setNearbySearchResult:(uint64_t)a1
{
  id v4 = a2;
  *(void *)(a1 + 444) |= 0x10000040000000uLL;
  objc_storeStrong((id *)(a1 + 256), a2);
}

- (void)setAddressObjectGeocodingResult:(uint64_t)a1
{
  id v4 = a2;
  *(void *)(a1 + 444) |= 0x10000000000002uLL;
  objc_storeStrong((id *)(a1 + 24), a2);
}

- (void)setSearchZeroKeywordWithSearchResultsSuggestionResult:(uint64_t)a1
{
  id v4 = a2;
  *(void *)(a1 + 444) |= 0x10400000000000uLL;
  objc_storeStrong((id *)(a1 + 384), a2);
}

- (void)setExternalTransitLookupResult:(uint64_t)a1
{
  id v4 = a2;
  *(void *)(a1 + 444) |= 0x10000000080000uLL;
  objc_storeStrong((id *)(a1 + 168), a2);
}

- (void)setFeatureIdGeocodingResult:(uint64_t)a1
{
  id v4 = a2;
  *(void *)(a1 + 444) |= 0x10000000100000uLL;
  objc_storeStrong((id *)(a1 + 176), a2);
}

- (void)setMapsIdentifierPlaceLookupResult:(uint64_t)a1
{
  id v4 = a2;
  *(void *)(a1 + 444) |= 0x10000008000000uLL;
  objc_storeStrong((id *)(a1 + 232), a2);
}

- (void)setBatchReverseGeocodingResult:(uint64_t)a1
{
  id v4 = a2;
  *(void *)(a1 + 444) |= 0x10000000000400uLL;
  objc_storeStrong((id *)(a1 + 96), a2);
}

- (void)setBrandLookupResult:(uint64_t)a1
{
  id v4 = a2;
  *(void *)(a1 + 444) |= 0x10000000001000uLL;
  objc_storeStrong((id *)(a1 + 112), a2);
}

- (void)setWifiFingerprintResult:(uint64_t)a1
{
  id v4 = a2;
  *(void *)(a1 + 444) |= 0x18000000000000uLL;
  objc_storeStrong((id *)(a1 + 424), a2);
}

- (void)_readIpGeoLookupResult
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 440));
    if ((*(unsigned char *)(a1 + 447) & 1) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOPDPlaceGlobalResultReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readIpGeoLookupResult_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 440));
  }
}

- (id)ipGeoLookupResult
{
  if (a1)
  {
    v2 = a1;
    -[GEOPDPlaceGlobalResult _readIpGeoLookupResult]((uint64_t)a1);
    a1 = (id *)v2[26];
    uint64_t v1 = vars8;
  }
  return a1;
}

- (void)setIpGeoLookupResult:(uint64_t)a1
{
  id v4 = a2;
  *(void *)(a1 + 444) |= 0x10000001000000uLL;
  objc_storeStrong((id *)(a1 + 208), a2);
}

- (void)setGroundViewLabelResult:(uint64_t)a1
{
  id v4 = a2;
  *(void *)(a1 + 444) |= 0x10000000400000uLL;
  objc_storeStrong((id *)(a1 + 192), a2);
}

- (void)_readBatchSpatialLookupResult
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 440));
    if ((*(unsigned char *)(a1 + 445) & 8) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOPDPlaceGlobalResultReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readBatchSpatialLookupResult_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 440));
  }
}

- (id)batchSpatialLookupResult
{
  if (a1)
  {
    v2 = a1;
    -[GEOPDPlaceGlobalResult _readBatchSpatialLookupResult]((uint64_t)a1);
    a1 = (id *)v2[13];
    uint64_t v1 = vars8;
  }
  return a1;
}

- (void)setBatchSpatialLookupResult:(uint64_t)a1
{
  id v4 = a2;
  *(void *)(a1 + 444) |= 0x10000000000800uLL;
  objc_storeStrong((id *)(a1 + 104), a2);
}

- (void)setPlaceGlobalCommonResult:(uint64_t)a1
{
  id v4 = a2;
  *(void *)(a1 + 444) |= 0x10000200000000uLL;
  objc_storeStrong((id *)(a1 + 280), a2);
}

- (void)_readPlaceCollectionLookupResult
{
  os_unfair_lock_lock((os_unfair_lock_t)(a1 + 440));
  if ((*(unsigned char *)(a1 + 448) & 1) == 0)
  {
    v2 = *(void **)(a1 + 8);
    if (v2)
    {
      id v3 = v2;
      objc_sync_enter(v3);
      GEOPDPlaceGlobalResultReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readPlaceCollectionLookupResult_tags);
      objc_sync_exit(v3);
    }
  }

  os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 440));
}

- (void)setPlaceCollectionLookupResult:(uint64_t)a1
{
  id v4 = a2;
  *(void *)(a1 + 444) |= 0x10000100000000uLL;
  objc_storeStrong((id *)(a1 + 272), a2);
}

- (void)setTransitScheduleLookupResult:(uint64_t)a1
{
  id v4 = a2;
  *(void *)(a1 + 444) |= 0x12000000000000uLL;
  objc_storeStrong((id *)(a1 + 408), a2);
}

- (void)setBatchCategoryLookupResult:(uint64_t)a1
{
  id v4 = a2;
  *(void *)(a1 + 444) |= 0x10000000000080uLL;
  objc_storeStrong((id *)(a1 + 72), a2);
}

- (void)setBatchMerchantLookupBrandResult:(uint64_t)a1
{
  id v4 = a2;
  *(void *)(a1 + 444) |= 0x10000000000100uLL;
  objc_storeStrong((id *)(a1 + 80), a2);
}

- (void)setChildPlaceLookupByCategoryResult:(uint64_t)a1
{
  id v4 = a2;
  *(void *)(a1 + 444) |= 0x10000000010000uLL;
  objc_storeStrong((id *)(a1 + 144), a2);
}

- (void)_readMapsSearchHomeResult
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 440));
    if ((*(unsigned char *)(a1 + 447) & 0x10) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOPDPlaceGlobalResultReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readMapsSearchHomeResult_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 440));
  }
}

- (id)mapsSearchHomeResult
{
  if (a1)
  {
    v2 = a1;
    -[GEOPDPlaceGlobalResult _readMapsSearchHomeResult]((uint64_t)a1);
    a1 = (id *)v2[30];
    uint64_t v1 = vars8;
  }
  return a1;
}

- (void)setMapsSearchHomeResult:(uint64_t)a1
{
  id v4 = a2;
  *(void *)(a1 + 444) |= 0x10000010000000uLL;
  objc_storeStrong((id *)(a1 + 240), a2);
}

- (void)_readCollectionSuggestionResult
{
  os_unfair_lock_lock((os_unfair_lock_t)(a1 + 440));
  if ((*(unsigned char *)(a1 + 446) & 2) == 0)
  {
    v2 = *(void **)(a1 + 8);
    if (v2)
    {
      id v3 = v2;
      objc_sync_enter(v3);
      GEOPDPlaceGlobalResultReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readCollectionSuggestionResult_tags_4626);
      objc_sync_exit(v3);
    }
  }

  os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 440));
}

- (void)setCollectionSuggestionResult:(uint64_t)a1
{
  id v4 = a2;
  *(void *)(a1 + 444) |= 0x10000000020000uLL;
  objc_storeStrong((id *)(a1 + 152), a2);
}

- (void)_readPublisherViewResult
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 440));
    if ((*(unsigned char *)(a1 + 448) & 0x80) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOPDPlaceGlobalResultReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readPublisherViewResult_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 440));
  }
}

- (id)publisherViewResult
{
  if (a1)
  {
    v2 = a1;
    -[GEOPDPlaceGlobalResult _readPublisherViewResult]((uint64_t)a1);
    a1 = (id *)v2[41];
    uint64_t v1 = vars8;
  }
  return a1;
}

- (void)setPublisherViewResult:(uint64_t)a1
{
  id v4 = a2;
  *(void *)(a1 + 444) |= 0x10008000000000uLL;
  objc_storeStrong((id *)(a1 + 328), a2);
}

- (void)_readAllCollectionsViewResult
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 440));
    if ((*(unsigned char *)(a1 + 444) & 0x10) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOPDPlaceGlobalResultReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readAllCollectionsViewResult_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 440));
  }
}

- (id)allCollectionsViewResult
{
  if (a1)
  {
    v2 = a1;
    -[GEOPDPlaceGlobalResult _readAllCollectionsViewResult]((uint64_t)a1);
    a1 = (id *)v2[6];
    uint64_t v1 = vars8;
  }
  return a1;
}

- (void)setAllCollectionsViewResult:(uint64_t)a1
{
  id v4 = a2;
  *(void *)(a1 + 444) |= 0x10000000000010uLL;
  objc_storeStrong((id *)(a1 + 48), a2);
}

- (void)setAirportEntityPlaceLookupResult:(uint64_t)a1
{
  id v4 = a2;
  *(void *)(a1 + 444) |= 0x10000000000008uLL;
  objc_storeStrong((id *)(a1 + 40), a2);
}

- (void)setTerritoryLookupResult:(uint64_t)a1
{
  id v4 = a2;
  *(void *)(a1 + 444) |= 0x11000000000000uLL;
  objc_storeStrong((id *)(a1 + 400), a2);
}

- (void)setMapsHomeResult:(uint64_t)a1
{
  id v4 = a2;
  *(void *)(a1 + 444) |= 0x10000004000000uLL;
  objc_storeStrong((id *)(a1 + 224), a2);
}

- (void)_readAllGuidesLocationsViewresult
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 440));
    if ((*(unsigned char *)(a1 + 444) & 0x20) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOPDPlaceGlobalResultReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readAllGuidesLocationsViewresult_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 440));
  }
}

- (id)allGuidesLocationsViewresult
{
  if (a1)
  {
    v2 = a1;
    -[GEOPDPlaceGlobalResult _readAllGuidesLocationsViewresult]((uint64_t)a1);
    a1 = (id *)v2[7];
    uint64_t v1 = vars8;
  }
  return a1;
}

- (void)setAllGuidesLocationsViewresult:(uint64_t)a1
{
  id v4 = a2;
  *(void *)(a1 + 444) |= 0x10000000000020uLL;
  objc_storeStrong((id *)(a1 + 56), a2);
}

- (void)_readGuidesHomeResult
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 440));
    if ((*(unsigned char *)(a1 + 446) & 0x80) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOPDPlaceGlobalResultReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readGuidesHomeResult_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 440));
  }
}

- (id)guidesHomeResult
{
  if (a1)
  {
    v2 = a1;
    -[GEOPDPlaceGlobalResult _readGuidesHomeResult]((uint64_t)a1);
    a1 = (id *)v2[25];
    uint64_t v1 = vars8;
  }
  return a1;
}

- (void)setGuidesHomeResult:(uint64_t)a1
{
  id v4 = a2;
  *(void *)(a1 + 444) |= 0x10000000800000uLL;
  objc_storeStrong((id *)(a1 + 200), a2);
}

- (void)setExtendedGeoLookupResult:(uint64_t)a1
{
  id v4 = a2;
  *(void *)(a1 + 444) |= 0x10000000040000uLL;
  objc_storeStrong((id *)(a1 + 160), a2);
}

- (void)_readQueryUnderstandingResult
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 440));
    if ((*(unsigned char *)(a1 + 449) & 1) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOPDPlaceGlobalResultReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readQueryUnderstandingResult_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 440));
  }
}

- (id)queryUnderstandingResult
{
  if (a1)
  {
    v2 = a1;
    -[GEOPDPlaceGlobalResult _readQueryUnderstandingResult]((uint64_t)a1);
    a1 = (id *)v2[42];
    uint64_t v1 = vars8;
  }
  return a1;
}

- (void)setQueryUnderstandingResult:(uint64_t)a1
{
  id v4 = a2;
  if (a1)
  {
    *(void *)(a1 + 444) |= 0x10010000000000uLL;
    objc_storeStrong((id *)(a1 + 336), a2);
  }
}

- (void)setPoiAtAddressLookupResult:(uint64_t)a1
{
  id v4 = a2;
  *(void *)(a1 + 444) |= 0x10002000000000uLL;
  objc_storeStrong((id *)(a1 + 312), a2);
}

- (void)setPlacecardEnrichmentResult:(uint64_t)a1
{
  id v4 = a2;
  *(void *)(a1 + 444) |= 0x10001000000000uLL;
  objc_storeStrong((id *)(a1 + 304), a2);
}

- (void)setOfflineRegionNameResult:(uint64_t)a1
{
  id v4 = a2;
  *(void *)(a1 + 444) |= 0x10000080000000uLL;
  objc_storeStrong((id *)(a1 + 264), a2);
}

- (void)_readSearchCapabilitiesResult
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 440));
    if ((*(unsigned char *)(a1 + 449) & 4) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOPDPlaceGlobalResultReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readSearchCapabilitiesResult_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 440));
  }
}

- (id)searchCapabilitiesResult
{
  if (a1)
  {
    v2 = a1;
    -[GEOPDPlaceGlobalResult _readSearchCapabilitiesResult]((uint64_t)a1);
    a1 = (id *)v2[44];
    uint64_t v1 = vars8;
  }
  return a1;
}

- (void)setSearchCapabilitiesResult:(uint64_t)a1
{
  id v4 = a2;
  *(void *)(a1 + 444) |= 0x10040000000000uLL;
  objc_storeStrong((id *)(a1 + 352), a2);
}

- (void)setAddressRecommendationResult:(uint64_t)a1
{
  id v4 = a2;
  *(void *)(a1 + 444) |= 0x10000000000004uLL;
  objc_storeStrong((id *)(a1 + 32), a2);
}

- (id)description
{
  id v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)GEOPDPlaceGlobalResult;
  id v4 = [(GEOPDPlaceGlobalResult *)&v8 description];
  id v5 = [(GEOPDPlaceGlobalResult *)self dictionaryRepresentation];
  objc_super v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEOPDPlaceGlobalResult _dictionaryRepresentation:]((uint64_t)self, 0);
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  if (a1)
  {
    -[GEOPDPlaceGlobalResult readAll:](a1, 1);
    id v4 = [MEMORY[0x1E4F1CA60] dictionary];
    id v5 = -[GEOPDPlaceGlobalResult searchResult]((id *)a1);
    objc_super v6 = v5;
    if (v5)
    {
      if (a2)
      {
        objc_super v7 = [v5 jsonRepresentation];
        objc_super v8 = @"searchResult";
      }
      else
      {
        objc_super v7 = [v5 dictionaryRepresentation];
        objc_super v8 = @"search_result";
      }
      id v9 = v7;

      [v4 setObject:v9 forKey:v8];
    }

    v10 = -[GEOPDPlaceGlobalResult geocodingResult]((id *)a1);
    v11 = v10;
    if (v10)
    {
      if (a2)
      {
        v12 = [v10 jsonRepresentation];
        v13 = @"geocodingResult";
      }
      else
      {
        v12 = [v10 dictionaryRepresentation];
        v13 = @"geocoding_result";
      }
      id v14 = v12;

      [v4 setObject:v14 forKey:v13];
    }

    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 440));
    if ((*(unsigned char *)(a1 + 445) & 0x40) == 0)
    {
      v15 = *(void **)(a1 + 8);
      if (v15)
      {
        id v16 = v15;
        objc_sync_enter(v16);
        GEOPDPlaceGlobalResultReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readCanonicalSearchResult_tags);
        objc_sync_exit(v16);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 440));
    id v17 = *(id *)(a1 + 128);
    v18 = v17;
    if (v17)
    {
      if (a2)
      {
        v19 = [v17 jsonRepresentation];
        v20 = @"canonicalSearchResult";
      }
      else
      {
        v19 = [v17 dictionaryRepresentation];
        v20 = @"canonical_search_result";
      }
      id v21 = v19;

      [v4 setObject:v21 forKey:v20];
    }

    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 440));
    if ((*(unsigned char *)(a1 + 449) & 2) == 0)
    {
      v22 = *(void **)(a1 + 8);
      if (v22)
      {
        id v23 = v22;
        objc_sync_enter(v23);
        GEOPDPlaceGlobalResultReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readReverseGeocodingResult_tags);
        objc_sync_exit(v23);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 440));
    id v24 = *(id *)(a1 + 344);
    v25 = v24;
    if (v24)
    {
      if (a2)
      {
        v26 = [v24 jsonRepresentation];
        v27 = @"reverseGeocodingResult";
      }
      else
      {
        v26 = [v24 dictionaryRepresentation];
        v27 = @"reverse_geocoding_result";
      }
      id v28 = v26;

      [v4 setObject:v28 forKey:v27];
    }

    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 440));
    if ((*(unsigned char *)(a1 + 448) & 4) == 0)
    {
      v29 = *(void **)(a1 + 8);
      if (v29)
      {
        id v30 = v29;
        objc_sync_enter(v30);
        GEOPDPlaceGlobalResultReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readPlaceLookupResult_tags);
        objc_sync_exit(v30);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 440));
    id v31 = *(id *)(a1 + 288);
    v32 = v31;
    if (v31)
    {
      if (a2)
      {
        v33 = [v31 jsonRepresentation];
        v34 = @"placeLookupResult";
      }
      else
      {
        v33 = [v31 dictionaryRepresentation];
        v34 = @"place_lookup_result";
      }
      id v35 = v33;

      [v4 setObject:v35 forKey:v34];
    }

    v36 = -[GEOPDPlaceGlobalResult merchantLookupResult]((id *)a1);
    v37 = v36;
    if (v36)
    {
      if (a2)
      {
        v38 = [v36 jsonRepresentation];
        v39 = @"merchantLookupResult";
      }
      else
      {
        v38 = [v36 dictionaryRepresentation];
        v39 = @"merchant_lookup_result";
      }
      id v40 = v38;

      [v4 setObject:v40 forKey:v39];
    }

    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 440));
    if ((*(unsigned char *)(a1 + 448) & 8) == 0)
    {
      v41 = *(void **)(a1 + 8);
      if (v41)
      {
        id v42 = v41;
        objc_sync_enter(v42);
        GEOPDPlaceGlobalResultReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readPlaceRefinementResult_tags);
        objc_sync_exit(v42);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 440));
    id v43 = *(id *)(a1 + 296);
    v44 = v43;
    if (v43)
    {
      if (a2)
      {
        v45 = [v43 jsonRepresentation];
        v46 = @"placeRefinementResult";
      }
      else
      {
        v45 = [v43 dictionaryRepresentation];
        v46 = @"place_refinement_result";
      }
      id v47 = v45;

      [v4 setObject:v47 forKey:v46];
    }

    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 440));
    if ((*(unsigned char *)(a1 + 449) & 0x80) == 0)
    {
      v48 = *(void **)(a1 + 8);
      if (v48)
      {
        id v49 = v48;
        objc_sync_enter(v49);
        GEOPDPlaceGlobalResultReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readSiriSearchResult_tags);
        objc_sync_exit(v49);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 440));
    id v50 = *(id *)(a1 + 392);
    v51 = v50;
    if (v50)
    {
      if (a2)
      {
        v52 = [v50 jsonRepresentation];
        v53 = @"siriSearchResult";
      }
      else
      {
        v52 = [v50 dictionaryRepresentation];
        v53 = @"siri_search_result";
      }
      id v54 = v52;

      [v4 setObject:v54 forKey:v53];
    }

    v55 = -[GEOPDPlaceGlobalResult locationDirectedSearchResult]((id *)a1);
    v56 = v55;
    if (v55)
    {
      if (a2)
      {
        v57 = [v55 jsonRepresentation];
        v58 = @"locationDirectedSearchResult";
      }
      else
      {
        v57 = [v55 dictionaryRepresentation];
        v58 = @"location_directed_search_result";
      }
      id v59 = v57;

      [v4 setObject:v59 forKey:v58];
    }

    v60 = -[GEOPDPlaceGlobalResult autocompleteResult]((id *)a1);
    v61 = v60;
    if (v60)
    {
      if (a2)
      {
        v62 = [v60 jsonRepresentation];
        v63 = @"autocompleteResult";
      }
      else
      {
        v62 = [v60 dictionaryRepresentation];
        v63 = @"autocomplete_result";
      }
      id v64 = v62;

      [v4 setObject:v64 forKey:v63];
    }

    v65 = -[GEOPDPlaceGlobalResult browseCategorySuggestionResult]((id *)a1);
    v66 = v65;
    if (v65)
    {
      if (a2)
      {
        v67 = [v65 jsonRepresentation];
        v68 = @"browseCategorySuggestionResult";
      }
      else
      {
        v67 = [v65 dictionaryRepresentation];
        v68 = @"browse_category_suggestion_result";
      }
      id v69 = v67;

      [v4 setObject:v69 forKey:v68];
    }

    v70 = -[GEOPDPlaceGlobalResult categorySearchResult]((id *)a1);
    v71 = v70;
    if (v70)
    {
      if (a2)
      {
        v72 = [v70 jsonRepresentation];
        v73 = @"categorySearchResult";
      }
      else
      {
        v72 = [v70 dictionaryRepresentation];
        v73 = @"category_search_result";
      }
      id v74 = v72;

      [v4 setObject:v74 forKey:v73];
    }

    v75 = -[GEOPDPlaceGlobalResult popularNearbySearchResult]((id *)a1);
    v76 = v75;
    if (v75)
    {
      if (a2)
      {
        v77 = [v75 jsonRepresentation];
        v78 = @"popularNearbySearchResult";
      }
      else
      {
        v77 = [v75 dictionaryRepresentation];
        v78 = @"popular_nearby_search_result";
      }
      id v79 = v77;

      [v4 setObject:v79 forKey:v78];
    }

    v80 = -[GEOPDPlaceGlobalResult searchZeroKeywordCategorySuggestionResult]((id *)a1);
    v81 = v80;
    if (v80)
    {
      if (a2)
      {
        v82 = [v80 jsonRepresentation];
        v83 = @"searchZeroKeywordCategorySuggestionResult";
      }
      else
      {
        v82 = [v80 dictionaryRepresentation];
        v83 = @"search_zero_keyword_category_suggestion_result";
      }
      id v84 = v82;

      [v4 setObject:v84 forKey:v83];
    }

    v85 = -[GEOPDPlaceGlobalResult searchFieldPlaceholderResult]((id *)a1);
    v86 = v85;
    if (v85)
    {
      if (a2)
      {
        v87 = [v85 jsonRepresentation];
        v88 = @"searchFieldPlaceholderResult";
      }
      else
      {
        v87 = [v85 dictionaryRepresentation];
        v88 = @"search_field_placeholder_result";
      }
      id v89 = v87;

      [v4 setObject:v89 forKey:v88];
    }

    v90 = -[GEOPDPlaceGlobalResult batchPopularNearbySearchResult]((id *)a1);
    v91 = v90;
    if (v90)
    {
      if (a2)
      {
        v92 = [v90 jsonRepresentation];
        v93 = @"batchPopularNearbySearchResult";
      }
      else
      {
        v92 = [v90 dictionaryRepresentation];
        v93 = @"batch_popular_nearby_search_result";
      }
      id v94 = v92;

      [v4 setObject:v94 forKey:v93];
    }

    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 440));
    if ((*(unsigned char *)(a1 + 450) & 4) == 0)
    {
      v95 = *(void **)(a1 + 8);
      if (v95)
      {
        id v96 = v95;
        objc_sync_enter(v96);
        GEOPDPlaceGlobalResultReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readVendorSpecificPlaceRefinementResult_tags);
        objc_sync_exit(v96);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 440));
    id v97 = *(id *)(a1 + 416);
    v98 = v97;
    if (v97)
    {
      if (a2)
      {
        v99 = [v97 jsonRepresentation];
        v100 = @"vendorSpecificPlaceRefinementResult";
      }
      else
      {
        v99 = [v97 dictionaryRepresentation];
        v100 = @"vendor_specific_place_refinement_result";
      }
      id v101 = v99;

      [v4 setObject:v101 forKey:v100];
    }

    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 440));
    if ((*(unsigned char *)(a1 + 447) & 0x40) == 0)
    {
      v102 = *(void **)(a1 + 8);
      if (v102)
      {
        id v103 = v102;
        objc_sync_enter(v103);
        GEOPDPlaceGlobalResultReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readNearbySearchResult_tags);
        objc_sync_exit(v103);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 440));
    id v104 = *(id *)(a1 + 256);
    v105 = v104;
    if (v104)
    {
      if (a2)
      {
        v106 = [v104 jsonRepresentation];
        v107 = @"nearbySearchResult";
      }
      else
      {
        v106 = [v104 dictionaryRepresentation];
        v107 = @"nearby_search_result";
      }
      id v108 = v106;

      [v4 setObject:v108 forKey:v107];
    }

    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 440));
    if ((*(unsigned char *)(a1 + 444) & 2) == 0)
    {
      v109 = *(void **)(a1 + 8);
      if (v109)
      {
        id v110 = v109;
        objc_sync_enter(v110);
        GEOPDPlaceGlobalResultReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readAddressObjectGeocodingResult_tags);
        objc_sync_exit(v110);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 440));
    id v111 = *(id *)(a1 + 24);
    v112 = v111;
    if (v111)
    {
      if (a2)
      {
        v113 = [v111 jsonRepresentation];
        v114 = @"addressObjectGeocodingResult";
      }
      else
      {
        v113 = [v111 dictionaryRepresentation];
        v114 = @"address_object_geocoding_result";
      }
      id v115 = v113;

      [v4 setObject:v115 forKey:v114];
    }

    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 440));
    if ((*(unsigned char *)(a1 + 449) & 0x40) == 0)
    {
      v116 = *(void **)(a1 + 8);
      if (v116)
      {
        id v117 = v116;
        objc_sync_enter(v117);
        GEOPDPlaceGlobalResultReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readSearchZeroKeywordWithSearchResultsSuggestionResult_tags);
        objc_sync_exit(v117);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 440));
    id v118 = *(id *)(a1 + 384);
    v119 = v118;
    if (v118)
    {
      if (a2)
      {
        v120 = [v118 jsonRepresentation];
        v121 = @"searchZeroKeywordWithSearchResultsSuggestionResult";
      }
      else
      {
        v120 = [v118 dictionaryRepresentation];
        v121 = @"search_zero_keyword_with_search_results_suggestion_result";
      }
      id v122 = v120;

      [v4 setObject:v122 forKey:v121];
    }

    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 440));
    if ((*(unsigned char *)(a1 + 446) & 8) == 0)
    {
      v123 = *(void **)(a1 + 8);
      if (v123)
      {
        id v124 = v123;
        objc_sync_enter(v124);
        GEOPDPlaceGlobalResultReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readExternalTransitLookupResult_tags);
        objc_sync_exit(v124);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 440));
    id v125 = *(id *)(a1 + 168);
    v126 = v125;
    if (v125)
    {
      if (a2)
      {
        v127 = [v125 jsonRepresentation];
        v128 = @"externalTransitLookupResult";
      }
      else
      {
        v127 = [v125 dictionaryRepresentation];
        v128 = @"external_transit_lookup_result";
      }
      id v129 = v127;

      [v4 setObject:v129 forKey:v128];
    }

    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 440));
    if ((*(unsigned char *)(a1 + 446) & 0x10) == 0)
    {
      v130 = *(void **)(a1 + 8);
      if (v130)
      {
        id v131 = v130;
        objc_sync_enter(v131);
        GEOPDPlaceGlobalResultReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readFeatureIdGeocodingResult_tags);
        objc_sync_exit(v131);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 440));
    id v132 = *(id *)(a1 + 176);
    v133 = v132;
    if (v132)
    {
      if (a2)
      {
        v134 = [v132 jsonRepresentation];
        v135 = @"featureIdGeocodingResult";
      }
      else
      {
        v134 = [v132 dictionaryRepresentation];
        v135 = @"feature_id_geocoding_result";
      }
      id v136 = v134;

      [v4 setObject:v136 forKey:v135];
    }

    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 440));
    if ((*(unsigned char *)(a1 + 447) & 8) == 0)
    {
      v137 = *(void **)(a1 + 8);
      if (v137)
      {
        id v138 = v137;
        objc_sync_enter(v138);
        GEOPDPlaceGlobalResultReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readMapsIdentifierPlaceLookupResult_tags);
        objc_sync_exit(v138);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 440));
    id v139 = *(id *)(a1 + 232);
    v140 = v139;
    if (v139)
    {
      if (a2)
      {
        v141 = [v139 jsonRepresentation];
        v142 = @"mapsIdentifierPlaceLookupResult";
      }
      else
      {
        v141 = [v139 dictionaryRepresentation];
        v142 = @"maps_identifier_place_lookup_result";
      }
      id v143 = v141;

      [v4 setObject:v143 forKey:v142];
    }

    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 440));
    if ((*(unsigned char *)(a1 + 445) & 4) == 0)
    {
      v144 = *(void **)(a1 + 8);
      if (v144)
      {
        id v145 = v144;
        objc_sync_enter(v145);
        GEOPDPlaceGlobalResultReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readBatchReverseGeocodingResult_tags);
        objc_sync_exit(v145);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 440));
    id v146 = *(id *)(a1 + 96);
    v147 = v146;
    if (v146)
    {
      if (a2)
      {
        v148 = [v146 jsonRepresentation];
        v149 = @"batchReverseGeocodingResult";
      }
      else
      {
        v148 = [v146 dictionaryRepresentation];
        v149 = @"batch_reverse_geocoding_result";
      }
      id v150 = v148;

      [v4 setObject:v150 forKey:v149];
    }

    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 440));
    if ((*(unsigned char *)(a1 + 445) & 0x10) == 0)
    {
      v151 = *(void **)(a1 + 8);
      if (v151)
      {
        id v152 = v151;
        objc_sync_enter(v152);
        GEOPDPlaceGlobalResultReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readBrandLookupResult_tags);
        objc_sync_exit(v152);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 440));
    id v153 = *(id *)(a1 + 112);
    v154 = v153;
    if (v153)
    {
      if (a2)
      {
        v155 = [v153 jsonRepresentation];
        v156 = @"brandLookupResult";
      }
      else
      {
        v155 = [v153 dictionaryRepresentation];
        v156 = @"brand_lookup_result";
      }
      id v157 = v155;

      [v4 setObject:v157 forKey:v156];
    }

    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 440));
    if ((*(unsigned char *)(a1 + 450) & 8) == 0)
    {
      v158 = *(void **)(a1 + 8);
      if (v158)
      {
        id v159 = v158;
        objc_sync_enter(v159);
        GEOPDPlaceGlobalResultReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readWifiFingerprintResult_tags);
        objc_sync_exit(v159);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 440));
    id v160 = *(id *)(a1 + 424);
    v161 = v160;
    if (v160)
    {
      if (a2)
      {
        v162 = [v160 jsonRepresentation];
        v163 = @"wifiFingerprintResult";
      }
      else
      {
        v162 = [v160 dictionaryRepresentation];
        v163 = @"wifi_fingerprint_result";
      }
      id v164 = v162;

      [v4 setObject:v164 forKey:v163];
    }

    v165 = -[GEOPDPlaceGlobalResult ipGeoLookupResult]((id *)a1);
    v166 = v165;
    if (v165)
    {
      if (a2)
      {
        v167 = [v165 jsonRepresentation];
        v168 = @"ipGeoLookupResult";
      }
      else
      {
        v167 = [v165 dictionaryRepresentation];
        v168 = @"ip_geo_lookup_result";
      }
      id v169 = v167;

      [v4 setObject:v169 forKey:v168];
    }

    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 440));
    if ((*(unsigned char *)(a1 + 446) & 0x40) == 0)
    {
      v170 = *(void **)(a1 + 8);
      if (v170)
      {
        id v171 = v170;
        objc_sync_enter(v171);
        GEOPDPlaceGlobalResultReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readGroundViewLabelResult_tags);
        objc_sync_exit(v171);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 440));
    id v172 = *(id *)(a1 + 192);
    v173 = v172;
    if (v172)
    {
      if (a2)
      {
        v174 = [v172 jsonRepresentation];
        v175 = @"groundViewLabelResult";
      }
      else
      {
        v174 = [v172 dictionaryRepresentation];
        v175 = @"ground_view_label_result";
      }
      id v176 = v174;

      [v4 setObject:v176 forKey:v175];
    }

    v177 = -[GEOPDPlaceGlobalResult batchSpatialLookupResult]((id *)a1);
    v178 = v177;
    if (v177)
    {
      if (a2)
      {
        v179 = [v177 jsonRepresentation];
        v180 = @"batchSpatialLookupResult";
      }
      else
      {
        v179 = [v177 dictionaryRepresentation];
        v180 = @"batch_spatial_lookup_result";
      }
      id v181 = v179;

      [v4 setObject:v181 forKey:v180];
    }

    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 440));
    if ((*(unsigned char *)(a1 + 448) & 2) == 0)
    {
      v182 = *(void **)(a1 + 8);
      if (v182)
      {
        id v183 = v182;
        objc_sync_enter(v183);
        GEOPDPlaceGlobalResultReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readPlaceGlobalCommonResult_tags);
        objc_sync_exit(v183);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 440));
    id v184 = *(id *)(a1 + 280);
    v185 = v184;
    if (v184)
    {
      if (a2)
      {
        v186 = [v184 jsonRepresentation];
        v187 = @"placeGlobalCommonResult";
      }
      else
      {
        v186 = [v184 dictionaryRepresentation];
        v187 = @"place_global_common_result";
      }
      id v188 = v186;

      [v4 setObject:v188 forKey:v187];
    }

    -[GEOPDPlaceGlobalResult _readPlaceCollectionLookupResult](a1);
    id v189 = *(id *)(a1 + 272);
    v190 = v189;
    if (v189)
    {
      if (a2)
      {
        v191 = [v189 jsonRepresentation];
        v192 = @"placeCollectionLookupResult";
      }
      else
      {
        v191 = [v189 dictionaryRepresentation];
        v192 = @"place_collection_lookup_result";
      }
      id v193 = v191;

      [v4 setObject:v193 forKey:v192];
    }

    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 440));
    if ((*(unsigned char *)(a1 + 450) & 2) == 0)
    {
      v194 = *(void **)(a1 + 8);
      if (v194)
      {
        id v195 = v194;
        objc_sync_enter(v195);
        GEOPDPlaceGlobalResultReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readTransitScheduleLookupResult_tags);
        objc_sync_exit(v195);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 440));
    id v196 = *(id *)(a1 + 408);
    v197 = v196;
    if (v196)
    {
      if (a2)
      {
        v198 = [v196 jsonRepresentation];
        v199 = @"transitScheduleLookupResult";
      }
      else
      {
        v198 = [v196 dictionaryRepresentation];
        v199 = @"transit_schedule_lookup_result";
      }
      id v200 = v198;

      [v4 setObject:v200 forKey:v199];
    }

    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 440));
    if ((*(unsigned char *)(a1 + 444) & 0x80) == 0)
    {
      v201 = *(void **)(a1 + 8);
      if (v201)
      {
        id v202 = v201;
        objc_sync_enter(v202);
        GEOPDPlaceGlobalResultReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readBatchCategoryLookupResult_tags);
        objc_sync_exit(v202);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 440));
    id v203 = *(id *)(a1 + 72);
    v204 = v203;
    if (v203)
    {
      if (a2)
      {
        v205 = [v203 jsonRepresentation];
        v206 = @"batchCategoryLookupResult";
      }
      else
      {
        v205 = [v203 dictionaryRepresentation];
        v206 = @"batch_category_lookup_result";
      }
      id v207 = v205;

      [v4 setObject:v207 forKey:v206];
    }

    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 440));
    if ((*(unsigned char *)(a1 + 445) & 1) == 0)
    {
      v208 = *(void **)(a1 + 8);
      if (v208)
      {
        id v209 = v208;
        objc_sync_enter(v209);
        GEOPDPlaceGlobalResultReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readBatchMerchantLookupBrandResult_tags);
        objc_sync_exit(v209);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 440));
    id v210 = *(id *)(a1 + 80);
    v211 = v210;
    if (v210)
    {
      if (a2)
      {
        v212 = [v210 jsonRepresentation];
        v213 = @"batchMerchantLookupBrandResult";
      }
      else
      {
        v212 = [v210 dictionaryRepresentation];
        v213 = @"batch_merchant_lookup_brand_result";
      }
      id v214 = v212;

      [v4 setObject:v214 forKey:v213];
    }

    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 440));
    if ((*(unsigned char *)(a1 + 446) & 1) == 0)
    {
      v215 = *(void **)(a1 + 8);
      if (v215)
      {
        id v216 = v215;
        objc_sync_enter(v216);
        GEOPDPlaceGlobalResultReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readChildPlaceLookupByCategoryResult_tags);
        objc_sync_exit(v216);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 440));
    id v217 = *(id *)(a1 + 144);
    v218 = v217;
    if (v217)
    {
      if (a2)
      {
        v219 = [v217 jsonRepresentation];
        v220 = @"childPlaceLookupByCategoryResult";
      }
      else
      {
        v219 = [v217 dictionaryRepresentation];
        v220 = @"child_place_lookup_by_category_result";
      }
      id v221 = v219;

      [v4 setObject:v221 forKey:v220];
    }

    v222 = -[GEOPDPlaceGlobalResult mapsSearchHomeResult]((id *)a1);
    v223 = v222;
    if (v222)
    {
      if (a2)
      {
        v224 = [v222 jsonRepresentation];
        v225 = @"mapsSearchHomeResult";
      }
      else
      {
        v224 = [v222 dictionaryRepresentation];
        v225 = @"maps_search_home_result";
      }
      id v226 = v224;

      [v4 setObject:v226 forKey:v225];
    }

    -[GEOPDPlaceGlobalResult _readCollectionSuggestionResult](a1);
    id v227 = *(id *)(a1 + 152);
    v228 = v227;
    if (v227)
    {
      if (a2)
      {
        v229 = [v227 jsonRepresentation];
        v230 = @"collectionSuggestionResult";
      }
      else
      {
        v229 = [v227 dictionaryRepresentation];
        v230 = @"collection_suggestion_result";
      }
      id v231 = v229;

      [v4 setObject:v231 forKey:v230];
    }

    v232 = -[GEOPDPlaceGlobalResult publisherViewResult]((id *)a1);
    v233 = v232;
    if (v232)
    {
      if (a2)
      {
        v234 = [v232 jsonRepresentation];
        v235 = @"publisherViewResult";
      }
      else
      {
        v234 = [v232 dictionaryRepresentation];
        v235 = @"publisher_view_result";
      }
      id v236 = v234;

      [v4 setObject:v236 forKey:v235];
    }

    v237 = -[GEOPDPlaceGlobalResult allCollectionsViewResult]((id *)a1);
    v238 = v237;
    if (v237)
    {
      if (a2)
      {
        v239 = [v237 jsonRepresentation];
        v240 = @"allCollectionsViewResult";
      }
      else
      {
        v239 = [v237 dictionaryRepresentation];
        v240 = @"all_collections_view_result";
      }
      id v241 = v239;

      [v4 setObject:v241 forKey:v240];
    }

    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 440));
    if ((*(unsigned char *)(a1 + 444) & 8) == 0)
    {
      v242 = *(void **)(a1 + 8);
      if (v242)
      {
        id v243 = v242;
        objc_sync_enter(v243);
        GEOPDPlaceGlobalResultReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readAirportEntityPlaceLookupResult_tags);
        objc_sync_exit(v243);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 440));
    id v244 = *(id *)(a1 + 40);
    v245 = v244;
    if (v244)
    {
      if (a2)
      {
        v246 = [v244 jsonRepresentation];
        v247 = @"airportEntityPlaceLookupResult";
      }
      else
      {
        v246 = [v244 dictionaryRepresentation];
        v247 = @"airport_entity_place_lookup_result";
      }
      id v248 = v246;

      [v4 setObject:v248 forKey:v247];
    }

    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 440));
    if ((*(unsigned char *)(a1 + 450) & 1) == 0)
    {
      v249 = *(void **)(a1 + 8);
      if (v249)
      {
        id v250 = v249;
        objc_sync_enter(v250);
        GEOPDPlaceGlobalResultReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readTerritoryLookupResult_tags);
        objc_sync_exit(v250);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 440));
    id v251 = *(id *)(a1 + 400);
    v252 = v251;
    if (v251)
    {
      if (a2)
      {
        v253 = [v251 jsonRepresentation];
        v254 = @"territoryLookupResult";
      }
      else
      {
        v253 = [v251 dictionaryRepresentation];
        v254 = @"territory_lookup_result";
      }
      id v255 = v253;

      [v4 setObject:v255 forKey:v254];
    }

    v256 = -[GEOPDPlaceGlobalResult mapsHomeResult]((id *)a1);
    v257 = v256;
    if (v256)
    {
      if (a2)
      {
        v258 = [v256 jsonRepresentation];
        v259 = @"mapsHomeResult";
      }
      else
      {
        v258 = [v256 dictionaryRepresentation];
        v259 = @"maps_home_result";
      }
      id v260 = v258;

      [v4 setObject:v260 forKey:v259];
    }

    v261 = -[GEOPDPlaceGlobalResult allGuidesLocationsViewresult]((id *)a1);
    v262 = v261;
    if (v261)
    {
      if (a2)
      {
        v263 = [v261 jsonRepresentation];
        v264 = @"allGuidesLocationsViewresult";
      }
      else
      {
        v263 = [v261 dictionaryRepresentation];
        v264 = @"all_guides_locations_viewresult";
      }
      id v265 = v263;

      [v4 setObject:v265 forKey:v264];
    }

    v266 = -[GEOPDPlaceGlobalResult guidesHomeResult]((id *)a1);
    v267 = v266;
    if (v266)
    {
      if (a2)
      {
        v268 = [v266 jsonRepresentation];
        v269 = @"guidesHomeResult";
      }
      else
      {
        v268 = [v266 dictionaryRepresentation];
        v269 = @"guides_home_result";
      }
      id v270 = v268;

      [v4 setObject:v270 forKey:v269];
    }

    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 440));
    if ((*(unsigned char *)(a1 + 446) & 4) == 0)
    {
      v271 = *(void **)(a1 + 8);
      if (v271)
      {
        id v272 = v271;
        objc_sync_enter(v272);
        GEOPDPlaceGlobalResultReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readExtendedGeoLookupResult_tags);
        objc_sync_exit(v272);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 440));
    id v273 = *(id *)(a1 + 160);
    v274 = v273;
    if (v273)
    {
      if (a2)
      {
        v275 = [v273 jsonRepresentation];
        v276 = @"extendedGeoLookupResult";
      }
      else
      {
        v275 = [v273 dictionaryRepresentation];
        v276 = @"extended_geo_lookup_result";
      }
      id v277 = v275;

      [v4 setObject:v277 forKey:v276];
    }

    v278 = -[GEOPDPlaceGlobalResult queryUnderstandingResult]((id *)a1);
    v279 = v278;
    if (v278)
    {
      if (a2)
      {
        v280 = [v278 jsonRepresentation];
        v281 = @"queryUnderstandingResult";
      }
      else
      {
        v280 = [v278 dictionaryRepresentation];
        v281 = @"query_understanding_result";
      }
      id v282 = v280;

      [v4 setObject:v282 forKey:v281];
    }

    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 440));
    if ((*(unsigned char *)(a1 + 448) & 0x20) == 0)
    {
      v283 = *(void **)(a1 + 8);
      if (v283)
      {
        id v284 = v283;
        objc_sync_enter(v284);
        GEOPDPlaceGlobalResultReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readPoiAtAddressLookupResult_tags);
        objc_sync_exit(v284);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 440));
    id v285 = *(id *)(a1 + 312);
    v286 = v285;
    if (v285)
    {
      if (a2)
      {
        v287 = [v285 jsonRepresentation];
        v288 = @"poiAtAddressLookupResult";
      }
      else
      {
        v287 = [v285 dictionaryRepresentation];
        v288 = @"poi_at_address_lookup_result";
      }
      id v289 = v287;

      [v4 setObject:v289 forKey:v288];
    }

    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 440));
    if ((*(unsigned char *)(a1 + 448) & 0x10) == 0)
    {
      v290 = *(void **)(a1 + 8);
      if (v290)
      {
        id v291 = v290;
        objc_sync_enter(v291);
        GEOPDPlaceGlobalResultReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readPlacecardEnrichmentResult_tags);
        objc_sync_exit(v291);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 440));
    id v292 = *(id *)(a1 + 304);
    v293 = v292;
    if (v292)
    {
      if (a2)
      {
        v294 = [v292 jsonRepresentation];
        v295 = @"placecardEnrichmentResult";
      }
      else
      {
        v294 = [v292 dictionaryRepresentation];
        v295 = @"placecard_enrichment_result";
      }
      id v296 = v294;

      [v4 setObject:v296 forKey:v295];
    }

    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 440));
    if ((*(unsigned char *)(a1 + 447) & 0x80) == 0)
    {
      v297 = *(void **)(a1 + 8);
      if (v297)
      {
        id v298 = v297;
        objc_sync_enter(v298);
        GEOPDPlaceGlobalResultReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readOfflineRegionNameResult_tags);
        objc_sync_exit(v298);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 440));
    id v299 = *(id *)(a1 + 264);
    v300 = v299;
    if (v299)
    {
      if (a2)
      {
        v301 = [v299 jsonRepresentation];
        v302 = @"offlineRegionNameResult";
      }
      else
      {
        v301 = [v299 dictionaryRepresentation];
        v302 = @"offline_region_name_result";
      }
      id v303 = v301;

      [v4 setObject:v303 forKey:v302];
    }

    v304 = -[GEOPDPlaceGlobalResult searchCapabilitiesResult]((id *)a1);
    v305 = v304;
    if (v304)
    {
      if (a2)
      {
        v306 = [v304 jsonRepresentation];
        v307 = @"searchCapabilitiesResult";
      }
      else
      {
        v306 = [v304 dictionaryRepresentation];
        v307 = @"search_capabilities_result";
      }
      id v308 = v306;

      [v4 setObject:v308 forKey:v307];
    }

    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 440));
    if ((*(unsigned char *)(a1 + 444) & 4) == 0)
    {
      v309 = *(void **)(a1 + 8);
      if (v309)
      {
        id v310 = v309;
        objc_sync_enter(v310);
        GEOPDPlaceGlobalResultReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readAddressRecommendationResult_tags);
        objc_sync_exit(v310);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 440));
    id v311 = *(id *)(a1 + 32);
    v312 = v311;
    if (v311)
    {
      if (a2)
      {
        v313 = [v311 jsonRepresentation];
        v314 = @"addressRecommendationResult";
      }
      else
      {
        v313 = [v311 dictionaryRepresentation];
        v314 = @"address_recommendation_result";
      }
      id v315 = v313;

      [v4 setObject:v315 forKey:v314];
    }

    v316 = *(void **)(a1 + 16);
    if (v316)
    {
      v317 = [v316 dictionaryRepresentation];
      v318 = v317;
      if (a2)
      {
        v319 = objc_msgSend(MEMORY[0x1E4F1CA60], "dictionaryWithCapacity:", objc_msgSend(v317, "count"));
        v324[0] = MEMORY[0x1E4F143A8];
        v324[1] = 3221225472;
        v324[2] = __52__GEOPDPlaceGlobalResult__dictionaryRepresentation___block_invoke;
        v324[3] = &unk_1E53D8860;
        id v320 = v319;
        id v325 = v320;
        [v318 enumerateKeysAndObjectsUsingBlock:v324];
        id v321 = v320;

        v318 = v321;
      }
      [v4 setObject:v318 forKey:@"Unknown Fields"];
    }
    id v322 = v4;
  }
  else
  {
    id v322 = 0;
  }

  return v322;
}

- (id)jsonRepresentation
{
  return -[GEOPDPlaceGlobalResult _dictionaryRepresentation:]((uint64_t)self, 1);
}

- (void)readAll:(uint64_t)a1
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 440));
    id v4 = *(void **)(a1 + 8);
    if (v4)
    {
      id v5 = v4;
      objc_sync_enter(v5);
      if (a2) {
        objc_super v6 = (int *)&readAll__recursiveTag_4976;
      }
      else {
        objc_super v6 = (int *)&readAll__nonRecursiveTag_4977;
      }
      GEOPDPlaceGlobalResultReadSpecified(a1, *(void *)(a1 + 8), v6);
      objc_sync_exit(v5);
    }
    if (a2) {
      _GEOPDPlaceGlobalResultCallReadAllRecursiveWithoutSynchronized(a1);
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 440));
  }
}

void __52__GEOPDPlaceGlobalResult__dictionaryRepresentation___block_invoke(uint64_t a1, void *a2, void *a3)
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

- (void)_initWithDictionary:(unsigned int)a3 isJSON:
{
  uint64_t v1233 = *MEMORY[0x1E4F143B8];
  id v1099 = a2;
  id v4 = (id)[a1 init];

  v1078 = v4;
  if (!v4) {
    goto LABEL_1981;
  }
  if (a3) {
    id v5 = @"searchResult";
  }
  else {
    id v5 = @"search_result";
  }
  objc_super v6 = [v1099 objectForKeyedSubscript:v5];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    objc_super v7 = [GEOPDSearchResult alloc];
    if (v7) {
      id v8 = -[GEOPDSearchResult _initWithDictionary:isJSON:](v7, v6, a3);
    }
    else {
      id v8 = 0;
    }
    -[GEOPDPlaceGlobalResult setSearchResult:]((uint64_t)v1078, v8);
  }
  if (a3) {
    id v9 = @"geocodingResult";
  }
  else {
    id v9 = @"geocoding_result";
  }
  id v10 = [v1099 objectForKeyedSubscript:v9];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v11 = [GEOPDGeocodingResult alloc];
    if (v11)
    {
      id v12 = v10;
      v11 = [(GEOPDGeocodingResult *)v11 init];
      if (v11)
      {
        if (a3) {
          v13 = @"disambiguationLabel";
        }
        else {
          v13 = @"disambiguation_label";
        }
        id v14 = [v12 objectForKeyedSubscript:v13];
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          long long v1231 = 0u;
          long long v1230 = 0u;
          long long v1229 = 0u;
          long long v1228 = 0u;
          id v15 = v14;
          uint64_t v16 = [v15 countByEnumeratingWithState:&v1228 objects:v1232 count:16];
          if (v16)
          {
            uint64_t v17 = *(void *)v1229;
            do
            {
              uint64_t v18 = 0;
              do
              {
                if (*(void *)v1229 != v17) {
                  objc_enumerationMutation(v15);
                }
                v19 = *(void **)(*((void *)&v1228 + 1) + 8 * v18);
                objc_opt_class();
                if (objc_opt_isKindOfClass())
                {
                  v20 = [GEOPDMultiLocalizedString alloc];
                  if (v20) {
                    id v21 = (void *)-[GEOPDMultiLocalizedString _initWithDictionary:isJSON:](v20, v19, a3);
                  }
                  else {
                    id v21 = 0;
                  }
                  -[GEOPDGeocodingResult addDisambiguationLabel:]((uint64_t)v11, v21);
                }
                ++v18;
              }
              while (v16 != v18);
              uint64_t v22 = [v15 countByEnumeratingWithState:&v1228 objects:v1232 count:16];
              uint64_t v16 = v22;
            }
            while (v22);
          }
        }
      }
    }
    -[GEOPDPlaceGlobalResult setGeocodingResult:]((uint64_t)v1078, v11);
  }
  if (a3) {
    id v23 = @"canonicalSearchResult";
  }
  else {
    id v23 = @"canonical_search_result";
  }
  id v24 = [v1099 objectForKeyedSubscript:v23];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v25 = [GEOPDCanonicalLocationSearchResult alloc];
    id v26 = v24;
    if (v25) {
      v25 = [(GEOPDCanonicalLocationSearchResult *)v25 init];
    }

    -[GEOPDPlaceGlobalResult setCanonicalSearchResult:]((uint64_t)v1078, v25);
  }

  if (a3) {
    v27 = @"reverseGeocodingResult";
  }
  else {
    v27 = @"reverse_geocoding_result";
  }
  id v28 = [v1099 objectForKeyedSubscript:v27];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v29 = [GEOPDReverseGeocodingResult alloc];
    id v30 = v28;
    if (v29) {
      v29 = [(GEOPDReverseGeocodingResult *)v29 init];
    }

    -[GEOPDPlaceGlobalResult setReverseGeocodingResult:]((uint64_t)v1078, v29);
  }

  if (a3) {
    id v31 = @"placeLookupResult";
  }
  else {
    id v31 = @"place_lookup_result";
  }
  v32 = [v1099 objectForKeyedSubscript:v31];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v33 = [GEOPDPlaceLookupResult alloc];
    id v34 = v32;
    if (v33) {
      v33 = [(GEOPDPlaceLookupResult *)v33 init];
    }

    -[GEOPDPlaceGlobalResult setPlaceLookupResult:]((uint64_t)v1078, v33);
  }

  if (a3) {
    id v35 = @"merchantLookupResult";
  }
  else {
    id v35 = @"merchant_lookup_result";
  }
  v36 = [v1099 objectForKeyedSubscript:v35];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v37 = [GEOPDMerchantLookupResult alloc];
    if (a3) {
      v38 = [(GEOPDMerchantLookupResult *)v37 initWithJSON:v36];
    }
    else {
      v38 = [(GEOPDMerchantLookupResult *)v37 initWithDictionary:v36];
    }
    v39 = v38;
    -[GEOPDPlaceGlobalResult setMerchantLookupResult:]((uint64_t)v1078, v38);
  }
  if (a3) {
    id v40 = @"placeRefinementResult";
  }
  else {
    id v40 = @"place_refinement_result";
  }
  v41 = [v1099 objectForKeyedSubscript:v40];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v42 = [GEOPDPlaceRefinementResult alloc];
    id v43 = v41;
    if (v42) {
      id v42 = [(GEOPDPlaceRefinementResult *)v42 init];
    }

    -[GEOPDPlaceGlobalResult setPlaceRefinementResult:]((uint64_t)v1078, v42);
  }

  if (a3) {
    v44 = @"siriSearchResult";
  }
  else {
    v44 = @"siri_search_result";
  }
  v45 = [v1099 objectForKeyedSubscript:v44];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v46 = [GEOPDSiriSearchResult alloc];
    if (v46)
    {
      id v47 = v45;
      v46 = [(GEOPDSiriSearchResult *)v46 init];
      if (v46)
      {
        if (a3) {
          v48 = @"disambiguationLabel";
        }
        else {
          v48 = @"disambiguation_label";
        }
        id v49 = [v47 objectForKeyedSubscript:v48];
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          long long v1227 = 0u;
          long long v1226 = 0u;
          long long v1225 = 0u;
          long long v1224 = 0u;
          id v50 = v49;
          uint64_t v51 = [v50 countByEnumeratingWithState:&v1224 objects:v1232 count:16];
          if (v51)
          {
            uint64_t v52 = *(void *)v1225;
            do
            {
              uint64_t v53 = 0;
              do
              {
                if (*(void *)v1225 != v52) {
                  objc_enumerationMutation(v50);
                }
                id v54 = *(void **)(*((void *)&v1224 + 1) + 8 * v53);
                objc_opt_class();
                if (objc_opt_isKindOfClass())
                {
                  v55 = [GEOPDMultiLocalizedString alloc];
                  if (v55) {
                    v56 = (void *)-[GEOPDMultiLocalizedString _initWithDictionary:isJSON:](v55, v54, a3);
                  }
                  else {
                    v56 = 0;
                  }
                  -[GEOPDSiriSearchResult addDisambiguationLabel:]((uint64_t)v46, v56);
                }
                ++v53;
              }
              while (v51 != v53);
              uint64_t v57 = [v50 countByEnumeratingWithState:&v1224 objects:v1232 count:16];
              uint64_t v51 = v57;
            }
            while (v57);
          }
        }
        if (a3) {
          v58 = @"resultDetourInfo";
        }
        else {
          v58 = @"result_detour_info";
        }
        id v59 = [v47 objectForKeyedSubscript:v58];
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          long long v1223 = 0u;
          long long v1222 = 0u;
          long long v1221 = 0u;
          long long v1220 = 0u;
          id v60 = v59;
          uint64_t v61 = [v60 countByEnumeratingWithState:&v1220 objects:&v1228 count:16];
          if (v61)
          {
            uint64_t v62 = *(void *)v1221;
            do
            {
              for (uint64_t i = 0; i != v61; ++i)
              {
                if (*(void *)v1221 != v62) {
                  objc_enumerationMutation(v60);
                }
                uint64_t v64 = *(void *)(*((void *)&v1220 + 1) + 8 * i);
                objc_opt_class();
                if (objc_opt_isKindOfClass())
                {
                  v65 = [GEOPDResultDetourInfo alloc];
                  if (a3) {
                    v66 = [(GEOPDResultDetourInfo *)v65 initWithJSON:v64];
                  }
                  else {
                    v66 = [(GEOPDResultDetourInfo *)v65 initWithDictionary:v64];
                  }
                  v67 = v66;
                  -[GEOPDSiriSearchResult addResultDetourInfo:]((uint64_t)v46, v66);
                }
              }
              uint64_t v61 = [v60 countByEnumeratingWithState:&v1220 objects:&v1228 count:16];
            }
            while (v61);
          }
        }
        if (a3) {
          v68 = @"isChainResultSet";
        }
        else {
          v68 = @"is_chain_result_set";
        }
        id v69 = [v47 objectForKeyedSubscript:v68];
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          char v70 = [v69 BOOLValue];
          *(unsigned char *)&v46->_flags |= 0x10u;
          *(unsigned char *)&v46->_flags |= 1u;
          v46->_isChainResultSet = v70;
        }
      }
    }
    -[GEOPDPlaceGlobalResult setSiriSearchResult:]((uint64_t)v1078, v46);
  }
  if (a3) {
    v71 = @"locationDirectedSearchResult";
  }
  else {
    v71 = @"location_directed_search_result";
  }
  v72 = [v1099 objectForKeyedSubscript:v71];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v73 = [GEOPDLocationDirectedSearchResult alloc];
    if (v73)
    {
      id v74 = v72;
      v73 = [(GEOPDLocationDirectedSearchResult *)v73 init];
      if (v73)
      {
        if (a3) {
          v75 = @"displayMapRegion";
        }
        else {
          v75 = @"display_map_region";
        }
        v76 = [v74 objectForKeyedSubscript:v75];
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          v77 = [GEOMapRegion alloc];
          if (a3) {
            v78 = [(GEOMapRegion *)v77 initWithJSON:v76];
          }
          else {
            v78 = [(GEOMapRegion *)v77 initWithDictionary:v76];
          }
          id v79 = v78;
          -[GEOPDLocationDirectedSearchResult setDisplayMapRegion:]((uint64_t)v73, v78);
        }
        if (a3) {
          v80 = @"disambiguationLabel";
        }
        else {
          v80 = @"disambiguation_label";
        }
        v81 = [v74 objectForKeyedSubscript:v80];
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          long long v1231 = 0u;
          long long v1230 = 0u;
          long long v1229 = 0u;
          long long v1228 = 0u;
          id v82 = v81;
          uint64_t v83 = [v82 countByEnumeratingWithState:&v1228 objects:v1232 count:16];
          if (v83)
          {
            uint64_t v84 = *(void *)v1229;
            do
            {
              uint64_t v85 = 0;
              do
              {
                if (*(void *)v1229 != v84) {
                  objc_enumerationMutation(v82);
                }
                v86 = *(void **)(*((void *)&v1228 + 1) + 8 * v85);
                objc_opt_class();
                if (objc_opt_isKindOfClass())
                {
                  v87 = [GEOPDMultiLocalizedString alloc];
                  if (v87) {
                    v88 = (void *)-[GEOPDMultiLocalizedString _initWithDictionary:isJSON:](v87, v86, a3);
                  }
                  else {
                    v88 = 0;
                  }
                  -[GEOPDLocationDirectedSearchResult addDisambiguationLabel:]((uint64_t)v73, v88);
                }
                ++v85;
              }
              while (v83 != v85);
              uint64_t v89 = [v82 countByEnumeratingWithState:&v1228 objects:v1232 count:16];
              uint64_t v83 = v89;
            }
            while (v89);
          }
        }
        if (a3) {
          v90 = @"paginationInfo";
        }
        else {
          v90 = @"pagination_info";
        }
        v91 = [v74 objectForKeyedSubscript:v90];
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          v92 = [GEOPDPaginationInfo alloc];
          if (v92) {
            v93 = (void *)-[GEOPDPaginationInfo _initWithDictionary:isJSON:](v92, v91, a3);
          }
          else {
            v93 = 0;
          }
          -[GEOPDLocationDirectedSearchResult setPaginationInfo:]((uint64_t)v73, v93);
        }
      }
    }
    -[GEOPDPlaceGlobalResult setLocationDirectedSearchResult:]((uint64_t)v1078, v73);
  }
  if (a3) {
    id v94 = @"autocompleteResult";
  }
  else {
    id v94 = @"autocomplete_result";
  }
  v95 = [v1099 objectForKeyedSubscript:v94];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v96 = [GEOPDAutocompleteResult alloc];
    if (v96) {
      id v97 = (void *)-[GEOPDAutocompleteResult _initWithDictionary:isJSON:](v96, v95, a3);
    }
    else {
      id v97 = 0;
    }
    -[GEOPDPlaceGlobalResult setAutocompleteResult:]((uint64_t)v1078, v97);
  }
  if (a3) {
    v98 = @"browseCategorySuggestionResult";
  }
  else {
    v98 = @"browse_category_suggestion_result";
  }
  v99 = [v1099 objectForKeyedSubscript:v98];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v100 = [GEOPDSearchBrowseCategorySuggestionResult alloc];
    if (v100) {
      id v101 = (void *)-[GEOPDSearchBrowseCategorySuggestionResult _initWithDictionary:isJSON:](v100, v99, a3);
    }
    else {
      id v101 = 0;
    }
    -[GEOPDPlaceGlobalResult setBrowseCategorySuggestionResult:]((uint64_t)v1078, v101);
  }
  if (a3) {
    v102 = @"categorySearchResult";
  }
  else {
    v102 = @"category_search_result";
  }
  id v103 = [v1099 objectForKeyedSubscript:v102];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v104 = [GEOPDCategorySearchResult alloc];
    if (!v104)
    {
      v107 = 0;
      goto LABEL_404;
    }
    v105 = v104;
    id v106 = v103;
    v107 = [(GEOPDCategorySearchResult *)v105 init];

    if (!v107)
    {
LABEL_403:

LABEL_404:
      -[GEOPDPlaceGlobalResult setCategorySearchResult:]((uint64_t)v1078, v107);

      goto LABEL_405;
    }
    if (a3) {
      id v108 = @"displayMapRegion";
    }
    else {
      id v108 = @"display_map_region";
    }
    v109 = [v106 objectForKeyedSubscript:v108];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v110 = [GEOMapRegion alloc];
      if (a3) {
        id v111 = [(GEOMapRegion *)v110 initWithJSON:v109];
      }
      else {
        id v111 = [(GEOMapRegion *)v110 initWithDictionary:v109];
      }
      v112 = v111;
      -[GEOPDCategorySearchResult setDisplayMapRegion:]((uint64_t)v107, v111);
    }
    if (a3) {
      v113 = @"isChainResultSet";
    }
    else {
      v113 = @"is_chain_result_set";
    }
    v114 = [v106 objectForKeyedSubscript:v113];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      char v115 = [v114 BOOLValue];
      v107[46]._os_unfair_lock_opaque |= 0x1000000u;
      v107[46]._os_unfair_lock_opaque |= 0x20u;
      HIBYTE(v107[45]._os_unfair_lock_opaque) = v115;
    }

    if (a3) {
      v116 = @"relatedSearchSuggestion";
    }
    else {
      v116 = @"related_search_suggestion";
    }
    id v117 = [v106 objectForKeyedSubscript:v116];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      long long v1215 = 0u;
      long long v1214 = 0u;
      long long v1213 = 0u;
      long long v1212 = 0u;
      id v118 = v117;
      uint64_t v119 = [v118 countByEnumeratingWithState:&v1212 objects:v1232 count:16];
      if (v119)
      {
        uint64_t v120 = *(void *)v1213;
        do
        {
          uint64_t v121 = 0;
          do
          {
            if (*(void *)v1213 != v120) {
              objc_enumerationMutation(v118);
            }
            id v122 = *(void **)(*((void *)&v1212 + 1) + 8 * v121);
            objc_opt_class();
            if (objc_opt_isKindOfClass())
            {
              v123 = [GEOPDRelatedSearchSuggestion alloc];
              if (v123) {
                id v124 = -[GEOPDRelatedSearchSuggestion _initWithDictionary:isJSON:](v123, v122, a3);
              }
              else {
                id v124 = 0;
              }
              -[GEOPDCategorySearchResult addRelatedSearchSuggestion:](v107, v124);
            }
            ++v121;
          }
          while (v119 != v121);
          uint64_t v125 = [v118 countByEnumeratingWithState:&v1212 objects:v1232 count:16];
          uint64_t v119 = v125;
        }
        while (v125);
      }
    }
    if (a3) {
      v126 = @"resultDetourInfo";
    }
    else {
      v126 = @"result_detour_info";
    }
    v127 = [v106 objectForKeyedSubscript:v126];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      long long v1211 = 0u;
      long long v1209 = 0u;
      long long v1210 = 0u;
      long long v1208 = 0u;
      id v128 = v127;
      uint64_t v129 = [v128 countByEnumeratingWithState:&v1208 objects:&v1228 count:16];
      if (v129)
      {
        uint64_t v130 = *(void *)v1209;
        do
        {
          for (uint64_t j = 0; j != v129; ++j)
          {
            if (*(void *)v1209 != v130) {
              objc_enumerationMutation(v128);
            }
            uint64_t v132 = *(void *)(*((void *)&v1208 + 1) + 8 * j);
            objc_opt_class();
            if (objc_opt_isKindOfClass())
            {
              v133 = [GEOPDResultDetourInfo alloc];
              if (a3) {
                v134 = [(GEOPDResultDetourInfo *)v133 initWithJSON:v132];
              }
              else {
                v134 = [(GEOPDResultDetourInfo *)v133 initWithDictionary:v132];
              }
              v135 = v134;
              -[GEOPDCategorySearchResult addResultDetourInfo:](v107, v134);
            }
          }
          uint64_t v129 = [v128 countByEnumeratingWithState:&v1208 objects:&v1228 count:16];
        }
        while (v129);
      }
    }
    if (a3) {
      id v136 = @"defaultRelatedSearchSuggestion";
    }
    else {
      id v136 = @"default_related_search_suggestion";
    }
    v137 = [v106 objectForKeyedSubscript:v136];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v138 = [GEOPDRelatedSearchSuggestion alloc];
      if (v138) {
        id v139 = -[GEOPDRelatedSearchSuggestion _initWithDictionary:isJSON:](v138, v137, a3);
      }
      else {
        id v139 = 0;
      }
      -[GEOPDCategorySearchResult setDefaultRelatedSearchSuggestion:]((uint64_t)v107, v139);
    }
    if (a3) {
      v140 = @"searchClientBehavior";
    }
    else {
      v140 = @"search_client_behavior";
    }
    v141 = [v106 objectForKeyedSubscript:v140];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v142 = [GEOPDSearchClientBehavior alloc];
      if (v142) {
        id v143 = -[GEOPDSearchClientBehavior _initWithDictionary:isJSON:](v142, v141, a3);
      }
      else {
        id v143 = 0;
      }
      -[GEOPDCategorySearchResult setSearchClientBehavior:]((uint64_t)v107, v143);
    }
    if (a3) {
      v144 = @"enablePartialClientization";
    }
    else {
      v144 = @"enable_partial_clientization";
    }
    id v145 = [v106 objectForKeyedSubscript:v144];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      char v146 = [v145 BOOLValue];
      v107[46]._os_unfair_lock_opaque |= 0x1000000u;
      v107[46]._os_unfair_lock_opaque |= 8u;
      BYTE1(v107[45]._os_unfair_lock_opaque) = v146;
    }

    if (a3) {
      v147 = @"browseCategory";
    }
    else {
      v147 = @"browse_category";
    }
    v148 = [v106 objectForKeyedSubscript:v147];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      long long v1206 = 0u;
      long long v1207 = 0u;
      long long v1204 = 0u;
      long long v1205 = 0u;
      id v149 = v148;
      uint64_t v150 = [v149 countByEnumeratingWithState:&v1204 objects:&v1224 count:16];
      if (v150)
      {
        uint64_t v151 = *(void *)v1205;
        do
        {
          uint64_t v152 = 0;
          do
          {
            if (*(void *)v1205 != v151) {
              objc_enumerationMutation(v149);
            }
            id v153 = *(void **)(*((void *)&v1204 + 1) + 8 * v152);
            objc_opt_class();
            if (objc_opt_isKindOfClass())
            {
              v154 = [GEOPDBrowseCategory alloc];
              if (v154) {
                v155 = (void *)-[GEOPDBrowseCategory _initWithDictionary:isJSON:]((uint64_t)v154, v153, a3);
              }
              else {
                v155 = 0;
              }
              -[GEOPDCategorySearchResult addBrowseCategory:](v107, v155);
            }
            ++v152;
          }
          while (v150 != v152);
          uint64_t v156 = [v149 countByEnumeratingWithState:&v1204 objects:&v1224 count:16];
          uint64_t v150 = v156;
        }
        while (v156);
      }
    }
    if (a3) {
      id v157 = @"categorySearchResultSection";
    }
    else {
      id v157 = @"category_search_result_section";
    }
    v158 = [v106 objectForKeyedSubscript:v157];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v159 = [GEOPDSCategorySearchResultSection alloc];
      if (v159) {
        id v160 = (void *)-[GEOPDSCategorySearchResultSection _initWithDictionary:isJSON:]((uint64_t)v159, v158, a3);
      }
      else {
        id v160 = 0;
      }
      -[GEOPDCategorySearchResult setCategorySearchResultSection:]((uint64_t)v107, v160);
    }
    if (a3) {
      v161 = @"relatedEntitySection";
    }
    else {
      v161 = @"related_entity_section";
    }
    v162 = [v106 objectForKeyedSubscript:v161];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      long long v1202 = 0u;
      long long v1203 = 0u;
      long long v1200 = 0u;
      long long v1201 = 0u;
      id v163 = v162;
      uint64_t v164 = [v163 countByEnumeratingWithState:&v1200 objects:&v1220 count:16];
      if (v164)
      {
        uint64_t v165 = *(void *)v1201;
        do
        {
          uint64_t v166 = 0;
          do
          {
            if (*(void *)v1201 != v165) {
              objc_enumerationMutation(v163);
            }
            v167 = *(void **)(*((void *)&v1200 + 1) + 8 * v166);
            objc_opt_class();
            if (objc_opt_isKindOfClass())
            {
              v168 = [GEOPDRelatedEntitySection alloc];
              if (v168) {
                id v169 = (void *)-[GEOPDRelatedEntitySection _initWithDictionary:isJSON:]((uint64_t)v168, v167, a3);
              }
              else {
                id v169 = 0;
              }
              -[GEOPDCategorySearchResult addRelatedEntitySection:](v107, v169);
            }
            ++v166;
          }
          while (v164 != v166);
          uint64_t v170 = [v163 countByEnumeratingWithState:&v1200 objects:&v1220 count:16];
          uint64_t v164 = v170;
        }
        while (v170);
      }
    }
    if (a3) {
      id v171 = @"searchTierMetadata";
    }
    else {
      id v171 = @"search_tier_metadata";
    }
    id v172 = [v106 objectForKeyedSubscript:v171];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      long long v1198 = 0u;
      long long v1199 = 0u;
      long long v1196 = 0u;
      long long v1197 = 0u;
      id v173 = v172;
      uint64_t v174 = [v173 countByEnumeratingWithState:&v1196 objects:&v1216 count:16];
      if (v174)
      {
        uint64_t v175 = *(void *)v1197;
        do
        {
          uint64_t v176 = 0;
          do
          {
            if (*(void *)v1197 != v175) {
              objc_enumerationMutation(v173);
            }
            v177 = *(void **)(*((void *)&v1196 + 1) + 8 * v176);
            objc_opt_class();
            if (objc_opt_isKindOfClass())
            {
              v178 = [GEOPDSSearchTierMetadata alloc];
              if (v178) {
                v179 = (void *)-[GEOPDSSearchTierMetadata _initWithDictionary:isJSON:]((uint64_t)v178, v177, a3);
              }
              else {
                v179 = 0;
              }
              -[GEOPDCategorySearchResult addSearchTierMetadata:]((uint64_t)v107, v179);
            }
            ++v176;
          }
          while (v174 != v176);
          uint64_t v180 = [v173 countByEnumeratingWithState:&v1196 objects:&v1216 count:16];
          uint64_t v174 = v180;
        }
        while (v180);
      }
    }
    if (a3) {
      id v181 = @"resultRefinementGroup";
    }
    else {
      id v181 = @"result_refinement_group";
    }
    v182 = [v106 objectForKeyedSubscript:v181];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v183 = [GEOPDResultRefinementGroup alloc];
      if (v183) {
        id v184 = -[GEOPDResultRefinementGroup _initWithDictionary:isJSON:](v183, v182, a3);
      }
      else {
        id v184 = 0;
      }
      -[GEOPDCategorySearchResult setResultRefinementGroup:]((uint64_t)v107, v184);
    }
    if (a3) {
      v185 = @"autoRedoSearchThreshold";
    }
    else {
      v185 = @"auto_redo_search_threshold";
    }
    v186 = [v106 objectForKeyedSubscript:v185];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v187 = [GEOPDSSearchAutoRedoThreshold alloc];
      if (v187) {
        id v188 = (void *)-[GEOPDSSearchAutoRedoThreshold _initWithDictionary:isJSON:]((uint64_t)v187, v186, a3);
      }
      else {
        id v188 = 0;
      }
      -[GEOPDCategorySearchResult setAutoRedoSearchThreshold:]((uint64_t)v107, v188);
    }
    if (a3) {
      id v189 = @"placeSummaryLayoutMetadata";
    }
    else {
      id v189 = @"place_summary_layout_metadata";
    }
    v190 = [v106 objectForKeyedSubscript:v189];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v191 = [GEOPDPlaceSummaryLayoutMetadata alloc];
      if (a3) {
        v192 = [(GEOPDPlaceSummaryLayoutMetadata *)v191 initWithJSON:v190];
      }
      else {
        v192 = [(GEOPDPlaceSummaryLayoutMetadata *)v191 initWithDictionary:v190];
      }
      id v193 = v192;
      -[GEOPDCategorySearchResult setPlaceSummaryLayoutMetadata:]((uint64_t)v107, v192);
    }
    if (a3) {
      v194 = @"sectionList";
    }
    else {
      v194 = @"section_list";
    }
    id v195 = [v106 objectForKeyedSubscript:v194];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v196 = [GEOPDSearchSectionList alloc];
      if (v196) {
        v197 = (void *)-[GEOPDSearchSectionList _initWithDictionary:isJSON:](v196, v195, a3);
      }
      else {
        v197 = 0;
      }
      -[GEOPDCategorySearchResult setSectionList:]((uint64_t)v107, v197);
    }
    if (a3) {
      v198 = @"disableAddingAdditionalPaddingOnViewport";
    }
    else {
      v198 = @"disable_adding_additional_padding_on_viewport";
    }
    v199 = [v106 objectForKeyedSubscript:v198];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      char v200 = [v199 BOOLValue];
      v107[46]._os_unfair_lock_opaque |= 0x1000000u;
      v107[46]._os_unfair_lock_opaque |= 4u;
      LOBYTE(v107[45]._os_unfair_lock_opaque) = v200;
    }

    if (a3) {
      v201 = @"searchResultViewType";
    }
    else {
      v201 = @"search_result_view_type";
    }
    id v202 = [v106 objectForKeyedSubscript:v201];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v203 = v202;
      if ([v203 isEqualToString:@"SEARCH_RESULT_VIEW_TYPE_DEFAULT"])
      {
        int v204 = 0;
      }
      else if ([v203 isEqualToString:@"SEARCH_RESULT_VIEW_TYPE_RESULT_LIST"])
      {
        int v204 = 1;
      }
      else if ([v203 isEqualToString:@"SEARCH_RESULT_VIEW_TYPE_PLACE_CARD"])
      {
        int v204 = 2;
      }
      else
      {
        int v204 = 0;
      }
    }
    else
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0) {
        goto LABEL_360;
      }
      int v204 = [v202 intValue];
    }
    v107[46]._os_unfair_lock_opaque |= 0x1000000u;
    v107[46]._os_unfair_lock_opaque |= 2u;
    v107[44]._os_unfair_lock_opaque = v204;
LABEL_360:

    if (a3) {
      v205 = @"enableStructuredRapAffordance";
    }
    else {
      v205 = @"enable_structured_rap_affordance";
    }
    v206 = [v106 objectForKeyedSubscript:v205];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      char v207 = [v206 BOOLValue];
      v107[46]._os_unfair_lock_opaque |= 0x1000000u;
      v107[46]._os_unfair_lock_opaque |= 0x10u;
      BYTE2(v107[45]._os_unfair_lock_opaque) = v207;
    }

    if (a3) {
      v208 = @"searchSessionData";
    }
    else {
      v208 = @"search_session_data";
    }
    id v209 = [v106 objectForKeyedSubscript:v208];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v210 = -[GEOACResult _initWithDictionary:isJSON:]([GEOPDSSearchSessionData alloc], v209);
      -[GEOPDCategorySearchResult setSearchSessionData:]((uint64_t)v107, v210);
    }
    if (a3) {
      v211 = @"mapDisplayType";
    }
    else {
      v211 = @"map_display_type";
    }
    v212 = [v106 objectForKeyedSubscript:v211];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v213 = v212;
      if ([v213 isEqualToString:@"DEFAULT"]) {
        uint32_t v214 = 0;
      }
      else {
        uint32_t v214 = [v213 isEqualToString:@"TOPOGRAPHIC"];
      }
    }
    else
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
LABEL_381:

        if (a3) {
          v215 = @"guideSummaryLayoutMetadata";
        }
        else {
          v215 = @"guide_summary_layout_metadata";
        }
        id v216 = [v106 objectForKeyedSubscript:v215];
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          id v217 = [GEOPDGuideSummaryLayoutMetadata alloc];
          if (v217) {
            v218 = (void *)-[GEOPDGuideSummaryLayoutMetadata _initWithDictionary:isJSON:]((uint64_t)v217, v216, a3);
          }
          else {
            v218 = 0;
          }
          -[GEOPDCategorySearchResult setGuideSummaryLayoutMetadata:]((uint64_t)v107, v218);
        }
        if (a3) {
          v219 = @"paginationInfo";
        }
        else {
          v219 = @"pagination_info";
        }
        v220 = [v106 objectForKeyedSubscript:v219];
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          id v221 = [GEOPDPaginationInfo alloc];
          if (v221) {
            v222 = (void *)-[GEOPDPaginationInfo _initWithDictionary:isJSON:](v221, v220, a3);
          }
          else {
            v222 = 0;
          }
          -[GEOPDCategorySearchResult setPaginationInfo:]((uint64_t)v107, v222);
        }
        if (a3) {
          v223 = @"redoButtonThreshold";
        }
        else {
          v223 = @"redo_button_threshold";
        }
        v224 = [v106 objectForKeyedSubscript:v223];
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          v225 = [GEOPDSSearchRedoButtonThreshold alloc];
          if (v225) {
            id v226 = (void *)-[GEOPDSSearchRedoButtonThreshold _initWithDictionary:isJSON:]((uint64_t)v225, v224, a3);
          }
          else {
            id v226 = 0;
          }
          -[GEOPDCategorySearchResult setRedoButtonThreshold:]((uint64_t)v107, v226);
        }
        goto LABEL_403;
      }
      uint32_t v214 = [v212 intValue];
    }
    v107[46]._os_unfair_lock_opaque |= 0x1000000u;
    v107[46]._os_unfair_lock_opaque |= 1u;
    v107[43]._os_unfair_lock_opaque = v214;
    goto LABEL_381;
  }
LABEL_405:

  if (a3) {
    id v227 = @"popularNearbySearchResult";
  }
  else {
    id v227 = @"popular_nearby_search_result";
  }
  v228 = [v1099 objectForKeyedSubscript:v227];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v229 = [GEOPDPopularNearbySearchResult alloc];
    if (v229)
    {
      id v230 = v228;
      v229 = [(GEOPDPopularNearbySearchResult *)v229 init];
      if (v229)
      {
        if (a3) {
          id v231 = @"displayMapRegion";
        }
        else {
          id v231 = @"display_map_region";
        }
        v232 = [v230 objectForKeyedSubscript:v231];
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          v233 = [GEOMapRegion alloc];
          if (a3) {
            v234 = [(GEOMapRegion *)v233 initWithJSON:v232];
          }
          else {
            v234 = [(GEOMapRegion *)v233 initWithDictionary:v232];
          }
          v235 = v234;
          -[GEOPDPopularNearbySearchResult setDisplayMapRegion:]((uint64_t)v229, v234);
        }
        if (a3) {
          id v236 = @"sectionHeader";
        }
        else {
          id v236 = @"section_header";
        }
        v237 = [v230 objectForKeyedSubscript:v236];
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          v238 = (void *)[v237 copy];
          -[GEOPDPopularNearbySearchResult setSectionHeader:]((uint64_t)v229, v238);
        }
        if (a3) {
          v239 = @"isChainResultSet";
        }
        else {
          v239 = @"is_chain_result_set";
        }
        v240 = [v230 objectForKeyedSubscript:v239];
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          char v241 = [v240 BOOLValue];
          *(unsigned char *)&v229->_flags |= 0x10u;
          *(unsigned char *)&v229->_flags |= 1u;
          v229->_isChainResultSet = v241;
        }
      }
    }
    -[GEOPDPlaceGlobalResult setPopularNearbySearchResult:]((uint64_t)v1078, v229);
  }
  if (a3) {
    v242 = @"searchZeroKeywordCategorySuggestionResult";
  }
  else {
    v242 = @"search_zero_keyword_category_suggestion_result";
  }
  v1068 = [v1099 objectForKeyedSubscript:v242];
  objc_opt_class();
  id v243 = v1068;
  if (objc_opt_isKindOfClass())
  {
    id v244 = [GEOPDSearchZeroKeywordCategorySuggestionResult alloc];
    if (v244)
    {
      v245 = v244;
      id v246 = v1068;
      v1147 = [(GEOPDSearchZeroKeywordCategorySuggestionResult *)v245 init];
      if (v1147)
      {
        v1054 = v246;
        v247 = [v246 objectForKeyedSubscript:@"category"];
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          long long v1219 = 0u;
          long long v1218 = 0u;
          long long v1217 = 0u;
          long long v1216 = 0u;
          id v248 = v247;
          uint64_t v249 = [v248 countByEnumeratingWithState:&v1216 objects:&v1228 count:16];
          if (v249)
          {
            uint64_t v250 = *(void *)v1217;
            do
            {
              uint64_t v251 = 0;
              do
              {
                if (*(void *)v1217 != v250) {
                  objc_enumerationMutation(v248);
                }
                v252 = *(void **)(*((void *)&v1216 + 1) + 8 * v251);
                objc_opt_class();
                if (objc_opt_isKindOfClass())
                {
                  v253 = [GEOPDBrowseCategory alloc];
                  if (v253) {
                    v254 = (void *)-[GEOPDBrowseCategory _initWithDictionary:isJSON:]((uint64_t)v253, v252, a3);
                  }
                  else {
                    v254 = 0;
                  }
                  -[GEOPDSearchZeroKeywordCategorySuggestionResult addCategory:]((uint64_t)v1147, v254);
                }
                ++v251;
              }
              while (v249 != v251);
              uint64_t v255 = [v248 countByEnumeratingWithState:&v1216 objects:&v1228 count:16];
              uint64_t v249 = v255;
            }
            while (v255);
          }
        }
        if (a3) {
          v256 = @"zeroKeywordEntry";
        }
        else {
          v256 = @"zero_keyword_entry";
        }
        v1061 = [v1054 objectForKeyedSubscript:v256];
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          long long v1215 = 0u;
          long long v1214 = 0u;
          long long v1213 = 0u;
          long long v1212 = 0u;
          obuint64_t j = v1061;
          id v1136 = (id)[obj countByEnumeratingWithState:&v1212 objects:&v1224 count:16];
          if (v1136)
          {
            v257 = @"day_of_week";
            id v1124 = *(id *)v1213;
            if (a3) {
              v257 = @"dayOfWeek";
            }
            v1100 = v257;
            if (a3) {
              v258 = @"hourOfDay";
            }
            else {
              v258 = @"hour_of_day";
            }
            v259 = @"categoryIndex";
            if (!a3) {
              v259 = @"category_index";
            }
            v1079 = v259;
            v1088 = v258;
            do
            {
              for (k = 0; k != v1136; k = (char *)k + 1)
              {
                if (*(id *)v1213 != v1124) {
                  objc_enumerationMutation(obj);
                }
                v261 = *(void **)(*((void *)&v1212 + 1) + 8 * (void)k);
                objc_opt_class();
                if (objc_opt_isKindOfClass())
                {
                  v262 = [GEOPDSearchZeroKeywordEntry alloc];
                  if (v262)
                  {
                    id v1159 = v261;
                    v262 = [(GEOPDSearchZeroKeywordEntry *)v262 init];
                    if (v262)
                    {
                      v263 = [v1159 objectForKeyedSubscript:v1100];
                      objc_opt_class();
                      if (objc_opt_isKindOfClass())
                      {
                        unsigned int v264 = [v263 unsignedIntValue];
                        *(unsigned char *)&v262->_flags |= 1u;
                        v262->_dayOfWeek = v264;
                      }

                      id v265 = [v1159 objectForKeyedSubscript:v1088];
                      objc_opt_class();
                      if (objc_opt_isKindOfClass())
                      {
                        unsigned int v266 = [v265 unsignedIntValue];
                        *(unsigned char *)&v262->_flags |= 2u;
                        v262->_hourOfDay = v266;
                      }

                      v267 = [v1159 objectForKeyedSubscript:v1079];
                      objc_opt_class();
                      if (objc_opt_isKindOfClass())
                      {
                        long long v1223 = 0u;
                        long long v1222 = 0u;
                        long long v1221 = 0u;
                        long long v1220 = 0u;
                        id v268 = v267;
                        uint64_t v269 = [v268 countByEnumeratingWithState:&v1220 objects:v1232 count:16];
                        if (v269)
                        {
                          uint64_t v270 = *(void *)v1221;
                          do
                          {
                            for (uint64_t m = 0; m != v269; ++m)
                            {
                              if (*(void *)v1221 != v270) {
                                objc_enumerationMutation(v268);
                              }
                              id v272 = *(void **)(*((void *)&v1220 + 1) + 8 * m);
                              objc_opt_class();
                              if (objc_opt_isKindOfClass())
                              {
                                [v272 unsignedIntValue];
                                PBRepeatedUInt32Add();
                              }
                            }
                            uint64_t v269 = [v268 countByEnumeratingWithState:&v1220 objects:v1232 count:16];
                          }
                          while (v269);
                        }
                      }
                    }
                  }
                  -[GEOPDSearchZeroKeywordCategorySuggestionResult addZeroKeywordEntry:]((uint64_t)v1147, v262);
                }
              }
              id v1136 = (id)[obj countByEnumeratingWithState:&v1212 objects:&v1224 count:16];
            }
            while (v1136);
          }
        }
        id v246 = v1054;
      }
    }
    else
    {
      v1147 = 0;
    }
    -[GEOPDPlaceGlobalResult setSearchZeroKeywordCategorySuggestionResult:]((uint64_t)v1078, v1147);

    id v243 = v1068;
  }

  if (a3) {
    id v273 = @"searchFieldPlaceholderResult";
  }
  else {
    id v273 = @"search_field_placeholder_result";
  }
  v274 = [v1099 objectForKeyedSubscript:v273];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v275 = [GEOPDSearchFieldPlaceholderResult alloc];
    if (v275)
    {
      id v276 = v274;
      v275 = [(GEOPDSearchFieldPlaceholderResult *)v275 init];
      if (v275)
      {
        if (a3) {
          id v277 = @"displayString";
        }
        else {
          id v277 = @"display_string";
        }
        v278 = [v276 objectForKeyedSubscript:v277];
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          v279 = (void *)[v278 copy];
          -[GEOPDSearchFieldPlaceholderResult setDisplayString:]((uint64_t)v275, v279);
        }
      }
    }
    -[GEOPDPlaceGlobalResult setSearchFieldPlaceholderResult:]((uint64_t)v1078, v275);
  }
  if (a3) {
    v280 = @"batchPopularNearbySearchResult";
  }
  else {
    v280 = @"batch_popular_nearby_search_result";
  }
  v1055 = [v1099 objectForKeyedSubscript:v280];
  objc_opt_class();
  v281 = v1055;
  if (objc_opt_isKindOfClass())
  {
    id v282 = [GEOPDBatchPopularNearbySearchResult alloc];
    if (v282)
    {
      v283 = v282;
      id v284 = v1055;
      v1080 = [(GEOPDBatchPopularNearbySearchResult *)v283 init];
      if (v1080)
      {
        if (a3) {
          id v285 = @"popularNearbyResult";
        }
        else {
          id v285 = @"popular_nearby_result";
        }
        id v1047 = v284;
        v1051 = [v284 objectForKeyedSubscript:v285];
        objc_opt_class();
        v286 = v1051;
        if (objc_opt_isKindOfClass())
        {
          long long v1223 = 0u;
          long long v1222 = 0u;
          long long v1221 = 0u;
          long long v1220 = 0u;
          id v1089 = v1051;
          id obja = (id)[v1089 countByEnumeratingWithState:&v1220 objects:&v1228 count:16];
          if (obja)
          {
            v287 = @"section_header";
            id v1101 = *(id *)v1221;
            if (a3) {
              v287 = @"sectionHeader";
            }
            v1069 = v287;
            if (a3) {
              v288 = @"litePlaceResult";
            }
            else {
              v288 = @"lite_place_result";
            }
            v1062 = v288;
            id v289 = @"result_provider_id";
            if (a3) {
              id v289 = @"resultProviderId";
            }
            v1160 = v289;
            do
            {
              uint64_t v290 = 0;
              do
              {
                if (*(id *)v1221 != v1101)
                {
                  uint64_t v291 = v290;
                  objc_enumerationMutation(v1089);
                  uint64_t v290 = v291;
                }
                uint64_t v1148 = v290;
                id v292 = *(void **)(*((void *)&v1220 + 1) + 8 * v290);
                objc_opt_class();
                if (objc_opt_isKindOfClass())
                {
                  v293 = [GEOPDPopularNearbyResult alloc];
                  if (v293)
                  {
                    id v1137 = v292;
                    uint64_t v294 = [(GEOPDPopularNearbyResult *)v293 init];
                    if (v294)
                    {
                      v295 = [v1137 objectForKeyedSubscript:v1069];
                      objc_opt_class();
                      if (objc_opt_isKindOfClass())
                      {
                        id v296 = (void *)[v295 copy];
                        id v297 = v296;
                        *(unsigned char *)(v294 + 68) |= 4u;
                        *(unsigned char *)(v294 + 68) |= 8u;
                        objc_storeStrong((id *)(v294 + 48), v296);
                      }
                      id v1125 = [v1137 objectForKeyedSubscript:v1062];
                      objc_opt_class();
                      if (objc_opt_isKindOfClass())
                      {
                        long long v1227 = 0u;
                        long long v1226 = 0u;
                        long long v1225 = 0u;
                        long long v1224 = 0u;
                        id v298 = v1125;
                        uint64_t v299 = [v298 countByEnumeratingWithState:&v1224 objects:v1232 count:16];
                        if (v299)
                        {
                          uint64_t v300 = *(void *)v1225;
                          do
                          {
                            for (uint64_t n = 0; n != v299; ++n)
                            {
                              if (*(void *)v1225 != v300) {
                                objc_enumerationMutation(v298);
                              }
                              v302 = *(void **)(*((void *)&v1224 + 1) + 8 * n);
                              objc_opt_class();
                              if (objc_opt_isKindOfClass())
                              {
                                id v303 = v302;
                                v304 = [v303 objectForKeyedSubscript:@"muid"];
                                objc_opt_class();
                                if (objc_opt_isKindOfClass())
                                {
                                  uint64_t v305 = [v304 unsignedLongLongValue];
                                  uint64_t v306 = 0x100000000;
                                }
                                else
                                {
                                  uint64_t v305 = 0;
                                  uint64_t v306 = 0;
                                }

                                v307 = [v303 objectForKeyedSubscript:v1160];

                                objc_opt_class();
                                if (objc_opt_isKindOfClass()) {
                                  v306 |= [v307 intValue] | 0x200000000;
                                }

                                -[GEOPDPopularNearbyResult _readLitePlaceResults](v294);
                                if (-[GEOPDPopularNearbyResult _reserveLitePlaceResults:](v294, 1uLL))
                                {
                                  id v308 = (uint64_t *)(*(void *)(v294 + 24) + 16 * *(void *)(v294 + 32));
                                  *id v308 = v305;
                                  v308[1] = v306;
                                  ++*(void *)(v294 + 32);
                                }
                                os_unfair_lock_lock_with_options();
                                *(unsigned char *)(v294 + 68) |= 2u;
                                os_unfair_lock_unlock((os_unfair_lock_t)(v294 + 64));
                                *(unsigned char *)(v294 + 68) |= 8u;
                              }
                            }
                            uint64_t v299 = [v298 countByEnumeratingWithState:&v1224 objects:v1232 count:16];
                          }
                          while (v299);
                        }
                      }
                    }
                  }
                  else
                  {
                    uint64_t v294 = 0;
                  }
                  -[GEOPDBatchPopularNearbySearchResult addPopularNearbyResult:]((uint64_t)v1080, (void *)v294);
                }
                uint64_t v290 = v1148 + 1;
              }
              while ((id)(v1148 + 1) != obja);
              uint64_t v309 = [v1089 countByEnumeratingWithState:&v1220 objects:&v1228 count:16];
              id obja = (id)v309;
            }
            while (v309);
          }

          v286 = v1051;
        }

        id v284 = v1047;
      }
    }
    else
    {
      v1080 = 0;
    }
    -[GEOPDPlaceGlobalResult setBatchPopularNearbySearchResult:]((uint64_t)v1078, v1080);

    v281 = v1055;
  }

  if (a3) {
    id v310 = @"vendorSpecificPlaceRefinementResult";
  }
  else {
    id v310 = @"vendor_specific_place_refinement_result";
  }
  id v311 = [v1099 objectForKeyedSubscript:v310];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v312 = [GEOPDVendorSpecificPlaceRefinementResult alloc];
    id v313 = v311;
    if (v312) {
      v312 = [(GEOPDVendorSpecificPlaceRefinementResult *)v312 init];
    }

    -[GEOPDPlaceGlobalResult setVendorSpecificPlaceRefinementResult:]((uint64_t)v1078, v312);
  }

  if (a3) {
    v314 = @"nearbySearchResult";
  }
  else {
    v314 = @"nearby_search_result";
  }
  id v315 = [v1099 objectForKeyedSubscript:v314];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v316 = [GEOPDNearbySearchResult alloc];
    id v317 = v315;
    if (v316) {
      v316 = [(GEOPDNearbySearchResult *)v316 init];
    }

    -[GEOPDPlaceGlobalResult setNearbySearchResult:]((uint64_t)v1078, v316);
  }

  if (a3) {
    v318 = @"addressObjectGeocodingResult";
  }
  else {
    v318 = @"address_object_geocoding_result";
  }
  v319 = [v1099 objectForKeyedSubscript:v318];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v320 = [GEOPDAddressObjectGeocodingResult alloc];
    if (v320)
    {
      id v321 = v319;
      id v320 = [(GEOPDAddressObjectGeocodingResult *)v320 init];
      if (v320)
      {
        if (a3) {
          id v322 = @"disambiguationLabel";
        }
        else {
          id v322 = @"disambiguation_label";
        }
        v323 = [v321 objectForKeyedSubscript:v322];
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          long long v1231 = 0u;
          long long v1230 = 0u;
          long long v1229 = 0u;
          long long v1228 = 0u;
          id v324 = v323;
          uint64_t v325 = [v324 countByEnumeratingWithState:&v1228 objects:v1232 count:16];
          if (v325)
          {
            uint64_t v326 = *(void *)v1229;
            do
            {
              uint64_t v327 = 0;
              do
              {
                if (*(void *)v1229 != v326) {
                  objc_enumerationMutation(v324);
                }
                v328 = *(void **)(*((void *)&v1228 + 1) + 8 * v327);
                objc_opt_class();
                if (objc_opt_isKindOfClass())
                {
                  v329 = [GEOPDMultiLocalizedString alloc];
                  if (v329) {
                    v330 = (void *)-[GEOPDMultiLocalizedString _initWithDictionary:isJSON:](v329, v328, a3);
                  }
                  else {
                    v330 = 0;
                  }
                  -[GEOPDAddressObjectGeocodingResult addDisambiguationLabel:]((uint64_t)v320, v330);
                }
                ++v327;
              }
              while (v325 != v327);
              uint64_t v331 = [v324 countByEnumeratingWithState:&v1228 objects:v1232 count:16];
              uint64_t v325 = v331;
            }
            while (v331);
          }
        }
      }
    }
    -[GEOPDPlaceGlobalResult setAddressObjectGeocodingResult:]((uint64_t)v1078, v320);
  }
  if (a3) {
    v332 = @"searchZeroKeywordWithSearchResultsSuggestionResult";
  }
  else {
    v332 = @"search_zero_keyword_with_search_results_suggestion_result";
  }
  v1070 = [v1099 objectForKeyedSubscript:v332];
  objc_opt_class();
  v333 = v1070;
  if (objc_opt_isKindOfClass())
  {
    v334 = [GEOPDSearchZeroKeywordWithSearchResultsSuggestionResult alloc];
    if (v334)
    {
      v335 = v334;
      id v336 = v1070;
      v1090 = [(GEOPDSearchZeroKeywordWithSearchResultsSuggestionResult *)v335 init];
      if (v1090)
      {
        if (a3) {
          v337 = @"searchResultsForCategoryEntry";
        }
        else {
          v337 = @"search_results_for_category_entry";
        }
        id v1056 = v336;
        v1063 = [v336 objectForKeyedSubscript:v337];
        objc_opt_class();
        v338 = v1063;
        if (objc_opt_isKindOfClass())
        {
          long long v1223 = 0u;
          long long v1222 = 0u;
          long long v1221 = 0u;
          long long v1220 = 0u;
          id v1102 = v1063;
          id v1126 = (id)[v1102 countByEnumeratingWithState:&v1220 objects:&v1228 count:16];
          if (v1126)
          {
            v339 = @"place_index";
            id objb = *(id *)v1221;
            if (a3) {
              v339 = @"placeIndex";
            }
            v1081 = v339;
            do
            {
              uint64_t v340 = 0;
              do
              {
                if (*(id *)v1221 != objb)
                {
                  uint64_t v341 = v340;
                  objc_enumerationMutation(v1102);
                  uint64_t v340 = v341;
                }
                uint64_t v1161 = v340;
                v342 = *(void **)(*((void *)&v1220 + 1) + 8 * v340);
                objc_opt_class();
                if (objc_opt_isKindOfClass())
                {
                  v343 = [GEOPDSearchResultsForCategoryEntry alloc];
                  if (v343)
                  {
                    id v1149 = v342;
                    uint64_t v344 = [(GEOPDSearchResultsForCategoryEntry *)v343 init];
                    if (v344)
                    {
                      v345 = [v1149 objectForKeyedSubscript:@"category"];
                      objc_opt_class();
                      if (objc_opt_isKindOfClass())
                      {
                        v346 = [GEOPDBrowseCategory alloc];
                        if (v346) {
                          v347 = (void *)-[GEOPDBrowseCategory _initWithDictionary:isJSON:]((uint64_t)v346, v345, a3);
                        }
                        else {
                          v347 = 0;
                        }
                        id v348 = v347;
                        *(unsigned char *)(v344 + 68) |= 4u;
                        *(unsigned char *)(v344 + 68) |= 8u;
                        objc_storeStrong((id *)(v344 + 48), v347);
                      }
                      id v1138 = [v1149 objectForKeyedSubscript:v1081];
                      objc_opt_class();
                      if (objc_opt_isKindOfClass())
                      {
                        long long v1227 = 0u;
                        long long v1226 = 0u;
                        long long v1225 = 0u;
                        long long v1224 = 0u;
                        id v349 = v1138;
                        uint64_t v350 = [v349 countByEnumeratingWithState:&v1224 objects:v1232 count:16];
                        if (v350)
                        {
                          uint64_t v351 = *(void *)v1225;
                          do
                          {
                            for (iuint64_t i = 0; ii != v350; ++ii)
                            {
                              if (*(void *)v1225 != v351) {
                                objc_enumerationMutation(v349);
                              }
                              v353 = *(void **)(*((void *)&v1224 + 1) + 8 * ii);
                              objc_opt_class();
                              if (objc_opt_isKindOfClass())
                              {
                                [v353 unsignedIntValue];
                                os_unfair_lock_lock((os_unfair_lock_t)(v344 + 64));
                                if ((*(unsigned char *)(v344 + 68) & 2) == 0)
                                {
                                  v354 = *(void **)(v344 + 8);
                                  if (v354)
                                  {
                                    id v355 = v354;
                                    objc_sync_enter(v355);
                                    GEOPDSearchResultsForCategoryEntryReadSpecified(v344, *(void *)(v344 + 8), (int *)&_readPlaceIndexs_tags);
                                    objc_sync_exit(v355);
                                  }
                                }
                                os_unfair_lock_unlock((os_unfair_lock_t)(v344 + 64));
                                PBRepeatedUInt32Add();
                                os_unfair_lock_lock_with_options();
                                *(unsigned char *)(v344 + 68) |= 2u;
                                os_unfair_lock_unlock((os_unfair_lock_t)(v344 + 64));
                                *(unsigned char *)(v344 + 68) |= 8u;
                              }
                            }
                            uint64_t v350 = [v349 countByEnumeratingWithState:&v1224 objects:v1232 count:16];
                          }
                          while (v350);
                        }
                      }
                    }
                  }
                  else
                  {
                    uint64_t v344 = 0;
                  }
                  -[GEOPDSearchZeroKeywordWithSearchResultsSuggestionResult addSearchResultsForCategoryEntry:]((uint64_t)v1090, (void *)v344);
                }
                uint64_t v340 = v1161 + 1;
              }
              while ((id)(v1161 + 1) != v1126);
              uint64_t v356 = [v1102 countByEnumeratingWithState:&v1220 objects:&v1228 count:16];
              id v1126 = (id)v356;
            }
            while (v356);
          }

          v338 = v1063;
        }

        id v336 = v1056;
      }
    }
    else
    {
      v1090 = 0;
    }
    -[GEOPDPlaceGlobalResult setSearchZeroKeywordWithSearchResultsSuggestionResult:]((uint64_t)v1078, v1090);

    v333 = v1070;
  }

  if (a3) {
    v357 = @"externalTransitLookupResult";
  }
  else {
    v357 = @"external_transit_lookup_result";
  }
  v358 = [v1099 objectForKeyedSubscript:v357];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v359 = [GEOPDExternalTransitLookupResult alloc];
    if (v359)
    {
      id v360 = v358;
      v359 = [(GEOPDExternalTransitLookupResult *)v359 init];
      if (v359)
      {
        if (a3) {
          v361 = @"providerId";
        }
        else {
          v361 = @"provider_id";
        }
        v362 = [v360 objectForKeyedSubscript:v361];
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          v363 = (void *)[v362 copy];
          -[GEOPDExternalTransitLookupResult setProviderId:]((uint64_t)v359, v363);
        }
      }
    }
    -[GEOPDPlaceGlobalResult setExternalTransitLookupResult:]((uint64_t)v1078, v359);
  }
  if (a3) {
    v364 = @"featureIdGeocodingResult";
  }
  else {
    v364 = @"feature_id_geocoding_result";
  }
  v365 = [v1099 objectForKeyedSubscript:v364];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v366 = [GEOPDFeatureIdGeocodingResult alloc];
    id v367 = v365;
    if (v366) {
      v366 = [(GEOPDFeatureIdGeocodingResult *)v366 init];
    }

    -[GEOPDPlaceGlobalResult setFeatureIdGeocodingResult:]((uint64_t)v1078, v366);
  }

  if (a3) {
    v368 = @"mapsIdentifierPlaceLookupResult";
  }
  else {
    v368 = @"maps_identifier_place_lookup_result";
  }
  v369 = [v1099 objectForKeyedSubscript:v368];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v370 = [GEOPDMapsIdentifierPlaceLookupResult alloc];
    id v371 = v369;
    if (v370) {
      v370 = [(GEOPDMapsIdentifierPlaceLookupResult *)v370 init];
    }

    -[GEOPDPlaceGlobalResult setMapsIdentifierPlaceLookupResult:]((uint64_t)v1078, v370);
  }

  if (a3) {
    v372 = @"batchReverseGeocodingResult";
  }
  else {
    v372 = @"batch_reverse_geocoding_result";
  }
  v373 = [v1099 objectForKeyedSubscript:v372];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v374 = [GEOPDBatchReverseGeocodingResult alloc];
    id v375 = v373;
    if (v374) {
      v374 = [(GEOPDBatchReverseGeocodingResult *)v374 init];
    }

    -[GEOPDPlaceGlobalResult setBatchReverseGeocodingResult:]((uint64_t)v1078, v374);
  }

  if (a3) {
    v376 = @"brandLookupResult";
  }
  else {
    v376 = @"brand_lookup_result";
  }
  v377 = [v1099 objectForKeyedSubscript:v376];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v378 = [GEOPDBrandLookupResult alloc];
    id v379 = v377;
    if (v378) {
      v378 = [(GEOPDBrandLookupResult *)v378 init];
    }

    -[GEOPDPlaceGlobalResult setBrandLookupResult:]((uint64_t)v1078, v378);
  }

  if (a3) {
    v380 = @"wifiFingerprintResult";
  }
  else {
    v380 = @"wifi_fingerprint_result";
  }
  v381 = [v1099 objectForKeyedSubscript:v380];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v382 = [GEOPDWifiFingerprintResult alloc];
    id v383 = v381;
    if (v382) {
      v382 = [(GEOPDWifiFingerprintResult *)v382 init];
    }

    -[GEOPDPlaceGlobalResult setWifiFingerprintResult:]((uint64_t)v1078, v382);
  }

  if (a3) {
    v384 = @"ipGeoLookupResult";
  }
  else {
    v384 = @"ip_geo_lookup_result";
  }
  v385 = [v1099 objectForKeyedSubscript:v384];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v386 = [GEOPDIpGeoLookupResult alloc];
    if (!v386)
    {
LABEL_758:
      -[GEOPDPlaceGlobalResult setIpGeoLookupResult:]((uint64_t)v1078, v386);

      goto LABEL_759;
    }
    id v387 = v385;
    v386 = [(GEOPDIpGeoLookupResult *)v386 init];
    if (!v386)
    {
LABEL_757:

      goto LABEL_758;
    }
    v388 = [v387 objectForKeyedSubscript:@"status"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v389 = v388;
      if ([v389 isEqualToString:@"STATUS_SUCCESS"])
      {
        int v390 = 0;
      }
      else if ([v389 isEqualToString:@"STATUS_FAILED"])
      {
        int v390 = 1;
      }
      else if ([v389 isEqualToString:@"STATUS_INCOMPLETE"])
      {
        int v390 = 2;
      }
      else if ([v389 isEqualToString:@"INVALID_REQUEST"])
      {
        int v390 = 5;
      }
      else if ([v389 isEqualToString:@"FAILED_NO_RESULT"])
      {
        int v390 = 20;
      }
      else if ([v389 isEqualToString:@"NEEDS_REFINEMENT"])
      {
        int v390 = 30;
      }
      else if ([v389 isEqualToString:@"FAILED_NOT_AUTHORIZED"])
      {
        int v390 = 40;
      }
      else if ([v389 isEqualToString:@"STATUS_DEDUPED"])
      {
        int v390 = 50;
      }
      else if ([v389 isEqualToString:@"VERSION_MISMATCH"])
      {
        int v390 = 60;
      }
      else
      {
        int v390 = 0;
      }
    }
    else
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
LABEL_736:

        if (a3) {
          v391 = @"ipAddress";
        }
        else {
          v391 = @"ip_address";
        }
        v392 = [v387 objectForKeyedSubscript:v391];
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          v393 = (void *)[v392 copy];
          -[GEOPDIpGeoLookupResult setIpAddress:]((uint64_t)v386, v393);
        }
        v394 = [v387 objectForKeyedSubscript:@"location"];
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          v395 = [GEOLatLng alloc];
          if (a3) {
            v396 = [(GEOLatLng *)v395 initWithJSON:v394];
          }
          else {
            v396 = [(GEOLatLng *)v395 initWithDictionary:v394];
          }
          v397 = v396;
          -[GEOPDIpGeoLookupResult setLocation:]((uint64_t)v386, v396);
        }
        if (a3) {
          v398 = @"countryCode";
        }
        else {
          v398 = @"country_code";
        }
        v399 = [v387 objectForKeyedSubscript:v398];
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          v400 = (void *)[v399 copy];
          -[GEOPDIpGeoLookupResult setCountryCode:]((uint64_t)v386, v400);
        }
        if (a3) {
          v401 = @"timeZome";
        }
        else {
          v401 = @"time_zome";
        }
        v402 = [v387 objectForKeyedSubscript:v401];
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          v403 = (void *)[v402 copy];
          -[GEOPDIpGeoLookupResult setTimeZome:]((uint64_t)v386, v403);
        }
        goto LABEL_757;
      }
      int v390 = [v388 intValue];
    }
    *(unsigned char *)&v386->_flags |= 0x40u;
    *(unsigned char *)&v386->_flags |= 1u;
    v386->_status = v390;
    goto LABEL_736;
  }
LABEL_759:

  if (a3) {
    v404 = @"groundViewLabelResult";
  }
  else {
    v404 = @"ground_view_label_result";
  }
  v405 = [v1099 objectForKeyedSubscript:v404];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v406 = [GEOPDGroundViewLabelResult alloc];
    id v407 = v405;
    if (v406) {
      v406 = [(GEOPDGroundViewLabelResult *)v406 init];
    }

    -[GEOPDPlaceGlobalResult setGroundViewLabelResult:]((uint64_t)v1078, v406);
  }

  if (a3) {
    v408 = @"batchSpatialLookupResult";
  }
  else {
    v408 = @"batch_spatial_lookup_result";
  }
  id v1091 = [v1099 objectForKeyedSubscript:v408];
  objc_opt_class();
  v409 = v1091;
  if (objc_opt_isKindOfClass())
  {
    v410 = [GEOPDBatchSpatialLookupResult alloc];
    if (!v410)
    {
      v1139 = 0;
      goto LABEL_931;
    }
    v411 = v410;
    id v412 = v1091;
    v1139 = [(GEOPDBatchSpatialLookupResult *)v411 init];
    if (!v1139)
    {
LABEL_930:

LABEL_931:
      -[GEOPDPlaceGlobalResult setBatchSpatialLookupResult:]((uint64_t)v1078, v1139);

      v409 = v1091;
      goto LABEL_932;
    }
    if (a3) {
      v413 = @"statusCode";
    }
    else {
      v413 = @"status_code";
    }
    v1082 = v412;
    v1127 = v413;
    v414 = objc_msgSend(v412, "objectForKeyedSubscript:");
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v415 = v414;
      if ([v415 isEqualToString:@"STATUS_SUCCESS"])
      {
        int v416 = 0;
      }
      else if ([v415 isEqualToString:@"STATUS_FAILED"])
      {
        int v416 = 1;
      }
      else if ([v415 isEqualToString:@"STATUS_INCOMPLETE"])
      {
        int v416 = 2;
      }
      else if ([v415 isEqualToString:@"INVALID_REQUEST"])
      {
        int v416 = 5;
      }
      else if ([v415 isEqualToString:@"FAILED_NO_RESULT"])
      {
        int v416 = 20;
      }
      else if ([v415 isEqualToString:@"NEEDS_REFINEMENT"])
      {
        int v416 = 30;
      }
      else if ([v415 isEqualToString:@"FAILED_NOT_AUTHORIZED"])
      {
        int v416 = 40;
      }
      else if ([v415 isEqualToString:@"STATUS_DEDUPED"])
      {
        int v416 = 50;
      }
      else if ([v415 isEqualToString:@"VERSION_MISMATCH"])
      {
        int v416 = 60;
      }
      else
      {
        int v416 = 0;
      }
    }
    else
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
LABEL_799:

        if (a3) {
          v417 = @"spatialPlaceLookupResult";
        }
        else {
          v417 = @"spatial_place_lookup_result";
        }
        v1071 = [v1082 objectForKeyedSubscript:v417];
        objc_opt_class();
        v418 = v1071;
        if (objc_opt_isKindOfClass())
        {
          long long v1219 = 0u;
          long long v1218 = 0u;
          long long v1217 = 0u;
          long long v1216 = 0u;
          id objc = v1071;
          uint64_t v1162 = [objc countByEnumeratingWithState:&v1216 objects:&v1228 count:16];
          if (!v1162) {
            goto LABEL_863;
          }
          v419 = @"display_map_region";
          uint64_t v1150 = *(void *)v1217;
          if (a3) {
            v419 = @"displayMapRegion";
          }
          v1103 = v419;
          while (1)
          {
            uint64_t v420 = 0;
            do
            {
              if (*(void *)v1217 != v1150) {
                objc_enumerationMutation(objc);
              }
              v421 = *(void **)(*((void *)&v1216 + 1) + 8 * v420);
              objc_opt_class();
              if (objc_opt_isKindOfClass())
              {
                v422 = [GEOPDSpatialPlaceLookupResult alloc];
                if (v422)
                {
                  id v423 = v421;
                  uint64_t v424 = [(GEOPDSpatialPlaceLookupResult *)v422 init];
                  if (v424)
                  {
                    v425 = [v423 objectForKeyedSubscript:v1127];
                    objc_opt_class();
                    if (objc_opt_isKindOfClass())
                    {
                      id v426 = v425;
                      if ([v426 isEqualToString:@"STATUS_SUCCESS"])
                      {
                        int v427 = 0;
                      }
                      else if ([v426 isEqualToString:@"STATUS_FAILED"])
                      {
                        int v427 = 1;
                      }
                      else if ([v426 isEqualToString:@"STATUS_INCOMPLETE"])
                      {
                        int v427 = 2;
                      }
                      else if ([v426 isEqualToString:@"INVALID_REQUEST"])
                      {
                        int v427 = 5;
                      }
                      else if ([v426 isEqualToString:@"FAILED_NO_RESULT"])
                      {
                        int v427 = 20;
                      }
                      else if ([v426 isEqualToString:@"NEEDS_REFINEMENT"])
                      {
                        int v427 = 30;
                      }
                      else if ([v426 isEqualToString:@"FAILED_NOT_AUTHORIZED"])
                      {
                        int v427 = 40;
                      }
                      else if ([v426 isEqualToString:@"STATUS_DEDUPED"])
                      {
                        int v427 = 50;
                      }
                      else if ([v426 isEqualToString:@"VERSION_MISMATCH"])
                      {
                        int v427 = 60;
                      }
                      else
                      {
                        int v427 = 0;
                      }

LABEL_836:
                      *(unsigned char *)(v424 + 56) |= 0x10u;
                      *(unsigned char *)(v424 + 56) |= 1u;
                      *(_DWORD *)(v424 + 52) = v427;
                    }
                    else
                    {
                      objc_opt_class();
                      if (objc_opt_isKindOfClass())
                      {
                        int v427 = [v425 intValue];
                        goto LABEL_836;
                      }
                    }

                    v428 = [v423 objectForKeyedSubscript:@"place"];
                    objc_opt_class();
                    if (objc_opt_isKindOfClass())
                    {
                      long long v1227 = 0u;
                      long long v1226 = 0u;
                      long long v1225 = 0u;
                      long long v1224 = 0u;
                      id v429 = v428;
                      uint64_t v430 = [v429 countByEnumeratingWithState:&v1224 objects:v1232 count:16];
                      if (v430)
                      {
                        uint64_t v431 = *(void *)v1225;
                        do
                        {
                          for (juint64_t j = 0; jj != v430; ++jj)
                          {
                            if (*(void *)v1225 != v431) {
                              objc_enumerationMutation(v429);
                            }
                            uint64_t v433 = *(void *)(*((void *)&v1224 + 1) + 8 * jj);
                            objc_opt_class();
                            if (objc_opt_isKindOfClass())
                            {
                              v434 = [GEOPDSpatialPlaceLookupResponse alloc];
                              if (a3) {
                                v435 = [(GEOPDSpatialPlaceLookupResponse *)v434 initWithJSON:v433];
                              }
                              else {
                                v435 = [(GEOPDSpatialPlaceLookupResponse *)v434 initWithDictionary:v433];
                              }
                              v436 = v435;
                              -[GEOPDSpatialPlaceLookupResult addPlace:](v424, v435);
                            }
                          }
                          uint64_t v430 = [v429 countByEnumeratingWithState:&v1224 objects:v1232 count:16];
                        }
                        while (v430);
                      }
                    }
                    v437 = [v423 objectForKeyedSubscript:v1103];
                    objc_opt_class();
                    if (objc_opt_isKindOfClass())
                    {
                      v438 = [GEOMapRegion alloc];
                      if (a3) {
                        v439 = [(GEOMapRegion *)v438 initWithJSON:v437];
                      }
                      else {
                        v439 = [(GEOMapRegion *)v438 initWithDictionary:v437];
                      }
                      v440 = v439;
                      v441 = v439;
                      *(unsigned char *)(v424 + 56) |= 4u;
                      *(unsigned char *)(v424 + 56) |= 0x10u;
                      objc_storeStrong((id *)(v424 + 24), v440);
                    }
                  }
                }
                else
                {
                  uint64_t v424 = 0;
                }
                -[GEOPDBatchSpatialLookupResult addSpatialPlaceLookupResult:]((uint64_t)v1139, (void *)v424);
              }
              ++v420;
            }
            while (v420 != v1162);
            uint64_t v442 = [objc countByEnumeratingWithState:&v1216 objects:&v1228 count:16];
            uint64_t v1162 = v442;
            if (!v442)
            {
LABEL_863:

              v418 = v1071;
              break;
            }
          }
        }

        if (a3) {
          v443 = @"spatialEventLookupResult";
        }
        else {
          v443 = @"spatial_event_lookup_result";
        }
        v1072 = [v1082 objectForKeyedSubscript:v443];
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          long long v1215 = 0u;
          long long v1214 = 0u;
          long long v1213 = 0u;
          long long v1212 = 0u;
          id objd = v1072;
          uint64_t v1163 = [objd countByEnumeratingWithState:&v1212 objects:&v1224 count:16];
          if (!v1163) {
            goto LABEL_928;
          }
          v444 = @"display_map_region";
          uint64_t v1151 = *(void *)v1213;
          if (a3) {
            v444 = @"displayMapRegion";
          }
          v1104 = v444;
          while (1)
          {
            uint64_t v445 = 0;
            do
            {
              if (*(void *)v1213 != v1151) {
                objc_enumerationMutation(objd);
              }
              v446 = *(void **)(*((void *)&v1212 + 1) + 8 * v445);
              objc_opt_class();
              if (objc_opt_isKindOfClass())
              {
                v447 = [GEOPDSpatialEventLookupResult alloc];
                if (v447)
                {
                  id v448 = v446;
                  uint64_t v449 = [(GEOPDSpatialEventLookupResult *)v447 init];
                  if (v449)
                  {
                    v450 = [v448 objectForKeyedSubscript:v1127];
                    objc_opt_class();
                    if (objc_opt_isKindOfClass())
                    {
                      id v451 = v450;
                      if ([v451 isEqualToString:@"STATUS_SUCCESS"])
                      {
                        int v452 = 0;
                      }
                      else if ([v451 isEqualToString:@"STATUS_FAILED"])
                      {
                        int v452 = 1;
                      }
                      else if ([v451 isEqualToString:@"STATUS_INCOMPLETE"])
                      {
                        int v452 = 2;
                      }
                      else if ([v451 isEqualToString:@"INVALID_REQUEST"])
                      {
                        int v452 = 5;
                      }
                      else if ([v451 isEqualToString:@"FAILED_NO_RESULT"])
                      {
                        int v452 = 20;
                      }
                      else if ([v451 isEqualToString:@"NEEDS_REFINEMENT"])
                      {
                        int v452 = 30;
                      }
                      else if ([v451 isEqualToString:@"FAILED_NOT_AUTHORIZED"])
                      {
                        int v452 = 40;
                      }
                      else if ([v451 isEqualToString:@"STATUS_DEDUPED"])
                      {
                        int v452 = 50;
                      }
                      else if ([v451 isEqualToString:@"VERSION_MISMATCH"])
                      {
                        int v452 = 60;
                      }
                      else
                      {
                        int v452 = 0;
                      }

LABEL_901:
                      *(unsigned char *)(v449 + 56) |= 0x10u;
                      *(unsigned char *)(v449 + 56) |= 1u;
                      *(_DWORD *)(v449 + 52) = v452;
                    }
                    else
                    {
                      objc_opt_class();
                      if (objc_opt_isKindOfClass())
                      {
                        int v452 = [v450 intValue];
                        goto LABEL_901;
                      }
                    }

                    v453 = [v448 objectForKeyedSubscript:@"event"];
                    objc_opt_class();
                    if (objc_opt_isKindOfClass())
                    {
                      long long v1223 = 0u;
                      long long v1222 = 0u;
                      long long v1221 = 0u;
                      long long v1220 = 0u;
                      id v454 = v453;
                      uint64_t v455 = [v454 countByEnumeratingWithState:&v1220 objects:v1232 count:16];
                      if (v455)
                      {
                        uint64_t v456 = *(void *)v1221;
                        do
                        {
                          for (uint64_t kk = 0; kk != v455; ++kk)
                          {
                            if (*(void *)v1221 != v456) {
                              objc_enumerationMutation(v454);
                            }
                            uint64_t v458 = *(void *)(*((void *)&v1220 + 1) + 8 * kk);
                            objc_opt_class();
                            if (objc_opt_isKindOfClass())
                            {
                              v459 = [GEOPDSpatialEventLookupResponse alloc];
                              if (a3) {
                                v460 = [(GEOPDSpatialEventLookupResponse *)v459 initWithJSON:v458];
                              }
                              else {
                                v460 = [(GEOPDSpatialEventLookupResponse *)v459 initWithDictionary:v458];
                              }
                              v461 = v460;
                              -[GEOPDSpatialEventLookupResult addEvent:](v449, v460);
                            }
                          }
                          uint64_t v455 = [v454 countByEnumeratingWithState:&v1220 objects:v1232 count:16];
                        }
                        while (v455);
                      }
                    }
                    v462 = [v448 objectForKeyedSubscript:v1104];
                    objc_opt_class();
                    if (objc_opt_isKindOfClass())
                    {
                      v463 = [GEOMapRegion alloc];
                      if (a3) {
                        v464 = [(GEOMapRegion *)v463 initWithJSON:v462];
                      }
                      else {
                        v464 = [(GEOMapRegion *)v463 initWithDictionary:v462];
                      }
                      v465 = v464;
                      v466 = v464;
                      *(unsigned char *)(v449 + 56) |= 4u;
                      *(unsigned char *)(v449 + 56) |= 0x10u;
                      objc_storeStrong((id *)(v449 + 24), v465);
                    }
                  }
                }
                else
                {
                  uint64_t v449 = 0;
                }
                -[GEOPDBatchSpatialLookupResult addSpatialEventLookupResult:]((uint64_t)v1139, (void *)v449);
              }
              ++v445;
            }
            while (v445 != v1163);
            uint64_t v467 = [objd countByEnumeratingWithState:&v1212 objects:&v1224 count:16];
            uint64_t v1163 = v467;
            if (!v467)
            {
LABEL_928:

              break;
            }
          }
        }

        id v412 = v1082;
        goto LABEL_930;
      }
      int v416 = [v414 intValue];
    }
    *(unsigned char *)&v1139->_flags |= 0x10u;
    *(unsigned char *)&v1139->_flags |= 1u;
    v1139->_statusCode = v416;
    goto LABEL_799;
  }
LABEL_932:

  if (a3) {
    v468 = @"placeGlobalCommonResult";
  }
  else {
    v468 = @"place_global_common_result";
  }
  v469 = [v1099 objectForKeyedSubscript:v468];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v470 = [GEOPDPlaceGlobalCommonResult alloc];
    if (v470)
    {
      id v471 = v469;
      v470 = [(GEOPDPlaceGlobalCommonResult *)v470 init];
      if (v470)
      {
        if (a3) {
          v472 = @"placeContextMetadata";
        }
        else {
          v472 = @"place_context_metadata";
        }
        v473 = [v471 objectForKeyedSubscript:v472];
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          long long v1231 = 0u;
          long long v1230 = 0u;
          long long v1229 = 0u;
          long long v1228 = 0u;
          id v474 = v473;
          uint64_t v475 = [v474 countByEnumeratingWithState:&v1228 objects:v1232 count:16];
          if (v475)
          {
            uint64_t v476 = *(void *)v1229;
            do
            {
              uint64_t v477 = 0;
              do
              {
                if (*(void *)v1229 != v476) {
                  objc_enumerationMutation(v474);
                }
                v478 = *(void **)(*((void *)&v1228 + 1) + 8 * v477);
                objc_opt_class();
                if (objc_opt_isKindOfClass())
                {
                  v479 = [GEOPDPlaceContextMetadata alloc];
                  if (v479) {
                    v480 = (void *)-[GEOPDPlaceContextMetadata _initWithDictionary:isJSON:](v479, v478, a3);
                  }
                  else {
                    v480 = 0;
                  }
                  -[GEOPDPlaceGlobalCommonResult addPlaceContextMetadata:]((uint64_t)v470, v480);
                }
                ++v477;
              }
              while (v475 != v477);
              uint64_t v481 = [v474 countByEnumeratingWithState:&v1228 objects:v1232 count:16];
              uint64_t v475 = v481;
            }
            while (v481);
          }
        }
      }
    }
    -[GEOPDPlaceGlobalResult setPlaceGlobalCommonResult:]((uint64_t)v1078, v470);
  }
  if (a3) {
    v482 = @"placeCollectionLookupResult";
  }
  else {
    v482 = @"place_collection_lookup_result";
  }
  v483 = [v1099 objectForKeyedSubscript:v482];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v484 = [GEOPDPlaceCollectionLookupResult alloc];
    if (v484)
    {
      id v485 = v483;
      v484 = [(GEOPDPlaceCollectionLookupResult *)v484 init];
      if (v484)
      {
        if (a3) {
          v486 = @"collectionComponent";
        }
        else {
          v486 = @"collection_component";
        }
        v487 = [v485 objectForKeyedSubscript:v486];
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          v488 = [GEOPDComponent alloc];
          if (v488) {
            v489 = -[GEOPDComponent _initWithDictionary:isJSON:]((char *)v488, v487, a3);
          }
          else {
            v489 = 0;
          }
          -[GEOPDPlaceCollectionLookupResult setCollectionComponent:]((uint64_t)v484, v489);
        }
      }
    }
    -[GEOPDPlaceGlobalResult setPlaceCollectionLookupResult:]((uint64_t)v1078, v484);
  }
  if (a3) {
    v490 = @"transitScheduleLookupResult";
  }
  else {
    v490 = @"transit_schedule_lookup_result";
  }
  v491 = [v1099 objectForKeyedSubscript:v490];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v492 = [GEOPDTransitScheduleLookupResult alloc];
    id v493 = v491;
    if (v492) {
      v492 = [(GEOPDTransitScheduleLookupResult *)v492 init];
    }

    -[GEOPDPlaceGlobalResult setTransitScheduleLookupResult:]((uint64_t)v1078, v492);
  }

  if (a3) {
    v494 = @"batchCategoryLookupResult";
  }
  else {
    v494 = @"batch_category_lookup_result";
  }
  id v1128 = [v1099 objectForKeyedSubscript:v494];
  objc_opt_class();
  v495 = v1128;
  if (objc_opt_isKindOfClass())
  {
    v496 = [GEOPDBatchCategoryLookupResult alloc];
    if (v496)
    {
      v497 = v496;
      id v498 = v1128;
      v1164 = [(GEOPDBatchCategoryLookupResult *)v497 init];
      if (v1164)
      {
        if (a3) {
          v499 = @"categoryLookupResult";
        }
        else {
          v499 = @"category_lookup_result";
        }
        id v1105 = v498;
        id obje = [v498 objectForKeyedSubscript:v499];
        objc_opt_class();
        v500 = obje;
        if (objc_opt_isKindOfClass())
        {
          long long v1231 = 0u;
          long long v1230 = 0u;
          long long v1229 = 0u;
          long long v1228 = 0u;
          id v501 = obje;
          uint64_t v502 = [v501 countByEnumeratingWithState:&v1228 objects:v1232 count:16];
          if (v502)
          {
            uint64_t v503 = *(void *)v1229;
            if (a3) {
              v504 = @"categoryLookupParam";
            }
            else {
              v504 = @"category_lookup_param";
            }
            v505 = @"category_info";
            if (a3) {
              v505 = @"categoryInfo";
            }
            v1140 = v505;
            v1152 = v504;
            do
            {
              uint64_t v506 = 0;
              do
              {
                if (*(void *)v1229 != v503) {
                  objc_enumerationMutation(v501);
                }
                v507 = *(void **)(*((void *)&v1228 + 1) + 8 * v506);
                objc_opt_class();
                if (objc_opt_isKindOfClass())
                {
                  v508 = [GEOPDCategoryLookupResult alloc];
                  if (v508)
                  {
                    id v509 = v507;
                    uint64_t v510 = [(GEOPDCategoryLookupResult *)v508 init];
                    if (v510)
                    {
                      v511 = [v509 objectForKeyedSubscript:v1152];
                      objc_opt_class();
                      if (objc_opt_isKindOfClass())
                      {
                        v512 = [GEOPDCategoryLookupParameters alloc];
                        if (v512) {
                          v513 = (void *)-[GEOPDCategoryLookupParameters _initWithDictionary:isJSON:]((uint64_t)v512, v511, a3);
                        }
                        else {
                          v513 = 0;
                        }
                        id v514 = v513;
                        *(unsigned char *)(v510 + 52) |= 4u;
                        *(unsigned char *)(v510 + 52) |= 8u;
                        objc_storeStrong((id *)(v510 + 32), v513);
                      }
                      v515 = [v509 objectForKeyedSubscript:v1140];
                      objc_opt_class();
                      if (objc_opt_isKindOfClass())
                      {
                        v516 = [GEOPDCategoryInformation alloc];
                        if (a3) {
                          v517 = [(GEOPDCategoryInformation *)v516 initWithJSON:v515];
                        }
                        else {
                          v517 = [(GEOPDCategoryInformation *)v516 initWithDictionary:v515];
                        }
                        v518 = v517;
                        v519 = v517;
                        *(unsigned char *)(v510 + 52) |= 2u;
                        *(unsigned char *)(v510 + 52) |= 8u;
                        objc_storeStrong((id *)(v510 + 24), v518);
                      }
                    }
                  }
                  else
                  {
                    uint64_t v510 = 0;
                  }
                  -[GEOPDBatchCategoryLookupResult addCategoryLookupResult:]((uint64_t)v1164, (void *)v510);
                }
                ++v506;
              }
              while (v502 != v506);
              uint64_t v520 = [v501 countByEnumeratingWithState:&v1228 objects:v1232 count:16];
              uint64_t v502 = v520;
            }
            while (v520);
          }

          v500 = obje;
        }

        id v498 = v1105;
      }
    }
    else
    {
      v1164 = 0;
    }
    -[GEOPDPlaceGlobalResult setBatchCategoryLookupResult:]((uint64_t)v1078, v1164);

    v495 = v1128;
  }

  if (a3) {
    v521 = @"batchMerchantLookupBrandResult";
  }
  else {
    v521 = @"batch_merchant_lookup_brand_result";
  }
  id v1092 = [v1099 objectForKeyedSubscript:v521];
  objc_opt_class();
  v522 = v1092;
  if (objc_opt_isKindOfClass())
  {
    v523 = [GEOPDBatchMerchantLookupBrandResult alloc];
    if (!v523)
    {
      v1129 = 0;
      goto LABEL_1119;
    }
    v524 = v523;
    id v525 = v1092;
    v1129 = [(GEOPDBatchMerchantLookupBrandResult *)v524 init];
    if (!v1129)
    {
LABEL_1118:

LABEL_1119:
      -[GEOPDPlaceGlobalResult setBatchMerchantLookupBrandResult:]((uint64_t)v1078, v1129);

      v522 = v1092;
      goto LABEL_1120;
    }
    if (a3) {
      v526 = @"statusCode";
    }
    else {
      v526 = @"status_code";
    }
    id v1083 = v525;
    objf = v526;
    v527 = objc_msgSend(v525, "objectForKeyedSubscript:");
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v528 = v527;
      if ([v528 isEqualToString:@"STATUS_SUCCESS"])
      {
        int v529 = 0;
      }
      else if ([v528 isEqualToString:@"STATUS_FAILED"])
      {
        int v529 = 1;
      }
      else if ([v528 isEqualToString:@"STATUS_INCOMPLETE"])
      {
        int v529 = 2;
      }
      else if ([v528 isEqualToString:@"INVALID_REQUEST"])
      {
        int v529 = 5;
      }
      else if ([v528 isEqualToString:@"FAILED_NO_RESULT"])
      {
        int v529 = 20;
      }
      else if ([v528 isEqualToString:@"NEEDS_REFINEMENT"])
      {
        int v529 = 30;
      }
      else if ([v528 isEqualToString:@"FAILED_NOT_AUTHORIZED"])
      {
        int v529 = 40;
      }
      else if ([v528 isEqualToString:@"STATUS_DEDUPED"])
      {
        int v529 = 50;
      }
      else if ([v528 isEqualToString:@"VERSION_MISMATCH"])
      {
        int v529 = 60;
      }
      else
      {
        int v529 = 0;
      }
    }
    else
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
LABEL_1059:

        if (a3) {
          v530 = @"merchantLookupBrandResult";
        }
        else {
          v530 = @"merchant_lookup_brand_result";
        }
        v1073 = [v525 objectForKeyedSubscript:v530];
        objc_opt_class();
        v531 = v1073;
        if (objc_opt_isKindOfClass())
        {
          long long v1223 = 0u;
          long long v1222 = 0u;
          long long v1221 = 0u;
          long long v1220 = 0u;
          id v1141 = v1073;
          uint64_t v1165 = [v1141 countByEnumeratingWithState:&v1220 objects:&v1228 count:16];
          if (!v1165) {
            goto LABEL_1116;
          }
          v532 = @"merchant_brand_lookup_response";
          uint64_t v1153 = *(void *)v1221;
          if (a3) {
            v532 = @"merchantBrandLookupResponse";
          }
          v1106 = v532;
          while (1)
          {
            for (muint64_t m = 0; mm != v1165; ++mm)
            {
              if (*(void *)v1221 != v1153) {
                objc_enumerationMutation(v1141);
              }
              v534 = *(void **)(*((void *)&v1220 + 1) + 8 * mm);
              objc_opt_class();
              if (objc_opt_isKindOfClass())
              {
                v535 = [GEOPDMerchantLookupBrandResult alloc];
                if (v535)
                {
                  id v536 = v534;
                  v535 = [(GEOPDMerchantLookupBrandResult *)v535 init];
                  if (v535)
                  {
                    v537 = [v536 objectForKeyedSubscript:objf];
                    objc_opt_class();
                    if (objc_opt_isKindOfClass())
                    {
                      id v538 = v537;
                      if ([v538 isEqualToString:@"STATUS_SUCCESS"])
                      {
                        int v539 = 0;
                      }
                      else if ([v538 isEqualToString:@"STATUS_FAILED"])
                      {
                        int v539 = 1;
                      }
                      else if ([v538 isEqualToString:@"STATUS_INCOMPLETE"])
                      {
                        int v539 = 2;
                      }
                      else if ([v538 isEqualToString:@"INVALID_REQUEST"])
                      {
                        int v539 = 5;
                      }
                      else if ([v538 isEqualToString:@"FAILED_NO_RESULT"])
                      {
                        int v539 = 20;
                      }
                      else if ([v538 isEqualToString:@"NEEDS_REFINEMENT"])
                      {
                        int v539 = 30;
                      }
                      else if ([v538 isEqualToString:@"FAILED_NOT_AUTHORIZED"])
                      {
                        int v539 = 40;
                      }
                      else if ([v538 isEqualToString:@"STATUS_DEDUPED"])
                      {
                        int v539 = 50;
                      }
                      else if ([v538 isEqualToString:@"VERSION_MISMATCH"])
                      {
                        int v539 = 60;
                      }
                      else
                      {
                        int v539 = 0;
                      }

LABEL_1096:
                      *(unsigned char *)&v535->_flags |= 1u;
                      v535->_statusCode = v539;
                    }
                    else
                    {
                      objc_opt_class();
                      if (objc_opt_isKindOfClass())
                      {
                        int v539 = [v537 intValue];
                        goto LABEL_1096;
                      }
                    }

                    v540 = [v536 objectForKeyedSubscript:v1106];
                    objc_opt_class();
                    if (objc_opt_isKindOfClass())
                    {
                      long long v1227 = 0u;
                      long long v1226 = 0u;
                      long long v1225 = 0u;
                      long long v1224 = 0u;
                      id v541 = v540;
                      uint64_t v542 = [v541 countByEnumeratingWithState:&v1224 objects:v1232 count:16];
                      if (v542)
                      {
                        uint64_t v543 = *(void *)v1225;
                        do
                        {
                          for (nuint64_t n = 0; nn != v542; ++nn)
                          {
                            if (*(void *)v1225 != v543) {
                              objc_enumerationMutation(v541);
                            }
                            uint64_t v545 = *(void *)(*((void *)&v1224 + 1) + 8 * nn);
                            objc_opt_class();
                            if (objc_opt_isKindOfClass())
                            {
                              v546 = [GEOPDMerchantBrandLookupResponse alloc];
                              if (a3) {
                                v547 = [(GEOPDMerchantBrandLookupResponse *)v546 initWithJSON:v545];
                              }
                              else {
                                v547 = [(GEOPDMerchantBrandLookupResponse *)v546 initWithDictionary:v545];
                              }
                              v548 = v547;
                              -[GEOPDMerchantLookupBrandResult addMerchantBrandLookupResponse:]((uint64_t)v535, v547);
                            }
                          }
                          uint64_t v542 = [v541 countByEnumeratingWithState:&v1224 objects:v1232 count:16];
                        }
                        while (v542);
                      }
                    }
                  }
                }
                -[GEOPDBatchMerchantLookupBrandResult addMerchantLookupBrandResult:]((uint64_t)v1129, v535);

                continue;
              }
            }
            uint64_t v1165 = [v1141 countByEnumeratingWithState:&v1220 objects:&v1228 count:16];
            if (!v1165)
            {
LABEL_1116:

              v531 = v1073;
              break;
            }
          }
        }

        id v525 = v1083;
        goto LABEL_1118;
      }
      int v529 = [v527 intValue];
    }
    *(unsigned char *)&v1129->_flags |= 1u;
    v1129->_statusCode = v529;
    goto LABEL_1059;
  }
LABEL_1120:

  if (a3) {
    v549 = @"childPlaceLookupByCategoryResult";
  }
  else {
    v549 = @"child_place_lookup_by_category_result";
  }
  v550 = [v1099 objectForKeyedSubscript:v549];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v551 = [GEOPDChildPlaceLookupByCategoryResult alloc];
    id v552 = v550;
    if (v551) {
      v551 = [(GEOPDChildPlaceLookupByCategoryResult *)v551 init];
    }

    -[GEOPDPlaceGlobalResult setChildPlaceLookupByCategoryResult:]((uint64_t)v1078, v551);
  }

  if (a3) {
    v553 = @"mapsSearchHomeResult";
  }
  else {
    v553 = @"maps_search_home_result";
  }
  v1039 = [v1099 objectForKeyedSubscript:v553];
  objc_opt_class();
  v554 = v1039;
  if (objc_opt_isKindOfClass())
  {
    v555 = [GEOPDMapsSearchHomeResult alloc];
    if (v555)
    {
      v556 = v555;
      id v557 = v1039;
      v1107 = [(GEOPDMapsSearchHomeResult *)v556 init];
      if (v1107)
      {
        if (a3) {
          v558 = @"mapsSearchHomeSection";
        }
        else {
          v558 = @"maps_search_home_section";
        }
        id v1035 = v557;
        v1037 = [v557 objectForKeyedSubscript:v558];
        objc_opt_class();
        v559 = v1037;
        if (objc_opt_isKindOfClass())
        {
          long long v1223 = 0u;
          long long v1222 = 0u;
          long long v1221 = 0u;
          long long v1220 = 0u;
          id objg = v1037;
          uint64_t v1154 = [objg countByEnumeratingWithState:&v1220 objects:&v1228 count:16];
          if (!v1154) {
            goto LABEL_1256;
          }
          v560 = @"section_type";
          id v1142 = *(id *)v1221;
          if (a3) {
            v560 = @"sectionType";
          }
          v1084 = v560;
          if (a3) {
            v561 = @"searchBrowseCategorySuggestionResult";
          }
          else {
            v561 = @"search_browse_category_suggestion_result";
          }
          v1074 = v561;
          v562 = @"publisher_suggestion_result";
          v563 = @"collection_suggestion_result";
          if (a3)
          {
            v563 = @"collectionSuggestionResult";
            v562 = @"publisherSuggestionResult";
          }
          v1057 = v562;
          v1064 = v563;
          if (a3) {
            v564 = @"placeSuggestionResult";
          }
          else {
            v564 = @"place_suggestion_result";
          }
          v565 = @"place_id";
          if (a3) {
            v565 = @"placeId";
          }
          v1045 = v565;
          v566 = @"guides_locations_suggestion_result";
          if (a3) {
            v566 = @"guidesLocationsSuggestionResult";
          }
          v1048 = v566;
          v1052 = v564;
          if (a3) {
            v567 = @"exploreGuidesEntry";
          }
          else {
            v567 = @"explore_guides_entry";
          }
          v568 = @"explore_image_url_template";
          if (a3) {
            v568 = @"exploreImageUrlTemplate";
          }
          v1041 = v568;
          v1043 = v567;
          while (1)
          {
            uint64_t v569 = 0;
            do
            {
              if (*(id *)v1221 != v1142) {
                objc_enumerationMutation(objg);
              }
              v570 = *(void **)(*((void *)&v1220 + 1) + 8 * v569);
              objc_opt_class();
              if (objc_opt_isKindOfClass())
              {
                v571 = [GEOPDMapsSearchHomeSection alloc];
                if (v571)
                {
                  id v1166 = v570;
                  uint64_t v572 = [(GEOPDMapsSearchHomeSection *)v571 init];
                  if (v572)
                  {
                    v573 = [v1166 objectForKeyedSubscript:v1084];
                    objc_opt_class();
                    if (objc_opt_isKindOfClass())
                    {
                      id v574 = v573;
                      if ([v574 isEqualToString:@"UNKNOWN"])
                      {
                        int v575 = 0;
                      }
                      else if ([v574 isEqualToString:@"SEARCH_BROWSE_CATEGORY_SUGGESTION_RESULT"])
                      {
                        int v575 = 1;
                      }
                      else if ([v574 isEqualToString:@"COLLECTION_SUGGESTION_RESULT"])
                      {
                        int v575 = 2;
                      }
                      else if ([v574 isEqualToString:@"PUBLISHER_SUGGESTION_RESULT"])
                      {
                        int v575 = 3;
                      }
                      else if ([v574 isEqualToString:@"PLACE_SUGGESTION_RESULT"])
                      {
                        int v575 = 4;
                      }
                      else if ([v574 isEqualToString:@"GUIDE_LOCATION_SUGGESTION_RESULT"])
                      {
                        int v575 = 5;
                      }
                      else
                      {
                        int v575 = 0;
                      }

LABEL_1181:
                      *(_WORD *)(v572 + 88) |= 0x100u;
                      *(_WORD *)(v572 + 88) |= 1u;
                      *(_DWORD *)(v572 + 84) = v575;
                    }
                    else
                    {
                      objc_opt_class();
                      if (objc_opt_isKindOfClass())
                      {
                        int v575 = [v573 intValue];
                        goto LABEL_1181;
                      }
                    }

                    v576 = [v1166 objectForKeyedSubscript:@"name"];
                    objc_opt_class();
                    if (objc_opt_isKindOfClass())
                    {
                      v577 = (void *)[v576 copy];
                      id v578 = v577;
                      *(_WORD *)(v572 + 88) |= 0x10u;
                      *(_WORD *)(v572 + 88) |= 0x100u;
                      objc_storeStrong((id *)(v572 + 40), v577);
                    }
                    v579 = [v1166 objectForKeyedSubscript:v1074];
                    objc_opt_class();
                    if (objc_opt_isKindOfClass())
                    {
                      v580 = [GEOPDSearchBrowseCategorySuggestionResult alloc];
                      if (v580) {
                        v581 = (void *)-[GEOPDSearchBrowseCategorySuggestionResult _initWithDictionary:isJSON:](v580, v579, a3);
                      }
                      else {
                        v581 = 0;
                      }
                      id v582 = v581;
                      *(_WORD *)(v572 + 88) |= 0x80u;
                      *(_WORD *)(v572 + 88) |= 0x100u;
                      objc_storeStrong((id *)(v572 + 64), v581);
                    }
                    v583 = [v1166 objectForKeyedSubscript:v1064];
                    objc_opt_class();
                    if (objc_opt_isKindOfClass())
                    {
                      v584 = [GEOPDCollectionSuggestionResult alloc];
                      if (v584) {
                        v585 = (void *)-[GEOPDCollectionSuggestionResult _initWithDictionary:isJSON:](v584, v583, a3);
                      }
                      else {
                        v585 = 0;
                      }
                      id v586 = v585;
                      *(_WORD *)(v572 + 88) |= 4u;
                      *(_WORD *)(v572 + 88) |= 0x100u;
                      objc_storeStrong((id *)(v572 + 24), v585);
                    }
                    v587 = [v1166 objectForKeyedSubscript:v1057];
                    objc_opt_class();
                    if (objc_opt_isKindOfClass())
                    {
                      v588 = [GEOPDPublisherSuggestionResult alloc];
                      if (v588) {
                        v589 = (void *)-[GEOPDPublisherSuggestionResult _initWithDictionary:isJSON:](v588, v587, a3);
                      }
                      else {
                        v589 = 0;
                      }
                      id v590 = v589;
                      *(_WORD *)(v572 + 88) |= 0x40u;
                      *(_WORD *)(v572 + 88) |= 0x100u;
                      objc_storeStrong((id *)(v572 + 56), v589);
                    }
                    v591 = [v1166 objectForKeyedSubscript:v1052];
                    objc_opt_class();
                    if (objc_opt_isKindOfClass())
                    {
                      v592 = [GEOPDPlaceSuggestionResult alloc];
                      if (v592)
                      {
                        id v1130 = v591;
                        v593 = [(GEOPDPlaceSuggestionResult *)v592 init];
                        if (v593)
                        {
                          id v1093 = [v1130 objectForKeyedSubscript:v1045];
                          objc_opt_class();
                          if (objc_opt_isKindOfClass())
                          {
                            long long v1227 = 0u;
                            long long v1226 = 0u;
                            long long v1225 = 0u;
                            long long v1224 = 0u;
                            id v594 = v1093;
                            uint64_t v595 = [v594 countByEnumeratingWithState:&v1224 objects:v1232 count:16];
                            if (v595)
                            {
                              uint64_t v596 = *(void *)v1225;
                              do
                              {
                                for (uint64_t i1 = 0; i1 != v595; ++i1)
                                {
                                  if (*(void *)v1225 != v596) {
                                    objc_enumerationMutation(v594);
                                  }
                                  uint64_t v598 = *(void *)(*((void *)&v1224 + 1) + 8 * i1);
                                  objc_opt_class();
                                  if (objc_opt_isKindOfClass())
                                  {
                                    v599 = [GEOPDMapsIdentifier alloc];
                                    if (a3) {
                                      v600 = [(GEOPDMapsIdentifier *)v599 initWithJSON:v598];
                                    }
                                    else {
                                      v600 = [(GEOPDMapsIdentifier *)v599 initWithDictionary:v598];
                                    }
                                    v601 = v600;
                                    -[GEOPDPlaceSuggestionResult addPlaceId:]((uint64_t)v593, v600);
                                  }
                                }
                                uint64_t v595 = [v594 countByEnumeratingWithState:&v1224 objects:v1232 count:16];
                              }
                              while (v595);
                            }
                          }
                        }
                      }
                      else
                      {
                        v593 = 0;
                      }
                      v602 = v593;
                      *(_WORD *)(v572 + 88) |= 0x20u;
                      *(_WORD *)(v572 + 88) |= 0x100u;
                      objc_storeStrong((id *)(v572 + 48), v593);
                    }
                    v603 = [v1166 objectForKeyedSubscript:v1048];
                    objc_opt_class();
                    if (objc_opt_isKindOfClass())
                    {
                      v604 = [GEOPDGuidesLocationsSuggestionResult alloc];
                      if (v604)
                      {
                        id v1131 = v603;
                        uint64_t v605 = [(GEOPDGuidesLocationsSuggestionResult *)v604 init];
                        if (v605)
                        {
                          id v1094 = [v1131 objectForKeyedSubscript:@"entry"];
                          objc_opt_class();
                          if (objc_opt_isKindOfClass())
                          {
                            long long v1227 = 0u;
                            long long v1226 = 0u;
                            long long v1225 = 0u;
                            long long v1224 = 0u;
                            id v606 = v1094;
                            uint64_t v607 = [v606 countByEnumeratingWithState:&v1224 objects:v1232 count:16];
                            if (v607)
                            {
                              uint64_t v608 = *(void *)v1225;
                              do
                              {
                                uint64_t v609 = 0;
                                do
                                {
                                  if (*(void *)v1225 != v608) {
                                    objc_enumerationMutation(v606);
                                  }
                                  v610 = *(void **)(*((void *)&v1224 + 1) + 8 * v609);
                                  objc_opt_class();
                                  if (objc_opt_isKindOfClass())
                                  {
                                    v611 = [GEOPDGuidesLocationEntry alloc];
                                    if (v611) {
                                      v612 = (void *)-[GEOPDGuidesLocationEntry _initWithDictionary:isJSON:]((uint64_t)v611, v610, a3);
                                    }
                                    else {
                                      v612 = 0;
                                    }
                                    -[GEOPDGuidesLocationsSuggestionResult addEntry:](v605, v612);
                                  }
                                  ++v609;
                                }
                                while (v607 != v609);
                                uint64_t v613 = [v606 countByEnumeratingWithState:&v1224 objects:v1232 count:16];
                                uint64_t v607 = v613;
                              }
                              while (v613);
                            }
                          }
                          v614 = [v1131 objectForKeyedSubscript:v1043];
                          objc_opt_class();
                          if (objc_opt_isKindOfClass())
                          {
                            v615 = [GEOPDGuidesLocationEntry alloc];
                            if (v615) {
                              v616 = (void *)-[GEOPDGuidesLocationEntry _initWithDictionary:isJSON:]((uint64_t)v615, v614, a3);
                            }
                            else {
                              v616 = 0;
                            }
                            id v617 = v616;
                            *(unsigned char *)(v605 + 60) |= 4u;
                            *(unsigned char *)(v605 + 60) |= 0x10u;
                            objc_storeStrong((id *)(v605 + 32), v616);
                          }
                          v618 = [v1131 objectForKeyedSubscript:v1041];
                          objc_opt_class();
                          if (objc_opt_isKindOfClass())
                          {
                            v619 = (void *)[v618 copy];
                            id v620 = v619;
                            *(unsigned char *)(v605 + 60) |= 8u;
                            *(unsigned char *)(v605 + 60) |= 0x10u;
                            objc_storeStrong((id *)(v605 + 40), v619);
                          }
                        }
                      }
                      else
                      {
                        uint64_t v605 = 0;
                      }
                      id v621 = (id)v605;
                      *(_WORD *)(v572 + 88) |= 8u;
                      *(_WORD *)(v572 + 88) |= 0x100u;
                      objc_storeStrong((id *)(v572 + 32), (id)v605);
                    }
                  }
                }
                else
                {
                  uint64_t v572 = 0;
                }
                -[GEOPDMapsSearchHomeResult addMapsSearchHomeSection:]((uint64_t)v1107, (void *)v572);
              }
              ++v569;
            }
            while (v569 != v1154);
            uint64_t v622 = [objg countByEnumeratingWithState:&v1220 objects:&v1228 count:16];
            uint64_t v1154 = v622;
            if (!v622)
            {
LABEL_1256:

              v559 = v1037;
              break;
            }
          }
        }

        id v557 = v1035;
      }
    }
    else
    {
      v1107 = 0;
    }
    -[GEOPDPlaceGlobalResult setMapsSearchHomeResult:]((uint64_t)v1078, v1107);

    v554 = v1039;
  }

  if (a3) {
    v623 = @"collectionSuggestionResult";
  }
  else {
    v623 = @"collection_suggestion_result";
  }
  v1155 = v623;
  v624 = objc_msgSend(v1099, "objectForKeyedSubscript:");
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v625 = [GEOPDCollectionSuggestionResult alloc];
    if (v625) {
      v626 = (void *)-[GEOPDCollectionSuggestionResult _initWithDictionary:isJSON:](v625, v624, a3);
    }
    else {
      v626 = 0;
    }
    -[GEOPDPlaceGlobalResult setCollectionSuggestionResult:]((uint64_t)v1078, v626);
  }
  if (a3) {
    v627 = @"publisherViewResult";
  }
  else {
    v627 = @"publisher_view_result";
  }
  v628 = [v1099 objectForKeyedSubscript:v627];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v629 = [GEOPDPublisherViewResult alloc];
    if (v629)
    {
      id v630 = v628;
      v629 = [(GEOPDPublisherViewResult *)v629 init];
      if (v629)
      {
        if (a3) {
          v631 = @"resultFilter";
        }
        else {
          v631 = @"result_filter";
        }
        v632 = [v630 objectForKeyedSubscript:v631];
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          long long v1227 = 0u;
          long long v1226 = 0u;
          long long v1225 = 0u;
          long long v1224 = 0u;
          id v633 = v632;
          uint64_t v634 = [v633 countByEnumeratingWithState:&v1224 objects:v1232 count:16];
          if (v634)
          {
            uint64_t v635 = *(void *)v1225;
            do
            {
              uint64_t v636 = 0;
              do
              {
                if (*(void *)v1225 != v635) {
                  objc_enumerationMutation(v633);
                }
                v637 = *(void **)(*((void *)&v1224 + 1) + 8 * v636);
                objc_opt_class();
                if (objc_opt_isKindOfClass())
                {
                  v638 = [GEOPDPublisherViewResultFilter alloc];
                  if (v638) {
                    v639 = (void *)-[GEOPDPublisherViewResultFilter _initWithDictionary:isJSON:](v638, v637, a3);
                  }
                  else {
                    v639 = 0;
                  }
                  -[GEOPDPublisherViewResult addResultFilter:]((uint64_t)v629, v639);
                }
                ++v636;
              }
              while (v634 != v636);
              uint64_t v640 = [v633 countByEnumeratingWithState:&v1224 objects:v1232 count:16];
              uint64_t v634 = v640;
            }
            while (v640);
          }
        }
        if (a3) {
          v641 = @"collectionId";
        }
        else {
          v641 = @"collection_id";
        }
        v642 = [v630 objectForKeyedSubscript:v641];
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          long long v1223 = 0u;
          long long v1222 = 0u;
          long long v1221 = 0u;
          long long v1220 = 0u;
          id v643 = v642;
          uint64_t v644 = [v643 countByEnumeratingWithState:&v1220 objects:&v1228 count:16];
          if (v644)
          {
            uint64_t v645 = *(void *)v1221;
            do
            {
              for (uint64_t i2 = 0; i2 != v644; ++i2)
              {
                if (*(void *)v1221 != v645) {
                  objc_enumerationMutation(v643);
                }
                uint64_t v647 = *(void *)(*((void *)&v1220 + 1) + 8 * i2);
                objc_opt_class();
                if (objc_opt_isKindOfClass())
                {
                  v648 = [GEOPDMapsIdentifier alloc];
                  if (a3) {
                    v649 = [(GEOPDMapsIdentifier *)v648 initWithJSON:v647];
                  }
                  else {
                    v649 = [(GEOPDMapsIdentifier *)v648 initWithDictionary:v647];
                  }
                  v650 = v649;
                  -[GEOPDPublisherViewResult addCollectionId:]((uint64_t)v629, v649);
                }
              }
              uint64_t v644 = [v643 countByEnumeratingWithState:&v1220 objects:&v1228 count:16];
            }
            while (v644);
          }
        }
      }
    }
    -[GEOPDPlaceGlobalResult setPublisherViewResult:]((uint64_t)v1078, v629);
  }
  if (a3) {
    v651 = @"allCollectionsViewResult";
  }
  else {
    v651 = @"all_collections_view_result";
  }
  v652 = [v1099 objectForKeyedSubscript:v651];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v653 = [GEOPDAllCollectionsViewResult alloc];
    if (v653)
    {
      id v654 = v652;
      v653 = [(GEOPDAllCollectionsViewResult *)v653 init];
      if (v653)
      {
        if (a3) {
          v655 = @"publisherSuggestionResult";
        }
        else {
          v655 = @"publisher_suggestion_result";
        }
        v656 = [v654 objectForKeyedSubscript:v655];
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          v657 = [GEOPDPublisherSuggestionResult alloc];
          if (v657) {
            v658 = (void *)-[GEOPDPublisherSuggestionResult _initWithDictionary:isJSON:](v657, v656, a3);
          }
          else {
            v658 = 0;
          }
          -[GEOPDAllCollectionsViewResult setPublisherSuggestionResult:]((uint64_t)v653, v658);
        }
        if (a3) {
          v659 = @"resultFilter";
        }
        else {
          v659 = @"result_filter";
        }
        v660 = [v654 objectForKeyedSubscript:v659];
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          long long v1227 = 0u;
          long long v1226 = 0u;
          long long v1225 = 0u;
          long long v1224 = 0u;
          id v661 = v660;
          uint64_t v662 = [v661 countByEnumeratingWithState:&v1224 objects:v1232 count:16];
          if (v662)
          {
            uint64_t v663 = *(void *)v1225;
            do
            {
              uint64_t v664 = 0;
              do
              {
                if (*(void *)v1225 != v663) {
                  objc_enumerationMutation(v661);
                }
                v665 = *(void **)(*((void *)&v1224 + 1) + 8 * v664);
                objc_opt_class();
                if (objc_opt_isKindOfClass())
                {
                  v666 = [GEOPDAllCollectionsViewResultFilter alloc];
                  if (v666) {
                    v667 = (void *)-[GEOPDAllCollectionsViewResultFilter _initWithDictionary:isJSON:](v666, v665, a3);
                  }
                  else {
                    v667 = 0;
                  }
                  -[GEOPDAllCollectionsViewResult addResultFilter:]((uint64_t)v653, v667);
                }
                ++v664;
              }
              while (v662 != v664);
              uint64_t v668 = [v661 countByEnumeratingWithState:&v1224 objects:v1232 count:16];
              uint64_t v662 = v668;
            }
            while (v668);
          }
        }
        if (a3) {
          v669 = @"collectionId";
        }
        else {
          v669 = @"collection_id";
        }
        v670 = [v654 objectForKeyedSubscript:v669];
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          long long v1223 = 0u;
          long long v1222 = 0u;
          long long v1221 = 0u;
          long long v1220 = 0u;
          id v671 = v670;
          uint64_t v672 = [v671 countByEnumeratingWithState:&v1220 objects:&v1228 count:16];
          if (v672)
          {
            uint64_t v673 = *(void *)v1221;
            do
            {
              for (uint64_t i3 = 0; i3 != v672; ++i3)
              {
                if (*(void *)v1221 != v673) {
                  objc_enumerationMutation(v671);
                }
                uint64_t v675 = *(void *)(*((void *)&v1220 + 1) + 8 * i3);
                objc_opt_class();
                if (objc_opt_isKindOfClass())
                {
                  v676 = [GEOPDMapsIdentifier alloc];
                  if (a3) {
                    v677 = [(GEOPDMapsIdentifier *)v676 initWithJSON:v675];
                  }
                  else {
                    v677 = [(GEOPDMapsIdentifier *)v676 initWithDictionary:v675];
                  }
                  v678 = v677;
                  -[GEOPDAllCollectionsViewResult addCollectionId:]((uint64_t)v653, v677);
                }
              }
              uint64_t v672 = [v671 countByEnumeratingWithState:&v1220 objects:&v1228 count:16];
            }
            while (v672);
          }
        }
      }
    }
    -[GEOPDPlaceGlobalResult setAllCollectionsViewResult:]((uint64_t)v1078, v653);
  }
  if (a3) {
    v679 = @"airportEntityPlaceLookupResult";
  }
  else {
    v679 = @"airport_entity_place_lookup_result";
  }
  v680 = [v1099 objectForKeyedSubscript:v679];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v681 = [GEOPDAirportEntityPlaceLookupResult alloc];
    id v682 = v680;
    if (v681) {
      v681 = [(GEOPDAirportEntityPlaceLookupResult *)v681 init];
    }

    -[GEOPDPlaceGlobalResult setAirportEntityPlaceLookupResult:]((uint64_t)v1078, v681);
  }

  if (a3) {
    v683 = @"territoryLookupResult";
  }
  else {
    v683 = @"territory_lookup_result";
  }
  v684 = [v1099 objectForKeyedSubscript:v683];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v685 = [GEOPDTerritoryLookupResult alloc];
    id v686 = v684;
    if (v685) {
      v685 = [(GEOPDTerritoryLookupResult *)v685 init];
    }

    -[GEOPDPlaceGlobalResult setTerritoryLookupResult:]((uint64_t)v1078, v685);
  }

  if (a3) {
    v687 = @"mapsHomeResult";
  }
  else {
    v687 = @"maps_home_result";
  }
  id v1108 = [v1099 objectForKeyedSubscript:v687];
  objc_opt_class();
  v688 = v1108;
  if (objc_opt_isKindOfClass())
  {
    v689 = [GEOPDMapsHomeResult alloc];
    if (v689)
    {
      v690 = v689;
      id v691 = v1108;
      v1167 = [(GEOPDMapsHomeResult *)v690 init];
      if (v1167)
      {
        if (a3) {
          v692 = @"mapsHomeSection";
        }
        else {
          v692 = @"maps_home_section";
        }
        id v1095 = [v691 objectForKeyedSubscript:v692];
        objc_opt_class();
        v693 = v1095;
        if (objc_opt_isKindOfClass())
        {
          long long v1231 = 0u;
          long long v1230 = 0u;
          long long v1229 = 0u;
          long long v1228 = 0u;
          id v694 = v1095;
          uint64_t v695 = [v694 countByEnumeratingWithState:&v1228 objects:v1232 count:16];
          if (!v695) {
            goto LABEL_1429;
          }
          v696 = @"section_type";
          uint64_t v697 = *(void *)v1229;
          if (a3) {
            v696 = @"sectionType";
          }
          v1143 = v696;
          if (a3) {
            v698 = @"exploreGuidesEntry";
          }
          else {
            v698 = @"explore_guides_entry";
          }
          v699 = @"explore_image_url_template";
          if (a3) {
            v699 = @"exploreImageUrlTemplate";
          }
          objh = v699;
          v1132 = v698;
          while (1)
          {
            uint64_t v700 = 0;
            do
            {
              if (*(void *)v1229 != v697) {
                objc_enumerationMutation(v694);
              }
              v701 = *(void **)(*((void *)&v1228 + 1) + 8 * v700);
              objc_opt_class();
              if (objc_opt_isKindOfClass())
              {
                v702 = [GEOPDMapsHomeSection alloc];
                if (v702)
                {
                  id v703 = v701;
                  v702 = [(GEOPDMapsHomeSection *)v702 init];
                  if (v702)
                  {
                    v704 = [v703 objectForKeyedSubscript:v1143];
                    objc_opt_class();
                    if (objc_opt_isKindOfClass())
                    {
                      id v705 = v704;
                      if ([v705 isEqualToString:@"UNKNOWN"]) {
                        int v706 = 0;
                      }
                      else {
                        int v706 = [v705 isEqualToString:@"CURATED_GUIDES"];
                      }

LABEL_1408:
                      *(unsigned char *)&v702->_flags |= 0x40u;
                      *(unsigned char *)&v702->_flags |= 1u;
                      v702->_sectionType = v706;
                    }
                    else
                    {
                      objc_opt_class();
                      if (objc_opt_isKindOfClass())
                      {
                        int v706 = [v704 intValue];
                        goto LABEL_1408;
                      }
                    }

                    v707 = [v703 objectForKeyedSubscript:@"name"];
                    objc_opt_class();
                    if (objc_opt_isKindOfClass())
                    {
                      v708 = (void *)[v707 copy];
                      id v709 = v708;
                      *(unsigned char *)&v702->_flags |= 0x20u;
                      *(unsigned char *)&v702->_flags |= 0x40u;
                      objc_storeStrong((id *)&v702->_name, v708);
                    }
                    v710 = [v703 objectForKeyedSubscript:v1155];
                    objc_opt_class();
                    if (objc_opt_isKindOfClass())
                    {
                      v711 = [GEOPDCollectionSuggestionResult alloc];
                      if (v711) {
                        v712 = (void *)-[GEOPDCollectionSuggestionResult _initWithDictionary:isJSON:](v711, v710, a3);
                      }
                      else {
                        v712 = 0;
                      }
                      id v713 = v712;
                      *(unsigned char *)&v702->_flags |= 4u;
                      *(unsigned char *)&v702->_flags |= 0x40u;
                      objc_storeStrong((id *)&v702->_collectionSuggestionResult, v712);
                    }
                    v714 = [v703 objectForKeyedSubscript:v1132];
                    objc_opt_class();
                    if (objc_opt_isKindOfClass())
                    {
                      v715 = [GEOPDGuidesLocationEntry alloc];
                      if (v715) {
                        v716 = (void *)-[GEOPDGuidesLocationEntry _initWithDictionary:isJSON:]((uint64_t)v715, v714, a3);
                      }
                      else {
                        v716 = 0;
                      }
                      id v717 = v716;
                      *(unsigned char *)&v702->_flags |= 8u;
                      *(unsigned char *)&v702->_flags |= 0x40u;
                      objc_storeStrong((id *)&v702->_exploreGuidesEntry, v716);
                    }
                    v718 = [v703 objectForKeyedSubscript:objh];
                    objc_opt_class();
                    if (objc_opt_isKindOfClass())
                    {
                      v719 = (void *)[v718 copy];
                      id v720 = v719;
                      *(unsigned char *)&v702->_flags |= 0x10u;
                      *(unsigned char *)&v702->_flags |= 0x40u;
                      objc_storeStrong((id *)&v702->_exploreImageUrlTemplate, v719);
                    }
                  }
                }
                -[GEOPDMapsHomeResult addMapsHomeSection:]((uint64_t)v1167, v702);
              }
              ++v700;
            }
            while (v695 != v700);
            uint64_t v721 = [v694 countByEnumeratingWithState:&v1228 objects:v1232 count:16];
            uint64_t v695 = v721;
            if (!v721)
            {
LABEL_1429:

              v693 = v1095;
              break;
            }
          }
        }
      }
    }
    else
    {
      v1167 = 0;
    }
    -[GEOPDPlaceGlobalResult setMapsHomeResult:]((uint64_t)v1078, v1167);

    v688 = v1108;
  }

  if (a3) {
    v722 = @"allGuidesLocationsViewresult";
  }
  else {
    v722 = @"all_guides_locations_viewresult";
  }
  v1075 = [v1099 objectForKeyedSubscript:v722];
  objc_opt_class();
  v723 = v1075;
  if (objc_opt_isKindOfClass())
  {
    v724 = [GEOPDAllGuidesLocationsViewResult alloc];
    if (v724)
    {
      v725 = v724;
      id v726 = v1075;
      v1133 = [(GEOPDAllGuidesLocationsViewResult *)v725 init];
      if (v1133)
      {
        v1065 = v726;
        v727 = [v726 objectForKeyedSubscript:@"header"];
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          v728 = (void *)[v727 copy];
          -[GEOPDAllGuidesLocationsViewResult setHeader:]((uint64_t)v1133, v728);
        }
        if (a3) {
          v729 = @"allGuidesLocationsSection";
        }
        else {
          v729 = @"all_guides_locations_section";
        }
        v1058 = [v1065 objectForKeyedSubscript:v729];
        objc_opt_class();
        v730 = v1058;
        if (objc_opt_isKindOfClass())
        {
          long long v1223 = 0u;
          long long v1222 = 0u;
          long long v1221 = 0u;
          long long v1220 = 0u;
          id v1144 = v1058;
          uint64_t v1168 = [v1144 countByEnumeratingWithState:&v1220 objects:&v1228 count:16];
          if (!v1168) {
            goto LABEL_1511;
          }
          uint64_t v1156 = *(void *)v1221;
          if (a3) {
            v731 = @"sectionHeader";
          }
          else {
            v731 = @"section_header";
          }
          v732 = @"section_header_type";
          if (a3) {
            v732 = @"sectionHeaderType";
          }
          v1109 = v732;
          objuint64_t i = v731;
          if (a3) {
            v733 = @"headerString";
          }
          else {
            v733 = @"header_string";
          }
          v734 = @"place_id";
          if (a3) {
            v734 = @"placeId";
          }
          v1085 = v734;
          v1096 = v733;
          while (1)
          {
            uint64_t v735 = 0;
            do
            {
              if (*(void *)v1221 != v1156) {
                objc_enumerationMutation(v1144);
              }
              v736 = *(void **)(*((void *)&v1220 + 1) + 8 * v735);
              objc_opt_class();
              if (objc_opt_isKindOfClass())
              {
                v737 = [GEOPDAllGuidesLocationsSection alloc];
                if (v737)
                {
                  id v738 = v736;
                  uint64_t v739 = [(GEOPDAllGuidesLocationsSection *)v737 init];
                  if (v739)
                  {
                    v740 = [v738 objectForKeyedSubscript:obji];
                    objc_opt_class();
                    if (objc_opt_isKindOfClass())
                    {
                      v741 = [GEOPDAllGuidesLocationsSectionHeader alloc];
                      if (v741)
                      {
                        id v742 = v740;
                        uint64_t v743 = [(GEOPDAllGuidesLocationsSectionHeader *)v741 init];
                        if (v743)
                        {
                          v744 = [v742 objectForKeyedSubscript:v1109];
                          objc_opt_class();
                          if (objc_opt_isKindOfClass())
                          {
                            id v745 = v744;
                            if ([v745 isEqualToString:@"ALL_GUIDES_LOCATIONS_SECTION_HEADER_TYPE_UNKNOWN"])
                            {
                              int v746 = 0;
                            }
                            else if ([v745 isEqualToString:@"ALL_GUIDES_LOCATIONS_SECTION_HEADER_TYPE_STRING"])
                            {
                              int v746 = 1;
                            }
                            else if ([v745 isEqualToString:@"ALL_GUIDES_LOCATIONS_SECTION_HEADER_TYPE_PLACE"])
                            {
                              int v746 = 2;
                            }
                            else
                            {
                              int v746 = 0;
                            }

LABEL_1477:
                            *(unsigned char *)(v743 + 56) |= 0x10u;
                            *(unsigned char *)(v743 + 56) |= 1u;
                            *(_DWORD *)(v743 + 52) = v746;
                          }
                          else
                          {
                            objc_opt_class();
                            if (objc_opt_isKindOfClass())
                            {
                              int v746 = [v744 intValue];
                              goto LABEL_1477;
                            }
                          }

                          v747 = [v742 objectForKeyedSubscript:v1096];
                          objc_opt_class();
                          if (objc_opt_isKindOfClass())
                          {
                            v748 = (void *)[v747 copy];
                            id v749 = v748;
                            *(unsigned char *)(v743 + 56) |= 4u;
                            *(unsigned char *)(v743 + 56) |= 0x10u;
                            objc_storeStrong((id *)(v743 + 24), v748);
                          }
                          v750 = [v742 objectForKeyedSubscript:v1085];
                          objc_opt_class();
                          if (objc_opt_isKindOfClass())
                          {
                            v751 = [GEOPDMapsIdentifier alloc];
                            if (a3) {
                              v752 = [(GEOPDMapsIdentifier *)v751 initWithJSON:v750];
                            }
                            else {
                              v752 = [(GEOPDMapsIdentifier *)v751 initWithDictionary:v750];
                            }
                            v753 = v752;
                            v754 = v752;
                            *(unsigned char *)(v743 + 56) |= 8u;
                            *(unsigned char *)(v743 + 56) |= 0x10u;
                            objc_storeStrong((id *)(v743 + 32), v753);
                          }
                        }
                      }
                      else
                      {
                        uint64_t v743 = 0;
                      }
                      id v755 = (id)v743;
                      *(unsigned char *)(v739 + 52) |= 4u;
                      *(unsigned char *)(v739 + 52) |= 8u;
                      objc_storeStrong((id *)(v739 + 32), (id)v743);
                    }
                    v756 = [v738 objectForKeyedSubscript:@"entry"];
                    objc_opt_class();
                    if (objc_opt_isKindOfClass())
                    {
                      long long v1227 = 0u;
                      long long v1226 = 0u;
                      long long v1225 = 0u;
                      long long v1224 = 0u;
                      id v757 = v756;
                      uint64_t v758 = [v757 countByEnumeratingWithState:&v1224 objects:v1232 count:16];
                      if (v758)
                      {
                        uint64_t v759 = *(void *)v1225;
                        do
                        {
                          uint64_t v760 = 0;
                          do
                          {
                            if (*(void *)v1225 != v759) {
                              objc_enumerationMutation(v757);
                            }
                            v761 = *(void **)(*((void *)&v1224 + 1) + 8 * v760);
                            objc_opt_class();
                            if (objc_opt_isKindOfClass())
                            {
                              v762 = [GEOPDGuidesLocationEntry alloc];
                              if (v762) {
                                v763 = (void *)-[GEOPDGuidesLocationEntry _initWithDictionary:isJSON:]((uint64_t)v762, v761, a3);
                              }
                              else {
                                v763 = 0;
                              }
                              -[GEOPDAllGuidesLocationsSection addEntry:](v739, v763);
                            }
                            ++v760;
                          }
                          while (v758 != v760);
                          uint64_t v764 = [v757 countByEnumeratingWithState:&v1224 objects:v1232 count:16];
                          uint64_t v758 = v764;
                        }
                        while (v764);
                      }
                    }
                  }
                }
                else
                {
                  uint64_t v739 = 0;
                }
                -[GEOPDAllGuidesLocationsViewResult addAllGuidesLocationsSection:]((uint64_t)v1133, (void *)v739);
              }
              ++v735;
            }
            while (v735 != v1168);
            uint64_t v765 = [v1144 countByEnumeratingWithState:&v1220 objects:&v1228 count:16];
            uint64_t v1168 = v765;
            if (!v765)
            {
LABEL_1511:

              v730 = v1058;
              break;
            }
          }
        }

        id v726 = v1065;
      }
    }
    else
    {
      v1133 = 0;
    }
    -[GEOPDPlaceGlobalResult setAllGuidesLocationsViewresult:]((uint64_t)v1078, v1133);

    v723 = v1075;
  }

  if (a3) {
    v766 = @"guidesHomeResult";
  }
  else {
    v766 = @"guides_home_result";
  }
  v1059 = [v1099 objectForKeyedSubscript:v766];
  objc_opt_class();
  v767 = v1059;
  if (objc_opt_isKindOfClass())
  {
    v768 = [GEOPDGuidesHomeResult alloc];
    if (v768)
    {
      v769 = v768;
      id v770 = v1059;
      objuint64_t j = [(GEOPDGuidesHomeResult *)v769 init];
      if (objj)
      {
        if (a3) {
          v771 = @"featuredGuides";
        }
        else {
          v771 = @"featured_guides";
        }
        v772 = [v770 objectForKeyedSubscript:v771];
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          v773 = [GEOPDGuidesHomeFixedSection alloc];
          if (v773) {
            v774 = (void *)-[GEOPDGuidesHomeFixedSection _initWithDictionary:isJSON:](v773, v772, a3);
          }
          else {
            v774 = 0;
          }
          -[GEOPDGuidesHomeResult setFeaturedGuides:]((uint64_t)objj, v774);
        }
        v775 = [v770 objectForKeyedSubscript:@"filters"];
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          v776 = [GEOPDGuidesHomeFixedSection alloc];
          if (v776) {
            v777 = (void *)-[GEOPDGuidesHomeFixedSection _initWithDictionary:isJSON:](v776, v775, a3);
          }
          else {
            v777 = 0;
          }
          -[GEOPDGuidesHomeResult setFilters:]((uint64_t)objj, v777);
        }
        if (a3) {
          v778 = @"filteredGuides";
        }
        else {
          v778 = @"filtered_guides";
        }
        v779 = [v770 objectForKeyedSubscript:v778];
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          v780 = [GEOPDGuidesHomeFixedSection alloc];
          if (v780) {
            v781 = (void *)-[GEOPDGuidesHomeFixedSection _initWithDictionary:isJSON:](v780, v779, a3);
          }
          else {
            v781 = 0;
          }
          -[GEOPDGuidesHomeResult setFilteredGuides:]((uint64_t)objj, v781);
        }
        if (a3) {
          v782 = @"repeatableSection";
        }
        else {
          v782 = @"repeatable_section";
        }
        v1049 = [v770 objectForKeyedSubscript:v782];
        objc_opt_class();
        v783 = v1049;
        if (objc_opt_isKindOfClass())
        {
          long long v1206 = 0u;
          long long v1207 = 0u;
          long long v1204 = 0u;
          long long v1205 = 0u;
          id v1134 = v1049;
          uint64_t v1157 = [v1134 countByEnumeratingWithState:&v1204 objects:&v1220 count:16];
          if (!v1157) {
            goto LABEL_1643;
          }
          v784 = @"section_type";
          id v1145 = *(id *)v1205;
          if (a3) {
            v784 = @"sectionType";
          }
          v1110 = v784;
          v785 = @"carousel_guide_id";
          if (a3) {
            v785 = @"carouselGuideId";
          }
          v1097 = v785;
          if (a3) {
            v786 = @"publisherId";
          }
          else {
            v786 = @"publisher_id";
          }
          v1086 = v786;
          if (a3) {
            v787 = @"guidesLocationEntry";
          }
          else {
            v787 = @"guides_location_entry";
          }
          v788 = @"content_type";
          if (a3) {
            v788 = @"contentType";
          }
          v1066 = v788;
          v1076 = v787;
          while (1)
          {
            uint64_t v789 = 0;
            do
            {
              if (*(id *)v1205 != v1145) {
                objc_enumerationMutation(v1134);
              }
              v790 = *(void **)(*((void *)&v1204 + 1) + 8 * v789);
              objc_opt_class();
              if (objc_opt_isKindOfClass())
              {
                v791 = [GEOPDGuidesHomeRepeatableSection alloc];
                if (v791)
                {
                  id v1169 = v790;
                  uint64_t v792 = [(GEOPDGuidesHomeRepeatableSection *)v791 init];
                  if (v792)
                  {
                    v793 = [v1169 objectForKeyedSubscript:v1110];
                    objc_opt_class();
                    if (objc_opt_isKindOfClass())
                    {
                      id v794 = v793;
                      if ([v794 isEqualToString:@"GUIDES_HOME_REPEATABLE_SECTION_TYPE_UNKNOWN"])
                      {
                        int v795 = 0;
                      }
                      else if ([v794 isEqualToString:@"GUIDES_HOME_REPEATABLE_SECTION_TYPE_GUIDES_HORIZONTAL_CAROUSEL"])
                      {
                        int v795 = 1;
                      }
                      else if ([v794 isEqualToString:@"GUIDES_HOME_REPEATABLE_SECTION_TYPE_PUBLISHER"])
                      {
                        int v795 = 2;
                      }
                      else if ([v794 isEqualToString:@"GUIDES_HOME_REPEATABLE_SECTION_TYPE_GUIDES_VERTICAL_CAROUSEL"])
                      {
                        int v795 = 3;
                      }
                      else if ([v794 isEqualToString:@"GUIDES_HOME_REPEATABLE_SECTION_TYPE_LOCATIONS"])
                      {
                        int v795 = 4;
                      }
                      else
                      {
                        int v795 = 0;
                      }

LABEL_1578:
                      *(unsigned char *)(v792 + 76) |= 0x80u;
                      *(unsigned char *)(v792 + 76) |= 2u;
                      *(_DWORD *)(v792 + 72) = v795;
                    }
                    else
                    {
                      objc_opt_class();
                      if (objc_opt_isKindOfClass())
                      {
                        int v795 = [v793 intValue];
                        goto LABEL_1578;
                      }
                    }

                    v796 = [v1169 objectForKeyedSubscript:@"name"];
                    objc_opt_class();
                    if (objc_opt_isKindOfClass())
                    {
                      v797 = (void *)[v796 copy];
                      id v798 = v797;
                      *(unsigned char *)(v792 + 76) |= 0x20u;
                      *(unsigned char *)(v792 + 76) |= 0x80u;
                      objc_storeStrong((id *)(v792 + 40), v797);
                    }
                    v799 = [v1169 objectForKeyedSubscript:v1097];
                    objc_opt_class();
                    if (objc_opt_isKindOfClass())
                    {
                      long long v1219 = 0u;
                      long long v1218 = 0u;
                      long long v1217 = 0u;
                      long long v1216 = 0u;
                      id v800 = v799;
                      uint64_t v801 = [v800 countByEnumeratingWithState:&v1216 objects:v1232 count:16];
                      if (v801)
                      {
                        uint64_t v802 = *(void *)v1217;
                        do
                        {
                          for (uint64_t i4 = 0; i4 != v801; ++i4)
                          {
                            if (*(void *)v1217 != v802) {
                              objc_enumerationMutation(v800);
                            }
                            uint64_t v804 = *(void *)(*((void *)&v1216 + 1) + 8 * i4);
                            objc_opt_class();
                            if (objc_opt_isKindOfClass())
                            {
                              v805 = [GEOPDMapsIdentifier alloc];
                              if (a3) {
                                v806 = [(GEOPDMapsIdentifier *)v805 initWithJSON:v804];
                              }
                              else {
                                v806 = [(GEOPDMapsIdentifier *)v805 initWithDictionary:v804];
                              }
                              v807 = v806;
                              -[GEOPDGuidesHomeRepeatableSection addCarouselGuideId:](v792, v806);
                            }
                          }
                          uint64_t v801 = [v800 countByEnumeratingWithState:&v1216 objects:v1232 count:16];
                        }
                        while (v801);
                      }
                    }
                    v808 = [v1169 objectForKeyedSubscript:v1086];
                    objc_opt_class();
                    if (objc_opt_isKindOfClass())
                    {
                      long long v1215 = 0u;
                      long long v1214 = 0u;
                      long long v1213 = 0u;
                      long long v1212 = 0u;
                      id v809 = v808;
                      uint64_t v810 = [v809 countByEnumeratingWithState:&v1212 objects:&v1228 count:16];
                      if (v810)
                      {
                        uint64_t v811 = *(void *)v1213;
                        do
                        {
                          for (uint64_t i5 = 0; i5 != v810; ++i5)
                          {
                            if (*(void *)v1213 != v811) {
                              objc_enumerationMutation(v809);
                            }
                            uint64_t v813 = *(void *)(*((void *)&v1212 + 1) + 8 * i5);
                            objc_opt_class();
                            if (objc_opt_isKindOfClass())
                            {
                              v814 = [GEOPDMapsIdentifier alloc];
                              if (a3) {
                                v815 = [(GEOPDMapsIdentifier *)v814 initWithJSON:v813];
                              }
                              else {
                                v815 = [(GEOPDMapsIdentifier *)v814 initWithDictionary:v813];
                              }
                              v816 = v815;
                              -[GEOPDGuidesHomeRepeatableSection addPublisherId:](v792, v815);
                            }
                          }
                          uint64_t v810 = [v809 countByEnumeratingWithState:&v1212 objects:&v1228 count:16];
                        }
                        while (v810);
                      }
                    }
                    v817 = [v1169 objectForKeyedSubscript:v1076];
                    objc_opt_class();
                    if (objc_opt_isKindOfClass())
                    {
                      long long v1211 = 0u;
                      long long v1209 = 0u;
                      long long v1210 = 0u;
                      long long v1208 = 0u;
                      id v818 = v817;
                      uint64_t v819 = [v818 countByEnumeratingWithState:&v1208 objects:&v1224 count:16];
                      if (v819)
                      {
                        uint64_t v820 = *(void *)v1209;
                        do
                        {
                          uint64_t v821 = 0;
                          do
                          {
                            if (*(void *)v1209 != v820) {
                              objc_enumerationMutation(v818);
                            }
                            v822 = *(void **)(*((void *)&v1208 + 1) + 8 * v821);
                            objc_opt_class();
                            if (objc_opt_isKindOfClass())
                            {
                              v823 = [GEOPDGuidesLocationEntry alloc];
                              if (v823) {
                                v824 = (void *)-[GEOPDGuidesLocationEntry _initWithDictionary:isJSON:]((uint64_t)v823, v822, a3);
                              }
                              else {
                                v824 = 0;
                              }
                              -[GEOPDGuidesHomeRepeatableSection addGuidesLocationEntry:](v792, v824);
                            }
                            ++v821;
                          }
                          while (v819 != v821);
                          uint64_t v825 = [v818 countByEnumeratingWithState:&v1208 objects:&v1224 count:16];
                          uint64_t v819 = v825;
                        }
                        while (v825);
                      }
                    }
                    v826 = [v1169 objectForKeyedSubscript:v1066];
                    objc_opt_class();
                    if (objc_opt_isKindOfClass())
                    {
                      id v827 = v826;
                      if ([v827 isEqualToString:@"GUIDES_HOME_REPEATABLE_SECTION_CONTENT_TYPE_UNKNOWN"])
                      {
                        int v828 = 0;
                      }
                      else if ([v827 isEqualToString:@"GUIDES_HOME_REPEATABLE_SECTION_CONTENT_TYPE_EDITORS_PICKS_GUIDES"])
                      {
                        int v828 = 1;
                      }
                      else if ([v827 isEqualToString:@"GUIDES_HOME_REPEATABLE_SECTION_CONTENT_TYPE_EDITORIAL_GUIDES"])
                      {
                        int v828 = 2;
                      }
                      else
                      {
                        int v828 = 0;
                      }

LABEL_1635:
                      *(unsigned char *)(v792 + 76) |= 0x80u;
                      *(unsigned char *)(v792 + 76) |= 1u;
                      *(_DWORD *)(v792 + 68) = v828;
                    }
                    else
                    {
                      objc_opt_class();
                      if (objc_opt_isKindOfClass())
                      {
                        int v828 = [v826 intValue];
                        goto LABEL_1635;
                      }
                    }
                  }
                }
                else
                {
                  uint64_t v792 = 0;
                }
                -[GEOPDGuidesHomeResult addRepeatableSection:]((uint64_t)objj, (void *)v792);
              }
              ++v789;
            }
            while (v789 != v1157);
            uint64_t v829 = [v1134 countByEnumeratingWithState:&v1204 objects:&v1220 count:16];
            uint64_t v1157 = v829;
            if (!v829)
            {
LABEL_1643:

              v783 = v1049;
              break;
            }
          }
        }
      }
    }
    else
    {
      objuint64_t j = 0;
    }
    -[GEOPDPlaceGlobalResult setGuidesHomeResult:]((uint64_t)v1078, objj);

    v767 = v1059;
  }

  if (a3) {
    v830 = @"extendedGeoLookupResult";
  }
  else {
    v830 = @"extended_geo_lookup_result";
  }
  v831 = [v1099 objectForKeyedSubscript:v830];
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    goto LABEL_1678;
  }
  v832 = [GEOPDExtendedGeoLookupResult alloc];
  if (v832)
  {
    id v833 = v831;
    v832 = [(GEOPDExtendedGeoLookupResult *)v832 init];
    if (!v832)
    {
LABEL_1676:

      goto LABEL_1677;
    }
    if (a3) {
      v834 = @"primaryFeatureMatched";
    }
    else {
      v834 = @"primary_feature_matched";
    }
    v835 = [v833 objectForKeyedSubscript:v834];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      char v836 = [v835 BOOLValue];
      *(unsigned char *)&v832->_flags |= 2u;
      v832->_primaryFeatureMatched = v836;
    }

    if (a3) {
      v837 = @"dataSourceId";
    }
    else {
      v837 = @"data_source_id";
    }
    v838 = [v833 objectForKeyedSubscript:v837];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v839 = (void *)[v838 copy];
      -[GEOPDExtendedGeoLookupResult setDataSourceId:]((uint64_t)v832, v839);
    }
    v840 = [v833 objectForKeyedSubscript:@"status"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v841 = v840;
      if ([v841 isEqualToString:@"EXTENDED_GEO_LOOKUP_RESULTS_STATUS_UNDEFINED"])
      {
        int v842 = 0;
      }
      else if ([v841 isEqualToString:@"EXTENDED_GEO_LOOKUP_RESULTS_STATUS_SUCCESS"])
      {
        int v842 = 1;
      }
      else if ([v841 isEqualToString:@"EXTENDED_GEO_LOOKUP_RESULTS_STATUS_NO_CACHE_MATCH"])
      {
        int v842 = 2;
      }
      else
      {
        int v842 = 0;
      }
    }
    else
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
LABEL_1675:

        goto LABEL_1676;
      }
      int v842 = [v840 intValue];
    }
    *(unsigned char *)&v832->_flags |= 1u;
    v832->_status = v842;
    goto LABEL_1675;
  }
LABEL_1677:
  -[GEOPDPlaceGlobalResult setExtendedGeoLookupResult:]((uint64_t)v1078, v832);

LABEL_1678:
  if (a3) {
    v843 = @"queryUnderstandingResult";
  }
  else {
    v843 = @"query_understanding_result";
  }
  v1030 = [v1099 objectForKeyedSubscript:v843];
  objc_opt_class();
  v844 = v1030;
  if (objc_opt_isKindOfClass())
  {
    v845 = [GEOPDQueryUnderstandingResult alloc];
    if (v845)
    {
      v846 = v845;
      id v847 = v1030;
      v1158 = [(GEOPDQueryUnderstandingResult *)v846 init];
      if (v1158)
      {
        if (a3) {
          v848 = @"queryIntent";
        }
        else {
          v848 = @"query_intent";
        }
        v1020 = v847;
        v849 = [v847 objectForKeyedSubscript:v848];
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          long long v1174 = 0u;
          long long v1175 = 0u;
          long long v1172 = 0u;
          long long v1173 = 0u;
          id v850 = v849;
          uint64_t v851 = [v850 countByEnumeratingWithState:&v1172 objects:&v1204 count:16];
          if (v851)
          {
            uint64_t v852 = *(void *)v1173;
            do
            {
              uint64_t v853 = 0;
              do
              {
                if (*(void *)v1173 != v852) {
                  objc_enumerationMutation(v850);
                }
                v854 = *(void **)(*((void *)&v1172 + 1) + 8 * v853);
                objc_opt_class();
                if (objc_opt_isKindOfClass())
                {
                  v855 = [GEOPDSearchQueryIntent alloc];
                  if (v855) {
                    v856 = (void *)-[GEOPDSearchQueryIntent _initWithDictionary:isJSON:]((uint64_t)v855, v854, a3);
                  }
                  else {
                    v856 = 0;
                  }
                  -[GEOPDQueryUnderstandingResult addQueryIntent:]((uint64_t)v1158, v856);
                }
                ++v853;
              }
              while (v851 != v853);
              uint64_t v857 = [v850 countByEnumeratingWithState:&v1172 objects:&v1204 count:16];
              uint64_t v851 = v857;
            }
            while (v857);
          }
        }
        if (a3) {
          v858 = @"taxonomyResult";
        }
        else {
          v858 = @"taxonomy_result";
        }
        v1021 = [v1020 objectForKeyedSubscript:v858];
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          v859 = [GEOPDQueryUnderstandingTaxonomyResult alloc];
          if (v859)
          {
            id v1016 = v1021;
            v1022 = [(GEOPDQueryUnderstandingTaxonomyResult *)v859 init];
            if (v1022)
            {
              if (a3) {
                v860 = @"resultItem";
              }
              else {
                v860 = @"result_item";
              }
              v1015 = [v1016 objectForKeyedSubscript:v860];
              objc_opt_class();
              if (objc_opt_isKindOfClass())
              {
                long long v1178 = 0u;
                long long v1179 = 0u;
                long long v1176 = 0u;
                long long v1177 = 0u;
                id v1019 = v1015;
                uint64_t v1027 = [v1019 countByEnumeratingWithState:&v1176 objects:&v1208 count:16];
                if (!v1027) {
                  goto LABEL_1915;
                }
                v861 = @"localized_taxonomy_result_brand";
                uint64_t v1025 = *(void *)v1177;
                if (a3) {
                  v861 = @"localizedTaxonomyResultBrand";
                }
                v1014 = v861;
                v862 = @"pref_phone";
                if (a3) {
                  v862 = @"prefPhone";
                }
                v1087 = v862;
                if (a3) {
                  v863 = @"prefUrl";
                }
                else {
                  v863 = @"pref_url";
                }
                v864 = @"prefDisplayName";
                if (!a3) {
                  v864 = @"pref_display_name";
                }
                v1067 = v864;
                v1077 = v863;
                v865 = @"country_code";
                if (a3) {
                  v865 = @"countryCode";
                }
                v1060 = v865;
                if (a3) {
                  v866 = @"isUnclaimable";
                }
                else {
                  v866 = @"is_unclaimable";
                }
                v1053 = v866;
                if (a3) {
                  v867 = @"businessCardPoiIconType";
                }
                else {
                  v867 = @"business_card_poi_icon_type";
                }
                v868 = @"business_card_pref_category";
                if (a3) {
                  v868 = @"businessCardPrefCategory";
                }
                v1046 = v868;
                v1050 = v867;
                if (a3) {
                  v869 = @"prefCategoryNames";
                }
                else {
                  v869 = @"pref_category_names";
                }
                v870 = @"prefCategoryIcon";
                if (!a3) {
                  v870 = @"pref_category_icon";
                }
                v1042 = v870;
                v1044 = v869;
                v871 = @"business_card_alt_categories";
                if (a3) {
                  v871 = @"businessCardAltCategories";
                }
                v1040 = v871;
                if (a3) {
                  v872 = @"businessCardModernPrimaryCategory";
                }
                else {
                  v872 = @"business_card_modern_primary_category";
                }
                v1038 = v872;
                if (a3) {
                  v873 = @"modernPrimaryCategoryIcon";
                }
                else {
                  v873 = @"modern_primary_category_icon";
                }
                v874 = @"modern_primary_category_names";
                if (a3) {
                  v874 = @"modernPrimaryCategoryNames";
                }
                v1034 = v874;
                v1036 = v873;
                if (a3) {
                  v875 = @"businessCardModernAlternateCategories";
                }
                else {
                  v875 = @"business_card_modern_alternate_categories";
                }
                v876 = @"businessConnectAttributes";
                if (!a3) {
                  v876 = @"business_connect_attributes";
                }
                v1032 = v876;
                v1033 = v875;
                v877 = @"chain_id";
                if (a3) {
                  v877 = @"chainId";
                }
                v1024 = v877;
                if (a3) {
                  v878 = @"orgId";
                }
                else {
                  v878 = @"org_id";
                }
                v1023 = v878;
                while (1)
                {
                  uint64_t v879 = 0;
                  do
                  {
                    if (*(void *)v1177 != v1025)
                    {
                      uint64_t v880 = v879;
                      objc_enumerationMutation(v1019);
                      uint64_t v879 = v880;
                    }
                    uint64_t v1029 = v879;
                    v881 = *(void **)(*((void *)&v1176 + 1) + 8 * v879);
                    objc_opt_class();
                    if (objc_opt_isKindOfClass())
                    {
                      v882 = [GEOPDQueryUnderstandingTaxonomyResultItem alloc];
                      if (v882)
                      {
                        id v1028 = v881;
                        uint64_t v1031 = [(GEOPDQueryUnderstandingTaxonomyResultItem *)v882 init];
                        if (v1031)
                        {
                          v883 = [v1028 objectForKeyedSubscript:@"type"];
                          objc_opt_class();
                          if (objc_opt_isKindOfClass())
                          {
                            id v884 = v883;
                            if ([v884 isEqualToString:@"QUERY_UNDERSTANDING_TAXONOMY_TYPE_UNKNOWN"])
                            {
                              int v885 = 0;
                            }
                            else if ([v884 isEqualToString:@"QUERY_UNDERSTANDING_TAXONOMY_TYPE_CATEGORY"])
                            {
                              int v885 = 1;
                            }
                            else if ([v884 isEqualToString:@"QUERY_UNDERSTANDING_TAXONOMY_TYPE_BRAND"])
                            {
                              int v885 = 2;
                            }
                            else
                            {
                              int v885 = 0;
                            }

LABEL_1775:
                            *(unsigned char *)(v1031 + 56) |= 0x10u;
                            *(unsigned char *)(v1031 + 56) |= 1u;
                            *(_DWORD *)(v1031 + 52) = v885;
                          }
                          else
                          {
                            objc_opt_class();
                            if (objc_opt_isKindOfClass())
                            {
                              int v885 = [v883 intValue];
                              goto LABEL_1775;
                            }
                          }

                          v886 = [v1028 objectForKeyedSubscript:@"category"];
                          objc_opt_class();
                          if (objc_opt_isKindOfClass())
                          {
                            v887 = [GEOPDQueryUnderstandingTaxonomyResultItemCategory alloc];
                            id v888 = v886;
                            if (v887) {
                              v887 = [(GEOPDQueryUnderstandingTaxonomyResultItemCategory *)v887 init];
                            }

                            v889 = v887;
                            *(unsigned char *)(v1031 + 56) |= 8u;
                            *(unsigned char *)(v1031 + 56) |= 0x10u;
                            objc_storeStrong((id *)(v1031 + 32), v887);
                          }
                          v1026 = [v1028 objectForKeyedSubscript:@"brand"];
                          objc_opt_class();
                          if (objc_opt_isKindOfClass())
                          {
                            v890 = [GEOPDQueryUnderstandingTaxonomyResultItemBrand alloc];
                            if (v890)
                            {
                              id v1018 = v1026;
                              v1111 = [(GEOPDQueryUnderstandingTaxonomyResultItemBrand *)v890 init];
                              if (v1111)
                              {
                                v1017 = [v1018 objectForKeyedSubscript:v1014];
                                objc_opt_class();
                                if (objc_opt_isKindOfClass())
                                {
                                  long long v1182 = 0u;
                                  long long v1183 = 0u;
                                  long long v1180 = 0u;
                                  long long v1181 = 0u;
                                  id v1098 = v1017;
                                  v1135 = (char *)[v1098 countByEnumeratingWithState:&v1180 objects:&v1212 count:16];
                                  if (v1135)
                                  {
                                    id objk = *(id *)v1181;
                                    do
                                    {
                                      v891 = 0;
                                      do
                                      {
                                        if (*(id *)v1181 != objk)
                                        {
                                          v892 = v891;
                                          objc_enumerationMutation(v1098);
                                          v891 = v892;
                                        }
                                        v1146 = v891;
                                        v893 = *(void **)(*((void *)&v1180 + 1) + 8 * (void)v891);
                                        objc_opt_class();
                                        if (objc_opt_isKindOfClass())
                                        {
                                          v894 = [GEOPDLocalizedQueryUnderstandingTaxonomyResultItemBrand alloc];
                                          if (v894)
                                          {
                                            id v1170 = v893;
                                            uint64_t v895 = [(GEOPDLocalizedQueryUnderstandingTaxonomyResultItemBrand *)v894 init];
                                            if (v895)
                                            {
                                              v896 = [v1170 objectForKeyedSubscript:@"muid"];
                                              objc_opt_class();
                                              if (objc_opt_isKindOfClass())
                                              {
                                                uint64_t v897 = [v896 unsignedLongLongValue];
                                                *(_DWORD *)(v895 + 168) |= 0x40000u;
                                                *(_DWORD *)(v895 + 168) |= 2u;
                                                *(void *)(v895 + 104) = v897;
                                              }

                                              v898 = [v1170 objectForKeyedSubscript:v1087];
                                              objc_opt_class();
                                              if (objc_opt_isKindOfClass())
                                              {
                                                v899 = (void *)[v898 copy];
                                                id v900 = v899;
                                                *(_DWORD *)(v895 + 168) |= 0x10000u;
                                                *(_DWORD *)(v895 + 168) |= 0x40000u;
                                                objc_storeStrong((id *)(v895 + 136), v899);
                                              }
                                              v901 = [v1170 objectForKeyedSubscript:v1077];
                                              objc_opt_class();
                                              if (objc_opt_isKindOfClass())
                                              {
                                                v902 = (void *)[v901 copy];
                                                id v903 = v902;
                                                *(_DWORD *)(v895 + 168) |= 0x20000u;
                                                *(_DWORD *)(v895 + 168) |= 0x40000u;
                                                objc_storeStrong((id *)(v895 + 144), v902);
                                              }
                                              v904 = [v1170 objectForKeyedSubscript:v1067];
                                              objc_opt_class();
                                              if (objc_opt_isKindOfClass())
                                              {
                                                v905 = [GEOLocalizedString alloc];
                                                if (a3) {
                                                  v906 = [(GEOLocalizedString *)v905 initWithJSON:v904];
                                                }
                                                else {
                                                  v906 = [(GEOLocalizedString *)v905 initWithDictionary:v904];
                                                }
                                                v907 = v906;
                                                v908 = v906;
                                                *(_DWORD *)(v895 + 168) |= 0x8000u;
                                                *(_DWORD *)(v895 + 168) |= 0x40000u;
                                                objc_storeStrong((id *)(v895 + 128), v907);
                                              }
                                              v909 = [v1170 objectForKeyedSubscript:@"category"];
                                              objc_opt_class();
                                              if (objc_opt_isKindOfClass())
                                              {
                                                long long v1202 = 0u;
                                                long long v1203 = 0u;
                                                long long v1200 = 0u;
                                                long long v1201 = 0u;
                                                id v910 = v909;
                                                uint64_t v911 = [v910 countByEnumeratingWithState:&v1200 objects:v1232 count:16];
                                                if (v911)
                                                {
                                                  uint64_t v912 = *(void *)v1201;
                                                  do
                                                  {
                                                    for (uint64_t i6 = 0; i6 != v911; ++i6)
                                                    {
                                                      if (*(void *)v1201 != v912) {
                                                        objc_enumerationMutation(v910);
                                                      }
                                                      v914 = *(void **)(*((void *)&v1200 + 1) + 8 * i6);
                                                      objc_opt_class();
                                                      if (objc_opt_isKindOfClass())
                                                      {
                                                        v915 = (void *)[v914 copy];
                                                        -[GEOPDLocalizedQueryUnderstandingTaxonomyResultItemBrand addCategory:]((os_unfair_lock_s *)v895, v915);
                                                      }
                                                    }
                                                    uint64_t v911 = [v910 countByEnumeratingWithState:&v1200 objects:v1232 count:16];
                                                  }
                                                  while (v911);
                                                }
                                              }
                                              v916 = [v1170 objectForKeyedSubscript:v1060];
                                              objc_opt_class();
                                              if (objc_opt_isKindOfClass())
                                              {
                                                v917 = (void *)[v916 copy];
                                                id v918 = v917;
                                                *(_DWORD *)(v895 + 168) |= 0x400u;
                                                *(_DWORD *)(v895 + 168) |= 0x40000u;
                                                objc_storeStrong((id *)(v895 + 80), v917);
                                              }
                                              v919 = [v1170 objectForKeyedSubscript:v1053];
                                              objc_opt_class();
                                              if (objc_opt_isKindOfClass())
                                              {
                                                char v920 = [v919 BOOLValue];
                                                *(_DWORD *)(v895 + 168) |= 0x40000u;
                                                *(_DWORD *)(v895 + 168) |= 4u;
                                                *(unsigned char *)(v895 + 164) = v920;
                                              }

                                              v921 = [v1170 objectForKeyedSubscript:v1050];
                                              objc_opt_class();
                                              if (objc_opt_isKindOfClass())
                                              {
                                                uint64_t v922 = [v921 unsignedLongLongValue];
                                                *(_DWORD *)(v895 + 168) |= 0x40000u;
                                                *(_DWORD *)(v895 + 168) |= 1u;
                                                *(void *)(v895 + 48) = v922;
                                              }

                                              v923 = [v1170 objectForKeyedSubscript:v1046];
                                              objc_opt_class();
                                              if (objc_opt_isKindOfClass())
                                              {
                                                v924 = (void *)[v923 copy];
                                                id v925 = v924;
                                                *(_DWORD *)(v895 + 168) |= 0x80u;
                                                *(_DWORD *)(v895 + 168) |= 0x40000u;
                                                objc_storeStrong((id *)(v895 + 56), v924);
                                              }
                                              v926 = [v1170 objectForKeyedSubscript:v1044];
                                              objc_opt_class();
                                              if (objc_opt_isKindOfClass())
                                              {
                                                v927 = [GEOPDMultiLocalizedString alloc];
                                                if (v927) {
                                                  v928 = (void *)-[GEOPDMultiLocalizedString _initWithDictionary:isJSON:](v927, v926, a3);
                                                }
                                                else {
                                                  v928 = 0;
                                                }
                                                id v929 = v928;
                                                *(_DWORD *)(v895 + 168) |= 0x4000u;
                                                *(_DWORD *)(v895 + 168) |= 0x40000u;
                                                objc_storeStrong((id *)(v895 + 120), v928);
                                              }
                                              v930 = [v1170 objectForKeyedSubscript:v1042];
                                              objc_opt_class();
                                              if (objc_opt_isKindOfClass())
                                              {
                                                long long v1198 = 0u;
                                                long long v1199 = 0u;
                                                long long v1196 = 0u;
                                                long long v1197 = 0u;
                                                id v931 = v930;
                                                uint64_t v932 = [v931 countByEnumeratingWithState:&v1196 objects:&v1228 count:16];
                                                if (v932)
                                                {
                                                  uint64_t v933 = *(void *)v1197;
                                                  do
                                                  {
                                                    uint64_t v934 = 0;
                                                    do
                                                    {
                                                      if (*(void *)v1197 != v933) {
                                                        objc_enumerationMutation(v931);
                                                      }
                                                      v935 = *(void **)(*((void *)&v1196 + 1) + 8 * v934);
                                                      objc_opt_class();
                                                      if (objc_opt_isKindOfClass())
                                                      {
                                                        v936 = [GEOPDIconMapping alloc];
                                                        if (v936) {
                                                          v937 = (void *)-[GEOPDIconMapping _initWithDictionary:isJSON:](v936, v935, a3);
                                                        }
                                                        else {
                                                          v937 = 0;
                                                        }
                                                        -[GEOPDLocalizedQueryUnderstandingTaxonomyResultItemBrand addPrefCategoryIcon:](v895, v937);
                                                      }
                                                      ++v934;
                                                    }
                                                    while (v932 != v934);
                                                    uint64_t v938 = [v931 countByEnumeratingWithState:&v1196 objects:&v1228 count:16];
                                                    uint64_t v932 = v938;
                                                  }
                                                  while (v938);
                                                }
                                              }
                                              v939 = [v1170 objectForKeyedSubscript:v1040];
                                              objc_opt_class();
                                              if (objc_opt_isKindOfClass())
                                              {
                                                long long v1194 = 0u;
                                                long long v1195 = 0u;
                                                long long v1192 = 0u;
                                                long long v1193 = 0u;
                                                id v940 = v939;
                                                uint64_t v941 = [v940 countByEnumeratingWithState:&v1192 objects:&v1224 count:16];
                                                if (v941)
                                                {
                                                  uint64_t v942 = *(void *)v1193;
                                                  do
                                                  {
                                                    for (uint64_t i7 = 0; i7 != v941; ++i7)
                                                    {
                                                      if (*(void *)v1193 != v942) {
                                                        objc_enumerationMutation(v940);
                                                      }
                                                      v944 = *(void **)(*((void *)&v1192 + 1) + 8 * i7);
                                                      objc_opt_class();
                                                      if (objc_opt_isKindOfClass())
                                                      {
                                                        v945 = (void *)[v944 copy];
                                                        -[GEOPDLocalizedQueryUnderstandingTaxonomyResultItemBrand addBusinessCardAltCategories:]((os_unfair_lock_s *)v895, v945);
                                                      }
                                                    }
                                                    uint64_t v941 = [v940 countByEnumeratingWithState:&v1192 objects:&v1224 count:16];
                                                  }
                                                  while (v941);
                                                }
                                              }
                                              v946 = [v1170 objectForKeyedSubscript:v1038];
                                              objc_opt_class();
                                              if (objc_opt_isKindOfClass())
                                              {
                                                v947 = (void *)[v946 copy];
                                                id v948 = v947;
                                                *(_DWORD *)(v895 + 168) |= 0x40u;
                                                *(_DWORD *)(v895 + 168) |= 0x40000u;
                                                objc_storeStrong((id *)(v895 + 40), v947);
                                              }
                                              v949 = [v1170 objectForKeyedSubscript:v1036];
                                              objc_opt_class();
                                              if (objc_opt_isKindOfClass())
                                              {
                                                long long v1190 = 0u;
                                                long long v1191 = 0u;
                                                long long v1188 = 0u;
                                                long long v1189 = 0u;
                                                id v950 = v949;
                                                uint64_t v951 = [v950 countByEnumeratingWithState:&v1188 objects:&v1220 count:16];
                                                if (v951)
                                                {
                                                  uint64_t v952 = *(void *)v1189;
                                                  do
                                                  {
                                                    uint64_t v953 = 0;
                                                    do
                                                    {
                                                      if (*(void *)v1189 != v952) {
                                                        objc_enumerationMutation(v950);
                                                      }
                                                      v954 = *(void **)(*((void *)&v1188 + 1) + 8 * v953);
                                                      objc_opt_class();
                                                      if (objc_opt_isKindOfClass())
                                                      {
                                                        v955 = [GEOPDIconMapping alloc];
                                                        if (v955) {
                                                          v956 = (void *)-[GEOPDIconMapping _initWithDictionary:isJSON:](v955, v954, a3);
                                                        }
                                                        else {
                                                          v956 = 0;
                                                        }
                                                        -[GEOPDLocalizedQueryUnderstandingTaxonomyResultItemBrand addModernPrimaryCategoryIcon:](v895, v956);
                                                      }
                                                      ++v953;
                                                    }
                                                    while (v951 != v953);
                                                    uint64_t v957 = [v950 countByEnumeratingWithState:&v1188 objects:&v1220 count:16];
                                                    uint64_t v951 = v957;
                                                  }
                                                  while (v957);
                                                }
                                              }
                                              v958 = [v1170 objectForKeyedSubscript:v1034];
                                              objc_opt_class();
                                              if (objc_opt_isKindOfClass())
                                              {
                                                v959 = [GEOPDMultiLocalizedString alloc];
                                                if (v959) {
                                                  v960 = (void *)-[GEOPDMultiLocalizedString _initWithDictionary:isJSON:](v959, v958, a3);
                                                }
                                                else {
                                                  v960 = 0;
                                                }
                                                id v961 = v960;
                                                *(_DWORD *)(v895 + 168) |= 0x1000u;
                                                *(_DWORD *)(v895 + 168) |= 0x40000u;
                                                objc_storeStrong((id *)(v895 + 96), v960);
                                              }
                                              v962 = [v1170 objectForKeyedSubscript:v1033];
                                              objc_opt_class();
                                              if (objc_opt_isKindOfClass())
                                              {
                                                long long v1186 = 0u;
                                                long long v1187 = 0u;
                                                long long v1184 = 0u;
                                                long long v1185 = 0u;
                                                id v963 = v962;
                                                uint64_t v964 = [v963 countByEnumeratingWithState:&v1184 objects:&v1216 count:16];
                                                if (v964)
                                                {
                                                  uint64_t v965 = *(void *)v1185;
                                                  do
                                                  {
                                                    for (uint64_t i8 = 0; i8 != v964; ++i8)
                                                    {
                                                      if (*(void *)v1185 != v965) {
                                                        objc_enumerationMutation(v963);
                                                      }
                                                      v967 = *(void **)(*((void *)&v1184 + 1) + 8 * i8);
                                                      objc_opt_class();
                                                      if (objc_opt_isKindOfClass())
                                                      {
                                                        v968 = (void *)[v967 copy];
                                                        -[GEOPDLocalizedQueryUnderstandingTaxonomyResultItemBrand addBusinessCardModernAlternateCategories:]((os_unfair_lock_s *)v895, v968);
                                                      }
                                                    }
                                                    uint64_t v964 = [v963 countByEnumeratingWithState:&v1184 objects:&v1216 count:16];
                                                  }
                                                  while (v964);
                                                }
                                              }
                                              v969 = [v1170 objectForKeyedSubscript:v1032];
                                              objc_opt_class();
                                              if (objc_opt_isKindOfClass())
                                              {
                                                v970 = [GEOPDBusinessConnectAttributes alloc];
                                                if (v970)
                                                {
                                                  id v971 = v969;
                                                  v970 = [(GEOPDBusinessConnectAttributes *)v970 init];
                                                  if (v970)
                                                  {
                                                    v972 = [v971 objectForKeyedSubscript:v1024];
                                                    objc_opt_class();
                                                    if (objc_opt_isKindOfClass())
                                                    {
                                                      v973 = (void *)[v972 copy];
                                                      id v974 = v973;
                                                      *(unsigned char *)&v970->_flags |= 2u;
                                                      *(unsigned char *)&v970->_flags |= 8u;
                                                      objc_storeStrong((id *)&v970->_chainId, v973);
                                                    }
                                                    v975 = [v971 objectForKeyedSubscript:v1023];
                                                    objc_opt_class();
                                                    if (objc_opt_isKindOfClass())
                                                    {
                                                      v976 = (void *)[v975 copy];
                                                      id v977 = v976;
                                                      *(unsigned char *)&v970->_flags |= 4u;
                                                      *(unsigned char *)&v970->_flags |= 8u;
                                                      objc_storeStrong((id *)&v970->_orgId, v976);
                                                    }
                                                  }
                                                }
                                                v978 = v970;
                                                *(_DWORD *)(v895 + 168) |= 0x100u;
                                                *(_DWORD *)(v895 + 168) |= 0x40000u;
                                                objc_storeStrong((id *)(v895 + 64), v970);
                                              }
                                            }
                                          }
                                          else
                                          {
                                            uint64_t v895 = 0;
                                          }
                                          -[GEOPDQueryUnderstandingTaxonomyResultItemBrand addLocalizedTaxonomyResultBrand:]((uint64_t)v1111, (void *)v895);
                                        }
                                        v891 = v1146 + 1;
                                      }
                                      while (v1146 + 1 != v1135);
                                      uint64_t v979 = [v1098 countByEnumeratingWithState:&v1180 objects:&v1212 count:16];
                                      v1135 = (char *)v979;
                                    }
                                    while (v979);
                                  }
                                }
                              }
                            }
                            else
                            {
                              v1111 = 0;
                            }
                            v980 = v1111;
                            *(unsigned char *)(v1031 + 56) |= 4u;
                            *(unsigned char *)(v1031 + 56) |= 0x10u;
                            objc_storeStrong((id *)(v1031 + 24), v1111);
                          }
                        }

                        -[GEOPDQueryUnderstandingTaxonomyResult addResultItem:]((uint64_t)v1022, (void *)v1031);
                      }
                      else
                      {
                        uint64_t v1031 = 0;
                        -[GEOPDQueryUnderstandingTaxonomyResult addResultItem:]((uint64_t)v1022, 0);
                      }
                    }
                    uint64_t v879 = v1029 + 1;
                  }
                  while (v1029 + 1 != v1027);
                  uint64_t v981 = [v1019 countByEnumeratingWithState:&v1176 objects:&v1208 count:16];
                  uint64_t v1027 = v981;
                  if (!v981)
                  {
LABEL_1915:

                    break;
                  }
                }
              }
            }
          }
          else
          {
            v1022 = 0;
          }
          -[GEOPDQueryUnderstandingResult setTaxonomyResult:]((uint64_t)v1158, v1022);
        }
        id v847 = v1020;
      }
    }
    else
    {
      v1158 = 0;
    }
    -[GEOPDPlaceGlobalResult setQueryUnderstandingResult:]((uint64_t)v1078, v1158);

    v844 = v1030;
  }

  if (a3) {
    v982 = @"poiAtAddressLookupResult";
  }
  else {
    v982 = @"poi_at_address_lookup_result";
  }
  v983 = [v1099 objectForKeyedSubscript:v982];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v984 = [GEOPDPoiAtAddressLookupResult alloc];
    id v985 = v983;
    if (v984) {
      v984 = [(GEOPDPoiAtAddressLookupResult *)v984 init];
    }

    -[GEOPDPlaceGlobalResult setPoiAtAddressLookupResult:]((uint64_t)v1078, v984);
  }

  if (a3) {
    v986 = @"placecardEnrichmentResult";
  }
  else {
    v986 = @"placecard_enrichment_result";
  }
  v987 = [v1099 objectForKeyedSubscript:v986];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v988 = [GEOPDPlacecardEnrichmentResult alloc];
    id v989 = v987;
    if (v988) {
      v988 = [(GEOPDPlacecardEnrichmentResult *)v988 init];
    }

    -[GEOPDPlaceGlobalResult setPlacecardEnrichmentResult:]((uint64_t)v1078, v988);
  }

  if (a3) {
    v990 = @"offlineRegionNameResult";
  }
  else {
    v990 = @"offline_region_name_result";
  }
  v991 = [v1099 objectForKeyedSubscript:v990];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v992 = [GEOPDOfflineRegionNameResult alloc];
    if (v992)
    {
      id v993 = v991;
      v992 = [(GEOPDOfflineRegionNameResult *)v992 init];
      if (v992)
      {
        v994 = [v993 objectForKeyedSubscript:@"displayName"];
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          v995 = [GEOLocalizedString alloc];
          if (a3) {
            v996 = [(GEOLocalizedString *)v995 initWithJSON:v994];
          }
          else {
            v996 = [(GEOLocalizedString *)v995 initWithDictionary:v994];
          }
          v997 = v996;
          -[GEOPDOfflineRegionNameResult setDisplayName:]((uint64_t)v992, v996);
        }
      }
    }
    -[GEOPDPlaceGlobalResult setOfflineRegionNameResult:]((uint64_t)v1078, v992);
  }
  if (a3) {
    v998 = @"searchCapabilitiesResult";
  }
  else {
    v998 = @"search_capabilities_result";
  }
  v999 = [v1099 objectForKeyedSubscript:v998];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v1000 = [GEOPDSearchCapabilitiesResult alloc];
    if (v1000)
    {
      id v1001 = v999;
      v1000 = [(GEOPDSearchCapabilitiesResult *)v1000 init];
      if (v1000)
      {
        if (a3) {
          v1002 = @"offlineCapabilities";
        }
        else {
          v1002 = @"offline_capabilities";
        }
        v1003 = [v1001 objectForKeyedSubscript:v1002];
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          v1004 = [GEOPDOfflineSearchCapabilities alloc];
          if (v1004)
          {
            id v1005 = v1003;
            v1004 = [(GEOPDOfflineSearchCapabilities *)v1004 init];
            if (v1004)
            {
              if (a3) {
                v1006 = @"supportsTextSearch";
              }
              else {
                v1006 = @"supports_text_search";
              }
              v1007 = [v1005 objectForKeyedSubscript:v1006];
              objc_opt_class();
              if (objc_opt_isKindOfClass())
              {
                char v1008 = [v1007 BOOLValue];
                *(unsigned char *)&v1004->_flags |= 1u;
                v1004->_supportsTextSearch = v1008;
              }
            }
          }
          -[GEOPDSearchCapabilitiesResult setOfflineCapabilities:]((uint64_t)v1000, v1004);
        }
      }
    }
    -[GEOPDPlaceGlobalResult setSearchCapabilitiesResult:]((uint64_t)v1078, v1000);
  }
  if (a3) {
    v1009 = @"addressRecommendationResult";
  }
  else {
    v1009 = @"address_recommendation_result";
  }
  v1010 = [v1099 objectForKeyedSubscript:v1009];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v1011 = [GEOPDAddressRecommendationResult alloc];
    id v1012 = v1010;
    if (v1011) {
      v1011 = [(GEOPDAddressRecommendationResult *)v1011 init];
    }

    -[GEOPDPlaceGlobalResult setAddressRecommendationResult:]((uint64_t)v1078, v1011);
  }

LABEL_1981:
  return v1078;
}

- (BOOL)readFrom:(id)a3
{
  return GEOPDPlaceGlobalResultReadAllFrom((uint64_t)self, a3, 0);
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  os_unfair_lock_lock(&self->_readerLock);
  reader = self->_reader;
  if (!reader) {
    goto LABEL_5;
  }
  objc_super v7 = reader;
  objc_sync_enter(v7);
  if ((*((unsigned char *)&self->_flags + 6) & 0x10) != 0)
  {
    objc_sync_exit(v7);

LABEL_5:
    os_unfair_lock_unlock(&self->_readerLock);
    -[GEOPDPlaceGlobalResult readAll:]((uint64_t)self, 0);
    id v8 = [(GEOPDSearchResult *)self->_searchResult copyWithZone:a3];
    id v9 = *(void **)(v5 + 368);
    *(void *)(v5 + 368) = v8;

    id v10 = [(GEOPDGeocodingResult *)self->_geocodingResult copyWithZone:a3];
    v11 = *(void **)(v5 + 184);
    *(void *)(v5 + 184) = v10;

    id v12 = [(GEOPDCanonicalLocationSearchResult *)self->_canonicalSearchResult copyWithZone:a3];
    v13 = *(void **)(v5 + 128);
    *(void *)(v5 + 128) = v12;

    id v14 = [(GEOPDReverseGeocodingResult *)self->_reverseGeocodingResult copyWithZone:a3];
    id v15 = *(void **)(v5 + 344);
    *(void *)(v5 + 344) = v14;

    id v16 = [(GEOPDPlaceLookupResult *)self->_placeLookupResult copyWithZone:a3];
    uint64_t v17 = *(void **)(v5 + 288);
    *(void *)(v5 + 288) = v16;

    id v18 = [(GEOPDMerchantLookupResult *)self->_merchantLookupResult copyWithZone:a3];
    v19 = *(void **)(v5 + 248);
    *(void *)(v5 + 248) = v18;

    id v20 = [(GEOPDPlaceRefinementResult *)self->_placeRefinementResult copyWithZone:a3];
    id v21 = *(void **)(v5 + 296);
    *(void *)(v5 + 296) = v20;

    id v22 = [(GEOPDSiriSearchResult *)self->_siriSearchResult copyWithZone:a3];
    id v23 = *(void **)(v5 + 392);
    *(void *)(v5 + 392) = v22;

    id v24 = [(GEOPDLocationDirectedSearchResult *)self->_locationDirectedSearchResult copyWithZone:a3];
    v25 = *(void **)(v5 + 216);
    *(void *)(v5 + 216) = v24;

    id v26 = [(GEOPDAutocompleteResult *)self->_autocompleteResult copyWithZone:a3];
    v27 = *(void **)(v5 + 64);
    *(void *)(v5 + 64) = v26;

    id v28 = [(GEOPDSearchBrowseCategorySuggestionResult *)self->_browseCategorySuggestionResult copyWithZone:a3];
    v29 = *(void **)(v5 + 120);
    *(void *)(v5 + 120) = v28;

    id v30 = [(GEOPDCategorySearchResult *)self->_categorySearchResult copyWithZone:a3];
    id v31 = *(void **)(v5 + 136);
    *(void *)(v5 + 136) = v30;

    id v32 = [(GEOPDPopularNearbySearchResult *)self->_popularNearbySearchResult copyWithZone:a3];
    v33 = *(void **)(v5 + 320);
    *(void *)(v5 + 320) = v32;

    id v34 = [(GEOPDSearchZeroKeywordCategorySuggestionResult *)self->_searchZeroKeywordCategorySuggestionResult copyWithZone:a3];
    id v35 = *(void **)(v5 + 376);
    *(void *)(v5 + 376) = v34;

    id v36 = [(GEOPDSearchFieldPlaceholderResult *)self->_searchFieldPlaceholderResult copyWithZone:a3];
    v37 = *(void **)(v5 + 360);
    *(void *)(v5 + 360) = v36;

    id v38 = [(GEOPDBatchPopularNearbySearchResult *)self->_batchPopularNearbySearchResult copyWithZone:a3];
    v39 = *(void **)(v5 + 88);
    *(void *)(v5 + 88) = v38;

    id v40 = [(GEOPDVendorSpecificPlaceRefinementResult *)self->_vendorSpecificPlaceRefinementResult copyWithZone:a3];
    v41 = *(void **)(v5 + 416);
    *(void *)(v5 + 416) = v40;

    id v42 = [(GEOPDNearbySearchResult *)self->_nearbySearchResult copyWithZone:a3];
    id v43 = *(void **)(v5 + 256);
    *(void *)(v5 + 256) = v42;

    id v44 = [(GEOPDAddressObjectGeocodingResult *)self->_addressObjectGeocodingResult copyWithZone:a3];
    v45 = *(void **)(v5 + 24);
    *(void *)(v5 + 24) = v44;

    id v46 = [(GEOPDSearchZeroKeywordWithSearchResultsSuggestionResult *)self->_searchZeroKeywordWithSearchResultsSuggestionResult copyWithZone:a3];
    id v47 = *(void **)(v5 + 384);
    *(void *)(v5 + 384) = v46;

    id v48 = [(GEOPDExternalTransitLookupResult *)self->_externalTransitLookupResult copyWithZone:a3];
    id v49 = *(void **)(v5 + 168);
    *(void *)(v5 + 168) = v48;

    id v50 = [(GEOPDFeatureIdGeocodingResult *)self->_featureIdGeocodingResult copyWithZone:a3];
    uint64_t v51 = *(void **)(v5 + 176);
    *(void *)(v5 + 176) = v50;

    id v52 = [(GEOPDMapsIdentifierPlaceLookupResult *)self->_mapsIdentifierPlaceLookupResult copyWithZone:a3];
    uint64_t v53 = *(void **)(v5 + 232);
    *(void *)(v5 + 232) = v52;

    id v54 = [(GEOPDBatchReverseGeocodingResult *)self->_batchReverseGeocodingResult copyWithZone:a3];
    v55 = *(void **)(v5 + 96);
    *(void *)(v5 + 96) = v54;

    id v56 = [(GEOPDBrandLookupResult *)self->_brandLookupResult copyWithZone:a3];
    uint64_t v57 = *(void **)(v5 + 112);
    *(void *)(v5 + 112) = v56;

    id v58 = [(GEOPDWifiFingerprintResult *)self->_wifiFingerprintResult copyWithZone:a3];
    id v59 = *(void **)(v5 + 424);
    *(void *)(v5 + 424) = v58;

    id v60 = [(GEOPDIpGeoLookupResult *)self->_ipGeoLookupResult copyWithZone:a3];
    uint64_t v61 = *(void **)(v5 + 208);
    *(void *)(v5 + 208) = v60;

    id v62 = [(GEOPDGroundViewLabelResult *)self->_groundViewLabelResult copyWithZone:a3];
    v63 = *(void **)(v5 + 192);
    *(void *)(v5 + 192) = v62;

    id v64 = [(GEOPDBatchSpatialLookupResult *)self->_batchSpatialLookupResult copyWithZone:a3];
    v65 = *(void **)(v5 + 104);
    *(void *)(v5 + 104) = v64;

    id v66 = [(GEOPDPlaceGlobalCommonResult *)self->_placeGlobalCommonResult copyWithZone:a3];
    v67 = *(void **)(v5 + 280);
    *(void *)(v5 + 280) = v66;

    id v68 = [(GEOPDPlaceCollectionLookupResult *)self->_placeCollectionLookupResult copyWithZone:a3];
    id v69 = *(void **)(v5 + 272);
    *(void *)(v5 + 272) = v68;

    id v70 = [(GEOPDTransitScheduleLookupResult *)self->_transitScheduleLookupResult copyWithZone:a3];
    v71 = *(void **)(v5 + 408);
    *(void *)(v5 + 408) = v70;

    id v72 = [(GEOPDBatchCategoryLookupResult *)self->_batchCategoryLookupResult copyWithZone:a3];
    v73 = *(void **)(v5 + 72);
    *(void *)(v5 + 72) = v72;

    id v74 = [(GEOPDBatchMerchantLookupBrandResult *)self->_batchMerchantLookupBrandResult copyWithZone:a3];
    v75 = *(void **)(v5 + 80);
    *(void *)(v5 + 80) = v74;

    id v76 = [(GEOPDChildPlaceLookupByCategoryResult *)self->_childPlaceLookupByCategoryResult copyWithZone:a3];
    v77 = *(void **)(v5 + 144);
    *(void *)(v5 + 144) = v76;

    id v78 = [(GEOPDMapsSearchHomeResult *)self->_mapsSearchHomeResult copyWithZone:a3];
    id v79 = *(void **)(v5 + 240);
    *(void *)(v5 + 240) = v78;

    id v80 = [(GEOPDCollectionSuggestionResult *)self->_collectionSuggestionResult copyWithZone:a3];
    v81 = *(void **)(v5 + 152);
    *(void *)(v5 + 152) = v80;

    id v82 = [(GEOPDPublisherViewResult *)self->_publisherViewResult copyWithZone:a3];
    uint64_t v83 = *(void **)(v5 + 328);
    *(void *)(v5 + 328) = v82;

    id v84 = [(GEOPDAllCollectionsViewResult *)self->_allCollectionsViewResult copyWithZone:a3];
    uint64_t v85 = *(void **)(v5 + 48);
    *(void *)(v5 + 48) = v84;

    id v86 = [(GEOPDAirportEntityPlaceLookupResult *)self->_airportEntityPlaceLookupResult copyWithZone:a3];
    v87 = *(void **)(v5 + 40);
    *(void *)(v5 + 40) = v86;

    id v88 = [(GEOPDTerritoryLookupResult *)self->_territoryLookupResult copyWithZone:a3];
    uint64_t v89 = *(void **)(v5 + 400);
    *(void *)(v5 + 400) = v88;

    id v90 = [(GEOPDMapsHomeResult *)self->_mapsHomeResult copyWithZone:a3];
    v91 = *(void **)(v5 + 224);
    *(void *)(v5 + 224) = v90;

    id v92 = [(GEOPDAllGuidesLocationsViewResult *)self->_allGuidesLocationsViewresult copyWithZone:a3];
    v93 = *(void **)(v5 + 56);
    *(void *)(v5 + 56) = v92;

    id v94 = [(GEOPDGuidesHomeResult *)self->_guidesHomeResult copyWithZone:a3];
    v95 = *(void **)(v5 + 200);
    *(void *)(v5 + 200) = v94;

    id v96 = [(GEOPDExtendedGeoLookupResult *)self->_extendedGeoLookupResult copyWithZone:a3];
    id v97 = *(void **)(v5 + 160);
    *(void *)(v5 + 160) = v96;

    id v98 = [(GEOPDQueryUnderstandingResult *)self->_queryUnderstandingResult copyWithZone:a3];
    v99 = *(void **)(v5 + 336);
    *(void *)(v5 + 336) = v98;

    id v100 = [(GEOPDPoiAtAddressLookupResult *)self->_poiAtAddressLookupResult copyWithZone:a3];
    id v101 = *(void **)(v5 + 312);
    *(void *)(v5 + 312) = v100;

    id v102 = [(GEOPDPlacecardEnrichmentResult *)self->_placecardEnrichmentResult copyWithZone:a3];
    id v103 = *(void **)(v5 + 304);
    *(void *)(v5 + 304) = v102;

    id v104 = [(GEOPDOfflineRegionNameResult *)self->_offlineRegionNameResult copyWithZone:a3];
    v105 = *(void **)(v5 + 264);
    *(void *)(v5 + 264) = v104;

    id v106 = [(GEOPDSearchCapabilitiesResult *)self->_searchCapabilitiesResult copyWithZone:a3];
    v107 = *(void **)(v5 + 352);
    *(void *)(v5 + 352) = v106;

    id v108 = [(GEOPDAddressRecommendationResult *)self->_addressRecommendationResult copyWithZone:a3];
    v109 = *(void **)(v5 + 32);
    *(void *)(v5 + 32) = v108;

    objc_storeStrong((id *)(v5 + 16), self->_unknownFields);
    return (id)v5;
  }
  *(void *)((char *)self->_reader + (int)*MEMORY[0x1E4F940E0]) = self->_readerMarkLength;
  [(PBDataReader *)self->_reader seekToOffset:self->_readerMarkPos];
  GEOPDPlaceGlobalResultReadAllFrom(v5, self->_reader, 0);
  os_unfair_lock_unlock(&self->_readerLock);
  objc_sync_exit(v7);

  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_104;
  }
  -[GEOPDPlaceGlobalResult readAll:]((uint64_t)self, 1);
  -[GEOPDPlaceGlobalResult readAll:]((uint64_t)v4, 1);
  searchResult = self->_searchResult;
  if ((unint64_t)searchResult | v4[46])
  {
    if (!-[GEOPDSearchResult isEqual:](searchResult, "isEqual:")) {
      goto LABEL_104;
    }
  }
  geocodingResult = self->_geocodingResult;
  if ((unint64_t)geocodingResult | v4[23] && !-[GEOPDGeocodingResult isEqual:](geocodingResult, "isEqual:")) {
    goto LABEL_104;
  }
  canonicalSearchResult = self->_canonicalSearchResult;
  if ((unint64_t)canonicalSearchResult | v4[16]
    && !-[GEOPDCanonicalLocationSearchResult isEqual:](canonicalSearchResult, "isEqual:"))
  {
    goto LABEL_104;
  }
  reverseGeocodingResult = self->_reverseGeocodingResult;
  if ((unint64_t)reverseGeocodingResult | v4[43]
    && !-[GEOPDReverseGeocodingResult isEqual:](reverseGeocodingResult, "isEqual:"))
  {
    goto LABEL_104;
  }
  placeLookupResult = self->_placeLookupResult;
  if ((unint64_t)placeLookupResult | v4[36]
    && !-[GEOPDPlaceLookupResult isEqual:](placeLookupResult, "isEqual:"))
  {
    goto LABEL_104;
  }
  merchantLookupResult = self->_merchantLookupResult;
  if ((unint64_t)merchantLookupResult | v4[31]
    && !-[GEOPDMerchantLookupResult isEqual:](merchantLookupResult, "isEqual:"))
  {
    goto LABEL_104;
  }
  placeRefinementResult = self->_placeRefinementResult;
  if ((unint64_t)placeRefinementResult | v4[37]
    && !-[GEOPDPlaceRefinementResult isEqual:](placeRefinementResult, "isEqual:"))
  {
    goto LABEL_104;
  }
  siriSearchResult = self->_siriSearchResult;
  if ((unint64_t)siriSearchResult | v4[49] && !-[GEOPDSiriSearchResult isEqual:](siriSearchResult, "isEqual:")) {
    goto LABEL_104;
  }
  locationDirectedSearchResult = self->_locationDirectedSearchResult;
  if ((unint64_t)locationDirectedSearchResult | v4[27]
    && !-[GEOPDLocationDirectedSearchResult isEqual:](locationDirectedSearchResult, "isEqual:"))
  {
    goto LABEL_104;
  }
  autocompleteResult = self->_autocompleteResult;
  if ((unint64_t)autocompleteResult | v4[8]
    && !-[GEOPDAutocompleteResult isEqual:](autocompleteResult, "isEqual:"))
  {
    goto LABEL_104;
  }
  browseCategorySuggestionResult = self->_browseCategorySuggestionResult;
  if ((unint64_t)browseCategorySuggestionResult | v4[15]
    && !-[GEOPDSearchBrowseCategorySuggestionResult isEqual:](browseCategorySuggestionResult, "isEqual:"))
  {
    goto LABEL_104;
  }
  categorySearchResult = self->_categorySearchResult;
  if ((unint64_t)categorySearchResult | v4[17]
    && !-[GEOPDCategorySearchResult isEqual:](categorySearchResult, "isEqual:"))
  {
    goto LABEL_104;
  }
  popularNearbySearchResult = self->_popularNearbySearchResult;
  if ((unint64_t)popularNearbySearchResult | v4[40]
    && !-[GEOPDPopularNearbySearchResult isEqual:](popularNearbySearchResult, "isEqual:"))
  {
    goto LABEL_104;
  }
  searchZeroKeywordCategorySuggestionResult = self->_searchZeroKeywordCategorySuggestionResult;
  if ((unint64_t)searchZeroKeywordCategorySuggestionResult | v4[47]
    && !-[GEOPDSearchZeroKeywordCategorySuggestionResult isEqual:](searchZeroKeywordCategorySuggestionResult, "isEqual:"))
  {
    goto LABEL_104;
  }
  searchFieldPlaceholderResult = self->_searchFieldPlaceholderResult;
  if ((unint64_t)searchFieldPlaceholderResult | v4[45]
    && !-[GEOPDSearchFieldPlaceholderResult isEqual:](searchFieldPlaceholderResult, "isEqual:"))
  {
    goto LABEL_104;
  }
  batchPopularNearbySearchResult = self->_batchPopularNearbySearchResult;
  if ((unint64_t)batchPopularNearbySearchResult | v4[11]
    && !-[GEOPDBatchPopularNearbySearchResult isEqual:](batchPopularNearbySearchResult, "isEqual:"))
  {
    goto LABEL_104;
  }
  vendorSpecificPlaceRefinementResult = self->_vendorSpecificPlaceRefinementResult;
  if ((unint64_t)vendorSpecificPlaceRefinementResult | v4[52]
    && !-[GEOPDVendorSpecificPlaceRefinementResult isEqual:](vendorSpecificPlaceRefinementResult, "isEqual:"))
  {
    goto LABEL_104;
  }
  nearbySearchResult = self->_nearbySearchResult;
  if ((unint64_t)nearbySearchResult | v4[32]
    && !-[GEOPDNearbySearchResult isEqual:](nearbySearchResult, "isEqual:"))
  {
    goto LABEL_104;
  }
  addressObjectGeocodingResult = self->_addressObjectGeocodingResult;
  if ((unint64_t)addressObjectGeocodingResult | v4[3]
    && !-[GEOPDAddressObjectGeocodingResult isEqual:](addressObjectGeocodingResult, "isEqual:"))
  {
    goto LABEL_104;
  }
  searchZeroKeywordWithSearchResultsSuggestionResult = self->_searchZeroKeywordWithSearchResultsSuggestionResult;
  if ((unint64_t)searchZeroKeywordWithSearchResultsSuggestionResult | v4[48]
    && !-[GEOPDSearchZeroKeywordWithSearchResultsSuggestionResult isEqual:](searchZeroKeywordWithSearchResultsSuggestionResult, "isEqual:"))
  {
    goto LABEL_104;
  }
  externalTransitLookupResult = self->_externalTransitLookupResult;
  if ((unint64_t)externalTransitLookupResult | v4[21]
    && !-[GEOPDExternalTransitLookupResult isEqual:](externalTransitLookupResult, "isEqual:"))
  {
    goto LABEL_104;
  }
  featureIdGeocodingResult = self->_featureIdGeocodingResult;
  if ((unint64_t)featureIdGeocodingResult | v4[22]
    && !-[GEOPDFeatureIdGeocodingResult isEqual:](featureIdGeocodingResult, "isEqual:"))
  {
    goto LABEL_104;
  }
  mapsIdentifierPlaceLookupResult = self->_mapsIdentifierPlaceLookupResult;
  if ((unint64_t)mapsIdentifierPlaceLookupResult | v4[29]
    && !-[GEOPDMapsIdentifierPlaceLookupResult isEqual:](mapsIdentifierPlaceLookupResult, "isEqual:"))
  {
    goto LABEL_104;
  }
  batchReverseGeocodingResult = self->_batchReverseGeocodingResult;
  if ((unint64_t)batchReverseGeocodingResult | v4[12]
    && !-[GEOPDBatchReverseGeocodingResult isEqual:](batchReverseGeocodingResult, "isEqual:"))
  {
    goto LABEL_104;
  }
  brandLookupResult = self->_brandLookupResult;
  if ((unint64_t)brandLookupResult | v4[14]
    && !-[GEOPDBrandLookupResult isEqual:](brandLookupResult, "isEqual:"))
  {
    goto LABEL_104;
  }
  wifiFingerprintResult = self->_wifiFingerprintResult;
  if ((unint64_t)wifiFingerprintResult | v4[53]
    && !-[GEOPDWifiFingerprintResult isEqual:](wifiFingerprintResult, "isEqual:"))
  {
    goto LABEL_104;
  }
  ipGeoLookupResult = self->_ipGeoLookupResult;
  if ((unint64_t)ipGeoLookupResult | v4[26]
    && !-[GEOPDIpGeoLookupResult isEqual:](ipGeoLookupResult, "isEqual:"))
  {
    goto LABEL_104;
  }
  groundViewLabelResult = self->_groundViewLabelResult;
  if ((unint64_t)groundViewLabelResult | v4[24]
    && !-[GEOPDGroundViewLabelResult isEqual:](groundViewLabelResult, "isEqual:"))
  {
    goto LABEL_104;
  }
  batchSpatialLookupResult = self->_batchSpatialLookupResult;
  if ((unint64_t)batchSpatialLookupResult | v4[13]
    && !-[GEOPDBatchSpatialLookupResult isEqual:](batchSpatialLookupResult, "isEqual:"))
  {
    goto LABEL_104;
  }
  placeGlobalCommonResult = self->_placeGlobalCommonResult;
  if ((unint64_t)placeGlobalCommonResult | v4[35]
    && !-[GEOPDPlaceGlobalCommonResult isEqual:](placeGlobalCommonResult, "isEqual:"))
  {
    goto LABEL_104;
  }
  placeCollectionLookupResult = self->_placeCollectionLookupResult;
  if ((unint64_t)placeCollectionLookupResult | v4[34]
    && !-[GEOPDPlaceCollectionLookupResult isEqual:](placeCollectionLookupResult, "isEqual:"))
  {
    goto LABEL_104;
  }
  transitScheduleLookupResult = self->_transitScheduleLookupResult;
  if ((unint64_t)transitScheduleLookupResult | v4[51]
    && !-[GEOPDTransitScheduleLookupResult isEqual:](transitScheduleLookupResult, "isEqual:"))
  {
    goto LABEL_104;
  }
  batchCategoryLookupResult = self->_batchCategoryLookupResult;
  if ((unint64_t)batchCategoryLookupResult | v4[9]
    && !-[GEOPDBatchCategoryLookupResult isEqual:](batchCategoryLookupResult, "isEqual:"))
  {
    goto LABEL_104;
  }
  batchMerchantLookupBrandResult = self->_batchMerchantLookupBrandResult;
  if ((unint64_t)batchMerchantLookupBrandResult | v4[10]
    && !-[GEOPDBatchMerchantLookupBrandResult isEqual:](batchMerchantLookupBrandResult, "isEqual:"))
  {
    goto LABEL_104;
  }
  childPlaceLookupByCategoryResult = self->_childPlaceLookupByCategoryResult;
  if ((unint64_t)childPlaceLookupByCategoryResult | v4[18]
    && !-[GEOPDChildPlaceLookupByCategoryResult isEqual:](childPlaceLookupByCategoryResult, "isEqual:"))
  {
    goto LABEL_104;
  }
  mapsSearchHomeResult = self->_mapsSearchHomeResult;
  if ((unint64_t)mapsSearchHomeResult | v4[30]
    && !-[GEOPDMapsSearchHomeResult isEqual:](mapsSearchHomeResult, "isEqual:"))
  {
    goto LABEL_104;
  }
  collectionSuggestionResult = self->_collectionSuggestionResult;
  if ((unint64_t)collectionSuggestionResult | v4[19]
    && !-[GEOPDCollectionSuggestionResult isEqual:](collectionSuggestionResult, "isEqual:"))
  {
    goto LABEL_104;
  }
  publisherViewResult = self->_publisherViewResult;
  if ((unint64_t)publisherViewResult | v4[41]
    && !-[GEOPDPublisherViewResult isEqual:](publisherViewResult, "isEqual:"))
  {
    goto LABEL_104;
  }
  allCollectionsViewResult = self->_allCollectionsViewResult;
  if ((unint64_t)allCollectionsViewResult | v4[6]
    && !-[GEOPDAllCollectionsViewResult isEqual:](allCollectionsViewResult, "isEqual:"))
  {
    goto LABEL_104;
  }
  airportEntityPlaceLookupResult = self->_airportEntityPlaceLookupResult;
  if ((unint64_t)airportEntityPlaceLookupResult | v4[5]
    && !-[GEOPDAirportEntityPlaceLookupResult isEqual:](airportEntityPlaceLookupResult, "isEqual:"))
  {
    goto LABEL_104;
  }
  territoryLookupResult = self->_territoryLookupResult;
  if ((unint64_t)territoryLookupResult | v4[50]
    && !-[GEOPDTerritoryLookupResult isEqual:](territoryLookupResult, "isEqual:"))
  {
    goto LABEL_104;
  }
  mapsHomeResult = self->_mapsHomeResult;
  if ((unint64_t)mapsHomeResult | v4[28] && !-[GEOPDMapsHomeResult isEqual:](mapsHomeResult, "isEqual:")) {
    goto LABEL_104;
  }
  allGuidesLocationsViewresult = self->_allGuidesLocationsViewresult;
  if ((unint64_t)allGuidesLocationsViewresult | v4[7]
    && !-[GEOPDAllGuidesLocationsViewResult isEqual:](allGuidesLocationsViewresult, "isEqual:"))
  {
    goto LABEL_104;
  }
  if (((guidesHomeResult = self->_guidesHomeResult, !((unint64_t)guidesHomeResult | v4[25]))
     || -[GEOPDGuidesHomeResult isEqual:](guidesHomeResult, "isEqual:"))
    && ((extendedGeoLookupResult = self->_extendedGeoLookupResult, !((unint64_t)extendedGeoLookupResult | v4[20]))
     || -[GEOPDExtendedGeoLookupResult isEqual:](extendedGeoLookupResult, "isEqual:"))
    && ((queryUnderstandingResult = self->_queryUnderstandingResult,
         !((unint64_t)queryUnderstandingResult | v4[42]))
     || -[GEOPDQueryUnderstandingResult isEqual:](queryUnderstandingResult, "isEqual:"))
    && ((poiAtAddressLookupResult = self->_poiAtAddressLookupResult,
         !((unint64_t)poiAtAddressLookupResult | v4[39]))
     || -[GEOPDPoiAtAddressLookupResult isEqual:](poiAtAddressLookupResult, "isEqual:"))
    && ((placecardEnrichmentResult = self->_placecardEnrichmentResult,
         !((unint64_t)placecardEnrichmentResult | v4[38]))
     || -[GEOPDPlacecardEnrichmentResult isEqual:](placecardEnrichmentResult, "isEqual:"))
    && ((offlineRegionNameResult = self->_offlineRegionNameResult, !((unint64_t)offlineRegionNameResult | v4[33]))
     || -[GEOPDOfflineRegionNameResult isEqual:](offlineRegionNameResult, "isEqual:"))
    && ((searchCapabilitiesResult = self->_searchCapabilitiesResult,
         !((unint64_t)searchCapabilitiesResult | v4[44]))
     || -[GEOPDSearchCapabilitiesResult isEqual:](searchCapabilitiesResult, "isEqual:")))
  {
    addressRecommendationResult = self->_addressRecommendationResult;
    if ((unint64_t)addressRecommendationResult | v4[4]) {
      char v56 = -[GEOPDAddressRecommendationResult isEqual:](addressRecommendationResult, "isEqual:");
    }
    else {
      char v56 = 1;
    }
  }
  else
  {
LABEL_104:
    char v56 = 0;
  }

  return v56;
}

- (unint64_t)hash
{
  -[GEOPDPlaceGlobalResult readAll:]((uint64_t)self, 1);
  unint64_t v3 = [(GEOPDSearchResult *)self->_searchResult hash];
  unint64_t v4 = [(GEOPDGeocodingResult *)self->_geocodingResult hash] ^ v3;
  unint64_t v5 = v4 ^ [(GEOPDCanonicalLocationSearchResult *)self->_canonicalSearchResult hash];
  unint64_t v6 = [(GEOPDReverseGeocodingResult *)self->_reverseGeocodingResult hash];
  unint64_t v7 = v5 ^ v6 ^ [(GEOPDPlaceLookupResult *)self->_placeLookupResult hash];
  unint64_t v8 = [(GEOPDMerchantLookupResult *)self->_merchantLookupResult hash];
  unint64_t v9 = v8 ^ [(GEOPDPlaceRefinementResult *)self->_placeRefinementResult hash];
  unint64_t v10 = v7 ^ v9 ^ [(GEOPDSiriSearchResult *)self->_siriSearchResult hash];
  unint64_t v11 = [(GEOPDLocationDirectedSearchResult *)self->_locationDirectedSearchResult hash];
  unint64_t v12 = v11 ^ [(GEOPDAutocompleteResult *)self->_autocompleteResult hash];
  unint64_t v13 = v12 ^ [(GEOPDSearchBrowseCategorySuggestionResult *)self->_browseCategorySuggestionResult hash];
  unint64_t v14 = v13 ^ [(GEOPDCategorySearchResult *)self->_categorySearchResult hash];
  unint64_t v15 = v10 ^ v14 ^ [(GEOPDPopularNearbySearchResult *)self->_popularNearbySearchResult hash];
  unint64_t v16 = [(GEOPDSearchZeroKeywordCategorySuggestionResult *)self->_searchZeroKeywordCategorySuggestionResult hash];
  unint64_t v17 = v16 ^ [(GEOPDSearchFieldPlaceholderResult *)self->_searchFieldPlaceholderResult hash];
  unint64_t v18 = v17 ^ [(GEOPDBatchPopularNearbySearchResult *)self->_batchPopularNearbySearchResult hash];
  unint64_t v19 = v18 ^ [(GEOPDVendorSpecificPlaceRefinementResult *)self->_vendorSpecificPlaceRefinementResult hash];
  unint64_t v20 = v19 ^ [(GEOPDNearbySearchResult *)self->_nearbySearchResult hash];
  unint64_t v21 = v15 ^ v20 ^ [(GEOPDAddressObjectGeocodingResult *)self->_addressObjectGeocodingResult hash];
  unint64_t v22 = [(GEOPDSearchZeroKeywordWithSearchResultsSuggestionResult *)self->_searchZeroKeywordWithSearchResultsSuggestionResult hash];
  unint64_t v23 = v22 ^ [(GEOPDExternalTransitLookupResult *)self->_externalTransitLookupResult hash];
  unint64_t v24 = v23 ^ [(GEOPDFeatureIdGeocodingResult *)self->_featureIdGeocodingResult hash];
  unint64_t v25 = v24 ^ [(GEOPDMapsIdentifierPlaceLookupResult *)self->_mapsIdentifierPlaceLookupResult hash];
  unint64_t v26 = v25 ^ [(GEOPDBatchReverseGeocodingResult *)self->_batchReverseGeocodingResult hash];
  unint64_t v27 = v21 ^ v26 ^ [(GEOPDBrandLookupResult *)self->_brandLookupResult hash];
  unint64_t v28 = [(GEOPDWifiFingerprintResult *)self->_wifiFingerprintResult hash];
  unint64_t v29 = v28 ^ [(GEOPDIpGeoLookupResult *)self->_ipGeoLookupResult hash];
  unint64_t v30 = v29 ^ [(GEOPDGroundViewLabelResult *)self->_groundViewLabelResult hash];
  unint64_t v31 = v30 ^ [(GEOPDBatchSpatialLookupResult *)self->_batchSpatialLookupResult hash];
  unint64_t v32 = v31 ^ [(GEOPDPlaceGlobalCommonResult *)self->_placeGlobalCommonResult hash];
  unint64_t v33 = v32 ^ [(GEOPDPlaceCollectionLookupResult *)self->_placeCollectionLookupResult hash];
  unint64_t v34 = v27 ^ v33 ^ [(GEOPDTransitScheduleLookupResult *)self->_transitScheduleLookupResult hash];
  unint64_t v35 = [(GEOPDBatchCategoryLookupResult *)self->_batchCategoryLookupResult hash];
  unint64_t v36 = v35 ^ [(GEOPDBatchMerchantLookupBrandResult *)self->_batchMerchantLookupBrandResult hash];
  unint64_t v37 = v36 ^ [(GEOPDChildPlaceLookupByCategoryResult *)self->_childPlaceLookupByCategoryResult hash];
  unint64_t v38 = v37 ^ [(GEOPDMapsSearchHomeResult *)self->_mapsSearchHomeResult hash];
  unint64_t v39 = v38 ^ [(GEOPDCollectionSuggestionResult *)self->_collectionSuggestionResult hash];
  unint64_t v40 = v39 ^ [(GEOPDPublisherViewResult *)self->_publisherViewResult hash];
  unint64_t v41 = v40 ^ [(GEOPDAllCollectionsViewResult *)self->_allCollectionsViewResult hash];
  unint64_t v42 = v34 ^ v41 ^ [(GEOPDAirportEntityPlaceLookupResult *)self->_airportEntityPlaceLookupResult hash];
  unint64_t v43 = [(GEOPDTerritoryLookupResult *)self->_territoryLookupResult hash];
  unint64_t v44 = v43 ^ [(GEOPDMapsHomeResult *)self->_mapsHomeResult hash];
  unint64_t v45 = v44 ^ [(GEOPDAllGuidesLocationsViewResult *)self->_allGuidesLocationsViewresult hash];
  unint64_t v46 = v45 ^ [(GEOPDGuidesHomeResult *)self->_guidesHomeResult hash];
  unint64_t v47 = v46 ^ [(GEOPDExtendedGeoLookupResult *)self->_extendedGeoLookupResult hash];
  unint64_t v48 = v47 ^ [(GEOPDQueryUnderstandingResult *)self->_queryUnderstandingResult hash];
  unint64_t v49 = v48 ^ [(GEOPDPoiAtAddressLookupResult *)self->_poiAtAddressLookupResult hash];
  unint64_t v50 = v49 ^ [(GEOPDPlacecardEnrichmentResult *)self->_placecardEnrichmentResult hash];
  unint64_t v51 = v42 ^ v50 ^ [(GEOPDOfflineRegionNameResult *)self->_offlineRegionNameResult hash];
  unint64_t v52 = [(GEOPDSearchCapabilitiesResult *)self->_searchCapabilitiesResult hash];
  return v51 ^ v52 ^ [(GEOPDAddressRecommendationResult *)self->_addressRecommendationResult hash];
}

- (void)mergeFrom:(void *)a1
{
  uint64_t v482 = *MEMORY[0x1E4F143B8];
  id v420 = a2;
  -[GEOPDPlaceGlobalResult readAll:]((uint64_t)v420, 0);
  uint64_t v3 = a1[46];
  unint64_t v4 = (void *)*((void *)v420 + 46);
  if (v3)
  {
    if (!v4) {
      goto LABEL_154;
    }
    id v5 = v4;
    -[GEOPDSearchResult readAll:]((uint64_t)v5, 0);
    unint64_t v6 = *(void **)(v3 + 72);
    uint64_t v7 = *((void *)v5 + 9);
    if (v6)
    {
      if (v7) {
        objc_msgSend(v6, "mergeFrom:");
      }
    }
    else if (v7)
    {
      -[GEOPDSearchResult setDisplayMapRegion:](v3, *((void **)v5 + 9));
    }
    long long v451 = 0u;
    long long v452 = 0u;
    long long v449 = 0u;
    long long v450 = 0u;
    id v8 = *((id *)v5 + 7);
    uint64_t v9 = [v8 countByEnumeratingWithState:&v449 objects:v481 count:16];
    if (v9)
    {
      uint64_t v10 = v9;
      uint64_t v11 = *(void *)v450;
      do
      {
        for (uint64_t i = 0; i != v10; ++i)
        {
          if (*(void *)v450 != v11) {
            objc_enumerationMutation(v8);
          }
          -[GEOPDSearchResult addDisambiguationLabel:](v3, *(void **)(*((void *)&v449 + 1) + 8 * i));
        }
        uint64_t v10 = [v8 countByEnumeratingWithState:&v449 objects:v481 count:16];
      }
      while (v10);
    }

    if (*((unsigned char *)v5 + 249))
    {
      *(unsigned char *)(v3 + 243) = *((unsigned char *)v5 + 243);
      *(void *)(v3 + 248) |= 0x100uLL;
    }
    long long v447 = 0u;
    long long v448 = 0u;
    long long v445 = 0u;
    long long v446 = 0u;
    id v13 = *((id *)v5 + 16);
    uint64_t v14 = [v13 countByEnumeratingWithState:&v445 objects:&v477 count:16];
    if (v14)
    {
      uint64_t v15 = v14;
      uint64_t v16 = *(void *)v446;
      do
      {
        for (uint64_t j = 0; j != v15; ++j)
        {
          if (*(void *)v446 != v16) {
            objc_enumerationMutation(v13);
          }
          -[GEOPDSearchResult addRelatedSearchSuggestion:](v3, *(void **)(*((void *)&v445 + 1) + 8 * j));
        }
        uint64_t v15 = [v13 countByEnumeratingWithState:&v445 objects:&v477 count:16];
      }
      while (v15);
    }

    if ((*((unsigned char *)v5 + 248) & 8) != 0)
    {
      *(_DWORD *)(v3 + 232) = *((_DWORD *)v5 + 58);
      *(void *)(v3 + 248) |= 8uLL;
    }
    unint64_t v18 = (void *)*((void *)v5 + 18);
    if (v18) {
      -[GEOPDSearchResult setResultDisplayHeader:](v3, v18);
    }
    uint64_t v19 = *(void *)(v3 + 40);
    unint64_t v20 = (void *)*((void *)v5 + 5);
    if (v19)
    {
      if (v20) {
        -[GEOPDRelatedSearchSuggestion mergeFrom:](v19, v20);
      }
    }
    else if (v20)
    {
      -[GEOPDSearchResult setDefaultRelatedSearchSuggestion:](v3, v20);
    }
    unint64_t v21 = *(unsigned char **)(v3 + 168);
    unint64_t v22 = (void *)*((void *)v5 + 21);
    if (v21)
    {
      if (v22) {
        -[GEOPDSearchClientBehavior mergeFrom:](v21, v22);
      }
    }
    else if (v22)
    {
      -[GEOPDSearchResult setSearchClientBehavior:](v3, v22);
    }
    long long v443 = 0u;
    long long v444 = 0u;
    long long v441 = 0u;
    long long v442 = 0u;
    id v23 = *((id *)v5 + 17);
    uint64_t v24 = [v23 countByEnumeratingWithState:&v441 objects:&v473 count:16];
    if (v24)
    {
      uint64_t v25 = v24;
      uint64_t v26 = *(void *)v442;
      do
      {
        for (uint64_t k = 0; k != v25; ++k)
        {
          if (*(void *)v442 != v26) {
            objc_enumerationMutation(v23);
          }
          -[GEOPDSearchResult addResultDetourInfo:](v3, *(void **)(*((void *)&v441 + 1) + 8 * k));
        }
        uint64_t v25 = [v23 countByEnumeratingWithState:&v441 objects:&v473 count:16];
      }
      while (v25);
    }

    uint64_t v28 = *(void *)(v3 + 48);
    unint64_t v29 = (void *)*((void *)v5 + 6);
    if (v28)
    {
      if (v29) {
        -[GEOPDDirectionIntent mergeFrom:](v28, v29);
      }
    }
    else if (v29)
    {
      -[GEOPDSearchResult setDirectionIntent:](v3, v29);
    }
    uint64_t v30 = *(void *)(v3 + 32);
    unint64_t v31 = (void *)*((void *)v5 + 4);
    if (v30)
    {
      if (v31) {
        -[GEOPDResolvedItem mergeFrom:](v30, v31);
      }
    }
    else if (v31)
    {
      -[GEOPDSearchResult setClientResolvedResult:](v3, v31);
    }
    long long v439 = 0u;
    long long v440 = 0u;
    long long v437 = 0u;
    long long v438 = 0u;
    id v32 = *((id *)v5 + 8);
    uint64_t v33 = [v32 countByEnumeratingWithState:&v437 objects:&v469 count:16];
    if (v33)
    {
      uint64_t v34 = v33;
      uint64_t v35 = *(void *)v438;
      do
      {
        for (uint64_t m = 0; m != v34; ++m)
        {
          if (*(void *)v438 != v35) {
            objc_enumerationMutation(v32);
          }
          -[GEOPDSearchResult addDisplayHeaderSubstitute:](v3, *(void **)(*((void *)&v437 + 1) + 8 * m));
        }
        uint64_t v34 = [v32 countByEnumeratingWithState:&v437 objects:&v469 count:16];
      }
      while (v34);
    }

    uint64_t v37 = *((void *)v5 + 31);
    if ((v37 & 0x40) != 0)
    {
      *(unsigned char *)(v3 + 241) = *((unsigned char *)v5 + 241);
      *(void *)(v3 + 248) |= 0x40uLL;
      uint64_t v37 = *((void *)v5 + 31);
      if ((v37 & 1) == 0)
      {
LABEL_66:
        if ((v37 & 0x200) == 0) {
          goto LABEL_67;
        }
        goto LABEL_102;
      }
    }
    else if ((v37 & 1) == 0)
    {
      goto LABEL_66;
    }
    *(_DWORD *)(v3 + 220) = *((_DWORD *)v5 + 55);
    *(void *)(v3 + 248) |= 1uLL;
    uint64_t v37 = *((void *)v5 + 31);
    if ((v37 & 0x200) == 0)
    {
LABEL_67:
      if ((v37 & 4) == 0) {
        goto LABEL_69;
      }
      goto LABEL_68;
    }
LABEL_102:
    *(unsigned char *)(v3 + 244) = *((unsigned char *)v5 + 244);
    *(void *)(v3 + 248) |= 0x200uLL;
    if ((*((void *)v5 + 31) & 4) == 0)
    {
LABEL_69:
      long long v435 = 0u;
      long long v436 = 0u;
      long long v433 = 0u;
      long long v434 = 0u;
      id v38 = *((id *)v5 + 20);
      uint64_t v39 = [v38 countByEnumeratingWithState:&v433 objects:&v465 count:16];
      if (v39)
      {
        uint64_t v40 = v39;
        uint64_t v41 = *(void *)v434;
        do
        {
          for (uint64_t n = 0; n != v40; ++n)
          {
            if (*(void *)v434 != v41) {
              objc_enumerationMutation(v38);
            }
            -[GEOPDSearchResult addRetainSearch:](v3, *(void **)(*((void *)&v433 + 1) + 8 * n));
          }
          uint64_t v40 = [v38 countByEnumeratingWithState:&v433 objects:&v465 count:16];
        }
        while (v40);
      }

      long long v431 = 0u;
      long long v432 = 0u;
      long long v429 = 0u;
      long long v430 = 0u;
      id v43 = *((id *)v5 + 22);
      uint64_t v44 = [v43 countByEnumeratingWithState:&v429 objects:&v461 count:16];
      if (v44)
      {
        uint64_t v45 = v44;
        uint64_t v46 = *(void *)v430;
        do
        {
          for (iuint64_t i = 0; ii != v45; ++ii)
          {
            if (*(void *)v430 != v46) {
              objc_enumerationMutation(v43);
            }
            -[GEOPDSearchResult addSearchResultSection:](v3, *(void **)(*((void *)&v429 + 1) + 8 * ii));
          }
          uint64_t v45 = [v43 countByEnumeratingWithState:&v429 objects:&v461 count:16];
        }
        while (v45);
      }

      long long v427 = 0u;
      long long v428 = 0u;
      long long v425 = 0u;
      long long v426 = 0u;
      id v48 = *((id *)v5 + 15);
      uint64_t v49 = [v48 countByEnumeratingWithState:&v425 objects:&v457 count:16];
      if (v49)
      {
        uint64_t v50 = v49;
        uint64_t v51 = *(void *)v426;
        do
        {
          for (juint64_t j = 0; jj != v50; ++jj)
          {
            if (*(void *)v426 != v51) {
              objc_enumerationMutation(v48);
            }
            -[GEOPDSearchResult addRelatedEntitySection:](v3, *(void **)(*((void *)&v425 + 1) + 8 * jj));
          }
          uint64_t v50 = [v48 countByEnumeratingWithState:&v425 objects:&v457 count:16];
        }
        while (v50);
      }

      long long v423 = 0u;
      long long v424 = 0u;
      long long v421 = 0u;
      long long v422 = 0u;
      id v53 = *((id *)v5 + 24);
      uint64_t v54 = [v53 countByEnumeratingWithState:&v421 objects:&v453 count:16];
      if (v54)
      {
        uint64_t v55 = v54;
        uint64_t v56 = *(void *)v422;
        do
        {
          for (uint64_t kk = 0; kk != v55; ++kk)
          {
            if (*(void *)v422 != v56) {
              objc_enumerationMutation(v53);
            }
            -[GEOPDSearchResult addSearchTierMetadata:](v3, *(void **)(*((void *)&v421 + 1) + 8 * kk));
          }
          uint64_t v55 = [v53 countByEnumeratingWithState:&v421 objects:&v453 count:16];
        }
        while (v55);
      }

      id v58 = *(void **)(v3 + 152);
      id v59 = (void *)*((void *)v5 + 19);
      if (v58)
      {
        if (v59) {
          -[GEOPDResultRefinementGroup mergeFrom:](v58, v59);
        }
      }
      else if (v59)
      {
        -[GEOPDSearchResult setResultRefinementGroup:](v3, v59);
      }
      uint64_t v60 = *(void *)(v3 + 24);
      uint64_t v61 = (void *)*((void *)v5 + 3);
      if (v60)
      {
        if (v61) {
          -[GEOPDSSearchAutoRedoThreshold mergeFrom:](v60, v61);
        }
      }
      else if (v61)
      {
        -[GEOPDSearchResult setAutoRedoSearchThreshold:](v3, v61);
      }
      id v62 = *(void **)(v3 + 104);
      uint64_t v63 = *((void *)v5 + 13);
      if (v62)
      {
        if (v63) {
          objc_msgSend(v62, "mergeFrom:");
        }
      }
      else if (v63)
      {
        -[GEOPDSearchResult setPlaceSummaryLayoutMetadata:](v3, *((void **)v5 + 13));
      }
      uint64_t v64 = *(void *)(v3 + 200);
      v65 = (void *)*((void *)v5 + 25);
      if (v64)
      {
        if (v65) {
          -[GEOPDSearchSectionList mergeFrom:](v64, (uint64_t)v65);
        }
      }
      else if (v65)
      {
        -[GEOPDSearchResult setSectionList:](v3, v65);
      }
      uint64_t v66 = *((void *)v5 + 31);
      if ((v66 & 0x20) != 0)
      {
        *(unsigned char *)(v3 + 240) = *((unsigned char *)v5 + 240);
        *(void *)(v3 + 248) |= 0x20uLL;
        uint64_t v66 = *((void *)v5 + 31);
        if ((v66 & 0x10) == 0)
        {
LABEL_123:
          if ((v66 & 0x80) == 0) {
            goto LABEL_125;
          }
          goto LABEL_124;
        }
      }
      else if ((v66 & 0x10) == 0)
      {
        goto LABEL_123;
      }
      *(_DWORD *)(v3 + 236) = *((_DWORD *)v5 + 59);
      *(void *)(v3 + 248) |= 0x10uLL;
      if ((*((void *)v5 + 31) & 0x80) == 0)
      {
LABEL_125:
        if (!*(void *)(v3 + 184))
        {
          v67 = (void *)*((void *)v5 + 23);
          if (v67) {
            -[GEOPDSearchResult setSearchSessionData:](v3, v67);
          }
        }
        id v68 = *(void **)(v3 + 88);
        uint64_t v69 = *((void *)v5 + 11);
        if (v68)
        {
          if (v69) {
            objc_msgSend(v68, "mergeFrom:");
          }
        }
        else if (v69)
        {
          -[GEOPDSearchResult setOpenPlaceCardForResultWithId:](v3, *((void **)v5 + 11));
        }
        if ((*((unsigned char *)v5 + 248) & 2) != 0)
        {
          *(_DWORD *)(v3 + 224) = *((_DWORD *)v5 + 56);
          *(void *)(v3 + 248) |= 2uLL;
        }
        uint64_t v70 = *(void *)(v3 + 80);
        v71 = (void *)*((void *)v5 + 10);
        if (v70)
        {
          if (v71) {
            -[GEOPDGuideSummaryLayoutMetadata mergeFrom:](v70, v71);
          }
        }
        else if (v71)
        {
          -[GEOPDSearchResult setGuideSummaryLayoutMetadata:](v3, v71);
        }
        uint64_t v72 = *(void *)(v3 + 96);
        v73 = (void *)*((void *)v5 + 12);
        if (v72)
        {
          if (v73) {
            -[GEOPDPaginationInfo mergeFrom:](v72, v73);
          }
        }
        else if (v73)
        {
          -[GEOPDSearchResult setPaginationInfo:](v3, v73);
        }
        uint64_t v74 = *(void *)(v3 + 112);
        v75 = (void *)*((void *)v5 + 14);
        if (v74)
        {
          if (v75) {
            -[GEOPDSSearchRedoButtonThreshold mergeFrom:](v74, v75);
          }
        }
        else if (v75)
        {
          -[GEOPDSearchResult setRedoButtonThreshold:](v3, v75);
        }

        goto LABEL_154;
      }
LABEL_124:
      *(unsigned char *)(v3 + 242) = *((unsigned char *)v5 + 242);
      *(void *)(v3 + 248) |= 0x80uLL;
      goto LABEL_125;
    }
LABEL_68:
    *(_DWORD *)(v3 + 228) = *((_DWORD *)v5 + 57);
    *(void *)(v3 + 248) |= 4uLL;
    goto LABEL_69;
  }
  if (v4) {
    -[GEOPDPlaceGlobalResult setSearchResult:]((uint64_t)a1, v4);
  }
LABEL_154:
  uint64_t v76 = a1[23];
  v77 = (id *)*((void *)v420 + 23);
  if (v76)
  {
    if (v77)
    {
      long long v477 = 0u;
      long long v478 = 0u;
      long long v479 = 0u;
      long long v480 = 0u;
      id v78 = v77[2];
      uint64_t v79 = [v78 countByEnumeratingWithState:&v477 objects:v481 count:16];
      if (v79)
      {
        uint64_t v80 = v79;
        uint64_t v81 = *(void *)v478;
        do
        {
          for (muint64_t m = 0; mm != v80; ++mm)
          {
            if (*(void *)v478 != v81) {
              objc_enumerationMutation(v78);
            }
            -[GEOPDGeocodingResult addDisambiguationLabel:](v76, *(void **)(*((void *)&v477 + 1) + 8 * mm));
          }
          uint64_t v80 = [v78 countByEnumeratingWithState:&v477 objects:v481 count:16];
        }
        while (v80);
      }
    }
  }
  else if (v77)
  {
    -[GEOPDPlaceGlobalResult setGeocodingResult:]((uint64_t)a1, v77);
  }
  if (!a1[16])
  {
    uint64_t v83 = (void *)*((void *)v420 + 16);
    if (v83) {
      -[GEOPDPlaceGlobalResult setCanonicalSearchResult:]((uint64_t)a1, v83);
    }
  }
  if (!a1[43])
  {
    id v84 = (void *)*((void *)v420 + 43);
    if (v84) {
      -[GEOPDPlaceGlobalResult setReverseGeocodingResult:]((uint64_t)a1, v84);
    }
  }
  if (!a1[36])
  {
    uint64_t v85 = (void *)*((void *)v420 + 36);
    if (v85) {
      -[GEOPDPlaceGlobalResult setPlaceLookupResult:]((uint64_t)a1, v85);
    }
  }
  id v86 = (void *)a1[31];
  uint64_t v87 = *((void *)v420 + 31);
  if (v86)
  {
    if (v87) {
      objc_msgSend(v86, "mergeFrom:");
    }
  }
  else if (v87)
  {
    -[GEOPDPlaceGlobalResult setMerchantLookupResult:]((uint64_t)a1, *((void **)v420 + 31));
  }
  if (!a1[37])
  {
    id v88 = (void *)*((void *)v420 + 37);
    if (v88) {
      -[GEOPDPlaceGlobalResult setPlaceRefinementResult:]((uint64_t)a1, v88);
    }
  }
  uint64_t v89 = a1[49];
  id v90 = (void *)*((void *)v420 + 49);
  if (v89)
  {
    if (v90)
    {
      v91 = v90;
      -[GEOPDSiriSearchResult readAll:]((uint64_t)v91, 0);
      long long v476 = 0u;
      long long v475 = 0u;
      long long v474 = 0u;
      long long v473 = 0u;
      id v92 = v91[3];
      uint64_t v93 = [v92 countByEnumeratingWithState:&v473 objects:v481 count:16];
      if (v93)
      {
        uint64_t v94 = v93;
        uint64_t v95 = *(void *)v474;
        do
        {
          for (nuint64_t n = 0; nn != v94; ++nn)
          {
            if (*(void *)v474 != v95) {
              objc_enumerationMutation(v92);
            }
            -[GEOPDSiriSearchResult addDisambiguationLabel:](v89, *(void **)(*((void *)&v473 + 1) + 8 * nn));
          }
          uint64_t v94 = [v92 countByEnumeratingWithState:&v473 objects:v481 count:16];
        }
        while (v94);
      }

      long long v472 = 0u;
      long long v471 = 0u;
      long long v470 = 0u;
      long long v469 = 0u;
      id v97 = v91[4];
      uint64_t v98 = [v97 countByEnumeratingWithState:&v469 objects:&v477 count:16];
      if (v98)
      {
        uint64_t v99 = v98;
        uint64_t v100 = *(void *)v470;
        do
        {
          for (uint64_t i1 = 0; i1 != v99; ++i1)
          {
            if (*(void *)v470 != v100) {
              objc_enumerationMutation(v97);
            }
            -[GEOPDSiriSearchResult addResultDetourInfo:](v89, *(void **)(*((void *)&v469 + 1) + 8 * i1));
          }
          uint64_t v99 = [v97 countByEnumeratingWithState:&v469 objects:&v477 count:16];
        }
        while (v99);
      }

      if ((_BYTE)v91[7])
      {
        *(unsigned char *)(v89 + 52) = *((unsigned char *)v91 + 52);
        *(unsigned char *)(v89 + 56) |= 1u;
      }
    }
  }
  else if (v90)
  {
    -[GEOPDPlaceGlobalResult setSiriSearchResult:]((uint64_t)a1, v90);
  }
  uint64_t v102 = a1[27];
  id v103 = (void *)*((void *)v420 + 27);
  if (v102)
  {
    if (v103)
    {
      id v104 = v103;
      -[GEOPDLocationDirectedSearchResult readAll:]((uint64_t)v104, 0);
      v105 = *(void **)(v102 + 32);
      uint64_t v106 = *((void *)v104 + 4);
      if (v105)
      {
        if (v106) {
          objc_msgSend(v105, "mergeFrom:");
        }
      }
      else if (v106)
      {
        -[GEOPDLocationDirectedSearchResult setDisplayMapRegion:](v102, *((void **)v104 + 4));
      }
      long long v480 = 0u;
      long long v479 = 0u;
      long long v478 = 0u;
      long long v477 = 0u;
      id v107 = *((id *)v104 + 3);
      uint64_t v108 = [v107 countByEnumeratingWithState:&v477 objects:v481 count:16];
      if (v108)
      {
        uint64_t v109 = v108;
        uint64_t v110 = *(void *)v478;
        do
        {
          for (uint64_t i2 = 0; i2 != v109; ++i2)
          {
            if (*(void *)v478 != v110) {
              objc_enumerationMutation(v107);
            }
            -[GEOPDLocationDirectedSearchResult addDisambiguationLabel:](v102, *(void **)(*((void *)&v477 + 1) + 8 * i2));
          }
          uint64_t v109 = [v107 countByEnumeratingWithState:&v477 objects:v481 count:16];
        }
        while (v109);
      }

      uint64_t v112 = *(void *)(v102 + 40);
      v113 = (void *)*((void *)v104 + 5);
      if (v112)
      {
        if (v113) {
          -[GEOPDPaginationInfo mergeFrom:](v112, v113);
        }
      }
      else if (v113)
      {
        -[GEOPDLocationDirectedSearchResult setPaginationInfo:](v102, v113);
      }
    }
  }
  else if (v103)
  {
    -[GEOPDPlaceGlobalResult setLocationDirectedSearchResult:]((uint64_t)a1, v103);
  }
  uint64_t v114 = a1[8];
  char v115 = (void *)*((void *)v420 + 8);
  if (v114)
  {
    if (!v115) {
      goto LABEL_287;
    }
    v116 = v115;
    -[GEOPDAutocompleteResult readAll:]((uint64_t)v116, 0);
    long long v472 = 0u;
    long long v471 = 0u;
    long long v470 = 0u;
    long long v469 = 0u;
    id v117 = v116[7];
    uint64_t v118 = [v117 countByEnumeratingWithState:&v469 objects:v481 count:16];
    if (v118)
    {
      uint64_t v119 = v118;
      uint64_t v120 = *(void *)v470;
      do
      {
        for (uint64_t i3 = 0; i3 != v119; ++i3)
        {
          if (*(void *)v470 != v120) {
            objc_enumerationMutation(v117);
          }
          -[GEOPDAutocompleteResult addSections:]((os_unfair_lock_s *)v114, *(void **)(*((void *)&v469 + 1) + 8 * i3));
        }
        uint64_t v119 = [v117 countByEnumeratingWithState:&v469 objects:v481 count:16];
      }
      while (v119);
    }

    int v122 = *((_DWORD *)v116 + 26);
    if ((v122 & 8) != 0)
    {
      *(unsigned char *)(v114 + 96) = *((unsigned char *)v116 + 96);
      *(_DWORD *)(v114 + 104) |= 8u;
      int v122 = *((_DWORD *)v116 + 26);
      if ((v122 & 0x100) == 0)
      {
LABEL_237:
        if ((v122 & 4) == 0) {
          goto LABEL_238;
        }
        goto LABEL_265;
      }
    }
    else if ((v122 & 0x100) == 0)
    {
      goto LABEL_237;
    }
    *(unsigned char *)(v114 + 101) = *((unsigned char *)v116 + 101);
    *(_DWORD *)(v114 + 104) |= 0x100u;
    int v122 = *((_DWORD *)v116 + 26);
    if ((v122 & 4) == 0)
    {
LABEL_238:
      if ((v122 & 0x20) == 0) {
        goto LABEL_240;
      }
      goto LABEL_239;
    }
LABEL_265:
    *(_DWORD *)(v114 + 92) = *((_DWORD *)v116 + 23);
    *(_DWORD *)(v114 + 104) |= 4u;
    if ((v116[13] & 0x20) == 0)
    {
LABEL_240:
      long long v467 = 0u;
      long long v468 = 0u;
      long long v465 = 0u;
      long long v466 = 0u;
      id v123 = v116[8];
      uint64_t v124 = [v123 countByEnumeratingWithState:&v465 objects:&v477 count:16];
      if (v124)
      {
        uint64_t v125 = v124;
        uint64_t v126 = *(void *)v466;
        do
        {
          for (uint64_t i4 = 0; i4 != v125; ++i4)
          {
            if (*(void *)v466 != v126) {
              objc_enumerationMutation(v123);
            }
            -[GEOPDAutocompleteResult addSortPriorityMapping:]((os_unfair_lock_s *)v114, *(void **)(*((void *)&v465 + 1) + 8 * i4));
          }
          uint64_t v125 = [v123 countByEnumeratingWithState:&v465 objects:&v477 count:16];
        }
        while (v125);
      }

      if (((_BYTE)v116[13] & 0x40) != 0)
      {
        *(unsigned char *)(v114 + 99) = *((unsigned char *)v116 + 99);
        *(_DWORD *)(v114 + 104) |= 0x40u;
      }
      long long v463 = 0u;
      long long v464 = 0u;
      long long v461 = 0u;
      long long v462 = 0u;
      id v128 = v116[4];
      uint64_t v129 = [v128 countByEnumeratingWithState:&v461 objects:&v473 count:16];
      if (v129)
      {
        uint64_t v130 = v129;
        uint64_t v131 = *(void *)v462;
        do
        {
          for (uint64_t i5 = 0; i5 != v130; ++i5)
          {
            if (*(void *)v462 != v131) {
              objc_enumerationMutation(v128);
            }
            -[GEOPDAutocompleteResult addClientRankingFeatureMetadata:]((os_unfair_lock_s *)v114, *(void **)(*((void *)&v461 + 1) + 8 * i5));
          }
          uint64_t v130 = [v128 countByEnumeratingWithState:&v461 objects:&v473 count:16];
        }
        while (v130);
      }

      if (((_BYTE)v116[13] & 0x80) != 0)
      {
        *(unsigned char *)(v114 + 100) = *((unsigned char *)v116 + 100);
        *(_DWORD *)(v114 + 104) |= 0x80u;
      }
      v133 = *(void **)(v114 + 24);
      id v134 = v116[3];
      if (v133)
      {
        if (v134) {
          objc_msgSend(v133, "mergeFrom:");
        }
      }
      else if (v134)
      {
        -[GEOPDAutocompleteResult setAutocompleteSessionData:](v114, v116[3]);
      }
      uint64_t v135 = *(void *)(v114 + 40);
      id v136 = v116[5];
      if (v135)
      {
        if (v136) {
          -[GEOPDParsecQueryRankingFeatures mergeFrom:](v135, v136);
        }
      }
      else if (v136)
      {
        -[GEOPDAutocompleteResult setParsecQueryRankingFeatures:](v114, v136);
      }
      if ((*((unsigned char *)v116 + 105) & 2) != 0)
      {
        *(unsigned char *)(v114 + 102) = *((unsigned char *)v116 + 102);
        *(_DWORD *)(v114 + 104) |= 0x200u;
      }
      v137 = *(void **)(v114 + 48);
      id v138 = v116[6];
      if (v137)
      {
        if (v138) {
          objc_msgSend(v137, "mergeFrom:");
        }
      }
      else if (v138)
      {
        -[GEOPDAutocompleteResult setPlaceSummaryLayoutMetadata:](v114, v116[6]);
      }
      int v139 = *((_DWORD *)v116 + 26);
      if ((v139 & 0x400) != 0)
      {
        *(unsigned char *)(v114 + 103) = *((unsigned char *)v116 + 103);
        *(_DWORD *)(v114 + 104) |= 0x400u;
        int v139 = *((_DWORD *)v116 + 26);
        if ((v139 & 1) == 0)
        {
LABEL_283:
          if ((v139 & 2) == 0) {
            goto LABEL_284;
          }
          goto LABEL_308;
        }
      }
      else if ((v139 & 1) == 0)
      {
        goto LABEL_283;
      }
      *(_DWORD *)(v114 + 84) = *((_DWORD *)v116 + 21);
      *(_DWORD *)(v114 + 104) |= 1u;
      int v139 = *((_DWORD *)v116 + 26);
      if ((v139 & 2) == 0)
      {
LABEL_284:
        if ((v139 & 0x10) == 0)
        {
LABEL_286:

          goto LABEL_287;
        }
LABEL_285:
        *(unsigned char *)(v114 + 97) = *((unsigned char *)v116 + 97);
        *(_DWORD *)(v114 + 104) |= 0x10u;
        goto LABEL_286;
      }
LABEL_308:
      *(_DWORD *)(v114 + 88) = *((_DWORD *)v116 + 22);
      *(_DWORD *)(v114 + 104) |= 2u;
      if ((v116[13] & 0x10) == 0) {
        goto LABEL_286;
      }
      goto LABEL_285;
    }
LABEL_239:
    *(unsigned char *)(v114 + 98) = *((unsigned char *)v116 + 98);
    *(_DWORD *)(v114 + 104) |= 0x20u;
    goto LABEL_240;
  }
  if (v115) {
    -[GEOPDPlaceGlobalResult setAutocompleteResult:]((uint64_t)a1, v115);
  }
LABEL_287:
  uint64_t v140 = a1[15];
  v141 = (id *)*((void *)v420 + 15);
  if (v140)
  {
    if (v141)
    {
      long long v477 = 0u;
      long long v478 = 0u;
      long long v479 = 0u;
      long long v480 = 0u;
      id v142 = v141[2];
      uint64_t v143 = [v142 countByEnumeratingWithState:&v477 objects:v481 count:16];
      if (v143)
      {
        uint64_t v144 = v143;
        uint64_t v145 = *(void *)v478;
        do
        {
          for (uint64_t i6 = 0; i6 != v144; ++i6)
          {
            if (*(void *)v478 != v145) {
              objc_enumerationMutation(v142);
            }
            -[GEOPDSearchBrowseCategorySuggestionResult addCategory:](v140, *(void **)(*((void *)&v477 + 1) + 8 * i6));
          }
          uint64_t v144 = [v142 countByEnumeratingWithState:&v477 objects:v481 count:16];
        }
        while (v144);
      }
    }
  }
  else if (v141)
  {
    -[GEOPDPlaceGlobalResult setBrowseCategorySuggestionResult:]((uint64_t)a1, v141);
  }
  uint64_t v147 = a1[17];
  v148 = (void *)*((void *)v420 + 17);
  if (v147)
  {
    if (!v148) {
      goto LABEL_414;
    }
    id v149 = v148;
    -[GEOPDCategorySearchResult readAll:]((uint64_t)v149, 0);
    uint64_t v150 = *(void **)(v147 + 56);
    uint64_t v151 = *((void *)v149 + 7);
    if (v150)
    {
      if (v151) {
        objc_msgSend(v150, "mergeFrom:");
      }
    }
    else if (v151)
    {
      -[GEOPDCategorySearchResult setDisplayMapRegion:](v147, *((void **)v149 + 7));
    }
    if ((*((unsigned char *)v149 + 184) & 0x20) != 0)
    {
      *(unsigned char *)(v147 + 183) = *((unsigned char *)v149 + 183);
      *(_DWORD *)(v147 + 184) |= 0x20u;
    }
    long long v463 = 0u;
    long long v464 = 0u;
    long long v461 = 0u;
    long long v462 = 0u;
    id v152 = *((id *)v149 + 13);
    uint64_t v153 = [v152 countByEnumeratingWithState:&v461 objects:v481 count:16];
    if (v153)
    {
      uint64_t v154 = v153;
      uint64_t v155 = *(void *)v462;
      do
      {
        for (uint64_t i7 = 0; i7 != v154; ++i7)
        {
          if (*(void *)v462 != v155) {
            objc_enumerationMutation(v152);
          }
          -[GEOPDCategorySearchResult addRelatedSearchSuggestion:]((os_unfair_lock_s *)v147, *(void **)(*((void *)&v461 + 1) + 8 * i7));
        }
        uint64_t v154 = [v152 countByEnumeratingWithState:&v461 objects:v481 count:16];
      }
      while (v154);
    }

    long long v459 = 0u;
    long long v460 = 0u;
    long long v457 = 0u;
    long long v458 = 0u;
    id v157 = *((id *)v149 + 14);
    uint64_t v158 = [v157 countByEnumeratingWithState:&v457 objects:&v477 count:16];
    if (v158)
    {
      uint64_t v159 = v158;
      uint64_t v160 = *(void *)v458;
      do
      {
        for (uint64_t i8 = 0; i8 != v159; ++i8)
        {
          if (*(void *)v458 != v160) {
            objc_enumerationMutation(v157);
          }
          -[GEOPDCategorySearchResult addResultDetourInfo:]((os_unfair_lock_s *)v147, *(void **)(*((void *)&v457 + 1) + 8 * i8));
        }
        uint64_t v159 = [v157 countByEnumeratingWithState:&v457 objects:&v477 count:16];
      }
      while (v159);
    }

    uint64_t v162 = *(void *)(v147 + 48);
    id v163 = (void *)*((void *)v149 + 6);
    if (v162)
    {
      if (v163) {
        -[GEOPDRelatedSearchSuggestion mergeFrom:](v162, v163);
      }
    }
    else if (v163)
    {
      -[GEOPDCategorySearchResult setDefaultRelatedSearchSuggestion:](v147, v163);
    }
    uint64_t v164 = *(unsigned char **)(v147 + 128);
    uint64_t v165 = (void *)*((void *)v149 + 16);
    if (v164)
    {
      if (v165) {
        -[GEOPDSearchClientBehavior mergeFrom:](v164, v165);
      }
    }
    else if (v165)
    {
      -[GEOPDCategorySearchResult setSearchClientBehavior:](v147, v165);
    }
    if ((*((unsigned char *)v149 + 184) & 8) != 0)
    {
      *(unsigned char *)(v147 + 181) = *((unsigned char *)v149 + 181);
      *(_DWORD *)(v147 + 184) |= 8u;
    }
    long long v455 = 0u;
    long long v456 = 0u;
    long long v453 = 0u;
    long long v454 = 0u;
    id v166 = *((id *)v149 + 4);
    uint64_t v167 = [v166 countByEnumeratingWithState:&v453 objects:&v473 count:16];
    if (v167)
    {
      uint64_t v168 = v167;
      uint64_t v169 = *(void *)v454;
      do
      {
        for (uint64_t i9 = 0; i9 != v168; ++i9)
        {
          if (*(void *)v454 != v169) {
            objc_enumerationMutation(v166);
          }
          -[GEOPDCategorySearchResult addBrowseCategory:]((os_unfair_lock_s *)v147, *(void **)(*((void *)&v453 + 1) + 8 * i9));
        }
        uint64_t v168 = [v166 countByEnumeratingWithState:&v453 objects:&v473 count:16];
      }
      while (v168);
    }

    uint64_t v171 = *(void *)(v147 + 40);
    id v172 = (void *)*((void *)v149 + 5);
    if (v171)
    {
      if (v172) {
        -[GEOPDSCategorySearchResultSection mergeFrom:](v171, v172);
      }
    }
    else if (v172)
    {
      -[GEOPDCategorySearchResult setCategorySearchResultSection:](v147, v172);
    }
    long long v451 = 0u;
    long long v452 = 0u;
    long long v449 = 0u;
    long long v450 = 0u;
    id v173 = *((id *)v149 + 12);
    uint64_t v174 = [v173 countByEnumeratingWithState:&v449 objects:&v469 count:16];
    if (v174)
    {
      uint64_t v175 = v174;
      uint64_t v176 = *(void *)v450;
      do
      {
        for (uint64_t i10 = 0; i10 != v175; ++i10)
        {
          if (*(void *)v450 != v176) {
            objc_enumerationMutation(v173);
          }
          -[GEOPDCategorySearchResult addRelatedEntitySection:]((os_unfair_lock_s *)v147, *(void **)(*((void *)&v449 + 1) + 8 * i10));
        }
        uint64_t v175 = [v173 countByEnumeratingWithState:&v449 objects:&v469 count:16];
      }
      while (v175);
    }

    long long v447 = 0u;
    long long v448 = 0u;
    long long v445 = 0u;
    long long v446 = 0u;
    id v178 = *((id *)v149 + 18);
    uint64_t v179 = [v178 countByEnumeratingWithState:&v445 objects:&v465 count:16];
    if (v179)
    {
      uint64_t v180 = v179;
      uint64_t v181 = *(void *)v446;
      do
      {
        for (uint64_t i11 = 0; i11 != v180; ++i11)
        {
          if (*(void *)v446 != v181) {
            objc_enumerationMutation(v178);
          }
          -[GEOPDCategorySearchResult addSearchTierMetadata:](v147, *(void **)(*((void *)&v445 + 1) + 8 * i11));
        }
        uint64_t v180 = [v178 countByEnumeratingWithState:&v445 objects:&v465 count:16];
      }
      while (v180);
    }

    id v183 = *(void **)(v147 + 120);
    id v184 = (void *)*((void *)v149 + 15);
    if (v183)
    {
      if (v184) {
        -[GEOPDResultRefinementGroup mergeFrom:](v183, v184);
      }
    }
    else if (v184)
    {
      -[GEOPDCategorySearchResult setResultRefinementGroup:](v147, v184);
    }
    uint64_t v185 = *(void *)(v147 + 24);
    v186 = (void *)*((void *)v149 + 3);
    if (v185)
    {
      if (v186) {
        -[GEOPDSSearchAutoRedoThreshold mergeFrom:](v185, v186);
      }
    }
    else if (v186)
    {
      -[GEOPDCategorySearchResult setAutoRedoSearchThreshold:](v147, v186);
    }
    v187 = *(void **)(v147 + 80);
    uint64_t v188 = *((void *)v149 + 10);
    if (v187)
    {
      if (v188) {
        objc_msgSend(v187, "mergeFrom:");
      }
    }
    else if (v188)
    {
      -[GEOPDCategorySearchResult setPlaceSummaryLayoutMetadata:](v147, *((void **)v149 + 10));
    }
    uint64_t v189 = *(void *)(v147 + 152);
    v190 = (void *)*((void *)v149 + 19);
    if (v189)
    {
      if (v190) {
        -[GEOPDSearchSectionList mergeFrom:](v189, (uint64_t)v190);
      }
    }
    else if (v190)
    {
      -[GEOPDCategorySearchResult setSectionList:](v147, v190);
    }
    int v191 = *((_DWORD *)v149 + 46);
    if ((v191 & 4) != 0)
    {
      *(unsigned char *)(v147 + 180) = *((unsigned char *)v149 + 180);
      *(_DWORD *)(v147 + 184) |= 4u;
      int v191 = *((_DWORD *)v149 + 46);
      if ((v191 & 2) == 0)
      {
LABEL_388:
        if ((v191 & 0x10) == 0) {
          goto LABEL_390;
        }
        goto LABEL_389;
      }
    }
    else if ((v191 & 2) == 0)
    {
      goto LABEL_388;
    }
    *(_DWORD *)(v147 + 176) = *((_DWORD *)v149 + 44);
    *(_DWORD *)(v147 + 184) |= 2u;
    if ((*((_DWORD *)v149 + 46) & 0x10) == 0)
    {
LABEL_390:
      if (!*(void *)(v147 + 136))
      {
        v192 = (void *)*((void *)v149 + 17);
        if (v192) {
          -[GEOPDCategorySearchResult setSearchSessionData:](v147, v192);
        }
      }
      if (*((unsigned char *)v149 + 184))
      {
        *(_DWORD *)(v147 + 172) = *((_DWORD *)v149 + 43);
        *(_DWORD *)(v147 + 184) |= 1u;
      }
      uint64_t v193 = *(void *)(v147 + 64);
      v194 = (void *)*((void *)v149 + 8);
      if (v193)
      {
        if (v194) {
          -[GEOPDGuideSummaryLayoutMetadata mergeFrom:](v193, v194);
        }
      }
      else if (v194)
      {
        -[GEOPDCategorySearchResult setGuideSummaryLayoutMetadata:](v147, v194);
      }
      uint64_t v195 = *(void *)(v147 + 72);
      id v196 = (void *)*((void *)v149 + 9);
      if (v195)
      {
        if (v196) {
          -[GEOPDPaginationInfo mergeFrom:](v195, v196);
        }
      }
      else if (v196)
      {
        -[GEOPDCategorySearchResult setPaginationInfo:](v147, v196);
      }
      uint64_t v197 = *(void *)(v147 + 88);
      v198 = (void *)*((void *)v149 + 11);
      if (v197)
      {
        if (v198) {
          -[GEOPDSSearchRedoButtonThreshold mergeFrom:](v197, v198);
        }
      }
      else if (v198)
      {
        -[GEOPDCategorySearchResult setRedoButtonThreshold:](v147, v198);
      }

      goto LABEL_414;
    }
LABEL_389:
    *(unsigned char *)(v147 + 182) = *((unsigned char *)v149 + 182);
    *(_DWORD *)(v147 + 184) |= 0x10u;
    goto LABEL_390;
  }
  if (v148) {
    -[GEOPDPlaceGlobalResult setCategorySearchResult:]((uint64_t)a1, v148);
  }
LABEL_414:
  uint64_t v199 = a1[40];
  char v200 = (void *)*((void *)v420 + 40);
  if (v199)
  {
    if (v200)
    {
      id v201 = v200;
      -[GEOPDPopularNearbySearchResult readAll:]((uint64_t)v201, 0);
      id v202 = *(void **)(v199 + 24);
      uint64_t v203 = *((void *)v201 + 3);
      if (v202)
      {
        if (v203) {
          objc_msgSend(v202, "mergeFrom:");
        }
      }
      else if (v203)
      {
        -[GEOPDPopularNearbySearchResult setDisplayMapRegion:](v199, *((void **)v201 + 3));
      }
      int v204 = (void *)*((void *)v201 + 4);
      if (v204) {
        -[GEOPDPopularNearbySearchResult setSectionHeader:](v199, v204);
      }
      if (*((unsigned char *)v201 + 56))
      {
        *(unsigned char *)(v199 + 52) = *((unsigned char *)v201 + 52);
        *(unsigned char *)(v199 + 56) |= 1u;
      }
    }
  }
  else if (v200)
  {
    -[GEOPDPlaceGlobalResult setPopularNearbySearchResult:]((uint64_t)a1, v200);
  }
  uint64_t v205 = a1[47];
  v206 = (void *)*((void *)v420 + 47);
  if (v205)
  {
    if (v206)
    {
      char v207 = v206;
      -[GEOPDSearchZeroKeywordCategorySuggestionResult readAll:]((uint64_t)v207, 0);
      long long v476 = 0u;
      long long v475 = 0u;
      long long v474 = 0u;
      long long v473 = 0u;
      id v208 = v207[3];
      uint64_t v209 = [v208 countByEnumeratingWithState:&v473 objects:v481 count:16];
      if (v209)
      {
        uint64_t v210 = v209;
        uint64_t v211 = *(void *)v474;
        do
        {
          for (uint64_t i12 = 0; i12 != v210; ++i12)
          {
            if (*(void *)v474 != v211) {
              objc_enumerationMutation(v208);
            }
            -[GEOPDSearchZeroKeywordCategorySuggestionResult addCategory:](v205, *(void **)(*((void *)&v473 + 1) + 8 * i12));
          }
          uint64_t v210 = [v208 countByEnumeratingWithState:&v473 objects:v481 count:16];
        }
        while (v210);
      }

      long long v472 = 0u;
      long long v471 = 0u;
      long long v470 = 0u;
      long long v469 = 0u;
      id v213 = v207[4];
      uint64_t v214 = [v213 countByEnumeratingWithState:&v469 objects:&v477 count:16];
      if (v214)
      {
        uint64_t v215 = v214;
        uint64_t v216 = *(void *)v470;
        do
        {
          for (uint64_t i13 = 0; i13 != v215; ++i13)
          {
            if (*(void *)v470 != v216) {
              objc_enumerationMutation(v213);
            }
            -[GEOPDSearchZeroKeywordCategorySuggestionResult addZeroKeywordEntry:](v205, *(void **)(*((void *)&v469 + 1) + 8 * i13));
          }
          uint64_t v215 = [v213 countByEnumeratingWithState:&v469 objects:&v477 count:16];
        }
        while (v215);
      }
    }
  }
  else if (v206)
  {
    -[GEOPDPlaceGlobalResult setSearchZeroKeywordCategorySuggestionResult:]((uint64_t)a1, v206);
  }
  uint64_t v218 = a1[45];
  v219 = (void *)*((void *)v420 + 45);
  if (v218)
  {
    if (v219)
    {
      v220 = (void *)v219[2];
      if (v220) {
        -[GEOPDSearchFieldPlaceholderResult setDisplayString:](v218, v220);
      }
    }
  }
  else if (v219)
  {
    -[GEOPDPlaceGlobalResult setSearchFieldPlaceholderResult:]((uint64_t)a1, v219);
  }
  uint64_t v221 = a1[11];
  v222 = (id *)*((void *)v420 + 11);
  if (v221)
  {
    if (v222)
    {
      long long v477 = 0u;
      long long v478 = 0u;
      long long v479 = 0u;
      long long v480 = 0u;
      id v223 = v222[2];
      uint64_t v224 = [v223 countByEnumeratingWithState:&v477 objects:v481 count:16];
      if (v224)
      {
        uint64_t v225 = v224;
        uint64_t v226 = *(void *)v478;
        do
        {
          for (uint64_t i14 = 0; i14 != v225; ++i14)
          {
            if (*(void *)v478 != v226) {
              objc_enumerationMutation(v223);
            }
            -[GEOPDBatchPopularNearbySearchResult addPopularNearbyResult:](v221, *(void **)(*((void *)&v477 + 1) + 8 * i14));
          }
          uint64_t v225 = [v223 countByEnumeratingWithState:&v477 objects:v481 count:16];
        }
        while (v225);
      }
    }
  }
  else if (v222)
  {
    -[GEOPDPlaceGlobalResult setBatchPopularNearbySearchResult:]((uint64_t)a1, v222);
  }
  if (!a1[52])
  {
    v228 = (void *)*((void *)v420 + 52);
    if (v228) {
      -[GEOPDPlaceGlobalResult setVendorSpecificPlaceRefinementResult:]((uint64_t)a1, v228);
    }
  }
  if (!a1[32])
  {
    v229 = (void *)*((void *)v420 + 32);
    if (v229) {
      -[GEOPDPlaceGlobalResult setNearbySearchResult:]((uint64_t)a1, v229);
    }
  }
  uint64_t v230 = a1[3];
  id v231 = (id *)*((void *)v420 + 3);
  if (v230)
  {
    if (v231)
    {
      long long v477 = 0u;
      long long v478 = 0u;
      long long v479 = 0u;
      long long v480 = 0u;
      id v232 = v231[2];
      uint64_t v233 = [v232 countByEnumeratingWithState:&v477 objects:v481 count:16];
      if (v233)
      {
        uint64_t v234 = v233;
        uint64_t v235 = *(void *)v478;
        do
        {
          for (uint64_t i15 = 0; i15 != v234; ++i15)
          {
            if (*(void *)v478 != v235) {
              objc_enumerationMutation(v232);
            }
            -[GEOPDAddressObjectGeocodingResult addDisambiguationLabel:](v230, *(void **)(*((void *)&v477 + 1) + 8 * i15));
          }
          uint64_t v234 = [v232 countByEnumeratingWithState:&v477 objects:v481 count:16];
        }
        while (v234);
      }
    }
  }
  else if (v231)
  {
    -[GEOPDPlaceGlobalResult setAddressObjectGeocodingResult:]((uint64_t)a1, v231);
  }
  uint64_t v237 = a1[48];
  v238 = (id *)*((void *)v420 + 48);
  if (v237)
  {
    if (v238)
    {
      long long v477 = 0u;
      long long v478 = 0u;
      long long v479 = 0u;
      long long v480 = 0u;
      id v239 = v238[2];
      uint64_t v240 = [v239 countByEnumeratingWithState:&v477 objects:v481 count:16];
      if (v240)
      {
        uint64_t v241 = v240;
        uint64_t v242 = *(void *)v478;
        do
        {
          for (uint64_t i16 = 0; i16 != v241; ++i16)
          {
            if (*(void *)v478 != v242) {
              objc_enumerationMutation(v239);
            }
            -[GEOPDSearchZeroKeywordWithSearchResultsSuggestionResult addSearchResultsForCategoryEntry:](v237, *(void **)(*((void *)&v477 + 1) + 8 * i16));
          }
          uint64_t v241 = [v239 countByEnumeratingWithState:&v477 objects:v481 count:16];
        }
        while (v241);
      }
    }
  }
  else if (v238)
  {
    -[GEOPDPlaceGlobalResult setSearchZeroKeywordWithSearchResultsSuggestionResult:]((uint64_t)a1, v238);
  }
  uint64_t v244 = a1[21];
  v245 = (void *)*((void *)v420 + 21);
  if (v244)
  {
    if (v245)
    {
      id v246 = (void *)v245[2];
      if (v246) {
        -[GEOPDExternalTransitLookupResult setProviderId:](v244, v246);
      }
    }
  }
  else if (v245)
  {
    -[GEOPDPlaceGlobalResult setExternalTransitLookupResult:]((uint64_t)a1, v245);
  }
  if (!a1[22])
  {
    v247 = (void *)*((void *)v420 + 22);
    if (v247) {
      -[GEOPDPlaceGlobalResult setFeatureIdGeocodingResult:]((uint64_t)a1, v247);
    }
  }
  if (!a1[29])
  {
    id v248 = (void *)*((void *)v420 + 29);
    if (v248) {
      -[GEOPDPlaceGlobalResult setMapsIdentifierPlaceLookupResult:]((uint64_t)a1, v248);
    }
  }
  if (!a1[12])
  {
    uint64_t v249 = (void *)*((void *)v420 + 12);
    if (v249) {
      -[GEOPDPlaceGlobalResult setBatchReverseGeocodingResult:]((uint64_t)a1, v249);
    }
  }
  if (!a1[14])
  {
    uint64_t v250 = (void *)*((void *)v420 + 14);
    if (v250) {
      -[GEOPDPlaceGlobalResult setBrandLookupResult:]((uint64_t)a1, v250);
    }
  }
  if (!a1[53])
  {
    uint64_t v251 = (void *)*((void *)v420 + 53);
    if (v251) {
      -[GEOPDPlaceGlobalResult setWifiFingerprintResult:]((uint64_t)a1, v251);
    }
  }
  uint64_t v252 = a1[26];
  v253 = (void *)*((void *)v420 + 26);
  if (v252)
  {
    if (v253)
    {
      id v254 = v253;
      -[GEOPDIpGeoLookupResult readAll:]((uint64_t)v254, 0);
      if (*((unsigned char *)v254 + 72))
      {
        *(_DWORD *)(v252 + 68) = *((_DWORD *)v254 + 17);
        *(unsigned char *)(v252 + 72) |= 1u;
      }
      uint64_t v255 = (void *)*((void *)v254 + 4);
      if (v255) {
        -[GEOPDIpGeoLookupResult setIpAddress:](v252, v255);
      }
      v256 = *(void **)(v252 + 40);
      uint64_t v257 = *((void *)v254 + 5);
      if (v256)
      {
        if (v257) {
          objc_msgSend(v256, "mergeFrom:");
        }
      }
      else if (v257)
      {
        -[GEOPDIpGeoLookupResult setLocation:](v252, *((void **)v254 + 5));
      }
      v258 = (void *)*((void *)v254 + 3);
      if (v258) {
        -[GEOPDIpGeoLookupResult setCountryCode:](v252, v258);
      }
      v259 = (void *)*((void *)v254 + 6);
      if (v259) {
        -[GEOPDIpGeoLookupResult setTimeZome:](v252, v259);
      }
    }
  }
  else if (v253)
  {
    -[GEOPDPlaceGlobalResult setIpGeoLookupResult:]((uint64_t)a1, v253);
  }
  if (!a1[24])
  {
    id v260 = (void *)*((void *)v420 + 24);
    if (v260) {
      -[GEOPDPlaceGlobalResult setGroundViewLabelResult:]((uint64_t)a1, v260);
    }
  }
  uint64_t v261 = a1[13];
  v262 = (void *)*((void *)v420 + 13);
  if (v261)
  {
    if (v262)
    {
      id v263 = v262;
      -[GEOPDBatchSpatialLookupResult readAll:]((uint64_t)v263, 0);
      if (*((unsigned char *)v263 + 56))
      {
        *(_DWORD *)(v261 + 52) = *((_DWORD *)v263 + 13);
        *(unsigned char *)(v261 + 56) |= 1u;
      }
      long long v476 = 0u;
      long long v475 = 0u;
      long long v474 = 0u;
      long long v473 = 0u;
      id v264 = *((id *)v263 + 4);
      uint64_t v265 = [v264 countByEnumeratingWithState:&v473 objects:v481 count:16];
      if (v265)
      {
        uint64_t v266 = v265;
        uint64_t v267 = *(void *)v474;
        do
        {
          for (uint64_t i17 = 0; i17 != v266; ++i17)
          {
            if (*(void *)v474 != v267) {
              objc_enumerationMutation(v264);
            }
            -[GEOPDBatchSpatialLookupResult addSpatialPlaceLookupResult:](v261, *(void **)(*((void *)&v473 + 1) + 8 * i17));
          }
          uint64_t v266 = [v264 countByEnumeratingWithState:&v473 objects:v481 count:16];
        }
        while (v266);
      }

      long long v472 = 0u;
      long long v471 = 0u;
      long long v470 = 0u;
      long long v469 = 0u;
      id v269 = *((id *)v263 + 3);
      uint64_t v270 = [v269 countByEnumeratingWithState:&v469 objects:&v477 count:16];
      if (v270)
      {
        uint64_t v271 = v270;
        uint64_t v272 = *(void *)v470;
        do
        {
          for (uint64_t i18 = 0; i18 != v271; ++i18)
          {
            if (*(void *)v470 != v272) {
              objc_enumerationMutation(v269);
            }
            -[GEOPDBatchSpatialLookupResult addSpatialEventLookupResult:](v261, *(void **)(*((void *)&v469 + 1) + 8 * i18));
          }
          uint64_t v271 = [v269 countByEnumeratingWithState:&v469 objects:&v477 count:16];
        }
        while (v271);
      }
    }
  }
  else if (v262)
  {
    -[GEOPDPlaceGlobalResult setBatchSpatialLookupResult:]((uint64_t)a1, v262);
  }
  uint64_t v274 = a1[35];
  v275 = (id *)*((void *)v420 + 35);
  if (v274)
  {
    if (v275)
    {
      long long v477 = 0u;
      long long v478 = 0u;
      long long v479 = 0u;
      long long v480 = 0u;
      id v276 = v275[2];
      uint64_t v277 = [v276 countByEnumeratingWithState:&v477 objects:v481 count:16];
      if (v277)
      {
        uint64_t v278 = v277;
        uint64_t v279 = *(void *)v478;
        do
        {
          for (uint64_t i19 = 0; i19 != v278; ++i19)
          {
            if (*(void *)v478 != v279) {
              objc_enumerationMutation(v276);
            }
            -[GEOPDPlaceGlobalCommonResult addPlaceContextMetadata:](v274, *(void **)(*((void *)&v477 + 1) + 8 * i19));
          }
          uint64_t v278 = [v276 countByEnumeratingWithState:&v477 objects:v481 count:16];
        }
        while (v278);
      }
    }
  }
  else if (v275)
  {
    -[GEOPDPlaceGlobalResult setPlaceGlobalCommonResult:]((uint64_t)a1, v275);
  }
  uint64_t v281 = a1[34];
  id v282 = (void *)*((void *)v420 + 34);
  if (v281)
  {
    if (v282)
    {
      v283 = v282;
      uint64_t v284 = *(void *)(v281 + 16);
      id v285 = (void *)v283[2];
      if (v284)
      {
        if (v285) {
          -[GEOPDComponent mergeFrom:](v284, v285);
        }
      }
      else if (v285)
      {
        -[GEOPDPlaceCollectionLookupResult setCollectionComponent:](v281, v285);
      }
    }
  }
  else if (v282)
  {
    -[GEOPDPlaceGlobalResult setPlaceCollectionLookupResult:]((uint64_t)a1, v282);
  }
  if (!a1[51])
  {
    v286 = (void *)*((void *)v420 + 51);
    if (v286) {
      -[GEOPDPlaceGlobalResult setTransitScheduleLookupResult:]((uint64_t)a1, v286);
    }
  }
  uint64_t v287 = a1[9];
  v288 = (id *)*((void *)v420 + 9);
  if (v287)
  {
    if (v288)
    {
      long long v477 = 0u;
      long long v478 = 0u;
      long long v479 = 0u;
      long long v480 = 0u;
      id v289 = v288[2];
      uint64_t v290 = [v289 countByEnumeratingWithState:&v477 objects:v481 count:16];
      if (v290)
      {
        uint64_t v291 = v290;
        uint64_t v292 = *(void *)v478;
        do
        {
          for (uint64_t i20 = 0; i20 != v291; ++i20)
          {
            if (*(void *)v478 != v292) {
              objc_enumerationMutation(v289);
            }
            -[GEOPDBatchCategoryLookupResult addCategoryLookupResult:](v287, *(void **)(*((void *)&v477 + 1) + 8 * i20));
          }
          uint64_t v291 = [v289 countByEnumeratingWithState:&v477 objects:v481 count:16];
        }
        while (v291);
      }
    }
  }
  else if (v288)
  {
    -[GEOPDPlaceGlobalResult setBatchCategoryLookupResult:]((uint64_t)a1, v288);
  }
  uint64_t v294 = a1[10];
  v295 = (void *)*((void *)v420 + 10);
  if (v294)
  {
    if (v295)
    {
      id v296 = v295;
      id v297 = v296;
      if (*((unsigned char *)v296 + 28))
      {
        *(_DWORD *)(v294 + 24) = *((_DWORD *)v296 + 6);
        *(unsigned char *)(v294 + 28) |= 1u;
      }
      long long v480 = 0u;
      long long v479 = 0u;
      long long v478 = 0u;
      long long v477 = 0u;
      id v298 = v296[2];
      uint64_t v299 = [v298 countByEnumeratingWithState:&v477 objects:v481 count:16];
      if (v299)
      {
        uint64_t v300 = v299;
        uint64_t v301 = *(void *)v478;
        do
        {
          for (uint64_t i21 = 0; i21 != v300; ++i21)
          {
            if (*(void *)v478 != v301) {
              objc_enumerationMutation(v298);
            }
            -[GEOPDBatchMerchantLookupBrandResult addMerchantLookupBrandResult:](v294, *(void **)(*((void *)&v477 + 1) + 8 * i21));
          }
          uint64_t v300 = [v298 countByEnumeratingWithState:&v477 objects:v481 count:16];
        }
        while (v300);
      }
    }
  }
  else if (v295)
  {
    -[GEOPDPlaceGlobalResult setBatchMerchantLookupBrandResult:]((uint64_t)a1, v295);
  }
  if (!a1[18])
  {
    id v303 = (void *)*((void *)v420 + 18);
    if (v303) {
      -[GEOPDPlaceGlobalResult setChildPlaceLookupByCategoryResult:]((uint64_t)a1, v303);
    }
  }
  uint64_t v304 = a1[30];
  uint64_t v305 = (id *)*((void *)v420 + 30);
  if (v304)
  {
    if (v305)
    {
      long long v477 = 0u;
      long long v478 = 0u;
      long long v479 = 0u;
      long long v480 = 0u;
      id v306 = v305[2];
      uint64_t v307 = [v306 countByEnumeratingWithState:&v477 objects:v481 count:16];
      if (v307)
      {
        uint64_t v308 = v307;
        uint64_t v309 = *(void *)v478;
        do
        {
          for (uint64_t i22 = 0; i22 != v308; ++i22)
          {
            if (*(void *)v478 != v309) {
              objc_enumerationMutation(v306);
            }
            -[GEOPDMapsSearchHomeResult addMapsSearchHomeSection:](v304, *(void **)(*((void *)&v477 + 1) + 8 * i22));
          }
          uint64_t v308 = [v306 countByEnumeratingWithState:&v477 objects:v481 count:16];
        }
        while (v308);
      }
    }
  }
  else if (v305)
  {
    -[GEOPDPlaceGlobalResult setMapsSearchHomeResult:]((uint64_t)a1, v305);
  }
  uint64_t v311 = a1[19];
  v312 = (void *)*((void *)v420 + 19);
  if (v311)
  {
    if (v312)
    {
      id v313 = v312;
      -[GEOPDCollectionSuggestionResult readAll:]((uint64_t)v313, 0);
      long long v480 = 0u;
      long long v479 = 0u;
      long long v478 = 0u;
      long long v477 = 0u;
      id v314 = v313[3];
      uint64_t v315 = [v314 countByEnumeratingWithState:&v477 objects:v481 count:16];
      if (v315)
      {
        uint64_t v316 = v315;
        uint64_t v317 = *(void *)v478;
        do
        {
          for (uint64_t i23 = 0; i23 != v316; ++i23)
          {
            if (*(void *)v478 != v317) {
              objc_enumerationMutation(v314);
            }
            -[GEOPDCollectionSuggestionResult addCollectionId:](v311, *(void **)(*((void *)&v477 + 1) + 8 * i23));
          }
          uint64_t v316 = [v314 countByEnumeratingWithState:&v477 objects:v481 count:16];
        }
        while (v316);
      }

      uint64_t v319 = *(void *)(v311 + 32);
      id v320 = v313[4];
      if (v319)
      {
        if (v320) {
          -[GEOPDExploreGuides mergeFrom:](v319, v320);
        }
      }
      else if (v320)
      {
        -[GEOPDCollectionSuggestionResult setExploreGuidesMetadata:](v311, v320);
      }
    }
  }
  else if (v312)
  {
    -[GEOPDPlaceGlobalResult setCollectionSuggestionResult:]((uint64_t)a1, v312);
  }
  uint64_t v321 = a1[41];
  id v322 = (void *)*((void *)v420 + 41);
  if (v321)
  {
    if (v322)
    {
      v323 = v322;
      -[GEOPDPublisherViewResult readAll:]((uint64_t)v323, 0);
      long long v476 = 0u;
      long long v475 = 0u;
      long long v474 = 0u;
      long long v473 = 0u;
      id v324 = v323[4];
      uint64_t v325 = [v324 countByEnumeratingWithState:&v473 objects:v481 count:16];
      if (v325)
      {
        uint64_t v326 = v325;
        uint64_t v327 = *(void *)v474;
        do
        {
          for (uint64_t i24 = 0; i24 != v326; ++i24)
          {
            if (*(void *)v474 != v327) {
              objc_enumerationMutation(v324);
            }
            -[GEOPDPublisherViewResult addResultFilter:](v321, *(void **)(*((void *)&v473 + 1) + 8 * i24));
          }
          uint64_t v326 = [v324 countByEnumeratingWithState:&v473 objects:v481 count:16];
        }
        while (v326);
      }

      long long v472 = 0u;
      long long v471 = 0u;
      long long v470 = 0u;
      long long v469 = 0u;
      id v329 = v323[3];
      uint64_t v330 = [v329 countByEnumeratingWithState:&v469 objects:&v477 count:16];
      if (v330)
      {
        uint64_t v331 = v330;
        uint64_t v332 = *(void *)v470;
        do
        {
          for (uint64_t i25 = 0; i25 != v331; ++i25)
          {
            if (*(void *)v470 != v332) {
              objc_enumerationMutation(v329);
            }
            -[GEOPDPublisherViewResult addCollectionId:](v321, *(void **)(*((void *)&v469 + 1) + 8 * i25));
          }
          uint64_t v331 = [v329 countByEnumeratingWithState:&v469 objects:&v477 count:16];
        }
        while (v331);
      }
    }
  }
  else if (v322)
  {
    -[GEOPDPlaceGlobalResult setPublisherViewResult:]((uint64_t)a1, v322);
  }
  uint64_t v334 = a1[6];
  v335 = (void *)*((void *)v420 + 6);
  if (v334)
  {
    if (v335)
    {
      id v336 = v335;
      -[GEOPDAllCollectionsViewResult readAll:]((uint64_t)v336, 0);
      uint64_t v337 = *(void *)(v334 + 32);
      v338 = (id *)*((void *)v336 + 4);
      if (v337)
      {
        if (v338)
        {
          long long v477 = 0u;
          long long v478 = 0u;
          long long v479 = 0u;
          long long v480 = 0u;
          id v339 = v338[2];
          uint64_t v340 = [v339 countByEnumeratingWithState:&v477 objects:v481 count:16];
          if (v340)
          {
            uint64_t v341 = v340;
            uint64_t v342 = *(void *)v478;
            do
            {
              for (uint64_t i26 = 0; i26 != v341; ++i26)
              {
                if (*(void *)v478 != v342) {
                  objc_enumerationMutation(v339);
                }
                -[GEOPDPublisherSuggestionResult addPublisherId:](v337, *(void **)(*((void *)&v477 + 1) + 8 * i26));
              }
              uint64_t v341 = [v339 countByEnumeratingWithState:&v477 objects:v481 count:16];
            }
            while (v341);
          }
        }
      }
      else if (v338)
      {
        -[GEOPDAllCollectionsViewResult setPublisherSuggestionResult:](v334, v338);
      }
      long long v476 = 0u;
      long long v475 = 0u;
      long long v474 = 0u;
      long long v473 = 0u;
      id v344 = *((id *)v336 + 5);
      uint64_t v345 = [v344 countByEnumeratingWithState:&v473 objects:v481 count:16];
      if (v345)
      {
        uint64_t v346 = v345;
        uint64_t v347 = *(void *)v474;
        do
        {
          for (uint64_t i27 = 0; i27 != v346; ++i27)
          {
            if (*(void *)v474 != v347) {
              objc_enumerationMutation(v344);
            }
            -[GEOPDAllCollectionsViewResult addResultFilter:](v334, *(void **)(*((void *)&v473 + 1) + 8 * i27));
          }
          uint64_t v346 = [v344 countByEnumeratingWithState:&v473 objects:v481 count:16];
        }
        while (v346);
      }

      long long v472 = 0u;
      long long v471 = 0u;
      long long v470 = 0u;
      long long v469 = 0u;
      id v349 = *((id *)v336 + 3);
      uint64_t v350 = [v349 countByEnumeratingWithState:&v469 objects:&v477 count:16];
      if (v350)
      {
        uint64_t v351 = v350;
        uint64_t v352 = *(void *)v470;
        do
        {
          for (uint64_t i28 = 0; i28 != v351; ++i28)
          {
            if (*(void *)v470 != v352) {
              objc_enumerationMutation(v349);
            }
            -[GEOPDAllCollectionsViewResult addCollectionId:](v334, *(void **)(*((void *)&v469 + 1) + 8 * i28));
          }
          uint64_t v351 = [v349 countByEnumeratingWithState:&v469 objects:&v477 count:16];
        }
        while (v351);
      }
    }
  }
  else if (v335)
  {
    -[GEOPDPlaceGlobalResult setAllCollectionsViewResult:]((uint64_t)a1, v335);
  }
  if (!a1[5])
  {
    v354 = (void *)*((void *)v420 + 5);
    if (v354) {
      -[GEOPDPlaceGlobalResult setAirportEntityPlaceLookupResult:]((uint64_t)a1, v354);
    }
  }
  if (!a1[50])
  {
    id v355 = (void *)*((void *)v420 + 50);
    if (v355) {
      -[GEOPDPlaceGlobalResult setTerritoryLookupResult:]((uint64_t)a1, v355);
    }
  }
  uint64_t v356 = a1[28];
  v357 = (id *)*((void *)v420 + 28);
  if (v356)
  {
    if (v357)
    {
      long long v477 = 0u;
      long long v478 = 0u;
      long long v479 = 0u;
      long long v480 = 0u;
      id v358 = v357[2];
      uint64_t v359 = [v358 countByEnumeratingWithState:&v477 objects:v481 count:16];
      if (v359)
      {
        uint64_t v360 = v359;
        uint64_t v361 = *(void *)v478;
        do
        {
          for (uint64_t i29 = 0; i29 != v360; ++i29)
          {
            if (*(void *)v478 != v361) {
              objc_enumerationMutation(v358);
            }
            -[GEOPDMapsHomeResult addMapsHomeSection:](v356, *(void **)(*((void *)&v477 + 1) + 8 * i29));
          }
          uint64_t v360 = [v358 countByEnumeratingWithState:&v477 objects:v481 count:16];
        }
        while (v360);
      }
    }
  }
  else if (v357)
  {
    -[GEOPDPlaceGlobalResult setMapsHomeResult:]((uint64_t)a1, v357);
  }
  uint64_t v363 = a1[7];
  v364 = (void *)*((void *)v420 + 7);
  if (v363)
  {
    if (v364)
    {
      id v365 = v364;
      -[GEOPDAllGuidesLocationsViewResult readAll:]((uint64_t)v365, 0);
      v366 = (void *)*((void *)v365 + 4);
      if (v366) {
        -[GEOPDAllGuidesLocationsViewResult setHeader:](v363, v366);
      }
      long long v480 = 0u;
      long long v479 = 0u;
      long long v478 = 0u;
      long long v477 = 0u;
      id v367 = *((id *)v365 + 3);
      uint64_t v368 = [v367 countByEnumeratingWithState:&v477 objects:v481 count:16];
      if (v368)
      {
        uint64_t v369 = v368;
        uint64_t v370 = *(void *)v478;
        do
        {
          for (uint64_t i30 = 0; i30 != v369; ++i30)
          {
            if (*(void *)v478 != v370) {
              objc_enumerationMutation(v367);
            }
            -[GEOPDAllGuidesLocationsViewResult addAllGuidesLocationsSection:](v363, *(void **)(*((void *)&v477 + 1) + 8 * i30));
          }
          uint64_t v369 = [v367 countByEnumeratingWithState:&v477 objects:v481 count:16];
        }
        while (v369);
      }
    }
  }
  else if (v364)
  {
    -[GEOPDPlaceGlobalResult setAllGuidesLocationsViewresult:]((uint64_t)a1, v364);
  }
  v372 = (void *)a1[25];
  v373 = (void *)*((void *)v420 + 25);
  if (v372)
  {
    if (v373)
    {
      id v374 = v373;
      -[GEOPDGuidesHomeResult readAll:]((uint64_t)v374, 0);
      uint64_t v375 = v372[3];
      v376 = (void *)*((void *)v374 + 3);
      if (v375)
      {
        if (v376) {
          -[GEOPDGuidesHomeFixedSection mergeFrom:](v375, v376);
        }
      }
      else if (v376)
      {
        -[GEOPDGuidesHomeResult setFeaturedGuides:]((uint64_t)v372, v376);
      }
      uint64_t v377 = v372[5];
      v378 = (void *)*((void *)v374 + 5);
      if (v377)
      {
        if (v378) {
          -[GEOPDGuidesHomeFixedSection mergeFrom:](v377, v378);
        }
      }
      else if (v378)
      {
        -[GEOPDGuidesHomeResult setFilters:]((uint64_t)v372, v378);
      }
      uint64_t v379 = v372[4];
      v380 = (void *)*((void *)v374 + 4);
      if (v379)
      {
        if (v380) {
          -[GEOPDGuidesHomeFixedSection mergeFrom:](v379, v380);
        }
      }
      else if (v380)
      {
        -[GEOPDGuidesHomeResult setFilteredGuides:]((uint64_t)v372, v380);
      }
      long long v480 = 0u;
      long long v479 = 0u;
      long long v478 = 0u;
      long long v477 = 0u;
      id v381 = *((id *)v374 + 6);
      uint64_t v382 = [v381 countByEnumeratingWithState:&v477 objects:v481 count:16];
      if (v382)
      {
        uint64_t v383 = v382;
        uint64_t v384 = *(void *)v478;
        do
        {
          for (uint64_t i31 = 0; i31 != v383; ++i31)
          {
            if (*(void *)v478 != v384) {
              objc_enumerationMutation(v381);
            }
            -[GEOPDGuidesHomeResult addRepeatableSection:]((uint64_t)v372, *(void **)(*((void *)&v477 + 1) + 8 * i31));
          }
          uint64_t v383 = [v381 countByEnumeratingWithState:&v477 objects:v481 count:16];
        }
        while (v383);
      }
    }
  }
  else if (v373)
  {
    -[GEOPDPlaceGlobalResult setGuidesHomeResult:]((uint64_t)a1, v373);
  }
  uint64_t v386 = a1[20];
  id v387 = (void *)*((void *)v420 + 20);
  if (v386)
  {
    if (v387)
    {
      v388 = v387;
      id v389 = v388;
      if ((v388[32] & 2) != 0)
      {
        *(unsigned char *)(v386 + 28) = v388[28];
        *(unsigned char *)(v386 + 32) |= 2u;
      }
      int v390 = (void *)*((void *)v388 + 2);
      if (v390) {
        -[GEOPDExtendedGeoLookupResult setDataSourceId:](v386, v390);
      }
      if (v389[8])
      {
        *(_DWORD *)(v386 + 24) = v389[6];
        *(unsigned char *)(v386 + 32) |= 1u;
      }
    }
  }
  else if (v387)
  {
    -[GEOPDPlaceGlobalResult setExtendedGeoLookupResult:]((uint64_t)a1, v387);
  }
  uint64_t v391 = a1[42];
  v392 = (void *)*((void *)v420 + 42);
  if (v391)
  {
    if (v392)
    {
      id v393 = v392;
      -[GEOPDQueryUnderstandingResult readAll:]((uint64_t)v393, 0);
      long long v472 = 0u;
      long long v471 = 0u;
      long long v470 = 0u;
      long long v469 = 0u;
      id v394 = *((id *)v393 + 3);
      uint64_t v395 = [v394 countByEnumeratingWithState:&v469 objects:&v477 count:16];
      if (v395)
      {
        uint64_t v396 = v395;
        uint64_t v397 = *(void *)v470;
        do
        {
          for (uint64_t i32 = 0; i32 != v396; ++i32)
          {
            if (*(void *)v470 != v397) {
              objc_enumerationMutation(v394);
            }
            -[GEOPDQueryUnderstandingResult addQueryIntent:](v391, *(void **)(*((void *)&v469 + 1) + 8 * i32));
          }
          uint64_t v396 = [v394 countByEnumeratingWithState:&v469 objects:&v477 count:16];
        }
        while (v396);
      }

      uint64_t v399 = *(void *)(v391 + 32);
      v400 = (id *)*((void *)v393 + 4);
      if (v399)
      {
        if (v400)
        {
          long long v473 = 0u;
          long long v474 = 0u;
          long long v475 = 0u;
          long long v476 = 0u;
          id v401 = v400[2];
          uint64_t v402 = [v401 countByEnumeratingWithState:&v473 objects:v481 count:16];
          if (v402)
          {
            uint64_t v403 = v402;
            uint64_t v404 = *(void *)v474;
            do
            {
              for (uint64_t i33 = 0; i33 != v403; ++i33)
              {
                if (*(void *)v474 != v404) {
                  objc_enumerationMutation(v401);
                }
                -[GEOPDQueryUnderstandingTaxonomyResult addResultItem:](v399, *(void **)(*((void *)&v473 + 1) + 8 * i33));
              }
              uint64_t v403 = [v401 countByEnumeratingWithState:&v473 objects:v481 count:16];
            }
            while (v403);
          }
        }
      }
      else if (v400)
      {
        -[GEOPDQueryUnderstandingResult setTaxonomyResult:](v391, v400);
      }
    }
  }
  else if (v392)
  {
    -[GEOPDPlaceGlobalResult setQueryUnderstandingResult:]((uint64_t)a1, v392);
  }
  if (!a1[39])
  {
    v406 = (void *)*((void *)v420 + 39);
    if (v406) {
      -[GEOPDPlaceGlobalResult setPoiAtAddressLookupResult:]((uint64_t)a1, v406);
    }
  }
  if (!a1[38])
  {
    id v407 = (void *)*((void *)v420 + 38);
    if (v407) {
      -[GEOPDPlaceGlobalResult setPlacecardEnrichmentResult:]((uint64_t)a1, v407);
    }
  }
  uint64_t v408 = a1[33];
  v409 = (void *)*((void *)v420 + 33);
  if (v408)
  {
    if (v409)
    {
      v410 = v409;
      v411 = *(void **)(v408 + 16);
      id v412 = v410[2];
      if (v411)
      {
        if (v412) {
          objc_msgSend(v411, "mergeFrom:");
        }
      }
      else if (v412)
      {
        -[GEOPDOfflineRegionNameResult setDisplayName:](v408, v410[2]);
      }
    }
  }
  else if (v409)
  {
    -[GEOPDPlaceGlobalResult setOfflineRegionNameResult:]((uint64_t)a1, v409);
  }
  uint64_t v413 = a1[44];
  v414 = (void *)*((void *)v420 + 44);
  if (v413)
  {
    if (v414)
    {
      id v415 = v414;
      uint64_t v416 = *(void *)(v413 + 16);
      v417 = (void *)v415[2];
      if (v416)
      {
        if (v417)
        {
          v418 = v417;
          if (v418[20])
          {
            *(unsigned char *)(v416 + 16) = v418[16];
            *(unsigned char *)(v416 + 20) |= 1u;
          }
        }
      }
      else if (v417)
      {
        -[GEOPDSearchCapabilitiesResult setOfflineCapabilities:](v413, v417);
      }
    }
  }
  else if (v414)
  {
    -[GEOPDPlaceGlobalResult setSearchCapabilitiesResult:]((uint64_t)a1, v414);
  }
  if (!a1[4])
  {
    v419 = (void *)*((void *)v420 + 4);
    if (v419) {
      -[GEOPDPlaceGlobalResult setAddressRecommendationResult:]((uint64_t)a1, v419);
    }
  }
}

- (void)clearUnknownFields:(uint64_t)a1
{
  uint64_t v501 = *MEMORY[0x1E4F143B8];
  if (a1)
  {
    uint64_t v1 = a1;
    os_unfair_lock_lock_with_options();
    *(void *)(v1 + 444) |= 0x10000000000001uLL;
    os_unfair_lock_unlock((os_unfair_lock_t)(v1 + 440));
    v2 = *(void **)(v1 + 16);
    *(void *)(v1 + 16) = 0;

    -[GEOPDPlaceGlobalResult readAll:](v1, 0);
    uint64_t v3 = *(void *)(v1 + 368);
    unint64_t v4 = &OBJC_IVAR___GEOMapDataSubscriptionDownloadGroup__completedSubscriptions;
    uint64_t v424 = v1;
    if (v3)
    {
      os_unfair_lock_lock_with_options();
      *(void *)(v3 + 248) |= 0x400000400uLL;
      os_unfair_lock_unlock((os_unfair_lock_t)(v3 + 216));
      id v5 = *(void **)(v3 + 16);
      *(void *)(v3 + 16) = 0;

      -[GEOPDSearchResult readAll:](v3, 0);
      [*(id *)(v3 + 72) clearUnknownFields:1];
      long long v470 = 0u;
      long long v471 = 0u;
      long long v468 = 0u;
      long long v469 = 0u;
      id v6 = *(id *)(v3 + 56);
      uint64_t v7 = [v6 countByEnumeratingWithState:&v468 objects:v500 count:16];
      if (v7)
      {
        uint64_t v8 = v7;
        uint64_t v9 = *(void *)v469;
        do
        {
          for (uint64_t i = 0; i != v8; ++i)
          {
            if (*(void *)v469 != v9) {
              objc_enumerationMutation(v6);
            }
            -[GEOPDMultiLocalizedString clearUnknownFields:](*(void *)(*((void *)&v468 + 1) + 8 * i));
          }
          uint64_t v8 = [v6 countByEnumeratingWithState:&v468 objects:v500 count:16];
        }
        while (v8);
      }

      long long v466 = 0u;
      long long v467 = 0u;
      long long v464 = 0u;
      long long v465 = 0u;
      id v11 = *(id *)(v3 + 128);
      uint64_t v12 = [v11 countByEnumeratingWithState:&v464 objects:&v496 count:16];
      if (v12)
      {
        uint64_t v13 = v12;
        uint64_t v14 = *(void *)v465;
        do
        {
          for (uint64_t j = 0; j != v13; ++j)
          {
            if (*(void *)v465 != v14) {
              objc_enumerationMutation(v11);
            }
            -[GEOPDRelatedSearchSuggestion clearUnknownFields:](*(void *)(*((void *)&v464 + 1) + 8 * j), 1);
          }
          uint64_t v13 = [v11 countByEnumeratingWithState:&v464 objects:&v496 count:16];
        }
        while (v13);
      }

      -[GEOPDRelatedSearchSuggestion clearUnknownFields:](*(void *)(v3 + 40), 1);
      uint64_t v16 = *(void *)(v3 + 168);
      if (v16)
      {
        unint64_t v17 = *(void **)(v16 + 8);
        *(void *)(v16 + 8) = 0;
      }
      long long v462 = 0u;
      long long v463 = 0u;
      long long v460 = 0u;
      long long v461 = 0u;
      id v18 = *(id *)(v3 + 136);
      uint64_t v19 = [v18 countByEnumeratingWithState:&v460 objects:&v492 count:16];
      if (v19)
      {
        uint64_t v20 = v19;
        uint64_t v21 = *(void *)v461;
        do
        {
          for (uint64_t k = 0; k != v20; ++k)
          {
            if (*(void *)v461 != v21) {
              objc_enumerationMutation(v18);
            }
            objc_msgSend(*(id *)(*((void *)&v460 + 1) + 8 * k), "clearUnknownFields:", 1, v424);
          }
          uint64_t v20 = [v18 countByEnumeratingWithState:&v460 objects:&v492 count:16];
        }
        while (v20);
      }

      -[GEOPDDirectionIntent clearUnknownFields:](*(void *)(v3 + 48), 1);
      uint64_t v23 = *(void *)(v3 + 32);
      if (v23)
      {
        uint64_t v24 = *(void **)(v23 + 8);
        *(void *)(v23 + 8) = 0;
      }
      long long v458 = 0u;
      long long v459 = 0u;
      long long v456 = 0u;
      long long v457 = 0u;
      id v25 = *(id *)(v3 + 64);
      uint64_t v26 = [v25 countByEnumeratingWithState:&v456 objects:&v488 count:16];
      if (v26)
      {
        uint64_t v27 = v26;
        uint64_t v28 = *(void *)v457;
        do
        {
          for (uint64_t m = 0; m != v27; ++m)
          {
            if (*(void *)v457 != v28) {
              objc_enumerationMutation(v25);
            }
            uint64_t v30 = *(void *)(*((void *)&v456 + 1) + 8 * m);
            if (v30)
            {
              os_unfair_lock_lock_with_options();
              *(unsigned char *)(v30 + 56) |= 2u;
              *(unsigned char *)(v30 + 56) |= 0x10u;
              os_unfair_lock_unlock((os_unfair_lock_t)(v30 + 48));
              unint64_t v31 = *(void **)(v30 + 16);
              *(void *)(v30 + 16) = 0;

              -[GEOPDDisplayHeaderSubstitute readAll:](v30, 0);
              -[GEOPDRelatedSearchSuggestion clearUnknownFields:](*(void *)(v30 + 32), 1);
            }
          }
          uint64_t v27 = [v25 countByEnumeratingWithState:&v456 objects:&v488 count:16];
        }
        while (v27);
      }

      long long v454 = 0u;
      long long v455 = 0u;
      long long v452 = 0u;
      long long v453 = 0u;
      id v32 = *(id *)(v3 + 160);
      uint64_t v33 = [v32 countByEnumeratingWithState:&v452 objects:&v484 count:16];
      unint64_t v4 = &OBJC_IVAR___GEOMapDataSubscriptionDownloadGroup__completedSubscriptions;
      if (v33)
      {
        uint64_t v34 = v33;
        uint64_t v35 = *(void *)v453;
        do
        {
          for (uint64_t n = 0; n != v34; ++n)
          {
            if (*(void *)v453 != v35) {
              objc_enumerationMutation(v32);
            }
            -[GEOPDRetainedSearchMetadata clearUnknownFields:](*(void *)(*((void *)&v452 + 1) + 8 * n), 1);
          }
          uint64_t v34 = [v32 countByEnumeratingWithState:&v452 objects:&v484 count:16];
        }
        while (v34);
      }

      long long v450 = 0u;
      long long v451 = 0u;
      long long v448 = 0u;
      long long v449 = 0u;
      id v37 = *(id *)(v3 + 176);
      uint64_t v38 = [v37 countByEnumeratingWithState:&v448 objects:&v480 count:16];
      if (v38)
      {
        uint64_t v39 = v38;
        uint64_t v40 = *(void *)v449;
        do
        {
          for (iuint64_t i = 0; ii != v39; ++ii)
          {
            if (*(void *)v449 != v40) {
              objc_enumerationMutation(v37);
            }
            -[GEOPDSSearchResultSection clearUnknownFields:](*(void *)(*((void *)&v448 + 1) + 8 * ii), 1);
          }
          uint64_t v39 = [v37 countByEnumeratingWithState:&v448 objects:&v480 count:16];
        }
        while (v39);
      }

      long long v446 = 0u;
      long long v447 = 0u;
      long long v444 = 0u;
      long long v445 = 0u;
      id v42 = *(id *)(v3 + 120);
      uint64_t v43 = [v42 countByEnumeratingWithState:&v444 objects:&v476 count:16];
      if (v43)
      {
        uint64_t v44 = v43;
        uint64_t v45 = *(void *)v445;
        do
        {
          for (juint64_t j = 0; jj != v44; ++jj)
          {
            if (*(void *)v445 != v45) {
              objc_enumerationMutation(v42);
            }
            -[GEOPDRelatedEntitySection clearUnknownFields:](*(void *)(*((void *)&v444 + 1) + 8 * jj), 1);
          }
          uint64_t v44 = [v42 countByEnumeratingWithState:&v444 objects:&v476 count:16];
        }
        while (v44);
      }

      long long v442 = 0u;
      long long v443 = 0u;
      long long v440 = 0u;
      long long v441 = 0u;
      id v47 = *(id *)(v3 + 192);
      uint64_t v48 = [v47 countByEnumeratingWithState:&v440 objects:&v472 count:16];
      if (v48)
      {
        uint64_t v49 = v48;
        uint64_t v50 = *(void *)v441;
        do
        {
          for (uint64_t kk = 0; kk != v49; ++kk)
          {
            if (*(void *)v441 != v50) {
              objc_enumerationMutation(v47);
            }
            uint64_t v52 = *(void *)(*((void *)&v440 + 1) + 8 * kk);
            if (v52)
            {
              id v53 = *(void **)(v52 + 8);
              *(void *)(v52 + 8) = 0;
            }
          }
          uint64_t v49 = [v47 countByEnumeratingWithState:&v440 objects:&v472 count:16];
        }
        while (v49);
      }

      -[GEOPDResultRefinementGroup clearUnknownFields:](*(void *)(v3 + 152), 1);
      uint64_t v54 = *(void *)(v3 + 24);
      if (v54)
      {
        uint64_t v55 = *(void **)(v54 + 8);
        *(void *)(v54 + 8) = 0;
      }
      -[GEOPDSearchSectionList clearUnknownFields:](*(void *)(v3 + 200), 1);
      uint64_t v56 = *(void *)(v3 + 184);
      uint64_t v1 = v424;
      if (v56)
      {
        uint64_t v57 = *(void **)(v56 + 8);
        *(void *)(v56 + 8) = 0;
      }
      objc_msgSend(*(id *)(v3 + 88), "clearUnknownFields:", 1, v424);
      -[GEOPDPaginationInfo clearUnknownFields:](*(void *)(v3 + 96));
      uint64_t v58 = *(void *)(v3 + 112);
      if (v58)
      {
        id v59 = *(void **)(v58 + 8);
        *(void *)(v58 + 8) = 0;
      }
    }
    uint64_t v60 = *(void *)(v1 + 184);
    if (v60)
    {
      uint64_t v61 = *(void **)(v60 + 8);
      *(void *)(v60 + 8) = 0;

      long long v499 = 0u;
      long long v498 = 0u;
      long long v497 = 0u;
      long long v496 = 0u;
      id v62 = *(id *)(v60 + 16);
      uint64_t v63 = [v62 countByEnumeratingWithState:&v496 objects:v500 count:16];
      if (v63)
      {
        uint64_t v64 = v63;
        uint64_t v65 = *(void *)v497;
        do
        {
          for (muint64_t m = 0; mm != v64; ++mm)
          {
            if (*(void *)v497 != v65) {
              objc_enumerationMutation(v62);
            }
            -[GEOPDMultiLocalizedString clearUnknownFields:](*(void *)(*((void *)&v496 + 1) + 8 * mm));
          }
          uint64_t v64 = [v62 countByEnumeratingWithState:&v496 objects:v500 count:16];
        }
        while (v64);
      }
    }
    uint64_t v67 = v424;
    uint64_t v68 = *(void *)(v424 + 128);
    if (v68)
    {
      uint64_t v69 = *(void **)(v68 + 8);
      *(void *)(v68 + 8) = 0;
    }
    uint64_t v70 = *(void *)(v424 + 344);
    if (v70)
    {
      v71 = *(void **)(v70 + 8);
      *(void *)(v70 + 8) = 0;
    }
    uint64_t v72 = *(void *)(v424 + 288);
    if (v72)
    {
      v73 = *(void **)(v72 + 8);
      *(void *)(v72 + 8) = 0;
    }
    objc_msgSend(*(id *)(v424 + 248), "clearUnknownFields:", 1, v424);
    uint64_t v74 = *(void *)(v67 + 296);
    if (v74)
    {
      v75 = *(void **)(v74 + 8);
      *(void *)(v74 + 8) = 0;
    }
    uint64_t v76 = *(void *)(v67 + 392);
    if (v76)
    {
      os_unfair_lock_lock_with_options();
      *(unsigned char *)(v76 + 56) |= 2u;
      *(unsigned char *)(v76 + 56) |= 0x10u;
      os_unfair_lock_unlock((os_unfair_lock_t)(v76 + 48));
      v77 = *(void **)(v76 + 16);
      *(void *)(v76 + 16) = 0;

      -[GEOPDSiriSearchResult readAll:](v76, 0);
      long long v495 = 0u;
      long long v494 = 0u;
      long long v493 = 0u;
      long long v492 = 0u;
      id v78 = *(id *)(v76 + 24);
      uint64_t v79 = [v78 countByEnumeratingWithState:&v492 objects:v500 count:16];
      if (v79)
      {
        uint64_t v80 = v79;
        uint64_t v81 = *(void *)v493;
        do
        {
          for (nuint64_t n = 0; nn != v80; ++nn)
          {
            if (*(void *)v493 != v81) {
              objc_enumerationMutation(v78);
            }
            -[GEOPDMultiLocalizedString clearUnknownFields:](*(void *)(*((void *)&v492 + 1) + 8 * nn));
          }
          uint64_t v80 = [v78 countByEnumeratingWithState:&v492 objects:v500 count:16];
        }
        while (v80);
      }

      long long v491 = 0u;
      long long v490 = 0u;
      long long v489 = 0u;
      long long v488 = 0u;
      id v83 = *(id *)(v76 + 32);
      uint64_t v84 = [v83 countByEnumeratingWithState:&v488 objects:&v496 count:16];
      if (v84)
      {
        uint64_t v85 = v84;
        uint64_t v86 = *(void *)v489;
        do
        {
          for (uint64_t i1 = 0; i1 != v85; ++i1)
          {
            if (*(void *)v489 != v86) {
              objc_enumerationMutation(v83);
            }
            [*(id *)(*((void *)&v488 + 1) + 8 * i1) clearUnknownFields:1];
          }
          uint64_t v85 = [v83 countByEnumeratingWithState:&v488 objects:&v496 count:16];
        }
        while (v85);
      }
    }
    uint64_t v88 = v425[27];
    if (v88)
    {
      os_unfair_lock_lock_with_options();
      *(unsigned char *)(v88 + 60) |= 1u;
      *(unsigned char *)(v88 + 60) |= 0x10u;
      os_unfair_lock_unlock((os_unfair_lock_t)(v88 + 56));
      uint64_t v89 = *(void **)(v88 + 16);
      *(void *)(v88 + 16) = 0;

      -[GEOPDLocationDirectedSearchResult readAll:](v88, 0);
      [*(id *)(v88 + 32) clearUnknownFields:1];
      long long v499 = 0u;
      long long v498 = 0u;
      long long v497 = 0u;
      long long v496 = 0u;
      id v90 = *(id *)(v88 + 24);
      uint64_t v91 = [v90 countByEnumeratingWithState:&v496 objects:v500 count:16];
      if (v91)
      {
        uint64_t v92 = v91;
        uint64_t v93 = *(void *)v497;
        do
        {
          for (uint64_t i2 = 0; i2 != v92; ++i2)
          {
            if (*(void *)v497 != v93) {
              objc_enumerationMutation(v90);
            }
            -[GEOPDMultiLocalizedString clearUnknownFields:](*(void *)(*((void *)&v496 + 1) + 8 * i2));
          }
          uint64_t v92 = [v90 countByEnumeratingWithState:&v496 objects:v500 count:16];
        }
        while (v92);
      }

      -[GEOPDPaginationInfo clearUnknownFields:](*(void *)(v88 + 40));
    }
    uint64_t v95 = v425[8];
    if (v95)
    {
      os_unfair_lock_lock_with_options();
      *(_DWORD *)(v95 + 104) |= 0x800u;
      *(_DWORD *)(v95 + 104) |= 0x40000u;
      os_unfair_lock_unlock((os_unfair_lock_t)(v95 + 80));
      id v96 = *(void **)(v95 + 16);
      *(void *)(v95 + 16) = 0;

      -[GEOPDAutocompleteResult readAll:](v95, 0);
      long long v491 = 0u;
      long long v490 = 0u;
      long long v489 = 0u;
      long long v488 = 0u;
      long long v429 = (id *)v95;
      obuint64_t j = *(id *)(v95 + 56);
      uint64_t v97 = [obj countByEnumeratingWithState:&v488 objects:&v496 count:16];
      if (v97)
      {
        uint64_t v98 = v97;
        uint64_t v99 = *(void *)v489;
        do
        {
          for (uint64_t i3 = 0; i3 != v98; ++i3)
          {
            if (*(void *)v489 != v99) {
              objc_enumerationMutation(obj);
            }
            uint64_t v101 = *(void *)(*((void *)&v488 + 1) + 8 * i3);
            if (v101)
            {
              os_unfair_lock_lock_with_options();
              *(_WORD *)(v101 + 144) |= 0x100u;
              *(_WORD *)(v101 + 144) |= 0x4000u;
              os_unfair_lock_unlock((os_unfair_lock_t)(v101 + 120));
              uint64_t v102 = *(void **)(v101 + 16);
              *(void *)(v101 + 16) = 0;

              -[GEOPDAutocompleteResultSection readAll:](v101, 0);
              long long v495 = 0u;
              long long v494 = 0u;
              long long v493 = 0u;
              long long v492 = 0u;
              id v103 = *(id *)(v101 + 96);
              uint64_t v104 = [v103 countByEnumeratingWithState:&v492 objects:v500 count:16];
              if (v104)
              {
                uint64_t v105 = v104;
                uint64_t v106 = *(void *)v493;
                do
                {
                  for (uint64_t i4 = 0; i4 != v105; ++i4)
                  {
                    if (*(void *)v493 != v106) {
                      objc_enumerationMutation(v103);
                    }
                    [*(id *)(*((void *)&v492 + 1) + 8 * i4) clearUnknownFields:1];
                  }
                  uint64_t v105 = [v103 countByEnumeratingWithState:&v492 objects:v500 count:16];
                }
                while (v105);
              }
            }
          }
          uint64_t v98 = [obj countByEnumeratingWithState:&v488 objects:&v496 count:16];
        }
        while (v98);
      }

      long long v486 = 0u;
      long long v487 = 0u;
      long long v484 = 0u;
      long long v485 = 0u;
      id v108 = *(id *)(v95 + 64);
      uint64_t v109 = [v108 countByEnumeratingWithState:&v484 objects:v500 count:16];
      if (v109)
      {
        uint64_t v110 = v109;
        uint64_t v111 = *(void *)v485;
        do
        {
          for (uint64_t i5 = 0; i5 != v110; ++i5)
          {
            if (*(void *)v485 != v111) {
              objc_enumerationMutation(v108);
            }
            uint64_t v113 = *(void *)(*((void *)&v484 + 1) + 8 * i5);
            if (v113)
            {
              uint64_t v114 = *(void **)(v113 + 8);
              *(void *)(v113 + 8) = 0;
            }
          }
          uint64_t v110 = [v108 countByEnumeratingWithState:&v484 objects:v500 count:16];
        }
        while (v110);
      }

      long long v482 = 0u;
      long long v483 = 0u;
      long long v480 = 0u;
      long long v481 = 0u;
      id v115 = *(id *)(v95 + 32);
      uint64_t v116 = [v115 countByEnumeratingWithState:&v480 objects:&v492 count:16];
      unint64_t v4 = &OBJC_IVAR___GEOMapDataSubscriptionDownloadGroup__completedSubscriptions;
      if (v116)
      {
        uint64_t v117 = v116;
        uint64_t v118 = *(void *)v481;
        do
        {
          for (uint64_t i6 = 0; i6 != v117; ++i6)
          {
            if (*(void *)v481 != v118) {
              objc_enumerationMutation(v115);
            }
            -[GEOPDClientRankingFeatureMetadata clearUnknownFields:](*(void *)(*((void *)&v480 + 1) + 8 * i6), 1);
          }
          uint64_t v117 = [v115 countByEnumeratingWithState:&v480 objects:&v492 count:16];
        }
        while (v117);
      }

      [v429[3] clearUnknownFields:1];
      uint64_t v120 = v429[5];
      if (v120)
      {
        uint64_t v121 = (void *)v120[1];
        v120[1] = 0;
      }
    }
    int v122 = v425;
    -[GEOPDSearchBrowseCategorySuggestionResult clearUnknownFields:](v425[15]);
    uint64_t v123 = v425[17];
    if (v123)
    {
      os_unfair_lock_lock_with_options();
      *(_DWORD *)(v123 + 184) |= 0x40u;
      *(_DWORD *)(v123 + 184) |= 0x1000000u;
      os_unfair_lock_unlock((os_unfair_lock_t)(v123 + 168));
      uint64_t v124 = *(void **)(v123 + 16);
      *(void *)(v123 + 16) = 0;

      -[GEOPDCategorySearchResult readAll:](v123, 0);
      [*(id *)(v123 + 56) clearUnknownFields:1];
      long long v482 = 0u;
      long long v483 = 0u;
      long long v480 = 0u;
      long long v481 = 0u;
      id v125 = *(id *)(v123 + 104);
      uint64_t v126 = [v125 countByEnumeratingWithState:&v480 objects:v500 count:16];
      if (v126)
      {
        uint64_t v127 = v126;
        uint64_t v128 = *(void *)v481;
        do
        {
          for (uint64_t i7 = 0; i7 != v127; ++i7)
          {
            if (*(void *)v481 != v128) {
              objc_enumerationMutation(v125);
            }
            -[GEOPDRelatedSearchSuggestion clearUnknownFields:](*(void *)(*((void *)&v480 + 1) + 8 * i7), 1);
          }
          uint64_t v127 = [v125 countByEnumeratingWithState:&v480 objects:v500 count:16];
        }
        while (v127);
      }

      long long v478 = 0u;
      long long v479 = 0u;
      long long v476 = 0u;
      long long v477 = 0u;
      id v130 = *(id *)(v123 + 112);
      uint64_t v131 = [v130 countByEnumeratingWithState:&v476 objects:&v496 count:16];
      if (v131)
      {
        uint64_t v132 = v131;
        uint64_t v133 = *(void *)v477;
        do
        {
          for (uint64_t i8 = 0; i8 != v132; ++i8)
          {
            if (*(void *)v477 != v133) {
              objc_enumerationMutation(v130);
            }
            [*(id *)(*((void *)&v476 + 1) + 8 * i8) clearUnknownFields:1];
          }
          uint64_t v132 = [v130 countByEnumeratingWithState:&v476 objects:&v496 count:16];
        }
        while (v132);
      }

      -[GEOPDRelatedSearchSuggestion clearUnknownFields:](*(void *)(v123 + 48), 1);
      uint64_t v135 = *(void *)(v123 + 128);
      if (v135)
      {
        id v136 = *(void **)(v135 + 8);
        *(void *)(v135 + 8) = 0;
      }
      long long v474 = 0u;
      long long v475 = 0u;
      long long v472 = 0u;
      long long v473 = 0u;
      id v137 = *(id *)(v123 + 32);
      uint64_t v138 = [v137 countByEnumeratingWithState:&v472 objects:&v492 count:16];
      if (v138)
      {
        uint64_t v139 = v138;
        uint64_t v140 = *(void *)v473;
        do
        {
          for (uint64_t i9 = 0; i9 != v139; ++i9)
          {
            if (*(void *)v473 != v140) {
              objc_enumerationMutation(v137);
            }
            -[GEOPDBrowseCategory clearUnknownFields:](*(void *)(*((void *)&v472 + 1) + 8 * i9), 1);
          }
          uint64_t v139 = [v137 countByEnumeratingWithState:&v472 objects:&v492 count:16];
        }
        while (v139);
      }

      -[GEOPDSCategorySearchResultSection clearUnknownFields:](*(void *)(v123 + 40), 1);
      long long v470 = 0u;
      long long v471 = 0u;
      long long v468 = 0u;
      long long v469 = 0u;
      id v142 = *(id *)(v123 + 96);
      uint64_t v143 = [v142 countByEnumeratingWithState:&v468 objects:&v488 count:16];
      if (v143)
      {
        uint64_t v144 = v143;
        uint64_t v145 = *(void *)v469;
        do
        {
          for (uint64_t i10 = 0; i10 != v144; ++i10)
          {
            if (*(void *)v469 != v145) {
              objc_enumerationMutation(v142);
            }
            -[GEOPDRelatedEntitySection clearUnknownFields:](*(void *)(*((void *)&v468 + 1) + 8 * i10), 1);
          }
          uint64_t v144 = [v142 countByEnumeratingWithState:&v468 objects:&v488 count:16];
        }
        while (v144);
      }

      long long v466 = 0u;
      long long v467 = 0u;
      long long v464 = 0u;
      long long v465 = 0u;
      id v147 = *(id *)(v123 + 144);
      uint64_t v148 = [v147 countByEnumeratingWithState:&v464 objects:&v484 count:16];
      if (v148)
      {
        uint64_t v149 = v148;
        uint64_t v150 = *(void *)v465;
        do
        {
          for (uint64_t i11 = 0; i11 != v149; ++i11)
          {
            if (*(void *)v465 != v150) {
              objc_enumerationMutation(v147);
            }
            uint64_t v152 = *(void *)(*((void *)&v464 + 1) + 8 * i11);
            if (v152)
            {
              uint64_t v153 = v4[904];
              uint64_t v154 = *(void **)(v152 + v153);
              *(void *)(v152 + v153) = 0;
            }
          }
          uint64_t v149 = [v147 countByEnumeratingWithState:&v464 objects:&v484 count:16];
        }
        while (v149);
      }

      -[GEOPDResultRefinementGroup clearUnknownFields:](*(void *)(v123 + 120), 1);
      uint64_t v155 = *(void *)(v123 + 24);
      if (v155)
      {
        uint64_t v156 = *(void **)(v155 + 8);
        *(void *)(v155 + 8) = 0;
      }
      -[GEOPDSearchSectionList clearUnknownFields:](*(void *)(v123 + 152), 1);
      uint64_t v157 = *(void *)(v123 + 136);
      int v122 = v425;
      if (v157)
      {
        uint64_t v158 = *(void **)(v157 + 8);
        *(void *)(v157 + 8) = 0;
      }
      -[GEOPDPaginationInfo clearUnknownFields:](*(void *)(v123 + 72));
      uint64_t v159 = *(void *)(v123 + 88);
      if (v159)
      {
        uint64_t v160 = *(void **)(v159 + 8);
        *(void *)(v159 + 8) = 0;
      }
    }
    uint64_t v161 = v122[40];
    if (v161)
    {
      os_unfair_lock_lock_with_options();
      *(unsigned char *)(v161 + 56) |= 2u;
      *(unsigned char *)(v161 + 56) |= 0x10u;
      os_unfair_lock_unlock((os_unfair_lock_t)(v161 + 48));
      uint64_t v162 = *(void **)(v161 + 16);
      *(void *)(v161 + 16) = 0;

      -[GEOPDPopularNearbySearchResult readAll:](v161, 0);
      [*(id *)(v161 + 24) clearUnknownFields:1];
    }
    uint64_t v163 = v122[47];
    if (v163)
    {
      os_unfair_lock_lock_with_options();
      *(unsigned char *)(v163 + 52) |= 1u;
      *(unsigned char *)(v163 + 52) |= 8u;
      os_unfair_lock_unlock((os_unfair_lock_t)(v163 + 48));
      uint64_t v164 = *(void **)(v163 + 16);
      *(void *)(v163 + 16) = 0;

      -[GEOPDSearchZeroKeywordCategorySuggestionResult readAll:](v163, 0);
      long long v495 = 0u;
      long long v494 = 0u;
      long long v493 = 0u;
      long long v492 = 0u;
      id v165 = *(id *)(v163 + 24);
      uint64_t v166 = [v165 countByEnumeratingWithState:&v492 objects:v500 count:16];
      if (v166)
      {
        uint64_t v167 = v166;
        uint64_t v168 = *(void *)v493;
        do
        {
          for (uint64_t i12 = 0; i12 != v167; ++i12)
          {
            if (*(void *)v493 != v168) {
              objc_enumerationMutation(v165);
            }
            -[GEOPDBrowseCategory clearUnknownFields:](*(void *)(*((void *)&v492 + 1) + 8 * i12), 1);
          }
          uint64_t v167 = [v165 countByEnumeratingWithState:&v492 objects:v500 count:16];
        }
        while (v167);
      }

      long long v491 = 0u;
      long long v490 = 0u;
      long long v489 = 0u;
      long long v488 = 0u;
      id v170 = *(id *)(v163 + 32);
      uint64_t v171 = [v170 countByEnumeratingWithState:&v488 objects:&v496 count:16];
      if (v171)
      {
        uint64_t v172 = v171;
        uint64_t v173 = *(void *)v489;
        do
        {
          for (uint64_t i13 = 0; i13 != v172; ++i13)
          {
            if (*(void *)v489 != v173) {
              objc_enumerationMutation(v170);
            }
            uint64_t v175 = *(void *)(*((void *)&v488 + 1) + 8 * i13);
            if (v175)
            {
              uint64_t v176 = *(void **)(v175 + 8);
              *(void *)(v175 + 8) = 0;
            }
          }
          uint64_t v172 = [v170 countByEnumeratingWithState:&v488 objects:&v496 count:16];
        }
        while (v172);
      }
    }
    uint64_t v177 = v425[45];
    if (v177)
    {
      id v178 = *(void **)(v177 + 8);
      *(void *)(v177 + 8) = 0;
    }
    uint64_t v179 = v425[11];
    if (v179)
    {
      uint64_t v180 = *(void **)(v179 + 8);
      *(void *)(v179 + 8) = 0;

      long long v499 = 0u;
      long long v498 = 0u;
      long long v497 = 0u;
      long long v496 = 0u;
      id v181 = *(id *)(v179 + 16);
      uint64_t v182 = [v181 countByEnumeratingWithState:&v496 objects:v500 count:16];
      if (v182)
      {
        uint64_t v183 = v182;
        uint64_t v184 = *(void *)v497;
        do
        {
          for (uint64_t i14 = 0; i14 != v183; ++i14)
          {
            if (*(void *)v497 != v184) {
              objc_enumerationMutation(v181);
            }
            uint64_t v186 = *(void *)(*((void *)&v496 + 1) + 8 * i14);
            if (v186)
            {
              os_unfair_lock_lock_with_options();
              *(unsigned char *)(v186 + 68) |= 1u;
              *(unsigned char *)(v186 + 68) |= 8u;
              os_unfair_lock_unlock((os_unfair_lock_t)(v186 + 64));
              v187 = *(void **)(v186 + 16);
              *(void *)(v186 + 16) = 0;

              -[GEOPDPopularNearbyResult readAll:](v186, 0);
            }
          }
          uint64_t v183 = [v181 countByEnumeratingWithState:&v496 objects:v500 count:16];
        }
        while (v183);
      }
    }
    uint64_t v188 = v425[52];
    if (v188)
    {
      uint64_t v189 = *(void **)(v188 + 8);
      *(void *)(v188 + 8) = 0;
    }
    uint64_t v190 = v425[32];
    if (v190)
    {
      int v191 = *(void **)(v190 + 8);
      *(void *)(v190 + 8) = 0;
    }
    uint64_t v192 = v425[3];
    if (v192)
    {
      uint64_t v193 = *(void **)(v192 + 8);
      *(void *)(v192 + 8) = 0;

      long long v499 = 0u;
      long long v498 = 0u;
      long long v497 = 0u;
      long long v496 = 0u;
      id v194 = *(id *)(v192 + 16);
      uint64_t v195 = [v194 countByEnumeratingWithState:&v496 objects:v500 count:16];
      if (v195)
      {
        uint64_t v196 = v195;
        uint64_t v197 = *(void *)v497;
        do
        {
          for (uint64_t i15 = 0; i15 != v196; ++i15)
          {
            if (*(void *)v497 != v197) {
              objc_enumerationMutation(v194);
            }
            -[GEOPDMultiLocalizedString clearUnknownFields:](*(void *)(*((void *)&v496 + 1) + 8 * i15));
          }
          uint64_t v196 = [v194 countByEnumeratingWithState:&v496 objects:v500 count:16];
        }
        while (v196);
      }
    }
    uint64_t v199 = v425[48];
    if (v199)
    {
      char v200 = *(void **)(v199 + 8);
      *(void *)(v199 + 8) = 0;

      long long v499 = 0u;
      long long v498 = 0u;
      long long v497 = 0u;
      long long v496 = 0u;
      id v201 = *(id *)(v199 + 16);
      uint64_t v202 = [v201 countByEnumeratingWithState:&v496 objects:v500 count:16];
      if (v202)
      {
        uint64_t v203 = v202;
        uint64_t v204 = *(void *)v497;
        do
        {
          for (uint64_t i16 = 0; i16 != v203; ++i16)
          {
            if (*(void *)v497 != v204) {
              objc_enumerationMutation(v201);
            }
            uint64_t v206 = *(void *)(*((void *)&v496 + 1) + 8 * i16);
            if (v206)
            {
              os_unfair_lock_lock_with_options();
              *(unsigned char *)(v206 + 68) |= 1u;
              *(unsigned char *)(v206 + 68) |= 8u;
              os_unfair_lock_unlock((os_unfair_lock_t)(v206 + 64));
              char v207 = *(void **)(v206 + 16);
              *(void *)(v206 + 16) = 0;

              -[GEOPDSearchResultsForCategoryEntry readAll:](v206, 0);
              -[GEOPDBrowseCategory clearUnknownFields:](*(void *)(v206 + 48), 1);
            }
          }
          uint64_t v203 = [v201 countByEnumeratingWithState:&v496 objects:v500 count:16];
        }
        while (v203);
      }
    }
    uint64_t v208 = v425[21];
    if (v208)
    {
      uint64_t v209 = *(void **)(v208 + 8);
      *(void *)(v208 + 8) = 0;
    }
    uint64_t v210 = v425[22];
    if (v210)
    {
      uint64_t v211 = *(void **)(v210 + 8);
      *(void *)(v210 + 8) = 0;
    }
    uint64_t v212 = v425[29];
    if (v212)
    {
      id v213 = *(void **)(v212 + 8);
      *(void *)(v212 + 8) = 0;
    }
    uint64_t v214 = v425[12];
    if (v214)
    {
      uint64_t v215 = *(void **)(v214 + 8);
      *(void *)(v214 + 8) = 0;
    }
    uint64_t v216 = v425[14];
    if (v216)
    {
      id v217 = *(void **)(v216 + 8);
      *(void *)(v216 + 8) = 0;
    }
    uint64_t v218 = v425[53];
    if (v218)
    {
      v219 = *(void **)(v218 + 8);
      *(void *)(v218 + 8) = 0;
    }
    uint64_t v220 = v425[26];
    if (v220)
    {
      os_unfair_lock_lock_with_options();
      *(unsigned char *)(v220 + 72) |= 2u;
      *(unsigned char *)(v220 + 72) |= 0x40u;
      os_unfair_lock_unlock((os_unfair_lock_t)(v220 + 64));
      uint64_t v221 = *(void **)(v220 + 16);
      *(void *)(v220 + 16) = 0;

      -[GEOPDIpGeoLookupResult readAll:](v220, 0);
      [*(id *)(v220 + 40) clearUnknownFields:1];
    }
    uint64_t v222 = v425[24];
    if (v222)
    {
      id v223 = *(void **)(v222 + 8);
      *(void *)(v222 + 8) = 0;
    }
    uint64_t v224 = v425[13];
    if (v224)
    {
      os_unfair_lock_lock_with_options();
      *(unsigned char *)(v224 + 56) |= 2u;
      *(unsigned char *)(v224 + 56) |= 0x10u;
      os_unfair_lock_unlock((os_unfair_lock_t)(v224 + 48));
      uint64_t v225 = *(void **)(v224 + 16);
      *(void *)(v224 + 16) = 0;

      -[GEOPDBatchSpatialLookupResult readAll:](v224, 0);
      long long v486 = 0u;
      long long v487 = 0u;
      long long v484 = 0u;
      long long v485 = 0u;
      long long v430 = (id *)v224;
      id obja = *(id *)(v224 + 32);
      uint64_t v226 = [obja countByEnumeratingWithState:&v484 objects:&v496 count:16];
      if (v226)
      {
        uint64_t v227 = v226;
        uint64_t v228 = *(void *)v485;
        do
        {
          for (uint64_t i17 = 0; i17 != v227; ++i17)
          {
            if (*(void *)v485 != v228) {
              objc_enumerationMutation(obja);
            }
            uint64_t v230 = *(void *)(*((void *)&v484 + 1) + 8 * i17);
            if (v230)
            {
              os_unfair_lock_lock_with_options();
              *(unsigned char *)(v230 + 56) |= 2u;
              *(unsigned char *)(v230 + 56) |= 0x10u;
              os_unfair_lock_unlock((os_unfair_lock_t)(v230 + 48));
              id v231 = *(void **)(v230 + 16);
              *(void *)(v230 + 16) = 0;

              -[GEOPDSpatialPlaceLookupResult readAll:](v230, 0);
              long long v495 = 0u;
              long long v494 = 0u;
              long long v493 = 0u;
              long long v492 = 0u;
              id v232 = *(id *)(v230 + 32);
              uint64_t v233 = [v232 countByEnumeratingWithState:&v492 objects:v500 count:16];
              if (v233)
              {
                uint64_t v234 = v233;
                uint64_t v235 = *(void *)v493;
                do
                {
                  for (uint64_t i18 = 0; i18 != v234; ++i18)
                  {
                    if (*(void *)v493 != v235) {
                      objc_enumerationMutation(v232);
                    }
                    [*(id *)(*((void *)&v492 + 1) + 8 * i18) clearUnknownFields:1];
                  }
                  uint64_t v234 = [v232 countByEnumeratingWithState:&v492 objects:v500 count:16];
                }
                while (v234);
              }

              [*(id *)(v230 + 24) clearUnknownFields:1];
            }
          }
          uint64_t v227 = [obja countByEnumeratingWithState:&v484 objects:&v496 count:16];
        }
        while (v227);
      }

      long long v482 = 0u;
      long long v483 = 0u;
      long long v480 = 0u;
      long long v481 = 0u;
      id objb = v430[3];
      uint64_t v237 = [objb countByEnumeratingWithState:&v480 objects:&v492 count:16];
      if (v237)
      {
        uint64_t v238 = v237;
        uint64_t v239 = *(void *)v481;
        do
        {
          for (uint64_t i19 = 0; i19 != v238; ++i19)
          {
            if (*(void *)v481 != v239) {
              objc_enumerationMutation(objb);
            }
            uint64_t v241 = *(void *)(*((void *)&v480 + 1) + 8 * i19);
            if (v241)
            {
              os_unfair_lock_lock_with_options();
              *(unsigned char *)(v241 + 56) |= 2u;
              *(unsigned char *)(v241 + 56) |= 0x10u;
              os_unfair_lock_unlock((os_unfair_lock_t)(v241 + 48));
              uint64_t v242 = *(void **)(v241 + 16);
              *(void *)(v241 + 16) = 0;

              -[GEOPDSpatialEventLookupResult readAll:](v241, 0);
              long long v491 = 0u;
              long long v490 = 0u;
              long long v489 = 0u;
              long long v488 = 0u;
              id v243 = *(id *)(v241 + 32);
              uint64_t v244 = [v243 countByEnumeratingWithState:&v488 objects:v500 count:16];
              if (v244)
              {
                uint64_t v245 = v244;
                uint64_t v246 = *(void *)v489;
                do
                {
                  for (uint64_t i20 = 0; i20 != v245; ++i20)
                  {
                    if (*(void *)v489 != v246) {
                      objc_enumerationMutation(v243);
                    }
                    [*(id *)(*((void *)&v488 + 1) + 8 * i20) clearUnknownFields:1];
                  }
                  uint64_t v245 = [v243 countByEnumeratingWithState:&v488 objects:v500 count:16];
                }
                while (v245);
              }

              [*(id *)(v241 + 24) clearUnknownFields:1];
            }
          }
          uint64_t v238 = [objb countByEnumeratingWithState:&v480 objects:&v492 count:16];
        }
        while (v238);
      }
    }
    uint64_t v248 = v425[35];
    if (v248)
    {
      uint64_t v249 = *(void **)(v248 + 8);
      *(void *)(v248 + 8) = 0;

      long long v499 = 0u;
      long long v498 = 0u;
      long long v497 = 0u;
      long long v496 = 0u;
      id v250 = *(id *)(v248 + 16);
      uint64_t v251 = [v250 countByEnumeratingWithState:&v496 objects:v500 count:16];
      if (v251)
      {
        uint64_t v252 = v251;
        uint64_t v253 = *(void *)v497;
        do
        {
          for (uint64_t i21 = 0; i21 != v252; ++i21)
          {
            if (*(void *)v497 != v253) {
              objc_enumerationMutation(v250);
            }
            -[GEOPDPlaceContextMetadata clearUnknownFields:](*(void *)(*((void *)&v496 + 1) + 8 * i21), 1);
          }
          uint64_t v252 = [v250 countByEnumeratingWithState:&v496 objects:v500 count:16];
        }
        while (v252);
      }
    }
    uint64_t v255 = v425[34];
    if (v255)
    {
      v256 = *(void **)(v255 + 8);
      *(void *)(v255 + 8) = 0;

      -[GEOPDComponent clearUnknownFields:](*(void *)(v255 + 16), 1);
    }
    uint64_t v257 = v425[51];
    if (v257)
    {
      v258 = *(void **)(v257 + 8);
      *(void *)(v257 + 8) = 0;
    }
    uint64_t v259 = v425[9];
    if (v259)
    {
      id v260 = *(void **)(v259 + 8);
      *(void *)(v259 + 8) = 0;

      long long v499 = 0u;
      long long v498 = 0u;
      long long v497 = 0u;
      long long v496 = 0u;
      id v261 = *(id *)(v259 + 16);
      uint64_t v262 = [v261 countByEnumeratingWithState:&v496 objects:v500 count:16];
      if (v262)
      {
        uint64_t v263 = v262;
        uint64_t v264 = *(void *)v497;
        do
        {
          for (uint64_t i22 = 0; i22 != v263; ++i22)
          {
            if (*(void *)v497 != v264) {
              objc_enumerationMutation(v261);
            }
            uint64_t v266 = *(void *)(*((void *)&v496 + 1) + 8 * i22);
            if (v266)
            {
              os_unfair_lock_lock_with_options();
              *(unsigned char *)(v266 + 52) |= 1u;
              *(unsigned char *)(v266 + 52) |= 8u;
              os_unfair_lock_unlock((os_unfair_lock_t)(v266 + 48));
              uint64_t v267 = *(void **)(v266 + 16);
              *(void *)(v266 + 16) = 0;

              -[GEOPDCategoryLookupResult readAll:](v266, 0);
              -[GEOPDCategoryLookupParameters clearUnknownFields:](*(void *)(v266 + 32), 1);
              [*(id *)(v266 + 24) clearUnknownFields:1];
            }
          }
          uint64_t v263 = [v261 countByEnumeratingWithState:&v496 objects:v500 count:16];
        }
        while (v263);
      }
    }
    uint64_t v268 = v425[10];
    if (v268)
    {
      id v269 = *(void **)(v268 + 8);
      *(void *)(v268 + 8) = 0;

      long long v491 = 0u;
      long long v490 = 0u;
      long long v489 = 0u;
      long long v488 = 0u;
      id v270 = *(id *)(v268 + 16);
      uint64_t v271 = [v270 countByEnumeratingWithState:&v488 objects:&v496 count:16];
      if (v271)
      {
        uint64_t v272 = v271;
        uint64_t v273 = *(void *)v489;
        do
        {
          for (uint64_t i23 = 0; i23 != v272; ++i23)
          {
            if (*(void *)v489 != v273) {
              objc_enumerationMutation(v270);
            }
            uint64_t v275 = *(void *)(*((void *)&v488 + 1) + 8 * i23);
            if (v275)
            {
              id v276 = *(void **)(v275 + 8);
              *(void *)(v275 + 8) = 0;

              long long v495 = 0u;
              long long v494 = 0u;
              long long v493 = 0u;
              long long v492 = 0u;
              id v277 = *(id *)(v275 + 16);
              uint64_t v278 = [v277 countByEnumeratingWithState:&v492 objects:v500 count:16];
              if (v278)
              {
                uint64_t v279 = v278;
                uint64_t v280 = *(void *)v493;
                do
                {
                  for (uint64_t i24 = 0; i24 != v279; ++i24)
                  {
                    if (*(void *)v493 != v280) {
                      objc_enumerationMutation(v277);
                    }
                    [*(id *)(*((void *)&v492 + 1) + 8 * i24) clearUnknownFields:1];
                  }
                  uint64_t v279 = [v277 countByEnumeratingWithState:&v492 objects:v500 count:16];
                }
                while (v279);
              }
            }
          }
          uint64_t v272 = [v270 countByEnumeratingWithState:&v488 objects:&v496 count:16];
        }
        while (v272);
      }
    }
    uint64_t v282 = v425[18];
    if (v282)
    {
      v283 = *(void **)(v282 + 8);
      *(void *)(v282 + 8) = 0;
    }
    uint64_t v284 = v425[30];
    if (v284)
    {
      id v285 = *(void **)(v284 + 8);
      *(void *)(v284 + 8) = 0;

      long long v491 = 0u;
      long long v490 = 0u;
      long long v489 = 0u;
      long long v488 = 0u;
      id v431 = *(id *)(v284 + 16);
      uint64_t v286 = [v431 countByEnumeratingWithState:&v488 objects:&v496 count:16];
      if (v286)
      {
        uint64_t v287 = v286;
        id objc = *(id *)v489;
        do
        {
          for (uint64_t i25 = 0; i25 != v287; ++i25)
          {
            if (*(id *)v489 != objc) {
              objc_enumerationMutation(v431);
            }
            uint64_t v289 = *(void *)(*((void *)&v488 + 1) + 8 * i25);
            if (v289)
            {
              os_unfair_lock_lock_with_options();
              *(_WORD *)(v289 + 88) |= 2u;
              *(_WORD *)(v289 + 88) |= 0x100u;
              os_unfair_lock_unlock((os_unfair_lock_t)(v289 + 80));
              uint64_t v290 = *(void **)(v289 + 16);
              *(void *)(v289 + 16) = 0;

              -[GEOPDMapsSearchHomeSection readAll:](v289, 0);
              -[GEOPDSearchBrowseCategorySuggestionResult clearUnknownFields:](*(void *)(v289 + 64));
              -[GEOPDCollectionSuggestionResult clearUnknownFields:](*(void *)(v289 + 24));
              -[GEOPDPublisherSuggestionResult clearUnknownFields:](*(void *)(v289 + 56));
              uint64_t v291 = *(void *)(v289 + 48);
              if (v291)
              {
                uint64_t v292 = *(void **)(v291 + 8);
                *(void *)(v291 + 8) = 0;

                long long v495 = 0u;
                long long v494 = 0u;
                long long v493 = 0u;
                long long v492 = 0u;
                id v293 = *(id *)(v291 + 16);
                uint64_t v294 = [v293 countByEnumeratingWithState:&v492 objects:v500 count:16];
                if (v294)
                {
                  uint64_t v295 = v294;
                  uint64_t v296 = *(void *)v493;
                  do
                  {
                    for (uint64_t i26 = 0; i26 != v295; ++i26)
                    {
                      if (*(void *)v493 != v296) {
                        objc_enumerationMutation(v293);
                      }
                      [*(id *)(*((void *)&v492 + 1) + 8 * i26) clearUnknownFields:1];
                    }
                    uint64_t v295 = [v293 countByEnumeratingWithState:&v492 objects:v500 count:16];
                  }
                  while (v295);
                }
              }
              uint64_t v298 = *(void *)(v289 + 32);
              if (v298)
              {
                os_unfair_lock_lock_with_options();
                *(unsigned char *)(v298 + 60) |= 1u;
                *(unsigned char *)(v298 + 60) |= 0x10u;
                os_unfair_lock_unlock((os_unfair_lock_t)(v298 + 56));
                uint64_t v299 = *(void **)(v298 + 16);
                *(void *)(v298 + 16) = 0;

                -[GEOPDGuidesLocationsSuggestionResult readAll:](v298, 0);
                long long v495 = 0u;
                long long v494 = 0u;
                long long v493 = 0u;
                long long v492 = 0u;
                id v300 = *(id *)(v298 + 24);
                uint64_t v301 = [v300 countByEnumeratingWithState:&v492 objects:v500 count:16];
                if (v301)
                {
                  uint64_t v302 = v301;
                  uint64_t v303 = *(void *)v493;
                  do
                  {
                    for (uint64_t i27 = 0; i27 != v302; ++i27)
                    {
                      if (*(void *)v493 != v303) {
                        objc_enumerationMutation(v300);
                      }
                      -[GEOPDGuidesLocationEntry clearUnknownFields:](*(void *)(*((void *)&v492 + 1) + 8 * i27), 1);
                    }
                    uint64_t v302 = [v300 countByEnumeratingWithState:&v492 objects:v500 count:16];
                  }
                  while (v302);
                }

                -[GEOPDGuidesLocationEntry clearUnknownFields:](*(void *)(v298 + 32), 1);
              }
            }
          }
          uint64_t v287 = [v431 countByEnumeratingWithState:&v488 objects:&v496 count:16];
        }
        while (v287);
      }
    }
    -[GEOPDCollectionSuggestionResult clearUnknownFields:](v425[19]);
    uint64_t v305 = v425[41];
    if (v305)
    {
      os_unfair_lock_lock_with_options();
      *(unsigned char *)(v305 + 52) |= 1u;
      *(unsigned char *)(v305 + 52) |= 8u;
      os_unfair_lock_unlock((os_unfair_lock_t)(v305 + 48));
      id v306 = *(void **)(v305 + 16);
      *(void *)(v305 + 16) = 0;

      -[GEOPDPublisherViewResult readAll:](v305, 0);
      long long v495 = 0u;
      long long v494 = 0u;
      long long v493 = 0u;
      long long v492 = 0u;
      id v307 = *(id *)(v305 + 32);
      uint64_t v308 = [v307 countByEnumeratingWithState:&v492 objects:v500 count:16];
      if (v308)
      {
        uint64_t v309 = v308;
        uint64_t v310 = *(void *)v493;
        do
        {
          for (uint64_t i28 = 0; i28 != v309; ++i28)
          {
            if (*(void *)v493 != v310) {
              objc_enumerationMutation(v307);
            }
            -[GEOPDPublisherViewResultFilter clearUnknownFields:](*(void *)(*((void *)&v492 + 1) + 8 * i28));
          }
          uint64_t v309 = [v307 countByEnumeratingWithState:&v492 objects:v500 count:16];
        }
        while (v309);
      }

      long long v491 = 0u;
      long long v490 = 0u;
      long long v489 = 0u;
      long long v488 = 0u;
      id v312 = *(id *)(v305 + 24);
      uint64_t v313 = [v312 countByEnumeratingWithState:&v488 objects:&v496 count:16];
      if (v313)
      {
        uint64_t v314 = v313;
        uint64_t v315 = *(void *)v489;
        do
        {
          for (uint64_t i29 = 0; i29 != v314; ++i29)
          {
            if (*(void *)v489 != v315) {
              objc_enumerationMutation(v312);
            }
            [*(id *)(*((void *)&v488 + 1) + 8 * i29) clearUnknownFields:1];
          }
          uint64_t v314 = [v312 countByEnumeratingWithState:&v488 objects:&v496 count:16];
        }
        while (v314);
      }
    }
    uint64_t v317 = v425[6];
    if (v317)
    {
      os_unfair_lock_lock_with_options();
      *(unsigned char *)(v317 + 60) |= 1u;
      *(unsigned char *)(v317 + 60) |= 0x10u;
      os_unfair_lock_unlock((os_unfair_lock_t)(v317 + 56));
      v318 = *(void **)(v317 + 16);
      *(void *)(v317 + 16) = 0;

      -[GEOPDAllCollectionsViewResult readAll:](v317, 0);
      -[GEOPDPublisherSuggestionResult clearUnknownFields:](*(void *)(v317 + 32));
      long long v495 = 0u;
      long long v494 = 0u;
      long long v493 = 0u;
      long long v492 = 0u;
      id v319 = *(id *)(v317 + 40);
      uint64_t v320 = [v319 countByEnumeratingWithState:&v492 objects:v500 count:16];
      if (v320)
      {
        uint64_t v321 = v320;
        uint64_t v322 = *(void *)v493;
        do
        {
          for (uint64_t i30 = 0; i30 != v321; ++i30)
          {
            if (*(void *)v493 != v322) {
              objc_enumerationMutation(v319);
            }
            -[GEOPDAllCollectionsViewResultFilter clearUnknownFields:](*(void *)(*((void *)&v492 + 1) + 8 * i30));
          }
          uint64_t v321 = [v319 countByEnumeratingWithState:&v492 objects:v500 count:16];
        }
        while (v321);
      }

      long long v491 = 0u;
      long long v490 = 0u;
      long long v489 = 0u;
      long long v488 = 0u;
      id v324 = *(id *)(v317 + 24);
      uint64_t v325 = [v324 countByEnumeratingWithState:&v488 objects:&v496 count:16];
      if (v325)
      {
        uint64_t v326 = v325;
        uint64_t v327 = *(void *)v489;
        do
        {
          for (uint64_t i31 = 0; i31 != v326; ++i31)
          {
            if (*(void *)v489 != v327) {
              objc_enumerationMutation(v324);
            }
            [*(id *)(*((void *)&v488 + 1) + 8 * i31) clearUnknownFields:1];
          }
          uint64_t v326 = [v324 countByEnumeratingWithState:&v488 objects:&v496 count:16];
        }
        while (v326);
      }
    }
    uint64_t v329 = v425[5];
    if (v329)
    {
      uint64_t v330 = *(void **)(v329 + 8);
      *(void *)(v329 + 8) = 0;
    }
    uint64_t v331 = v425[50];
    if (v331)
    {
      uint64_t v332 = *(void **)(v331 + 8);
      *(void *)(v331 + 8) = 0;
    }
    uint64_t v333 = v425[28];
    if (v333)
    {
      uint64_t v334 = *(void **)(v333 + 8);
      *(void *)(v333 + 8) = 0;

      long long v499 = 0u;
      long long v498 = 0u;
      long long v497 = 0u;
      long long v496 = 0u;
      id v335 = *(id *)(v333 + 16);
      uint64_t v336 = [v335 countByEnumeratingWithState:&v496 objects:v500 count:16];
      if (v336)
      {
        uint64_t v337 = v336;
        uint64_t v338 = *(void *)v497;
        do
        {
          for (uint64_t i32 = 0; i32 != v337; ++i32)
          {
            if (*(void *)v497 != v338) {
              objc_enumerationMutation(v335);
            }
            uint64_t v340 = *(void *)(*((void *)&v496 + 1) + 8 * i32);
            if (v340)
            {
              os_unfair_lock_lock_with_options();
              *(unsigned char *)(v340 + 72) |= 2u;
              *(unsigned char *)(v340 + 72) |= 0x40u;
              os_unfair_lock_unlock((os_unfair_lock_t)(v340 + 64));
              uint64_t v341 = *(void **)(v340 + 16);
              *(void *)(v340 + 16) = 0;

              -[GEOPDMapsHomeSection readAll:](v340, 0);
              -[GEOPDCollectionSuggestionResult clearUnknownFields:](*(void *)(v340 + 24));
              -[GEOPDGuidesLocationEntry clearUnknownFields:](*(void *)(v340 + 32), 1);
            }
          }
          uint64_t v337 = [v335 countByEnumeratingWithState:&v496 objects:v500 count:16];
        }
        while (v337);
      }
    }
    uint64_t v342 = v425[7];
    if (v342)
    {
      os_unfair_lock_lock_with_options();
      *(unsigned char *)(v342 + 52) |= 1u;
      *(unsigned char *)(v342 + 52) |= 8u;
      os_unfair_lock_unlock((os_unfair_lock_t)(v342 + 48));
      v343 = *(void **)(v342 + 16);
      *(void *)(v342 + 16) = 0;

      -[GEOPDAllGuidesLocationsViewResult readAll:](v342, 0);
      long long v491 = 0u;
      long long v490 = 0u;
      long long v489 = 0u;
      long long v488 = 0u;
      id objd = *(id *)(v342 + 24);
      uint64_t v344 = [objd countByEnumeratingWithState:&v488 objects:&v496 count:16];
      if (v344)
      {
        uint64_t v345 = v344;
        uint64_t v346 = *(void *)v489;
        do
        {
          for (uint64_t i33 = 0; i33 != v345; ++i33)
          {
            if (*(void *)v489 != v346) {
              objc_enumerationMutation(objd);
            }
            uint64_t v348 = *(void *)(*((void *)&v488 + 1) + 8 * i33);
            if (v348)
            {
              os_unfair_lock_lock_with_options();
              *(unsigned char *)(v348 + 52) |= 1u;
              *(unsigned char *)(v348 + 52) |= 8u;
              os_unfair_lock_unlock((os_unfair_lock_t)(v348 + 48));
              id v349 = *(void **)(v348 + 16);
              *(void *)(v348 + 16) = 0;

              -[GEOPDAllGuidesLocationsSection readAll:](v348, 0);
              uint64_t v350 = *(void *)(v348 + 32);
              if (v350)
              {
                os_unfair_lock_lock_with_options();
                *(unsigned char *)(v350 + 56) |= 2u;
                *(unsigned char *)(v350 + 56) |= 0x10u;
                os_unfair_lock_unlock((os_unfair_lock_t)(v350 + 48));
                uint64_t v351 = *(void **)(v350 + 16);
                *(void *)(v350 + 16) = 0;

                -[GEOPDAllGuidesLocationsSectionHeader readAll:](v350, 0);
                [*(id *)(v350 + 32) clearUnknownFields:1];
              }
              long long v495 = 0u;
              long long v494 = 0u;
              long long v493 = 0u;
              long long v492 = 0u;
              id v352 = *(id *)(v348 + 24);
              uint64_t v353 = [v352 countByEnumeratingWithState:&v492 objects:v500 count:16];
              if (v353)
              {
                uint64_t v354 = v353;
                uint64_t v355 = *(void *)v493;
                do
                {
                  for (uint64_t i34 = 0; i34 != v354; ++i34)
                  {
                    if (*(void *)v493 != v355) {
                      objc_enumerationMutation(v352);
                    }
                    -[GEOPDGuidesLocationEntry clearUnknownFields:](*(void *)(*((void *)&v492 + 1) + 8 * i34), 1);
                  }
                  uint64_t v354 = [v352 countByEnumeratingWithState:&v492 objects:v500 count:16];
                }
                while (v354);
              }
            }
          }
          uint64_t v345 = [objd countByEnumeratingWithState:&v488 objects:&v496 count:16];
        }
        while (v345);
      }
    }
    uint64_t v357 = v425[25];
    if (v357)
    {
      os_unfair_lock_lock_with_options();
      *(unsigned char *)(v357 + 68) |= 1u;
      *(unsigned char *)(v357 + 68) |= 0x20u;
      os_unfair_lock_unlock((os_unfair_lock_t)(v357 + 64));
      id v358 = *(void **)(v357 + 16);
      *(void *)(v357 + 16) = 0;

      -[GEOPDGuidesHomeResult readAll:](v357, 0);
      -[GEOPDGuidesHomeFixedSection clearUnknownFields:](*(void *)(v357 + 24));
      -[GEOPDGuidesHomeFixedSection clearUnknownFields:](*(void *)(v357 + 40));
      -[GEOPDGuidesHomeFixedSection clearUnknownFields:](*(void *)(v357 + 32));
      long long v474 = 0u;
      long long v475 = 0u;
      long long v472 = 0u;
      long long v473 = 0u;
      id obje = *(id *)(v357 + 48);
      uint64_t v359 = [obje countByEnumeratingWithState:&v472 objects:&v488 count:16];
      if (v359)
      {
        uint64_t v360 = v359;
        uint64_t v361 = *(void *)v473;
        do
        {
          for (uint64_t i35 = 0; i35 != v360; ++i35)
          {
            if (*(void *)v473 != v361) {
              objc_enumerationMutation(obje);
            }
            uint64_t v363 = *(void *)(*((void *)&v472 + 1) + 8 * i35);
            if (v363)
            {
              os_unfair_lock_lock_with_options();
              *(unsigned char *)(v363 + 76) |= 4u;
              *(unsigned char *)(v363 + 76) |= 0x80u;
              os_unfair_lock_unlock((os_unfair_lock_t)(v363 + 64));
              v364 = *(void **)(v363 + 16);
              *(void *)(v363 + 16) = 0;

              -[GEOPDGuidesHomeRepeatableSection readAll:](v363, 0);
              long long v486 = 0u;
              long long v487 = 0u;
              long long v484 = 0u;
              long long v485 = 0u;
              id v365 = *(id *)(v363 + 24);
              uint64_t v366 = [v365 countByEnumeratingWithState:&v484 objects:v500 count:16];
              if (v366)
              {
                uint64_t v367 = v366;
                uint64_t v368 = *(void *)v485;
                do
                {
                  for (uint64_t i36 = 0; i36 != v367; ++i36)
                  {
                    if (*(void *)v485 != v368) {
                      objc_enumerationMutation(v365);
                    }
                    [*(id *)(*((void *)&v484 + 1) + 8 * i36) clearUnknownFields:1];
                  }
                  uint64_t v367 = [v365 countByEnumeratingWithState:&v484 objects:v500 count:16];
                }
                while (v367);
              }

              long long v482 = 0u;
              long long v483 = 0u;
              long long v480 = 0u;
              long long v481 = 0u;
              id v370 = *(id *)(v363 + 48);
              uint64_t v371 = [v370 countByEnumeratingWithState:&v480 objects:&v496 count:16];
              if (v371)
              {
                uint64_t v372 = v371;
                uint64_t v373 = *(void *)v481;
                do
                {
                  for (uint64_t i37 = 0; i37 != v372; ++i37)
                  {
                    if (*(void *)v481 != v373) {
                      objc_enumerationMutation(v370);
                    }
                    [*(id *)(*((void *)&v480 + 1) + 8 * i37) clearUnknownFields:1];
                  }
                  uint64_t v372 = [v370 countByEnumeratingWithState:&v480 objects:&v496 count:16];
                }
                while (v372);
              }

              long long v478 = 0u;
              long long v479 = 0u;
              long long v476 = 0u;
              long long v477 = 0u;
              id v375 = *(id *)(v363 + 32);
              uint64_t v376 = [v375 countByEnumeratingWithState:&v476 objects:&v492 count:16];
              if (v376)
              {
                uint64_t v377 = v376;
                uint64_t v378 = *(void *)v477;
                do
                {
                  for (uint64_t i38 = 0; i38 != v377; ++i38)
                  {
                    if (*(void *)v477 != v378) {
                      objc_enumerationMutation(v375);
                    }
                    -[GEOPDGuidesLocationEntry clearUnknownFields:](*(void *)(*((void *)&v476 + 1) + 8 * i38), 1);
                  }
                  uint64_t v377 = [v375 countByEnumeratingWithState:&v476 objects:&v492 count:16];
                }
                while (v377);
              }
            }
          }
          uint64_t v360 = [obje countByEnumeratingWithState:&v472 objects:&v488 count:16];
        }
        while (v360);
      }
    }
    v380 = v425;
    uint64_t v381 = v425[20];
    if (v381)
    {
      uint64_t v382 = *(void **)(v381 + 8);
      *(void *)(v381 + 8) = 0;
    }
    uint64_t v383 = v425[42];
    if (v383)
    {
      os_unfair_lock_lock_with_options();
      *(unsigned char *)(v383 + 52) |= 1u;
      *(unsigned char *)(v383 + 52) |= 8u;
      os_unfair_lock_unlock((os_unfair_lock_t)(v383 + 48));
      uint64_t v384 = *(void **)(v383 + 16);
      *(void *)(v383 + 16) = 0;

      -[GEOPDQueryUnderstandingResult readAll:](v383, 0);
      uint64_t v385 = *(void *)(v383 + 32);
      if (v385)
      {
        uint64_t v386 = *(void **)(v385 + 8);
        *(void *)(v385 + 8) = 0;

        long long v474 = 0u;
        long long v475 = 0u;
        long long v472 = 0u;
        long long v473 = 0u;
        id v426 = *(id *)(v385 + 16);
        uint64_t v428 = [v426 countByEnumeratingWithState:&v472 objects:&v488 count:16];
        if (v428)
        {
          uint64_t v427 = *(void *)v473;
          do
          {
            for (id i39 = 0; i39 != (id)v428; id i39 = (char *)i39 + 1)
            {
              if (*(void *)v473 != v427) {
                objc_enumerationMutation(v426);
              }
              uint64_t v388 = *(void *)(*((void *)&v472 + 1) + 8 * (void)i39);
              if (v388)
              {
                os_unfair_lock_lock_with_options();
                *(unsigned char *)(v388 + 56) |= 2u;
                *(unsigned char *)(v388 + 56) |= 0x10u;
                os_unfair_lock_unlock((os_unfair_lock_t)(v388 + 48));
                id v389 = *(void **)(v388 + 16);
                *(void *)(v388 + 16) = 0;

                -[GEOPDQueryUnderstandingTaxonomyResultItem readAll:](v388, 0);
                uint64_t v390 = *(void *)(v388 + 32);
                if (v390)
                {
                  uint64_t v391 = *(void **)(v390 + 8);
                  *(void *)(v390 + 8) = 0;
                }
                uint64_t v392 = *(void *)(v388 + 24);
                if (v392)
                {
                  id v432 = i39;
                  id v393 = *(void **)(v392 + 8);
                  *(void *)(v392 + 8) = 0;

                  long long v478 = 0u;
                  long long v479 = 0u;
                  long long v476 = 0u;
                  long long v477 = 0u;
                  id objf = *(id *)(v392 + 16);
                  uint64_t v394 = [objf countByEnumeratingWithState:&v476 objects:&v492 count:16];
                  if (v394)
                  {
                    uint64_t v395 = v394;
                    uint64_t v396 = *(void *)v477;
                    do
                    {
                      for (uint64_t i40 = 0; i40 != v395; ++i40)
                      {
                        if (*(void *)v477 != v396) {
                          objc_enumerationMutation(objf);
                        }
                        uint64_t v398 = *(void *)(*((void *)&v476 + 1) + 8 * i40);
                        if (v398)
                        {
                          os_unfair_lock_lock_with_options();
                          *(_DWORD *)(v398 + 168) |= 8u;
                          *(_DWORD *)(v398 + 168) |= 0x40000u;
                          os_unfair_lock_unlock((os_unfair_lock_t)(v398 + 160));
                          uint64_t v399 = *(void **)(v398 + 16);
                          *(void *)(v398 + 16) = 0;

                          -[GEOPDLocalizedQueryUnderstandingTaxonomyResultItemBrand readAll:](v398, 0);
                          [*(id *)(v398 + 128) clearUnknownFields:1];
                          -[GEOPDMultiLocalizedString clearUnknownFields:](*(void *)(v398 + 120));
                          long long v486 = 0u;
                          long long v487 = 0u;
                          long long v484 = 0u;
                          long long v485 = 0u;
                          id v400 = *(id *)(v398 + 112);
                          uint64_t v401 = [v400 countByEnumeratingWithState:&v484 objects:v500 count:16];
                          if (v401)
                          {
                            uint64_t v402 = v401;
                            uint64_t v403 = *(void *)v485;
                            do
                            {
                              for (uint64_t i41 = 0; i41 != v402; ++i41)
                              {
                                if (*(void *)v485 != v403) {
                                  objc_enumerationMutation(v400);
                                }
                                -[GEOPDIconMapping clearUnknownFields:](*(void *)(*((void *)&v484 + 1) + 8 * i41));
                              }
                              uint64_t v402 = [v400 countByEnumeratingWithState:&v484 objects:v500 count:16];
                            }
                            while (v402);
                          }

                          long long v482 = 0u;
                          long long v483 = 0u;
                          long long v480 = 0u;
                          long long v481 = 0u;
                          id v405 = *(id *)(v398 + 88);
                          uint64_t v406 = [v405 countByEnumeratingWithState:&v480 objects:&v496 count:16];
                          if (v406)
                          {
                            uint64_t v407 = v406;
                            uint64_t v408 = *(void *)v481;
                            do
                            {
                              for (uint64_t i42 = 0; i42 != v407; ++i42)
                              {
                                if (*(void *)v481 != v408) {
                                  objc_enumerationMutation(v405);
                                }
                                -[GEOPDIconMapping clearUnknownFields:](*(void *)(*((void *)&v480 + 1) + 8 * i42));
                              }
                              uint64_t v407 = [v405 countByEnumeratingWithState:&v480 objects:&v496 count:16];
                            }
                            while (v407);
                          }

                          -[GEOPDMultiLocalizedString clearUnknownFields:](*(void *)(v398 + 96));
                          uint64_t v410 = *(void *)(v398 + 64);
                          if (v410)
                          {
                            os_unfair_lock_lock_with_options();
                            *(unsigned char *)(v410 + 52) |= 1u;
                            *(unsigned char *)(v410 + 52) |= 8u;
                            os_unfair_lock_unlock((os_unfair_lock_t)(v410 + 48));
                            v411 = *(void **)(v410 + 16);
                            *(void *)(v410 + 16) = 0;

                            -[GEOPDBusinessConnectAttributes readAll:](v410, 0);
                          }
                        }
                      }
                      uint64_t v395 = [objf countByEnumeratingWithState:&v476 objects:&v492 count:16];
                    }
                    while (v395);
                  }

                  id i39 = v432;
                }
              }
            }
            uint64_t v428 = [v426 countByEnumeratingWithState:&v472 objects:&v488 count:16];
          }
          while (v428);
        }
      }
      v380 = v425;
    }
    uint64_t v412 = v380[39];
    if (v412)
    {
      uint64_t v413 = *(void **)(v412 + 8);
      *(void *)(v412 + 8) = 0;
    }
    uint64_t v414 = v380[38];
    if (v414)
    {
      id v415 = *(void **)(v414 + 8);
      *(void *)(v414 + 8) = 0;
    }
    uint64_t v416 = v380[33];
    if (v416)
    {
      v417 = *(void **)(v416 + 8);
      *(void *)(v416 + 8) = 0;

      [*(id *)(v416 + 16) clearUnknownFields:1];
    }
    uint64_t v418 = v380[44];
    if (v418)
    {
      v419 = *(void **)(v418 + 8);
      *(void *)(v418 + 8) = 0;

      uint64_t v420 = *(void *)(v418 + 16);
      if (v420)
      {
        long long v421 = *(void **)(v420 + 8);
        *(void *)(v420 + 8) = 0;
      }
    }
    uint64_t v422 = v380[4];
    if (v422)
    {
      long long v423 = *(void **)(v422 + 8);
      *(void *)(v422 + 8) = 0;
    }
  }
}

@end