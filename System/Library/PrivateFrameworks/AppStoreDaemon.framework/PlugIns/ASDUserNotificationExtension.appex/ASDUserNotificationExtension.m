id ASDLogHandleForCategory(uint64_t a1)
{
  void *v2;
  uint64_t vars8;

  if (qword_100008B08 != -1) {
    dispatch_once(&qword_100008B08, &stru_1000041C8);
  }
  v2 = (void *)qword_1000089B0[a1];
  return v2;
}

void sub_100001FD0(id a1)
{
  os_log_t v1 = os_log_create("com.apple.appstored", "Activity");
  v2 = (void *)qword_1000089B0;
  qword_1000089B0 = (uint64_t)v1;

  os_log_t v3 = os_log_create("com.apple.appstored", "AppCapabilities");
  v4 = (void *)qword_1000089B8;
  qword_1000089B8 = (uint64_t)v3;

  os_log_t v5 = os_log_create("com.apple.appstored", "AppInstall");
  v6 = (void *)qword_1000089C0;
  qword_1000089C0 = (uint64_t)v5;

  os_log_t v7 = os_log_create("com.apple.appstored", "AppUsage");
  v8 = (void *)qword_1000089C8;
  qword_1000089C8 = (uint64_t)v7;

  os_log_t v9 = os_log_create("com.apple.appstored", "Arcade");
  v10 = (void *)qword_1000089D0;
  qword_1000089D0 = (uint64_t)v9;

  os_log_t v11 = os_log_create("com.apple.appstored", "Bag");
  v12 = (void *)qword_1000089D8;
  qword_1000089D8 = (uint64_t)v11;

  os_log_t v13 = os_log_create("com.apple.appstored", "Cleanup");
  v14 = (void *)qword_1000089E0;
  qword_1000089E0 = (uint64_t)v13;

  os_log_t v15 = os_log_create("com.apple.appstored", "Clips");
  v16 = (void *)qword_1000089E8;
  qword_1000089E8 = (uint64_t)v15;

  os_log_t v17 = os_log_create("com.apple.appstored", "DAAP");
  v18 = (void *)qword_1000089F0;
  qword_1000089F0 = (uint64_t)v17;

  os_log_t v19 = os_log_create("com.apple.appstored", "Daemon");
  v20 = (void *)qword_1000089F8;
  qword_1000089F8 = (uint64_t)v19;

  os_log_t v21 = os_log_create("com.apple.appstored", "Download");
  v22 = (void *)qword_100008A00;
  qword_100008A00 = (uint64_t)v21;

  os_log_t v23 = os_log_create("com.apple.appstored", "EventsExtension");
  v24 = (void *)qword_100008A08;
  qword_100008A08 = (uint64_t)v23;

  os_log_t v25 = os_log_create("com.apple.appstored", "Extension");
  v26 = (void *)qword_100008A10;
  qword_100008A10 = (uint64_t)v25;

  os_log_t v27 = os_log_create("com.apple.appstored", "Framework");
  v28 = (void *)qword_100008A18;
  qword_100008A18 = (uint64_t)v27;

  os_log_t v29 = os_log_create("com.apple.appstored", "General");
  v30 = (void *)qword_100008A20;
  qword_100008A20 = (uint64_t)v29;

  os_log_t v31 = os_log_create("com.apple.appstored", "Library");
  v32 = (void *)qword_100008A28;
  qword_100008A28 = (uint64_t)v31;

  os_log_t v33 = os_log_create("com.apple.appstored", "Metrics");
  v34 = (void *)qword_100008A30;
  qword_100008A30 = (uint64_t)v33;

  os_log_t v35 = os_log_create("com.apple.appstored", "Migrate");
  v36 = (void *)qword_100008A38;
  qword_100008A38 = (uint64_t)v35;

  os_log_t v37 = os_log_create("com.apple.appstored", "StoreKitInXcode");
  v38 = (void *)qword_100008A40;
  qword_100008A40 = (uint64_t)v37;

  os_log_t v39 = os_log_create("com.apple.appstored", "ODR");
  v40 = (void *)qword_100008A48;
  qword_100008A48 = (uint64_t)v39;

  os_log_t v41 = os_log_create("com.apple.appstored", "Offloading");
  v42 = (void *)qword_100008A50;
  qword_100008A50 = (uint64_t)v41;

  os_log_t v43 = os_log_create("com.apple.appstored", "Daemon-Oversize");
  v44 = (void *)qword_100008A58;
  qword_100008A58 = (uint64_t)v43;

  os_log_t v45 = os_log_create("com.apple.appstored", "Performance");
  v46 = (void *)qword_100008A60;
  qword_100008A60 = (uint64_t)v45;

  os_log_t v47 = os_log_create("com.apple.appstored", "PrivilegedTask");
  v48 = (void *)qword_100008A68;
  qword_100008A68 = (uint64_t)v47;

  os_log_t v49 = os_log_create("com.apple.appstored", "Progress");
  v50 = (void *)qword_100008A70;
  qword_100008A70 = (uint64_t)v49;

  os_log_t v51 = os_log_create("com.apple.appstored", "Purchase");
  v52 = (void *)qword_100008A78;
  qword_100008A78 = (uint64_t)v51;

  os_log_t v53 = os_log_create("com.apple.appstored", "Push");
  v54 = (void *)qword_100008A80;
  qword_100008A80 = (uint64_t)v53;

  os_log_t v55 = os_log_create("com.apple.appstored", "QA");
  v56 = (void *)qword_100008A88;
  qword_100008A88 = (uint64_t)v55;

  os_log_t v57 = os_log_create("com.apple.appstored", "Repair");
  v58 = (void *)qword_100008A90;
  qword_100008A90 = (uint64_t)v57;

  os_log_t v59 = os_log_create("com.apple.appstored", "Restore");
  v60 = (void *)qword_100008A98;
  qword_100008A98 = (uint64_t)v59;

  os_log_t v61 = os_log_create("com.apple.appstored", "Scheduler");
  v62 = (void *)qword_100008AA0;
  qword_100008AA0 = (uint64_t)v61;

  os_log_t v63 = os_log_create("com.apple.appstored", "Signpost");
  v64 = (void *)qword_100008AA8;
  qword_100008AA8 = (uint64_t)v63;

  os_log_t v65 = os_log_create("com.apple.appstored", "SKAdNetwork");
  v66 = (void *)qword_100008AB0;
  qword_100008AB0 = (uint64_t)v65;

  os_log_t v67 = os_log_create("com.apple.appstored", "Skanner");
  v68 = (void *)qword_100008AB8;
  qword_100008AB8 = (uint64_t)v67;

  os_log_t v69 = os_log_create("com.apple.appstored", "SoftwareMap");
  v70 = (void *)qword_100008AC0;
  qword_100008AC0 = (uint64_t)v69;

  os_log_t v71 = os_log_create("com.apple.appstored", "SQL");
  v72 = (void *)qword_100008AC8;
  qword_100008AC8 = (uint64_t)v71;

  os_log_t v73 = os_log_create("com.apple.appstored", "StoreKit");
  v74 = (void *)qword_100008AD0;
  qword_100008AD0 = (uint64_t)v73;

  os_log_t v75 = os_log_create("com.apple.appstored", "Subscription");
  v76 = (void *)qword_100008AD8;
  qword_100008AD8 = (uint64_t)v75;

  os_log_t v77 = os_log_create("com.apple.appstored", "TestFlightFeedback");
  v78 = (void *)qword_100008AE0;
  qword_100008AE0 = (uint64_t)v77;

  os_log_t v79 = os_log_create("com.apple.appstored", "TestFlightExtension");
  v80 = (void *)qword_100008AE8;
  qword_100008AE8 = (uint64_t)v79;

  os_log_t v81 = os_log_create("com.apple.appstored", "Updates");
  v82 = (void *)qword_100008AF0;
  qword_100008AF0 = (uint64_t)v81;

  os_log_t v83 = os_log_create("com.apple.appstored", "VPP");
  v84 = (void *)qword_100008AF8;
  qword_100008AF8 = (uint64_t)v83;

  qword_100008B00 = (uint64_t)os_log_create("com.apple.appstored", "XDC");
  _objc_release_x1();
}

