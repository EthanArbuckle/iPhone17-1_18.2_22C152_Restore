@interface PLAssetsdResourceAvailabilityService
- (PLAssetsdResourceAvailabilityService)initWithLibraryServicesManager:(id)a3 shellObject:(id)a4 trustedCallerBundleID:(id)a5 clientPid:(int)a6;
- (PLCacheMetricsCollectorServerShell)cacheMetricsShellObject;
- (id)_clientPidPrefixedTaskIdentifierWithTaskIdentifier:(id)a3;
- (id)appyCorrectionsToAssetWithRequest:(id)a3 errorCodes:(id)a4 reply:(id)a5;
- (id)appyCorrectionsToResourceWithRequest:(id)a3 errorCodes:(id)a4 reply:(id)a5;
- (id)makeResourceAvailableWithRequest:(id)a3 reply:(id)a4;
- (id)runVideoRequest:(id)a3 reply:(id)a4;
- (void)initializeSharedMemoryForCacheMetricsCollector:(id)a3;
- (void)makeResourceUnavailableWithRequest:(id)a3;
@end

@implementation PLAssetsdResourceAvailabilityService

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cacheMetricsShellObject, 0);

  objc_storeStrong((id *)&self->_trustedCallerBundleID, 0);
}

- (PLCacheMetricsCollectorServerShell)cacheMetricsShellObject
{
  return self->_cacheMetricsShellObject;
}

- (void)initializeSharedMemoryForCacheMetricsCollector:(id)a3
{
  id v4 = a3;
  long long v13 = 0u;
  *(_OWORD *)sel = 0u;
  long long v11 = 0u;
  unsigned int v5 = +[PLXPCMessageLogger enabled];
  LOBYTE(v11) = v5;
  if (v5)
  {
    *((void *)&v11 + 1) = _os_activity_create((void *)&_mh_execute_header, "PLXPC Service: initializeSharedMemoryForCacheMetricsCollector:", (os_activity_t)&_os_activity_current, OS_ACTIVITY_FLAG_DEFAULT);

    os_activity_scope_enter(*((os_activity_t *)&v11 + 1), (os_activity_scope_state_t)((char *)&v13 + 8));
  }
  v6 = objc_msgSend(v4, "object", (void)v11);
  id v7 = [objc_alloc((Class)PLCacheMetricsCollectorServer) initWithXPCObject:v6];
  [(PLCacheMetricsCollectorServerShell *)self->_cacheMetricsShellObject setCacheMetricsCollectorServer:v7];

  if (v12) {
    os_activity_scope_leave((os_activity_scope_state_t)((char *)&v13 + 8));
  }
  if ((void)v13)
  {
    v8 = PLRequestGetLog();
    v9 = v8;
    if ((unint64_t)(v13 - 1) <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v8))
    {
      Name = sel_getName(sel[1]);
      *(_DWORD *)buf = 136446210;
      v16 = Name;
      _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v9, OS_SIGNPOST_INTERVAL_END, v13, "PLXPC Sync", "%{public}s", buf, 0xCu);
    }
  }
}

- (id)appyCorrectionsToAssetWithRequest:(id)a3 errorCodes:(id)a4 reply:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = -[PLAssetsdResourceAvailabilityService newShortLivedLibraryWithName:](self, "newShortLivedLibraryWithName:", "-[PLAssetsdResourceAvailabilityService appyCorrectionsToAssetWithRequest:errorCodes:reply:]");
  id v23 = 0;
  char v12 = sub_10000BA34(v11, &v23);
  id v13 = v23;
  if (v12)
  {
    id v14 = objc_alloc((Class)PHServerResourceRequestRunner);
    v15 = [v8 taskIdentifier];
    v16 = [(PLAssetsdResourceAvailabilityService *)self _clientPidPrefixedTaskIdentifierWithTaskIdentifier:v15];
    id v17 = [v14 initWithTaskIdentifier:v16];

    trustedCallerBundleID = self->_trustedCallerBundleID;
    v21[0] = _NSConcreteStackBlock;
    v21[1] = 3221225472;
    v21[2] = sub_10000BCBC;
    v21[3] = &unk_10002CE48;
    id v22 = v10;
    v19 = [v17 applyAssetScopeCorrectionsWithRequest:v8 errorCodes:v9 clientBundleID:trustedCallerBundleID library:v11 reply:v21];
  }
  else
  {
    (*((void (**)(id, void, id))v10 + 2))(v10, 0, v13);
    v19 = 0;
  }

  return v19;
}

- (id)appyCorrectionsToResourceWithRequest:(id)a3 errorCodes:(id)a4 reply:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = -[PLAssetsdResourceAvailabilityService newShortLivedLibraryWithName:](self, "newShortLivedLibraryWithName:", "-[PLAssetsdResourceAvailabilityService appyCorrectionsToResourceWithRequest:errorCodes:reply:]");
  id v23 = 0;
  char v12 = sub_10000BA34(v11, &v23);
  id v13 = v23;
  if (v12)
  {
    id v14 = objc_alloc((Class)PHServerResourceRequestRunner);
    v15 = [v8 taskIdentifier];
    v16 = [(PLAssetsdResourceAvailabilityService *)self _clientPidPrefixedTaskIdentifierWithTaskIdentifier:v15];
    id v17 = [v14 initWithTaskIdentifier:v16];

    trustedCallerBundleID = self->_trustedCallerBundleID;
    v21[0] = _NSConcreteStackBlock;
    v21[1] = 3221225472;
    v21[2] = sub_10000BEDC;
    v21[3] = &unk_10002CE48;
    id v22 = v10;
    v19 = [v17 applyResourceScopeCorrectionsWithRequest:v8 errorCodes:v9 clientBundleID:trustedCallerBundleID library:v11 reply:v21];
  }
  else
  {
    (*((void (**)(id, void, id))v10 + 2))(v10, 0, v13);
    v19 = 0;
  }

  return v19;
}

