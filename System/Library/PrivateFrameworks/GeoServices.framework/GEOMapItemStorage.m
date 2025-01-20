@interface GEOMapItemStorage
+ (BOOL)isValid:(id)a3;
+ (Class)additionalPlaceDatasType;
+ (id)mapItemStorageForCoordinate:(id)a3;
+ (id)mapItemStorageForGEOMapItem:(id)a3;
+ (id)mapItemStorageForGEOMapItem:(id)a3 clientAttributes:(id)a4;
+ (id)mapItemStorageForGEOMapItem:(id)a3 forUseType:(unint64_t)a4;
+ (id)mapItemStorageForMapsSync:(id)a3 forUseType:(unint64_t)a4;
+ (id)mapItemStorageForPlace:(id)a3;
+ (id)mapItemStorageForPlace:(id)a3 clientAttributes:(id)a4;
+ (id)mapItemStorageForPlace:(id)a3 clientAttributes:(id)a4 userValues:(id)a5;
+ (id)mapItemStorageForPlaceData:(id)a3;
+ (id)mapItemStorageForPlaceData:(id)a3 detourInfo:(id)a4;
+ (id)mapItemStorageForPlaceData:(id)a3 detourInfo:(id)a4 userValues:(id)a5;
+ (id)mapItemStorageForPlaceResult:(id)a3;
+ (id)mapItemStorageForSerializedMapItemStorage:(id)a3;
+ (id)mapItemStorageForSerializedPlaceData:(id)a3;
+ (id)mapItemStorageForSerializedPlaceData:(id)a3 serializedDetourInfo:(id)a4;
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
- (BOOL)hasClientAttributes;
- (BOOL)hasDisplayMaxZoom;
- (BOOL)hasDisplayMinZoom;
- (BOOL)hasExpiredComponents;
- (BOOL)hasGreenTeaWithValue:(BOOL)a3;
- (BOOL)hasInternalDetourInfo;
- (BOOL)hasMapsURL;
- (BOOL)hasOriginatingCoordinate;
- (BOOL)hasPlace;
- (BOOL)hasPlaceData;
- (BOOL)hasPlaceResult;
- (BOOL)hasUserValues;
- (BOOL)hasVenueCapacity;
- (BOOL)isDisputed;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToMapItem:(id)a3;
- (BOOL)isEventAllDay;
- (BOOL)isValid;
- (BOOL)readFrom:(id)a3;
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
- (GEOLatLng)originatingCoordinate;
- (GEOLocalizedString)disclaimerText;
- (GEOMapItemClientAttributes)clientAttributes;
- (GEOMapItemContainedPlace)_containedPlace;
- (GEOMapItemDetourInfo)detourInfo;
- (GEOMapItemIdentifier)_identifier;
- (GEOMapItemIdentifier)transitStationIdentifier;
- (GEOMapItemPhotosAttribution)_photosAttribution;
- (GEOMapItemPlaceAttribution)_attribution;
- (GEOMapItemReviewsAttribution)_reviewsAttribution;
- (GEOMapItemStorage)init;
- (GEOMapItemStorage)initWithData:(id)a3;
- (GEOMapItemStorage)initWithDictionary:(id)a3;
- (GEOMapItemStorage)initWithJSON:(id)a3;
- (GEOMapItemStorage)initWithPlace:(id)a3 clientAttributes:(id)a4 userValues:(id)a5;
- (GEOMapItemStorage)initWithPlaceData:(id)a3 detourInfo:(id)a4 clientAttributes:(id)a5 userValues:(id)a6 additionalPlaceDatas:(id)a7;
- (GEOMapItemStorage)initWithPlaceResult:(id)a3;
- (GEOMapItemStorageUserValues)userValues;
- (GEOMapItemTransitInfo)_transitInfo;
- (GEOMapItemVenueInfo)_venueInfo;
- (GEOMapRegion)displayMapRegion;
- (GEOMapRegion)displayMapRegionOrNil;
- (GEOMapRegion)geoFenceMapRegion;
- (GEOMapRegion)geoFenceMapRegionOrNil;
- (GEOMapRegion)mapRegion;
- (GEOMapRegion)offlineDownloadRegion;
- (GEOMessageLink)_messageLink;
- (GEOMiniBrowseCategories)_miniBrowseCategories;
- (GEOMuninViewState)_muninViewState;
- (GEOPDFlyover)_flyover;
- (GEOPDHikeAssociatedInfo)_hikeAssociatedInfo;
- (GEOPDHikeGeometry)_hikeGeometry;
- (GEOPDPlace)_placeData;
- (GEOPDPlace)placeData;
- (GEOPDResultDetourInfo)internalDetourInfo;
- (GEOPDURLData)urlData;
- (GEOPOIClaim)_poiClaim;
- (GEOPlace)_place;
- (GEOPlace)place;
- (GEOPlaceQuestionnaire)_placeQuestionnaire;
- (GEOPlaceResult)_placeResult;
- (GEOPlaceResult)placeResult;
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
- (NSData)externalTransitStationCode;
- (NSDate)eventDate;
- (NSDictionary)addressDictionary;
- (NSMutableArray)additionalPlaceDatas;
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
- (NSString)mapsURL;
- (NSString)name;
- (NSString)secondaryName;
- (NSString)secondarySpokenName;
- (NSTimeZone)timezone;
- (NSURL)_providerURL;
- (NSURL)_webURL;
- (PBUnknownFields)unknownFields;
- (double)_areaInMeters;
- (double)cachingRadiusMeters;
- (float)_normalizedUserRatingScore;
- (float)_photosMemoryScore;
- (float)displayMaxZoom;
- (float)displayMinZoom;
- (id)_arrivalMapRegionForTransportType:(int)a3;
- (id)_asPlaceInfo;
- (id)_bestAvatarBrandIconURLForSize:(CGSize)a3 allowSmaller:(BOOL)a4;
- (id)_bestHeroBrandIconURLForSize:(CGSize)a3 allowSmaller:(BOOL)a4;
- (id)_bestNavbarBrandIconURLForSize:(CGSize)a3 allowSmaller:(BOOL)a4;
- (id)_dictionaryRepresentation:(uint64_t)a1;
- (id)_firstRelatedPlaceListForType:(int)a3;
- (id)_geoMapItemCreatingAndAssociatingIfNeeded;
- (id)_localizedCategoryNamesForType:(unsigned int)a3;
- (id)_mapItemByStrippingOptionalData;
- (id)_relatedPlaceListForComponentIdentifier:(int)a3;
- (id)_spokenAddressForLocale:(id)a3;
- (id)additionalPlaceDatasAtIndex:(unint64_t)a3;
- (id)addressObject;
- (id)copyWithZone:(_NSZone *)a3;
- (id)dictionaryRepresentation;
- (id)jsonRepresentation;
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
- (unint64_t)additionalPlaceDatasCount;
- (unint64_t)hash;
- (unsigned)_maxScoreForPriceRange;
- (unsigned)_priceRange;
- (unsigned)_resultSnippetDistanceDisplayThreshold;
- (unsigned)_sampleSizeForUserRatingScore;
- (unsigned)_wifiFingerprintConfidence;
- (void)_addNoFlagsAdditionalPlaceDatas:(uint64_t)a1;
- (void)_initWithDictionary:(int)a3 isJSON:;
- (void)_readAdditionalPlaceDatas;
- (void)_readClientAttributes;
- (void)_readInternalDetourInfo;
- (void)_readMapsURL;
- (void)_readOriginatingCoordinate;
- (void)_readPlace;
- (void)_readPlaceData;
- (void)_readPlaceResult;
- (void)_readUserValues;
- (void)addAdditionalPlaceDatas:(id)a3;
- (void)clearAdditionalPlaceDatas;
- (void)clearSensitiveFields:(unint64_t)a3;
- (void)clearUnknownFields:(BOOL)a3;
- (void)copyTo:(id)a3;
- (void)initAdditionalFields;
- (void)iterateGroundViewsWithBlock:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)readAll:(BOOL)a3;
- (void)setAdditionalPlaceDatas:(id)a3;
- (void)setClientAttributes:(id)a3;
- (void)setInternalDetourInfo:(id)a3;
- (void)setMapsURL:(id)a3;
- (void)setOriginatingCoordinate:(id)a3;
- (void)setPlace:(id)a3;
- (void)setPlaceData:(id)a3;
- (void)setPlaceResult:(id)a3;
- (void)setUserValues:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation GEOMapItemStorage

- (GEOLabelGeometry)_labelGeometry
{
  v2 = [(GEOMapItemStorage *)self _geoMapItem];
  v3 = [v2 _labelGeometry];

  return (GEOLabelGeometry *)v3;
}

- (GEOMapItemVenueInfo)_venueInfo
{
  v2 = [(GEOMapItemStorage *)self _geoMapItem];
  v3 = [v2 _venueInfo];

  return (GEOMapItemVenueInfo *)v3;
}

- (BOOL)_hasVenueFeatureType
{
  v2 = [(GEOMapItemStorage *)self _geoMapItem];
  char v3 = [v2 _hasVenueFeatureType];

  return v3;
}

- (GEOFeatureStyleAttributes)_styleAttributes
{
  v2 = [(GEOMapItemStorage *)self _geoMapItem];
  char v3 = [v2 _styleAttributes];

  return (GEOFeatureStyleAttributes *)v3;
}

- ($F24F406B2B787EFB06265DBA3D28CBD5)coordinate
{
  char v3 = [(GEOMapItemStorage *)self clientAttributes];
  if (([v3 hasCorrectedLocationAttributes] & 1) == 0)
  {

    goto LABEL_5;
  }
  v4 = [(GEOMapItemStorage *)self clientAttributes];
  v5 = [v4 correctedLocationAttributes];
  int v6 = [v5 hasCorrectedCoordinate];

  if (!v6)
  {
LABEL_5:
    v7 = [(GEOMapItemStorage *)self _geoMapItem];
    [v7 coordinate];
    double v11 = v14;
    double v13 = v15;
    goto LABEL_6;
  }
  v7 = [(GEOMapItemStorage *)self clientAttributes];
  v8 = [v7 correctedLocationAttributes];
  v9 = [v8 correctedCoordinate];
  [v9 coordinate];
  double v11 = v10;
  double v13 = v12;

LABEL_6:
  double v16 = v11;
  double v17 = v13;
  result.var1 = v17;
  result.var0 = v16;
  return result;
}

- (GEOMapItemClientAttributes)clientAttributes
{
  -[GEOMapItemStorage _readClientAttributes]((uint64_t)self);
  clientAttributes = self->_clientAttributes;

  return clientAttributes;
}

- (void)_readClientAttributes
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 128));
    if ((*(_WORD *)(a1 + 132) & 4) == 0)
    {
      v2 = *(void **)(a1 + 32);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOMapItemStorageReadSpecified(a1, *(void *)(a1 + 32), (int *)&_readClientAttributes_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 128));
  }
}

- (BOOL)_hasMUID
{
  v2 = [(GEOMapItemStorage *)self _geoMapItem];
  char v3 = [v2 _hasMUID];

  return v3;
}

- (BOOL)_hasResultProviderID
{
  v2 = [(GEOMapItemStorage *)self _geoMapItem];
  char v3 = [v2 _hasResultProviderID];

  return v3;
}

- (id)_geoMapItemCreatingAndAssociatingIfNeeded
{
  uint64_t v4 = 0;
  v5 = &v4;
  uint64_t v6 = 0x3032000000;
  v7 = __Block_byref_object_copy__57;
  v8 = __Block_byref_object_dispose__57;
  id v9 = 0;
  geo_isolate_sync();
  id v2 = (id)v5[5];
  _Block_object_dispose(&v4, 8);

  return v2;
}

- (unint64_t)_muid
{
  id v2 = [(GEOMapItemStorage *)self _geoMapItem];
  unint64_t v3 = [v2 _muid];

  return v3;
}

- (int)_resultProviderID
{
  id v2 = [(GEOMapItemStorage *)self _geoMapItem];
  int v3 = [v2 _resultProviderID];

  return v3;
}

- (int)_placeDisplayType
{
  id v2 = [(GEOMapItemStorage *)self _geoMapItem];
  int v3 = [v2 _placeDisplayType];

  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return GEOMapItemStorageReadAllFrom((uint64_t)self, a3, 0);
}

- (unint64_t)_customIconID
{
  id v2 = [(GEOMapItemStorage *)self _geoMapItem];
  unint64_t v3 = [v2 _customIconID];

  return v3;
}

- (GEOMapRegion)geoFenceMapRegion
{
  id v2 = [(GEOMapItemStorage *)self _geoMapItem];
  unint64_t v3 = [v2 geoFenceMapRegion];

  return (GEOMapRegion *)v3;
}

- (NSString)_poiCategory
{
  id v2 = [(GEOMapItemStorage *)self _styleAttributes];
  if (v2)
  {
    unint64_t v3 = +[GEOPOITypeMapping sharedMapping];
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
  id v2 = [(GEOMapItemStorage *)self _geoMapItem];
  char v3 = [v2 _hasResolvablePartialInformation];

  return v3;
}

void __74__GEOMapItemStorage_GEOMapItem___geoMapItemCreatingAndAssociatingIfNeeded__block_invoke(uint64_t a1)
{
  id v2 = *(void **)(a1 + 32);
  char v3 = (void *)v2[2];
  if (!v3)
  {
    if ([v2 hasPlaceData])
    {
      uint64_t v4 = [_GEOPlaceDataItem alloc];
      v5 = [*(id *)(a1 + 32) placeData];
      uint64_t v6 = [*(id *)(a1 + 32) internalDetourInfo];
      v7 = [*(id *)(a1 + 32) additionalPlaceDatas];
      uint64_t v8 = [(_GEOPlaceDataItem *)v4 initWithPlaceData:v5 detourInfo:v6 additionalPlaceDatas:v7];
      uint64_t v9 = *(void *)(a1 + 32);
      double v10 = *(void **)(v9 + 16);
      *(void *)(v9 + 16) = v8;

LABEL_10:
      goto LABEL_11;
    }
    int v11 = [*(id *)(a1 + 32) hasPlaceResult];
    double v12 = *(void **)(a1 + 32);
    if (v11)
    {
      double v13 = [v12 placeResult];
    }
    else
    {
      int v14 = [v12 hasPlace];
      double v15 = *(void **)(a1 + 32);
      if (!v14)
      {
        if (![v15 hasMapsURL])
        {
LABEL_11:
          if (*(void *)(*(void *)(a1 + 32) + 16))
          {
            v18 = -[_GEOMapItemStorageNotificationTrampoline initWithMapItem:mapItemStorage:]([_GEOMapItemStorageNotificationTrampoline alloc], "initWithMapItem:mapItemStorage:", *(void *)(*(void *)(a1 + 32) + 16));
            uint64_t v19 = *(void *)(a1 + 32);
            v20 = *(void **)(v19 + 8);
            *(void *)(v19 + 8) = v18;

            char v3 = *(void **)(*(void *)(a1 + 32) + 16);
          }
          else
          {
            char v3 = 0;
          }
          goto LABEL_14;
        }
        v22 = (void *)MEMORY[0x1E4F1CB10];
        v23 = [*(id *)(a1 + 32) mapsURL];
        v5 = [v22 URLWithString:v23];

        double v16 = [[GEOURLBackedMapItem alloc] initWithURL:v5];
        goto LABEL_9;
      }
      double v13 = [v15 place];
    }
    v5 = v13;
    double v16 = [v13 geoMapItem];
LABEL_9:
    uint64_t v17 = *(void *)(a1 + 32);
    uint64_t v6 = *(void **)(v17 + 16);
    *(void *)(v17 + 16) = v16;
    goto LABEL_10;
  }
LABEL_14:
  v21 = (id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40);

  objc_storeStrong(v21, v3);
}

- (BOOL)hasPlaceData
{
  return self->_placeData != 0;
}

- (void)_readPlaceData
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 128));
    if ((*(_WORD *)(a1 + 132) & 0x40) == 0)
    {
      id v2 = *(void **)(a1 + 32);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOMapItemStorageReadSpecified(a1, *(void *)(a1 + 32), (int *)&_readPlaceData_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 128));
  }
}

- (GEOPDPlace)placeData
{
  -[GEOMapItemStorage _readPlaceData]((uint64_t)self);
  placeData = self->_placeData;

  return placeData;
}

- (GEOPDResultDetourInfo)internalDetourInfo
{
  -[GEOMapItemStorage _readInternalDetourInfo]((uint64_t)self);
  internalDetourInfo = self->_internalDetourInfo;

  return internalDetourInfo;
}

- (NSMutableArray)additionalPlaceDatas
{
  -[GEOMapItemStorage _readAdditionalPlaceDatas]((uint64_t)self);
  additionalPlaceDatas = self->_additionalPlaceDatas;

  return additionalPlaceDatas;
}

- (void)_readInternalDetourInfo
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 128));
    if ((*(_WORD *)(a1 + 132) & 8) == 0)
    {
      id v2 = *(void **)(a1 + 32);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOMapItemStorageReadSpecified(a1, *(void *)(a1 + 32), (int *)&_readInternalDetourInfo_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 128));
  }
}

- (void)_readAdditionalPlaceDatas
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 128));
    if ((*(_WORD *)(a1 + 132) & 2) == 0)
    {
      id v2 = *(void **)(a1 + 32);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOMapItemStorageReadSpecified(a1, *(void *)(a1 + 32), (int *)&_readAdditionalPlaceDatas_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 128));
  }
}

+ (id)mapItemStorageForGEOMapItem:(id)a3 clientAttributes:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  if ([v7 isMemberOfClass:objc_opt_class()])
  {
    uint64_t v8 = [v7 copy];
  }
  else
  {
    uint64_t v8 = [a1 mapItemStorageForGEOMapItem:v7];
  }
  uint64_t v9 = (void *)v8;

  [v9 setClientAttributes:v6];

  return v9;
}

- (void)setClientAttributes:(id)a3
{
  *(_WORD *)&self->_flags |= 0x404u;
  objc_storeStrong((id *)&self->_clientAttributes, a3);
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  os_unfair_lock_lock(&self->_readerLock);
  reader = self->_reader;
  if (reader)
  {
    id v7 = reader;
    objc_sync_enter(v7);
    if ((*(_WORD *)&self->_flags & 0x400) == 0)
    {
      *(void *)((char *)self->_reader + (int)*MEMORY[0x1E4F940E0]) = self->_readerMarkLength;
      [(PBDataReader *)self->_reader seekToOffset:self->_readerMarkPos];
      GEOMapItemStorageReadAllFrom(v5, self->_reader, 0);
      os_unfair_lock_unlock(&self->_readerLock);
      objc_sync_exit(v7);

      return (id)v5;
    }
    objc_sync_exit(v7);
  }
  os_unfair_lock_unlock(&self->_readerLock);
  [(GEOMapItemStorage *)self readAll:0];
  id v8 = [(GEOPDPlace *)self->_placeData copyWithZone:a3];
  uint64_t v9 = *(void **)(v5 + 88);
  *(void *)(v5 + 88) = v8;

  id v10 = [(GEOPlace *)self->_place copyWithZone:a3];
  int v11 = *(void **)(v5 + 104);
  *(void *)(v5 + 104) = v10;

  id v12 = [(GEOMapItemClientAttributes *)self->_clientAttributes copyWithZone:a3];
  double v13 = *(void **)(v5 + 56);
  *(void *)(v5 + 56) = v12;

  id v14 = [(GEOPlaceResult *)self->_placeResult copyWithZone:a3];
  double v15 = *(void **)(v5 + 96);
  *(void *)(v5 + 96) = v14;

  id v16 = [(GEOLatLng *)self->_originatingCoordinate copyWithZone:a3];
  uint64_t v17 = *(void **)(v5 + 80);
  *(void *)(v5 + 80) = v16;

  id v18 = [(GEOPDResultDetourInfo *)self->_internalDetourInfo copyWithZone:a3];
  uint64_t v19 = *(void **)(v5 + 64);
  *(void *)(v5 + 64) = v18;

  uint64_t v20 = [(NSString *)self->_mapsURL copyWithZone:a3];
  v21 = *(void **)(v5 + 72);
  *(void *)(v5 + 72) = v20;

  id v22 = [(GEOMapItemStorageUserValues *)self->_userValues copyWithZone:a3];
  v23 = *(void **)(v5 + 112);
  *(void *)(v5 + 112) = v22;

  long long v32 = 0u;
  long long v33 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  v24 = self->_additionalPlaceDatas;
  uint64_t v25 = [(NSMutableArray *)v24 countByEnumeratingWithState:&v30 objects:v34 count:16];
  if (v25)
  {
    uint64_t v26 = *(void *)v31;
    do
    {
      uint64_t v27 = 0;
      do
      {
        if (*(void *)v31 != v26) {
          objc_enumerationMutation(v24);
        }
        v28 = objc_msgSend(*(id *)(*((void *)&v30 + 1) + 8 * v27), "copyWithZone:", a3, (void)v30);
        [(id)v5 addAdditionalPlaceDatas:v28];

        ++v27;
      }
      while (v25 != v27);
      uint64_t v25 = [(NSMutableArray *)v24 countByEnumeratingWithState:&v30 objects:v34 count:16];
    }
    while (v25);
  }

  objc_storeStrong((id *)(v5 + 40), self->_unknownFields);
  return (id)v5;
}

- (GEOMapItemStorage)initWithData:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)GEOMapItemStorage;
  id v3 = [(GEOMapItemStorage *)&v7 initWithData:a3];
  uint64_t v4 = v3;
  if (v3)
  {
    v3->_readerLock._os_unfair_lock_opaque = 0;
    [(GEOMapItemStorage *)v3 initAdditionalFields];
    uint64_t v5 = v4;
  }

  return v4;
}

- (GEOMapItemStorage)init
{
  v6.receiver = self;
  v6.super_class = (Class)GEOMapItemStorage;
  id v2 = [(GEOMapItemStorage *)&v6 init];
  id v3 = v2;
  if (v2)
  {
    v2->_readerLock._os_unfair_lock_opaque = 0;
    [(GEOMapItemStorage *)v2 initAdditionalFields];
    uint64_t v4 = v3;
  }

  return v3;
}

- (void)initAdditionalFields
{
  id v3 = (geo_isolater *)geo_isolater_create();
  geoMapItemIsolater = self->_geoMapItemIsolater;
  self->_geoMapItemIsolater = v3;
}

- (void)readAll:(BOOL)a3
{
  BOOL v3 = a3;
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  reader = self->_reader;
  if (reader)
  {
    objc_super v7 = reader;
    objc_sync_enter(v7);
    if (v3) {
      id v8 = (int *)&readAll__recursiveTag_1127;
    }
    else {
      id v8 = (int *)&readAll__nonRecursiveTag_1128;
    }
    GEOMapItemStorageReadSpecified((uint64_t)self, (unint64_t)self->_reader, v8);
    objc_sync_exit(v7);
  }
  if (v3) {
    _GEOMapItemStorageCallReadAllRecursiveWithoutSynchronized((id *)&self->super.super.isa);
  }

  os_unfair_lock_unlock(p_readerLock);
}

