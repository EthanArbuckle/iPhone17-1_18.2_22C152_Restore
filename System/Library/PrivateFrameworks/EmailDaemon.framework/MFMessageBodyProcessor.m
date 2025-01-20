@interface MFMessageBodyProcessor
+ (id)powernapProcessor;
+ (void)initialize;
- (BOOL)_shouldContinueProcessing;
- (BOOL)runSynchronously;
- (BOOL)runSynchronouslyWithDuration:(int64_t)a3;
- (MFAccountsProvider)accountsProvider;
- (MFActivityCondition)condition;
- (MFDeviceStorage)deviceStorage;
- (MFMessageBodyProcessor)initWithName:(id)a3 accountsProvider:(id)a4 deviceStorage:(id)a5 condition:(id)a6;
- (MailPersistentStorage)persistentStorage;
- (NSArray)excludedMailboxTypes;
- (NSDate)stopDate;
- (NSString)name;
- (OS_os_activity)loggingActivity;
- (id)_mailboxesToDownload;
- (int64_t)accountMailboxesBatchSize;
- (int64_t)lastFetchDateCutoff;
- (int64_t)mailboxMessagesBatchSize;
- (void)_runSynchronously;
- (void)runWithCompletion:(id)a3;
- (void)setAccountMailboxesBatchSize:(int64_t)a3;
- (void)setExcludedMailboxTypes:(id)a3;
- (void)setLastFetchDateCutoff:(int64_t)a3;
- (void)setMailboxMessagesBatchSize:(int64_t)a3;
- (void)setStopDate:(id)a3;
@end

@implementation MFMessageBodyProcessor

+ (void)initialize
{
  if ((id)objc_opt_class() == a1)
  {
    id v2 = objc_alloc_init((Class)NSMutableSet);
    v3 = (void *)qword_10016BBB0;
    qword_10016BBB0 = (uint64_t)v2;
  }
}

+ (id)powernapProcessor
{
  id v2 = objc_alloc_init(MFMailDeviceStorage);
  id v3 = [objc_alloc((Class)MFActivityCondition) initWithBuilder:&stru_10013C870];
  v4 = [MFMessageBodyProcessor alloc];
  v5 = +[DaemonAppController sharedController];
  v6 = [v5 accountsProvider];

  v7 = [(MFMessageBodyProcessor *)v4 initWithName:@"com.apple.mobilemail.body.powernap" accountsProvider:v6 deviceStorage:v2 condition:v3];
  [(MFMessageBodyProcessor *)v7 setExcludedMailboxTypes:&off_100146580];
  [(MFMessageBodyProcessor *)v7 setLastFetchDateCutoff:900];
  [(MFMessageBodyProcessor *)v7 setAccountMailboxesBatchSize:4];
  [(MFMessageBodyProcessor *)v7 setMailboxMessagesBatchSize:50];

  return v7;
}

- (MFMessageBodyProcessor)initWithName:(id)a3 accountsProvider:(id)a4 deviceStorage:(id)a5 condition:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  v22.receiver = self;
  v22.super_class = (Class)MFMessageBodyProcessor;
  v14 = [(MFMessageBodyProcessor *)&v22 init];
  if (v14)
  {
    v15 = (NSString *)[v10 copy];
    name = v14->_name;
    v14->_name = v15;

    objc_storeStrong((id *)&v14->_accountsProvider, a4);
    objc_storeStrong((id *)&v14->_deviceStorage, a5);
    if (v13)
    {
      v17 = (MFActivityCondition *)v13;
    }
    else
    {
      v17 = +[MFActivityCondition alwaysSatisfiedCondition];
    }
    condition = v14->_condition;
    v14->_condition = v17;

    os_activity_t v19 = _os_activity_create((void *)&_mh_execute_header, "BodyProcessor", (os_activity_t)&_os_activity_none, OS_ACTIVITY_FLAG_DEFAULT);
    loggingActivity = v14->_loggingActivity;
    v14->_loggingActivity = (OS_os_activity *)v19;
  }
  return v14;
}

- (BOOL)runSynchronously
{
  return [(MFMessageBodyProcessor *)self runSynchronouslyWithDuration:-1];
}

