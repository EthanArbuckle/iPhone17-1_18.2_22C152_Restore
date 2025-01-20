@interface ODRClient
+ (void)initialize;
- (void)beginODRSessionWithBundleURL:(id)a3 completionHandler:(id)a4;
- (void)beginWithBundleURL:(id)a3 completionHandler:(id)a4;
- (void)conditionallyPinTags:(id)a3 inBundle:(id)a4 completionHandler:(id)a5;
- (void)hello:(id)a3;
- (void)okToPurgeAssetPacks:(id)a3;
- (void)pinTags:(id)a3 inBundle:(id)a4 priority:(double)a5 completionHandler:(id)a6;
- (void)setAlwaysPreserved:(BOOL)a3 forTags:(id)a4 inBundle:(id)a5;
- (void)setLoadingPriority:(double)a3 forTags:(id)a4 inBundle:(id)a5;
- (void)setPreservationPriority:(double)a3 forTags:(id)a4 inBundle:(id)a5;
- (void)tagStateInBundle:(id)a3 completionHandler:(id)a4;
- (void)unpinTags:(id)a3 inBundle:(id)a4 completionHandler:(id)a5;
@end

@implementation ODRClient

+ (void)initialize
{
  if (qword_1005B0D28 != -1) {
    dispatch_once(&qword_1005B0D28, &stru_1005251D8);
  }
}

- (void)hello:(id)a3
{
  v4 = (void (**)(void))a3;
  v4[2]();
  if (!self->_isUnsupportedApp)
  {
    [(NSLock *)self->_readyLock lock];
    v5 = objc_getProperty(self, v6, 72, 1);
    if (!v5) {
      goto LABEL_18;
    }
    v7 = ASDLogHandleForCategory();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      LODWORD(buf) = 138543362;
      *(void *)((char *)&buf + 4) = v5;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Doing the initial handshake with Application [%{public}@]", (uint8_t *)&buf, 0xCu);
    }

    *(void *)&long long buf = 0;
    *((void *)&buf + 1) = &buf;
    uint64_t v19 = 0x2020000000;
    uint64_t v20 = 1;
    v8 = sub_1002393C4();
    v15[0] = _NSConcreteStackBlock;
    v15[1] = 3221225472;
    v15[2] = sub_100299D14;
    v15[3] = &unk_100523B10;
    v15[4] = self;
    v15[5] = &buf;
    [v8 readUsingSession:v15];

    uint64_t v9 = *(void *)(*((void *)&buf + 1) + 24);
    if ((unint64_t)(v9 - 2) < 2)
    {
      v10 = sub_10035FE84([ODRApplicationImportTask alloc], self->_application);
      v14[0] = _NSConcreteStackBlock;
      v14[1] = 3221225472;
      v14[2] = sub_100299F8C;
      v14[3] = &unk_100521388;
      v14[4] = self;
      [v10 setCompletionBlock:v14];
      sub_10026F10C((uint64_t)ODRTaskQueue, v10, 25);
    }
    else
    {
      if (v9 != 4)
      {
        if (v9 == 5)
        {
          sub_100299D54((uint64_t)self);
        }
        else
        {
          v11 = ASDLogHandleForCategory();
          if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
          {
            application = self->_application;
            *(_DWORD *)v16 = 138543362;
            v17 = application;
            _os_log_error_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_ERROR, "Connected application does not support ODR: %{public}@", v16, 0xCu);
          }

          sub_100299F9C((uint64_t)self);
        }
        goto LABEL_17;
      }
      v10 = sub_100283AA0([ODRApplicationRepairTask alloc], self->_application);
      v13[0] = _NSConcreteStackBlock;
      v13[1] = 3221225472;
      v13[2] = sub_100299F94;
      v13[3] = &unk_100521388;
      v13[4] = self;
      [v10 setCompletionBlock:v13];
      sub_10026F10C((uint64_t)ODRTaskQueue, v10, 25);
    }

