@interface CommunicationsFilterBlockListStore
+ (id)sharedInstance;
- (BOOL)addItemForAllServices:(id)a3;
- (BOOL)isItemInList:(id)a3;
- (BOOL)removeItemForAllServices:(id)a3;
- (CMFSyncAgentDataStore)dataStore;
- (CommunicationsFilterBlockListStore)init;
- (NSMutableArray)cachedBlockList;
- (id)_copyItems:(BOOL)a3;
- (id)_isItemInList:(id)a3 blockList:(id)a4;
- (id)copyAllItems;
- (id)copyAllItemsAsDictionaries;
- (void)_stopSharingFocusStatusWithFilterItem:(id)a3;
- (void)_storeDidChangeExternally;
- (void)_updateStore:(id)a3 revision:(unint64_t)a4 updateKVS:(BOOL)a5 updateLocal:(BOOL)a6 itemsNeedConversion:(BOOL)a7;
- (void)clearBlockList;
- (void)dealloc;
- (void)handleNSUbiquitousKeyValueStoreDidChangeExternallyNotification:(id)a3;
- (void)migrateLegacyDataStoreIfNeeded;
- (void)setCachedBlockList:(id)a3;
- (void)synchronizeDataStore;
- (void)updateDataStore;
@end

@implementation CommunicationsFilterBlockListStore

+ (id)sharedInstance
{
  if (qword_10000C370 != -1) {
    dispatch_once(&qword_10000C370, &stru_1000083F8);
  }
  return (id)qword_10000C378;
}

- (CommunicationsFilterBlockListStore)init
{
  v4.receiver = self;
  v4.super_class = (Class)CommunicationsFilterBlockListStore;
  v2 = [(CommunicationsFilterBlockListStore *)&v4 init];
  if (v2)
  {
    v2->_dataStore = (CMFSyncAgentDataStore *)[objc_alloc((Class)NSUbiquitousKeyValueStore) _initWithStoreIdentifier:@"com.apple.cmfsyncagent" usingEndToEndEncryption:1];
    [+[NSNotificationCenter defaultCenter] addObserver:v2 selector:"handleNSUbiquitousKeyValueStoreDidChangeExternallyNotification:" name:NSUbiquitousKeyValueStoreDidChangeExternallyNotification object:v2->_dataStore];
    [(CommunicationsFilterBlockListStore *)v2 synchronizeDataStore];
    IMSyncronizeAppPreferences();
    [(CommunicationsFilterBlockListStore *)v2 migrateLegacyDataStoreIfNeeded];
  }
  return v2;
}

- (void)dealloc
{
  [(CommunicationsFilterBlockListStore *)self clearBlockList];
  v3.receiver = self;
  v3.super_class = (Class)CommunicationsFilterBlockListStore;
  [(CommunicationsFilterBlockListStore *)&v3 dealloc];
}

- (void)clearBlockList
{
  cachedBlockList = self->_cachedBlockList;
  if (cachedBlockList)
  {

    self->_cachedBlockList = 0;
  }
}

- (void)migrateLegacyDataStoreIfNeeded
{
  if ([(CMFSyncAgentDataStore *)[(CommunicationsFilterBlockListStore *)self dataStore] objectForKey:@"__kCMFBlockListStoreTopLevelKey"])
  {
    objc_super v3 = sub_1000041B8();
    if (!os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT)) {
      return;
    }
    int v9 = 138412290;
    CFStringRef v10 = @"__kCMFBlockListStoreTopLevelKey";
    objc_super v4 = "Cancelling legacy data store migration; data store contains a value for key %@";
    v5 = v3;
    goto LABEL_4;
  }
  id v6 = [+[NSUbiquitousKeyValueStore defaultStore] objectForKey:@"__kCMFBlockListStoreTopLevelKey"];
  v7 = sub_1000041B8();
  BOOL v8 = os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT);
  if (v6)
  {
    if (v8)
    {
      int v9 = 138412290;
      CFStringRef v10 = @"__kCMFBlockListStoreTopLevelKey";
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Performing legacy data store migration for key %@", (uint8_t *)&v9, 0xCu);
    }
    [(CMFSyncAgentDataStore *)[(CommunicationsFilterBlockListStore *)self dataStore] setObject:v6 forKey:@"__kCMFBlockListStoreTopLevelKey"];
  }
  else if (v8)
  {
    int v9 = 138412290;
    CFStringRef v10 = @"__kCMFBlockListStoreTopLevelKey";
    objc_super v4 = "Cancelling legacy data store migration; legacy data store does not contain a value for key %@";
    v5 = v7;
LABEL_4:
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, v4, (uint8_t *)&v9, 0xCu);
  }
}

