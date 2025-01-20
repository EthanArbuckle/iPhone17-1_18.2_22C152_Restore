@interface PDBiomeClient
- (BOOL)checkScheduledTask:(id)a3 completionType:(int64_t)a4;
- (BOOL)scheduleHalfWayNotificationIfNeeded:(id)a3 appUsage:(id)a4 isTryAgain:(BOOL)a5 tryAgainDate:(id)a6;
- (BOOL)scheduleMarkDoneIfNeeded:(id)a3 appUsage:(id)a4 isTryAgain:(BOOL)a5 tryAgainDate:(id)a6;
- (BOOL)triggerScheduledTask:(int64_t)a3 targetInterval:(double)a4;
- (PDBiomeClient)init;
- (PDDatabase)database;
- (double)calculateDelta:(id)a3 usage:(id)a4 completionType:(int64_t)a5 isTryAgain:(BOOL)a6 tryAgainDate:(id)a7;
- (double)calculateDeltaOnAppClose:(id)a3 endDate:(id)a4 attachment:(id)a5 tryAgainDate:(id)a6 database:(id)a7 markDone:(BOOL *)a8;
- (double)rescheduleActivityDoneTimer:(double)a3 attachment:(id)a4 tryAgainDate:(id)a5;
- (double)rescheduleHalfWayTimer:(double)a3 attachment:(id)a4 tryAgainDate:(id)a5;
- (id)localizedTimeInterval:(double)a3 calendar:(id)a4;
- (id)tryAgainDateFromCollaborationState:(id)a3;
- (int64_t)biomeSubscriptionStatus;
- (void)attachmentWillChange:(id)a3;
- (void)cancelSubscription;
- (void)cleanUpScheduledTaskTriggers:(int64_t)a3;
- (void)createScheduleTasks:(id)a3;
- (void)generateTimeIntervalForActivity:(id)a3 startDate:(id)a4 interval:(double)a5;
- (void)handleTimeExpectationReached:(id)a3 appUsage:(id)a4 interval:(double)a5;
- (void)markDone:(id)a3 then:(id)a4;
- (void)presentAppBasedAssignmentCompletedBanner:(id)a3;
- (void)presentHalfWayCompletedBanner:(id)a3;
- (void)presentProgressBannerWithAttachmentID:(id)a3;
- (void)rescheduleTask:(int64_t)a3 current:(id)a4 targetDate:(id)a5;
- (void)scheduleActivityDone:(id)a3 appUsage:(id)a4 timeInterval:(double)a5 saveTrigger:(BOOL)a6;
- (void)scheduleHalfWayDoneNotification:(double)a3 attachmentID:(id)a4 saveTrigger:(BOOL)a5;
- (void)setDatabase:(id)a3;
- (void)startSubscription;
- (void)updateAppBasedUsageIfNeeded:(id)a3 isStarting:(BOOL)a4 currentTimeStamp:(id)a5;
@end

@implementation PDBiomeClient

- (PDBiomeClient)init
{
  v21.receiver = self;
  v21.super_class = (Class)PDBiomeClient;
  v2 = [(PDBiomeClient *)&v21 init];
  if (v2)
  {
    v3 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v4 = dispatch_queue_create("com.apple.progressd.Biome.queue", v3);
    biomeQueue = v2->_biomeQueue;
    v2->_biomeQueue = (OS_dispatch_queue *)v4;

    dispatch_queue_t v6 = dispatch_queue_create("com.apple.progressd.schedulerQ", 0);
    taskQueue = v2->_taskQueue;
    v2->_taskQueue = (OS_dispatch_queue *)v6;

    v8 = (objc_class *)objc_opt_class();
    v9 = NSStringFromClass(v8);
    uint64_t v10 = +[NSString stringWithFormat:@"com.apple.progressd.allDoneTask.%@", v9];
    scheduleMarkDoneTaskID = v2->_scheduleMarkDoneTaskID;
    v2->_scheduleMarkDoneTaskID = (NSString *)v10;

    v12 = (objc_class *)objc_opt_class();
    v13 = NSStringFromClass(v12);
    uint64_t v14 = +[NSString stringWithFormat:@"com.apple.progressd.halfDoneTask.%@", v13];
    scheduleHalfDoneTaskID = v2->_scheduleHalfDoneTaskID;
    v2->_scheduleHalfDoneTaskID = (NSString *)v14;

    uint64_t v16 = objc_opt_new();
    bannerTimerMap = v2->_bannerTimerMap;
    v2->_bannerTimerMap = (NSMutableDictionary *)v16;

    currentAttachmentID = v2->_currentAttachmentID;
    v2->_currentAttachmentID = 0;

    v19 = +[NSNotificationCenter defaultCenter];
    [v19 addObserver:v2 selector:"attachmentWillChange:" name:@"PDDatabaseEntityAttachmentWillChangeNotification" object:0];
  }
  return v2;
}

- (void)cancelSubscription
{
  CLSInitLog();
  v3 = CLSLogDefault;
  if (os_log_type_enabled(CLSLogDefault, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)dispatch_queue_t v4 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Stop Biome subscription", v4, 2u);
  }
  [(BPSSink *)self->_sink cancel];
}

