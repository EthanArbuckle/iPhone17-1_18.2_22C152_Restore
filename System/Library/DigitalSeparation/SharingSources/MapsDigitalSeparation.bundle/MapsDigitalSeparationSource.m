@interface MapsDigitalSeparationSource
- (BOOL)_shouldReportSharedTripServiceError:(id)a3;
- (NSString)name;
- (void)_didFetchSharedResources:(id)a3 withErrors:(id)a4 completion:(id)a5;
- (void)_fetchActiveSharedTripWithCompletion:(id)a3;
- (void)_fetchFavoritesWithCompletion:(id)a3;
- (void)_fetchFavoritesWithStore:(id)a3 withCompletion:(id)a4;
- (void)_performOperationsInParallelForSharing:(id)a3 favorites:(id)a4 completion:(id)a5;
- (void)fetchSharedResourcesWithCompletion:(id)a3;
- (void)stopAllSharingWithCompletion:(id)a3;
- (void)stopSharing:(id)a3 withCompletion:(id)a4;
- (void)stopSharingWithParticipant:(id)a3 completion:(id)a4;
@end

@implementation MapsDigitalSeparationSource

- (NSString)name
{
  return (NSString *)DSSourceNameMaps;
}

- (void)fetchSharedResourcesWithCompletion:(id)a3
{
  id v4 = a3;
  unsigned __int8 v5 = +[MSPMapsInstallState isMapsAppInstalled];
  self->_mapsIsInstalled = v5;
  v6 = sub_78F0();
  BOOL v7 = os_log_type_enabled(v6, OS_LOG_TYPE_INFO);
  if (v5)
  {
    if (v7)
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_0, v6, OS_LOG_TYPE_INFO, "Will fetch shared resources...", buf, 2u);
    }

    v8 = dispatch_group_create();
    id v9 = objc_alloc_init((Class)NSMutableArray);
    id v10 = [objc_alloc((Class)NSMutableArray) initWithCapacity:2];
    dispatch_group_enter(v8);
    v27[0] = _NSConcreteStackBlock;
    v27[1] = 3221225472;
    v27[2] = sub_7944;
    v27[3] = &unk_CDD0;
    id v11 = v9;
    id v28 = v11;
    id v12 = v10;
    id v29 = v12;
    v13 = v8;
    v30 = v13;
    [(MapsDigitalSeparationSource *)self _fetchActiveSharedTripWithCompletion:v27];
    dispatch_group_enter(v13);
    v23[0] = _NSConcreteStackBlock;
    v23[1] = 3221225472;
    v23[2] = sub_7A4C;
    v23[3] = &unk_CDF8;
    id v14 = v11;
    id v24 = v14;
    id v15 = v12;
    id v25 = v15;
    v26 = v13;
    v16 = v13;
    [(MapsDigitalSeparationSource *)self _fetchFavoritesWithCompletion:v23];
    v19[0] = _NSConcreteStackBlock;
    v19[1] = 3221225472;
    v19[2] = sub_7B40;
    v19[3] = &unk_CE20;
    v19[4] = self;
    id v20 = v14;
    id v21 = v15;
    id v22 = v4;
    id v17 = v15;
    id v18 = v14;
    dispatch_group_notify(v16, (dispatch_queue_t)&_dispatch_main_q, v19);
  }
  else
  {
    if (v7)
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_0, v6, OS_LOG_TYPE_INFO, "Will not fetch shared resources, Maps not installed", buf, 2u);
    }

    v16 = +[NSError errorWithDomain:DSSourceNameMaps code:404 userInfo:0];
    (*((void (**)(id, void *, NSObject *))v4 + 2))(v4, &__NSArray0__struct, v16);
  }
}

- (void)_didFetchSharedResources:(id)a3 withErrors:(id)a4 completion:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  id v9 = (void (**)(id, id, void *))a5;
  id v10 = [v8 count];
  id v11 = sub_78F0();
  id v12 = v11;
  if (v10)
  {
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      int v18 = 134218242;
      id v19 = [v7 count];
      __int16 v20 = 2114;
      id v21 = v8;
      v13 = "Fetched %lu resources, encountered errors: %{public}@,";
      id v14 = v12;
      os_log_type_t v15 = OS_LOG_TYPE_ERROR;
      uint32_t v16 = 22;
LABEL_6:
      _os_log_impl(&dword_0, v14, v15, v13, (uint8_t *)&v18, v16);
    }
  }
  else if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
  {
    int v18 = 134217984;
    id v19 = [v7 count];
    v13 = "Fetched %lu resources";
    id v14 = v12;
    os_log_type_t v15 = OS_LOG_TYPE_INFO;
    uint32_t v16 = 12;
    goto LABEL_6;
  }

  id v17 = [v8 firstObject];
  v9[2](v9, v7, v17);
}

