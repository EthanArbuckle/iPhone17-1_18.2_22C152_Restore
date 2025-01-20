@interface CBSensorActivityDataProvider
- (CBSensorActivityAttribution)mostRecentCameraAndMicrophoneSensorActivityAttribution;
- (CBSensorActivityDataProvider)init;
- (CBSensorActivityDataProvider)initWithSystemStatusServer:(id)a3;
- (NSHashTable)observers;
- (NSSet)activeAndRecentSensorActivityAttributions;
- (NSSet)activeCameraAndMicrophoneActivityAttributions;
- (NSSet)activeSensorActivityAttributions;
- (NSSet)recentSensorActivityAttributions;
- (STUIDataAccessStatusDomain)dataAccessDomain;
- (id)_recentCameraAndMicrophoneActivityAttributions;
- (void)_handleNewDomainData:(id)a3;
- (void)_notifyObserversOfActivityChange;
- (void)addObserver:(id)a3;
- (void)dealloc;
- (void)removeObserver:(id)a3;
- (void)setActiveSensorActivityAttributions:(id)a3;
- (void)setRecentSensorActivityAttributions:(id)a3;
@end

@implementation CBSensorActivityDataProvider

- (CBSensorActivityDataProvider)init
{
  v3 = +[NSNull null];
  v4 = [(CBSensorActivityDataProvider *)self initWithSystemStatusServer:v3];

  return v4;
}

- (CBSensorActivityDataProvider)initWithSystemStatusServer:(id)a3
{
  id v4 = a3;
  v17.receiver = self;
  v17.super_class = (Class)CBSensorActivityDataProvider;
  v5 = [(CBSensorActivityDataProvider *)&v17 init];
  if (v5)
  {
    v6 = (STUIDataAccessStatusDomain *)[objc_alloc((Class)STUIDataAccessStatusDomain) initWithServerHandle:v4];
    dataAccessDomain = v5->_dataAccessDomain;
    v5->_dataAccessDomain = v6;

    v8 = CheckerBoardLogHandleForCategory();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      v9 = v5->_dataAccessDomain;
      *(_DWORD *)buf = 138412290;
      v19 = v9;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Initializing CBSensorActivityDataProvider with dataAccessDomain %@", buf, 0xCu);
    }

    objc_initWeak((id *)buf, v5);
    v10 = v5->_dataAccessDomain;
    v15[0] = _NSConcreteStackBlock;
    v15[1] = 3221225472;
    v15[2] = sub_10001831C;
    v15[3] = &unk_100079A68;
    objc_copyWeak(&v16, (id *)buf);
    [(STUIDataAccessStatusDomain *)v10 observeDataWithBlock:v15];
    uint64_t v11 = +[NSHashTable weakObjectsHashTable];
    observers = v5->_observers;
    v5->_observers = (NSHashTable *)v11;

    v13 = [(STUIDataAccessStatusDomain *)v5->_dataAccessDomain data];
    [(CBSensorActivityDataProvider *)v5 _handleNewDomainData:v13];

    objc_destroyWeak(&v16);
    objc_destroyWeak((id *)buf);
  }

  return v5;
}

- (void)dealloc
{
  [(STUIDataAccessStatusDomain *)self->_dataAccessDomain invalidate];
  v3.receiver = self;
  v3.super_class = (Class)CBSensorActivityDataProvider;
  [(CBSensorActivityDataProvider *)&v3 dealloc];
}

- (void)addObserver:(id)a3
{
  id v4 = a3;
  v5 = CheckerBoardLogHandleForCategory();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v7 = 138412290;
    id v8 = v4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Adding sensor activity data provider observer %@", (uint8_t *)&v7, 0xCu);
  }

  v6 = [(CBSensorActivityDataProvider *)self observers];
  [v6 addObject:v4];
}

- (void)removeObserver:(id)a3
{
  id v4 = a3;
  v5 = CheckerBoardLogHandleForCategory();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v7 = 138412290;
    id v8 = v4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Removing sensor activity data provider observer %@", (uint8_t *)&v7, 0xCu);
  }

  v6 = [(CBSensorActivityDataProvider *)self observers];
  [v6 removeObject:v4];
}

- (NSSet)activeAndRecentSensorActivityAttributions
{
  objc_super v3 = [(CBSensorActivityDataProvider *)self activeSensorActivityAttributions];
  id v4 = [v3 mutableCopy];
  v5 = v4;
  if (v4)
  {
    id v6 = v4;
  }
  else
  {
    id v6 = +[NSMutableSet set];
  }
  int v7 = v6;

  id v8 = [(CBSensorActivityDataProvider *)self recentSensorActivityAttributions];
  [v7 unionSet:v8];

  id v9 = [v7 copy];

  return (NSSet *)v9;
}

