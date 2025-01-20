@interface GEOResourceManifestUpdateAssertionServer
+ (id)identifier;
- (BOOL)handleIncomingMessage:(id)a3 withObject:(id)a4 fromPeer:(id)a5 signpostId:(unint64_t)a6;
- (void)checkinForUpdateAssertionWithRequest:(id)a3;
- (void)peerDidDisconnect:(id)a3;
@end

@implementation GEOResourceManifestUpdateAssertionServer

+ (id)identifier
{
  return @"resourcemanifestupdateassertion";
}

- (BOOL)handleIncomingMessage:(id)a3 withObject:(id)a4 fromPeer:(id)a5 signpostId:(unint64_t)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  if (sub_100008D68(v10) == 2583)
  {
    BOOL v13 = 1;
    if (sub_100019858(v12, v11, @"resourcemanifestupdateassertion", v10, &off_100077A98, 1))
    {
      uint64_t v14 = objc_opt_class();
      v15 = sub_100008DBC(@"resourcemanifestupdateassertion", v10, v11, v14, v12);
      v16 = v15;
      BOOL v13 = v15 != 0;
      if (v15)
      {
        [v15 setSignpostId:a6];
        [(GEOResourceManifestUpdateAssertionServer *)self checkinForUpdateAssertionWithRequest:v16];
      }
    }
  }
  else
  {
    BOOL v13 = 0;
  }

  return v13;
}

- (void)peerDidDisconnect:(id)a3
{
  id v4 = a3;
  v5 = [(NSMapTable *)self->_peerToAssertionRecord objectForKey:v4];
  if (v5)
  {
    [(NSMapTable *)self->_peerToAssertionRecord removeObjectForKey:v4];
    v6 = +[GEOResourceManifestUpdateAssertionRegistry sharedRegistry];
    [v6 removeAssertion:v5];
  }
  v7.receiver = self;
  v7.super_class = (Class)GEOResourceManifestUpdateAssertionServer;
  [(GEOResourceManifestUpdateAssertionServer *)&v7 peerDidDisconnect:v4];
}

- (void)checkinForUpdateAssertionWithRequest:(id)a3
{
  id v4 = a3;
  v5 = [v4 peer];
  uint64_t v6 = [v5 bundleIdentifier];
  objc_super v7 = (void *)v6;
  v8 = @"<unknown>";
  if (v6) {
    v8 = (__CFString *)v6;
  }
  v9 = v8;

  id v10 = +[GEOResourceManifestUpdateAssertionRegistry sharedRegistry];
  id v11 = [v4 reason];
  [v4 timestamp];
  id v12 = objc_msgSend(v10, "addAssertionForProcess:reason:creationTimestamp:", v9, v11);

  peerToAssertionRecord = self->_peerToAssertionRecord;
  if (!peerToAssertionRecord)
  {
    uint64_t v14 = (NSMapTable *)[objc_alloc((Class)NSMapTable) initWithKeyOptions:512 valueOptions:0 capacity:5];
    v15 = self->_peerToAssertionRecord;
    self->_peerToAssertionRecord = v14;

    peerToAssertionRecord = self->_peerToAssertionRecord;
  }
  v16 = [v4 peer];
  v17 = [(NSMapTable *)peerToAssertionRecord objectForKey:v16];

  if (v17)
  {
    v18 = GEOGetResourceManifestLog();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_FAULT))
    {
      v19 = [v4 reason];
      int v23 = 138543618;
      v24 = v9;
      __int16 v25 = 2114;
      v26 = v19;
      _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_FAULT, "Process '%{public}@' already has an existing update assertion on this connection (reason: '%{public}@')", (uint8_t *)&v23, 0x16u);
    }
    v20 = +[GEOResourceManifestUpdateAssertionRegistry sharedRegistry];
    [v20 removeAssertion:v17];
  }
  v21 = self->_peerToAssertionRecord;
  v22 = [v4 peer];
  [(NSMapTable *)v21 setObject:v12 forKey:v22];
}

- (void).cxx_destruct
{
}

@end