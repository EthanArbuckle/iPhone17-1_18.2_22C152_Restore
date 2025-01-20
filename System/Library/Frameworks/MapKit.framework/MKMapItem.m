@interface MKMapItem
+ (BOOL)_isDirectionsActionURL:(id)a3;
+ (BOOL)_shouldUseUniversalLinkForMapItems:(id)a3 options:(id)a4;
+ (BOOL)openMapsWithItems:(NSArray *)mapItems launchOptions:(NSDictionary *)launchOptions;
+ (BOOL)supportsSecureCoding;
+ (BOOL)valueIsValid:(id)a3 forKey:(id)a4;
+ (MKMapItem)mapItemForCurrentLocation;
+ (MKMapItem)mapItemWithDictionary:(id)a3;
+ (MKMapItem)mapItemWithSerializedPlaceData:(id)a3;
+ (MKMapItem)mapItemWithSerializedPlaceData:(id)a3 serializedDetourInfo:(id)a4 currentLocation:(BOOL)a5;
+ (NSArray)readableTypeIdentifiersForItemProvider;
+ (NSArray)writableTypeIdentifiersForItemProvider;
+ (id)_deserializeResourceOptionsFromURL:(id)a3 error:(id *)a4;
+ (id)_itemWithContact:(id)a3 geoMapItem:(id)a4;
+ (id)_itemWithGeoMapItem:(id)a3;
+ (id)_launchOptionsFromResourceOptionsDictionary:(id)a3;
+ (id)_launchOptionsWithOptions:(id)a3;
+ (id)_localizedNextOpeningDayOftheWeekFormatter;
+ (id)_localizedNextOpeningHoursFormatter;
+ (id)_mapItemBackedByURL:(id)a3;
+ (id)_mapItemFromVCardRepresentation:(id)a3 error:(id *)a4;
+ (id)_mapItemWithWithLocation:(id)a3 addressDictionary:(id)a4 name:(id)a5 businessURL:(id)a6 phoneNumber:(id)a7 sessionID:(id)a8 muid:(unint64_t)a9 attributionID:(id)a10 sampleSizeForUserRatingScore:(unsigned int)a11 normalizedUserRatingScore:(float)a12;
+ (id)_sharedSessionURLForPunchoutURL:(id)a3;
+ (id)_sharedSessionUserInfoForPunchoutUserInfo:(id)a3;
+ (id)_sourceAppIdFromLaunchURL:(id)a3;
+ (id)_sourceAppIdFromLaunchUserInfo:(id)a3;
+ (id)_universalLinkForMapItems:(id)a3 options:(id)a4;
+ (id)_urlForLocation:(id)a3 address:(id)a4 label:(id)a5 options:(id)a6;
+ (id)_urlForMapItemHandles:(id)a3 options:(id)a4;
+ (id)contactsAddressDictionaryFromGeoAddressDictionary:(id)a3;
+ (id)contactsAddressKeysForGeoAddressKeys;
+ (id)launchOptionsFromURL:(id)a3;
+ (id)mapItemsFromURL:(id)a3 options:(id *)a4;
+ (id)objectWithItemProviderData:(id)a3 typeIdentifier:(id)a4 error:(id *)a5;
+ (id)plistCompatibleDictionaryFromStandardOptions:(id)a3;
+ (id)sanitizeArray:(id)a3 forKey:(id)a4;
+ (id)sanitizeDictionary:(id)a3;
+ (id)sanitizeObject:(id)a3 forKey:(id)a4;
+ (id)standardOptionsFromPlistCompatibleDictionary:(id)a3;
+ (id)ticketForMapsDataString:(id)a3 name:(id)a4;
+ (id)urlForMapItem:(id)a3 options:(id)a4;
+ (id)urlForMapItems:(id)a3 options:(id)a4;
+ (void)_fillOutRequest:(id)a3 withMapsDataString:(id)a4;
+ (void)_mapItemFromHandle:(id)a3 completionHandler:(id)a4;
+ (void)_mapItemsFromHandleURL:(id)a3 completionHandler:(id)a4;
+ (void)_mapItemsFromPunchInHintsURL:(id)a3 maxResults:(unsigned int)a4 completionHandler:(id)a5;
+ (void)_mapItemsWithSerializedPlaceDataResponse:(id)a3 handler:(id)a4;
+ (void)openMapsWithItems:(NSArray *)mapItems launchOptions:(NSDictionary *)launchOptions fromScene:(UIScene *)scene completionHandler:(void *)completion;
+ (void)openMapsWithItems:(id)a3 launchOptions:(id)a4 completionHandler:(id)a5;
- (BOOL)_acceptsApplePay;
- (BOOL)_browseCategory_canDisplayBrowseCategoriesForPlace;
- (BOOL)_browseCategory_canDisplayBrowseCategoriesForVenue;
- (BOOL)_browseCategory_isVenueItem;
- (BOOL)_canBeClaimed;
- (BOOL)_canGetDirections;
- (BOOL)_hasAcceptsApplePayAmenity;
- (BOOL)_hasAnyAmenities;
- (BOOL)_hasAreaHighlightId;
- (BOOL)_hasBrandMUID;
- (BOOL)_hasBusinessHours;
- (BOOL)_hasChargerNumberString;
- (BOOL)_hasCorrectedHomeWorkAddress;
- (BOOL)_hasCorrectedHomeWorkCoordinate;
- (BOOL)_hasDisplayMaxZoom;
- (BOOL)_hasDisplayMinZoom;
- (BOOL)_hasEncyclopedicInfo;
- (BOOL)_hasFlyover;
- (BOOL)_hasHikeInfo;
- (BOOL)_hasLinkedServices;
- (BOOL)_hasLocalizedCategoryNamesForType:(unsigned int)a3;
- (BOOL)_hasLocalizedOperatingHours;
- (BOOL)_hasLookAroundStorefront;
- (BOOL)_hasMUID;
- (BOOL)_hasMuninViewState;
- (BOOL)_hasOperatingHours;
- (BOOL)_hasPOIClaim;
- (BOOL)_hasPriceDescription;
- (BOOL)_hasPriceRange;
- (BOOL)_hasResolvablePartialInformation;
- (BOOL)_hasRestaurantExtensionInfo;
- (BOOL)_hasResultProviderID;
- (BOOL)_hasTransit;
- (BOOL)_hasTransitDisplayName;
- (BOOL)_hasTransitLabels;
- (BOOL)_hasUserRatingScore;
- (BOOL)_hasVenueFeatureType;
- (BOOL)_isClaimed;
- (BOOL)_isEmptyContactMapItem;
- (BOOL)_isEquivalentURLRepresentationTo:(id)a3;
- (BOOL)_isMapItemTypeAddress;
- (BOOL)_isMapItemTypeBrand;
- (BOOL)_isMapItemTypeBusiness;
- (BOOL)_isMapItemTypeSettlement;
- (BOOL)_isMapItemTypeTransit;
- (BOOL)_isMapItemTypeUnknown;
- (BOOL)_isMessageIDVerified;
- (BOOL)_isPartiallyClientized;
- (BOOL)_isStandAloneBrand;
- (BOOL)_mapkit_canAtLeastOneAttributionShowAddPhotosLocally;
- (BOOL)_mapkit_canAtLeastOneAttributionShowPhotosLocally;
- (BOOL)_mapkit_hasFlatListOfPhotos;
- (BOOL)_mapkit_hasMultiplePhotoVendors;
- (BOOL)_mapkit_hasSinglePhotoVendor;
- (BOOL)_mapkit_supportsFullScreenExperience;
- (BOOL)_needsAttribution;
- (BOOL)_phoneNumberOptsOutOfAds;
- (BOOL)_responseStatusIsIncomplete;
- (BOOL)_restaurantLink_hasFeatureType:(unint64_t)a3;
- (BOOL)hasAmenityType:(int)a3;
- (BOOL)isCurrentLocation;
- (BOOL)isEqual:(id)a3;
- (BOOL)isPlaceHolder;
- (BOOL)openInMapsWithLaunchOptions:(NSDictionary *)launchOptions;
- (BOOL)valueForAmenityType:(int)a3;
- (CLLocationCoordinate2D)_coordinate;
- (CLLocationCoordinate2D)_labelCoordinate;
- (CLLocationCoordinate2D)_presentCoordinate;
- (GEOAddress)_geoAddress;
- (GEOAnnotatedItemList)_annotatedItemList;
- (GEOBusinessAssets)_businessAssets;
- (GEOBusinessHours)_messageBusinessHours;
- (GEOEVChargerAvailability)_realTimeAvailableEVCharger;
- (GEOEncyclopedicInfo)_encyclopedicInfo;
- (GEOEnhancedPlacement)_enhancedPlacement;
- (GEOEnrichmentData)_enrichmentData;
- (GEOEnrichmentInfo)_enrichmentInfo;
- (GEOExploreGuides)_exploreGuides;
- (GEOFactoid)_hikingTrailDifficultyFactoid;
- (GEOFactoid)_hikingTrailLengthFactoid;
- (GEOFactoid)_hikingTrailPointToPointFactoid;
- (GEOFeatureStyleAttributes)_styleAttributes;
- (GEOHikeSummary)_hikeSummary;
- (GEOLabelGeometry)_labelGeometry;
- (GEOMapItemDetourInfo)_detourInfo;
- (GEOMapItemPrivate)_geoMapItem;
- (GEOMapItemStorage)_geoMapItemStorageForDragAndDrop;
- (GEOMapItemStorage)_geoMapItemStorageForPersistence;
- (GEOMapItemStorageUserValues)userValues;
- (GEOMapItemTransitInfo)_transitInfo;
- (GEOMapItemVenueInfo)_venueInfo;
- (GEOMapRegion)_displayMapRegion;
- (GEOMapRegion)_geoFenceMapRegion;
- (GEOMiniBrowseCategories)_miniBrowseCategories;
- (GEOModuleLayoutEntry)_placecardLayout;
- (GEOMuninViewState)_muninViewState;
- (GEOPDFlyover)_flyover;
- (GEOPDHikeAssociatedInfo)_hikeAssociatedInfo;
- (GEOPDHikeGeometry)_hikeGeometry;
- (GEOPOIClaim)_poiClaim;
- (GEOPlace)place;
- (GEOTrailHead)_trailHead;
- (GEOTransitAttribution)_transitAttribution;
- (GEOViewportFrame)_viewportFrame;
- (MKMapItem)init;
- (MKMapItem)initWithAddressDictionary:(id)a3;
- (MKMapItem)initWithCLLocation:(id)a3;
- (MKMapItem)initWithCLLocation:(id)a3 placeType:(int)a4;
- (MKMapItem)initWithCoder:(id)a3;
- (MKMapItem)initWithContact:(id)a3;
- (MKMapItem)initWithGeoMapItem:(id)a3 isPlaceHolderPlace:(BOOL)a4;
- (MKMapItem)initWithGeoMapItemAsCurrentLocation:(id)a3;
- (MKMapItem)initWithPlace:(id)a3;
- (MKMapItem)initWithPlace:(id)a3 isPlaceHolderPlace:(BOOL)a4;
- (MKMapItem)initWithPlacemark:(MKPlacemark *)placemark;
- (MKMapItem)initWithUrlRepresentation:(id)a3;
- (MKMapItemIdentifier)identifier;
- (MKMapItemMetadata)metadata;
- (MKPlacemark)placemark;
- (MKPointOfInterestCategory)pointOfInterestCategory;
- (MKTransitInfoPreload)_preloadedTransitInfo;
- (NSArray)_allPhotoAttributions;
- (NSArray)_alternativeAppAdamIds;
- (NSArray)_amenities;
- (NSArray)_browseCategories;
- (NSArray)_businessHours;
- (NSArray)_externalActionLinks;
- (NSArray)_linkedServices;
- (NSArray)_placeCollectionIds;
- (NSArray)_placeCollections;
- (NSArray)_quickLinks;
- (NSArray)_relatedPlaceLists;
- (NSArray)_reviews;
- (NSArray)_searchResultPhotoCarousel;
- (NSArray)_secondaryQuickLinks;
- (NSArray)_tips;
- (NSData)_externalTransitStationCode;
- (NSData)_handle;
- (NSData)_placeDataAsData;
- (NSDate)_transitInfoUpdatedDate;
- (NSNumber)_preferedAppAdamID;
- (NSSet)alternateIdentifiers;
- (NSString)_chargerNumberString;
- (NSString)_firstLocalizedCategoryName;
- (NSString)_flyoverAnnouncementMessage;
- (NSString)_localizedResponseTime;
- (NSString)_localizedSampleSizeForUserRatingScoreString;
- (NSString)_messageID;
- (NSString)_messageURLString;
- (NSString)_poiPinpointURLString;
- (NSString)_poiSurveyURLString;
- (NSString)_priceDescription;
- (NSString)_priceRangeString;
- (NSString)_reviewsDisplayName;
- (NSString)_secondaryName;
- (NSString)_secondarySpokenName;
- (NSString)_transitDisplayName;
- (NSString)_vendorID;
- (NSString)description;
- (NSString)formattedNumberOfReviews;
- (NSString)formattedNumberOfReviewsIncludingProvider;
- (NSString)name;
- (NSString)phoneNumber;
- (NSString)reviewsProviderDisplayName;
- (NSString)yelpID;
- (NSTimeZone)timeZone;
- (NSURL)_providerURL;
- (NSURL)_webURL;
- (NSURL)url;
- (UIColor)_navBackgroundbrandColor;
- (UIColor)_navTintBrandColor;
- (_MKMapItemAttribution)_encyclopedicInfoAttribution;
- (_MKMapItemPhotosAttribution)_photosAttribution;
- (_MKMapItemPlaceAttribution)_attribution;
- (_MKMapItemReviewsAttribution)_reviewsAttribution;
- (_MKPlaceReservationInfo)reservationInfo;
- (float)_displayMaxZoom;
- (float)_displayMinZoom;
- (float)_normalizedUserRatingScore;
- (id)_activityURL;
- (id)_activityURLWithMuninViewState:(id)a3;
- (id)_addressFormattedAsCity;
- (id)_addressFormattedAsLocation;
- (id)_addressFormattedAsMultilineAddress;
- (id)_addressFormattedAsName;
- (id)_addressFormattedAsShortenedAddress;
- (id)_addressFormattedAsSinglelineAddress;
- (id)_addressFormattedAsStreetOnly;
- (id)_addressFormattedAsTitlesForMapRect:(id)a3;
- (id)_addressFormattedAsWeatherDisplayName;
- (id)_addressFormattedAsWeatherLocationName;
- (id)_addressOrNil:(id)a3;
- (id)_attributionFor:(id)a3 sourceStringFormat:(id)a4 moreSourceStringFormat:(id)a5 imageTintColor:(id)a6;
- (id)_attributionWithDisplayName:(id)a3 attributionFormat:(id)a4 logo:(id)a5 isSnippetLogo:(BOOL)a6;
- (id)_bestBrandIconURLForSize:(CGSize)a3 allowSmaller:(BOOL)a4;
- (id)_bestNavbarBrandIconURLForSize:(CGSize)a3 allowSmaller:(BOOL)a4;
- (id)_bestWalletHeroImageForSize:(CGSize)a3 allowSmaller:(BOOL)a4;
- (id)_cnPostalAddress;
- (id)_factoidWithSemantic:(int)a3;
- (id)_firstRelatedPlaceListForType:(int)a3;
- (id)_formatterForAdamId;
- (id)_fullAddressWithMultiline:(BOOL)a3;
- (id)_getBusiness;
- (id)_htmlRepresentation;
- (id)_identifier;
- (id)_initWithLabelMarker:(id)a3;
- (id)_isolatedPlace;
- (id)_localizedCategoryNamesForType:(unsigned int)a3;
- (id)_localizedNextOpeningStringShort:(BOOL)a3;
- (id)_mapkit_preferredFirstPhotoVendor;
- (id)_mapkit_resolvedFlatPhotoList;
- (id)_mapsDataString;
- (id)_placeCardContact;
- (id)_postalAddressFromMeCardUsingAddressIdentifier:(id)a3;
- (id)_relatedPlaceListForComponentIdentifier:(int)a3;
- (id)_restaurantLink_firstProviderDisplayName;
- (id)_restaurantLink_firstProviderIdentifier;
- (id)_restaurantLink_firstProviderPlaceIdentifier;
- (id)_restaurantLink_firstVendorID;
- (id)_restaurantLink_overridenBundleIDsForVendorIDs;
- (id)_reviewForIdentifier:(id)a3;
- (id)_urlExtraStorage;
- (id)_vCardFilename;
- (id)_vCardRepresentation;
- (id)_walletHeroImageProviderName;
- (id)dictionaryRepresentation;
- (id)formattedNumberOfReviewsIncludingProvider:(BOOL)a3 formatter:(id)a4;
- (id)hoursBuilderForSearchResultCellForOptions:(unint64_t)a3 conciseStyle:(BOOL)a4;
- (id)hoursBuilderForSearchResultCellForOptions:(unint64_t)a3 conciseStyle:(BOOL)a4 openAt:(id)a5;
- (id)loadDataWithTypeIdentifier:(id)a3 forItemProviderCompletionHandler:(id)a4;
- (id)searchResultsHoursWithConciseStyle:(BOOL)a3 openAt:(id)a4;
- (id)urlRepresentation;
- (id)venueLabelWithContext:(unint64_t)a3;
- (int)_browseCategory_placeCardType;
- (int)_parsecSectionType;
- (int)_placeCategoryType;
- (int)_placeDisplayStyle;
- (int)_resultProviderID;
- (int64_t)_venueFeatureType;
- (unint64_t)_areaHighlightId;
- (unint64_t)_brandMUID;
- (unint64_t)_customIconID;
- (unint64_t)_mapkit_numberOfPhotosAvailableForFlatList;
- (unint64_t)_muid;
- (unint64_t)_openingHoursOptions;
- (unint64_t)_restaurantExtensionModeForFirstProvider;
- (unint64_t)hash;
- (unsigned)_sampleSizeForUserRatingScore;
- (void)_getFirstAvailableAppClipLinkFromQuickLinks:(id)a3 completion:(id)a4;
- (void)_getFirstAvailableAppClipLinkWithCompletion:(id)a3;
- (void)_getFirstAvailableSecondaryAppClipLinkWithCompletion:(id)a3;
- (void)_getHasAvailableAppClipWithCompletion:(id)a3;
- (void)_getHasAvailableSecondaryAppClipWithCompletion:(id)a3;
- (void)_launchActivityForBrandItem;
- (void)_markTransitInfoUpdated;
- (void)_refreshAttribution;
- (void)_updateRealTimeEVChargerAvailability:(id)a3;
- (void)_updateTransitInfoWithMapItem:(id)a3;
- (void)dealloc;
- (void)encodeWithCoder:(id)a3;
- (void)openInMapsWithLaunchOptions:(NSDictionary *)launchOptions fromScene:(UIScene *)scene completionHandler:(void *)completion;
- (void)openInMapsWithLaunchOptions:(id)a3 completionHandler:(id)a4;
- (void)preloadTransitInfoWithCompletion:(id)a3;
- (void)setIsCurrentLocation:(BOOL)a3;
- (void)setIsMapItemTypeTransit:(BOOL)a3;
- (void)setName:(NSString *)name;
- (void)setPhoneNumber:(NSString *)phoneNumber;
- (void)setPointOfInterestCategory:(MKPointOfInterestCategory)pointOfInterestCategory;
- (void)setPresentCoordinate:(CLLocationCoordinate2D)a3;
- (void)setReservationInfo:(id)a3;
- (void)setTimeZone:(NSTimeZone *)timeZone;
- (void)setUrl:(NSURL *)url;
@end

@implementation MKMapItem

- (GEOFeatureStyleAttributes)_styleAttributes
{
  return (GEOFeatureStyleAttributes *)[(GEOMapItem *)self->_geoMapItem _styleAttributes];
}

- (GEOLabelGeometry)_labelGeometry
{
  return (GEOLabelGeometry *)[(GEOMapItem *)self->_geoMapItem _labelGeometry];
}

- (unint64_t)_muid
{
  return [(GEOMapItem *)self->_geoMapItem _muid];
}

- (GEOMapItemVenueInfo)_venueInfo
{
  return (GEOMapItemVenueInfo *)[(GEOMapItem *)self->_geoMapItem _venueInfo];
}

- (BOOL)_hasAreaHighlightId
{
  return [(GEOMapItem *)self->_geoMapItem _hasAreaHighlightId];
}

- (GEOEnhancedPlacement)_enhancedPlacement
{
  return (GEOEnhancedPlacement *)[(GEOMapItem *)self->_geoMapItem _enhancedPlacement];
}

- (unint64_t)_customIconID
{
  return [(GEOMapItem *)self->_geoMapItem _customIconID];
}

- (int64_t)_venueFeatureType
{
  if ([(MKMapItem *)self _hasVenueFeatureType]
    && (uint64_t v3 = [(GEOMapItem *)self->_geoMapItem _venueFeatureType] - 1,
        v3 <= 3))
  {
    return v3 + 1;
  }
  else
  {
    return 0;
  }
}

- (BOOL)_hasVenueFeatureType
{
  return [(GEOMapItem *)self->_geoMapItem _hasVenueFeatureType];
}

- (BOOL)_hasCorrectedHomeWorkCoordinate
{
  uint64_t v3 = [(MKMapItem *)self _geoMapItem];
  v4 = [v3 _clientAttributes];

  if (!v4) {
    return 0;
  }
  v5 = [(MKMapItem *)self _geoMapItem];
  int v6 = [v5 contactIsMe];

  if (!v6) {
    return 0;
  }
  v7 = [(MKMapItem *)self _geoMapItem];
  v8 = [v7 _clientAttributes];
  v9 = [v8 correctedLocationAttributes];
  char v10 = [v9 hasCorrectedCoordinate];

  return v10;
}

- (BOOL)_hasResolvablePartialInformation
{
  uint64_t v3 = [(MKMapItem *)self place];
  if (v3)
  {
    v4 = (void *)v3;
    v5 = [(MKMapItem *)self metadata];
    if (v5)
    {
    }
    else
    {
      geoMapItem = self->_geoMapItem;

      if (!geoMapItem)
      {
        v13 = [(MKMapItem *)self place];
        v14 = [v13 firstBusiness];
        uint64_t v15 = [v14 hasUID];

        return v15;
      }
    }
  }
  [(MKMapItem *)self _coordinate];
  if (!CLLocationCoordinate2DIsValid(v17))
  {
    v9 = [(MKMapItem *)self _geoAddress];
    char v10 = [v9 structuredAddress];
    if (v10)
    {
    }
    else
    {
      v11 = [(MKMapItem *)self _geoAddress];
      v12 = [v11 formattedAddressLines];

      if (!v12) {
        goto LABEL_6;
      }
    }
    return 1;
  }
LABEL_6:
  v7 = self->_geoMapItem;

  return [(GEOMapItem *)v7 _hasResolvablePartialInformation];
}

- (GEOPlace)place
{
  v5 = self->_isolation;
  _geo_isolate_lock();
  uint64_t v3 = [(MKMapItem *)self _isolatedPlace];
  _geo_isolate_unlock();

  return (GEOPlace *)v3;
}

- (id)_isolatedPlace
{
  geo_assert_isolated();
  if (!self->_place)
  {
    uint64_t v3 = [(MKMapItem *)self _geoMapItem];
    v4 = [v3 _place];
    place = self->_place;
    self->_place = v4;

    int v6 = [(GEOMapItemStorageUserValues *)self->_userValues name];

    if (v6)
    {
      v7 = [(GEOMapItemStorageUserValues *)self->_userValues name];
      [(GEOPlace *)self->_place setName:v7];
    }
  }
  v8 = self->_place;

  return v8;
}

- (GEOMapItemPrivate)_geoMapItem
{
  return self->_geoMapItem;
}

- (MKMapItemMetadata)metadata
{
  char v10 = self->_isolation;
  _geo_isolate_lock();
  metadata = self->_metadata;
  if (!metadata)
  {
    v4 = [(MKMapItem *)self _isolatedPlace];
    v5 = [v4 firstBusiness];

    if (v5)
    {
      int v6 = [[MKMapItemMetadata alloc] initWithBusiness:v5];
      v7 = self->_metadata;
      self->_metadata = v6;
    }
    metadata = self->_metadata;
  }
  v8 = metadata;
  _geo_isolate_unlock();

  return v8;
}

+ (id)_itemWithGeoMapItem:(id)a3
{
  id v3 = a3;
  v4 = [[MKMapItem alloc] initWithGeoMapItem:v3 isPlaceHolderPlace:0];

  return v4;
}

- (void)setName:(NSString *)name
{
  v4 = (void *)[(NSString *)name copy];
  v5 = [(MKMapItem *)self userValues];
  [v5 setName:v4];

  id v6 = [(GEOMapItemStorageUserValues *)self->_userValues name];
  [(GEOPlace *)self->_place setName:v6];
}

- (MKMapItem)initWithGeoMapItem:(id)a3 isPlaceHolderPlace:(BOOL)a4
{
  id v7 = a3;
  v8 = [(MKMapItem *)self init];
  v9 = v8;
  if (v8)
  {
    p_geoMapItem = (id *)&v8->_geoMapItem;
    objc_storeStrong((id *)&v8->_geoMapItem, a3);
    v9->_isPlaceHolder = a4;
    if (!v9->_geoMapItem)
    {
LABEL_9:
      v23 = v9;
      goto LABEL_10;
    }
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      uint64_t v11 = [(GEOMapItem *)v9->_geoMapItem userValues];
      userValues = v9->_userValues;
      v9->_userValues = (GEOMapItemStorageUserValues *)v11;
    }
    place = [*p_geoMapItem _placeData];
    if (!place)
    {
      v14 = [*p_geoMapItem _placeResult];

      if (v14) {
        goto LABEL_8;
      }
      uint64_t v25 = [(GEOMapItem *)v9->_geoMapItem _place];
      place = v9->_place;
      v9->_place = (GEOPlace *)v25;
    }

LABEL_8:
    objc_initWeak(&location, v9);
    uint64_t v15 = [MEMORY[0x1E4F28EB8] defaultCenter];
    id v16 = *p_geoMapItem;
    CLLocationCoordinate2D v17 = [MEMORY[0x1E4F28F08] mainQueue];
    uint64_t v18 = *MEMORY[0x1E4F63EE8];
    uint64_t v26 = MEMORY[0x1E4F143A8];
    uint64_t v27 = 3221225472;
    v28 = __51__MKMapItem_initWithGeoMapItem_isPlaceHolderPlace___block_invoke;
    v29 = &unk_1E54BB7D8;
    objc_copyWeak(&v30, &location);
    uint64_t v19 = [v15 addObserverForName:v18 object:v16 queue:v17 usingBlock:&v26];
    didResolveAttributionToken = v9->_didResolveAttributionToken;
    v9->_didResolveAttributionToken = v19;

    objc_msgSend(v7, "coordinate", v26, v27, v28, v29);
    v9->_presentCoordinate.latitude = v21;
    v9->_presentCoordinate.longitude = v22;
    objc_destroyWeak(&v30);
    objc_destroyWeak(&location);
    goto LABEL_9;
  }
LABEL_10:

  return v9;
}

- (MKMapItem)init
{
  v7.receiver = self;
  v7.super_class = (Class)MKMapItem;
  v2 = [(MKMapItem *)&v7 init];
  if (v2)
  {
    uint64_t v3 = geo_isolater_create();
    isolation = v2->_isolation;
    v2->_isolation = (geo_isolater *)v3;

    v5 = v2;
  }

  return v2;
}

- (GEOMapItemStorageUserValues)userValues
{
  userValues = self->_userValues;
  if (!userValues)
  {
    v4 = (GEOMapItemStorageUserValues *)objc_alloc_init(MEMORY[0x1E4F646E8]);
    v5 = self->_userValues;
    self->_userValues = v4;

    userValues = self->_userValues;
  }

  return userValues;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_preloadedTransitInfo, 0);
  objc_storeStrong((id *)&self->_reservationInfo, 0);
  objc_storeStrong((id *)&self->_encyclopedicInfoAttribution, 0);
  objc_storeStrong((id *)&self->_photosAttribution, 0);
  objc_storeStrong((id *)&self->_place, 0);
  objc_storeStrong((id *)&self->_metadata, 0);
  objc_storeStrong((id *)&self->_isolation, 0);
  objc_storeStrong((id *)&self->_cachedHoursBuilder, 0);
  objc_storeStrong((id *)&self->_localizedSampleSizeForUserRatingScoreString, 0);
  objc_storeStrong((id *)&self->_numberFormatterForAdamId, 0);
  objc_storeStrong((id *)&self->_firstLocalizedCategoryName, 0);
  objc_storeStrong((id *)&self->_shortAddress, 0);
  objc_storeStrong((id *)&self->_didResolveAttributionToken, 0);
  objc_storeStrong((id *)&self->_chargerAvailability, 0);
  objc_storeStrong((id *)&self->_customPOICategory, 0);
  objc_storeStrong((id *)&self->_userValues, 0);
  objc_storeStrong((id *)&self->_reviewsAttribution, 0);
  objc_storeStrong((id *)&self->_allPhotoAttributions, 0);
  objc_storeStrong((id *)&self->_attribution, 0);
  objc_storeStrong((id *)&self->_updatedTransitAttribution, 0);
  objc_storeStrong((id *)&self->_defaultTransitInfo, 0);
  objc_storeStrong((id *)&self->_updatedTransitInfo, 0);
  objc_storeStrong((id *)&self->_transitInfoUpdatedDate, 0);
  objc_storeStrong((id *)&self->_alternateIdentifiers, 0);
  objc_storeStrong((id *)&self->_identifier, 0);

  objc_storeStrong((id *)&self->_geoMapItem, 0);
}

- (CLLocationCoordinate2D)_coordinate
{
  [(GEOMapItem *)self->_geoMapItem coordinate];
  if (((fabs(v3 + 180.0) < 0.00000001) & (fabs(v2 + 180.0) < 0.00000001)) != 0)
  {
    double v2 = *MEMORY[0x1E4F1E750];
    double v3 = *(double *)(MEMORY[0x1E4F1E750] + 8);
  }
  result.longitude = v3;
  result.latitude = v2;
  return result;
}

unsigned char *__51__MKMapItem_initWithGeoMapItem_isPlaceHolderPlace___block_invoke_2(uint64_t a1)
{
  CLLocationCoordinate2D result = *(unsigned char **)(a1 + 32);
  if (result[144])
  {
    CLLocationCoordinate2D result = (unsigned char *)[result _refreshAttribution];
    *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 1;
  }
  return result;
}

- (void)dealloc
{
  if (self->_didResolveAttributionToken)
  {
    double v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v3 removeObserver:self->_didResolveAttributionToken];
  }
  v4.receiver = self;
  v4.super_class = (Class)MKMapItem;
  [(MKMapItem *)&v4 dealloc];
}

