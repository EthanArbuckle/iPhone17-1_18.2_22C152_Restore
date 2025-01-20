@interface GEOETAServer
+ (id)identifier;
- (BOOL)handleIncomingMessage:(id)a3 withObject:(id)a4 fromPeer:(id)a5 signpostId:(unint64_t)a6;
- (id)serviceRequester;
- (void)cancelETARequestWithRequest:(id)a3;
- (void)cancelSimpleETARequestWithRequest:(id)a3;
- (void)startETARequestWithRequest:(id)a3;
- (void)startSimpleETARequestWithRequest:(id)a3;
@end

@implementation GEOETAServer

+ (id)identifier
{
  return @"ETA";
}

- (BOOL)handleIncomingMessage:(id)a3 withObject:(id)a4 fromPeer:(id)a5 signpostId:(unint64_t)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  int v13 = sub_100008D68(v10);
  BOOL v14 = 0;
  if (v13 > 2138)
  {
    if (v13 == 2195)
    {
      uint64_t v22 = objc_opt_class();
      v23 = sub_100008DBC(@"ETA", v10, v11, v22, v12);
      v17 = v23;
      BOOL v14 = v23 != 0;
      if (v23)
      {
        [v23 setSignpostId:a6];
        [(GEOETAServer *)self cancelSimpleETARequestWithRequest:v17];
        goto LABEL_14;
      }
      goto LABEL_15;
    }
    if (v13 == 2139)
    {
      uint64_t v18 = objc_opt_class();
      v19 = sub_100008DBC(@"ETA", v10, v11, v18, v12);
      v17 = v19;
      BOOL v14 = v19 != 0;
      if (v19)
      {
        [v19 setSignpostId:a6];
        [(GEOETAServer *)self startSimpleETARequestWithRequest:v17];
        goto LABEL_14;
      }
LABEL_15:
    }
  }
  else
  {
    if (v13 == 1521)
    {
      uint64_t v20 = objc_opt_class();
      v21 = sub_100008DBC(@"ETA", v10, v11, v20, v12);
      v17 = v21;
      BOOL v14 = v21 != 0;
      if (v21)
      {
        [v21 setSignpostId:a6];
        [(GEOETAServer *)self startETARequestWithRequest:v17];
        goto LABEL_14;
      }
      goto LABEL_15;
    }
    if (v13 == 1577)
    {
      uint64_t v15 = objc_opt_class();
      v16 = sub_100008DBC(@"ETA", v10, v11, v15, v12);
      v17 = v16;
      BOOL v14 = v16 != 0;
      if (v16)
      {
        [v16 setSignpostId:a6];
        [(GEOETAServer *)self cancelETARequestWithRequest:v17];
LABEL_14:
        BOOL v14 = 1;
        goto LABEL_15;
      }
      goto LABEL_15;
    }
  }

  return v14;
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
    v3 = +[GEOETAServiceRequester sharedRequester];
  }

  return v3;
}

- (void)startSimpleETARequestWithRequest:(id)a3
{
  id v4 = a3;
  id v5 = [objc_alloc((Class)GEOETAReplySimple) initWithRequest:v4];
  v6 = [v4 request];

  if (v6)
  {
    v7 = [(GEOETAServer *)self serviceRequester];
    v8 = [v4 request];
    v9 = [v4 traits];
    id v10 = [v4 preferredAuditToken];
    v14[0] = _NSConcreteStackBlock;
    v14[1] = 3221225472;
    v14[2] = sub_10004C614;
    v14[3] = &unk_100073788;
    id v15 = v5;
    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472;
    v12[2] = sub_10004C654;
    v12[3] = &unk_100071468;
    id v13 = v15;
    [v7 startSimpleETARequest:v8 traits:v9 auditToken:v10 finished:v14 networkActivity:0 error:v12];
  }
  else
  {
    id v11 = +[NSError GEOErrorWithCode:-10];
    [v5 setError:v11];

    [v5 send];
  }
}

- (void)cancelSimpleETARequestWithRequest:(id)a3
{
  id v9 = a3;
  id v4 = [objc_alloc((Class)GEOETAReplySimple) initWithRequest:v9];
  id v5 = [v9 request];

  if (v5)
  {
    v6 = [(GEOETAServer *)self serviceRequester];
    v7 = [v9 request];
    [v6 cancelSimpleETARequest:v7];
  }
  else
  {
    v8 = +[NSError GEOErrorWithCode:-10];
    [v4 setError:v8];

    [v4 send];
  }
}

- (void)startETARequestWithRequest:(id)a3
{
  id v4 = a3;
  id v5 = [objc_alloc((Class)GEOETAReplyUpdateable) initWithRequest:v4];
  v6 = [(GEOETAServer *)self serviceRequester];
  v7 = [v4 request];
  v8 = [v4 connectionProperties];
  id v9 = [v4 traits];
  id v10 = [v4 preferredAuditToken];
  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472;
  v17[2] = sub_10004C968;
  v17[3] = &unk_1000737D8;
  id v18 = v4;
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_10004CAD8;
  v15[3] = &unk_100073800;
  id v16 = v5;
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_10004CB18;
  v13[3] = &unk_100071468;
  id v14 = v16;
  id v11 = v16;
  id v12 = v4;
  [v6 startRequest:v7 connectionProperties:v8 traits:v9 auditToken:v10 willSendRequest:v17 finished:v15 networkActivity:0 error:v13];
}

- (void)cancelETARequestWithRequest:(id)a3
{
  id v3 = a3;
  id v5 = +[GEOETAServiceRequester sharedRequester];
  id v4 = [v3 request];

  [v5 cancelRequest:v4];
}

- (void).cxx_destruct
{
}

@end