- (void)synchronizeDataStore
{
  if (objc_opt_respondsToSelector())
  {
    unsigned int v3 = [(CMFSyncAgentDataStore *)self->_dataStore synchronize];
    objc_super v4 = sub_1000041B8();
    v5 = v4;
    if (v3)
    {
      if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)id v6 = 0;
        _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Data store synchronization completed successfully.", v6, 2u);
      }
    }
    else if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      sub_100005AD4(v5);
    }
  }
}

- (void)updateDataStore
{
  unsigned int v3 = sub_100003964();
  dispatch_assert_queue_V2(v3);
  objc_super v4 = [(CommunicationsFilterBlockListStore *)self dataStore];
  uint64_t v8 = 0;
  id v5 = objc_alloc_init((Class)NSMutableArray);
  __int16 v7 = 0;
  sub_1000049F4(v4, v5, 0, &v8, (unsigned char *)&v7 + 1, &v7);
  LODWORD(v4) = [v5 count] == 0;

  sub_100004680(v4);
  id v6 = sub_100003964();
  dispatch_async(v6, &stru_100008418);
}

- (void)_storeDidChangeExternally
{
  unsigned int v3 = sub_1000041B8();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)objc_super v4 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "manually synchronizing and triggering update", v4, 2u);
  }
  IMSyncronizeAppPreferences();
  [(CommunicationsFilterBlockListStore *)self updateDataStore];
}

- (BOOL)addItemForAllServices:(id)a3
{
  if (a3)
  {
    uint64_t v14 = 0;
    id v5 = objc_alloc_init((Class)NSMutableArray);
    __int16 v13 = 0;
    [(CommunicationsFilterBlockListStore *)self clearBlockList];
    sub_1000049F4([(CommunicationsFilterBlockListStore *)self dataStore], v5, 0, &v14, (unsigned char *)&v13 + 1, &v13);
    if ((unint64_t)[v5 count] >= 0x4E21)
    {
      id v6 = sub_1000041B8();
      BOOL v7 = 0;
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 67109120;
        int v16 = 20000;
        _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "[WARN] Block list is too large, greater than %d, not adding", buf, 8u);
        BOOL v7 = 0;
      }
      goto LABEL_14;
    }
    id v9 = [(CommunicationsFilterBlockListStore *)self _isItemInList:a3 blockList:v5];
    BOOL v7 = v9 == 0;
    if (v9)
    {
      int v10 = HIBYTE(v13);
      int v11 = v13;
      if (!(HIBYTE(v13) | v13)) {
        goto LABEL_13;
      }
    }
    else
    {
      [v5 addObject:a3];
      ++v14;
      int v10 = 1;
      __int16 v13 = 257;
      int v11 = 1;
    }
    [(CommunicationsFilterBlockListStore *)self _updateStore:v5 revision:v14 updateKVS:v11 != 0 updateLocal:v10 != 0 itemsNeedConversion:1];
    [(CommunicationsFilterBlockListStore *)self _stopSharingFocusStatusWithFilterItem:a3];
LABEL_13:
    sub_100004680([v5 count] == 0);
LABEL_14:

    return v7;
  }
  uint64_t v8 = sub_1000041B8();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_FAULT)) {
    sub_100005B18(v8);
  }
  return 0;
}

- (BOOL)removeItemForAllServices:(id)a3
{
  if (a3)
  {
    uint64_t v13 = 0;
    __int16 v12 = 0;
    [(CommunicationsFilterBlockListStore *)self clearBlockList];
    id v5 = objc_alloc_init((Class)NSMutableArray);
    sub_1000049F4([(CommunicationsFilterBlockListStore *)self dataStore], v5, 0, &v13, (unsigned char *)&v12 + 1, &v12);
    id v6 = [(CommunicationsFilterBlockListStore *)self _isItemInList:a3 blockList:v5];
    BOOL v7 = v6 != 0;
    if (v6)
    {
      [v5 removeObject:v6];
      ++v13;
      int v8 = 1;
      __int16 v12 = 257;
      int v9 = 1;
    }
    else
    {
      int v8 = HIBYTE(v12);
      int v9 = v12;
      if (!(HIBYTE(v12) | v12))
      {
LABEL_9:
        sub_100004680(objc_msgSend(v5, "count", v6) == 0);

        return v7;
      }
    }
    [(CommunicationsFilterBlockListStore *)self _updateStore:v5 revision:v13 updateKVS:v9 != 0 updateLocal:v8 != 0 itemsNeedConversion:1];
    goto LABEL_9;
  }
  int v10 = sub_1000041B8();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_FAULT)) {
    sub_100005B5C(v10);
  }
  return 0;
}

