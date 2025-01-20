@interface MergeTransactions
- (CallHistoryDBClientHandleProtocol)database;
- (MergeTransactions)initWithDatabase:(id)a3 andInteractionManager:(id)a4;
- (id)filterRemoteTransactions:(id)a3 withLocalTransactions:(id)a4;
- (id)merge:(id)a3 withRemoteTransactions:(id)a4;
- (id)reconcileTransaction:(unint64_t)a3 withLocalCall:(id)a4 withRemoteCall:(id)a5;
- (id)unarchiveCallObject:(id)a3;
- (unint64_t)cloudTransactionCount;
- (unint64_t)localTransactionCount;
- (void)dealloc;
- (void)handleRemoteTransactionsNotification:(id)a3 withChangeToken:(id)a4 withMoreComing:(id)a5 withSource:(unsigned __int8)a6;
- (void)handleRemoteTransactionsNotification:(id)a3 withSource:(unsigned __int8)a4;
- (void)parseMergeDictionary:(id)a3 withSyncSource:(unsigned __int8)a4;
- (void)registerForNotifications;
- (void)setDatabase:(id)a3;
@end

@implementation MergeTransactions

- (MergeTransactions)initWithDatabase:(id)a3 andInteractionManager:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v14.receiver = self;
  v14.super_class = (Class)MergeTransactions;
  v9 = [(MergeTransactions *)&v14 initWithDomain:"MergeTransactions"];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_database, a3);
    v11 = [[ApplyLocalTransactions alloc] initWithDatabase:v10->_database andInteractionManager:v8];
    applyLocalTransactions = v10->_applyLocalTransactions;
    v10->_applyLocalTransactions = v11;

    [(MergeTransactions *)v10 registerForNotifications];
  }

  return v10;
}

- (void)dealloc
{
  v3 = +[NSNotificationCenter defaultCenter];
  [v3 removeObserver:self->_observerRemoteTransactions];

  v4.receiver = self;
  v4.super_class = (Class)MergeTransactions;
  [(MergeTransactions *)&v4 dealloc];
}

- (void)registerForNotifications
{
  objc_initWeak(&location, self);
  v3 = +[NSNotificationCenter defaultCenter];
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_10001252C;
  v6[3] = &unk_100048BA0;
  objc_copyWeak(&v7, &location);
  objc_super v4 = [v3 addObserverForName:@"kCallHistoryMergeRemoteTransactionsNotification" object:0 queue:0 usingBlock:v6];
  id observerRemoteTransactions = self->_observerRemoteTransactions;
  self->_id observerRemoteTransactions = v4;

  objc_destroyWeak(&v7);
  objc_destroyWeak(&location);
}

- (void)parseMergeDictionary:(id)a3 withSyncSource:(unsigned __int8)a4
{
  unsigned int v4 = a4;
  id v6 = a3;
  id v7 = [v6 objectForKeyedSubscript:@"kCHRemoteTransactionsKey"];
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v13 = [(MergeTransactions *)self logHandle];
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      int v21 = 138543618;
      CFStringRef v22 = @"kCHRemoteTransactionsKey";
      __int16 v23 = 2114;
      id v24 = (id)objc_opt_class();
      id v14 = v24;
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "Expected %{public}@ key to be of type %{public}@", (uint8_t *)&v21, 0x16u);
    }
    goto LABEL_14;
  }
  id v8 = +[CHLogServer sharedInstance];
  v9 = [v8 logHandleForDomain:"MergeTransactions"];

  v10 = v9;
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    CFStringRef v11 = (const __CFString *)[v7 count];
    v12 = sub_100025E00(v4);
    int v21 = 134218242;
    CFStringRef v22 = v11;
    __int16 v23 = 2114;
    id v24 = v12;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "%lu remote transactions from %{public}@", (uint8_t *)&v21, 0x16u);
  }
  if (v4 == 1)
  {
    v15 = [v6 objectForKeyedSubscript:@"kCHChangeTokenKey"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v16 = [v6 objectForKeyedSubscript:@"kCHMoreTransactionsComingKey"];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        [(MergeTransactions *)self handleRemoteTransactionsNotification:v7 withChangeToken:v15 withMoreComing:v16 withSource:1];
LABEL_21:

        goto LABEL_15;
      }
      v18 = [(MergeTransactions *)self logHandle];
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
      {
        v19 = objc_opt_class();
        int v21 = 138543618;
        CFStringRef v22 = @"kCHMoreTransactionsComingKey";
        __int16 v23 = 2114;
        id v24 = v19;
        id v20 = v19;
        _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "Expected %{public}@ key to be of type %{public}@", (uint8_t *)&v21, 0x16u);
      }
    }
    else
    {
      v16 = [(MergeTransactions *)self logHandle];
      if (!os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_21;
      }
      v17 = objc_opt_class();
      int v21 = 138543618;
      CFStringRef v22 = @"kCHChangeTokenKey";
      __int16 v23 = 2114;
      id v24 = v17;
      v18 = v17;
      _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "Expected %{public}@ key to be of type %{public}@", (uint8_t *)&v21, 0x16u);
    }

    goto LABEL_21;
  }
  if (v4 != 2)
  {
    v13 = [(MergeTransactions *)self logHandle];
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
      sub_10002EAA0(v4, v13);
    }
