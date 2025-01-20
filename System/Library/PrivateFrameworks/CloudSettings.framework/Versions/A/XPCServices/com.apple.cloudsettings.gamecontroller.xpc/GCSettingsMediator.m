@interface GCSettingsMediator
- (GCSettingsMediator)init;
- (id)controllers;
- (id)copilotFusedControllers;
- (id)games;
- (id)mergeControllers:(id)a3;
- (id)mergeCopilotFusedControllers:(id)a3;
- (id)mergeGames:(id)a3;
- (id)mergeProfiles:(id)a3;
- (id)mergedDictForTombstonesLookup:(id)a3 dataLookup:(id)a4;
- (id)mergedTombstonesForRemoteDictionary:(id)a3 localDictionary:(id)a4;
- (id)profiles;
- (id)storeVersion;
- (void)registerKeys;
- (void)setControllers:(id)a3;
- (void)setCopilotFusedControllers:(id)a3;
- (void)setGames:(id)a3;
- (void)setProfiles:(id)a3;
- (void)setStoreVersion:(id)a3;
@end

@implementation GCSettingsMediator

- (GCSettingsMediator)init
{
  v3.receiver = self;
  v3.super_class = (Class)GCSettingsMediator;
  return [(GCSettingsMediator *)&v3 init];
}

- (void)registerKeys
{
  objc_super v3 = getGCSLogger();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v12 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "GCSettingsMediator::registerKeys", v12, 2u);
  }

  [(GCSettingsMediator *)self registerKey:@"settingsVersion" getter:"storeVersion" setter:"setStoreVersion:"];
  v4 = (objc_class *)objc_opt_class();
  v5 = NSStringFromClass(v4);
  [(GCSettingsMediator *)self registerKey:@"controllers" getter:"controllers" setter:"setControllers:" merger:"mergeControllers:" type:v5];

  v6 = (objc_class *)objc_opt_class();
  v7 = NSStringFromClass(v6);
  [(GCSettingsMediator *)self registerKey:@"games" getter:"games" setter:"setGames:" merger:"mergeGames:" type:v7];

  v8 = (objc_class *)objc_opt_class();
  v9 = NSStringFromClass(v8);
  [(GCSettingsMediator *)self registerKey:@"copilotFusedControllers" getter:"copilotFusedControllers" setter:"setCopilotFusedControllers:" merger:"mergeCopilotFusedControllers:" type:v9];

  v10 = (objc_class *)objc_opt_class();
  v11 = NSStringFromClass(v10);
  [(GCSettingsMediator *)self registerKey:@"profiles" getter:"profiles" setter:"setProfiles:" merger:"mergeProfiles:" type:v11];
}

