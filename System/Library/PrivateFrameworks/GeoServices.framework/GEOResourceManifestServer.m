@interface GEOResourceManifestServer
+ (id)identifier;
+ (id)possibleBackgroundTaskIdentifiers;
+ (unint64_t)launchMode;
- (BOOL)handleIncomingMessage:(id)a3 withObject:(id)a4 fromPeer:(id)a5 signpostId:(unint64_t)a6;
- (GEOResourceManifestServer)initWithDaemon:(id)a3;
- (id)_configurationForPeer:(id)a3;
- (id)_manifestManagerForPeer:(id)a3;
- (void)_configureConstrainedNetworkUpdateAssertion;
- (void)_fireOpportunisticResourceLoads;
- (void)_forEachPeerMatchingConfiguration:(id)a3 perform:(id)a4;
- (void)activateFilterWithRequest:(id)a3;
- (void)deactivateFilterWithRequest:(id)a3;
- (void)dealloc;
- (void)forceUpdateWithMessage:(id)a3;
- (void)getMaximumZoomLevelWithMessage:(id)a3;
- (void)getResourceManifestWithMessage:(id)a3;
- (void)peerDidConnect:(id)a3;
- (void)peerDidDisconnect:(id)a3;
- (void)resetActiveTileGroupWithMessage:(id)a3;
- (void)runBackgroundTask:(id)a3;
- (void)serverProxy:(id)a3 didChangeActiveTileGroup:(id)a4 finishedCallback:(id)a5;
- (void)serverProxyNeedsWiFiResourceActivity:(id)a3;
- (void)setActiveTileGroupIdentifierWithMessage:(id)a3;
- (void)setConfigurationWithMessage:(id)a3;
- (void)setRequestTokenWithMessage:(id)a3;
- (void)updateIfNecessaryWithMessage:(id)a3;
@end

@implementation GEOResourceManifestServer

- (void)peerDidConnect:(id)a3
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100043044;
  block[3] = &unk_100071490;
  block[4] = self;
  uint64_t v4 = qword_100084918;
  id v5 = a3;
  if (v4 != -1) {
    dispatch_once(&qword_100084918, block);
  }
  v6.receiver = self;
  v6.super_class = (Class)GEOResourceManifestServer;
  [(GEOResourceManifestServer *)&v6 peerDidConnect:v5];
}

- (void)peerDidDisconnect:(id)a3
{
  peerToConfiguration = self->_peerToConfiguration;
  id v5 = a3;
  [(NSMapTable *)peerToConfiguration removeObjectForKey:v5];
  v6.receiver = self;
  v6.super_class = (Class)GEOResourceManifestServer;
  [(GEOResourceManifestServer *)&v6 peerDidDisconnect:v5];
}

+ (id)identifier
{
  return @"resourcemanifest";
}

+ (unint64_t)launchMode
{
  return 2;
}

+ (id)possibleBackgroundTaskIdentifiers
{
  return &off_100077A20;
}

