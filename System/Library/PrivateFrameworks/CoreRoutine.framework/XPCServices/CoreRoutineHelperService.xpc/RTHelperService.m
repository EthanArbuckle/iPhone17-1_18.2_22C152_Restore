@interface RTHelperService
+ (id)computeMetricsForAnalyticsIdentifier:(id)a3 appIdentifier:(id)a4 requestType:(unint64_t)a5 mapItems:(id)a6 serviceError:(id)a7 isBackgroundRequest:(BOOL)a8;
+ (id)exposedErrorFrom:(id)a3;
+ (void)submitMetricsForAnalyticsIdentifier:(id)a3 appIdentifier:(id)a4 requestType:(unint64_t)a5 mapItems:(id)a6 serviceError:(id)a7 isBackgroundRequest:(BOOL)a8;
- (BOOL)insideBusinessHours:(id)a3 date:(id)a4 timeZone:(id)a5;
- (RTHelperService)init;
- (RTHelperService)initWithGeoMapService:(id)a3;
- (double)confidenceWeightForGeoMapItem:(id)a3 startDate:(id)a4 endDate:(id)a5 timeZone:(id)a6;
- (double)weightBasedOnBusinessHours:(id)a3 startDate:(id)a4 endDate:(id)a5 timeZone:(id)a6;
- (double)weightBasedOnDurationWithStartDate:(id)a3 endDate:(id)a4 timeZone:(id)a5 poiCategory:(id)a6;
- (id)_buildingPolygonsFromGEOBuilding:(id)a3;
- (id)_mapItemFromGEOMapItem:(id)a3 mapItemSource:(unint64_t)a4 confidenceScalingFactor:(double)a5;
- (id)_mapItemsFromGEOMapItems:(id)a3 mapItemSource:(unint64_t)a4;
- (id)defaultTraitsForOptions:(id)a3 selector:(SEL)a4;
- (id)getDefaultMapServiceOptions;
- (void)_relatedPlacesMapItemsIdentifiersForGEOMapItem:(id)a3 relatedPlaceListType:(int)a4 handler:(id)a5;
- (void)_relatedPlacesMapItemsIdentifiersForGEOMapItems:(id)a3 relatedPlaceListType:(int)a4 handler:(id)a5;
- (void)addTicket:(id)a3;
- (void)cancelTicket:(id)a3;
- (void)createMapItemWithIdentifier:(id)a3 geoMapItemStorage:(id)a4 source:(unint64_t)a5 creationDate:(id)a6 handler:(id)a7;
- (void)dealloc;
- (void)fetchAppClipURLsForMapItem:(id)a3 options:(id)a4 handler:(id)a5;
- (void)fetchBuildingPolygonsFromLocation:(id)a3 radius:(double)a4 handler:(id)a5;
- (void)fetchCountryAndSubdivisionCodesFromLocation:(id)a3 options:(id)a4 handler:(id)a5;
- (void)fetchGeoMapItemFromHandle:(id)a3 options:(id)a4 handler:(id)a5;
- (void)fetchMapGEOItemsFromLocation:(id)a3 options:(id)a4 handler:(id)a5;
- (void)fetchMapItemFromHandle:(id)a3 options:(id)a4 handler:(id)a5;
- (void)fetchMapItemsFromAddressDictionary:(id)a3 options:(id)a4 handler:(id)a5;
- (void)fetchMapItemsFromAddressString:(id)a3 options:(id)a4 handler:(id)a5;
- (void)fetchMapItemsFromIdentifiers:(id)a3 options:(id)a4 source:(unint64_t)a5 handler:(id)a6;
- (void)fetchMapItemsFromLocation:(id)a3 options:(id)a4 handler:(id)a5;
- (void)fetchMapItemsFromLocations:(id)a3 accessPoints:(id)a4 startDate:(id)a5 endDate:(id)a6 options:(id)a7 handler:(id)a8;
- (void)fetchMapItemsFromNaturalLanguageQuery:(id)a3 location:(id)a4 options:(id)a5 handler:(id)a6;
- (void)fetchMapItemsRelatedPlacesFromLocation:(id)a3 options:(id)a4 handler:(id)a5;
- (void)fetchPointOfInterestAttributesWithIdentifier:(unint64_t)a3 options:(id)a4 handler:(id)a5;
- (void)fetchPointOfInterestsAroundCoordinate:(id)a3 radius:(double)a4 options:(id)a5 handler:(id)a6;
- (void)fetchPostalAddressForMapItem:(id)a3 options:(id)a4 handler:(id)a5;
- (void)fetchRelatedPlacesMapItemsForGEOMapItem:(id)a3 relatedPlaceListType:(int)a4 options:(id)a5 source:(unint64_t)a6 handler:(id)a7;
- (void)fetchRelatedPlacesMapItemsForMapItem:(id)a3 relatedPlaceListType:(int)a4 options:(id)a5 source:(unint64_t)a6 handler:(id)a7;
- (void)removeTicket:(id)a3;
@end

@implementation RTHelperService

- (void)_relatedPlacesMapItemsIdentifiersForGEOMapItems:(id)a3 relatedPlaceListType:(int)a4 handler:(id)a5
{
  id v8 = a3;
  v9 = (void (**)(id, id, void *))a5;
  if (v9)
  {
    if ([v8 count])
    {
      v10 = +[NSMutableArray array];
      +[NSMutableArray array];
      v16[0] = _NSConcreteStackBlock;
      v16[1] = 3221225472;
      v16[2] = sub_100002588;
      v16[3] = &unk_1000248F8;
      int v19 = a4;
      v16[4] = self;
      id v17 = v10;
      id v11 = (id)objc_claimAutoreleasedReturnValue();
      id v18 = v11;
      id v12 = v10;
      [v8 enumerateObjectsUsingBlock:v16];
      if ([v11 count])
      {
        v13 = _RTSafeArray();
        v14 = _RTMultiErrorCreate();
      }
      else
      {
        v14 = 0;
      }
      v9[2](v9, v12, v14);
    }
    else
    {
      uint64_t v15 = RTErrorDomain;
      NSErrorUserInfoKey v20 = NSLocalizedDescriptionKey;
      CFStringRef v21 = @"requires a list GEOMapItems.";
      id v11 = +[NSDictionary dictionaryWithObjects:&v21 forKeys:&v20 count:1];
      id v12 = +[NSError errorWithDomain:v15 code:7 userInfo:v11];
      v9[2](v9, 0, v12);
    }
  }
}

- (void)_relatedPlacesMapItemsIdentifiersForGEOMapItem:(id)a3 relatedPlaceListType:(int)a4 handler:(id)a5
{
  id v7 = a3;
  id v8 = a5;
  if (v8)
  {
    if (v7)
    {
      v9 = +[NSMutableSet set];
      long long v19 = 0u;
      long long v20 = 0u;
      long long v21 = 0u;
      long long v22 = 0u;
      v10 = objc_msgSend(v7, "_relatedPlaceLists", 0);
      id v11 = [v10 countByEnumeratingWithState:&v19 objects:v23 count:16];
      if (v11)
      {
        id v12 = v11;
        uint64_t v13 = *(void *)v20;
        do
        {
          for (i = 0; i != v12; i = (char *)i + 1)
          {
            if (*(void *)v20 != v13) {
              objc_enumerationMutation(v10);
            }
            uint64_t v15 = *(void **)(*((void *)&v19 + 1) + 8 * i);
            if ([v15 type] == a4)
            {
              v16 = [v15 mapIdentifiers];
              [v9 addObjectsFromArray:v16];
            }
          }
          id v12 = [v10 countByEnumeratingWithState:&v19 objects:v23 count:16];
        }
        while (v12);
      }

      if (![v9 count])
      {
        (*((void (**)(id, void, void))v8 + 2))(v8, 0, 0);
        goto LABEL_17;
      }
      id v17 = [v9 allObjects];
      (*((void (**)(id, void *, void))v8 + 2))(v8, v17, 0);
    }
    else
    {
      uint64_t v18 = RTErrorDomain;
      NSErrorUserInfoKey v24 = NSLocalizedDescriptionKey;
      CFStringRef v25 = @"requires a GEOMapItem.";
      v9 = +[NSDictionary dictionaryWithObjects:&v25 forKeys:&v24 count:1];
      id v17 = +[NSError errorWithDomain:v18 code:7 userInfo:v9];
      (*((void (**)(id, void, void *))v8 + 2))(v8, 0, v17);
    }

LABEL_17:
  }
}

