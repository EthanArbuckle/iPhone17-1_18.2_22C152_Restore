@interface GEOToolServer
+ (id)handledPairedDeviceMessageTypes;
+ (id)identifier;
- (BOOL)handleIncomingMessage:(id)a3 withObject:(id)a4 fromPeer:(id)a5 signpostId:(unint64_t)a6;
- (BOOL)handleIncomingPairedDeviceMessage:(id)a3 completionHandler:(id)a4;
- (void)calculatePurgableSpaceWithMessage:(id)a3;
- (void)checkProactiveTileDownloadPolicyEnabledWithMessage:(id)a3;
- (void)fetchOfflineMetadataWithMessage:(id)a3;
- (void)flushPurgeableOfflineDataWithMessage:(id)a3;
- (void)forceProactiveTileDownloaderRunWithMessage:(id)a3;
- (void)freePurgableSpaceWithMessage:(id)a3;
- (void)getDefaultWithMessage:(id)a3;
- (void)invalidateTileCacheWithMessage:(id)a3;
- (void)listFilePathsWithMessage:(id)a3;
- (void)lockDBsWithMessage:(id)a3;
- (void)notifyNetworkDefaultsChangedWithMessage:(id)a3;
- (void)pingOverIDSWithMessage:(id)a3;
- (void)pingWithMessage:(id)a3;
- (void)pingWithPairedDeviceMessage:(id)a3 completionHandler:(id)a4;
- (void)unlockDBsWithMessage:(id)a3;
@end

@implementation GEOToolServer

+ (id)identifier
{
  return @"geotool";
}

