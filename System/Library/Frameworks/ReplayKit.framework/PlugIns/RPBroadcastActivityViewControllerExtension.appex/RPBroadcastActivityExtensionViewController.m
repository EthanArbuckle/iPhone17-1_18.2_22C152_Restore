@interface RPBroadcastActivityExtensionViewController
- (NSMutableArray)streamingActivities;
- (OS_dispatch_queue)replyQueue;
- (UIAlertController)alertController;
- (id)_autoOptedInExtensionBundleIdentifiers;
- (void)_autoOptInExtensionIfNeverOptedIn:(id)a3;
- (void)extensionDidFinishWithLaunchURL:(id)a3 broadcastURL:(id)a4 extensionBundleID:(id)a5 cancelled:(BOOL)a6;
- (void)loadHostAppInfo:(id)a3;
- (void)loadItems:(id)a3 withHandler:(id)a4;
- (void)loadStreamingActivitiesWithHandler:(id)a3;
- (void)loadView;
- (void)setAlertController:(id)a3;
- (void)setReplyQueue:(id)a3;
- (void)setStreamingActivities:(id)a3;
- (void)setUpActivityViewController:(id)a3 hostBundleID:(id)a4 iconImage:(id)a5 activities:(id)a6 weakSelf:(id)a7;
- (void)setupSingleExtensionView:(id)a3 hostBundleID:(id)a4 preferredExtension:(id)a5 iconImage:(id)a6 appName:(id)a7 activities:(id)a8;
- (void)showNotInstalledAlert:(id)a3 appName:(id)a4 broadcastActivitiesNotInstalledAlertTitle:(id)a5 broadcastActivitiesNotInstalledAlertMessage:(id)a6;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidLoad;
- (void)viewWillAppear:(BOOL)a3;
@end

@implementation RPBroadcastActivityExtensionViewController

- (void)loadView
{
  if (__RPLogLevel <= 1u && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136446722;
    v5 = "-[RPBroadcastActivityExtensionViewController loadView]";
    __int16 v6 = 1024;
    int v7 = 71;
    __int16 v8 = 2048;
    v9 = self;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d %p", buf, 0x1Cu);
  }
  v3.receiver = self;
  v3.super_class = (Class)RPBroadcastActivityExtensionViewController;
  [(RPBroadcastActivityExtensionViewController *)&v3 loadView];
}

- (void)viewWillAppear:(BOOL)a3
{
  BOOL v3 = a3;
  if (__RPLogLevel <= 1u && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136446722;
    int v7 = "-[RPBroadcastActivityExtensionViewController viewWillAppear:]";
    __int16 v8 = 1024;
    int v9 = 76;
    __int16 v10 = 2048;
    v11 = self;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d %p", buf, 0x1Cu);
  }
  v5.receiver = self;
  v5.super_class = (Class)RPBroadcastActivityExtensionViewController;
  [(RPBroadcastActivityExtensionViewController *)&v5 viewWillAppear:v3];
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, &stru_10000C2D0);
}

- (void)viewDidAppear:(BOOL)a3
{
  BOOL v3 = a3;
  if (__RPLogLevel <= 1u && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136446722;
    v11 = "-[RPBroadcastActivityExtensionViewController viewDidAppear:]";
    __int16 v12 = 1024;
    int v13 = 88;
    __int16 v14 = 2048;
    v15 = self;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d %p", buf, 0x1Cu);
  }
  v9.receiver = self;
  v9.super_class = (Class)RPBroadcastActivityExtensionViewController;
  [(RPBroadcastActivityExtensionViewController *)&v9 viewDidAppear:v3];
  objc_super v5 = (OS_dispatch_queue *)dispatch_queue_create("com.apple.ReplayKit.RPBroadcastActivityExtension.replyQueue", 0);
  replyQueue = self->_replyQueue;
  self->_replyQueue = v5;

  objc_initWeak((id *)buf, self);
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_100003DB0;
  v7[3] = &unk_10000C320;
  v7[4] = self;
  objc_copyWeak(&v8, (id *)buf);
  [(RPBroadcastActivityExtensionViewController *)self loadHostAppInfo:v7];
  objc_destroyWeak(&v8);
  objc_destroyWeak((id *)buf);
}

