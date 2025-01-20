@interface MUPlaceDataAvailability
- (BOOL)_hasAppleRatingsCategories;
- (BOOL)allowTransitLineSelection;
- (BOOL)canShowDirections;
- (BOOL)hasRatingsOrReviews;
- (BOOL)isRouteCreationAvailable;
- (BOOL)isTransitItem;
- (BOOL)shouldShowRatingsAndReviewsModule;
- (BOOL)showEditAddressForHome;
- (BOOL)suportsOfficialApp;
- (BOOL)supportsAddingPhotos;
- (BOOL)supportsAmenities;
- (BOOL)supportsAnnotatedPhotos;
- (BOOL)supportsAnnotatedTextList;
- (BOOL)supportsAppleRatings;
- (BOOL)supportsBrowseCategory;
- (BOOL)supportsCallToAction;
- (BOOL)supportsCuratedGuidesCarousel;
- (BOOL)supportsEVCharging;
- (BOOL)supportsEncyclopedicDescription;
- (BOOL)supportsHeaderContainment;
- (BOOL)supportsHikingTip;
- (BOOL)supportsHikingTrails;
- (BOOL)supportsHours;
- (BOOL)supportsInlineMap;
- (BOOL)supportsInlinePOIMap;
- (BOOL)supportsInlineRatings;
- (BOOL)supportsInlineReportAnIssue;
- (BOOL)supportsMessageHours;
- (BOOL)supportsMessagesForBusiness;
- (BOOL)supportsPhotoOnlyDataCollection;
- (BOOL)supportsPhotoSlider;
- (BOOL)supportsPlaceAttribution;
- (BOOL)supportsPlaceDescription;
- (BOOL)supportsPlaceEnrichment;
- (BOOL)supportsPlaceNotes;
- (BOOL)supportsRelatedPlaces;
- (BOOL)supportsReportAnIssue;
- (BOOL)supportsReportsInReview;
- (BOOL)supportsSharing;
- (BOOL)supportsShowingCoordinates;
- (BOOL)supportsVenueTextInfo;
- (BOOL)supportsWebContent;
- (MUPlaceDataAvailability)initWithMapItem:(id)a3 options:(unint64_t)a4;
@end

@implementation MUPlaceDataAvailability

- (MUPlaceDataAvailability)initWithMapItem:(id)a3 options:(unint64_t)a4
{
  id v7 = a3;
  v11.receiver = self;
  v11.super_class = (Class)MUPlaceDataAvailability;
  v8 = [(MUPlaceDataAvailability *)&v11 init];
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_mapItem, a3);
    v9->_placeCardOptions = a4;
    v9->_myPlacesEnabled = MapsFeature_IsEnabled_MyPlacesFeatures();
    v9->_hikingIOSEnabled = MapsFeature_IsEnabled_HikingiOS();
  }

  return v9;
}

- (BOOL)supportsPhotoSlider
{
  v3 = self->_mapItem;
  v4 = [(MKMapItem *)v3 place];
  v5 = [v4 firstBusiness];
  if ([v5 photosCount])
  {
    char v6 = 1;
  }
  else
  {
    id v7 = [(MKMapItem *)v3 _geoMapItem];
    char v6 = [v7 _hasCaptionedPhotoAlbum];
  }
  if (MapKitIdiomIsMacCatalyst())
  {
    unint64_t placeCardOptions = self->_placeCardOptions;
    char v9 = [(MKMapItem *)v3 _hasLookAroundStorefront];
    if ((placeCardOptions & 0x2000000) != 0) {
      char v10 = 0;
    }
    else {
      char v10 = v9;
    }
    v6 |= v10;
  }

  return v6;
}