- (BOOL)handleIncomingMessage:(id)a3 withObject:(id)a4 fromPeer:(id)a5 signpostId:(unint64_t)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  int v13 = sub_100008D68(v10);
  BOOL v14 = 0;
  if (v13 > 1758)
  {
    if (v13 <= 1982)
    {
      if (v13 == 1759)
      {
        id v27 = [objc_alloc((Class)GEOMessage) initWithXPCMessage:v11 peer:v12];
        v16 = v27;
        BOOL v14 = v27 != 0;
        if (v27)
        {
          [v27 setSignpostId:a6];
          [(GEOResourceManifestServer *)self updateIfNecessaryWithMessage:v16];
          goto LABEL_39;
        }
        goto LABEL_40;
      }
      if (v13 == 1979)
      {
        id v20 = [objc_alloc((Class)GEOMessage) initWithXPCMessage:v11 peer:v12];
        v16 = v20;
        BOOL v14 = v20 != 0;
        if (v20)
        {
          [v20 setSignpostId:a6];
          [(GEOResourceManifestServer *)self getMaximumZoomLevelWithMessage:v16];
          goto LABEL_39;
        }
        goto LABEL_40;
      }
      goto LABEL_41;
    }
    switch(v13)
    {
      case 1983:
        if (sub_100019858(v12, v11, @"resourcemanifest", v10, &off_100077A80, 0))
        {
          id v24 = [objc_alloc((Class)GEOMessage) initWithXPCMessage:v11 peer:v12];
          v16 = v24;
          BOOL v14 = v24 != 0;
          if (v24)
          {
            [v24 setSignpostId:a6];
            [(GEOResourceManifestServer *)self getResourceManifestWithMessage:v16];
            goto LABEL_39;
          }
          goto LABEL_40;
        }
        break;
      case 2074:
        id v25 = [objc_alloc((Class)GEOMessage) initWithXPCMessage:v11 peer:v12];
        v16 = v25;
        BOOL v14 = v25 != 0;
        if (v25)
        {
          [v25 setSignpostId:a6];
          [(GEOResourceManifestServer *)self resetActiveTileGroupWithMessage:v16];
          goto LABEL_39;
        }
        goto LABEL_40;
      case 2886:
        if (sub_100019858(v12, v11, @"resourcemanifest", v10, &off_100077A38, 0))
        {
          id v17 = [objc_alloc((Class)GEOMessage) initWithXPCMessage:v11 peer:v12];
          v16 = v17;
          BOOL v14 = v17 != 0;
          if (v17)
          {
            [v17 setSignpostId:a6];
            [(GEOResourceManifestServer *)self setActiveTileGroupIdentifierWithMessage:v16];
            goto LABEL_39;
          }
LABEL_40:

          goto LABEL_41;
        }
        break;
      default:
        goto LABEL_41;
    }
LABEL_32:
    BOOL v14 = 1;
    goto LABEL_41;
  }
  if (v13 <= 1589)
  {
    if (v13 == 1138)
    {
      id v26 = [objc_alloc((Class)GEOMessage) initWithXPCMessage:v11 peer:v12];
      v16 = v26;
      BOOL v14 = v26 != 0;
      if (v26)
      {
        [v26 setSignpostId:a6];
        [(GEOResourceManifestServer *)self forceUpdateWithMessage:v16];
        goto LABEL_39;
      }
      goto LABEL_40;
    }
    if (v13 == 1463)
    {
      uint64_t v18 = objc_opt_class();
      v19 = sub_100008DBC(@"resourcemanifest", v10, v11, v18, v12);
      v16 = v19;
      BOOL v14 = v19 != 0;
      if (v19)
      {
        [v19 setSignpostId:a6];
        [(GEOResourceManifestServer *)self activateFilterWithRequest:v16];
        goto LABEL_39;
      }
      goto LABEL_40;
    }
    goto LABEL_41;
  }
  switch(v13)
  {
    case 1590:
      if (sub_100019858(v12, v11, @"resourcemanifest", v10, &off_100077A50, 0))
      {
        id v21 = [objc_alloc((Class)GEOMessage) initWithXPCMessage:v11 peer:v12];
        v16 = v21;
        BOOL v14 = v21 != 0;
        if (v21)
        {
          [v21 setSignpostId:a6];
          [(GEOResourceManifestServer *)self setRequestTokenWithMessage:v16];
          goto LABEL_39;
        }
        goto LABEL_40;
      }
      goto LABEL_32;
    case 1664:
      BOOL v14 = 1;
      if (sub_100019858(v12, v11, @"resourcemanifest", v10, &off_100077A68, 1))
      {
        uint64_t v22 = objc_opt_class();
        v23 = sub_100008DBC(@"resourcemanifest", v10, v11, v22, v12);
        v16 = v23;
        BOOL v14 = v23 != 0;
        if (v23)
        {
          [v23 setSignpostId:a6];
          [(GEOResourceManifestServer *)self deactivateFilterWithRequest:v16];
          goto LABEL_39;
        }
        goto LABEL_40;
      }
      break;
    case 1700:
      id v15 = [objc_alloc((Class)GEOMessage) initWithXPCMessage:v11 peer:v12];
      v16 = v15;
      BOOL v14 = v15 != 0;
      if (v15)
      {
        [v15 setSignpostId:a6];
        [(GEOResourceManifestServer *)self setConfigurationWithMessage:v16];
LABEL_39:
        BOOL v14 = 1;
        goto LABEL_40;
      }
      goto LABEL_40;
  }
LABEL_41:

  return v14;
}

