@interface IDSFamilyManager
+ (IDSFamilyManager)sharedInstance;
- (BOOL)canForceFamilyFetch;
- (BOOL)isPendingFetch;
- (BOOL)storedIncomingFamilyMessage;
- (IDSFamilyManager)init;
- (IDSFamilyManager)initWithFamilyRequest:(id)a3;
- (NSMutableSet)familyHandles;
- (NSSet)familyDevices;
- (NSSet)familyMembers;
- (id)handlesFromFamilyMember:(id)a3;
- (void)_familyDidUpdate:(id)a3;
- (void)_notifyFamilyServicesOfUpdate;
- (void)fetchFamilyWithFamilyRequest:(id)a3;
- (void)forceFamilyFetch;
- (void)setFamilyDevices:(id)a3;
- (void)setFamilyHandles:(id)a3;
- (void)setFamilyMembers:(id)a3;
- (void)setIsPendingFetch:(BOOL)a3;
- (void)setStoredIncomingFamilyMessage:(BOOL)a3;
@end

@implementation IDSFamilyManager

+ (IDSFamilyManager)sharedInstance
{
  if (qword_100A4A7D8 != -1) {
    dispatch_once(&qword_100A4A7D8, &stru_100983758);
  }
  v2 = (void *)qword_100A4A7E0;

  return (IDSFamilyManager *)v2;
}

- (NSSet)familyMembers
{
  return self->_familyMembers;
}

- (NSMutableSet)familyHandles
{
  return self->_familyHandles;
}

- (id)handlesFromFamilyMember:(id)a3
{
  id v3 = a3;
  id v4 = objc_alloc_init((Class)NSMutableSet);
  v5 = [v3 appleID];
  [v4 addObject:v5];

  v6 = [v3 dictionary];
  v7 = [v6 objectForKey:@"member-appleID-aliases"];

  if (v7 && [v7 count])
  {
    v8 = +[NSSet setWithArray:v7];
    [v4 unionSet:v8];
  }
  v9 = [v3 dictionary];
  v10 = [v9 objectForKey:@"member-phone-numbers"];

  if (v10 && [v10 length])
  {
    v11 = [v10 componentsSeparatedByString:@", "];
    v12 = +[NSSet setWithArray:v11];
    [v4 unionSet:v12];
  }

  return v4;
}

- (void)fetchFamilyWithFamilyRequest:(id)a3
{
  id v4 = a3;
  self->_isPendingFetch = 1;
  [(NSMutableSet *)self->_familyHandles removeAllObjects];
  v5 = OSLogHandleForIDSCategory();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Fetching Family", buf, 2u);
  }

  if (os_log_shim_legacy_logging_enabled() && _IDSShouldLog()) {
    _IDSLogV();
  }
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_1001418E4;
  v6[3] = &unk_100983780;
  v6[4] = self;
  [v4 startRequestWithCompletionHandler:v6];
}

- (IDSFamilyManager)init
{
  id v3 = OSLogHandleForIDSCategory();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v7 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Initializing IDS Family Manager", v7, 2u);
  }

  if (os_log_shim_legacy_logging_enabled() && _IDSShouldLog()) {
    _IDSLogV();
  }
  id v4 = objc_alloc_init((Class)IMWeakLinkClass());
  v5 = [(IDSFamilyManager *)self initWithFamilyRequest:v4];

  return v5;
}

- (IDSFamilyManager)initWithFamilyRequest:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)IDSFamilyManager;
  v5 = [(IDSFamilyManager *)&v10 init];
  if (v5)
  {
    v6 = +[NSDistributedNotificationCenter defaultCenter];
    [v6 addObserver:v5 selector:"_familyDidUpdate:" name:@"com.apple.family.family_updated" object:0];

    v7 = (NSMutableSet *)objc_alloc_init((Class)NSMutableSet);
    familyHandles = v5->_familyHandles;
    v5->_familyHandles = v7;

    v5->_storedIncomingFamilyMessage = 0;
    v5->currentFetchCount = 0;
    *(_WORD *)&v5->allowForceFetch = 1;
    [(IDSFamilyManager *)v5 fetchFamilyWithFamilyRequest:v4];
  }

  return v5;
}

- (BOOL)canForceFamilyFetch
{
  return self->allowForceFetch && self->currentFetchCount < 2;
}

