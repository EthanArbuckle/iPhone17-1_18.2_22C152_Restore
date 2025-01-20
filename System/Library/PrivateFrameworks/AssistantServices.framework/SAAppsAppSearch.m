@interface SAAppsAppSearch
- (void)_ad_handleAppLaunchCommandWithRequest:(id)a3 completion:(id)a4;
@end

@implementation SAAppsAppSearch

- (void)_ad_handleAppLaunchCommandWithRequest:(id)a3 completion:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = objc_alloc_init((Class)NSMutableArray);
  id v9 = [(SAAppsAppSearch *)self applicationName];
  v15 = v9;
  id v10 = v8;
  v16 = v10;
  AFApplicationWorkspaceEnumerateInstalledUserVisibleApplications();
  v11 = (void *)AFSiriLogContextPlugin;
  if (os_log_type_enabled(AFSiriLogContextPlugin, OS_LOG_TYPE_INFO))
  {
    v12 = v11;
    *(_DWORD *)buf = 136315906;
    v18 = "-[SAAppsAppSearch(ADSiriAppLaunchRequestHandler) _ad_handleAppLaunchCommandWithRequest:completion:]";
    __int16 v19 = 2048;
    id v20 = objc_msgSend(v10, "count", _NSConcreteStackBlock, 3221225472, sub_10012E680, &unk_100502F18, v9, v10);
    __int16 v21 = 2112;
    id v22 = v9;
    __int16 v23 = 2112;
    id v24 = v10;
    _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_INFO, "%s Found %tu apps matching name %@: %@", buf, 0x2Au);
  }
  id v13 = objc_alloc_init((Class)SAAppsAppSearchResponse);
  [v13 setFoundApps:v10];
  v14 = [v7 createResponseWithReplyCommand:v13];

  if (v6) {
    (*((void (**)(id, void *, void, void))v6 + 2))(v6, v14, 0, 0);
  }
}

@end