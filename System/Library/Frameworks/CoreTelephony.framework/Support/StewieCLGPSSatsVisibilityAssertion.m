@interface StewieCLGPSSatsVisibilityAssertion
- (StewieCLGPSSatsVisibilityAssertion)initWithQueue:(id)a3 callback:(void *)a4;
- (id).cxx_construct;
- (void)handleGPSSatsVisibility:(id)a3 error:(id)a4;
@end

@implementation StewieCLGPSSatsVisibilityAssertion

- (StewieCLGPSSatsVisibilityAssertion)initWithQueue:(id)a3 callback:(void *)a4
{
  id v5 = a3;
  v8.receiver = self;
  v8.super_class = (Class)StewieCLGPSSatsVisibilityAssertion;
  if ([(StewieCLGPSSatsVisibilityAssertion *)&v8 init])
  {
    ctu::OsLogContext::OsLogContext((ctu::OsLogContext *)location, kCtLoggingSystemName, "stw.gps.vis");
    operator new();
  }

  return 0;
}

- (void)handleGPSSatsVisibility:(id)a3 error:(id)a4
{
  id v6 = a3;
  v7 = (char *)a4;
  dispatch_assert_queue_V2((dispatch_queue_t)self->fQueue);
  if (v7)
  {
    objc_super v8 = sub_100200FB4((id *)self->fLogger.__ptr_.__value_);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v35 = v7;
      _os_log_error_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_ERROR, "Encountered error: %@", buf, 0xCu);
    }
LABEL_4:

    goto LABEL_5;
  }
  if (!v6)
  {
    objc_super v8 = sub_100200FB4((id *)self->fLogger.__ptr_.__value_);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v35 = 0;
      _os_log_error_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_ERROR, "Empty locationState: %@", buf, 0xCu);
    }
    goto LABEL_4;
  }
  mach_continuous_time();
  TMConvertTicksToSeconds();
  double v10 = v9;
  double v33 = 0.0;
  if (!sub_10021551C(v6, @"kCLGNSSStateQueryAssertion_ResponseKey_LastGNSSStartKey", &v33))
  {
    v18 = sub_100200FB4((id *)self->fLogger.__ptr_.__value_);
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315650;
      v35 = "kCLGNSSStateQueryAssertion_ResponseKey_LastGNSSStartKey";
      __int16 v36 = 2112;
      double v37 = *(double *)&v6;
      __int16 v38 = 2048;
      double v39 = v10;
      _os_log_error_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_ERROR, "%s missing in received locationState: %@, now: %f", buf, 0x20u);
    }

    goto LABEL_5;
  }
  double v32 = 0.0;
  if (!sub_10021551C(v6, @"kCLGNSSStateQueryAssertion_ResponseKey_LastGNSSStopKey", &v32))
  {
    v19 = sub_100200FB4((id *)self->fLogger.__ptr_.__value_);
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315650;
      v35 = "kCLGNSSStateQueryAssertion_ResponseKey_LastGNSSStopKey";
      __int16 v36 = 2112;
      double v37 = *(double *)&v6;
      __int16 v38 = 2048;
      double v39 = v10;
      _os_log_error_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_ERROR, "%s missing in received locationState: %@, now: %f", buf, 0x20u);
    }

    goto LABEL_5;
  }
  double v31 = 0.0;
  if (!sub_10021551C(v6, @"kCLGNSSStateQueryAssertion_ResponseKey_LastGNSSYieldKey", &v31))
  {
    v14 = sub_100200FB4((id *)self->fLogger.__ptr_.__value_);
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315650;
      v35 = "kCLGNSSStateQueryAssertion_ResponseKey_LastGNSSYieldKey";
      __int16 v36 = 2112;
      double v37 = *(double *)&v6;
      __int16 v38 = 2048;
      double v39 = v10;
      v15 = "%s Status missing in received locationState: %@, now: %f";
      v16 = v14;
      uint32_t v17 = 32;
      goto LABEL_43;
    }