- (BOOL)runSynchronouslyWithDuration:(int64_t)a3
{
  if (a3 == -1)
  {
    v8 = 0;
  }
  else
  {
    id v5 = objc_alloc_init((Class)NSDateComponents);
    [v5 setSecond:a3];
    v6 = +[NSCalendar currentCalendar];
    v7 = +[NSDate date];
    v8 = [v6 dateByAddingComponents:v5 toDate:v7 options:0];
  }
  [(MFMessageBodyProcessor *)self setStopDate:v8];

  state.opaque[0] = 0xAAAAAAAAAAAAAAAALL;
  state.opaque[1] = 0xAAAAAAAAAAAAAAAALL;
  v9 = [(MFMessageBodyProcessor *)self loggingActivity];
  os_activity_scope_enter(v9, &state);

  id v10 = (id)qword_10016BBB0;
  objc_sync_enter(v10);
  id v11 = (void *)qword_10016BBB0;
  id v12 = [(MFMessageBodyProcessor *)self name];
  unsigned __int8 v13 = [v11 containsObject:v12];

  if (v13)
  {
    objc_sync_exit(v10);

    v14 = MFLogGeneral();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      v15 = [(MFMessageBodyProcessor *)self name];
      *(_DWORD *)buf = 138412290;
      v37 = v15;
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "#MessageBodyProcessor Canceling body-backfill download %@ because one with the same name is currently running", buf, 0xCu);
    }
  }
  else
  {
    v16 = (void *)qword_10016BBB0;
    v17 = [(MFMessageBodyProcessor *)self name];
    [v16 addObject:v17];

    objc_sync_exit(v10);
    v18 = MFLogGeneral();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      os_activity_t v19 = [(MFMessageBodyProcessor *)self name];
      *(_DWORD *)buf = 138412290;
      v37 = v19;
      _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "#MessageBodyProcessor Starting body-backfill download %@", buf, 0xCu);
    }
    v31[0] = _NSConcreteStackBlock;
    v31[1] = 3221225472;
    v32 = sub_100079634;
    v33 = &unk_100139C48;
    v34 = self;
    v20 = v31;
    uint64_t v21 = mach_absolute_time();
    v32((uint64_t)v20);
    uint64_t v22 = mach_absolute_time();
    if (qword_10016BBC0 != -1) {
      dispatch_once(&qword_10016BBC0, &stru_10013C890);
    }
    uint64_t v24 = dword_10016BBB8;
    unint64_t v23 = *(unsigned int *)algn_10016BBBC;

    v25 = MFLogGeneral();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
    {
      v26 = [(MFMessageBodyProcessor *)self name];
      *(_DWORD *)buf = 138412546;
      v37 = v26;
      __int16 v38 = 2048;
      double v39 = (double)((v22 - v21) * v24 / v23) / 1000000000.0;
      _os_log_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_DEFAULT, "#MessageBodyProcessor Finished body download %@ (Duration: %.2fs)", buf, 0x16u);
    }
    id v27 = (id)qword_10016BBB0;
    objc_sync_enter(v27);
    v28 = (void *)qword_10016BBB0;
    v29 = [(MFMessageBodyProcessor *)self name];
    [v28 removeObject:v29];

    objc_sync_exit(v27);
    os_activity_scope_leave(&state);
  }
  return v13 ^ 1;
}

- (void)runWithCompletion:(id)a3
{
  id v5 = (void (**)(id, BOOL, void))a3;
  BOOL v4 = [(MFMessageBodyProcessor *)self runSynchronously];
  if (v5) {
    v5[2](v5, v4, 0);
  }
}

- (MailPersistentStorage)persistentStorage
{
  return (MailPersistentStorage *)+[MailPersistentStorage sharedStorage];
}

- (void)_runSynchronously
{
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  id obj = [(MFMessageBodyProcessor *)self _mailboxesToDownload];
  id v3 = [obj countByEnumeratingWithState:&v19 objects:v25 count:16];
  if (v3)
  {
    uint64_t v5 = *(void *)v20;
    *(void *)&long long v4 = 138412290;
    long long v17 = v4;
    while (2)
    {
      for (i = 0; i != v3; i = (char *)i + 1)
      {
        if (*(void *)v20 != v5) {
          objc_enumerationMutation(obj);
        }
        v7 = *(void **)(*((void *)&v19 + 1) + 8 * i);
        if (![(MFMessageBodyProcessor *)self _shouldContinueProcessing])
        {
          v16 = MFLogGeneral();
          if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)buf = 0;
            _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "#MessageBodyProcessor Stopping body-backfill download because requirements are no longer met", buf, 2u);
          }

          goto LABEL_15;
        }
        v8 = MFLogGeneral();
        if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = v17;
          uint64_t v24 = v7;
          _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "#MessageBodyProcessor Begin processing mailbox: %@", buf, 0xCu);
        }

        v9 = [MFMailboxMessageBodyProcessor alloc];
        int64_t v10 = [(MFMessageBodyProcessor *)self mailboxMessagesBatchSize];
        id v11 = [(MFMessageBodyProcessor *)self deviceStorage];
        id v12 = [(MFMailboxMessageBodyProcessor *)v9 initWithMailbox:v7 batchSize:v10 deviceStorage:v11];

        [(MFMailboxMessageBodyProcessor *)v12 setDelegate:self];
        [(MFMailboxMessageBodyProcessor *)v12 runSynchronously];
        unsigned __int8 v13 = [(MFMessageBodyProcessor *)self persistentStorage];
        v14 = +[NSDate date];
        v15 = [v7 URLString];
        [v13 setBodyBackfillDate:v14 forSource:v15];
      }
      id v3 = [obj countByEnumeratingWithState:&v19 objects:v25 count:16];
      if (v3) {
        continue;
      }
      break;
    }
  }
