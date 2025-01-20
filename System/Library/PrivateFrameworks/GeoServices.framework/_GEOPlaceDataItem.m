@interface _GEOPlaceDataItem
- ($F24F406B2B787EFB06265DBA3D28CBD5)centerCoordinate;
- ($F24F406B2B787EFB06265DBA3D28CBD5)coordinate;
- ($F24F406B2B787EFB06265DBA3D28CBD5)labelCoordinate;
- (BOOL)_canDownloadMorePhotos;
- (BOOL)_enableRAPLightweightFeedback;
- (BOOL)_hasAnyAmenities;
- (BOOL)_hasAppleRatings;
- (BOOL)_hasAreaHighlightId;
- (BOOL)_hasAreaInMeters;
- (BOOL)_hasBrandMUID;
- (BOOL)_hasBusinessHours;
- (BOOL)_hasCaptionedPhotoAlbum;
- (BOOL)_hasCurrentOperatingHours;
- (BOOL)_hasEVCharger;
- (BOOL)_hasEnclosingPlace;
- (BOOL)_hasEncyclopedicInfo;
- (BOOL)_hasFeatureLink;
- (BOOL)_hasFlyover;
- (BOOL)_hasGroundViewLocationId;
- (BOOL)_hasLinkedServices;
- (BOOL)_hasLocalizedCategoryNamesForType:(unsigned int)a3;
- (BOOL)_hasMUID;
- (BOOL)_hasOperatingHours;
- (BOOL)_hasPOIClaim;
- (BOOL)_hasPlaceCollectionPullQuotes;
- (BOOL)_hasPlaceDescription;
- (BOOL)_hasPlaceQuestionnaire;
- (BOOL)_hasPriceRange;
- (BOOL)_hasResolvablePartialInformation;
- (BOOL)_hasResultProviderID;
- (BOOL)_hasTelephone;
- (BOOL)_hasTransit;
- (BOOL)_hasUserRatingScore;
- (BOOL)_hasVenueFeatureType;
- (BOOL)_hasWifiFingerprintConfidence;
- (BOOL)_hasWifiFingerprintLabelStatusCode;
- (BOOL)_hasWifiFingerprintLabelType;
- (BOOL)_isInLinkedPlaceRelationship;
- (BOOL)_isPartiallyClientized;
- (BOOL)_isStandaloneBrand;
- (BOOL)_isTransitDisplayFeature;
- (BOOL)_needsAttribution;
- (BOOL)_optsOutOfTelephoneAds;
- (BOOL)_responseStatusIsIncomplete;
- (BOOL)_showSuggestAnEditButton;
- (BOOL)contactIsMe;
- (BOOL)hasDisplayMaxZoom;
- (BOOL)hasDisplayMinZoom;
- (BOOL)hasExpiredComponents;
- (BOOL)hasVenueCapacity;
- (BOOL)isDisputed;
- (BOOL)isEqualToMapItem:(id)a3;
- (BOOL)isEventAllDay;
- (BOOL)isValid;
- (BOOL)supportsOfflineMaps;
- (GEOAddress)geoAddress;
- (GEOAnnotatedItemList)_annotatedItemList;
- (GEOAppleRating)_overallAppleRating;
- (GEOAssociatedApp)_associatedApp;
- (GEOBusinessAssets)businessAssets;
- (GEOEVCharger)_evCharger;
- (GEOEnclosingPlace)_enclosingPlace;
- (GEOEncyclopedicInfo)_encyclopedicInfo;
- (GEOEnhancedPlacement)_enhancedPlacement;
- (GEOEnrichmentData)_enrichmentData;
- (GEOEnrichmentInfo)_enrichmentInfo;
- (GEOExploreGuides)_exploreGuides;
- (GEOFeatureStyleAttributes)_styleAttributes;
- (GEOHikeSummary)_hikeSummary;
- (GEOInlineRapEnablement)_inlineRapEnablement;
- (GEOLabelGeometry)_labelGeometry;
- (GEOLocalizedString)disclaimerText;
- (GEOMapItemClientAttributes)_clientAttributes;
- (GEOMapItemContainedPlace)_containedPlace;
- (GEOMapItemDetourInfo)detourInfo;
- (GEOMapItemIdentifier)_identifier;
- (GEOMapItemIdentifier)transitStationIdentifier;
- (GEOMapItemPhotosAttribution)_photosAttribution;
- (GEOMapItemPlaceAttribution)_attribution;
- (GEOMapItemReviewsAttribution)_reviewsAttribution;
- (GEOMapItemTransitInfo)_transitInfo;
- (GEOMapItemVenueInfo)_venueInfo;
- (GEOMapRegion)displayMapRegion;
- (GEOMapRegion)displayMapRegionOrNil;
- (GEOMapRegion)geoFenceMapRegion;
- (GEOMapRegion)geoFenceMapRegionOrNil;
- (GEOMapRegion)offlineDownloadRegion;
- (GEOMessageLink)_messageLink;
- (GEOMiniBrowseCategories)_miniBrowseCategories;
- (GEOMuninViewState)_muninViewState;
- (GEOPDFlyover)_flyover;
- (GEOPDHikeAssociatedInfo)_hikeAssociatedInfo;
- (GEOPDHikeGeometry)_hikeGeometry;
- (GEOPDPlace)_placeData;
- (GEOPDURLData)urlData;
- (GEOPOIClaim)_poiClaim;
- (GEOPlace)_place;
- (GEOPlaceQuestionnaire)_placeQuestionnaire;
- (GEOPlaceResult)_placeResult;
- (GEOPlacecardLayoutData)_placecardLayoutData;
- (GEOPriceDescription)_priceDescription;
- (GEORestaurantFeaturesLink)_featureLink;
- (GEOStorefrontInfo)_storefrontInfo;
- (GEOStorefrontPresentationInfo)_storefrontPresentationInfo;
- (GEOStyleAttributes)_walletCategoryStyling;
- (GEOStyleAttributes)_walletPlaceStyling;
- (GEOTooltip)_tooltip;
- (GEOTrailHead)_trailHead;
- (GEOTransitAttribution)_transitAttribution;
- (GEOTransitVehiclePosition)_transitVehiclePosition;
- (GEOViewportFrame)_viewportFrame;
- (NSArray)_additionalPlaceInfos;
- (NSArray)_allPhotoAttributions;
- (NSArray)_alternateMapsCategoryIDs;
- (NSArray)_alternateMapsCategoryMUIDs;
- (NSArray)_alternateSearchableNames;
- (NSArray)_amenities;
- (NSArray)_appleRatings;
- (NSArray)_browseCategories;
- (NSArray)_businessHours;
- (NSArray)_captionedPhotoAlbums;
- (NSArray)_childItems;
- (NSArray)_externalActionLinks;
- (NSArray)_identifierHistory;
- (NSArray)_linkedServices;
- (NSArray)_photos;
- (NSArray)_placeCollectionPullQuotes;
- (NSArray)_placeCollections;
- (NSArray)_placeCollectionsIds;
- (NSArray)_quickLinks;
- (NSArray)_relatedPlaceLists;
- (NSArray)_reviews;
- (NSArray)_roadAccessPoints;
- (NSArray)_searchResultPhotoCarousel;
- (NSArray)_secondaryQuickLinks;
- (NSArray)_tips;
- (NSArray)areasOfInterest;
- (NSArray)spatialMappedCategories;
- (NSArray)spatialMappedPlaceCategories;
- (NSArray)supportedTransitPaymentMethods;
- (NSArray)transitPaymentMethodSuggestions;
- (NSData)_placeDataAsData;
- (NSData)encodedData;
- (NSData)externalTransitStationCode;
- (NSDate)eventDate;
- (NSDictionary)addressDictionary;
- (NSNumber)_mapsCategoryMUID;
- (NSSet)_alternateIdentifiers;
- (NSString)_bestAvailableCountryCode;
- (NSString)_businessURL;
- (NSString)_disambiguationName;
- (NSString)_flyoverAnnouncementMessage;
- (NSString)_iso3166CountryCode;
- (NSString)_iso3166SubdivisionCode;
- (NSString)_mapsCategoryId;
- (NSString)_placeDescription;
- (NSString)_poiCategory;
- (NSString)_poiPinpointURLString;
- (NSString)_poiSurveyURLString;
- (NSString)_resultSnippetLocationString;
- (NSString)_telephone;
- (NSString)_vendorID;
- (NSString)_walletCategoryIdentifier;
- (NSString)_walletCategoryLocalizedString;
- (NSString)_walletCategoryLocalizedStringLocale;
- (NSString)_walletMapsCategoryIdentifier;
- (NSString)_walletPlaceLocalizedString;
- (NSString)_walletPlaceLocalizedStringLocale;
- (NSString)contactName;
- (NSString)contactSpokenName;
- (NSString)description;
- (NSString)eventName;
- (NSString)name;
- (NSString)secondaryName;
- (NSString)secondarySpokenName;
- (NSTimeZone)timezone;
- (NSURL)_providerURL;
- (NSURL)_webURL;
- (_GEOPlaceDataItem)initWithPlaceData:(id)a3;
- (_GEOPlaceDataItem)initWithPlaceData:(id)a3 attributionMap:(id)a4 disambiguationLabel:(id)a5 detourInfo:(id)a6 externalTransitStationCode:(id)a7 additionalPlaces:(id)a8;
- (_GEOPlaceDataItem)initWithPlaceData:(id)a3 detourInfo:(id)a4;
- (_GEOPlaceDataItem)initWithPlaceData:(id)a3 detourInfo:(id)a4 additionalPlaceDatas:(id)a5;
- (double)_areaInMeters;
- (double)cachingRadiusMeters;
- (float)_normalizedUserRatingScore;
- (float)_photosMemoryScore;
- (float)displayMaxZoom;
- (float)displayMinZoom;
- (id)_arrivalMapRegionForTransportType:(int)a3;
- (id)_asPlaceInfo;
- (id)_bestAvatarBrandIconURLForSize:(CGSize)a3 allowSmaller:(BOOL)a4;
- (id)_bestBrandIconOfType:(unsigned int)a3 size:(double)a4 allowSmaller:(double)a5;
- (id)_bestHeroBrandIconURLForSize:(CGSize)a3 allowSmaller:(BOOL)a4;
- (id)_bestNavbarBrandIconURLForSize:(CGSize)a3 allowSmaller:(BOOL)a4;
- (id)_firstRelatedPlaceListForType:(int)a3;
- (id)_groundViewLabel;
- (id)_iso3166Value;
- (id)_localizedCategoryNamesForType:(unsigned int)a3;
- (id)_mapItemBySettingIsTransitDisplayFeature:(BOOL)a3;
- (id)_mapItemByStrippingOptionalData;
- (id)_relatedPlaceListForComponentIdentifier:(int)a3;
- (id)_relatedPlacesByComponentId;
- (id)_spokenAddressForLocale:(id)a3;
- (id)_wifiFingerprintComponent;
- (id)addressObject;
- (id)shortAddress;
- (id)spokenNameForLocale:(id)a3;
- (id)weatherDisplayName;
- (int)_RAPFlowType;
- (int)_addressGeocodeAccuracy;
- (int)_hikeGeometryElevationModel;
- (int)_parsecSectionType;
- (int)_placeCategoryType;
- (int)_placeDisplayStyle;
- (int)_placeDisplayType;
- (int)_placeType;
- (int)_resultProviderID;
- (int)_venueFeatureType;
- (int)_wifiFingerprintLabelStatusCode;
- (int)_wifiFingerprintLabelType;
- (int)contactAddressType;
- (int)mapDisplayType;
- (int)referenceFrame;
- (int64_t)venueCapacity;
- (unint64_t)_areaHighlightId;
- (unint64_t)_brandMUID;
- (unint64_t)_customIconID;
- (unint64_t)_groundViewLocationId;
- (unint64_t)_muid;
- (unint64_t)_openingHoursOptions;
- (unint64_t)_totalPhotoCount;
- (unint64_t)hash;
- (unsigned)_maxScoreForPriceRange;
- (unsigned)_priceRange;
- (unsigned)_resultSnippetDistanceDisplayThreshold;
- (unsigned)_sampleSizeForUserRatingScore;
- (unsigned)_wifiFingerprintConfidence;
- (void)_placeDataStyleAttributes;
- (void)_refreshPhotoAttributions;
- (void)iterateGroundViewsWithBlock:(id)a3;
@end

@implementation _GEOPlaceDataItem

- (GEOLabelGeometry)_labelGeometry
{
  v2 = +[GEOPDLabelGeometry labelGeometryWithPlaceData:self->_placeData];
  if (v2) {
    v3 = [[GEOLabelGeometry alloc] initWithGEOPDLabelGeometry:v2];
  }
  else {
    v3 = 0;
  }

  return v3;
}

- (BOOL)_hasVenueFeatureType
{
  v2 = [(_GEOPlaceDataItem *)self _venueInfo];
  BOOL v3 = v2 != 0;

  return v3;
}

- (GEOMapItemVenueInfo)_venueInfo
{
  return self->_venueInfo;
}

- (BOOL)_hasResultProviderID
{
  placeData = self->_placeData;
  if (placeData) {
    LOBYTE(placeData) = [(GEOPDPlace *)placeData hasResultProviderId];
  }
  return (char)placeData;
}

- (BOOL)_hasMUID
{
  return [(GEOMapItemIdentifier *)self->_identifier muid] != 0;
}

- (unint64_t)_muid
{
  return [(GEOMapItemIdentifier *)self->_identifier muid];
}

- (int)_resultProviderID
{
  placeData = self->_placeData;
  if (!placeData || ![(GEOPDPlace *)placeData hasResultProviderId]) {
    return 0;
  }
  v4 = self->_placeData;

  return [(GEOPDPlace *)v4 resultProviderId];
}

- ($F24F406B2B787EFB06265DBA3D28CBD5)coordinate
{
  uint64_t v3 = +[GEOPDPlaceInfo placeInfoForPlaceData:self->_placeData];
  uint64_t v4 = v3;
  if (v3)
  {
    -[GEOPDPlaceInfo _readEnhancedCenter](v3);
    if (*(void *)(v4 + 48))
    {
      -[GEOPDPlaceInfo enhancedCenter]((id *)v4);
      v5 = (id *)objc_claimAutoreleasedReturnValue();
LABEL_6:
      v6 = v5;
      [v5 coordinate];
      unint64_t v8 = v7;
      unint64_t v10 = v9;
      goto LABEL_7;
    }
    -[GEOPDPlaceInfo _readCenter](v4);
    if (*(void *)(v4 + 40))
    {
      -[GEOPDPlaceInfo center]((id *)v4);
      v5 = (id *)objc_claimAutoreleasedReturnValue();
      goto LABEL_6;
    }
  }
  uint64_t v13 = +[GEOPDSpatialLookupResult spatialLookupResultForPlaceData:self->_placeData];
  v6 = (id *)v13;
  if (v13 && (-[GEOPDSpatialLookupResult _readCenter](v13), v6[7]))
  {
    v14 = -[GEOPDSpatialLookupResult center](v6);
    [v14 coordinate];
    unint64_t v8 = v15;
    unint64_t v10 = v16;
  }
  else
  {
    uint64_t v17 = +[GEOPDRoadAccessInfo roadAccessInfoForPlaceData:self->_placeData];
    v14 = (void *)v17;
    if (v17
      && [*(id *)(v17 + 16) count]
      && (-[GEOPDRoadAccessInfo roadAccessPointAtIndex:]((id *)v14, 0),
          (v18 = objc_claimAutoreleasedReturnValue()) != 0))
    {
      v19 = v18;
      v20 = [v18 location];
      [v20 coordinate];
      unint64_t v8 = v21;
      unint64_t v10 = v22;
    }
    else
    {
      uint64_t v23 = -[_GEOPlaceDataItem _iso3166Value]((uint64_t)self);
      uint64_t v24 = v23;
      unint64_t v8 = 0xC066800000000000;
      if (v23)
      {
        -[GEOPDISO3166Code _readLocation](v23);
        unint64_t v10 = 0xC066800000000000;
        if (*(void *)(v24 + 32))
        {
          v25 = -[GEOPDISO3166Code location]((id *)v24);
          [v25 coordinate];
          unint64_t v8 = v26;
          unint64_t v10 = v27;
        }
      }
      else
      {
        unint64_t v10 = 0xC066800000000000;
      }
    }
  }

LABEL_7:
  double v11 = *(double *)&v8;
  double v12 = *(double *)&v10;
  result.var1 = v12;
  result.var0 = v11;
  return result;
}

- (GEOFeatureStyleAttributes)_styleAttributes
{
  v2 = -[_GEOPlaceDataItem _placeDataStyleAttributes](self);
  if (v2) {
    uint64_t v3 = [[GEOFeatureStyleAttributes alloc] initWithPlaceDataStyleAttributes:v2];
  }
  else {
    uint64_t v3 = 0;
  }

  return v3;
}

- (void)_placeDataStyleAttributes
{
  v1 = a1;
  if (a1)
  {
    uint64_t v8 = 0;
    unint64_t v9 = &v8;
    uint64_t v10 = 0x3032000000;
    double v11 = __Block_byref_object_copy__54;
    double v12 = __Block_byref_object_dispose__54;
    id v13 = 0;
    v2 = (void *)a1[3];
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __46___GEOPlaceDataItem__placeDataStyleAttributes__block_invoke;
    v7[3] = &unk_1E53E16F0;
    v7[4] = &v8;
    [v2 enumerateValidComponentValuesOfType:16 usingBlock:v7];
    uint64_t v3 = (void *)v9[5];
    if (!v3)
    {
      uint64_t v4 = (void *)v1[3];
      v6[0] = MEMORY[0x1E4F143A8];
      v6[1] = 3221225472;
      v6[2] = __46___GEOPlaceDataItem__placeDataStyleAttributes__block_invoke_2;
      v6[3] = &unk_1E53E16F0;
      v6[4] = &v8;
      [v4 enumerateValidComponentValuesOfType:1 usingBlock:v6];
      uint64_t v3 = (void *)v9[5];
    }
    v1 = v3;
    _Block_object_dispose(&v8, 8);
  }

  return v1;
}