LABEL_17:
    _Block_object_dispose(&buf, 8);
    goto LABEL_18;
  }
  v5 = ASDLogHandleForCategory();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
  {
    LODWORD(buf) = 136446210;
    *(void *)((char *)&buf + 4) = "-[ODRClient hello:]";
    _os_log_error_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_ERROR, "Ignoring call from unsupported app (%{public}s)", (uint8_t *)&buf, 0xCu);
  }
LABEL_18:
}

- (void)beginODRSessionWithBundleURL:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  v8 = (void (**)(id, void))a4;
  if (self->_isUnsupportedApp)
  {
    uint64_t v9 = ASDLogHandleForCategory();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      LODWORD(v29) = 136446210;
      *(void *)((char *)&v29 + 4) = "-[ODRClient beginODRSessionWithBundleURL:completionHandler:]";
      _os_log_error_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_ERROR, "Ignoring call from unsupported app (%{public}s)", (uint8_t *)&v29, 0xCu);
    }

    v8[2](v8, 0);
  }
  else
  {
    id v10 = objc_getProperty(self, v7, 72, 1);
    if (v10)
    {
      *(void *)&long long v29 = 0;
      *((void *)&v29 + 1) = &v29;
      uint64_t v30 = 0x3032000000;
      v31 = sub_100018078;
      v32 = sub_100017BF8;
      id v33 = 0;
      v11 = sub_1002393C4();
      v24[0] = _NSConcreteStackBlock;
      v24[1] = 3221225472;
      v24[2] = sub_10029A408;
      v24[3] = &unk_100523B10;
      v24[4] = self;
      v24[5] = &v29;
      [v11 readUsingSession:v24];

      v12 = *(void **)(*((void *)&v29 + 1) + 40);
      if (v12)
      {
        v13 = sub_1002AEBB0(v12);
        if (v13)
        {
          uint64_t v14 = sub_1003F9F04();
          v15 = (void *)v14;
          if (v14) {
            v16 = *(void **)(v14 + 32);
          }
          else {
            v16 = 0;
          }
          v17 = v16;

          v18 = [v17 stringByAppendingPathComponent:v13];
          sub_10029A460((uint64_t)self, v18);
          uint64_t v19 = (NSDictionary *)objc_claimAutoreleasedReturnValue();
          sandboxExtension = self->_sandboxExtension;
          self->_sandboxExtension = v19;

          v21 = ASDLogHandleForCategory();
          if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
          {
            v22 = self->_sandboxExtension;
            *(_DWORD *)long long buf = 138543618;
            id v26 = v10;
            __int16 v27 = 2112;
            v28 = v22;
            _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_DEFAULT, "Granted sandbox extension to: %{public}@ %@", buf, 0x16u);
          }
        }
        else
        {
          v17 = ASDLogHandleForCategory();
          if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)long long buf = 138543362;
            id v26 = v10;
            _os_log_error_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_ERROR, "No storage ID found in manifest for bundle ID %{public}@", buf, 0xCu);
          }
        }
      }
      else
      {
        v13 = ASDLogHandleForCategory();
        if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)long long buf = 138543362;
          id v26 = v10;
          _os_log_error_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_ERROR, "No manifest found for bundle ID %{public}@", buf, 0xCu);
        }
      }

      _Block_object_dispose(&v29, 8);
    }
    else
    {
      v23 = ASDLogHandleForCategory();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
      {
        LOWORD(v29) = 0;
        _os_log_error_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_ERROR, "Application handshake failed with no applicationID. No sandbox extensions will be granted.", (uint8_t *)&v29, 2u);
      }
    }
    ((void (**)(id, NSDictionary *))v8)[2](v8, self->_sandboxExtension);
  }
}