- (NSSet)activeCameraAndMicrophoneActivityAttributions
{
  v2 = [(CBSensorActivityDataProvider *)self activeSensorActivityAttributions];
  objc_super v3 = [v2 objectsPassingTest:&stru_100079AA8];

  return (NSSet *)v3;
}

- (CBSensorActivityAttribution)mostRecentCameraAndMicrophoneSensorActivityAttribution
{
  v2 = [(CBSensorActivityDataProvider *)self _recentCameraAndMicrophoneActivityAttributions];
  id v3 = [v2 lastObject];
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v4 = v2;
  id v5 = [v4 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v15;
    do
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v15 != v7) {
          objc_enumerationMutation(v4);
        }
        id v9 = *(id *)(*((void *)&v14 + 1) + 8 * i);
        if (v9 != v3)
        {
          v10 = [*(id *)(*((void *)&v14 + 1) + 8 * i) bundleIdentifier:v14];
          uint64_t v11 = [v3 bundleIdentifier];
          if ([v10 isEqualToString:v11])
          {
            id v12 = [v9 sensor];

            if (v12) {
              continue;
            }
            v10 = v3;
            id v3 = v9;
          }
          else
          {
          }
        }
      }
      id v6 = [v4 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v6);
  }

  return (CBSensorActivityAttribution *)v3;
}

- (id)_recentCameraAndMicrophoneActivityAttributions
{
  v2 = [(CBSensorActivityDataProvider *)self recentSensorActivityAttributions];
  id v3 = +[NSMutableArray array];
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v4 = v2;
  id v5 = [v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v13;
    do
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v13 != v7) {
          objc_enumerationMutation(v4);
        }
        id v9 = *(void **)(*((void *)&v12 + 1) + 8 * i);
        if (!objc_msgSend(v9, "sensor", (void)v12) || objc_msgSend(v9, "sensor") == (id)1) {
          [v3 addObject:v9];
        }
      }
      id v6 = [v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v6);
  }

  id v10 = [v3 copy];

  return v10;
}

- (void)_handleNewDomainData:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (v4)
  {
    id v6 = [v4 activeAttributionData];
    uint64_t v7 = [v6 dataAccessAttributions];

    id v8 = [v7 bs_map:&stru_100079AE8];
    id v9 = +[NSSet setWithArray:v8];

    [(CBSensorActivityDataProvider *)self setActiveSensorActivityAttributions:v9];
    id v10 = [v5 recentAttributionData];
    uint64_t v11 = [v10 dataAccessAttributions];

    long long v12 = [v11 bs_map:&stru_100079B08];
    long long v13 = +[NSSet setWithArray:v12];

    [(CBSensorActivityDataProvider *)self setRecentSensorActivityAttributions:v13];
  }
  else
  {
    long long v14 = +[NSSet set];
    [(CBSensorActivityDataProvider *)self setActiveSensorActivityAttributions:v14];

    uint64_t v7 = +[NSSet set];
    [(CBSensorActivityDataProvider *)self setRecentSensorActivityAttributions:v7];
  }

  long long v15 = CheckerBoardLogHandleForCategory();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)long long v16 = 0;
    _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "Notifying sensor activity data provider observers of activity change", v16, 2u);
  }

  [(CBSensorActivityDataProvider *)self _notifyObserversOfActivityChange];
}

- (void)_notifyObserversOfActivityChange
{
  id v3 = [(CBSensorActivityDataProvider *)self observers];
  id v4 = [v3 copy];

  long long v12 = 0u;
  long long v13 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  id v5 = v4;
  id v6 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v11;
    do
    {
      id v9 = 0;
      do
      {
        if (*(void *)v11 != v8) {
          objc_enumerationMutation(v5);
        }
        [*(id *)(*((void *)&v10 + 1) + 8 * (void)v9) activityDidChangeForSensorActivityDataProvider:self v10];
        id v9 = (char *)v9 + 1;
      }
      while (v7 != v9);
      id v7 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v7);
  }
}

- (NSSet)activeSensorActivityAttributions
{
  return self->_activeSensorActivityAttributions;
}

- (void)setActiveSensorActivityAttributions:(id)a3
{
}

- (NSSet)recentSensorActivityAttributions
{
  return self->_recentSensorActivityAttributions;
}

- (void)setRecentSensorActivityAttributions:(id)a3
{
}

- (STUIDataAccessStatusDomain)dataAccessDomain
{
  return self->_dataAccessDomain;
}

- (NSHashTable)observers
{
  return self->_observers;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_observers, 0);
  objc_storeStrong((id *)&self->_dataAccessDomain, 0);
  objc_storeStrong((id *)&self->_recentSensorActivityAttributions, 0);

  objc_storeStrong((id *)&self->_activeSensorActivityAttributions, 0);
}

@end