- (GEOMapItemStorage)initWithPlace:(id)a3 clientAttributes:(id)a4 userValues:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v19.receiver = self;
  v19.super_class = (Class)GEOMapItemStorage;
  int v11 = [(GEOMapItemStorage *)&v19 init];
  id v12 = v11;
  if (v11)
  {
    [(GEOMapItemStorage *)v11 initAdditionalFields];
    [(GEOMapItemStorage *)v12 setPlace:v8];
    [(GEOMapItemStorage *)v12 setClientAttributes:v9];
    [(GEOMapItemStorage *)v12 setUserValues:v10];
    uint64_t v13 = [v8 geoMapItem];
    geoMapItem = v12->_geoMapItem;
    v12->_geoMapItem = (GEOMapItem *)v13;

    double v15 = [[_GEOMapItemStorageNotificationTrampoline alloc] initWithMapItem:v12->_geoMapItem mapItemStorage:v12];
    trampoline = v12->_trampoline;
    v12->_trampoline = v15;

    uint64_t v17 = v12;
  }

  return v12;
}

- (void)setUserValues:(id)a3
{
  *(_WORD *)&self->_flags |= 0x600u;
  objc_storeStrong((id *)&self->_userValues, a3);
}

- (void)setPlace:(id)a3
{
  *(_WORD *)&self->_flags |= 0x500u;
  objc_storeStrong((id *)&self->_place, a3);
}

- (GEOPlace)place
{
  -[GEOMapItemStorage _readPlace]((uint64_t)self);
  place = self->_place;

  return place;
}

- (BOOL)hasPlace
{
  return self->_place != 0;
}

- (void)_readPlace
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 128));
    if ((*(_WORD *)(a1 + 132) & 0x100) == 0)
    {
      id v2 = *(void **)(a1 + 32);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOMapItemStorageReadSpecified(a1, *(void *)(a1 + 32), (int *)&_readPlace_tags_6);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 128));
  }
}

- (BOOL)hasPlaceResult
{
  return self->_placeResult != 0;
}

- (void)_readPlaceResult
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 128));
    if ((*(_WORD *)(a1 + 132) & 0x80) == 0)
    {
      id v2 = *(void **)(a1 + 32);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOMapItemStorageReadSpecified(a1, *(void *)(a1 + 32), (int *)&_readPlaceResult_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 128));
  }
}

- (BOOL)hasExpiredComponents
{
  id v2 = [(GEOMapItemStorage *)self _geoMapItem];
  char v3 = [v2 hasExpiredComponents];

  return v3;
}

- (GEOEnhancedPlacement)_enhancedPlacement
{
  id v2 = [(GEOMapItemStorage *)self _geoMapItem];
  char v3 = [v2 _enhancedPlacement];

  return (GEOEnhancedPlacement *)v3;
}

- (BOOL)_hasAreaHighlightId
{
  id v2 = [(GEOMapItemStorage *)self _geoMapItem];
  char v3 = [v2 _hasAreaHighlightId];

  return v3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_userValues, 0);
  objc_storeStrong((id *)&self->_place, 0);
  objc_storeStrong((id *)&self->_placeResult, 0);
  objc_storeStrong((id *)&self->_placeData, 0);
  objc_storeStrong((id *)&self->_originatingCoordinate, 0);
  objc_storeStrong((id *)&self->_mapsURL, 0);
  objc_storeStrong((id *)&self->_internalDetourInfo, 0);
  objc_storeStrong((id *)&self->_clientAttributes, 0);
  objc_storeStrong((id *)&self->_additionalPlaceDatas, 0);
  objc_storeStrong((id *)&self->_unknownFields, 0);
  objc_storeStrong((id *)&self->_reader, 0);
  objc_storeStrong((id *)&self->_geoMapItemIsolater, 0);
  objc_storeStrong((id *)&self->_geoMapItem, 0);

  objc_storeStrong((id *)&self->_trampoline, 0);
}

- (NSString)name
{
  char v3 = [(GEOMapItemStorage *)self userValues];
  int v4 = [v3 hasName];

  if (v4) {
    [(GEOMapItemStorage *)self userValues];
  }
  else {
  uint64_t v5 = [(GEOMapItemStorage *)self _geoMapItem];
  }
  objc_super v6 = [v5 name];

  return (NSString *)v6;
}

- (GEOMapItemStorageUserValues)userValues
{
  -[GEOMapItemStorage _readUserValues]((uint64_t)self);
  userValues = self->_userValues;

  return userValues;
}

- (void)_readUserValues
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 128));
    if ((*(_WORD *)(a1 + 132) & 0x200) == 0)
    {
      id v2 = *(void **)(a1 + 32);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOMapItemStorageReadSpecified(a1, *(void *)(a1 + 32), (int *)&_readUserValues_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 128));
  }
}

+ (id)mapItemStorageForGEOMapItem:(id)a3
{
  id v3 = a3;
  if (![v3 isValid]
    || ![v3 conformsToProtocol:&unk_1ED78BC80])
  {
    uint64_t v5 = 0;
    goto LABEL_15;
  }
  if ([v3 conformsToProtocol:&unk_1ED7DD150])
  {
    int v4 = [v3 mapItemStorageForGEOMapItem];
LABEL_8:
    uint64_t v5 = v4;
    goto LABEL_15;
  }
  if ([v3 isMemberOfClass:objc_opt_class()])
  {
    int v4 = (GEOMapItemStorage *)v3;
    goto LABEL_8;
  }
  objc_super v6 = [v3 _placeData];

  if (v6)
  {
    objc_super v7 = [v3 _additionalPlaceInfos];
    id v8 = objc_msgSend(v7, "_geo_compactMap:", &__block_literal_global_108);

    id v9 = [GEOMapItemStorage alloc];
    id v10 = [v3 _placeData];
    int v11 = [v3 detourInfo];
    id v12 = [v11 _detourInfo];
    uint64_t v13 = [v3 _clientAttributes];
    uint64_t v5 = [(GEOMapItemStorage *)v9 initWithPlaceData:v10 detourInfo:v12 clientAttributes:v13 userValues:0 additionalPlaceDatas:v8];

LABEL_11:
LABEL_14:

    goto LABEL_15;
  }
  id v14 = [v3 _placeResult];

  if (v14)
  {
    double v15 = [GEOMapItemStorage alloc];
    id v16 = [v3 _placeResult];
    uint64_t v5 = [(GEOMapItemStorage *)v15 initWithPlaceResult:v16];

    id v8 = [v3 _clientAttributes];
    [(GEOMapItemStorage *)v5 setClientAttributes:v8];
    goto LABEL_14;
  }
  uint64_t v5 = [v3 _place];

  if (v5)
  {
    id v18 = [GEOMapItemStorage alloc];
    id v8 = [v3 _place];
    id v10 = [v3 _clientAttributes];
    uint64_t v5 = [(GEOMapItemStorage *)v18 initWithPlace:v8 clientAttributes:v10 userValues:0];
    goto LABEL_11;
  }
LABEL_15:

  return v5;
}

- (GEOPDPlace)_placeData
{
  id v2 = [(GEOMapItemStorage *)self _geoMapItem];
  id v3 = [v2 _placeData];

  return (GEOPDPlace *)v3;
}

- (GEOPlace)_place
{
  id v2 = [(GEOMapItemStorage *)self _geoMapItem];
  id v3 = [v2 _place];

  return (GEOPlace *)v3;
}

- (BOOL)isValid
{
  id v2 = [(GEOMapItemStorage *)self _geoMapItemCreatingAndAssociatingIfNeeded];
  char v3 = [v2 isValid];

  return v3;
}

- (GEOMapItemStorage)initWithPlaceData:(id)a3 detourInfo:(id)a4 clientAttributes:(id)a5 userValues:(id)a6 additionalPlaceDatas:(id)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  id v16 = a7;
  v26.receiver = self;
  v26.super_class = (Class)GEOMapItemStorage;
  uint64_t v17 = [(GEOMapItemStorage *)&v26 init];
  id v18 = v17;
  if (v17)
  {
    [(GEOMapItemStorage *)v17 initAdditionalFields];
    [(GEOMapItemStorage *)v18 setPlaceData:v12];
    [(GEOMapItemStorage *)v18 setClientAttributes:v14];
    [(GEOMapItemStorage *)v18 setInternalDetourInfo:v13];
    [(GEOMapItemStorage *)v18 setUserValues:v15];
    if ([v16 count])
    {
      objc_super v19 = (void *)[v16 mutableCopy];
      [(GEOMapItemStorage *)v18 setAdditionalPlaceDatas:v19];
    }
    uint64_t v20 = [[_GEOPlaceDataItem alloc] initWithPlaceData:v12 detourInfo:v13 additionalPlaceDatas:v16];
    geoMapItem = v18->_geoMapItem;
    v18->_geoMapItem = (GEOMapItem *)v20;

    id v22 = [[_GEOMapItemStorageNotificationTrampoline alloc] initWithMapItem:v18->_geoMapItem mapItemStorage:v18];
    trampoline = v18->_trampoline;
    v18->_trampoline = v22;

    v24 = v18;
  }

  return v18;
}

- (void)setPlaceData:(id)a3
{
  *(_WORD *)&self->_flags |= 0x440u;
  objc_storeStrong((id *)&self->_placeData, a3);
}

- (void)setInternalDetourInfo:(id)a3
{
  *(_WORD *)&self->_flags |= 0x408u;
  objc_storeStrong((id *)&self->_internalDetourInfo, a3);
}

+ (id)mapItemStorageForPlace:(id)a3
{
  id v3 = a3;
  int v4 = [[GEOMapItemStorage alloc] initWithPlace:v3 clientAttributes:0 userValues:0];

  return v4;
}

- (GEOPlaceResult)_placeResult
{
  id v2 = [(GEOMapItemStorage *)self _geoMapItem];
  id v3 = [v2 _placeResult];

  return (GEOPlaceResult *)v3;
}

- (NSArray)areasOfInterest
{
  id v2 = [(GEOMapItemStorage *)self _geoMapItem];
  id v3 = [v2 areasOfInterest];

  return (NSArray *)v3;
}

- (GEOMapItemIdentifier)_identifier
{
  id v2 = [(GEOMapItemStorage *)self _geoMapItem];
  id v3 = [v2 _identifier];

  return (GEOMapItemIdentifier *)v3;
}

- (id)addressObject
{
  id v2 = [(GEOMapItemStorage *)self _geoMapItem];
  id v3 = [v2 addressObject];

  return v3;
}

- (NSDictionary)addressDictionary
{
  id v3 = [(GEOMapItemStorage *)self clientAttributes];
  if ([v3 hasCorrectedLocationAttributes])
  {
    int v4 = [(GEOMapItemStorage *)self clientAttributes];
    uint64_t v5 = [v4 correctedLocationAttributes];
    int v6 = [v5 hasCorrectedAddress];

    if (v6)
    {
      objc_super v7 = [(GEOMapItemStorage *)self clientAttributes];
      id v8 = [v7 correctedLocationAttributes];
      id v9 = [v8 correctedAddress];
      id v10 = [v9 addressDictionary];

      goto LABEL_6;
    }
  }
  else
  {
  }
  objc_super v7 = [(GEOMapItemStorage *)self _geoMapItem];
  id v10 = [v7 addressDictionary];
LABEL_6:

  return (NSDictionary *)v10;
}

- (GEOAddress)geoAddress
{
  id v3 = [(GEOMapItemStorage *)self clientAttributes];
  if ([v3 hasCorrectedLocationAttributes])
  {
    int v4 = [(GEOMapItemStorage *)self clientAttributes];
    uint64_t v5 = [v4 correctedLocationAttributes];
    int v6 = [v5 hasCorrectedAddress];

    if (v6)
    {
      objc_super v7 = [(GEOMapItemStorage *)self clientAttributes];
      id v8 = [v7 correctedLocationAttributes];
      id v9 = [v8 correctedAddress];

      goto LABEL_6;
    }
  }
  else
  {
  }
  objc_super v7 = [(GEOMapItemStorage *)self _geoMapItem];
  id v9 = [v7 geoAddress];
LABEL_6:

  return (GEOAddress *)v9;
}

- (int)_placeType
{
  id v2 = [(GEOMapItemStorage *)self _geoMapItem];
  int v3 = [v2 _placeType];

  return v3;
}

- (int)_addressGeocodeAccuracy
{
  id v2 = [(GEOMapItemStorage *)self _geoMapItem];
  int v3 = [v2 _addressGeocodeAccuracy];

  return v3;
}

- (NSArray)_photos
{
  id v2 = [(GEOMapItemStorage *)self _geoMapItem];
  int v3 = [v2 _photos];

  return (NSArray *)v3;
}

- (BOOL)isEqual:(id)a3
{
  int v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_20;
  }
  [(GEOMapItemStorage *)self readAll:1];
  [v4 readAll:1];
  placeData = self->_placeData;
  if ((unint64_t)placeData | v4[11])
  {
    if (!-[GEOPDPlace isEqual:](placeData, "isEqual:")) {
      goto LABEL_20;
    }
  }
  if (((place = self->_place, !((unint64_t)place | v4[13])) || -[GEOPlace isEqual:](place, "isEqual:"))
    && ((clientAttributes = self->_clientAttributes, !((unint64_t)clientAttributes | v4[7]))
     || -[GEOMapItemClientAttributes isEqual:](clientAttributes, "isEqual:"))
    && ((placeResult = self->_placeResult, !((unint64_t)placeResult | v4[12]))
     || -[GEOPlaceResult isEqual:](placeResult, "isEqual:"))
    && ((originatingCoordinate = self->_originatingCoordinate, !((unint64_t)originatingCoordinate | v4[10]))
     || -[GEOLatLng isEqual:](originatingCoordinate, "isEqual:"))
    && ((internalDetourInfo = self->_internalDetourInfo, !((unint64_t)internalDetourInfo | v4[8]))
     || -[GEOPDResultDetourInfo isEqual:](internalDetourInfo, "isEqual:"))
    && ((mapsURL = self->_mapsURL, !((unint64_t)mapsURL | v4[9]))
     || -[NSString isEqual:](mapsURL, "isEqual:"))
    && ((userValues = self->_userValues, !((unint64_t)userValues | v4[14]))
     || -[GEOMapItemStorageUserValues isEqual:](userValues, "isEqual:")))
  {
    additionalPlaceDatas = self->_additionalPlaceDatas;
    if ((unint64_t)additionalPlaceDatas | v4[6]) {
      char v14 = -[NSMutableArray isEqual:](additionalPlaceDatas, "isEqual:");
    }
    else {
      char v14 = 1;
    }
  }
  else
  {
LABEL_20:
    char v14 = 0;
  }

  return v14;
}

- (int)referenceFrame
{
  id v2 = [(GEOMapItemStorage *)self _geoMapItem];
  int v3 = [v2 referenceFrame];

  return v3;
}

- ($F24F406B2B787EFB06265DBA3D28CBD5)centerCoordinate
{
  int v3 = [(GEOMapItemStorage *)self clientAttributes];
  if (([v3 hasCorrectedLocationAttributes] & 1) == 0)
  {

    goto LABEL_5;
  }
  int v4 = [(GEOMapItemStorage *)self clientAttributes];
  uint64_t v5 = [v4 correctedLocationAttributes];
  int v6 = [v5 hasCorrectedCoordinate];

  if (!v6)
  {
LABEL_5:
    objc_super v7 = [(GEOMapItemStorage *)self _geoMapItem];
    [v7 centerCoordinate];
    double v11 = v14;
    double v13 = v15;
    goto LABEL_6;
  }
  objc_super v7 = [(GEOMapItemStorage *)self clientAttributes];
  id v8 = [v7 correctedLocationAttributes];
  id v9 = [v8 correctedCoordinate];
  [v9 coordinate];
  double v11 = v10;
  double v13 = v12;

LABEL_6:
  double v16 = v11;
  double v17 = v13;
  result.var1 = v17;
  result.var0 = v16;
  return result;
}

- (NSArray)_roadAccessPoints
{
  id v2 = [(GEOMapItemStorage *)self _geoMapItem];
  int v3 = [v2 _roadAccessPoints];

  return (NSArray *)v3;
}

- (id)_arrivalMapRegionForTransportType:(int)a3
{
  uint64_t v3 = *(void *)&a3;
  int v4 = [(GEOMapItemStorage *)self _geoMapItem];
  uint64_t v5 = [v4 _arrivalMapRegionForTransportType:v3];

  return v5;
}

- (BOOL)_isPartiallyClientized
{
  id v2 = [(GEOMapItemStorage *)self _geoMapItem];
  char v3 = [v2 _isPartiallyClientized];

  return v3;
}

- (NSTimeZone)timezone
{
  char v3 = [(GEOMapItemStorage *)self userValues];
  int v4 = [v3 hasTimeZoneName];

  if (v4)
  {
    uint64_t v5 = (void *)MEMORY[0x1E4F1CAF0];
    int v6 = [(GEOMapItemStorage *)self userValues];
    objc_super v7 = [v6 timeZoneName];
    id v8 = [(GEOMapItemStorage *)self userValues];
    id v9 = [v8 timeZoneData];
    double v10 = [v5 timeZoneWithName:v7 data:v9];
  }
  else
  {
    int v6 = [(GEOMapItemStorage *)self _geoMapItem];
    double v10 = [v6 timezone];
  }

  return (NSTimeZone *)v10;
}

- (BOOL)contactIsMe
{
  char v3 = [(GEOMapItemStorage *)self clientAttributes];
  int v4 = [v3 hasAddressBookAttributes];

  uint64_t v5 = [(GEOMapItemStorage *)self clientAttributes];
  int v6 = v5;
  if (v4)
  {
    objc_super v7 = [v5 addressBookAttributes];
    char v8 = [v7 isMe];

    return v8;
  }
  else
  {
    int v10 = [v5 hasRoutineAttributes];

    BOOL result = 0;
    if (v10)
    {
      double v11 = [(GEOMapItemStorage *)self clientAttributes];
      double v12 = [v11 routineAttributes];
      int v13 = [v12 loiType];

      if ((v13 - 1) < 3) {
        return 1;
      }
    }
  }
  return result;
}

- (BOOL)_hasTransit
{
  id v2 = [(GEOMapItemStorage *)self _geoMapItem];
  char v3 = [v2 _hasTransit];

  return v3;
}

- ($F24F406B2B787EFB06265DBA3D28CBD5)labelCoordinate
{
  id v2 = [(GEOMapItemStorage *)self _geoMapItem];
  [v2 labelCoordinate];
  double v4 = v3;
  double v6 = v5;

  double v7 = v4;
  double v8 = v6;
  result.var1 = v8;
  result.var0 = v7;
  return result;
}

- (void)writeTo:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  if (self->_reader && (_GEOMapItemStorageIsDirty((uint64_t)self) & 1) == 0)
  {
    int v10 = self->_reader;
    objc_sync_enter(v10);
    *(void *)((char *)self->_reader + (int)*MEMORY[0x1E4F940E0]) = self->_readerMarkLength;
    [(PBDataReader *)self->_reader seekToOffset:self->_readerMarkPos];
    double v11 = [(PBDataReader *)self->_reader readBytes:self->_readerMarkLength - self->_readerMarkPos];
    [v4 writeData:v11];
    os_unfair_lock_unlock(p_readerLock);

    objc_sync_exit(v10);
  }
  else
  {
    os_unfair_lock_unlock(&self->_readerLock);
    [(GEOMapItemStorage *)self readAll:0];
    if (self->_placeData) {
      PBDataWriterWriteSubmessage();
    }
    if (self->_place) {
      PBDataWriterWriteSubmessage();
    }
    if (self->_clientAttributes) {
      PBDataWriterWriteSubmessage();
    }
    if (self->_placeResult) {
      PBDataWriterWriteSubmessage();
    }
    if (self->_originatingCoordinate) {
      PBDataWriterWriteSubmessage();
    }
    if (self->_internalDetourInfo) {
      PBDataWriterWriteSubmessage();
    }
    if (self->_mapsURL) {
      PBDataWriterWriteStringField();
    }
    if (self->_userValues) {
      PBDataWriterWriteSubmessage();
    }
    long long v14 = 0u;
    long long v15 = 0u;
    long long v12 = 0u;
    long long v13 = 0u;
    double v6 = self->_additionalPlaceDatas;
    uint64_t v7 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v12 objects:v16 count:16];
    if (v7)
    {
      uint64_t v8 = *(void *)v13;
      do
      {
        uint64_t v9 = 0;
        do
        {
          if (*(void *)v13 != v8) {
            objc_enumerationMutation(v6);
          }
          PBDataWriterWriteSubmessage();
          ++v9;
        }
        while (v7 != v9);
        uint64_t v7 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v12 objects:v16 count:16];
      }
      while (v7);
    }

    -[PBUnknownFields writeTo:](self->_unknownFields, "writeTo:", v4, v12);
  }
}

id __61__GEOMapItemStorage_GEOMapItem__mapItemStorageForGEOMapItem___block_invoke(uint64_t a1, void *a2)
{
  id v2 = [a2 mapItem];
  double v3 = [v2 _placeData];

  return v3;
}