- (void)fetchMapItemsRelatedPlacesFromLocation:(id)a3 options:(id)a4 handler:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  if (v11)
  {
    if (v9)
    {
      id v12 = +[NSMutableArray array];
      v16[0] = _NSConcreteStackBlock;
      v16[1] = 3221225472;
      v16[2] = sub_10000378C;
      v16[3] = &unk_100024858;
      v16[4] = self;
      SEL v20 = a2;
      id v17 = v9;
      id v18 = v12;
      id v19 = v11;
      id v13 = v12;
      [(RTHelperService *)self fetchMapGEOItemsFromLocation:v17 options:v10 handler:v16];
    }
    else
    {
      uint64_t v14 = RTErrorDomain;
      NSErrorUserInfoKey v21 = NSLocalizedDescriptionKey;
      CFStringRef v22 = @"requires a valid location.";
      id v13 = +[NSDictionary dictionaryWithObjects:&v22 forKeys:&v21 count:1];
      uint64_t v15 = +[NSError errorWithDomain:v14 code:7 userInfo:v13];
      (*((void (**)(id, void, void, void *))v11 + 2))(v11, 0, 0, v15);
    }
  }
}

- (void)fetchMapItemsFromIdentifiers:(id)a3 options:(id)a4 source:(unint64_t)a5 handler:(id)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a6;
  if (v13)
  {
    if ([v11 count])
    {
      uint64_t v14 = [(RTHelperService *)self defaultTraitsForOptions:v12 selector:"ticketForReverseGeocodeLocation:preserveOriginalLocation:placeTypeLimit:traits:"];
      uint64_t v15 = [(GEOMapService *)self->_geoMapService ticketForIdentifiers:v11 traits:v14];
      v18[0] = _NSConcreteStackBlock;
      v18[1] = 3221225472;
      v18[2] = sub_100006BD4;
      v18[3] = &unk_100024880;
      v18[4] = self;
      unint64_t v23 = a5;
      SEL v24 = a2;
      id v19 = v11;
      id v22 = v13;
      id v20 = v12;
      id v21 = v14;
      id v16 = v14;
      [v15 submitWithHandler:v18 networkActivity:0];
    }
    else
    {
      uint64_t v17 = RTErrorDomain;
      NSErrorUserInfoKey v25 = NSLocalizedDescriptionKey;
      CFStringRef v26 = @"requires a list of GEOMapItem identifiers.";
      uint64_t v15 = +[NSDictionary dictionaryWithObjects:&v26 forKeys:&v25 count:1];
      id v16 = +[NSError errorWithDomain:v17 code:7 userInfo:v15];
      (*((void (**)(id, void, id))v13 + 2))(v13, 0, v16);
    }
  }
}

- (void)fetchMapGEOItemsFromLocation:(id)a3 options:(id)a4 handler:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  if (v11)
  {
    if (v9)
    {
      id v12 = [objc_alloc((Class)GEOLocation) initWithRTLocation:v9 includeTimeStamp:1];
      id v13 = [(RTHelperService *)self defaultTraitsForOptions:v10 selector:"ticketForReverseGeocodeLocation:preserveOriginalLocation:placeTypeLimit:traits:"];
      uint64_t v14 = [(GEOMapService *)self->_geoMapService ticketForReverseGeocodeLocation:v12 preserveOriginalLocation:0 placeTypeLimit:0 traits:v13];
      v17[0] = _NSConcreteStackBlock;
      v17[1] = 3221225472;
      v17[2] = sub_100003A10;
      v17[3] = &unk_100024830;
      SEL v23 = a2;
      id v18 = v9;
      id v22 = v11;
      id v19 = self;
      id v20 = v10;
      id v21 = v13;
      id v15 = v13;
      [v14 submitWithHandler:v17 networkActivity:0];
    }
    else
    {
      uint64_t v16 = RTErrorDomain;
      NSErrorUserInfoKey v24 = NSLocalizedDescriptionKey;
      CFStringRef v25 = @"requires a valid location.";
      id v12 = +[NSDictionary dictionaryWithObjects:&v25 forKeys:&v24 count:1];
      uint64_t v14 = +[NSError errorWithDomain:v16 code:7 userInfo:v12];
      (*((void (**)(id, void, void *))v11 + 2))(v11, 0, v14);
    }
  }
}

+ (void)submitMetricsForAnalyticsIdentifier:(id)a3 appIdentifier:(id)a4 requestType:(unint64_t)a5 mapItems:(id)a6 serviceError:(id)a7 isBackgroundRequest:(BOOL)a8
{
  id v13 = a3;
  id v14 = a4;
  id v15 = a6;
  v29[0] = _NSConcreteStackBlock;
  v29[1] = 3221225472;
  v29[2] = sub_10000283C;
  v29[3] = &unk_100024A80;
  id v30 = v13;
  id v31 = v14;
  id v33 = a7;
  unint64_t v34 = a5;
  id v32 = v15;
  BOOL v35 = a8;
  id v16 = v33;
  id v17 = v15;
  id v18 = v14;
  id v19 = v13;
  id v20 = objc_retainBlock(v29);
  id v21 = objc_alloc((Class)NSString);
  v26[0] = _NSConcreteStackBlock;
  v26[1] = 3221225472;
  v26[2] = sub_1000027E4;
  v26[3] = &unk_100024AA8;
  id v27 = [v21 initWithCString:off_10002D3D0 encoding:1];
  id v28 = v20;
  id v22 = v27;
  SEL v23 = v20;
  NSErrorUserInfoKey v24 = objc_retainBlock(v26);
  CFStringRef v25 = +[NSString stringWithFormat:@"com.apple.%@", v22];
  AnalyticsSendEventLazy();
}

- (id)_mapItemsFromGEOMapItems:(id)a3 mapItemSource:(unint64_t)a4
{
  id v6 = a3;
  id v7 = +[NSDate date];
  id v8 = [v7 dateByAddingTimeInterval:4838400.0];
  id v9 = [[_RTMap alloc] initWithInput:v6];

  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472;
  v14[2] = sub_10000406C;
  v14[3] = &unk_1000247A0;
  v14[4] = self;
  id v15 = v7;
  id v16 = v8;
  unint64_t v17 = a4;
  id v10 = v8;
  id v11 = v7;
  id v12 = [(_RTMap *)v9 withBlock:v14];

  return v12;
}

+ (id)computeMetricsForAnalyticsIdentifier:(id)a3 appIdentifier:(id)a4 requestType:(unint64_t)a5 mapItems:(id)a6 serviceError:(id)a7 isBackgroundRequest:(BOOL)a8
{
  BOOL v8 = a8;
  id v13 = a7;
  id v14 = a6;
  id v15 = a4;
  id v16 = a3;
  unint64_t v17 = +[NSMutableDictionary dictionary];
  [v17 setObject:v16 forKeyedSubscript:@"analyticsIdentifier"];

  [v17 setObject:v15 forKeyedSubscript:@"appIdentifier"];
  id v18 = +[NSNumber numberWithUnsignedInteger:a5];
  [v17 setObject:v18 forKeyedSubscript:@"requestType"];

  id v19 = [v14 count];
  id v20 = +[NSNumber numberWithUnsignedInteger:v19];
  [v17 setObject:v20 forKeyedSubscript:@"yieldCount"];

  if (v13)
  {
    id v21 = [v13 domain];
    [v17 setObject:v21 forKeyedSubscript:@"errorDomain"];

    id v22 = +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", [v13 code]);
    [v17 setObject:v22 forKeyedSubscript:@"errorCode"];

    SEL v23 = [v13 userInfo];
    uint64_t v24 = GEOErrorHttpStatusCodeKey;
    CFStringRef v25 = [v23 objectForKeyedSubscript:GEOErrorHttpStatusCodeKey];

    if (v25)
    {
      CFStringRef v26 = [v13 userInfo];
      id v27 = [v26 objectForKeyedSubscript:v24];
      [v17 setObject:v27 forKeyedSubscript:@"errorHTTPStatus"];
    }
  }
  if (v8) {
    uint64_t v28 = 2;
  }
  else {
    uint64_t v28 = 1;
  }
  v29 = +[NSNumber numberWithUnsignedInteger:v28];
  [v17 setObject:v29 forKeyedSubscript:@"runningState"];

  return v17;
}

+ (id)exposedErrorFrom:(id)a3
{
  id v3 = a3;
  if ([v3 code] == (id)-8)
  {
    v4 = 0;
  }
  else if ([v3 code] == (id)-6)
  {
    v4 = 0;
  }
  else
  {
    v4 = v3;
  }
  id v5 = v4;

  return v5;
}