- (void)setupSingleExtensionView:(id)a3 hostBundleID:(id)a4 preferredExtension:(id)a5 iconImage:(id)a6 appName:(id)a7 activities:(id)a8
{
  id v13 = a3;
  id v50 = a4;
  id v14 = a5;
  id v15 = a6;
  id v16 = a7;
  id v17 = a8;
  if (__RPLogLevel <= 1u && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136446722;
    v77 = "-[RPBroadcastActivityExtensionViewController setupSingleExtensionView:hostBundleID:preferredExtension:iconImag"
          "e:appName:activities:]";
    __int16 v78 = 1024;
    int v79 = 167;
    __int16 v80 = 2048;
    v81 = self;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d %p", buf, 0x1Cu);
  }
  v47 = v15;
  long long v71 = 0u;
  long long v72 = 0u;
  long long v69 = 0u;
  long long v70 = 0u;
  id v18 = v17;
  id v51 = [v18 countByEnumeratingWithState:&v69 objects:v75 count:16];
  if (!v51)
  {

LABEL_32:
    v42 = +[NSBundle _rpLocalizedStringFromFrameworkBundleWithKey:@"PREFERRED_BROADCAST_ACTIVITIES_NOT_INSTALLED_ALERT_TITLE"];
    v43 = +[NSBundle _rpLocalizedStringFromFrameworkBundleWithKey:@"PREFERRED_BROADCAST_ACTIVITIES_NOT_INSTALLED_ALERT_MESSAGE"];
    [v13 showNotInstalledAlert:v14 appName:v16 broadcastActivitiesNotInstalledAlertTitle:v42 broadcastActivitiesNotInstalledAlertMessage:v43];

    goto LABEL_33;
  }
  char v19 = 0;
  uint64_t v49 = *(void *)v70;
  v44 = v59;
  v45 = v54;
  id v46 = v14;
  id obj = v18;
  do
  {
    for (i = 0; i != v51; i = (char *)i + 1)
    {
      if (*(void *)v70 != v49) {
        objc_enumerationMutation(obj);
      }
      v21 = *(void **)(*((void *)&v69 + 1) + 8 * i);
      if (__RPLogLevel <= 1u && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136446722;
        v77 = "-[RPBroadcastActivityExtensionViewController setupSingleExtensionView:hostBundleID:preferredExtension:icon"
              "Image:appName:activities:]";
        __int16 v78 = 1024;
        int v79 = 174;
        __int16 v80 = 2048;
        v81 = self;
        _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d %p checking activity", buf, 0x1Cu);
      }
      v22 = objc_msgSend(v21, "applicationExtension", v44, v45);
      v23 = [v22 identifier];
      unsigned int v24 = [v14 isEqualToString:v23];

      if (v24)
      {
        if (__RPLogLevel <= 1u && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 136446722;
          v77 = "-[RPBroadcastActivityExtensionViewController setupSingleExtensionView:hostBundleID:preferredExtension:ic"
                "onImage:appName:activities:]";
          __int16 v78 = 1024;
          int v79 = 178;
          __int16 v80 = 2048;
          v81 = self;
          _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d %p found matching activity", buf, 0x1Cu);
        }
        v25 = objc_alloc_init(RPUIActivityItem);
        v26 = v25;
        if (v47) {
          [(RPUIActivityItem *)v25 setAppIcon:v47];
        }
        [(RPUIActivityItem *)v26 setAppName:v16];
        v27 = objc_alloc_init(RPStreamingActivityKey);
        v74[0] = v26;
        v74[1] = v27;
        v74[2] = v50;
        v74[3] = v16;
        v28 = v16;
        v29 = +[NSArray arrayWithObjects:v74 count:4];
        id v30 = [v29 mutableCopy];

        if (v47) {
          [v30 addObject:v47];
        }
        id v73 = v30;
        v31 = +[NSArray arrayWithObjects:&v73 count:1];
        [v21 prepareWithActivityItems:v31];

        v67[0] = _NSConcreteStackBlock;
        v67[1] = 3221225472;
        v67[2] = sub_1000047E8;
        v67[3] = &unk_10000C348;
        id v32 = v13;
        id v33 = v13;
        id v68 = v33;
        v34 = [v21 applicationExtension];
        [v34 setRequestCancellationBlock:v67];

        v65[0] = _NSConcreteStackBlock;
        v65[1] = 3221225472;
        v65[2] = sub_100004800;
        v65[3] = &unk_10000C370;
        id v35 = v33;
        id v66 = v35;
        v36 = [v21 applicationExtension];
        [v36 setRequestInterruptionBlock:v65];

        v37 = [v21 applicationExtension];
        v61[0] = _NSConcreteStackBlock;
        v61[1] = 3221225472;
        v61[2] = sub_100004818;
        v61[3] = &unk_10000C410;
        id v38 = v35;
        id v62 = v38;
        v63 = self;
        id v39 = v50;
        id v64 = v39;
        [v37 setRequestCompletionBlock:v61];

        if ([v39 isEqualToString:@"com.apple.replayKit.ReplayKitTestRunneriOS"])
        {
          if (__RPLogLevel <= 1u && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 136446722;
            v77 = "-[RPBroadcastActivityExtensionViewController setupSingleExtensionView:hostBundleID:preferredExtension:"
                  "iconImage:appName:activities:]";
            __int16 v78 = 1024;
            int v79 = 235;
            __int16 v80 = 2048;
            v81 = self;
            _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d %p Bypass preferred extension alert for ReplayKitTestRunneriOS", buf, 0x1Cu);
          }
          v40 = [v21 applicationExtension];
          v58[0] = _NSConcreteStackBlock;
          v58[1] = 3221225472;
          v59[0] = sub_100004C0C;
          v59[1] = &unk_10000C438;
          v59[2] = self;
          id v60 = v38;
          [v40 instantiateViewControllerWithInputItems:&__NSArray0__struct connectionHandler:v58];

          v41 = v60;
        }
        else
        {
          block[0] = _NSConcreteStackBlock;
          block[1] = 3221225472;
          v54[0] = sub_100004D18;
          v54[1] = &unk_10000C4D8;
          id v55 = v28;
          v56 = v21;
          id v57 = v38;
          dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);

          v41 = v55;
        }

        id v13 = v32;
        char v19 = 1;
        id v14 = v46;
        id v16 = v28;
      }
    }
    id v18 = obj;
    id v51 = [obj countByEnumeratingWithState:&v69 objects:v75 count:16];
  }
  while (v51);

  if ((v19 & 1) == 0) {
    goto LABEL_32;
  }
