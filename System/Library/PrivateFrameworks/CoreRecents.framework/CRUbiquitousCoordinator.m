@interface CRUbiquitousCoordinator
- (CRUbiquitousCoordinator)initWithDelegate:(id)a3;
- (id)_allDomains;
- (unint64_t)_cloudStoreStateForDomain:(id)a3;
- (void)_removeLocalRecordsForAllDomains;
- (void)_removeLocalRecordsForCloudStoresWithDataFromPreviousAccount;
- (void)_setCloudStoreState:(unint64_t)a3 forDomain:(id)a4;
- (void)_setCloudStoreStateForAllDomains:(unint64_t)a3;
- (void)accountAdaptor:(id)a3 observediCloudAccountTransition:(int64_t)a4;
- (void)coordinateChangesInUbiquitousStoreForDomain:(id)a3;
- (void)dealloc;
- (void)ubiquitousStoreForDomainChangedAccount:(id)a3;
@end

@implementation CRUbiquitousCoordinator

- (CRUbiquitousCoordinator)initWithDelegate:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)CRUbiquitousCoordinator;
  v4 = [(CRUbiquitousCoordinator *)&v7 init];
  v5 = v4;
  if (v4)
  {
    v4->_delegate = (CRUbiquitousCoordinatorDelegate *)a3;
    v4->_cloudStoreStates = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
  }
  return v5;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)CRUbiquitousCoordinator;
  [(CRUbiquitousCoordinator *)&v3 dealloc];
}

- (void)coordinateChangesInUbiquitousStoreForDomain:(id)a3
{
}

- (void)ubiquitousStoreForDomainChangedAccount:(id)a3
{
  if ((char *)-[CRUbiquitousCoordinator _cloudStoreStateForDomain:](self, "_cloudStoreStateForDomain:") - 3 <= (char *)0xFFFFFFFFFFFFFFFDLL)
  {
    [(CRUbiquitousCoordinatorDelegate *)self->_delegate removeLocalRecordsForDomain:a3 removeInUbiquitousStore:0];
    [(CRUbiquitousCoordinator *)self _setCloudStoreState:2 forDomain:a3];
  }
}

- (void)accountAdaptor:(id)a3 observediCloudAccountTransition:(int64_t)a4
{
  v6 = +[CRLogging log];
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    int v9 = 138412290;
    CFStringRef v10 = sub_1000186F0(a4);
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Observed iCloud account transition %@", (uint8_t *)&v9, 0xCu);
  }
  switch(a4)
  {
    case 0:
      [(CRUbiquitousCoordinator *)self _removeLocalRecordsForAllDomains];
      objc_super v7 = self;
      uint64_t v8 = 3;
      goto LABEL_7;
    case 1:
      [(CRUbiquitousCoordinatorDelegate *)self->_delegate mergeCloudDataOneWayIntoLocalStoreWithReason:0x7FFFFFFFLL];
      goto LABEL_6;
    case 2:
LABEL_6:
      objc_super v7 = self;
      uint64_t v8 = 1;
LABEL_7:
      [(CRUbiquitousCoordinator *)v7 _setCloudStoreStateForAllDomains:v8];
      break;
    case 3:
      [(CRUbiquitousCoordinator *)self _removeLocalRecordsForCloudStoresWithDataFromPreviousAccount];
      [(CRUbiquitousCoordinatorDelegate *)self->_delegate mergeCloudDataOneWayIntoLocalStoreWithReason:2147483646];
      break;
    default:
      return;
  }
}

- (id)_allDomains
{
  return [(NSMutableDictionary *)self->_cloudStoreStates allKeys];
}

- (unint64_t)_cloudStoreStateForDomain:(id)a3
{
  unint64_t result = (unint64_t)[(NSMutableDictionary *)self->_cloudStoreStates objectForKeyedSubscript:a3];
  if (result)
  {
    return (unint64_t)[(id)result integerValue];
  }
  return result;
}

- (void)_setCloudStoreState:(unint64_t)a3 forDomain:(id)a4
{
  objc_super v7 = +[CRLogging log];
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v8 = (uint64_t)*(&off_10002D358 + a3);
    int v9 = 138543618;
    id v10 = a4;
    __int16 v11 = 2114;
    uint64_t v12 = v8;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Setting state for domain:%{public}@ -> %{public}@", (uint8_t *)&v9, 0x16u);
  }
  [(NSMutableDictionary *)self->_cloudStoreStates setObject:+[NSNumber numberWithUnsignedInteger:a3] forKey:a4];
}

- (void)_setCloudStoreStateForAllDomains:(unint64_t)a3
{
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v5 = [(CRUbiquitousCoordinator *)self _allDomains];
  id v6 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v11;
    do
    {
      int v9 = 0;
      do
      {
        if (*(void *)v11 != v8) {
          objc_enumerationMutation(v5);
        }
        [(CRUbiquitousCoordinator *)self _setCloudStoreState:a3 forDomain:*(void *)(*((void *)&v10 + 1) + 8 * (void)v9)];
        int v9 = (char *)v9 + 1;
      }
      while (v7 != v9);
      id v7 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v7);
  }
}

- (void)_removeLocalRecordsForCloudStoresWithDataFromPreviousAccount
{
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  id v3 = [(CRUbiquitousCoordinator *)self _allDomains];
  id v4 = [v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v4)
  {
    id v5 = v4;
    uint64_t v6 = *(void *)v10;
    do
    {
      for (i = 0; i != v5; i = (char *)i + 1)
      {
        if (*(void *)v10 != v6) {
          objc_enumerationMutation(v3);
        }
        uint64_t v8 = *(void *)(*((void *)&v9 + 1) + 8 * i);
        if ((id)[(CRUbiquitousCoordinator *)self _cloudStoreStateForDomain:v8] != (id)2)
        {
          [(CRUbiquitousCoordinatorDelegate *)self->_delegate removeLocalRecordsForDomain:v8 removeInUbiquitousStore:0];
          [(CRUbiquitousCoordinator *)self _setCloudStoreState:2 forDomain:v8];
        }
      }
      id v5 = [v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v5);
  }
}

- (void)_removeLocalRecordsForAllDomains
{
  id v3 = +[CRLogging log];
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Removing local records for all domains", buf, 2u);
  }
  long long v11 = 0u;
  long long v12 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  id v4 = [(CRUbiquitousCoordinator *)self _allDomains];
  id v5 = [v4 countByEnumeratingWithState:&v9 objects:v14 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v10;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v10 != v7) {
          objc_enumerationMutation(v4);
        }
        [(CRUbiquitousCoordinatorDelegate *)self->_delegate removeLocalRecordsForDomain:*(void *)(*((void *)&v9 + 1) + 8 * (void)v8) removeInUbiquitousStore:0];
        uint64_t v8 = (char *)v8 + 1;
      }
      while (v6 != v8);
      id v6 = [v4 countByEnumeratingWithState:&v9 objects:v14 count:16];
    }
    while (v6);
  }
}

@end