- (void)startSubscription
{
  CLSInitLog();
  v3 = CLSLogDefault;
  if (os_log_type_enabled(CLSLogDefault, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Start Biome subscription", buf, 2u);
  }
  id v4 = [objc_alloc((Class)BMBiomeScheduler) initWithIdentifier:@"com.apple.progressd.Biome" targetQueue:self->_biomeQueue];
  v5 = BiomeLibrary();
  dispatch_queue_t v6 = [v5 App];
  v7 = [v6 InFocus];
  v8 = [v7 DSLPublisher];
  v9 = [v8 subscribeOn:v4];
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_10009C914;
  v12[3] = &unk_1001F3B10;
  v12[4] = self;
  uint64_t v10 = [v9 sinkWithCompletion:&stru_1001F3AE8 receiveInput:v12];
  sink = self->_sink;
  self->_sink = v10;
}

- (int64_t)biomeSubscriptionStatus
{
  int64_t result = (int64_t)self->_sink;
  if (result)
  {
    v3 = [(id)result status];
    id v4 = [v3 state];

    if ((unint64_t)v4 < 3) {
      return (int64_t)v4 + 1;
    }
    else {
      return 0;
    }
  }
  return result;
}

- (void)updateAppBasedUsageIfNeeded:(id)a3 isStarting:(BOOL)a4 currentTimeStamp:(id)a5
{
  BOOL v6 = a4;
  unint64_t v8 = (unint64_t)a3;
  id v9 = a5;
  uint64_t v10 = [(PDBiomeClient *)self database];
  v11 = v10;
  if (!v10 || (sub_100004B84(v10) & 2) == 0)
  {
    uint64_t v12 = sub_10007CA10(v11, (void *)v8);
    uint64_t v13 = v12;
    if (v6)
    {
      if (v12)
      {
        id v14 = *(id *)(v12 + 16);
        v15 = sub_10007CAF0(v11, v14);

        unint64_t v16 = (unint64_t)*(id *)(v13 + 32);
        if (v8 | v16)
        {
          v17 = (void *)v16;
          id v18 = *(id *)(v13 + 32);
          v19 = v18;
          if (v8 && v18)
          {
            id v20 = *(id *)(v13 + 32);
            if ([v20 isEqualToString:v8])
            {
              BOOL v57 = sub_10007CFD8(v11, v15);

              if (!v57) {
                goto LABEL_40;
              }
              goto LABEL_29;
            }
          }
        }
        else if (sub_10007CFD8(v11, v15))
        {
LABEL_29:
          CLSInitLog();
          v37 = CLSLogDefault;
          if (os_log_type_enabled(CLSLogDefault, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412290;
            unint64_t v64 = v8;
            _os_log_impl((void *)&_mh_execute_header, v37, OS_LOG_TYPE_DEFAULT, "Start tracking progress for app with bundleID: %@", buf, 0xCu);
          }
LABEL_31:
          objc_storeStrong((id *)(v13 + 40), a5);
          [v11 insertOrUpdateObject:v13];
          [(PDBiomeClient *)self createScheduleTasks:v13];
          id v38 = *(id *)(v13 + 16);
          v39 = sub_10007CAF0(v11, v38);

          if (v39)
          {
            objc_storeStrong((id *)&self->_currentAttachmentID, v39);
            [(PDBiomeClient *)self presentProgressBannerWithAttachmentID:v39];
          }
        }
LABEL_40:

        goto LABEL_41;
      }
      uint64_t v34 = sub_10007C7F4(v11, (void *)v8);
      uint64_t v13 = v34;
      if (v34 && sub_10007C704(v34) && !*(unsigned char *)(v13 + 9))
      {
        id v35 = *(id *)(v13 + 16);
        v15 = sub_10007CAF0(v11, v35);

        if (sub_10007CFD8(v11, v15))
        {
          CLSInitLog();
          v36 = CLSLogDefault;
          if (os_log_type_enabled(CLSLogDefault, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412290;
            unint64_t v64 = v8;
            _os_log_impl((void *)&_mh_execute_header, v36, OS_LOG_TYPE_DEFAULT, "Resume progress tracking for app with bundleID: %@", buf, 0xCu);
          }
          *(unsigned char *)(v13 + 8) = 1;
          goto LABEL_31;
        }
        goto LABEL_40;
      }
    }
    else if (v12)
    {
      unint64_t v21 = (unint64_t)*(id *)(v12 + 32);
      if (v8 | v21)
      {
        v40 = (void *)v21;
        id v41 = *(id *)(v13 + 32);
        v42 = v41;
        if (!v8 || !v41)
        {

          goto LABEL_39;
        }
        id v43 = *(id *)(v13 + 32);
        unsigned int v44 = [v43 isEqualToString:v8];

        if (!v44) {
          goto LABEL_39;
        }
      }
      CLSInitLog();
      v22 = CLSLogDefault;
      if (os_log_type_enabled(CLSLogDefault, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        unint64_t v64 = v8;
        _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_DEFAULT, "Terminate progress tracking for app with bundleID: %@", buf, 0xCu);
      }
      currentAttachmentID = self->_currentAttachmentID;
      self->_currentAttachmentID = 0;

      *(unsigned char *)(v13 + 8) = 0;
      objc_storeStrong((id *)(v13 + 48), a5);
      [v11 insertOrUpdateObject:v13];
      v24 = sub_1000637B8();
      sub_100063984(v24, self->_scheduleHalfDoneTaskID);

      v25 = sub_1000637B8();
      sub_100063984(v25, self->_scheduleMarkDoneTaskID);

      [(PDBiomeClient *)self cleanUpScheduledTaskTriggers:1];
      [(PDBiomeClient *)self cleanUpScheduledTaskTriggers:2];
      id v26 = *(id *)(v13 + 16);
      v15 = sub_10007CAF0(v11, v26);

      if (sub_10007CFD8(v11, v15))
      {
        [v11 select:objc_opt_class() identity:v15];
        v58 = id v62 = 0;
        unsigned int v27 = sub_100156F98(v11, v58, &v62);
        id v28 = v62;
        if (v28)
        {
          CLSInitLog();
          v29 = CLSLogDefault;
          if (os_log_type_enabled(CLSLogDefault, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138412290;
            unint64_t v64 = (unint64_t)v28;
            _os_log_error_impl((void *)&_mh_execute_header, v29, OS_LOG_TYPE_ERROR, "Failed to query attachment state, error: %@", buf, 0xCu);
          }
        }
        v55 = v28;
        if (v27)
        {
          uint64_t v30 = objc_opt_class();
          v31 = [v58 objectID];
          v70[0] = v31;
          v70[1] = &off_10020AE90;
          v32 = +[NSArray arrayWithObjects:v70 count:2];
          v33 = [v11 select:v30 where:@"parentObjectID = ? and domain = ?" bindings:v32];

          v56 = [(PDBiomeClient *)self tryAgainDateFromCollaborationState:v33];
        }
        else
        {
          v56 = 0;
        }
        uint64_t v45 = objc_opt_class();
        id v46 = *(id *)(v13 + 24);
        id v69 = v46;
        v47 = +[NSArray arrayWithObjects:&v69 count:1];
        v48 = [v11 select:v45 where:@"objectID = ?" bindings:v47];

        if (v48)
        {
          char v61 = 0;
          id v49 = *(id *)(v13 + 40);
          id v50 = *(id *)(v13 + 40);
          id v51 = *(id *)(v13 + 48);
          [(PDBiomeClient *)self calculateDeltaOnAppClose:v50 endDate:v51 attachment:v58 tryAgainDate:v56 database:v11 markDone:&v61];
          double v53 = v52;

          [(PDBiomeClient *)self generateTimeIntervalForActivity:v48 startDate:v49 interval:v53];
          CLSInitLog();
          v54 = CLSLogDefault;
          if (os_log_type_enabled(CLSLogDefault, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412802;
            unint64_t v64 = v8;
            __int16 v65 = 2048;
            double v66 = v53;
            __int16 v67 = 2112;
            v68 = v15;
            _os_log_impl((void *)&_mh_execute_header, v54, OS_LOG_TYPE_DEFAULT, "App (%@) closed, generate time interval with duration: %f for attachmentID: %@", buf, 0x20u);
          }
          if (v61)
          {
            v59[0] = _NSConcreteStackBlock;
            v59[1] = 3221225472;
            v59[2] = sub_10009D2A0;
            v59[3] = &unk_1001F3B38;
            v59[4] = self;
            id v60 = v15;
            [(PDBiomeClient *)self markDone:v60 then:v59];
          }
        }
      }
      goto LABEL_40;
    }
LABEL_39:
    v15 = 0;
    goto LABEL_40;
  }
LABEL_41:
}

- (void)generateTimeIntervalForActivity:(id)a3 startDate:(id)a4 interval:(double)a5
{
  id v8 = a4;
  id v9 = a3;
  id v10 = [objc_alloc((Class)CLSTimeInterval) _init];
  v11 = [v9 objectID];
  [v10 setParentObjectID:v11];

  [v10 setModified:1];
  uint64_t v12 = [v9 appIdentifier];

  [v10 setAppIdentifier:v12];
  [v10 setStartTime:v8];

  [v10 setLength:a5];
  uint64_t v13 = [(PDBiomeClient *)self database];
  id v15 = v10;
  id v14 = +[NSArray arrayWithObjects:&v15 count:1];
  [v13 saveAndSyncObjects:v14];
}

- (void)handleTimeExpectationReached:(id)a3 appUsage:(id)a4 interval:(double)a5
{
  id v7 = a3;
  id v8 = [(PDBiomeClient *)self database];
  id v9 = sub_10009B53C(v8, v7);
  if (v9)
  {
    id v10 = [v8 select:objc_opt_class() identity:v9];
    uint64_t v11 = objc_opt_class();
    id v26 = v9;
    uint64_t v12 = +[NSArray arrayWithObjects:&v26 count:1];
    uint64_t v13 = [v8 select:v11 where:@"activityID = ?" bindings:v12];

    if (v13 && *(unsigned char *)(v13 + 8))
    {
      *(unsigned char *)(v13 + 8) = 0;
      id v14 = +[NSDate now];
      sub_1000435F8(v13, v14);

      [v8 insertOrUpdateObject:v13];
      id v15 = *(id *)(v13 + 40);
      [(PDBiomeClient *)self generateTimeIntervalForActivity:v10 startDate:v15 interval:a5];

      CLSInitLog();
      unint64_t v16 = (void *)CLSLogDefault;
      if (os_log_type_enabled(CLSLogDefault, OS_LOG_TYPE_DEFAULT))
      {
        v17 = v16;
        id v18 = *(id *)(v13 + 32);
        int v20 = 138412802;
        id v21 = v18;
        __int16 v22 = 2048;
        double v23 = a5;
        __int16 v24 = 2112;
        id v25 = v7;
        _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "(%@) times up, generate time interval with duration: %f for attachmentID: %@", (uint8_t *)&v20, 0x20u);
      }
    }
    else
    {
      CLSInitLog();
      v19 = CLSLogHandout;
      if (os_log_type_enabled(CLSLogHandout, OS_LOG_TYPE_DEFAULT))
      {
        int v20 = 138412290;
        id v21 = v7;
        _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, "All done scheduled task triggered, AppStatus is already marked as closed, no new time interval created, attachmentID = %@", (uint8_t *)&v20, 0xCu);
      }
    }
  }
}

- (void)scheduleHalfWayDoneNotification:(double)a3 attachmentID:(id)a4 saveTrigger:(BOOL)a5
{
  BOOL v5 = a5;
  id v8 = a4;
  id v9 = [(PDBiomeClient *)self database];
  objc_initWeak(&location, self);
  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472;
  v16[2] = sub_10009D8E4;
  v16[3] = &unk_1001F3B60;
  id v10 = v8;
  id v17 = v10;
  objc_copyWeak(&v18, &location);
  uint64_t v11 = objc_retainBlock(v16);
  CLSInitLog();
  uint64_t v12 = CLSLogHandout;
  if (os_log_type_enabled(CLSLogHandout, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    id v21 = v10;
    __int16 v22 = 2048;
    double v23 = a3;
    _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "Scheduling half way done scheduled task, attachmentID = %@, delay = %f", buf, 0x16u);
  }
  uint64_t v13 = [[PDTaskSchedulerBlockTask alloc] initWithIdentifier:self->_scheduleHalfDoneTaskID queue:self->_taskQueue block:v11];
  [(PDTaskSchedulerBlockTask *)v13 setDelay:(unint64_t)a3];
  [(PDTaskSchedulerBlockTask *)v13 setGracePeriod:0];
  [(PDTaskSchedulerBlockTask *)v13 setRepeating:0];
  [(PDTaskSchedulerBlockTask *)v13 setRequiredNetworkState:0];
  id v14 = sub_1000637B8();
  sub_100063F70(v14, v13);

  if (v5)
  {
    id v15 = +[NSDate now];
    sub_100160238(v9, v15, @"halfDoneScheduledDate");

    sub_10015FFF4(v9, @"halfDoneTargetedTimeInterval", a3);
  }

  objc_destroyWeak(&v18);
  objc_destroyWeak(&location);
}

- (void)scheduleActivityDone:(id)a3 appUsage:(id)a4 timeInterval:(double)a5 saveTrigger:(BOOL)a6
{
  BOOL v6 = a6;
  id v10 = a3;
  id v11 = a4;
  uint64_t v12 = [(PDBiomeClient *)self database];
  objc_initWeak(&location, self);
  v20[0] = _NSConcreteStackBlock;
  v20[1] = 3221225472;
  v20[2] = sub_10009DC44;
  v20[3] = &unk_1001F3B88;
  id v13 = v10;
  id v21 = v13;
  v23[1] = *(id *)&a5;
  objc_copyWeak(v23, &location);
  id v14 = v11;
  id v22 = v14;
  id v15 = objc_retainBlock(v20);
  CLSInitLog();
  unint64_t v16 = CLSLogHandout;
  if (os_log_type_enabled(CLSLogHandout, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    id v26 = v13;
    __int16 v27 = 2048;
    double v28 = a5;
    _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "Scheduling mark done scheduled task, attachmentID = %@, delay = %f", buf, 0x16u);
  }
  id v17 = [[PDTaskSchedulerBlockTask alloc] initWithIdentifier:self->_scheduleMarkDoneTaskID queue:self->_taskQueue block:v15];
  [(PDTaskSchedulerBlockTask *)v17 setDelay:(unint64_t)a5];
  [(PDTaskSchedulerBlockTask *)v17 setGracePeriod:0];
  [(PDTaskSchedulerBlockTask *)v17 setRepeating:0];
  [(PDTaskSchedulerBlockTask *)v17 setRequiredNetworkState:0];
  id v18 = sub_1000637B8();
  sub_100063F70(v18, v17);

  if (v6)
  {
    v19 = +[NSDate now];
    sub_100160238(v12, v19, @"allDoneScheduledDate");

    sub_10015FFF4(v12, @"allDoneTargetedTimeInterval", a5);
  }

  objc_destroyWeak(v23);
  objc_destroyWeak(&location);
}

- (void)markDone:(id)a3 then:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(PDBiomeClient *)self database];
  id v9 = objc_opt_new();
  uint64_t v10 = objc_opt_class();
  id v37 = v6;
  id v11 = +[NSArray arrayWithObjects:&v37 count:1];
  v34[0] = _NSConcreteStackBlock;
  v34[1] = 3221225472;
  v34[2] = sub_10009E1C4;
  v34[3] = &unk_1001F3BB0;
  id v12 = v9;
  id v35 = v12;
  [v8 selectAll:v10 where:@"parentObjectID = ?" bindings:v11 block:v34];

  id v13 = [v8 select:objc_opt_class() identity:v6];
  uint64_t v14 = objc_opt_class();
  id v15 = [v13 parentObjectID];
  v36 = v15;
  unint64_t v16 = +[NSArray arrayWithObjects:&v36 count:1];
  id v17 = [v8 select:v14 where:@"objectID = ?" bindings:v16];

  if (v17 && v13)
  {
    id v18 = sub_100003E58(v8);

    if (v18)
    {
      v19 = sub_100003E58(v8);
      uint64_t v20 = [v19 objectID];

      uint64_t v30 = (void *)v20;
      v29 = +[PDSchoolworkCollaborationStateAdaptor setActivityState:2 forAttachment:v13 forHandout:v17 senderPersonID:v20 withStates:v12];
      id v21 = +[NSMutableArray arrayWithObjects:0];
      id v22 = sub_1000CA5C8();
      double v23 = [v22 operationsManager];

      if (v23)
      {
        __int16 v24 = [PDCollaborationStateChangePublish alloc];
        id v25 = [(PDBiomeClient *)self database];
        id v26 = sub_10014FEB4(v24, (uint64_t)v25, v21);

        v31[0] = _NSConcreteStackBlock;
        v31[1] = 3221225472;
        v31[2] = sub_10009E1D0;
        v31[3] = &unk_1001F2448;
        id v32 = v7;
        [v26 addOnFinishBlock:v31];
        sub_100110A9C(v23, v26);
      }
      else
      {
        CLSInitLog();
        double v28 = CLSLogDefault;
        if (os_log_type_enabled(CLSLogDefault, OS_LOG_TYPE_ERROR))
        {
          *(_WORD *)buf = 0;
          _os_log_error_impl((void *)&_mh_execute_header, v28, OS_LOG_TYPE_ERROR, "Operations manager is nil!", buf, 2u);
        }
        (*((void (**)(id, void))v7 + 2))(v7, 0);
      }
    }
    else
    {
      CLSInitLog();
      __int16 v27 = CLSLogDefault;
      if (os_log_type_enabled(CLSLogDefault, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_error_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_ERROR, "Must be signed in to publish state changes.", buf, 2u);
      }
      (*((void (**)(id, void))v7 + 2))(v7, 0);
    }
  }
}

- (void)createScheduleTasks:(id)a3
{
  id v4 = a3;
  BOOL v5 = [(PDBiomeClient *)self database];
  if (v4) {
    id v6 = (void *)v4[2];
  }
  else {
    id v6 = 0;
  }
  id v7 = v6;
  id v8 = sub_10007CAF0(v5, v7);

  id v9 = [v5 select:objc_opt_class() identity:v8];
  if (v9)
  {
    id v19 = 0;
    id v10 = sub_100156F98(v5, v9, &v19);
    id v11 = v19;
    if (v11 && (CLSInitLog(), id v12 = CLSLogDefault, os_log_type_enabled(CLSLogDefault, OS_LOG_TYPE_ERROR)))
    {
      *(_DWORD *)buf = 138412290;
      id v22 = v11;
      _os_log_error_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_ERROR, "Failed to query attachment state, error: %@", buf, 0xCu);
      if (v10) {
        goto LABEL_7;
      }
    }
    else if (v10)
    {
LABEL_7:
      uint64_t v13 = objc_opt_class();
      uint64_t v14 = [v9 objectID];
      uint64_t v20 = v14;
      id v15 = +[NSArray arrayWithObjects:&v20 count:1];
      [v5 select:v13 where:@"parentObjectID = ? and domain = 1" bindings:v15];
      unint64_t v16 = v18 = v11;

      id v17 = [(PDBiomeClient *)self tryAgainDateFromCollaborationState:v16];

      id v11 = v18;
LABEL_10:
      [(PDBiomeClient *)self scheduleHalfWayNotificationIfNeeded:v9 appUsage:v4 isTryAgain:v10 tryAgainDate:v17];
      [(PDBiomeClient *)self scheduleMarkDoneIfNeeded:v9 appUsage:v4 isTryAgain:v10 tryAgainDate:v17];

      goto LABEL_11;
    }
    id v17 = 0;
    goto LABEL_10;
  }
LABEL_11:
}