- (BOOL)_hasMUID
{
  return [(GEOMapItem *)self->_geoMapItem _hasMUID];
}

void __51__MKMapItem_initWithGeoMapItem_isPlaceHolderPlace___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v5 = WeakRetained;
  if (WeakRetained)
  {
    uint64_t v10 = 0;
    uint64_t v11 = &v10;
    uint64_t v12 = 0x2020000000;
    char v13 = 0;
    uint64_t v8 = MEMORY[0x1E4F143A8];
    id v6 = WeakRetained;
    v9 = v6;
    geo_isolate_sync();
    if (*((unsigned char *)v11 + 24))
    {
      objc_super v7 = objc_msgSend(MEMORY[0x1E4F28EB8], "defaultCenter", v8, 3221225472, __51__MKMapItem_initWithGeoMapItem_isPlaceHolderPlace___block_invoke_2, &unk_1E54B8310, v6, &v10);
      [v7 postNotificationName:@"MKMapItemDidResolveAttribution" object:v6];
    }
    _Block_object_dispose(&v10, 8);
  }
}

- (BOOL)_isPartiallyClientized
{
  return [(GEOMapItem *)self->_geoMapItem _isPartiallyClientized];
}

- (MKMapItem)initWithGeoMapItemAsCurrentLocation:(id)a3
{
  id v3 = [(MKMapItem *)self initWithGeoMapItem:a3 isPlaceHolderPlace:0];
  [(MKMapItem *)v3 setIsCurrentLocation:1];
  return v3;
}

- (void)setIsCurrentLocation:(BOOL)a3
{
  self->_isCurrentLocation = a3;
}

- (id)_cnPostalAddress
{
  double v2 = [(GEOMapItem *)self->_geoMapItem addressObject];
  id v3 = [v2 cnPostalAddress];

  return v3;
}

- (BOOL)isCurrentLocation
{
  return self->_isCurrentLocation;
}

- (MKMapItem)initWithCLLocation:(id)a3 placeType:(int)a4
{
  uint64_t v4 = *(void *)&a4;
  id v6 = (objc_class *)MEMORY[0x1E4F64828];
  id v7 = a3;
  id v8 = [v6 alloc];
  [v7 coordinate];
  double v10 = v9;
  [v7 coordinate];
  double v12 = v11;

  char v13 = (void *)[v8 initWithLatitude:v4 longitude:v10 placeType:v12];
  v14 = [(MKMapItem *)self initWithPlace:v13];

  return v14;
}

- (MKMapItem)initWithPlace:(id)a3 isPlaceHolderPlace:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = [MEMORY[0x1E4F646E0] mapItemStorageForPlace:a3];
  id v7 = [(MKMapItem *)self initWithGeoMapItem:v6 isPlaceHolderPlace:v4];

  return v7;
}

- (MKMapItem)initWithPlace:(id)a3
{
  return [(MKMapItem *)self initWithPlace:a3 isPlaceHolderPlace:0];
}

- (MKMapItem)initWithCLLocation:(id)a3
{
  return [(MKMapItem *)self initWithCLLocation:a3 placeType:0];
}

- (NSString)name
{
  id v3 = [(GEOMapItemStorageUserValues *)self->_userValues name];

  if (v3)
  {
    BOOL v4 = [(GEOMapItemStorageUserValues *)self->_userValues name];
    goto LABEL_18;
  }
  if (![(MKMapItem *)self _hasTransitDisplayName])
  {
    v5 = 0;
LABEL_7:
    id v7 = [(MKMapItem *)self place];
    id v8 = v7;
    if (v7)
    {
      double v9 = [v7 name];

      if ([v9 length])
      {
        id v10 = v9;
LABEL_15:
        id v6 = v10;
LABEL_16:
        BOOL v4 = v10;

        goto LABEL_17;
      }
      double v11 = [v8 firstBusiness];
      id v6 = [v11 name];

      if ([v6 length])
      {
LABEL_14:
        id v10 = v6;
        goto LABEL_15;
      }
      double v12 = [(GEOMapItem *)self->_geoMapItem addressObject];
      v5 = [v12 name];

      if ([v5 length])
      {
        id v10 = v5;
        goto LABEL_15;
      }
    }
    id v6 = [(GEOMapItem *)self->_geoMapItem name];

    if (![v6 length])
    {
      if ([(GEOMapItem *)self->_geoMapItem isDisputed]
        && (([(GEOMapItem *)self->_geoMapItem centerCoordinate], fabs(v15 + 180.0) >= 0.00000001)
         || fabs(v14 + 180.0) >= 0.00000001))
      {
        objc_msgSend(NSString, "_mapkit_formattedStringForCoordinate:");
        id v10 = (id)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        MKLocalizedStringForUnknownLocation();
        id v10 = (id)objc_claimAutoreleasedReturnValue();
      }
      goto LABEL_16;
    }
    goto LABEL_14;
  }
  v5 = [(MKMapItem *)self _transitDisplayName];
  if (![v5 length]) {
    goto LABEL_7;
  }
  id v6 = v5;
  BOOL v4 = v6;
LABEL_17:

LABEL_18:

  return (NSString *)v4;
}

- (BOOL)_hasTransitDisplayName
{
  double v2 = [(MKMapItem *)self _transitInfo];
  id v3 = [v2 displayName];
  BOOL v4 = [v3 length] != 0;

  return v4;
}

- (GEOMapItemTransitInfo)_transitInfo
{
  if (!self->_defaultTransitInfo
    && !self->_isTransitInfoUpdated
    && [(GEOMapItem *)self->_geoMapItem _hasTransit])
  {
    id v3 = [(GEOMapItem *)self->_geoMapItem _transitInfo];
    defaultTransitInfo = self->_defaultTransitInfo;
    self->_defaultTransitInfo = v3;
  }
  uint64_t v5 = 56;
  if (!self->_isTransitInfoUpdated) {
    uint64_t v5 = 64;
  }
  id v6 = *(Class *)((char *)&self->super.isa + v5);

  return (GEOMapItemTransitInfo *)v6;
}

- (CLLocationCoordinate2D)_labelCoordinate
{
  [(GEOMapItem *)self->_geoMapItem labelCoordinate];
  if (((fabs(v3 + 180.0) < 0.00000001) & (fabs(v2 + 180.0) < 0.00000001)) != 0)
  {
    double v2 = *MEMORY[0x1E4F1E750];
    double v3 = *(double *)(MEMORY[0x1E4F1E750] + 8);
  }
  result.longitude = v3;
  result.latitude = v2;
  return result;
}

+ (MKMapItem)mapItemForCurrentLocation
{
  if (qword_1EB315FD0 != -1) {
    dispatch_once(&qword_1EB315FD0, &__block_literal_global_63);
  }
  double v2 = (void *)_MergedGlobals_156;

  return (MKMapItem *)v2;
}

uint64_t __38__MKMapItem_mapItemForCurrentLocation__block_invoke()
{
  v0 = [[MKMapItem alloc] initWithGeoMapItem:0 isPlaceHolderPlace:0];
  v1 = (void *)_MergedGlobals_156;
  _MergedGlobals_156 = (uint64_t)v0;

  double v2 = (void *)_MergedGlobals_156;

  return [v2 setIsCurrentLocation:1];
}

- (id)_bestWalletHeroImageForSize:(CGSize)a3 allowSmaller:(BOOL)a4
{
  BOOL v4 = a4;
  double height = a3.height;
  double width = a3.width;
  id v7 = [(MKMapItem *)self _geoMapItem];
  id v8 = _MKBestWalletHeroPhotoForGEOMapItem(v7);
  double v9 = v8;
  if (v8)
  {
    id v10 = objc_msgSend(v8, "bestPhotoForSize:allowSmaller:", v4, width, height);
    double v11 = [v10 url];

    if (v11)
    {
      double v12 = [v10 url];

      goto LABEL_6;
    }
  }
  double v12 = objc_msgSend(v7, "_bestHeroBrandIconURLForSize:allowSmaller:", v4, width, height);
LABEL_6:

  return v12;
}

- (id)_walletHeroImageProviderName
{
  double v2 = [(MKMapItem *)self _geoMapItem];
  double v3 = _MKBestWalletHeroPhotoForGEOMapItem(v2);
  BOOL v4 = v3;
  if (v3)
  {
    uint64_t v5 = [v3 attribution];
    id v6 = [v5 providerName];
  }
  else
  {
    id v6 = 0;
  }

  return v6;
}

+ (void)_mapItemsFromPunchInHintsURL:(id)a3 maxResults:(unsigned int)a4 completionHandler:(id)a5
{
  uint64_t v47 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a5;
  if (v9)
  {
    unsigned int v35 = a4;
    id v34 = a1;
    id v10 = [v8 scheme];
    char v11 = [v10 isEqualToString:@"x-maps-punchinhint"];

    if (v11)
    {
      double v12 = (void *)MEMORY[0x1E4F29088];
      char v13 = [v8 absoluteString];
      v36 = [v12 componentsWithString:v13];

      [v36 queryItems];
      long long v44 = 0u;
      long long v45 = 0u;
      long long v42 = 0u;
      long long v43 = 0u;
      id v14 = (id)objc_claimAutoreleasedReturnValue();
      uint64_t v15 = [v14 countByEnumeratingWithState:&v42 objects:v46 count:16];
      if (v15)
      {
        uint64_t v16 = *(void *)v43;
LABEL_5:
        uint64_t v17 = 0;
        while (1)
        {
          if (*(void *)v43 != v16) {
            objc_enumerationMutation(v14);
          }
          uint64_t v18 = *(void **)(*((void *)&v42 + 1) + 8 * v17);
          uint64_t v19 = [v18 name];
          char v20 = [v19 isEqualToString:@"pm"];

          if (v20) {
            break;
          }
          if (v15 == ++v17)
          {
            uint64_t v15 = [v14 countByEnumeratingWithState:&v42 objects:v46 count:16];
            if (v15) {
              goto LABEL_5;
            }
            goto LABEL_11;
          }
        }
        CLLocationDegrees v21 = [v18 value];

        if (v21 && [v21 length])
        {
          v23 = (void *)[objc_alloc(MEMORY[0x1E4F64A70]) initWithEncodedString:v21];
          v24 = +[MKMapService sharedService];
          v33 = [v24 defaultTraits];

          uint64_t v25 = [v23 spotlightEncodedString];
          [v33 setSpotlightSearchPunchinEncodedString:v25];

          uint64_t v26 = +[MKMapService sharedService];
          uint64_t v27 = [v23 completedSearchQuery];
          v28 = [v26 ticketForSearchQuery:v27 completionItem:0 maxResults:v35 traits:v33];

          v29 = objc_opt_new();
          id v30 = [v34 _launchOptionsFromResourceOptionsDictionary:v29];
          v31 = (void *)[v30 mutableCopy];

          objc_initWeak(&location, v28);
          v37[0] = MEMORY[0x1E4F143A8];
          v37[1] = 3221225472;
          v37[2] = __88__MKMapItem_PunchInHintsSPI___mapItemsFromPunchInHintsURL_maxResults_completionHandler___block_invoke;
          v37[3] = &unk_1E54B9100;
          id v39 = v9;
          objc_copyWeak(&v40, &location);
          id v32 = v31;
          id v38 = v32;
          [v28 submitWithHandler:v37 networkActivity:0];

          objc_destroyWeak(&v40);
          objc_destroyWeak(&location);

          goto LABEL_17;
        }
      }
      else
      {
LABEL_11:

        CLLocationDegrees v21 = 0;
      }
      v23 = [MEMORY[0x1E4F28C58] errorWithDomain:MKErrorDomain code:1 userInfo:0];
      (*((void (**)(id, void, void, void *))v9 + 2))(v9, 0, 0, v23);
LABEL_17:
    }
    else
    {
      CLLocationDegrees v22 = [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F281F8] code:0 userInfo:0];
      (*((void (**)(id, void, void, void *))v9 + 2))(v9, 0, 0, v22);
    }
  }
}

void __88__MKMapItem_PunchInHintsSPI___mapItemsFromPunchInHintsURL_maxResults_completionHandler___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v16 = a2;
  if (a3)
  {
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
  else
  {
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
    id v6 = [WeakRetained mapItemIdentifierForSpotlight];

    if (v6 && [v16 count])
    {
      unint64_t v7 = 0;
      do
      {
        id v8 = [v16 objectAtIndexedSubscript:v7];
        id v9 = [v8 _identifier];
        id v10 = objc_loadWeakRetained((id *)(a1 + 48));
        char v11 = [v10 mapItemIdentifierForSpotlight];
        int v12 = [v9 isEqual:v11];

        if (v12)
        {
          char v13 = [NSNumber numberWithUnsignedInteger:v7];
          [*(id *)(a1 + 32) setObject:v13 forKeyedSubscript:@"MKLaunchOptionsSelectedIndex"];
        }
        ++v7;
      }
      while (v7 < [v16 count]);
    }
    uint64_t v14 = *(void *)(a1 + 40);
    uint64_t v15 = (void *)[*(id *)(a1 + 32) copy];
    (*(void (**)(uint64_t, id, void *, void))(v14 + 16))(v14, v16, v15, 0);
  }
}

- (BOOL)_browseCategory_canDisplayBrowseCategoriesForVenue
{
  double v3 = [(MKMapItem *)self _identifier];
  if (v3
    && [(MKMapItem *)self _hasVenueFeatureType]
    && ((unint64_t v4 = [(MKMapItem *)self _venueFeatureType], v4 > 4) || ((1 << v4) & 0x19) == 0))
  {
    unint64_t v7 = [(MKMapItem *)self _browseCategories];
    BOOL v5 = [v7 count] != 0;
  }
  else
  {
    BOOL v5 = 0;
  }

  return v5;
}

- (BOOL)_browseCategory_canDisplayBrowseCategoriesForPlace
{
  double v2 = [(MKMapItem *)self _browseCategories];
  BOOL v3 = [v2 count] != 0;

  return v3;
}

- (BOOL)_browseCategory_isVenueItem
{
  BOOL v3 = [(MKMapItem *)self _identifier];
  if (v3) {
    BOOL v4 = [(MKMapItem *)self _hasVenueFeatureType];
  }
  else {
    BOOL v4 = 0;
  }

  return v4;
}

- (int)_browseCategory_placeCardType
{
  if ([(MKMapItem *)self _browseCategory_isVenueItem])
  {
    int64_t v3 = [(MKMapItem *)self _venueFeatureType];
    if (v3 == 2) {
      int v4 = 13;
    }
    else {
      int v4 = 0;
    }
    if (v3 == 1) {
      return 12;
    }
    else {
      return v4;
    }
  }
  else if ([(MKMapItem *)self _hasMUID])
  {
    return 2;
  }
  else
  {
    return 1;
  }
}

- (void)_launchActivityForBrandItem
{
  v18[2] = *MEMORY[0x1E4F143B8];
  int64_t v3 = (void *)[objc_alloc(MEMORY[0x1E4F22488]) initWithActivityType:@"MKPlaceBrandUserActivity"];
  int v4 = (void *)MEMORY[0x1E4F28DB0];
  v17[0] = @"MKPlaceBrandUserActivityName";
  uint64_t v5 = [(MKMapItem *)self name];
  id v6 = (void *)v5;
  if (v5) {
    unint64_t v7 = (__CFString *)v5;
  }
  else {
    unint64_t v7 = &stru_1ED919588;
  }
  v17[1] = @"MKPlaceBrandUserActivityID";
  v18[0] = v7;
  id v8 = objc_msgSend(NSNumber, "numberWithUnsignedLongLong:", -[MKMapItem _muid](self, "_muid"));
  v18[1] = v8;
  id v9 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v18 forKeys:v17 count:2];
  id v10 = [v4 archivedDataWithRootObject:v9 requiringSecureCoding:1 error:0];

  if (v10)
  {
    uint64_t v15 = @"MKPlaceBrandUserActivityData";
    id v16 = v10;
    char v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v16 forKeys:&v15 count:1];
    int v12 = +[MKMapItem _sharedSessionUserInfoForPunchoutUserInfo:v11];
    [v3 setUserInfo:v12];

    char v13 = (void *)[objc_alloc(MEMORY[0x1E4F223C8]) initWithBundleIdentifier:@"com.apple.Maps" allowPlaceholder:0 error:0];
    uint64_t v14 = +[MKSystemController sharedInstance];
    [v14 openUserActivity:v3 withApplicationRecord:v13 requireOptionKeyPromptUnlockDevice:1 completionHandler:0];
  }
}

- (MKMapItem)initWithAddressDictionary:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [MKPlacemark alloc];
  id v6 = -[MKPlacemark initWithCoordinate:addressDictionary:](v5, "initWithCoordinate:addressDictionary:", v4, *MEMORY[0x1E4F1E750], *(double *)(MEMORY[0x1E4F1E750] + 8));

  unint64_t v7 = [(MKMapItem *)self initWithPlacemark:v6];
  return v7;
}

- (MKMapItem)initWithPlacemark:(MKPlacemark *)placemark
{
  id v4 = placemark;
  uint64_t v5 = [(MKPlacemark *)v4 _geoMapItem];
  if (v5)
  {
    id v6 = [(MKMapItem *)self initWithGeoMapItem:v5 isPlaceHolderPlace:1];
  }
  else
  {
    unint64_t v7 = [(MKPlacemark *)v4 mkPostalAddressDictionary];

    id v8 = (void *)[objc_alloc(MEMORY[0x1E4F64828]) initWithPlacemark:v4];
    if (v7) {
      id v9 = [(MKMapItem *)self initWithPlace:v8 isPlaceHolderPlace:1];
    }
    else {
      id v9 = [(MKMapItem *)self initWithPlace:v8];
    }
    id v6 = v9;
  }
  return v6;
}

- (MKPlacemark)placemark
{
  if (self->_isCurrentLocation)
  {
    double v2 = 0;
  }
  else
  {
    if (self->_geoMapItem)
    {
      [(MKMapItem *)self _coordinate];
      double v5 = v4;
      double v7 = v6;
      id v8 = [(GEOMapItem *)self->_geoMapItem geoFenceMapRegion];
      if (v8)
      {
        id v9 = [MEMORY[0x1E4F1E5A8] circularRegionFromMapRegion:v8];
        int v10 = [(GEOMapItem *)self->_geoMapItem referenceFrame];
        if (v10 == 1) {
          uint64_t v11 = 1;
        }
        else {
          uint64_t v11 = 2 * (v10 == 2);
        }
        [v9 setGeoReferenceFrame:v11];
      }
      else
      {
        id v9 = 0;
      }
      id v22 = objc_alloc(MEMORY[0x1E4F1E5F0]);
      v23 = [MEMORY[0x1E4F1C9C8] date];
      int v24 = [(GEOMapItem *)self->_geoMapItem referenceFrame];
      if (v24 == 1) {
        uint64_t v25 = 1;
      }
      else {
        uint64_t v25 = 2 * (v24 == 2);
      }
      char v13 = objc_msgSend(v22, "initWithCoordinate:altitude:horizontalAccuracy:verticalAccuracy:timestamp:referenceFrame:", v23, v25, v5, v7, 0.0, 0.0, -1.0);

      uint64_t v26 = [MKPlacemark alloc];
      uint64_t v14 = [(GEOMapItem *)self->_geoMapItem addressDictionary];
      uint64_t v15 = [(GEOMapItem *)self->_geoMapItem geoAddress];
      id v16 = [v15 structuredAddress];
      uint64_t v17 = [v16 areaOfInterests];
      uint64_t v18 = v26;
      uint64_t v19 = v13;
      char v20 = v14;
      CLLocationDegrees v21 = v9;
    }
    else
    {
      id v8 = [(MKMapItem *)self place];
      int v12 = [MKPlacemark alloc];
      id v9 = [v8 clLocation];
      char v13 = [v8 addressDictionary];
      uint64_t v14 = [v8 clRegion];
      uint64_t v15 = [v8 address];
      id v16 = [v15 structuredAddress];
      uint64_t v17 = [v16 areaOfInterests];
      uint64_t v18 = v12;
      uint64_t v19 = v9;
      char v20 = v13;
      CLLocationDegrees v21 = v14;
    }
    double v2 = [(MKPlacemark *)v18 initWithLocation:v19 addressDictionary:v20 region:v21 areasOfInterest:v17];
  }

  return v2;
}

- (_MKMapItemPlaceAttribution)_attribution
{
  double v5 = self->_isolation;
  _geo_isolate_lock();
  if (!self->_hasLoadedAttribution) {
    [(MKMapItem *)self _refreshAttribution];
  }
  int64_t v3 = self->_attribution;
  _geo_isolate_unlock();

  return v3;
}

- (_MKMapItemPhotosAttribution)_photosAttribution
{
  double v5 = self->_isolation;
  _geo_isolate_lock();
  if (!self->_hasLoadedAttribution) {
    [(MKMapItem *)self _refreshAttribution];
  }
  int64_t v3 = self->_photosAttribution;
  _geo_isolate_unlock();

  return v3;
}

- (NSArray)_allPhotoAttributions
{
  double v5 = self->_isolation;
  _geo_isolate_lock();
  if (!self->_hasLoadedAttribution) {
    [(MKMapItem *)self _refreshAttribution];
  }
  int64_t v3 = self->_allPhotoAttributions;
  _geo_isolate_unlock();

  return v3;
}

- (_MKMapItemReviewsAttribution)_reviewsAttribution
{
  double v5 = self->_isolation;
  _geo_isolate_lock();
  if (!self->_hasLoadedAttribution) {
    [(MKMapItem *)self _refreshAttribution];
  }
  int64_t v3 = self->_reviewsAttribution;
  _geo_isolate_unlock();

  return v3;
}

- (_MKMapItemAttribution)_encyclopedicInfoAttribution
{
  double v5 = self->_isolation;
  _geo_isolate_lock();
  if (!self->_hasLoadedAttribution) {
    [(MKMapItem *)self _refreshAttribution];
  }
  int64_t v3 = self->_encyclopedicInfoAttribution;
  _geo_isolate_unlock();

  return v3;
}

- (void)_refreshAttribution
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  geo_assert_isolated();
  int64_t v3 = [_MKMapItemPlaceAttribution alloc];
  double v4 = [(GEOMapItem *)self->_geoMapItem _attribution];
  double v5 = [(_MKMapItemPlaceAttribution *)v3 initWithGEOMapItemAttribution:v4];
  attribution = self->_attribution;
  self->_attribution = v5;

  id v7 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  long long v27 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  id v8 = [(GEOMapItem *)self->_geoMapItem _allPhotoAttributions];
  uint64_t v9 = [v8 countByEnumeratingWithState:&v27 objects:v31 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v28;
    do
    {
      uint64_t v12 = 0;
      do
      {
        if (*(void *)v28 != v11) {
          objc_enumerationMutation(v8);
        }
        char v13 = [[_MKMapItemPhotosAttribution alloc] initWithGEOMapItemAttribution:*(void *)(*((void *)&v27 + 1) + 8 * v12)];
        [v7 addObject:v13];

        ++v12;
      }
      while (v10 != v12);
      uint64_t v10 = [v8 countByEnumeratingWithState:&v27 objects:v31 count:16];
    }
    while (v10);
  }

  uint64_t v14 = [v7 firstObject];
  photosAttribution = self->_photosAttribution;
  self->_photosAttribution = v14;

  id v16 = (NSArray *)[v7 copy];
  allPhotoAttributions = self->_allPhotoAttributions;
  self->_allPhotoAttributions = v16;

  uint64_t v18 = [_MKMapItemReviewsAttribution alloc];
  uint64_t v19 = [(GEOMapItem *)self->_geoMapItem _reviewsAttribution];
  char v20 = [(_MKMapItemReviewsAttribution *)v18 initWithGEOMapItemAttribution:v19];
  reviewsAttribution = self->_reviewsAttribution;
  self->_reviewsAttribution = v20;

  id v22 = [_MKMapItemAttribution alloc];
  v23 = [(GEOMapItem *)self->_geoMapItem _encyclopedicInfo];
  int v24 = [v23 encyclopedicAttribution];
  uint64_t v25 = [(_MKMapItemAttribution *)v22 initWithGEOMapItemAttribution:v24];
  encyclopedicInfoAttribution = self->_encyclopedicInfoAttribution;
  self->_encyclopedicInfoAttribution = v25;

  self->_hasLoadedAttribution = 1;
}

- (NSString)description
{
  int64_t v3 = [MEMORY[0x1E4F1CA60] dictionary];
  double v4 = [(MKMapItem *)self name];
  if (v4) {
    [v3 setObject:v4 forKeyedSubscript:@"name"];
  }
  double v5 = objc_msgSend(NSNumber, "numberWithBool:", -[MKMapItem isCurrentLocation](self, "isCurrentLocation"));
  [v3 setObject:v5 forKeyedSubscript:@"isCurrentLocation"];

  double v6 = [(MKMapItem *)self phoneNumber];
  if (v6) {
    [v3 setObject:v6 forKeyedSubscript:@"phoneNumber"];
  }
  id v7 = [(MKMapItem *)self timeZone];
  if (v7) {
    [v3 setObject:v7 forKeyedSubscript:@"timeZone"];
  }
  id v8 = [(MKMapItem *)self url];
  if (v8) {
    [v3 setObject:v8 forKeyedSubscript:@"url"];
  }
  uint64_t v9 = [(MKMapItem *)self placemark];
  if (v9) {
    [v3 setObject:v9 forKeyedSubscript:@"placemark"];
  }
  uint64_t v10 = NSString;
  v14.receiver = self;
  v14.super_class = (Class)MKMapItem;
  uint64_t v11 = [(MKMapItem *)&v14 description];
  uint64_t v12 = [v10 stringWithFormat:@"%@ %@", v11, v3];

  return (NSString *)v12;
}

- (unint64_t)hash
{
  if ([(MKMapItem *)self isCurrentLocation]) {
    return 0;
  }
  geoMapItem = self->_geoMapItem;
  if (geoMapItem)
  {
    return [(GEOMapItem *)geoMapItem hash];
  }
  else
  {
    double v5 = [(MKMapItem *)self place];
    unint64_t v6 = [v5 hash];

    return v6;
  }
}

- (BOOL)isEqual:(id)a3
{
  id v5 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    unint64_t v6 = v5;
    if ([v6 isCurrentLocation])
    {
      char v7 = [(MKMapItem *)self isCurrentLocation];
LABEL_15:

      goto LABEL_16;
    }
    if ([(GEOMapItem *)self->_geoMapItem isEqualToMapItem:v6[2]])
    {
      userValues = self->_userValues;
      if (userValues == (GEOMapItemStorageUserValues *)v6[13]
        || -[GEOMapItemStorageUserValues isEqual:](userValues, "isEqual:"))
      {
        uint64_t v9 = [v6 pointOfInterestCategory];
        if (!v9)
        {
          int64_t v3 = [(MKMapItem *)self pointOfInterestCategory];
          if (!v3) {
            goto LABEL_12;
          }
        }
        uint64_t v10 = [v6 pointOfInterestCategory];
        uint64_t v11 = [(MKMapItem *)self pointOfInterestCategory];
        int v12 = [v10 isEqual:v11];

        if (v9)
        {

          if (v12)
          {
LABEL_12:
            char v13 = [(MKMapItem *)self place];
            objc_super v14 = [v6 place];
            char v7 = [v13 isEqual:v14];

            goto LABEL_15;
          }
        }
        else
        {

          if (v12) {
            goto LABEL_12;
          }
        }
      }
    }
    char v7 = 0;
    goto LABEL_15;
  }
  char v7 = 0;
LABEL_16:

  return v7;
}

- (GEOMapItemStorage)_geoMapItemStorageForPersistence
{
  int64_t v3 = [MEMORY[0x1E4F646E0] mapItemStorageForGEOMapItem:self->_geoMapItem forUseType:0];
  [v3 setUserValues:self->_userValues];

  return (GEOMapItemStorage *)v3;
}

- (GEOMapItemStorage)_geoMapItemStorageForDragAndDrop
{
  int64_t v3 = [MEMORY[0x1E4F646E0] mapItemStorageForGEOMapItem:self->_geoMapItem forUseType:1];
  [v3 setUserValues:self->_userValues];

  return (GEOMapItemStorage *)v3;
}

- (NSString)_secondaryName
{
  return (NSString *)[(GEOMapItem *)self->_geoMapItem secondaryName];
}

- (NSString)_secondarySpokenName
{
  return (NSString *)[(GEOMapItem *)self->_geoMapItem secondarySpokenName];
}

- (NSString)phoneNumber
{
  int64_t v3 = [(GEOMapItemStorageUserValues *)self->_userValues phoneNumber];
  uint64_t v4 = [v3 length];

  if (v4)
  {
    uint64_t v5 = [(GEOMapItemStorageUserValues *)self->_userValues phoneNumber];
LABEL_5:
    unint64_t v6 = (void *)v5;
    goto LABEL_6;
  }
  if ([(GEOMapItem *)self->_geoMapItem _hasTelephone])
  {
    uint64_t v5 = [(GEOMapItem *)self->_geoMapItem _telephone];
    goto LABEL_5;
  }
  unint64_t v6 = 0;
LABEL_6:
  CFLocaleRef v7 = CFLocaleCopyCurrent();
  if (v7)
  {
    CFLocaleRef v8 = v7;
    CFTypeRef Value = CFLocaleGetValue(v7, (CFLocaleKey)*MEMORY[0x1E4F1D1F0]);
    if (Value)
    {
      uint64_t v10 = mk_CFPhoneNumberCreate(0, (uint64_t)v6, (uint64_t)Value);
      if (v10)
      {
        uint64_t v11 = (const void *)v10;
        if ([v6 length])
        {
          if ([v6 characterAtIndex:0] == 43) {
            uint64_t v12 = 7;
          }
          else {
            uint64_t v12 = 5;
          }
        }
        else
        {
          uint64_t v12 = 5;
        }
        uint64_t String = mk_CFPhoneNumberCreateString(0, (uint64_t)v11, v12);
        if (String)
        {
          objc_super v14 = (const void *)String;
          uint64_t v15 = [NSString stringWithString:String];

          CFRelease(v14);
          unint64_t v6 = (void *)v15;
        }
        CFRelease(v11);
      }
    }
    CFRelease(v8);
  }

  return (NSString *)v6;
}

- (void)setPhoneNumber:(NSString *)phoneNumber
{
  id v5 = (id)[(NSString *)phoneNumber copy];
  uint64_t v4 = [(MKMapItem *)self userValues];
  [v4 setPhoneNumber:v5];
}

- (BOOL)_phoneNumberOptsOutOfAds
{
  int64_t v3 = [(GEOMapItemStorageUserValues *)self->_userValues phoneNumber];
  uint64_t v4 = [v3 length];

  if (v4) {
    return 0;
  }
  geoMapItem = self->_geoMapItem;

  return [(GEOMapItem *)geoMapItem _optsOutOfTelephoneAds];
}