+ (id)mapItemStorageForGEOMapItem:(id)a3 forUseType:(unint64_t)a4
{
  uint64_t v344 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  if ([v6 isValid])
  {
    uint64_t v7 = [a1 mapItemStorageForGEOMapItem:v6];
    uint64_t v8 = v7;
    if (a4 - 3 < 4)
    {
      uint64_t v9 = +[GEOMapItemStorage mapItemStorageForMapsSync:v7 forUseType:a4];
LABEL_4:
      int v10 = v9;
LABEL_5:

      goto LABEL_7;
    }
    if (!a4)
    {
      uint64_t v9 = v7;
      goto LABEL_4;
    }
    int v10 = objc_alloc_init(GEOMapItemStorage);
    v269 = v10;
    if ([v8 hasPlaceData])
    {
      long long v12 = objc_alloc_init(GEOPDPlace);
      [(GEOMapItemStorage *)v10 setPlaceData:v12];

      long long v13 = [v8 placeData];
      int v14 = [v13 hasMuid];

      if (v14)
      {
        long long v15 = [v8 placeData];
        uint64_t v16 = [v15 muid];
        uint64_t v17 = [(GEOMapItemStorage *)v269 placeData];
        [v17 setMuid:v16];
      }
      id v18 = [v8 placeData];
      int v19 = [v18 hasPreferredMuid];

      if (v19)
      {
        uint64_t v20 = [v8 placeData];
        uint64_t v21 = [v20 preferredMuid];
        id v22 = [(GEOMapItemStorage *)v269 placeData];
        [v22 setPreferredMuid:v21];
      }
      v23 = [v8 placeData];
      int v24 = [v23 hasMapsId];

      if (v24)
      {
        uint64_t v25 = [v8 placeData];
        objc_super v26 = [v25 mapsId];
        uint64_t v27 = (void *)[v26 copy];
        [(GEOMapItemStorage *)v269 placeData];
        v29 = unint64_t v28 = a4;
        [v29 setMapsId:v27];

        a4 = v28;
      }
      long long v30 = [v8 placeData];
      int v31 = [v30 hasReferenceFrame];

      if (v31)
      {
        long long v32 = [v8 placeData];
        uint64_t v33 = [v32 referenceFrame];
        v34 = [(GEOMapItemStorage *)v269 placeData];
        [v34 setReferenceFrame:v33];
      }
      uint64_t v35 = [v8 placeData];
      int v36 = [v35 hasResultProviderId];

      if (v36)
      {
        v37 = [v8 placeData];
        uint64_t v38 = [v37 resultProviderId];
        v39 = [(GEOMapItemStorage *)v269 placeData];
        [v39 setResultProviderId:v38];
      }
      v40 = [v8 placeData];
      int v41 = [v40 hasStatus];

      if (v41)
      {
        v42 = [v8 placeData];
        uint64_t v43 = [v42 status];
        v44 = [(GEOMapItemStorage *)v269 placeData];
        [v44 setStatus:v43];
      }
      v45 = [v8 placeData];
      v46 = [v45 components];
      uint64_t v47 = [v46 count];

      int v10 = v269;
      if (v47)
      {
        unint64_t v266 = a4;
        id v268 = v6;
        unint64_t v48 = 0x1E4F1C000uLL;
        v49 = (void *)MEMORY[0x1E4F1CA48];
        v50 = [v8 placeData];
        v51 = [v50 components];
        v52 = objc_msgSend(v49, "arrayWithCapacity:", objc_msgSend(v51, "count"));
        v53 = [(GEOMapItemStorage *)v269 placeData];
        [v53 setComponents:v52];

        int v10 = v269;
        long long v328 = 0u;
        long long v329 = 0u;
        long long v326 = 0u;
        long long v327 = 0u;
        v267 = v8;
        v54 = [v8 placeData];
        v55 = [v54 components];

        uint64_t v272 = [v55 countByEnumeratingWithState:&v326 objects:v343 count:16];
        if (!v272) {
          goto LABEL_270;
        }
        v270 = v55;
        uint64_t v271 = *(void *)v327;
        while (1)
        {
          for (uint64_t i = 0; i != v272; ++i)
          {
            if (*(void *)v327 != v271) {
              objc_enumerationMutation(v55);
            }
            uint64_t v57 = *(void *)(*((void *)&v326 + 1) + 8 * i);
            v58 = -[GEOPDComponent values]((id *)v57);
            uint64_t v59 = [v58 count];

            if (v59)
            {
              uint64_t v273 = i;
              v60 = objc_alloc_init(GEOPDComponent);
              v61 = *(void **)(v48 + 2632);
              v62 = -[GEOPDComponent values]((id *)v57);
              v63 = objc_msgSend(v61, "arrayWithCapacity:", objc_msgSend(v62, "count"));
              -[GEOPDComponent setValues:]((uint64_t)v60, v63);

              if (v57 && (*(_WORD *)(v57 + 100) & 0x80) != 0)
              {
                int v64 = *(_DWORD *)(v57 + 88);
                if (v64 <= 30)
                {
                  switch(v64)
                  {
                    case 1:
                      v65 = -[GEOPDComponent values]((id *)v57);
                      uint64_t v66 = [v65 firstObject];

                      if (!v66 || !*(void *)(v66 + 192)) {
                        goto LABEL_244;
                      }
                      v67 = objc_alloc_init(GEOPDComponentValue);
                      v68 = -[GEOPDComponentValue entity]((id *)v66);
                      v69 = (void *)[v68 copy];
                      -[GEOPDComponentValue setEntity:]((uint64_t)v67, v69);

                      goto LABEL_188;
                    case 2:
                      v145 = -[GEOPDComponent values]((id *)v57);
                      uint64_t v66 = [v145 firstObject];

                      if (!v66 || !*(void *)(v66 + 400)) {
                        goto LABEL_244;
                      }
                      v67 = objc_alloc_init(GEOPDComponentValue);
                      v146 = -[GEOPDComponentValue placeInfo]((id *)v66);
                      v147 = (void *)[v146 copy];
                      -[GEOPDComponentValue setPlaceInfo:]((uint64_t)v67, v147);
                      goto LABEL_157;
                    case 4:
                      v148 = -[GEOPDComponent values]((id *)v57);
                      uint64_t v66 = [v148 firstObject];

                      if (!v66 || !*(void *)(v66 + 88)) {
                        goto LABEL_244;
                      }
                      v67 = objc_alloc_init(GEOPDComponentValue);
                      v146 = -[GEOPDComponentValue bounds]((id *)v66);
                      v147 = (void *)[v146 copy];
                      -[GEOPDComponentValue setBounds:]((uint64_t)v67, v147);
                      goto LABEL_157;
                    case 5:
                      v149 = -[GEOPDComponent values]((id *)v57);
                      uint64_t v66 = [v149 firstObject];

                      if (!v66 || !*(void *)(v66 + 56)) {
                        goto LABEL_244;
                      }
                      v67 = objc_alloc_init(GEOPDComponentValue);
                      v146 = -[GEOPDComponentValue address]((id *)v66);
                      v147 = (void *)[v146 copy];
                      -[GEOPDComponentValue setAddress:]((uint64_t)v67, v147);
                      goto LABEL_157;
                    case 6:
                      v150 = -[GEOPDComponent values]((id *)v57);
                      uint64_t v66 = [v150 firstObject];

                      if (!v66 || !*(void *)(v66 + 488)) {
                        goto LABEL_244;
                      }
                      v67 = objc_alloc_init(GEOPDComponentValue);
                      v146 = -[GEOPDComponentValue rating]((id *)v66);
                      v147 = (void *)[v146 copy];
                      -[GEOPDComponentValue setRating:]((uint64_t)v67, v147);
LABEL_157:

                      goto LABEL_188;
                    case 9:
                      long long v324 = 0u;
                      long long v325 = 0u;
                      long long v322 = 0u;
                      long long v323 = 0u;
                      uint64_t v66 = -[GEOPDComponent values]((id *)v57);
                      uint64_t v151 = [(id)v66 countByEnumeratingWithState:&v322 objects:v342 count:16];
                      if (!v151) {
                        goto LABEL_243;
                      }
                      uint64_t v152 = v151;
                      uint64_t v153 = *(void *)v323;
                      do
                      {
                        for (uint64_t j = 0; j != v152; ++j)
                        {
                          if (*(void *)v323 != v153) {
                            objc_enumerationMutation((id)v66);
                          }
                          uint64_t v155 = *(void *)(*((void *)&v322 + 1) + 8 * j);
                          if (v155 && *(void *)(v155 + 296))
                          {
                            v156 = objc_alloc_init(GEOPDComponentValue);
                            v157 = -[GEOPDComponentValue hours]((id *)v155);
                            v158 = (void *)[v157 copy];
                            -[GEOPDComponentValue setHours:]((uint64_t)v156, v158);

                            v159 = -[GEOPDComponent values]((id *)&v60->super.super.isa);
                            [v159 addObject:v156];
                          }
                          if (v60)
                          {
                            int v160 = *(_DWORD *)(v57 + 92);
                            *(_WORD *)&v60->_flags |= 0x100u;
                            v60->_valuesAvailable = v160;
                          }
                        }
                        uint64_t v152 = [(id)v66 countByEnumeratingWithState:&v322 objects:v342 count:16];
                      }
                      while (v152);
                      goto LABEL_242;
                    case 10:
                      long long v320 = 0u;
                      long long v321 = 0u;
                      long long v318 = 0u;
                      long long v319 = 0u;
                      uint64_t v66 = -[GEOPDComponent values]((id *)v57);
                      uint64_t v161 = [(id)v66 countByEnumeratingWithState:&v318 objects:v341 count:16];
                      if (!v161) {
                        goto LABEL_243;
                      }
                      uint64_t v162 = v161;
                      uint64_t v163 = *(void *)v319;
                      do
                      {
                        for (uint64_t k = 0; k != v162; ++k)
                        {
                          if (*(void *)v319 != v163) {
                            objc_enumerationMutation((id)v66);
                          }
                          uint64_t v165 = *(void *)(*((void *)&v318 + 1) + 8 * k);
                          if (v165 && *(void *)(v165 + 680))
                          {
                            v166 = objc_alloc_init(GEOPDComponentValue);
                            v167 = -[GEOPDComponentValue transitInfo]((id *)v165);
                            v168 = (void *)[v167 copy];
                            -[GEOPDComponentValue setTransitInfo:]((uint64_t)v166, v168);

                            v169 = -[GEOPDComponent values]((id *)&v60->super.super.isa);
                            [v169 addObject:v166];
                          }
                          if (v60)
                          {
                            int v170 = *(_DWORD *)(v57 + 92);
                            *(_WORD *)&v60->_flags |= 0x100u;
                            v60->_valuesAvailable = v170;
                          }
                        }
                        uint64_t v162 = [(id)v66 countByEnumeratingWithState:&v318 objects:v341 count:16];
                      }
                      while (v162);
                      goto LABEL_242;
                    case 13:
                      v171 = -[GEOPDComponent values]((id *)v57);
                      uint64_t v66 = [v171 firstObject];

                      if (!v66 || !*(void *)(v66 + 240)) {
                        goto LABEL_244;
                      }
                      v67 = objc_alloc_init(GEOPDComponentValue);
                      v81 = -[GEOPDComponentValue flyover]((id *)v66);
                      v82 = (void *)[v81 copy];
                      -[GEOPDComponentValue setFlyover:]((uint64_t)v67, v82);
                      goto LABEL_187;
                    case 15:
                      long long v316 = 0u;
                      long long v317 = 0u;
                      long long v314 = 0u;
                      long long v315 = 0u;
                      uint64_t v66 = -[GEOPDComponent values]((id *)v57);
                      uint64_t v174 = [(id)v66 countByEnumeratingWithState:&v314 objects:v340 count:16];
                      if (!v174) {
                        goto LABEL_243;
                      }
                      uint64_t v175 = v174;
                      uint64_t v176 = *(void *)v315;
                      do
                      {
                        for (uint64_t m = 0; m != v175; ++m)
                        {
                          if (*(void *)v315 != v176) {
                            objc_enumerationMutation((id)v66);
                          }
                          uint64_t v178 = *(void *)(*((void *)&v314 + 1) + 8 * m);
                          if (v178 && *(void *)(v178 + 64))
                          {
                            v179 = objc_alloc_init(GEOPDComponentValue);
                            v180 = -[GEOPDComponentValue amenities]((id *)v178);
                            v181 = (void *)[v180 copy];
                            -[GEOPDComponentValue setAmenities:]((uint64_t)v179, v181);

                            v182 = -[GEOPDComponent values]((id *)&v60->super.super.isa);
                            [v182 addObject:v179];
                          }
                          if (v60)
                          {
                            int v183 = *(_DWORD *)(v57 + 92);
                            *(_WORD *)&v60->_flags |= 0x100u;
                            v60->_valuesAvailable = v183;
                          }
                        }
                        uint64_t v175 = [(id)v66 countByEnumeratingWithState:&v314 objects:v340 count:16];
                      }
                      while (v175);
                      goto LABEL_242;
                    case 16:
                      long long v312 = 0u;
                      long long v313 = 0u;
                      long long v310 = 0u;
                      long long v311 = 0u;
                      uint64_t v66 = -[GEOPDComponent values]((id *)v57);
                      uint64_t v184 = [(id)v66 countByEnumeratingWithState:&v310 objects:v339 count:16];
                      if (!v184) {
                        goto LABEL_243;
                      }
                      uint64_t v185 = v184;
                      uint64_t v186 = *(void *)v311;
                      do
                      {
                        for (uint64_t n = 0; n != v185; ++n)
                        {
                          if (*(void *)v311 != v186) {
                            objc_enumerationMutation((id)v66);
                          }
                          uint64_t v188 = *(void *)(*((void *)&v310 + 1) + 8 * n);
                          if (v188 && *(void *)(v188 + 592))
                          {
                            v189 = objc_alloc_init(GEOPDComponentValue);
                            v190 = -[GEOPDComponentValue styleAttributes]((id *)v188);
                            v191 = (void *)[v190 copy];
                            -[GEOPDComponentValue setStyleAttributes:]((uint64_t)v189, v191);

                            v192 = -[GEOPDComponent values]((id *)&v60->super.super.isa);
                            [v192 addObject:v189];
                          }
                          if (v60)
                          {
                            int v193 = *(_DWORD *)(v57 + 92);
                            *(_WORD *)&v60->_flags |= 0x100u;
                            v60->_valuesAvailable = v193;
                          }
                        }
                        uint64_t v185 = [(id)v66 countByEnumeratingWithState:&v310 objects:v339 count:16];
                      }
                      while (v185);
                      goto LABEL_242;
                    case 24:
                      long long v308 = 0u;
                      long long v309 = 0u;
                      long long v306 = 0u;
                      long long v307 = 0u;
                      uint64_t v66 = -[GEOPDComponent values]((id *)v57);
                      uint64_t v194 = [(id)v66 countByEnumeratingWithState:&v306 objects:v338 count:16];
                      if (!v194) {
                        goto LABEL_243;
                      }
                      uint64_t v195 = v194;
                      uint64_t v196 = *(void *)v307;
                      do
                      {
                        for (iuint64_t i = 0; ii != v195; ++ii)
                        {
                          if (*(void *)v307 != v196) {
                            objc_enumerationMutation((id)v66);
                          }
                          uint64_t v198 = *(void *)(*((void *)&v306 + 1) + 8 * ii);
                          if (v198 && *(void *)(v198 + 656))
                          {
                            v199 = objc_alloc_init(GEOPDComponentValue);
                            v200 = -[GEOPDComponentValue transitAttribution]((id *)v198);
                            v201 = (void *)[v200 copy];
                            -[GEOPDComponentValue setTransitAttribution:]((uint64_t)v199, v201);

                            v202 = -[GEOPDComponent values]((id *)&v60->super.super.isa);
                            [v202 addObject:v199];
                          }
                          if (v60)
                          {
                            int v203 = *(_DWORD *)(v57 + 92);
                            *(_WORD *)&v60->_flags |= 0x100u;
                            v60->_valuesAvailable = v203;
                          }
                        }
                        uint64_t v195 = [(id)v66 countByEnumeratingWithState:&v306 objects:v338 count:16];
                      }
                      while (v195);
                      goto LABEL_242;
                    default:
                      goto LABEL_267;
                  }
                }
                if (v64 <= 49)
                {
                  switch(v64)
                  {
                    case 31:
                      v80 = -[GEOPDComponent values]((id *)v57);
                      uint64_t v66 = [v80 firstObject];

                      if (!v66 || !*(void *)(v66 + 40)) {
                        goto LABEL_244;
                      }
                      v67 = objc_alloc_init(GEOPDComponentValue);
                      v81 = -[GEOPDComponentValue addressObject]((id *)v66);
                      v82 = (void *)[v81 copy];
                      -[GEOPDComponentValue setAddressObject:]((uint64_t)v67, v82);
                      goto LABEL_187;
                    case 32:
                    case 34:
                    case 35:
                    case 36:
                    case 38:
                      goto LABEL_267;
                    case 33:
                      long long v304 = 0u;
                      long long v305 = 0u;
                      long long v302 = 0u;
                      long long v303 = 0u;
                      uint64_t v66 = -[GEOPDComponent values]((id *)v57);
                      uint64_t v124 = [(id)v66 countByEnumeratingWithState:&v302 objects:v337 count:16];
                      if (!v124) {
                        break;
                      }
                      uint64_t v125 = v124;
                      uint64_t v126 = *(void *)v303;
                      do
                      {
                        for (uint64_t jj = 0; jj != v125; ++jj)
                        {
                          if (*(void *)v303 != v126) {
                            objc_enumerationMutation((id)v66);
                          }
                          uint64_t v128 = *(void *)(*((void *)&v302 + 1) + 8 * jj);
                          if (v128 && *(void *)(v128 + 520))
                          {
                            v129 = objc_alloc_init(GEOPDComponentValue);
                            v130 = -[GEOPDComponentValue restaurantReservationLink]((id *)v128);
                            v131 = (void *)[v130 copy];
                            -[GEOPDComponentValue setRestaurantReservationLink:]((uint64_t)v129, v131);

                            v132 = -[GEOPDComponent values]((id *)&v60->super.super.isa);
                            [v132 addObject:v129];
                          }
                          if (v60)
                          {
                            int v133 = *(_DWORD *)(v57 + 92);
                            *(_WORD *)&v60->_flags |= 0x100u;
                            v60->_valuesAvailable = v133;
                          }
                        }
                        uint64_t v125 = [(id)v66 countByEnumeratingWithState:&v302 objects:v337 count:16];
                      }
                      while (v125);
                      goto LABEL_242;
                    case 37:
                      v134 = -[GEOPDComponent values]((id *)v57);
                      uint64_t v66 = [v134 firstObject];

                      if (!v66 || !*(void *)(v66 + 424)) {
                        goto LABEL_244;
                      }
                      v67 = objc_alloc_init(GEOPDComponentValue);
                      v81 = -[GEOPDComponentValue placecardUrl]((id *)v66);
                      v82 = (void *)[v81 copy];
                      -[GEOPDComponentValue setPlacecardUrl:]((uint64_t)v67, v82);
                      goto LABEL_187;
                    case 39:
                      long long v300 = 0u;
                      long long v301 = 0u;
                      long long v298 = 0u;
                      long long v299 = 0u;
                      uint64_t v66 = -[GEOPDComponent values]((id *)v57);
                      uint64_t v135 = [(id)v66 countByEnumeratingWithState:&v298 objects:v336 count:16];
                      if (!v135) {
                        break;
                      }
                      uint64_t v136 = v135;
                      uint64_t v137 = *(void *)v299;
                      do
                      {
                        for (uint64_t kk = 0; kk != v136; ++kk)
                        {
                          if (*(void *)v299 != v137) {
                            objc_enumerationMutation((id)v66);
                          }
                          uint64_t v139 = *(void *)(*((void *)&v298 + 1) + 8 * kk);
                          if (v139 && *(void *)(v139 + 344))
                          {
                            v140 = objc_alloc_init(GEOPDComponentValue);
                            v141 = -[GEOPDComponentValue messageLink]((id *)v139);
                            v142 = (void *)[v141 copy];
                            -[GEOPDComponentValue setMessageLink:]((uint64_t)v140, v142);

                            v143 = -[GEOPDComponent values]((id *)&v60->super.super.isa);
                            [v143 addObject:v140];
                          }
                          if (v60)
                          {
                            int v144 = *(_DWORD *)(v57 + 92);
                            *(_WORD *)&v60->_flags |= 0x100u;
                            v60->_valuesAvailable = v144;
                          }
                        }
                        uint64_t v136 = [(id)v66 countByEnumeratingWithState:&v298 objects:v336 count:16];
                      }
                      while (v136);
LABEL_242:
                      int v10 = v269;
                      unint64_t v48 = 0x1E4F1C000;
                      break;
                    default:
                      if (v64 != 48) {
                        goto LABEL_267;
                      }
                      v93 = -[GEOPDComponent values]((id *)v57);
                      uint64_t v66 = [v93 firstObject];

                      if (!v66 || !*(void *)(v66 + 752)) {
                        goto LABEL_244;
                      }
                      v67 = objc_alloc_init(GEOPDComponentValue);
                      v81 = -[GEOPDComponentValue venueInfo]((id *)v66);
                      v82 = (void *)[v81 copy];
                      -[GEOPDComponentValue setVenueInfo:]((uint64_t)v67, v82);
LABEL_187:

LABEL_188:
                      v172 = -[GEOPDComponent values]((id *)&v60->super.super.isa);
                      [v172 addObject:v67];

                      if (v60)
                      {
                        int v173 = *(_DWORD *)(v57 + 92);
                        *(_WORD *)&v60->_flags |= 0x100u;
                        v60->_valuesAvailable = v173;
                      }

                      break;
                  }
                }
                else
                {
                  switch(v64)
                  {
                    case 'b':
                      long long v288 = 0u;
                      long long v289 = 0u;
                      long long v286 = 0u;
                      long long v287 = 0u;
                      uint64_t v66 = -[GEOPDComponent values]((id *)v57);
                      uint64_t v70 = [(id)v66 countByEnumeratingWithState:&v286 objects:v333 count:16];
                      if (!v70) {
                        break;
                      }
                      uint64_t v71 = v70;
                      uint64_t v72 = *(void *)v287;
                      do
                      {
                        for (uint64_t mm = 0; mm != v71; ++mm)
                        {
                          if (*(void *)v287 != v72) {
                            objc_enumerationMutation((id)v66);
                          }
                          uint64_t v74 = *(void *)(*((void *)&v286 + 1) + 8 * mm);
                          if (v74 && *(void *)(v74 + 640))
                          {
                            v75 = objc_alloc_init(GEOPDComponentValue);
                            v76 = -[GEOPDComponentValue trailHead]((id *)v74);
                            v77 = (void *)[v76 copy];
                            -[GEOPDComponentValue setTrailHead:]((uint64_t)v75, v77);

                            v78 = -[GEOPDComponent values]((id *)&v60->super.super.isa);
                            [v78 addObject:v75];
                          }
                          if (v60)
                          {
                            int v79 = *(_DWORD *)(v57 + 92);
                            *(_WORD *)&v60->_flags |= 0x100u;
                            v60->_valuesAvailable = v79;
                          }
                        }
                        uint64_t v71 = [(id)v66 countByEnumeratingWithState:&v286 objects:v333 count:16];
                      }
                      while (v71);
                      goto LABEL_242;
                    case 'c':
                    case 'd':
                    case 'e':
                    case 'f':
                    case 'g':
                      goto LABEL_267;
                    case 'h':
                      long long v276 = 0u;
                      long long v277 = 0u;
                      long long v274 = 0u;
                      long long v275 = 0u;
                      uint64_t v66 = -[GEOPDComponent values]((id *)v57);
                      uint64_t v94 = [(id)v66 countByEnumeratingWithState:&v274 objects:v330 count:16];
                      if (!v94) {
                        break;
                      }
                      uint64_t v95 = v94;
                      uint64_t v96 = *(void *)v275;
                      do
                      {
                        for (uint64_t nn = 0; nn != v95; ++nn)
                        {
                          if (*(void *)v275 != v96) {
                            objc_enumerationMutation((id)v66);
                          }
                          uint64_t v98 = *(void *)(*((void *)&v274 + 1) + 8 * nn);
                          if (v98 && *(void *)(v98 + 272))
                          {
                            v99 = objc_alloc_init(GEOPDComponentValue);
                            v100 = -[GEOPDComponentValue hikeAssociatedInfo]((id *)v98);
                            v101 = (void *)[v100 copy];
                            -[GEOPDComponentValue setHikeAssociatedInfo:]((uint64_t)v99, v101);

                            v102 = -[GEOPDComponent values]((id *)&v60->super.super.isa);
                            [v102 addObject:v99];
                          }
                          if (v60)
                          {
                            int v103 = *(_DWORD *)(v57 + 92);
                            *(_WORD *)&v60->_flags |= 0x100u;
                            v60->_valuesAvailable = v103;
                          }
                        }
                        uint64_t v95 = [(id)v66 countByEnumeratingWithState:&v274 objects:v330 count:16];
                      }
                      while (v95);
                      goto LABEL_242;
                    case 'i':
                      long long v284 = 0u;
                      long long v285 = 0u;
                      long long v282 = 0u;
                      long long v283 = 0u;
                      uint64_t v66 = -[GEOPDComponent values]((id *)v57);
                      uint64_t v104 = [(id)v66 countByEnumeratingWithState:&v282 objects:v332 count:16];
                      if (!v104) {
                        break;
                      }
                      uint64_t v105 = v104;
                      uint64_t v106 = *(void *)v283;
                      do
                      {
                        for (uint64_t i1 = 0; i1 != v105; ++i1)
                        {
                          if (*(void *)v283 != v106) {
                            objc_enumerationMutation((id)v66);
                          }
                          uint64_t v108 = *(void *)(*((void *)&v282 + 1) + 8 * i1);
                          if (v108 && *(void *)(v108 + 288))
                          {
                            v109 = objc_alloc_init(GEOPDComponentValue);
                            v110 = -[GEOPDComponentValue hikeSummary]((id *)v108);
                            v111 = (void *)[v110 copy];
                            -[GEOPDComponentValue setHikeSummary:]((uint64_t)v109, v111);

                            v112 = -[GEOPDComponent values]((id *)&v60->super.super.isa);
                            [v112 addObject:v109];
                          }
                          if (v60)
                          {
                            int v113 = *(_DWORD *)(v57 + 92);
                            *(_WORD *)&v60->_flags |= 0x100u;
                            v60->_valuesAvailable = v113;
                          }
                        }
                        uint64_t v105 = [(id)v66 countByEnumeratingWithState:&v282 objects:v332 count:16];
                      }
                      while (v105);
                      goto LABEL_242;
                    case 'j':
                      long long v280 = 0u;
                      long long v281 = 0u;
                      long long v278 = 0u;
                      long long v279 = 0u;
                      uint64_t v66 = -[GEOPDComponent values]((id *)v57);
                      uint64_t v114 = [(id)v66 countByEnumeratingWithState:&v278 objects:v331 count:16];
                      if (!v114) {
                        break;
                      }
                      uint64_t v115 = v114;
                      uint64_t v116 = *(void *)v279;
                      do
                      {
                        for (uint64_t i2 = 0; i2 != v115; ++i2)
                        {
                          if (*(void *)v279 != v116) {
                            objc_enumerationMutation((id)v66);
                          }
                          uint64_t v118 = *(void *)(*((void *)&v278 + 1) + 8 * i2);
                          if (v118 && *(void *)(v118 + 280))
                          {
                            v119 = objc_alloc_init(GEOPDComponentValue);
                            v120 = -[GEOPDComponentValue hikeGeometry]((id *)v118);
                            v121 = (void *)[v120 copy];
                            -[GEOPDComponentValue setHikeGeometry:]((uint64_t)v119, v121);

                            v122 = -[GEOPDComponent values]((id *)&v60->super.super.isa);
                            [v122 addObject:v119];
                          }
                          if (v60)
                          {
                            int v123 = *(_DWORD *)(v57 + 92);
                            *(_WORD *)&v60->_flags |= 0x100u;
                            v60->_valuesAvailable = v123;
                          }
                        }
                        uint64_t v115 = [(id)v66 countByEnumeratingWithState:&v278 objects:v331 count:16];
                      }
                      while (v115);
                      goto LABEL_242;
                    default:
                      if (v64 == 50)
                      {
                        long long v296 = 0u;
                        long long v297 = 0u;
                        long long v294 = 0u;
                        long long v295 = 0u;
                        uint64_t v66 = -[GEOPDComponent values]((id *)v57);
                        uint64_t v204 = [(id)v66 countByEnumeratingWithState:&v294 objects:v335 count:16];
                        if (!v204) {
                          break;
                        }
                        uint64_t v205 = v204;
                        uint64_t v206 = *(void *)v295;
                        do
                        {
                          for (uint64_t i3 = 0; i3 != v205; ++i3)
                          {
                            if (*(void *)v295 != v206) {
                              objc_enumerationMutation((id)v66);
                            }
                            uint64_t v208 = *(void *)(*((void *)&v294 + 1) + 8 * i3);
                            if (v208 && *(void *)(v208 + 152))
                            {
                              v209 = objc_alloc_init(GEOPDComponentValue);
                              v210 = -[GEOPDComponentValue containedPlace]((id *)v208);
                              v211 = (void *)[v210 copy];
                              -[GEOPDComponentValue setContainedPlace:]((uint64_t)v209, v211);

                              v212 = -[GEOPDComponent values]((id *)&v60->super.super.isa);
                              [v212 addObject:v209];
                            }
                            if (v60)
                            {
                              int v213 = *(_DWORD *)(v57 + 92);
                              *(_WORD *)&v60->_flags |= 0x100u;
                              v60->_valuesAvailable = v213;
                            }
                          }
                          uint64_t v205 = [(id)v66 countByEnumeratingWithState:&v294 objects:v335 count:16];
                        }
                        while (v205);
                        goto LABEL_242;
                      }
                      if (v64 != 92) {
                        goto LABEL_267;
                      }
                      long long v292 = 0u;
                      long long v293 = 0u;
                      long long v290 = 0u;
                      long long v291 = 0u;
                      uint64_t v66 = -[GEOPDComponent values]((id *)v57);
                      uint64_t v83 = [(id)v66 countByEnumeratingWithState:&v290 objects:v334 count:16];
                      if (v83)
                      {
                        uint64_t v84 = v83;
                        uint64_t v85 = *(void *)v291;
                        do
                        {
                          for (uint64_t i4 = 0; i4 != v84; ++i4)
                          {
                            if (*(void *)v291 != v85) {
                              objc_enumerationMutation((id)v66);
                            }
                            uint64_t v87 = *(void *)(*((void *)&v290 + 1) + 8 * i4);
                            if (v87 && *(void *)(v87 + 104))
                            {
                              v88 = objc_alloc_init(GEOPDComponentValue);
                              v89 = -[GEOPDComponentValue businessAssets]((id *)v87);
                              v90 = (void *)[v89 copy];
                              -[GEOPDComponentValue setBusinessAssets:]((uint64_t)v88, v90);

                              v91 = -[GEOPDComponent values]((id *)&v60->super.super.isa);
                              [v91 addObject:v88];
                            }
                            if (v60)
                            {
                              int v92 = *(_DWORD *)(v57 + 92);
                              *(_WORD *)&v60->_flags |= 0x100u;
                              v60->_valuesAvailable = v92;
                            }
                          }
                          uint64_t v84 = [(id)v66 countByEnumeratingWithState:&v290 objects:v334 count:16];
                        }
                        while (v84);
                        goto LABEL_242;
                      }
                      break;
                  }
                }
LABEL_243:
                v55 = v270;
LABEL_244:

                v214 = -[GEOPDComponent values]((id *)&v60->super.super.isa);
                uint64_t v215 = [v214 count];

                if (v215)
                {
                  if (*(void *)(v57 + 16))
                  {
                    v216 = -[GEOPDComponent attribution]((id *)v57);
                    v217 = (void *)[v216 copy];
                    -[GEOPDComponent setAttribution:]((uint64_t)v60, v217);
                  }
                  if ((*(_WORD *)(v57 + 100) & 2) != 0 && v60)
                  {
                    int v218 = *(_DWORD *)(v57 + 64);
                    *(_WORD *)&v60->_flags |= 2u;
                    v60->_cacheControl = v218;
                  }
                  if (*(void *)(v57 + 32))
                  {
                    v219 = -[GEOPDComponent source]((id *)v57);
                    v220 = (void *)[v219 copy];
                    -[GEOPDComponent setSource:]((uint64_t)v60, v220);
                  }
                  __int16 v221 = *(_WORD *)(v57 + 100);
                  if ((v221 & 0x20) != 0)
                  {
                    if (v60)
                    {
                      int v222 = *(_DWORD *)(v57 + 80);
                      *(_WORD *)&v60->_flags |= 0x20u;
                      v60->_status = v222;
                      __int16 v221 = *(_WORD *)(v57 + 100);
                      goto LABEL_255;
                    }
                  }
                  else
                  {
LABEL_255:
                    BOOL v223 = v60 == 0;
                    if ((v221 & 0x40) != 0 && v60)
                    {
                      unsigned int v224 = *(_DWORD *)(v57 + 84);
                      *(_WORD *)&v60->_flags |= 0x40u;
                      v60->_ttl = v224;
                      __int16 v221 = *(_WORD *)(v57 + 100);
                    }
                    if ((v221 & 0x80) != 0)
                    {
                      if (!v60) {
                        goto LABEL_264;
                      }
                      BOOL v223 = 0;
                      int v225 = *(_DWORD *)(v57 + 88);
                      *(_WORD *)&v60->_flags |= 0x80u;
                      v60->_type = v225;
                      __int16 v221 = *(_WORD *)(v57 + 100);
                    }
                    if ((v221 & 0x200) != 0 && !v223)
                    {
                      unsigned int v226 = *(_DWORD *)(v57 + 96);
                      *(_WORD *)&v60->_flags |= 0x200u;
                      v60->_versiouint64_t n = v226;
                    }
                  }
LABEL_264:
                  v227 = -[GEOPDComponent versionDomains]((id *)v57);
                  uint64_t v228 = [v227 count];

                  if (v228)
                  {
                    v229 = -[GEOPDComponent versionDomains]((id *)v57);
                    v230 = (void *)[v229 copy];
                    -[GEOPDComponent setVersionDomains:]((uint64_t)v60, v230);
                  }
                  v231 = [(GEOMapItemStorage *)v10 placeData];
                  v232 = [v231 components];
                  [v232 addObject:v60];
                }
              }
LABEL_267:

              uint64_t i = v273;
              continue;
            }
          }
          uint64_t v272 = [v55 countByEnumeratingWithState:&v326 objects:v343 count:16];
          if (!v272)
          {
LABEL_270:

            uint64_t v8 = v267;
            id v6 = v268;
            a4 = v266;
            break;
          }
        }
      }
    }
    if ([v8 hasPlace])
    {
      v233 = [v8 place];
      v234 = __72__GEOMapItemStorage_GEOMapItem__mapItemStorageForGEOMapItem_forUseType___block_invoke(v233);
      [(GEOMapItemStorage *)v10 setPlace:v234];
    }
    if ([v8 hasClientAttributes])
    {
      v235 = objc_alloc_init(GEOMapItemClientAttributes);
      [(GEOMapItemStorage *)v10 setClientAttributes:v235];

      v236 = [v8 clientAttributes];
      v237 = v236;
      if (a4 == 2)
      {
        int v238 = [v236 hasCorrectedLocationAttributes];

        if (v238)
        {
          unint64_t v239 = 2;
          v240 = [v8 clientAttributes];
          [v240 correctedLocationAttributes];
          v242 = v241 = v10;
          v243 = (void *)[v242 copy];
          v244 = [(GEOMapItemStorage *)v241 clientAttributes];
          [v244 setCorrectedLocationAttributes:v243];
LABEL_279:

          int v10 = v269;
          a4 = v239;
        }
      }
      else
      {
        int v245 = [v236 hasAddressBookAttributes];

        if (v245)
        {
          unint64_t v239 = a4;
          v240 = [v8 clientAttributes];
          [v240 addressBookAttributes];
          v242 = v246 = v10;
          v243 = (void *)[v242 copy];
          v244 = [(GEOMapItemStorage *)v246 clientAttributes];
          [v244 setAddressBookAttributes:v243];
          goto LABEL_279;
        }
      }
    }
    if ([v8 hasPlaceResult])
    {
      v247 = objc_alloc_init(GEOPlaceResult);
      [(GEOMapItemStorage *)v10 setPlaceResult:v247];

      v248 = [v8 placeResult];
      int v249 = [v248 hasFlyoverTourMuid];

      if (v249)
      {
        v250 = [v8 placeResult];
        uint64_t v251 = [v250 flyoverTourMuid];
        v252 = [(GEOMapItemStorage *)v10 placeResult];
        [v252 setFlyoverTourMuid:v251];
      }
      v253 = [v8 placeResult];
      int v254 = [v253 hasCacheControl];

      if (v254)
      {
        v255 = [v8 placeResult];
        uint64_t v256 = [v255 cacheControl];
        v257 = [(GEOMapItemStorage *)v10 placeResult];
        [v257 setCacheControl:v256];
      }
      v258 = [v8 placeResult];
      v259 = [v258 place];
      v260 = __72__GEOMapItemStorage_GEOMapItem__mapItemStorageForGEOMapItem_forUseType___block_invoke(v259);
      v261 = [(GEOMapItemStorage *)v10 placeResult];
      [v261 setPlace:v260];

      int v10 = v269;
    }
    if ([v8 hasMapsURL])
    {
      v262 = [v8 mapsURL];
      v263 = (void *)[v262 copy];
      [(GEOMapItemStorage *)v10 setMapsURL:v263];
    }
    if (a4 != 2 && [v8 hasUserValues])
    {
      v264 = [v8 userValues];
      v265 = (void *)[v264 copy];
      [(GEOMapItemStorage *)v10 setUserValues:v265];
    }
    goto LABEL_5;
  }
  int v10 = 0;
LABEL_7:

  return v10;
}

