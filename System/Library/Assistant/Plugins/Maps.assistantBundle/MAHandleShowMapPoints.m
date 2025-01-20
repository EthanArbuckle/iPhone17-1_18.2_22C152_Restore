@interface MAHandleShowMapPoints
+ (void)initialize;
- (BOOL)_isDoNotDisturbWhileDrivingHoldingCoverSheet;
- (BOOL)_shouldLaunchIntoNav;
- (BOOL)_shouldUseBackgroundNavigationWithServiceHelper:(id)a3;
- (BOOL)_shouldUseSerializedURLWithOptions:(id)a3;
- (id)_mapKitLaunchOptionsWithServiceHelper:(id)a3;
- (void)_captureUserAction:(int)a3 details:(id)a4;
- (void)_extractAndSetSessionEntityFromSALocalSearchMapItem:(id)a3;
- (void)_launchBackgroundNavigationWithURL:(id)a3 serviceHelper:(id)a4 completion:(id)a5;
- (void)_launchMapsWithURL:(id)a3 serviceHelper:(id)a4 placeActionDetails:(id)a5 completion:(id)a6;
- (void)_performWithServiceHelper:(id)a3 completion:(id)a4;
- (void)performWithCompletion:(id)a3 serviceHelper:(id)a4;
@end

@implementation MAHandleShowMapPoints

+ (void)initialize
{
  id v2 = +[MapsCarPlayExternalDeviceMonitor sharedInstance];
}

- (BOOL)_shouldLaunchIntoNav
{
  if ([(MAHandleShowMapPoints *)self suppressNavigation]) {
    return 0;
  }
  v3 = [(MAHandleShowMapPoints *)self itemSource];
  unsigned int v4 = [v3 isCurrentLocation];

  if (!v4) {
    return 0;
  }
  unsigned int v5 = [(MAHandleShowMapPoints *)self showDirections];
  if (v5)
  {
    v3 = [(MAHandleShowMapPoints *)self directionsType];
    if (!v3)
    {
      unsigned __int8 v7 = 1;
LABEL_10:

      return v7;
    }
  }
  v6 = [(MAHandleShowMapPoints *)self directionsType];
  unsigned __int8 v7 = [v6 isEqualToString:SALocalSearchDirectionsTypeByCarValue];

  if (v5) {
    goto LABEL_10;
  }
  return v7;
}

- (BOOL)_isDoNotDisturbWhileDrivingHoldingCoverSheet
{
  if (!+[CARAutomaticDNDStatus isAutomaticDNDAvailable])return 0; {
  if (!self->_carDnDStatus)
  }
  {
    v3 = (CARAutomaticDNDStatus *)objc_alloc_init((Class)CARAutomaticDNDStatus);
    carDnDStatus = self->_carDnDStatus;
    self->_carDnDStatus = v3;
  }
  uint64_t v27 = 0;
  v28 = &v27;
  uint64_t v29 = 0x2020000000;
  char v30 = 0;
  unsigned int v5 = dispatch_group_create();
  dispatch_group_enter(v5);
  BackgroundStateLog(OS_LOG_TYPE_INFO, @"MAPS SIRI: Fetching do-not-disturb-while-driving status with %@ second timeout", v6, v7, v8, v9, v10, v11, (uint64_t)&off_49D68);
  v12 = self->_carDnDStatus;
  v24[0] = _NSConcreteStackBlock;
  v24[1] = 3221225472;
  v24[2] = sub_57A4;
  v24[3] = &unk_30880;
  v26 = &v27;
  v13 = v5;
  v25 = v13;
  [(CARAutomaticDNDStatus *)v12 fetchAutomaticDNDExitConfirmationWithReply:v24];
  dispatch_time_t v14 = dispatch_walltime(0, 2000000000);
  dispatch_group_wait(v13, v14);
  v15 = +[NSNumber numberWithBool:*((unsigned __int8 *)v28 + 24)];
  BackgroundStateLog(OS_LOG_TYPE_INFO, @"MAPS SIRI: Returning do-not-disturb-while-driving status %@", v16, v17, v18, v19, v20, v21, (uint64_t)v15);

  BOOL v22 = *((unsigned char *)v28 + 24) != 0;
  _Block_object_dispose(&v27, 8);
  return v22;
}

