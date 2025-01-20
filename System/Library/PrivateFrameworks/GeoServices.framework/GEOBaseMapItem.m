@interface GEOBaseMapItem
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
- (BOOL)_hasTravelTimeForTransportType:(int)a3;
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
- (NSString)eventName;
- (NSString)name;
- (NSString)secondaryName;
- (NSString)secondarySpokenName;
- (NSTimeZone)timezone;
- (NSURL)_providerURL;
- (NSURL)_webURL;
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
- (id)_firstRelatedPlaceListForType:(int)a3;
- (id)_localizedCategoryNamesForType:(unsigned int)a3;
- (id)_relatedPlaceListForComponentIdentifier:(int)a3;
- (id)_spokenAddressForLocale:(id)a3;
- (id)_transitAttributionSummaries;
- (id)_urlForPhotoWithUID:(id)a3;
- (id)_urlForReview:(id)a3;
- (id)_urlForWritingAReview;
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
- (int)_recommendedTransportType;
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
- (unsigned)_maxScoreForPriceRange;
- (unsigned)_priceRange;
- (unsigned)_resultSnippetDistanceDisplayThreshold;
- (unsigned)_sampleSizeForUserRatingScore;
- (unsigned)_travelDistanceForTransportType:(int)a3;
- (unsigned)_travelTimeForTransportType:(int)a3;
- (unsigned)_wifiFingerprintConfidence;
- (void)loadTransitAttributionDetails:(id)a3;
@end

@implementation GEOBaseMapItem

- (GEOPlaceResult)_placeResult
{
  return 0;
}

- (GEOPDPlace)_placeData
{
  return 0;
}

- (GEOMapItemClientAttributes)_clientAttributes
{
  return 0;
}

- (int)referenceFrame
{
  if (+[GEOLocationShifter isLocationShiftRequiredForCoordinate:](GEOLocationShifter, "isLocationShiftRequiredForCoordinate:"))
  {
    return 2;
  }
  else
  {
    return 1;
  }
}

- (BOOL)isEqualToMapItem:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)GEOBaseMapItem;
  return [(GEOBaseMapItem *)&v4 isEqual:a3];
}

- (BOOL)isValid
{
  return 0;
}

- (NSString)name
{
  return 0;
}

- (id)spokenNameForLocale:(id)a3
{
  return 0;
}

- (NSString)secondaryName
{
  return 0;
}

- (NSString)secondarySpokenName
{
  return 0;
}

- (NSData)encodedData
{
  return 0;
}

- (BOOL)isDisputed
{
  return 0;
}

- ($F24F406B2B787EFB06265DBA3D28CBD5)coordinate
{
  double v2 = -180.0;
  double v3 = -180.0;
  result.var1 = v3;
  result.var0 = v2;
  return result;
}

- ($F24F406B2B787EFB06265DBA3D28CBD5)labelCoordinate
{
  double v2 = -180.0;
  double v3 = -180.0;
  result.var1 = v3;
  result.var0 = v2;
  return result;
}

- (GEOMapRegion)displayMapRegion
{
  return 0;
}

- (GEOMapRegion)displayMapRegionOrNil
{
  return 0;
}

- (GEOMapRegion)offlineDownloadRegion
{
  double v3 = [(GEOBaseMapItem *)self displayMapRegion];
  objc_super v4 = v3;
  if (v3)
  {
    id v5 = v3;
  }
  else
  {
    id v5 = [(GEOBaseMapItem *)self geoFenceMapRegion];
  }
  v6 = v5;

  return (GEOMapRegion *)v6;
}

- (BOOL)supportsOfflineMaps
{
  return 0;
}

- (BOOL)hasDisplayMinZoom
{
  return 0;
}

- (float)displayMinZoom
{
  return 0.0;
}

- (BOOL)hasDisplayMaxZoom
{
  return 0;
}

- (float)displayMaxZoom
{
  return 0.0;
}

