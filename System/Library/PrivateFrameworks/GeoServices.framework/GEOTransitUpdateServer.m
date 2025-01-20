@interface GEOTransitUpdateServer
+ (id)identifier;
- (BOOL)handleIncomingMessage:(id)a3 withObject:(id)a4 fromPeer:(id)a5 signpostId:(unint64_t)a6;
- (GEOTransitUpdateServer)initWithDaemon:(id)a3;
- (void)cancelTransitRouteUpdateRequestWithRequest:(id)a3;
- (void)startTransitRouteUpdateRequestWithRequest:(id)a3;
@end

@implementation GEOTransitUpdateServer

+ (id)identifier
{
  return @"TransitUpdate";
}

- (BOOL)handleIncomingMessage:(id)a3 withObject:(id)a4 fromPeer:(id)a5 signpostId:(unint64_t)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  int v13 = sub_100008D68(v10);
  if (v13 == 3238)
  {
    uint64_t v18 = objc_opt_class();
    v19 = sub_100008DBC(@"TransitUpdate", v10, v11, v18, v12);
    v16 = v19;
    BOOL v17 = v19 != 0;
    if (v19)
    {
      [v19 setSignpostId:a6];
      [(GEOTransitUpdateServer *)self cancelTransitRouteUpdateRequestWithRequest:v16];
      goto LABEL_7;
    }
  }
  else
  {
    if (v13 != 3182)
    {
      BOOL v17 = 0;
      goto LABEL_10;
    }
    uint64_t v14 = objc_opt_class();
    v15 = sub_100008DBC(@"TransitUpdate", v10, v11, v14, v12);
    v16 = v15;
    BOOL v17 = v15 != 0;
    if (v15)
    {
      [v15 setSignpostId:a6];
      [(GEOTransitUpdateServer *)self startTransitRouteUpdateRequestWithRequest:v16];
LABEL_7:
      BOOL v17 = 1;
    }
  }

LABEL_10:
  return v17;
}

- (GEOTransitUpdateServer)initWithDaemon:(id)a3
{
  v10.receiver = self;
  v10.super_class = (Class)GEOTransitUpdateServer;
  v3 = [(GEOTransitUpdateServer *)&v10 initWithDaemon:a3];
  if (v3)
  {
    uint64_t v4 = geo_isolater_create();
    isolater = v3->_isolater;
    v3->_isolater = (geo_isolater *)v4;

    v6 = (NSMutableSet *)objc_alloc_init((Class)NSMutableSet);
    originalRequests = v3->_originalRequests;
    v3->_originalRequests = v6;

    v8 = v3;
  }

  return v3;
}

- (void)startTransitRouteUpdateRequestWithRequest:(id)a3
{
  id v4 = a3;
  id v5 = [objc_alloc((Class)GEOTransitRouteUpdateReplySimple) initWithRequest:v4];
  v6 = [v4 request];

  if (v6)
  {
    uint64_t v14 = _NSConcreteStackBlock;
    uint64_t v15 = 3221225472;
    v16 = sub_100028D38;
    BOOL v17 = &unk_100071888;
    uint64_t v18 = self;
    id v19 = v4;
    geo_isolate_sync_data();
    v7 = +[GEOTransitUpdateServerRequester sharedRequester];
    v8 = [v19 request];
    v9 = [v19 preferredAuditToken];
    v11[0] = _NSConcreteStackBlock;
    v11[1] = 3221225472;
    v11[2] = sub_100028D98;
    v11[3] = &unk_1000722F0;
    v11[4] = self;
    id v12 = v19;
    id v13 = v5;
    [v7 startSimpleTransitRouteUpdateRequest:v8 auditToken:v9 networkActivity:0 completion:v11];
  }
  else
  {
    objc_super v10 = +[NSError GEOErrorWithCode:-10];
    [v5 setError:v10];

    [v5 send];
  }
}

- (void)cancelTransitRouteUpdateRequestWithRequest:(id)a3
{
  id v3 = a3;
  id v4 = [objc_alloc((Class)GEOTransitRouteUpdateReplySimple) initWithRequest:v3];
  id v5 = [v3 request];

  if (v5)
  {
    uint64_t v9 = 0;
    objc_super v10 = &v9;
    uint64_t v11 = 0x3032000000;
    id v12 = sub_100029090;
    id v13 = sub_1000290A0;
    id v14 = 0;
    id v8 = v3;
    geo_isolate_sync_data();
    if (v10[5])
    {
      v6 = +[GEOTransitUpdateServerRequester sharedRequester];
      [v6 cancelSimpleTransitRouteUpdateRequest:v10[5]];
    }
    _Block_object_dispose(&v9, 8);
  }
  else
  {
    v7 = +[NSError GEOErrorWithCode:-10];
    [v4 setError:v7];

    [v4 send];
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_originalRequests, 0);

  objc_storeStrong((id *)&self->_isolater, 0);
}

@end