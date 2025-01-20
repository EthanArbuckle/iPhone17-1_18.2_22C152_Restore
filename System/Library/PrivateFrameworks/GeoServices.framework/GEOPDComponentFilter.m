@interface GEOPDComponentFilter
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (GEOPDComponentFilter)init;
- (GEOPDComponentFilter)initWithData:(id)a3;
- (id)_dictionaryRepresentation:(uint64_t)a1;
- (id)amenitiesFilter;
- (id)captionedPhotoFilter;
- (id)categorizedPhotosFilter;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)factoidFilter;
- (id)initAddressObjectFilterWithLibraryVersion:(id)a3;
- (id)initAnnotatedItemListFilterWithTraits:(id)a3;
- (id)initCaptionedPhotoFilterWithTraits:(id)a3;
- (id)initEntityFilterWithSpokenNames;
- (id)initPhotoFilterWithTraits:(id)a3;
- (id)initRestaurantReservationLinkFilterWithTraits:(id)a3;
- (id)initResultSnippetFilterWithTraits:(id)a3;
- (id)initReviewUserPhotoFilterWithTraits:(id)a3;
- (id)initTipUserPhotoFilterWithTraits:(id)a3;
- (id)initTransitScheduleFilterWithTraits:(id)a3;
- (id)initTransitTripStopTimeFilterWithTraits:(id)a3;
- (id)jsonRepresentation;
- (id)placeCollectionFilter;
- (id)quickLinkFilter;
- (id)relatedPlaceFilter;
- (id)toolTipFilter;
- (uint64_t)_initWithDictionary:(int)a3 isJSON:;
- (uint64_t)hasGreenTeaWithValue:(uint64_t)result;
- (unint64_t)hash;
- (void)_readAmenitiesFilter;
- (void)_readCaptionedPhotoFilter;
- (void)_readCategorizedPhotosFilter;
- (void)_readFactoidFilter;
- (void)_readPlaceCollectionFilter;
- (void)_readPlaceCollectionItemFilter;
- (void)_readQuickLinkFilter;
- (void)_readRelatedPlaceFilter;
- (void)_readToolTipFilter;
- (void)clearUnknownFields:(uint64_t)a1;
- (void)readAll:(uint64_t)a1;
- (void)setAddressObjectFilter:(uint64_t)a1;
- (void)setAmenitiesFilter:(uint64_t)a1;
- (void)setAnnotatedItemListFilter:(uint64_t)a1;
- (void)setCaptionedPhotoFilter:(uint64_t)a1;
- (void)setCategorizedPhotosFilter:(uint64_t)a1;
- (void)setEntityFilter:(uint64_t)a1;
- (void)setFactoidFilter:(uint64_t)a1;
- (void)setForwardInfoFilter:(uint64_t)a1;
- (void)setOfflineAreaFilter:(uint64_t)a1;
- (void)setPhotoFilter:(uint64_t)a1;
- (void)setPlaceCollectionFilter:(uint64_t)a1;
- (void)setPlaceCollectionItemFilter:(uint64_t)a1;
- (void)setPublisherFilter:(uint64_t)a1;
- (void)setQuickLinkFilter:(uint64_t)a1;
- (void)setRelatedPlaceFilter:(uint64_t)a1;
- (void)setRestaurantReservationLinkFilter:(uint64_t)a1;
- (void)setResultSnippetFilter:(uint64_t)a1;
- (void)setReviewFilter:(uint64_t)a1;
- (void)setStorefrontFilter:(uint64_t)a1;
- (void)setStorefrontPresentationFilter:(uint64_t)a1;
- (void)setSupportsOfflineMapsFilter:(uint64_t)a1;
- (void)setTipFilter:(uint64_t)a1;
- (void)setToolTipFilter:(uint64_t)a1;
- (void)setTransitScheduleFilter:(uint64_t)a1;
- (void)setTransitTripStopTimeFilter:(uint64_t)a1;
- (void)writeTo:(id)a3;
@end

@implementation GEOPDComponentFilter

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_wifiFingerprintFilter, 0);
  objc_storeStrong((id *)&self->_walletCategoryInformationFilter, 0);
  objc_storeStrong((id *)&self->_venueInfoFilter, 0);
  objc_storeStrong((id *)&self->_vendorAmenitiesFilter, 0);
  objc_storeStrong((id *)&self->_transitVehiclePositionFilter, 0);
  objc_storeStrong((id *)&self->_transitTripStopTimeFilter, 0);
  objc_storeStrong((id *)&self->_transitTripStopFilter, 0);
  objc_storeStrong((id *)&self->_transitTripGeometryFilter, 0);
  objc_storeStrong((id *)&self->_transitScheduleFilter, 0);
  objc_storeStrong((id *)&self->_transitPaymentMethodInfoFilter, 0);
  objc_storeStrong((id *)&self->_transitInfoSnippetFilter, 0);
  objc_storeStrong((id *)&self->_transitInfoFilter, 0);
  objc_storeStrong((id *)&self->_transitIncidentFilter, 0);
  objc_storeStrong((id *)&self->_transitAttributionFilter, 0);
  objc_storeStrong((id *)&self->_transitAssociatedInfoFilter, 0);
  objc_storeStrong((id *)&self->_trailHeadFilter, 0);
  objc_storeStrong((id *)&self->_toolTipFilter, 0);
  objc_storeStrong((id *)&self->_tipFilter, 0);
  objc_storeStrong((id *)&self->_textBlockFilter, 0);
  objc_storeStrong((id *)&self->_templatePlaceFilter, 0);
  objc_storeStrong((id *)&self->_supportsOfflineMapsFilter, 0);
  objc_storeStrong((id *)&self->_styleAttributesFilter, 0);
  objc_storeStrong((id *)&self->_storefrontPresentationFilter, 0);
  objc_storeStrong((id *)&self->_storefrontFilter, 0);
  objc_storeStrong((id *)&self->_storefrontFacesFilter, 0);
  objc_storeStrong((id *)&self->_spatialLookupFilter, 0);
  objc_storeStrong((id *)&self->_simpleRestaurantMenuTextFilter, 0);
  objc_storeStrong((id *)&self->_searchResultPlacePhotoFilter, 0);
  objc_storeStrong((id *)&self->_reviewFilter, 0);
  objc_storeStrong((id *)&self->_resultSnippetFilter, 0);
  objc_storeStrong((id *)&self->_restaurantReservationLinkFilter, 0);
  objc_storeStrong((id *)&self->_relatedPlaceFilter, 0);
  objc_storeStrong((id *)&self->_refreshIdFilter, 0);
  objc_storeStrong((id *)&self->_rawAttributeFilter, 0);
  objc_storeStrong((id *)&self->_ratingFilter, 0);
  objc_storeStrong((id *)&self->_rapFilter, 0);
  objc_storeStrong((id *)&self->_quickLinkFilter, 0);
  objc_storeStrong((id *)&self->_publisherFilter, 0);
  objc_storeStrong((id *)&self->_protoTypeContainerFilter, 0);
  objc_storeStrong((id *)&self->_priceDescriptionFilter, 0);
  objc_storeStrong((id *)&self->_poiEventFilter, 0);
  objc_storeStrong((id *)&self->_poiClaimFilter, 0);
  objc_storeStrong((id *)&self->_placecardUrlFilter, 0);
  objc_storeStrong((id *)&self->_placecardLayoutConfigurationFilter, 0);
  objc_storeStrong((id *)&self->_placeQuestionnaireFilter, 0);
  objc_storeStrong((id *)&self->_placeInfoFilter, 0);
  objc_storeStrong((id *)&self->_placeCollectionItemFilter, 0);
  objc_storeStrong((id *)&self->_placeCollectionFilter, 0);
  objc_storeStrong((id *)&self->_photoFilter, 0);
  objc_storeStrong((id *)&self->_offlineAreaFilter, 0);
  objc_storeStrong((id *)&self->_messageLinkFilter, 0);
  objc_storeStrong((id *)&self->_locationEventFilter, 0);
  objc_storeStrong((id *)&self->_linkedServiceFilter, 0);
  objc_storeStrong((id *)&self->_labelGeometryFilter, 0);
  objc_storeStrong((id *)&self->_iso3166CodeFilter, 0);
  objc_storeStrong((id *)&self->_iconFilter, 0);
  objc_storeStrong((id *)&self->_hoursFilter, 0);
  objc_storeStrong((id *)&self->_hikeSummaryFilter, 0);
  objc_storeStrong((id *)&self->_hikeGeometryFilter, 0);
  objc_storeStrong((id *)&self->_hikeAssociatedInfoFilter, 0);
  objc_storeStrong((id *)&self->_guideGroupFilter, 0);
  objc_storeStrong((id *)&self->_groundViewLabelFilter, 0);
  objc_storeStrong((id *)&self->_forwardInfoFilter, 0);
  objc_storeStrong((id *)&self->_flyoverFilter, 0);
  objc_storeStrong((id *)&self->_factoidFilter, 0);
  objc_storeStrong((id *)&self->_externalActionFilter, 0);
  objc_storeStrong((id *)&self->_exploreGuidesFilter, 0);
  objc_storeStrong((id *)&self->_evChargerFilter, 0);
  objc_storeStrong((id *)&self->_etaFilter, 0);
  objc_storeStrong((id *)&self->_entityFilter, 0);
  objc_storeStrong((id *)&self->_enrichmentInfoFilter, 0);
  objc_storeStrong((id *)&self->_enrichmentDataFilter, 0);
  objc_storeStrong((id *)&self->_enhancedPlacementFilter, 0);
  objc_storeStrong((id *)&self->_containmentPlaceFilter, 0);
  objc_storeStrong((id *)&self->_containedPlaceFilter, 0);
  objc_storeStrong((id *)&self->_collectionIdsFilter, 0);
  objc_storeStrong((id *)&self->_categorizedPhotosFilter, 0);
  objc_storeStrong((id *)&self->_captionedPhotoFilter, 0);
  objc_storeStrong((id *)&self->_businessHoursFilter, 0);
  objc_storeStrong((id *)&self->_businessClaimFilter, 0);
  objc_storeStrong((id *)&self->_browseCategoriesFilter, 0);
  objc_storeStrong((id *)&self->_boundsFilter, 0);
  objc_storeStrong((id *)&self->_associatedAppFilter, 0);
  objc_storeStrong((id *)&self->_annotatedItemListFilter, 0);
  objc_storeStrong((id *)&self->_amenitiesFilter, 0);
  objc_storeStrong((id *)&self->_addressObjectFilter, 0);
  objc_storeStrong((id *)&self->_addressFilter, 0);
  objc_storeStrong((id *)&self->_addressComponentsFilter, 0);
  objc_storeStrong((id *)&self->_actionDataFilter, 0);
  objc_storeStrong((id *)&self->_accessInfoFilter, 0);
  objc_storeStrong((id *)&self->_aboutFilter, 0);
  objc_storeStrong((id *)&self->_unknownFields, 0);

  objc_storeStrong((id *)&self->_reader, 0);
}

- (unint64_t)hash
{
  -[GEOPDComponentFilter readAll:]((uint64_t)self, 1);
  unint64_t v3 = [(GEOPDEntityFilter *)self->_entityFilter hash];
  unint64_t v4 = [(GEOPDPlaceInfoFilter *)self->_placeInfoFilter hash] ^ v3;
  unint64_t v5 = [(GEOPDRoadAccessInfoFilter *)self->_accessInfoFilter hash];
  unint64_t v6 = v4 ^ v5 ^ [(GEOPDBoundsFilter *)self->_boundsFilter hash];
  unint64_t v7 = [(GEOPDAddressFilter *)self->_addressFilter hash];
  unint64_t v8 = v7 ^ [(GEOPDRatingFilter *)self->_ratingFilter hash];
  unint64_t v9 = v6 ^ v8 ^ [(GEOPDReviewFilter *)self->_reviewFilter hash];
  unint64_t v10 = [(GEOPDPhotoFilter *)self->_photoFilter hash];
  unint64_t v11 = v10 ^ [(GEOPDHoursFilter *)self->_hoursFilter hash];
  unint64_t v12 = v11 ^ [(GEOPDTransitInfoFilter *)self->_transitInfoFilter hash];
  unint64_t v13 = v9 ^ v12 ^ [(GEOPDTransitScheduleFilter *)self->_transitScheduleFilter hash];
  unint64_t v14 = [(GEOPDETAFilter *)self->_etaFilter hash];
  unint64_t v15 = v14 ^ [(GEOPDFlyoverFilter *)self->_flyoverFilter hash];
  unint64_t v16 = v15 ^ [(GEOPDRawAttributeFilter *)self->_rawAttributeFilter hash];
  unint64_t v17 = v16 ^ [(GEOPDAmenitiesFilter *)self->_amenitiesFilter hash];
  unint64_t v18 = v13 ^ v17 ^ [(GEOPDStyleAttributesFilter *)self->_styleAttributesFilter hash];
  unint64_t v19 = [(GEOPDTransitIncidentFilter *)self->_transitIncidentFilter hash];
  unint64_t v20 = v19 ^ [(GEOPDTransitAssociatedInfoFilter *)self->_transitAssociatedInfoFilter hash];
  unint64_t v21 = v20 ^ [(GEOPDTextBlockFilter *)self->_textBlockFilter hash];
  unint64_t v22 = v21 ^ [(GEOPDFactoidFilter *)self->_factoidFilter hash];
  unint64_t v23 = v22 ^ [(GEOPDTransitAttributionFilter *)self->_transitAttributionFilter hash];
  unint64_t v24 = v18 ^ v23 ^ [(GEOPDBusinessClaimFilter *)self->_businessClaimFilter hash];
  unint64_t v25 = [(GEOPDCaptionedPhotoFilter *)self->_captionedPhotoFilter hash];
  unint64_t v26 = v25 ^ [(GEOPDTransitInfoSnippetFilter *)self->_transitInfoSnippetFilter hash];
  unint64_t v27 = v26 ^ [(GEOPDExternalActionFilter *)self->_externalActionFilter hash];
  unint64_t v28 = v27 ^ [(GEOPDResultSnippetFilter *)self->_resultSnippetFilter hash];
  unint64_t v29 = v28 ^ [(GEOPDAddressObjectFilter *)self->_addressObjectFilter hash];
  unint64_t v30 = v29 ^ [(GEOPDSimpleRestaurantMenuTextFilter *)self->_simpleRestaurantMenuTextFilter hash];
  unint64_t v31 = v24 ^ v30 ^ [(GEOPDRestaurantReservationLinkFilter *)self->_restaurantReservationLinkFilter hash];
  unint64_t v32 = [(GEOPDSpatialLookupFilter *)self->_spatialLookupFilter hash];
  unint64_t v33 = v32 ^ [(GEOPDTipFilter *)self->_tipFilter hash];
  unint64_t v34 = v33 ^ [(GEOPDPlacecardURLFilter *)self->_placecardUrlFilter hash];
  unint64_t v35 = v34 ^ [(GEOPDAssociatedAppFilter *)self->_associatedAppFilter hash];
  unint64_t v36 = v35 ^ [(GEOPDMessageLinkFilter *)self->_messageLinkFilter hash];
  unint64_t v37 = v36 ^ [(GEOPDQuickLinkFilter *)self->_quickLinkFilter hash];
  unint64_t v38 = v37 ^ [(GEOPDRapFilter *)self->_rapFilter hash];
  unint64_t v39 = v31 ^ v38 ^ [(GEOPDOfflineAreaFilter *)self->_offlineAreaFilter hash];
  unint64_t v40 = [(GEOPDLocationEventFilter *)self->_locationEventFilter hash];
  unint64_t v41 = v40 ^ [(GEOPDSupportsOfflineMapsFilter *)self->_supportsOfflineMapsFilter hash];
  unint64_t v42 = v41 ^ [(GEOPDVenueInfoFilter *)self->_venueInfoFilter hash];
  unint64_t v43 = v42 ^ [(GEOPDContainedPlaceFilter *)self->_containedPlaceFilter hash];
  unint64_t v44 = v43 ^ [(GEOPDWifiFingerprintFilter *)self->_wifiFingerprintFilter hash];
  unint64_t v45 = v44 ^ [(GEOPDIconFilter *)self->_iconFilter hash];
  unint64_t v46 = v45 ^ [(GEOPDPriceDescriptionFilter *)self->_priceDescriptionFilter hash];
  unint64_t v47 = v46 ^ [(GEOPDBrowseCategoriesFilter *)self->_browseCategoriesFilter hash];
  unint64_t v48 = v39 ^ v47 ^ [(GEOPDStorefrontFilter *)self->_storefrontFilter hash];
  unint64_t v49 = [(GEOPDGroundViewLabelFilter *)self->_groundViewLabelFilter hash];
  unint64_t v50 = v49 ^ [(GEOPDAnnotatedItemListFilter *)self->_annotatedItemListFilter hash];
  unint64_t v51 = v50 ^ [(GEOPDPoiEventFilter *)self->_poiEventFilter hash];
  unint64_t v52 = v51 ^ [(GEOPDStorefrontPresentationFilter *)self->_storefrontPresentationFilter hash];
  unint64_t v53 = v52 ^ [(GEOPDPlacecardLayoutConfigurationFilter *)self->_placecardLayoutConfigurationFilter hash];
  unint64_t v54 = v53 ^ [(GEOPDPrototypeContainerFilter *)self->_protoTypeContainerFilter hash];
  unint64_t v55 = v54 ^ [(GEOPDVehiclePositionFilter *)self->_transitVehiclePositionFilter hash];
  unint64_t v56 = v55 ^ [(GEOPDLinkedServiceFilter *)self->_linkedServiceFilter hash];
  unint64_t v57 = v56 ^ [(GEOPDBusinessHoursFilter *)self->_businessHoursFilter hash];
  unint64_t v58 = v48 ^ v57 ^ [(GEOPDPlaceCollectionFilter *)self->_placeCollectionFilter hash];
  unint64_t v59 = [(GEOPDRelatedPlaceFilter *)self->_relatedPlaceFilter hash];
  unint64_t v60 = v59 ^ [(GEOPDTransitTripStopFilter *)self->_transitTripStopFilter hash];
  unint64_t v61 = v60 ^ [(GEOPDTransitTripStopTimeFilter *)self->_transitTripStopTimeFilter hash];
  unint64_t v62 = v61 ^ [(GEOPDTransitTripGeometryFilter *)self->_transitTripGeometryFilter hash];
  unint64_t v63 = v62 ^ [(GEOPDWalletCategoryInformationFilter *)self->_walletCategoryInformationFilter hash];
  unint64_t v64 = v63 ^ [(GEOPDPublisherFilter *)self->_publisherFilter hash];
  unint64_t v65 = v64 ^ [(GEOPDPlaceQuestionnaireFilter *)self->_placeQuestionnaireFilter hash];
  unint64_t v66 = v65 ^ [(GEOPDPlaceCollectionItemFilter *)self->_placeCollectionItemFilter hash];
  unint64_t v67 = v66 ^ [(GEOPDCollectionIdsFilter *)self->_collectionIdsFilter hash];
  unint64_t v68 = v67 ^ [(GEOPDISO3166CodeFilter *)self->_iso3166CodeFilter hash];
  unint64_t v69 = v58 ^ v68 ^ [(GEOPDVendorAmenitiesFilter *)self->_vendorAmenitiesFilter hash];
  unint64_t v70 = [(GEOPDStorefrontFacesFilter *)self->_storefrontFacesFilter hash];
  unint64_t v71 = v70 ^ [(GEOPDGuideGroupFilter *)self->_guideGroupFilter hash];
  unint64_t v72 = v71 ^ [(GEOPDContainmentPlaceFilter *)self->_containmentPlaceFilter hash];
  unint64_t v73 = v72 ^ [(GEOPDCategorizedPhotosFilter *)self->_categorizedPhotosFilter hash];
  unint64_t v74 = v73 ^ [(GEOPDExploreGuidesFilter *)self->_exploreGuidesFilter hash];
  unint64_t v75 = v74 ^ [(GEOPDAboutFilter *)self->_aboutFilter hash];
  unint64_t v76 = v75 ^ [(GEOPDLabelGeometryFilter *)self->_labelGeometryFilter hash];
  unint64_t v77 = v76 ^ [(GEOPDEnhancedPlacementFilter *)self->_enhancedPlacementFilter hash];
  unint64_t v78 = v77 ^ [(GEOPDTemplatePlaceFilter *)self->_templatePlaceFilter hash];
  unint64_t v79 = v78 ^ [(GEOPDTransitPaymentMethodInfoFilter *)self->_transitPaymentMethodInfoFilter hash];
  unint64_t v80 = v79 ^ [(GEOPDEnrichmentInfoFilter *)self->_enrichmentInfoFilter hash];
  unint64_t v81 = v69 ^ v80 ^ [(GEOPDActionDataFilter *)self->_actionDataFilter hash];
  unint64_t v82 = [(GEOPDEnrichmentDataFilter *)self->_enrichmentDataFilter hash];
  unint64_t v83 = v82 ^ [(GEOPDPOIClaimFilter *)self->_poiClaimFilter hash];
  unint64_t v84 = v83 ^ [(GEOPDEVChargerFilter *)self->_evChargerFilter hash];
  unint64_t v85 = v84 ^ [(GEOPDTrailHeadFilter *)self->_trailHeadFilter hash];
  unint64_t v86 = v85 ^ [(GEOPDRefreshIdFilter *)self->_refreshIdFilter hash];
  unint64_t v87 = v86 ^ [(GEOPDAddressWithComponentsFilter *)self->_addressComponentsFilter hash];
  unint64_t v88 = v87 ^ [(GEOPDSearchResultPlacePhotoFilter *)self->_searchResultPlacePhotoFilter hash];
  unint64_t v89 = v88 ^ [(GEOPDForwardInfoFilter *)self->_forwardInfoFilter hash];
  unint64_t v90 = v89 ^ [(GEOPDHikeAssociatedInfoFilter *)self->_hikeAssociatedInfoFilter hash];
  unint64_t v91 = v90 ^ [(GEOPDHikeSummaryFilter *)self->_hikeSummaryFilter hash];
  unint64_t v92 = v91 ^ [(GEOPDHikeGeometryFilter *)self->_hikeGeometryFilter hash];
  return v81 ^ v92 ^ [(GEOPDTooltipFilter *)self->_toolTipFilter hash];
}

- (void)readAll:(uint64_t)a1
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 760));
    unint64_t v4 = *(void **)(a1 + 8);
    if (v4)
    {
      id v5 = v4;
      objc_sync_enter(v5);
      if (a2) {
        unint64_t v6 = (int *)&readAll__recursiveTag_2475;
      }
      else {
        unint64_t v6 = (int *)&readAll__nonRecursiveTag_2476;
      }
      GEOPDComponentFilterReadSpecified(a1, *(char **)(a1 + 8), v6);
      objc_sync_exit(v5);
    }
    if (a2) {
      _GEOPDComponentFilterCallReadAllRecursiveWithoutSynchronized((uint64_t *)a1);
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 760));
  }
}

- (GEOPDComponentFilter)init
{
  v6.receiver = self;
  v6.super_class = (Class)GEOPDComponentFilter;
  v2 = [(GEOPDComponentFilter *)&v6 init];
  unint64_t v3 = v2;
  if (v2)
  {
    v2->_readerLock._os_unfair_lock_opaque = 0;
    unint64_t v4 = v2;
  }

  return v3;
}

- (id)relatedPlaceFilter
{
  if (a1)
  {
    v2 = a1;
    -[GEOPDComponentFilter _readRelatedPlaceFilter]((uint64_t)a1);
    a1 = (id *)v2[62];
    uint64_t v1 = vars8;
  }
  return a1;
}

- (id)categorizedPhotosFilter
{
  if (a1)
  {
    v2 = a1;
    -[GEOPDComponentFilter _readCategorizedPhotosFilter]((uint64_t)a1);
    a1 = (id *)v2[17];
    uint64_t v1 = vars8;
  }
  return a1;
}

- (void)_readRelatedPlaceFilter
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 760));
    if ((*(void *)(a1 + 764) & 0x1000000000000000) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOPDComponentFilterReadSpecified(a1, *(char **)(a1 + 8), (int *)&_readRelatedPlaceFilter_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 760));
  }
}

- (void)_readCategorizedPhotosFilter
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 760));
    if ((*(void *)(a1 + 764) & 0x8000) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOPDComponentFilterReadSpecified(a1, *(char **)(a1 + 8), (int *)&_readCategorizedPhotosFilter_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 760));
  }
}

- (void)setSupportsOfflineMapsFilter:(uint64_t)a1
{
  id v4 = a2;
  if (a1)
  {
    *(_DWORD *)(a1 + 772) |= 0x10000080u;
    objc_storeStrong((id *)(a1 + 584), a2);
  }
}

- (void)setStorefrontPresentationFilter:(uint64_t)a1
{
  id v4 = a2;
  if (a1)
  {
    *(_DWORD *)(a1 + 772) |= 0x10000020u;
    objc_storeStrong((id *)(a1 + 568), a2);
  }
}

- (void)setStorefrontFilter:(uint64_t)a1
{
  id v4 = a2;
  if (a1)
  {
    *(_DWORD *)(a1 + 772) |= 0x10000010u;
    objc_storeStrong((id *)(a1 + 560), a2);
  }
}

- (void)setRelatedPlaceFilter:(uint64_t)a1
{
  id v5 = a2;
  if (a1)
  {
    int v4 = *(_DWORD *)(a1 + 772) | 0x10000000;
    *(void *)(a1 + 764) |= 0x1000000000000000uLL;
    *(_DWORD *)(a1 + 772) = v4;
    objc_storeStrong((id *)(a1 + 496), a2);
  }
}

- (void)setQuickLinkFilter:(uint64_t)a1
{
  id v5 = a2;
  if (a1)
  {
    int v4 = *(_DWORD *)(a1 + 772) | 0x10000000;
    *(void *)(a1 + 764) |= 0x80000000000000uLL;
    *(_DWORD *)(a1 + 772) = v4;
    objc_storeStrong((id *)(a1 + 456), a2);
  }
}

- (void)setOfflineAreaFilter:(uint64_t)a1
{
  id v5 = a2;
  if (a1)
  {
    int v4 = *(_DWORD *)(a1 + 772) | 0x10000000;
    *(void *)(a1 + 764) |= 0x40000000000uLL;
    *(_DWORD *)(a1 + 772) = v4;
    objc_storeStrong((id *)(a1 + 352), a2);
  }
}

- (void)setForwardInfoFilter:(uint64_t)a1
{
  id v5 = a2;
  if (a1)
  {
    int v4 = *(_DWORD *)(a1 + 772) | 0x10000000;
    *(void *)(a1 + 764) |= 0x20000000uLL;
    *(_DWORD *)(a1 + 772) = v4;
    objc_storeStrong((id *)(a1 + 248), a2);
  }
}

- (void)setFactoidFilter:(uint64_t)a1
{
  id v5 = a2;
  if (a1)
  {
    int v4 = *(_DWORD *)(a1 + 772) | 0x10000000;
    *(void *)(a1 + 764) |= 0x8000000uLL;
    *(_DWORD *)(a1 + 772) = v4;
    objc_storeStrong((id *)(a1 + 232), a2);
  }
}

- (void)setCategorizedPhotosFilter:(uint64_t)a1
{
  id v5 = a2;
  if (a1)
  {
    int v4 = *(_DWORD *)(a1 + 772) | 0x10000000;
    *(void *)(a1 + 764) |= 0x8000uLL;
    *(_DWORD *)(a1 + 772) = v4;
    objc_storeStrong((id *)(a1 + 136), a2);
  }
}

- (void)setAmenitiesFilter:(uint64_t)a1
{
  id v5 = a2;
  if (a1)
  {
    int v4 = *(_DWORD *)(a1 + 772) | 0x10000000;
    *(void *)(a1 + 764) |= 0x80uLL;
    *(_DWORD *)(a1 + 772) = v4;
    objc_storeStrong((id *)(a1 + 72), a2);
  }
}

- (id)quickLinkFilter
{
  if (a1)
  {
    v2 = a1;
    -[GEOPDComponentFilter _readQuickLinkFilter]((uint64_t)a1);
    a1 = (id *)v2[57];
    uint64_t v1 = vars8;
  }
  return a1;
}

- (id)factoidFilter
{
  if (a1)
  {
    v2 = a1;
    -[GEOPDComponentFilter _readFactoidFilter]((uint64_t)a1);
    a1 = (id *)v2[29];
    uint64_t v1 = vars8;
  }
  return a1;
}

- (id)amenitiesFilter
{
  if (a1)
  {
    v2 = a1;
    -[GEOPDComponentFilter _readAmenitiesFilter]((uint64_t)a1);
    a1 = (id *)v2[9];
    uint64_t v1 = vars8;
  }
  return a1;
}

- (void)_readQuickLinkFilter
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 760));
    if ((*(void *)(a1 + 764) & 0x80000000000000) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOPDComponentFilterReadSpecified(a1, *(char **)(a1 + 8), (int *)&_readQuickLinkFilter_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 760));
  }
}

- (void)_readFactoidFilter
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 760));
    if ((*(void *)(a1 + 764) & 0x8000000) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOPDComponentFilterReadSpecified(a1, *(char **)(a1 + 8), (int *)&_readFactoidFilter_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 760));
  }
}

- (void)_readAmenitiesFilter
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 760));
    if ((*(void *)(a1 + 764) & 0x80) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOPDComponentFilterReadSpecified(a1, *(char **)(a1 + 8), (int *)&_readAmenitiesFilter_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 760));
  }
}

- (void)writeTo:(id)a3
{
  id v16 = a3;
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  id v5 = &OBJC_IVAR___GEOXPCReply__error;
  objc_super v6 = &OBJC_IVAR___GEOXPCReply__error;
  if (!self->_reader) {
    goto LABEL_3;
  }
  os_unfair_lock_assert_owner(&self->_readerLock);
  int v7 = *((_DWORD *)&self->_flags + 2);
  uint64_t flags = (uint64_t)self->_flags;
  if (flags & 0x8200480800400424 | v7 & 0x10010000) {
    goto LABEL_3;
  }
  if ((v7 & 0x80000) != 0)
  {
    transitScheduleFilter = self->_transitScheduleFilter;
    if (transitScheduleFilter)
    {
      os_unfair_lock_lock_with_options();
      os_unfair_lock_assert_owner(&transitScheduleFilter->_readerLock);
      int v11 = *(unsigned char *)&transitScheduleFilter->_flags & 0x38;
      objc_super v6 = &OBJC_IVAR___GEOXPCReply__error;
      os_unfair_lock_unlock(&transitScheduleFilter->_readerLock);
      id v5 = &OBJC_IVAR___GEOXPCReply__error;
      if (v11) {
        goto LABEL_3;
      }
      uint64_t flags = (uint64_t)self->_flags;
      int v7 = *((_DWORD *)&self->_flags + 2);
    }
  }
  id v5 = &OBJC_IVAR___GEOXPCReply__error;
  if ((flags & 0x800000) != 0)
  {
    if (GEOPDETAFilterIsDirty((os_unfair_lock_s *)self->_etaFilter)) {
      goto LABEL_3;
    }
    uint64_t flags = (uint64_t)self->_flags;
    int v7 = *((_DWORD *)&self->_flags + 2);
  }
  if (!(flags & 0x400000018001080 | (unsigned __int16)v7 & 0xE240))
  {
    if ((flags & 0x4000) != 0)
    {
      captionedPhotoFilter = self->_captionedPhotoFilter;
      if (captionedPhotoFilter)
      {
        os_unfair_lock_lock_with_options();
        os_unfair_lock_assert_owner(&captionedPhotoFilter->_readerLock);
        int v13 = *(unsigned char *)&captionedPhotoFilter->_flags & 0xE;
        objc_super v6 = &OBJC_IVAR___GEOXPCReply__error;
        os_unfair_lock_unlock(&captionedPhotoFilter->_readerLock);
        id v5 = &OBJC_IVAR___GEOXPCReply__error;
        if (v13) {
          goto LABEL_3;
        }
      }
      uint64_t flags = (uint64_t)self->_flags;
      int v7 = *((_DWORD *)&self->_flags + 2);
      id v5 = &OBJC_IVAR___GEOXPCReply__error;
    }
    if (!(flags & 0x71BB179044022B40 | v7 & 0xAA204B6))
    {
      if ((v7 & 0x400000) != 0)
      {
        if (GEOPDTransitTripStopTimeFilterIsDirty(*(uint64_t *)((char *)&self->super.super.isa + v5[772]))) {
          goto LABEL_3;
        }
        uint64_t flags = (uint64_t)self->_flags;
        int v7 = *((_DWORD *)&self->_flags + 2);
      }
      if (!(flags & 0x40A02080050000 | v7 & 0x5100008))
      {
        if ((flags & 0x8000) != 0)
        {
          if (GEOPDCategorizedPhotosFilterIsDirty(*(uint64_t *)((char *)&self->super.super.isa + v6[775]))) {
            goto LABEL_3;
          }
          uint64_t flags = (uint64_t)self->_flags;
          int v7 = *((_DWORD *)&self->_flags + 2);
        }
        if (!(flags & 0x80400472338001ALL | *(void *)&v7 & 0x41901))
        {
          unint64_t v14 = self->_reader;
          objc_sync_enter(v14);
          *(void *)((char *)self->_reader + (int)*MEMORY[0x1E4F940E0]) = self->_readerMarkLength;
          [(PBDataReader *)self->_reader seekToOffset:self->_readerMarkPos];
          unint64_t v15 = [(PBDataReader *)self->_reader readBytes:self->_readerMarkLength - self->_readerMarkPos];
          [v16 writeData:v15];
          os_unfair_lock_unlock(p_readerLock);

          objc_sync_exit(v14);
          goto LABEL_186;
        }
      }
    }
  }
LABEL_3:
  os_unfair_lock_unlock(&self->_readerLock);
  -[GEOPDComponentFilter readAll:]((uint64_t)self, 0);
  if (self->_entityFilter) {
    PBDataWriterWriteSubmessage();
  }
  id v9 = v16;
  if (self->_placeInfoFilter)
  {
    PBDataWriterWriteSubmessage();
    id v9 = v16;
  }
  if (self->_accessInfoFilter)
  {
    PBDataWriterWriteSubmessage();
    id v9 = v16;
  }
  if (self->_boundsFilter)
  {
    PBDataWriterWriteSubmessage();
    id v9 = v16;
  }
  if (self->_addressFilter)
  {
    PBDataWriterWriteSubmessage();
    id v9 = v16;
  }
  if (self->_ratingFilter)
  {
    PBDataWriterWriteSubmessage();
    id v9 = v16;
  }
  if (self->_reviewFilter)
  {
    PBDataWriterWriteSubmessage();
    id v9 = v16;
  }
  if (self->_photoFilter)
  {
    PBDataWriterWriteSubmessage();
    id v9 = v16;
  }
  if (self->_hoursFilter)
  {
    PBDataWriterWriteSubmessage();
    id v9 = v16;
  }
  if (self->_transitInfoFilter)
  {
    PBDataWriterWriteSubmessage();
    id v9 = v16;
  }
  if (self->_transitScheduleFilter)
  {
    PBDataWriterWriteSubmessage();
    id v9 = v16;
  }
  if (self->_etaFilter)
  {
    PBDataWriterWriteSubmessage();
    id v9 = v16;
  }
  if (self->_flyoverFilter)
  {
    PBDataWriterWriteSubmessage();
    id v9 = v16;
  }
  if (self->_rawAttributeFilter)
  {
    PBDataWriterWriteSubmessage();
    id v9 = v16;
  }
  if (self->_amenitiesFilter)
  {
    PBDataWriterWriteSubmessage();
    id v9 = v16;
  }
  if (self->_styleAttributesFilter)
  {
    PBDataWriterWriteSubmessage();
    id v9 = v16;
  }
  if (self->_transitIncidentFilter)
  {
    PBDataWriterWriteSubmessage();
    id v9 = v16;
  }
  if (self->_transitAssociatedInfoFilter)
  {
    PBDataWriterWriteSubmessage();
    id v9 = v16;
  }
  if (self->_textBlockFilter)
  {
    PBDataWriterWriteSubmessage();
    id v9 = v16;
  }
  if (self->_factoidFilter)
  {
    PBDataWriterWriteSubmessage();
    id v9 = v16;
  }
  if (self->_transitAttributionFilter)
  {
    PBDataWriterWriteSubmessage();
    id v9 = v16;
  }
  if (self->_businessClaimFilter)
  {
    PBDataWriterWriteSubmessage();
    id v9 = v16;
  }
  if (self->_captionedPhotoFilter)
  {
    PBDataWriterWriteSubmessage();
    id v9 = v16;
  }
  if (self->_transitInfoSnippetFilter)
  {
    PBDataWriterWriteSubmessage();
    id v9 = v16;
  }
  if (self->_externalActionFilter)
  {
    PBDataWriterWriteSubmessage();
    id v9 = v16;
  }
  if (self->_resultSnippetFilter)
  {
    PBDataWriterWriteSubmessage();
    id v9 = v16;
  }
  if (self->_addressObjectFilter)
  {
    PBDataWriterWriteSubmessage();
    id v9 = v16;
  }
  if (self->_simpleRestaurantMenuTextFilter)
  {
    PBDataWriterWriteSubmessage();
    id v9 = v16;
  }
  if (self->_restaurantReservationLinkFilter)
  {
    PBDataWriterWriteSubmessage();
    id v9 = v16;
  }
  if (self->_spatialLookupFilter)
  {
    PBDataWriterWriteSubmessage();
    id v9 = v16;
  }
  if (self->_tipFilter)
  {
    PBDataWriterWriteSubmessage();
    id v9 = v16;
  }
  if (self->_placecardUrlFilter)
  {
    PBDataWriterWriteSubmessage();
    id v9 = v16;
  }
  if (self->_associatedAppFilter)
  {
    PBDataWriterWriteSubmessage();
    id v9 = v16;
  }
  if (self->_messageLinkFilter)
  {
    PBDataWriterWriteSubmessage();
    id v9 = v16;
  }
  if (self->_quickLinkFilter)
  {
    PBDataWriterWriteSubmessage();
    id v9 = v16;
  }
  if (self->_rapFilter)
  {
    PBDataWriterWriteSubmessage();
    id v9 = v16;
  }
  if (self->_offlineAreaFilter)
  {
    PBDataWriterWriteSubmessage();
    id v9 = v16;
  }
  if (self->_locationEventFilter)
  {
    PBDataWriterWriteSubmessage();
    id v9 = v16;
  }
  if (self->_supportsOfflineMapsFilter)
  {
    PBDataWriterWriteSubmessage();
    id v9 = v16;
  }
  if (self->_venueInfoFilter)
  {
    PBDataWriterWriteSubmessage();
    id v9 = v16;
  }
  if (self->_containedPlaceFilter)
  {
    PBDataWriterWriteSubmessage();
    id v9 = v16;
  }
  if (self->_wifiFingerprintFilter)
  {
    PBDataWriterWriteSubmessage();
    id v9 = v16;
  }
  if (self->_iconFilter)
  {
    PBDataWriterWriteSubmessage();
    id v9 = v16;
  }
  if (self->_priceDescriptionFilter)
  {
    PBDataWriterWriteSubmessage();
    id v9 = v16;
  }
  if (self->_browseCategoriesFilter)
  {
    PBDataWriterWriteSubmessage();
    id v9 = v16;
  }
  if (self->_storefrontFilter)
  {
    PBDataWriterWriteSubmessage();
    id v9 = v16;
  }
  if (self->_groundViewLabelFilter)
  {
    PBDataWriterWriteSubmessage();
    id v9 = v16;
  }
  if (self->_annotatedItemListFilter)
  {
    PBDataWriterWriteSubmessage();
    id v9 = v16;
  }
  if (self->_poiEventFilter)
  {
    PBDataWriterWriteSubmessage();
    id v9 = v16;
  }
  if (self->_storefrontPresentationFilter)
  {
    PBDataWriterWriteSubmessage();
    id v9 = v16;
  }
  if (self->_placecardLayoutConfigurationFilter)
  {
    PBDataWriterWriteSubmessage();
    id v9 = v16;
  }
  if (self->_protoTypeContainerFilter)
  {
    PBDataWriterWriteSubmessage();
    id v9 = v16;
  }
  if (self->_transitVehiclePositionFilter)
  {
    PBDataWriterWriteSubmessage();
    id v9 = v16;
  }
  if (self->_linkedServiceFilter)
  {
    PBDataWriterWriteSubmessage();
    id v9 = v16;
  }
  if (self->_businessHoursFilter)
  {
    PBDataWriterWriteSubmessage();
    id v9 = v16;
  }
  if (self->_placeCollectionFilter)
  {
    PBDataWriterWriteSubmessage();
    id v9 = v16;
  }
  if (self->_relatedPlaceFilter)
  {
    PBDataWriterWriteSubmessage();
    id v9 = v16;
  }
  if (self->_transitTripStopFilter)
  {
    PBDataWriterWriteSubmessage();
    id v9 = v16;
  }
  if (*(Class *)((char *)&self->super.super.isa + v5[772]))
  {
    PBDataWriterWriteSubmessage();
    id v9 = v16;
  }
  if (self->_transitTripGeometryFilter)
  {
    PBDataWriterWriteSubmessage();
    id v9 = v16;
  }
  if (self->_walletCategoryInformationFilter)
  {
    PBDataWriterWriteSubmessage();
    id v9 = v16;
  }
  if (self->_publisherFilter)
  {
    PBDataWriterWriteSubmessage();
    id v9 = v16;
  }
  if (self->_placeQuestionnaireFilter)
  {
    PBDataWriterWriteSubmessage();
    id v9 = v16;
  }
  if (self->_placeCollectionItemFilter)
  {
    PBDataWriterWriteSubmessage();
    id v9 = v16;
  }
  if (self->_collectionIdsFilter)
  {
    PBDataWriterWriteSubmessage();
    id v9 = v16;
  }
  if (self->_iso3166CodeFilter)
  {
    PBDataWriterWriteSubmessage();
    id v9 = v16;
  }
  if (self->_vendorAmenitiesFilter)
  {
    PBDataWriterWriteSubmessage();
    id v9 = v16;
  }
  if (self->_storefrontFacesFilter)
  {
    PBDataWriterWriteSubmessage();
    id v9 = v16;
  }
  if (self->_guideGroupFilter)
  {
    PBDataWriterWriteSubmessage();
    id v9 = v16;
  }
  if (self->_containmentPlaceFilter)
  {
    PBDataWriterWriteSubmessage();
    id v9 = v16;
  }
  if (*(Class *)((char *)&self->super.super.isa + v6[775]))
  {
    PBDataWriterWriteSubmessage();
    id v9 = v16;
  }
  if (self->_exploreGuidesFilter)
  {
    PBDataWriterWriteSubmessage();
    id v9 = v16;
  }
  if (self->_aboutFilter)
  {
    PBDataWriterWriteSubmessage();
    id v9 = v16;
  }
  if (self->_labelGeometryFilter)
  {
    PBDataWriterWriteSubmessage();
    id v9 = v16;
  }
  if (self->_enhancedPlacementFilter)
  {
    PBDataWriterWriteSubmessage();
    id v9 = v16;
  }
  if (self->_templatePlaceFilter)
  {
    PBDataWriterWriteSubmessage();
    id v9 = v16;
  }
  if (self->_transitPaymentMethodInfoFilter)
  {
    PBDataWriterWriteSubmessage();
    id v9 = v16;
  }
  if (self->_enrichmentInfoFilter)
  {
    PBDataWriterWriteSubmessage();
    id v9 = v16;
  }
  if (self->_actionDataFilter)
  {
    PBDataWriterWriteSubmessage();
    id v9 = v16;
  }
  if (self->_enrichmentDataFilter)
  {
    PBDataWriterWriteSubmessage();
    id v9 = v16;
  }
  if (self->_poiClaimFilter)
  {
    PBDataWriterWriteSubmessage();
    id v9 = v16;
  }
  if (self->_evChargerFilter)
  {
    PBDataWriterWriteSubmessage();
    id v9 = v16;
  }
  if (self->_trailHeadFilter)
  {
    PBDataWriterWriteSubmessage();
    id v9 = v16;
  }
  if (self->_refreshIdFilter)
  {
    PBDataWriterWriteSubmessage();
    id v9 = v16;
  }
  if (self->_addressComponentsFilter)
  {
    PBDataWriterWriteSubmessage();
    id v9 = v16;
  }
  if (self->_searchResultPlacePhotoFilter)
  {
    PBDataWriterWriteSubmessage();
    id v9 = v16;
  }
  if (self->_forwardInfoFilter)
  {
    PBDataWriterWriteSubmessage();
    id v9 = v16;
  }
  if (self->_hikeAssociatedInfoFilter)
  {
    PBDataWriterWriteSubmessage();
    id v9 = v16;
  }
  if (self->_hikeSummaryFilter)
  {
    PBDataWriterWriteSubmessage();
    id v9 = v16;
  }
  if (self->_hikeGeometryFilter)
  {
    PBDataWriterWriteSubmessage();
    id v9 = v16;
  }
  if (self->_toolTipFilter)
  {
    PBDataWriterWriteSubmessage();
    id v9 = v16;
  }
  [(PBUnknownFields *)self->_unknownFields writeTo:v9];
LABEL_186:
}

