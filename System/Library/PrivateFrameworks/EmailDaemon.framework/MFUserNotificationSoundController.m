@interface MFUserNotificationSoundController
+ (id)log;
- (MFUserNotificationCenterObserver)observer;
- (MFUserNotificationSoundController)initWithUserNotificationCenterObserver:(id)a3;
- (NSMutableArray)pushFetchTimestamps;
- (NSMutableArray)soundsToPlay;
- (_MFMailNotificationSoundControllerAutoFetchData)autoFetchData;
- (unint64_t)autoFetchPushCount;
- (unint64_t)soundsToPlayWaitTimeoutTS;
- (void)_autoFetchFinished:(id)a3;
- (void)_autoFetchJobCompleted:(id)a3;
- (void)_autoFetchPushFinished:(id)a3;
- (void)_autoFetchPushStarted:(id)a3;
- (void)_autoFetchStarted:(id)a3;
- (void)_fetchFinished:(id)a3 timestamp:(unint64_t)a4;
- (void)_fetchJobCompleted:(id)a3 autoFetchData:(id)a4;
- (void)addRemindMeSoundForNotificationContent:(id)a3;
- (void)addSoundIfNecessaryForNotificationContent:(id)a3 suppressionContexts:(id)a4;
- (void)setAutoFetchData:(id)a3;
- (void)setAutoFetchPushCount:(unint64_t)a3;
- (void)setPushFetchTimestamps:(id)a3;
- (void)setSoundsToPlayWaitTimeoutTS:(unint64_t)a3;
@end

@implementation MFUserNotificationSoundController

+ (id)log
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000AC694;
  block[3] = &unk_100139B30;
  block[4] = a1;
  if (qword_10016BD88 != -1) {
    dispatch_once(&qword_10016BD88, block);
  }
  v2 = (void *)qword_10016BD80;

  return v2;
}

- (MFUserNotificationSoundController)initWithUserNotificationCenterObserver:(id)a3
{
  id v5 = a3;
  v20.receiver = self;
  v20.super_class = (Class)MFUserNotificationSoundController;
  v6 = [(MFUserNotificationSoundController *)&v20 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_observer, a3);
    v8 = (NSCondition *)objc_alloc_init((Class)NSCondition);
    fetchSoundDataCondition = v7->_fetchSoundDataCondition;
    v7->_fetchSoundDataCondition = v8;

    v10 = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
    soundsToPlay = v7->_soundsToPlay;
    v7->_soundsToPlay = v10;

    v12 = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
    pushFetchTimestamps = v7->_pushFetchTimestamps;
    v7->_pushFetchTimestamps = v12;

    v14 = +[NSNotificationCenter defaultCenter];
    [v14 addObserver:v7 selector:"_autoFetchStarted:" name:@"AutoFetchProcessStartNotification" object:0];

    v15 = +[NSNotificationCenter defaultCenter];
    [v15 addObserver:v7 selector:"_autoFetchJobCompleted:" name:@"AutoFetchProcessJobCompletedNotification" object:0];

    v16 = +[NSNotificationCenter defaultCenter];
    [v16 addObserver:v7 selector:"_autoFetchFinished:" name:@"AutoFetchProcessFinishedNotification" object:0];

    v17 = +[NSNotificationCenter defaultCenter];
    [v17 addObserver:v7 selector:"_autoFetchPushStarted:" name:@"AutoFetchPushStartedNotification" object:0];

    v18 = +[NSNotificationCenter defaultCenter];
    [v18 addObserver:v7 selector:"_autoFetchPushFinished:" name:@"AutoFetchPushCompletedNotification" object:0];
  }
  return v7;
}

