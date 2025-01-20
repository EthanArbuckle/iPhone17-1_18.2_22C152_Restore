@interface AAPCommandCheckRestriction
- (void)performWithCompletion:(id)a3;
@end

@implementation AAPCommandCheckRestriction

- (void)performWithCompletion:(id)a3
{
  v40[0] = _NSConcreteStackBlock;
  v40[1] = 3221225472;
  v41 = sub_109D4;
  v42 = &unk_20750;
  v43 = self;
  id v44 = a3;
  id v4 = [(AAPCommandCheckRestriction *)self launchId];
  if (v4)
  {
    uint64_t v5 = (uint64_t)v4;
    id v6 = [(AAPCommandCheckRestriction *)self executionEnvironment];
    if ([v6 isEqualToString:SAAppsLaunchAppSTARK_EXECUTION_ENVValue]) {
      v7 = (FBSOpenApplicationService *)+[FBSOpenApplicationService dashboardService];
    }
    else {
      v7 = +[FBSOpenApplicationService serviceWithDefaultShellEndpoint];
    }
    v10 = v7;
    uint64_t v39 = 1;
    if ([(FBSOpenApplicationService *)v7 canOpenApplication:v5 reason:&v39])
    {
      v11 = AFSiriLogContextPlugin;
      if (os_log_type_enabled(AFSiriLogContextPlugin, OS_LOG_TYPE_INFO))
      {
        uint64_t v12 = objc_opt_class();
        *(_DWORD *)buf = 136315906;
        v46 = "-[AAPCommandCheckRestriction performWithCompletion:]";
        __int16 v47 = 2114;
        uint64_t v48 = v12;
        __int16 v49 = 2048;
        v50 = self;
        __int16 v51 = 2112;
        uint64_t v52 = v5;
        _os_log_impl(&dword_0, v11, OS_LOG_TYPE_INFO, "%s com.apple.siri.applications: <%{public}@:%p> app (%@) can be launched", buf, 0x2Au);
      }
      v13 = (objc_class **)SACommandSucceeded_ptr;
      goto LABEL_32;
    }
    if (!v10)
    {
      v15 = AFSiriLogContextPlugin;
      if (os_log_type_enabled(AFSiriLogContextPlugin, OS_LOG_TYPE_ERROR)) {
        sub_15664((uint64_t)self, v5, v15);
      }
      goto LABEL_31;
    }
    if (v39 == 4)
    {
      id v16 = +[LSApplicationProxy applicationProxyForIdentifier:v5];
      if (v16)
      {
        v17 = v16;
        unsigned int v18 = [v16 isRestricted];
        v14 = AFSiriLogContextPlugin;
        BOOL v19 = os_log_type_enabled(AFSiriLogContextPlugin, OS_LOG_TYPE_INFO);
        if (v18)
        {
          if (v19)
          {
            uint64_t v20 = objc_opt_class();
            uint64_t v21 = v39;
            uint64_t v22 = FBSOpenApplicationErrorCodeToString();
            unsigned int v23 = [v17 isRestricted];
            *(_DWORD *)buf = 136316674;
            v46 = "-[AAPCommandCheckRestriction performWithCompletion:]";
            __int16 v47 = 2114;
            uint64_t v48 = v20;
            __int16 v49 = 2048;
            v50 = self;
            __int16 v51 = 2112;
            uint64_t v52 = v5;
            __int16 v53 = 2048;
            uint64_t v54 = v21;
            __int16 v55 = 2112;
            uint64_t v56 = v22;
            __int16 v57 = 1024;
            unsigned int v58 = v23;
            v24 = "%s com.apple.siri.applications: <%{public}@:%p> app (%@) can not be launched with result=%li(%@) restricted=%i";
            v25 = v14;
            uint32_t v26 = 68;
LABEL_30:
            _os_log_impl(&dword_0, v25, OS_LOG_TYPE_INFO, v24, buf, v26);
          }
        }
        else if (v19)
        {
LABEL_28:
          uint64_t v34 = objc_opt_class();
          uint64_t v35 = v39;
          uint64_t v36 = FBSOpenApplicationErrorCodeToString();
          *(_DWORD *)buf = 136316418;
          v46 = "-[AAPCommandCheckRestriction performWithCompletion:]";
          __int16 v47 = 2114;
          uint64_t v48 = v34;
          __int16 v49 = 2048;
          v50 = self;
          __int16 v51 = 2112;
          uint64_t v52 = v5;
          __int16 v53 = 2048;
          uint64_t v54 = v35;
          __int16 v55 = 2112;
          uint64_t v56 = v36;
          v24 = "%s com.apple.siri.applications: <%{public}@:%p> app (%@) can not be launched with result=%li(%@)";
          goto LABEL_29;
        }
      }
      else
      {
        v14 = AFSiriLogContextPlugin;
        if (os_log_type_enabled(AFSiriLogContextPlugin, OS_LOG_TYPE_INFO))
        {
          uint64_t v31 = objc_opt_class();
          uint64_t v32 = v39;
          uint64_t v33 = FBSOpenApplicationErrorCodeToString();
          *(_DWORD *)buf = 136316418;
          v46 = "-[AAPCommandCheckRestriction performWithCompletion:]";
          __int16 v47 = 2114;
          uint64_t v48 = v31;
          __int16 v49 = 2048;
          v50 = self;
          __int16 v51 = 2112;
          uint64_t v52 = v5;
          __int16 v53 = 2048;
          uint64_t v54 = v32;
          __int16 v55 = 2112;
          uint64_t v56 = v33;
          v24 = "%s com.apple.siri.applications: <%{public}@:%p> app (%@) can not be launched with result=%li(%@) (no app proxy)";
LABEL_29:
          v25 = v14;
          uint32_t v26 = 62;
          goto LABEL_30;
        }
      }
    }
    else
    {
      if (v39 != 5)
      {
        v27 = AFSiriLogContextPlugin;
        if (os_log_type_enabled(AFSiriLogContextPlugin, OS_LOG_TYPE_ERROR))
        {
          uint64_t v28 = objc_opt_class();
          uint64_t v29 = v39;
          uint64_t v30 = FBSOpenApplicationErrorCodeToString();
          *(_DWORD *)buf = 136316418;
          v46 = "-[AAPCommandCheckRestriction performWithCompletion:]";
          __int16 v47 = 2114;
          uint64_t v48 = v28;
          __int16 v49 = 2048;
          v50 = self;
          __int16 v51 = 2112;
          uint64_t v52 = v5;
          __int16 v53 = 2048;
          uint64_t v54 = v29;
          __int16 v55 = 2112;
          uint64_t v56 = v30;
          _os_log_error_impl(&dword_0, v27, OS_LOG_TYPE_ERROR, "%s com.apple.siri.applications: <%{public}@:%p> app (%@) can not be launched with result=%li(%@) (could not determine)", buf, 0x3Eu);
        }
        goto LABEL_31;
      }
      v14 = AFSiriLogContextPlugin;
      if (os_log_type_enabled(AFSiriLogContextPlugin, OS_LOG_TYPE_INFO)) {
        goto LABEL_28;
      }
    }
LABEL_31:
    v13 = (objc_class **)SACommandFailed_ptr;
LABEL_32:
    v9 = *v13;
    goto LABEL_33;
  }
  v8 = AFSiriLogContextPlugin;
  if (os_log_type_enabled(AFSiriLogContextPlugin, OS_LOG_TYPE_ERROR)) {
    sub_155C8((uint64_t)self, v8);
  }
  v9 = (objc_class *)SACommandFailed;
LABEL_33:
  id v37 = objc_alloc_init(v9);
  id v38 = [v37 dictionary];
  v41((uint64_t)v40, (uint64_t)v38);
}

@end