- (id)initTransitScheduleFilterWithTraits:(id)a3
{
  id v4 = a3;
  v22.receiver = self;
  v22.super_class = (Class)GEOPDComponentFilter;
  id v5 = [(GEOPDComponentFilter *)&v22 init];
  if (v5)
  {
    objc_super v6 = objc_alloc_init(GEOPDTransitScheduleFilter);
    int v7 = [v4 transitScheduleFilter];
    if ([v7 hasHighFrequencyFilter])
    {
      unint64_t v8 = [GEOPDDeparturePredicate alloc];
      id v9 = [v7 highFrequencyFilter];
      unint64_t v10 = [(GEOPDDeparturePredicate *)v8 initWithTraitsTransitModeFilter:v9];
      -[GEOPDTransitScheduleFilter setDeparturePredicateCountdown:]((uint64_t)v6, v10);
    }
    if ([v7 hasLowFrequencyFilter])
    {
      int v11 = [GEOPDDeparturePredicate alloc];
      unint64_t v12 = [v7 lowFrequencyFilter];
      int v13 = [(GEOPDDeparturePredicate *)v11 initWithTraitsTransitModeFilter:v12];
      -[GEOPDTransitScheduleFilter setDeparturePredicateStamp:]((uint64_t)v6, v13);
    }
    if ([v7 hasOperatingHoursRange])
    {
      unint64_t v14 = [v7 operatingHoursRange];
      [v14 startTime];
      double v16 = v15;

      unint64_t v17 = [v7 operatingHoursRange];
      [v17 duration];
      double v19 = v18;

      if (v6)
      {
        *(unsigned char *)&v6->_flags |= 0x20u;
        *(unsigned char *)&v6->_flags |= 1u;
        *(void *)&v6->_operatingHoursRange._duration = v19 | ((unint64_t)v16 << 32);
        v6->_operatingHoursRange._has = ($B85216D09A238EDB5177F50F3CAD2EB5)3;
LABEL_10:
        *(unsigned char *)&v6->_flags |= 0x20u;
        *(unsigned char *)&v6->_flags |= 2u;
        v6->_includeRealTimeDepartures = 1;
      }
    }
    else if (v6)
    {
      goto LABEL_10;
    }
    -[GEOPDComponentFilter setTransitScheduleFilter:]((uint64_t)v5, v6);
    unint64_t v20 = v5;
  }
  return v5;
}

- (id)initReviewUserPhotoFilterWithTraits:(id)a3
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v18.receiver = self;
  v18.super_class = (Class)GEOPDComponentFilter;
  id v5 = [(GEOPDComponentFilter *)&v18 init];
  if (v5)
  {
    objc_super v6 = objc_alloc_init(GEOPDReviewFilter);
    long long v14 = 0u;
    long long v15 = 0u;
    long long v16 = 0u;
    long long v17 = 0u;
    int v7 = objc_msgSend(v4, "reviewUserPhotoSizes", 0);
    uint64_t v8 = [v7 countByEnumeratingWithState:&v14 objects:v19 count:16];
    if (v8)
    {
      uint64_t v9 = v8;
      uint64_t v10 = *(void *)v15;
      do
      {
        uint64_t v11 = 0;
        do
        {
          if (*(void *)v15 != v10) {
            objc_enumerationMutation(v7);
          }
          -[GEOPDReviewFilter addPhotoSizeFilter:]((uint64_t)v6, [*(id *)(*((void *)&v14 + 1) + 8 * v11) height] | (unint64_t)(objc_msgSend(*(id *)(*((void *)&v14 + 1) + 8 * v11), "width") << 32), 3);
          ++v11;
        }
        while (v9 != v11);
        uint64_t v9 = [v7 countByEnumeratingWithState:&v14 objects:v19 count:16];
      }
      while (v9);
    }

    if (v6)
    {
      *(unsigned char *)&v6->_flags |= 1u;
      v6->_suppressSyntheticReviews = 1;
    }
    -[GEOPDComponentFilter setReviewFilter:]((uint64_t)v5, v6);
    unint64_t v12 = v5;
  }
  return v5;
}

- (id)initTipUserPhotoFilterWithTraits:(id)a3
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v18.receiver = self;
  v18.super_class = (Class)GEOPDComponentFilter;
  id v5 = [(GEOPDComponentFilter *)&v18 init];
  if (v5)
  {
    objc_super v6 = objc_alloc_init(GEOPDTipFilter);
    long long v14 = 0u;
    long long v15 = 0u;
    long long v16 = 0u;
    long long v17 = 0u;
    int v7 = objc_msgSend(v4, "reviewUserPhotoSizes", 0);
    uint64_t v8 = [v7 countByEnumeratingWithState:&v14 objects:v19 count:16];
    if (v8)
    {
      uint64_t v9 = v8;
      uint64_t v10 = *(void *)v15;
      do
      {
        uint64_t v11 = 0;
        do
        {
          if (*(void *)v15 != v10) {
            objc_enumerationMutation(v7);
          }
          -[GEOPDTipFilter addPhotoSizeFilter:]((uint64_t)v6, [*(id *)(*((void *)&v14 + 1) + 8 * v11) height] | (unint64_t)(objc_msgSend(*(id *)(*((void *)&v14 + 1) + 8 * v11), "width") << 32), 3);
          ++v11;
        }
        while (v9 != v11);
        uint64_t v9 = [v7 countByEnumeratingWithState:&v14 objects:v19 count:16];
      }
      while (v9);
    }

    -[GEOPDComponentFilter setTipFilter:]((uint64_t)v5, v6);
    unint64_t v12 = v5;
  }
  return v5;
}

- (void)setTipFilter:(uint64_t)a1
{
  id v4 = a2;
  if (a1)
  {
    *(_DWORD *)(a1 + 772) |= 0x10000400u;
    objc_storeStrong((id *)(a1 + 608), a2);
  }
}

- (id)initCaptionedPhotoFilterWithTraits:(id)a3
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v18.receiver = self;
  v18.super_class = (Class)GEOPDComponentFilter;
  id v5 = [(GEOPDComponentFilter *)&v18 init];
  if (v5)
  {
    objc_super v6 = objc_alloc_init(GEOPDCaptionedPhotoFilter);
    long long v14 = 0u;
    long long v15 = 0u;
    long long v16 = 0u;
    long long v17 = 0u;
    int v7 = objc_msgSend(v4, "photoSizes", 0);
    uint64_t v8 = [v7 countByEnumeratingWithState:&v14 objects:v19 count:16];
    if (v8)
    {
      uint64_t v9 = v8;
      uint64_t v10 = *(void *)v15;
      do
      {
        uint64_t v11 = 0;
        do
        {
          if (*(void *)v15 != v10) {
            objc_enumerationMutation(v7);
          }
          -[GEOPDCaptionedPhotoFilter addPhotoSizeFilter:]((uint64_t)v6, [*(id *)(*((void *)&v14 + 1) + 8 * v11) height] | (unint64_t)(objc_msgSend(*(id *)(*((void *)&v14 + 1) + 8 * v11), "width") << 32), 3);
          ++v11;
        }
        while (v9 != v11);
        uint64_t v9 = [v7 countByEnumeratingWithState:&v14 objects:v19 count:16];
      }
      while (v9);
    }

    -[GEOPDComponentFilter setCaptionedPhotoFilter:]((uint64_t)v5, v6);
    unint64_t v12 = v5;
  }
  return v5;
}

- (id)initAnnotatedItemListFilterWithTraits:(id)a3
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v18.receiver = self;
  v18.super_class = (Class)GEOPDComponentFilter;
  id v5 = [(GEOPDComponentFilter *)&v18 init];
  if (v5)
  {
    objc_super v6 = objc_alloc_init(GEOPDAnnotatedItemListFilter);
    long long v14 = 0u;
    long long v15 = 0u;
    long long v16 = 0u;
    long long v17 = 0u;
    int v7 = objc_msgSend(v4, "photoSizes", 0);
    uint64_t v8 = [v7 countByEnumeratingWithState:&v14 objects:v19 count:16];
    if (v8)
    {
      uint64_t v9 = v8;
      uint64_t v10 = *(void *)v15;
      do
      {
        uint64_t v11 = 0;
        do
        {
          if (*(void *)v15 != v10) {
            objc_enumerationMutation(v7);
          }
          -[GEOPDAnnotatedItemListFilter addPhotoSizeFilter:]((uint64_t)v6, [*(id *)(*((void *)&v14 + 1) + 8 * v11) height] | (unint64_t)(objc_msgSend(*(id *)(*((void *)&v14 + 1) + 8 * v11), "width") << 32), 3);
          ++v11;
        }
        while (v9 != v11);
        uint64_t v9 = [v7 countByEnumeratingWithState:&v14 objects:v19 count:16];
      }
      while (v9);
    }

    -[GEOPDComponentFilter setAnnotatedItemListFilter:]((uint64_t)v5, v6);
    unint64_t v12 = v5;
  }
  return v5;
}

- (void)setAnnotatedItemListFilter:(uint64_t)a1
{
  id v5 = a2;
  if (a1)
  {
    int v4 = *(_DWORD *)(a1 + 772) | 0x10000000;
    *(void *)(a1 + 764) |= 0x100uLL;
    *(_DWORD *)(a1 + 772) = v4;
    objc_storeStrong((id *)(a1 + 80), a2);
  }
}

- (void)setTransitScheduleFilter:(uint64_t)a1
{
  id v4 = a2;
  if (a1)
  {
    *(_DWORD *)(a1 + 772) |= 0x10080000u;
    objc_storeStrong((id *)(a1 + 680), a2);
  }
}

- (void)setReviewFilter:(uint64_t)a1
{
  id v5 = a2;
  if (a1)
  {
    int v4 = *(_DWORD *)(a1 + 772) | 0x10000000;
    *(void *)(a1 + 764) |= 0x8000000000000000;
    *(_DWORD *)(a1 + 772) = v4;
    objc_storeStrong((id *)(a1 + 520), a2);
  }
}

- (void)setCaptionedPhotoFilter:(uint64_t)a1
{
  id v5 = a2;
  if (a1)
  {
    int v4 = *(_DWORD *)(a1 + 772) | 0x10000000;
    *(void *)(a1 + 764) |= 0x4000uLL;
    *(_DWORD *)(a1 + 772) = v4;
    objc_storeStrong((id *)(a1 + 128), a2);
  }
}

- (id)initResultSnippetFilterWithTraits:(id)a3
{
  id v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)GEOPDComponentFilter;
  id v5 = [(GEOPDComponentFilter *)&v13 init];
  if (!v5) {
    goto LABEL_17;
  }
  objc_super v6 = objc_alloc_init(GEOPDResultSnippetFilter);
  if ([v4 hasSupportChildItems])
  {
    char v7 = [v4 supportChildItems];
    if (v6)
    {
      *(unsigned char *)&v6->_flags |= 4u;
      v6->_supportChildItems = v7;
      goto LABEL_6;
    }
  }
  else if (v6)
  {
LABEL_6:
    char v8 = 0;
    if (v6->_supportChildItems)
    {
      *(unsigned char *)&v6->_flags |= 1u;
      v6->_maxChildItems = 6;
    }
    goto LABEL_8;
  }
  char v8 = 1;
LABEL_8:
  if ([v4 supportedChildActionsCount])
  {
    unint64_t v9 = 0;
    do
    {
      if ([v4 supportedChildActionAtIndex:v9] > 8) {
        char v10 = 1;
      }
      else {
        char v10 = v8;
      }
      if ((v10 & 1) == 0) {
        PBRepeatedInt32Add();
      }
      ++v9;
    }
    while (v9 < [v4 supportedChildActionsCount]);
  }
  -[GEOPDComponentFilter setResultSnippetFilter:]((uint64_t)v5, v6);
  uint64_t v11 = v5;

LABEL_17:
  return v5;
}

- (void)setResultSnippetFilter:(uint64_t)a1
{
  id v5 = a2;
  if (a1)
  {
    int v4 = *(_DWORD *)(a1 + 772) | 0x10000000;
    *(void *)(a1 + 764) |= 0x4000000000000000uLL;
    *(_DWORD *)(a1 + 772) = v4;
    objc_storeStrong((id *)(a1 + 512), a2);
  }
}

- (void)setPublisherFilter:(uint64_t)a1
{
  id v5 = a2;
  if (a1)
  {
    int v4 = *(_DWORD *)(a1 + 772) | 0x10000000;
    *(void *)(a1 + 764) |= 0x40000000000000uLL;
    *(_DWORD *)(a1 + 772) = v4;
    objc_storeStrong((id *)(a1 + 448), a2);
  }
}

- (void)setPlaceCollectionFilter:(uint64_t)a1
{
  id v5 = a2;
  if (a1)
  {
    int v4 = *(_DWORD *)(a1 + 772) | 0x10000000;
    *(void *)(a1 + 764) |= 0x100000000000uLL;
    *(_DWORD *)(a1 + 772) = v4;
    objc_storeStrong((id *)(a1 + 368), a2);
  }
}

- (id)initAddressObjectFilterWithLibraryVersion:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)GEOPDComponentFilter;
  id v5 = [(GEOPDComponentFilter *)&v9 init];
  if (v5)
  {
    objc_super v6 = objc_alloc_init(GEOPDAddressObjectFilter);
    -[GEOPDAddressObjectFilter addLibraryVersion:]((uint64_t)v6, v4);
    -[GEOPDComponentFilter setAddressObjectFilter:]((uint64_t)v5, v6);
    char v7 = v5;
  }
  return v5;
}

- (void)setAddressObjectFilter:(uint64_t)a1
{
  id v5 = a2;
  if (a1)
  {
    int v4 = *(_DWORD *)(a1 + 772) | 0x10000000;
    *(void *)(a1 + 764) |= 0x40uLL;
    *(_DWORD *)(a1 + 772) = v4;
    objc_storeStrong((id *)(a1 + 64), a2);
  }
}

- (GEOPDComponentFilter)initWithData:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)GEOPDComponentFilter;
  id v3 = [(GEOPDComponentFilter *)&v7 initWithData:a3];
  int v4 = v3;
  if (v3)
  {
    v3->_readerLock._os_unfair_lock_opaque = 0;
    id v5 = v3;
  }

  return v4;
}

- (void)setEntityFilter:(uint64_t)a1
{
  id v5 = a2;
  if (a1)
  {
    int v4 = *(_DWORD *)(a1 + 772) | 0x10000000;
    *(void *)(a1 + 764) |= 0x400000uLL;
    *(_DWORD *)(a1 + 772) = v4;
    objc_storeStrong((id *)(a1 + 192), a2);
  }
}

- (void)setPhotoFilter:(uint64_t)a1
{
  id v5 = a2;
  if (a1)
  {
    int v4 = *(_DWORD *)(a1 + 772) | 0x10000000;
    *(void *)(a1 + 764) |= 0x80000000000uLL;
    *(_DWORD *)(a1 + 772) = v4;
    objc_storeStrong((id *)(a1 + 360), a2);
  }
}

- (void)_readCaptionedPhotoFilter
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 760));
    if ((*(void *)(a1 + 764) & 0x4000) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOPDComponentFilterReadSpecified(a1, *(char **)(a1 + 8), (int *)&_readCaptionedPhotoFilter_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 760));
  }
}

- (id)captionedPhotoFilter
{
  if (a1)
  {
    v2 = a1;
    -[GEOPDComponentFilter _readCaptionedPhotoFilter]((uint64_t)a1);
    a1 = (id *)v2[16];
    uint64_t v1 = vars8;
  }
  return a1;
}

- (void)setRestaurantReservationLinkFilter:(uint64_t)a1
{
  id v5 = a2;
  if (a1)
  {
    int v4 = *(_DWORD *)(a1 + 772) | 0x10000000;
    *(void *)(a1 + 764) |= 0x2000000000000000uLL;
    *(_DWORD *)(a1 + 772) = v4;
    objc_storeStrong((id *)(a1 + 504), a2);
  }
}

- (void)_readPlaceCollectionFilter
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 760));
    if ((*(void *)(a1 + 764) & 0x100000000000) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOPDComponentFilterReadSpecified(a1, *(char **)(a1 + 8), (int *)&_readPlaceCollectionFilter_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 760));
  }
}

- (id)placeCollectionFilter
{
  if (a1)
  {
    v2 = a1;
    -[GEOPDComponentFilter _readPlaceCollectionFilter]((uint64_t)a1);
    a1 = (id *)v2[46];
    uint64_t v1 = vars8;
  }
  return a1;
}

- (void)setTransitTripStopTimeFilter:(uint64_t)a1
{
  id v4 = a2;
  if (a1)
  {
    *(_DWORD *)(a1 + 772) |= 0x10400000u;
    objc_storeStrong((id *)(a1 + 704), a2);
  }
}

- (void)_readPlaceCollectionItemFilter
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 760));
    if ((*(void *)(a1 + 764) & 0x200000000000) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOPDComponentFilterReadSpecified(a1, *(char **)(a1 + 8), (int *)&_readPlaceCollectionItemFilter_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 760));
  }
}

- (void)setPlaceCollectionItemFilter:(uint64_t)a1
{
  id v5 = a2;
  if (a1)
  {
    int v4 = *(_DWORD *)(a1 + 772) | 0x10000000;
    *(void *)(a1 + 764) |= 0x200000000000uLL;
    *(_DWORD *)(a1 + 772) = v4;
    objc_storeStrong((id *)(a1 + 376), a2);
  }
}

- (void)_readToolTipFilter
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 760));
    if ((*(_DWORD *)(a1 + 772) & 0x800) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOPDComponentFilterReadSpecified(a1, *(char **)(a1 + 8), (int *)&_readToolTipFilter_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 760));
  }
}

- (id)toolTipFilter
{
  if (a1)
  {
    v2 = a1;
    -[GEOPDComponentFilter _readToolTipFilter]((uint64_t)a1);
    a1 = (id *)v2[77];
    uint64_t v1 = vars8;
  }
  return a1;
}

- (void)setToolTipFilter:(uint64_t)a1
{
  id v4 = a2;
  if (a1)
  {
    *(_DWORD *)(a1 + 772) |= 0x10000800u;
    objc_storeStrong((id *)(a1 + 616), a2);
  }
}