- (id)mergedTombstonesForRemoteDictionary:(id)a3 localDictionary:(id)a4
{
  id v5 = a4;
  uint64_t v6 = [a3 objectForKeyedSubscript:@"tombstones"];
  if (v6) {
    v7 = (void *)v6;
  }
  else {
    v7 = &__NSArray0__struct;
  }
  v35 = v5;
  uint64_t v8 = [v5 objectForKeyedSubscript:@"tombstones"];
  if (v8) {
    v9 = (void *)v8;
  }
  else {
    v9 = &__NSArray0__struct;
  }
  v33 = v9;
  v34 = v7;
  v10 = objc_msgSend(v7, "arrayByAddingObjectsFromArray:");
  v11 = &NSStringFromClass_ptr;
  +[GCSTombstone timeToLiveSeconds];
  v13 = +[NSDate dateWithTimeIntervalSinceNow:-v12];
  v14 = objc_opt_new();
  long long v38 = 0u;
  long long v39 = 0u;
  long long v40 = 0u;
  long long v41 = 0u;
  id obj = v10;
  id v15 = [obj countByEnumeratingWithState:&v38 objects:v44 count:16];
  if (v15)
  {
    id v16 = v15;
    uint64_t v17 = *(void *)v39;
    do
    {
      v18 = 0;
      id v36 = v16;
      do
      {
        if (*(void *)v39 != v17) {
          objc_enumerationMutation(obj);
        }
        id v19 = [objc_alloc((Class)v11[35]) initWithJSONObject:*(void *)(*((void *)&v38 + 1) + 8 * (void)v18)];
        v20 = [v19 creationDate];
        id v21 = [v20 compare:v13];

        if (v21 == (id)-1)
        {
          v24 = getGCSLogger();
          if (os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 138412290;
            id v43 = v19;
            _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_INFO, "GCSettingsMediator::mergedTombstonesForRemoteDictionary:localDictionary - deleting tombstone %@", buf, 0xCu);
          }
        }
        else
        {
          v22 = [v19 identifier];
          v23 = [v14 objectForKeyedSubscript:v22];

          v24 = [v19 identifier];
          if (v23)
          {
            uint64_t v25 = v17;
            v26 = v11;
            v27 = [v14 objectForKeyedSubscript:v24];

            v28 = [v27 creationDate];
            v29 = [v19 creationDate];
            id v30 = [v28 compare:v29];

            if (v30 == (id)-1)
            {
              v31 = [v19 identifier];
              [v14 setObject:v19 forKeyedSubscript:v31];
            }
            v24 = v27;
            v11 = v26;
            uint64_t v17 = v25;
            id v16 = v36;
          }
          else
          {
            [v14 setObject:v19 forKeyedSubscript:v24];
          }
        }

        v18 = (char *)v18 + 1;
      }
      while (v16 != v18);
      id v16 = [obj countByEnumeratingWithState:&v38 objects:v44 count:16];
    }
    while (v16);
  }

  return v14;
}

- (id)mergedDictForTombstonesLookup:(id)a3 dataLookup:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  v7 = +[NSMutableArray array];
  long long v27 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  uint64_t v8 = [v5 allValues];
  id v9 = [v8 countByEnumeratingWithState:&v27 objects:v34 count:16];
  if (v9)
  {
    id v10 = v9;
    uint64_t v11 = *(void *)v28;
    do
    {
      for (i = 0; i != v10; i = (char *)i + 1)
      {
        if (*(void *)v28 != v11) {
          objc_enumerationMutation(v8);
        }
        v13 = [*(id *)(*((void *)&v27 + 1) + 8 * i) jsonObject];
        [v7 addObject:v13];
      }
      id v10 = [v8 countByEnumeratingWithState:&v27 objects:v34 count:16];
    }
    while (v10);
  }

  v14 = +[NSMutableArray array];
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  id v15 = objc_msgSend(v6, "allValues", 0);
  id v16 = [v15 countByEnumeratingWithState:&v23 objects:v33 count:16];
  if (v16)
  {
    id v17 = v16;
    uint64_t v18 = *(void *)v24;
    do
    {
      for (j = 0; j != v17; j = (char *)j + 1)
      {
        if (*(void *)v24 != v18) {
          objc_enumerationMutation(v15);
        }
        v20 = [*(id *)(*((void *)&v23 + 1) + 8 * (void)j) jsonObject];
        [v14 addObject:v20];
      }
      id v17 = [v15 countByEnumeratingWithState:&v23 objects:v33 count:16];
    }
    while (v17);
  }

  v31[0] = @"tombstones";
  v31[1] = @"data";
  v32[0] = v7;
  v32[1] = v14;
  id v21 = +[NSDictionary dictionaryWithObjects:v32 forKeys:v31 count:2];

  return v21;
}

- (id)controllers
{
  v2 = getGCSLogger();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    objc_super v3 = sub_100003F94();
    v4 = [v3 objectForKey:@"controllers"];
    int v8 = 138412290;
    id v9 = v4;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_INFO, "GCSettingsMediator::controllers %@", (uint8_t *)&v8, 0xCu);
  }
  id v5 = sub_100003F94();
  id v6 = [v5 objectForKey:@"controllers"];

  return v6;
}