- (id)defaultTraitsForOptions:(id)a3 selector:(SEL)a4
{
  id v6 = a3;
  if (!v6)
  {
    id v6 = [(RTHelperService *)self getDefaultMapServiceOptions];
  }
  id v7 = sub_1000071D0(&qword_10002D3A0);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    CFStringRef v25 = [v6 analyticsIdentifier];
    CFStringRef v26 = [v6 clientIdentifier];
    *(_DWORD *)buf = 138412546;
    id v30 = v25;
    __int16 v31 = 2112;
    id v32 = v26;
    _os_log_debug_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEBUG, "RTMapServiceOptions: analytics indentifier: %@, app identifier: %@", buf, 0x16u);
  }
  unsigned int v8 = [v6 useBackgroundTraits];
  geoMapService = self->_geoMapService;
  if (v8) {
    [(GEOMapService *)geoMapService defaultBackgroundTraits];
  }
  else {
  id v10 = [(GEOMapService *)geoMapService defaultTraits];
  }
  id v11 = [v6 clientIdentifier];

  if (v11)
  {
    id v12 = [v10 appIdentifier];
    id v13 = [v6 clientIdentifier];
    id v14 = +[NSString stringWithFormat:@"%@|%@", v12, v13];
    [v10 setAppIdentifier:v14];
  }
  id v15 = [v10 appIdentifier];
  [v10 setAnalyticsAppIdentifier:v15];

  id v16 = [v6 analyticsIdentifier];

  if (v16)
  {
    unint64_t v17 = [v10 analyticsAppIdentifier];
    id v18 = [v6 analyticsIdentifier];
    id v19 = +[NSString stringWithFormat:@"%@|%@", v17, v18];
    [v10 setAnalyticsAppIdentifier:v19];
  }
  if (a4)
  {
    id v20 = [v10 analyticsAppIdentifier];
    id v21 = NSStringFromSelector(a4);
    id v22 = +[NSString stringWithFormat:@"%@|%@", v20, v21];
    [v10 setAnalyticsAppIdentifier:v22];
  }
  SEL v23 = sub_1000071D0(&qword_10002D3A0);
  if (os_log_type_enabled(v23, OS_LOG_TYPE_DEBUG))
  {
    id v27 = [v10 analyticsAppIdentifier];
    uint64_t v28 = [v10 appIdentifier];
    *(_DWORD *)buf = 138412546;
    id v30 = v27;
    __int16 v31 = 2112;
    id v32 = v28;
    _os_log_debug_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_DEBUG, "GEOMapServiceTraits: analytics app indentifier: %@, app identifier: %@", buf, 0x16u);
  }
  return v10;
}

- (RTHelperService)init
{
  id v3 = objc_opt_new();
  v4 = [(RTHelperService *)self initWithGeoMapService:v3];

  return v4;
}

- (RTHelperService)initWithGeoMapService:(id)a3
{
  id v5 = a3;
  if (v5)
  {
    v17.receiver = self;
    v17.super_class = (Class)RTHelperService;
    id v6 = [(RTHelperService *)&v17 init];
    id v7 = v6;
    if (v6)
    {
      objc_storeStrong((id *)&v6->_geoMapService, a3);
      uint64_t v8 = objc_opt_new();
      tickets = v7->_tickets;
      v7->_tickets = (NSMutableSet *)v8;

      id v10 = (GEOMapFeatureAccess *)[objc_alloc((Class)GEOMapFeatureAccess) initWithQueue:&_dispatch_main_q memoryCacheCountLimit:0 memoryCacheCostLimit:0];
      mapFeatureAccess = v7->_mapFeatureAccess;
      v7->_mapFeatureAccess = v10;

      [(GEOMapFeatureAccess *)v7->_mapFeatureAccess setAllowNetworkTileLoad:1];
      v19[0] = GEOPOICategoryGasStation;
      v19[1] = GEOPOICategoryHospital;
      v20[0] = &off_100025A78;
      v20[1] = &off_100025AC0;
      v19[2] = GEOPOICategoryRestaurant;
      v20[2] = &off_100025B08;
      uint64_t v12 = +[NSDictionary dictionaryWithObjects:v20 forKeys:v19 count:3];
      bluePOICategoryToDurationThresholdMapping = v7->_bluePOICategoryToDurationThresholdMapping;
      v7->_bluePOICategoryToDurationThresholdMapping = (NSDictionary *)v12;
    }
    self = v7;
    id v14 = self;
  }
  else
  {
    id v15 = sub_1000071D0(&qword_10002D358);
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: geoMapService", buf, 2u);
    }

    id v14 = 0;
  }

  return v14;
}

- (void)addTicket:(id)a3
{
  if (a3)
  {
    tickets = self->_tickets;
    -[NSMutableSet addObject:](tickets, "addObject:");
  }
  else
  {
    v4 = sub_1000071D0(&qword_10002D358);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      int v5 = 136315394;
      id v6 = "-[RTHelperService addTicket:]";
      __int16 v7 = 1024;
      int v8 = 186;
      _os_log_error_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: ticket (in %s:%d)", (uint8_t *)&v5, 0x12u);
    }
  }
}

- (void)removeTicket:(id)a3
{
  if (a3)
  {
    tickets = self->_tickets;
    -[NSMutableSet removeObject:](tickets, "removeObject:");
  }
  else
  {
    v4 = sub_1000071D0(&qword_10002D358);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      int v5 = 136315394;
      id v6 = "-[RTHelperService removeTicket:]";
      __int16 v7 = 1024;
      int v8 = 197;
      _os_log_error_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: ticket (in %s:%d)", (uint8_t *)&v5, 0x12u);
    }
  }
}

- (void)cancelTicket:(id)a3
{
  if (a3)
  {
    [a3 cancel];
  }
  else
  {
    id v3 = sub_1000071D0(&qword_10002D358);
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    {
      int v4 = 136315394;
      int v5 = "-[RTHelperService cancelTicket:]";
      __int16 v6 = 1024;
      int v7 = 208;
      _os_log_error_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: ticket (in %s:%d)", (uint8_t *)&v4, 0x12u);
    }
  }
}

- (void)dealloc
{
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  id v3 = self->_tickets;
  id v4 = [(NSMutableSet *)v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v4)
  {
    id v5 = v4;
    uint64_t v6 = *(void *)v10;
    do
    {
      int v7 = 0;
      do
      {
        if (*(void *)v10 != v6) {
          objc_enumerationMutation(v3);
        }
        [(RTHelperService *)self cancelTicket:*(void *)(*((void *)&v9 + 1) + 8 * (void)v7)];
        int v7 = (char *)v7 + 1;
      }
      while (v5 != v7);
      id v5 = [(NSMutableSet *)v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v5);
  }

  v8.receiver = self;
  v8.super_class = (Class)RTHelperService;
  [(RTHelperService *)&v8 dealloc];
}

- (id)getDefaultMapServiceOptions
{
  id v2 = [objc_alloc((Class)RTMapServiceOptions) initWithUseBackgroundTraits:1 analyticsIdentifier:0 clientIdentifier:0];
  return v2;
}

- (void)fetchMapItemFromHandle:(id)a3 options:(id)a4 handler:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  if (v11)
  {
    if (v9)
    {
      v17[0] = _NSConcreteStackBlock;
      v17[1] = 3221225472;
      v17[2] = sub_10000E868;
      v17[3] = &unk_100024728;
      id v12 = v9;
      id v18 = v12;
      SEL v21 = a2;
      id v19 = self;
      id v20 = v11;
      id v13 = objc_retainBlock(v17);
      [(RTHelperService *)self fetchGeoMapItemFromHandle:v12 options:v10 handler:v13];

      id v14 = v18;
    }
    else
    {
      uint64_t v15 = RTErrorDomain;
      NSErrorUserInfoKey v22 = NSLocalizedDescriptionKey;
      CFStringRef v23 = @"requires valid handle.";
      id v14 = +[NSDictionary dictionaryWithObjects:&v23 forKeys:&v22 count:1];
      id v16 = +[NSError errorWithDomain:v15 code:7 userInfo:v14];
      (*((void (**)(id, void, void *))v11 + 2))(v11, 0, v16);
    }
  }
}

- (void)fetchGeoMapItemFromHandle:(id)a3 options:(id)a4 handler:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = (void (**)(void, void, void))v10;
  if (v8)
  {
    if (v10)
    {
      id v12 = [(RTHelperService *)self defaultTraitsForOptions:v9 selector:"resolveMapItemFromHandle:traits:completionHandler:"];
      geoMapService = self->_geoMapService;
      v18[0] = _NSConcreteStackBlock;
      v18[1] = 3221225472;
      v18[2] = sub_10000ED08;
      v18[3] = &unk_100024778;
      v18[4] = self;
      id v19 = v8;
      NSErrorUserInfoKey v22 = v11;
      id v20 = v9;
      id v21 = v12;
      id v14 = v12;
      [(GEOMapService *)geoMapService resolveMapItemFromHandle:v19 traits:v14 completionHandler:v18];

      goto LABEL_10;
    }
  }
  else
  {
    uint64_t v15 = sub_1000071D0(&qword_10002D358);
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      CFStringRef v26 = "-[RTHelperService fetchGeoMapItemFromHandle:options:handler:]";
      __int16 v27 = 1024;
      int v28 = 334;
      _os_log_error_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: handle (in %s:%d)", buf, 0x12u);
    }

    if (v11)
    {
      uint64_t v16 = RTErrorDomain;
      NSErrorUserInfoKey v23 = NSLocalizedDescriptionKey;
      CFStringRef v24 = @"requires valid handle.";
      id v14 = +[NSDictionary dictionaryWithObjects:&v24 forKeys:&v23 count:1];
      objc_super v17 = +[NSError errorWithDomain:v16 code:7 userInfo:v14];
      ((void (**)(void, void, void *))v11)[2](v11, 0, v17);

      goto LABEL_10;
    }
  }
  id v14 = sub_1000071D0(&qword_10002D358);
  if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 136315394;
    CFStringRef v26 = "-[RTHelperService fetchGeoMapItemFromHandle:options:handler:]";
    __int16 v27 = 1024;
    int v28 = 335;
    _os_log_error_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: handler (in %s:%d)", buf, 0x12u);
  }
