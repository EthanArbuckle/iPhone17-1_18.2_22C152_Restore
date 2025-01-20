@interface _GEOPlaceItem
- ($F24F406B2B787EFB06265DBA3D28CBD5)centerCoordinate;
- ($F24F406B2B787EFB06265DBA3D28CBD5)coordinate;
- (BOOL)_hasAnyAmenities;
- (BOOL)_hasAreaInMeters;
- (BOOL)_hasBusinessClaim;
- (BOOL)_hasCurrentOperatingHours;
- (BOOL)_hasEncyclopedicInfo;
- (BOOL)_hasFeatureLink;
- (BOOL)_hasFlyover;
- (BOOL)_hasLocalizedCategoryNamesForType:(unsigned int)a3;
- (BOOL)_hasMUID;
- (BOOL)_hasOperatingHours;
- (BOOL)_hasPriceRange;
- (BOOL)_hasResolvablePartialInformation;
- (BOOL)_hasResultProviderID;
- (BOOL)_hasTelephone;
- (BOOL)_hasTransit;
- (BOOL)_hasTravelTimeForTransportType:(int)a3;
- (BOOL)_hasUserRatingScore;
- (BOOL)_needsAttribution;
- (BOOL)_optsOutOfTelephoneAds;
- (BOOL)_responseStatusIsIncomplete;
- (BOOL)contactIsMe;
- (BOOL)hasExpiredComponents;
- (BOOL)isDisputed;
- (BOOL)isEqualToMapItem:(id)a3;
- (BOOL)isEventAllDay;
- (BOOL)isValid;
- (GEOAddress)geoAddress;
- (GEOAssociatedApp)_associatedApp;
- (GEOEncyclopedicInfo)_encyclopedicInfo;
- (GEOFeatureStyleAttributes)_styleAttributes;
- (GEOMapItemClientAttributes)_clientAttributes;
- (GEOMapItemDetourInfo)detourInfo;
- (GEOMapItemIdentifier)_identifier;
- (GEOMapItemPhotosAttribution)_photosAttribution;
- (GEOMapItemPlaceAttribution)_attribution;
- (GEOMapItemReviewsAttribution)_reviewsAttribution;
- (GEOMapItemTransitInfo)_transitInfo;
- (GEOMapRegion)displayMapRegion;
- (GEOMapRegion)displayMapRegionOrNil;
- (GEOMessageLink)_messageLink;
- (GEOPDFlyover)_flyover;
- (GEOPDPlace)_placeData;
- (GEOPlace)_place;
- (GEOPlaceResult)_placeResult;
- (GEOPriceDescription)_priceDescription;
- (GEORestaurantFeaturesLink)_featureLink;
- (GEOTransitAttribution)_transitAttribution;
- (GEOTransitVehiclePosition)_transitVehiclePosition;
- (NSArray)_additionalPlaceInfos;
- (NSArray)_amenities;
- (NSArray)_photos;
- (NSArray)_placeCollections;
- (NSArray)_quickLinks;
- (NSArray)_relatedPlaceLists;
- (NSArray)_reviews;
- (NSArray)_roadAccessPoints;
- (NSArray)_searchResultPhotoCarousel;
- (NSArray)_secondaryQuickLinks;
- (NSArray)_tips;
- (NSArray)areasOfInterest;
- (NSArray)spatialMappedCategories;
- (NSData)_placeDataAsData;
- (NSData)encodedData;
- (NSData)externalTransitStationCode;
- (NSDate)eventDate;
- (NSDictionary)addressDictionary;
- (NSString)_businessURL;
- (NSString)_disambiguationName;
- (NSString)_flyoverAnnouncementMessage;
- (NSString)_poiPinpointURLString;
- (NSString)_poiSurveyURLString;
- (NSString)_resultSnippetLocationString;
- (NSString)_telephone;
- (NSString)_vendorID;
- (NSString)contactName;
- (NSString)contactSpokenName;
- (NSString)description;
- (NSString)eventName;
- (NSString)name;
- (NSTimeZone)timezone;
- (NSURL)_providerURL;
- (NSURL)_webURL;
- (_GEOPlaceItem)initWithPlace:(id)a3;
- (_GEOPlaceItem)initWithPlaceResult:(id)a3;
- (double)_areaInMeters;
- (float)_normalizedUserRatingScore;
- (id)_arrivalMapRegionForTransportType:(int)a3;
- (id)_asPlaceInfo;
- (id)_businessClaim;
- (id)_localizedCategoryNamesForType:(unsigned int)a3;
- (id)_placecardLayoutConfiguration;
- (id)_relatedPlaceListForComponentIdentifier:(int)a3;
- (id)_spokenAddressForLocale:(id)a3;
- (id)_urlForPhotoWithUID:(id)a3;
- (id)_urlForReview:(id)a3;
- (id)_urlForWritingAReview;
- (id)_yelpID;
- (id)addressObject;
- (id)spokenNameForLocale:(id)a3;
- (id)weatherDisplayName;
- (int)_addressGeocodeAccuracy;
- (int)_parsecSectionType;
- (int)_placeType;
- (int)_recommendedTransportType;
- (int)_resultProviderID;
- (int)contactAddressType;
- (int)referenceFrame;
- (unint64_t)_customIconID;
- (unint64_t)_muid;
- (unint64_t)_openingHoursOptions;
- (unint64_t)hash;
- (unsigned)_priceRange;
- (unsigned)_resultSnippetDistanceDisplayThreshold;
- (unsigned)_sampleSizeForUserRatingScore;
- (unsigned)_travelDistanceForTransportType:(int)a3;
- (unsigned)_travelTimeForTransportType:(int)a3;
@end