- (void)setControllers:(id)a3
{
  id v3 = a3;
  v4 = getGCSLogger();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    int v6 = 138412290;
    id v7 = v3;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "GCSettingsMediator::setControllers %@", (uint8_t *)&v6, 0xCu);
  }

  id v5 = sub_100003F94();
  [v5 setObject:v3 forKey:@"controllers"];
}

- (id)mergeControllers:(id)a3
{
  v4 = a3;
  id v5 = getGCSLogger();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    v48 = v4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "GCSettingsMediator::mergeControllers %@", buf, 0xCu);
  }

  if (v4) {
    int v6 = v4;
  }
  else {
    int v6 = &__NSDictionary0__struct;
  }
  uint64_t v7 = [v6 objectForKeyedSubscript:@"data"];
  int v8 = &__NSArray0__struct;
  if (v7) {
    id v9 = (void *)v7;
  }
  else {
    id v9 = &__NSArray0__struct;
  }
  id v10 = [(GCSettingsMediator *)self controllers];
  uint64_t v11 = [v10 objectForKeyedSubscript:@"data"];
  if (v11) {
    int v8 = (void *)v11;
  }
  long long v39 = v6;
  long long v40 = self;
  v37 = v10;
  double v12 = [(GCSettingsMediator *)self mergedTombstonesForRemoteDictionary:v6 localDictionary:v10];
  v13 = getGCSLogger();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    v48 = v12;
    _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_INFO, "GCSettingsMediator::mergeControllers tombstoneLookup %@", buf, 0xCu);
  }

  v14 = objc_opt_new();
  id v36 = v8;
  long long v38 = v9;
  [v8 arrayByAddingObjectsFromArray:v9];
  long long v43 = 0u;
  long long v44 = 0u;
  long long v45 = 0u;
  long long v46 = 0u;
  id obj = (id)objc_claimAutoreleasedReturnValue();
  id v15 = [obj countByEnumeratingWithState:&v43 objects:v51 count:16];
  if (v15)
  {
    id v16 = v15;
    uint64_t v42 = *(void *)v44;
    do
    {
      for (i = 0; i != v16; i = (char *)i + 1)
      {
        if (*(void *)v44 != v42) {
          objc_enumerationMutation(obj);
        }
        uint64_t v18 = [objc_alloc((Class)GCSController) initWithJSONObject:*(void *)(*((void *)&v43 + 1) + 8 * i)];
        id v19 = [v18 persistentIdentifier];
        v20 = [v12 objectForKeyedSubscript:v19];

        if (v20)
        {
          id v21 = [v12 objectForKeyedSubscript:v19];
          v22 = [v21 creationDate];
          long long v23 = [v18 modifiedDate];
          id v24 = [v22 compare:v23];

          if (v24 != (id)-1)
          {
            long long v25 = getGCSLogger();
            if (!os_log_type_enabled(v25, OS_LOG_TYPE_INFO)) {
              goto LABEL_30;
            }
            *(_DWORD *)buf = 138412290;
            v48 = v18;
            long long v26 = v25;
            long long v27 = "GCSettingsMediator::mergeControllers valid tombstone for dataObj %@";
LABEL_29:
            _os_log_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_INFO, v27, buf, 0xCu);
            goto LABEL_30;
          }
        }
        long long v28 = [v14 objectForKeyedSubscript:v19];

        if (!v28)
        {
          [v14 setObject:v18 forKeyedSubscript:v19];
          long long v25 = getGCSLogger();
          if (!os_log_type_enabled(v25, OS_LOG_TYPE_INFO)) {
            goto LABEL_30;
          }
          *(_DWORD *)buf = 138412290;
          v48 = v18;
          long long v26 = v25;
          long long v27 = "GCSettingsMediator::mergeControllers saving dataObj %@";
          goto LABEL_29;
        }
        long long v25 = [v14 objectForKeyedSubscript:v19];
        long long v29 = [v25 modifiedDate];
        long long v30 = [v18 modifiedDate];
        id v31 = [v29 compare:v30];

        if (v31 == (id)-1)
        {
          [v14 setObject:v18 forKeyedSubscript:v19];
          v32 = getGCSLogger();
          if (os_log_type_enabled(v32, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 138412546;
            v48 = v25;
            __int16 v49 = 2112;
            v50 = v18;
            _os_log_impl((void *)&_mh_execute_header, v32, OS_LOG_TYPE_INFO, "GCSettingsMediator::mergeControllers overwriting dataObj %@ with dataObj %@", buf, 0x16u);
          }
        }
LABEL_30:
      }
      id v16 = [obj countByEnumeratingWithState:&v43 objects:v51 count:16];
    }
    while (v16);
  }
  v33 = getGCSLogger();
  if (os_log_type_enabled(v33, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    v48 = v14;
    _os_log_impl((void *)&_mh_execute_header, v33, OS_LOG_TYPE_INFO, "GCSettingsMediator::mergeControllers dataLookup %@", buf, 0xCu);
  }

  v34 = [(GCSettingsMediator *)v40 mergedDictForTombstonesLookup:v12 dataLookup:v14];
  [(GCSettingsMediator *)v40 setControllers:v34];

  return v34;
}

