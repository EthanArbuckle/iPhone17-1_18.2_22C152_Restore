@interface BackoffCounter
+ (id)sharedInstance;
- (BOOL)_validateBackoff;
- (BackoffCounter)init;
- (NSError)errorAuthenticationFailedWithBackoff;
- (id)_dateFromUptime:(id)a3;
- (id)_retryTime;
- (id)actionFailure;
- (id)actionFailureWithBackoffResult;
- (void)_computeRetryTime;
- (void)_lockStateDidChange:(BOOL)a3;
- (void)_saveDefault:(id)a3 forKey:(id)a4;
- (void)_saveDefaults;
- (void)actionBackoffWithReply:(id)a3;
- (void)actionFailureWithReply:(id)a3;
- (void)actionSuccess;
- (void)currentBackoffErrorWithReply:(id)a3;
@end

@implementation BackoffCounter

+ (id)sharedInstance
{
  if (qword_20A78 != -1) {
    dispatch_once(&qword_20A78, &stru_1C308);
  }
  v2 = (void *)qword_20A70;

  return v2;
}

- (BackoffCounter)init
{
  v21.receiver = self;
  v21.super_class = (Class)BackoffCounter;
  v2 = [(BackoffCounter *)&v21 init];
  if (v2)
  {
    if (+[DaemonUtils deviceHasSEP])
    {
      uint64_t v3 = MKBGetDeviceLockStateInfo();
      sepLockInfo = v2->_sepLockInfo;
      v2->_sepLockInfo = (NSDictionary *)v3;
    }
    if (!v2->_sepLockInfo)
    {
      uint64_t v5 = +[NSUserDefaults standardUserDefaults];
      defaults = v2->_defaults;
      v2->_defaults = (NSUserDefaults *)v5;

      v7 = [(NSUserDefaults *)v2->_defaults objectForKey:@"failures"];
      v2->_failures = (unint64_t)[v7 unsignedIntegerValue];

      v8 = [(NSUserDefaults *)v2->_defaults objectForKey:@"retryTime"];
      v9 = +[NSDate date];
      [v8 timeIntervalSinceDate:v9];
      double v11 = v10;

      if (v11 > 0.0)
      {
        uint64_t v12 = +[NSNumber numberWithDouble:v11 + (double)sub_44F8()];
        retryUptime = v2->_retryUptime;
        v2->_retryUptime = (NSNumber *)v12;
      }
      v14 = +[DaemonUtils sharedInstance];
      v15 = [v14 serverQueue];
      handler[0] = _NSConcreteStackBlock;
      handler[1] = 3221225472;
      handler[2] = sub_4598;
      handler[3] = &unk_1C330;
      v20 = v2;
      uint32_t v16 = notify_register_dispatch("com.apple.mobile.keybagd.lock_status", (int *)&unk_20A00, v15, handler);

      if (v16)
      {
        v17 = sub_45E0();
        if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 136446466;
          v23 = "com.apple.mobile.keybagd.lock_status";
          __int16 v24 = 1024;
          uint32_t v25 = v16;
          _os_log_impl(&dword_0, v17, OS_LOG_TYPE_DEFAULT, "notify_register_dispatch(%{public}s) failed: %u", buf, 0x12u);
        }
      }
    }
  }
  return v2;
}

- (id)_dateFromUptime:(id)a3
{
  if (a3)
  {
    v4 = +[NSDate dateWithTimeIntervalSinceNow:](NSDate, "dateWithTimeIntervalSinceNow:", (double)((unint64_t)[a3 longValue] - sub_44F8()));
  }
  else
  {
    v4 = 0;
  }
  return v4;
}

- (id)_retryTime
{
  return [(BackoffCounter *)self _dateFromUptime:self->_retryUptime];
}

- (id)actionFailure
{
  uint64_t v3 = sub_45E0();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    int v9 = 136315394;
    *(void *)double v10 = "-[BackoffCounter actionFailure]";
    *(_WORD *)&v10[8] = 2112;
    *(void *)&v10[10] = self;
    _os_log_impl(&dword_0, v3, OS_LOG_TYPE_DEFAULT, "%s  on %@", (uint8_t *)&v9, 0x16u);
  }

  if (!self->_sepLockInfo)
  {
    v4 = sub_45E0();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      unint64_t failures = self->_failures;
      v6 = [(BackoffCounter *)self _retryTime];
      int v9 = 67109378;
      *(_DWORD *)double v10 = failures;
      *(_WORD *)&v10[4] = 2114;
      *(void *)&v10[6] = v6;
      _os_log_impl(&dword_0, v4, OS_LOG_TYPE_DEFAULT, "failures: %d, retryTime: %{public}@", (uint8_t *)&v9, 0x12u);
    }
    ++self->_failures;
    [(BackoffCounter *)self _computeRetryTime];
    [(BackoffCounter *)self _saveDefaults];
  }
  v7 = [(BackoffCounter *)self errorAuthenticationFailedWithBackoff];

  return v7;
}

