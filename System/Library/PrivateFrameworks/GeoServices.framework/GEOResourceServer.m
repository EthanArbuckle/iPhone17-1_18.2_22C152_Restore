@interface GEOResourceServer
+ (id)identifier;
- (BOOL)handleIncomingMessage:(id)a3 withObject:(id)a4 fromPeer:(id)a5 signpostId:(unint64_t)a6;
- (void)fetchWithRequest:(id)a3;
@end

@implementation GEOResourceServer

+ (id)identifier
{
  return @"resources";
}

- (BOOL)handleIncomingMessage:(id)a3 withObject:(id)a4 fromPeer:(id)a5 signpostId:(unint64_t)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  if (sub_100008D68(v10) == 522)
  {
    uint64_t v13 = objc_opt_class();
    v14 = sub_100008DBC(@"resources", v10, v11, v13, v12);
    v15 = v14;
    BOOL v16 = v14 != 0;
    if (v14)
    {
      [v14 setSignpostId:a6];
      [(GEOResourceServer *)self fetchWithRequest:v15];
    }
  }
  else
  {
    BOOL v16 = 0;
  }

  return v16;
}

- (void)fetchWithRequest:(id)a3
{
  id v3 = a3;
  id v4 = [objc_alloc((Class)GEOResourceFetchReply) initWithRequest:v3];
  v5 = [v3 resources];
  id v6 = [v5 count];

  if (v6)
  {
    v7 = +[GEOResourceRequester sharedRequester];
    v8 = [v3 resources];
    id v9 = [v3 force];
    id v10 = [v3 unpack];
    id v11 = [v3 manifestConfiguration];
    id v12 = [v3 preferredAuditToken];
    global_queue = (void *)geo_get_global_queue();
    v15[0] = _NSConcreteStackBlock;
    v15[1] = 3221225472;
    v15[2] = sub_10002AE44;
    v15[3] = &unk_100072428;
    id v16 = v4;
    [v7 fetchResources:v8 force:v9 unpack:v10 manifestConfiguration:v11 auditToken:v12 queue:global_queue handler:v15];
  }
  else
  {
    v14 = +[NSError GEOErrorWithCode:-10 reason:@"No resources in request"];
    [v4 setError:v14];

    [v4 send];
  }
}

@end