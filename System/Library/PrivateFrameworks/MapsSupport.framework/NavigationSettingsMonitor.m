@interface NavigationSettingsMonitor
- (BOOL)isCarPlay;
- (MNUserOptions)userOptions;
- (NSUserDefaults)userDefaults;
- (NavigationSettingsMonitor)initWithUserDefaults:(id)a3;
- (int64_t)transportType;
- (void)_localeMetricDidChange:(id)a3;
- (void)_startObserving;
- (void)_stopObserving;
- (void)_updateUserOptionsAndNotifyObservers:(BOOL)a3;
- (void)dealloc;
- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6;
- (void)setIsCarPlay:(BOOL)a3;
- (void)setTransportType:(int64_t)a3;
@end

@implementation NavigationSettingsMonitor

- (NavigationSettingsMonitor)initWithUserDefaults:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)NavigationSettingsMonitor;
  v6 = [(NavigationSettingsMonitor *)&v9 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_userDefaults, a3);
    [(NavigationSettingsMonitor *)v7 _startObserving];
    [(NavigationSettingsMonitor *)v7 _updateUserOptionsAndNotifyObservers:1];
  }

  return v7;
}

- (void)dealloc
{
  [(NavigationSettingsMonitor *)self _stopObserving];
  v3.receiver = self;
  v3.super_class = (Class)NavigationSettingsMonitor;
  [(NavigationSettingsMonitor *)&v3 dealloc];
}

- (BOOL)isCarPlay
{
  v2 = self;
  objc_sync_enter(v2);
  BOOL isCarPlay = v2->_isCarPlay;
  objc_sync_exit(v2);

  return isCarPlay;
}

- (void)setIsCarPlay:(BOOL)a3
{
  BOOL v3 = a3;
  obj = self;
  objc_sync_enter(obj);
  if (obj->_isCarPlay != v3)
  {
    obj->_BOOL isCarPlay = v3;
    [(NavigationSettingsMonitor *)obj _updateUserOptionsAndNotifyObservers:1];
  }
  objc_sync_exit(obj);
}

- (int64_t)transportType
{
  v2 = self;
  objc_sync_enter(v2);
  int64_t transportType = v2->_transportType;
  objc_sync_exit(v2);

  return transportType;
}

- (void)setTransportType:(int64_t)a3
{
  obj = self;
  objc_sync_enter(obj);
  if (obj->_transportType != a3)
  {
    obj->_int64_t transportType = a3;
    [(NavigationSettingsMonitor *)obj _updateUserOptionsAndNotifyObservers:1];
  }
  objc_sync_exit(obj);
}

- (MNUserOptions)userOptions
{
  v2 = self;
  objc_sync_enter(v2);
  [(NavigationSettingsMonitor *)v2 _updateUserOptionsAndNotifyObservers:0];
  BOOL v3 = v2->_userOptions;
  objc_sync_exit(v2);

  return v3;
}

- (void)_startObserving
{
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  if (qword_10009B7D0 != -1) {
    dispatch_once(&qword_10009B7D0, &stru_1000821C0);
  }
  id v3 = (id)qword_10009B7D8;
  id v4 = [v3 countByEnumeratingWithState:&v22 objects:v27 count:16];
  if (v4)
  {
    id v5 = v4;
    uint64_t v6 = *(void *)v23;
    do
    {
      for (i = 0; i != v5; i = (char *)i + 1)
      {
        if (*(void *)v23 != v6) {
          objc_enumerationMutation(v3);
        }
        uint64_t v8 = *(void *)(*((void *)&v22 + 1) + 8 * i);
        objc_super v9 = [(NavigationSettingsMonitor *)self userDefaults];
        [v9 addObserver:self forKeyPath:v8 options:0 context:&off_1000821B8];
      }
      id v5 = [v3 countByEnumeratingWithState:&v22 objects:v27 count:16];
    }
    while (v5);
  }

  long long v20 = 0u;
  long long v21 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id v10 = [&off_1000885C0 countByEnumeratingWithState:&v18 objects:v26 count:16];
  if (v10)
  {
    id v11 = v10;
    uint64_t v12 = *(void *)v19;
    do
    {
      for (j = 0; j != v11; j = (char *)j + 1)
      {
        if (*(void *)v19 != v12) {
          objc_enumerationMutation(&off_1000885C0);
        }
        uint64_t v14 = *(void *)(*((void *)&v18 + 1) + 8 * (void)j);
        v15 = [(NavigationSettingsMonitor *)self userDefaults];
        [v15 addObserver:self forKeyPath:v14 options:0 context:&off_1000821B8];
      }
      id v11 = [&off_1000885C0 countByEnumeratingWithState:&v18 objects:v26 count:16];
    }
    while (v11);
  }
  v16 = +[NSNotificationCenter defaultCenter];
  v17 = MNLocaleDidChangeNotification();
  [v16 addObserver:self selector:"_localeMetricDidChange:" name:v17 object:0];
}