- (id)actionFailureWithBackoffResult
{
  uint64_t v3 = sub_45E0();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    int v7 = 136315394;
    v8 = "-[BackoffCounter actionFailureWithBackoffResult]";
    __int16 v9 = 2112;
    double v10 = self;
    _os_log_impl(&dword_0, v3, OS_LOG_TYPE_DEFAULT, "%s  on %@", (uint8_t *)&v7, 0x16u);
  }

  if (!self->_sepLockInfo)
  {
    unint64_t failures = self->_failures;
    if (failures <= 5) {
      unint64_t failures = 5;
    }
    self->_unint64_t failures = failures;
  }
  uint64_t v5 = [(BackoffCounter *)self actionFailure];

  return v5;
}

- (void)actionSuccess
{
  uint64_t v3 = sub_45E0();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    int v8 = 136315394;
    *(void *)__int16 v9 = "-[BackoffCounter actionSuccess]";
    *(_WORD *)&v9[8] = 2112;
    *(void *)&v9[10] = self;
    _os_log_impl(&dword_0, v3, OS_LOG_TYPE_DEFAULT, "%s  on %@", (uint8_t *)&v8, 0x16u);
  }

  if (!self->_sepLockInfo)
  {
    v4 = sub_45E0();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      unint64_t failures = self->_failures;
      v6 = [(BackoffCounter *)self _retryTime];
      int v8 = 67109378;
      *(_DWORD *)__int16 v9 = failures;
      *(_WORD *)&v9[4] = 2114;
      *(void *)&v9[6] = v6;
      _os_log_impl(&dword_0, v4, OS_LOG_TYPE_DEFAULT, "failures: %d, retryTime: %{public}@", (uint8_t *)&v8, 0x12u);
    }
    retryUptime = self->_retryUptime;
    self->_retryUptime = 0;
    self->_unint64_t failures = 0;

    [(BackoffCounter *)self _saveDefaults];
  }
}

- (void)actionFailureWithReply:(id)a3
{
  id v5 = a3;
  id v6 = [(BackoffCounter *)self actionFailure];
  (*((void (**)(id, id))a3 + 2))(v5, v6);
}

- (void)actionBackoffWithReply:(id)a3
{
  id v5 = a3;
  id v6 = [(BackoffCounter *)self actionFailureWithBackoffResult];
  (*((void (**)(id, id))a3 + 2))(v5, v6);
}

- (void)currentBackoffErrorWithReply:(id)a3
{
  id v5 = a3;
  id v6 = [(BackoffCounter *)self errorAuthenticationFailedWithBackoff];
  (*((void (**)(id, id))a3 + 2))(v5, v6);
}

- (void)_computeRetryTime
{
  unint64_t failures = self->_failures;
  if (failures > 5)
  {
    unint64_t v4 = failures - 6;
    if (v4 > 4) {
      uint64_t v5 = 3600;
    }
    else {
      uint64_t v5 = qword_18F68[v4];
    }
    self->_retryUptime = +[NSNumber numberWithUnsignedInteger:sub_44F8() + v5];
  }
  else
  {
    self->_retryUptime = 0;
  }

  _objc_release_x1();
}

- (BOOL)_validateBackoff
{
  uint64_t v3 = sub_45E0();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    unint64_t failures = self->_failures;
    uint64_t v5 = [(BackoffCounter *)self _retryTime];
    int v11 = 136315906;
    uint64_t v12 = "-[BackoffCounter _validateBackoff]";
    __int16 v13 = 1024;
    *(_DWORD *)v14 = failures;
    *(_WORD *)&v14[4] = 2114;
    *(void *)&v14[6] = v5;
    *(_WORD *)&v14[14] = 2112;
    *(void *)&v14[16] = self;
    _os_log_impl(&dword_0, v3, OS_LOG_TYPE_DEFAULT, "%s failures: %d, retryTime: %{public}@ on %@", (uint8_t *)&v11, 0x26u);
  }
  if (self->_retryUptime)
  {
    uint64_t v6 = sub_44F8();
    if (v6 > [(NSNumber *)self->_retryUptime longValue])
    {
      retryUptime = self->_retryUptime;
      self->_retryUptime = 0;

      [(BackoffCounter *)self _saveDefaults];
    }
  }
  int v8 = sub_45E0();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    __int16 v9 = +[NSNumber numberWithInt:self->_retryUptime != 0];
    int v11 = 136315650;
    uint64_t v12 = "-[BackoffCounter _validateBackoff]";
    __int16 v13 = 2114;
    *(void *)v14 = v9;
    *(_WORD *)&v14[8] = 2112;
    *(void *)&v14[10] = self;
    _os_log_impl(&dword_0, v8, OS_LOG_TYPE_DEFAULT, "%s -> %{public}@ on %@", (uint8_t *)&v11, 0x20u);
  }
  return self->_retryUptime != 0;
}