- (BOOL)scheduleMarkDoneIfNeeded:(id)a3 appUsage:(id)a4 isTryAgain:(BOOL)a5 tryAgainDate:(id)a6
{
  BOOL v7 = a5;
  id v10 = a3;
  id v11 = a4;
  [(PDBiomeClient *)self calculateDelta:v10 usage:v11 completionType:2 isTryAgain:v7 tryAgainDate:a6];
  double v13 = v12;
  if (v12 > 0.0)
  {
    uint64_t v14 = [v10 objectID];
    [(PDBiomeClient *)self scheduleActivityDone:v14 appUsage:v11 timeInterval:1 saveTrigger:v13];
  }
  return v13 > 0.0;
}

- (BOOL)scheduleHalfWayNotificationIfNeeded:(id)a3 appUsage:(id)a4 isTryAgain:(BOOL)a5 tryAgainDate:(id)a6
{
  BOOL v7 = a5;
  id v10 = a3;
  id v11 = a4;
  id v12 = a6;
  [v10 timeExpectation];
  if (v13 > 60.0
    && ([(PDBiomeClient *)self calculateDelta:v10 usage:v11 completionType:1 isTryAgain:v7 tryAgainDate:v12], double v15 = v14, v14 >= 60.0))
  {
    id v17 = [v10 objectID];
    BOOL v16 = 1;
    [(PDBiomeClient *)self scheduleHalfWayDoneNotification:v17 attachmentID:1 saveTrigger:v15];
  }
  else
  {
    BOOL v16 = 0;
  }

  return v16;
}

