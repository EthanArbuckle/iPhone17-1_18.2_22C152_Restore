@interface GEOSearchAttributionServer
+ (id)identifier;
- (BOOL)handleIncomingMessage:(id)a3 withObject:(id)a4 fromPeer:(id)a5 signpostId:(unint64_t)a6;
- (void)loadAttributionWithMessage:(id)a3;
@end

@implementation GEOSearchAttributionServer

+ (id)identifier
{
  return @"searchattribution";
}

- (BOOL)handleIncomingMessage:(id)a3 withObject:(id)a4 fromPeer:(id)a5 signpostId:(unint64_t)a6
{
  id v10 = a4;
  id v11 = a5;
  if (sub_100008D68(a3) == 1589)
  {
    id v12 = [objc_alloc((Class)GEOMessage) initWithXPCMessage:v10 peer:v11];
    v13 = v12;
    BOOL v14 = v12 != 0;
    if (v12)
    {
      [v12 setSignpostId:a6];
      [(GEOSearchAttributionServer *)self loadAttributionWithMessage:v13];
    }
  }
  else
  {
    BOOL v14 = 0;
  }

  return v14;
}

- (void)loadAttributionWithMessage:(id)a3
{
  id v3 = a3;
  v4 = [v3 userInfo];
  v5 = [v4 objectForKey:@"identifiers"];

  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v6 = +[GEOSearchAttributionManifestManager sharedManager];
    v7 = [v6 serverProxy];
    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472;
    v8[2] = sub_10001E698;
    v8[3] = &unk_100071C40;
    id v9 = v3;
    [v7 loadAttributionInfoForIdentifiers:v5 completionHandler:v8];
  }
  else
  {
    NSLog(@"GEOSearchAttributionServer: Unexpected parameters. Ignoring.");
  }
}

@end