- (id)description
{
  id v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)GEOPDComponentFilter;
  id v4 = [(GEOPDComponentFilter *)&v8 description];
  id v5 = [(GEOPDComponentFilter *)self dictionaryRepresentation];
  objc_super v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEOPDComponentFilter _dictionaryRepresentation:]((uint64_t)self, 0);
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  if (a1)
  {
    -[GEOPDComponentFilter readAll:](a1, 1);
    id v4 = [MEMORY[0x1E4F1CA60] dictionary];
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 760));
    if ((*(void *)(a1 + 764) & 0x400000) == 0)
    {
      id v5 = *(void **)(a1 + 8);
      if (v5)
      {
        id v6 = v5;
        objc_sync_enter(v6);
        GEOPDComponentFilterReadSpecified(a1, *(char **)(a1 + 8), (int *)&_readEntityFilter_tags);
        objc_sync_exit(v6);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 760));
    id v7 = *(id *)(a1 + 192);
    objc_super v8 = v7;
    if (v7)
    {
      if (a2)
      {
        objc_super v9 = [v7 jsonRepresentation];
        char v10 = @"entityFilter";
      }
      else
      {
        objc_super v9 = [v7 dictionaryRepresentation];
        char v10 = @"entity_filter";
      }
      id v11 = v9;

      [v4 setObject:v11 forKey:v10];
    }

    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 760));
    if ((*(void *)(a1 + 764) & 0x400000000000) == 0)
    {
      unint64_t v12 = *(void **)(a1 + 8);
      if (v12)
      {
        id v13 = v12;
        objc_sync_enter(v13);
        GEOPDComponentFilterReadSpecified(a1, *(char **)(a1 + 8), (int *)&_readPlaceInfoFilter_tags);
        objc_sync_exit(v13);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 760));
    id v14 = *(id *)(a1 + 384);
    long long v15 = v14;
    if (v14)
    {
      if (a2)
      {
        long long v16 = [v14 jsonRepresentation];
        long long v17 = @"placeInfoFilter";
      }
      else
      {
        long long v16 = [v14 dictionaryRepresentation];
        long long v17 = @"place_info_filter";
      }
      id v18 = v16;

      [v4 setObject:v18 forKey:v17];
    }

    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 760));
    if ((*(void *)(a1 + 764) & 4) == 0)
    {
      double v19 = *(void **)(a1 + 8);
      if (v19)
      {
        id v20 = v19;
        objc_sync_enter(v20);
        GEOPDComponentFilterReadSpecified(a1, *(char **)(a1 + 8), (int *)&_readAccessInfoFilter_tags);
        objc_sync_exit(v20);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 760));
    id v21 = *(id *)(a1 + 32);
    objc_super v22 = v21;
    if (v21)
    {
      if (a2)
      {
        unint64_t v23 = [v21 jsonRepresentation];
        unint64_t v24 = @"accessInfoFilter";
      }
      else
      {
        unint64_t v23 = [v21 dictionaryRepresentation];
        unint64_t v24 = @"access_info_filter";
      }
      id v25 = v23;

      [v4 setObject:v25 forKey:v24];
    }

    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 760));
    if ((*(void *)(a1 + 764) & 0x400) == 0)
    {
      unint64_t v26 = *(void **)(a1 + 8);
      if (v26)
      {
        id v27 = v26;
        objc_sync_enter(v27);
        GEOPDComponentFilterReadSpecified(a1, *(char **)(a1 + 8), (int *)&_readBoundsFilter_tags);
        objc_sync_exit(v27);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 760));
    id v28 = *(id *)(a1 + 96);
    unint64_t v29 = v28;
    if (v28)
    {
      if (a2)
      {
        unint64_t v30 = [v28 jsonRepresentation];
        unint64_t v31 = @"boundsFilter";
      }
      else
      {
        unint64_t v30 = [v28 dictionaryRepresentation];
        unint64_t v31 = @"bounds_filter";
      }
      id v32 = v30;

      [v4 setObject:v32 forKey:v31];
    }

    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 760));
    if ((*(void *)(a1 + 764) & 0x20) == 0)
    {
      unint64_t v33 = *(void **)(a1 + 8);
      if (v33)
      {
        id v34 = v33;
        objc_sync_enter(v34);
        GEOPDComponentFilterReadSpecified(a1, *(char **)(a1 + 8), (int *)&_readAddressFilter_tags);
        objc_sync_exit(v34);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 760));
    id v35 = *(id *)(a1 + 56);
    unint64_t v36 = v35;
    if (v35)
    {
      if (a2)
      {
        unint64_t v37 = [v35 jsonRepresentation];
        unint64_t v38 = @"addressFilter";
      }
      else
      {
        unint64_t v37 = [v35 dictionaryRepresentation];
        unint64_t v38 = @"address_filter";
      }
      id v39 = v37;

      [v4 setObject:v39 forKey:v38];
    }

    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 760));
    if ((*(void *)(a1 + 764) & 0x200000000000000) == 0)
    {
      unint64_t v40 = *(void **)(a1 + 8);
      if (v40)
      {
        id v41 = v40;
        objc_sync_enter(v41);
        GEOPDComponentFilterReadSpecified(a1, *(char **)(a1 + 8), (int *)&_readRatingFilter_tags);
        objc_sync_exit(v41);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 760));
    id v42 = *(id *)(a1 + 472);
    unint64_t v43 = v42;
    if (v42)
    {
      if (a2)
      {
        unint64_t v44 = [v42 jsonRepresentation];
        unint64_t v45 = @"ratingFilter";
      }
      else
      {
        unint64_t v44 = [v42 dictionaryRepresentation];
        unint64_t v45 = @"rating_filter";
      }
      id v46 = v44;

      [v4 setObject:v46 forKey:v45];
    }

    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 760));
    if ((*(void *)(a1 + 764) & 0x8000000000000000) == 0)
    {
      unint64_t v47 = *(void **)(a1 + 8);
      if (v47)
      {
        id v48 = v47;
        objc_sync_enter(v48);
        GEOPDComponentFilterReadSpecified(a1, *(char **)(a1 + 8), (int *)&_readReviewFilter_tags);
        objc_sync_exit(v48);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 760));
    id v49 = *(id *)(a1 + 520);
    unint64_t v50 = v49;
    if (v49)
    {
      if (a2)
      {
        unint64_t v51 = [v49 jsonRepresentation];
        unint64_t v52 = @"reviewFilter";
      }
      else
      {
        unint64_t v51 = [v49 dictionaryRepresentation];
        unint64_t v52 = @"review_filter";
      }
      id v53 = v51;

      [v4 setObject:v53 forKey:v52];
    }

    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 760));
    if ((*(void *)(a1 + 764) & 0x80000000000) == 0)
    {
      unint64_t v54 = *(void **)(a1 + 8);
      if (v54)
      {
        id v55 = v54;
        objc_sync_enter(v55);
        GEOPDComponentFilterReadSpecified(a1, *(char **)(a1 + 8), (int *)&_readPhotoFilter_tags);
        objc_sync_exit(v55);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 760));
    id v56 = *(id *)(a1 + 360);
    unint64_t v57 = v56;
    if (v56)
    {
      if (a2)
      {
        unint64_t v58 = [v56 jsonRepresentation];
        unint64_t v59 = @"photoFilter";
      }
      else
      {
        unint64_t v58 = [v56 dictionaryRepresentation];
        unint64_t v59 = @"photo_filter";
      }
      id v60 = v58;

      [v4 setObject:v60 forKey:v59];
    }

    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 760));
    if ((*(void *)(a1 + 764) & 0x800000000) == 0)
    {
      unint64_t v61 = *(void **)(a1 + 8);
      if (v61)
      {
        id v62 = v61;
        objc_sync_enter(v62);
        GEOPDComponentFilterReadSpecified(a1, *(char **)(a1 + 8), (int *)&_readHoursFilter_tags);
        objc_sync_exit(v62);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 760));
    id v63 = *(id *)(a1 + 296);
    unint64_t v64 = v63;
    if (v63)
    {
      if (a2)
      {
        unint64_t v65 = [v63 jsonRepresentation];
        unint64_t v66 = @"hoursFilter";
      }
      else
      {
        unint64_t v65 = [v63 dictionaryRepresentation];
        unint64_t v66 = @"hours_filter";
      }
      id v67 = v65;

      [v4 setObject:v67 forKey:v66];
    }

    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 760));
    if ((*(_DWORD *)(a1 + 772) & 0x10000) == 0)
    {
      unint64_t v68 = *(void **)(a1 + 8);
      if (v68)
      {
        id v69 = v68;
        objc_sync_enter(v69);
        GEOPDComponentFilterReadSpecified(a1, *(char **)(a1 + 8), (int *)&_readTransitInfoFilter_tags);
        objc_sync_exit(v69);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 760));
    id v70 = *(id *)(a1 + 656);
    unint64_t v71 = v70;
    if (v70)
    {
      if (a2)
      {
        unint64_t v72 = [v70 jsonRepresentation];
        unint64_t v73 = @"transitInfoFilter";
      }
      else
      {
        unint64_t v72 = [v70 dictionaryRepresentation];
        unint64_t v73 = @"transit_info_filter";
      }
      id v74 = v72;

      [v4 setObject:v74 forKey:v73];
    }

    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 760));
    if ((*(_DWORD *)(a1 + 772) & 0x80000) == 0)
    {
      unint64_t v75 = *(void **)(a1 + 8);
      if (v75)
      {
        id v76 = v75;
        objc_sync_enter(v76);
        GEOPDComponentFilterReadSpecified(a1, *(char **)(a1 + 8), (int *)&_readTransitScheduleFilter_tags);
        objc_sync_exit(v76);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 760));
    id v77 = *(id *)(a1 + 680);
    unint64_t v78 = v77;
    if (v77)
    {
      if (a2)
      {
        unint64_t v79 = [v77 jsonRepresentation];
        unint64_t v80 = @"transitScheduleFilter";
      }
      else
      {
        unint64_t v79 = [v77 dictionaryRepresentation];
        unint64_t v80 = @"transit_schedule_filter";
      }
      id v81 = v79;

      [v4 setObject:v81 forKey:v80];
    }

    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 760));
    if ((*(void *)(a1 + 764) & 0x800000) == 0)
    {
      unint64_t v82 = *(void **)(a1 + 8);
      if (v82)
      {
        id v83 = v82;
        objc_sync_enter(v83);
        GEOPDComponentFilterReadSpecified(a1, *(char **)(a1 + 8), (int *)&_readEtaFilter_tags_0);
        objc_sync_exit(v83);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 760));
    id v84 = *(id *)(a1 + 200);
    unint64_t v85 = v84;
    if (v84)
    {
      if (a2)
      {
        unint64_t v86 = [v84 jsonRepresentation];
        unint64_t v87 = @"etaFilter";
      }
      else
      {
        unint64_t v86 = [v84 dictionaryRepresentation];
        unint64_t v87 = @"eta_filter";
      }
      id v88 = v86;

      [v4 setObject:v88 forKey:v87];
    }

    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 760));
    if ((*(void *)(a1 + 764) & 0x10000000) == 0)
    {
      unint64_t v89 = *(void **)(a1 + 8);
      if (v89)
      {
        id v90 = v89;
        objc_sync_enter(v90);
        GEOPDComponentFilterReadSpecified(a1, *(char **)(a1 + 8), (int *)&_readFlyoverFilter_tags);
        objc_sync_exit(v90);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 760));
    id v91 = *(id *)(a1 + 240);
    unint64_t v92 = v91;
    if (v91)
    {
      if (a2)
      {
        v93 = [v91 jsonRepresentation];
        v94 = @"flyoverFilter";
      }
      else
      {
        v93 = [v91 dictionaryRepresentation];
        v94 = @"flyover_filter";
      }
      id v95 = v93;

      [v4 setObject:v95 forKey:v94];
    }

    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 760));
    if ((*(void *)(a1 + 764) & 0x400000000000000) == 0)
    {
      v96 = *(void **)(a1 + 8);
      if (v96)
      {
        id v97 = v96;
        objc_sync_enter(v97);
        GEOPDComponentFilterReadSpecified(a1, *(char **)(a1 + 8), (int *)&_readRawAttributeFilter_tags);
        objc_sync_exit(v97);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 760));
    id v98 = *(id *)(a1 + 480);
    v99 = v98;
    if (v98)
    {
      if (a2)
      {
        v100 = [v98 jsonRepresentation];
        v101 = @"rawAttributeFilter";
      }
      else
      {
        v100 = [v98 dictionaryRepresentation];
        v101 = @"raw_attribute_filter";
      }
      id v102 = v100;

      [v4 setObject:v102 forKey:v101];
    }

    v103 = -[GEOPDComponentFilter amenitiesFilter]((id *)a1);
    v104 = v103;
    if (v103)
    {
      if (a2)
      {
        v105 = [v103 jsonRepresentation];
        v106 = @"amenitiesFilter";
      }
      else
      {
        v105 = [v103 dictionaryRepresentation];
        v106 = @"amenities_filter";
      }
      id v107 = v105;

      [v4 setObject:v107 forKey:v106];
    }

    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 760));
    if ((*(_DWORD *)(a1 + 772) & 0x40) == 0)
    {
      v108 = *(void **)(a1 + 8);
      if (v108)
      {
        id v109 = v108;
        objc_sync_enter(v109);
        GEOPDComponentFilterReadSpecified(a1, *(char **)(a1 + 8), (int *)&_readStyleAttributesFilter_tags);
        objc_sync_exit(v109);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 760));
    id v110 = *(id *)(a1 + 576);
    v111 = v110;
    if (v110)
    {
      if (a2)
      {
        v112 = [v110 jsonRepresentation];
        v113 = @"styleAttributesFilter";
      }
      else
      {
        v112 = [v110 dictionaryRepresentation];
        v113 = @"style_attributes_filter";
      }
      id v114 = v112;

      [v4 setObject:v114 forKey:v113];
    }

    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 760));
    if ((*(_DWORD *)(a1 + 772) & 0x8000) == 0)
    {
      v115 = *(void **)(a1 + 8);
      if (v115)
      {
        id v116 = v115;
        objc_sync_enter(v116);
        GEOPDComponentFilterReadSpecified(a1, *(char **)(a1 + 8), (int *)&_readTransitIncidentFilter_tags);
        objc_sync_exit(v116);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 760));
    id v117 = *(id *)(a1 + 648);
    v118 = v117;
    if (v117)
    {
      if (a2)
      {
        v119 = [v117 jsonRepresentation];
        v120 = @"transitIncidentFilter";
      }
      else
      {
        v119 = [v117 dictionaryRepresentation];
        v120 = @"transit_incident_filter";
      }
      id v121 = v119;

      [v4 setObject:v121 forKey:v120];
    }

    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 760));
    if ((*(_DWORD *)(a1 + 772) & 0x2000) == 0)
    {
      v122 = *(void **)(a1 + 8);
      if (v122)
      {
        id v123 = v122;
        objc_sync_enter(v123);
        GEOPDComponentFilterReadSpecified(a1, *(char **)(a1 + 8), (int *)&_readTransitAssociatedInfoFilter_tags);
        objc_sync_exit(v123);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 760));
    id v124 = *(id *)(a1 + 632);
    v125 = v124;
    if (v124)
    {
      if (a2)
      {
        v126 = [v124 jsonRepresentation];
        v127 = @"transitAssociatedInfoFilter";
      }
      else
      {
        v126 = [v124 dictionaryRepresentation];
        v127 = @"transit_associated_info_filter";
      }
      id v128 = v126;

      [v4 setObject:v128 forKey:v127];
    }

    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 760));
    if ((*(_DWORD *)(a1 + 772) & 0x200) == 0)
    {
      v129 = *(void **)(a1 + 8);
      if (v129)
      {
        id v130 = v129;
        objc_sync_enter(v130);
        GEOPDComponentFilterReadSpecified(a1, *(char **)(a1 + 8), (int *)&_readTextBlockFilter_tags);
        objc_sync_exit(v130);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 760));
    id v131 = *(id *)(a1 + 600);
    v132 = v131;
    if (v131)
    {
      if (a2)
      {
        v133 = [v131 jsonRepresentation];
        v134 = @"textBlockFilter";
      }
      else
      {
        v133 = [v131 dictionaryRepresentation];
        v134 = @"text_block_filter";
      }
      id v135 = v133;

      [v4 setObject:v135 forKey:v134];
    }

    v136 = -[GEOPDComponentFilter factoidFilter]((id *)a1);
    v137 = v136;
    if (v136)
    {
      if (a2)
      {
        v138 = [v136 jsonRepresentation];
        v139 = @"factoidFilter";
      }
      else
      {
        v138 = [v136 dictionaryRepresentation];
        v139 = @"factoid_filter";
      }
      id v140 = v138;

      [v4 setObject:v140 forKey:v139];
    }

    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 760));
    if ((*(_DWORD *)(a1 + 772) & 0x4000) == 0)
    {
      v141 = *(void **)(a1 + 8);
      if (v141)
      {
        id v142 = v141;
        objc_sync_enter(v142);
        GEOPDComponentFilterReadSpecified(a1, *(char **)(a1 + 8), (int *)&_readTransitAttributionFilter_tags);
        objc_sync_exit(v142);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 760));
    id v143 = *(id *)(a1 + 640);
    v144 = v143;
    if (v143)
    {
      if (a2)
      {
        v145 = [v143 jsonRepresentation];
        v146 = @"transitAttributionFilter";
      }
      else
      {
        v145 = [v143 dictionaryRepresentation];
        v146 = @"transit_attribution_filter";
      }
      id v147 = v145;

      [v4 setObject:v147 forKey:v146];
    }

    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 760));
    if ((*(void *)(a1 + 764) & 0x1000) == 0)
    {
      v148 = *(void **)(a1 + 8);
      if (v148)
      {
        id v149 = v148;
        objc_sync_enter(v149);
        GEOPDComponentFilterReadSpecified(a1, *(char **)(a1 + 8), (int *)&_readBusinessClaimFilter_tags);
        objc_sync_exit(v149);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 760));
    id v150 = *(id *)(a1 + 112);
    v151 = v150;
    if (v150)
    {
      if (a2)
      {
        v152 = [v150 jsonRepresentation];
        v153 = @"businessClaimFilter";
      }
      else
      {
        v152 = [v150 dictionaryRepresentation];
        v153 = @"business_claim_filter";
      }
      id v154 = v152;

      [v4 setObject:v154 forKey:v153];
    }

    v155 = -[GEOPDComponentFilter captionedPhotoFilter]((id *)a1);
    v156 = v155;
    if (v155)
    {
      if (a2)
      {
        v157 = [v155 jsonRepresentation];
        v158 = @"captionedPhotoFilter";
      }
      else
      {
        v157 = [v155 dictionaryRepresentation];
        v158 = @"captioned_photo_filter";
      }
      id v159 = v157;

      [v4 setObject:v159 forKey:v158];
    }

    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 760));
    if ((*(_DWORD *)(a1 + 772) & 0x20000) == 0)
    {
      v160 = *(void **)(a1 + 8);
      if (v160)
      {
        id v161 = v160;
        objc_sync_enter(v161);
        GEOPDComponentFilterReadSpecified(a1, *(char **)(a1 + 8), (int *)&_readTransitInfoSnippetFilter_tags);
        objc_sync_exit(v161);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 760));
    id v162 = *(id *)(a1 + 664);
    v163 = v162;
    if (v162)
    {
      if (a2)
      {
        v164 = [v162 jsonRepresentation];
        v165 = @"transitInfoSnippetFilter";
      }
      else
      {
        v164 = [v162 dictionaryRepresentation];
        v165 = @"transit_info_snippet_filter";
      }
      id v166 = v164;

      [v4 setObject:v166 forKey:v165];
    }

    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 760));
    if ((*(void *)(a1 + 764) & 0x4000000) == 0)
    {
      v167 = *(void **)(a1 + 8);
      if (v167)
      {
        id v168 = v167;
        objc_sync_enter(v168);
        GEOPDComponentFilterReadSpecified(a1, *(char **)(a1 + 8), (int *)&_readExternalActionFilter_tags);
        objc_sync_exit(v168);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 760));
    id v169 = *(id *)(a1 + 224);
    v170 = v169;
    if (v169)
    {
      if (a2)
      {
        v171 = [v169 jsonRepresentation];
        v172 = @"externalActionFilter";
      }
      else
      {
        v171 = [v169 dictionaryRepresentation];
        v172 = @"external_action_filter";
      }
      id v173 = v171;

      [v4 setObject:v173 forKey:v172];
    }

    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 760));
    if ((*(void *)(a1 + 764) & 0x4000000000000000) == 0)
    {
      v174 = *(void **)(a1 + 8);
      if (v174)
      {
        id v175 = v174;
        objc_sync_enter(v175);
        GEOPDComponentFilterReadSpecified(a1, *(char **)(a1 + 8), (int *)&_readResultSnippetFilter_tags);
        objc_sync_exit(v175);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 760));
    id v176 = *(id *)(a1 + 512);
    v177 = v176;
    if (v176)
    {
      if (a2)
      {
        v178 = [v176 jsonRepresentation];
        v179 = @"resultSnippetFilter";
      }
      else
      {
        v178 = [v176 dictionaryRepresentation];
        v179 = @"result_snippet_filter";
      }
      id v180 = v178;

      [v4 setObject:v180 forKey:v179];
    }

    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 760));
    if ((*(void *)(a1 + 764) & 0x40) == 0)
    {
      v181 = *(void **)(a1 + 8);
      if (v181)
      {
        id v182 = v181;
        objc_sync_enter(v182);
        GEOPDComponentFilterReadSpecified(a1, *(char **)(a1 + 8), (int *)&_readAddressObjectFilter_tags);
        objc_sync_exit(v182);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 760));
    id v183 = *(id *)(a1 + 64);
    v184 = v183;
    if (v183)
    {
      if (a2)
      {
        v185 = [v183 jsonRepresentation];
        v186 = @"addressObjectFilter";
      }
      else
      {
        v185 = [v183 dictionaryRepresentation];
        v186 = @"address_object_filter";
      }
      id v187 = v185;

      [v4 setObject:v187 forKey:v186];
    }

    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 760));
    if ((*(_DWORD *)(a1 + 772) & 2) == 0)
    {
      v188 = *(void **)(a1 + 8);
      if (v188)
      {
        id v189 = v188;
        objc_sync_enter(v189);
        GEOPDComponentFilterReadSpecified(a1, *(char **)(a1 + 8), (int *)&_readSimpleRestaurantMenuTextFilter_tags);
        objc_sync_exit(v189);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 760));
    id v190 = *(id *)(a1 + 536);
    v191 = v190;
    if (v190)
    {
      if (a2)
      {
        v192 = [v190 jsonRepresentation];
        v193 = @"simpleRestaurantMenuTextFilter";
      }
      else
      {
        v192 = [v190 dictionaryRepresentation];
        v193 = @"simple_restaurant_menu_text_filter";
      }
      id v194 = v192;

      [v4 setObject:v194 forKey:v193];
    }

    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 760));
    if ((*(void *)(a1 + 764) & 0x2000000000000000) == 0)
    {
      v195 = *(void **)(a1 + 8);
      if (v195)
      {
        id v196 = v195;
        objc_sync_enter(v196);
        GEOPDComponentFilterReadSpecified(a1, *(char **)(a1 + 8), (int *)&_readRestaurantReservationLinkFilter_tags);
        objc_sync_exit(v196);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 760));
    id v197 = *(id *)(a1 + 504);
    v198 = v197;
    if (v197)
    {
      if (a2)
      {
        v199 = [v197 jsonRepresentation];
        v200 = @"restaurantReservationLinkFilter";
      }
      else
      {
        v199 = [v197 dictionaryRepresentation];
        v200 = @"restaurant_reservation_link_filter";
      }
      id v201 = v199;

      [v4 setObject:v201 forKey:v200];
    }

    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 760));
    if ((*(_DWORD *)(a1 + 772) & 4) == 0)
    {
      v202 = *(void **)(a1 + 8);
      if (v202)
      {
        id v203 = v202;
        objc_sync_enter(v203);
        GEOPDComponentFilterReadSpecified(a1, *(char **)(a1 + 8), (int *)&_readSpatialLookupFilter_tags);
        objc_sync_exit(v203);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 760));
    id v204 = *(id *)(a1 + 544);
    v205 = v204;
    if (v204)
    {
      if (a2)
      {
        v206 = [v204 jsonRepresentation];
        v207 = @"spatialLookupFilter";
      }
      else
      {
        v206 = [v204 dictionaryRepresentation];
        v207 = @"spatial_lookup_filter";
      }
      id v208 = v206;

      [v4 setObject:v208 forKey:v207];
    }

    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 760));
    if ((*(_DWORD *)(a1 + 772) & 0x400) == 0)
    {
      v209 = *(void **)(a1 + 8);
      if (v209)
      {
        id v210 = v209;
        objc_sync_enter(v210);
        GEOPDComponentFilterReadSpecified(a1, *(char **)(a1 + 8), (int *)&_readTipFilter_tags);
        objc_sync_exit(v210);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 760));
    id v211 = *(id *)(a1 + 608);
    v212 = v211;
    if (v211)
    {
      if (a2)
      {
        v213 = [v211 jsonRepresentation];
        v214 = @"tipFilter";
      }
      else
      {
        v213 = [v211 dictionaryRepresentation];
        v214 = @"tip_filter";
      }
      id v215 = v213;

      [v4 setObject:v215 forKey:v214];
    }

    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 760));
    if ((*(void *)(a1 + 764) & 0x2000000000000) == 0)
    {
      v216 = *(void **)(a1 + 8);
      if (v216)
      {
        id v217 = v216;
        objc_sync_enter(v217);
        GEOPDComponentFilterReadSpecified(a1, *(char **)(a1 + 8), (int *)&_readPlacecardUrlFilter_tags);
        objc_sync_exit(v217);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 760));
    id v218 = *(id *)(a1 + 408);
    v219 = v218;
    if (v218)
    {
      if (a2)
      {
        v220 = [v218 jsonRepresentation];
        v221 = @"placecardUrlFilter";
      }
      else
      {
        v220 = [v218 dictionaryRepresentation];
        v221 = @"placecard_url_filter";
      }
      id v222 = v220;

      [v4 setObject:v222 forKey:v221];
    }

    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 760));
    if ((*(void *)(a1 + 764) & 0x200) == 0)
    {
      v223 = *(void **)(a1 + 8);
      if (v223)
      {
        id v224 = v223;
        objc_sync_enter(v224);
        GEOPDComponentFilterReadSpecified(a1, *(char **)(a1 + 8), (int *)&_readAssociatedAppFilter_tags);
        objc_sync_exit(v224);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 760));
    id v225 = *(id *)(a1 + 88);
    v226 = v225;
    if (v225)
    {
      if (a2)
      {
        v227 = [v225 jsonRepresentation];
        v228 = @"associatedAppFilter";
      }
      else
      {
        v227 = [v225 dictionaryRepresentation];
        v228 = @"associated_app_filter";
      }
      id v229 = v227;

      [v4 setObject:v229 forKey:v228];
    }

    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 760));
    if ((*(void *)(a1 + 764) & 0x20000000000) == 0)
    {
      v230 = *(void **)(a1 + 8);
      if (v230)
      {
        id v231 = v230;
        objc_sync_enter(v231);
        GEOPDComponentFilterReadSpecified(a1, *(char **)(a1 + 8), (int *)&_readMessageLinkFilter_tags);
        objc_sync_exit(v231);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 760));
    id v232 = *(id *)(a1 + 344);
    v233 = v232;
    if (v232)
    {
      if (a2)
      {
        v234 = [v232 jsonRepresentation];
        v235 = @"messageLinkFilter";
      }
      else
      {
        v234 = [v232 dictionaryRepresentation];
        v235 = @"message_link_filter";
      }
      id v236 = v234;

      [v4 setObject:v236 forKey:v235];
    }

    v237 = -[GEOPDComponentFilter quickLinkFilter]((id *)a1);
    v238 = v237;
    if (v237)
    {
      if (a2)
      {
        v239 = [v237 jsonRepresentation];
        v240 = @"quickLinkFilter";
      }
      else
      {
        v239 = [v237 dictionaryRepresentation];
        v240 = @"quick_link_filter";
      }
      id v241 = v239;

      [v4 setObject:v241 forKey:v240];
    }

    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 760));
    if ((*(void *)(a1 + 764) & 0x100000000000000) == 0)
    {
      v242 = *(void **)(a1 + 8);
      if (v242)
      {
        id v243 = v242;
        objc_sync_enter(v243);
        GEOPDComponentFilterReadSpecified(a1, *(char **)(a1 + 8), (int *)&_readRapFilter_tags);
        objc_sync_exit(v243);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 760));
    id v244 = *(id *)(a1 + 464);
    v245 = v244;
    if (v244)
    {
      if (a2)
      {
        v246 = [v244 jsonRepresentation];
        v247 = @"rapFilter";
      }
      else
      {
        v246 = [v244 dictionaryRepresentation];
        v247 = @"rap_filter";
      }
      id v248 = v246;

      [v4 setObject:v248 forKey:v247];
    }

    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 760));
    if ((*(void *)(a1 + 764) & 0x40000000000) == 0)
    {
      v249 = *(void **)(a1 + 8);
      if (v249)
      {
        id v250 = v249;
        objc_sync_enter(v250);
        GEOPDComponentFilterReadSpecified(a1, *(char **)(a1 + 8), (int *)&_readOfflineAreaFilter_tags);
        objc_sync_exit(v250);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 760));
    id v251 = *(id *)(a1 + 352);
    v252 = v251;
    if (v251)
    {
      if (a2)
      {
        v253 = [v251 jsonRepresentation];
        v254 = @"offlineAreaFilter";
      }
      else
      {
        v253 = [v251 dictionaryRepresentation];
        v254 = @"offline_area_filter";
      }
      id v255 = v253;

      [v4 setObject:v255 forKey:v254];
    }

    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 760));
    if ((*(void *)(a1 + 764) & 0x10000000000) == 0)
    {
      v256 = *(void **)(a1 + 8);
      if (v256)
      {
        id v257 = v256;
        objc_sync_enter(v257);
        GEOPDComponentFilterReadSpecified(a1, *(char **)(a1 + 8), (int *)&_readLocationEventFilter_tags);
        objc_sync_exit(v257);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 760));
    id v258 = *(id *)(a1 + 336);
    v259 = v258;
    if (v258)
    {
      if (a2)
      {
        v260 = [v258 jsonRepresentation];
        v261 = @"locationEventFilter";
      }
      else
      {
        v260 = [v258 dictionaryRepresentation];
        v261 = @"location_event_filter";
      }
      id v262 = v260;

      [v4 setObject:v262 forKey:v261];
    }

    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 760));
    if ((*(_DWORD *)(a1 + 772) & 0x80) == 0)
    {
      v263 = *(void **)(a1 + 8);
      if (v263)
      {
        id v264 = v263;
        objc_sync_enter(v264);
        GEOPDComponentFilterReadSpecified(a1, *(char **)(a1 + 8), (int *)&_readSupportsOfflineMapsFilter_tags);
        objc_sync_exit(v264);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 760));
    id v265 = *(id *)(a1 + 584);
    v266 = v265;
    if (v265)
    {
      if (a2)
      {
        v267 = [v265 jsonRepresentation];
        v268 = @"supportsOfflineMapsFilter";
      }
      else
      {
        v267 = [v265 dictionaryRepresentation];
        v268 = @"supports_offline_maps_filter";
      }
      id v269 = v267;

      [v4 setObject:v269 forKey:v268];
    }

    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 760));
    if ((*(_DWORD *)(a1 + 772) & 0x2000000) == 0)
    {
      v270 = *(void **)(a1 + 8);
      if (v270)
      {
        id v271 = v270;
        objc_sync_enter(v271);
        GEOPDComponentFilterReadSpecified(a1, *(char **)(a1 + 8), (int *)&_readVenueInfoFilter_tags);
        objc_sync_exit(v271);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 760));
    id v272 = *(id *)(a1 + 728);
    v273 = v272;
    if (v272)
    {
      if (a2)
      {
        v274 = [v272 jsonRepresentation];
        v275 = @"venueInfoFilter";
      }
      else
      {
        v274 = [v272 dictionaryRepresentation];
        v275 = @"venue_info_filter";
      }
      id v276 = v274;

      [v4 setObject:v276 forKey:v275];
    }

    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 760));
    if ((*(void *)(a1 + 764) & 0x20000) == 0)
    {
      v277 = *(void **)(a1 + 8);
      if (v277)
      {
        id v278 = v277;
        objc_sync_enter(v278);
        GEOPDComponentFilterReadSpecified(a1, *(char **)(a1 + 8), (int *)&_readContainedPlaceFilter_tags);
        objc_sync_exit(v278);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 760));
    id v279 = *(id *)(a1 + 152);
    v280 = v279;
    if (v279)
    {
      if (a2)
      {
        v281 = [v279 jsonRepresentation];
        v282 = @"containedPlaceFilter";
      }
      else
      {
        v281 = [v279 dictionaryRepresentation];
        v282 = @"contained_place_filter";
      }
      id v283 = v281;

      [v4 setObject:v283 forKey:v282];
    }

    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 760));
    if ((*(_DWORD *)(a1 + 772) & 0x8000000) == 0)
    {
      v284 = *(void **)(a1 + 8);
      if (v284)
      {
        id v285 = v284;
        objc_sync_enter(v285);
        GEOPDComponentFilterReadSpecified(a1, *(char **)(a1 + 8), (int *)&_readWifiFingerprintFilter_tags);
        objc_sync_exit(v285);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 760));
    id v286 = *(id *)(a1 + 744);
    v287 = v286;
    if (v286)
    {
      if (a2)
      {
        v288 = [v286 jsonRepresentation];
        v289 = @"wifiFingerprintFilter";
      }
      else
      {
        v288 = [v286 dictionaryRepresentation];
        v289 = @"wifi_fingerprint_filter";
      }
      id v290 = v288;

      [v4 setObject:v290 forKey:v289];
    }

    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 760));
    if ((*(void *)(a1 + 764) & 0x1000000000) == 0)
    {
      v291 = *(void **)(a1 + 8);
      if (v291)
      {
        id v292 = v291;
        objc_sync_enter(v292);
        GEOPDComponentFilterReadSpecified(a1, *(char **)(a1 + 8), (int *)&_readIconFilter_tags);
        objc_sync_exit(v292);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 760));
    id v293 = *(id *)(a1 + 304);
    v294 = v293;
    if (v293)
    {
      if (a2)
      {
        v295 = [v293 jsonRepresentation];
        v296 = @"iconFilter";
      }
      else
      {
        v295 = [v293 dictionaryRepresentation];
        v296 = @"icon_filter";
      }
      id v297 = v295;

      [v4 setObject:v297 forKey:v296];
    }

    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 760));
    if ((*(void *)(a1 + 764) & 0x10000000000000) == 0)
    {
      v298 = *(void **)(a1 + 8);
      if (v298)
      {
        id v299 = v298;
        objc_sync_enter(v299);
        GEOPDComponentFilterReadSpecified(a1, *(char **)(a1 + 8), (int *)&_readPriceDescriptionFilter_tags);
        objc_sync_exit(v299);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 760));
    id v300 = *(id *)(a1 + 432);
    v301 = v300;
    if (v300)
    {
      if (a2)
      {
        v302 = [v300 jsonRepresentation];
        v303 = @"priceDescriptionFilter";
      }
      else
      {
        v302 = [v300 dictionaryRepresentation];
        v303 = @"price_description_filter";
      }
      id v304 = v302;

      [v4 setObject:v304 forKey:v303];
    }

    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 760));
    if ((*(void *)(a1 + 764) & 0x800) == 0)
    {
      v305 = *(void **)(a1 + 8);
      if (v305)
      {
        id v306 = v305;
        objc_sync_enter(v306);
        GEOPDComponentFilterReadSpecified(a1, *(char **)(a1 + 8), (int *)&_readBrowseCategoriesFilter_tags);
        objc_sync_exit(v306);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 760));
    id v307 = *(id *)(a1 + 104);
    v308 = v307;
    if (v307)
    {
      if (a2)
      {
        v309 = [v307 jsonRepresentation];
        v310 = @"browseCategoriesFilter";
      }
      else
      {
        v309 = [v307 dictionaryRepresentation];
        v310 = @"browse_categories_filter";
      }
      id v311 = v309;

      [v4 setObject:v311 forKey:v310];
    }

    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 760));
    if ((*(_DWORD *)(a1 + 772) & 0x10) == 0)
    {
      v312 = *(void **)(a1 + 8);
      if (v312)
      {
        id v313 = v312;
        objc_sync_enter(v313);
        GEOPDComponentFilterReadSpecified(a1, *(char **)(a1 + 8), (int *)&_readStorefrontFilter_tags);
        objc_sync_exit(v313);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 760));
    id v314 = *(id *)(a1 + 560);
    v315 = v314;
    if (v314)
    {
      if (a2)
      {
        v316 = [v314 jsonRepresentation];
        v317 = @"storefrontFilter";
      }
      else
      {
        v316 = [v314 dictionaryRepresentation];
        v317 = @"storefront_filter";
      }
      id v318 = v316;

      [v4 setObject:v318 forKey:v317];
    }

    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 760));
    if ((*(void *)(a1 + 764) & 0x40000000) == 0)
    {
      v319 = *(void **)(a1 + 8);
      if (v319)
      {
        id v320 = v319;
        objc_sync_enter(v320);
        GEOPDComponentFilterReadSpecified(a1, *(char **)(a1 + 8), (int *)&_readGroundViewLabelFilter_tags);
        objc_sync_exit(v320);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 760));
    id v321 = *(id *)(a1 + 256);
    v322 = v321;
    if (v321)
    {
      if (a2)
      {
        v323 = [v321 jsonRepresentation];
        v324 = @"groundViewLabelFilter";
      }
      else
      {
        v323 = [v321 dictionaryRepresentation];
        v324 = @"ground_view_label_filter";
      }
      id v325 = v323;

      [v4 setObject:v325 forKey:v324];
    }

    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 760));
    if ((*(void *)(a1 + 764) & 0x100) == 0)
    {
      v326 = *(void **)(a1 + 8);
      if (v326)
      {
        id v327 = v326;
        objc_sync_enter(v327);
        GEOPDComponentFilterReadSpecified(a1, *(char **)(a1 + 8), (int *)&_readAnnotatedItemListFilter_tags);
        objc_sync_exit(v327);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 760));
    id v328 = *(id *)(a1 + 80);
    v329 = v328;
    if (v328)
    {
      if (a2)
      {
        v330 = [v328 jsonRepresentation];
        v331 = @"annotatedItemListFilter";
      }
      else
      {
        v330 = [v328 dictionaryRepresentation];
        v331 = @"annotated_item_list_filter";
      }
      id v332 = v330;

      [v4 setObject:v332 forKey:v331];
    }

    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 760));
    if ((*(void *)(a1 + 764) & 0x8000000000000) == 0)
    {
      v333 = *(void **)(a1 + 8);
      if (v333)
      {
        id v334 = v333;
        objc_sync_enter(v334);
        GEOPDComponentFilterReadSpecified(a1, *(char **)(a1 + 8), (int *)&_readPoiEventFilter_tags);
        objc_sync_exit(v334);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 760));
    id v335 = *(id *)(a1 + 424);
    v336 = v335;
    if (v335)
    {
      if (a2)
      {
        v337 = [v335 jsonRepresentation];
        v338 = @"poiEventFilter";
      }
      else
      {
        v337 = [v335 dictionaryRepresentation];
        v338 = @"poi_event_filter";
      }
      id v339 = v337;

      [v4 setObject:v339 forKey:v338];
    }

    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 760));
    if ((*(_DWORD *)(a1 + 772) & 0x20) == 0)
    {
      v340 = *(void **)(a1 + 8);
      if (v340)
      {
        id v341 = v340;
        objc_sync_enter(v341);
        GEOPDComponentFilterReadSpecified(a1, *(char **)(a1 + 8), (int *)&_readStorefrontPresentationFilter_tags);
        objc_sync_exit(v341);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 760));
    id v342 = *(id *)(a1 + 568);
    v343 = v342;
    if (v342)
    {
      if (a2)
      {
        v344 = [v342 jsonRepresentation];
        v345 = @"storefrontPresentationFilter";
      }
      else
      {
        v344 = [v342 dictionaryRepresentation];
        v345 = @"storefront_presentation_filter";
      }
      id v346 = v344;

      [v4 setObject:v346 forKey:v345];
    }

    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 760));
    if ((*(void *)(a1 + 764) & 0x1000000000000) == 0)
    {
      v347 = *(void **)(a1 + 8);
      if (v347)
      {
        id v348 = v347;
        objc_sync_enter(v348);
        GEOPDComponentFilterReadSpecified(a1, *(char **)(a1 + 8), (int *)&_readPlacecardLayoutConfigurationFilter_tags);
        objc_sync_exit(v348);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 760));
    id v349 = *(id *)(a1 + 400);
    v350 = v349;
    if (v349)
    {
      if (a2)
      {
        v351 = [v349 jsonRepresentation];
        v352 = @"placecardLayoutConfigurationFilter";
      }
      else
      {
        v351 = [v349 dictionaryRepresentation];
        v352 = @"placecard_layout_configuration_filter";
      }
      id v353 = v351;

      [v4 setObject:v353 forKey:v352];
    }

    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 760));
    if ((*(void *)(a1 + 764) & 0x20000000000000) == 0)
    {
      v354 = *(void **)(a1 + 8);
      if (v354)
      {
        id v355 = v354;
        objc_sync_enter(v355);
        GEOPDComponentFilterReadSpecified(a1, *(char **)(a1 + 8), (int *)&_readProtoTypeContainerFilter_tags);
        objc_sync_exit(v355);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 760));
    id v356 = *(id *)(a1 + 440);
    v357 = v356;
    if (v356)
    {
      if (a2)
      {
        v358 = [v356 jsonRepresentation];
        v359 = @"protoTypeContainerFilter";
      }
      else
      {
        v358 = [v356 dictionaryRepresentation];
        v359 = @"proto_type_container_filter";
      }
      id v360 = v358;

      [v4 setObject:v360 forKey:v359];
    }

    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 760));
    if ((*(_DWORD *)(a1 + 772) & 0x800000) == 0)
    {
      v361 = *(void **)(a1 + 8);
      if (v361)
      {
        id v362 = v361;
        objc_sync_enter(v362);
        GEOPDComponentFilterReadSpecified(a1, *(char **)(a1 + 8), (int *)&_readTransitVehiclePositionFilter_tags);
        objc_sync_exit(v362);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 760));
    id v363 = *(id *)(a1 + 712);
    v364 = v363;
    if (v363)
    {
      if (a2)
      {
        v365 = [v363 jsonRepresentation];
        v366 = @"transitVehiclePositionFilter";
      }
      else
      {
        v365 = [v363 dictionaryRepresentation];
        v366 = @"transit_vehicle_position_filter";
      }
      id v367 = v365;

      [v4 setObject:v367 forKey:v366];
    }

    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 760));
    if ((*(void *)(a1 + 764) & 0x8000000000) == 0)
    {
      v368 = *(void **)(a1 + 8);
      if (v368)
      {
        id v369 = v368;
        objc_sync_enter(v369);
        GEOPDComponentFilterReadSpecified(a1, *(char **)(a1 + 8), (int *)&_readLinkedServiceFilter_tags);
        objc_sync_exit(v369);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 760));
    id v370 = *(id *)(a1 + 328);
    v371 = v370;
    if (v370)
    {
      if (a2)
      {
        v372 = [v370 jsonRepresentation];
        v373 = @"linkedServiceFilter";
      }
      else
      {
        v372 = [v370 dictionaryRepresentation];
        v373 = @"linked_service_filter";
      }
      id v374 = v372;

      [v4 setObject:v374 forKey:v373];
    }

    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 760));
    if ((*(void *)(a1 + 764) & 0x2000) == 0)
    {
      v375 = *(void **)(a1 + 8);
      if (v375)
      {
        id v376 = v375;
        objc_sync_enter(v376);
        GEOPDComponentFilterReadSpecified(a1, *(char **)(a1 + 8), (int *)&_readBusinessHoursFilter_tags);
        objc_sync_exit(v376);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 760));
    id v377 = *(id *)(a1 + 120);
    v378 = v377;
    if (v377)
    {
      if (a2)
      {
        v379 = [v377 jsonRepresentation];
        v380 = @"businessHoursFilter";
      }
      else
      {
        v379 = [v377 dictionaryRepresentation];
        v380 = @"business_hours_filter";
      }
      id v381 = v379;

      [v4 setObject:v381 forKey:v380];
    }

    v382 = -[GEOPDComponentFilter placeCollectionFilter]((id *)a1);
    v383 = v382;
    if (v382)
    {
      if (a2)
      {
        v384 = [v382 jsonRepresentation];
        v385 = @"placeCollectionFilter";
      }
      else
      {
        v384 = [v382 dictionaryRepresentation];
        v385 = @"place_collection_filter";
      }
      id v386 = v384;

      [v4 setObject:v386 forKey:v385];
    }

    v387 = -[GEOPDComponentFilter relatedPlaceFilter]((id *)a1);
    v388 = v387;
    if (v387)
    {
      if (a2)
      {
        v389 = [v387 jsonRepresentation];
        v390 = @"relatedPlaceFilter";
      }
      else
      {
        v389 = [v387 dictionaryRepresentation];
        v390 = @"related_place_filter";
      }
      id v391 = v389;

      [v4 setObject:v391 forKey:v390];
    }

    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 760));
    if ((*(_DWORD *)(a1 + 772) & 0x200000) == 0)
    {
      v392 = *(void **)(a1 + 8);
      if (v392)
      {
        id v393 = v392;
        objc_sync_enter(v393);
        GEOPDComponentFilterReadSpecified(a1, *(char **)(a1 + 8), (int *)&_readTransitTripStopFilter_tags);
        objc_sync_exit(v393);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 760));
    id v394 = *(id *)(a1 + 696);
    v395 = v394;
    if (v394)
    {
      if (a2)
      {
        v396 = [v394 jsonRepresentation];
        v397 = @"transitTripStopFilter";
      }
      else
      {
        v396 = [v394 dictionaryRepresentation];
        v397 = @"transit_trip_stop_filter";
      }
      id v398 = v396;

      [v4 setObject:v398 forKey:v397];
    }

    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 760));
    if ((*(_DWORD *)(a1 + 772) & 0x400000) == 0)
    {
      v399 = *(void **)(a1 + 8);
      if (v399)
      {
        id v400 = v399;
        objc_sync_enter(v400);
        GEOPDComponentFilterReadSpecified(a1, *(char **)(a1 + 8), (int *)&_readTransitTripStopTimeFilter_tags);
        objc_sync_exit(v400);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 760));
    id v401 = *(id *)(a1 + 704);
    v402 = v401;
    if (v401)
    {
      if (a2)
      {
        v403 = [v401 jsonRepresentation];
        v404 = @"transitTripStopTimeFilter";
      }
      else
      {
        v403 = [v401 dictionaryRepresentation];
        v404 = @"transit_trip_stop_time_filter";
      }
      id v405 = v403;

      [v4 setObject:v405 forKey:v404];
    }

    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 760));
    if ((*(_DWORD *)(a1 + 772) & 0x100000) == 0)
    {
      v406 = *(void **)(a1 + 8);
      if (v406)
      {
        id v407 = v406;
        objc_sync_enter(v407);
        GEOPDComponentFilterReadSpecified(a1, *(char **)(a1 + 8), (int *)&_readTransitTripGeometryFilter_tags);
        objc_sync_exit(v407);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 760));
    id v408 = *(id *)(a1 + 688);
    v409 = v408;
    if (v408)
    {
      if (a2)
      {
        v410 = [v408 jsonRepresentation];
        v411 = @"transitTripGeometryFilter";
      }
      else
      {
        v410 = [v408 dictionaryRepresentation];
        v411 = @"transit_trip_geometry_filter";
      }
      id v412 = v410;

      [v4 setObject:v412 forKey:v411];
    }

    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 760));
    if ((*(_DWORD *)(a1 + 772) & 0x4000000) == 0)
    {
      v413 = *(void **)(a1 + 8);
      if (v413)
      {
        id v414 = v413;
        objc_sync_enter(v414);
        GEOPDComponentFilterReadSpecified(a1, *(char **)(a1 + 8), (int *)&_readWalletCategoryInformationFilter_tags);
        objc_sync_exit(v414);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 760));
    id v415 = *(id *)(a1 + 736);
    v416 = v415;
    if (v415)
    {
      if (a2)
      {
        v417 = [v415 jsonRepresentation];
        v418 = @"walletCategoryInformationFilter";
      }
      else
      {
        v417 = [v415 dictionaryRepresentation];
        v418 = @"wallet_category_information_filter";
      }
      id v419 = v417;

      [v4 setObject:v419 forKey:v418];
    }

    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 760));
    if ((*(void *)(a1 + 764) & 0x40000000000000) == 0)
    {
      v420 = *(void **)(a1 + 8);
      if (v420)
      {
        id v421 = v420;
        objc_sync_enter(v421);
        GEOPDComponentFilterReadSpecified(a1, *(char **)(a1 + 8), (int *)&_readPublisherFilter_tags);
        objc_sync_exit(v421);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 760));
    id v422 = *(id *)(a1 + 448);
    v423 = v422;
    if (v422)
    {
      if (a2)
      {
        v424 = [v422 jsonRepresentation];
        v425 = @"publisherFilter";
      }
      else
      {
        v424 = [v422 dictionaryRepresentation];
        v425 = @"publisher_filter";
      }
      id v426 = v424;

      [v4 setObject:v426 forKey:v425];
    }

    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 760));
    if ((*(void *)(a1 + 764) & 0x800000000000) == 0)
    {
      v427 = *(void **)(a1 + 8);
      if (v427)
      {
        id v428 = v427;
        objc_sync_enter(v428);
        GEOPDComponentFilterReadSpecified(a1, *(char **)(a1 + 8), (int *)&_readPlaceQuestionnaireFilter_tags);
        objc_sync_exit(v428);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 760));
    id v429 = *(id *)(a1 + 392);
    v430 = v429;
    if (v429)
    {
      if (a2)
      {
        v431 = [v429 jsonRepresentation];
        v432 = @"placeQuestionnaireFilter";
      }
      else
      {
        v431 = [v429 dictionaryRepresentation];
        v432 = @"place_questionnaire_filter";
      }
      id v433 = v431;

      [v4 setObject:v433 forKey:v432];
    }

    -[GEOPDComponentFilter _readPlaceCollectionItemFilter](a1);
    id v434 = *(id *)(a1 + 376);
    v435 = v434;
    if (v434)
    {
      if (a2)
      {
        v436 = [v434 jsonRepresentation];
        v437 = @"placeCollectionItemFilter";
      }
      else
      {
        v436 = [v434 dictionaryRepresentation];
        v437 = @"place_collection_item_filter";
      }
      id v438 = v436;

      [v4 setObject:v438 forKey:v437];
    }

    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 760));
    if ((*(void *)(a1 + 764) & 0x10000) == 0)
    {
      v439 = *(void **)(a1 + 8);
      if (v439)
      {
        id v440 = v439;
        objc_sync_enter(v440);
        GEOPDComponentFilterReadSpecified(a1, *(char **)(a1 + 8), (int *)&_readCollectionIdsFilter_tags);
        objc_sync_exit(v440);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 760));
    id v441 = *(id *)(a1 + 144);
    v442 = v441;
    if (v441)
    {
      if (a2)
      {
        v443 = [v441 jsonRepresentation];
        v444 = @"collectionIdsFilter";
      }
      else
      {
        v443 = [v441 dictionaryRepresentation];
        v444 = @"collection_ids_filter";
      }
      id v445 = v443;

      [v4 setObject:v445 forKey:v444];
    }

    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 760));
    if ((*(void *)(a1 + 764) & 0x2000000000) == 0)
    {
      v446 = *(void **)(a1 + 8);
      if (v446)
      {
        id v447 = v446;
        objc_sync_enter(v447);
        GEOPDComponentFilterReadSpecified(a1, *(char **)(a1 + 8), (int *)&_readIso3166CodeFilter_tags);
        objc_sync_exit(v447);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 760));
    id v448 = *(id *)(a1 + 312);
    v449 = v448;
    if (v448)
    {
      if (a2)
      {
        v450 = [v448 jsonRepresentation];
        v451 = @"iso3166CodeFilter";
      }
      else
      {
        v450 = [v448 dictionaryRepresentation];
        v451 = @"iso_3166_code_filter";
      }
      id v452 = v450;

      [v4 setObject:v452 forKey:v451];
    }

    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 760));
    if ((*(_DWORD *)(a1 + 772) & 0x1000000) == 0)
    {
      v453 = *(void **)(a1 + 8);
      if (v453)
      {
        id v454 = v453;
        objc_sync_enter(v454);
        GEOPDComponentFilterReadSpecified(a1, *(char **)(a1 + 8), (int *)&_readVendorAmenitiesFilter_tags);
        objc_sync_exit(v454);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 760));
    id v455 = *(id *)(a1 + 720);
    v456 = v455;
    if (v455)
    {
      if (a2)
      {
        v457 = [v455 jsonRepresentation];
        v458 = @"vendorAmenitiesFilter";
      }
      else
      {
        v457 = [v455 dictionaryRepresentation];
        v458 = @"vendor_amenities_filter";
      }
      id v459 = v457;

      [v4 setObject:v459 forKey:v458];
    }

    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 760));
    if ((*(_DWORD *)(a1 + 772) & 8) == 0)
    {
      v460 = *(void **)(a1 + 8);
      if (v460)
      {
        id v461 = v460;
        objc_sync_enter(v461);
        GEOPDComponentFilterReadSpecified(a1, *(char **)(a1 + 8), (int *)&_readStorefrontFacesFilter_tags);
        objc_sync_exit(v461);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 760));
    id v462 = *(id *)(a1 + 552);
    v463 = v462;
    if (v462)
    {
      if (a2)
      {
        v464 = [v462 jsonRepresentation];
        v465 = @"storefrontFacesFilter";
      }
      else
      {
        v464 = [v462 dictionaryRepresentation];
        v465 = @"storefront_faces_filter";
      }
      id v466 = v464;

      [v4 setObject:v466 forKey:v465];
    }

    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 760));
    if ((*(void *)(a1 + 764) & 0x80000000) == 0)
    {
      v467 = *(void **)(a1 + 8);
      if (v467)
      {
        id v468 = v467;
        objc_sync_enter(v468);
        GEOPDComponentFilterReadSpecified(a1, *(char **)(a1 + 8), (int *)&_readGuideGroupFilter_tags);
        objc_sync_exit(v468);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 760));
    id v469 = *(id *)(a1 + 264);
    v470 = v469;
    if (v469)
    {
      if (a2)
      {
        v471 = [v469 jsonRepresentation];
        v472 = @"guideGroupFilter";
      }
      else
      {
        v471 = [v469 dictionaryRepresentation];
        v472 = @"guide_group_filter";
      }
      id v473 = v471;

      [v4 setObject:v473 forKey:v472];
    }

    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 760));
    if ((*(void *)(a1 + 764) & 0x40000) == 0)
    {
      v474 = *(void **)(a1 + 8);
      if (v474)
      {
        id v475 = v474;
        objc_sync_enter(v475);
        GEOPDComponentFilterReadSpecified(a1, *(char **)(a1 + 8), (int *)&_readContainmentPlaceFilter_tags);
        objc_sync_exit(v475);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 760));
    id v476 = *(id *)(a1 + 160);
    v477 = v476;
    if (v476)
    {
      if (a2)
      {
        v478 = [v476 jsonRepresentation];
        v479 = @"containmentPlaceFilter";
      }
      else
      {
        v478 = [v476 dictionaryRepresentation];
        v479 = @"containment_place_filter";
      }
      id v480 = v478;

      [v4 setObject:v480 forKey:v479];
    }

    v481 = -[GEOPDComponentFilter categorizedPhotosFilter]((id *)a1);
    v482 = v481;
    if (v481)
    {
      if (a2)
      {
        v483 = [v481 jsonRepresentation];
        v484 = @"categorizedPhotosFilter";
      }
      else
      {
        v483 = [v481 dictionaryRepresentation];
        v484 = @"categorized_photos_filter";
      }
      id v485 = v483;

      [v4 setObject:v485 forKey:v484];
    }

    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 760));
    if ((*(void *)(a1 + 764) & 0x2000000) == 0)
    {
      v486 = *(void **)(a1 + 8);
      if (v486)
      {
        id v487 = v486;
        objc_sync_enter(v487);
        GEOPDComponentFilterReadSpecified(a1, *(char **)(a1 + 8), (int *)&_readExploreGuidesFilter_tags);
        objc_sync_exit(v487);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 760));
    id v488 = *(id *)(a1 + 216);
    v489 = v488;
    if (v488)
    {
      if (a2)
      {
        v490 = [v488 jsonRepresentation];
        v491 = @"exploreGuidesFilter";
      }
      else
      {
        v490 = [v488 dictionaryRepresentation];
        v491 = @"explore_guides_filter";
      }
      id v492 = v490;

      [v4 setObject:v492 forKey:v491];
    }

    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 760));
    if ((*(void *)(a1 + 764) & 2) == 0)
    {
      v493 = *(void **)(a1 + 8);
      if (v493)
      {
        id v494 = v493;
        objc_sync_enter(v494);
        GEOPDComponentFilterReadSpecified(a1, *(char **)(a1 + 8), (int *)&_readAboutFilter_tags);
        objc_sync_exit(v494);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 760));
    id v495 = *(id *)(a1 + 24);
    v496 = v495;
    if (v495)
    {
      if (a2)
      {
        v497 = [v495 jsonRepresentation];
        v498 = @"aboutFilter";
      }
      else
      {
        v497 = [v495 dictionaryRepresentation];
        v498 = @"about_filter";
      }
      id v499 = v497;

      [v4 setObject:v499 forKey:v498];
    }

    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 760));
    if ((*(void *)(a1 + 764) & 0x4000000000) == 0)
    {
      v500 = *(void **)(a1 + 8);
      if (v500)
      {
        id v501 = v500;
        objc_sync_enter(v501);
        GEOPDComponentFilterReadSpecified(a1, *(char **)(a1 + 8), (int *)&_readLabelGeometryFilter_tags);
        objc_sync_exit(v501);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 760));
    id v502 = *(id *)(a1 + 320);
    v503 = v502;
    if (v502)
    {
      if (a2)
      {
        v504 = [v502 jsonRepresentation];
        v505 = @"labelGeometryFilter";
      }
      else
      {
        v504 = [v502 dictionaryRepresentation];
        v505 = @"label_geometry_filter";
      }
      id v506 = v504;

      [v4 setObject:v506 forKey:v505];
    }

    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 760));
    if ((*(void *)(a1 + 764) & 0x80000) == 0)
    {
      v507 = *(void **)(a1 + 8);
      if (v507)
      {
        id v508 = v507;
        objc_sync_enter(v508);
        GEOPDComponentFilterReadSpecified(a1, *(char **)(a1 + 8), (int *)&_readEnhancedPlacementFilter_tags);
        objc_sync_exit(v508);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 760));
    id v509 = *(id *)(a1 + 168);
    v510 = v509;
    if (v509)
    {
      if (a2)
      {
        v511 = [v509 jsonRepresentation];
        v512 = @"enhancedPlacementFilter";
      }
      else
      {
        v511 = [v509 dictionaryRepresentation];
        v512 = @"enhanced_placement_filter";
      }
      id v513 = v511;

      [v4 setObject:v513 forKey:v512];
    }

    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 760));
    if ((*(_DWORD *)(a1 + 772) & 0x100) == 0)
    {
      v514 = *(void **)(a1 + 8);
      if (v514)
      {
        id v515 = v514;
        objc_sync_enter(v515);
        GEOPDComponentFilterReadSpecified(a1, *(char **)(a1 + 8), (int *)&_readTemplatePlaceFilter_tags);
        objc_sync_exit(v515);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 760));
    id v516 = *(id *)(a1 + 592);
    v517 = v516;
    if (v516)
    {
      if (a2)
      {
        v518 = [v516 jsonRepresentation];
        v519 = @"templatePlaceFilter";
      }
      else
      {
        v518 = [v516 dictionaryRepresentation];
        v519 = @"template_place_filter";
      }
      id v520 = v518;

      [v4 setObject:v520 forKey:v519];
    }

    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 760));
    if ((*(_DWORD *)(a1 + 772) & 0x40000) == 0)
    {
      v521 = *(void **)(a1 + 8);
      if (v521)
      {
        id v522 = v521;
        objc_sync_enter(v522);
        GEOPDComponentFilterReadSpecified(a1, *(char **)(a1 + 8), (int *)&_readTransitPaymentMethodInfoFilter_tags);
        objc_sync_exit(v522);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 760));
    id v523 = *(id *)(a1 + 672);
    v524 = v523;
    if (v523)
    {
      if (a2)
      {
        v525 = [v523 jsonRepresentation];
        v526 = @"transitPaymentMethodInfoFilter";
      }
      else
      {
        v525 = [v523 dictionaryRepresentation];
        v526 = @"transit_payment_method_info_filter";
      }
      id v527 = v525;

      [v4 setObject:v527 forKey:v526];
    }

    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 760));
    if ((*(void *)(a1 + 764) & 0x200000) == 0)
    {
      v528 = *(void **)(a1 + 8);
      if (v528)
      {
        id v529 = v528;
        objc_sync_enter(v529);
        GEOPDComponentFilterReadSpecified(a1, *(char **)(a1 + 8), (int *)&_readEnrichmentInfoFilter_tags);
        objc_sync_exit(v529);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 760));
    id v530 = *(id *)(a1 + 184);
    v531 = v530;
    if (v530)
    {
      if (a2)
      {
        v532 = [v530 jsonRepresentation];
        v533 = @"enrichmentInfoFilter";
      }
      else
      {
        v532 = [v530 dictionaryRepresentation];
        v533 = @"enrichment_info_filter";
      }
      id v534 = v532;

      [v4 setObject:v534 forKey:v533];
    }

    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 760));
    if ((*(void *)(a1 + 764) & 8) == 0)
    {
      v535 = *(void **)(a1 + 8);
      if (v535)
      {
        id v536 = v535;
        objc_sync_enter(v536);
        GEOPDComponentFilterReadSpecified(a1, *(char **)(a1 + 8), (int *)&_readActionDataFilter_tags);
        objc_sync_exit(v536);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 760));
    id v537 = *(id *)(a1 + 40);
    v538 = v537;
    if (v537)
    {
      if (a2)
      {
        v539 = [v537 jsonRepresentation];
        v540 = @"actionDataFilter";
      }
      else
      {
        v539 = [v537 dictionaryRepresentation];
        v540 = @"action_data_filter";
      }
      id v541 = v539;

      [v4 setObject:v541 forKey:v540];
    }

    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 760));
    if ((*(void *)(a1 + 764) & 0x100000) == 0)
    {
      v542 = *(void **)(a1 + 8);
      if (v542)
      {
        id v543 = v542;
        objc_sync_enter(v543);
        GEOPDComponentFilterReadSpecified(a1, *(char **)(a1 + 8), (int *)&_readEnrichmentDataFilter_tags);
        objc_sync_exit(v543);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 760));
    id v544 = *(id *)(a1 + 176);
    v545 = v544;
    if (v544)
    {
      if (a2)
      {
        v546 = [v544 jsonRepresentation];
        v547 = @"enrichmentDataFilter";
      }
      else
      {
        v546 = [v544 dictionaryRepresentation];
        v547 = @"enrichment_data_filter";
      }
      id v548 = v546;

      [v4 setObject:v548 forKey:v547];
    }

    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 760));
    if ((*(void *)(a1 + 764) & 0x4000000000000) == 0)
    {
      v549 = *(void **)(a1 + 8);
      if (v549)
      {
        id v550 = v549;
        objc_sync_enter(v550);
        GEOPDComponentFilterReadSpecified(a1, *(char **)(a1 + 8), (int *)&_readPoiClaimFilter_tags);
        objc_sync_exit(v550);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 760));
    id v551 = *(id *)(a1 + 416);
    v552 = v551;
    if (v551)
    {
      if (a2)
      {
        v553 = [v551 jsonRepresentation];
        v554 = @"poiClaimFilter";
      }
      else
      {
        v553 = [v551 dictionaryRepresentation];
        v554 = @"poi_claim_filter";
      }
      id v555 = v553;

      [v4 setObject:v555 forKey:v554];
    }

    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 760));
    if ((*(void *)(a1 + 764) & 0x1000000) == 0)
    {
      v556 = *(void **)(a1 + 8);
      if (v556)
      {
        id v557 = v556;
        objc_sync_enter(v557);
        GEOPDComponentFilterReadSpecified(a1, *(char **)(a1 + 8), (int *)&_readEvChargerFilter_tags);
        objc_sync_exit(v557);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 760));
    id v558 = *(id *)(a1 + 208);
    v559 = v558;
    if (v558)
    {
      if (a2)
      {
        v560 = [v558 jsonRepresentation];
        v561 = @"evChargerFilter";
      }
      else
      {
        v560 = [v558 dictionaryRepresentation];
        v561 = @"ev_charger_filter";
      }
      id v562 = v560;

      [v4 setObject:v562 forKey:v561];
    }

    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 760));
    if ((*(_DWORD *)(a1 + 772) & 0x1000) == 0)
    {
      v563 = *(void **)(a1 + 8);
      if (v563)
      {
        id v564 = v563;
        objc_sync_enter(v564);
        GEOPDComponentFilterReadSpecified(a1, *(char **)(a1 + 8), (int *)&_readTrailHeadFilter_tags);
        objc_sync_exit(v564);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 760));
    id v565 = *(id *)(a1 + 624);
    v566 = v565;
    if (v565)
    {
      if (a2)
      {
        v567 = [v565 jsonRepresentation];
        v568 = @"trailHeadFilter";
      }
      else
      {
        v567 = [v565 dictionaryRepresentation];
        v568 = @"trail_head_filter";
      }
      id v569 = v567;

      [v4 setObject:v569 forKey:v568];
    }

    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 760));
    if ((*(void *)(a1 + 764) & 0x800000000000000) == 0)
    {
      v570 = *(void **)(a1 + 8);
      if (v570)
      {
        id v571 = v570;
        objc_sync_enter(v571);
        GEOPDComponentFilterReadSpecified(a1, *(char **)(a1 + 8), (int *)&_readRefreshIdFilter_tags);
        objc_sync_exit(v571);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 760));
    id v572 = *(id *)(a1 + 488);
    v573 = v572;
    if (v572)
    {
      if (a2)
      {
        v574 = [v572 jsonRepresentation];
        v575 = @"refreshIdFilter";
      }
      else
      {
        v574 = [v572 dictionaryRepresentation];
        v575 = @"refresh_id_filter";
      }
      id v576 = v574;

      [v4 setObject:v576 forKey:v575];
    }

    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 760));
    if ((*(void *)(a1 + 764) & 0x10) == 0)
    {
      v577 = *(void **)(a1 + 8);
      if (v577)
      {
        id v578 = v577;
        objc_sync_enter(v578);
        GEOPDComponentFilterReadSpecified(a1, *(char **)(a1 + 8), (int *)&_readAddressComponentsFilter_tags);
        objc_sync_exit(v578);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 760));
    id v579 = *(id *)(a1 + 48);
    v580 = v579;
    if (v579)
    {
      if (a2)
      {
        v581 = [v579 jsonRepresentation];
        v582 = @"addressComponentsFilter";
      }
      else
      {
        v581 = [v579 dictionaryRepresentation];
        v582 = @"address_components_filter";
      }
      id v583 = v581;

      [v4 setObject:v583 forKey:v582];
    }

    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 760));
    if ((*(_DWORD *)(a1 + 772) & 1) == 0)
    {
      v584 = *(void **)(a1 + 8);
      if (v584)
      {
        id v585 = v584;
        objc_sync_enter(v585);
        GEOPDComponentFilterReadSpecified(a1, *(char **)(a1 + 8), (int *)&_readSearchResultPlacePhotoFilter_tags);
        objc_sync_exit(v585);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 760));
    id v586 = *(id *)(a1 + 528);
    v587 = v586;
    if (v586)
    {
      if (a2)
      {
        v588 = [v586 jsonRepresentation];
        v589 = @"searchResultPlacePhotoFilter";
      }
      else
      {
        v588 = [v586 dictionaryRepresentation];
        v589 = @"search_result_place_photo_filter";
      }
      id v590 = v588;

      [v4 setObject:v590 forKey:v589];
    }

    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 760));
    if ((*(void *)(a1 + 764) & 0x20000000) == 0)
    {
      v591 = *(void **)(a1 + 8);
      if (v591)
      {
        id v592 = v591;
        objc_sync_enter(v592);
        GEOPDComponentFilterReadSpecified(a1, *(char **)(a1 + 8), (int *)&_readForwardInfoFilter_tags);
        objc_sync_exit(v592);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 760));
    id v593 = *(id *)(a1 + 248);
    v594 = v593;
    if (v593)
    {
      if (a2)
      {
        v595 = [v593 jsonRepresentation];
        v596 = @"forwardInfoFilter";
      }
      else
      {
        v595 = [v593 dictionaryRepresentation];
        v596 = @"forward_info_filter";
      }
      id v597 = v595;

      [v4 setObject:v597 forKey:v596];
    }

    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 760));
    if ((*(void *)(a1 + 764) & 0x100000000) == 0)
    {
      v598 = *(void **)(a1 + 8);
      if (v598)
      {
        id v599 = v598;
        objc_sync_enter(v599);
        GEOPDComponentFilterReadSpecified(a1, *(char **)(a1 + 8), (int *)&_readHikeAssociatedInfoFilter_tags);
        objc_sync_exit(v599);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 760));
    id v600 = *(id *)(a1 + 272);
    v601 = v600;
    if (v600)
    {
      if (a2)
      {
        v602 = [v600 jsonRepresentation];
        v603 = @"hikeAssociatedInfoFilter";
      }
      else
      {
        v602 = [v600 dictionaryRepresentation];
        v603 = @"hike_associated_info_filter";
      }
      id v604 = v602;

      [v4 setObject:v604 forKey:v603];
    }

    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 760));
    if ((*(void *)(a1 + 764) & 0x400000000) == 0)
    {
      v605 = *(void **)(a1 + 8);
      if (v605)
      {
        id v606 = v605;
        objc_sync_enter(v606);
        GEOPDComponentFilterReadSpecified(a1, *(char **)(a1 + 8), (int *)&_readHikeSummaryFilter_tags);
        objc_sync_exit(v606);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 760));
    id v607 = *(id *)(a1 + 288);
    v608 = v607;
    if (v607)
    {
      if (a2)
      {
        v609 = [v607 jsonRepresentation];
        v610 = @"hikeSummaryFilter";
      }
      else
      {
        v609 = [v607 dictionaryRepresentation];
        v610 = @"hike_summary_filter";
      }
      id v611 = v609;

      [v4 setObject:v611 forKey:v610];
    }

    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 760));
    if ((*(void *)(a1 + 764) & 0x200000000) == 0)
    {
      v612 = *(void **)(a1 + 8);
      if (v612)
      {
        id v613 = v612;
        objc_sync_enter(v613);
        GEOPDComponentFilterReadSpecified(a1, *(char **)(a1 + 8), (int *)&_readHikeGeometryFilter_tags);
        objc_sync_exit(v613);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 760));
    id v614 = *(id *)(a1 + 280);
    v615 = v614;
    if (v614)
    {
      if (a2)
      {
        v616 = [v614 jsonRepresentation];
        v617 = @"hikeGeometryFilter";
      }
      else
      {
        v616 = [v614 dictionaryRepresentation];
        v617 = @"hike_geometry_filter";
      }
      id v618 = v616;

      [v4 setObject:v618 forKey:v617];
    }

    v619 = -[GEOPDComponentFilter toolTipFilter]((id *)a1);
    v620 = v619;
    if (v619)
    {
      if (a2)
      {
        v621 = [v619 jsonRepresentation];
        v622 = @"toolTipFilter";
      }
      else
      {
        v621 = [v619 dictionaryRepresentation];
        v622 = @"tool_tip_filter";
      }
      id v623 = v621;

      [v4 setObject:v623 forKey:v622];
    }

    v624 = *(void **)(a1 + 16);
    if (v624)
    {
      v625 = [v624 dictionaryRepresentation];
      v626 = v625;
      if (a2)
      {
        v627 = objc_msgSend(MEMORY[0x1E4F1CA60], "dictionaryWithCapacity:", objc_msgSend(v625, "count"));
        v632[0] = MEMORY[0x1E4F143A8];
        v632[1] = 3221225472;
        v632[2] = __50__GEOPDComponentFilter__dictionaryRepresentation___block_invoke;
        v632[3] = &unk_1E53D8860;
        id v628 = v627;
        id v633 = v628;
        [v626 enumerateKeysAndObjectsUsingBlock:v632];
        id v629 = v628;

        v626 = v629;
      }
      [v4 setObject:v626 forKey:@"Unknown Fields"];
    }
    id v630 = v4;
  }
  else
  {
    id v630 = 0;
  }

  return v630;
}