- (void)_stopObserving
{
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  if (qword_10009B7D0 != -1) {
    dispatch_once(&qword_10009B7D0, &stru_1000821C0);
  }
  id v3 = (id)qword_10009B7D8;
  id v4 = [v3 countByEnumeratingWithState:&v20 objects:v25 count:16];
  if (v4)
  {
    id v5 = v4;
    uint64_t v6 = *(void *)v21;
    do
    {
      for (i = 0; i != v5; i = (char *)i + 1)
      {
        if (*(void *)v21 != v6) {
          objc_enumerationMutation(v3);
        }
        uint64_t v8 = *(void *)(*((void *)&v20 + 1) + 8 * i);
        objc_super v9 = [(NavigationSettingsMonitor *)self userDefaults];
        [v9 removeObserver:self forKeyPath:v8];
      }
      id v5 = [v3 countByEnumeratingWithState:&v20 objects:v25 count:16];
    }
    while (v5);
  }

  long long v18 = 0u;
  long long v19 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v10 = [&off_1000885C0 countByEnumeratingWithState:&v16 objects:v24 count:16];
  if (v10)
  {
    id v11 = v10;
    uint64_t v12 = *(void *)v17;
    do
    {
      for (j = 0; j != v11; j = (char *)j + 1)
      {
        if (*(void *)v17 != v12) {
          objc_enumerationMutation(&off_1000885C0);
        }
        uint64_t v14 = *(void *)(*((void *)&v16 + 1) + 8 * (void)j);
        v15 = [(NavigationSettingsMonitor *)self userDefaults];
        [v15 removeObserver:self forKeyPath:v14];
      }
      id v11 = [&off_1000885C0 countByEnumeratingWithState:&v16 objects:v24 count:16];
    }
    while (v11);
  }
}

- (void)_updateUserOptionsAndNotifyObservers:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = self;
  objc_sync_enter(v4);
  id v5 = +[MNNavigationService sharedService];
  uint64_t v6 = [v5 userOptions];
  v7 = (MNUserOptions *)[v6 copy];

  userOptions = v4->_userOptions;
  v4->_userOptions = v7;

  objc_sync_exit(v4);
  if (v3)
  {
    id v9 = +[NSNotificationCenter defaultCenter];
    [v9 postNotificationName:@"NavigationSettingsMonitorDidUpdateSettings" object:v4];
  }
}

- (void)_localeMetricDidChange:(id)a3
{
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  if (!v10 || a6 != &off_1000821B8) {
    goto LABEL_8;
  }
  if (qword_10009B7D0 != -1) {
    dispatch_once(&qword_10009B7D0, &stru_1000821C0);
  }
  if (([(id)qword_10009B7D8 containsObject:v10] & 1) != 0
    || [&off_1000885C0 containsObject:v10])
  {
    [(NavigationSettingsMonitor *)self _updateUserOptionsAndNotifyObservers:1];
  }
  else
  {
LABEL_8:
    v13.receiver = self;
    v13.super_class = (Class)NavigationSettingsMonitor;
    [(NavigationSettingsMonitor *)&v13 observeValueForKeyPath:v10 ofObject:v11 change:v12 context:a6];
  }
}

- (NSUserDefaults)userDefaults
{
  return self->_userDefaults;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_userDefaults, 0);

  objc_storeStrong((id *)&self->_userOptions, 0);
}

@end