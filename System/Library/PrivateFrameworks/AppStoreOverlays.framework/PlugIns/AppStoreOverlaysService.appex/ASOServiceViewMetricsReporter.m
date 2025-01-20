@interface ASOServiceViewMetricsReporter
+ (id)log;
- (ASCMetrics)metrics;
- (ASCMetricsActivity)activity;
- (ASOServiceViewMetricsReporter)initWithActivity:(id)a3;
- (ASOServiceViewMetricsReporter)initWithMetrics:(id)a3 activity:(id)a4;
- (void)recordCampaignToken:(id)a3 providerToken:(id)a4 withLockup:(id)a5;
- (void)reportAppearWithViewMetrics:(id)a3;
- (void)reportClickWithViewMetrics:(id)a3;
- (void)reportDisappearWithViewMetrics:(id)a3;
- (void)reportInvocationPoint:(id)a3 viewMetrics:(id)a4;
- (void)setActivity:(id)a3;
@end

@implementation ASOServiceViewMetricsReporter

+ (id)log
{
  if (qword_10002CB70 != -1) {
    dispatch_once(&qword_10002CB70, &stru_1000252C8);
  }
  v2 = (void *)qword_10002CB78;

  return v2;
}

- (ASOServiceViewMetricsReporter)initWithMetrics:(id)a3 activity:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)ASOServiceViewMetricsReporter;
  v9 = [(ASOServiceViewMetricsReporter *)&v12 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_metrics, a3);
    objc_storeStrong((id *)&v10->_activity, a4);
  }

  return v10;
}

- (ASOServiceViewMetricsReporter)initWithActivity:(id)a3
{
  id v4 = a3;
  v5 = +[ASCMetrics sharedMetrics];
  v6 = [(ASOServiceViewMetricsReporter *)self initWithMetrics:v5 activity:v4];

  return v6;
}

- (void)setActivity:(id)a3
{
  id v4 = (ASCMetricsActivity *)a3;
  v5 = +[ASOServiceViewMetricsReporter log];
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)id v7 = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "Updating metrics activity", v7, 2u);
  }

  activity = self->_activity;
  self->_activity = v4;
}

- (void)reportAppearWithViewMetrics:(id)a3
{
}

- (void)reportDisappearWithViewMetrics:(id)a3
{
}

- (void)reportClickWithViewMetrics:(id)a3
{
}

- (void)recordCampaignToken:(id)a3 providerToken:(id)a4 withLockup:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v11 = +[ASOServiceViewMetricsReporter log];
  if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
  {
    int v14 = 138478339;
    id v15 = v8;
    __int16 v16 = 2113;
    id v17 = v9;
    __int16 v18 = 2113;
    id v19 = v10;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_INFO, "Recording campaignToken=%{private}@ providerToken=%{private}@ for lockup: %{private}@", (uint8_t *)&v14, 0x20u);
  }

  objc_super v12 = [(ASOServiceViewMetricsReporter *)self metrics];
  id v13 = [v12 recordCampaignToken:v8 providerToken:v9 withLockup:v10];
}

- (void)reportInvocationPoint:(id)a3 viewMetrics:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = +[ASOServiceViewMetricsReporter log];
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "Acquiring post events process assertion", buf, 2u);
  }

  id v9 = [[ASOKeepAlive alloc] initWithName:@"ViewService.postEvents" explanation:@"Acquiring post events process assertion"];
  [(ASOKeepAlive *)v9 acquire];
  id v10 = +[ASOServiceViewMetricsReporter log];
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138543874;
    v26 = self;
    __int16 v27 = 2114;
    id v28 = v6;
    __int16 v29 = 2114;
    id v30 = v7;
    _os_log_debug_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEBUG, "%{public}@ posting %{public}@ metrics of %{public}@", buf, 0x20u);
  }

  v11 = [(ASOServiceViewMetricsReporter *)self metrics];
  objc_super v12 = [(ASOServiceViewMetricsReporter *)self activity];
  id v13 = [v11 processViewMetrics:v7 atInvocationPoint:v6 withActivity:v12];

  objc_initWeak((id *)buf, self);
  v22[0] = _NSConcreteStackBlock;
  v22[1] = 3221225472;
  v22[2] = sub_10000CBCC;
  v22[3] = &unk_1000252F0;
  objc_copyWeak(&v24, (id *)buf);
  id v14 = v6;
  id v23 = v14;
  [v13 addSuccessBlock:v22];
  v19[0] = _NSConcreteStackBlock;
  v19[1] = 3221225472;
  v19[2] = sub_10000CC20;
  v19[3] = &unk_100025318;
  objc_copyWeak(&v21, (id *)buf);
  id v15 = v14;
  id v20 = v15;
  [v13 addErrorBlock:v19];
  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472;
  v17[2] = sub_10000CC8C;
  v17[3] = &unk_100024D98;
  __int16 v16 = v9;
  __int16 v18 = v16;
  [v13 addFinishBlock:v17];

  objc_destroyWeak(&v21);
  objc_destroyWeak(&v24);
  objc_destroyWeak((id *)buf);
}

- (ASCMetricsActivity)activity
{
  return self->_activity;
}

- (ASCMetrics)metrics
{
  return self->_metrics;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_metrics, 0);

  objc_storeStrong((id *)&self->_activity, 0);
}

@end