- (void)setPointOfInterestCategory:(MKPointOfInterestCategory)pointOfInterestCategory
{
  MKPointOfInterestCategory v7 = pointOfInterestCategory;
  uint64_t v4 = [(MKMapItem *)self pointOfInterestCategory];
  if ((unint64_t)v7 | v4 && ([(NSString *)self->_customPOICategory isEqual:v7] & 1) == 0)
  {
    self->_useCustomPOICategory = 1;
    [(MKMapItem *)self willChangeValueForKey:@"pointOfInterestCategory"];
    id v5 = (NSString *)[(NSString *)v7 copy];
    customPOICategory = self->_customPOICategory;
    self->_customPOICategory = v5;

    [(MKMapItem *)self didChangeValueForKey:@"pointOfInterestCategory"];
  }
}

- (MKPointOfInterestCategory)pointOfInterestCategory
{
  if (self->_useCustomPOICategory)
  {
    double v2 = self->_customPOICategory;
  }
  else
  {
    int64_t v3 = [(MKMapItem *)self _geoMapItem];
    uint64_t v4 = [v3 _poiCategory];

    if (v4)
    {
      MKPointOfInterestCategoryForGEOPOICategory(v4);
      double v2 = (NSString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      double v2 = 0;
    }
  }

  return v2;
}

- (NSTimeZone)timeZone
{
  int64_t v3 = [(GEOMapItemStorageUserValues *)self->_userValues timeZoneName];
  if (v3)
  {
    uint64_t v4 = (void *)MEMORY[0x1E4F1CAF0];
    id v5 = [(GEOMapItemStorageUserValues *)self->_userValues timeZoneName];
    unint64_t v6 = [(GEOMapItemStorageUserValues *)self->_userValues timeZoneData];
    MKPointOfInterestCategory v7 = [v4 timeZoneWithName:v5 data:v6];
  }
  else
  {
    MKPointOfInterestCategory v7 = [(GEOMapItem *)self->_geoMapItem timezone];
  }

  return (NSTimeZone *)v7;
}

- (void)setTimeZone:(NSTimeZone *)timeZone
{
  uint64_t v4 = timeZone;
  id v5 = v4;
  if (v4)
  {
    uint64_t v11 = v4;
    unint64_t v6 = [(NSTimeZone *)v4 name];
    MKPointOfInterestCategory v7 = [(MKMapItem *)self userValues];
    [v7 setTimeZoneName:v6];

    CFLocaleRef v8 = [(NSTimeZone *)v11 data];
    uint64_t v9 = [(MKMapItem *)self userValues];
    [v9 setTimeZoneData:v8];
  }
  else
  {
    userValues = self->_userValues;
    if (!userValues) {
      goto LABEL_6;
    }
    uint64_t v11 = 0;
    [(GEOMapItemStorageUserValues *)userValues setTimeZoneName:0];
    [(GEOMapItemStorageUserValues *)self->_userValues setTimeZoneData:0];
  }
  id v5 = v11;
LABEL_6:
}

- (id)_getBusiness
{
  int64_t v3 = [(MKMapItem *)self place];
  id v4 = [v3 firstBusiness];

  if (!v4)
  {
    id v4 = objc_alloc_init(MEMORY[0x1E4F64420]);
    id v5 = [(MKMapItem *)self place];
    [v5 addBusiness:v4];
  }

  return v4;
}

- (NSURL)url
{
  int64_t v3 = [(GEOMapItemStorageUserValues *)self->_userValues url];

  if (!v3
    || (id v4 = (void *)MEMORY[0x1E4F1CB10],
        [(GEOMapItemStorageUserValues *)self->_userValues url],
        id v5 = objc_claimAutoreleasedReturnValue(),
        [v4 URLWithString:v5],
        unint64_t v6 = objc_claimAutoreleasedReturnValue(),
        v5,
        !v6))
  {
    MKPointOfInterestCategory v7 = [(MKMapItem *)self place];

    if (v7)
    {
      CFLocaleRef v8 = [(MKMapItem *)self place];
      uint64_t v9 = [v8 firstBusiness];

      uint64_t v10 = [v9 uRL];
    }
    else
    {
      uint64_t v10 = [(GEOMapItem *)self->_geoMapItem _businessURL];
    }
    if ([v10 length])
    {
      unint64_t v6 = [MEMORY[0x1E4F1CB10] URLWithString:v10];
      uint64_t v11 = [v6 scheme];
      uint64_t v12 = [v11 length];

      if (!v12)
      {
        char v13 = (void *)MEMORY[0x1E4F1CB10];
        objc_super v14 = [NSString stringWithFormat:@"http://%@", v10];
        uint64_t v15 = [v13 URLWithString:v14];

        unint64_t v6 = (void *)v15;
      }
    }
    else
    {
      unint64_t v6 = 0;
    }
  }

  return (NSURL *)v6;
}

- (void)setUrl:(NSURL *)url
{
  id v5 = [(NSURL *)url absoluteString];
  id v4 = [(MKMapItem *)self userValues];
  [v4 setUrl:v5];
}

- (NSString)yelpID
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  double v2 = [(MKMapItem *)self place];
  int64_t v3 = [v2 firstBusiness];

  long long v16 = 0u;
  long long v17 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v4 = objc_msgSend(v3, "sources", 0);
  uint64_t v5 = [v4 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v15;
    while (2)
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v15 != v7) {
          objc_enumerationMutation(v4);
        }
        uint64_t v9 = *(void **)(*((void *)&v14 + 1) + 8 * i);
        uint64_t v10 = [v9 sourceName];
        uint64_t v11 = [v10 caseInsensitiveCompare:@"yelp"];

        if (!v11)
        {
          uint64_t v12 = [v9 sourceId];
          goto LABEL_11;
        }
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v14 objects:v18 count:16];
      if (v6) {
        continue;
      }
      break;
    }
  }
  uint64_t v12 = 0;
LABEL_11:

  return (NSString *)v12;
}

- (GEOMapRegion)_displayMapRegion
{
  return (GEOMapRegion *)[(GEOMapItem *)self->_geoMapItem displayMapRegion];
}

- (BOOL)_hasDisplayMinZoom
{
  return [(GEOMapItem *)self->_geoMapItem hasDisplayMinZoom];
}

- (float)_displayMinZoom
{
  [(GEOMapItem *)self->_geoMapItem displayMinZoom];
  return result;
}

- (BOOL)_hasDisplayMaxZoom
{
  return [(GEOMapItem *)self->_geoMapItem hasDisplayMaxZoom];
}

- (float)_displayMaxZoom
{
  [(GEOMapItem *)self->_geoMapItem displayMaxZoom];
  return result;
}

- (GEOMapRegion)_geoFenceMapRegion
{
  return (GEOMapRegion *)[(GEOMapItem *)self->_geoMapItem geoFenceMapRegion];
}

- (BOOL)_isMapItemTypeTransit
{
  if ([(MKMapItem *)self _hasTransit] || self->_isMapItemTypeTransit) {
    return 1;
  }
  id v4 = [(MKMapItem *)self _geoMapItem];
  BOOL v3 = [v4 _placeDisplayType] == 4;

  return v3;
}

- (BOOL)_hasTransit
{
  return [(GEOMapItem *)self->_geoMapItem _hasTransit];
}

- (NSString)_transitDisplayName
{
  double v2 = [(MKMapItem *)self _transitInfo];
  BOOL v3 = [v2 displayName];

  return (NSString *)v3;
}

- (BOOL)_hasTransitLabels
{
  double v2 = [(MKMapItem *)self _transitInfo];
  BOOL v3 = [v2 labelItems];
  BOOL v4 = [v3 count] != 0;

  return v4;
}

- (GEOTransitAttribution)_transitAttribution
{
  updatedTransitAttribution = self->_updatedTransitAttribution;
  if (updatedTransitAttribution)
  {
    BOOL v3 = updatedTransitAttribution;
  }
  else
  {
    BOOL v3 = [(GEOMapItem *)self->_geoMapItem _transitAttribution];
  }

  return v3;
}

- (id)_formatterForAdamId
{
  numberFormatterForAdamId = self->_numberFormatterForAdamId;
  if (!numberFormatterForAdamId)
  {
    BOOL v4 = (NSNumberFormatter *)objc_alloc_init(MEMORY[0x1E4F28EE0]);
    uint64_t v5 = self->_numberFormatterForAdamId;
    self->_numberFormatterForAdamId = v4;

    [(NSNumberFormatter *)self->_numberFormatterForAdamId setNumberStyle:1];
    numberFormatterForAdamId = self->_numberFormatterForAdamId;
  }

  return numberFormatterForAdamId;
}

- (void)preloadTransitInfoWithCompletion:(id)a3
{
  BOOL v4 = (void (**)(void))a3;
  if (v4)
  {
    uint64_t v5 = [(MKMapItem *)self _transitInfo];
    uint64_t v6 = [v5 labelItems];
    uint64_t v7 = [v6 count];

    if (v7)
    {
      objc_initWeak(&location, self);
      CFLocaleRef v8 = [MKTransitInfoPreloader alloc];
      uint64_t v9 = [(MKMapItem *)self _transitInfo];
      uint64_t v10 = [v9 labelItems];
      uint64_t v11 = [(MKTransitInfoPreloader *)v8 initWithTransitLabels:v10];

      v12[0] = MEMORY[0x1E4F143A8];
      v12[1] = 3221225472;
      v12[2] = __46__MKMapItem_preloadTransitInfoWithCompletion___block_invoke;
      v12[3] = &unk_1E54BBDC8;
      objc_copyWeak(&v14, &location);
      char v13 = v4;
      [(MKTransitInfoPreloader *)v11 preloadWithCompletion:v12];

      objc_destroyWeak(&v14);
      objc_destroyWeak(&location);
    }
    else
    {
      v4[2](v4);
    }
  }
}

void __46__MKMapItem_preloadTransitInfoWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  id v6 = a2;
  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 40));
  uint64_t v5 = WeakRetained;
  if (WeakRetained) {
    objc_storeStrong(WeakRetained + 31, a2);
  }
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (BOOL)_hasFlyover
{
  return [(GEOMapItem *)self->_geoMapItem _hasFlyover];
}

- (GEOPDFlyover)_flyover
{
  return (GEOPDFlyover *)[(GEOMapItem *)self->_geoMapItem _flyover];
}

- (NSString)_flyoverAnnouncementMessage
{
  return (NSString *)[(GEOMapItem *)self->_geoMapItem _flyoverAnnouncementMessage];
}

- (NSArray)_browseCategories
{
  return (NSArray *)[(GEOMapItem *)self->_geoMapItem _browseCategories];
}

- (GEOMiniBrowseCategories)_miniBrowseCategories
{
  return (GEOMiniBrowseCategories *)[(GEOMapItem *)self->_geoMapItem _miniBrowseCategories];
}

- (int)_placeDisplayStyle
{
  return [(GEOMapItem *)self->_geoMapItem _placeDisplayStyle];
}

- (GEOAnnotatedItemList)_annotatedItemList
{
  return (GEOAnnotatedItemList *)[(GEOMapItem *)self->_geoMapItem _annotatedItemList];
}

- (BOOL)_hasMuninViewState
{
  double v2 = [(GEOMapItem *)self->_geoMapItem _muninViewState];
  BOOL v3 = v2 != 0;

  return v3;
}

- (GEOMuninViewState)_muninViewState
{
  return (GEOMuninViewState *)[(GEOMapItem *)self->_geoMapItem _muninViewState];
}

- (MKMapItemIdentifier)identifier
{
  double v2 = [(MKMapItem *)self _identifier];
  BOOL v3 = [v2 geoMapItemIdentifier];
  if ([v3 hasMapsIdentifierString]) {
    BOOL v4 = v2;
  }
  else {
    BOOL v4 = 0;
  }
  uint64_t v5 = v4;

  return v5;
}

- (NSSet)alternateIdentifiers
{
  alternateIdentifiers = self->_alternateIdentifiers;
  if (!alternateIdentifiers)
  {
    BOOL v4 = [(GEOMapItem *)self->_geoMapItem _alternateIdentifiers];
    uint64_t v5 = [v4 count];

    if (v5)
    {
      id v6 = objc_alloc(MEMORY[0x1E4F1CA80]);
      uint64_t v7 = [(GEOMapItem *)self->_geoMapItem _alternateIdentifiers];
      CFLocaleRef v8 = objc_msgSend(v6, "initWithCapacity:", objc_msgSend(v7, "count"));

      uint64_t v9 = [(GEOMapItem *)self->_geoMapItem _alternateIdentifiers];
      v17[0] = MEMORY[0x1E4F143A8];
      v17[1] = 3221225472;
      void v17[2] = __33__MKMapItem_alternateIdentifiers__block_invoke;
      v17[3] = &unk_1E54BBDF0;
      id v18 = v8;
      id v10 = v8;
      [v9 enumerateObjectsUsingBlock:v17];

      uint64_t v11 = (NSSet *)[v10 copy];
      uint64_t v12 = self->_alternateIdentifiers;
      self->_alternateIdentifiers = v11;
    }
    else
    {
      char v13 = (NSSet *)objc_alloc_init(MEMORY[0x1E4F1CAD0]);
      id v14 = self->_alternateIdentifiers;
      self->_alternateIdentifiers = v13;
    }
    alternateIdentifiers = self->_alternateIdentifiers;
  }
  long long v15 = alternateIdentifiers;

  return v15;
}

void __33__MKMapItem_alternateIdentifiers__block_invoke(uint64_t a1, void *a2)
{
  id v4 = a2;
  if ([v4 hasMapsIdentifierString])
  {
    BOOL v3 = [[MKMapItemIdentifier alloc] initWithGEOMapItemIdentifier:v4];
    if (v3) {
      [*(id *)(a1 + 32) addObject:v3];
    }
  }
}

- (id)_identifier
{
  if (!self->_identifier && [(GEOMapItem *)self->_geoMapItem _hasMUID])
  {
    BOOL v3 = [MKMapItemIdentifier alloc];
    id v4 = [(GEOMapItem *)self->_geoMapItem _identifier];
    uint64_t v5 = [(MKMapItemIdentifier *)v3 initWithGEOMapItemIdentifier:v4];
    identifier = self->_identifier;
    self->_identifier = v5;
  }
  uint64_t v7 = self->_identifier;

  return v7;
}

- (BOOL)_hasResultProviderID
{
  return [(GEOMapItem *)self->_geoMapItem _hasResultProviderID];
}

- (int)_resultProviderID
{
  return [(GEOMapItem *)self->_geoMapItem _resultProviderID];
}

- (BOOL)_hasUserRatingScore
{
  return [(GEOMapItem *)self->_geoMapItem _hasUserRatingScore];
}

- (unsigned)_sampleSizeForUserRatingScore
{
  return [(GEOMapItem *)self->_geoMapItem _sampleSizeForUserRatingScore];
}

- (NSString)_localizedSampleSizeForUserRatingScoreString
{
  localizedSampleSizeForUserRatingScoreuint64_t String = self->_localizedSampleSizeForUserRatingScoreString;
  if (!localizedSampleSizeForUserRatingScoreString)
  {
    id v4 = (void *)MEMORY[0x1E4F28EE0];
    uint64_t v5 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", -[MKMapItem _sampleSizeForUserRatingScore](self, "_sampleSizeForUserRatingScore"));
    id v6 = [v4 localizedStringFromNumber:v5 numberStyle:0];
    uint64_t v7 = self->_localizedSampleSizeForUserRatingScoreString;
    self->_localizedSampleSizeForUserRatingScoreuint64_t String = v6;

    localizedSampleSizeForUserRatingScoreuint64_t String = self->_localizedSampleSizeForUserRatingScoreString;
  }

  return localizedSampleSizeForUserRatingScoreString;
}

- (BOOL)_hasPriceDescription
{
  double v2 = [(GEOMapItem *)self->_geoMapItem _priceDescription];
  char v3 = [v2 hasPriceDescription];

  return v3;
}

- (NSString)_priceDescription
{
  double v2 = [(GEOMapItem *)self->_geoMapItem _priceDescription];
  char v3 = [v2 priceDescription];

  return (NSString *)v3;
}

- (float)_normalizedUserRatingScore
{
  [(GEOMapItem *)self->_geoMapItem _normalizedUserRatingScore];
  return result;
}

- (BOOL)_hasPriceRange
{
  return [(GEOMapItem *)self->_geoMapItem _hasPriceRange];
}

- (NSString)_priceRangeString
{
  char v3 = [MEMORY[0x1E4F1CA20] currentLocale];
  id v4 = MKCurrencySymbolForLocale(v3);

  int v5 = [(GEOMapItem *)self->_geoMapItem _priceRange];
  if (v5)
  {
    int v6 = v5;
    uint64_t v7 = &stru_1ED919588;
    do
    {
      CFLocaleRef v8 = [NSString stringWithFormat:@"%@%@", v7, v4];

      uint64_t v7 = v8;
      --v6;
    }
    while (v6);
  }
  else
  {
    CFLocaleRef v8 = &stru_1ED919588;
  }

  return (NSString *)v8;
}

- (GEOAddress)_geoAddress
{
  return (GEOAddress *)[(GEOMapItem *)self->_geoMapItem geoAddress];
}

- (id)_localizedCategoryNamesForType:(unsigned int)a3
{
  return (id)[(GEOMapItem *)self->_geoMapItem _localizedCategoryNamesForType:*(void *)&a3];
}

- (BOOL)_hasLocalizedCategoryNamesForType:(unsigned int)a3
{
  return [(GEOMapItem *)self->_geoMapItem _hasLocalizedCategoryNamesForType:*(void *)&a3];
}

- (NSString)_firstLocalizedCategoryName
{
  firstLocalizedCategoryName = self->_firstLocalizedCategoryName;
  if (!firstLocalizedCategoryName)
  {
    id v4 = [(MKMapItem *)self _localizedCategoryNamesForType:1];
    int v5 = [v4 firstObject];
    int v6 = self->_firstLocalizedCategoryName;
    self->_firstLocalizedCategoryName = v5;

    firstLocalizedCategoryName = self->_firstLocalizedCategoryName;
  }

  return firstLocalizedCategoryName;
}

- (BOOL)_hasAnyAmenities
{
  return [(GEOMapItem *)self->_geoMapItem _hasAnyAmenities];
}

- (NSArray)_amenities
{
  return (NSArray *)[(GEOMapItem *)self->_geoMapItem _amenities];
}

- (BOOL)hasAmenityType:(int)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v4 = [(GEOMapItem *)self->_geoMapItem _amenities];
  uint64_t v5 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v12;
    while (2)
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v12 != v7) {
          objc_enumerationMutation(v4);
        }
        if ([*(id *)(*((void *)&v11 + 1) + 8 * i) amenityType] == a3)
        {
          BOOL v9 = 1;
          goto LABEL_11;
        }
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
      if (v6) {
        continue;
      }
      break;
    }
  }
  BOOL v9 = 0;
LABEL_11:

  return v9;
}

- (BOOL)valueForAmenityType:(int)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v4 = [(GEOMapItem *)self->_geoMapItem _amenities];
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
        BOOL v9 = *(void **)(*((void *)&v12 + 1) + 8 * i);
        if ([v9 amenityType] == a3)
        {
          char v10 = [v9 isAmenityPresent];
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
  char v10 = 0;
LABEL_11:

  return v10;
}

- (BOOL)_hasAcceptsApplePayAmenity
{
  return [(MKMapItem *)self hasAmenityType:21];
}

- (BOOL)_acceptsApplePay
{
  return [(MKMapItem *)self valueForAmenityType:21];
}

- (BOOL)_responseStatusIsIncomplete
{
  return [(GEOMapItem *)self->_geoMapItem _responseStatusIsIncomplete];
}

- (BOOL)_hasOperatingHours
{
  return [(GEOMapItem *)self->_geoMapItem _hasOperatingHours];
}

- (BOOL)_hasLocalizedOperatingHours
{
  return [(GEOMapItem *)self->_geoMapItem _hasCurrentOperatingHours];
}

+ (id)_localizedNextOpeningHoursFormatter
{
  if (qword_1EB315FE0 != -1) {
    dispatch_once(&qword_1EB315FE0, &__block_literal_global_460);
  }
  double v2 = [MEMORY[0x1E4F1CAF0] localTimeZone];
  [(id)qword_1EB315FD8 setTimeZone:v2];

  char v3 = (void *)qword_1EB315FD8;

  return v3;
}

uint64_t __48__MKMapItem__localizedNextOpeningHoursFormatter__block_invoke()
{
  id v0 = objc_alloc_init(MEMORY[0x1E4F28C10]);
  v1 = (void *)qword_1EB315FD8;
  qword_1EB315FD8 = (uint64_t)v0;

  [(id)qword_1EB315FD8 setDateStyle:0];
  double v2 = (void *)qword_1EB315FD8;

  return [v2 setTimeStyle:1];
}

+ (id)_localizedNextOpeningDayOftheWeekFormatter
{
  if (qword_1EB315FF0 != -1) {
    dispatch_once(&qword_1EB315FF0, &__block_literal_global_463);
  }
  double v2 = [MEMORY[0x1E4F1CAF0] localTimeZone];
  [(id)qword_1EB315FE8 setTimeZone:v2];

  char v3 = (void *)qword_1EB315FE8;

  return v3;
}

uint64_t __55__MKMapItem__localizedNextOpeningDayOftheWeekFormatter__block_invoke()
{
  id v0 = objc_alloc_init(MEMORY[0x1E4F28C10]);
  v1 = (void *)qword_1EB315FE8;
  qword_1EB315FE8 = (uint64_t)v0;

  [(id)qword_1EB315FE8 setDateFormat:@"cccc"];
  double v2 = (void *)qword_1EB315FE8;

  return [v2 setFormattingContext:1];
}

- (id)hoursBuilderForSearchResultCellForOptions:(unint64_t)a3 conciseStyle:(BOOL)a4
{
  return [(MKMapItem *)self hoursBuilderForSearchResultCellForOptions:128 conciseStyle:a4 openAt:0];
}

- (id)searchResultsHoursWithConciseStyle:(BOOL)a3 openAt:(id)a4
{
  return [(MKMapItem *)self hoursBuilderForSearchResultCellForOptions:128 conciseStyle:a3 openAt:a4];
}

- (id)hoursBuilderForSearchResultCellForOptions:(unint64_t)a3 conciseStyle:(BOOL)a4 openAt:(id)a5
{
  BOOL v5 = a4;
  id v8 = a5;
  BOOL v9 = (void *)[(NSDictionary *)self->_cachedHoursBuilder mutableCopy];
  cachedHoursBuilder = self->_cachedHoursBuilder;
  if (!cachedHoursBuilder)
  {
    id v11 = objc_alloc_init(MEMORY[0x1E4F1CA60]);

    objc_storeStrong((id *)&self->_cachedHoursBuilder, v11);
    cachedHoursBuilder = self->_cachedHoursBuilder;
    BOOL v9 = v11;
  }
  long long v12 = [NSNumber numberWithUnsignedInteger:a3];
  long long v13 = [(NSDictionary *)cachedHoursBuilder objectForKey:v12];

  if (!v13)
  {
    long long v13 = [[_MKLocalizedHoursBuilder alloc] initWithMapItem:self localizedHoursStringOptions:a3 conciseStyle:v5 openAt:v8];
    long long v14 = [NSNumber numberWithUnsignedInteger:a3];
    [v9 setObject:v13 forKey:v14];

    long long v15 = (NSDictionary *)[v9 copy];
    uint64_t v16 = self->_cachedHoursBuilder;
    self->_cachedHoursBuilder = v15;
  }
  uint64_t v17 = v13;

  return v17;
}

- (id)_localizedNextOpeningStringShort:(BOOL)a3
{
  BOOL v77 = a3;
  uint64_t v100 = *MEMORY[0x1E4F143B8];
  id v4 = [(MKMapItem *)self _geoMapItem];
  BOOL v5 = [v4 _messageLink];
  uint64_t v6 = [v5 messageBusinessHours];
  uint64_t v7 = [v6 placeDailyHours];

  id v8 = [(MKMapItem *)self _geoMapItem];
  BOOL v9 = [v8 _messageLink];
  uint64_t v10 = [v9 timeZone];

  uint64_t v11 = [MEMORY[0x1E4F1C9C8] date];
  long long v12 = [MEMORY[0x1E4F1C9A8] currentCalendar];
  long long v13 = [v12 components:512 fromDate:v11];

  v79 = v13;
  unint64_t v14 = [v13 weekday];
  long long v15 = [MEMORY[0x1E4F1C9A8] currentCalendar];
  v80 = (void *)v10;
  [v15 setTimeZone:v10];
  long long v94 = 0u;
  long long v95 = 0u;
  long long v92 = 0u;
  long long v93 = 0u;
  id v16 = v7;
  uint64_t v17 = [v16 countByEnumeratingWithState:&v92 objects:v99 count:16];
  v81 = (void *)v11;
  id v82 = v16;
  if (v17)
  {
    uint64_t v18 = v17;
    uint64_t v19 = *(void *)v93;
    uint64_t v70 = *(void *)v93;
    unint64_t v72 = v14;
    do
    {
      uint64_t v20 = 0;
      uint64_t v74 = v18;
      do
      {
        if (*(void *)v93 != v19) {
          objc_enumerationMutation(v16);
        }
        CLLocationDegrees v21 = *(void **)(*((void *)&v92 + 1) + 8 * v20);
        unint64_t v22 = [v21 dayOfWeekRange];
        if (v14 >= v22 && v14 - v22 < v23)
        {
          id v25 = [v15 components:96 fromDate:v11];
          long long v88 = 0u;
          long long v89 = 0u;
          long long v90 = 0u;
          long long v91 = 0u;
          uint64_t v26 = [v21 openIntervals];
          uint64_t v27 = [v26 countByEnumeratingWithState:&v88 objects:v98 count:16];
          if (v27)
          {
            uint64_t v28 = v27;
            uint64_t v29 = *(void *)v89;
            while (2)
            {
              for (uint64_t i = 0; i != v28; ++i)
              {
                if (*(void *)v89 != v29) {
                  objc_enumerationMutation(v26);
                }
                v31 = *(void **)(*((void *)&v88 + 1) + 8 * i);
                uint64_t v32 = [v31 startDate];
                v33 = [v15 components:96 fromDate:v32];

                uint64_t v34 = [v33 hour];
                if (v34 > [v25 hour]
                  || (uint64_t v35 = [v33 hour], v35 == objc_msgSend(v25, "hour"))
                  && (uint64_t v36 = [v33 minute], v36 > objc_msgSend(v25, "minute")))
                {
                  v52 = +[MKMapItem _localizedNextOpeningHoursFormatter];
                  v53 = [v31 startDate];
                  v54 = [v52 stringFromDate:v53];

                  if (v77) {
                    v55 = @"Will open at %@";
                  }
                  else {
                    v55 = @"Business is closed and will open at %@";
                  }
                  v56 = _MKLocalizedStringFromThisBundle(v55);
                  objc_msgSend(NSString, "stringWithFormat:", v56, v54);
                  id v49 = (id)objc_claimAutoreleasedReturnValue();

                  v50 = v81;
                  id v16 = v82;
                  v37 = v82;
                  v51 = v79;
LABEL_53:

                  goto LABEL_54;
                }
              }
              uint64_t v28 = [v26 countByEnumeratingWithState:&v88 objects:v98 count:16];
              if (v28) {
                continue;
              }
              break;
            }
          }

          uint64_t v11 = (uint64_t)v81;
          id v16 = v82;
          uint64_t v19 = v70;
          unint64_t v14 = v72;
          uint64_t v18 = v74;
        }
        ++v20;
      }
      while (v20 != v18);
      uint64_t v18 = [v16 countByEnumeratingWithState:&v92 objects:v99 count:16];
    }
    while (v18);
  }

  v37 = [v15 components:528 fromDate:v11];
  for (uint64_t j = 1; j != 7; ++j)
  {
    long long v86 = 0u;
    long long v87 = 0u;
    long long v84 = 0u;
    long long v85 = 0u;
    id v25 = v16;
    uint64_t v38 = [v25 countByEnumeratingWithState:&v84 objects:v97 count:16];
    if (v38)
    {
      uint64_t v39 = v38;
      uint64_t v40 = *(void *)v85;
      while (2)
      {
        for (uint64_t k = 0; k != v39; ++k)
        {
          if (*(void *)v85 != v40) {
            objc_enumerationMutation(v25);
          }
          long long v42 = *(void **)(*((void *)&v84 + 1) + 8 * k);
          uint64_t v43 = [v37 weekday];
          uint64_t v44 = ((unint64_t)(j - 1 + v43) * (unsigned __int128)0x2492492492492493uLL) >> 64;
          unint64_t v45 = j + v43 - 7 * ((v44 + ((unint64_t)(j - 1 + v43 - v44) >> 1)) >> 2);
          unint64_t v46 = [v42 dayOfWeekRange];
          if (v45 >= v46 && v45 - v46 < v47)
          {
            memset(v83, 0, sizeof(v83));
            uint64_t v26 = [v42 openIntervals];
            if ([v26 countByEnumeratingWithState:v83 objects:v96 count:16])
            {
              v57 = (void *)**((void **)&v83[0] + 1);
              if (j == 1)
              {
                v58 = +[MKMapItem _localizedNextOpeningHoursFormatter];
                v59 = [v57 startDate];
                v60 = [v58 stringFromDate:v59];

                if (v77) {
                  v61 = @"Will open at %@";
                }
                else {
                  v61 = @"Business is closed and will open at %@";
                }
                v62 = _MKLocalizedStringFromThisBundle(v61);
                v63 = objc_msgSend(NSString, "stringWithFormat:", v62, v60);
              }
              else
              {
                if (v77) {
                  v64 = @"Will open %1$@ at %2$@";
                }
                else {
                  v64 = @"Business is closed and will open %1$@ at %2$@";
                }
                uint64_t v65 = _MKLocalizedStringFromThisBundle(v64);
                v73 = NSString;
                v76 = (void *)v65;
                v62 = +[MKMapItem _localizedNextOpeningDayOftheWeekFormatter];
                v78 = [v57 startDate];
                v71 = [v62 stringFromDate:v78];
                v66 = +[MKMapItem _localizedNextOpeningHoursFormatter];
                v67 = [v57 startDate];
                v68 = [v66 stringFromDate:v67];
                v60 = v76;
                v63 = objc_msgSend(v73, "stringWithFormat:", v76, v71, v68);
              }
              v50 = v81;
              id v16 = v82;
              v51 = v79;

              id v49 = v63;
              goto LABEL_53;
            }
          }
        }
        uint64_t v39 = [v25 countByEnumeratingWithState:&v84 objects:v97 count:16];
        if (v39) {
          continue;
        }
        break;
      }
    }

    id v16 = v82;
  }
  id v49 = 0;
  v50 = v81;
  v51 = v79;
LABEL_54:

  return v49;
}

