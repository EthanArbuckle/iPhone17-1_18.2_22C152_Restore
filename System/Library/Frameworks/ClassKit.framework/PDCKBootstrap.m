@interface PDCKBootstrap
- (BOOL)isSubscribedTo:(id)a3;
- (BOOL)maySyncWithAssetZone;
- (BOOL)maySyncWithProgressZone;
- (BOOL)maySyncWithSurveyAnswerZone;
- (BOOL)maySyncWithTeacherZone;
- (BOOL)writeZoneNamesForUserID:(id)a3;
- (void)cleanupStaleZoneInfo;
- (void)createMissingZones:(id)a3;
- (void)createRecordZonesIfNeeded;
- (void)execute;
- (void)markAsBootstrapped;
- (void)setSubscribed:(BOOL)a3 toSubscriptionWithID:(id)a4;
- (void)setupZones;
- (void)subscribeToZonesIfNeeded;
@end

@implementation PDCKBootstrap

- (BOOL)maySyncWithProgressZone
{
  v2 = [(PDOperation *)self database];
  sub_100005B44(v2);
  v3 = (unsigned char *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    if (v3[11]) {
      BOOL v4 = 1;
    }
    else {
      BOOL v4 = v3[8] != 0;
    }
  }
  else
  {
    BOOL v4 = 0;
  }

  return v4;
}

- (BOOL)maySyncWithTeacherZone
{
  v2 = [(PDOperation *)self database];
  v3 = v2;
  if (v2) {
    unint64_t v4 = ((unint64_t)sub_100004B84(v2) >> 1) & 1;
  }
  else {
    LOBYTE(v4) = 0;
  }

  return v4;
}

- (BOOL)maySyncWithAssetZone
{
  return 1;
}

- (BOOL)maySyncWithSurveyAnswerZone
{
  v2 = [(PDOperation *)self database];
  v3 = v2;
  if (v2) {
    unint64_t v4 = (unint64_t)sub_100004B84(v2) & 1;
  }
  else {
    LOBYTE(v4) = 0;
  }

  return v4;
}

- (void)execute
{
  [(PDCKBootstrap *)self cleanupStaleZoneInfo];
  if (sub_1000040AC(self))
  {
    [(PDCKBootstrap *)self setupZones];
  }
  else
  {
    [(PDCKBootstrap *)self subscribeToZonesIfNeeded];
  }
}

- (void)cleanupStaleZoneInfo
{
  v3 = [(PDOperation *)self database];
  if (![(PDCKBootstrap *)self maySyncWithProgressZone])
  {
    uint64_t v4 = objc_opt_class();
    CFStringRef v15 = @"PDCK_ClassKitZoneName";
    v5 = +[NSArray arrayWithObjects:&v15 count:1];
    [v3 deleteAll:v4 where:@"name = ?" bindings:v5];
  }
  if (![(PDCKBootstrap *)self maySyncWithTeacherZone])
  {
    uint64_t v6 = objc_opt_class();
    CFStringRef v14 = @"PDCK_TeacherZoneName";
    v7 = +[NSArray arrayWithObjects:&v14 count:1];
    [v3 deleteAll:v6 where:@"name = ?" bindings:v7];
  }
  if (![(PDCKBootstrap *)self maySyncWithAssetZone])
  {
    uint64_t v8 = objc_opt_class();
    CFStringRef v13 = @"PDCK_ClassKitSharedAssetZone";
    v9 = +[NSArray arrayWithObjects:&v13 count:1];
    [v3 deleteAll:v8 where:@"name = ?" bindings:v9];
  }
  if (![(PDCKBootstrap *)self maySyncWithSurveyAnswerZone])
  {
    uint64_t v10 = objc_opt_class();
    CFStringRef v12 = @"PDCK_StudentZoneName";
    v11 = +[NSArray arrayWithObjects:&v12 count:1];
    [v3 deleteAll:v10 where:@"name = ?" bindings:v11];
  }
}

- (void)setupZones
{
  if (![(PDOperation *)self isAborted])
  {
    v3 = [(PDOperation *)self database];
    uint64_t v4 = sub_100006D08(v3, @"PDCK_iCloudUserID");

    if ([v4 length])
    {
      if ([(PDCKBootstrap *)self writeZoneNamesForUserID:v4])
      {
        [(PDCKBootstrap *)self createRecordZonesIfNeeded];
      }
      else
      {
        CLSInitLog();
        uint64_t v6 = CLSLogSync;
        if (os_log_type_enabled(CLSLogSync, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)v7 = 0;
          _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "Failed to save record zone names in db", v7, 2u);
        }
        [(PDCKOperation *)self abort];
      }
    }
    else
    {
      CLSInitLog();
      v5 = CLSLogSync;
      if (os_log_type_enabled(CLSLogSync, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "No valid user record id, bailing from ck bootstrap.", buf, 2u);
      }
      [(PDCKOperation *)self setBootstrapped:0];
      [(PDAsyncOperation *)self markAsFinished];
    }
  }
}

- (BOOL)writeZoneNamesForUserID:(id)a3
{
  id v4 = a3;
  if ([(PDOperation *)self isAborted])
  {
    unsigned __int8 v5 = 0;
  }
  else
  {
    uint64_t v6 = [(PDOperation *)self database];
    v11[0] = _NSConcreteStackBlock;
    v11[1] = 3221225472;
    v11[2] = sub_1000C4CD4;
    v11[3] = &unk_1001F3060;
    v11[4] = self;
    id v12 = v4;
    CFStringRef v13 = v6;
    id v7 = v6;
    uint64_t v8 = v7;
    if (v7)
    {
      unsigned __int8 v5 = [v7 performTransaction:v11 forWriting:1];
      v9 = v13;
    }
    else
    {
      v9 = 0;
      unsigned __int8 v5 = 0;
    }
  }
  return v5;
}

