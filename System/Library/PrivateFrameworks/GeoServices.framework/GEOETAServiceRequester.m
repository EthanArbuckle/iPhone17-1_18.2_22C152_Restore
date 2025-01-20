@interface GEOETAServiceRequester
+ (GEOETAServiceRequester)sharedRequester;
- (GEOETAServiceRequester)init;
- (id)_keyForRequest:(id)a3;
- (id)_validateResponse:(id)a3;
- (void)cancelRequest:(id)a3;
- (void)cancelSimpleETARequest:(id)a3;
- (void)startRequest:(id)a3 connectionProperties:(id)a4 traits:(id)a5 auditToken:(id)a6 willSendRequest:(id)a7 finished:(id)a8 networkActivity:(id)a9 error:(id)a10;
- (void)startSimpleETARequest:(id)a3 traits:(id)a4 auditToken:(id)a5 finished:(id)a6 networkActivity:(id)a7 error:(id)a8;
@end

@implementation GEOETAServiceRequester

+ (GEOETAServiceRequester)sharedRequester
{
  if (qword_100084990 != -1) {
    dispatch_once(&qword_100084990, &stru_1000736C0);
  }
  v2 = (void *)qword_100084988;

  return (GEOETAServiceRequester *)v2;
}

- (GEOETAServiceRequester)init
{
  v6.receiver = self;
  v6.super_class = (Class)GEOETAServiceRequester;
  v2 = [(GEOETAServiceRequester *)&v6 init];
  v3 = v2;
  if (v2) {
    v4 = v2;
  }

  return v3;
}

- (void)startSimpleETARequest:(id)a3 traits:(id)a4 auditToken:(id)a5 finished:(id)a6 networkActivity:(id)a7 error:(id)a8
{
  id v14 = a3;
  id v15 = a4;
  id v16 = a5;
  id v17 = a6;
  v18 = (void (**)(id, uint64_t))a7;
  id v19 = a8;
  if (v18) {
    v18[2](v18, 1);
  }
  v20 = GEOGreenTeaGetLog();
  if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO) && [v14 hasGreenTeaWithValue:1]) {
    GEOGreenTeaLog();
  }

  v21 = +[GEOExperimentConfiguration sharedConfiguration];
  v22 = [v21 _mapsAbClientMetadata];
  v23 = [v22 clientDatasetMetadata];
  [v14 setAbClientMetadata:v23];

  if (![v14 serviceTagsCount])
  {
    v24 = +[GEOGeoServiceTag defaultTag];
    [v14 addServiceTag:v24];
  }
  if (GEOConfigGetBOOL()) {
    GEOETARequestRemoveFieldsForSendingRequest();
  }
  v25 = objc_alloc_init(_GEOSimpleETARequestConfig);
  v29[0] = _NSConcreteStackBlock;
  v29[1] = 3221225472;
  v29[2] = sub_10004B808;
  v29[3] = &unk_100072F38;
  v30 = v18;
  id v31 = v17;
  id v32 = v19;
  id v26 = v19;
  id v27 = v17;
  v28 = v18;
  [(GEOETAServiceRequester *)self _startWithRequest:v14 traits:v15 auditToken:v16 config:v25 throttleToken:0 options:0 completionHandler:v29];
}

- (void)cancelSimpleETARequest:(id)a3
{
}