- (BOOL)handleIncomingMessage:(id)a3 withObject:(id)a4 fromPeer:(id)a5 signpostId:(unint64_t)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  if (sub_100019858(v12, v11, @"geotool", v10, &off_1000777F8, 0))
  {
    int v13 = sub_100008D68(v10);
    BOOL v14 = 0;
    if (v13 > 1922)
    {
      if (v13 <= 2549)
      {
        switch(v13)
        {
          case 1923:
            id v26 = [objc_alloc((Class)GEOMessage) initWithXPCMessage:v11 peer:v12];
            v16 = v26;
            BOOL v14 = v26 != 0;
            if (v26)
            {
              [v26 setSignpostId:a6];
              [(GEOToolServer *)self invalidateTileCacheWithMessage:v16];
              goto LABEL_50;
            }
            goto LABEL_51;
          case 2030:
            id v27 = [objc_alloc((Class)GEOMessage) initWithXPCMessage:v11 peer:v12];
            v16 = v27;
            BOOL v14 = v27 != 0;
            if (v27)
            {
              [v27 setSignpostId:a6];
              [(GEOToolServer *)self fetchOfflineMetadataWithMessage:v16];
              goto LABEL_50;
            }
            goto LABEL_51;
          case 2252:
            id v19 = [objc_alloc((Class)GEOMessage) initWithXPCMessage:v11 peer:v12];
            v16 = v19;
            BOOL v14 = v19 != 0;
            if (v19)
            {
              [v19 setSignpostId:a6];
              [(GEOToolServer *)self calculatePurgableSpaceWithMessage:v16];
              goto LABEL_50;
            }
            goto LABEL_51;
        }
      }
      else if (v13 > 3213)
      {
        if (v13 == 3214)
        {
          id v29 = [objc_alloc((Class)GEOMessage) initWithXPCMessage:v11 peer:v12];
          v16 = v29;
          BOOL v14 = v29 != 0;
          if (v29)
          {
            [v29 setSignpostId:a6];
            [(GEOToolServer *)self forceProactiveTileDownloaderRunWithMessage:v16];
            goto LABEL_50;
          }
          goto LABEL_51;
        }
        if (v13 == 3980)
        {
          id v21 = [objc_alloc((Class)GEOMessage) initWithXPCMessage:v11 peer:v12];
          v16 = v21;
          BOOL v14 = v21 != 0;
          if (v21)
          {
            [v21 setSignpostId:a6];
            [(GEOToolServer *)self checkProactiveTileDownloadPolicyEnabledWithMessage:v16];
            goto LABEL_50;
          }
          goto LABEL_51;
        }
      }
      else
      {
        if (v13 == 2550)
        {
          id v23 = [objc_alloc((Class)GEOMessage) initWithXPCMessage:v11 peer:v12];
          v16 = v23;
          BOOL v14 = v23 != 0;
          if (v23)
          {
            [v23 setSignpostId:a6];
            [(GEOToolServer *)self flushPurgeableOfflineDataWithMessage:v16];
            goto LABEL_50;
          }
          goto LABEL_51;
        }
        if (v13 == 2917)
        {
          id v17 = [objc_alloc((Class)GEOMessage) initWithXPCMessage:v11 peer:v12];
          v16 = v17;
          BOOL v14 = v17 != 0;
          if (v17)
          {
            [v17 setSignpostId:a6];
            [(GEOToolServer *)self notifyNetworkDefaultsChangedWithMessage:v16];
            goto LABEL_50;
          }
LABEL_51:
        }
      }
    }
    else if (v13 <= 1028)
    {
      switch(v13)
      {
        case 430:
          id v24 = [objc_alloc((Class)GEOMessage) initWithXPCMessage:v11 peer:v12];
          v16 = v24;
          BOOL v14 = v24 != 0;
          if (v24)
          {
            [v24 setSignpostId:a6];
            [(GEOToolServer *)self pingWithMessage:v16];
            goto LABEL_50;
          }
          goto LABEL_51;
        case 674:
          id v25 = [objc_alloc((Class)GEOMessage) initWithXPCMessage:v11 peer:v12];
          v16 = v25;
          BOOL v14 = v25 != 0;
          if (v25)
          {
            [v25 setSignpostId:a6];
            [(GEOToolServer *)self lockDBsWithMessage:v16];
            goto LABEL_50;
          }
          goto LABEL_51;
        case 901:
          id v18 = [objc_alloc((Class)GEOMessage) initWithXPCMessage:v11 peer:v12];
          v16 = v18;
          BOOL v14 = v18 != 0;
          if (v18)
          {
            [v18 setSignpostId:a6];
            [(GEOToolServer *)self unlockDBsWithMessage:v16];
            goto LABEL_50;
          }
          goto LABEL_51;
      }
    }
    else if (v13 > 1339)
    {
      if (v13 == 1340)
      {
        id v28 = [objc_alloc((Class)GEOMessage) initWithXPCMessage:v11 peer:v12];
        v16 = v28;
        BOOL v14 = v28 != 0;
        if (v28)
        {
          [v28 setSignpostId:a6];
          [(GEOToolServer *)self listFilePathsWithMessage:v16];
          goto LABEL_50;
        }
        goto LABEL_51;
      }
      if (v13 == 1728)
      {
        id v20 = [objc_alloc((Class)GEOMessage) initWithXPCMessage:v11 peer:v12];
        v16 = v20;
        BOOL v14 = v20 != 0;
        if (v20)
        {
          [v20 setSignpostId:a6];
          [(GEOToolServer *)self freePurgableSpaceWithMessage:v16];
          goto LABEL_50;
        }
        goto LABEL_51;
      }
    }
    else
    {
      if (v13 == 1029)
      {
        id v22 = [objc_alloc((Class)GEOMessage) initWithXPCMessage:v11 peer:v12];
        v16 = v22;
        BOOL v14 = v22 != 0;
        if (v22)
        {
          [v22 setSignpostId:a6];
          [(GEOToolServer *)self getDefaultWithMessage:v16];
          goto LABEL_50;
        }
        goto LABEL_51;
      }
      if (v13 == 1066)
      {
        id v15 = [objc_alloc((Class)GEOMessage) initWithXPCMessage:v11 peer:v12];
        v16 = v15;
        BOOL v14 = v15 != 0;
        if (v15)
        {
          [v15 setSignpostId:a6];
          [(GEOToolServer *)self pingOverIDSWithMessage:v16];
LABEL_50:
          BOOL v14 = 1;
          goto LABEL_51;
        }
        goto LABEL_51;
      }
    }
  }
  else
  {
    BOOL v14 = 1;
  }

  return v14;
}

+ (id)handledPairedDeviceMessageTypes
{
  return &off_100077810;
}

- (BOOL)handleIncomingPairedDeviceMessage:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if ([v6 type] == 1)
  {
    v8 = [v6 ping];
    BOOL v9 = v8 != 0;
    if (v8)
    {
      v11[0] = _NSConcreteStackBlock;
      v11[1] = 3221225472;
      v11[2] = sub_10001A09C;
      v11[3] = &unk_100071B30;
      id v12 = v7;
      [(GEOToolServer *)self pingWithPairedDeviceMessage:v8 completionHandler:v11];
    }
  }
  else
  {
    BOOL v9 = 0;
  }

  return v9;
}