- (void)addSoundIfNecessaryForNotificationContent:(id)a3 suppressionContexts:(id)a4
{
  id v5 = a3;
  double Current = CFAbsoluteTimeGetCurrent();
  [(NSCondition *)self->_fetchSoundDataCondition lock];
  while (1)
  {
    v7 = [(MFUserNotificationSoundController *)self soundsToPlay];
    id v8 = [v7 count];

    if (v8) {
      break;
    }
    v9 = [(MFUserNotificationSoundController *)self autoFetchData];
    if (v9)
    {
    }
    else if (![(MFUserNotificationSoundController *)self autoFetchPushCount])
    {
      int v18 = 0;
      int v29 = 0;
      id v17 = 0;
      goto LABEL_33;
    }
    v10 = MSUserNotificationsLog();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      double v48 = *(double *)&v5;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "Sound Controller: Waiting for sound for notification content %@", buf, 0xCu);
    }

    fetchSoundDataCondition = self->_fetchSoundDataCondition;
    v12 = +[NSDate dateWithTimeIntervalSinceNow:10.0];
    LOBYTE(fetchSoundDataCondition) = [(NSCondition *)fetchSoundDataCondition waitUntilDate:v12];

    if ((fetchSoundDataCondition & 1) == 0)
    {
      v13 = +[EFDevice currentDevice];
      unsigned int v14 = [v13 isInternal];
      if (qword_10016B300 > 0) {
        unsigned int v15 = v14;
      }
      else {
        unsigned int v15 = 0;
      }

      if (v15)
      {
        v16 = MSUserNotificationsLog();
        if (os_log_type_enabled(v16, OS_LOG_TYPE_FAULT)) {
          sub_1000C2960((uint64_t)v5, v16);
        }

        --qword_10016B300;
      }
      id v17 = 0;
      [(MFUserNotificationSoundController *)self setSoundsToPlayWaitTimeoutTS:mach_absolute_time()];
      int v18 = 1;
      goto LABEL_28;
    }
  }
  long long v45 = 0u;
  long long v46 = 0u;
  long long v43 = 0u;
  long long v44 = 0u;
  v19 = [(MFUserNotificationSoundController *)self soundsToPlay];
  objc_super v20 = (char *)[v19 countByEnumeratingWithState:&v43 objects:v59 count:16];
  if (v20)
  {
    v21 = 0;
    uint64_t v22 = *(void *)v44;
LABEL_19:
    uint64_t v23 = 0;
    v41 = v21;
    v42 = &v20[(void)v21];
    while (1)
    {
      if (*(void *)v44 != v22) {
        objc_enumerationMutation(v19);
      }
      v24 = *(void **)(*((void *)&v43 + 1) + 8 * v23);
      v25 = objc_msgSend(v5, "topicIdentifiers", v41);
      v26 = [v24 currentAccountIDOfSoundToPlay];
      unsigned __int8 v27 = [v25 containsObject:v26];

      if (v27) {
        break;
      }
      if (v20 == (char *)++v23)
      {
        objc_super v20 = (char *)[v19 countByEnumeratingWithState:&v43 objects:v59 count:16];
        v21 = v42;
        if (v20) {
          goto LABEL_19;
        }
        goto LABEL_25;
      }
    }
    id v17 = v24;

    if (!v17) {
      goto LABEL_29;
    }
    v28 = [(MFUserNotificationSoundController *)self soundsToPlay];
    [v28 removeObjectAtIndex:&v41[v23]];

    int v18 = 0;
LABEL_28:
    int v29 = 1;
LABEL_33:
    if (v17) {
      int v31 = 1;
    }
    else {
      int v31 = v18;
    }
    if (!v31) {
      id v17 = 0;
    }
    goto LABEL_38;
  }
LABEL_25:

LABEL_29:
  v30 = MSUserNotificationsLog();
  if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    double v48 = *(double *)&v5;
    _os_log_impl((void *)&_mh_execute_header, v30, OS_LOG_TYPE_DEFAULT, "Sound Controller: No sound assigned for notification content %@", buf, 0xCu);
  }

  int v18 = 0;
  id v17 = 0;
  int v29 = 1;
LABEL_38:
  [(NSCondition *)self->_fetchSoundDataCondition unlock];
  v32 = MSUserNotificationsLog();
  if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
  {
    CFAbsoluteTime v33 = CFAbsoluteTimeGetCurrent();
    CFStringRef v34 = &stru_10013ED08;
    *(_DWORD *)buf = 134219266;
    double v48 = v33 - Current;
    CFStringRef v35 = @"timed out";
    if (!v18) {
      CFStringRef v35 = &stru_10013ED08;
    }
    __int16 v49 = 2112;
    id v50 = v5;
    CFStringRef v36 = @", ";
    if ((v18 & v29) == 0) {
      CFStringRef v36 = &stru_10013ED08;
    }
    __int16 v51 = 2112;
    CFStringRef v52 = v35;
    __int16 v53 = 2112;
    if (v29) {
      CFStringRef v34 = @"processing auto-fetch";
    }
    CFStringRef v54 = v36;
    __int16 v55 = 2112;
    CFStringRef v56 = v34;
    __int16 v57 = 2112;
    id v58 = v17;
    _os_log_impl((void *)&_mh_execute_header, v32, OS_LOG_TYPE_DEFAULT, "Sound Controller: took %g seconds to resolve sound for notification content %@ (%@%@%@) autoFetchData=%@", buf, 0x3Eu);
  }

  if (v17)
  {
    v37 = MSUserNotificationsLog();
    if (os_log_type_enabled(v37, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v37, OS_LOG_TYPE_INFO, "Sound Controller: **DING** Auto fetch notification will notify user of new mail.", buf, 2u);
    }

    v38 = +[UNNotificationSound soundWithAlertType:5];
    id v39 = [v38 mutableCopy];

    v40 = [v17 currentAccountIDOfSoundToPlay];
    [v39 setAlertTopic:v40];

    [v5 setSound:v39];
  }
}