- (GEOResourceManifestServer)initWithDaemon:(id)a3
{
  v13.receiver = self;
  v13.super_class = (Class)GEOResourceManifestServer;
  v3 = [(GEOResourceManifestServer *)&v13 initWithDaemon:a3];
  if (v3)
  {
    uint64_t v4 = (NSMapTable *)[objc_alloc((Class)NSMapTable) initWithKeyOptions:512 valueOptions:512 capacity:5];
    peerToConfiguration = v3->_peerToConfiguration;
    v3->_peerToConfiguration = v4;

    objc_super v6 = (NSMutableSet *)objc_alloc_init((Class)NSMutableSet);
    alreadyRegisteredConfigurations = v3->_alreadyRegisteredConfigurations;
    v3->_alreadyRegisteredConfigurations = v6;

    uint64_t v8 = geo_isolater_create();
    constrainedNetworkUpdateAssertionIsolation = v3->_constrainedNetworkUpdateAssertionIsolation;
    v3->_constrainedNetworkUpdateAssertionIsolation = (geo_isolater *)v8;

    id v10 = +[NSNotificationCenter defaultCenter];
    [v10 addObserver:v3 selector:"_configureConstrainedNetworkUpdateAssertion" name:GEONetworkObserverConstrainedNetworkDidChangeNotificationName object:0];

    [(GEOResourceManifestServer *)v3 _configureConstrainedNetworkUpdateAssertion];
    id v12 = v3;
    geo_dispatch_async_qos();
  }
  return v3;
}

- (void)dealloc
{
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  v3 = self->_alreadyRegisteredConfigurations;
  id v4 = [(NSMutableSet *)v3 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v4)
  {
    id v5 = v4;
    uint64_t v6 = *(void *)v11;
    do
    {
      v7 = 0;
      do
      {
        if (*(void *)v11 != v6) {
          objc_enumerationMutation(v3);
        }
        uint64_t v8 = +[GEOResourceManifestManager modernManagerForConfiguration:*(void *)(*((void *)&v10 + 1) + 8 * (void)v7)];
        [v8 removeServerProxyObserver:self];
        [v8 closeServerConnection];

        v7 = (char *)v7 + 1;
      }
      while (v5 != v7);
      id v5 = [(NSMutableSet *)v3 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v5);
  }

  v9.receiver = self;
  v9.super_class = (Class)GEOResourceManifestServer;
  [(GEOResourceManifestServer *)&v9 dealloc];
}

- (void)runBackgroundTask:(id)a3
{
  id v4 = a3;
  id v5 = [v4 identifier];
  unsigned int v6 = [v5 isEqualToString:@"com.apple.geod.OpportunisticResourceLoading"];

  if (v6)
  {
    v7 = [v4 identifier];
    GEOBackgroundTaskReportReportTaskInitiated();

    uint64_t v8 = [(GEOResourceManifestServer *)self daemon];
    objc_super v9 = [v8 serverQueue];
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_100042E7C;
    block[3] = &unk_100071888;
    block[4] = self;
    id v12 = v4;
    dispatch_async(v9, block);
  }
  else
  {
    v10.receiver = self;
    v10.super_class = (Class)GEOResourceManifestServer;
    [(GEOResourceManifestServer *)&v10 runBackgroundTask:v4];
  }
}

- (void)_configureConstrainedNetworkUpdateAssertion
{
}

- (id)_manifestManagerForPeer:(id)a3
{
  v3 = [(NSMapTable *)self->_peerToConfiguration objectForKey:a3];
  id v4 = +[GEOResourceManifestManager modernManagerForConfiguration:v3];

  return v4;
}

- (id)_configurationForPeer:(id)a3
{
  id v3 = [(NSMapTable *)self->_peerToConfiguration objectForKey:a3];
  if (!v3)
  {
    if (qword_100084920 != -1) {
      dispatch_once(&qword_100084920, &stru_100073148);
    }
    id v3 = (id)qword_100084928;
  }

  return v3;
}

- (void)_fireOpportunisticResourceLoads
{
  v2 = GEOFindOrCreateLog();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)unsigned int v6 = 0;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_INFO, "Opportunistic resource loading XPC activity fired. Will attempt to load stale resources.", v6, 2u);
  }

  id v3 = +[GEOResourceManifestManager modernManager];
  id v4 = [v3 serverProxy];
  [v4 performOpportunisticResourceLoading];

  if (sub_100011CD8())
  {
    id v5 = [sub_100012100() sharedInstance];
    [v5 getDevicesWithBlock:&stru_100073188];
  }
}

