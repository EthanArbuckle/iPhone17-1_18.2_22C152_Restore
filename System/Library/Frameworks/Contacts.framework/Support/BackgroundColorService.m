@interface BackgroundColorService
+ (BackgroundColorService)sharedInstance;
+ (id)makeWorkQueueUsingSchedulerProvider:(id)a3;
+ (unint64_t)_getDefaultBatchSize;
+ (unint64_t)batchSize;
- (BackgroundColorService)init;
- (CNCancelable)coalescingToken;
- (CNInhibitor)coalescingInhibitor;
- (CNPublishingSubject)coalescer;
- (CNScheduler)workQueue;
- (id)fetchContactIdentifiersForContactsMissingBackgroundColors;
- (id)fetchContactsWithImageKeysForIdentifiers:(id)a3;
- (id)imageKeysToFetch;
- (id)interestedNotifications;
- (void)_updateBackgroundColorIfNeeded:(id)a3 colorAnalyzer:(id)a4;
- (void)batchUpdateBackgroundColorsForContactIdentifiers:(id)a3;
- (void)handleCoalescedEvent:(id)a3;
- (void)handleNotificationName:(id)a3;
- (void)setCoalescer:(id)a3;
- (void)setCoalescingInhibitor:(id)a3;
- (void)setCoalescingToken:(id)a3;
@end

@implementation BackgroundColorService

+ (BackgroundColorService)sharedInstance
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10000CDD8;
  block[3] = &unk_100024B30;
  block[4] = a1;
  if (qword_10002CA10 != -1) {
    dispatch_once(&qword_10002CA10, block);
  }
  v2 = (void *)qword_10002CA18;

  return (BackgroundColorService *)v2;
}

+ (unint64_t)batchSize
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10000CEA4;
  block[3] = &unk_100024B30;
  block[4] = a1;
  if (qword_10002CA20 != -1) {
    dispatch_once(&qword_10002CA20, block);
  }
  return (unint64_t)[(id)qword_10002CA28 unsignedIntegerValue];
}

+ (unint64_t)_getDefaultBatchSize
{
  Boolean keyExistsAndHasValidFormat = 0;
  unint64_t result = CFPreferencesGetAppIntegerValue(@"CNBackgroundColorServiceBatchSize", kCFPreferencesCurrentApplication, &keyExistsAndHasValidFormat);
  if ((uint64_t)result <= 0 || keyExistsAndHasValidFormat == 0) {
    return 10;
  }
  return result;
}

- (BackgroundColorService)init
{
  v13.receiver = self;
  v13.super_class = (Class)BackgroundColorService;
  v2 = [(BackgroundColorService *)&v13 init];
  if (v2)
  {
    v3 = +[CNSchedulerProvider defaultProvider];
    uint64_t v4 = [(id)objc_opt_class() makeWorkQueueUsingSchedulerProvider:v3];
    workQueue = v2->_workQueue;
    v2->_workQueue = (CNScheduler *)v4;

    v6 = (CNPublishingSubject *)objc_alloc_init((Class)CNPublishingSubject);
    coalescer = v2->_coalescer;
    v2->_coalescer = v6;

    v8 = [(CNPublishingSubject *)v2->_coalescer throttle:2 options:v3 schedulerProvider:5.0];
    v9 = +[CNObserver observerWithWeakTarget:v2 resultSelector:"handleCoalescedEvent:"];
    uint64_t v10 = [v8 subscribe:v9];
    coalescingToken = v2->_coalescingToken;
    v2->_coalescingToken = (CNCancelable *)v10;
  }
  return v2;
}

+ (id)makeWorkQueueUsingSchedulerProvider:(id)a3
{
  id v3 = [a3 newSerialSchedulerWithName:@"com.apple.contactsd.BackgroundColorService"];
  id v4 = [objc_alloc((Class)CNQualityOfServiceSchedulerDecorator) initWithScheduler:v3 qualityOfService:2];

  return v4;
}

- (void)handleCoalescedEvent:(id)a3
{
  id v4 = [(BackgroundColorService *)self workQueue];
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_10000D13C;
  v5[3] = &unk_100024B98;
  v5[4] = self;
  [v4 performBlock:v5];
}