LABEL_15:
}

- (BOOL)_shouldContinueProcessing
{
  id v3 = [(MFMessageBodyProcessor *)self condition];
  unsigned __int8 v4 = [v3 isSatisfied];

  uint64_t v5 = [(MFMessageBodyProcessor *)self stopDate];
  if (v5)
  {
    v6 = +[NSDate date];
    unsigned __int8 v7 = objc_msgSend(v6, "ef_isEarlierThanDate:", v5);
  }
  else
  {
    unsigned __int8 v7 = 1;
  }
  v8 = MFLogGeneral();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    v9 = NSStringFromBOOL();
    int64_t v10 = NSStringFromBOOL();
    int v12 = 138412802;
    unsigned __int8 v13 = v9;
    __int16 v14 = 2112;
    v15 = v10;
    __int16 v16 = 2112;
    long long v17 = v5;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "#MessageBodyProcessor Should continue: conditions: %@ | time budget: %@ (stop by %@)", (uint8_t *)&v12, 0x20u);
  }
  return v4 & v7;
}

- (id)_mailboxesToDownload
{
  long long v22 = +[NSMutableArray array];
  id v3 = +[NSDate dateWithTimeIntervalSinceNow:(double)-self->_lastFetchDateCutoff];
  long long v27 = 0u;
  long long v28 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  unsigned __int8 v4 = [(MFMessageBodyProcessor *)self accountsProvider];
  uint64_t v5 = [v4 autofetchAccounts];

  id obj = v5;
  id v6 = [v5 countByEnumeratingWithState:&v25 objects:v29 count:16];
  if (v6)
  {
    uint64_t v7 = *(void *)v26;
    do
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v26 != v7) {
          objc_enumerationMutation(obj);
        }
        v9 = *(void **)(*((void *)&v25 + 1) + 8 * i);
        int64_t v10 = [v9 allMailboxUids];
        id v11 = +[NSMutableSet setWithArray:v10];

        v23[0] = _NSConcreteStackBlock;
        v23[1] = 3221225472;
        v23[2] = sub_100079E68;
        v23[3] = &unk_10013C2C0;
        v23[4] = self;
        v23[5] = v9;
        id v24 = v3;
        int v12 = [v11 objectsPassingTest:v23];
        [v11 minusSet:v12];

        int64_t v13 = [(MFMessageBodyProcessor *)self accountMailboxesBatchSize];
        signed int v14 = [v11 count];
        v15 = [v11 allObjects];
        __int16 v16 = v15;
        if (v13 >= v14) {
          int64_t v17 = v14;
        }
        else {
          int64_t v17 = v13;
        }
        v18 = objc_msgSend(v15, "subarrayWithRange:", 0, v17);

        [v22 addObjectsFromArray:v18];
      }
      id v6 = [obj countByEnumeratingWithState:&v25 objects:v29 count:16];
    }
    while (v6);
  }

  long long v19 = [v22 sortedArrayUsingComparator:&stru_10013C850];

  return v19;
}

- (NSString)name
{
  return self->_name;
}

- (MFAccountsProvider)accountsProvider
{
  return self->_accountsProvider;
}

- (MFDeviceStorage)deviceStorage
{
  return self->_deviceStorage;
}

- (MFActivityCondition)condition
{
  return self->_condition;
}

- (OS_os_activity)loggingActivity
{
  return self->_loggingActivity;
}

- (NSArray)excludedMailboxTypes
{
  return self->_excludedMailboxTypes;
}

- (void)setExcludedMailboxTypes:(id)a3
{
}

- (int64_t)lastFetchDateCutoff
{
  return self->_lastFetchDateCutoff;
}

- (void)setLastFetchDateCutoff:(int64_t)a3
{
  self->_lastFetchDateCutoff = a3;
}

- (int64_t)accountMailboxesBatchSize
{
  return self->_accountMailboxesBatchSize;
}

- (void)setAccountMailboxesBatchSize:(int64_t)a3
{
  self->_accountMailboxesBatchSize = a3;
}

- (int64_t)mailboxMessagesBatchSize
{
  return self->_mailboxMessagesBatchSize;
}

- (void)setMailboxMessagesBatchSize:(int64_t)a3
{
  self->_mailboxMessagesBatchSize = a3;
}

- (NSDate)stopDate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_stopDate);

  return (NSDate *)WeakRetained;
}

- (void)setStopDate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_stopDate);
  objc_storeStrong((id *)&self->_excludedMailboxTypes, 0);
  objc_storeStrong((id *)&self->_loggingActivity, 0);
  objc_storeStrong((id *)&self->_condition, 0);
  objc_storeStrong((id *)&self->_deviceStorage, 0);
  objc_storeStrong((id *)&self->_accountsProvider, 0);

  objc_storeStrong((id *)&self->_name, 0);
}

@end