- (void)createRecordZonesIfNeeded
{
  if (![(PDOperation *)self isAborted])
  {
    id v3 = objc_alloc_init((Class)NSMutableDictionary);
    id v4 = [(PDOperation *)self database];
    v17[0] = _NSConcreteStackBlock;
    v17[1] = 3221225472;
    v17[2] = sub_1000C504C;
    v17[3] = &unk_1001F2710;
    v17[4] = self;
    id v5 = v3;
    id v18 = v5;
    sub_10000749C(v4, v17);

    if ([v5 count])
    {
      objc_initWeak(&location, self);
      id v6 = objc_alloc((Class)CKFetchRecordZonesOperation);
      id v7 = [v5 allKeys];
      id v8 = [v6 initWithRecordZoneIDs:v7];

      v9 = _NSConcreteStackBlock;
      uint64_t v10 = 3221225472;
      v11 = sub_1000C5190;
      id v12 = &unk_1001F4178;
      objc_copyWeak(&v15, &location);
      CFStringRef v13 = self;
      id v14 = v5;
      [v8 setFetchRecordZonesCompletionBlock:&v9];
      -[PDCKOperation performCKDatabaseOperation:](self, "performCKDatabaseOperation:", v8, v9, v10, v11, v12, v13);

      objc_destroyWeak(&v15);
      objc_destroyWeak(&location);
    }
    else
    {
      [(PDCKBootstrap *)self subscribeToZonesIfNeeded];
    }
  }
}

- (void)createMissingZones:(id)a3
{
  id v4 = a3;
  if (![(PDOperation *)self isAborted])
  {
    objc_initWeak(&location, self);
    id v5 = [objc_alloc((Class)CKModifyRecordZonesOperation) initWithRecordZonesToSave:v4 recordZoneIDsToDelete:0];
    id v6 = _NSConcreteStackBlock;
    uint64_t v7 = 3221225472;
    id v8 = sub_1000C563C;
    v9 = &unk_1001F36D0;
    objc_copyWeak(&v10, &location);
    [v5 setModifyRecordZonesCompletionBlock:&v6];
    -[PDCKOperation performCKDatabaseOperation:](self, "performCKDatabaseOperation:", v5, v6, v7, v8, v9);
    objc_destroyWeak(&v10);

    objc_destroyWeak(&location);
  }
}

- (void)setSubscribed:(BOOL)a3 toSubscriptionWithID:(id)a4
{
  id v6 = a4;
  id v7 = [(PDOperation *)self database];
  sub_10015FEC4(v7, a3, v6);
}

- (BOOL)isSubscribedTo:(id)a3
{
  id v4 = a3;
  id v5 = [(PDOperation *)self database];
  BOOL v6 = sub_100006970(v5, v4);

  return v6;
}

- (void)markAsBootstrapped
{
  [(PDCKOperation *)self setBootstrapped:1];

  [(PDAsyncOperation *)self markAsFinished];
}

- (void)subscribeToZonesIfNeeded
{
  if (![(PDOperation *)self isAborted])
  {
    objc_initWeak(&location, self);
    id v3 = objc_opt_new();
    id v4 = [(PDCKOperation *)self progressZone];
    id v5 = [v4 zoneID];

    if (v5
      && ![(PDCKBootstrap *)self isSubscribedTo:@"com.apple.orion.ClassKit.progressSubscription"])
    {
      [v3 setObject:v5 forKeyedSubscript:@"com.apple.orion.ClassKit.progressSubscription"];
    }
    BOOL v6 = [(PDCKOperation *)self teacherZone];
    id v7 = [v6 zoneID];

    if (v7
      && ![(PDCKBootstrap *)self isSubscribedTo:@"com.apple.orion.ClassKit.teacherSubscription"])
    {
      [v3 setObject:v7 forKeyedSubscript:@"com.apple.orion.ClassKit.teacherSubscription"];
    }
    id v8 = [(PDCKOperation *)self assetZone];
    v9 = [v8 zoneID];

    if (v9
      && ![(PDCKBootstrap *)self isSubscribedTo:@"com.apple.orion.ClassKit.assetSubscription"])
    {
      [v3 setObject:v9 forKeyedSubscript:@"com.apple.orion.ClassKit.assetSubscription"];
    }
    id v10 = [(PDCKOperation *)self surveyAnswerZone];
    v11 = [v10 zoneID];

    if (v11
      && ![(PDCKBootstrap *)self isSubscribedTo:@"com.apple.orion.ClassKit.surveyAnswerSubscription"])
    {
      [v3 setObject:v11 forKeyedSubscript:@"com.apple.orion.ClassKit.surveyAnswerSubscription"];
    }
    if ([v3 count])
    {
      id v12 = objc_alloc((Class)CKFetchSubscriptionsOperation);
      CFStringRef v13 = [v3 allKeys];
      id v14 = [v12 initWithSubscriptionIDs:v13];

      v15[0] = _NSConcreteStackBlock;
      v15[1] = 3221225472;
      v15[2] = sub_1000C5B14;
      v15[3] = &unk_1001F41A0;
      objc_copyWeak(&v17, &location);
      id v16 = v3;
      [v14 setFetchSubscriptionCompletionBlock:v15];
      [(PDCKOperation *)self performCKDatabaseOperation:v14];

      objc_destroyWeak(&v17);
    }
    else
    {
      [(PDCKBootstrap *)self markAsBootstrapped];
    }

    objc_destroyWeak(&location);
  }
}

@end