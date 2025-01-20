@interface HTFenceAssertion
- (HTFenceAssertion)initWithFenceName:(unint64_t)a3;
- (void)blown;
- (void)invalidate;
@end

@implementation HTFenceAssertion

- (HTFenceAssertion)initWithFenceName:(unint64_t)a3
{
  v16.receiver = self;
  v16.super_class = (Class)HTFenceAssertion;
  v4 = [(HTFenceAssertion *)&v16 init];
  v5 = v4;
  if (!v4) {
    goto LABEL_7;
  }
  v4->__name = a3;
  v4->__startTime = mach_absolute_time();
  if (qword_10001A238 != -1) {
    dispatch_once(&qword_10001A238, &stru_100014BB0);
  }
  v6 = +[HTPrefs sharedPrefs];
  unsigned __int8 v7 = [v6 hangtracerDaemonEnabled];

  if ((v7 & 1) == 0)
  {
    v12 = shared_ht_log_handle();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG)) {
      sub_10000C050();
    }
    goto LABEL_12;
  }
  v8 = +[HTPrefs sharedPrefs];
  unsigned __int8 v9 = [v8 fenceTrackingEnabled];

  if ((v9 & 1) == 0)
  {
    v12 = shared_ht_log_handle();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG)) {
      sub_10000C01C();
    }
LABEL_12:

    v11 = 0;
    goto LABEL_13;
  }
  sub_100009E8C();
  v10 = sub_100009ED4();
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100009F28;
  block[3] = &unk_100014568;
  v15 = v5;
  dispatch_async(v10, block);

LABEL_7:
  v11 = v5;
LABEL_13:

  return v11;
}

- (void)invalidate
{
  uint64_t v3 = mach_absolute_time();
  v4 = sub_100009ED4();
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_10000A0AC;
  v5[3] = &unk_100014B10;
  v5[4] = self;
  v5[5] = v3;
  dispatch_async(v4, v5);
}

- (void)blown
{
  uint64_t v3 = mach_absolute_time();
  v4 = sub_100009ED4();
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_10000A234;
  v5[3] = &unk_100014B10;
  v5[4] = self;
  v5[5] = v3;
  dispatch_async(v4, v5);
}

@end