Bulletin *sub_10000254C(uint64_t a1, void *a2)
{
  id v2 = a2;
  self;
  os_log_t v3 = [v2 content];

  v4 = [v3 userInfo];

  os_log_t v5 = [Bulletin alloc];
  id v6 = v4;
  if (v5)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      os_log_t v7 = [(Bulletin *)v5 init];
      if (!v7) {
        goto LABEL_20;
      }
      v8 = [v6 objectForKey:@"actiontitle"];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        os_log_t v9 = (NSString *)[v8 copy];
        actionButtonTitle = v7->_actionButtonTitle;
        v7->_actionButtonTitle = v9;
      }
      os_log_t v11 = [v6 objectForKey:@"actionurl"];

      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        v12 = (NSURL *)[objc_alloc((Class)NSURL) initWithString:v11];
        actionButtonURL = v7->_actionButtonURL;
        v7->_actionButtonURL = v12;
      }
      v14 = [v6 objectForKey:@"date"];

      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        os_log_t v15 = (NSDate *)[v14 copy];
        creationDate = v7->_creationDate;
        v7->_creationDate = v15;
      }
      os_log_t v17 = [v6 objectForKey:@"msg"];

      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        v18 = (NSString *)[v17 copy];
        message = v7->_message;
        v7->_message = v18;
      }
      v20 = [v6 objectForKey:@"rid"];

      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        os_log_t v21 = (NSString *)[v20 copy];
        recordID = v7->_recordID;
        v7->_recordID = v21;
      }
      os_log_t v23 = [v6 objectForKey:@"title"];

      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        v24 = (NSString *)[v23 copy];
        title = v7->_title;
        v7->_title = v24;
      }
      os_log_t v5 = [v6 objectForKey:@"url"];

      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        v26 = (NSURL *)[objc_alloc((Class)NSURL) initWithString:v5];
        launchURL = v7->_launchURL;
        v7->_launchURL = v26;
      }
    }
    else
    {
      os_log_t v7 = 0;
    }
  }
  else
  {
    os_log_t v7 = 0;
  }