GEOPlace *__72__GEOMapItemStorage_GEOMapItem__mapItemStorageForGEOMapItem_forUseType___block_invoke(void *a1)
{
  uint64_t v53 = *MEMORY[0x1E4F143B8];
  id v1 = a1;
  id v2 = objc_alloc_init(GEOPlace);
  if ([v1 hasArea])
  {
    [v1 area];
    -[GEOPlace setArea:](v2, "setArea:");
  }
  if ([v1 hasAddress])
  {
    double v3 = [v1 address];
    id v4 = (void *)[v3 copy];
    [(GEOPlace *)v2 setAddress:v4];
  }
  if ([v1 hasCenter])
  {
    double v5 = [v1 center];
    id v6 = (void *)[v5 copy];
    [(GEOPlace *)v2 setCenter:v6];
  }
  if ([v1 hasDisplayMapRegion])
  {
    uint64_t v7 = [v1 displayMapRegion];
    uint64_t v8 = (void *)[v7 copy];
    [(GEOPlace *)v2 setDisplayMapRegion:v8];
  }
  if ([v1 hasMapRegion])
  {
    uint64_t v9 = [v1 mapRegion];
    int v10 = (void *)[v9 copy];
    [(GEOPlace *)v2 setMapRegion:v10];
  }
  if ([v1 hasName])
  {
    double v11 = [v1 name];
    long long v12 = (void *)[v11 copy];
    [(GEOPlace *)v2 setName:v12];
  }
  if ([v1 hasTimezone])
  {
    long long v13 = [v1 timezone];
    int v14 = (void *)[v13 copy];
    [(GEOPlace *)v2 setTimezone:v14];
  }
  if ([v1 hasType]) {
    -[GEOPlace setType:](v2, "setType:", [v1 type]);
  }
  if ([v1 hasIsDisputed]) {
    -[GEOPlace setIsDisputed:](v2, "setIsDisputed:", [v1 isDisputed]);
  }
  long long v15 = [v1 business];
  uint64_t v16 = [v15 count];

  if (v16)
  {
    uint64_t v17 = (void *)MEMORY[0x1E4F1CA48];
    id v18 = [v1 business];
    int v19 = objc_msgSend(v17, "arrayWithCapacity:", objc_msgSend(v18, "count"));
    [(GEOPlace *)v2 setBusiness:v19];

    long long v50 = 0u;
    long long v51 = 0u;
    long long v48 = 0u;
    long long v49 = 0u;
    id v47 = v1;
    uint64_t v20 = [v1 business];
    uint64_t v21 = [v20 countByEnumeratingWithState:&v48 objects:v52 count:16];
    if (v21)
    {
      uint64_t v22 = v21;
      uint64_t v23 = *(void *)v49;
      do
      {
        for (uint64_t i = 0; i != v22; ++i)
        {
          if (*(void *)v49 != v23) {
            objc_enumerationMutation(v20);
          }
          uint64_t v25 = *(void **)(*((void *)&v48 + 1) + 8 * i);
          objc_super v26 = objc_alloc_init(GEOBusiness);
          if ([v25 hasUID]) {
            -[GEOBusiness setUID:](v26, "setUID:", [v25 uID]);
          }
          uint64_t v27 = [v25 categorys];
          uint64_t v28 = [v27 count];

          if (v28)
          {
            v29 = [v25 categorys];
            long long v30 = (void *)[v29 copy];
            [(GEOBusiness *)v26 setCategorys:v30];
          }
          if ([v25 hasCenter])
          {
            int v31 = [v25 center];
            long long v32 = (void *)[v31 copy];
            [(GEOBusiness *)v26 setCenter:v32];
          }
          if ([v25 hasMapsURL])
          {
            uint64_t v33 = [v25 mapsURL];
            v34 = (void *)[v33 copy];
            [(GEOBusiness *)v26 setMapsURL:v34];
          }
          if ([v25 hasName])
          {
            uint64_t v35 = [v25 name];
            int v36 = (void *)[v35 copy];
            [(GEOBusiness *)v26 setName:v36];
          }
          v37 = [v25 openHours];
          uint64_t v38 = [v37 count];

          if (v38)
          {
            v39 = [v25 openHours];
            v40 = (void *)[v39 copy];
            [(GEOBusiness *)v26 setOpenHours:v40];
          }
          if ([v25 hasTelephone])
          {
            int v41 = [v25 telephone];
            v42 = (void *)[v41 copy];
            [(GEOBusiness *)v26 setTelephone:v42];
          }
          if ([v25 hasURL])
          {
            uint64_t v43 = [v25 uRL];
            v44 = (void *)[v43 copy];
            [(GEOBusiness *)v26 setURL:v44];
          }
          if ([v25 hasIsClosed]) {
            -[GEOBusiness setIsClosed:](v26, "setIsClosed:", [v25 isClosed]);
          }
          v45 = [(GEOPlace *)v2 business];
          [v45 addObject:v26];
        }
        uint64_t v22 = [v20 countByEnumeratingWithState:&v48 objects:v52 count:16];
      }
      while (v22);
    }

    id v1 = v47;
  }

  return v2;
}