- (GEOBusinessHours)_messageBusinessHours
{
  double v2 = [(GEOMapItem *)self->_geoMapItem _messageLink];
  char v3 = [v2 messageBusinessHours];

  return (GEOBusinessHours *)v3;
}

- (NSString)_localizedResponseTime
{
  double v2 = [(GEOMapItem *)self->_geoMapItem _messageLink];
  unsigned int v3 = [v2 responseTime];
  if (v3 > 5)
  {
    id v4 = 0;
  }
  else
  {
    id v4 = _MKLocalizedStringFromThisBundle(off_1E54BBEB0[v3]);
  }

  return (NSString *)v4;
}

- (BOOL)_hasEncyclopedicInfo
{
  return [(GEOMapItem *)self->_geoMapItem _hasEncyclopedicInfo];
}

- (GEOEncyclopedicInfo)_encyclopedicInfo
{
  return (GEOEncyclopedicInfo *)[(GEOMapItem *)self->_geoMapItem _encyclopedicInfo];
}

- (unint64_t)_openingHoursOptions
{
  return [(GEOMapItem *)self->_geoMapItem _openingHoursOptions];
}

- (NSData)_placeDataAsData
{
  return (NSData *)[(GEOMapItem *)self->_geoMapItem _placeDataAsData];
}

- (NSString)_poiSurveyURLString
{
  return (NSString *)[(GEOMapItem *)self->_geoMapItem _poiSurveyURLString];
}

- (NSString)_poiPinpointURLString
{
  return (NSString *)[(GEOMapItem *)self->_geoMapItem _poiPinpointURLString];
}

- (BOOL)_hasChargerNumberString
{
  double v2 = [(MKMapItem *)self _chargerNumberString];
  BOOL v3 = [v2 length] != 0;

  return v3;
}

- (NSString)_chargerNumberString
{
  BOOL v3 = [(MKMapItem *)self pointOfInterestCategory];

  id v4 = [(MKMapItem *)self _factoidWithSemantic:1];
  BOOL v5 = v4;
  if (v3 != @"MKPOICategoryEVCharger" || v4 == 0)
  {
    id v8 = 0;
  }
  else
  {
    [v4 value];
    id v8 = (void *)v7;
    uint64_t v9 = _MKLocalizedStringFromThisBundle(@"Number_of_Chargers");
    uint64_t v10 = (void *)v9;
    if (v8)
    {
      id v8 = objc_msgSend(NSString, "stringWithFormat:", v9, v8);
    }
  }

  return (NSString *)v8;
}

- (id)_factoidWithSemantic:(int)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v4 = [(MKMapItem *)self _encyclopedicInfo];
  BOOL v5 = [v4 factoids];

  uint64_t v6 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v14;
    while (2)
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v14 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = *(void **)(*((void *)&v13 + 1) + 8 * i);
        if ([v10 semantic] == a3)
        {
          id v11 = v10;
          goto LABEL_11;
        }
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
      if (v7) {
        continue;
      }
      break;
    }
  }
  id v11 = 0;
LABEL_11:

  return v11;
}

- (GEOEVChargerAvailability)_realTimeAvailableEVCharger
{
  chargerAvailability = self->_chargerAvailability;
  if (chargerAvailability)
  {
    BOOL v3 = chargerAvailability;
  }
  else
  {
    id v5 = objc_alloc(MEMORY[0x1E4F64570]);
    uint64_t v6 = [(GEOMapItem *)self->_geoMapItem _placeData];
    uint64_t v7 = (GEOEVChargerAvailability *)[v5 initWithPlaceData:v6];

    uint64_t v8 = self->_chargerAvailability;
    self->_chargerAvailability = v7;
    uint64_t v9 = v7;

    BOOL v3 = self->_chargerAvailability;
  }

  return v3;
}

- (GEOBusinessAssets)_businessAssets
{
  return (GEOBusinessAssets *)[(GEOMapItem *)self->_geoMapItem businessAssets];
}

- (BOOL)_isClaimed
{
  double v2 = [(MKMapItem *)self _poiClaim];
  char v3 = [v2 isClaimed];

  return v3;
}

- (BOOL)_canBeClaimed
{
  double v2 = [(MKMapItem *)self _poiClaim];
  char v3 = [v2 isClaimable];

  return v3;
}

- (void)openInMapsWithLaunchOptions:(NSDictionary *)launchOptions fromScene:(UIScene *)scene completionHandler:(void *)completion
{
  id v11 = scene;
  uint64_t v8 = completion;
  uint64_t v9 = +[MKMapItem urlForMapItem:self options:launchOptions];
  if (v9)
  {
    uint64_t v10 = +[MKSystemController sharedInstance];
    [v10 openURL:v9 fromScene:v11 completionHandler:v8];
  }
  else if (v8)
  {
    v8[2](v8, 0);
  }
}

+ (void)openMapsWithItems:(NSArray *)mapItems launchOptions:(NSDictionary *)launchOptions fromScene:(UIScene *)scene completionHandler:(void *)completion
{
  long long v12 = scene;
  uint64_t v9 = completion;
  uint64_t v10 = +[MKMapItem urlForMapItems:mapItems options:launchOptions];
  if (v10)
  {
    id v11 = +[MKSystemController sharedInstance];
    [v11 openURL:v10 fromScene:v12 completionHandler:v9];
  }
  else if (v9)
  {
    v9[2](v9, 0);
  }
}

- (BOOL)openInMapsWithLaunchOptions:(NSDictionary *)launchOptions
{
  char v3 = +[MKMapItem urlForMapItem:self options:launchOptions];
  if (v3)
  {
    id v4 = +[MKUsageCounter sharedCounter];
    [v4 countUsageOfTypeIfNeeded:57];

    id v5 = +[MKSystemController sharedInstance];
    char v6 = [v5 openURL:v3];
  }
  else
  {
    char v6 = 0;
  }

  return v6;
}

- (void)openInMapsWithLaunchOptions:(id)a3 completionHandler:(id)a4
{
  uint64_t v8 = (void (**)(id, void))a4;
  char v6 = +[MKMapItem urlForMapItem:self options:a3];
  if (v6)
  {
    uint64_t v7 = +[MKSystemController sharedInstance];
    [v7 openURL:v6 completionHandler:v8];
  }
  else if (v8)
  {
    v8[2](v8, 0);
  }
}

+ (BOOL)openMapsWithItems:(NSArray *)mapItems launchOptions:(NSDictionary *)launchOptions
{
  id v4 = +[MKMapItem urlForMapItems:mapItems options:launchOptions];
  if (v4)
  {
    id v5 = +[MKUsageCounter sharedCounter];
    [v5 countUsageOfTypeIfNeeded:56];

    char v6 = +[MKSystemController sharedInstance];
    char v7 = [v6 openURL:v4];
  }
  else
  {
    char v7 = 0;
  }

  return v7;
}

+ (void)openMapsWithItems:(id)a3 launchOptions:(id)a4 completionHandler:(id)a5
{
  uint64_t v9 = (void (**)(id, void))a5;
  char v7 = +[MKMapItem urlForMapItems:a3 options:a4];
  if (v7)
  {
    uint64_t v8 = +[MKSystemController sharedInstance];
    [v8 openURL:v7 completionHandler:v9];
  }
  else if (v9)
  {
    v9[2](v9, 0);
  }
}

+ (id)plistCompatibleDictionaryFromStandardOptions:(id)a3
{
  id v3 = a3;
  id v4 = [v3 objectForKey:@"MKLaunchOptionsMapCenter"];
  id v5 = [v3 objectForKey:@"MKLaunchOptionsMapSpan"];
  char v6 = [v3 objectForKey:@"MKLaunchOptionsCameraKey"];
  char v7 = [v3 objectForKeyedSubscript:@"MKLaunchOptionsTimePointKey"];
  uint64_t v8 = [v3 objectForKeyedSubscript:@"MKLaunchOptionsAutomobileOptions"];
  uint64_t v9 = [v3 objectForKeyedSubscript:@"MKLaunchOptionsWalkingOptions"];
  uint64_t v10 = [v3 objectForKeyedSubscript:@"MKLaunchOptionsTransitOptions"];
  id v11 = [v3 objectForKeyedSubscript:@"MKLaunchOptionsCyclingOptions"];
  if (v4 || v5 || v6 || v7 || v8 || v9 || v10 || (long long v12 = v3, v11))
  {
    id v45 = v11;
    long long v12 = (void *)[v3 mutableCopy];
    unint64_t v13 = 0x1E4F1C000;
    uint64_t v43 = v8;
    uint64_t v44 = v4;
    if (v4)
    {
      [v4 MKCoordinateValue];
      double v15 = v14;
      v41 = (void *)MEMORY[0x1E4F1C9E8];
      long long v16 = objc_msgSend(NSNumber, "numberWithDouble:");
      [NSNumber numberWithDouble:v15];
      uint64_t v17 = v10;
      uint64_t v18 = v7;
      uint64_t v19 = v9;
      uint64_t v20 = v6;
      v22 = CLLocationDegrees v21 = v5;
      unint64_t v23 = objc_msgSend(v41, "dictionaryWithObjectsAndKeys:", v16, @"MKLaunchOptionsMapCenterLatitude", v22, @"MKLaunchOptionsMapCenterLongitude", 0);

      id v5 = v21;
      char v6 = v20;
      uint64_t v9 = v19;
      char v7 = v18;
      uint64_t v10 = v17;
      uint64_t v8 = v43;

      id v4 = v44;
      [v12 setObject:v23 forKey:@"MKLaunchOptionsMapCenter"];

      unint64_t v13 = 0x1E4F1C000uLL;
    }
    if (v5)
    {
      [v5 MKCoordinateSpanValue];
      double v25 = v24;
      long long v42 = *(void **)(v13 + 2536);
      uint64_t v26 = objc_msgSend(NSNumber, "numberWithDouble:");
      [NSNumber numberWithDouble:v25];
      uint64_t v27 = v10;
      uint64_t v28 = v7;
      uint64_t v29 = v9;
      long long v30 = v6;
      uint64_t v32 = v31 = v5;
      v33 = objc_msgSend(v42, "dictionaryWithObjectsAndKeys:", v26, @"MKLaunchOptionsMapSpanLatitude", v32, @"MKLaunchOptionsMapSpanLongitude", 0);

      id v5 = v31;
      char v6 = v30;
      uint64_t v9 = v29;
      char v7 = v28;
      uint64_t v10 = v27;
      uint64_t v8 = v43;

      id v4 = v44;
      [v12 setObject:v33 forKey:@"MKLaunchOptionsMapSpan"];
    }
    if (v6)
    {
      uint64_t v34 = [MEMORY[0x1E4F28DB0] archivedDataWithRootObject:v6 requiringSecureCoding:1 error:0];
      [v12 setObject:v34 forKeyedSubscript:@"MKLaunchOptionsSerializedCameraKey"];
      [v12 removeObjectForKey:@"MKLaunchOptionsCameraKey"];
    }
    if (v7)
    {
      uint64_t v35 = [v7 data];
      [v12 setObject:v35 forKeyedSubscript:@"MKLaunchOptionsSerializedTimePointKey"];

      [v12 removeObjectForKey:@"MKLaunchOptionsTimePointKey"];
    }
    if (v8)
    {
      uint64_t v36 = [v8 data];
      [v12 setObject:v36 forKeyedSubscript:@"MKLaunchOptionsSerializedAutomobileOptions"];

      [v12 removeObjectForKey:@"MKLaunchOptionsAutomobileOptions"];
    }
    if (v10)
    {
      v37 = [v8 data];
      [v12 setObject:v37 forKeyedSubscript:@"MKLaunchOptionsSerializedTransitOptions"];

      [v12 removeObjectForKey:@"MKLaunchOptionsTransitOptions"];
    }
    if (v9)
    {
      uint64_t v38 = [v8 data];
      [v12 setObject:v38 forKeyedSubscript:@"MKLaunchOptionsSerializedWalkingOptions"];

      [v12 removeObjectForKey:@"MKLaunchOptionsWalkingOptions"];
    }
    if (v45)
    {
      uint64_t v39 = [v8 data];
      [v12 setObject:v39 forKeyedSubscript:@"MKLaunchOptionsSerializedCyclingOptions"];

      [v12 removeObjectForKey:@"MKLaunchOptionsCyclingOptions"];
    }

    id v11 = v45;
  }

  return v12;
}

+ (id)standardOptionsFromPlistCompatibleDictionary:(id)a3
{
  id v3 = a3;
  id v4 = [v3 objectForKey:@"MKLaunchOptionsMapCenter"];
  id v5 = [v3 objectForKey:@"MKLaunchOptionsMapSpan"];
  char v6 = [v3 objectForKey:@"MKLaunchOptionsSerializedCameraKey"];
  char v7 = [v3 objectForKeyedSubscript:@"MKLaunchOptionsSerializedTimePointKey"];
  uint64_t v8 = [v3 objectForKeyedSubscript:@"MKLaunchOptionsSerializedAutomobileOptions"];
  uint64_t v9 = [v3 objectForKeyedSubscript:@"MKLaunchOptionsSerializedTransitOptions"];
  uint64_t v10 = [v3 objectForKeyedSubscript:@"MKLaunchOptionsSerializedWalkingOptions"];
  id v11 = [v3 objectForKeyedSubscript:@"MKLaunchOptionsSerializedCyclingOptions"];
  if (v4 || v5 || v6 || v7 || v8 || v9 || v10 || (long long v12 = v3, v11))
  {
    id v48 = v11;
    long long v12 = (void *)[v3 mutableCopy];
    unint64_t v47 = v10;
    if (v4)
    {
      unint64_t v13 = [v4 objectForKey:@"MKLaunchOptionsMapCenterLatitude"];
      uint64_t v14 = [v4 objectForKey:@"MKLaunchOptionsMapCenterLongitude"];
      double v15 = (void *)v14;
      if (v13 && v14)
      {
        [v13 doubleValue];
        CLLocationDegrees v17 = v16;
        [v15 doubleValue];
        CLLocationCoordinate2D v19 = CLLocationCoordinate2DMake(v17, v18);
        objc_msgSend(MEMORY[0x1E4F29238], "valueWithMKCoordinate:", v19.latitude, v19.longitude);
        id v45 = v9;
        uint64_t v20 = v8;
        CLLocationDegrees v21 = v5;
        unint64_t v22 = v7;
        unint64_t v23 = v6;
        double v25 = v24 = v4;
        [v12 setObject:v25 forKey:@"MKLaunchOptionsMapCenter"];

        id v4 = v24;
        char v6 = v23;
        char v7 = v22;
        id v5 = v21;
        uint64_t v8 = v20;
        uint64_t v9 = v45;
      }
      else
      {
        [v12 removeObjectForKey:@"MKLaunchOptionsMapCenter"];
      }

      uint64_t v10 = v47;
    }
    if (v5)
    {
      uint64_t v26 = [v5 objectForKey:@"MKLaunchOptionsMapSpanLatitude"];
      uint64_t v27 = [v5 objectForKey:@"MKLaunchOptionsMapSpanLongitude"];
      uint64_t v28 = (void *)v27;
      if (v26 && v27)
      {
        [v26 doubleValue];
        double v30 = v29;
        [v28 doubleValue];
        objc_msgSend(MEMORY[0x1E4F29238], "valueWithMKCoordinateSpan:", v30, v31);
        unint64_t v46 = v9;
        uint64_t v32 = v8;
        v33 = v5;
        uint64_t v34 = v7;
        uint64_t v35 = v6;
        v37 = uint64_t v36 = v4;
        [v12 setObject:v37 forKey:@"MKLaunchOptionsMapSpan"];

        id v4 = v36;
        char v6 = v35;
        char v7 = v34;
        id v5 = v33;
        uint64_t v8 = v32;
        uint64_t v9 = v46;
      }
      else
      {
        [v12 removeObjectForKey:@"MKLaunchOptionsMapSpan"];
      }

      uint64_t v10 = v47;
    }
    if (v6)
    {
      uint64_t v38 = [MEMORY[0x1E4F28DC0] unarchivedObjectOfClass:objc_opt_class() fromData:v6 error:0];
      if (v38) {
        [v12 setObject:v38 forKeyedSubscript:@"MKLaunchOptionsCameraKey"];
      }
      [v12 removeObjectForKey:@"MKLaunchOptionsSerializedCameraKey"];

      uint64_t v10 = v47;
    }
    if (v7)
    {
      uint64_t v39 = (void *)[objc_alloc(MEMORY[0x1E4F64B78]) initWithData:v7];
      if (v39) {
        [v12 setObject:v39 forKeyedSubscript:@"MKLaunchOptionsTimePointKey"];
      }
      [v12 removeObjectForKey:@"MKLaunchOptionsSerializedTimePointKey"];
    }
    if (v8)
    {
      uint64_t v40 = (void *)[objc_alloc(MEMORY[0x1E4F64410]) initWithData:v8];
      if (v40) {
        [v12 setObject:v40 forKeyedSubscript:@"MKLaunchOptionsAutomobileOptions"];
      }
      [v12 removeObjectForKey:@"MKLaunchOptionsSerializedAutomobileOptions"];
    }
    if (v9)
    {
      v41 = (void *)[objc_alloc(MEMORY[0x1E4F64AF8]) initWithData:v9];
      if (v41) {
        [v12 setObject:v41 forKeyedSubscript:@"MKLaunchOptionsTransitOptions"];
      }
      [v12 removeObjectForKey:@"MKLaunchOptionsSerializedTransitOptions"];
    }
    if (v10)
    {
      long long v42 = (void *)[objc_alloc(MEMORY[0x1E4F64BE8]) initWithData:v10];
      if (v42) {
        [v12 setObject:v42 forKeyedSubscript:@"MKLaunchOptionsWalkingOptions"];
      }
      [v12 removeObjectForKey:@"MKLaunchOptionsSerializedWalkingOptions"];
    }
    if (v48)
    {
      uint64_t v43 = (void *)[objc_alloc(MEMORY[0x1E4F64508]) initWithData:v48];
      if (v43) {
        [v12 setObject:v43 forKeyedSubscript:@"MKLaunchOptionsCyclingOptions"];
      }
      [v12 removeObjectForKey:@"MKLaunchOptionsSerializedCyclingOptions"];
    }
    id v11 = v48;
  }

  return v12;
}

+ (MKMapItem)mapItemWithDictionary:(id)a3
{
  id v3 = a3;
  id v4 = [v3 objectForKey:@"MKMapItemIsCurrentLocation"];
  int v5 = [v4 BOOLValue];

  if (v5)
  {
    char v6 = +[MKMapItem mapItemForCurrentLocation];
  }
  else
  {
    char v7 = [v3 objectForKey:@"MKMapItemGEOMapItem"];
    if (v7)
    {
      uint64_t v8 = (void *)[objc_alloc(MEMORY[0x1E4F646E0]) initWithData:v7];
      uint64_t v9 = [[MKMapItem alloc] initWithGeoMapItem:v8 isPlaceHolderPlace:0];
    }
    else
    {
      id v10 = objc_alloc(MEMORY[0x1E4F64828]);
      id v11 = [v3 objectForKey:@"MKMapItemGEOPlace"];
      uint64_t v8 = (void *)[v10 initWithData:v11];

      uint64_t v9 = [[MKMapItem alloc] initWithPlace:v8];
    }
    char v6 = v9;

    long long v12 = [v3 objectForKeyedSubscript:@"MKMapItemName"];

    if (v12)
    {
      unint64_t v13 = [v3 objectForKeyedSubscript:@"MKMapItemName"];
      [v6 setName:v13];
    }
    uint64_t v14 = [v3 objectForKeyedSubscript:@"MKMapItemPhoneNumber"];

    if (v14)
    {
      double v15 = [v3 objectForKeyedSubscript:@"MKMapItemPhoneNumber"];
      [v6 setPhoneNumber:v15];
    }
    double v16 = [v3 objectForKeyedSubscript:@"MKMapItemURLString"];

    if (v16)
    {
      CLLocationDegrees v17 = (void *)MEMORY[0x1E4F1CB10];
      CLLocationDegrees v18 = [v3 objectForKeyedSubscript:@"MKMapItemURLString"];
      CLLocationCoordinate2D v19 = [v17 URLWithString:v18];
      [v6 setUrl:v19];
    }
    uint64_t v20 = [v3 objectForKeyedSubscript:@"MKMapItemTimeZoneName"];

    if (v20)
    {
      CLLocationDegrees v21 = (void *)MEMORY[0x1E4F1CAF0];
      unint64_t v22 = [v3 objectForKeyedSubscript:@"MKMapItemTimeZoneName"];
      unint64_t v23 = [v21 timeZoneWithName:v22];
      [v6 setTimeZone:v23];
    }
  }

  return (MKMapItem *)v6;
}

- (NSData)_handle
{
  if (self->_geoMapItem)
  {
    id v3 = [MEMORY[0x1E4F64710] sharedService];
    id v4 = [v3 handleForMapItem:self->_geoMapItem];
  }
  else
  {
    id v4 = 0;
  }

  return (NSData *)v4;
}

- (id)dictionaryRepresentation
{
  id v3 = [MEMORY[0x1E4F1CA60] dictionary];
  if (self->_isCurrentLocation)
  {
    id v4 = [NSNumber numberWithBool:1];
    [v3 setObject:v4 forKey:@"MKMapItemIsCurrentLocation"];
  }
  else
  {
    int v5 = [(GEOMapItemStorageUserValues *)self->_userValues name];

    if (v5)
    {
      char v6 = [(GEOMapItemStorageUserValues *)self->_userValues name];
      [v3 setObject:v6 forKey:@"MKMapItemName"];
    }
    char v7 = [(GEOMapItemStorageUserValues *)self->_userValues phoneNumber];

    if (v7)
    {
      uint64_t v8 = [(GEOMapItemStorageUserValues *)self->_userValues phoneNumber];
      [v3 setObject:v8 forKey:@"MKMapItemPhoneNumber"];
    }
    uint64_t v9 = [(GEOMapItemStorageUserValues *)self->_userValues url];

    if (v9)
    {
      id v10 = [(GEOMapItemStorageUserValues *)self->_userValues url];
      [v3 setObject:v10 forKey:@"MKMapItemURLString"];
    }
    id v11 = [(GEOMapItemStorageUserValues *)self->_userValues timeZoneName];

    if (v11)
    {
      long long v12 = [(GEOMapItemStorageUserValues *)self->_userValues timeZoneName];
      [v3 setObject:v12 forKey:@"MKMapItemTimeZoneName"];
    }
    if (self->_geoMapItem)
    {
      id v4 = [(MKMapItem *)self _geoMapItemStorageForPersistence];
      unint64_t v13 = [v4 data];
      if (v13)
      {
        uint64_t v14 = [v4 data];
        [v3 setObject:v14 forKey:@"MKMapItemGEOMapItem"];
      }
    }
    else
    {
      double v15 = [(MKMapItem *)self place];

      if (!v15) {
        goto LABEL_18;
      }
      id v4 = [(MKMapItem *)self place];
      unint64_t v13 = [v4 data];
      [v3 setObject:v13 forKey:@"MKMapItemGEOPlace"];
    }
  }
LABEL_18:

  return v3;
}

- (id)urlRepresentation
{
  v7[1] = *MEMORY[0x1E4F143B8];
  if ([(MKMapItem *)self isCurrentLocation])
  {
    char v6 = @"currentloc";
    v7[0] = MEMORY[0x1E4F1CC38];
    id v3 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v7 forKeys:&v6 count:1];
  }
  else
  {
    id v4 = [(MKMapItem *)self place];
    id v3 = [v4 urlRepresentation];
  }

  return v3;
}

- (MKMapItem)initWithUrlRepresentation:(id)a3
{
  id v4 = a3;
  int v5 = [v4 objectForKey:@"currentloc"];
  int v6 = [v5 BOOLValue];

  if (v6)
  {
    char v7 = [(MKMapItem *)self initWithGeoMapItem:0 isPlaceHolderPlace:0];
    [(MKMapItem *)v7 setIsCurrentLocation:1];
  }
  else
  {
    uint64_t v8 = (void *)[objc_alloc(MEMORY[0x1E4F64828]) initWithUrlRepresentation:v4];
    if (v8) {
      uint64_t v9 = [(MKMapItem *)self initWithPlace:v8];
    }
    else {
      uint64_t v9 = [(MKMapItem *)self init];
    }
    char v7 = v9;
  }
  return v7;
}

+ (id)_sharedSessionURLForPunchoutURL:(id)a3
{
  id v3 = a3;
  if (!v3)
  {
    id v16 = 0;
    goto LABEL_13;
  }
  id v4 = [MEMORY[0x1E4F1CB10] URLWithString:v3];
  if ([MEMORY[0x1E4F64728] isValidMapsURLForAppendingSharedSessionID:v4])
  {
    id v5 = v3;
    int v6 = [MEMORY[0x1E4F64B90] sharedInstance];
    if ([v6 shareSessionWithMaps])
    {
      char v7 = [v5 containsString:@"user_session_entity"];

      if (v7)
      {
LABEL_7:
        if (([v5 containsString:@"MKURLSourceAppId"] & 1) == 0)
        {
          long long v12 = NSString;
          unint64_t v13 = [MEMORY[0x1E4F28B50] mainBundle];
          uint64_t v14 = [v13 bundleIdentifier];
          uint64_t v15 = [v12 stringWithFormat:@"%@&%@=%@", v5, @"MKURLSourceAppId", v14];

          id v5 = (id)v15;
        }
        id v16 = [MEMORY[0x1E4F1CB10] URLWithString:v5];

        goto LABEL_12;
      }
      uint64_t v8 = [MEMORY[0x1E4F64B90] sharedInstance];
      int v6 = [v8 mapsUserSessionEntity];

      uint64_t v9 = NSString;
      id v10 = [v6 sessionEntityString];
      uint64_t v11 = [v9 stringWithFormat:@"%@&%@", v5, v10];

      id v5 = (id)v11;
    }

    goto LABEL_7;
  }
  id v16 = v4;
LABEL_12:

LABEL_13:

  return v16;
}

+ (id)_sharedSessionUserInfoForPunchoutUserInfo:(id)a3
{
  id v3 = a3;
  id v4 = [MEMORY[0x1E4F64B90] sharedInstance];
  int v5 = [v4 shareSessionWithMaps];

  int v6 = v3;
  if (v5)
  {
    char v7 = [MEMORY[0x1E4F64B90] sharedInstance];
    uint64_t v8 = [v7 mapsUserSessionEntity];
    uint64_t v9 = [v8 sessionEntityString];

    if ([v3 count])
    {
      id v10 = (void *)[v3 mutableCopy];
      [v10 setObject:v9 forKeyedSubscript:@"MKUserActivitySharedSessionKey"];
      int v6 = (void *)[v10 copy];
    }
    else
    {
      int v6 = [MEMORY[0x1E4F1C9E8] dictionaryWithObject:v9 forKey:@"MKUserActivitySharedSessionKey"];
      id v10 = v3;
    }
  }
  uint64_t v11 = [MEMORY[0x1E4F28B50] mainBundle];
  long long v12 = [v11 bundleIdentifier];

  if ([v6 count])
  {
    unint64_t v13 = (void *)[v6 mutableCopy];
    [v13 setObject:v12 forKeyedSubscript:@"MKUserActivitySourceAppId"];
  }
  else
  {
    unint64_t v13 = [MEMORY[0x1E4F1C9E8] dictionaryWithObject:v12 forKey:@"MKUserActivitySourceAppId"];
  }

  return v13;
}

+ (id)_sourceAppIdFromLaunchURL:(id)a3
{
  id v3 = [a3 absoluteString];
  id v4 = [v3 componentsSeparatedByString:@"MKURLSourceAppId"];
  if ([v4 count] == 2)
  {
    int v5 = [v4 objectAtIndexedSubscript:1];
    int v6 = [v5 componentsSeparatedByString:@"&"];

    if ([v6 count])
    {
      char v7 = [v6 objectAtIndexedSubscript:0];

      uint64_t v8 = [v7 componentsSeparatedByString:@"="];

      if ([v8 count] == 2
        && ([v8 objectAtIndexedSubscript:0],
            uint64_t v9 = objc_claimAutoreleasedReturnValue(),
            uint64_t v10 = [v9 length],
            v9,
            !v10))
      {
        uint64_t v11 = [v8 objectAtIndexedSubscript:1];
      }
      else
      {
        uint64_t v11 = 0;
      }
      int v6 = v8;
      int v5 = v7;
    }
    else
    {
      uint64_t v11 = 0;
    }

    id v4 = v6;
  }
  else
  {
    uint64_t v11 = 0;
  }

  return v11;
}

+ (id)_sourceAppIdFromLaunchUserInfo:(id)a3
{
  return (id)[a3 objectForKey:@"MKUserActivitySourceAppId"];
}

+ (void)_mapItemFromHandle:(id)a3 completionHandler:(id)a4
{
  id v5 = a4;
  if (v5)
  {
    id v6 = a3;
    char v7 = +[MKMapService sharedService];
    uint64_t v8 = [v7 defaultTraits];

    uint64_t v9 = [MEMORY[0x1E4F64710] sharedService];
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __50__MKMapItem__mapItemFromHandle_completionHandler___block_invoke;
    v10[3] = &unk_1E54BB1A0;
    id v11 = v5;
    [v9 resolveMapItemFromHandle:v6 withTraits:v8 useCache:0 completionHandler:v10];
  }
}

void __50__MKMapItem__mapItemFromHandle_completionHandler___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v6 = a2;
  if (a3)
  {
    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  }
  else
  {
    id v5 = [[MKMapItem alloc] initWithGeoMapItem:v6 isPlaceHolderPlace:0];
    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  }
}

