@interface SAAppsGetRestrictedApps
- (void)_ad_handleAppLaunchCommandWithRequest:(id)a3 completion:(id)a4;
@end

@implementation SAAppsGetRestrictedApps

- (void)_ad_handleAppLaunchCommandWithRequest:(id)a3 completion:(id)a4
{
  id v6 = a3;
  v7 = (void (**)(id, void *, void, id))a4;
  id v28 = objc_alloc_init((Class)NSMutableDictionary);
  v8 = [off_1005814E8() serviceWithDefaultShellEndpoint];
  if (!v8)
  {
    id v10 = +[AFError errorWithCode:13];
    if (v10) {
      goto LABEL_25;
    }
LABEL_18:
    id v20 = objc_alloc_init((Class)SAAppsGetRestrictedAppsResponse);
    [v20 setAppToItsRestrictionsMap:v28];
    v21 = [v6 createResponseWithReplyCommand:v20];

    if (!v7) {
      goto LABEL_27;
    }
    goto LABEL_26;
  }
  long long v32 = 0u;
  long long v33 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  v9 = [(SAAppsGetRestrictedApps *)self appIds];
  id v10 = [v9 countByEnumeratingWithState:&v30 objects:v41 count:16];
  if (v10)
  {
    v26 = v7;
    uint64_t v11 = *(void *)v31;
    v12 = (void *)SAAppsAppRestrictionReasonRESTRICTEDValue;
    v27 = (void *)SAAppsAppRestrictionReasonNOT_FOUNDValue;
    while (2)
    {
      for (i = 0; i != v10; i = (char *)i + 1)
      {
        if (*(void *)v31 != v11) {
          objc_enumerationMutation(v9);
        }
        uint64_t v14 = *(void *)(*((void *)&v30 + 1) + 8 * i);
        uint64_t v29 = 0;
        if ([v8 canOpenApplication:v14 reason:&v29])
        {
          v15 = AFSiriLogContextDaemon;
          if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 136315394;
            v36 = "-[SAAppsGetRestrictedApps(ADSiriAppLaunchRequestHandler) _ad_handleAppLaunchCommandWithRequest:completion:]";
            __int16 v37 = 2112;
            uint64_t v38 = v14;
            _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_INFO, "%s app (%@) can be launched - filtering", buf, 0x16u);
          }
        }
        else
        {
          uint64_t v16 = v29;
          if (v29 == 8)
          {
            v22 = (void *)AFSiriLogContextDaemon;
            if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
            {
              v23 = v22;
              v24 = FBSOpenApplicationErrorCodeToString();
              *(_DWORD *)buf = 136315650;
              v36 = "-[SAAppsGetRestrictedApps(ADSiriAppLaunchRequestHandler) _ad_handleAppLaunchCommandWithRequest:completion:]";
              __int16 v37 = 2112;
              uint64_t v38 = v14;
              __int16 v39 = 2112;
              v40 = v24;
              _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_INFO, "%s app (%@) can not be launched due to '%@' - bailing", buf, 0x20u);

              uint64_t v25 = v29;
            }
            else
            {
              uint64_t v25 = 8;
            }
            v7 = v26;
            id v10 = +[NSError errorWithDomain:@"com.apple.siri.bksopenapplication.ErrorDomain" code:v25 userInfo:0];
            goto LABEL_24;
          }
          id v17 = v12;
          if (v16 == 4)
          {
            id v18 = v27;

            id v17 = v18;
          }
          id v34 = v17;
          v19 = +[NSArray arrayWithObjects:&v34 count:1];
          [v28 setObject:v19 forKey:v14];
        }
      }
      id v10 = [v9 countByEnumeratingWithState:&v30 objects:v41 count:16];
      if (v10) {
        continue;
      }
      break;
    }
    v7 = v26;
  }
LABEL_24:

  if (!v10) {
    goto LABEL_18;
  }
LABEL_25:
  v21 = 0;
  if (v7) {
LABEL_26:
  }
    v7[2](v7, v21, 0, v10);
LABEL_27:
}

@end