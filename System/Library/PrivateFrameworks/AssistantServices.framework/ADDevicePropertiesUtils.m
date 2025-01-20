@interface ADDevicePropertiesUtils
+ (int)_SISchemaAppleMediaProductsSubscriptionFrom:(id)a3;
+ (void)fetchActiveSubscriptionsWithQueue:(id)a3 completion:(id)a4;
@end

@implementation ADDevicePropertiesUtils

+ (int)_SISchemaAppleMediaProductsSubscriptionFrom:(id)a3
{
  id v3 = a3;
  id v4 = [v3 statusType];
  if (v4 == (id)1)
  {
    int v5 = 5;
  }
  else if (v4 == (id)2)
  {
    if ([v3 isMatchEnabled]) {
      int v5 = 8;
    }
    else {
      int v5 = 1;
    }
  }
  else
  {
    int v5 = 0;
  }

  return v5;
}

+ (void)fetchActiveSubscriptionsWithQueue:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_DEBUG))
  {
    LODWORD(buf) = 136315138;
    *(void *)((char *)&buf + 4) = "+[ADDevicePropertiesUtils fetchActiveSubscriptionsWithQueue:completion:]";
    _os_log_debug_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEBUG, "%s Retrieving", (uint8_t *)&buf, 0xCu);
  }
  *(void *)&long long buf = 0;
  *((void *)&buf + 1) = &buf;
  uint64_t v36 = 0x3032000000;
  v37 = sub_1002EEE34;
  v38 = sub_1002EEE44;
  id v39 = 0;
  id v9 = objc_alloc((Class)AFOneArgumentSafetyBlock);
  v26[0] = _NSConcreteStackBlock;
  v26[1] = 3221225472;
  v26[2] = sub_1002EEE4C;
  v26[3] = &unk_10050B4F0;
  id v10 = v6;
  id v27 = v10;
  p_long long buf = &buf;
  id v11 = v7;
  id v28 = v11;
  id v12 = [v9 initWithBlock:v26];
  uint64_t v31 = 0;
  v32 = &v31;
  uint64_t v33 = 0x2050000000;
  v13 = (void *)qword_100586240;
  uint64_t v34 = qword_100586240;
  if (!qword_100586240)
  {
    v30[0] = _NSConcreteStackBlock;
    v30[1] = 3221225472;
    v30[2] = sub_1002EEF10;
    v30[3] = &unk_10050E318;
    v30[4] = &v31;
    sub_1002EEF10((uint64_t)v30);
    v13 = (void *)v32[3];
  }
  id v14 = v13;
  _Block_object_dispose(&v31, 8);
  v15 = [v14 sharedStatusController];
  v23[0] = _NSConcreteStackBlock;
  v23[1] = 3221225472;
  v23[2] = sub_1002EF0FC;
  v23[3] = &unk_10050B518;
  id v25 = a1;
  id v16 = v12;
  id v24 = v16;
  [v15 getSubscriptionStatusWithCompletionHandler:v23];
  id v17 = objc_alloc((Class)AFWatchdogTimer);
  v21[0] = _NSConcreteStackBlock;
  v21[1] = 3221225472;
  v21[2] = sub_1002EF294;
  v21[3] = &unk_10050E138;
  id v18 = v16;
  id v22 = v18;
  id v19 = [v17 initWithTimeoutInterval:v10 onQueue:v21 timeoutHandler:3.0];
  v20 = *(void **)(*((void *)&buf + 1) + 40);
  *(void *)(*((void *)&buf + 1) + 40) = v19;

  [*(id *)(*((void *)&buf + 1) + 40) start];
  _Block_object_dispose(&buf, 8);
}

@end