+ (void)_mapItemsFromHandleURL:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (v7)
  {
    uint64_t v8 = [v6 scheme];
    char v9 = [v8 isEqualToString:@"x-maps-mapitemhandles"];

    if (v9)
    {
      id v36 = 0;
      uint64_t v10 = [a1 _deserializeResourceOptionsFromURL:v6 error:&v36];
      id v11 = v36;
      if (v10)
      {
        long long v12 = [a1 _launchOptionsFromResourceOptionsDictionary:v10];
        unint64_t v13 = [v10 objectForKey:@"MKMapItemLaunchHandles"];
        if ([v13 count])
        {
          uint64_t v14 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(v13, "count"));
          uint64_t v15 = (void *)[v13 mutableCopy];
          uint64_t v30 = 0;
          double v31 = &v30;
          uint64_t v32 = 0x3032000000;
          v33 = __Block_byref_object_copy__17;
          uint64_t v34 = __Block_byref_object_dispose__17;
          id v35 = 0;
          v24[0] = MEMORY[0x1E4F143A8];
          v24[1] = 3221225472;
          v24[2] = __54__MKMapItem__mapItemsFromHandleURL_completionHandler___block_invoke;
          v24[3] = &unk_1E54BBE40;
          id v16 = v15;
          id v25 = v16;
          id v28 = v7;
          id v17 = v14;
          id v26 = v17;
          id v27 = v12;
          double v29 = &v30;
          uint64_t v18 = MEMORY[0x18C139AE0](v24);
          CLLocationCoordinate2D v19 = (void *)v31[5];
          v31[5] = v18;

          (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v31[5] + 16))(v31[5], v20, v21, v22);
          _Block_object_dispose(&v30, 8);
        }
        else
        {
          (*((void (**)(id, void, void *, void))v7 + 2))(v7, MEMORY[0x1E4F1CBF0], v12, 0);
        }
      }
      else
      {
        (*((void (**)(id, void, void, id))v7 + 2))(v7, 0, 0, v11);
      }
    }
    else
    {
      unint64_t v23 = [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F281F8] code:0 userInfo:0];
      (*((void (**)(id, void, void, void *))v7 + 2))(v7, 0, 0, v23);
    }
  }
}

void __54__MKMapItem__mapItemsFromHandleURL_completionHandler___block_invoke(uint64_t a1)
{
  if ([*(id *)(a1 + 32) count])
  {
    double v2 = [*(id *)(a1 + 32) firstObject];
    [*(id *)(a1 + 32) removeObjectAtIndex:0];
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    void v7[2] = __54__MKMapItem__mapItemsFromHandleURL_completionHandler___block_invoke_2;
    v7[3] = &unk_1E54BBE18;
    id v3 = *(id *)(a1 + 56);
    uint64_t v4 = *(void *)(a1 + 64);
    id v9 = v3;
    uint64_t v10 = v4;
    id v8 = *(id *)(a1 + 40);
    +[MKMapItem _mapItemFromHandle:v2 completionHandler:v7];
  }
  else
  {
    (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
    uint64_t v5 = *(void *)(*(void *)(a1 + 64) + 8);
    id v6 = *(void **)(v5 + 40);
    *(void *)(v5 + 40) = 0;
  }
}

void __54__MKMapItem__mapItemsFromHandleURL_completionHandler___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v8 = a2;
  id v5 = a3;
  if (v5)
  {
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
    uint64_t v6 = *(void *)(*(void *)(a1 + 48) + 8);
    id v7 = *(void **)(v6 + 40);
    *(void *)(v6 + 40) = 0;
  }
  else
  {
    if (v8) {
      [*(id *)(a1 + 32) addObject:v8];
    }
    (*(void (**)(void))(*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) + 16))();
  }
}

+ (id)_deserializeResourceOptionsFromURL:(id)a3 error:(id *)a4
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  uint64_t v6 = [a3 resourceSpecifier];
  if ((unint64_t)[v6 length] > 1)
  {
    id v8 = [v6 substringFromIndex:2];
    id v9 = (void *)[objc_alloc(MEMORY[0x1E4F1C9B8]) initWithBase64EncodedString:v8 options:0];
    if (v9)
    {
      uint64_t v10 = [MEMORY[0x1E4F28F98] propertyListWithData:v9 options:0 format:0 error:a4];
      id v7 = [a1 sanitizeDictionary:v10];

      if (v7)
      {
        id v11 = v7;
      }
      else
      {
        if (a4)
        {
          *a4 = [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F281F8] code:0 userInfo:0];
        }
        long long v12 = MKGetMKDefaultLog();
        if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
        {
          if (a4) {
            id v13 = *a4;
          }
          else {
            id v13 = 0;
          }
          int v15 = 138412290;
          id v16 = v13;
          _os_log_impl(&dword_18BAEC000, v12, OS_LOG_TYPE_ERROR, "Failed to deserialize property list: %@", (uint8_t *)&v15, 0xCu);
        }
      }
    }
    else if (a4)
    {
      [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F281F8] code:0 userInfo:0];
      id v7 = 0;
      *a4 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      id v7 = 0;
    }
  }
  else if (a4)
  {
    [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F281F8] code:0 userInfo:0];
    id v7 = 0;
    *a4 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v7 = 0;
  }

  return v7;
}

+ (id)_launchOptionsFromResourceOptionsDictionary:(id)a3
{
  uint64_t v4 = [a3 objectForKey:@"MKMapItemLaunchAdditionsLaunchOptions"];
  id v5 = [a1 _launchOptionsWithOptions:v4];

  if (v5)
  {
    uint64_t v6 = +[MKMapItem standardOptionsFromPlistCompatibleDictionary:v5];

    id v7 = [v6 objectForKey:@"MKLaunchOptionsSessionIDLowKey"];
    id v8 = v7;
    if (v7)
    {
      uint64_t v9 = [v7 longLongValue];
      uint64_t v10 = [v6 objectForKey:@"MKLaunchOptionsSessionIDHighKey"];
      uint64_t v11 = [v10 longLongValue];

      id v12 = objc_alloc(MEMORY[0x1E4F64B98]);
      id v13 = [v6 objectForKey:@"MKLaunchOptionsSessionCreationTimeKey"];
      [v13 doubleValue];
      double v15 = v14;
      id v16 = [v6 objectForKey:@"MKLaunchOptionsSessionSequenceNumberKey"];
      uint64_t v17 = objc_msgSend(v12, "initWithSessionID:sessionCreationTime:sequenceNumber:", v11, v9, objc_msgSend(v16, "unsignedIntValue"), v15);

      uint64_t v18 = [MEMORY[0x1E4F64B90] sharedInstance];
      [v18 setMapsUserSessionEntity:v17];
    }
  }
  else
  {
    uint64_t v6 = 0;
  }

  return v6;
}

+ (id)launchOptionsFromURL:(id)a3
{
  id v4 = a3;
  id v5 = [v4 scheme];
  int v6 = [v5 isEqualToString:@"mapitem"];

  if (v6)
  {
    id v7 = [a1 _deserializeResourceOptionsFromURL:v4 error:0];
    if (v7)
    {
      id v8 = [a1 _launchOptionsFromResourceOptionsDictionary:v7];
    }
    else
    {
      id v8 = 0;
    }
  }
  else
  {
    id v8 = 0;
  }

  return v8;
}

+ (BOOL)valueIsValid:(id)a3 forKey:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  if (qword_1EB316000 != -1) {
    dispatch_once(&qword_1EB316000, &__block_literal_global_578);
  }
  BOOL v7 = (id)[(id)qword_1EB315FF8 objectForKeyedSubscript:v6]
    && (objc_opt_isKindOfClass() & 1) != 0;

  return v7;
}

void __33__MKMapItem_valueIsValid_forKey___block_invoke()
{
  v6[64] = *MEMORY[0x1E4F143B8];
  v5[0] = @"MKMapItemLaunchAdditionsMapItems";
  v6[0] = objc_opt_class();
  id v0 = [@"MKMapItemLaunchAdditionsMapItems" stringByAppendingString:@"Children"];
  v5[1] = v0;
  v6[1] = objc_opt_class();
  v5[2] = @"MKMapItemLaunchHandles";
  v6[2] = objc_opt_class();
  v1 = [@"MKMapItemLaunchHandles" stringByAppendingString:@"Children"];
  v5[3] = v1;
  v6[3] = objc_opt_class();
  v5[4] = @"MKMapItemLaunchAdditionsLaunchOptions";
  v6[4] = objc_opt_class();
  v5[5] = @"MKMapItemIsCurrentLocation";
  v6[5] = objc_opt_class();
  v5[6] = @"MKMapItemGEOPlace";
  v6[6] = objc_opt_class();
  v5[7] = @"MKMapItemGEOMapItem";
  v6[7] = objc_opt_class();
  v5[8] = @"MKMapItemName";
  v6[8] = objc_opt_class();
  v5[9] = @"MKMapItemPhoneNumber";
  v6[9] = objc_opt_class();
  v5[10] = @"MKMapItemURLString";
  v6[10] = objc_opt_class();
  v5[11] = @"MKMapItemTimeZoneName";
  v6[11] = objc_opt_class();
  v5[12] = @"MKLaunchOptionsCurrentLocationPlacecard";
  v6[12] = objc_opt_class();
  v5[13] = @"MKLaunchOptionsDirectionsMode";
  v6[13] = objc_opt_class();
  v5[14] = @"MKLaunchOptionsRouteHandle";
  v6[14] = objc_opt_class();
  v5[15] = @"MKLaunchOptionsMapType";
  v6[15] = objc_opt_class();
  v5[16] = @"MKLaunchOptionsMapCenter";
  v6[16] = objc_opt_class();
  v5[17] = @"MKLaunchOptionsMapSpan";
  v6[17] = objc_opt_class();
  v5[18] = @"MKLaunchOptionsSerializedCameraKey";
  v6[18] = objc_opt_class();
  v5[19] = @"MKLaunchOptionsShowsTraffic";
  v6[19] = objc_opt_class();
  v5[20] = @"MKLaunchOptionsMapRadiusInMeters";
  v6[20] = objc_opt_class();
  v5[21] = @"MKLaunchOptionsSearchTerms";
  v6[21] = objc_opt_class();
  v5[22] = @"MKLaunchOptionsLaunchIntoNav";
  v6[22] = objc_opt_class();
  v5[23] = @"MKLaunchOptionsLaunchIntoRoute";
  v6[23] = objc_opt_class();
  v5[24] = @"MKLaunchOptionsLaunchIntoKeyboard";
  v6[24] = objc_opt_class();
  v5[25] = @"MKLaunchOptionsLaunchIntoSearchHomeKey";
  v6[25] = objc_opt_class();
  v5[26] = @"MKLaunchOptionsLaunchIntoRAP";
  v6[26] = objc_opt_class();
  v5[27] = @"MKLaunchOptionsLaunchIntoPhotoThumbnailGalleryKey";
  v6[27] = objc_opt_class();
  v5[28] = @"MKLaunchOptionsPhotoThumbnailGalleryAlbumIndex";
  v6[28] = objc_opt_class();
  v5[29] = @"MKLaunchOptionsLaunchIntoNavOverview";
  v6[29] = objc_opt_class();
  v5[30] = @"MKLaunchOptionsLaunchIntoNavDetail";
  v6[30] = objc_opt_class();
  v5[31] = @"MKLaunchOptionsLaunchIntoNavShareETAKey";
  v6[31] = objc_opt_class();
  v5[32] = @"MKLaunchOptionsLaunchIntoNavTraceKey";
  v6[32] = objc_opt_class();
  v5[33] = @"MKLaunchOptionsLaunchIntoNavTraceStartNavKey";
  v6[33] = objc_opt_class();
  v5[34] = @"MKLaunchOptionsLaunchIntoTableBookingKey";
  v6[34] = objc_opt_class();
  v5[35] = @"MKLaunchOptionsSelectedIndex";
  v6[35] = objc_opt_class();
  v5[36] = @"_MKLaunchOptionsMapZoomKey";
  v6[36] = objc_opt_class();
  v5[37] = @"MKLaunchOptionsCameraAltitudeMultiplier";
  v6[37] = objc_opt_class();
  v5[38] = @"_MKLaunchOptionsPreserveSearchResultsKey";
  v6[38] = objc_opt_class();
  v5[39] = @"_MKLaunchOptionsSearchAlongRouteKey";
  v6[39] = objc_opt_class();
  v5[40] = @"_MKLaunchOptionsRoutingAvoidHighwaysKey";
  v6[40] = objc_opt_class();
  v5[41] = @"_MKLaunchOptionsRoutingAvoidTollsKey";
  v6[41] = objc_opt_class();
  v5[42] = @"_MKLaunchOptionsRoutingArrivalDateKey";
  v6[42] = objc_opt_class();
  v5[43] = @"MKLaunchOptionsMapCenterLatitude";
  v6[43] = objc_opt_class();
  v5[44] = @"MKLaunchOptionsMapCenterLongitude";
  v6[44] = objc_opt_class();
  v5[45] = @"MKLaunchOptionsMapSpanLatitude";
  v6[45] = objc_opt_class();
  v5[46] = @"MKLaunchOptionsMapSpanLongitude";
  v6[46] = objc_opt_class();
  v5[47] = @"MKLaunchOptionsSerializedTimePointKey";
  v6[47] = objc_opt_class();
  v5[48] = @"MKLaunchOptionsReferralIdentifierKey";
  v6[48] = objc_opt_class();
  v5[49] = @"MKLaunchOptionsTimePointKey";
  v6[49] = objc_opt_class();
  v5[50] = @"MKLaunchOptionsConnectedToCarKey";
  v6[50] = objc_opt_class();
  v5[51] = @"MKLaunchOptionsAnalyticsActionKey";
  v6[51] = objc_opt_class();
  v5[52] = @"MKLaunchOptionsAnalyticsTargetKey";
  v6[52] = objc_opt_class();
  v5[53] = @"MKLaunchOptionsAnalyticsValueKey";
  v6[53] = objc_opt_class();
  v5[54] = @"_MKLaunchOptionsFindMyHandleIdentifiersKey";
  v6[54] = objc_opt_class();
  double v2 = [@"_MKLaunchOptionsFindMyHandleIdentifiersKey" stringByAppendingString:@"Children"];
  v5[55] = v2;
  v6[55] = objc_opt_class();
  v5[56] = @"MKLaunchOptionsFromTimeToLeaveNotificationKey";
  v6[56] = objc_opt_class();
  v5[57] = @"MKLaunchOptionsURLKey";
  v6[57] = objc_opt_class();
  v5[58] = @"MKLaunchOptionsSessionIDLowKey";
  v6[58] = objc_opt_class();
  v5[59] = @"MKLaunchOptionsSessionIDHighKey";
  v6[59] = objc_opt_class();
  v5[60] = @"MKLaunchOptionsSessionCreationTimeKey";
  v6[60] = objc_opt_class();
  v5[61] = @"MKLaunchOptionsSessionSequenceNumberKey";
  v6[61] = objc_opt_class();
  v5[62] = @"MKUserActivitySharedSessionKey";
  v6[62] = objc_opt_class();
  v5[63] = @"MKURLSourceAppId";
  v6[63] = objc_opt_class();
  uint64_t v3 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v6 forKeys:v5 count:64];
  id v4 = (void *)qword_1EB315FF8;
  qword_1EB315FF8 = v3;
}

+ (id)sanitizeObject:(id)a3 forKey:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if ([a1 valueIsValid:v6 forKey:v7]) {
    id v8 = v6;
  }
  else {
    id v8 = 0;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v9 = [a1 sanitizeArray:v8 forKey:v7];

    id v8 = (id)v9;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v10 = [v8 objectForKey:*MEMORY[0x1E4F63E88]];

    if (!v10)
    {
      uint64_t v11 = [a1 sanitizeDictionary:v8];

      id v8 = (id)v11;
    }
  }

  return v8;
}

+ (id)sanitizeArray:(id)a3 forKey:(id)a4
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  id v8 = v6;
  uint64_t v9 = [v8 countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v19;
    while (2)
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v19 != v11) {
          objc_enumerationMutation(v8);
        }
        uint64_t v13 = *(void *)(*((void *)&v18 + 1) + 8 * i);
        double v14 = objc_msgSend(v7, "stringByAppendingString:", @"Children", (void)v18);
        double v15 = [a1 sanitizeObject:v13 forKey:v14];

        if (!v15)
        {

          id v16 = 0;
          goto LABEL_11;
        }
      }
      uint64_t v10 = [v8 countByEnumeratingWithState:&v18 objects:v22 count:16];
      if (v10) {
        continue;
      }
      break;
    }
  }

  id v16 = v8;
LABEL_11:

  return v16;
}

+ (id)sanitizeDictionary:(id)a3
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id v5 = objc_msgSend(v4, "allKeys", 0);
  uint64_t v6 = [v5 countByEnumeratingWithState:&v16 objects:v22 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v17;
    while (2)
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v17 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = *(void *)(*((void *)&v16 + 1) + 8 * i);
        uint64_t v11 = [v4 objectForKeyedSubscript:v10];
        id v12 = [a1 sanitizeObject:v11 forKey:v10];

        if (!v12)
        {
          double v14 = MKGetMKDefaultLog();
          if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138412290;
            uint64_t v21 = v10;
            _os_log_impl(&dword_18BAEC000, v14, OS_LOG_TYPE_ERROR, "MapItem deserialize: Invalid value class for key %@", buf, 0xCu);
          }

          id v13 = 0;
          goto LABEL_13;
        }
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v16 objects:v22 count:16];
      if (v7) {
        continue;
      }
      break;
    }
  }

  id v13 = v4;
LABEL_13:

  return v13;
}

+ (id)mapItemsFromURL:(id)a3 options:(id *)a4
{
  v34[1] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  uint64_t v7 = v6;
  if (a4) {
    *a4 = 0;
  }
  uint64_t v8 = [v6 scheme];
  char v9 = [v8 isEqualToString:@"mapitem"];

  if ((v9 & 1) == 0)
  {
    uint64_t v24 = [a1 _mapItemBackedByURL:v7];
    uint64_t v23 = (void *)v24;
    if (v24)
    {
      v34[0] = v24;
      id v12 = [MEMORY[0x1E4F1C978] arrayWithObjects:v34 count:1];
      goto LABEL_22;
    }
    goto LABEL_21;
  }
  uint64_t v10 = [a1 _deserializeResourceOptionsFromURL:v7 error:0];
  if (!v10)
  {
    uint64_t v23 = 0;
LABEL_21:
    id v12 = 0;
    goto LABEL_22;
  }
  id v26 = a1;
  id v27 = v10;
  id v28 = a4;
  uint64_t v11 = [v10 objectForKey:@"MKMapItemLaunchAdditionsMapItems"];
  id v12 = objc_opt_new();
  long long v29 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  id v13 = v11;
  uint64_t v14 = [v13 countByEnumeratingWithState:&v29 objects:v33 count:16];
  if (v14)
  {
    uint64_t v15 = v14;
    uint64_t v16 = *(void *)v30;
    uint64_t v17 = *MEMORY[0x1E4F63E88];
    do
    {
      for (uint64_t i = 0; i != v15; ++i)
      {
        if (*(void *)v30 != v16) {
          objc_enumerationMutation(v13);
        }
        long long v19 = *(void **)(*((void *)&v29 + 1) + 8 * i);
        long long v20 = [v19 objectForKeyedSubscript:v17];

        if (v20)
        {
          uint64_t v21 = [objc_alloc(MEMORY[0x1E4F644F8]) initWithDictionary:v19];
        }
        else
        {
          uint64_t v21 = +[MKMapItem mapItemWithDictionary:v19];
        }
        uint64_t v22 = (void *)v21;
        [v12 addObject:v21];
      }
      uint64_t v15 = [v13 countByEnumeratingWithState:&v29 objects:v33 count:16];
    }
    while (v15);
  }

  uint64_t v23 = v27;
  if (v28)
  {
    id *v28 = [v26 _launchOptionsFromResourceOptionsDictionary:v27];
  }

LABEL_22:

  return v12;
}

+ (id)_mapItemBackedByURL:(id)a3
{
  id v4 = (objc_class *)MEMORY[0x1E4F64B38];
  id v5 = a3;
  id v6 = (void *)[[v4 alloc] initWithURL:v5];

  if (v6 && [v6 isValid]) {
    uint64_t v7 = objc_msgSend(objc_alloc((Class)a1), "initWithGeoMapItem:isPlaceHolderPlace:", v6, objc_msgSend(v6, "_hasResolvablePartialInformation"));
  }
  else {
    uint64_t v7 = 0;
  }

  return v7;
}

+ (id)urlForMapItem:(id)a3 options:(id)a4
{
  id v6 = (void *)MEMORY[0x1E4F1C978];
  id v7 = a4;
  if (a3) {
    [v6 arrayWithObject:a3];
  }
  else {
  uint64_t v8 = [v6 array];
  }
  char v9 = [a1 urlForMapItems:v8 options:v7];

  return v9;
}

+ (id)urlForMapItems:(id)a3 options:(id)a4
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  if (![v6 count])
  {
    uint64_t v8 = [MEMORY[0x1E4F1C978] array];

    id v6 = (id)v8;
  }
  char v9 = [MEMORY[0x1E4F1CA60] dictionaryWithCapacity:2];
  uint64_t v10 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(v6, "count"));
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  id v11 = v6;
  uint64_t v12 = [v11 countByEnumeratingWithState:&v25 objects:v29 count:16];
  if (v12)
  {
    uint64_t v13 = v12;
    uint64_t v14 = *(void *)v26;
    do
    {
      for (uint64_t i = 0; i != v13; ++i)
      {
        if (*(void *)v26 != v14) {
          objc_enumerationMutation(v11);
        }
        uint64_t v16 = [*(id *)(*((void *)&v25 + 1) + 8 * i) dictionaryRepresentation];
        [v10 addObject:v16];
      }
      uint64_t v13 = [v11 countByEnumeratingWithState:&v25 objects:v29 count:16];
    }
    while (v13);
  }

  [v9 setObject:v10 forKey:@"MKMapItemLaunchAdditionsMapItems"];
  uint64_t v17 = [a1 _launchOptionsWithOptions:v7];

  if (v17)
  {
    long long v18 = +[MKMapItem plistCompatibleDictionaryFromStandardOptions:v17];

    [v9 setObject:v18 forKey:@"MKMapItemLaunchAdditionsLaunchOptions"];
  }
  uint64_t v24 = 0;
  long long v19 = [MEMORY[0x1E4F28F98] dataWithPropertyList:v9 format:200 options:0 error:&v24];
  if (!v19) {
    NSLog(&cfstr_FailedToSerial_0.isa, v24);
  }
  long long v20 = [v19 base64EncodedStringWithOptions:0];
  uint64_t v21 = [NSString stringWithFormat:@"mapitem://%@", v20];
  uint64_t v22 = [MEMORY[0x1E4F1CB10] URLWithString:v21];

  return v22;
}

+ (BOOL)_isDirectionsActionURL:(id)a3
{
  uint64_t v3 = [a3 objectForKeyedSubscript:@"MKLaunchOptionsDirectionsMode"];
  id v4 = v3;
  if (v3) {
    BOOL v5 = [v3 length] != 0;
  }
  else {
    BOOL v5 = 0;
  }

  return v5;
}

+ (BOOL)_shouldUseUniversalLinkForMapItems:(id)a3 options:(id)a4
{
  v23[13] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  if (MapsFeature_IsEnabled_URLUnification()
    && ((unint64_t)[v6 count] < 2 || objc_msgSend(a1, "_isDirectionsActionURL:", v7)))
  {
    id v8 = objc_alloc(MEMORY[0x1E4F1CAD0]);
    v23[0] = @"MKLaunchOptionsCameraKey";
    v23[1] = @"MKLaunchOptionsCurrentLocationPlacecard";
    v23[2] = @"MKLaunchOptionsDirectionsMode";
    v23[3] = @"MKLaunchOptionsLaunchIntoRAP";
    v23[4] = @"MKLaunchOptionsMapType";
    v23[5] = @"MKLaunchOptionsMapSpan";
    v23[6] = @"MKLaunchOptionsMapCenter";
    v23[7] = @"MKLaunchOptionsMapCenterLatitude";
    v23[8] = @"MKLaunchOptionsMapCenterLongitude";
    v23[9] = @"MKLaunchOptionsMapSpanLatitude";
    v23[10] = @"MKLaunchOptionsMapSpanLongitude";
    v23[11] = @"_MKLaunchOptionsRoutingAvoidHighwaysKey";
    v23[12] = @"_MKLaunchOptionsRoutingAvoidTollsKey";
    char v9 = [MEMORY[0x1E4F1C978] arrayWithObjects:v23 count:13];
    uint64_t v10 = (void *)[v8 initWithArray:v9];

    long long v20 = 0u;
    long long v21 = 0u;
    long long v18 = 0u;
    long long v19 = 0u;
    id v11 = objc_msgSend(v7, "allKeys", 0);
    uint64_t v12 = [v11 countByEnumeratingWithState:&v18 objects:v22 count:16];
    if (v12)
    {
      uint64_t v13 = v12;
      uint64_t v14 = *(void *)v19;
      while (2)
      {
        for (uint64_t i = 0; i != v13; ++i)
        {
          if (*(void *)v19 != v14) {
            objc_enumerationMutation(v11);
          }
          if (![v10 containsObject:*(void *)(*((void *)&v18 + 1) + 8 * i)])
          {
            BOOL v16 = 0;
            goto LABEL_15;
          }
        }
        uint64_t v13 = [v11 countByEnumeratingWithState:&v18 objects:v22 count:16];
        if (v13) {
          continue;
        }
        break;
      }
    }
    BOOL v16 = 1;
LABEL_15:
  }
  else
  {
    BOOL v16 = 0;
  }

  return v16;
}

+ (id)_universalLinkForMapItems:(id)a3 options:(id)a4
{
  uint64_t v97 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  int v8 = [a1 _isDirectionsActionURL:v7];
  if (![v6 count] || !v8)
  {
    id v11 = [v6 firstObject];
    id v12 = objc_alloc_init(MEMORY[0x1E4F64B60]);
    uint64_t v13 = v12;
    if (v11)
    {
      uint64_t v14 = [v11 _geoMapItem];
      [v14 coordinate];
      objc_msgSend(v13, "setCoordinate:");
    }
    else
    {
      objc_msgSend(v12, "setCoordinate:", -180.0, -180.0);
    }
    v37 = [v11 _geoMapItem];
    uint64_t v38 = [v37 _identifier];
    [v13 setMapItemIdentifier:v38];

    uint64_t v39 = [v11 _addressFormattedAsSinglelineAddress];
    [v13 setAddress:v39];

    uint64_t v40 = [v11 name];
    [v13 setName:v40];

    v41 = [v7 objectForKeyedSubscript:@"MKLaunchOptionsLaunchIntoRAP"];
    int v42 = [v41 BOOLValue];

    uint64_t v43 = [v7 objectForKeyedSubscript:@"MKLaunchOptionsCurrentLocationPlacecard"];
    int v44 = [v43 BOOLValue];

    if (v42)
    {
      id v45 = (void *)MEMORY[0x1E4F64720];
      unint64_t v46 = [v13 mapItemIdentifier];
      [v13 coordinate];
      double v48 = v47;
      double v50 = v49;
      v51 = [v13 address];
      v52 = objc_msgSend(v45, "URLForReportAProblemWithMapItemIdentifier:coordinate:address:", v46, v51, v48, v50);
LABEL_39:

LABEL_40:
      goto LABEL_41;
    }
    if (v44)
    {
      v52 = [MEMORY[0x1E4F64720] URLForPlaceForCurrentLocation];
LABEL_41:

      goto LABEL_42;
    }
    v53 = [v13 resolvedLocation];

    if (v53)
    {
      v54 = (void *)MEMORY[0x1E4F64720];
      unint64_t v46 = [v13 name];
      v51 = [v13 mapItemIdentifier];
      [v13 coordinate];
      double v56 = v55;
      double v58 = v57;
      v59 = [v13 address];
      v52 = objc_msgSend(v54, "URLForPlaceWithName:mapItemIdentifier:coordinate:address:", v46, v51, v59, v56, v58);

      goto LABEL_39;
    }
    unint64_t v46 = (void *)[objc_alloc(MEMORY[0x1E4F64B68]) initWithLaunchOptions:v7];
    [v13 coordinate];
    double v62 = v61;
    double v64 = v63;
    if ([v46 hasMapType]) {
      uint64_t v65 = [v46 mapType];
    }
    else {
      uint64_t v65 = 0;
    }
    if ([v46 hasCamera])
    {
      v66 = [v46 camera];
      double v67 = 0.0;
      double v68 = 0.0;
      if ([v66 hasAltitude])
      {
        [v66 altitude];
        double v68 = v69;
      }
      if ([v66 hasHeading])
      {
        [v66 heading];
        double v67 = v70;
      }
      double v71 = 0.0;
      if ([v66 hasPitch])
      {
        [v66 pitch];
        double v71 = v72;
      }
      if ([v66 hasLatitude] && objc_msgSend(v66, "hasLongitude"))
      {
        [v66 latitude];
        double v62 = v73;
        [v66 longitude];
        double v64 = v74;
      }
      double v75 = NAN;
      double v76 = NAN;
      goto LABEL_83;
    }
    if (![v46 hasCenterSpan])
    {
      double v68 = 0.0;
      double v75 = NAN;
      double v76 = NAN;
      double v67 = 0.0;
      double v71 = 0.0;
LABEL_84:
      v52 = objc_msgSend(MEMORY[0x1E4F64720], "URLForMapFrameWithCenter:distance:heading:pitch:mapType:trackingMode:span:", v65, 0, v62, v64, v68, v67, v71, v76, v75);
      goto LABEL_40;
    }
    v66 = [v46 centerSpan];
    [v66 latitude];
    double v78 = v77;
    [v66 longitude];
    double v80 = v79;
    double v68 = 0.0;
    double v75 = NAN;
    if (v79 >= -180.0 && v79 <= 180.0 && v78 >= -90.0 && v78 <= 90.0)
    {
      [v66 latitudeDelta];
      double v76 = v81;
      [v66 longitudeDelta];
      double v75 = NAN;
      if (v76 >= 0.0 && v76 <= 180.0)
      {
        double v83 = v82;
        if (v82 >= 0.0 && v82 <= 360.0)
        {
          [v66 latitudeDelta];
          if (v84 > 0.0)
          {
            [v66 longitudeDelta];
            if (v85 > 0.0)
            {
              double v75 = v83;
              double v62 = v78;
              double v64 = v80;
LABEL_82:
              double v67 = 0.0;
              double v71 = 0.0;
LABEL_83:

              goto LABEL_84;
            }
          }
          double v75 = NAN;
        }
      }
      double v62 = v78;
      double v64 = v80;
    }
    double v76 = NAN;
    goto LABEL_82;
  }
  char v9 = [v7 objectForKeyedSubscript:@"MKLaunchOptionsDirectionsMode"];
  long long v88 = v9;
  if ([v9 isEqualToString:@"MKLaunchOptionsDirectionsModeDefault"])
  {
    int v10 = -1;
  }
  else if (([v9 isEqualToString:@"MKLaunchOptionsDirectionsModeWalking"] & 1) != 0 {
         || ([v9 isEqualToString:@"MKLaunchOptionsDirectionsModeRoutingApps"] & 1) != 0)
  }
  {
    int v10 = 2;
  }
  else if ([v9 isEqualToString:@"MKLaunchOptionsDirectionsModeTransit"])
  {
    int v10 = 1;
  }
  else
  {
    if ([v9 isEqualToString:@"MKLaunchOptionsDirectionsModeDriving"])
    {
      unsigned int v86 = 0;
      goto LABEL_11;
    }
    if ([v9 isEqualToString:@"MKLaunchOptionsDirectionsModeCycling"]) {
      int v10 = 3;
    }
    else {
      int v10 = 0;
    }
  }
  unsigned int v86 = v10;
LABEL_11:
  uint64_t v15 = [v7 objectForKeyedSubscript:@"_MKLaunchOptionsRoutingAvoidHighwaysKey"];
  int v16 = [v15 BOOLValue];

  uint64_t v17 = [v7 objectForKeyedSubscript:@"_MKLaunchOptionsRoutingAvoidTollsKey"];
  int v18 = [v17 BOOLValue];

  id v19 = objc_alloc_init(MEMORY[0x1E4F64B50]);
  long long v20 = v19;
  if (v16) {
    [v19 setAvoidOptions:&unk_1ED97F440];
  }
  if (v18) {
    [v20 setAvoidOptions:&unk_1ED97F458];
  }
  long long v87 = v20;
  id v89 = v7;
  id v90 = v6;
  id v91 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  long long v92 = 0u;
  long long v93 = 0u;
  long long v94 = 0u;
  long long v95 = 0u;
  id v21 = v6;
  uint64_t v22 = [v21 countByEnumeratingWithState:&v92 objects:v96 count:16];
  if (v22)
  {
    uint64_t v23 = v22;
    id v24 = 0;
    uint64_t v25 = *(void *)v93;
    do
    {
      for (uint64_t i = 0; i != v23; ++i)
      {
        if (*(void *)v93 != v25) {
          objc_enumerationMutation(v21);
        }
        long long v27 = *(void **)(*((void *)&v92 + 1) + 8 * i);
        id v28 = objc_alloc_init(MEMORY[0x1E4F64B60]);
        long long v29 = [v27 name];
        [v28 setName:v29];

        uint64_t v30 = [v27 _addressFormattedAsSinglelineAddress];
        [v28 setAddress:v30];

        long long v31 = [v27 _geoMapItem];
        long long v32 = [v31 _identifier];

        if (v32)
        {
          v33 = [v27 _geoMapItem];
          uint64_t v34 = [v33 _identifier];
          [v28 setMapItemIdentifier:v34];
        }
        id v35 = [v27 _geoMapItem];
        [v35 coordinate];
        objc_msgSend(v28, "setCoordinate:");

        id v36 = [v28 resolvedLocation];
        if (v36)
        {
          if (v24 || (unint64_t)[v21 count] < 2) {
            [v91 addObject:v36];
          }
          else {
            id v24 = v36;
          }
        }
      }
      uint64_t v23 = [v21 countByEnumeratingWithState:&v92 objects:v96 count:16];
    }
    while (v23);
  }
  else
  {
    id v24 = 0;
  }

  v52 = [MEMORY[0x1E4F64720] URLForDirectionsFromSource:v24 toDestinations:v91 transportType:v86 directionsOptions:v87];

  id v7 = v89;
  id v6 = v90;
LABEL_42:

  return v52;
}