- (double)calculateDelta:(id)a3 usage:(id)a4 completionType:(int64_t)a5 isTryAgain:(BOOL)a6 tryAgainDate:(id)a7
{
  BOOL v8 = a6;
  id v11 = a3;
  id v12 = a7;
  [v11 timeExpectation];
  double v14 = v13;
  double v15 = [(PDBiomeClient *)self database];
  BOOL v16 = [v11 objectID];
  if (v8) {
    id v17 = v12;
  }
  else {
    id v17 = 0;
  }
  double v18 = sub_10007D18C(v15, v16, v17);

  if (a5 == 1)
  {
    double v19 = v14 * 0.5 - v18;
  }
  else
  {
    double v19 = v14 - v18;
    CLSInitLog();
    uint64_t v20 = (void *)CLSLogDefault;
    if (os_log_type_enabled(CLSLogDefault, OS_LOG_TYPE_DEFAULT))
    {
      id v21 = v20;
      id v22 = [v11 objectID];
      if (v8) {
        CFStringRef v23 = @"yes";
      }
      else {
        CFStringRef v23 = @"no";
      }
      [v12 timeIntervalSinceReferenceDate];
      int v26 = 134218754;
      double v27 = v19;
      __int16 v28 = 2112;
      v29 = v22;
      __int16 v30 = 2112;
      CFStringRef v31 = v23;
      __int16 v32 = 2048;
      uint64_t v33 = v24;
      _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_DEFAULT, "Calculated delta = %f, for schedule task, attachmentID = %@, is try again (%@), try again time interval = %f", (uint8_t *)&v26, 0x2Au);
    }
  }

  return v19;
}