- (id)games
{
  v2 = getGCSLogger();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    id v3 = sub_100003F94();
    v4 = [v3 objectForKey:@"games"];
    int v8 = 138412290;
    id v9 = v4;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_INFO, "GCSettingsMediator::games %@", (uint8_t *)&v8, 0xCu);
  }
  id v5 = sub_100003F94();
  int v6 = [v5 objectForKey:@"games"];

  return v6;
}

- (void)setGames:(id)a3
{
  id v3 = a3;
  v4 = getGCSLogger();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    int v6 = 138412290;
    id v7 = v3;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "GCSettingsMediator::setGames %@", (uint8_t *)&v6, 0xCu);
  }

  id v5 = sub_100003F94();
  [v5 setObject:v3 forKey:@"games"];
}

- (id)mergeGames:(id)a3
{
  v4 = a3;
  id v5 = getGCSLogger();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    v48 = v4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "GCSettingsMediator::mergeGames %@", buf, 0xCu);
  }

  if (v4) {
    int v6 = v4;
  }
  else {
    int v6 = &__NSDictionary0__struct;
  }
  uint64_t v7 = [v6 objectForKeyedSubscript:@"data"];
  int v8 = &__NSArray0__struct;
  if (v7) {
    id v9 = (void *)v7;
  }
  else {
    id v9 = &__NSArray0__struct;
  }
  id v10 = [(GCSettingsMediator *)self games];
  uint64_t v11 = [v10 objectForKeyedSubscript:@"data"];
  if (v11) {
    int v8 = (void *)v11;
  }
  long long v39 = v6;
  long long v40 = self;
  v37 = v10;
  double v12 = [(GCSettingsMediator *)self mergedTombstonesForRemoteDictionary:v6 localDictionary:v10];
  v13 = getGCSLogger();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    v48 = v12;
    _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_INFO, "GCSettingsMediator::mergeGames tombstoneLookup %@", buf, 0xCu);
  }

  v14 = objc_opt_new();
  id v36 = v8;
  long long v38 = v9;
  [v8 arrayByAddingObjectsFromArray:v9];
  long long v43 = 0u;
  long long v44 = 0u;
  long long v45 = 0u;
  long long v46 = 0u;
  id obj = (id)objc_claimAutoreleasedReturnValue();
  id v15 = [obj countByEnumeratingWithState:&v43 objects:v51 count:16];
  if (v15)
  {
    id v16 = v15;
    uint64_t v42 = *(void *)v44;
    do
    {
      for (i = 0; i != v16; i = (char *)i + 1)
      {
        if (*(void *)v44 != v42) {
          objc_enumerationMutation(obj);
        }
        uint64_t v18 = [objc_alloc((Class)GCSGame) initWithJSONObject:*(void *)(*((void *)&v43 + 1) + 8 * i)];
        id v19 = [v18 bundleIdentifier];
        v20 = [v12 objectForKeyedSubscript:v19];

        if (v20)
        {
          id v21 = [v12 objectForKeyedSubscript:v19];
          v22 = [v21 creationDate];
          long long v23 = [v18 modifiedDate];
          id v24 = [v22 compare:v23];

          if (v24 != (id)-1)
          {
            long long v25 = getGCSLogger();
            if (!os_log_type_enabled(v25, OS_LOG_TYPE_INFO)) {
              goto LABEL_30;
            }
            *(_DWORD *)buf = 138412290;
            v48 = v18;
            long long v26 = v25;
            long long v27 = "GCSettingsMediator::mergeGames valid tombstone for dataObj %@";
LABEL_29:
            _os_log_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_INFO, v27, buf, 0xCu);
            goto LABEL_30;
          }
        }
        long long v28 = [v14 objectForKeyedSubscript:v19];

        if (!v28)
        {
          [v14 setObject:v18 forKeyedSubscript:v19];
          long long v25 = getGCSLogger();
          if (!os_log_type_enabled(v25, OS_LOG_TYPE_INFO)) {
            goto LABEL_30;
          }
          *(_DWORD *)buf = 138412290;
          v48 = v18;
          long long v26 = v25;
          long long v27 = "GCSettingsMediator::mergeGames saving dataObj %@";
          goto LABEL_29;
        }
        long long v25 = [v14 objectForKeyedSubscript:v19];
        long long v29 = [v25 modifiedDate];
        long long v30 = [v18 modifiedDate];
        id v31 = [v29 compare:v30];

        if (v31 == (id)-1)
        {
          [v14 setObject:v18 forKeyedSubscript:v19];
          v32 = getGCSLogger();
          if (os_log_type_enabled(v32, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 138412546;
            v48 = v25;
            __int16 v49 = 2112;
            v50 = v18;
            _os_log_impl((void *)&_mh_execute_header, v32, OS_LOG_TYPE_INFO, "GCSettingsMediator::mergeGames overwriting dataObj %@ with dataObj %@", buf, 0x16u);
          }
        }
LABEL_30:
      }
      id v16 = [obj countByEnumeratingWithState:&v43 objects:v51 count:16];
    }
    while (v16);
  }
  v33 = getGCSLogger();
  if (os_log_type_enabled(v33, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    v48 = v14;
    _os_log_impl((void *)&_mh_execute_header, v33, OS_LOG_TYPE_INFO, "GCSettingsMediator::mergeGames dataLookup %@", buf, 0xCu);
  }

  v34 = [(GCSettingsMediator *)v40 mergedDictForTombstonesLookup:v12 dataLookup:v14];
  [(GCSettingsMediator *)v40 setGames:v34];

  return v34;
}