- (id)_mapKitLaunchOptionsWithServiceHelper:(id)a3
{
  id v4 = a3;
  unsigned int v5 = +[NSMutableDictionary dictionary];
  if (([(MAHandleShowMapPoints *)self showDirections] & 1) != 0
    || ([(MAHandleShowMapPoints *)self directionsType],
        uint64_t v6 = objc_claimAutoreleasedReturnValue(),
        v6,
        v6))
  {
    uint64_t v7 = [(MAHandleShowMapPoints *)self directionsType];
    if ([v7 isEqualToString:SALocalSearchDirectionsTypeByCarValue])
    {
      uint64_t v8 = (id *)&MKLaunchOptionsDirectionsModeDriving;
    }
    else if ([v7 isEqualToString:SALocalSearchDirectionsTypeWalkingValue])
    {
      uint64_t v8 = (id *)&MKLaunchOptionsDirectionsModeWalking;
    }
    else if ([v7 isEqualToString:SALocalSearchDirectionsTypeByPublicTransitValue])
    {
      uint64_t v8 = (id *)&MKLaunchOptionsDirectionsModeTransit;
    }
    else
    {
      unsigned int v9 = [v7 isEqualToString:SALocalSearchDirectionsTypeBikingValue];
      uint64_t v8 = (id *)&MKLaunchOptionsDirectionsModeDefault;
      if (v9) {
        uint64_t v8 = (id *)&MKLaunchOptionsDirectionsModeCycling;
      }
    }
    id v10 = *v8;
    [v5 setObject:v10 forKey:MKLaunchOptionsDirectionsModeKey];
    uint64_t v11 = [(MAHandleShowMapPoints *)self arrivalDate];

    if (v11)
    {
      id v12 = objc_alloc_init((Class)GEOURLTimePoint);
      [v12 setType:1];
      v13 = [(MAHandleShowMapPoints *)self arrivalDate];
    }
    else
    {
      dispatch_time_t v14 = [(MAHandleShowMapPoints *)self departureDate];

      if (!v14)
      {
LABEL_17:

        goto LABEL_18;
      }
      id v12 = objc_alloc_init((Class)GEOURLTimePoint);
      [v12 setType:0];
      v13 = [(MAHandleShowMapPoints *)self departureDate];
    }
    v15 = v13;
    [v13 timeIntervalSinceReferenceDate];
    objc_msgSend(v12, "setTime:");

    if (v12)
    {
      [v5 setObject:v12 forKeyedSubscript:MKLaunchOptionsTimePointKey];
    }
    goto LABEL_17;
  }
LABEL_18:
  if ([(MAHandleShowMapPoints *)self showTraffic])
  {
    uint64_t v16 = +[NSNumber numberWithBool:[(MAHandleShowMapPoints *)self showTraffic]];
    [v5 setObject:v16 forKey:MKLaunchOptionsShowsTrafficKey];
  }
  uint64_t v17 = [(MAHandleShowMapPoints *)self regionOfInterestRadiusInMiles];

  if (v17)
  {
    uint64_t v18 = [(MAHandleShowMapPoints *)self regionOfInterestRadiusInMiles];
    [v18 doubleValue];
    double v20 = v19 * 1609.344;

    uint64_t v21 = +[NSNumber numberWithDouble:v20];
    [v5 setObject:v21 forKey:MKLaunchOptionsMapRadiusInMetersKey];
  }
  BOOL v22 = [(MAHandleShowMapPoints *)self searchItems];
  v23 = [v22 selectedIndex];

  if (v23)
  {
    v24 = [(MAHandleShowMapPoints *)self searchItems];
    v25 = [v24 selectedIndex];
    [v5 setObject:v25 forKey:MKLaunchOptionsSelectedIndexKey];
  }
  if ([(MAHandleShowMapPoints *)self _shouldLaunchIntoNav]
    && ![(MAHandleShowMapPoints *)self _shouldUseBackgroundNavigationWithServiceHelper:v4])
  {
    [v5 setObject:&__kCFBooleanTrue forKey:MKLaunchOptionsLaunchIntoNavKey];
  }
  v26 = [(MAHandleShowMapPoints *)self carRouteOptions];
  unsigned int v27 = [v26 avoidHighways];

  v28 = [(MAHandleShowMapPoints *)self carRouteOptions];
  unsigned int v29 = [v28 avoidTolls];

  if (v27)
  {
    char v30 = +[NSNumber numberWithBool:1];
    [v5 setObject:v30 forKeyedSubscript:_MKLaunchOptionsRoutingAvoidHighwaysKey];
  }
  if (v29)
  {
    v31 = +[NSNumber numberWithBool:1];
    [v5 setObject:v31 forKeyedSubscript:_MKLaunchOptionsRoutingAvoidTollsKey];
  }
  if (([(MAHandleShowMapPoints *)self searchAlongRoute] & 1) != 0
    || (MapsFeature_IsEnabled_DrivingMultiWaypointRoutes() & 1) != 0
    || (MapsFeature_IsEnabled_Maps420() & 1) != 0)
  {
    uint64_t IsEnabled_Maps182 = 1;
  }
  else
  {
    uint64_t IsEnabled_Maps182 = MapsFeature_IsEnabled_Maps182();
  }
  v33 = +[NSNumber numberWithBool:IsEnabled_Maps182];
  [v5 setObject:v33 forKeyedSubscript:_MKLaunchOptionsSearchAlongRouteKey];

  return v5;
}

