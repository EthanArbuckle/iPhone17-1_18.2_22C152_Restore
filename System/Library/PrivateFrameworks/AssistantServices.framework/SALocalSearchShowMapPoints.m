@interface SALocalSearchShowMapPoints
- (id)_ad_transformedMapsRequest;
- (id)_ad_transformedMapsSuccessResponse;
@end

@implementation SALocalSearchShowMapPoints

- (id)_ad_transformedMapsSuccessResponse
{
  id v2 = objc_alloc_init((Class)SALocalSearchShowMapPointsCompleted);
  return v2;
}

- (id)_ad_transformedMapsRequest
{
  if ([(SALocalSearchShowMapPoints *)self showDirections])
  {
    id v3 = objc_alloc_init((Class)STSiriLocation);
    id v4 = objc_alloc_init((Class)STSiriLocation);
    v5 = [(SALocalSearchShowMapPoints *)self itemSource];
    v6 = [v5 placeData2];
    [v3 setGeoResult:v6];

    v7 = [(SALocalSearchShowMapPoints *)self itemDestination];
    v8 = [v7 placeData2];
    [v4 setGeoResult:v8];

    v9 = [(SALocalSearchShowMapPoints *)self itemSource];
    v10 = [v9 detailType];
    uint64_t v11 = SALocalSearchMapItemMapItemTypeCURRENT_LOCATIONValue;
    unsigned int v12 = [v10 isEqualToString:SALocalSearchMapItemMapItemTypeCURRENT_LOCATIONValue];

    if (v12) {
      uint64_t v13 = 4;
    }
    else {
      uint64_t v13 = 1;
    }
    [v3 setResultType:v13];
    v14 = [(SALocalSearchShowMapPoints *)self itemDestination];
    v15 = [v14 detailType];
    unsigned int v16 = [v15 isEqualToString:v11];

    if (v16) {
      uint64_t v17 = 4;
    }
    else {
      uint64_t v17 = 1;
    }
    [v4 setResultType:v17];
    v18 = [(SALocalSearchShowMapPoints *)self directionsType];
    unsigned __int8 v19 = [v18 isEqualToString:SALocalSearchDirectionsTypeByCarValue];

    if (v19)
    {
      uint64_t v20 = 1;
    }
    else
    {
      v26 = [(SALocalSearchShowMapPoints *)self directionsType];
      unsigned __int8 v27 = [v26 isEqualToString:SALocalSearchDirectionsTypeByPublicTransitValue];

      if (v27)
      {
        uint64_t v20 = 2;
      }
      else
      {
        v28 = [(SALocalSearchShowMapPoints *)self directionsType];
        unsigned __int8 v29 = [v28 isEqualToString:SALocalSearchDirectionsTypeWalkingValue];

        if (v29)
        {
          uint64_t v20 = 3;
        }
        else
        {
          v30 = [(SALocalSearchShowMapPoints *)self directionsType];
          unsigned int v31 = [v30 isEqualToString:SALocalSearchDirectionsTypeBikingValue];

          uint64_t v20 = 4;
          if (!v31) {
            uint64_t v20 = 0;
          }
        }
      }
    }
    uint64_t v40 = v20;
    id v32 = objc_alloc((Class)STStartNavigationRequest);
    v33 = [(SALocalSearchShowMapPoints *)self arrivalDate];
    v34 = [(SALocalSearchShowMapPoints *)self departureDate];
    v35 = [(SALocalSearchShowMapPoints *)self itemSource];
    v36 = [v35 extSessionGuid];
    v37 = [(SALocalSearchShowMapPoints *)self itemSource];
    v38 = [v37 extSessionGuidCreatedTimestamp];
    id v25 = [v32 _initWithStartLocation:v3 destinationLocation:v4 directionsType:v40 arrivalDate:v33 departureDate:v34 extSessionGuid:v36 extSessionGuidCreatedTimestamp:v38];
  }
  else
  {
    id v3 = [(SALocalSearchShowMapPoints *)self itemSource];
    id v21 = objc_alloc((Class)STShowMapPointRequest);
    v22 = [v3 placeData2];
    v23 = [v3 extSessionGuid];
    v24 = [v3 extSessionGuidCreatedTimestamp];
    id v25 = [v21 _initWithPlaceData:v22 extSessionGuid:v23 extSessionGuidCreatedTimestamp:v24];

    id v4 = [v3 detailType];
    objc_msgSend(v25, "setIsCurrentLocation:", objc_msgSend(v4, "isEqualToString:", SALocalSearchMapItemMapItemTypeCURRENT_LOCATIONValue));
  }

  return v25;
}

@end