+ (id)_urlForMapItemHandles:(id)a3 options:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if ([v6 count])
  {
    int v8 = [MEMORY[0x1E4F1CA60] dictionary];
    [v8 setObject:v6 forKeyedSubscript:@"MKMapItemLaunchHandles"];
    char v9 = [a1 _launchOptionsWithOptions:v7];

    if (v9)
    {
      id v7 = +[MKMapItem plistCompatibleDictionaryFromStandardOptions:v9];

      [v8 setObject:v7 forKey:@"MKMapItemLaunchAdditionsLaunchOptions"];
    }
    else
    {
      id v7 = 0;
    }
    uint64_t v15 = 0;
    id v11 = [MEMORY[0x1E4F28F98] dataWithPropertyList:v8 format:200 options:0 error:&v15];
    if (!v11) {
      NSLog(&cfstr_FailedToSerial_0.isa, v15);
    }
    id v12 = [v11 base64EncodedStringWithOptions:0];
    uint64_t v13 = [NSString stringWithFormat:@"x-maps-mapitemhandles://%@", v12];
    int v10 = [MEMORY[0x1E4F1CB10] URLWithString:v13];
  }
  else
  {
    int v10 = 0;
  }

  return v10;
}

+ (id)_urlForLocation:(id)a3 address:(id)a4 label:(id)a5 options:(id)a6
{
  v28[1] = *MEMORY[0x1E4F143B8];
  id v10 = a4;
  id v11 = a6;
  id v12 = a5;
  id v13 = a3;
  [v13 coordinate];
  double v15 = v14;
  double v17 = v16;
  if ([v10 length])
  {
    id v26 = v10;
    long long v27 = @"FormattedAddressLines";
    int v18 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v26 count:1];
    v28[0] = v18;
    id v19 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v28 forKeys:&v27 count:1];
  }
  else
  {
    id v19 = 0;
  }
  long long v20 = (void *)[objc_alloc(MEMORY[0x1E4F64828]) initWithLatitude:v19 longitude:v15 addressDictionary:v17];
  int v21 = [v13 referenceFrame];

  if (v21 == 1) {
    uint64_t v22 = 1;
  }
  else {
    uint64_t v22 = 2 * (v21 == 2);
  }
  [v20 setReferenceFrame:v22];
  uint64_t v23 = (void *)[objc_alloc((Class)a1) initWithPlace:v20];
  [v23 setName:v12];

  id v24 = [a1 urlForMapItem:v23 options:v11];

  return v24;
}

+ (id)_launchOptionsWithOptions:(id)a3
{
  id v3 = a3;
  id v4 = (void *)[objc_alloc(MEMORY[0x1E4F1CA60]) initWithDictionary:v3];
  BOOL v5 = [v3 objectForKey:@"MKLaunchOptionsReferralIdentifierKey"];
  if (!v5)
  {
    id v6 = [MEMORY[0x1E4F28B50] mainBundle];
    id v7 = [v6 bundleIdentifier];

    if (!v7) {
      goto LABEL_5;
    }
    BOOL v5 = [MEMORY[0x1E4F28B50] mainBundle];
    int v8 = [v5 bundleIdentifier];
    [v4 setObject:v8 forKey:@"MKLaunchOptionsReferralIdentifierKey"];
  }
LABEL_5:
  char v9 = [v3 objectForKeyedSubscript:@"_MKLaunchOptionsRoutingArrivalDateKey"];
  if (v9)
  {
    id v10 = objc_alloc_init(MEMORY[0x1E4F64B78]);
    [v10 setType:1];
    [v9 timeIntervalSinceReferenceDate];
    objc_msgSend(v10, "setTime:");
    [v4 setObject:v10 forKey:@"MKLaunchOptionsTimePointKey"];
  }
  id v11 = [MEMORY[0x1E4F64B90] sharedInstance];
  id v12 = v11;
  if (v11 && [v11 shareSessionWithMaps])
  {
    v15[0] = MEMORY[0x1E4F143A8];
    v15[1] = 3221225472;
    v15[2] = __39__MKMapItem__launchOptionsWithOptions___block_invoke;
    v15[3] = &unk_1E54BBE68;
    id v16 = v4;
    [v12 shortSessionValues:v15];
  }
  id v13 = [MEMORY[0x1E4F1C9E8] dictionaryWithDictionary:v4];

  return v13;
}

void __39__MKMapItem__launchOptionsWithOptions___block_invoke(uint64_t a1, uint64_t a2, double a3, double a4, uint64_t a5, uint64_t a6)
{
  id v10 = *(void **)(a1 + 32);
  id v11 = objc_msgSend(NSNumber, "numberWithUnsignedLongLong:");
  [v10 setObject:v11 forKey:@"MKLaunchOptionsSessionIDLowKey"];

  id v12 = *(void **)(a1 + 32);
  id v13 = [NSNumber numberWithUnsignedLongLong:a2];
  [v12 setObject:v13 forKey:@"MKLaunchOptionsSessionIDHighKey"];

  double v14 = *(void **)(a1 + 32);
  double v15 = [NSNumber numberWithDouble:a4];
  [v14 setObject:v15 forKey:@"MKLaunchOptionsSessionCreationTimeKey"];

  id v16 = *(void **)(a1 + 32);
  id v17 = [NSNumber numberWithUnsignedInt:a6];
  [v16 setObject:v17 forKey:@"MKLaunchOptionsSessionSequenceNumberKey"];
}

- (BOOL)_isEquivalentURLRepresentationTo:(id)a3
{
  id v4 = a3;
  if (-[MKMapItem isCurrentLocation](self, "isCurrentLocation") && ([v4 isCurrentLocation] & 1) != 0)
  {
    char v5 = 1;
  }
  else if ((![(MKMapItem *)self isCurrentLocation] {
          || [v4 isCurrentLocation])
  }
         && ([(MKMapItem *)self isCurrentLocation]
          || ([v4 isCurrentLocation] & 1) == 0))
  {
    id v6 = [(MKMapItem *)self place];
    uint64_t v7 = [v4 place];
    int v8 = (void *)v7;
    char v5 = 0;
    if (v6 && v7) {
      char v5 = [v6 _isEquivalentURLRepresentationTo:v7];
    }
  }
  else
  {
    char v5 = 0;
  }

  return v5;
}

- (id)_fullAddressWithMultiline:(BOOL)a3
{
  if (a3) {
    [(MKMapItem *)self _addressFormattedAsMultilineAddress];
  }
  else {
  id v3 = [(MKMapItem *)self _addressFormattedAsSinglelineAddress];
  }

  return v3;
}

- (id)_activityURL
{
  return [(MKMapItem *)self _activityURLWithMuninViewState:0];
}

- (id)_activityURLWithMuninViewState:(id)a3
{
  id v4 = a3;
  char v5 = [(MKMapItem *)self place];
  [v5 coordinate];
  double v7 = v6;
  [v5 coordinate];
  double v9 = v8;
  if ([(MKMapItem *)self isCurrentLocation])
  {
    id v10 = [(MKMapItem *)self name];
    id v11 = [(MKMapItem *)self _urlExtraStorage];
    id v12 = +[_MKURLBuilder URLForCoordinate:address:label:extraStorage:useWebPlaceCard:](_MKURLBuilder, "URLForCoordinate:address:label:extraStorage:useWebPlaceCard:", 0, v10, v11, 0, v7, v9);
  }
  else
  {
    if ([(GEOMapItem *)self->_geoMapItem contactIsMe]
      && ([(GEOMapItem *)self->_geoMapItem contactAddressType] == 1
       || [(GEOMapItem *)self->_geoMapItem contactAddressType] == 2))
    {
      [(MKMapItem *)self _coordinate];
      double v7 = v13;
      double v9 = v14;
    }
    id v10 = [(MKMapItem *)self name];
    id v11 = [(MKMapItem *)self _addressFormattedAsSinglelineAddress];
    unint64_t v15 = [(MKMapItem *)self _muid];
    uint64_t v16 = [v5 localSearchProviderID];
    if (!v5)
    {
      [(GEOMapItem *)self->_geoMapItem coordinate];
      double v7 = v17;
      [(GEOMapItem *)self->_geoMapItem coordinate];
      double v9 = v18;
    }
    id v19 = [(MKMapItem *)self _urlExtraStorage];
    if (v15 && v16)
    {
      uint64_t v20 = +[_MKURLBuilder URLForInternalBusiness:id:provider:coordinate:address:extraStorage:useWebPlaceCard:muninViewState:](_MKURLBuilder, "URLForInternalBusiness:id:provider:coordinate:address:extraStorage:useWebPlaceCard:muninViewState:", v10, v15, v16, v11, v19, 0, v7, v9, v4);
    }
    else
    {
      uint64_t v20 = +[_MKURLBuilder URLForCoordinate:address:label:extraStorage:useWebPlaceCard:muninViewState:](_MKURLBuilder, "URLForCoordinate:address:label:extraStorage:useWebPlaceCard:muninViewState:", v11, v10, v19, 0, v4, v7, v9);
    }
    id v12 = (void *)v20;
  }

  return v12;
}

- (id)_urlExtraStorage
{
  if (GEOConfigGetBOOL())
  {
    id v3 = objc_opt_new();
    id v4 = [(GEOMapItemStorageUserValues *)self->_userValues phoneNumber];

    BOOL v5 = v4 == 0;
    if (v4)
    {
      double v6 = [(GEOMapItemStorageUserValues *)self->_userValues phoneNumber];
      double v7 = (void *)[v6 copy];
      [v3 setPhoneNumber:v7];
    }
    double v8 = [(GEOMapItemStorageUserValues *)self->_userValues url];

    if (v8)
    {
      double v9 = [(GEOMapItemStorageUserValues *)self->_userValues url];
      [v3 setUrl:v9];

      BOOL v5 = 0;
    }
    id v10 = [(MKMapItem *)self _styleAttributes];
    id v11 = v10;
    if (v10 && [v10 hasAttributes])
    {
      id v12 = (void *)[objc_alloc(MEMORY[0x1E4F64AA8]) initWithGEOFeatureStyleAttributes:v11];
      [v3 setStyleAttributes:v12];

      BOOL v5 = 0;
    }
    double v13 = [(MKMapItem *)self _displayMapRegion];

    if (v13)
    {
      double v14 = [(MKMapItem *)self _displayMapRegion];
      unint64_t v15 = (void *)[v14 copy];
      [v3 setMapRegion:v15];

      uint64_t v16 = v3;
    }
    else if (v5)
    {
      uint64_t v16 = 0;
    }
    else
    {
      uint64_t v16 = v3;
    }
    id v17 = v16;
  }
  else
  {
    id v17 = 0;
  }

  return v17;
}

- (BOOL)_canGetDirections
{
  if ([(MKMapItem *)self _isMapItemTypeBrand]) {
    return 0;
  }
  id v4 = [(MKMapItem *)self _geoAddress];
  BOOL v5 = [v4 structuredAddress];
  double v6 = [v5 countryCode];
  double v7 = [v6 uppercaseString];

  if (-[MKMapItem _isMapItemTypeTransit](self, "_isMapItemTypeTransit") || ![v7 length])
  {
    char v3 = 1;
  }
  else
  {
    double v8 = [MEMORY[0x1E4F64500] sharedConfiguration];
    char v3 = [v8 countryCode:v7 supportsFeature:1];
  }
  return v3;
}

- (id)_bestBrandIconURLForSize:(CGSize)a3 allowSmaller:(BOOL)a4
{
  return (id)-[GEOMapItem _bestAvatarBrandIconURLForSize:allowSmaller:](self->_geoMapItem, "_bestAvatarBrandIconURLForSize:allowSmaller:", a4, a3.width, a3.height);
}

- (id)_bestNavbarBrandIconURLForSize:(CGSize)a3 allowSmaller:(BOOL)a4
{
  return (id)-[GEOMapItem _bestNavbarBrandIconURLForSize:allowSmaller:](self->_geoMapItem, "_bestNavbarBrandIconURLForSize:allowSmaller:", a4, a3.width, a3.height);
}

- (id)_addressOrNil:(id)a3
{
  id v3 = a3;
  if ([v3 length]) {
    id v4 = v3;
  }
  else {
    id v4 = 0;
  }

  return v4;
}

- (id)_addressFormattedAsCity
{
  id v3 = [(GEOMapItem *)self->_geoMapItem addressObject];
  id v4 = [v3 cityDisplayNameWithFallback:0];
  BOOL v5 = [(MKMapItem *)self _addressOrNil:v4];

  return v5;
}

- (id)_addressFormattedAsStreetOnly
{
  id v3 = [(GEOMapItem *)self->_geoMapItem geoAddress];
  id v4 = [v3 structuredAddress];
  BOOL v5 = [v4 thoroughfare];
  double v6 = [(MKMapItem *)self _addressOrNil:v5];

  return v6;
}

- (id)_postalAddressFromMeCardUsingAddressIdentifier:(id)a3
{
  v23[1] = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  v23[0] = *MEMORY[0x1E4F1AF10];
  id v4 = [MEMORY[0x1E4F1C978] arrayWithObjects:v23 count:1];
  id v5 = objc_alloc_init(MEMORY[0x1E4F1B980]);
  double v6 = objc_msgSend(v5, "_ios_meContactWithKeysToFetch:error:", v4, 0);
  uint64_t v17 = 0;
  double v18 = &v17;
  uint64_t v19 = 0x3032000000;
  uint64_t v20 = __Block_byref_object_copy__617;
  int v21 = __Block_byref_object_dispose__618;
  id v22 = 0;
  double v7 = [v6 postalAddresses];
  uint64_t v11 = MEMORY[0x1E4F143A8];
  uint64_t v12 = 3221225472;
  double v13 = __60__MKMapItem__postalAddressFromMeCardUsingAddressIdentifier___block_invoke;
  double v14 = &unk_1E54BBE90;
  id v8 = v3;
  id v15 = v8;
  uint64_t v16 = &v17;
  [v7 enumerateObjectsUsingBlock:&v11];

  double v9 = objc_msgSend((id)v18[5], "value", v11, v12, v13, v14);

  _Block_object_dispose(&v17, 8);

  return v9;
}

void __60__MKMapItem__postalAddressFromMeCardUsingAddressIdentifier___block_invoke(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  id v9 = a2;
  double v7 = [v9 identifier];
  int v8 = [v7 isEqualToString:*(void *)(a1 + 32)];

  if (v8)
  {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a2);
    *a4 = 1;
  }
}

- (id)_addressFormattedAsMultilineAddress
{
  id v3 = [(GEOMapItem *)self->_geoMapItem _clientAttributes];
  int v4 = [v3 hasCorrectedLocationAttributes];

  if (v4)
  {
    id v5 = [(GEOMapItem *)self->_geoMapItem _clientAttributes];
    double v6 = [v5 correctedLocationAttributes];

    double v7 = [v6 _formattedPostalAddress];
  }
  else
  {
    double v7 = 0;
  }
  if (![v7 length])
  {
    int v8 = [(MKMapItem *)self _geoMapItem];
    int v9 = [v8 contactIsMe];

    if (v9)
    {
      id v10 = [(GEOMapItem *)self->_geoMapItem _clientAttributes];
      uint64_t v11 = [v10 addressBookAttributes];
      uint64_t v12 = [v11 addressIdentifier];

      if ([v12 length])
      {
        double v13 = [(MKMapItem *)self _postalAddressFromMeCardUsingAddressIdentifier:v12];
        uint64_t v14 = [MEMORY[0x1E4F1BA88] stringFromPostalAddress:v13 style:0];

        double v7 = (void *)v14;
      }
    }
  }
  if ([v7 length])
  {
    id v15 = v7;
  }
  else
  {
    uint64_t v16 = [(GEOMapItem *)self->_geoMapItem addressObject];
    uint64_t v17 = [v16 fullAddressWithMultiline:1];
    id v15 = [(MKMapItem *)self _addressOrNil:v17];
  }

  return v15;
}

- (id)_addressFormattedAsName
{
  id v3 = [(GEOMapItem *)self->_geoMapItem _clientAttributes];
  int v4 = [v3 hasCorrectedLocationAttributes];

  if (v4)
  {
    id v5 = [(GEOMapItem *)self->_geoMapItem _clientAttributes];
    double v6 = [v5 correctedLocationAttributes];
    double v7 = [v6 _addressFormattedAsName];

    if ([v7 length]) {
      goto LABEL_5;
    }
  }
  int v8 = [(GEOMapItem *)self->_geoMapItem addressObject];
  int v9 = [v8 name];
  double v7 = [(MKMapItem *)self _addressOrNil:v9];

LABEL_5:

  return v7;
}

- (id)_addressFormattedAsShortenedAddress
{
  if ([(MKMapItem *)self _venueFeatureType] == 4)
  {
    id v3 = [(GEOMapItem *)self->_geoMapItem addressObject];
    int v4 = [v3 venueShortAddress];

    if ([v4 length]) {
      goto LABEL_8;
    }
  }
  id v5 = [(GEOMapItem *)self->_geoMapItem _clientAttributes];
  int v6 = [v5 hasCorrectedLocationAttributes];

  if (v6)
  {
    double v7 = [(GEOMapItem *)self->_geoMapItem _clientAttributes];
    int v8 = [v7 correctedLocationAttributes];
    int v4 = [v8 _addressFormattedAsShortenedAddress];

    if ([v4 length]) {
      goto LABEL_8;
    }
  }
  int v9 = [(GEOMapItem *)self->_geoMapItem addressObject];
  id v10 = [v9 shortAddress];
  int v4 = [(MKMapItem *)self _addressOrNil:v10];

LABEL_8:

  return v4;
}

- (id)_addressFormattedAsSinglelineAddress
{
  id v3 = [(GEOMapItem *)self->_geoMapItem _clientAttributes];
  int v4 = [v3 hasCorrectedLocationAttributes];

  if (v4)
  {
    id v5 = [(GEOMapItem *)self->_geoMapItem _clientAttributes];
    int v6 = [v5 correctedLocationAttributes];
    double v7 = [v6 _addressFormattedAsSinglelineAddress];

    if ([v7 length]) {
      goto LABEL_5;
    }
  }
  int v8 = [(GEOMapItem *)self->_geoMapItem addressObject];
  int v9 = [v8 fullAddressWithMultiline:0];
  double v7 = [(MKMapItem *)self _addressOrNil:v9];

LABEL_5:

  return v7;
}

- (id)_addressFormattedAsWeatherDisplayName
{
  id v3 = [(GEOMapItem *)self->_geoMapItem addressObject];
  int v4 = [v3 weatherDisplayName];
  id v5 = [(MKMapItem *)self _addressOrNil:v4];

  return v5;
}

- (id)_addressFormattedAsWeatherLocationName
{
  id v3 = [(GEOMapItem *)self->_geoMapItem addressObject];
  int v4 = [v3 weatherLocationName];
  id v5 = [(MKMapItem *)self _addressOrNil:v4];

  return v5;
}

- (id)_addressFormattedAsTitlesForMapRect:(id)a3
{
  double var1 = a3.var1.var1;
  double var0 = a3.var1.var0;
  double v5 = a3.var0.var1;
  double v6 = a3.var0.var0;
  double v7 = [(GEOMapItem *)self->_geoMapItem addressObject];
  int v8 = objc_msgSend(v7, "titlesForMapRect:", v6, v5, var0, var1);

  return v8;
}

- (id)_addressFormattedAsLocation
{
  double v2 = [(GEOMapItem *)self->_geoMapItem addressObject];
  id v3 = [v2 locationAddress];

  return v3;
}

- (id)venueLabelWithContext:(unint64_t)a3
{
  int v4 = [(GEOMapItem *)self->_geoMapItem addressObject];
  double v5 = v4;
  if (a3 - 1 >= 3) {
    unint64_t v6 = 0;
  }
  else {
    unint64_t v6 = a3;
  }
  double v7 = [v4 venueLabel:v6];

  return v7;
}

- (NSNumber)_preferedAppAdamID
{
  id v3 = [(MKMapItem *)self _formatterForAdamId];
  int v4 = [(GEOMapItem *)self->_geoMapItem _associatedApp];
  double v5 = [v4 preferredAppAdamId];
  unint64_t v6 = [v3 numberFromString:v5];

  return (NSNumber *)v6;
}

- (NSArray)_alternativeAppAdamIds
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v3 = [MEMORY[0x1E4F1CA48] array];
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  int v4 = [(GEOMapItem *)self->_geoMapItem _associatedApp];
  double v5 = [v4 alternateAppAdamIds];

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
        uint64_t v11 = [(MKMapItem *)self _formatterForAdamId];
        uint64_t v12 = [v11 numberFromString:v10];
        [v3 addObject:v12];
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v7);
  }

  return (NSArray *)v3;
}

- (BOOL)_hasBusinessHours
{
  return [(GEOMapItem *)self->_geoMapItem _hasBusinessHours];
}

- (NSArray)_businessHours
{
  return (NSArray *)[(GEOMapItem *)self->_geoMapItem _businessHours];
}

- (BOOL)_hasLinkedServices
{
  return [(GEOMapItem *)self->_geoMapItem _hasLinkedServices];
}

- (NSArray)_linkedServices
{
  return (NSArray *)[(GEOMapItem *)self->_geoMapItem _linkedServices];
}

- (void)_updateRealTimeEVChargerAvailability:(id)a3
{
  int v4 = (objc_class *)MEMORY[0x1E4F64570];
  id v5 = a3;
  id v6 = [v4 alloc];
  uint64_t v7 = [v5 _geoMapItem];

  uint64_t v8 = [v7 _placeData];
  obuint64_t j = (id)[v6 initWithPlaceData:v8];

  int v9 = obj;
  if (obj)
  {
    objc_storeStrong((id *)&self->_chargerAvailability, obj);
    int v9 = obj;
  }
}

- (BOOL)_hasLookAroundStorefront
{
  double v2 = [(GEOMapItem *)self->_geoMapItem _storefrontPresentationInfo];
  BOOL v3 = v2 != 0;

  return v3;
}

- (BOOL)_needsAttribution
{
  return [(GEOMapItem *)self->_geoMapItem _needsAttribution];
}

- (NSURL)_webURL
{
  return (NSURL *)[(GEOMapItem *)self->_geoMapItem _webURL];
}

- (NSURL)_providerURL
{
  return (NSURL *)[(GEOMapItem *)self->_geoMapItem _providerURL];
}

- (NSString)_vendorID
{
  return (NSString *)[(GEOMapItem *)self->_geoMapItem _vendorID];
}

- (NSString)_reviewsDisplayName
{
  double v2 = [(MKMapItem *)self _reviewsAttribution];
  BOOL v3 = [v2 providerName];

  return (NSString *)v3;
}

- (id)_attributionWithDisplayName:(id)a3 attributionFormat:(id)a4 logo:(id)a5 isSnippetLogo:(BOOL)a6
{
  return +[MKPlaceViewStyleProvider attributionStringWithTitle:a4 displayName:a3 logo:a5 isSnippetLogo:a6];
}

- (id)_attributionFor:(id)a3 sourceStringFormat:(id)a4 moreSourceStringFormat:(id)a5 imageTintColor:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  long long v14 = [v10 providerName];
  long long v15 = [v10 attributionURLs];
  if ([v15 count]) {
    long long v16 = v12;
  }
  else {
    long long v16 = v11;
  }
  id v17 = v16;

  if (!v17)
  {
    if (v11) {
      double v18 = v11;
    }
    else {
      double v18 = v12;
    }
    id v17 = v18;
  }
  uint64_t v19 = +[MKSystemController sharedInstance];
  [v19 screenScale];
  if (v13)
  {
    uint64_t v20 = objc_msgSend(v10, "providerSnippetLogoImageForScale:");

LABEL_11:
    int v21 = objc_msgSend(v20, "_mapkit_templateImageWithTintColor:", v13);

    goto LABEL_14;
  }
  int v21 = objc_msgSend(v10, "providerLogoImageForScale:");

  if (!v21)
  {
    id v24 = +[MKSystemController sharedInstance];
    [v24 screenScale];
    uint64_t v20 = objc_msgSend(v10, "providerSnippetLogoImageForScale:");

    id v13 = [MEMORY[0x1E4F428B8] labelColor];
    goto LABEL_11;
  }
  id v13 = 0;
LABEL_14:
  id v22 = [(MKMapItem *)self _attributionWithDisplayName:v14 attributionFormat:v17 logo:v21 isSnippetLogo:v13 != 0];

  return v22;
}

- (unint64_t)_areaHighlightId
{
  return [(GEOMapItem *)self->_geoMapItem _areaHighlightId];
}

- (BOOL)_isMapItemTypeUnknown
{
  double v2 = [(MKMapItem *)self _geoMapItem];
  BOOL v3 = [v2 _placeDisplayType] == 0;

  return v3;
}

- (BOOL)_isMapItemTypeBusiness
{
  double v2 = [(MKMapItem *)self _geoMapItem];
  BOOL v3 = [v2 _placeDisplayType] == 1;

  return v3;
}

- (BOOL)_isMapItemTypeSettlement
{
  double v2 = [(MKMapItem *)self _geoMapItem];
  BOOL v3 = [v2 _placeDisplayType] == 2;

  return v3;
}

- (BOOL)_isMapItemTypeAddress
{
  double v2 = [(MKMapItem *)self _geoMapItem];
  BOOL v3 = [v2 _placeDisplayType] == 3;

  return v3;
}

- (BOOL)_isMapItemTypeBrand
{
  double v2 = [(MKMapItem *)self _geoMapItem];
  BOOL v3 = [v2 _placeDisplayType] == 5;

  return v3;
}

- (int)_parsecSectionType
{
  return [(GEOMapItem *)self->_geoMapItem _parsecSectionType];
}

- (BOOL)_isStandAloneBrand
{
  return [(GEOMapItem *)self->_geoMapItem _isStandaloneBrand];
}

- (BOOL)_hasBrandMUID
{
  return [(GEOMapItem *)self->_geoMapItem _hasBrandMUID];
}

- (unint64_t)_brandMUID
{
  return [(GEOMapItem *)self->_geoMapItem _brandMUID];
}

- (NSString)_messageID
{
  double v2 = [(GEOMapItem *)self->_geoMapItem _messageLink];
  BOOL v3 = [v2 messageID];

  return (NSString *)v3;
}

- (NSString)_messageURLString
{
  double v2 = [(GEOMapItem *)self->_geoMapItem _messageLink];
  BOOL v3 = [v2 messageURLString];

  return (NSString *)v3;
}

- (BOOL)_isMessageIDVerified
{
  double v2 = [(GEOMapItem *)self->_geoMapItem _messageLink];
  char v3 = [v2 isVerified];

  return v3;
}

- (GEOModuleLayoutEntry)_placecardLayout
{
  double v2 = [(GEOMapItem *)self->_geoMapItem _placecardLayoutData];
  char v3 = [v2 currentModuleLayoutEntry];

  return (GEOModuleLayoutEntry *)v3;
}

- (UIColor)_navBackgroundbrandColor
{
  double v2 = [(GEOMapItem *)self->_geoMapItem _messageLink];
  char v3 = [v2 navBackgroundColorString];

  if (v3)
  {
    int v4 = objc_msgSend(MEMORY[0x1E4F428B8], "_maps_colorFromHexString:", v3);
  }
  else
  {
    int v4 = 0;
  }

  return (UIColor *)v4;
}

- (UIColor)_navTintBrandColor
{
  double v2 = [(GEOMapItem *)self->_geoMapItem _messageLink];
  char v3 = [v2 navTintColorString];

  if (v3)
  {
    int v4 = objc_msgSend(MEMORY[0x1E4F428B8], "_maps_colorFromHexString:", v3);
  }
  else
  {
    int v4 = 0;
  }

  return (UIColor *)v4;
}

- (NSArray)_quickLinks
{
  return (NSArray *)[(GEOMapItem *)self->_geoMapItem _quickLinks];
}

- (NSArray)_secondaryQuickLinks
{
  return (NSArray *)[(GEOMapItem *)self->_geoMapItem _secondaryQuickLinks];
}