+ (id)mapItemStorageForMapsSync:(id)a3 forUseType:(unint64_t)a4
{
  uint64_t v171 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if ([v5 isValid])
  {
    id v6 = objc_alloc_init(GEOMapItemStorage);
    uint64_t v7 = [a1 mapItemStorageForGEOMapItem:v5];
    v156 = v6;
    if ([v7 hasPlaceData])
    {
      uint64_t v8 = objc_alloc_init(GEOPDPlace);
      [(GEOMapItemStorage *)v6 setPlaceData:v8];

      uint64_t v9 = [v7 placeData];
      int v10 = [v9 hasMuid];

      if (v10)
      {
        double v11 = [v7 placeData];
        uint64_t v12 = [v11 muid];
        long long v13 = [(GEOMapItemStorage *)v156 placeData];
        [v13 setMuid:v12];
      }
      int v14 = [v7 placeData];
      int v15 = [v14 hasPreferredMuid];

      if (v15)
      {
        uint64_t v16 = [v7 placeData];
        uint64_t v17 = [v16 preferredMuid];
        id v18 = [(GEOMapItemStorage *)v156 placeData];
        [v18 setPreferredMuid:v17];
      }
      int v19 = [v7 placeData];
      int v20 = [v19 hasMapsId];

      if (v20)
      {
        uint64_t v21 = [v7 placeData];
        uint64_t v22 = [v21 mapsId];
        uint64_t v23 = (void *)[v22 copy];
        int v24 = [(GEOMapItemStorage *)v156 placeData];
        [v24 setMapsId:v23];
      }
      uint64_t v25 = [v7 placeData];
      int v26 = [v25 hasReferenceFrame];

      if (v26)
      {
        uint64_t v27 = [v7 placeData];
        uint64_t v28 = [v27 referenceFrame];
        v29 = [(GEOMapItemStorage *)v156 placeData];
        [v29 setReferenceFrame:v28];
      }
      long long v30 = [v7 placeData];
      int v31 = [v30 hasResultProviderId];

      if (v31)
      {
        long long v32 = [v7 placeData];
        uint64_t v33 = [v32 resultProviderId];
        v34 = [(GEOMapItemStorage *)v156 placeData];
        [v34 setResultProviderId:v33];
      }
      uint64_t v35 = [v7 placeData];
      int v36 = [v35 hasStatus];

      if (v36)
      {
        v37 = [v7 placeData];
        uint64_t v38 = [v37 status];
        v39 = [(GEOMapItemStorage *)v156 placeData];
        [v39 setStatus:v38];
      }
      v40 = [v7 placeData];
      int v41 = [v40 hasPlaceLayoutData];

      if (v41)
      {
        v42 = [v7 placeData];
        uint64_t v43 = [v42 placeLayoutData];
        v44 = [(GEOMapItemStorage *)v156 placeData];
        [v44 setPlaceLayoutData:v43];
      }
      v45 = [v7 placeData];
      v46 = [v45 components];
      uint64_t v47 = [v46 count];

      id v6 = v156;
      if (v47)
      {
        id v154 = v5;
        long long v48 = (void *)MEMORY[0x1E4F1CA48];
        long long v49 = [v7 placeData];
        long long v50 = [v49 components];
        long long v51 = objc_msgSend(v48, "arrayWithCapacity:", objc_msgSend(v50, "count"));
        v52 = [(GEOMapItemStorage *)v156 placeData];
        [v52 setComponents:v51];

        id v6 = v156;
        long long v167 = 0u;
        long long v168 = 0u;
        long long v165 = 0u;
        long long v166 = 0u;
        uint64_t v153 = v7;
        uint64_t v53 = [v7 placeData];
        v54 = [v53 components];

        obuint64_t j = v54;
        uint64_t v55 = [v54 countByEnumeratingWithState:&v165 objects:v170 count:16];
        unint64_t v56 = a4;
        uint64_t v159 = v55;
        if (!v55) {
          goto LABEL_136;
        }
        uint64_t v158 = *(void *)v166;
        while (1)
        {
          uint64_t v57 = 0;
          do
          {
            if (*(void *)v166 != v158) {
              objc_enumerationMutation(obj);
            }
            uint64_t v58 = *(void *)(*((void *)&v165 + 1) + 8 * v57);
            uint64_t v59 = -[GEOPDComponent values]((id *)v58);
            uint64_t v60 = [v59 count];

            if (v60)
            {
              uint64_t v160 = v57;
              v61 = objc_alloc_init(GEOPDComponent);
              v62 = (void *)MEMORY[0x1E4F1CA48];
              v63 = -[GEOPDComponent values]((id *)v58);
              int v64 = objc_msgSend(v62, "arrayWithCapacity:", objc_msgSend(v63, "count"));
              -[GEOPDComponent setValues:]((uint64_t)v61, v64);

              if (!v58 || (*(_WORD *)(v58 + 100) & 0x80) == 0) {
                goto LABEL_133;
              }
              int v65 = *(_DWORD *)(v58 + 88);
              if (v65 > 47)
              {
                if (v65 <= 82)
                {
                  switch(v65)
                  {
                    case '0':
                      if (v56 == 5)
                      {
                        uint64_t v94 = -[GEOPDComponent values]((id *)v58);
                        uint64_t v67 = [v94 firstObject];

                        if (v67 && *(void *)(v67 + 752))
                        {
                          v68 = objc_alloc_init(GEOPDComponentValue);
                          v69 = -[GEOPDComponentValue venueInfo]((id *)v67);
                          uint64_t v70 = (void *)[v69 copy];
                          -[GEOPDComponentValue setVenueInfo:]((uint64_t)v68, v70);
                          goto LABEL_105;
                        }
                        goto LABEL_109;
                      }
                      goto LABEL_110;
                    case '@':
                      uint64_t v95 = -[GEOPDComponent values]((id *)v58);
                      uint64_t v67 = [v95 firstObject];

                      if (v67 && *(void *)(v67 + 120))
                      {
                        v68 = objc_alloc_init(GEOPDComponentValue);
                        v69 = -[GEOPDComponentValue businessHours]((id *)v67);
                        uint64_t v70 = (void *)[v69 copy];
                        -[GEOPDComponentValue setBusinessHours:]((uint64_t)v68, v70);
                        goto LABEL_105;
                      }
                      goto LABEL_109;
                    case 'M':
                      v73 = -[GEOPDComponent values]((id *)v58);
                      uint64_t v67 = [v73 firstObject];

                      if (v67 && *(void *)(v67 + 312))
                      {
                        v68 = objc_alloc_init(GEOPDComponentValue);
                        v69 = -[GEOPDComponentValue iso3166Code]((id *)v67);
                        uint64_t v70 = (void *)[v69 copy];
                        -[GEOPDComponentValue setIso3166Code:]((uint64_t)v68, v70);
                        goto LABEL_105;
                      }
                      goto LABEL_109;
                  }
                  goto LABEL_133;
                }
                if (v65 > 104)
                {
                  if (v65 == 105)
                  {
                    uint64_t v96 = -[GEOPDComponent values]((id *)v58);
                    uint64_t v67 = [v96 firstObject];

                    if (v67 && *(void *)(v67 + 288))
                    {
                      v68 = objc_alloc_init(GEOPDComponentValue);
                      v69 = -[GEOPDComponentValue hikeSummary]((id *)v67);
                      uint64_t v70 = (void *)[v69 copy];
                      -[GEOPDComponentValue setHikeSummary:]((uint64_t)v68, v70);
                      goto LABEL_105;
                    }
                    goto LABEL_109;
                  }
                  if (v65 == 106)
                  {
                    uint64_t v74 = -[GEOPDComponent values]((id *)v58);
                    uint64_t v67 = [v74 firstObject];

                    if (v67 && *(void *)(v67 + 280))
                    {
                      v68 = objc_alloc_init(GEOPDComponentValue);
                      v69 = -[GEOPDComponentValue hikeGeometry]((id *)v67);
                      uint64_t v70 = (void *)[v69 copy];
                      -[GEOPDComponentValue setHikeGeometry:]((uint64_t)v68, v70);
                      goto LABEL_105;
                    }
                    goto LABEL_109;
                  }
                  goto LABEL_133;
                }
                if (v65 != 83)
                {
                  if (v65 == 104)
                  {
                    uint64_t v71 = -[GEOPDComponent values]((id *)v58);
                    uint64_t v67 = [v71 firstObject];

                    if (v67 && *(void *)(v67 + 272))
                    {
                      v68 = objc_alloc_init(GEOPDComponentValue);
                      v69 = -[GEOPDComponentValue hikeAssociatedInfo]((id *)v67);
                      uint64_t v70 = (void *)[v69 copy];
                      -[GEOPDComponentValue setHikeAssociatedInfo:]((uint64_t)v68, v70);
                      goto LABEL_105;
                    }
                    goto LABEL_109;
                  }
                  goto LABEL_133;
                }
                v90 = -[GEOPDComponent values]((id *)v58);
                uint64_t v67 = [v90 firstObject];

                if (!v67 || !*(void *)(v67 + 160)) {
                  goto LABEL_109;
                }
                v68 = objc_alloc_init(GEOPDComponentValue);
                v69 = -[GEOPDComponentValue containmentPlace]((id *)v67);
                v91 = (void *)[v69 copy];
                -[GEOPDComponentValue setContainmentPlace:]((uint64_t)v68, v91);
              }
              else
              {
                if (v65 > 14)
                {
                  switch(v65)
                  {
                    case 15:
                      uint64_t v66 = -[GEOPDComponent values]((id *)v58);
                      uint64_t v67 = [v66 firstObject];

                      if (!v67 || !*(void *)(v67 + 64)) {
                        goto LABEL_109;
                      }
                      v68 = objc_alloc_init(GEOPDComponentValue);
                      v69 = -[GEOPDComponentValue amenities]((id *)v67);
                      uint64_t v70 = (void *)[v69 copy];
                      -[GEOPDComponentValue setAmenities:]((uint64_t)v68, v70);
                      break;
                    case 16:
                      long long v163 = 0u;
                      long long v164 = 0u;
                      long long v161 = 0u;
                      long long v162 = 0u;
                      uint64_t v67 = -[GEOPDComponent values]((id *)v58);
                      uint64_t v75 = [(id)v67 countByEnumeratingWithState:&v161 objects:v169 count:16];
                      if (v75)
                      {
                        uint64_t v76 = v75;
                        uint64_t v77 = *(void *)v162;
                        do
                        {
                          for (uint64_t i = 0; i != v76; ++i)
                          {
                            if (*(void *)v162 != v77) {
                              objc_enumerationMutation((id)v67);
                            }
                            uint64_t v79 = *(void *)(*((void *)&v161 + 1) + 8 * i);
                            if (v79 && *(void *)(v79 + 592))
                            {
                              v80 = objc_alloc_init(GEOPDComponentValue);
                              v81 = -[GEOPDComponentValue styleAttributes]((id *)v79);
                              v82 = (void *)[v81 copy];
                              -[GEOPDComponentValue setStyleAttributes:]((uint64_t)v80, v82);

                              uint64_t v83 = -[GEOPDComponent values]((id *)&v61->super.super.isa);
                              [v83 addObject:v80];
                            }
                            if (v61)
                            {
                              int v84 = *(_DWORD *)(v58 + 92);
                              *(_WORD *)&v61->_flags |= 0x100u;
                              v61->_valuesAvailable = v84;
                            }
                          }
                          uint64_t v76 = [(id)v67 countByEnumeratingWithState:&v161 objects:v169 count:16];
                        }
                        while (v76);
                        unint64_t v56 = a4;
                        id v6 = v156;
                      }
                      goto LABEL_109;
                    case 22:
                      uint64_t v85 = -[GEOPDComponent values]((id *)v58);
                      uint64_t v67 = [v85 firstObject];

                      if (!v67 || !*(void *)(v67 + 616)) {
                        goto LABEL_109;
                      }
                      v68 = objc_alloc_init(GEOPDComponentValue);
                      v69 = -[GEOPDComponentValue textBlock]((id *)v67);
                      uint64_t v70 = (void *)[v69 copy];
                      -[GEOPDComponentValue setTextBlock:]((uint64_t)v68, v70);
                      break;
                    case 23:
                      v86 = -[GEOPDComponent values]((id *)v58);
                      uint64_t v67 = [v86 firstObject];

                      if (!v67 || !*(void *)(v67 + 232)) {
                        goto LABEL_109;
                      }
                      v68 = objc_alloc_init(GEOPDComponentValue);
                      v69 = -[GEOPDComponentValue factoid]((id *)v67);
                      uint64_t v70 = (void *)[v69 copy];
                      -[GEOPDComponentValue setFactoid:]((uint64_t)v68, v70);
                      break;
                    case 26:
                      if (v56 != 6) {
                        goto LABEL_110;
                      }
                      uint64_t v87 = -[GEOPDComponent values]((id *)v58);
                      uint64_t v67 = [v87 firstObject];

                      if (!v67 || !*(void *)(v67 + 128)) {
                        goto LABEL_109;
                      }
                      v68 = objc_alloc_init(GEOPDComponentValue);
                      v69 = -[GEOPDComponentValue captionedPhoto]((id *)v67);
                      uint64_t v70 = (void *)[v69 copy];
                      -[GEOPDComponentValue setCaptionedPhoto:]((uint64_t)v68, v70);
                      break;
                    case 30:
                      v88 = -[GEOPDComponent values]((id *)v58);
                      uint64_t v67 = [v88 firstObject];

                      if (!v67 || !*(void *)(v67 + 528)) {
                        goto LABEL_109;
                      }
                      v68 = objc_alloc_init(GEOPDComponentValue);
                      v69 = -[GEOPDComponentValue resultSnippet]((id *)v67);
                      uint64_t v70 = (void *)[v69 copy];
                      -[GEOPDComponentValue setResultSnippet:]((uint64_t)v68, v70);
                      break;
                    case 31:
                      v89 = -[GEOPDComponent values]((id *)v58);
                      uint64_t v67 = [v89 firstObject];

                      if (!v67 || !*(void *)(v67 + 40)) {
                        goto LABEL_109;
                      }
                      v68 = objc_alloc_init(GEOPDComponentValue);
                      v69 = -[GEOPDComponentValue addressObject]((id *)v67);
                      uint64_t v70 = (void *)[v69 copy];
                      -[GEOPDComponentValue setAddressObject:]((uint64_t)v68, v70);
                      break;
                    default:
                      goto LABEL_133;
                  }
LABEL_105:

LABEL_106:
                  v97 = -[GEOPDComponent values]((id *)&v61->super.super.isa);
                  [v97 addObject:v68];

                  if (v61)
                  {
                    int v98 = *(_DWORD *)(v58 + 92);
                    *(_WORD *)&v61->_flags |= 0x100u;
                    v61->_valuesAvailable = v98;
                  }

LABEL_109:
LABEL_110:
                  v99 = -[GEOPDComponent values]((id *)&v61->super.super.isa);
                  uint64_t v100 = [v99 count];

                  if (v100)
                  {
                    if (*(void *)(v58 + 16))
                    {
                      v101 = -[GEOPDComponent attribution]((id *)v58);
                      v102 = (void *)[v101 copy];
                      -[GEOPDComponent setAttribution:]((uint64_t)v61, v102);
                    }
                    if ((*(_WORD *)(v58 + 100) & 2) != 0 && v61)
                    {
                      int v103 = *(_DWORD *)(v58 + 64);
                      *(_WORD *)&v61->_flags |= 2u;
                      v61->_cacheControl = v103;
                    }
                    if (*(void *)(v58 + 32))
                    {
                      uint64_t v104 = -[GEOPDComponent source]((id *)v58);
                      uint64_t v105 = (void *)[v104 copy];
                      -[GEOPDComponent setSource:]((uint64_t)v61, v105);
                    }
                    __int16 v106 = *(_WORD *)(v58 + 100);
                    if ((v106 & 0x20) != 0)
                    {
                      if (v61)
                      {
                        int v107 = *(_DWORD *)(v58 + 80);
                        *(_WORD *)&v61->_flags |= 0x20u;
                        v61->_status = v107;
                        __int16 v106 = *(_WORD *)(v58 + 100);
                        goto LABEL_121;
                      }
                    }
                    else
                    {
LABEL_121:
                      BOOL v108 = v61 == 0;
                      if ((v106 & 0x40) != 0 && v61)
                      {
                        unsigned int v109 = *(_DWORD *)(v58 + 84);
                        *(_WORD *)&v61->_flags |= 0x40u;
                        v61->_ttl = v109;
                        __int16 v106 = *(_WORD *)(v58 + 100);
                      }
                      if ((v106 & 0x80) != 0)
                      {
                        if (!v61) {
                          goto LABEL_130;
                        }
                        BOOL v108 = 0;
                        int v110 = *(_DWORD *)(v58 + 88);
                        *(_WORD *)&v61->_flags |= 0x80u;
                        v61->_type = v110;
                        __int16 v106 = *(_WORD *)(v58 + 100);
                      }
                      if ((v106 & 0x200) != 0 && !v108)
                      {
                        unsigned int v111 = *(_DWORD *)(v58 + 96);
                        *(_WORD *)&v61->_flags |= 0x200u;
                        v61->_versiouint64_t n = v111;
                      }
                    }
LABEL_130:
                    v112 = -[GEOPDComponent versionDomains]((id *)v58);
                    uint64_t v113 = [v112 count];

                    if (v113)
                    {
                      uint64_t v114 = -[GEOPDComponent versionDomains]((id *)v58);
                      uint64_t v115 = (void *)[v114 copy];
                      -[GEOPDComponent setVersionDomains:]((uint64_t)v61, v115);
                    }
                    [(GEOPDComponent *)v61 setTimestampFirstSeen:0.0];
                    uint64_t v116 = [(GEOMapItemStorage *)v6 placeData];
                    v117 = [v116 components];
                    [v117 addObject:v61];
                  }
LABEL_133:

                  uint64_t v57 = v160;
                  goto LABEL_134;
                }
                if (v65 == 1)
                {
                  int v92 = -[GEOPDComponent values]((id *)v58);
                  uint64_t v67 = [v92 firstObject];

                  if (v67 && *(void *)(v67 + 192))
                  {
                    v68 = objc_alloc_init(GEOPDComponentValue);
                    v69 = -[GEOPDComponentValue entity]((id *)v67);
                    uint64_t v70 = (void *)[v69 copy];
                    -[GEOPDComponentValue setEntity:]((uint64_t)v68, v70);
                    goto LABEL_105;
                  }
                  goto LABEL_109;
                }
                if (v65 != 2)
                {
                  if (v65 == 4)
                  {
                    uint64_t v72 = -[GEOPDComponent values]((id *)v58);
                    uint64_t v67 = [v72 firstObject];

                    if (v67 && *(void *)(v67 + 88))
                    {
                      v68 = objc_alloc_init(GEOPDComponentValue);
                      v69 = -[GEOPDComponentValue bounds]((id *)v67);
                      uint64_t v70 = (void *)[v69 copy];
                      -[GEOPDComponentValue setBounds:]((uint64_t)v68, v70);
                      goto LABEL_105;
                    }
                    goto LABEL_109;
                  }
                  goto LABEL_133;
                }
                v93 = -[GEOPDComponent values]((id *)v58);
                uint64_t v67 = [v93 firstObject];

                if (!v67 || !*(void *)(v67 + 400)) {
                  goto LABEL_109;
                }
                v68 = objc_alloc_init(GEOPDComponentValue);
                v69 = -[GEOPDComponentValue placeInfo]((id *)v67);
                v91 = (void *)[v69 copy];
                -[GEOPDComponentValue setPlaceInfo:]((uint64_t)v68, v91);
              }

              goto LABEL_106;
            }
LABEL_134:
            ++v57;
          }
          while (v57 != v159);
          uint64_t v159 = [obj countByEnumeratingWithState:&v165 objects:v170 count:16];
          if (!v159)
          {
LABEL_136:

            uint64_t v7 = v153;
            id v5 = v154;
            break;
          }
        }
      }
    }
    if ([v7 hasPlace])
    {
      uint64_t v118 = [v7 place];
      v119 = __70__GEOMapItemStorage_GEOMapItem__mapItemStorageForMapsSync_forUseType___block_invoke(v118);
      [(GEOMapItemStorage *)v6 setPlace:v119];
    }
    if ([v7 hasClientAttributes])
    {
      v120 = objc_alloc_init(GEOMapItemClientAttributes);
      [(GEOMapItemStorage *)v6 setClientAttributes:v120];

      v121 = [v7 clientAttributes];
      int v122 = [v121 hasAddressBookAttributes];

      if (v122)
      {
        int v123 = [v7 clientAttributes];
        uint64_t v124 = [v123 addressBookAttributes];
        uint64_t v125 = (void *)[v124 copy];
        uint64_t v126 = [(GEOMapItemStorage *)v6 clientAttributes];
        [v126 setAddressBookAttributes:v125];

        id v6 = v156;
      }
      v127 = [v7 clientAttributes];
      int v128 = [v127 hasCorrectedLocationAttributes];

      if (v128)
      {
        v129 = [v7 clientAttributes];
        v130 = [v129 correctedLocationAttributes];
        v131 = (void *)[v130 copy];
        v132 = [(GEOMapItemStorage *)v6 clientAttributes];
        [v132 setCorrectedLocationAttributes:v131];

        id v6 = v156;
      }
    }
    if ([v7 hasPlaceResult])
    {
      int v133 = objc_alloc_init(GEOPlaceResult);
      [(GEOMapItemStorage *)v6 setPlaceResult:v133];

      v134 = [v7 placeResult];
      int v135 = [v134 hasFlyoverTourMuid];

      if (v135)
      {
        uint64_t v136 = [v7 placeResult];
        uint64_t v137 = [v136 flyoverTourMuid];
        v138 = [(GEOMapItemStorage *)v6 placeResult];
        [v138 setFlyoverTourMuid:v137];
      }
      uint64_t v139 = [v7 placeResult];
      int v140 = [v139 hasCacheControl];

      if (v140)
      {
        v141 = [v7 placeResult];
        uint64_t v142 = [v141 cacheControl];
        v143 = [(GEOMapItemStorage *)v6 placeResult];
        [v143 setCacheControl:v142];
      }
      int v144 = [v7 placeResult];
      v145 = [v144 place];
      v146 = __70__GEOMapItemStorage_GEOMapItem__mapItemStorageForMapsSync_forUseType___block_invoke(v145);
      v147 = [(GEOMapItemStorage *)v6 placeResult];
      [v147 setPlace:v146];

      id v6 = v156;
    }
    if ([v7 hasMapsURL])
    {
      v148 = [v7 mapsURL];
      v149 = (void *)[v148 copy];
      [(GEOMapItemStorage *)v6 setMapsURL:v149];
    }
    if ([v7 hasUserValues])
    {
      v150 = [v7 userValues];
      uint64_t v151 = (void *)[v150 copy];
      [(GEOMapItemStorage *)v6 setUserValues:v151];
    }
  }
  else
  {
    id v6 = 0;
  }

  return v6;
}

GEOPlace *__70__GEOMapItemStorage_GEOMapItem__mapItemStorageForMapsSync_forUseType___block_invoke(void *a1)
{
  uint64_t v41 = *MEMORY[0x1E4F143B8];
  id v1 = a1;
  id v2 = objc_alloc_init(GEOPlace);
  if ([v1 hasArea])
  {
    [v1 area];
    -[GEOPlace setArea:](v2, "setArea:");
  }
  if ([v1 hasAddress])
  {
    double v3 = [v1 address];
    id v4 = (void *)[v3 copy];
    [(GEOPlace *)v2 setAddress:v4];
  }
  if ([v1 hasCenter])
  {
    id v5 = [v1 center];
    id v6 = (void *)[v5 copy];
    [(GEOPlace *)v2 setCenter:v6];
  }
  if ([v1 hasDisplayMapRegion])
  {
    uint64_t v7 = [v1 displayMapRegion];
    uint64_t v8 = (void *)[v7 copy];
    [(GEOPlace *)v2 setDisplayMapRegion:v8];
  }
  if ([v1 hasMapRegion])
  {
    uint64_t v9 = [v1 mapRegion];
    int v10 = (void *)[v9 copy];
    [(GEOPlace *)v2 setMapRegion:v10];
  }
  if ([v1 hasName])
  {
    double v11 = [v1 name];
    uint64_t v12 = (void *)[v11 copy];
    [(GEOPlace *)v2 setName:v12];
  }
  if ([v1 hasType]) {
    -[GEOPlace setType:](v2, "setType:", [v1 type]);
  }
  if ([v1 hasIsDisputed]) {
    -[GEOPlace setIsDisputed:](v2, "setIsDisputed:", [v1 isDisputed]);
  }
  long long v13 = [v1 business];
  uint64_t v14 = [v13 count];

  if (v14)
  {
    int v15 = (void *)MEMORY[0x1E4F1CA48];
    uint64_t v16 = [v1 business];
    uint64_t v17 = objc_msgSend(v15, "arrayWithCapacity:", objc_msgSend(v16, "count"));
    [(GEOPlace *)v2 setBusiness:v17];

    long long v38 = 0u;
    long long v39 = 0u;
    long long v36 = 0u;
    long long v37 = 0u;
    id v35 = v1;
    id v18 = [v1 business];
    uint64_t v19 = [v18 countByEnumeratingWithState:&v36 objects:v40 count:16];
    if (v19)
    {
      uint64_t v20 = v19;
      uint64_t v21 = *(void *)v37;
      do
      {
        for (uint64_t i = 0; i != v20; ++i)
        {
          if (*(void *)v37 != v21) {
            objc_enumerationMutation(v18);
          }
          uint64_t v23 = *(void **)(*((void *)&v36 + 1) + 8 * i);
          int v24 = objc_alloc_init(GEOBusiness);
          if ([v23 hasUID]) {
            -[GEOBusiness setUID:](v24, "setUID:", [v23 uID]);
          }
          uint64_t v25 = [v23 categorys];
          uint64_t v26 = [v25 count];

          if (v26)
          {
            uint64_t v27 = [v23 categorys];
            uint64_t v28 = (void *)[v27 copy];
            [(GEOBusiness *)v24 setCategorys:v28];
          }
          if ([v23 hasCenter])
          {
            v29 = [v23 center];
            long long v30 = (void *)[v29 copy];
            [(GEOBusiness *)v24 setCenter:v30];
          }
          if ([v23 hasName])
          {
            int v31 = [v23 name];
            long long v32 = (void *)[v31 copy];
            [(GEOBusiness *)v24 setName:v32];
          }
          uint64_t v33 = [(GEOPlace *)v2 business];
          [v33 addObject:v24];
        }
        uint64_t v20 = [v18 countByEnumeratingWithState:&v36 objects:v40 count:16];
      }
      while (v20);
    }

    id v1 = v35;
  }

  return v2;
}

+ (id)mapItemStorageForSerializedMapItemStorage:(id)a3
{
  id v3 = a3;
  id v4 = v3;
  if (!v3 || ![v3 length])
  {
    int v10 = 0;
    goto LABEL_10;
  }
  id v5 = [[GEOMapItemStorage alloc] initWithData:v4];
  id v6 = [(GEOMapItemStorage *)v5 placeData];

  if (v6)
  {
    uint64_t v7 = [(GEOMapItemStorage *)v5 placeData];
    uint64_t v8 = [(GEOMapItemStorage *)v5 userValues];
    uint64_t v9 = +[GEOMapItemStorage mapItemStorageForPlaceData:v7 detourInfo:0 userValues:v8];
  }
  else
  {
    double v11 = [(GEOMapItemStorage *)v5 place];

    if (!v11)
    {
      int v10 = 0;
      goto LABEL_9;
    }
    uint64_t v7 = [(GEOMapItemStorage *)v5 place];
    uint64_t v8 = [(GEOMapItemStorage *)v5 userValues];
    uint64_t v9 = +[GEOMapItemStorage mapItemStorageForPlace:v7 clientAttributes:0 userValues:v8];
  }
  int v10 = (void *)v9;

LABEL_9:
LABEL_10:

  return v10;
}

+ (id)mapItemStorageForSerializedPlaceData:(id)a3
{
  return (id)[a1 mapItemStorageForSerializedPlaceData:a3 serializedDetourInfo:0];
}

+ (id)mapItemStorageForSerializedPlaceData:(id)a3 serializedDetourInfo:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  if (v5 && [v5 length])
  {
    uint64_t v7 = [[GEOPDPlace alloc] initWithData:v5];
    if (v7)
    {
      if ([v6 length]) {
        uint64_t v8 = [[GEOPDResultDetourInfo alloc] initWithData:v6];
      }
      else {
        uint64_t v8 = 0;
      }
      uint64_t v9 = +[GEOMapItemStorage mapItemStorageForPlaceData:v7 detourInfo:v8];
    }
    else
    {
      uint64_t v9 = 0;
    }
  }
  else
  {
    uint64_t v9 = 0;
  }

  return v9;
}

+ (id)mapItemStorageForPlace:(id)a3 clientAttributes:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  uint64_t v7 = [[GEOMapItemStorage alloc] initWithPlace:v6 clientAttributes:v5 userValues:0];

  return v7;
}

+ (id)mapItemStorageForPlace:(id)a3 clientAttributes:(id)a4 userValues:(id)a5
{
  id v7 = a5;
  id v8 = a4;
  id v9 = a3;
  int v10 = [[GEOMapItemStorage alloc] initWithPlace:v9 clientAttributes:v8 userValues:v7];

  return v10;
}

+ (id)mapItemStorageForPlaceResult:(id)a3
{
  id v3 = a3;
  id v4 = [[GEOMapItemStorage alloc] initWithPlaceResult:v3];

  return v4;
}

+ (id)mapItemStorageForPlaceData:(id)a3
{
  id v3 = a3;
  id v4 = [[GEOMapItemStorage alloc] initWithPlaceData:v3 detourInfo:0 clientAttributes:0 userValues:0 additionalPlaceDatas:0];

  return v4;
}

+ (id)mapItemStorageForPlaceData:(id)a3 detourInfo:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  id v7 = [[GEOMapItemStorage alloc] initWithPlaceData:v6 detourInfo:v5 clientAttributes:0 userValues:0 additionalPlaceDatas:0];

  return v7;
}

