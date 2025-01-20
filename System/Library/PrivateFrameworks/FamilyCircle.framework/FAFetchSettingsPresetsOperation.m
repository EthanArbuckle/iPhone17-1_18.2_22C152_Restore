@interface FAFetchSettingsPresetsOperation
- (FAFetchSettingsPresetsOperation)initWithFamilyCircleProvider:(id)a3;
- (FAFetchSettingsPresetsOperation)initWithFamilyCircleProvider:(id)a3 fetchFromCache:(BOOL)a4;
- (FAFetchSettingsPresetsOperation)initWithFamilyCircleProvider:(id)a3 presetsProvider:(id)a4;
- (FAPresetsProviderProtocol)presetsProvider;
- (id)_currentPresets:(id)a3 expectedPreset:(id)a4;
- (id)_presetsWithCurrentConfiguration:(id)a3 expectedPreset:(id)a4;
- (id)familyCircleProvider;
- (id)presetsForMemberWithAltDSID:(id)a3;
- (id)presetsForMemberWithAltDSID:(id)a3 age:(id)a4;
- (void)setFamilyCircleProvider:(id)a3;
- (void)setPresetsProvider:(id)a3;
@end

@implementation FAFetchSettingsPresetsOperation

- (FAFetchSettingsPresetsOperation)initWithFamilyCircleProvider:(id)a3 presetsProvider:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v12.receiver = self;
  v12.super_class = (Class)FAFetchSettingsPresetsOperation;
  v8 = [(FAFetchSettingsPresetsOperation *)&v12 init];
  if (v8)
  {
    id v9 = objc_retainBlock(v6);
    id familyCircleProvider = v8->_familyCircleProvider;
    v8->_id familyCircleProvider = v9;

    objc_storeStrong((id *)&v8->_presetsProvider, a4);
  }

  return v8;
}

- (FAFetchSettingsPresetsOperation)initWithFamilyCircleProvider:(id)a3
{
  return [(FAFetchSettingsPresetsOperation *)self initWithFamilyCircleProvider:a3 fetchFromCache:0];
}

- (FAFetchSettingsPresetsOperation)initWithFamilyCircleProvider:(id)a3 fetchFromCache:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  id v7 = [FANetworkService alloc];
  v8 = objc_alloc_init(FADeviceInfo);
  id v9 = objc_alloc_init((Class)FAURLConfiguration);
  v10 = +[AAURLSession sharedSession];
  v11 = [(FANetworkService *)v7 initWithAccount:0 deviceInfo:v8 urlProvider:v9 urlSession:v10];

  objc_super v12 = objc_alloc_init(FAStoreFrontProvider);
  if (v4)
  {
    v13 = objc_alloc_init(FASettingPresetsCache);
    v14 = [[FACachedPresetsProvider alloc] initWithNetworkService:v11 cache:v13 storeFrontProvider:v12];
  }
  else
  {
    v14 = [[FAICSSPresetsProvider alloc] initWithNetworkService:v11 storeFrontProvider:v12];
  }
  v15 = [(FAFetchSettingsPresetsOperation *)self initWithFamilyCircleProvider:v6 presetsProvider:v14];

  return v15;
}

- (id)_currentPresets:(id)a3 expectedPreset:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = objc_alloc((Class)AAFPromise);
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_100009E60;
  v13[3] = &unk_10004D4B0;
  id v14 = v6;
  v15 = self;
  id v16 = v7;
  id v9 = v7;
  id v10 = v6;
  id v11 = [v8 initWithBlock:v13];

  return v11;
}