- (void)pingWithMessage:(id)a3
{
}

- (void)unlockDBsWithMessage:(id)a3
{
  id v5 = a3;
  v4 = +[NSNotificationCenter defaultCenter];
  [v4 postNotificationName:GEOUnlockSQLiteDBNotificationName object:self];

  [v5 sendReply:0];
}

- (void)lockDBsWithMessage:(id)a3
{
  id v5 = a3;
  v4 = +[NSNotificationCenter defaultCenter];
  [v4 postNotificationName:GEOLockSQLiteDBNotificationName object:self];

  [v5 sendReply:0];
}

- (void)forceProactiveTileDownloaderRunWithMessage:(id)a3
{
  id v5 = a3;
  v4 = +[NSNotificationCenter defaultCenter];
  [v4 postNotificationName:GEOTileServerLocalProxyForceExplicitProactiveTileDownloadRunNotification object:self];

  [v5 sendReply:0];
}

- (void)checkProactiveTileDownloadPolicyEnabledWithMessage:(id)a3
{
  id v3 = a3;
  CFStringRef v6 = @"enabled";
  v4 = +[NSNumber numberWithBool:GEOProactiveTileDownloadPolicyIsEnabled()];
  id v7 = v4;
  id v5 = +[NSDictionary dictionaryWithObjects:&v7 forKeys:&v6 count:1];
  [v3 sendReply:v5];
}

- (void)getDefaultWithMessage:(id)a3
{
  id v3 = a3;
  v4 = [v3 userInfo];
  id v5 = [v4 objectForKeyedSubscript:@"key"];

  CFStringRef v6 = GEOGetDefaultWithSource();
  CFStringRef v10 = @"value";
  id v7 = v6;
  if (!v6)
  {
    id v7 = +[NSNull null];
  }
  v8 = +[NSNumber numberWithInteger:0, 0, v10, @"source", v7];
  v11[1] = v8;
  BOOL v9 = +[NSDictionary dictionaryWithObjects:v11 forKeys:&v10 count:2];

  if (!v6) {
  [v3 sendReply:v9];
  }
}

- (void)calculatePurgableSpaceWithMessage:(id)a3
{
  id v3 = a3;
  v4 = dispatch_get_global_queue(17, 0);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000298AC;
  block[3] = &unk_100071490;
  id v7 = v3;
  id v5 = v3;
  dispatch_async(v4, block);
}

- (void)freePurgableSpaceWithMessage:(id)a3
{
  id v3 = a3;
  v4 = dispatch_get_global_queue(17, 0);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100029AE8;
  block[3] = &unk_100071490;
  id v7 = v3;
  id v5 = v3;
  dispatch_async(v4, block);
}

- (void)invalidateTileCacheWithMessage:(id)a3
{
  id v4 = a3;
  id v5 = objc_alloc_init((Class)GEOTileEditionUpdate);
  [v5 setInvalidateEverything:1];
  CFStringRef v6 = +[NSNotificationCenter defaultCenter];
  uint64_t v7 = GEOTileEditionUpdateNotification;
  uint64_t v11 = GEOTileEditionUpdateKey;
  id v12 = v5;
  v8 = +[NSDictionary dictionaryWithObjects:&v12 forKeys:&v11 count:1];
  [v6 postNotificationName:v7 object:0 userInfo:v8];

  dispatch_time_t v9 = dispatch_time(0, 5000000000);
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_100029EFC;
  v10[3] = &unk_100071490;
  v10[4] = self;
  dispatch_after(v9, (dispatch_queue_t)&_dispatch_main_q, v10);
  [v4 sendReply:0];
}

- (void)listFilePathsWithMessage:(id)a3
{
  id v3 = a3;
  id v4 = +[GEOFilePaths dictionaryRepresentation];
  [v3 sendReply:v4];
}

