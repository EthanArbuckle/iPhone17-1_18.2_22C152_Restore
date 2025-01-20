@interface PDAnalytics
+ (id)dateFormatter;
- (AMSMetrics)metricsController;
- (BOOL)optInToDnUiOS;
- (BOOL)shouldRecordEvent;
- (BOOL)uuidNeedsRegeneration:(id)a3;
- (NSDictionary)baseValues;
- (PDAnalytics)init;
- (id)generateRotatingUUID:(id)a3;
- (id)temporaryUserUUID:(id)a3;
- (int64_t)countOf:(Class)a3 fromDB:(id)a4;
- (void)setBaseValues:(id)a3;
- (void)setMetricsController:(id)a3;
- (void)setOptInToDnUiOS:(BOOL)a3;
- (void)setupDnUStatusOniOS;
@end

@implementation PDAnalytics

+ (id)dateFormatter
{
  if (qword_10023E588 != -1) {
    dispatch_once(&qword_10023E588, &stru_1001F3CD0);
  }
  v2 = (void *)qword_10023E580;

  return v2;
}

- (PDAnalytics)init
{
  v5.receiver = self;
  v5.super_class = (Class)PDAnalytics;
  v2 = [(PDAnalytics *)&v5 init];
  v3 = v2;
  if (v2) {
    [(PDAnalytics *)v2 setupDnUStatusOniOS];
  }
  return v3;
}

- (NSDictionary)baseValues
{
  baseValues = self->_baseValues;
  if (!baseValues)
  {
    v13[0] = @"app";
    v4 = +[NSBundle mainBundle];
    objc_super v5 = [v4 bundleIdentifier];
    v14[0] = v5;
    v13[1] = @"appVersion";
    v6 = +[NSBundle mainBundle];
    v7 = [v6 objectForInfoDictionaryKey:@"CFBundleShortVersionString"];
    v14[1] = v7;
    v13[2] = @"isSharedIPad";
    v8 = +[NSNumber numberWithBool:sub_1000FA31C()];
    v14[2] = v8;
    v13[3] = @"baseVersion";
    v9 = +[NSNumber numberWithInt:1];
    v14[3] = v9;
    v10 = +[NSDictionary dictionaryWithObjects:v14 forKeys:v13 count:4];
    v11 = self->_baseValues;
    self->_baseValues = v10;

    baseValues = self->_baseValues;
  }

  return baseValues;
}

- (AMSMetrics)metricsController
{
  metricsController = self->_metricsController;
  if (!metricsController)
  {
    id v5 = objc_alloc((Class)AMSMetrics);
    uint64_t v6 = sub_100044EB4();
    v7 = (void *)v6;
    if (v6) {
      v8 = *(void **)(v6 + 8);
    }
    else {
      v8 = 0;
    }
    id v9 = v8;
    v10 = [v9 profile];
    uint64_t v11 = sub_100044EB4();
    v12 = (void *)v11;
    if (v11) {
      v13 = *(void **)(v11 + 8);
    }
    else {
      v13 = 0;
    }
    id v14 = v13;
    v15 = (AMSMetrics *)[v5 initWithContainerID:v10 bag:v14];
    v16 = self->_metricsController;
    self->_metricsController = v15;

    metricsController = self->_metricsController;
  }

  return metricsController;
}

- (BOOL)shouldRecordEvent
{
  if (self->disableAnalyticsCollection) {
    return 0;
  }
  else {
    return [(PDAnalytics *)self optInToDnUiOS];
  }
}

- (void)setupDnUStatusOniOS
{
  [(PDAnalytics *)self setOptInToDnUiOS:DiagnosticLogSubmissionEnabled()];
  CLSInitLog();
  v3 = (void *)CLSLogDefault;
  if (os_log_type_enabled(CLSLogDefault, OS_LOG_TYPE_INFO))
  {
    v4 = v3;
    unsigned int v5 = [(PDAnalytics *)self optInToDnUiOS];
    CFStringRef v6 = @"DISABLED";
    if (v5) {
      CFStringRef v6 = @"ENABLED";
    }
    int v7 = 138412290;
    CFStringRef v8 = v6;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "D&U results: %@", (uint8_t *)&v7, 0xCu);
  }
}

- (int64_t)countOf:(Class)a3 fromDB:(id)a4
{
  return (int64_t)[a4 count:a3 where:0 bindings:0];
}

- (id)temporaryUserUUID:(id)a3
{
  id v4 = a3;
  unsigned int v5 = sub_100006D08(v4, @"PDRotatingAnalyticsUserID");
  if (!v5 || [(PDAnalytics *)self uuidNeedsRegeneration:v5])
  {
    uint64_t v6 = [(PDAnalytics *)self generateRotatingUUID:v4];

    unsigned int v5 = (void *)v6;
  }

  return v5;
}

- (id)generateRotatingUUID:(id)a3
{
  id v3 = a3;
  id v4 = +[PDAnalytics dateFormatter];
  unsigned int v5 = +[NSDate now];
  uint64_t v6 = [v4 stringFromDate:v5];

  int v7 = +[NSUUID UUID];
  CFStringRef v8 = [v7 UUIDString];
  id v9 = +[NSString stringWithFormat:@"%@*%@", v6, v8];

  sub_10016018C(v3, v9, @"PDRotatingAnalyticsUserID");

  return v9;
}

- (BOOL)uuidNeedsRegeneration:(id)a3
{
  id v3 = [a3 componentsSeparatedByString:@"*"];
  id v4 = [v3 objectAtIndex:0];

  unsigned int v5 = +[PDAnalytics dateFormatter];
  uint64_t v6 = [v5 dateFromString:v4];
  int v7 = +[NSCalendar currentCalendar];
  unsigned __int8 v8 = [v7 isDateInToday:v6];

  return v8 ^ 1;
}

- (void)setBaseValues:(id)a3
{
}

- (void)setMetricsController:(id)a3
{
}

- (BOOL)optInToDnUiOS
{
  return self->_optInToDnUiOS;
}

- (void)setOptInToDnUiOS:(BOOL)a3
{
  self->_optInToDnUiOS = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_metricsController, 0);

  objc_storeStrong((id *)&self->_baseValues, 0);
}

@end