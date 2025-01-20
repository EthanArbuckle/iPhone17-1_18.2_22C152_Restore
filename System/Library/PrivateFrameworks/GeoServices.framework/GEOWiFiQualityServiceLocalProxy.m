@interface GEOWiFiQualityServiceLocalProxy
- (GEOWiFiQualityServiceLocalProxy)init;
- (void)cancelRequestId:(id)a3;
- (void)submitWiFiQualityServiceRequest:(id)a3 requestId:(id)a4 auditToken:(id)a5 completionQueue:(id)a6 completion:(id)a7;
- (void)submitWiFiQualityTileLoadForKey:(id)a3 eTag:(id)a4 requestId:(id)a5 auditToken:(id)a6 completionQueue:(id)a7 completion:(id)a8;
@end

@implementation GEOWiFiQualityServiceLocalProxy

- (GEOWiFiQualityServiceLocalProxy)init
{
  v8.receiver = self;
  v8.super_class = (Class)GEOWiFiQualityServiceLocalProxy;
  v2 = [(GEOWiFiQualityServiceLocalProxy *)&v8 init];
  if (v2)
  {
    uint64_t v3 = +[NSMutableDictionary dictionaryWithCapacity:1];
    inflightRequests = v2->_inflightRequests;
    v2->_inflightRequests = (NSMutableDictionary *)v3;

    uint64_t v5 = geo_isolater_create();
    inflightIsolater = v2->_inflightIsolater;
    v2->_inflightIsolater = (geo_isolater *)v5;
  }
  return v2;
}

- (void)submitWiFiQualityServiceRequest:(id)a3 requestId:(id)a4 auditToken:(id)a5 completionQueue:(id)a6 completion:(id)a7
{
  id v12 = a4;
  id v13 = a7;
  id v14 = a6;
  id v15 = a5;
  id v16 = a3;
  v17 = sub_1000388BC((id *)[GEOWiFiQualityServiceRequester alloc], v16, v15);

  v24 = _NSConcreteStackBlock;
  uint64_t v25 = 3221225472;
  v26 = sub_100027C4C;
  v27 = &unk_100071348;
  v28 = self;
  id v29 = v12;
  v30 = v17;
  v18 = v17;
  geo_isolate_sync();
  v21[0] = _NSConcreteStackBlock;
  v21[1] = 3221225472;
  v21[2] = sub_100027C5C;
  v21[3] = &unk_100072230;
  v21[4] = self;
  id v22 = v29;
  id v23 = v13;
  id v19 = v13;
  id v20 = v29;
  sub_100038968(v18, v14, v21);
}

- (void)submitWiFiQualityTileLoadForKey:(id)a3 eTag:(id)a4 requestId:(id)a5 auditToken:(id)a6 completionQueue:(id)a7 completion:(id)a8
{
  id v14 = a3;
  id v15 = a5;
  id v16 = a8;
  id v17 = a7;
  id v18 = a6;
  id v19 = a4;
  id v20 = sub_1000353A0((id *)[GEOWiFiQualityTileRequester alloc], v14, v19, v18);

  id v29 = _NSConcreteStackBlock;
  uint64_t v30 = 3221225472;
  v31 = sub_100027F14;
  v32 = &unk_100071348;
  v33 = self;
  id v34 = v15;
  v35 = v20;
  v21 = v20;
  geo_isolate_sync();
  v25[0] = _NSConcreteStackBlock;
  v25[1] = 3221225472;
  v25[2] = sub_100027F24;
  v25[3] = &unk_100072258;
  v25[4] = self;
  id v26 = v34;
  id v27 = v14;
  id v28 = v16;
  id v22 = v14;
  id v23 = v16;
  id v24 = v34;
  sub_100035460((uint64_t)v21, v17, v25);
}

- (void)cancelRequestId:(id)a3
{
  uint64_t v4 = 0;
  uint64_t v5 = &v4;
  uint64_t v6 = 0x3032000000;
  v7 = sub_100028138;
  objc_super v8 = sub_100028148;
  id v9 = 0;
  id v3 = a3;
  geo_isolate_sync();
  [(id)v5[5] cancel];

  _Block_object_dispose(&v4, 8);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_inflightIsolater, 0);

  objc_storeStrong((id *)&self->_inflightRequests, 0);
}

@end