- (void)fetchOfflineMetadataWithMessage:(id)a3
{
  id v3 = a3;
  id v4 = +[GEOOfflineDataConfiguration sharedConfiguration];
  id v5 = +[NSMutableDictionary dictionary];
  CFStringRef v6 = [v4 activeVersions];
  uint64_t v7 = v6;
  if (v6)
  {
    id v22 = v5;
    v8 = +[NSMutableDictionary dictionaryWithCapacity:](NSMutableDictionary, "dictionaryWithCapacity:", [v6 count]);
    long long v23 = 0u;
    long long v24 = 0u;
    long long v25 = 0u;
    long long v26 = 0u;
    id v21 = v7;
    id v9 = v7;
    id v10 = [v9 countByEnumeratingWithState:&v23 objects:v27 count:16];
    if (v10)
    {
      id v11 = v10;
      uint64_t v12 = *(void *)v24;
      do
      {
        for (i = 0; i != v11; i = (char *)i + 1)
        {
          if (*(void *)v24 != v12) {
            objc_enumerationMutation(v9);
          }
          BOOL v14 = *(void **)(*((void *)&v23 + 1) + 8 * i);
          id v15 = [v14 unsignedIntValue];
          if (v15 >= 0x15)
          {
            v16 = +[NSString stringWithFormat:@"(unknown: %i)", v15];
          }
          else
          {
            v16 = off_100072338[(int)v15];
          }
          id v17 = [v9 objectForKeyedSubscript:v14];
          [v8 setObject:v17 forKeyedSubscript:v16];
        }
        id v11 = [v9 countByEnumeratingWithState:&v23 objects:v27 count:16];
      }
      while (v11);
    }

    id v5 = v22;
    [v22 setObject:v8 forKeyedSubscript:@"activeVersions"];

    uint64_t v7 = v21;
  }
  id v18 = [v4 lastUpdatedDate];
  id v19 = v18;
  if (v18)
  {
    [v18 timeIntervalSinceReferenceDate];
    id v20 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
    [v5 setObject:v20 forKeyedSubscript:@"updated"];
  }
  [v3 sendReply:v5];
}

- (void)flushPurgeableOfflineDataWithMessage:(id)a3
{
  id v3 = a3;
  id v4 = +[GEOTileLoader modernLoader];
  id v5 = [v4 proxy];

  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    CFStringRef v6 = [v5 tileCache];
    CFStringRef v9 = @"success";
    uint64_t v7 = +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", [v6 clearPurgeableOfflineData]);
    id v10 = v7;
    v8 = +[NSDictionary dictionaryWithObjects:&v10 forKeys:&v9 count:1];
    [v3 sendReply:v8];
  }
  else
  {
    [v3 sendReply:0];
  }
}

- (void)notifyNetworkDefaultsChangedWithMessage:(id)a3
{
  id v3 = a3;
  id v4 = +[GEOFilePaths urlFor:23];
  id v13 = 0;
  id v5 = +[NSData dataWithContentsOfURL:v4 options:1 error:&v13];
  id v6 = v13;
  if (v5)
  {
    id v12 = 0;
    uint64_t v7 = +[NSPropertyListSerialization propertyListWithData:v5 options:0 format:0 error:&v12];
    id v8 = v12;

    objc_opt_class();
    id v9 = 0;
    if (objc_opt_isKindOfClass()) {
      id v9 = v7;
    }

    id v6 = v8;
  }
  else
  {
    id v9 = 0;
  }

  if (v9)
  {
    id v10 = +[GEONetworkDefaults sharedNetworkDefaults];
    [v10 serverProxy:0 networkDefaultsDidChange:v9];

    notify_post("com.apple.GeoServices.internal.networkDefaultsChanged");
    id v11 = &off_100077CD0;
  }
  else
  {
    id v11 = &off_100077CF8;
  }
  [v3 sendReply:v11];
}

- (void)pingOverIDSWithMessage:(id)a3
{
  id v3 = a3;
  id v4 = objc_alloc_init((Class)GEOPairedDevicePingRequest);
  [v4 setType:1];
  id v5 = +[GEOPairedDeviceConnection sharedInstance];
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_10002A59C;
  v7[3] = &unk_100072318;
  id v8 = v3;
  id v6 = v3;
  [v5 sendPing:v4 withReply:v7];
}

- (void)pingWithPairedDeviceMessage:(id)a3 completionHandler:(id)a4
{
  id v8 = (void (**)(id, id, void))a4;
  id v5 = a3;
  id v6 = objc_alloc_init((Class)GEOPairedDevicePingReply);
  unsigned int v7 = [v5 type];

  if (v7 <= 2) {
    [v6 setType:dword_100059C88[v7]];
  }
  v8[2](v8, v6, 0);
}

@end