- (int)_placeDisplayType
{
  return [(GEOPDPlace *)self->_placeData placeDisplayType];
}

- (unint64_t)_customIconID
{
  v2 = -[_GEOPlaceDataItem _placeDataStyleAttributes](self);
  uint64_t v3 = v2;
  if (v2) {
    unint64_t v4 = [v2 customIconId];
  }
  else {
    unint64_t v4 = 0;
  }

  return v4;
}

- (id)_arrivalMapRegionForTransportType:(int)a3
{
  uint64_t v5 = +[GEOPDBounds boundsInfoForPlaceData:self->_placeData];
  uint64_t v6 = v5;
  if (v5)
  {
    -[GEOPDBounds _readMapRegion](v5);
    if (*(void *)(v6 + 32))
    {
      unint64_t v7 = -[GEOPDBounds mapRegion]((id *)v6);
      int v8 = [v7 isValid];

      if (v8)
      {
        unint64_t v9 = -[GEOPDBounds mapRegion]((id *)v6);
        goto LABEL_15;
      }
    }
  }
  uint64_t v10 = +[GEOPDEntity entityForPlaceData:self->_placeData];
  if (![v10 hasType]) {
    goto LABEL_13;
  }
  double v11 = [(_GEOPlaceDataItem *)self addressObject];
  if ([v11 hasKnownAccuracy])
  {
    double v12 = [(_GEOPlaceDataItem *)self addressObject];
    int v13 = [v12 knownAccuracy];

    if (v13) {
      goto LABEL_13;
    }
  }
  else
  {
  }
  unsigned int v14 = [(_GEOPlaceDataItem *)self _placeType];
  unint64_t v9 = 0;
  if (v14 > 0x11 || ((1 << v14) & 0x29500) == 0) {
    goto LABEL_14;
  }
  if (!a3)
  {
    unint64_t v9 = [(_GEOPlaceDataItem *)self geoFenceMapRegion];
    goto LABEL_14;
  }
LABEL_13:
  unint64_t v9 = 0;
LABEL_14:

LABEL_15:

  return v9;
}

- (GEOMapRegion)geoFenceMapRegion
{
  uint64_t v3 = +[GEOPDBounds boundsInfoForPlaceData:self->_placeData];
  uint64_t v4 = v3;
  if (v3
    && (-[GEOPDBounds _readMapRegion](v3), *(void *)(v4 + 32))
    && (-[GEOPDBounds mapRegion]((id *)v4),
        uint64_t v5 = objc_claimAutoreleasedReturnValue(),
        int v6 = [v5 isValid],
        v5,
        v6))
  {
    -[GEOPDBounds mapRegion]((id *)v4);
    unint64_t v7 = (GEOMapRegion *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    [(_GEOPlaceDataItem *)self coordinate];
    if (fabs(v9 + 180.0) >= 0.00000001 || fabs(v8 + 180.0) >= 0.00000001)
    {
      uint64_t v10 = +[GEOPDPlaceInfo placeInfoForPlaceData:self->_placeData];
      uint64_t v11 = v10;
      if (v10 && (-[GEOPDPlaceInfo _readCenter](v10), *(void *)(v11 + 40)))
      {
        double v12 = [(_GEOPlaceDataItem *)self addressObject];
        if ([v12 hasKnownAccuracy])
        {
          int v13 = [(_GEOPlaceDataItem *)self addressObject];
          if ([v13 knownAccuracy]) {
            double v14 = 100.0;
          }
          else {
            double v14 = 50.0;
          }
        }
        else
        {
          double v14 = 100.0;
        }

        unint64_t v15 = -[GEOPDPlaceInfo center]((id *)v11);
        [v15 coordinate];
        double v18 = GEOMapRectMakeWithRadialDistance(v16, v17, v14);
        double v20 = v19;
        double v22 = v21;
        double v24 = v23;

        unint64_t v7 = -[GEOMapRegion initWithMapRect:]([GEOMapRegion alloc], "initWithMapRect:", v18, v20, v22, v24);
      }
      else
      {
        unint64_t v7 = 0;
      }
    }
    else
    {
      unint64_t v7 = 0;
    }
  }

  return v7;
}

- (NSString)_poiCategory
{
  v2 = [(_GEOPlaceDataItem *)self _styleAttributes];
  if (v2)
  {
    uint64_t v3 = +[GEOPOITypeMapping sharedMapping];
    uint64_t v4 = objc_msgSend(v3, "categoryForPOIType:", objc_msgSend(v2, "poiType"));
  }
  else
  {
    uint64_t v4 = 0;
  }

  return (NSString *)v4;
}

- (BOOL)_hasResolvablePartialInformation
{
  uint64_t v2 = +[GEOPDPlaceInfo placeInfoForPlaceData:self->_placeData];
  BOOL v3 = v2 && (*(_WORD *)(v2 + 92) & 4) != 0 && *(unsigned char *)(v2 + 88) != 0;

  return v3;
}

- (_GEOPlaceDataItem)initWithPlaceData:(id)a3 detourInfo:(id)a4 additionalPlaceDatas:(id)a5
{
  id v8 = a4;
  id v9 = a3;
  uint64_t v10 = objc_msgSend(a5, "_geo_compactMap:", &__block_literal_global_103);
  uint64_t v11 = [(_GEOPlaceDataItem *)self initWithPlaceData:v9 attributionMap:0 disambiguationLabel:0 detourInfo:v8 externalTransitStationCode:0 additionalPlaces:v10];

  return v11;
}

- (_GEOPlaceDataItem)initWithPlaceData:(id)a3 attributionMap:(id)a4 disambiguationLabel:(id)a5 detourInfo:(id)a6 externalTransitStationCode:(id)a7 additionalPlaces:(id)a8
{
  v41[1] = *MEMORY[0x1E4F143B8];
  id v15 = a3;
  id v16 = a4;
  id v37 = a5;
  id v17 = a6;
  id v18 = a7;
  id v19 = a8;
  v40.receiver = self;
  v40.super_class = (Class)_GEOPlaceDataItem;
  double v20 = [(_GEOPlaceDataItem *)&v40 init];
  if (v20)
  {
    double v21 = [[GEOMapItemIdentifier alloc] initWithPlace:v15];
    identifier = v20->_identifier;
    v20->_identifier = v21;

    objc_storeStrong((id *)&v20->_placeData, a3);
    uint64_t v23 = geo_isolater_create_with_format();
    lazyIvarIsolater = v20->_lazyIvarIsolater;
    v20->_lazyIvarIsolater = (geo_isolater *)v23;

    v36 = v20;
    uint64_t v25 = geo_reentrant_isolater_create_with_format();
    lazyReentrantIvarIsolater = v20->_lazyReentrantIvarIsolater;
    v20->_lazyReentrantIvarIsolater = (geo_reentrant_isolater *)v25;

    if (v16)
    {
      unint64_t v27 = (NSMapTable *)v16;
      attributionMap = v20->_attributionMap;
      v20->_attributionMap = v27;
    }
    else
    {
      v41[0] = v20->_placeData;
      v29 = objc_msgSend(MEMORY[0x1E4F1C978], "arrayWithObjects:count:", v41, 1, v20);
      attributionMap = _attributionsToRequestForPlaceDatas(v29);

      if ([attributionMap count])
      {
        v38[0] = MEMORY[0x1E4F143A8];
        v38[1] = 3221225472;
        v38[2] = __129___GEOPlaceDataItem_initWithPlaceData_attributionMap_disambiguationLabel_detourInfo_externalTransitStationCode_additionalPlaces___block_invoke;
        v38[3] = &unk_1E53E4F00;
        v39 = v20;
        _loadAttributions(attributionMap, v38);
      }
    }

    objc_storeStrong((id *)&v20->_disambiguationLabel, a5);
    if (v17)
    {
      v30 = [[GEOMapItemDetourInfo alloc] initWithResultDetourInfo:v17];
      detourInfo = v20->_detourInfo;
      v20->_detourInfo = v30;
    }
    uint64_t v32 = objc_msgSend(v18, "copy", v36);
    externalTransitStationCode = v20->_externalTransitStationCode;
    v20->_externalTransitStationCode = (NSData *)v32;

    objc_storeStrong((id *)&v20->_additionalPlaces, a8);
    v34 = v20;
  }

  return v20;
}

- (BOOL)hasExpiredComponents
{
  placeData = self->_placeData;
  double Current = CFAbsoluteTimeGetCurrent();

  return [(GEOPDPlace *)placeData hasExpiredComponentsAsOf:Current];
}

- (GEOEnhancedPlacement)_enhancedPlacement
{
  uint64_t v2 = +[GEOPDEnhancedPlacement enhancedPlacementWithPlaceData:self->_placeData];
  if (v2) {
    BOOL v3 = [[GEOEnhancedPlacement alloc] initWithGEOPDEnhancedPlacement:v2];
  }
  else {
    BOOL v3 = 0;
  }

  return v3;
}

- (BOOL)_hasAreaHighlightId
{
  uint64_t v2 = +[GEOPDEntity entityForPlaceData:self->_placeData];
  char v3 = [v2 hasAreaHighlightId];

  return v3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_prioritizedBusinessHours, 0);
  objc_storeStrong((id *)&self->_timeZone, 0);
  objc_storeStrong((id *)&self->_lazyReentrantIvarIsolater, 0);
  objc_storeStrong((id *)&self->_allPhotoAttributions, 0);
  objc_storeStrong((id *)&self->_relatedPlacesByComponentId, 0);
  objc_storeStrong((id *)&self->_placecardLayoutData, 0);
  objc_storeStrong((id *)&self->_captionedPhotoAlbums, 0);
  objc_storeStrong((id *)&self->_childItems, 0);
  objc_storeStrong((id *)&self->_businessHours, 0);
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_addressObject, 0);
  objc_storeStrong((id *)&self->_additionalPlaces, 0);
  objc_storeStrong((id *)&self->_venueInfo, 0);
  objc_storeStrong((id *)&self->_storefrontPresentationInfo, 0);
  objc_storeStrong((id *)&self->_storefrontInfo, 0);
  objc_storeStrong((id *)&self->_encyclopedicInfo, 0);
  objc_storeStrong((id *)&self->_place, 0);
  objc_storeStrong((id *)&self->_lazyIvarIsolater, 0);
  objc_storeStrong((id *)&self->_externalTransitStationCode, 0);
  objc_storeStrong((id *)&self->_detourInfo, 0);
  objc_storeStrong((id *)&self->_disambiguationLabel, 0);
  objc_storeStrong((id *)&self->_attributionMap, 0);
  objc_storeStrong((id *)&self->_placeData, 0);
  objc_storeStrong((id *)&self->_alternateIdentifiers, 0);

  objc_storeStrong((id *)&self->_identifier, 0);
}

- (NSString)name
{
  return self->_name;
}

- (int)referenceFrame
{
  return [(GEOPDPlace *)self->_placeData referenceFrame];
}

- (void)_refreshPhotoAttributions
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  char v3 = _fetchPhotoRelatedDataAttributionsForPlaceData(self->_placeData);
  id v4 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  uint64_t v5 = [MEMORY[0x1E4F1CA80] set];
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  id v6 = v3;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v21 objects:v25 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v22;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v22 != v9) {
          objc_enumerationMutation(v6);
        }
        uint64_t v11 = *(id **)(*((void *)&v21 + 1) + 8 * i);
        double v12 = -[GEOPDAttribution vendorId](v11);
        char v13 = objc_msgSend(v5, "containsObject:", v12, (void)v21);

        if ((v13 & 1) == 0)
        {
          attributionMap = self->_attributionMap;
          id v15 = -[GEOPDAttribution vendorId](v11);
          id v16 = [(NSMapTable *)attributionMap objectForKey:v15];

          if (v16 && [v16 hasAttributionRequirement:3])
          {
            id v17 = +[GEOMapItemAttribution attributionWithDataAttribution:v11 searchInfo:v16 class:objc_opt_class()];
            [v4 addObject:v17];

            id v18 = -[GEOPDAttribution vendorId](v11);
            [v5 addObject:v18];
          }
        }
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v21 objects:v25 count:16];
    }
    while (v8);
  }

  id v19 = (NSArray *)[v4 copy];
  allPhotoAttributions = self->_allPhotoAttributions;
  self->_allPhotoAttributions = v19;
}

- (BOOL)isDisputed
{
  return [(GEOPDPlace *)self->_placeData isDisputed];
}

- (GEOPDPlace)_placeData
{
  return self->_placeData;
}

- (GEOPlace)_place
{
  return self->_place;
}

- (GEOMapItemClientAttributes)_clientAttributes
{
  return 0;
}

- (BOOL)isValid
{
  placeData = self->_placeData;
  if (placeData) {
    LOBYTE(placeData) = [(GEOPDPlace *)placeData statusCodeIsValid];
  }
  return (char)placeData;
}

- (NSArray)_additionalPlaceInfos
{
  return self->_additionalPlaces;
}

- (GEOMapItemDetourInfo)detourInfo
{
  return self->_detourInfo;
}

- (NSDictionary)addressDictionary
{
  char v3 = [(_GEOPlaceDataItem *)self geoAddress];
  id v4 = [v3 addressDictionary];

  uint64_t v5 = [v4 objectForKey:@"Name"];
  if (![v5 length])
  {
    id v6 = [(_GEOPlaceDataItem *)self name];
    if ([v6 length])
    {
      if (!v4)
      {
        id v4 = [MEMORY[0x1E4F1CA60] dictionary];
      }
      [v4 setObject:v6 forKey:@"Name"];
    }
  }

  return (NSDictionary *)v4;
}

- (GEOMapItemIdentifier)_identifier
{
  return self->_identifier;
}

- (id)addressObject
{
  return self->_addressObject;
}

- (int)_placeType
{
  return self->_placeType;
}

- (NSArray)areasOfInterest
{
  uint64_t v2 = [(_GEOPlaceDataItem *)self geoAddress];
  char v3 = [v2 structuredAddress];
  id v4 = [v3 areaOfInterests];

  return (NSArray *)v4;
}

- (GEOAddress)geoAddress
{
  return (GEOAddress *)+[GEOAddress geoAddressForPlaceData:self->_placeData];
}

- (int)_addressGeocodeAccuracy
{
  char v3 = [(_GEOPlaceDataItem *)self addressObject];
  int v4 = [v3 hasKnownAccuracy];

  if (!v4) {
    return -1;
  }
  uint64_t v5 = [(_GEOPlaceDataItem *)self addressObject];
  unsigned int v6 = [v5 knownAccuracy];
  if (v6 >= 6) {
    int v7 = -1;
  }
  else {
    int v7 = v6;
  }

  return v7;
}

- (NSArray)_photos
{
  uint64_t v52 = *MEMORY[0x1E4F143B8];
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  int v4 = [(_GEOPlaceDataItem *)self _allPhotoAttributions];
  long long v45 = 0u;
  long long v46 = 0u;
  long long v47 = 0u;
  long long v48 = 0u;
  uint64_t v5 = [v4 countByEnumeratingWithState:&v45 objects:v51 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v46;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v46 != v7) {
          objc_enumerationMutation(v4);
        }
        uint64_t v9 = *(void **)(*((void *)&v45 + 1) + 8 * i);
        uint64_t v10 = [v9 providerID];
        [v3 setObject:v9 forKey:v10];
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v45 objects:v51 count:16];
    }
    while (v6);
  }
  uint64_t v11 = +[GEOPDAttribution componentLevelAttributionForPlaceDataPhotos:self->_placeData];
  double v12 = +[GEOPDCaptionedPhoto captionedPhotosForPlaceData:self->_placeData];
  if ([v12 count])
  {
    objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(v12, "count"));
    id v36 = (id)objc_claimAutoreleasedReturnValue();
    long long v41 = 0u;
    long long v42 = 0u;
    long long v43 = 0u;
    long long v44 = 0u;
    id v13 = v12;
    uint64_t v14 = [v13 countByEnumeratingWithState:&v41 objects:v50 count:16];
    if (!v14) {
      goto LABEL_35;
    }
    uint64_t v15 = v14;
    v34 = v12;
    v35 = v4;
    uint64_t v16 = *(void *)v42;
    do
    {
      for (uint64_t j = 0; j != v15; ++j)
      {
        if (*(void *)v42 != v16) {
          objc_enumerationMutation(v13);
        }
        id v18 = *(id **)(*((void *)&v41 + 1) + 8 * j);
        if (v11 && (-[GEOPDAttribution _readVendorId](v11), *(void *)(v11 + 56)))
        {
          id v19 = -[GEOPDAttribution vendorId]((id *)v11);
        }
        else
        {
          -[GEOPDCaptionedPhoto attribution](v18);
          double v20 = (id *)objc_claimAutoreleasedReturnValue();
          id v19 = -[GEOPDAttribution vendorId](v20);
        }
        long long v21 = [_GEOPlaceDataPhoto alloc];
        long long v22 = [v3 objectForKeyedSubscript:v19];
        long long v23 = [(_GEOPlaceDataPhoto *)v21 initWithCaptionedPhoto:v18 attribution:v22];

        if (v23) {
          [v36 addObject:v23];
        }
      }
      uint64_t v15 = [v13 countByEnumeratingWithState:&v41 objects:v50 count:16];
    }
    while (v15);
    goto LABEL_34;
  }
  id v13 = +[GEOPDPhoto photosForPlaceData:self->_placeData];
  if ([v13 count])
  {
    v34 = v12;
    v35 = v4;
    objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(v13, "count"));
    id v36 = (id)objc_claimAutoreleasedReturnValue();
    long long v37 = 0u;
    long long v38 = 0u;
    long long v39 = 0u;
    long long v40 = 0u;
    id v13 = v13;
    uint64_t v24 = [v13 countByEnumeratingWithState:&v37 objects:v49 count:16];
    if (v24)
    {
      uint64_t v25 = v24;
      uint64_t v26 = *(void *)v38;
      do
      {
        for (uint64_t k = 0; k != v25; ++k)
        {
          if (*(void *)v38 != v26) {
            objc_enumerationMutation(v13);
          }
          uint64_t v28 = *(void *)(*((void *)&v37 + 1) + 8 * k);
          v29 = [_GEOPlaceDataPhoto alloc];
          v30 = -[GEOPDAttribution vendorId]((id *)v11);
          v31 = [v3 objectForKeyedSubscript:v30];
          uint64_t v32 = [(_GEOPlaceDataPhoto *)v29 initWithPhoto:v28 attribution:v31];

          if (v32) {
            [v36 addObject:v32];
          }
        }
        uint64_t v25 = [v13 countByEnumeratingWithState:&v37 objects:v49 count:16];
      }
      while (v25);
    }