+ (id)mapItemStorageForPlaceData:(id)a3 detourInfo:(id)a4 userValues:(id)a5
{
  id v7 = a5;
  id v8 = a4;
  id v9 = a3;
  int v10 = [[GEOMapItemStorage alloc] initWithPlaceData:v9 detourInfo:v8 clientAttributes:0 userValues:v7 additionalPlaceDatas:0];

  return v10;
}

+ (id)mapItemStorageForCoordinate:(id)a3
{
  id v3 = [[GEOPlace alloc] initWithLatitude:a3.var0 longitude:a3.var1];
  id v4 = +[GEOMapItemStorage mapItemStorageForPlace:v3];

  return v4;
}

- (BOOL)isEqualToMapItem:(id)a3
{
  id v4 = a3;
  id v5 = [(GEOMapItemStorage *)self _geoMapItem];
  id v6 = (void *)[v5 isEqualToMapItem:v4];

  if (v6)
  {
    id v7 = [(GEOMapItemStorage *)self clientAttributes];
    if (v7)
    {
      id v6 = [v4 _clientAttributes];
      if (!v6)
      {
        char v8 = 0;
LABEL_14:

        goto LABEL_16;
      }
    }
    id v9 = [(GEOMapItemStorage *)self clientAttributes];
    if (v9)
    {

      if (v7)
      {
      }
LABEL_12:
      uint64_t v11 = [(GEOMapItemStorage *)self clientAttributes];
      if (!v11)
      {
        char v8 = 1;
        goto LABEL_16;
      }
      id v7 = (void *)v11;
      uint64_t v12 = [(GEOMapItemStorage *)self clientAttributes];
      long long v13 = [v4 _clientAttributes];
      char v8 = [v12 isEqual:v13];

      goto LABEL_14;
    }
    int v10 = [v4 _clientAttributes];

    if (v7)
    {
    }
    if (!v10) {
      goto LABEL_12;
    }
  }
  char v8 = 0;
LABEL_16:

  return v8;
}

- (NSArray)_reviews
{
  id v2 = [(GEOMapItemStorage *)self _geoMapItem];
  id v3 = [v2 _reviews];

  return (NSArray *)v3;
}

- (NSArray)_tips
{
  id v2 = [(GEOMapItemStorage *)self _geoMapItem];
  id v3 = [v2 _tips];

  return (NSArray *)v3;
}

- (BOOL)_hasBusinessHours
{
  id v2 = [(GEOMapItemStorage *)self _geoMapItem];
  char v3 = [v2 _hasBusinessHours];

  return v3;
}

- (NSArray)_businessHours
{
  id v2 = [(GEOMapItemStorage *)self _geoMapItem];
  char v3 = [v2 _businessHours];

  return (NSArray *)v3;
}

- (BOOL)_hasLinkedServices
{
  id v2 = [(GEOMapItemStorage *)self _geoMapItem];
  char v3 = [v2 _hasLinkedServices];

  return v3;
}

- (NSArray)_linkedServices
{
  id v2 = [(GEOMapItemStorage *)self _geoMapItem];
  char v3 = [v2 _linkedServices];

  return (NSArray *)v3;
}

- (GEOAssociatedApp)_associatedApp
{
  id v2 = [(GEOMapItemStorage *)self _geoMapItem];
  char v3 = [v2 _associatedApp];

  return (GEOAssociatedApp *)v3;
}

- (id)_mapItemByStrippingOptionalData
{
  id v2 = [(GEOMapItemStorage *)self _geoMapItem];
  char v3 = [v2 _mapItemByStrippingOptionalData];

  return v3;
}

- (GEOMapItemStorage)initWithPlaceResult:(id)a3
{
  id v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)GEOMapItemStorage;
  id v5 = [(GEOMapItemStorage *)&v13 init];
  id v6 = v5;
  if (v5)
  {
    [(GEOMapItemStorage *)v5 initAdditionalFields];
    [(GEOMapItemStorage *)v6 setPlaceResult:v4];
    uint64_t v7 = [v4 geoMapItem];
    geoMapIteuint64_t m = v6->_geoMapItem;
    v6->_geoMapIteuint64_t m = (GEOMapItem *)v7;

    id v9 = [[_GEOMapItemStorageNotificationTrampoline alloc] initWithMapItem:v6->_geoMapItem mapItemStorage:v6];
    trampoline = v6->_trampoline;
    v6->_trampoline = v9;

    uint64_t v11 = v6;
  }

  return v6;
}

- (id)spokenNameForLocale:(id)a3
{
  id v4 = a3;
  id v5 = [(GEOMapItemStorage *)self _geoMapItem];
  id v6 = [v5 spokenNameForLocale:v4];

  return v6;
}

- (NSString)secondaryName
{
  id v2 = [(GEOMapItemStorage *)self _geoMapItem];
  char v3 = [v2 secondaryName];

  return (NSString *)v3;
}

- (NSString)secondarySpokenName
{
  id v2 = [(GEOMapItemStorage *)self _geoMapItem];
  char v3 = [v2 secondarySpokenName];

  return (NSString *)v3;
}

- (BOOL)isDisputed
{
  id v2 = [(GEOMapItemStorage *)self _geoMapItem];
  char v3 = [v2 isDisputed];

  return v3;
}

- (GEOMapRegion)displayMapRegion
{
  id v2 = [(GEOMapItemStorage *)self _geoMapItem];
  char v3 = [v2 displayMapRegion];

  return (GEOMapRegion *)v3;
}

- (GEOMapRegion)displayMapRegionOrNil
{
  id v2 = [(GEOMapItemStorage *)self _geoMapItem];
  char v3 = [v2 displayMapRegionOrNil];

  return (GEOMapRegion *)v3;
}

- (GEOMapRegion)offlineDownloadRegion
{
  id v2 = [(GEOMapItemStorage *)self _geoMapItem];
  char v3 = [v2 offlineDownloadRegion];

  return (GEOMapRegion *)v3;
}

- (BOOL)supportsOfflineMaps
{
  id v2 = [(GEOMapItemStorage *)self _geoMapItem];
  char v3 = [v2 supportsOfflineMaps];

  return v3;
}

- (BOOL)hasDisplayMinZoom
{
  id v2 = [(GEOMapItemStorage *)self _geoMapItem];
  char v3 = [v2 hasDisplayMinZoom];

  return v3;
}

- (float)displayMinZoom
{
  id v2 = [(GEOMapItemStorage *)self _geoMapItem];
  [v2 displayMinZoom];
  float v4 = v3;

  return v4;
}

- (BOOL)hasDisplayMaxZoom
{
  id v2 = [(GEOMapItemStorage *)self _geoMapItem];
  char v3 = [v2 hasDisplayMaxZoom];

  return v3;
}

- (float)displayMaxZoom
{
  id v2 = [(GEOMapItemStorage *)self _geoMapItem];
  [v2 displayMaxZoom];
  float v4 = v3;

  return v4;
}

- (GEOMapRegion)geoFenceMapRegionOrNil
{
  id v2 = [(GEOMapItemStorage *)self _geoMapItem];
  float v3 = [v2 geoFenceMapRegionOrNil];

  return (GEOMapRegion *)v3;
}

- (int)mapDisplayType
{
  id v2 = [(GEOMapItemStorage *)self _geoMapItem];
  int v3 = [v2 mapDisplayType];

  return v3;
}

- (GEOLocalizedString)disclaimerText
{
  id v2 = [(GEOMapItemStorage *)self _geoMapItem];
  int v3 = [v2 disclaimerText];

  return (GEOLocalizedString *)v3;
}

- (GEOPDURLData)urlData
{
  id v2 = [(GEOMapItemStorage *)self _geoMapItem];
  int v3 = [v2 urlData];

  return (GEOPDURLData *)v3;
}

- (int)contactAddressType
{
  int v3 = [(GEOMapItemStorage *)self clientAttributes];
  int v4 = [v3 hasAddressBookAttributes];

  id v5 = [(GEOMapItemStorage *)self clientAttributes];
  id v6 = v5;
  if (v4)
  {
    uint64_t v7 = [v5 addressBookAttributes];
    int v8 = [v7 addressType];

    return v8;
  }
  else
  {
    int v10 = [v5 hasRoutineAttributes];

    if (v10)
    {
      uint64_t v11 = [(GEOMapItemStorage *)self clientAttributes];
      uint64_t v12 = [v11 routineAttributes];
      int v13 = [v12 loiType];

      if ((v13 - 1) >= 3) {
        return 0;
      }
      else {
        return v13;
      }
    }
    else
    {
      return 0;
    }
  }
}

- (NSString)contactName
{
  id v2 = [(GEOMapItemStorage *)self clientAttributes];
  int v3 = [v2 addressBookAttributes];
  int v4 = [v3 name];

  return (NSString *)v4;
}

- (NSString)contactSpokenName
{
  id v2 = [(GEOMapItemStorage *)self clientAttributes];
  int v3 = [v2 addressBookAttributes];
  int v4 = [v3 spokenName];

  return (NSString *)v4;
}

- (NSString)eventName
{
  id v2 = [(GEOMapItemStorage *)self clientAttributes];
  int v3 = [v2 routineAttributes];
  int v4 = [v3 eventName];

  return (NSString *)v4;
}

- (NSDate)eventDate
{
  id v2 = (void *)MEMORY[0x1E4F1C9C8];
  int v3 = [(GEOMapItemStorage *)self clientAttributes];
  int v4 = [v3 routineAttributes];
  [v4 eventDate];
  id v5 = objc_msgSend(v2, "dateWithTimeIntervalSinceReferenceDate:");

  return (NSDate *)v5;
}

- (BOOL)isEventAllDay
{
  id v2 = [(GEOMapItemStorage *)self clientAttributes];
  int v3 = [v2 routineAttributes];
  char v4 = [v3 isEventAllDay];

  return v4;
}

- (BOOL)_responseStatusIsIncomplete
{
  id v2 = [(GEOMapItemStorage *)self _geoMapItem];
  char v3 = [v2 _responseStatusIsIncomplete];

  return v3;
}

- (NSData)_placeDataAsData
{
  id v2 = [(GEOMapItemStorage *)self _geoMapItem];
  char v3 = [v2 _placeDataAsData];

  return (NSData *)v3;
}

- (id)_spokenAddressForLocale:(id)a3
{
  id v4 = a3;
  id v5 = [(GEOMapItemStorage *)self _geoMapItem];
  id v6 = [v5 _spokenAddressForLocale:v4];

  return v6;
}

- (GEOMapItemIdentifier)transitStationIdentifier
{
  id v2 = [(GEOMapItemStorage *)self _geoMapItem];
  char v3 = [v2 transitStationIdentifier];

  return (GEOMapItemIdentifier *)v3;
}

- (BOOL)_isTransitDisplayFeature
{
  id v2 = [(GEOMapItemStorage *)self _geoMapItem];
  char v3 = [v2 _isTransitDisplayFeature];

  return v3;
}

- (GEOMapItemTransitInfo)_transitInfo
{
  id v2 = [(GEOMapItemStorage *)self _geoMapItem];
  char v3 = [v2 _transitInfo];

  return (GEOMapItemTransitInfo *)v3;
}

- (GEOTransitAttribution)_transitAttribution
{
  id v2 = [(GEOMapItemStorage *)self _geoMapItem];
  char v3 = [v2 _transitAttribution];

  return (GEOTransitAttribution *)v3;
}

- (GEOTransitVehiclePosition)_transitVehiclePosition
{
  id v2 = [(GEOMapItemStorage *)self _geoMapItem];
  char v3 = [v2 _transitVehiclePosition];

  return (GEOTransitVehiclePosition *)v3;
}

- (NSArray)supportedTransitPaymentMethods
{
  id v2 = [(GEOMapItemStorage *)self _geoMapItem];
  char v3 = [v2 supportedTransitPaymentMethods];

  return (NSArray *)v3;
}

- (NSArray)transitPaymentMethodSuggestions
{
  id v2 = [(GEOMapItemStorage *)self _geoMapItem];
  char v3 = [v2 transitPaymentMethodSuggestions];

  return (NSArray *)v3;
}

- (double)cachingRadiusMeters
{
  id v2 = [(GEOMapItemStorage *)self _geoMapItem];
  [v2 cachingRadiusMeters];
  double v4 = v3;

  return v4;
}

- (BOOL)_hasFlyover
{
  id v2 = [(GEOMapItemStorage *)self _geoMapItem];
  char v3 = [v2 _hasFlyover];

  return v3;
}

- (GEOPDFlyover)_flyover
{
  id v2 = [(GEOMapItemStorage *)self _geoMapItem];
  char v3 = [v2 _flyover];

  return (GEOPDFlyover *)v3;
}

- (NSString)_flyoverAnnouncementMessage
{
  id v2 = [(GEOMapItemStorage *)self _geoMapItem];
  char v3 = [v2 _flyoverAnnouncementMessage];

  return (NSString *)v3;
}

- (GEOMuninViewState)_muninViewState
{
  id v2 = [(GEOMapItemStorage *)self _geoMapItem];
  char v3 = [v2 _muninViewState];

  return (GEOMuninViewState *)v3;
}

- (GEOStorefrontInfo)_storefrontInfo
{
  id v2 = [(GEOMapItemStorage *)self _geoMapItem];
  char v3 = [v2 _storefrontInfo];

  return (GEOStorefrontInfo *)v3;
}

- (GEOStorefrontPresentationInfo)_storefrontPresentationInfo
{
  id v2 = [(GEOMapItemStorage *)self _geoMapItem];
  char v3 = [v2 _storefrontPresentationInfo];

  return (GEOStorefrontPresentationInfo *)v3;
}

- (NSSet)_alternateIdentifiers
{
  id v2 = [(GEOMapItemStorage *)self _geoMapItem];
  char v3 = [v2 _alternateIdentifiers];

  return (NSSet *)v3;
}

- (BOOL)_hasAreaInMeters
{
  id v2 = [(GEOMapItemStorage *)self _geoMapItem];
  char v3 = [v2 _hasAreaInMeters];

  return v3;
}

- (double)_areaInMeters
{
  id v2 = [(GEOMapItemStorage *)self _geoMapItem];
  [v2 _areaInMeters];
  double v4 = v3;

  return v4;
}

- (NSString)_businessURL
{
  double v3 = [(GEOMapItemStorage *)self userValues];
  int v4 = [v3 hasUrl];

  if (v4)
  {
    id v5 = [(GEOMapItemStorage *)self userValues];
    [v5 url];
  }
  else
  {
    id v5 = [(GEOMapItemStorage *)self _geoMapItem];
    [v5 _businessURL];
  id v6 = };

  return (NSString *)v6;
}

- (BOOL)_hasUserRatingScore
{
  id v2 = [(GEOMapItemStorage *)self _geoMapItem];
  char v3 = [v2 _hasUserRatingScore];

  return v3;
}

- (unsigned)_sampleSizeForUserRatingScore
{
  id v2 = [(GEOMapItemStorage *)self _geoMapItem];
  unsigned int v3 = [v2 _sampleSizeForUserRatingScore];

  return v3;
}

- (float)_normalizedUserRatingScore
{
  id v2 = [(GEOMapItemStorage *)self _geoMapItem];
  [v2 _normalizedUserRatingScore];
  float v4 = v3;

  return v4;
}

- (BOOL)_hasPriceRange
{
  id v2 = [(GEOMapItemStorage *)self _geoMapItem];
  char v3 = [v2 _hasPriceRange];

  return v3;
}

- (unsigned)_priceRange
{
  id v2 = [(GEOMapItemStorage *)self _geoMapItem];
  unsigned int v3 = [v2 _priceRange];

  return v3;
}

- (unsigned)_maxScoreForPriceRange
{
  id v2 = [(GEOMapItemStorage *)self _geoMapItem];
  unsigned int v3 = [v2 _maxScoreForPriceRange];

  return v3;
}

- (NSString)_resultSnippetLocationString
{
  id v2 = [(GEOMapItemStorage *)self _geoMapItem];
  unsigned int v3 = [v2 _resultSnippetLocationString];

  return (NSString *)v3;
}

- (unsigned)_resultSnippetDistanceDisplayThreshold
{
  id v2 = [(GEOMapItemStorage *)self _geoMapItem];
  unsigned int v3 = [v2 _resultSnippetDistanceDisplayThreshold];

  return v3;
}

- (NSArray)_childItems
{
  id v2 = [(GEOMapItemStorage *)self _geoMapItem];
  unsigned int v3 = [v2 _childItems];

  return (NSArray *)v3;
}

- (id)_localizedCategoryNamesForType:(unsigned int)a3
{
  uint64_t v3 = *(void *)&a3;
  float v4 = [(GEOMapItemStorage *)self _geoMapItem];
  id v5 = [v4 _localizedCategoryNamesForType:v3];

  return v5;
}

- (BOOL)_hasLocalizedCategoryNamesForType:(unsigned int)a3
{
  uint64_t v3 = *(void *)&a3;
  float v4 = [(GEOMapItemStorage *)self _geoMapItem];
  LOBYTE(v3) = [v4 _hasLocalizedCategoryNamesForType:v3];

  return v3;
}

- (BOOL)_hasAnyAmenities
{
  id v2 = [(GEOMapItemStorage *)self _geoMapItem];
  char v3 = [v2 _hasAnyAmenities];

  return v3;
}

- (NSArray)_amenities
{
  id v2 = [(GEOMapItemStorage *)self _geoMapItem];
  char v3 = [v2 _amenities];

  return (NSArray *)v3;
}

- (BOOL)_hasOperatingHours
{
  id v2 = [(GEOMapItemStorage *)self _geoMapItem];
  char v3 = [v2 _hasOperatingHours];

  return v3;
}

- (BOOL)_hasCurrentOperatingHours
{
  id v2 = [(GEOMapItemStorage *)self _geoMapItem];
  char v3 = [v2 _hasCurrentOperatingHours];

  return v3;
}

- (BOOL)_hasEncyclopedicInfo
{
  id v2 = [(GEOMapItemStorage *)self _geoMapItem];
  char v3 = [v2 _hasEncyclopedicInfo];

  return v3;
}

- (GEOEncyclopedicInfo)_encyclopedicInfo
{
  id v2 = [(GEOMapItemStorage *)self _geoMapItem];
  char v3 = [v2 _encyclopedicInfo];

  return (GEOEncyclopedicInfo *)v3;
}

- (BOOL)_hasTelephone
{
  id v2 = [(GEOMapItemStorage *)self _geoMapItem];
  char v3 = [v2 _hasTelephone];

  return v3;
}

- (NSString)_telephone
{
  char v3 = [(GEOMapItemStorage *)self userValues];
  int v4 = [v3 hasPhoneNumber];

  if (v4)
  {
    id v5 = [(GEOMapItemStorage *)self userValues];
    [v5 phoneNumber];
  }
  else
  {
    id v5 = [(GEOMapItemStorage *)self _geoMapItem];
    [v5 _telephone];
  id v6 = };

  return (NSString *)v6;
}

- (BOOL)_optsOutOfTelephoneAds
{
  id v2 = [(GEOMapItemStorage *)self _geoMapItem];
  char v3 = [v2 _optsOutOfTelephoneAds];

  return v3;
}

- (NSString)_disambiguationName
{
  id v2 = [(GEOMapItemStorage *)self _geoMapItem];
  char v3 = [v2 _disambiguationName];

  return (NSString *)v3;
}

- (unint64_t)_openingHoursOptions
{
  id v2 = [(GEOMapItemStorage *)self _geoMapItem];
  unint64_t v3 = [v2 _openingHoursOptions];

  return v3;
}

- (GEOInlineRapEnablement)_inlineRapEnablement
{
  id v2 = [(GEOMapItemStorage *)self _geoMapItem];
  unint64_t v3 = [v2 _inlineRapEnablement];

  return (GEOInlineRapEnablement *)v3;
}

- (BOOL)_needsAttribution
{
  id v2 = [(GEOMapItemStorage *)self _geoMapItem];
  char v3 = [v2 _needsAttribution];

  return v3;
}

- (NSURL)_webURL
{
  id v2 = [(GEOMapItemStorage *)self _geoMapItem];
  char v3 = [v2 _webURL];

  return (NSURL *)v3;
}

- (NSURL)_providerURL
{
  id v2 = [(GEOMapItemStorage *)self _geoMapItem];
  char v3 = [v2 _providerURL];

  return (NSURL *)v3;
}

- (NSString)_vendorID
{
  id v2 = [(GEOMapItemStorage *)self _geoMapItem];
  char v3 = [v2 _vendorID];

  return (NSString *)v3;
}

- (NSString)_poiSurveyURLString
{
  id v2 = [(GEOMapItemStorage *)self _geoMapItem];
  char v3 = [v2 _poiSurveyURLString];

  return (NSString *)v3;
}

- (NSString)_poiPinpointURLString
{
  id v2 = [(GEOMapItemStorage *)self _geoMapItem];
  char v3 = [v2 _poiPinpointURLString];

  return (NSString *)v3;
}

- (GEOMapItemPlaceAttribution)_attribution
{
  id v2 = [(GEOMapItemStorage *)self _geoMapItem];
  char v3 = [v2 _attribution];

  return (GEOMapItemPlaceAttribution *)v3;
}

- (GEOMapItemPhotosAttribution)_photosAttribution
{
  id v2 = [(GEOMapItemStorage *)self _geoMapItem];
  char v3 = [v2 _photosAttribution];

  return (GEOMapItemPhotosAttribution *)v3;
}

- (NSArray)_allPhotoAttributions
{
  id v2 = [(GEOMapItemStorage *)self _geoMapItem];
  char v3 = [v2 _allPhotoAttributions];

  return (NSArray *)v3;
}

- (GEOMapItemReviewsAttribution)_reviewsAttribution
{
  id v2 = [(GEOMapItemStorage *)self _geoMapItem];
  char v3 = [v2 _reviewsAttribution];

  return (GEOMapItemReviewsAttribution *)v3;
}

- (NSString)_mapsCategoryId
{
  id v2 = [(GEOMapItemStorage *)self _geoMapItem];
  char v3 = [v2 _mapsCategoryId];

  return (NSString *)v3;
}

- (NSArray)_alternateMapsCategoryIDs
{
  id v2 = [(GEOMapItemStorage *)self _geoMapItem];
  char v3 = [v2 _alternateMapsCategoryIDs];

  return (NSArray *)v3;
}

- (NSNumber)_mapsCategoryMUID
{
  id v2 = [(GEOMapItemStorage *)self _geoMapItem];
  char v3 = [v2 _mapsCategoryMUID];

  return (NSNumber *)v3;
}

- (NSArray)_alternateMapsCategoryMUIDs
{
  id v2 = [(GEOMapItemStorage *)self _geoMapItem];
  char v3 = [v2 _alternateMapsCategoryMUIDs];

  return (NSArray *)v3;
}

- (NSArray)_additionalPlaceInfos
{
  id v2 = [(GEOMapItemStorage *)self _geoMapItem];
  char v3 = [v2 _additionalPlaceInfos];

  return (NSArray *)v3;
}

- (id)_asPlaceInfo
{
  id v2 = [(GEOMapItemStorage *)self _geoMapItem];
  char v3 = [v2 _asPlaceInfo];

  return v3;
}

- (GEOMapRegion)mapRegion
{
  id v2 = [(GEOMapItemStorage *)self _geoMapItem];
  char v3 = [v2 geoFenceMapRegion];

  return (GEOMapRegion *)v3;
}

- (BOOL)_hasPOIClaim
{
  id v2 = [(GEOMapItemStorage *)self _geoMapItem];
  char v3 = [v2 _hasPOIClaim];

  return v3;
}