- (BOOL)supportsAmenities
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  v2 = [(MKMapItem *)self->_mapItem _amenities];
  uint64_t v3 = [v2 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v11;
    while (2)
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v11 != v5) {
          objc_enumerationMutation(v2);
        }
        id v7 = *(void **)(*((void *)&v10 + 1) + 8 * i);
        if (![v7 isApplePayAmenity] || (objc_msgSend(v7, "isAmenityPresent") & 1) != 0)
        {
          BOOL v8 = 1;
          goto LABEL_13;
        }
      }
      uint64_t v4 = [v2 countByEnumeratingWithState:&v10 objects:v14 count:16];
      BOOL v8 = 0;
      if (v4) {
        continue;
      }
      break;
    }
  }
  else
  {
    BOOL v8 = 0;
  }
LABEL_13:

  return v8;
}

- (BOOL)supportsRelatedPlaces
{
  if ((self->_placeCardOptions & 0x4000000) != 0) {
    return 0;
  }
  v2 = [(MKMapItem *)self->_mapItem _relatedPlaceLists];
  BOOL v3 = [v2 count] != 0;

  return v3;
}

- (BOOL)supportsHeaderContainment
{
  v2 = [(MKMapItem *)self->_mapItem _geoMapItem];
  BOOL v3 = [v2 _containedPlace];
  uint64_t v4 = [v3 parent];
  BOOL v5 = v4 != 0;

  return v5;
}

- (BOOL)suportsOfficialApp
{
  if ((self->_placeCardOptions & 0x20) == 0) {
    return 0;
  }
  BOOL v3 = [(MKMapItem *)self->_mapItem _preferedAppAdamID];
  BOOL v2 = v3 != 0;

  return v2;
}

- (BOOL)supportsHours
{
  BOOL v2 = self->_mapItem;
  BOOL v3 = [(MKMapItem *)v2 timeZone];

  if (v3) {
    LOBYTE(v3) = ([(MKMapItem *)v2 _isMapItemTypeBrand] & 1) == 0
  }
              && ([(MKMapItem *)v2 _businessHours],
                  uint64_t v4 = objc_claimAutoreleasedReturnValue(),
                  uint64_t v5 = [v4 count],
                  v4,
                  v5);

  return (char)v3;
}

- (BOOL)supportsCuratedGuidesCarousel
{
  if ((self->_placeCardOptions & 0x40000000) == 0) {
    return 0;
  }
  BOOL v3 = [(MKMapItem *)self->_mapItem _placeCollections];
  BOOL v2 = [v3 count] != 0;

  return v2;
}

- (BOOL)supportsEncyclopedicDescription
{
  BOOL v2 = [(MKMapItem *)self->_mapItem _encyclopedicInfo];
  char v3 = [v2 hasTextBlock];

  return v3;
}

- (BOOL)supportsWebContent
{
  return (BYTE3(self->_placeCardOptions) >> 5) & 1;
}

- (BOOL)supportsVenueTextInfo
{
  if (![(MKMapItem *)self->_mapItem _hasVenueFeatureType]
    || [(MKMapItem *)self->_mapItem _venueFeatureType] != 2)
  {
    return 0;
  }
  char v3 = [(MKMapItem *)self->_mapItem _venueInfo];
  uint64_t v4 = [v3 contents];
  uint64_t v5 = [v4 items];
  BOOL v6 = [v5 count] != 0;

  return v6;
}

- (BOOL)supportsAnnotatedPhotos
{
  BOOL v2 = [(MKMapItem *)self->_mapItem _annotatedItemList];
  BOOL v3 = displayStyleForAnnotatedItemList() == 1;

  return v3;
}

- (BOOL)supportsAnnotatedTextList
{
  BOOL v2 = [(MKMapItem *)self->_mapItem _annotatedItemList];
  BOOL v3 = displayStyleForAnnotatedItemList() == 2;

  return v3;
}