LABEL_34:
    double v12 = v34;
    int v4 = v35;
    goto LABEL_35;
  }
  id v36 = 0;
LABEL_35:

  return (NSArray *)v36;
}

- (NSArray)_allPhotoAttributions
{
  uint64_t v4 = 0;
  uint64_t v5 = &v4;
  uint64_t v6 = 0x3032000000;
  uint64_t v7 = __Block_byref_object_copy__54;
  uint64_t v8 = __Block_byref_object_dispose__54;
  id v9 = 0;
  geo_isolate_sync();
  id v2 = (id)v5[5];
  _Block_object_dispose(&v4, 8);

  return (NSArray *)v2;
}

- (NSString)_iso3166SubdivisionCode
{
  -[_GEOPlaceDataItem _iso3166Value]((uint64_t)self);
  id v2 = (id *)objc_claimAutoreleasedReturnValue();
  id v3 = -[GEOPDISO3166Code subdivisonCode](v2);

  return (NSString *)v3;
}

- (NSString)_iso3166CountryCode
{
  -[_GEOPlaceDataItem _iso3166Value]((uint64_t)self);
  id v2 = (id *)objc_claimAutoreleasedReturnValue();
  id v3 = -[GEOPDISO3166Code countryCode](v2);

  return (NSString *)v3;
}

- (id)_iso3166Value
{
  if (a1)
  {
    v1 = [*(id *)(a1 + 24) componentOfType:77 options:3];
    id v2 = -[GEOPDComponent values](v1);
    id v3 = [v2 firstObject];
    uint64_t v4 = -[GEOPDComponentValue iso3166Code](v3);
  }
  else
  {
    uint64_t v4 = 0;
  }

  return v4;
}

- ($F24F406B2B787EFB06265DBA3D28CBD5)centerCoordinate
{
  uint64_t v3 = +[GEOPDPlaceInfo placeInfoForPlaceData:self->_placeData];
  uint64_t v4 = v3;
  if (v3)
  {
    -[GEOPDPlaceInfo _readEnhancedCenter](v3);
    if (*(void *)(v4 + 48))
    {
      -[GEOPDPlaceInfo enhancedCenter]((id *)v4);
      uint64_t v5 = (id *)objc_claimAutoreleasedReturnValue();
LABEL_6:
      uint64_t v6 = v5;
      [v5 coordinate];
      unint64_t v8 = v7;
      unint64_t v10 = v9;
      goto LABEL_7;
    }
    -[GEOPDPlaceInfo _readCenter](v4);
    if (*(void *)(v4 + 40))
    {
      -[GEOPDPlaceInfo center]((id *)v4);
      uint64_t v5 = (id *)objc_claimAutoreleasedReturnValue();
      goto LABEL_6;
    }
  }
  uint64_t v13 = +[GEOPDSpatialLookupResult spatialLookupResultForPlaceData:self->_placeData];
  uint64_t v6 = (id *)v13;
  unint64_t v8 = 0xC066800000000000;
  if (v13 && (-[GEOPDSpatialLookupResult _readCenter](v13), v6[7]))
  {
    uint64_t v14 = -[GEOPDSpatialLookupResult center](v6);
    [v14 coordinate];
    unint64_t v8 = v15;
    unint64_t v10 = v16;
  }
  else
  {
    unint64_t v10 = 0xC066800000000000;
  }
LABEL_7:

  double v11 = *(double *)&v8;
  double v12 = *(double *)&v10;
  result.var1 = v12;
  result.var0 = v11;
  return result;
}

- (NSArray)_roadAccessPoints
{
  id v2 = +[GEOPDRoadAccessInfo roadAccessInfoForPlaceData:self->_placeData];
  uint64_t v3 = -[GEOPDRoadAccessInfo roadAccessPoints](v2);

  return (NSArray *)v3;
}

- (BOOL)_isPartiallyClientized
{
  return [(GEOPDPlace *)self->_placeData isPartiallyClientizedSearchResult];
}

- (NSTimeZone)timezone
{
  uint64_t v4 = 0;
  uint64_t v5 = &v4;
  uint64_t v6 = 0x3032000000;
  unint64_t v7 = __Block_byref_object_copy__54;
  unint64_t v8 = __Block_byref_object_dispose__54;
  id v9 = 0;
  geo_reentrant_isolate_sync();
  id v2 = (id)v5[5];
  _Block_object_dispose(&v4, 8);

  return (NSTimeZone *)v2;
}

- (int)_wifiFingerprintLabelType
{
  uint64_t v2 = -[_GEOPlaceDataItem _wifiFingerprintComponent]((uint64_t)self);
  if (v2 && (*(unsigned char *)(v2 + 28) & 2) != 0)
  {
    int v4 = *(_DWORD *)(v2 + 20);
    if (v4 == 2) {
      int v3 = 2;
    }
    else {
      int v3 = v4 == 1;
    }
  }
  else
  {
    int v3 = 0;
  }

  return v3;
}

- (unsigned)_wifiFingerprintConfidence
{
  uint64_t v2 = -[_GEOPlaceDataItem _wifiFingerprintComponent]((uint64_t)self);
  if (v2 && (*(unsigned char *)(v2 + 28) & 1) != 0) {
    unsigned int v3 = *(_DWORD *)(v2 + 16);
  }
  else {
    unsigned int v3 = 0;
  }

  return v3;
}

- (id)_wifiFingerprintComponent
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  if (a1)
  {
    long long v22 = 0u;
    long long v23 = 0u;
    long long v20 = 0u;
    long long v21 = 0u;
    v1 = [*(id *)(a1 + 24) components];
    uint64_t v2 = [v1 countByEnumeratingWithState:&v20 objects:v25 count:16];
    if (v2)
    {
      uint64_t v3 = v2;
      uint64_t v4 = *(void *)v21;
      uint64_t v5 = &OBJC_IVAR___GEOXPCReply__error;
      do
      {
        for (uint64_t i = 0; i != v3; ++i)
        {
          if (*(void *)v21 != v4) {
            objc_enumerationMutation(v1);
          }
          uint64_t v7 = *(void *)(*((void *)&v20 + 1) + 8 * i);
          if (v7 && (*(_WORD *)(v7 + 100) & 0x80) != 0 && *(_DWORD *)(v7 + v5[736]) == 51)
          {
            long long v18 = 0u;
            long long v19 = 0u;
            long long v16 = 0u;
            long long v17 = 0u;
            unint64_t v8 = -[GEOPDComponent values]((id *)v7);
            uint64_t v9 = [v8 countByEnumeratingWithState:&v16 objects:v24 count:16];
            if (v9)
            {
              uint64_t v10 = v9;
              uint64_t v11 = *(void *)v17;
              while (2)
              {
                for (uint64_t j = 0; j != v10; ++j)
                {
                  if (*(void *)v17 != v11) {
                    objc_enumerationMutation(v8);
                  }
                  uint64_t v13 = *(void *)(*((void *)&v16 + 1) + 8 * j);
                  if (v13 && *(void *)(v13 + 760))
                  {
                    uint64_t v14 = -[GEOPDComponentValue wifiFingerprint]((id *)v13);

                    goto LABEL_25;
                  }
                }
                uint64_t v10 = [v8 countByEnumeratingWithState:&v16 objects:v24 count:16];
                if (v10) {
                  continue;
                }
                break;
              }
            }

            uint64_t v5 = &OBJC_IVAR___GEOXPCReply__error;
          }
        }
        uint64_t v3 = [v1 countByEnumeratingWithState:&v20 objects:v25 count:16];
        uint64_t v14 = 0;
      }
      while (v3);
    }
    else
    {
      uint64_t v14 = 0;
    }
LABEL_25:
  }
  else
  {
    uint64_t v14 = 0;
  }

  return v14;
}

- (NSArray)_relatedPlaceLists
{
  uint64_t v2 = [(_GEOPlaceDataItem *)self _relatedPlacesByComponentId];
  uint64_t v3 = [v2 allValues];
  uint64_t v4 = (void *)[v3 copy];

  return (NSArray *)v4;
}

- (id)_relatedPlacesByComponentId
{
  return self->_relatedPlacesByComponentId;
}

- (BOOL)_hasTransit
{
  uint64_t v3 = +[GEOPDTransitInfo transitInfoForPlaceData:self->_placeData];
  if (v3)
  {
    BOOL v4 = 1;
  }
  else
  {
    uint64_t v5 = +[GEOPDTransitInfoSnippet transitInfoSnippetForPlaceData:self->_placeData];
    BOOL v4 = v5 != 0;
  }
  return v4;
}

- ($F24F406B2B787EFB06265DBA3D28CBD5)labelCoordinate
{
  uint64_t v2 = +[GEOPDPlaceInfo placeInfoForPlaceData:self->_placeData];
  uint64_t v3 = v2;
  unint64_t v4 = 0xC066800000000000;
  if (v2)
  {
    -[GEOPDPlaceInfo _readLabelPoint](v2);
    unint64_t v5 = 0xC066800000000000;
    if (*(void *)(v3 + 56))
    {
      uint64_t v6 = -[GEOPDPlaceInfo labelPoint]((id *)v3);
      [v6 coordinate];
      unint64_t v4 = v7;
      unint64_t v5 = v8;
    }
  }
  else
  {
    unint64_t v5 = 0xC066800000000000;
  }

  double v9 = *(double *)&v4;
  double v10 = *(double *)&v5;
  result.var1 = v10;
  result.var0 = v9;
  return result;
}

- (_GEOPlaceDataItem)initWithPlaceData:(id)a3
{
  return [(_GEOPlaceDataItem *)self initWithPlaceData:a3 attributionMap:0 disambiguationLabel:0 detourInfo:0 externalTransitStationCode:0 additionalPlaces:0];
}

- (_GEOPlaceDataItem)initWithPlaceData:(id)a3 detourInfo:(id)a4
{
  return [(_GEOPlaceDataItem *)self initWithPlaceData:a3 attributionMap:0 disambiguationLabel:0 detourInfo:a4 externalTransitStationCode:0 additionalPlaces:0];
}

- (NSString)description
{
  uint64_t v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)_GEOPlaceDataItem;
  unint64_t v4 = [(_GEOPlaceDataItem *)&v8 description];
  unint64_t v5 = [(GEOPDPlace *)self->_placeData formattedText];
  uint64_t v6 = [v3 stringWithFormat:@"%@ PlaceData: %@", v4, v5];

  return (NSString *)v6;
}

- (unint64_t)hash
{
  return [(GEOPDPlace *)self->_placeData hash];
}

- (BOOL)isEqualToMapItem:(id)a3
{
  placeData = self->_placeData;
  unint64_t v4 = [a3 _placeData];
  LOBYTE(placeData) = [(GEOPDPlace *)placeData isEqual:v4];

  return (char)placeData;
}

- (NSString)secondaryName
{
  return (NSString *)[(GEOPDPlace *)self->_placeData secondaryName];
}

- (NSString)secondarySpokenName
{
  return (NSString *)[(GEOPDPlace *)self->_placeData secondarySpokenName];
}

- (BOOL)_hasBusinessHours
{
  uint64_t v2 = +[GEOPDBusinessHours businessHoursForPlaceData:self->_placeData];
  BOOL v3 = [v2 count] != 0;

  return v3;
}

- (NSArray)_businessHours
{
  uint64_t v4 = 0;
  unint64_t v5 = &v4;
  uint64_t v6 = 0x3032000000;
  unint64_t v7 = __Block_byref_object_copy__54;
  objc_super v8 = __Block_byref_object_dispose__54;
  id v9 = 0;
  geo_reentrant_isolate_sync();
  id v2 = (id)v5[5];
  _Block_object_dispose(&v4, 8);

  return (NSArray *)v2;
}

- (BOOL)_hasLinkedServices
{
  id v2 = +[GEOPDLinkedService linkedServicesForPlaceData:self->_placeData];
  BOOL v3 = [v2 count] != 0;

  return v3;
}

- (NSArray)_linkedServices
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  BOOL v3 = +[GEOPDLinkedService linkedServicesForPlaceData:self->_placeData];
  uint64_t v4 = objc_opt_new();
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id v5 = v3;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v17;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v17 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = *(void *)(*((void *)&v16 + 1) + 8 * i);
        uint64_t v11 = [GEOLinkedService alloc];
        double v12 = [(_GEOPlaceDataItem *)self timezone];
        uint64_t v13 = [(GEOLinkedService *)v11 initWithGEOPDLinkedService:v10 timeZone:v12];

        if (v13) {
          [v4 addObject:v13];
        }
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v7);
  }

  uint64_t v14 = (void *)[v4 copy];

  return (NSArray *)v14;
}

- (GEOAssociatedApp)_associatedApp
{
  id v2 = +[GEOPDAssociatedApp associatedAppForPlaceData:self->_placeData];
  if (v2) {
    BOOL v3 = [[GEOAssociatedApp alloc] initWithGEOPDAssociatedApp:v2];
  }
  else {
    BOOL v3 = 0;
  }

  return v3;
}

- (GEOPriceDescription)_priceDescription
{
  id v2 = +[GEOPDPriceDescription priceDescriptionForPlaceData:self->_placeData];
  if (v2) {
    BOOL v3 = [[GEOPriceDescription alloc] initWithGEOPDPriceDescription:v2];
  }
  else {
    BOOL v3 = 0;
  }

  return v3;
}

- (id)spokenNameForLocale:(id)a3
{
  return [(GEOPDPlace *)self->_placeData spokenNameForLocale:a3];
}

- (NSData)encodedData
{
  return (NSData *)[(GEOPDPlace *)self->_placeData data];
}

- (NSArray)spatialMappedCategories
{
  uint64_t v2 = +[GEOPDSpatialLookupResult spatialLookupResultForPlaceData:self->_placeData];
  BOOL v3 = (void *)v2;
  if (v2 && (-[GEOPDSpatialLookupResult _readMappedCategorys](v2), v3[4]))
  {
    uint64_t v4 = (void *)MEMORY[0x1E4F1CA48];
    -[GEOPDSpatialLookupResult _readMappedCategorys]((uint64_t)v3);
    id v5 = [v4 arrayWithCapacity:v3[4]];
    -[GEOPDSpatialLookupResult _readMappedCategorys]((uint64_t)v3);
    if (v3[4])
    {
      unint64_t v6 = 0;
      do
      {
        int v7 = -[GEOPDSpatialLookupResult mappedCategoryAtIndex:]((uint64_t)v3, v6);
        uint64_t v8 = [NSNumber numberWithInteger:_GEOSpatialLookupCategoryForGEOPDCategory(v7)];
        [v5 addObject:v8];

        ++v6;
        -[GEOPDSpatialLookupResult _readMappedCategorys]((uint64_t)v3);
      }
      while (v6 < v3[4]);
    }
  }
  else
  {
    id v5 = 0;
  }

  return (NSArray *)v5;
}

- (GEOMapRegion)displayMapRegion
{
  BOOL v3 = [(_GEOPlaceDataItem *)self displayMapRegionOrNil];
  uint64_t v4 = v3;
  if (v3)
  {
    id v5 = v3;
  }
  else
  {
    [(_GEOPlaceDataItem *)self coordinate];
    if (fabs(v7 + 180.0) < 0.00000001 && fabs(v6 + 180.0) < 0.00000001)
    {
      uint64_t v8 = 0;
      goto LABEL_8;
    }
    double v9 = GEOMapRectMakeWithRadialDistance(v6, v7, 10000.0);
    id v5 = -[GEOMapRegion initWithMapRect:]([GEOMapRegion alloc], "initWithMapRect:", v9, v10, v11, v12);
  }
  uint64_t v8 = v5;
LABEL_8:

  return v8;
}

- (GEOMapRegion)displayMapRegionOrNil
{
  uint64_t v2 = +[GEOPDBounds boundsInfoForPlaceData:self->_placeData];
  uint64_t v3 = v2;
  if (v2)
  {
    -[GEOPDBounds _readDisplayMapRegion](v2);
    if (*(void *)(v3 + 24))
    {
      uint64_t v4 = -[GEOPDBounds displayMapRegion]((id *)v3);
      int v5 = [v4 isValid];

      if (v5)
      {
        uint64_t v6 = -[GEOPDBounds displayMapRegion]((id *)v3);
LABEL_8:
        double v9 = (void *)v6;
        goto LABEL_10;
      }
    }
    -[GEOPDBounds _readMapRegion](v3);
    if (*(void *)(v3 + 32))
    {
      double v7 = -[GEOPDBounds mapRegion]((id *)v3);
      int v8 = [v7 isValid];

      if (v8)
      {
        uint64_t v6 = -[GEOPDBounds mapRegion]((id *)v3);
        goto LABEL_8;
      }
    }
  }
  double v9 = 0;
LABEL_10:

  return (GEOMapRegion *)v9;
}