- (NSArray)_placeCollections
{
  return (NSArray *)[(GEOMapItem *)self->_geoMapItem _placeCollections];
}

- (NSArray)_searchResultPhotoCarousel
{
  return (NSArray *)[(GEOMapItem *)self->_geoMapItem _searchResultPhotoCarousel];
}

- (GEOExploreGuides)_exploreGuides
{
  return (GEOExploreGuides *)[(GEOMapItem *)self->_geoMapItem _exploreGuides];
}

- (NSArray)_placeCollectionIds
{
  return (NSArray *)[(GEOMapItem *)self->_geoMapItem _placeCollectionsIds];
}

- (NSArray)_relatedPlaceLists
{
  return (NSArray *)[(GEOMapItem *)self->_geoMapItem _relatedPlaceLists];
}

- (id)_relatedPlaceListForComponentIdentifier:(int)a3
{
  return (id)[(GEOMapItem *)self->_geoMapItem _relatedPlaceListForComponentIdentifier:*(void *)&a3];
}

- (id)_firstRelatedPlaceListForType:(int)a3
{
  return (id)[(GEOMapItem *)self->_geoMapItem _firstRelatedPlaceListForType:*(void *)&a3];
}

- (NSArray)_reviews
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  char v3 = [(GEOMapItem *)self->_geoMapItem _reviews];
  uint64_t v4 = [v3 count];
  if (v4)
  {
    id v5 = [MEMORY[0x1E4F1CA48] arrayWithCapacity:v4];
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
          id v12 = [_MKMapItemUserRatingSnippetReview alloc];
          id v13 = -[_MKMapItemUserRatingSnippetReview initWithMapItem:review:](v12, "initWithMapItem:review:", self, v11, (void)v15);
          [v5 addObject:v13];
        }
        uint64_t v8 = [v6 countByEnumeratingWithState:&v15 objects:v19 count:16];
      }
      while (v8);
    }
  }
  else
  {
    id v5 = 0;
  }

  return (NSArray *)v5;
}

- (NSArray)_tips
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  char v3 = [(GEOMapItem *)self->_geoMapItem _tips];
  if ([v3 count])
  {
    uint64_t v4 = [MEMORY[0x1E4F1CA48] array];
    long long v14 = 0u;
    long long v15 = 0u;
    long long v16 = 0u;
    long long v17 = 0u;
    id v5 = v3;
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
          uint64_t v11 = [_MKMapItemUserRatingSnippetTip alloc];
          id v12 = -[_MKMapItemUserRatingSnippetTip initWithMapItem:review:](v11, "initWithMapItem:review:", self, v10, (void)v14);
          if (v12) {
            [v4 addObject:v12];
          }
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

- (NSString)reviewsProviderDisplayName
{
  double v2 = [(MKMapItem *)self _reviewsAttribution];
  if ([v2 requiresAttributionInCallout])
  {
    char v3 = [v2 providerName];
  }
  else
  {
    char v3 = 0;
  }

  return (NSString *)v3;
}

- (BOOL)_hasPOIClaim
{
  return [(GEOMapItem *)self->_geoMapItem _hasPOIClaim];
}

- (GEOPOIClaim)_poiClaim
{
  return (GEOPOIClaim *)[(GEOMapItem *)self->_geoMapItem _poiClaim];
}

- (GEOMapItemDetourInfo)_detourInfo
{
  return (GEOMapItemDetourInfo *)[(GEOMapItem *)self->_geoMapItem detourInfo];
}

- (NSData)_externalTransitStationCode
{
  return (NSData *)[(GEOMapItem *)self->_geoMapItem externalTransitStationCode];
}

- (BOOL)_hasCorrectedHomeWorkAddress
{
  char v3 = [(MKMapItem *)self _geoMapItem];
  uint64_t v4 = [v3 _clientAttributes];

  if (!v4) {
    return 0;
  }
  id v5 = [(MKMapItem *)self _geoMapItem];
  int v6 = [v5 contactIsMe];

  if (!v6) {
    return 0;
  }
  uint64_t v7 = [(MKMapItem *)self _geoMapItem];
  uint64_t v8 = [v7 _clientAttributes];
  uint64_t v9 = [v8 correctedLocationAttributes];
  char v10 = [v9 hasCorrectedAddress];

  return v10;
}

- (GEOViewportFrame)_viewportFrame
{
  return (GEOViewportFrame *)[(GEOMapItem *)self->_geoMapItem _viewportFrame];
}

- (GEOEnrichmentInfo)_enrichmentInfo
{
  return (GEOEnrichmentInfo *)[(GEOMapItem *)self->_geoMapItem _enrichmentInfo];
}

- (GEOEnrichmentData)_enrichmentData
{
  return (GEOEnrichmentData *)[(GEOMapItem *)self->_geoMapItem _enrichmentData];
}

- (NSArray)_externalActionLinks
{
  return (NSArray *)[(GEOMapItem *)self->_geoMapItem _externalActionLinks];
}

- (GEOTrailHead)_trailHead
{
  return (GEOTrailHead *)[(GEOMapItem *)self->_geoMapItem _trailHead];
}

- (BOOL)_hasHikeInfo
{
  char v3 = [(GEOMapItem *)self->_geoMapItem _hikeSummary];
  if (v3)
  {
    uint64_t v4 = [(GEOMapItem *)self->_geoMapItem _hikeAssociatedInfo];
    if (v4)
    {
      id v5 = [(GEOMapItem *)self->_geoMapItem _hikeGeometry];
      BOOL v6 = v5 != 0;
    }
    else
    {
      BOOL v6 = 0;
    }
  }
  else
  {
    BOOL v6 = 0;
  }

  return v6;
}

- (GEOHikeSummary)_hikeSummary
{
  return (GEOHikeSummary *)[(GEOMapItem *)self->_geoMapItem _hikeSummary];
}

- (GEOPDHikeAssociatedInfo)_hikeAssociatedInfo
{
  return (GEOPDHikeAssociatedInfo *)[(GEOMapItem *)self->_geoMapItem _hikeAssociatedInfo];
}

- (GEOPDHikeGeometry)_hikeGeometry
{
  return (GEOPDHikeGeometry *)[(GEOMapItem *)self->_geoMapItem _hikeGeometry];
}

- (GEOFactoid)_hikingTrailDifficultyFactoid
{
  return (GEOFactoid *)[(MKMapItem *)self _factoidWithSemantic:2];
}

- (GEOFactoid)_hikingTrailPointToPointFactoid
{
  return (GEOFactoid *)[(MKMapItem *)self _factoidWithSemantic:3];
}

- (GEOFactoid)_hikingTrailLengthFactoid
{
  return (GEOFactoid *)[(MKMapItem *)self _factoidWithSemantic:4];
}

- (int)_placeCategoryType
{
  return [(GEOMapItem *)self->_geoMapItem _placeCategoryType];
}

- (BOOL)isPlaceHolder
{
  return self->_isPlaceHolder;
}

- (void)setIsMapItemTypeTransit:(BOOL)a3
{
  self->_isMapItemTypeTransit = a3;
}

- (_MKPlaceReservationInfo)reservationInfo
{
  return self->_reservationInfo;
}

- (void)setReservationInfo:(id)a3
{
}

- (CLLocationCoordinate2D)_presentCoordinate
{
  double latitude = self->_presentCoordinate.latitude;
  double longitude = self->_presentCoordinate.longitude;
  result.double longitude = longitude;
  result.double latitude = latitude;
  return result;
}

- (void)setPresentCoordinate:(CLLocationCoordinate2D)a3
{
  self->_presentCoordinate = a3;
}

- (MKTransitInfoPreload)_preloadedTransitInfo
{
  return self->_preloadedTransitInfo;
}

+ (id)_itemWithContact:(id)a3 geoMapItem:(id)a4
{
  id v6 = a3;
  uint64_t v7 = [a1 _itemWithGeoMapItem:a4];
  if (v6)
  {
    uint64_t v8 = [MEMORY[0x1E4F1B910] stringFromContact:v6 style:0];
    if ([v8 length]) {
      [v7 setName:v8];
    }
    uint64_t v9 = [v6 phoneNumbers];
    if ([v9 count])
    {
      char v10 = [v9 objectAtIndexedSubscript:0];
      uint64_t v11 = [v10 value];

      id v12 = [v11 stringValue];
      [v7 setPhoneNumber:v12];
    }
  }

  return v7;
}

+ (MKMapItem)mapItemWithSerializedPlaceData:(id)a3
{
  return (MKMapItem *)[a1 mapItemWithSerializedPlaceData:a3 serializedDetourInfo:0 currentLocation:0];
}

+ (MKMapItem)mapItemWithSerializedPlaceData:(id)a3 serializedDetourInfo:(id)a4 currentLocation:(BOOL)a5
{
  BOOL v5 = a5;
  id v7 = a3;
  id v8 = a4;
  if (v7 && [v7 length])
  {
    uint64_t v9 = [MEMORY[0x1E4F646E0] mapItemStorageForSerializedPlaceData:v7 serializedDetourInfo:v8];
    char v10 = v9;
    if (v9 && [v9 conformsToProtocol:&unk_1ED9DD628])
    {
      id v11 = v10;
      if ([v11 isValid])
      {
        if (v5)
        {
          id v12 = [[MKMapItem alloc] initWithGeoMapItemAsCurrentLocation:v11];
        }
        else
        {
          id v12 = +[MKMapItem _itemWithGeoMapItem:v11];
        }
        id v13 = v12;
      }
      else
      {
        id v13 = 0;
      }
    }
    else
    {
      id v13 = 0;
    }
  }
  else
  {
    id v13 = 0;
  }

  return v13;
}

+ (void)_mapItemsWithSerializedPlaceDataResponse:(id)a3 handler:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  id v7 = +[MKMapService sharedService];
  [v7 _mapItemsForResponseData:v6 handler:v5];
}

- (NSString)formattedNumberOfReviews
{
  return (NSString *)[(MKMapItem *)self formattedNumberOfReviewsIncludingProvider:0 formatter:0];
}

- (NSString)formattedNumberOfReviewsIncludingProvider
{
  return (NSString *)[(MKMapItem *)self formattedNumberOfReviewsIncludingProvider:1 formatter:0];
}

- (id)formattedNumberOfReviewsIncludingProvider:(BOOL)a3 formatter:(id)a4
{
  BOOL v4 = a3;
  id v6 = a4;
  if (![(MKMapItem *)self _hasUserRatingScore])
  {
    id v13 = 0;
    goto LABEL_34;
  }
  id v7 = [(MKMapItem *)self reviewsProviderDisplayName];
  uint64_t v8 = [(MKMapItem *)self _sampleSizeForUserRatingScore];
  uint64_t v9 = [(MKMapItem *)self _reviews];
  uint64_t v10 = [v9 count];

  id v11 = [(MKMapItem *)self _tips];
  uint64_t v12 = [v11 count];

  if (v8 == 1)
  {
    if (v6) {
      [v6 stringFromNumber:&unk_1ED97E778];
    }
    else {
    long long v15 = [MEMORY[0x1E4F28EE0] localizedStringFromNumber:&unk_1ED97E778 numberStyle:0];
    }
    if (v4 && [v7 length])
    {
      if (v10)
      {
        long long v16 = @"MapItemReviewProvider_Singular";
LABEL_31:
        uint64_t v19 = _MKLocalizedStringFromThisBundle(v16);
        uint64_t v20 = NSString;
        id v22 = v7;
        goto LABEL_32;
      }
      if (v12)
      {
        long long v16 = @"MapItemTipProvider_Singular";
        goto LABEL_31;
      }
      goto LABEL_37;
    }
    if (v10)
    {
      long long v17 = @"MapItemReview_Singular";
    }
    else
    {
      if (!v12) {
        goto LABEL_37;
      }
      long long v17 = @"MapItemTip_Singular";
    }
  }
  else
  {
    if (v6)
    {
      long long v14 = [NSNumber numberWithUnsignedInt:v8];
      [v6 stringFromNumber:v14];
    }
    else
    {
      long long v18 = (void *)MEMORY[0x1E4F28EE0];
      long long v14 = [NSNumber numberWithUnsignedInt:v8];
      [v18 localizedStringFromNumber:v14 numberStyle:0];
    long long v15 = };

    if (v4 && [v7 length])
    {
      if (v10)
      {
        long long v16 = @"MapItemReviewProvider_Plural";
        goto LABEL_31;
      }
      if (v12)
      {
        long long v16 = @"MapItemTipProvider_Plural";
        goto LABEL_31;
      }
LABEL_37:
      id v13 = 0;
      goto LABEL_33;
    }
    if (v10)
    {
      long long v17 = @"MapItemReview_Plural";
    }
    else
    {
      if (!v12) {
        goto LABEL_37;
      }
      long long v17 = @"MapItemTip_Plural";
    }
  }
  uint64_t v19 = _MKLocalizedStringFromThisBundle(v17);
  uint64_t v20 = NSString;
LABEL_32:
  id v13 = objc_msgSend(v20, "localizedStringWithFormat:", v19, v15, v22);

LABEL_33:
LABEL_34:

  return v13;
}

+ (id)_mapItemWithWithLocation:(id)a3 addressDictionary:(id)a4 name:(id)a5 businessURL:(id)a6 phoneNumber:(id)a7 sessionID:(id)a8 muid:(unint64_t)a9 attributionID:(id)a10 sampleSizeForUserRatingScore:(unsigned int)a11 normalizedUserRatingScore:(float)a12
{
  uint64_t v19 = (objc_class *)MEMORY[0x1E4F64698];
  id v20 = a10;
  id v21 = a8;
  id v22 = a7;
  id v23 = a6;
  id v24 = a5;
  id v25 = a4;
  id v26 = a3;
  id v27 = [v19 alloc];
  id v28 = (void *)[objc_alloc(MEMORY[0x1E4F64660]) initWithCLLocation:v26];

  LODWORD(v33) = a11;
  *(float *)&double v29 = a12;
  uint64_t v30 = (void *)[v27 initWithWithLocation:v28 addressDictionary:v25 name:v24 businessURL:v23 phoneNumber:v22 sessionID:v21 muid:v29 attributionID:a9 sampleSizeForUserRatingScore:v20 normalizedUserRatingScore:v33];

  if (v30)
  {
    long long v31 = +[MKMapItem _itemWithGeoMapItem:v30];
  }
  else
  {
    long long v31 = 0;
  }

  return v31;
}

- (id)_reviewForIdentifier:(id)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (v4)
  {
    long long v16 = 0u;
    long long v17 = 0u;
    long long v14 = 0u;
    long long v15 = 0u;
    id v5 = [(MKMapItem *)self _reviews];
    id v6 = (id)[v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
    if (v6)
    {
      uint64_t v7 = *(void *)v15;
      while (2)
      {
        for (uint64_t i = 0; i != v6; uint64_t i = (char *)i + 1)
        {
          if (*(void *)v15 != v7) {
            objc_enumerationMutation(v5);
          }
          uint64_t v9 = *(void **)(*((void *)&v14 + 1) + 8 * i);
          uint64_t v10 = [v9 _geoReview];
          id v11 = [v10 _identifier];
          char v12 = [v11 isEqualToString:v4];

          if (v12)
          {
            id v6 = v9;
            goto LABEL_12;
          }
        }
        id v6 = (id)[v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
        if (v6) {
          continue;
        }
        break;
      }
    }
LABEL_12:
  }
  else
  {
    id v6 = 0;
  }

  return v6;
}

- (NSDate)_transitInfoUpdatedDate
{
  return self->_transitInfoUpdatedDate;
}

- (void)_markTransitInfoUpdated
{
  char v3 = [MEMORY[0x1E4F1C9C8] date];
  transitInfoUpdatedDate = self->_transitInfoUpdatedDate;
  self->_transitInfoUpdatedDate = v3;
}

- (void)_updateTransitInfoWithMapItem:(id)a3
{
  id v4 = a3;
  self->_isTransitInfoUpdated = 1;
  id v14 = v4;
  id v5 = [v4 _geoMapItem];
  id v6 = [v5 _transitInfo];
  if (self->_updatedTransitInfo != v6)
  {
    objc_storeStrong((id *)&self->_updatedTransitInfo, v6);
    uint64_t v7 = [v5 _transitAttribution];
    updatedTransitAttribution = self->_updatedTransitAttribution;
    self->_updatedTransitAttribution = v7;

    uint64_t v9 = [v14 _transitInfoUpdatedDate];
    uint64_t v10 = v9;
    if (v9)
    {
      id v11 = v9;
    }
    else
    {
      id v11 = [MEMORY[0x1E4F1C9C8] date];
    }
    transitInfoUpdatedDate = self->_transitInfoUpdatedDate;
    self->_transitInfoUpdatedDate = v11;

    id v13 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v13 postNotificationName:@"kMapItemTransitInfoDidUpdateNotification" object:self];
  }
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (MKMapItem)initWithCoder:(id)a3
{
  v21[1] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if ([v4 decodeBoolForKey:@"isCurrentLocation"])
  {
    id v5 = [(id)objc_opt_class() mapItemForCurrentLocation];
  }
  else
  {
    id v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"data"];
    uint64_t v7 = v6;
    if (v6
      && [v6 length]
      && !((unint64_t)[v7 length] >> 20)
      && ([MEMORY[0x1E4F646E0] mapItemStorageForSerializedMapItemStorage:v7],
          (uint64_t v8 = objc_claimAutoreleasedReturnValue()) != 0))
    {
      uint64_t v9 = (void *)v8;
      uint64_t v10 = [(MKMapItem *)self initWithGeoMapItem:v8 isPlaceHolderPlace:1];
      int v11 = [v4 decodeBoolForKey:@"usePOICategory"];
      v10->_useCustomPOICategory = v11;
      if (v11)
      {
        uint64_t v12 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"poiCategory"];
        customPOICategory = v10->_customPOICategory;
        v10->_customPOICategory = (NSString *)v12;
      }
    }
    else
    {

      id v14 = (void *)MEMORY[0x1E4F28C58];
      long long v15 = MKErrorDomain;
      uint64_t v20 = *MEMORY[0x1E4F28568];
      long long v16 = _MKLocalizedStringFromThisBundle(@"Data deserialization failed");
      v21[0] = v16;
      long long v17 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v21 forKeys:&v20 count:1];
      long long v18 = [v14 errorWithDomain:v15 code:1 userInfo:v17];
      [v4 failWithError:v18];

      uint64_t v10 = 0;
    }
    self = v10;

    id v5 = self;
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  v14[1] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if ([(MKMapItem *)self isCurrentLocation])
  {
    [v4 encodeBool:1 forKey:@"isCurrentLocation"];
  }
  else
  {
    id v5 = [(MKMapItem *)self _geoMapItemStorageForDragAndDrop];
    id v6 = [v5 data];
    uint64_t v7 = (void *)[v6 copy];

    if (v7 && [v7 length])
    {
      [v4 encodeObject:v7 forKey:@"data"];
      if (self->_useCustomPOICategory)
      {
        [v4 encodeBool:1 forKey:@"usePOICategory"];
        [v4 encodeObject:self->_customPOICategory forKey:@"poiCategory"];
      }
    }
    else
    {
      uint64_t v8 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v9 = MKErrorDomain;
      uint64_t v13 = *MEMORY[0x1E4F28568];
      uint64_t v10 = _MKLocalizedStringFromThisBundle(@"Data serialization failed");
      v14[0] = v10;
      int v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v14 forKeys:&v13 count:1];
      uint64_t v12 = [v8 errorWithDomain:v9 code:1 userInfo:v11];
      [v4 failWithError:v12];
    }
  }
}

+ (NSArray)writableTypeIdentifiersForItemProvider
{
  v8[3] = *MEMORY[0x1E4F143B8];
  double v2 = objc_msgSend((id)*MEMORY[0x1E4F44518], "identifier", @"com.apple.mapkit.map-item");
  v8[1] = v2;
  char v3 = [(id)*MEMORY[0x1E4F444F8] identifier];
  v8[2] = v3;
  id v4 = [MEMORY[0x1E4F1C978] arrayWithObjects:v8 count:3];
  id v5 = [MEMORY[0x1E4F28B18] writableTypeIdentifiersForItemProvider];
  id v6 = [v4 arrayByAddingObjectsFromArray:v5];

  return (NSArray *)v6;
}

- (id)loadDataWithTypeIdentifier:(id)a3 forItemProviderCompletionHandler:(id)a4
{
  v54[1] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  uint64_t v7 = (void (**)(id, void *, void))a4;
  if (![v6 isEqualToString:@"com.apple.mapkit.map-item"])
  {
    uint64_t v10 = [(id)*MEMORY[0x1E4F44518] identifier];
    int v11 = [v6 isEqualToString:v10];

    if (v11)
    {
      uint64_t v12 = [(MKMapItem *)self _placeCardContact];
      uint64_t v13 = [(MKMapItem *)self _activityURL];
      id v14 = [v13 absoluteString];
      long long v15 = v14;
      if (v14 && [v14 length])
      {
        long long v16 = (void *)[v12 mutableCopy];
        long long v17 = [v16 urlAddresses];
        long long v18 = (void *)MEMORY[0x1E4F1BA20];
        uint64_t v19 = _MKLocalizedStringFromThisBundle(@"map url");
        uint64_t v20 = [v18 labeledValueWithLabel:v19 value:v15];
        id v21 = [v17 arrayByAddingObject:v20];

        [v16 setUrlAddresses:v21];
        uint64_t v22 = [v16 copy];

        uint64_t v12 = (void *)v22;
      }
      id v23 = (void *)MEMORY[0x1E4F1B998];
      v54[0] = v12;
      id v24 = [MEMORY[0x1E4F1C978] arrayWithObjects:v54 count:1];
      uint64_t v51 = 0;
      id v25 = [v23 dataWithContacts:v24 error:&v51];

      v7[2](v7, v25, 0);
    }
    else
    {
      id v26 = [(id)*MEMORY[0x1E4F444F8] identifier];
      int v27 = [v6 isEqualToString:v26];

      if (v27)
      {
        uint64_t v12 = [(MKMapItem *)self _activityURL];
        id v28 = [(MKMapItem *)self name];
        [v12 _setTitle:v28];

        id v29 = (id)[v12 loadDataWithTypeIdentifier:v6 forItemProviderCompletionHandler:v7];
        goto LABEL_13;
      }
      long long v31 = [MEMORY[0x1E4F28B18] writableTypeIdentifiersForItemProvider];
      int v32 = [v31 containsObject:v6];

      if (v32)
      {
        uint64_t v33 = [(MKMapItem *)self name];
        uint64_t v34 = (void *)v33;
        id v35 = &stru_1ED919588;
        if (v33) {
          id v35 = (__CFString *)v33;
        }
        id v36 = v35;

        uint64_t v8 = [(MKMapItem *)self _activityURL];
        uint64_t v9 = (void *)[objc_alloc(MEMORY[0x1E4F28E48]) initWithString:v36];
        uint64_t v37 = *MEMORY[0x1E4F42530];
        uint64_t v38 = [(__CFString *)v36 length];

        objc_msgSend(v9, "addAttribute:value:range:", v37, v8, 0, v38);
        uint64_t v39 = (void *)[v9 copy];
        id v40 = (id)[v39 loadDataWithTypeIdentifier:v6 forItemProviderCompletionHandler:v7];

        goto LABEL_3;
      }
      v41 = [(id)*MEMORY[0x1E4F443F0] identifier];
      int v42 = [v6 isEqualToString:v41];

      if (!v42)
      {
        double v47 = (void *)MEMORY[0x1E4F28C58];
        double v48 = MKErrorDomain;
        uint64_t v52 = *MEMORY[0x1E4F28568];
        double v49 = _MKLocalizedStringFromThisBundle(@"Unsupported type identifier");
        v53 = v49;
        double v50 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v53 forKeys:&v52 count:1];
        uint64_t v8 = [v47 errorWithDomain:v48 code:1 userInfo:v50];

        ((void (**)(id, void *, void *))v7)[2](v7, 0, v8);
        goto LABEL_4;
      }
      uint64_t v43 = [(MKMapItem *)self name];
      int v44 = v43;
      if (!v43) {
        uint64_t v43 = &stru_1ED919588;
      }
      uint64_t v12 = [(__CFString *)v43 _navigation_sanitizedStringForDisplayInHTML];

      uint64_t v13 = [(MKMapItem *)self _activityURL];
      id v45 = NSString;
      unint64_t v46 = [v13 absoluteString];
      long long v15 = [v45 stringWithFormat:@"<a href=\"%@\">%@</a>", v46, v12];

      id v25 = [v15 dataUsingEncoding:4];
      v7[2](v7, v25, 0);
    }

LABEL_13:
    goto LABEL_14;
  }
  uint64_t v8 = [MEMORY[0x1E4F28DB0] archivedDataWithRootObject:self requiringSecureCoding:1 error:0];
  uint64_t v9 = (void *)[v8 copy];
  v7[2](v7, v9, 0);
LABEL_3:

LABEL_4:
LABEL_14:

  return 0;
}

+ (NSArray)readableTypeIdentifiersForItemProvider
{
  v6[3] = *MEMORY[0x1E4F143B8];
  double v2 = objc_msgSend((id)*MEMORY[0x1E4F44518], "identifier", @"com.apple.mapkit.map-item");
  v6[1] = v2;
  char v3 = [(id)*MEMORY[0x1E4F444F8] identifier];
  v6[2] = v3;
  id v4 = [MEMORY[0x1E4F1C978] arrayWithObjects:v6 count:3];

  return (NSArray *)v4;
}

+ (id)objectWithItemProviderData:(id)a3 typeIdentifier:(id)a4 error:(id *)a5
{
  v57[1] = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  if (![v8 isEqualToString:@"com.apple.mapkit.map-item"])
  {
    long long v15 = [(id)*MEMORY[0x1E4F44518] identifier];
    int v16 = [v8 isEqualToString:v15];

    if (v16)
    {
      long long v17 = [MEMORY[0x1E4F1B998] contactsWithData:v7 error:a5];
      if (v17)
      {
        long long v18 = v17;
        uint64_t v19 = [v17 firstObject];
        if (v19)
        {
          uint64_t v20 = v19;
          id v21 = [v19 urlAddresses];
          long long v46 = 0u;
          long long v47 = 0u;
          long long v48 = 0u;
          long long v49 = 0u;
          uint64_t v22 = [v21 reverseObjectEnumerator];
          uint64_t v23 = [v22 countByEnumeratingWithState:&v46 objects:v55 count:16];
          if (v23)
          {
            uint64_t v24 = v23;
            int v42 = v21;
            uint64_t v43 = v20;
            int v44 = v18;
            id v45 = v8;
            uint64_t v25 = *(void *)v47;
            while (2)
            {
              for (uint64_t i = 0; i != v24; ++i)
              {
                if (*(void *)v47 != v25) {
                  objc_enumerationMutation(v22);
                }
                int v27 = (void *)MEMORY[0x1E4F1CB10];
                id v28 = [*(id *)(*((void *)&v46 + 1) + 8 * i) value];
                id v29 = [v27 URLWithString:v28];

                if (v29)
                {
                  uint64_t v30 = [(id)objc_opt_class() _mapItemBackedByURL:v29];
                  if (v30)
                  {
                    uint64_t v9 = v30;

                    goto LABEL_27;
                  }
                }
              }
              uint64_t v24 = [v22 countByEnumeratingWithState:&v46 objects:v55 count:16];
              if (v24) {
                continue;
              }
              break;
            }
            uint64_t v9 = 0;
LABEL_27:
            id v8 = v45;
            uint64_t v20 = v43;
            long long v18 = v44;
            id v21 = v42;
          }
          else
          {
            uint64_t v9 = 0;
          }

          goto LABEL_31;
        }
      }
    }
    else
    {
      long long v31 = [(id)*MEMORY[0x1E4F444F8] identifier];
      int v32 = [v8 isEqualToString:v31];

      if (v32)
      {
        long long v18 = [MEMORY[0x1E4F1CB10] objectWithItemProviderData:v7 typeIdentifier:v8 error:a5];
        if (v18)
        {
          uint64_t v9 = [(id)objc_opt_class() _mapItemBackedByURL:v18];
        }
        else
        {
          uint64_t v9 = 0;
        }
LABEL_31:

        goto LABEL_32;
      }
      if (a5)
      {
        uint64_t v33 = (void *)MEMORY[0x1E4F28C58];
        uint64_t v34 = MKErrorDomain;
        uint64_t v53 = *MEMORY[0x1E4F28568];
        id v35 = _MKLocalizedStringFromThisBundle(@"Unsupported type identifier");
        v54 = v35;
        id v36 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v54 forKeys:&v53 count:1];
        *a5 = [v33 errorWithDomain:v34 code:1 userInfo:v36];

        uint64_t v9 = 0;
        goto LABEL_32;
      }
    }
LABEL_36:
    uint64_t v9 = 0;
    goto LABEL_37;
  }
  id v50 = 0;
  uint64_t v9 = [MEMORY[0x1E4F28DC0] unarchivedObjectOfClass:objc_opt_class() fromData:v7 error:&v50];
  uint64_t v10 = (uint64_t)v50;
  if (!(v9 | v10))
  {
    int v11 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v12 = MKErrorDomain;
    uint64_t v56 = *MEMORY[0x1E4F28568];
    uint64_t v13 = _MKLocalizedStringFromThisBundle(@"Data deserialization failed");
    v57[0] = v13;
    id v14 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v57 forKeys:&v56 count:1];
    uint64_t v10 = [v11 errorWithDomain:v12 code:1 userInfo:v14];
  }
  if (a5) {
    *a5 = (id) v10;
  }

LABEL_32:
  if (a5 && !v9)
  {
    if (!*a5)
    {
      uint64_t v37 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v38 = MKErrorDomain;
      uint64_t v51 = *MEMORY[0x1E4F28568];
      uint64_t v39 = _MKLocalizedStringFromThisBundle(@"Unrecognized data");
      uint64_t v52 = v39;
      id v40 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v52 forKeys:&v51 count:1];
      *a5 = [v37 errorWithDomain:v38 code:1 userInfo:v40];
    }
    goto LABEL_36;
  }
LABEL_37:

  return (id)v9;
}

- (void)_getFirstAvailableAppClipLinkWithCompletion:(id)a3
{
  id v4 = a3;
  id v5 = [(MKMapItem *)self _quickLinks];
  [(MKMapItem *)self _getFirstAvailableAppClipLinkFromQuickLinks:v5 completion:v4];
}

- (void)_getFirstAvailableSecondaryAppClipLinkWithCompletion:(id)a3
{
  id v4 = a3;
  id v5 = [(MKMapItem *)self _secondaryQuickLinks];
  [(MKMapItem *)self _getFirstAvailableAppClipLinkFromQuickLinks:v5 completion:v4];
}