LABEL_14:

    goto LABEL_15;
  }
  [(MergeTransactions *)self handleRemoteTransactionsNotification:v7 withSource:2];
LABEL_15:
}

- (void)handleRemoteTransactionsNotification:(id)a3 withSource:(unsigned __int8)a4
{
  uint64_t v4 = a4;
  id v6 = a3;
  id v7 = objc_opt_new();
  id v11 = [(MergeTransactions *)self merge:v7 withRemoteTransactions:v6];

  id v8 = objc_opt_new();
  [v8 setObject:v11 forKeyedSubscript:@"kCHMergeTransactionsResultKey"];
  id v9 = [objc_alloc((Class)NSNumber) initWithInt:v4];
  [v8 setObject:v9 forKeyedSubscript:@"kCHSyncSourceKey"];

  v10 = +[NSNotificationCenter defaultCenter];
  [v10 postNotificationName:@"kCallHistoryRemoteTransactionsAppliedNotification" object:0 userInfo:v8];
}

- (void)handleRemoteTransactionsNotification:(id)a3 withChangeToken:(id)a4 withMoreComing:(id)a5 withSource:(unsigned __int8)a6
{
  uint64_t v6 = a6;
  id v10 = a5;
  id v11 = a4;
  id v12 = a3;
  v13 = objc_opt_new();
  id v17 = [(MergeTransactions *)self merge:v13 withRemoteTransactions:v12];

  id v14 = objc_opt_new();
  [v14 setObject:v11 forKeyedSubscript:@"kCHChangeTokenKey"];

  [v14 setObject:v10 forKeyedSubscript:@"kCHMoreTransactionsComingKey"];
  [v14 setObject:v17 forKeyedSubscript:@"kCHMergeTransactionsResultKey"];
  id v15 = [objc_alloc((Class)NSNumber) initWithInt:v6];
  [v14 setObject:v15 forKeyedSubscript:@"kCHSyncSourceKey"];

  v16 = +[NSNotificationCenter defaultCenter];
  [v16 postNotificationName:@"kCallHistoryRemoteTransactionsAppliedNotification" object:0 userInfo:v14];
}