@implementation _GEOPlaceItem

- ($F24F406B2B787EFB06265DBA3D28CBD5)coordinate
{
  [(GEOPlace *)self->_place coordinate];
  result.var1 = v3;
  result.var0 = v2;
  return result;
}

- (GEOFeatureStyleAttributes)_styleAttributes
{
  return 0;
}

- (GEOMapRegion)displayMapRegion
{
  BOOL v3 = [(GEOPlace *)self->_place hasMapRegion];
  place = self->_place;
  if (v3)
  {
    v5 = [(GEOPlace *)place mapRegion];
  }
  else
  {
    [(GEOPlace *)place coordinate];
    if (fabs(v7 + 180.0) >= 0.00000001 || fabs(v6 + 180.0) >= 0.00000001)
    {
      double v8 = GEOMapRectMakeWithRadialDistance(v6, v7, 10000.0);
      v5 = -[GEOMapRegion initWithMapRect:]([GEOMapRegion alloc], "initWithMapRect:", v8, v9, v10, v11);
    }
    else
    {
      v5 = 0;
    }
  }

  return v5;
}

- (_GEOPlaceItem)initWithPlace:(id)a3
{
  id v5 = a3;
  v12.receiver = self;
  v12.super_class = (Class)_GEOPlaceItem;
  double v6 = [(_GEOPlaceItem *)&v12 init];
  double v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_place, a3);
    uint64_t v8 = geo_isolater_create_with_format();
    lazyIvarIsolater = v7->_lazyIvarIsolater;
    v7->_lazyIvarIsolater = (geo_isolater *)v8;

    double v10 = v7;
  }

  return v7;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_addressObject, 0);
  objc_storeStrong((id *)&self->_lazyIvarIsolater, 0);
  objc_storeStrong((id *)&self->_place, 0);

  objc_storeStrong((id *)&self->_placeResult, 0);
}

- (NSDictionary)addressDictionary
{
  BOOL v3 = [(GEOPlace *)self->_place address];
  v4 = [v3 addressDictionary];

  id v5 = [v4 objectForKey:@"Name"];
  if (![v5 length])
  {
    double v6 = [(_GEOPlaceItem *)self name];
    if ([v6 length])
    {
      if (!v4)
      {
        v4 = [MEMORY[0x1E4F1CA60] dictionary];
      }
      [v4 setObject:v6 forKey:@"Name"];
    }
  }

  return (NSDictionary *)v4;
}