- (BOOL)_hasAppleRatingsCategories
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  BOOL v2 = [(MKMapItem *)self->_mapItem _geoMapItem];
  BOOL v3 = [v2 _appleRatings];

  uint64_t v4 = [v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
  if (v4)
  {
    uint64_t v5 = *(void *)v9;
    while (2)
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v9 != v5) {
          objc_enumerationMutation(v3);
        }
        if ([*(id *)(*((void *)&v8 + 1) + 8 * i) ratingType] == 1)
        {
          LOBYTE(v4) = 1;
          goto LABEL_11;
        }
      }
      uint64_t v4 = [v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
      if (v4) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return v4;
}

- (BOOL)shouldShowRatingsAndReviewsModule
{
  BOOL v3 = [(MUPlaceDataAvailability *)self supportsAppleRatings];
  if (v3 && [(MUPlaceDataAvailability *)self _hasAppleRatingsCategories]) {
    return 1;
  }
  uint64_t v5 = [(MKMapItem *)self->_mapItem _reviews];
  uint64_t v6 = [v5 count];

  int v7 = [(MKMapItem *)self->_mapItem _hasUserRatingScore];
  long long v8 = [(MKMapItem *)self->_mapItem _geoMapItem];
  char v9 = [v8 _hasPlaceCollectionPullQuotes];

  long long v10 = [(MKMapItem *)self->_mapItem _tips];
  uint64_t v11 = [v10 count];

  BOOL result = 1;
  if ((v3 | v7 ^ 1) == 1)
  {
    if (v11) {
      BOOL v12 = 1;
    }
    else {
      BOOL v12 = v9;
    }
    return v6 || v12;
  }
  return result;
}

- (BOOL)supportsAppleRatings
{
  return [MEMORY[0x1E4F30F78] shouldShowAppleRatingsForMapItem:self->_mapItem];
}

- (BOOL)supportsBrowseCategory
{
  int v3 = [(MKMapItem *)self->_mapItem _browseCategory_isVenueItem];
  mapItem = self->_mapItem;
  if (!v3)
  {
    int v5 = [(MKMapItem *)mapItem _browseCategory_canDisplayBrowseCategoriesForPlace];
    if (!v5) {
      return v5;
    }
    return (BYTE2(self->_placeCardOptions) >> 1) & 1;
  }
  if ([(MKMapItem *)mapItem _browseCategory_canDisplayBrowseCategoriesForVenue])return (BYTE2(self->_placeCardOptions) >> 1) & 1; {
  LOBYTE(v5) = 0;
  }
  return v5;
}

- (BOOL)supportsPlaceAttribution
{
  if ((GEOConfigGetBOOL() & 1) != 0
    || ![(MKMapItem *)self->_mapItem _needsAttribution])
  {
    return 0;
  }
  int v3 = [(MKMapItem *)self->_mapItem _attribution];
  uint64_t v4 = [v3 attributionURLs];
  BOOL v5 = [v4 count] != 0;

  return v5;
}

- (BOOL)supportsInlineMap
{
  if ((self->_placeCardOptions & 1) != 0
    || ([(MKMapItem *)self->_mapItem _isMapItemTypeBrand] & 1) != 0)
  {
    return 0;
  }
  [(MKMapItem *)self->_mapItem _coordinate];
  BOOL v6 = v5 >= -180.0;
  if (v5 > 180.0) {
    BOOL v6 = 0;
  }
  if (v4 < -90.0) {
    BOOL v6 = 0;
  }
  return v4 <= 90.0 && v6;
}

- (BOOL)supportsInlinePOIMap
{
  if (self->_placeCardOptions)
  {
    LOBYTE(v3) = 0;
  }
  else
  {
    int v3 = [(MKMapItem *)self->_mapItem _isMapItemTypeBrand];
    if (v3) {
      LOBYTE(v3) = [(MKMapItem *)self->_mapItem _isStandAloneBrand] ^ 1;
    }
  }
  return v3;
}

- (BOOL)isTransitItem
{
  return [(MKMapItem *)self->_mapItem _isMapItemTypeTransit];
}

- (BOOL)allowTransitLineSelection
{
  return BYTE1(self->_placeCardOptions) & 1;
}

