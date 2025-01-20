@interface ADInstrumentationResolver
- (ADInstrumentationResolver)init;
- (ADInstrumentationResolver)initWithQueue:(id)a3;
- (id)wallClockTimeForTimestamp:(unint64_t)a3;
- (void)buildDeviceDynamicContextRelativeToTimestamp:(unint64_t)a3 withCompletion:(id)a4;
- (void)logInstrumentationOfType:(id)a3 machAbsoluteTime:(unint64_t)a4 turnIdentifier:(id)a5;
@end

@implementation ADInstrumentationResolver

- (void).cxx_destruct
{
}

- (id)wallClockTimeForTimestamp:(unint64_t)a3
{
  v3 = +[NSDate date];
  mach_absolute_time();
  AFMachAbsoluteTimeGetTimeInterval();
  double v5 = v4;
  AFMachAbsoluteTimeGetTimeInterval();
  v7 = +[NSDate dateWithTimeInterval:v3 sinceDate:v6 - v5];

  return v7;
}

- (void)buildDeviceDynamicContextRelativeToTimestamp:(unint64_t)a3 withCompletion:(id)a4
{
  id v6 = a4;
  v7 = [(ADInstrumentationResolver *)self wallClockTimeForTimestamp:a3];
  id v8 = objc_alloc_init((Class)SISchemaDeviceDynamicContext);
  [v7 timeIntervalSince1970];
  objc_msgSend(v8, "setTimeIntervalSince1970:");
  v9 = +[ADCommandCenter sharedCommandCenter];
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_10021457C;
  v12[3] = &unk_100506FC0;
  id v13 = v8;
  v14 = self;
  id v15 = v6;
  id v10 = v6;
  id v11 = v8;
  [v9 fetchLastLocationWithCompletion:v12];
}

- (void)logInstrumentationOfType:(id)a3 machAbsoluteTime:(unint64_t)a4 turnIdentifier:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  if (!v8)
  {
    id v13 = AFSiriLogContextAnalytics;
    if (!os_log_type_enabled(AFSiriLogContextAnalytics, OS_LOG_TYPE_ERROR)) {
      goto LABEL_7;
    }
    *(_DWORD *)buf = 136315138;
    v22 = "-[ADInstrumentationResolver logInstrumentationOfType:machAbsoluteTime:turnIdentifier:]";
    v14 = "%s Nil instrumentation class provided";
    id v15 = v13;
    uint32_t v16 = 12;
LABEL_9:
    _os_log_error_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_ERROR, v14, buf, v16);
    goto LABEL_7;
  }
  id v10 = (objc_class *)objc_opt_class();
  id v11 = NSStringFromClass(v10);
  unsigned int v12 = [v8 isEqualToString:v11];

  if (!v12)
  {
    v17 = AFSiriLogContextAnalytics;
    if (!os_log_type_enabled(AFSiriLogContextAnalytics, OS_LOG_TYPE_ERROR)) {
      goto LABEL_7;
    }
    *(_DWORD *)buf = 136315394;
    v22 = "-[ADInstrumentationResolver logInstrumentationOfType:machAbsoluteTime:turnIdentifier:]";
    __int16 v23 = 2112;
    id v24 = v8;
    v14 = "%s Unsupported instrumentation class provided %@";
    id v15 = v17;
    uint32_t v16 = 22;
    goto LABEL_9;
  }
  v18[0] = _NSConcreteStackBlock;
  v18[1] = 3221225472;
  v18[2] = sub_100214954;
  v18[3] = &unk_100506F98;
  unint64_t v20 = a4;
  id v19 = v9;
  [(ADInstrumentationResolver *)self buildDeviceDynamicContextRelativeToTimestamp:a4 withCompletion:v18];

LABEL_7:
}

- (ADInstrumentationResolver)initWithQueue:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)ADInstrumentationResolver;
  id v6 = [(ADInstrumentationResolver *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_externalQueue, a3);
  }

  return v7;
}

- (ADInstrumentationResolver)init
{
  double v4 = +[NSAssertionHandler currentHandler];
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"ADInstrumentationResolver.m", 56, @"%s is marked as NS_UNAVAILABLE. Use 'initWithQueue:' instead.", "-[ADInstrumentationResolver init]");

  return 0;
}

@end