@interface SecureClock
+ (id)_dateFormatter;
+ (id)_dateFromHeaderValue:(id)a3;
+ (id)_global;
+ (id)_hashForServerDate:(double)a3 systemUptime:(double)a4;
+ (id)_persistentStatePath;
+ (id)now;
+ (void)synchronizeWithURLResult:(id)a3;
- (double)_timeIntervalSinceLastServerResponse;
- (id)_currentTime;
- (id)_currentTimeSynchronized;
- (id)_init;
- (void)_logState;
- (void)_readState;
- (void)_synchronizeWithURLResult:(id)a3;
- (void)_writeState;
@end

@implementation SecureClock

+ (id)now
{
  v2 = [a1 _global];
  v3 = [v2 _currentTimeSynchronized];

  return v3;
}

+ (void)synchronizeWithURLResult:(id)a3
{
  id v4 = a3;
  id v5 = [a1 _global];
  [v5 _synchronizeWithURLResult:v4];
}

+ (id)_global
{
  if (qword_10039FBF0 != -1) {
    dispatch_once(&qword_10039FBF0, &stru_100358F30);
  }
  v2 = (void *)qword_10039FBE8;

  return v2;
}

+ (id)_dateFormatter
{
  if (qword_10039FC00 != -1) {
    dispatch_once(&qword_10039FC00, &stru_100358F50);
  }
  v2 = (void *)qword_10039FBF8;

  return v2;
}

+ (id)_dateFromHeaderValue:(id)a3
{
  id v4 = a3;
  id v5 = [a1 _dateFormatter];
  v6 = [v5 dateFromString:v4];

  return v6;
}

+ (id)_hashForServerDate:(double)a3 systemUptime:(double)a4
{
  v10[0] = 0;
  v10[1] = 0;
  *(double *)data = a3;
  *(double *)&data[1] = a4;
  id v4 = +[AMSDevice sk_bootSession];
  id v5 = v4;
  if (v4)
  {
    [v4 getUUIDBytes:v10];
    memset(v8, 0, sizeof(v8));
    CC_SHA256(data, 0x20u, (unsigned __int8 *)v8);
    v6 = +[NSData dataWithBytes:v8 length:32];
  }
  else
  {
    if (qword_10039FC50 != -1) {
      dispatch_once(&qword_10039FC50, &stru_100358F98);
    }
    if (os_log_type_enabled((os_log_t)qword_10039FC08, OS_LOG_TYPE_ERROR)) {
      sub_1002C4120();
    }
    v6 = 0;
  }

  return v6;
}

+ (id)_persistentStatePath
{
  v2 = +[NSFileManager defaultManager];
  v3 = objc_msgSend(v2, "sk_persistedDataURL");
  id v4 = [v3 URLByAppendingPathComponent:@"sc" isDirectory:0];

  return v4;
}

- (id)_init
{
  v7.receiver = self;
  v7.super_class = (Class)SecureClock;
  v2 = [(SecureClock *)&v7 init];
  if (v2)
  {
    uint64_t v3 = objc_opt_new();
    lock = v2->_lock;
    v2->_lock = (UnfairLock *)v3;

    lastServerDate = v2->_lastServerDate;
    v2->_lastServerDate = 0;

    v2->_uptimeAtLastServerResponse = INFINITY;
  }
  return v2;
}