- (BOOL)hasRatingsOrReviews
{
  int v3 = [(MKMapItem *)self->_mapItem _reviews];
  uint64_t v4 = [v3 count];

  BOOL result = [(MKMapItem *)self->_mapItem _hasUserRatingScore];
  if (v4) {
    return 1;
  }
  return result;
}

- (BOOL)supportsReportAnIssue
{
  if ((self->_placeCardOptions & 0x40) != 0) {
    return 0;
  }
  else {
    return _MKRAPIsAvailable();
  }
}

- (BOOL)supportsInlineReportAnIssue
{
  if ((self->_placeCardOptions & 0x400000000) != 0
    || !MapsFeature_IsEnabled_RAPSydney()
    || (self->_placeCardOptions & 0x20000000) == 0
    || ![(MUPlaceDataAvailability *)self supportsReportAnIssue])
  {
    return 0;
  }
  mapItem = self->_mapItem;
  return [(MKMapItem *)mapItem _isMapItemTypeBusiness];
}

- (BOOL)supportsReportsInReview
{
  if ((self->_placeCardOptions & 0x400000000) != 0
    || !MapsFeature_IsEnabled_RAPSydney()
    || (self->_placeCardOptions & 0x20000000) == 0)
  {
    return 0;
  }
  return [(MUPlaceDataAvailability *)self supportsReportAnIssue];
}

- (BOOL)supportsShowingCoordinates
{
  BOOL v2 = self->_mapItem;
  int v3 = [(MKMapItem *)v2 _geoMapItem];
  int v4 = [v3 _placeType];

  if (v4 != 5 && v4 != 10)
  {
    BOOL v6 = (void *)MEMORY[0x1E4F64670];
    int v7 = [(MKMapItem *)v2 _geoMapItem];
    [v7 coordinate];
    if (objc_msgSend(v6, "isLocationShiftRequiredForCoordinate:"))
    {
    }
    else
    {
      long long v8 = [(MKMapItem *)v2 _geoMapItem];
      int v9 = [v8 referenceFrame];

      if (v9 != 2)
      {
        BOOL v12 = [(MKMapItem *)v2 _geoMapItem];
        [v12 coordinate];
        CLLocationDegrees v14 = v13;
        CLLocationDegrees v16 = v15;

        CLLocationCoordinate2D v17 = CLLocationCoordinate2DMake(v14, v16);
        BOOL v10 = CLLocationCoordinate2DIsValid(v17);
        goto LABEL_9;
      }
    }
  }
  BOOL v10 = 0;
LABEL_9:

  return v10;
}

- (BOOL)supportsMessageHours
{
  BOOL v2 = self->_mapItem;
  int v3 = [(MKMapItem *)v2 _geoMapItem];
  int v4 = [v3 _messageLink];
  double v5 = [v4 timeZone];

  if (!v5) {
    goto LABEL_6;
  }
  if (![(MKMapItem *)v2 _isMapItemTypeBrand]) {
    goto LABEL_6;
  }
  uint64_t v6 = [(MKMapItem *)v2 _messageBusinessHours];
  if (!v6) {
    goto LABEL_6;
  }
  int v7 = (void *)v6;
  long long v8 = [(MKMapItem *)v2 _geoMapItem];
  int v9 = [v8 _messageLink];
  BOOL v10 = [v9 timeZone];

  if (v10) {
    BOOL v11 = 1;
  }
  else {
LABEL_6:
  }
    BOOL v11 = 0;

  return v11;
}

- (BOOL)supportsPlaceDescription
{
  BOOL v2 = [(MKMapItem *)self->_mapItem _geoMapItem];
  char v3 = [v2 _hasPlaceDescription];

  return v3;
}

- (BOOL)supportsCallToAction
{
  return [MEMORY[0x1E4F30F78] shouldShowCallToActionForMapItem:self->_mapItem options:self->_placeCardOptions];
}

- (BOOL)supportsAddingPhotos
{
  return [MEMORY[0x1E4F30F78] shouldShowPhotosCallToActionForMapItem:self->_mapItem];
}