- (id)jsonRepresentation
{
  return -[GEOPDComponentFilter _dictionaryRepresentation:]((uint64_t)self, 1);
}

void __50__GEOPDComponentFilter__dictionaryRepresentation___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v10 = a2;
  id v5 = a3;
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();
  id v7 = *(void **)(a1 + 32);
  if (isKindOfClass)
  {
    objc_super v8 = [v5 base64EncodedStringWithOptions:0];
    objc_super v9 = [v10 description];
    [v7 setObject:v8 forKey:v9];
  }
  else
  {
    objc_super v8 = [v10 description];
    [v7 setObject:v5 forKey:v8];
  }
}

- (uint64_t)_initWithDictionary:(int)a3 isJSON:
{
  uint64_t v743 = *MEMORY[0x1E4F143B8];
  id v733 = a2;
  id v5 = (id)[a1 init];

  uint64_t v732 = (uint64_t)v5;
  if (v5)
  {
    if (a3) {
      id v6 = @"entityFilter";
    }
    else {
      id v6 = @"entity_filter";
    }
    id v7 = [v733 objectForKeyedSubscript:v6];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      objc_super v8 = [GEOPDEntityFilter alloc];
      if (v8)
      {
        id v9 = v7;
        objc_super v8 = [(GEOPDEntityFilter *)v8 init];
        if (v8)
        {
          if (a3) {
            id v10 = @"includeSpokenNames";
          }
          else {
            id v10 = @"include_spoken_names";
          }
          id v11 = [v9 objectForKeyedSubscript:v10];
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            char v12 = [v11 BOOLValue];
            *(unsigned char *)&v8->_flags |= 2u;
            v8->_includeSpokenNames = v12;
          }

          if (a3) {
            id v13 = @"includeName";
          }
          else {
            id v13 = @"include_name";
          }
          id v14 = [v9 objectForKeyedSubscript:v13];
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            char v15 = [v14 BOOLValue];
            *(unsigned char *)&v8->_flags |= 1u;
            v8->_includeName = v15;
          }

          if (a3) {
            long long v16 = @"populateAltCategory";
          }
          else {
            long long v16 = @"populate_alt_category";
          }
          long long v17 = [v9 objectForKeyedSubscript:v16];
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            char v18 = [v17 BOOLValue];
            *(unsigned char *)&v8->_flags |= 4u;
            v8->_populateAltCategory = v18;
          }

          if (a3) {
            double v19 = @"useLegacyTaxonomy";
          }
          else {
            double v19 = @"use_legacy_taxonomy";
          }
          id v20 = [v9 objectForKeyedSubscript:v19];
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            char v21 = [v20 BOOLValue];
            *(unsigned char *)&v8->_flags |= 8u;
            v8->_useLegacyTaxonomy = v21;
          }
        }
      }
      -[GEOPDComponentFilter setEntityFilter:](v732, v8);
    }
    if (a3) {
      objc_super v22 = @"placeInfoFilter";
    }
    else {
      objc_super v22 = @"place_info_filter";
    }
    unint64_t v23 = [v733 objectForKeyedSubscript:v22];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      unint64_t v24 = [GEOPDPlaceInfoFilter alloc];
      id v25 = v23;
      if (v24) {
        unint64_t v24 = [(GEOPDPlaceInfoFilter *)v24 init];
      }

      unint64_t v26 = v24;
      int v27 = *(_DWORD *)(v732 + 772) | 0x10000000;
      *(void *)(v732 + 764) |= 0x400000000000uLL;
      *(_DWORD *)(v732 + 772) = v27;
      objc_storeStrong((id *)(v732 + 384), v24);
    }
    if (a3) {
      id v28 = @"accessInfoFilter";
    }
    else {
      id v28 = @"access_info_filter";
    }
    unint64_t v29 = [v733 objectForKeyedSubscript:v28];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      unint64_t v30 = [GEOPDRoadAccessInfoFilter alloc];
      id v31 = v29;
      if (v30) {
        unint64_t v30 = [(GEOPDRoadAccessInfoFilter *)v30 init];
      }

      id v32 = v30;
      int v33 = *(_DWORD *)(v732 + 772) | 0x10000000;
      *(void *)(v732 + 764) |= 4uLL;
      *(_DWORD *)(v732 + 772) = v33;
      objc_storeStrong((id *)(v732 + 32), v30);
    }
    if (a3) {
      id v34 = @"boundsFilter";
    }
    else {
      id v34 = @"bounds_filter";
    }
    id v35 = [v733 objectForKeyedSubscript:v34];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      unint64_t v36 = [GEOPDBoundsFilter alloc];
      id v37 = v35;
      if (v36) {
        unint64_t v36 = [(GEOPDBoundsFilter *)v36 init];
      }

      unint64_t v38 = v36;
      int v39 = *(_DWORD *)(v732 + 772) | 0x10000000;
      *(void *)(v732 + 764) |= 0x400uLL;
      *(_DWORD *)(v732 + 772) = v39;
      objc_storeStrong((id *)(v732 + 96), v36);
    }
    if (a3) {
      unint64_t v40 = @"addressFilter";
    }
    else {
      unint64_t v40 = @"address_filter";
    }
    id v41 = [v733 objectForKeyedSubscript:v40];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v42 = [GEOPDAddressFilter alloc];
      id v43 = v41;
      if (v42) {
        id v42 = [(GEOPDAddressFilter *)v42 init];
      }

      unint64_t v44 = v42;
      int v45 = *(_DWORD *)(v732 + 772) | 0x10000000;
      *(void *)(v732 + 764) |= 0x20uLL;
      *(_DWORD *)(v732 + 772) = v45;
      objc_storeStrong((id *)(v732 + 56), v42);
    }
    if (a3) {
      id v46 = @"ratingFilter";
    }
    else {
      id v46 = @"rating_filter";
    }
    unint64_t v47 = [v733 objectForKeyedSubscript:v46];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v48 = [GEOPDRatingFilter alloc];
      id v49 = v47;
      if (v48) {
        id v48 = [(GEOPDRatingFilter *)v48 init];
      }

      unint64_t v50 = v48;
      int v51 = *(_DWORD *)(v732 + 772) | 0x10000000;
      *(void *)(v732 + 764) |= 0x200000000000000uLL;
      *(_DWORD *)(v732 + 772) = v51;
      objc_storeStrong((id *)(v732 + 472), v48);
    }
    if (a3) {
      unint64_t v52 = @"reviewFilter";
    }
    else {
      unint64_t v52 = @"review_filter";
    }
    id v53 = [v733 objectForKeyedSubscript:v52];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      unint64_t v54 = [GEOPDReviewFilter alloc];
      if (v54)
      {
        id v55 = v54;
        id v56 = v53;
        unint64_t v57 = [(GEOPDReviewFilter *)v55 init];
        if (v57)
        {
          if (a3) {
            unint64_t v58 = @"photoSizeFilter";
          }
          else {
            unint64_t v58 = @"photo_size_filter";
          }
          unint64_t v59 = [v56 objectForKeyedSubscript:v58];
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            long long v739 = 0u;
            long long v740 = 0u;
            long long v737 = 0u;
            long long v738 = 0u;
            id v60 = v59;
            uint64_t v61 = [v60 countByEnumeratingWithState:&v737 objects:&v741 count:16];
            if (v61)
            {
              uint64_t v62 = *(void *)v738;
              do
              {
                for (uint64_t i = 0; i != v61; ++i)
                {
                  if (*(void *)v738 != v62) {
                    objc_enumerationMutation(v60);
                  }
                  unint64_t v64 = *(void **)(*((void *)&v737 + 1) + 8 * i);
                  objc_opt_class();
                  if (objc_opt_isKindOfClass())
                  {
                    unsigned int v736 = 0;
                    uint64_t v735 = 0;
                    _GEOPDPhotoSizeFilterValueFromDictionaryRepresentation(v64, (uint64_t)&v735);
                    unint64_t v3 = v3 & 0xFFFFFFFF00000000 | v736;
                    [(GEOPDReviewFilter *)(uint64_t)v57 addPhotoSizeFilter:v3];
                  }
                }
                uint64_t v61 = [v60 countByEnumeratingWithState:&v737 objects:&v741 count:16];
              }
              while (v61);
            }
          }
          if (a3) {
            unint64_t v65 = @"suppressSyntheticReviews";
          }
          else {
            unint64_t v65 = @"suppress_synthetic_reviews";
          }
          unint64_t v66 = [v56 objectForKeyedSubscript:v65];
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            char v67 = [v66 BOOLValue];
            *(unsigned char *)&v57->_flags |= 1u;
            v57->_suppressSyntheticReviews = v67;
          }
        }
      }
      else
      {
        unint64_t v57 = 0;
      }
      -[GEOPDComponentFilter setReviewFilter:](v732, v57);
    }
    if (a3) {
      unint64_t v68 = @"photoFilter";
    }
    else {
      unint64_t v68 = @"photo_filter";
    }
    id v69 = [v733 objectForKeyedSubscript:v68];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v70 = [GEOPDPhotoFilter alloc];
      if (v70)
      {
        id v71 = v69;
        id v70 = [(GEOPDPhotoFilter *)v70 init];
        if (v70)
        {
          if (a3) {
            unint64_t v72 = @"photoSizeFilter";
          }
          else {
            unint64_t v72 = @"photo_size_filter";
          }
          unint64_t v73 = [v71 objectForKeyedSubscript:v72];
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            long long v739 = 0u;
            long long v740 = 0u;
            long long v737 = 0u;
            long long v738 = 0u;
            id v74 = v73;
            uint64_t v75 = [v74 countByEnumeratingWithState:&v737 objects:&v741 count:16];
            if (v75)
            {
              uint64_t v76 = *(void *)v738;
              do
              {
                for (uint64_t j = 0; j != v75; ++j)
                {
                  if (*(void *)v738 != v76) {
                    objc_enumerationMutation(v74);
                  }
                  unint64_t v78 = *(void **)(*((void *)&v737 + 1) + 8 * j);
                  objc_opt_class();
                  if (objc_opt_isKindOfClass())
                  {
                    unsigned int v736 = 0;
                    uint64_t v735 = 0;
                    _GEOPDPhotoSizeFilterValueFromDictionaryRepresentation(v78, (uint64_t)&v735);
                    unint64_t v3 = v3 & 0xFFFFFFFF00000000 | v736;
                    [(GEOPDPhotoFilter *)(uint64_t)v70 addPhotoSizeFilter:v3];
                  }
                }
                uint64_t v75 = [v74 countByEnumeratingWithState:&v737 objects:&v741 count:16];
              }
              while (v75);
            }
          }
        }
      }
      -[GEOPDComponentFilter setPhotoFilter:](v732, v70);
    }
    if (a3) {
      unint64_t v79 = @"hoursFilter";
    }
    else {
      unint64_t v79 = @"hours_filter";
    }
    unint64_t v80 = [v733 objectForKeyedSubscript:v79];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v81 = [GEOPDHoursFilter alloc];
      id v82 = v80;
      if (v81) {
        id v81 = [(GEOPDHoursFilter *)v81 init];
      }

      id v83 = v81;
      int v84 = *(_DWORD *)(v732 + 772) | 0x10000000;
      *(void *)(v732 + 764) |= 0x800000000uLL;
      *(_DWORD *)(v732 + 772) = v84;
      objc_storeStrong((id *)(v732 + 296), v81);
    }
    if (a3) {
      unint64_t v85 = @"transitInfoFilter";
    }
    else {
      unint64_t v85 = @"transit_info_filter";
    }
    unint64_t v86 = [v733 objectForKeyedSubscript:v85];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      unint64_t v87 = [GEOPDTransitInfoFilter alloc];
      id v88 = v86;
      if (v87) {
        unint64_t v87 = [(GEOPDTransitInfoFilter *)v87 init];
      }

      unint64_t v89 = v87;
      *(_DWORD *)(v732 + 772) |= 0x10010000u;
      objc_storeStrong((id *)(v732 + 656), v87);
    }
    if (a3) {
      id v90 = @"transitScheduleFilter";
    }
    else {
      id v90 = @"transit_schedule_filter";
    }
    id v91 = [v733 objectForKeyedSubscript:v90];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      unint64_t v92 = [GEOPDTransitScheduleFilter alloc];
      if (v92)
      {
        v93 = v92;
        id v94 = v91;
        uint64_t v95 = [(GEOPDTransitScheduleFilter *)v93 init];
        if (v95)
        {
          if (a3) {
            v96 = @"departurePredicateCountdown";
          }
          else {
            v96 = @"departure_predicate_countdown";
          }
          id v97 = [v94 objectForKeyedSubscript:v96];
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            id v98 = [GEOPDDeparturePredicate alloc];
            if (v98) {
              v99 = (void *)-[GEOPDDeparturePredicate _initWithDictionary:isJSON:](v98, v97, a3);
            }
            else {
              v99 = 0;
            }
            -[GEOPDTransitScheduleFilter setDeparturePredicateCountdown:](v95, v99);
          }
          if (a3) {
            v100 = @"departurePredicateStamp";
          }
          else {
            v100 = @"departure_predicate_stamp";
          }
          v101 = [v94 objectForKeyedSubscript:v100];
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            id v102 = [GEOPDDeparturePredicate alloc];
            if (v102) {
              v103 = (void *)-[GEOPDDeparturePredicate _initWithDictionary:isJSON:](v102, v101, a3);
            }
            else {
              v103 = 0;
            }
            -[GEOPDTransitScheduleFilter setDeparturePredicateStamp:](v95, v103);
          }
          if (a3) {
            v104 = @"operatingHoursRange";
          }
          else {
            v104 = @"operating_hours_range";
          }
          v105 = [v94 objectForKeyedSubscript:v104];
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            int v742 = 0;
            uint64_t v741 = 0;
            _GEOPDTimeRangeFromDictionaryRepresentation(v105, (uint64_t)&v741, a3);
            uint64_t v106 = v741;
            int v107 = v742;
            *(unsigned char *)(v95 + 68) |= 0x20u;
            *(unsigned char *)(v95 + 68) |= 1u;
            *(void *)(v95 + 40) = v106;
            *(_DWORD *)(v95 + 48) = v107;
          }

          if (a3) {
            v108 = @"includeRealTimeDepartures";
          }
          else {
            v108 = @"include_real_time_departures";
          }
          id v109 = [v94 objectForKeyedSubscript:v108];
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            char v110 = [v109 BOOLValue];
            *(unsigned char *)(v95 + 68) |= 0x20u;
            *(unsigned char *)(v95 + 68) |= 2u;
            *(unsigned char *)(v95 + 64) = v110;
          }
        }
      }
      else
      {
        uint64_t v95 = 0;
      }
      -[GEOPDComponentFilter setTransitScheduleFilter:](v732, (void *)v95);
    }
    if (a3) {
      v111 = @"etaFilter";
    }
    else {
      v111 = @"eta_filter";
    }
    v112 = [v733 objectForKeyedSubscript:v111];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v113 = [GEOPDETAFilter alloc];
      if (v113) {
        id v114 = (void *)-[GEOPDETAFilter _initWithDictionary:isJSON:](v113, v112, a3);
      }
      else {
        id v114 = 0;
      }
      id v115 = v114;
      int v116 = *(_DWORD *)(v732 + 772) | 0x10000000;
      *(void *)(v732 + 764) |= 0x800000uLL;
      *(_DWORD *)(v732 + 772) = v116;
      objc_storeStrong((id *)(v732 + 200), v114);
    }
    if (a3) {
      id v117 = @"flyoverFilter";
    }
    else {
      id v117 = @"flyover_filter";
    }
    v118 = [v733 objectForKeyedSubscript:v117];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v119 = [GEOPDFlyoverFilter alloc];
      id v120 = v118;
      if (v119) {
        v119 = [(GEOPDFlyoverFilter *)v119 init];
      }

      id v121 = v119;
      int v122 = *(_DWORD *)(v732 + 772) | 0x10000000;
      *(void *)(v732 + 764) |= 0x10000000uLL;
      *(_DWORD *)(v732 + 772) = v122;
      objc_storeStrong((id *)(v732 + 240), v119);
    }
    if (a3) {
      id v123 = @"rawAttributeFilter";
    }
    else {
      id v123 = @"raw_attribute_filter";
    }
    id v124 = [v733 objectForKeyedSubscript:v123];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v125 = [GEOPDRawAttributeFilter alloc];
      if (v125)
      {
        id v126 = v124;
        v125 = [(GEOPDRawAttributeFilter *)v125 init];
        if (v125)
        {
          v127 = [v126 objectForKeyedSubscript:@"key"];
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            long long v739 = 0u;
            long long v740 = 0u;
            long long v737 = 0u;
            long long v738 = 0u;
            id v128 = v127;
            uint64_t v129 = [v128 countByEnumeratingWithState:&v737 objects:&v741 count:16];
            if (v129)
            {
              uint64_t v130 = *(void *)v738;
              do
              {
                for (uint64_t k = 0; k != v129; ++k)
                {
                  if (*(void *)v738 != v130) {
                    objc_enumerationMutation(v128);
                  }
                  unint64_t v3 = *(void *)(*((void *)&v737 + 1) + 8 * k);
                  objc_opt_class();
                  if (objc_opt_isKindOfClass())
                  {
                    unint64_t v3 = [(id)v3 copy];
                    -[GEOPDRawAttributeFilter addKey:]((uint64_t)v125, (void *)v3);
                  }
                }
                uint64_t v129 = [v128 countByEnumeratingWithState:&v737 objects:&v741 count:16];
              }
              while (v129);
            }
          }
        }
      }
      v132 = v125;
      int v133 = *(_DWORD *)(v732 + 772) | 0x10000000;
      *(void *)(v732 + 764) |= 0x400000000000000uLL;
      *(_DWORD *)(v732 + 772) = v133;
      objc_storeStrong((id *)(v732 + 480), v125);
    }
    if (a3) {
      v134 = @"amenitiesFilter";
    }
    else {
      v134 = @"amenities_filter";
    }
    id v135 = [v733 objectForKeyedSubscript:v134];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v136 = [GEOPDAmenitiesFilter alloc];
      if (v136)
      {
        id v137 = v135;
        v136 = [(GEOPDAmenitiesFilter *)v136 init];
        if (v136)
        {
          if (a3) {
            v138 = @"includeAmenityV2";
          }
          else {
            v138 = @"include_amenity_v2";
          }
          v139 = [v137 objectForKeyedSubscript:v138];
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            char v140 = [v139 BOOLValue];
            *(unsigned char *)&v136->_flags |= 1u;
            v136->_includeAmenityV2 = v140;
          }
        }
      }
      -[GEOPDComponentFilter setAmenitiesFilter:](v732, v136);
    }
    if (a3) {
      v141 = @"styleAttributesFilter";
    }
    else {
      v141 = @"style_attributes_filter";
    }
    id v142 = [v733 objectForKeyedSubscript:v141];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v143 = [GEOPDStyleAttributesFilter alloc];
      id v144 = v142;
      if (v143) {
        id v143 = [(GEOPDStyleAttributesFilter *)v143 init];
      }

      v145 = v143;
      *(_DWORD *)(v732 + 772) |= 0x10000040u;
      objc_storeStrong((id *)(v732 + 576), v143);
    }
    if (a3) {
      v146 = @"transitIncidentFilter";
    }
    else {
      v146 = @"transit_incident_filter";
    }
    id v147 = [v733 objectForKeyedSubscript:v146];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v148 = [GEOPDTransitIncidentFilter alloc];
      id v149 = v147;
      if (v148) {
        v148 = [(GEOPDTransitIncidentFilter *)v148 init];
      }

      id v150 = v148;
      *(_DWORD *)(v732 + 772) |= 0x10008000u;
      objc_storeStrong((id *)(v732 + 648), v148);
    }
    if (a3) {
      v151 = @"transitAssociatedInfoFilter";
    }
    else {
      v151 = @"transit_associated_info_filter";
    }
    v152 = [v733 objectForKeyedSubscript:v151];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v153 = [GEOPDTransitAssociatedInfoFilter alloc];
      id v154 = v152;
      if (v153) {
        v153 = [(GEOPDTransitAssociatedInfoFilter *)v153 init];
      }

      v155 = v153;
      *(_DWORD *)(v732 + 772) |= 0x10002000u;
      objc_storeStrong((id *)(v732 + 632), v153);
    }
    if (a3) {
      v156 = @"textBlockFilter";
    }
    else {
      v156 = @"text_block_filter";
    }
    v157 = [v733 objectForKeyedSubscript:v156];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v158 = [GEOPDTextBlockFilter alloc];
      id v159 = v157;
      if (v158) {
        v158 = [(GEOPDTextBlockFilter *)v158 init];
      }

      v160 = v158;
      *(_DWORD *)(v732 + 772) |= 0x10000200u;
      objc_storeStrong((id *)(v732 + 600), v158);
    }
    if (a3) {
      id v161 = @"factoidFilter";
    }
    else {
      id v161 = @"factoid_filter";
    }
    id v162 = [v733 objectForKeyedSubscript:v161];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v163 = [GEOPDFactoidFilter alloc];
      if (v163)
      {
        id v164 = v162;
        v163 = [(GEOPDFactoidFilter *)v163 init];
        if (v163)
        {
          if (a3) {
            v165 = @"canSupportStructuredData";
          }
          else {
            v165 = @"can_support_structured_data";
          }
          id v166 = [v164 objectForKeyedSubscript:v165];
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            char v167 = [v166 BOOLValue];
            *(unsigned char *)&v163->_flags |= 1u;
            v163->_canSupportStructuredData = v167;
          }
        }
      }
      -[GEOPDComponentFilter setFactoidFilter:](v732, v163);
    }
    if (a3) {
      id v168 = @"transitAttributionFilter";
    }
    else {
      id v168 = @"transit_attribution_filter";
    }
    id v169 = [v733 objectForKeyedSubscript:v168];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v170 = [GEOPDTransitAttributionFilter alloc];
      id v171 = v169;
      if (v170) {
        v170 = [(GEOPDTransitAttributionFilter *)v170 init];
      }

      v172 = v170;
      *(_DWORD *)(v732 + 772) |= 0x10004000u;
      objc_storeStrong((id *)(v732 + 640), v170);
    }
    if (a3) {
      id v173 = @"businessClaimFilter";
    }
    else {
      id v173 = @"business_claim_filter";
    }
    v174 = [v733 objectForKeyedSubscript:v173];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v175 = [GEOPDBusinessClaimFilter alloc];
      id v176 = v174;
      if (v175) {
        id v175 = [(GEOPDBusinessClaimFilter *)v175 init];
      }

      v177 = v175;
      int v178 = *(_DWORD *)(v732 + 772) | 0x10000000;
      *(void *)(v732 + 764) |= 0x1000uLL;
      *(_DWORD *)(v732 + 772) = v178;
      objc_storeStrong((id *)(v732 + 112), v175);
    }
    if (a3) {
      v179 = @"captionedPhotoFilter";
    }
    else {
      v179 = @"captioned_photo_filter";
    }
    id v180 = [v733 objectForKeyedSubscript:v179];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v181 = [GEOPDCaptionedPhotoFilter alloc];
      if (v181)
      {
        id v182 = v181;
        id v183 = v180;
        v184 = [(GEOPDCaptionedPhotoFilter *)v182 init];
        if (v184)
        {
          if (a3) {
            v185 = @"photoSizeFilter";
          }
          else {
            v185 = @"photo_size_filter";
          }
          v186 = [v183 objectForKeyedSubscript:v185];
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            long long v739 = 0u;
            long long v740 = 0u;
            long long v737 = 0u;
            long long v738 = 0u;
            id v187 = v186;
            uint64_t v188 = [v187 countByEnumeratingWithState:&v737 objects:&v741 count:16];
            if (v188)
            {
              uint64_t v189 = *(void *)v738;
              do
              {
                for (uint64_t m = 0; m != v188; ++m)
                {
                  if (*(void *)v738 != v189) {
                    objc_enumerationMutation(v187);
                  }
                  v191 = *(void **)(*((void *)&v737 + 1) + 8 * m);
                  objc_opt_class();
                  if (objc_opt_isKindOfClass())
                  {
                    unsigned int v736 = 0;
                    uint64_t v735 = 0;
                    _GEOPDPhotoSizeFilterValueFromDictionaryRepresentation(v191, (uint64_t)&v735);
                    unint64_t v3 = v3 & 0xFFFFFFFF00000000 | v736;
                    [(GEOPDCaptionedPhotoFilter *)(uint64_t)v184 addPhotoSizeFilter:v3];
                  }
                }
                uint64_t v188 = [v187 countByEnumeratingWithState:&v737 objects:&v741 count:16];
              }
              while (v188);
            }
          }
          if (a3) {
            v192 = @"vendorId";
          }
          else {
            v192 = @"vendor_id";
          }
          v193 = [v183 objectForKeyedSubscript:v192];
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            id v194 = (void *)[v193 copy];
            -[GEOPDCaptionedPhotoFilter setVendorId:]((uint64_t)v184, v194);
          }
        }
      }
      else
      {
        v184 = 0;
      }
      -[GEOPDComponentFilter setCaptionedPhotoFilter:](v732, v184);
    }
    if (a3) {
      v195 = @"transitInfoSnippetFilter";
    }
    else {
      v195 = @"transit_info_snippet_filter";
    }
    id v196 = [v733 objectForKeyedSubscript:v195];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v197 = [GEOPDTransitInfoSnippetFilter alloc];
      id v198 = v196;
      if (v197) {
        id v197 = [(GEOPDTransitInfoSnippetFilter *)v197 init];
      }

      v199 = v197;
      *(_DWORD *)(v732 + 772) |= 0x10020000u;
      objc_storeStrong((id *)(v732 + 664), v197);
    }
    if (a3) {
      v200 = @"externalActionFilter";
    }
    else {
      v200 = @"external_action_filter";
    }
    id v201 = [v733 objectForKeyedSubscript:v200];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v202 = [GEOPDExternalActionFilter alloc];
      if (v202)
      {
        id v203 = v202;
        id v204 = v201;
        v205 = [(GEOPDExternalActionFilter *)v203 init];
        if (v205)
        {
          if (a3) {
            v206 = @"componentType";
          }
          else {
            v206 = @"component_type";
          }
          id v722 = v204;
          v727 = [v204 objectForKeyedSubscript:v206];
          objc_opt_class();
          v207 = v727;
          if (objc_opt_isKindOfClass())
          {
            long long v739 = 0u;
            long long v740 = 0u;
            long long v737 = 0u;
            long long v738 = 0u;
            unint64_t v3 = v727;
            uint64_t v208 = [(id)v3 countByEnumeratingWithState:&v737 objects:&v741 count:16];
            if (!v208) {
              goto LABEL_426;
            }
            uint64_t v209 = *(void *)v738;
            while (1)
            {
              for (uint64_t n = 0; n != v208; ++n)
              {
                if (*(void *)v738 != v209) {
                  objc_enumerationMutation((id)v3);
                }
                id v211 = *(void **)(*((void *)&v737 + 1) + 8 * n);
                objc_opt_class();
                if (objc_opt_isKindOfClass())
                {
                  id v212 = v211;
                  if (([v212 isEqualToString:@"COMPONENT_TYPE_UNKNOWN"] & 1) == 0
                    && ([v212 isEqualToString:@"COMPONENT_TYPE_ENTITY"] & 1) == 0
                    && ([v212 isEqualToString:@"COMPONENT_TYPE_PLACE_INFO"] & 1) == 0
                    && ([v212 isEqualToString:@"COMPONENT_TYPE_ROAD_ACCESS_INFO"] & 1) == 0
                    && ([v212 isEqualToString:@"COMPONENT_TYPE_BOUNDS"] & 1) == 0
                    && ([v212 isEqualToString:@"COMPONENT_TYPE_ADDRESS"] & 1) == 0
                    && ([v212 isEqualToString:@"COMPONENT_TYPE_RATING"] & 1) == 0
                    && ([v212 isEqualToString:@"COMPONENT_TYPE_REVIEW"] & 1) == 0
                    && ([v212 isEqualToString:@"COMPONENT_TYPE_PHOTO"] & 1) == 0
                    && ([v212 isEqualToString:@"COMPONENT_TYPE_HOURS"] & 1) == 0
                    && ([v212 isEqualToString:@"COMPONENT_TYPE_TRANSIT_INFO"] & 1) == 0
                    && ([v212 isEqualToString:@"COMPONENT_TYPE_TRANSIT_SCHEDULE"] & 1) == 0
                    && ([v212 isEqualToString:@"COMPONENT_TYPE_ETA"] & 1) == 0
                    && ([v212 isEqualToString:@"COMPONENT_TYPE_FLYOVER"] & 1) == 0
                    && ([v212 isEqualToString:@"COMPONENT_TYPE_RAW_ATTRIBUTE"] & 1) == 0
                    && ([v212 isEqualToString:@"COMPONENT_TYPE_AMENITIES"] & 1) == 0
                    && ([v212 isEqualToString:@"COMPONENT_TYPE_STYLE_ATTRIBUTES"] & 1) == 0
                    && ([v212 isEqualToString:@"COMPONENT_TYPE_TRANSIT_INCIDENT"] & 1) == 0
                    && ([v212 isEqualToString:@"COMPONENT_TYPE_TRANSIT_ASSOCIATED_INFO"] & 1) == 0
                    && ([v212 isEqualToString:@"COMPONENT_TYPE_TEXT_BLOCK"] & 1) == 0
                    && ([v212 isEqualToString:@"COMPONENT_TYPE_FACTOID"] & 1) == 0
                    && ([v212 isEqualToString:@"COMPONENT_TYPE_TRANSIT_ATTRIBUTION"] & 1) == 0
                    && ([v212 isEqualToString:@"COMPONENT_TYPE_BUSINESS_CLAIM"] & 1) == 0
                    && ([v212 isEqualToString:@"COMPONENT_TYPE_CAPTIONED_PHOTO"] & 1) == 0
                    && ([v212 isEqualToString:@"COMPONENT_TYPE_TRANSIT_INFO_SNIPPET"] & 1) == 0
                    && ([v212 isEqualToString:@"COMPONENT_TYPE_EXTERNAL_ACTION"] & 1) == 0
                    && ([v212 isEqualToString:@"COMPONENT_TYPE_RESULT_SNIPPET"] & 1) == 0
                    && ([v212 isEqualToString:@"COMPONENT_TYPE_ADDRESS_OBJECT"] & 1) == 0
                    && ([v212 isEqualToString:@"COMPONENT_TYPE_SIMPLE_RESTAURANT_MENU_TEXT"] & 1) == 0
                    && ([v212 isEqualToString:@"COMPONENT_TYPE_RESTAURANT_RESERVATION_LINK"] & 1) == 0
                    && ([v212 isEqualToString:@"COMPONENT_TYPE_SPATIAL_LOOKUP_RESULT"] & 1) == 0
                    && ([v212 isEqualToString:@"COMPONENT_TYPE_TIP"] & 1) == 0
                    && ([v212 isEqualToString:@"COMPONENT_TYPE_PLACECARD_URL"] & 1) == 0
                    && ([v212 isEqualToString:@"COMPONENT_TYPE_ASSOCIATED_APP"] & 1) == 0
                    && ([v212 isEqualToString:@"COMPONENT_TYPE_MESSAGE_LINK"] & 1) == 0
                    && ([v212 isEqualToString:@"COMPONENT_TYPE_QUICK_LINK"] & 1) == 0
                    && ([v212 isEqualToString:@"COMPONENT_TYPE_RAP"] & 1) == 0
                    && ([v212 isEqualToString:@"COMPONENT_TYPE_OFFLINE_AREA"] & 1) == 0
                    && ([v212 isEqualToString:@"COMPONENT_TYPE_LOCATION_EVENT"] & 1) == 0
                    && ([v212 isEqualToString:@"COMPONENT_TYPE_SUPPORTS_OFFLINE_MAPS"] & 1) == 0
                    && ([v212 isEqualToString:@"COMPONENT_TYPE_OFFLINE_IDENTIFIER"] & 1) == 0
                    && ([v212 isEqualToString:@"COMPONENT_TYPE_OFFLINE_QUAD_NODES"] & 1) == 0
                    && ([v212 isEqualToString:@"COMPONENT_TYPE_OFFLINE_SIZE"] & 1) == 0
                    && ([v212 isEqualToString:@"COMPONENT_TYPE_VENUE_INFO"] & 1) == 0
                    && ([v212 isEqualToString:@"COMPONENT_TYPE_OFFLINE_UPDATE_MANIFEST"] & 1) == 0
                    && ([v212 isEqualToString:@"COMPONENT_TYPE_CONTAINED_PLACE"] & 1) == 0
                    && ([v212 isEqualToString:@"COMPONENT_TYPE_WIFI_FINGERPRINT"] & 1) == 0
                    && ([v212 isEqualToString:@"COMPONENT_TYPE_ICON"] & 1) == 0
                    && ([v212 isEqualToString:@"COMPONENT_TYPE_PRICE_DESCRIPTION"] & 1) == 0
                    && ([v212 isEqualToString:@"COMPONENT_TYPE_BROWSE_CATEGORIES"] & 1) == 0
                    && ([v212 isEqualToString:@"COMPONENT_TYPE_STOREFRONT"] & 1) == 0
                    && ([v212 isEqualToString:@"COMPONENT_TYPE_GROUND_VIEW_LABEL"] & 1) == 0
                    && ([v212 isEqualToString:@"COMPONENT_TYPE_ANNOTATED_ITEM_LIST"] & 1) == 0
                    && ([v212 isEqualToString:@"COMPONENT_TYPE_POI_EVENT"] & 1) == 0
                    && ([v212 isEqualToString:@"COMPONENT_TYPE_STOREFRONT_PRESENTATION"] & 1) == 0
                    && ([v212 isEqualToString:@"COMPONENT_TYPE_PLACECARD_LAYOUT"] & 1) == 0
                    && ([v212 isEqualToString:@"COMPONENT_TYPE_PROTOTYPE_CONTAINER"] & 1) == 0
                    && ([v212 isEqualToString:@"COMPONENT_TYPE_TRANSIT_VEHICLE_POSITION"] & 1) == 0
                    && ([v212 isEqualToString:@"COMPONENT_TYPE_LINKED_SERVICE"] & 1) == 0
                    && ([v212 isEqualToString:@"COMPONENT_TYPE_BUSINESS_HOURS"] & 1) == 0
                    && ([v212 isEqualToString:@"COMPONENT_TYPE_COLLECTION"] & 1) == 0
                    && ([v212 isEqualToString:@"COMPONENT_TYPE_RELATED_PLACE"] & 1) == 0
                    && ([v212 isEqualToString:@"COMPONENT_TYPE_TRANSIT_TRIP_STOP"] & 1) == 0
                    && ([v212 isEqualToString:@"COMPONENT_TYPE_TRANSIT_TRIP_STOP_TIME"] & 1) == 0
                    && ([v212 isEqualToString:@"COMPONENT_TYPE_TRANSIT_TRIP_GEOMETRY"] & 1) == 0
                    && ([v212 isEqualToString:@"COMPONENT_TYPE_PLACE_BROWSE_CATEGORIES"] & 1) == 0
                    && ([v212 isEqualToString:@"COMPONENT_TYPE_PUBLISHER"] & 1) == 0
                    && ([v212 isEqualToString:@"COMPONENT_TYPE_MINI_PLACE_BROWSE_CATEGORIES"] & 1) == 0
                    && ([v212 isEqualToString:@"COMPONENT_TYPE_PLACE_QUESTIONNAIRE"] & 1) == 0
                    && ([v212 isEqualToString:@"COMPONENT_TYPE_PLACE_COLLECTION_ITEM"] & 1) == 0
                    && ([v212 isEqualToString:@"COMPONENT_TYPE_COLLECTION_IDS"] & 1) == 0
                    && ([v212 isEqualToString:@"COMPONENT_TYPE_ISO_3166_CODE"] & 1) == 0
                    && ([v212 isEqualToString:@"COMPONENT_TYPE_VENDOR_AMENITIES"] & 1) == 0
                    && ([v212 isEqualToString:@"COMPONENT_TYPE_TRANSIT_NEARBY_SCHEDULE"] & 1) == 0
                    && ([v212 isEqualToString:@"COMPONENT_TYPE_STOREFRONT_FACES"] & 1) == 0
                    && ([v212 isEqualToString:@"COMPONENT_TYPE_GUIDE_GROUP"] & 1) == 0
                    && ([v212 isEqualToString:@"COMPONENT_TYPE_CONTAINMENT_PLACE"] & 1) == 0
                    && ([v212 isEqualToString:@"COMPONENT_TYPE_CATEGORIZED_PHOTOS"] & 1) == 0
                    && ([v212 isEqualToString:@"COMPONENT_TYPE_EXPLORE_GUIDES"] & 1) == 0
                    && ([v212 isEqualToString:@"COMPONENT_TYPE_ABOUT"] & 1) == 0
                    && ([v212 isEqualToString:@"COMPONENT_TYPE_LABEL_GEOMETRY"] & 1) == 0
                    && ([v212 isEqualToString:@"COMPONENT_TYPE_ENHANCED_PLACEMENT"] & 1) == 0
                    && ([v212 isEqualToString:@"COMPONENT_TYPE_TEMPLATE_PLACE"] & 1) == 0
                    && ([v212 isEqualToString:@"COMPONENT_TYPE_SEARCH_ENRICHMENT"] & 1) == 0
                    && ([v212 isEqualToString:@"COMPONENT_TYPE_TRANSIT_PAYMENT_METHOD_INFO"] & 1) == 0
                    && ([v212 isEqualToString:@"COMPONENT_TYPE_BUSINESS_ASSETS"] & 1) == 0
                    && ([v212 isEqualToString:@"COMPONENT_TYPE_ENRICHMENT_INFO"] & 1) == 0
                    && ([v212 isEqualToString:@"COMPONENT_TYPE_ACTION_DATA"] & 1) == 0
                    && ([v212 isEqualToString:@"COMPONENT_TYPE_ENRICHMENT_DATA"] & 1) == 0
                    && ([v212 isEqualToString:@"COMPONENT_TYPE_POI_CLAIM"] & 1) == 0
                    && ([v212 isEqualToString:@"COMPONENT_TYPE_EV_CHARGER"] & 1) == 0
                    && ([v212 isEqualToString:@"COMPONENT_TYPE_TRAIL_HEAD"] & 1) == 0
                    && ([v212 isEqualToString:@"COMPONENT_TYPE_TOOL_TIP"] & 1) == 0
                    && ([v212 isEqualToString:@"COMPONENT_TYPE_REFRESH_ID"] & 1) == 0
                    && ([v212 isEqualToString:@"COMPONENT_TYPE_ADDRESS_COMPONENTS"] & 1) == 0
                    && ([v212 isEqualToString:@"COMPONENT_TYPE_SEARCH_RESULT_PLACE_PHOTO"] & 1) == 0
                    && ([v212 isEqualToString:@"COMPONENT_TYPE_FORWARD_INFO"] & 1) == 0
                    && ([v212 isEqualToString:@"COMPONENT_TYPE_HIKE_ASSOCIATED_INFO"] & 1) == 0
                    && ([v212 isEqualToString:@"COMPONENT_TYPE_HIKE_SUMMARY"] & 1) == 0)
                  {
                    [v212 isEqualToString:@"COMPONENT_TYPE_HIKE_GEOMETRY"];
                  }
                }
                else
                {
                  objc_opt_class();
                  if ((objc_opt_isKindOfClass() & 1) == 0) {
                    continue;
                  }
                  [v211 intValue];
                }
                PBRepeatedInt32Add();
              }
              uint64_t v208 = [(id)v3 countByEnumeratingWithState:&v737 objects:&v741 count:16];
              if (!v208)
              {
LABEL_426:

                v207 = v727;
                break;
              }
            }
          }

          id v204 = v722;
        }
      }
      else
      {
        v205 = 0;
      }
      v213 = v205;
      int v214 = *(_DWORD *)(v732 + 772) | 0x10000000;
      *(void *)(v732 + 764) |= 0x4000000uLL;
      *(_DWORD *)(v732 + 772) = v214;
      objc_storeStrong((id *)(v732 + 224), v205);
    }
    if (a3) {
      id v215 = @"resultSnippetFilter";
    }
    else {
      id v215 = @"result_snippet_filter";
    }
    v728 = [v733 objectForKeyedSubscript:v215];
    objc_opt_class();
    v216 = v728;
    if (objc_opt_isKindOfClass())
    {
      id v217 = [GEOPDResultSnippetFilter alloc];
      if (v217)
      {
        id v218 = v217;
        id v219 = v728;
        uint64_t v220 = [(GEOPDResultSnippetFilter *)v218 init];
        if (v220)
        {
          if (a3) {
            v221 = @"maxChildPlaces";
          }
          else {
            v221 = @"max_child_places";
          }
          id v723 = v219;
          id v222 = [v219 objectForKeyedSubscript:v221];
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            int v223 = [v222 intValue];
            *(unsigned char *)(v220 + 52) |= 2u;
            *(_DWORD *)(v220 + 44) = v223;
          }

          if (a3) {
            id v224 = @"supportChildItems";
          }
          else {
            id v224 = @"support_child_items";
          }
          id v225 = [v219 objectForKeyedSubscript:v224];
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            char v226 = [v225 BOOLValue];
            *(unsigned char *)(v220 + 52) |= 4u;
            *(unsigned char *)(v220 + 48) = v226;
          }

          if (a3) {
            v227 = @"maxChildItems";
          }
          else {
            v227 = @"max_child_items";
          }
          v228 = [v219 objectForKeyedSubscript:v227];
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            int v229 = [v228 intValue];
            *(unsigned char *)(v220 + 52) |= 1u;
            *(_DWORD *)(v220 + 40) = v229;
          }

          if (a3) {
            v230 = @"supportedChildAction";
          }
          else {
            v230 = @"supported_child_action";
          }
          v719 = [v219 objectForKeyedSubscript:v230];
          objc_opt_class();
          id v231 = v719;
          if (objc_opt_isKindOfClass())
          {
            long long v739 = 0u;
            long long v740 = 0u;
            long long v737 = 0u;
            long long v738 = 0u;
            unint64_t v3 = v719;
            uint64_t v232 = [(id)v3 countByEnumeratingWithState:&v737 objects:&v741 count:16];
            if (!v232) {
              goto LABEL_477;
            }
            uint64_t v233 = *(void *)v738;
            while (1)
            {
              for (iuint64_t i = 0; ii != v232; ++ii)
              {
                if (*(void *)v738 != v233) {
                  objc_enumerationMutation((id)v3);
                }
                v235 = *(void **)(*((void *)&v737 + 1) + 8 * ii);
                objc_opt_class();
                if (objc_opt_isKindOfClass())
                {
                  id v236 = v235;
                  if (([v236 isEqualToString:@"CHILD_ACTION_TYPE_UNKNOWN"] & 1) == 0
                    && ([v236 isEqualToString:@"CHILD_ACTION_TYPE_DIRECTIONS"] & 1) == 0
                    && ([v236 isEqualToString:@"CHILD_ACTION_TYPE_FLYOVER"] & 1) == 0
                    && ([v236 isEqualToString:@"CHILD_ACTION_TYPE_SEARCH"] & 1) == 0
                    && ([v236 isEqualToString:@"CHILD_ACTION_TYPE_LOOK_AROUND"] & 1) == 0
                    && ([v236 isEqualToString:@"CHILD_ACTION_TYPE_CALL"] & 1) == 0
                    && ([v236 isEqualToString:@"CHILD_ACTION_TYPE_WEBSITE"] & 1) == 0
                    && ([v236 isEqualToString:@"CHILD_ACTION_TYPE_GUIDES"] & 1) == 0)
                  {
                    [v236 isEqualToString:@"CHILD_ACTION_TYPE_DOWNLOAD_OFFLINE_MAP"];
                  }
                }
                else
                {
                  objc_opt_class();
                  if ((objc_opt_isKindOfClass() & 1) == 0) {
                    continue;
                  }
                  [v235 intValue];
                }
                PBRepeatedInt32Add();
              }
              uint64_t v232 = [(id)v3 countByEnumeratingWithState:&v737 objects:&v741 count:16];
              if (!v232)
              {
LABEL_477:

                id v231 = v719;
                break;
              }
            }
          }

          id v219 = v723;
        }
      }
      else
      {
        uint64_t v220 = 0;
      }
      -[GEOPDComponentFilter setResultSnippetFilter:](v732, (void *)v220);

      v216 = v728;
    }

    if (a3) {
      v237 = @"addressObjectFilter";
    }
    else {
      v237 = @"address_object_filter";
    }
    v238 = objc_msgSend(v733, "objectForKeyedSubscript:", v237, v719);
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v239 = [GEOPDAddressObjectFilter alloc];
      if (v239)
      {
        v240 = v239;
        id v241 = v238;
        v242 = [(GEOPDAddressObjectFilter *)v240 init];
        if (v242)
        {
          if (a3) {
            id v243 = @"libraryVersion";
          }
          else {
            id v243 = @"library_version";
          }
          id v244 = [v241 objectForKeyedSubscript:v243];
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            long long v739 = 0u;
            long long v740 = 0u;
            long long v737 = 0u;
            long long v738 = 0u;
            id v245 = v244;
            uint64_t v246 = [v245 countByEnumeratingWithState:&v737 objects:&v741 count:16];
            if (v246)
            {
              uint64_t v247 = *(void *)v738;
              do
              {
                for (juint64_t j = 0; jj != v246; ++jj)
                {
                  if (*(void *)v738 != v247) {
                    objc_enumerationMutation(v245);
                  }
                  unint64_t v3 = *(void *)(*((void *)&v737 + 1) + 8 * jj);
                  objc_opt_class();
                  if (objc_opt_isKindOfClass())
                  {
                    unint64_t v3 = [(id)v3 copy];
                    -[GEOPDAddressObjectFilter addLibraryVersion:]((uint64_t)v242, (void *)v3);
                  }
                }
                uint64_t v246 = [v245 countByEnumeratingWithState:&v737 objects:&v741 count:16];
              }
              while (v246);
            }
          }
          if (a3) {
            v249 = @"enableLocation";
          }
          else {
            v249 = @"enable_location";
          }
          id v250 = [v241 objectForKeyedSubscript:v249];
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            char v251 = [v250 BOOLValue];
            *(unsigned char *)&v242->_flags |= 1u;
            v242->_enableLocatiouint64_t n = v251;
          }
        }
      }
      else
      {
        v242 = 0;
      }
      -[GEOPDComponentFilter setAddressObjectFilter:](v732, v242);
    }
    if (a3) {
      v252 = @"simpleRestaurantMenuTextFilter";
    }
    else {
      v252 = @"simple_restaurant_menu_text_filter";
    }
    v253 = [v733 objectForKeyedSubscript:v252];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v254 = [GEOPDSimpleRestaurantMenuTextFilter alloc];
      id v255 = v253;
      if (v254) {
        v254 = [(GEOPDSimpleRestaurantMenuTextFilter *)v254 init];
      }

      v256 = v254;
      *(_DWORD *)(v732 + 772) |= 0x10000002u;
      objc_storeStrong((id *)(v732 + 536), v254);
    }
    if (a3) {
      id v257 = @"restaurantReservationLinkFilter";
    }
    else {
      id v257 = @"restaurant_reservation_link_filter";
    }
    id v258 = [v733 objectForKeyedSubscript:v257];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v259 = [GEOPDRestaurantReservationLinkFilter alloc];
      id v260 = v258;
      if (v259) {
        v259 = [(GEOPDRestaurantReservationLinkFilter *)v259 init];
      }

      -[GEOPDComponentFilter setRestaurantReservationLinkFilter:](v732, v259);
    }

    if (a3) {
      v261 = @"spatialLookupFilter";
    }
    else {
      v261 = @"spatial_lookup_filter";
    }
    id v262 = [v733 objectForKeyedSubscript:v261];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v263 = [GEOPDSpatialLookupFilter alloc];
      id v264 = v262;
      if (v263) {
        v263 = [(GEOPDSpatialLookupFilter *)v263 init];
      }

      id v265 = v263;
      *(_DWORD *)(v732 + 772) |= 0x10000004u;
      objc_storeStrong((id *)(v732 + 544), v263);
    }
    if (a3) {
      v266 = @"tipFilter";
    }
    else {
      v266 = @"tip_filter";
    }
    v267 = [v733 objectForKeyedSubscript:v266];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v268 = [GEOPDTipFilter alloc];
      if (v268)
      {
        id v269 = v267;
        v268 = [(GEOPDTipFilter *)v268 init];
        if (v268)
        {
          if (a3) {
            v270 = @"photoSizeFilter";
          }
          else {
            v270 = @"photo_size_filter";
          }
          id v271 = [v269 objectForKeyedSubscript:v270];
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            long long v739 = 0u;
            long long v740 = 0u;
            long long v737 = 0u;
            long long v738 = 0u;
            id v272 = v271;
            uint64_t v273 = [v272 countByEnumeratingWithState:&v737 objects:&v741 count:16];
            if (v273)
            {
              uint64_t v274 = *(void *)v738;
              do
              {
                for (kuint64_t k = 0; kk != v273; ++kk)
                {
                  if (*(void *)v738 != v274) {
                    objc_enumerationMutation(v272);
                  }
                  id v276 = *(void **)(*((void *)&v737 + 1) + 8 * kk);
                  objc_opt_class();
                  if (objc_opt_isKindOfClass())
                  {
                    unsigned int v736 = 0;
                    uint64_t v735 = 0;
                    _GEOPDPhotoSizeFilterValueFromDictionaryRepresentation(v276, (uint64_t)&v735);
                    unint64_t v3 = v3 & 0xFFFFFFFF00000000 | v736;
                    [(GEOPDTipFilter *)(uint64_t)v268 addPhotoSizeFilter:v3];
                  }
                }
                uint64_t v273 = [v272 countByEnumeratingWithState:&v737 objects:&v741 count:16];
              }
              while (v273);
            }
          }
        }
      }
      -[GEOPDComponentFilter setTipFilter:](v732, v268);
    }
    if (a3) {
      v277 = @"placecardUrlFilter";
    }
    else {
      v277 = @"placecard_url_filter";
    }
    id v278 = [v733 objectForKeyedSubscript:v277];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v279 = [GEOPDPlacecardURLFilter alloc];
      id v280 = v278;
      if (v279) {
        id v279 = [(GEOPDPlacecardURLFilter *)v279 init];
      }

      v281 = v279;
      int v282 = *(_DWORD *)(v732 + 772) | 0x10000000;
      *(void *)(v732 + 764) |= 0x2000000000000uLL;
      *(_DWORD *)(v732 + 772) = v282;
      objc_storeStrong((id *)(v732 + 408), v279);
    }
    if (a3) {
      id v283 = @"associatedAppFilter";
    }
    else {
      id v283 = @"associated_app_filter";
    }
    v284 = [v733 objectForKeyedSubscript:v283];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v285 = [GEOPDAssociatedAppFilter alloc];
      id v286 = v284;
      if (v285) {
        id v285 = [(GEOPDAssociatedAppFilter *)v285 init];
      }

      v287 = v285;
      int v288 = *(_DWORD *)(v732 + 772) | 0x10000000;
      *(void *)(v732 + 764) |= 0x200uLL;
      *(_DWORD *)(v732 + 772) = v288;
      objc_storeStrong((id *)(v732 + 88), v285);
    }
    if (a3) {
      v289 = @"messageLinkFilter";
    }
    else {
      v289 = @"message_link_filter";
    }
    id v290 = [v733 objectForKeyedSubscript:v289];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v291 = [GEOPDMessageLinkFilter alloc];
      id v292 = v290;
      if (v291) {
        v291 = [(GEOPDMessageLinkFilter *)v291 init];
      }

      id v293 = v291;
      int v294 = *(_DWORD *)(v732 + 772) | 0x10000000;
      *(void *)(v732 + 764) |= 0x20000000000uLL;
      *(_DWORD *)(v732 + 772) = v294;
      objc_storeStrong((id *)(v732 + 344), v291);
    }
    if (a3) {
      v295 = @"quickLinkFilter";
    }
    else {
      v295 = @"quick_link_filter";
    }
    v296 = [v733 objectForKeyedSubscript:v295];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v297 = [GEOPDQuickLinkFilter alloc];
      if (v297)
      {
        id v298 = v296;
        id v297 = [(GEOPDQuickLinkFilter *)v297 init];
        if (v297)
        {
          if (a3) {
            id v299 = @"quickLinkItemsCount";
          }
          else {
            id v299 = @"quick_link_items_count";
          }
          id v300 = [v298 objectForKeyedSubscript:v299];
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            int v301 = [v300 intValue];
            *(unsigned char *)&v297->_flags |= 1u;
            v297->_quickLinkItemsCount = v301;
          }
        }
      }
      -[GEOPDComponentFilter setQuickLinkFilter:](v732, v297);
    }
    if (a3) {
      v302 = @"rapFilter";
    }
    else {
      v302 = @"rap_filter";
    }
    v303 = [v733 objectForKeyedSubscript:v302];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v304 = -[GEOACResult _initWithDictionary:isJSON:]([GEOPDRapFilter alloc], v303);
      id v305 = v304;
      int v306 = *(_DWORD *)(v732 + 772) | 0x10000000;
      *(void *)(v732 + 764) |= 0x100000000000000uLL;
      *(_DWORD *)(v732 + 772) = v306;
      objc_storeStrong((id *)(v732 + 464), v304);
    }
    if (a3) {
      id v307 = @"offlineAreaFilter";
    }
    else {
      id v307 = @"offline_area_filter";
    }
    v308 = [v733 objectForKeyedSubscript:v307];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v309 = [GEOPDOfflineAreaFilter alloc];
      id v310 = v308;
      if (v309) {
        v309 = [(GEOPDOfflineAreaFilter *)v309 init];
      }

      -[GEOPDComponentFilter setOfflineAreaFilter:](v732, v309);
    }

    if (a3) {
      id v311 = @"locationEventFilter";
    }
    else {
      id v311 = @"location_event_filter";
    }
    v312 = [v733 objectForKeyedSubscript:v311];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v313 = [GEOPDLocationEventFilter alloc];
      id v314 = v312;
      if (v313) {
        id v313 = [(GEOPDLocationEventFilter *)v313 init];
      }

      v315 = v313;
      int v316 = *(_DWORD *)(v732 + 772) | 0x10000000;
      *(void *)(v732 + 764) |= 0x10000000000uLL;
      *(_DWORD *)(v732 + 772) = v316;
      objc_storeStrong((id *)(v732 + 336), v313);
    }
    if (a3) {
      v317 = @"supportsOfflineMapsFilter";
    }
    else {
      v317 = @"supports_offline_maps_filter";
    }
    id v318 = [v733 objectForKeyedSubscript:v317];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v319 = [GEOPDSupportsOfflineMapsFilter alloc];
      id v320 = v318;
      if (v319) {
        v319 = [(GEOPDSupportsOfflineMapsFilter *)v319 init];
      }

      -[GEOPDComponentFilter setSupportsOfflineMapsFilter:](v732, v319);
    }

    if (a3) {
      id v321 = @"venueInfoFilter";
    }
    else {
      id v321 = @"venue_info_filter";
    }
    v322 = [v733 objectForKeyedSubscript:v321];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v323 = -[GEOACResult _initWithDictionary:isJSON:]([GEOPDVenueInfoFilter alloc], v322);
      id v324 = v323;
      *(_DWORD *)(v732 + 772) |= 0x12000000u;
      objc_storeStrong((id *)(v732 + 728), v323);
    }
    if (a3) {
      id v325 = @"containedPlaceFilter";
    }
    else {
      id v325 = @"contained_place_filter";
    }
    v326 = [v733 objectForKeyedSubscript:v325];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v327 = [GEOPDContainedPlaceFilter alloc];
      id v328 = v326;
      if (v327) {
        id v327 = [(GEOPDContainedPlaceFilter *)v327 init];
      }

      v329 = v327;
      int v330 = *(_DWORD *)(v732 + 772) | 0x10000000;
      *(void *)(v732 + 764) |= 0x20000uLL;
      *(_DWORD *)(v732 + 772) = v330;
      objc_storeStrong((id *)(v732 + 152), v327);
    }
    if (a3) {
      v331 = @"wifiFingerprintFilter";
    }
    else {
      v331 = @"wifi_fingerprint_filter";
    }
    id v332 = [v733 objectForKeyedSubscript:v331];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v333 = [GEOPDWifiFingerprintFilter alloc];
      id v334 = v332;
      if (v333) {
        v333 = [(GEOPDWifiFingerprintFilter *)v333 init];
      }

      id v335 = v333;
      *(_DWORD *)(v732 + 772) |= 0x18000000u;
      objc_storeStrong((id *)(v732 + 744), v333);
    }
    if (a3) {
      v336 = @"iconFilter";
    }
    else {
      v336 = @"icon_filter";
    }
    v337 = [v733 objectForKeyedSubscript:v336];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v338 = [GEOPDIconFilter alloc];
      id v339 = v337;
      if (v338) {
        v338 = [(GEOPDIconFilter *)v338 init];
      }

      v340 = v338;
      int v341 = *(_DWORD *)(v732 + 772) | 0x10000000;
      *(void *)(v732 + 764) |= 0x1000000000uLL;
      *(_DWORD *)(v732 + 772) = v341;
      objc_storeStrong((id *)(v732 + 304), v338);
    }
    if (a3) {
      id v342 = @"priceDescriptionFilter";
    }
    else {
      id v342 = @"price_description_filter";
    }
    v343 = [v733 objectForKeyedSubscript:v342];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v344 = [GEOPDPriceDescriptionFilter alloc];
      id v345 = v343;
      if (v344) {
        v344 = [(GEOPDPriceDescriptionFilter *)v344 init];
      }

      id v346 = v344;
      int v347 = *(_DWORD *)(v732 + 772) | 0x10000000;
      *(void *)(v732 + 764) |= 0x10000000000000uLL;
      *(_DWORD *)(v732 + 772) = v347;
      objc_storeStrong((id *)(v732 + 432), v344);
    }
    if (a3) {
      id v348 = @"browseCategoriesFilter";
    }
    else {
      id v348 = @"browse_categories_filter";
    }
    id v349 = [v733 objectForKeyedSubscript:v348];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v350 = [GEOPDBrowseCategoriesFilter alloc];
      if (v350) {
        v351 = -[GEOPDBrowseCategoriesFilter _initWithDictionary:isJSON:](v350, v349, a3);
      }
      else {
        v351 = 0;
      }
      v352 = v351;
      int v353 = *(_DWORD *)(v732 + 772) | 0x10000000;
      *(void *)(v732 + 764) |= 0x800uLL;
      *(_DWORD *)(v732 + 772) = v353;
      objc_storeStrong((id *)(v732 + 104), v351);
    }
    if (a3) {
      v354 = @"storefrontFilter";
    }
    else {
      v354 = @"storefront_filter";
    }
    id v355 = [v733 objectForKeyedSubscript:v354];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v356 = -[GEOACResult _initWithDictionary:isJSON:]([GEOPDStorefrontFilter alloc], v355);
      -[GEOPDComponentFilter setStorefrontFilter:](v732, v356);
    }
    if (a3) {
      v357 = @"groundViewLabelFilter";
    }
    else {
      v357 = @"ground_view_label_filter";
    }
    v358 = [v733 objectForKeyedSubscript:v357];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v359 = [GEOPDGroundViewLabelFilter alloc];
      id v360 = v358;
      if (v359) {
        v359 = [(GEOPDGroundViewLabelFilter *)v359 init];
      }

      v361 = v359;
      int v362 = *(_DWORD *)(v732 + 772) | 0x10000000;
      *(void *)(v732 + 764) |= 0x40000000uLL;
      *(_DWORD *)(v732 + 772) = v362;
      objc_storeStrong((id *)(v732 + 256), v359);
    }
    if (a3) {
      id v363 = @"annotatedItemListFilter";
    }
    else {
      id v363 = @"annotated_item_list_filter";
    }
    v364 = [v733 objectForKeyedSubscript:v363];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v365 = [GEOPDAnnotatedItemListFilter alloc];
      if (v365)
      {
        id v366 = v364;
        v365 = [(GEOPDAnnotatedItemListFilter *)v365 init];
        if (v365)
        {
          if (a3) {
            id v367 = @"photoSizeFilter";
          }
          else {
            id v367 = @"photo_size_filter";
          }
          v368 = [v366 objectForKeyedSubscript:v367];
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            long long v739 = 0u;
            long long v740 = 0u;
            long long v737 = 0u;
            long long v738 = 0u;
            id v369 = v368;
            uint64_t v370 = [v369 countByEnumeratingWithState:&v737 objects:&v741 count:16];
            if (v370)
            {
              uint64_t v371 = *(void *)v738;
              do
              {
                for (muint64_t m = 0; mm != v370; ++mm)
                {
                  if (*(void *)v738 != v371) {
                    objc_enumerationMutation(v369);
                  }
                  v373 = *(void **)(*((void *)&v737 + 1) + 8 * mm);
                  objc_opt_class();
                  if (objc_opt_isKindOfClass())
                  {
                    unsigned int v736 = 0;
                    uint64_t v735 = 0;
                    _GEOPDPhotoSizeFilterValueFromDictionaryRepresentation(v373, (uint64_t)&v735);
                    unint64_t v3 = v3 & 0xFFFFFFFF00000000 | v736;
                    [(GEOPDAnnotatedItemListFilter *)(uint64_t)v365 addPhotoSizeFilter:v3];
                  }
                }
                uint64_t v370 = [v369 countByEnumeratingWithState:&v737 objects:&v741 count:16];
              }
              while (v370);
            }
          }
        }
      }
      -[GEOPDComponentFilter setAnnotatedItemListFilter:](v732, v365);
    }
    if (a3) {
      id v374 = @"poiEventFilter";
    }
    else {
      id v374 = @"poi_event_filter";
    }
    v375 = [v733 objectForKeyedSubscript:v374];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v376 = [GEOPDPoiEventFilter alloc];
      if (v376)
      {
        id v377 = v375;
        id v376 = [(GEOPDPoiEventFilter *)v376 init];
        if (v376)
        {
          if (a3) {
            v378 = @"includeEventCategoryId";
          }
          else {
            v378 = @"include_event_category_id";
          }
          v379 = [v377 objectForKeyedSubscript:v378];
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            char v380 = [v379 BOOLValue];
            *(unsigned char *)&v376->_flags |= 1u;
            v376->_includeEventCategoryId = v380;
          }
        }
      }
      id v381 = v376;
      int v382 = *(_DWORD *)(v732 + 772) | 0x10000000;
      *(void *)(v732 + 764) |= 0x8000000000000uLL;
      *(_DWORD *)(v732 + 772) = v382;
      objc_storeStrong((id *)(v732 + 424), v376);
    }
    if (a3) {
      v383 = @"storefrontPresentationFilter";
    }
    else {
      v383 = @"storefront_presentation_filter";
    }
    v384 = [v733 objectForKeyedSubscript:v383];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v385 = -[GEOACResult _initWithDictionary:isJSON:]([GEOPDStorefrontPresentationFilter alloc], v384);
      -[GEOPDComponentFilter setStorefrontPresentationFilter:](v732, v385);
    }
    if (a3) {
      id v386 = @"placecardLayoutConfigurationFilter";
    }
    else {
      id v386 = @"placecard_layout_configuration_filter";
    }
    v387 = [v733 objectForKeyedSubscript:v386];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v388 = [GEOPDPlacecardLayoutConfigurationFilter alloc];
      id v389 = v387;
      if (v388) {
        v388 = [(GEOPDPlacecardLayoutConfigurationFilter *)v388 init];
      }

      v390 = v388;
      int v391 = *(_DWORD *)(v732 + 772) | 0x10000000;
      *(void *)(v732 + 764) |= 0x1000000000000uLL;
      *(_DWORD *)(v732 + 772) = v391;
      objc_storeStrong((id *)(v732 + 400), v388);
    }
    if (a3) {
      v392 = @"protoTypeContainerFilter";
    }
    else {
      v392 = @"proto_type_container_filter";
    }
    id v393 = [v733 objectForKeyedSubscript:v392];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v394 = [GEOPDPrototypeContainerFilter alloc];
      id v395 = v393;
      if (v394) {
        id v394 = [(GEOPDPrototypeContainerFilter *)v394 init];
      }

      v396 = v394;
      int v397 = *(_DWORD *)(v732 + 772) | 0x10000000;
      *(void *)(v732 + 764) |= 0x20000000000000uLL;
      *(_DWORD *)(v732 + 772) = v397;
      objc_storeStrong((id *)(v732 + 440), v394);
    }
    if (a3) {
      id v398 = @"transitVehiclePositionFilter";
    }
    else {
      id v398 = @"transit_vehicle_position_filter";
    }
    v399 = [v733 objectForKeyedSubscript:v398];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v400 = [GEOPDVehiclePositionFilter alloc];
      id v401 = v399;
      if (v400) {
        id v400 = [(GEOPDVehiclePositionFilter *)v400 init];
      }

      v402 = v400;
      *(_DWORD *)(v732 + 772) |= 0x10800000u;
      objc_storeStrong((id *)(v732 + 712), v400);
    }
    if (a3) {
      v403 = @"linkedServiceFilter";
    }
    else {
      v403 = @"linked_service_filter";
    }
    v404 = [v733 objectForKeyedSubscript:v403];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v405 = [GEOPDLinkedServiceFilter alloc];
      id v406 = v404;
      if (v405) {
        id v405 = [(GEOPDLinkedServiceFilter *)v405 init];
      }

      id v407 = v405;
      int v408 = *(_DWORD *)(v732 + 772) | 0x10000000;
      *(void *)(v732 + 764) |= 0x8000000000uLL;
      *(_DWORD *)(v732 + 772) = v408;
      objc_storeStrong((id *)(v732 + 328), v405);
    }
    if (a3) {
      v409 = @"businessHoursFilter";
    }
    else {
      v409 = @"business_hours_filter";
    }
    v410 = [v733 objectForKeyedSubscript:v409];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v411 = [GEOPDBusinessHoursFilter alloc];
      id v412 = v410;
      if (v411) {
        v411 = [(GEOPDBusinessHoursFilter *)v411 init];
      }

      v413 = v411;
      int v414 = *(_DWORD *)(v732 + 772) | 0x10000000;
      *(void *)(v732 + 764) |= 0x2000uLL;
      *(_DWORD *)(v732 + 772) = v414;
      objc_storeStrong((id *)(v732 + 120), v411);
    }
    if (a3) {
      id v415 = @"placeCollectionFilter";
    }
    else {
      id v415 = @"place_collection_filter";
    }
    v416 = [v733 objectForKeyedSubscript:v415];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v417 = [GEOPDPlaceCollectionFilter alloc];
      if (v417)
      {
        v418 = v417;
        id v419 = v416;
        uint64_t v420 = [(GEOPDPlaceCollectionFilter *)v418 init];
        if (v420)
        {
          if (a3) {
            id v421 = @"expectedResultCount";
          }
          else {
            id v421 = @"expected_result_count";
          }
          id v422 = [v419 objectForKeyedSubscript:v421];
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            int v423 = [v422 unsignedIntValue];
            *(unsigned char *)(v420 + 28) |= 1u;
            *(_DWORD *)(v420 + 16) = v423;
          }

          if (a3) {
            v424 = @"partiallyClientize";
          }
          else {
            v424 = @"partially_clientize";
          }
          v425 = [v419 objectForKeyedSubscript:v424];
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            char v426 = [v425 BOOLValue];
            *(unsigned char *)(v420 + 28) |= 0x40u;
            *(unsigned char *)(v420 + 25) = v426;
          }

          if (a3) {
            v427 = @"isCollectionView";
          }
          else {
            v427 = @"is_collection_view";
          }
          id v428 = [v419 objectForKeyedSubscript:v427];
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            char v429 = [v428 BOOLValue];
            *(unsigned char *)(v420 + 28) |= 0x10u;
            *(unsigned char *)(v420 + 23) = v429;
          }

          if (a3) {
            v430 = @"enableCollectionItemDescription";
          }
          else {
            v430 = @"enable_collection_item_description";
          }
          v431 = [v419 objectForKeyedSubscript:v430];
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            char v432 = [v431 BOOLValue];
            *(unsigned char *)(v420 + 28) |= 2u;
            *(unsigned char *)(v420 + 20) = v432;
          }

          if (a3) {
            id v433 = @"overrideSuppress";
          }
          else {
            id v433 = @"override_suppress";
          }
          id v434 = [v419 objectForKeyedSubscript:v433];
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            char v435 = [v434 BOOLValue];
            *(unsigned char *)(v420 + 28) |= 0x20u;
            *(unsigned char *)(v420 + 24) = v435;
          }

          if (a3) {
            v436 = @"enableMediaLink";
          }
          else {
            v436 = @"enable_media_link";
          }
          v437 = [v419 objectForKeyedSubscript:v436];
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            char v438 = [v437 BOOLValue];
            *(unsigned char *)(v420 + 28) |= 4u;
            *(unsigned char *)(v420 + 21) = v438;
          }

          if (a3) {
            v439 = @"includePlaceCollectionItemPhotos";
          }
          else {
            v439 = @"include_place_collection_item_photos";
          }
          id v440 = [v419 objectForKeyedSubscript:v439];
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            char v441 = [v440 BOOLValue];
            *(unsigned char *)(v420 + 28) |= 8u;
            *(unsigned char *)(v420 + 22) = v441;
          }
        }
      }
      else
      {
        uint64_t v420 = 0;
      }
      -[GEOPDComponentFilter setPlaceCollectionFilter:](v732, (void *)v420);
    }
    if (a3) {
      v442 = @"relatedPlaceFilter";
    }
    else {
      v442 = @"related_place_filter";
    }
    v443 = [v733 objectForKeyedSubscript:v442];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v444 = [GEOPDRelatedPlaceFilter alloc];
      if (v444)
      {
        id v445 = v443;
        v444 = [(GEOPDRelatedPlaceFilter *)v444 init];
        if (v444)
        {
          if (a3) {
            v446 = @"relatedPlaceTemplateItemCount";
          }
          else {
            v446 = @"related_place_template_item_count";
          }
          id v447 = [v445 objectForKeyedSubscript:v446];
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            int v448 = [v447 intValue];
            *(unsigned char *)&v444->_flags |= 1u;
            v444->_relatedPlaceTemplateItemCount = v448;
          }

          if (a3) {
            v449 = @"canSupportTemplateModule";
          }
          else {
            v449 = @"can_support_template_module";
          }
          v450 = [v445 objectForKeyedSubscript:v449];
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            char v451 = [v450 BOOLValue];
            *(unsigned char *)&v444->_flags |= 2u;
            v444->_canSupportTemplateModule = v451;
          }
        }
      }
      -[GEOPDComponentFilter setRelatedPlaceFilter:](v732, v444);
    }
    if (a3) {
      id v452 = @"transitTripStopFilter";
    }
    else {
      id v452 = @"transit_trip_stop_filter";
    }
    v453 = [v733 objectForKeyedSubscript:v452];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v454 = [GEOPDTransitTripStopFilter alloc];
      id v455 = v453;
      if (v454) {
        id v454 = [(GEOPDTransitTripStopFilter *)v454 init];
      }

      v456 = v454;
      *(_DWORD *)(v732 + 772) |= 0x10200000u;
      objc_storeStrong((id *)(v732 + 696), v454);
    }
    if (a3) {
      v457 = @"transitTripStopTimeFilter";
    }
    else {
      v457 = @"transit_trip_stop_time_filter";
    }
    v458 = [v733 objectForKeyedSubscript:v457];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v459 = [GEOPDTransitTripStopTimeFilter alloc];
      if (v459)
      {
        v460 = v459;
        id v461 = v458;
        uint64_t v462 = [(GEOPDTransitTripStopTimeFilter *)v460 init];
        if (v462)
        {
          if (a3) {
            v463 = @"departurePredicateCountdown";
          }
          else {
            v463 = @"departure_predicate_countdown";
          }
          v464 = [v461 objectForKeyedSubscript:v463];
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            v465 = [GEOPDDeparturePredicate alloc];
            if (v465) {
              id v466 = (void *)-[GEOPDDeparturePredicate _initWithDictionary:isJSON:](v465, v464, a3);
            }
            else {
              id v466 = 0;
            }
            -[GEOPDTransitTripStopTimeFilter setDeparturePredicateCountdown:](v462, v466);
          }
          if (a3) {
            v467 = @"departurePredicateStamp";
          }
          else {
            v467 = @"departure_predicate_stamp";
          }
          id v468 = [v461 objectForKeyedSubscript:v467];
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            id v469 = [GEOPDDeparturePredicate alloc];
            if (v469) {
              v470 = (void *)-[GEOPDDeparturePredicate _initWithDictionary:isJSON:](v469, v468, a3);
            }
            else {
              v470 = 0;
            }
            -[GEOPDTransitTripStopTimeFilter setDeparturePredicateStamp:](v462, v470);
          }
          if (a3) {
            v471 = @"operatingHoursRange";
          }
          else {
            v471 = @"operating_hours_range";
          }
          v472 = [v461 objectForKeyedSubscript:v471];
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            int v742 = 0;
            uint64_t v741 = 0;
            _GEOPDTimeRangeFromDictionaryRepresentation(v472, (uint64_t)&v741, a3);
            uint64_t v473 = v741;
            int v474 = v742;
            *(unsigned char *)(v462 + 68) |= 0x20u;
            *(unsigned char *)(v462 + 68) |= 1u;
            *(void *)(v462 + 40) = v473;
            *(_DWORD *)(v462 + 48) = v474;
          }

          if (a3) {
            id v475 = @"includeRealTimeDepartures";
          }
          else {
            id v475 = @"include_real_time_departures";
          }
          id v476 = [v461 objectForKeyedSubscript:v475];
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            char v477 = [v476 BOOLValue];
            *(unsigned char *)(v462 + 68) |= 0x20u;
            *(unsigned char *)(v462 + 68) |= 2u;
            *(unsigned char *)(v462 + 64) = v477;
          }
        }
      }
      else
      {
        uint64_t v462 = 0;
      }
      -[GEOPDComponentFilter setTransitTripStopTimeFilter:](v732, (void *)v462);
    }
    if (a3) {
      v478 = @"transitTripGeometryFilter";
    }
    else {
      v478 = @"transit_trip_geometry_filter";
    }
    v479 = [v733 objectForKeyedSubscript:v478];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v480 = [GEOPDTransitTripGeometryFilter alloc];
      id v481 = v479;
      if (v480) {
        id v480 = [(GEOPDTransitTripGeometryFilter *)v480 init];
      }

      v482 = v480;
      *(_DWORD *)(v732 + 772) |= 0x10100000u;
      objc_storeStrong((id *)(v732 + 688), v480);
    }
    if (a3) {
      v483 = @"walletCategoryInformationFilter";
    }
    else {
      v483 = @"wallet_category_information_filter";
    }
    v484 = [v733 objectForKeyedSubscript:v483];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v485 = [GEOPDWalletCategoryInformationFilter alloc];
      id v486 = v484;
      if (v485) {
        id v485 = [(GEOPDWalletCategoryInformationFilter *)v485 init];
      }

      id v487 = v485;
      *(_DWORD *)(v732 + 772) |= 0x14000000u;
      objc_storeStrong((id *)(v732 + 736), v485);
    }
    if (a3) {
      id v488 = @"publisherFilter";
    }
    else {
      id v488 = @"publisher_filter";
    }
    v489 = [v733 objectForKeyedSubscript:v488];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v490 = [GEOPDPublisherFilter alloc];
      if (v490)
      {
        id v491 = v489;
        v490 = [(GEOPDPublisherFilter *)v490 init];
        if (v490)
        {
          if (a3) {
            id v492 = @"partiallyClientize";
          }
          else {
            id v492 = @"partially_clientize";
          }
          v493 = [v491 objectForKeyedSubscript:v492];
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            char v494 = [v493 BOOLValue];
            *(unsigned char *)&v490->_flags |= 1u;
            v490->_partiallyClientize = v494;
          }
        }
      }
      -[GEOPDComponentFilter setPublisherFilter:](v732, v490);
    }
    if (a3) {
      id v495 = @"placeQuestionnaireFilter";
    }
    else {
      id v495 = @"place_questionnaire_filter";
    }
    v496 = [v733 objectForKeyedSubscript:v495];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v497 = [GEOPDPlaceQuestionnaireFilter alloc];
      id v498 = v496;
      if (v497) {
        v497 = [(GEOPDPlaceQuestionnaireFilter *)v497 init];
      }

      id v499 = v497;
      int v500 = *(_DWORD *)(v732 + 772) | 0x10000000;
      *(void *)(v732 + 764) |= 0x800000000000uLL;
      *(_DWORD *)(v732 + 772) = v500;
      objc_storeStrong((id *)(v732 + 392), v497);
    }
    if (a3) {
      id v501 = @"placeCollectionItemFilter";
    }
    else {
      id v501 = @"place_collection_item_filter";
    }
    id v502 = [v733 objectForKeyedSubscript:v501];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v503 = [GEOPDPlaceCollectionItemFilter alloc];
      if (v503)
      {
        id v504 = v502;
        v503 = [(GEOPDPlaceCollectionItemFilter *)v503 init];
        if (v503)
        {
          if (a3) {
            v505 = @"itemId";
          }
          else {
            v505 = @"item_id";
          }
          id v506 = [v504 objectForKeyedSubscript:v505];
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            long long v739 = 0u;
            long long v740 = 0u;
            long long v737 = 0u;
            long long v738 = 0u;
            id v507 = v506;
            uint64_t v508 = [v507 countByEnumeratingWithState:&v737 objects:&v741 count:16];
            if (v508)
            {
              uint64_t v509 = *(void *)v738;
              do
              {
                for (nuint64_t n = 0; nn != v508; ++nn)
                {
                  if (*(void *)v738 != v509) {
                    objc_enumerationMutation(v507);
                  }
                  uint64_t v511 = *(void *)(*((void *)&v737 + 1) + 8 * nn);
                  objc_opt_class();
                  if (objc_opt_isKindOfClass())
                  {
                    v512 = [GEOPDMapsIdentifier alloc];
                    if (a3) {
                      id v513 = [(GEOPDMapsIdentifier *)v512 initWithJSON:v511];
                    }
                    else {
                      id v513 = [(GEOPDMapsIdentifier *)v512 initWithDictionary:v511];
                    }
                    v514 = v513;
                    -[GEOPDPlaceCollectionItemFilter addItemId:]((uint64_t)v503, v513);
                  }
                }
                uint64_t v508 = [v507 countByEnumeratingWithState:&v737 objects:&v741 count:16];
              }
              while (v508);
            }
          }
        }
      }
      -[GEOPDComponentFilter setPlaceCollectionItemFilter:](v732, v503);
    }
    if (a3) {
      id v515 = @"collectionIdsFilter";
    }
    else {
      id v515 = @"collection_ids_filter";
    }
    id v516 = [v733 objectForKeyedSubscript:v515];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v517 = [GEOPDCollectionIdsFilter alloc];
      id v518 = v516;
      if (v517) {
        v517 = [(GEOPDCollectionIdsFilter *)v517 init];
      }

      v519 = v517;
      int v520 = *(_DWORD *)(v732 + 772) | 0x10000000;
      *(void *)(v732 + 764) |= 0x10000uLL;
      *(_DWORD *)(v732 + 772) = v520;
      objc_storeStrong((id *)(v732 + 144), v517);
    }
    if (a3) {
      v521 = @"iso3166CodeFilter";
    }
    else {
      v521 = @"iso_3166_code_filter";
    }
    id v522 = [v733 objectForKeyedSubscript:v521];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v523 = [GEOPDISO3166CodeFilter alloc];
      id v524 = v522;
      if (v523) {
        id v523 = [(GEOPDISO3166CodeFilter *)v523 init];
      }

      v525 = v523;
      int v526 = *(_DWORD *)(v732 + 772) | 0x10000000;
      *(void *)(v732 + 764) |= 0x2000000000uLL;
      *(_DWORD *)(v732 + 772) = v526;
      objc_storeStrong((id *)(v732 + 312), v523);
    }
    if (a3) {
      id v527 = @"vendorAmenitiesFilter";
    }
    else {
      id v527 = @"vendor_amenities_filter";
    }
    v528 = [v733 objectForKeyedSubscript:v527];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v529 = [GEOPDVendorAmenitiesFilter alloc];
      id v530 = v528;
      if (v529) {
        id v529 = [(GEOPDVendorAmenitiesFilter *)v529 init];
      }

      v531 = v529;
      *(_DWORD *)(v732 + 772) |= 0x11000000u;
      objc_storeStrong((id *)(v732 + 720), v529);
    }
    if (a3) {
      v532 = @"storefrontFacesFilter";
    }
    else {
      v532 = @"storefront_faces_filter";
    }
    v533 = [v733 objectForKeyedSubscript:v532];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v534 = -[GEOACResult _initWithDictionary:isJSON:]([GEOPDStorefrontFacesFilter alloc], v533);
      id v535 = v534;
      *(_DWORD *)(v732 + 772) |= 0x10000008u;
      objc_storeStrong((id *)(v732 + 552), v534);
    }
    if (a3) {
      id v536 = @"guideGroupFilter";
    }
    else {
      id v536 = @"guide_group_filter";
    }
    id v537 = [v733 objectForKeyedSubscript:v536];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v538 = [GEOPDGuideGroupFilter alloc];
      id v539 = v537;
      if (v538) {
        v538 = [(GEOPDGuideGroupFilter *)v538 init];
      }

      v540 = v538;
      int v541 = *(_DWORD *)(v732 + 772) | 0x10000000;
      *(void *)(v732 + 764) |= 0x80000000uLL;
      *(_DWORD *)(v732 + 772) = v541;
      objc_storeStrong((id *)(v732 + 264), v538);
    }
    if (a3) {
      v542 = @"containmentPlaceFilter";
    }
    else {
      v542 = @"containment_place_filter";
    }
    id v543 = [v733 objectForKeyedSubscript:v542];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v544 = [GEOPDContainmentPlaceFilter alloc];
      id v545 = v543;
      if (v544) {
        id v544 = [(GEOPDContainmentPlaceFilter *)v544 init];
      }

      v546 = v544;
      int v547 = *(_DWORD *)(v732 + 772) | 0x10000000;
      *(void *)(v732 + 764) |= 0x40000uLL;
      *(_DWORD *)(v732 + 772) = v547;
      objc_storeStrong((id *)(v732 + 160), v544);
    }
    if (a3) {
      id v548 = @"categorizedPhotosFilter";
    }
    else {
      id v548 = @"categorized_photos_filter";
    }
    v729 = [v733 objectForKeyedSubscript:v548];
    objc_opt_class();
    v549 = v729;
    if (objc_opt_isKindOfClass())
    {
      id v550 = [GEOPDCategorizedPhotosFilter alloc];
      if (v550)
      {
        id v551 = v550;
        id v552 = v729;
        uint64_t v553 = [(GEOPDCategorizedPhotosFilter *)v551 init];
        if (v553)
        {
          if (a3) {
            v554 = @"photoSizeFilter";
          }
          else {
            v554 = @"photo_size_filter";
          }
          v724 = v552;
          v720 = [v552 objectForKeyedSubscript:v554];
          objc_opt_class();
          id v555 = v720;
          if (objc_opt_isKindOfClass())
          {
            long long v739 = 0u;
            long long v740 = 0u;
            long long v737 = 0u;
            long long v738 = 0u;
            id v556 = v720;
            uint64_t v557 = [v556 countByEnumeratingWithState:&v737 objects:&v741 count:16];
            if (v557)
            {
              uint64_t v558 = *(void *)v738;
              do
              {
                for (uint64_t i1 = 0; i1 != v557; ++i1)
                {
                  if (*(void *)v738 != v558) {
                    objc_enumerationMutation(v556);
                  }
                  v560 = *(void **)(*((void *)&v737 + 1) + 8 * i1);
                  objc_opt_class();
                  if (objc_opt_isKindOfClass())
                  {
                    unsigned int v736 = 0;
                    uint64_t v735 = 0;
                    _GEOPDPhotoSizeFilterValueFromDictionaryRepresentation(v560, (uint64_t)&v735);
                    uint64_t v561 = v735;
                    unsigned int v562 = v736;
                    os_unfair_lock_lock((os_unfair_lock_t)(v553 + 64));
                    if ((*(unsigned char *)(v553 + 80) & 0x20) == 0)
                    {
                      v563 = *(void **)(v553 + 8);
                      if (v563)
                      {
                        id v564 = v563;
                        objc_sync_enter(v564);
                        GEOPDCategorizedPhotosFilterReadSpecified(v553, *(void *)(v553 + 8), (int *)&_readPhotoSizeFilters_tags_1326);
                        objc_sync_exit(v564);
                      }
                    }
                    os_unfair_lock_unlock((os_unfair_lock_t)(v553 + 64));
                    if (-[GEOPDCategorizedPhotosFilter _reservePhotoSizeFilters:](v553, 1uLL))
                    {
                      uint64_t v565 = *(void *)(v553 + 24) + 12 * *(void *)(v553 + 32);
                      *(void *)uint64_t v565 = v561;
                      *(_DWORD *)(v565 + 8) = v562;
                      ++*(void *)(v553 + 32);
                    }
                    os_unfair_lock_lock_with_options();
                    *(unsigned char *)(v553 + 80) |= 0x20u;
                    os_unfair_lock_unlock((os_unfair_lock_t)(v553 + 64));
                    *(unsigned char *)(v553 + 80) |= 0x80u;
                  }
                }
                uint64_t v557 = [v556 countByEnumeratingWithState:&v737 objects:&v741 count:16];
              }
              while (v557);
            }

            id v555 = v720;
          }

          if (a3) {
            v566 = @"categoryId";
          }
          else {
            v566 = @"category_id";
          }
          v567 = objc_msgSend(v552, "objectForKeyedSubscript:", v566, v720);
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            v568 = (void *)[v567 copy];
            -[GEOPDCategorizedPhotosFilter setCategoryId:](v553, v568);
          }
          if (a3) {
            id v569 = @"startIndex";
          }
          else {
            id v569 = @"start_index";
          }
          v570 = [v724 objectForKeyedSubscript:v569];
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            int v571 = [v570 intValue];
            *(unsigned char *)(v553 + 80) |= 0x80u;
            *(unsigned char *)(v553 + 80) |= 2u;
            *(_DWORD *)(v553 + 72) = v571;
          }

          id v572 = [v724 objectForKeyedSubscript:@"count"];
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            int v573 = [v572 intValue];
            *(unsigned char *)(v553 + 80) |= 0x80u;
            *(unsigned char *)(v553 + 80) |= 1u;
            *(_DWORD *)(v553 + 68) = v573;
          }

          if (a3) {
            v574 = @"includeCoverPhoto";
          }
          else {
            v574 = @"include_cover_photo";
          }
          v575 = [v724 objectForKeyedSubscript:v574];
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            char v576 = [v575 BOOLValue];
            *(unsigned char *)(v553 + 80) |= 0x80u;
            *(unsigned char *)(v553 + 80) |= 8u;
            *(unsigned char *)(v553 + 77) = v576;
          }

          if (a3) {
            v577 = @"coverPhotoFirst";
          }
          else {
            v577 = @"cover_photo_first";
          }
          id v578 = [v724 objectForKeyedSubscript:v577];
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            char v579 = [v578 BOOLValue];
            *(unsigned char *)(v553 + 80) |= 0x80u;
            *(unsigned char *)(v553 + 80) |= 4u;
            *(unsigned char *)(v553 + 76) = v579;
          }

          id v552 = v724;
        }
      }
      else
      {
        uint64_t v553 = 0;
      }
      -[GEOPDComponentFilter setCategorizedPhotosFilter:](v732, (void *)v553);

      v549 = v729;
    }

    if (a3) {
      v580 = @"exploreGuidesFilter";
    }
    else {
      v580 = @"explore_guides_filter";
    }
    v581 = [v733 objectForKeyedSubscript:v580];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v582 = [GEOPDExploreGuidesFilter alloc];
      id v583 = v581;
      if (v582) {
        v582 = [(GEOPDExploreGuidesFilter *)v582 init];
      }

      v584 = v582;
      int v585 = *(_DWORD *)(v732 + 772) | 0x10000000;
      *(void *)(v732 + 764) |= 0x2000000uLL;
      *(_DWORD *)(v732 + 772) = v585;
      objc_storeStrong((id *)(v732 + 216), v582);
    }
    if (a3) {
      id v586 = @"aboutFilter";
    }
    else {
      id v586 = @"about_filter";
    }
    v587 = [v733 objectForKeyedSubscript:v586];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v588 = [GEOPDAboutFilter alloc];
      id v589 = v587;
      if (v588) {
        v588 = [(GEOPDAboutFilter *)v588 init];
      }

      id v590 = v588;
      int v591 = *(_DWORD *)(v732 + 772) | 0x10000000;
      *(void *)(v732 + 764) |= 2uLL;
      *(_DWORD *)(v732 + 772) = v591;
      objc_storeStrong((id *)(v732 + 24), v588);
    }
    if (a3) {
      id v592 = @"labelGeometryFilter";
    }
    else {
      id v592 = @"label_geometry_filter";
    }
    id v593 = [v733 objectForKeyedSubscript:v592];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v594 = [GEOPDLabelGeometryFilter alloc];
      id v595 = v593;
      if (v594) {
        v594 = [(GEOPDLabelGeometryFilter *)v594 init];
      }

      v596 = v594;
      int v597 = *(_DWORD *)(v732 + 772) | 0x10000000;
      *(void *)(v732 + 764) |= 0x4000000000uLL;
      *(_DWORD *)(v732 + 772) = v597;
      objc_storeStrong((id *)(v732 + 320), v594);
    }
    if (a3) {
      v598 = @"enhancedPlacementFilter";
    }
    else {
      v598 = @"enhanced_placement_filter";
    }
    id v599 = [v733 objectForKeyedSubscript:v598];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v600 = [GEOPDEnhancedPlacementFilter alloc];
      id v601 = v599;
      if (v600) {
        id v600 = [(GEOPDEnhancedPlacementFilter *)v600 init];
      }

      v602 = v600;
      int v603 = *(_DWORD *)(v732 + 772) | 0x10000000;
      *(void *)(v732 + 764) |= 0x80000uLL;
      *(_DWORD *)(v732 + 772) = v603;
      objc_storeStrong((id *)(v732 + 168), v600);
    }
    if (a3) {
      id v604 = @"templatePlaceFilter";
    }
    else {
      id v604 = @"template_place_filter";
    }
    v605 = [v733 objectForKeyedSubscript:v604];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v606 = [GEOPDTemplatePlaceFilter alloc];
      id v607 = v605;
      if (v606) {
        id v606 = [(GEOPDTemplatePlaceFilter *)v606 init];
      }

      v608 = v606;
      *(_DWORD *)(v732 + 772) |= 0x10000100u;
      objc_storeStrong((id *)(v732 + 592), v606);
    }
    if (a3) {
      v609 = @"transitPaymentMethodInfoFilter";
    }
    else {
      v609 = @"transit_payment_method_info_filter";
    }
    v610 = [v733 objectForKeyedSubscript:v609];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v611 = [GEOPDTransitPaymentMethodInfoFilter alloc];
      id v612 = v610;
      if (v611) {
        id v611 = [(GEOPDTransitPaymentMethodInfoFilter *)v611 init];
      }

      id v613 = v611;
      *(_DWORD *)(v732 + 772) |= 0x10040000u;
      objc_storeStrong((id *)(v732 + 672), v611);
    }
    if (a3) {
      id v614 = @"enrichmentInfoFilter";
    }
    else {
      id v614 = @"enrichment_info_filter";
    }
    v615 = [v733 objectForKeyedSubscript:v614];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v616 = [GEOPDEnrichmentInfoFilter alloc];
      id v617 = v615;
      if (v616) {
        v616 = [(GEOPDEnrichmentInfoFilter *)v616 init];
      }

      id v618 = v616;
      int v619 = *(_DWORD *)(v732 + 772) | 0x10000000;
      *(void *)(v732 + 764) |= 0x200000uLL;
      *(_DWORD *)(v732 + 772) = v619;
      objc_storeStrong((id *)(v732 + 184), v616);
    }
    if (a3) {
      v620 = @"actionDataFilter";
    }
    else {
      v620 = @"action_data_filter";
    }
    v730 = [v733 objectForKeyedSubscript:v620];
    objc_opt_class();
    v621 = v730;
    if (objc_opt_isKindOfClass())
    {
      v622 = [GEOPDActionDataFilter alloc];
      if (v622)
      {
        id v623 = v622;
        id v624 = v730;
        v625 = [(GEOPDActionDataFilter *)v623 init];
        if (v625)
        {
          if (a3) {
            v626 = @"linkType";
          }
          else {
            v626 = @"link_type";
          }
          v725 = objc_msgSend(v624, "objectForKeyedSubscript:", v626, v624);
          objc_opt_class();
          v627 = v725;
          if (objc_opt_isKindOfClass())
          {
            long long v739 = 0u;
            long long v740 = 0u;
            long long v737 = 0u;
            long long v738 = 0u;
            id v628 = v725;
            uint64_t v629 = [v628 countByEnumeratingWithState:&v737 objects:&v741 count:16];
            if (!v629) {
              goto LABEL_1074;
            }
            uint64_t v630 = *(void *)v738;
            while (1)
            {
              for (uint64_t i2 = 0; i2 != v629; ++i2)
              {
                if (*(void *)v738 != v630) {
                  objc_enumerationMutation(v628);
                }
                v632 = *(void **)(*((void *)&v737 + 1) + 8 * i2);
                objc_opt_class();
                if (objc_opt_isKindOfClass())
                {
                  id v633 = v632;
                  if (([v633 isEqualToString:@"LINK_TYPE_UNKNOWN"] & 1) == 0
                    && ([v633 isEqualToString:@"LINK_TYPE_QUICK_LINK"] & 1) == 0
                    && ([v633 isEqualToString:@"LINK_TYPE_APP_CLIP"] & 1) == 0
                    && ([v633 isEqualToString:@"LINK_TYPE_EXTENSION"] & 1) == 0)
                  {
                    [v633 isEqualToString:@"LINK_TYPE_WEB_LINK"];
                  }
                }
                else
                {
                  objc_opt_class();
                  if ((objc_opt_isKindOfClass() & 1) == 0) {
                    continue;
                  }
                  [v632 intValue];
                }
                PBRepeatedInt32Add();
              }
              uint64_t v629 = [v628 countByEnumeratingWithState:&v737 objects:&v741 count:16];
              if (!v629)
              {
LABEL_1074:

                v627 = v725;
                break;
              }
            }
          }

          id v624 = v721;
        }
      }
      else
      {
        v625 = 0;
      }
      v634 = v625;
      int v635 = *(_DWORD *)(v732 + 772) | 0x10000000;
      *(void *)(v732 + 764) |= 8uLL;
      *(_DWORD *)(v732 + 772) = v635;
      objc_storeStrong((id *)(v732 + 40), v625);

      v621 = v730;
    }

    if (a3) {
      v636 = @"enrichmentDataFilter";
    }
    else {
      v636 = @"enrichment_data_filter";
    }
    v637 = [v733 objectForKeyedSubscript:v636];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v638 = [GEOPDEnrichmentDataFilter alloc];
      id v639 = v637;
      if (v638) {
        v638 = [(GEOPDEnrichmentDataFilter *)v638 init];
      }

      v640 = v638;
      int v641 = *(_DWORD *)(v732 + 772) | 0x10000000;
      *(void *)(v732 + 764) |= 0x100000uLL;
      *(_DWORD *)(v732 + 772) = v641;
      objc_storeStrong((id *)(v732 + 176), v638);
    }
    if (a3) {
      v642 = @"poiClaimFilter";
    }
    else {
      v642 = @"poi_claim_filter";
    }
    v643 = [v733 objectForKeyedSubscript:v642];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v644 = [GEOPDPOIClaimFilter alloc];
      id v645 = v643;
      if (v644) {
        v644 = [(GEOPDPOIClaimFilter *)v644 init];
      }

      v646 = v644;
      int v647 = *(_DWORD *)(v732 + 772) | 0x10000000;
      *(void *)(v732 + 764) |= 0x4000000000000uLL;
      *(_DWORD *)(v732 + 772) = v647;
      objc_storeStrong((id *)(v732 + 416), v644);
    }
    if (a3) {
      v648 = @"evChargerFilter";
    }
    else {
      v648 = @"ev_charger_filter";
    }
    v649 = [v733 objectForKeyedSubscript:v648];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v650 = [GEOPDEVChargerFilter alloc];
      id v651 = v649;
      if (v650) {
        v650 = [(GEOPDEVChargerFilter *)v650 init];
      }

      v652 = v650;
      int v653 = *(_DWORD *)(v732 + 772) | 0x10000000;
      *(void *)(v732 + 764) |= 0x1000000uLL;
      *(_DWORD *)(v732 + 772) = v653;
      objc_storeStrong((id *)(v732 + 208), v650);
    }
    if (a3) {
      v654 = @"trailHeadFilter";
    }
    else {
      v654 = @"trail_head_filter";
    }
    v655 = [v733 objectForKeyedSubscript:v654];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v656 = [GEOPDTrailHeadFilter alloc];
      if (v656)
      {
        id v657 = v655;
        v656 = [(GEOPDTrailHeadFilter *)v656 init];
        if (v656)
        {
          if (a3) {
            v658 = @"factCount";
          }
          else {
            v658 = @"fact_count";
          }
          v659 = [v657 objectForKeyedSubscript:v658];
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            unsigned int v660 = [v659 unsignedIntValue];
            *(unsigned char *)&v656->_flags |= 1u;
            v656->_factCount = v660;
          }
        }
      }
      v661 = v656;
      *(_DWORD *)(v732 + 772) |= 0x10001000u;
      objc_storeStrong((id *)(v732 + 624), v656);
    }
    if (a3) {
      v662 = @"refreshIdFilter";
    }
    else {
      v662 = @"refresh_id_filter";
    }
    v663 = [v733 objectForKeyedSubscript:v662];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v664 = [GEOPDRefreshIdFilter alloc];
      id v665 = v663;
      if (v664) {
        v664 = [(GEOPDRefreshIdFilter *)v664 init];
      }

      v666 = v664;
      int v667 = *(_DWORD *)(v732 + 772) | 0x10000000;
      *(void *)(v732 + 764) |= 0x800000000000000uLL;
      *(_DWORD *)(v732 + 772) = v667;
      objc_storeStrong((id *)(v732 + 488), v664);
    }
    if (a3) {
      v668 = @"addressComponentsFilter";
    }
    else {
      v668 = @"address_components_filter";
    }
    v669 = [v733 objectForKeyedSubscript:v668];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v670 = [GEOPDAddressWithComponentsFilter alloc];
      id v671 = v669;
      if (v670) {
        v670 = [(GEOPDAddressWithComponentsFilter *)v670 init];
      }

      v672 = v670;
      int v673 = *(_DWORD *)(v732 + 772) | 0x10000000;
      *(void *)(v732 + 764) |= 0x10uLL;
      *(_DWORD *)(v732 + 772) = v673;
      objc_storeStrong((id *)(v732 + 48), v670);
    }
    if (a3) {
      v674 = @"searchResultPlacePhotoFilter";
    }
    else {
      v674 = @"search_result_place_photo_filter";
    }
    v675 = [v733 objectForKeyedSubscript:v674];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v676 = [GEOPDSearchResultPlacePhotoFilter alloc];
      if (v676)
      {
        id v677 = v675;
        v676 = [(GEOPDSearchResultPlacePhotoFilter *)v676 init];
        if (v676)
        {
          if (a3) {
            v678 = @"photoSizeFilter";
          }
          else {
            v678 = @"photo_size_filter";
          }
          id v726 = v677;
          v731 = [v677 objectForKeyedSubscript:v678];
          objc_opt_class();
          v679 = v731;
          if (objc_opt_isKindOfClass())
          {
            long long v739 = 0u;
            long long v740 = 0u;
            long long v737 = 0u;
            long long v738 = 0u;
            id v680 = v731;
            uint64_t v681 = [v680 countByEnumeratingWithState:&v737 objects:&v741 count:16];
            if (v681)
            {
              uint64_t v682 = *(void *)v738;
              do
              {
                for (uint64_t i3 = 0; i3 != v681; ++i3)
                {
                  if (*(void *)v738 != v682) {
                    objc_enumerationMutation(v680);
                  }
                  v684 = *(void **)(*((void *)&v737 + 1) + 8 * i3);
                  objc_opt_class();
                  if (objc_opt_isKindOfClass())
                  {
                    unsigned int v736 = 0;
                    uint64_t v735 = 0;
                    _GEOPDPhotoSizeFilterValueFromDictionaryRepresentation(v684, (uint64_t)&v735);
                    uint64_t v685 = v735;
                    unsigned int v686 = v736;
                    if (-[GEOPDSearchResultPlacePhotoFilter _reservePhotoSizeFilters:]((uint64_t)v676, 1uLL))
                    {
                      uint64_t v687 = (uint64_t)&v676->_photoSizeFilters[v676->_photoSizeFiltersCount];
                      *(void *)uint64_t v687 = v685;
                      *(_DWORD *)(v687 + 8) = v686;
                      ++v676->_photoSizeFiltersCount;
                    }
                  }
                }
                uint64_t v681 = [v680 countByEnumeratingWithState:&v737 objects:&v741 count:16];
              }
              while (v681);
            }

            v679 = v731;
          }

          id v677 = v726;
        }
      }
      v688 = v676;
      *(_DWORD *)(v732 + 772) |= 0x10000001u;
      objc_storeStrong((id *)(v732 + 528), v676);
    }
    if (a3) {
      v689 = @"forwardInfoFilter";
    }
    else {
      v689 = @"forward_info_filter";
    }
    v690 = [v733 objectForKeyedSubscript:v689];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v691 = [GEOPDForwardInfoFilter alloc];
      id v692 = v690;
      if (v691) {
        v691 = [(GEOPDForwardInfoFilter *)v691 init];
      }

      -[GEOPDComponentFilter setForwardInfoFilter:](v732, v691);
    }

    if (a3) {
      v693 = @"hikeAssociatedInfoFilter";
    }
    else {
      v693 = @"hike_associated_info_filter";
    }
    v694 = [v733 objectForKeyedSubscript:v693];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v695 = [GEOPDHikeAssociatedInfoFilter alloc];
      id v696 = v694;
      if (v695) {
        v695 = [(GEOPDHikeAssociatedInfoFilter *)v695 init];
      }

      v697 = v695;
      int v698 = *(_DWORD *)(v732 + 772) | 0x10000000;
      *(void *)(v732 + 764) |= 0x100000000uLL;
      *(_DWORD *)(v732 + 772) = v698;
      objc_storeStrong((id *)(v732 + 272), v695);
    }
    if (a3) {
      v699 = @"hikeSummaryFilter";
    }
    else {
      v699 = @"hike_summary_filter";
    }
    v700 = [v733 objectForKeyedSubscript:v699];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v701 = [GEOPDHikeSummaryFilter alloc];
      id v702 = v700;
      if (v701) {
        v701 = [(GEOPDHikeSummaryFilter *)v701 init];
      }

      v703 = v701;
      int v704 = *(_DWORD *)(v732 + 772) | 0x10000000;
      *(void *)(v732 + 764) |= 0x400000000uLL;
      *(_DWORD *)(v732 + 772) = v704;
      objc_storeStrong((id *)(v732 + 288), v701);
    }
    if (a3) {
      v705 = @"hikeGeometryFilter";
    }
    else {
      v705 = @"hike_geometry_filter";
    }
    v706 = [v733 objectForKeyedSubscript:v705];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v707 = [GEOPDHikeGeometryFilter alloc];
      id v708 = v706;
      if (v707) {
        v707 = [(GEOPDHikeGeometryFilter *)v707 init];
      }

      v709 = v707;
      int v710 = *(_DWORD *)(v732 + 772) | 0x10000000;
      *(void *)(v732 + 764) |= 0x200000000uLL;
      *(_DWORD *)(v732 + 772) = v710;
      objc_storeStrong((id *)(v732 + 280), v707);
    }
    if (a3) {
      v711 = @"toolTipFilter";
    }
    else {
      v711 = @"tool_tip_filter";
    }
    v712 = [v733 objectForKeyedSubscript:v711];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v713 = [GEOPDTooltipFilter alloc];
      if (v713)
      {
        id v714 = v712;
        v713 = [(GEOPDTooltipFilter *)v713 init];
        if (v713)
        {
          if (a3) {
            v715 = @"isHikingSuggestion";
          }
          else {
            v715 = @"is_hiking_suggestion";
          }
          v716 = [v714 objectForKeyedSubscript:v715];
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            char v717 = [v716 BOOLValue];
            *(unsigned char *)&v713->_flags |= 1u;
            v713->_isHikingSuggestiouint64_t n = v717;
          }
        }
      }
      -[GEOPDComponentFilter setToolTipFilter:](v732, v713);
    }
  }

  return v732;
}