- (double)calculateDeltaOnAppClose:(id)a3 endDate:(id)a4 attachment:(id)a5 tryAgainDate:(id)a6 database:(id)a7 markDone:(BOOL *)a8
{
  id v13 = a7;
  id v14 = a6;
  id v15 = a5;
  id v16 = a4;
  id v17 = a3;
  double v18 = [v15 objectID];
  double v19 = sub_10007D18C(v13, v18, v14);

  [v15 timeExpectation];
  double v21 = v20;

  double v22 = v21 - v19;
  [v16 timeIntervalSinceDate:v17];
  double v24 = v23;

  if (v24 >= v22) {
    double result = v22;
  }
  else {
    double result = v24;
  }
  *a8 = result == v22;
  return result;
}

- (id)tryAgainDateFromCollaborationState:(id)a3
{
  id v3 = a3;
  id v4 = [v3 info];
  BOOL v5 = v4;
  if (!v4
    || ([v4 objectForKeyedSubscript:@"date_last_try_again"],
        (id v6 = objc_claimAutoreleasedReturnValue()) == 0))
  {
    id v6 = [v3 dateLastModified];
  }

  return v6;
}

- (void)attachmentWillChange:(id)a3
{
  id v4 = a3;
  BOOL v5 = [v4 userInfo];
  id v6 = [v5 objectForKeyedSubscript:@"newEntity"];

  uint64_t v7 = [v6 objectID];
  BOOL v8 = [v4 object];

  id v9 = [v8 select:objc_opt_class() identity:v7];
  id v10 = v9;
  if (v9)
  {
    [v9 timeExpectation];
    double v12 = v11;
    [v6 timeExpectation];
    if (v12 != v13)
    {
      currentAttachmentID = self->_currentAttachmentID;
      if (!((unint64_t)currentAttachmentID | v7)
        || currentAttachmentID && v7 && [(NSString *)currentAttachmentID isEqualToString:v7])
      {
        id v15 = sub_1000637B8();
        sub_100063984(v15, self->_scheduleHalfDoneTaskID);

        id v16 = sub_1000637B8();
        sub_100063984(v16, self->_scheduleMarkDoneTaskID);

        [(PDBiomeClient *)self cleanUpScheduledTaskTriggers:1];
        [(PDBiomeClient *)self cleanUpScheduledTaskTriggers:2];
        buf[0] = 0;
        uint64_t v17 = sub_10007C9B0(v8);
        double v18 = (void *)v17;
        if (v17) {
          double v19 = *(void **)(v17 + 40);
        }
        else {
          double v19 = 0;
        }
        id v38 = v19;
        v39 = +[NSDate now];
        [v8 select:objc_opt_class() identity:v7];
        id v35 = v42 = 0;
        unsigned int v20 = sub_100156F98(v8, v35, &v42);
        id v37 = v42;
        double v21 = 0;
        if (v20)
        {
          uint64_t v22 = objc_opt_class();
          v44[0] = v7;
          v44[1] = &off_10020AE90;
          double v23 = +[NSArray arrayWithObjects:v44 count:2];
          double v24 = [v8 select:v22 where:@"parentObjectID = ? and domain = ?" bindings:v23];

          double v21 = [(PDBiomeClient *)self tryAgainDateFromCollaborationState:v24];
        }
        id v25 = v38;
        -[PDBiomeClient calculateDeltaOnAppClose:endDate:attachment:tryAgainDate:database:markDone:](self, "calculateDeltaOnAppClose:endDate:attachment:tryAgainDate:database:markDone:", v38, v39, v6, v21, v8, buf, v35);
        double v27 = v26;
        if (buf[0])
        {
          uint64_t v28 = objc_opt_class();
          if (v18) {
            v29 = (void *)v18[3];
          }
          else {
            v29 = 0;
          }
          id v30 = v29;
          id v43 = v30;
          CFStringRef v31 = +[NSArray arrayWithObjects:&v43 count:1];
          __int16 v32 = [v8 select:v28 where:@"objectID = ?" bindings:v31];

          id v25 = v38;
          [(PDBiomeClient *)self generateTimeIntervalForActivity:v32 startDate:v38 interval:v27];
          v40[0] = _NSConcreteStackBlock;
          v40[1] = 3221225472;
          v40[2] = sub_10009EF8C;
          v40[3] = &unk_1001F3B38;
          v40[4] = self;
          id v41 = (id)v7;
          [(PDBiomeClient *)self markDone:v41 then:v40];

          uint64_t v33 = v36;
        }
        else
        {
          uint64_t v33 = v36;
          [(PDBiomeClient *)self rescheduleHalfWayTimer:v36 attachment:v21 tryAgainDate:v26];
          [(PDBiomeClient *)self rescheduleActivityDoneTimer:v36 attachment:v21 tryAgainDate:v27];
        }
      }
    }
  }
  else
  {
    CLSInitLog();
    uint64_t v34 = CLSLogNotifications;
    if (os_log_type_enabled(CLSLogNotifications, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      uint64_t v46 = v7;
      _os_log_impl((void *)&_mh_execute_header, v34, OS_LOG_TYPE_INFO, "PDBiomeClient.attachmentWillChange. Could not find an existing attachment. attachmentID: %@", buf, 0xCu);
    }
  }
}

- (void)presentProgressBannerWithAttachmentID:(id)a3
{
  id v4 = a3;
  uint64_t v5 = sub_1000CA5C8();
  id v6 = (void *)v5;
  if (v5) {
    uint64_t v7 = *(void **)(v5 + 32);
  }
  else {
    uint64_t v7 = 0;
  }
  id v8 = v7;
  id v9 = [v8 anyObject];

  id v10 = sub_10002C06C(v9, v4);
  double v11 = [v10 objectForKeyedSubscript:@"showModal"];
  unsigned int v12 = [v11 BOOLValue];

  if (v12)
  {
    double v13 = +[NSMutableDictionary dictionaryWithDictionary:v10];
    id v14 = +[NSBundle bundleForClass:objc_opt_class()];
    id v15 = [v14 localizedStringForKey:@"ALERT_TITLE" value:&stru_1001F6580 table:@"ClassKit"];
    [v13 setObject:v15 forKeyedSubscript:@"title"];

    id v16 = +[NSBundle bundleForClass:objc_opt_class()];
    uint64_t v17 = [v16 localizedStringForKey:@"IOS_ALERT_MESSAGE" value:&stru_1001F6580 table:@"ClassKit"];
    [v13 setObject:v17 forKeyedSubscript:@"message"];

    double v18 = +[NSBundle bundleForClass:objc_opt_class()];
    double v19 = [v18 localizedStringForKey:@"IOS_SETTINGS" value:&stru_1001F6580 table:@"ClassKit"];
    [v13 setObject:v19 forKeyedSubscript:@"alternateButton"];

    unsigned int v20 = +[NSBundle bundleForClass:objc_opt_class()];
    double v21 = [v20 localizedStringForKey:@"OK" value:&stru_1001F6580 table:@"ClassKit"];
    [v13 setObject:v21 forKeyedSubscript:@"defaultButton"];

    uint64_t v22 = +[NSDate date];
    [(NSMutableDictionary *)self->_bannerTimerMap setObject:v22 forKeyedSubscript:v4];

    sub_100046D40((uint64_t)PDPrivateUserNotificationManager, v13);
  }
  else
  {
    double v23 = [(NSMutableDictionary *)self->_bannerTimerMap objectForKeyedSubscript:v4];
    double v13 = v23;
    if (!v23 || ([v23 timeIntervalSinceNow], v24 < -30.0))
    {
      id v25 = +[NSDate date];
      [(NSMutableDictionary *)self->_bannerTimerMap setObject:v25 forKeyedSubscript:v4];

      double v26 = [v10 objectForKeyedSubscript:@"classNames"];
      double v27 = [v10 objectForKeyedSubscript:@"attachmentTitle"];
      uint64_t v28 = [v10 objectForKeyedSubscript:@"localizedTitle"];
      uint64_t v29 = [v10 objectForKeyedSubscript:@"localizedMessageFormat"];
      id v30 = (void *)v29;
      if (v26 && v27 && v28 && v29)
      {
        id v35 = 0;
        CFStringRef v31 = +[NSString stringWithValidatedFormat:v29, @"%@ %@", &v35, v27, v26 validFormatSpecifiers error];
        id v32 = v35;
        if (v32)
        {
          uint64_t v33 = v32;
          CLSInitLog();
          log = CLSLogDefault;
          if (os_log_type_enabled(CLSLogDefault, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138412546;
            id v37 = v30;
            __int16 v38 = 2112;
            v39 = v33;
            _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "Failed to validate messageFormat: '%@', error: %@", buf, 0x16u);
          }
        }
        else
        {
          sub_100046FA4((uint64_t)PDPrivateUserNotificationManager, v28, v31, 0);
        }
      }
    }
  }
}

- (void)presentAppBasedAssignmentCompletedBanner:(id)a3
{
  id v4 = a3;
  id v13 = [(PDBiomeClient *)self database];
  uint64_t v5 = [v13 select:objc_opt_class() identity:v4];

  if (v5)
  {
    [v5 timeExpectation];
    if (v6 != 0.0)
    {
      uint64_t v7 = +[NSBundle bundleForClass:objc_opt_class()];
      id v8 = [v7 URLForResource:@"checkmarkNotifications-star" withExtension:@"png"];
      id v9 = +[NSBundle bundleForClass:objc_opt_class()];
      id v10 = [v9 localizedStringForKey:@"TIME_BASED_ASSIGNMENT_COMPLETED_TITLE" value:&stru_1001F6580 table:@"ClassKit"];
      double v11 = +[NSBundle bundleForClass:objc_opt_class()];
      unsigned int v12 = [v11 localizedStringForKey:@"TIME_BASED_ASSIGNMENT_COMPLETED_FORMAT" value:&stru_1001F6580 table:@"ClassKit"];
      sub_100046FA4((uint64_t)PDPrivateUserNotificationManager, v10, v12, v8);
    }
  }
}

- (void)presentHalfWayCompletedBanner:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(PDBiomeClient *)self database];
  double v6 = +[NSBundle bundleForClass:objc_opt_class()];
  uint64_t v7 = [v6 localizedStringForKey:@"HALF_WAY_DONE_TITLE" value:&stru_1001F6580 table:@"ClassKit"];

  id v8 = [v5 select:objc_opt_class() identity:v4];

  if (v8)
  {
    [v8 timeExpectation];
    if (v9 > 0.0)
    {
      [v8 timeExpectation];
      double v11 = [(PDBiomeClient *)self localizedTimeInterval:0 calendar:v10 * 0.5];
      CLSInitLog();
      unsigned int v12 = CLSLogHandout;
      if (os_log_type_enabled(CLSLogHandout, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        uint64_t v17 = v11;
        _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "Trigger half way done scheduled task, remaining time = %@", buf, 0xCu);
      }
      id v13 = +[NSBundle bundleForClass:objc_opt_class()];
      id v14 = [v13 localizedStringForKey:@"HALF_WAY_DONE_MESSAGE_FORMAT" value:&stru_1001F6580 table:@"ClassKit"];
      id v15 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", v14, v11);

      sub_100046FA4((uint64_t)PDPrivateUserNotificationManager, v7, v15, 0);
    }
  }
}