LABEL_10:
}

- (id)_mapItemFromGEOMapItem:(id)a3 mapItemSource:(unint64_t)a4 confidenceScalingFactor:(double)a5
{
  id v7 = a3;
  id v8 = +[NSDate date];
  id v21 = [v8 dateByAddingTimeInterval:4838400.0];
  id v9 = [(GEOMapService *)self->_geoMapService handleForMapItem:v7];
  id v10 = objc_alloc((Class)NSString);
  id v11 = [v10 initWithCString:off_10002D3D8 encoding:1];
  CFStringRef v25 = @"geoMapItemHandleSize";
  id v12 = +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", [v9 length]);
  CFStringRef v26 = v12;
  id v13 = +[NSDictionary dictionaryWithObjects:&v26 forKeys:&v25 count:1];
  sub_100004BE4(v11, v13);

  id v14 = +[NSString stringWithFormat:@"com.apple.%@", v11];
  CFStringRef v23 = @"geoMapItemHandleSize";
  uint64_t v15 = +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", [v9 length]);
  CFStringRef v24 = v15;
  uint64_t v16 = +[NSDictionary dictionaryWithObjects:&v24 forKeys:&v23 count:1];
  AnalyticsSendEvent();

  id v17 = objc_alloc((Class)RTMapItem);
  id v18 = +[NSUUID UUID];
  id v19 = [v17 initWithIdentifier:v18 geoMapItem:v7 geoMapItemHandle:v9 source:a4 creationDate:v8 expirationDate:v21 confidenceScalingFactor:a5];

  return v19;
}

- (void)fetchMapItemsFromNaturalLanguageQuery:(id)a3 location:(id)a4 options:(id)a5 handler:(id)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  if (v14)
  {
    if ([v11 length])
    {
      if (v12)
      {
        uint64_t v15 = [(RTHelperService *)self defaultTraitsForOptions:v13 selector:"ticketForSearchQuery:completionItem:maxResults:traits:"];
        [v12 latitude];
        [v12 longitude];
        [v12 horizontalUncertainty];
        [v12 horizontalUncertainty];
        GEOCoordinateRegionMakeWithDistance();
        uint64_t v16 = +[GEOMapRegion _geo_mapRegionForGEOCoordinateRegion:](GEOMapRegion, "_geo_mapRegionForGEOCoordinateRegion:");
        [v15 setMapRegion:v16];

        id v17 = [(GEOMapService *)self->_geoMapService ticketForSearchQuery:v11 completionItem:0 maxResults:5 traits:v15];
        v22[0] = _NSConcreteStackBlock;
        v22[1] = 3221225472;
        v22[2] = sub_10000F450;
        v22[3] = &unk_100024830;
        v22[4] = self;
        SEL v27 = a2;
        id v23 = v11;
        id v26 = v14;
        id v24 = v13;
        id v25 = v15;
        id v18 = v15;
        [v17 submitWithHandler:v22 networkActivity:0];

LABEL_8:
        goto LABEL_9;
      }
      uint64_t v19 = RTErrorDomain;
      NSErrorUserInfoKey v28 = NSLocalizedDescriptionKey;
      CFStringRef v29 = @"requires a valid location.";
      id v20 = &v29;
      id v21 = &v28;
    }
    else
    {
      uint64_t v19 = RTErrorDomain;
      NSErrorUserInfoKey v30 = NSLocalizedDescriptionKey;
      CFStringRef v31 = @"requires a valid natural language query.";
      id v20 = &v31;
      id v21 = &v30;
    }
    id v17 = +[NSDictionary dictionaryWithObjects:v20 forKeys:v21 count:1];
    id v18 = +[NSError errorWithDomain:v19 code:7 userInfo:v17];
    (*((void (**)(id, void, id))v14 + 2))(v14, 0, v18);
    goto LABEL_8;
  }
LABEL_9:
}

- (void)fetchMapItemsFromLocation:(id)a3 options:(id)a4 handler:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  if (v11)
  {
    if (v9)
    {
      v15[0] = _NSConcreteStackBlock;
      v15[1] = 3221225472;
      v15[2] = sub_10000F93C;
      v15[3] = &unk_1000247E8;
      v15[4] = self;
      SEL v18 = a2;
      id v16 = v9;
      id v17 = v11;
      [(RTHelperService *)self fetchMapGEOItemsFromLocation:v16 options:v10 handler:v15];
    }
    else
    {
      uint64_t v12 = RTErrorDomain;
      NSErrorUserInfoKey v19 = NSLocalizedDescriptionKey;
      CFStringRef v20 = @"requires a valid location.";
      id v13 = +[NSDictionary dictionaryWithObjects:&v20 forKeys:&v19 count:1];
      id v14 = +[NSError errorWithDomain:v12 code:7 userInfo:v13];
      (*((void (**)(id, void, void *))v11 + 2))(v11, 0, v14);
    }
  }
}

- (void)fetchRelatedPlacesMapItemsForMapItem:(id)a3 relatedPlaceListType:(int)a4 options:(id)a5 source:(unint64_t)a6 handler:(id)a7
{
  id v12 = a3;
  id v13 = a5;
  id v14 = a7;
  if (v14)
  {
    if (v12)
    {
      uint64_t v15 = [v12 geoMapItemHandle];
      v19[0] = _NSConcreteStackBlock;
      v19[1] = 3221225472;
      v19[2] = sub_10000FDD4;
      void v19[3] = &unk_1000248A8;
      v19[4] = self;
      int v23 = a4;
      id v20 = v13;
      unint64_t v22 = a6;
      id v21 = v14;
      [(RTHelperService *)self fetchGeoMapItemFromHandle:v15 options:v20 handler:v19];
    }
    else
    {
      uint64_t v16 = RTErrorDomain;
      NSErrorUserInfoKey v24 = NSLocalizedDescriptionKey;
      CFStringRef v25 = @"requires a map item.";
      id v17 = +[NSDictionary dictionaryWithObjects:&v25 forKeys:&v24 count:1];
      SEL v18 = +[NSError errorWithDomain:v16 code:7 userInfo:v17];
      (*((void (**)(id, void, void *))v14 + 2))(v14, 0, v18);
    }
  }
}

- (void)fetchRelatedPlacesMapItemsForGEOMapItem:(id)a3 relatedPlaceListType:(int)a4 options:(id)a5 source:(unint64_t)a6 handler:(id)a7
{
  uint64_t v9 = *(void *)&a4;
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_10000FEC8;
  v13[3] = &unk_1000247E8;
  id v14 = self;
  id v15 = a5;
  id v16 = a7;
  unint64_t v17 = a6;
  id v11 = v16;
  id v12 = v15;
  [(RTHelperService *)v14 _relatedPlacesMapItemsIdentifiersForGEOMapItem:a3 relatedPlaceListType:v9 handler:v13];
}