LABEL_20:

  return v7;
}

void sub_100002844(uint64_t a1, void *a2)
{
  id v3 = a2;
  v4 = v3;
  if (a1)
  {
    os_log_t v5 = [v3 actionIdentifier];
    id v6 = ASDLogHandleForCategory(9);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543618;
      id v28 = (id)objc_opt_class();
      __int16 v29 = 2114;
      id v30 = v5;
      id v7 = v28;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "[%{public}@]: Handling notification response with actionId: %{public}@", buf, 0x16u);
    }
    if ([v5 isEqualToString:UNNotificationDefaultActionIdentifier])
    {
      uint64_t v8 = 24;
    }
    else
    {
      if ([v5 isEqualToString:UNNotificationDismissActionIdentifier])
      {
LABEL_17:

        goto LABEL_18;
      }
      uint64_t v8 = 16;
    }
    id v9 = *(id *)(a1 + v8);
    if (v9)
    {
      v10 = v9;
      v25[0] = FBSOpenApplicationOptionKeyPromptUnlockDevice;
      v25[1] = FBSOpenApplicationOptionKeyUnlockDevice;
      v26[0] = &__kCFBooleanTrue;
      v26[1] = &__kCFBooleanTrue;
      v25[2] = FBSOpenApplicationOptionKeyLaunchOrigin;
      v26[2] = @"appstored";
      os_log_t v11 = +[NSDictionary dictionaryWithObjects:v26 forKeys:v25 count:3];
      v12 = [v4 notification];
      os_log_t v13 = [v12 request];
      v14 = [v13 identifier];
      unsigned int v15 = [v14 isEqualToString:@"com.apple.appstored.authenticate.watch"];

      v16 = +[LSApplicationWorkspace defaultWorkspace];
      os_log_t v17 = v16;
      if (v15)
      {
        uint64_t v24 = 0;
        v18 = (id *)&v24;
        [v16 openSensitiveURL:v10 withOptions:v11 error:&v24];
      }
      else
      {
        uint64_t v23 = 0;
        v18 = (id *)&v23;
        [v16 openURL:v10 withOptions:v11 error:&v23];
      }
      id v19 = *v18;

      if (v19)
      {
        v20 = ASDLogHandleForCategory(9);
        if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
        {
          os_log_t v21 = objc_opt_class();
          *(_DWORD *)buf = 138543618;
          id v28 = v21;
          __int16 v29 = 2114;
          id v30 = v19;
          id v22 = v21;
          _os_log_error_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_ERROR, "[%{public}@]: Error opening URL. Error: %{public}@", buf, 0x16u);
        }
      }
    }
    goto LABEL_17;
  }
