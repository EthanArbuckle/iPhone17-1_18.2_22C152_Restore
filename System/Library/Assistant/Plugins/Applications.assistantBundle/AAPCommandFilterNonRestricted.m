@interface AAPCommandFilterNonRestricted
- (void)performWithCompletion:(id)a3;
@end

@implementation AAPCommandFilterNonRestricted

- (void)performWithCompletion:(id)a3
{
  id obj = [(AAPCommandFilterNonRestricted *)self appIds];
  v43 = +[NSMutableDictionary dictionaryWithCapacity:](NSMutableDictionary, "dictionaryWithCapacity:", [obj count]);
  id v5 = [(AAPCommandFilterNonRestricted *)self executionEnvironment];
  if ([v5 isEqualToString:SAAppsLaunchAppSTARK_EXECUTION_ENVValue]) {
    v6 = (FBSOpenApplicationService *)+[FBSOpenApplicationService dashboardService];
  }
  else {
    v6 = +[FBSOpenApplicationService serviceWithDefaultShellEndpoint];
  }
  v7 = v6;
  v8 = (os_log_t *)&AFSiriLogContextPlugin;
  if (v6)
  {
    id v42 = a3;
    long long v52 = 0u;
    long long v53 = 0u;
    long long v50 = 0u;
    long long v51 = 0u;
    id v9 = [obj countByEnumeratingWithState:&v50 objects:v67 count:16];
    v10 = v43;
    if (v9)
    {
      id v11 = v9;
      uint64_t v12 = *(void *)v51;
      uint64_t v44 = SAAppsAppRestrictionReasonNOT_FOUNDValue;
      uint64_t v47 = SAAppsAppRestrictionReasonRESTRICTEDValue;
      uint64_t v45 = *(void *)v51;
      v46 = v7;
      while (2)
      {
        for (i = 0; i != v11; i = (char *)i + 1)
        {
          if (*(void *)v51 != v12) {
            objc_enumerationMutation(obj);
          }
          v14 = *(void **)(*((void *)&v50 + 1) + 8 * i);
          uint64_t v49 = 1;
          if ([(FBSOpenApplicationService *)v7 canOpenApplication:v14 reason:&v49])
          {
            v15 = *v8;
            if (os_log_type_enabled(*v8, OS_LOG_TYPE_INFO))
            {
              uint64_t v16 = objc_opt_class();
              *(_DWORD *)buf = 136315906;
              v56 = "-[AAPCommandFilterNonRestricted performWithCompletion:]";
              __int16 v57 = 2114;
              uint64_t v58 = v16;
              __int16 v59 = 2048;
              v60 = self;
              __int16 v61 = 2112;
              id v62 = v14;
              _os_log_impl(&dword_0, v15, OS_LOG_TYPE_INFO, "%s com.apple.siri.applications: <%{public}@:%p> app (%@) can be launched - filtering", buf, 0x2Au);
            }
          }
          else if (v49 == 4)
          {
            v21 = +[NSMutableArray arrayWithCapacity:1];
            unsigned int v22 = objc_msgSend(+[LSApplicationProxy applicationProxyForIdentifier:](LSApplicationProxy, "applicationProxyForIdentifier:", v14), "isRestricted");
            v23 = *v8;
            BOOL v24 = os_log_type_enabled(*v8, OS_LOG_TYPE_INFO);
            if (v22)
            {
              uint64_t v25 = v47;
              if (v24)
              {
                uint64_t v26 = objc_opt_class();
                *(_DWORD *)buf = 136315906;
                v56 = "-[AAPCommandFilterNonRestricted performWithCompletion:]";
                __int16 v57 = 2114;
                uint64_t v58 = v26;
                __int16 v59 = 2048;
                v60 = self;
                __int16 v61 = 2112;
                id v62 = v14;
                _os_log_impl(&dword_0, v23, OS_LOG_TYPE_INFO, "%s com.apple.siri.applications: <%{public}@:%p> app (%@) can not be launched because it is restricted - not filtering", buf, 0x2Au);
                uint64_t v25 = v47;
              }
            }
            else
            {
              uint64_t v25 = v44;
              if (v24)
              {
                uint64_t v27 = objc_opt_class();
                v28 = v8;
                uint64_t v29 = v49;
                uint64_t v30 = FBSOpenApplicationErrorCodeToString();
                *(_DWORD *)buf = 136316418;
                v56 = "-[AAPCommandFilterNonRestricted performWithCompletion:]";
                __int16 v57 = 2114;
                uint64_t v58 = v27;
                __int16 v59 = 2048;
                v60 = self;
                __int16 v61 = 2112;
                id v62 = v14;
                __int16 v63 = 2048;
                uint64_t v64 = v29;
                v8 = v28;
                v10 = v43;
                __int16 v65 = 2112;
                uint64_t v66 = v30;
                _os_log_impl(&dword_0, v23, OS_LOG_TYPE_INFO, "%s com.apple.siri.applications: <%{public}@:%p> app (%@) can not be launched with result=%li(%@) (restricted) - not filtering", buf, 0x3Eu);
                uint64_t v25 = v44;
              }
            }
            [(NSMutableArray *)v21 addObject:v25];
            [(NSMutableDictionary *)v10 setObject:[(NSMutableArray *)v21 copy] forKey:v14];
            uint64_t v12 = v45;
            v7 = v46;
          }
          else
          {
            if (v49 != 5)
            {
              v33 = *v8;
              if (os_log_type_enabled(*v8, OS_LOG_TYPE_ERROR))
              {
                uint64_t v39 = objc_opt_class();
                uint64_t v40 = v49;
                uint64_t v41 = FBSOpenApplicationErrorCodeToString();
                *(_DWORD *)buf = 136316418;
                v56 = "-[AAPCommandFilterNonRestricted performWithCompletion:]";
                __int16 v57 = 2114;
                uint64_t v58 = v39;
                __int16 v59 = 2048;
                v60 = self;
                __int16 v61 = 2112;
                id v62 = v14;
                __int16 v63 = 2048;
                uint64_t v64 = v40;
                __int16 v65 = 2112;
                uint64_t v66 = v41;
                _os_log_error_impl(&dword_0, v33, OS_LOG_TYPE_ERROR, "%s com.apple.siri.applications: <%{public}@:%p> app (%@) can not be launched with result=%li(%@) - bailing", buf, 0x3Eu);
              }
              a3 = v42;
              goto LABEL_32;
            }
            v17 = *v8;
            if (os_log_type_enabled(*v8, OS_LOG_TYPE_INFO))
            {
              uint64_t v18 = objc_opt_class();
              uint64_t v19 = v49;
              uint64_t v20 = FBSOpenApplicationErrorCodeToString();
              *(_DWORD *)buf = 136316418;
              v56 = "-[AAPCommandFilterNonRestricted performWithCompletion:]";
              __int16 v57 = 2114;
              uint64_t v58 = v18;
              __int16 v59 = 2048;
              v60 = self;
              __int16 v61 = 2112;
              id v62 = v14;
              __int16 v63 = 2048;
              uint64_t v64 = v19;
              uint64_t v12 = v45;
              v7 = v46;
              __int16 v65 = 2112;
              uint64_t v66 = v20;
              _os_log_impl(&dword_0, v17, OS_LOG_TYPE_INFO, "%s com.apple.siri.applications: <%{public}@:%p> app (%@) can not be launched with result=%li(%@) - not filtering", buf, 0x3Eu);
            }
            uint64_t v54 = v47;
            [(NSMutableDictionary *)v10 setObject:+[NSArray arrayWithObjects:&v54 count:1] forKey:v14];
          }
        }
        id v11 = [obj countByEnumeratingWithState:&v50 objects:v67 count:16];
        if (v11) {
          continue;
        }
        break;
      }
    }
    id v31 = objc_alloc_init((Class)SAAppsGetRestrictedAppsResponse);
    [v31 setAppToItsRestrictionsMap:v10];
    objc_msgSend(v31, "setRestrictedApps:", -[NSMutableDictionary allKeys](v10, "allKeys"));
  }
  else
  {
    v32 = AFSiriLogContextPlugin;
    if (os_log_type_enabled(AFSiriLogContextPlugin, OS_LOG_TYPE_ERROR)) {
      sub_15718((uint64_t)self, (uint64_t)obj, v32);
    }
LABEL_32:
    id v31 = objc_alloc_init((Class)SACommandFailed);
  }
  id v34 = [v31 dictionary];

  v35 = *v8;
  BOOL v36 = os_log_type_enabled(*v8, OS_LOG_TYPE_INFO);
  if (a3)
  {
    if (v36)
    {
      uint64_t v37 = objc_opt_class();
      *(_DWORD *)buf = 136315906;
      v56 = "-[AAPCommandFilterNonRestricted performWithCompletion:]";
      __int16 v57 = 2114;
      uint64_t v58 = v37;
      __int16 v59 = 2048;
      v60 = self;
      __int16 v61 = 2112;
      id v62 = v34;
      _os_log_impl(&dword_0, v35, OS_LOG_TYPE_INFO, "%s com.apple.siri.applications: <%{public}@:%p> sending response = %@", buf, 0x2Au);
    }
    (*((void (**)(id, id))a3 + 2))(a3, v34);
  }
  else if (v36)
  {
    uint64_t v38 = objc_opt_class();
    *(_DWORD *)buf = 136315906;
    v56 = "-[AAPCommandFilterNonRestricted performWithCompletion:]";
    __int16 v57 = 2114;
    uint64_t v58 = v38;
    __int16 v59 = 2048;
    v60 = self;
    __int16 v61 = 2112;
    id v62 = v34;
    _os_log_impl(&dword_0, v35, OS_LOG_TYPE_INFO, "%s com.apple.siri.applications: <%{public}@:%p> no completion block - dropping response = %@", buf, 0x2Au);
  }
}

@end