- (BOOL)readFrom:(id)a3
{
  return GEOPDComponentFilterReadAllFrom((uint64_t)self, a3, 0);
}

- (uint64_t)hasGreenTeaWithValue:(uint64_t)result
{
  if (result)
  {
    uint64_t v3 = result;
    -[GEOPDComponentFilter _readPlaceCollectionItemFilter](result);
    uint64_t v4 = *(void *)(v3 + 376);
    return -[GEOPDPlaceCollectionItemFilter hasGreenTeaWithValue:](v4, a2);
  }
  return result;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  os_unfair_lock_lock(&self->_readerLock);
  reader = self->_reader;
  if (!reader) {
    goto LABEL_5;
  }
  id v7 = reader;
  objc_sync_enter(v7);
  if ((*((_DWORD *)&self->_flags + 2) & 0x10000000) != 0)
  {
    objc_sync_exit(v7);

LABEL_5:
    os_unfair_lock_unlock(&self->_readerLock);
    -[GEOPDComponentFilter readAll:]((uint64_t)self, 0);
    id v8 = [(GEOPDEntityFilter *)self->_entityFilter copyWithZone:a3];
    id v9 = *(void **)(v5 + 192);
    *(void *)(v5 + 192) = v8;

    id v10 = [(GEOPDPlaceInfoFilter *)self->_placeInfoFilter copyWithZone:a3];
    id v11 = *(void **)(v5 + 384);
    *(void *)(v5 + 384) = v10;

    id v12 = [(GEOPDRoadAccessInfoFilter *)self->_accessInfoFilter copyWithZone:a3];
    id v13 = *(void **)(v5 + 32);
    *(void *)(v5 + 32) = v12;

    id v14 = [(GEOPDBoundsFilter *)self->_boundsFilter copyWithZone:a3];
    char v15 = *(void **)(v5 + 96);
    *(void *)(v5 + 96) = v14;

    id v16 = [(GEOPDAddressFilter *)self->_addressFilter copyWithZone:a3];
    long long v17 = *(void **)(v5 + 56);
    *(void *)(v5 + 56) = v16;

    id v18 = [(GEOPDRatingFilter *)self->_ratingFilter copyWithZone:a3];
    double v19 = *(void **)(v5 + 472);
    *(void *)(v5 + 472) = v18;

    id v20 = [(GEOPDReviewFilter *)self->_reviewFilter copyWithZone:a3];
    char v21 = *(void **)(v5 + 520);
    *(void *)(v5 + 520) = v20;

    id v22 = [(GEOPDPhotoFilter *)self->_photoFilter copyWithZone:a3];
    unint64_t v23 = *(void **)(v5 + 360);
    *(void *)(v5 + 360) = v22;

    id v24 = [(GEOPDHoursFilter *)self->_hoursFilter copyWithZone:a3];
    id v25 = *(void **)(v5 + 296);
    *(void *)(v5 + 296) = v24;

    id v26 = [(GEOPDTransitInfoFilter *)self->_transitInfoFilter copyWithZone:a3];
    int v27 = *(void **)(v5 + 656);
    *(void *)(v5 + 656) = v26;

    id v28 = [(GEOPDTransitScheduleFilter *)self->_transitScheduleFilter copyWithZone:a3];
    unint64_t v29 = *(void **)(v5 + 680);
    *(void *)(v5 + 680) = v28;

    id v30 = [(GEOPDETAFilter *)self->_etaFilter copyWithZone:a3];
    id v31 = *(void **)(v5 + 200);
    *(void *)(v5 + 200) = v30;

    id v32 = [(GEOPDFlyoverFilter *)self->_flyoverFilter copyWithZone:a3];
    int v33 = *(void **)(v5 + 240);
    *(void *)(v5 + 240) = v32;

    id v34 = [(GEOPDRawAttributeFilter *)self->_rawAttributeFilter copyWithZone:a3];
    id v35 = *(void **)(v5 + 480);
    *(void *)(v5 + 480) = v34;

    id v36 = [(GEOPDAmenitiesFilter *)self->_amenitiesFilter copyWithZone:a3];
    id v37 = *(void **)(v5 + 72);
    *(void *)(v5 + 72) = v36;

    id v38 = [(GEOPDStyleAttributesFilter *)self->_styleAttributesFilter copyWithZone:a3];
    int v39 = *(void **)(v5 + 576);
    *(void *)(v5 + 576) = v38;

    id v40 = [(GEOPDTransitIncidentFilter *)self->_transitIncidentFilter copyWithZone:a3];
    id v41 = *(void **)(v5 + 648);
    *(void *)(v5 + 648) = v40;

    id v42 = [(GEOPDTransitAssociatedInfoFilter *)self->_transitAssociatedInfoFilter copyWithZone:a3];
    id v43 = *(void **)(v5 + 632);
    *(void *)(v5 + 632) = v42;

    id v44 = [(GEOPDTextBlockFilter *)self->_textBlockFilter copyWithZone:a3];
    int v45 = *(void **)(v5 + 600);
    *(void *)(v5 + 600) = v44;

    id v46 = [(GEOPDFactoidFilter *)self->_factoidFilter copyWithZone:a3];
    unint64_t v47 = *(void **)(v5 + 232);
    *(void *)(v5 + 232) = v46;

    id v48 = [(GEOPDTransitAttributionFilter *)self->_transitAttributionFilter copyWithZone:a3];
    id v49 = *(void **)(v5 + 640);
    *(void *)(v5 + 640) = v48;

    id v50 = [(GEOPDBusinessClaimFilter *)self->_businessClaimFilter copyWithZone:a3];
    int v51 = *(void **)(v5 + 112);
    *(void *)(v5 + 112) = v50;

    id v52 = [(GEOPDCaptionedPhotoFilter *)self->_captionedPhotoFilter copyWithZone:a3];
    id v53 = *(void **)(v5 + 128);
    *(void *)(v5 + 128) = v52;

    id v54 = [(GEOPDTransitInfoSnippetFilter *)self->_transitInfoSnippetFilter copyWithZone:a3];
    id v55 = *(void **)(v5 + 664);
    *(void *)(v5 + 664) = v54;

    id v56 = [(GEOPDExternalActionFilter *)self->_externalActionFilter copyWithZone:a3];
    unint64_t v57 = *(void **)(v5 + 224);
    *(void *)(v5 + 224) = v56;

    id v58 = [(GEOPDResultSnippetFilter *)self->_resultSnippetFilter copyWithZone:a3];
    unint64_t v59 = *(void **)(v5 + 512);
    *(void *)(v5 + 512) = v58;

    id v60 = [(GEOPDAddressObjectFilter *)self->_addressObjectFilter copyWithZone:a3];
    uint64_t v61 = *(void **)(v5 + 64);
    *(void *)(v5 + 64) = v60;

    id v62 = [(GEOPDSimpleRestaurantMenuTextFilter *)self->_simpleRestaurantMenuTextFilter copyWithZone:a3];
    id v63 = *(void **)(v5 + 536);
    *(void *)(v5 + 536) = v62;

    id v64 = [(GEOPDRestaurantReservationLinkFilter *)self->_restaurantReservationLinkFilter copyWithZone:a3];
    unint64_t v65 = *(void **)(v5 + 504);
    *(void *)(v5 + 504) = v64;

    id v66 = [(GEOPDSpatialLookupFilter *)self->_spatialLookupFilter copyWithZone:a3];
    char v67 = *(void **)(v5 + 544);
    *(void *)(v5 + 544) = v66;

    id v68 = [(GEOPDTipFilter *)self->_tipFilter copyWithZone:a3];
    id v69 = *(void **)(v5 + 608);
    *(void *)(v5 + 608) = v68;

    id v70 = [(GEOPDPlacecardURLFilter *)self->_placecardUrlFilter copyWithZone:a3];
    id v71 = *(void **)(v5 + 408);
    *(void *)(v5 + 408) = v70;

    id v72 = [(GEOPDAssociatedAppFilter *)self->_associatedAppFilter copyWithZone:a3];
    unint64_t v73 = *(void **)(v5 + 88);
    *(void *)(v5 + 88) = v72;

    id v74 = [(GEOPDMessageLinkFilter *)self->_messageLinkFilter copyWithZone:a3];
    uint64_t v75 = *(void **)(v5 + 344);
    *(void *)(v5 + 344) = v74;

    id v76 = [(GEOPDQuickLinkFilter *)self->_quickLinkFilter copyWithZone:a3];
    id v77 = *(void **)(v5 + 456);
    *(void *)(v5 + 456) = v76;

    id v78 = [(GEOPDRapFilter *)self->_rapFilter copyWithZone:a3];
    unint64_t v79 = *(void **)(v5 + 464);
    *(void *)(v5 + 464) = v78;

    id v80 = [(GEOPDOfflineAreaFilter *)self->_offlineAreaFilter copyWithZone:a3];
    id v81 = *(void **)(v5 + 352);
    *(void *)(v5 + 352) = v80;

    id v82 = [(GEOPDLocationEventFilter *)self->_locationEventFilter copyWithZone:a3];
    id v83 = *(void **)(v5 + 336);
    *(void *)(v5 + 336) = v82;

    id v84 = [(GEOPDSupportsOfflineMapsFilter *)self->_supportsOfflineMapsFilter copyWithZone:a3];
    unint64_t v85 = *(void **)(v5 + 584);
    *(void *)(v5 + 584) = v84;

    id v86 = [(GEOPDVenueInfoFilter *)self->_venueInfoFilter copyWithZone:a3];
    unint64_t v87 = *(void **)(v5 + 728);
    *(void *)(v5 + 728) = v86;

    id v88 = [(GEOPDContainedPlaceFilter *)self->_containedPlaceFilter copyWithZone:a3];
    unint64_t v89 = *(void **)(v5 + 152);
    *(void *)(v5 + 152) = v88;

    id v90 = [(GEOPDWifiFingerprintFilter *)self->_wifiFingerprintFilter copyWithZone:a3];
    id v91 = *(void **)(v5 + 744);
    *(void *)(v5 + 744) = v90;

    id v92 = [(GEOPDIconFilter *)self->_iconFilter copyWithZone:a3];
    v93 = *(void **)(v5 + 304);
    *(void *)(v5 + 304) = v92;

    id v94 = [(GEOPDPriceDescriptionFilter *)self->_priceDescriptionFilter copyWithZone:a3];
    uint64_t v95 = *(void **)(v5 + 432);
    *(void *)(v5 + 432) = v94;

    id v96 = [(GEOPDBrowseCategoriesFilter *)self->_browseCategoriesFilter copyWithZone:a3];
    id v97 = *(void **)(v5 + 104);
    *(void *)(v5 + 104) = v96;

    id v98 = [(GEOPDStorefrontFilter *)self->_storefrontFilter copyWithZone:a3];
    v99 = *(void **)(v5 + 560);
    *(void *)(v5 + 560) = v98;

    id v100 = [(GEOPDGroundViewLabelFilter *)self->_groundViewLabelFilter copyWithZone:a3];
    v101 = *(void **)(v5 + 256);
    *(void *)(v5 + 256) = v100;

    id v102 = [(GEOPDAnnotatedItemListFilter *)self->_annotatedItemListFilter copyWithZone:a3];
    v103 = *(void **)(v5 + 80);
    *(void *)(v5 + 80) = v102;

    id v104 = [(GEOPDPoiEventFilter *)self->_poiEventFilter copyWithZone:a3];
    v105 = *(void **)(v5 + 424);
    *(void *)(v5 + 424) = v104;

    id v106 = [(GEOPDStorefrontPresentationFilter *)self->_storefrontPresentationFilter copyWithZone:a3];
    int v107 = *(void **)(v5 + 568);
    *(void *)(v5 + 568) = v106;

    id v108 = [(GEOPDPlacecardLayoutConfigurationFilter *)self->_placecardLayoutConfigurationFilter copyWithZone:a3];
    id v109 = *(void **)(v5 + 400);
    *(void *)(v5 + 400) = v108;

    id v110 = [(GEOPDPrototypeContainerFilter *)self->_protoTypeContainerFilter copyWithZone:a3];
    v111 = *(void **)(v5 + 440);
    *(void *)(v5 + 440) = v110;

    id v112 = [(GEOPDVehiclePositionFilter *)self->_transitVehiclePositionFilter copyWithZone:a3];
    v113 = *(void **)(v5 + 712);
    *(void *)(v5 + 712) = v112;

    id v114 = [(GEOPDLinkedServiceFilter *)self->_linkedServiceFilter copyWithZone:a3];
    id v115 = *(void **)(v5 + 328);
    *(void *)(v5 + 328) = v114;

    id v116 = [(GEOPDBusinessHoursFilter *)self->_businessHoursFilter copyWithZone:a3];
    id v117 = *(void **)(v5 + 120);
    *(void *)(v5 + 120) = v116;

    id v118 = [(GEOPDPlaceCollectionFilter *)self->_placeCollectionFilter copyWithZone:a3];
    v119 = *(void **)(v5 + 368);
    *(void *)(v5 + 368) = v118;

    id v120 = [(GEOPDRelatedPlaceFilter *)self->_relatedPlaceFilter copyWithZone:a3];
    id v121 = *(void **)(v5 + 496);
    *(void *)(v5 + 496) = v120;

    id v122 = [(GEOPDTransitTripStopFilter *)self->_transitTripStopFilter copyWithZone:a3];
    id v123 = *(void **)(v5 + 696);
    *(void *)(v5 + 696) = v122;

    id v124 = [(GEOPDTransitTripStopTimeFilter *)self->_transitTripStopTimeFilter copyWithZone:a3];
    v125 = *(void **)(v5 + 704);
    *(void *)(v5 + 704) = v124;

    id v126 = [(GEOPDTransitTripGeometryFilter *)self->_transitTripGeometryFilter copyWithZone:a3];
    v127 = *(void **)(v5 + 688);
    *(void *)(v5 + 688) = v126;

    id v128 = [(GEOPDWalletCategoryInformationFilter *)self->_walletCategoryInformationFilter copyWithZone:a3];
    uint64_t v129 = *(void **)(v5 + 736);
    *(void *)(v5 + 736) = v128;

    id v130 = [(GEOPDPublisherFilter *)self->_publisherFilter copyWithZone:a3];
    id v131 = *(void **)(v5 + 448);
    *(void *)(v5 + 448) = v130;

    id v132 = [(GEOPDPlaceQuestionnaireFilter *)self->_placeQuestionnaireFilter copyWithZone:a3];
    int v133 = *(void **)(v5 + 392);
    *(void *)(v5 + 392) = v132;

    id v134 = [(GEOPDPlaceCollectionItemFilter *)self->_placeCollectionItemFilter copyWithZone:a3];
    id v135 = *(void **)(v5 + 376);
    *(void *)(v5 + 376) = v134;

    id v136 = [(GEOPDCollectionIdsFilter *)self->_collectionIdsFilter copyWithZone:a3];
    id v137 = *(void **)(v5 + 144);
    *(void *)(v5 + 144) = v136;

    id v138 = [(GEOPDISO3166CodeFilter *)self->_iso3166CodeFilter copyWithZone:a3];
    v139 = *(void **)(v5 + 312);
    *(void *)(v5 + 312) = v138;

    id v140 = [(GEOPDVendorAmenitiesFilter *)self->_vendorAmenitiesFilter copyWithZone:a3];
    v141 = *(void **)(v5 + 720);
    *(void *)(v5 + 720) = v140;

    id v142 = [(GEOPDStorefrontFacesFilter *)self->_storefrontFacesFilter copyWithZone:a3];
    id v143 = *(void **)(v5 + 552);
    *(void *)(v5 + 552) = v142;

    id v144 = [(GEOPDGuideGroupFilter *)self->_guideGroupFilter copyWithZone:a3];
    v145 = *(void **)(v5 + 264);
    *(void *)(v5 + 264) = v144;

    id v146 = [(GEOPDContainmentPlaceFilter *)self->_containmentPlaceFilter copyWithZone:a3];
    id v147 = *(void **)(v5 + 160);
    *(void *)(v5 + 160) = v146;

    id v148 = [(GEOPDCategorizedPhotosFilter *)self->_categorizedPhotosFilter copyWithZone:a3];
    id v149 = *(void **)(v5 + 136);
    *(void *)(v5 + 136) = v148;

    id v150 = [(GEOPDExploreGuidesFilter *)self->_exploreGuidesFilter copyWithZone:a3];
    v151 = *(void **)(v5 + 216);
    *(void *)(v5 + 216) = v150;

    id v152 = [(GEOPDAboutFilter *)self->_aboutFilter copyWithZone:a3];
    v153 = *(void **)(v5 + 24);
    *(void *)(v5 + 24) = v152;

    id v154 = [(GEOPDLabelGeometryFilter *)self->_labelGeometryFilter copyWithZone:a3];
    v155 = *(void **)(v5 + 320);
    *(void *)(v5 + 320) = v154;

    id v156 = [(GEOPDEnhancedPlacementFilter *)self->_enhancedPlacementFilter copyWithZone:a3];
    v157 = *(void **)(v5 + 168);
    *(void *)(v5 + 168) = v156;

    id v158 = [(GEOPDTemplatePlaceFilter *)self->_templatePlaceFilter copyWithZone:a3];
    id v159 = *(void **)(v5 + 592);
    *(void *)(v5 + 592) = v158;

    id v160 = [(GEOPDTransitPaymentMethodInfoFilter *)self->_transitPaymentMethodInfoFilter copyWithZone:a3];
    id v161 = *(void **)(v5 + 672);
    *(void *)(v5 + 672) = v160;

    id v162 = [(GEOPDEnrichmentInfoFilter *)self->_enrichmentInfoFilter copyWithZone:a3];
    v163 = *(void **)(v5 + 184);
    *(void *)(v5 + 184) = v162;

    id v164 = [(GEOPDActionDataFilter *)self->_actionDataFilter copyWithZone:a3];
    v165 = *(void **)(v5 + 40);
    *(void *)(v5 + 40) = v164;

    id v166 = [(GEOPDEnrichmentDataFilter *)self->_enrichmentDataFilter copyWithZone:a3];
    char v167 = *(void **)(v5 + 176);
    *(void *)(v5 + 176) = v166;

    id v168 = [(GEOPDPOIClaimFilter *)self->_poiClaimFilter copyWithZone:a3];
    id v169 = *(void **)(v5 + 416);
    *(void *)(v5 + 416) = v168;

    id v170 = [(GEOPDEVChargerFilter *)self->_evChargerFilter copyWithZone:a3];
    id v171 = *(void **)(v5 + 208);
    *(void *)(v5 + 208) = v170;

    id v172 = [(GEOPDTrailHeadFilter *)self->_trailHeadFilter copyWithZone:a3];
    id v173 = *(void **)(v5 + 624);
    *(void *)(v5 + 624) = v172;

    id v174 = [(GEOPDRefreshIdFilter *)self->_refreshIdFilter copyWithZone:a3];
    id v175 = *(void **)(v5 + 488);
    *(void *)(v5 + 488) = v174;

    id v176 = [(GEOPDAddressWithComponentsFilter *)self->_addressComponentsFilter copyWithZone:a3];
    v177 = *(void **)(v5 + 48);
    *(void *)(v5 + 48) = v176;

    id v178 = [(GEOPDSearchResultPlacePhotoFilter *)self->_searchResultPlacePhotoFilter copyWithZone:a3];
    v179 = *(void **)(v5 + 528);
    *(void *)(v5 + 528) = v178;

    id v180 = [(GEOPDForwardInfoFilter *)self->_forwardInfoFilter copyWithZone:a3];
    v181 = *(void **)(v5 + 248);
    *(void *)(v5 + 248) = v180;

    id v182 = [(GEOPDHikeAssociatedInfoFilter *)self->_hikeAssociatedInfoFilter copyWithZone:a3];
    id v183 = *(void **)(v5 + 272);
    *(void *)(v5 + 272) = v182;

    id v184 = [(GEOPDHikeSummaryFilter *)self->_hikeSummaryFilter copyWithZone:a3];
    v185 = *(void **)(v5 + 288);
    *(void *)(v5 + 288) = v184;

    id v186 = [(GEOPDHikeGeometryFilter *)self->_hikeGeometryFilter copyWithZone:a3];
    id v187 = *(void **)(v5 + 280);
    *(void *)(v5 + 280) = v186;

    id v188 = [(GEOPDTooltipFilter *)self->_toolTipFilter copyWithZone:a3];
    uint64_t v189 = *(void **)(v5 + 616);
    *(void *)(v5 + 616) = v188;

    objc_storeStrong((id *)(v5 + 16), self->_unknownFields);
    return (id)v5;
  }
  *(void *)((char *)self->_reader + (int)*MEMORY[0x1E4F940E0]) = self->_readerMarkLength;
  [(PBDataReader *)self->_reader seekToOffset:self->_readerMarkPos];
  GEOPDComponentFilterReadAllFrom(v5, self->_reader, 0);
  os_unfair_lock_unlock(&self->_readerLock);
  objc_sync_exit(v7);

  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_184;
  }
  -[GEOPDComponentFilter readAll:]((uint64_t)self, 1);
  -[GEOPDComponentFilter readAll:]((uint64_t)v4, 1);
  entityFilter = self->_entityFilter;
  if ((unint64_t)entityFilter | v4[24])
  {
    if (!-[GEOPDEntityFilter isEqual:](entityFilter, "isEqual:")) {
      goto LABEL_184;
    }
  }
  placeInfoFilter = self->_placeInfoFilter;
  if ((unint64_t)placeInfoFilter | v4[48] && !-[GEOPDPlaceInfoFilter isEqual:](placeInfoFilter, "isEqual:")) {
    goto LABEL_184;
  }
  accessInfoFilter = self->_accessInfoFilter;
  if ((unint64_t)accessInfoFilter | v4[4]
    && !-[GEOPDRoadAccessInfoFilter isEqual:](accessInfoFilter, "isEqual:"))
  {
    goto LABEL_184;
  }
  boundsFilter = self->_boundsFilter;
  if ((unint64_t)boundsFilter | v4[12] && !-[GEOPDBoundsFilter isEqual:](boundsFilter, "isEqual:")) {
    goto LABEL_184;
  }
  addressFilter = self->_addressFilter;
  if ((unint64_t)addressFilter | v4[7] && !-[GEOPDAddressFilter isEqual:](addressFilter, "isEqual:")) {
    goto LABEL_184;
  }
  ratingFilter = self->_ratingFilter;
  if ((unint64_t)ratingFilter | v4[59] && !-[GEOPDRatingFilter isEqual:](ratingFilter, "isEqual:")) {
    goto LABEL_184;
  }
  reviewFilter = self->_reviewFilter;
  if ((unint64_t)reviewFilter | v4[65] && !-[GEOPDReviewFilter isEqual:](reviewFilter, "isEqual:")) {
    goto LABEL_184;
  }
  photoFilter = self->_photoFilter;
  if ((unint64_t)photoFilter | v4[45] && !-[GEOPDPhotoFilter isEqual:](photoFilter, "isEqual:")) {
    goto LABEL_184;
  }
  hoursFilter = self->_hoursFilter;
  if ((unint64_t)hoursFilter | v4[37] && !-[GEOPDHoursFilter isEqual:](hoursFilter, "isEqual:")) {
    goto LABEL_184;
  }
  transitInfoFilter = self->_transitInfoFilter;
  if ((unint64_t)transitInfoFilter | v4[82]
    && !-[GEOPDTransitInfoFilter isEqual:](transitInfoFilter, "isEqual:"))
  {
    goto LABEL_184;
  }
  transitScheduleFilter = self->_transitScheduleFilter;
  if ((unint64_t)transitScheduleFilter | v4[85]
    && !-[GEOPDTransitScheduleFilter isEqual:](transitScheduleFilter, "isEqual:"))
  {
    goto LABEL_184;
  }
  etaFilter = self->_etaFilter;
  if ((unint64_t)etaFilter | v4[25] && !-[GEOPDETAFilter isEqual:](etaFilter, "isEqual:")) {
    goto LABEL_184;
  }
  flyoverFilter = self->_flyoverFilter;
  if ((unint64_t)flyoverFilter | v4[30] && !-[GEOPDFlyoverFilter isEqual:](flyoverFilter, "isEqual:")) {
    goto LABEL_184;
  }
  rawAttributeFilter = self->_rawAttributeFilter;
  if ((unint64_t)rawAttributeFilter | v4[60]
    && !-[GEOPDRawAttributeFilter isEqual:](rawAttributeFilter, "isEqual:"))
  {
    goto LABEL_184;
  }
  amenitiesFilter = self->_amenitiesFilter;
  if ((unint64_t)amenitiesFilter | v4[9] && !-[GEOPDAmenitiesFilter isEqual:](amenitiesFilter, "isEqual:")) {
    goto LABEL_184;
  }
  styleAttributesFilter = self->_styleAttributesFilter;
  if ((unint64_t)styleAttributesFilter | v4[72]
    && !-[GEOPDStyleAttributesFilter isEqual:](styleAttributesFilter, "isEqual:"))
  {
    goto LABEL_184;
  }
  transitIncidentFilter = self->_transitIncidentFilter;
  if ((unint64_t)transitIncidentFilter | v4[81]
    && !-[GEOPDTransitIncidentFilter isEqual:](transitIncidentFilter, "isEqual:"))
  {
    goto LABEL_184;
  }
  transitAssociatedInfoFilter = self->_transitAssociatedInfoFilter;
  if ((unint64_t)transitAssociatedInfoFilter | v4[79]
    && !-[GEOPDTransitAssociatedInfoFilter isEqual:](transitAssociatedInfoFilter, "isEqual:"))
  {
    goto LABEL_184;
  }
  textBlockFilter = self->_textBlockFilter;
  if ((unint64_t)textBlockFilter | v4[75] && !-[GEOPDTextBlockFilter isEqual:](textBlockFilter, "isEqual:")) {
    goto LABEL_184;
  }
  factoidFilter = self->_factoidFilter;
  if ((unint64_t)factoidFilter | v4[29] && !-[GEOPDFactoidFilter isEqual:](factoidFilter, "isEqual:")) {
    goto LABEL_184;
  }
  transitAttributionFilter = self->_transitAttributionFilter;
  if ((unint64_t)transitAttributionFilter | v4[80]
    && !-[GEOPDTransitAttributionFilter isEqual:](transitAttributionFilter, "isEqual:"))
  {
    goto LABEL_184;
  }
  businessClaimFilter = self->_businessClaimFilter;
  if ((unint64_t)businessClaimFilter | v4[14]
    && !-[GEOPDBusinessClaimFilter isEqual:](businessClaimFilter, "isEqual:"))
  {
    goto LABEL_184;
  }
  captionedPhotoFilter = self->_captionedPhotoFilter;
  if ((unint64_t)captionedPhotoFilter | v4[16]
    && !-[GEOPDCaptionedPhotoFilter isEqual:](captionedPhotoFilter, "isEqual:"))
  {
    goto LABEL_184;
  }
  transitInfoSnippetFilter = self->_transitInfoSnippetFilter;
  if ((unint64_t)transitInfoSnippetFilter | v4[83]
    && !-[GEOPDTransitInfoSnippetFilter isEqual:](transitInfoSnippetFilter, "isEqual:"))
  {
    goto LABEL_184;
  }
  externalActionFilter = self->_externalActionFilter;
  if ((unint64_t)externalActionFilter | v4[28]
    && !-[GEOPDExternalActionFilter isEqual:](externalActionFilter, "isEqual:"))
  {
    goto LABEL_184;
  }
  resultSnippetFilter = self->_resultSnippetFilter;
  if ((unint64_t)resultSnippetFilter | v4[64]
    && !-[GEOPDResultSnippetFilter isEqual:](resultSnippetFilter, "isEqual:"))
  {
    goto LABEL_184;
  }
  addressObjectFilter = self->_addressObjectFilter;
  if ((unint64_t)addressObjectFilter | v4[8]
    && !-[GEOPDAddressObjectFilter isEqual:](addressObjectFilter, "isEqual:"))
  {
    goto LABEL_184;
  }
  simpleRestaurantMenuTextFilter = self->_simpleRestaurantMenuTextFilter;
  if ((unint64_t)simpleRestaurantMenuTextFilter | v4[67]
    && !-[GEOPDSimpleRestaurantMenuTextFilter isEqual:](simpleRestaurantMenuTextFilter, "isEqual:"))
  {
    goto LABEL_184;
  }
  restaurantReservationLinkFilter = self->_restaurantReservationLinkFilter;
  if ((unint64_t)restaurantReservationLinkFilter | v4[63]
    && !-[GEOPDRestaurantReservationLinkFilter isEqual:](restaurantReservationLinkFilter, "isEqual:"))
  {
    goto LABEL_184;
  }
  spatialLookupFilter = self->_spatialLookupFilter;
  if ((unint64_t)spatialLookupFilter | v4[68]
    && !-[GEOPDSpatialLookupFilter isEqual:](spatialLookupFilter, "isEqual:"))
  {
    goto LABEL_184;
  }
  tipFilter = self->_tipFilter;
  if ((unint64_t)tipFilter | v4[76] && !-[GEOPDTipFilter isEqual:](tipFilter, "isEqual:")) {
    goto LABEL_184;
  }
  placecardUrlFilter = self->_placecardUrlFilter;
  if ((unint64_t)placecardUrlFilter | v4[51]
    && !-[GEOPDPlacecardURLFilter isEqual:](placecardUrlFilter, "isEqual:"))
  {
    goto LABEL_184;
  }
  associatedAppFilter = self->_associatedAppFilter;
  if ((unint64_t)associatedAppFilter | v4[11]
    && !-[GEOPDAssociatedAppFilter isEqual:](associatedAppFilter, "isEqual:"))
  {
    goto LABEL_184;
  }
  messageLinkFilter = self->_messageLinkFilter;
  if ((unint64_t)messageLinkFilter | v4[43]
    && !-[GEOPDMessageLinkFilter isEqual:](messageLinkFilter, "isEqual:"))
  {
    goto LABEL_184;
  }
  quickLinkFilter = self->_quickLinkFilter;
  if ((unint64_t)quickLinkFilter | v4[57] && !-[GEOPDQuickLinkFilter isEqual:](quickLinkFilter, "isEqual:")) {
    goto LABEL_184;
  }
  rapFilter = self->_rapFilter;
  if ((unint64_t)rapFilter | v4[58] && !-[GEOPDRapFilter isEqual:](rapFilter, "isEqual:")) {
    goto LABEL_184;
  }
  offlineAreaFilter = self->_offlineAreaFilter;
  if ((unint64_t)offlineAreaFilter | v4[44]
    && !-[GEOPDOfflineAreaFilter isEqual:](offlineAreaFilter, "isEqual:"))
  {
    goto LABEL_184;
  }
  locationEventFilter = self->_locationEventFilter;
  if ((unint64_t)locationEventFilter | v4[42]
    && !-[GEOPDLocationEventFilter isEqual:](locationEventFilter, "isEqual:"))
  {
    goto LABEL_184;
  }
  supportsOfflineMapsFilter = self->_supportsOfflineMapsFilter;
  if ((unint64_t)supportsOfflineMapsFilter | v4[73]
    && !-[GEOPDSupportsOfflineMapsFilter isEqual:](supportsOfflineMapsFilter, "isEqual:"))
  {
    goto LABEL_184;
  }
  venueInfoFilter = self->_venueInfoFilter;
  if ((unint64_t)venueInfoFilter | v4[91] && !-[GEOPDVenueInfoFilter isEqual:](venueInfoFilter, "isEqual:")) {
    goto LABEL_184;
  }
  containedPlaceFilter = self->_containedPlaceFilter;
  if ((unint64_t)containedPlaceFilter | v4[19]
    && !-[GEOPDContainedPlaceFilter isEqual:](containedPlaceFilter, "isEqual:"))
  {
    goto LABEL_184;
  }
  wifiFingerprintFilter = self->_wifiFingerprintFilter;
  if ((unint64_t)wifiFingerprintFilter | v4[93]
    && !-[GEOPDWifiFingerprintFilter isEqual:](wifiFingerprintFilter, "isEqual:"))
  {
    goto LABEL_184;
  }
  iconFilter = self->_iconFilter;
  if ((unint64_t)iconFilter | v4[38] && !-[GEOPDIconFilter isEqual:](iconFilter, "isEqual:")) {
    goto LABEL_184;
  }
  priceDescriptionFilter = self->_priceDescriptionFilter;
  if ((unint64_t)priceDescriptionFilter | v4[54]
    && !-[GEOPDPriceDescriptionFilter isEqual:](priceDescriptionFilter, "isEqual:"))
  {
    goto LABEL_184;
  }
  browseCategoriesFilter = self->_browseCategoriesFilter;
  if ((unint64_t)browseCategoriesFilter | v4[13]
    && !-[GEOPDBrowseCategoriesFilter isEqual:](browseCategoriesFilter, "isEqual:"))
  {
    goto LABEL_184;
  }
  storefrontFilter = self->_storefrontFilter;
  if ((unint64_t)storefrontFilter | v4[70] && !-[GEOPDStorefrontFilter isEqual:](storefrontFilter, "isEqual:")) {
    goto LABEL_184;
  }
  groundViewLabelFilter = self->_groundViewLabelFilter;
  if ((unint64_t)groundViewLabelFilter | v4[32]
    && !-[GEOPDGroundViewLabelFilter isEqual:](groundViewLabelFilter, "isEqual:"))
  {
    goto LABEL_184;
  }
  annotatedItemListFilter = self->_annotatedItemListFilter;
  if ((unint64_t)annotatedItemListFilter | v4[10]
    && !-[GEOPDAnnotatedItemListFilter isEqual:](annotatedItemListFilter, "isEqual:"))
  {
    goto LABEL_184;
  }
  poiEventFilter = self->_poiEventFilter;
  if ((unint64_t)poiEventFilter | v4[53] && !-[GEOPDPoiEventFilter isEqual:](poiEventFilter, "isEqual:")) {
    goto LABEL_184;
  }
  storefrontPresentationFilter = self->_storefrontPresentationFilter;
  if ((unint64_t)storefrontPresentationFilter | v4[71]
    && !-[GEOPDStorefrontPresentationFilter isEqual:](storefrontPresentationFilter, "isEqual:"))
  {
    goto LABEL_184;
  }
  placecardLayoutConfigurationFilter = self->_placecardLayoutConfigurationFilter;
  if ((unint64_t)placecardLayoutConfigurationFilter | v4[50]
    && !-[GEOPDPlacecardLayoutConfigurationFilter isEqual:](placecardLayoutConfigurationFilter, "isEqual:"))
  {
    goto LABEL_184;
  }
  protoTypeContainerFilter = self->_protoTypeContainerFilter;
  if ((unint64_t)protoTypeContainerFilter | v4[55]
    && !-[GEOPDPrototypeContainerFilter isEqual:](protoTypeContainerFilter, "isEqual:"))
  {
    goto LABEL_184;
  }
  transitVehiclePositionFilter = self->_transitVehiclePositionFilter;
  if ((unint64_t)transitVehiclePositionFilter | v4[89]
    && !-[GEOPDVehiclePositionFilter isEqual:](transitVehiclePositionFilter, "isEqual:"))
  {
    goto LABEL_184;
  }
  linkedServiceFilter = self->_linkedServiceFilter;
  if ((unint64_t)linkedServiceFilter | v4[41]
    && !-[GEOPDLinkedServiceFilter isEqual:](linkedServiceFilter, "isEqual:"))
  {
    goto LABEL_184;
  }
  businessHoursFilter = self->_businessHoursFilter;
  if ((unint64_t)businessHoursFilter | v4[15]
    && !-[GEOPDBusinessHoursFilter isEqual:](businessHoursFilter, "isEqual:"))
  {
    goto LABEL_184;
  }
  placeCollectionFilter = self->_placeCollectionFilter;
  if ((unint64_t)placeCollectionFilter | v4[46]
    && !-[GEOPDPlaceCollectionFilter isEqual:](placeCollectionFilter, "isEqual:"))
  {
    goto LABEL_184;
  }
  relatedPlaceFilter = self->_relatedPlaceFilter;
  if ((unint64_t)relatedPlaceFilter | v4[62]
    && !-[GEOPDRelatedPlaceFilter isEqual:](relatedPlaceFilter, "isEqual:"))
  {
    goto LABEL_184;
  }
  transitTripStopFilter = self->_transitTripStopFilter;
  if ((unint64_t)transitTripStopFilter | v4[87]
    && !-[GEOPDTransitTripStopFilter isEqual:](transitTripStopFilter, "isEqual:"))
  {
    goto LABEL_184;
  }
  transitTripStopTimeFilter = self->_transitTripStopTimeFilter;
  if ((unint64_t)transitTripStopTimeFilter | v4[88]
    && !-[GEOPDTransitTripStopTimeFilter isEqual:](transitTripStopTimeFilter, "isEqual:"))
  {
    goto LABEL_184;
  }
  transitTripGeometryFilter = self->_transitTripGeometryFilter;
  if ((unint64_t)transitTripGeometryFilter | v4[86]
    && !-[GEOPDTransitTripGeometryFilter isEqual:](transitTripGeometryFilter, "isEqual:"))
  {
    goto LABEL_184;
  }
  walletCategoryInformationFilter = self->_walletCategoryInformationFilter;
  if ((unint64_t)walletCategoryInformationFilter | v4[92]
    && !-[GEOPDWalletCategoryInformationFilter isEqual:](walletCategoryInformationFilter, "isEqual:"))
  {
    goto LABEL_184;
  }
  publisherFilter = self->_publisherFilter;
  if ((unint64_t)publisherFilter | v4[56] && !-[GEOPDPublisherFilter isEqual:](publisherFilter, "isEqual:")) {
    goto LABEL_184;
  }
  placeQuestionnaireFilter = self->_placeQuestionnaireFilter;
  if ((unint64_t)placeQuestionnaireFilter | v4[49]
    && !-[GEOPDPlaceQuestionnaireFilter isEqual:](placeQuestionnaireFilter, "isEqual:"))
  {
    goto LABEL_184;
  }
  placeCollectionItemFilter = self->_placeCollectionItemFilter;
  if ((unint64_t)placeCollectionItemFilter | v4[47]
    && !-[GEOPDPlaceCollectionItemFilter isEqual:](placeCollectionItemFilter, "isEqual:"))
  {
    goto LABEL_184;
  }
  collectionIdsFilter = self->_collectionIdsFilter;
  if ((unint64_t)collectionIdsFilter | v4[18]
    && !-[GEOPDCollectionIdsFilter isEqual:](collectionIdsFilter, "isEqual:"))
  {
    goto LABEL_184;
  }
  iso3166CodeFilter = self->_iso3166CodeFilter;
  if ((unint64_t)iso3166CodeFilter | v4[39]
    && !-[GEOPDISO3166CodeFilter isEqual:](iso3166CodeFilter, "isEqual:"))
  {
    goto LABEL_184;
  }
  vendorAmenitiesFilter = self->_vendorAmenitiesFilter;
  if ((unint64_t)vendorAmenitiesFilter | v4[90]
    && !-[GEOPDVendorAmenitiesFilter isEqual:](vendorAmenitiesFilter, "isEqual:"))
  {
    goto LABEL_184;
  }
  storefrontFacesFilter = self->_storefrontFacesFilter;
  if ((unint64_t)storefrontFacesFilter | v4[69]
    && !-[GEOPDStorefrontFacesFilter isEqual:](storefrontFacesFilter, "isEqual:"))
  {
    goto LABEL_184;
  }
  guideGroupFilter = self->_guideGroupFilter;
  if ((unint64_t)guideGroupFilter | v4[33] && !-[GEOPDGuideGroupFilter isEqual:](guideGroupFilter, "isEqual:")) {
    goto LABEL_184;
  }
  containmentPlaceFilter = self->_containmentPlaceFilter;
  if ((unint64_t)containmentPlaceFilter | v4[20]
    && !-[GEOPDContainmentPlaceFilter isEqual:](containmentPlaceFilter, "isEqual:"))
  {
    goto LABEL_184;
  }
  categorizedPhotosFilter = self->_categorizedPhotosFilter;
  if ((unint64_t)categorizedPhotosFilter | v4[17]
    && !-[GEOPDCategorizedPhotosFilter isEqual:](categorizedPhotosFilter, "isEqual:"))
  {
    goto LABEL_184;
  }
  exploreGuidesFilter = self->_exploreGuidesFilter;
  if ((unint64_t)exploreGuidesFilter | v4[27]
    && !-[GEOPDExploreGuidesFilter isEqual:](exploreGuidesFilter, "isEqual:"))
  {
    goto LABEL_184;
  }
  aboutFilter = self->_aboutFilter;
  if ((unint64_t)aboutFilter | v4[3] && !-[GEOPDAboutFilter isEqual:](aboutFilter, "isEqual:")) {
    goto LABEL_184;
  }
  labelGeometryFilter = self->_labelGeometryFilter;
  if ((unint64_t)labelGeometryFilter | v4[40]
    && !-[GEOPDLabelGeometryFilter isEqual:](labelGeometryFilter, "isEqual:"))
  {
    goto LABEL_184;
  }
  enhancedPlacementFilter = self->_enhancedPlacementFilter;
  if ((unint64_t)enhancedPlacementFilter | v4[21]
    && !-[GEOPDEnhancedPlacementFilter isEqual:](enhancedPlacementFilter, "isEqual:"))
  {
    goto LABEL_184;
  }
  templatePlaceFilter = self->_templatePlaceFilter;
  if ((unint64_t)templatePlaceFilter | v4[74]
    && !-[GEOPDTemplatePlaceFilter isEqual:](templatePlaceFilter, "isEqual:"))
  {
    goto LABEL_184;
  }
  transitPaymentMethodInfoFilter = self->_transitPaymentMethodInfoFilter;
  if ((unint64_t)transitPaymentMethodInfoFilter | v4[84]
    && !-[GEOPDTransitPaymentMethodInfoFilter isEqual:](transitPaymentMethodInfoFilter, "isEqual:"))
  {
    goto LABEL_184;
  }
  enrichmentInfoFilter = self->_enrichmentInfoFilter;
  if ((unint64_t)enrichmentInfoFilter | v4[23]
    && !-[GEOPDEnrichmentInfoFilter isEqual:](enrichmentInfoFilter, "isEqual:"))
  {
    goto LABEL_184;
  }
  actionDataFilter = self->_actionDataFilter;
  if ((unint64_t)actionDataFilter | v4[5] && !-[GEOPDActionDataFilter isEqual:](actionDataFilter, "isEqual:")) {
    goto LABEL_184;
  }
  enrichmentDataFilter = self->_enrichmentDataFilter;
  if ((unint64_t)enrichmentDataFilter | v4[22]
    && !-[GEOPDEnrichmentDataFilter isEqual:](enrichmentDataFilter, "isEqual:"))
  {
    goto LABEL_184;
  }
  poiClaimFilter = self->_poiClaimFilter;
  if ((unint64_t)poiClaimFilter | v4[52] && !-[GEOPDPOIClaimFilter isEqual:](poiClaimFilter, "isEqual:")) {
    goto LABEL_184;
  }
  evChargerFilter = self->_evChargerFilter;
  if ((unint64_t)evChargerFilter | v4[26] && !-[GEOPDEVChargerFilter isEqual:](evChargerFilter, "isEqual:")) {
    goto LABEL_184;
  }
  trailHeadFilter = self->_trailHeadFilter;
  if ((unint64_t)trailHeadFilter | v4[78] && !-[GEOPDTrailHeadFilter isEqual:](trailHeadFilter, "isEqual:")) {
    goto LABEL_184;
  }
  if (((refreshIdFilter = self->_refreshIdFilter, !((unint64_t)refreshIdFilter | v4[61]))
     || -[GEOPDRefreshIdFilter isEqual:](refreshIdFilter, "isEqual:"))
    && ((addressComponentsFilter = self->_addressComponentsFilter, !((unint64_t)addressComponentsFilter | v4[6]))
     || -[GEOPDAddressWithComponentsFilter isEqual:](addressComponentsFilter, "isEqual:"))
    && ((searchResultPlacePhotoFilter = self->_searchResultPlacePhotoFilter,
         !((unint64_t)searchResultPlacePhotoFilter | v4[66]))
     || -[GEOPDSearchResultPlacePhotoFilter isEqual:](searchResultPlacePhotoFilter, "isEqual:"))
    && ((forwardInfoFilter = self->_forwardInfoFilter, !((unint64_t)forwardInfoFilter | v4[31]))
     || -[GEOPDForwardInfoFilter isEqual:](forwardInfoFilter, "isEqual:"))
    && ((hikeAssociatedInfoFilter = self->_hikeAssociatedInfoFilter,
         !((unint64_t)hikeAssociatedInfoFilter | v4[34]))
     || -[GEOPDHikeAssociatedInfoFilter isEqual:](hikeAssociatedInfoFilter, "isEqual:"))
    && ((hikeSummaryFilter = self->_hikeSummaryFilter, !((unint64_t)hikeSummaryFilter | v4[36]))
     || -[GEOPDHikeSummaryFilter isEqual:](hikeSummaryFilter, "isEqual:"))
    && ((hikeGeometryFilter = self->_hikeGeometryFilter, !((unint64_t)hikeGeometryFilter | v4[35]))
     || -[GEOPDHikeGeometryFilter isEqual:](hikeGeometryFilter, "isEqual:")))
  {
    toolTipFilter = self->_toolTipFilter;
    if ((unint64_t)toolTipFilter | v4[77]) {
      char v96 = -[GEOPDTooltipFilter isEqual:](toolTipFilter, "isEqual:");
    }
    else {
      char v96 = 1;
    }
  }
  else
  {
LABEL_184:
    char v96 = 0;
  }

  return v96;
}