- (void)stopSharing:(id)a3 withCompletion:(id)a4
{
  v6 = (__CFString *)a3;
  id v7 = a4;
  if (!self->_mapsIsInstalled)
  {
    id v9 = sub_78F0();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138477827;
      id v19 = v6;
      _os_log_impl(&dword_0, v9, OS_LOG_TYPE_ERROR, "Cannot stop sharing resource %{private}@, Maps is not installed", buf, 0xCu);
    }
    goto LABEL_22;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v8 = sub_78F0();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_0, v8, OS_LOG_TYPE_INFO, "Will stop active trip sharing...", buf, 2u);
    }

    [(__CFString *)v6 _ds_stopSharingWithCompletion:v7];
    goto LABEL_23;
  }
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();
  id v11 = sub_78F0();
  id v9 = v11;
  if ((isKindOfClass & 1) == 0)
  {
    if (!os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
LABEL_22:

      goto LABEL_23;
    }
    id v12 = v6;
    if (!v12)
    {
      id v17 = @"<nil>";
      goto LABEL_21;
    }
    v13 = (objc_class *)objc_opt_class();
    id v14 = NSStringFromClass(v13);
    if (objc_opt_respondsToSelector())
    {
      os_log_type_t v15 = [(__CFString *)v12 performSelector:"accessibilityIdentifier"];
      uint32_t v16 = v15;
      if (v15 && ![v15 isEqualToString:v14])
      {
        id v17 = +[NSString stringWithFormat:@"%@<%p, %@>", v14, v12, v16];

        goto LABEL_19;
      }
    }
    id v17 = +[NSString stringWithFormat:@"%@<%p>", v14, v12];
LABEL_19:

LABEL_21:
    *(_DWORD *)buf = 138412290;
    id v19 = v17;
    _os_log_impl(&dword_0, v9, OS_LOG_TYPE_ERROR, "Asked to stop sharing with resource we don't recognise: %@", buf, 0xCu);

    goto LABEL_22;
  }
  if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138477827;
    id v19 = v6;
    _os_log_impl(&dword_0, v9, OS_LOG_TYPE_INFO, "Will stop sharing in Favorite %{private}@...", buf, 0xCu);
  }

  [(__CFString *)v6 _ds_stopSharing];
LABEL_23:
}

- (void)stopSharingWithParticipant:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  BOOL mapsIsInstalled = self->_mapsIsInstalled;
  id v9 = sub_78F0();
  id v10 = v9;
  if (mapsIsInstalled)
  {
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138477827;
      id v19 = v6;
      _os_log_impl(&dword_0, v10, OS_LOG_TYPE_INFO, "Will stop sharing with participant '%{private}@'...", buf, 0xCu);
    }

    v16[0] = _NSConcreteStackBlock;
    v16[1] = 3221225472;
    v16[2] = sub_8200;
    v16[3] = &unk_CE70;
    id v17 = v6;
    v14[0] = _NSConcreteStackBlock;
    v14[1] = 3221225472;
    v14[2] = sub_8368;
    v14[3] = &unk_CE98;
    id v15 = v17;
    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472;
    v12[2] = sub_8530;
    v12[3] = &unk_CEC0;
    id v13 = v7;
    [(MapsDigitalSeparationSource *)self _performOperationsInParallelForSharing:v16 favorites:v14 completion:v12];

    id v11 = v17;
  }
  else
  {
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138477827;
      id v19 = v6;
      _os_log_impl(&dword_0, v10, OS_LOG_TYPE_ERROR, "Cannot stop sharing with participant %{private}@, Maps is not installed", buf, 0xCu);
    }

    id v11 = +[NSError errorWithDomain:DSSourceNameMaps code:404 userInfo:0];
    (*((void (**)(id, id))v7 + 2))(v7, v11);
  }
}