- (GEOMapRegion)offlineDownloadRegion
{
  uint64_t v11 = 0;
  double v12 = &v11;
  uint64_t v13 = 0x3032000000;
  uint64_t v14 = __Block_byref_object_copy__54;
  unint64_t v15 = __Block_byref_object_dispose__54;
  id v16 = 0;
  placeData = self->_placeData;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __42___GEOPlaceDataItem_offlineDownloadRegion__block_invoke;
  v10[3] = &unk_1E53E16F0;
  v10[4] = &v11;
  [(GEOPDPlace *)placeData enumerateValidComponentValuesOfType:42 usingBlock:v10];
  uint64_t v4 = v12[5];
  if (v4
    && (-[GEOPDOfflineArea _readMapRegion](v12[5]), *(void *)(v4 + 32))
    && (-[GEOPDOfflineArea mapRegion]((id *)v12[5]),
        int v5 = objc_claimAutoreleasedReturnValue(),
        int v6 = [v5 isValid],
        v5,
        v6))
  {
    uint64_t v7 = -[GEOPDOfflineArea mapRegion]((id *)v12[5]);
  }
  else
  {
    uint64_t v7 = [(_GEOPlaceDataItem *)self displayMapRegion];
  }
  int v8 = (void *)v7;
  _Block_object_dispose(&v11, 8);

  return (GEOMapRegion *)v8;
}

- (BOOL)supportsOfflineMaps
{
  uint64_t v7 = 0;
  int v8 = &v7;
  uint64_t v9 = 0x3032000000;
  double v10 = __Block_byref_object_copy__54;
  uint64_t v11 = __Block_byref_object_dispose__54;
  id v12 = 0;
  placeData = self->_placeData;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __40___GEOPlaceDataItem_supportsOfflineMaps__block_invoke;
  v6[3] = &unk_1E53E16F0;
  v6[4] = &v7;
  [(GEOPDPlace *)placeData enumerateValidComponentValuesOfType:44 usingBlock:v6];
  uint64_t v3 = v8[5];
  BOOL v4 = v3 && (*(unsigned char *)(v3 + 24) & 2) != 0 && *(unsigned char *)(v3 + 20) != 0;
  _Block_object_dispose(&v7, 8);

  return v4;
}

- (BOOL)hasDisplayMinZoom
{
  uint64_t v2 = +[GEOPDBounds boundsInfoForPlaceData:self->_placeData];
  if (v2) {
    BOOL v3 = (v2[68] >> 1) & 1;
  }
  else {
    LOBYTE(v3) = 0;
  }

  return v3;
}

- (float)displayMinZoom
{
  uint64_t v2 = +[GEOPDBounds boundsInfoForPlaceData:self->_placeData];
  if (v2) {
    float v3 = v2[16];
  }
  else {
    float v3 = 0.0;
  }

  return v3;
}

- (BOOL)hasDisplayMaxZoom
{
  uint64_t v2 = +[GEOPDBounds boundsInfoForPlaceData:self->_placeData];
  if (v2) {
    BOOL v3 = v2[68] & 1;
  }
  else {
    BOOL v3 = 0;
  }

  return v3;
}

- (float)displayMaxZoom
{
  uint64_t v2 = +[GEOPDBounds boundsInfoForPlaceData:self->_placeData];
  if (v2) {
    float v3 = v2[15];
  }
  else {
    float v3 = 0.0;
  }

  return v3;
}

- (GEOMapRegion)geoFenceMapRegionOrNil
{
  uint64_t v2 = +[GEOPDBounds boundsInfoForPlaceData:self->_placeData];
  uint64_t v3 = v2;
  if (v2 && (-[GEOPDBounds _readMapRegion](v2), *(void *)(v3 + 32)))
  {
    BOOL v4 = -[GEOPDBounds mapRegion]((id *)v3);
    if ([v4 isValid])
    {
      int v5 = -[GEOPDBounds mapRegion]((id *)v3);
    }
    else
    {
      int v5 = 0;
    }
  }
  else
  {
    int v5 = 0;
  }

  return (GEOMapRegion *)v5;
}

- (int)mapDisplayType
{
  return [(GEOPDPlace *)self->_placeData mapDisplayType];
}

- (GEOLocalizedString)disclaimerText
{
  uint64_t v2 = +[GEOPDEntity entityForPlaceData:self->_placeData];
  uint64_t v3 = [v2 disclaimerText];

  return (GEOLocalizedString *)v3;
}

- (GEOPDURLData)urlData
{
  uint64_t v2 = +[GEOPDEntity entityForPlaceData:self->_placeData];
  uint64_t v3 = [v2 urlData];

  return (GEOPDURLData *)v3;
}

- (int)contactAddressType
{
  return 0;
}

- (NSString)contactName
{
  return 0;
}

- (NSString)contactSpokenName
{
  return 0;
}

- (BOOL)contactIsMe
{
  return 0;
}

- (NSString)eventName
{
  return 0;
}

- (NSDate)eventDate
{
  return 0;
}

- (BOOL)isEventAllDay
{
  return 0;
}

- (BOOL)_responseStatusIsIncomplete
{
  return [(GEOPDPlace *)self->_placeData status] == 2;
}

- (GEOPlaceResult)_placeResult
{
  return 0;
}

- (NSData)_placeDataAsData
{
  uint64_t v2 = [(_GEOPlaceDataItem *)self _placeData];
  uint64_t v3 = [v2 data];

  return (NSData *)v3;
}

- (id)_spokenAddressForLocale:(id)a3
{
  id v4 = a3;
  int v5 = [(_GEOPlaceDataItem *)self addressObject];
  int v6 = [v5 spokenAddressForLocale:v4];

  return v6;
}

- (GEOMapItemIdentifier)transitStationIdentifier
{
  uint64_t v12 = 0;
  uint64_t v13 = &v12;
  uint64_t v14 = 0x3032000000;
  unint64_t v15 = __Block_byref_object_copy__54;
  id v16 = __Block_byref_object_dispose__54;
  id v17 = 0;
  placeData = self->_placeData;
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __45___GEOPlaceDataItem_transitStationIdentifier__block_invoke;
  v11[3] = &unk_1E53E16F0;
  v11[4] = &v12;
  [(GEOPDPlace *)placeData enumerateValidComponentValuesOfType:21 usingBlock:v11];
  uint64_t v4 = v13[5];
  if (v4 && (*(unsigned char *)(v4 + 24) & 1) != 0)
  {
    int v6 = [GEOMapItemIdentifier alloc];
    uint64_t v7 = v13[5];
    if (v7) {
      uint64_t v8 = *(void *)(v7 + 16);
    }
    else {
      uint64_t v8 = 0;
    }
    [(_GEOPlaceDataItem *)self coordinate];
    uint64_t v5 = -[GEOMapItemIdentifier initWithMUID:coordinate:](v6, "initWithMUID:coordinate:", v8);
  }
  else
  {
    uint64_t v5 = [(_GEOPlaceDataItem *)self _identifier];
  }
  uint64_t v9 = (void *)v5;
  _Block_object_dispose(&v12, 8);

  return (GEOMapItemIdentifier *)v9;
}

- (BOOL)_isTransitDisplayFeature
{
  if (self->_isTransitDisplayFeature) {
    return 1;
  }
  uint64_t v3 = [(_GEOPlaceDataItem *)self _styleAttributes];
  char v4 = [v3 isTransit];

  return v4;
}

- (GEOMapItemTransitInfo)_transitInfo
{
  uint64_t v3 = +[GEOPDTransitInfo transitInfoForPlaceData:self->_placeData];
  placeData = self->_placeData;
  if (v3)
  {
    uint64_t v5 = +[GEOPDTransitSchedule transitScheduleForPlaceData:placeData];
    unsigned __int8 v26 = 0;
    uint64_t v6 = +[GEOPDTransitIncident transitIncidentsForPlaceData:self->_placeData hasTransitIncidentComponent:&v26];
    uint64_t v7 = +[GEOPDTransitIncident transitIncidentsTTLExpirationDateForPlaceData:self->_placeData];
    uint64_t v8 = +[_GEOTransitTripStop transitTripStopsForPlaceData:self->_placeData];
    uint64_t v9 = +[GEOPDTransitTripGeometry transitTripGeometryForPlaceData:self->_placeData];
    if ([v8 count]) {
      BOOL v10 = v9 == 0;
    }
    else {
      BOOL v10 = 1;
    }
    uint64_t v24 = (void *)v6;
    uint64_t v25 = (void *)v5;
    long long v23 = (void *)v7;
    if (v10)
    {
      unint64_t v15 = 0;
    }
    else
    {
      uint64_t v13 = [GEOComposedRoute alloc];
      uint64_t v14 = -[GEOPDTransitInfo lineAtIndex:](v3, 0);
      unint64_t v15 = [(GEOComposedRoute *)v13 initWithTransitGeometry:v9 andLine:v14 andStops:v8];
    }
    id v16 = +[GEOPDTransitNearbySchedule transitNearbyScheduleForPlaceData:self->_placeData];
    id v17 = [_GEOMapItemTransitInfo alloc];
    long long v18 = [(_GEOPlaceDataItem *)self timezone];
    uint64_t v19 = v26;
    int v20 = [(_GEOPlaceDataItem *)self _resultProviderID];
    [(_GEOPlaceDataItem *)self coordinate];
    LODWORD(v22) = v20;
    uint64_t v12 = -[_GEOMapItemTransitInfo initWithTransitInfo:schedule:timeZone:incidents:hasTransitIncidentComponent:incidentExpirationDate:providerID:coordinate:transitStops:composedRoute:nearbySchedule:](v17, "initWithTransitInfo:schedule:timeZone:incidents:hasTransitIncidentComponent:incidentExpirationDate:providerID:coordinate:transitStops:composedRoute:nearbySchedule:", v3, v25, v18, v24, v19, v23, v22, v8, v15, v16);
  }
  else
  {
    uint64_t v11 = +[GEOPDTransitInfoSnippet transitInfoSnippetForPlaceData:placeData];
    if (v11) {
      uint64_t v12 = [[_GEOMapItemTransitInfoSnippet alloc] initWithTransitInfoSnippet:v11];
    }
    else {
      uint64_t v12 = 0;
    }
  }

  return (GEOMapItemTransitInfo *)v12;
}

- (GEOTransitAttribution)_transitAttribution
{
  uint64_t v2 = +[GEOPDTransitAttribution transitAttributionForPlaceData:self->_placeData];
  if (v2) {
    uint64_t v3 = [[_GEOMapItemTransitAttribution alloc] initWithTransitAttribution:v2];
  }
  else {
    uint64_t v3 = 0;
  }

  return (GEOTransitAttribution *)v3;
}

- (GEOTransitVehiclePosition)_transitVehiclePosition
{
  return (GEOTransitVehiclePosition *)+[GEOPBTransitVehiclePosition transitVehiclePositionForPlaceData:self->_placeData];
}

- (NSArray)supportedTransitPaymentMethods
{
  uint64_t v8 = 0;
  uint64_t v9 = &v8;
  uint64_t v10 = 0x3032000000;
  uint64_t v11 = __Block_byref_object_copy__54;
  uint64_t v12 = __Block_byref_object_dispose__54;
  id v13 = 0;
  placeData = self->_placeData;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __51___GEOPlaceDataItem_supportedTransitPaymentMethods__block_invoke;
  v7[3] = &unk_1E53E16F0;
  v7[4] = &v8;
  [(GEOPDPlace *)placeData enumerateValidComponentValuesOfType:91 usingBlock:v7];
  uint64_t v3 = (id *)v9[5];
  if (v3)
  {
    char v4 = -[GEOPDTransitPaymentMethodInfo paymentMethods](v3);
    uint64_t v5 = objc_msgSend(v4, "_geo_compactMap:", &__block_literal_global_61_1);
  }
  else
  {
    uint64_t v5 = 0;
  }
  _Block_object_dispose(&v8, 8);

  return (NSArray *)v5;
}

- (NSArray)transitPaymentMethodSuggestions
{
  uint64_t v8 = 0;
  uint64_t v9 = &v8;
  uint64_t v10 = 0x3032000000;
  uint64_t v11 = __Block_byref_object_copy__54;
  uint64_t v12 = __Block_byref_object_dispose__54;
  id v13 = 0;
  placeData = self->_placeData;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __52___GEOPlaceDataItem_transitPaymentMethodSuggestions__block_invoke;
  v7[3] = &unk_1E53E16F0;
  v7[4] = &v8;
  [(GEOPDPlace *)placeData enumerateValidComponentValuesOfType:91 usingBlock:v7];
  uint64_t v3 = (id *)v9[5];
  if (v3)
  {
    char v4 = -[GEOPDTransitPaymentMethodInfo paymentMethodSuggestions](v3);
    uint64_t v5 = objc_msgSend(v4, "_geo_compactMap:", &__block_literal_global_65_2);
  }
  else
  {
    uint64_t v5 = 0;
  }
  _Block_object_dispose(&v8, 8);

  return (NSArray *)v5;
}

- (double)cachingRadiusMeters
{
  uint64_t v7 = 0;
  uint64_t v8 = &v7;
  uint64_t v9 = 0x3032000000;
  uint64_t v10 = __Block_byref_object_copy__54;
  uint64_t v11 = __Block_byref_object_dispose__54;
  id v12 = 0;
  placeData = self->_placeData;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __40___GEOPlaceDataItem_cachingRadiusMeters__block_invoke;
  v6[3] = &unk_1E53E16F0;
  v6[4] = &v7;
  [(GEOPDPlace *)placeData enumerateValidComponentValuesOfType:91 usingBlock:v6];
  uint64_t v3 = v8[5];
  if (v3) {
    double v4 = *(double *)(v3 + 24);
  }
  else {
    double v4 = 0.0;
  }
  _Block_object_dispose(&v7, 8);

  return v4;
}

- (BOOL)_hasFlyover
{
  uint64_t v2 = [(_GEOPlaceDataItem *)self _flyover];
  BOOL v3 = v2 != 0;

  return v3;
}

- (GEOPDFlyover)_flyover
{
  return (GEOPDFlyover *)+[GEOPDFlyover flyoverForPlaceData:self->_placeData];
}

- (NSString)_flyoverAnnouncementMessage
{
  uint64_t v2 = [(_GEOPlaceDataItem *)self _flyover];
  BOOL v3 = [v2 bestLocalizedAnnouncementMessage];

  return (NSString *)v3;
}

- (GEOMuninViewState)_muninViewState
{
  return 0;
}

- (GEOStorefrontInfo)_storefrontInfo
{
  return self->_storefrontInfo;
}

- (GEOStorefrontPresentationInfo)_storefrontPresentationInfo
{
  return self->_storefrontPresentationInfo;
}

- (NSSet)_alternateIdentifiers
{
  uint64_t v4 = 0;
  uint64_t v5 = &v4;
  uint64_t v6 = 0x3032000000;
  uint64_t v7 = __Block_byref_object_copy__54;
  uint64_t v8 = __Block_byref_object_dispose__54;
  id v9 = 0;
  geo_isolate_sync();
  id v2 = (id)v5[5];
  _Block_object_dispose(&v4, 8);

  return (NSSet *)v2;
}

- (BOOL)_hasAreaInMeters
{
  id v2 = +[GEOPDPlaceInfo placeInfoForPlaceData:self->_placeData];
  if (v2) {
    __int16 v3 = v2[46] & 1;
  }
  else {
    LOBYTE(v3) = 0;
  }

  return v3;
}

- (double)_areaInMeters
{
  id v2 = +[GEOPDPlaceInfo placeInfoForPlaceData:self->_placeData];
  if (v2) {
    double v3 = v2[3];
  }
  else {
    double v3 = 0.0;
  }

  return v3;
}

- (NSString)_businessURL
{
  return (NSString *)[(GEOPDPlace *)self->_placeData businessURL];
}

- (BOOL)_hasUserRatingScore
{
  if (self)
  {
    if ([(_GEOPlaceDataItem *)self _hasAppleRatings]) {
      uint64_t v3 = 4;
    }
    else {
      uint64_t v3 = 1;
    }
  }
  else
  {
    uint64_t v3 = 0;
  }
  uint64_t v4 = +[GEOPDRating ratingForPlaceData:self->_placeData type:v3];
  BOOL v5 = v4 && (*(unsigned char *)(v4 + 48) & 2) != 0 && *(_DWORD *)(v4 + 40) > 0;

  return v5;
}

- (unsigned)_sampleSizeForUserRatingScore
{
  if (self)
  {
    if ([(_GEOPlaceDataItem *)self _hasAppleRatings])
    {
      uint64_t v3 = [(_GEOPlaceDataItem *)self _overallAppleRating];
      unsigned int v4 = [v3 numberOfRatingsUsedForScore];
      goto LABEL_7;
    }
    uint64_t v5 = 1;
  }
  else
  {
    uint64_t v5 = 0;
  }
  uint64_t v6 = +[GEOPDRating ratingForPlaceData:self->_placeData type:v5];
  uint64_t v3 = (void *)v6;
  if (v6) {
    unsigned int v4 = *(_DWORD *)(v6 + 40);
  }
  else {
    unsigned int v4 = 0;
  }
LABEL_7:

  return v4;
}

- (float)_normalizedUserRatingScore
{
  if (!self) {
    return 0.0;
  }
  if ([(_GEOPlaceDataItem *)self _hasAppleRatings])
  {
    uint64_t v3 = [(_GEOPlaceDataItem *)self _overallAppleRating];
    [v3 percentage];
    double v5 = v4;

    float v6 = v5;
    return v6 * 100.0;
  }
  else
  {
    uint64_t v8 = +[GEOPDRating ratingForPlaceData:self->_placeData type:1];
    if (v8)
    {
      double v9 = *(double *)(v8 + 32);
      if (*(unsigned char *)(v8 + 48)) {
        double v9 = v9 * (5.0 / *(double *)(v8 + 24));
      }
    }
    else
    {
      double v9 = 0.0;
    }
    float v7 = v9;
  }
  return v7;
}