- (id)merge:(id)a3 withRemoteTransactions:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if ([v7 count])
  {
    id v8 = [(MergeTransactions *)self filterRemoteTransactions:v7 withLocalTransactions:v6];
    id v9 = [(MergeTransactions *)self logHandle];
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134217984;
      v39 = (char *)[v8 count];
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Applying %ld remote transactions", buf, 0xCu);
    }
    id v30 = v7;
    id v31 = v6;

    [(ApplyLocalTransactions *)self->_applyLocalTransactions apply:v8];
    long long v34 = 0u;
    long long v35 = 0u;
    long long v32 = 0u;
    long long v33 = 0u;
    id v10 = v8;
    id v11 = [v10 countByEnumeratingWithState:&v32 objects:v46 count:16];
    if (v11)
    {
      id v12 = v11;
      v13 = 0;
      uint64_t v14 = 0;
      uint64_t v15 = 0;
      uint64_t v16 = 0;
      uint64_t v17 = *(void *)v33;
      do
      {
        for (i = 0; i != v12; i = (char *)i + 1)
        {
          if (*(void *)v33 != v17) {
            objc_enumerationMutation(v10);
          }
          switch((unint64_t)objc_msgSend(*(id *)(*((void *)&v32 + 1) + 8 * i), "transactionType", v30, v31, (void)v32))
          {
            case 0uLL:
              ++v13;
              break;
            case 1uLL:
              ++v14;
              break;
            case 2uLL:
              ++v15;
              break;
            case 3uLL:
              ++v16;
              break;
            default:
              continue;
          }
        }
        id v12 = [v10 countByEnumeratingWithState:&v32 objects:v46 count:16];
      }
      while (v12);
    }
    else
    {
      v13 = 0;
      uint64_t v14 = 0;
      uint64_t v15 = 0;
      uint64_t v16 = 0;
    }

    id v20 = [(MergeTransactions *)self logHandle];
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134218752;
      v39 = v13;
      __int16 v40 = 2048;
      uint64_t v41 = v14;
      __int16 v42 = 2048;
      uint64_t v43 = v15;
      __int16 v44 = 2048;
      uint64_t v45 = v16;
      _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEFAULT, "Applied %lu insert %lu update %lu delete %lu batch delete transactions", buf, 0x2Au);
    }

    int v21 = +[CHTransaction toString:0];
    v36[0] = v21;
    CFStringRef v22 = +[NSNumber numberWithLong:v13];
    v37[0] = v22;
    __int16 v23 = +[CHTransaction toString:1];
    v36[1] = v23;
    id v24 = +[NSNumber numberWithLong:v14];
    v37[1] = v24;
    v25 = +[CHTransaction toString:2];
    v36[2] = v25;
    v26 = +[NSNumber numberWithLong:v15];
    v37[2] = v26;
    v27 = +[CHTransaction toString:3];
    v36[3] = v27;
    v28 = +[NSNumber numberWithLong:v16];
    v37[3] = v28;
    v19 = +[NSDictionary dictionaryWithObjects:v37 forKeys:v36 count:4];

    id v7 = v30;
    id v6 = v31;
  }
  else
  {
    id v10 = [(MergeTransactions *)self logHandle];
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "No remote transactions", buf, 2u);
    }
    v19 = 0;
  }

  return v19;
}

- (id)filterRemoteTransactions:(id)a3 withLocalTransactions:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(MergeTransactions *)self logHandle];
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    id v19 = [v6 count];
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Filtering %lu remote transactions with local data store", buf, 0xCu);
  }

  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_100013318;
  v15[3] = &unk_100049498;
  v15[4] = self;
  id v16 = v7;
  id v9 = (id)objc_opt_new();
  id v17 = v9;
  id v10 = v7;
  id v11 = +[NSPredicate predicateWithBlock:v15];
  id v12 = [v6 filteredArrayUsingPredicate:v11];

  [v9 addObjectsFromArray:v12];
  id v13 = v9;

  return v13;
}

- (id)unarchiveCallObject:(id)a3
{
  id v3 = a3;
  id v4 = [objc_alloc((Class)NSKeyedUnarchiver) initForReadingFromData:v3 error:0];
  v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:NSKeyedArchiveRootObjectKey];
  [v4 finishDecoding];

  id v6 = v5;
  return v6;
}

- (id)reconcileTransaction:(unint64_t)a3 withLocalCall:(id)a4 withRemoteCall:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  if (+[CHCallFingerprint shouldCall:v9 updateMatchingCall:v8])
  {
    id v10 = [(MergeTransactions *)self logHandle];
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v21 = v8;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "Reconciling %@", buf, 0xCu);
    }

    id v11 = [(MergeTransactions *)self logHandle];
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v21 = v9;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "With remote call %@", buf, 0xCu);
    }

    id v12 = v9;
    if (!a3)
    {
      uint64_t v13 = +[CHCallFingerprint updateCall:v12 withFingerprintedCall:v8];

      id v12 = (id)v13;
    }
    uint64_t v14 = [v8 uniqueId];
    [v12 setUniqueId:v14];

    uint64_t v15 = [(MergeTransactions *)self logHandle];
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v21 = v12;
      _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "Generated reconciled call %@", buf, 0xCu);
    }

    uint64_t v19 = 0;
    id v16 = [v12 archivedDataWithError:&v19];
    id v17 = [objc_alloc((Class)CHTransaction) initWithType:1 andRecord:v16];
  }
  else
  {
    id v17 = 0;
  }

  return v17;
}

- (unint64_t)cloudTransactionCount
{
  return self->_cloudTransactionCount;
}

- (unint64_t)localTransactionCount
{
  return self->_localTransactionCount;
}

- (CallHistoryDBClientHandleProtocol)database
{
  return (CallHistoryDBClientHandleProtocol *)objc_getProperty(self, a2, 40, 1);
}

- (void)setDatabase:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_database, 0);
  objc_storeStrong(&self->_observerRemoteTransactions, 0);
  objc_storeStrong((id *)&self->_applyLocalTransactions, 0);
}

@end