- (void)setConfigurationWithMessage:(id)a3
{
  id v4 = a3;
  id v5 = [v4 peer];
  if ([v5 hasEntitlement:@"com.apple.geoservices.custom-manifest-configuration"])
  {
    unsigned int v6 = [v4 userInfo];
    v7 = [v6 objectForKeyedSubscript:@"cfg"];

    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      uint64_t v8 = +[NSSet setWithObject:objc_opt_class()];
      objc_super v9 = +[NSKeyedUnarchiver unarchivedObjectOfClasses:v8 fromData:v7 error:0];

      if (v9)
      {
        [(NSMapTable *)self->_peerToConfiguration setObject:v9 forKey:v5];
        if (([(NSMutableSet *)self->_alreadyRegisteredConfigurations containsObject:v9] & 1) == 0)
        {
          [(NSMutableSet *)self->_alreadyRegisteredConfigurations addObject:v9];
          objc_super v10 = +[GEOResourceManifestManager modernManagerForConfiguration:v9];
          [v10 addServerProxyObserver:self];
          [v10 openServerConnection];
        }
      }
    }
    else
    {
      objc_super v9 = 0;
    }
  }
  else
  {
    long long v11 = GEOFindOrCreateLog();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_FAULT))
    {
      id v12 = [v5 bundleIdentifier];
      int v13 = 138543362;
      BOOL v14 = v12;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_FAULT, "Un-entitled process %{public}@ is trying to set a custom manifest configuration", (uint8_t *)&v13, 0xCu);
    }
  }
}

- (void)setActiveTileGroupIdentifierWithMessage:(id)a3
{
  id v4 = a3;
  id v5 = [v4 userInfo];
  unsigned int v6 = [v5 objectForKeyedSubscript:@"reply"];

  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    unsigned int v7 = [v6 BOOLValue];
  }
  else {
    unsigned int v7 = 0;
  }
  uint64_t v8 = [v4 userInfo];
  objc_super v9 = [v8 objectForKeyedSubscript:@"identifier"];

  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    if (v7)
    {
      objc_super v10 = [v4 userInfo];
      long long v11 = [v10 objectForKeyedSubscript:@"type"];
      id v12 = [v11 integerValue];

      int v13 = [v4 peer];
      BOOL v14 = [(GEOResourceManifestServer *)self _manifestManagerForPeer:v13];
      id v15 = [v14 serverProxy];
      v21[0] = _NSConcreteStackBlock;
      v21[1] = 3221225472;
      v21[2] = sub_1000438B0;
      v21[3] = &unk_100071468;
      id v22 = v4;
      [v15 setActiveTileGroupIdentifier:v9 updateType:v12 completionHandler:v21];
    }
    else
    {
      uint64_t v18 = [v4 peer];
      v19 = [(GEOResourceManifestServer *)self _manifestManagerForPeer:v18];
      id v20 = [v19 serverProxy];
      [v20 setActiveTileGroupIdentifier:v9];
    }
  }
  else if (v7)
  {
    v16 = +[NSError GEOErrorWithCode:-12 reason:@"Tile Group Identifier is not a number"];
    id v17 = +[NSDictionary _geo_replyDictionaryForError:v16 key:@"err"];
    [v4 sendReply:v17];
  }
}

- (void)updateIfNecessaryWithMessage:(id)a3
{
  id v4 = a3;
  id v5 = [v4 peer];
  unsigned int v6 = [(GEOResourceManifestServer *)self _manifestManagerForPeer:v5];
  unsigned int v7 = [v6 serverProxy];
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_1000439F0;
  v9[3] = &unk_100071468;
  id v10 = v4;
  id v8 = v4;
  [v7 updateIfNecessary:v9];
}

- (void)forceUpdateWithMessage:(id)a3
{
  id v4 = a3;
  id v5 = [v4 userInfo];
  unsigned int v6 = [v5 objectForKeyedSubscript:@"type"];
  id v7 = [v6 integerValue];

  id v8 = [v4 peer];
  objc_super v9 = [(GEOResourceManifestServer *)self _manifestManagerForPeer:v8];
  id v10 = [v9 serverProxy];
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_100043B70;
  v12[3] = &unk_100071468;
  id v13 = v4;
  id v11 = v4;
  [v10 forceUpdate:v7 completionHandler:v12];
}