- (GEOPOIClaim)_poiClaim
{
  id v2 = [(GEOMapItemStorage *)self _geoMapItem];
  char v3 = [v2 _poiClaim];

  return (GEOPOIClaim *)v3;
}

- (GEOBusinessAssets)businessAssets
{
  id v2 = [(GEOMapItemStorage *)self _geoMapItem];
  char v3 = [v2 businessAssets];

  return (GEOBusinessAssets *)v3;
}

- (NSArray)spatialMappedCategories
{
  id v2 = [(GEOMapItemStorage *)self _geoMapItem];
  char v3 = [v2 spatialMappedCategories];

  return (NSArray *)v3;
}

- (BOOL)_hasFeatureLink
{
  id v2 = [(GEOMapItemStorage *)self _geoMapItem];
  char v3 = [v2 _hasFeatureLink];

  return v3;
}

- (GEORestaurantFeaturesLink)_featureLink
{
  id v2 = [(GEOMapItemStorage *)self _geoMapItem];
  char v3 = [v2 _featureLink];

  return (GEORestaurantFeaturesLink *)v3;
}

- (int)_parsecSectionType
{
  id v2 = [(GEOMapItemStorage *)self _geoMapItem];
  int v3 = [v2 _parsecSectionType];

  return v3;
}

- (BOOL)_isStandaloneBrand
{
  id v2 = [(GEOMapItemStorage *)self _geoMapItem];
  char v3 = [v2 _isStandaloneBrand];

  return v3;
}

- (BOOL)_hasBrandMUID
{
  id v2 = [(GEOMapItemStorage *)self _geoMapItem];
  char v3 = [v2 _hasBrandMUID];

  return v3;
}

- (unint64_t)_brandMUID
{
  id v2 = [(GEOMapItemStorage *)self _geoMapItem];
  unint64_t v3 = [v2 _brandMUID];

  return v3;
}

- (GEOMessageLink)_messageLink
{
  id v2 = [(GEOMapItemStorage *)self _geoMapItem];
  unint64_t v3 = [v2 _messageLink];

  return (GEOMessageLink *)v3;
}

- (NSArray)_quickLinks
{
  id v2 = [(GEOMapItemStorage *)self _geoMapItem];
  unint64_t v3 = [v2 _quickLinks];

  return (NSArray *)v3;
}

- (NSArray)_secondaryQuickLinks
{
  id v2 = [(GEOMapItemStorage *)self _geoMapItem];
  unint64_t v3 = [v2 _secondaryQuickLinks];

  return (NSArray *)v3;
}

- (NSArray)_placeCollections
{
  return 0;
}

- (NSArray)_searchResultPhotoCarousel
{
  return 0;
}

- (GEOExploreGuides)_exploreGuides
{
  return 0;
}

- (NSArray)_placeCollectionsIds
{
  return 0;
}

- (BOOL)_hasPlaceCollectionPullQuotes
{
  id v2 = [(GEOMapItemStorage *)self _geoMapItem];
  char v3 = [v2 _hasPlaceCollectionPullQuotes];

  return v3;
}

- (NSArray)_placeCollectionPullQuotes
{
  id v2 = [(GEOMapItemStorage *)self _geoMapItem];
  char v3 = [v2 _placeCollectionPullQuotes];

  return (NSArray *)v3;
}

- (NSArray)_relatedPlaceLists
{
  id v2 = [(GEOMapItemStorage *)self _geoMapItem];
  char v3 = [v2 _relatedPlaceLists];

  return (NSArray *)v3;
}

- (id)_relatedPlaceListForComponentIdentifier:(int)a3
{
  uint64_t v3 = *(void *)&a3;
  int v4 = [(GEOMapItemStorage *)self _geoMapItem];
  id v5 = [v4 _relatedPlaceListForComponentIdentifier:v3];

  return v5;
}

- (id)_firstRelatedPlaceListForType:(int)a3
{
  uint64_t v3 = *(void *)&a3;
  int v4 = [(GEOMapItemStorage *)self _geoMapItem];
  id v5 = [v4 _firstRelatedPlaceListForType:v3];

  return v5;
}

- (BOOL)_hasEVCharger
{
  id v2 = [(GEOMapItemStorage *)self _geoMapItem];
  char v3 = [v2 _hasEVCharger];

  return v3;
}

- (GEOEVCharger)_evCharger
{
  id v2 = [(GEOMapItemStorage *)self _geoMapItem];
  char v3 = [v2 _evCharger];

  return (GEOEVCharger *)v3;
}

- (GEOPlacecardLayoutData)_placecardLayoutData
{
  id v2 = [(GEOMapItemStorage *)self _geoMapItem];
  char v3 = [v2 _placecardLayoutData];

  return (GEOPlacecardLayoutData *)v3;
}

- (GEOMapItemDetourInfo)detourInfo
{
  id v2 = [(GEOMapItemStorage *)self _geoMapItem];
  char v3 = [v2 detourInfo];

  return (GEOMapItemDetourInfo *)v3;
}

- (id)shortAddress
{
  if ([(GEOMapItemStorage *)self _venueFeatureType] == 4)
  {
    char v3 = [(GEOMapItemStorage *)self addressObject];
    int v4 = [v3 venueShortAddress];

    if ([v4 length]) {
      goto LABEL_8;
    }
  }
  id v5 = [(GEOMapItemStorage *)self _clientAttributes];
  int v6 = [v5 hasCorrectedLocationAttributes];

  if (v6)
  {
    uint64_t v7 = [(GEOMapItemStorage *)self _clientAttributes];
    int v8 = [v7 correctedLocationAttributes];
    id v9 = [v8 correctedAddress];
    int v10 = [v9 formattedAddressLines];
    int v4 = [v10 firstObject];

    if ([v4 length]) {
      goto LABEL_8;
    }
  }
  uint64_t v11 = [(GEOMapItemStorage *)self addressObject];
  int v4 = [v11 shortAddress];

LABEL_8:

  return v4;
}

- (id)weatherDisplayName
{
  id v2 = [(GEOMapItemStorage *)self _geoMapItem];
  char v3 = [v2 weatherDisplayName];

  return v3;
}

- (NSData)externalTransitStationCode
{
  id v2 = [(GEOMapItemStorage *)self _geoMapItem];
  char v3 = [v2 externalTransitStationCode];

  return (NSData *)v3;
}

- (int)_venueFeatureType
{
  id v2 = [(GEOMapItemStorage *)self _geoMapItem];
  int v3 = [v2 _venueFeatureType];

  return v3;
}

- (NSArray)_browseCategories
{
  id v2 = [(GEOMapItemStorage *)self _geoMapItem];
  int v3 = [v2 _browseCategories];

  return (NSArray *)v3;
}

- (GEOMiniBrowseCategories)_miniBrowseCategories
{
  id v2 = [(GEOMapItemStorage *)self _geoMapItem];
  int v3 = [v2 _miniBrowseCategories];

  return (GEOMiniBrowseCategories *)v3;
}

- (int)_placeDisplayStyle
{
  id v2 = [(GEOMapItemStorage *)self _geoMapItem];
  int v3 = [v2 _placeDisplayStyle];

  return v3;
}

- (GEOAnnotatedItemList)_annotatedItemList
{
  id v2 = [(GEOMapItemStorage *)self _geoMapItem];
  int v3 = [v2 _annotatedItemList];

  return (GEOAnnotatedItemList *)v3;
}

- (BOOL)_hasWifiFingerprintLabelStatusCode
{
  id v2 = [(GEOMapItemStorage *)self _geoMapItem];
  char v3 = [v2 _hasWifiFingerprintLabelStatusCode];

  return v3;
}

- (int)_wifiFingerprintLabelStatusCode
{
  id v2 = [(GEOMapItemStorage *)self _geoMapItem];
  int v3 = [v2 _wifiFingerprintLabelStatusCode];

  return v3;
}

- (BOOL)_hasWifiFingerprintLabelType
{
  id v2 = [(GEOMapItemStorage *)self _geoMapItem];
  char v3 = [v2 _hasWifiFingerprintLabelType];

  return v3;
}

- (int)_wifiFingerprintLabelType
{
  id v2 = [(GEOMapItemStorage *)self _geoMapItem];
  int v3 = [v2 _wifiFingerprintLabelType];

  return v3;
}

- (BOOL)_hasWifiFingerprintConfidence
{
  id v2 = [(GEOMapItemStorage *)self _geoMapItem];
  char v3 = [v2 _hasWifiFingerprintConfidence];

  return v3;
}

- (unsigned)_wifiFingerprintConfidence
{
  id v2 = [(GEOMapItemStorage *)self _geoMapItem];
  unsigned int v3 = [v2 _wifiFingerprintConfidence];

  return v3;
}

- (id)_bestAvatarBrandIconURLForSize:(CGSize)a3 allowSmaller:(BOOL)a4
{
  BOOL v4 = a4;
  double height = a3.height;
  double width = a3.width;
  uint64_t v7 = [(GEOMapItemStorage *)self _geoMapItem];
  int v8 = objc_msgSend(v7, "_bestAvatarBrandIconURLForSize:allowSmaller:", v4, width, height);

  return v8;
}

- (id)_bestNavbarBrandIconURLForSize:(CGSize)a3 allowSmaller:(BOOL)a4
{
  BOOL v4 = a4;
  double height = a3.height;
  double width = a3.width;
  uint64_t v7 = [(GEOMapItemStorage *)self _geoMapItem];
  int v8 = objc_msgSend(v7, "_bestNavbarBrandIconURLForSize:allowSmaller:", v4, width, height);

  return v8;
}

- (id)_bestHeroBrandIconURLForSize:(CGSize)a3 allowSmaller:(BOOL)a4
{
  BOOL v4 = a4;
  double height = a3.height;
  double width = a3.width;
  uint64_t v7 = [(GEOMapItemStorage *)self _geoMapItem];
  int v8 = objc_msgSend(v7, "_bestHeroBrandIconURLForSize:allowSmaller:", v4, width, height);

  return v8;
}

- (GEOPriceDescription)_priceDescription
{
  id v2 = [(GEOMapItemStorage *)self _geoMapItem];
  unsigned int v3 = [v2 _priceDescription];

  return (GEOPriceDescription *)v3;
}

- (GEOMapItemContainedPlace)_containedPlace
{
  id v2 = [(GEOMapItemStorage *)self _geoMapItem];
  unsigned int v3 = [v2 _containedPlace];

  return (GEOMapItemContainedPlace *)v3;
}

- (BOOL)_isInLinkedPlaceRelationship
{
  id v2 = [(GEOMapItemStorage *)self _geoMapItem];
  char v3 = [v2 _isInLinkedPlaceRelationship];

  return v3;
}

- (BOOL)_hasGroundViewLocationId
{
  id v2 = [(GEOMapItemStorage *)self _geoMapItem];
  char v3 = [v2 _hasGroundViewLocationId];

  return v3;
}

- (unint64_t)_groundViewLocationId
{
  id v2 = [(GEOMapItemStorage *)self _geoMapItem];
  unint64_t v3 = [v2 _groundViewLocationId];

  return v3;
}

- (void)iterateGroundViewsWithBlock:(id)a3
{
  id v4 = a3;
  id v5 = [(GEOMapItemStorage *)self _geoMapItem];
  [v5 iterateGroundViewsWithBlock:v4];
}

- (BOOL)hasVenueCapacity
{
  id v2 = [(GEOMapItemStorage *)self _geoMapItem];
  char v3 = [v2 hasVenueCapacity];

  return v3;
}

- (int64_t)venueCapacity
{
  id v2 = [(GEOMapItemStorage *)self _geoMapItem];
  char v3 = v2;
  if (v2) {
    int64_t v4 = [v2 venueCapacity];
  }
  else {
    int64_t v4 = 0x7FFFFFFFFFFFFFFFLL;
  }

  return v4;
}

- (NSArray)spatialMappedPlaceCategories
{
  return 0;
}

- (NSString)_walletCategoryIdentifier
{
  id v2 = [(GEOMapItemStorage *)self _geoMapItem];
  char v3 = [v2 _walletCategoryIdentifier];

  return (NSString *)v3;
}

- (NSString)_walletMapsCategoryIdentifier
{
  id v2 = [(GEOMapItemStorage *)self _geoMapItem];
  char v3 = [v2 _walletMapsCategoryIdentifier];

  return (NSString *)v3;
}

- (NSString)_walletCategoryLocalizedStringLocale
{
  id v2 = [(GEOMapItemStorage *)self _geoMapItem];
  char v3 = [v2 _walletCategoryLocalizedStringLocale];

  return (NSString *)v3;
}

- (NSString)_walletCategoryLocalizedString
{
  id v2 = [(GEOMapItemStorage *)self _geoMapItem];
  char v3 = [v2 _walletCategoryLocalizedString];

  return (NSString *)v3;
}

- (GEOStyleAttributes)_walletCategoryStyling
{
  id v2 = [(GEOMapItemStorage *)self _geoMapItem];
  char v3 = [v2 _walletCategoryStyling];

  return (GEOStyleAttributes *)v3;
}

- (NSString)_walletPlaceLocalizedStringLocale
{
  id v2 = [(GEOMapItemStorage *)self _geoMapItem];
  char v3 = [v2 _walletPlaceLocalizedStringLocale];

  return (NSString *)v3;
}

- (NSString)_walletPlaceLocalizedString
{
  id v2 = [(GEOMapItemStorage *)self _geoMapItem];
  char v3 = [v2 _walletPlaceLocalizedString];

  return (NSString *)v3;
}

- (GEOStyleAttributes)_walletPlaceStyling
{
  id v2 = [(GEOMapItemStorage *)self _geoMapItem];
  char v3 = [v2 _walletPlaceStyling];

  return (GEOStyleAttributes *)v3;
}

- (BOOL)_enableRAPLightweightFeedback
{
  id v2 = [(GEOMapItemStorage *)self _geoMapItem];
  char v3 = [v2 _enableRAPLightweightFeedback];

  return v3;
}

- (NSArray)_alternateSearchableNames
{
  id v2 = [(GEOMapItemStorage *)self _geoMapItem];
  char v3 = [v2 _alternateSearchableNames];

  return (NSArray *)v3;
}

- (NSString)_iso3166CountryCode
{
  id v2 = [(GEOMapItemStorage *)self _geoMapItem];
  char v3 = [v2 _iso3166CountryCode];

  return (NSString *)v3;
}

- (NSString)_iso3166SubdivisionCode
{
  id v2 = [(GEOMapItemStorage *)self _geoMapItem];
  char v3 = [v2 _iso3166SubdivisionCode];

  return (NSString *)v3;
}

- (NSString)_bestAvailableCountryCode
{
  id v2 = [(GEOMapItemStorage *)self _geoMapItem];
  char v3 = [v2 _bestAvailableCountryCode];

  return (NSString *)v3;
}

- (BOOL)_showSuggestAnEditButton
{
  id v2 = [(GEOMapItemStorage *)self placeData];
  char v3 = [v2 componentOfType:41 options:0];

  int64_t v4 = -[GEOPDComponent values](v3);
  uint64_t v5 = [v4 firstObject];

  if (!v5 || !*(void *)(v5 + 480)) {
    goto LABEL_8;
  }
  uint64_t v6 = -[GEOPDComponentValue rap]((id *)v5);
  if (!v6 || (*(unsigned char *)(v6 + 20) & 1) == 0)
  {

LABEL_8:
    BOOL v8 = 1;
    goto LABEL_9;
  }
  int v7 = *(_DWORD *)(v6 + 16);

  if (v7 != 1) {
    goto LABEL_8;
  }
  BOOL v8 = 0;
LABEL_9:

  return v8;
}

- (int)_RAPFlowType
{
  id v2 = [(GEOMapItemStorage *)self placeData];
  int v3 = [v2 rapFlowType];
  if ((v3 - 1) >= 7) {
    int v4 = 0;
  }
  else {
    int v4 = v3;
  }

  return v4;
}

- (BOOL)_hasAppleRatings
{
  id v2 = [(GEOMapItemStorage *)self _geoMapItem];
  char v3 = [v2 _hasAppleRatings];

  return v3;
}

- (NSArray)_appleRatings
{
  id v2 = [(GEOMapItemStorage *)self _geoMapItem];
  char v3 = [v2 _appleRatings];

  return (NSArray *)v3;
}

- (GEOAppleRating)_overallAppleRating
{
  id v2 = [(GEOMapItemStorage *)self _geoMapItem];
  char v3 = [v2 _overallAppleRating];

  return (GEOAppleRating *)v3;
}

- (BOOL)_hasPlaceQuestionnaire
{
  id v2 = [(GEOMapItemStorage *)self _geoMapItem];
  char v3 = [v2 _hasPlaceQuestionnaire];

  return v3;
}

- (GEOPlaceQuestionnaire)_placeQuestionnaire
{
  id v2 = [(GEOMapItemStorage *)self _geoMapItem];
  char v3 = [v2 _placeQuestionnaire];

  return (GEOPlaceQuestionnaire *)v3;
}

- (NSArray)_identifierHistory
{
  id v2 = [(GEOMapItemStorage *)self _geoMapItem];
  char v3 = [v2 _identifierHistory];

  return (NSArray *)v3;
}

- (BOOL)_canDownloadMorePhotos
{
  id v2 = [(GEOMapItemStorage *)self _geoMapItem];
  char v3 = [v2 _canDownloadMorePhotos];

  return v3;
}

- (unint64_t)_totalPhotoCount
{
  id v2 = [(GEOMapItemStorage *)self _geoMapItem];
  unint64_t v3 = [v2 _totalPhotoCount];

  return v3;
}

- (NSArray)_captionedPhotoAlbums
{
  id v2 = [(GEOMapItemStorage *)self _geoMapItem];
  unint64_t v3 = [v2 _captionedPhotoAlbums];

  return (NSArray *)v3;
}

- (BOOL)_hasCaptionedPhotoAlbum
{
  id v2 = [(GEOMapItemStorage *)self _geoMapItem];
  char v3 = [v2 _hasCaptionedPhotoAlbum];

  return v3;
}

- (BOOL)_hasEnclosingPlace
{
  id v2 = [(GEOMapItemStorage *)self _geoMapItem];
  char v3 = [v2 _hasEnclosingPlace];

  return v3;
}

- (GEOEnclosingPlace)_enclosingPlace
{
  id v2 = [(GEOMapItemStorage *)self _geoMapItem];
  char v3 = [v2 _enclosingPlace];

  return (GEOEnclosingPlace *)v3;
}

- (unint64_t)_areaHighlightId
{
  id v2 = [(GEOMapItemStorage *)self _geoMapItem];
  unint64_t v3 = [v2 _areaHighlightId];

  return v3;
}

- (BOOL)_hasPlaceDescription
{
  id v2 = [(GEOMapItemStorage *)self _geoMapItem];
  char v3 = [v2 _hasPlaceDescription];

  return v3;
}

- (NSString)_placeDescription
{
  id v2 = [(GEOMapItemStorage *)self _geoMapItem];
  char v3 = [v2 _placeDescription];

  return (NSString *)v3;
}

- (GEOViewportFrame)_viewportFrame
{
  id v2 = [(GEOMapItemStorage *)self _geoMapItem];
  char v3 = [v2 _viewportFrame];

  return (GEOViewportFrame *)v3;
}

- (GEOEnrichmentInfo)_enrichmentInfo
{
  id v2 = [(GEOMapItemStorage *)self _geoMapItem];
  char v3 = [v2 _enrichmentInfo];

  return (GEOEnrichmentInfo *)v3;
}

- (GEOEnrichmentData)_enrichmentData
{
  id v2 = [(GEOMapItemStorage *)self _geoMapItem];
  char v3 = [v2 _enrichmentData];

  return (GEOEnrichmentData *)v3;
}

- (GEOTrailHead)_trailHead
{
  id v2 = [(GEOMapItemStorage *)self _geoMapItem];
  char v3 = [v2 _trailHead];

  return (GEOTrailHead *)v3;
}

- (GEOHikeSummary)_hikeSummary
{
  id v2 = [(GEOMapItemStorage *)self _geoMapItem];
  char v3 = [v2 _hikeSummary];

  return (GEOHikeSummary *)v3;
}

- (GEOPDHikeGeometry)_hikeGeometry
{
  id v2 = [(GEOMapItemStorage *)self _geoMapItem];
  char v3 = [v2 _hikeGeometry];

  return (GEOPDHikeGeometry *)v3;
}

- (int)_hikeGeometryElevationModel
{
  id v2 = [(GEOMapItemStorage *)self _geoMapItem];
  int v3 = [v2 _hikeGeometryElevationModel];

  return v3;
}

- (GEOPDHikeAssociatedInfo)_hikeAssociatedInfo
{
  id v2 = [(GEOMapItemStorage *)self _geoMapItem];
  int v3 = [v2 _hikeAssociatedInfo];

  return (GEOPDHikeAssociatedInfo *)v3;
}

- (NSArray)_externalActionLinks
{
  id v2 = [(GEOMapItemStorage *)self _geoMapItem];
  int v3 = [v2 _externalActionLinks];

  return (NSArray *)v3;
}

- (GEOTooltip)_tooltip
{
  id v2 = [(GEOMapItemStorage *)self _geoMapItem];
  int v3 = [v2 _tooltip];

  return (GEOTooltip *)v3;
}

- (float)_photosMemoryScore
{
  return -1.0;
}

- (int)_placeCategoryType
{
  id v2 = [(GEOMapItemStorage *)self _geoMapItem];
  int v3 = [v2 _placeCategoryType];

  return v3;
}

- (BOOL)hasClientAttributes
{
  return self->_clientAttributes != 0;
}

- (GEOPlaceResult)placeResult
{
  -[GEOMapItemStorage _readPlaceResult]((uint64_t)self);
  placeResult = self->_placeResult;

  return placeResult;
}

- (void)setPlaceResult:(id)a3
{
  *(_WORD *)&self->_flags |= 0x480u;
  objc_storeStrong((id *)&self->_placeResult, a3);
}

- (void)_readOriginatingCoordinate
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 128));
    if ((*(_WORD *)(a1 + 132) & 0x20) == 0)
    {
      id v2 = *(void **)(a1 + 32);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOMapItemStorageReadSpecified(a1, *(void *)(a1 + 32), (int *)&_readOriginatingCoordinate_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 128));
  }
}

- (BOOL)hasOriginatingCoordinate
{
  return self->_originatingCoordinate != 0;
}

- (GEOLatLng)originatingCoordinate
{
  -[GEOMapItemStorage _readOriginatingCoordinate]((uint64_t)self);
  originatingCoordinate = self->_originatingCoordinate;

  return originatingCoordinate;
}

- (void)setOriginatingCoordinate:(id)a3
{
  *(_WORD *)&self->_flags |= 0x420u;
  objc_storeStrong((id *)&self->_originatingCoordinate, a3);
}

- (BOOL)hasInternalDetourInfo
{
  return self->_internalDetourInfo != 0;
}

- (void)_readMapsURL
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 128));
    if ((*(_WORD *)(a1 + 132) & 0x10) == 0)
    {
      id v2 = *(void **)(a1 + 32);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOMapItemStorageReadSpecified(a1, *(void *)(a1 + 32), (int *)&_readMapsURL_tags_0);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 128));
  }
}

- (BOOL)hasMapsURL
{
  return self->_mapsURL != 0;
}

- (NSString)mapsURL
{
  -[GEOMapItemStorage _readMapsURL]((uint64_t)self);
  mapsURL = self->_mapsURL;

  return mapsURL;
}

- (void)setMapsURL:(id)a3
{
  *(_WORD *)&self->_flags |= 0x410u;
  objc_storeStrong((id *)&self->_mapsURL, a3);
}