- (NSString)name
{
  return (NSString *)[(GEOPlace *)self->_place bestName];
}

- (BOOL)isValid
{
  return self->_place || self->_placeResult != 0;
}

- (GEOPlace)_place
{
  return self->_place;
}

- (GEOPDPlace)_placeData
{
  return 0;
}

- (GEOPlaceResult)_placeResult
{
  return self->_placeResult;
}

- (NSArray)areasOfInterest
{
  double v2 = [(GEOPlace *)self->_place address];
  BOOL v3 = [v2 structuredAddress];
  v4 = [v3 areaOfInterests];

  return (NSArray *)v4;
}

- (id)addressObject
{
  return self->_addressObject;
}

- (GEOMapItemIdentifier)_identifier
{
  return 0;
}

- (GEOAddress)geoAddress
{
  return [(GEOPlace *)self->_place address];
}

- (int)_placeType
{
  int v2 = [(GEOPlace *)self->_place type];

  return _MapItemPlaceTypeForPlaceType(v2);
}

- (int)_addressGeocodeAccuracy
{
  if (![(GEOPlace *)self->_place hasAddressGeocodeAccuracy]) {
    return -1;
  }
  int result = [(GEOPlace *)self->_place addressGeocodeAccuracy];
  if (result >= 6) {
    return -1;
  }
  return result;
}

- (int)referenceFrame
{
  return [(GEOPlace *)self->_place referenceFrame];
}

- (NSTimeZone)timezone
{
  id v3 = objc_alloc(MEMORY[0x1E4F1CAF0]);
  v4 = [(GEOPlace *)self->_place timezone];
  id v5 = -[GEOTimezone identifier](v4);
  double v6 = (void *)[v3 initWithName:v5];

  return (NSTimeZone *)v6;
}

- (_GEOPlaceItem)initWithPlaceResult:(id)a3
{
  id v5 = a3;
  v13.receiver = self;
  v13.super_class = (Class)_GEOPlaceItem;
  double v6 = [(_GEOPlaceItem *)&v13 init];
  if (v6)
  {
    uint64_t v7 = [v5 place];
    place = v6->_place;
    v6->_place = (GEOPlace *)v7;

    objc_storeStrong((id *)&v6->_placeResult, a3);
    uint64_t v9 = geo_isolater_create_with_format();
    lazyIvarIsolater = v6->_lazyIvarIsolater;
    v6->_lazyIvarIsolater = (geo_isolater *)v9;

    double v11 = v6;
  }

  return v6;
}

- (NSString)description
{
  id v3 = NSString;
  if (self->_placeResult)
  {
    v9.receiver = self;
    v9.super_class = (Class)_GEOPlaceItem;
    v4 = [(_GEOPlaceItem *)&v9 description];
    id v5 = [(GEOPlaceResult *)self->_placeResult formattedText];
    [v3 stringWithFormat:@"%@ PlaceResult: %@", v4, v5];
  }
  else
  {
    v8.receiver = self;
    v8.super_class = (Class)_GEOPlaceItem;
    v4 = [(_GEOPlaceItem *)&v8 description];
    id v5 = [(GEOPlace *)self->_place formattedText];
    [v3 stringWithFormat:@"%@ Place: %@", v4, v5];
  double v6 = };

  return (NSString *)v6;
}

- (unint64_t)hash
{
  return [(GEOPlace *)self->_place hash];
}

- (BOOL)isEqualToMapItem:(id)a3
{
  place = self->_place;
  v4 = [a3 _place];
  LOBYTE(place) = [(GEOPlace *)place isEqual:v4];

  return (char)place;
}

- (id)spokenNameForLocale:(id)a3
{
  return [(GEOPlace *)self->_place spokenName];
}

- (NSData)encodedData
{
  if (self->_placeResult) {
    placeResult = self->_placeResult;
  }
  else {
    placeResult = self->_place;
  }
  id v3 = [placeResult data];

  return (NSData *)v3;
}