- (void)clearUnknownFields:(uint64_t)a1
{
  uint64_t v198 = *MEMORY[0x1E4F143B8];
  if (a1)
  {
    os_unfair_lock_lock_with_options();
    int v4 = *(_DWORD *)(a1 + 772) | 0x10000000;
    *(void *)(a1 + 764) |= 1uLL;
    *(_DWORD *)(a1 + 772) = v4;
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 760));
    uint64_t v5 = *(void **)(a1 + 16);
    *(void *)(a1 + 16) = 0;

    if (a2)
    {
      -[GEOPDComponentFilter readAll:](a1, 0);
      uint64_t v6 = *(void *)(a1 + 192);
      if (v6)
      {
        id v7 = *(void **)(v6 + 8);
        *(void *)(v6 + 8) = 0;
      }
      uint64_t v8 = *(void *)(a1 + 384);
      if (v8)
      {
        id v9 = *(void **)(v8 + 8);
        *(void *)(v8 + 8) = 0;
      }
      uint64_t v10 = *(void *)(a1 + 32);
      if (v10)
      {
        id v11 = *(void **)(v10 + 8);
        *(void *)(v10 + 8) = 0;
      }
      uint64_t v12 = *(void *)(a1 + 96);
      if (v12)
      {
        id v13 = *(void **)(v12 + 8);
        *(void *)(v12 + 8) = 0;
      }
      uint64_t v14 = *(void *)(a1 + 56);
      if (v14)
      {
        char v15 = *(void **)(v14 + 8);
        *(void *)(v14 + 8) = 0;
      }
      uint64_t v16 = *(void *)(a1 + 472);
      if (v16)
      {
        long long v17 = *(void **)(v16 + 8);
        *(void *)(v16 + 8) = 0;
      }
      uint64_t v18 = *(void *)(a1 + 520);
      if (v18)
      {
        double v19 = *(void **)(v18 + 8);
        *(void *)(v18 + 8) = 0;
      }
      uint64_t v20 = *(void *)(a1 + 360);
      if (v20)
      {
        char v21 = *(void **)(v20 + 8);
        *(void *)(v20 + 8) = 0;
      }
      uint64_t v22 = *(void *)(a1 + 296);
      if (v22)
      {
        unint64_t v23 = *(void **)(v22 + 8);
        *(void *)(v22 + 8) = 0;
      }
      uint64_t v24 = *(void *)(a1 + 656);
      if (v24)
      {
        id v25 = *(void **)(v24 + 8);
        *(void *)(v24 + 8) = 0;
      }
      uint64_t v26 = *(void *)(a1 + 680);
      if (v26)
      {
        os_unfair_lock_lock_with_options();
        *(unsigned char *)(v26 + 68) |= 4u;
        *(unsigned char *)(v26 + 68) |= 0x20u;
        os_unfair_lock_unlock((os_unfair_lock_t)(v26 + 60));
        int v27 = *(void **)(v26 + 16);
        *(void *)(v26 + 16) = 0;

        -[GEOPDTransitScheduleFilter readAll:](v26, 0);
        uint64_t v28 = *(void *)(v26 + 24);
        if (v28)
        {
          unint64_t v29 = *(void **)(v28 + 8);
          *(void *)(v28 + 8) = 0;
        }
        uint64_t v30 = *(void *)(v26 + 32);
        if (v30)
        {
          id v31 = *(void **)(v30 + 8);
          *(void *)(v30 + 8) = 0;
        }
      }
      -[GEOPDETAFilter clearUnknownFields:](*(void *)(a1 + 200), 1);
      uint64_t v32 = *(void *)(a1 + 240);
      if (v32)
      {
        int v33 = *(void **)(v32 + 8);
        *(void *)(v32 + 8) = 0;
      }
      uint64_t v34 = *(void *)(a1 + 480);
      if (v34)
      {
        id v35 = *(void **)(v34 + 8);
        *(void *)(v34 + 8) = 0;
      }
      uint64_t v36 = *(void *)(a1 + 72);
      if (v36)
      {
        id v37 = *(void **)(v36 + 8);
        *(void *)(v36 + 8) = 0;
      }
      uint64_t v38 = *(void *)(a1 + 576);
      if (v38)
      {
        int v39 = *(void **)(v38 + 8);
        *(void *)(v38 + 8) = 0;
      }
      uint64_t v40 = *(void *)(a1 + 648);
      if (v40)
      {
        id v41 = *(void **)(v40 + 8);
        *(void *)(v40 + 8) = 0;
      }
      uint64_t v42 = *(void *)(a1 + 632);
      if (v42)
      {
        id v43 = *(void **)(v42 + 8);
        *(void *)(v42 + 8) = 0;
      }
      uint64_t v44 = *(void *)(a1 + 600);
      if (v44)
      {
        int v45 = *(void **)(v44 + 8);
        *(void *)(v44 + 8) = 0;
      }
      uint64_t v46 = *(void *)(a1 + 232);
      if (v46)
      {
        unint64_t v47 = *(void **)(v46 + 8);
        *(void *)(v46 + 8) = 0;
      }
      uint64_t v48 = *(void *)(a1 + 640);
      if (v48)
      {
        id v49 = *(void **)(v48 + 8);
        *(void *)(v48 + 8) = 0;
      }
      uint64_t v50 = *(void *)(a1 + 112);
      if (v50)
      {
        int v51 = *(void **)(v50 + 8);
        *(void *)(v50 + 8) = 0;
      }
      uint64_t v52 = *(void *)(a1 + 128);
      if (v52)
      {
        os_unfair_lock_lock_with_options();
        *(unsigned char *)(v52 + 68) |= 1u;
        *(unsigned char *)(v52 + 68) |= 8u;
        os_unfair_lock_unlock((os_unfair_lock_t)(v52 + 64));
        id v53 = *(void **)(v52 + 16);
        *(void *)(v52 + 16) = 0;

        -[GEOPDCaptionedPhotoFilter readAll:](v52, 0);
      }
      uint64_t v54 = *(void *)(a1 + 664);
      if (v54)
      {
        id v55 = *(void **)(v54 + 8);
        *(void *)(v54 + 8) = 0;
      }
      uint64_t v56 = *(void *)(a1 + 224);
      if (v56)
      {
        unint64_t v57 = *(void **)(v56 + 8);
        *(void *)(v56 + 8) = 0;
      }
      uint64_t v58 = *(void *)(a1 + 512);
      if (v58)
      {
        unint64_t v59 = *(void **)(v58 + 8);
        *(void *)(v58 + 8) = 0;
      }
      uint64_t v60 = *(void *)(a1 + 64);
      if (v60)
      {
        uint64_t v61 = *(void **)(v60 + 8);
        *(void *)(v60 + 8) = 0;
      }
      uint64_t v62 = *(void *)(a1 + 536);
      if (v62)
      {
        id v63 = *(void **)(v62 + 8);
        *(void *)(v62 + 8) = 0;
      }
      uint64_t v64 = *(void *)(a1 + 504);
      if (v64)
      {
        unint64_t v65 = *(void **)(v64 + 8);
        *(void *)(v64 + 8) = 0;
      }
      uint64_t v66 = *(void *)(a1 + 544);
      if (v66)
      {
        char v67 = *(void **)(v66 + 8);
        *(void *)(v66 + 8) = 0;
      }
      uint64_t v68 = *(void *)(a1 + 608);
      if (v68)
      {
        id v69 = *(void **)(v68 + 8);
        *(void *)(v68 + 8) = 0;
      }
      uint64_t v70 = *(void *)(a1 + 408);
      if (v70)
      {
        id v71 = *(void **)(v70 + 8);
        *(void *)(v70 + 8) = 0;
      }
      uint64_t v72 = *(void *)(a1 + 88);
      if (v72)
      {
        unint64_t v73 = *(void **)(v72 + 8);
        *(void *)(v72 + 8) = 0;
      }
      uint64_t v74 = *(void *)(a1 + 344);
      if (v74)
      {
        uint64_t v75 = *(void **)(v74 + 8);
        *(void *)(v74 + 8) = 0;
      }
      uint64_t v76 = *(void *)(a1 + 456);
      if (v76)
      {
        id v77 = *(void **)(v76 + 8);
        *(void *)(v76 + 8) = 0;
      }
      uint64_t v78 = *(void *)(a1 + 464);
      if (v78)
      {
        unint64_t v79 = *(void **)(v78 + 8);
        *(void *)(v78 + 8) = 0;
      }
      uint64_t v80 = *(void *)(a1 + 352);
      if (v80)
      {
        id v81 = *(void **)(v80 + 8);
        *(void *)(v80 + 8) = 0;
      }
      uint64_t v82 = *(void *)(a1 + 336);
      if (v82)
      {
        id v83 = *(void **)(v82 + 8);
        *(void *)(v82 + 8) = 0;
      }
      uint64_t v84 = *(void *)(a1 + 584);
      if (v84)
      {
        unint64_t v85 = *(void **)(v84 + 8);
        *(void *)(v84 + 8) = 0;
      }
      uint64_t v86 = *(void *)(a1 + 728);
      if (v86)
      {
        unint64_t v87 = *(void **)(v86 + 8);
        *(void *)(v86 + 8) = 0;
      }
      uint64_t v88 = *(void *)(a1 + 152);
      if (v88)
      {
        unint64_t v89 = *(void **)(v88 + 8);
        *(void *)(v88 + 8) = 0;
      }
      uint64_t v90 = *(void *)(a1 + 744);
      if (v90)
      {
        id v91 = *(void **)(v90 + 8);
        *(void *)(v90 + 8) = 0;
      }
      uint64_t v92 = *(void *)(a1 + 304);
      if (v92)
      {
        v93 = *(void **)(v92 + 8);
        *(void *)(v92 + 8) = 0;
      }
      uint64_t v94 = *(void *)(a1 + 432);
      if (v94)
      {
        uint64_t v95 = *(void **)(v94 + 8);
        *(void *)(v94 + 8) = 0;
      }
      uint64_t v96 = *(void *)(a1 + 104);
      if (v96)
      {
        id v97 = *(void **)(v96 + 8);
        *(void *)(v96 + 8) = 0;
      }
      uint64_t v98 = *(void *)(a1 + 256);
      if (v98)
      {
        v99 = *(void **)(v98 + 8);
        *(void *)(v98 + 8) = 0;
      }
      uint64_t v100 = *(void *)(a1 + 80);
      if (v100)
      {
        v101 = *(void **)(v100 + 8);
        *(void *)(v100 + 8) = 0;
      }
      uint64_t v102 = *(void *)(a1 + 424);
      if (v102)
      {
        v103 = *(void **)(v102 + 8);
        *(void *)(v102 + 8) = 0;
      }
      uint64_t v104 = *(void *)(a1 + 400);
      if (v104)
      {
        v105 = *(void **)(v104 + 8);
        *(void *)(v104 + 8) = 0;
      }
      uint64_t v106 = *(void *)(a1 + 440);
      if (v106)
      {
        int v107 = *(void **)(v106 + 8);
        *(void *)(v106 + 8) = 0;
      }
      uint64_t v108 = *(void *)(a1 + 712);
      if (v108)
      {
        id v109 = *(void **)(v108 + 8);
        *(void *)(v108 + 8) = 0;
      }
      uint64_t v110 = *(void *)(a1 + 328);
      if (v110)
      {
        v111 = *(void **)(v110 + 8);
        *(void *)(v110 + 8) = 0;
      }
      uint64_t v112 = *(void *)(a1 + 120);
      if (v112)
      {
        v113 = *(void **)(v112 + 8);
        *(void *)(v112 + 8) = 0;
      }
      uint64_t v114 = *(void *)(a1 + 368);
      if (v114)
      {
        id v115 = *(void **)(v114 + 8);
        *(void *)(v114 + 8) = 0;
      }
      uint64_t v116 = *(void *)(a1 + 496);
      if (v116)
      {
        id v117 = *(void **)(v116 + 8);
        *(void *)(v116 + 8) = 0;
      }
      uint64_t v118 = *(void *)(a1 + 696);
      if (v118)
      {
        v119 = *(void **)(v118 + 8);
        *(void *)(v118 + 8) = 0;
      }
      uint64_t v120 = *(void *)(a1 + 704);
      if (v120)
      {
        os_unfair_lock_lock_with_options();
        *(unsigned char *)(v120 + 68) |= 4u;
        *(unsigned char *)(v120 + 68) |= 0x20u;
        os_unfair_lock_unlock((os_unfair_lock_t)(v120 + 60));
        id v121 = *(void **)(v120 + 16);
        *(void *)(v120 + 16) = 0;

        -[GEOPDTransitTripStopTimeFilter readAll:](v120, 0);
        uint64_t v122 = *(void *)(v120 + 24);
        if (v122)
        {
          id v123 = *(void **)(v122 + 8);
          *(void *)(v122 + 8) = 0;
        }
        uint64_t v124 = *(void *)(v120 + 32);
        if (v124)
        {
          v125 = *(void **)(v124 + 8);
          *(void *)(v124 + 8) = 0;
        }
      }
      uint64_t v126 = *(void *)(a1 + 688);
      if (v126)
      {
        v127 = *(void **)(v126 + 8);
        *(void *)(v126 + 8) = 0;
      }
      uint64_t v128 = *(void *)(a1 + 736);
      if (v128)
      {
        uint64_t v129 = *(void **)(v128 + 8);
        *(void *)(v128 + 8) = 0;
      }
      uint64_t v130 = *(void *)(a1 + 448);
      if (v130)
      {
        id v131 = *(void **)(v130 + 8);
        *(void *)(v130 + 8) = 0;
      }
      uint64_t v132 = *(void *)(a1 + 392);
      if (v132)
      {
        int v133 = *(void **)(v132 + 8);
        *(void *)(v132 + 8) = 0;
      }
      uint64_t v134 = *(void *)(a1 + 376);
      if (v134)
      {
        id v135 = *(void **)(v134 + 8);
        *(void *)(v134 + 8) = 0;

        long long v195 = 0u;
        long long v196 = 0u;
        long long v193 = 0u;
        long long v194 = 0u;
        id v136 = *(id *)(v134 + 16);
        uint64_t v137 = [v136 countByEnumeratingWithState:&v193 objects:v197 count:16];
        if (v137)
        {
          uint64_t v138 = v137;
          uint64_t v139 = *(void *)v194;
          do
          {
            uint64_t v140 = 0;
            do
            {
              if (*(void *)v194 != v139) {
                objc_enumerationMutation(v136);
              }
              objc_msgSend(*(id *)(*((void *)&v193 + 1) + 8 * v140++), "clearUnknownFields:", 1, (void)v193);
            }
            while (v138 != v140);
            uint64_t v138 = [v136 countByEnumeratingWithState:&v193 objects:v197 count:16];
          }
          while (v138);
        }
      }
      uint64_t v141 = *(void *)(a1 + 144);
      if (v141)
      {
        id v142 = *(void **)(v141 + 8);
        *(void *)(v141 + 8) = 0;
      }
      uint64_t v143 = *(void *)(a1 + 312);
      if (v143)
      {
        id v144 = *(void **)(v143 + 8);
        *(void *)(v143 + 8) = 0;
      }
      uint64_t v145 = *(void *)(a1 + 720);
      if (v145)
      {
        id v146 = *(void **)(v145 + 8);
        *(void *)(v145 + 8) = 0;
      }
      uint64_t v147 = *(void *)(a1 + 264);
      if (v147)
      {
        id v148 = *(void **)(v147 + 8);
        *(void *)(v147 + 8) = 0;
      }
      uint64_t v149 = *(void *)(a1 + 160);
      if (v149)
      {
        id v150 = *(void **)(v149 + 8);
        *(void *)(v149 + 8) = 0;
      }
      uint64_t v151 = *(void *)(a1 + 136);
      if (v151)
      {
        os_unfair_lock_lock_with_options();
        *(unsigned char *)(v151 + 80) |= 0x10u;
        *(unsigned char *)(v151 + 80) |= 0x80u;
        os_unfair_lock_unlock((os_unfair_lock_t)(v151 + 64));
        id v152 = *(void **)(v151 + 16);
        *(void *)(v151 + 16) = 0;

        -[GEOPDCategorizedPhotosFilter readAll:](v151, 0);
      }
      uint64_t v153 = *(void *)(a1 + 216);
      if (v153)
      {
        id v154 = *(void **)(v153 + 8);
        *(void *)(v153 + 8) = 0;
      }
      uint64_t v155 = *(void *)(a1 + 24);
      if (v155)
      {
        id v156 = *(void **)(v155 + 8);
        *(void *)(v155 + 8) = 0;
      }
      uint64_t v157 = *(void *)(a1 + 320);
      if (v157)
      {
        id v158 = *(void **)(v157 + 8);
        *(void *)(v157 + 8) = 0;
      }
      uint64_t v159 = *(void *)(a1 + 168);
      if (v159)
      {
        id v160 = *(void **)(v159 + 8);
        *(void *)(v159 + 8) = 0;
      }
      uint64_t v161 = *(void *)(a1 + 592);
      if (v161)
      {
        id v162 = *(void **)(v161 + 8);
        *(void *)(v161 + 8) = 0;
      }
      uint64_t v163 = *(void *)(a1 + 672);
      if (v163)
      {
        id v164 = *(void **)(v163 + 8);
        *(void *)(v163 + 8) = 0;
      }
      uint64_t v165 = *(void *)(a1 + 184);
      if (v165)
      {
        id v166 = *(void **)(v165 + 8);
        *(void *)(v165 + 8) = 0;
      }
      uint64_t v167 = *(void *)(a1 + 40);
      if (v167)
      {
        id v168 = *(void **)(v167 + 8);
        *(void *)(v167 + 8) = 0;
      }
      uint64_t v169 = *(void *)(a1 + 176);
      if (v169)
      {
        id v170 = *(void **)(v169 + 8);
        *(void *)(v169 + 8) = 0;
      }
      uint64_t v171 = *(void *)(a1 + 416);
      if (v171)
      {
        id v172 = *(void **)(v171 + 8);
        *(void *)(v171 + 8) = 0;
      }
      uint64_t v173 = *(void *)(a1 + 208);
      if (v173)
      {
        id v174 = *(void **)(v173 + 8);
        *(void *)(v173 + 8) = 0;
      }
      uint64_t v175 = *(void *)(a1 + 624);
      if (v175)
      {
        id v176 = *(void **)(v175 + 8);
        *(void *)(v175 + 8) = 0;
      }
      uint64_t v177 = *(void *)(a1 + 488);
      if (v177)
      {
        id v178 = *(void **)(v177 + 8);
        *(void *)(v177 + 8) = 0;
      }
      uint64_t v179 = *(void *)(a1 + 48);
      if (v179)
      {
        id v180 = *(void **)(v179 + 8);
        *(void *)(v179 + 8) = 0;
      }
      uint64_t v181 = *(void *)(a1 + 528);
      if (v181)
      {
        id v182 = *(void **)(v181 + 8);
        *(void *)(v181 + 8) = 0;
      }
      uint64_t v183 = *(void *)(a1 + 248);
      if (v183)
      {
        id v184 = *(void **)(v183 + 8);
        *(void *)(v183 + 8) = 0;
      }
      uint64_t v185 = *(void *)(a1 + 272);
      if (v185)
      {
        id v186 = *(void **)(v185 + 8);
        *(void *)(v185 + 8) = 0;
      }
      uint64_t v187 = *(void *)(a1 + 288);
      if (v187)
      {
        id v188 = *(void **)(v187 + 8);
        *(void *)(v187 + 8) = 0;
      }
      uint64_t v189 = *(void *)(a1 + 280);
      if (v189)
      {
        id v190 = *(void **)(v189 + 8);
        *(void *)(v189 + 8) = 0;
      }
      uint64_t v191 = *(void *)(a1 + 616);
      if (v191)
      {
        v192 = *(void **)(v191 + 8);
        *(void *)(v191 + 8) = 0;
      }
    }
  }
}