- (void)resetActiveTileGroupWithMessage:(id)a3
{
  id v6 = [a3 peer];
  id v4 = [(GEOResourceManifestServer *)self _manifestManagerForPeer:v6];
  id v5 = [v4 serverProxy];
  [v5 resetActiveTileGroup];
}

- (void)setRequestTokenWithMessage:(id)a3
{
  id v4 = a3;
  id v5 = [v4 userInfo];
  id v6 = [v5 objectForKeyedSubscript:@"requestToken"];

  id v7 = [v4 peer];
  id v8 = [(GEOResourceManifestServer *)self _manifestManagerForPeer:v7];
  objc_super v9 = [v8 serverProxy];
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_100043D60;
  v11[3] = &unk_100071468;
  id v12 = v4;
  id v10 = v4;
  [v9 setManifestToken:v6 completionHandler:v11];
}

- (void)activateFilterWithRequest:(id)a3
{
  id v4 = a3;
  id v10 = [v4 filter];
  id v5 = [v4 peer];

  id v6 = [(GEOResourceManifestServer *)self _manifestManagerForPeer:v5];
  id v7 = [v6 serverProxy];

  if (v10 && v7)
  {
    id v8 = [v10 whichFilter];
    if (v8 == (id)3)
    {
      objc_super v9 = [v10 name];
      [v7 activateResourceName:v9];
    }
    else if (v8 == (id)2)
    {
      objc_msgSend(v7, "activateResourceScenario:", objc_msgSend(v10, "scenario"));
    }
    else if (v8 == (id)1)
    {
      objc_msgSend(v7, "activateResourceScale:", objc_msgSend(v10, "scale"));
    }
  }
}

- (void)deactivateFilterWithRequest:(id)a3
{
  id v4 = a3;
  id v10 = [v4 filter];
  id v5 = [v4 peer];

  id v6 = [(GEOResourceManifestServer *)self _manifestManagerForPeer:v5];
  id v7 = [v6 serverProxy];

  if (v10 && v7)
  {
    id v8 = [v10 whichFilter];
    if (v8 == (id)3)
    {
      objc_super v9 = [v10 name];
      [v7 deactivateResourceName:v9];
    }
    else if (v8 == (id)2)
    {
      objc_msgSend(v7, "deactivateResourceScenario:", objc_msgSend(v10, "scenario"));
    }
    else if (v8 == (id)1)
    {
      objc_msgSend(v7, "deactivateResourceScale:", objc_msgSend(v10, "scale"));
    }
  }
}

- (void)getMaximumZoomLevelWithMessage:(id)a3
{
  id v4 = a3;
  id v5 = [v4 userInfo];
  id v6 = [v5 objectForKeyedSubscript:@"style"];

  id v7 = [v4 userInfo];
  id v8 = [v7 objectForKeyedSubscript:@"scale"];

  if (v6 && v8)
  {
    id v9 = [v6 intValue];
    id v10 = [v8 intValue];
    unsigned int v19 = 2;
    id v11 = [v4 peer];
    id v12 = [(GEOResourceManifestServer *)self _manifestManagerForPeer:v11];
    id v13 = [v12 serverProxy];
    id v14 = [v13 maximumZoomLevelForStyle:v9 scale:v10 outSize:&v19];

    v20[0] = @"result";
    id v15 = +[NSNumber numberWithUnsignedInt:v14];
    v20[1] = @"idealSize";
    v21[0] = v15;
    v16 = +[NSNumber numberWithInt:v19];
    v21[1] = v16;
    id v17 = +[NSDictionary dictionaryWithObjects:v21 forKeys:v20 count:2];
    [v4 sendReply:v17];
  }
  else
  {
    uint64_t v18 = GEOFindOrCreateLog();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      LOWORD(v19) = 0;
      _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_ERROR, "Missing input parameters for message 'getMaximumZoomLevel'", (uint8_t *)&v19, 2u);
    }

    id v15 = +[NSError GEOErrorWithCode:-10 reason:@"Missing input parameters"];
    v16 = +[NSDictionary _geo_replyDictionaryForError:v15 key:@"err"];
    [v4 sendReply:v16];
  }
}

