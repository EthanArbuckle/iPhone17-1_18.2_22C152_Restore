@interface BDSWidgetCenterManager
+ (BDSWidgetCenterManager)sharedInstance;
- (BDSWidgetCenterManager)init;
- (BOOL)shouldDonateRelevance;
- (BUCoalescingCallBlock)coalescingBlock;
- (CHSTimelineController)timelineController;
- (void)reloadWidgetTimelinesWithShouldDonateRelevance:(BOOL)a3;
- (void)setCoalescingBlock:(id)a3;
- (void)setShouldDonateRelevance:(BOOL)a3;
- (void)setTimelineController:(id)a3;
@end

@implementation BDSWidgetCenterManager

+ (BDSWidgetCenterManager)sharedInstance
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100043340;
  block[3] = &unk_10025F9D0;
  block[4] = a1;
  if (qword_100297578 != -1) {
    dispatch_once(&qword_100297578, block);
  }
  v2 = (void *)qword_100297580;
  return (BDSWidgetCenterManager *)v2;
}

- (BDSWidgetCenterManager)init
{
  v16.receiver = self;
  v16.super_class = (Class)BDSWidgetCenterManager;
  v2 = [(BDSWidgetCenterManager *)&v16 init];
  if (v2)
  {
    time_t v3 = time(0);
    srand48(v3);
    objc_initWeak(&location, v2);
    v4 = (CHSTimelineController *)[objc_alloc((Class)CHSTimelineController) initWithExtensionBundleIdentifier:@"com.apple.iBooks.BooksWidget" kind:@"BooksWidget"];
    timelineController = v2->_timelineController;
    v2->_timelineController = v4;

    id v6 = objc_alloc((Class)BUCoalescingCallBlock);
    v10 = _NSConcreteStackBlock;
    uint64_t v11 = 3221225472;
    v12 = sub_1000434D8;
    v13 = &unk_10025FC90;
    objc_copyWeak(&v14, &location);
    v7 = (BUCoalescingCallBlock *)[v6 initWithNotifyBlock:&v10 blockDescription:@"BDSWidgetCenter Timeline Reload"];
    coalescingBlock = v2->_coalescingBlock;
    v2->_coalescingBlock = v7;

    -[BUCoalescingCallBlock setCoalescingDelay:](v2->_coalescingBlock, "setCoalescingDelay:", 2.0, v10, v11, v12, v13);
    objc_destroyWeak(&v14);
    objc_destroyWeak(&location);
  }
  return v2;
}

- (void)reloadWidgetTimelinesWithShouldDonateRelevance:(BOOL)a3
{
  BOOL v3 = a3;
  v5 = +[BUBag defaultBag];
  id v6 = [v5 booksReadingNowWidgetRolloutRate];
  v7 = [v6 valuePromise];
  id v22 = 0;
  v8 = [v7 resultWithTimeout:&v22 error:2.0];
  id v9 = v22;
  [v8 doubleValue];
  double v11 = v10;

  double v12 = drand48();
  BOOL v14 = v12 <= v11 && v9 == 0;
  if (v9)
  {
    double v15 = v12;
    objc_super v16 = sub_10000D068();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 134218754;
      double v24 = v11;
      __int16 v25 = 2048;
      double v26 = v15;
      __int16 v27 = 1024;
      BOOL v28 = v14;
      __int16 v29 = 2112;
      id v30 = v9;
      _os_log_error_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_ERROR, "BDSWidgetCenterManager - failed to retrieve bag key value. Rollout rate: %f, random number: %f, isPassRolloutTest: %d, error: %@", buf, 0x26u);
    }
  }
  [(BDSWidgetCenterManager *)self setShouldDonateRelevance:v3 & v14];
  v17 = [[BDSOSTransaction alloc] initWithTransactionName:"com.apple.bookdatastored.BDSWidgetCenterManager.reloadWidgetTimelinesWithShouldDonateRelevance"];
  v18 = [(BDSWidgetCenterManager *)self coalescingBlock];
  v20[0] = _NSConcreteStackBlock;
  v20[1] = 3221225472;
  v20[2] = sub_1000439E0;
  v20[3] = &unk_10025F700;
  v21 = v17;
  v19 = v17;
  [v18 signalWithCompletion:v20];
}

- (BUCoalescingCallBlock)coalescingBlock
{
  return self->_coalescingBlock;
}

- (void)setCoalescingBlock:(id)a3
{
}

- (CHSTimelineController)timelineController
{
  return self->_timelineController;
}

- (void)setTimelineController:(id)a3
{
}

- (BOOL)shouldDonateRelevance
{
  return self->_shouldDonateRelevance;
}

- (void)setShouldDonateRelevance:(BOOL)a3
{
  self->_shouldDonateRelevance = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_timelineController, 0);
  objc_storeStrong((id *)&self->_coalescingBlock, 0);
}

@end