LABEL_33:
}

- (void)setUpActivityViewController:(id)a3 hostBundleID:(id)a4 iconImage:(id)a5 activities:(id)a6 weakSelf:(id)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = (UIImage *)a5;
  id v15 = a6;
  id v16 = a7;
  if (__RPLogLevel <= 1u && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136446722;
    v41 = "-[RPBroadcastActivityExtensionViewController setUpActivityViewController:hostBundleID:iconImage:activities:weakSelf:]";
    __int16 v42 = 1024;
    int v43 = 304;
    __int16 v44 = 2048;
    v45 = self;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d %p", buf, 0x1Cu);
  }
  id v17 = objc_alloc_init(RPStreamingActivityKey);
  id v18 = objc_alloc_init(RPUIActivityItem);
  [(RPUIActivityItem *)v18 setAppIcon:v14];
  [(RPUIActivityItem *)v18 setAppName:v12];
  v38[0] = @"RPBroadcastExtensionKeyExtensionHostInfoAppName";
  v38[1] = @"RPBroadcastExtensionKeyExtensionHostInfoBundleID";
  id v30 = v12;
  v39[0] = v12;
  v39[1] = v13;
  char v19 = +[NSDictionary dictionaryWithObjects:v39 forKeys:v38 count:2];
  id v20 = [v19 mutableCopy];

  if (v14)
  {
    v21 = UIImagePNGRepresentation(v14);
    [v20 setObject:v21 forKeyedSubscript:@"RPBroadcastExtensionKeyExtensionHostInfoAppIcon"];
  }
  v22 = +[NSKeyedArchiver archivedDataWithRootObject:](NSKeyedArchiver, "archivedDataWithRootObject:", v20, self);
  v37[0] = v18;
  v37[1] = v17;
  v37[2] = v22;
  v23 = +[NSArray arrayWithObjects:v37 count:3];
  id v24 = [v23 mutableCopy];

  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  void block[2] = sub_100005378;
  block[3] = &unk_10000C5C8;
  id v32 = v24;
  id v33 = v15;
  uint64_t v34 = v29;
  id v35 = v16;
  id v36 = v13;
  id v25 = v13;
  id v26 = v16;
  id v27 = v15;
  id v28 = v24;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
}