- (id)_presetsWithCurrentConfiguration:(id)a3 expectedPreset:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  id v7 = objc_alloc_init((Class)NSMutableDictionary);
  [v6 sources];
  long long v40 = 0u;
  long long v41 = 0u;
  long long v42 = 0u;
  long long v43 = 0u;
  id v8 = (id)objc_claimAutoreleasedReturnValue();
  id v9 = [v8 countByEnumeratingWithState:&v40 objects:v45 count:16];
  if (v9)
  {
    id v10 = v9;
    id v33 = v6;
    id obj = v8;
    uint64_t v11 = *(void *)v41;
LABEL_3:
    uint64_t v12 = 0;
    while (1)
    {
      if (*(void *)v41 != v11) {
        objc_enumerationMutation(obj);
      }
      v13 = *(void **)(*((void *)&v40 + 1) + 8 * v12);
      id v14 = [v13 identifier];
      unsigned __int8 v15 = [v14 isEqualToString:@"com.apple.ScreenTime"];

      if (v15) {
        break;
      }
      if (v10 == (id)++v12)
      {
        id v8 = obj;
        id v10 = [obj countByEnumeratingWithState:&v40 objects:v45 count:16];
        if (v10) {
          goto LABEL_3;
        }
        id v16 = 0;
        v17 = obj;
        id v6 = v33;
        goto LABEL_34;
      }
    }
    id v16 = v13;
    id v8 = obj;

    if (!v16)
    {
      id v6 = v33;
      goto LABEL_36;
    }
    id v32 = v16;
    v31 = [v16 configuration];
    [v31 values];
    long long v36 = 0u;
    long long v37 = 0u;
    long long v38 = 0u;
    long long v39 = 0u;
    id v35 = (id)objc_claimAutoreleasedReturnValue();
    id v18 = [v35 countByEnumeratingWithState:&v36 objects:v44 count:16];
    if (v18)
    {
      id v19 = v18;
      uint64_t v20 = *(void *)v37;
      do
      {
        for (i = 0; i != v19; i = (char *)i + 1)
        {
          if (*(void *)v37 != v20) {
            objc_enumerationMutation(v35);
          }
          v22 = *(void **)(*((void *)&v36 + 1) + 8 * i);
          if ([v22 isEqual:@"media.settings.allowBookstoreErotica"])
          {
            v23 = +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", [v5 isExplicitMediaAllowed]);
            [v7 setObject:v23 forKeyedSubscript:v22];
          }
          if ([v22 isEqual:@"system.apple.allowRemoval"])
          {
            v24 = +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", [v5 isDeletingAppsAllowed]);
            [v7 setObject:v24 forKeyedSubscript:v22];
          }
          if ([v22 isEqual:@"system.ratings.ratingTVShows"])
          {
            v25 = [v5 allowedTVRating];
            [v7 setObject:v25 forKeyedSubscript:v22];
          }
          if ([v22 isEqual:@"system.ratings.allowExplicitContent"])
          {
            v26 = +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", [v5 isExplicitMediaAllowed]);
            [v7 setObject:v26 forKeyedSubscript:v22];
          }
          if ([v22 isEqual:@"system.ratings.ratingApps"])
          {
            v27 = [v5 allowedAppStoreRating];
            [v7 setObject:v27 forKeyedSubscript:v22];
          }
          if ([v22 isEqual:@"system.music.allowMusicVideos"])
          {
            v28 = +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", [v5 areMusicVideosAllowed]);
            [v7 setObject:v28 forKeyedSubscript:v22];
          }
          if ([v22 isEqual:@"system.ratings.ratingMovies"])
          {
            v29 = [v5 allowedMovieRating];
            [v7 setObject:v29 forKeyedSubscript:v22];
          }
        }
        id v19 = [v35 countByEnumeratingWithState:&v36 objects:v44 count:16];
      }
      while (v19);
    }
    id v16 = [objc_alloc((Class)FASettingsPreset) initWithDictionary:v7];

    id v6 = v33;
    id v8 = obj;
    v17 = v32;
  }
  else
  {
    id v16 = 0;
    v17 = v8;
  }
LABEL_34:

LABEL_36:
  return v16;
}

- (id)presetsForMemberWithAltDSID:(id)a3
{
  return [(FAFetchSettingsPresetsOperation *)self presetsForMemberWithAltDSID:a3 age:0];
}

- (id)presetsForMemberWithAltDSID:(id)a3 age:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(FAFetchSettingsPresetsOperation *)self familyCircleProvider];
  v23 = v8[2]();
  v28[0] = v23;
  v22 = [(FAFetchSettingsPresetsOperation *)self presetsProvider];
  v21 = [v22 availablePresets];
  v28[1] = v21;
  id v9 = +[NSArray arrayWithObjects:v28 count:2];
  id v10 = +[AAFPromise all:v9];
  uint64_t v11 = [v10 then];
  v25[0] = _NSConcreteStackBlock;
  v25[1] = 3221225472;
  v25[2] = sub_10000A754;
  v25[3] = &unk_10004D4F8;
  id v26 = v6;
  id v27 = v7;
  uint64_t v12 = (void (*)(void *, void *))v11[2];
  id v20 = v7;
  id v13 = v6;
  id v14 = v12(v11, v25);
  unsigned __int8 v15 = [v14 then];
  v24[0] = _NSConcreteStackBlock;
  v24[1] = 3221225472;
  v24[2] = sub_10000AA9C;
  v24[3] = &unk_10004D520;
  v24[4] = self;
  id v16 = ((void (**)(void, void *))v15)[2](v15, v24);
  v17 = [v16 then];
  id v18 = ((void (**)(void, Block_layout *))v17)[2](v17, &stru_10004D560);

  return v18;
}

- (id)familyCircleProvider
{
  return self->_familyCircleProvider;
}

- (void)setFamilyCircleProvider:(id)a3
{
}

- (FAPresetsProviderProtocol)presetsProvider
{
  return self->_presetsProvider;
}

- (void)setPresetsProvider:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_presetsProvider, 0);
  objc_storeStrong(&self->_familyCircleProvider, 0);
}

@end