- (void)_launchBackgroundNavigationWithURL:(id)a3 serviceHelper:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  BackgroundStateLog(OS_LOG_TYPE_INFO, @"MAPS SIRI: Starting background navigation with URL: %@", v11, v12, v13, v14, v15, v16, (uint64_t)v8);
  uint64_t v17 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  uint64_t v18 = dispatch_queue_create("com.apple.Maps.launch", v17);

  v51[0] = 0;
  v51[1] = v51;
  v51[2] = 0x2020000000;
  char v52 = 0;
  v47[0] = _NSConcreteStackBlock;
  v47[1] = 3221225472;
  v47[2] = sub_5FC8;
  v47[3] = &unk_308A8;
  v50 = v51;
  v47[4] = self;
  id v19 = v9;
  id v48 = v19;
  id v20 = v10;
  id v49 = v20;
  uint64_t v21 = objc_retainBlock(v47);
  +[NSDate timeIntervalSinceReferenceDate];
  double v29 = 1.0;
  if (self->_startingTime - v28 + 9.0 >= 1.0)
  {
    +[NSDate timeIntervalSinceReferenceDate];
    double v29 = self->_startingTime - v30 + 9.0;
  }
  BackgroundStateLog(OS_LOG_TYPE_INFO, @"MAPS SIRI: Dispatching timeout guard for remaining %#.0fs of %#.0fs", v22, v23, v24, v25, v26, v27, *(uint64_t *)&v29);
  dispatch_time_t v31 = dispatch_time(0, 1000000000 * (unint64_t)v29);
  dispatch_after(v31, v18, v21);
  v32 = +[MapsSiriIPCInterface sharedInterface];
  [v32 initializeBrokerConnectionIfNeeded];
  v33 = objc_alloc_init(IPCLoadDirectionsMessage);
  [(IPCLoadDirectionsMessage *)v33 setUrl:v8];
  v39[0] = _NSConcreteStackBlock;
  v39[1] = 3221225472;
  v39[2] = sub_607C;
  v39[3] = &unk_30920;
  v34 = v18;
  v46 = v51;
  v40 = v34;
  v41 = self;
  id v35 = v19;
  id v42 = v35;
  id v36 = v20;
  id v45 = v36;
  id v37 = v32;
  id v43 = v37;
  v38 = v33;
  v44 = v38;
  [v37 loadDirections:v38 completion:v39];

  _Block_object_dispose(v51, 8);
}