- (void)fetchMapItemsFromLocations:(id)a3 accessPoints:(id)a4 startDate:(id)a5 endDate:(id)a6 options:(id)a7 handler:(id)a8
{
  id v15 = a3;
  id v16 = a4;
  id v17 = a5;
  id v18 = a6;
  id v19 = a7;
  id v20 = a8;
  if (v20)
  {
    if ([v15 count])
    {
      aSelector = a2;
      v50 = v20;
      v51 = v18;
      id v21 = v19;
      v52 = v17;
      unint64_t v22 = +[NSMutableArray arrayWithCapacity:](NSMutableArray, "arrayWithCapacity:", [v15 count]);
      long long v72 = 0u;
      long long v73 = 0u;
      long long v74 = 0u;
      long long v75 = 0u;
      id v54 = v15;
      id v23 = v15;
      id v24 = [v23 countByEnumeratingWithState:&v72 objects:v87 count:16];
      if (v24)
      {
        id v25 = v24;
        uint64_t v26 = *(void *)v73;
        do
        {
          SEL v27 = 0;
          do
          {
            if (*(void *)v73 != v26) {
              objc_enumerationMutation(v23);
            }
            id v28 = [objc_alloc((Class)GEOLocation) initWithRTLocation:*(void *)(*((void *)&v72 + 1) + 8 * (void)v27) includeTimeStamp:0];
            if (v28) {
              [v22 addObject:v28];
            }

            SEL v27 = (char *)v27 + 1;
          }
          while (v25 != v27);
          id v25 = [v23 countByEnumeratingWithState:&v72 objects:v87 count:16];
        }
        while (v25);
      }
      v57 = self;

      CFStringRef v29 = +[NSMutableArray arrayWithCapacity:](NSMutableArray, "arrayWithCapacity:", [v16 count]);
      long long v68 = 0u;
      long long v69 = 0u;
      long long v70 = 0u;
      long long v71 = 0u;
      id v53 = v16;
      id v30 = v16;
      id v31 = [v30 countByEnumeratingWithState:&v68 objects:v86 count:16];
      if (v31)
      {
        id v32 = v31;
        uint64_t v33 = *(void *)v69;
        do
        {
          unint64_t v34 = 0;
          do
          {
            if (*(void *)v69 != v33) {
              objc_enumerationMutation(v30);
            }
            id v35 = [objc_alloc((Class)GEOWifiAccessPoint) initWithRTWiFiAccessPoint:*(void *)(*((void *)&v68 + 1) + 8 * (void)v34) includeTimeStamp:0];
            if (v35) {
              [v29 addObject:v35];
            }

            unint64_t v34 = (char *)v34 + 1;
          }
          while (v32 != v34);
          id v32 = [v30 countByEnumeratingWithState:&v68 objects:v86 count:16];
        }
        while (v32);
      }

      v55 = v21;
      v36 = [(RTHelperService *)v57 defaultTraitsForOptions:v21 selector:"ticketForWifiFingerprintWithLocations:wifiAccessPoints:maxLabels:entryTime:exitTime:traits:"];
      v37 = [(GEOMapService *)v57->_geoMapService ticketForWifiFingerprintWithLocations:v22 wifiAccessPoints:v29 maxLabels:50 entryTime:0 exitTime:0 traits:v36];
      v38 = sub_1000071D0(&qword_10002D3A0);
      if (os_log_type_enabled(v38, OS_LOG_TYPE_INFO))
      {
        v49 = NSStringFromSelector(aSelector);
        v48 = [v23 firstObject];
        id v39 = [v23 count];
        v40 = v37;
        id v41 = [v30 count];
        unsigned int v42 = [v55 useBackgroundTraits];
        *(_DWORD *)buf = 138413314;
        v77 = v49;
        __int16 v78 = 2112;
        v79 = v48;
        __int16 v80 = 2048;
        id v81 = v39;
        __int16 v82 = 2048;
        id v83 = v41;
        v37 = v40;
        __int16 v84 = 1024;
        unsigned int v85 = v42;
        _os_log_impl((void *)&_mh_execute_header, v38, OS_LOG_TYPE_INFO, "%@, fetch mapItems from bluePoi, location, %@, locations, %lu, accessPoints, %lu, background, %d", buf, 0x30u);
      }
      v43 = objc_opt_new();
      v58[0] = _NSConcreteStackBlock;
      v58[1] = 3221225472;
      v58[2] = sub_10001046C;
      v58[3] = &unk_100024920;
      v58[4] = v57;
      id v17 = v52;
      id v59 = v52;
      id v18 = v51;
      id v60 = v51;
      id v61 = v43;
      v67 = aSelector;
      id v62 = v23;
      id v63 = v30;
      id v66 = v50;
      id v19 = v55;
      id v64 = v55;
      id v65 = v36;
      id v44 = v36;
      id v45 = v43;
      id v20 = v50;
      id v46 = v45;
      [v37 submitWithHandler:v58 networkActivity:0];

      id v16 = v53;
      id v15 = v54;
    }
    else
    {
      uint64_t v47 = RTErrorDomain;
      NSErrorUserInfoKey v88 = NSLocalizedDescriptionKey;
      CFStringRef v89 = @"requires valid locations.";
      unint64_t v22 = +[NSDictionary dictionaryWithObjects:&v89 forKeys:&v88 count:1];
      CFStringRef v29 = +[NSError errorWithDomain:v47 code:7 userInfo:v22];
      (*((void (**)(id, void, void *))v20 + 2))(v20, 0, v29);
    }
  }
}

- (void)fetchMapItemsFromAddressString:(id)a3 options:(id)a4 handler:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  if (v11)
  {
    if (v9)
    {
      id v12 = [(RTHelperService *)self defaultTraitsForOptions:v10 selector:"ticketForForwardGeocodeString:maxResults:traits:"];
      id v13 = [(GEOMapService *)self->_geoMapService ticketForForwardGeocodeString:v9 maxResults:5 traits:v12];
      v16[0] = _NSConcreteStackBlock;
      v16[1] = 3221225472;
      v16[2] = sub_100010B4C;
      v16[3] = &unk_100024830;
      v16[4] = self;
      SEL v21 = a2;
      id v17 = v9;
      id v20 = v11;
      id v18 = v10;
      id v19 = v12;
      id v14 = v12;
      [v13 submitWithHandler:v16 networkActivity:0];
    }
    else
    {
      uint64_t v15 = RTErrorDomain;
      NSErrorUserInfoKey v22 = NSLocalizedDescriptionKey;
      CFStringRef v23 = @"requires a valid addressString.";
      id v13 = +[NSDictionary dictionaryWithObjects:&v23 forKeys:&v22 count:1];
      id v14 = +[NSError errorWithDomain:v15 code:7 userInfo:v13];
      (*((void (**)(id, void, id))v11 + 2))(v11, 0, v14);
    }
  }
}

- (void)fetchMapItemsFromAddressDictionary:(id)a3 options:(id)a4 handler:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  if (v11)
  {
    if ([v9 count])
    {
      id v12 = v9;
      if (+[RTMapItem addressDictionaryContainsContactsKeys:v12])
      {
        uint64_t v13 = +[RTMapItem convertAddressDictionaryFromContactsToGeoServices:v12];

        id v12 = (id)v13;
      }
      id v14 = [(RTHelperService *)self defaultTraitsForOptions:v10 selector:"ticketForForwardGeocodeAddressDictionary:maxResults:traits:"];
      uint64_t v15 = [(GEOMapService *)self->_geoMapService ticketForForwardGeocodeAddressDictionary:v12 maxResults:5 traits:v14];
      v19[0] = _NSConcreteStackBlock;
      v19[1] = 3221225472;
      v19[2] = sub_1000110D4;
      void v19[3] = &unk_100024830;
      SEL v24 = a2;
      v19[4] = self;
      id v20 = v12;
      id v23 = v11;
      id v21 = v10;
      id v22 = v14;
      id v16 = v14;
      id v17 = v12;
      [v15 submitWithHandler:v19 networkActivity:0];
    }
    else
    {
      uint64_t v18 = RTErrorDomain;
      NSErrorUserInfoKey v25 = NSLocalizedDescriptionKey;
      CFStringRef v26 = @"requires a valid addressDictionary.";
      uint64_t v15 = +[NSDictionary dictionaryWithObjects:&v26 forKeys:&v25 count:1];
      id v17 = +[NSError errorWithDomain:v18 code:7 userInfo:v15];
      (*((void (**)(id, void, id))v11 + 2))(v11, 0, v17);
    }
  }
}

- (void)fetchPostalAddressForMapItem:(id)a3 options:(id)a4 handler:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if (v10)
  {
    if (v8)
    {
      id v11 = [v8 geoMapItemHandle];
      v15[0] = _NSConcreteStackBlock;
      v15[1] = 3221225472;
      v15[2] = sub_1000115AC;
      v15[3] = &unk_100024948;
      v15[4] = self;
      id v16 = v10;
      [(RTHelperService *)self fetchGeoMapItemFromHandle:v11 options:v9 handler:v15];

      id v12 = v16;
    }
    else
    {
      uint64_t v13 = RTErrorDomain;
      NSErrorUserInfoKey v17 = NSLocalizedDescriptionKey;
      CFStringRef v18 = @"requires a valid map item.";
      id v14 = +[NSDictionary dictionaryWithObjects:&v18 forKeys:&v17 count:1];
      id v12 = +[NSError errorWithDomain:v13 code:7 userInfo:v14];

      (*((void (**)(id, void, void *))v10 + 2))(v10, 0, v12);
    }
  }
}

- (void)fetchAppClipURLsForMapItem:(id)a3 options:(id)a4 handler:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if (v10)
  {
    if (v8)
    {
      id v11 = [v8 geoMapItemHandle];
      v15[0] = _NSConcreteStackBlock;
      v15[1] = 3221225472;
      v15[2] = sub_1000117F4;
      v15[3] = &unk_100024750;
      id v16 = v10;
      [(RTHelperService *)self fetchGeoMapItemFromHandle:v11 options:v9 handler:v15];

      id v12 = v16;
    }
    else
    {
      uint64_t v13 = RTErrorDomain;
      NSErrorUserInfoKey v17 = NSLocalizedDescriptionKey;
      CFStringRef v18 = @"requires a valid map item.";
      id v14 = +[NSDictionary dictionaryWithObjects:&v18 forKeys:&v17 count:1];
      id v12 = +[NSError errorWithDomain:v13 code:7 userInfo:v14];

      (*((void (**)(id, void, void *))v10 + 2))(v10, 0, v12);
    }
  }
}