- (NSError)errorAuthenticationFailedWithBackoff
{
  p_sepLockInfo = (id *)&self->_sepLockInfo;
  if (self->_sepLockInfo)
  {
    unint64_t v4 = (void *)MKBGetDeviceLockStateInfo();
    id v5 = v4;
    if (!v4) {
      id v5 = *p_sepLockInfo;
    }
    objc_storeStrong(p_sepLockInfo, v5);
    uint64_t v6 = [*p_sepLockInfo objectForKey:kMKBInfoBackOff];
    int v7 = v6;
    if (v6 && ([v6 doubleValue], v8 > 0.0))
    {
      [v7 doubleValue];
      __int16 v9 = +[NSDate dateWithTimeIntervalSinceNow:](NSDate, "dateWithTimeIntervalSinceNow:");
    }
    else
    {
      __int16 v9 = 0;
    }

    if (!v9) {
      goto LABEL_14;
    }
LABEL_12:
    v20[0] = NSDebugDescriptionErrorKey;
    v20[1] = LAPasswordRetryTime;
    v21[0] = @"Passcode backoff";
    v21[1] = v9;
    double v10 = +[NSDictionary dictionaryWithObjects:v21 forKeys:v20 count:2];
    int v11 = +[LAErrorHelper errorWithCode:-1 userInfo:v10];

    goto LABEL_15;
  }
  if ([(BackoffCounter *)self _validateBackoff])
  {
    __int16 v9 = [(BackoffCounter *)self _retryTime];
    if (v9) {
      goto LABEL_12;
    }
  }
  else
  {
    __int16 v9 = 0;
  }
LABEL_14:
  int v11 = 0;
LABEL_15:
  uint64_t v12 = sub_45E0();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    int v14 = 136315650;
    v15 = "-[BackoffCounter errorAuthenticationFailedWithBackoff]";
    __int16 v16 = 2114;
    v17 = v11;
    __int16 v18 = 2112;
    v19 = self;
    _os_log_impl(&dword_0, v12, OS_LOG_TYPE_DEFAULT, "%s -> %{public}@ on %@", (uint8_t *)&v14, 0x20u);
  }

  return (NSError *)v11;
}

- (void)_saveDefault:(id)a3 forKey:(id)a4
{
  defaults = self->_defaults;
  if (a3) {
    [(NSUserDefaults *)defaults setObject:a3 forKey:a4];
  }
  else {
    [(NSUserDefaults *)defaults removeObjectForKey:a4];
  }
}

- (void)_saveDefaults
{
  uint64_t v3 = sub_45E0();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    unint64_t failures = self->_failures;
    id v5 = [(BackoffCounter *)self _retryTime];
    int v10 = 136315906;
    int v11 = "-[BackoffCounter _saveDefaults]";
    __int16 v12 = 1024;
    int v13 = failures;
    __int16 v14 = 2114;
    v15 = v5;
    __int16 v16 = 2112;
    v17 = self;
    _os_log_impl(&dword_0, v3, OS_LOG_TYPE_DEFAULT, "%s failures: %d, retryTime: %{public}@ on %@", (uint8_t *)&v10, 0x26u);
  }
  defaults = self->_defaults;
  if (self->_failures)
  {
    int v7 = +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:");
    [(NSUserDefaults *)defaults setObject:v7 forKey:@"failures"];
  }
  else
  {
    [(NSUserDefaults *)self->_defaults setObject:0 forKey:@"failures"];
  }
  double v8 = self->_defaults;
  __int16 v9 = [(BackoffCounter *)self _retryTime];
  [(NSUserDefaults *)v8 setObject:v9 forKey:@"retryTime"];

  [(NSUserDefaults *)self->_defaults synchronize];
}

- (void)_lockStateDidChange:(BOOL)a3
{
  BOOL v3 = a3;
  id v5 = sub_45E0();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v6 = +[NSNumber numberWithBool:v3];
    int v7 = 136315650;
    double v8 = "-[BackoffCounter _lockStateDidChange:]";
    __int16 v9 = 2114;
    int v10 = v6;
    __int16 v11 = 2112;
    __int16 v12 = self;
    _os_log_impl(&dword_0, v5, OS_LOG_TYPE_DEFAULT, "%s %{public}@ on %@", (uint8_t *)&v7, 0x20u);
  }
  if (v3) {
    [(BackoffCounter *)self actionSuccess];
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sepLockInfo, 0);
  objc_storeStrong((id *)&self->_defaults, 0);

  objc_storeStrong((id *)&self->_retryUptime, 0);
}

@end