- (id)profiles
{
  v2 = getGCSLogger();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    id v3 = sub_100003F94();
    v4 = [v3 objectForKey:@"profiles"];
    int v8 = 138412290;
    id v9 = v4;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_INFO, "GCSettingsMediator::profiles %@", (uint8_t *)&v8, 0xCu);
  }
  id v5 = sub_100003F94();
  int v6 = [v5 objectForKey:@"profiles"];

  return v6;
}

- (void)setProfiles:(id)a3
{
  id v3 = a3;
  v4 = getGCSLogger();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    id v19 = v3;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "GCSettingsMediator::setProfiles %@", buf, 0xCu);
  }

  long long v15 = 0u;
  long long v16 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v5 = v3;
  id v6 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v14;
    do
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(void *)v14 != v8) {
          objc_enumerationMutation(v5);
        }
        id v10 = *(void **)(*((void *)&v13 + 1) + 8 * i);
        uint64_t v11 = getGCSLogger();
        if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138412290;
          id v19 = v10;
          _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_INFO, "GCSettingsMediator::setProfiles - element %@", buf, 0xCu);
        }
      }
      id v7 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v7);
  }

  double v12 = sub_100003F94();
  [v12 setObject:v5 forKey:@"profiles"];
}

- (id)mergeProfiles:(id)a3
{
  v4 = a3;
  id v5 = getGCSLogger();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    __int16 v49 = v4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "GCSettingsMediator::mergeProfiles %@", buf, 0xCu);
  }

  if (v4) {
    id v6 = v4;
  }
  else {
    id v6 = &__NSDictionary0__struct;
  }
  uint64_t v7 = [v6 objectForKeyedSubscript:@"data"];
  uint64_t v8 = &__NSArray0__struct;
  if (v7) {
    id v9 = (void *)v7;
  }
  else {
    id v9 = &__NSArray0__struct;
  }
  id v10 = [(GCSettingsMediator *)self profiles];
  uint64_t v11 = [v10 objectForKeyedSubscript:@"data"];
  if (v11) {
    uint64_t v8 = (void *)v11;
  }
  long long v40 = v6;
  long long v41 = self;
  long long v38 = v10;
  double v12 = [(GCSettingsMediator *)self mergedTombstonesForRemoteDictionary:v6 localDictionary:v10];
  long long v13 = getGCSLogger();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    __int16 v49 = v12;
    _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_INFO, "GCSettingsMediator::mergeProfiles tombstoneLookup %@", buf, 0xCu);
  }

  long long v14 = objc_opt_new();
  v37 = v8;
  long long v39 = v9;
  [v8 arrayByAddingObjectsFromArray:v9];
  long long v44 = 0u;
  long long v45 = 0u;
  long long v46 = 0u;
  long long v47 = 0u;
  id obj = (id)objc_claimAutoreleasedReturnValue();
  id v15 = [obj countByEnumeratingWithState:&v44 objects:v52 count:16];
  if (v15)
  {
    id v16 = v15;
    uint64_t v43 = *(void *)v45;
    do
    {
      for (i = 0; i != v16; i = (char *)i + 1)
      {
        if (*(void *)v45 != v43) {
          objc_enumerationMutation(obj);
        }
        uint64_t v18 = [objc_alloc((Class)GCSProfile) initWithJSONObject:*(void *)(*((void *)&v44 + 1) + 8 * i)];
        id v19 = [v18 uuid];
        v20 = [v19 UUIDString];

        id v21 = [v12 objectForKeyedSubscript:v20];

        if (v21)
        {
          v22 = [v12 objectForKeyedSubscript:v20];
          long long v23 = [v22 creationDate];
          id v24 = [v18 modifiedDate];
          id v25 = [v23 compare:v24];

          if (v25 != (id)-1)
          {
            long long v26 = getGCSLogger();
            if (!os_log_type_enabled(v26, OS_LOG_TYPE_INFO)) {
              goto LABEL_30;
            }
            *(_DWORD *)buf = 138412290;
            __int16 v49 = v18;
            long long v27 = v26;
            long long v28 = "GCSettingsMediator::mergeProfiles valid tombstone for dataObj %@";
LABEL_29:
            _os_log_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_INFO, v28, buf, 0xCu);
            goto LABEL_30;
          }
        }
        long long v29 = [v14 objectForKeyedSubscript:v20];

        if (!v29)
        {
          [v14 setObject:v18 forKeyedSubscript:v20];
          long long v26 = getGCSLogger();
          if (!os_log_type_enabled(v26, OS_LOG_TYPE_INFO)) {
            goto LABEL_30;
          }
          *(_DWORD *)buf = 138412290;
          __int16 v49 = v18;
          long long v27 = v26;
          long long v28 = "GCSettingsMediator::mergeProfiles saving dataObj %@";
          goto LABEL_29;
        }
        long long v26 = [v14 objectForKeyedSubscript:v20];
        long long v30 = [v26 modifiedDate];
        id v31 = [v18 modifiedDate];
        id v32 = [v30 compare:v31];

        if (v32 == (id)-1)
        {
          [v14 setObject:v18 forKeyedSubscript:v20];
          v33 = getGCSLogger();
          if (os_log_type_enabled(v33, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 138412546;
            __int16 v49 = v26;
            __int16 v50 = 2112;
            v51 = v18;
            _os_log_impl((void *)&_mh_execute_header, v33, OS_LOG_TYPE_INFO, "GCSettingsMediator::mergeProfiles overwriting dataObj %@ with dataObj %@", buf, 0x16u);
          }
        }
LABEL_30:
      }
      id v16 = [obj countByEnumeratingWithState:&v44 objects:v52 count:16];
    }
    while (v16);
  }
  v34 = getGCSLogger();
  if (os_log_type_enabled(v34, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    __int16 v49 = v14;
    _os_log_impl((void *)&_mh_execute_header, v34, OS_LOG_TYPE_INFO, "GCSettingsMediator::mergeProfiles dataLookup %@", buf, 0xCu);
  }

  v35 = [(GCSettingsMediator *)v41 mergedDictForTombstonesLookup:v12 dataLookup:v14];
  [(GCSettingsMediator *)v41 setProfiles:v35];

  return v35;
}