- (void)beginWithBundleURL:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  v8 = (void (**)(id, void, void *))a4;
  if (self->_isUnsupportedApp)
  {
    uint64_t v9 = ASDLogHandleForCategory();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      LODWORD(v41) = 136446210;
      *(void *)((char *)&v41 + 4) = "-[ODRClient beginWithBundleURL:completionHandler:]";
      _os_log_error_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_ERROR, "Ignoring call from unsupported app (%{public}s)", (uint8_t *)&v41, 0xCu);
    }

    NSErrorUserInfoKey v46 = NSDebugDescriptionErrorKey;
    CFStringRef v47 = @"On-Demand Resources are not available to this app";
    id v10 = +[NSDictionary dictionaryWithObjects:&v47 forKeys:&v46 count:1];
    v11 = +[NSError errorWithDomain:NSCocoaErrorDomain code:4099 userInfo:v10];
    v8[2](v8, 0, v11);
  }
  else
  {
    id v10 = objc_getProperty(self, v7, 72, 1);
    if (v10)
    {
      *(void *)&long long v41 = 0;
      *((void *)&v41 + 1) = &v41;
      uint64_t v42 = 0x3032000000;
      v43 = sub_100018078;
      v44 = sub_100017BF8;
      id v45 = 0;
      v12 = sub_1002393C4();
      v30[0] = _NSConcreteStackBlock;
      v30[1] = 3221225472;
      v30[2] = sub_10029AB90;
      v30[3] = &unk_100523B10;
      v30[4] = self;
      v30[5] = &v41;
      [v12 readUsingSession:v30];

      v13 = *(void **)(*((void *)&v41 + 1) + 40);
      if (v13)
      {
        uint64_t v14 = sub_1002AEBB0(v13);
        if (v14)
        {
          uint64_t v15 = sub_1003F9F04();
          v16 = (void *)v15;
          if (v15) {
            v17 = *(void **)(v15 + 32);
          }
          else {
            v17 = 0;
          }
          id v18 = v17;

          uint64_t v19 = [v18 stringByAppendingPathComponent:v14];
          sub_10029A460((uint64_t)self, v19);
          uint64_t v20 = (NSDictionary *)objc_claimAutoreleasedReturnValue();
          sandboxExtension = self->_sandboxExtension;
          self->_sandboxExtension = v20;

          v22 = ASDLogHandleForCategory();
          if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
          {
            v23 = self->_sandboxExtension;
            *(_DWORD *)long long buf = 138543618;
            id v38 = v10;
            __int16 v39 = 2112;
            v40 = v23;
            _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_DEFAULT, "Granted sandbox extension to: %{public}@ %@", buf, 0x16u);
          }

          v11 = 0;
        }
        else
        {
          id v18 = +[NSString stringWithFormat:@"No storage ID found in manifest for bundle ID %@", v10];
          __int16 v27 = ASDLogHandleForCategory();
          if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)long long buf = 138543362;
            id v38 = v18;
            _os_log_error_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_ERROR, "%{public}@", buf, 0xCu);
          }

          NSErrorUserInfoKey v35 = NSLocalizedFailureReasonErrorKey;
          id v36 = v18;
          uint64_t v19 = +[NSDictionary dictionaryWithObjects:&v36 forKeys:&v35 count:1];
          v11 = +[NSError errorWithDomain:_NSBundleResourceRequestErrorDomain code:101 userInfo:v19];
        }
      }
      else
      {
        uint64_t v14 = +[NSString stringWithFormat:@"No manifest found for bundle ID %@", v10];
        id v26 = ASDLogHandleForCategory();
        if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)long long buf = 138543362;
          id v38 = v14;
          _os_log_error_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_ERROR, "%{public}@", buf, 0xCu);
        }

        NSErrorUserInfoKey v33 = NSLocalizedFailureReasonErrorKey;
        v34 = v14;
        id v18 = +[NSDictionary dictionaryWithObjects:&v34 forKeys:&v33 count:1];
        v11 = +[NSError errorWithDomain:_NSBundleResourceRequestErrorDomain code:100 userInfo:v18];
      }

      _Block_object_dispose(&v41, 8);
    }
    else
    {
      v24 = ASDLogHandleForCategory();
      if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
      {
        LODWORD(v41) = 138543362;
        *(void *)((char *)&v41 + 4) = @"Application handshake failed with no application bundle ID. No sandbox extensions will be granted.";
        _os_log_error_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_ERROR, "%{public}@", (uint8_t *)&v41, 0xCu);
      }

      NSErrorUserInfoKey v31 = NSLocalizedFailureReasonErrorKey;
      CFStringRef v32 = @"Application handshake failed with no application bundle ID. No sandbox extensions will be granted.";
      v25 = +[NSDictionary dictionaryWithObjects:&v32 forKeys:&v31 count:1];
      v11 = +[NSError errorWithDomain:_NSBundleResourceRequestErrorDomain code:100 userInfo:v25];
    }
    v28 = self->_sandboxExtension;
    long long v29 = +[ODRPublicErrorMapping publicErrorForError:v11];
    ((void (**)(id, NSDictionary *, void *))v8)[2](v8, v28, v29);
  }
}

