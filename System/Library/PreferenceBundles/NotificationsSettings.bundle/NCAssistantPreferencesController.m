@interface NCAssistantPreferencesController
+ (id)sharedInstance;
- (BOOL)announceNotificationsInCarPlayTemporarilyDisabled;
- (BOOL)cachedAnnounceNotificationsInCarPlayTemporarilyDisabled;
- (NCAssistantPreferencesController)init;
- (NSHashTable)observers;
- (OS_dispatch_queue)queue;
- (int64_t)cachedCarPlayAnnounceEnablementType;
- (int64_t)carPlayAnnounceEnablementType;
- (void)_notifyObserversOfSettingsChangeWithBlock:(id)a3;
- (void)_siriPreferencesDidChange;
- (void)_updateAnnounceNotificationsInCarPlayTemporarilyDisabled:(BOOL)a3;
- (void)_updateCarPlayAnnounceEnablementType:(int64_t)a3;
- (void)addObserver:(id)a3;
- (void)clearAnnounceNotificationsInCarPlayTemporarilyDisabled;
- (void)dealloc;
- (void)removeObserver:(id)a3;
- (void)setAnnounceNotificationsInCarPlayTemporarilyDisabled:(BOOL)a3;
- (void)setCachedAnnounceNotificationsInCarPlayTemporarilyDisabled:(BOOL)a3;
- (void)setCachedCarPlayAnnounceEnablementType:(int64_t)a3;
- (void)setCarPlayAnnounceEnablementType:(int64_t)a3;
@end

@implementation NCAssistantPreferencesController

+ (id)sharedInstance
{
  if (qword_50120 != -1) {
    dispatch_once(&qword_50120, &stru_40EB8);
  }
  v2 = (void *)qword_50128;

  return v2;
}

- (NCAssistantPreferencesController)init
{
  v9.receiver = self;
  v9.super_class = (Class)NCAssistantPreferencesController;
  v2 = [(NCAssistantPreferencesController *)&v9 init];
  if (v2)
  {
    dispatch_queue_t v3 = dispatch_queue_create("NCAssistantPreferencesController", 0);
    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)v3;

    uint64_t v5 = +[NSHashTable weakObjectsHashTable];
    observers = v2->_observers;
    v2->_observers = (NSHashTable *)v5;

    v7 = +[NSNotificationCenter defaultCenter];
    [v7 addObserver:v2 selector:"_siriPreferencesDidChange" name:AFPreferencesDidChangeNotification object:0];

    [(NCAssistantPreferencesController *)v2 _siriPreferencesDidChange];
  }
  return v2;
}

- (void)dealloc
{
  dispatch_queue_t v3 = +[NSNotificationCenter defaultCenter];
  [v3 removeObserver:self];

  [(NSHashTable *)self->_observers removeAllObjects];
  v4.receiver = self;
  v4.super_class = (Class)NCAssistantPreferencesController;
  [(NCAssistantPreferencesController *)&v4 dealloc];
}

- (void)addObserver:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(NCAssistantPreferencesController *)self queue];
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_A6FC;
  v7[3] = &unk_40D08;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, v7);
}

- (void)removeObserver:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(NCAssistantPreferencesController *)self queue];
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_A804;
  v7[3] = &unk_40D08;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, v7);
}

- (int64_t)carPlayAnnounceEnablementType
{
  uint64_t v7 = 0;
  id v8 = &v7;
  uint64_t v9 = 0x2020000000;
  uint64_t v10 = 1;
  dispatch_queue_t v3 = [(NCAssistantPreferencesController *)self queue];
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_A934;
  v6[3] = &unk_40EE0;
  v6[4] = self;
  v6[5] = &v7;
  dispatch_sync(v3, v6);

  int64_t v4 = v8[3];
  _Block_object_dispose(&v7, 8);
  return v4;
}