- (void)startRequest:(id)a3 connectionProperties:(id)a4 traits:(id)a5 auditToken:(id)a6 willSendRequest:(id)a7 finished:(id)a8 networkActivity:(id)a9 error:(id)a10
{
  id v14 = a3;
  id v15 = a7;
  id v16 = a8;
  id v17 = (void (**)(id, uint64_t))a9;
  id v18 = a10;
  id v19 = a6;
  id v20 = a5;
  v21 = +[GEOExperimentConfiguration sharedConfiguration];
  v22 = [v21 _mapsAbClientMetadata];
  v23 = [v22 clientDatasetMetadata];
  [v14 setAbClientMetadata:v23];

  v24 = +[GEOAdditionalEnabledMarkets additionalEnabledMarkets];
  [v14 setAdditionalEnabledMarkets:v24];

  if (![v14 serviceTagsCount])
  {
    v25 = +[GEOGeoServiceTag defaultTag];
    [v14 addServiceTag:v25];
  }
  v41[0] = _NSConcreteStackBlock;
  v41[1] = 3221225472;
  v41[2] = sub_10004BC1C;
  v41[3] = &unk_100073710;
  id v42 = v15;
  id v33 = v15;
  id v26 = objc_retainBlock(v41);
  v39[0] = _NSConcreteStackBlock;
  v39[1] = 3221225472;
  v39[2] = sub_10004BD7C;
  v39[3] = &unk_100073738;
  id v40 = v16;
  id v27 = v16;
  v28 = objc_retainBlock(v39);
  if (GEOConfigGetBOOL() && GEOETATrafficUpdateRequestHasSensitiveFields()) {
    [v14 clearSensitiveFields:0];
  }
  if (v17) {
    v17[2](v17, 1);
  }
  v29 = objc_alloc_init(_GEOTrafficUpdateETARequestConfig);
  v35[0] = _NSConcreteStackBlock;
  v35[1] = 3221225472;
  v35[2] = sub_10004BF24;
  v35[3] = &unk_100072F38;
  v36 = v17;
  id v37 = v18;
  id v38 = v28;
  v30 = v28;
  id v31 = v18;
  id v32 = v17;
  [(GEOETAServiceRequester *)self _startWithRequest:v14 traits:v20 auditToken:v19 config:v29 throttleToken:0 options:0 willSendRequestHandler:v26 completionHandler:v35];
}

- (id)_keyForRequest:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v5 = [v4 xpcUuid];
  }
  else
  {
    v8.receiver = self;
    v8.super_class = (Class)GEOETAServiceRequester;
    uint64_t v5 = [(GEOETAServiceRequester *)&v8 _keyForRequest:v4];
  }
  objc_super v6 = (void *)v5;

  return v6;
}

- (void)cancelRequest:(id)a3
{
  v3.receiver = self;
  v3.super_class = (Class)GEOETAServiceRequester;
  [(GEOETAServiceRequester *)&v3 _cancelRequest:a3];
}

- (id)_validateResponse:(id)a3
{
  id v3 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v4 = 0;
    goto LABEL_22;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    id v5 = +[NSString stringWithFormat:@"Response is of unexpected type %@", objc_opt_class()];
    GEOURLLogFacility();
    id v8 = objc_claimAutoreleasedReturnValue();
    [v8 UTF8String];
    v9 = GEOFindOrCreateLog();

    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      id v17 = v5;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_ERROR, "%@", buf, 0xCu);
    }

    id v4 = +[NSError GEOErrorWithCode:-13 reason:v5];
    goto LABEL_21;
  }
  id v5 = v3;
  int v6 = [v5 status];
  id v4 = 0;
  if (v6 > 19)
  {
    if (v6 != 20)
    {
      if (v6 == 60)
      {
        uint64_t v7 = -28;
        goto LABEL_17;
      }
LABEL_15:
      uint64_t v7 = -7;
      goto LABEL_17;
    }
  }
  else if (v6)
  {
    if (v6 == 1)
    {
      uint64_t v7 = -8;
      goto LABEL_17;
    }
    if (v6 == 5)
    {
      uint64_t v7 = -10;
LABEL_17:
      id v10 = [objc_alloc((Class)GEOETATrafficUpdateErrorInfo) initWithResponse:v5];
      if (v10)
      {
        v11 = +[GEOETATrafficUpdateErrorInfo key];
        id v14 = v11;
        id v15 = v10;
        v12 = +[NSDictionary dictionaryWithObjects:&v15 forKeys:&v14 count:1];
      }
      else
      {
        v12 = 0;
      }
      id v4 = +[NSError GEOErrorWithCode:v7 userInfo:v12];

      goto LABEL_21;
    }
    goto LABEL_15;
  }
LABEL_21:

LABEL_22:

  return v4;
}

@end