@interface GEOLocationShiftServer
+ (id)identifier;
- (BOOL)handleIncomingMessage:(id)a3 withObject:(id)a4 fromPeer:(id)a5 signpostId:(unint64_t)a6;
- (GEOLocationShiftServer)initWithDaemon:(id)a3;
- (void)fetchCachedFunctionWithRequest:(id)a3;
- (void)flushDiskCacheWithRequest:(id)a3;
- (void)functionVersionWithRequest:(id)a3;
- (void)isEnabledWithRequest:(id)a3;
- (void)isRequiredForCoordinateWithRequest:(id)a3;
- (void)isRequiredForRegionWithRequest:(id)a3;
- (void)listDiskCacheWithRequest:(id)a3;
- (void)pruneDiskCacheWithRequest:(id)a3;
- (void)shiftCoordinateWithRequest:(id)a3;
@end

@implementation GEOLocationShiftServer

- (void)isEnabledWithRequest:(id)a3
{
  id v3 = a3;
  id v4 = [objc_alloc((Class)GEOLocationShiftingEnabledResponse) initWithRequest:v3];

  objc_msgSend(v4, "setEnabled:", objc_msgSend((id)objc_opt_class(), "isLocationShiftEnabled"));
  [v4 send];
}

- (BOOL)handleIncomingMessage:(id)a3 withObject:(id)a4 fromPeer:(id)a5 signpostId:(unint64_t)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  int v13 = sub_100008D68(v10);
  BOOL v14 = 0;
  if (v13 <= 1573)
  {
    if (v13 > 1408)
    {
      if (v13 == 1409)
      {
        BOOL v14 = 1;
        if (sub_100019858(v12, v11, @"locationshift", v10, &off_100077870, 1))
        {
          uint64_t v32 = objc_opt_class();
          v33 = sub_100008DBC(@"locationshift", v10, v11, v32, v12);
          v17 = v33;
          BOOL v14 = v33 != 0;
          if (v33)
          {
            [v33 setSignpostId:a6];
            [(GEOLocationShiftServer *)self flushDiskCacheWithRequest:v17];
            goto LABEL_35;
          }
          goto LABEL_36;
        }
      }
      else if (v13 == 1417)
      {
        BOOL v14 = 1;
        if (sub_100019858(v12, v11, @"locationshift", v10, &off_100077858, 1))
        {
          uint64_t v22 = objc_opt_class();
          v23 = sub_100008DBC(@"locationshift", v10, v11, v22, v12);
          v17 = v23;
          BOOL v14 = v23 != 0;
          if (v23)
          {
            [v23 setSignpostId:a6];
            [(GEOLocationShiftServer *)self pruneDiskCacheWithRequest:v17];
            goto LABEL_35;
          }
          goto LABEL_36;
        }
      }
    }
    else
    {
      if (v13 == 903)
      {
        uint64_t v28 = objc_opt_class();
        v29 = sub_100008DBC(@"locationshift", v10, v11, v28, v12);
        v17 = v29;
        BOOL v14 = v29 != 0;
        if (v29)
        {
          [v29 setSignpostId:a6];
          [(GEOLocationShiftServer *)self isEnabledWithRequest:v17];
          goto LABEL_35;
        }
        goto LABEL_36;
      }
      if (v13 == 1307)
      {
        BOOL v14 = 1;
        if (sub_100019858(v12, v11, @"locationshift", v10, &off_100077888, 1))
        {
          uint64_t v18 = objc_opt_class();
          v19 = sub_100008DBC(@"locationshift", v10, v11, v18, v12);
          v17 = v19;
          BOOL v14 = v19 != 0;
          if (v19)
          {
            [v19 setSignpostId:a6];
            [(GEOLocationShiftServer *)self listDiskCacheWithRequest:v17];
            goto LABEL_35;
          }
LABEL_36:
        }
      }
    }
  }
  else if (v13 <= 1927)
  {
    if (v13 == 1574)
    {
      uint64_t v30 = objc_opt_class();
      v31 = sub_100008DBC(@"locationshift", v10, v11, v30, v12);
      v17 = v31;
      BOOL v14 = v31 != 0;
      if (v31)
      {
        [v31 setSignpostId:a6];
        [(GEOLocationShiftServer *)self shiftCoordinateWithRequest:v17];
        goto LABEL_35;
      }
      goto LABEL_36;
    }
    if (v13 == 1612)
    {
      uint64_t v20 = objc_opt_class();
      v21 = sub_100008DBC(@"locationshift", v10, v11, v20, v12);
      v17 = v21;
      BOOL v14 = v21 != 0;
      if (v21)
      {
        [v21 setSignpostId:a6];
        [(GEOLocationShiftServer *)self functionVersionWithRequest:v17];
        goto LABEL_35;
      }
      goto LABEL_36;
    }
  }
  else
  {
    switch(v13)
    {
      case 1928:
        BOOL v14 = 1;
        if (sub_100019858(v12, v11, @"locationshift", v10, &off_1000778A0, 1))
        {
          uint64_t v24 = objc_opt_class();
          v25 = sub_100008DBC(@"locationshift", v10, v11, v24, v12);
          v17 = v25;
          BOOL v14 = v25 != 0;
          if (v25)
          {
            [v25 setSignpostId:a6];
            [(GEOLocationShiftServer *)self fetchCachedFunctionWithRequest:v17];
            goto LABEL_35;
          }
          goto LABEL_36;
        }
        break;
      case 1960:
        uint64_t v26 = objc_opt_class();
        v27 = sub_100008DBC(@"locationshift", v10, v11, v26, v12);
        v17 = v27;
        BOOL v14 = v27 != 0;
        if (v27)
        {
          [v27 setSignpostId:a6];
          [(GEOLocationShiftServer *)self isRequiredForRegionWithRequest:v17];
          goto LABEL_35;
        }
        goto LABEL_36;
      case 2380:
        uint64_t v15 = objc_opt_class();
        v16 = sub_100008DBC(@"locationshift", v10, v11, v15, v12);
        v17 = v16;
        BOOL v14 = v16 != 0;
        if (v16)
        {
          [v16 setSignpostId:a6];
          [(GEOLocationShiftServer *)self isRequiredForCoordinateWithRequest:v17];
LABEL_35:
          BOOL v14 = 1;
          goto LABEL_36;
        }
        goto LABEL_36;
    }
  }

  return v14;
}