- (void)_launchMapsWithURL:(id)a3 serviceHelper:(id)a4 placeActionDetails:(id)a5 completion:(id)a6
{
  id v24 = a3;
  id v10 = a4;
  id v11 = a5;
  uint64_t v12 = (void (**)(id, id, void))a6;
  if (v11)
  {
    if ([(MAHandleShowMapPoints *)self _shouldLaunchIntoNav])
    {
      [(MAHandleShowMapPoints *)self _captureUserAction:6003 details:v11];
      uint64_t v13 = 3001;
    }
    else
    {
      uint64_t v13 = 6003;
      if (([(MAHandleShowMapPoints *)self showDirections] & 1) == 0)
      {
        uint64_t v14 = [(MAHandleShowMapPoints *)self directionsType];

        if (v14) {
          uint64_t v13 = 6003;
        }
        else {
          uint64_t v13 = 2015;
        }
      }
    }
    [(MAHandleShowMapPoints *)self _captureUserAction:v13 details:v11];
    +[MKSiriInteraction generateHashForNavigationURL:v24];
  }
  if ([v10 openSensitiveURL:v24])
  {
    id v21 = objc_alloc_init((Class)SALocalSearchShowMapPointsCompleted);
  }
  else
  {
    BackgroundStateLog(OS_LOG_TYPE_INFO, @"MAPS SIRI: Failed to open url: %@", v15, v16, v17, v18, v19, v20, (uint64_t)v24);
    id v22 = objc_alloc((Class)SACommandFailed);
    uint64_t v23 = +[NSString stringWithFormat:@"Unable to open maps with URL: %@", v24];
    id v21 = [v22 initWithReason:v23];
  }
  v12[2](v12, v21, 0);
}

- (void)_captureUserAction:(int)a3 details:(id)a4
{
  uint64_t v4 = *(void *)&a3;
  id v5 = a4;
  id v6 = +[MKMapService sharedService];
  [v6 captureUserAction:v4 onTarget:802 placeActionDetails:v5 mapItem:0 resultIndex:0xFFFFFFFFLL];
}

- (BOOL)_shouldUseSerializedURLWithOptions:(id)a3
{
  id v5 = a3;
  unsigned __int8 v6 = [(MAHandleShowMapPoints *)self showDirections];
  if ((v6 & 1) != 0
    || ([(MAHandleShowMapPoints *)self directionsType],
        (v3 = objc_claimAutoreleasedReturnValue()) != 0))
  {
    uint64_t v7 = [v5 objectForKeyedSubscript:MKLaunchOptionsTimePointKey];
    BOOL v8 = v7 != 0;

    if (v6) {
      goto LABEL_7;
    }
  }
  else
  {
    BOOL v8 = 0;
  }

LABEL_7:
  return v8;
}

- (void)_extractAndSetSessionEntityFromSALocalSearchMapItem:(id)a3
{
  id v3 = a3;
  id v28 = v3;
  if (v3
    && (char v9 = objc_opt_respondsToSelector(), v3 = v28, (v9 & 1) != 0)
    && (char v10 = objc_opt_respondsToSelector(), v3 = v28, (v10 & 1) != 0))
  {
    id v11 = [v28 extSessionGuid];
    uint64_t v12 = [v28 extSessionGuidCreatedTimestamp];
    uint64_t v19 = (void *)v12;
    if (v11 && v12)
    {
      uint64_t v20 = +[GEOUserSession sharedInstance];
      id v21 = objc_alloc_init((Class)GEOUserSessionEntity);
      [v21 updateSessionIDFromUUIDString:v11];
      [v19 timeIntervalSinceReferenceDate];
      objc_msgSend(v21, "setSessionCreationTime:");
      BackgroundStateLog(OS_LOG_TYPE_INFO, @"MAPS SIRI: Setting maps user session to %@", v22, v23, v24, v25, v26, v27, (uint64_t)v21);
      [v20 setSharedMapsUserSessionEntity:v21 shareSessionIDWithMaps:1];
    }
    else
    {
      BackgroundStateLog(OS_LOG_TYPE_INFO, @"MAPS SIRI: Missing values for extSessionGuid or extSessionGuidCreatedTimestamp from %@", v13, v14, v15, v16, v17, v18, (uint64_t)v28);
    }
  }
  else
  {
    BackgroundStateLog(OS_LOG_TYPE_INFO, @"MAPS SIRI: SALocalSearchMapItem (saLocalSearchMapItem: <%@> is either nil or does not implement -extSessionGuid -extSessionGuidCreatedTimestamp methods, skipping"), (uint64_t)v3, v4, v5, v6, v7, v8, (uint64_t)v3;
  }
}