- (void)showNotInstalledAlert:(id)a3 appName:(id)a4 broadcastActivitiesNotInstalledAlertTitle:(id)a5 broadcastActivitiesNotInstalledAlertMessage:(id)a6
{
  id v9 = a4;
  id v10 = a5;
  id v11 = a6;
  id v12 = +[NSBundle _rpLocalizedStringFromFrameworkBundleWithKey:@"BROADCAST_ACTIVITIES_NOT_INSTALLED_ALERT_TITLE"];
  if (v10)
  {
    id v13 = v10;
  }
  else
  {
    +[NSString stringWithFormat:](NSString, "stringWithFormat:", v12, v9);
    id v13 = (id)objc_claimAutoreleasedReturnValue();
  }
  id v14 = v13;
  if (v11)
  {
    id v15 = v11;
  }
  else
  {
    id v15 = +[NSBundle _rpLocalizedStringFromFrameworkBundleWithKey:@"BROADCAST_ACTIVITIES_NOT_INSTALLED_ALERT_MESSAGE"];
  }
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  void block[2] = sub_100005CD4;
  block[3] = &unk_10000C4D8;
  id v19 = v14;
  id v20 = v15;
  v21 = self;
  id v16 = v15;
  id v17 = v14;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
}

- (void)loadItems:(id)a3 withHandler:(id)a4
{
  id v6 = a3;
  id v16 = a4;
  if (__RPLogLevel <= 1u && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136446722;
    *(void *)&uint8_t buf[4] = "-[RPBroadcastActivityExtensionViewController loadItems:withHandler:]";
    *(_WORD *)&buf[12] = 1024;
    *(_DWORD *)&buf[14] = 435;
    *(_WORD *)&buf[18] = 2048;
    *(void *)&buf[20] = self;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d %p", buf, 0x1Cu);
  }
  int v7 = (id)kUTTypeData;
  *(void *)buf = 0;
  *(void *)&buf[8] = buf;
  *(void *)&buf[16] = 0x3032000000;
  *(void *)&buf[24] = sub_100006370;
  id v38 = sub_100006380;
  id v39 = 0;
  v34[0] = 0;
  v34[1] = v34;
  v34[2] = 0x3032000000;
  v34[3] = sub_100006370;
  v34[4] = sub_100006380;
  id v35 = &__NSDictionary0__struct;
  v32[0] = 0;
  v32[1] = v32;
  v32[2] = 0x3032000000;
  v32[3] = sub_100006370;
  v32[4] = sub_100006380;
  id v33 = +[NSData data];
  v30[0] = 0;
  v30[1] = v30;
  v30[2] = 0x3032000000;
  v30[3] = sub_100006370;
  v30[4] = sub_100006380;
  id v31 = 0;
  id v8 = [v6 count];
  v29[0] = 0;
  v29[1] = v29;
  v29[2] = 0x2020000000;
  v29[3] = 0;
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  id v9 = v6;
  id v10 = [v9 countByEnumeratingWithState:&v25 objects:v36 count:16];
  if (v10)
  {
    uint64_t v11 = *(void *)v26;
    do
    {
      for (i = 0; i != v10; i = (char *)i + 1)
      {
        if (*(void *)v26 != v11) {
          objc_enumerationMutation(v9);
        }
        id v13 = *(void **)(*((void *)&v25 + 1) + 8 * i);
        id v14 = [v13 attachments];
        id v15 = [v14 objectAtIndexedSubscript:0];

        if ([v15 hasItemConformingToTypeIdentifier:v7])
        {
          v17[0] = _NSConcreteStackBlock;
          v17[1] = 3221225472;
          v17[2] = sub_100006388;
          v17[3] = &unk_10000C5F0;
          v17[4] = v13;
          id v19 = buf;
          id v20 = v34;
          v21 = v32;
          v22 = v30;
          v23 = v29;
          id v24 = v8;
          id v18 = v16;
          [v15 loadItemForTypeIdentifier:v7 options:0 completionHandler:v17];
        }
      }
      id v10 = [v9 countByEnumeratingWithState:&v25 objects:v36 count:16];
    }
    while (v10);
  }

  _Block_object_dispose(v29, 8);
  _Block_object_dispose(v30, 8);

  _Block_object_dispose(v32, 8);
  _Block_object_dispose(v34, 8);

  _Block_object_dispose(buf, 8);
}