- (BOOL)_hasPriceRange
{
  id v2 = +[GEOPDRating ratingForPlaceData:self->_placeData type:3];
  if (v2) {
    BOOL v3 = (v2[48] >> 1) & 1;
  }
  else {
    LOBYTE(v3) = 0;
  }

  return v3;
}

- (unsigned)_priceRange
{
  id v2 = +[GEOPDRating ratingForPlaceData:self->_placeData type:3];
  if (v2) {
    double v3 = v2[4];
  }
  else {
    double v3 = 0.0;
  }
  unsigned int v4 = vcvtmd_u64_f64(v3);

  return v4;
}

- (unsigned)_maxScoreForPriceRange
{
  uint64_t v2 = +[GEOPDRating ratingForPlaceData:self->_placeData type:3];
  if (v2)
  {
    double v3 = 5.0;
    if (*(unsigned char *)(v2 + 48)) {
      double v3 = *(double *)(v2 + 24);
    }
  }
  else
  {
    double v3 = 0.0;
  }
  unsigned int v4 = vcvtmd_u64_f64(v3);

  return v4;
}

- (NSString)_resultSnippetLocationString
{
  uint64_t v2 = +[GEOPDResultSnippet resultSnippetForPlaceData:self->_placeData];
  uint64_t v3 = v2;
  if (v2 && (-[GEOPDResultSnippet _readLocationString](v2), *(void *)(v3 + 48)))
  {
    unsigned int v4 = -[GEOPDResultSnippet locationString]((id *)v3);
  }
  else
  {
    unsigned int v4 = 0;
  }

  return (NSString *)v4;
}

- (unsigned)_resultSnippetDistanceDisplayThreshold
{
  uint64_t v2 = +[GEOPDResultSnippet resultSnippetForPlaceData:self->_placeData];
  if (v2 && (*(_WORD *)(v2 + 96) & 1) != 0) {
    unsigned int v3 = *(_DWORD *)(v2 + 92);
  }
  else {
    unsigned int v3 = -1;
  }

  return v3;
}

- (NSArray)_childItems
{
  return self->_childItems;
}

- (id)_localizedCategoryNamesForType:(unsigned int)a3
{
  unsigned int v4 = +[GEOPDCategory categoryNamesForPlaceData:self->_placeData type:*(void *)&a3];
  if ([v4 count])
  {
    id v5 = v4;
  }
  else
  {
    uint64_t v6 = +[GEOPDResultSnippet resultSnippetForPlaceData:self->_placeData];
    uint64_t v7 = v6;
    if (v6 && (-[GEOPDResultSnippet _readCategory](v6), *(void *)(v7 + 24)))
    {
      uint64_t v8 = (void *)MEMORY[0x1E4F1C978];
      double v9 = -[GEOPDResultSnippet category]((id *)v7);
      id v5 = [v8 arrayWithObject:v9];
    }
    else
    {
      id v5 = 0;
    }
  }

  return v5;
}

- (BOOL)_hasLocalizedCategoryNamesForType:(unsigned int)a3
{
  if (+[GEOPDCategory hasCategoryNamesForPlaceData:self->_placeData type:*(void *)&a3])
  {
    return 1;
  }
  uint64_t v5 = +[GEOPDResultSnippet resultSnippetForPlaceData:self->_placeData];
  uint64_t v6 = (void *)v5;
  if (v5)
  {
    -[GEOPDResultSnippet _readCategory](v5);
    BOOL v4 = v6[3] != 0;
  }
  else
  {
    BOOL v4 = 0;
  }

  return v4;
}

- (BOOL)_hasAnyAmenities
{
  uint64_t v2 = [(_GEOPlaceDataItem *)self _amenities];
  BOOL v3 = [v2 count] != 0;

  return v3;
}

- (NSArray)_amenities
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  BOOL v4 = +[GEOPDAmenities stringBasedAmenityValuesForPlaceData:self->_placeData];
  if ([v4 count])
  {
    uint64_t v5 = +[GEOAmenityItem amenityItemsFromPDAmenityItems:v4];
    [v3 addObjectsFromArray:v5];
  }
  if ([v3 count])
  {
    uint64_t v6 = (void *)[v3 copy];
  }
  else
  {
    uint64_t v7 = +[GEOPDAmenities enumBasedAmenityValuesForPlaceData:self->_placeData];
    if ([v7 count])
    {
      uint64_t v8 = +[GEOAmenityItem amenityItemsFromPDAmenityItems:v7];
      [v3 addObjectsFromArray:v8];
    }
    uint64_t v6 = (void *)[v3 copy];
  }

  return (NSArray *)v6;
}

- (BOOL)_hasOperatingHours
{
  return +[GEOPDHours operatingHoursAvailableForPlaceData:self->_placeData];
}

- (BOOL)_hasCurrentOperatingHours
{
  placeData = self->_placeData;
  id v3 = [(_GEOPlaceDataItem *)self timezone];
  BOOL v4 = +[GEOPDHours currentOperatingHoursAvailableForPlaceData:placeData withTimeZone:v3];

  return v4;
}

- (unint64_t)_openingHoursOptions
{
  geo_isolate_sync();
  businessHours = self->_businessHours;
  BOOL v4 = [MEMORY[0x1E4F1C9C8] date];
  uint64_t v5 = [(_GEOPlaceDataItem *)self timezone];
  unint64_t v6 = +[GEOMapItemOpenState _geoMapItemOpeningHoursOptionsForBusinessHours:businessHours compareDate:v4 timeZone:v5];

  return v6;
}

- (BOOL)_hasEncyclopedicInfo
{
  id v3 = +[GEOPDTextBlock textBlockForPlaceData:self->_placeData];
  if (v3)
  {
    BOOL v4 = 1;
  }
  else
  {
    uint64_t v5 = +[GEOPDFactoid factoidsForPlaceData:self->_placeData];
    BOOL v4 = v5 != 0;
  }
  return v4;
}

- (GEOEncyclopedicInfo)_encyclopedicInfo
{
  if ([(_GEOPlaceDataItem *)self _hasEncyclopedicInfo])
  {
    geo_isolate_sync();
    id v3 = self->_encyclopedicInfo;
  }
  else
  {
    id v3 = 0;
  }

  return (GEOEncyclopedicInfo *)v3;
}

- (BOOL)_hasTelephone
{
  uint64_t v2 = [(GEOPDPlace *)self->_placeData phoneNumbers];
  BOOL v3 = [v2 count] != 0;

  return v3;
}

- (NSString)_telephone
{
  uint64_t v2 = [(GEOPDPlace *)self->_placeData phoneNumbers];
  BOOL v3 = [v2 firstObject];

  return (NSString *)v3;
}

- (BOOL)_optsOutOfTelephoneAds
{
  placeData = self->_placeData;
  BOOL v3 = [(_GEOPlaceDataItem *)self _telephone];
  LOBYTE(placeData) = [(GEOPDPlace *)placeData phoneNumberOptsOutOfAds:v3];

  return (char)placeData;
}

- (NSString)_disambiguationName
{
  return (NSString *)[(GEOPDMultiLocalizedString *)self->_disambiguationLabel bestLocalizedName];
}

- (GEOInlineRapEnablement)_inlineRapEnablement
{
  uint64_t v2 = +[GEOPDEntity entityForPlaceData:self->_placeData];
  BOOL v3 = [GEOInlineRapEnablement alloc];
  BOOL v4 = [v2 inlineRapEnablement];
  uint64_t v5 = [(GEOInlineRapEnablement *)v3 initWithEnablement:v4];

  return v5;
}

- (BOOL)_needsAttribution
{
  return [(NSMapTable *)self->_attributionMap count] != 0;
}

- (NSURL)_webURL
{
  uint64_t v2 = [(_GEOPlaceDataItem *)self _attribution];
  BOOL v3 = [v2 webURL];

  return (NSURL *)v3;
}

- (NSURL)_providerURL
{
  uint64_t v2 = [(_GEOPlaceDataItem *)self _webURL];
  if (v2)
  {
    BOOL v3 = [MEMORY[0x1E4F29088] componentsWithURL:v2 resolvingAgainstBaseURL:0];
    id v4 = objc_alloc_init(MEMORY[0x1E4F29088]);
    uint64_t v5 = [v3 scheme];
    [v4 setScheme:v5];

    unint64_t v6 = [v3 host];
    [v4 setHost:v6];

    uint64_t v7 = [v4 URL];
  }
  else
  {
    uint64_t v7 = 0;
  }

  return (NSURL *)v7;
}

- (NSString)_vendorID
{
  uint64_t v2 = +[GEOPDAttribution attributionForPlaceDataEntity:self->_placeData];
  BOOL v3 = -[GEOPDAttribution vendorId](v2);

  return (NSString *)v3;
}

- (NSString)_poiSurveyURLString
{
  if ([(_GEOPlaceDataItem *)self _hasMUID]
    && [(GEOPDPlace *)self->_placeData hasResultProviderId])
  {
    BOOL v3 = objc_msgSend(NSString, "stringWithFormat:", @"skyline://poi?businessID=%llu&providerID=%u", -[_GEOPlaceDataItem _muid](self, "_muid"), -[GEOPDPlace resultProviderId](self->_placeData, "resultProviderId"));
  }
  else
  {
    BOOL v3 = 0;
  }

  return (NSString *)v3;
}

- (NSString)_poiPinpointURLString
{
  if ([(_GEOPlaceDataItem *)self _hasMUID]
    && [(GEOPDPlace *)self->_placeData hasResultProviderId])
  {
    objc_msgSend(NSString, "stringWithFormat:", @"pinpoint://poi?businessID=%llu&providerID=%u", -[_GEOPlaceDataItem _muid](self, "_muid"), -[GEOPDPlace resultProviderId](self->_placeData, "resultProviderId"));
LABEL_6:
    BOOL v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
    goto LABEL_8;
  }
  if ([(_GEOPlaceDataItem *)self _hasMUID])
  {
    objc_msgSend(NSString, "stringWithFormat:", @"pinpoint://poi?businessID=%llu", -[_GEOPlaceDataItem _muid](self, "_muid"), v5);
    goto LABEL_6;
  }
  BOOL v3 = @"pinpoint://launch";
LABEL_8:

  return (NSString *)v3;
}

- (GEOMapItemPlaceAttribution)_attribution
{
  BOOL v3 = +[GEOPDAttribution attributionForPlaceDataEntity:self->_placeData];
  id v4 = v3;
  if (v3)
  {
    attributionMap = self->_attributionMap;
    unint64_t v6 = -[GEOPDAttribution vendorId](v3);
    uint64_t v7 = [(NSMapTable *)attributionMap objectForKey:v6];

    if (v7 && [v7 hasAttributionRequirement:1])
    {
      uint64_t v8 = +[GEOMapItemAttribution attributionWithDataAttribution:v4 searchInfo:v7 class:objc_opt_class()];
    }
    else
    {
      uint64_t v8 = 0;
    }
  }
  else
  {
    uint64_t v8 = 0;
  }

  return (GEOMapItemPlaceAttribution *)v8;
}

- (GEOMapItemPhotosAttribution)_photosAttribution
{
  uint64_t v2 = [(_GEOPlaceDataItem *)self _allPhotoAttributions];
  BOOL v3 = [v2 firstObject];

  return (GEOMapItemPhotosAttribution *)v3;
}

- (GEOMapItemReviewsAttribution)_reviewsAttribution
{
  BOOL v3 = +[GEOPDAttribution attributionForPlaceDataReview:self->_placeData];
  id v4 = v3;
  if (v3)
  {
    attributionMap = self->_attributionMap;
    unint64_t v6 = -[GEOPDAttribution vendorId](v3);
    uint64_t v7 = [(NSMapTable *)attributionMap objectForKey:v6];

    if (v7 && [v7 hasAttributionRequirement:2])
    {
      uint64_t v8 = +[GEOMapItemAttribution attributionWithDataAttribution:v4 searchInfo:v7 class:objc_opt_class()];
    }
    else
    {
      uint64_t v8 = 0;
    }
  }
  else
  {
    uint64_t v8 = 0;
  }

  return (GEOMapItemReviewsAttribution *)v8;
}

- (NSString)_mapsCategoryId
{
  uint64_t v2 = +[GEOPDEntity entityForPlaceData:self->_placeData];
  BOOL v3 = [v2 mapsCategoryId];

  return (NSString *)v3;
}

- (NSArray)_alternateMapsCategoryIDs
{
  uint64_t v2 = +[GEOPDEntity entityForPlaceData:self->_placeData];
  BOOL v3 = [v2 mapsAltCategoryIds];
  id v4 = v3;
  if (!v3) {
    BOOL v3 = (void *)MEMORY[0x1E4F1CBF0];
  }
  uint64_t v5 = v3;

  return v5;
}

- (NSNumber)_mapsCategoryMUID
{
  uint64_t v2 = +[GEOPDEntity entityForPlaceData:self->_placeData];
  if ([v2 hasMapsCategoryMuid])
  {
    BOOL v3 = objc_msgSend(NSNumber, "numberWithUnsignedLongLong:", objc_msgSend(v2, "mapsCategoryMuid"));
  }
  else
  {
    BOOL v3 = 0;
  }

  return (NSNumber *)v3;
}

- (NSArray)_alternateMapsCategoryMUIDs
{
  uint64_t v2 = +[GEOPDEntity entityForPlaceData:self->_placeData];
  if ([v2 mapsAltCategoryMuidsCount])
  {
    BOOL v3 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(v2, "mapsAltCategoryMuidsCount"));
    if ([v2 mapsAltCategoryMuidsCount])
    {
      unint64_t v4 = 0;
      do
      {
        uint64_t v5 = objc_msgSend(NSNumber, "numberWithUnsignedLongLong:", objc_msgSend(v2, "mapsAltCategoryMuidAtIndex:", v4));
        [v3 addObject:v5];

        ++v4;
      }
      while (v4 < [v2 mapsAltCategoryMuidsCount]);
    }
  }
  else
  {
    BOOL v3 = (void *)MEMORY[0x1E4F1CBF0];
  }

  return (NSArray *)v3;
}

- (id)_asPlaceInfo
{
  uint64_t v2 = [[GEOMapItemAdditionalPlaceInfo alloc] initWithMapItem:self];

  return v2;
}

- (NSArray)_reviews
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  BOOL v3 = +[GEOPDReview reviewsForPlaceData:self->_placeData];
  uint64_t v4 = [v3 count];
  if (v4)
  {
    uint64_t v5 = [MEMORY[0x1E4F1CA48] arrayWithCapacity:v4];
    long long v15 = 0u;
    long long v16 = 0u;
    long long v17 = 0u;
    long long v18 = 0u;
    id v6 = v3;
    uint64_t v7 = [v6 countByEnumeratingWithState:&v15 objects:v19 count:16];
    if (v7)
    {
      uint64_t v8 = v7;
      uint64_t v9 = *(void *)v16;
      do
      {
        for (uint64_t i = 0; i != v8; ++i)
        {
          if (*(void *)v16 != v9) {
            objc_enumerationMutation(v6);
          }
          uint64_t v11 = *(void *)(*((void *)&v15 + 1) + 8 * i);
          id v12 = [_GEOPlaceDataReview alloc];
          id v13 = -[_GEOPlaceDataReview initWithPlaceData:review:](v12, "initWithPlaceData:review:", self->_placeData, v11, (void)v15);
          [v5 addObject:v13];
        }
        uint64_t v8 = [v6 countByEnumeratingWithState:&v15 objects:v19 count:16];
      }
      while (v8);
    }
  }
  else
  {
    uint64_t v5 = 0;
  }

  return (NSArray *)v5;
}