- (id)copyAllItemsAsDictionaries
{
  return [(CommunicationsFilterBlockListStore *)self _copyItems:1];
}

- (id)copyAllItems
{
  return [(CommunicationsFilterBlockListStore *)self _copyItems:0];
}

- (id)_copyItems:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v8 = 0;
  __int16 v7 = 0;
  [(CommunicationsFilterBlockListStore *)self clearBlockList];
  id v5 = objc_alloc_init((Class)NSMutableArray);
  sub_1000049F4([(CommunicationsFilterBlockListStore *)self dataStore], v5, v3, &v8, (unsigned char *)&v7 + 1, &v7);
  if (HIBYTE(v7) | v7) {
    [(CommunicationsFilterBlockListStore *)self _updateStore:v5 revision:v8 updateKVS:v7 != 0 updateLocal:HIBYTE(v7) != 0 itemsNeedConversion:!v3];
  }
  return v5;
}

- (id)_isItemInList:(id)a3 blockList:(id)a4
{
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v6 = [a4 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (!v6) {
    return 0;
  }
  id v7 = v6;
  uint64_t v8 = *(void *)v13;
LABEL_3:
  uint64_t v9 = 0;
  while (1)
  {
    if (*(void *)v13 != v8) {
      objc_enumerationMutation(a4);
    }
    int v10 = *(void **)(*((void *)&v12 + 1) + 8 * v9);
    if ([v10 matchesFilterItem:a3]) {
      return v10;
    }
    if (v7 == (id)++v9)
    {
      id v7 = [a4 countByEnumeratingWithState:&v12 objects:v16 count:16];
      if (v7) {
        goto LABEL_3;
      }
      return 0;
    }
  }
}

- (BOOL)isItemInList:(id)a3
{
  uint64_t v10 = 0;
  __int16 v9 = 0;
  if (![(CommunicationsFilterBlockListStore *)self cachedBlockList])
  {
    id v5 = +[NSMutableArray array];
    sub_1000049F4([(CommunicationsFilterBlockListStore *)self dataStore], v5, 0, &v10, (unsigned char *)&v9 + 1, &v9);
    [(CommunicationsFilterBlockListStore *)self setCachedBlockList:v5];
  }
  id v6 = [(CommunicationsFilterBlockListStore *)self _isItemInList:a3 blockList:[(CommunicationsFilterBlockListStore *)self cachedBlockList]];
  if (HIBYTE(v9) | v9)
  {
    id v7 = [(CommunicationsFilterBlockListStore *)self cachedBlockList];
    [(CommunicationsFilterBlockListStore *)self _updateStore:v7 revision:v10 updateKVS:v9 updateLocal:HIBYTE(v9) itemsNeedConversion:1];
  }
  return v6 != 0;
}

- (void)_updateStore:(id)a3 revision:(unint64_t)a4 updateKVS:(BOOL)a5 updateLocal:(BOOL)a6 itemsNeedConversion:(BOOL)a7
{
  BOOL v7 = a6;
  BOOL v8 = a5;
  id v10 = a3;
  if (a5 || a6)
  {
    if (a5 && a6)
    {
      if (a7)
      {
        long long v12 = +[NSMutableArray arrayWithCapacity:](NSMutableArray, "arrayWithCapacity:", [a3 count]);
        long long v23 = 0u;
        long long v24 = 0u;
        long long v25 = 0u;
        long long v26 = 0u;
        id v13 = [v10 countByEnumeratingWithState:&v23 objects:buf count:16];
        if (v13)
        {
          id v14 = v13;
          uint64_t v15 = *(void *)v24;
          do
          {
            for (i = 0; i != v14; i = (char *)i + 1)
            {
              if (*(void *)v24 != v15) {
                objc_enumerationMutation(v10);
              }
              -[NSMutableArray addObject:](v12, "addObject:", [*(id *)(*((void *)&v23 + 1) + 8 * i) dictionaryRepresentation]);
            }
            id v14 = [v10 countByEnumeratingWithState:&v23 objects:buf count:16];
          }
          while (v14);
        }
        id v10 = v12;
      }
      v17 = +[NSDictionary dictionaryWithObjectsAndKeys:](NSDictionary, "dictionaryWithObjectsAndKeys:", +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", 1), @"__kCMFBlockListStoreVersionKey", v10, @"__kCMFBlockListStoreArrayKey", +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", a4), @"__kCMFBlockListStoreRevisionKey", +[NSDate date], @"__kCMFBlockListStoreRevisionTimestampKey", @"__kCMFBlockListStoreTypeValue", @"__kCMFBlockListStoreTypeKey", 0);
    }
    else
    {
      v17 = a5
          ? (NSDictionary *)IMGetAppValueForKey()
          : (NSDictionary *)[(CMFSyncAgentDataStore *)[(CommunicationsFilterBlockListStore *)self dataStore] objectForKey:@"__kCMFBlockListStoreTopLevelKey"];
    }
    v18 = v17;
    if (v17)
    {
      v19 = sub_1000041B8();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
      {
        v22 = sub_10000559C(v18);
        *(_DWORD *)buf = 138412802;
        v28 = v22;
        __int16 v29 = 1024;
        BOOL v30 = v8;
        __int16 v31 = 1024;
        BOOL v32 = v7;
        _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, "updating store to %@, updateKVS: %d, updateLocal: %d", buf, 0x18u);
        if (!v8)
        {
LABEL_21:
          if (!v7) {
            goto LABEL_23;
          }
          goto LABEL_22;
        }
      }
      else if (!v8)
      {
        goto LABEL_21;
      }
      [(CMFSyncAgentDataStore *)[(CommunicationsFilterBlockListStore *)self dataStore] setObject:v18 forKey:@"__kCMFBlockListStoreTopLevelKey"];
      if (!v7)
      {
LABEL_23:
        v20 = sub_1000041B8();
        if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
        {
          v21 = sub_10000559C([(CMFSyncAgentDataStore *)[(CommunicationsFilterBlockListStore *)self dataStore] objectForKey:@"__kCMFBlockListStoreTopLevelKey"]);
          *(_DWORD *)buf = 138412802;
          v28 = v21;
          __int16 v29 = 1024;
          BOOL v30 = v8;
          __int16 v31 = 1024;
          BOOL v32 = v7;
          _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEFAULT, "store after updating %@, updateKVS:%d, updateLocal:%d", buf, 0x18u);
        }
        return;
      }
LABEL_22:
      IMSetAppValueForKey();
      IMSyncronizeAppPreferences();
      goto LABEL_23;
    }
  }
}