- (void)viewDidLoad
{
  if (__RPLogLevel <= 1u && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136446722;
    id v6 = "-[RPBroadcastActivityExtensionViewController viewDidLoad]";
    __int16 v7 = 1024;
    int v8 = 488;
    __int16 v9 = 2048;
    id v10 = self;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d %p", buf, 0x1Cu);
  }
  v4.receiver = self;
  v4.super_class = (Class)RPBroadcastActivityExtensionViewController;
  [(RPBroadcastActivityExtensionViewController *)&v4 viewDidLoad];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  void block[2] = sub_10000674C;
  block[3] = &unk_10000C618;
  void block[4] = self;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
}

- (void)loadHostAppInfo:(id)a3
{
  id v4 = a3;
  if (__RPLogLevel <= 1u && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136446722;
    *(void *)&uint8_t buf[4] = "-[RPBroadcastActivityExtensionViewController loadHostAppInfo:]";
    *(_WORD *)&buf[12] = 1024;
    *(_DWORD *)&buf[14] = 496;
    *(_WORD *)&buf[18] = 2048;
    *(void *)&buf[20] = self;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d %p", buf, 0x1Cu);
  }
  *(void *)buf = 0;
  *(void *)&buf[8] = buf;
  *(void *)&buf[16] = 0x3032000000;
  *(void *)&buf[24] = sub_100006370;
  v22 = sub_100006380;
  id v23 = 0;
  v19[0] = 0;
  v19[1] = v19;
  v19[2] = 0x3032000000;
  v19[3] = sub_100006370;
  v19[4] = sub_100006380;
  id v20 = 0;
  dispatch_group_t v5 = dispatch_group_create();
  id v6 = [(RPBroadcastActivityExtensionViewController *)self extensionContext];
  __int16 v7 = [v6 inputItems];
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_100006A9C;
  v15[3] = &unk_10000C668;
  int v8 = v5;
  id v16 = v8;
  id v17 = buf;
  id v18 = v19;
  [v7 enumerateObjectsUsingBlock:v15];

  __int16 v9 = [(RPBroadcastActivityExtensionViewController *)self replyQueue];
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_100006DA8;
  v11[3] = &unk_10000C690;
  id v12 = v4;
  id v13 = buf;
  id v14 = v19;
  id v10 = v4;
  dispatch_group_notify(v8, v9, v11);

  _Block_object_dispose(v19, 8);
  _Block_object_dispose(buf, 8);
}