- (BOOL)_shouldUseBackgroundNavigationWithServiceHelper:(id)a3
{
  shouldUseBackgroundNavigation = self->_shouldUseBackgroundNavigation;
  if (!shouldUseBackgroundNavigation)
  {
    id v5 = a3;
    unsigned int v6 = +[CLLocationManager authorizationStatusForBundleIdentifier:@"com.apple.Maps"];
    uint64_t v7 = +[MapsCarPlayExternalDeviceMonitor sharedInstance];
    uint64_t v8 = [(id)v7 carPlayExternalDevice];

    LOBYTE(v7) = [v5 isDeviceLockedWithPasscode];
    if (v7) {
      unsigned int v9 = 1;
    }
    else {
      unsigned int v9 = [(MAHandleShowMapPoints *)self _isDoNotDisturbWhileDrivingHoldingCoverSheet];
    }
    char v10 = +[GEOCountryConfiguration sharedConfiguration];
    uint64_t v11 = 0;
    if ([v10 currentCountrySupportsNavigation] && !v8)
    {
      uint64_t v12 = [(MAHandleShowMapPoints *)self itemSource];
      if ([v12 isCurrentLocation])
      {
        unsigned int v13 = [(MAHandleShowMapPoints *)self _shouldLaunchIntoNav];
        if (v6 - 3 < 2) {
          unsigned int v14 = v13;
        }
        else {
          unsigned int v14 = 0;
        }
        uint64_t v11 = v14 & v9;
      }
      else
      {
        uint64_t v11 = 0;
      }
    }
    uint64_t v15 = [(MAHandleShowMapPoints *)self itemSource];
    uint64_t v25 = [(MAHandleShowMapPoints *)self directionsType];
    +[CLLocationManager authorizationStatusForBundleIdentifier:@"com.apple.Maps"];
    BackgroundStateLog(OS_LOG_TYPE_INFO, @"MAPS SIRI: use background nav? %d | in CarPlay? %d | item source %@ | directions type %@ | authorization status for Maps CL %d | is locked with passcode? %d | do-not-disturb-while-driving requiring exit confirmation? (if 'is locked with passcode? is 1/YES, this value may be inaccurate because we don't fetch it) %d", v16, v17, v18, v19, v20, v21, v11);

    uint64_t v22 = +[NSNumber numberWithBool:v11];
    uint64_t v23 = self->_shouldUseBackgroundNavigation;
    self->_shouldUseBackgroundNavigation = v22;

    shouldUseBackgroundNavigation = self->_shouldUseBackgroundNavigation;
  }

  return [(NSNumber *)shouldUseBackgroundNavigation BOOLValue];
}