- (void)forceFamilyFetch
{
  if (self->_isPendingFetch)
  {
    v2 = OSLogHandleForIDSCategory();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "We're doing a  Forced Fetch already, we'll let that continue", buf, 2u);
    }

    if (os_log_shim_legacy_logging_enabled())
    {
      if (_IDSShouldLog()) {
        _IDSLogV();
      }
    }
  }
  else
  {
    ++self->currentFetchCount;
    id v4 = OSLogHandleForIDSCategory();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      int currentFetchCount = self->currentFetchCount;
      *(_DWORD *)buf = 67109120;
      int v8 = currentFetchCount;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Starting Forced Fetch. Fetch count is now at: %d", buf, 8u);
    }

    if (os_log_shim_legacy_logging_enabled() && _IDSShouldLog()) {
      _IDSLogV();
    }
    id v6 = objc_alloc_init((Class)IMWeakLinkClass());
    [(IDSFamilyManager *)self fetchFamilyWithFamilyRequest:v6];
  }
}

- (void)_familyDidUpdate:(id)a3
{
  id v4 = a3;
  v5 = OSLogHandleForIDSCategory();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v7 = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Notification received for family update.", v7, 2u);
  }

  if (os_log_shim_legacy_logging_enabled() && _IDSShouldLog()) {
    _IDSLogV();
  }
  self->int currentFetchCount = 0;
  self->allowForceFetch = 1;
  id v6 = objc_alloc_init((Class)IMWeakLinkClass());
  [(IDSFamilyManager *)self fetchFamilyWithFamilyRequest:v6];
}

- (void)_notifyFamilyServicesOfUpdate
{
  id v3 = objc_alloc_init((Class)NSMutableArray);
  id v4 = [(NSMutableSet *)self->_familyHandles allObjects];
  id v5 = [v4 copy];

  id v6 = objc_alloc_init((Class)NSMutableDictionary);
  v7 = +[IDSDServiceController sharedInstance];
  int v8 = [v7 allFamilyServices];

  long long v38 = 0u;
  long long v39 = 0u;
  long long v36 = 0u;
  long long v37 = 0u;
  v9 = self->_familyMembers;
  id v10 = [(NSSet *)v9 countByEnumeratingWithState:&v36 objects:v43 count:16];
  if (v10)
  {
    id v11 = v10;
    uint64_t v12 = *(void *)v37;
    do
    {
      for (i = 0; i != v11; i = (char *)i + 1)
      {
        if (*(void *)v37 != v12) {
          objc_enumerationMutation(v9);
        }
        v14 = *(void **)(*((void *)&v36 + 1) + 8 * i);
        v16 = [v14 dictionaryRepresentation];
        [v3 addObject:v16];
      }
      id v11 = [(NSSet *)v9 countByEnumeratingWithState:&v36 objects:v43 count:16];
    }
    while (v11);
  }

  v29 = v5;
  [v6 setObject:v5 forKey:IDSFamilyHandlesKey];
  v30 = v3;
  [v6 setObject:v3 forKey:IDSFamilyMembersKey];
  long long v34 = 0u;
  long long v35 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  id obj = v8;
  id v17 = [obj countByEnumeratingWithState:&v32 objects:v42 count:16];
  if (v17)
  {
    id v18 = v17;
    uint64_t v19 = *(void *)v33;
    do
    {
      for (j = 0; j != v18; j = (char *)j + 1)
      {
        if (*(void *)v33 != v19) {
          objc_enumerationMutation(obj);
        }
        v21 = *(void **)(*((void *)&v32 + 1) + 8 * (void)j);
        id v22 = objc_alloc_init((Class)IMMessageContext);
        v23 = +[IDSDaemon sharedInstance];
        v24 = [v21 pushTopic];
        v25 = [v23 broadcasterForTopic:v24 messageContext:v22];

        v26 = +[IMRGLog registration];
        if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
        {
          v27 = [v21 pushTopic];
          *(_DWORD *)buf = 138412290;
          v41 = v27;
          _os_log_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_DEFAULT, "broadcasting family update on %@", buf, 0xCu);
        }
        v28 = [v21 pushTopic];
        [v25 service:v28 familyInfoUpdated:v6];
      }
      id v18 = [obj countByEnumeratingWithState:&v32 objects:v42 count:16];
    }
    while (v18);
  }
}

- (void)setFamilyMembers:(id)a3
{
}

- (NSSet)familyDevices
{
  return self->_familyDevices;
}

- (void)setFamilyDevices:(id)a3
{
}

- (void)setFamilyHandles:(id)a3
{
}

- (BOOL)isPendingFetch
{
  return self->_isPendingFetch;
}

- (void)setIsPendingFetch:(BOOL)a3
{
  self->_isPendingFetch = a3;
}

- (BOOL)storedIncomingFamilyMessage
{
  return self->_storedIncomingFamilyMessage;
}

- (void)setStoredIncomingFamilyMessage:(BOOL)a3
{
  self->_storedIncomingFamilyMessage = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_familyHandles, 0);
  objc_storeStrong((id *)&self->_familyDevices, 0);

  objc_storeStrong((id *)&self->_familyMembers, 0);
}

@end