- (void)fetchCountryAndSubdivisionCodesFromLocation:(id)a3 options:(id)a4 handler:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  id v12 = objc_alloc_init((Class)GEOLatLng);
  [v9 latitude];
  objc_msgSend(v12, "setLat:");
  [v9 longitude];
  objc_msgSend(v12, "setLng:");
  uint64_t v13 = [(RTHelperService *)self defaultTraitsForOptions:v10 selector:"ticketForTerritoryForLocations:shiftLocationsIfNeeded:traits:"];
  geoMapService = self->_geoMapService;
  id v27 = v12;
  uint64_t v15 = +[NSArray arrayWithObjects:&v27 count:1];
  id v16 = [(GEOMapService *)geoMapService ticketForTerritoryForLocations:v15 shiftLocationsIfNeeded:1 traits:v13];

  v21[0] = _NSConcreteStackBlock;
  v21[1] = 3221225472;
  v21[2] = sub_100011BA0;
  v21[3] = &unk_100024830;
  v21[4] = self;
  id v22 = v9;
  id v25 = v11;
  SEL v26 = a2;
  id v23 = v10;
  id v24 = v13;
  id v17 = v13;
  id v18 = v10;
  id v19 = v11;
  id v20 = v9;
  [v16 submitWithHandler:v21 networkActivity:0];
}

- (id)_buildingPolygonsFromGEOBuilding:(id)a3
{
  id v3 = a3;
  id v4 = [v3 sections];
  id v5 = [v4 count];

  if (v5)
  {
    id v20 = (id)objc_opt_new();
    long long v21 = 0u;
    long long v22 = 0u;
    long long v23 = 0u;
    long long v24 = 0u;
    obj = [v3 sections];
    id v6 = [obj countByEnumeratingWithState:&v21 objects:v26 count:16];
    if (v6)
    {
      id v7 = v6;
      id v18 = v3;
      uint64_t v8 = *(void *)v22;
      do
      {
        for (i = 0; i != v7; i = (char *)i + 1)
        {
          if (*(void *)v22 != v8) {
            objc_enumerationMutation(obj);
          }
          id v10 = *(void **)(*((void *)&v21 + 1) + 8 * i);
          id v12 = objc_opt_new();
          if ([v10 coordinateCount])
          {
            uint64_t v13 = 0;
            unint64_t v14 = 0;
            do
            {
              id v15 = objc_msgSend(objc_alloc((Class)RTCoordinate), "initWithLatitude:longitude:", *(double *)((char *)objc_msgSend(v10, "coordinates") + v13), *(double *)((char *)objc_msgSend(v10, "coordinates") + v13 + 8));
              if (v15) {
                [v12 addObject:v15];
              }

              ++v14;
              v13 += 16;
            }
            while (v14 < (unint64_t)[v10 coordinateCount]);
          }
          id v16 = [objc_alloc((Class)RTPolygon) initWithVertices:v12];
          if (v16) {
            [v20 addObject:v16];
          }
        }
        id v7 = [obj countByEnumeratingWithState:&v21 objects:v26 count:16];
      }
      while (v7);
      id v3 = v18;
    }
  }
  else
  {
    obj = sub_1000071D0(&qword_10002D358);
    if (os_log_type_enabled(obj, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl((void *)&_mh_execute_header, obj, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: building.sections.count> 0", buf, 2u);
    }
    id v20 = 0;
  }

  return v20;
}

- (void)fetchBuildingPolygonsFromLocation:(id)a3 radius:(double)a4 handler:(id)a5
{
  id v9 = a3;
  id v10 = a5;
  if (v10)
  {
    if (v9 && a4 > 0.0)
    {
      v30[0] = _NSConcreteStackBlock;
      v30[1] = 3221225472;
      v30[2] = sub_1000123D4;
      v30[3] = &unk_100024970;
      v30[4] = self;
      id v11 = (id)objc_opt_new();
      id v31 = v11;
      id v12 = objc_retainBlock(v30);
      v24[0] = _NSConcreteStackBlock;
      v24[1] = 3221225472;
      v24[2] = sub_100012438;
      v24[3] = &unk_100024998;
      SEL v28 = a2;
      id v13 = v9;
      double v29 = a4;
      id v25 = v13;
      id v26 = v11;
      id v27 = v10;
      id v14 = v11;
      id v15 = objc_retainBlock(v24);
      [v13 latitude];
      double v17 = v16;
      [v13 longitude];
      id v19 = -[GEOMapFeatureAccess findBuildingsNear:radius:handler:completionHandler:](self->_mapFeatureAccess, "findBuildingsNear:radius:handler:completionHandler:", v12, v15, v17, v18, a4);
    }
    else
    {
      id v20 = NSStringFromSelector(a2);
      id v14 = +[NSString stringWithFormat:@"invalid parameters passed to %@, location, %@, radius, %.2f", v20, v9, *(void *)&a4];

      uint64_t v21 = RTErrorDomain;
      NSErrorUserInfoKey v32 = NSLocalizedDescriptionKey;
      id v33 = v14;
      long long v22 = +[NSDictionary dictionaryWithObjects:&v33 forKeys:&v32 count:1];
      long long v23 = +[NSError errorWithDomain:v21 code:7 userInfo:v22];
      (*((void (**)(id, void, void *))v10 + 2))(v10, 0, v23);
    }
  }
}

- (void)fetchPointOfInterestAttributesWithIdentifier:(unint64_t)a3 options:(id)a4 handler:(id)a5
{
  id v9 = a4;
  id v10 = a5;
  if (v10)
  {
    id v11 = [(RTHelperService *)self defaultTraitsForOptions:v9 selector:"fetchPointOfInterestAttributesWithIdentifier:options:handler:"];
    geoMapService = self->_geoMapService;
    id v13 = +[NSNumber numberWithUnsignedInteger:a3];
    uint64_t v21 = v13;
    id v14 = +[NSArray arrayWithObjects:&v21 count:1];
    id v15 = [(GEOMapService *)geoMapService ticketForMUIDs:v14 traits:v11];

    v16[0] = _NSConcreteStackBlock;
    v16[1] = 3221225472;
    v16[2] = sub_1000128C4;
    v16[3] = &unk_100024A08;
    SEL v19 = a2;
    unint64_t v20 = a3;
    id v18 = v10;
    v16[4] = self;
    id v17 = v9;
    [v15 submitWithHandler:v16 networkActivity:0];
  }
}

- (void)fetchPointOfInterestsAroundCoordinate:(id)a3 radius:(double)a4 options:(id)a5 handler:(id)a6
{
  id v10 = a6;
  if (v10)
  {
    id v11 = a3;
    id v12 = [(RTHelperService *)self defaultTraitsForOptions:a5 selector:"fetchPointOfInterestsAroundCoordinate:radius:options:handler:"];
    [v11 latitude];
    double v14 = v13;
    [v11 longitude];
    double v16 = v15;

    id v17 = objc_msgSend(objc_alloc((Class)GEOSpatialLookupParameters), "initWithCoordinate:radius:categories:", &__NSArray0__struct, v14, v16, a4);
    geoMapService = self->_geoMapService;
    id v30 = v17;
    SEL v19 = +[NSArray arrayWithObjects:&v30 count:1];
    unint64_t v20 = [(GEOMapService *)geoMapService ticketForSpatialLookupParameters:v19 traits:v12];

    v24[0] = _NSConcreteStackBlock;
    v24[1] = 3221225472;
    v24[2] = sub_10001326C;
    v24[3] = &unk_100024A58;
    id v28 = v12;
    id v29 = v10;
    id v25 = v20;
    id v26 = v17;
    id v27 = self;
    id v21 = v12;
    id v22 = v17;
    id v23 = v20;
    [v23 submitWithHandler:v24 networkActivity:0];
  }
}

- (void)createMapItemWithIdentifier:(id)a3 geoMapItemStorage:(id)a4 source:(unint64_t)a5 creationDate:(id)a6 handler:(id)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a6;
  double v15 = (void (**)(id, id, void))a7;
  if (v12)
  {
    if (v13) {
      goto LABEL_3;
    }
  }
  else
  {
    id v27 = sub_1000071D0(&qword_10002D358);
    if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      id v44 = "-[RTHelperService createMapItemWithIdentifier:geoMapItemStorage:source:creationDate:handler:]";
      __int16 v45 = 1024;
      int v46 = 1336;
      _os_log_error_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: identifier (in %s:%d)", buf, 0x12u);
    }

    if (v13)
    {
LABEL_3:
      if (v14) {
        goto LABEL_4;
      }
      goto LABEL_15;
    }
  }
  id v28 = sub_1000071D0(&qword_10002D358);
  if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 136315394;
    id v44 = "-[RTHelperService createMapItemWithIdentifier:geoMapItemStorage:source:creationDate:handler:]";
    __int16 v45 = 1024;
    int v46 = 1337;
    _os_log_error_impl((void *)&_mh_execute_header, v28, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: geoMapItemStorage (in %s:%d)", buf, 0x12u);
  }

  if (v14)
  {
LABEL_4:
    if (v15) {
      goto LABEL_5;
    }
    goto LABEL_18;
  }
LABEL_15:
  id v29 = sub_1000071D0(&qword_10002D358);
  if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 136315394;
    id v44 = "-[RTHelperService createMapItemWithIdentifier:geoMapItemStorage:source:creationDate:handler:]";
    __int16 v45 = 1024;
    int v46 = 1338;
    _os_log_error_impl((void *)&_mh_execute_header, v29, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: creationDate (in %s:%d)", buf, 0x12u);
  }

  if (v15)
  {
LABEL_5:
    if (v12)
    {
      if (v13)
      {
        if (v14)
        {
          double v16 = [(GEOMapService *)self->_geoMapService handleForMapItem:v13];
          id v17 = objc_alloc((Class)NSString);
          id v18 = [v17 initWithCString:off_10002D3D8 encoding:1];
          CFStringRef v35 = @"geoMapItemHandleSize";
          SEL v19 = +[NSNumber numberWithUnsignedInteger:[v16 length]];
          v36 = v19;
          unint64_t v20 = +[NSDictionary dictionaryWithObjects:&v36 forKeys:&v35 count:1];
          sub_100004BE4(v18, v20);

          id v21 = +[NSString stringWithFormat:@"com.apple.%@", v18];
          CFStringRef v33 = @"geoMapItemHandleSize";
          id v22 = +[NSNumber numberWithUnsignedInteger:[v16 length]];
          unint64_t v34 = v22;
          id v23 = +[NSDictionary dictionaryWithObjects:&v34 forKeys:&v33 count:1];
          AnalyticsSendEvent();

          id v24 = objc_alloc((Class)RTMapItem);
          id v25 = [v14 dateByAddingTimeInterval:4838400.0];
          id v26 = [v24 initWithIdentifier:v12 geoMapItem:v13 geoMapItemHandle:v16 source:a5 creationDate:v14 expirationDate:v25];

          v15[2](v15, v26, 0);
LABEL_24:

          goto LABEL_25;
        }
        uint64_t v30 = RTErrorDomain;
        NSErrorUserInfoKey v37 = NSLocalizedDescriptionKey;
        CFStringRef v38 = @"requires a valid creationDate.";
        id v31 = &v38;
        NSErrorUserInfoKey v32 = &v37;
      }
      else
      {
        uint64_t v30 = RTErrorDomain;
        NSErrorUserInfoKey v39 = NSLocalizedDescriptionKey;
        CFStringRef v40 = @"requires a valid geoMapItemStorage.";
        id v31 = &v40;
        NSErrorUserInfoKey v32 = &v39;
      }
    }
    else
    {
      uint64_t v30 = RTErrorDomain;
      NSErrorUserInfoKey v41 = NSLocalizedDescriptionKey;
      CFStringRef v42 = @"requires a valid identifier.";
      id v31 = &v42;
      NSErrorUserInfoKey v32 = &v41;
    }
    double v16 = +[NSDictionary dictionaryWithObjects:v31 forKeys:v32 count:1];
    id v26 = +[NSError errorWithDomain:v30 code:7 userInfo:v16];
    ((void (**)(id, id, id))v15)[2](v15, 0, v26);
    goto LABEL_24;
  }
LABEL_18:
  double v16 = sub_1000071D0(&qword_10002D358);
  if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 136315394;
    id v44 = "-[RTHelperService createMapItemWithIdentifier:geoMapItemStorage:source:creationDate:handler:]";
    __int16 v45 = 1024;
    int v46 = 1339;
    _os_log_error_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: handler (in %s:%d)", buf, 0x12u);
  }