LABEL_25:

    goto LABEL_5;
  }
  double v11 = v33;
  if (v10 < v33 || (double v12 = v32, v10 < v32) || (v13 = v31, v10 < v31))
  {
    v14 = sub_100200FB4((id *)self->fLogger.__ptr_.__value_);
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 134218752;
      v35 = *(const char **)&v11;
      __int16 v36 = 2048;
      double v37 = v32;
      __int16 v38 = 2048;
      double v39 = v31;
      __int16 v40 = 2048;
      double v41 = v10;
      v15 = "Invalid set of values [Start: %f, Stop: %f, Yield: %f, Now: %f]";
      v16 = v14;
      uint32_t v17 = 42;
LABEL_43:
      _os_log_error_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_ERROR, v15, buf, v17);
      goto LABEL_25;
    }
    goto LABEL_25;
  }
  if (v10 < v33)
  {
    v29 = "now >= lastGNSSStart";
    int v30 = 100;
    goto LABEL_64;
  }
  if (v10 < v32)
  {
    v29 = "now >= lastGNSSStop";
    int v30 = 101;
    goto LABEL_64;
  }
  if (v10 < v31)
  {
    v29 = "now >= lastGNSSYield";
    int v30 = 102;
LABEL_64:
    __assert_rtn("-[StewieCLGPSSatsVisibilityAssertion handleGPSSatsVisibility:error:]", "StewieGPSSatsVisibilityProvider_ios.mm", v30, v29);
  }
  v20 = sub_100200FB4((id *)self->fLogger.__ptr_.__value_);
  if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134218752;
    v35 = *(const char **)&v11;
    __int16 v36 = 2048;
    double v37 = v12;
    __int16 v38 = 2048;
    double v39 = v13;
    __int16 v40 = 2048;
    double v41 = v10;
    _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEFAULT, "#I Got [Start: %f, Stop: %f, Yield: %f, Now: %f]", buf, 0x2Au);
  }

  if (v11 >= v12)
  {
    value = self->fLogger.__ptr_.__value_;
    if (v13 >= v11)
    {
      if (v10 - v13 < 60.0)
      {
        v26 = sub_100200FB4((id *)value);
        if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_DEFAULT, "#I [Visible][InProgress] Yield is NOT stale", buf, 2u);
        }
        char v27 = 1;
        goto LABEL_57;
      }
      v26 = sub_100200FB4((id *)value);
      if (!os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
      {
LABEL_56:
        char v27 = 0;
LABEL_57:

        sub_1000607A8((uint64_t)&self->fCallback, v27);
        goto LABEL_5;
      }
      *(_WORD *)buf = 0;
      v28 = "#I [NotVisible][InProgress] Yield is stale";
    }
    else
    {
      if (v10 - v11 < 60.0)
      {
        v14 = sub_100200FB4((id *)value);
        if (!os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT)) {
          goto LABEL_25;
        }
        *(_WORD *)buf = 0;
        v24 = "#I [Ignore][InProgress] Session hasn't been in progress for enough time to produce a fix";
        goto LABEL_60;
      }
      v26 = sub_100200FB4((id *)value);
      if (!os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_56;
      }
      *(_WORD *)buf = 0;
      v28 = "#I [NotVisible][InProgress] Enough time has elapsed without a fix, consider this as a failure";
    }
    _os_log_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_DEFAULT, v28, buf, 2u);
    goto LABEL_56;
  }
  if (v13 <= v12 && v12 - v13 > 30.0)
  {
    v21 = self->fLogger.__ptr_.__value_;
    if (v12 - v11 > 10.0)
    {
      v22 = sub_100200FB4((id *)v21);
      if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_DEFAULT, "#I [NotVisible][Stopped] Sats were NOT visible in last session", buf, 2u);
      }

      sub_1000607A8((uint64_t)&self->fCallback, 0);
      goto LABEL_5;
    }
    v14 = sub_100200FB4((id *)v21);
    if (!os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_25;
    }
    *(_WORD *)buf = 0;
    v24 = "#I [Ignore][Stopped] Ignore very short sessions that didn't yield location";
LABEL_60:
    _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, v24, buf, 2u);
    goto LABEL_25;
  }
  v25 = sub_100200FB4((id *)self->fLogger.__ptr_.__value_);
  if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_DEFAULT, "#I [Visible][Stopped] Sats were visible in last session", buf, 2u);
  }

  sub_1000607A8((uint64_t)&self->fCallback, 1);
LABEL_5:
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->fAssertion, 0);
  sub_100060644(self->fCallback.__f_.__buf_.__lx);
  objc_storeStrong((id *)&self->fQueue, 0);

  sub_100119D1C((ctu::OsLogLogger **)&self->fLogger, 0);
}

- (id).cxx_construct
{
  *((void *)self + 1) = 0;
  *((void *)self + 6) = 0;
  return self;
}

@end