- (void)addRemindMeSoundForNotificationContent:(id)a3
{
  id v5 = a3;
  v3 = +[UNNotificationSound soundWithAlertType:11];
  id v4 = [v3 mutableCopy];

  [v4 setAlertTopic:MSUserNotificationCenterTopicVIP];
  [v5 setSound:v4];
}

- (void)_autoFetchStarted:(id)a3
{
  id v4 = +[MFUserNotificationSoundController log];
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG)) {
    sub_1000C29E4();
  }

  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_1000AD0C4;
  v6[3] = &unk_100139C48;
  v6[4] = self;
  id v5 = +[EFScheduler mainThreadScheduler];
  [v5 performBlock:v6];
}

- (void)_fetchJobCompleted:(id)a3 autoFetchData:(id)a4
{
  id v20 = a4;
  v6 = [a3 userInfo];
  v7 = [v6 objectForKeyedSubscript:@"AutoFetchJobNewMessagesState"];
  id v8 = [v7 unsignedIntegerValue];

  if (v8)
  {
    v9 = [v6 objectForKeyedSubscript:@"AutoFetchJobAccount"];
    v10 = [v20 currentAccountIDOfSoundToPlay];

    if (!v10)
    {
      v11 = [v9 uniqueID];
      [v20 setCurrentAccountIDOfSoundToPlay:v11];
    }
    v12 = [v6 objectForKeyedSubscript:@"AutoFetchJobMailboxUid"];
    [v20 setMailbox:v12];
    id v13 = [v12 type];
    id v14 = [v20 loudestState];
    unint64_t v15 = 4;
    if (v13 == (id)7) {
      unint64_t v15 = (unint64_t)v8;
    }
    if ((unint64_t)v14 <= v15) {
      id v16 = (id)v15;
    }
    else {
      id v16 = v14;
    }
    [v20 setLoudestState:v16];
    id v17 = [(MFUserNotificationSoundController *)self observer];
    int v18 = [v9 uniqueID];
    unsigned int v19 = [v17 isObservingMailbox:v12 inAccountID:v18];

    if (v19) {
      [v20 setNotificationExpectedFromFetch:1];
    }
  }
}

- (void)_autoFetchJobCompleted:(id)a3
{
  id v4 = a3;
  id v5 = +[MFUserNotificationSoundController log];
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
    sub_1000C2A5C();
  }

  v9 = self;
  id v6 = v4;
  id v10 = v6;
  v7 = +[EFScheduler mainThreadScheduler];
  [v7 performBlock:&v8];
}