- (void)_getFirstAvailableAppClipLinkFromQuickLinks:(id)a3 completion:(id)a4
{
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  id v7 = v6;
  if (v6)
  {
    uint64_t v22 = v6;
    objc_msgSend(NSString, "stringWithFormat:", @"com.apple.MapKit.MKMapItem+GEOQuickLinkHelper.%p.queue", v5);
    id v8 = objc_claimAutoreleasedReturnValue();
    uint64_t v9 = (const char *)[v8 UTF8String];

    uint64_t v10 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v11 = dispatch_queue_create(v9, v10);

    uint64_t v12 = dispatch_group_create();
    uint64_t v13 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA60]), "initWithCapacity:", objc_msgSend(v5, "count"));
    long long v32 = 0u;
    long long v33 = 0u;
    long long v34 = 0u;
    long long v35 = 0u;
    id v23 = v5;
    id v14 = v5;
    uint64_t v15 = [v14 countByEnumeratingWithState:&v32 objects:v36 count:16];
    if (v15)
    {
      uint64_t v16 = v15;
      uint64_t v17 = *(void *)v33;
      do
      {
        uint64_t v18 = 0;
        do
        {
          if (*(void *)v33 != v17) {
            objc_enumerationMutation(v14);
          }
          uint64_t v19 = *(void *)(*((void *)&v32 + 1) + 8 * v18);
          if (v19 && [*(id *)(*((void *)&v32 + 1) + 8 * v18) type] == 2)
          {
            dispatch_group_enter(v12);
            block[0] = MEMORY[0x1E4F143A8];
            block[1] = 3221225472;
            block[2] = __88__MKMapItem_GEOQuickLinkHelper___getFirstAvailableAppClipLinkFromQuickLinks_completion___block_invoke;
            block[3] = &unk_1E54B9D00;
            block[4] = v19;
            uint64_t v20 = v11;
            id v29 = v20;
            id v30 = v13;
            long long v31 = v12;
            dispatch_async(v20, block);
          }
          ++v18;
        }
        while (v16 != v18);
        uint64_t v16 = [v14 countByEnumeratingWithState:&v32 objects:v36 count:16];
      }
      while (v16);
    }

    v24[0] = MEMORY[0x1E4F143A8];
    v24[1] = 3221225472;
    v24[2] = __88__MKMapItem_GEOQuickLinkHelper___getFirstAvailableAppClipLinkFromQuickLinks_completion___block_invoke_4;
    v24[3] = &unk_1E54B9240;
    id v25 = v14;
    id v26 = v13;
    id v7 = v22;
    id v27 = v22;
    id v21 = v13;
    dispatch_group_notify(v12, v11, v24);

    id v5 = v23;
  }
}

void __88__MKMapItem_GEOQuickLinkHelper___getFirstAvailableAppClipLinkFromQuickLinks_completion___block_invoke(uint64_t a1)
{
  double v2 = +[MKClipServices sharedInstance];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __88__MKMapItem_GEOQuickLinkHelper___getFirstAvailableAppClipLinkFromQuickLinks_completion___block_invoke_2;
  v6[3] = &unk_1E54BC050;
  uint64_t v3 = *(void *)(a1 + 32);
  id v7 = *(id *)(a1 + 40);
  id v4 = *(id *)(a1 + 48);
  uint64_t v5 = *(void *)(a1 + 32);
  id v8 = v4;
  uint64_t v9 = v5;
  id v10 = *(id *)(a1 + 56);
  [v2 appClipWithQuickLink:v3 completion:v6];
}

void __88__MKMapItem_GEOQuickLinkHelper___getFirstAvailableAppClipLinkFromQuickLinks_completion___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __88__MKMapItem_GEOQuickLinkHelper___getFirstAvailableAppClipLinkFromQuickLinks_completion___block_invoke_3;
  v9[3] = &unk_1E54B9D00;
  id v10 = v3;
  id v4 = *(NSObject **)(a1 + 32);
  id v5 = *(id *)(a1 + 40);
  uint64_t v6 = *(void *)(a1 + 48);
  id v7 = *(void **)(a1 + 56);
  id v11 = v5;
  uint64_t v12 = v6;
  id v13 = v7;
  id v8 = v3;
  dispatch_async(v4, v9);
}

void __88__MKMapItem_GEOQuickLinkHelper___getFirstAvailableAppClipLinkFromQuickLinks_completion___block_invoke_3(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  if (v2)
  {
    id v3 = *(void **)(a1 + 40);
    id v4 = [*(id *)(a1 + 48) URLString];
    [v3 setObject:v2 forKeyedSubscript:v4];
  }
  id v5 = *(NSObject **)(a1 + 56);

  dispatch_group_leave(v5);
}

void __88__MKMapItem_GEOQuickLinkHelper___getFirstAvailableAppClipLinkFromQuickLinks_completion___block_invoke_4(uint64_t a1)
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v2 = *(id *)(a1 + 32);
  id v3 = (id)[v2 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v3)
  {
    uint64_t v4 = *(void *)v16;
    while (2)
    {
      for (uint64_t i = 0; i != v3; uint64_t i = (char *)i + 1)
      {
        if (*(void *)v16 != v4) {
          objc_enumerationMutation(v2);
        }
        uint64_t v6 = *(void **)(*((void *)&v15 + 1) + 8 * i);
        id v7 = *(void **)(a1 + 40);
        id v8 = [v6 URLString];
        uint64_t v9 = [v7 objectForKeyedSubscript:v8];

        if (v9)
        {
          id v3 = v6;
          goto LABEL_11;
        }
      }
      id v3 = (id)[v2 countByEnumeratingWithState:&v15 objects:v19 count:16];
      if (v3) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __88__MKMapItem_GEOQuickLinkHelper___getFirstAvailableAppClipLinkFromQuickLinks_completion___block_invoke_5;
  v12[3] = &unk_1E54B8360;
  id v10 = *(id *)(a1 + 48);
  id v13 = v3;
  id v14 = v10;
  id v11 = v3;
  dispatch_async(MEMORY[0x1E4F14428], v12);
}

uint64_t __88__MKMapItem_GEOQuickLinkHelper___getFirstAvailableAppClipLinkFromQuickLinks_completion___block_invoke_5(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

- (void)_getHasAvailableAppClipWithCompletion:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __71__MKMapItem_GEOQuickLinkHelper___getHasAvailableAppClipWithCompletion___block_invoke;
  v6[3] = &unk_1E54BC078;
  id v7 = v4;
  id v5 = v4;
  [(MKMapItem *)self _getFirstAvailableAppClipLinkWithCompletion:v6];
}

uint64_t __71__MKMapItem_GEOQuickLinkHelper___getHasAvailableAppClipWithCompletion___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(uint64_t, BOOL))(result + 16))(result, a2 != 0);
  }
  return result;
}

- (void)_getHasAvailableSecondaryAppClipWithCompletion:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __80__MKMapItem_GEOQuickLinkHelper___getHasAvailableSecondaryAppClipWithCompletion___block_invoke;
  v6[3] = &unk_1E54BC078;
  id v7 = v4;
  id v5 = v4;
  [(MKMapItem *)self _getFirstAvailableSecondaryAppClipLinkWithCompletion:v6];
}

uint64_t __80__MKMapItem_GEOQuickLinkHelper___getHasAvailableSecondaryAppClipWithCompletion___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(uint64_t, BOOL))(result + 16))(result, a2 != 0);
  }
  return result;
}

- (BOOL)_mapkit_supportsFullScreenExperience
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v2 = [(MKMapItem *)self _mapkit_resolvedFlatPhotoList];
  id v3 = v2;
  if (v2)
  {
    long long v13 = 0u;
    long long v14 = 0u;
    long long v11 = 0u;
    long long v12 = 0u;
    id v4 = v2;
    uint64_t v5 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
    if (v5)
    {
      uint64_t v6 = v5;
      uint64_t v7 = *(void *)v12;
      while (2)
      {
        for (uint64_t i = 0; i != v6; ++i)
        {
          if (*(void *)v12 != v7) {
            objc_enumerationMutation(v4);
          }
          if (!objc_msgSend(*(id *)(*((void *)&v11 + 1) + 8 * i), "displayFullScreenPhotoGallery", (void)v11))
          {
            BOOL v9 = 0;
            goto LABEL_12;
          }
        }
        uint64_t v6 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
        if (v6) {
          continue;
        }
        break;
      }
    }
    BOOL v9 = 1;
LABEL_12:
  }
  else
  {
    BOOL v9 = 1;
  }

  return v9;
}

- (BOOL)_mapkit_hasFlatListOfPhotos
{
  id v2 = [(MKMapItem *)self _mapkit_resolvedFlatPhotoList];
  BOOL v3 = [v2 count] != 0;

  return v3;
}

- (BOOL)_mapkit_hasSinglePhotoVendor
{
  id v2 = [(MKMapItem *)self _allPhotoAttributions];
  BOOL v3 = [v2 count] == 1;

  return v3;
}

- (BOOL)_mapkit_hasMultiplePhotoVendors
{
  id v2 = [(MKMapItem *)self _allPhotoAttributions];
  BOOL v3 = (unint64_t)[v2 count] > 1;

  return v3;
}

- (id)_mapkit_preferredFirstPhotoVendor
{
  BOOL v3 = [(MKMapItem *)self _allPhotoAttributions];
  unint64_t v4 = [v3 count];

  if (v4 <= 1)
  {
    uint64_t v6 = [(MKMapItem *)self _allPhotoAttributions];
    uint64_t v5 = [v6 firstObject];
  }
  else
  {
    uint64_t v5 = 0;
  }

  return v5;
}

- (id)_mapkit_resolvedFlatPhotoList
{
  BOOL v3 = [(MKMapItem *)self _geoMapItem];
  unint64_t v4 = [v3 _captionedPhotoAlbums];
  unint64_t v5 = [v4 count];

  if (v5 <= 1)
  {
    uint64_t v6 = [(MKMapItem *)self _geoMapItem];
    if ([v6 _hasCaptionedPhotoAlbum])
    {
      uint64_t v7 = [(MKMapItem *)self _geoMapItem];
      id v8 = [v7 _captionedPhotoAlbums];
      uint64_t v9 = [v8 count];

      if (v9 == 1)
      {
        id v10 = [(MKMapItem *)self _geoMapItem];
        long long v11 = [v10 _captionedPhotoAlbums];
        long long v12 = [v11 firstObject];
        long long v13 = [v12 photoList];
        long long v14 = (void *)[v13 copy];

LABEL_8:
        goto LABEL_10;
      }
    }
    else
    {
    }
    long long v15 = [(MKMapItem *)self _geoMapItem];
    uint64_t v16 = [v15 _photos];
    uint64_t v17 = [v16 count];

    if (v17)
    {
      id v10 = [(MKMapItem *)self _geoMapItem];
      long long v11 = [v10 _photos];
      long long v14 = (void *)[v11 copy];
      goto LABEL_8;
    }
  }
  long long v14 = 0;
LABEL_10:

  return v14;
}

- (unint64_t)_mapkit_numberOfPhotosAvailableForFlatList
{
  BOOL v3 = [(MKMapItem *)self _geoMapItem];
  unint64_t v4 = [v3 _captionedPhotoAlbums];
  unint64_t v5 = [v4 count];

  if (v5 > 1) {
    return 0;
  }
  uint64_t v6 = [(MKMapItem *)self _geoMapItem];
  if (([v6 _hasCaptionedPhotoAlbum] & 1) == 0)
  {

LABEL_6:
    long long v14 = [(MKMapItem *)self _geoMapItem];
    long long v15 = [v14 _photos];
    uint64_t v16 = [v15 count];

    if (v16)
    {
      id v10 = [(MKMapItem *)self _geoMapItem];
      unint64_t v13 = [v10 _totalPhotoCount];
      goto LABEL_8;
    }
    return 0;
  }
  uint64_t v7 = [(MKMapItem *)self _geoMapItem];
  id v8 = [v7 _captionedPhotoAlbums];
  uint64_t v9 = [v8 count];

  if (v9 != 1) {
    goto LABEL_6;
  }
  id v10 = [(MKMapItem *)self _geoMapItem];
  long long v11 = [v10 _captionedPhotoAlbums];
  long long v12 = [v11 firstObject];
  unint64_t v13 = [v12 totalNumberOfPhotosAvailable];

LABEL_8:
  return v13;
}

- (BOOL)_mapkit_canAtLeastOneAttributionShowPhotosLocally
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  long long v7 = 0u;
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  id v2 = [(MKMapItem *)self _allPhotoAttributions];
  uint64_t v3 = [v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
  if (v3)
  {
    uint64_t v4 = *(void *)v8;
    while (2)
    {
      for (uint64_t i = 0; i != v3; ++i)
      {
        if (*(void *)v8 != v4) {
          objc_enumerationMutation(v2);
        }
        if ([*(id *)(*((void *)&v7 + 1) + 8 * i) shouldHandlePhotosLocally])
        {
          LOBYTE(v3) = 1;
          goto LABEL_11;
        }
      }
      uint64_t v3 = [v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
      if (v3) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return v3;
}

- (BOOL)_mapkit_canAtLeastOneAttributionShowAddPhotosLocally
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  long long v7 = 0u;
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  id v2 = [(MKMapItem *)self _allPhotoAttributions];
  uint64_t v3 = [v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
  if (v3)
  {
    uint64_t v4 = *(void *)v8;
    while (2)
    {
      for (uint64_t i = 0; i != v3; ++i)
      {
        if (*(void *)v8 != v4) {
          objc_enumerationMutation(v2);
        }
        if ([*(id *)(*((void *)&v7 + 1) + 8 * i) shouldAddPhotosLocally])
        {
          LOBYTE(v3) = 1;
          goto LABEL_11;
        }
      }
      uint64_t v3 = [v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
      if (v3) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return v3;
}

- (BOOL)_hasRestaurantExtensionInfo
{
  uint64_t v3 = [(MKMapItem *)self _geoMapItem];
  uint64_t v4 = [v3 _featureLink];
  if ([v4 hasFeatures])
  {
    unint64_t v5 = [(MKMapItem *)self _restaurantLink_firstProviderIdentifier];
    BOOL v6 = [v5 length] != 0;
  }
  else
  {
    BOOL v6 = 0;
  }

  return v6;
}

- (BOOL)_restaurantLink_hasFeatureType:(unint64_t)a3
{
  uint64_t v4 = [(MKMapItem *)self _geoMapItem];
  unint64_t v5 = [v4 _featureLink];
  BOOL v6 = [v5 featureTypes];
  long long v7 = [NSNumber numberWithUnsignedInteger:a3];
  char v8 = [v6 containsObject:v7];

  return v8;
}

- (unint64_t)_restaurantExtensionModeForFirstProvider
{
  uint64_t v3 = [(MKMapItem *)self _geoMapItem];
  uint64_t v4 = [v3 _featureLink];
  unint64_t v5 = [(MKMapItem *)self _restaurantLink_firstVendorID];
  unint64_t v6 = [v4 extensionModeForVendorID:v5];

  return v6;
}

- (id)_restaurantLink_firstProviderIdentifier
{
  uint64_t v3 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
  if ([v3 BOOLForKey:@"RestaurantReservationAppBundleIDs"])
  {
    uint64_t v4 = [(MKMapItem *)self _restaurantLink_overridenBundleIDsForVendorIDs];
    unint64_t v5 = [(MKMapItem *)self _restaurantLink_firstVendorID];
    unint64_t v6 = [v4 objectForKeyedSubscript:v5];
  }
  else
  {
    long long v7 = [(MKMapItem *)self _geoMapItem];
    char v8 = [v7 _featureLink];
    long long v9 = [(MKMapItem *)self _restaurantLink_firstVendorID];
    long long v10 = [v8 applicationsForVendorID:v9];
    uint64_t v4 = [v10 firstObject];

    unint64_t v6 = [v4 appBundleIdentifier];
  }

  return v6;
}

- (id)_restaurantLink_firstVendorID
{
  id v2 = [(MKMapItem *)self _geoMapItem];
  uint64_t v3 = [v2 _featureLink];
  uint64_t v4 = [v3 featureProviders];

  unint64_t v5 = [v4 firstObject];
  unint64_t v6 = [v5 allKeys];
  long long v7 = [v6 firstObject];

  return v7;
}

- (id)_restaurantLink_firstProviderPlaceIdentifier
{
  uint64_t v3 = [(MKMapItem *)self _restaurantLink_firstVendorID];
  if (v3)
  {
    uint64_t v4 = [(MKMapItem *)self _geoMapItem];
    unint64_t v5 = [v4 _featureLink];
    unint64_t v6 = [v5 featureProviders];

    long long v7 = [v6 firstObject];
    char v8 = [v7 objectForKeyedSubscript:v3];
  }
  else
  {
    char v8 = 0;
  }

  return v8;
}

- (id)_restaurantLink_firstProviderDisplayName
{
  uint64_t v3 = [(MKMapItem *)self _restaurantLink_firstVendorID];
  if (v3)
  {
    uint64_t v4 = [(MKMapItem *)self _geoMapItem];
    unint64_t v5 = [v4 _featureLink];
    unint64_t v6 = [v5 displayNameForVendorID:v3];
  }
  else
  {
    unint64_t v6 = 0;
  }

  return v6;
}

- (id)_restaurantLink_overridenBundleIDsForVendorIDs
{
  return &unk_1ED97F120;
}

- (MKMapItem)initWithContact:(id)a3
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  unint64_t v5 = objc_msgSend(v4, "postalAddresses", 0);
  uint64_t v6 = [v5 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    char v8 = 0;
    uint64_t v9 = *(void *)v17;
LABEL_3:
    uint64_t v10 = 0;
    long long v11 = v8;
    while (1)
    {
      if (*(void *)v17 != v9) {
        objc_enumerationMutation(v5);
      }
      uint64_t v12 = [*(id *)(*((void *)&v16 + 1) + 8 * v10) value];
      char v8 = [v12 dictionaryRepresentation];

      if ([v8 count]) {
        break;
      }
      ++v10;
      long long v11 = v8;
      if (v7 == v10)
      {
        uint64_t v7 = [v5 countByEnumeratingWithState:&v16 objects:v20 count:16];
        if (v7) {
          goto LABEL_3;
        }
        break;
      }
    }
  }
  else
  {
    char v8 = 0;
  }

  unint64_t v13 = [(MKMapItem *)self initWithAddressDictionary:v8];
  if (v13)
  {
    long long v14 = [MEMORY[0x1E4F1B910] stringFromContact:v4 style:0];
    [(MKMapItem *)v13 setName:v14];
  }
  return v13;
}

- (BOOL)_isEmptyContactMapItem
{
  [(MKMapItem *)self _coordinate];
  BOOL v4 = v3 < -180.0;
  if (v3 > 180.0) {
    BOOL v4 = 1;
  }
  if (v2 < -90.0) {
    BOOL v4 = 1;
  }
  return v2 > 90.0 || v4;
}

- (id)_placeCardContact
{
  v25[1] = *MEMORY[0x1E4F143B8];
  id v3 = objc_alloc_init(MEMORY[0x1E4F1BA40]);
  if ([(MKMapItem *)self _isMapItemTypeBusiness])
  {
    [v3 setContactType:1];
    BOOL v4 = [(MKMapItem *)self place];
    unint64_t v5 = [v4 name];
    [v3 setOrganizationName:v5];

    uint64_t v6 = (id *)MEMORY[0x1E4F1B770];
  }
  else
  {
    [v3 setContactType:0];
    if ([(MKMapItem *)self _isMapItemTypeAddress])
    {
      uint64_t v6 = (id *)MEMORY[0x1E4F1B6F8];
      goto LABEL_7;
    }
    BOOL v4 = [(MKMapItem *)self name];
    [v3 setGivenName:v4];
    uint64_t v6 = (id *)MEMORY[0x1E4F1B6F8];
  }

LABEL_7:
  id v7 = *v6;
  char v8 = [(MKMapItem *)self _cnPostalAddress];

  if (v8)
  {
    uint64_t v9 = [(MKMapItem *)self _cnPostalAddress];
    uint64_t v10 = [MEMORY[0x1E4F1BA20] labeledValueWithLabel:v7 value:v9];
    long long v11 = (void *)v10;
    if (v10)
    {
      v25[0] = v10;
      uint64_t v12 = [MEMORY[0x1E4F1C978] arrayWithObjects:v25 count:1];
      [v3 setPostalAddresses:v12];
    }
  }
  unint64_t v13 = [(MKMapItem *)self phoneNumber];
  if ([v13 length])
  {
    long long v14 = [MEMORY[0x1E4F1BA70] phoneNumberWithStringValue:v13];
    long long v15 = [MEMORY[0x1E4F1BA20] labeledValueWithLabel:v7 value:v14];
    uint64_t v24 = v15;
    long long v16 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v24 count:1];
    [v3 setPhoneNumbers:v16];
  }
  long long v17 = [(MKMapItem *)self url];
  long long v18 = [v17 absoluteString];

  if ([v18 length])
  {
    long long v19 = [MEMORY[0x1E4F1BA20] labeledValueWithLabel:*MEMORY[0x1E4F1B768] value:v18];
    id v23 = v19;
    uint64_t v20 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v23 count:1];
    [v3 setUrlAddresses:v20];
  }
  uint64_t v21 = [(MKMapItem *)self _mapsDataString];
  if ([v21 length]) {
    [v3 setMapsData:v21];
  }

  return v3;
}

+ (id)contactsAddressDictionaryFromGeoAddressDictionary:(id)a3
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  BOOL v4 = +[MKMapItem contactsAddressKeysForGeoAddressKeys];
  unint64_t v5 = objc_msgSend(MEMORY[0x1E4F1CA60], "dictionaryWithCapacity:", objc_msgSend(v3, "count"));
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  uint64_t v6 = objc_msgSend(v3, "allKeys", 0);
  uint64_t v7 = [v6 countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v19;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v19 != v9) {
          objc_enumerationMutation(v6);
        }
        long long v11 = *(void **)(*((void *)&v18 + 1) + 8 * i);
        uint64_t v12 = [v4 objectForKeyedSubscript:v11];
        unint64_t v13 = (void *)v12;
        if (v12) {
          long long v14 = (void *)v12;
        }
        else {
          long long v14 = v11;
        }
        id v15 = v14;

        long long v16 = [v3 objectForKeyedSubscript:v11];
        [v5 setObject:v16 forKeyedSubscript:v15];
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v18 objects:v22 count:16];
    }
    while (v8);
  }

  return v5;
}

+ (id)contactsAddressKeysForGeoAddressKeys
{
  v10[6] = *MEMORY[0x1E4F143B8];
  uint64_t v2 = *MEMORY[0x1E4F1B7C8];
  v9[0] = @"Street";
  v9[1] = @"City";
  uint64_t v3 = *MEMORY[0x1E4F1B798];
  v10[0] = v2;
  v10[1] = v3;
  uint64_t v4 = *MEMORY[0x1E4F1B7C0];
  v9[2] = @"State";
  v9[3] = @"ZIP";
  uint64_t v5 = *MEMORY[0x1E4F1B7B0];
  v10[2] = v4;
  v10[3] = v5;
  void v9[4] = @"Country";
  v9[5] = @"CountryCode";
  uint64_t v6 = *MEMORY[0x1E4F1B7A8];
  void v10[4] = *MEMORY[0x1E4F1B7A0];
  v10[5] = v6;
  uint64_t v7 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v10 forKeys:v9 count:6];

  return v7;
}

- (id)_initWithLabelMarker:(id)a3
{
  id v4 = a3;
  uint64_t v5 = +[_MKLabelMarkerItem labelMarkerItemWithLabelMarker:v4];
  uint64_t v6 = [(MKMapItem *)self initWithGeoMapItem:v5 isPlaceHolderPlace:0];

  if (v6)
  {
    if ([v4 featureType] == 5) {
      [(MKMapItem *)v6 setIsMapItemTypeTransit:1];
    }
    [v4 coordinate];
    double v8 = v7;
    [v4 coordinate];
    [(MKMapItem *)v6 setPresentCoordinate:v8];
    uint64_t v9 = v6;
  }

  return v6;
}

+ (void)_fillOutRequest:(id)a3 withMapsDataString:(id)a4
{
  v16[1] = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if (v5)
  {
    uint64_t v6 = [a4 dataUsingEncoding:4];
    double v7 = [MEMORY[0x1E4F28D90] JSONObjectWithData:v6 options:0 error:0];
    double v8 = [v7 objectForKey:@"MKMapItemPlaceCardVersion"];
    uint64_t v9 = [v8 integerValue];

    if (v9 == 1)
    {
      uint64_t v10 = [v7 objectForKey:@"MKMapItemPlaceCardID"];
      if (v10)
      {
        long long v11 = (void *)v10;
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          uint64_t v12 = objc_msgSend(objc_alloc(NSNumber), "initWithUnsignedLongLong:", objc_msgSend(v11, "unsignedLongLongValue"));

          long long v11 = (void *)v12;
        }
        v16[0] = v11;
        unint64_t v13 = [MEMORY[0x1E4F1C978] arrayWithObjects:v16 count:1];
        [v5 _setMuids:v13];

        long long v14 = [v7 objectForKey:@"MKMapItemPlaceCardResultProvider"];
        id v15 = v14;
        if (v14) {
          objc_msgSend(v5, "_setResultProviderID:", objc_msgSend(v14, "intValue"));
        }
      }
    }
  }
}

+ (id)ticketForMapsDataString:(id)a3 name:(id)a4
{
  id v5 = a4;
  uint64_t v6 = [a3 dataUsingEncoding:4];
  double v7 = [MEMORY[0x1E4F28D90] JSONObjectWithData:v6 options:0 error:0];
  double v8 = [v7 objectForKey:@"MKMapItemPlaceCardVersion"];
  uint64_t v9 = [v8 integerValue];

  uint64_t v10 = 0;
  if (v9 == 1)
  {
    long long v11 = [v7 objectForKey:@"MKMapItemPlaceCardID"];
    if (v11)
    {
      uint64_t v12 = [v7 objectForKey:@"MKMapItemPlaceCardResultProvider"];
      unint64_t v13 = v12;
      if (v12) {
        uint64_t v14 = [v12 intValue];
      }
      else {
        uint64_t v14 = 0;
      }
      id v15 = -[MKMapItemIdentifier initWithMUID:]([MKMapItemIdentifier alloc], "initWithMUID:", [v11 unsignedLongLongValue]);
      long long v16 = +[MKMapService sharedService];
      uint64_t v10 = [v16 ticketForURLQuery:v5 identifier:v15 resultProviderId:v14 contentProvider:0 maxResults:1 traits:0];
    }
    else
    {
      uint64_t v10 = 0;
    }
  }

  return v10;
}

- (id)_mapsDataString
{
  if ([(MKMapItem *)self _hasMUID])
  {
    uint64_t v3 = (void *)MEMORY[0x1E4F1CA60];
    id v4 = objc_msgSend(NSNumber, "numberWithUnsignedLongLong:", -[MKMapItem _muid](self, "_muid"));
    id v5 = objc_msgSend(v3, "dictionaryWithObjectsAndKeys:", &unk_1ED97EF58, @"MKMapItemPlaceCardVersion", v4, @"MKMapItemPlaceCardID", 0);

    uint64_t v6 = [(MKMapItem *)self _geoMapItem];
    if ([v6 _hasResultProviderID])
    {
      double v7 = objc_msgSend(NSNumber, "numberWithInt:", objc_msgSend(v6, "_resultProviderID"));
      [v5 setObject:v7 forKey:@"MKMapItemPlaceCardResultProvider"];
    }
    double v8 = [MEMORY[0x1E4F28D90] dataWithJSONObject:v5 options:0 error:0];
    uint64_t v9 = (void *)[[NSString alloc] initWithData:v8 encoding:4];
  }
  else
  {
    uint64_t v9 = 0;
  }

  return v9;
}

- (id)_htmlRepresentation
{
  uint64_t v10 = 0;
  long long v11 = &v10;
  uint64_t v12 = 0x3032000000;
  unint64_t v13 = __Block_byref_object_copy__26;
  uint64_t v14 = __Block_byref_object_dispose__26;
  id v15 = 0;
  v8[0] = 0;
  v8[1] = v8;
  v8[2] = 0x2020000000;
  char v9 = 0;
  uint64_t v3 = [(id)*MEMORY[0x1E4F443F0] identifier];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  void v7[2] = __49__MKMapItem_MKMapItemExtras___htmlRepresentation__block_invoke;
  v7[3] = &unk_1E54BEE10;
  void v7[4] = &v10;
  v7[5] = v8;
  id v4 = [(MKMapItem *)self loadDataWithTypeIdentifier:v3 forItemProviderCompletionHandler:v7];

  id v5 = (id)v11[5];
  _Block_object_dispose(v8, 8);
  _Block_object_dispose(&v10, 8);

  return v5;
}

void __49__MKMapItem_MKMapItemExtras___htmlRepresentation__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3 = (objc_class *)NSString;
  id v4 = a2;
  uint64_t v5 = [[v3 alloc] initWithData:v4 encoding:4];

  uint64_t v6 = *(void *)(*(void *)(a1 + 32) + 8);
  double v7 = *(void **)(v6 + 40);
  *(void *)(v6 + 40) = v5;

  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 1;
}

- (id)_vCardRepresentation
{
  uint64_t v10 = 0;
  long long v11 = &v10;
  uint64_t v12 = 0x3032000000;
  unint64_t v13 = __Block_byref_object_copy__26;
  uint64_t v14 = __Block_byref_object_dispose__26;
  id v15 = 0;
  v8[0] = 0;
  v8[1] = v8;
  v8[2] = 0x2020000000;
  char v9 = 0;
  uint64_t v3 = [(id)*MEMORY[0x1E4F44518] identifier];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  void v7[2] = __56__MKMapItem_MKMapItemVCardHelpers___vCardRepresentation__block_invoke;
  v7[3] = &unk_1E54BEE10;
  void v7[4] = &v10;
  v7[5] = v8;
  id v4 = [(MKMapItem *)self loadDataWithTypeIdentifier:v3 forItemProviderCompletionHandler:v7];

  id v5 = (id)v11[5];
  _Block_object_dispose(v8, 8);
  _Block_object_dispose(&v10, 8);

  return v5;
}

void __56__MKMapItem_MKMapItemVCardHelpers___vCardRepresentation__block_invoke(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40), a2);
  id v4 = a2;
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 1;
}

- (id)_vCardFilename
{
  uint64_t v2 = NSString;
  uint64_t v3 = [(MKMapItem *)self name];
  id v4 = [v2 stringWithFormat:@"%@.loc.vcf", v3];

  return v4;
}

+ (id)_mapItemFromVCardRepresentation:(id)a3 error:(id *)a4
{
  id v5 = (void *)*MEMORY[0x1E4F44518];
  id v6 = a3;
  double v7 = [v5 identifier];
  double v8 = +[MKMapItem objectWithItemProviderData:v6 typeIdentifier:v7 error:a4];

  return v8;
}

@end