- (id)initEntityFilterWithSpokenNames
{
  v7.receiver = self;
  v7.super_class = (Class)GEOPDComponentFilter;
  v2 = [(GEOPDComponentFilter *)&v7 init];
  if (v2)
  {
    uint64_t v3 = objc_alloc_init(GEOPDEntityFilter);
    int v4 = v3;
    if (v3)
    {
      *(unsigned char *)&v3->_flags |= 2u;
      v3->_includeSpokenNames = 1;
      *(unsigned char *)&v3->_flags |= 4u;
      v3->_populateAltCategory = 1;
    }
    -[GEOPDComponentFilter setEntityFilter:]((uint64_t)v2, v3);
    uint64_t v5 = v2;
  }
  return v2;
}

- (id)initPhotoFilterWithTraits:(id)a3
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v18.receiver = self;
  v18.super_class = (Class)GEOPDComponentFilter;
  uint64_t v5 = [(GEOPDComponentFilter *)&v18 init];
  if (v5)
  {
    uint64_t v6 = objc_alloc_init(GEOPDPhotoFilter);
    long long v14 = 0u;
    long long v15 = 0u;
    long long v16 = 0u;
    long long v17 = 0u;
    objc_super v7 = objc_msgSend(v4, "photoSizes", 0);
    uint64_t v8 = [v7 countByEnumeratingWithState:&v14 objects:v19 count:16];
    if (v8)
    {
      uint64_t v9 = v8;
      uint64_t v10 = *(void *)v15;
      do
      {
        uint64_t v11 = 0;
        do
        {
          if (*(void *)v15 != v10) {
            objc_enumerationMutation(v7);
          }
          -[GEOPDPhotoFilter addPhotoSizeFilter:]((uint64_t)v6, [*(id *)(*((void *)&v14 + 1) + 8 * v11) height] | (unint64_t)(objc_msgSend(*(id *)(*((void *)&v14 + 1) + 8 * v11), "width") << 32), 3);
          ++v11;
        }
        while (v9 != v11);
        uint64_t v9 = [v7 countByEnumeratingWithState:&v14 objects:v19 count:16];
      }
      while (v9);
    }

    -[GEOPDComponentFilter setPhotoFilter:]((uint64_t)v5, v6);
    uint64_t v12 = v5;
  }
  return v5;
}