- (id)interestedNotifications
{
  v4[0] = @"__ABDataBaseChangedByOtherProcessNotification";
  v4[1] = @"com.apple.datamigrator.migrationDidFinish";
  v2 = +[NSArray arrayWithObjects:v4 count:2];

  return v2;
}

- (void)handleNotificationName:(id)a3
{
  id v4 = a3;
  if (([v4 isEqualToString:@"__ABDataBaseChangedByOtherProcessNotification"] & 1) != 0
    || [v4 isEqualToString:@"com.apple.datamigrator.migrationDidFinish"])
  {
    v5 = [(BackgroundColorService *)self workQueue];
    v6[0] = _NSConcreteStackBlock;
    v6[1] = 3221225472;
    v6[2] = sub_10000D314;
    v6[3] = &unk_100024B98;
    v6[4] = self;
    [v5 performBlock:v6];
  }
}

- (id)fetchContactIdentifiersForContactsMissingBackgroundColors
{
  v2 = objc_opt_new();
  id v4 = objc_alloc((Class)CNContactFetchRequest);
  v27 = CNContactIdentifierKey;
  v5 = +[NSArray arrayWithObjects:&v27 count:1];
  id v6 = [v4 initWithKeysToFetch:v5];

  v7 = +[CNContact predicateForContactsMissingBackgroundColors];
  [v6 setPredicate:v7];

  [v6 setUnifyResults:0];
  v8 = +[CNEnvironment currentEnvironment];
  v9 = [v8 contactStore];

  id v26 = 0;
  v21 = _NSConcreteStackBlock;
  uint64_t v22 = 3221225472;
  v23 = sub_10000D5DC;
  v24 = &unk_100024C68;
  id v10 = v2;
  id v25 = v10;
  unsigned __int8 v11 = [v9 enumerateContactsWithFetchRequest:v6 error:&v26 usingBlock:&v21];
  id v12 = v26;
  if ((v11 & 1) == 0)
  {
    objc_super v13 = +[CNContactsDaemonLogs backgroundColors];
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
      sub_1000160C4((uint64_t)v12, v13, v14, v15, v16, v17, v18, v19);
    }
  }

  return v10;
}

- (id)imageKeysToFetch
{
  v4[0] = CNContactImageDataKey;
  v4[1] = CNContactCropRectKey;
  void v4[2] = CNContactThumbnailImageDataKey;
  v4[3] = CNContactImageBackgroundColorsDataKey;
  v2 = +[NSArray arrayWithObjects:v4 count:4];

  return v2;
}

- (id)fetchContactsWithImageKeysForIdentifiers:(id)a3
{
  id v4 = a3;
  v5 = +[CNEnvironment currentEnvironment];
  id v6 = [v5 contactStore];

  id v7 = objc_alloc((Class)CNContactFetchRequest);
  v8 = [(BackgroundColorService *)self imageKeysToFetch];
  id v9 = [v7 initWithKeysToFetch:v8];

  id v10 = +[CNContact predicateForContactsWithIdentifiers:v4];

  [v9 setPredicate:v10];
  [v9 setUnifyResults:0];
  [v9 setMutableObjects:1];
  id v23 = 0;
  unsigned __int8 v11 = [v6 executeFetchRequest:v9 error:&v23];
  id v12 = v23;
  objc_super v13 = [v11 value];

  if (v13)
  {
    id v14 = v13;
  }
  else
  {
    uint64_t v15 = +[CNContactsDaemonLogs backgroundColors];
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
      sub_100016130((uint64_t)v12, v15, v16, v17, v18, v19, v20, v21);
    }

    id v14 = &__NSArray0__struct;
  }

  return v14;
}

- (void)_updateBackgroundColorIfNeeded:(id)a3 colorAnalyzer:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  id v7 = [v5 thumbnailImageData];
  if (v7
    || ([v5 imageData],
        v8 = objc_claimAutoreleasedReturnValue(),
        [v5 cropRect],
        CNImageUtilsCroppedImageDataFromFullSizeImageData(),
        id v7 = objc_claimAutoreleasedReturnValue(),
        v8,
        v7))
  {
    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3221225472;
    v9[2] = sub_10000D964;
    v9[3] = &unk_100024C90;
    id v10 = v5;
    [v6 getBackgroundColorOnImageData:v7 bitmapFormat:0 reply:v9];
  }
}

