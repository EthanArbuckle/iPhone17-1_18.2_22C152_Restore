@interface AAPApplicationTerminator
- (void)terminateAllAppsExcludingBundleIdentifiers:(id)a3 completion:(id)a4;
@end

@implementation AAPApplicationTerminator

- (void)terminateAllAppsExcludingBundleIdentifiers:(id)a3 completion:(id)a4
{
  id v5 = objc_alloc_init((Class)NSMutableSet);
  v25 = _NSConcreteStackBlock;
  uint64_t v26 = 3221225472;
  v27 = sub_735C;
  v28 = &unk_20820;
  id v29 = v5;
  AFApplicationWorkspaceEnumerateInstalledUserVisibleApplications();
  id v6 = objc_msgSend(objc_alloc((Class)NSMutableSet), "initWithCapacity:", objc_msgSend(v5, "count"));
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  id v7 = [v5 countByEnumeratingWithState:&v21 objects:v35 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v22;
    do
    {
      for (i = 0; i != v8; i = (char *)i + 1)
      {
        if (*(void *)v22 != v9) {
          objc_enumerationMutation(v5);
        }
        uint64_t v11 = *(void *)(*((void *)&v21 + 1) + 8 * i);
        *(void *)buf = 0;
        id v12 = +[RBSProcessHandle handleForPredicate:error:](RBSProcessHandle, "handleForPredicate:error:", +[RBSProcessPredicate predicateMatchingBundleIdentifier:v11], buf);
        if (!*(void *)buf && objc_msgSend(objc_msgSend(v12, "currentState"), "isRunning")) {
          [v6 addObject:v11];
        }
      }
      id v8 = [v5 countByEnumeratingWithState:&v21 objects:v35 count:16];
    }
    while (v8);
  }
  if ([v6 count])
  {
    uint64_t v20 = 0;
    if (objc_msgSend(objc_msgSend(objc_alloc((Class)RBSTerminateRequest), "initWithPredicate:context:", +[RBSProcessPredicate predicateMatchingBundleIdentifiers:](RBSProcessPredicate, "predicateMatchingBundleIdentifiers:", v6), objc_msgSend(objc_alloc((Class)RBSTerminateContext), "initWithExplanation:", @"Siri asked to terminate all applications")), "execute:", &v20))
    {
      v13 = AFSiriLogContextPlugin;
      if (os_log_type_enabled(AFSiriLogContextPlugin, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 136315138;
        *(void *)&buf[4] = "-[AAPApplicationTerminator terminateAllAppsExcludingBundleIdentifiers:completion:]";
        _os_log_impl(&dword_0, v13, OS_LOG_TYPE_INFO, "%s com.apple.siri.applications: Terminated all running apps successfully", buf, 0xCu);
      }
      if (a4)
      {
        v14 = 0;
LABEL_26:
        (*((void (**)(id, NSError *))a4 + 2))(a4, v14);
      }
    }
    else
    {
      id v16 = objc_alloc((Class)NSMutableDictionary);
      NSErrorUserInfoKey v33 = NSLocalizedDescriptionKey;
      CFStringRef v34 = @"Failed to terminate one or more of the running apps";
      id v17 = objc_msgSend(v16, "initWithDictionary:", +[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v34, &v33, 1));
      id v18 = v17;
      if (v20) {
        [v17 setObject:v20 forKey:NSUnderlyingErrorKey];
      }
      v14 = +[NSError errorWithDomain:@"com.apple.assistant.appsync.apptermination" code:2 userInfo:v18];
      v19 = AFSiriLogContextPlugin;
      if (os_log_type_enabled(AFSiriLogContextPlugin, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 136315394;
        *(void *)&buf[4] = "-[AAPApplicationTerminator terminateAllAppsExcludingBundleIdentifiers:completion:]";
        __int16 v31 = 2112;
        v32 = v14;
        _os_log_impl(&dword_0, v19, OS_LOG_TYPE_INFO, "%s com.apple.siri.applications: %@", buf, 0x16u);
      }
      if (a4) {
        goto LABEL_26;
      }
    }
  }
  else
  {
    v15 = AFSiriLogContextPlugin;
    if (os_log_type_enabled(AFSiriLogContextPlugin, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315138;
      *(void *)&buf[4] = "-[AAPApplicationTerminator terminateAllAppsExcludingBundleIdentifiers:completion:]";
      _os_log_impl(&dword_0, v15, OS_LOG_TYPE_INFO, "%s com.apple.siri.applications: No running apps to terminate", buf, 0xCu);
    }
    if (a4) {
      (*((void (**)(id, void))a4 + 2))(a4, 0);
    }
  }
}

@end