LABEL_18:
}

uint64_t NSExtensionMain()
{
  return _NSExtensionMain();
}

void NSLog(NSString *format, ...)
{
}

void _os_log_error_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
}

id objc_alloc(Class a1)
{
  return _[a1 alloc];
}

uint64_t objc_alloc_init()
{
  return _objc_alloc_init();
}

id objc_autoreleaseReturnValue(id a1)
{
  return _objc_autoreleaseReturnValue(a1);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return _objc_claimAutoreleasedReturnValue();
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return _objc_msgSendSuper2(a1, a2);
}

uint64_t objc_opt_class()
{
  return _objc_opt_class();
}

uint64_t objc_opt_isKindOfClass()
{
  return _objc_opt_isKindOfClass();
}

uint64_t self
{
  return _self;
}

void objc_release(id a1)
{
}

id objc_retain(id a1)
{
  return _objc_retain(a1);
}

id objc_retainAutoreleaseReturnValue(id a1)
{
  return _a1;
}

void objc_storeStrong(id *location, id obj)
{
}

os_log_t os_log_create(const char *subsystem, const char *category)
{
  return _os_log_create(subsystem, category);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return _os_log_type_enabled(oslog, type);
}

id objc_msgSend_UUID(void *a1, const char *a2, ...)
{
  return [a1 UUID];
}

id objc_msgSend_UUIDString(void *a1, const char *a2, ...)
{
  return [a1 UUIDString];
}

id objc_msgSend_actionIdentifier(void *a1, const char *a2, ...)
{
  return [a1 actionIdentifier];
}

id objc_msgSend_content(void *a1, const char *a2, ...)
{
  return [a1 content];
}

id objc_msgSend_copy(void *a1, const char *a2, ...)
{
  return [a1 copy];
}

id objc_msgSend_defaultWorkspace(void *a1, const char *a2, ...)
{
  return [a1 defaultWorkspace];
}

id objc_msgSend_identifier(void *a1, const char *a2, ...)
{
  return [a1 identifier];
}

id objc_msgSend_init(void *a1, const char *a2, ...)
{
  return [a1 init];
}

id objc_msgSend_notification(void *a1, const char *a2, ...)
{
  return [a1 notification];
}

id objc_msgSend_request(void *a1, const char *a2, ...)
{
  return [a1 request];
}

id objc_msgSend_userInfo(void *a1, const char *a2, ...)
{
  return [a1 userInfo];
}

id objc_msgSend_userNotificationFromNotification_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "userNotificationFromNotification:");
}