- (BOOL)isDisputed
{
  return [(GEOPlace *)self->_place isDisputed];
}

- ($F24F406B2B787EFB06265DBA3D28CBD5)centerCoordinate
{
  if ([(GEOPlace *)self->_place hasCenter])
  {
    id v3 = [(GEOPlace *)self->_place center];
    [v3 coordinate];
    unint64_t v5 = v4;
    unint64_t v7 = v6;
  }
  else
  {
    unint64_t v7 = 0xC066800000000000;
    unint64_t v5 = 0xC066800000000000;
  }
  double v8 = *(double *)&v5;
  double v9 = *(double *)&v7;
  result.var1 = v9;
  result.var0 = v8;
  return result;
}

- (GEOMapRegion)displayMapRegionOrNil
{
  if ([(GEOPlace *)self->_place hasMapRegion])
  {
    id v3 = [(GEOPlace *)self->_place mapRegion];
  }
  else
  {
    id v3 = 0;
  }

  return (GEOMapRegion *)v3;
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

- (BOOL)_hasResolvablePartialInformation
{
  return 0;
}

- (BOOL)_responseStatusIsIncomplete
{
  return 0;
}

- (GEOMapItemClientAttributes)_clientAttributes
{
  return 0;
}

- (NSData)_placeDataAsData
{
  return 0;
}

- (NSArray)_tips
{
  return 0;
}

- (BOOL)hasExpiredComponents
{
  return 0;
}

- (id)weatherDisplayName
{
  int v2 = [(_GEOPlaceItem *)self addressObject];
  id v3 = [v2 weatherDisplayName];

  return v3;
}

- (NSData)externalTransitStationCode
{
  return 0;
}

- (id)_spokenAddressForLocale:(id)a3
{
  return [(GEOPlace *)self->_place spokenAddress];
}

- (int)_recommendedTransportType
{
  return 4;
}

- (BOOL)_hasTravelTimeForTransportType:(int)a3
{
  return [(GEOPlaceResult *)self->_placeResult hasTravelTime];
}

- (unsigned)_travelTimeForTransportType:(int)a3
{
  unsigned int result = [(GEOPlaceResult *)self->_placeResult hasTravelTime];
  if (result)
  {
    placeResult = self->_placeResult;
    return [(GEOPlaceResult *)placeResult travelTime];
  }
  return result;
}

- (unsigned)_travelDistanceForTransportType:(int)a3
{
  unsigned int result = [(GEOPlaceResult *)self->_placeResult hasTravelDistance];
  if (result)
  {
    placeResult = self->_placeResult;
    return [(GEOPlaceResult *)placeResult travelDistance];
  }
  return result;
}

- (id)_arrivalMapRegionForTransportType:(int)a3
{
  return [(GEOPlace *)self->_place arrivalMapRegionForTransportType:*(void *)&a3];
}

- (NSArray)_roadAccessPoints
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  if ([(GEOPlace *)self->_place entryPointsCount])
  {
    id v3 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", -[GEOPlace entryPointsCount](self->_place, "entryPointsCount"));
    long long v12 = 0u;
    long long v13 = 0u;
    long long v14 = 0u;
    long long v15 = 0u;
    unint64_t v4 = [(GEOPlace *)self->_place entryPoints];
    uint64_t v5 = [v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
    if (v5)
    {
      uint64_t v6 = v5;
      uint64_t v7 = *(void *)v13;
      do
      {
        for (uint64_t i = 0; i != v6; ++i)
        {
          if (*(void *)v13 != v7) {
            objc_enumerationMutation(v4);
          }
          uint64_t v9 = *(void *)(*((void *)&v12 + 1) + 8 * i);
          double v10 = objc_alloc_init(GEORoadAccessPoint);
          [(GEORoadAccessPoint *)v10 setLocation:v9];
          [(GEORoadAccessPoint *)v10 setDrivingDirection:1];
          [(GEORoadAccessPoint *)v10 setWalkingDirection:1];
          [v3 addObject:v10];
        }
        uint64_t v6 = [v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
      }
      while (v6);
    }
  }
  else
  {
    id v3 = 0;
  }

  return (NSArray *)v3;
}

- (BOOL)_hasResultProviderID
{
  place = self->_place;
  if (place) {
    LOBYTE(place) = [(GEOPlace *)place hasLocalSearchProviderID];
  }
  return (char)place;
}

- (int)_resultProviderID
{
  place = self->_place;
  if (!place || ![(GEOPlace *)place hasLocalSearchProviderID]) {
    return 0;
  }
  unint64_t v4 = self->_place;

  return [(GEOPlace *)v4 localSearchProviderID];
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

- (GEOTransitVehiclePosition)_transitVehiclePosition
{
  return 0;
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

- (BOOL)_hasMUID
{
  return 0;
}

- (unint64_t)_muid
{
  return 0;
}

- (BOOL)_hasAreaInMeters
{
  return [(GEOPlace *)self->_place hasArea];
}

- (double)_areaInMeters
{
  [(GEOPlace *)self->_place area];
  return result;
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

- (NSString)_resultSnippetLocationString
{
  return 0;
}

- (unsigned)_resultSnippetDistanceDisplayThreshold
{
  return -1;
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

- (BOOL)_hasTelephone
{
  return 0;
}

- (BOOL)_optsOutOfTelephoneAds
{
  return 0;
}

- (NSString)_telephone
{
  return 0;
}

- (NSString)_disambiguationName
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

- (id)_yelpID
{
  return 0;
}

- (GEOMapItemPlaceAttribution)_attribution
{
  return 0;
}

- (GEOMapItemPhotosAttribution)_photosAttribution
{
  return 0;
}

- (GEOMapItemReviewsAttribution)_reviewsAttribution
{
  return 0;
}

- (unint64_t)_customIconID
{
  return 0;
}

- (NSArray)_additionalPlaceInfos
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  if ([(GEOPlaceResult *)self->_placeResult additionalPlacesCount])
  {
    id v3 = [(GEOPlaceResult *)self->_placeResult additionalPlaces];

    if (v3)
    {
      id v3 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", -[GEOPlaceResult additionalPlacesCount](self->_placeResult, "additionalPlacesCount"));
      long long v11 = 0u;
      long long v12 = 0u;
      long long v13 = 0u;
      long long v14 = 0u;
      unint64_t v4 = [(GEOPlaceResult *)self->_placeResult additionalPlaces];
      uint64_t v5 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
      if (v5)
      {
        uint64_t v6 = v5;
        uint64_t v7 = *(void *)v12;
        do
        {
          for (uint64_t i = 0; i != v6; ++i)
          {
            if (*(void *)v12 != v7) {
              objc_enumerationMutation(v4);
            }
            uint64_t v9 = [[GEOMapItemAdditionalPlaceInfo alloc] initWithPlace:*(void *)(*((void *)&v11 + 1) + 8 * i)];
            [v3 addObject:v9];
          }
          uint64_t v6 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
        }
        while (v6);
      }
    }
  }
  else
  {
    id v3 = 0;
  }

  return (NSArray *)v3;
}

- (id)_asPlaceInfo
{
  if (self->_place) {
    int v2 = [[GEOMapItemAdditionalPlaceInfo alloc] initWithPlace:self->_place];
  }
  else {
    int v2 = 0;
  }

  return v2;
}

- (NSArray)_reviews
{
  return 0;
}

- (NSArray)_photos
{
  return 0;
}

- (BOOL)_hasBusinessClaim
{
  return 0;
}

- (id)_businessClaim
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

- (NSArray)_placeCollections
{
  return 0;
}

- (NSArray)_searchResultPhotoCarousel
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

- (id)_placecardLayoutConfiguration
{
  return 0;
}

- (GEOMapItemDetourInfo)detourInfo
{
  return 0;
}

- (GEOAssociatedApp)_associatedApp
{
  return 0;
}

- (int)_parsecSectionType
{
  return 0;
}

- (GEOPriceDescription)_priceDescription
{
  return 0;
}

@end