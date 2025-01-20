@interface NMCRoutePlanningRouteRequestState
+ (int64_t)requiredInitialStateForRequest:(id)a3;
- (void)_launchMapsWithURL:(id)a3 companionRouteContext:(id)a4;
- (void)start;
@end

@implementation NMCRoutePlanningRouteRequestState

+ (int64_t)requiredInitialStateForRequest:(id)a3
{
  id v4 = a3;
  uint64_t v10 = 0;
  v11 = &v10;
  uint64_t v12 = 0x2020000000;
  char v13 = 1;
  v5 = [v4 waypoints];
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_10000BEC8;
  v9[3] = &unk_100081110;
  v9[4] = &v10;
  [v5 enumerateObjectsUsingBlock:v9];

  if (*((unsigned char *)v11 + 24))
  {
    int64_t v6 = 3;
  }
  else
  {
    v8.receiver = a1;
    v8.super_class = (Class)&OBJC_METACLASS___NMCRoutePlanningRouteRequestState;
    int64_t v6 = (int64_t)objc_msgSendSuper2(&v8, "requiredInitialStateForRequest:", v4);
  }
  _Block_object_dispose(&v10, 8);

  return v6;
}

- (void)start
{
  v3 = [(NanoRoutePlanningState *)self manager];
  id v4 = [v3 request];

  v5 = sub_100053DCC();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    int64_t v6 = [v4 waypoints];
    *(_DWORD *)buf = 138477827;
    *(void *)&buf[4] = v6;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "-start, will generate map-ish items for waypoints: %{private}@", buf, 0xCu);
  }
  v7 = [v4 waypoints];
  objc_super v8 = sub_100029020(v7, &stru_100081150);

  id v9 = [v8 count];
  uint64_t v10 = [v4 waypoints];
  id v11 = [v10 count];

  if (v9 == v11)
  {
    unsigned int v12 = [v4 transportType];
    if (v12 > 5) {
      uint64_t v13 = 1;
    }
    else {
      uint64_t v13 = qword_100064408[v12];
    }
    id v18 = [v4 departureDate];
    v19 = [v4 arrivalDate];
    v20 = [v4 companionRouteContext];
    if (v19)
    {
      id v21 = objc_alloc_init((Class)GEOURLTimePoint);
      [v21 setType:1];
      v22 = v19;
    }
    else
    {
      if (!v18)
      {
        id v26 = objc_alloc_init((Class)NSMutableDictionary);
LABEL_20:
        switch(v13)
        {
          case 1:
            [v26 setObject:MKLaunchOptionsDirectionsModeDriving forKeyedSubscript:MKLaunchOptionsDirectionsModeKey];
            v27 = [v4 automobileOptions];
            v28 = &MKLaunchOptionsAutomobileOptionsKey;
            goto LABEL_26;
          case 2:
            [v26 setObject:MKLaunchOptionsDirectionsModeWalking forKeyedSubscript:MKLaunchOptionsDirectionsModeKey];
            v27 = [v4 walkingOptions];
            v28 = &MKLaunchOptionsWalkingOptionsKey;
            goto LABEL_26;
          case 4:
            [v26 setObject:MKLaunchOptionsDirectionsModeTransit forKeyedSubscript:MKLaunchOptionsDirectionsModeKey];
            v27 = [v4 transitOptions];
            v28 = &MKLaunchOptionsTransitOptionsKey;
            goto LABEL_26;
          case 8:
            [v26 setObject:MKLaunchOptionsDirectionsModeCycling forKeyedSubscript:MKLaunchOptionsDirectionsModeKey];
            v27 = [v4 cyclingOptions];
            v28 = &MKLaunchOptionsCyclingOptionsKey;
LABEL_26:
            [v26 setObject:v27 forKeyedSubscript:*v28];

            break;
          default:
            [v26 setObject:MKLaunchOptionsDirectionsModeDefault forKeyedSubscript:MKLaunchOptionsDirectionsModeKey];
            break;
        }
        v29 = sub_100053DCC();
        if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138543362;
          *(void *)&buf[4] = v26;
          _os_log_impl((void *)&_mh_execute_header, v29, OS_LOG_TYPE_ERROR, "-start, launching Maps with a url and options %{public}@", buf, 0xCu);
        }

        v30 = +[MKMapItem urlForMapItems:v8 options:v26];
        [(NMCRoutePlanningRouteRequestState *)self _launchMapsWithURL:v30 companionRouteContext:v20];

        goto LABEL_30;
      }
      id v21 = objc_alloc_init((Class)GEOURLTimePoint);
      [v21 setType:0];
      v22 = v18;
    }
    [v22 timeIntervalSinceReferenceDate];
    objc_msgSend(v21, "setTime:");
    id v25 = objc_alloc_init((Class)NSMutableDictionary);
    id v26 = v25;
    if (v21)
    {
      [v25 setObject:v21 forKeyedSubscript:MKLaunchOptionsTimePointKey];
    }
    goto LABEL_20;
  }
  v14 = sub_100053DCC();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138477827;
    *(void *)&buf[4] = v8;
    _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_ERROR, "-start, only generated map-ish items: %{private}@", buf, 0xCu);
  }

  uint64_t v15 = sub_100013F14(4);
  v16 = (void *)v15;
  if (v15)
  {
    NSErrorUserInfoKey v34 = NSLocalizedDescriptionKey;
    *(void *)buf = v15;
    v17 = +[NSDictionary dictionaryWithObjects:buf forKeys:&v34 count:1];
  }
  else
  {
    v17 = 0;
  }
  v23 = +[NSError errorWithDomain:@"NanoRoutePlanningSession" code:4 userInfo:v17];

  v24 = [(NanoRoutePlanningState *)self manager];
  v31[0] = _NSConcreteStackBlock;
  v31[1] = 3221225472;
  v31[2] = sub_10000C698;
  v31[3] = &unk_100081178;
  v32 = v23;
  id v18 = v23;
  [v24 updateWithBlock:v31];

  v19 = v32;
LABEL_30:
}

- (void)_launchMapsWithURL:(id)a3 companionRouteContext:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  objc_super v8 = sub_100053DCC();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    id v9 = [v6 simpleDescription];
    *(_DWORD *)buf = 138412290;
    id v18 = v9;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "Will launch Maps to load directions with context %@", buf, 0xCu);
  }
  uint64_t v10 = +[MapsCompanionDaemonIPCInterface sharedInterface];
  id v11 = objc_alloc_init(IPCLoadDirectionsMessage);
  [(IPCLoadDirectionsMessage *)v11 setUrl:v7];

  [(IPCLoadDirectionsMessage *)v11 setOriginIsWatch:1];
  unsigned int v12 = [v6 data];
  [(IPCLoadDirectionsMessage *)v11 setRouteContextData:v12];

  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472;
  v14[2] = sub_10000C86C;
  v14[3] = &unk_1000811E0;
  id v15 = v6;
  v16 = self;
  id v13 = v6;
  [v10 loadDirections:v11 completion:v14];
}

@end