- (id)initRestaurantReservationLinkFilterWithTraits:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)GEOPDComponentFilter;
  uint64_t v3 = [(GEOPDComponentFilter *)&v7 init];
  if (v3)
  {
    id v4 = objc_alloc_init(GEOPDRestaurantReservationLinkFilter);
    -[GEOPDComponentFilter setRestaurantReservationLinkFilter:]((uint64_t)v3, v4);
    uint64_t v5 = v3;
  }
  return v3;
}

- (id)initTransitTripStopTimeFilterWithTraits:(id)a3
{
  id v4 = a3;
  v22.receiver = self;
  v22.super_class = (Class)GEOPDComponentFilter;
  uint64_t v5 = [(GEOPDComponentFilter *)&v22 init];
  if (v5)
  {
    uint64_t v6 = objc_alloc_init(GEOPDTransitTripStopTimeFilter);
    objc_super v7 = [v4 transitTripStopTimeFilter];
    if ([v7 hasHighFrequencyFilter])
    {
      uint64_t v8 = [GEOPDDeparturePredicate alloc];
      uint64_t v9 = [v7 highFrequencyFilter];
      uint64_t v10 = [(GEOPDDeparturePredicate *)v8 initWithTraitsTransitModeFilter:v9];
      -[GEOPDTransitTripStopTimeFilter setDeparturePredicateCountdown:]((uint64_t)v6, v10);
    }
    if ([v7 hasLowFrequencyFilter])
    {
      uint64_t v11 = [GEOPDDeparturePredicate alloc];
      uint64_t v12 = [v7 lowFrequencyFilter];
      id v13 = [(GEOPDDeparturePredicate *)v11 initWithTraitsTransitModeFilter:v12];
      -[GEOPDTransitTripStopTimeFilter setDeparturePredicateStamp:]((uint64_t)v6, v13);
    }
    if ([v7 hasOperatingHoursRange])
    {
      long long v14 = [v7 operatingHoursRange];
      [v14 startTime];
      double v16 = v15;

      long long v17 = [v7 operatingHoursRange];
      [v17 duration];
      double v19 = v18;

      if (v6)
      {
        *(unsigned char *)&v6->_flags |= 0x20u;
        *(unsigned char *)&v6->_flags |= 1u;
        *(void *)&v6->_operatingHoursRange._duratiouint64_t n = v19 | ((unint64_t)v16 << 32);
        v6->_operatingHoursRange._has = ($B85216D09A238EDB5177F50F3CAD2EB5)3;
LABEL_10:
        *(unsigned char *)&v6->_flags |= 0x20u;
        *(unsigned char *)&v6->_flags |= 2u;
        v6->_includeRealTimeDepartures = 1;
      }
    }
    else if (v6)
    {
      goto LABEL_10;
    }
    -[GEOPDComponentFilter setTransitTripStopTimeFilter:]((uint64_t)v5, v6);
    uint64_t v20 = v5;
  }
  return v5;
}

@end