- (BOOL)supportsPhotoOnlyDataCollection
{
  BOOL v2 = [(MKMapItem *)self->_mapItem _geoMapItem];
  char v3 = [v2 _placeQuestionnaire];

  if ([v3 canCollectRatings]) {
    char v4 = 0;
  }
  else {
    char v4 = [v3 canCollectPhotos];
  }

  return v4;
}

- (BOOL)showEditAddressForHome
{
  if (self->_myPlacesEnabled) {
    LOBYTE(v2) = 0;
  }
  else {
    return (BYTE2(self->_placeCardOptions) >> 3) & 1;
  }
  return v2;
}

- (BOOL)supportsPlaceEnrichment
{
  char v3 = [(MKMapItem *)self->_mapItem _enrichmentInfo];
  BOOL result = 0;
  if (v3)
  {
    unint64_t placeCardOptions = self->_placeCardOptions;

    if ((placeCardOptions & 0x20000000) != 0) {
      return 1;
    }
  }
  return result;
}

- (BOOL)canShowDirections
{
  if ((self->_placeCardOptions & 8) != 0) {
    return 0;
  }
  else {
    return [(MKMapItem *)self->_mapItem _canGetDirections];
  }
}

- (BOOL)supportsInlineRatings
{
  int IsEnabled_SydneyARP = MapsFeature_IsEnabled_SydneyARP();
  if (IsEnabled_SydneyARP)
  {
    int IsEnabled_SydneyARP = GEOConfigGetBOOL();
    if (IsEnabled_SydneyARP)
    {
      char v4 = [(MKMapItem *)self->_mapItem _geoMapItem];
      int v5 = [v4 _hasUserRatingScore];

      uint64_t v6 = [(MKMapItem *)self->_mapItem _geoMapItem];
      int v7 = [v6 _hasAppleRatings];

      if (!v5 || v7)
      {
        int IsEnabled_SydneyARP = [(MUPlaceDataAvailability *)self supportsCallToAction];
        if (IsEnabled_SydneyARP) {
          LOBYTE(IsEnabled_SydneyARP) = ![(MUPlaceDataAvailability *)self supportsPhotoOnlyDataCollection];
        }
      }
      else
      {
        LOBYTE(IsEnabled_SydneyARP) = 0;
      }
    }
  }
  return IsEnabled_SydneyARP;
}

- (BOOL)supportsSharing
{
  return [(MKMapItem *)self->_mapItem _isMapItemTypeBrand] ^ 1;
}

- (BOOL)supportsMessagesForBusiness
{
  BOOL v2 = [(MKMapItem *)self->_mapItem _messageURLString];
  BOOL v3 = [v2 length] != 0;

  return v3;
}

- (BOOL)supportsEVCharging
{
  if (!MapsFeature_IsEnabled_RealTimeEVCharger()) {
    return 0;
  }
  BOOL v3 = [(MKMapItem *)self->_mapItem _geoMapItem];
  char v4 = [v3 _evCharger];
  int v5 = [v4 plugs];

  BOOL v6 = [v5 count] != 0;
  return v6;
}

- (BOOL)supportsHikingTrails
{
  BOOL v2 = [(MKMapItem *)self->_mapItem _trailHead];
  BOOL v3 = [v2 trails];
  BOOL v4 = v3 != 0;

  return v4;
}

- (BOOL)supportsHikingTip
{
  return self->_hikingIOSEnabled;
}

- (BOOL)supportsPlaceNotes
{
  return self->_myPlacesEnabled && +[MapsUIUtilities isMapsProcess];
}

- (BOOL)isRouteCreationAvailable
{
  if (self->_hikingIOSEnabled) {
    return (BYTE5(self->_placeCardOptions) >> 2) & 1;
  }
  else {
    LOBYTE(v2) = 0;
  }
  return v2;
}

- (void).cxx_destruct
{
}

@end