- (void)tagStateInBundle:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  v7 = (void (**)(id, void, void *))a4;
  if (v6)
  {
    if (self->_isUnsupportedApp)
    {
      v8 = ASDLogHandleForCategory();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)long long buf = 136446210;
        *(void *)&uint8_t buf[4] = "-[ODRClient tagStateInBundle:completionHandler:]";
        _os_log_error_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_ERROR, "Ignoring call from unsupported app (%{public}s)", buf, 0xCu);
      }

      NSErrorUserInfoKey v40 = NSDebugDescriptionErrorKey;
      CFStringRef v41 = @"On-Demand Resources are not available to this app";
      uint64_t v9 = +[NSDictionary dictionaryWithObjects:&v41 forKeys:&v40 count:1];
      id v10 = +[NSError errorWithDomain:NSCocoaErrorDomain code:4099 userInfo:v9];
      v7[2](v7, 0, v10);
    }
    else
    {
      uint64_t v29 = [v6 URLByResolvingSymlinksInPath];

      v13 = ASDLogHandleForCategory();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)long long buf = 136446466;
        *(void *)&uint8_t buf[4] = "-[ODRClient tagStateInBundle:completionHandler:]";
        *(_WORD *)&buf[12] = 2114;
        *(void *)&buf[14] = v29;
        _os_log_debug_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEBUG, "%{public}s BundleURL [%{public}@]", buf, 0x16u);
      }

      v28 = self->_readyLock;
      [(NSLock *)v28 lock];
      +[NSBundle bundleWithURL:v29];
      id v26 = v34[6] = 0;
      uint64_t v14 = +[NSBundleResourceRequest _manifestWithBundle:error:](NSBundleResourceRequest, "_manifestWithBundle:error:");
      id v15 = 0;
      v25 = v15;
      if (v14)
      {
        v16 = +[NSMutableDictionary dictionary];
        *(void *)long long buf = 0;
        *(void *)&buf[8] = buf;
        *(void *)&buf[16] = 0x3032000000;
        v37 = sub_100018078;
        id v38 = sub_100017BF8;
        id v39 = 0;
        v17 = sub_1002393C4();
        v34[0] = _NSConcreteStackBlock;
        v34[1] = 3221225472;
        v34[2] = sub_10029B1DC;
        v34[3] = &unk_100523B10;
        v34[4] = self;
        v34[5] = buf;
        [v17 readUsingSession:v34];

        long long v32 = 0u;
        long long v33 = 0u;
        long long v30 = 0u;
        long long v31 = 0u;
        id v18 = *(id *)(*(void *)&buf[8] + 40);
        id v19 = [v18 countByEnumeratingWithState:&v30 objects:v35 count:16];
        if (v19)
        {
          uint64_t v20 = *(void *)v31;
          do
          {
            for (i = 0; i != v19; i = (char *)i + 1)
            {
              if (*(void *)v31 != v20) {
                objc_enumerationMutation(v18);
              }
              v22 = *(void **)(*((void *)&v30 + 1) + 8 * i);
              v23 = objc_opt_new();
              [v23 setAlwaysPreserved:sub_1002EC400(v22)];
              [v23 setPreservationPriority:sub_1002EC480(v22)];
              v24 = sub_1002EC448(v22);
              [v16 setObject:v23 forKeyedSubscript:v24];
            }
            id v19 = [v18 countByEnumeratingWithState:&v30 objects:v35 count:16];
          }
          while (v19);
        }

        ((void (**)(id, void *, void *))v7)[2](v7, v16, 0);
        _Block_object_dispose(buf, 8);
      }
      else
      {
        v16 = +[ODRPublicErrorMapping publicErrorForError:v15];
        v7[2](v7, 0, v16);
      }

      [(NSLock *)v28 unlock];
      id v6 = (id)v29;
    }
  }
  else
  {
    v11 = ASDLogHandleForCategory();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)long long buf = 0;
      _os_log_fault_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_FAULT, "Ignoring call with nil bundle URL", buf, 2u);
    }

    NSErrorUserInfoKey v42 = NSDebugDescriptionErrorKey;
    CFStringRef v43 = @"Required argument was missing";
    id v6 = +[NSDictionary dictionaryWithObjects:&v43 forKeys:&v42 count:1];
    v12 = +[NSError errorWithDomain:NSCocoaErrorDomain code:4099 userInfo:v6];
    v7[2](v7, 0, v12);
  }
}