- (void)_synchronizeWithURLResult:(id)a3
{
  id v4 = a3;
  id v5 = +[NSProcessInfo processInfo];
  [v5 systemUptime];
  uint64_t v7 = v6;

  v8 = [v4 responseHeaders];
  v9 = objc_msgSend(v8, "tcr_stringForKey:", @"date");

  if (!v9) {
    goto LABEL_5;
  }
  v10 = [v4 response];
  v11 = [v10 URL];
  v12 = [v11 scheme];
  unsigned int v13 = [v12 isEqualToString:@"https"];

  if (v13)
  {
    v14 = +[SecureClock _dateFromHeaderValue:v9];
    v15 = v14;
    if (v14)
    {
      lock = self->_lock;
      v19[0] = _NSConcreteStackBlock;
      v19[1] = 3221225472;
      v19[2] = sub_100056A94;
      v19[3] = &unk_100358F78;
      v19[4] = self;
      uint64_t v21 = v7;
      id v20 = v14;
      sub_10006B9F0(lock, v19);
    }
    else
    {
      if (qword_10039FC50 != -1) {
        dispatch_once(&qword_10039FC50, &stru_100358F98);
      }
      v18 = (void *)qword_10039FC08;
      if (os_log_type_enabled((os_log_t)qword_10039FC08, OS_LOG_TYPE_ERROR)) {
        sub_1002C41F8(v18, v4, (uint64_t)v9);
      }
    }
  }
  else
  {
LABEL_5:
    if (qword_10039FC50 != -1) {
      dispatch_once(&qword_10039FC50, &stru_100358F98);
    }
    v17 = (void *)qword_10039FC08;
    if (os_log_type_enabled((os_log_t)qword_10039FC08, OS_LOG_TYPE_ERROR)) {
      sub_1002C4154(v17, v4);
    }
  }
  [(SecureClock *)self _logState];
}

- (void)_writeState
{
  [(NSDate *)self->_lastServerDate timeIntervalSinceReferenceDate];
  uint64_t v3 = +[SecureClock _hashForServerDate:systemUptime:](SecureClock, "_hashForServerDate:systemUptime:");
  if (v3)
  {
    memset(v11, 0, sizeof(v11));
    [(NSDate *)self->_lastServerDate timeIntervalSinceReferenceDate];
    double uptimeAtLastServerResponse = self->_uptimeAtLastServerResponse;
    v10[0] = v5;
    *(double *)&v10[1] = uptimeAtLastServerResponse;
    [v3 getBytes:v11 length:32];
    uint64_t v6 = +[NSData dataWithBytes:v10 length:48];
    uint64_t v7 = +[SecureClock _persistentStatePath];
    id v9 = 0;
    [v6 writeToURL:v7 options:1 error:&v9];
    id v8 = v9;

    if (v8)
    {
      if (qword_10039FC50 != -1) {
        dispatch_once(&qword_10039FC50, &stru_100358F98);
      }
      if (os_log_type_enabled((os_log_t)qword_10039FC08, OS_LOG_TYPE_ERROR)) {
        sub_1002C42E8();
      }
    }
    else
    {
      [(SecureClock *)self _logState];
    }
  }
  else
  {
    if (qword_10039FC50 != -1) {
      dispatch_once(&qword_10039FC50, &stru_100358F98);
    }
    if (os_log_type_enabled((os_log_t)qword_10039FC08, OS_LOG_TYPE_ERROR)) {
      sub_1002C42B4();
    }
  }
}

