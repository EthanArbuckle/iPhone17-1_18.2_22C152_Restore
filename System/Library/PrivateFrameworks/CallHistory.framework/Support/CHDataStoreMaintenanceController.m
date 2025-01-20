@interface CHDataStoreMaintenanceController
- (CHConfiguration)configuration;
- (CHDataStoreMaintenanceController)initWithDataStore:(id)a3 configuration:(id)a4;
- (CallHistoryDBClientHandle)dataStore;
- (void)removeCalls;
@end

@implementation CHDataStoreMaintenanceController

- (CHDataStoreMaintenanceController)initWithDataStore:(id)a3 configuration:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v15.receiver = self;
  v15.super_class = (Class)CHDataStoreMaintenanceController;
  v9 = [(CHDataStoreMaintenanceController *)&v15 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_configuration, a4);
    objc_storeStrong((id *)&v10->_dataStore, a3);
    objc_initWeak(&location, v10);
    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472;
    v12[2] = sub_1000105D4;
    v12[3] = &unk_1000491D0;
    objc_copyWeak(&v13, &location);
    xpc_activity_register("com.apple.callhistory.datastore.maintenance.daily", XPC_ACTIVITY_CHECK_IN, v12);
    objc_destroyWeak(&v13);
    objc_destroyWeak(&location);
  }

  return v10;
}

- (void)removeCalls
{
  v3 = [(CHDataStoreMaintenanceController *)self configuration];
  id v4 = [v3 keepCallsTimeIntervalType];

  if (v4 == (id)2)
  {
    id v5 = objc_alloc_init((Class)NSDateComponents);
    [v5 setDay:-30];
    if (!v5) {
      return;
    }
LABEL_6:
    v6 = +[NSCalendar calendarWithIdentifier:NSCalendarIdentifierGregorian];
    id v7 = +[NSDate date];
    id v8 = [v6 dateByAddingComponents:v5 toDate:v7 options:4096];

    v9 = +[CHRecentCall predicateForCallsLessThanDate:v8];
    v10 = [(CHDataStoreMaintenanceController *)self dataStore];
    uint64_t v11 = (uint64_t)[v10 deleteCallsWithPredicate:v9];
    if (v11 < 1)
    {
      v14 = 0;
    }
    else
    {
      id v19 = 0;
      unsigned int v12 = [v10 saveDatabase:&v19];
      id v13 = v19;
      v14 = v13;
      if (v11 == 0x7FFFFFFFFFFFFFFFLL || v12 == 0)
      {
        if (!v13)
        {
LABEL_19:

          return;
        }
        v16 = +[CHLogServer sharedInstance];
        v17 = [v16 logHandleForDomain:"CHDataStoreMaintenanceController"];

        if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
          sub_10002E950((uint64_t)v14, v17);
        }
LABEL_18:

        goto LABEL_19;
      }
    }
    v18 = +[CHLogServer sharedInstance];
    v17 = [v18 logHandleForDomain:"CHDataStoreMaintenanceController"];

    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134217984;
      uint64_t v21 = v11;
      _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "Data store maintenance removed %ld calls", buf, 0xCu);
    }
    goto LABEL_18;
  }
  if (v4 == (id)1)
  {
    id v5 = objc_alloc_init((Class)NSDateComponents);
    [v5 setYear:-1];
    if (v5) {
      goto LABEL_6;
    }
  }
}

- (CHConfiguration)configuration
{
  return self->_configuration;
}

- (CallHistoryDBClientHandle)dataStore
{
  return self->_dataStore;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dataStore, 0);
  objc_storeStrong((id *)&self->_configuration, 0);
}

@end