+ (id)identifier
{
  return @"locationshift";
}

- (GEOLocationShiftServer)initWithDaemon:(id)a3
{
  v8.receiver = self;
  v8.super_class = (Class)GEOLocationShiftServer;
  id v3 = [(GEOLocationShiftServer *)&v8 initWithDaemon:a3];
  if (v3)
  {
    id v4 = (GEOLocationShifter *)objc_alloc_init((Class)GEOLocationShifter);
    shifter = v3->_shifter;
    v3->_shifter = v4;

    v6 = v3;
  }

  return v3;
}

- (void)shiftCoordinateWithRequest:(id)a3
{
  id v4 = a3;
  id v5 = [objc_alloc((Class)GEOLocationShiftingFunctionResponse) initWithRequest:v4];
  shifter = self->_shifter;
  v7 = [v4 latLng];
  objc_super v8 = [v4 preferredAuditToken];

  global_queue = (void *)geo_get_global_queue();
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_100024AC4;
  v11[3] = &unk_100072010;
  id v12 = v5;
  id v10 = v5;
  [(GEOLocationShifter *)shifter _fetchShiftFunctionForLatLng:v7 auditToken:v8 callbackQueue:global_queue completionHandler:v11];
}

- (void)fetchCachedFunctionWithRequest:(id)a3
{
  id v4 = a3;
  id v5 = [objc_alloc((Class)GEOLocationShiftingCachedResponseFetchResponse) initWithRequest:v4];
  shifter = self->_shifter;
  v7 = [v4 latLng];

  qos_class_self();
  global_queue = (void *)geo_get_global_queue();
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_100024C24;
  v10[3] = &unk_100072010;
  id v11 = v5;
  id v9 = v5;
  [(GEOLocationShifter *)shifter _fetchCachedShiftFunctionResponseForLocation:v7 callbackQueue:global_queue completionHandler:v10];
}

- (void)isRequiredForCoordinateWithRequest:(id)a3
{
  id v3 = a3;
  id v9 = [objc_alloc((Class)GEOLocationShiftingIsRequiredResponse) initWithRequest:v3];
  id v4 = objc_opt_class();
  [v3 coordinate];
  double v6 = v5;
  double v8 = v7;

  objc_msgSend(v9, "setRequired:", objc_msgSend(v4, "isLocationShiftRequiredForCoordinate:", v6, v8));
  [v9 send];
}

- (void)isRequiredForRegionWithRequest:(id)a3
{
  id v3 = a3;
  id v6 = [objc_alloc((Class)GEOLocationShiftingIsRequiredResponse) initWithRequest:v3];
  id v4 = objc_opt_class();
  double v5 = [v3 region];

  objc_msgSend(v6, "setRequired:", objc_msgSend(v4, "isLocationShiftRequiredForRegion:", v5));
  [v6 send];
}

- (void)functionVersionWithRequest:(id)a3
{
  id v3 = a3;
  id v4 = [objc_alloc((Class)GEOLocationShiftingVersionResponse) initWithRequest:v3];

  objc_msgSend(v4, "setVersion:", objc_msgSend((id)objc_opt_class(), "locationShiftFunctionVersion"));
  [v4 send];
}

- (void)pruneDiskCacheWithRequest:(id)a3
{
  id v3 = objc_opt_class();

  [v3 pruneDiskCache];
}

- (void)flushDiskCacheWithRequest:(id)a3
{
  id v3 = objc_opt_class();

  [v3 flushDiskCache];
}

- (void)listDiskCacheWithRequest:(id)a3
{
  id v4 = a3;
  id v5 = [objc_alloc((Class)GEOLocationShiftingListCacheResponse) initWithRequest:v4];

  qos_class_self();
  global_queue = geo_get_global_queue();
  double v7 = dispatch_group_create();
  double v8 = +[NSMutableArray array];
  shifter = self->_shifter;
  qos_class_self();
  id v10 = (void *)geo_get_global_queue();
  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472;
  v17[2] = sub_100025090;
  v17[3] = &unk_100072038;
  id v11 = v8;
  id v18 = v11;
  [(GEOLocationShifter *)shifter getAllShiftEntries:v7 queue:v10 handler:v17];

  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100025140;
  block[3] = &unk_100071888;
  id v15 = v5;
  id v16 = v11;
  id v12 = v11;
  id v13 = v5;
  dispatch_group_notify(v7, global_queue, block);
}

- (void).cxx_destruct
{
}

@end