- (void)setCarPlayAnnounceEnablementType:(int64_t)a3
{
  id v4 = +[AFPreferences sharedPreferences];
  [v4 setAnnounceNotificationsInCarPlayType:a3];
}

- (BOOL)announceNotificationsInCarPlayTemporarilyDisabled
{
  v2 = self;
  uint64_t v6 = 0;
  uint64_t v7 = &v6;
  uint64_t v8 = 0x2020000000;
  char v9 = 0;
  dispatch_queue_t v3 = [(NCAssistantPreferencesController *)self queue];
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_AA98;
  v5[3] = &unk_40EE0;
  v5[4] = v2;
  v5[5] = &v6;
  dispatch_sync(v3, v5);

  LOBYTE(v2) = *((unsigned char *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return (char)v2;
}

- (void)setAnnounceNotificationsInCarPlayTemporarilyDisabled:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = +[AFPreferences sharedPreferences];
  [v4 setAnnounceNotificationsInCarPlayTemporarilyDisabled:v3];
}

- (void)clearAnnounceNotificationsInCarPlayTemporarilyDisabled
{
  id v2 = +[AFPreferences sharedPreferences];
  [v2 clearAnnounceNotificationsInCarPlayTemporarilyDisabled];
}

- (void)_siriPreferencesDidChange
{
  BOOL v3 = [(NCAssistantPreferencesController *)self queue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_ABF4;
  block[3] = &unk_40F58;
  block[4] = self;
  dispatch_async(v3, block);
}

- (void)_updateAnnounceNotificationsInCarPlayTemporarilyDisabled:(BOOL)a3
{
  uint64_t v5 = [(NCAssistantPreferencesController *)self queue];
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_AEA8;
  v6[3] = &unk_40FA8;
  v6[4] = self;
  BOOL v7 = a3;
  dispatch_async(v5, v6);
}

- (void)_updateCarPlayAnnounceEnablementType:(int64_t)a3
{
  uint64_t v5 = [(NCAssistantPreferencesController *)self queue];
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_AFF4;
  v6[3] = &unk_40FF8;
  v6[4] = self;
  void v6[5] = a3;
  dispatch_async(v5, v6);
}

- (void)_notifyObserversOfSettingsChangeWithBlock:(id)a3
{
  id v4 = (void (**)(id, void))a3;
  if (v4)
  {
    long long v12 = 0u;
    long long v13 = 0u;
    long long v10 = 0u;
    long long v11 = 0u;
    uint64_t v5 = self->_observers;
    id v6 = [(NSHashTable *)v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
    if (v6)
    {
      id v7 = v6;
      uint64_t v8 = *(void *)v11;
      do
      {
        char v9 = 0;
        do
        {
          if (*(void *)v11 != v8) {
            objc_enumerationMutation(v5);
          }
          v4[2](v4, *(void *)(*((void *)&v10 + 1) + 8 * (void)v9));
          char v9 = (char *)v9 + 1;
        }
        while (v7 != v9);
        id v7 = [(NSHashTable *)v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
      }
      while (v7);
    }
  }
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (int64_t)cachedCarPlayAnnounceEnablementType
{
  return self->_cachedCarPlayAnnounceEnablementType;
}

- (void)setCachedCarPlayAnnounceEnablementType:(int64_t)a3
{
  self->_cachedCarPlayAnnounceEnablementType = a3;
}

- (BOOL)cachedAnnounceNotificationsInCarPlayTemporarilyDisabled
{
  return self->_cachedAnnounceNotificationsInCarPlayTemporarilyDisabled;
}

- (void)setCachedAnnounceNotificationsInCarPlayTemporarilyDisabled:(BOOL)a3
{
  self->_cachedAnnounceNotificationsInCarPlayTemporarilyDisabled = a3;
}

- (NSHashTable)observers
{
  return self->_observers;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_observers, 0);

  objc_storeStrong((id *)&self->_queue, 0);
}

@end