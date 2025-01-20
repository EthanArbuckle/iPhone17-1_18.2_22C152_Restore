@interface SSSApplication
+ (id)sharedSSSApplication;
- (BOOL)_canAnimateDragCancelInApp;
- (BOOL)runTest:(id)a3 options:(id)a4;
- (id)_actionInActions:(id)a3 ofClass:(Class)a4;
- (id)_documentUpdateActionInActions:(id)a3;
- (id)_imageIdentifierActionInActions:(id)a3;
- (id)_metadataUpdateActionInActions:(id)a3;
- (id)_pptTestInfos;
- (id)_preheatActionInActions:(id)a3;
- (id)_screenshotActionInActions:(id)a3;
- (void)_handlePlatformSpecificActions:(id)a3 forScene:(id)a4 withTransitionContext:(id)a5;
@end

@implementation SSSApplication

- (id)_pptTestInfos
{
  v2 = +[NSBundle mainBundle];
  uint64_t v3 = [v2 pathForResource:@"testDefinitions" ofType:@"plist"];

  v16 = (void *)v3;
  v4 = +[NSArray arrayWithContentsOfFile:v3];
  v5 = +[NSMutableDictionary dictionary];
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  id v6 = v4;
  id v7 = [v6 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v18;
    do
    {
      for (i = 0; i != v8; i = (char *)i + 1)
      {
        if (*(void *)v18 != v9) {
          objc_enumerationMutation(v6);
        }
        v11 = *(void **)(*((void *)&v17 + 1) + 8 * i);
        v12 = [v11 objectForKey:@"testName"];
        uint64_t v13 = [v11 objectForKey:@"sssNumberOfRequiredScreenshots"];
        if (v13) {
          v14 = (_UNKNOWN **)v13;
        }
        else {
          v14 = &off_10009DCC8;
        }
        [v5 setObject:v14 forKeyedSubscript:v12];
      }
      id v8 = [v6 countByEnumeratingWithState:&v17 objects:v21 count:16];
    }
    while (v8);
  }

  return v5;
}

- (BOOL)runTest:(id)a3 options:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(SSSApplication *)self _pptTestInfos];
  uint64_t v9 = [v8 objectForKeyedSubscript:v6];
  if (v9)
  {
    id v10 = objc_alloc_init((Class)SSUIService);
    [v10 _runPPTNamed:v6 numberOfRequiredScreenshots:[v9 unsignedIntegerValue]];
    dispatch_time_t v11 = dispatch_time(0, 100000000);
    dispatch_after(v11, (dispatch_queue_t)&_dispatch_main_q, &stru_1000999F8);

    BOOL v12 = 1;
  }
  else
  {
    v14.receiver = self;
    v14.super_class = (Class)SSSApplication;
    BOOL v12 = [(SSSApplication *)&v14 runTest:v6 options:v7];
  }

  return v12;
}

+ (id)sharedSSSApplication
{
  return +[UIApplication sharedApplication];
}

- (id)_actionInActions:(id)a3 ofClass:(Class)a4
{
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v4 = a3;
  id v5 = [v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v13;
    while (2)
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v13 != v7) {
          objc_enumerationMutation(v4);
        }
        uint64_t v9 = *(void **)(*((void *)&v12 + 1) + 8 * i);
        if (objc_opt_isKindOfClass())
        {
          id v10 = v9;
          goto LABEL_11;
        }
      }
      id v6 = [v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
      if (v6) {
        continue;
      }
      break;
    }
  }
  id v10 = 0;
LABEL_11:

  return v10;
}

- (id)_screenshotActionInActions:(id)a3
{
  id v4 = a3;
  id v5 = [(SSSApplication *)self _actionInActions:v4 ofClass:objc_opt_class()];

  return v5;
}

- (id)_imageIdentifierActionInActions:(id)a3
{
  id v4 = a3;
  id v5 = [(SSSApplication *)self _actionInActions:v4 ofClass:objc_opt_class()];

  return v5;
}

- (id)_metadataUpdateActionInActions:(id)a3
{
  id v4 = a3;
  id v5 = [(SSSApplication *)self _actionInActions:v4 ofClass:objc_opt_class()];

  return v5;
}

- (id)_documentUpdateActionInActions:(id)a3
{
  id v4 = a3;
  id v5 = [(SSSApplication *)self _actionInActions:v4 ofClass:objc_opt_class()];

  return v5;
}

- (id)_preheatActionInActions:(id)a3
{
  id v4 = a3;
  id v5 = [(SSSApplication *)self _actionInActions:v4 ofClass:objc_opt_class()];

  return v5;
}