- (id)runVideoRequest:(id)a3 reply:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = -[PLAssetsdResourceAvailabilityService newShortLivedLibraryWithName:](self, "newShortLivedLibraryWithName:", "-[PLAssetsdResourceAvailabilityService runVideoRequest:reply:]");
  id v24 = 0;
  char v9 = sub_10000BA34(v8, &v24);
  id v10 = v24;
  if (v9)
  {
    id v11 = +[NSDate date];
    char v12 = [v6 taskIdentifier];
    id v13 = [(PLAssetsdResourceAvailabilityService *)self _clientPidPrefixedTaskIdentifierWithTaskIdentifier:v12];

    id v14 = [objc_alloc((Class)PHServerResourceRequestRunner) initWithTaskIdentifier:v13];
    trustedCallerBundleID = self->_trustedCallerBundleID;
    v20[0] = _NSConcreteStackBlock;
    v20[1] = 3221225472;
    v20[2] = sub_10000C124;
    v20[3] = &unk_10002CE20;
    id v21 = v11;
    id v22 = v13;
    id v23 = v7;
    id v16 = v13;
    id v17 = v11;
    v18 = [v14 chooseVideoWithRequest:v6 library:v8 clientBundleID:trustedCallerBundleID reply:v20];
  }
  else
  {
    (*((void (**)(id, void, void, void, void, void, id))v7 + 2))(v7, 0, 0, 0, 0, 0, v10);
    v18 = 0;
  }

  return v18;
}

- (void)makeResourceUnavailableWithRequest:(id)a3
{
  id v9 = a3;
  id v4 = -[PLAssetsdResourceAvailabilityService newShortLivedLibraryWithName:](self, "newShortLivedLibraryWithName:", "-[PLAssetsdResourceAvailabilityService makeResourceUnavailableWithRequest:]");
  if (sub_10000BA34(v4, 0))
  {
    id v5 = objc_alloc((Class)PHServerResourceRequestRunner);
    id v6 = [v9 taskIdentifier];
    id v7 = [(PLAssetsdResourceAvailabilityService *)self _clientPidPrefixedTaskIdentifierWithTaskIdentifier:v6];
    id v8 = [v5 initWithTaskIdentifier:v7];

    [v8 makeResourceUnavailableWithRequest:v9 library:v4];
  }
}

- (id)makeResourceAvailableWithRequest:(id)a3 reply:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = -[PLAssetsdResourceAvailabilityService newShortLivedLibraryWithName:](self, "newShortLivedLibraryWithName:", "-[PLAssetsdResourceAvailabilityService makeResourceAvailableWithRequest:reply:]");
  id v25 = 0;
  char v9 = sub_10000BA34(v8, &v25);
  id v10 = v25;
  if (v9)
  {
    id v11 = +[NSDate date];
    char v12 = [v6 taskIdentifier];
    id v13 = [(PLAssetsdResourceAvailabilityService *)self _clientPidPrefixedTaskIdentifierWithTaskIdentifier:v12];

    id v14 = [objc_alloc((Class)PHServerResourceRequestRunner) initWithTaskIdentifier:v13];
    trustedCallerBundleID = self->_trustedCallerBundleID;
    v20[0] = _NSConcreteStackBlock;
    v20[1] = 3221225472;
    v20[2] = sub_10000C5B0;
    v20[3] = &unk_10002CDF8;
    id v21 = v11;
    id v22 = v6;
    id v23 = v13;
    id v24 = v7;
    id v16 = v13;
    id v17 = v11;
    v18 = [v14 makeResourceAvailableWithRequest:v22 library:v8 clientBundleID:trustedCallerBundleID reply:v20];
  }
  else
  {
    (*((void (**)(id, void, void, void, void, id))v7 + 2))(v7, 0, 0, 0, 0, v10);
    v18 = 0;
  }

  return v18;
}

- (id)_clientPidPrefixedTaskIdentifierWithTaskIdentifier:(id)a3
{
  return +[NSString stringWithFormat:@"(%lu)%@", self->_clientPid, a3];
}

- (PLAssetsdResourceAvailabilityService)initWithLibraryServicesManager:(id)a3 shellObject:(id)a4 trustedCallerBundleID:(id)a5 clientPid:(int)a6
{
  id v11 = a4;
  id v12 = a5;
  v16.receiver = self;
  v16.super_class = (Class)PLAssetsdResourceAvailabilityService;
  id v13 = [(PLAssetsdResourceAvailabilityService *)&v16 initWithLibraryServicesManager:a3];
  id v14 = v13;
  if (v13)
  {
    objc_storeStrong((id *)&v13->_cacheMetricsShellObject, a4);
    objc_storeStrong((id *)&v14->_trustedCallerBundleID, a5);
    v14->_clientPid = a6;
  }

  return v14;
}

@end