- (void)_readState
{
  uint64_t v3 = +[SecureClock _persistentStatePath];
  id v14 = 0;
  id v4 = +[NSData dataWithContentsOfURL:v3 options:0 error:&v14];
  id v5 = v14;

  if (v5)
  {
    if (qword_10039FC50 != -1) {
      dispatch_once(&qword_10039FC50, &stru_100358F98);
    }
    if (os_log_type_enabled((os_log_t)qword_10039FC08, OS_LOG_TYPE_ERROR)) {
      sub_1002C43C4();
    }
    goto LABEL_26;
  }
  if (v4 && [v4 length] == (id)48)
  {
    memset(v16, 0, sizeof(v16));
    long long v15 = 0u;
    [v4 getBytes:&v15 length:48];
    uint64_t v6 = +[SecureClock _hashForServerDate:systemUptime:](SecureClock, "_hashForServerDate:systemUptime:", v15);
    if (!v6)
    {
      if (qword_10039FC50 != -1) {
        dispatch_once(&qword_10039FC50, &stru_100358F98);
      }
      if (os_log_type_enabled((os_log_t)qword_10039FC08, OS_LOG_TYPE_ERROR)) {
        sub_1002C435C();
      }
      goto LABEL_25;
    }
    uint64_t v7 = +[NSData dataWithBytes:v16 length:32];
    if ([v6 isEqualToData:v7])
    {
      double v8 = *((double *)&v15 + 1);
      id v9 = +[NSProcessInfo processInfo];
      [v9 systemUptime];
      double v11 = v10;

      if (v8 < v11)
      {
        v12 = +[NSDate dateWithTimeIntervalSinceReferenceDate:*(double *)&v15];
        lastServerDate = self->_lastServerDate;
        self->_lastServerDate = v12;

        self->_double uptimeAtLastServerResponse = *((double *)&v15 + 1);
        [(SecureClock *)self _logState];
LABEL_25:

        goto LABEL_26;
      }
    }
    else
    {
    }
    if (qword_10039FC50 != -1) {
      dispatch_once(&qword_10039FC50, &stru_100358F98);
    }
    if (os_log_type_enabled((os_log_t)qword_10039FC08, OS_LOG_TYPE_ERROR)) {
      sub_1002C4390();
    }
    goto LABEL_25;
  }
  if (qword_10039FC50 != -1) {
    dispatch_once(&qword_10039FC50, &stru_100358F98);
  }
  if (os_log_type_enabled((os_log_t)qword_10039FC08, OS_LOG_TYPE_ERROR)) {
    sub_1002C435C();
  }
LABEL_26:
}

- (id)_currentTime
{
  [(SecureClock *)self _timeIntervalSinceLastServerResponse];
  lastServerDate = self->_lastServerDate;

  return -[NSDate dateByAddingTimeInterval:](lastServerDate, "dateByAddingTimeInterval:");
}

- (id)_currentTimeSynchronized
{
  uint64_t v6 = 0;
  uint64_t v7 = &v6;
  uint64_t v8 = 0x3032000000;
  id v9 = sub_1000570C8;
  double v10 = sub_1000570D8;
  id v11 = 0;
  lock = self->_lock;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_1000570E0;
  v5[3] = &unk_1003571D0;
  v5[4] = self;
  v5[5] = &v6;
  sub_10006B9F0(lock, v5);
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return v3;
}

- (double)_timeIntervalSinceLastServerResponse
{
  id v3 = +[NSProcessInfo processInfo];
  [v3 systemUptime];
  double v5 = v4 - self->_uptimeAtLastServerResponse;

  return v5;
}

- (void)_logState
{
  if (os_variant_has_internal_content())
  {
    if (qword_10039FC50 != -1) {
      dispatch_once(&qword_10039FC50, &stru_100358F98);
    }
    id v3 = (void *)qword_10039FC08;
    if (os_log_type_enabled((os_log_t)qword_10039FC08, OS_LOG_TYPE_DEFAULT))
    {
      double v4 = v3;
      double v5 = [(SecureClock *)self _currentTime];
      uint64_t v6 = +[NSDate date];
      [(SecureClock *)self _timeIntervalSinceLastServerResponse];
      uint64_t v8 = v7;
      id v9 = +[NSProcessInfo processInfo];
      [v9 systemUptime];
      int v11 = 138544130;
      v12 = v5;
      __int16 v13 = 2114;
      id v14 = v6;
      __int16 v15 = 2050;
      uint64_t v16 = v8;
      __int16 v17 = 2050;
      uint64_t v18 = v10;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "[SC] Secure Clock State: SecureClock(%{public}@) SystemClock(%{public}@) SecondsSinceLastResponse(%{public}f) Uptime(%{public}f)", (uint8_t *)&v11, 0x2Au);
    }
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lastServerDate, 0);

  objc_storeStrong((id *)&self->_lock, 0);
}

@end