- (id)localizedTimeInterval:(double)a3 calendar:(id)a4
{
  id v5 = a4;
  id v6 = objc_alloc_init((Class)NSDateComponentsFormatter);
  uint64_t v7 = v6;
  if (v5) {
    [v6 setCalendar:v5];
  }
  [v7 setUnitsStyle:3];
  [v7 setAllowedUnits:96];
  id v8 = [v7 stringFromTimeInterval:a3];

  return v8;
}

- (BOOL)checkScheduledTask:(id)a3 completionType:(int64_t)a4
{
  id v6 = a3;
  uint64_t v7 = [(PDBiomeClient *)self database];
  id v8 = v7;
  if (a4 == 1) {
    double v9 = @"halfDoneScheduledDate";
  }
  else {
    double v9 = @"allDoneScheduledDate";
  }
  if (a4 == 1) {
    double v10 = @"halfDoneTargetedTimeInterval";
  }
  else {
    double v10 = @"allDoneTargetedTimeInterval";
  }
  double v11 = sub_1001602E8(v7, v9);
  double v12 = sub_10016008C(v8, v10);
  id v13 = +[NSDate dateWithTimeInterval:sinceDate:](NSDate, "dateWithTimeInterval:sinceDate:", v11);
  CLSInitLog();
  id v14 = CLSLogDefault;
  if (os_log_type_enabled(CLSLogDefault, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "check task scheduler", buf, 2u);
  }
  if (!v11) {
    goto LABEL_17;
  }
  id v15 = [v6 compare:v13];
  CLSInitLog();
  id v16 = CLSLogDefault;
  BOOL v17 = os_log_type_enabled(CLSLogDefault, OS_LOG_TYPE_DEFAULT);
  if (v15 == (id)-1)
  {
    if (v17)
    {
      *(_WORD *)double v21 = 0;
      _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "target date in the future, reschedule task", v21, 2u);
    }
    [(PDBiomeClient *)self rescheduleTask:a4 current:v6 targetDate:v13];
LABEL_17:
    BOOL v18 = 0;
    goto LABEL_18;
  }
  if (v17)
  {
    *(_WORD *)unsigned int v20 = 0;
    _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "trigger scheduled task", v20, 2u);
  }
  BOOL v18 = [(PDBiomeClient *)self triggerScheduledTask:a4 targetInterval:v12];
