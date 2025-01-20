@interface GEOAPServiceLocal
- (void)flushEvalData;
- (void)flushUploadHistoryWithCompletion:(id)a3;
- (void)reportDailySettings:(id)a3 completion:(id)a4;
- (void)reportDailyUsageCountType:(int)a3 usageString:(id)a4 usageBool:(id)a5 appId:(id)a6 completion:(id)a7;
- (void)reportLogMsg:(id)a3 uploadBatchId:(unint64_t)a4 completion:(id)a5;
- (void)runAggregationTasks;
- (void)setEvalMode:(BOOL)a3;
- (void)showEvalDataWithVisitorBlock:(id)a3;
- (void)showHistoryOfAge:(unsigned int)a3 withVisitorBlock:(id)a4 completion:(id)a5;
- (void)showInflightUploadsWithVisitorBlock:(id)a3 completion:(id)a4;
- (void)showUploadCounts:(id)a3;
- (void)streamWithLogMsgBlock:(id)a3 dailyUsageBlock:(id)a4 monthlyUsageBlock:(id)a5;
@end

@implementation GEOAPServiceLocal

- (void)reportLogMsg:(id)a3 uploadBatchId:(unint64_t)a4 completion:(id)a5
{
  id v7 = a5;
  id v8 = a3;
  v9 = sub_100003928();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
  {
    int v12 = 136315138;
    v13 = "-[GEOAPServiceLocal reportLogMsg:uploadBatchId:completion:]";
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEBUG, "%s", (uint8_t *)&v12, 0xCu);
  }

  sub_10000397C();
  v10 = (unsigned char *)objc_claimAutoreleasedReturnValue();
  v11 = dispatch_get_global_queue(21, 0);
  sub_100004750(v10, v8, a4, v11, v7);
}

- (void)reportDailyUsageCountType:(int)a3 usageString:(id)a4 usageBool:(id)a5 appId:(id)a6 completion:(id)a7
{
  uint64_t v10 = *(void *)&a3;
  id v11 = a7;
  id v12 = a6;
  id v13 = a5;
  id v14 = a4;
  v15 = sub_100003928();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136315138;
    v22 = "-[GEOAPServiceLocal reportDailyUsageCountType:usageString:usageBool:appId:completion:]";
    _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEBUG, "%s", buf, 0xCu);
  }

  sub_10000397C();
  v16 = (unsigned char *)objc_claimAutoreleasedReturnValue();
  v17 = dispatch_get_global_queue(21, 0);
  v19[0] = _NSConcreteStackBlock;
  v19[1] = 3221225472;
  v19[2] = sub_100005100;
  v19[3] = &unk_1000286F0;
  id v20 = v11;
  id v18 = v11;
  sub_1000039D4(v16, v10, v14, v13, v12, v17, v19);
}

- (void)reportDailySettings:(id)a3 completion:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  id v7 = sub_10000397C();
  id v8 = dispatch_get_global_queue(21, 0);
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_100005C4C;
  v10[3] = &unk_1000286F0;
  id v11 = v5;
  id v9 = v5;
  sub_100019928(v7, v6, v8, v10);
}

- (void)setEvalMode:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = +[GEOAPPersistence sharedInstance];
  [v4 setEvalMode:v3];
}

- (void)flushEvalData
{
  id v2 = +[GEOAPPersistence sharedInstance];
  [v2 flushEvalData];
}

- (void)showEvalDataWithVisitorBlock:(id)a3
{
  id v3 = a3;
  id v4 = +[GEOAPPersistence sharedInstance];
  [v4 showEvalDataWithVisitorBlock:v3];
}

- (void)streamWithLogMsgBlock:(id)a3 dailyUsageBlock:(id)a4 monthlyUsageBlock:(id)a5
{
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_FAULT)) {
    sub_10001A5BC();
  }
}

- (void)runAggregationTasks
{
  sub_1000085E8();
  id v2 = (id *)objc_claimAutoreleasedReturnValue();
  sub_10000B53C(v2);

  id v3 = +[GEOAPNetEventAggregator sharedAggregator];
  [v3 runAggregation];
}

- (void)showInflightUploadsWithVisitorBlock:(id)a3 completion:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  id v7 = +[GEOAPDebugPersistence sharedInstance];
  [v7 showInflightUploadsWithVisitorBlock:v6 completion:v5];
}

- (void)showHistoryOfAge:(unsigned int)a3 withVisitorBlock:(id)a4 completion:(id)a5
{
  uint64_t v6 = *(void *)&a3;
  id v7 = a5;
  id v8 = a4;
  id v9 = +[GEOAPDebugPersistence sharedInstance];
  [v9 showHistoryOfAge:v6 withVisitorBlock:v8 completion:v7];
}

- (void)flushUploadHistoryWithCompletion:(id)a3
{
  id v3 = a3;
  id v4 = +[GEOAPDebugPersistence sharedInstance];
  [v4 deleteAllHistory];

  id v5 = dispatch_get_global_queue(21, 0);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100005FD0;
  block[3] = &unk_1000286F0;
  id v8 = v3;
  id v6 = v3;
  dispatch_async(v5, block);
}

- (void)showUploadCounts:(id)a3
{
  id v3 = a3;
  id v4 = +[GEOAPDebugPersistence sharedInstance];
  [v4 showUploadCounts:v3];
}

@end