LABEL_25:
}

- (double)confidenceWeightForGeoMapItem:(id)a3 startDate:(id)a4 endDate:(id)a5 timeZone:(id)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  double v15 = 1.0;
  if (v14 && ([v12 isAfterDate:v13] & 1) == 0)
  {
    double v16 = [v11 _businessHours];
    [(RTHelperService *)self weightBasedOnBusinessHours:v16 startDate:v12 endDate:v13 timeZone:v14];
    double v18 = v17;

    SEL v19 = [v11 _poiCategory];
    [(RTHelperService *)self weightBasedOnDurationWithStartDate:v12 endDate:v13 timeZone:v14 poiCategory:v19];
    double v21 = v20;

    double v15 = v18 * v21;
    id v22 = sub_1000071D0(&qword_10002D3A0);
    if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
    {
      id v23 = NSStringFromSelector(a2);
      int v25 = 138414082;
      id v26 = v23;
      __int16 v27 = 2048;
      double v28 = v18 * v21;
      __int16 v29 = 2048;
      double v30 = v18;
      __int16 v31 = 2048;
      double v32 = v21;
      __int16 v33 = 2048;
      id v34 = [v11 _muid];
      __int16 v35 = 2112;
      id v36 = v12;
      __int16 v37 = 2112;
      id v38 = v13;
      __int16 v39 = 2112;
      id v40 = v14;
      _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_INFO, "%@, weight, %.1f, weightBasedOnBusinessHours, %.1f, weightBasedOnDuration, %.1f, muid, %lu, start, %@, end, %@, timeZone, %@", (uint8_t *)&v25, 0x52u);
    }
  }

  return v15;
}

- (double)weightBasedOnBusinessHours:(id)a3 startDate:(id)a4 endDate:(id)a5 timeZone:(id)a6
{
  id v11 = a3;
  id v32 = a4;
  id v31 = a5;
  id v12 = a6;
  long long v33 = 0u;
  long long v34 = 0u;
  long long v35 = 0u;
  long long v36 = 0u;
  id v13 = v11;
  id v14 = [v13 countByEnumeratingWithState:&v33 objects:v49 count:16];
  if (v14)
  {
    id v15 = v14;
    aSelector = a2;
    char v16 = 0;
    uint64_t v17 = *(void *)v34;
LABEL_3:
    uint64_t v18 = 0;
    while (1)
    {
      if (*(void *)v34 != v17) {
        objc_enumerationMutation(v13);
      }
      SEL v19 = *(void **)(*((void *)&v33 + 1) + 8 * v18);
      if ([v19 hoursType] == (id)4 || objc_msgSend(v19, "hoursType") == (id)3) {
        break;
      }
      double v20 = [v19 placeDailyNormalizedHours];
      id v21 = [v20 count];

      if (v21)
      {
        if ([(RTHelperService *)self insideBusinessHours:v19 date:v32 timeZone:v12]&& [(RTHelperService *)self insideBusinessHours:v19 date:v31 timeZone:v12])
        {

          double v22 = 1.0;
          goto LABEL_26;
        }
        char v16 = 1;
      }
      if (v15 == (id)++v18)
      {
        id v15 = [v13 countByEnumeratingWithState:&v33 objects:v49 count:16];
        if (v15) {
          goto LABEL_3;
        }

        double v22 = 0.0;
        if (v16)
        {
LABEL_26:
          int v23 = 1;
        }
        else
        {
          int v23 = 0;
          double v22 = 1.0;
        }
        a2 = aSelector;
        goto LABEL_20;
      }
    }
    id v24 = sub_1000071D0(&qword_10002D3A0);
    if (os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
    {
      int v25 = NSStringFromSelector(aSelector);
      *(_DWORD *)buf = 138412290;
      id v38 = v25;
      _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_INFO, "%@, business is permanently/temporarily closed", buf, 0xCu);
    }
    double v22 = 0.0;
    id v26 = v13;
  }
  else
  {

    int v23 = 0;
    double v22 = 1.0;
LABEL_20:
    id v26 = sub_1000071D0(&qword_10002D3A0);
    if (os_log_type_enabled(v26, OS_LOG_TYPE_INFO))
    {
      __int16 v27 = NSStringFromSelector(a2);
      CFStringRef v28 = @"NO";
      *(_DWORD *)buf = 138413570;
      __int16 v39 = 2048;
      id v38 = v27;
      if (v23) {
        CFStringRef v28 = @"YES";
      }
      double v40 = v22;
      __int16 v41 = 2112;
      CFStringRef v42 = v28;
      __int16 v43 = 2112;
      id v44 = v32;
      __int16 v45 = 2112;
      id v46 = v31;
      __int16 v47 = 2112;
      id v48 = v12;
      _os_log_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_INFO, "%@, weight, %.1f, businessHoursAvailable, %@, start, %@, end, %@, timeZone, %@", buf, 0x3Eu);
    }
  }

  return v22;
}

