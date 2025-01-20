@interface GEODirectionsRequesterLocalProxy
- (GEODirectionsRequesterLocalProxy)init;
- (id)_validateResponse:(id)a3;
- (void)cancelRequest:(id)a3;
- (void)startRequest:(id)a3 traits:(id)a4 auditToken:(id)a5 useBackgroundURL:(BOOL)a6 requestPriority:(id)a7 callbackQueue:(id)a8 finished:(id)a9 networkActivity:(id)a10 error:(id)a11;
@end

@implementation GEODirectionsRequesterLocalProxy

- (GEODirectionsRequesterLocalProxy)init
{
  v4.receiver = self;
  v4.super_class = (Class)GEODirectionsRequesterLocalProxy;
  v2 = [(GEODirectionsRequesterLocalProxy *)&v4 init];
  if (v2) {
    [(GEODirectionsRequesterLocalProxy *)v2 setOfflineOperationClass:objc_opt_class()];
  }
  return v2;
}

- (void)startRequest:(id)a3 traits:(id)a4 auditToken:(id)a5 useBackgroundURL:(BOOL)a6 requestPriority:(id)a7 callbackQueue:(id)a8 finished:(id)a9 networkActivity:(id)a10 error:(id)a11
{
  id v15 = a3;
  id v38 = a4;
  id v16 = a5;
  id v17 = a7;
  id v36 = a8;
  id v18 = a9;
  v19 = (void (**)(id, uint64_t))a10;
  id v20 = a11;
  if (v19) {
    v19[2](v19, 1);
  }
  v21 = GEOGreenTeaGetLog();
  if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO) && [v15 hasGreenTeaWithValue:1]) {
    GEOGreenTeaLog();
  }

  v37 = v17;
  id v22 = [objc_alloc((Class)objc_opt_class()) initWithRequest:v15 requestPriority:v17];
  v23 = +[GEOExperimentConfiguration sharedConfiguration];
  v24 = [v23 _mapsAbClientMetadata];
  v25 = [v24 clientDatasetMetadata];
  [v15 setAbClientMetadata:v25];

  v26 = [v16 bundleId];
  LODWORD(v23) = [v26 isEqualToString:MapsAppBundleId];

  if (v23)
  {
    id v27 = objc_alloc((Class)GEOLocalTime);
    v28 = +[NSDate date];
    id v29 = [v27 initWithDate:v28];
    v30 = [v15 clientCapabilities];
    [v30 setRequestTime:v29];
  }
  if (![v15 serviceTagsCount])
  {
    v31 = +[GEOGeoServiceTag defaultTag];
    [v15 addServiceTag:v31];
  }
  if (GEOConfigGetBOOL() && GEODirectionsRequestHasSensitiveFields()) {
    [v15 clearSensitiveFields:0];
  }
  v39[0] = _NSConcreteStackBlock;
  v39[1] = 3221225472;
  v39[2] = sub_100042040;
  v39[3] = &unk_100072F38;
  v40 = v19;
  id v41 = v18;
  id v42 = v20;
  id v32 = v20;
  id v33 = v18;
  v34 = v19;
  [(GEODirectionsRequesterLocalProxy *)self _startWithRequest:v15 traits:v38 auditToken:v16 config:v22 throttleToken:0 options:0 completionHandler:v39];
}

- (void)cancelRequest:(id)a3
{
}

- (id)_validateResponse:(id)a3
{
  id v3 = a3;
  id v4 = [objc_alloc((Class)GEODirectionsError) initWithResponse:v3];
  if (v4)
  {
    v5 = +[GEODirectionsError key];
    id v15 = v5;
    id v16 = v4;
    v6 = +[NSDictionary dictionaryWithObjects:&v16 forKeys:&v15 count:1];
  }
  else
  {
    v6 = 0;
  }
  int v7 = [v3 status];
  if (v7 > 4)
  {
    switch(v7)
    {
      case 60:
        uint64_t v8 = -28;
        goto LABEL_17;
      case 30:
        if ([v3 placeSearchResponsesCount] == (id)2)
        {
          v9 = [v3 placeSearchResponseAtIndex:0];
          unsigned int v10 = [v9 status];

          if (v10)
          {
            uint64_t v8 = -401;
            goto LABEL_17;
          }
          v13 = [v3 placeSearchResponseAtIndex:1];
          unsigned int v14 = [v13 status];

          if (v14)
          {
            uint64_t v8 = -402;
            goto LABEL_17;
          }
        }
        break;
      case 5:
        uint64_t v8 = -10;
LABEL_17:
        v11 = +[NSError GEOErrorWithCode:v8 userInfo:v6];
        goto LABEL_18;
    }
    goto LABEL_16;
  }
  if (v7)
  {
    if (v7 == 1)
    {
      uint64_t v8 = -8;
      goto LABEL_17;
    }
LABEL_16:
    uint64_t v8 = -7;
    goto LABEL_17;
  }
  v11 = 0;
LABEL_18:

  return v11;
}

@end