- (void)batchUpdateBackgroundColorsForContactIdentifiers:(id)a3
{
  id v30 = a3;
  uint64_t v40 = 0;
  v41 = &v40;
  uint64_t v42 = 0x2050000000;
  id v10 = (void *)qword_10002CA40;
  uint64_t v43 = qword_10002CA40;
  if (!qword_10002CA40)
  {
    *(void *)buf = _NSConcreteStackBlock;
    *(void *)&buf[8] = 3221225472;
    *(void *)&buf[16] = sub_10000E210;
    v45 = &unk_1000246C0;
    v46 = &v40;
    sub_10000E210((uint64_t)buf, v3, v4, v5, v6, v7, v8, v9, v29);
    id v10 = (void *)v41[3];
  }
  id v11 = v10;
  _Block_object_dispose(&v40, 8);
  v31 = objc_opt_new();
  id v12 = +[CNEnvironment currentEnvironment];
  v32 = [v12 contactStore];

  v33 = objc_msgSend(v30, "_cn_balancedSlicesWithMaximumCount:", objc_msgSend((id)objc_opt_class(), "batchSize"));
  objc_super v13 = 0;
  v34 = (char *)[v33 count] - 1;
  do
  {
    uint64_t v15 = +[CNContactsDaemonLogs backgroundColors];
    os_signpost_id_t v16 = os_signpost_id_generate(v15);

    uint64_t v17 = +[CNContactsDaemonLogs backgroundColors];
    uint64_t v18 = v17;
    if (v16 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v17))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v18, OS_SIGNPOST_INTERVAL_BEGIN, v16, "Batched Background Color calculation", (const char *)&unk_100022906, buf, 2u);
    }

    uint64_t v19 = [v33 objectAtIndexedSubscript:v13];
    uint64_t v20 = [(BackgroundColorService *)self fetchContactsWithImageKeysForIdentifiers:v19];
    id v21 = objc_alloc_init((Class)CNSaveRequest);
    [v21 setSuppressChangeNotifications:v34 != v13];
    v37[0] = _NSConcreteStackBlock;
    v37[1] = 3221225472;
    v37[2] = sub_10000DF3C;
    v37[3] = &unk_100024CB8;
    v37[4] = self;
    id v22 = v31;
    id v38 = v22;
    id v23 = v21;
    id v39 = v23;
    objc_msgSend(v20, "_cn_each:", v37);
    id v36 = 0;
    unsigned __int8 v24 = [v32 executeSaveRequest:v23 error:&v36];
    id v25 = v36;
    if ((v24 & 1) == 0)
    {
      id v26 = +[CNContactsDaemonLogs backgroundColors];
      if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412546;
        *(void *)&buf[4] = v20;
        *(_WORD *)&buf[12] = 2112;
        *(void *)&buf[14] = v25;
        _os_log_error_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_ERROR, "Failed to save background colors to contacts %@ with error %@", buf, 0x16u);
      }
    }
    v27 = +[CNContactsDaemonLogs backgroundColors];
    v28 = v27;
    if (v16 - 1 < 0xFFFFFFFFFFFFFFFELL && os_signpost_enabled(v27))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v28, OS_SIGNPOST_INTERVAL_END, v16, "Batched Background Color calculation", (const char *)&unk_100022906, buf, 2u);
    }

    ++v13;
  }
  while (v13 <= v34);
}

- (CNPublishingSubject)coalescer
{
  return self->_coalescer;
}

- (void)setCoalescer:(id)a3
{
}

- (CNCancelable)coalescingToken
{
  return self->_coalescingToken;
}

- (void)setCoalescingToken:(id)a3
{
}

- (CNScheduler)workQueue
{
  return self->_workQueue;
}

- (CNInhibitor)coalescingInhibitor
{
  return self->_coalescingInhibitor;
}

- (void)setCoalescingInhibitor:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_coalescingInhibitor, 0);
  objc_storeStrong((id *)&self->_workQueue, 0);
  objc_storeStrong((id *)&self->_coalescingToken, 0);

  objc_storeStrong((id *)&self->_coalescer, 0);
}

@end