- (double)weightBasedOnDurationWithStartDate:(id)a3 endDate:(id)a4 timeZone:(id)a5 poiCategory:(id)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  [v12 timeIntervalSinceDate:v11];
  if (v15 >= 60.0)
  {
    char v16 = +[NSCalendar currentCalendar];
    [v16 setTimeZone:v13];
    SEL v19 = [v16 components:736 fromDate:v11];
    double v20 = [v16 components:736 fromDate:v12];
    id v44 = v19;
    id v21 = [v19 hour];
    id v22 = [v20 hour];
    [v12 timeIntervalSinceDate:v11];
    double v25 = v24;
    double v17 = 1.0;
    double v26 = 28800.0;
    if (v25 >= 28800.0)
    {
      unsigned __int8 v27 = [v14 isEqualToString:GEOPOICategoryHotel];
      double v26 = 1.0;
      BOOL v28 = (unint64_t)v22 <= 0x14 && (unint64_t)v21 >= 7;
      double v23 = 0.0;
      if (v28) {
        double v23 = 1.0;
      }
      if (v27) {
        double v17 = 1.0;
      }
      else {
        double v17 = v23;
      }
    }
    __int16 v29 = -[NSDictionary objectForKey:](self->_bluePOICategoryToDurationThresholdMapping, "objectForKey:", v14, v26, v23);

    if (v29)
    {
      double v30 = [(NSDictionary *)self->_bluePOICategoryToDurationThresholdMapping objectForKey:v14];
      id v31 = [v30 firstObject];

      id v32 = [(NSDictionary *)self->_bluePOICategoryToDurationThresholdMapping objectForKey:v14];
      long long v33 = [v32 lastObject];

      if ([v31 count])
      {
        __int16 v43 = a2;
        uint64_t v34 = 0;
        while (1)
        {
          long long v35 = objc_msgSend(v31, "objectAtIndexedSubscript:", v34, v43);
          [v35 doubleValue];
          double v37 = v36;

          if (v37 > v25) {
            break;
          }
          if (++v34 >= (unint64_t)[v31 count]) {
            goto LABEL_21;
          }
        }
        id v38 = [v33 objectAtIndexedSubscript:v34];
        [v38 doubleValue];
        double v17 = v17 * v39;

LABEL_21:
        a2 = v43;
      }
    }
    double v40 = sub_1000071D0(&qword_10002D3A0);
    if (os_log_type_enabled(v40, OS_LOG_TYPE_INFO))
    {
      __int16 v41 = NSStringFromSelector(a2);
      *(_DWORD *)buf = 138413570;
      id v46 = v41;
      __int16 v47 = 2048;
      double v48 = v17;
      __int16 v49 = 2112;
      id v50 = v11;
      __int16 v51 = 2112;
      id v52 = v12;
      __int16 v53 = 2048;
      double v54 = v25;
      __int16 v55 = 2112;
      id v56 = v14;
      _os_log_impl((void *)&_mh_execute_header, v40, OS_LOG_TYPE_INFO, "%@, weight, %.1f, startDate, %@, endDate, %@, duration, %.1f, poi category, %@", buf, 0x3Eu);
    }
  }
  else
  {
    char v16 = sub_1000071D0(&qword_10002D3A0);
    double v17 = 1.0;
    if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
    {
      uint64_t v18 = NSStringFromSelector(a2);
      *(_DWORD *)buf = 138412802;
      id v46 = v18;
      __int16 v47 = 2112;
      double v48 = *(double *)&v11;
      __int16 v49 = 2112;
      id v50 = v12;
      _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_INFO, "%@, skip duration filter, startDate, %@, endDate, %@", buf, 0x20u);
    }
  }

  return v17;
}

- (BOOL)insideBusinessHours:(id)a3 date:(id)a4 timeZone:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  id v10 = +[NSCalendar currentCalendar];
  id v61 = v9;
  [v10 setTimeZone:v9];
  id v60 = v10;
  id v62 = v8;
  id v11 = [v10 components:736 fromDate:v8];
  CFStringRef v12 = (const __CFString *)[v11 weekday];
  id v13 = [v11 hour];
  id v14 = [v11 minute];
  id v59 = v11;
  id v15 = [v11 second];
  long long v68 = 0u;
  long long v69 = 0u;
  long long v70 = 0u;
  long long v71 = 0u;
  id v58 = v7;
  char v16 = [v7 placeDailyNormalizedHours];
  id v17 = [v16 countByEnumeratingWithState:&v68 objects:v83 count:16];
  if (v17)
  {
    id v18 = v17;
    LOBYTE(v19) = 0;
    double v20 = (double)(uint64_t)v14 * 60.0 + (double)(uint64_t)v13 * 3600.0 + (double)(uint64_t)v15;
    uint64_t v21 = *(void *)v69;
    v57 = v16;
    uint64_t v51 = *(void *)v69;
    CFStringRef v52 = v12;
    do
    {
      id v22 = 0;
      id v53 = v18;
      do
      {
        if (*(void *)v69 != v21) {
          objc_enumerationMutation(v16);
        }
        double v23 = *(void **)(*((void *)&v68 + 1) + 8 * (void)v22);
        double v24 = sub_1000071D0(&qword_10002D3A0);
        if (os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
        {
          double v25 = NSStringFromSelector(a2);
          CFStringRef v26 = (const __CFString *)[v23 weekday];
          *(_DWORD *)buf = 138412802;
          long long v73 = v25;
          __int16 v74 = 2048;
          CFStringRef v75 = v26;
          __int16 v76 = 2048;
          CFStringRef v77 = v12;
          _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_INFO, "%@, normalizedHours weekday, %lu, compareDate weekday, %lu", buf, 0x20u);
        }
        if ([v23 weekday] == v12)
        {
          double v54 = v23;
          __int16 v55 = v22;
          BOOL v56 = v19;
          long long v66 = 0u;
          long long v67 = 0u;
          long long v64 = 0u;
          long long v65 = 0u;
          unsigned __int8 v27 = [v23 localTimeIntervals];
          id v28 = [v27 countByEnumeratingWithState:&v64 objects:v82 count:16];
          if (v28)
          {
            id v29 = v28;
            uint64_t v30 = *(void *)v65;
            while (2)
            {
              for (i = 0; i != v29; i = (char *)i + 1)
              {
                if (*(void *)v65 != v30) {
                  objc_enumerationMutation(v27);
                }
                id v32 = *(void **)(*((void *)&v64 + 1) + 8 * i);
                objc_msgSend(v32, "startTime", v51, v52);
                if (v33 + -1800.0 >= v20)
                {
                  BOOL v35 = 0;
                }
                else
                {
                  [v32 endTime];
                  BOOL v35 = v34 + 1800.0 > v20;
                }
                double v36 = sub_1000071D0(&qword_10002D3A0);
                if (os_log_type_enabled(v36, OS_LOG_TYPE_INFO))
                {
                  double v37 = NSStringFromSelector(a2);
                  if (v35) {
                    CFStringRef v38 = @"YES";
                  }
                  else {
                    CFStringRef v38 = @"NO";
                  }
                  [v32 startTime];
                  CFStringRef v40 = v39;
                  [v32 endTime];
                  *(_DWORD *)buf = 138413314;
                  long long v73 = v37;
                  __int16 v74 = 2112;
                  CFStringRef v75 = v38;
                  __int16 v76 = 2048;
                  CFStringRef v77 = v40;
                  __int16 v78 = 2048;
                  uint64_t v79 = v41;
                  __int16 v80 = 2048;
                  double v81 = v20;
                  _os_log_impl((void *)&_mh_execute_header, v36, OS_LOG_TYPE_INFO, "%@, result, %@, business hours start, %.1f, end, %.1f, compareTime, %.1f", buf, 0x34u);
                }
                if (v35)
                {

                  char v44 = 1;
                  id v46 = v57;
                  __int16 v45 = v58;
                  goto LABEL_42;
                }
              }
              id v29 = [v27 countByEnumeratingWithState:&v64 objects:v82 count:16];
              if (v29) {
                continue;
              }
              break;
            }
          }

          char v16 = v57;
          CFStringRef v12 = v52;
          id v18 = v53;
          LOBYTE(v19) = v56;
          uint64_t v21 = v51;
          double v23 = v54;
          id v22 = v55;
        }
        if (v19)
        {
          BOOL v19 = 1;
        }
        else
        {
          [v23 localTimeIntervals];
          v43 = CFStringRef v42 = v22;
          BOOL v19 = [v43 count] != 0;

          id v22 = v42;
        }
        id v22 = (char *)v22 + 1;
      }
      while (v22 != v18);
      id v18 = [v16 countByEnumeratingWithState:&v68 objects:v83 count:16];
    }
    while (v18);
  }
  else
  {
    BOOL v19 = 0;
  }

  char v44 = !v19;
  id v46 = sub_1000071D0(&qword_10002D3A0);
  if (os_log_type_enabled(v46, OS_LOG_TYPE_INFO))
  {
    __int16 v47 = NSStringFromSelector(a2);
    CFStringRef v48 = @"YES";
    *(_DWORD *)buf = 138412802;
    long long v73 = v47;
    if (v19) {
      CFStringRef v49 = @"NO";
    }
    else {
      CFStringRef v49 = @"YES";
    }
    CFStringRef v75 = v49;
    __int16 v74 = 2112;
    if (!v19) {
      CFStringRef v48 = @"NO";
    }
    __int16 v76 = 2112;
    CFStringRef v77 = v48;
    _os_log_impl((void *)&_mh_execute_header, v46, OS_LOG_TYPE_INFO, "%@, result, %@, hasHoursOnAnyDayThisWeek, %@", buf, 0x20u);
  }
  __int16 v45 = v58;
LABEL_42:

  return v44;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_bluePOICategoryToDurationThresholdMapping, 0);
  objc_storeStrong((id *)&self->_mapFeatureAccess, 0);
  objc_storeStrong((id *)&self->_tickets, 0);
  objc_storeStrong((id *)&self->_geoMapService, 0);
}

@end