- (void)stopAllSharingWithCompletion:(id)a3
{
  id v4 = a3;
  BOOL mapsIsInstalled = self->_mapsIsInstalled;
  id v6 = sub_78F0();
  id v7 = v6;
  if (mapsIsInstalled)
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_0, v7, OS_LOG_TYPE_INFO, "Will stop all sharing...", buf, 2u);
    }

    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3221225472;
    v9[2] = sub_8B50;
    v9[3] = &unk_CEC0;
    id v10 = v4;
    [(MapsDigitalSeparationSource *)self _performOperationsInParallelForSharing:&stru_CF00 favorites:&stru_CF40 completion:v9];
    id v8 = v10;
  }
  else
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_0, v7, OS_LOG_TYPE_ERROR, "Cannot stop all sharing, Maps is not installed", buf, 2u);
    }

    id v8 = +[NSError errorWithDomain:DSSourceNameMaps code:404 userInfo:0];
    (*((void (**)(id, void *))v4 + 2))(v4, v8);
  }
}

- (void)_fetchFavoritesWithCompletion:(id)a3
{
  id v4 = a3;
  store = self->_store;
  id v6 = sub_78F0();
  BOOL v7 = os_log_type_enabled(v6, OS_LOG_TYPE_INFO);
  if (store)
  {
    if (v7)
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_0, v6, OS_LOG_TYPE_INFO, "Will fetch favorites from sync...", buf, 2u);
    }

    [(MapsDigitalSeparationSource *)self _fetchFavoritesWithStore:self->_store withCompletion:v4];
  }
  else
  {
    if (v7)
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_0, v6, OS_LOG_TYPE_INFO, "Preparing sync store for first use...", buf, 2u);
    }

    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472;
    v8[2] = sub_8D18;
    v8[3] = &unk_CF90;
    v8[4] = self;
    id v9 = v4;
    +[_TtC8MapsSync13MapsSyncStore withDefaultStoreWithBlock:v8];
  }
}

- (void)_fetchActiveSharedTripWithCompletion:(id)a3
{
  id v4 = a3;
  unsigned __int8 v5 = sub_78F0();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_0, v5, OS_LOG_TYPE_INFO, "Will check-in with shared trip service for active sharing...", buf, 2u);
  }

  id v6 = +[MSPSharedTripService sharedInstance];
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_8FE0;
  v8[3] = &unk_CFB8;
  v8[4] = self;
  id v9 = v4;
  id v7 = v4;
  [v6 performBlockAfterInitialConnection:v8];
}

- (BOOL)_shouldReportSharedTripServiceError:(id)a3
{
  id v3 = a3;
  BOOL v4 = [v3 code] == (char *)&dword_0 + 1
    || [v3 code] == (char *)&dword_14 + 2
    || [v3 code] == (char *)&dword_0 + 3;

  return v4;
}

- (void)_fetchFavoritesWithStore:(id)a3 withCompletion:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  id v7 = objc_alloc((Class)_TtC8MapsSync20MapsSyncQueryOptions);
  id v8 = +[_TtC8MapsSync22MapsSyncQueryPredicate queryPredicateWithFormat:@"contactHandles.@count != 0" argumentArray:0];
  id v9 = [v7 initWithPredicate:v8 sortDescriptors:0 range:0];

  id v10 = [objc_alloc((Class)MSFavoriteItemRequest) initWithStore:v6];
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_93B8;
  v12[3] = &unk_CFE0;
  id v13 = v5;
  id v11 = v5;
  [v10 fetchWithOptions:v9 completionHandler:v12];
}

- (void)_performOperationsInParallelForSharing:(id)a3 favorites:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = dispatch_group_create();
  id v12 = [objc_alloc((Class)NSMutableArray) initWithCapacity:2];
  dispatch_group_enter(v11);
  v29[0] = _NSConcreteStackBlock;
  v29[1] = 3221225472;
  v29[2] = sub_9708;
  v29[3] = &unk_D008;
  id v13 = v12;
  id v30 = v13;
  id v14 = v11;
  v31 = v14;
  id v32 = v8;
  id v15 = v8;
  [(MapsDigitalSeparationSource *)self _fetchActiveSharedTripWithCompletion:v29];
  dispatch_group_enter(v14);
  v24[0] = _NSConcreteStackBlock;
  v24[1] = 3221225472;
  v24[2] = sub_9794;
  v24[3] = &unk_D030;
  id v16 = v13;
  id v25 = v16;
  v26 = v14;
  v27 = self;
  id v28 = v9;
  id v17 = v9;
  int v18 = v14;
  [(MapsDigitalSeparationSource *)self _fetchFavoritesWithCompletion:v24];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_9804;
  block[3] = &unk_D058;
  id v22 = v16;
  id v23 = v10;
  id v19 = v10;
  id v20 = v16;
  dispatch_group_notify(v18, (dispatch_queue_t)&_dispatch_main_q, block);
}

- (void).cxx_destruct
{
}

@end