- (NSArray)_tips
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = +[GEOPDTip tipsForPlaceData:self->_placeData];
  uint64_t v3 = [v2 count];
  if (v3)
  {
    uint64_t v4 = [MEMORY[0x1E4F1CA48] arrayWithCapacity:v3];
    long long v14 = 0u;
    long long v15 = 0u;
    long long v16 = 0u;
    long long v17 = 0u;
    id v5 = v2;
    uint64_t v6 = [v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
    if (v6)
    {
      uint64_t v7 = v6;
      uint64_t v8 = *(void *)v15;
      do
      {
        for (uint64_t i = 0; i != v7; ++i)
        {
          if (*(void *)v15 != v8) {
            objc_enumerationMutation(v5);
          }
          uint64_t v10 = *(void *)(*((void *)&v14 + 1) + 8 * i);
          uint64_t v11 = [GEOMapItemTip alloc];
          id v12 = -[GEOMapItemTip initWithGEOPDTip:](v11, "initWithGEOPDTip:", v10, (void)v14);
          [v4 addObject:v12];
        }
        uint64_t v7 = [v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
      }
      while (v7);
    }
  }
  else
  {
    uint64_t v4 = 0;
  }

  return (NSArray *)v4;
}

- (id)_mapItemByStrippingOptionalData
{
  id v3 = [(GEOPDPlace *)self->_placeData copyWithStrippedOptionalData];
  uint64_t v4 = (void *)[objc_alloc((Class)objc_opt_class()) initWithPlaceData:v3 attributionMap:self->_attributionMap disambiguationLabel:self->_disambiguationLabel detourInfo:0 externalTransitStationCode:0 additionalPlaces:0];

  return v4;
}

- (id)_mapItemBySettingIsTransitDisplayFeature:(BOOL)a3
{
  id v5 = objc_alloc((Class)objc_opt_class());
  uint64_t v6 = (void *)[(GEOPDPlace *)self->_placeData copy];
  uint64_t v7 = (void *)[(NSMapTable *)self->_attributionMap copy];
  uint64_t v8 = (void *)[(GEOPDMultiLocalizedString *)self->_disambiguationLabel copy];
  uint64_t v9 = [(GEOMapItemDetourInfo *)self->_detourInfo _detourInfo];
  uint64_t v10 = (void *)[v9 copy];
  uint64_t v11 = (void *)[(NSData *)self->_externalTransitStationCode copy];
  id v12 = (void *)[(NSArray *)self->_additionalPlaces copy];
  id v13 = (unsigned char *)[v5 initWithPlaceData:v6 attributionMap:v7 disambiguationLabel:v8 detourInfo:v10 externalTransitStationCode:v11 additionalPlaces:v12];

  v13[56] = a3;

  return v13;
}

- (BOOL)_hasPOIClaim
{
  uint64_t v2 = [(_GEOPlaceDataItem *)self _poiClaim];
  BOOL v3 = v2 != 0;

  return v3;
}

- (GEOPOIClaim)_poiClaim
{
  uint64_t v2 = +[GEOPDPOIClaim poiClaimForPlaceData:self->_placeData];
  BOOL v3 = [[GEOPOIClaim alloc] initWithPOIClaim:v2];

  return v3;
}

- (GEOBusinessAssets)businessAssets
{
  return +[GEOBusinessAssets businessAssetsWithPlaceData:self->_placeData];
}

- (BOOL)_hasFeatureLink
{
  uint64_t v2 = [(_GEOPlaceDataItem *)self _featureLink];
  BOOL v3 = v2 != 0;

  return v3;
}

- (GEORestaurantFeaturesLink)_featureLink
{
  BOOL v3 = +[GEOPDRestaurantReservationLink reservationLinkForPlaceData:self->_placeData];
  if ([(_GEOPlaceDataItem *)self _hasMUID])
  {
    uint64_t v4 = _getValue(GeoServicesConfig_RestaurantReservationLinkForMUID, (uint64_t)off_1E9114138, 1, 0, 0, 0);
    if ([v4 count])
    {
      id v5 = objc_msgSend(NSString, "stringWithFormat:", @"%llu", -[_GEOPlaceDataItem _muid](self, "_muid"));
      uint64_t v6 = [v4 objectForKeyedSubscript:v5];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        uint64_t v7 = [[GEOPDRestaurantReservationLink alloc] initWithData:v6];

        BOOL v3 = v7;
      }
    }
  }
  if (v3) {
    uint64_t v8 = [[GEORestaurantFeaturesLink alloc] initWithRestaurantReservationLink:v3 attributionMap:self->_attributionMap];
  }
  else {
    uint64_t v8 = 0;
  }

  return v8;
}

- (int)_parsecSectionType
{
  uint64_t v2 = +[GEOPDEntity entityForPlaceData:self->_placeData];
  int v3 = [v2 searchSection];
  if (v3 == 1) {
    int v4 = 1;
  }
  else {
    int v4 = 2 * (v3 == 2);
  }

  return v4;
}

- (BOOL)_isStandaloneBrand
{
  return [(GEOPDPlace *)self->_placeData isStandAloneBrand];
}

- (GEOMessageLink)_messageLink
{
  uint64_t v2 = +[GEOPDMessageLink messageLinkForPlaceData:self->_placeData];
  if (v2) {
    int v3 = [[GEOMessageLink alloc] initWithMessageLink:v2];
  }
  else {
    int v3 = 0;
  }

  return v3;
}

- (NSArray)_quickLinks
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = +[GEOPDQuickLinkItem quickLinksForPlaceData:self->_placeData];
  int v3 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(v2, "count"));
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v4 = v2;
  uint64_t v5 = [v4 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v16;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v16 != v7) {
          objc_enumerationMutation(v4);
        }
        uint64_t v9 = *(void *)(*((void *)&v15 + 1) + 8 * v8);
        uint64_t v10 = [GEOQuickLink alloc];
        uint64_t v11 = -[GEOQuickLink initWithQuickLink:](v10, "initWithQuickLink:", v9, (void)v15);
        if (v11) {
          [v3 addObject:v11];
        }

        ++v8;
      }
      while (v6 != v8);
      uint64_t v6 = [v4 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v6);
  }

  if ([v3 count]) {
    id v12 = v3;
  }
  else {
    id v12 = 0;
  }
  id v13 = v12;

  return v13;
}

- (NSArray)_secondaryQuickLinks
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = +[GEOPDQuickLinkItem secondaryQuickLinksForPlaceData:self->_placeData];
  int v3 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(v2, "count"));
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v4 = v2;
  uint64_t v5 = [v4 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v16;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v16 != v7) {
          objc_enumerationMutation(v4);
        }
        uint64_t v9 = *(void *)(*((void *)&v15 + 1) + 8 * v8);
        uint64_t v10 = [GEOQuickLink alloc];
        uint64_t v11 = -[GEOQuickLink initWithQuickLink:](v10, "initWithQuickLink:", v9, (void)v15);
        if (v11) {
          [v3 addObject:v11];
        }

        ++v8;
      }
      while (v6 != v8);
      uint64_t v6 = [v4 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v6);
  }

  if ([v3 count]) {
    id v12 = v3;
  }
  else {
    id v12 = 0;
  }
  id v13 = v12;

  return v13;
}

- (NSArray)_placeCollections
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = +[GEOPDPlaceCollection collectionComponentsForPlaceData:self->_placeData];
  int v3 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(v2, "count"));
  long long v27 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  obuint64_t j = v2;
  uint64_t v21 = [obj countByEnumeratingWithState:&v27 objects:v32 count:16];
  if (v21)
  {
    uint64_t v20 = *(void *)v28;
    do
    {
      uint64_t v4 = 0;
      do
      {
        if (*(void *)v28 != v20) {
          objc_enumerationMutation(obj);
        }
        uint64_t v22 = v4;
        uint64_t v5 = *(id **)(*((void *)&v27 + 1) + 8 * v4);
        long long v23 = 0u;
        long long v24 = 0u;
        long long v25 = 0u;
        long long v26 = 0u;
        uint64_t v6 = -[GEOPDComponent values](v5);
        uint64_t v7 = [v6 countByEnumeratingWithState:&v23 objects:v31 count:16];
        if (v7)
        {
          uint64_t v8 = v7;
          uint64_t v9 = *(void *)v24;
          do
          {
            for (uint64_t i = 0; i != v8; ++i)
            {
              if (*(void *)v24 != v9) {
                objc_enumerationMutation(v6);
              }
              uint64_t v11 = *(id **)(*((void *)&v23 + 1) + 8 * i);
              id v12 = [GEOPlaceCollection alloc];
              id v13 = -[GEOPDComponentValue placeCollection](v11);
              long long v14 = -[GEOPDComponent attribution](v5);
              long long v15 = [(GEOPlaceCollection *)v12 initWithCollection:v13 usingAttribution:v14];

              if (v15) {
                [v3 addObject:v15];
              }
            }
            uint64_t v8 = [v6 countByEnumeratingWithState:&v23 objects:v31 count:16];
          }
          while (v8);
        }

        uint64_t v4 = v22 + 1;
      }
      while (v22 + 1 != v21);
      uint64_t v21 = [obj countByEnumeratingWithState:&v27 objects:v32 count:16];
    }
    while (v21);
  }

  if ([v3 count]) {
    long long v16 = v3;
  }
  else {
    long long v16 = 0;
  }
  long long v17 = v16;

  return v17;
}

- (NSArray)_searchResultPhotoCarousel
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = +[GEOPDSearchResultPlacePhoto searchResultPhotosFromPlaceData:self->_placeData];
  if ([v2 count])
  {
    int v3 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(v2, "count"));
    long long v13 = 0u;
    long long v14 = 0u;
    long long v15 = 0u;
    long long v16 = 0u;
    id v4 = v2;
    uint64_t v5 = [v4 countByEnumeratingWithState:&v13 objects:v17 count:16];
    if (v5)
    {
      uint64_t v6 = v5;
      uint64_t v7 = *(void *)v14;
      do
      {
        for (uint64_t i = 0; i != v6; ++i)
        {
          if (*(void *)v14 != v7) {
            objc_enumerationMutation(v4);
          }
          uint64_t v9 = *(void *)(*((void *)&v13 + 1) + 8 * i);
          uint64_t v10 = [_GEOPlaceDataPhoto alloc];
          uint64_t v11 = -[_GEOPlaceDataPhoto initWithCaptionedPhoto:](v10, "initWithCaptionedPhoto:", v9, (void)v13);
          if (v11) {
            [v3 addObject:v11];
          }
        }
        uint64_t v6 = [v4 countByEnumeratingWithState:&v13 objects:v17 count:16];
      }
      while (v6);
    }
  }
  else
  {
    int v3 = 0;
  }

  return (NSArray *)v3;
}

- (GEOExploreGuides)_exploreGuides
{
  uint64_t v2 = +[GEOPDExploreGuides exploreGuideComponentFromPlaceData:self->_placeData];
  int v3 = -[GEOPDComponent values](v2);
  uint64_t v4 = [v3 firstObject];

  if (v4 && *(void *)(v4 + 216))
  {
    uint64_t v5 = [GEOExploreGuides alloc];
    uint64_t v6 = -[GEOPDComponentValue exploreGuides]((id *)v4);
    uint64_t v7 = [(GEOExploreGuides *)v5 initWithExploreGuides:v6];
  }
  else
  {
    uint64_t v7 = 0;
  }

  return v7;
}

- (NSArray)_placeCollectionsIds
{
  uint64_t v2 = +[GEOPDCollectionIds collectionIdComponentForPlaceData:self->_placeData];
  int v3 = -[GEOPDComponent values](v2);
  uint64_t v4 = [v3 firstObject];

  if (v4)
  {
    uint64_t v5 = (id *)v4[18];
    uint64_t v6 = -[GEOPDCollectionIds collectionIds](v5);
    uint64_t v7 = +[GEOMapItemIdentifier mapItemIdentifiersFromMapsIdentifiers:v6];

    if ([v7 count]) {
      uint64_t v8 = (void *)[v7 copy];
    }
    else {
      uint64_t v8 = 0;
    }
  }
  else
  {
    uint64_t v8 = 0;
  }

  return (NSArray *)v8;
}

- (BOOL)_hasPlaceCollectionPullQuotes
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  uint64_t v2 = [(_GEOPlaceDataItem *)self _placeCollections];
  uint64_t v3 = [v2 countByEnumeratingWithState:&v8 objects:v12 count:16];
  if (v3)
  {
    uint64_t v4 = *(void *)v9;
    while (2)
    {
      for (uint64_t i = 0; i != v3; ++i)
      {
        if (*(void *)v9 != v4) {
          objc_enumerationMutation(v2);
        }
        uint64_t v6 = [*(id *)(*((void *)&v8 + 1) + 8 * i) publisherBlockQuote];

        if (v6)
        {
          LOBYTE(v3) = 1;
          goto LABEL_11;
        }
      }
      uint64_t v3 = [v2 countByEnumeratingWithState:&v8 objects:v12 count:16];
      if (v3) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return v3;
}

- (NSArray)_placeCollectionPullQuotes
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  uint64_t v4 = [(_GEOPlaceDataItem *)self _placeCollections];
  uint64_t v5 = [v4 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v15;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v15 != v7) {
          objc_enumerationMutation(v4);
        }
        long long v9 = *(void **)(*((void *)&v14 + 1) + 8 * i);
        long long v10 = [v9 publisherBlockQuote];

        if (v10)
        {
          long long v11 = [v9 publisherBlockQuote];
          [v3 addObject:v11];
        }
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v6);
  }

  if ([v3 count]) {
    id v12 = (void *)[v3 copy];
  }
  else {
    id v12 = 0;
  }

  return (NSArray *)v12;
}

- (id)_relatedPlaceListForComponentIdentifier:(int)a3
{
  uint64_t v3 = *(void *)&a3;
  uint64_t v4 = [(_GEOPlaceDataItem *)self _relatedPlacesByComponentId];
  uint64_t v5 = [NSNumber numberWithInt:v3];
  uint64_t v6 = [v4 objectForKey:v5];

  return v6;
}

- (BOOL)_hasEVCharger
{
  uint64_t v2 = [(_GEOPlaceDataItem *)self _placeData];
  uint64_t v3 = +[GEOEVCharger chargerFromPlaceData:v2];
  BOOL v4 = v3 != 0;

  return v4;
}

- (GEOEVCharger)_evCharger
{
  uint64_t v2 = [(_GEOPlaceDataItem *)self _placeData];
  uint64_t v3 = +[GEOEVCharger chargerFromPlaceData:v2];

  return (GEOEVCharger *)v3;
}

- (id)_firstRelatedPlaceListForType:(int)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  BOOL v4 = [(_GEOPlaceDataItem *)self _relatedPlaceLists];
  uint64_t v5 = [v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v13;
    while (2)
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v13 != v7) {
          objc_enumerationMutation(v4);
        }
        long long v9 = *(void **)(*((void *)&v12 + 1) + 8 * i);
        if ([v9 type] == a3)
        {
          id v10 = v9;
          goto LABEL_11;
        }
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
      if (v6) {
        continue;
      }
      break;
    }
  }
  id v10 = 0;
LABEL_11:

  return v10;
}

- (GEOPlacecardLayoutData)_placecardLayoutData
{
  return self->_placecardLayoutData;
}

- (BOOL)_hasBrandMUID
{
  return [(GEOPDPlace *)self->_placeData hasBrandMUID];
}

- (unint64_t)_brandMUID
{
  return [(GEOPDPlace *)self->_placeData brandMUID];
}

- (id)shortAddress
{
  if ([(_GEOPlaceDataItem *)self _venueFeatureType] == 4)
  {
    uint64_t v3 = [(_GEOPlaceDataItem *)self addressObject];
    BOOL v4 = [v3 venueShortAddress];

    if ([v4 length]) {
      goto LABEL_5;
    }
  }
  uint64_t v5 = [(_GEOPlaceDataItem *)self addressObject];
  BOOL v4 = [v5 shortAddress];

LABEL_5:

  return v4;
}

- (id)weatherDisplayName
{
  uint64_t v2 = [(_GEOPlaceDataItem *)self addressObject];
  uint64_t v3 = [v2 weatherDisplayName];

  return v3;
}

- (NSData)externalTransitStationCode
{
  return self->_externalTransitStationCode;
}

- (int)_venueFeatureType
{
  uint64_t v3 = [(_GEOPlaceDataItem *)self _venueInfo];

  if (!v3) {
    return 0;
  }
  BOOL v4 = [(_GEOPlaceDataItem *)self _venueInfo];
  int v5 = [v4 venueFeatureType];

  return v5;
}

- (NSArray)_browseCategories
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  uint64_t v21 = 0;
  uint64_t v22 = &v21;
  uint64_t v23 = 0x3032000000;
  long long v24 = __Block_byref_object_copy__54;
  long long v25 = __Block_byref_object_dispose__54;
  id v26 = 0;
  placeData = self->_placeData;
  v20[0] = MEMORY[0x1E4F143A8];
  v20[1] = 3221225472;
  v20[2] = __38___GEOPlaceDataItem__browseCategories__block_invoke;
  v20[3] = &unk_1E53E16F0;
  v20[4] = &v21;
  [(GEOPDPlace *)placeData enumerateValidComponentValuesOfType:54 usingBlock:v20];
  if (v22[5]
    || (BOOL v4 = self->_placeData,
        v19[0] = MEMORY[0x1E4F143A8],
        v19[1] = 3221225472,
        v19[2] = __38___GEOPlaceDataItem__browseCategories__block_invoke_2,
        v19[3] = &unk_1E53E16F0,
        v19[4] = &v21,
        [(GEOPDPlace *)v4 enumerateValidComponentValuesOfType:70 usingBlock:v19], v22[5]))
  {
    id v5 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    long long v17 = 0u;
    long long v18 = 0u;
    long long v15 = 0u;
    long long v16 = 0u;
    uint64_t v6 = -[GEOPDBrowseCategories browseCategorys]((id *)v22[5]);
    uint64_t v7 = [v6 countByEnumeratingWithState:&v15 objects:v27 count:16];
    if (v7)
    {
      uint64_t v8 = *(void *)v16;
      do
      {
        for (uint64_t i = 0; i != v7; ++i)
        {
          if (*(void *)v16 != v8) {
            objc_enumerationMutation(v6);
          }
          uint64_t v10 = *(void *)(*((void *)&v15 + 1) + 8 * i);
          long long v11 = [GEOSearchCategory alloc];
          long long v12 = -[GEOSearchCategory initWithBrowseCategory:](v11, "initWithBrowseCategory:", v10, (void)v15);
          if (v12) {
            [v5 addObject:v12];
          }
        }
        uint64_t v7 = [v6 countByEnumeratingWithState:&v15 objects:v27 count:16];
      }
      while (v7);
    }

    long long v13 = (void *)[v5 copy];
  }
  else
  {
    long long v13 = 0;
  }
  _Block_object_dispose(&v21, 8);

  return (NSArray *)v13;
}

- (GEOMiniBrowseCategories)_miniBrowseCategories
{
  uint64_t v10 = 0;
  long long v11 = &v10;
  uint64_t v12 = 0x3032000000;
  long long v13 = __Block_byref_object_copy__54;
  long long v14 = __Block_byref_object_dispose__54;
  id v15 = 0;
  placeData = self->_placeData;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __42___GEOPlaceDataItem__miniBrowseCategories__block_invoke;
  v9[3] = &unk_1E53E16F0;
  v9[4] = &v10;
  [(GEOPDPlace *)placeData enumerateValidComponentValuesOfType:72 usingBlock:v9];
  uint64_t v3 = (id *)v11[5];
  if (v3
    && (-[GEOPDMiniBrowseCategories miniBrowseCategorys](v3),
        BOOL v4 = objc_claimAutoreleasedReturnValue(),
        v4,
        v4))
  {
    id v5 = -[GEOPDMiniBrowseCategories miniBrowseCategorys]((id *)v11[5]);
    uint64_t v6 = -[GEOPDMiniBrowseCategories topChildNames]((id *)v11[5]);
    uint64_t v7 = [[GEOMiniBrowseCategories alloc] initWithMiniPDBrowseCategories:v5 topChildNames:v6];
  }
  else
  {
    uint64_t v7 = 0;
  }
  _Block_object_dispose(&v10, 8);

  return v7;
}