- (void)pinTags:(id)a3 inBundle:(id)a4 priority:(double)a5 completionHandler:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  v12 = (void (**)(id, void, void *))a6;
  if (self->_isUnsupportedApp)
  {
    v13 = ASDLogHandleForCategory();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)long long buf = 136446210;
      id v26 = "-[ODRClient pinTags:inBundle:priority:completionHandler:]";
      _os_log_error_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_ERROR, "Ignoring call from unsupported app (%{public}s)", buf, 0xCu);
    }

    NSErrorUserInfoKey v23 = NSDebugDescriptionErrorKey;
    CFStringRef v24 = @"On-Demand Resources are not available to this app";
    uint64_t v14 = +[NSDictionary dictionaryWithObjects:&v24 forKeys:&v23 count:1];
    id v15 = +[NSError errorWithDomain:NSCocoaErrorDomain code:4099 userInfo:v14];
    v12[2](v12, 0, v15);
  }
  else
  {
    v16 = [v11 URLByResolvingSymlinksInPath];

    uint64_t v14 = self->_readyLock;
    [(NSLock *)v14 lock];
    v17 = sub_10024E080();
    v18[0] = _NSConcreteStackBlock;
    v18[1] = 3221225472;
    v18[2] = sub_10029B49C;
    v18[3] = &unk_100525278;
    v18[4] = self;
    id v19 = v10;
    id v11 = v16;
    id v20 = v11;
    v21 = v12;
    double v22 = a5;
    sub_10024F3C4((uint64_t)v17, v18);

    [(NSLock *)v14 unlock];
  }
}