- (void)extensionDidFinishWithLaunchURL:(id)a3 broadcastURL:(id)a4 extensionBundleID:(id)a5 cancelled:(BOOL)a6
{
  BOOL v6 = a6;
  id v10 = a5;
  id v11 = a4;
  id v12 = a3;
  id v14 = [(RPBroadcastActivityExtensionViewController *)self broadcastExtensionContext];
  id v13 = [v14 extensionObjectProxy];
  [v13 extensionDidFinishWithLaunchURL:v12 broadcastURL:v11 extensionBundleID:v10 cancelled:v6];
}

- (void)loadStreamingActivitiesWithHandler:(id)a3
{
  id v4 = (void (**)(void))a3;
  if (__RPLogLevel <= 1u && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136446722;
    int v8 = "-[RPBroadcastActivityExtensionViewController loadStreamingActivitiesWithHandler:]";
    __int16 v9 = 1024;
    int v10 = 564;
    __int16 v11 = 2048;
    id v12 = self;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d %p Loading streaming activities", buf, 0x1Cu);
  }
  if (self->_streamingActivities)
  {
    v4[2](v4);
  }
  else
  {
    v5[0] = _NSConcreteStackBlock;
    v5[1] = 3221225472;
    v5[2] = sub_10000712C;
    v5[3] = &unk_10000C6E0;
    v5[4] = self;
    BOOL v6 = v4;
    +[NSExtension extensionsWithMatchingPointName:@"com.apple.broadcast-services-setupui" completion:v5];
  }
}

- (id)_autoOptedInExtensionBundleIdentifiers
{
  v2 = +[NSUserDefaults standardUserDefaults];
  BOOL v3 = [v2 objectForKey:@"autoOptedInExtensions"];

  if (v3)
  {
    id v4 = v3;
  }
  else
  {
    id v4 = +[NSArray array];
  }
  dispatch_group_t v5 = v4;

  return v5;
}

- (void)_autoOptInExtensionIfNeverOptedIn:(id)a3
{
  id v4 = a3;
  dispatch_group_t v5 = [v4 _extensionBundle];
  BOOL v6 = [v5 bundleIdentifier];

  __int16 v7 = [(RPBroadcastActivityExtensionViewController *)self _autoOptedInExtensionBundleIdentifiers];
  unsigned __int8 v8 = [v7 containsObject:v6];

  if ((v8 & 1) == 0 && v6)
  {
    __int16 v9 = [(RPBroadcastActivityExtensionViewController *)self _autoOptedInExtensionBundleIdentifiers];
    int v10 = [v9 arrayByAddingObject:v6];

    __int16 v11 = +[NSUserDefaults standardUserDefaults];
    [v11 setObject:v10 forKey:@"autoOptedInExtensions"];

    id v12 = +[NSUserDefaults standardUserDefaults];
    [v12 synchronize];

    id v14 = 0;
    [v4 attemptOptIn:&v14];
    id v13 = v14;
    if (v13 && __RPLogLevel <= 2u && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      sub_100007EDC();
    }
  }
}

- (NSMutableArray)streamingActivities
{
  return self->_streamingActivities;
}

- (void)setStreamingActivities:(id)a3
{
}

- (UIAlertController)alertController
{
  return self->_alertController;
}

- (void)setAlertController:(id)a3
{
}

- (OS_dispatch_queue)replyQueue
{
  return self->_replyQueue;
}

- (void)setReplyQueue:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_replyQueue, 0);
  objc_storeStrong((id *)&self->_alertController, 0);

  objc_storeStrong((id *)&self->_streamingActivities, 0);
}

@end