LABEL_18:

  return v18;
}

- (void)rescheduleTask:(int64_t)a3 current:(id)a4 targetDate:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  double v10 = [(PDBiomeClient *)self database];
  uint64_t v11 = sub_10007C9B0(v10);
  double v12 = (void *)v11;
  if (v11)
  {
    id v13 = *(id *)(v11 + 16);
    id v14 = sub_10007CAF0(v10, v13);

    if (v14)
    {
      [v9 timeIntervalSinceDate:v8];
      if (a3 == 1) {
        -[PDBiomeClient scheduleHalfWayDoneNotification:attachmentID:saveTrigger:](self, "scheduleHalfWayDoneNotification:attachmentID:saveTrigger:", v14, 0);
      }
      else {
        -[PDBiomeClient scheduleActivityDone:appUsage:timeInterval:saveTrigger:](self, "scheduleActivityDone:appUsage:timeInterval:saveTrigger:", v14, v12, 0);
      }
    }
    else
    {
      CLSInitLog();
      id v16 = CLSLogDefault;
      if (os_log_type_enabled(CLSLogDefault, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)BOOL v17 = 0;
        _os_log_error_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_ERROR, "Found targeted trigger date, but don't have a valid attachmentID", v17, 2u);
      }
    }
  }
  else
  {
    CLSInitLog();
    id v15 = CLSLogDefault;
    if (os_log_type_enabled(CLSLogDefault, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_ERROR, "Found targeted trigger date, but don't have a valid PDAppUsage", buf, 2u);
    }
  }
}