- (void)_performWithServiceHelper:(id)a3 completion:(id)a4
{
  id v6 = a3;
  uint64_t v7 = (void (**)(id, id, void))a4;
  +[NSDate timeIntervalSinceReferenceDate];
  self->_startingTime = v8;
  unsigned int v9 = [(MAHandleShowMapPoints *)self language];
  char v10 = +[NSLocale localeWithLocaleIdentifier:v9];

  uint64_t v11 = [v10 localeIdentifier];
  uint64_t v12 = [(MAHandleShowMapPoints *)self itemSource];

  if (!v12)
  {
    unsigned int v14 = 0;
LABEL_5:
    uint64_t v23 = [(MAHandleShowMapPoints *)self itemDestination];

    if (v23)
    {
      uint64_t v24 = [(MAHandleShowMapPoints *)self itemDestination];
      uint64_t v25 = +[MKMapItem mapItemWithLocalSearchMapItem:v24 phoneticLocaleIdentifier:v11];

      if (!v25)
      {
        v41 = [(MAHandleShowMapPoints *)self itemDestination];
        BackgroundStateLog(OS_LOG_TYPE_INFO, @"MAPS SIRI: Unable to generate destination map item from %@", v42, v43, v44, v45, v46, v47, (uint64_t)v41);

        id v48 = [objc_alloc((Class)SACommandFailed) initWithReason:@"Unable to generate destination map item."];
        v7[2](v7, v48, 0);

LABEL_61:
        goto LABEL_62;
      }
      uint64_t v26 = v25;
      v112 = v14;
      uint64_t v108 = +[GEOPlaceActionDetails actionDetailsWithMapItem:v25 timestamp:1 resultIndex:0.0];
    }
    else
    {
      v112 = v14;
      uint64_t v108 = 0;
      uint64_t v26 = 0;
    }
    v104 = [(MAHandleShowMapPoints *)self language];
    BackgroundStateLog(OS_LOG_TYPE_INFO, @"MAPS SIRI: Opening Maps with phoneticLanguage:%@ locale:%@", v27, v28, v29, v30, v31, v32, (uint64_t)v11);

    v33 = [(MAHandleShowMapPoints *)self _mapKitLaunchOptionsWithServiceHelper:v6];
    unsigned int v107 = [(MAHandleShowMapPoints *)self _shouldUseSerializedURLWithOptions:v33];
    v110 = v10;
    v111 = (void *)v26;
    if (!v107)
    {
      uint64_t v37 = MKLaunchOptionsTimePointKey;
      v38 = [v33 objectForKeyedSubscript:MKLaunchOptionsTimePointKey];

      if (!v38)
      {
        id v109 = 0;
        uint64_t v40 = 0xFFFFFFFLL;
        goto LABEL_28;
      }
      id v39 = [v33 mutableCopy];
      [v39 removeObjectForKey:v37];
      id v109 = 0;
      goto LABEL_14;
    }
    uint64_t v34 = MKLaunchOptionsMapRadiusInMetersKey;
    id v35 = [v33 objectForKeyedSubscript:MKLaunchOptionsMapRadiusInMetersKey];
    if (v35)
    {

      uint64_t v36 = MKLaunchOptionsLaunchIntoNavKey;
    }
    else
    {
      uint64_t v36 = MKLaunchOptionsLaunchIntoNavKey;
      id v49 = [v33 objectForKeyedSubscript:MKLaunchOptionsLaunchIntoNavKey];

      if (!v49)
      {
        id v39 = v33;
        goto LABEL_18;
      }
    }
    id v39 = [v33 mutableCopy];
    [v39 removeObjectForKey:v34];
    [v39 removeObjectForKey:v36];

LABEL_18:
    id v109 = objc_alloc_init((Class)MKURLSerializer);
    v33 = [(MAHandleShowMapPoints *)self directionsType];
    if ([v33 isEqualToString:SALocalSearchDirectionsTypeWalkingValue])
    {
      uint64_t v40 = 2;
      goto LABEL_27;
    }
    if ([v33 isEqualToString:SALocalSearchDirectionsTypeByPublicTransitValue])
    {
      uint64_t v40 = 4;
      goto LABEL_27;
    }
    if (([v33 isEqualToString:SALocalSearchDirectionsTypeBikingValue] & 1) == 0)
    {
      if ([v33 isEqualToString:SALocalSearchDirectionsTypeByCarValue]) {
        uint64_t v40 = 1;
      }
      else {
        uint64_t v40 = 0xFFFFFFFLL;
      }
      goto LABEL_27;
    }
LABEL_14:
    uint64_t v40 = 0xFFFFFFFLL;
LABEL_27:

    v33 = v39;
LABEL_28:
    v50 = [(MAHandleShowMapPoints *)self searchItems];
    v51 = [v50 domainObjects];
    id v52 = [v51 count];

    if (v52)
    {
      v105 = v7;
      id v106 = v6;
      v59 = [(MAHandleShowMapPoints *)self searchItems];
      v60 = [v59 domainObjects];
      v61 = +[NSMutableArray arrayWithCapacity:](NSMutableArray, "arrayWithCapacity:", [v60 count]);

      long long v115 = 0u;
      long long v116 = 0u;
      long long v113 = 0u;
      long long v114 = 0u;
      v62 = [(MAHandleShowMapPoints *)self searchItems];
      v63 = [v62 domainObjects];

      id v64 = [v63 countByEnumeratingWithState:&v113 objects:v119 count:16];
      if (v64)
      {
        id v65 = v64;
        uint64_t v66 = *(void *)v114;
        do
        {
          for (i = 0; i != v65; i = (char *)i + 1)
          {
            if (*(void *)v114 != v66) {
              objc_enumerationMutation(v63);
            }
            uint64_t v68 = *(void *)(*((void *)&v113 + 1) + 8 * i);
            [(MAHandleShowMapPoints *)self _extractAndSetSessionEntityFromSALocalSearchMapItem:v68];
            v69 = +[MKMapItem mapItemWithLocalSearchMapItem:v68 phoneticLocaleIdentifier:v11];
            [v61 addObject:v69];
          }
          id v65 = [v63 countByEnumeratingWithState:&v113 objects:v119 count:16];
        }
        while (v65);
      }

      if (v107)
      {
        v70 = v109;
        v77 = [v109 urlForOpeningMapItems:v61 options:v33];
        uint64_t v7 = v105;
        id v6 = v106;
        v78 = v111;
        if (v77)
        {
LABEL_38:
          v79 = (void *)v108;
          [(MAHandleShowMapPoints *)self _launchMapsWithURL:v77 serviceHelper:v6 placeActionDetails:v108 completion:v7];
LABEL_47:

          char v10 = v110;
LABEL_60:

          unsigned int v14 = v112;
          goto LABEL_61;
        }
      }
      else
      {
        v77 = +[MKMapItem urlForMapItems:v61 options:v33];
        uint64_t v7 = v105;
        id v6 = v106;
        v78 = v111;
        v70 = v109;
        if (v77) {
          goto LABEL_38;
        }
      }
      BackgroundStateLog(OS_LOG_TYPE_INFO, @"MAPS SIRI: Unable to generate Maps URL (from domainObjects)", v71, v72, v73, v74, v75, v76, v103);
      id v89 = [objc_alloc((Class)SACommandFailed) initWithReason:@"Unable to generate Maps URL."];
      v7[2](v7, v89, 0);

      v79 = (void *)v108;
      goto LABEL_47;
    }
    v78 = v111;
    if (v112 && v111)
    {
      v80 = [(MAHandleShowMapPoints *)self itemSource];
      [(MAHandleShowMapPoints *)self _extractAndSetSessionEntityFromSALocalSearchMapItem:v80];

      v81 = [(MAHandleShowMapPoints *)self itemDestination];
      [(MAHandleShowMapPoints *)self _extractAndSetSessionEntityFromSALocalSearchMapItem:v81];

      char v10 = v110;
      if (v107)
      {
        v70 = v109;
        id v88 = [v109 urlForDirectionsFromMapItem:v112 toMapItem:v111 transportType:v40 options:v33];
        if (v88)
        {
LABEL_43:
          if (![(MAHandleShowMapPoints *)self _shouldUseBackgroundNavigationWithServiceHelper:v6])
          {
            v79 = (void *)v108;
            [(MAHandleShowMapPoints *)self _launchMapsWithURL:v88 serviceHelper:v6 placeActionDetails:v108 completion:v7];

            goto LABEL_60;
          }
          [(MAHandleShowMapPoints *)self _launchBackgroundNavigationWithURL:v88 serviceHelper:v6 completion:v7];
          goto LABEL_53;
        }
      }
      else
      {
        v118[0] = v112;
        v118[1] = v111;
        v99 = +[NSArray arrayWithObjects:v118 count:2];
        id v88 = +[MKMapItem urlForMapItems:v99 options:v33];

        v70 = v109;
        if (v88) {
          goto LABEL_43;
        }
      }
      BackgroundStateLog(OS_LOG_TYPE_INFO, @"MAPS SIRI: Unable to generate Maps URL (from source + destination)", v82, v83, v84, v85, v86, v87, v103);
      id v88 = [objc_alloc((Class)SACommandFailed) initWithReason:@"Unable to generate Maps URL."];
      v7[2](v7, v88, 0);
LABEL_53:

      v79 = (void *)v108;
      goto LABEL_60;
    }
    char v10 = v110;
    if (v112)
    {
      v90 = [(MAHandleShowMapPoints *)self itemSource];
      [(MAHandleShowMapPoints *)self _extractAndSetSessionEntityFromSALocalSearchMapItem:v90];

      v117 = v112;
      v91 = +[NSArray arrayWithObjects:&v117 count:1];
      v92 = +[MKMapItem urlForMapItems:v91 options:v33];

      if (v92)
      {
        v79 = (void *)v108;
        [(MAHandleShowMapPoints *)self _launchMapsWithURL:v92 serviceHelper:v6 placeActionDetails:v108 completion:v7];

LABEL_59:
        v70 = v109;
        goto LABEL_60;
      }
      BackgroundStateLog(OS_LOG_TYPE_INFO, @"MAPS SIRI: Unable to generate Maps URL (from source)", v93, v94, v95, v96, v97, v98, v103);
      id v100 = objc_alloc((Class)SACommandFailed);
      CFStringRef v101 = @"Unable to generate Maps URL.";
    }
    else
    {
      BackgroundStateLog(OS_LOG_TYPE_INFO, @"MAPS SIRI: Unable to generate Maps URL (from destination)", v53, v54, v55, v56, v57, v58, v103);
      id v100 = objc_alloc((Class)SACommandFailed);
      CFStringRef v101 = @"Unknown source and destination.";
    }
    id v102 = [v100 initWithReason:v101];
    v7[2](v7, v102, 0);

    v79 = (void *)v108;
    goto LABEL_59;
  }
  unsigned int v13 = [(MAHandleShowMapPoints *)self itemSource];
  unsigned int v14 = +[MKMapItem mapItemWithLocalSearchMapItem:v13 phoneticLocaleIdentifier:v11];

  if (v14) {
    goto LABEL_5;
  }
  uint64_t v15 = [(MAHandleShowMapPoints *)self itemSource];
  BackgroundStateLog(OS_LOG_TYPE_INFO, @"MAPS SIRI: Unable to generate source map item from %@", v16, v17, v18, v19, v20, v21, (uint64_t)v15);

  id v22 = [objc_alloc((Class)SACommandFailed) initWithReason:@"Unable to generate source map item."];
  v7[2](v7, v22, 0);

LABEL_62:
}

- (void)performWithCompletion:(id)a3 serviceHelper:(id)a4
{
  id v6 = a3;
  v13[0] = 0;
  v13[1] = v13;
  v13[2] = 0x2020000000;
  char v14 = 0;
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_73D4;
  v9[3] = &unk_30948;
  uint64_t v12 = v13;
  id v7 = a4;
  id v10 = v7;
  id v8 = v6;
  id v11 = v8;
  [(MAHandleShowMapPoints *)self _performWithServiceHelper:v7 completion:v9];

  _Block_object_dispose(v13, 8);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_shouldUseBackgroundNavigation, 0);

  objc_storeStrong((id *)&self->_carDnDStatus, 0);
}

@end