- (BOOL)hasUserValues
{
  return self->_userValues != 0;
}

- (void)setAdditionalPlaceDatas:(id)a3
{
  int v4 = (NSMutableArray *)a3;
  os_unfair_lock_lock_with_options();
  *(_WORD *)&self->_flags |= 2u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(_WORD *)&self->_flags |= 0x400u;
  additionalPlaceDatas = self->_additionalPlaceDatas;
  self->_additionalPlaceDatas = v4;
}

- (void)clearAdditionalPlaceDatas
{
  p_readerLocuint64_t k = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(_WORD *)&self->_flags |= 2u;
  os_unfair_lock_unlock(p_readerLock);
  *(_WORD *)&self->_flags |= 0x400u;
  additionalPlaceDatas = self->_additionalPlaceDatas;

  [(NSMutableArray *)additionalPlaceDatas removeAllObjects];
}

- (void)addAdditionalPlaceDatas:(id)a3
{
  id v4 = a3;
  -[GEOMapItemStorage _readAdditionalPlaceDatas]((uint64_t)self);
  -[GEOMapItemStorage _addNoFlagsAdditionalPlaceDatas:]((uint64_t)self, v4);

  os_unfair_lock_lock_with_options();
  *(_WORD *)&self->_flags |= 2u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(_WORD *)&self->_flags |= 0x400u;
}

- (void)_addNoFlagsAdditionalPlaceDatas:(uint64_t)a1
{
  id v3 = a2;
  if (a1)
  {
    id v4 = *(void **)(a1 + 48);
    id v7 = v3;
    if (!v4)
    {
      id v5 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
      uint64_t v6 = *(void **)(a1 + 48);
      *(void *)(a1 + 48) = v5;

      id v4 = *(void **)(a1 + 48);
    }
    [v4 addObject:v7];
    id v3 = v7;
  }
}

- (unint64_t)additionalPlaceDatasCount
{
  -[GEOMapItemStorage _readAdditionalPlaceDatas]((uint64_t)self);
  additionalPlaceDatas = self->_additionalPlaceDatas;

  return [(NSMutableArray *)additionalPlaceDatas count];
}

- (id)additionalPlaceDatasAtIndex:(unint64_t)a3
{
  -[GEOMapItemStorage _readAdditionalPlaceDatas]((uint64_t)self);
  additionalPlaceDatas = self->_additionalPlaceDatas;

  return (id)[(NSMutableArray *)additionalPlaceDatas objectAtIndex:a3];
}

+ (Class)additionalPlaceDatasType
{
  return (Class)objc_opt_class();
}

- (NSString)description
{
  id v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)GEOMapItemStorage;
  id v4 = [(GEOMapItemStorage *)&v8 description];
  id v5 = [(GEOMapItemStorage *)self dictionaryRepresentation];
  uint64_t v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return (NSString *)v6;
}

- (id)dictionaryRepresentation
{
  return -[GEOMapItemStorage _dictionaryRepresentation:]((uint64_t)self, 0);
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  uint64_t v50 = *MEMORY[0x1E4F143B8];
  if (a1)
  {
    [(id)a1 readAll:1];
    id v4 = [MEMORY[0x1E4F1CA60] dictionary];
    id v5 = [(id)a1 placeData];
    uint64_t v6 = v5;
    if (v5)
    {
      if (a2) {
        [v5 jsonRepresentation];
      }
      else {
      id v7 = [v5 dictionaryRepresentation];
      }
      [v4 setObject:v7 forKey:@"placeData"];
    }
    objc_super v8 = [(id)a1 place];
    id v9 = v8;
    if (v8)
    {
      if (a2) {
        [v8 jsonRepresentation];
      }
      else {
      int v10 = [v8 dictionaryRepresentation];
      }
      [v4 setObject:v10 forKey:@"place"];
    }
    uint64_t v11 = [(id)a1 clientAttributes];
    uint64_t v12 = v11;
    if (v11)
    {
      if (a2) {
        [v11 jsonRepresentation];
      }
      else {
      int v13 = [v11 dictionaryRepresentation];
      }
      [v4 setObject:v13 forKey:@"clientAttributes"];
    }
    uint64_t v14 = [(id)a1 placeResult];
    int v15 = v14;
    if (v14)
    {
      if (a2) {
        [v14 jsonRepresentation];
      }
      else {
      uint64_t v16 = [v14 dictionaryRepresentation];
      }
      [v4 setObject:v16 forKey:@"placeResult"];
    }
    uint64_t v17 = [(id)a1 originatingCoordinate];
    id v18 = v17;
    if (v17)
    {
      if (a2) {
        [v17 jsonRepresentation];
      }
      else {
      uint64_t v19 = [v17 dictionaryRepresentation];
      }
      [v4 setObject:v19 forKey:@"originatingCoordinate"];
    }
    uint64_t v20 = [(id)a1 internalDetourInfo];
    uint64_t v21 = v20;
    if (v20)
    {
      if (a2) {
        [v20 jsonRepresentation];
      }
      else {
      uint64_t v22 = [v20 dictionaryRepresentation];
      }
      [v4 setObject:v22 forKey:@"internalDetourInfo"];
    }
    uint64_t v23 = [(id)a1 mapsURL];
    if (v23) {
      [v4 setObject:v23 forKey:@"mapsURL"];
    }

    int v24 = [(id)a1 userValues];
    uint64_t v25 = v24;
    if (v24)
    {
      if (a2)
      {
        uint64_t v26 = [v24 jsonRepresentation];
        uint64_t v27 = @"userValues";
      }
      else
      {
        uint64_t v26 = [v24 dictionaryRepresentation];
        uint64_t v27 = @"user_values";
      }
      [v4 setObject:v26 forKey:v27];
    }
    if ([*(id *)(a1 + 48) count])
    {
      uint64_t v28 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(*(id *)(a1 + 48), "count"));
      long long v45 = 0u;
      long long v46 = 0u;
      long long v47 = 0u;
      long long v48 = 0u;
      id v29 = *(id *)(a1 + 48);
      uint64_t v30 = [v29 countByEnumeratingWithState:&v45 objects:v49 count:16];
      if (v30)
      {
        uint64_t v31 = v30;
        uint64_t v32 = *(void *)v46;
        do
        {
          for (uint64_t i = 0; i != v31; ++i)
          {
            if (*(void *)v46 != v32) {
              objc_enumerationMutation(v29);
            }
            v34 = *(void **)(*((void *)&v45 + 1) + 8 * i);
            if (a2) {
              [v34 jsonRepresentation];
            }
            else {
            id v35 = [v34 dictionaryRepresentation];
            }
            [v28 addObject:v35];
          }
          uint64_t v31 = [v29 countByEnumeratingWithState:&v45 objects:v49 count:16];
        }
        while (v31);
      }

      [v4 setObject:v28 forKey:@"additionalPlaceDatas"];
    }
    long long v36 = *(void **)(a1 + 40);
    if (v36)
    {
      long long v37 = [v36 dictionaryRepresentation];
      long long v38 = v37;
      if (a2)
      {
        long long v39 = objc_msgSend(MEMORY[0x1E4F1CA60], "dictionaryWithCapacity:", objc_msgSend(v37, "count"));
        v43[0] = MEMORY[0x1E4F143A8];
        v43[1] = 3221225472;
        v43[2] = __47__GEOMapItemStorage__dictionaryRepresentation___block_invoke;
        v43[3] = &unk_1E53D8860;
        id v40 = v39;
        id v44 = v40;
        [v38 enumerateKeysAndObjectsUsingBlock:v43];
        id v41 = v40;

        long long v38 = v41;
      }
      [v4 setObject:v38 forKey:@"Unknown Fields"];
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
  return -[GEOMapItemStorage _dictionaryRepresentation:]((uint64_t)self, 1);
}

void __47__GEOMapItemStorage__dictionaryRepresentation___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v10 = a2;
  id v5 = a3;
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();
  id v7 = *(void **)(a1 + 32);
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

- (GEOMapItemStorage)initWithDictionary:(id)a3
{
  return (GEOMapItemStorage *)-[GEOMapItemStorage _initWithDictionary:isJSON:](self, a3, 0);
}

- (void)_initWithDictionary:(int)a3 isJSON:
{
  uint64_t v54 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  if (a1)
  {
    a1 = (void *)[a1 init];
    if (a1)
    {
      uint64_t v6 = [v5 objectForKeyedSubscript:@"placeData"];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        id v7 = [GEOPDPlace alloc];
        if (a3) {
          uint64_t v8 = [(GEOPDPlace *)v7 initWithJSON:v6];
        }
        else {
          uint64_t v8 = [(GEOPDPlace *)v7 initWithDictionary:v6];
        }
        id v9 = (void *)v8;
        [a1 setPlaceData:v8];
      }
      id v10 = [v5 objectForKeyedSubscript:@"place"];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        uint64_t v11 = [GEOPlace alloc];
        if (a3) {
          uint64_t v12 = [(GEOPlace *)v11 initWithJSON:v10];
        }
        else {
          uint64_t v12 = [(GEOPlace *)v11 initWithDictionary:v10];
        }
        int v13 = (void *)v12;
        [a1 setPlace:v12];
      }
      uint64_t v14 = [v5 objectForKeyedSubscript:@"clientAttributes"];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        int v15 = [GEOMapItemClientAttributes alloc];
        if (a3) {
          uint64_t v16 = [(GEOMapItemClientAttributes *)v15 initWithJSON:v14];
        }
        else {
          uint64_t v16 = [(GEOMapItemClientAttributes *)v15 initWithDictionary:v14];
        }
        uint64_t v17 = (void *)v16;
        [a1 setClientAttributes:v16];
      }
      id v18 = [v5 objectForKeyedSubscript:@"placeResult"];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        uint64_t v19 = [GEOPlaceResult alloc];
        if (a3) {
          uint64_t v20 = [(GEOPlaceResult *)v19 initWithJSON:v18];
        }
        else {
          uint64_t v20 = [(GEOPlaceResult *)v19 initWithDictionary:v18];
        }
        uint64_t v21 = (void *)v20;
        [a1 setPlaceResult:v20];
      }
      uint64_t v22 = [v5 objectForKeyedSubscript:@"originatingCoordinate"];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        uint64_t v23 = [GEOLatLng alloc];
        if (a3) {
          uint64_t v24 = [(GEOLatLng *)v23 initWithJSON:v22];
        }
        else {
          uint64_t v24 = [(GEOLatLng *)v23 initWithDictionary:v22];
        }
        uint64_t v25 = (void *)v24;
        [a1 setOriginatingCoordinate:v24];
      }
      uint64_t v26 = [v5 objectForKeyedSubscript:@"internalDetourInfo"];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        uint64_t v27 = [GEOPDResultDetourInfo alloc];
        if (a3) {
          uint64_t v28 = [(GEOPDResultDetourInfo *)v27 initWithJSON:v26];
        }
        else {
          uint64_t v28 = [(GEOPDResultDetourInfo *)v27 initWithDictionary:v26];
        }
        id v29 = (void *)v28;
        [a1 setInternalDetourInfo:v28];
      }
      uint64_t v30 = [v5 objectForKeyedSubscript:@"mapsURL"];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        uint64_t v31 = (void *)[v30 copy];
        [a1 setMapsURL:v31];
      }
      if (a3) {
        uint64_t v32 = @"userValues";
      }
      else {
        uint64_t v32 = @"user_values";
      }
      uint64_t v33 = [v5 objectForKeyedSubscript:v32];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        v34 = [GEOMapItemStorageUserValues alloc];
        if (a3) {
          uint64_t v35 = [(GEOMapItemStorageUserValues *)v34 initWithJSON:v33];
        }
        else {
          uint64_t v35 = [(GEOMapItemStorageUserValues *)v34 initWithDictionary:v33];
        }
        long long v36 = (void *)v35;
        [a1 setUserValues:v35];
      }
      long long v37 = [v5 objectForKeyedSubscript:@"additionalPlaceDatas"];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        id v48 = v5;
        long long v51 = 0u;
        long long v52 = 0u;
        long long v49 = 0u;
        long long v50 = 0u;
        id v38 = v37;
        uint64_t v39 = [v38 countByEnumeratingWithState:&v49 objects:v53 count:16];
        if (v39)
        {
          uint64_t v40 = v39;
          uint64_t v41 = *(void *)v50;
          do
          {
            for (uint64_t i = 0; i != v40; ++i)
            {
              if (*(void *)v50 != v41) {
                objc_enumerationMutation(v38);
              }
              uint64_t v43 = *(void *)(*((void *)&v49 + 1) + 8 * i);
              objc_opt_class();
              if (objc_opt_isKindOfClass())
              {
                id v44 = [GEOPDPlace alloc];
                if (a3) {
                  uint64_t v45 = [(GEOPDPlace *)v44 initWithJSON:v43];
                }
                else {
                  uint64_t v45 = [(GEOPDPlace *)v44 initWithDictionary:v43];
                }
                long long v46 = (void *)v45;
                [a1 addAdditionalPlaceDatas:v45];
              }
            }
            uint64_t v40 = [v38 countByEnumeratingWithState:&v49 objects:v53 count:16];
          }
          while (v40);
        }

        id v5 = v48;
      }
    }
  }

  return a1;
}

- (GEOMapItemStorage)initWithJSON:(id)a3
{
  return (GEOMapItemStorage *)-[GEOMapItemStorage _initWithDictionary:isJSON:](self, a3, 1);
}

+ (BOOL)isValid:(id)a3
{
  return GEOMapItemStorageIsValid((char *)a3);
}

- (void)clearSensitiveFields:(unint64_t)a3
{
}

- (BOOL)hasGreenTeaWithValue:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  -[GEOMapItemStorage _readAdditionalPlaceDatas]((uint64_t)self);
  long long v13 = 0u;
  long long v14 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  id v5 = self->_additionalPlaceDatas;
  uint64_t v6 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v12;
    while (2)
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v12 != v8) {
          objc_enumerationMutation(v5);
        }
        if (objc_msgSend(*(id *)(*((void *)&v11 + 1) + 8 * v9), "hasGreenTeaWithValue:", v3, (void)v11))
        {

          return 1;
        }
        ++v9;
      }
      while (v7 != v9);
      uint64_t v7 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
      if (v7) {
        continue;
      }
      break;
    }
  }

  -[GEOMapItemStorage _readClientAttributes]((uint64_t)self);
  if ([(GEOMapItemClientAttributes *)self->_clientAttributes hasGreenTeaWithValue:v3]) {
    return 1;
  }
  -[GEOMapItemStorage _readOriginatingCoordinate]((uint64_t)self);
  if ([(GEOLatLng *)self->_originatingCoordinate hasGreenTeaWithValue:v3]) {
    return 1;
  }
  -[GEOMapItemStorage _readPlace]((uint64_t)self);
  if ([(GEOPlace *)self->_place hasGreenTeaWithValue:v3]) {
    return 1;
  }
  -[GEOMapItemStorage _readPlaceData]((uint64_t)self);
  if ([(GEOPDPlace *)self->_placeData hasGreenTeaWithValue:v3]) {
    return 1;
  }
  -[GEOMapItemStorage _readPlaceResult]((uint64_t)self);
  return [(GEOPlaceResult *)self->_placeResult hasGreenTeaWithValue:v3];
}

- (void)copyTo:(id)a3
{
  uint64_t v8 = (id *)a3;
  [(GEOMapItemStorage *)self readAll:0];
  os_unfair_lock_lock_with_options();
  objc_storeStrong(v8 + 4, self->_reader);
  *((_DWORD *)v8 + 30) = self->_readerMarkPos;
  *((_DWORD *)v8 + 31) = self->_readerMarkLength;
  os_unfair_lock_unlock(&self->_readerLock);
  if (self->_placeData) {
    objc_msgSend(v8, "setPlaceData:");
  }
  if (self->_place) {
    objc_msgSend(v8, "setPlace:");
  }
  if (self->_clientAttributes) {
    objc_msgSend(v8, "setClientAttributes:");
  }
  if (self->_placeResult) {
    objc_msgSend(v8, "setPlaceResult:");
  }
  if (self->_originatingCoordinate) {
    objc_msgSend(v8, "setOriginatingCoordinate:");
  }
  if (self->_internalDetourInfo) {
    objc_msgSend(v8, "setInternalDetourInfo:");
  }
  if (self->_mapsURL) {
    objc_msgSend(v8, "setMapsURL:");
  }
  if (self->_userValues) {
    objc_msgSend(v8, "setUserValues:");
  }
  if ([(GEOMapItemStorage *)self additionalPlaceDatasCount])
  {
    [v8 clearAdditionalPlaceDatas];
    unint64_t v4 = [(GEOMapItemStorage *)self additionalPlaceDatasCount];
    if (v4)
    {
      unint64_t v5 = v4;
      for (uint64_t i = 0; i != v5; ++i)
      {
        uint64_t v7 = [(GEOMapItemStorage *)self additionalPlaceDatasAtIndex:i];
        [v8 addAdditionalPlaceDatas:v7];
      }
    }
  }
}

- (unint64_t)hash
{
  [(GEOMapItemStorage *)self readAll:1];
  unint64_t v3 = [(GEOPDPlace *)self->_placeData hash];
  unint64_t v4 = [(GEOPlace *)self->_place hash] ^ v3;
  unint64_t v5 = [(GEOMapItemClientAttributes *)self->_clientAttributes hash];
  unint64_t v6 = v4 ^ v5 ^ [(GEOPlaceResult *)self->_placeResult hash];
  unint64_t v7 = [(GEOLatLng *)self->_originatingCoordinate hash];
  unint64_t v8 = v7 ^ [(GEOPDResultDetourInfo *)self->_internalDetourInfo hash];
  NSUInteger v9 = v6 ^ v8 ^ [(NSString *)self->_mapsURL hash];
  unint64_t v10 = [(GEOMapItemStorageUserValues *)self->_userValues hash];
  return v9 ^ v10 ^ [(NSMutableArray *)self->_additionalPlaceDatas hash];
}

- (void)mergeFrom:(id)a3
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  unint64_t v4 = (id *)a3;
  [v4 readAll:0];
  placeData = self->_placeData;
  id v6 = v4[11];
  if (placeData)
  {
    if (v6) {
      -[GEOPDPlace mergeFrom:](placeData, "mergeFrom:");
    }
  }
  else if (v6)
  {
    -[GEOMapItemStorage setPlaceData:](self, "setPlaceData:");
  }
  place = self->_place;
  id v8 = v4[13];
  if (place)
  {
    if (v8) {
      -[GEOPlace mergeFrom:](place, "mergeFrom:");
    }
  }
  else if (v8)
  {
    -[GEOMapItemStorage setPlace:](self, "setPlace:");
  }
  clientAttributes = self->_clientAttributes;
  id v10 = v4[7];
  if (clientAttributes)
  {
    if (v10) {
      -[GEOMapItemClientAttributes mergeFrom:](clientAttributes, "mergeFrom:");
    }
  }
  else if (v10)
  {
    -[GEOMapItemStorage setClientAttributes:](self, "setClientAttributes:");
  }
  placeResult = self->_placeResult;
  id v12 = v4[12];
  if (placeResult)
  {
    if (v12) {
      -[GEOPlaceResult mergeFrom:](placeResult, "mergeFrom:");
    }
  }
  else if (v12)
  {
    -[GEOMapItemStorage setPlaceResult:](self, "setPlaceResult:");
  }
  originatingCoordinate = self->_originatingCoordinate;
  id v14 = v4[10];
  if (originatingCoordinate)
  {
    if (v14) {
      -[GEOLatLng mergeFrom:](originatingCoordinate, "mergeFrom:");
    }
  }
  else if (v14)
  {
    -[GEOMapItemStorage setOriginatingCoordinate:](self, "setOriginatingCoordinate:");
  }
  internalDetourInfo = self->_internalDetourInfo;
  id v16 = v4[8];
  if (internalDetourInfo)
  {
    if (v16) {
      -[GEOPDResultDetourInfo mergeFrom:](internalDetourInfo, "mergeFrom:");
    }
  }
  else if (v16)
  {
    -[GEOMapItemStorage setInternalDetourInfo:](self, "setInternalDetourInfo:");
  }
  if (v4[9]) {
    -[GEOMapItemStorage setMapsURL:](self, "setMapsURL:");
  }
  userValues = self->_userValues;
  id v18 = v4[14];
  if (userValues)
  {
    if (v18) {
      -[GEOMapItemStorageUserValues mergeFrom:](userValues, "mergeFrom:");
    }
  }
  else if (v18)
  {
    -[GEOMapItemStorage setUserValues:](self, "setUserValues:");
  }
  long long v26 = 0u;
  long long v27 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  id v19 = v4[6];
  uint64_t v20 = [v19 countByEnumeratingWithState:&v24 objects:v28 count:16];
  if (v20)
  {
    uint64_t v21 = v20;
    uint64_t v22 = *(void *)v25;
    do
    {
      for (uint64_t i = 0; i != v21; ++i)
      {
        if (*(void *)v25 != v22) {
          objc_enumerationMutation(v19);
        }
        -[GEOMapItemStorage addAdditionalPlaceDatas:](self, "addAdditionalPlaceDatas:", *(void *)(*((void *)&v24 + 1) + 8 * i), (void)v24);
      }
      uint64_t v21 = [v19 countByEnumeratingWithState:&v24 objects:v28 count:16];
    }
    while (v21);
  }
}

- (PBUnknownFields)unknownFields
{
  p_readerLocuint64_t k = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  if ((*(_WORD *)&self->_flags & 1) == 0)
  {
    reader = self->_reader;
    if (reader)
    {
      unint64_t v5 = reader;
      objc_sync_enter(v5);
      GEOMapItemStorageReadSpecified((uint64_t)self, (unint64_t)self->_reader, (int *)&unknownFields_tags_1132);
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
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  p_readerLocuint64_t k = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(_WORD *)&self->_flags |= 0x401u;
  os_unfair_lock_unlock(p_readerLock);
  unknownFields = self->_unknownFields;
  self->_unknownFields = 0;

  if (v3)
  {
    [(GEOMapItemStorage *)self readAll:0];
    [(GEOPDPlace *)self->_placeData clearUnknownFields:1];
    [(GEOPlace *)self->_place clearUnknownFields:1];
    [(GEOMapItemClientAttributes *)self->_clientAttributes clearUnknownFields:1];
    [(GEOPlaceResult *)self->_placeResult clearUnknownFields:1];
    [(GEOLatLng *)self->_originatingCoordinate clearUnknownFields:1];
    [(GEOPDResultDetourInfo *)self->_internalDetourInfo clearUnknownFields:1];
    [(GEOMapItemStorageUserValues *)self->_userValues clearUnknownFields:1];
    long long v14 = 0u;
    long long v15 = 0u;
    long long v12 = 0u;
    long long v13 = 0u;
    unint64_t v7 = self->_additionalPlaceDatas;
    uint64_t v8 = [(NSMutableArray *)v7 countByEnumeratingWithState:&v12 objects:v16 count:16];
    if (v8)
    {
      uint64_t v9 = v8;
      uint64_t v10 = *(void *)v13;
      do
      {
        uint64_t v11 = 0;
        do
        {
          if (*(void *)v13 != v10) {
            objc_enumerationMutation(v7);
          }
          objc_msgSend(*(id *)(*((void *)&v12 + 1) + 8 * v11++), "clearUnknownFields:", 1, (void)v12);
        }
        while (v9 != v11);
        uint64_t v9 = [(NSMutableArray *)v7 countByEnumeratingWithState:&v12 objects:v16 count:16];
      }
      while (v9);
    }
  }
}

@end