- (void)_fetchFinished:(id)a3 timestamp:(unint64_t)a4
{
  id v6 = a3;
  if (![v6 loudestState]) {
    goto LABEL_22;
  }
  if ([v6 notificationExpectedFromFetch])
  {
    if ([v6 loudestState] == (id)3)
    {
      v7 = &MSUserNotificationCenterTopicNotifiedThreads;
    }
    else if ([v6 loudestState] == (id)2)
    {
      v7 = &MSUserNotificationCenterTopicVIP;
    }
    else
    {
      if ([v6 loudestState] != (id)4)
      {
LABEL_13:
        id v16 = MFAutoFetchLog();
        if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)v21 = 0;
          _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_INFO, "Sound Controller: Push fetch saving notification of new mail.", v21, 2u);
        }

        if ([(MFUserNotificationSoundController *)self soundsToPlayWaitTimeoutTS] < a4)
        {
          [(NSCondition *)self->_fetchSoundDataCondition lock];
          id v17 = [(MFUserNotificationSoundController *)self soundsToPlay];
          [v17 addObject:v6];

          [(NSCondition *)self->_fetchSoundDataCondition signal];
          [(NSCondition *)self->_fetchSoundDataCondition unlock];
        }
        goto LABEL_22;
      }
      v7 = &MSUserNotificationCenterTopicFavoriteMailboxes;
    }
    [v6 setCurrentAccountIDOfSoundToPlay:*v7];
    goto LABEL_13;
  }
  uint64_t v8 = [v6 mailbox];
  v9 = [v8 URLString];

  if (v9)
  {
    id v10 = objc_alloc((Class)NSMutableDictionary);
    v22[0] = MSNewNotificationSoundKeySuppressionContexts;
    v11 = +[NSSet setWithObject:v9];
    v23[0] = v11;
    v22[1] = MSNewNotificationSoundKeyLoudestState;
    v12 = +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", [v6 loudestState]);
    v23[1] = v12;
    id v13 = +[NSDictionary dictionaryWithObjects:v23 forKeys:v22 count:2];
    id v14 = [v10 initWithDictionary:v13];

    unint64_t v15 = [v6 currentAccountIDOfSoundToPlay];
    if (v15)
    {
      [v14 setObject:v15 forKeyedSubscript:MSNewNotificationSoundKeyAccountIDOfSoundToPlay];
    }
    else
    {
      int v18 = MFAutoFetchLog();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR)) {
        sub_1000C2AD4((uint64_t)v6, v18);
      }
    }
    unsigned int v19 = +[NSNotificationCenter defaultCenter];
    id v20 = [v14 copy];
    [v19 postNotificationName:MSNewNotificationSound object:self userInfo:v20];
  }
LABEL_22:
}

- (void)_autoFetchFinished:(id)a3
{
  id v4 = +[MFUserNotificationSoundController log];
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG)) {
    sub_1000C2B4C();
  }

  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_1000AD940;
  v6[3] = &unk_100139C48;
  v6[4] = self;
  id v5 = +[EFScheduler mainThreadScheduler];
  [v5 performBlock:v6];
}

- (void)_autoFetchPushStarted:(id)a3
{
  id v4 = a3;
  id v5 = +[MFUserNotificationSoundController log];
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
    sub_1000C2BC4();
  }

  id v6 = v4;
  id v9 = v6;
  id v10 = self;
  v7 = +[EFScheduler mainThreadScheduler];
  [v7 performBlock:&v8];
}

- (void)_autoFetchPushFinished:(id)a3
{
  id v4 = a3;
  id v5 = +[MFUserNotificationSoundController log];
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
    sub_1000C2C3C();
  }

  id v6 = v4;
  id v9 = v6;
  id v10 = self;
  v7 = +[EFScheduler mainThreadScheduler];
  [v7 performBlock:&v8];
}

- (MFUserNotificationCenterObserver)observer
{
  return self->_observer;
}

- (NSMutableArray)soundsToPlay
{
  return self->_soundsToPlay;
}

- (_MFMailNotificationSoundControllerAutoFetchData)autoFetchData
{
  return (_MFMailNotificationSoundControllerAutoFetchData *)objc_getProperty(self, a2, 32, 1);
}

- (void)setAutoFetchData:(id)a3
{
}

- (unint64_t)autoFetchPushCount
{
  return self->_autoFetchPushCount;
}

- (void)setAutoFetchPushCount:(unint64_t)a3
{
  self->_autoFetchPushCount = a3;
}

- (unint64_t)soundsToPlayWaitTimeoutTS
{
  return self->_soundsToPlayWaitTimeoutTS;
}

- (void)setSoundsToPlayWaitTimeoutTS:(unint64_t)a3
{
  self->_soundsToPlayWaitTimeoutTS = a3;
}

- (NSMutableArray)pushFetchTimestamps
{
  return self->_pushFetchTimestamps;
}

- (void)setPushFetchTimestamps:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pushFetchTimestamps, 0);
  objc_storeStrong((id *)&self->_autoFetchData, 0);
  objc_storeStrong((id *)&self->_soundsToPlay, 0);
  objc_storeStrong((id *)&self->_observer, 0);

  objc_storeStrong((id *)&self->_fetchSoundDataCondition, 0);
}

@end