- (GEOMapRegion)geoFenceMapRegion
{
  return 0;
}

- (GEOMapRegion)geoFenceMapRegionOrNil
{
  return 0;
}

- (NSDictionary)addressDictionary
{
  return 0;
}

- (NSArray)areasOfInterest
{
  return 0;
}

- (NSTimeZone)timezone
{
  return 0;
}

- (int)mapDisplayType
{
  return 0;
}

- (GEOLocalizedString)disclaimerText
{
  return 0;
}

- (GEOPDURLData)urlData
{
  return 0;
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

- (BOOL)_isPartiallyClientized
{
  return 0;
}

- (BOOL)_hasResolvablePartialInformation
{
  return 1;
}

- (BOOL)_responseStatusIsIncomplete
{
  return 0;
}

- (BOOL)_hasTravelTimeForTransportType:(int)a3
{
  return 0;
}

- (int)_placeType
{
  return 0;
}

- (GEOPlace)_place
{
  return 0;
}

- (NSData)_placeDataAsData
{
  return 0;
}

- (GEOAddress)geoAddress
{
  return 0;
}

- (int)_addressGeocodeAccuracy
{
  return -1;
}

- (id)_spokenAddressForLocale:(id)a3
{
  return 0;
}

- (unsigned)_travelTimeForTransportType:(int)a3
{
  return 0;
}

- (unsigned)_travelDistanceForTransportType:(int)a3
{
  return 0;
}

- (id)_arrivalMapRegionForTransportType:(int)a3
{
  return 0;
}

- (NSArray)_roadAccessPoints
{
  return 0;
}

- (BOOL)_hasResultProviderID
{
  return 0;
}

- (int)_resultProviderID
{
  return 0;
}

- (BOOL)_isTransitDisplayFeature
{
  double v2 = [(GEOBaseMapItem *)self _styleAttributes];
  char v3 = [v2 isTransit];

  return v3;
}

- (BOOL)_hasTransit
{
  return 0;
}

- (GEOMapItemTransitInfo)_transitInfo
{
  return 0;
}

- (GEOTransitAttribution)_transitAttribution
{
  return 0;
}

- (id)_transitAttributionSummaries
{
  return 0;
}

- (void)loadTransitAttributionDetails:(id)a3
{
  if (a3) {
    (*((void (**)(id, void, void))a3 + 2))(a3, 0, 0);
  }
}

- (GEOTransitVehiclePosition)_transitVehiclePosition
{
  return 0;
}

- (NSArray)supportedTransitPaymentMethods
{
  return 0;
}

- (NSArray)transitPaymentMethodSuggestions
{
  return 0;
}

- (double)cachingRadiusMeters
{
  return 0.0;
}

- (BOOL)_hasFlyover
{
  return 0;
}

- (GEOPDFlyover)_flyover
{
  return 0;
}

- (NSString)_flyoverAnnouncementMessage
{
  return 0;
}

- (GEOMuninViewState)_muninViewState
{
  return 0;
}

- (GEOStorefrontInfo)_storefrontInfo
{
  return 0;
}

- (GEOStorefrontPresentationInfo)_storefrontPresentationInfo
{
  return 0;
}

- (BOOL)_hasMUID
{
  return 0;
}

- (unint64_t)_muid
{
  return 0;
}

- (GEOMapItemIdentifier)_identifier
{
  if ([(GEOBaseMapItem *)self _hasMUID])
  {
    char v3 = [GEOMapItemIdentifier alloc];
    unint64_t v4 = [(GEOBaseMapItem *)self _muid];
    uint64_t v5 = [(GEOBaseMapItem *)self _resultProviderID];
    [(GEOBaseMapItem *)self coordinate];
    v6 = -[GEOMapItemIdentifier initWithMUID:resultProviderID:coordinate:](v3, "initWithMUID:resultProviderID:coordinate:", v4, v5);
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (NSSet)_alternateIdentifiers
{
  return 0;
}

- (int)_placeDisplayType
{
  return 0;
}

- (BOOL)_hasAreaInMeters
{
  return 0;
}

- (double)_areaInMeters
{
  return 0.0;
}

- (NSString)_businessURL
{
  return 0;
}

- (BOOL)_hasUserRatingScore
{
  return 0;
}

- (unsigned)_sampleSizeForUserRatingScore
{
  return 0;
}

- (float)_normalizedUserRatingScore
{
  return 0.0;
}

- (BOOL)_hasPriceRange
{
  return 0;
}

- (unsigned)_priceRange
{
  return 0;
}

- (unsigned)_maxScoreForPriceRange
{
  return 0;
}

- (NSString)_resultSnippetLocationString
{
  return 0;
}

- (unsigned)_resultSnippetDistanceDisplayThreshold
{
  return -1;
}

- (NSArray)_childItems
{
  return 0;
}

- (BOOL)_hasTelephone
{
  return 0;
}

- (NSString)_telephone
{
  return 0;
}

- (BOOL)_optsOutOfTelephoneAds
{
  return 0;
}

- (NSString)_disambiguationName
{
  return 0;
}

- (id)_localizedCategoryNamesForType:(unsigned int)a3
{
  return 0;
}

- (BOOL)_hasLocalizedCategoryNamesForType:(unsigned int)a3
{
  return 0;
}

- (BOOL)_hasAnyAmenities
{
  return 0;
}

- (NSArray)_amenities
{
  return 0;
}

- (BOOL)_hasOperatingHours
{
  return 0;
}

- (BOOL)_hasCurrentOperatingHours
{
  return 0;
}

- (unint64_t)_openingHoursOptions
{
  return 1;
}

- (BOOL)_hasEncyclopedicInfo
{
  return 0;
}

- (GEOEncyclopedicInfo)_encyclopedicInfo
{
  return 0;
}

- (GEOInlineRapEnablement)_inlineRapEnablement
{
  return 0;
}

- (BOOL)_needsAttribution
{
  return 0;
}

- (NSURL)_webURL
{
  return 0;
}

- (NSURL)_providerURL
{
  return 0;
}

- (NSString)_vendorID
{
  return 0;
}

- (id)_urlForPhotoWithUID:(id)a3
{
  return 0;
}

- (id)_urlForReview:(id)a3
{
  return 0;
}

- (id)_urlForWritingAReview
{
  return 0;
}

- (NSString)_poiSurveyURLString
{
  return 0;
}

- (NSString)_poiPinpointURLString
{
  return 0;
}

- (int)_recommendedTransportType
{
  return 4;
}

- (GEOMapItemPlaceAttribution)_attribution
{
  return 0;
}

- (GEOMapItemPhotosAttribution)_photosAttribution
{
  return 0;
}

- (NSArray)_allPhotoAttributions
{
  return 0;
}

- (GEOMapItemReviewsAttribution)_reviewsAttribution
{
  return 0;
}

- (NSString)_poiCategory
{
  return 0;
}

- (GEOFeatureStyleAttributes)_styleAttributes
{
  return 0;
}

- (unint64_t)_customIconID
{
  return 0;
}

- (NSString)_mapsCategoryId
{
  return 0;
}

- (NSArray)_alternateMapsCategoryIDs
{
  return (NSArray *)MEMORY[0x1E4F1CBF0];
}

- (NSNumber)_mapsCategoryMUID
{
  return 0;
}

- (NSArray)_alternateMapsCategoryMUIDs
{
  return (NSArray *)MEMORY[0x1E4F1CBF0];
}

- (NSArray)_additionalPlaceInfos
{
  return 0;
}

- (id)_asPlaceInfo
{
  return 0;
}

- (NSArray)_reviews
{
  return 0;
}

- (NSArray)_tips
{
  return 0;
}

- (NSArray)_photos
{
  return 0;
}

- (BOOL)_hasPOIClaim
{
  return 0;
}

- (GEOPOIClaim)_poiClaim
{
  return 0;
}

- (NSArray)spatialMappedCategories
{
  return 0;
}

- (BOOL)_hasFeatureLink
{
  return 0;
}

- (GEORestaurantFeaturesLink)_featureLink
{
  return 0;
}

- (int)_parsecSectionType
{
  return 0;
}

- (BOOL)_isStandaloneBrand
{
  return 0;
}

- (BOOL)_hasBrandMUID
{
  return 0;
}

- (unint64_t)_brandMUID
{
  return 0;
}

- (GEOMessageLink)_messageLink
{
  return 0;
}

- (NSArray)_quickLinks
{
  return 0;
}

- (NSArray)_secondaryQuickLinks
{
  return 0;
}

- (GEOExploreGuides)_exploreGuides
{
  return 0;
}

- (NSArray)_placeCollections
{
  return 0;
}

- (NSArray)_searchResultPhotoCarousel
{
  return 0;
}

- (NSArray)_placeCollectionsIds
{
  return 0;
}

- (BOOL)_hasPlaceCollectionPullQuotes
{
  return 0;
}

- (NSArray)_placeCollectionPullQuotes
{
  return 0;
}

- (NSArray)_relatedPlaceLists
{
  return 0;
}

- (id)_relatedPlaceListForComponentIdentifier:(int)a3
{
  return 0;
}

- (id)_firstRelatedPlaceListForType:(int)a3
{
  return 0;
}

- (BOOL)_hasEVCharger
{
  return 0;
}

- (GEOEVCharger)_evCharger
{
  return 0;
}

- (GEOPlacecardLayoutData)_placecardLayoutData
{
  return 0;
}

- (GEOMapItemDetourInfo)detourInfo
{
  return 0;
}

- (BOOL)hasExpiredComponents
{
  return 0;
}

- (id)addressObject
{
  return 0;
}

- (id)shortAddress
{
  return 0;
}

- (id)weatherDisplayName
{
  return 0;
}

- (NSData)externalTransitStationCode
{
  return 0;
}

- (GEOAssociatedApp)_associatedApp
{
  return 0;
}

- (BOOL)_hasBusinessHours
{
  return 0;
}

- (NSArray)_businessHours
{
  return 0;
}

- (GEOBusinessAssets)businessAssets
{
  return 0;
}

- (BOOL)_hasLinkedServices
{
  return 0;
}

- (NSArray)_linkedServices
{
  return 0;
}

- (BOOL)_hasVenueFeatureType
{
  return 0;
}

- (int)_venueFeatureType
{
  return 0;
}

- (GEOMapItemVenueInfo)_venueInfo
{
  return 0;
}

- (NSArray)_browseCategories
{
  return 0;
}

- (GEOMiniBrowseCategories)_miniBrowseCategories
{
  return 0;
}

- (int)_placeDisplayStyle
{
  return 0;
}

- (GEOAnnotatedItemList)_annotatedItemList
{
  return 0;
}

- (BOOL)_hasWifiFingerprintConfidence
{
  return 0;
}

- (unsigned)_wifiFingerprintConfidence
{
  return 0;
}

- (BOOL)_hasWifiFingerprintLabelType
{
  return 0;
}

- (int)_wifiFingerprintLabelType
{
  return 0;
}

- (BOOL)_hasWifiFingerprintLabelStatusCode
{
  return 0;
}

- (int)_wifiFingerprintLabelStatusCode
{
  return 5;
}

- (id)_bestAvatarBrandIconURLForSize:(CGSize)a3 allowSmaller:(BOOL)a4
{
  return 0;
}

- (id)_bestNavbarBrandIconURLForSize:(CGSize)a3 allowSmaller:(BOOL)a4
{
  return 0;
}

- (id)_bestHeroBrandIconURLForSize:(CGSize)a3 allowSmaller:(BOOL)a4
{
  return 0;
}

- (GEOPriceDescription)_priceDescription
{
  return 0;
}

- (GEOMapItemContainedPlace)_containedPlace
{
  return 0;
}

- (BOOL)_isInLinkedPlaceRelationship
{
  return 0;
}

- (BOOL)_hasGroundViewLocationId
{
  return 0;
}

- (unint64_t)_groundViewLocationId
{
  return 0;
}

- (BOOL)hasVenueCapacity
{
  return 0;
}

- (int64_t)venueCapacity
{
  return 0x7FFFFFFFFFFFFFFFLL;
}

- (NSArray)spatialMappedPlaceCategories
{
  return 0;
}

- (NSString)_walletCategoryIdentifier
{
  return 0;
}

- (NSString)_walletMapsCategoryIdentifier
{
  return 0;
}

- (NSString)_walletCategoryLocalizedStringLocale
{
  return 0;
}

- (NSString)_walletCategoryLocalizedString
{
  return 0;
}

- (GEOStyleAttributes)_walletCategoryStyling
{
  return 0;
}

- (NSString)_walletPlaceLocalizedStringLocale
{
  return 0;
}

- (NSString)_walletPlaceLocalizedString
{
  return 0;
}

- (GEOStyleAttributes)_walletPlaceStyling
{
  return 0;
}

- (BOOL)_enableRAPLightweightFeedback
{
  return 0;
}

- (BOOL)_showSuggestAnEditButton
{
  return 0;
}

- (int)_RAPFlowType
{
  return 0;
}

- (NSArray)_alternateSearchableNames
{
  return 0;
}

- (BOOL)_hasAppleRatings
{
  return 0;
}

- (NSArray)_appleRatings
{
  return 0;
}

- (GEOAppleRating)_overallAppleRating
{
  return 0;
}

- (GEOPlaceQuestionnaire)_placeQuestionnaire
{
  return 0;
}

- (BOOL)_hasPlaceQuestionnaire
{
  return 0;
}

- (NSArray)_identifierHistory
{
  return 0;
}

- (BOOL)_canDownloadMorePhotos
{
  return 0;
}

- (unint64_t)_totalPhotoCount
{
  return 0;
}

- (NSArray)_captionedPhotoAlbums
{
  return 0;
}

- (BOOL)_hasCaptionedPhotoAlbum
{
  return 0;
}

- (NSString)_iso3166CountryCode
{
  return 0;
}

- (NSString)_iso3166SubdivisionCode
{
  return 0;
}

- (NSString)_bestAvailableCountryCode
{
  return 0;
}

- (BOOL)_hasEnclosingPlace
{
  return 0;
}

- (GEOEnclosingPlace)_enclosingPlace
{
  return 0;
}

- (BOOL)_hasAreaHighlightId
{
  return 0;
}

- (unint64_t)_areaHighlightId
{
  return 0;
}

- (BOOL)_hasPlaceDescription
{
  return 0;
}

- (NSString)_placeDescription
{
  return 0;
}

- (GEOEnhancedPlacement)_enhancedPlacement
{
  return 0;
}

- (GEOLabelGeometry)_labelGeometry
{
  return 0;
}

- (GEOViewportFrame)_viewportFrame
{
  return 0;
}

- (NSArray)_externalActionLinks
{
  return 0;
}

- (GEOEnrichmentInfo)_enrichmentInfo
{
  return 0;
}

- (GEOEnrichmentData)_enrichmentData
{
  return 0;
}

- (GEOTrailHead)_trailHead
{
  return 0;
}

- (GEOHikeSummary)_hikeSummary
{
  return 0;
}

- (GEOPDHikeAssociatedInfo)_hikeAssociatedInfo
{
  return 0;
}

- (GEOPDHikeGeometry)_hikeGeometry
{
  return 0;
}

- (int)_hikeGeometryElevationModel
{
  return 0;
}

- (GEOTooltip)_tooltip
{
  return 0;
}

- (float)_photosMemoryScore
{
  return -1.0;
}

- (int)_placeCategoryType
{
  return 0;
}

@end