- (void)getResourceManifestWithMessage:(id)a3
{
  id v4 = a3;
  id v5 = [v4 peer];
  id v6 = [(GEOResourceManifestServer *)self _manifestManagerForPeer:v5];
  id v7 = [v6 serverProxy];
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_100044334;
  v9[3] = &unk_1000731B0;
  id v10 = v4;
  id v8 = v4;
  [v7 getResourceManifestWithHandler:v9];
}

- (void)_forEachPeerMatchingConfiguration:(id)a3 perform:(id)a4
{
  id v6 = a3;
  id v7 = (void (**)(id, void *))a4;
  id v8 = [(GEOResourceManifestServer *)self daemon];
  id v9 = [v8 peers];
  id v10 = [v9 copy];

  long long v20 = 0u;
  long long v21 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id v11 = v10;
  id v12 = [v11 countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v12)
  {
    id v13 = v12;
    uint64_t v14 = *(void *)v19;
    do
    {
      for (i = 0; i != v13; i = (char *)i + 1)
      {
        if (*(void *)v19 != v14) {
          objc_enumerationMutation(v11);
        }
        v16 = *(void **)(*((void *)&v18 + 1) + 8 * i);
        if (objc_msgSend(v16, "isForServerType:", 11, (void)v18))
        {
          id v17 = [(GEOResourceManifestServer *)self _configurationForPeer:v16];
          if ([v6 isEqual:v17]) {
            v7[2](v7, v16);
          }
        }
      }
      id v13 = [v11 countByEnumeratingWithState:&v18 objects:v22 count:16];
    }
    while (v13);
  }
}

- (void)serverProxy:(id)a3 didChangeActiveTileGroup:(id)a4 finishedCallback:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = [(GEOResourceManifestServer *)self daemon];
  id v12 = [v11 serverQueue];
  id v17 = v8;
  long long v18 = v9;
  long long v19 = v10;
  id v13 = v9;
  id v14 = v10;
  id v15 = v8;
  v16 = geo_dispatch_block_clean_copy();
  dispatch_async(v12, v16);
}

- (void)serverProxyNeedsWiFiResourceActivity:(id)a3
{
  if (sub_100022B80())
  {
    id v3 = [sub_100022D94() sharedScheduler];
    id v4 = [v3 taskRequestForIdentifier:@"com.apple.geod.OpportunisticResourceLoading"];
    id v5 = GEOFindOrCreateLog();
    id v6 = v5;
    if (v4)
    {
      if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138543362;
        CFStringRef v15 = @"com.apple.geod.OpportunisticResourceLoading";
        _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEBUG, "OpportunisticResourceLoading background task is already scheduled (%{public}@)", buf, 0xCu);
      }
    }
    else
    {
      if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "Ensuring existence of opportunistic resource loading background task.", buf, 2u);
      }

      id v7 = [sub_100022D94() sharedScheduler];
      id v6 = [v7 taskRequestForIdentifier:@"com.apple.geod.OpportunisticResourceLoading"];

      if (!v6)
      {
        id v8 = [objc_alloc((Class)sub_100022ED0()) initWithIdentifier:@"com.apple.geod.OpportunisticResourceLoading"];
        [v8 setPriority:1];
        [v8 setRequiresExternalPower:0];
        [v8 setRequiresNetworkConnectivity:1];
        [v8 setRequiresInexpensiveNetworkConnectivity:1];
        [v8 setNetworkDownloadSize:0x100000];
        [v8 setScheduleAfter:(double)GEOConfigGetInteger()];
        id v13 = 0;
        unsigned __int8 v9 = [v3 submitTaskRequest:v8 error:&v13];
        id v10 = (__CFString *)v13;
        if ((v9 & 1) == 0)
        {
          id v11 = GEOFindOrCreateLog();
          if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
          {
            CFStringRef v12 = @"Unknown";
            if (v10) {
              CFStringRef v12 = v10;
            }
            *(_DWORD *)buf = 138412290;
            CFStringRef v15 = v12;
            _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_ERROR, "Failed to submit nonrepeating task with error: %@", buf, 0xCu);
          }
        }
      }
    }
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_constrainedNetworkUpdateAssertion, 0);
  objc_storeStrong((id *)&self->_constrainedNetworkUpdateAssertionIsolation, 0);
  objc_storeStrong((id *)&self->_alreadyRegisteredConfigurations, 0);

  objc_storeStrong((id *)&self->_peerToConfiguration, 0);
}

@end