- (void)_stopSharingFocusStatusWithFilterItem:(id)a3
{
  id v3 = [a3 unformattedID];
  if ([v3 length])
  {
    objc_super v4 = sub_1000041B8();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      int v7 = 138412290;
      id v8 = v3;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Asking StatusKit to remove sharing of focus status with handle %@", (uint8_t *)&v7, 0xCu);
    }
    id v5 = (objc_class *)IMWeakLinkClass();
    id v6 = (objc_class *)IMWeakLinkClass();
    objc_msgSend(objc_msgSend([v6 alloc], "initWithStatusTypeIdentifier:", *(void *)IMWeakLinkSymbol()), "removeInvitedHandle:completion:", objc_msgSend([v5 alloc], "initWithString:", v3), &stru_100008458);
  }
}

- (void)handleNSUbiquitousKeyValueStoreDidChangeExternallyNotification:(id)a3
{
  id v5 = [a3 userInfo];
  if (!v5) {
    goto LABEL_7;
  }
  id v6 = [v5 objectForKeyedSubscript:NSUbiquitousKeyValueStoreChangeReasonKey];
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    int v7 = sub_1000041B8();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      sub_100005C18((uint64_t)v6, v7);
    }
    goto LABEL_7;
  }
  if ([v6 integerValue] != (id)2)
  {
LABEL_7:
    id v8 = sub_100003964();
    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3221225472;
    v9[2] = sub_1000058F0;
    v9[3] = &unk_100008480;
    v9[4] = self;
    v9[5] = a3;
    dispatch_async(v8, v9);
  }
}

- (CMFSyncAgentDataStore)dataStore
{
  return self->_dataStore;
}

- (NSMutableArray)cachedBlockList
{
  return self->_cachedBlockList;
}

- (void)setCachedBlockList:(id)a3
{
}

@end