- (void)conditionallyPinTags:(id)a3 inBundle:(id)a4 completionHandler:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = (void (**)(id, void, void *))a5;
  if (self->_isUnsupportedApp)
  {
    id v11 = ASDLogHandleForCategory();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      LODWORD(buf) = 136446210;
      *(void *)((char *)&buf + 4) = "-[ODRClient conditionallyPinTags:inBundle:completionHandler:]";
      _os_log_error_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_ERROR, "Ignoring call from unsupported app (%{public}s)", (uint8_t *)&buf, 0xCu);
    }

    v10[2](v10, 0, &__NSDictionary0__struct);
  }
  else
  {
    uint64_t v12 = [v9 URLByResolvingSymlinksInPath];

    v13 = self->_readyLock;
    [(NSLock *)v13 lock];
    uint64_t v30 = 0;
    long long v31 = &v30;
    uint64_t v32 = 0x2020000000;
    char v33 = 0;
    *(void *)&long long buf = 0;
    *((void *)&buf + 1) = &buf;
    uint64_t v39 = 0x3032000000;
    NSErrorUserInfoKey v40 = sub_100018078;
    CFStringRef v41 = sub_100017BF8;
    id v42 = 0;
    uint64_t v26 = 0;
    __int16 v27 = &v26;
    uint64_t v28 = 0x2020000000;
    char v29 = 0;
    uint64_t v14 = sub_10029C2F0(self, v8);
    if (![v14 count])
    {
      id v15 = ASDLogHandleForCategory();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)v34 = 138543618;
        uint64_t v35 = v12;
        __int16 v36 = 2114;
        id v37 = v8;
        _os_log_error_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_ERROR, "Conditional pin failed with no tags fetched from set for bundleURL: %{public}@, tags in set: %{public}@", v34, 0x16u);
      }

      *((unsigned char *)v31 + 24) = 1;
    }
    v16 = sub_10024E080();
    v20[0] = _NSConcreteStackBlock;
    v20[1] = 3221225472;
    v20[2] = sub_10029CC4C;
    v20[3] = &unk_1005252C8;
    id v17 = v14;
    NSErrorUserInfoKey v23 = &v30;
    CFStringRef v24 = &v26;
    p_long long buf = &buf;
    id v21 = v17;
    double v22 = self;
    id v19 = objc_getProperty(self, v18, 72, 1);
    sub_10024F104((uint64_t)v16, v20, v19);

    v10[2](v10, *((unsigned __int8 *)v27 + 24), *(void **)(*((void *)&buf + 1) + 40));
    [(NSLock *)v13 unlock];

    _Block_object_dispose(&v26, 8);
    _Block_object_dispose(&buf, 8);

    _Block_object_dispose(&v30, 8);
    id v9 = (id)v12;
  }
}

- (void)setLoadingPriority:(double)a3 forTags:(id)a4 inBundle:(id)a5
{
  id v7 = a4;
  if (self->_isUnsupportedApp)
  {
    ASDLogHandleForCategory();
    id v8 = (NSLock *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(&v8->super, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)long long buf = 136446210;
      uint64_t v14 = "-[ODRClient setLoadingPriority:forTags:inBundle:]";
      _os_log_error_impl((void *)&_mh_execute_header, &v8->super, OS_LOG_TYPE_ERROR, "Ignoring call from unsupported app (%{public}s)", buf, 0xCu);
    }
  }
  else
  {
    id v8 = self->_readyLock;
    [(NSLock *)v8 lock];
    id v9 = sub_10024E080();
    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472;
    v10[2] = sub_10029D7A0;
    v10[3] = &unk_100525408;
    v10[4] = self;
    id v11 = v7;
    double v12 = a3;
    sub_10024F3C4((uint64_t)v9, v10);

    [(NSLock *)v8 unlock];
  }
}

- (void)unpinTags:(id)a3 inBundle:(id)a4 completionHandler:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = (void (**)(id, void, void *))a5;
  if (self->_isUnsupportedApp)
  {
    id v11 = ASDLogHandleForCategory();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)long long buf = 136446210;
      __int16 v27 = "-[ODRClient unpinTags:inBundle:completionHandler:]";
      _os_log_error_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_ERROR, "Ignoring call from unsupported app (%{public}s)", buf, 0xCu);
    }

    NSErrorUserInfoKey v24 = NSDebugDescriptionErrorKey;
    CFStringRef v25 = @"On-Demand Resources are not available to this app";
    double v12 = +[NSDictionary dictionaryWithObjects:&v25 forKeys:&v24 count:1];
    v13 = +[NSError errorWithDomain:NSCocoaErrorDomain code:4099 userInfo:v12];
    v10[2](v10, 0, v13);
  }
  else
  {
    uint64_t v14 = [v9 URLByResolvingSymlinksInPath];

    double v12 = self->_readyLock;
    [(NSLock *)v12 lock];
    id v15 = sub_10024E080();
    v16 = _NSConcreteStackBlock;
    uint64_t v17 = 3221225472;
    SEL v18 = sub_10029DC14;
    id v19 = &unk_100522420;
    id v20 = self;
    id v21 = v8;
    id v9 = v14;
    id v22 = v9;
    NSErrorUserInfoKey v23 = v10;
    sub_10024F3C4((uint64_t)v15, &v16);

    [(NSLock *)v12 unlock];
  }
}