- (int)_placeDisplayStyle
{
  uint64_t v2 = +[GEOPDEntity entityForPlaceData:self->_placeData];
  int v3 = [v2 displayStyle];
  if (v3 == 2) {
    int v4 = 2;
  }
  else {
    int v4 = v3 == 1;
  }

  return v4;
}

- (GEOAnnotatedItemList)_annotatedItemList
{
  int v3 = +[GEOPDAnnotatedItemList annotatedItemListForPlaceData:self->_placeData];
  if (v3)
  {
    int v4 = [GEOAnnotatedItemList alloc];
    id v5 = +[GEOPDAttribution attributionForAnnotatedItemList:v3 placeData:self->_placeData];
    uint64_t v6 = v5;
    if (v5)
    {
      attributionMap = self->_attributionMap;
      uint64_t v8 = -[GEOPDAttribution vendorId](v5);
      long long v9 = [(NSMapTable *)attributionMap objectForKey:v8];

      uint64_t v10 = +[GEOMapItemAttribution attributionWithDataAttribution:v6 searchInfo:v9 class:objc_opt_class()];
    }
    else
    {
      uint64_t v10 = 0;
    }

    long long v11 = [(GEOAnnotatedItemList *)v4 initWithAnnotatedItemList:v3 attribution:v10];
  }
  else
  {
    long long v11 = 0;
  }

  return v11;
}

- (BOOL)_hasWifiFingerprintConfidence
{
  -[_GEOPlaceDataItem _wifiFingerprintComponent]((uint64_t)self);
  uint64_t v2 = (unsigned char *)objc_claimAutoreleasedReturnValue();
  if (v2) {
    BOOL v3 = v2[28] & 1;
  }
  else {
    BOOL v3 = 0;
  }

  return v3;
}

- (BOOL)_hasWifiFingerprintLabelType
{
  -[_GEOPlaceDataItem _wifiFingerprintComponent]((uint64_t)self);
  uint64_t v2 = (unsigned __int8 *)objc_claimAutoreleasedReturnValue();
  if (v2) {
    BOOL v3 = (v2[28] >> 1) & 1;
  }
  else {
    LOBYTE(v3) = 0;
  }

  return v3;
}

- (BOOL)_hasWifiFingerprintLabelStatusCode
{
  -[_GEOPlaceDataItem _wifiFingerprintComponent]((uint64_t)self);
  uint64_t v2 = (unsigned __int8 *)objc_claimAutoreleasedReturnValue();
  if (v2) {
    BOOL v3 = (v2[28] >> 2) & 1;
  }
  else {
    LOBYTE(v3) = 0;
  }

  return v3;
}

- (int)_wifiFingerprintLabelStatusCode
{
  uint64_t v2 = -[_GEOPlaceDataItem _wifiFingerprintComponent]((uint64_t)self);
  if (!v2 || (*(unsigned char *)(v2 + 28) & 4) == 0)
  {
    int v3 = 1;
    goto LABEL_16;
  }
  int v4 = *(_DWORD *)(v2 + 24);
  if (v4 > 29)
  {
    if (v4 > 49)
    {
      int v3 = *(_DWORD *)(v2 + 24);
      if (v4 != 50)
      {
        int v3 = 1;
        if (v4 == 60) {
          int v3 = 51;
        }
      }
    }
    else
    {
      if (v4 == 30) {
        goto LABEL_15;
      }
      int v3 = 1;
      if (v4 == 40) {
        goto LABEL_15;
      }
    }
  }
  else
  {
    if (v4 <= 4)
    {
      if (v4)
      {
        int v3 = 1;
        if (v4 != 2) {
          goto LABEL_16;
        }
      }
LABEL_15:
      int v3 = *(_DWORD *)(v2 + 24);
      goto LABEL_16;
    }
    if (v4 == 5) {
      goto LABEL_15;
    }
    int v3 = 1;
    if (v4 == 20) {
      goto LABEL_15;
    }
  }
LABEL_16:

  return v3;
}

- (id)_bestAvatarBrandIconURLForSize:(CGSize)a3 allowSmaller:(BOOL)a4
{
  return [(_GEOPlaceDataItem *)(uint64_t)self _bestBrandIconOfType:a4 size:a3.width allowSmaller:a3.height];
}

- (id)_bestBrandIconOfType:(unsigned int)a3 size:(double)a4 allowSmaller:(double)a5
{
  uint64_t v50 = *MEMORY[0x1E4F143B8];
  if (a1)
  {
    long long v46 = 0u;
    long long v47 = 0u;
    long long v44 = 0u;
    long long v45 = 0u;
    uint64_t v8 = [*(id *)(a1 + 24) components];
    uint64_t v9 = [v8 countByEnumeratingWithState:&v44 objects:v49 count:16];
    if (v9)
    {
      uint64_t v10 = v9;
      long long v11 = &OBJC_IVAR___GEOXPCReply__error;
      uint64_t v12 = &OBJC_IVAR___GEOXPCReply__error;
      uint64_t v13 = *(void *)v45;
      long long v38 = v8;
      uint64_t v36 = *(void *)v45;
      do
      {
        uint64_t v14 = 0;
        uint64_t v37 = v10;
        do
        {
          if (*(void *)v45 != v13) {
            objc_enumerationMutation(v8);
          }
          id v15 = *(id **)(*((void *)&v44 + 1) + 8 * v14);
          if (v15 && (*(_WORD *)((unsigned char *)v15 + v11[735]) & 0x80) != 0 && *(_DWORD *)((char *)v15 + v12[736]) == 52)
          {
            long long v42 = 0u;
            long long v43 = 0u;
            long long v40 = 0u;
            long long v41 = 0u;
            long long v16 = -[GEOPDComponent values](v15);
            uint64_t v17 = [v16 countByEnumeratingWithState:&v40 objects:v48 count:16];
            if (v17)
            {
              uint64_t v18 = v17;
              uint64_t v19 = *(void *)v41;
              do
              {
                uint64_t v20 = 0;
                do
                {
                  if (*(void *)v41 != v19) {
                    objc_enumerationMutation(v16);
                  }
                  uint64_t v21 = *(void *)(*((void *)&v40 + 1) + 8 * v20);
                  if (v21)
                  {
                    if (*(void *)(v21 + 304))
                    {
                      uint64_t v22 = -[GEOPDComponentValue icon](*(id **)(*((void *)&v40 + 1) + 8 * v20));
                      if (v22)
                      {
                        uint64_t v23 = v22[2];

                        if (v23)
                        {
                          -[GEOPDComponentValue icon]((id *)v21);
                          long long v24 = (unsigned char *)objc_claimAutoreleasedReturnValue();
                          long long v25 = v24;
                          if (!v24 || (v24[28] & 1) == 0)
                          {

LABEL_36:
                            long long v30 = [_GEOPlaceDataPhoto alloc];
                            -[GEOPDComponentValue icon]((id *)v21);
                            v31 = (id *)objc_claimAutoreleasedReturnValue();
                            uint64_t v32 = -[GEOPDIcon image](v31);
                            uint64_t v33 = [(_GEOPlaceDataPhoto *)v30 initWithPhoto:v32];

                            v34 = -[_GEOPlaceDataPhoto bestPhotoForSize:allowSmaller:](v33, "bestPhotoForSize:allowSmaller:", a3, a4, a5);
                            long long v29 = [v34 url];

                            uint64_t v8 = v38;
                            goto LABEL_37;
                          }
                          uint64_t v26 = -[GEOPDComponentValue icon]((id *)v21);
                          if (v26 && (*(unsigned char *)(v26 + 28) & 1) != 0) {
                            int v27 = *(_DWORD *)(v26 + 24);
                          }
                          else {
                            int v27 = 0;
                          }

                          if (v27 == a2) {
                            goto LABEL_36;
                          }
                        }
                      }
                    }
                  }
                  ++v20;
                }
                while (v18 != v20);
                uint64_t v28 = [v16 countByEnumeratingWithState:&v40 objects:v48 count:16];
                uint64_t v18 = v28;
              }
              while (v28);
            }

            uint64_t v8 = v38;
            uint64_t v13 = v36;
            uint64_t v10 = v37;
            long long v11 = &OBJC_IVAR___GEOXPCReply__error;
            uint64_t v12 = &OBJC_IVAR___GEOXPCReply__error;
          }
          ++v14;
        }
        while (v14 != v10);
        uint64_t v10 = [v8 countByEnumeratingWithState:&v44 objects:v49 count:16];
        long long v29 = 0;
      }
      while (v10);
    }
    else
    {
      long long v29 = 0;
    }
LABEL_37:
  }
  else
  {
    long long v29 = 0;
  }

  return v29;
}

- (id)_bestNavbarBrandIconURLForSize:(CGSize)a3 allowSmaller:(BOOL)a4
{
  return [(_GEOPlaceDataItem *)(uint64_t)self _bestBrandIconOfType:a4 size:a3.width allowSmaller:a3.height];
}

- (id)_bestHeroBrandIconURLForSize:(CGSize)a3 allowSmaller:(BOOL)a4
{
  return [(_GEOPlaceDataItem *)(uint64_t)self _bestBrandIconOfType:a4 size:a3.width allowSmaller:a3.height];
}

- (GEOMapItemContainedPlace)_containedPlace
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  uint64_t v2 = [(GEOPDPlace *)self->_placeData components];
  uint64_t v3 = [v2 countByEnumeratingWithState:&v24 objects:v29 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v25;
    uint64_t v6 = &OBJC_IVAR___GEOXPCReply__error;
    uint64_t v7 = &OBJC_IVAR___GEOXPCReply__error;
    do
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v25 != v5) {
          objc_enumerationMutation(v2);
        }
        uint64_t v9 = *(id **)(*((void *)&v24 + 1) + 8 * i);
        if (v9 && (*(_WORD *)((unsigned char *)v9 + v6[735]) & 0x80) != 0 && *(_DWORD *)((char *)v9 + v7[736]) == 50)
        {
          long long v22 = 0u;
          long long v23 = 0u;
          long long v20 = 0u;
          long long v21 = 0u;
          uint64_t v10 = -[GEOPDComponent values](v9);
          uint64_t v11 = [v10 countByEnumeratingWithState:&v20 objects:v28 count:16];
          if (v11)
          {
            uint64_t v12 = v11;
            uint64_t v13 = *(void *)v21;
            while (2)
            {
              for (uint64_t j = 0; j != v12; ++j)
              {
                if (*(void *)v21 != v13) {
                  objc_enumerationMutation(v10);
                }
                uint64_t v15 = *(void *)(*((void *)&v20 + 1) + 8 * j);
                if (v15 && *(void *)(v15 + 152))
                {
                  uint64_t v17 = [GEOMapItemContainedPlace alloc];
                  uint64_t v18 = -[GEOPDComponentValue containedPlace]((id *)v15);
                  long long v16 = [(GEOMapItemContainedPlace *)v17 initWithContainedPlace:v18];

                  goto LABEL_24;
                }
              }
              uint64_t v12 = [v10 countByEnumeratingWithState:&v20 objects:v28 count:16];
              if (v12) {
                continue;
              }
              break;
            }
          }

          uint64_t v6 = &OBJC_IVAR___GEOXPCReply__error;
          uint64_t v7 = &OBJC_IVAR___GEOXPCReply__error;
        }
      }
      uint64_t v4 = [v2 countByEnumeratingWithState:&v24 objects:v29 count:16];
      long long v16 = 0;
    }
    while (v4);
  }
  else
  {
    long long v16 = 0;
  }
LABEL_24:

  return v16;
}

- (BOOL)_isInLinkedPlaceRelationship
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  uint64_t v2 = [(GEOPDPlace *)self->_placeData components];
  uint64_t v3 = [v2 countByEnumeratingWithState:&v21 objects:v26 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v22;
    uint64_t v6 = &OBJC_IVAR___GEOXPCReply__error;
    do
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v22 != v5) {
          objc_enumerationMutation(v2);
        }
        uint64_t v8 = *(void *)(*((void *)&v21 + 1) + 8 * i);
        if (v8 && (*(_WORD *)(v8 + 100) & 0x80) != 0 && *(_DWORD *)(v8 + v6[736]) == 50)
        {
          long long v19 = 0u;
          long long v20 = 0u;
          long long v17 = 0u;
          long long v18 = 0u;
          uint64_t v9 = -[GEOPDComponent values]((id *)v8);
          uint64_t v10 = [v9 countByEnumeratingWithState:&v17 objects:v25 count:16];
          if (v10)
          {
            uint64_t v11 = v10;
            uint64_t v12 = *(void *)v18;
            while (2)
            {
              for (uint64_t j = 0; j != v11; ++j)
              {
                if (*(void *)v18 != v12) {
                  objc_enumerationMutation(v9);
                }
                uint64_t v14 = *(void *)(*((void *)&v17 + 1) + 8 * j);
                if (v14 && *(void *)(v14 + 152))
                {

                  BOOL v15 = 1;
                  goto LABEL_24;
                }
              }
              uint64_t v11 = [v9 countByEnumeratingWithState:&v17 objects:v25 count:16];
              if (v11) {
                continue;
              }
              break;
            }
          }

          uint64_t v6 = &OBJC_IVAR___GEOXPCReply__error;
        }
      }
      uint64_t v4 = [v2 countByEnumeratingWithState:&v21 objects:v26 count:16];
      BOOL v15 = 0;
    }
    while (v4);
  }
  else
  {
    BOOL v15 = 0;
  }
LABEL_24:

  return v15;
}

- (id)_groundViewLabel
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  if (a1)
  {
    long long v22 = 0u;
    long long v23 = 0u;
    long long v20 = 0u;
    long long v21 = 0u;
    v1 = [*(id *)(a1 + 24) components];
    uint64_t v2 = [v1 countByEnumeratingWithState:&v20 objects:v25 count:16];
    if (v2)
    {
      uint64_t v3 = v2;
      uint64_t v4 = *(void *)v21;
      uint64_t v5 = &OBJC_IVAR___GEOXPCReply__error;
      do
      {
        for (uint64_t i = 0; i != v3; ++i)
        {
          if (*(void *)v21 != v4) {
            objc_enumerationMutation(v1);
          }
          uint64_t v7 = *(void *)(*((void *)&v20 + 1) + 8 * i);
          if (v7 && (*(_WORD *)(v7 + 100) & 0x80) != 0 && *(_DWORD *)(v7 + v5[736]) == 56)
          {
            long long v18 = 0u;
            long long v19 = 0u;
            long long v16 = 0u;
            long long v17 = 0u;
            uint64_t v8 = -[GEOPDComponent values]((id *)v7);
            uint64_t v9 = [v8 countByEnumeratingWithState:&v16 objects:v24 count:16];
            if (v9)
            {
              uint64_t v10 = v9;
              uint64_t v11 = *(void *)v17;
              while (2)
              {
                for (uint64_t j = 0; j != v10; ++j)
                {
                  if (*(void *)v17 != v11) {
                    objc_enumerationMutation(v8);
                  }
                  uint64_t v13 = *(void *)(*((void *)&v16 + 1) + 8 * j);
                  if (v13 && *(void *)(v13 + 256))
                  {
                    uint64_t v14 = -[GEOPDComponentValue groundViewLabel]((id *)v13);

                    goto LABEL_25;
                  }
                }
                uint64_t v10 = [v8 countByEnumeratingWithState:&v16 objects:v24 count:16];
                if (v10) {
                  continue;
                }
                break;
              }
            }

            uint64_t v5 = &OBJC_IVAR___GEOXPCReply__error;
          }
        }
        uint64_t v3 = [v1 countByEnumeratingWithState:&v20 objects:v25 count:16];
        uint64_t v14 = 0;
      }
      while (v3);
    }
    else
    {
      uint64_t v14 = 0;
    }
LABEL_25:
  }
  else
  {
    uint64_t v14 = 0;
  }

  return v14;
}

- (BOOL)_hasGroundViewLocationId
{
  -[_GEOPlaceDataItem _groundViewLabel]((uint64_t)self);
  uint64_t v2 = (unsigned char *)objc_claimAutoreleasedReturnValue();
  if (v2) {
    BOOL v3 = v2[32] & 1;
  }
  else {
    BOOL v3 = 0;
  }

  return v3;
}

- (unint64_t)_groundViewLocationId
{
  uint64_t v2 = -[_GEOPlaceDataItem _groundViewLabel]((uint64_t)self);
  if (v2) {
    unint64_t v3 = v2[3];
  }
  else {
    unint64_t v3 = 0;
  }

  return v3;
}

