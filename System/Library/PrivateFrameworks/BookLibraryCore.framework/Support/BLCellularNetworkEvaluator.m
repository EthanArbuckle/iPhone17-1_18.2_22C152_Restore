@interface BLCellularNetworkEvaluator
+ (id)evaluatorForIdentity:(id)a3;
- (BLCellularNetworkEvaluator)initWithIdentity:(id)a3;
- (int64_t)evaluateForDownload:(id)a3;
@end

@implementation BLCellularNetworkEvaluator

+ (id)evaluatorForIdentity:(id)a3
{
  id v4 = a3;
  id v5 = [objc_alloc((Class)a1) initWithIdentity:v4];

  return v5;
}

- (BLCellularNetworkEvaluator)initWithIdentity:(id)a3
{
  id v5 = a3;
  v11.receiver = self;
  v11.super_class = (Class)BLCellularNetworkEvaluator;
  v6 = [(BLCellularNetworkEvaluator *)&v11 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_identity, a3);
    uint64_t v8 = +[BUCellularSettings settingsForIdentity:v5];
    settings = v7->_settings;
    v7->_settings = (BUCellularSettings *)v8;
  }
  return v7;
}

- (int64_t)evaluateForDownload:(id)a3
{
  id v4 = a3;
  id v5 = BLServiceLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6 = [v4 logKey];
    *(_DWORD *)buf = 138543874;
    v30 = v6;
    __int16 v31 = 2048;
    v32 = [v4 bytes];
    __int16 v33 = 1024;
    unsigned int v34 = [v4 isAutomatic];
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "[%{public}@]: Evaluating download, size = %llu automatic = %d", buf, 0x1Cu);
  }
  unsigned __int8 v7 = [(BUCellularSettings *)self->_settings allowAutomaticDownloads];
  if ([v4 isAutomatic] && (v7 & 1) == 0)
  {
    uint64_t v8 = BLServiceLog();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      v9 = [v4 logKey];
      *(_DWORD *)buf = 138543362;
      v30 = v9;
      v10 = "[%{public}@]: Implicitly denied - automatic downloads are disabled in Settings > Books > Cellular Data and w"
            "ill only happen on WiFi";
LABEL_17:
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, v10, buf, 0xCu);
LABEL_18:

      goto LABEL_19;
    }
    goto LABEL_19;
  }
  id v11 = [(BUCellularSettings *)self->_settings cellularDataPrompt];
  if (![(BUCellularIdentity *)self->_identity isRoaming])
  {
    if (v11 == (id)1) {
      goto LABEL_15;
    }
    if (v11 == (id)2)
    {
      uint64_t v8 = BLServiceLog();
      if (!os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
LABEL_33:
        int64_t v14 = 3;
        goto LABEL_20;
      }
      v9 = [v4 logKey];
      *(_DWORD *)buf = 138543362;
      v30 = v9;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "[%{public}@]: Implicitly allowed - cellular prompt disabled", buf, 0xCu);
    }
    else
    {
      if (![v4 bytes])
      {
        uint64_t v8 = BLServiceLog();
        if (!os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT)) {
          goto LABEL_19;
        }
        v9 = [v4 logKey];
        *(_DWORD *)buf = 138543362;
        v30 = v9;
        v10 = "[%{public}@]: Implicitly denied - download size is unavailable";
        goto LABEL_17;
      }
      constraints = self->_constraints;
      if (constraints)
      {
        uint64_t v8 = 0;
      }
      else
      {
        v17 = +[BUBag defaultBag];
        v18 = [v4 kind];
        v19 = +[AMSNetworkConstraints networkConstraintsForMediaType:v18 withBag:v17];
        id v28 = 0;
        v20 = [v19 resultWithError:&v28];
        uint64_t v8 = v28;
        v21 = self->_constraints;
        self->_constraints = v20;

        constraints = self->_constraints;
        if (!constraints)
        {
          v9 = BLServiceLog();
          if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
          {
            v27 = [v4 logKey];
            *(_DWORD *)buf = 138543618;
            v30 = v27;
            __int16 v31 = 2112;
            v32 = v8;
            _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_ERROR, "[%{public}@]: Implicitly denied - failed to load constraints:  %@", buf, 0x16u);
          }
          goto LABEL_18;
        }
      }
      v22 = [(AMSNetworkConstraints *)constraints sizeLimitForNetworkType:AMSNetworkTypeCellular];
      v23 = [v4 bytes];
      v9 = BLServiceLog();
      BOOL v24 = os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT);
      if (v23 > v22)
      {
        if (v24)
        {
          v25 = [v4 logKey];
          *(_DWORD *)buf = 138543618;
          v30 = v25;
          __int16 v31 = 2048;
          v32 = v22;
          _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "[%{public}@]: Implicitly denied - exceeded cellular limit (of %llu bytes)", buf, 0x16u);
        }
        goto LABEL_18;
      }
      if (v24)
      {
        v26 = [v4 logKey];
        *(_DWORD *)buf = 138543618;
        v30 = v26;
        __int16 v31 = 2048;
        v32 = v22;
        _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "[%{public}@]: Implicitly allowed - cellular limit (of %llu bytes) applies", buf, 0x16u);
      }
    }

    goto LABEL_33;
  }
  v12 = BLServiceLog();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    v13 = [v4 logKey];
    *(_DWORD *)buf = 138543362;
    v30 = v13;
    _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "[%{public}@]: Overriding cellular prompt - network is roaming", buf, 0xCu);
  }
LABEL_15:
  uint64_t v8 = BLServiceLog();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    v9 = [v4 logKey];
    *(_DWORD *)buf = 138543362;
    v30 = v9;
    v10 = "[%{public}@]: Implicitly denied - cellular prompt required";
    goto LABEL_17;
  }
LABEL_19:
  int64_t v14 = 4;
LABEL_20:

  return v14;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_settings, 0);
  objc_storeStrong((id *)&self->_identity, 0);

  objc_storeStrong((id *)&self->_constraints, 0);
}

@end