- (id)copilotFusedControllers
{
  v2 = getGCSLogger();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    id v3 = sub_100003F94();
    v4 = [v3 objectForKey:@"copilotFusedControllers"];
    int v8 = 138412290;
    id v9 = v4;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_INFO, "GCSettingsMediator::copilotFusedControllers %@", (uint8_t *)&v8, 0xCu);
  }
  id v5 = sub_100003F94();
  id v6 = [v5 objectForKey:@"copilotFusedControllers"];

  return v6;
}

- (void)setCopilotFusedControllers:(id)a3
{
  id v3 = a3;
  v4 = getGCSLogger();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    int v6 = 138412290;
    id v7 = v3;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "GCSettingsMediator::setCopilotFusedControllers %@", (uint8_t *)&v6, 0xCu);
  }

  id v5 = sub_100003F94();
  [v5 setObject:v3 forKey:@"copilotFusedControllers"];
}

- (id)mergeCopilotFusedControllers:(id)a3
{
  v4 = a3;
  id v5 = getGCSLogger();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    v48 = v4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "GCSettingsMediator::mergeCopilotFusedControllers %@", buf, 0xCu);
  }

  if (v4) {
    int v6 = v4;
  }
  else {
    int v6 = &__NSDictionary0__struct;
  }
  uint64_t v7 = [v6 objectForKeyedSubscript:@"data"];
  int v8 = &__NSArray0__struct;
  if (v7) {
    id v9 = (void *)v7;
  }
  else {
    id v9 = &__NSArray0__struct;
  }
  id v10 = [(GCSettingsMediator *)self copilotFusedControllers];
  uint64_t v11 = [v10 objectForKeyedSubscript:@"data"];
  if (v11) {
    int v8 = (void *)v11;
  }
  long long v39 = v6;
  long long v40 = self;
  v37 = v10;
  double v12 = [(GCSettingsMediator *)self mergedTombstonesForRemoteDictionary:v6 localDictionary:v10];
  long long v13 = getGCSLogger();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    v48 = v12;
    _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_INFO, "GCSettingsMediator::mergeCopilotFusedControllers tombstoneLookup %@", buf, 0xCu);
  }

  long long v14 = objc_opt_new();
  id v36 = v8;
  long long v38 = v9;
  [v8 arrayByAddingObjectsFromArray:v9];
  long long v43 = 0u;
  long long v44 = 0u;
  long long v45 = 0u;
  long long v46 = 0u;
  id obj = (id)objc_claimAutoreleasedReturnValue();
  id v15 = [obj countByEnumeratingWithState:&v43 objects:v51 count:16];
  if (v15)
  {
    id v16 = v15;
    uint64_t v42 = *(void *)v44;
    do
    {
      for (i = 0; i != v16; i = (char *)i + 1)
      {
        if (*(void *)v44 != v42) {
          objc_enumerationMutation(obj);
        }
        uint64_t v18 = [objc_alloc((Class)GCSCopilotFusedController) initWithJSONObject:*(void *)(*((void *)&v43 + 1) + 8 * i)];
        id v19 = [v18 fusedControllerIdentifier];
        v20 = [v12 objectForKeyedSubscript:v19];

        if (v20)
        {
          id v21 = [v12 objectForKeyedSubscript:v19];
          v22 = [v21 creationDate];
          long long v23 = [v18 modifiedDate];
          id v24 = [v22 compare:v23];

          if (v24 != (id)-1)
          {
            id v25 = getGCSLogger();
            if (!os_log_type_enabled(v25, OS_LOG_TYPE_INFO)) {
              goto LABEL_30;
            }
            *(_DWORD *)buf = 138412290;
            v48 = v18;
            long long v26 = v25;
            long long v27 = "GCSettingsMediator::mergeCopilotFusedControllers valid tombstone for dataObj %@";
LABEL_29:
            _os_log_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_INFO, v27, buf, 0xCu);
            goto LABEL_30;
          }
        }
        long long v28 = [v14 objectForKeyedSubscript:v19];

        if (!v28)
        {
          [v14 setObject:v18 forKeyedSubscript:v19];
          id v25 = getGCSLogger();
          if (!os_log_type_enabled(v25, OS_LOG_TYPE_INFO)) {
            goto LABEL_30;
          }
          *(_DWORD *)buf = 138412290;
          v48 = v18;
          long long v26 = v25;
          long long v27 = "GCSettingsMediator::mergeCopilotFusedControllers saving dataObj %@";
          goto LABEL_29;
        }
        id v25 = [v14 objectForKeyedSubscript:v19];
        long long v29 = [v25 modifiedDate];
        long long v30 = [v18 modifiedDate];
        id v31 = [v29 compare:v30];

        if (v31 == (id)-1)
        {
          [v14 setObject:v18 forKeyedSubscript:v19];
          id v32 = getGCSLogger();
          if (os_log_type_enabled(v32, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 138412546;
            v48 = v25;
            __int16 v49 = 2112;
            __int16 v50 = v18;
            _os_log_impl((void *)&_mh_execute_header, v32, OS_LOG_TYPE_INFO, "GCSettingsMediator::mergeCopilotFusedControllers overwriting dataObj %@ with dataObj %@", buf, 0x16u);
          }
        }
LABEL_30:
      }
      id v16 = [obj countByEnumeratingWithState:&v43 objects:v51 count:16];
    }
    while (v16);
  }
  v33 = getGCSLogger();
  if (os_log_type_enabled(v33, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    v48 = v14;
    _os_log_impl((void *)&_mh_execute_header, v33, OS_LOG_TYPE_INFO, "GCSettingsMediator::mergeCopilotFusedControllers dataLookup %@", buf, 0xCu);
  }

  v34 = [(GCSettingsMediator *)v40 mergedDictForTombstonesLookup:v12 dataLookup:v14];
  [(GCSettingsMediator *)v40 setCopilotFusedControllers:v34];

  return v34;
}

- (id)storeVersion
{
  v2 = getGCSLogger();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    id v3 = sub_100003F94();
    v4 = [v3 objectForKey:@"settingsVersion"];
    int v8 = 138412290;
    id v9 = v4;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_INFO, "GCSettingsMediator::storeVersion %@", (uint8_t *)&v8, 0xCu);
  }
  id v5 = sub_100003F94();
  int v6 = [v5 objectForKey:@"settingsVersion"];

  return v6;
}

- (void)setStoreVersion:(id)a3
{
  id v3 = a3;
  v4 = getGCSLogger();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    int v6 = 138412290;
    id v7 = v3;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "GCSettingsMediator::setStoreVersion %@", (uint8_t *)&v6, 0xCu);
  }

  id v5 = sub_100003F94();
  [v5 setObject:v3 forKey:@"settingsVersion"];
}

@end