- (void)okToPurgeAssetPacks:(id)a3
{
  id v4 = a3;
  if (self->_isUnsupportedApp)
  {
    ASDLogHandleForCategory();
    v5 = (NSLock *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(&v5->super, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)long long buf = 136446210;
      uint64_t v14 = "-[ODRClient okToPurgeAssetPacks:]";
      _os_log_error_impl((void *)&_mh_execute_header, &v5->super, OS_LOG_TYPE_ERROR, "Ignoring call from unsupported app (%{public}s)", buf, 0xCu);
    }
  }
  else
  {
    v5 = self->_readyLock;
    [(NSLock *)v5 lock];
    id v6 = sub_10024E080();
    id v7 = _NSConcreteStackBlock;
    uint64_t v8 = 3221225472;
    id v9 = sub_10029E560;
    id v10 = &unk_1005218C0;
    id v11 = v4;
    double v12 = self;
    sub_10024F3C4((uint64_t)v6, &v7);

    [(NSLock *)v5 unlock];
  }
}

- (void)setPreservationPriority:(double)a3 forTags:(id)a4 inBundle:(id)a5
{
  id v7 = a4;
  if (self->_isUnsupportedApp)
  {
    ASDLogHandleForCategory();
    uint64_t v8 = (NSLock *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(&v8->super, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)long long buf = 136446210;
      id v15 = "-[ODRClient setPreservationPriority:forTags:inBundle:]";
      _os_log_error_impl((void *)&_mh_execute_header, &v8->super, OS_LOG_TYPE_ERROR, "Ignoring call from unsupported app (%{public}s)", buf, 0xCu);
    }
  }
  else
  {
    uint64_t v8 = self->_readyLock;
    [(NSLock *)v8 lock];
    id v9 = sub_1002393C4();
    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472;
    v10[2] = sub_10029E864;
    v10[3] = &unk_100525318;
    id v11 = v7;
    double v12 = self;
    double v13 = a3;
    [v9 modifyUsingTransaction:v10];

    [(NSLock *)v8 unlock];
  }
}

- (void)setAlwaysPreserved:(BOOL)a3 forTags:(id)a4 inBundle:(id)a5
{
  id v7 = a4;
  if (self->_isUnsupportedApp)
  {
    ASDLogHandleForCategory();
    uint64_t v8 = (NSLock *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(&v8->super, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)long long buf = 136446210;
      id v15 = "-[ODRClient setAlwaysPreserved:forTags:inBundle:]";
      _os_log_error_impl((void *)&_mh_execute_header, &v8->super, OS_LOG_TYPE_ERROR, "Ignoring call from unsupported app (%{public}s)", buf, 0xCu);
    }
  }
  else
  {
    uint64_t v8 = self->_readyLock;
    [(NSLock *)v8 lock];
    id v9 = sub_1002393C4();
    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472;
    v10[2] = sub_10029EDA4;
    v10[3] = &unk_100525340;
    id v11 = v7;
    double v12 = self;
    BOOL v13 = a3;
    [v9 modifyUsingTransaction:v10];

    [(NSLock *)v8 unlock];
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sandboxExtension, 0);
  objc_storeStrong((id *)&self->_readyLock, 0);
  objc_storeStrong((id *)&self->_bundleRequestToDownloadRequest, 0);
  objc_storeStrong((id *)&self->_requestingAppBundleID, 0);
  objc_storeStrong((id *)&self->_clientProxy, 0);
  objc_storeStrong((id *)&self->_application, 0);
  objc_storeStrong((id *)&self->_activePinCountMapping, 0);
}

@end