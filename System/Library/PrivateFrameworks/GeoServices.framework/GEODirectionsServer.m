@interface GEODirectionsServer
+ (id)identifier;
- (BOOL)handleIncomingMessage:(id)a3 withObject:(id)a4 fromPeer:(id)a5 signpostId:(unint64_t)a6;
- (id)serviceRequester;
- (void)cancelWithRequest:(id)a3;
- (void)startWithRequest:(id)a3;
@end

@implementation GEODirectionsServer

+ (id)identifier
{
  return @"directions";
}

- (id)serviceRequester
{
  serviceRequester = self->_serviceRequester;
  if (serviceRequester)
  {
    v3 = serviceRequester;
  }
  else
  {
    v3 = +[GEODirectionsRequester sharedRequester];
  }

  return v3;
}

- (void)startWithRequest:(id)a3
{
  id v4 = a3;
  id v5 = [objc_alloc((Class)GEOXPCDirectionsReply) initWithRequest:v4];
  v6 = [v4 directionsRequest];
  if (v6)
  {
    v7 = [(GEODirectionsServer *)self serviceRequester];
    v8 = [v4 traits];
    v9 = [v4 preferredAuditToken];
    id v10 = [v4 useBackgroundURL];
    v11 = +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", [v4 priority]);
    v15[0] = _NSConcreteStackBlock;
    v15[1] = 3221225472;
    v15[2] = sub_100010498;
    v15[3] = &unk_100071630;
    id v16 = v5;
    v13[0] = _NSConcreteStackBlock;
    v13[1] = 3221225472;
    v13[2] = sub_1000104D8;
    v13[3] = &unk_100071658;
    id v14 = v16;
    [v7 startRequest:v6 traits:v8 auditToken:v9 skipFinalize:0 useBackgroundURL:v10 requestPriority:v11 callbackQueue:&_dispatch_main_q finished:v15 networkActivity:0 error:v13];
  }
  else
  {
    v12 = +[NSError GEOErrorWithCode:-10 userInfo:0];
    [v5 setError:v12];

    [v5 send];
  }
}

- (void)cancelWithRequest:(id)a3
{
  id v4 = a3;
  id v7 = [objc_alloc((Class)GEOXPCDirectionsReply) initWithRequest:v4];
  id v5 = [v4 directionsRequest];

  if (v5)
  {
    v6 = [(GEODirectionsServer *)self serviceRequester];
    [v6 cancelRequest:v5];
  }
  else
  {
    v6 = +[NSError GEOErrorWithCode:-10 userInfo:0];
    [v7 setError:v6];
  }

  [v7 send];
}

- (void).cxx_destruct
{
}

- (BOOL)handleIncomingMessage:(id)a3 withObject:(id)a4 fromPeer:(id)a5 signpostId:(unint64_t)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  int v13 = sub_100008D68(v10);
  if (v13 == 614)
  {
    uint64_t v18 = objc_opt_class();
    v19 = sub_100008DBC(@"directions", v10, v11, v18, v12);
    id v16 = v19;
    BOOL v17 = v19 != 0;
    if (v19)
    {
      [v19 setSignpostId:a6];
      [(GEODirectionsServer *)self cancelWithRequest:v16];
      goto LABEL_7;
    }
  }
  else
  {
    if (v13 != 558)
    {
      BOOL v17 = 0;
      goto LABEL_10;
    }
    uint64_t v14 = objc_opt_class();
    v15 = sub_100008DBC(@"directions", v10, v11, v14, v12);
    id v16 = v15;
    BOOL v17 = v15 != 0;
    if (v15)
    {
      [v15 setSignpostId:a6];
      [(GEODirectionsServer *)self startWithRequest:v16];
LABEL_7:
      BOOL v17 = 1;
    }
  }

LABEL_10:
  return v17;
}

@end