- (void)_handlePlatformSpecificActions:(id)a3 forScene:(id)a4 withTransitionContext:(id)a5
{
  id v6 = a3;
  uint64_t v7 = [(SSSApplication *)self _screenshotActionInActions:v6];
  if (v7)
  {
    id v8 = _SSSignpostLog();
    if (os_signpost_enabled(v8))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v8, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "SendScreenshot", (const char *)&unk_100093E93, buf, 2u);
    }

    uint64_t v9 = os_log_create("com.apple.screenshotservices", "Performance");
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_INFO, "END \"SendScreenshot\"", buf, 2u);
    }

    id v10 = [v7 info];
    dispatch_time_t v11 = [v10 objectForSetting:1];

    if (v11)
    {
      long long v12 = [(SSSApplication *)self sssAppDelegate];
      long long v13 = [v12 viewControllerManager];
      v46[0] = _NSConcreteStackBlock;
      v46[1] = 3221225472;
      v46[2] = sub_10000EB74;
      v46[3] = &unk_100099A20;
      id v47 = v7;
      [v13 receiveEnvironmentDescription:v11 completion:v46];
    }
  }
  long long v14 = [(SSSApplication *)self _imageIdentifierActionInActions:v6];
  long long v15 = v14;
  if (v14)
  {
    v16 = [v14 info];
    long long v17 = [v16 objectForSetting:2];

    if (v17)
    {
      long long v18 = os_log_create("com.apple.screenshotservices", "XPC");
      if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
      {
        long long v19 = [v17 loggableDescription];
        *(_DWORD *)buf = 138412290;
        id v49 = v19;
        _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_INFO, "Service received image identifier update %@", buf, 0xCu);
      }
      long long v20 = +[SSSScreenshotManager sharedScreenshotManager];
      [v20 processImageIdentifierUpdate:v17];
    }
  }
  v21 = [(SSSApplication *)self _metadataUpdateActionInActions:v6];
  v22 = v21;
  if (v21)
  {
    v23 = [v21 info];
    v24 = [v23 objectForSetting:5];

    if (v24)
    {
      v25 = os_log_create("com.apple.screenshotservices", "XPC");
      if (os_log_type_enabled(v25, OS_LOG_TYPE_INFO))
      {
        v26 = [v24 loggableDescription];
        *(_DWORD *)buf = 138412290;
        id v49 = v26;
        _os_log_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_INFO, "Service received metadata update %@", buf, 0xCu);
      }
      v27 = +[SSSScreenshotManager sharedScreenshotManager];
      [v27 processEnvironmentElementMetadataUpdate:v24];
    }
    id v28 = objc_alloc_init((Class)BSMutableSettings);
    [v28 setFlag:BSSettingFlagForBool() forSetting:8];
    v29 = +[BSActionResponse responseWithInfo:v28];
    [v22 sendResponse:v29];
  }
  v30 = [(SSSApplication *)self _documentUpdateActionInActions:v6];
  v31 = v30;
  if (v30)
  {
    v32 = [v30 info];
    v33 = [v32 objectForSetting:6];

    if (v33)
    {
      v34 = os_log_create("com.apple.screenshotservices", "XPC");
      if (os_log_type_enabled(v34, OS_LOG_TYPE_INFO))
      {
        v35 = [v33 loggableDescription];
        *(_DWORD *)buf = 138412290;
        id v49 = v35;
        _os_log_impl((void *)&_mh_execute_header, v34, OS_LOG_TYPE_INFO, "Service received document update %@", buf, 0xCu);
      }
      v36 = +[SSSScreenshotManager sharedScreenshotManager];
      [v36 processEnvironmentElementDocumentUpdate:v33];
    }
  }
  v37 = [(SSSApplication *)self _preheatActionInActions:v6];
  v38 = v37;
  if (v37)
  {
    v39 = [v37 info];
    v40 = [v39 objectForSetting:9];
    id v41 = [v40 integerValue];

    v42 = os_log_create("com.apple.screenshotservices", "XPC");
    if (os_log_type_enabled(v42, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 134217984;
      id v49 = v41;
      _os_log_impl((void *)&_mh_execute_header, v42, OS_LOG_TYPE_INFO, "Service received preheat request for presentation mode: %td", buf, 0xCu);
    }

    v43 = [(SSSApplication *)self sssAppDelegate];
    v44 = [v43 viewControllerManager];
    [v44 preheatWithPresentationMode:v41];

    v45 = +[BSActionResponse response];
    [v38 sendResponse:v45];
  }
}

- (BOOL)_canAnimateDragCancelInApp
{
  return 1;
}

@end