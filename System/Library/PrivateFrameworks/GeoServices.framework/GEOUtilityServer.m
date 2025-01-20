@interface GEOUtilityServer
+ (id)handledPairedDeviceMessageTypes;
+ (id)identifier;
- (BOOL)handleIncomingMessage:(id)a3 withObject:(id)a4 fromPeer:(id)a5 signpostId:(unint64_t)a6;
- (BOOL)handleIncomingPairedDeviceMessage:(id)a3 completionHandler:(id)a4;
- (void)currentServicesStateWithMessage:(id)a3;
- (void)getGeoServicesCacheDirectoryWithMessage:(id)a3;
- (void)getHomeDirectoryWithMessage:(id)a3;
- (void)heartbeatWithMessage:(id)a3;
@end

@implementation GEOUtilityServer

+ (id)identifier
{
  return @"utility";
}

- (BOOL)handleIncomingMessage:(id)a3 withObject:(id)a4 fromPeer:(id)a5 signpostId:(unint64_t)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  int v13 = sub_100008D68(v10);
  BOOL v14 = 0;
  if (v13 > 2119)
  {
    if (v13 == 2120)
    {
      if (!sub_100019858(v12, v11, @"utility", v10, &off_100077B88, 0))
      {
        BOOL v14 = 1;
        goto LABEL_17;
      }
      id v19 = [objc_alloc((Class)GEOMessage) initWithXPCMessage:v11 peer:v12];
      v16 = v19;
      BOOL v14 = v19 != 0;
      if (!v19) {
        goto LABEL_16;
      }
      [v19 setSignpostId:a6];
      [(GEOUtilityServer *)self currentServicesStateWithMessage:v16];
      goto LABEL_15;
    }
    if (v13 == 2856)
    {
      id v17 = [objc_alloc((Class)GEOMessage) initWithXPCMessage:v11 peer:v12];
      v16 = v17;
      BOOL v14 = v17 != 0;
      if (v17)
      {
        [v17 setSignpostId:a6];
        [(GEOUtilityServer *)self getGeoServicesCacheDirectoryWithMessage:v16];
        goto LABEL_15;
      }
LABEL_16:
    }
  }
  else
  {
    if (v13 == 944)
    {
      id v18 = [objc_alloc((Class)GEOMessage) initWithXPCMessage:v11 peer:v12];
      v16 = v18;
      BOOL v14 = v18 != 0;
      if (v18)
      {
        [v18 setSignpostId:a6];
        [(GEOUtilityServer *)self heartbeatWithMessage:v16];
        goto LABEL_15;
      }
      goto LABEL_16;
    }
    if (v13 == 1662)
    {
      id v15 = [objc_alloc((Class)GEOMessage) initWithXPCMessage:v11 peer:v12];
      v16 = v15;
      BOOL v14 = v15 != 0;
      if (v15)
      {
        [v15 setSignpostId:a6];
        [(GEOUtilityServer *)self getHomeDirectoryWithMessage:v16];
LABEL_15:
        BOOL v14 = 1;
        goto LABEL_16;
      }
      goto LABEL_16;
    }
  }
LABEL_17:

  return v14;
}

+ (id)handledPairedDeviceMessageTypes
{
  return &__NSArray0__struct;
}

- (BOOL)handleIncomingPairedDeviceMessage:(id)a3 completionHandler:(id)a4
{
  return 0;
}

- (void)heartbeatWithMessage:(id)a3
{
  id v3 = a3;
  id v6 = +[NSNotificationCenter defaultCenter];
  uint64_t v4 = GEOPeerHeartbeatNotification;
  v5 = [v3 peer];

  [v6 postNotificationName:v4 object:v5];
}

- (void)getHomeDirectoryWithMessage:(id)a3
{
  CFStringRef v6 = @"path";
  id v3 = a3;
  uint64_t v4 = +[GEOFilePaths _internal_homeDirectory];
  v7 = v4;
  v5 = +[NSDictionary dictionaryWithObjects:&v7 forKeys:&v6 count:1];

  [v3 sendReply:v5];
}

- (void)getGeoServicesCacheDirectoryWithMessage:(id)a3
{
  CFStringRef v6 = @"path";
  id v3 = a3;
  uint64_t v4 = +[GEOFilePaths _internal_geoServicesCacheDirectoryPath];
  v7 = v4;
  v5 = +[NSDictionary dictionaryWithObjects:&v7 forKeys:&v6 count:1];

  [v3 sendReply:v5];
}

- (void)currentServicesStateWithMessage:(id)a3
{
  id v3 = a3;
  id v4 = objc_alloc_init((Class)GEOServicesState);
  [v4 setBogusFieldForTestingPurposes:@"Valid looking state field"];
  CFStringRef v7 = @"state";
  v5 = [v4 data];
  v8 = v5;
  CFStringRef v6 = +[NSDictionary dictionaryWithObjects:&v8 forKeys:&v7 count:1];

  [v3 sendReply:v6];
}

@end