- (BOOL)triggerScheduledTask:(int64_t)a3 targetInterval:(double)a4
{
  uint64_t v7 = [(PDBiomeClient *)self database];
  uint64_t v8 = sub_10007C9B0(v7);
  id v9 = (void *)v8;
  if (v8)
  {
    id v10 = *(id *)(v8 + 16);
    uint64_t v11 = sub_10007CAF0(v7, v10);

    BOOL v12 = v11 != 0;
    if (v11)
    {
      if (a3 == 1)
      {
        [(PDBiomeClient *)self presentHalfWayCompletedBanner:v11];
        [(PDBiomeClient *)self cleanUpScheduledTaskTriggers:1];
      }
      else
      {
        [(PDBiomeClient *)self handleTimeExpectationReached:v11 appUsage:v9 interval:a4];
        id v16 = _NSConcreteStackBlock;
        uint64_t v17 = 3221225472;
        BOOL v18 = sub_10009FDD0;
        double v19 = &unk_1001F3B38;
        unsigned int v20 = self;
        id v21 = v11;
        [(PDBiomeClient *)self markDone:v21 then:&v16];
        -[PDBiomeClient cleanUpScheduledTaskTriggers:](self, "cleanUpScheduledTaskTriggers:", 2, v16, v17, v18, v19, v20);
      }
    }
    else
    {
      CLSInitLog();
      id v14 = CLSLogDefault;
      if (os_log_type_enabled(CLSLogDefault, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_error_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_ERROR, "Found targeted trigger date, but don't have a valid attachmentID", buf, 2u);
      }
    }
  }
  else
  {
    CLSInitLog();
    id v13 = CLSLogDefault;
    if (os_log_type_enabled(CLSLogDefault, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_ERROR, "Found targeted trigger date, but don't have a valid PDAppUsage", buf, 2u);
    }
    BOOL v12 = 0;
  }

  return v12;
}

- (double)rescheduleHalfWayTimer:(double)a3 attachment:(id)a4 tryAgainDate:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  id v10 = [(PDBiomeClient *)self database];
  uint64_t v11 = [v8 objectID];
  double v12 = sub_10007D18C(v10, v11, v9);

  [v8 timeExpectation];
  double v14 = v13 * 0.5 - (v12 + a3);
  if (v14 > 0.0)
  {
    id v15 = [v8 objectID];
    [(PDBiomeClient *)self scheduleHalfWayDoneNotification:v15 attachmentID:1 saveTrigger:v14];
  }
  return v14;
}

- (double)rescheduleActivityDoneTimer:(double)a3 attachment:(id)a4 tryAgainDate:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  id v10 = [(PDBiomeClient *)self database];
  uint64_t v11 = [v8 objectID];
  double v12 = sub_10007D18C(v10, v11, v9);

  [v8 timeExpectation];
  double v14 = v13 - (v12 + a3);
  if (v14 > 0.0)
  {
    id v15 = [v8 objectID];
    [(PDBiomeClient *)self scheduleHalfWayDoneNotification:v15 attachmentID:1 saveTrigger:v14];
  }
  return v14;
}

- (void)cleanUpScheduledTaskTriggers:(int64_t)a3
{
  id v4 = [(PDBiomeClient *)self database];
  uint64_t v5 = objc_opt_class();
  if (a3 == 1)
  {
    CFStringRef v14 = @"halfDoneScheduledDate";
    id v6 = +[NSArray arrayWithObjects:&v14 count:1];
    [v4 deleteAll:v5 where:@"name = ?" bindings:v6];

    uint64_t v7 = objc_opt_class();
    CFStringRef v13 = @"halfDoneTargetedTimeInterval";
    id v8 = &v13;
  }
  else
  {
    CFStringRef v12 = @"allDoneScheduledDate";
    id v9 = +[NSArray arrayWithObjects:&v12 count:1];
    [v4 deleteAll:v5 where:@"name = ?" bindings:v9];

    uint64_t v7 = objc_opt_class();
    CFStringRef v11 = @"allDoneTargetedTimeInterval";
    id v8 = &v11;
  }
  id v10 = +[NSArray arrayWithObjects:v8 count:1];
  [v4 deleteAll:v7 where:@"name = ?" bindings:v10];
}

- (PDDatabase)database
{
  return self->_database;
}

- (void)setDatabase:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_database, 0);
  objc_storeStrong((id *)&self->_bannerTimerMap, 0);
  objc_storeStrong((id *)&self->_currentAttachmentID, 0);
  objc_storeStrong((id *)&self->_scheduleHalfDoneTaskID, 0);
  objc_storeStrong((id *)&self->_scheduleMarkDoneTaskID, 0);
  objc_storeStrong((id *)&self->_taskQueue, 0);
  objc_storeStrong((id *)&self->_biomeQueue, 0);

  objc_storeStrong((id *)&self->_sink, 0);
}

@end