- (void)iterateGroundViewsWithBlock:(id)a3
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  uint64_t v4 = (void (**)(id, void *, void *, void *, double, double))a3;
  if (v4)
  {
    long long v20 = 0u;
    long long v21 = 0u;
    long long v18 = 0u;
    long long v19 = 0u;
    -[_GEOPlaceDataItem _groundViewLabel]((uint64_t)self);
    uint64_t v5 = (id *)objc_claimAutoreleasedReturnValue();
    uint64_t v6 = -[GEOPDGroundViewLabel groundViewLabelInfos](v5);

    obuint64_t j = v6;
    uint64_t v7 = [v6 countByEnumeratingWithState:&v18 objects:v22 count:16];
    if (v7)
    {
      uint64_t v8 = v7;
      uint64_t v9 = *(void *)v19;
      do
      {
        uint64_t v10 = 0;
        do
        {
          if (*(void *)v19 != v9) {
            objc_enumerationMutation(obj);
          }
          uint64_t v11 = *(void *)(*((void *)&v18 + 1) + 8 * v10);
          if (v11 && (~*(unsigned __int8 *)(v11 + 76) & 3) == 0)
          {
            double v12 = *(double *)(v11 + 56);
            double v13 = *(double *)(v11 + 24);
            uint64_t v14 = -[GEOPDGroundViewLabelInfo localityName](*(id **)(*((void *)&v18 + 1) + 8 * v10));
            BOOL v15 = -[GEOPDGroundViewLabelInfo locationName]((id *)v11);
            long long v16 = -[GEOPDGroundViewLabelInfo secondaryLocationName]((id *)v11);
            v4[2](v4, v14, v15, v16, v12, v13);
          }
          ++v10;
        }
        while (v8 != v10);
        uint64_t v8 = [obj countByEnumeratingWithState:&v18 objects:v22 count:16];
      }
      while (v8);
    }
  }
}

- (BOOL)hasVenueCapacity
{
  uint64_t v2 = +[GEOPDEntity entityForPlaceData:self->_placeData];
  char v3 = [v2 hasCapacity];

  return v3;
}

- (int64_t)venueCapacity
{
  uint64_t v2 = +[GEOPDEntity entityForPlaceData:self->_placeData];
  if ([v2 hasCapacity]) {
    int64_t v3 = (int)[v2 capacity];
  }
  else {
    int64_t v3 = 0x7FFFFFFFFFFFFFFFLL;
  }

  return v3;
}

- (NSArray)spatialMappedPlaceCategories
{
  return 0;
}

- (GEOStyleAttributes)_walletPlaceStyling
{
  uint64_t v10 = 0;
  uint64_t v11 = &v10;
  uint64_t v12 = 0x3032000000;
  double v13 = __Block_byref_object_copy__54;
  uint64_t v14 = __Block_byref_object_dispose__54;
  id v15 = 0;
  placeData = self->_placeData;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __40___GEOPlaceDataItem__walletPlaceStyling__block_invoke;
  v9[3] = &unk_1E53E16F0;
  v9[4] = &v10;
  [(GEOPDPlace *)placeData enumerateValidComponentValuesOfType:16 usingBlock:v9];
  uint64_t v4 = (void *)v11[5];
  if (!v4)
  {
    uint64_t v5 = self->_placeData;
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __40___GEOPlaceDataItem__walletPlaceStyling__block_invoke_2;
    v8[3] = &unk_1E53E16F0;
    v8[4] = &v10;
    [(GEOPDPlace *)v5 enumerateValidComponentValuesOfType:1 usingBlock:v8];
    uint64_t v4 = (void *)v11[5];
  }
  id v6 = v4;
  _Block_object_dispose(&v10, 8);

  return (GEOStyleAttributes *)v6;
}

- (NSString)_walletPlaceLocalizedString
{
  uint64_t v2 = +[GEOPDEntity entityForPlaceData:self->_placeData];
  int64_t v3 = [v2 names];
  uint64_t v4 = [v3 firstObject];

  uint64_t v5 = [v4 stringValue];

  return (NSString *)v5;
}

- (NSString)_walletPlaceLocalizedStringLocale
{
  uint64_t v2 = +[GEOPDEntity entityForPlaceData:self->_placeData];
  int64_t v3 = [v2 names];
  uint64_t v4 = [v3 firstObject];

  uint64_t v5 = [v4 locale];

  return (NSString *)v5;
}

- (GEOStyleAttributes)_walletCategoryStyling
{
  uint64_t v2 = [(_GEOPlaceDataItem *)self _walletCategoryIdentifier];
  int64_t v3 = +[GEOWalletCategoryStylingMapResource styleAttributesForWalletCategory:v2];

  return (GEOStyleAttributes *)v3;
}

- (NSString)_walletCategoryLocalizedString
{
  return 0;
}

- (NSString)_walletCategoryLocalizedStringLocale
{
  return 0;
}

- (NSString)_walletMapsCategoryIdentifier
{
  uint64_t v2 = +[GEOPDEntity entityForPlaceData:self->_placeData];
  int64_t v3 = [v2 mapsCategoryId];

  return (NSString *)v3;
}

- (NSString)_walletCategoryIdentifier
{
  uint64_t v2 = +[GEOPDEntity entityForPlaceData:self->_placeData];
  int64_t v3 = [v2 walletCategoryId];

  return (NSString *)v3;
}

- (BOOL)_enableRAPLightweightFeedback
{
  uint64_t v2 = +[GEOPDEntity entityForPlaceData:self->_placeData];
  char v3 = [v2 enableRapLightweightFeedback];

  return v3;
}

- (NSArray)_alternateSearchableNames
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  char v3 = [MEMORY[0x1E4F1CA48] array];
  uint64_t v4 = +[GEOPDEntity entityForPlaceData:self->_placeData];
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  uint64_t v5 = objc_msgSend(v4, "alternateSearchableNames", 0);
  uint64_t v6 = [v5 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v16;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v16 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = *(void **)(*((void *)&v15 + 1) + 8 * i);
        uint64_t v11 = [v10 stringValue];

        if (v11)
        {
          uint64_t v12 = [v10 stringValue];
          [v3 addObject:v12];
        }
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v7);
  }

  double v13 = (void *)[v3 copy];

  return (NSArray *)v13;
}

- (BOOL)_showSuggestAnEditButton
{
  uint64_t v2 = [(GEOPDPlace *)self->_placeData componentOfType:41 options:0];
  char v3 = -[GEOPDComponent values](v2);
  uint64_t v4 = [v3 firstObject];

  if (!v4 || !*(void *)(v4 + 480)) {
    goto LABEL_8;
  }
  uint64_t v5 = -[GEOPDComponentValue rap]((id *)v4);
  if (!v5 || (*(unsigned char *)(v5 + 20) & 1) == 0)
  {

LABEL_8:
    BOOL v7 = 1;
    goto LABEL_9;
  }
  int v6 = *(_DWORD *)(v5 + 16);

  if (v6 != 1) {
    goto LABEL_8;
  }
  BOOL v7 = 0;
LABEL_9:

  return v7;
}

- (int)_RAPFlowType
{
  int result = [(GEOPDPlace *)self->_placeData rapFlowType];
  if ((result - 1) >= 7) {
    return 0;
  }
  return result;
}

- (BOOL)_hasAppleRatings
{
  uint64_t v2 = [(_GEOPlaceDataItem *)self _appleRatings];
  BOOL v3 = [v2 count] != 0;

  return v3;
}

- (NSArray)_appleRatings
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = +[GEOPDRating ratingListForPlaceData:self->_placeData type:4];
  if ([v2 count])
  {
    id v3 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    long long v14 = 0u;
    long long v15 = 0u;
    long long v16 = 0u;
    long long v17 = 0u;
    id v4 = v2;
    uint64_t v5 = [v4 countByEnumeratingWithState:&v14 objects:v18 count:16];
    if (v5)
    {
      uint64_t v6 = v5;
      uint64_t v7 = *(void *)v15;
      do
      {
        for (uint64_t i = 0; i != v6; ++i)
        {
          if (*(void *)v15 != v7) {
            objc_enumerationMutation(v4);
          }
          uint64_t v9 = *(void *)(*((void *)&v14 + 1) + 8 * i);
          uint64_t v10 = [GEOAppleRating alloc];
          uint64_t v11 = -[GEOAppleRating initWithRating:](v10, "initWithRating:", v9, (void)v14);
          [v3 addObject:v11];
        }
        uint64_t v6 = [v4 countByEnumeratingWithState:&v14 objects:v18 count:16];
      }
      while (v6);
    }

    uint64_t v12 = (void *)[v3 copy];
  }
  else
  {
    uint64_t v12 = 0;
  }

  return (NSArray *)v12;
}

- (GEOAppleRating)_overallAppleRating
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  uint64_t v2 = [(_GEOPlaceDataItem *)self _appleRatings];
  id v3 = (id)[v2 countByEnumeratingWithState:&v8 objects:v12 count:16];
  if (v3)
  {
    uint64_t v4 = *(void *)v9;
    while (2)
    {
      for (uint64_t i = 0; i != v3; uint64_t i = (char *)i + 1)
      {
        if (*(void *)v9 != v4) {
          objc_enumerationMutation(v2);
        }
        uint64_t v6 = *(void **)(*((void *)&v8 + 1) + 8 * i);
        if (![v6 ratingType])
        {
          id v3 = v6;
          goto LABEL_11;
        }
      }
      id v3 = (id)[v2 countByEnumeratingWithState:&v8 objects:v12 count:16];
      if (v3) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return (GEOAppleRating *)v3;
}

- (GEOPlaceQuestionnaire)_placeQuestionnaire
{
  uint64_t v2 = [(GEOPDPlace *)self->_placeData successfulComponentWithValuesOfType:73];
  id v3 = -[GEOPDComponent values](v2);
  uint64_t v4 = [v3 firstObject];

  uint64_t v5 = -[GEOPDComponentValue placeQuestionnaire](v4);
  uint64_t v6 = [[GEOPlaceQuestionnaire alloc] initWithGEOPDPlaceQuestionnaire:v5];

  return v6;
}

- (BOOL)_hasPlaceQuestionnaire
{
  uint64_t v2 = [(GEOPDPlace *)self->_placeData successfulComponentWithValuesOfType:73];
  BOOL v3 = v2 != 0;

  return v3;
}

- (NSArray)_identifierHistory
{
  if ([(_GEOPlaceDataItem *)self _hasPlaceQuestionnaire])
  {
    BOOL v3 = [(GEOPDPlace *)self->_placeData successfulComponentWithValuesOfType:73];
    uint64_t v4 = -[GEOPDComponent values](v3);
    uint64_t v5 = [v4 firstObject];

    -[GEOPDComponentValue placeQuestionnaire](v5);
    uint64_t v6 = (id *)objc_claimAutoreleasedReturnValue();
    uint64_t v7 = -[GEOPDPlaceQuestionnaireResult historicalMapsIds](v6);
    long long v8 = +[GEOMapItemIdentifier mapItemIdentifiersFromMapsIdentifiers:v7];
  }
  else
  {
    long long v8 = 0;
  }

  return (NSArray *)v8;
}

- (unint64_t)_totalPhotoCount
{
  uint64_t v2 = [(GEOPDPlace *)self->_placeData componentOfType:26 options:3];
  if (v2) {
    unint64_t v3 = v2[23];
  }
  else {
    unint64_t v3 = 0;
  }

  return v3;
}

- (BOOL)_canDownloadMorePhotos
{
  uint64_t v2 = self;
  unint64_t v3 = [(_GEOPlaceDataItem *)self _photos];
  unint64_t v4 = [v3 count];
  LOBYTE(v2) = v4 < [(_GEOPlaceDataItem *)v2 _totalPhotoCount];

  return (char)v2;
}

- (BOOL)_hasCaptionedPhotoAlbum
{
  uint64_t v2 = [(_GEOPlaceDataItem *)self _captionedPhotoAlbums];
  BOOL v3 = [v2 count] != 0;

  return v3;
}

- (NSArray)_captionedPhotoAlbums
{
  return self->_captionedPhotoAlbums;
}

- (NSString)_bestAvailableCountryCode
{
  BOOL v3 = [(_GEOPlaceDataItem *)self _iso3166CountryCode];
  if (!v3)
  {
    unint64_t v4 = [(_GEOPlaceDataItem *)self addressObject];
    uint64_t v5 = [v4 address];
    uint64_t v6 = [v5 structuredAddress];
    BOOL v3 = [v6 countryCode];
  }
  id v7 = v3;

  return (NSString *)v7;
}

- (BOOL)_hasEnclosingPlace
{
  uint64_t v2 = [(GEOPDPlace *)self->_placeData successfulComponentWithValuesOfType:83];
  BOOL v3 = v2 != 0;

  return v3;
}

- (GEOEnclosingPlace)_enclosingPlace
{
  uint64_t v2 = [(GEOPDPlace *)self->_placeData componentOfType:83 options:3];
  BOOL v3 = -[GEOPDComponent values](v2);
  unint64_t v4 = [v3 firstObject];
  uint64_t v5 = -[GEOPDComponentValue containmentPlace](v4);

  uint64_t v6 = [[GEOEnclosingPlace alloc] initWithContainmentPlace:v5];

  return v6;
}

- (unint64_t)_areaHighlightId
{
  uint64_t v2 = +[GEOPDEntity entityForPlaceData:self->_placeData];
  unint64_t v3 = [v2 areaHighlightId];

  return v3;
}

- (BOOL)_hasPlaceDescription
{
  uint64_t v2 = [(GEOPDPlace *)self->_placeData successfulComponentWithValuesOfType:86];
  BOOL v3 = v2 != 0;

  return v3;
}

- (NSString)_placeDescription
{
  uint64_t v2 = [(GEOPDPlace *)self->_placeData successfulComponentWithValuesOfType:86];
  BOOL v3 = -[GEOPDComponent values](v2);
  unint64_t v4 = [v3 firstObject];

  uint64_t v5 = -[GEOPDComponentValue about](v4);
  uint64_t v6 = [v5 localizedPlaceDescription];

  return (NSString *)v6;
}

- (GEOViewportFrame)_viewportFrame
{
  uint64_t v2 = +[GEOPDBounds boundsInfoForPlaceData:self->_placeData];
  uint64_t v3 = v2;
  if (v2 && (-[GEOPDBounds _readViewportFrame](v2), *(void *)(v3 + 40)))
  {
    unint64_t v4 = [GEOViewportFrame alloc];
    uint64_t v5 = -[GEOPDBounds viewportFrame]((id *)v3);
    uint64_t v6 = [(GEOViewportFrame *)v4 initWithGEOPDViewportFrame:v5];
  }
  else
  {
    uint64_t v6 = 0;
  }

  return v6;
}

- (GEOEnrichmentInfo)_enrichmentInfo
{
  uint64_t v2 = +[GEOPDEnrichmentInfo enrichmentInfoWithPlaceData:self->_placeData];
  if (v2) {
    uint64_t v3 = [[GEOEnrichmentInfo alloc] initWithEnrichmentInfo:v2];
  }
  else {
    uint64_t v3 = 0;
  }

  return v3;
}

- (GEOEnrichmentData)_enrichmentData
{
  uint64_t v2 = +[GEOPDEnrichmentData enrichmentDataWithPlaceData:self->_placeData];
  if (v2) {
    uint64_t v3 = [[GEOEnrichmentData alloc] initWithEnrichmentData:v2];
  }
  else {
    uint64_t v3 = 0;
  }

  return v3;
}

- (GEOTrailHead)_trailHead
{
  uint64_t v2 = +[GEOPDTrailHead trailHeadWithPlaceData:self->_placeData];
  if (v2) {
    uint64_t v3 = [[GEOTrailHead alloc] initWithTrailHead:v2];
  }
  else {
    uint64_t v3 = 0;
  }

  return v3;
}

- (GEOHikeSummary)_hikeSummary
{
  uint64_t v2 = +[GEOPDHikeSummary hikeSummaryWithPlaceData:self->_placeData];
  if (v2) {
    uint64_t v3 = [[GEOHikeSummary alloc] initWithPDHikeSummary:v2];
  }
  else {
    uint64_t v3 = 0;
  }

  return v3;
}

- (GEOPDHikeAssociatedInfo)_hikeAssociatedInfo
{
  return +[GEOPDHikeAssociatedInfo hikeAssociatedInfoWithPlaceData:self->_placeData];
}

- (GEOPDHikeGeometry)_hikeGeometry
{
  return +[GEOPDHikeGeometry hikeGeometryWithPlaceData:self->_placeData];
}

- (int)_hikeGeometryElevationModel
{
  uint64_t v2 = [(GEOPDPlace *)self->_placeData successfulComponentWithValuesOfType:106];
  if (v2 && (*(_WORD *)(v2 + 100) & 8) != 0) {
    int v3 = *(_DWORD *)(v2 + 72);
  }
  else {
    int v3 = 0;
  }

  return v3;
}

- (NSArray)_externalActionLinks
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  unint64_t v4 = [(GEOPDPlace *)self->_placeData componentOfType:94 options:3];
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  uint64_t v5 = -[GEOPDComponent values](v4);
  uint64_t v6 = [v5 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v16;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v16 != v8) {
          objc_enumerationMutation(v5);
        }
        long long v10 = -[GEOPDComponentValue actionData](*(id **)(*((void *)&v15 + 1) + 8 * i));
        long long v11 = [GEOPlaceExternalAction alloc];
        uint64_t v12 = -[GEOPlaceExternalAction initWithActionData:attributionMap:](v11, "initWithActionData:attributionMap:", v10, self->_attributionMap, (void)v15);
        if (v12) {
          [v3 addObject:v12];
        }
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v7);
  }

  uint64_t v13 = (void *)[v3 copy];

  return (NSArray *)v13;
}

- (float)_photosMemoryScore
{
  uint64_t v2 = +[GEOPDEntity entityForPlaceData:self->_placeData];
  float v3 = -1.0;
  if ([v2 hasPhotosMemoryScore])
  {
    [v2 photosMemoryScore];
    float v3 = v4;
  }

  return v3;
}

- (GEOTooltip)_tooltip
{
  uint64_t v2 = +[GEOPDTooltip tooltipFromPlaceData:self->_placeData];
  float v3 = [[GEOTooltip alloc] initWithPDTooltip:v2];

  return v3;
}

- (int)_placeCategoryType
{
  uint64_t v2 = +[GEOPDEntity entityForPlaceData:self->_placeData];
  int v3 = [v2 placeCategoryType];
  if ((v3 - 1) >= 4) {
    int v4 = 0;
  }
  else {
    int v4 = v3;
  }

  return v4;
}

@end