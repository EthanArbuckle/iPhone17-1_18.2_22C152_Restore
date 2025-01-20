__CFString *IXStringForPlaceholderDisposition(unint64_t a1)
{
  __CFString *v1;
  uint64_t vars8;

  if (a1 >= 4)
  {
    v1 = +[NSString stringWithFormat:@"Unknown IXPlaceholderDisposition value: %lu", a1];
  }
  else
  {
    v1 = off_1000E8C50[a1];
  }

  return v1;
}

uint64_t sub_100003944()
{
  qword_100109D80 = (uint64_t)objc_alloc_init((Class)objc_opt_class());

  return _objc_release_x1();
}

BOOL sub_100004134(id a1, LSApplicationIdentity *a2)
{
  return [(LSApplicationIdentity *)a2 personaType] == (id)1;
}

id sub_100004158(uint64_t a1, void *a2)
{
  v3 = [a2 personaUniqueString];
  id v4 = [v3 isEqualToString:*(void *)(a1 + 32)];

  return v4;
}

void sub_1000043E8(uint64_t a1)
{
  uint64_t v1 = a1;
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  id obj = *(id *)(a1 + 32);
  id v2 = [obj countByEnumeratingWithState:&v22 objects:v34 count:16];
  if (v2)
  {
    id v3 = v2;
    uint64_t v4 = *(void *)v23;
    v5 = &OBJC_IVAR___IXSCoordinatedAppInstall__publishedInstallProgress;
    v6 = (uint64_t *)&off_100109BB8;
    v7 = &OBJC_IVAR___IXSCoordinatedAppInstall__publishedInstallProgress;
    uint64_t v20 = v1;
    do
    {
      for (i = 0; i != v3; i = (char *)i + 1)
      {
        if (*(void *)v23 != v4) {
          objc_enumerationMutation(obj);
        }
        id v9 = [objc_alloc((Class)(v5 + 248)) initWithBundleIdentifier:*(void *)(*((void *)&v22 + 1) + 8 * i)];
        v10 = sub_100004B28(*v6);
        if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
        {
          v11 = sub_100031160(*(void *)(v1 + 40));
          IXStringForClientID(*(void *)(v1 + 48));
          id v12 = v3;
          uint64_t v13 = v4;
          v14 = v7;
          v15 = v6;
          v17 = v16 = v5;
          *(_DWORD *)buf = 136315906;
          v27 = "-[IXSErrorPresenter _presentErrorHighlightingLocalizedAppName:withHighlightedAppRecord:bundleIDs:code:er"
                "rorSource:underlyingError:]_block_invoke";
          __int16 v28 = 2112;
          id v29 = v9;
          __int16 v30 = 2112;
          v31 = v11;
          __int16 v32 = 2112;
          v33 = v17;
          _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "%s: Uninstall of %@ requested by user due to error %@, client %@", buf, 0x2Au);

          v5 = v16;
          v6 = v15;
          v7 = v14;
          uint64_t v4 = v13;
          id v3 = v12;
          uint64_t v1 = v20;
        }
        v18 = [v7 + 478 sharedUninstaller];
        v19 = IXStringForClientID(*(void *)(v1 + 48));
        [v18 uninstallAppWithIdentity:v9 clientName:v19 options:2 completion:0];
      }
      id v3 = [obj countByEnumeratingWithState:&v22 objects:v34 count:16];
    }
    while (v3);
  }
}

void sub_10000487C(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, v9, OS_LOG_TYPE_ERROR, a4, &a9, 0x20u);
}

void sub_100004A5C(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 40);
  id v3 = [*(id *)(a1 + 32) seed];
  [v3 setArchiveBytesConsumed:v2];

  uint64_t v4 = [*(id *)(a1 + 32) seed];
  id v5 = [v4 archiveSizeBytes];

  if (v5)
  {
    double v6 = (double)*(unint64_t *)(a1 + 40);
    id v7 = [*(id *)(a1 + 32) seed];
    objc_msgSend(*(id *)(a1 + 32), "setPercentComplete:", v6 / (double)(unint64_t)objc_msgSend(v7, "archiveSizeBytes"));
  }
}

id sub_100004B28(uint64_t a1)
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100004BC8;
  block[3] = &unk_1000E8C70;
  block[4] = a1;
  if (qword_100109D90 != -1) {
    dispatch_once(&qword_100109D90, block);
  }
  uint64_t v1 = off_1001097B0;

  return v1;
}

uint64_t sub_100004BC8(uint64_t a1)
{
  off_1001097B0 = os_log_create(*(const char **)(a1 + 32), "daemon");

  return _objc_release_x1();
}

uint64_t start(uint64_t a1, uint64_t *a2)
{
  id v3 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  targetq = dispatch_queue_create("com.apple.installcoordinationd.notifications", v3);

  uint64_t v4 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  dispatch_queue_t v5 = dispatch_queue_create("com.apple.InstallCoordination.StateDumpQueue", v4);

  bzero(v75, 0x400uLL);
  if ((_set_user_dir_suffix() & 1) == 0) {
    sub_10008AF48(v76, buf);
  }
  if (!confstr(65537, v75, 0x400uLL))
  {
    int v6 = *__error();
    id v7 = sub_100004B28((uint64_t)off_100109BB8);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      v8 = strerror(v6);
      *(_DWORD *)buf = 136315650;
      *(void *)&uint8_t buf[4] = "main";
      *(_WORD *)&buf[12] = 1024;
      *(_DWORD *)&buf[14] = v6;
      *(_WORD *)&buf[18] = 2080;
      *(void *)&buf[20] = v8;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "%s: Failed to initialize temporary directory: error = %d (%s), attempting to continue...", buf, 0x1Cu);
    }
  }
  v49 = (void *)os_transaction_create();
  id v9 = sub_100004B28((uint64_t)off_100109BB8);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v10 = *a2;
    *(_DWORD *)buf = 136315906;
    *(void *)&uint8_t buf[4] = "main";
    *(_WORD *)&buf[12] = 2080;
    *(void *)&buf[14] = v10;
    *(_WORD *)&buf[22] = 2080;
    *(void *)&buf[24] = "Nov 16 2024";
    LOWORD(v82[0]) = 2080;
    *(id *)((char *)v82 + 2) = "16:34:53";
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "%s: %s starting, built %s %s", buf, 0x2Au);
  }

  v11 = +[IXGlobalConfiguration sharedInstance];
  [v11 createDirectories];

  id v12 = +[IXSDataPromiseManager sharedInstance];
  +[IXSCoordinatorManager sharedInstance];
  v62 = _NSConcreteStackBlock;
  uint64_t v63 = 3221225472;
  v64 = sub_1000054D0;
  v65 = &unk_1000E8D78;
  id v66 = (id)objc_claimAutoreleasedReturnValue();
  os_state_add_handler();
  os_state_add_handler();
  v59[0] = _NSConcreteStackBlock;
  v59[1] = 3221225472;
  v59[2] = sub_100005CB4;
  v59[3] = &unk_1000E8E08;
  id v48 = v12;
  id v60 = v48;
  id v13 = v66;
  id v61 = v13;
  if (!sub_100038D88(@"installcoordinationd.run", v59))
  {
    id v14 = v13;
    v16 = sub_10003DAE4((uint64_t)"_DumpCoordinatorsAndPurgeProcessScoped", 335, @"IXErrorDomain", 0x21uLL, 0, 0, @"Coordinator orphaned by installcoordinationd restart", v15, v47);
    *(void *)buf = _NSConcreteStackBlock;
    *(void *)&buf[8] = 3221225472;
    *(void *)&buf[16] = sub_100006AA0;
    *(void *)&buf[24] = &unk_1000E8F80;
    v82[0] = v16;
    id v17 = v16;
    [v14 enumerateCoordinators:buf];
  }
  dispatch_queue_t v51 = v5;
  id v56 = v13;
  v18 = +[LSApplicationRecord enumeratorWithOptions:0];
  long long v71 = 0u;
  long long v72 = 0u;
  long long v73 = 0u;
  long long v74 = 0u;
  id v19 = [v18 countByEnumeratingWithState:&v71 objects:buf count:16];
  if (v19)
  {
    id v20 = v19;
    uint64_t v21 = *(void *)v72;
    uint64_t v53 = *(void *)v72;
    v54 = v18;
    do
    {
      long long v22 = 0;
      id v55 = v20;
      do
      {
        if (*(void *)v72 != v21) {
          objc_enumerationMutation(v18);
        }
        long long v23 = *(void **)(*((void *)&v71 + 1) + 8 * (void)v22);
        if ([v23 hasParallelPlaceholder])
        {
          long long v24 = [v23 bundleIdentifier];
          if (v24)
          {
            long long v25 = [v56 coordinatorsForBundleIdentifier:v24];
            v26 = v25;
            if (!v25 || ![v25 count])
            {
              v57 = v26;
              v58 = v22;
              v27 = [v23 managedPersonas];
              long long v67 = 0u;
              long long v68 = 0u;
              long long v69 = 0u;
              long long v70 = 0u;
              id v28 = [v27 countByEnumeratingWithState:&v67 objects:v76 count:16];
              if (v28)
              {
                id v29 = v28;
                uint64_t v30 = *(void *)v68;
                do
                {
                  for (i = 0; i != v29; i = (char *)i + 1)
                  {
                    if (*(void *)v68 != v30) {
                      objc_enumerationMutation(v27);
                    }
                    __int16 v32 = [[IXApplicationIdentity alloc] initWithBundleIdentifier:v24 personaUniqueString:*(void *)(*((void *)&v67 + 1) + 8 * i)];
                    v33 = +[NSString stringWithFormat:@"Uninstalling orphaned parallel placeholder for %@", v32, v48, v49, context, v51];
                    v34 = +[IXSAppUninstaller sharedUninstaller];
                    [v34 uninstallParallelPlaceholderForIdentity:v32 reason:v33];
                  }
                  id v29 = [v27 countByEnumeratingWithState:&v67 objects:v76 count:16];
                }
                while (v29);
              }
              v35 = [[IXApplicationIdentity alloc] initWithBundleIdentifier:v24];
              v36 = +[NSString stringWithFormat:@"Uninstalling orphaned parallel placeholder for %@", v35];
              v37 = +[IXSAppUninstaller sharedUninstaller];
              [v37 uninstallParallelPlaceholderForIdentity:v35 reason:v36];

              uint64_t v21 = v53;
              v18 = v54;
              id v20 = v55;
              v26 = v57;
              long long v22 = v58;
            }
          }
          else
          {
            v26 = sub_100004B28((uint64_t)off_100109BB8);
            if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)v77 = 136315394;
              v78 = "_RemoveOrphanedParallelPlaceholders";
              __int16 v79 = 2112;
              v80 = v23;
              _os_log_error_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_ERROR, "%s: Got LSApplicationRecord %@ without bundle ID", v77, 0x16u);
            }
          }
        }
        else
        {
          long long v24 = sub_100004B28((uint64_t)off_100109BB8);
          if (os_log_type_enabled(v24, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)v77 = 136315394;
            v78 = "_RemoveOrphanedParallelPlaceholders";
            __int16 v79 = 2112;
            v80 = v23;
            _os_log_debug_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_DEBUG, "%s: Skipping because it doesn't have a parallel placeholder: %@", v77, 0x16u);
          }
        }

        long long v22 = (char *)v22 + 1;
      }
      while (v22 != v20);
      id v20 = [v18 countByEnumeratingWithState:&v71 objects:buf count:16];
    }
    while (v20);
  }

  +[IXSClientConnectionManager configureService];
  v38 = dispatch_get_global_queue(21, 0);
  signal(15, (void (__cdecl *)(int))1);
  v39 = dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_signal, 0xFuLL, 0, v38);
  dispatch_source_set_event_handler(v39, &stru_1000E8E48);
  dispatch_activate(v39);
  v40 = +[IXSAppDeletionEligibilityManager sharedInstance];
  [v40 reconcileAppRemovabilityForSystemAppPlaceholders];

  xpc_set_event_stream_handler("com.apple.notifyd.matching", targetq, &stru_1000E8E88);
  v41 = +[NSNotificationCenter defaultCenter];
  v42 = +[NSOperationQueue mainQueue];
  id v43 = [v41 addObserverForName:NSCurrentLocaleDidChangeNotification object:0 queue:v42 usingBlock:&stru_1000E8F08];

  v44 = sub_10003D008();
  [v44 resume];

  v45 = +[NSRunLoop mainRunLoop];
  [v45 run];

  return 0;
}

_DWORD *sub_1000054D0(uint64_t a1, uint64_t a2)
{
  if (*(_DWORD *)(a2 + 16) != 3) {
    return 0;
  }
  uint64_t v20 = 0;
  uint64_t v21 = &v20;
  uint64_t v22 = 0x3032000000;
  long long v23 = sub_1000056B0;
  long long v24 = sub_1000056C0;
  long long v25 = @"Coordinators";
  id v3 = [*(id *)(a1 + 32) coordinatorCount];
  uint64_t v4 = objc_opt_new();
  uint64_t v14 = 0;
  uint64_t v15 = &v14;
  uint64_t v16 = 0x3032000000;
  id v17 = sub_1000056B0;
  v18 = sub_1000056C0;
  sub_1000056C8(v4);
  id v19 = (id)objc_claimAutoreleasedReturnValue();
  dispatch_queue_t v5 = *(void **)(a1 + 32);
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_1000057BC;
  v9[3] = &unk_1000E8D50;
  id v6 = v4;
  id v10 = v6;
  v11 = &v14;
  id v12 = &v20;
  id v13 = v3;
  [v5 enumerateCoordinators:v9];
  id v7 = sub_100005890((void *)v15[5], (void *)v21[5]);

  _Block_object_dispose(&v14, 8);
  _Block_object_dispose(&v20, 8);

  return v7;
}

void sub_10000567C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, ...)
{
  va_start(va, a15);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t sub_1000056B0(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void sub_1000056C0(uint64_t a1)
{
}

id sub_1000056C8(void *a1)
{
  id v1 = a1;
  id v7 = 0;
  uint64_t v2 = +[NSPropertyListSerialization dataWithPropertyList:v1 format:200 options:0 error:&v7];
  id v3 = v7;
  if (v2)
  {
    if ([v2 length] - 32569 >= 0xFFFF7FFF)
    {
      id v4 = v2;
      goto LABEL_8;
    }
  }
  else
  {
    dispatch_queue_t v5 = sub_100004B28((uint64_t)off_100109BB8);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      sub_10008B018();
    }
  }
  id v4 = 0;
LABEL_8:

  return v4;
}

BOOL sub_1000057BC(uint64_t a1, void *a2)
{
  id v3 = *(void **)(a1 + 32);
  id v4 = [a2 description];
  [v3 addObject:v4];

  dispatch_queue_t v5 = sub_1000056C8(*(void **)(a1 + 32));
  id v6 = v5;
  if (v5)
  {
    uint64_t v7 = *(void *)(*(void *)(a1 + 40) + 8);
    id v8 = v5;
    id v9 = *(void **)(v7 + 40);
    *(void *)(v7 + 40) = v8;
  }
  else
  {
    uint64_t v10 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"Coordinators [%lu of %lu]", (char *)[*(id *)(a1 + 32) count] - 1, *(void *)(a1 + 56));
    uint64_t v11 = *(void *)(*(void *)(a1 + 48) + 8);
    id v9 = *(void **)(v11 + 40);
    *(void *)(v11 + 40) = v10;
  }

  return v6 != 0;
}

_DWORD *sub_100005890(void *a1, void *a2)
{
  id v3 = a1;
  id v4 = a2;
  unsigned int v5 = [v3 length];
  size_t v6 = v5 + 200;
  if (v6 <= 0x8000)
  {
    id v8 = malloc_type_calloc(1uLL, v6, 0x15AE7A8EuLL);
    [v4 UTF8String];
    __strlcpy_chk();
    _DWORD *v8 = 1;
    v8[1] = v5;
    memcpy(v8 + 50, [v3 bytes], v5);
  }
  else
  {
    uint64_t v7 = sub_100004B28((uint64_t)off_100109BB8);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      sub_10008B08C((uint64_t)v3, v7);
    }

    id v8 = 0;
  }

  return v8;
}

os_state_data_s *__cdecl sub_1000059A0(id a1, os_state_hints_s *a2)
{
  if (a2->var2 != 3) {
    return 0;
  }
  uint64_t v20 = 0;
  uint64_t v21 = &v20;
  uint64_t v22 = 0x3032000000;
  long long v23 = sub_1000056B0;
  long long v24 = sub_1000056C0;
  long long v25 = @"Removability";
  uint64_t v2 = +[IXSAppRemovabilityManager sharedInstance];
  id v3 = [v2 removabilityInfoForAllIdentities];

  id v4 = objc_msgSend(objc_alloc((Class)NSMutableArray), "initWithCapacity:", objc_msgSend(v3, "count"));
  uint64_t v14 = 0;
  uint64_t v15 = &v14;
  uint64_t v16 = 0x3032000000;
  id v17 = sub_1000056B0;
  v18 = sub_1000056C0;
  sub_1000056C8(v4);
  id v19 = (id)objc_claimAutoreleasedReturnValue();
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_100005BB4;
  v9[3] = &unk_1000E8DE0;
  id v5 = v4;
  id v10 = v5;
  id v12 = &v14;
  id v13 = &v20;
  id v6 = v3;
  id v11 = v6;
  [v6 enumerateKeysAndObjectsUsingBlock:v9];
  uint64_t v7 = (os_state_data_s *)sub_100005890((void *)v15[5], (void *)v21[5]);

  _Block_object_dispose(&v14, 8);
  _Block_object_dispose(&v20, 8);

  return v7;
}

void sub_100005B80(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 96), 8);
  _Unwind_Resume(a1);
}

void sub_100005BB4(uint64_t a1, uint64_t a2, uint64_t a3, char *a4)
{
  id v6 = *(void **)(a1 + 32);
  uint64_t v7 = +[NSString stringWithFormat:@"%@: %@", a2, a3];
  [v6 addObject:v7];

  id v8 = sub_1000056C8(*(void **)(a1 + 32));
  id v15 = v8;
  if (v8)
  {
    uint64_t v9 = *(void *)(*(void *)(a1 + 48) + 8);
    id v10 = v8;
    char v11 = 0;
    id v12 = *(void **)(v9 + 40);
    *(void *)(v9 + 40) = v10;
  }
  else
  {
    uint64_t v13 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"Removability [%lu of %lu]", (char *)[*(id *)(a1 + 32) count] - 1, objc_msgSend(*(id *)(a1 + 40), "count"));
    uint64_t v14 = *(void *)(*(void *)(a1 + 56) + 8);
    id v12 = *(void **)(v14 + 40);
    *(void *)(v14 + 40) = v13;
    char v11 = 1;
  }

  *a4 = v11;
}

void sub_100005CB4(uint64_t a1)
{
  uint64_t v1 = *(void **)(a1 + 40);
  id v2 = *(id *)(a1 + 32);
  id v3 = v1;
  v75[0] = _NSConcreteStackBlock;
  v75[1] = 3221225472;
  v75[2] = sub_10000685C;
  v75[3] = &unk_1000E8F30;
  id v55 = (id)objc_opt_new();
  id v76 = v55;
  v57 = v2;
  [v2 enumeratePromises:v75];
  id v4 = sub_100004B28((uint64_t)off_100109BB8);
  id v5 = &off_1000AA000;
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    v88 = "_DoFirstRunCleanup";
    __int16 v89 = 2112;
    id v90 = v55;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "%s: Found existing promise UUIDs: %@", buf, 0x16u);
  }

  uint64_t v7 = +[IXGlobalConfiguration sharedInstance];
  id v8 = [v7 promiseStagingRootDirectoryAbortingOnError];

  uint64_t v9 = +[IXFileManager defaultManager];
  id v74 = 0;
  id v10 = [v9 urlsForItemsInDirectoryAtURL:v8 ignoringSymlinks:1 error:&v74];
  id v11 = v74;

  uint64_t v53 = v3;
  if (!v10)
  {
    id v12 = sub_100004B28((uint64_t)off_100109BB8);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
      sub_10008B118();
    }
    goto LABEL_30;
  }
  long long v72 = 0u;
  long long v73 = 0u;
  long long v70 = 0u;
  long long v71 = 0u;
  v52 = v10;
  id v12 = v10;
  id v13 = [v12 countByEnumeratingWithState:&v70 objects:buf count:16];
  if (!v13) {
    goto LABEL_29;
  }
  id v14 = v13;
  id v49 = v11;
  v50 = v8;
  dispatch_queue_t v51 = v6;
  uint64_t v15 = *(void *)v71;
  do
  {
    uint64_t v16 = 0;
    do
    {
      if (*(void *)v71 != v15) {
        objc_enumerationMutation(v12);
      }
      id v17 = *(void **)(*((void *)&v70 + 1) + 8 * (void)v16);
      v18 = [v17 lastPathComponent];
      id v19 = [objc_alloc((Class)NSUUID) initWithUUIDString:v18];
      if (v19)
      {
        if ([v55 containsObject:v19])
        {
          id v20 = 0;
          goto LABEL_22;
        }
        long long v25 = sub_100004B28((uint64_t)off_100109BB8);
        if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
        {
          v26 = [v17 path];
          *(_DWORD *)v81 = 136315394;
          v82 = "_DoFirstRunCleanup";
          __int16 v83 = 2112;
          v84 = v26;
          _os_log_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_DEFAULT, "%s: Removing orphaned promise staging directory: %@", v81, 0x16u);
        }
        v27 = +[IXFileManager defaultManager];
        id v68 = 0;
        unsigned __int8 v28 = [v27 removeItemAtURL:v17 error:&v68];
        id v20 = v68;

        if ((v28 & 1) == 0)
        {
          long long v24 = sub_100004B28((uint64_t)off_100109BB8);
          if (!os_log_type_enabled(v24, OS_LOG_TYPE_ERROR)) {
            goto LABEL_21;
          }
          goto LABEL_24;
        }
      }
      else
      {
        uint64_t v21 = sub_100004B28((uint64_t)off_100109BB8);
        if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
        {
          id v29 = [v17 path];
          *(_DWORD *)v81 = 136315394;
          v82 = "_DoFirstRunCleanup";
          __int16 v83 = 2112;
          v84 = v29;
          _os_log_error_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_ERROR, "%s: Removing non-UUID item found in promise staging: %@", v81, 0x16u);
        }
        uint64_t v22 = +[IXFileManager defaultManager];
        id v69 = 0;
        unsigned __int8 v23 = [v22 removeItemAtURL:v17 error:&v69];
        id v20 = v69;

        if ((v23 & 1) == 0)
        {
          long long v24 = sub_100004B28((uint64_t)off_100109BB8);
          if (!os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
          {
LABEL_21:

            goto LABEL_22;
          }
LABEL_24:
          uint64_t v30 = [v17 path];
          *(_DWORD *)v81 = 136315650;
          v82 = "_DoFirstRunCleanup";
          __int16 v83 = 2112;
          v84 = v30;
          __int16 v85 = 2112;
          id v86 = v20;
          _os_log_error_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_ERROR, "%s: Failed to purge %@ : %@", v81, 0x20u);

          goto LABEL_21;
        }
      }
LABEL_22:

      uint64_t v16 = (char *)v16 + 1;
    }
    while (v14 != v16);
    id v31 = [v12 countByEnumeratingWithState:&v70 objects:buf count:16];
    id v14 = v31;
  }
  while (v31);
  id v5 = &off_1000AA000;
  id v3 = v53;
  id v8 = v50;
  id v6 = v51;
  id v11 = v49;
LABEL_29:
  id v10 = v52;
LABEL_30:

  v33 = sub_10003DAE4((uint64_t)"_DoFirstRunCleanup", 195, @"IXErrorDomain", 0x21uLL, 0, 0, @"Coordinator orphaned by device reboot", v32, v47);
  v65[0] = _NSConcreteStackBlock;
  v65[1] = 3221225472;
  v65[2] = sub_1000068A0;
  v65[3] = &unk_1000E8F58;
  id v34 = v55;
  id v66 = v34;
  id v54 = v33;
  id v67 = v54;
  [v3 enumerateCoordinators:v65];
  v36 = sub_10003DAE4((uint64_t)"_DoFirstRunCleanup", 218, @"IXErrorDomain", 0x12uLL, 0, 0, @"Promise orphaned", v35, v48);
  long long v61 = 0u;
  long long v62 = 0u;
  long long v63 = 0u;
  long long v64 = 0u;
  id v37 = v34;
  id v38 = [v37 countByEnumeratingWithState:&v61 objects:v81 count:16];
  if (v38)
  {
    id v39 = v38;
    uint64_t v40 = *(void *)v62;
    int v56 = *((void *)v5 + 466);
    do
    {
      for (i = 0; i != v39; i = (char *)i + 1)
      {
        if (*(void *)v62 != v40) {
          objc_enumerationMutation(v37);
        }
        v42 = *(void **)(*((void *)&v61 + 1) + 8 * i);
        id v43 = [v57 promiseForUUID:v42];
        v44 = sub_100004B28((uint64_t)off_100109BB8);
        v45 = v44;
        if (v43)
        {
          if (os_log_type_enabled(v44, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)v77 = v56;
            v78 = "_DoFirstRunCleanup";
            __int16 v79 = 2112;
            v80 = v43;
            _os_log_impl((void *)&_mh_execute_header, v45, OS_LOG_TYPE_DEFAULT, "%s: Canceling orphaned data promise %@", v77, 0x16u);
          }

          v46 = [v43 accessQueue];
          block[0] = _NSConcreteStackBlock;
          block[1] = 3221225472;
          block[2] = sub_100006A8C;
          block[3] = &unk_1000E8E08;
          v59 = v43;
          id v60 = v36;
          dispatch_sync(v46, block);

          v45 = v59;
        }
        else if (os_log_type_enabled(v44, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)v77 = v56;
          v78 = "_DoFirstRunCleanup";
          __int16 v79 = 2112;
          v80 = v42;
          _os_log_error_impl((void *)&_mh_execute_header, v45, OS_LOG_TYPE_ERROR, "%s: Failed to locate orphaned data promise with UUID %@", v77, 0x16u);
        }
      }
      id v39 = [v37 countByEnumeratingWithState:&v61 objects:v81 count:16];
    }
    while (v39);
  }
}

void sub_10000658C(id a1)
{
  uint64_t v1 = sub_100004B28((uint64_t)off_100109BB8);
  if (os_log_type_enabled(v1, OS_LOG_TYPE_DEFAULT))
  {
    int v2 = 136315138;
    id v3 = "main_block_invoke_5";
    _os_log_impl((void *)&_mh_execute_header, v1, OS_LOG_TYPE_DEFAULT, "%s: Got SIGTERM; Exiting when clean.",
      (uint8_t *)&v2,
      0xCu);
  }

  xpc_transaction_exit_clean();
}

void sub_100006644(id a1, OS_xpc_object *a2)
{
  string = xpc_dictionary_get_string(a2, _xpc_event_key_name);
  id v3 = sub_100004B28((uint64_t)off_100109BB8);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    int v5 = 136315394;
    id v6 = "main_block_invoke";
    __int16 v7 = 2080;
    id v8 = string;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "%s: Got darwin notification %s", (uint8_t *)&v5, 0x16u);
  }

  if (!strcmp(string, "com.apple.mobile.keybagd.first_unlock"))
  {
    id v4 = +[IXSCoordinatorManager sharedInstance];
    [v4 enumerateCoordinators:&stru_1000E8EC8];
  }
  else
  {
    if (strcmp(string, "com.apple.os-eligibility-domain.change")) {
      return;
    }
    id v4 = +[IXSAppDeletionEligibilityManager sharedInstance];
    [v4 eligibilityDidChange];
  }
}

BOOL sub_100006784(id a1, IXSCoordinatedAppInstall *a2)
{
  return 1;
}

void sub_1000067A4(id a1, NSNotification *a2)
{
  int v2 = sub_100004B28((uint64_t)off_100109BB8);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    int v3 = 136315138;
    id v4 = "main_block_invoke_2";
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "%s: User changed locale; exiting when clean to reload locale",
      (uint8_t *)&v3,
      0xCu);
  }

  xpc_transaction_exit_clean();
}

uint64_t sub_10000685C(uint64_t a1, void *a2)
{
  int v2 = *(void **)(a1 + 32);
  int v3 = [a2 uniqueIdentifier];
  [v2 addObject:v3];

  return 1;
}

uint64_t sub_1000068A0(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = sub_100004B28((uint64_t)off_100109BB8);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    int v9 = 136315394;
    id v10 = "_DoFirstRunCleanup_block_invoke";
    __int16 v11 = 2112;
    id v12 = v3;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "%s: Found coordinator: %@", (uint8_t *)&v9, 0x16u);
  }

  int v5 = [v3 promiseUUIDs];
  [*(id *)(a1 + 32) minusSet:v5];
  if ([v3 creator] == (id)12)
  {
    id v6 = sub_100004B28((uint64_t)off_100109BB8);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      int v9 = 136315394;
      id v10 = "_DoFirstRunCleanup_block_invoke";
      __int16 v11 = 2112;
      id v12 = v3;
      __int16 v7 = "%s: Canceling orphaned IXClientSimpleSPI coordinator %@";
LABEL_9:
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, v7, (uint8_t *)&v9, 0x16u);
      goto LABEL_10;
    }
    goto LABEL_10;
  }
  if ([v3 coordinatorScope] == 1)
  {
    id v6 = sub_100004B28((uint64_t)off_100109BB8);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      int v9 = 136315394;
      id v10 = "_DoFirstRunCleanup_block_invoke";
      __int16 v11 = 2112;
      id v12 = v3;
      __int16 v7 = "%s: Canceling process-scoped coordinator %@";
      goto LABEL_9;
    }
LABEL_10:

    [v3 cancelForReason:*(void *)(a1 + 40) client:15 error:0];
  }

  return 1;
}

id sub_100006A8C(uint64_t a1)
{
  return [*(id *)(a1 + 32) cancelForReason:*(void *)(a1 + 40) client:15 error:0];
}

uint64_t sub_100006AA0(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = sub_100004B28((uint64_t)off_100109BB8);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    int v7 = 136315394;
    id v8 = "_DumpCoordinatorsAndPurgeProcessScoped_block_invoke";
    __int16 v9 = 2112;
    id v10 = v3;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "%s: Found coordinator: %@", (uint8_t *)&v7, 0x16u);
  }

  if ([v3 coordinatorScope] == 1)
  {
    int v5 = sub_100004B28((uint64_t)off_100109BB8);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      int v7 = 136315394;
      id v8 = "_DumpCoordinatorsAndPurgeProcessScoped_block_invoke";
      __int16 v9 = 2112;
      id v10 = v3;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "%s: Canceling process-scoped coordinator %@", (uint8_t *)&v7, 0x16u);
    }

    [v3 cancelForReason:*(void *)(a1 + 32) client:15 error:0];
  }

  return 1;
}

void sub_100006C24(void *a1, uint64_t a2, os_log_t log, const char *a4, ...)
{
  va_start(va, a4);
  _os_log_error_impl(a1, log, OS_LOG_TYPE_ERROR, a4, (uint8_t *)va, 0x20u);
}

void sub_1000073E0(uint64_t a1)
{
  int v2 = (uint64_t *)(a1 + 40);
  id v3 = [*(id *)(a1 + 32) coordinatorForIdentity:*(void *)(a1 + 40)];
  if (v3)
  {
    uint64_t v4 = sub_100004B28((uint64_t)off_100109BB8);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      sub_10008B344();
    }

    sub_10003DAE4((uint64_t)"-[IXSRevertManager _revertAppWithIdentity:forClientWithName:completion:]_block_invoke", 92, @"IXErrorDomain", 5uLL, 0, 0, @"Failed to revert app because a coordinator %@ already existed", v5, (uint64_t)v3);
    id v6 = (id)objc_claimAutoreleasedReturnValue();
    id v7 = 0;
    goto LABEL_5;
  }
  uint64_t v10 = *(void *)(a1 + 40);
  __int16 v9 = *(void **)(a1 + 48);
  id v22 = 0;
  id v7 = [v9 _acquireTerminationAssertionForIdentity:v10 withError:&v22];
  id v6 = v22;
  if (!v7)
  {
LABEL_5:
    id v8 = 0;
    goto LABEL_12;
  }
  __int16 v11 = [*(id *)(a1 + 48) internalQueue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000076E0;
  block[3] = &unk_1000E8E08;
  void block[4] = *(void *)(a1 + 48);
  id v7 = v7;
  id v21 = v7;
  dispatch_sync(v11, block);

  v19[0] = _NSConcreteStackBlock;
  v19[1] = 3221225472;
  v19[2] = sub_1000076E8;
  v19[3] = &unk_1000E8FA8;
  v19[4] = *(void *)(a1 + 48);
  id v12 = objc_retainBlock(v19);
  id v13 = [*(id *)(a1 + 40) miAppIdentity];
  char v14 = MobileInstallationRevertApplicationWithIdentityAndAssertionBlockWithError();
  id v8 = 0;
  id v15 = v6;

  if ((v14 & 1) == 0)
  {
    uint64_t v16 = sub_100004B28((uint64_t)off_100109BB8);
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
      sub_10008B2A8(v2, (uint64_t)v15, v16);
    }

    uint64_t v18 = sub_10003DAE4((uint64_t)"-[IXSRevertManager _revertAppWithIdentity:forClientWithName:completion:]_block_invoke", 114, @"IXErrorDomain", 0x28uLL, v15, 0, @"Failed to revert application with identity %@", v17, *v2);

    ((void (*)(void *))v12[2])(v12);
    id v15 = (id)v18;
  }

  id v6 = v15;
LABEL_12:
  (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
}

id sub_1000076E0(uint64_t a1)
{
  return [*(id *)(a1 + 32) setTerminationAssertion:*(void *)(a1 + 40)];
}

void sub_1000076E8(uint64_t a1)
{
  int v2 = [*(id *)(a1 + 32) internalQueue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100007778;
  block[3] = &unk_1000E8FA8;
  void block[4] = *(void *)(a1 + 32);
  dispatch_sync(v2, block);
}

id sub_100007778(uint64_t a1)
{
  return [*(id *)(a1 + 32) setTerminationAssertion:0];
}

id sub_1000078B8(uint64_t a1)
{
  return [*(id *)(a1 + 32) setTerminationAssertion:0];
}

BOOL sub_100008DF0(void *a1, void *a2)
{
  id v3 = a1;
  id v4 = a2;
  uint64_t v5 = v4;
  BOOL v6 = (v3 != 0) == (v4 != 0) && (!v3 || !v4 || [v3 isEqual:v4]);

  return v6;
}

void sub_100009550(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 0x16u);
}

void sub_1000099C0(id a1, id a2)
{
}

void sub_1000099D8(id a1, id a2)
{
}

uint64_t sub_100009AA0()
{
  qword_100109D98 = (uint64_t)objc_alloc_init((Class)objc_opt_class());

  return _objc_release_x1();
}

double sub_10000AB80(void *a1, _OWORD *a2)
{
  *a1 = 0;
  double result = 0.0;
  a2[3] = 0u;
  a2[4] = 0u;
  a2[1] = 0u;
  a2[2] = 0u;
  *a2 = 0u;
  return result;
}

uint64_t sub_10000ABA4()
{
  return _os_log_send_and_compose_impl();
}

BOOL sub_10000ABE4()
{
  return os_log_type_enabled(v0, OS_LOG_TYPE_ERROR);
}

uint64_t sub_10000ABFC()
{
  return _os_crash_msg();
}

id sub_10000AC14(void *a1)
{
  id v1 = a1;
  int v2 = [v1 domain];
  if ([v2 isEqualToString:@"IXUserPresentableErrorDomain"])
  {
    id v3 = [v1 code];

    if (v3 == (id)11)
    {
      id v4 = v1;
      goto LABEL_16;
    }
  }
  else
  {
  }
  id v5 = v1;
  id v4 = v5;
  if (v5)
  {
    BOOL v6 = v5;
    while (1)
    {
      id v7 = [v6 domain];
      if ([v7 isEqualToString:NSPOSIXErrorDomain])
      {
        id v8 = [v6 code];

        if (v8 == (id)28)
        {
          __int16 v11 = [v4 domain];
          int v12 = [v11 isEqual:@"IXUserPresentableErrorDomain"];

          if (v12)
          {
            id v13 = [v4 userInfo];
            char v14 = [v13 objectForKeyedSubscript:@"AlertUser"];
            int v12 = sub_100082F48(v14, 0);
          }
          IXCreateUserPresentableError(0xBuLL, v12, v4);
          id v4 = (id)objc_claimAutoreleasedReturnValue();

          break;
        }
      }
      else
      {
      }
      uint64_t v9 = [v6 userInfo];
      uint64_t v10 = [v9 objectForKeyedSubscript:NSUnderlyingErrorKey];

      BOOL v6 = (void *)v10;
      if (!v10)
      {
        id v4 = 0;
        break;
      }
    }
  }
LABEL_16:

  return v4;
}

uint64_t sub_10000AF04()
{
  qword_100109DA8 = (uint64_t)objc_alloc_init((Class)objc_opt_class());

  return _objc_release_x1();
}

void sub_10000B1D4(uint64_t a1, void *a2, unsigned char *a3)
{
  id v5 = a2;
  BOOL v6 = +[LSApplicationWorkspace defaultWorkspace];
  id v7 = [v5 bundleID];
  unsigned __int8 v8 = [v6 applicationIsInstalled:v7];

  if ((v8 & 1) != 0
    || ([v5 bundleID],
        uint64_t v9 = objc_claimAutoreleasedReturnValue(),
        [*(id *)(a1 + 32) _testAppRemovabilityBundleID],
        uint64_t v10 = objc_claimAutoreleasedReturnValue(),
        unsigned int v11 = [v9 isEqual:v10],
        v10,
        v9,
        v11))
  {
    objc_msgSend(*(id *)(a1 + 32), "_onQueue_setRemovabilityForAppWithIdentity:usingEligibilityAnswer:", v5, *(void *)(a1 + 40));
  }
  else
  {
    int v12 = sub_100004B28((uint64_t)off_100109BB8);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      int v13 = 136315394;
      char v14 = "-[IXSAppDeletionEligibilityManager _onQueue_updateRemovabilityForAppIdentities:usingEligibilityAnswer:]_block_invoke";
      __int16 v15 = 2112;
      id v16 = v5;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "%s: No LSApplicationRecord found for %@, assuming uninstalled, skipping", (uint8_t *)&v13, 0x16u);
    }
  }
  *a3 = 0;
}

void sub_10000B7F8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_10000B820(uint64_t a1, void *a2, void *a3, unsigned char *a4)
{
  id v15 = a2;
  id v7 = a3;
  unsigned __int8 v8 = +[NSNumber numberWithLongLong:0];
  id v9 = objc_msgSend(*(id *)(a1 + 32), "_eligibilityAnswerForDomain:", objc_msgSend(v15, "longLongValue"));
  if (v9)
  {
    id v10 = v9;
    if (v9 != [v7 longLongValue])
    {
      *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = 1;
      uint64_t v11 = +[NSNumber numberWithLongLong:v10];

      int v12 = [*(id *)(a1 + 32) domainToEligibilityAnswerMap];
      [v12 setObject:v11 forKey:v15];

      int v13 = *(void **)(a1 + 32);
      char v14 = [*(id *)(a1 + 40) objectForKeyedSubscript:v15];
      objc_msgSend(v13, "_onQueue_updateRemovabilityForAppIdentities:usingEligibilityAnswer:", v14, v10);

      unsigned __int8 v8 = (void *)v11;
    }
  }
  *a4 = 0;
}

id sub_10000B9D0(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_onQueue_processEligibilityDomainChange");
}

id sub_10000BD34(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_onQueue_enumerateSystemAppPlaceholdersAndSetAppRemovability:", *(void *)(a1 + 40));
}

void sub_10000BE44(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t sub_10000BE5C(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void sub_10000BE6C(uint64_t a1)
{
}

void sub_10000BE74(uint64_t a1)
{
  id v5 = [*(id *)(a1 + 32) domainToEligibilityAnswerMap];
  id v2 = [v5 copy];
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
  id v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;
}

void sub_10000BF94(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 40) mutableCopy];
  [*(id *)(a1 + 32) setDomainToEligibilityAnswerMap:v2];
}

void sub_10000CD68(id a1)
{
  id v31 = 0;
  int v1 = sub_10000D168((uint64_t)"com.apple.mobile.usermanagerd.xpc", &v31);
  id v2 = v31;
  id v30 = 0;
  int v3 = sub_10000D168((uint64_t)"com.apple.mobile.keybagd.UserManager.xpc", &v30);
  id v4 = v30;
  *(void *)error = 0;
  id v5 = SecTaskCreateFromSelf(0);
  if (!v5)
  {
    int v12 = sub_100004B28((uint64_t)off_100109BB8);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
      sub_10008BF14();
    }

    char v14 = sub_10003DAE4((uint64_t)"_ProcessHasUMEntitlement", 272, @"IXErrorDomain", 1uLL, 0, 0, @"SecTaskCreateFromSelf returned NULL when attempting to fetch UM entitlement", v13, v29);
    goto LABEL_14;
  }
  BOOL v6 = v5;
  id v7 = (void *)SecTaskCopyValueForEntitlement(v5, @"com.apple.usermanagerd.persona.fetch", (CFErrorRef *)error);
  if (!v7)
  {
    id v15 = sub_100004B28((uint64_t)off_100109BB8);
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
      sub_10008BF8C((void **)error);
    }

    id v16 = *(void **)error;
    char v14 = sub_10003DAE4((uint64_t)"_ProcessHasUMEntitlement", 278, @"IXErrorDomain", 1uLL, *(void **)error, 0, @"SecTaskCopyValueForEntitlement returned NULL when attempting to fetch the value for the entitlement \"com.apple.usermanagerd.persona.fetch\" in the current process.", v17, v29);

    CFRelease(v6);
LABEL_14:
    id v10 = v14;

    int v11 = 0;
    goto LABEL_15;
  }
  unsigned __int8 v8 = v7;
  unsigned int v9 = sub_100082F48(v7, 0);

  if (v9)
  {
    CFRelease(v6);
    id v10 = 0;
    int v11 = 1;
    goto LABEL_15;
  }
  uint64_t v18 = sub_100004B28((uint64_t)off_100109BB8);
  if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR)) {
    sub_10008C014();
  }

  int v11 = 1;
  id v20 = sub_10003DAE4((uint64_t)"_ProcessHasUMEntitlement", 284, @"IXErrorDomain", 1uLL, 0, 0, @"Client process has a value other than true for the entitlement \"com.apple.usermanagerd.persona.fetch\".", v19, v29);

  CFRelease(v6);
  char v14 = 0;
  id v10 = 0;
  if (!v20) {
    goto LABEL_14;
  }
LABEL_15:
  id v21 = v10;
  if (v1)
  {
    byte_100109DB8 = v3 & v11;
    if (v3 & v11) {
      goto LABEL_24;
    }
  }
  else
  {
    byte_100109DB8 = 0;
  }
  id v22 = sub_100004B28((uint64_t)off_100109BB8);
  if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)error = 136316930;
    *(void *)&error[4] = "_ProcessCanAccessUM_block_invoke";
    __int16 v33 = 1024;
    if (v1) {
      uint64_t v23 = 89;
    }
    else {
      uint64_t v23 = 78;
    }
    int v34 = v23;
    if (v3) {
      int v27 = 89;
    }
    else {
      int v27 = 78;
    }
    __int16 v35 = 1024;
    if (v11) {
      int v28 = 89;
    }
    else {
      int v28 = 78;
    }
    int v36 = v27;
    __int16 v37 = 1024;
    int v38 = v28;
    __int16 v39 = 2112;
    id v40 = v2;
    __int16 v41 = 2112;
    id v42 = v4;
    __int16 v43 = 2112;
    id v44 = v21;
    __int16 v45 = 2112;
    uint64_t v46 = 0;
    _os_log_error_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_ERROR, "%s: This process can't access UM (mach-lookup com.apple.mobile.usermanagerd.xpc: %c, mach-lookup com.apple.mobile.keybagd.UserManager.xpc: %c, entitlement com.apple.usermanagerd.persona.fetch: %c): (%@, %@, %@) : %@", error, 0x46u);
  }
  else if (v1)
  {
    uint64_t v23 = 89;
  }
  else
  {
    uint64_t v23 = 78;
  }

  uint64_t v25 = sub_10003DAE4((uint64_t)"_ProcessCanAccessUM_block_invoke", 344, @"IXErrorDomain", 1uLL, 0, 0, @"This process can't access UM (mach-lookup com.apple.mobile.usermanagerd.xpc: %c, mach-lookup com.apple.mobile.keybagd.UserManager.xpc: %c, entitlement com.apple.usermanagerd.persona.fetch: %c): (%@, %@, %@)", v24, v23);
  v26 = (void *)qword_100109DC0;
  qword_100109DC0 = v25;

LABEL_24:
}

uint64_t sub_10000D168(uint64_t a1, void *a2)
{
  getpid();
  int v4 = sandbox_check();
  if (v4)
  {
    if (v4 == 1)
    {
      id v5 = sub_100004B28((uint64_t)off_100109BB8);
      if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
        sub_10008C148(a1, v5);
      }

      sub_10003DAE4((uint64_t)"_ClientProcessLookupMachPortName", 311, @"IXErrorDomain", 1uLL, 0, 0, @"This process does not have sandbox access to mach-lookup %s", v6, a1);
    }
    else
    {
      int v9 = *__error();
      id v10 = sub_100004B28((uint64_t)off_100109BB8);
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
        sub_10008C08C(a1, v9, v10);
      }

      strerror(v9);
      sub_10003DAE4((uint64_t)"_ClientProcessLookupMachPortName", 316, @"IXErrorDomain", 1uLL, 0, 0, @"sandbox_check returned an error when checking if this process can mach-lookup %s : %s", v11, a1);
    }
    id v7 = (id)objc_claimAutoreleasedReturnValue();
    if (a2)
    {
      id v7 = v7;
      uint64_t v8 = 0;
      *a2 = v7;
    }
    else
    {
      uint64_t v8 = 0;
    }
  }
  else
  {
    id v7 = 0;
    uint64_t v8 = 1;
  }

  return v8;
}

__CFString *sub_10000D2F0()
{
  int v0 = __chkstk_darwin();
  int v1 = proc_pidpath(v0, buffer, 0x1000u);
  if (v1 < 1)
  {
    int v3 = @"Unknown Process Name";
  }
  else
  {
    id v2 = [objc_alloc((Class)NSString) initWithBytes:buffer length:v1 encoding:4];
    int v3 = [v2 lastPathComponent];
  }

  return v3;
}

id sub_10000D3CC(void *a1)
{
  id v1 = [a1 processIdentifier];
  id v2 = sub_10000D2F0();
  int v3 = +[NSString stringWithFormat:@"%@ (pid %d)", v2, v1];

  return v3;
}

id sub_10000D448(void *a1, uint64_t a2)
{
  id v2 = [a1 valueForEntitlement:a2];
  if (objc_opt_respondsToSelector()) {
    id v3 = [v2 BOOLValue];
  }
  else {
    id v3 = 0;
  }

  return v3;
}

uint64_t sub_10000D4A0(void *a1, void *a2)
{
  id v3 = a2;
  int v4 = [a1 valueForEntitlement:@"com.apple.private.mobileinstall.allowedSPI"];
  if (!v4) {
    goto LABEL_8;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    if (([v4 isEqualToString:v3] & 1) == 0)
    {
LABEL_8:
      uint64_t v5 = 0;
      goto LABEL_9;
    }
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0 || ([v4 containsObject:v3] & 1) == 0) {
      goto LABEL_8;
    }
  }
  uint64_t v5 = 1;
LABEL_9:

  return v5;
}

id sub_10000D560(void *a1, void *a2)
{
  id v3 = a1;
  id v4 = a2;
  if (sub_10000D4A0(v3, v4))
  {
    uint64_t v5 = 0;
  }
  else
  {
    uint64_t v6 = sub_100004B28((uint64_t)off_100109BB8);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      sub_10008C1E0(v3, (uint64_t)v4, v6);
    }

    id v7 = sub_10000D3CC(v3);
    uint64_t v5 = sub_10003DAE4((uint64_t)"IXValidateMobileInstallationSPIEntitlement", 84, @"IXErrorDomain", 0x19uLL, 0, 0, @"Process %@ is required to have an entitlement named \"%@\" with an array containing \"%@\" to call this SPI.", v8, (uint64_t)v7);
  }

  return v5;
}

id sub_10000D670(void *a1)
{
  id v1 = [a1 valueForEntitlement:@"com.apple.private.mobileinstall.allowed-linked-parents"];
  objc_opt_class();
  id v2 = v1;
  if (objc_opt_isKindOfClass()) {
    id v3 = v2;
  }
  else {
    id v3 = 0;
  }

  if (v3 && (objc_opt_class(), sub_100082AC8(v3))) {
    id v4 = v3;
  }
  else {
    id v4 = 0;
  }

  return v4;
}

__CFString *sub_10000D72C(uint64_t a1)
{
  if ((int)a1 > 20)
  {
    switch(a1)
    {
      case 0x15:
        id v2 = @"QOS_CLASS_DEFAULT";
        break;
      case 0x21:
        id v2 = @"QOS_CLASS_USER_INTERACTIVE";
        break;
      case 0x19:
        id v2 = @"QOS_CLASS_USER_INITIATED";
        break;
      default:
LABEL_26:
        id v2 = +[NSString stringWithFormat:@"Unknown Class: %u", a1];
        return v2;
    }
  }
  else if (a1)
  {
    if (a1 != 9)
    {
      if (a1 == 17)
      {
        id v2 = @"QOS_CLASS_UTILITY";
        return v2;
      }
      goto LABEL_26;
    }
    id v2 = @"QOS_CLASS_BACKGROUND";
  }
  else
  {
    id v2 = @"QOS_CLASS_UNSPECIFIED";
  }
  return v2;
}

id sub_10000D83C(void *a1, void *a2, void *a3, void *a4)
{
  id v7 = a2;
  id v8 = a3;
  id v9 = a1;
  id v10 = [v9 copy];
  unsigned __int8 v11 = sub_10000D448(v7, @"com.apple.private.install.distributor-info-source");
  int v12 = [v9 distributorInfo];

  if ((v11 & 1) != 0 || !v12)
  {
    id v18 = v10;
    uint64_t v17 = 0;
    if (!a4) {
      goto LABEL_10;
    }
    goto LABEL_8;
  }
  uint64_t v13 = [v12 distributorID];
  char v14 = sub_100004B28((uint64_t)off_100109BB8);
  if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
  {
    id v20 = sub_10000D3CC(v7);
    *(_DWORD *)buf = 136316418;
    id v22 = "IXSanitizeAndValidateRestrictedStoreMetadata";
    __int16 v23 = 2112;
    uint64_t v24 = v20;
    __int16 v25 = 2112;
    id v26 = v8;
    __int16 v27 = 2112;
    CFStringRef v28 = @"com.apple.private.install.distributor-info-source";
    __int16 v29 = 2112;
    id v30 = v13;
    __int16 v31 = 2112;
    uint64_t v32 = 0;
    _os_log_error_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_ERROR, "%s: Client %@ setting the %@ did not have the required entitlement \"%@\" = TRUE to allow the distribution info in the store metadata to be set (supplied distributor ID was '%@'). : %@", buf, 0x3Eu);
  }
  id v15 = sub_10000D3CC(v7);
  uint64_t v17 = sub_10003DAE4((uint64_t)"IXSanitizeAndValidateRestrictedStoreMetadata", 142, @"IXErrorDomain", 0x19uLL, 0, 0, @"Client %@ setting the %@ did not have the required entitlement \"%@\" = TRUE to allow the distribution info in the store metadata to be set (supplied distributor ID was '%@').", v16, (uint64_t)v15);

  id v18 = 0;
  if (a4)
  {
LABEL_8:
    if (!v18) {
      *a4 = v17;
    }
  }
LABEL_10:

  return v18;
}

uint64_t sub_10000DCE4()
{
  qword_100109DD0 = (uint64_t)objc_alloc_init((Class)objc_opt_class());

  return _objc_release_x1();
}

void sub_10000DDE0(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) identityToCoordinatorMap];
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = [v2 count];
}

id sub_10000EFD0(uint64_t a1)
{
  return [*(id *)(a1 + 32) cancelForReason:*(void *)(a1 + 40) client:15 error:0];
}

void sub_10000F598(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t sub_10000F5B0(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void sub_10000F5C0(uint64_t a1)
{
}

void sub_10000F5C8(uint64_t a1)
{
  id v5 = [*(id *)(a1 + 32) uuidToCoordinatorMap];
  uint64_t v2 = [v5 objectForKeyedSubscript:*(void *)(a1 + 40)];
  uint64_t v3 = *(void *)(*(void *)(a1 + 48) + 8);
  id v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;
}

void sub_10000F734(id *a1)
{
  uint64_t v2 = [a1[4] identityToCoordinatorMap];
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472;
  v3[2] = sub_10000F7E8;
  v3[3] = &unk_1000E9118;
  id v4 = a1[5];
  id v5 = a1[6];
  [v2 enumerateKeysAndObjectsUsingBlock:v3];
}

void sub_10000F7E8(uint64_t a1, void *a2, void *a3)
{
  id v7 = a3;
  id v5 = *(void **)(a1 + 32);
  uint64_t v6 = [a2 bundleID];
  LODWORD(v5) = [v5 isEqualToString:v6];

  if (v5) {
    [*(id *)(a1 + 40) addObject:v7];
  }
}

void sub_10000F99C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_10000F9B4(uint64_t a1)
{
  id v5 = [*(id *)(a1 + 32) identityToCoordinatorMap];
  uint64_t v2 = [v5 objectForKeyedSubscript:*(void *)(a1 + 40)];
  uint64_t v3 = *(void *)(*(void *)(a1 + 48) + 8);
  id v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;
}

void sub_10000FD50(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_start(va1, a13);
  va_start(va, a13);
  uint64_t v14 = va_arg(va1, void);
  uint64_t v16 = va_arg(va1, void);
  uint64_t v17 = va_arg(va1, void);
  uint64_t v18 = va_arg(va1, void);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  _Unwind_Resume(a1);
}

uint64_t sub_10000FD7C(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) identityToCoordinatorMap];
  uint64_t v3 = [v2 objectForKeyedSubscript:*(void *)(a1 + 40)];
  uint64_t v4 = *(void *)(*(void *)(a1 + 48) + 8);
  id v5 = *(void **)(v4 + 40);
  *(void *)(v4 + 40) = v3;

  id v8 = [*(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) scopedToConnection];
  BOOL v6 = [*(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) coordinatorScope] != 1
    || v8 == 0;
  if (!v6 && ([v8 clientProcessExists] & 1) == 0)
  {
    if (objc_msgSend(*(id *)(a1 + 32), "_onMapQueue_removeCoordinatorFromMaps:", *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40)))objc_msgSend(*(id *)(a1 + 32), "_onMapQueue_saveIdentityPriority"); {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = 1;
    }
  }

  return _objc_release_x1();
}

void sub_1000100F4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v13 - 112), 8);
  _Unwind_Resume(a1);
}

void sub_100010120(uint64_t a1)
{
  uint64_t v2 = *(void **)(a1 + 32);
  uint64_t v3 = *(void *)(a1 + 40);
  uint64_t v4 = *(void *)(a1 + 48);
  id v38 = 0;
  uint64_t v5 = [v2 _lookupCoordinatorForIdentity:v3 checkingScopeForConnection:v4 error:&v38];
  id v6 = v38;
  uint64_t v7 = *(void *)(*(void *)(a1 + 64) + 8);
  id v8 = *(void **)(v7 + 40);
  *(void *)(v7 + 40) = v5;

  if (!*(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 40))
  {
    id v9 = [v6 domain];
    if ([v9 isEqualToString:@"IXErrorDomain"])
    {
      id v10 = [v6 code];

      if (v10 == (id)6)
      {

        uint64_t v11 = (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
        uint64_t v12 = *(void *)(*(void *)(a1 + 64) + 8);
        uint64_t v13 = *(void **)(v12 + 40);
        *(void *)(v12 + 40) = v11;

        unsigned __int8 v14 = [*(id *)(*(void *)(*(void *)(a1 + 64) + 8) + 40) coordinatorScope];
        id v15 = [*(id *)(*(void *)(*(void *)(a1 + 64) + 8) + 40) uniqueIdentifier];
        uint64_t v16 = [*(id *)(a1 + 48) connectionUUID];
        uint64_t v17 = [*(id *)(a1 + 32) mapQueue];
        block[0] = _NSConcreteStackBlock;
        block[1] = 3221225472;
        block[2] = sub_1000104D8;
        block[3] = &unk_1000E9190;
        uint64_t v18 = *(void *)(a1 + 32);
        uint64_t v19 = *(void **)(a1 + 40);
        uint64_t v36 = *(void *)(a1 + 64);
        void block[4] = v18;
        id v33 = v19;
        id v20 = v15;
        id v34 = v20;
        unsigned __int8 v37 = v14;
        id v21 = v16;
        id v35 = v21;
        dispatch_sync(v17, block);

        id v22 = sub_100004B28((uint64_t)off_100109BB8);
        if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
        {
          uint64_t v23 = *(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 40);
          *(_DWORD *)buf = 136315394;
          id v40 = "-[IXSCoordinatorManager coordinatorForIdentity:connection:error:creatingIfNotExisting:]_block_invoke";
          __int16 v41 = 2112;
          uint64_t v42 = v23;
          _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_DEFAULT, "%s: Registered coordinator: %@", buf, 0x16u);
        }

        uint64_t v24 = [*(id *)(*(void *)(*(void *)(a1 + 64) + 8) + 40) seed];
        unint64_t v25 = (unint64_t)[v24 intent];

        if (v25 >= 8)
        {
          id v26 = +[NSString stringWithFormat:@"Unknown intent value %lu", v25];
        }
        else
        {
          id v26 = off_1000E9250[v25];
        }
        CFStringRef v28 = IXStringForClientID((unint64_t)[*(id *)(*(void *)(*(void *)(a1 + 64) + 8) + 40) creator]);
        __int16 v29 = +[NSString stringWithFormat:@"Created coordinator with intent %@ for client %@", v26, v28];

        if (v25 - 1 > 6) {
          uint64_t v30 = 17;
        }
        else {
          uint64_t v30 = qword_1000AAED0[v25 - 1];
        }
        __int16 v31 = [*(id *)(a1 + 40) bundleID];
        +[AITransactionLog logStep:v30 byParty:4 phase:1 success:1 forBundleID:v31 description:v29];

        id v6 = 0;
        goto LABEL_15;
      }
    }
    else
    {
    }
    uint64_t v27 = *(void *)(*(void *)(a1 + 72) + 8);
    id v6 = v6;
    id v20 = *(id *)(v27 + 40);
    *(void *)(v27 + 40) = v6;
LABEL_15:
  }
}

id sub_1000104D8(uint64_t a1)
{
  [*(id *)(*(void *)(*(void *)(a1 + 64) + 8) + 40) setIsTracked:1];
  uint64_t v2 = *(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 40);
  uint64_t v3 = [*(id *)(a1 + 32) identityToCoordinatorMap];
  [v3 setObject:v2 forKeyedSubscript:*(void *)(a1 + 40)];

  uint64_t v4 = *(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 40);
  uint64_t v5 = [*(id *)(a1 + 32) uuidToCoordinatorMap];
  [v5 setObject:v4 forKeyedSubscript:*(void *)(a1 + 48)];

  if (*(unsigned char *)(a1 + 72) == 1)
  {
    id v6 = [*(id *)(a1 + 32) connectionToProcessScopedCoordinatorMap];
    uint64_t v7 = [v6 objectForKeyedSubscript:*(void *)(a1 + 56)];

    if (!v7)
    {
      uint64_t v7 = objc_opt_new();
      id v8 = [*(id *)(a1 + 32) connectionToProcessScopedCoordinatorMap];
      [v8 setObject:v7 forKeyedSubscript:*(void *)(a1 + 56)];
    }
    [v7 addObject:*(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 40)];
  }
  id v9 = [*(id *)(a1 + 32) identityPriority];
  [v9 addObject:*(void *)(a1 + 40)];

  id v10 = *(void **)(a1 + 32);

  return objc_msgSend(v10, "_onMapQueue_saveIdentityPriority");
}

uint64_t sub_1000106C4(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void sub_10001085C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id sub_100010880(uint64_t a1)
{
  id result = objc_msgSend(*(id *)(a1 + 32), "_onMapQueue_removeCoordinatorFromMaps:", *(void *)(a1 + 40));
  *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = (_BYTE)result;
  if (*(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24))
  {
    uint64_t v3 = *(void **)(a1 + 32);
    return objc_msgSend(v3, "_onMapQueue_saveIdentityPriority");
  }
  return result;
}

void sub_100010A88(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_100010AAC(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) identityPriority];
  unsigned int v3 = [v2 containsObject:*(void *)(a1 + 40)];

  if (v3)
  {
    uint64_t v4 = [*(id *)(a1 + 32) identityPriority];
    [v4 removeObject:*(void *)(a1 + 40)];

    uint64_t v5 = [*(id *)(a1 + 32) identityPriority];
    [v5 insertObject:*(void *)(a1 + 40) atIndex:0];

    objc_msgSend(*(id *)(a1 + 32), "_onMapQueue_saveIdentityPriority");
    *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = 1;
  }
}

void sub_100010DC8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, ...)
{
  va_start(va, a16);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_100010DF4(uint64_t a1)
{
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  uint64_t v2 = [*(id *)(a1 + 32) identityPriority];
  id v3 = [v2 countByEnumeratingWithState:&v13 objects:v21 count:16];
  if (v3)
  {
    id v5 = v3;
    uint64_t v6 = *(void *)v14;
    *(void *)&long long v4 = 136315394;
    long long v12 = v4;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v14 != v6) {
          objc_enumerationMutation(v2);
        }
        uint64_t v8 = *(void *)(*((void *)&v13 + 1) + 8 * (void)v7);
        id v9 = objc_msgSend(*(id *)(a1 + 32), "identityToCoordinatorMap", v12);
        id v10 = [v9 objectForKeyedSubscript:v8];

        if (v10)
        {
          [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) addObject:v10];
        }
        else
        {
          uint64_t v11 = sub_100004B28((uint64_t)off_100109BB8);
          if (os_log_type_enabled(v11, OS_LOG_TYPE_FAULT))
          {
            *(_DWORD *)buf = v12;
            uint64_t v18 = "-[IXSCoordinatorManager _enumerateCoordinatorsForConnection:usingBlock:]_block_invoke";
            __int16 v19 = 2112;
            uint64_t v20 = v8;
            _os_log_fault_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_FAULT, "%s: Identity %@ found in identityPriority array was not found in identityToCoordinatorMap", buf, 0x16u);
          }
        }
        uint64_t v7 = (char *)v7 + 1;
      }
      while (v5 != v7);
      id v5 = [v2 countByEnumeratingWithState:&v13 objects:v21 count:16];
    }
    while (v5);
  }
}

void sub_10001126C(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 160), 8);
  _Unwind_Resume(a1);
}

void sub_100011298(uint64_t a1)
{
  id v5 = [*(id *)(a1 + 32) identityToCoordinatorMap];
  uint64_t v2 = [v5 allValues];
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
  long long v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;
}

void sub_10001155C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,char a26)
{
}

void sub_100011590(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) connectionToProcessScopedCoordinatorMap];
  uint64_t v3 = [v2 objectForKeyedSubscript:*(void *)(a1 + 40)];
  uint64_t v4 = *(void *)(*(void *)(a1 + 48) + 8);
  id v5 = *(void **)(v4 + 40);
  *(void *)(v4 + 40) = v3;

  if (*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40))
  {
    uint64_t v6 = [*(id *)(a1 + 32) connectionToProcessScopedCoordinatorMap];
    [v6 removeObjectForKey:*(void *)(a1 + 40)];

    long long v15 = 0u;
    long long v16 = 0u;
    long long v13 = 0u;
    long long v14 = 0u;
    id v7 = *(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40);
    id v8 = [v7 countByEnumeratingWithState:&v13 objects:v17 count:16];
    if (v8)
    {
      id v9 = v8;
      int v10 = 0;
      uint64_t v11 = *(void *)v14;
      do
      {
        for (i = 0; i != v9; i = (char *)i + 1)
        {
          if (*(void *)v14 != v11) {
            objc_enumerationMutation(v7);
          }
          v10 |= objc_msgSend(*(id *)(a1 + 32), "_onMapQueue_removeCoordinatorFromMaps:", *(void *)(*((void *)&v13 + 1) + 8 * i), (void)v13);
        }
        id v9 = [v7 countByEnumeratingWithState:&v13 objects:v17 count:16];
      }
      while (v9);

      if (v10) {
        objc_msgSend(*(id *)(a1 + 32), "_onMapQueue_saveIdentityPriority");
      }
    }
    else
    {
    }
  }
}

void sub_1000117F8(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) connectionToProcessScopedCoordinatorMap];
  id v4 = [v2 objectForKeyedSubscript:*(void *)(a1 + 40)];

  [v4 removeObject:*(void *)(a1 + 48)];
  if (![v4 count])
  {
    uint64_t v3 = [*(id *)(a1 + 32) connectionToProcessScopedCoordinatorMap];
    [v3 removeObjectForKey:*(void *)(a1 + 40)];
  }
}

CFStringRef IXStringForCoordinatorImportance(unint64_t a1)
{
  if (a1 > 4) {
    return @"Unhandled";
  }
  else {
    return off_1000E9290[a1];
  }
}

uint64_t sub_1000126B4()
{
  qword_100109DE0 = (uint64_t)[objc_alloc((Class)objc_opt_class()) initWithWidth:5];

  return _objc_release_x1();
}

uint64_t sub_100012798()
{
  qword_100109DF0 = (uint64_t)[objc_alloc((Class)objc_opt_class()) initWithWidth:5];

  return _objc_release_x1();
}

id sub_1000129C4(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_onQueue_runAsyncForIdentity:description:operation:", *(void *)(a1 + 40), *(void *)(a1 + 48), *(void *)(a1 + 56));
}

void sub_100012F14(id *a1)
{
  uint64_t v2 = [a1[4] block];
  v2[2]();

  uint64_t v3 = [a1[5] internalQueue];
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_100012FEC;
  v6[3] = &unk_1000E9140;
  id v7 = a1[6];
  id v4 = a1[4];
  id v5 = a1[5];
  id v8 = v4;
  id v9 = v5;
  sub_100066F24(v3, v6);
}

id sub_100012FEC(uint64_t a1)
{
  uint64_t v2 = sub_100004B28((uint64_t)off_100109BB8);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG)) {
    sub_10008C7C0(a1);
  }

  uint64_t v3 = [*(id *)(a1 + 48) activeIdentities];
  [v3 removeObject:*(void *)(a1 + 32)];

  return objc_msgSend(*(id *)(a1 + 48), "_onQueue_deQueueIfNeeded");
}

void sub_10001327C(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_debug_impl(a1, v9, OS_LOG_TYPE_DEBUG, a4, &a9, 0x20u);
}

void sub_10001329C(void *a1, void *a2)
{
  id v3 = a1;
  id v4 = a2;
  if (sub_10006706C())
  {
    time_t v18 = 0;
    *(void *)__s = 0;
    uint64_t v25 = 0;
    __int16 v27 = 0;
    uint64_t v26 = 0;
    time(&v18);
    ctime_r(&v18, __s);
    size_t v5 = strlen(__s);
    if (v5) {
      __s[v5 - 1] = 0;
    }
    uint64_t v6 = (void *)MGCopyAnswer();
    id v7 = (void *)MGCopyAnswer();
    id v8 = (void *)MGCopyAnswer();
    id v9 = +[NSString stringWithFormat:@"INTERNAL-ONLY MESSAGE: InstallCoordination has encountered an error"];
    uint64_t v10 = +[NSString stringWithFormat:@"%@\n\nPlease file a bug! It's quick and easy.", v3];
    if (v4)
    {
      uint64_t v11 = [v4 domain];
      long long v12 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"InstallCoordination error: %@ %@:%ld", v3, v11, [v4 code]);
    }
    else
    {
      long long v12 = +[NSString stringWithFormat:@"InstallCoordination error: %@", v3];
    }
    long long v13 = +[NSString stringWithFormat:@"Steps to reproduce:\n\n\n\nAuto-Gathered Info:\nReason %@\nTime: %s\nDevice Info: %@ %@ (%@)\nError: %@", v3, __s, v6, v7, v8, v4];
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_100013E90;
    block[3] = &unk_1000E9328;
    id v20 = v9;
    id v21 = v10;
    id v22 = v12;
    id v23 = v13;
    id v14 = v13;
    id v15 = v12;
    id v16 = v10;
    id v17 = v9;
    dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
  }
}

CFStringRef sub_100013520(const __CFString *a1, uint64_t a2)
{
  bzero(buffer, 0x400uLL);
  bzero(chars, 0x800uLL);
  if (a2 > 1023) {
    return 0;
  }
  CFMutableStringRef MutableWithExternalCharactersNoCopy = CFStringCreateMutableWithExternalCharactersNoCopy(kCFAllocatorDefault, chars, 0, 1024, kCFAllocatorNull);
  if (!MutableWithExternalCharactersNoCopy) {
    return 0;
  }
  size_t v5 = MutableWithExternalCharactersNoCopy;
  CFIndex Length = CFStringGetLength(a1);
  if (Length >= 1 && a2 >= 1)
  {
    CFIndex v7 = Length;
    CFIndex v8 = 0;
    id v9 = buffer;
    while (1)
    {
      CFRange RangeOfComposedCharactersAtIndex = CFStringGetRangeOfComposedCharactersAtIndex(a1, v8);
      if (RangeOfComposedCharactersAtIndex.length > 1024)
      {
        CFStringRef v12 = 0;
        goto LABEL_15;
      }
      CFStringGetCharacters(a1, RangeOfComposedCharactersAtIndex, chars);
      CFStringSetExternalCharactersNoCopy(v5, chars, RangeOfComposedCharactersAtIndex.length, 1024);
      if (!CFStringGetFileSystemRepresentation(v5, v9, a2 + 1)) {
        break;
      }
      v8 += RangeOfComposedCharactersAtIndex.length;
      size_t v11 = strlen(v9);
      if (v8 < v7)
      {
        v9 += v11;
        a2 -= v11;
        if (a2 > 0) {
          continue;
        }
      }
      goto LABEL_14;
    }
    *id v9 = 0;
  }
LABEL_14:
  CFStringRef v12 = CFStringCreateWithFileSystemRepresentation(kCFAllocatorDefault, buffer);
LABEL_15:
  CFRelease(v5);
  return v12;
}

uint64_t sub_1000136C0(void *a1, void *a2, void *a3)
{
  id v5 = a1;
  id v6 = a2;
  id v7 = a3;
  id v35 = +[LSApplicationWorkspace defaultWorkspace];
  CFIndex v8 = [v6 objectForKeyedSubscript:kMIUninstallParallelPlaceholderKey];
  if (v8)
  {
    BOOL v9 = 0;
  }
  else
  {
    uint64_t v10 = [v6 objectForKeyedSubscript:@"UninstallPlaceholdersOnly"];
    BOOL v9 = v10 == 0;
  }
  size_t v11 = [v5 bundleID];
  id v34 = +[NSNumber numberWithUnsignedInt:geteuid()];
  if (v9)
  {
    id v12 = objc_alloc_init((Class)LSOperationRequestContext);
    [v12 setTargetUserID:v34];
    id v37 = 0;
    unsigned __int8 v13 = [v35 sendNotificationOfType:2 forApplicationWithBundleIdentifier:v11 requestContext:v12 error:&v37];
    id v14 = v37;
    if ((v13 & 1) == 0)
    {
      id v15 = sub_100004B28((uint64_t)off_100109BB8);
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
        sub_10008CA08();
      }
    }
    uint64_t v38 = 0;
    __int16 v39 = &v38;
    uint64_t v40 = 0x2020000000;
    id v16 = (void (*)(void))off_100109E00;
    __int16 v41 = off_100109E00;
    if (!off_100109E00)
    {
      *(void *)buf = _NSConcreteStackBlock;
      *(void *)&buf[8] = 3221225472;
      *(void *)&buf[16] = sub_100014290;
      id v44 = &unk_1000E9350;
      __int16 v45 = &v38;
      sub_100014290((uint64_t)buf);
      id v16 = (void (*)(void))v39[3];
    }
    _Block_object_dispose(&v38, 8);
    if (!v16)
    {
      sub_10008C8FC();
      __break(1u);
    }
    id v17 = v16();
    time_t v18 = [v17 writeUserConsentedRegulatoryDisclosureVersion:0 forBundleIdentifier:v11];

    if (v18)
    {
      __int16 v19 = sub_100004B28((uint64_t)off_100109BB8);
      if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR)) {
        sub_10008C994();
      }
    }
  }
  else
  {
    id v14 = 0;
  }
  id v20 = sub_100004B28((uint64_t)off_100109BB8);
  if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    *(void *)&uint8_t buf[4] = "IXUninstallIdentityWithOptions";
    *(_WORD *)&buf[12] = 2112;
    *(void *)&buf[14] = v7;
    _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEFAULT, "%s: Uninstallation reason: %@", buf, 0x16u);
  }

  id v21 = +[NSMutableDictionary dictionaryWithDictionary:v6];
  [v21 setObject:v7 forKeyedSubscript:@"UninstallReasonString"];
  id v22 = [v21 copy];

  if (!+[ICLFeatureFlags appReferencesEnabled])
  {
    uint64_t v42 = v11;
    uint64_t v30 = +[NSArray arrayWithObjects:&v42 count:1];
    __int16 v31 = MobileInstallationUninstallForInstallCoordinationWithError();
    BOOL v32 = v31 == 0;

    if (v32) {
      goto LABEL_22;
    }
LABEL_29:
    id v25 = [objc_alloc((Class)NSString) initWithFormat:@"Uninstall of %@", v5];
    sub_100014D94(v25);
    uint64_t v29 = 1;
    goto LABEL_30;
  }
  id v23 = [v5 miAppIdentity];
  char v24 = MobileInstallationUninstallAppWithIdentity();

  if (v24) {
    goto LABEL_29;
  }
LABEL_22:
  if (!v9)
  {
    uint64_t v29 = 0;
    goto LABEL_32;
  }
  id v25 = objc_alloc_init((Class)LSOperationRequestContext);
  [v25 setTargetUserID:v34];
  id v36 = v14;
  unsigned __int8 v26 = [v35 sendNotificationOfType:4 forApplicationWithBundleIdentifier:v11 requestContext:v25 error:&v36];
  id v27 = v36;

  if ((v26 & 1) == 0)
  {
    CFStringRef v28 = sub_100004B28((uint64_t)off_100109BB8);
    if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR)) {
      sub_10008C920();
    }
  }
  uint64_t v29 = 0;
  id v14 = v27;
LABEL_30:

LABEL_32:
  return v29;
}

void sub_100013B90(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, ...)
{
  va_start(va, a6);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_100013BB0(void *a1, void *a2, void *a3, void *a4)
{
  id v7 = a4;
  id v8 = a3;
  id v9 = a2;
  id v10 = a1;
  id v11 = objc_alloc_init((Class)SDRDiagnosticReporter);
  id v12 = [v11 signatureWithDomain:v10 type:v9 subType:v8 subtypeContext:v7 detectedProcess:@"installcoordinationd" triggerThresholdValues:0];

  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_100013D14;
  v15[3] = &unk_1000E92D8;
  id v13 = v12;
  id v16 = v13;
  if (([v11 snapshotWithSignature:v13 duration:0 event:0 payload:v15 reply:0.0] & 1) == 0)
  {
    id v14 = sub_100004B28((uint64_t)off_100109BB8);
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
      sub_10008CA7C((uint64_t)v13, v14);
    }
  }
}

void sub_100013D14(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [v3 objectForKeyedSubscript:kSymptomDiagnosticReplySuccess];
  unsigned int v5 = [v4 BOOLValue];

  id v6 = sub_100004B28((uint64_t)off_100109BB8);
  BOOL v7 = os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT);
  if (v5)
  {
    if (v7)
    {
      id v8 = *(void **)(a1 + 32);
      id v9 = [v3 objectForKeyedSubscript:kSymptomDiagnosticReplySessionID];
      int v10 = 136315650;
      id v11 = "IXReportIncidentUsingAutoBugCapture_block_invoke";
      __int16 v12 = 2112;
      id v13 = v8;
      __int16 v14 = 2112;
      id v15 = v9;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "%s: Successfully reported incident for signature %@ (Session identifier: %@)", (uint8_t *)&v10, 0x20u);
    }
  }
  else if (v7)
  {
    int v10 = 136315394;
    id v11 = "IXReportIncidentUsingAutoBugCapture_block_invoke";
    __int16 v12 = 2112;
    id v13 = v3;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "%s: Request to report incident rejected %@", (uint8_t *)&v10, 0x16u);
  }
}

void sub_100013E90(uint64_t a1)
{
  CFOptionFlags v20 = 0;
  CFUserNotificationDisplayAlert(0.0, 2uLL, 0, 0, 0, *(CFStringRef *)(a1 + 32), *(CFStringRef *)(a1 + 40), @"File A Bug", @"No Thanks", 0, &v20);
  if (!v20)
  {
    uint64_t v2 = *(void **)(a1 + 56);
    id v3 = *(id *)(a1 + 48);
    id v4 = v2;
    id v5 = objc_alloc_init((Class)NSURLComponents);
    [v5 setScheme:@"tap-to-radar"];
    [v5 setHost:@"new"];
    id v6 = objc_alloc_init((Class)NSMutableArray);
    id v7 = [objc_alloc((Class)NSURLQueryItem) initWithName:@"ComponentName" value:@"InstallCoordination"];
    [v6 addObject:v7];

    id v8 = [objc_alloc((Class)NSURLQueryItem) initWithName:@"ComponentVersion" value:@"all"];
    [v6 addObject:v8];

    id v9 = [objc_alloc((Class)NSURLQueryItem) initWithName:@"ComponentID" value:@"807410"];
    [v6 addObject:v9];

    id v10 = [objc_alloc((Class)NSURLQueryItem) initWithName:@"Classification" value:@"Serious Bug"];
    [v6 addObject:v10];

    id v11 = [objc_alloc((Class)NSURLQueryItem) initWithName:@"Reproducibility" value:@"I Didn't Try"];
    [v6 addObject:v11];

    id v12 = [objc_alloc((Class)NSURLQueryItem) initWithName:@"AutoDiagnostics" value:@"phone"];
    [v6 addObject:v12];

    if (v3 && [v3 length])
    {
      id v13 = [objc_alloc((Class)NSURLQueryItem) initWithName:@"Title" value:v3];
      [v6 addObject:v13];
    }
    if (v4)
    {
      if ([v4 length])
      {
        id v14 = [objc_alloc((Class)NSURLQueryItem) initWithName:@"Description" value:v4];
        [v6 addObject:v14];
      }
    }
    [v5 setQueryItems:v6];
    id v15 = [v5 URL];

    id v16 = +[LSApplicationWorkspace defaultWorkspace];
    v18[0] = _NSConcreteStackBlock;
    v18[1] = 3221225472;
    v18[2] = sub_1000141A8;
    v18[3] = &unk_1000E9300;
    id v19 = v15;
    id v17 = v15;
    [v16 openURL:v17 configuration:0 completionHandler:v18];
  }
}

void sub_1000141A8(uint64_t a1, uint64_t a2, void *a3)
{
  id v4 = a3;
  if (v4)
  {
    id v5 = sub_100004B28((uint64_t)off_100109BB8);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v6 = *(void *)(a1 + 32);
      int v7 = 136315650;
      id v8 = "_ShowUserNoticeWithTapToRadarButton_block_invoke_2";
      __int16 v9 = 2112;
      uint64_t v10 = v6;
      __int16 v11 = 2112;
      id v12 = v4;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "%s: Failed to open url %@ : %@", (uint8_t *)&v7, 0x20u);
    }
  }
}

void *sub_100014290(uint64_t a1)
{
  v5[0] = 0;
  if (!qword_100109E08)
  {
    v5[1] = _NSConcreteStackBlock;
    v5[2] = 3221225472;
    v5[3] = sub_1000143D0;
    v5[4] = &unk_1000E8C70;
    v5[5] = v5;
    long long v6 = off_1000E9370;
    uint64_t v7 = 0;
    qword_100109E08 = _sl_dlopen();
    id v3 = (void *)v5[0];
    uint64_t v2 = (void *)qword_100109E08;
    if (qword_100109E08)
    {
      if (!v5[0]) {
        goto LABEL_5;
      }
    }
    else
    {
      id v3 = (void *)abort_report_np();
    }
    free(v3);
    goto LABEL_5;
  }
  uint64_t v2 = (void *)qword_100109E08;
LABEL_5:
  id result = dlsym(v2, "PDCGlobalConsentStoreInstance");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  off_100109E00 = *(_UNKNOWN **)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t sub_1000143D0()
{
  uint64_t result = _sl_dlopen();
  qword_100109E08 = result;
  return result;
}

id sub_100014A0C(uint64_t a1)
{
  return [*(id *)(a1 + 32) setComplete:1];
}

void sub_100014D94(void *a1)
{
  id v1 = a1;
  uint64_t v2 = sub_100004B28((uint64_t)off_100109BB8);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    int v5 = 136315394;
    long long v6 = "IXSyncLSDatabase";
    __int16 v7 = 2112;
    id v8 = v1;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "%s: %@; re-fetching local LS database",
      (uint8_t *)&v5,
      0x16u);
  }

  id v3 = +[LSApplicationWorkspace defaultWorkspace];
  [v3 acquireDatabase];

  id v4 = sub_100004B28((uint64_t)off_100109BB8);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    int v5 = 136315138;
    long long v6 = "IXSyncLSDatabase";
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "%s: Fetch of local LS database complete", (uint8_t *)&v5, 0xCu);
  }
}

id sub_100014ED8(void *a1, void *a2)
{
  id v3 = a1;
  id v4 = a2;
  if (!v3)
  {
    __int16 v9 = @"Did not receive a LSRecordPromise";
    goto LABEL_19;
  }
  id v34 = 0;
  int v5 = [v3 fulfillReturningError:&v34];
  id v6 = v34;
  __int16 v7 = v6;
  if (!v5)
  {
    uint64_t v10 = [v6 domain];
    if ([v10 isEqualToString:NSOSStatusErrorDomain])
    {
      id v11 = [v7 code];

      if (v11 == (id)-10814)
      {
        id v12 = sub_100004B28((uint64_t)off_100109BB8);
        if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 136315394;
          id v37 = "_FulfillLSRecordPromise";
          __int16 v38 = 2112;
          id v39 = v3;
          _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "%s: Could not fulfill record promise %@; the record was likely superseded or the app was uninstalled. Fallin"
            "g back to fetching the current record",
            buf,
            0x16u);
        }
        goto LABEL_15;
      }
    }
    else
    {
    }
    id v12 = sub_100004B28((uint64_t)off_100109BB8);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_FAULT)) {
      sub_10008CE18();
    }
    goto LABEL_15;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    id v12 = sub_100004B28((uint64_t)off_100109BB8);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_FAULT)) {
      sub_10008CE8C((uint64_t)v3, (uint64_t)v5, v12);
    }
LABEL_15:

    id v8 = 0;
    goto LABEL_16;
  }
  id v8 = v5;
LABEL_16:

  if (v8)
  {
    id v28 = v3;
    id v13 = v4;
    id v14 = 0;
LABEL_22:
    id v16 = objc_opt_new();
    long long v29 = 0u;
    long long v30 = 0u;
    long long v31 = 0u;
    long long v32 = 0u;
    id v17 = [v8 applicationExtensionRecords];
    id v18 = [v17 countByEnumeratingWithState:&v29 objects:v35 count:16];
    if (v18)
    {
      id v19 = v18;
      uint64_t v20 = *(void *)v30;
      do
      {
        for (i = 0; i != v19; i = (char *)i + 1)
        {
          if (*(void *)v30 != v20) {
            objc_enumerationMutation(v17);
          }
          id v22 = *(void **)(*((void *)&v29 + 1) + 8 * i);
          id v23 = [v22 extensionPointRecord];
          if (v23) {
            [v16 addObject:v23];
          }
          [v16 addObject:v22];
        }
        id v19 = [v17 countByEnumeratingWithState:&v29 objects:v35 count:16];
      }
      while (v19);
    }

    [v16 addObject:v8];
    id v24 = [v16 copy];
    +[LSRecord resolveAllPropertiesOfRecords:v24 andDetachOnQueue:0];

    id v4 = v13;
    id v3 = v28;
    goto LABEL_32;
  }
  __int16 v9 = @"Could not fulfill LSRecordPromise";
LABEL_19:
  sub_100014D94(v9);
  if (v4)
  {
    id v33 = 0;
    id v8 = [objc_alloc((Class)LSApplicationRecord) initWithBundleIdentifier:v4 allowPlaceholder:1 error:&v33];
    id v15 = v33;
    id v14 = v15;
    if (v8)
    {
      id v28 = v3;
      id v13 = v4;
      goto LABEL_22;
    }
    unsigned __int8 v26 = [v15 domain];
    if ([v26 isEqualToString:NSOSStatusErrorDomain])
    {
      id v27 = [v14 code];

      if (v27 == (id)-10814)
      {
        id v16 = sub_100004B28((uint64_t)off_100109BB8);
        if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 136315394;
          id v37 = "IXApplicationRecordForRecordPromise";
          __int16 v38 = 2112;
          id v39 = v4;
          _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "%s: Application record for %@ was not found and its LSRecordPromise could not be fulfilled; likely the appli"
            "cation was uninstalled. Caller will get a nil LSApplicationRecord",
            buf,
            0x16u);
        }
LABEL_44:
        id v8 = 0;
LABEL_32:

        goto LABEL_34;
      }
    }
    else
    {
    }
    id v16 = sub_100004B28((uint64_t)off_100109BB8);
    if (os_log_type_enabled(v16, OS_LOG_TYPE_FAULT)) {
      sub_10008CDA4();
    }
    goto LABEL_44;
  }
  id v14 = 0;
  id v8 = 0;
LABEL_34:

  return v8;
}

id sub_100015380(void *a1, uint64_t a2, void *a3)
{
  id v5 = a1;
  uint64_t v33 = 0;
  id v34 = &v33;
  uint64_t v35 = 0x3032000000;
  id v36 = sub_1000156CC;
  id v37 = sub_1000156DC;
  id v38 = 0;
  uint64_t v27 = 0;
  id v28 = &v27;
  uint64_t v29 = 0x3032000000;
  long long v30 = sub_1000156CC;
  long long v31 = sub_1000156DC;
  id v32 = 0;
  id v6 = [v5 bundleID];
  switch(a2)
  {
    case 1:
      char v7 = 0;
      break;
    case 2:
LABEL_10:
      id v13 = +[LSDatabaseContext sharedDatabaseContext];
      v22[0] = _NSConcreteStackBlock;
      v22[1] = 3221225472;
      v22[2] = sub_1000156E4;
      v22[3] = &unk_1000E9390;
      id v24 = &v27;
      id v25 = &v33;
      id v23 = v6;
      [v13 accessSystemScopeUsingBlock:v22];

LABEL_14:
      goto LABEL_15;
    case 3:
      char v7 = 1;
      break;
    default:
      id v14 = sub_100004B28((uint64_t)off_100109BB8);
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      {
        id v15 = MIStringForInstallationDomain();
        sub_10008CF60(v15, buf, v14);
      }

      id v16 = MIStringForInstallationDomain();
      uint64_t v18 = sub_10003DAE4((uint64_t)"IXApplicationRecordForIdentityInDomain", 139, @"IXErrorDomain", 1uLL, 0, 0, @"Unexpected value for installation domain: %@", v17, (uint64_t)v16);

      id v13 = (void *)v28[5];
      v28[5] = v18;
      goto LABEL_14;
  }
  id v8 = objc_alloc((Class)LSApplicationRecord);
  __int16 v9 = (id *)(v28 + 5);
  id obj = (id)v28[5];
  id v10 = [v8 initWithBundleIdentifier:v6 allowPlaceholder:1 error:&obj];
  objc_storeStrong(v9, obj);
  id v11 = (void *)v34[5];
  v34[5] = (uint64_t)v10;

  if (v34[5]) {
    char v12 = 1;
  }
  else {
    char v12 = v7;
  }
  if ((v12 & 1) == 0) {
    goto LABEL_10;
  }
LABEL_15:
  id v19 = (void *)v34[5];
  if (a3 && !v19)
  {
    *a3 = (id) v28[5];
    id v19 = (void *)v34[5];
  }
  id v20 = v19;

  _Block_object_dispose(&v27, 8);
  _Block_object_dispose(&v33, 8);

  return v20;
}

void sub_100015694(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_start(va1, a11);
  va_start(va, a11);
  uint64_t v12 = va_arg(va1, void);
  uint64_t v14 = va_arg(va1, void);
  uint64_t v15 = va_arg(va1, void);
  uint64_t v16 = va_arg(va1, void);
  uint64_t v17 = va_arg(va1, void);
  uint64_t v18 = va_arg(va1, void);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  _Unwind_Resume(a1);
}

uint64_t sub_1000156CC(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void sub_1000156DC(uint64_t a1)
{
}

void sub_1000156E4(void *a1, char a2, void *a3)
{
  id v6 = a3;
  if (v6 || (a2 & 1) == 0)
  {
    objc_storeStrong((id *)(*(void *)(a1[5] + 8) + 40), a3);
  }
  else
  {
    id v7 = objc_alloc((Class)LSApplicationRecord);
    uint64_t v8 = a1[4];
    uint64_t v9 = *(void *)(a1[5] + 8);
    id obj = *(id *)(v9 + 40);
    id v10 = [v7 initWithBundleIdentifier:v8 allowPlaceholder:1 error:&obj];
    objc_storeStrong((id *)(v9 + 40), obj);
    uint64_t v11 = *(void *)(a1[6] + 8);
    uint64_t v12 = *(void **)(v11 + 40);
    *(void *)(v11 + 40) = v10;
  }
}

id sub_100015794(void *a1, uint64_t a2, void *a3)
{
  id v10 = 0;
  id v4 = sub_100015380(a1, a2, &v10);
  id v5 = v10;
  if (v4)
  {
    id v9 = v5;
    id v6 = [objc_alloc((Class)LSRecordPromise) initWithRecord:v4 error:&v9];
    id v7 = v9;

    id v5 = v7;
    if (!a3) {
      goto LABEL_7;
    }
  }
  else
  {
    id v6 = 0;
    if (!a3) {
      goto LABEL_7;
    }
  }
  if (!v6) {
    *a3 = v5;
  }
LABEL_7:

  return v6;
}

void sub_100015860(void *a1, uint64_t a2, os_log_t log, const char *a4, ...)
{
  va_start(va, a4);
  _os_log_fault_impl(a1, log, OS_LOG_TYPE_FAULT, a4, (uint8_t *)va, 0x20u);
}

uint64_t sub_100017748()
{
  qword_100109E10 = (uint64_t)objc_alloc_init((Class)objc_opt_class());

  return _objc_release_x1();
}

void sub_100017A88(uint64_t a1, unint64_t a2, void *a3)
{
  id v5 = a3;
  id v6 = sub_100004B28((uint64_t)off_100109BB8);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    id v7 = sub_10003B9E4(a2);
    uint64_t v8 = (objc_class *)objc_opt_class();
    id v9 = NSStringFromClass(v8);
    uint64_t v10 = *(void *)(a1 + 40);
    int v12 = 136315906;
    id v13 = "-[IXSAppUninstaller _promptViewHealthKitDataWithIdentity:record:]_block_invoke";
    __int16 v14 = 2112;
    id v15 = v7;
    __int16 v16 = 2112;
    uint64_t v17 = v9;
    __int16 v18 = 2112;
    uint64_t v19 = v10;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "%s: Received disposition %@ from %@ for identity:%@", (uint8_t *)&v12, 0x2Au);
  }
  if (a2 == 1)
  {
    uint64_t v11 = [*(id *)(a1 + 40) bundleID];
    +[IXSHealthKitDataUninstallAlert viewHealthKitDataForAppWithBundleID:v11];
LABEL_8:

    goto LABEL_9;
  }
  if (!a2)
  {
    uint64_t v11 = sub_100004B28((uint64_t)off_100109BB8);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      int v12 = 136315394;
      id v13 = "-[IXSAppUninstaller _promptViewHealthKitDataWithIdentity:record:]_block_invoke";
      __int16 v14 = 2112;
      id v15 = v5;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "%s: Prompting for HealthKit related data failed (non-fatal): %@", (uint8_t *)&v12, 0x16u);
    }
    goto LABEL_8;
  }
LABEL_9:
}

id *sub_100017D40(id *result, int a2)
{
  if (a2) {
    return (id *)[result[4] _promptViewHealthKitDataWithIdentity:result[5] record:result[6]];
  }
  return result;
}

void sub_1000186AC(uint64_t a1)
{
  id v3 = [*(id *)(a1 + 32) coordinatorForIdentity:*(void *)(a1 + 40)];
  if (v3)
  {
    uint64_t v4 = sub_10003DAE4((uint64_t)"-[IXSAppUninstaller _performUninstallOfAppWithIdentity:clientName:withFlags:record:completion:]_block_invoke", 342, @"IXErrorDomain", 0x18uLL, 0, 0, @"Client %@ requested uninstall for %@", v2, *(void *)(a1 + 48));
    [v3 cancelForReason:v4 client:15 error:0];
  }
  id v5 = +[NSString stringWithFormat:@"Uninstalling %@ for %@ (flags: 0x%lx)", *(void *)(a1 + 40), *(void *)(a1 + 48), *(void *)(a1 + 88)];
  uint64_t v6 = (*(void *)(a1 + 88) >> 4) & 1;
  CFStringRef v64 = @"WaitForStorageDeletion";
  id v7 = +[NSNumber numberWithBool:v6];
  v65 = v7;
  uint64_t v8 = +[NSDictionary dictionaryWithObjects:&v65 forKeys:&v64 count:1];
  id v9 = +[NSMutableDictionary dictionaryWithDictionary:v8];

  if ((*(unsigned char *)(a1 + 88) & 0x40) != 0) {
    [v9 setObject:@"UninstallReasonSystemAppNotAllowed" forKeyedSubscript:@"UninstallReason"];
  }
  if ([*(id *)(a1 + 64) isDeletableSystemApplication])
  {
    id v10 = [*(id *)(a1 + 40) bundleID];
    if (qword_100109E48 != -1) {
      dispatch_once(&qword_100109E48, &stru_1000E9620);
    }
    uint64_t v11 = [v10 stringByAppendingString:@".appremoval"];
    uint64_t v53 = [v11 stringByAppendingString:@".xpc"];
    int v12 = objc_msgSend(@"/System/Library/AppRemovalServices/", "stringByAppendingPathComponent:");
    id v13 = +[NSURL fileURLWithPath:v12 isDirectory:1];
    char v63 = 0;
    __int16 v14 = +[IXFileManager defaultManager];
    id v62 = 0;
    unsigned __int8 v15 = [v14 itemExistsAtURL:v13 isDirectory:&v63 error:&v62];
    id v52 = v62;

    if (v15)
    {
      if (!v63)
      {
        __int16 v18 = sub_100004B28((uint64_t)off_100109BB8);
        uint64_t v27 = v52;
        if (os_log_type_enabled(v18, OS_LOG_TYPE_FAULT)) {
          sub_10008D0DC();
        }
        goto LABEL_26;
      }
      dispatch_queue_t v51 = v5;
      if (([(id)qword_100109E40 containsObject:v12] & 1) == 0)
      {
        [(id)qword_100109E40 addObject:v12];
        __int16 v16 = sub_100004B28((uint64_t)off_100109BB8);
        if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG)) {
          sub_10008D278();
        }

        [v13 fileSystemRepresentation];
        xpc_add_bundle();
        uint64_t v17 = sub_100004B28((uint64_t)off_100109BB8);
        if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG)) {
          sub_10008D1F8();
        }
      }
      v50 = v9;
      __int16 v18 = [objc_alloc((Class)NSXPCConnection) initWithServiceName:v11];
      uint64_t v19 = _LSAppRemovalServiceXPCInterface();
      [v18 setRemoteObjectInterface:v19];

      [v18 resume];
      dispatch_semaphore_t v20 = dispatch_semaphore_create(0);
      *(void *)buf = _NSConcreteStackBlock;
      *(void *)&buf[8] = 3221225472;
      *(void *)&buf[16] = sub_10001BF6C;
      id v67 = &unk_1000E9648;
      id v49 = v11;
      *(void *)&long long v68 = v49;
      id v21 = v20;
      *((void *)&v68 + 1) = v21;
      id v22 = [v18 remoteObjectProxyWithErrorHandler:buf];
      v60[0] = _NSConcreteStackBlock;
      v60[1] = 3221225472;
      v60[2] = sub_10001BFE4;
      v60[3] = &unk_1000E9670;
      id v23 = v21;
      long long v61 = v23;
      [v22 removeAppWithReply:v60];

      dispatch_time_t v24 = dispatch_time(0, 15000000000);
      id v5 = v51;
      if (dispatch_semaphore_wait(v23, v24))
      {
        id v25 = sub_100004B28((uint64_t)off_100109BB8);
        if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR)) {
          sub_10008D150((uint64_t)v49, (uint64_t)v12, v25);
        }

        sub_100013BB0(@"IXErrorDomain", @"UninstallError", @"UninstallErrorXPCRemovalTimeout", v49);
      }
      unsigned __int8 v26 = [v18 _xpcConnection];
      xpc_connection_kill();

      [v18 invalidate];
      id v9 = v50;
    }
    else
    {
      __int16 v18 = sub_100004B28((uint64_t)off_100109BB8);
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315650;
        *(void *)&uint8_t buf[4] = "_InvokeSystemAppRemovalXPCService";
        *(_WORD *)&buf[12] = 2112;
        *(void *)&buf[14] = v12;
        *(_WORD *)&buf[22] = 2112;
        uint64_t v27 = v52;
        id v67 = v52;
        _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "%s: App deletion service does not exist at %@ : %@", buf, 0x20u);
LABEL_26:

        goto LABEL_27;
      }
    }
    uint64_t v27 = v52;
    goto LABEL_26;
  }
LABEL_27:
  id v28 = *(void **)(a1 + 72);
  uint64_t v29 = *(void *)(a1 + 40);
  id v59 = 0;
  long long v30 = [v28 _acquireTerminationAssertionForIdentity:v29 withError:&v59];
  id v31 = v59;
  if (v30)
  {
    id v32 = *(void **)(a1 + 40);
    id v58 = v31;
    int v33 = sub_1000136C0(v32, v9, v5);
    id v34 = v31;

    [v30 invalidate];
    if (v33)
    {
      if ((*(unsigned char *)(a1 + 88) & 2) != 0)
      {
        v54[0] = _NSConcreteStackBlock;
        v54[1] = 3221225472;
        v54[2] = sub_100018FBC;
        v54[3] = &unk_1000E9408;
        v54[4] = *(void *)(a1 + 72);
        id v35 = *(id *)(a1 + 40);
        uint64_t v36 = *(void *)(a1 + 88);
        id v55 = v35;
        uint64_t v57 = v36;
        id v56 = *(id *)(a1 + 64);
        sub_100066F24(&_dispatch_main_q, v54);
      }
      id v37 = sub_100004B28((uint64_t)off_100109BB8);
      if (os_log_type_enabled(v37, OS_LOG_TYPE_DEFAULT))
      {
        id v38 = sub_10003B9E4(3uLL);
        id v39 = *(void **)(a1 + 56);
        *(_DWORD *)buf = 136315650;
        *(void *)&uint8_t buf[4] = "-[IXSAppUninstaller _performUninstallOfAppWithIdentity:clientName:withFlags:record:completi"
                             "on:]_block_invoke";
        *(_WORD *)&buf[12] = 2112;
        *(void *)&buf[14] = v38;
        *(_WORD *)&buf[22] = 2112;
        id v67 = v39;
        _os_log_impl((void *)&_mh_execute_header, v37, OS_LOG_TYPE_DEFAULT, "%s: Uninstall succeeded with disposition:%@ for bundleID:%@", buf, 0x20u);
      }
      uint64_t v40 = *(void *)(a1 + 80);
      if (!v40) {
        goto LABEL_46;
      }
      __int16 v41 = *(void (**)(void))(v40 + 16);
    }
    else
    {
      if (!v34)
      {
        __int16 v43 = sub_100004B28((uint64_t)off_100109BB8);
        if (os_log_type_enabled(v43, OS_LOG_TYPE_ERROR)) {
          sub_10008D064();
        }

        sub_10003DAE4((uint64_t)"-[IXSAppUninstaller _performUninstallOfAppWithIdentity:clientName:withFlags:record:completion:]_block_invoke", 389, @"IXErrorDomain", 0xEuLL, 0, 0, @"-[LSApplicationWorkspace uninstallApplication:] for %@ returned NO but did not set an error.", v44, *(void *)(a1 + 56));
        id v34 = (id)objc_claimAutoreleasedReturnValue();
      }
      __int16 v45 = sub_100004B28((uint64_t)off_100109BB8);
      if (os_log_type_enabled(v45, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v46 = sub_10003B9E4(0);
        uint64_t v47 = *(void **)(a1 + 56);
        *(_DWORD *)buf = 136315906;
        *(void *)&uint8_t buf[4] = "-[IXSAppUninstaller _performUninstallOfAppWithIdentity:clientName:withFlags:record:completi"
                             "on:]_block_invoke";
        *(_WORD *)&buf[12] = 2112;
        *(void *)&buf[14] = v46;
        *(_WORD *)&buf[22] = 2112;
        id v67 = v47;
        LOWORD(v68) = 2112;
        *(void *)((char *)&v68 + 2) = v34;
        _os_log_impl((void *)&_mh_execute_header, v45, OS_LOG_TYPE_DEFAULT, "%s: Uninstall failed with disposition:%@ for bundleID:%@ with error:%@", buf, 0x2Au);
      }
      uint64_t v48 = *(void *)(a1 + 80);
      if (!v48) {
        goto LABEL_46;
      }
      __int16 v41 = *(void (**)(void))(v48 + 16);
    }
    v41();
LABEL_46:
    id v31 = v34;
    goto LABEL_47;
  }
  uint64_t v42 = *(void *)(a1 + 80);
  if (v42) {
    (*(void (**)(uint64_t, void, id))(v42 + 16))(v42, 0, v31);
  }
LABEL_47:
}

id sub_100018FBC(uint64_t a1)
{
  return [*(id *)(a1 + 32) _postUninstallAlertsWithIdentity:*(void *)(a1 + 40) flags:*(void *)(a1 + 56) record:*(void *)(a1 + 48)];
}

void sub_1000191FC(uint64_t a1, unint64_t a2, void *a3)
{
  id v5 = a3;
  if (a2 == 3)
  {
    [*(id *)(a1 + 48) _promptForDeletionWithRecord:*(void *)(a1 + 56) identity:*(void *)(a1 + 40) clientName:*(void *)(a1 + 64) flags:*(void *)(a1 + 80) completion:*(void *)(a1 + 72) removability:*(void *)(a1 + 88)];
  }
  else if (*(void *)(a1 + 72))
  {
    uint64_t v6 = sub_100004B28((uint64_t)off_100109BB8);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      id v7 = sub_10003B9E4(a2);
      uint64_t v8 = (objc_class *)objc_opt_class();
      id v9 = NSStringFromClass(v8);
      uint64_t v10 = *(void *)(a1 + 40);
      int v11 = 136315906;
      int v12 = "-[IXSAppUninstaller _promptForMoveOrDeleteAppRecord:identity:clientName:flags:completion:removability:]_block_invoke";
      __int16 v13 = 2112;
      __int16 v14 = v7;
      __int16 v15 = 2112;
      __int16 v16 = v9;
      __int16 v17 = 2112;
      uint64_t v18 = v10;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "%s: Received disposition %@ from %@ for identity:%@", (uint8_t *)&v11, 0x2Au);
    }
    (*(void (**)(void))(*(void *)(a1 + 72) + 16))();
  }
}

void sub_1000195B4(uint64_t a1, int a2, void *a3)
{
  id v8 = a3;
  id v5 = *(void **)(a1 + 32);
  if (a2)
  {
    [*(id *)(a1 + 32) _promptForMoveOrDeleteAppRecord:*(void *)(a1 + 40) identity:*(void *)(a1 + 48) clientName:*(void *)(a1 + 56) flags:*(void *)(a1 + 72) completion:*(void *)(a1 + 64) removability:*(void *)(a1 + 80)];
  }
  else
  {
    uint64_t v6 = [*(id *)(a1 + 40) localizedName];
    [v5 _displayAuthenticationErrorForApp:v6];

    uint64_t v7 = *(void *)(a1 + 64);
    if (v7) {
      (*(void (**)(uint64_t, void, id))(v7 + 16))(v7, 0, v8);
    }
  }
}

void sub_100019710(id a1)
{
  if (dlopen("/System/Library/PrivateFrameworks/ScreenTimeCore.framework/ScreenTimeCore", 1))
  {
    qword_100109E20 = (uint64_t)NSClassFromString(@"STManagementState");
    if (qword_100109E20) {
      return;
    }
    id v1 = sub_100004B28((uint64_t)off_100109BB8);
    if (os_log_type_enabled(v1, OS_LOG_TYPE_FAULT)) {
      sub_10008D4DC();
    }
  }
  else
  {
    dlerror();
    id v1 = sub_100004B28((uint64_t)off_100109BB8);
    if (os_log_type_enabled(v1, OS_LOG_TYPE_FAULT)) {
      sub_10008D468();
    }
  }
}

void sub_100019874(id a1)
{
  if (dlopen("/System/Library/PrivateFrameworks/WebBookmarks.framework/WebBookmarks", 1))
  {
    qword_100109E30 = (uint64_t)NSClassFromString(@"WBWebFilterSettings");
    if (qword_100109E30) {
      return;
    }
    id v1 = sub_100004B28((uint64_t)off_100109BB8);
    if (os_log_type_enabled(v1, OS_LOG_TYPE_FAULT)) {
      sub_10008D654();
    }
  }
  else
  {
    dlerror();
    id v1 = sub_100004B28((uint64_t)off_100109BB8);
    if (os_log_type_enabled(v1, OS_LOG_TYPE_FAULT)) {
      sub_10008D5E0();
    }
  }
}

void sub_100019DE8(uint64_t a1, unint64_t a2, void *a3)
{
  if (*(void *)(a1 + 48))
  {
    id v5 = off_100109BB8;
    id v6 = a3;
    uint64_t v7 = sub_100004B28((uint64_t)v5);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      id v8 = sub_10003B9E4(a2);
      id v9 = (objc_class *)objc_opt_class();
      uint64_t v10 = NSStringFromClass(v9);
      uint64_t v11 = *(void *)(a1 + 40);
      int v12 = 136315906;
      __int16 v13 = "-[IXSAppUninstaller _finalDeletionPromptWithRecord:identity:clientName:flags:removability:completion:]_block_invoke";
      __int16 v14 = 2112;
      __int16 v15 = v8;
      __int16 v16 = 2112;
      __int16 v17 = v10;
      __int16 v18 = 2112;
      uint64_t v19 = v11;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "%s: Received disposition %@ from %@ for %@", (uint8_t *)&v12, 0x2Au);
    }
    (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  }
}

void sub_100019F30(uint64_t a1, unint64_t a2, void *a3)
{
  id v5 = a3;
  if (a2 == 3)
  {
    id v6 = *(void **)(a1 + 32);
    uint64_t v7 = *(void *)(a1 + 40);
    uint64_t v8 = *(void *)(a1 + 48);
    uint64_t v9 = *(void *)(a1 + 56);
    uint64_t v11 = *(void *)(a1 + 72);
    uint64_t v10 = *(void *)(a1 + 80);
    if (*(unsigned char *)(a1 + 88)) {
      [v6 _promptToOverrideManagedSettingsOfAppWithRecord:v7 identity:v8 clientName:v9 flags:v10 completion:v11];
    }
    else {
      [v6 _promptForRelatedDataAndUninstallAppWithRecord:v7 identity:v8 clientName:v9 flags:v10 completion:v11];
    }
  }
  else if (*(void *)(a1 + 72))
  {
    int v12 = sub_100004B28((uint64_t)off_100109BB8);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      __int16 v13 = sub_10003B9E4(a2);
      __int16 v14 = (objc_class *)objc_opt_class();
      __int16 v15 = NSStringFromClass(v14);
      uint64_t v16 = *(void *)(a1 + 48);
      int v17 = 136315906;
      __int16 v18 = "-[IXSAppUninstaller _finalDeletionPromptWithRecord:identity:clientName:flags:removability:completion:]_block_invoke";
      __int16 v19 = 2112;
      dispatch_semaphore_t v20 = v13;
      __int16 v21 = 2112;
      id v22 = v15;
      __int16 v23 = 2112;
      uint64_t v24 = v16;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "%s: Received disposition %@ from %@ for %@", (uint8_t *)&v17, 0x2Au);
    }
    (*(void (**)(void))(*(void *)(a1 + 72) + 16))();
  }
}

void sub_10001A4B0(uint64_t a1, unint64_t a2, void *a3)
{
  id v5 = a3;
  if (a2 == 4) {
    [*(id *)(a1 + 32) openSettingsWithBundleID:*(void *)(a1 + 40)];
  }
  if (*(void *)(a1 + 56))
  {
    id v6 = sub_100004B28((uint64_t)off_100109BB8);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v7 = sub_10003B9E4(a2);
      uint64_t v8 = (objc_class *)objc_opt_class();
      uint64_t v9 = NSStringFromClass(v8);
      uint64_t v10 = *(void *)(a1 + 48);
      int v11 = 136315906;
      int v12 = "-[IXSAppUninstaller _promptForGatingDefaultAppDeletionWithRecord:identity:clientName:flags:removability:comp"
            "letion:]_block_invoke";
      __int16 v13 = 2112;
      __int16 v14 = v7;
      __int16 v15 = 2112;
      uint64_t v16 = v9;
      __int16 v17 = 2112;
      uint64_t v18 = v10;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "%s: Received disposition %@ from %@ for %@", (uint8_t *)&v11, 0x2Au);
    }
    (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
  }
}

void sub_10001A604(uint64_t a1, unint64_t a2, void *a3)
{
  id v5 = a3;
  if (a2 == 3)
  {
    [*(id *)(a1 + 32) _promptForRelatedDataAndUninstallAppWithRecord:*(void *)(a1 + 40) identity:*(void *)(a1 + 48) clientName:*(void *)(a1 + 56) flags:*(void *)(a1 + 80) completion:*(void *)(a1 + 72)];
  }
  else if (*(void *)(a1 + 72))
  {
    id v6 = sub_100004B28((uint64_t)off_100109BB8);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v7 = sub_10003B9E4(a2);
      uint64_t v8 = (objc_class *)objc_opt_class();
      uint64_t v9 = NSStringFromClass(v8);
      uint64_t v10 = *(void *)(a1 + 48);
      int v11 = 136315906;
      int v12 = "-[IXSAppUninstaller _promptForGatingDefaultAppDeletionWithRecord:identity:clientName:flags:removability:comp"
            "letion:]_block_invoke";
      __int16 v13 = 2112;
      __int16 v14 = v7;
      __int16 v15 = 2112;
      uint64_t v16 = v9;
      __int16 v17 = 2112;
      uint64_t v18 = v10;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "%s: Received disposition %@ from %@ for %@", (uint8_t *)&v11, 0x2Au);
    }
    (*(void (**)(void))(*(void *)(a1 + 72) + 16))();
  }
}

void sub_10001A764(void *a1, unint64_t a2, void *a3)
{
  id v5 = a3;
  if (a2 == 4)
  {
    id v6 = (void *)a1[4];
    id v18 = 0;
    unsigned __int8 v7 = [v6 openDefaultAppStoreWithError:&v18];
    id v8 = v18;
    if ((v7 & 1) == 0)
    {
      uint64_t v9 = sub_100004B28((uint64_t)off_100109BB8);
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
        sub_10008D748();
      }

      uint64_t v11 = sub_10003DAE4((uint64_t)"-[IXSAppUninstaller _promptForGatingDefaultAppDeletionWithRecord:identity:clientName:flags:removability:completion:]_block_invoke", 689, @"IXErrorDomain", 1uLL, v8, 0, @"Failed to open default app marketplace", v10, v17);

      id v5 = (id)v11;
    }
  }
  if (a1[6])
  {
    int v12 = sub_100004B28((uint64_t)off_100109BB8);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      __int16 v13 = sub_10003B9E4(a2);
      __int16 v14 = (objc_class *)objc_opt_class();
      __int16 v15 = NSStringFromClass(v14);
      uint64_t v16 = a1[5];
      *(_DWORD *)buf = 136315906;
      dispatch_semaphore_t v20 = "-[IXSAppUninstaller _promptForGatingDefaultAppDeletionWithRecord:identity:clientName:flags:removability:comp"
            "letion:]_block_invoke";
      __int16 v21 = 2112;
      id v22 = v13;
      __int16 v23 = 2112;
      uint64_t v24 = v15;
      __int16 v25 = 2112;
      uint64_t v26 = v16;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "%s: Received disposition %@ from %@ for %@", buf, 0x2Au);
    }
    (*(void (**)(void))(a1[6] + 16))();
  }
}

void sub_10001AB84(uint64_t a1, uint64_t a2, void *a3)
{
  id v5 = a3;
  if ((unint64_t)(a2 - 3) < 2 || a2 == 2)
  {
LABEL_9:
    (*(void (**)(void))(*(void *)(a1 + 64) + 16))();
    goto LABEL_10;
  }
  if (a2 != 1)
  {
    id v6 = sub_100004B28((uint64_t)off_100109BB8);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      sub_10008D870();
    }

    uint64_t v8 = sub_10003DAE4((uint64_t)"-[IXSAppUninstaller _promptForDeletionWithRecord:identity:clientName:flags:completion:removability:]_block_invoke", 744, @"IXErrorDomain", 1uLL, v5, 0, @"Failed to identify sheet disposition from user response", v7, v9);

    id v5 = (id)v8;
    goto LABEL_9;
  }
  [*(id *)(a1 + 32) _promptForGatingDefaultAppDeletionWithRecord:*(void *)(a1 + 40) identity:*(void *)(a1 + 48) clientName:*(void *)(a1 + 56) flags:*(void *)(a1 + 72) removability:*(void *)(a1 + 80) completion:*(void *)(a1 + 64)];
LABEL_10:
}

void sub_10001AD24(uint64_t a1)
{
  SInt32 error = 0;
  uint64_t v2 = sub_100031064();
  v15[0] = kCFUserNotificationAlertHeaderKey;
  id v3 = [v2 localizedStringForKey:@"COULD_NOT_AUTHENTICATE" value:&stru_1000ED390 table:@"IXUninstallAlert"];
  uint64_t v4 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", v3, *(void *)(a1 + 32));
  v16[0] = v4;
  v15[1] = kCFUserNotificationAlertMessageKey;
  id v5 = [v2 localizedStringForKey:@"AUTHENTICATE_TO_DELETE_APP_MESSAGE" value:&stru_1000ED390 table:@"IXUninstallAlert"];
  v16[1] = v5;
  v16[2] = &__kCFBooleanTrue;
  v15[2] = SBUserNotificationAllowMenuButtonDismissal;
  v15[3] = SBUserNotificationDismissOnLock;
  v16[3] = &__kCFBooleanTrue;
  CFDictionaryRef v6 = +[NSDictionary dictionaryWithObjects:v16 forKeys:v15 count:4];

  CFUserNotificationCreate(kCFAllocatorDefault, 0.0, 3uLL, &error, v6);
  uint64_t v7 = sub_100004B28((uint64_t)off_100109BB8);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v8 = (objc_class *)objc_opt_class();
    uint64_t v9 = NSStringFromClass(v8);
    *(_DWORD *)buf = 136315394;
    int v12 = "-[IXSAppUninstaller _displayAuthenticationErrorForApp:]_block_invoke";
    __int16 v13 = 2112;
    __int16 v14 = v9;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "%s: Showing user alert of type:%@", buf, 0x16u);
  }
}

void sub_10001B1FC(uint64_t a1, void *a2, void *a3)
{
  id v5 = a3;
  if (v5)
  {
    CFDictionaryRef v6 = sub_100004B28((uint64_t)off_100109BB8);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      sub_10008DA44();
    }

    sub_10003DAE4((uint64_t)"-[IXSAppUninstaller _promptToOverrideManagedSettingsOfAppWithRecord:identity:clientName:flags:completion:]_block_invoke", 788, @"IXErrorDomain", 1uLL, v5, 0, @"Request to override unremovability failed for app with bundle ID %@", v7, *(void *)(a1 + 32));
    goto LABEL_17;
  }
  id v8 = [a2 integerValue];
  if (!v8)
  {
    uint64_t v11 = sub_100004B28((uint64_t)off_100109BB8);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      sub_10008D9D0();
    }

    uint64_t v17 = *(void *)(a1 + 32);
    __int16 v13 = @"Request to override unremovability denied for app with bundle ID %@";
    uint64_t v14 = 797;
    goto LABEL_16;
  }
  if (v8 != (id)1)
  {
    __int16 v15 = sub_100004B28((uint64_t)off_100109BB8);
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
      sub_10008D95C();
    }

    uint64_t v17 = *(void *)(a1 + 32);
    __int16 v13 = @"Unknown override response received from ManagedSettings for app with bundle ID %@";
    uint64_t v14 = 801;
LABEL_16:
    sub_10003DAE4((uint64_t)"-[IXSAppUninstaller _promptToOverrideManagedSettingsOfAppWithRecord:identity:clientName:flags:completion:]_block_invoke", v14, @"IXErrorDomain", 1uLL, 0, 0, v13, v12, v17);
    uint64_t v16 = LABEL_17:;
    (*(void (**)(void))(*(void *)(a1 + 72) + 16))();

    goto LABEL_18;
  }
  uint64_t v9 = sub_100004B28((uint64_t)off_100109BB8);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v10 = *(void *)(a1 + 32);
    *(_DWORD *)buf = 136315394;
    __int16 v19 = "-[IXSAppUninstaller _promptToOverrideManagedSettingsOfAppWithRecord:identity:clientName:flags:completion:]_block_invoke";
    __int16 v20 = 2112;
    uint64_t v21 = v10;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "%s: Request to override unremovability approved for app with bundle ID %@", buf, 0x16u);
  }

  [*(id *)(a1 + 40) _promptForRelatedDataAndUninstallAppWithRecord:*(void *)(a1 + 48) identity:*(void *)(a1 + 56) clientName:*(void *)(a1 + 64) flags:*(void *)(a1 + 80) completion:*(void *)(a1 + 72)];
LABEL_18:
}

uint64_t sub_10001BE18(uint64_t a1, uint64_t a2, void *a3)
{
  id v11 = a3;
  id v5 = +[IXSRemoteDeletionPromptManager sharedInstance];
  CFDictionaryRef v6 = [*(id *)(a1 + 32) bundleID];
  if (![v5 isValidBundleIDForRemoteAlert:v6 withAppType:0 numAppsInstalled:0]
    || *(void *)(a1 + 48) != 1)
  {

    goto LABEL_6;
  }
  uint64_t v7 = *(void *)(a1 + 56);

  if ((v7 & 0x400) == 0)
  {
    id v5 = +[IXSRemoteDeletionPromptManager sharedInstance];
    [v5 dismissRemoteAlert];
LABEL_6:
  }
  if (a2 == 3 && !v11)
  {
    id v8 = sub_10003D008();
    [v8 identityWasUninstalled:*(void *)(a1 + 32)];
  }
  uint64_t v9 = *(void *)(a1 + 40);
  if (v9) {
    (*(void (**)(uint64_t, uint64_t, id))(v9 + 16))(v9, a2, v11);
  }

  return _objc_release_x1();
}

void sub_10001BF30(id a1)
{
  qword_100109E40 = (uint64_t)objc_alloc_init((Class)NSMutableSet);

  _objc_release_x1();
}

void sub_10001BF6C(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = sub_100004B28((uint64_t)off_100109BB8);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    sub_10008DBA8();
  }

  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 40));
}

void sub_10001BFE4(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (v3)
  {
    uint64_t v4 = sub_100004B28((uint64_t)off_100109BB8);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      sub_10008DC24();
    }
  }
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

void sub_10001C078(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 0x20u);
}

void sub_10001C0B0(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, a5, 0x20u);
}

void sub_10001C0C8(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_fault_impl(a1, a2, OS_LOG_TYPE_FAULT, a4, &a9, 0x16u);
}

void sub_10001C128(uint64_t a1@<X8>)
{
  *(void *)(v1 - 8) = a1;
}

void sub_10001E074(_Unwind_Exception *a1)
{
}

uint64_t sub_10001E110(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void sub_10001E120(uint64_t a1)
{
}

void sub_10001E128(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 40);
  id v3 = *(void **)(*(void *)(a1 + 32) + 192);
  id v9 = 0;
  unsigned int v4 = [v3 awakeFromSerializationWithLookupBlock:v2 error:&v9];
  id v5 = v9;
  id v6 = v9;
  if (v4)
  {
    objc_msgSend(*(id *)(*(void *)(a1 + 32) + 192), "setDelegate:");
  }
  else
  {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40), v5);
    [*(id *)(a1 + 32) setIconPromiseUUID:0];
    uint64_t v7 = *(void *)(a1 + 32);
    id v8 = *(void **)(v7 + 192);
    *(void *)(v7 + 192) = 0;
  }
}

void sub_10001E1D4(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 40);
  id v3 = *(void **)(*(void *)(a1 + 32) + 200);
  id v9 = 0;
  unsigned int v4 = [v3 awakeFromSerializationWithLookupBlock:v2 error:&v9];
  id v5 = v9;
  id v6 = v9;
  if (v4)
  {
    objc_msgSend(*(id *)(*(void *)(a1 + 32) + 200), "setDelegate:");
  }
  else
  {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40), v5);
    [*(id *)(a1 + 32) setIconResourcesPromiseUUID:0];
    uint64_t v7 = *(void *)(a1 + 32);
    id v8 = *(void **)(v7 + 200);
    *(void *)(v7 + 200) = 0;
  }
}

void sub_10001E280(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 40);
  id v3 = *(void **)(*(void *)(a1 + 32) + 208);
  id v9 = 0;
  unsigned int v4 = [v3 awakeFromSerializationWithLookupBlock:v2 error:&v9];
  id v5 = v9;
  id v6 = v9;
  if (v4)
  {
    objc_msgSend(*(id *)(*(void *)(a1 + 32) + 208), "setDelegate:");
  }
  else
  {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40), v5);
    [*(id *)(a1 + 32) setInfoPlistIconContentPromiseUUID:0];
    uint64_t v7 = *(void *)(a1 + 32);
    id v8 = *(void **)(v7 + 208);
    *(void *)(v7 + 20_Block_object_dispose(&STACK[0x2B0], 8) = 0;
  }
}

void sub_10001E32C(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 40);
  id v3 = *(void **)(*(void *)(a1 + 32) + 216);
  id v9 = 0;
  unsigned int v4 = [v3 awakeFromSerializationWithLookupBlock:v2 error:&v9];
  id v5 = v9;
  id v6 = v9;
  if (v4)
  {
    objc_msgSend(*(id *)(*(void *)(a1 + 32) + 216), "setDelegate:");
  }
  else
  {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40), v5);
    [*(id *)(a1 + 32) setEntitlementsPromiseUUID:0];
    uint64_t v7 = *(void *)(a1 + 32);
    id v8 = *(void **)(v7 + 216);
    *(void *)(v7 + 216) = 0;
  }
}

void sub_10001E3D8(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 40);
  id v3 = *(void **)(*(void *)(a1 + 32) + 224);
  id v9 = 0;
  unsigned int v4 = [v3 awakeFromSerializationWithLookupBlock:v2 error:&v9];
  id v5 = v9;
  id v6 = v9;
  if (v4)
  {
    objc_msgSend(*(id *)(*(void *)(a1 + 32) + 224), "setDelegate:");
  }
  else
  {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40), v5);
    [*(id *)(a1 + 32) setInfoPlistLoctablePromiseUUID:0];
    uint64_t v7 = *(void *)(a1 + 32);
    id v8 = *(void **)(v7 + 224);
    *(void *)(v7 + 224) = 0;
  }
}

void sub_10001E484(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 40);
  id v3 = *(void **)(*(void *)(a1 + 32) + 248);
  id v9 = 0;
  unsigned int v4 = [v3 awakeFromSerializationWithLookupBlock:v2 error:&v9];
  id v5 = v9;
  id v6 = v9;
  if (v4)
  {
    objc_msgSend(*(id *)(*(void *)(a1 + 32) + 248), "setDelegate:");
  }
  else
  {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40), v5);
    [*(id *)(a1 + 32) setMetadataPromiseUUID:0];
    uint64_t v7 = *(void *)(a1 + 32);
    id v8 = *(void **)(v7 + 248);
    *(void *)(v7 + 24_Block_object_dispose(&STACK[0x2B0], 8) = 0;
  }
}

void sub_10001E530(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 40);
  id v3 = *(void **)(*(void *)(a1 + 32) + 256);
  id v9 = 0;
  unsigned int v4 = [v3 awakeFromSerializationWithLookupBlock:v2 error:&v9];
  id v5 = v9;
  id v6 = v9;
  if (v4)
  {
    objc_msgSend(*(id *)(*(void *)(a1 + 32) + 256), "setDelegate:");
  }
  else
  {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40), v5);
    [*(id *)(a1 + 32) setSinfPromiseUUID:0];
    uint64_t v7 = *(void *)(a1 + 32);
    id v8 = *(void **)(v7 + 256);
    *(void *)(v7 + 256) = 0;
  }
}

void sub_10001E5DC(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 40);
  id v3 = *(void **)(*(void *)(a1 + 32) + 264);
  id v9 = 0;
  unsigned int v4 = [v3 awakeFromSerializationWithLookupBlock:v2 error:&v9];
  id v5 = v9;
  id v6 = v9;
  if (v4)
  {
    objc_msgSend(*(id *)(*(void *)(a1 + 32) + 264), "setDelegate:");
  }
  else
  {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40), v5);
    [*(id *)(a1 + 32) setLocalizationDictionaryPromiseUUID:0];
    uint64_t v7 = *(void *)(a1 + 32);
    id v8 = *(void **)(v7 + 264);
    *(void *)(v7 + 264) = 0;
  }
}

void sub_10001E688(uint64_t a1)
{
  uint64_t v2 = *(void **)(a1 + 32);
  uint64_t v3 = *(void *)(a1 + 64);
  id v7 = 0;
  unsigned int v4 = [v2 awakeFromSerializationWithLookupBlock:v3 error:&v7];
  id v5 = v7;
  id v6 = v7;
  if (v4)
  {
    [*(id *)(a1 + 32) setDelegate:*(void *)(a1 + 40)];
  }
  else
  {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 72) + 8) + 40), v5);
    [*(id *)(a1 + 48) addObject:*(void *)(a1 + 56)];
  }
}

id sub_10001E940(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 192) decommission];
}

id sub_10001E954(uint64_t a1)
{
  [*(id *)(a1 + 32) setStagedPathMayNotExistWhenAwakening:1];
  uint64_t v2 = *(void **)(a1 + 32);
  uint64_t v3 = *(void *)(a1 + 40);

  return [v2 setDelegate:v3];
}

id sub_10001EBB8(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 200) decommission];
}

id sub_10001EBCC(uint64_t a1)
{
  [*(id *)(a1 + 32) setStagedPathMayNotExistWhenAwakening:1];
  uint64_t v2 = *(void **)(a1 + 32);
  uint64_t v3 = *(void *)(a1 + 40);

  return [v2 setDelegate:v3];
}

id sub_10001EE30(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 208) decommission];
}

id sub_10001EE44(uint64_t a1)
{
  [*(id *)(a1 + 32) setStagedPathMayNotExistWhenAwakening:1];
  uint64_t v2 = *(void **)(a1 + 32);
  uint64_t v3 = *(void *)(a1 + 40);

  return [v2 setDelegate:v3];
}

id sub_10001F140(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 248) supersede];
}

id sub_10001F154(uint64_t a1)
{
  [*(id *)(a1 + 32) setStagedPathMayNotExistWhenAwakening:1];
  uint64_t v2 = *(void **)(a1 + 32);
  uint64_t v3 = *(void *)(a1 + 40);

  return [v2 setDelegate:v3];
}

id sub_10001F3C0(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 256) supersede];
}

id sub_10001F3D4(uint64_t a1)
{
  [*(id *)(a1 + 32) setStagedPathMayNotExistWhenAwakening:1];
  uint64_t v2 = *(void **)(a1 + 32);
  uint64_t v3 = *(void *)(a1 + 40);

  return [v2 setDelegate:v3];
}

id sub_10001F640(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 264) supersede];
}

id sub_10001F654(uint64_t a1)
{
  [*(id *)(a1 + 32) setStagedPathMayNotExistWhenAwakening:1];
  uint64_t v2 = *(void **)(a1 + 32);
  uint64_t v3 = *(void *)(a1 + 40);

  return [v2 setDelegate:v3];
}

id sub_10001F8C8(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 216) decommission];
}

id sub_10001F8DC(uint64_t a1)
{
  [*(id *)(a1 + 32) setStagedPathMayNotExistWhenAwakening:1];
  uint64_t v2 = *(void **)(a1 + 32);
  uint64_t v3 = *(void *)(a1 + 40);

  return [v2 setDelegate:v3];
}

id sub_10001FB50(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 224) decommission];
}

id sub_10001FB64(uint64_t a1)
{
  [*(id *)(a1 + 32) setStagedPathMayNotExistWhenAwakening:1];
  uint64_t v2 = *(void **)(a1 + 32);
  uint64_t v3 = *(void *)(a1 + 40);

  return [v2 setDelegate:v3];
}

void sub_10001FF68(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) bundleID];
  unsigned __int8 v3 = [v2 hasPrefix:*(void *)(a1 + 40)];

  if (v3)
  {
    unsigned int v4 = *(void **)(a1 + 56);
    id v5 = [*(id *)(a1 + 32) uniqueIdentifier];
    [v4 addObject:v5];

    [*(id *)(a1 + 32) setStagedPathMayNotExistWhenAwakening:1];
    uint64_t v6 = *(void *)(a1 + 48);
    id v7 = *(void **)(a1 + 32);
    [v7 setDelegate:v6];
  }
  else
  {
    id v8 = sub_100004B28((uint64_t)off_100109BB8);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      uint64_t v11 = *(void *)(a1 + 32);
      uint64_t v12 = *(void *)(a1 + 40);
      uint64_t v13 = *(void *)(a1 + 48);
      *(_DWORD *)buf = 136316162;
      __int16 v15 = "-[IXSPlaceholder setAppExtensionPlaceholders:]_block_invoke";
      __int16 v16 = 2112;
      uint64_t v17 = v11;
      __int16 v18 = 2112;
      uint64_t v19 = v12;
      __int16 v20 = 2112;
      uint64_t v21 = v13;
      __int16 v22 = 2112;
      uint64_t v23 = 0;
      _os_log_error_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_ERROR, "%s: Attempted to set placeholder %@ which does not have the required bundle identifier prefix of %@ for parent %@ : %@", buf, 0x34u);
    }

    uint64_t v10 = sub_10003DAE4((uint64_t)"-[IXSPlaceholder setAppExtensionPlaceholders:]_block_invoke", 672, @"IXErrorDomain", 8uLL, 0, 0, @"Attempted to set placeholder %@ which does not have the required bundle identifier prefix of %@ for parent %@", v9, *(void *)(a1 + 32));
    [*(id *)(a1 + 32) cancelForReason:v10 client:15 error:0];
  }
}

id sub_100020150(uint64_t a1)
{
  return [*(id *)(a1 + 32) decommission];
}

void sub_1000206A8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t sub_1000206E0(uint64_t a1)
{
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = [*(id *)(a1 + 32) data];

  return _objc_release_x1();
}

void sub_1000209C0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1000209E8(uint64_t a1)
{
  id v5 = [*(id *)(a1 + 32) sinfPromise];
  uint64_t v2 = [v5 data];
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
  unsigned int v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;
}

void sub_100020C64(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_100020C8C(uint64_t a1)
{
  id v5 = [*(id *)(a1 + 32) localizationDictionaryPromise];
  uint64_t v2 = [v5 dictionary];
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
  unsigned int v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;
}

void sub_100021284(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,uint64_t a48,uint64_t a49,uint64_t a50,uint64_t a51,uint64_t a52,char a53)
{
}

void sub_1000212B4(uint64_t a1)
{
  if ([*(id *)(a1 + 32) isComplete]
    && ([*(id *)(a1 + 32) error], uint64_t v2 = objc_claimAutoreleasedReturnValue(), v2, !v2))
  {
    char v4 = 1;
  }
  else
  {
    uint64_t v3 = sub_100004B28((uint64_t)off_100109BB8);
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG)) {
      sub_10008E304(a1);
    }

    char v4 = 0;
  }
  *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = v4;
}

void sub_100021348(uint64_t a1)
{
  if ([*(id *)(a1 + 32) isComplete]
    && ([*(id *)(a1 + 32) error], uint64_t v2 = objc_claimAutoreleasedReturnValue(), v2, !v2))
  {
    char v4 = 1;
  }
  else
  {
    uint64_t v3 = sub_100004B28((uint64_t)off_100109BB8);
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG)) {
      sub_10008E398(a1);
    }

    char v4 = 0;
  }
  *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = v4;
}

void sub_1000213DC(uint64_t a1)
{
  uint64_t v2 = (id *)(a1 + 32);
  uint64_t v3 = [*(id *)(a1 + 32) entitlements];
  unsigned __int8 v4 = [v3 isComplete];

  if (v4)
  {
    char v5 = 1;
  }
  else
  {
    uint64_t v6 = sub_100004B28((uint64_t)off_100109BB8);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG)) {
      sub_10008E42C(v2);
    }

    char v5 = 0;
  }
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = v5;
}

void sub_100021478(uint64_t a1)
{
  uint64_t v2 = (id *)(a1 + 32);
  uint64_t v3 = [*(id *)(a1 + 32) infoPlistLoctable];
  unsigned __int8 v4 = [v3 isComplete];

  if (v4)
  {
    char v5 = 1;
  }
  else
  {
    uint64_t v6 = sub_100004B28((uint64_t)off_100109BB8);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG)) {
      sub_10008E4C0(v2);
    }

    char v5 = 0;
  }
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = v5;
}

void sub_100021514(uint64_t a1)
{
  if ([*(id *)(a1 + 32) isComplete])
  {
    char v2 = 1;
  }
  else
  {
    uint64_t v3 = sub_100004B28((uint64_t)off_100109BB8);
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG)) {
      sub_10008E554();
    }

    char v2 = 0;
  }
  *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = v2;
}

id sub_1000216B4(uint64_t a1)
{
  return [*(id *)(a1 + 32) promiseDidComplete:*(void *)(a1 + 40)];
}

void sub_100021B80(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,char a43)
{
}

double sub_100021BC0(uint64_t a1)
{
  [*(id *)(a1 + 32) percentComplete];
  double result = v2 * 0.300000012;
  *(double *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = result;
  return result;
}

void sub_100021C00(uint64_t a1)
{
  id v3 = [*(id *)(a1 + 32) entitlements];
  [v3 percentComplete];
  *(double *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = v2 * 0.200000003;
}

double sub_100021C68(uint64_t a1)
{
  [*(id *)(a1 + 32) percentComplete];
  *(double *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = v2
                                                              + *(double *)(*(void *)(*(void *)(a1 + 40) + 8)
                                                                          + 24);
  uint64_t v3 = *(void *)(*(void *)(a1 + 48) + 8);
  double result = *(double *)(v3 + 24) + 1.0;
  *(double *)(v3 + 24) = result;
  return result;
}

void sub_100021DD0(uint64_t a1)
{
  [*(id *)(a1 + 32) setDelegate:0];
  double v2 = [*(id *)(a1 + 32) error];

  if (!v2)
  {
    uint64_t v3 = *(void **)(a1 + 32);
    uint64_t v4 = *(void *)(a1 + 40);
    uint64_t v5 = *(void *)(a1 + 48);
    [v3 cancelForReason:v4 client:v5 error:0];
  }
}

void sub_100022504(void *a1, uint64_t a2)
{
  id v3 = a1;
  uint64_t v4 = v3;
  if (v3)
  {
    uint64_t v5 = [v3 accessQueue];
    v6[0] = _NSConcreteStackBlock;
    v6[1] = 3221225472;
    v6[2] = sub_100029D6C;
    v6[3] = &unk_1000E8D28;
    uint64_t v8 = a2;
    id v7 = v4;
    dispatch_sync(v5, v6);
  }
}

void sub_100022700(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_100022718(uint64_t a1)
{
  id v6 = [*(id *)(a1 + 32) subPromiseUUIDs];
  double v2 = [*(id *)(a1 + 32) uniqueIdentifier];
  uint64_t v3 = [v6 setByAddingObject:v2];
  uint64_t v4 = *(void *)(*(void *)(a1 + 40) + 8);
  uint64_t v5 = *(void **)(v4 + 40);
  *(void *)(v4 + 40) = v3;
}

id sub_100022B7C(uint64_t a1)
{
  return [*(id *)(a1 + 32) decommission];
}

void sub_1000241B8(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 240), 8);
  _Block_object_dispose((const void *)(v1 - 176), 8);
  _Unwind_Resume(a1);
}

uint64_t sub_100024228(uint64_t a1)
{
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = [*(id *)(a1 + 32) dictionary];

  return _objc_release_x1();
}

void sub_100024274(uint64_t a1)
{
  double v2 = [*(id *)(a1 + 32) error];

  if (!v2)
  {
    uint64_t v3 = [*(id *)(a1 + 32) stagedPath];
    uint64_t v4 = *(void **)(a1 + 40);
    id v43 = 0;
    uint64_t v5 = [v4 urlsForItemsInDirectoryAtURL:v3 ignoringSymlinks:1 error:&v43];
    id v6 = v43;
    id v7 = v43;
    if (v5)
    {
      id v35 = v3;
      uint64_t v8 = *(void *)(*(void *)(a1 + 64) + 8);
      uint64_t v9 = *(void **)(v8 + 40);
      *(void *)(v8 + 40) = 0;

      long long v41 = 0u;
      long long v42 = 0u;
      long long v39 = 0u;
      long long v40 = 0u;
      id v34 = v5;
      id obj = v5;
      id v10 = [obj countByEnumeratingWithState:&v39 objects:v52 count:16];
      if (v10)
      {
        id v11 = v10;
        uint64_t v37 = *(void *)v40;
        while (2)
        {
          uint64_t v12 = 0;
          uint64_t v13 = v7;
          do
          {
            if (*(void *)v40 != v37) {
              objc_enumerationMutation(obj);
            }
            uint64_t v14 = *(void **)(*((void *)&v39 + 1) + 8 * (void)v12);
            __int16 v15 = objc_msgSend(v14, "lastPathComponent", v34);
            __int16 v16 = [*(id *)(a1 + 48) URLByAppendingPathComponent:v15 isDirectory:0];
            uint64_t v17 = *(void **)(a1 + 40);
            id v38 = v13;
            unsigned int v18 = [v17 moveItemAtURL:v14 toURL:v16 error:&v38];
            id v19 = v38;
            id v7 = v38;

            __int16 v20 = sub_100004B28((uint64_t)off_100109BB8);
            uint64_t v21 = v20;
            if (!v18)
            {
              if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
              {
                id v32 = [v14 path];
                int v33 = [v16 path];
                *(_DWORD *)buf = 136315906;
                __int16 v45 = "-[IXSPlaceholder _materialize]_block_invoke";
                __int16 v46 = 2112;
                uint64_t v47 = v32;
                __int16 v48 = 2112;
                id v49 = v33;
                __int16 v50 = 2112;
                id v51 = v7;
                _os_log_error_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_ERROR, "%s: Failed to move icon asset from %@ to %@ : %@", buf, 0x2Au);
              }
              objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 64) + 8) + 40), v19);

              goto LABEL_17;
            }
            if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
            {
              __int16 v22 = *(void **)(a1 + 56);
              *(_DWORD *)buf = 136315650;
              __int16 v45 = "-[IXSPlaceholder _materialize]_block_invoke";
              __int16 v46 = 2112;
              uint64_t v47 = v22;
              __int16 v48 = 2112;
              id v49 = v15;
              _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_DEFAULT, "%s: %@: Using icon resource %@", buf, 0x20u);
            }

            uint64_t v12 = (char *)v12 + 1;
            uint64_t v13 = v7;
          }
          while (v11 != v12);
          id v11 = [obj countByEnumeratingWithState:&v39 objects:v52 count:16];
          if (v11) {
            continue;
          }
          break;
        }
      }
LABEL_17:

      uint64_t v5 = v34;
      uint64_t v3 = v35;
    }
    else
    {
      uint64_t v23 = sub_100004B28((uint64_t)off_100109BB8);
      if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR)) {
        sub_10008E9B0();
      }

      uint64_t v24 = sub_100004B28((uint64_t)off_100109BB8);
      if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
      {
        __int16 v25 = [v3 path];
        unsigned int v26 = [*(id *)(a1 + 40) itemExistsAtURL:v3];
        *(_DWORD *)buf = 136315650;
        __int16 v45 = "-[IXSPlaceholder _materialize]_block_invoke";
        if (v26) {
          int v27 = 89;
        }
        else {
          int v27 = 78;
        }
        __int16 v46 = 2112;
        uint64_t v47 = v25;
        __int16 v48 = 1024;
        LODWORD(v49) = v27;
        _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_DEFAULT, "%s: %@ exists: %c", buf, 0x1Cu);
      }
      id v28 = sub_100004B28((uint64_t)off_100109BB8);
      if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v29 = [v3 path];
        unsigned int v30 = [*(id *)(a1 + 40) itemExistsAtURL:v3];
        *(_DWORD *)buf = 136315650;
        __int16 v45 = "-[IXSPlaceholder _materialize]_block_invoke";
        if (v30) {
          int v31 = 89;
        }
        else {
          int v31 = 78;
        }
        __int16 v46 = 2112;
        uint64_t v47 = v29;
        __int16 v48 = 1024;
        LODWORD(v49) = v31;
        _os_log_impl((void *)&_mh_execute_header, v28, OS_LOG_TYPE_DEFAULT, "%s: %@ exists: %c", buf, 0x1Cu);
      }
      objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 64) + 8) + 40), v6);
    }
  }
}

void sub_100024734(uint64_t a1)
{
  double v2 = [*(id *)(a1 + 32) error];

  if (!v2)
  {
    uint64_t v3 = *(void **)(a1 + 40);
    uint64_t v4 = [*(id *)(a1 + 32) stagedPath];
    uint64_t v5 = *(void *)(a1 + 48);
    id v26 = 0;
    unsigned int v6 = [v3 moveItemAtURL:v4 toURL:v5 error:&v26];
    id v7 = v26;

    uint64_t v8 = sub_100004B28((uint64_t)off_100109BB8);
    uint64_t v9 = v8;
    if (v6)
    {
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        id v10 = *(void **)(a1 + 56);
        *(_DWORD *)buf = 136315394;
        id v28 = "-[IXSPlaceholder _materialize]_block_invoke";
        __int16 v29 = 2112;
        unsigned int v30 = v10;
        _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "%s: %@: Using single PNG icon promise", buf, 0x16u);
      }
    }
    else
    {
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      {
        uint64_t v24 = [*(id *)(a1 + 32) stagedPath];
        uint64_t v25 = *(void *)(a1 + 48);
        *(_DWORD *)buf = 136315906;
        id v28 = "-[IXSPlaceholder _materialize]_block_invoke";
        __int16 v29 = 2112;
        unsigned int v30 = v24;
        __int16 v31 = 2112;
        uint64_t v32 = v25;
        __int16 v33 = 2112;
        id v34 = v7;
        _os_log_error_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_ERROR, "%s: Failed to move icon from %@ to %@ : %@", buf, 0x2Au);
      }
      id v11 = sub_100004B28((uint64_t)off_100109BB8);
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v12 = [*(id *)(a1 + 32) stagedPath];
        uint64_t v13 = [v12 path];
        uint64_t v14 = *(void **)(a1 + 40);
        __int16 v15 = [*(id *)(a1 + 32) stagedPath];
        unsigned int v16 = [v14 itemExistsAtURL:v15];
        *(_DWORD *)buf = 136315650;
        if (v16) {
          int v17 = 89;
        }
        else {
          int v17 = 78;
        }
        id v28 = "-[IXSPlaceholder _materialize]_block_invoke";
        __int16 v29 = 2112;
        unsigned int v30 = v13;
        __int16 v31 = 1024;
        LODWORD(v32) = v17;
        _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "%s: %@ exists: %c", buf, 0x1Cu);
      }
      unsigned int v18 = sub_100004B28((uint64_t)off_100109BB8);
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
      {
        id v19 = [*(id *)(a1 + 48) path];
        unsigned int v20 = [*(id *)(a1 + 40) itemExistsAtURL:*(void *)(a1 + 48)];
        *(_DWORD *)buf = 136315650;
        if (v20) {
          int v21 = 89;
        }
        else {
          int v21 = 78;
        }
        id v28 = "-[IXSPlaceholder _materialize]_block_invoke";
        __int16 v29 = 2112;
        unsigned int v30 = v19;
        __int16 v31 = 1024;
        LODWORD(v32) = v21;
        _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "%s: %@ exists: %c", buf, 0x1Cu);
      }
      uint64_t v22 = *(void *)(*(void *)(a1 + 64) + 8);
      id v23 = v7;
      uint64_t v9 = *(NSObject **)(v22 + 40);
      *(void *)(v22 + 40) = v23;
    }
  }
}

void sub_100024A68(uint64_t a1)
{
  double v2 = *(void **)(a1 + 32);
  id v35 = 0;
  unsigned int v3 = [v2 _validateClientEntitlements:&v35];
  id v4 = v35;
  uint64_t v5 = v4;
  if (!v3)
  {
    uint64_t v15 = *(void *)(*(void *)(a1 + 64) + 8);
    id v16 = v4;
    id v11 = 0;
LABEL_19:
    uint64_t v13 = *(NSObject **)(v15 + 40);
    *(void *)(v15 + 40) = v16;
    goto LABEL_20;
  }
  unsigned int v6 = *(void **)(a1 + 40);
  id v7 = [*(id *)(a1 + 32) entitlements];
  uint64_t v8 = [v7 stagedPath];
  uint64_t v9 = *(void *)(a1 + 48);
  id v34 = 0;
  unsigned int v10 = [v6 moveItemAtURL:v8 toURL:v9 error:&v34];
  id v11 = v34;

  uint64_t v12 = sub_100004B28((uint64_t)off_100109BB8);
  uint64_t v13 = v12;
  if (!v10)
  {
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      unsigned int v30 = [*(id *)(a1 + 32) entitlements];
      __int16 v31 = [v30 stagedPath];
      uint64_t v32 = *(void *)(a1 + 48);
      uint64_t v33 = *(void *)(a1 + 56);
      *(_DWORD *)buf = 136315906;
      uint64_t v37 = "-[IXSPlaceholder _materialize]_block_invoke";
      __int16 v38 = 2112;
      long long v39 = v31;
      __int16 v40 = 2112;
      uint64_t v41 = v32;
      __int16 v42 = 2112;
      uint64_t v43 = v33;
      _os_log_error_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_ERROR, "%s: Failed to move entitlements from %@ to %@ : %@", buf, 0x2Au);
    }
    int v17 = sub_100004B28((uint64_t)off_100109BB8);
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      unsigned int v18 = [*(id *)(a1 + 32) entitlements];
      id v19 = [v18 stagedPath];
      unsigned int v20 = [v19 path];
      int v21 = *(void **)(a1 + 40);
      uint64_t v22 = [*(id *)(a1 + 32) entitlements];
      id v23 = [v22 stagedPath];
      unsigned int v24 = [v21 itemExistsAtURL:v23];
      *(_DWORD *)buf = 136315650;
      if (v24) {
        int v25 = 89;
      }
      else {
        int v25 = 78;
      }
      uint64_t v37 = "-[IXSPlaceholder _materialize]_block_invoke";
      __int16 v38 = 2112;
      long long v39 = v20;
      __int16 v40 = 1024;
      LODWORD(v41) = v25;
      _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "%s: %@ exists: %c", buf, 0x1Cu);
    }
    id v26 = sub_100004B28((uint64_t)off_100109BB8);
    if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
    {
      int v27 = [*(id *)(a1 + 48) path];
      unsigned int v28 = [*(id *)(a1 + 40) itemExistsAtURL:*(void *)(a1 + 48)];
      *(_DWORD *)buf = 136315650;
      if (v28) {
        int v29 = 89;
      }
      else {
        int v29 = 78;
      }
      uint64_t v37 = "-[IXSPlaceholder _materialize]_block_invoke";
      __int16 v38 = 2112;
      long long v39 = v27;
      __int16 v40 = 1024;
      LODWORD(v41) = v29;
      _os_log_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_DEFAULT, "%s: %@ exists: %c", buf, 0x1Cu);
    }
    uint64_t v15 = *(void *)(*(void *)(a1 + 64) + 8);
    id v16 = v11;
    id v11 = v16;
    goto LABEL_19;
  }
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v14 = *(void **)(a1 + 32);
    *(_DWORD *)buf = 136315394;
    uint64_t v37 = "-[IXSPlaceholder _materialize]_block_invoke";
    __int16 v38 = 2112;
    long long v39 = v14;
    _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "%s: %@: Added entitlements", buf, 0x16u);
  }
LABEL_20:
}

void sub_100024E18(uint64_t a1)
{
  double v2 = *(void **)(a1 + 32);
  unsigned int v3 = [*(id *)(a1 + 40) stagedPath];
  uint64_t v4 = *(void *)(a1 + 48);
  id v25 = 0;
  unsigned int v5 = [v2 moveItemAtURL:v3 toURL:v4 error:&v25];
  id v6 = v25;

  id v7 = sub_100004B28((uint64_t)off_100109BB8);
  uint64_t v8 = v7;
  if (v5)
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v9 = *(void **)(a1 + 56);
      *(_DWORD *)buf = 136315394;
      int v27 = "-[IXSPlaceholder _materialize]_block_invoke";
      __int16 v28 = 2112;
      int v29 = v9;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "%s: %@: Added InfoPlist.loctable", buf, 0x16u);
    }
  }
  else
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      id v23 = [*(id *)(a1 + 40) stagedPath];
      uint64_t v24 = *(void *)(a1 + 48);
      *(_DWORD *)buf = 136315906;
      int v27 = "-[IXSPlaceholder _materialize]_block_invoke";
      __int16 v28 = 2112;
      int v29 = v23;
      __int16 v30 = 2112;
      uint64_t v31 = v24;
      __int16 v32 = 2112;
      id v33 = v6;
      _os_log_error_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_ERROR, "%s: Failed to move loctable from %@ to %@ : %@", buf, 0x2Au);
    }
    unsigned int v10 = sub_100004B28((uint64_t)off_100109BB8);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      id v11 = [*(id *)(a1 + 40) stagedPath];
      uint64_t v12 = [v11 path];
      uint64_t v13 = *(void **)(a1 + 32);
      uint64_t v14 = [*(id *)(a1 + 40) stagedPath];
      unsigned int v15 = [v13 itemExistsAtURL:v14];
      *(_DWORD *)buf = 136315650;
      if (v15) {
        int v16 = 89;
      }
      else {
        int v16 = 78;
      }
      int v27 = "-[IXSPlaceholder _materialize]_block_invoke";
      __int16 v28 = 2112;
      int v29 = v12;
      __int16 v30 = 1024;
      LODWORD(v31) = v16;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "%s: %@ exists: %c", buf, 0x1Cu);
    }
    int v17 = sub_100004B28((uint64_t)off_100109BB8);
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      unsigned int v18 = [*(id *)(a1 + 48) path];
      unsigned int v19 = [*(id *)(a1 + 32) itemExistsAtURL:*(void *)(a1 + 48)];
      *(_DWORD *)buf = 136315650;
      if (v19) {
        int v20 = 89;
      }
      else {
        int v20 = 78;
      }
      int v27 = "-[IXSPlaceholder _materialize]_block_invoke";
      __int16 v28 = 2112;
      int v29 = v18;
      __int16 v30 = 1024;
      LODWORD(v31) = v20;
      _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "%s: %@ exists: %c", buf, 0x1Cu);
    }
    uint64_t v21 = *(void *)(*(void *)(a1 + 64) + 8);
    id v22 = v6;
    uint64_t v8 = *(NSObject **)(v21 + 40);
    *(void *)(v21 + 40) = v22;
  }
}

void sub_100025138(uint64_t a1, void *a2, void *a3, unsigned char *a4)
{
  id v7 = a3;
  uint64_t v8 = [a2 stringByAppendingString:@".lproj"];
  uint64_t v9 = [*(id *)(a1 + 32) URLByAppendingPathComponent:v8 isDirectory:1];
  unsigned int v10 = [v9 URLByAppendingPathComponent:@"InfoPlist.strings" isDirectory:0];
  id v11 = *(void **)(a1 + 40);
  id v28 = 0;
  unsigned __int8 v12 = [v11 createDirectoryAtURL:v9 withIntermediateDirectories:0 mode:493 class:4 error:&v28];
  id v13 = v28;
  if ((v12 & 1) == 0)
  {
    int v16 = sub_100004B28((uint64_t)off_100109BB8);
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
      sub_10008EAC4();
    }

    int v17 = [v9 path];
    uint64_t v19 = sub_10003DAE4((uint64_t)"-[IXSPlaceholder _materialize]_block_invoke", 1454, @"IXErrorDomain", 0x14uLL, v13, 0, @"Failed to create lproj directory at %@", v18, (uint64_t)v17);

    uint64_t v20 = *(void *)(*(void *)(a1 + 48) + 8);
    uint64_t v21 = *(void **)(v20 + 40);
    *(void *)(v20 + 40) = v19;
    goto LABEL_9;
  }
  if (!*(unsigned char *)(a1 + 56) && [v7 count])
  {
    id v27 = v13;
    unsigned __int8 v14 = objc_msgSend(v7, "IX_writeToURL:format:options:error:", v10, 200, 0x10000000, &v27);
    id v15 = v27;

    if (v14)
    {
      id v13 = v15;
      goto LABEL_10;
    }
    id v22 = sub_100004B28((uint64_t)off_100109BB8);
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR)) {
      sub_10008EA24();
    }

    id v23 = [v10 path];
    uint64_t v25 = sub_10003DAE4((uint64_t)"-[IXSPlaceholder _materialize]_block_invoke", 1469, @"IXErrorDomain", 0x14uLL, v15, 0, @"Failed to write %@", v24, (uint64_t)v23);

    uint64_t v26 = *(void *)(*(void *)(a1 + 48) + 8);
    uint64_t v21 = *(void **)(v26 + 40);
    *(void *)(v26 + 40) = v25;
    id v13 = v15;
LABEL_9:

    *a4 = 1;
  }
LABEL_10:
}

void sub_1000253C4(uint64_t a1)
{
  double v2 = [*(id *)(a1 + 32) seed];
  id v3 = [v2 placeholderType];

  if (v3 == (id)2)
  {
    uint64_t v4 = *(void **)(*(void *)(*(void *)(a1 + 80) + 8) + 40);
    if (!v4)
    {
      uint64_t v20 = [*(id *)(a1 + 40) URLByAppendingPathComponent:@"PlugIns" isDirectory:1];
      uint64_t v21 = *(void *)(*(void *)(a1 + 80) + 8);
      id v22 = *(void **)(v21 + 40);
      *(void *)(v21 + 40) = v20;

      uint64_t v8 = *(void *)(a1 + 80);
      goto LABEL_11;
    }
LABEL_6:
    id v9 = v4;
LABEL_13:
    id v27 = [*(id *)(a1 + 32) stagedPath];
    id v28 = [v27 lastPathComponent];

    int v29 = [v9 URLByAppendingPathComponent:v28 isDirectory:1];
    __int16 v30 = *(void **)(a1 + 48);
    uint64_t v31 = [*(id *)(a1 + 32) stagedPath];
    id v62 = 0;
    unsigned int v32 = [v30 moveItemAtURL:v31 toURL:v29 error:&v62];
    id v33 = v62;

    id v34 = sub_100004B28((uint64_t)off_100109BB8);
    id v35 = v34;
    if (v32)
    {
      if (os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v36 = *(void **)(a1 + 56);
        *(_DWORD *)buf = 136315650;
        v65 = "-[IXSPlaceholder _materialize]_block_invoke";
        __int16 v66 = 2112;
        id v67 = v36;
        __int16 v68 = 2112;
        id v69 = v28;
        _os_log_impl((void *)&_mh_execute_header, v35, OS_LOG_TYPE_DEFAULT, "%s: %@: added appex %@", buf, 0x20u);
      }
    }
    else
    {
      if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR))
      {
        id v55 = *(void **)(a1 + 32);
        [v55 stagedPath];
        id v56 = v61 = v33;
        uint64_t v57 = [v56 path];
        id v58 = [v29 path];
        uint64_t v59 = *(void *)(a1 + 64);
        *(_DWORD *)buf = 136316162;
        v65 = "-[IXSPlaceholder _materialize]_block_invoke";
        __int16 v66 = 2112;
        id v67 = v55;
        __int16 v68 = 2112;
        id v69 = v57;
        __int16 v70 = 2112;
        long long v71 = v58;
        __int16 v72 = 2112;
        uint64_t v73 = v59;
        _os_log_error_impl((void *)&_mh_execute_header, v35, OS_LOG_TYPE_ERROR, "%s: Failed to move app extension placeholder %@ from %@ to %@ : %@", buf, 0x34u);

        id v33 = v61;
      }

      uint64_t v37 = sub_100004B28((uint64_t)off_100109BB8);
      __int16 v38 = &off_1000AA000;
      if (os_log_type_enabled(v37, OS_LOG_TYPE_DEFAULT))
      {
        long long v39 = [*(id *)(a1 + 32) stagedPath];
        [v39 path];
        v40 = id v60 = v33;
        uint64_t v41 = *(void **)(a1 + 48);
        __int16 v42 = [*(id *)(a1 + 32) stagedPath];
        uint64_t v43 = v41;
        __int16 v38 = &off_1000AA000;
        unsigned int v44 = [v43 itemExistsAtURL:v42];
        *(_DWORD *)buf = 136315650;
        v65 = "-[IXSPlaceholder _materialize]_block_invoke";
        if (v44) {
          int v45 = 89;
        }
        else {
          int v45 = 78;
        }
        __int16 v66 = 2112;
        id v67 = v40;
        __int16 v68 = 1024;
        LODWORD(v69) = v45;
        _os_log_impl((void *)&_mh_execute_header, v37, OS_LOG_TYPE_DEFAULT, "%s: %@ exists: %c", buf, 0x1Cu);

        id v33 = v60;
      }

      __int16 v46 = sub_100004B28((uint64_t)off_100109BB8);
      if (os_log_type_enabled(v46, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v47 = [v29 path];
        unsigned int v48 = [*(id *)(a1 + 48) itemExistsAtURL:v29];
        *(_DWORD *)buf = *((void *)v38 + 463);
        v65 = "-[IXSPlaceholder _materialize]_block_invoke";
        if (v48) {
          int v49 = 89;
        }
        else {
          int v49 = 78;
        }
        __int16 v66 = 2112;
        id v67 = v47;
        __int16 v68 = 1024;
        LODWORD(v69) = v49;
        _os_log_impl((void *)&_mh_execute_header, v46, OS_LOG_TYPE_DEFAULT, "%s: %@ exists: %c", buf, 0x1Cu);
      }
      uint64_t v50 = *(void *)(*(void *)(a1 + 88) + 8);
      id v51 = v33;
      id v35 = *(NSObject **)(v50 + 40);
      *(void *)(v50 + 40) = v51;
    }

    goto LABEL_30;
  }
  if (v3 != (id)3)
  {
    unsigned int v10 = sub_100004B28((uint64_t)off_100109BB8);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      sub_10008EB64((uint64_t)v3, v10, v11, v12, v13, v14, v15, v16);
    }

    uint64_t v18 = sub_10003DAE4((uint64_t)"-[IXSPlaceholder _materialize]_block_invoke", 1515, @"IXErrorDomain", 0x14uLL, 0, 0, @"Placeholder type of %lu in list of app extension placeholders is not supported", v17, (uint64_t)v3);
    uint64_t v19 = *(void *)(*(void *)(a1 + 88) + 8);
    id v9 = *(id *)(v19 + 40);
    *(void *)(v19 + 40) = v18;
    goto LABEL_30;
  }
  uint64_t v4 = *(void **)(*(void *)(*(void *)(a1 + 72) + 8) + 40);
  if (v4) {
    goto LABEL_6;
  }
  uint64_t v5 = [*(id *)(a1 + 40) URLByAppendingPathComponent:@"Extensions" isDirectory:1];
  uint64_t v6 = *(void *)(*(void *)(a1 + 72) + 8);
  id v7 = *(void **)(v6 + 40);
  *(void *)(v6 + 40) = v5;

  uint64_t v8 = *(void *)(a1 + 72);
LABEL_11:
  id v9 = *(id *)(*(void *)(v8 + 8) + 40);
  id v23 = *(void **)(a1 + 48);
  id v63 = 0;
  unsigned __int8 v24 = [v23 createDirectoryAtURL:v9 withIntermediateDirectories:0 mode:493 error:&v63];
  id v25 = v63;
  id v26 = v25;
  if (v24)
  {

    goto LABEL_13;
  }
  id v52 = sub_100004B28((uint64_t)off_100109BB8);
  if (os_log_type_enabled(v52, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315650;
    v65 = "-[IXSPlaceholder _materialize]_block_invoke";
    __int16 v66 = 2112;
    id v67 = v9;
    __int16 v68 = 2112;
    id v69 = v26;
    _os_log_impl((void *)&_mh_execute_header, v52, OS_LOG_TYPE_DEFAULT, "%s: Failed to create directory at %@ : %@", buf, 0x20u);
  }

  uint64_t v53 = *(void *)(*(void *)(a1 + 88) + 8);
  id v54 = *(void **)(v53 + 40);
  *(void *)(v53 + 40) = v26;

LABEL_30:
}

void sub_100025B10(uint64_t a1)
{
  if (([*(id *)(a1 + 32) sentDidBegin] & 1) == 0)
  {
    [*(id *)(a1 + 32) setSentDidBegin:1];
    double v2 = [*(id *)(a1 + 32) delegate];
    if (v2)
    {
      if (objc_opt_respondsToSelector())
      {
        id v3 = [*(id *)(a1 + 32) delegateDeliveryQueue];
        v6[0] = _NSConcreteStackBlock;
        v6[1] = 3221225472;
        v6[2] = sub_100025BFC;
        v6[3] = &unk_1000E8E08;
        id v4 = v2;
        uint64_t v5 = *(void *)(a1 + 32);
        id v7 = v4;
        uint64_t v8 = v5;
        sub_100066F24(v3, v6);
      }
    }
  }
}

id sub_100025BFC(uint64_t a1)
{
  return [*(id *)(a1 + 32) promiseDidBegin:*(void *)(a1 + 40)];
}

id sub_100025CA8(uint64_t a1)
{
  return [*(id *)(a1 + 32) _materializeIfReady];
}

void sub_100025D50(uint64_t a1)
{
  double v2 = [*(id *)(a1 + 32) delegate];
  if (v2 && (objc_opt_respondsToSelector() & 1) != 0)
  {
    id v3 = [*(id *)(a1 + 32) delegateDeliveryQueue];
    v6[0] = _NSConcreteStackBlock;
    v6[1] = 3221225472;
    v6[2] = sub_100025E24;
    v6[3] = &unk_1000E8E08;
    id v4 = v2;
    uint64_t v5 = *(void *)(a1 + 32);
    id v7 = v4;
    uint64_t v8 = v5;
    sub_100066F24(v3, v6);
  }
}

id sub_100025E24(uint64_t a1)
{
  return [*(id *)(a1 + 32) promiseDidReset:*(void *)(a1 + 40)];
}

void sub_100025ED0(uint64_t a1)
{
  double v2 = [*(id *)(a1 + 32) delegate];
  if (v2 && (objc_opt_respondsToSelector() & 1) != 0)
  {
    [*(id *)(a1 + 32) percentComplete];
    uint64_t v4 = v3;
    uint64_t v5 = [*(id *)(a1 + 32) delegateDeliveryQueue];
    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472;
    v8[2] = sub_100025FBC;
    v8[3] = &unk_1000E9738;
    id v6 = v2;
    uint64_t v7 = *(void *)(a1 + 32);
    id v9 = v6;
    uint64_t v10 = v7;
    uint64_t v11 = v4;
    sub_100066F24(v5, v8);
  }
}

id sub_100025FBC(uint64_t a1)
{
  return [*(id *)(a1 + 32) promise:*(void *)(a1 + 40) didUpdateProgress:*(double *)(a1 + 48)];
}

id sub_1000260C8(uint64_t a1)
{
  double v2 = [*(id *)(a1 + 32) icon];
  uint64_t v3 = *(void **)(a1 + 40);

  if (v2 == v3)
  {
    uint64_t v10 = sub_100004B28((uint64_t)off_100109BB8);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v11 = *(void *)(a1 + 32);
      int v14 = 136315394;
      uint64_t v15 = "-[IXSPlaceholder promise:didCancelForReason:client:]_block_invoke";
      __int16 v16 = 2112;
      uint64_t v17 = v11;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "%s: %@: got icon promise cancelation; ignoring",
        (uint8_t *)&v14,
        0x16u);
    }

    return [*(id *)(a1 + 32) setIcon:0];
  }
  else
  {
    uint64_t v4 = [*(id *)(a1 + 32) iconResourcesPromise];
    uint64_t v5 = *(void **)(a1 + 40);

    if (v4 == v5)
    {
      uint64_t v12 = sub_100004B28((uint64_t)off_100109BB8);
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v13 = *(void *)(a1 + 32);
        int v14 = 136315394;
        uint64_t v15 = "-[IXSPlaceholder promise:didCancelForReason:client:]_block_invoke";
        __int16 v16 = 2112;
        uint64_t v17 = v13;
        _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "%s: %@: got icon resources promise cancelation; ignoring",
          (uint8_t *)&v14,
          0x16u);
      }

      return [*(id *)(a1 + 32) setIconResourcesPromise:0];
    }
    else
    {
      id v6 = *(void **)(a1 + 32);
      uint64_t v7 = *(void *)(a1 + 48);
      uint64_t v8 = *(void *)(a1 + 56);
      return [v6 cancelForReason:v7 client:v8 error:0];
    }
  }
}

void sub_100026BFC(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 176), 8);
  _Unwind_Resume(a1);
}

id sub_100026C24(uint64_t a1)
{
  return [*(id *)(a1 + 32) setMetadataPromise:0];
}

id sub_100026C30(uint64_t a1)
{
  id result = [*(id *)(a1 + 32) isComplete];
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = (_BYTE)result;
  return result;
}

id sub_100026C64(uint64_t a1)
{
  return [*(id *)(a1 + 32) supersede];
}

id sub_100026C6C(uint64_t a1)
{
  return [*(id *)(a1 + 32) setMetadataPromise:*(void *)(a1 + 40)];
}

void sub_100026D98(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t sub_100026DB0(uint64_t a1)
{
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = [*(id *)(a1 + 32) metadata];

  return _objc_release_x1();
}

id sub_100026FCC(uint64_t a1)
{
  return [*(id *)(a1 + 32) setSinfPromise:*(void *)(a1 + 40)];
}

void sub_1000270F8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t sub_100027110(uint64_t a1)
{
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = [*(id *)(a1 + 32) sinfData];

  return _objc_release_x1();
}

void sub_100027230(uint64_t a1)
{
  double v2 = [*(id *)(a1 + 32) attributes];

  if (v2)
  {
    uint64_t v3 = [*(id *)(a1 + 32) attributes];
  }
  else
  {
    uint64_t v3 = objc_opt_new();
  }
  id v4 = v3;
  [v3 setLaunchProhibited:*(unsigned __int8 *)(a1 + 40)];
  [*(id *)(a1 + 32) setAttributes:v4];
}

void sub_1000273B0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1000273C8(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) attributes];
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = [v2 launchProhibited];
}

id sub_100027514(uint64_t a1)
{
  return [*(id *)(a1 + 32) setAttributes:*(void *)(a1 + 40)];
}

void sub_100027640(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t sub_100027658(uint64_t a1)
{
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = [*(id *)(a1 + 32) attributes];

  return _objc_release_x1();
}

id sub_100027874(uint64_t a1)
{
  return [*(id *)(a1 + 32) setIcon:*(void *)(a1 + 40)];
}

void sub_100027974(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_10002798C(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) icon];
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = v2 != 0;
}

void sub_100027B00(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_100027B18(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) icon];
  uint64_t v3 = v2;
  if (v2)
  {
    id v4 = [v2 accessQueue];
    v5[0] = _NSConcreteStackBlock;
    v5[1] = 3221225472;
    v5[2] = sub_100027BDC;
    v5[3] = &unk_1000E90A8;
    uint64_t v7 = *(void *)(a1 + 40);
    id v6 = v3;
    dispatch_sync(v4, v5);
  }
}

uint64_t sub_100027BDC(uint64_t a1)
{
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = [*(id *)(a1 + 32) clientSeed];

  return _objc_release_x1();
}

id sub_100027EEC(uint64_t a1)
{
  return [*(id *)(a1 + 32) setIconResourcesPromise:*(void *)(a1 + 40) andInfoPlistIconContentPromise:*(void *)(a1 + 48)];
}

void sub_100027FF4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_10002800C(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) iconResourcesPromise];
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = v2 != 0;
}

void sub_1000281DC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v9 - 96), 8);
  _Unwind_Resume(a1);
}

void sub_100028200(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) iconResourcesPromise];
  uint64_t v3 = v2;
  if (v2)
  {
    id v4 = [v2 accessQueue];
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_100028364;
    block[3] = &unk_1000E90A8;
    uint64_t v13 = *(void *)(a1 + 40);
    id v12 = v3;
    dispatch_sync(v4, block);
  }
  if (*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40))
  {
    uint64_t v5 = [*(id *)(a1 + 32) infoPlistIconContentPromise];
    id v6 = v5;
    if (v5)
    {
      uint64_t v7 = [v5 accessQueue];
      v8[0] = _NSConcreteStackBlock;
      v8[1] = 3221225472;
      v8[2] = sub_1000283B0;
      v8[3] = &unk_1000E90A8;
      uint64_t v10 = *(void *)(a1 + 48);
      id v9 = v6;
      dispatch_sync(v7, v8);
    }
  }
}

uint64_t sub_100028364(uint64_t a1)
{
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = [*(id *)(a1 + 32) clientSeed];

  return _objc_release_x1();
}

void sub_1000283B0(uint64_t a1)
{
  id v5 = [*(id *)(a1 + 32) dictionary];
  id v2 = [v5 copy];
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
  id v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;
}

id sub_1000285E4(uint64_t a1)
{
  return [*(id *)(a1 + 32) setLocalizationDictionaryPromise:*(void *)(a1 + 40)];
}

void sub_100028710(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t sub_100028728(uint64_t a1)
{
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = [*(id *)(a1 + 32) localizationDictionary];

  return _objc_release_x1();
}

id sub_100028944(uint64_t a1)
{
  return [*(id *)(a1 + 32) setEntitlements:*(void *)(a1 + 40)];
}

void sub_100028A44(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_100028A5C(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) entitlements];
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = v2 != 0;
}

void sub_100028BD0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_100028BE8(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) entitlements];
  uint64_t v3 = v2;
  if (v2)
  {
    id v4 = [v2 accessQueue];
    v5[0] = _NSConcreteStackBlock;
    v5[1] = 3221225472;
    v5[2] = sub_100028CAC;
    v5[3] = &unk_1000E90A8;
    uint64_t v7 = *(void *)(a1 + 40);
    id v6 = v3;
    dispatch_sync(v4, v5);
  }
}

uint64_t sub_100028CAC(uint64_t a1)
{
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = [*(id *)(a1 + 32) clientSeed];

  return _objc_release_x1();
}

id sub_100028EC8(uint64_t a1)
{
  return [*(id *)(a1 + 32) setInfoPlistLoctable:*(void *)(a1 + 40)];
}

void sub_100028FC8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_100028FE0(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) infoPlistLoctable];
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = v2 != 0;
}

void sub_100029154(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_10002916C(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) infoPlistLoctable];
  uint64_t v3 = v2;
  if (v2)
  {
    id v4 = [v2 accessQueue];
    v5[0] = _NSConcreteStackBlock;
    v5[1] = 3221225472;
    v5[2] = sub_100029230;
    v5[3] = &unk_1000E90A8;
    uint64_t v7 = *(void *)(a1 + 40);
    id v6 = v3;
    dispatch_sync(v4, v5);
  }
}

uint64_t sub_100029230(uint64_t a1)
{
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = [*(id *)(a1 + 32) clientSeed];

  return _objc_release_x1();
}

id sub_1000297CC(uint64_t a1)
{
  return [*(id *)(a1 + 32) setAppExtensionPlaceholders:*(void *)(a1 + 40)];
}

void sub_1000298CC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1000298E4(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) appExtensionPlaceholders];
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = v2 != 0;
}

void sub_100029A58(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_100029A70(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) appExtensionPlaceholders];
  if (v2)
  {
    uint64_t v3 = (void *)v2;
    id v4 = [*(id *)(a1 + 32) appExtensionPlaceholders];
    id v5 = [v4 count];

    if (v5)
    {
      uint64_t v6 = objc_opt_new();
      uint64_t v7 = *(void *)(*(void *)(a1 + 40) + 8);
      uint64_t v8 = *(void **)(v7 + 40);
      *(void *)(v7 + 40) = v6;

      long long v20 = 0u;
      long long v21 = 0u;
      long long v18 = 0u;
      long long v19 = 0u;
      id v9 = [*(id *)(a1 + 32) appExtensionPlaceholders];
      id v10 = [v9 countByEnumeratingWithState:&v18 objects:v22 count:16];
      if (v10)
      {
        id v11 = v10;
        uint64_t v12 = *(void *)v19;
        do
        {
          for (i = 0; i != v11; i = (char *)i + 1)
          {
            if (*(void *)v19 != v12) {
              objc_enumerationMutation(v9);
            }
            int v14 = *(void **)(*((void *)&v18 + 1) + 8 * i);
            uint64_t v15 = [v14 accessQueue];
            v17[0] = _NSConcreteStackBlock;
            v17[1] = 3221225472;
            v17[2] = sub_100029C38;
            v17[3] = &unk_1000E90A8;
            uint64_t v16 = *(void *)(a1 + 40);
            v17[4] = v14;
            v17[5] = v16;
            dispatch_sync(v15, v17);
          }
          id v11 = [v9 countByEnumeratingWithState:&v18 objects:v22 count:16];
        }
        while (v11);
      }
    }
  }
}

void sub_100029C38(uint64_t a1)
{
  uint64_t v1 = *(void **)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
  id v2 = [*(id *)(a1 + 32) clientSeed];
  [v1 addObject:v2];
}

id sub_100029D60(uint64_t a1)
{
  return [*(id *)(a1 + 32) setConfigurationComplete:1];
}

id sub_100029D6C(uint64_t a1)
{
  id result = [*(id *)(a1 + 32) totalBytesNeededOnDisk];
  **(void **)(a1 + 40) += result;
  return result;
}

uint64_t sub_100029DA4(uint64_t result, uint64_t a2, uint64_t a3)
{
  *(void *)(a3 + 4) = v3;
  *(_WORD *)(a3 + 12) = 2112;
  *(void *)(a3 + 14) = result;
  *(_WORD *)(a3 + 22) = 2112;
  *(void *)(a3 + 24) = a2;
  *(_WORD *)(a3 + 32) = 2112;
  *(void *)(a3 + 34) = 0;
  return result;
}

void sub_100029DDC(void *a1@<X0>, const char *a2@<X3>, uint8_t *a3@<X4>, NSObject *a4@<X8>)
{
  _os_log_error_impl(a1, a4, OS_LOG_TYPE_ERROR, a2, a3, 0x2Au);
}

void sub_100029DF8(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_debug_impl(a1, v9, OS_LOG_TYPE_DEBUG, a4, &a9, 0x16u);
}

uint64_t sub_100029E50(uint64_t result, uint64_t a2, uint64_t a3)
{
  *(void *)(a3 + 4) = v3;
  *(_WORD *)(a3 + 12) = 2112;
  *(void *)(a3 + 14) = result;
  *(_WORD *)(a3 + 22) = 2112;
  *(void *)(a3 + 24) = a2;
  return result;
}

void sub_100029E78(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, v9, OS_LOG_TYPE_ERROR, a4, &a9, 0x2Au);
}

void sub_100029F58(uint64_t a1)
{
  uint64_t v1 = *(void **)(a1 + 32);
  id v3 = [v1 stagingBaseDir];
  id v2 = [v3 URLByAppendingPathComponent:@"extract" isDirectory:1];
  objc_msgSend(v1, "_internal_setStagedPath:", v2);
}

void sub_10002A1BC(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 40);
  id v3 = [*(id *)(a1 + 32) seed];
  [v3 setArchiveBytesConsumed:v2];

  uint64_t v4 = [*(id *)(a1 + 32) seed];
  id v5 = [v4 archiveSizeBytes];

  if (v5)
  {
    double v6 = (double)*(unint64_t *)(a1 + 40);
    id v7 = [*(id *)(a1 + 32) seed];
    objc_msgSend(*(id *)(a1 + 32), "setPercentComplete:", v6 / (double)(unint64_t)objc_msgSend(v7, "archiveSizeBytes"));
  }
}

uint64_t sub_10002A328()
{
  qword_100109E50 = (uint64_t)objc_alloc_init((Class)objc_opt_class());

  return _objc_release_x1();
}

void sub_10002A974(id a1, NSNumber *a2, NSSet *a3, BOOL *a4)
{
  id v5 = a2;
  double v6 = a3;
  id v7 = sub_100004B28((uint64_t)off_100109BB8);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v8 = IXStringForClientID([(NSNumber *)v5 unsignedIntegerValue]);
    int v9 = 136315650;
    uint64_t v10 = "-[IXSAppInstallObserverManager init]_block_invoke";
    __int16 v11 = 2112;
    uint64_t v12 = v8;
    __int16 v13 = 2112;
    int v14 = v6;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "%s: Client ID %@ has interested services: %@", (uint8_t *)&v9, 0x20u);
  }
}

void sub_10002AA78(id a1, NSString *a2, NSNumber *a3, BOOL *a4)
{
  id v5 = a2;
  double v6 = a3;
  id v7 = sub_100004B28((uint64_t)off_100109BB8);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v8 = sub_10002AB7C([(NSNumber *)v6 unsignedIntegerValue]);
    int v9 = 136315650;
    uint64_t v10 = "-[IXSAppInstallObserverManager init]_block_invoke";
    __int16 v11 = 2112;
    uint64_t v12 = v5;
    __int16 v13 = 2112;
    int v14 = v8;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "%s: Service name %@ implements selectors %@", (uint8_t *)&v9, 0x20u);
  }
}

id sub_10002AB7C(uint64_t a1)
{
  uint64_t v2 = +[NSMutableString stringWithString:@"["];
  id v3 = v2;
  if (a1)
  {
    if ((unint64_t)[v2 length] <= 1) {
      CFStringRef v7 = @"%s";
    }
    else {
      CFStringRef v7 = @" %s";
    }
    objc_msgSend(v3, "appendFormat:", v7, "Prioritize");
    if ((a1 & 2) == 0)
    {
LABEL_3:
      if ((a1 & 4) == 0) {
        goto LABEL_4;
      }
      goto LABEL_29;
    }
  }
  else if ((a1 & 2) == 0)
  {
    goto LABEL_3;
  }
  if ((unint64_t)[v3 length] <= 1) {
    CFStringRef v8 = @"%s";
  }
  else {
    CFStringRef v8 = @" %s";
  }
  objc_msgSend(v3, "appendFormat:", v8, "Resume");
  if ((a1 & 4) == 0)
  {
LABEL_4:
    if ((a1 & 8) == 0) {
      goto LABEL_5;
    }
    goto LABEL_33;
  }
LABEL_29:
  if ((unint64_t)[v3 length] <= 1) {
    CFStringRef v9 = @"%s";
  }
  else {
    CFStringRef v9 = @" %s";
  }
  objc_msgSend(v3, "appendFormat:", v9, "Pause");
  if ((a1 & 8) == 0)
  {
LABEL_5:
    if ((a1 & 0x10) == 0) {
      goto LABEL_6;
    }
    goto LABEL_37;
  }
LABEL_33:
  if ((unint64_t)[v3 length] <= 1) {
    CFStringRef v10 = @"%s";
  }
  else {
    CFStringRef v10 = @" %s";
  }
  objc_msgSend(v3, "appendFormat:", v10, "PromiseBegin");
  if ((a1 & 0x10) == 0)
  {
LABEL_6:
    if ((a1 & 0x20) == 0) {
      goto LABEL_7;
    }
    goto LABEL_41;
  }
LABEL_37:
  if ((unint64_t)[v3 length] <= 1) {
    CFStringRef v11 = @"%s";
  }
  else {
    CFStringRef v11 = @" %s";
  }
  objc_msgSend(v3, "appendFormat:", v11, "InstallPlaceholder");
  if ((a1 & 0x20) == 0)
  {
LABEL_7:
    if ((a1 & 0x40) == 0) {
      goto LABEL_8;
    }
    goto LABEL_45;
  }
LABEL_41:
  if ((unint64_t)[v3 length] <= 1) {
    CFStringRef v12 = @"%s";
  }
  else {
    CFStringRef v12 = @" %s";
  }
  objc_msgSend(v3, "appendFormat:", v12, "Complete");
  if ((a1 & 0x40) == 0)
  {
LABEL_8:
    if ((a1 & 0x80) == 0) {
      goto LABEL_9;
    }
    goto LABEL_49;
  }
LABEL_45:
  if ((unint64_t)[v3 length] <= 1) {
    CFStringRef v13 = @"%s";
  }
  else {
    CFStringRef v13 = @" %s";
  }
  objc_msgSend(v3, "appendFormat:", v13, "Cancel");
  if ((a1 & 0x80) == 0)
  {
LABEL_9:
    if ((a1 & 0x100) == 0) {
      goto LABEL_10;
    }
    goto LABEL_53;
  }
LABEL_49:
  if ((unint64_t)[v3 length] <= 1) {
    CFStringRef v14 = @"%s";
  }
  else {
    CFStringRef v14 = @" %s";
  }
  objc_msgSend(v3, "appendFormat:", v14, "PrioritizeBundleID");
  if ((a1 & 0x100) == 0)
  {
LABEL_10:
    if ((a1 & 0x800) == 0) {
      goto LABEL_11;
    }
    goto LABEL_57;
  }
LABEL_53:
  if ((unint64_t)[v3 length] <= 1) {
    CFStringRef v15 = @"%s";
  }
  else {
    CFStringRef v15 = @" %s";
  }
  objc_msgSend(v3, "appendFormat:", v15, "BeginRestoringUserData");
  if ((a1 & 0x800) == 0)
  {
LABEL_11:
    if ((a1 & 0x1000) == 0) {
      goto LABEL_12;
    }
    goto LABEL_61;
  }
LABEL_57:
  if ((unint64_t)[v3 length] <= 1) {
    CFStringRef v16 = @"%s";
  }
  else {
    CFStringRef v16 = @" %s";
  }
  objc_msgSend(v3, "appendFormat:", v16, "InstallPlaceholderForRecord");
  if ((a1 & 0x1000) == 0)
  {
LABEL_12:
    if ((a1 & 0x2000) == 0) {
      goto LABEL_13;
    }
LABEL_65:
    if ((unint64_t)[v3 length] <= 1) {
      CFStringRef v18 = @"%s";
    }
    else {
      CFStringRef v18 = @" %s";
    }
    objc_msgSend(v3, "appendFormat:", v18, "PrioritizeAppWithIdentity");
    if ((a1 & 0x4000) == 0) {
      goto LABEL_18;
    }
    goto LABEL_14;
  }
LABEL_61:
  if ((unint64_t)[v3 length] <= 1) {
    CFStringRef v17 = @"%s";
  }
  else {
    CFStringRef v17 = @" %s";
  }
  objc_msgSend(v3, "appendFormat:", v17, "CompleteForRecord");
  if ((a1 & 0x2000) != 0) {
    goto LABEL_65;
  }
LABEL_13:
  if ((a1 & 0x4000) != 0)
  {
LABEL_14:
    if ((unint64_t)[v3 length] <= 1) {
      CFStringRef v4 = @"%s";
    }
    else {
      CFStringRef v4 = @" %s";
    }
    objc_msgSend(v3, "appendFormat:", v4, "ShouldBeginPostProcessing");
  }
LABEL_18:
  objc_msgSend(v3, "appendFormat:", @" (%lu)]", a1);
  id v5 = [v3 copy];

  return v5;
}

void sub_10002B018(_Unwind_Exception *exception_object, int a2)
{
  if (a2)
  {
    if (a2 == 2)
    {
      id v2 = objc_begin_catch(exception_object);
      id v3 = sub_100004B28((uint64_t)off_100109BB8);
      if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
        sub_10008F608();
      }

      objc_end_catch();
      JUMPOUT(0x10002AFE4);
    }
    objc_begin_catch(exception_object);
    objc_exception_rethrow();
  }
  _Unwind_Resume(exception_object);
}

void sub_10002B19C(uint64_t a1)
{
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  id v2 = *(id *)(a1 + 32);
  id v3 = [v2 countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v3)
  {
    id v4 = v3;
    char v5 = 0;
    uint64_t v6 = *(void *)v19;
    do
    {
      for (i = 0; i != v4; i = (char *)i + 1)
      {
        if (*(void *)v19 != v6) {
          objc_enumerationMutation(v2);
        }
        uint64_t v8 = *(void *)(*((void *)&v18 + 1) + 8 * i);
        CFStringRef v9 = objc_msgSend(*(id *)(a1 + 40), "clientToObserverServiceNameMap", (void)v18);
        CFStringRef v10 = [v9 objectForKeyedSubscript:v8];

        if (([v10 containsObject:*(void *)(a1 + 48)] & 1) == 0)
        {
          id v11 = [v10 mutableCopy];
          if (!v11) {
            id v11 = (id)objc_opt_new();
          }
          [v11 addObject:*(void *)(a1 + 48)];
          id v12 = [v11 copy];

          CFStringRef v13 = [*(id *)(a1 + 40) clientToObserverServiceNameMap];
          [v13 setObject:v12 forKeyedSubscript:v8];

          char v5 = 1;
          CFStringRef v10 = v12;
        }
      }
      id v4 = [v2 countByEnumeratingWithState:&v18 objects:v22 count:16];
    }
    while (v4);
  }
  else
  {
    char v5 = 0;
  }

  CFStringRef v14 = [*(id *)(a1 + 40) serviceRespondsToMap];
  CFStringRef v15 = [v14 objectForKeyedSubscript:*(void *)(a1 + 48)];

  CFStringRef v16 = +[NSNumber numberWithUnsignedInteger:*(void *)(a1 + 56)];
  if (v15 && ([v15 isEqualToNumber:v16] & 1) != 0)
  {
    if ((v5 & 1) == 0) {
      goto LABEL_20;
    }
  }
  else
  {
    CFStringRef v17 = objc_msgSend(*(id *)(a1 + 40), "serviceRespondsToMap", (void)v18);
    [v17 setObject:v16 forKeyedSubscript:*(void *)(a1 + 48)];
  }
  objc_msgSend(*(id *)(a1 + 40), "_saveMapping", (void)v18);
LABEL_20:
}

void sub_10002B4B0(uint64_t a1)
{
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id obj = *(id *)(a1 + 32);
  id v2 = [obj countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v2)
  {
    id v3 = v2;
    uint64_t v4 = *(void *)v17;
    do
    {
      char v5 = 0;
      do
      {
        if (*(void *)v17 != v4) {
          objc_enumerationMutation(obj);
        }
        uint64_t v6 = *(void *)(*((void *)&v16 + 1) + 8 * (void)v5);
        CFStringRef v7 = [*(id *)(a1 + 40) clientToObserverEndpointMap];
        uint64_t v8 = [v7 objectForKeyedSubscript:v6];

        id v9 = [v8 mutableCopy];
        if (!v9) {
          id v9 = (id)objc_opt_new();
        }
        [v9 addObject:*(void *)(a1 + 48)];
        id v10 = [v9 copy];

        id v11 = [*(id *)(a1 + 40) clientToObserverEndpointMap];
        [v11 setObject:v10 forKeyedSubscript:v6];

        id v12 = +[NSNumber numberWithUnsignedInteger:*(void *)(a1 + 56)];
        CFStringRef v13 = [*(id *)(a1 + 40) listenerRespondsToMap];
        CFStringRef v14 = +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", [*(id *)(a1 + 48) hash]);
        [v13 setObject:v12 forKeyedSubscript:v14];

        char v5 = (char *)v5 + 1;
      }
      while (v3 != v5);
      id v3 = [obj countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v3);
  }
}

void sub_10002B750(uint64_t a1)
{
  id v2 = sub_100004B28((uint64_t)off_100109BB8);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = *(void *)(a1 + 32);
    int v5 = 136315394;
    uint64_t v6 = "-[IXSAppInstallObserverManager registerClientConnection:]_block_invoke";
    __int16 v7 = 2112;
    uint64_t v8 = v3;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "%s: Adding client %@", (uint8_t *)&v5, 0x16u);
  }

  uint64_t v4 = [*(id *)(a1 + 40) clientConnections];
  [v4 addObject:*(void *)(a1 + 32)];
}

void sub_10002B8E8(uint64_t a1)
{
  id v2 = sub_100004B28((uint64_t)off_100109BB8);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = *(void *)(a1 + 32);
    int v5 = 136315394;
    uint64_t v6 = "-[IXSAppInstallObserverManager unregisterClientConnection:]_block_invoke";
    __int16 v7 = 2112;
    uint64_t v8 = v3;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "%s: Removing client %@", (uint8_t *)&v5, 0x16u);
  }

  uint64_t v4 = [*(id *)(a1 + 40) clientConnections];
  [v4 removeObject:*(void *)(a1 + 32)];
}

void sub_10002BC88(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,id a23)
{
  objc_destroyWeak(v24);
  objc_destroyWeak(&location);
  objc_destroyWeak(v23);
  objc_destroyWeak(&a23);
  _Unwind_Resume(a1);
}

void sub_10002BCC8(uint64_t a1)
{
  id v2 = sub_100004B28((uint64_t)off_100109BB8);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = *(void *)(a1 + 32);
    int v5 = 136315394;
    uint64_t v6 = "-[IXSAppInstallObserverManager _onQueue_connectionForServiceName:]_block_invoke";
    __int16 v7 = 2112;
    uint64_t v8 = v3;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "%s: Connection interrupted to %@", (uint8_t *)&v5, 0x16u);
  }

  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  [WeakRetained invalidate];
}

void sub_10002BDA4(uint64_t a1)
{
  id v2 = sub_100004B28((uint64_t)off_100109BB8);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = *(void *)(a1 + 32);
    *(_DWORD *)buf = 136315394;
    id v10 = "-[IXSAppInstallObserverManager _onQueue_connectionForServiceName:]_block_invoke";
    __int16 v11 = 2112;
    uint64_t v12 = v3;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "%s: Connection invalidated to %@", buf, 0x16u);
  }

  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  int v5 = WeakRetained;
  if (WeakRetained)
  {
    uint64_t v6 = [WeakRetained internalQueue];
    v7[0] = _NSConcreteStackBlock;
    v7[1] = 3221225472;
    v7[2] = sub_10002BF04;
    v7[3] = &unk_1000E8E08;
    v7[4] = v5;
    id v8 = *(id *)(a1 + 32);
    dispatch_async(v6, v7);
  }
}

void sub_10002BF04(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) serviceToConnectionMap];
  [v2 removeObjectForKey:*(void *)(a1 + 40)];
}

void sub_10002C288(uint64_t a1)
{
  id v2 = sub_100004B28((uint64_t)off_100109BB8);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = *(void *)(a1 + 32);
    int v4 = 136315394;
    int v5 = "-[IXSAppInstallObserverManager _onQueue_connectionForObserverEndpoint:]_block_invoke";
    __int16 v6 = 2112;
    uint64_t v7 = v3;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "%s: Connection interrupted to %@", (uint8_t *)&v4, 0x16u);
  }
}

void sub_10002C350(uint64_t a1)
{
  id v2 = sub_100004B28((uint64_t)off_100109BB8);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG)) {
    sub_10008F688(a1, v2);
  }
}

void sub_10002C5D0(uint64_t a1)
{
  id v2 = objc_opt_new();
  long long v70 = 0u;
  long long v71 = 0u;
  long long v72 = 0u;
  long long v73 = 0u;
  id obj = *(id *)(a1 + 32);
  id v54 = v2;
  id v52 = [obj countByEnumeratingWithState:&v70 objects:v83 count:16];
  if (v52)
  {
    uint64_t v50 = *(void *)v71;
    do
    {
      uint64_t v3 = 0;
      do
      {
        if (*(void *)v71 != v50) {
          objc_enumerationMutation(obj);
        }
        uint64_t v53 = v3;
        uint64_t v4 = *(void *)(*((void *)&v70 + 1) + 8 * v3);
        int v5 = [*(id *)(a1 + 40) clientToObserverServiceNameMap];
        __int16 v6 = [v5 objectForKeyedSubscript:v4];

        long long v68 = 0u;
        long long v69 = 0u;
        long long v66 = 0u;
        long long v67 = 0u;
        id v7 = v6;
        id v8 = [v7 countByEnumeratingWithState:&v66 objects:v82 count:16];
        if (v8)
        {
          id v9 = v8;
          uint64_t v10 = *(void *)v67;
          do
          {
            for (i = 0; i != v9; i = (char *)i + 1)
            {
              if (*(void *)v67 != v10) {
                objc_enumerationMutation(v7);
              }
              uint64_t v12 = *(void **)(*((void *)&v66 + 1) + 8 * i);
              if (([v2 containsObject:v12] & 1) == 0)
              {
                CFStringRef v13 = [*(id *)(a1 + 40) serviceRespondsToMap];
                CFStringRef v14 = [v13 objectForKeyedSubscript:v12];
                unint64_t v15 = (unint64_t)[v14 unsignedIntegerValue];

                unint64_t v16 = *(void *)(a1 + 56) & v15;
                long long v17 = sub_100004B28((uint64_t)off_100109BB8);
                BOOL v18 = os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT);
                if (v16)
                {
                  if (v18)
                  {
                    long long v19 = sub_10002AB7C(*(void *)(a1 + 56));
                    *(_DWORD *)buf = 136315650;
                    v77 = "-[IXSAppInstallObserverManager _messageInterestedServicesForClientIDs:forMethod:callMethodOnPr"
                          "oxy:]_block_invoke";
                    __int16 v78 = 2112;
                    __int16 v79 = v12;
                    __int16 v80 = 2112;
                    v81 = v19;
                    _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "%s: Notifying service %@ for selector %@", buf, 0x20u);
                  }
                  long long v20 = *(void **)(a1 + 40);
                  uint64_t v21 = *(void *)(a1 + 48);
                  v65[0] = _NSConcreteStackBlock;
                  v65[1] = 3221225472;
                  v65[2] = sub_10002CCD0;
                  v65[3] = &unk_1000E98F8;
                  uint64_t v22 = *(void *)(a1 + 56);
                  void v65[4] = v12;
                  v65[5] = v22;
                  objc_msgSend(v20, "_onQueue_callRemoteObjectProxyForServiceName:errorHandler:callHandler:", v12, v65, v21);
                  id v2 = v54;
                  [v54 addObject:v12];
                }
                else
                {
                  if (v18)
                  {
                    id v23 = sub_10002AB7C(*(void *)(a1 + 56));
                    *(_DWORD *)buf = 136315650;
                    v77 = "-[IXSAppInstallObserverManager _messageInterestedServicesForClientIDs:forMethod:callMethodOnPr"
                          "oxy:]_block_invoke";
                    __int16 v78 = 2112;
                    __int16 v79 = v12;
                    __int16 v80 = 2112;
                    v81 = v23;
                    _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "%s: Not notifying service %@ because it doesn't implement selector for %@", buf, 0x20u);
                  }
                  id v2 = v54;
                }
              }
            }
            id v9 = [v7 countByEnumeratingWithState:&v66 objects:v82 count:16];
          }
          while (v9);
        }

        uint64_t v3 = v53 + 1;
      }
      while ((id)(v53 + 1) != v52);
      id v52 = [obj countByEnumeratingWithState:&v70 objects:v83 count:16];
    }
    while (v52);
  }

  unsigned __int8 v24 = objc_opt_new();
  long long v61 = 0u;
  long long v62 = 0u;
  long long v63 = 0u;
  long long v64 = 0u;
  id v46 = *(id *)(a1 + 32);
  id obja = [v46 countByEnumeratingWithState:&v61 objects:v75 count:16];
  if (obja)
  {
    uint64_t v47 = *(void *)v62;
    do
    {
      uint64_t v25 = 0;
      do
      {
        if (*(void *)v62 != v47) {
          objc_enumerationMutation(v46);
        }
        uint64_t v51 = v25;
        uint64_t v26 = *(void *)(*((void *)&v61 + 1) + 8 * v25);
        id v27 = [*(id *)(a1 + 40) clientToObserverEndpointMap];
        id v28 = [v27 objectForKeyedSubscript:v26];

        long long v59 = 0u;
        long long v60 = 0u;
        long long v57 = 0u;
        long long v58 = 0u;
        id v55 = v28;
        id v29 = [v55 countByEnumeratingWithState:&v57 objects:v74 count:16];
        if (v29)
        {
          id v30 = v29;
          uint64_t v31 = *(void *)v58;
          do
          {
            for (j = 0; j != v30; j = (char *)j + 1)
            {
              if (*(void *)v58 != v31) {
                objc_enumerationMutation(v55);
              }
              id v33 = *(void **)(*((void *)&v57 + 1) + 8 * (void)j);
              if (([v24 containsObject:v33] & 1) == 0)
              {
                id v34 = [*(id *)(a1 + 40) listenerRespondsToMap];
                id v35 = +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", [v33 hash]);
                uint64_t v36 = [v34 objectForKeyedSubscript:v35];
                unint64_t v37 = (unint64_t)[v36 unsignedIntegerValue];

                unint64_t v38 = *(void *)(a1 + 56) & v37;
                long long v39 = sub_100004B28((uint64_t)off_100109BB8);
                BOOL v40 = os_log_type_enabled(v39, OS_LOG_TYPE_DEFAULT);
                if (v38)
                {
                  if (v40)
                  {
                    uint64_t v41 = sub_10002AB7C(*(void *)(a1 + 56));
                    *(_DWORD *)buf = 136315650;
                    v77 = "-[IXSAppInstallObserverManager _messageInterestedServicesForClientIDs:forMethod:callMethodOnPr"
                          "oxy:]_block_invoke";
                    __int16 v78 = 2112;
                    __int16 v79 = v33;
                    __int16 v80 = 2112;
                    v81 = v41;
                    _os_log_impl((void *)&_mh_execute_header, v39, OS_LOG_TYPE_DEFAULT, "%s: Notifying endpoint %@ for selector %@", buf, 0x20u);
                  }
                  __int16 v42 = *(void **)(a1 + 40);
                  uint64_t v43 = *(void *)(a1 + 48);
                  v56[0] = _NSConcreteStackBlock;
                  v56[1] = 3221225472;
                  v56[2] = sub_10002CD40;
                  v56[3] = &unk_1000E98F8;
                  uint64_t v44 = *(void *)(a1 + 56);
                  v56[4] = v33;
                  v56[5] = v44;
                  objc_msgSend(v42, "_onQueue_callRemoteObjectProxyForServiceEndpoint:errorHandler:callHandler:", v33, v56, v43);
                  [v24 addObject:v33];
                }
                else
                {
                  if (v40)
                  {
                    int v45 = sub_10002AB7C(*(void *)(a1 + 56));
                    *(_DWORD *)buf = 136315650;
                    v77 = "-[IXSAppInstallObserverManager _messageInterestedServicesForClientIDs:forMethod:callMethodOnPr"
                          "oxy:]_block_invoke";
                    __int16 v78 = 2112;
                    __int16 v79 = v33;
                    __int16 v80 = 2112;
                    v81 = v45;
                    _os_log_impl((void *)&_mh_execute_header, v39, OS_LOG_TYPE_DEFAULT, "%s: Not notifying endpoint %@ because it doesn't implement selector for %@", buf, 0x20u);
                  }
                }
              }
            }
            id v30 = [v55 countByEnumeratingWithState:&v57 objects:v74 count:16];
          }
          while (v30);
        }

        uint64_t v25 = v51 + 1;
      }
      while ((id)(v51 + 1) != obja);
      id obja = [v46 countByEnumeratingWithState:&v61 objects:v75 count:16];
    }
    while (obja);
  }
}

void sub_10002CCD0(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = sub_100004B28((uint64_t)off_100109BB8);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    sub_10008F718(a1);
  }
}

void sub_10002CD40(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = sub_100004B28((uint64_t)off_100109BB8);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    sub_10008F7C0(a1);
  }
}

void sub_10002CE64(uint64_t a1)
{
  long long v7 = 0u;
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  id v2 = objc_msgSend(*(id *)(a1 + 32), "clientConnections", 0);
  id v3 = (char *)[v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v8;
    do
    {
      __int16 v6 = 0;
      do
      {
        if (*(void *)v8 != v5) {
          objc_enumerationMutation(v2);
        }
        (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
        ++v6;
      }
      while (v4 != v6);
      uint64_t v4 = (char *)[v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
    }
    while (v4);
  }
}

void sub_10002D0F4(uint64_t a1, void *a2)
{
  id v2 = *(void **)(a1 + 32);
  id v3 = a2;
  id v4 = [v2 seed];
  objc_msgSend(v3, "_client_coordinatorShouldPrioritizeWithSeed:", v4);
}

id sub_10002D158(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "_client_coordinatorShouldPrioritizeWithUUID:", *(void *)(a1 + 32));
}

void sub_10002D27C(uint64_t a1, void *a2)
{
  id v2 = *(void **)(a1 + 32);
  id v3 = a2;
  id v4 = [v2 bundleID];
  objc_msgSend(v3, "_client_shouldPrioritizeAppWithBundleID:", v4);
}

id sub_10002D2E0(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "_client_shouldPrioritizeAppWithIdentity:", *(void *)(a1 + 32));
}

void sub_10002D47C(uint64_t a1, void *a2)
{
  id v2 = *(void **)(a1 + 32);
  id v3 = a2;
  id v4 = [v2 seed];
  objc_msgSend(v3, "_client_coordinatorShouldResumeWithSeed:", v4);
}

id sub_10002D4E0(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "_client_coordinatorShouldResumeWithUUID:", *(void *)(a1 + 32));
}

void sub_10002D67C(uint64_t a1, void *a2)
{
  id v2 = *(void **)(a1 + 32);
  id v3 = a2;
  id v4 = [v2 seed];
  objc_msgSend(v3, "_client_coordinatorShouldPauseWithSeed:", v4);
}

id sub_10002D6E0(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "_client_coordinatorShouldPauseWithUUID:", *(void *)(a1 + 32));
}

void sub_10002D880(uint64_t a1, void *a2)
{
  id v3 = *(void **)(a1 + 32);
  id v4 = a2;
  id v5 = [v3 seed];
  objc_msgSend(v4, "_client_coordinatorWithSeed:configuredPromiseDidBeginFulfillment:", v5, *(void *)(a1 + 40));
}

id sub_10002D8F4(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "_client_coordinatorWithUUID:configuredPromiseDidBeginFulfillment:", *(void *)(a1 + 32), *(void *)(a1 + 40));
}

void sub_10002DA68(uint64_t a1, void *a2)
{
  id v2 = *(void **)(a1 + 32);
  id v3 = a2;
  id v4 = [v2 seed];
  objc_msgSend(v3, "_client_coordinatorShouldBeginRestoringUserDataWithSeed:", v4);
}

id sub_10002DACC(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "_client_coordinatorShouldBeginRestoringUserDataWithUUID:", *(void *)(a1 + 32));
}

void sub_10002DCA4(uint64_t a1, void *a2)
{
  id v3 = *(void **)(a1 + 32);
  id v4 = a2;
  id v5 = [v3 seed];
  objc_msgSend(v4, "_client_coordinatorDidInstallPlaceholderWithSeed:forRecordPromise:", v5, *(void *)(a1 + 40));
}

id sub_10002DD18(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "_client_coordinatorDidInstallPlaceholderWithUUID:forRecordPromise:", *(void *)(a1 + 32), *(void *)(a1 + 40));
}

void sub_10002DED4(uint64_t a1, void *a2)
{
  id v3 = *(void **)(a1 + 32);
  id v4 = a2;
  id v5 = [v3 seed];
  objc_msgSend(v4, "_client_coordinatorShouldBeginPostProcessingWithSeed:forRecordPromise:", v5, *(void *)(a1 + 40));
}

id sub_10002DF48(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "_client_coordinatorShouldBeginPostProcessingWithUUID:forRecordPromise:", *(void *)(a1 + 32), *(void *)(a1 + 40));
}

void sub_10002E120(uint64_t a1, void *a2)
{
  id v3 = *(void **)(a1 + 32);
  id v4 = a2;
  id v5 = [v3 seed];
  objc_msgSend(v4, "_client_coordinatorDidCompleteSuccessfullyWithSeed:forRecordPromise:", v5, *(void *)(a1 + 40));
}

id sub_10002E194(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "_client_coordinatorDidCompleteSuccessfullyWithUUID:forRecordPromise:", *(void *)(a1 + 32), *(void *)(a1 + 40));
}

void sub_10002E37C(void *a1, void *a2)
{
  id v3 = (void *)a1[4];
  id v4 = a2;
  id v5 = [v3 seed];
  objc_msgSend(v4, "_client_coordinatorWithSeed:didCancelWithReason:client:", v5, a1[5], a1[6]);
}

id sub_10002E3F0(void *a1, void *a2)
{
  return objc_msgSend(a2, "_client_coordinatorWithUUID:didCancelWithReason:client:", a1[4], a1[5], a1[6]);
}

id sub_10002E4BC(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "_client_coordinatorWithUUID:didUpdateProgress:forPhase:overallProgress:", *(void *)(a1 + 32), *(void *)(a1 + 48), *(double *)(a1 + 40), *(double *)(a1 + 56));
}

id sub_10002E570(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "_client_promiseDidCompleteSuccessfullyWithUUID:", *(void *)(a1 + 32));
}

id sub_10002E64C(void *a1, void *a2)
{
  return objc_msgSend(a2, "_client_promiseWithUUID:didCancelWithReason:client:", a1[4], a1[5], a1[6]);
}

void sub_10002E738(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 0xCu);
}

void sub_10002EFA8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v9 - 96), 8);
  _Unwind_Resume(a1);
}

uint64_t sub_10002EFCC(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void sub_10002EFDC(uint64_t a1)
{
}

void sub_10002EFE4(void *a1)
{
  id v2 = (void *)a1[4];
  uint64_t v3 = *(void *)(a1[5] + 8);
  id obj = *(id *)(v3 + 40);
  unsigned __int8 v4 = objc_msgSend(v2, "_onQueue_initWithSeedWithError:", &obj);
  objc_storeStrong((id *)(v3 + 40), obj);
  if ((v4 & 1) == 0) {
    *(unsigned char *)(*(void *)(a1[6] + 8) + 24) = 1;
  }
}

id sub_10002F1C8(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_internal_setStagedPath:", *(void *)(a1 + 40));
}

void sub_100030034(uint64_t a1)
{
  id v2 = (id *)(a1 + 32);
  uint64_t v3 = [*(id *)(a1 + 32) path];
  id v5 = *(void **)(a1 + 40);
  unsigned __int8 v4 = (id *)(a1 + 40);
  __int16 v6 = [v5 seed];
  long long v7 = [v6 stagingBaseDir];
  long long v8 = [v7 path];
  unsigned __int8 v9 = [v3 hasPrefix:v8];

  if (v9)
  {
    id v10 = *v2;
    id v11 = *v4;
    [v11 setStagedPath:v10];
  }
  else
  {
    uint64_t v12 = sub_100004B28((uint64_t)off_100109BB8);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
      sub_10008FAF8(v2, v4, v12);
    }

    CFStringRef v13 = [*v2 path];
    CFStringRef v14 = [*v4 seed];
    unint64_t v15 = [v14 stagingBaseDir];
    BOOL v18 = [v15 path];
    long long v17 = sub_10003DAE4((uint64_t)"-[IXSOwnedDataPromise(IXSOwnedDataPromiseIPCMethods) _remote_setStagedPath:]_block_invoke", 376, @"IXErrorDomain", 1uLL, 0, 0, @"Attempt to set the stagedPath to %@ which does not start with the staged item prefix %@", v16, (uint64_t)v13);

    [*v4 cancelForReason:v17 client:15 error:0];
  }
}

void sub_10003034C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t sub_100030364(uint64_t a1)
{
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = [*(id *)(a1 + 32) stagedPath];

  return _objc_release_x1();
}

id sub_100030548(uint64_t a1)
{
  return [*(id *)(a1 + 32) setTargetLastPathComponent:*(void *)(a1 + 40)];
}

void sub_100030674(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t sub_10003068C(uint64_t a1)
{
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = [*(id *)(a1 + 32) targetLastPathComponent];

  return _objc_release_x1();
}

id IXStringForClientID(unint64_t a1)
{
  if (a1 >= 0x1D)
  {
    uint64_t v1 = +[NSString stringWithFormat:@"Unknown IXClientIdentifier: %lu", a1];
  }
  else
  {
    uint64_t v1 = *(&off_1000E9AD0 + a1);
  }

  return v1;
}

id sub_100031064()
{
  if (qword_100109E68 != -1) {
    dispatch_once(&qword_100109E68, &stru_1000E9BB8);
  }
  int v0 = (void *)qword_100109E60;

  return v0;
}

void sub_1000310B8(id a1)
{
  uint64_t v1 = +[IXGlobalConfiguration sharedInstance];
  id v2 = [v1 frameworkURL];

  uint64_t v3 = +[NSBundle bundleWithURL:v2];
  unsigned __int8 v4 = (void *)qword_100109E60;
  qword_100109E60 = v3;

  if (!qword_100109E60)
  {
    id v5 = sub_100004B28((uint64_t)off_100109BB8);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      sub_10009003C();
    }
  }
}

CFStringRef sub_100031160(uint64_t a1)
{
  if ((unint64_t)(a1 - 1) > 0x11) {
    return @"kIXUserPresentableUnknownError";
  }
  else {
    return *(&off_1000E9CA8 + a1 - 1);
  }
}

void IXPresentErrorHighlightingLocalizedAppName(void *a1, void *a2, void *a3, uint64_t a4, void *a5, void *a6)
{
  id v11 = a1;
  id v12 = a2;
  id v13 = a3;
  id v14 = a5;
  id v15 = a6;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000312D0;
  block[3] = &unk_1000E9C20;
  id v27 = [v13 count];
  uint64_t v28 = a4;
  id v22 = v11;
  id v23 = v15;
  id v25 = v13;
  id v26 = v14;
  id v24 = v12;
  id v16 = v13;
  id v17 = v12;
  id v18 = v14;
  id v19 = v15;
  id v20 = v11;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
}

void sub_1000312D0(uint64_t a1)
{
  id v2 = sub_100031064();
  uint64_t v3 = +[NSMutableDictionary dictionary];
  [v3 setObject:&__kCFBooleanTrue forKeyedSubscript:@"DismissOnLock"];
  [v3 setObject:&__kCFBooleanTrue forKeyedSubscript:@"SBUserNotificationAllowMenuButtonDismissal"];
  unsigned __int8 v4 = sub_1000318BC(*(void **)(a1 + 32), *(void *)(a1 + 72), *(void *)(a1 + 80));
  [v3 setObject:v4 forKeyedSubscript:kCFUserNotificationAlertHeaderKey];

  uint64_t v5 = *(void *)(a1 + 80);
  if (v5 == 16) {
    sub_1000319A8(*(void **)(a1 + 40), *(void **)(a1 + 32), *(void *)(a1 + 72));
  }
  else {
  __int16 v6 = sub_100031AFC(*(void **)(a1 + 32), *(void *)(a1 + 72), v5);
  }
  [v3 setObject:v6 forKeyedSubscript:kCFUserNotificationAlertMessageKey];

  switch(*(void *)(a1 + 80))
  {
    case 4:
    case 5:
    case 6:
    case 7:
    case 8:
    case 9:
    case 0xDLL:
    case 0xFLL:
    case 0x11:
    case 0x12:
      if (*(void *)(a1 + 72) != 1) {
        goto LABEL_10;
      }
      long long v7 = [v2 localizedStringForKey:@"BUTTON_TITLE_DELETE" value:&stru_1000ED390 table:@"IXUserPresentableErrors"];
      [v3 setObject:v7 forKeyedSubscript:kCFUserNotificationDefaultButtonTitleKey];

      [v3 setObject:&off_1000F4BE0 forKeyedSubscript:@"SBUserNotificationDefaultButtonPresentationStyle"];
      long long v8 = [v2 localizedStringForKey:@"BUTTON_TITLE_KEEP" value:&stru_1000ED390 table:@"IXUserPresentableErrors"];
      [v3 setObject:v8 forKeyedSubscript:kCFUserNotificationAlternateButtonTitleKey];

      v26[0] = _NSConcreteStackBlock;
      v26[1] = 3221225472;
      v26[2] = sub_100031D44;
      v26[3] = &unk_1000E91E0;
      id v27 = *(id *)(a1 + 64);
      unsigned __int8 v9 = objc_retainBlock(v26);
      id v10 = v27;
      goto LABEL_7;
    case 0xALL:
      if (*(void *)(a1 + 72) != 1) {
        goto LABEL_10;
      }
      id v11 = [v2 localizedStringForKey:@"BUTTON_TITLE_VIEW_IN_APP_STORE" value:&stru_1000ED390 table:@"IXUserPresentableErrors"];
      [v3 setObject:v11 forKeyedSubscript:kCFUserNotificationDefaultButtonTitleKey];

      id v12 = [v2 localizedStringForKey:@"BUTTON_TITLE_OK" value:&stru_1000ED390 table:@"IXUserPresentableErrors"];
      [v3 setObject:v12 forKeyedSubscript:kCFUserNotificationAlternateButtonTitleKey];

      v22[0] = _NSConcreteStackBlock;
      v22[1] = 3221225472;
      v22[2] = sub_100031D5C;
      v22[3] = &unk_1000E9738;
      uint64_t v25 = *(void *)(a1 + 72);
      id v23 = *(id *)(a1 + 48);
      id v24 = *(id *)(a1 + 56);
      unsigned __int8 v9 = objc_retainBlock(v22);

      id v10 = v23;
LABEL_7:

      break;
    case 0xBLL:
      id v18 = [v2 localizedStringForKey:@"BUTTON_TITLE_SETTINGS" value:&stru_1000ED390 table:@"IXUserPresentableErrors"];
      [v3 setObject:v18 forKeyedSubscript:kCFUserNotificationDefaultButtonTitleKey];

      id v19 = [v2 localizedStringForKey:@"BUTTON_TITLE_OK" value:&stru_1000ED390 table:@"IXUserPresentableErrors"];
      [v3 setObject:v19 forKeyedSubscript:kCFUserNotificationAlternateButtonTitleKey];

      unsigned __int8 v9 = &stru_1000E9BD8;
      break;
    case 0x10:
      id v20 = [v2 localizedStringForKey:@"BUTTON_TITLE_SETTINGS" value:&stru_1000ED390 table:@"IXUserPresentableErrors"];
      [v3 setObject:v20 forKeyedSubscript:kCFUserNotificationDefaultButtonTitleKey];

      uint64_t v21 = [v2 localizedStringForKey:@"BUTTON_TITLE_OK" value:&stru_1000ED390 table:@"IXUserPresentableErrors"];
      [v3 setObject:v21 forKeyedSubscript:kCFUserNotificationAlternateButtonTitleKey];

      unsigned __int8 v9 = &stru_1000E9BF8;
      break;
    default:
LABEL_10:
      id v13 = [v2 localizedStringForKey:@"BUTTON_TITLE_OK" value:&stru_1000ED390 table:@"IXUserPresentableErrors"];
      [v3 setObject:v13 forKeyedSubscript:kCFUserNotificationDefaultButtonTitleKey];

      unsigned __int8 v9 = 0;
      break;
  }
  if (*(void *)(a1 + 72) == 1) {
    [*(id *)(a1 + 56) objectAtIndexedSubscript:0];
  }
  else {
  id v14 = +[NSString stringWithFormat:@"<%lu bundleIDs>", *(void *)(a1 + 72)];
  }
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100032204;
  block[3] = &unk_1000E9C48;
  id v29 = v3;
  id v30 = v14;
  uint64_t v31 = v9;
  id v32 = 0;
  id v15 = v9;
  id v16 = v3;
  id v17 = v14;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
}

id sub_1000318BC(void *a1, unint64_t a2, uint64_t a3)
{
  id v5 = a1;
  __int16 v6 = sub_100031160(a3);
  long long v7 = v6;
  if (a2 >= 2) {
    CFStringRef v8 = @"_TITLE_MULTIPLE";
  }
  else {
    CFStringRef v8 = @"_TITLE";
  }
  unsigned __int8 v9 = [v6 stringByAppendingString:v8];
  id v10 = sub_100031064();
  id v11 = [v10 localizedStringForKey:v9 value:&stru_1000ED390 table:@"IXUserPresentableErrors"];

  id v12 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", v11, v5);

  return v12;
}

id sub_1000319A8(void *a1, void *a2, unint64_t a3)
{
  id v5 = a1;
  id v6 = a2;
  if (v5)
  {
    long long v7 = [v5 userInfo];
    CFStringRef v8 = [v7 objectForKeyedSubscript:MIRequiredOSVersionErrorKey];

    unsigned __int8 v9 = [v5 userInfo];
    id v10 = [v9 objectForKeyedSubscript:MIRequiredOSErrorKey];

    id v11 = @"kIXUserPresentableDeviceOSVersionTooLowError";
    if (v10)
    {
      if ([v10 unsignedIntegerValue] != (id)1 && a3 < 2) {
        id v11 = @"kIXUserPresentableDeviceOSVersionTooLowDiffPlatformError";
      }
    }
  }
  else
  {
    id v13 = sub_100004B28((uint64_t)off_100109BB8);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
      sub_1000900BC();
    }

    CFStringRef v8 = 0;
    id v11 = @"kIXUserPresentableDeviceOSVersionTooLowError";
  }
  id v14 = sub_1000320F8(v11, v8, v6, a3);

  return v14;
}

id sub_100031AFC(void *a1, unint64_t a2, uint64_t a3)
{
  id v5 = a1;
  id v6 = sub_100031160(a3);
  long long v7 = sub_1000320F8(v6, v5, v5, a2);

  return v7;
}

void sub_100031B74(id a1)
{
  uint64_t v1 = +[NSURL URLWithString:@"prefs:root=General&path=STORAGE_MGMT"];
  id v2 = +[LSApplicationWorkspace defaultWorkspace];
  id v6 = 0;
  unsigned __int8 v3 = [v2 openSensitiveURL:v1 withOptions:0 error:&v6];
  id v4 = v6;

  if ((v3 & 1) == 0)
  {
    id v5 = sub_100004B28((uint64_t)off_100109BB8);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      sub_10009014C();
    }
  }
}

void sub_100031C3C(id a1)
{
  uint64_t v1 = +[NSURL URLWithString:@"prefs:root=General&path=SOFTWARE_UPDATE_LINK"];
  id v2 = +[LSApplicationWorkspace defaultWorkspace];
  unsigned __int8 v3 = [v2 openSensitiveURL:v1 withOptions:0];

  if ((v3 & 1) == 0)
  {
    id v4 = sub_100004B28((uint64_t)off_100109BB8);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      int v5 = 136315138;
      id v6 = "IXPresentErrorHighlightingLocalizedAppName_block_invoke";
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "%s: Failed to open software update Settings", (uint8_t *)&v5, 0xCu);
    }
  }
}

uint64_t sub_100031D44(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

void sub_100031D5C(uint64_t a1)
{
  if (*(void *)(a1 + 48) == 1
    && (id v2 = *(void **)(a1 + 32)) != 0
    && ([v2 iTunesMetadata],
        unsigned __int8 v3 = objc_claimAutoreleasedReturnValue(),
        id v4 = [v3 storeItemIdentifier],
        v3,
        v4))
  {
    id v5 = objc_alloc_init((Class)NSURLComponents);
    id v6 = [objc_alloc((Class)NSURLQueryItem) initWithName:@"action" value:@"lookup"];
    id v7 = objc_alloc((Class)NSURLQueryItem);
    CFStringRef v8 = +[NSString stringWithFormat:@"%llu", v4];
    id v9 = [v7 initWithName:@"ids" value:v8];

    [v5 setScheme:@"itms-apps"];
    [v5 setHost:&stru_1000ED390];
    v15[0] = v6;
    v15[1] = v9;
    id v10 = +[NSArray arrayWithObjects:v15 count:2];
    [v5 setQueryItems:v10];

    id v11 = [v5 URL];

    id v12 = +[LSApplicationWorkspace defaultWorkspace];
    v13[0] = _NSConcreteStackBlock;
    v13[1] = 3221225472;
    v13[2] = sub_100031FFC;
    v13[3] = &unk_1000E9300;
    id v14 = *(id *)(a1 + 40);
    [v12 openURL:v11 configuration:0 completionHandler:v13];
  }
  else
  {
    sub_100031FA0();
  }
}

void sub_100031FA0()
{
  id v0 = +[LSApplicationWorkspace defaultWorkspace];
  [v0 openApplicationWithBundleIdentifier:@"com.apple.AppStore" configuration:0 completionHandler:&stru_1000E9C88];
}

void sub_100031FFC(uint64_t a1, uint64_t a2, void *a3)
{
  id v4 = a3;
  if (v4)
  {
    id v5 = sub_100004B28((uint64_t)off_100109BB8);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      id v6 = [*(id *)(a1 + 32) objectAtIndexedSubscript:0];
      int v7 = 136315650;
      CFStringRef v8 = "IXPresentErrorHighlightingLocalizedAppName_block_invoke_3";
      __int16 v9 = 2112;
      id v10 = v6;
      __int16 v11 = 2112;
      id v12 = v4;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "%s: Failed to open app with bundle ID %@ in the App Store. Error: %@", (uint8_t *)&v7, 0x20u);
    }
  }
}

id sub_1000320F8(void *a1, void *a2, void *a3, unint64_t a4)
{
  id v7 = a1;
  id v8 = a2;
  id v9 = a3;
  if (a4 >= 2) {
    CFStringRef v10 = @"_BODY_MULTIPLE";
  }
  else {
    CFStringRef v10 = @"_BODY";
  }
  __int16 v11 = [v7 stringByAppendingString:v10];
  id v12 = sub_100031064();
  id v13 = [v12 localizedStringForKey:v11 value:&stru_1000ED390 table:@"IXUserPresentableErrors"];

  if (a4 > 1) {
    +[NSString stringWithFormat:](NSString, "stringWithFormat:", v13, v9, a4 - 1);
  }
  else {
  id v14 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", v13, v8, v16);
  }

  return v14;
}

void sub_100032204(uint64_t a1)
{
  SInt32 error = 0;
  id v2 = CFUserNotificationCreate(kCFAllocatorDefault, 0.0, 2uLL, &error, *(CFDictionaryRef *)(a1 + 32));
  if (v2)
  {
    unsigned __int8 v3 = v2;
    CFOptionFlags v13 = 0;
    if (CFUserNotificationReceiveResponse(v2, 0.0, &v13))
    {
      id v4 = sub_100004B28((uint64_t)off_100109BB8);
      if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v5 = *(void *)(a1 + 40);
        *(_DWORD *)buf = 136315650;
        uint64_t v16 = "_ShowUserNotice_block_invoke";
        __int16 v17 = 2112;
        uint64_t v18 = v5;
        __int16 v19 = 1024;
        SInt32 v20 = error;
        id v6 = "%s: Failed to recieve notification response for error presentation alert for app with bundle ID %@, error code %d";
        id v7 = v4;
        uint32_t v8 = 28;
LABEL_5:
        _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, v6, buf, v8);
      }
    }
    else
    {
      if (v13 != 2)
      {
        if (v13 == 1)
        {
          uint64_t v11 = *(void *)(a1 + 56);
          if (!v11) {
            goto LABEL_7;
          }
        }
        else
        {
          if (v13) {
            goto LABEL_7;
          }
          uint64_t v11 = *(void *)(a1 + 48);
          if (!v11) {
            goto LABEL_7;
          }
        }
        (*(void (**)(void))(v11 + 16))();
        goto LABEL_7;
      }
      id v4 = sub_100004B28((uint64_t)off_100109BB8);
      if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v12 = *(void *)(a1 + 40);
        *(_DWORD *)buf = 136315394;
        uint64_t v16 = "_ShowUserNotice_block_invoke";
        __int16 v17 = 2112;
        uint64_t v18 = v12;
        id v6 = "%s: Received an invalid response (kCFUserNotificationOtherResponse) from the error presentation alert for a"
             "pp with bundleID %@";
        id v7 = v4;
        uint32_t v8 = 22;
        goto LABEL_5;
      }
    }

LABEL_7:
    CFRelease(v3);
    return;
  }
  id v9 = sub_100004B28((uint64_t)off_100109BB8);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v10 = *(void *)(a1 + 40);
    *(_DWORD *)buf = 136315650;
    uint64_t v16 = "_ShowUserNotice_block_invoke";
    __int16 v17 = 2112;
    uint64_t v18 = v10;
    __int16 v19 = 1024;
    SInt32 v20 = error;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "%s: Failed to create error presentation alert for app with bundle ID %@, error code %d", buf, 0x1Cu);
  }
}

void sub_100032460(id a1, BOOL a2, NSError *a3)
{
  id v4 = a3;
  if (v4 && !a2)
  {
    uint64_t v5 = sub_100004B28((uint64_t)off_100109BB8);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      int v6 = 136315394;
      id v7 = "_LaunchAppStore_block_invoke";
      __int16 v8 = 2112;
      id v9 = v4;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "%s: Failed to open App Store : %@", (uint8_t *)&v6, 0x16u);
    }
  }
}

void sub_1000330CC(id a1)
{
  if (dlopen("/System/Library/PrivateFrameworks/HeadBoardModel.framework/HeadBoardModel", 1))
  {
    qword_100109E80 = (uint64_t)NSClassFromString(@"HBMCloudSyncUtility");
  }
  else
  {
    uint64_t v1 = dlerror();
    qword_100109E78 = sub_10003DAE4((uint64_t)"+[IXSAppUninstallAlert _loadHBMCloudSyncUtilityClass]_block_invoke", 107, @"IXErrorDomain", 1uLL, 0, 0, @"Failed to dlopen HeadBoardModel: %s", v2, (uint64_t)v1);
    _objc_release_x1();
  }
}

uint64_t sub_1000341DC(uint64_t a1, int a2)
{
  uint64_t v2 = *(void *)(a1 + 32);
  if (a2) {
    uint64_t v3 = 3;
  }
  else {
    uint64_t v3 = 1;
  }
  return (*(uint64_t (**)(uint64_t, uint64_t, void))(v2 + 16))(v2, v3, 0);
}

void sub_100034364(id a1)
{
  id v3 = [objc_alloc((Class)NSXPCListener) initWithMachServiceName:@"com.apple.installcoordinationd"];
  uint64_t v1 = objc_opt_new();
  uint64_t v2 = (void *)qword_100109E88;
  qword_100109E88 = v1;

  [v3 setDelegate:qword_100109E88];
  [v3 resume];
}

void sub_100034750(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,id location)
{
  objc_destroyWeak(v21);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_10003477C(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    id v3 = sub_100004B28((uint64_t)off_100109BB8);
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315394;
      CFOptionFlags v13 = "-[IXSClientConnectionManager listener:shouldAcceptNewConnection:]_block_invoke_2";
      __int16 v14 = 2112;
      id v15 = WeakRetained;
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "%s: Connection invalidated: %@", buf, 0x16u);
    }

    id v4 = [*(id *)(a1 + 32) allConnectionsQueue];
    int v6 = _NSConcreteStackBlock;
    uint64_t v7 = 3221225472;
    __int16 v8 = sub_1000348E4;
    id v9 = &unk_1000E8E08;
    uint64_t v10 = *(void *)(a1 + 32);
    id v5 = WeakRetained;
    id v11 = v5;
    dispatch_sync(v4, &v6);

    objc_msgSend(v5, "connectionInvalidated", v6, v7, v8, v9, v10);
  }
}

void sub_1000348E4(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) allConnections];
  [v2 removeObject:*(void *)(a1 + 40)];
}

void sub_100034938(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) allConnections];
  [v2 addObject:*(void *)(a1 + 40)];
}

void sub_100034C40(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t sub_100034C58(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void sub_100034C68(uint64_t a1)
{
}

void sub_100034C70(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) stagingBaseDir];
  id v3 = [v2 URLByAppendingPathComponent:@"Dictionary.plist" isDirectory:0];

  uint64_t v4 = a1 + 48;
  id v5 = *(void **)(a1 + 40);
  uint64_t v6 = *(void *)(*(void *)(a1 + 48) + 8);
  id obj = *(id *)(v6 + 40);
  unsigned __int8 v7 = objc_msgSend(v5, "IX_writeToURL:format:options:error:", v3, 200, 268435457, &obj);
  objc_storeStrong((id *)(v6 + 40), obj);
  if (v7)
  {
    objc_msgSend(*(id *)(a1 + 32), "_internal_setStagedPath:", v3);
    [*(id *)(a1 + 32) setComplete:1];
  }
  else
  {
    __int16 v8 = sub_100004B28((uint64_t)off_100109BB8);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      sub_100090278(v3, v4, v8);
    }

    id v9 = *(void **)(*(void *)(*(void *)v4 + 8) + 40);
    uint64_t v10 = [v3 path];
    uint64_t v12 = sub_10003DAE4((uint64_t)"-[IXSPromisedInMemoryDictionary initWithSeed:dictionary:error:]_block_invoke", 59, @"IXErrorDomain", 1uLL, v9, 0, @"Could not write dictionary promise dictionary to disk at %@", v11, (uint64_t)v10);

    uint64_t v13 = *(void *)(*(void *)v4 + 8);
    __int16 v14 = *(void **)(v13 + 40);
    *(void *)(v13 + 40) = v12;
  }
}

id sub_100034F3C()
{
  if (qword_100109E98)
  {
    id v0 = (id)qword_100109E98;
  }
  else
  {
    uint64_t v1 = +[IXGlobalConfiguration sharedInstance];
    id v6 = 0;
    id v2 = [v1 removabilityDirectoryWithError:&v6];
    id v3 = v6;

    if (v2)
    {
      id v0 = [v2 URLByAppendingPathComponent:@"RemovabilityMetadataWithMultipleSources.plist" isDirectory:0];
    }
    else
    {
      uint64_t v4 = sub_100004B28((uint64_t)off_100109BB8);
      if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
        sub_100090344();
      }

      id v0 = 0;
    }
  }

  return v0;
}

id sub_100035034()
{
  if (qword_100109EA0)
  {
    id v0 = (id)qword_100109EA0;
  }
  else
  {
    uint64_t v1 = +[IXGlobalConfiguration sharedInstance];
    id v6 = 0;
    id v2 = [v1 removabilityDirectoryWithError:&v6];
    id v3 = v6;

    if (v2)
    {
      id v0 = [v2 URLByAppendingPathComponent:@"ClockedRemovabilityMetadata.plist" isDirectory:0];
    }
    else
    {
      uint64_t v4 = sub_100004B28((uint64_t)off_100109BB8);
      if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
        sub_1000903B8();
      }

      id v0 = 0;
    }
  }

  return v0;
}

id sub_10003512C()
{
  if (qword_100109EB0)
  {
    id v0 = (id)qword_100109EB0;
  }
  else
  {
    uint64_t v1 = +[IXGlobalConfiguration sharedInstance];
    id v6 = 0;
    id v2 = [v1 removabilityDirectoryWithError:&v6];
    id v3 = v6;

    if (v2)
    {
      id v0 = [v2 URLByAppendingPathComponent:@"RemovabilityMetadata.plist" isDirectory:0];
    }
    else
    {
      uint64_t v4 = sub_100004B28((uint64_t)off_100109BB8);
      if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
        sub_10009042C();
      }

      id v0 = 0;
    }
  }

  return v0;
}

id sub_100035224()
{
  if (qword_100109EA8)
  {
    id v0 = (id)qword_100109EA8;
  }
  else
  {
    uint64_t v1 = +[IXGlobalConfiguration sharedInstance];
    id v6 = 0;
    id v2 = [v1 dataDirectoryWithError:&v6];
    id v3 = v6;

    if (v2)
    {
      id v0 = [v2 URLByAppendingPathComponent:@"removability.plist" isDirectory:0];
    }
    else
    {
      uint64_t v4 = sub_100004B28((uint64_t)off_100109BB8);
      if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
        sub_1000904A0();
      }

      id v0 = 0;
    }
  }

  return v0;
}

void sub_10003531C(id obj)
{
}

void sub_10003532C(id obj)
{
}

void sub_10003533C(id obj)
{
}

void sub_10003534C(id obj)
{
}

id sub_10003535C(void *a1, void *a2)
{
  id v3 = a2;
  id v4 = a1;
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  void v15[2] = sub_100035548;
  v15[3] = &unk_1000E9E10;
  id v5 = (id)objc_opt_new();
  id v16 = v5;
  [v4 enumerateKeysAndObjectsUsingBlock:v15];

  v17[0] = @"RemovabilityEntries";
  id v6 = [v5 copy];
  v17[1] = @"RemovabilityChangeClock";
  v18[0] = v6;
  unsigned __int8 v7 = [v3 dictionaryRepresentation];

  v18[1] = v7;
  __int16 v8 = +[NSDictionary dictionaryWithObjects:v18 forKeys:v17 count:2];

  id v14 = 0;
  id v9 = +[NSPropertyListSerialization dataWithPropertyList:v8 format:200 options:0 error:&v14];
  id v10 = v14;
  if (v9)
  {
    id v11 = v9;
  }
  else
  {
    uint64_t v12 = sub_100004B28((uint64_t)off_100109BB8);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
      sub_100090514();
    }
  }

  return v9;
}

void sub_100035548(uint64_t a1, void *a2, void *a3, unsigned char *a4)
{
  id v10 = a2;
  unsigned __int8 v7 = [a3 propertyListRepresentation];
  if (v7)
  {
    __int16 v8 = *(void **)(a1 + 32);
    id v9 = [v10 canonicalSerializationForPlistKey];
    [v8 setObject:v7 forKeyedSubscript:v9];
  }
  *a4 = 0;
}

id sub_1000355E0(void *a1)
{
  id v1 = a1;
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_100035724;
  v9[3] = &unk_1000E9E10;
  id v2 = (id)objc_opt_new();
  id v10 = v2;
  [v1 enumerateKeysAndObjectsUsingBlock:v9];

  id v8 = 0;
  id v3 = +[NSPropertyListSerialization dataWithPropertyList:v2 format:200 options:0 error:&v8];
  id v4 = v8;
  if (v3)
  {
    id v5 = v3;
  }
  else
  {
    id v6 = sub_100004B28((uint64_t)off_100109BB8);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      sub_100090588();
    }
  }

  return v3;
}

void sub_100035724(uint64_t a1, void *a2, void *a3, unsigned char *a4)
{
  id v13 = a2;
  unsigned __int8 v7 = [a3 mostRestrictiveRemovabilityMetadata];
  id v8 = [v7 dictionaryRepresentation];
  objc_opt_class();
  id v9 = v8;
  if (objc_opt_isKindOfClass()) {
    id v10 = v9;
  }
  else {
    id v10 = 0;
  }

  if (v10)
  {
    id v11 = *(void **)(a1 + 32);
    uint64_t v12 = [v13 canonicalSerializationForPlistKey];
    [v11 setObject:v10 forKeyedSubscript:v12];
  }
  *a4 = 0;
}

id sub_100035810(void *a1)
{
  id v1 = a1;
  if (objc_opt_isKindOfClass()) {
    id v2 = v1;
  }
  else {
    id v2 = 0;
  }

  return v2;
}

id sub_10003586C(void *a1, BOOL *a2)
{
  uint64_t v4 = 3;
  id v5 = sub_100035BD8(3);
  if (!v5)
  {
    uint64_t v4 = 2;
    id v5 = sub_100035BD8(2);
    if (!v5)
    {
      uint64_t v4 = 1;
      id v5 = sub_100035BD8(1);
      if (!v5)
      {
        id v5 = sub_100035BD8(0);
        if (!v5)
        {
          id v10 = 0;
          uint64_t v4 = 0;
          goto LABEL_21;
        }
        uint64_t v4 = 0;
      }
    }
  }
  id v22 = 0;
  id v6 = +[NSPropertyListSerialization propertyListWithData:v5 options:0 format:0 error:&v22];
  id v7 = v22;
  if (!v6)
  {
    uint64_t v12 = sub_100004B28((uint64_t)off_100109BB8);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
      sub_1000905FC();
    }

    id v10 = 0;
    goto LABEL_21;
  }
  objc_opt_class();
  id v8 = v6;
  if (objc_opt_isKindOfClass())
  {
    if ((unint64_t)(v4 - 2) >= 2)
    {
      id v10 = +[IXDataStoreClock newClock];
      id v11 = v8;
      id v13 = objc_opt_new();
      v23[0] = _NSConcreteStackBlock;
      v23[1] = 3221225472;
      if (v4) {
        id v14 = sub_100036E7C;
      }
      else {
        id v14 = sub_100037028;
      }
      v23[2] = v14;
      v23[3] = &unk_1000E9E60;
      id v24 = v13;
      id v15 = v13;
      [v11 enumerateKeysAndObjectsUsingBlock:v23];

      id v9 = [v15 copy];
    }
    else
    {
      id v20 = 0;
      id v21 = 0;
      sub_100035C64(v8, &v21, &v20, v4);
      id v9 = v21;
      id v10 = v20;
      id v11 = v8;
    }
  }
  else
  {

    id v11 = sub_100004B28((uint64_t)off_100109BB8);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      sub_100090670();
    }
    id v10 = 0;
    id v9 = 0;
  }

  if (!v9)
  {
LABEL_21:
    id v9 = (id)objc_opt_new();
    id v16 = +[IXDataStoreClock newClock];

    id v10 = v16;
  }
  if (a2)
  {
    BOOL v17 = v4 != 3 && [v9 count] != 0;
    *a2 = v17;
  }
  if (a1) {
    *a1 = v10;
  }
  id v18 = v9;

  return v18;
}

id sub_100035BD8(uint64_t a1)
{
  if (a1 == 1)
  {
    id v1 = sub_10003512C();
  }
  else if (a1 == 2)
  {
    id v1 = sub_100035034();
  }
  else
  {
    if (a1 == 3) {
      sub_100034F3C();
    }
    else {
    id v1 = sub_100035224();
    }
  }
  id v2 = v1;
  id v3 = sub_1000368D0(v1, 1);

  return v3;
}

uint64_t sub_100035C64(void *a1, void *a2, void *a3, uint64_t a4)
{
  id v7 = a1;
  id v8 = [v7 objectForKeyedSubscript:@"RemovabilityEntries"];
  if (v8)
  {
    objc_opt_class();
    id v9 = v8;
    if (objc_opt_isKindOfClass()) {
      id v10 = v9;
    }
    else {
      id v10 = 0;
    }

    if (v10)
    {
      id v11 = [v7 objectForKeyedSubscript:@"RemovabilityChangeClock"];
      if (v11)
      {
        objc_opt_class();
        uint64_t v12 = v11;
        if (objc_opt_isKindOfClass()) {
          id v13 = v12;
        }
        else {
          id v13 = 0;
        }

        if (v13)
        {
          id v15 = sub_100036B40(v9, a4);
          if (v15)
          {
            id v16 = +[IXDataStoreClock newClockWithDictionary:v12];
            BOOL v17 = v16;
            if (v16)
            {
              if (a3) {
                *a3 = v16;
              }
              if (a2) {
                *a2 = v15;
              }
              uint64_t v14 = 1;
              goto LABEL_34;
            }
            id v18 = sub_100004B28((uint64_t)off_100109BB8);
            if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR)) {
              sub_100090948();
            }
          }
          else
          {
            BOOL v17 = sub_100004B28((uint64_t)off_100109BB8);
            if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
              sub_1000908D4();
            }
          }
          uint64_t v14 = 0;
LABEL_34:

          goto LABEL_35;
        }
        id v15 = sub_100004B28((uint64_t)off_100109BB8);
        if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
          sub_100090860();
        }
      }
      else
      {
        id v15 = sub_100004B28((uint64_t)off_100109BB8);
        if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
          sub_1000907DC();
        }
      }
      uint64_t v14 = 0;
LABEL_35:

      goto LABEL_36;
    }
    id v11 = sub_100004B28((uint64_t)off_100109BB8);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      sub_100090768();
    }
  }
  else
  {
    id v11 = sub_100004B28((uint64_t)off_100109BB8);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      sub_1000906E4();
    }
  }
  uint64_t v14 = 0;
LABEL_36:

  return v14;
}

IXAppRemovabilityMetadata *sub_100035F24(void *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  id v6 = [a1 objectForKeyedSubscript:a2];
  id v7 = v6;
  if (v6)
  {
    id v8 = [v6 mostRestrictiveRemovabilityMetadata];
    id v9 = v8;
    if (v8) {
      id v10 = v8;
    }
    else {
      id v10 = [[IXAppRemovabilityMetadata alloc] initWithRemovability:a3 client:a4];
    }
    id v11 = v10;
  }
  else
  {
    id v11 = [[IXAppRemovabilityMetadata alloc] initWithRemovability:a3 client:a4];
  }

  return v11;
}

id sub_100035FD8(void *a1, uint64_t a2, id a3, uint64_t a4)
{
  id v6 = [a1 objectForKeyedSubscript:a2];
  id v7 = v6;
  if (v6) {
    a3 = [v6 removabilityForClient:a4 notFoundRemovability:a3];
  }

  return a3;
}

id sub_100036034(void *a1, uint64_t a2, void *a3, void *a4)
{
  id v7 = a1;
  id v8 = sub_1000360AC(v7, a4);
  id v9 = v8;
  if (v8) {
    id v10 = sub_100035FD8(v8, (uint64_t)v7, a3, a2);
  }
  else {
    id v10 = 0;
  }

  return v10;
}

id sub_1000360AC(void *a1, void *a2)
{
  id v3 = a1;
  uint64_t v4 = sub_100034F3C();
  id v5 = sub_1000368D0(v4, 0);

  if (v5)
  {
    id v29 = 0;
    unsigned __int8 v6 = [v3 resolvePersonaRespectingSandboxingWithError:&v29];
    id v7 = v29;
    id v8 = v7;
    if (v6)
    {
      id v23 = a2;
      id v24 = v7;
      id v22 = v3;
      id v9 = [v3 possibleSerializationsForPlistKey];
      id v10 = objc_opt_new();
      long long v25 = 0u;
      long long v26 = 0u;
      long long v27 = 0u;
      long long v28 = 0u;
      id v11 = v9;
      id v12 = [v11 countByEnumeratingWithState:&v25 objects:v30 count:16];
      if (v12)
      {
        id v13 = v12;
        uint64_t v14 = *(void *)v26;
        do
        {
          for (i = 0; i != v13; i = (char *)i + 1)
          {
            if (*(void *)v26 != v14) {
              objc_enumerationMutation(v11);
            }
            id v16 = +[NSString stringWithFormat:@"%@:%@", @"RemovabilityEntries", *(void *)(*((void *)&v25 + 1) + 8 * i)];
            [v10 addObject:v16];
          }
          id v13 = [v11 countByEnumeratingWithState:&v25 objects:v30 count:16];
        }
        while (v13);
      }

      BOOL v17 = +[NSString stringWithFormat:@"%@:%@", @"RemovabilityChangeClock", @"sequenceNumber"];
      [v10 addObject:v17];

      id v18 = +[NSString stringWithFormat:@"%@:%@", @"RemovabilityChangeClock", @"guid"];
      [v10 addObject:v18];

      __int16 v19 = [v10 copy];
      _CFPropertyListCreateFiltered();

      id v20 = sub_100004B28((uint64_t)off_100109BB8);
      id v3 = v22;
      if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR)) {
        sub_100090CC0();
      }

      if (v23) {
        *id v23 = 0;
      }

      id v8 = 0;
    }
    else
    {
      __int16 v19 = sub_100004B28((uint64_t)off_100109BB8);
      if (os_log_type_enabled(v19, OS_LOG_TYPE_FAULT)) {
        sub_100090D34();
      }
    }
  }

  return 0;
}

IXAppRemovabilityMetadata *sub_100036698(void *a1, uint64_t a2, uint64_t a3, void *a4)
{
  id v7 = a1;
  id v8 = sub_1000360AC(v7, a4);
  id v9 = v8;
  if (v8)
  {
    sub_100035F24(v8, (uint64_t)v7, a2, a3);
    id v10 = (IXAppRemovabilityMetadata *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v10 = [[IXAppRemovabilityMetadata alloc] initWithRemovability:0 client:0];
  }
  id v11 = v10;

  return v11;
}

id sub_100036738(void *a1)
{
  id v2 = sub_100034F3C();
  id v3 = sub_1000368D0(v2, 0);

  if (!v3)
  {
    id v10 = 0;
    goto LABEL_14;
  }
  id v13 = 0;
  uint64_t v4 = +[NSPropertyListSerialization propertyListWithData:v3 options:0 format:0 error:&v13];
  id v5 = v13;
  if (v4)
  {
    objc_opt_class();
    unsigned __int8 v6 = v4;
    if (objc_opt_isKindOfClass())
    {
      id v12 = 0;
      int v7 = sub_100035C64(v6, &v12, a1, 3);
      id v8 = v12;
      id v9 = v8;
      id v10 = 0;
      if (v7) {
        id v10 = v8;
      }

      goto LABEL_13;
    }

    unsigned __int8 v6 = sub_100004B28((uint64_t)off_100109BB8);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      sub_100090E2C(v6);
    }
  }
  else
  {
    unsigned __int8 v6 = sub_100004B28((uint64_t)off_100109BB8);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      sub_100090DB8();
    }
  }
  id v10 = 0;
LABEL_13:

LABEL_14:

  return v10;
}

id sub_1000368D0(void *a1, int a2)
{
  id v3 = a1;
  if (v3)
  {
    if (a2) {
      uint64_t v4 = 3;
    }
    else {
      uint64_t v4 = 1;
    }
    id v19 = 0;
    id v5 = +[NSData dataWithContentsOfURL:v3 options:v4 error:&v19];
    unsigned __int8 v6 = v19;
    int v7 = v6;
    if (v5) {
      goto LABEL_24;
    }
    id v8 = [v6 domain];
    if ([v8 isEqualToString:NSCocoaErrorDomain]
      && [v7 code] == (id)257)
    {
      id v9 = [v7 userInfo];
      id v10 = [v9 objectForKeyedSubscript:NSUnderlyingErrorKey];
      id v11 = [v10 domain];
      if ([v11 isEqualToString:NSPOSIXErrorDomain])
      {
        id v12 = [v7 userInfo];
        id v13 = [v12 objectForKeyedSubscript:NSUnderlyingErrorKey];
        id v18 = [v13 code];

        if (v18 == (id)1)
        {
          uint64_t v14 = sub_100004B28((uint64_t)off_100109BB8);
          if (os_log_type_enabled(v14, OS_LOG_TYPE_FAULT)) {
            sub_100090F34(v3, v14);
          }
LABEL_23:

          goto LABEL_24;
        }
LABEL_17:
        id v15 = [v7 domain];
        if ([v15 isEqualToString:NSCocoaErrorDomain])
        {
          id v16 = [v7 code];

          if (v16 == (id)260) {
            goto LABEL_24;
          }
        }
        else
        {
        }
        uint64_t v14 = sub_100004B28((uint64_t)off_100109BB8);
        if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
          sub_100090FD4(v3, (uint64_t)v7, v14);
        }
        goto LABEL_23;
      }
    }
    goto LABEL_17;
  }
  int v7 = sub_100004B28((uint64_t)off_100109BB8);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_FAULT)) {
    sub_100090EB0(v7);
  }
  id v5 = 0;
LABEL_24:

  return v5;
}

id sub_100036B40(void *a1, uint64_t a2)
{
  id v3 = a1;
  int v7 = _NSConcreteStackBlock;
  uint64_t v8 = 3221225472;
  id v9 = sub_100036C14;
  id v10 = &unk_1000E9E38;
  id v11 = (id)objc_opt_new();
  uint64_t v12 = a2;
  id v4 = v11;
  [v3 enumerateKeysAndObjectsUsingBlock:&v7];

  id v5 = objc_msgSend(v4, "copy", v7, v8, v9, v10);

  return v5;
}

void sub_100036C14(uint64_t a1, void *a2, void *a3, unsigned char *a4)
{
  id v7 = a2;
  id v8 = a3;
  objc_opt_class();
  id v9 = v7;
  if (objc_opt_isKindOfClass()) {
    id v10 = v9;
  }
  else {
    id v10 = 0;
  }

  if (v10)
  {
    objc_opt_class();
    id v11 = v8;
    if (objc_opt_isKindOfClass())
    {
      if (v11)
      {
        uint64_t v12 = [[IXApplicationIdentity alloc] initWithPlistKeySerialization:v9];
        if (v12)
        {
          uint64_t v13 = *(void *)(a1 + 40);
          uint64_t v14 = v11;
          id v15 = v12;
          if (v13 == 2)
          {
            BOOL v17 = [[IXAppRemovabilityMetadata alloc] initWithMetadataDictionary:v14];
            id v16 = [[IXAppRemovabilityMetadataList alloc] initWithInitialRemovabilityMetadata:v17];
          }
          else if (v13 == 3)
          {
            id v16 = [[IXAppRemovabilityMetadataList alloc] initWithSerializedDictionary:v14];
          }
          else
          {
            id v18 = sub_100004B28((uint64_t)off_100109BB8);
            if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR)) {
              sub_1000911E8();
            }

            id v16 = 0;
          }

          [*(id *)(a1 + 32) setObject:v16 forKeyedSubscript:v15];
        }
        else
        {
          sub_100004B28((uint64_t)off_100109BB8);
          id v16 = (IXAppRemovabilityMetadataList *)objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(&v16->super, OS_LOG_TYPE_ERROR)) {
            sub_100091174();
          }
        }

        goto LABEL_24;
      }
    }
    else
    {
    }
    id v11 = sub_100004B28((uint64_t)off_100109BB8);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      sub_100091100();
    }
  }
  else
  {
    id v11 = sub_100004B28((uint64_t)off_100109BB8);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      sub_10009108C();
    }
  }
LABEL_24:

  *a4 = 0;
}

void sub_100036E7C(uint64_t a1, void *a2, void *a3, unsigned char *a4)
{
  id v7 = a2;
  id v8 = a3;
  objc_opt_class();
  id v9 = v7;
  if (objc_opt_isKindOfClass()) {
    id v10 = v9;
  }
  else {
    id v10 = 0;
  }

  if (v10)
  {
    objc_opt_class();
    id v11 = v8;
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
LABEL_16:

      goto LABEL_17;
    }
    if (v11)
    {
      uint64_t v12 = [[IXApplicationIdentity alloc] initWithPlistKeySerialization:v9];
      if (v12)
      {
        uint64_t v13 = [[IXAppRemovabilityMetadata alloc] initWithMetadataDictionary:v11];
        uint64_t v14 = [[IXAppRemovabilityMetadataList alloc] initWithInitialRemovabilityMetadata:v13];
        [*(id *)(a1 + 32) setObject:v14 forKeyedSubscript:v12];
      }
      else
      {
        id v16 = sub_100004B28((uint64_t)off_100109BB8);
        if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
          sub_1000912DC();
        }
      }
      goto LABEL_16;
    }
  }
  else
  {
    id v15 = sub_100004B28((uint64_t)off_100109BB8);
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
      sub_100091268();
    }
  }
LABEL_17:
  *a4 = 0;
}

void sub_100037028(uint64_t a1, void *a2, void *a3, unsigned char *a4)
{
  id v7 = a2;
  id v8 = a3;
  objc_opt_class();
  id v9 = v8;
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
LABEL_9:

    goto LABEL_10;
  }
  if (v9)
  {
    id v10 = [v9 unsignedIntegerValue];
    id v11 = [[IXApplicationIdentity alloc] initWithPlistKeySerialization:v7];
    if (v11)
    {
      uint64_t v12 = [[IXAppRemovabilityMetadataList alloc] initWithInitialRemovability:v10 client:1];
      [*(id *)(a1 + 32) setObject:v12 forKeyedSubscript:v11];
    }
    else
    {
      uint64_t v13 = sub_100004B28((uint64_t)off_100109BB8);
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
        sub_100091350();
      }
    }
    goto LABEL_9;
  }
LABEL_10:
  *a4 = 0;
}

BOOL IXIsAppExtensionForPlaceholderType(uint64_t a1)
{
  return (a1 & 0xFFFFFFFFFFFFFFFELL) == 2;
}

__CFString *IXStringForAppRemovability(unint64_t a1)
{
  if (a1 >= 4)
  {
    id v1 = +[NSString stringWithFormat:@"Unknown IXAppRemovability value: %lu", a1];
  }
  else
  {
    id v1 = off_1000E9E80[a1];
  }

  return v1;
}

__CFString *IXStringForAppRemovabilityClient(unint64_t a1)
{
  if (a1 >= 5)
  {
    id v1 = +[NSString stringWithFormat:@"Unknown IXAppRemovabilityClient value: %lu", a1];
  }
  else
  {
    id v1 = off_1000E9EA0[a1];
  }

  return v1;
}

__CFString *IXStringForIXError(void *a1, unint64_t a2)
{
  id v3 = a1;
  if ([v3 isEqualToString:@"IXUserPresentableErrorDomain"])
  {
    id v4 = @"Unknown error.";
    switch(a2)
    {
      case 0uLL:
        break;
      case 1uLL:
        id v4 = @"Could not install at this time.";
        break;
      case 2uLL:
        id v4 = @"Could not install.";
        break;
      case 3uLL:
        id v4 = @"User canceled.";
        break;
      case 4uLL:
        id v4 = @"Incompatible device architecture.";
        break;
      case 5uLL:
        id v4 = @"Device lacks required capabilities.";
        break;
      case 6uLL:
        id v4 = @"Incompatible platform.";
        break;
      case 7uLL:
        id v4 = @"Needs reinstallation from MDM.";
        break;
      case 8uLL:
        id v4 = @"Needs manual reinstallation.";
        break;
      case 9uLL:
        id v4 = @"No longer available in App Store.";
        break;
      case 0xAuLL:
        id v4 = @"Content is not owned by this user.";
        break;
      case 0xBuLL:
        id v4 = @"Insufficient storage.";
        break;
      case 0xCuLL:
        id v4 = @"User data for this app failed to restore from backup.";
        break;
      case 0xDuLL:
        id v4 = @"Forbidden.";
        break;
      case 0xEuLL:
        id v4 = @"Unable to verify integrity.";
        break;
      case 0xFuLL:
        id v4 = @"SINF not for this platform.";
        break;
      case 0x10uLL:
        id v4 = @"Device OS version is too low to run this app.";
        break;
      case 0x11uLL:
        id v4 = @"Code signature version is no longer supported.";
        break;
      case 0x12uLL:
        id v4 = @"Device is not eligible to install this app.";
        break;
      default:
        if (a2 != 54)
        {
          +[NSString stringWithFormat:@"Unhandled reason for code: %lu in domain IXUserPresentableErrorDomain", a2, v6];
          goto LABEL_9;
        }
        id v4 = @"Reached code meant only for testing.";
        break;
    }
  }
  else
  {
    if ([v3 isEqualToString:@"IXErrorDomain"])
    {
      if (a2 < 0x3A)
      {
        id v4 = off_1000E9EF8[a2];
        goto LABEL_10;
      }
      +[NSString stringWithFormat:@"Unhandled reason for code: %lu in domain IXErrorDomain", a2, v6];
    }
    else
    {
      +[NSString stringWithFormat:@"Unhandled error domain %@, code %lu", v3, a2];
    }
LABEL_9:
    id v4 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
LABEL_10:

  return v4;
}

id IXCreateUserPresentableError(unint64_t a1, int a2, void *a3)
{
  id v5 = a3;
  if (a1)
  {
    uint64_t v6 = objc_opt_new();
    id v7 = v6;
    if (v5)
    {
      [v6 setObject:v5 forKeyedSubscript:NSUnderlyingErrorKey];
      id v8 = [v5 userInfo];
      id v9 = [v8 objectForKeyedSubscript:NSLocalizedDescriptionKey];

      if (v9)
      {
        [v7 setObject:v9 forKeyedSubscript:NSLocalizedFailureReasonErrorKey];
        [v7 setObject:v9 forKeyedSubscript:NSLocalizedRecoverySuggestionErrorKey];
      }
    }
    if (a2) {
      [v7 setObject:&__kCFBooleanTrue forKeyedSubscript:@"AlertUser"];
    }
    id v10 = IXStringForIXError(@"IXUserPresentableErrorDomain", a1);
    [v7 setObject:v10 forKeyedSubscript:NSLocalizedFailureReasonErrorKey];

    if (a1 >= 0x13)
    {
      id v11 = +[NSString stringWithFormat:@"Unhandled IXUserPresentableErrorCode %lu", a1];
    }
    else
    {
      id v11 = off_1000EA0C8[a1 - 1];
    }
    [v7 setObject:v11 forKeyedSubscript:NSLocalizedDescriptionKey];

    uint64_t v13 = +[NSError errorWithDomain:@"IXUserPresentableErrorDomain" code:a1 userInfo:v7];
  }
  else
  {
    uint64_t v12 = sub_100004B28((uint64_t)off_100109BB8);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
      sub_1000914CC(v12);
    }

    uint64_t v13 = 0;
  }

  return v13;
}

uint64_t IXUserPresentableErrorCodeIsHardError(unint64_t a1, unint64_t a2)
{
  if (a2 >= 0x1D) {
    unsigned int v2 = 1;
  }
  else {
    unsigned int v2 = (0xF7FFFFDu >> a2) & 1;
  }
  if (((1 << a1) & 0x34010) != 0) {
    unsigned int v3 = v2;
  }
  else {
    unsigned int v3 = 0;
  }
  if (((1 << a1) & 0xA1E4) != 0) {
    unsigned int v4 = 1;
  }
  else {
    unsigned int v4 = v3;
  }
  if (a1 <= 0x11) {
    return v4;
  }
  else {
    return 0;
  }
}

id sub_100037A94(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 40);
  unsigned int v3 = [*(id *)(a1 + 32) seed];
  [v3 setTransferPath:v2];

  unsigned int v4 = *(void **)(a1 + 32);

  return [v4 saveState];
}

id sub_100037B9C(uint64_t a1)
{
  uint64_t v2 = *(unsigned __int8 *)(a1 + 40);
  unsigned int v3 = [*(id *)(a1 + 32) seed];
  [v3 setShouldCopy:v2];

  unsigned int v4 = *(void **)(a1 + 32);

  return [v4 saveState];
}

id sub_100037CA8(uint64_t a1)
{
  uint64_t v2 = *(unsigned __int8 *)(a1 + 40);
  unsigned int v3 = [*(id *)(a1 + 32) seed];
  [v3 setTryDeltaCopy:v2];

  unsigned int v4 = *(void **)(a1 + 32);

  return [v4 saveState];
}

uint64_t sub_10003802C(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  id v6 = a2;
  objc_opt_class();
  id v12 = v6;
  if (objc_opt_isKindOfClass())
  {
    if (!v12) {
      goto LABEL_7;
    }
    id v7 = [[IXAppRemovabilityMetadata alloc] initWithMetadataDictionary:v12];
    id v8 = v7;
    if (v7)
    {
      id v9 = *(void **)(a1 + 32);
      id v10 = +[NSNumber numberWithUnsignedInteger:[(IXAppRemovabilityMetadata *)v7 client]];
      [v9 setObject:v8 forKeyedSubscript:v10];
    }
  }

LABEL_7:
  *a4 = 0;

  return _objc_release_x1();
}

void sub_100038240(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v7 - 64), 8);
  _Unwind_Resume(a1);
}

uint64_t sub_100038264(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void sub_100038274(uint64_t a1)
{
}

void sub_10003827C(uint64_t a1, void *a2, void *a3, unsigned char *a4)
{
  id v11 = a2;
  id v7 = a3;
  id v8 = v7;
  uint64_t v9 = *(void *)(*(void *)(a1 + 32) + 8);
  if (*(void *)(v9 + 40))
  {
    unint64_t v10 = *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24);
    if (v10 >= (unint64_t)[v7 removability]) {
      goto LABEL_5;
    }
    uint64_t v9 = *(void *)(*(void *)(a1 + 32) + 8);
  }
  objc_storeStrong((id *)(v9 + 40), a3);
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = [*(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) removability];
LABEL_5:
  *a4 = 0;
}

void sub_1000386F8(uint64_t a1, uint64_t a2, void *a3, unsigned char *a4)
{
  id v5 = *(void **)(a1 + 32);
  id v6 = [a3 description];
  [v5 addObject:v6];

  *a4 = 0;
}

void sub_100038884(uint64_t a1, uint64_t a2, void *a3, unsigned char *a4)
{
  id v5 = *(void **)(a1 + 32);
  id v6 = [a3 dictionaryRepresentation];
  [v5 addObject:v6];

  *a4 = 0;
}

BOOL sub_100038B84(void *a1)
{
  id v1 = (const char *)[a1 UTF8String];
  size_t v2 = strlen(v1);
  if (v2 >= 0x20) {
    +[NSException raise:NSInvalidArgumentException, @"Identifier %s must be less <= %d bytes in length but was %ld bytes", v1, 31, v2 format];
  }
  unsigned int v3 = sem_open(v1, 0);
  unsigned int v4 = v3;
  if (v3 != (sem_t *)-1) {
    sem_close(v3);
  }
  return v4 == (sem_t *)-1;
}

void sub_100038C18(void *a1)
{
  id v1 = (const char *)[a1 UTF8String];
  size_t v2 = strlen(v1);
  if (v2 >= 0x20) {
    +[NSException raise:NSInvalidArgumentException, @"Identifier %s must be less <= %d bytes in length but was %ld bytes", v1, 31, v2 format];
  }
  unsigned int v3 = sem_open(v1, 512, 256, 0);
  if (v3 == (sem_t *)-1)
  {
    unsigned int v4 = sub_100004B28((uint64_t)off_100109BB8);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      id v5 = __error();
      id v6 = strerror(*v5);
      *(_DWORD *)buf = 136315650;
      id v8 = "IXSetOncePerBootWorkCompleted";
      __int16 v9 = 2080;
      unint64_t v10 = v1;
      __int16 v11 = 2080;
      id v12 = v6;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "%s: Failed to create semaphore %s: %s", buf, 0x20u);
    }
  }
  else
  {
    sem_close(v3);
  }
}

BOOL sub_100038D88(void *a1, void *a2)
{
  id v3 = a1;
  unsigned int v4 = a2;
  BOOL v5 = sub_100038B84(v3);
  if (v5)
  {
    v4[2](v4);
    sub_100038C18(v3);
  }

  return v5;
}

__CFString *sub_100038E04(unsigned int a1)
{
  if (a1 >= 3)
  {
    id v1 = +[NSString stringWithFormat:@"Unknown Coordinator Scope Requirement: %hhu", a1];
  }
  else
  {
    id v1 = off_1000EA1D0[(char)a1];
  }

  return v1;
}

BOOL sub_100038E70(unsigned int a1)
{
  return a1 < 3;
}

BOOL sub_100038F14(void *a1, uint64_t a2, void *a3)
{
  id v5 = a1;
  unsigned __int8 v6 = atomic_load(byte_100109EB8);
  if (v6)
  {
    if (qword_100109ED0 != -1) {
      dispatch_once(&qword_100109ED0, &stru_1000EA258);
    }
    uint64_t v22 = 0;
    id v23 = &v22;
    uint64_t v24 = 0x2020000000;
    char v25 = 0;
    uint64_t v16 = 0;
    BOOL v17 = &v16;
    uint64_t v18 = 0x3032000000;
    id v19 = sub_1000390B0;
    id v20 = sub_1000390C0;
    id v21 = 0;
    id v8 = qword_100109EC0;
    v11[0] = _NSConcreteStackBlock;
    v11[1] = 3221225472;
    v11[2] = sub_1000390C8;
    v11[3] = &unk_1000EA218;
    id v12 = v5;
    uint64_t v13 = &v16;
    uint64_t v14 = &v22;
    uint64_t v15 = a2;
    dispatch_sync(v8, v11);
    int v9 = *((unsigned __int8 *)v23 + 24);
    if (a3 && *((unsigned char *)v23 + 24))
    {
      *a3 = (id) v17[5];
      int v9 = *((unsigned __int8 *)v23 + 24);
    }
    BOOL v7 = v9 != 0;

    _Block_object_dispose(&v16, 8);
    _Block_object_dispose(&v22, 8);
  }
  else
  {
    BOOL v7 = 0;
  }

  return v7;
}

uint64_t sub_1000390B0(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void sub_1000390C0(uint64_t a1)
{
}

void sub_1000390C8(uint64_t a1)
{
  size_t v2 = (void *)qword_100109EC8;
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472;
  v3[2] = sub_10003916C;
  v3[3] = &unk_1000EA1F0;
  id v4 = *(id *)(a1 + 32);
  uint64_t v6 = *(void *)(a1 + 56);
  long long v5 = *(_OWORD *)(a1 + 40);
  [v2 enumerateKeysAndObjectsUsingBlock:v3];
}

void sub_10003916C(uint64_t a1, uint64_t a2, void *a3, unsigned char *a4)
{
  id v7 = a3;
  if ([*(id *)(a1 + 32) hasPrefix:a2])
  {
    long long v21 = 0u;
    long long v22 = 0u;
    long long v19 = 0u;
    long long v20 = 0u;
    id v8 = v7;
    id v9 = [v8 countByEnumeratingWithState:&v19 objects:v23 count:16];
    if (v9)
    {
      id v10 = v9;
      uint64_t v11 = *(void *)v20;
      do
      {
        for (i = 0; i != v10; i = (char *)i + 1)
        {
          if (*(void *)v20 != v11) {
            objc_enumerationMutation(v8);
          }
          uint64_t v13 = *(void **)(*((void *)&v19 + 1) + 8 * i);
          if (objc_msgSend(v13, "mode", (void)v19) == *(id *)(a1 + 56))
          {
            uint64_t v14 = [v13 testSpecificValidationData];
            uint64_t v15 = v14;
            if (v14)
            {
              id v16 = [v14 copy];
              uint64_t v17 = *(void *)(*(void *)(a1 + 40) + 8);
              uint64_t v18 = *(void **)(v17 + 40);
              *(void *)(v17 + 40) = v16;
            }
            *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = 1;
            *a4 = 1;
          }
        }
        id v10 = [v8 countByEnumeratingWithState:&v19 objects:v23 count:16];
      }
      while (v10);
    }
  }
}

BOOL sub_1000392E4(void *a1, uint64_t a2)
{
  return sub_100038F14(a1, a2, 0);
}

void sub_1000392EC(void *a1, uint64_t a2, void *a3)
{
  id v5 = a1;
  id v6 = a3;
  if (qword_100109ED0 != -1) {
    dispatch_once(&qword_100109ED0, &stru_1000EA258);
  }
  id v7 = qword_100109EC0;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000393E0;
  block[3] = &unk_1000E9738;
  id v12 = v5;
  uint64_t v13 = a2;
  id v11 = v6;
  id v8 = v5;
  id v9 = v6;
  dispatch_sync(v7, block);
}

void sub_1000393E0(void *a1)
{
  id v3 = [[TestModeMetadata alloc] initWithMode:a1[6] testSpecificValidationData:a1[4]];
  size_t v2 = [(id)qword_100109EC8 objectForKeyedSubscript:a1[5]];
  if (!v2)
  {
    size_t v2 = +[NSMutableArray arrayWithCapacity:0];
    [(id)qword_100109EC8 setObject:v2 forKeyedSubscript:a1[5]];
  }
  [v2 addObject:v3];
}

void sub_100039494()
{
}

void sub_1000394A8()
{
  atomic_store(0, byte_100109EB8);
  if (qword_100109ED0 != -1) {
    dispatch_once(&qword_100109ED0, &stru_1000EA258);
  }
  id v0 = qword_100109EC0;

  dispatch_sync(v0, &stru_1000EA238);
}

void sub_100039510(id a1)
{
}

void sub_10003951C(id a1)
{
  id v1 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  dispatch_queue_t v2 = dispatch_queue_create("com.apple.installcoordinationd.TestMode", v1);
  id v3 = (void *)qword_100109EC0;
  qword_100109EC0 = (uint64_t)v2;

  qword_100109EC8 = +[NSMutableDictionary dictionaryWithCapacity:0];

  _objc_release_x1();
}

uint64_t sub_100039640()
{
  qword_100109ED8 = (uint64_t)objc_alloc_init((Class)objc_opt_class());

  return _objc_release_x1();
}

uint64_t sub_10003A0C0()
{
  qword_100109EE8 = (uint64_t)objc_alloc_init((Class)objc_opt_class());

  return _objc_release_x1();
}

void sub_10003A97C(uint64_t a1)
{
  dispatch_queue_t v2 = [*(id *)(a1 + 32) pendingOperationIdentities];
  unsigned int v3 = [v2 containsObject:*(void *)(a1 + 40)];

  id v4 = sub_100004B28((uint64_t)off_100109BB8);
  id v5 = v4;
  if (v3)
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      sub_100091BDC();
    }
  }
  else
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v6 = *(void *)(a1 + 40);
      int v8 = 136315394;
      id v9 = "-[IXSPendingOperationsTracker beginPendingOperationForIdentity:]_block_invoke";
      __int16 v10 = 2112;
      uint64_t v11 = v6;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "%s: Beginning pending operation for %@", (uint8_t *)&v8, 0x16u);
    }

    id v7 = [*(id *)(a1 + 32) pendingOperationIdentities];
    [v7 addObject:*(void *)(a1 + 40)];

    objc_msgSend(*(id *)(a1 + 32), "_onQueue_writePendingWork");
  }
}

void sub_10003AB70(uint64_t a1)
{
  dispatch_queue_t v2 = [*(id *)(a1 + 32) pendingOperationIdentities];
  unsigned __int8 v3 = [v2 containsObject:*(void *)(a1 + 40)];

  id v4 = sub_100004B28((uint64_t)off_100109BB8);
  id v5 = v4;
  if (v3)
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v6 = *(void *)(a1 + 40);
      int v8 = 136315394;
      id v9 = "-[IXSPendingOperationsTracker endPendingOperationForIdentity:]_block_invoke";
      __int16 v10 = 2112;
      uint64_t v11 = v6;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "%s: Ending pending operation for %@", (uint8_t *)&v8, 0x16u);
    }

    id v7 = [*(id *)(a1 + 32) pendingOperationIdentities];
    [v7 removeObject:*(void *)(a1 + 40)];

    objc_msgSend(*(id *)(a1 + 32), "_onQueue_writePendingWork");
  }
  else
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      sub_100091C54();
    }
  }
}

void sub_10003ADB4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t sub_10003ADCC(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void sub_10003ADDC(uint64_t a1)
{
}

void sub_10003ADE4(uint64_t a1)
{
  id v5 = [*(id *)(a1 + 32) pendingOperationIdentities];
  id v2 = [v5 copy];
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
  id v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;
}

void sub_10003AED0(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) sentinelPath];
  uint64_t v3 = +[IXFileManager defaultManager];
  id v7 = 0;
  unsigned __int8 v4 = [v3 removeItemAtURL:v2 error:&v7];
  id v5 = v7;

  if (v4)
  {
    uint64_t v6 = [*(id *)(a1 + 32) pendingOperationIdentities];
    [v6 removeAllObjects];
  }
  else
  {
    uint64_t v6 = sub_100004B28((uint64_t)off_100109BB8);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      sub_100091CCC();
    }
  }
}

__CFString *sub_10003B9E4(unint64_t a1)
{
  if (a1 >= 6)
  {
    id v1 = +[NSString stringWithFormat:@"Unknown uninstall disposition: %lu", a1];
  }
  else
  {
    id v1 = off_1000EA2E0[a1];
  }

  return v1;
}

uint64_t sub_10003BA48(uint64_t a1)
{
  if ((unint64_t)(a1 - 1) > 4) {
    return 0;
  }
  else {
    return qword_1000AAF68[a1 - 1];
  }
}

uint64_t IXRemoveItemAtURL(void *a1, int a2, void *a3)
{
  id v5 = a1;
  uint64_t v6 = removefile_state_alloc();
  int v8 = v6;
  int value = 0;
  if (!v5)
  {
    NSErrorDomain v19 = NSPOSIXErrorDomain;
    long long v20 = @"nil url passed to -removeItemAtURL:error:";
    uint64_t v21 = 54;
    unint64_t v22 = 14;
LABEL_19:
    sub_10003DAE4((uint64_t)"IXRemoveItemAtURL", v21, v19, v22, 0, 0, v20, v7, v28);
    goto LABEL_20;
  }
  if (removefile_state_set(v6, 3u, sub_10003BD54))
  {
    id v9 = sub_100004B28((uint64_t)off_100109BB8);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      __int16 v10 = __error();
      uint64_t v11 = strerror(*v10);
      *(_DWORD *)buf = 136315394;
      uint64_t v31 = "IXRemoveItemAtURL";
      __int16 v32 = 2080;
      id v33 = v11;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "%s: removefile_state_set REMOVEFILE_STATE_ERROR_CALLBACK failed: %s", buf, 0x16u);
    }
  }
  if (removefile_state_set(v8, 4u, &value))
  {
    id v12 = sub_100004B28((uint64_t)off_100109BB8);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v13 = __error();
      uint64_t v14 = strerror(*v13);
      *(_DWORD *)buf = 136315394;
      uint64_t v31 = "IXRemoveItemAtURL";
      __int16 v32 = 2080;
      id v33 = v14;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "%s: removefile_state_set REMOVEFILE_STATE_ERROR_CONTEXT failed: %s", buf, 0x16u);
    }
  }
  if (a2) {
    removefile_flags_t v15 = 3;
  }
  else {
    removefile_flags_t v15 = 1;
  }
  id v16 = v5;
  if (removefile((const char *)[v16 fileSystemRepresentation], v8, v15) && *__error() != 2)
  {
    unint64_t v23 = *__error();
    uint64_t v24 = __error();
    uint64_t v28 = (uint64_t)v16;
    strerror(*v24);
    long long v20 = @"removefile of %@ failed: %s";
    uint64_t v21 = 75;
    NSErrorDomain v19 = NSPOSIXErrorDomain;
    unint64_t v22 = v23;
    goto LABEL_19;
  }
  unint64_t v17 = value;
  if ((value & 0xFFFFFFFD) == 0)
  {
    removefile_state_free(v8);
    id v25 = 0;
    uint64_t v26 = 1;
    goto LABEL_24;
  }
  strerror(value);
  sub_10003DAE4((uint64_t)"IXRemoveItemAtURL", 81, NSPOSIXErrorDomain, v17, 0, 0, @"removefile of %@ failed: %s", v18, (uint64_t)v16);
LABEL_20:
  id v25 = (id)objc_claimAutoreleasedReturnValue();
  removefile_state_free(v8);
  if (a3)
  {
    id v25 = v25;
    uint64_t v26 = 0;
    *a3 = v25;
  }
  else
  {
    uint64_t v26 = 0;
  }
LABEL_24:

  return v26;
}

uint64_t sub_10003BD54(_removefile_state *a1, uint64_t a2, _DWORD *a3)
{
  int dst = 0;
  if (removefile_state_get(a1, 5u, &dst))
  {
    id v5 = sub_100004B28((uint64_t)off_100109BB8);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315394;
      uint64_t v11 = "_removefile_error_callback";
      __int16 v12 = 2080;
      uint64_t v13 = a2;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "%s: removefile hit error for %s but we failed to get the error number", buf, 0x16u);
    }

    int dst = 2;
  }
  else if (dst != 2)
  {
    uint64_t v6 = sub_100004B28((uint64_t)off_100109BB8);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v7 = strerror(dst);
      *(_DWORD *)buf = 136315650;
      uint64_t v11 = "_removefile_error_callback";
      __int16 v12 = 2080;
      uint64_t v13 = a2;
      __int16 v14 = 2080;
      removefile_flags_t v15 = v7;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "%s: removefile hit error for %s : %s", buf, 0x20u);
    }
  }
  if (a3 && !*a3) {
    *a3 = dst;
  }
  return 0;
}

BOOL IXCopyItemAtURL(void *a1, void *a2, char a3, void *a4)
{
  id v7 = a1;
  id v8 = a2;
  if ((a3 & 1) != 0
    || (memset(&v21, 0, sizeof(v21)),
        id v9 = v7,
        !lstat((const char *)[v9 fileSystemRepresentation], &v21)))
  {
    id v12 = v7;
    if (!copyfile((const char *)[v12 fileSystemRepresentation], (const char *)objc_msgSend(v8, "fileSystemRepresentation"), 0, 0x10C800Fu))
    {
      id v19 = 0;
      BOOL v11 = 1;
      goto LABEL_14;
    }
    unint64_t v13 = *__error();
    __int16 v14 = __error();
    strerror(*v14);
    sub_10003DAE4((uint64_t)"IXCopyItemAtURL", 121, NSPOSIXErrorDomain, v13, 0, 0, @"copyfile of %@ to %@ failed: %s", v15, (uint64_t)v12);
    id v19 = (id)objc_claimAutoreleasedReturnValue();
    BOOL v11 = 0;
    if (!a4) {
      goto LABEL_14;
    }
  }
  else
  {
    int v10 = *__error();
    BOOL v11 = v10 == 2;
    if (v10 == 2)
    {
      id v19 = 0;
      if (!a4) {
        goto LABEL_14;
      }
    }
    else
    {
      unint64_t v16 = *__error();
      unint64_t v17 = __error();
      strerror(*v17);
      sub_10003DAE4((uint64_t)"IXCopyItemAtURL", 106, NSPOSIXErrorDomain, v16, 0, 0, @"stat of %@ failed: %s", v18, (uint64_t)v9);
      id v19 = (id)objc_claimAutoreleasedReturnValue();
      if (!a4) {
        goto LABEL_14;
      }
    }
  }
  if (!v11)
  {
    id v19 = v19;
    BOOL v11 = 0;
    *a4 = v19;
  }
LABEL_14:

  return v11;
}

BOOL IXItemExistsAtURL(void *a1, BOOL *a2, void *a3)
{
  memset(&v13, 0, sizeof(v13));
  id v5 = a1;
  int v6 = lstat((const char *)[v5 fileSystemRepresentation], &v13);
  if (v6)
  {
    unint64_t v7 = *__error();
    if (v7 != 2)
    {
      id v8 = sub_100004B28((uint64_t)off_100109BB8);
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        id v9 = strerror(v7);
        *(_DWORD *)buf = 136315650;
        uint64_t v15 = "IXItemExistsAtURL";
        __int16 v16 = 2112;
        id v17 = v5;
        __int16 v18 = 2080;
        id v19 = v9;
        _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "%s: Failed to determine if %@ exists: %s", buf, 0x20u);
      }
    }
    if (a3)
    {
      id v10 = [v5 fileSystemRepresentation];
      strerror(v7);
      sub_10003DAE4((uint64_t)"IXItemExistsAtURL", 155, NSPOSIXErrorDomain, v7, 0, 0, @"lstat of %s failed: %s", v11, (uint64_t)v10);
      *a3 = (id)objc_claimAutoreleasedReturnValue();
    }
  }
  else if (a2)
  {
    *a2 = (v13.st_mode & 0xF000) == 0x4000;
  }

  return v6 == 0;
}

BOOL IXCreateDirectoryAtURL(void *a1, int a2, mode_t a3, uint64_t a4, void *a5)
{
  id v9 = a1;
  id v10 = (const char *)[v9 fileSystemRepresentation];
  if (a2)
  {
    int v11 = mkpath_np(v10, a3);
    if (v11)
    {
      int v12 = v11;
      if (v11 != 17)
      {
        stat v13 = [v9 path];
        strerror(v12);
        sub_10003DAE4((uint64_t)"IXCreateDirectoryAtURL", 171, NSPOSIXErrorDomain, v12, 0, 0, @"mkpath_np of %@ failed: %s", v14, (uint64_t)v13);
        id v15 = (id)objc_claimAutoreleasedReturnValue();

        goto LABEL_15;
      }
    }
  }
  else if (mkdir(v10, a3) && *__error() != 17)
  {
    unint64_t v26 = *__error();
    long long v27 = [v9 path];
    uint64_t v28 = __error();
    strerror(*v28);
    sub_10003DAE4((uint64_t)"IXCreateDirectoryAtURL", 177, NSPOSIXErrorDomain, v26, 0, 0, @"mkdir of %@ failed: %s", v29, (uint64_t)v27);
LABEL_14:
    id v15 = (id)objc_claimAutoreleasedReturnValue();

LABEL_15:
    BOOL v21 = 0;
    if (!a5) {
      goto LABEL_21;
    }
    goto LABEL_19;
  }
  if (a4 == -1)
  {
    id v15 = 0;
    BOOL v21 = 1;
    goto LABEL_21;
  }
  id v16 = v9;
  id v17 = opendir((const char *)[v16 fileSystemRepresentation]);
  if (!v17)
  {
    unint64_t v30 = *__error();
    long long v27 = [v16 path];
    uint64_t v31 = __error();
    strerror(*v31);
    sub_10003DAE4((uint64_t)"IXCreateDirectoryAtURL", 189, NSPOSIXErrorDomain, v30, 0, 0, @"opendir of %@ failed: %s", v32, (uint64_t)v27);
    goto LABEL_14;
  }
  __int16 v18 = v17;
  int v19 = dirfd(v17);
  int v20 = fcntl(v19, 64, a4);
  BOOL v21 = v20 == 0;
  if (v20)
  {
    unint64_t v22 = *__error();
    unint64_t v23 = [v16 path];
    uint64_t v24 = __error();
    strerror(*v24);
    sub_10003DAE4((uint64_t)"IXCreateDirectoryAtURL", 195, NSPOSIXErrorDomain, v22, 0, 0, @"Failed to setclass(%d) on directory %@: %s", v25, a4);
    id v15 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v15 = 0;
  }
  closedir(v18);
  if (a5)
  {
LABEL_19:
    if (!v21)
    {
      id v15 = v15;
      BOOL v21 = 0;
      *a5 = v15;
    }
  }
LABEL_21:

  return v21;
}

id IXUrlsForItemsInDirectoryAtURL(void *a1, char a2, void *a3)
{
  id v5 = a1;
  int v6 = objc_opt_new();
  v36[0] = _NSConcreteStackBlock;
  v36[1] = 3221225472;
  unint64_t v7 = v37;
  v37[0] = sub_10003C8C4;
  v37[1] = &unk_1000EA318;
  char v40 = a2;
  id v8 = v5;
  id v38 = v8;
  id v9 = v6;
  id v39 = v9;
  id v10 = v8;
  int v11 = v36;
  memset(&v43, 0, 512);
  uint64_t v41 = 0;
  id v12 = v10;
  int v13 = open((const char *)[v12 fileSystemRepresentation], 1048832);
  if (v13 < 0)
  {
    int v16 = *__error();
  }
  else
  {
    id v35 = v12;
    uint64_t v14 = fdopendir(v13);
    if (v14)
    {
      id v15 = v14;
      id v33 = v9;
      id v34 = a3;
      while (1)
      {
        int v16 = readdir_r(v15, &v43, &v41);
        if (v16 || !v41)
        {
LABEL_17:
          closedir(v15);
          id v9 = v33;
          a3 = v34;
          goto LABEL_20;
        }
        __int16 v18 = v41;
        if (!v41->d_type) {
          break;
        }
LABEL_16:
        char v27 = ((uint64_t (*)(void *, dirent *))v37[0])(v11, v18);
        if ((v27 & 1) == 0) {
          goto LABEL_17;
        }
      }
      int v19 = v7;
      memset(&v42, 0, sizeof(v42));
      uint64_t d_namlen = v41->d_namlen;
      id v21 = v35;
      unint64_t v22 = +[NSString stringWithFileSystemRepresentation:v18->d_name length:d_namlen];
      unint64_t v23 = [v21 URLByAppendingPathComponent:v22 isDirectory:0];

      id v24 = v23;
      if (!lstat((const char *)[v24 fileSystemRepresentation], &v42))
      {
        int v25 = v42.st_mode & 0xF000;
        switch(v25)
        {
          case 16384:
            char v26 = 4;
            goto LABEL_14;
          case 32768:
            char v26 = 8;
            goto LABEL_14;
          case 40960:
            char v26 = 10;
LABEL_14:
            v18->d_type = v26;
            break;
        }
      }

      __int16 v18 = v41;
      unint64_t v7 = v19;
      goto LABEL_16;
    }
    int v16 = *__error();
LABEL_20:
    id v12 = v35;
  }

  if (v16)
  {
    id v28 = [v12 fileSystemRepresentation];
    strerror(v16);
    unint64_t v30 = sub_10003DAE4((uint64_t)"IXUrlsForItemsInDirectoryAtURL", 298, NSPOSIXErrorDomain, v16, 0, 0, @"_IterateDirectory for %s returned %s", v29, (uint64_t)v28);
    id v31 = 0;
    if (!a3) {
      goto LABEL_27;
    }
  }
  else
  {
    id v31 = [v9 copy];
    unint64_t v30 = 0;
    if (!a3) {
      goto LABEL_27;
    }
  }
  if (!v31) {
    *a3 = v30;
  }
LABEL_27:

  return v31;
}

uint64_t sub_10003C8C4(uint64_t a1, uint64_t a2)
{
  unsigned __int8 v4 = (const char *)(a2 + 21);
  if (strcmp((const char *)(a2 + 21), ".") && strcmp(v4, ".."))
  {
    if (*(unsigned char *)(a2 + 20) == 10 && *(unsigned char *)(a1 + 48))
    {
      id v5 = sub_100004B28((uint64_t)off_100109BB8);
      if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
        sub_100091D64(a1, (uint64_t)v4, v5);
      }
    }
    else
    {
      int v6 = *(void **)(a1 + 32);
      unint64_t v7 = +[NSString stringWithFileSystemRepresentation:v4 length:*(unsigned __int16 *)(a2 + 18)];
      id v5 = [v6 URLByAppendingPathComponent:v7 isDirectory:*(unsigned __int8 *)(a2 + 20) == 4];

      if (v5)
      {
        [*(id *)(a1 + 40) addObject:v5];
      }
      else
      {
        id v8 = sub_100004B28((uint64_t)off_100109BB8);
        if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
        {
          id v9 = [*(id *)(a1 + 32) path];
          int v11 = 136315650;
          id v12 = "IXUrlsForItemsInDirectoryAtURL_block_invoke";
          __int16 v13 = 2080;
          uint64_t v14 = v4;
          __int16 v15 = 2112;
          int v16 = v9;
          _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "%s: Failed to create URL by appending %s to %@", (uint8_t *)&v11, 0x20u);
        }
      }
    }
  }
  return 1;
}

id IXCreateTemporaryDirectoryInDirectoryURL(void *a1, void *a2)
{
  id v3 = [a1 URLByAppendingPathComponent:@"temp.XXXXXX" isDirectory:1];
  unsigned __int8 v4 = strdup((const char *)[v3 fileSystemRepresentation]);
  if (mkdtemp(v4))
  {
    id v5 = +[NSURL fileURLWithFileSystemRepresentation:v4 isDirectory:1 relativeToURL:0];
    int v6 = 0;
    if (!a2) {
      goto LABEL_7;
    }
  }
  else
  {
    unint64_t v7 = __error();
    int v6 = sub_10003DAE4((uint64_t)"IXCreateTemporaryDirectoryInDirectoryURL", 321, NSPOSIXErrorDomain, *v7, 0, 0, @"Failed to create temp dir at path %s", v8, (uint64_t)v4);
    id v5 = 0;
    if (!a2) {
      goto LABEL_7;
    }
  }
  if (!v5) {
    *a2 = v6;
  }
LABEL_7:
  free(v4);

  return v5;
}

id sub_10003D008()
{
  if (qword_100109F00 != -1) {
    dispatch_once(&qword_100109F00, &stru_1000EA338);
  }
  id v0 = (void *)qword_100109EF8;

  return v0;
}

void sub_10003D05C(id a1)
{
  id v5 = (id)objc_opt_new();
  id v1 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  dispatch_queue_t v2 = dispatch_queue_create("com.apple.installcoordination.IXSInstallProgressServer", v1);

  id v3 = [objc_alloc((Class)IPProgressServer) initWithDelegate:v5 delegateQueue:v2];
  unsigned __int8 v4 = (void *)qword_100109EF8;
  qword_100109EF8 = (uint64_t)v3;
}

void sub_10003D2C0(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (v3)
  {
    unsigned __int8 v4 = sub_100004B28((uint64_t)off_100109BB8);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      CFStringRef v5 = @"pause";
      int v6 = *(unsigned __int8 *)(a1 + 32);
      uint64_t v8 = "-[IXSInstallProgressServer _setIsPaused:forIdentity:]_block_invoke";
      int v7 = 136315650;
      __int16 v9 = 2112;
      if (!v6) {
        CFStringRef v5 = @"resume";
      }
      CFStringRef v10 = v5;
      __int16 v11 = 2112;
      id v12 = v3;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "%s: Failed to %@ coordinator, ignoring request: %@", (uint8_t *)&v7, 0x20u);
    }
  }
}

id sub_10003D560(void *a1, void *a2)
{
  id v3 = a1;
  id v4 = [objc_alloc((Class)NSKeyedArchiver) initRequiringSecureCoding:1];
  [v4 encodeObject:v3 forKey:NSKeyedArchiveRootObjectKey];
  CFStringRef v5 = [v4 encodedData];

  if (a2 && !v5) {
    *a2 = 0;
  }

  return v5;
}

id sub_10003D918(uint64_t a1, uint64_t a2, void *a3, unint64_t a4, void *a5, void *a6, void *a7, uint64_t a8)
{
  id v15 = a3;
  id v16 = a5;
  id v17 = a6;
  id v18 = a7;
  if (v17) {
    id v19 = [v17 mutableCopy];
  }
  else {
    id v19 = (id)objc_opt_new();
  }
  int v20 = v19;
  id v21 = IXStringForIXError(v15, a4);
  [v20 setObject:v21 forKeyedSubscript:NSLocalizedFailureReasonErrorKey];

  if (v18)
  {
    id v22 = [objc_alloc((Class)NSString) initWithFormat:v18 arguments:a8];
    [v20 setObject:v22 forKeyedSubscript:NSLocalizedDescriptionKey];
  }
  if (v16) {
    [v20 setObject:v16 forKeyedSubscript:NSUnderlyingErrorKey];
  }
  unint64_t v23 = +[NSString stringWithUTF8String:a1];
  [v20 setObject:v23 forKeyedSubscript:@"FunctionName"];

  id v24 = +[NSNumber numberWithInt:a2];
  [v20 setObject:v24 forKeyedSubscript:@"SourceFileLine"];

  int v25 = +[NSError errorWithDomain:v15 code:a4 userInfo:v20];

  return v25;
}

id sub_10003DAE4(uint64_t a1, uint64_t a2, void *a3, unint64_t a4, void *a5, void *a6, void *a7, uint64_t a8, uint64_t a9)
{
  __int16 v9 = sub_10003D918(a1, a2, a3, a4, a5, a6, a7, (uint64_t)&a9);

  return v9;
}

uint64_t sub_10003DBC4()
{
  qword_100109F08 = (uint64_t)objc_alloc_init((Class)objc_opt_class());

  return _objc_release_x1();
}

uint64_t sub_10003EA50(uint64_t a1, uint64_t a2, void *a3)
{
  unsigned int v4 = *(unsigned __int16 *)(a2 + 88);
  uint64_t result = 1;
  BOOL v6 = v4 > 0xC;
  int v7 = (1 << v4) & 0x110A;
  if (!v6 && v7 != 0)
  {
    CFStringRef v10 = *(const char **)(a2 + 48);
    if (lchmod(v10, *(_WORD *)(a1 + 32)))
    {
      int v11 = *__error();
      unint64_t v12 = *__error();
      strerror(v11);
      sub_10003DAE4((uint64_t)"-[IXFileManager setPermissions:onAllChildrenOfPath:error:]_block_invoke", 325, NSPOSIXErrorDomain, v12, 0, 0, @"Failed to lchmod %s to mode 0%o : %s", v13, (uint64_t)v10);
      id v14 = (id)objc_claimAutoreleasedReturnValue();
      uint64_t result = 0;
      *a3 = v14;
    }
    else
    {
      return 1;
    }
  }
  return result;
}

uint64_t sub_10003ECF8(uint64_t a1, uint64_t a2, void *a3)
{
  unsigned int v4 = *(unsigned __int16 *)(a2 + 88);
  uint64_t result = 1;
  BOOL v6 = v4 >= 8;
  BOOL v8 = v4 == 8;
  int v7 = (1 << v4) & 0x10A;
  BOOL v8 = !v8 && v6 || v7 == 0;
  if (!v8)
  {
    CFStringRef v10 = *(const char **)(a2 + 48);
    int v11 = sub_100004B28((uint64_t)off_100109BB8);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG)) {
      sub_100092418((uint64_t)v10, v11);
    }

    if (!acl_set_link_np(v10, ACL_TYPE_EXTENDED, *(acl_t *)(a1 + 32))) {
      return 1;
    }
    unint64_t v13 = *__error();
    if (*(unsigned char *)(a1 + 40))
    {
      id v14 = sub_100004B28((uint64_t)off_100109BB8);
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315650;
        id v17 = "-[IXFileManager copyACLFrom:toAllChildrenOfPath:ignoringCopyErrors:error:]_block_invoke";
        __int16 v18 = 2080;
        id v19 = strerror(v13);
        __int16 v20 = 2080;
        id v21 = v10;
        _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "%s: Ignoring error %s from acl_set_link_np for %s", buf, 0x20u);
      }

      return 1;
    }
    sub_10003DAE4((uint64_t)"-[IXFileManager copyACLFrom:toAllChildrenOfPath:ignoringCopyErrors:error:]_block_invoke", 384, NSPOSIXErrorDomain, v13, 0, 0, @"acl_set_link_np for %s failed", v12, (uint64_t)v10);
    id v15 = (id)objc_claimAutoreleasedReturnValue();
    uint64_t result = 0;
    *a3 = v15;
  }
  return result;
}

void sub_100041300(void *a1, int a2, int a3, const char *a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint8_t buf)
{
  _os_log_error_impl(a1, v11, OS_LOG_TYPE_ERROR, a4, &buf, 0x16u);
}

void sub_100041DEC(id a1)
{
  id v1 = dlopen("/System/Library/PrivateFrameworks/CloudDocs.framework/CloudDocs", 1);
  qword_100109F18 = (uint64_t)v1;
  if (v1)
  {
    off_100109F20 = dlsym(v1, "BREntitledContainerIdentifiersForPropertyList");
    if (off_100109F20) {
      return;
    }
    dispatch_queue_t v2 = sub_100004B28((uint64_t)off_100109BB8);
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
    {
      int v4 = 136315394;
      CFStringRef v5 = "-[IXSUninstallAlert appHasiCloudDataOrDocuments]_block_invoke";
      __int16 v6 = 2080;
      int v7 = dlerror();
      id v3 = "%s: No CloudDocs entitlement checking because BREntitledContainerIdentifiersForPropertyList function was not found: %s";
LABEL_7:
      _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, v3, (uint8_t *)&v4, 0x16u);
    }
  }
  else
  {
    dispatch_queue_t v2 = sub_100004B28((uint64_t)off_100109BB8);
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
    {
      int v4 = 136315394;
      CFStringRef v5 = "-[IXSUninstallAlert appHasiCloudDataOrDocuments]_block_invoke";
      __int16 v6 = 2080;
      int v7 = dlerror();
      id v3 = "%s: No CloudDocs entitlement checking because CloudDocs framework failed to open: %s";
      goto LABEL_7;
    }
  }
}

id sub_1000429A4(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_onMainQueue_displayAlertWithCompletion:uninstallAlertConfiguration:", *(void *)(a1 + 48), *(void *)(a1 + 40));
}

void sub_100042B88(uint64_t a1, void *a2)
{
  id v3 = a2;
  int v4 = +[NSURL URLWithString:*(void *)(a1 + 32)];
  CFStringRef v5 = +[LSApplicationWorkspace defaultWorkspace];
  id v9 = 0;
  unsigned __int8 v6 = [v5 openSensitiveURL:v4 withOptions:0 error:&v9];
  id v7 = v9;

  if ((v6 & 1) == 0)
  {
    BOOL v8 = sub_100004B28((uint64_t)off_100109BB8);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      sub_1000928F8();
    }
  }
  v3[2](v3, 1, 0);
}

void sub_1000430A0(id a1, id a2)
{
}

id sub_1000430B8(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) otherButtonActionWithCompletion:a2];
}

id sub_1000430C4(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) otherButtonActionWithCompletion:a2];
}

void sub_1000430D0(id a1, id a2)
{
}

void sub_1000430E8(id a1, id a2)
{
}

void sub_100043100(id a1, id a2)
{
}

void sub_100043118(id a1, id a2)
{
}

void sub_100043130(id a1, id a2)
{
}

void sub_100043148(id a1, id a2)
{
}

void sub_100043160(id a1, id a2)
{
}

void sub_100043498(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, v9, OS_LOG_TYPE_ERROR, a4, &a9, 0x30u);
}

void sub_100043C2C(uint64_t a1, char a2, void *a3)
{
  id v5 = a3;
  if ((a2 & 1) == 0)
  {
    unsigned __int8 v6 = sub_100004B28((uint64_t)off_100109BB8);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      sub_100092AF8(a1, (uint64_t)v5, v6);
    }
  }
}

void sub_100043E08(id a1, id a2)
{
}

void sub_100043E20(id a1, id a2)
{
}

__CFString *IXStringForUninstallDisposition(unint64_t a1)
{
  if (a1 >= 5)
  {
    id v1 = +[NSString stringWithFormat:@"Unknown uninstall disposition: %lu", a1];
  }
  else
  {
    id v1 = off_1000EA5B0[a1];
  }

  return v1;
}

void sub_10004410C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t sub_100044124(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void sub_100044134(uint64_t a1)
{
}

void sub_10004413C(uint64_t a1)
{
  dispatch_queue_t v2 = [*(id *)(a1 + 32) stagingBaseDir];
  id v3 = [v2 URLByAppendingPathComponent:@"Data.data" isDirectory:0];

  uint64_t v4 = a1 + 48;
  id v5 = *(void **)(a1 + 40);
  uint64_t v6 = *(void *)(*(void *)(a1 + 48) + 8);
  id obj = *(id *)(v6 + 40);
  unsigned __int8 v7 = [v5 writeToURL:v3 options:268435457 error:&obj];
  objc_storeStrong((id *)(v6 + 40), obj);
  if (v7)
  {
    objc_msgSend(*(id *)(a1 + 32), "_internal_setStagedPath:", v3);
    [*(id *)(a1 + 32) setComplete:1];
  }
  else
  {
    BOOL v8 = sub_100004B28((uint64_t)off_100109BB8);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      sub_100092B84(v3, v4, v8);
    }

    id v9 = *(void **)(*(void *)(*(void *)v4 + 8) + 40);
    uint64_t v10 = [v3 path];
    uint64_t v12 = sub_10003DAE4((uint64_t)"-[IXSPromisedInMemoryData initWithSeed:data:error:]_block_invoke", 58, @"IXErrorDomain", 1uLL, v9, 0, @"Could not write data promise data to disk at %@", v11, (uint64_t)v10);

    uint64_t v13 = *(void *)(*(void *)v4 + 8);
    id v14 = *(void **)(v13 + 40);
    *(void *)(v13 + 40) = v12;
  }
}

__CFString *IXStringForCoordinatorScope(unsigned int a1)
{
  if (a1 >= 3)
  {
    id v1 = +[NSString stringWithFormat:@"Unknown IXCoordinatorScope value %hhu", a1];
  }
  else
  {
    id v1 = off_1000EA5D8[(char)a1];
  }

  return v1;
}

uint64_t sub_100045150()
{
  qword_100109F30 = (uint64_t)objc_alloc_init((Class)objc_opt_class());

  return _objc_release_x1();
}

id sub_1000455D8(void *a1)
{
  id v1 = [a1 componentsSeparatedByString:@"/"];
  dispatch_queue_t v2 = v1;
  if (v1 && [v1 count] == (id)2)
  {
    id v3 = [v2 objectAtIndexedSubscript:1];
    id v4 = [objc_alloc((Class)NSUUID) initWithUUIDString:v3];
  }
  else
  {
    id v4 = 0;
  }

  return v4;
}

id sub_100045674(uint64_t a1)
{
  return [*(id *)(a1 + 32) _scheduleNextTask];
}

void sub_100045704(uint64_t a1)
{
  dispatch_queue_t v2 = objc_msgSend(*(id *)(a1 + 32), "_onQueue_dequeueInstallTask");
  [*(id *)(a1 + 32) setScheduledInstallIsRunning:0];
  if (v2)
  {
    id v3 = *(void **)(a1 + 32);
    id v7 = 0;
    unsigned __int8 v4 = objc_msgSend(v3, "_onQueue_scheduleUpdateRequestForTask:error:", v2, &v7);
    id v5 = v7;
    if ((v4 & 1) == 0)
    {
      uint64_t v6 = sub_100004B28((uint64_t)off_100109BB8);
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315650;
        id v9 = "-[IXSAppUpdateScheduler _scheduleNextTask]_block_invoke";
        __int16 v10 = 2112;
        uint64_t v11 = v2;
        __int16 v12 = 2112;
        id v13 = v5;
        _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "%s: Failed to schedule install task %@ : %@. Executing it right away.", buf, 0x20u);
      }

      objc_msgSend(*(id *)(a1 + 32), "_onQueue_invokeInstallerForTask:", v2);
    }
  }
}

void sub_1000459BC(uint64_t a1, void *a2)
{
  id v3 = off_100109BB8;
  id v4 = a2;
  id v5 = sub_100004B28((uint64_t)v3);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v6 = *(void *)(a1 + 32);
    *(_DWORD *)buf = 136315394;
    id v15 = "-[IXSAppUpdateScheduler _onQueue_registerUpdateRequestForTask:]_block_invoke";
    __int16 v16 = 2112;
    uint64_t v17 = v6;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "%s: Running opportunistic install for: %@", buf, 0x16u);
  }

  [v4 identifier];
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_100045B94;
  v12[3] = &unk_1000E8FA8;
  id v7 = (id)objc_claimAutoreleasedReturnValue();
  id v13 = v7;
  [v4 setExpirationHandler:v12];
  BOOL v8 = [*(id *)(a1 + 40) internalQueue];
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_100045C5C;
  v10[3] = &unk_1000E8E08;
  v10[4] = *(void *)(a1 + 40);
  id v11 = v7;
  id v9 = v7;
  sub_100066F24(v8, v10);

  [v4 setTaskCompleted];
}

void sub_100045B94(uint64_t a1)
{
  dispatch_queue_t v2 = sub_100004B28((uint64_t)off_100109BB8);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = *(void *)(a1 + 32);
    int v4 = 136315394;
    id v5 = "-[IXSAppUpdateScheduler _onQueue_registerUpdateRequestForTask:]_block_invoke";
    __int16 v6 = 2112;
    uint64_t v7 = v3;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "%s: Expiration handler invoked for %@", (uint8_t *)&v4, 0x16u);
  }
}

id sub_100045C5C(uint64_t a1)
{
  [*(id *)(a1 + 32) setScheduledInstallIsRunning:1];
  objc_msgSend(*(id *)(a1 + 32), "_onQueue_invokeInstallerForTask:", *(void *)(a1 + 40));
  id result = [*(id *)(a1 + 32) scheduledInstallCount];
  if (result)
  {
    uint64_t v3 = *(void **)(a1 + 32);
    int v4 = (char *)[v3 scheduledInstallCount] - 1;
    return [v3 setScheduledInstallCount:v4];
  }
  return result;
}

void sub_1000461FC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v9 - 80), 8);
  _Unwind_Resume(a1);
}

uint64_t sub_100046220(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void sub_100046230(uint64_t a1)
{
}

void sub_100046238(uint64_t a1)
{
  dispatch_queue_t v2 = sub_1000463C8(*(void **)(a1 + 32));
  objc_msgSend(*(id *)(a1 + 40), "_onQueue_registerUpdateRequestForTask:", v2);
  if ([*(id *)(a1 + 40) scheduledInstallCount]
    || [*(id *)(a1 + 40) scheduledInstallIsRunning])
  {
    objc_msgSend(*(id *)(a1 + 40), "_onQueue_enqueueInstallTask:", v2);
    *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = 1;
  }
  else
  {
    uint64_t v3 = *(void **)(a1 + 40);
    uint64_t v4 = *(void *)(*(void *)(a1 + 56) + 8);
    id obj = *(id *)(v4 + 40);
    unsigned __int8 v5 = objc_msgSend(v3, "_onQueue_scheduleUpdateRequestForTask:error:", v2, &obj);
    objc_storeStrong((id *)(v4 + 40), obj);
    *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = v5;
    if (!*(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24))
    {
      __int16 v6 = sub_100004B28((uint64_t)off_100109BB8);
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v7 = *(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 40);
        *(_DWORD *)buf = 136315650;
        __int16 v10 = "-[IXSAppUpdateScheduler scheduleUpdateInstallForCoordinatorUUID:error:]_block_invoke";
        __int16 v11 = 2112;
        __int16 v12 = v2;
        __int16 v13 = 2112;
        uint64_t v14 = v7;
        _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "%s: Failed to schedule install for %@; running immediately (scheduling error: %@)",
          buf,
          0x20u);
      }

      objc_msgSend(*(id *)(a1 + 40), "_onQueue_invokeInstallerForTask:", v2);
    }
  }
}

id sub_1000463C8(void *a1)
{
  id v1 = [a1 UUIDString];
  dispatch_queue_t v2 = +[NSString stringWithFormat:@"com.apple.installcoordination/%@", v1];

  return v2;
}

void sub_1000464E8(uint64_t a1)
{
  dispatch_queue_t v2 = (uint64_t *)(a1 + 32);
  uint64_t v3 = sub_1000463C8(*(void **)(a1 + 32));
  uint64_t v4 = sub_100004B28((uint64_t)off_100109BB8);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG)) {
    sub_100092E18((uint64_t)v3, v4);
  }

  unsigned __int8 v5 = +[BGSystemTaskScheduler sharedScheduler];
  __int16 v6 = [v5 taskRequestForIdentifier:v3];
  if (v6)
  {
    if (([v5 deregisterTaskWithIdentifier:v3] & 1) == 0)
    {
      uint64_t v7 = sub_100004B28((uint64_t)off_100109BB8);
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        int v12 = 136315394;
        __int16 v13 = "-[IXSAppUpdateScheduler removeUpdateRequestForCoordinatorUUID:]_block_invoke";
        __int16 v14 = 2112;
        id v15 = v3;
        _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "%s: Failed to cancel the request for %@", (uint8_t *)&v12, 0x16u);
      }
    }
    BOOL v8 = [*(id *)(a1 + 40) queuedInstalls];
    unsigned int v9 = [v8 containsObject:v3];

    __int16 v10 = *(void **)(a1 + 40);
    if (v9)
    {
      objc_msgSend(v10, "_onQueue_removeEnqueuedTask:", v3);
    }
    else if ([v10 scheduledInstallCount])
    {
      objc_msgSend(*(id *)(a1 + 40), "setScheduledInstallCount:", (char *)objc_msgSend(*(id *)(a1 + 40), "scheduledInstallCount") - 1);
    }
  }
  else
  {
    __int16 v11 = sub_100004B28((uint64_t)off_100109BB8);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG)) {
      sub_100092D88(v2, v11);
    }
  }
}

id sub_100047510(uint64_t a1)
{
  *(void *)(*(void *)(a1 + 32) + 112) = 0;
  *(void *)(*(void *)(a1 + 32) + 12_Block_object_dispose(&STACK[0x2B0], 8) = 0;
  *(void *)(*(void *)(a1 + 32) + 120) = 0;
  *(void *)(*(void *)(a1 + 32) + 136) = 0;
  *(void *)(*(void *)(a1 + 32) + 192) = 1;
  return objc_msgSend(*(id *)(a1 + 32), "_onQueue_internal_saveState");
}

void sub_100047F44(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v9 - 80), 8);
  _Unwind_Resume(a1);
}

uint64_t sub_100047F68(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void sub_100047F78(uint64_t a1)
{
}

void sub_100047F80(uint64_t a1)
{
  uint64_t v1 = a1;
  dispatch_queue_t v2 = (id *)(a1 + 32);
  uint64_t v3 = [*(id *)(a1 + 32) identity];
  uint64_t v4 = *((void *)v2[1] + 1);
  id obj = *(id *)(v4 + 40);
  unsigned __int8 v5 = [v3 resolvePersonaWithError:&obj];
  objc_storeStrong((id *)(v4 + 40), obj);

  if ((v5 & 1) == 0)
  {
    __int16 v6 = sub_100004B28((uint64_t)off_100109BB8);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v7 = [*v2 identity];
      *(_DWORD *)buf = 136315394;
      v187 = "-[IXSCoordinatedAppInstall awakeFromSerializationWithError:]_block_invoke";
      __int16 v188 = 2112;
      v189 = v7;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "%s: Failed to resolve persona for %@", buf, 0x16u);
    }
  }
  BOOL v8 = [*v2 placeholderPromiseUUID];

  if (v8)
  {
    uint64_t v9 = +[IXSDataPromiseManager sharedInstance];
    __int16 v10 = [*v2 placeholderPromiseUUID];
    __int16 v11 = [v9 promiseForUUID:v10 ofType:objc_opt_class()];

    int v12 = (id *)*v2;
    if (v11)
    {
      objc_storeStrong(v12 + 3, v11);
      __int16 v13 = [v11 accessQueue];
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472;
      block[2] = sub_1000491FC;
      block[3] = &unk_1000E8E08;
      __int16 v14 = v11;
      id v15 = *v2;
      v182 = v14;
      id v183 = v15;
      dispatch_sync(v13, block);

      __int16 v16 = v182;
    }
    else
    {
      unint64_t v17 = (unint64_t)v12[40] & 0xFFFFFFFFFFFFFFFDLL;
      __int16 v18 = sub_100004B28((uint64_t)off_100109BB8);
      __int16 v16 = v18;
      if (v17 == 4)
      {
        if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
        {
          id v19 = [*v2 placeholderPromiseUUID];
          *(_DWORD *)buf = 136315394;
          v187 = "-[IXSCoordinatedAppInstall awakeFromSerializationWithError:]_block_invoke";
          __int16 v188 = 2112;
          v189 = v19;
          _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "%s: Unable to find placeholder promise with UUID %@; proceeding because it's not needed",
            buf,
            0x16u);
        }
      }
      else
      {
        if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR)) {
          sub_100093270();
        }

        __int16 v20 = [*(id *)(v1 + 32) identity];
        v141 = [*(id *)(v1 + 32) placeholderPromiseUUID];
        uint64_t v22 = sub_10003DAE4((uint64_t)"-[IXSCoordinatedAppInstall awakeFromSerializationWithError:]_block_invoke", 841, @"IXErrorDomain", 3uLL, 0, 0, @"%@: Failed to locate IXSPlaceholder instance with UUID %@ after deserialization", v21, (uint64_t)v20);

        uint64_t v23 = *(void *)(*(void *)(v1 + 48) + 8);
        __int16 v16 = *(NSObject **)(v23 + 40);
        *(void *)(v23 + 40) = v22;
      }
    }
  }
  id v24 = [*v2 appAssetPromiseUUID];

  if (v24)
  {
    int v25 = +[IXSDataPromiseManager sharedInstance];
    char v26 = [*v2 appAssetPromiseUUID];
    char v27 = [v25 promiseForUUID:v26 ofType:objc_opt_class()];

    if (v27)
    {
      objc_storeStrong((id *)*v2 + 4, v27);
      id v28 = [v27 accessQueue];
      v178[0] = _NSConcreteStackBlock;
      v178[1] = 3221225472;
      v178[2] = sub_100049204;
      v178[3] = &unk_1000E8E08;
      id v29 = v27;
      id v30 = *v2;
      id v179 = v29;
      id v180 = v30;
      dispatch_sync(v28, v178);

      id v31 = v179;
    }
    else
    {
      uint64_t v32 = sub_100004B28((uint64_t)off_100109BB8);
      if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR)) {
        sub_1000931C8();
      }

      id v33 = [*(id *)(v1 + 32) identity];
      v142 = [*(id *)(v1 + 32) appAssetPromiseUUID];
      uint64_t v35 = sub_10003DAE4((uint64_t)"-[IXSCoordinatedAppInstall awakeFromSerializationWithError:]_block_invoke", 857, @"IXErrorDomain", 3uLL, 0, 0, @"%@: Failed to locate app asset promise with UUID %@ after deserialization", v34, (uint64_t)v33);

      uint64_t v36 = *(void *)(*(void *)(v1 + 48) + 8);
      id v31 = *(void **)(v36 + 40);
      *(void *)(v36 + 40) = v35;
    }
  }
  unint64_t v37 = [*v2 initialODRAssetPromiseUUIDs];

  uint64_t v149 = v1;
  v150 = v2;
  if (v37)
  {
    id v38 = objc_opt_new();
    long long v174 = 0u;
    long long v175 = 0u;
    long long v176 = 0u;
    long long v177 = 0u;
    id v147 = [*v2 initialODRAssetPromiseUUIDs];
    id v39 = [v147 countByEnumeratingWithState:&v174 objects:v194 count:16];
    p_vtable = &OBJC_METACLASS___IXSPromisedInMemoryData.vtable;
    if (v39)
    {
      id v41 = v39;
      uint64_t v42 = *(void *)v175;
      do
      {
        dirent v43 = 0;
        do
        {
          if (*(void *)v175 != v42) {
            objc_enumerationMutation(v147);
          }
          uint64_t v44 = *(void *)(*((void *)&v174 + 1) + 8 * (void)v43);
          int v45 = [p_vtable + 122 sharedInstance];
          id v46 = [v45 promiseForUUID:v44 ofType:objc_opt_class()];

          if (v46)
          {
            [v38 addObject:v46];
            uint64_t v47 = [v46 accessQueue];
            v171[0] = _NSConcreteStackBlock;
            v171[1] = 3221225472;
            v171[2] = sub_10004920C;
            v171[3] = &unk_1000E8E08;
            id v48 = v46;
            id v49 = *v2;
            id v172 = v48;
            id v173 = v49;
            dispatch_sync(v47, v171);

            uint64_t v50 = v172;
          }
          else
          {
            uint64_t v51 = sub_100004B28((uint64_t)off_100109BB8);
            if (os_log_type_enabled(v51, OS_LOG_TYPE_ERROR))
            {
              id v56 = [*v150 identity];
              *(_DWORD *)buf = 136315906;
              v187 = "-[IXSCoordinatedAppInstall awakeFromSerializationWithError:]_block_invoke";
              __int16 v188 = 2112;
              v189 = v56;
              __int16 v190 = 2112;
              uint64_t v191 = v44;
              __int16 v192 = 2112;
              uint64_t v193 = 0;
              _os_log_error_impl((void *)&_mh_execute_header, v51, OS_LOG_TYPE_ERROR, "%s: %@: Failed to locate initial ODR promise instance with UUID %@ after deserialization : %@", buf, 0x2Au);
            }
            id v52 = [*(id *)(v149 + 32) identity];
            uint64_t v54 = sub_10003DAE4((uint64_t)"-[IXSCoordinatedAppInstall awakeFromSerializationWithError:]_block_invoke", 872, @"IXErrorDomain", 3uLL, 0, 0, @"%@: Failed to locate initial ODR promise instance with UUID %@ after deserialization", v53, (uint64_t)v52);

            uint64_t v55 = *(void *)(*(void *)(v149 + 48) + 8);
            uint64_t v50 = *(void **)(v55 + 40);
            *(void *)(v55 + 40) = v54;
            dispatch_queue_t v2 = v150;
            p_vtable = (void **)(&OBJC_METACLASS___IXSPromisedInMemoryData + 24);
          }

          dirent v43 = (char *)v43 + 1;
        }
        while (v41 != v43);
        id v41 = [v147 countByEnumeratingWithState:&v174 objects:v194 count:16];
      }
      while (v41);
    }

    id v57 = [v38 copy];
    long long v58 = (void *)*((void *)*v2 + 6);
    *((void *)*v2 + 6) = v57;

    uint64_t v1 = v149;
  }
  long long v59 = [*v2 userDataPromiseUUID];

  if (v59)
  {
    long long v60 = +[IXSDataPromiseManager sharedInstance];
    [*v2 userDataPromiseUUID];
    v62 = long long v61 = v2;
    long long v63 = [v60 promiseForUUID:v62 ofType:objc_opt_class()];

    if (v63)
    {
      objc_storeStrong((id *)*v61 + 7, v63);
      long long v64 = [v63 accessQueue];
      v168[0] = _NSConcreteStackBlock;
      v168[1] = 3221225472;
      v168[2] = sub_100049214;
      v168[3] = &unk_1000E8E08;
      id v65 = v63;
      id v66 = *v61;
      id v169 = v65;
      id v170 = v66;
      dispatch_sync(v64, v168);

      long long v67 = v169;
      dispatch_queue_t v2 = v61;
    }
    else
    {
      long long v68 = sub_100004B28((uint64_t)off_100109BB8);
      if (os_log_type_enabled(v68, OS_LOG_TYPE_ERROR)) {
        sub_100093120();
      }

      long long v69 = [*(id *)(v1 + 32) identity];
      v143 = [*(id *)(v1 + 32) userDataPromiseUUID];
      uint64_t v71 = sub_10003DAE4((uint64_t)"-[IXSCoordinatedAppInstall awakeFromSerializationWithError:]_block_invoke", 887, @"IXErrorDomain", 3uLL, 0, 0, @"%@: Failed to locate user data promise with UUID %@ after deserialization", v70, (uint64_t)v69);

      uint64_t v72 = *(void *)(*(void *)(v1 + 48) + 8);
      long long v67 = *(void **)(v72 + 40);
      *(void *)(v72 + 40) = v71;
      dispatch_queue_t v2 = v150;
    }
  }
  long long v73 = [*v2 preparationPromiseUUID];

  if (v73)
  {
    id v74 = +[IXSDataPromiseManager sharedInstance];
    [*v2 preparationPromiseUUID];
    id v76 = v75 = v2;
    v77 = [v74 promiseForUUID:v76 ofType:objc_opt_class()];

    if (v77)
    {
      objc_storeStrong((id *)*v75 + 9, v77);
      __int16 v78 = [v77 accessQueue];
      v165[0] = _NSConcreteStackBlock;
      v165[1] = 3221225472;
      v165[2] = sub_10004921C;
      v165[3] = &unk_1000E8E08;
      id v79 = v77;
      id v80 = *v75;
      id v166 = v79;
      id v167 = v80;
      dispatch_sync(v78, v165);

      v81 = v166;
      dispatch_queue_t v2 = v75;
    }
    else
    {
      v82 = sub_100004B28((uint64_t)off_100109BB8);
      if (os_log_type_enabled(v82, OS_LOG_TYPE_ERROR)) {
        sub_100093078();
      }

      __int16 v83 = [*(id *)(v1 + 32) identity];
      v144 = [*(id *)(v1 + 32) preparationPromiseUUID];
      uint64_t v85 = sub_10003DAE4((uint64_t)"-[IXSCoordinatedAppInstall awakeFromSerializationWithError:]_block_invoke", 900, @"IXErrorDomain", 3uLL, 0, 0, @"%@: Failed to locate preparation promise with UUID %@ after deserialization", v84, (uint64_t)v83);

      uint64_t v86 = *(void *)(*(void *)(v1 + 48) + 8);
      v81 = *(void **)(v86 + 40);
      *(void *)(v86 + 40) = v85;
      dispatch_queue_t v2 = v150;
    }
  }
  v87 = [*v2 installOptionsPromiseUUID];

  if (v87)
  {
    v88 = +[IXSDataPromiseManager sharedInstance];
    [*v2 installOptionsPromiseUUID];
    v90 = __int16 v89 = v2;
    v91 = [v88 promiseForUUID:v90 ofType:objc_opt_class()];

    if (v91)
    {
      objc_storeStrong((id *)*v89 + 10, v91);
      v92 = [v91 accessQueue];
      v162[0] = _NSConcreteStackBlock;
      v162[1] = 3221225472;
      v162[2] = sub_100049224;
      v162[3] = &unk_1000E8E08;
      id v93 = v91;
      id v94 = *v89;
      id v163 = v93;
      id v164 = v94;
      dispatch_sync(v92, v162);

      v95 = v163;
      dispatch_queue_t v2 = v89;
    }
    else
    {
      v96 = sub_100004B28((uint64_t)off_100109BB8);
      if (os_log_type_enabled(v96, OS_LOG_TYPE_ERROR)) {
        sub_100092FD0();
      }

      v97 = [*(id *)(v1 + 32) identity];
      v145 = [*(id *)(v1 + 32) installOptionsPromiseUUID];
      uint64_t v99 = sub_10003DAE4((uint64_t)"-[IXSCoordinatedAppInstall awakeFromSerializationWithError:]_block_invoke", 913, @"IXErrorDomain", 3uLL, 0, 0, @"%@: Failed to locate install options promise with UUID %@ after deserialization", v98, (uint64_t)v97);

      uint64_t v100 = *(void *)(*(void *)(v1 + 48) + 8);
      v95 = *(void **)(v100 + 40);
      *(void *)(v100 + 40) = v99;
      dispatch_queue_t v2 = v150;
    }
  }
  v101 = [*v2 deviceSecurityPromiseUUID];

  if (v101)
  {
    v102 = +[IXSDataPromiseManager sharedInstance];
    [*v2 deviceSecurityPromiseUUID];
    v104 = v103 = v2;
    v105 = [v102 promiseForUUID:v104 ofType:objc_opt_class()];

    if (v105)
    {
      objc_storeStrong((id *)*v103 + 8, v105);
      v106 = [v105 accessQueue];
      v159[0] = _NSConcreteStackBlock;
      v159[1] = 3221225472;
      v159[2] = sub_10004922C;
      v159[3] = &unk_1000E8E08;
      id v107 = v105;
      id v108 = *v103;
      id v160 = v107;
      id v161 = v108;
      dispatch_sync(v106, v159);

      v109 = v160;
      dispatch_queue_t v2 = v103;
    }
    else
    {
      v110 = sub_100004B28((uint64_t)off_100109BB8);
      if (os_log_type_enabled(v110, OS_LOG_TYPE_ERROR)) {
        sub_100092F28();
      }

      v111 = [*(id *)(v1 + 32) identity];
      v146 = [*(id *)(v1 + 32) deviceSecurityPromiseUUID];
      uint64_t v113 = sub_10003DAE4((uint64_t)"-[IXSCoordinatedAppInstall awakeFromSerializationWithError:]_block_invoke", 926, @"IXErrorDomain", 3uLL, 0, 0, @"%@: Failed to locate device security promise with UUID %@ after deserialization", v112, (uint64_t)v111);

      uint64_t v114 = *(void *)(*(void *)(v1 + 48) + 8);
      v109 = *(void **)(v114 + 40);
      *(void *)(v114 + 40) = v113;
      dispatch_queue_t v2 = v150;
    }
  }
  v115 = [*v2 essentialAssetPromiseUUIDs];

  if (v115)
  {
    v116 = objc_opt_new();
    long long v155 = 0u;
    long long v156 = 0u;
    long long v157 = 0u;
    long long v158 = 0u;
    id v148 = [*v2 essentialAssetPromiseUUIDs];
    id v117 = [v148 countByEnumeratingWithState:&v155 objects:v185 count:16];
    v118 = &OBJC_METACLASS___IXSPromisedInMemoryData.vtable;
    if (v117)
    {
      id v119 = v117;
      uint64_t v120 = *(void *)v156;
      do
      {
        v121 = 0;
        do
        {
          if (*(void *)v156 != v120) {
            objc_enumerationMutation(v148);
          }
          uint64_t v122 = *(void *)(*((void *)&v155 + 1) + 8 * (void)v121);
          v123 = [v118 + 122 sharedInstance];
          v124 = [v123 promiseForUUID:v122 ofType:objc_opt_class()];

          if (v124)
          {
            [v116 addObject:v124];
            v125 = [v124 accessQueue];
            v152[0] = _NSConcreteStackBlock;
            v152[1] = 3221225472;
            v152[2] = sub_100049234;
            v152[3] = &unk_1000E8E08;
            id v126 = v124;
            id v127 = *v2;
            id v153 = v126;
            id v154 = v127;
            dispatch_sync(v125, v152);

            v128 = v153;
          }
          else
          {
            v129 = sub_100004B28((uint64_t)off_100109BB8);
            if (os_log_type_enabled(v129, OS_LOG_TYPE_ERROR))
            {
              v134 = [*v150 identity];
              *(_DWORD *)buf = 136315906;
              v187 = "-[IXSCoordinatedAppInstall awakeFromSerializationWithError:]_block_invoke";
              __int16 v188 = 2112;
              v189 = v134;
              __int16 v190 = 2112;
              uint64_t v191 = v122;
              __int16 v192 = 2112;
              uint64_t v193 = 0;
              _os_log_error_impl((void *)&_mh_execute_header, v129, OS_LOG_TYPE_ERROR, "%s: %@: Failed to locate essential asset promise instance with UUID %@ after deserialization : %@", buf, 0x2Au);
            }
            v130 = [*(id *)(v149 + 32) identity];
            uint64_t v132 = sub_10003DAE4((uint64_t)"-[IXSCoordinatedAppInstall awakeFromSerializationWithError:]_block_invoke", 956, @"IXErrorDomain", 3uLL, 0, 0, @"%@: Failed to locate essential asset promise instance with UUID %@ after deserialization", v131, (uint64_t)v130);

            uint64_t v133 = *(void *)(*(void *)(v149 + 48) + 8);
            v128 = *(void **)(v133 + 40);
            *(void *)(v133 + 40) = v132;
            dispatch_queue_t v2 = v150;
            v118 = (void **)(&OBJC_METACLASS___IXSPromisedInMemoryData + 24);
          }

          v121 = (char *)v121 + 1;
        }
        while (v119 != v121);
        id v119 = [v148 countByEnumeratingWithState:&v155 objects:v185 count:16];
      }
      while (v119);
    }

    id v135 = [v116 copy];
    v136 = (void *)*((void *)*v2 + 11);
    *((void *)*v2 + 11) = v135;

    uint64_t v1 = v149;
  }
  v137 = sub_10003D008();
  v138 = [*(id *)(v1 + 32) identity];
  v139 = [v137 resumeProgressForIdentity:v138];
  [*(id *)(v1 + 32) setPublishedInstallProgress:v139];

  if (!*(void *)(*(void *)(*(void *)(v1 + 48) + 8) + 40)
    && !*(void *)(*(void *)(*(void *)(v1 + 40) + 8) + 40))
  {
    v140 = [*v150 internalQueue];
    v151[0] = _NSConcreteStackBlock;
    v151[1] = 3221225472;
    v151[2] = sub_10004923C;
    v151[3] = &unk_1000E8FA8;
    v151[4] = *v150;
    sub_100066F24(v140, v151);
  }
}

id sub_1000491FC(uint64_t a1)
{
  return [*(id *)(a1 + 32) setDelegate:*(void *)(a1 + 40)];
}

id sub_100049204(uint64_t a1)
{
  return [*(id *)(a1 + 32) setDelegate:*(void *)(a1 + 40)];
}

id sub_10004920C(uint64_t a1)
{
  return [*(id *)(a1 + 32) setDelegate:*(void *)(a1 + 40)];
}

id sub_100049214(uint64_t a1)
{
  return [*(id *)(a1 + 32) setDelegate:*(void *)(a1 + 40)];
}

id sub_10004921C(uint64_t a1)
{
  return [*(id *)(a1 + 32) setDelegate:*(void *)(a1 + 40)];
}

id sub_100049224(uint64_t a1)
{
  return [*(id *)(a1 + 32) setDelegate:*(void *)(a1 + 40)];
}

id sub_10004922C(uint64_t a1)
{
  return [*(id *)(a1 + 32) setDelegate:*(void *)(a1 + 40)];
}

id sub_100049234(uint64_t a1)
{
  return [*(id *)(a1 + 32) setDelegate:*(void *)(a1 + 40)];
}

id sub_10004923C(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_onQueue_checkState");
}

id sub_1000494F8(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_onAssertionQueue_setTermAssertion:", *(void *)(a1 + 40));
}

id sub_10004958C(uint64_t a1)
{
  dispatch_queue_t v2 = sub_100004B28((uint64_t)off_100109BB8);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = *(void *)(a1 + 32);
    int v5 = 136315394;
    __int16 v6 = "-[IXSCoordinatedAppInstall handleFirstUnlockNotification]_block_invoke";
    __int16 v7 = 2112;
    uint64_t v8 = v3;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "%s: Handling first unlock for %@", (uint8_t *)&v5, 0x16u);
  }

  return objc_msgSend(*(id *)(a1 + 32), "_onQueue_checkState");
}

void sub_100049FB4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,uint64_t a48,uint64_t a49,uint64_t a50,uint64_t a51,uint64_t a52,uint64_t a53,uint64_t a54,uint64_t a55,uint64_t a56,uint64_t a57,uint64_t a58,uint64_t a59,uint64_t a60,uint64_t a61,uint64_t a62,uint64_t a63)
{
  _Block_object_dispose(&a65, 8);
  _Unwind_Resume(a1);
}

id sub_10004A010(uint64_t a1)
{
  id result = [*(id *)(a1 + 32) isComplete];
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = (_BYTE)result;
  return result;
}

id sub_10004A044(uint64_t a1)
{
  id result = [*(id *)(a1 + 32) isComplete];
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = (_BYTE)result;
  return result;
}

id sub_10004A078(uint64_t a1)
{
  id result = [*(id *)(a1 + 32) isComplete];
  if ((result & 1) == 0) {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 0;
  }
  return result;
}

id sub_10004A0B0(uint64_t a1)
{
  id result = [*(id *)(a1 + 32) isComplete];
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = (_BYTE)result;
  return result;
}

id sub_10004A0E4(uint64_t a1)
{
  id result = [*(id *)(a1 + 32) isComplete];
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = (_BYTE)result;
  return result;
}

id sub_10004A118(uint64_t a1)
{
  id result = [*(id *)(a1 + 32) isComplete];
  if ((result & 1) == 0) {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 0;
  }
  return result;
}

void sub_10004A55C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t sub_10004A58C(uint64_t a1)
{
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = [*(id *)(a1 + 32) appReference];

  return _objc_release_x1();
}

id sub_10004AB40(uint64_t a1)
{
  return [*(id *)(a1 + 32) setComplete:1];
}

id sub_10004AB4C(uint64_t a1)
{
  return [*(id *)(a1 + 32) setComplete:1];
}

void sub_10004ACBC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_10004ACD4(uint64_t a1)
{
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  dispatch_queue_t v2 = *(NSObject **)(*(void *)(*(void *)(a1 + 40) + 8) + 40);

  dispatch_group_leave(v2);
}

void sub_10004AE24(uint64_t a1)
{
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  dispatch_queue_t v2 = [*(id *)(a1 + 32) outstandingInstallOperationsGroup];
  dispatch_group_leave(v2);
}

id sub_10004BAC4(uint64_t a1)
{
  id result = (id)dispatch_source_testcancel(*(dispatch_source_t *)(a1 + 32));
  if (!result)
  {
    uint64_t v3 = sub_100004B28((uint64_t)off_100109BB8);
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v4 = *(void *)(a1 + 40);
      int v5 = 136315394;
      __int16 v6 = "-[IXSCoordinatedAppInstall _onQueue_handleAssertionAcquisitionFailureForPlaceholder:withError:]_block_invoke";
      __int16 v7 = 2112;
      uint64_t v8 = v4;
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "%s: Retrying assertion for %@", (uint8_t *)&v5, 0x16u);
    }

    return objc_msgSend(*(id *)(a1 + 40), "_onQueue_acquireAssertionForPlaceholder:", *(unsigned __int8 *)(a1 + 48));
  }
  return result;
}

id sub_10004BE88(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 40), "_onQueue_handleAssertionAcquisitionFailureForPlaceholder:withError:", *(unsigned __int8 *)(a1 + 56), *(void *)(a1 + 48));
}

void sub_10004C6F8(uint64_t a1, void *a2)
{
  if (!*(unsigned char *)(a1 + 48))
  {
    uint64_t v3 = [a2 objectForKeyedSubscript:kMICallbackPercentCompleteKey];
    id v4 = [v3 unsignedLongValue];
    int v5 = *(void **)(a1 + 32);
    if (v5)
    {
      [v5 setTotalUnitCount:100];
      [*(id *)(a1 + 32) setCompletedUnitCount:v4];
    }
    __int16 v6 = [*(id *)(a1 + 40) internalQueue];
    v7[0] = _NSConcreteStackBlock;
    v7[1] = 3221225472;
    v7[2] = sub_10004C7DC;
    v7[3] = &unk_1000E8D28;
    v7[4] = *(void *)(a1 + 40);
    void v7[5] = v4;
    sub_100066F24(v6, v7);
  }
}

id sub_10004C7DC(uint64_t a1)
{
  dispatch_queue_t v2 = [*(id *)(a1 + 32) coordinatorProgress];
  [v2 setTotalUnits:100];

  uint64_t v3 = *(void *)(a1 + 40);
  id v4 = [*(id *)(a1 + 32) coordinatorProgress];
  [v4 setTotalUnitsCompleted:v3];

  int v5 = *(void **)(a1 + 32);
  double v6 = (double)*(unint64_t *)(a1 + 40) / 100.0;

  return objc_msgSend(v5, "_onQueue_setInstallProgressPercentComplete:forPhase:", 1, v6);
}

id sub_10004C868(uint64_t a1)
{
  int v2 = *(unsigned __int8 *)(a1 + 48);
  uint64_t v3 = *(void **)(a1 + 32);
  uint64_t v4 = *(void *)(a1 + 40);
  if (v2) {
    return objc_msgSend(v3, "_onQueue_finishProgress:", v4);
  }
  else {
    return objc_msgSend(v3, "_onQueue_cancelProgress:", v4);
  }
}

void sub_10004CC34(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,char a29)
{
}

void sub_10004CC64(uint64_t a1)
{
  int v2 = [*(id *)(a1 + 32) assertionQueue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10004CCF4;
  block[3] = &unk_1000E8FA8;
  void block[4] = *(void *)(a1 + 32);
  dispatch_sync(v2, block);
}

id sub_10004CCF4(uint64_t a1)
{
  id result = [*(id *)(a1 + 32) needsPostProcessing];
  if ((result & 1) == 0)
  {
    uint64_t v3 = *(void **)(a1 + 32);
    return objc_msgSend(v3, "_onAssertionQueue_setTermAssertion:", 0);
  }
  return result;
}

uint64_t sub_10004CD44(uint64_t a1, void *a2, void *a3)
{
  id v5 = a3;
  id v6 = a2;
  id v7 = objc_alloc_init((Class)LSOperationRequestContext);
  uint64_t v8 = +[NSNumber numberWithUnsignedInt:geteuid()];
  [v7 setTargetUserID:v8];

  if (!*(unsigned char *)(a1 + 72) && [*(id *)(a1 + 32) effectiveIntent] == (id)2)
  {
    uint64_t v9 = *(void **)(a1 + 40);
    __int16 v10 = [*(id *)(a1 + 32) identity];
    __int16 v11 = [v10 bundleID];
    id v30 = 0;
    unsigned __int8 v12 = [v9 sendNotificationOfType:0 forApplicationWithBundleIdentifier:v11 requestContext:v7 error:&v30];
    id v13 = v30;

    if (v12) {
      goto LABEL_12;
    }
    __int16 v14 = sub_100004B28((uint64_t)off_100109BB8);
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
      sub_1000939A0();
    }
LABEL_10:

    goto LABEL_11;
  }
  if ([*(id *)(a1 + 32) effectiveIntent] == (id)6)
  {
    id v15 = *(void **)(a1 + 40);
    __int16 v16 = [*(id *)(a1 + 32) identity];
    unint64_t v17 = [v16 bundleID];
    id v29 = 0;
    unsigned __int8 v18 = [v15 sendNotificationOfType:1 forApplicationWithBundleIdentifier:v17 requestContext:v7 error:&v29];
    id v13 = v29;

    if (v18) {
      goto LABEL_12;
    }
    __int16 v14 = sub_100004B28((uint64_t)off_100109BB8);
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
      sub_100093A54();
    }
    goto LABEL_10;
  }
LABEL_11:
  id v13 = 0;
LABEL_12:
  id v19 = [*(id *)(a1 + 32) identity];
  __int16 v20 = [v19 bundleID];
  BOOL v21 = sub_1000392E4(v20, 16);

  if (v21)
  {
    uint64_t v22 = [*(id *)(a1 + 32) internalQueue];
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_10004D070;
    block[3] = &unk_1000E8FA8;
    void block[4] = *(void *)(a1 + 32);
    dispatch_async(v22, block);
  }
  uint64_t v23 = [*(id *)(a1 + 32) identity];
  id v24 = [v23 miAppIdentity];
  [*(id *)(a1 + 32) installationDomain];
  uint64_t v25 = MobileInstallationInstallApplicationWithIdentityAndAssertionBlockWithError();

  id v26 = 0;
  if (v25) {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 64) + 8) + 40), 0);
  }

  return v25;
}

void sub_10004D070(uint64_t a1)
{
  int v2 = [*(id *)(a1 + 32) identity];
  uint64_t v3 = [v2 bundleID];
  sub_10003DAE4((uint64_t)"-[IXSCoordinatedAppInstall _limitedConcurrency_installApplication:isPlaceholder:options:retries:error:]_block_invoke", 1982, @"IXErrorDomain", 0x36uLL, 0, 0, @"Testing preemptive cancelation of coordinator for %@", v4, (uint64_t)v3);
  id v5 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(a1 + 32), "_onQueue_internal_cancelForReason:client:", v5, 15);
}

void sub_10004D6BC(uint64_t a1, void *a2)
{
  uint64_t v4 = [a2 objectForKeyedSubscript:@"CACHE_DELETE_ERROR"];
  if (v4)
  {
    id v5 = sub_100004B28((uint64_t)off_100109BB8);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      id v6 = [*(id *)(a1 + 32) bundleID];
      int v7 = 136315650;
      uint64_t v8 = "-[IXSCoordinatedAppInstall _finishPlaceholderInstallAtURL:result:recordPromise:error:]_block_invoke";
      __int16 v9 = 2112;
      __int16 v10 = v6;
      __int16 v11 = 2112;
      unsigned __int8 v12 = v4;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "%s: Failed to purge cache for app with bundleID '%@': %@", (uint8_t *)&v7, 0x20u);
    }
  }
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 40));
}

id sub_10004D7DC(uint64_t a1)
{
  return [*(id *)(a1 + 32) setTermAssertion:0];
}

id sub_10004D7E8(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_onQueue_handleCancelForInstallFailure:", *(void *)(a1 + 40));
}

void sub_10004D7F4(uint64_t a1)
{
  int v2 = (id *)(a1 + 32);
  uint64_t v3 = [*(id *)(a1 + 32) placeholderFailureInfo];

  if (v3)
  {
    id v4 = *v2;
    id v5 = [*v2 placeholderFailureInfo];
    id v6 = [v5 installType];
    int v7 = [*v2 placeholderFailureInfo];
    id v8 = [v7 reason];
    __int16 v9 = [*v2 placeholderFailureInfo];
    __int16 v10 = [v9 underlyingError];
    __int16 v11 = [*v2 placeholderFailureInfo];
    objc_msgSend(v4, "_asyncUpdatePlaceholderMetadataWithInstallType:reason:underlyingError:client:", v6, v8, v10, objc_msgSend(v11, "client"));

    [*v2 setPlaceholderFailureInfo:0];
  }
  unsigned __int8 v12 = [*v2 error];

  if (v12)
  {
    id v13 = sub_100004B28((uint64_t)off_100109BB8);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      id v14 = *v2;
      *(_DWORD *)buf = 136315394;
      BOOL v21 = "-[IXSCoordinatedAppInstall _finishPlaceholderInstallAtURL:result:recordPromise:error:]_block_invoke_2";
      __int16 v22 = 2112;
      id v23 = v14;
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "%s: %@: Placeholder install completed successfully but coordinator was canceled while install was in flight; ignoring",
        buf,
        0x16u);
    }
  }
  else
  {
    id v15 = [*v2 placeholderPromise];
    id v13 = v15;
    if (v15)
    {
      __int16 v16 = [v15 accessQueue];
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472;
      block[2] = sub_10004DA84;
      block[3] = &unk_1000E8FA8;
      id v19 = v13;
      dispatch_sync(v16, block);

      unint64_t v17 = v19;
    }
    else
    {
      unint64_t v17 = sub_100004B28((uint64_t)off_100109BB8);
      if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
        sub_100093C34();
      }
    }

    [*(id *)(a1 + 32) setPlaceholderInstallState:4 withLSRecordPromiseForCompletion:*(void *)(a1 + 40)];
    objc_msgSend(*(id *)(a1 + 32), "_onQueue_checkState");
  }
}

id sub_10004DA84(uint64_t a1)
{
  return [*(id *)(a1 + 32) setStagedPathMayNotExistWhenAwakening:1];
}

void sub_10004EC9C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,char a44,uint64_t a45,uint64_t a46,uint64_t a47,uint64_t a48,uint64_t a49,char a50,uint64_t a51,uint64_t a52,uint64_t a53,uint64_t a54,uint64_t a55,char a56)
{
  _Block_object_dispose(&a44, 8);
  _Block_object_dispose(&a50, 8);
  _Block_object_dispose(&a56, 8);
  _Block_object_dispose((const void *)(v56 - 176), 8);
  _Block_object_dispose((const void *)(v56 - 248), 8);
  _Unwind_Resume(a1);
}

uint64_t sub_10004ED28(uint64_t a1)
{
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = [*(id *)(a1 + 32) isComplete];
  uint64_t v2 = [*(id *)(a1 + 32) stagedPath];
  uint64_t v3 = *(void *)(*(void *)(a1 + 48) + 8);
  id v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;

  uint64_t v5 = [*(id *)(a1 + 32) metadata];
  uint64_t v6 = *(void *)(*(void *)(a1 + 56) + 8);
  int v7 = *(void **)(v6 + 40);
  *(void *)(v6 + 40) = v5;

  *(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 24) = [*(id *)(a1 + 32) installType];
  *(void *)(*(void *)(*(void *)(a1 + 72) + 8) + 40) = [*(id *)(a1 + 32) sinfData];

  return _objc_release_x1();
}

id sub_10004EDDC(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_onQueue_internal_cancelForReason:client:", *(void *)(a1 + 40), 15);
}

id sub_10004EDEC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  [*(id *)(a1 + 32) _finishPlaceholderInstallAtURL:*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) result:a3 == 0 recordPromise:0 error:a3];
  id v4 = *(void **)(a1 + 40);

  return [v4 invalidate];
}

void sub_10004EE44(uint64_t a1)
{
  uint64_t v2 = *(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 40);
  uint64_t v3 = *(void **)(a1 + 32);
  uint64_t v4 = *(void *)(a1 + 40);
  id v7 = 0;
  uint64_t v5 = objc_msgSend(v3, "_limitedConcurrency_installApplication:isPlaceholder:options:retries:error:", v2, 1, v4, 5, &v7);
  id v6 = v7;
  [*(id *)(a1 + 32) _finishPlaceholderInstallAtURL:*(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) result:v5 != 0 recordPromise:v5 error:v6];
  [*(id *)(a1 + 48) invalidate];
}

void sub_10004F588(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t sub_10004F5C0(uint64_t a1)
{
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = [*(id *)(a1 + 32) stagedPath];

  return _objc_release_x1();
}

id sub_10004FD5C(uint64_t a1)
{
  [*(id *)(a1 + 32) setTermAssertion:0];
  uint64_t v2 = *(void **)(a1 + 32);
  uint64_t v3 = *(void *)(a1 + 40);

  return objc_msgSend(v2, "_onQueue_handleCancelForInstallFailure:", v3);
}

void sub_10004FD9C(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) error];

  if (v2)
  {
    uint64_t v3 = sub_100004B28((uint64_t)off_100109BB8);
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v4 = *(void *)(a1 + 32);
      int v6 = 136315394;
      id v7 = "-[IXSCoordinatedAppInstall _finishAppInstallAtURL:result:recordPromise:error:]_block_invoke_2";
      __int16 v8 = 2112;
      uint64_t v9 = v4;
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "%s: %@: App completed installation successfully but coordinator was canceled while install was in flight; ignoring.",
        (uint8_t *)&v6,
        0x16u);
    }
  }
  else
  {
    [*(id *)(a1 + 32) setCompletedRecordPromise:*(void *)(a1 + 40)];
    [*(id *)(a1 + 32) setAppInstallState:4];
    objc_msgSend(*(id *)(a1 + 32), "_onQueue_saveState");
    uint64_t v5 = *(void **)(a1 + 32);
    objc_msgSend(v5, "_onQueue_checkState");
  }
}

void sub_1000500E8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t sub_100050104(uint64_t a1)
{
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = [*(id *)(a1 + 32) appReference];

  return _objc_release_x1();
}

id sub_100050150(uint64_t a1)
{
  return [*(id *)(a1 + 32) markAppReferenceAsConsumed];
}

void sub_100050960(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 176), 8);
  _Unwind_Resume(a1);
}

void sub_1000509A0(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) stagedPath];
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
  uint64_t v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;

  uint64_t v5 = [*(id *)(a1 + 32) targetLastPathComponent];
  if (v5)
  {
    int v6 = sub_100004B28((uint64_t)off_100109BB8);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      id v7 = [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) path];
      int v11 = 136315650;
      unsigned __int8 v12 = "-[IXSCoordinatedAppInstall _onQueue_doInstall]_block_invoke";
      __int16 v13 = 2112;
      id v14 = v7;
      __int16 v15 = 2112;
      __int16 v16 = v5;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "%s: Updating the promise path from %@ based on the last path component for the target %@", (uint8_t *)&v11, 0x20u);
    }
    uint64_t v8 = [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) URLByAppendingPathComponent:v5 isDirectory:1];
    uint64_t v9 = *(void *)(*(void *)(a1 + 40) + 8);
    __int16 v10 = *(void **)(v9 + 40);
    *(void *)(v9 + 40) = v8;
  }
}

id sub_100050AF8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  [*(id *)(a1 + 32) _finishAppInstallAtURL:*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) result:a3 == 0 recordPromise:0 error:a3];
  uint64_t v4 = *(void **)(a1 + 40);

  return [v4 invalidate];
}

void sub_100050B50(uint64_t a1)
{
  uint64_t v3 = a1 + 32;
  uint64_t v2 = *(void **)(a1 + 32);
  uint64_t v4 = *(void *)(v3 + 8);
  uint64_t v5 = *(void *)(*(void *)(*(void *)(v3 + 16) + 8) + 40);
  id v15 = 0;
  int v6 = objc_msgSend(v2, "_limitedConcurrency_installApplication:isPlaceholder:options:retries:error:", v5, 0, v4, 5, &v15);
  id v7 = v15;
  if (*(unsigned char *)(v3 + 24)) {
    uint64_t v8 = 0;
  }
  else {
    uint64_t v8 = v6;
  }
  if (*(unsigned char *)(v3 + 24)) {
    BOOL v9 = v6 == 0;
  }
  else {
    BOOL v9 = 1;
  }
  if (!v9)
  {
    __int16 v10 = [*(id *)v3 identity];
    id v11 = [*(id *)v3 installationDomain];
    id v14 = 0;
    uint64_t v8 = sub_100015794(v10, (uint64_t)v11, &v14);
    id v12 = v14;

    if (!v8)
    {
      __int16 v13 = sub_100004B28((uint64_t)off_100109BB8);
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
        sub_100094478();
      }
    }
  }
  [*(id *)(a1 + 32) _finishAppInstallAtURL:*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) result:v6 != 0 recordPromise:v8 error:v7];
}

id sub_100051940(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_client_coordinatorDidRegisterForObservationWithUUID:", *(void *)(a1 + 40));
}

void sub_10005194C(uint64_t a1)
{
  uint64_t v2 = *(void **)(a1 + 32);
  uint64_t v3 = *(void *)(a1 + 40);
  id v4 = [*(id *)(a1 + 48) error];
  objc_msgSend(v2, "_client_coordinatorWithUUID:didCancelWithReason:client:", v3, v4, objc_msgSend(*(id *)(a1 + 48), "errorSourceIdentifier"));
}

id sub_1000519C0(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_client_coordinatorDidCompleteSuccessfullyWithUUID:forRecordPromise:", *(void *)(a1 + 40), *(void *)(a1 + 48));
}

BOOL sub_1000519D0(void *a1)
{
  id v1 = a1;
  uint64_t v2 = v1;
  if (v1)
  {
    uint64_t v9 = 0;
    __int16 v10 = &v9;
    uint64_t v11 = 0x2020000000;
    char v12 = 0;
    uint64_t v3 = [v1 accessQueue];
    v6[0] = _NSConcreteStackBlock;
    v6[1] = 3221225472;
    v6[2] = sub_100064508;
    v6[3] = &unk_1000E90A8;
    uint64_t v8 = &v9;
    id v7 = v2;
    dispatch_sync(v3, v6);

    BOOL v4 = *((unsigned char *)v10 + 24) != 0;
    _Block_object_dispose(&v9, 8);
  }
  else
  {
    BOOL v4 = 0;
  }

  return v4;
}

void sub_100051AC4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id sub_100051ADC(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_client_coordinatorWithUUID:configuredPromiseDidBeginFulfillment:", *(void *)(a1 + 40), 1);
}

id sub_100051AEC(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_client_coordinatorWithUUID:configuredPromiseDidBeginFulfillment:", *(void *)(a1 + 40), 2);
}

id sub_100051AFC(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_client_coordinatorShouldBeginRestoringUserDataWithUUID:", *(void *)(a1 + 40));
}

id sub_100051B08(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_client_coordinatorShouldBeginPostProcessingWithUUID:forRecordPromise:", *(void *)(a1 + 40), *(void *)(a1 + 48));
}

id sub_100051B18(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_client_coordinatorWithUUID:configuredPromiseDidBeginFulfillment:", *(void *)(a1 + 40), 3);
}

id sub_100051B28(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_client_coordinatorWithUUID:configuredPromiseDidBeginFulfillment:", *(void *)(a1 + 40), 4);
}

id sub_100051B38(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_client_coordinatorWithUUID:configuredPromiseDidBeginFulfillment:", *(void *)(a1 + 40), 5);
}

id sub_100051B48(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_client_coordinatorWithUUID:configuredPromiseDidBeginFulfillment:", *(void *)(a1 + 40), 6);
}

id sub_100051B58(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_client_coordinatorWithUUID:configuredPromiseDidBeginFulfillment:", *(void *)(a1 + 40), 8);
}

id sub_100051B68(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_client_coordinatorDidInstallPlaceholderWithUUID:forRecordPromise:", *(void *)(a1 + 40), 0);
}

id sub_100051B78(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_client_coordinatorShouldPauseWithUUID:", *(void *)(a1 + 40));
}

id sub_100051B84(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_client_coordinatorShouldResumeWithUUID:", *(void *)(a1 + 40));
}

void sub_100051EEC(void *a1, void *a2, uint64_t a3)
{
  id v5 = a1;
  id v6 = a2;
  if (v5)
  {
    id v7 = [v5 accessQueue];
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_100064578;
    block[3] = &unk_1000E9738;
    id v9 = v5;
    id v10 = v6;
    uint64_t v11 = a3;
    dispatch_sync(v7, block);
  }
}

id sub_100051FC0(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 24) supersede];
}

id sub_100051FCC(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(void *)(a1 + 32) + 24), "setDelegate:");
}

id sub_10005213C(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 32) supersede];
}

id sub_100052148(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(void *)(a1 + 32) + 32), "setDelegate:");
}

id sub_100052920(uint64_t a1)
{
  return [*(id *)(a1 + 32) setDelegate:*(void *)(a1 + 40)];
}

void sub_100052928(uint64_t a1)
{
  uint64_t v2 = *(void **)(a1 + 32);
  uint64_t v3 = [*(id *)(a1 + 40) uniqueIdentifier];
  LOBYTE(v2) = [v2 containsObject:v3];

  if ((v2 & 1) == 0)
  {
    BOOL v4 = *(void **)(a1 + 40);
    [v4 supersede];
  }
}

id sub_100052C18(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 56) supersede];
}

id sub_100052C24(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(void *)(a1 + 32) + 56), "setDelegate:");
}

id sub_100052EAC(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 64) supersede];
}

id sub_100052EB8(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(void *)(a1 + 32) + 64), "setDelegate:");
}

id sub_1000530DC(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 72) supersede];
}

id sub_1000530E8(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(void *)(a1 + 32) + 72), "setDelegate:");
}

id sub_100053258(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 80) supersede];
}

id sub_100053264(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(void *)(a1 + 32) + 80), "setDelegate:");
}

id sub_100053A40(uint64_t a1)
{
  return [*(id *)(a1 + 32) setDelegate:*(void *)(a1 + 40)];
}

void sub_100053A48(uint64_t a1)
{
  uint64_t v2 = *(void **)(a1 + 32);
  uint64_t v3 = [*(id *)(a1 + 40) uniqueIdentifier];
  LOBYTE(v2) = [v2 containsObject:v3];

  if ((v2 & 1) == 0)
  {
    BOOL v4 = *(void **)(a1 + 40);
    [v4 supersede];
  }
}

uint64_t sub_100053E98(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t sub_100053EAC(uint64_t a1)
{
  int v2 = *(unsigned __int8 *)(a1 + 48);
  uint64_t v3 = +[IXSAppInstallObserverManager sharedInstance];
  BOOL v4 = v3;
  uint64_t v5 = *(void *)(a1 + 32);
  if (v2) {
    [v3 coordinatorShouldPause:v5];
  }
  else {
    [v3 coordinatorShouldResume:v5];
  }

  uint64_t result = *(void *)(a1 + 40);
  if (result)
  {
    id v7 = *(uint64_t (**)(void))(result + 16);
    return v7();
  }
  return result;
}

id sub_100053FF4(uint64_t a1)
{
  return [*(id *)(a1 + 32) setIsPaused:*(unsigned __int8 *)(a1 + 48) completion:*(void *)(a1 + 40)];
}

void sub_1000540C4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id sub_1000540DC(uint64_t a1)
{
  id result = [*(id *)(a1 + 32) isPaused];
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = (_BYTE)result;
  return result;
}

uint64_t sub_1000548B8(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void sub_100054AC0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id sub_100054B8C(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_onQueue_prioritizeWithCompletion:", *(void *)(a1 + 40));
}

uint64_t sub_100054E34(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t sub_100054E48(uint64_t a1)
{
  int v2 = +[IXSAppInstallObserverManager sharedInstance];
  [v2 coordinatorShouldPrioritize:*(void *)(a1 + 32)];

  uint64_t result = *(void *)(a1 + 40);
  if (result)
  {
    BOOL v4 = *(uint64_t (**)(void))(result + 16);
    return v4();
  }
  return result;
}

void sub_1000555F4(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 128), 8);
  _Unwind_Resume(a1);
}

void sub_100055624(uint64_t a1)
{
  int v2 = (id *)(a1 + 32);
  uint64_t v3 = [*(id *)(a1 + 32) identity];
  uint64_t v23 = kMIUninstallParallelPlaceholderKey;
  id v24 = &__kCFBooleanTrue;
  BOOL v4 = +[NSDictionary dictionaryWithObjects:&v24 forKeys:&v23 count:1];
  uint64_t v5 = IXStringForClientID((unint64_t)[*v2 creator]);
  id v6 = +[NSString stringWithFormat:@"Parallel placeholder cleanup for %@ after post processing, creator: %@", v3, v5];

  v16[1] = 0;
  char v7 = sub_1000136C0(v3, v4, v6);
  id v8 = 0;
  if ((v7 & 1) == 0)
  {
    id v9 = sub_100004B28((uint64_t)off_100109BB8);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315650;
      unsigned __int8 v18 = "-[IXSCoordinatedAppInstall setComplete:]_block_invoke";
      __int16 v19 = 2112;
      __int16 v20 = v3;
      __int16 v21 = 2112;
      id v22 = v8;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "%s: Failed to uninstall parallel placeholder %@: %@", buf, 0x20u);
    }
  }
  sub_100014D94(@"Resync after uninstalling parallel placeholder");
  id v10 = [*(id *)(a1 + 32) installationDomain];
  v16[0] = 0;
  uint64_t v11 = sub_100015794(v3, (uint64_t)v10, v16);
  id v12 = v16[0];
  uint64_t v13 = *(void *)(*(void *)(a1 + 40) + 8);
  id v14 = *(void **)(v13 + 40);
  *(void *)(v13 + 40) = v11;

  if (!*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40))
  {
    id v15 = sub_100004B28((uint64_t)off_100109BB8);
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
      sub_100094620();
    }
  }
}

void sub_100055870(void *a1)
{
  id v1 = a1;
  int v2 = v1;
  if (v1)
  {
    uint64_t v3 = [v1 accessQueue];
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_100064570;
    block[3] = &unk_1000E8FA8;
    id v5 = v2;
    dispatch_sync(v3, block);
  }
}

void sub_100055918(uint64_t a1)
{
  id v2 = +[IXSAppInstallObserverManager sharedInstance];
  [v2 coordinatorDidCompleteSuccessfully:*(void *)(a1 + 32) forRecordPromise:*(void *)(a1 + 40)];
}

void sub_100055B34(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) identity];
  uint64_t v3 = [v2 bundleID];
  BOOL v4 = MobileInstallationUpdatePlaceholderMetadata();

  if (v4)
  {
    id v5 = sub_100004B28((uint64_t)off_100109BB8);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      id v6 = [*(id *)(a1 + 32) identity];
      int v7 = 136315650;
      id v8 = "-[IXSCoordinatedAppInstall _asyncUpdatePlaceholderMetadataWithInstallType:reason:underlyingError:client:]_block_invoke";
      __int16 v9 = 2112;
      id v10 = v6;
      __int16 v11 = 2112;
      id v12 = v4;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "%s: Failed to update placeholder metadata for %@ : %@", (uint8_t *)&v7, 0x20u);
    }
  }
}

void sub_100056248(uint64_t a1)
{
  id v2 = +[IXSAppInstallObserverManager sharedInstance];
  [v2 coordinatorShouldBeginRestoringUserData:*(void *)(a1 + 32)];
}

void sub_1000563D0(uint64_t a1)
{
  uint64_t v14 = kMIUninstallParallelPlaceholderKey;
  id v15 = &__kCFBooleanTrue;
  id v2 = +[NSDictionary dictionaryWithObjects:&v15 forKeys:&v14 count:1];
  uint64_t v3 = [*(id *)(a1 + 32) identity];
  char v4 = sub_1000136C0(v3, v2, *(void **)(a1 + 40));
  id v5 = 0;

  if ((v4 & 1) == 0)
  {
    id v6 = sub_100004B28((uint64_t)off_100109BB8);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      int v7 = [*(id *)(a1 + 32) identity];
      *(_DWORD *)buf = 136315650;
      __int16 v9 = "-[IXSCoordinatedAppInstall _onQueue_removeParallelPlaceholder:]_block_invoke";
      __int16 v10 = 2112;
      __int16 v11 = v7;
      __int16 v12 = 2112;
      id v13 = v5;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "%s: Failed to uninstall parallel placeholder %@: %@", buf, 0x20u);
    }
  }
}

void sub_1000566B0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1000566CC(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) metadata];
  if (v2)
  {
    id v3 = v2;
    *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = [v2 deviceBasedVPP];
    id v2 = v3;
  }
}

void sub_100056AB8(uint64_t a1)
{
  CFStringRef v16 = @"UninstallPlaceholdersOnly";
  id v2 = +[NSNumber numberWithBool:*(unsigned __int8 *)(a1 + 48)];
  unint64_t v17 = v2;
  id v3 = +[NSDictionary dictionaryWithObjects:&v17 forKeys:&v16 count:1];

  char v4 = [*(id *)(a1 + 32) identity];
  char v5 = sub_1000136C0(v4, v3, *(void **)(a1 + 40));
  id v6 = 0;

  if ((v5 & 1) == 0)
  {
    int v7 = sub_100004B28((uint64_t)off_100109BB8);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      id v8 = [*(id *)(a1 + 32) identity];
      __int16 v9 = [v8 bundleID];
      *(_DWORD *)buf = 136315650;
      __int16 v11 = "-[IXSCoordinatedAppInstall _onQueue_cancelPlaceholderIfNeededForReason:client:needsLSDatabaseSync:]_block_invoke";
      __int16 v12 = 2112;
      id v13 = v9;
      __int16 v14 = 2112;
      id v15 = v6;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "%s: Failed to uninstall placeholder %@: %@", buf, 0x20u);
    }
  }
}

void sub_100056D68(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id sub_100056D80(uint64_t a1)
{
  id result = objc_msgSend(*(id *)(a1 + 32), "_onQueue_internal_cancelForReason:client:needsLSDatabaseSync:error:", *(void *)(a1 + 40), *(void *)(a1 + 56), *(void *)(a1 + 64), *(void *)(a1 + 72));
  *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = (_BYTE)result;
  return result;
}

void sub_100057AA0(void *a1)
{
  id v2 = +[IXSAppInstallObserverManager sharedInstance];
  [v2 coordinator:a1[4] canceledWithReason:a1[5] client:a1[6]];
}

uint64_t sub_100058138(unint64_t a1)
{
  if (a1 < 7) {
    return (0xEu >> a1) & 1;
  }
  id v3 = sub_100004B28((uint64_t)off_100109BB8);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    int v4 = 136315394;
    char v5 = "_IsPendingInstallState";
    __int16 v6 = 2048;
    unint64_t v7 = a1;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "%s: Unknown install state: %lu", (uint8_t *)&v4, 0x16u);
  }

  return 0;
}

void sub_100058468(uint64_t a1)
{
  id v2 = +[IXSAppInstallObserverManager sharedInstance];
  [v2 coordinatorDidInstallPlaceholder:*(void *)(a1 + 32) forRecordPromise:*(void *)(a1 + 40)];
}

void sub_1000584C0(uint64_t a1)
{
  id v2 = +[IXSAppInstallObserverManager sharedInstance];
  [v2 coordinatorShouldBeginRestoringUserData:*(void *)(a1 + 32)];
}

uint64_t sub_1000586C0(void *a1, char a2, char a3, char a4)
{
  id v7 = a1;
  id v8 = v7;
  if (v7)
  {
    uint64_t v14 = 0;
    id v15 = &v14;
    uint64_t v16 = 0x2020000000;
    char v17 = 0;
    __int16 v9 = [v7 accessQueue];
    v11[0] = _NSConcreteStackBlock;
    v11[1] = 3221225472;
    v11[2] = sub_1000645E4;
    v11[3] = &unk_1000E90A8;
    id v13 = &v14;
    id v12 = v8;
    dispatch_sync(v9, v11);

    if (*((unsigned char *)v15 + 24)) {
      a4 = a2;
    }
    else {
      a4 = a3;
    }

    _Block_object_dispose(&v14, 8);
  }

  return a4;
}

void sub_1000587C0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_100058F6C(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) appAssetPromise];

  if (v2)
  {
    id v3 = [*(id *)(a1 + 32) appAssetPromise];
    int v4 = [v3 accessQueue];
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_10005949C;
    block[3] = &unk_1000E8E08;
    id v5 = *(id *)(a1 + 40);
    uint64_t v6 = *(void *)(a1 + 32);
    id v63 = v5;
    uint64_t v64 = v6;
    dispatch_sync(v4, block);
  }
  id v7 = [*(id *)(a1 + 32) placeholderPromise];

  if (v7)
  {
    id v8 = [*(id *)(a1 + 32) placeholderPromise];
    __int16 v9 = [v8 accessQueue];
    v59[0] = _NSConcreteStackBlock;
    v59[1] = 3221225472;
    v59[2] = sub_10005953C;
    v59[3] = &unk_1000E8E08;
    id v10 = *(id *)(a1 + 40);
    uint64_t v11 = *(void *)(a1 + 32);
    id v60 = v10;
    uint64_t v61 = v11;
    dispatch_sync(v9, v59);
  }
  id v12 = [*(id *)(a1 + 32) initialODRAssetPromises];

  if (v12)
  {
    long long v57 = 0u;
    long long v58 = 0u;
    long long v55 = 0u;
    long long v56 = 0u;
    id v13 = [*(id *)(a1 + 32) initialODRAssetPromises];
    id v14 = [v13 countByEnumeratingWithState:&v55 objects:v65 count:16];
    if (v14)
    {
      id v15 = v14;
      uint64_t v16 = *(void *)v56;
      do
      {
        for (i = 0; i != v15; i = (char *)i + 1)
        {
          if (*(void *)v56 != v16) {
            objc_enumerationMutation(v13);
          }
          unsigned __int8 v18 = *(void **)(*((void *)&v55 + 1) + 8 * i);
          __int16 v19 = [v18 accessQueue];
          v52[0] = _NSConcreteStackBlock;
          v52[1] = 3221225472;
          v52[2] = sub_1000595DC;
          v52[3] = &unk_1000E8E08;
          id v53 = *(id *)(a1 + 40);
          uint64_t v54 = v18;
          dispatch_sync(v19, v52);
        }
        id v15 = [v13 countByEnumeratingWithState:&v55 objects:v65 count:16];
      }
      while (v15);
    }
  }
  __int16 v20 = [*(id *)(a1 + 32) userDataPromise];

  if (v20)
  {
    __int16 v21 = [*(id *)(a1 + 32) userDataPromise];
    id v22 = [v21 accessQueue];
    v49[0] = _NSConcreteStackBlock;
    v49[1] = 3221225472;
    v49[2] = sub_10005965C;
    v49[3] = &unk_1000E8E08;
    id v23 = *(id *)(a1 + 40);
    uint64_t v24 = *(void *)(a1 + 32);
    id v50 = v23;
    uint64_t v51 = v24;
    dispatch_sync(v22, v49);
  }
  uint64_t v25 = [*(id *)(a1 + 32) deviceSecurityPromise];

  if (v25)
  {
    id v26 = [*(id *)(a1 + 32) deviceSecurityPromise];
    char v27 = [v26 accessQueue];
    v46[0] = _NSConcreteStackBlock;
    v46[1] = 3221225472;
    v46[2] = sub_1000596FC;
    v46[3] = &unk_1000E8E08;
    id v28 = *(id *)(a1 + 40);
    uint64_t v29 = *(void *)(a1 + 32);
    id v47 = v28;
    uint64_t v48 = v29;
    dispatch_sync(v27, v46);
  }
  id v30 = [*(id *)(a1 + 32) preparationPromise];

  if (v30)
  {
    id v31 = [*(id *)(a1 + 32) preparationPromise];
    uint64_t v32 = [v31 accessQueue];
    v43[0] = _NSConcreteStackBlock;
    v43[1] = 3221225472;
    v43[2] = sub_10005979C;
    v43[3] = &unk_1000E8E08;
    id v33 = *(id *)(a1 + 40);
    uint64_t v34 = *(void *)(a1 + 32);
    id v44 = v33;
    uint64_t v45 = v34;
    dispatch_sync(v32, v43);
  }
  uint64_t v35 = [*(id *)(a1 + 32) installOptionsPromise];

  if (v35)
  {
    uint64_t v36 = [*(id *)(a1 + 32) installOptionsPromise];
    unint64_t v37 = [v36 accessQueue];
    v40[0] = _NSConcreteStackBlock;
    v40[1] = 3221225472;
    v40[2] = sub_10005983C;
    v40[3] = &unk_1000E8E08;
    id v38 = *(id *)(a1 + 40);
    uint64_t v39 = *(void *)(a1 + 32);
    id v41 = v38;
    uint64_t v42 = v39;
    dispatch_sync(v37, v40);
  }
}

void sub_10005949C(uint64_t a1)
{
  id v2 = *(void **)(a1 + 32);
  id v3 = [*(id *)(a1 + 40) appAssetPromise];
  int v4 = [v3 uniqueIdentifier];
  [v2 addObject:v4];

  id v5 = *(void **)(a1 + 32);
  id v7 = [*(id *)(a1 + 40) appAssetPromise];
  uint64_t v6 = [v7 subPromiseUUIDs];
  [v5 unionSet:v6];
}

void sub_10005953C(uint64_t a1)
{
  id v2 = *(void **)(a1 + 32);
  id v3 = [*(id *)(a1 + 40) placeholderPromise];
  int v4 = [v3 uniqueIdentifier];
  [v2 addObject:v4];

  id v5 = *(void **)(a1 + 32);
  id v7 = [*(id *)(a1 + 40) placeholderPromise];
  uint64_t v6 = [v7 subPromiseUUIDs];
  [v5 unionSet:v6];
}

void sub_1000595DC(uint64_t a1)
{
  id v2 = *(void **)(a1 + 32);
  id v3 = [*(id *)(a1 + 40) uniqueIdentifier];
  [v2 addObject:v3];

  int v4 = *(void **)(a1 + 32);
  id v5 = [*(id *)(a1 + 40) subPromiseUUIDs];
  [v4 unionSet:v5];
}

void sub_10005965C(uint64_t a1)
{
  id v2 = *(void **)(a1 + 32);
  id v3 = [*(id *)(a1 + 40) userDataPromise];
  int v4 = [v3 uniqueIdentifier];
  [v2 addObject:v4];

  id v5 = *(void **)(a1 + 32);
  id v7 = [*(id *)(a1 + 40) userDataPromise];
  uint64_t v6 = [v7 subPromiseUUIDs];
  [v5 unionSet:v6];
}

void sub_1000596FC(uint64_t a1)
{
  id v2 = *(void **)(a1 + 32);
  id v3 = [*(id *)(a1 + 40) deviceSecurityPromise];
  int v4 = [v3 uniqueIdentifier];
  [v2 addObject:v4];

  id v5 = *(void **)(a1 + 32);
  id v7 = [*(id *)(a1 + 40) deviceSecurityPromise];
  uint64_t v6 = [v7 subPromiseUUIDs];
  [v5 unionSet:v6];
}

void sub_10005979C(uint64_t a1)
{
  id v2 = *(void **)(a1 + 32);
  id v3 = [*(id *)(a1 + 40) preparationPromise];
  int v4 = [v3 uniqueIdentifier];
  [v2 addObject:v4];

  id v5 = *(void **)(a1 + 32);
  id v7 = [*(id *)(a1 + 40) preparationPromise];
  uint64_t v6 = [v7 subPromiseUUIDs];
  [v5 unionSet:v6];
}

void sub_10005983C(uint64_t a1)
{
  id v2 = *(void **)(a1 + 32);
  id v3 = [*(id *)(a1 + 40) installOptionsPromise];
  int v4 = [v3 uniqueIdentifier];
  [v2 addObject:v4];

  id v5 = *(void **)(a1 + 32);
  id v7 = [*(id *)(a1 + 40) installOptionsPromise];
  uint64_t v6 = [v7 subPromiseUUIDs];
  [v5 unionSet:v6];
}

id sub_100059CFC(uint64_t a1)
{
  [*(id *)(a1 + 32) pause];
  id v2 = *(void **)(a1 + 32);

  return [v2 setInstallState:2];
}

id sub_100059DCC(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) _pauseProgressObject:a2];
}

void sub_100059E28(id a1, NSProgress *a2)
{
  if (a2)
  {
    id v2 = a2;
    [(NSProgress *)v2 resume];
    [(NSProgress *)v2 setInstallState:0];
  }
}

id sub_100059FB0(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "_onQueue_cancelProgress:", a2);
}

id sub_10005A130(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "_onQueue_finishProgress:", a2);
}

void sub_10005A460(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 80), 8);
  _Unwind_Resume(a1);
}

void sub_10005A47C(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) placeholderPromise];
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = [v2 installType];
}

id sub_10005A4D8(void *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  id v7 = a1 + 8;
  uint64_t v6 = a1[8];
  if (v6 == 2)
  {
    id v12 = (void *)a1[4];
    uint64_t v13 = a1[6];
    return objc_msgSend(v12, "_limitedConcurrency_fetchPostProcessingProgressAndRun:", v13, a4, a5);
  }
  else if (v6)
  {
    id v14 = sub_100004B28((uint64_t)off_100109BB8);
    if (os_log_type_enabled(v14, OS_LOG_TYPE_FAULT)) {
      sub_100094788((uint64_t)a1, v7, v14);
    }

    return (id)(*(uint64_t (**)(void))(a1[6] + 16))();
  }
  else
  {
    uint64_t v8 = a1[6];
    uint64_t v9 = *(void *)(*(void *)(a1[7] + 8) + 24);
    id v10 = (void *)a1[4];
    uint64_t v11 = a1[5];
    return objc_msgSend(v10, "_limitedConcurrency_fetchLoadingProgressForPlaceholderInstallType:progressHint:andRun:", v9, v11, v8);
  }
}

id sub_10005A5BC(unint64_t a1)
{
  if (a1 >= 3)
  {
    uint64_t v1 = +[NSString stringWithFormat:@"Unknown progress value %lu", a1];
  }
  else
  {
    uint64_t v1 = *(&off_1000EAA80 + a1);
  }

  return v1;
}

id sub_10005A6F8(uint64_t a1)
{
  id v2 = *(void **)(a1 + 32);
  if (v2)
  {
    uint64_t v3 = *(void *)(a1 + 40);
    if (!*(void *)(v3 + 304)) {
      objc_storeStrong((id *)(v3 + 304), v2);
    }
  }
  if ([*(id *)(a1 + 40) isPaused]) {
    [*(id *)(a1 + 40) _pauseProgressObject:*(void *)(a1 + 32)];
  }
  (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  long long v14 = 0u;
  long long v15 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  int v4 = objc_msgSend(*(id *)(a1 + 40), "pendingProgressRequests", 0);
  id v5 = [v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v13;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v13 != v7) {
          objc_enumerationMutation(v4);
        }
        uint64_t v9 = *(void *)(*((void *)&v12 + 1) + 8 * (void)v8);
        (*(void (**)(uint64_t, void))(v9 + 16))(v9, *(void *)(a1 + 32));
        uint64_t v8 = (char *)v8 + 1;
      }
      while (v6 != v8);
      id v6 = [v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v6);
  }

  return [*(id *)(a1 + 40) setPendingProgressRequests:0];
}

id sub_10005ABD0(uint64_t a1)
{
  id result = [*(id *)(a1 + 32) originalInstallType];
  if (!result)
  {
    uint64_t v3 = *(void **)(a1 + 32);
    uint64_t v4 = *(void *)(a1 + 40);
    return [v3 setOriginalInstallType:v4];
  }
  return result;
}

id sub_10005ACE0(uint64_t a1, void *a2, void *a3)
{
  uint64_t v4 = *(void **)(a1 + 32);
  id v5 = a2;
  [a3 doubleValue];
  unint64_t v7 = (unint64_t)(v6 * 10000.0);
  id v8 = [v5 unsignedIntegerValue];

  return [v4 setTotalUnitCount:v7 forPhase:v8];
}

void sub_10005BAB4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,uint64_t a48,uint64_t a49,uint64_t a50,uint64_t a51,uint64_t a52,uint64_t a53,char a54,uint64_t a55,uint64_t a56,uint64_t a57,uint64_t a58,uint64_t a59,uint64_t a60,uint64_t a61,uint64_t a62,uint64_t a63)
{
  _Block_object_dispose(&a54, 8);
  _Block_object_dispose(&a65, 8);
  _Block_object_dispose(&a69, 8);
  _Unwind_Resume(a1);
}

id sub_10005BB08(uint64_t a1)
{
  [*(id *)(a1 + 32) percentComplete];
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = v2;
  id result = [*(id *)(a1 + 32) totalBytesForProgress];
  *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = result;
  return result;
}

id sub_10005BB50(uint64_t a1)
{
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = [*(id *)(a1 + 32) isComplete];
  [*(id *)(a1 + 32) percentComplete];
  *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = v2;
  id result = [*(id *)(a1 + 32) totalBytesForProgress];
  *(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = result;
  return result;
}

id sub_10005BBAC(uint64_t a1)
{
  [*(id *)(a1 + 32) percentComplete];
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = v2;
  id result = [*(id *)(a1 + 32) totalBytesForProgress];
  *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = result;
  return result;
}

void sub_10005BBF4(uint64_t a1)
{
  id v3 = [*(id *)(a1 + 32) preparationPromise];
  [v3 percentComplete];
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = v2;
}

void sub_10005BC50(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = v3;
  if (!v3)
  {
    id v5 = sub_100004B28((uint64_t)off_100109BB8);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
      sub_100094AB8(a1);
    }
    goto LABEL_10;
  }
  if (!*(unsigned char *)(a1 + 56))
  {
    id v5 = sub_100004B28((uint64_t)off_100109BB8);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      double v6 = [*(id *)(a1 + 32) identity];
      int v7 = 136315394;
      id v8 = "-[IXSCoordinatedAppInstall _onQueue_updateLoadingProgress]_block_invoke";
      __int16 v9 = 2112;
      id v10 = v6;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "%s: %@: Not updating loading progress: no relevant promises set", (uint8_t *)&v7, 0x16u);
    }
LABEL_10:

    goto LABEL_11;
  }
  [v3 setInstallState:1];
  if ([v4 totalUnitCount] != *(id *)(a1 + 40)) {
    objc_msgSend(v4, "setTotalUnitCount:");
  }
  [v4 setCompletedUnitCount:*(void *)(a1 + 48)];
LABEL_11:
}

void sub_10005C3E8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,char a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,char a37)
{
}

id sub_10005C414(uint64_t a1)
{
  [*(id *)(a1 + 32) percentComplete];
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = v2;
  id result = [*(id *)(a1 + 32) totalBytesForProgress];
  *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = result;
  return result;
}

void sub_10005C45C(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = v3;
  if (v3)
  {
    if ([v3 totalUnitCount] != *(id *)(a1 + 40)) {
      objc_msgSend(v4, "setTotalUnitCount:");
    }
    [v4 setCompletedUnitCount:*(void *)(a1 + 48)];
  }
  else
  {
    id v5 = sub_100004B28((uint64_t)off_100109BB8);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
      sub_100094C6C(a1);
    }
  }
}

void sub_10005C5A8(uint64_t a1)
{
  id v2 = +[IXSAppInstallObserverManager sharedInstance];
  [v2 coordinator:*(void *)(a1 + 32) didUpdateProgress:*(void *)(a1 + 48) forPhase:*(double *)(a1 + 40) overallProgress:*(double *)(a1 + 56)];
}

void sub_10005C864(uint64_t a1)
{
  id v2 = (char *)[*(id *)(a1 + 32) transactionStepForPromise:*(void *)(a1 + 40)];
  if (v2 != (char *)17)
  {
    id v3 = v2;
    if ((unint64_t)(v2 - 1) > 0xF) {
      uint64_t v4 = 0;
    }
    else {
      uint64_t v4 = (uint64_t)*(&off_1000EAB80 + (void)(v2 - 1));
    }
    id v5 = [*(id *)(a1 + 32) state];
    if ((unint64_t)v5 > 0x1C) {
      uint64_t v6 = 0;
    }
    else {
      uint64_t v6 = (uint64_t)*(&off_1000EAA98 + (void)v5);
    }
    int v7 = +[NSString stringWithFormat:@"%@ began. Coordinator State: %@", v4, v6];
    id v8 = [*(id *)(a1 + 32) identity];
    __int16 v9 = [v8 bundleID];
    +[AITransactionLog logStep:v3 byParty:4 phase:1 success:1 forBundleID:v9 description:v7];
  }
  id v10 = *(void **)(a1 + 40);
  uint64_t v11 = [*(id *)(a1 + 32) placeholderPromise];

  if (v10 == v11)
  {
    int v22 = 0;
    uint64_t v23 = 1;
    goto LABEL_25;
  }
  long long v12 = *(void **)(a1 + 40);
  long long v13 = [*(id *)(a1 + 32) appAssetPromise];

  if (v12 == v13)
  {
    int v22 = 1;
    uint64_t v23 = 2;
    goto LABEL_25;
  }
  long long v14 = *(void **)(a1 + 40);
  long long v15 = [*(id *)(a1 + 32) userDataPromise];

  if (v14 == v15)
  {
    int v22 = 0;
    uint64_t v23 = 4;
    goto LABEL_25;
  }
  uint64_t v16 = *(void **)(a1 + 40);
  char v17 = [*(id *)(a1 + 32) deviceSecurityPromise];

  if (v16 == v17)
  {
    int v22 = 0;
    uint64_t v23 = 6;
    goto LABEL_25;
  }
  unsigned __int8 v18 = *(void **)(a1 + 40);
  __int16 v19 = [*(id *)(a1 + 32) preparationPromise];

  if (v18 == v19)
  {
    int v22 = 0;
    uint64_t v23 = 5;
    goto LABEL_25;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    __int16 v20 = [*(id *)(a1 + 32) initialODRAssetPromises];
    unsigned __int8 v21 = [v20 containsObject:*(void *)(a1 + 40)];

    if (v21)
    {
      int v22 = 0;
      uint64_t v23 = 3;
LABEL_25:
      id v26 = [*(id *)(a1 + 32) delegateCallQueue];
      v32[0] = _NSConcreteStackBlock;
      v32[1] = 3221225472;
      v32[2] = sub_10005CC80;
      v32[3] = &unk_1000E8D28;
      v32[4] = *(void *)(a1 + 32);
      v32[5] = v23;
      sub_100066F24(v26, v32);

      if (v22
        && ([*(id *)(a1 + 32) sentBeginRestoringUserData] & 1) == 0
        && [*(id *)(a1 + 32) shouldBeginRestoringUserData])
      {
        [*(id *)(a1 + 32) setSentBeginRestoringUserData:1];
        char v27 = [*(id *)(a1 + 32) delegateCallQueue];
        v31[0] = _NSConcreteStackBlock;
        v31[1] = 3221225472;
        v31[2] = sub_10005CCD8;
        v31[3] = &unk_1000E8FA8;
        v31[4] = *(void *)(a1 + 32);
        sub_100066F24(v27, v31);
LABEL_29:

        return;
      }
      return;
    }
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v24 = [*(id *)(a1 + 32) essentialAssetPromises];
    unsigned __int8 v25 = [v24 containsObject:*(void *)(a1 + 40)];

    if (v25)
    {
      int v22 = 0;
      uint64_t v23 = 8;
      goto LABEL_25;
    }
  }
  id v28 = *(void **)(a1 + 40);
  uint64_t v29 = [*(id *)(a1 + 32) installOptionsPromise];

  if (v28 != v29)
  {
    char v27 = sub_100004B28((uint64_t)off_100109BB8);
    if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v30 = *(void *)(a1 + 40);
      *(_DWORD *)buf = 136315394;
      uint64_t v34 = "-[IXSCoordinatedAppInstall promiseDidBegin:]_block_invoke";
      __int16 v35 = 2112;
      uint64_t v36 = v30;
      _os_log_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_DEFAULT, "%s: Got promise did begin for unknown promise %@", buf, 0x16u);
    }
    goto LABEL_29;
  }
}

void sub_10005CC80(uint64_t a1)
{
  id v2 = +[IXSAppInstallObserverManager sharedInstance];
  [v2 coordinator:*(void *)(a1 + 32) configuredPromiseDidBeginFulfillment:*(void *)(a1 + 40)];
}

void sub_10005CCD8(uint64_t a1)
{
  id v2 = +[IXSAppInstallObserverManager sharedInstance];
  [v2 coordinatorShouldBeginRestoringUserData:*(void *)(a1 + 32)];
}

id sub_10005CE88(uint64_t a1)
{
  id v2 = (char *)[*(id *)(a1 + 32) transactionStepForPromise:*(void *)(a1 + 40)];
  if (v2 != (char *)17)
  {
    id v3 = v2;
    if ((unint64_t)(v2 - 1) > 0xF) {
      uint64_t v4 = 0;
    }
    else {
      uint64_t v4 = (uint64_t)*(&off_1000EAB80 + (void)(v2 - 1));
    }
    id v5 = [*(id *)(a1 + 32) state];
    if ((unint64_t)v5 > 0x1C) {
      uint64_t v6 = 0;
    }
    else {
      uint64_t v6 = (uint64_t)*(&off_1000EAA98 + (void)v5);
    }
    int v7 = +[NSString stringWithFormat:@"%@ completed. Coordinator State: %@", v4, v6];
    id v8 = [*(id *)(a1 + 32) identity];
    __int16 v9 = [v8 bundleID];
    +[AITransactionLog logStep:v3 byParty:4 phase:2 success:1 forBundleID:v9 description:v7];
  }
  id v10 = *(void **)(a1 + 32);

  return objc_msgSend(v10, "_onQueue_checkState");
}

id sub_10005D030(uint64_t a1)
{
  unsigned int v2 = [*(id *)(a1 + 32) sentBeginPostProcessing];
  id v3 = *(void **)(a1 + 32);
  if (v2)
  {
    return objc_msgSend(v3, "_onQueue_updatePostProcessingProgress");
  }
  else
  {
    return objc_msgSend(v3, "_onQueue_updateLoadingProgress");
  }
}

void sub_10005D2F4(uint64_t a1)
{
  unsigned int v2 = (char *)[*(id *)(a1 + 32) transactionStepForPromise:*(void *)(a1 + 40)];
  if (v2 != (char *)17)
  {
    id v3 = v2;
    if ((unint64_t)(v2 - 1) > 0xF) {
      uint64_t v4 = 0;
    }
    else {
      uint64_t v4 = (uint64_t)*(&off_1000EAB80 + (void)(v2 - 1));
    }
    id v5 = IXStringForClientID(*(void *)(a1 + 56));
    id v8 = +[NSString stringWithFormat:@"%@ canceled by client %@ for reason %@", v4, v5, *(void *)(a1 + 48)];

    uint64_t v6 = [*(id *)(a1 + 32) identity];
    int v7 = [v6 bundleID];
    +[AITransactionLog logStep:v3 byParty:4 phase:2 success:0 forBundleID:v7 description:v8];
  }
}

id sub_10005D41C(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_onQueue_handleAppAssetPromiseCancellationWhenRestoringWithReason:client:", *(void *)(a1 + 40), *(void *)(a1 + 48));
}

void sub_10005D5D4(uint64_t a1)
{
  id v2 = +[IXSAppInstallObserverManager sharedInstance];
  [v2 coordinatorShouldBeginPostProcessing:*(void *)(a1 + 32) forRecordPromise:*(void *)(a1 + 40)];
}

id sub_10005D6E0(uint64_t a1)
{
  [*(id *)(a1 + 32) setUpdateScheduleState:2];
  [*(id *)(a1 + 32) setSchedulerCallback:*(void *)(a1 + 40)];
  id v2 = *(void **)(a1 + 32);

  return objc_msgSend(v2, "_onQueue_checkState");
}

void sub_10005D850(uint64_t a1)
{
  uint64_t v1 = (id *)(a1 + 32);
  id v2 = [*(id *)(a1 + 32) termAssertion];

  if (v2)
  {
    if ([*v1 expectTermAssertionCallback])
    {
      [*v1 setExpectTermAssertionCallback:0];
      [*v1 setAssertionTransaction:0];
      id v3 = [*v1 postProcessingAssertionState];
      id v4 = *v1;
      if (v3 == (id)1)
      {
        objc_msgSend(v4, "_onQueue_runPostProcessingAssertionHandler");
      }
      else
      {
        BOOL v7 = (unint64_t)[v4 state] < 8;
        objc_msgSend(v4, "_onQueue_runAssertionHandlerForPlaceholder:", v7);
      }
    }
    else
    {
      uint64_t v6 = sub_100004B28((uint64_t)off_100109BB8);
      if (os_log_type_enabled(v6, OS_LOG_TYPE_FAULT)) {
        sub_100094D00();
      }
    }
  }
  else
  {
    id v5 = sub_100004B28((uint64_t)off_100109BB8);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      int v8 = 136315138;
      __int16 v9 = "-[IXSCoordinatedAppInstall assertionTargetProcessDidExit:]_block_invoke";
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "%s: We didn't have a termination assertion that we're tracking, so not acting on the callback from RBS", (uint8_t *)&v8, 0xCu);
    }
  }
}

id sub_10005E224(uint64_t a1)
{
  return [*(id *)(a1 + 32) setPlaceholderPromise:*(void *)(a1 + 40)];
}

void sub_10005E338(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_10005E350(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) placeholderPromise];
  id v3 = v2;
  if (v2)
  {
    id v4 = [v2 accessQueue];
    v5[0] = _NSConcreteStackBlock;
    v5[1] = 3221225472;
    v5[2] = sub_10005E414;
    v5[3] = &unk_1000E90A8;
    uint64_t v7 = *(void *)(a1 + 40);
    id v6 = v3;
    dispatch_sync(v4, v5);
  }
}

uint64_t sub_10005E414(uint64_t a1)
{
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = [*(id *)(a1 + 32) clientSeed];

  return _objc_release_x1();
}

void sub_10005E540(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_10005E558(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) placeholderPromise];
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = v2 != 0;
}

void sub_10005E8C0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, ...)
{
  va_start(va, a16);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_10005E8D8(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) clientSeed];
  id v3 = [v2 identity];

  id v4 = [*(id *)(a1 + 40) identity];
  id v5 = [*(id *)(a1 + 32) clientSeed];
  id v6 = [v5 installationDomain];

  id v7 = [*(id *)(a1 + 40) installationDomain];
  if (([v3 isEqual:v4] & 1) == 0)
  {
    long long v14 = sub_100004B28((uint64_t)off_100109BB8);
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
      sub_100094F24();
    }

    uint64_t v16 = sub_10003DAE4((uint64_t)"-[IXSCoordinatedAppInstall(IPCMethods) _remote_setAppAssetPromiseUUID:fromConnection:completion:]_block_invoke", 6355, @"IXErrorDomain", 0x33uLL, 0, 0, @"Client attempted to set an app reference with identity %@ that did not match the coordinator's identity, %@", v15, (uint64_t)v3);
    uint64_t v17 = *(void *)(*(void *)(a1 + 48) + 8);
    long long v13 = *(void **)(v17 + 40);
    *(void *)(v17 + 40) = v16;
    goto LABEL_9;
  }
  if (v6 != v7)
  {
    int v8 = sub_100004B28((uint64_t)off_100109BB8);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      unsigned __int8 v18 = MIStringForInstallationDomain();
      __int16 v19 = MIStringForInstallationDomain();
      *(_DWORD *)buf = 136316162;
      int v22 = "-[IXSCoordinatedAppInstall(IPCMethods) _remote_setAppAssetPromiseUUID:fromConnection:completion:]_block_invoke";
      __int16 v23 = 2112;
      uint64_t v24 = v3;
      __int16 v25 = 2112;
      id v26 = v18;
      __int16 v27 = 2112;
      id v28 = v19;
      __int16 v29 = 2112;
      uint64_t v30 = 0;
      _os_log_error_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_ERROR, "%s: Client attempted to set an app reference with identity %@ in installation domain %@ that did not match the coordinator's installation domain %@. : %@", buf, 0x34u);
    }
    __int16 v9 = MIStringForInstallationDomain();
    __int16 v20 = MIStringForInstallationDomain();
    uint64_t v11 = sub_10003DAE4((uint64_t)"-[IXSCoordinatedAppInstall(IPCMethods) _remote_setAppAssetPromiseUUID:fromConnection:completion:]_block_invoke", 6357, @"IXErrorDomain", 0x34uLL, 0, 0, @"Client attempted to set an app reference with identity %@ in installation domain %@ that did not match the coordinator's installation domain %@.", v10, (uint64_t)v3);

    uint64_t v12 = *(void *)(*(void *)(a1 + 48) + 8);
    long long v13 = *(void **)(v12 + 40);
    *(void *)(v12 + 40) = v11;
LABEL_9:
  }
}

id sub_10005EB78(uint64_t a1)
{
  [*(id *)(a1 + 32) setAppAssetPromise:*(void *)(a1 + 40)];
  uint64_t v2 = *(unsigned __int8 *)(a1 + 48);
  id v3 = *(void **)(a1 + 32);

  return [v3 setAppAssetPromiseSetterCanInstallLocalProvisionedContent:v2];
}

void sub_10005ECC4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_10005ECDC(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) appAssetPromise];
  id v3 = v2;
  if (v2)
  {
    id v4 = [v2 accessQueue];
    v5[0] = _NSConcreteStackBlock;
    v5[1] = 3221225472;
    v5[2] = sub_10005EDA0;
    v5[3] = &unk_1000E90A8;
    uint64_t v7 = *(void *)(a1 + 40);
    id v6 = v3;
    dispatch_sync(v4, v5);
  }
}

uint64_t sub_10005EDA0(uint64_t a1)
{
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = [*(id *)(a1 + 32) clientSeed];

  return _objc_release_x1();
}

void sub_10005EECC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_10005EEE4(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) appAssetPromise];
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = v2 != 0;
}

void sub_10005F0A0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v9 - 80), 8);
  _Unwind_Resume(a1);
}

void sub_10005F0C8(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) appAssetPromise];
  id v3 = v2;
  if (v2)
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 1;
    id v4 = [v2 accessQueue];
    v5[0] = _NSConcreteStackBlock;
    v5[1] = 3221225472;
    v5[2] = sub_10005F19C;
    v5[3] = &unk_1000E90A8;
    uint64_t v7 = *(void *)(a1 + 48);
    id v6 = v3;
    dispatch_sync(v4, v5);
  }
}

id sub_10005F19C(uint64_t a1)
{
  id result = [*(id *)(a1 + 32) hasBegun];
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = (_BYTE)result;
  return result;
}

void sub_10005F2B0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id sub_10005F2C8(uint64_t a1)
{
  id result = [*(id *)(a1 + 32) appAssetPromiseDRI];
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = result;
  return result;
}

id sub_10005F3B4(uint64_t a1)
{
  return [*(id *)(a1 + 32) setAppAssetPromiseDRI:*(void *)(a1 + 40)];
}

void sub_10005FCAC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,char a36)
{
}

id sub_10005FCE8(uint64_t a1)
{
  return [*(id *)(a1 + 32) setInstallOptionsPromise:0];
}

id sub_10005FCF4(uint64_t a1)
{
  id result = [*(id *)(a1 + 32) isComplete];
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = (_BYTE)result;
  return result;
}

id sub_10005FD28(uint64_t a1)
{
  return [*(id *)(a1 + 32) supersede];
}

id sub_10005FD30(uint64_t a1)
{
  return [*(id *)(a1 + 32) setInstallOptionsPromise:*(void *)(a1 + 40)];
}

void sub_10005FE18(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_10005FE30(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) installOptionsPromise];
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = v2 != 0;
}

void sub_10005FFE4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v9 - 96), 8);
  _Unwind_Resume(a1);
}

void sub_100060008(void *a1)
{
  uint64_t v2 = (void *)a1[4];
  id v8 = 0;
  uint64_t v3 = objc_msgSend(v2, "_onQueue_fetchInstallOptionsWithError:", &v8);
  id v4 = v8;
  id v5 = v8;
  uint64_t v6 = *(void *)(a1[5] + 8);
  uint64_t v7 = *(void **)(v6 + 40);
  *(void *)(v6 + 40) = v3;

  if (!*(void *)(*(void *)(a1[5] + 8) + 40)) {
    objc_storeStrong((id *)(*(void *)(a1[6] + 8) + 40), v4);
  }
}

id sub_100060254(uint64_t a1)
{
  return [*(id *)(a1 + 32) setImportance:*(void *)(a1 + 40)];
}

void sub_10006033C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id sub_100060354(uint64_t a1)
{
  id result = [*(id *)(a1 + 32) importance];
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = result;
  return result;
}

void sub_100060618(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_start(va1, a11);
  va_start(va, a11);
  uint64_t v12 = va_arg(va1, void);
  uint64_t v14 = va_arg(va1, void);
  uint64_t v15 = va_arg(va1, void);
  uint64_t v16 = va_arg(va1, void);
  uint64_t v17 = va_arg(va1, void);
  uint64_t v18 = va_arg(va1, void);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  _Unwind_Resume(a1);
}

id sub_10006064C(uint64_t a1, uint64_t a2)
{
  id result = objc_retainBlock(*(id *)(a2 + 40));
  *(void *)(a1 + 40) = result;
  return result;
}

void sub_100060678(uint64_t a1)
{
}

void sub_100060680(uint64_t a1)
{
  id v10 = [*(id *)(a1 + 32) priorityBoostCompletion];
  if (v10 && !*(unsigned char *)(a1 + 72))
  {
    uint64_t v5 = [*(id *)(a1 + 32) priorityBoostSourceInfo];
    uint64_t v6 = *(void *)(*(void *)(a1 + 64) + 8);
    uint64_t v7 = *(void **)(v6 + 40);
    *(void *)(v6 + 40) = v5;

    id v8 = objc_retainBlock(*(id *)(a1 + 48));
    uint64_t v9 = *(void *)(*(void *)(a1 + 56) + 8);
    uint64_t v2 = *(void **)(v9 + 40);
    *(void *)(v9 + 40) = v8;
  }
  else
  {
    uint64_t v2 = sub_10006074C(*(void **)(a1 + 40));
    [*(id *)(a1 + 32) setPriorityBoostCompletion:*(void *)(a1 + 48) withSourceInfo:v2];
    uint64_t v3 = *(void *)(*(void *)(a1 + 56) + 8);
    id v4 = *(void **)(v3 + 40);
    *(void *)(v3 + 40) = 0;
  }
}

id sub_10006074C(void *a1)
{
  id v1 = [a1 processIdentifier];
  uint64_t v2 = qos_class_self();
  uint64_t v3 = sub_10000D2F0();
  id v4 = sub_10000D72C(v2);
  uint64_t v5 = +[NSString stringWithFormat:@"completion from %@ (%u), %@ (0x%x)", v3, v1, v4, v2];

  return v5;
}

id sub_1000608CC(uint64_t a1)
{
  return [*(id *)(a1 + 32) setTargetGizmoPairingID:*(void *)(a1 + 40)];
}

void sub_1000609E0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t sub_1000609F8(uint64_t a1)
{
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = [*(id *)(a1 + 32) targetGizmoPairingID];

  return _objc_release_x1();
}

id sub_100060CF8(uint64_t a1)
{
  return [*(id *)(a1 + 32) setInitialODRAssetPromises:*(void *)(a1 + 40)];
}

void sub_100060E0C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_100060E24(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) initialODRAssetPromises];
  if (v2)
  {
    uint64_t v3 = objc_opt_new();
    uint64_t v4 = *(void *)(*(void *)(a1 + 40) + 8);
    uint64_t v5 = *(void **)(v4 + 40);
    *(void *)(v4 + 40) = v3;

    long long v18 = 0u;
    long long v19 = 0u;
    long long v16 = 0u;
    long long v17 = 0u;
    uint64_t v14 = v2;
    id v6 = v2;
    id v7 = [v6 countByEnumeratingWithState:&v16 objects:v20 count:16];
    if (v7)
    {
      id v8 = v7;
      uint64_t v9 = *(void *)v17;
      do
      {
        for (i = 0; i != v8; i = (char *)i + 1)
        {
          if (*(void *)v17 != v9) {
            objc_enumerationMutation(v6);
          }
          uint64_t v11 = *(void **)(*((void *)&v16 + 1) + 8 * i);
          uint64_t v12 = [v11 accessQueue];
          block[0] = _NSConcreteStackBlock;
          block[1] = 3221225472;
          block[2] = sub_100060FCC;
          block[3] = &unk_1000E90A8;
          uint64_t v13 = *(void *)(a1 + 40);
          void block[4] = v11;
          void block[5] = v13;
          dispatch_sync(v12, block);
        }
        id v8 = [v6 countByEnumeratingWithState:&v16 objects:v20 count:16];
      }
      while (v8);
    }

    uint64_t v2 = v14;
  }
}

void sub_100060FCC(uint64_t a1)
{
  id v1 = *(void **)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
  id v2 = [*(id *)(a1 + 32) clientSeed];
  [v1 addObject:v2];
}

void sub_100061108(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_100061120(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) initialODRAssetPromises];
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = v2 != 0;
}

id sub_10006132C(uint64_t a1)
{
  return [*(id *)(a1 + 32) setUserDataPromise:*(void *)(a1 + 40)];
}

void sub_100061440(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_100061458(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) userDataPromise];
  uint64_t v3 = v2;
  if (v2)
  {
    uint64_t v4 = [v2 accessQueue];
    v5[0] = _NSConcreteStackBlock;
    v5[1] = 3221225472;
    v5[2] = sub_10006151C;
    v5[3] = &unk_1000E90A8;
    uint64_t v7 = *(void *)(a1 + 40);
    id v6 = v3;
    dispatch_sync(v4, v5);
  }
}

uint64_t sub_10006151C(uint64_t a1)
{
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = [*(id *)(a1 + 32) clientSeed];

  return _objc_release_x1();
}

void sub_100061648(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_100061660(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) userDataPromise];
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = v2 != 0;
}

void sub_100061790(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id sub_1000617A8(uint64_t a1)
{
  id result = [*(id *)(a1 + 32) shouldBeginRestoringUserData];
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = (_BYTE)result;
  return result;
}

id sub_100061998(uint64_t a1)
{
  return [*(id *)(a1 + 32) setPreparationPromise:*(void *)(a1 + 40)];
}

void sub_100061AAC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_100061AC4(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) preparationPromise];
  uint64_t v3 = v2;
  if (v2)
  {
    uint64_t v4 = [v2 accessQueue];
    v5[0] = _NSConcreteStackBlock;
    v5[1] = 3221225472;
    v5[2] = sub_100061B88;
    v5[3] = &unk_1000E90A8;
    uint64_t v7 = *(void *)(a1 + 40);
    id v6 = v3;
    dispatch_sync(v4, v5);
  }
}

uint64_t sub_100061B88(uint64_t a1)
{
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = [*(id *)(a1 + 32) clientSeed];

  return _objc_release_x1();
}

id sub_100061D90(uint64_t a1)
{
  return [*(id *)(a1 + 32) setDeviceSecurityPromise:*(void *)(a1 + 40)];
}

void sub_100061EA4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_100061EBC(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) deviceSecurityPromise];
  uint64_t v3 = v2;
  if (v2)
  {
    uint64_t v4 = [v2 accessQueue];
    v5[0] = _NSConcreteStackBlock;
    v5[1] = 3221225472;
    v5[2] = sub_100061F80;
    v5[3] = &unk_1000E90A8;
    uint64_t v7 = *(void *)(a1 + 40);
    id v6 = v3;
    dispatch_sync(v4, v5);
  }
}

uint64_t sub_100061F80(uint64_t a1)
{
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = [*(id *)(a1 + 32) clientSeed];

  return _objc_release_x1();
}

void sub_1000620AC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1000620C4(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) deviceSecurityPromise];
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = v2 != 0;
}

id sub_1000622C4(uint64_t a1)
{
  return [*(id *)(a1 + 32) setNeedsPostProcessing:*(unsigned __int8 *)(a1 + 40)];
}

void sub_1000624A4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id sub_1000624BC(uint64_t a1)
{
  id result = [*(id *)(a1 + 32) needsPostProcessing];
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = (_BYTE)result;
  return result;
}

void sub_1000625D0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id sub_1000625E8(uint64_t a1)
{
  id result = [*(id *)(a1 + 32) shouldBeginPostProcessing];
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = (_BYTE)result;
  return result;
}

void sub_100062A94(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,char a33)
{
}

id sub_100062ADC(uint64_t a1)
{
  id result = [*(id *)(a1 + 32) needsPostProcessing];
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = (_BYTE)result;
  return result;
}

id sub_100062B10(uint64_t a1)
{
  return [*(id *)(a1 + 32) setEssentialAssetPromises:*(void *)(a1 + 40)];
}

void sub_100062DA8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v9 - 80), 8);
  _Unwind_Resume(a1);
}

void sub_100062DD4(uint64_t a1)
{
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = [*(id *)(a1 + 32) needsPostProcessing];
  if (*(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24))
  {
    id v2 = [*(id *)(a1 + 32) essentialAssetPromises];
    if (v2)
    {
      uint64_t v3 = objc_opt_new();
      uint64_t v4 = *(void *)(*(void *)(a1 + 48) + 8);
      uint64_t v5 = *(void **)(v4 + 40);
      *(void *)(v4 + 40) = v3;

      long long v18 = 0u;
      long long v19 = 0u;
      long long v16 = 0u;
      long long v17 = 0u;
      uint64_t v14 = v2;
      id v6 = v2;
      id v7 = [v6 countByEnumeratingWithState:&v16 objects:v20 count:16];
      if (v7)
      {
        id v8 = v7;
        uint64_t v9 = *(void *)v17;
        do
        {
          for (i = 0; i != v8; i = (char *)i + 1)
          {
            if (*(void *)v17 != v9) {
              objc_enumerationMutation(v6);
            }
            uint64_t v11 = *(void **)(*((void *)&v16 + 1) + 8 * i);
            uint64_t v12 = [v11 accessQueue];
            block[0] = _NSConcreteStackBlock;
            block[1] = 3221225472;
            block[2] = sub_100062FA0;
            block[3] = &unk_1000E90A8;
            uint64_t v13 = *(void *)(a1 + 48);
            void block[4] = v11;
            void block[5] = v13;
            dispatch_sync(v12, block);
          }
          id v8 = [v6 countByEnumeratingWithState:&v16 objects:v20 count:16];
        }
        while (v8);
      }

      id v2 = v14;
    }
  }
}

void sub_100062FA0(uint64_t a1)
{
  id v1 = *(void **)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
  id v2 = [*(id *)(a1 + 32) clientSeed];
  [v1 addObject:v2];
}

void sub_10006324C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v9 - 80), 8);
  _Unwind_Resume(a1);
}

void sub_100063278(uint64_t a1)
{
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = [*(id *)(a1 + 32) needsPostProcessing];
  if (*(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24))
  {
    id v2 = [*(id *)(a1 + 32) essentialAssetPromises];
    *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = v2 != 0;
  }
}

void sub_1000633D8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id sub_1000633F0(uint64_t a1)
{
  id result = [*(id *)(a1 + 32) isComplete];
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = (_BYTE)result;
  return result;
}

void sub_100063564(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v9 - 80), 8);
  _Unwind_Resume(a1);
}

uint64_t sub_100063588(uint64_t a1)
{
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = [*(id *)(a1 + 32) errorSourceIdentifier];
  *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) = [*(id *)(a1 + 32) error];

  return _objc_release_x1();
}

id sub_1000636C0(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_onQueue_fireObserversForClient:", *(void *)(a1 + 40));
}

id sub_100063788(uint64_t a1)
{
  return [*(id *)(a1 + 32) setIsPaused:*(unsigned __int8 *)(a1 + 48) completion:*(void *)(a1 + 40)];
}

void sub_100063878(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id sub_100063890(uint64_t a1)
{
  id result = [*(id *)(a1 + 32) isPaused];
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = (_BYTE)result;
  return result;
}

id sub_100063978(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_onQueue_prioritizeWithCompletion:", *(void *)(a1 + 40));
}

void sub_100063A50(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) state];
  uint64_t v3 = [*(id *)(a1 + 32) delegateCallQueue];
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_100063B04;
  v4[3] = &unk_1000EAA20;
  id v5 = *(id *)(a1 + 40);
  id v6 = v2;
  sub_100066F24(v3, v4);
}

uint64_t sub_100063B04(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void))(*(void *)(a1 + 32) + 16))(*(void *)(a1 + 32), *(void *)(a1 + 40), 0);
}

id sub_100063C34(uint64_t a1)
{
  id result = [*(id *)(a1 + 32) coordinatorScope];
  if (result == 1)
  {
    uint64_t v3 = sub_100004B28((uint64_t)off_100109BB8);
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v4 = *(void *)(a1 + 32);
      int v6 = 136315394;
      id v7 = "-[IXSCoordinatedAppInstall(IPCMethods) _remote_convertToGloballyScopedWithCompletion:]_block_invoke";
      __int16 v8 = 2112;
      uint64_t v9 = v4;
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "%s: Converting to global scope: %@", (uint8_t *)&v6, 0x16u);
    }

    id v5 = +[IXSCoordinatorManager sharedInstance];
    [v5 convertProcessScopedCoordinatorToGlobalScoped:*(void *)(a1 + 32)];

    [*(id *)(a1 + 32) setCoordinatorScope:2];
    return [*(id *)(a1 + 32) setScopedToConnection:0];
  }
  return result;
}

id sub_100063F7C(uint64_t a1)
{
  return [*(id *)(a1 + 32) setPlaceholderDisposition:*(void *)(a1 + 40)];
}

void sub_100064068(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id sub_100064080(uint64_t a1)
{
  id result = [*(id *)(a1 + 32) placeholderDisposition];
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = result;
  return result;
}

id sub_10006418C(uint64_t a1)
{
  return [*(id *)(a1 + 32) setProgressHint:*(void *)(a1 + 40)];
}

void sub_1000642A0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t sub_1000642B8(uint64_t a1)
{
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = [*(id *)(a1 + 32) progressHint];

  return _objc_release_x1();
}

id sub_1000643CC(uint64_t a1)
{
  return [*(id *)(a1 + 32) setNewRemovabilityState:*(void *)(a1 + 40) removabilityClient:*(void *)(a1 + 48)];
}

void sub_1000644BC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id sub_1000644D4(uint64_t a1)
{
  id result = [*(id *)(a1 + 32) newRemovability];
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = result;
  return result;
}

id sub_100064508(uint64_t a1)
{
  id result = [*(id *)(a1 + 32) hasBegun];
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = (_BYTE)result;
  return result;
}

id sub_10006453C(uint64_t a1)
{
  id result = [*(id *)(a1 + 32) isComplete];
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = (_BYTE)result;
  return result;
}

id sub_100064570(uint64_t a1)
{
  return [*(id *)(a1 + 32) decommission];
}

void sub_100064578(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) error];

  if (!v2)
  {
    [*(id *)(a1 + 32) setDelegate:0];
    uint64_t v3 = *(void **)(a1 + 32);
    uint64_t v4 = *(void *)(a1 + 40);
    uint64_t v5 = *(void *)(a1 + 48);
    [v3 cancelForReason:v4 client:v5 error:0];
  }
}

id sub_1000645E4(uint64_t a1)
{
  id result = [*(id *)(a1 + 32) isComplete];
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = (_BYTE)result;
  return result;
}

uint64_t sub_100064684()
{
  return *(void *)v0;
}

uint64_t sub_100064690@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  *(void *)(v2 - 40) = a2;
  return *(void *)a1;
}

void sub_1000646A8(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, &a9, 0x16u);
}

void sub_1000646C4(uint64_t a1@<X8>)
{
  *(void *)(v1 - _Block_object_dispose(&STACK[0x2B0], 8) = a1;
}

void sub_1000646D0(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
  _os_log_fault_impl(a1, a2, OS_LOG_TYPE_FAULT, a4, a5, 0x20u);
}

uint64_t sub_1000646E8@<X0>(uint64_t result@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  *(void *)(a2 + 4) = a3;
  *(_WORD *)(a2 + 12) = 2112;
  *(void *)(a2 + 14) = result;
  return result;
}

void sub_100064998(id a1, id a2)
{
}

void sub_100064A14(id a1)
{
  qword_100109F48 = objc_alloc_init(IXSContainerRefreshManager);

  _objc_release_x1();
}

uint64_t sub_100065050(void *a1, uint64_t a2, void *a3)
{
  id v4 = a1;
  uint64_t v5 = [v4 bundleID];
  if (container_query_create())
  {
    container_query_operation_set_flags();
    id v6 = v5;
    xpc_object_t v7 = xpc_string_create((const char *)[v6 UTF8String]);
    container_query_set_identifiers();

    container_query_set_transient();
    if (![v4 isPersonalPersonaPlaceholder])
    {
      id v10 = [v4 personaUniqueString];
      [v10 UTF8String];
    }
    container_query_set_persona_unique_string();
    container_query_set_class();
    if (container_query_get_single_result())
    {
      if (container_delete_all_container_content() == 1)
      {
        container_query_free();
        id v11 = 0;
        uint64_t v12 = 1;
        goto LABEL_24;
      }
      container_get_error_description();
      long long v19 = sub_100004B28((uint64_t)off_100109BB8);
      if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR)) {
        sub_100095D04();
      }

      sub_10003DAE4((uint64_t)"_ClearContainer", 125, @"IXErrorDomain", 0x23uLL, 0, 0, @"Failed to wipe container for identifier \"%@\" : %s", v20, (uint64_t)v6);
    }
    else
    {
      if (container_query_get_last_error())
      {
        uint64_t v13 = (void *)container_error_copy_unlocalized_description();
        int posix_errno = container_error_get_posix_errno();
        if (posix_errno)
        {
          unint64_t v15 = posix_errno;
          long long v16 = strerror(posix_errno);
          long long v18 = sub_10003DAE4((uint64_t)"_ClearContainer", 112, NSPOSIXErrorDomain, v15, 0, 0, @"Underlying errno set by container manager is %s", v17, (uint64_t)v16);
        }
        else
        {
          long long v18 = 0;
        }
        uint64_t v24 = sub_100004B28((uint64_t)off_100109BB8);
        if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR)) {
          sub_100095C78((uint64_t)v13, (uint64_t)v18, v24);
        }

        sub_10003DAE4((uint64_t)"_ClearContainer", 114, @"IXErrorDomain", 0x23uLL, v18, 0, @"container_query_get_single_result failed : %s", v25, (uint64_t)v13);
        id v11 = (id)objc_claimAutoreleasedReturnValue();
        free(v13);

        goto LABEL_21;
      }
      unsigned __int8 v21 = sub_100004B28((uint64_t)off_100109BB8);
      if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR)) {
        sub_100095BFC();
      }

      sub_10003DAE4((uint64_t)"_ClearContainer", 117, @"IXErrorDomain", 0x23uLL, 0, 0, @"Failed to fetch container for identity \"%@\" of class %llu", v22, (uint64_t)v4);
    }
  }
  else
  {
    __int16 v8 = sub_100004B28((uint64_t)off_100109BB8);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      sub_100095B7C();
    }

    sub_10003DAE4((uint64_t)"_ClearContainer", 90, @"IXErrorDomain", 0x23uLL, 0, 0, @"Failed to create container query for %@", v9, (uint64_t)v5);
  }
  id v11 = (id)objc_claimAutoreleasedReturnValue();
LABEL_21:
  container_query_free();
  if (a3)
  {
    id v11 = v11;
    uint64_t v12 = 0;
    *a3 = v11;
  }
  else
  {
    uint64_t v12 = 0;
  }
LABEL_24:

  return v12;
}

void sub_100065504(uint64_t a1)
{
  uint64_t v2 = (uint64_t *)(a1 + 40);
  uint64_t v3 = [*(id *)(a1 + 32) coordinatorForIdentity:*(void *)(a1 + 40)];
  if (v3)
  {
    id v4 = sub_100004B28((uint64_t)off_100109BB8);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      sub_100095D80(v2, (uint64_t)v3, v4);
    }

    sub_10003DAE4((uint64_t)"-[IXSContainerRefreshManager refreshContainerTypes:forAppWithIdentity:reason:completion:]_block_invoke", 190, @"IXErrorDomain", 5uLL, 0, 0, @"Failed to refresh container %@ because a coordinator already existed: %@", v5, *v2);
    id v6 = (id)objc_claimAutoreleasedReturnValue();
    id v7 = 0;
    goto LABEL_5;
  }
  uint64_t v9 = *(void **)(a1 + 48);
  id v10 = [*(id *)(a1 + 40) bundleID];
  uint64_t v11 = *(void *)(a1 + 56);
  id v18 = 0;
  id v19 = 0;
  unsigned int v12 = objc_msgSend(v9, "_onQueue_terminateBundleID:reason:terminationAssertion:error:", v10, v11, &v19, &v18);
  id v7 = v19;
  id v6 = v18;

  if (!v12)
  {
    if (v7) {
      [v7 invalidate];
    }
    goto LABEL_5;
  }
  uint64_t v13 = *(void *)(a1 + 72);
  uint64_t v15 = *(void *)(a1 + 40);
  uint64_t v14 = *(void **)(a1 + 48);
  id v17 = v6;
  unsigned int v16 = objc_msgSend(v14, "_onQueue_refreshContainerTypes:forAppWithIdentity:error:", v13, v15, &v17);
  id v8 = v17;

  if (v7)
  {
    [v7 invalidate];
    if ((v16 & 1) == 0) {
      goto LABEL_16;
    }
LABEL_14:
    (*(void (**)(void))(*(void *)(a1 + 64) + 16))();
    goto LABEL_6;
  }
  if (v16) {
    goto LABEL_14;
  }
  id v7 = 0;
LABEL_16:
  id v6 = v8;
LABEL_5:
  (*(void (**)(void))(*(void *)(a1 + 64) + 16))();
  id v8 = v6;
LABEL_6:
}

void sub_1000656C0(void *a1, uint64_t a2, os_log_t log, const char *a4, ...)
{
  va_start(va, a4);
  _os_log_error_impl(a1, log, OS_LOG_TYPE_ERROR, a4, (uint8_t *)va, 0x2Au);
}

void sub_100065F7C(void *a1)
{
  id v1 = a1;
  uint64_t v2 = +[NSThread currentThread];
  uint64_t v3 = [v2 name];

  id v4 = [objc_allocWithZone((Class)NSMutableString) initWithString:@"** INTERNAL ERROR: Uncaught Exception **\n"];
  [v4 appendString:@"Exception: "];
  if (v3)
  {
    [v4 appendString:@"<"];
    [v4 appendString:v3];
    [v4 appendString:@"> "];
  }
  uint64_t v5 = [v1 name];

  if (v5)
  {
    id v6 = [v1 name];
    [v4 appendString:v6];

    [v4 appendString:@": "];
  }
  id v7 = [v1 reason];

  if (v7)
  {
    id v8 = [v1 reason];
    [v4 appendString:v8];
  }
  [v4 appendString:@"\nStack:\n"];
  uint64_t v9 = [v1 callStackSymbols];
  id v10 = [v9 componentsJoinedByString:@"\n"];
  [v4 appendString:v10];

  pthread_mutex_lock(&stru_100109B78);
  if (v4) {
    qword_100109D48 = (uint64_t)strdup((const char *)[v4 UTF8String]);
  }
  os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR);
  _os_log_send_and_compose_impl();
  _os_crash_msg();
  __break(1u);
}

void sub_1000661CC(id a1)
{
  if (!dlopen("/System/Library/Frameworks/HealthKit.framework/HealthKit", 1))
  {
    uint64_t v5 = dlerror();
    id v4 = sub_100004B28((uint64_t)off_100109BB8);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_FAULT)) {
      sub_100095F3C((uint64_t)v5, v4);
    }
    goto LABEL_14;
  }
  qword_100109F68 = (uint64_t)NSClassFromString(@"HKHealthStore");
  qword_100109F70 = (uint64_t)NSClassFromString(@"HKSourceStore");
  Class v1 = NSClassFromString(@"_HKBehavior");
  qword_100109F78 = (uint64_t)v1;
  if (qword_100109F68) {
    BOOL v2 = qword_100109F70 == 0;
  }
  else {
    BOOL v2 = 1;
  }
  if (v2 || v1 == 0)
  {
    id v4 = sub_100004B28((uint64_t)off_100109BB8);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_FAULT)) {
      sub_100095FC8(v4);
    }
LABEL_14:
  }
}

void sub_1000663A4(id a1)
{
  id v1 = [(objc_class *)+[IXSHealthKitDataUninstallAlert hkBehaviorClass] sharedBehavior];
  byte_100109F58 = [v1 healthAppSupportedOnDevice];
}

void sub_1000668AC(uint64_t a1, uint64_t a2, void *a3)
{
  id v5 = a3;
  id v6 = sub_100004B28((uint64_t)off_100109BB8);
  id v7 = v6;
  if (v5)
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      sub_100096078(a1, (uint64_t)v5, v7);
    }

    (*(void (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), 0);
  }
  else
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      id v8 = "is not";
      uint64_t v11 = "+[IXSHealthKitDataUninstallAlert healthKitDataPresentForAppWithBundleID:completion:]_block_invoke";
      uint64_t v9 = *(void *)(a1 + 32);
      int v10 = 136315650;
      if (a2) {
        id v8 = "is";
      }
      __int16 v12 = 2080;
      uint64_t v13 = v8;
      __int16 v14 = 2112;
      uint64_t v15 = v9;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "%s: HealthKit data %s present for app with bundle ID %@", (uint8_t *)&v10, 0x20u);
    }

    (*(void (**)(void, uint64_t))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), a2);
  }
}

void sub_100066E44(NSObject *a1, void *a2)
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100066ED8;
  block[3] = &unk_1000E91E0;
  id v5 = a2;
  id v3 = v5;
  dispatch_async(a1, block);
}

void sub_100066ED8(uint64_t a1)
{
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

void sub_100066F24(void *a1, void *a2)
{
  id v3 = a2;
  id v4 = a1;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_100066FF0;
  v7[3] = &unk_1000EA670;
  id v8 = (id)os_transaction_create();
  id v9 = v3;
  id v5 = v8;
  id v6 = v3;
  dispatch_async(v4, v7);
}

void sub_100066FF0(uint64_t a1)
{
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

dispatch_queue_global_t sub_10006703C()
{
  intptr_t v0 = qos_class_self();

  return dispatch_get_global_queue(v0, 0);
}

uint64_t sub_10006706C()
{
  return _os_variant_has_internal_diagnostics("com.apple.installcoordination");
}

void sub_100067118()
{
  id v0 = objc_alloc_init((Class)objc_opt_class());
  id v1 = (void *)qword_100109F80;
  qword_100109F80 = (uint64_t)v0;

  if (!dlopen("/System/Library/Frameworks/Photos.framework/Photos", 1))
  {
    dlerror();
    id v4 = sub_100004B28((uint64_t)off_100109BB8);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_FAULT)) {
      sub_100096214();
    }
    goto LABEL_11;
  }
  qword_100109F98 = (uint64_t)NSClassFromString(@"PHAsset");
  Class v2 = NSClassFromString(@"PHPhotoLibrary");
  qword_100109FA0 = (uint64_t)v2;
  if (qword_100109F98) {
    BOOL v3 = v2 == 0;
  }
  else {
    BOOL v3 = 1;
  }
  if (v3)
  {
    id v4 = sub_100004B28((uint64_t)off_100109BB8);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_FAULT)) {
      sub_100096288(v4);
    }
LABEL_11:
  }
  if (dlopen("/System/Library/PrivateFrameworks/IMCore.framework/IMCore", 1))
  {
    qword_100109F90 = (uint64_t)NSClassFromString(@"IMCloudKitHooks");
    if (qword_100109F90) {
      return;
    }
    id v5 = sub_100004B28((uint64_t)off_100109BB8);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_FAULT)) {
      sub_100096188(v5, v6, v7, v8, v9, v10, v11, v12);
    }
  }
  else
  {
    dlerror();
    id v5 = sub_100004B28((uint64_t)off_100109BB8);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_FAULT)) {
      sub_100096114();
    }
  }
}

uint64_t sub_1000678C8(uint64_t a1)
{
  if (a1 != 3) {
    return 1;
  }
  id v1 = +[IXGlobalConfiguration sharedInstance];
  uint64_t v2 = [v1 isiPad] ^ 1;

  return v2;
}

uint64_t sub_100067918(void *a1)
{
  id v1 = a1;
  uint64_t v2 = +[LSApplicationRecord enumeratorWithOptions:128];
  id v3 = [v1 isEqualToString:@"com.apple.AppStore"];
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  id v4 = v2;
  id v23 = [v4 countByEnumeratingWithState:&v24 objects:v28 count:16];
  uint64_t v5 = 0;
  if (v23)
  {
    uint64_t v6 = *(void *)v25;
    uint64_t v22 = *(void *)v25;
    do
    {
      for (i = 0; i != v23; i = (char *)i + 1)
      {
        if (*(void *)v25 != v6) {
          objc_enumerationMutation(v4);
        }
        uint64_t v8 = *(void **)(*((void *)&v24 + 1) + 8 * i);
        uint64_t v9 = objc_msgSend(v8, "iTunesMetadata", v22);
        uint64_t v10 = [v9 distributorInfo];

        if (v3)
        {
          uint64_t v11 = +[MCProfileConnection sharedConnection];
          uint64_t v12 = [v11 managedAppBundleIDs];

          uint64_t v13 = [v8 bundleIdentifier];
          if ([v12 containsObject:v13])
          {
          }
          else
          {
            id v16 = v3;
            id v17 = v4;
            id v18 = v1;
            id v19 = [v8 iTunesMetadata];
            unsigned __int8 v20 = [v19 isDeviceBasedVPP];

            if ((v20 & 1) == 0 && [v10 distributorType] == (id)1) {
              ++v5;
            }
            id v1 = v18;
            id v4 = v17;
            id v3 = v16;
            uint64_t v6 = v22;
          }
        }
        else
        {
          uint64_t v12 = [v10 distributorID];
          if ([v12 isEqualToString:v1])
          {
            __int16 v14 = [v8 bundleIdentifier];
            uint64_t v15 = [v14 isEqualToString:v1] ^ 1;

            v5 += v15;
            goto LABEL_16;
          }
        }

LABEL_16:
      }
      id v23 = [v4 countByEnumeratingWithState:&v24 objects:v28 count:16];
    }
    while (v23);
  }

  return v5;
}

uint64_t sub_1000686F4()
{
  qword_100109FA8 = (uint64_t)objc_alloc_init((Class)objc_opt_class());

  return _objc_release_x1();
}

id sub_100068824(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_onQueue_restoreSavedPromises");
}

void sub_100069094(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,char a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,long long buf)
{
  if (a2)
  {
    if (a2 == 2)
    {
      id v43 = objc_begin_catch(exception_object);
      id v44 = sub_100004B28((uint64_t)off_100109BB8);
      if (os_log_type_enabled(v44, OS_LOG_TYPE_DEFAULT))
      {
        LODWORD(buf) = 136315394;
        *(void *)((char *)&buf + 4) = "-[IXSDataPromiseManager _onQueue_restoreSavedPromises]";
        WORD6(buf) = 2112;
        *(void *)((char *)&buf + 14) = v43;
        _os_log_impl((void *)&_mh_execute_header, v44, OS_LOG_TYPE_DEFAULT, "%s: Got exception while decoding promises: %@", (uint8_t *)&buf, 0x16u);
      }

      uint64_t v45 = *(void **)(a15 + 16);
      *(void *)(a15 + 16) = 0;

      objc_end_catch();
      JUMPOUT(0x100069020);
    }
    objc_begin_catch(exception_object);
    JUMPOUT(0x100069028);
  }
  _Unwind_Resume(exception_object);
}

id sub_1000691DC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return [*(id *)(a1 + 32) _promiseForUUID:a2 ofType:a3 useQueue:0];
}

void sub_1000691F0(uint64_t a1, uint64_t a2, void *a3)
{
  id v4 = a3;
  uint64_t v5 = [v4 accessQueue];
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_1000692B4;
  v7[3] = &unk_1000E9948;
  id v8 = v4;
  id v9 = *(id *)(a1 + 32);
  id v6 = v4;
  dispatch_sync(v5, v7);
}

id sub_1000692B4(uint64_t a1)
{
  return [*(id *)(a1 + 32) awakeFromSerializationWithLookupBlock:*(void *)(a1 + 40) error:0];
}

void sub_100069594(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t sub_1000695AC(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void sub_1000695BC(uint64_t a1)
{
}

void sub_1000695C4(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) uuidToPromiseMap];
  uint64_t v3 = [v2 objectForKey:*(void *)(a1 + 40)];
  uint64_t v4 = *(void *)(*(void *)(a1 + 48) + 8);
  uint64_t v5 = *(void **)(v4 + 40);
  *(void *)(v4 + 40) = v3;

  if (([*(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) isTracked] & 1) == 0)
  {
    uint64_t v6 = *(void *)(*(void *)(a1 + 48) + 8);
    uint64_t v7 = *(void **)(v6 + 40);
    *(void *)(v6 + 40) = 0;
  }
}

void sub_1000697C8(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 40);
  uint64_t v3 = [*(id *)(a1 + 32) uuidToPromiseMap];
  uint64_t v4 = [*(id *)(a1 + 40) uniqueIdentifier];
  [v3 setObject:v2 forKeyedSubscript:v4];

  uint64_t v5 = [*(id *)(a1 + 40) accessQueue];
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_1000698AC;
  v8[3] = &unk_1000E8E08;
  id v6 = *(id *)(a1 + 40);
  uint64_t v7 = *(void *)(a1 + 32);
  id v9 = v6;
  uint64_t v10 = v7;
  sub_100066F24(v5, v8);
}

id sub_1000698AC(uint64_t a1)
{
  [*(id *)(a1 + 32) setDelegate:*(void *)(a1 + 40)];
  uint64_t v2 = *(void **)(a1 + 32);

  return [v2 saveState];
}

void sub_10006999C(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) uuidToPromiseMap];
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472;
  v3[2] = sub_100069A3C;
  v3[3] = &unk_1000EAD80;
  id v4 = *(id *)(a1 + 40);
  [v2 enumerateKeysAndObjectsUsingBlock:v3];
}

void sub_100069A3C(uint64_t a1, uint64_t a2, void *a3, unsigned char *a4)
{
  id v6 = a3;
  if ([v6 isTracked] && ((*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))() & 1) == 0) {
    *a4 = 1;
  }
}

void sub_100069B64(uint64_t a1)
{
  id v3 = [*(id *)(a1 + 32) uuidToPromiseMap];
  uint64_t v2 = [*(id *)(a1 + 40) uniqueIdentifier];
  [v3 removeObjectForKey:v2];
}

void sub_100069E8C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,char a29)
{
}

void sub_100069EC0(uint64_t a1)
{
  id v5 = [*(id *)(a1 + 32) uuidToPromiseMap];
  uint64_t v2 = [v5 allValues];
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
  id v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;
}

void sub_100069F28(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) error];

  if (!v2)
  {
    id v4 = *(void **)(a1 + 32);
    sub_10003DAE4((uint64_t)"-[IXSDataPromiseManager clearAllPromisesForCreator:]_block_invoke_2", 262, @"IXErrorDomain", 1uLL, 0, 0, @"Clearing all promises", v3, v5);
    id v6 = (id)objc_claimAutoreleasedReturnValue();
    [v4 cancelForReason:v6 client:15 error:0];
  }
}

void sub_10006A0CC(uint64_t a1)
{
  uint64_t v2 = *(void **)(a1 + 32);
  uint64_t v3 = [*(id *)(a1 + 40) delegate];

  if (v2 == v3)
  {
    id v4 = *(void **)(a1 + 40);
    uint64_t v5 = *(void *)(a1 + 48);
    uint64_t v6 = *(void *)(a1 + 56);
    [v4 cancelForReason:v5 client:v6 error:0];
  }
}

void sub_10006A6BC(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_10006AB4C(uint64_t a1)
{
  uint64_t v2 = sub_100004B28((uint64_t)off_100109BB8);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = *(void *)(a1 + 32);
    uint64_t v4 = *(void *)(a1 + 40);
    int v6 = 136315650;
    uint64_t v7 = "-[IXSClientConnection addInterestedCoordinatorUUIDs:]_block_invoke";
    __int16 v8 = 2112;
    uint64_t v9 = v3;
    __int16 v10 = 2112;
    uint64_t v11 = v4;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "%s: %@: Interested in UUIDs: %@", (uint8_t *)&v6, 0x20u);
  }

  uint64_t v5 = [*(id *)(a1 + 32) interestedCoordinatorUUIDs];
  [v5 unionSet:*(void *)(a1 + 40)];
}

void sub_10006ACEC(uint64_t a1)
{
  uint64_t v2 = sub_100004B28((uint64_t)off_100109BB8);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = *(void *)(a1 + 32);
    uint64_t v4 = *(void *)(a1 + 40);
    int v6 = 136315650;
    uint64_t v7 = "-[IXSClientConnection addInterestedCoordinatorUUID:]_block_invoke";
    __int16 v8 = 2112;
    uint64_t v9 = v3;
    __int16 v10 = 2112;
    uint64_t v11 = v4;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "%s: %@: Interested in UUID: %@", (uint8_t *)&v6, 0x20u);
  }

  uint64_t v5 = [*(id *)(a1 + 32) interestedCoordinatorUUIDs];
  [v5 addObject:*(void *)(a1 + 40)];
}

void sub_10006AE8C(uint64_t a1)
{
  uint64_t v2 = (uint64_t *)&off_100109BB8;
  uint64_t v3 = sub_100004B28((uint64_t)off_100109BB8);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v4 = *(void *)(a1 + 32);
    uint64_t v5 = *(void **)(a1 + 40);
    *(_DWORD *)buf = 136315650;
    unint64_t v37 = "-[IXSClientConnection removeInterestedCoordinatorUUIDs:]_block_invoke";
    __int16 v38 = 2112;
    uint64_t v39 = v4;
    __int16 v40 = 2112;
    id v41 = v5;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "%s: %@: No longer interested in UUIDs: %@", buf, 0x20u);
  }

  int v6 = [*(id *)(a1 + 32) interestedCoordinatorUUIDs];
  uint64_t v7 = objc_opt_new();
  long long v31 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  id obj = *(id *)(a1 + 40);
  id v8 = [obj countByEnumeratingWithState:&v31 objects:v35 count:16];
  if (!v8)
  {
    id v28 = 0;
    __int16 v10 = 0;
    goto LABEL_27;
  }
  id v9 = v8;
  id v28 = 0;
  __int16 v10 = 0;
  uint64_t v11 = *(void *)v32;
  do
  {
    for (i = 0; i != v9; i = (char *)i + 1)
    {
      if (*(void *)v32 != v11) {
        objc_enumerationMutation(obj);
      }
      uint64_t v13 = *(void **)(*((void *)&v31 + 1) + 8 * i);
      id v14 = [v6 countForObject:v13];
      if (v14)
      {
        if (v14 != (id)1) {
          continue;
        }
        [v7 addObject:v13];
        if (!v10)
        {
          __int16 v10 = +[IXSCoordinatorManager sharedInstance];
        }
        uint64_t v15 = [v10 coordinatorForUUID:v13];
        id v16 = v15;
        if (v15 && [v15 coordinatorScope] == 1)
        {
          __int16 v29 = v10;
          id v17 = v7;
          id v18 = v2;
          uint64_t v19 = a1;
          unsigned __int8 v20 = *(void **)(a1 + 32);
          unsigned __int8 v21 = [v16 scopedToConnection];

          if (v20 == v21)
          {
            a1 = v19;
            uint64_t v23 = (uint64_t)v28;
            if (!v28)
            {
              long long v24 = [*(id *)(a1 + 32) clientName];
              uint64_t v23 = sub_10003DAE4((uint64_t)"-[IXSClientConnection removeInterestedCoordinatorUUIDs:]_block_invoke", 214, @"IXErrorDomain", 0x21uLL, 0, 0, @"Process-scoped coordinator no longer referenced by client %@", v25, (uint64_t)v24);
            }
            id v28 = (void *)v23;
            [v16 cancelForReason:v23 client:15 error:0];
          }
          else
          {
            a1 = v19;
          }
          uint64_t v2 = v18;
          uint64_t v7 = v17;
          __int16 v10 = v29;
        }
      }
      else
      {
        id v16 = sub_100004B28(*v2);
        if (os_log_type_enabled(v16, OS_LOG_TYPE_FAULT))
        {
          uint64_t v22 = *(void *)(a1 + 32);
          *(_DWORD *)buf = 136315650;
          unint64_t v37 = "-[IXSClientConnection removeInterestedCoordinatorUUIDs:]_block_invoke";
          __int16 v38 = 2112;
          uint64_t v39 = v22;
          __int16 v40 = 2112;
          id v41 = v13;
          _os_log_fault_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_FAULT, "%s: %@: Client is no longer interested in %@ but we didn't know they were interested", buf, 0x20u);
        }
      }
    }
    id v9 = [obj countByEnumeratingWithState:&v31 objects:v35 count:16];
  }
  while (v9);
LABEL_27:

  [v6 minusSet:*(void *)(a1 + 40)];
  if ([v7 count])
  {
    long long v26 = sub_100004B28(*v2);
    if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v27 = *(void *)(a1 + 32);
      *(_DWORD *)buf = 136315650;
      unint64_t v37 = "-[IXSClientConnection removeInterestedCoordinatorUUIDs:]_block_invoke";
      __int16 v38 = 2112;
      uint64_t v39 = v27;
      __int16 v40 = 2112;
      id v41 = v7;
      _os_log_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_DEFAULT, "%s: %@: Removed last reference for UUIDs: %@", buf, 0x20u);
    }
  }
}

void sub_10006B3CC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_10006B3E4(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) interestedCoordinatorUUIDs];
  *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = [v2 containsObject:*(void *)(a1 + 40)];
}

void sub_10006B570(uint64_t a1)
{
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  id v2 = objc_msgSend(*(id *)(a1 + 32), "interestedPromiseUUIDs", 0);
  id v3 = [v2 countByEnumeratingWithState:&v8 objects:v12 count:16];
  if (v3)
  {
    id v4 = v3;
    uint64_t v5 = *(void *)v9;
    do
    {
      int v6 = 0;
      do
      {
        if (*(void *)v9 != v5) {
          objc_enumerationMutation(v2);
        }
        [*(id *)(a1 + 40) cancelPromiseForUUIDIfNotAssociatedWithAnyCoordinator:*(void *)(*((void *)&v8 + 1) + 8 * (void)v6) withReason:*(void *)(a1 + 48) client:15];
        int v6 = (char *)v6 + 1;
      }
      while (v4 != v6);
      id v4 = [v2 countByEnumeratingWithState:&v8 objects:v12 count:16];
    }
    while (v4);
  }

  uint64_t v7 = [*(id *)(a1 + 32) interestedPromiseUUIDs];
  [v7 removeAllObjects];
}

void sub_10006B738(uint64_t a1)
{
  id v2 = sub_100004B28((uint64_t)off_100109BB8);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = *(void *)(a1 + 32);
    uint64_t v4 = *(void *)(a1 + 40);
    int v6 = 136315650;
    uint64_t v7 = "-[IXSClientConnection addInterestedPromiseUUID:]_block_invoke";
    __int16 v8 = 2112;
    uint64_t v9 = v3;
    __int16 v10 = 2112;
    uint64_t v11 = v4;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "%s: %@: Interested in UUID: %@", (uint8_t *)&v6, 0x20u);
  }

  uint64_t v5 = [*(id *)(a1 + 32) interestedPromiseUUIDs];
  [v5 addObject:*(void *)(a1 + 40)];
}

void sub_10006B8D8(uint64_t a1)
{
  id v2 = sub_100004B28((uint64_t)off_100109BB8);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = *(void *)(a1 + 32);
    uint64_t v4 = *(void *)(a1 + 40);
    int v6 = 136315650;
    uint64_t v7 = "-[IXSClientConnection addInterestedPromiseUUIDs:]_block_invoke";
    __int16 v8 = 2112;
    uint64_t v9 = v3;
    __int16 v10 = 2112;
    uint64_t v11 = v4;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "%s: %@: Interested in UUIDs: %@", (uint8_t *)&v6, 0x20u);
  }

  uint64_t v5 = [*(id *)(a1 + 32) interestedPromiseUUIDs];
  [v5 unionSet:*(void *)(a1 + 40)];
}

void sub_10006BA78(uint64_t a1)
{
  id v2 = sub_100004B28((uint64_t)off_100109BB8);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = *(void *)(a1 + 32);
    uint64_t v4 = *(void *)(a1 + 40);
    *(_DWORD *)buf = 136315650;
    long long v24 = "-[IXSClientConnection removeInterestedPromiseUUIDs:]_block_invoke";
    __int16 v25 = 2112;
    uint64_t v26 = v3;
    __int16 v27 = 2112;
    uint64_t v28 = v4;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "%s: %@: No longer interested in UUIDs: %@", buf, 0x20u);
  }

  uint64_t v5 = [*(id *)(a1 + 32) interestedPromiseUUIDs];
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  id v6 = *(id *)(a1 + 40);
  id v7 = [v6 countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (!v7)
  {
    uint64_t v9 = 0;
    __int16 v10 = 0;
    goto LABEL_19;
  }
  id v8 = v7;
  uint64_t v9 = 0;
  __int16 v10 = 0;
  uint64_t v11 = *(void *)v19;
  do
  {
    uint64_t v12 = 0;
    do
    {
      if (*(void *)v19 != v11) {
        objc_enumerationMutation(v6);
      }
      uint64_t v13 = *(void *)(*((void *)&v18 + 1) + 8 * (void)v12);
      if ([v5 countForObject:v13] == (id)1)
      {
        if (v9)
        {
          if (v10)
          {
LABEL_11:
            [v9 cancelPromiseForUUIDIfNotAssociatedWithAnyCoordinator:v13 withReason:v10 client:15];
            goto LABEL_12;
          }
        }
        else
        {
          uint64_t v9 = +[IXSDataPromiseManager sharedInstance];
          if (v10) {
            goto LABEL_11;
          }
        }
        id v14 = [*(id *)(a1 + 32) clientName];
        __int16 v10 = sub_10003DAE4((uint64_t)"-[IXSClientConnection removeInterestedPromiseUUIDs:]_block_invoke", 302, @"IXErrorDomain", 0x12uLL, 0, 0, @"Promise was not attached to a coordinator and is no longer referenced by client %@", v15, (uint64_t)v14);

        goto LABEL_11;
      }
LABEL_12:
      uint64_t v12 = (char *)v12 + 1;
    }
    while (v8 != v12);
    id v16 = [v6 countByEnumeratingWithState:&v18 objects:v22 count:16];
    id v8 = v16;
  }
  while (v16);
LABEL_19:

  id v17 = [*(id *)(a1 + 32) interestedPromiseUUIDs];
  [v17 minusSet:*(void *)(a1 + 40)];
}

void sub_10006BE2C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_10006BE44(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) interestedPromiseUUIDs];
  *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = [v2 containsObject:*(void *)(a1 + 40)];
}

void sub_10006C1B4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, char a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,char a26)
{
}

uint64_t sub_10006C1D8(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void sub_10006C1E8(uint64_t a1)
{
}

void sub_10006C1F0(uint64_t a1)
{
  id v2 = *(void **)(a1 + 32);
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
  id obj = *(id *)(v3 + 40);
  unsigned int v4 = [v2 issueSandboxExtensionWithError:&obj];
  objc_storeStrong((id *)(v3 + 40), obj);
  if (v4)
  {
    uint64_t v5 = [*(id *)(a1 + 32) clientSeed];
    uint64_t v6 = *(void *)(*(void *)(a1 + 48) + 8);
    id v7 = *(void **)(v6 + 40);
    *(void *)(v6 + 40) = v5;
  }
}

void sub_10006C570(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, char a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,char a26)
{
}

void sub_10006C594(uint64_t a1)
{
  id v2 = *(void **)(a1 + 32);
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
  id obj = *(id *)(v3 + 40);
  unsigned int v4 = [v2 issueSandboxExtensionWithError:&obj];
  objc_storeStrong((id *)(v3 + 40), obj);
  if (v4)
  {
    uint64_t v5 = [*(id *)(a1 + 32) clientSeed];
    uint64_t v6 = *(void *)(*(void *)(a1 + 48) + 8);
    id v7 = *(void **)(v6 + 40);
    *(void *)(v6 + 40) = v5;
  }
}

void sub_10006C8E4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, ...)
{
  va_start(va1, a10);
  va_start(va, a10);
  uint64_t v11 = va_arg(va1, void);
  uint64_t v13 = va_arg(va1, void);
  uint64_t v14 = va_arg(va1, void);
  uint64_t v15 = va_arg(va1, void);
  uint64_t v16 = va_arg(va1, void);
  uint64_t v17 = va_arg(va1, void);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  _Unwind_Resume(a1);
}

void sub_10006C908(uint64_t a1)
{
  id v2 = *(void **)(a1 + 32);
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
  id obj = *(id *)(v3 + 40);
  unsigned int v4 = [v2 issueSandboxExtensionWithError:&obj];
  objc_storeStrong((id *)(v3 + 40), obj);
  if (v4)
  {
    uint64_t v5 = [*(id *)(a1 + 32) clientSeed];
    uint64_t v6 = *(void *)(*(void *)(a1 + 48) + 8);
    id v7 = *(void **)(v6 + 40);
    *(void *)(v6 + 40) = v5;
  }
}

void sub_10006CC20(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, ...)
{
  va_start(va, a10);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t sub_10006CC38(uint64_t a1)
{
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = [*(id *)(a1 + 32) clientSeed];

  return _objc_release_x1();
}

void sub_10006CF1C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, ...)
{
  va_start(va, a10);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t sub_10006CF34(uint64_t a1)
{
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = [*(id *)(a1 + 32) clientSeed];

  return _objc_release_x1();
}

void sub_10006D204(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, ...)
{
  va_start(va, a10);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t sub_10006D21C(uint64_t a1)
{
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = [*(id *)(a1 + 32) clientSeed];

  return _objc_release_x1();
}

void sub_10006D4EC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, ...)
{
  va_start(va, a10);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t sub_10006D504(uint64_t a1)
{
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = [*(id *)(a1 + 32) clientSeed];

  return _objc_release_x1();
}

void sub_10006D7E0(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 40);
  id v2 = [*(id *)(a1 + 32) clientSeed];
  (*(void (**)(uint64_t, id, void))(v1 + 16))(v1, v2, 0);
}

void sub_10006E59C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,char a29)
{
}

IXSCoordinatedAppInstall *sub_10006E610(uint64_t a1)
{
  if (*(unsigned char *)(a1 + 56) == 1) {
    id v2 = *(id *)(a1 + 32);
  }
  else {
    id v2 = 0;
  }
  uint64_t v3 = [[IXSCoordinatedAppInstall alloc] initWithSeed:*(void *)(a1 + 40) scopedToConnection:v2];
  *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = 1;

  return v3;
}

BOOL sub_10006E69C(void *a1, int a2)
{
  id v3 = a1;
  unsigned int v4 = v3;
  if (a2)
  {
    if ([v3 coordinatorScope] == 1) {
      BOOL v5 = a2 == 1;
    }
    else {
      BOOL v5 = a2 == 2;
    }
  }
  else
  {
    BOOL v5 = 1;
  }

  return v5;
}

__CFString *sub_10006E6F8(unint64_t a1)
{
  if (a1 >= 8)
  {
    uint64_t v1 = +[NSString stringWithFormat:@"Unknown intent value %lu", a1];
  }
  else
  {
    uint64_t v1 = off_1000EB3A0[a1];
  }

  return v1;
}

uint64_t sub_10006E964(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [v3 originalIntent];
  id v5 = *(id *)(a1 + 40);
  if (v5) {
    BOOL v6 = v5 == v4;
  }
  else {
    BOOL v6 = 1;
  }
  if (v6)
  {
    id v7 = *(void **)(a1 + 32);
    id v8 = [v3 seed];
    [v7 addObject:v8];
  }
  return 1;
}

uint64_t sub_10006EACC(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = v3;
  id v5 = *(id *)(a1 + 40);
  if (!v5 || v5 == [v3 creatorIdentifier])
  {
    BOOL v6 = *(void **)(a1 + 32);
    id v7 = [v4 description];
    [v6 addObject:v7];
  }
  return 1;
}

uint64_t sub_10006EFE8(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void sub_10006F5A8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,char a46)
{
  _Block_object_dispose(&a46, 8);
  _Block_object_dispose((const void *)(v46 - 176), 8);
  _Unwind_Resume(a1);
}

void sub_10006F5F4(uint64_t a1, char a2, void *a3)
{
  id v9 = a3;
  if (v9)
  {
    uint64_t v6 = *(void *)(*(void *)(a1 + 40) + 8);
    uint64_t v8 = *(void *)(v6 + 40);
    id v7 = (id *)(v6 + 40);
    if (!v8) {
      objc_storeStrong(v7, a3);
    }
  }
  else
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) |= a2;
  }
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

uint64_t sub_10006F684(uint64_t a1)
{
  if (*(unsigned char *)(a1 + 80))
  {
    id v2 = [*(id *)(a1 + 32) userInfo];
    id v3 = [v2 objectForKeyedSubscript:NSUnderlyingErrorKey];

    id v4 = +[IXSErrorPresenter sharedPresenter];
    objc_msgSend(v4, "presentErrorForIdentities:code:underlyingError:errorSource:", *(void *)(a1 + 40), objc_msgSend(*(id *)(a1 + 32), "code"), v3, *(void *)(a1 + 72));
  }
  id v5 = *(uint64_t (**)(void))(*(void *)(a1 + 48) + 16);

  return v5();
}

uint64_t sub_10007031C(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void sub_1000723C0(uint64_t a1, void *a2, void *a3, unsigned char *a4)
{
  id v7 = a2;
  uint64_t v8 = [a3 mostRestrictiveRemovabilityMetadata];
  [*(id *)(a1 + 32) setObject:v8 forKeyedSubscript:v7];

  *a4 = 0;
}

void sub_10007296C(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v4 = *(void *)(a1 + 32);
  id v6 = a3;
  uint64_t v5 = sub_10003BA48(a2);
  (*(void (**)(uint64_t, uint64_t, id))(v4 + 16))(v4, v5, v6);
}

void sub_100073990(uint64_t a1)
{
  id v2 = (uint64_t *)(a1 + 40);
  id v3 = [*(id *)(a1 + 32) coordinatorForIdentity:*(void *)(a1 + 40)];
  if (v3)
  {
    uint64_t v4 = sub_100004B28((uint64_t)off_100109BB8);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      sub_100098090();
    }

    sub_10003DAE4((uint64_t)"-[IXSClientConnection _remote_updateSINFForAppWithIdentity:sinfData:options:completion:]_block_invoke", 1683, @"IXErrorDomain", 0x1DuLL, 0, 0, @"Failed to update the SINF for %@ because a coordinator already existed: %@", v5, *v2);
    id v6 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v9 = [*(id *)(a1 + 40) bundleID];
    __int16 v10 = MobileInstallationUpdateSinfDataForInstallCoordination();
    id v6 = 0;

    if (v10)
    {
      (*(void (**)(void))(*(void *)(a1 + 64) + 16))();

      goto LABEL_12;
    }
  }
  if (!v6)
  {
    id v7 = sub_100004B28((uint64_t)off_100109BB8);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      sub_100098018();
    }

    sub_10003DAE4((uint64_t)"-[IXSClientConnection _remote_updateSINFForAppWithIdentity:sinfData:options:completion:]_block_invoke", 1699, @"IXErrorDomain", 0xEuLL, 0, 0, @"Updating SINF for %@ returned NO but did not set an error.", v8, *v2);
    id v6 = (id)objc_claimAutoreleasedReturnValue();
  }
  (*(void (**)(void))(*(void *)(a1 + 64) + 16))();
LABEL_12:
}

void sub_100073DD0(uint64_t a1)
{
  id v2 = (uint64_t *)(a1 + 40);
  id v3 = [*(id *)(a1 + 32) coordinatorForIdentity:*(void *)(a1 + 40)];
  if (v3)
  {
    uint64_t v4 = sub_100004B28((uint64_t)off_100109BB8);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      sub_10009817C();
    }

    sub_10003DAE4((uint64_t)"-[IXSClientConnection _remote_updateiTunesMetadata:forAppWithIdentity:completion:]_block_invoke", 1736, @"IXErrorDomain", 0x1DuLL, 0, 0, @"Failed to update the iTunesMetadata for %@ because a coordinator already existed: %@", v5, *v2);
    id v6 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v7 = [*(id *)(a1 + 40) bundleID];
    int v8 = MobileInstallationUpdateiTunesMetadataForInstallCoordination();
    id v6 = 0;

    if (v8)
    {
      id v9 = *(void (**)(void))(*(void *)(a1 + 56) + 16);
      goto LABEL_12;
    }
  }
  if (!v6)
  {
    __int16 v10 = sub_100004B28((uint64_t)off_100109BB8);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      sub_100098104();
    }

    sub_10003DAE4((uint64_t)"-[IXSClientConnection _remote_updateiTunesMetadata:forAppWithIdentity:completion:]_block_invoke", 1751, @"IXErrorDomain", 0xEuLL, 0, 0, @"Updating iTunesMetadata for %@ returned NO but did not set an error.", v11, *v2);
    id v6 = (id)objc_claimAutoreleasedReturnValue();
  }
  id v9 = *(void (**)(void))(*(void *)(a1 + 56) + 16);
LABEL_12:
  v9();
}

void sub_100074314(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) interestedCoordinatorUUIDs];
  unsigned __int8 v3 = [v2 containsObject:*(void *)(a1 + 40)];

  if ((v3 & 1) == 0)
  {
    uint64_t v4 = sub_100004B28((uint64_t)off_100109BB8);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_FAULT)) {
      sub_1000981F0();
    }
  }
}

id sub_1000743A0(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "_remote_appAssetPromiseHasBegunFulfillment:", *(void *)(a1 + 32));
}

uint64_t sub_1000743AC(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void sub_100074584(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) interestedCoordinatorUUIDs];
  unsigned __int8 v3 = [v2 containsObject:*(void *)(a1 + 40)];

  if ((v3 & 1) == 0)
  {
    uint64_t v4 = sub_100004B28((uint64_t)off_100109BB8);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_FAULT)) {
      sub_100098288();
    }
  }
}

id sub_100074610(void *a1, void *a2)
{
  return objc_msgSend(a2, "_remote_cancelForReason:client:completion:", a1[4], a1[6], a1[5]);
}

uint64_t sub_100074620(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void sub_1000747C8(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) interestedCoordinatorUUIDs];
  unsigned __int8 v3 = [v2 containsObject:*(void *)(a1 + 40)];

  if ((v3 & 1) == 0)
  {
    uint64_t v4 = sub_100004B28((uint64_t)off_100109BB8);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_FAULT)) {
      sub_100098320();
    }
  }
}

id sub_100074854(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "_remote_fireObserversForClient:completion:", *(void *)(a1 + 32), *(void *)(a1 + 40));
}

uint64_t sub_100074860(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void sub_100074A00(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) interestedCoordinatorUUIDs];
  unsigned __int8 v3 = [v2 containsObject:*(void *)(a1 + 40)];

  if ((v3 & 1) == 0)
  {
    uint64_t v4 = sub_100004B28((uint64_t)off_100109BB8);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_FAULT)) {
      sub_1000983B8();
    }
  }
}

void sub_100074A8C(uint64_t a1, void *a2)
{
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_100074B1C;
  v4[3] = &unk_1000EAF78;
  unsigned __int8 v3 = *(void **)(a1 + 40);
  void v4[4] = *(void *)(a1 + 32);
  id v5 = v3;
  objc_msgSend(a2, "_remote_getAppAssetPromise:", v4);
}

void sub_100074B1C(uint64_t a1, void *a2, void *a3)
{
  id v8 = a2;
  id v5 = a3;
  if (v8)
  {
    id v6 = *(void **)(a1 + 32);
    id v7 = [v8 uniqueIdentifier];
    [v6 addInterestedPromiseUUID:v7];
  }
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

uint64_t sub_100074BBC(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void sub_100074D60(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) interestedCoordinatorUUIDs];
  unsigned __int8 v3 = [v2 containsObject:*(void *)(a1 + 40)];

  if ((v3 & 1) == 0)
  {
    uint64_t v4 = sub_100004B28((uint64_t)off_100109BB8);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_FAULT)) {
      sub_100098450();
    }
  }
}

id sub_100074DEC(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "_remote_getAppAssetPromiseDRI:", *(void *)(a1 + 32));
}

uint64_t sub_100074DF8(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void sub_100074F9C(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) interestedCoordinatorUUIDs];
  unsigned __int8 v3 = [v2 containsObject:*(void *)(a1 + 40)];

  if ((v3 & 1) == 0)
  {
    uint64_t v4 = sub_100004B28((uint64_t)off_100109BB8);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_FAULT)) {
      sub_1000984E8();
    }
  }
}

id sub_100075028(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "_remote_getCoordinationState:", *(void *)(a1 + 32));
}

uint64_t sub_100075034(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void sub_1000751D8(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) interestedCoordinatorUUIDs];
  unsigned __int8 v3 = [v2 containsObject:*(void *)(a1 + 40)];

  if ((v3 & 1) == 0)
  {
    uint64_t v4 = sub_100004B28((uint64_t)off_100109BB8);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_FAULT)) {
      sub_100098580();
    }
  }
}

id sub_100075264(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "_remote_getErrorInfo:", *(void *)(a1 + 32));
}

uint64_t sub_100075270(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void sub_100075418(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) interestedCoordinatorUUIDs];
  unsigned __int8 v3 = [v2 containsObject:*(void *)(a1 + 40)];

  if ((v3 & 1) == 0)
  {
    uint64_t v4 = sub_100004B28((uint64_t)off_100109BB8);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_FAULT)) {
      sub_100098618();
    }
  }
}

void sub_1000754A4(uint64_t a1, void *a2)
{
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_100075534;
  v4[3] = &unk_1000EAFA0;
  unsigned __int8 v3 = *(void **)(a1 + 40);
  void v4[4] = *(void *)(a1 + 32);
  id v5 = v3;
  objc_msgSend(a2, "_remote_getInitialODRAssetPromises:", v4);
}

void sub_100075534(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v7 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v14;
    do
    {
      __int16 v10 = 0;
      do
      {
        if (*(void *)v14 != v9) {
          objc_enumerationMutation(v5);
        }
        uint64_t v11 = *(void **)(a1 + 32);
        uint64_t v12 = [*(id *)(*((void *)&v13 + 1) + 8 * (void)v10) uniqueIdentifier];
        [v11 addInterestedPromiseUUID:v12];

        __int16 v10 = (char *)v10 + 1;
      }
      while (v8 != v10);
      id v8 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v8);
  }
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

uint64_t sub_100075678(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void sub_10007581C(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) interestedCoordinatorUUIDs];
  unsigned __int8 v3 = [v2 containsObject:*(void *)(a1 + 40)];

  if ((v3 & 1) == 0)
  {
    uint64_t v4 = sub_100004B28((uint64_t)off_100109BB8);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_FAULT)) {
      sub_1000986B0();
    }
  }
}

id sub_1000758A8(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "_remote_getIsComplete:", *(void *)(a1 + 32));
}

uint64_t sub_1000758B4(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void sub_100075A58(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) interestedCoordinatorUUIDs];
  unsigned __int8 v3 = [v2 containsObject:*(void *)(a1 + 40)];

  if ((v3 & 1) == 0)
  {
    uint64_t v4 = sub_100004B28((uint64_t)off_100109BB8);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_FAULT)) {
      sub_100098748();
    }
  }
}

id sub_100075AE4(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "_remote_getIsPausedWithCompletion:", *(void *)(a1 + 32));
}

uint64_t sub_100075AF0(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void sub_100075C98(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) interestedCoordinatorUUIDs];
  unsigned __int8 v3 = [v2 containsObject:*(void *)(a1 + 40)];

  if ((v3 & 1) == 0)
  {
    uint64_t v4 = sub_100004B28((uint64_t)off_100109BB8);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_FAULT)) {
      sub_1000987E0();
    }
  }
}

void sub_100075D24(uint64_t a1, void *a2)
{
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_100075DB4;
  v4[3] = &unk_1000EAF78;
  unsigned __int8 v3 = *(void **)(a1 + 40);
  void v4[4] = *(void *)(a1 + 32);
  id v5 = v3;
  objc_msgSend(a2, "_remote_getPlaceholderPromise:", v4);
}

void sub_100075DB4(uint64_t a1, void *a2, void *a3)
{
  id v8 = a2;
  id v5 = a3;
  if (v8)
  {
    id v6 = *(void **)(a1 + 32);
    id v7 = [v8 uniqueIdentifier];
    [v6 addInterestedPromiseUUID:v7];
  }
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

uint64_t sub_100075E54(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void sub_100075FFC(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) interestedCoordinatorUUIDs];
  unsigned __int8 v3 = [v2 containsObject:*(void *)(a1 + 40)];

  if ((v3 & 1) == 0)
  {
    uint64_t v4 = sub_100004B28((uint64_t)off_100109BB8);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_FAULT)) {
      sub_100098878();
    }
  }
}

void sub_100076088(uint64_t a1, void *a2)
{
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_100076118;
  v4[3] = &unk_1000EAF78;
  unsigned __int8 v3 = *(void **)(a1 + 40);
  void v4[4] = *(void *)(a1 + 32);
  id v5 = v3;
  objc_msgSend(a2, "_remote_getPreparationPromise:", v4);
}

void sub_100076118(uint64_t a1, void *a2, void *a3)
{
  id v8 = a2;
  id v5 = a3;
  if (v8)
  {
    id v6 = *(void **)(a1 + 32);
    id v7 = [v8 uniqueIdentifier];
    [v6 addInterestedPromiseUUID:v7];
  }
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

uint64_t sub_1000761B8(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void sub_100076360(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) interestedCoordinatorUUIDs];
  unsigned __int8 v3 = [v2 containsObject:*(void *)(a1 + 40)];

  if ((v3 & 1) == 0)
  {
    uint64_t v4 = sub_100004B28((uint64_t)off_100109BB8);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_FAULT)) {
      sub_100098910();
    }
  }
}

void sub_1000763EC(uint64_t a1, void *a2)
{
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_10007647C;
  v4[3] = &unk_1000EAF78;
  unsigned __int8 v3 = *(void **)(a1 + 40);
  void v4[4] = *(void *)(a1 + 32);
  id v5 = v3;
  objc_msgSend(a2, "_remote_getUserDataPromise:", v4);
}

void sub_10007647C(uint64_t a1, void *a2, void *a3)
{
  id v8 = a2;
  id v5 = a3;
  if (v8)
  {
    id v6 = *(void **)(a1 + 32);
    id v7 = [v8 uniqueIdentifier];
    [v6 addInterestedPromiseUUID:v7];
  }
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

uint64_t sub_10007651C(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void sub_1000766C4(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) interestedCoordinatorUUIDs];
  unsigned __int8 v3 = [v2 containsObject:*(void *)(a1 + 40)];

  if ((v3 & 1) == 0)
  {
    uint64_t v4 = sub_100004B28((uint64_t)off_100109BB8);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_FAULT)) {
      sub_1000989A8();
    }
  }
}

void sub_100076750(uint64_t a1, void *a2)
{
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_1000767E0;
  v4[3] = &unk_1000EAF78;
  unsigned __int8 v3 = *(void **)(a1 + 40);
  void v4[4] = *(void *)(a1 + 32);
  id v5 = v3;
  objc_msgSend(a2, "_remote_getDeviceSecurityPromise:", v4);
}

void sub_1000767E0(uint64_t a1, void *a2, void *a3)
{
  id v8 = a2;
  id v5 = a3;
  if (v8)
  {
    id v6 = *(void **)(a1 + 32);
    id v7 = [v8 uniqueIdentifier];
    [v6 addInterestedPromiseUUID:v7];
  }
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

uint64_t sub_100076880(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void sub_100076A24(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) interestedCoordinatorUUIDs];
  unsigned __int8 v3 = [v2 containsObject:*(void *)(a1 + 40)];

  if ((v3 & 1) == 0)
  {
    uint64_t v4 = sub_100004B28((uint64_t)off_100109BB8);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_FAULT)) {
      sub_100098A40();
    }
  }
}

id sub_100076AB0(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "_remote_getHasDeviceSecurityPromise:", *(void *)(a1 + 32));
}

uint64_t sub_100076ABC(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void sub_100076C68(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) interestedCoordinatorUUIDs];
  unsigned __int8 v3 = [v2 containsObject:*(void *)(a1 + 40)];

  if ((v3 & 1) == 0)
  {
    uint64_t v4 = sub_100004B28((uint64_t)off_100109BB8);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_FAULT)) {
      sub_100098AD8();
    }
  }
}

id sub_100076CF4(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "_remote_setNeedsPostProcessing:completion:", *(unsigned __int8 *)(a1 + 40), *(void *)(a1 + 32));
}

uint64_t sub_100076D04(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void sub_100076EA0(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) interestedCoordinatorUUIDs];
  unsigned __int8 v3 = [v2 containsObject:*(void *)(a1 + 40)];

  if ((v3 & 1) == 0)
  {
    uint64_t v4 = sub_100004B28((uint64_t)off_100109BB8);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_FAULT)) {
      sub_100098B70();
    }
  }
}

id sub_100076F2C(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "_remote_getNeedsPostProcessing:", *(void *)(a1 + 32));
}

uint64_t sub_100076F38(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void sub_1000770DC(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) interestedCoordinatorUUIDs];
  unsigned __int8 v3 = [v2 containsObject:*(void *)(a1 + 40)];

  if ((v3 & 1) == 0)
  {
    uint64_t v4 = sub_100004B28((uint64_t)off_100109BB8);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_FAULT)) {
      sub_100098C08();
    }
  }
}

id sub_100077168(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "_remote_getPostProcessingShouldBegin:", *(void *)(a1 + 32));
}

uint64_t sub_100077174(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void sub_10007733C(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) interestedCoordinatorUUIDs];
  unsigned __int8 v3 = [v2 containsObject:*(void *)(a1 + 40)];

  if ((v3 & 1) == 0)
  {
    uint64_t v4 = sub_100004B28((uint64_t)off_100109BB8);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_FAULT)) {
      sub_100098CA0();
    }
  }
}

id sub_1000773C8(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "_remote_setEssentialAssetPromiseUUIDs:completion:", *(void *)(a1 + 32), *(void *)(a1 + 40));
}

uint64_t sub_1000773D4(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void sub_100077574(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) interestedCoordinatorUUIDs];
  unsigned __int8 v3 = [v2 containsObject:*(void *)(a1 + 40)];

  if ((v3 & 1) == 0)
  {
    uint64_t v4 = sub_100004B28((uint64_t)off_100109BB8);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_FAULT)) {
      sub_100098D38();
    }
  }
}

void sub_100077600(uint64_t a1, void *a2)
{
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_100077690;
  v4[3] = &unk_1000EAFA0;
  unsigned __int8 v3 = *(void **)(a1 + 40);
  void v4[4] = *(void *)(a1 + 32);
  id v5 = v3;
  objc_msgSend(a2, "_remote_getEssentialAssetPromises:", v4);
}

void sub_100077690(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v7 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v14;
    do
    {
      __int16 v10 = 0;
      do
      {
        if (*(void *)v14 != v9) {
          objc_enumerationMutation(v5);
        }
        uint64_t v11 = *(void **)(a1 + 32);
        uint64_t v12 = [*(id *)(*((void *)&v13 + 1) + 8 * (void)v10) uniqueIdentifier];
        [v11 addInterestedPromiseUUID:v12];

        __int16 v10 = (char *)v10 + 1;
      }
      while (v8 != v10);
      id v8 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v8);
  }
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

uint64_t sub_1000777D4(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void sub_100077978(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) interestedCoordinatorUUIDs];
  unsigned __int8 v3 = [v2 containsObject:*(void *)(a1 + 40)];

  if ((v3 & 1) == 0)
  {
    uint64_t v4 = sub_100004B28((uint64_t)off_100109BB8);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_FAULT)) {
      sub_100098DD0();
    }
  }
}

id sub_100077A04(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "_remote_hasEssentialAssetPromises:", *(void *)(a1 + 32));
}

uint64_t sub_100077A10(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void sub_100077BB4(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) interestedCoordinatorUUIDs];
  unsigned __int8 v3 = [v2 containsObject:*(void *)(a1 + 40)];

  if ((v3 & 1) == 0)
  {
    uint64_t v4 = sub_100004B28((uint64_t)off_100109BB8);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_FAULT)) {
      sub_100098E68();
    }
  }
}

id sub_100077C40(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "_remote_getUserDataRestoreShouldBegin:", *(void *)(a1 + 32));
}

uint64_t sub_100077C4C(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void sub_100077DF0(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) interestedCoordinatorUUIDs];
  unsigned __int8 v3 = [v2 containsObject:*(void *)(a1 + 40)];

  if ((v3 & 1) == 0)
  {
    uint64_t v4 = sub_100004B28((uint64_t)off_100109BB8);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_FAULT)) {
      sub_100098F00();
    }
  }
}

id sub_100077E7C(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "_remote_hasAppAssetPromise:", *(void *)(a1 + 32));
}

uint64_t sub_100077E88(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void sub_10007802C(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) interestedCoordinatorUUIDs];
  unsigned __int8 v3 = [v2 containsObject:*(void *)(a1 + 40)];

  if ((v3 & 1) == 0)
  {
    uint64_t v4 = sub_100004B28((uint64_t)off_100109BB8);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_FAULT)) {
      sub_100098F98();
    }
  }
}

id sub_1000780B8(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "_remote_hasInitialODRAssetPromises:", *(void *)(a1 + 32));
}

uint64_t sub_1000780C4(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void sub_100078268(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) interestedCoordinatorUUIDs];
  unsigned __int8 v3 = [v2 containsObject:*(void *)(a1 + 40)];

  if ((v3 & 1) == 0)
  {
    uint64_t v4 = sub_100004B28((uint64_t)off_100109BB8);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_FAULT)) {
      sub_100099030();
    }
  }
}

id sub_1000782F4(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "_remote_hasInstallOptions:", *(void *)(a1 + 32));
}

uint64_t sub_100078300(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void sub_1000784A4(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) interestedCoordinatorUUIDs];
  unsigned __int8 v3 = [v2 containsObject:*(void *)(a1 + 40)];

  if ((v3 & 1) == 0)
  {
    uint64_t v4 = sub_100004B28((uint64_t)off_100109BB8);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_FAULT)) {
      sub_1000990C8();
    }
  }
}

id sub_100078530(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "_remote_getInstallOptions:", *(void *)(a1 + 32));
}

uint64_t sub_10007853C(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void sub_1000786E0(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) interestedCoordinatorUUIDs];
  unsigned __int8 v3 = [v2 containsObject:*(void *)(a1 + 40)];

  if ((v3 & 1) == 0)
  {
    uint64_t v4 = sub_100004B28((uint64_t)off_100109BB8);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_FAULT)) {
      sub_100099160();
    }
  }
}

id sub_10007876C(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "_remote_hasPlaceholderPromise:", *(void *)(a1 + 32));
}

uint64_t sub_100078778(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void sub_10007891C(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) interestedCoordinatorUUIDs];
  unsigned __int8 v3 = [v2 containsObject:*(void *)(a1 + 40)];

  if ((v3 & 1) == 0)
  {
    uint64_t v4 = sub_100004B28((uint64_t)off_100109BB8);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_FAULT)) {
      sub_1000991F8();
    }
  }
}

id sub_1000789A8(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "_remote_hasUserDataPromise:", *(void *)(a1 + 32));
}

uint64_t sub_1000789B4(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void sub_100078B60(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) interestedCoordinatorUUIDs];
  unsigned __int8 v3 = [v2 containsObject:*(void *)(a1 + 40)];

  if ((v3 & 1) == 0)
  {
    uint64_t v4 = sub_100004B28((uint64_t)off_100109BB8);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_FAULT)) {
      sub_100099290();
    }
  }
}

id sub_100078BEC(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "_remote_setImportance:completion:", *(void *)(a1 + 40), *(void *)(a1 + 32));
}

uint64_t sub_100078BF8(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void sub_100078D94(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) interestedCoordinatorUUIDs];
  unsigned __int8 v3 = [v2 containsObject:*(void *)(a1 + 40)];

  if ((v3 & 1) == 0)
  {
    uint64_t v4 = sub_100004B28((uint64_t)off_100109BB8);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_FAULT)) {
      sub_100099328();
    }
  }
}

id sub_100078E20(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "_remote_importanceWithCompletion:", *(void *)(a1 + 32));
}

uint64_t sub_100078E2C(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void sub_100078FDC(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) interestedCoordinatorUUIDs];
  unsigned __int8 v3 = [v2 containsObject:*(void *)(a1 + 40)];

  if ((v3 & 1) == 0)
  {
    uint64_t v4 = sub_100004B28((uint64_t)off_100109BB8);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_FAULT)) {
      sub_1000993C0();
    }
  }
}

void sub_100079068(uint64_t a1, void *a2)
{
  uint64_t v3 = *(unsigned __int8 *)(a1 + 48);
  uint64_t v4 = *(void **)(a1 + 32);
  id v5 = a2;
  id v6 = [v4 xpcConnection];
  objc_msgSend(v5, "_remote_conveyPriorityReplacingExisting:forConnection:withCompletion:", v3, v6, *(void *)(a1 + 40));
}

uint64_t sub_1000790E4(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void sub_100079280(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) interestedCoordinatorUUIDs];
  unsigned __int8 v3 = [v2 containsObject:*(void *)(a1 + 40)];

  if ((v3 & 1) == 0)
  {
    uint64_t v4 = sub_100004B28((uint64_t)off_100109BB8);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_FAULT)) {
      sub_100099458();
    }
  }
}

id sub_10007930C(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "_remote_prioritizeWithCompletion:", *(void *)(a1 + 32));
}

uint64_t sub_100079318(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void sub_1000794D8(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) interestedCoordinatorUUIDs];
  unsigned __int8 v3 = [v2 containsObject:*(void *)(a1 + 40)];

  if ((v3 & 1) == 0)
  {
    uint64_t v4 = sub_100004B28((uint64_t)off_100109BB8);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_FAULT)) {
      sub_1000994F0();
    }
  }
}

id sub_100079564(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "_remote_setTargetGizmoPairingID:completion:", *(void *)(a1 + 32), *(void *)(a1 + 40));
}

uint64_t sub_100079570(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void sub_10007970C(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) interestedCoordinatorUUIDs];
  unsigned __int8 v3 = [v2 containsObject:*(void *)(a1 + 40)];

  if ((v3 & 1) == 0)
  {
    uint64_t v4 = sub_100004B28((uint64_t)off_100109BB8);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_FAULT)) {
      sub_100099588();
    }
  }
}

id sub_100079798(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "_remote_targetGizmoPairingIDWithCompletion:", *(void *)(a1 + 32));
}

uint64_t sub_1000797A4(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void sub_100079950(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) interestedCoordinatorUUIDs];
  unsigned __int8 v3 = [v2 containsObject:*(void *)(a1 + 40)];

  if ((v3 & 1) == 0)
  {
    uint64_t v4 = sub_100004B28((uint64_t)off_100109BB8);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_FAULT)) {
      sub_100099620();
    }
  }
}

id sub_1000799DC(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "_remote_setAppAssetPromiseDRI:completion:", *(void *)(a1 + 40), *(void *)(a1 + 32));
}

uint64_t sub_1000799E8(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void sub_100079BA8(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) interestedCoordinatorUUIDs];
  unsigned __int8 v3 = [v2 containsObject:*(void *)(a1 + 40)];

  if ((v3 & 1) == 0)
  {
    uint64_t v4 = sub_100004B28((uint64_t)off_100109BB8);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_FAULT)) {
      sub_1000996B8();
    }
  }
}

void sub_100079C34(void *a1, void *a2)
{
  uint64_t v3 = a1[4];
  uint64_t v4 = (void *)a1[5];
  id v5 = a2;
  id v6 = [v4 xpcConnection];
  objc_msgSend(v5, "_remote_setAppAssetPromiseUUID:fromConnection:completion:", v3, v6, a1[6]);
}

uint64_t sub_100079CAC(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void sub_100079E6C(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) interestedCoordinatorUUIDs];
  unsigned __int8 v3 = [v2 containsObject:*(void *)(a1 + 40)];

  if ((v3 & 1) == 0)
  {
    uint64_t v4 = sub_100004B28((uint64_t)off_100109BB8);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_FAULT)) {
      sub_100099750();
    }
  }
}

id sub_100079EF8(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "_remote_setInitialODRAssetPromiseUUIDs:completion:", *(void *)(a1 + 32), *(void *)(a1 + 40));
}

uint64_t sub_100079F04(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void sub_10007A0C4(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) interestedCoordinatorUUIDs];
  unsigned __int8 v3 = [v2 containsObject:*(void *)(a1 + 40)];

  if ((v3 & 1) == 0)
  {
    uint64_t v4 = sub_100004B28((uint64_t)off_100109BB8);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_FAULT)) {
      sub_1000997E8();
    }
  }
}

void sub_10007A150(void *a1, void *a2)
{
  uint64_t v3 = a1[4];
  uint64_t v4 = (void *)a1[5];
  id v5 = a2;
  id v6 = [v4 xpcConnection];
  objc_msgSend(v5, "_remote_setInstallOptionsPromiseUUID:forConnection:completion:", v3, v6, a1[6]);
}

uint64_t sub_10007A1C8(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void sub_10007A36C(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) interestedCoordinatorUUIDs];
  unsigned __int8 v3 = [v2 containsObject:*(void *)(a1 + 40)];

  if ((v3 & 1) == 0)
  {
    uint64_t v4 = sub_100004B28((uint64_t)off_100109BB8);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_FAULT)) {
      sub_100099880();
    }
  }
}

id sub_10007A3F8(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "_remote_setIsPaused:completion:", *(unsigned __int8 *)(a1 + 40), *(void *)(a1 + 32));
}

uint64_t sub_10007A408(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void sub_10007A5C8(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) interestedCoordinatorUUIDs];
  unsigned __int8 v3 = [v2 containsObject:*(void *)(a1 + 40)];

  if ((v3 & 1) == 0)
  {
    uint64_t v4 = sub_100004B28((uint64_t)off_100109BB8);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_FAULT)) {
      sub_100099918();
    }
  }
}

id sub_10007A654(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "_remote_setPlaceholderPromiseUUID:completion:", *(void *)(a1 + 32), *(void *)(a1 + 40));
}

uint64_t sub_10007A660(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void sub_10007A820(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) interestedCoordinatorUUIDs];
  unsigned __int8 v3 = [v2 containsObject:*(void *)(a1 + 40)];

  if ((v3 & 1) == 0)
  {
    uint64_t v4 = sub_100004B28((uint64_t)off_100109BB8);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_FAULT)) {
      sub_1000999B0();
    }
  }
}

id sub_10007A8AC(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "_remote_setPreparationPromiseUUID:completion:", *(void *)(a1 + 32), *(void *)(a1 + 40));
}

uint64_t sub_10007A8B8(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void sub_10007AA78(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) interestedCoordinatorUUIDs];
  unsigned __int8 v3 = [v2 containsObject:*(void *)(a1 + 40)];

  if ((v3 & 1) == 0)
  {
    uint64_t v4 = sub_100004B28((uint64_t)off_100109BB8);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_FAULT)) {
      sub_100099A48();
    }
  }
}

id sub_10007AB04(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "_remote_setUserDataPromiseUUID:completion:", *(void *)(a1 + 32), *(void *)(a1 + 40));
}

uint64_t sub_10007AB10(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void sub_10007ACD0(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) interestedCoordinatorUUIDs];
  unsigned __int8 v3 = [v2 containsObject:*(void *)(a1 + 40)];

  if ((v3 & 1) == 0)
  {
    uint64_t v4 = sub_100004B28((uint64_t)off_100109BB8);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_FAULT)) {
      sub_100099AE0();
    }
  }
}

id sub_10007AD5C(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "_remote_setDeviceSecurityPromiseUUID:completion:", *(void *)(a1 + 32), *(void *)(a1 + 40));
}

uint64_t sub_10007AD68(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void sub_10007AF04(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) interestedCoordinatorUUIDs];
  unsigned __int8 v3 = [v2 containsObject:*(void *)(a1 + 40)];

  if ((v3 & 1) == 0)
  {
    uint64_t v4 = sub_100004B28((uint64_t)off_100109BB8);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_FAULT)) {
      sub_100099B78();
    }
  }
}

id sub_10007AF90(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "_remote_getCoordinatorScopeWithCompletion:", *(void *)(a1 + 32));
}

uint64_t sub_10007AF9C(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void sub_10007B140(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) interestedCoordinatorUUIDs];
  unsigned __int8 v3 = [v2 containsObject:*(void *)(a1 + 40)];

  if ((v3 & 1) == 0)
  {
    uint64_t v4 = sub_100004B28((uint64_t)off_100109BB8);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_FAULT)) {
      sub_100099C10();
    }
  }
}

id sub_10007B1CC(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "_remote_convertToGloballyScopedWithCompletion:", *(void *)(a1 + 32));
}

uint64_t sub_10007B1D8(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void sub_10007B450(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) interestedCoordinatorUUIDs];
  unsigned __int8 v3 = [v2 containsObject:*(void *)(a1 + 40)];

  if ((v3 & 1) == 0)
  {
    uint64_t v4 = sub_100004B28((uint64_t)off_100109BB8);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_FAULT)) {
      sub_100099D38();
    }
  }
}

id sub_10007B4DC(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "_remote_setPlaceholderDisposition:completion:", *(void *)(a1 + 40), *(void *)(a1 + 32));
}

uint64_t sub_10007B4E8(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void sub_10007B684(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) interestedCoordinatorUUIDs];
  unsigned __int8 v3 = [v2 containsObject:*(void *)(a1 + 40)];

  if ((v3 & 1) == 0)
  {
    uint64_t v4 = sub_100004B28((uint64_t)off_100109BB8);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_FAULT)) {
      sub_100099DD0();
    }
  }
}

id sub_10007B710(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "_remote_getPlaceholderDispositionWithCompletion:", *(void *)(a1 + 32));
}

uint64_t sub_10007B71C(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void sub_10007B8E4(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) interestedCoordinatorUUIDs];
  unsigned __int8 v3 = [v2 containsObject:*(void *)(a1 + 40)];

  if ((v3 & 1) == 0)
  {
    uint64_t v4 = sub_100004B28((uint64_t)off_100109BB8);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_FAULT)) {
      sub_100099E68();
    }
  }
}

id sub_10007B970(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "_remote_setProgressHint:completion:", *(void *)(a1 + 32), *(void *)(a1 + 40));
}

uint64_t sub_10007B97C(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void sub_10007BB18(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) interestedCoordinatorUUIDs];
  unsigned __int8 v3 = [v2 containsObject:*(void *)(a1 + 40)];

  if ((v3 & 1) == 0)
  {
    uint64_t v4 = sub_100004B28((uint64_t)off_100109BB8);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_FAULT)) {
      sub_100099F00();
    }
  }
}

id sub_10007BBA4(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "_remote_getProgressHintWithCompletion:", *(void *)(a1 + 32));
}

uint64_t sub_10007BBB0(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void sub_10007BD68(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) interestedCoordinatorUUIDs];
  unsigned __int8 v3 = [v2 containsObject:*(void *)(a1 + 40)];

  if ((v3 & 1) == 0)
  {
    uint64_t v4 = sub_100004B28((uint64_t)off_100109BB8);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_FAULT)) {
      sub_100099F98();
    }
  }
}

id sub_10007BDF4(void *a1, void *a2)
{
  return objc_msgSend(a2, "_remote_setRemovability:byClient:completion:", a1[5], a1[6], a1[4]);
}

uint64_t sub_10007BE04(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void sub_10007BFA0(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) interestedCoordinatorUUIDs];
  unsigned __int8 v3 = [v2 containsObject:*(void *)(a1 + 40)];

  if ((v3 & 1) == 0)
  {
    uint64_t v4 = sub_100004B28((uint64_t)off_100109BB8);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_FAULT)) {
      sub_10009A030();
    }
  }
}

id sub_10007C02C(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "_remote_removabilityWithCompletion:", *(void *)(a1 + 32));
}

uint64_t sub_10007C038(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

id sub_10007C368(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "_remote_getPercentComplete:", *(void *)(a1 + 32));
}

uint64_t sub_10007C374(uint64_t a1)
{
  return (*(uint64_t (**)(double))(*(void *)(a1 + 32) + 16))(0.0);
}

id sub_10007C404(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "_remote_setPercentComplete:", *(double *)(a1 + 32));
}

id sub_10007C518(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "_remote_getIsComplete:", *(void *)(a1 + 32));
}

uint64_t sub_10007C524(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void *sub_10007C648(void *result, void *a2)
{
  if (*((unsigned char *)result + 40)) {
    return objc_msgSend(a2, "_remote_setIsComplete:", result[4]);
  }
  return result;
}

uint64_t sub_10007C660(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

id sub_10007C7A8(void *a1, void *a2)
{
  return objc_msgSend(a2, "_remote_cancelForReason:client:completion:", a1[4], a1[6], a1[5]);
}

uint64_t sub_10007C7B8(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

id sub_10007C8CC(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "_remote_resetWithCompletion:", *(void *)(a1 + 32));
}

uint64_t sub_10007C8D8(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

id sub_10007C9EC(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "_remote_getErrorInfo:", *(void *)(a1 + 32));
}

uint64_t sub_10007C9F8(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

id sub_10007CB14(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "_remote_preflightWithCompletion:", *(void *)(a1 + 32));
}

uint64_t sub_10007CB20(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

id sub_10007CDF8(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "_remote_setStagedPath:", *(void *)(a1 + 32));
}

id sub_10007CF0C(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "_remote_getStagedPath:", *(void *)(a1 + 32));
}

uint64_t sub_10007CF18(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

id sub_10007D058(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "_remote_setTargetLastPathComponent:withCompletion:", *(void *)(a1 + 32), *(void *)(a1 + 40));
}

uint64_t sub_10007D064(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

id sub_10007D178(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "_remote_getTargetLastPathComponent:", *(void *)(a1 + 32));
}

uint64_t sub_10007D184(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void sub_10007D4D8(void *a1, void *a2)
{
  uint64_t v3 = a1[4];
  uint64_t v4 = (void *)a1[5];
  id v5 = a2;
  id v6 = [v4 xpcConnection];
  objc_msgSend(v5, "_remote_setMetadataPromiseUUID:fromConnection:completion:", v3, v6, a1[6]);
}

uint64_t sub_10007D550(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

id sub_10007D664(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "_remote_getMetadataWithCompletion:", *(void *)(a1 + 32));
}

uint64_t sub_10007D670(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

id sub_10007D7B0(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "_remote_setSinfPromiseUUID:completion:", *(void *)(a1 + 32), *(void *)(a1 + 40));
}

uint64_t sub_10007D7BC(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

id sub_10007D8D0(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "_remote_getSinfDataWithCompletion:", *(void *)(a1 + 32));
}

uint64_t sub_10007D8DC(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

id sub_10007DA00(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "_remote_setLaunchProhibited:completion:", *(unsigned __int8 *)(a1 + 40), *(void *)(a1 + 32));
}

uint64_t sub_10007DA10(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

id sub_10007DB24(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "_remote_getLaunchProhibitedWithCompletion:", *(void *)(a1 + 32));
}

uint64_t sub_10007DB30(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

id sub_10007DC70(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "_remote_setAttributes:completion:", *(void *)(a1 + 32), *(void *)(a1 + 40));
}

uint64_t sub_10007DC7C(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

id sub_10007DD90(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "_remote_getAttributesWithCompletion:", *(void *)(a1 + 32));
}

uint64_t sub_10007DD9C(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

id sub_10007DEDC(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "_remote_setIconPromiseUUID:completion:", *(void *)(a1 + 32), *(void *)(a1 + 40));
}

uint64_t sub_10007DEE8(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

id sub_10007DFFC(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "_remote_hasIconPromise:", *(void *)(a1 + 32));
}

uint64_t sub_10007E008(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void sub_10007E128(uint64_t a1, void *a2)
{
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_10007E1B8;
  v4[3] = &unk_1000EAF78;
  uint64_t v3 = *(void **)(a1 + 40);
  void v4[4] = *(void *)(a1 + 32);
  id v5 = v3;
  objc_msgSend(a2, "_remote_getIconPromise:", v4);
}

void sub_10007E1B8(uint64_t a1, void *a2, void *a3)
{
  id v8 = a2;
  id v5 = a3;
  if (v8)
  {
    id v6 = *(void **)(a1 + 32);
    id v7 = [v8 uniqueIdentifier];
    [v6 addInterestedPromiseUUID:v7];
  }
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

uint64_t sub_10007E258(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

id sub_10007E3C0(void *a1, void *a2)
{
  return objc_msgSend(a2, "_remote_setIconResourcesPromiseUUID:infoPlistIconContentPromiseUUID:completion:", a1[4], a1[5], a1[6]);
}

uint64_t sub_10007E3D0(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

id sub_10007E4E4(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "_remote_hasIconResourcesPromise:", *(void *)(a1 + 32));
}

uint64_t sub_10007E4F0(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

id sub_10007E60C(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "_remote_getIconResourcesPromiseAndInfoPlistContent:", *(void *)(a1 + 32));
}

uint64_t sub_10007E618(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

id sub_10007E75C(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "_remote_setLocalizationPromiseUUID:completion:", *(void *)(a1 + 32), *(void *)(a1 + 40));
}

uint64_t sub_10007E768(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

id sub_10007E87C(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "_remote_getLocalizationDictionary:", *(void *)(a1 + 32));
}

uint64_t sub_10007E888(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

id sub_10007E9C8(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "_remote_setEntitlementsPromiseUUID:completion:", *(void *)(a1 + 32), *(void *)(a1 + 40));
}

uint64_t sub_10007E9D4(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

id sub_10007EAE8(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "_remote_hasEntitlementsPromise:", *(void *)(a1 + 32));
}

uint64_t sub_10007EAF4(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void sub_10007EC14(uint64_t a1, void *a2)
{
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_10007ECA4;
  v4[3] = &unk_1000EAF78;
  uint64_t v3 = *(void **)(a1 + 40);
  void v4[4] = *(void *)(a1 + 32);
  id v5 = v3;
  objc_msgSend(a2, "_remote_getEntitlementsPromise:", v4);
}

void sub_10007ECA4(uint64_t a1, void *a2, void *a3)
{
  id v8 = a2;
  id v5 = a3;
  if (v8)
  {
    id v6 = *(void **)(a1 + 32);
    id v7 = [v8 uniqueIdentifier];
    [v6 addInterestedPromiseUUID:v7];
  }
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

uint64_t sub_10007ED44(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

id sub_10007EE84(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "_remote_setInfoPlistLoctablePromiseUUID:completion:", *(void *)(a1 + 32), *(void *)(a1 + 40));
}

uint64_t sub_10007EE90(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

id sub_10007EFA4(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "_remote_hasInfoPlistLoctablePromise:", *(void *)(a1 + 32));
}

uint64_t sub_10007EFB0(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void sub_10007F0D0(uint64_t a1, void *a2)
{
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_10007F160;
  v4[3] = &unk_1000EAF78;
  uint64_t v3 = *(void **)(a1 + 40);
  void v4[4] = *(void *)(a1 + 32);
  id v5 = v3;
  objc_msgSend(a2, "_remote_getInfoPlistLoctablePromise:", v4);
}

void sub_10007F160(uint64_t a1, void *a2, void *a3)
{
  id v8 = a2;
  id v5 = a3;
  if (v8)
  {
    id v6 = *(void **)(a1 + 32);
    id v7 = [v8 uniqueIdentifier];
    [v6 addInterestedPromiseUUID:v7];
  }
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

uint64_t sub_10007F200(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

id sub_10007F340(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "_remote_setAppExtensionPlaceholderPromiseUUIDs:completion:", *(void *)(a1 + 32), *(void *)(a1 + 40));
}

uint64_t sub_10007F34C(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

id sub_10007F460(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "_remote_hasAppExtensionPlaceholderPromises:", *(void *)(a1 + 32));
}

uint64_t sub_10007F46C(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void sub_10007F58C(uint64_t a1, void *a2)
{
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_10007F61C;
  v4[3] = &unk_1000EAFA0;
  uint64_t v3 = *(void **)(a1 + 40);
  void v4[4] = *(void *)(a1 + 32);
  id v5 = v3;
  objc_msgSend(a2, "_remote_getAppExtensionPlaceholderPromises:", v4);
}

void sub_10007F61C(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v7 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v14;
    do
    {
      __int16 v10 = 0;
      do
      {
        if (*(void *)v14 != v9) {
          objc_enumerationMutation(v5);
        }
        uint64_t v11 = *(void **)(a1 + 32);
        uint64_t v12 = [*(id *)(*((void *)&v13 + 1) + 8 * (void)v10) uniqueIdentifier];
        [v11 addInterestedPromiseUUID:v12];

        __int16 v10 = (char *)v10 + 1;
      }
      while (v8 != v10);
      id v8 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v8);
  }
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

uint64_t sub_10007F760(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

id sub_10007F87C(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "_remote_setConfigurationCompleteWithCompletion:", *(void *)(a1 + 32));
}

uint64_t sub_10007F888(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

id sub_10007FB60(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "_remote_setTransferPath:", *(void *)(a1 + 32));
}

id sub_10007FBEC(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "_remote_setShouldCopy:", *(unsigned __int8 *)(a1 + 32));
}

id sub_10007FC78(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "_remote_setTryDeltaCopy:", *(unsigned __int8 *)(a1 + 32));
}

id sub_10007FF18(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "_remote_setArchiveBytesConsumed:", *(void *)(a1 + 32));
}

id sub_1000801B8(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "_remote_setArchiveBytesConsumed:", *(void *)(a1 + 32));
}

void sub_1000803B8(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = sub_100004B28((uint64_t)off_100109BB8);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    id v5 = [*(id *)(a1 + 32) clientName];
    int v6 = 136315650;
    id v7 = "-[IXSClientConnection _client_coordinatorDidRegisterForObservationWithUUID:]_block_invoke";
    __int16 v8 = 2112;
    uint64_t v9 = v5;
    __int16 v10 = 2112;
    id v11 = v3;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "%s: Failed to message client %@ : %@", (uint8_t *)&v6, 0x20u);
  }
}

void sub_10008069C(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = sub_100004B28((uint64_t)off_100109BB8);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    id v5 = [*(id *)(a1 + 32) clientName];
    int v6 = 136315650;
    id v7 = "-[IXSClientConnection _client_coordinatorShouldPrioritizeWithUUID:]_block_invoke";
    __int16 v8 = 2112;
    uint64_t v9 = v5;
    __int16 v10 = 2112;
    id v11 = v3;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "%s: Failed to message client %@ : %@", (uint8_t *)&v6, 0x20u);
  }
}

void sub_100080980(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = sub_100004B28((uint64_t)off_100109BB8);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    id v5 = [*(id *)(a1 + 32) clientName];
    int v6 = 136315650;
    id v7 = "-[IXSClientConnection _client_coordinatorShouldResumeWithUUID:]_block_invoke";
    __int16 v8 = 2112;
    uint64_t v9 = v5;
    __int16 v10 = 2112;
    id v11 = v3;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "%s: Failed to message client %@ : %@", (uint8_t *)&v6, 0x20u);
  }
}

void sub_100080C64(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = sub_100004B28((uint64_t)off_100109BB8);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    id v5 = [*(id *)(a1 + 32) clientName];
    int v6 = 136315650;
    id v7 = "-[IXSClientConnection _client_coordinatorShouldPauseWithUUID:]_block_invoke";
    __int16 v8 = 2112;
    uint64_t v9 = v5;
    __int16 v10 = 2112;
    id v11 = v3;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "%s: Failed to message client %@ : %@", (uint8_t *)&v6, 0x20u);
  }
}

void sub_100080F58(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = sub_100004B28((uint64_t)off_100109BB8);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    id v5 = [*(id *)(a1 + 32) clientName];
    int v6 = 136315650;
    id v7 = "-[IXSClientConnection _client_coordinatorWithUUID:configuredPromiseDidBeginFulfillment:]_block_invoke";
    __int16 v8 = 2112;
    uint64_t v9 = v5;
    __int16 v10 = 2112;
    id v11 = v3;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "%s: Failed to message client %@ : %@", (uint8_t *)&v6, 0x20u);
  }
}

void sub_10008123C(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = sub_100004B28((uint64_t)off_100109BB8);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    id v5 = [*(id *)(a1 + 32) clientName];
    int v6 = 136315650;
    id v7 = "-[IXSClientConnection _client_coordinatorShouldBeginRestoringUserDataWithUUID:]_block_invoke";
    __int16 v8 = 2112;
    uint64_t v9 = v5;
    __int16 v10 = 2112;
    id v11 = v3;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "%s: Failed to message client %@ : %@", (uint8_t *)&v6, 0x20u);
  }
}

void sub_10008153C(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = sub_100004B28((uint64_t)off_100109BB8);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    id v5 = [*(id *)(a1 + 32) clientName];
    int v6 = 136315650;
    id v7 = "-[IXSClientConnection _client_coordinatorShouldBeginPostProcessingWithUUID:forRecordPromise:]_block_invoke";
    __int16 v8 = 2112;
    uint64_t v9 = v5;
    __int16 v10 = 2112;
    id v11 = v3;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "%s: Failed to message client %@ : %@", (uint8_t *)&v6, 0x20u);
  }
}

void sub_10008183C(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = sub_100004B28((uint64_t)off_100109BB8);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    id v5 = [*(id *)(a1 + 32) clientName];
    int v6 = 136315650;
    id v7 = "-[IXSClientConnection _client_coordinatorDidInstallPlaceholderWithUUID:forRecordPromise:]_block_invoke";
    __int16 v8 = 2112;
    uint64_t v9 = v5;
    __int16 v10 = 2112;
    id v11 = v3;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "%s: Failed to message client %@ : %@", (uint8_t *)&v6, 0x20u);
  }
}

void sub_100081B3C(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = sub_100004B28((uint64_t)off_100109BB8);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    id v5 = [*(id *)(a1 + 32) clientName];
    int v6 = 136315650;
    id v7 = "-[IXSClientConnection _client_coordinatorDidCompleteSuccessfullyWithUUID:forRecordPromise:]_block_invoke";
    __int16 v8 = 2112;
    uint64_t v9 = v5;
    __int16 v10 = 2112;
    id v11 = v3;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "%s: Failed to message client %@ : %@", (uint8_t *)&v6, 0x20u);
  }
}

void sub_100081E44(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = sub_100004B28((uint64_t)off_100109BB8);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    id v5 = [*(id *)(a1 + 32) clientName];
    int v6 = 136315650;
    id v7 = "-[IXSClientConnection _client_coordinatorWithUUID:didCancelWithReason:client:]_block_invoke";
    __int16 v8 = 2112;
    uint64_t v9 = v5;
    __int16 v10 = 2112;
    id v11 = v3;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "%s: Failed to message client %@ : %@", (uint8_t *)&v6, 0x20u);
  }
}

void sub_100082150(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = sub_100004B28((uint64_t)off_100109BB8);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    id v5 = [*(id *)(a1 + 32) clientName];
    int v6 = 136315650;
    id v7 = "-[IXSClientConnection _client_coordinatorWithUUID:didUpdateProgress:forPhase:overallProgress:]_block_invoke";
    __int16 v8 = 2112;
    uint64_t v9 = v5;
    __int16 v10 = 2112;
    id v11 = v3;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "%s: Failed to message client %@ : %@", (uint8_t *)&v6, 0x20u);
  }
}

void sub_100082434(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = sub_100004B28((uint64_t)off_100109BB8);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    id v5 = [*(id *)(a1 + 32) clientName];
    int v6 = 136315650;
    id v7 = "-[IXSClientConnection _client_promiseDidCompleteSuccessfullyWithUUID:]_block_invoke";
    __int16 v8 = 2112;
    uint64_t v9 = v5;
    __int16 v10 = 2112;
    id v11 = v3;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "%s: Failed to message client %@ : %@", (uint8_t *)&v6, 0x20u);
  }
}

void sub_10008273C(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = sub_100004B28((uint64_t)off_100109BB8);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    id v5 = [*(id *)(a1 + 32) clientName];
    int v6 = 136315650;
    id v7 = "-[IXSClientConnection _client_promiseWithUUID:didCancelWithReason:client:]_block_invoke";
    __int16 v8 = 2112;
    uint64_t v9 = v5;
    __int16 v10 = 2112;
    id v11 = v3;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "%s: Failed to message client %@ : %@", (uint8_t *)&v6, 0x20u);
  }
}

void sub_100082954(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_fault_impl(a1, v9, OS_LOG_TYPE_FAULT, a4, &a9, 0x2Au);
}

uint64_t sub_1000829E8@<X0>(uint64_t result@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  *(void *)(a2 + 4) = a3;
  *(_WORD *)(a2 + 12) = 2112;
  *(void *)(a2 + 14) = result;
  *(_WORD *)(a2 + 22) = 2112;
  *(void *)(a2 + 24) = 0;
  return result;
}

id sub_100082A1C()
{
  return [v0 creatorIdentifier];
}

void sub_100082A34(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, a5, 0x34u);
}

id sub_100082A4C(void *a1)
{
  id v1 = a1;
  if (v1)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v2 = v1;
    }
    else
    {
      id v2 = [v1 description];
    }
    id v3 = v2;
  }
  else
  {
    id v3 = 0;
  }

  return v3;
}

uint64_t sub_100082AC8(void *a1)
{
  id v1 = a1;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    uint64_t v2 = sub_100082B2C(v1);
  }
  else {
    uint64_t v2 = 0;
  }

  return v2;
}

uint64_t sub_100082B2C(void *a1)
{
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  id v1 = a1;
  uint64_t v2 = (char *)[v1 countByEnumeratingWithState:&v8 objects:v12 count:16];
  if (v2)
  {
    id v3 = v2;
    uint64_t v4 = *(void *)v9;
    while (2)
    {
      uint64_t v5 = 0;
      do
      {
        if (*(void *)v9 != v4) {
          objc_enumerationMutation(v1);
        }
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          uint64_t v6 = 0;
          goto LABEL_11;
        }
        ++v5;
      }
      while (v3 != v5);
      id v3 = (char *)[v1 countByEnumeratingWithState:&v8 objects:v12 count:16];
      if (v3) {
        continue;
      }
      break;
    }
  }
  uint64_t v6 = 1;
LABEL_11:

  return v6;
}

uint64_t sub_100082C38(void *a1)
{
  id v1 = a1;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    uint64_t v2 = sub_100082B2C(v1);
  }
  else {
    uint64_t v2 = 0;
  }

  return v2;
}

uint64_t sub_100082C9C(void *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  id v9 = a1;
  uint64_t v13 = 0;
  long long v14 = &v13;
  uint64_t v15 = 0x2020000000;
  char v16 = 1;
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_100082DD8;
  v12[3] = &unk_1000EB3E8;
  void v12[4] = &v13;
  v12[5] = a2;
  v12[6] = a3;
  v12[7] = objc_opt_class();
  v12[8] = a4;
  v12[9] = a5;
  v12[10] = objc_opt_class();
  v12[11] = objc_opt_class();
  [v9 enumerateKeysAndObjectsUsingBlock:v12];
  uint64_t v10 = *((unsigned __int8 *)v14 + 24);
  _Block_object_dispose(&v13, 8);

  return v10;
}

void sub_100082DB8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_100082DD8(void *a1, uint64_t a2, void *a3, unsigned char *a4)
{
  id v8 = a3;
  if (objc_opt_isKindOfClass() & 1) != 0 && (objc_opt_isKindOfClass())
  {
    uint64_t v6 = a1[6];
    if (v6 == a1[7])
    {
      char v7 = sub_100082C9C(v8, a1[8], a1[9], 0, 0);
    }
    else if (v6 == a1[10])
    {
      char v7 = sub_100082AC8(v8);
    }
    else
    {
      if (v6 != a1[11]) {
        goto LABEL_11;
      }
      char v7 = sub_100082C38(v8);
    }
    *(unsigned char *)(*(void *)(a1[4] + 8) + 24) = v7;
  }
  else
  {
    *(unsigned char *)(*(void *)(a1[4] + 8) + 24) = 0;
  }
LABEL_11:
  if (!*(unsigned char *)(*(void *)(a1[4] + 8) + 24)) {
    *a4 = 1;
  }
}

uint64_t sub_100082ED8(void *a1, uint64_t a2, uint64_t a3)
{
  return sub_100082C9C(a1, a2, a3, 0, 0);
}

BOOL sub_100082EE4(void *a1)
{
  id v1 = a1;
  objc_opt_class();
  BOOL v2 = (objc_opt_isKindOfClass() & 1) != 0 && CFPropertyListIsValid(v1, kCFPropertyListBinaryFormat_v1_0) == 1;

  return v2;
}

id sub_100082F48(void *a1, id a2)
{
  id v3 = a1;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    a2 = [v3 BOOLValue];
  }

  return a2;
}

id sub_100082FA0(void *a1)
{
  id v1 = a1;
  if (v1)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      if (sub_100082AC8(v1))
      {
        id v2 = v1;
LABEL_7:
        id v3 = v2;
        goto LABEL_12;
      }
    }
    else
    {
      if (objc_opt_isKindOfClass())
      {
        id v6 = v1;
        id v2 = +[NSArray arrayWithObjects:&v6 count:1];
        goto LABEL_7;
      }
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        uint64_t v4 = [v1 allObjects];
        if (sub_100082AC8(v4)) {
          id v3 = v4;
        }
        else {
          id v3 = 0;
        }

        goto LABEL_12;
      }
    }
  }
  id v3 = 0;
LABEL_12:

  return v3;
}

id sub_1000830D8(void *a1)
{
  id v1 = a1;
  id v2 = v1;
  if (v1)
  {
    id v3 = +[NSMutableArray arrayWithCapacity:](NSMutableArray, "arrayWithCapacity:", [v1 count]);
    long long v12 = 0u;
    long long v13 = 0u;
    long long v14 = 0u;
    long long v15 = 0u;
    id v4 = v2;
    id v5 = [v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
    if (v5)
    {
      id v6 = v5;
      uint64_t v7 = *(void *)v13;
      do
      {
        for (i = 0; i != v6; i = (char *)i + 1)
        {
          if (*(void *)v13 != v7) {
            objc_enumerationMutation(v4);
          }
          uint64_t v9 = *(void *)(*((void *)&v12 + 1) + 8 * i);
          if (objc_opt_isKindOfClass()) {
            objc_msgSend(v3, "addObject:", v9, (void)v12);
          }
        }
        id v6 = [v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
      }
      while (v6);
    }

    id v10 = [v3 copy];
  }
  else
  {
    id v10 = 0;
  }

  return v10;
}

id sub_10008324C(void *a1, uint64_t a2, uint64_t a3)
{
  if (a1)
  {
    id v5 = a1;
    +[NSMutableDictionary dictionaryWithCapacity:](NSMutableDictionary, "dictionaryWithCapacity:", [v5 count]);
    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3221225472;
    v9[2] = sub_100083340;
    v9[3] = &unk_1000EB410;
    uint64_t v11 = a2;
    uint64_t v12 = a3;
    id v10 = (id)objc_claimAutoreleasedReturnValue();
    id v6 = v10;
    [v5 enumerateKeysAndObjectsUsingBlock:v9];

    id v7 = [v6 copy];
  }
  else
  {
    id v7 = 0;
  }

  return v7;
}

void sub_100083340(uint64_t a1, void *a2, void *a3)
{
  id v8 = a2;
  id v5 = a3;
  if (*(void *)(a1 + 40)) {
    int v6 = objc_opt_isKindOfClass() ^ 1;
  }
  else {
    int v6 = 0;
  }
  if (*(void *)(a1 + 48)) {
    int v7 = objc_opt_isKindOfClass() ^ 1;
  }
  else {
    int v7 = 0;
  }
  if (((v6 | v7) & 1) == 0) {
    [*(id *)(a1 + 32) setObject:v5 forKeyedSubscript:v8];
  }
}

uint64_t sub_10008348C()
{
  qword_100109FC8 = (uint64_t)objc_alloc_init((Class)objc_opt_class());

  return _objc_release_x1();
}

void sub_100083620(uint64_t a1)
{
  if (!*(void *)(a1 + 40) || *(unsigned char *)(a1 + 48))
  {
    id v2 = *(void **)(a1 + 32);
    id v9 = 0;
    unsigned __int8 v3 = objc_msgSend(v2, "_onQueue_writeRemovabilityWithError:", &v9);
    id v4 = v9;
    int v5 = *(unsigned __int8 *)(a1 + 48);
    if (v3)
    {
      if (*(unsigned char *)(a1 + 48))
      {
        int v6 = sub_100004B28((uint64_t)off_100109BB8);
        if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 136315138;
          uint64_t v11 = "-[IXSAppRemovabilityManager init]_block_invoke";
          _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "%s: Successfully migrated legacy removability plist to the new format with change clock", buf, 0xCu);
        }

        objc_msgSend(*(id *)(a1 + 32), "_onQueue_removeLegacyRemovabilityFiles");
      }
    }
    else
    {
      int v7 = sub_100004B28((uint64_t)off_100109BB8);
      BOOL v8 = os_log_type_enabled(v7, OS_LOG_TYPE_ERROR);
      if (v5)
      {
        if (v8) {
          sub_10009A13C();
        }
      }
      else if (v8)
      {
        sub_10009A0C8();
      }
    }
  }
}

void sub_100083B58(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t sub_100083B70(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void sub_100083B80(uint64_t a1)
{
}

void sub_100083B88(uint64_t a1)
{
  id v5 = [*(id *)(a1 + 32) allAppRemovability];
  uint64_t v2 = sub_100035F24(v5, *(void *)(a1 + 40), 1, 1);
  uint64_t v3 = *(void *)(*(void *)(a1 + 48) + 8);
  id v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;
}

void sub_100083CF4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_100083D0C(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) allAppRemovability];
  *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = sub_100035FD8(v2, *(void *)(a1 + 40), (id)1, *(void *)(a1 + 56));
}

void sub_100084090(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 144), 8);
  _Block_object_dispose((const void *)(v1 - 96), 8);
  _Unwind_Resume(a1);
}

void sub_1000840BC(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) allAppRemovability];
  id v3 = sub_100035FD8(v2, *(void *)(a1 + 40), (id)1, *(void *)(a1 + 64));

  if (*(id *)(a1 + 72) == v3)
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = 1;
  }
  else
  {
    id v4 = [*(id *)(a1 + 32) allAppRemovability];
    id v5 = [v4 objectForKeyedSubscript:*(void *)(a1 + 40)];

    if (v5)
    {
      [v5 updateRemovability:*(void *)(a1 + 72) forClient:*(void *)(a1 + 64)];
      if ([v5 isEmpty])
      {

        id v5 = 0;
      }
      int v6 = [*(id *)(a1 + 32) allAppRemovability];
      [v6 setObject:v5 forKeyedSubscript:*(void *)(a1 + 40)];
    }
    int v7 = *(void **)(a1 + 32);
    uint64_t v8 = *(void *)(*(void *)(a1 + 56) + 8);
    id obj = *(id *)(v8 + 40);
    unsigned __int8 v9 = objc_msgSend(v7, "_onQueue_writeRemovabilityWithError:", &obj);
    objc_storeStrong((id *)(v8 + 40), obj);
    *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = v9;
    if (*(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24)) {
      objc_msgSend(*(id *)(a1 + 32), "_onQueue_handleStateChangeForIdentity:updatedRemovability:", *(void *)(a1 + 40), *(void *)(a1 + 72));
    }
  }
}

void sub_1000841F4(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) allAppRemovability];
  id v3 = sub_100035FD8(v2, *(void *)(a1 + 40), 0, *(void *)(a1 + 64));

  if (*(id *)(a1 + 72) == v3)
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = 1;
  }
  else
  {
    id v4 = [*(id *)(a1 + 32) allAppRemovability];
    id v5 = [v4 objectForKeyedSubscript:*(void *)(a1 + 40)];

    if (v5)
    {
      [(IXAppRemovabilityMetadataList *)v5 updateRemovability:*(void *)(a1 + 72) forClient:*(void *)(a1 + 64)];
    }
    else
    {
      id v5 = [[IXAppRemovabilityMetadataList alloc] initWithInitialRemovability:*(void *)(a1 + 72) client:*(void *)(a1 + 64)];
      int v6 = [*(id *)(a1 + 32) allAppRemovability];
      [v6 setObject:v5 forKeyedSubscript:*(void *)(a1 + 40)];
    }
    int v7 = *(void **)(a1 + 32);
    uint64_t v8 = *(void *)(*(void *)(a1 + 56) + 8);
    id obj = *(id *)(v8 + 40);
    unsigned __int8 v9 = objc_msgSend(v7, "_onQueue_writeRemovabilityWithError:", &obj);
    objc_storeStrong((id *)(v8 + 40), obj);
    *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = v9;
    if (*(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24)) {
      objc_msgSend(*(id *)(a1 + 32), "_onQueue_handleStateChangeForIdentity:updatedRemovability:", *(void *)(a1 + 40), *(void *)(a1 + 72));
    }
  }
}

void sub_1000847E0(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) allAppRemovability];
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472;
  v3[2] = sub_100084880;
  v3[3] = &unk_1000EB4B0;
  id v4 = *(id *)(a1 + 40);
  [v2 enumerateKeysAndObjectsUsingBlock:v3];
}

uint64_t sub_100084880(uint64_t a1, uint64_t a2, uint64_t a3, unsigned char *a4)
{
  uint64_t result = (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
  *a4 = result ^ 1;
  return result;
}

uint64_t sub_100084974(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  int v6 = [a3 description];
  int v7 = *(void **)(a1 + 32);
  uint64_t v8 = [v5 description];

  [v7 setObject:v6 forKeyedSubscript:v8];
  return 1;
}

void sub_100084B70(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_100084B8C(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) allAppRemovability];
  id v3 = [v2 copy];

  id v4 = objc_opt_new();
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id v5 = v3;
  id v6 = [v5 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v17;
    while (2)
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(void *)v17 != v8) {
          objc_enumerationMutation(v5);
        }
        id v10 = *(void **)(*((void *)&v16 + 1) + 8 * i);
        uint64_t v11 = [v10 bundleID];
        uint64_t v12 = [*(id *)(a1 + 40) bundleID];
        unsigned int v13 = [v11 isEqualToString:v12];

        if (v13)
        {
          [v4 addObject:v10];
          goto LABEL_11;
        }
      }
      id v7 = [v5 countByEnumeratingWithState:&v16 objects:v20 count:16];
      if (v7) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  void v15[2] = sub_100084DD8;
  v15[3] = &unk_1000EB500;
  void v15[4] = *(void *)(a1 + 32);
  [v4 enumerateObjectsUsingBlock:v15];
  if (objc_msgSend(*(id *)(a1 + 32), "_onQueue_writeRemovabilityWithError:", 0))
  {
    v14[0] = _NSConcreteStackBlock;
    v14[1] = 3221225472;
    v14[2] = sub_100084ED4;
    v14[3] = &unk_1000EB500;
    v14[4] = *(void *)(a1 + 32);
    [v4 enumerateObjectsUsingBlock:v14];
  }
  if ([v4 count]) {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = 1;
  }
}

void sub_100084DD8(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  id v6 = a2;
  id v7 = sub_100004B28((uint64_t)off_100109BB8);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    int v9 = 136315394;
    id v10 = "-[IXSAppRemovabilityManager clearRemovabilityStateForIdentity:error:]_block_invoke_2";
    __int16 v11 = 2112;
    id v12 = v6;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "%s: Clearing removability for identity %@", (uint8_t *)&v9, 0x16u);
  }

  uint64_t v8 = [*(id *)(a1 + 32) allAppRemovability];
  [v8 removeObjectForKey:v6];

  *a4 = 0;
}

id sub_100084ED4(uint64_t a1, uint64_t a2, uint64_t a3, unsigned char *a4)
{
  id result = objc_msgSend(*(id *)(a1 + 32), "_onQueue_handleStateChangeForIdentity:updatedRemovability:", a2, 1);
  *a4 = 0;
  return result;
}

void sub_100085078(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v9 - 96), 8);
  _Unwind_Resume(a1);
}

void sub_10008509C(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) removabilityChangeClock];
  id v3 = [v2 copy];
  uint64_t v4 = *(void *)(*(void *)(a1 + 40) + 8);
  id v5 = *(void **)(v4 + 40);
  *(void *)(v4 + 40) = v3;

  id v9 = [*(id *)(a1 + 32) allAppRemovability];
  id v6 = [v9 copy];
  uint64_t v7 = *(void *)(*(void *)(a1 + 48) + 8);
  uint64_t v8 = *(void **)(v7 + 40);
  *(void *)(v7 + 40) = v6;
}

void sub_100085900(id a1, id a2)
{
}

void sub_100085918(id a1, id a2)
{
}

void sub_100085B84(uint64_t a1)
{
  *(unsigned char *)(*(void *)(a1 + 32) + 10) = 1;
  *(unsigned char *)(*(void *)(a1 + 32) + _Block_object_dispose(&STACK[0x2B0], 8) = 1;
}

id sub_100085DF0(uint64_t a1)
{
  id result = [*(id *)(a1 + 32) percentComplete];
  *(void *)(*(void *)(a1 + 32) + 72) = v3;
  *(unsigned char *)(*(void *)(a1 + 32) + _Block_object_dispose(&STACK[0x2B0], 8) = 1;
  return result;
}

id sub_1000862AC(uint64_t a1)
{
  return [*(id *)(a1 + 32) promiseDidReset:*(void *)(a1 + 40)];
}

id sub_100086688(uint64_t a1)
{
  return [*(id *)(a1 + 32) promise:*(void *)(a1 + 40) didCancelForReason:*(void *)(a1 + 48) client:*(void *)(a1 + 56)];
}

void sub_100086698(void *a1)
{
  id v2 = +[IXSAppInstallObserverManager sharedInstance];
  [v2 promise:a1[4] canceledWithReason:a1[5] client:a1[6]];
}

void sub_1000869E4(_Unwind_Exception *a1, int a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, long long buf)
{
  if (a2)
  {
    if (a2 == 2)
    {
      id v11 = objc_begin_catch(a1);
      id v12 = sub_100004B28((uint64_t)off_100109BB8);
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        LODWORD(buf) = 136315394;
        *(void *)((char *)&buf + 4) = "-[IXSDataPromise saveState]";
        WORD6(buf) = 2112;
        *(void *)((char *)&buf + 14) = v11;
        _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "%s: Failed to encode object: %@", (uint8_t *)&buf, 0x16u);
      }

      objc_end_catch();
      JUMPOUT(0x1000869B0);
    }
    objc_begin_catch(a1);
    objc_exception_rethrow();
  }
  _Unwind_Resume(a1);
}

id sub_100087114(uint64_t a1)
{
  return [*(id *)(a1 + 32) promiseDidComplete:*(void *)(a1 + 40)];
}

void sub_100087120(uint64_t a1)
{
  id v2 = +[IXSAppInstallObserverManager sharedInstance];
  [v2 promiseDidCompleteSuccessfully:*(void *)(a1 + 32)];
}

id sub_1000874C0(uint64_t a1)
{
  return [*(id *)(a1 + 32) promiseDidBegin:*(void *)(a1 + 40)];
}

id sub_1000874CC(uint64_t a1)
{
  return [*(id *)(a1 + 32) promise:*(void *)(a1 + 40) didUpdateProgress:*(double *)(a1 + 48)];
}

id sub_100087858(uint64_t a1)
{
  return [*(id *)(a1 + 32) promiseDidBegin:*(void *)(a1 + 40)];
}

id sub_100087864(uint64_t a1)
{
  return [*(id *)(a1 + 32) promise:*(void *)(a1 + 40) didUpdateProgress:*(double *)(a1 + 48)];
}

id sub_100087874(uint64_t a1)
{
  return [*(id *)(a1 + 32) promiseDidComplete:*(void *)(a1 + 40)];
}

void sub_100087CF0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id sub_100087D08(uint64_t a1)
{
  id result = [*(id *)(a1 + 32) percentComplete];
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = v3;
  return result;
}

id sub_100087DEC(uint64_t a1)
{
  return [*(id *)(a1 + 32) setPercentComplete:*(double *)(a1 + 40)];
}

void sub_100087EF0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id sub_100087F08(uint64_t a1)
{
  id result = [*(id *)(a1 + 32) isComplete];
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = (_BYTE)result;
  return result;
}

void sub_1000880A0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t sub_1000880B8(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void sub_1000880C8(uint64_t a1)
{
}

void sub_1000880D0(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) error];
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
  uint64_t v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;

  if (!*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40))
  {
    id v5 = *(void **)(a1 + 32);
    [v5 setComplete:1];
  }
}

void sub_10008829C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1000882B4(void *a1)
{
  uint64_t v2 = (void *)a1[4];
  uint64_t v3 = a1[5];
  uint64_t v4 = a1[7];
  id v8 = 0;
  unsigned __int8 v5 = [v2 cancelForReason:v3 client:v4 error:&v8];
  id v6 = v8;
  id v7 = v8;
  if ((v5 & 1) == 0) {
    objc_storeStrong((id *)(*(void *)(a1[6] + 8) + 40), v6);
  }
}

void sub_1000885A8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va1, a9);
  va_start(va, a9);
  uint64_t v10 = va_arg(va1, void);
  uint64_t v12 = va_arg(va1, void);
  uint64_t v13 = va_arg(va1, void);
  uint64_t v14 = va_arg(va1, void);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  _Unwind_Resume(a1);
}

id sub_1000885DC(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) error];
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
  uint64_t v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;

  id result = [*(id *)(a1 + 32) isComplete];
  *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = (_BYTE)result;
  if (!*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40)
    && !*(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24))
  {
    id v6 = *(void **)(a1 + 32);
    return [v6 reset];
  }
  return result;
}

void sub_1000887C8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va1, a9);
  va_start(va, a9);
  uint64_t v10 = va_arg(va1, void);
  uint64_t v12 = va_arg(va1, void);
  uint64_t v13 = va_arg(va1, void);
  uint64_t v14 = va_arg(va1, void);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  _Unwind_Resume(a1);
}

id sub_1000887EC(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) error];
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
  uint64_t v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;

  id result = [*(id *)(a1 + 32) errorSourceIdentifier];
  *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = result;
  return result;
}

void sub_100089060(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,char a33,uint64_t a34,uint64_t a35,uint64_t a36,char a37)
{
}

id sub_1000890D8(uint64_t a1)
{
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = [*(id *)(a1 + 32) totalBytesNeededOnDisk];
  id result = [*(id *)(a1 + 32) bytesConsumedOnDisk];
  *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = result;
  return result;
}

void sub_100089120(void *a1, void *a2)
{
  uint64_t v4 = [a2 objectForKeyedSubscript:@"CACHE_DELETE_AMOUNT"];
  id v5 = [v4 unsignedLongLongValue];

  unint64_t v6 = a1[6];
  id v7 = sub_100004B28((uint64_t)off_100109BB8);
  id v8 = v7;
  if ((unint64_t)v5 >= v6)
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v11 = a1[4];
      *(_DWORD *)buf = 136315650;
      uint64_t v13 = "-[IXSDataPromise(IXSDataPromiseIPCMethods) _remote_preflightWithCompletion:]_block_invoke";
      __int16 v14 = 2048;
      id v15 = v5;
      __int16 v16 = 2112;
      uint64_t v17 = v11;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "%s: %llu bytes purged, enough for promise %@.", buf, 0x20u);
    }

    (*(void (**)(void))(a1[5] + 16))();
  }
  else
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      sub_10009A71C(a1, (uint64_t)v5, v8);
    }

    uint64_t v10 = sub_10003DAE4((uint64_t)"-[IXSDataPromise(IXSDataPromiseIPCMethods) _remote_preflightWithCompletion:]_block_invoke", 758, @"IXUserPresentableErrorDomain", 0xBuLL, 0, 0, @"Not enough space for promise %@: %llu bytes needed, %llu bytes available (%llu bytes were purged).", v9, a1[4]);
    (*(void (**)(void))(a1[5] + 16))();
  }
}

id sub_1000892DC(void *a1, void *a2, void *a3)
{
  id v5 = a1;
  id v6 = a2;
  Unique = (__CFBundle *)_CFBundleCreateUnique();
  if (Unique)
  {
    id v8 = Unique;
    id v15 = 0;
    uint64_t v9 = sub_10008943C(Unique, v6, &v15);
    id v10 = v15;
    CFRelease(v8);
    if (!a3) {
      goto LABEL_9;
    }
    goto LABEL_7;
  }
  uint64_t v11 = sub_100004B28((uint64_t)off_100109BB8);
  if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
    sub_10009A7DC(v5);
  }

  uint64_t v12 = [v5 path];
  sub_10003DAE4((uint64_t)"LoadInfoPlistFromBundleAtURL", 24, @"IXErrorDomain", 0xAuLL, 0, 0, @"Failed to create CFBundle from %@", v13, (uint64_t)v12);
  id v10 = (id)objc_claimAutoreleasedReturnValue();

  uint64_t v9 = 0;
  if (a3)
  {
LABEL_7:
    if (!v9) {
      *a3 = v10;
    }
  }
LABEL_9:

  return v9;
}

id sub_10008943C(__CFBundle *a1, void *a2, void *a3)
{
  id v5 = a2;
  if (!v5)
  {
    id v8 = CFBundleGetInfoDictionary(a1);
    FilteredInfoPlist = v8;
    if (v8)
    {
      id v9 = [v8 mutableCopy];
      id v7 = v9;
      if (v9) {
        [v9 removeObjectForKey:@"CFBundleInfoPlistURL"];
      }
      goto LABEL_8;
    }
    __int16 v16 = sub_100004B28((uint64_t)off_100109BB8);
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
      sub_10009A86C();
    }

    sub_10003DAE4((uint64_t)"LoadInfoPlistFromBundle", 72, @"IXErrorDomain", 0xFuLL, 0, 0, @"CFBundleGetInfoDictionary returned NULL for bundle %@", v17, (uint64_t)a1);
    goto LABEL_18;
  }
  FilteredInfoPlist = (void *)_CFBundleCreateFilteredInfoPlist();
  if (!FilteredInfoPlist)
  {
    uint64_t v11 = sub_100004B28((uint64_t)off_100109BB8);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      sub_10009A8EC((uint64_t)v5, (uint64_t)a1, v11);
    }

    sub_10003DAE4((uint64_t)"LoadInfoPlistFromBundle", 55, @"IXErrorDomain", 0xFuLL, 0, 0, @"Failed to get filtered Info.plist with keys %@ from bundle %@", v12, (uint64_t)v5);
    id v10 = LABEL_18:;
LABEL_19:
    id v7 = 0;
    goto LABEL_20;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    uint64_t v13 = sub_100004B28((uint64_t)off_100109BB8);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
      sub_10009A98C((uint64_t)a1, (uint64_t)FilteredInfoPlist, v13);
    }

    __int16 v14 = (objc_class *)objc_opt_class();
    long long v19 = NSStringFromClass(v14);
    id v10 = sub_10003DAE4((uint64_t)"LoadInfoPlistFromBundle", 60, @"IXErrorDomain", 0x10uLL, 0, 0, @"Object returned from _CFBundleCreateFilteredInfoPlist for %@ was not a dictionary, was type %@", v15, (uint64_t)a1);

    goto LABEL_19;
  }
  id v7 = [FilteredInfoPlist mutableCopy];
LABEL_8:
  id v10 = 0;
LABEL_20:

  if (a3 && !v7) {
    *a3 = v10;
  }

  return v7;
}

id sub_1000896AC(void *a1, void *a2)
{
  id v3 = a1;
  id v26 = 0;
  uint64_t v4 = IXUrlsForItemsInDirectoryAtURL(v3, 1, &v26);
  id v5 = v26;
  if (!v4)
  {
LABEL_16:
    if (a2)
    {
      id v5 = v5;
      id v14 = 0;
      *a2 = v5;
    }
    else
    {
      id v14 = 0;
    }
    goto LABEL_19;
  }
  long long v20 = a2;
  long long v21 = v3;
  long long v24 = 0u;
  long long v25 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  id v6 = v4;
  id v7 = [v6 countByEnumeratingWithState:&v22 objects:v27 count:16];
  if (!v7)
  {
LABEL_10:

LABEL_13:
    uint64_t v15 = sub_100004B28((uint64_t)off_100109BB8);
    id v3 = v21;
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
      sub_10009AA5C(v21);
    }

    __int16 v16 = [v21 path];
    uint64_t v18 = sub_10003DAE4((uint64_t)"AppURLFromExtractedPayloadDir", 112, @"IXErrorDomain", 0xAuLL, 0, 0, @"Failed to find a \".app\" inside the extracted contents at %@", v17, (uint64_t)v16);

    id v5 = (id)v18;
    a2 = v20;
    goto LABEL_16;
  }
  id v8 = v7;
  uint64_t v9 = *(void *)v23;
LABEL_4:
  uint64_t v10 = 0;
  while (1)
  {
    if (*(void *)v23 != v9) {
      objc_enumerationMutation(v6);
    }
    uint64_t v11 = *(void **)(*((void *)&v22 + 1) + 8 * v10);
    uint64_t v12 = [v11 pathExtension];
    unsigned __int8 v13 = [v12 isEqualToString:@"app"];

    if (v13) {
      break;
    }
    if (v8 == (id)++v10)
    {
      id v8 = [v6 countByEnumeratingWithState:&v22 objects:v27 count:16];
      if (v8) {
        goto LABEL_4;
      }
      goto LABEL_10;
    }
  }
  id v14 = v11;

  if (!v14) {
    goto LABEL_13;
  }
  id v3 = v21;
LABEL_19:

  return v14;
}

void sub_100089BB4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_start(va1, a11);
  va_start(va, a11);
  uint64_t v13 = va_arg(va1, void);
  uint64_t v15 = va_arg(va1, void);
  uint64_t v16 = va_arg(va1, void);
  uint64_t v17 = va_arg(va1, void);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  _Block_object_dispose((const void *)(v11 - 128), 8);
  _Unwind_Resume(a1);
}

uint64_t sub_100089BEC(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void sub_100089BFC(uint64_t a1)
{
}

void sub_100089C04(uint64_t a1, void *a2)
{
  id v3 = a2;
  xpc_type_t type = xpc_get_type(v3);
  if (type == (xpc_type_t)&_xpc_type_connection)
  {
    uint64_t v11 = sub_100004B28((uint64_t)off_100109BB8);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      long long v24 = "-[IXSRemoteDeletionPromptConnection startConnectionWithConfig:alertDefinition:completion:]_block_invoke";
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "%s: Got connection from service", buf, 0xCu);
    }

    xpc_connection_set_target_queue((xpc_connection_t)v3, (dispatch_queue_t)&_dispatch_main_q);
    handler[0] = _NSConcreteStackBlock;
    handler[1] = 3221225472;
    handler[2] = sub_100089F2C;
    handler[3] = &unk_1000EB5D0;
    uint64_t v12 = *(void **)(a1 + 40);
    handler[4] = *(void *)(a1 + 32);
    id v20 = v12;
    long long v21 = *(_OWORD *)(a1 + 48);
    uint64_t v22 = *(void *)(a1 + 64);
    xpc_connection_set_event_handler((xpc_connection_t)v3, handler);
    xpc_connection_activate((xpc_connection_t)v3);
    [*(id *)(a1 + 32) setServiceConnection:v3];
  }
  else
  {
    if (type != (xpc_type_t)&_xpc_type_error)
    {
      id v5 = xpc_copy_description(v3);
      id v6 = sub_100004B28((uint64_t)off_100109BB8);
      if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
        sub_10009AB60();
      }

      uint64_t v8 = sub_10003DAE4((uint64_t)"-[IXSRemoteDeletionPromptConnection startConnectionWithConfig:alertDefinition:completion:]_block_invoke", 105, @"IXErrorDomain", 1uLL, 0, 0, @"Got unknown XPC event on listenerConnection handler: %s", v7, (uint64_t)v5);
      uint64_t v9 = *(void *)(*(void *)(a1 + 64) + 8);
      uint64_t v10 = *(void **)(v9 + 40);
      *(void *)(v9 + 40) = v8;

      free(v5);
LABEL_13:
      (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
      goto LABEL_14;
    }
    uint64_t v13 = sub_100004B28((uint64_t)off_100109BB8);
    id v14 = v13;
    if (v3 != &_xpc_error_connection_invalid)
    {
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
        sub_10009AAEC();
      }

      uint64_t v16 = sub_10003DAE4((uint64_t)"-[IXSRemoteDeletionPromptConnection startConnectionWithConfig:alertDefinition:completion:]_block_invoke", 100, @"IXErrorDomain", 1uLL, 0, 0, @"Got XPC error on listenerConnection handler: %@", v15, (uint64_t)v3);
      uint64_t v17 = *(void *)(*(void *)(a1 + 64) + 8);
      uint64_t v18 = *(void **)(v17 + 40);
      *(void *)(v17 + 40) = v16;

      goto LABEL_13;
    }
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      long long v24 = "-[IXSRemoteDeletionPromptConnection startConnectionWithConfig:alertDefinition:completion:]_block_invoke_2";
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "%s: ListenerConnection invalidated", buf, 0xCu);
    }
  }
LABEL_14:
}

void sub_100089F2C(uint64_t a1, void *a2)
{
  id v3 = a2;
  xpc_type_t type = xpc_get_type(v3);
  if (type == (xpc_type_t)&_xpc_type_dictionary)
  {
    uint64_t v11 = sub_100004B28((uint64_t)off_100109BB8);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      __int16 v27 = "-[IXSRemoteDeletionPromptConnection startConnectionWithConfig:alertDefinition:completion:]_block_invoke";
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "%s: Received object from service connection", buf, 0xCu);
    }

    uint64_t v12 = xpc_dictionary_get_value(v3, "result");
    uint64_t v13 = v12;
    if (v12)
    {
      int64_t value = xpc_int64_get_value(v12);
      uint64_t v15 = sub_100004B28((uint64_t)off_100109BB8);
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315394;
        __int16 v27 = "-[IXSRemoteDeletionPromptConnection startConnectionWithConfig:alertDefinition:completion:]_block_invoke";
        __int16 v28 = 2048;
        int64_t v29 = value;
        _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "%s: Got buttonClicked: %lu", buf, 0x16u);
      }

      [*(id *)(a1 + 32) setLastDismissWasSwipeDown:value == 4];
      (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
    }
    else
    {
      long long v21 = xpc_dictionary_get_value(v3, "dismiss");
      uint64_t v22 = v21;
      if (v21)
      {
        if (xpc_BOOL_get_value(v21))
        {
          [*(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) invalidate];
          *(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = 1;
        }
      }
      else
      {
        long long v24 = xpc_dictionary_get_value(v3, "begin");
        if (v24)
        {
          long long v25 = sub_100004B28((uint64_t)off_100109BB8);
          if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 136315138;
            __int16 v27 = "-[IXSRemoteDeletionPromptConnection startConnectionWithConfig:alertDefinition:completion:]_block_invoke";
            _os_log_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_DEFAULT, "%s: Recevied communication from the UI host; successfully started displaying the deletion sheet",
              buf,
              0xCu);
          }
        }
      }
    }
  }
  else
  {
    if (type != (xpc_type_t)&_xpc_type_error)
    {
      id v5 = xpc_copy_description(v3);
      id v6 = sub_100004B28((uint64_t)off_100109BB8);
      if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
        sub_10009AC48();
      }

      uint64_t v8 = sub_10003DAE4((uint64_t)"-[IXSRemoteDeletionPromptConnection startConnectionWithConfig:alertDefinition:completion:]_block_invoke", 88, @"IXErrorDomain", 1uLL, 0, 0, @"Got unknown XPC event on serviceConnection handler: %s", v7, (uint64_t)v5);
      uint64_t v9 = *(void *)(*(void *)(a1 + 64) + 8);
      uint64_t v10 = *(void **)(v9 + 40);
      *(void *)(v9 + 40) = v8;

      free(v5);
LABEL_16:
      (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
      goto LABEL_31;
    }
    if (v3 != &_xpc_error_connection_invalid || !*(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24))
    {
      uint64_t v16 = sub_100004B28((uint64_t)off_100109BB8);
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
        sub_10009ABD4();
      }

      uint64_t v18 = sub_10003DAE4((uint64_t)"-[IXSRemoteDeletionPromptConnection startConnectionWithConfig:alertDefinition:completion:]_block_invoke", 83, @"IXErrorDomain", 1uLL, 0, 0, @"Got XPC error on serviceConnection handler: %@", v17, (uint64_t)v3);
      uint64_t v19 = *(void *)(*(void *)(a1 + 64) + 8);
      id v20 = *(void **)(v19 + 40);
      *(void *)(v19 + 40) = v18;

      goto LABEL_16;
    }
    long long v23 = sub_100004B28((uint64_t)off_100109BB8);
    if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      __int16 v27 = "-[IXSRemoteDeletionPromptConnection startConnectionWithConfig:alertDefinition:completion:]_block_invoke";
      _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_DEFAULT, "%s: ServiceConnection invalidated", buf, 0xCu);
    }
  }
LABEL_31:
}

void sub_10008A610(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_10008AB98(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_10008AC6C(os_log_t log)
{
  int v1 = 136315138;
  uint64_t v2 = "-[IXSErrorPresenter presentErrorForIdentities:code:underlyingError:errorSource:]";
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "%s: Identities array was empty; ignoring request to present alert.",
    (uint8_t *)&v1,
    0xCu);
}

void sub_10008ACF0(void *a1)
{
  int v1 = [a1 objectAtIndexedSubscript:0];
  sub_10000489C();
  sub_10000487C((void *)&_mh_execute_header, v2, v3, "%s: Attempted to present error for code %lu for identity %@ but no app with that bundle ID is installed.", v4, v5, v6, v7, 2u);
}

void sub_10008AD9C(void *a1)
{
  [a1 count];
  sub_10000489C();
  sub_10000487C((void *)&_mh_execute_header, v1, v2, "%s: Attempted to present error for code %lu for %lu identities, but no apps with those bundle IDs are installed.", v3, v4, v5, v6, 2u);
}

void sub_10008AE2C(uint64_t a1, NSObject *a2)
{
  int v2 = 136315394;
  uint64_t v3 = "-[IXSErrorPresenter presentErrorForIdentities:code:underlyingError:errorSource:]";
  __int16 v4 = 2112;
  uint64_t v5 = a1;
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "%s: Unable to get localizedName for any of these bundle IDs: %@", (uint8_t *)&v2, 0x16u);
}

void sub_10008AEB8(os_log_t log)
{
  int v1 = 136315394;
  int v2 = "-[IXSErrorPresenter localizedErrorForAppName:unlocalizedError:localizedError:withError:]";
  __int16 v3 = 2112;
  uint64_t v4 = 0;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "%s: Invalid parameter(s) : %@", (uint8_t *)&v1, 0x16u);
}

void sub_10008AF48(void *a1, _OWORD *a2)
{
  int v4 = *__error();
  *a1 = 0;
  a2[3] = 0u;
  a2[4] = 0u;
  a2[1] = 0u;
  a2[2] = 0u;
  *a2 = 0u;
  os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR);
  strerror(v4);
  _os_log_send_and_compose_impl();
  _os_crash_msg();
  __break(1u);
}

void sub_10008B018()
{
  int v2 = 136315650;
  sub_100006C08();
  sub_100006C24((void *)&_mh_execute_header, v0, v1, "%s: Failed to serialize state : %@ (Error : %@)", v2);
}

void sub_10008B08C(uint64_t a1, NSObject *a2)
{
  int v2 = 136315394;
  __int16 v3 = "_CreateOSStateDiagnosticsForDataWithTitle";
  __int16 v4 = 2112;
  uint64_t v5 = a1;
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "%s: Too much data to include in state dump : %@", (uint8_t *)&v2, 0x16u);
}

void sub_10008B118()
{
  int v2 = 136315650;
  sub_100006C08();
  sub_100006C24((void *)&_mh_execute_header, v0, v1, "%s: Failed to enumerate promise staging directory at %@ : %@", v2);
}

void sub_10008B18C(uint64_t a1, int a2, os_log_t log)
{
  int v3 = 136315650;
  __int16 v4 = "-[IXSPowerAssertion initWithAssertionName:details:]";
  __int16 v5 = 2112;
  uint64_t v6 = a1;
  __int16 v7 = 1024;
  int v8 = a2;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "%s: IOPMAssertionCreateWithDescription for name %@ returned %d", (uint8_t *)&v3, 0x1Cu);
}

void sub_10008B228()
{
  v1[0] = 136315394;
  sub_100007924();
  _os_log_fault_impl((void *)&_mh_execute_header, v0, OS_LOG_TYPE_FAULT, "%s: Attempting to set the same termination assertion for %@", (uint8_t *)v1, 0x16u);
}

void sub_10008B2A8(uint64_t *a1, uint64_t a2, os_log_t log)
{
  uint64_t v3 = *a1;
  int v4 = 136315650;
  __int16 v5 = "-[IXSRevertManager _revertAppWithIdentity:forClientWithName:completion:]_block_invoke";
  __int16 v6 = 2112;
  uint64_t v7 = v3;
  __int16 v8 = 2112;
  uint64_t v9 = a2;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "%s: Failed to revert application with identity %@ : %@", (uint8_t *)&v4, 0x20u);
}

void sub_10008B344()
{
  v2[0] = 136315650;
  sub_100007924();
  __int16 v3 = v0;
  uint64_t v4 = 0;
  _os_log_error_impl((void *)&_mh_execute_header, v1, OS_LOG_TYPE_ERROR, "%s: Failed to revert app because a coordinator %@ already existed : %@", (uint8_t *)v2, 0x20u);
}

void sub_10008B3CC()
{
  sub_10000953C();
  sub_100009550((void *)&_mh_execute_header, v0, v1, "%s: The loading phase is required and thus cannot be 0 percent of the total progress. : %@", v2, v3, v4, v5, 2u);
}

void sub_10008B444()
{
  sub_10000953C();
  sub_100009550((void *)&_mh_execute_header, v0, v1, "%s: The installing phase is required and thus cannot be 0 percent of the total progress. : %@", v2, v3, v4, v5, 2u);
}

void sub_10008B4BC()
{
  sub_10000953C();
  sub_100009550((void *)&_mh_execute_header, v0, v1, "%s: The loading installation phase proportion cannot be negative. : %@", v2, v3, v4, v5, 2u);
}

void sub_10008B534()
{
  sub_10000953C();
  sub_100009550((void *)&_mh_execute_header, v0, v1, "%s: The installing installation phase proportion cannot be negative. : %@", v2, v3, v4, v5, 2u);
}

void sub_10008B5AC()
{
  sub_10000953C();
  sub_100009550((void *)&_mh_execute_header, v0, v1, "%s: The post processing installation phase proportion cannot be negative. : %@", v2, v3, v4, v5, 2u);
}

void sub_10008B624(uint64_t a1, NSObject *a2)
{
  int v2 = 136315394;
  uint64_t v3 = "-[IXSDefaultAppDeleteAlert message]";
  __int16 v4 = 2048;
  uint64_t v5 = a1;
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "%s: Cannot display deletion alert for unsupported default app type %lu", (uint8_t *)&v2, 0x16u);
}

void sub_10008B6B0(void *a1, _OWORD *a2)
{
  int v4 = *__error();
  *a1 = 0;
  a2[3] = 0u;
  a2[4] = 0u;
  a2[1] = 0u;
  a2[2] = 0u;
  *a2 = 0u;
  sub_10000ABE4();
  strerror(v4);
  _os_log_send_and_compose_impl();
  _os_crash_msg();
  __break(1u);
}

void sub_10008B76C(void *a1, _OWORD *a2)
{
  int v4 = *__error();
  *a1 = 0;
  a2[3] = 0u;
  a2[4] = 0u;
  a2[1] = 0u;
  a2[2] = 0u;
  *a2 = 0u;
  sub_10000ABE4();
  strerror(v4);
  _os_log_send_and_compose_impl();
  _os_crash_msg();
  __break(1u);
}

void sub_10008B83C(void *a1, _OWORD *a2)
{
}

void sub_10008B8A8(void *a1, _OWORD *a2)
{
}

void sub_10008B914(void *a1, _OWORD *a2)
{
}

void sub_10008B980(void *a1, _OWORD *a2)
{
}

void sub_10008B9EC(uint64_t *a1, NSObject *a2)
{
  uint64_t v2 = *a1;
  int v3 = 136315650;
  int v4 = "-[IXGlobalConfiguration _dataStorageHomeURLWithError:]";
  __int16 v5 = 2048;
  uint64_t v6 = v2;
  __int16 v7 = 2112;
  uint64_t v8 = 0;
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "%s: Failed to get group container path for group 'systemgroup.com.apple.installcoordinationd'; container_system_grou"
    "p_path_for_identifier returned %llu : %@",
    (uint8_t *)&v3,
    0x20u);
}

void sub_10008BA88(void *a1, _OWORD *a2)
{
}

void sub_10008BAF4(void *a1, _OWORD *a2)
{
}

void sub_10008BB60(int a1, uint64_t a2, NSObject *a3)
{
  int v4 = 136315650;
  __int16 v5 = "-[IXSAppDeletionEligibilityManager _eligibilityAnswerForDomain:]";
  __int16 v6 = 2048;
  uint64_t v7 = a2;
  __int16 v8 = 2080;
  uint64_t v9 = strerror(a1);
  _os_log_error_impl((void *)&_mh_execute_header, a3, OS_LOG_TYPE_ERROR, "%s: Unable to query eligibility deletion for domain %llu : %s", (uint8_t *)&v4, 0x20u);
}

void sub_10008BC10(uint64_t a1, uint64_t a2, os_log_t log)
{
  int v3 = 136315650;
  int v4 = "-[IXSAppDeletionEligibilityManager _onQueue_setAppRemovabilityForSystemAppPlaceholder:]";
  __int16 v5 = 2112;
  uint64_t v6 = a1;
  __int16 v7 = 2112;
  uint64_t v8 = a2;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "%s: Failed to resolve persona for %@ : %@. Skipping without setting conditional removability", (uint8_t *)&v3, 0x20u);
}

void sub_10008BCA8(os_log_t log)
{
  int v1 = 136315138;
  uint64_t v2 = "-[IXApplicationIdentity initUsingPersonaFromCurrentThreadAndBundleIdentifier:]";
  _os_log_fault_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_FAULT, "%s: UserManagement returned nil for the current thread's persona", (uint8_t *)&v1, 0xCu);
}

void sub_10008BD2C(uint64_t a1, void *a2, NSObject *a3)
{
  [a2 count];
  v6[0] = 136315650;
  sub_10000D2E0();
  uint64_t v7 = a1;
  __int16 v8 = 2048;
  uint64_t v9 = v5;
  _os_log_fault_impl((void *)&_mh_execute_header, a3, OS_LOG_TYPE_FAULT, "%s: Failed to parse the plist key: %@ as there are unexpected components: %lu", (uint8_t *)v6, 0x20u);
}

void sub_10008BDD8(os_log_t log)
{
  int v1 = 136315138;
  uint64_t v2 = "-[IXApplicationIdentity initWithCoder:]";
  _os_log_fault_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_FAULT, "%s: Failed to deserialize bundle ID for identity", (uint8_t *)&v1, 0xCu);
}

void sub_10008BE5C(void *a1, uint64_t a2, NSObject *a3)
{
  uint64_t v5 = [a1 bundleID];
  v8[0] = 136315650;
  sub_10000D2E0();
  uint64_t v9 = v6;
  __int16 v10 = v7;
  uint64_t v11 = a2;
  _os_log_error_impl((void *)&_mh_execute_header, a3, OS_LOG_TYPE_ERROR, "%s: Client provided invalid persona for %@ : %@", (uint8_t *)v8, 0x20u);
}

void sub_10008BF14()
{
  sub_10000953C();
  sub_100009550((void *)&_mh_execute_header, v0, v1, "%s: SecTaskCreateFromSelf returned NULL when attempting to fetch UM entitlement : %@", v2, v3, v4, v5, 2u);
}

void sub_10008BF8C(void **a1)
{
  uint64_t v1 = *a1;
  sub_10000D2E0();
  sub_100009550((void *)&_mh_execute_header, v2, v3, "%s: SecTaskCopyValueForEntitlement returned NULL when attempting to fetch the value for the entitlement \"com.apple.usermanagerd.persona.fetch\" in the current process. : %@", v4, v5, v6, v7, 2u);
}

void sub_10008C014()
{
  sub_10000953C();
  sub_100009550((void *)&_mh_execute_header, v0, v1, "%s: Client process has a value other than true for the entitlement \"com.apple.usermanagerd.persona.fetch\". : %@", v2, v3, v4, v5, 2u);
}

void sub_10008C08C(uint64_t a1, int __errnum, NSObject *a3)
{
  int v4 = 136315906;
  uint64_t v5 = "_ClientProcessLookupMachPortName";
  __int16 v6 = 2080;
  uint64_t v7 = a1;
  __int16 v8 = 2080;
  uint64_t v9 = strerror(__errnum);
  __int16 v10 = 2112;
  uint64_t v11 = 0;
  _os_log_error_impl((void *)&_mh_execute_header, a3, OS_LOG_TYPE_ERROR, "%s: sandbox_check returned an error when checking if this process can mach-lookup %s : %s : %@", (uint8_t *)&v4, 0x2Au);
}

void sub_10008C148(uint64_t a1, NSObject *a2)
{
  int v2 = 136315650;
  uint64_t v3 = "_ClientProcessLookupMachPortName";
  __int16 v4 = 2080;
  uint64_t v5 = a1;
  __int16 v6 = 2112;
  uint64_t v7 = 0;
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "%s: This process does not have sandbox access to mach-lookup %s : %@", (uint8_t *)&v2, 0x20u);
}

void sub_10008C1E0(void *a1, uint64_t a2, NSObject *a3)
{
  uint64_t v5 = sub_10000D3CC(a1);
  int v6 = 136316162;
  uint64_t v7 = "IXValidateMobileInstallationSPIEntitlement";
  __int16 v8 = 2112;
  uint64_t v9 = v5;
  __int16 v10 = 2112;
  CFStringRef v11 = @"com.apple.private.mobileinstall.allowedSPI";
  __int16 v12 = 2112;
  uint64_t v13 = a2;
  __int16 v14 = 2112;
  uint64_t v15 = 0;
  _os_log_error_impl((void *)&_mh_execute_header, a3, OS_LOG_TYPE_ERROR, "%s: Process %@ is required to have an entitlement named \"%@\" with an array containing \"%@\" to call this SPI. : %@", (uint8_t *)&v6, 0x34u);
}

void sub_10008C2B8(uint64_t a1, NSObject *a2)
{
  int v2 = 136315394;
  uint64_t v3 = "-[IXSCoordinatorProgress _notifyDelegateAndUpdateProgressWithPhaseCompleted:]";
  __int16 v4 = 2112;
  uint64_t v5 = a1;
  _os_log_debug_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_DEBUG, "%s: Invoking delegate for progress update: %@", (uint8_t *)&v2, 0x16u);
}

void sub_10008C344(os_log_t log)
{
  int v1 = 136315138;
  int v2 = "-[IXSLimitedConcurrencyQueue _onQueue_deQueueIfNeeded]";
  _os_log_debug_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_DEBUG, "%s: No more operations pending", (uint8_t *)&v1, 0xCu);
}

void sub_10008C3C8(os_log_t log)
{
  int v1 = 136315138;
  int v2 = "-[IXSLimitedConcurrencyQueue _onQueue_deQueueIfNeeded]";
  _os_log_debug_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_DEBUG, "%s: No identity found to dequeue for.", (uint8_t *)&v1, 0xCu);
}

void sub_10008C44C()
{
  v1[0] = 136315394;
  sub_100007924();
  _os_log_error_impl((void *)&_mh_execute_header, v0, OS_LOG_TYPE_ERROR, "%s: Unexpectedly failed to find a queue for identity %@", (uint8_t *)v1, 0x16u);
}

void sub_10008C4CC()
{
  v1[0] = 136315394;
  sub_100007924();
  _os_log_error_impl((void *)&_mh_execute_header, v0, OS_LOG_TYPE_ERROR, "%s: Unexpectedly found an empty queue for identity %@", (uint8_t *)v1, 0x16u);
}

void sub_10008C54C(uint64_t a1, void *a2)
{
  __int16 v8 = [a2 descString];
  sub_10001327C((void *)&_mh_execute_header, v2, v3, "%s: Running work for %@: %@", v4, v5, v6, v7, 2u);
}

void sub_10008C600()
{
  v1[0] = 136315394;
  sub_100007924();
  _os_log_debug_impl((void *)&_mh_execute_header, v0, OS_LOG_TYPE_DEBUG, "%s: Dequeued last item for %@; cleaning up.",
    (uint8_t *)v1,
    0x16u);
}

void sub_10008C680()
{
  v1[0] = 136315394;
  sub_100007924();
  _os_log_debug_impl((void *)&_mh_execute_header, v0, OS_LOG_TYPE_DEBUG, "%s: Moving %@ to the end of the identity queue", (uint8_t *)v1, 0x16u);
}

void sub_10008C700(void *a1)
{
  uint64_t v2 = [a1 activeIdentities];
  [v2 count];
  [a1 width];
  sub_10001327C((void *)&_mh_execute_header, v3, v4, "%s: %lu operations already active and %lu allowed; not dequeueing more work.",
    v5,
    v6,
    v7,
    v8,
    2u);
}

void sub_10008C7C0(uint64_t a1)
{
  uint64_t v7 = [*(id *)(a1 + 40) descString];
  sub_10001327C((void *)&_mh_execute_header, v1, v2, "%s: Finished work for %@: %@", v3, v4, v5, v6, 2u);
}

void sub_10008C870()
{
  v3[0] = 136315650;
  sub_100007924();
  __int16 v4 = v0;
  uint64_t v5 = v1;
  _os_log_debug_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEBUG, "%s: Enqueueing operation for %@ : %@", (uint8_t *)v3, 0x20u);
}

uint64_t sub_10008C8FC()
{
  dlerror();
  uint64_t v0 = abort_report_np();
  return sub_10008C920(v0);
}

void sub_10008C920()
{
  int v2 = 136315650;
  sub_100006C08();
  sub_100006C24((void *)&_mh_execute_header, v0, v1, "%s: Failed to send LSApplicationNotificationTypeUninstallDidFail notification for %@ : %@", v2);
}

void sub_10008C994()
{
  int v2 = 136315650;
  sub_100006C08();
  sub_100006C24((void *)&_mh_execute_header, v0, v1, "%s: Failed to purge PrivacyDisclosure data on app deletion for %@ : %@", v2);
}

void sub_10008CA08()
{
  int v2 = 136315650;
  sub_100006C08();
  sub_100006C24((void *)&_mh_execute_header, v0, v1, "%s: Failed to send LSApplicationNotificationTypeApplicationWillBeUninstalled notification for %@ : %@", v2);
}

void sub_10008CA7C(uint64_t a1, NSObject *a2)
{
  int v2 = 136315394;
  uint64_t v3 = "IXReportIncidentUsingAutoBugCapture";
  __int16 v4 = 2112;
  uint64_t v5 = a1;
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "%s: Failed to report using ABC with signature: %@", (uint8_t *)&v2, 0x16u);
}

void sub_10008CB08()
{
  v1[0] = 136315650;
  sub_100006C08();
  _os_log_error_impl((void *)&_mh_execute_header, v0, OS_LOG_TYPE_ERROR, "%s: Could not get LSApplicationRecord for app with identity %@ : %@", (uint8_t *)v1, 0x20u);
}

void sub_10008CB8C()
{
  v2[0] = 136315906;
  sub_100006C08();
  __int16 v3 = v0;
  uint64_t v4 = 0;
  _os_log_error_impl((void *)&_mh_execute_header, v1, OS_LOG_TYPE_ERROR, "%s: Predicate %@ did not match for LSApplicationRecord %@ : %@", (uint8_t *)v2, 0x2Au);
}

void sub_10008CC18()
{
  v1[0] = 136315394;
  sub_10000953C();
  _os_log_error_impl((void *)&_mh_execute_header, v0, OS_LOG_TYPE_ERROR, "%s: Reason passed to -[IXSPromisedAppReference cancelForReason:client:error:] was nil : %@", (uint8_t *)v1, 0x16u);
}

void sub_10008CC9C()
{
  v1[0] = 136315394;
  sub_10000953C();
  _os_log_error_impl((void *)&_mh_execute_header, v0, OS_LOG_TYPE_ERROR, "%s: Client passed to -[IXSPromisedAppReference cancelForReason:client:error:] was IXClientNone (0) : %@", (uint8_t *)v1, 0x16u);
}

void sub_10008CD20()
{
  v1[0] = 136315650;
  sub_100006C08();
  _os_log_fault_impl((void *)&_mh_execute_header, v0, OS_LOG_TYPE_FAULT, "%s: Failed to invalidate app reference %@ : %@", (uint8_t *)v1, 0x20u);
}

void sub_10008CDA4()
{
  int v2 = 136315650;
  sub_100006C08();
  sub_100015860((void *)&_mh_execute_header, v0, v1, "%s: Failed to look up LSApplicationRecord from fallback bundle ID %@ : %@", v2);
}

void sub_10008CE18()
{
  int v2 = 136315650;
  sub_100006C08();
  sub_100015860((void *)&_mh_execute_header, v0, v1, "%s: Failed to fulfill record promise %@ : %@", v2);
}

void sub_10008CE8C(uint64_t a1, uint64_t a2, NSObject *a3)
{
  uint64_t v6 = (objc_class *)objc_opt_class();
  uint64_t v7 = NSStringFromClass(v6);
  int v8 = 136315906;
  uint64_t v9 = "_FulfillLSRecordPromise";
  __int16 v10 = 2112;
  uint64_t v11 = a1;
  __int16 v12 = 2112;
  uint64_t v13 = v7;
  __int16 v14 = 2112;
  uint64_t v15 = a2;
  _os_log_fault_impl((void *)&_mh_execute_header, a3, OS_LOG_TYPE_FAULT, "%s: Expected LSApplicationRecord instance from fulfilling LSRecord promise %@ but got instance with class %@ instead (%@)", (uint8_t *)&v8, 0x2Au);
}

void sub_10008CF60(void *a1, uint8_t *buf, os_log_t log)
{
  *(_DWORD *)buf = 136315650;
  *(void *)(buf + 4) = "IXApplicationRecordForIdentityInDomain";
  *((_WORD *)buf + 6) = 2112;
  *(void *)(buf + 14) = a1;
  *((_WORD *)buf + 11) = 2112;
  *((void *)buf + 3) = 0;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "%s: Unexpected value for installation domain: %@ : %@", buf, 0x20u);
}

void sub_10008CFD4(uint64_t a1, uint64_t a2, NSObject *a3)
{
  int v3 = 136315650;
  uint64_t v4 = "-[IXSAppUninstaller _acquireTerminationAssertionForIdentity:withError:]";
  __int16 v5 = 2112;
  uint64_t v6 = a1;
  __int16 v7 = 2112;
  uint64_t v8 = a2;
  sub_10001C0B0((void *)&_mh_execute_header, a3, (uint64_t)a3, "%s: Failed to query linked children for app with identity: %@ : %@", (uint8_t *)&v3);
}

void sub_10008D064()
{
  sub_10001C094();
  sub_10001C078((void *)&_mh_execute_header, v0, v1, "%s: -[LSApplicationWorkspace uninstallApplication:] for %@ returned NO but did not set an error. : %@", v2, v3, v4, v5, 2u);
}

void sub_10008D0DC()
{
  sub_100007924();
  sub_10001C0C8((void *)&_mh_execute_header, v0, v1, "%s: App deletion service location %@ is not a directory", v2, v3, v4, v5, 2u);
}

void sub_10008D150(uint64_t a1, uint64_t a2, os_log_t log)
{
  int v3 = 136315906;
  uint64_t v4 = "_InvokeSystemAppRemovalXPCService";
  __int16 v5 = 2048;
  uint64_t v6 = 15;
  __int16 v7 = 2112;
  uint64_t v8 = a1;
  __int16 v9 = 2112;
  uint64_t v10 = a2;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "%s: Timed out after waiting %llu seconds for xpc removal service %@ at %@ to complete", (uint8_t *)&v3, 0x2Au);
}

void sub_10008D1F8()
{
  v1[0] = 136315394;
  sub_100007924();
  _os_log_debug_impl((void *)&_mh_execute_header, v0, OS_LOG_TYPE_DEBUG, "%s: Called xpc_add_bundle (direct) with %@", (uint8_t *)v1, 0x16u);
}

void sub_10008D278()
{
  v1[0] = 136315394;
  sub_100007924();
  _os_log_debug_impl((void *)&_mh_execute_header, v0, OS_LOG_TYPE_DEBUG, "%s: Calling xpc_add_bundle (direct) with %@", (uint8_t *)v1, 0x16u);
}

void sub_10008D2F8()
{
  sub_10001C05C();
  sub_10001C078((void *)&_mh_execute_header, v0, v1, "%s: Failed to create move or delete alert for app with identity %@ : %@", v2, v3, v4, v5, 2u);
}

void sub_10008D36C()
{
  sub_10000953C();
  sub_100009550((void *)&_mh_execute_header, v0, v1, "%s: No record specified with unlock prompt : %@", v2, v3, v4, v5, 2u);
}

void sub_10008D3E4(os_log_t log)
{
  int v1 = 136315138;
  uint64_t v2 = "-[IXSAppUninstaller _screenTimeManagementEnabled]";
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "%s: Failed to query STManagementState for screen time passcode management", (uint8_t *)&v1, 0xCu);
}

void sub_10008D468()
{
  sub_10001C114();
  sub_10001C0C8((void *)&_mh_execute_header, v0, v1, "%s: Failed to open ScreenTimeCore framework: %s", v2, v3, v4, v5, 2u);
}

void sub_10008D4DC()
{
  sub_10001C100();
  sub_10001C0C8((void *)&_mh_execute_header, v0, v1, "%s: Failed to load expected classes from ScreenTimeCore.framework: STManagementState : %p", v2, v3, v4, v5, 2u);
}

void sub_10008D55C(os_log_t log)
{
  int v1 = 136315138;
  uint64_t v2 = "-[IXSAppUninstaller _webContentFilterEnabled]";
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "%s: Failed to query WBWebFilterSettings for web content filtering restrictions", (uint8_t *)&v1, 0xCu);
}

void sub_10008D5E0()
{
  sub_10001C114();
  sub_10001C0C8((void *)&_mh_execute_header, v0, v1, "%s: Failed to open WebBookmarks framework: %s", v2, v3, v4, v5, 2u);
}

void sub_10008D654()
{
  sub_10001C100();
  sub_10001C0C8((void *)&_mh_execute_header, v0, v1, "%s: Failed to load expected classes from WebBookmarks.framework: WBWebFilterSettings : %p", v2, v3, v4, v5, 2u);
}

void sub_10008D6D4()
{
  sub_10001C05C();
  sub_10001C078((void *)&_mh_execute_header, v0, v1, "%s: Failed to create app uninstall alert for app with bundle ID %@ : %@", v2, v3, v4, v5, 2u);
}

void sub_10008D748()
{
  sub_100007924();
  sub_100009550((void *)&_mh_execute_header, v0, v1, "%s: Failed to open default app marketplace : %@", v2, v3, v4, v5, 2u);
}

void sub_10008D7BC(void *a1, NSObject *a2)
{
  uint64_t v3 = [a1 bundleIdentifier];
  int v5 = 136315650;
  uint64_t v6 = "-[IXSAppUninstaller _promptForDeletionWithRecord:identity:clientName:flags:completion:removability:]";
  __int16 v7 = 2112;
  CFStringRef v8 = @"com.apple.AppDeletionUIHost";
  __int16 v9 = 2112;
  uint64_t v10 = v3;
  sub_10001C0B0((void *)&_mh_execute_header, a2, v4, "%s: Deletion UI host app %@ is not installed so we can't show a deletion prompt for %@", (uint8_t *)&v5);
}

void sub_10008D870()
{
  sub_100007924();
  sub_100009550((void *)&_mh_execute_header, v0, v1, "%s: Failed to identify sheet disposition from user response : %@", v2, v3, v4, v5, 2u);
}

void sub_10008D8E4()
{
  sub_10000953C();
  sub_100009550((void *)&_mh_execute_header, v0, v1, "%s: Unable to load ManagedSettingsObjC framework : %@", v2, v3, v4, v5, 2u);
}

void sub_10008D95C()
{
  sub_10001C128(__stack_chk_guard);
  sub_10001C094();
  sub_10001C078((void *)&_mh_execute_header, v0, v1, "%s: Unknown override response received from ManagedSettings for app with bundle ID %@ : %@", v2, v3, v4, v5, 2u);
}

void sub_10008D9D0()
{
  sub_10001C128(__stack_chk_guard);
  sub_10001C094();
  sub_10001C078((void *)&_mh_execute_header, v0, v1, "%s: Request to override unremovability denied for app with bundle ID %@ : %@", v2, v3, v4, v5, 2u);
}

void sub_10008DA44()
{
  sub_10001C128(__stack_chk_guard);
  v1[0] = 136315650;
  sub_10001C0E4();
  sub_10001C0B0((void *)&_mh_execute_header, v0, (uint64_t)v0, "%s: Request to override unremovability failed for app with bundle ID %@ : %@", (uint8_t *)v1);
}

void sub_10008DAC0()
{
  sub_10001C05C();
  sub_10001C078((void *)&_mh_execute_header, v0, v1, "%s: App with identity %@ cannot be uninstalled : %@", v2, v3, v4, v5, 2u);
}

void sub_10008DB34()
{
  sub_10001C05C();
  sub_10001C078((void *)&_mh_execute_header, v0, v1, "%s: App with identity %@ needs to be unlocked before it can be uninstalled : %@", v2, v3, v4, v5, 2u);
}

void sub_10008DBA8()
{
  sub_10001C128(__stack_chk_guard);
  v1[0] = 136315650;
  sub_10001C0E4();
  sub_10001C0B0((void *)&_mh_execute_header, v0, (uint64_t)v0, "%s: Failed to connect to removal service %@ : %@", (uint8_t *)v1);
}

void sub_10008DC24()
{
  sub_100007924();
  sub_100009550((void *)&_mh_execute_header, v0, v1, "%s: Error running app removal service: %@", v2, v3, v4, v5, 2u);
}

void sub_10008DC98()
{
  sub_10000953C();
  sub_100009550((void *)&_mh_execute_header, v0, v1, "%s: Attempting to initialize IXSPlaceholder with seed that has a nil bundleName; failing. : %@",
    v2,
    v3,
    v4,
    v5,
    2u);
}

void sub_10008DD10()
{
  sub_10000953C();
  sub_100009550((void *)&_mh_execute_header, v0, v1, "%s: Attempting to initialize IXSPlaceholder with seed that has a nil bundleID; failing. : %@",
    v2,
    v3,
    v4,
    v5,
    2u);
}

void sub_10008DD88()
{
  sub_100029DC8();
  *uint64_t v2 = 136315906;
  sub_100029DA4(v3, v4, (uint64_t)v2);
  sub_100029DDC((void *)&_mh_execute_header, "%s: IXSPlaceholderPromise with UUID %@ was complete but found nothing at %@ : %@", v5, v6);
}

void sub_10008DDDC()
{
  sub_100029DC8();
  *uint64_t v2 = 136315906;
  sub_100029DA4(v3, v4, (uint64_t)v2);
  sub_100029DDC((void *)&_mh_execute_header, "%s: %@: Failed to locate localization dictionary promise with UUID %@ : %@", v5, v6);
}

void sub_10008DE30()
{
  sub_100029DC8();
  *uint64_t v2 = 136315906;
  sub_100029DA4(v3, v4, (uint64_t)v2);
  sub_100029DDC((void *)&_mh_execute_header, "%s: %@: Failed to locate metadata promise with UUID %@ : %@", v5, v6);
}

void sub_10008DE84()
{
  sub_100029DC8();
  *uint64_t v2 = 136315906;
  sub_100029DA4(v3, v4, (uint64_t)v2);
  sub_100029DDC((void *)&_mh_execute_header, "%s: %@: Failed to locate loctable promise with UUID %@ : %@", v5, v6);
}

void sub_10008DED8()
{
  sub_100029DC8();
  *uint64_t v2 = 136315906;
  sub_100029DA4(v3, v4, (uint64_t)v2);
  sub_100029DDC((void *)&_mh_execute_header, "%s: %@: Failed to locate entitlements promise with UUID %@ : %@", v5, v6);
}

void sub_10008DF2C()
{
  sub_10001C05C();
  sub_10001C078((void *)&_mh_execute_header, v0, v1, "%s: %@: Found info plist icon content promise but not icon resources promise : %@", v2, v3, v4, v5, 2u);
}

void sub_10008DFA0()
{
  sub_10001C05C();
  sub_10001C078((void *)&_mh_execute_header, v0, v1, "%s: %@: Found icon resources promise but not info plist icon content promise : %@", v2, v3, v4, v5, 2u);
}

void sub_10008E014()
{
  sub_100029DC8();
  *uint64_t v2 = 136315906;
  sub_100029DA4(v3, v4, (uint64_t)v2);
  sub_100029DDC((void *)&_mh_execute_header, "%s: %@: Failed to locate icon resources promise with UUID %@ : %@", v5, v6);
}

void sub_10008E068()
{
  sub_100029DC8();
  *uint64_t v2 = 136315906;
  sub_100029DA4(v3, v4, (uint64_t)v2);
  sub_100029DDC((void *)&_mh_execute_header, "%s: %@: Failed to locate icon promise with UUID %@ : %@", v5, v6);
}

void sub_10008E0BC(void *a1, uint8_t *buf, os_log_t log)
{
  *(_DWORD *)buf = 136315394;
  *(void *)(buf + 4) = "+[IXSPlaceholder _metadataFromPromise:]";
  *((_WORD *)buf + 6) = 2112;
  *(void *)(buf + 14) = a1;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "%s: No data on the metadata promise %@", buf, 0x16u);
}

void sub_10008E128(void *a1, uint64_t a2, _DWORD *a3)
{
  *a3 = 136315650;
  sub_100029E50((uint64_t)a1, a2, (uint64_t)a3);
  sub_10001C0B0((void *)&_mh_execute_header, v6, v4, "%s: Failed to create unarchiver for metadata from promise %@: %@", v5);
}

void sub_10008E184()
{
  sub_100029DC8();
  *uint64_t v2 = 136315650;
  sub_100029E50(v3, v4, (uint64_t)v2);
  sub_10001C0B0((void *)&_mh_execute_header, v7, v5, "%s: Failed to decode metadata from promise %@: %@", v6);
}

void sub_10008E1DC(void *a1)
{
  uint64_t v1 = [a1 name];
  sub_100007924();
  sub_100029DF8((void *)&_mh_execute_header, v2, v3, "%s: %@: Not materializing because client has not set configuration complete", v4, v5, v6, v7, 2u);
}

void sub_10008E270(void *a1)
{
  uint64_t v1 = [a1 name];
  sub_100007924();
  sub_100029DF8((void *)&_mh_execute_header, v2, v3, "%s: %@: Not materializing because an error has occurred.", v4, v5, v6, v7, 2u);
}

void sub_10008E304(uint64_t a1)
{
  uint64_t v1 = [*(id *)(a1 + 40) name];
  sub_100007924();
  sub_100029DF8((void *)&_mh_execute_header, v2, v3, "%s: %@: Not materializing because icon promise is not complete or an error occurred.", v4, v5, v6, v7, 2u);
}

void sub_10008E398(uint64_t a1)
{
  uint64_t v1 = [*(id *)(a1 + 40) name];
  sub_100007924();
  sub_100029DF8((void *)&_mh_execute_header, v2, v3, "%s: %@: Not materializing because icon resources promise is not complete or an error occurred.", v4, v5, v6, v7, 2u);
}

void sub_10008E42C(id *a1)
{
  uint64_t v1 = [*a1 name];
  sub_100007924();
  sub_100029DF8((void *)&_mh_execute_header, v2, v3, "%s: %@: Not materializing because entitlements promise is not complete.", v4, v5, v6, v7, 2u);
}

void sub_10008E4C0(id *a1)
{
  uint64_t v1 = [*a1 name];
  sub_100007924();
  sub_100029DF8((void *)&_mh_execute_header, v2, v3, "%s: %@: Not materializing because loctable promise is not complete.", v4, v5, v6, v7, 2u);
}

void sub_10008E554()
{
  sub_100029E6C();
  uint64_t v3 = [*(id *)(v2 + 40) name];
  uint64_t v4 = [*v1 name];
  int v5 = 136315650;
  uint64_t v6 = "-[IXSPlaceholder _isReadyToMaterialize]_block_invoke";
  __int16 v7 = 2112;
  CFStringRef v8 = v3;
  __int16 v9 = 2112;
  uint64_t v10 = v4;
  _os_log_debug_impl((void *)&_mh_execute_header, v0, OS_LOG_TYPE_DEBUG, "%s: %@: Not materializing because app extension promise %@ is not complete.", (uint8_t *)&v5, 0x20u);
}

void sub_10008E628()
{
  sub_10000953C();
  sub_100009550((void *)&_mh_execute_header, v0, v1, "%s: Reason passed to -[IXSPlaceholder cancelForReason:] was nil : %@", v2, v3, v4, v5, 2u);
}

void sub_10008E6A0()
{
  sub_10000953C();
  sub_100009550((void *)&_mh_execute_header, v0, v1, "%s: Client passed to -[IXSPlaceholder cancelForReason:] was IXClientNone (0) : %@", v2, v3, v4, v5, 2u);
}

void sub_10008E718(void *a1)
{
  __int16 v7 = IXStringForClientID((unint64_t)[a1 creatorIdentifier]);
  sub_100029E78((void *)&_mh_execute_header, v1, v2, "%s: The creator of placeholder %@ is missing the entitlement \"%@\" = TRUE which is required to create a web notification placeholder. : %@", v3, v4, v5, v6, 2u);
}

void sub_10008E7D0(void *a1, uint64_t a2, NSObject *a3)
{
  uint64_t v4 = [a1 path];
  v6[0] = 136315650;
  sub_100029E34();
  sub_10001C0B0((void *)&_mh_execute_header, a3, v5, "%s: Failed to write bundle Info.plist to %@ : %@", (uint8_t *)v6);
}

void sub_10008E878(void *a1, uint64_t a2, NSObject *a3)
{
  uint64_t v4 = [a1 path];
  v6[0] = 136315650;
  sub_100029E34();
  sub_10001C0B0((void *)&_mh_execute_header, a3, v5, "%s: Failed to create bundle directory at %@ : %@", (uint8_t *)v6);
}

void sub_10008E920()
{
  v1[0] = 136315650;
  sub_100007924();
  __int16 v2 = 1024;
  int v3 = 255;
  _os_log_error_impl((void *)&_mh_execute_header, v0, OS_LOG_TYPE_ERROR, "%s: Sanitized bundle name %@ is >= %d, truncating it and attempting to proceed", (uint8_t *)v1, 0x1Cu);
}

void sub_10008E9B0()
{
  sub_100007924();
  sub_100009550((void *)&_mh_execute_header, v0, v1, "%s: Failed to get icon asset urls from staged path: %@", v2, v3, v4, v5, 2u);
}

void sub_10008EA24()
{
  sub_100029E6C();
  uint64_t v2 = [v1 path];
  v4[0] = 136315650;
  sub_100029E18();
  sub_10001C0B0((void *)&_mh_execute_header, v0, v3, "%s: Failed to write %@ : %@", (uint8_t *)v4);
}

void sub_10008EAC4()
{
  sub_100029E6C();
  uint64_t v2 = [v1 path];
  v4[0] = 136315650;
  sub_100029E18();
  sub_10001C0B0((void *)&_mh_execute_header, v0, v3, "%s: Failed to create lproj directory at %@ : %@", (uint8_t *)v4);
}

void sub_10008EB64(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_10008EBF0()
{
  sub_10001C05C();
  sub_10001C078((void *)&_mh_execute_header, v0, v1, "%s: Could not find metadata promise with UUID %@ : %@", v2, v3, v4, v5, 2u);
}

void sub_10008EC64()
{
  sub_10001C05C();
  sub_10001C078((void *)&_mh_execute_header, v0, v1, "%s: Client attempted to set metadata promise that was not complete: %@ : %@", v2, v3, v4, v5, 2u);
}

void sub_10008ECD8()
{
  sub_10001C05C();
  sub_10001C078((void *)&_mh_execute_header, v0, v1, "%s: Metadata promise %@ did not contain a decodeable MIStoreMetadata instance. : %@", v2, v3, v4, v5, 2u);
}

void sub_10008ED4C()
{
  sub_10001C05C();
  sub_10001C078((void *)&_mh_execute_header, v0, v1, "%s: Could not find sinf promise with UUID %@ : %@", v2, v3, v4, v5, 2u);
}

void sub_10008EDC0()
{
  sub_10001C05C();
  sub_10001C078((void *)&_mh_execute_header, v0, v1, "%s: Could not find icon promise with UUID %@ : %@", v2, v3, v4, v5, 2u);
}

void sub_10008EE34()
{
  sub_10001C05C();
  sub_10001C078((void *)&_mh_execute_header, v0, v1, "%s: Could not find icon resources promise with UUID %@ : %@", v2, v3, v4, v5, 2u);
}

void sub_10008EEA8()
{
  sub_10001C05C();
  sub_10001C078((void *)&_mh_execute_header, v0, v1, "%s: Could not find Info.plist icon content promise with UUID %@ : %@", v2, v3, v4, v5, 2u);
}

void sub_10008EF1C()
{
  sub_10001C05C();
  sub_10001C078((void *)&_mh_execute_header, v0, v1, "%s: Could not find localization dictionary promise with UUID %@ : %@", v2, v3, v4, v5, 2u);
}

void sub_10008EF90()
{
  sub_10001C05C();
  sub_10001C078((void *)&_mh_execute_header, v0, v1, "%s: Could not find entitlements promise with UUID %@ : %@", v2, v3, v4, v5, 2u);
}

void sub_10008F004()
{
  sub_10001C05C();
  sub_10001C078((void *)&_mh_execute_header, v0, v1, "%s: Could not find loctable promise with UUID %@ : %@", v2, v3, v4, v5, 2u);
}

void sub_10008F078()
{
  sub_10001C05C();
  sub_10001C078((void *)&_mh_execute_header, v0, v1, "%s: Could not find placeholder promise with UUID %@ : %@", v2, v3, v4, v5, 2u);
}

void sub_10008F0EC(void *a1, NSObject *a2)
{
  uint64_t v3 = [a1 bundleID];
  v5[0] = 136315650;
  sub_10001C05C();
  sub_10001C0B0((void *)&_mh_execute_header, a2, v4, "%s: App extension placeholders array has multiple placeholders with the same bundleID of %@ : %@", (uint8_t *)v5);
}

void sub_10008F184()
{
  sub_100029E6C();
  uint64_t v1 = [v0 bundleID];
  sub_100029E18();
  sub_100029E78((void *)&_mh_execute_header, v2, v3, "%s: Cannot complete attempt to set app extension placeholder with bundle ID %@ because it does not have the parent placeholder's required bundle ID prefix of %@ : %@", v4, v5, v6, v7, 2u);
}

void sub_10008F224(void *a1)
{
  uint64_t v1 = [a1 saveURL];
  sub_100007924();
  sub_10000487C((void *)&_mh_execute_header, v2, v3, "%s: Failed to create unarchiver from save data %@: %@", v4, v5, v6, v7, 2u);
}

void sub_10008F2C8(void *a1, void *a2)
{
  uint64_t v3 = [a1 saveURL];
  uint64_t v4 = [a2 error];
  sub_10002E754();
  sub_10000487C((void *)&_mh_execute_header, v5, v6, "%s: Failed to decode observer service name map %@: %@", v7, v8, v9, v10, 2u);
}

void sub_10008F378(void *a1, void *a2)
{
  uint64_t v3 = [a1 saveURL];
  uint64_t v4 = [a2 error];
  sub_10002E754();
  sub_10000487C((void *)&_mh_execute_header, v5, v6, "%s: Failed to decode service %@: %@", v7, v8, v9, v10, 2u);
}

void sub_10008F428(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
    a5,
    a6,
    a7,
    a8,
    2u);
}

void sub_10008F4A0(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
    a5,
    a6,
    a7,
    a8,
    2u);
}

void sub_10008F518(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
    a5,
    a6,
    a7,
    a8,
    2u);
}

void sub_10008F590(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
    a5,
    a6,
    a7,
    a8,
    2u);
}

void sub_10008F608()
{
  v1[0] = 136315394;
  sub_100007924();
  _os_log_error_impl((void *)&_mh_execute_header, v0, OS_LOG_TYPE_ERROR, "%s: Failed to encode observer map: %@", (uint8_t *)v1, 0x16u);
}

void sub_10008F688(uint64_t a1, NSObject *a2)
{
  uint64_t v2 = *(void *)(a1 + 32);
  int v3 = 136315394;
  uint64_t v4 = "-[IXSAppInstallObserverManager _onQueue_connectionForObserverEndpoint:]_block_invoke";
  __int16 v5 = 2112;
  uint64_t v6 = v2;
  _os_log_debug_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_DEBUG, "%s: Connection invalidated to %@", (uint8_t *)&v3, 0x16u);
}

void sub_10008F718(uint64_t a1)
{
  uint64_t v1 = sub_10002AB7C(*(void *)(a1 + 40));
  sub_10002E714();
  sub_100029E78((void *)&_mh_execute_header, v2, v3, "%s: Failed to send notification %@ to service %@ : %@", v4, v5, v6, v7, 2u);
}

void sub_10008F7C0(uint64_t a1)
{
  uint64_t v1 = sub_10002AB7C(*(void *)(a1 + 40));
  sub_10002E714();
  sub_100029E78((void *)&_mh_execute_header, v2, v3, "%s: Failed to send notification %@ to endpoint %@ : %@", v4, v5, v6, v7, 2u);
}

void sub_10008F868()
{
  sub_100007924();
  sub_100009550((void *)&_mh_execute_header, v0, v1, "%s: Failed to create promise staging root directory : %@", v2, v3, v4, v5, 2u);
}

void sub_10008F8DC()
{
  sub_100007924();
  sub_100009550((void *)&_mh_execute_header, v0, v1, "%s: Failed to set mode on promise staging directory : %@", v2, v3, v4, v5, 2u);
}

void sub_10008F950()
{
  sub_100007924();
  sub_100009550((void *)&_mh_execute_header, v0, v1, "%s: Failed to create promise staging directory : %@", v2, v3, v4, v5, 2u);
}

void sub_10008F9C4()
{
  sub_10000D2E0();
  sub_100009550((void *)&_mh_execute_header, v0, v1, "%s: The staged path property was not set set. : %@", v2, v3, v4, v5, 2u);
}

void sub_10008FA40(void *a1, NSObject *a2)
{
  uint64_t v3 = [a1 stagedPath];
  uint64_t v4 = [v3 path];
  v5[0] = 136315650;
  sub_10001C05C();
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "%s: The item that this promise is representing does not exist at staged path \"%@\". : %@", (uint8_t *)v5, 0x20u);
}

void sub_10008FAF8(id *a1, id *a2, NSObject *a3)
{
  uint64_t v5 = [*a1 path];
  uint64_t v6 = [*a2 seed];
  uint64_t v7 = [v6 stagingBaseDir];
  uint64_t v8 = [v7 path];
  v11[0] = 136315906;
  sub_10000D2E0();
  __int16 v12 = v5;
  __int16 v13 = v9;
  uint64_t v14 = v10;
  __int16 v15 = v9;
  uint64_t v16 = 0;
  _os_log_error_impl((void *)&_mh_execute_header, a3, OS_LOG_TYPE_ERROR, "%s: Attempt to set the stagedPath to %@ which does not start with the staged item prefix %@ : %@", (uint8_t *)v11, 0x2Au);
}

void sub_10008FBF8()
{
  v1[0] = 136315650;
  sub_10001C05C();
  _os_log_error_impl((void *)&_mh_execute_header, v0, OS_LOG_TYPE_ERROR, "%s: Failed to set target last path component to %@ because it contains slash(es) : %@", (uint8_t *)v1, 0x20u);
}

void sub_10008FC78(void *a1, void *a2, NSObject *a3)
{
  uint64_t v6 = [a1 name];
  uint64_t v7 = [a1 uniqueIdentifier];
  uint64_t v8 = [a2 path];
  v11[0] = 136316162;
  sub_10000D2E0();
  __int16 v12 = v6;
  __int16 v13 = v9;
  uint64_t v14 = v7;
  __int16 v15 = v9;
  uint64_t v16 = v10;
  __int16 v17 = v9;
  uint64_t v18 = 0;
  _os_log_error_impl((void *)&_mh_execute_header, a3, OS_LOG_TYPE_ERROR, "%s: IXSOwnedDataPromise (%@) with UUID %@ was complete but found nothing at %@ : %@", (uint8_t *)v11, 0x34u);
}

void sub_10008FD6C()
{
  v1[0] = 136315394;
  sub_100007924();
  _os_log_fault_impl((void *)&_mh_execute_header, v0, OS_LOG_TYPE_FAULT, "%s: Attempting to set the same termination assertion for %@", (uint8_t *)v1, 0x16u);
}

void sub_10008FDEC()
{
  v1[0] = 136315650;
  sub_10003104C();
  uint64_t v2 = 0;
  _os_log_error_impl((void *)&_mh_execute_header, v0, OS_LOG_TYPE_ERROR, "%s: Failed to create termination assertion for predicate %@ : %@", (uint8_t *)v1, 0x20u);
}

void sub_10008FE70(os_log_t log)
{
  int v1 = 136315650;
  uint64_t v2 = "-[IXSTerminationAssertion initForBundleIDs:description:terminationResistance:error:]";
  __int16 v3 = 2080;
  uint64_t v4 = "-[IXSTerminationAssertion initForBundleIDs:description:terminationResistance:error:]";
  __int16 v5 = 2112;
  uint64_t v6 = 0;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "%s: %s failed in init : %@", (uint8_t *)&v1, 0x20u);
}

void sub_10008FF0C(void *a1, uint64_t a2, NSObject *a3)
{
  __int16 v5 = [a1 termAssertion];
  v6[0] = 136315650;
  sub_10003104C();
  uint64_t v7 = a2;
  _os_log_error_impl((void *)&_mh_execute_header, a3, OS_LOG_TYPE_ERROR, "%s: Failed to acquire termination assertion %@ : %@", (uint8_t *)v6, 0x20u);
}

void sub_10008FFBC()
{
  v1[0] = 136315394;
  sub_100007924();
  _os_log_debug_impl((void *)&_mh_execute_header, v0, OS_LOG_TYPE_DEBUG, "%s: RBS termination assertion observer called for %@", (uint8_t *)v1, 0x16u);
}

void sub_10009003C()
{
  v1[0] = 136315394;
  sub_100007924();
  _os_log_error_impl((void *)&_mh_execute_header, v0, OS_LOG_TYPE_ERROR, "%s: Failed to load bundle for our framework at %@", (uint8_t *)v1, 0x16u);
}

void sub_1000900BC()
{
  v2[0] = 136315650;
  sub_100007924();
  __int16 v3 = 2048;
  uint64_t v4 = v0;
  _os_log_error_impl((void *)&_mh_execute_header, v1, OS_LOG_TYPE_ERROR, "%s: Underlying error was nil when constructing OS version error for app name %@ and number of apps %lu", (uint8_t *)v2, 0x20u);
}

void sub_10009014C()
{
  v1[0] = 136315394;
  sub_100007924();
  _os_log_error_impl((void *)&_mh_execute_header, v0, OS_LOG_TYPE_ERROR, "%s: Failed to open Settings : %@", (uint8_t *)v1, 0x16u);
}

void sub_1000901CC(void *a1, NSObject *a2)
{
  __int16 v3 = [a1 bundleIdentifier];
  int v4 = 136315394;
  __int16 v5 = "-[IXSAppUninstallAlert otherButtonActionWithCompletion:]";
  __int16 v6 = 2112;
  uint64_t v7 = v3;
  _os_log_fault_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_FAULT, "%s: Got other button press but action unclear for app %@", (uint8_t *)&v4, 0x16u);
}

void sub_100090278(void *a1, uint64_t a2, NSObject *a3)
{
  __int16 v5 = [a1 path];
  uint64_t v6 = *(void *)(*(void *)(*(void *)a2 + 8) + 40);
  int v7 = 136315650;
  uint64_t v8 = "-[IXSPromisedInMemoryDictionary initWithSeed:dictionary:error:]_block_invoke";
  __int16 v9 = 2112;
  uint64_t v10 = v5;
  __int16 v11 = 2112;
  uint64_t v12 = v6;
  _os_log_error_impl((void *)&_mh_execute_header, a3, OS_LOG_TYPE_ERROR, "%s: Could not write dictionary promise dictionary to disk at %@ : %@", (uint8_t *)&v7, 0x20u);
}

void sub_100090344()
{
  sub_100007924();
  sub_100009550((void *)&_mh_execute_header, v0, v1, "%s: Failed to get removability directory URL: %@", v2, v3, v4, v5, 2u);
}

void sub_1000903B8()
{
  sub_100007924();
  sub_100009550((void *)&_mh_execute_header, v0, v1, "%s: Failed to get removability directory URL: %@", v2, v3, v4, v5, 2u);
}

void sub_10009042C()
{
  sub_100007924();
  sub_100009550((void *)&_mh_execute_header, v0, v1, "%s: Failed to get removability directory URL: %@", v2, v3, v4, v5, 2u);
}

void sub_1000904A0()
{
  sub_100007924();
  sub_100009550((void *)&_mh_execute_header, v0, v1, "%s: Failed to get data directory URL: %@", v2, v3, v4, v5, 2u);
}

void sub_100090514()
{
  sub_100007924();
  sub_100009550((void *)&_mh_execute_header, v0, v1, "%s: Failed to create removability data from dictionary: %@", v2, v3, v4, v5, 2u);
}

void sub_100090588()
{
  sub_100007924();
  sub_100009550((void *)&_mh_execute_header, v0, v1, "%s: Failed to create removability data from dictionary: %@", v2, v3, v4, v5, 2u);
}

void sub_1000905FC()
{
  sub_100007924();
  sub_100009550((void *)&_mh_execute_header, v0, v1, "%s: Failed to deserialize removability data: %@", v2, v3, v4, v5, 2u);
}

void sub_100090670()
{
  sub_100007924();
  sub_100009550((void *)&_mh_execute_header, v0, v1, "%s: Failed to create dictionary from deserialized removability data: %@", v2, v3, v4, v5, 2u);
}

void sub_1000906E4()
{
  v2[0] = 136315650;
  sub_10000D2E0();
  sub_100037140();
  sub_10001C0B0((void *)&_mh_execute_header, v0, v1, "%s: Deserialized removability plist is missing key %@ : %@", (uint8_t *)v2);
}

void sub_100090768()
{
  sub_100007924();
  sub_100009550((void *)&_mh_execute_header, v0, v1, "%s: Received non dictionary object for removability entries in deserialized removability plist: %@", v2, v3, v4, v5, 2u);
}

void sub_1000907DC()
{
  v2[0] = 136315650;
  sub_10000D2E0();
  sub_100037140();
  sub_10001C0B0((void *)&_mh_execute_header, v0, v1, "%s: Deserialized removability plist is missing key %@ : %@", (uint8_t *)v2);
}

void sub_100090860()
{
  sub_100007924();
  sub_100009550((void *)&_mh_execute_header, v0, v1, "%s: Received non dictionary object for change clock in deserialized removability plist: %@", v2, v3, v4, v5, 2u);
}

void sub_1000908D4()
{
  sub_100007924();
  sub_100009550((void *)&_mh_execute_header, v0, v1, "%s: Failed to extract removability entries from deserialized removability plist: %@", v2, v3, v4, v5, 2u);
}

void sub_100090948()
{
  sub_100007924();
  sub_100009550((void *)&_mh_execute_header, v0, v1, "%s: Failed to extract change clock from deserialized removability plist: %@", v2, v3, v4, v5, 2u);
}

void sub_1000909BC()
{
  int v2 = 136315650;
  sub_100006C08();
  sub_100006C24((void *)&_mh_execute_header, v0, v1, "%s: Received non dictionary object for requested keys %@ : %@", v2);
}

void sub_100090A30()
{
  v3[0] = 136315650;
  sub_10000D2E0();
  CFStringRef v4 = @"RemovabilityEntries";
  __int16 v5 = v0;
  uint64_t v6 = 0;
  sub_10001C0B0((void *)&_mh_execute_header, v1, v2, "%s: Deserialized removability plist is missing key %@ : %@", (uint8_t *)v3);
}

void sub_100090AC0()
{
  v2[0] = 136315650;
  sub_10000D2E0();
  sub_100037140();
  sub_10001C0B0((void *)&_mh_execute_header, v0, v1, "%s: Received non dictionary object for %@ : %@", (uint8_t *)v2);
}

void sub_100090B44()
{
  sub_100007924();
  sub_100009550((void *)&_mh_execute_header, v0, v1, "%s: Failed to fetch removability metadata from %@", v2, v3, v4, v5, 2u);
}

void sub_100090BB8()
{
  sub_10000D2E0();
  sub_100009550((void *)&_mh_execute_header, v0, v1, "%s: Deserialized removability plist is missing key %@", v2, v3, v4, v5, 2u);
}

void sub_100090C3C()
{
  v2[0] = 136315650;
  sub_10000D2E0();
  sub_100037140();
  sub_10001C0B0((void *)&_mh_execute_header, v0, v1, "%s: Received non dictionary object for %@ : %@", (uint8_t *)v2);
}

void sub_100090CC0()
{
  int v2 = 136315650;
  sub_100006C08();
  sub_100006C24((void *)&_mh_execute_header, v0, v1, "%s: Failed to fetch removability for %@ : %@", v2);
}

void sub_100090D34()
{
  v1[0] = 136315650;
  sub_100006C08();
  _os_log_fault_impl((void *)&_mh_execute_header, v0, OS_LOG_TYPE_FAULT, "%s: Failed to read removability data because the persona for %@ couldn't be resolved. This defeats a daemon launch avoidance optimization: %@", (uint8_t *)v1, 0x20u);
}

void sub_100090DB8()
{
  sub_100007924();
  sub_100009550((void *)&_mh_execute_header, v0, v1, "%s: Failed to deserialize removability plist: %@", v2, v3, v4, v5, 2u);
}

void sub_100090E2C(os_log_t log)
{
  int v1 = 136315138;
  uint64_t v2 = "IXGetUncachedRemovabilityDataStore";
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "%s: Deserialized removability plist is not dictionary", (uint8_t *)&v1, 0xCu);
}

void sub_100090EB0(os_log_t log)
{
  int v1 = 136315138;
  uint64_t v2 = "_CopyRemovabilityDataFromURL";
  _os_log_fault_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_FAULT, "%s: removabilityURL was nil, so returning nil.", (uint8_t *)&v1, 0xCu);
}

void sub_100090F34(void *a1, NSObject *a2)
{
  uint64_t v3 = [a1 path];
  v4[0] = 136315394;
  sub_100007924();
  _os_log_fault_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_FAULT, "%s: Failed to read removability data from %@ because it wasn't accessible due to sandboxing restrictions on this process. This defeats a daemon launch avoidance optimization.", (uint8_t *)v4, 0x16u);
}

void sub_100090FD4(void *a1, uint64_t a2, NSObject *a3)
{
  uint64_t v5 = [a1 path];
  int v7 = 136315650;
  uint64_t v8 = "_CopyRemovabilityDataFromURL";
  __int16 v9 = 2112;
  uint64_t v10 = v5;
  __int16 v11 = 2112;
  uint64_t v12 = a2;
  sub_10001C0B0((void *)&_mh_execute_header, a3, v6, "%s: Failed to read removability data from %@ : %@", (uint8_t *)&v7);
}

void sub_10009108C()
{
  int v2 = 136315650;
  sub_100006C08();
  sub_100006C24((void *)&_mh_execute_header, v0, v1, "%s: Deserialized key for removability entry is not string %@ : %@", v2);
}

void sub_100091100()
{
  sub_100007924();
  sub_100009550((void *)&_mh_execute_header, v0, v1, "%s: Failed to get removability dictionary for entry: %@", v2, v3, v4, v5, 2u);
}

void sub_100091174()
{
  sub_100007924();
  sub_100009550((void *)&_mh_execute_header, v0, v1, "%s: Failed to deserialize removability entry: %@", v2, v3, v4, v5, 2u);
}

void sub_1000911E8()
{
  int v2 = 136315650;
  sub_100007924();
  sub_100006C24((void *)&_mh_execute_header, v0, v1, "%s: Failed to deserialize removability metadata for identity %@, version %lu", v2);
}

void sub_100091268()
{
  int v2 = 136315650;
  sub_100006C08();
  sub_100006C24((void *)&_mh_execute_header, v0, v1, "%s: Deserialized key for removability entry is not string %@ : %@", v2);
}

void sub_1000912DC()
{
  sub_100007924();
  sub_100009550((void *)&_mh_execute_header, v0, v1, "%s: Failed to deserialize removability entry: %@", v2, v3, v4, v5, 2u);
}

void sub_100091350()
{
  sub_100007924();
  sub_100009550((void *)&_mh_execute_header, v0, v1, "%s: Failed to deserialize removability entry: %@", v2, v3, v4, v5, 2u);
}

void sub_1000913C4()
{
  v1[0] = 136315650;
  sub_100006C08();
  _os_log_error_impl((void *)&_mh_execute_header, v0, OS_LOG_TYPE_ERROR, "%s: Failed to retrieve application record for bundleID: %@ : %@", (uint8_t *)v1, 0x20u);
}

void sub_100091448()
{
  v1[0] = 136315650;
  sub_100006C08();
  _os_log_debug_impl((void *)&_mh_execute_header, v0, OS_LOG_TYPE_DEBUG, "%s: Resolved persona %@ for bundleID %@", (uint8_t *)v1, 0x20u);
}

void sub_1000914CC(os_log_t log)
{
  int v1 = 136315138;
  uint64_t v2 = "IXCreateUserPresentableError";
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "%s: Client attempted to create IXUserPresentableError with invalid code (kIXUserPresentableUnknownError)", (uint8_t *)&v1, 0xCu);
}

void sub_100091550(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_1000915D4(uint64_t a1, NSObject *a2)
{
  int v2 = 136315650;
  uint64_t v3 = "-[IXSDefaultAppDeletionManager getOtherAppsAreInstalled:forDefaultAppType:exceptBundleID:error:]";
  __int16 v4 = 2048;
  uint64_t v5 = a1;
  __int16 v6 = 2112;
  uint64_t v7 = 0;
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "%s: Found invalid LS category for default app type %lu : %@", (uint8_t *)&v2, 0x20u);
}

void sub_10009166C()
{
  sub_100007924();
  sub_100009550((void *)&_mh_execute_header, v0, v1, "%s: Failed to get list of preferred app marketplaces : %@", v2, v3, v4, v5, 2u);
}

void sub_1000916E0(os_log_t log)
{
  int v1 = 136315138;
  uint64_t v2 = "-[IXSDefaultAppDeletionManager _shouldGateDeletionForAppType:]";
  _os_log_fault_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_FAULT, "%s: Failed to determine whether app type needs to gate deletion of last default app", (uint8_t *)&v1, 0xCu);
}

void sub_100091764()
{
  sub_100007924();
  sub_100009550((void *)&_mh_execute_header, v0, v1, "%s: Failed to get list of preferred app marketplaces : %@", v2, v3, v4, v5, 2u);
}

void sub_1000917D8()
{
  v3[0] = 136315650;
  sub_100007924();
  __int16 v4 = v0;
  uint64_t v5 = v1;
  _os_log_error_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_ERROR, "%s: Failed to find default app categories applicable to bundleID %@ : %@", (uint8_t *)v3, 0x20u);
}

void sub_100091864()
{
  sub_100029E6C();
  uint64_t v1 = [v0 path];
  sub_100029E18();
  sub_10000487C((void *)&_mh_execute_header, v2, v3, "%s: Failed to deserialize serialized data at %@ : %@", v4, v5, v6, v7, 2u);
}

void sub_1000918FC(uint64_t a1, uint64_t a2, os_log_t log)
{
  int v3 = 136315650;
  uint64_t v4 = "-[IXSPendingOperationsTracker _deserializeKeyedArchiveFromData:atURL:]";
  __int16 v5 = 2112;
  uint64_t v6 = a1;
  __int16 v7 = 2112;
  uint64_t v8 = a2;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "%s: Failed to unarchive identities from pending work sentinel file at %@ : %@", (uint8_t *)&v3, 0x20u);
}

void sub_100091994()
{
  sub_100029E6C();
  uint64_t v1 = [v0 path];
  sub_100029E18();
  sub_10000487C((void *)&_mh_execute_header, v2, v3, "%s: Failed to read pending work sentinel file from %@ : %@", v4, v5, v6, v7, 2u);
}

void sub_100091A2C()
{
  sub_100029E6C();
  uint64_t v1 = [v0 path];
  sub_100029E18();
  sub_10000487C((void *)&_mh_execute_header, v2, v3, "%s: Failed to remove pending work sentinel file at %@ : %@", v4, v5, v6, v7, 2u);
}

void sub_100091AC4(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_100091B44()
{
  sub_100029E6C();
  uint64_t v1 = [v0 path];
  sub_100029E18();
  sub_10000487C((void *)&_mh_execute_header, v2, v3, "%s: Failed to write pending work sentinel file to %@ : %@", v4, v5, v6, v7, 2u);
}

void sub_100091BDC()
{
  sub_10003B028();
  sub_100009550((void *)&_mh_execute_header, v0, v1, "%s: Attempting to begin pending operation for identity %@ but operation was already pending.", v2, v3, v4, v5, 2u);
}

void sub_100091C54()
{
  sub_10003B028();
  sub_100009550((void *)&_mh_execute_header, v0, v1, "%s: Attempting to end pending operation for identity %@ but operation wasn't already pending.", v2, v3, v4, v5, 2u);
}

void sub_100091CCC()
{
  sub_100029E6C();
  uint64_t v1 = [v0 path];
  sub_100029E18();
  sub_10000487C((void *)&_mh_execute_header, v2, v3, "%s: Failed to remove pending state at %@ : %@", v4, v5, v6, v7, 2u);
}

void sub_100091D64(uint64_t a1, uint64_t a2, NSObject *a3)
{
  id v5 = [*(id *)(a1 + 32) fileSystemRepresentation];
  int v6 = 136315650;
  uint64_t v7 = "IXUrlsForItemsInDirectoryAtURL_block_invoke";
  __int16 v8 = 2080;
  id v9 = v5;
  __int16 v10 = 2080;
  uint64_t v11 = a2;
  _os_log_debug_impl((void *)&_mh_execute_header, a3, OS_LOG_TYPE_DEBUG, "%s: Ignoring symlink at %s/%s", (uint8_t *)&v6, 0x20u);
}

void sub_100091E18(uint64_t a1, uint64_t a2, os_log_t log)
{
  int v3 = 136315906;
  uint64_t v4 = "IXEncodeRootObject";
  __int16 v5 = 2112;
  uint64_t v6 = a1;
  __int16 v7 = 2112;
  uint64_t v8 = a2;
  __int16 v9 = 2112;
  uint64_t v10 = 0;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "%s: Got exception while trying to encode object %@ : %@ : %@", (uint8_t *)&v3, 0x2Au);
}

void sub_100091EB8(void *a1, uint64_t a2, NSObject *a3)
{
  __int16 v5 = [a1 path];
  int v6 = 136315650;
  __int16 v7 = "-[IXFileManager _moveItemAtURL:toURL:failIfSrcMissing:error:]";
  __int16 v8 = 2112;
  __int16 v9 = v5;
  __int16 v10 = 2112;
  uint64_t v11 = a2;
  _os_log_error_impl((void *)&_mh_execute_header, a3, OS_LOG_TYPE_ERROR, "%s: Failed to remove move source after copy at %@ : %@", (uint8_t *)&v6, 0x20u);
}

void sub_100091F78(void *a1)
{
  unint64_t v2 = *__error();
  int v3 = __error();
  uint64_t v4 = strerror(*v3);
  uint64_t v14 = sub_10003DAE4((uint64_t)"-[IXFileManager _removeACLAtPath:isDir:error:]", 257, a1, v2, 0, 0, @"acl_init() failed: %s", v5, (uint64_t)v4);
  sub_100041300((void *)&_mh_execute_header, v6, v7, "%s: Failed to remove ACL : %@", v8, v9, v10, v11, v12, v13, 2u);
}

void sub_100092058()
{
  sub_100041334();
  __error();
  uint64_t v1 = __error();
  uint64_t v18 = strerror(*v1);
  sub_100041320();
  int v10 = sub_10003DAE4(v2, v3, v4, v5, v6, v7, v8, v9, v0);
  sub_1000412E8();
  sub_100041300((void *)&_mh_execute_header, v11, v12, "%s: Failed to remove ACL : %@", v13, v14, v15, v16, v17, (uint64_t)v18, v19);
}

void sub_100092118()
{
  sub_100041334();
  __error();
  uint64_t v1 = __error();
  uint64_t v18 = strerror(*v1);
  sub_100041320();
  int v10 = sub_10003DAE4(v2, v3, v4, v5, v6, v7, v8, v9, v0);
  sub_1000412E8();
  sub_100041300((void *)&_mh_execute_header, v11, v12, "%s: Failed to remove ACL : %@", v13, v14, v15, v16, v17, (uint64_t)v18, v19);
}

void sub_1000921D8()
{
  sub_100041334();
  __error();
  uint64_t v1 = __error();
  uint64_t v18 = strerror(*v1);
  sub_100041320();
  int v10 = sub_10003DAE4(v2, v3, v4, v5, v6, v7, v8, v9, v0);
  sub_1000412E8();
  sub_100041300((void *)&_mh_execute_header, v11, v12, "%s: Failed to remove ACL : %@", v13, v14, v15, v16, v17, (uint64_t)v18, v19);
}

void sub_100092298()
{
  sub_100041334();
  __error();
  uint64_t v1 = __error();
  uint64_t v18 = strerror(*v1);
  sub_100041320();
  int v10 = sub_10003DAE4(v2, v3, v4, v5, v6, v7, v8, v9, v0);
  sub_1000412E8();
  sub_100041300((void *)&_mh_execute_header, v11, v12, "%s: Failed to remove ACL : %@", v13, v14, v15, v16, v17, (uint64_t)v18, v19);
}

void sub_100092358()
{
  sub_100041334();
  __error();
  uint64_t v1 = __error();
  uint64_t v18 = strerror(*v1);
  sub_100041320();
  int v10 = sub_10003DAE4(v2, v3, v4, v5, v6, v7, v8, v9, v0);
  sub_1000412E8();
  sub_100041300((void *)&_mh_execute_header, v11, v12, "%s: Failed to remove ACL : %@", v13, v14, v15, v16, v17, (uint64_t)v18, v19);
}

void sub_100092418(uint64_t a1, NSObject *a2)
{
  int v2 = 136315394;
  uint64_t v3 = "-[IXFileManager copyACLFrom:toAllChildrenOfPath:ignoringCopyErrors:error:]_block_invoke";
  __int16 v4 = 2080;
  uint64_t v5 = a1;
  _os_log_debug_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_DEBUG, "%s: Writing ACL to %s", (uint8_t *)&v2, 0x16u);
}

void sub_1000924A4(void *a1, NSObject *a2)
{
  uint64_t v3 = [a1 bundleIdentifier];
  v4[0] = 136315650;
  sub_10001C05C();
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "%s: App with bundle ID %@ cannot be uninstalled : %@", (uint8_t *)v4, 0x20u);
}

void sub_100092544()
{
  v1[0] = 136315650;
  sub_10001C05C();
  _os_log_error_impl((void *)&_mh_execute_header, v0, OS_LOG_TYPE_ERROR, "%s: Invalid response received from CFUserNotification: %@ : %@", (uint8_t *)v1, 0x20u);
}

void sub_1000925C4()
{
  v2[0] = 136315906;
  sub_100006C08();
  __int16 v3 = v0;
  uint64_t v4 = 0;
  _os_log_error_impl((void *)&_mh_execute_header, v1, OS_LOG_TYPE_ERROR, "%s: Invalid response received for %@ key: %@ : %@", (uint8_t *)v2, 0x2Au);
}

void sub_100092650(void *a1, uint64_t a2, NSObject *a3)
{
  int v6 = [a1 typeDescription];
  int v7 = [a1 bundleIdentifier];
  int v8 = 136316162;
  uint64_t v9 = "-[IXSUninstallAlert _processUserNotification:withConfiguration:response:completion:]";
  __int16 v10 = 2048;
  uint64_t v11 = a2;
  __int16 v12 = 2112;
  int v13 = v6;
  __int16 v14 = 2112;
  int v15 = v7;
  __int16 v16 = 2112;
  uint64_t v17 = 0;
  _os_log_error_impl((void *)&_mh_execute_header, a3, OS_LOG_TYPE_ERROR, "%s: Received unknown response %lx from the %@ uninstall alert for app with bundleID %@ : %@", (uint8_t *)&v8, 0x34u);
}

void sub_10009273C(void *a1)
{
  int v2 = [a1 typeDescription];
  uint64_t v9 = [a1 bundleIdentifier];
  sub_100043498((void *)&_mh_execute_header, v3, v4, "%s: Failed to create %@ uninstall alert for app with bundle ID %@, error code %d : %@", v5, v6, v7, v8, 2u);
}

void sub_10009281C(void *a1)
{
  int v2 = [a1 typeDescription];
  uint64_t v9 = [a1 bundleIdentifier];
  sub_100043498((void *)&_mh_execute_header, v3, v4, "%s: Failed to recieve notification response for %@ uninstall alert for app with bundle ID %@, Response: %d : %@", v5, v6, v7, v8, 2u);
}

void sub_1000928F8()
{
  v1[0] = 136315650;
  sub_100006C08();
  _os_log_error_impl((void *)&_mh_execute_header, v0, OS_LOG_TYPE_ERROR, "%s: Failed to open URL %@ : %@", (uint8_t *)v1, 0x20u);
}

void sub_10009297C()
{
  int v2 = 136315650;
  sub_100007924();
  sub_100006C24((void *)&_mh_execute_header, v0, v1, "%s: Failed to get localized name for bundleID %@: %@", v2);
}

void sub_1000929F8()
{
  v1[0] = 136315394;
  sub_100007924();
  _os_log_error_impl((void *)&_mh_execute_header, v0, OS_LOG_TYPE_ERROR, "%s: Failed to get list of preferred app marketplaces : %@", (uint8_t *)v1, 0x16u);
}

void sub_100092A78()
{
  v1[0] = 136315394;
  sub_100007924();
  _os_log_error_impl((void *)&_mh_execute_header, v0, OS_LOG_TYPE_ERROR, "%s: Unexpectedly found empty list for preferred app marketplaces : %@", (uint8_t *)v1, 0x16u);
}

void sub_100092AF8(uint64_t a1, uint64_t a2, NSObject *a3)
{
  *(_DWORD *)uint64_t v3 = 136315650;
  *(void *)&void v3[4] = "-[IXSDefaultAppDownloadAlert openDefaultAppStoreWithError:]_block_invoke";
  *(_WORD *)&v3[12] = 2112;
  *(void *)&v3[14] = *(void *)(a1 + 32);
  *(_WORD *)&v3[22] = 2112;
  sub_100006C24((void *)&_mh_execute_header, a2, a3, "%s: Failed to launch app with bundleID %@: %@", *(void *)v3, *(void *)&v3[8], *(void *)&v3[16], a2);
}

void sub_100092B84(void *a1, uint64_t a2, NSObject *a3)
{
  uint64_t v5 = [a1 path];
  uint64_t v6 = *(void *)(*(void *)(*(void *)a2 + 8) + 40);
  int v7 = 136315650;
  uint64_t v8 = "-[IXSPromisedInMemoryData initWithSeed:data:error:]_block_invoke";
  __int16 v9 = 2112;
  __int16 v10 = v5;
  __int16 v11 = 2112;
  uint64_t v12 = v6;
  _os_log_error_impl((void *)&_mh_execute_header, a3, OS_LOG_TYPE_ERROR, "%s: Could not write data promise data to disk at %@ : %@", (uint8_t *)&v7, 0x20u);
}

void sub_100092C50(void *a1, uint64_t a2, NSObject *a3)
{
  uint64_t v5 = [a1 uniqueIdentifier];
  v6[0] = 136315650;
  sub_10003104C();
  uint64_t v7 = a2;
  _os_log_error_impl((void *)&_mh_execute_header, a3, OS_LOG_TYPE_ERROR, "%s: Failed to submit background update request for %@ : %@", (uint8_t *)v6, 0x20u);
}

void sub_100092D00()
{
  v2[0] = 136315650;
  sub_10003104C();
  uint64_t v3 = v0;
  _os_log_debug_impl((void *)&_mh_execute_header, v1, OS_LOG_TYPE_DEBUG, "%s: Not re-submitting already scheduled task %@ : %@", (uint8_t *)v2, 0x20u);
}

void sub_100092D88(uint64_t *a1, NSObject *a2)
{
  uint64_t v2 = *a1;
  int v3 = 136315394;
  uint64_t v4 = "-[IXSAppUpdateScheduler removeUpdateRequestForCoordinatorUUID:]_block_invoke";
  __int16 v5 = 2112;
  uint64_t v6 = v2;
  _os_log_debug_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_DEBUG, "%s: Haven't found the task requested to be canceled for coordinator %@", (uint8_t *)&v3, 0x16u);
}

void sub_100092E18(uint64_t a1, NSObject *a2)
{
  int v2 = 136315394;
  int v3 = "-[IXSAppUpdateScheduler removeUpdateRequestForCoordinatorUUID:]_block_invoke";
  __int16 v4 = 2112;
  uint64_t v5 = a1;
  _os_log_debug_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_DEBUG, "%s: Removing scheduled app update activity: %@", (uint8_t *)&v2, 0x16u);
}

void sub_100092EA4(os_log_t log)
{
  int v1 = 136315138;
  int v2 = "-[IXSCoordinatedAppInstall initWithCoder:]";
  _os_log_fault_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_FAULT, "%s: Failed to deserialize IXAppInstallCoordinatorSeed", (uint8_t *)&v1, 0xCu);
}

void sub_100092F28()
{
  sub_10006469C();
  objc_msgSend((id)sub_100064690(v1, __stack_chk_guard), "identity");
  objc_claimAutoreleasedReturnValue();
  int v2 = [(id)sub_100064684() deviceSecurityPromiseUUID];
  sub_100064618();
  sub_100029E78((void *)&_mh_execute_header, v3, v4, "%s: %@: Failed to locate device security promise with UUID %@ after deserialization : %@", v5, v6, v7, v8, 2u);
}

void sub_100092FD0()
{
  sub_10006469C();
  objc_msgSend((id)sub_100064690(v1, __stack_chk_guard), "identity");
  objc_claimAutoreleasedReturnValue();
  int v2 = [(id)sub_100064684() installOptionsPromiseUUID];
  sub_100064618();
  sub_100029E78((void *)&_mh_execute_header, v3, v4, "%s: %@: Failed to locate install options promise with UUID %@ after deserialization : %@", v5, v6, v7, v8, 2u);
}

void sub_100093078()
{
  sub_10006469C();
  objc_msgSend((id)sub_100064690(v1, __stack_chk_guard), "identity");
  objc_claimAutoreleasedReturnValue();
  int v2 = [(id)sub_100064684() preparationPromiseUUID];
  sub_100064618();
  sub_100029E78((void *)&_mh_execute_header, v3, v4, "%s: %@: Failed to locate preparation promise with UUID %@ after deserialization : %@", v5, v6, v7, v8, 2u);
}

void sub_100093120()
{
  sub_10006469C();
  objc_msgSend((id)sub_100064690(v1, __stack_chk_guard), "identity");
  objc_claimAutoreleasedReturnValue();
  int v2 = [(id)sub_100064684() userDataPromiseUUID];
  sub_100064618();
  sub_100029E78((void *)&_mh_execute_header, v3, v4, "%s: %@: Failed to locate user data promise with UUID %@ after deserialization : %@", v5, v6, v7, v8, 2u);
}

void sub_1000931C8()
{
  sub_10006469C();
  objc_msgSend((id)sub_100064690(v1, __stack_chk_guard), "identity");
  objc_claimAutoreleasedReturnValue();
  int v2 = [(id)sub_100064684() appAssetPromiseUUID];
  sub_100064618();
  sub_100029E78((void *)&_mh_execute_header, v3, v4, "%s: %@: Failed to locate app asset promise with UUID %@ after deserialization : %@", v5, v6, v7, v8, 2u);
}

void sub_100093270()
{
  sub_10006469C();
  objc_msgSend((id)sub_100064690(v1, __stack_chk_guard), "identity");
  objc_claimAutoreleasedReturnValue();
  int v2 = [(id)sub_100064684() placeholderPromiseUUID];
  sub_100064618();
  sub_100029E78((void *)&_mh_execute_header, v3, v4, "%s: %@: Failed to locate IXSPlaceholder instance with UUID %@ after deserialization : %@", v5, v6, v7, v8, 2u);
}

void sub_100093318()
{
  v1[0] = 136315394;
  sub_100007924();
  _os_log_fault_impl((void *)&_mh_execute_header, v0, OS_LOG_TYPE_FAULT, "%s: Attempting to set the same termination assertion for %@", (uint8_t *)v1, 0x16u);
}

void sub_100093398(void *a1)
{
  uint64_t v1 = [a1 identity];
  sub_100007924();
  sub_100029DF8((void *)&_mh_execute_header, v2, v3, "%s: Coordinator for %@ waiting for first unlock.", v4, v5, v6, v7, 2u);
}

void sub_10009342C()
{
  sub_10006463C();
  sub_100009550((void *)&_mh_execute_header, v0, v1, "%s: Unexpected post processing assertion state: %lu", v2, v3, v4, v5, 2u);
}

void sub_1000934A8()
{
  sub_10006463C();
  sub_100009550((void *)&_mh_execute_header, v0, v1, "%s: Unexpected app install state: %lu", v2, v3, v4, v5, 2u);
}

void sub_100093524()
{
  sub_10006463C();
  sub_100009550((void *)&_mh_execute_header, v0, v1, "%s: Unexpected placeholder install state: %lu", v2, v3, v4, v5, 2u);
}

void sub_1000935A0()
{
  sub_1000646C4(__stack_chk_guard);
  v1[0] = 136315650;
  sub_10001C0E4();
  sub_10001C0B0((void *)&_mh_execute_header, v0, (uint64_t)v0, "%s: Failed to register placeholder for %@; attempting to continue...(Error: %@)",
    (uint8_t *)v1);
}

void sub_100093620(os_log_t log)
{
  int v1 = 136315138;
  uint64_t v2 = "-[IXSCoordinatedAppInstall _eligibleToScheduleUpdate]";
  _os_log_debug_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_DEBUG, "%s: Update scheduling is not supported", (uint8_t *)&v1, 0xCu);
}

void sub_1000936A4()
{
  sub_100007924();
  sub_1000646A8((void *)&_mh_execute_header, v0, v1, "%s: Failed to schedule update activity: %@. Executing it right away.", v2, v3, v4, v5, 2u);
}

void sub_100093718()
{
  sub_100007924();
  sub_100009550((void *)&_mh_execute_header, v0, v1, "%s: Failed to acquire termination assertion : %@", v2, v3, v4, v5, 2u);
}

void sub_10009378C()
{
  v1[0] = 136315650;
  sub_100006C08();
  sub_1000646D0((void *)&_mh_execute_header, v0, (uint64_t)v0, "%s: %@: Failed to take out a new termination assertion to allow post-processing extensions to run. Dropping existing termination assertion: %@", (uint8_t *)v1);
}

void sub_100093808()
{
  v1[0] = 136315650;
  sub_100006C08();
  sub_10001C0B0((void *)&_mh_execute_header, v0, (uint64_t)v0, "%s: Cancelling %@ because we failed to acquire a termination assertion even after retrying : %@", (uint8_t *)v1);
}

void sub_100093884()
{
  v1[0] = 136315650;
  sub_100006C08();
  sub_10001C0B0((void *)&_mh_execute_header, v0, (uint64_t)v0, "%s: Cancelling %@ because we failed to acquire a termination assertion : %@", (uint8_t *)v1);
}

void sub_100093900()
{
  sub_100029E6C();
  uint64_t v2 = [v1 path];
  v4[0] = 136315650;
  sub_100029E18();
  sub_10001C0B0((void *)&_mh_execute_header, v0, v3, "%s: Failed to remove target bundle %@ : %@", (uint8_t *)v4);
}

void sub_1000939A0()
{
  sub_100029E6C();
  uint64_t v2 = [*v1 identity];
  uint64_t v3 = [v2 bundleID];
  v5[0] = 136315650;
  sub_100029E18();
  sub_10001C0B0((void *)&_mh_execute_header, v0, v4, "%s: Failed to send LSApplicationNotificationTypeApplicationWillBeUpdated notification for %@ : %@", (uint8_t *)v5);
}

void sub_100093A54()
{
  sub_100029E6C();
  uint64_t v2 = [*v1 identity];
  uint64_t v3 = [v2 bundleID];
  v5[0] = 136315650;
  sub_100029E18();
  sub_10001C0B0((void *)&_mh_execute_header, v0, v4, "%s: Failed to send LSApplicationNotificationTypeApplicationWillBeDowngraded notification for %@ : %@", (uint8_t *)v5);
}

void sub_100093B08(void *a1, NSObject *a2)
{
  uint64_t v3 = [a1 identity];
  v5[0] = 136315650;
  sub_10001C05C();
  sub_10001C0B0((void *)&_mh_execute_header, a2, v4, "%s: Placeholder installation failed but we received a nil error object when installing %@ : %@", (uint8_t *)v5);
}

void sub_100093BA0(uint64_t a1, NSObject *a2, uint64_t a3)
{
  int v3 = 136315650;
  uint64_t v4 = "-[IXSCoordinatedAppInstall _finishPlaceholderInstallAtURL:result:recordPromise:error:]";
  __int16 v5 = 2048;
  uint64_t v6 = 15;
  __int16 v7 = 2112;
  uint64_t v8 = a1;
  sub_1000646D0((void *)&_mh_execute_header, a2, a3, "%s: Timed out after waiting %lld seconds for CacheDelete to purge data containers when demoting %@", (uint8_t *)&v3);
}

void sub_100093C34()
{
  sub_1000646C4(__stack_chk_guard);
  sub_100009550((void *)&_mh_execute_header, v0, v1, "%s: %@: placeholder promise was unexpectedly missing after placeholder install completed", v2, v3, v4, v5, 2u);
}

void sub_100093CB4()
{
  v1[0] = 136315650;
  sub_100006C08();
  sub_10001C0B0((void *)&_mh_execute_header, v0, (uint64_t)v0, "%s: No LSApplicationRecord found for %@ during demotion : %@", (uint8_t *)v1);
}

void sub_100093D30()
{
  sub_10001C05C();
  sub_10001C078((void *)&_mh_execute_header, v0, v1, "%s: Cannot demote app with identity %@ because it is a placeholder : %@", v2, v3, v4, v5, 2u);
}

void sub_100093DA4()
{
  sub_10001C05C();
  sub_10001C078((void *)&_mh_execute_header, v0, v1, "%s: LSApplicationRecord for %@ did not contain a bundleContainerURL during demotion : %@", v2, v3, v4, v5, 2u);
}

void sub_100093E18()
{
  sub_10001C05C();
  sub_10001C078((void *)&_mh_execute_header, v0, v1, "%s: Placeholder was nil when we went to install it for %@ : %@", v2, v3, v4, v5, 2u);
}

void sub_100093E8C()
{
  sub_10001C05C();
  sub_10001C078((void *)&_mh_execute_header, v0, v1, "%s: Placeholder promise was not complete when we went to install it for %@ : %@", v2, v3, v4, v5, 2u);
}

void sub_100093F00()
{
  sub_10001C05C();
  sub_10001C078((void *)&_mh_execute_header, v0, v1, "%s: Placeholder promise was nil when we went to install it for %@ : %@", v2, v3, v4, v5, 2u);
}

void sub_100093F74()
{
  sub_10001C05C();
  sub_10001C078((void *)&_mh_execute_header, v0, v1, "%s: Canceling placeholder installation for %@ because IXGizmoInstallingAppInstallCoordinator is not supported on this device. : %@", v2, v3, v4, v5, 2u);
}

void sub_100093FE8()
{
  sub_10001C05C();
  sub_10001C078((void *)&_mh_execute_header, v0, v1, "%s: Canceling placeholder installation for %@ because IXGizmoInstallingAppInstallCoordinator failed to find gizmo pairing ID. : %@", v2, v3, v4, v5, 2u);
}

void sub_10009405C(void *a1, NSObject *a2)
{
  [a1 placeholderInstallState];
  v4[0] = 136315650;
  sub_100064664();
  sub_10001C0B0((void *)&_mh_execute_header, a2, v3, "%s: Expected to have not yet begun placeholder install or waiting/pending assertion acquisition but state was %lu : %@", (uint8_t *)v4);
}

void sub_1000940E8()
{
  sub_10000953C();
  sub_100009550((void *)&_mh_execute_header, v0, v1, "%s: Install options promise unexpectedly returned nil staged path. : %@", v2, v3, v4, v5, 2u);
}

void sub_100094160(void *a1, uint64_t a2, uint64_t a3, NSObject *a4)
{
  *(_DWORD *)a3 = 136315650;
  *(void *)(a3 + 4) = "+[IXSCoordinatedAppInstall _fetchInstallOptionsFromPromise:error:]";
  *(_WORD *)(a3 + 12) = 2112;
  *(void *)(a3 + 14) = a1;
  *(_WORD *)(a3 + 22) = 2112;
  *(void *)(a3 + 24) = a2;
  sub_10001C0B0((void *)&_mh_execute_header, a4, a3, "%s: Unable to read install options serialized data from %@ : %@", (uint8_t *)a3);
}

void sub_1000941D0()
{
  sub_100007924();
  sub_100009550((void *)&_mh_execute_header, v0, v1, "%s: Failed to create unarchiver for install options data : %@", v2, v3, v4, v5, 2u);
}

void sub_100094244(void *a1, _DWORD *a2)
{
  *a2 = 136315394;
  sub_1000646E8((uint64_t)a1, (uint64_t)a2, (uint64_t)"+[IXSCoordinatedAppInstall _fetchInstallOptionsFromPromise:error:]");
  _os_log_error_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_ERROR, "%s: Failed to unarchive install options data : %@", v4, 0x16u);
}

void sub_1000942A4()
{
  sub_10000953C();
  sub_100009550((void *)&_mh_execute_header, v0, v1, "%s: Installation failed but we received a nil error error object : %@", v2, v3, v4, v5, 2u);
}

void sub_10009431C()
{
  sub_10001C05C();
  sub_10001C078((void *)&_mh_execute_header, v0, v1, "%s: App asset was nil when we went to install it for %@ : %@", v2, v3, v4, v5, 2u);
}

void sub_100094390()
{
  sub_10001C05C();
  sub_10001C078((void *)&_mh_execute_header, v0, v1, "%s: Canceling installation for %@ because IXGizmoInstallingAppInstallCoordinator is not supported on this device. : %@", v2, v3, v4, v5, 2u);
}

void sub_100094404()
{
  sub_10001C05C();
  sub_10001C078((void *)&_mh_execute_header, v0, v1, "%s: Canceling installation for %@ because IXGizmoInstallingAppInstallCoordinator failed to find gizmo pairing ID. : %@", v2, v3, v4, v5, 2u);
}

void sub_100094478()
{
  sub_1000646C4(__stack_chk_guard);
  v1[0] = 136315650;
  sub_10001C0E4();
  sub_10001C0B0((void *)&_mh_execute_header, v0, (uint64_t)v0, "%s: Failed to get app LSRecordPromise for %@: %@", (uint8_t *)v1);
}

void sub_1000944F4(void *a1, NSObject *a2)
{
  [a1 appInstallState];
  v4[0] = 136315650;
  sub_100064664();
  sub_10001C0B0((void *)&_mh_execute_header, a2, v3, "%s: Expected to have not yet begun app install or waiting/pending assertion acquisition but state was %lu : %@", (uint8_t *)v4);
}

void sub_100094580()
{
  sub_100029E6C();
  uint64_t v1 = [v0 bundleID];
  sub_100029E18();
  sub_100029E78((void *)&_mh_execute_header, v2, v3, "%s: Ignoring attempt to set a placeholder promise with bundle ID %@ on coordinator with different bundle id %@ : %@", v4, v5, v6, v7, 2u);
}

void sub_100094620()
{
  sub_1000646C4(__stack_chk_guard);
  v1[0] = 136315650;
  sub_10001C0E4();
  sub_10001C0B0((void *)&_mh_execute_header, v0, (uint64_t)v0, "%s: Failed to get LSRecordPromise for %@: %@", (uint8_t *)v1);
}

void sub_10009469C()
{
  sub_100007924();
  sub_1000646A8((void *)&_mh_execute_header, v0, v1, "%s: Failed to create a LS record: %@", v2, v3, v4, v5, 2u);
}

void sub_100094710()
{
  sub_10000953C();
  sub_100009550((void *)&_mh_execute_header, v0, v1, "%s: Reason passed to -[IXSCoordinatedAppInstall cancelForReason:] was nil : %@", v2, v3, v4, v5, 2u);
}

void sub_100094788(uint64_t a1, unint64_t *a2, NSObject *a3)
{
  uint64_t v4 = sub_10005A5BC(*a2);
  v6[0] = 136315650;
  sub_10002E754();
  sub_1000646D0((void *)&_mh_execute_header, a3, v5, "%s: Attempting to fetch progress for %@ during a phase that does not support progress: %@", (uint8_t *)v6);
}

void sub_100094830()
{
  sub_100029E6C();
  uint64_t v3 = +[NSString NSStringFromLSInstallPhase:v2];
  uint64_t v4 = [v1 identity];
  v6[0] = 136315650;
  sub_10002E754();
  sub_10001C0B0((void *)&_mh_execute_header, v0, v5, "%s: Failed to get %@ progress for %@", (uint8_t *)v6);
}

void sub_1000948F0(void *a1)
{
  uint64_t v1 = [a1 identity];
  sub_100007924();
  sub_100029DF8((void *)&_mh_execute_header, v2, v3, "%s: LS didn't return a placeholder/parallel placeholder for %@; no loading progress is available",
    v4,
    v5,
    v6,
    v7,
    2u);
}

void sub_100094980()
{
  sub_10006463C();
  sub_1000646A8((void *)&_mh_execute_header, v0, v1, "%s: Found no promises with total bytes set; faking for %llu promises",
    v2,
    v3,
    v4,
    v5,
    2u);
}

void sub_1000949FC(void *a1, uint64_t a2, NSObject *a3)
{
  uint64_t v5 = [a1 identity];
  v6[0] = 136315650;
  sub_100007924();
  __int16 v7 = 2048;
  uint64_t v8 = a2;
  _os_log_debug_impl((void *)&_mh_execute_header, a3, OS_LOG_TYPE_DEBUG, "%s: %@: Found %llu promises missing total bytes", (uint8_t *)v6, 0x20u);
}

void sub_100094AB8(uint64_t a1)
{
  uint64_t v1 = [*(id *)(a1 + 32) identity];
  sub_100007924();
  sub_100029DF8((void *)&_mh_execute_header, v2, v3, "%s: Not updating progress because %@ has no current progress", v4, v5, v6, v7, 2u);
}

void sub_100094B4C(void *a1)
{
  uint64_t v1 = [a1 identity];
  sub_100007924();
  sub_100029DF8((void *)&_mh_execute_header, v2, v3, "%s: LS didn't return a placeholder/parallel placeholder for %@ so installing progress is not available", v4, v5, v6, v7, 2u);
}

void sub_100094BDC(void *a1)
{
  uint64_t v1 = [a1 identity];
  sub_100007924();
  sub_100029DF8((void *)&_mh_execute_header, v2, v3, "%s: LS didn't return a placeholder/parallel placeholder for %@ so post processing progress is not available", v4, v5, v6, v7, 2u);
}

void sub_100094C6C(uint64_t a1)
{
  uint64_t v1 = [*(id *)(a1 + 32) identity];
  sub_100007924();
  sub_100029DF8((void *)&_mh_execute_header, v2, v3, "%s: Not updating progress because %@ has no current progress", v4, v5, v6, v7, 2u);
}

void sub_100094D00()
{
  sub_1000646C4(__stack_chk_guard);
  int v3 = 136315650;
  uint64_t v4 = "-[IXSCoordinatedAppInstall assertionTargetProcessDidExit:]_block_invoke";
  __int16 v5 = 2080;
  uint64_t v6 = "-[IXSCoordinatedAppInstall assertionTargetProcessDidExit:]_block_invoke";
  __int16 v7 = 2112;
  uint64_t v8 = v0;
  sub_1000646D0((void *)&_mh_execute_header, v1, v2, "%s: %s called unexpectedly for %@", (uint8_t *)&v3);
}

void sub_100094D90()
{
  sub_10001C05C();
  sub_10001C078((void *)&_mh_execute_header, v0, v1, "%s: Failed to locate placeholder data promise with UUID %@ : %@", v2, v3, v4, v5, 2u);
}

void sub_100094E04()
{
  sub_100029E6C();
  uint64_t v2 = [v1 bundleID];
  uint64_t v3 = [v0 identity];
  sub_100064618();
  sub_100029E78((void *)&_mh_execute_header, v4, v5, "%s: Attempted to set placeholder promise with bundle ID %@ that does not match coordinator's identity %@ : %@", v6, v7, v8, v9, 2u);
}

void sub_100094EB0()
{
  sub_10001C05C();
  sub_10001C078((void *)&_mh_execute_header, v0, v1, "%s: Failed to locate app asset data promise with UUID %@ : %@", v2, v3, v4, v5, 2u);
}

void sub_100094F24()
{
  v2[0] = 136315906;
  sub_100006C08();
  __int16 v3 = v0;
  uint64_t v4 = 0;
  _os_log_error_impl((void *)&_mh_execute_header, v1, OS_LOG_TYPE_ERROR, "%s: Client attempted to set an app reference with identity %@ that did not match the coordinator's identity, %@ : %@", (uint8_t *)v2, 0x2Au);
}

void sub_100094FB0()
{
  sub_10001C05C();
  sub_10001C078((void *)&_mh_execute_header, v0, v1, "%s: Failed to locate install options promise with UUID %@ : %@", v2, v3, v4, v5, 2u);
}

void sub_100095024()
{
  sub_10001C05C();
  sub_10001C078((void *)&_mh_execute_header, v0, v1, "%s: Client attempted to set install options promise that was not complete: %@ : %@", v2, v3, v4, v5, 2u);
}

void sub_100095098()
{
  v1[0] = 136315650;
  sub_100006C08();
  sub_10001C0B0((void *)&_mh_execute_header, v0, (uint64_t)v0, "%s: Failed to decode MIInstallOptions from promise %@ : %@", (uint8_t *)v1);
}

void sub_100095114(void *a1, _DWORD *a2)
{
  *a2 = 136315650;
  sub_1000646E8((uint64_t)a1, (uint64_t)a2, (uint64_t)"-[IXSCoordinatedAppInstall(IPCMethods) _remote_setInstallOptionsPromiseUUID:forConnection:completion:]");
  *(_WORD *)(v3 + 22) = v4;
  *(void *)(v3 + 24) = 0;
  sub_10001C0B0((void *)&_mh_execute_header, v5, (uint64_t)v5, "%s: Client %@ attempted to set MIInstallOptions with the installationRequestorAuditToken property set, but did not have the required entitlement. : %@", v6);
}

void sub_100095174(unint64_t a1, NSObject *a2)
{
  IXStringForCoordinatorImportance(4uLL);
  id v4 = (id)objc_claimAutoreleasedReturnValue();
  if (a1 < 8 && ((0xFBu >> a1) & 1) != 0)
  {
    uint64_t v5 = *(&off_1000EAC00 + a1);
  }
  else
  {
    uint64_t v5 = +[NSString stringWithFormat:@"Unknown intent value %lu", a1];
  }
  *(_DWORD *)buf = 136315906;
  uint64_t v7 = "-[IXSCoordinatedAppInstall(IPCMethods) _remote_setImportance:completion:]";
  __int16 v8 = 2112;
  id v9 = v4;
  __int16 v10 = 2112;
  __int16 v11 = v5;
  __int16 v12 = 2112;
  uint64_t v13 = 0;
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "%s: Importance %@ isn't applicable to this coordinator with intent %@ : %@", buf, 0x2Au);
}

void sub_100095290()
{
  sub_10001C05C();
  sub_10001C078((void *)&_mh_execute_header, v0, v1, "%s: Could not find ODR promise with UUID %@ : %@", v2, v3, v4, v5, 2u);
}

void sub_100095304()
{
  sub_10001C05C();
  sub_10001C078((void *)&_mh_execute_header, v0, v1, "%s: Failed to locate user data promise with UUID %@ : %@", v2, v3, v4, v5, 2u);
}

void sub_100095378()
{
  sub_10001C05C();
  sub_10001C078((void *)&_mh_execute_header, v0, v1, "%s: Failed to locate preparation promise with UUID %@ : %@", v2, v3, v4, v5, 2u);
}

void sub_1000953EC()
{
  sub_10001C05C();
  sub_10001C078((void *)&_mh_execute_header, v0, v1, "%s: Failed to locate device security promise with UUID %@ : %@", v2, v3, v4, v5, 2u);
}

void sub_100095460(void *a1, NSObject *a2)
{
  id v3 = [a1 effectiveIntent];
  if ((unint64_t)v3 > 7)
  {
    uint64_t v4 = +[NSString stringWithFormat:@"Unknown intent value %lu", v3];
  }
  else
  {
    uint64_t v4 = *(&off_1000EAC40 + (void)v3);
  }
  v6[0] = 136315650;
  sub_100064648();
  sub_10001C0B0((void *)&_mh_execute_header, a2, v5, "%s: Coordinator with intent %@ does not support post processing. : %@", (uint8_t *)v6);
}

void sub_10009552C(void *a1, NSObject *a2)
{
  id v3 = [a1 effectiveIntent];
  if ((unint64_t)v3 > 7)
  {
    uint64_t v4 = +[NSString stringWithFormat:@"Unknown intent value %lu", v3];
  }
  else
  {
    uint64_t v4 = *(&off_1000EAC40 + (void)v3);
  }
  v6[0] = 136315650;
  sub_100064648();
  sub_10001C0B0((void *)&_mh_execute_header, a2, v5, "%s: Coordinator with intent %@ does not support post processing. : %@", (uint8_t *)v6);
}

void sub_1000955FC()
{
  sub_10001C05C();
  sub_10001C078((void *)&_mh_execute_header, v0, v1, "%s: Coordinator %@ does not have post processing enabled. : %@", v2, v3, v4, v5, 2u);
}

void sub_100095670()
{
  sub_10001C05C();
  sub_10001C078((void *)&_mh_execute_header, v0, v1, "%s: Could not find essential asset promise with UUID %@ : %@", v2, v3, v4, v5, 2u);
}

void sub_1000956E4()
{
  sub_10001C05C();
  sub_10001C078((void *)&_mh_execute_header, v0, v1, "%s: Coordinator %@ does not support post processing. : %@", v2, v3, v4, v5, 2u);
}

void sub_100095758()
{
  sub_10001C05C();
  sub_10001C078((void *)&_mh_execute_header, v0, v1, "%s: Coordinator %@ does not have post processing enabled. : %@", v2, v3, v4, v5, 2u);
}

void sub_1000957CC()
{
  sub_10001C05C();
  sub_10001C078((void *)&_mh_execute_header, v0, v1, "%s: Coordinator %@ does not support post processing. : %@", v2, v3, v4, v5, 2u);
}

void sub_100095840()
{
  sub_10001C05C();
  sub_10001C078((void *)&_mh_execute_header, v0, v1, "%s: Coordinator %@ does not have post processing enabled. : %@", v2, v3, v4, v5, 2u);
}

void sub_1000958B4()
{
  sub_10001C05C();
  sub_10001C078((void *)&_mh_execute_header, v0, v1, "%s: Coordinator %@ does not support post processing. : %@", v2, v3, v4, v5, 2u);
}

void sub_100095928(unint64_t a1, NSObject *a2)
{
  if (a1 > 7)
  {
    uint64_t v3 = +[NSString stringWithFormat:@"Unknown intent value %lu", a1];
  }
  else
  {
    uint64_t v3 = *(&off_1000EAC40 + a1);
  }
  v5[0] = 136315650;
  sub_100064648();
  sub_10001C0B0((void *)&_mh_execute_header, a2, v4, "%s: Placeholder disposition is not applicable to coordinator type %@. : %@", (uint8_t *)v5);
}

void sub_1000959F0(os_log_t log)
{
  int v1 = 136315138;
  uint64_t v2 = "-[IXSContentRestrictedAppDeleteAlert message]";
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "%s: Unsupported app type for content restriction based app deletion alert", (uint8_t *)&v1, 0xCu);
}

void sub_100095A74()
{
  v1[0] = 136315650;
  sub_10001C05C();
  _os_log_error_impl((void *)&_mh_execute_header, v0, OS_LOG_TYPE_ERROR, "%s: Failed to create termination assertion for identifier %@ : %@", (uint8_t *)v1, 0x20u);
}

void sub_100095AF4(uint64_t a1, uint64_t a2, NSObject *a3)
{
  *(_DWORD *)uint64_t v3 = 136315650;
  *(void *)&void v3[4] = "-[IXSContainerRefreshManager _onQueue_refreshContainerTypes:forAppWithIdentity:error:]";
  *(_WORD *)&v3[12] = 2112;
  *(void *)&v3[14] = a1;
  *(_WORD *)&v3[22] = 2112;
  sub_100006C24((void *)&_mh_execute_header, a2, a3, "%s: Failed to fetch application record for \"%@\" : %@", *(void *)v3, *(void *)&v3[8], *(void *)&v3[16], a2);
}

void sub_100095B7C()
{
  v1[0] = 136315650;
  sub_10001C05C();
  _os_log_error_impl((void *)&_mh_execute_header, v0, OS_LOG_TYPE_ERROR, "%s: Failed to create container query for %@ : %@", (uint8_t *)v1, 0x20u);
}

void sub_100095BFC()
{
  int v2 = 136315906;
  sub_100007924();
  sub_1000656E0();
  sub_1000656C0((void *)&_mh_execute_header, v0, v1, "%s: Failed to fetch container for identity \"%@\" of class %llu : %@", v2);
}

void sub_100095C78(uint64_t a1, uint64_t a2, NSObject *a3)
{
  *(_DWORD *)uint64_t v3 = 136315650;
  *(void *)&void v3[4] = "_ClearContainer";
  *(_WORD *)&v3[12] = 2080;
  *(void *)&v3[14] = a1;
  *(_WORD *)&v3[22] = 2112;
  sub_100006C24((void *)&_mh_execute_header, a2, a3, "%s: container_query_get_single_result failed : %s : %@", *(void *)v3, *(void *)&v3[8], *(void *)&v3[16], a2);
}

void sub_100095D04()
{
  int v2 = 136315906;
  sub_100007924();
  sub_1000656E0();
  sub_1000656C0((void *)&_mh_execute_header, v0, v1, "%s: Failed to wipe container for identifier \"%@\" : %s : %@", v2);
}

void sub_100095D80(void *a1, uint64_t a2, NSObject *a3)
{
  *(_DWORD *)uint64_t v3 = 136315906;
  *(void *)&void v3[4] = "-[IXSContainerRefreshManager refreshContainerTypes:forAppWithIdentity:reason:completion:]_block_invoke";
  *(_WORD *)&v3[12] = 2112;
  *(void *)&v3[14] = *a1;
  *(_WORD *)&v3[22] = 2112;
  __int16 v4 = 0;
  sub_1000656C0((void *)&_mh_execute_header, a2, a3, "%s: Failed to refresh container %@ because a coordinator already existed: %@ : %@", *(void *)v3, *(void *)&v3[8], *(void *)&v3[16], a2, 2112, v4);
}

void sub_100095E14(uint64_t a1, NSObject *a2)
{
  int v2 = 136315394;
  uint64_t v3 = "-[IXAppInstallCoordinatorSeed initWithCoder:]";
  __int16 v4 = 2112;
  uint64_t v5 = a1;
  _os_log_fault_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_FAULT, "%s: Both identity and bundleID were nil for %@", (uint8_t *)&v2, 0x16u);
}

void sub_100095EA0(uint64_t a1, uint64_t *a2, os_log_t log)
{
  uint64_t v3 = *a2;
  int v4 = 136315650;
  uint64_t v5 = "-[IXAppInstallCoordinatorSeed initWithCoder:]";
  __int16 v6 = 2112;
  uint64_t v7 = a1;
  __int16 v8 = 2112;
  uint64_t v9 = v3;
  _os_log_fault_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_FAULT, "%s: Identity was nil when deserializing IXAppInstallCoordinatorSeed for bundle ID %@ with unique identifier %@", (uint8_t *)&v4, 0x20u);
}

void sub_100095F3C(uint64_t a1, NSObject *a2)
{
  int v2 = 136315394;
  uint64_t v3 = "+[IXSHealthKitDataUninstallAlert openHealthKitClasses]_block_invoke";
  __int16 v4 = 2080;
  uint64_t v5 = a1;
  _os_log_fault_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_FAULT, "%s: Failed to open HealthKit framework: %s", (uint8_t *)&v2, 0x16u);
}

void sub_100095FC8(os_log_t log)
{
  int v1 = 136315906;
  int v2 = "+[IXSHealthKitDataUninstallAlert openHealthKitClasses]_block_invoke";
  __int16 v3 = 2048;
  uint64_t v4 = qword_100109F68;
  __int16 v5 = 2048;
  uint64_t v6 = qword_100109F70;
  __int16 v7 = 2048;
  uint64_t v8 = qword_100109F78;
  _os_log_fault_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_FAULT, "%s: Failed to load expected classes from HealthKit.framework: HKHealthStore : %p, HKSourceStore : %p, _HKBehavior : %p", (uint8_t *)&v1, 0x2Au);
}

void sub_100096078(uint64_t a1, uint64_t a2, os_log_t log)
{
  uint64_t v3 = *(void *)(a1 + 32);
  int v4 = 136315650;
  __int16 v5 = "+[IXSHealthKitDataUninstallAlert healthKitDataPresentForAppWithBundleID:completion:]_block_invoke";
  __int16 v6 = 2112;
  uint64_t v7 = v3;
  __int16 v8 = 2112;
  uint64_t v9 = a2;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "%s: Failed to determine if HealthKit data was present for app with bundle ID %@: %@", (uint8_t *)&v4, 0x20u);
}

void sub_100096114()
{
  sub_10001C114();
  sub_10001C0C8((void *)&_mh_execute_header, v0, v1, "%s: Failed to open IMCore framework: %s", v2, v3, v4, v5, 2u);
}

void sub_100096188(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_100096214()
{
  sub_10001C114();
  sub_10001C0C8((void *)&_mh_execute_header, v0, v1, "%s: Failed to open Photos framework: %s", v2, v3, v4, v5, 2u);
}

void sub_100096288(os_log_t log)
{
  int v1 = 136315650;
  uint64_t v2 = "+[IXSRemoteDeletionPromptManager sharedInstance]_block_invoke";
  __int16 v3 = 2048;
  uint64_t v4 = qword_100109FA0;
  __int16 v5 = 2048;
  uint64_t v6 = qword_100109F98;
  _os_log_fault_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_FAULT, "%s: Failed to load expected classes from Photos.framework: PHPhotoLibrary : %p, PHAsset : %p", (uint8_t *)&v1, 0x20u);
}

void sub_10009632C(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
    a5,
    a6,
    a7,
    a8,
    2u);
}

void sub_1000963A4(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_10009641C(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_100096494(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_10009650C(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_100096584(uint64_t a1, NSObject *a2)
{
  int v2 = 136315394;
  __int16 v3 = "-[IXSRemoteDeletionPromptManager _constructRelevantAppData:showArchiveOption:]";
  __int16 v4 = 2112;
  uint64_t v5 = a1;
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "%s: Failed to find SAD App Type for bundleID %@", (uint8_t *)&v2, 0x16u);
}

void sub_100096610(os_log_t log)
{
  int v1 = 136315394;
  int v2 = "-[IXSRemoteDeletionPromptManager displayDeletionAlertForRecord:showArchiveOption:completion:]";
  __int16 v3 = 2112;
  uint64_t v4 = 0;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "%s: Failed to construct alert relevant data : %@", (uint8_t *)&v1, 0x16u);
}

void sub_1000966A0(void *a1, uint64_t a2, NSObject *a3)
{
  uint64_t v6 = [a1 name];
  uint64_t v7 = [a1 bundleName];
  __int16 v8 = IXStringForClientID((unint64_t)[a1 creatorIdentifier]);
  v12[0] = 136316162;
  sub_100082A04();
  uint64_t v13 = v7;
  __int16 v14 = v9;
  uint64_t v15 = v10;
  __int16 v16 = v9;
  uint64_t v17 = a2;
  sub_100082A34((void *)&_mh_execute_header, a3, v11, "%s: Failed to create placeholder data promise with name: %@ bundleName: %@ client: %@ : %@", (uint8_t *)v12);
}

void sub_100096794(void *a1, uint64_t a2, NSObject *a3)
{
  uint64_t v6 = [a1 name];
  uint64_t v7 = [a1 transferPath];
  __int16 v8 = [v7 path];
  __int16 v9 = IXStringForClientID((unint64_t)[a1 creatorIdentifier]);
  v13[0] = 136316162;
  sub_100082A04();
  __int16 v14 = v8;
  __int16 v15 = v10;
  uint64_t v16 = v11;
  __int16 v17 = v10;
  uint64_t v18 = a2;
  sub_100082A34((void *)&_mh_execute_header, a3, v12, "%s: Failed to create promised transfer to path data promise with name: %@ path: %@ client: %@ : %@", (uint8_t *)v13);
}

void sub_100096898()
{
  sub_1000829A4();
  [v1 name];
  objc_claimAutoreleasedReturnValue();
  id v2 = sub_100082A1C();
  __int16 v3 = IXStringForClientID((unint64_t)v2);
  sub_100082980();
  sub_100029E78((void *)&_mh_execute_header, v4, v5, "%s: Failed to create streaming zip transfer data promise with name: %@ client: %@ : %@", v6, v7, v8, v9, 2u);
}

void sub_100096944()
{
  sub_1000829A4();
  [v1 name];
  objc_claimAutoreleasedReturnValue();
  id v2 = sub_100082A1C();
  __int16 v3 = IXStringForClientID((unint64_t)v2);
  sub_100082980();
  sub_100029E78((void *)&_mh_execute_header, v4, v5, "%s: Failed to create in memory data promise with name: %@ client: %@ : %@", v6, v7, v8, v9, 2u);
}

void sub_1000969F0()
{
  sub_1000829A4();
  [v1 name];
  objc_claimAutoreleasedReturnValue();
  id v2 = sub_100082A1C();
  __int16 v3 = IXStringForClientID((unint64_t)v2);
  sub_100082980();
  sub_100029E78((void *)&_mh_execute_header, v4, v5, "%s: Failed to create in memory dictionary promise with name: %@ client: %@ : %@", v6, v7, v8, v9, 2u);
}

void sub_100096A9C()
{
  sub_1000829A4();
  [v1 name];
  objc_claimAutoreleasedReturnValue();
  id v2 = sub_100082A1C();
  __int16 v3 = IXStringForClientID((unint64_t)v2);
  sub_100082980();
  sub_100029E78((void *)&_mh_execute_header, v4, v5, "%s: Failed to create out of band transfer promise with name: %@ client: %@ : %@", v6, v7, v8, v9, 2u);
}

void sub_100096B48()
{
  sub_1000829A4();
  [v1 name];
  objc_claimAutoreleasedReturnValue();
  id v2 = sub_100082A1C();
  __int16 v3 = IXStringForClientID((unint64_t)v2);
  sub_100082980();
  sub_100029E78((void *)&_mh_execute_header, v4, v5, "%s: Failed to create out of band streaming zip transfer promise with name: %@ client: %@ : %@", v6, v7, v8, v9, 2u);
}

void sub_100096BF4()
{
  sub_100029E6C();
  id v1 = v0;
  id v2 = [v0 name];
  uint64_t v9 = IXStringForClientID((unint64_t)[v1 creatorIdentifier]);
  sub_100029E78((void *)&_mh_execute_header, v3, v4, "%s: Failed to create promised app reference with name: %@ client: %@ : %@", v5, v6, v7, v8, 2u);
}

void sub_100096CC4(void *a1, _DWORD *a2)
{
  *a2 = 136315650;
  sub_1000829E8((uint64_t)a1, (uint64_t)a2, (uint64_t)"-[IXSClientConnection _remote_createAppInstallCoordinatorWithSeed:createIfNotExisting:requireMatchingIntent:scopeRequirement:completion:]");
  sub_10001C0B0((void *)&_mh_execute_header, v3, (uint64_t)v3, "%s: Expected a non-nil identity from client: %@ : %@", v4);
}

void sub_100096D1C(void *a1, _DWORD *a2)
{
  *a2 = 136315650;
  sub_1000829E8((uint64_t)a1, (uint64_t)a2, (uint64_t)"-[IXSClientConnection _remote_createAppInstallCoordinatorWithSeed:createIfNotExisting:requireMatchingIntent:scopeRequirement:completion:]");
  sub_10001C0B0((void *)&_mh_execute_header, v3, (uint64_t)v3, "%s: Expected a non-nil bundleID from client: %@ : %@", v4);
}

void sub_100096D74()
{
  v2[0] = 136315650;
  sub_10001C05C();
  sub_10001C0B0((void *)&_mh_execute_header, v0, v1, "%s: Bundle identifier %@ contains \"/\", which is not allowed : %@", (uint8_t *)v2);
}

void sub_100096DEC()
{
  v1[0] = 136315394;
  sub_10000953C();
  _os_log_error_impl((void *)&_mh_execute_header, v0, OS_LOG_TYPE_ERROR, "%s: Bundle identifier is an empty string, which is not allowed : %@", (uint8_t *)v1, 0x16u);
}

void sub_100096E70(uint64_t a1, NSObject *a2, uint64_t a3)
{
  int v3 = 136315650;
  uint64_t v4 = "-[IXSClientConnection _remote_createAppInstallCoordinatorWithSeed:createIfNotExisting:requireMatchingIntent:scope"
       "Requirement:completion:]";
  __int16 v5 = 2048;
  uint64_t v6 = a1;
  __int16 v7 = 2112;
  uint64_t v8 = 0;
  sub_10001C0B0((void *)&_mh_execute_header, a2, a3, "%s: Installation domain in seed was not a known value: %lu : %@", (uint8_t *)&v3);
}

void sub_100096F00(unsigned __int8 a1, NSObject *a2, _DWORD *a3)
{
  *a3 = a1;
  int v3 = 136315650;
  uint64_t v4 = "-[IXSClientConnection _remote_createAppInstallCoordinatorWithSeed:createIfNotExisting:requireMatchingIntent:scope"
       "Requirement:completion:]";
  __int16 v5 = 1024;
  int v6 = a1;
  __int16 v7 = 2112;
  uint64_t v8 = 0;
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "%s: Scope requirement parameter value was not a known value: %hhu : %@", (uint8_t *)&v3, 0x1Cu);
}

void sub_100096FA0()
{
  v2[0] = 136315650;
  sub_10001C05C();
  sub_10001C0B0((void *)&_mh_execute_header, v0, v1, "%s: Coordinator did not exist for bundle ID %@ : %@", (uint8_t *)v2);
}

void sub_100097018()
{
  v2[0] = 136315650;
  sub_10001C05C();
  sub_10001C0B0((void *)&_mh_execute_header, v0, v1, "%s: Coordinator did not exist for bundle ID %@ : %@", (uint8_t *)v2);
}

void sub_100097090()
{
  v1[0] = 136315650;
  sub_100006C08();
  sub_10001C0B0((void *)&_mh_execute_header, v0, (uint64_t)v0, "%s: Failed to get a placeholder app record for %@; it does not appear to be installed. : %@",
    (uint8_t *)v1);
}

void sub_10009710C()
{
  v1[0] = 136315650;
  sub_100006C08();
  sub_10001C0B0((void *)&_mh_execute_header, v0, (uint64_t)v0, "%s: Failed to get bundle metadata for %@ : %@", (uint8_t *)v1);
}

void sub_100097188(void *a1)
{
  uint64_t v1 = [a1 clientName];
  sub_10001C05C();
  sub_10000487C((void *)&_mh_execute_header, v2, v3, "%s: Client %@ is missing test runner entitlement. : %@", v4, v5, v6, v7, 2u);
}

void sub_100097218(void *a1)
{
  uint64_t v1 = [a1 clientName];
  sub_10001C05C();
  sub_10000487C((void *)&_mh_execute_header, v2, v3, "%s: Client %@ is missing test runner entitlement. : %@", v4, v5, v6, v7, 2u);
}

void sub_1000972A8(void *a1)
{
  uint64_t v1 = [a1 clientName];
  sub_10001C05C();
  sub_10000487C((void *)&_mh_execute_header, v2, v3, "%s: Client %@ is missing test runner entitlement. : %@", v4, v5, v6, v7, 2u);
}

void sub_100097338(void *a1)
{
  uint64_t v1 = [a1 clientName];
  sub_10001C05C();
  sub_10000487C((void *)&_mh_execute_header, v2, v3, "%s: Client %@ is missing test runner entitlement. : %@", v4, v5, v6, v7, 2u);
}

void sub_1000973C8(void *a1)
{
  uint64_t v1 = [a1 clientName];
  sub_10001C05C();
  sub_10000487C((void *)&_mh_execute_header, v2, v3, "%s: Client %@ is missing test runner entitlement. : %@", v4, v5, v6, v7, 2u);
}

void sub_100097458(void *a1)
{
  uint64_t v1 = [a1 clientName];
  sub_10001C05C();
  sub_10000487C((void *)&_mh_execute_header, v2, v3, "%s: Client %@ is missing test runner entitlement. : %@", v4, v5, v6, v7, 2u);
}

void sub_1000974E8(void *a1)
{
  uint64_t v1 = [a1 clientName];
  sub_10001C05C();
  sub_10000487C((void *)&_mh_execute_header, v2, v3, "%s: Client %@ is missing test runner entitlement. : %@", v4, v5, v6, v7, 2u);
}

void sub_100097578(void *a1)
{
  uint64_t v1 = [a1 clientName];
  sub_10001C05C();
  sub_10000487C((void *)&_mh_execute_header, v2, v3, "%s: Client %@ has passed non-nil options. : %@", v4, v5, v6, v7, 2u);
}

void sub_100097608(void *a1)
{
  uint64_t v1 = [a1 clientName];
  sub_10001C05C();
  sub_10000487C((void *)&_mh_execute_header, v2, v3, "%s: Client %@ is missing disk image (client registration/unregistration) operation entitlement. : %@", v4, v5, v6, v7, 2u);
}

void sub_100097698()
{
  v1[0] = 136315650;
  sub_100006C08();
  sub_10001C0B0((void *)&_mh_execute_header, v0, (uint64_t)v0, "%s: Failed to unregister contents at %@ : %@", (uint8_t *)v1);
}

void sub_100097714(void *a1)
{
  uint64_t v1 = [a1 clientName];
  sub_10001C05C();
  sub_10000487C((void *)&_mh_execute_header, v2, v3, "%s: Client %@ has passed non-nil options. : %@", v4, v5, v6, v7, 2u);
}

void sub_1000977A4(void *a1)
{
  uint64_t v1 = [a1 clientName];
  sub_10001C05C();
  sub_10000487C((void *)&_mh_execute_header, v2, v3, "%s: Client %@ is missing disk image (contents registration/unregistration) operation entitlement. : %@", v4, v5, v6, v7, 2u);
}

void sub_100097834()
{
  v2[0] = 136315650;
  sub_10001C05C();
  sub_10001C0B0((void *)&_mh_execute_header, v0, v1, "%s: -[IXSAppRemovabilityManager setRemovability:] for %@ returned NO but did not set an error. : %@", (uint8_t *)v2);
}

void sub_1000978AC(void *a1)
{
  uint64_t v1 = [a1 clientName];
  sub_10003104C();
  sub_1000829D8();
  sub_100029E78((void *)&_mh_execute_header, v2, v3, "%s: Client %@ is missing %@ entitlement, rejecting attempt to set app removability. : %@", v4, v5, v6, v7, 2u);
}

void sub_100097948()
{
  v1[0] = 136315394;
  sub_10000953C();
  _os_log_error_impl((void *)&_mh_execute_header, v0, OS_LOG_TYPE_ERROR, "%s: Unexpectedly received nil value for app removability data : %@", (uint8_t *)v1, 0x16u);
}

void sub_1000979CC(void *a1, NSObject *a2)
{
  uint64_t v3 = [a1 clientName];
  int v4 = 136315394;
  uint64_t v5 = "-[IXSClientConnection _remote_removabilityDataWithCompletion:]";
  __int16 v6 = 2112;
  uint64_t v7 = v3;
  _os_log_debug_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_DEBUG, "%s: Querying removability data for client %@", (uint8_t *)&v4, 0x16u);
}

void sub_100097A78(void *a1)
{
  uint64_t v1 = [a1 clientName];
  sub_10003104C();
  sub_1000829D8();
  sub_100029E78((void *)&_mh_execute_header, v2, v3, "%s: Client %@ is missing %@ entitlement, rejecting attempt to read app removability data. : %@", v4, v5, v6, v7, 2u);
}

void sub_100097B14(void *a1)
{
  uint64_t v1 = [a1 clientName];
  sub_10001C05C();
  sub_10000487C((void *)&_mh_execute_header, v2, v3, "%s: Client %@ is missing ignore app protection operation entitlement. : %@", v4, v5, v6, v7, 2u);
}

void sub_100097BA4(void *a1)
{
  uint64_t v1 = [a1 clientName];
  sub_10001C05C();
  sub_10000487C((void *)&_mh_execute_header, v2, v3, "%s: Client %@ is missing ignore restrictions operation entitlement. : %@", v4, v5, v6, v7, 2u);
}

void sub_100097C34(void *a1)
{
  uint64_t v1 = [a1 clientName];
  sub_10001C05C();
  sub_10000487C((void *)&_mh_execute_header, v2, v3, "%s: Client %@ is missing ignore removability operation entitlement. : %@", v4, v5, v6, v7, 2u);
}

void sub_100097CC4(void *a1, NSObject *a2)
{
  uint64_t v3 = [a1 clientName];
  v6[0] = 136316162;
  sub_10003104C();
  CFStringRef v7 = @"com.apple.private.InstallCoordination.uninstall";
  __int16 v8 = v4;
  CFStringRef v9 = @"UninstallForLaunchServices";
  __int16 v10 = v4;
  CFStringRef v11 = @"com.apple.private.mobileinstall.allowedSPI";
  sub_100082A34((void *)&_mh_execute_header, a2, v5, "%s: %@ should be updated to use the entitlement \"%@\" = TRUE (BOOLean) instead of \"%@\" in the value of the \"%@\" entitlement", (uint8_t *)v6);
}

void sub_100097D88(void *a1)
{
  uint64_t v1 = [a1 clientName];
  sub_10003104C();
  sub_1000829D8();
  sub_100029E78((void *)&_mh_execute_header, v2, v3, "%s: Client %@ is missing entitlement \"%@\" : TRUE (BOOLean) to uninstall applications : %@", v4, v5, v6, v7, 2u);
}

void sub_100097E24(NSObject *a1, uint64_t a2, uint64_t a3)
{
  int v3 = 136315650;
  uint64_t v4 = "-[IXSClientConnection _remote_refreshContainerTypes:forAppWithIdentity:reason:completion:]";
  __int16 v5 = 2080;
  uint64_t v6 = "-[IXSClientConnection _remote_refreshContainerTypes:forAppWithIdentity:reason:completion:]";
  __int16 v7 = 2112;
  uint64_t v8 = 0;
  sub_10001C0B0((void *)&_mh_execute_header, a1, a3, "%s: Reason passed to %s was nil! : %@", (uint8_t *)&v3);
}

void sub_100097EB8(void *a1, NSObject *a2)
{
  int v3 = [a1 clientName];
  v6[0] = 136316162;
  sub_10003104C();
  CFStringRef v7 = @"com.apple.private.InstallCoordination.refreshContainerTypes";
  __int16 v8 = v4;
  CFStringRef v9 = @"UninstallForLaunchServices";
  __int16 v10 = v4;
  CFStringRef v11 = @"com.apple.private.mobileinstall.allowedSPI";
  sub_100082A34((void *)&_mh_execute_header, a2, v5, "%s: %@ should be updated to use the entitlement \"%@\" = TRUE (BOOLean) instead of \"%@\" in the value of the \"%@\" entitlement", (uint8_t *)v6);
}

void sub_100097F7C(void *a1)
{
  uint64_t v1 = [a1 clientName];
  sub_10003104C();
  sub_1000829D8();
  sub_100029E78((void *)&_mh_execute_header, v2, v3, "%s: Client %@ is missing entitlement \"%@\" = TRUE (BOOLean) to refresh containers : %@", v4, v5, v6, v7, 2u);
}

void sub_100098018()
{
  sub_1000646C4(__stack_chk_guard);
  v2[0] = 136315650;
  sub_10001C094();
  sub_10001C0B0((void *)&_mh_execute_header, v0, v1, "%s: Updating SINF for %@ returned NO but did not set an error. : %@", (uint8_t *)v2);
}

void sub_100098090()
{
  sub_1000646C4(__stack_chk_guard);
  int v2 = 136315906;
  sub_1000829B4();
  sub_1000656C0((void *)&_mh_execute_header, v0, v1, "%s: Failed to update the SINF for %@ because a coordinator already existed: %@ : %@", v2);
}

void sub_100098104()
{
  sub_1000646C4(__stack_chk_guard);
  v2[0] = 136315650;
  sub_10001C094();
  sub_10001C0B0((void *)&_mh_execute_header, v0, v1, "%s: Updating iTunesMetadata for %@ returned NO but did not set an error. : %@", (uint8_t *)v2);
}

void sub_10009817C()
{
  sub_1000646C4(__stack_chk_guard);
  int v2 = 136315906;
  sub_1000829B4();
  sub_1000656C0((void *)&_mh_execute_header, v0, v1, "%s: Failed to update the iTunesMetadata for %@ because a coordinator already existed: %@ : %@", v2);
}

void sub_1000981F0()
{
  sub_100029E6C();
  objc_msgSend((id)sub_100064690(v1, __stack_chk_guard), "clientName");
  objc_claimAutoreleasedReturnValue();
  sub_100082974();
  sub_10008292C();
  sub_100082954((void *)&_mh_execute_header, v2, v3, "%s: Client %@ attempted operation %s on coordinator UUID %@ without being registered as interested", v4, v5, v6, v7, 2u);
}

void sub_100098288()
{
  sub_100029E6C();
  objc_msgSend((id)sub_100064690(v1, __stack_chk_guard), "clientName");
  objc_claimAutoreleasedReturnValue();
  sub_100082974();
  sub_10008292C();
  sub_100082954((void *)&_mh_execute_header, v2, v3, "%s: Client %@ attempted operation %s on coordinator UUID %@ without being registered as interested", v4, v5, v6, v7, 2u);
}

void sub_100098320()
{
  sub_100029E6C();
  objc_msgSend((id)sub_100064690(v1, __stack_chk_guard), "clientName");
  objc_claimAutoreleasedReturnValue();
  sub_100082974();
  sub_10008292C();
  sub_100082954((void *)&_mh_execute_header, v2, v3, "%s: Client %@ attempted operation %s on coordinator UUID %@ without being registered as interested", v4, v5, v6, v7, 2u);
}

void sub_1000983B8()
{
  sub_100029E6C();
  objc_msgSend((id)sub_100064690(v1, __stack_chk_guard), "clientName");
  objc_claimAutoreleasedReturnValue();
  sub_100082974();
  sub_10008292C();
  sub_100082954((void *)&_mh_execute_header, v2, v3, "%s: Client %@ attempted operation %s on coordinator UUID %@ without being registered as interested", v4, v5, v6, v7, 2u);
}

void sub_100098450()
{
  sub_100029E6C();
  objc_msgSend((id)sub_100064690(v1, __stack_chk_guard), "clientName");
  objc_claimAutoreleasedReturnValue();
  sub_100082974();
  sub_10008292C();
  sub_100082954((void *)&_mh_execute_header, v2, v3, "%s: Client %@ attempted operation %s on coordinator UUID %@ without being registered as interested", v4, v5, v6, v7, 2u);
}

void sub_1000984E8()
{
  sub_100029E6C();
  objc_msgSend((id)sub_100064690(v1, __stack_chk_guard), "clientName");
  objc_claimAutoreleasedReturnValue();
  sub_100082974();
  sub_10008292C();
  sub_100082954((void *)&_mh_execute_header, v2, v3, "%s: Client %@ attempted operation %s on coordinator UUID %@ without being registered as interested", v4, v5, v6, v7, 2u);
}

void sub_100098580()
{
  sub_100029E6C();
  objc_msgSend((id)sub_100064690(v1, __stack_chk_guard), "clientName");
  objc_claimAutoreleasedReturnValue();
  sub_100082974();
  sub_10008292C();
  sub_100082954((void *)&_mh_execute_header, v2, v3, "%s: Client %@ attempted operation %s on coordinator UUID %@ without being registered as interested", v4, v5, v6, v7, 2u);
}

void sub_100098618()
{
  sub_100029E6C();
  objc_msgSend((id)sub_100064690(v1, __stack_chk_guard), "clientName");
  objc_claimAutoreleasedReturnValue();
  sub_100082974();
  sub_10008292C();
  sub_100082954((void *)&_mh_execute_header, v2, v3, "%s: Client %@ attempted operation %s on coordinator UUID %@ without being registered as interested", v4, v5, v6, v7, 2u);
}

void sub_1000986B0()
{
  sub_100029E6C();
  objc_msgSend((id)sub_100064690(v1, __stack_chk_guard), "clientName");
  objc_claimAutoreleasedReturnValue();
  sub_100082974();
  sub_10008292C();
  sub_100082954((void *)&_mh_execute_header, v2, v3, "%s: Client %@ attempted operation %s on coordinator UUID %@ without being registered as interested", v4, v5, v6, v7, 2u);
}

void sub_100098748()
{
  sub_100029E6C();
  objc_msgSend((id)sub_100064690(v1, __stack_chk_guard), "clientName");
  objc_claimAutoreleasedReturnValue();
  sub_100082974();
  sub_10008292C();
  sub_100082954((void *)&_mh_execute_header, v2, v3, "%s: Client %@ attempted operation %s on coordinator UUID %@ without being registered as interested", v4, v5, v6, v7, 2u);
}

void sub_1000987E0()
{
  sub_100029E6C();
  objc_msgSend((id)sub_100064690(v1, __stack_chk_guard), "clientName");
  objc_claimAutoreleasedReturnValue();
  sub_100082974();
  sub_10008292C();
  sub_100082954((void *)&_mh_execute_header, v2, v3, "%s: Client %@ attempted operation %s on coordinator UUID %@ without being registered as interested", v4, v5, v6, v7, 2u);
}

void sub_100098878()
{
  sub_100029E6C();
  objc_msgSend((id)sub_100064690(v1, __stack_chk_guard), "clientName");
  objc_claimAutoreleasedReturnValue();
  sub_100082974();
  sub_10008292C();
  sub_100082954((void *)&_mh_execute_header, v2, v3, "%s: Client %@ attempted operation %s on coordinator UUID %@ without being registered as interested", v4, v5, v6, v7, 2u);
}

void sub_100098910()
{
  sub_100029E6C();
  objc_msgSend((id)sub_100064690(v1, __stack_chk_guard), "clientName");
  objc_claimAutoreleasedReturnValue();
  sub_100082974();
  sub_10008292C();
  sub_100082954((void *)&_mh_execute_header, v2, v3, "%s: Client %@ attempted operation %s on coordinator UUID %@ without being registered as interested", v4, v5, v6, v7, 2u);
}

void sub_1000989A8()
{
  sub_100029E6C();
  objc_msgSend((id)sub_100064690(v1, __stack_chk_guard), "clientName");
  objc_claimAutoreleasedReturnValue();
  sub_100082974();
  sub_10008292C();
  sub_100082954((void *)&_mh_execute_header, v2, v3, "%s: Client %@ attempted operation %s on coordinator UUID %@ without being registered as interested", v4, v5, v6, v7, 2u);
}

void sub_100098A40()
{
  sub_100029E6C();
  objc_msgSend((id)sub_100064690(v1, __stack_chk_guard), "clientName");
  objc_claimAutoreleasedReturnValue();
  sub_100082974();
  sub_10008292C();
  sub_100082954((void *)&_mh_execute_header, v2, v3, "%s: Client %@ attempted operation %s on coordinator UUID %@ without being registered as interested", v4, v5, v6, v7, 2u);
}

void sub_100098AD8()
{
  sub_100029E6C();
  objc_msgSend((id)sub_100064690(v1, __stack_chk_guard), "clientName");
  objc_claimAutoreleasedReturnValue();
  sub_100082974();
  sub_10008292C();
  sub_100082954((void *)&_mh_execute_header, v2, v3, "%s: Client %@ attempted operation %s on coordinator UUID %@ without being registered as interested", v4, v5, v6, v7, 2u);
}

void sub_100098B70()
{
  sub_100029E6C();
  objc_msgSend((id)sub_100064690(v1, __stack_chk_guard), "clientName");
  objc_claimAutoreleasedReturnValue();
  sub_100082974();
  sub_10008292C();
  sub_100082954((void *)&_mh_execute_header, v2, v3, "%s: Client %@ attempted operation %s on coordinator UUID %@ without being registered as interested", v4, v5, v6, v7, 2u);
}

void sub_100098C08()
{
  sub_100029E6C();
  objc_msgSend((id)sub_100064690(v1, __stack_chk_guard), "clientName");
  objc_claimAutoreleasedReturnValue();
  sub_100082974();
  sub_10008292C();
  sub_100082954((void *)&_mh_execute_header, v2, v3, "%s: Client %@ attempted operation %s on coordinator UUID %@ without being registered as interested", v4, v5, v6, v7, 2u);
}

void sub_100098CA0()
{
  sub_100029E6C();
  objc_msgSend((id)sub_100064690(v1, __stack_chk_guard), "clientName");
  objc_claimAutoreleasedReturnValue();
  sub_100082974();
  sub_10008292C();
  sub_100082954((void *)&_mh_execute_header, v2, v3, "%s: Client %@ attempted operation %s on coordinator UUID %@ without being registered as interested", v4, v5, v6, v7, 2u);
}

void sub_100098D38()
{
  sub_100029E6C();
  objc_msgSend((id)sub_100064690(v1, __stack_chk_guard), "clientName");
  objc_claimAutoreleasedReturnValue();
  sub_100082974();
  sub_10008292C();
  sub_100082954((void *)&_mh_execute_header, v2, v3, "%s: Client %@ attempted operation %s on coordinator UUID %@ without being registered as interested", v4, v5, v6, v7, 2u);
}

void sub_100098DD0()
{
  sub_100029E6C();
  objc_msgSend((id)sub_100064690(v1, __stack_chk_guard), "clientName");
  objc_claimAutoreleasedReturnValue();
  sub_100082974();
  sub_10008292C();
  sub_100082954((void *)&_mh_execute_header, v2, v3, "%s: Client %@ attempted operation %s on coordinator UUID %@ without being registered as interested", v4, v5, v6, v7, 2u);
}

void sub_100098E68()
{
  sub_100029E6C();
  objc_msgSend((id)sub_100064690(v1, __stack_chk_guard), "clientName");
  objc_claimAutoreleasedReturnValue();
  sub_100082974();
  sub_10008292C();
  sub_100082954((void *)&_mh_execute_header, v2, v3, "%s: Client %@ attempted operation %s on coordinator UUID %@ without being registered as interested", v4, v5, v6, v7, 2u);
}

void sub_100098F00()
{
  sub_100029E6C();
  objc_msgSend((id)sub_100064690(v1, __stack_chk_guard), "clientName");
  objc_claimAutoreleasedReturnValue();
  sub_100082974();
  sub_10008292C();
  sub_100082954((void *)&_mh_execute_header, v2, v3, "%s: Client %@ attempted operation %s on coordinator UUID %@ without being registered as interested", v4, v5, v6, v7, 2u);
}

void sub_100098F98()
{
  sub_100029E6C();
  objc_msgSend((id)sub_100064690(v1, __stack_chk_guard), "clientName");
  objc_claimAutoreleasedReturnValue();
  sub_100082974();
  sub_10008292C();
  sub_100082954((void *)&_mh_execute_header, v2, v3, "%s: Client %@ attempted operation %s on coordinator UUID %@ without being registered as interested", v4, v5, v6, v7, 2u);
}

void sub_100099030()
{
  sub_100029E6C();
  objc_msgSend((id)sub_100064690(v1, __stack_chk_guard), "clientName");
  objc_claimAutoreleasedReturnValue();
  sub_100082974();
  sub_10008292C();
  sub_100082954((void *)&_mh_execute_header, v2, v3, "%s: Client %@ attempted operation %s on coordinator UUID %@ without being registered as interested", v4, v5, v6, v7, 2u);
}

void sub_1000990C8()
{
  sub_100029E6C();
  objc_msgSend((id)sub_100064690(v1, __stack_chk_guard), "clientName");
  objc_claimAutoreleasedReturnValue();
  sub_100082974();
  sub_10008292C();
  sub_100082954((void *)&_mh_execute_header, v2, v3, "%s: Client %@ attempted operation %s on coordinator UUID %@ without being registered as interested", v4, v5, v6, v7, 2u);
}

void sub_100099160()
{
  sub_100029E6C();
  objc_msgSend((id)sub_100064690(v1, __stack_chk_guard), "clientName");
  objc_claimAutoreleasedReturnValue();
  sub_100082974();
  sub_10008292C();
  sub_100082954((void *)&_mh_execute_header, v2, v3, "%s: Client %@ attempted operation %s on coordinator UUID %@ without being registered as interested", v4, v5, v6, v7, 2u);
}

void sub_1000991F8()
{
  sub_100029E6C();
  objc_msgSend((id)sub_100064690(v1, __stack_chk_guard), "clientName");
  objc_claimAutoreleasedReturnValue();
  sub_100082974();
  sub_10008292C();
  sub_100082954((void *)&_mh_execute_header, v2, v3, "%s: Client %@ attempted operation %s on coordinator UUID %@ without being registered as interested", v4, v5, v6, v7, 2u);
}

void sub_100099290()
{
  sub_100029E6C();
  objc_msgSend((id)sub_100064690(v1, __stack_chk_guard), "clientName");
  objc_claimAutoreleasedReturnValue();
  sub_100082974();
  sub_10008292C();
  sub_100082954((void *)&_mh_execute_header, v2, v3, "%s: Client %@ attempted operation %s on coordinator UUID %@ without being registered as interested", v4, v5, v6, v7, 2u);
}

void sub_100099328()
{
  sub_100029E6C();
  objc_msgSend((id)sub_100064690(v1, __stack_chk_guard), "clientName");
  objc_claimAutoreleasedReturnValue();
  sub_100082974();
  sub_10008292C();
  sub_100082954((void *)&_mh_execute_header, v2, v3, "%s: Client %@ attempted operation %s on coordinator UUID %@ without being registered as interested", v4, v5, v6, v7, 2u);
}

void sub_1000993C0()
{
  sub_100029E6C();
  objc_msgSend((id)sub_100064690(v1, __stack_chk_guard), "clientName");
  objc_claimAutoreleasedReturnValue();
  sub_100082974();
  sub_10008292C();
  sub_100082954((void *)&_mh_execute_header, v2, v3, "%s: Client %@ attempted operation %s on coordinator UUID %@ without being registered as interested", v4, v5, v6, v7, 2u);
}

void sub_100099458()
{
  sub_100029E6C();
  objc_msgSend((id)sub_100064690(v1, __stack_chk_guard), "clientName");
  objc_claimAutoreleasedReturnValue();
  sub_100082974();
  sub_10008292C();
  sub_100082954((void *)&_mh_execute_header, v2, v3, "%s: Client %@ attempted operation %s on coordinator UUID %@ without being registered as interested", v4, v5, v6, v7, 2u);
}

void sub_1000994F0()
{
  sub_100029E6C();
  objc_msgSend((id)sub_100064690(v1, __stack_chk_guard), "clientName");
  objc_claimAutoreleasedReturnValue();
  sub_100082974();
  sub_10008292C();
  sub_100082954((void *)&_mh_execute_header, v2, v3, "%s: Client %@ attempted operation %s on coordinator UUID %@ without being registered as interested", v4, v5, v6, v7, 2u);
}

void sub_100099588()
{
  sub_100029E6C();
  objc_msgSend((id)sub_100064690(v1, __stack_chk_guard), "clientName");
  objc_claimAutoreleasedReturnValue();
  sub_100082974();
  sub_10008292C();
  sub_100082954((void *)&_mh_execute_header, v2, v3, "%s: Client %@ attempted operation %s on coordinator UUID %@ without being registered as interested", v4, v5, v6, v7, 2u);
}

void sub_100099620()
{
  sub_100029E6C();
  objc_msgSend((id)sub_100064690(v1, __stack_chk_guard), "clientName");
  objc_claimAutoreleasedReturnValue();
  sub_100082974();
  sub_10008292C();
  sub_100082954((void *)&_mh_execute_header, v2, v3, "%s: Client %@ attempted operation %s on coordinator UUID %@ without being registered as interested", v4, v5, v6, v7, 2u);
}

void sub_1000996B8()
{
  sub_100029E6C();
  objc_msgSend((id)sub_100064690(v1, __stack_chk_guard), "clientName");
  objc_claimAutoreleasedReturnValue();
  sub_100082974();
  sub_10008292C();
  sub_100082954((void *)&_mh_execute_header, v2, v3, "%s: Client %@ attempted operation %s on coordinator UUID %@ without being registered as interested", v4, v5, v6, v7, 2u);
}

void sub_100099750()
{
  sub_100029E6C();
  objc_msgSend((id)sub_100064690(v1, __stack_chk_guard), "clientName");
  objc_claimAutoreleasedReturnValue();
  sub_100082974();
  sub_10008292C();
  sub_100082954((void *)&_mh_execute_header, v2, v3, "%s: Client %@ attempted operation %s on coordinator UUID %@ without being registered as interested", v4, v5, v6, v7, 2u);
}

void sub_1000997E8()
{
  sub_100029E6C();
  objc_msgSend((id)sub_100064690(v1, __stack_chk_guard), "clientName");
  objc_claimAutoreleasedReturnValue();
  sub_100082974();
  sub_10008292C();
  sub_100082954((void *)&_mh_execute_header, v2, v3, "%s: Client %@ attempted operation %s on coordinator UUID %@ without being registered as interested", v4, v5, v6, v7, 2u);
}

void sub_100099880()
{
  sub_100029E6C();
  objc_msgSend((id)sub_100064690(v1, __stack_chk_guard), "clientName");
  objc_claimAutoreleasedReturnValue();
  sub_100082974();
  sub_10008292C();
  sub_100082954((void *)&_mh_execute_header, v2, v3, "%s: Client %@ attempted operation %s on coordinator UUID %@ without being registered as interested", v4, v5, v6, v7, 2u);
}

void sub_100099918()
{
  sub_100029E6C();
  objc_msgSend((id)sub_100064690(v1, __stack_chk_guard), "clientName");
  objc_claimAutoreleasedReturnValue();
  sub_100082974();
  sub_10008292C();
  sub_100082954((void *)&_mh_execute_header, v2, v3, "%s: Client %@ attempted operation %s on coordinator UUID %@ without being registered as interested", v4, v5, v6, v7, 2u);
}

void sub_1000999B0()
{
  sub_100029E6C();
  objc_msgSend((id)sub_100064690(v1, __stack_chk_guard), "clientName");
  objc_claimAutoreleasedReturnValue();
  sub_100082974();
  sub_10008292C();
  sub_100082954((void *)&_mh_execute_header, v2, v3, "%s: Client %@ attempted operation %s on coordinator UUID %@ without being registered as interested", v4, v5, v6, v7, 2u);
}

void sub_100099A48()
{
  sub_100029E6C();
  objc_msgSend((id)sub_100064690(v1, __stack_chk_guard), "clientName");
  objc_claimAutoreleasedReturnValue();
  sub_100082974();
  sub_10008292C();
  sub_100082954((void *)&_mh_execute_header, v2, v3, "%s: Client %@ attempted operation %s on coordinator UUID %@ without being registered as interested", v4, v5, v6, v7, 2u);
}

void sub_100099AE0()
{
  sub_100029E6C();
  objc_msgSend((id)sub_100064690(v1, __stack_chk_guard), "clientName");
  objc_claimAutoreleasedReturnValue();
  sub_100082974();
  sub_10008292C();
  sub_100082954((void *)&_mh_execute_header, v2, v3, "%s: Client %@ attempted operation %s on coordinator UUID %@ without being registered as interested", v4, v5, v6, v7, 2u);
}

void sub_100099B78()
{
  sub_100029E6C();
  objc_msgSend((id)sub_100064690(v1, __stack_chk_guard), "clientName");
  objc_claimAutoreleasedReturnValue();
  sub_100082974();
  sub_10008292C();
  sub_100082954((void *)&_mh_execute_header, v2, v3, "%s: Client %@ attempted operation %s on coordinator UUID %@ without being registered as interested", v4, v5, v6, v7, 2u);
}

void sub_100099C10()
{
  sub_100029E6C();
  objc_msgSend((id)sub_100064690(v1, __stack_chk_guard), "clientName");
  objc_claimAutoreleasedReturnValue();
  sub_100082974();
  sub_10008292C();
  sub_100082954((void *)&_mh_execute_header, v2, v3, "%s: Client %@ attempted operation %s on coordinator UUID %@ without being registered as interested", v4, v5, v6, v7, 2u);
}

void sub_100099CA8(void *a1)
{
  uint64_t v1 = [a1 clientName];
  sub_10001C05C();
  sub_10000487C((void *)&_mh_execute_header, v2, v3, "%s: Client %@ is missing entitlement to set placeholder disposition. : %@", v4, v5, v6, v7, 2u);
}

void sub_100099D38()
{
  sub_100029E6C();
  objc_msgSend((id)sub_100064690(v1, __stack_chk_guard), "clientName");
  objc_claimAutoreleasedReturnValue();
  sub_100082974();
  sub_10008292C();
  sub_100082954((void *)&_mh_execute_header, v2, v3, "%s: Client %@ attempted operation %s on coordinator UUID %@ without being registered as interested", v4, v5, v6, v7, 2u);
}

void sub_100099DD0()
{
  sub_100029E6C();
  objc_msgSend((id)sub_100064690(v1, __stack_chk_guard), "clientName");
  objc_claimAutoreleasedReturnValue();
  sub_100082974();
  sub_10008292C();
  sub_100082954((void *)&_mh_execute_header, v2, v3, "%s: Client %@ attempted operation %s on coordinator UUID %@ without being registered as interested", v4, v5, v6, v7, 2u);
}

void sub_100099E68()
{
  sub_100029E6C();
  objc_msgSend((id)sub_100064690(v1, __stack_chk_guard), "clientName");
  objc_claimAutoreleasedReturnValue();
  sub_100082974();
  sub_10008292C();
  sub_100082954((void *)&_mh_execute_header, v2, v3, "%s: Client %@ attempted operation %s on coordinator UUID %@ without being registered as interested", v4, v5, v6, v7, 2u);
}

void sub_100099F00()
{
  sub_100029E6C();
  objc_msgSend((id)sub_100064690(v1, __stack_chk_guard), "clientName");
  objc_claimAutoreleasedReturnValue();
  sub_100082974();
  sub_10008292C();
  sub_100082954((void *)&_mh_execute_header, v2, v3, "%s: Client %@ attempted operation %s on coordinator UUID %@ without being registered as interested", v4, v5, v6, v7, 2u);
}

void sub_100099F98()
{
  sub_100029E6C();
  objc_msgSend((id)sub_100064690(v1, __stack_chk_guard), "clientName");
  objc_claimAutoreleasedReturnValue();
  sub_100082974();
  sub_10008292C();
  sub_100082954((void *)&_mh_execute_header, v2, v3, "%s: Client %@ attempted operation %s on coordinator UUID %@ without being registered as interested", v4, v5, v6, v7, 2u);
}

void sub_10009A030()
{
  sub_100029E6C();
  objc_msgSend((id)sub_100064690(v1, __stack_chk_guard), "clientName");
  objc_claimAutoreleasedReturnValue();
  sub_100082974();
  sub_10008292C();
  sub_100082954((void *)&_mh_execute_header, v2, v3, "%s: Client %@ attempted operation %s on coordinator UUID %@ without being registered as interested", v4, v5, v6, v7, 2u);
}

void sub_10009A0C8()
{
  sub_100007924();
  sub_100009550((void *)&_mh_execute_header, v0, v1, "%s: Failed to write empty removability file with change clock: %@", v2, v3, v4, v5, 2u);
}

void sub_10009A13C()
{
  sub_100007924();
  sub_100009550((void *)&_mh_execute_header, v0, v1, "%s: Failed to migrate legacy removability plist to the new format with change clock: %@", v2, v3, v4, v5, 2u);
}

void sub_10009A1B0()
{
}

void sub_10009A1CC(uint64_t a1, NSObject *a2)
{
  int v2 = 136315650;
  uint64_t v3 = "-[IXSAppRemovabilityManager setRemovability:forAppWithIdentity:byClient:error:]";
  __int16 v4 = 2048;
  uint64_t v5 = a1;
  __int16 v6 = 2112;
  uint64_t v7 = 0;
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "%s: Setting app removability to an unrecognized value (%lu) is not allowed : %@", (uint8_t *)&v2, 0x20u);
}

void sub_10009A264()
{
  sub_10000953C();
  sub_100009550((void *)&_mh_execute_header, v0, v1, "%s: Setting app removability to \"unknown\" is not allowed : %@", v2, v3, v4, v5, 2u);
}

void sub_10009A2DC()
{
  sub_100029E6C();
  uint64_t v1 = [v0 path];
  sub_100029E18();
  sub_10000487C((void *)&_mh_execute_header, v2, v3, "%s: Failed to remove legacy removability plist at URL path %@. Error: %@", v4, v5, v6, v7, 2u);
}

void sub_10009A374()
{
  sub_10000953C();
  sub_100009550((void *)&_mh_execute_header, v0, v1, "%s: Failed to convert app removability and change clock to data : %@", v2, v3, v4, v5, 2u);
}

void sub_10009A3EC()
{
  sub_100029E6C();
  uint64_t v1 = [v0 removabilityURL];
  sub_100029E18();
  sub_10000487C((void *)&_mh_execute_header, v2, v3, "%s: Failed to write app removability data to URL %@ : %@", v4, v5, v6, v7, 2u);
}

void sub_10009A484(uint64_t a1, NSObject *a2)
{
  int v2 = 136315650;
  uint64_t v3 = "-[IXSAppRemovabilityManager clearRemovabilityStateForIdentity:error:]";
  __int16 v4 = 2112;
  uint64_t v5 = a1;
  __int16 v6 = 2112;
  uint64_t v7 = 0;
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "%s: Failed to find removability entry for %@ : %@", (uint8_t *)&v2, 0x20u);
}

void sub_10009A518()
{
  sub_10000953C();
  sub_100009550((void *)&_mh_execute_header, v0, v1, "%s: Reason passed to -[IXSDataPromise cancelForReason:client:] was nil : %@", v2, v3, v4, v5, 2u);
}

void sub_10009A590()
{
  sub_10000953C();
  sub_100009550((void *)&_mh_execute_header, v0, v1, "%s: Client passed to -[IXSDataPromise cancelForReason:client:] was IXClientNone (0) : %@", v2, v3, v4, v5, 2u);
}

void sub_10009A608()
{
  sub_10000953C();
  sub_100009550((void *)&_mh_execute_header, v0, v1, "%s: Attempt made to reset a completed promise : %@", v2, v3, v4, v5, 2u);
}

void sub_10009A680(uint64_t a1, NSObject *a2)
{
  uint64_t v2 = *(void *)(*(void *)a1 + 40);
  int v3 = 136315650;
  uint64_t v4 = "-[IXSDataPromise(IXSDataPromiseIPCMethods) _remote_resetWithCompletion:]";
  __int16 v5 = 2112;
  uint64_t v6 = v2;
  __int16 v7 = 2112;
  uint64_t v8 = 0;
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "%s: Attempt made to reset a canceled promise (promise canceled with error %@) : %@", (uint8_t *)&v3, 0x20u);
}

void sub_10009A71C(void *a1, uint64_t a2, os_log_t log)
{
  uint64_t v3 = a1[4];
  uint64_t v4 = a1[7];
  uint64_t v5 = a1[8] + a2;
  int v6 = 136316418;
  __int16 v7 = "-[IXSDataPromise(IXSDataPromiseIPCMethods) _remote_preflightWithCompletion:]_block_invoke";
  __int16 v8 = 2112;
  uint64_t v9 = v3;
  __int16 v10 = 2048;
  uint64_t v11 = v4;
  __int16 v12 = 2048;
  uint64_t v13 = v5;
  __int16 v14 = 2048;
  uint64_t v15 = a2;
  __int16 v16 = 2112;
  uint64_t v17 = 0;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "%s: Not enough space for promise %@: %llu bytes needed, %llu bytes available (%llu bytes were purged). : %@", (uint8_t *)&v6, 0x3Eu);
}

void sub_10009A7DC(void *a1)
{
  uint64_t v1 = [a1 path];
  sub_10001C05C();
  sub_10000487C((void *)&_mh_execute_header, v2, v3, "%s: Failed to create CFBundle from %@ : %@", v4, v5, v6, v7, 2u);
}

void sub_10009A86C()
{
  v1[0] = 136315650;
  sub_10001C05C();
  _os_log_error_impl((void *)&_mh_execute_header, v0, OS_LOG_TYPE_ERROR, "%s: CFBundleGetInfoDictionary returned NULL for bundle %@ : %@", (uint8_t *)v1, 0x20u);
}

void sub_10009A8EC(uint64_t a1, uint64_t a2, os_log_t log)
{
  int v3 = 136315906;
  uint64_t v4 = "LoadInfoPlistFromBundle";
  __int16 v5 = 2112;
  uint64_t v6 = a1;
  __int16 v7 = 2112;
  uint64_t v8 = a2;
  __int16 v9 = 2112;
  uint64_t v10 = 0;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "%s: Failed to get filtered Info.plist with keys %@ from bundle %@ : %@", (uint8_t *)&v3, 0x2Au);
}

void sub_10009A98C(uint64_t a1, uint64_t a2, NSObject *a3)
{
  __int16 v5 = (objc_class *)objc_opt_class();
  uint64_t v6 = NSStringFromClass(v5);
  int v7 = 136315906;
  uint64_t v8 = "LoadInfoPlistFromBundle";
  __int16 v9 = 2112;
  uint64_t v10 = a1;
  __int16 v11 = 2112;
  __int16 v12 = v6;
  __int16 v13 = 2112;
  uint64_t v14 = 0;
  _os_log_error_impl((void *)&_mh_execute_header, a3, OS_LOG_TYPE_ERROR, "%s: Object returned from _CFBundleCreateFilteredInfoPlist for %@ was not a dictionary, was type %@ : %@", (uint8_t *)&v7, 0x2Au);
}

void sub_10009AA5C(void *a1)
{
  uint64_t v1 = [a1 path];
  sub_10001C05C();
  sub_10000487C((void *)&_mh_execute_header, v2, v3, "%s: Failed to find a \".app\" inside the extracted contents at %@ : %@", v4, v5, v6, v7, 2u);
}

void sub_10009AAEC()
{
  sub_10001C05C();
  sub_10001C078((void *)&_mh_execute_header, v0, v1, "%s: Got XPC error on listenerConnection handler: %@ : %@", v2, v3, v4, v5, 2u);
}

void sub_10009AB60()
{
  sub_10008A508();
  sub_10001C078((void *)&_mh_execute_header, v0, v1, "%s: Got unknown XPC event on listenerConnection handler: %s : %@", v2, v3, v4, v5, 2u);
}

void sub_10009ABD4()
{
  sub_10001C05C();
  sub_10001C078((void *)&_mh_execute_header, v0, v1, "%s: Got XPC error on serviceConnection handler: %@ : %@", v2, v3, v4, v5, 2u);
}

void sub_10009AC48()
{
  sub_10008A508();
  sub_10001C078((void *)&_mh_execute_header, v0, v1, "%s: Got unknown XPC event on serviceConnection handler: %s : %@", v2, v3, v4, v5, 2u);
}

void sub_10009ACBC(os_log_t log)
{
  int v1 = 136315138;
  uint64_t v2 = "-[IXSRemoteDeletionPromptConnection dismissAlert]";
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "%s: Failed to dismiss remote alert; no serviceConnection found",
    (uint8_t *)&v1,
    0xCu);
}

CFStringRef CFBundleCopyLocalizedString(CFBundleRef bundle, CFStringRef key, CFStringRef value, CFStringRef tableName)
{
  return _CFBundleCopyLocalizedString(bundle, key, value, tableName);
}

CFStringRef CFBundleGetIdentifier(CFBundleRef bundle)
{
  return _CFBundleGetIdentifier(bundle);
}

CFDictionaryRef CFBundleGetInfoDictionary(CFBundleRef bundle)
{
  return _CFBundleGetInfoDictionary(bundle);
}

Boolean CFPropertyListIsValid(CFPropertyListRef plist, CFPropertyListFormat format)
{
  return _CFPropertyListIsValid(plist, format);
}

void CFRelease(CFTypeRef cf)
{
}

CFMutableStringRef CFStringCreateMutableWithExternalCharactersNoCopy(CFAllocatorRef alloc, UniChar *chars, CFIndex numChars, CFIndex capacity, CFAllocatorRef externalCharactersAllocator)
{
  return _CFStringCreateMutableWithExternalCharactersNoCopy(alloc, chars, numChars, capacity, externalCharactersAllocator);
}

CFStringRef CFStringCreateWithFileSystemRepresentation(CFAllocatorRef alloc, const char *buffer)
{
  return _CFStringCreateWithFileSystemRepresentation(alloc, buffer);
}

void CFStringGetCharacters(CFStringRef theString, CFRange range, UniChar *buffer)
{
}

Boolean CFStringGetFileSystemRepresentation(CFStringRef string, char *buffer, CFIndex maxBufLen)
{
  return _CFStringGetFileSystemRepresentation(string, buffer, maxBufLen);
}

CFIndex CFStringGetLength(CFStringRef theString)
{
  return _CFStringGetLength(theString);
}

CFRange CFStringGetRangeOfComposedCharactersAtIndex(CFStringRef theString, CFIndex theIndex)
{
  CFRange RangeOfComposedCharactersAtIndex = _CFStringGetRangeOfComposedCharactersAtIndex(theString, theIndex);
  CFIndex length = RangeOfComposedCharactersAtIndex.length;
  CFIndex location = RangeOfComposedCharactersAtIndex.location;
  result.CFIndex length = length;
  result.CFIndex location = location;
  return result;
}

void CFStringSetExternalCharactersNoCopy(CFMutableStringRef theString, UniChar *chars, CFIndex length, CFIndex capacity)
{
}

CFUserNotificationRef CFUserNotificationCreate(CFAllocatorRef allocator, CFTimeInterval timeout, CFOptionFlags flags, SInt32 *error, CFDictionaryRef dictionary)
{
  return _CFUserNotificationCreate(allocator, timeout, flags, error, dictionary);
}

SInt32 CFUserNotificationDisplayAlert(CFTimeInterval timeout, CFOptionFlags flags, CFURLRef iconURL, CFURLRef soundURL, CFURLRef localizationURL, CFStringRef alertHeader, CFStringRef alertMessage, CFStringRef defaultButtonTitle, CFStringRef alternateButtonTitle, CFStringRef otherButtonTitle, CFOptionFlags *responseFlags)
{
  return _CFUserNotificationDisplayAlert(timeout, flags, iconURL, soundURL, localizationURL, alertHeader, alertMessage, defaultButtonTitle, alternateButtonTitle, otherButtonTitle, responseFlags);
}

CFDictionaryRef CFUserNotificationGetResponseDictionary(CFUserNotificationRef userNotification)
{
  return _CFUserNotificationGetResponseDictionary(userNotification);
}

SInt32 CFUserNotificationReceiveResponse(CFUserNotificationRef userNotification, CFTimeInterval timeout, CFOptionFlags *responseFlags)
{
  return _CFUserNotificationReceiveResponse(userNotification, timeout, responseFlags);
}

uint64_t CacheDeleteCopyPurgeableSpaceWithInfo()
{
  return _CacheDeleteCopyPurgeableSpaceWithInfo();
}

uint64_t CacheDeletePurgeSpaceWithInfo()
{
  return _CacheDeletePurgeSpaceWithInfo();
}

IOReturn IOPMAssertionCreateWithDescription(CFStringRef AssertionType, CFStringRef Name, CFStringRef Details, CFStringRef HumanReadableReason, CFStringRef LocalizationBundlePath, CFTimeInterval Timeout, CFStringRef TimeoutAction, IOPMAssertionID *AssertionID)
{
  return _IOPMAssertionCreateWithDescription(AssertionType, Name, Details, HumanReadableReason, LocalizationBundlePath, Timeout, TimeoutAction, AssertionID);
}

IOReturn IOPMAssertionRelease(IOPMAssertionID AssertionID)
{
  return _IOPMAssertionRelease(AssertionID);
}

uint64_t LSDefaultAppCategoryForMask()
{
  return _LSDefaultAppCategoryForMask();
}

uint64_t MGCopyAnswer()
{
  return _MGCopyAnswer();
}

uint64_t MGGetStringAnswer()
{
  return _MGGetStringAnswer();
}

uint64_t MIAcquireReferenceForInstalledAppWithError()
{
  return _MIAcquireReferenceForInstalledAppWithError();
}

uint64_t MIFinalizeReferenceForInstalledAppWithError()
{
  return _MIFinalizeReferenceForInstalledAppWithError();
}

uint64_t MIInvalidateReferenceForInstalledAppWithError()
{
  return _MIInvalidateReferenceForInstalledAppWithError();
}

uint64_t MIIsValidInstallationDomain()
{
  return _MIIsValidInstallationDomain();
}

uint64_t MIStringForInstallationDomain()
{
  return _MIStringForInstallationDomain();
}

uint64_t MKBDeviceUnlockedSinceBoot()
{
  return _MKBDeviceUnlockedSinceBoot();
}

uint64_t MobileInstallationCopyAppMetadata()
{
  return _MobileInstallationCopyAppMetadata();
}

uint64_t MobileInstallationInstallApplicationWithIdentityAndAssertionBlockWithError()
{
  return _MobileInstallationInstallApplicationWithIdentityAndAssertionBlockWithError();
}

uint64_t MobileInstallationLinkedBundleIDsForIdentity()
{
  return _MobileInstallationLinkedBundleIDsForIdentity();
}

uint64_t MobileInstallationRegisterContentsForDiskImageAtURL()
{
  return _MobileInstallationRegisterContentsForDiskImageAtURL();
}

uint64_t MobileInstallationRegisterPlaceholderForReference()
{
  return _MobileInstallationRegisterPlaceholderForReference();
}

uint64_t MobileInstallationRevertApplicationWithIdentityAndAssertionBlockWithError()
{
  return _MobileInstallationRevertApplicationWithIdentityAndAssertionBlockWithError();
}

uint64_t MobileInstallationUninstallAppWithIdentity()
{
  return _MobileInstallationUninstallAppWithIdentity();
}

uint64_t MobileInstallationUninstallForInstallCoordinationWithError()
{
  return _MobileInstallationUninstallForInstallCoordinationWithError();
}

uint64_t MobileInstallationUnregisterContentsForDiskImageAtURL()
{
  return _MobileInstallationUnregisterContentsForDiskImageAtURL();
}

uint64_t MobileInstallationUpdatePlaceholderMetadata()
{
  return _MobileInstallationUpdatePlaceholderMetadata();
}

uint64_t MobileInstallationUpdateSinfDataForInstallCoordination()
{
  return _MobileInstallationUpdateSinfDataForInstallCoordination();
}

uint64_t MobileInstallationUpdateiTunesMetadataForInstallCoordination()
{
  return _MobileInstallationUpdateiTunesMetadataForInstallCoordination();
}

Class NSClassFromString(NSString *aClassName)
{
  return _NSClassFromString(aClassName);
}

NSString *__cdecl NSStringFromClass(Class aClass)
{
  return _NSStringFromClass(aClass);
}

CFTypeRef SecTaskCopyValueForEntitlement(SecTaskRef task, CFStringRef entitlement, CFErrorRef *error)
{
  return _SecTaskCopyValueForEntitlement(task, entitlement, error);
}

SecTaskRef SecTaskCreateFromSelf(CFAllocatorRef allocator)
{
  return _SecTaskCreateFromSelf(allocator);
}

void _Block_object_dispose(const void *a1, const int a2)
{
}

uint64_t _CFBundleCreateFilteredInfoPlist()
{
  return __CFBundleCreateFilteredInfoPlist();
}

uint64_t _CFBundleCreateUnique()
{
  return __CFBundleCreateUnique();
}

uint64_t _CFPropertyListCreateFiltered()
{
  return __CFPropertyListCreateFiltered();
}

uint64_t _LSAppRemovalServiceXPCInterface()
{
  return __LSAppRemovalServiceXPCInterface();
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
}

int *__error(void)
{
  return ___error();
}

uint64_t __strlcpy_chk()
{
  return ___strlcpy_chk();
}

uint64_t _os_crash()
{
  return __os_crash();
}

uint64_t _os_crash_msg()
{
  return __os_crash_msg();
}

void _os_log_debug_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_log_error_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_log_fault_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

uint64_t _os_log_send_and_compose_impl()
{
  return __os_log_send_and_compose_impl();
}

uint64_t _set_user_dir_suffix()
{
  return __set_user_dir_suffix();
}

uint64_t _sl_dlopen()
{
  return __sl_dlopen();
}

void abort(void)
{
}

uint64_t abort_report_np()
{
  return _abort_report_np();
}

int acl_free(void *obj_p)
{
  return _acl_free(obj_p);
}

acl_t acl_get_link_np(const char *path_p, acl_type_t type)
{
  return _acl_get_link_np(path_p, type);
}

acl_t acl_init(int count)
{
  return _acl_init(count);
}

int acl_set_fd(int fd, acl_t acl)
{
  return _acl_set_fd(fd, acl);
}

int acl_set_link_np(const char *path_p, acl_type_t type, acl_t acl)
{
  return _acl_set_link_np(path_p, type, acl);
}

void bzero(void *a1, size_t a2)
{
}

int close(int a1)
{
  return _close(a1);
}

int closedir(DIR *a1)
{
  return _closedir(a1);
}

size_t confstr(int a1, char *a2, size_t a3)
{
  return _confstr(a1, a2, a3);
}

uint64_t container_delete_all_container_content()
{
  return _container_delete_all_container_content();
}

uint64_t container_error_copy_unlocalized_description()
{
  return _container_error_copy_unlocalized_description();
}

uint64_t container_error_get_posix_errno()
{
  return _container_error_get_posix_errno();
}

uint64_t container_get_error_description()
{
  return _container_get_error_description();
}

uint64_t container_query_create()
{
  return _container_query_create();
}

uint64_t container_query_free()
{
  return _container_query_free();
}

uint64_t container_query_get_last_error()
{
  return _container_query_get_last_error();
}

uint64_t container_query_get_single_result()
{
  return _container_query_get_single_result();
}

uint64_t container_query_operation_set_flags()
{
  return _container_query_operation_set_flags();
}

uint64_t container_query_set_class()
{
  return _container_query_set_class();
}

uint64_t container_query_set_identifiers()
{
  return _container_query_set_identifiers();
}

uint64_t container_query_set_persona_unique_string()
{
  return _container_query_set_persona_unique_string();
}

uint64_t container_query_set_transient()
{
  return _container_query_set_transient();
}

uint64_t container_system_group_path_for_identifier()
{
  return _container_system_group_path_for_identifier();
}

int copyfile(const char *from, const char *to, copyfile_state_t state, copyfile_flags_t flags)
{
  return _copyfile(from, to, state, flags);
}

char *__cdecl ctime_r(const time_t *a1, char *a2)
{
  return _ctime_r(a1, a2);
}

int dirfd(DIR *dirp)
{
  return _dirfd(dirp);
}

void dispatch_activate(dispatch_object_t object)
{
}

void dispatch_assert_queue_V2(dispatch_queue_t queue)
{
}

void dispatch_assert_queue_not_V2(dispatch_queue_t queue)
{
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
}

dispatch_queue_global_t dispatch_get_global_queue(intptr_t identifier, uintptr_t flags)
{
  return _dispatch_get_global_queue(identifier, flags);
}

dispatch_group_t dispatch_group_create(void)
{
  return _dispatch_group_create();
}

void dispatch_group_enter(dispatch_group_t group)
{
}

void dispatch_group_leave(dispatch_group_t group)
{
}

void dispatch_group_notify(dispatch_group_t group, dispatch_queue_t queue, dispatch_block_t block)
{
}

intptr_t dispatch_group_wait(dispatch_group_t group, dispatch_time_t timeout)
{
  return _dispatch_group_wait(group, timeout);
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
}

dispatch_queue_attr_t dispatch_queue_attr_make_with_autorelease_frequency(dispatch_queue_attr_t attr, dispatch_autorelease_frequency_t frequency)
{
  return _dispatch_queue_attr_make_with_autorelease_frequency(attr, frequency);
}

dispatch_queue_t dispatch_queue_create(const char *label, dispatch_queue_attr_t attr)
{
  return _dispatch_queue_create(label, attr);
}

void dispatch_resume(dispatch_object_t object)
{
}

dispatch_semaphore_t dispatch_semaphore_create(intptr_t value)
{
  return _dispatch_semaphore_create(value);
}

intptr_t dispatch_semaphore_signal(dispatch_semaphore_t dsema)
{
  return _dispatch_semaphore_signal(dsema);
}

intptr_t dispatch_semaphore_wait(dispatch_semaphore_t dsema, dispatch_time_t timeout)
{
  return _dispatch_semaphore_wait(dsema, timeout);
}

void dispatch_source_cancel(dispatch_source_t source)
{
}

dispatch_source_t dispatch_source_create(dispatch_source_type_t type, uintptr_t handle, uintptr_t mask, dispatch_queue_t queue)
{
  return _dispatch_source_create(type, handle, mask, queue);
}

void dispatch_source_set_cancel_handler(dispatch_source_t source, dispatch_block_t handler)
{
}

void dispatch_source_set_event_handler(dispatch_source_t source, dispatch_block_t handler)
{
}

void dispatch_source_set_timer(dispatch_source_t source, dispatch_time_t start, uint64_t interval, uint64_t leeway)
{
}

intptr_t dispatch_source_testcancel(dispatch_source_t source)
{
  return _dispatch_source_testcancel(source);
}

void dispatch_sync(dispatch_queue_t queue, dispatch_block_t block)
{
}

dispatch_time_t dispatch_time(dispatch_time_t when, int64_t delta)
{
  return _dispatch_time(when, delta);
}

char *dlerror(void)
{
  return _dlerror();
}

void *__cdecl dlopen(const char *__path, int __mode)
{
  return _dlopen(__path, __mode);
}

void *__cdecl dlsym(void *__handle, const char *__symbol)
{
  return _dlsym(__handle, __symbol);
}

void exit(int a1)
{
}

int fcntl(int a1, int a2, ...)
{
  return _fcntl(a1, a2);
}

DIR *__cdecl fdopendir(int a1)
{
  return _fdopendir(a1);
}

void free(void *a1)
{
}

int fts_close(FTS *a1)
{
  return _fts_close(a1);
}

FTS *__cdecl fts_open(char *const *a1, int a2, int (__cdecl *a3)(const FTSENT **, const FTSENT **))
{
  return _fts_open(a1, a2, a3);
}

FTSENT *__cdecl fts_read(FTS *a1)
{
  return _fts_read(a1);
}

int getattrlistbulk(int a1, void *a2, void *a3, size_t a4, uint64_t a5)
{
  return _getattrlistbulk(a1, a2, a3, a4, a5);
}

uid_t geteuid(void)
{
  return _geteuid();
}

pid_t getpid(void)
{
  return _getpid();
}

int getpwnam_r(const char *a1, passwd *a2, char *a3, size_t a4, passwd **a5)
{
  return _getpwnam_r(a1, a2, a3, a4, a5);
}

int lchmod(const char *a1, mode_t a2)
{
  return _lchmod(a1, a2);
}

int lstat(const char *a1, stat *a2)
{
  return _lstat(a1, a2);
}

void *__cdecl malloc_type_calloc(size_t count, size_t size, malloc_type_id_t type_id)
{
  return _malloc_type_calloc(count, size, type_id);
}

void *__cdecl malloc_type_malloc(size_t size, malloc_type_id_t type_id)
{
  return _malloc_type_malloc(size, type_id);
}

void *__cdecl memcpy(void *__dst, const void *__src, size_t __n)
{
  return _memcpy(__dst, __src, __n);
}

int mkdir(const char *a1, mode_t a2)
{
  return _mkdir(a1, a2);
}

char *__cdecl mkdtemp(char *a1)
{
  return _mkdtemp(a1);
}

int mkpath_np(const char *path, mode_t omode)
{
  return _mkpath_np(path, omode);
}

id objc_alloc(Class a1)
{
  return _[a1 alloc];
}

id objc_allocWithZone(Class a1)
{
  return _objc_allocWithZone(a1);
}

uint64_t objc_alloc_init()
{
  return _objc_alloc_init();
}

id objc_autorelease(id a1)
{
  return _objc_autorelease(a1);
}

{
}

{
}

id objc_autoreleaseReturnValue(id a1)
{
  return _objc_autoreleaseReturnValue(a1);
}

id objc_begin_catch(void *exc_buf)
{
  return _objc_begin_catch(exc_buf);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return _objc_claimAutoreleasedReturnValue();
}

void objc_copyWeak(id *to, id *from)
{
}

void objc_destroyWeak(id *location)
{
}

void objc_end_catch(void)
{
}

void objc_enumerationMutation(id obj)
{
}

void objc_exception_rethrow(void)
{
}

id objc_initWeak(id *location, id val)
{
  return _objc_initWeak(location, val);
}

id objc_loadWeakRetained(id *location)
{
  return _objc_loadWeakRetained(location);
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

uint64_t objc_opt_new()
{
  return _objc_opt_new();
}

uint64_t objc_opt_respondsToSelector()
{
  return _objc_opt_respondsToSelector();
}

void objc_release(id a1)
{
}

id objc_retain(id a1)
{
  return _objc_retain(a1);
}

id objc_retainAutorelease(id a1)
{
  return _a1;
}

id objc_retainAutoreleaseReturnValue(id a1)
{
  return _a1;
}

id objc_retainAutoreleasedReturnValue(id a1)
{
  return _a1;
}

id objc_retainBlock(id a1)
{
  return _objc_retainBlock(a1);
}

void objc_setProperty_nonatomic_copy(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
}

void objc_storeStrong(id *location, id obj)
{
}

id objc_storeWeak(id *location, id obj)
{
  return _objc_storeWeak(location, obj);
}

int objc_sync_enter(id obj)
{
  return _objc_sync_enter(obj);
}

int objc_sync_exit(id obj)
{
  return _objc_sync_exit(obj);
}

void objc_terminate(void)
{
}

id objc_unsafeClaimAutoreleasedReturnValue(id a1)
{
  return _objc_unsafeClaimAutoreleasedReturnValue(a1);
}

int open(const char *a1, int a2, ...)
{
  return _open(a1, a2);
}

DIR *__cdecl opendir(const char *a1)
{
  return _opendir(a1);
}

uint64_t os_eligibility_get_domain_answer()
{
  return _os_eligibility_get_domain_answer();
}

os_log_t os_log_create(const char *subsystem, const char *category)
{
  return _os_log_create(subsystem, category);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return _os_log_type_enabled(oslog, type);
}

uint64_t os_state_add_handler()
{
  return _os_state_add_handler();
}

uint64_t os_transaction_create()
{
  return _os_transaction_create();
}

void os_unfair_lock_lock(os_unfair_lock_t lock)
{
}

void os_unfair_lock_unlock(os_unfair_lock_t lock)
{
}

int proc_pidpath(int pid, void *buffer, uint32_t buffersize)
{
  return _proc_pidpath(pid, buffer, buffersize);
}

int proc_pidpath_audittoken(audit_token_t *audittoken, void *buffer, uint32_t buffersize)
{
  return _proc_pidpath_audittoken(audittoken, buffer, buffersize);
}

int pthread_mutex_lock(pthread_mutex_t *a1)
{
  return _pthread_mutex_lock(a1);
}

qos_class_t qos_class_self(void)
{
  return _qos_class_self();
}

int readdir_r(DIR *a1, dirent *a2, dirent **a3)
{
  return _readdir_r(a1, a2, a3);
}

ssize_t readlink(const char *a1, char *a2, size_t a3)
{
  return _readlink(a1, a2, a3);
}

char *__cdecl realpath_DARWIN_EXTSN(const char *a1, char *a2)
{
  return _realpath_DARWIN_EXTSN(a1, a2);
}

int removefile(const char *path, removefile_state_t state, removefile_flags_t flags)
{
  return _removefile(path, state, flags);
}

removefile_state_t removefile_state_alloc(void)
{
  return _removefile_state_alloc();
}

int removefile_state_free(removefile_state_t a1)
{
  return _removefile_state_free(a1);
}

int removefile_state_get(removefile_state_t state, uint32_t key, void *dst)
{
  return _removefile_state_get(state, key, dst);
}

int removefile_state_set(removefile_state_t state, uint32_t key, const void *value)
{
  return _removefile_state_set(state, key, value);
}

void rename(const std::__fs::filesystem::path *__from, const std::__fs::filesystem::path *__to, std::error_code *__ec)
{
}

uint64_t sandbox_check()
{
  return _sandbox_check();
}

uint64_t sandbox_extension_issue_file()
{
  return _sandbox_extension_issue_file();
}

int sem_close(sem_t *a1)
{
  return _sem_close(a1);
}

sem_t *sem_open(const char *a1, int a2, ...)
{
  return _sem_open(a1, a2);
}

void (__cdecl *__cdecl signal(int a1, void (__cdecl *a2)(int)))(int)
{
  return _signal(a1, a2);
}

unsigned int sleep(unsigned int a1)
{
  return _sleep(a1);
}

int statfs(const char *a1, statfs *a2)
{
  return _statfs(a1, a2);
}

int strcmp(const char *__s1, const char *__s2)
{
  return _strcmp(__s1, __s2);
}

char *__cdecl strdup(const char *__s1)
{
  return _strdup(__s1);
}

char *__cdecl strerror(int __errnum)
{
  return _strerror(__errnum);
}

size_t strlen(const char *__s)
{
  return _strlen(__s);
}

int symlink(const char *a1, const char *a2)
{
  return _symlink(a1, a2);
}

uint64_t sysconf(int a1)
{
  return _sysconf(a1);
}

time_t time(time_t *a1)
{
  return _time(a1);
}

uint64_t xpc_add_bundle()
{
  return _xpc_add_bundle();
}

xpc_object_t xpc_BOOL_create(BOOL value)
{
  return _xpc_BOOL_create(value);
}

BOOL xpc_BOOL_get_value(xpc_object_t xBOOL)
{
  return _xpc_BOOL_get_value(xBOOL);
}

void xpc_connection_activate(xpc_connection_t connection)
{
}

void xpc_connection_cancel(xpc_connection_t connection)
{
}

xpc_connection_t xpc_connection_create(const char *name, dispatch_queue_t targetq)
{
  return _xpc_connection_create(name, targetq);
}

uint64_t xpc_connection_kill()
{
  return _xpc_connection_kill();
}

void xpc_connection_send_message(xpc_connection_t connection, xpc_object_t message)
{
}

void xpc_connection_set_event_handler(xpc_connection_t connection, xpc_handler_t handler)
{
}

void xpc_connection_set_target_queue(xpc_connection_t connection, dispatch_queue_t targetq)
{
}

char *__cdecl xpc_copy_description(xpc_object_t object)
{
  return _xpc_copy_description(object);
}

xpc_object_t xpc_dictionary_create(const char *const *keys, xpc_object_t *values, size_t count)
{
  return _xpc_dictionary_create(keys, values, count);
}

const char *__cdecl xpc_dictionary_get_string(xpc_object_t xdict, const char *key)
{
  return _xpc_dictionary_get_string(xdict, key);
}

xpc_object_t xpc_dictionary_get_value(xpc_object_t xdict, const char *key)
{
  return _xpc_dictionary_get_value(xdict, key);
}

xpc_endpoint_t xpc_endpoint_create(xpc_connection_t connection)
{
  return _xpc_endpoint_create(connection);
}

xpc_type_t xpc_get_type(xpc_object_t object)
{
  return _xpc_get_type(object);
}

int64_t xpc_int64_get_value(xpc_object_t xint)
{
  return _xpc_int64_get_value(xint);
}

void xpc_set_event_stream_handler(const char *stream, dispatch_queue_t targetq, xpc_handler_t handler)
{
}

xpc_object_t xpc_string_create(const char *string)
{
  return _xpc_string_create(string);
}

uint64_t xpc_transaction_exit_clean()
{
  return _xpc_transaction_exit_clean();
}

id objc_msgSend_URL(void *a1, const char *a2, ...)
{
  return [a1 URL];
}

id objc_msgSend_URLQueryAllowedCharacterSet(void *a1, const char *a2, ...)
{
  return [a1 URLQueryAllowedCharacterSet];
}

id objc_msgSend_UTF8String(void *a1, const char *a2, ...)
{
  return [a1 UTF8String];
}

id objc_msgSend_UUID(void *a1, const char *a2, ...)
{
  return [a1 UUID];
}

id objc_msgSend_UUIDString(void *a1, const char *a2, ...)
{
  return [a1 UUIDString];
}

id objc_msgSend__createPowerAssertion(void *a1, const char *a2, ...)
{
  return [a1 _createPowerAssertion];
}

id objc_msgSend__customDeleteStringForMessagesApp(void *a1, const char *a2, ...)
{
  return [a1 _customDeleteStringForMessagesApp];
}

id objc_msgSend__deserializePendingOperationIdentities(void *a1, const char *a2, ...)
{
  return [a1 _deserializePendingOperationIdentities];
}

id objc_msgSend__domainToAppIdentitySetMap(void *a1, const char *a2, ...)
{
  return [a1 _domainToAppIdentitySetMap];
}

id objc_msgSend__eligibleToScheduleUpdate(void *a1, const char *a2, ...)
{
  return [a1 _eligibleToScheduleUpdate];
}

id objc_msgSend__initInternalState(void *a1, const char *a2, ...)
{
  return [a1 _initInternalState];
}

id objc_msgSend__isReadyToMaterialize(void *a1, const char *a2, ...)
{
  return [a1 _isReadyToMaterialize];
}

id objc_msgSend__localizedNameForDefaultAppMarketplace(void *a1, const char *a2, ...)
{
  return [a1 _localizedNameForDefaultAppMarketplace];
}

id objc_msgSend__materialize(void *a1, const char *a2, ...)
{
  return [a1 _materialize];
}

id objc_msgSend__materializeIfReady(void *a1, const char *a2, ...)
{
  return [a1 _materializeIfReady];
}

id objc_msgSend__plistKeys(void *a1, const char *a2, ...)
{
  return [a1 _plistKeys];
}

id objc_msgSend__removeSavedState(void *a1, const char *a2, ...)
{
  return [a1 _removeSavedState];
}

id objc_msgSend__saveMapping(void *a1, const char *a2, ...)
{
  return [a1 _saveMapping];
}

id objc_msgSend__screenTimeManagementEnabled(void *a1, const char *a2, ...)
{
  return [a1 _screenTimeManagementEnabled];
}

id objc_msgSend__systemAppPlaceholderEnumerator(void *a1, const char *a2, ...)
{
  return [a1 _systemAppPlaceholderEnumerator];
}

id objc_msgSend__testAppRemovabilityBundleID(void *a1, const char *a2, ...)
{
  return [a1 _testAppRemovabilityBundleID];
}

id objc_msgSend__webContentFilterEnabled(void *a1, const char *a2, ...)
{
  return [a1 _webContentFilterEnabled];
}

id objc_msgSend__xpcConnection(void *a1, const char *a2, ...)
{
  return [a1 _xpcConnection];
}

id objc_msgSend_accessQueue(void *a1, const char *a2, ...)
{
  return [a1 accessQueue];
}

id objc_msgSend_acquireDatabase(void *a1, const char *a2, ...)
{
  return [a1 acquireDatabase];
}

id objc_msgSend_actionDefinitions(void *a1, const char *a2, ...)
{
  return [a1 actionDefinitions];
}

id objc_msgSend_activeIdentities(void *a1, const char *a2, ...)
{
  return [a1 activeIdentities];
}

id objc_msgSend_alertParameters(void *a1, const char *a2, ...)
{
  return [a1 alertParameters];
}

id objc_msgSend_allAppRemovability(void *a1, const char *a2, ...)
{
  return [a1 allAppRemovability];
}

id objc_msgSend_allConnections(void *a1, const char *a2, ...)
{
  return [a1 allConnections];
}

id objc_msgSend_allConnectionsQueue(void *a1, const char *a2, ...)
{
  return [a1 allConnectionsQueue];
}

id objc_msgSend_allKeys(void *a1, const char *a2, ...)
{
  return [a1 allKeys];
}

id objc_msgSend_allObjects(void *a1, const char *a2, ...)
{
  return [a1 allObjects];
}

id objc_msgSend_allValues(void *a1, const char *a2, ...)
{
  return [a1 allValues];
}

id objc_msgSend_allowEvaluation(void *a1, const char *a2, ...)
{
  return [a1 allowEvaluation];
}

id objc_msgSend_appAssetPromise(void *a1, const char *a2, ...)
{
  return [a1 appAssetPromise];
}

id objc_msgSend_appAssetPromiseDRI(void *a1, const char *a2, ...)
{
  return [a1 appAssetPromiseDRI];
}

id objc_msgSend_appAssetPromiseSetterCanInstallLocalProvisionedContent(void *a1, const char *a2, ...)
{
  return [a1 appAssetPromiseSetterCanInstallLocalProvisionedContent];
}

id objc_msgSend_appAssetPromiseUUID(void *a1, const char *a2, ...)
{
  return [a1 appAssetPromiseUUID];
}

id objc_msgSend_appExtensionPlaceholders(void *a1, const char *a2, ...)
{
  return [a1 appExtensionPlaceholders];
}

id objc_msgSend_appExtensionPlaceholdersPromiseUUIDs(void *a1, const char *a2, ...)
{
  return [a1 appExtensionPlaceholdersPromiseUUIDs];
}

id objc_msgSend_appHasInstalledFonts(void *a1, const char *a2, ...)
{
  return [a1 appHasInstalledFonts];
}

id objc_msgSend_appHasiCloudDataOrDocuments(void *a1, const char *a2, ...)
{
  return [a1 appHasiCloudDataOrDocuments];
}

id objc_msgSend_appInstallPowerAssertion(void *a1, const char *a2, ...)
{
  return [a1 appInstallPowerAssertion];
}

id objc_msgSend_appInstallState(void *a1, const char *a2, ...)
{
  return [a1 appInstallState];
}

id objc_msgSend_appInstalledFonts(void *a1, const char *a2, ...)
{
  return [a1 appInstalledFonts];
}

id objc_msgSend_appIsRemovable(void *a1, const char *a2, ...)
{
  return [a1 appIsRemovable];
}

id objc_msgSend_appManagedByManagedSettings(void *a1, const char *a2, ...)
{
  return [a1 appManagedByManagedSettings];
}

id objc_msgSend_appRecord(void *a1, const char *a2, ...)
{
  return [a1 appRecord];
}

id objc_msgSend_appReference(void *a1, const char *a2, ...)
{
  return [a1 appReference];
}

id objc_msgSend_appReferencesEnabled(void *a1, const char *a2, ...)
{
  return [a1 appReferencesEnabled];
}

id objc_msgSend_appRemovability(void *a1, const char *a2, ...)
{
  return [a1 appRemovability];
}

id objc_msgSend_appStringsBundle(void *a1, const char *a2, ...)
{
  return [a1 appStringsBundle];
}

id objc_msgSend_appStringsTableName(void *a1, const char *a2, ...)
{
  return [a1 appStringsTableName];
}

id objc_msgSend_appType(void *a1, const char *a2, ...)
{
  return [a1 appType];
}

id objc_msgSend_applicationExtensionRecords(void *a1, const char *a2, ...)
{
  return [a1 applicationExtensionRecords];
}

id objc_msgSend_arcadeApp(void *a1, const char *a2, ...)
{
  return [a1 arcadeApp];
}

id objc_msgSend_archiveBytesConsumed(void *a1, const char *a2, ...)
{
  return [a1 archiveBytesConsumed];
}

id objc_msgSend_archiveSizeBytes(void *a1, const char *a2, ...)
{
  return [a1 archiveSizeBytes];
}

id objc_msgSend_array(void *a1, const char *a2, ...)
{
  return [a1 array];
}

id objc_msgSend_assertionQueue(void *a1, const char *a2, ...)
{
  return [a1 assertionQueue];
}

id objc_msgSend_assertionRetryCount(void *a1, const char *a2, ...)
{
  return [a1 assertionRetryCount];
}

id objc_msgSend_assertionRetryTimer(void *a1, const char *a2, ...)
{
  return [a1 assertionRetryTimer];
}

id objc_msgSend_attributes(void *a1, const char *a2, ...)
{
  return [a1 attributes];
}

id objc_msgSend_auditToken(void *a1, const char *a2, ...)
{
  return [a1 auditToken];
}

id objc_msgSend_awakeningError(void *a1, const char *a2, ...)
{
  return [a1 awakeningError];
}

id objc_msgSend_block(void *a1, const char *a2, ...)
{
  return [a1 block];
}

id objc_msgSend_BOOLValue(void *a1, const char *a2, ...)
{
  return [a1 BOOLValue];
}

id objc_msgSend_build(void *a1, const char *a2, ...)
{
  return [a1 build];
}

id objc_msgSend_bundleContainerURL(void *a1, const char *a2, ...)
{
  return [a1 bundleContainerURL];
}

id objc_msgSend_bundleID(void *a1, const char *a2, ...)
{
  return [a1 bundleID];
}

id objc_msgSend_bundleId(void *a1, const char *a2, ...)
{
  return [a1 bundleId];
}

id objc_msgSend_bundleIdentifier(void *a1, const char *a2, ...)
{
  return [a1 bundleIdentifier];
}

id objc_msgSend_bundleName(void *a1, const char *a2, ...)
{
  return [a1 bundleName];
}

id objc_msgSend_bundleVersion(void *a1, const char *a2, ...)
{
  return [a1 bundleVersion];
}

id objc_msgSend_buttonDefinitionForSB(void *a1, const char *a2, ...)
{
  return [a1 buttonDefinitionForSB];
}

id objc_msgSend_buttonDefinitions(void *a1, const char *a2, ...)
{
  return [a1 buttonDefinitions];
}

id objc_msgSend_buttonType(void *a1, const char *a2, ...)
{
  return [a1 buttonType];
}

id objc_msgSend_bytes(void *a1, const char *a2, ...)
{
  return [a1 bytes];
}

id objc_msgSend_bytesConsumedOnDisk(void *a1, const char *a2, ...)
{
  return [a1 bytesConsumedOnDisk];
}

id objc_msgSend_cachedCurrentPhaseProgress(void *a1, const char *a2, ...)
{
  return [a1 cachedCurrentPhaseProgress];
}

id objc_msgSend_callStackSymbols(void *a1, const char *a2, ...)
{
  return [a1 callStackSymbols];
}

id objc_msgSend_cancelButtonLabel(void *a1, const char *a2, ...)
{
  return [a1 cancelButtonLabel];
}

id objc_msgSend_cancelOrphanedPromisesAndRemovePromiseReferences(void *a1, const char *a2, ...)
{
  return [a1 cancelOrphanedPromisesAndRemovePromiseReferences];
}

id objc_msgSend_canonicalSerializationForPlistKey(void *a1, const char *a2, ...)
{
  return [a1 canonicalSerializationForPlistKey];
}

id objc_msgSend_clearAllPendingOperations(void *a1, const char *a2, ...)
{
  return [a1 clearAllPendingOperations];
}

id objc_msgSend_client(void *a1, const char *a2, ...)
{
  return [a1 client];
}

id objc_msgSend_clientAuditToken(void *a1, const char *a2, ...)
{
  return [a1 clientAuditToken];
}

id objc_msgSend_clientConnections(void *a1, const char *a2, ...)
{
  return [a1 clientConnections];
}

id objc_msgSend_clientName(void *a1, const char *a2, ...)
{
  return [a1 clientName];
}

id objc_msgSend_clientProcessExists(void *a1, const char *a2, ...)
{
  return [a1 clientProcessExists];
}

id objc_msgSend_clientSeed(void *a1, const char *a2, ...)
{
  return [a1 clientSeed];
}

id objc_msgSend_clientToObserverEndpointMap(void *a1, const char *a2, ...)
{
  return [a1 clientToObserverEndpointMap];
}

id objc_msgSend_clientToObserverServiceNameMap(void *a1, const char *a2, ...)
{
  return [a1 clientToObserverServiceNameMap];
}

id objc_msgSend_clientToRemovabilityMetadataMap(void *a1, const char *a2, ...)
{
  return [a1 clientToRemovabilityMetadataMap];
}

id objc_msgSend_code(void *a1, const char *a2, ...)
{
  return [a1 code];
}

id objc_msgSend_companionBundleIdentifierForWatchApp(void *a1, const char *a2, ...)
{
  return [a1 companionBundleIdentifierForWatchApp];
}

id objc_msgSend_compatibilityObject(void *a1, const char *a2, ...)
{
  return [a1 compatibilityObject];
}

id objc_msgSend_completedRecordPromise(void *a1, const char *a2, ...)
{
  return [a1 completedRecordPromise];
}

id objc_msgSend_compressedAppAssetSizeInBytes(void *a1, const char *a2, ...)
{
  return [a1 compressedAppAssetSizeInBytes];
}

id objc_msgSend_configurationComplete(void *a1, const char *a2, ...)
{
  return [a1 configurationComplete];
}

id objc_msgSend_configureService(void *a1, const char *a2, ...)
{
  return [a1 configureService];
}

id objc_msgSend_connection(void *a1, const char *a2, ...)
{
  return [a1 connection];
}

id objc_msgSend_connectionInvalidated(void *a1, const char *a2, ...)
{
  return [a1 connectionInvalidated];
}

id objc_msgSend_connectionToProcessScopedCoordinatorMap(void *a1, const char *a2, ...)
{
  return [a1 connectionToProcessScopedCoordinatorMap];
}

id objc_msgSend_connectionUUID(void *a1, const char *a2, ...)
{
  return [a1 connectionUUID];
}

id objc_msgSend_coordinatorCount(void *a1, const char *a2, ...)
{
  return [a1 coordinatorCount];
}

id objc_msgSend_coordinatorProgress(void *a1, const char *a2, ...)
{
  return [a1 coordinatorProgress];
}

id objc_msgSend_coordinatorScope(void *a1, const char *a2, ...)
{
  return [a1 coordinatorScope];
}

id objc_msgSend_copy(void *a1, const char *a2, ...)
{
  return [a1 copy];
}

id objc_msgSend_count(void *a1, const char *a2, ...)
{
  return [a1 count];
}

id objc_msgSend_createDirectories(void *a1, const char *a2, ...)
{
  return [a1 createDirectories];
}

id objc_msgSend_createQueue(void *a1, const char *a2, ...)
{
  return [a1 createQueue];
}

id objc_msgSend_creator(void *a1, const char *a2, ...)
{
  return [a1 creator];
}

id objc_msgSend_creatorEUID(void *a1, const char *a2, ...)
{
  return [a1 creatorEUID];
}

id objc_msgSend_creatorHadWebPlaceholderInstallEntitlement(void *a1, const char *a2, ...)
{
  return [a1 creatorHadWebPlaceholderInstallEntitlement];
}

id objc_msgSend_creatorIdentifier(void *a1, const char *a2, ...)
{
  return [a1 creatorIdentifier];
}

id objc_msgSend_currentPersona(void *a1, const char *a2, ...)
{
  return [a1 currentPersona];
}

id objc_msgSend_currentPhaseProgress(void *a1, const char *a2, ...)
{
  return [a1 currentPhaseProgress];
}

id objc_msgSend_currentProgressPhaseIsComplete(void *a1, const char *a2, ...)
{
  return [a1 currentProgressPhaseIsComplete];
}

id objc_msgSend_currentThread(void *a1, const char *a2, ...)
{
  return [a1 currentThread];
}

id objc_msgSend_data(void *a1, const char *a2, ...)
{
  return [a1 data];
}

id objc_msgSend_dataDirectoryAbortingOnError(void *a1, const char *a2, ...)
{
  return [a1 dataDirectoryAbortingOnError];
}

id objc_msgSend_date(void *a1, const char *a2, ...)
{
  return [a1 date];
}

id objc_msgSend_decommission(void *a1, const char *a2, ...)
{
  return [a1 decommission];
}

id objc_msgSend_defaultAppCandidates(void *a1, const char *a2, ...)
{
  return [a1 defaultAppCandidates];
}

id objc_msgSend_defaultButtonAppearsDestructive(void *a1, const char *a2, ...)
{
  return [a1 defaultButtonAppearsDestructive];
}

id objc_msgSend_defaultButtonLabel(void *a1, const char *a2, ...)
{
  return [a1 defaultButtonLabel];
}

id objc_msgSend_defaultCenter(void *a1, const char *a2, ...)
{
  return [a1 defaultCenter];
}

id objc_msgSend_defaultManager(void *a1, const char *a2, ...)
{
  return [a1 defaultManager];
}

id objc_msgSend_defaultStringsBundle(void *a1, const char *a2, ...)
{
  return [a1 defaultStringsBundle];
}

id objc_msgSend_defaultStringsTableName(void *a1, const char *a2, ...)
{
  return [a1 defaultStringsTableName];
}

id objc_msgSend_defaultWorkspace(void *a1, const char *a2, ...)
{
  return [a1 defaultWorkspace];
}

id objc_msgSend_delegate(void *a1, const char *a2, ...)
{
  return [a1 delegate];
}

id objc_msgSend_delegateCallQueue(void *a1, const char *a2, ...)
{
  return [a1 delegateCallQueue];
}

id objc_msgSend_delegateDeliveryQueue(void *a1, const char *a2, ...)
{
  return [a1 delegateDeliveryQueue];
}

id objc_msgSend_deletionIsRestricted(void *a1, const char *a2, ...)
{
  return [a1 deletionIsRestricted];
}

id objc_msgSend_descString(void *a1, const char *a2, ...)
{
  return [a1 descString];
}

id objc_msgSend_description(void *a1, const char *a2, ...)
{
  return [a1 description];
}

id objc_msgSend_deviceBasedVPP(void *a1, const char *a2, ...)
{
  return [a1 deviceBasedVPP];
}

id objc_msgSend_deviceHasOneHomeEnabled(void *a1, const char *a2, ...)
{
  return [a1 deviceHasOneHomeEnabled];
}

id objc_msgSend_deviceSecurityPromise(void *a1, const char *a2, ...)
{
  return [a1 deviceSecurityPromise];
}

id objc_msgSend_deviceSecurityPromiseUUID(void *a1, const char *a2, ...)
{
  return [a1 deviceSecurityPromiseUUID];
}

id objc_msgSend_dictionary(void *a1, const char *a2, ...)
{
  return [a1 dictionary];
}

id objc_msgSend_dictionaryRepresentation(void *a1, const char *a2, ...)
{
  return [a1 dictionaryRepresentation];
}

id objc_msgSend_didAwake(void *a1, const char *a2, ...)
{
  return [a1 didAwake];
}

id objc_msgSend_dismissAlert(void *a1, const char *a2, ...)
{
  return [a1 dismissAlert];
}

id objc_msgSend_dismissRemoteAlert(void *a1, const char *a2, ...)
{
  return [a1 dismissRemoteAlert];
}

id objc_msgSend_distributorID(void *a1, const char *a2, ...)
{
  return [a1 distributorID];
}

id objc_msgSend_distributorInfo(void *a1, const char *a2, ...)
{
  return [a1 distributorInfo];
}

id objc_msgSend_distributorIsThirdParty(void *a1, const char *a2, ...)
{
  return [a1 distributorIsThirdParty];
}

id objc_msgSend_distributorType(void *a1, const char *a2, ...)
{
  return [a1 distributorType];
}

id objc_msgSend_domain(void *a1, const char *a2, ...)
{
  return [a1 domain];
}

id objc_msgSend_domainToEligibilityAnswerMap(void *a1, const char *a2, ...)
{
  return [a1 domainToEligibilityAnswerMap];
}

id objc_msgSend_doubleValue(void *a1, const char *a2, ...)
{
  return [a1 doubleValue];
}

id objc_msgSend_driverExtensionPaths(void *a1, const char *a2, ...)
{
  return [a1 driverExtensionPaths];
}

id objc_msgSend_effectiveIntent(void *a1, const char *a2, ...)
{
  return [a1 effectiveIntent];
}

id objc_msgSend_eligibilityDeletionDomain(void *a1, const char *a2, ...)
{
  return [a1 eligibilityDeletionDomain];
}

id objc_msgSend_eligibilityDidChange(void *a1, const char *a2, ...)
{
  return [a1 eligibilityDidChange];
}

id objc_msgSend_encodedData(void *a1, const char *a2, ...)
{
  return [a1 encodedData];
}

id objc_msgSend_entitlements(void *a1, const char *a2, ...)
{
  return [a1 entitlements];
}

id objc_msgSend_entitlementsPromiseUUID(void *a1, const char *a2, ...)
{
  return [a1 entitlementsPromiseUUID];
}

id objc_msgSend_error(void *a1, const char *a2, ...)
{
  return [a1 error];
}

id objc_msgSend_errorSourceIdentifier(void *a1, const char *a2, ...)
{
  return [a1 errorSourceIdentifier];
}

id objc_msgSend_essentialAssetPromiseUUIDs(void *a1, const char *a2, ...)
{
  return [a1 essentialAssetPromiseUUIDs];
}

id objc_msgSend_essentialAssetPromises(void *a1, const char *a2, ...)
{
  return [a1 essentialAssetPromises];
}

id objc_msgSend_exAppExtensionAttributes(void *a1, const char *a2, ...)
{
  return [a1 exAppExtensionAttributes];
}

id objc_msgSend_expectTermAssertionCallback(void *a1, const char *a2, ...)
{
  return [a1 expectTermAssertionCallback];
}

id objc_msgSend_extensionDictionary(void *a1, const char *a2, ...)
{
  return [a1 extensionDictionary];
}

id objc_msgSend_extensionPointRecord(void *a1, const char *a2, ...)
{
  return [a1 extensionPointRecord];
}

id objc_msgSend_extractionPath(void *a1, const char *a2, ...)
{
  return [a1 extractionPath];
}

id objc_msgSend_fakeClientProcessDeath(void *a1, const char *a2, ...)
{
  return [a1 fakeClientProcessDeath];
}

id objc_msgSend_fileSystemRepresentation(void *a1, const char *a2, ...)
{
  return [a1 fileSystemRepresentation];
}

id objc_msgSend_filesInAppAssetCount(void *a1, const char *a2, ...)
{
  return [a1 filesInAppAssetCount];
}

id objc_msgSend_finishDecoding(void *a1, const char *a2, ...)
{
  return [a1 finishDecoding];
}

id objc_msgSend_finishInstalling(void *a1, const char *a2, ...)
{
  return [a1 finishInstalling];
}

id objc_msgSend_finishLoading(void *a1, const char *a2, ...)
{
  return [a1 finishLoading];
}

id objc_msgSend_finishPostProcessing(void *a1, const char *a2, ...)
{
  return [a1 finishPostProcessing];
}

id objc_msgSend_firstAppExtensionBusyTime(void *a1, const char *a2, ...)
{
  return [a1 firstAppExtensionBusyTime];
}

id objc_msgSend_firstObject(void *a1, const char *a2, ...)
{
  return [a1 firstObject];
}

id objc_msgSend_fontFamilies(void *a1, const char *a2, ...)
{
  return [a1 fontFamilies];
}

id objc_msgSend_frameworkURL(void *a1, const char *a2, ...)
{
  return [a1 frameworkURL];
}

id objc_msgSend_getActivePairedDevice(void *a1, const char *a2, ...)
{
  return [a1 getActivePairedDevice];
}

id objc_msgSend_getDefaultNFCApplication(void *a1, const char *a2, ...)
{
  return [a1 getDefaultNFCApplication];
}

id objc_msgSend_guid(void *a1, const char *a2, ...)
{
  return [a1 guid];
}

id objc_msgSend_handleFirstUnlockNotification(void *a1, const char *a2, ...)
{
  return [a1 handleFirstUnlockNotification];
}

id objc_msgSend_hasBegun(void *a1, const char *a2, ...)
{
  return [a1 hasBegun];
}

id objc_msgSend_hasParallelPlaceholder(void *a1, const char *a2, ...)
{
  return [a1 hasParallelPlaceholder];
}

id objc_msgSend_hash(void *a1, const char *a2, ...)
{
  return [a1 hash];
}

id objc_msgSend_healthAppHiddenOrNotInstalled(void *a1, const char *a2, ...)
{
  return [a1 healthAppHiddenOrNotInstalled];
}

id objc_msgSend_healthAppSupportedOnDevice(void *a1, const char *a2, ...)
{
  return [a1 healthAppSupportedOnDevice];
}

id objc_msgSend_healthKitDataSupportedOnDevice(void *a1, const char *a2, ...)
{
  return [a1 healthKitDataSupportedOnDevice];
}

id objc_msgSend_hkBehaviorClass(void *a1, const char *a2, ...)
{
  return [a1 hkBehaviorClass];
}

id objc_msgSend_hkHealthStoreClass(void *a1, const char *a2, ...)
{
  return [a1 hkHealthStoreClass];
}

id objc_msgSend_hkSourceStoreClass(void *a1, const char *a2, ...)
{
  return [a1 hkSourceStoreClass];
}

id objc_msgSend_iCloudIsEnabledForMessages(void *a1, const char *a2, ...)
{
  return [a1 iCloudIsEnabledForMessages];
}

id objc_msgSend_iTunesMetadata(void *a1, const char *a2, ...)
{
  return [a1 iTunesMetadata];
}

id objc_msgSend_icon(void *a1, const char *a2, ...)
{
  return [a1 icon];
}

id objc_msgSend_iconPromiseUUID(void *a1, const char *a2, ...)
{
  return [a1 iconPromiseUUID];
}

id objc_msgSend_iconResourcesPromise(void *a1, const char *a2, ...)
{
  return [a1 iconResourcesPromise];
}

id objc_msgSend_iconResourcesPromiseUUID(void *a1, const char *a2, ...)
{
  return [a1 iconResourcesPromiseUUID];
}

id objc_msgSend_identifier(void *a1, const char *a2, ...)
{
  return [a1 identifier];
}

id objc_msgSend_identities(void *a1, const char *a2, ...)
{
  return [a1 identities];
}

id objc_msgSend_identity(void *a1, const char *a2, ...)
{
  return [a1 identity];
}

id objc_msgSend_identityPriority(void *a1, const char *a2, ...)
{
  return [a1 identityPriority];
}

id objc_msgSend_identityQueue(void *a1, const char *a2, ...)
{
  return [a1 identityQueue];
}

id objc_msgSend_identityToCoordinatorMap(void *a1, const char *a2, ...)
{
  return [a1 identityToCoordinatorMap];
}

id objc_msgSend_ignoreAppProtection(void *a1, const char *a2, ...)
{
  return [a1 ignoreAppProtection];
}

id objc_msgSend_ignoreRemovability(void *a1, const char *a2, ...)
{
  return [a1 ignoreRemovability];
}

id objc_msgSend_ignoreRestrictions(void *a1, const char *a2, ...)
{
  return [a1 ignoreRestrictions];
}

id objc_msgSend_importance(void *a1, const char *a2, ...)
{
  return [a1 importance];
}

id objc_msgSend_increment(void *a1, const char *a2, ...)
{
  return [a1 increment];
}

id objc_msgSend_infoDictionary(void *a1, const char *a2, ...)
{
  return [a1 infoDictionary];
}

id objc_msgSend_infoPlistContent(void *a1, const char *a2, ...)
{
  return [a1 infoPlistContent];
}

id objc_msgSend_infoPlistIconContentPromise(void *a1, const char *a2, ...)
{
  return [a1 infoPlistIconContentPromise];
}

id objc_msgSend_infoPlistIconContentPromiseUUID(void *a1, const char *a2, ...)
{
  return [a1 infoPlistIconContentPromiseUUID];
}

id objc_msgSend_infoPlistLoctable(void *a1, const char *a2, ...)
{
  return [a1 infoPlistLoctable];
}

id objc_msgSend_infoPlistLoctablePromiseUUID(void *a1, const char *a2, ...)
{
  return [a1 infoPlistLoctablePromiseUUID];
}

id objc_msgSend_init(void *a1, const char *a2, ...)
{
  return [a1 init];
}

id objc_msgSend_initialODRAssetPromiseUUIDs(void *a1, const char *a2, ...)
{
  return [a1 initialODRAssetPromiseUUIDs];
}

id objc_msgSend_initialODRAssetPromises(void *a1, const char *a2, ...)
{
  return [a1 initialODRAssetPromises];
}

id objc_msgSend_installOptionsPromise(void *a1, const char *a2, ...)
{
  return [a1 installOptionsPromise];
}

id objc_msgSend_installOptionsPromiseUUID(void *a1, const char *a2, ...)
{
  return [a1 installOptionsPromiseUUID];
}

id objc_msgSend_installSessionIdentifier(void *a1, const char *a2, ...)
{
  return [a1 installSessionIdentifier];
}

id objc_msgSend_installType(void *a1, const char *a2, ...)
{
  return [a1 installType];
}

id objc_msgSend_installationDomain(void *a1, const char *a2, ...)
{
  return [a1 installationDomain];
}

id objc_msgSend_installationRequestorAuditToken(void *a1, const char *a2, ...)
{
  return [a1 installationRequestorAuditToken];
}

id objc_msgSend_installedFontCount(void *a1, const char *a2, ...)
{
  return [a1 installedFontCount];
}

id objc_msgSend_installingPhaseProportion(void *a1, const char *a2, ...)
{
  return [a1 installingPhaseProportion];
}

id objc_msgSend_intValue(void *a1, const char *a2, ...)
{
  return [a1 intValue];
}

id objc_msgSend_integerValue(void *a1, const char *a2, ...)
{
  return [a1 integerValue];
}

id objc_msgSend_intent(void *a1, const char *a2, ...)
{
  return [a1 intent];
}

id objc_msgSend_interestedCoordinatorUUIDs(void *a1, const char *a2, ...)
{
  return [a1 interestedCoordinatorUUIDs];
}

id objc_msgSend_interestedPromiseUUIDs(void *a1, const char *a2, ...)
{
  return [a1 interestedPromiseUUIDs];
}

id objc_msgSend_interface(void *a1, const char *a2, ...)
{
  return [a1 interface];
}

id objc_msgSend_interfaceProtocol(void *a1, const char *a2, ...)
{
  return [a1 interfaceProtocol];
}

id objc_msgSend_internalQueue(void *a1, const char *a2, ...)
{
  return [a1 internalQueue];
}

id objc_msgSend_invalidate(void *a1, const char *a2, ...)
{
  return [a1 invalidate];
}

id objc_msgSend_invalidated(void *a1, const char *a2, ...)
{
  return [a1 invalidated];
}

id objc_msgSend_isAppExtension(void *a1, const char *a2, ...)
{
  return [a1 isAppExtension];
}

id objc_msgSend_isAppStoreVendable(void *a1, const char *a2, ...)
{
  return [a1 isAppStoreVendable];
}

id objc_msgSend_isCloudPhotoLibraryEnabled(void *a1, const char *a2, ...)
{
  return [a1 isCloudPhotoLibraryEnabled];
}

id objc_msgSend_isComplete(void *a1, const char *a2, ...)
{
  return [a1 isComplete];
}

id objc_msgSend_isDeletable(void *a1, const char *a2, ...)
{
  return [a1 isDeletable];
}

id objc_msgSend_isDeletableSystemApplication(void *a1, const char *a2, ...)
{
  return [a1 isDeletableSystemApplication];
}

id objc_msgSend_isDeveloperInstall(void *a1, const char *a2, ...)
{
  return [a1 isDeveloperInstall];
}

id objc_msgSend_isDeviceBasedVPP(void *a1, const char *a2, ...)
{
  return [a1 isDeviceBasedVPP];
}

id objc_msgSend_isEmpty(void *a1, const char *a2, ...)
{
  return [a1 isEmpty];
}

id objc_msgSend_isEnabled(void *a1, const char *a2, ...)
{
  return [a1 isEnabled];
}

id objc_msgSend_isHealthDataAvailable(void *a1, const char *a2, ...)
{
  return [a1 isHealthDataAvailable];
}

id objc_msgSend_isLocked(void *a1, const char *a2, ...)
{
  return [a1 isLocked];
}

id objc_msgSend_isManagedAppDistributor(void *a1, const char *a2, ...)
{
  return [a1 isManagedAppDistributor];
}

id objc_msgSend_isPaused(void *a1, const char *a2, ...)
{
  return [a1 isPaused];
}

id objc_msgSend_isPersonalPersonaPlaceholder(void *a1, const char *a2, ...)
{
  return [a1 isPersonalPersonaPlaceholder];
}

id objc_msgSend_isPlaceholder(void *a1, const char *a2, ...)
{
  return [a1 isPlaceholder];
}

id objc_msgSend_isPreferredButton(void *a1, const char *a2, ...)
{
  return [a1 isPreferredButton];
}

id objc_msgSend_isResolved(void *a1, const char *a2, ...)
{
  return [a1 isResolved];
}

id objc_msgSend_isRestrictionsPasscodeSet(void *a1, const char *a2, ...)
{
  return [a1 isRestrictionsPasscodeSet];
}

id objc_msgSend_isSharedIPad(void *a1, const char *a2, ...)
{
  return [a1 isSharedIPad];
}

id objc_msgSend_isTracked(void *a1, const char *a2, ...)
{
  return [a1 isTracked];
}

id objc_msgSend_isWebFilterEnabled(void *a1, const char *a2, ...)
{
  return [a1 isWebFilterEnabled];
}

id objc_msgSend_isiPad(void *a1, const char *a2, ...)
{
  return [a1 isiPad];
}

id objc_msgSend_lastDismissWasSwipeDown(void *a1, const char *a2, ...)
{
  return [a1 lastDismissWasSwipeDown];
}

id objc_msgSend_lastObject(void *a1, const char *a2, ...)
{
  return [a1 lastObject];
}

id objc_msgSend_lastPathComponent(void *a1, const char *a2, ...)
{
  return [a1 lastPathComponent];
}

id objc_msgSend_lastSavedPercentComplete(void *a1, const char *a2, ...)
{
  return [a1 lastSavedPercentComplete];
}

id objc_msgSend_launchProhibited(void *a1, const char *a2, ...)
{
  return [a1 launchProhibited];
}

id objc_msgSend_launchServicesQueue(void *a1, const char *a2, ...)
{
  return [a1 launchServicesQueue];
}

id objc_msgSend_length(void *a1, const char *a2, ...)
{
  return [a1 length];
}

id objc_msgSend_librarySpecificFetchOptions(void *a1, const char *a2, ...)
{
  return [a1 librarySpecificFetchOptions];
}

id objc_msgSend_linkedParentBundleID(void *a1, const char *a2, ...)
{
  return [a1 linkedParentBundleID];
}

id objc_msgSend_listenerRespondsToMap(void *a1, const char *a2, ...)
{
  return [a1 listenerRespondsToMap];
}

id objc_msgSend_loadingPhaseProportion(void *a1, const char *a2, ...)
{
  return [a1 loadingPhaseProportion];
}

id objc_msgSend_localizationDictionary(void *a1, const char *a2, ...)
{
  return [a1 localizationDictionary];
}

id objc_msgSend_localizationDictionaryPromise(void *a1, const char *a2, ...)
{
  return [a1 localizationDictionaryPromise];
}

id objc_msgSend_localizationDictionaryPromiseUUID(void *a1, const char *a2, ...)
{
  return [a1 localizationDictionaryPromiseUUID];
}

id objc_msgSend_localizedName(void *a1, const char *a2, ...)
{
  return [a1 localizedName];
}

id objc_msgSend_longLongValue(void *a1, const char *a2, ...)
{
  return [a1 longLongValue];
}

id objc_msgSend_lsCounterpartIdentifiers(void *a1, const char *a2, ...)
{
  return [a1 lsCounterpartIdentifiers];
}

id objc_msgSend_lsRequiresPostProcessing(void *a1, const char *a2, ...)
{
  return [a1 lsRequiresPostProcessing];
}

id objc_msgSend_mainQueue(void *a1, const char *a2, ...)
{
  return [a1 mainQueue];
}

id objc_msgSend_mainRunLoop(void *a1, const char *a2, ...)
{
  return [a1 mainRunLoop];
}

id objc_msgSend_managedAppBundleIDs(void *a1, const char *a2, ...)
{
  return [a1 managedAppBundleIDs];
}

id objc_msgSend_managedPersonas(void *a1, const char *a2, ...)
{
  return [a1 managedPersonas];
}

id objc_msgSend_managementDeclarationIdentifier(void *a1, const char *a2, ...)
{
  return [a1 managementDeclarationIdentifier];
}

id objc_msgSend_managingOrganizationInformation(void *a1, const char *a2, ...)
{
  return [a1 managingOrganizationInformation];
}

id objc_msgSend_mapQueue(void *a1, const char *a2, ...)
{
  return [a1 mapQueue];
}

id objc_msgSend_message(void *a1, const char *a2, ...)
{
  return [a1 message];
}

id objc_msgSend_metadata(void *a1, const char *a2, ...)
{
  return [a1 metadata];
}

id objc_msgSend_metadataPromise(void *a1, const char *a2, ...)
{
  return [a1 metadataPromise];
}

id objc_msgSend_metadataPromiseUUID(void *a1, const char *a2, ...)
{
  return [a1 metadataPromiseUUID];
}

id objc_msgSend_miAppIdentity(void *a1, const char *a2, ...)
{
  return [a1 miAppIdentity];
}

id objc_msgSend_minimumOSVersion(void *a1, const char *a2, ...)
{
  return [a1 minimumOSVersion];
}

id objc_msgSend_mode(void *a1, const char *a2, ...)
{
  return [a1 mode];
}

id objc_msgSend_mostRestrictiveRemovabilityMetadata(void *a1, const char *a2, ...)
{
  return [a1 mostRestrictiveRemovabilityMetadata];
}

id objc_msgSend_mutableCopy(void *a1, const char *a2, ...)
{
  return [a1 mutableCopy];
}

id objc_msgSend_name(void *a1, const char *a2, ...)
{
  return [a1 name];
}

id objc_msgSend_needsArchiveOptionButton(void *a1, const char *a2, ...)
{
  return [a1 needsArchiveOptionButton];
}

id objc_msgSend_needsDemoteOptionButton(void *a1, const char *a2, ...)
{
  return [a1 needsDemoteOptionButton];
}

id objc_msgSend_needsPostProcessing(void *a1, const char *a2, ...)
{
  return [a1 needsPostProcessing];
}

id objc_msgSend_needsShowFontsButton(void *a1, const char *a2, ...)
{
  return [a1 needsShowFontsButton];
}

id objc_msgSend_newClock(void *a1, const char *a2, ...)
{
  return [a1 newClock];
}

id objc_msgSend_newRemovability(void *a1, const char *a2, ...)
{
  return [a1 newRemovability];
}

id objc_msgSend_newRemovabilityClient(void *a1, const char *a2, ...)
{
  return [a1 newRemovabilityClient];
}

id objc_msgSend_notificationDictionary(void *a1, const char *a2, ...)
{
  return [a1 notificationDictionary];
}

id objc_msgSend_notificationFlags(void *a1, const char *a2, ...)
{
  return [a1 notificationFlags];
}

id objc_msgSend_numButtons(void *a1, const char *a2, ...)
{
  return [a1 numButtons];
}

id objc_msgSend_openHealthKitClasses(void *a1, const char *a2, ...)
{
  return [a1 openHealthKitClasses];
}

id objc_msgSend_optionalButtonForNotRemovableAppActionURL(void *a1, const char *a2, ...)
{
  return [a1 optionalButtonForNotRemovableAppActionURL];
}

id objc_msgSend_optionalButtonForNotRemovableAppLabel(void *a1, const char *a2, ...)
{
  return [a1 optionalButtonForNotRemovableAppLabel];
}

id objc_msgSend_originalInstallType(void *a1, const char *a2, ...)
{
  return [a1 originalInstallType];
}

id objc_msgSend_originalIntent(void *a1, const char *a2, ...)
{
  return [a1 originalIntent];
}

id objc_msgSend_otherButtonLabel(void *a1, const char *a2, ...)
{
  return [a1 otherButtonLabel];
}

id objc_msgSend_outstandingInstallOperationsGroup(void *a1, const char *a2, ...)
{
  return [a1 outstandingInstallOperationsGroup];
}

id objc_msgSend_path(void *a1, const char *a2, ...)
{
  return [a1 path];
}

id objc_msgSend_pathComponents(void *a1, const char *a2, ...)
{
  return [a1 pathComponents];
}

id objc_msgSend_pathExtension(void *a1, const char *a2, ...)
{
  return [a1 pathExtension];
}

id objc_msgSend_pause(void *a1, const char *a2, ...)
{
  return [a1 pause];
}

id objc_msgSend_pendingOperationIdentities(void *a1, const char *a2, ...)
{
  return [a1 pendingOperationIdentities];
}

id objc_msgSend_pendingProgressRequests(void *a1, const char *a2, ...)
{
  return [a1 pendingProgressRequests];
}

id objc_msgSend_percentComplete(void *a1, const char *a2, ...)
{
  return [a1 percentComplete];
}

id objc_msgSend_personaType(void *a1, const char *a2, ...)
{
  return [a1 personaType];
}

id objc_msgSend_personaUniqueString(void *a1, const char *a2, ...)
{
  return [a1 personaUniqueString];
}

id objc_msgSend_placeholderDisposition(void *a1, const char *a2, ...)
{
  return [a1 placeholderDisposition];
}

id objc_msgSend_placeholderFailureInfo(void *a1, const char *a2, ...)
{
  return [a1 placeholderFailureInfo];
}

id objc_msgSend_placeholderFailureReason(void *a1, const char *a2, ...)
{
  return [a1 placeholderFailureReason];
}

id objc_msgSend_placeholderFailureUnderlyingError(void *a1, const char *a2, ...)
{
  return [a1 placeholderFailureUnderlyingError];
}

id objc_msgSend_placeholderFailureUnderlyingErrorSource(void *a1, const char *a2, ...)
{
  return [a1 placeholderFailureUnderlyingErrorSource];
}

id objc_msgSend_placeholderInstallState(void *a1, const char *a2, ...)
{
  return [a1 placeholderInstallState];
}

id objc_msgSend_placeholderIsInstalled(void *a1, const char *a2, ...)
{
  return [a1 placeholderIsInstalled];
}

id objc_msgSend_placeholderPromise(void *a1, const char *a2, ...)
{
  return [a1 placeholderPromise];
}

id objc_msgSend_placeholderPromiseUUID(void *a1, const char *a2, ...)
{
  return [a1 placeholderPromiseUUID];
}

id objc_msgSend_placeholderType(void *a1, const char *a2, ...)
{
  return [a1 placeholderType];
}

id objc_msgSend_possibleSerializationsForPlistKey(void *a1, const char *a2, ...)
{
  return [a1 possibleSerializationsForPlistKey];
}

id objc_msgSend_postProcessingAssertionState(void *a1, const char *a2, ...)
{
  return [a1 postProcessingAssertionState];
}

id objc_msgSend_postProcessingPhaseProportion(void *a1, const char *a2, ...)
{
  return [a1 postProcessingPhaseProportion];
}

id objc_msgSend_preparationPromise(void *a1, const char *a2, ...)
{
  return [a1 preparationPromise];
}

id objc_msgSend_preparationPromiseUUID(void *a1, const char *a2, ...)
{
  return [a1 preparationPromiseUUID];
}

id objc_msgSend_presentationStyle(void *a1, const char *a2, ...)
{
  return [a1 presentationStyle];
}

id objc_msgSend_primaryPersonaUniqueString(void *a1, const char *a2, ...)
{
  return [a1 primaryPersonaUniqueString];
}

id objc_msgSend_priorityBoostCompletion(void *a1, const char *a2, ...)
{
  return [a1 priorityBoostCompletion];
}

id objc_msgSend_priorityBoostSourceInfo(void *a1, const char *a2, ...)
{
  return [a1 priorityBoostSourceInfo];
}

id objc_msgSend_prioritySaveURL(void *a1, const char *a2, ...)
{
  return [a1 prioritySaveURL];
}

id objc_msgSend_processIdentifier(void *a1, const char *a2, ...)
{
  return [a1 processIdentifier];
}

id objc_msgSend_progressCompleted(void *a1, const char *a2, ...)
{
  return [a1 progressCompleted];
}

id objc_msgSend_progressHint(void *a1, const char *a2, ...)
{
  return [a1 progressHint];
}

id objc_msgSend_progressHintWithDefault(void *a1, const char *a2, ...)
{
  return [a1 progressHintWithDefault];
}

id objc_msgSend_progressPhase(void *a1, const char *a2, ...)
{
  return [a1 progressPhase];
}

id objc_msgSend_progressProportionsDictionaryForLaunchServices(void *a1, const char *a2, ...)
{
  return [a1 progressProportionsDictionaryForLaunchServices];
}

id objc_msgSend_promiseStagingRootDirectoryAbortingOnError(void *a1, const char *a2, ...)
{
  return [a1 promiseStagingRootDirectoryAbortingOnError];
}

id objc_msgSend_promiseStateDescription(void *a1, const char *a2, ...)
{
  return [a1 promiseStateDescription];
}

id objc_msgSend_promiseUUIDs(void *a1, const char *a2, ...)
{
  return [a1 promiseUUIDs];
}

id objc_msgSend_propertyListRepresentation(void *a1, const char *a2, ...)
{
  return [a1 propertyListRepresentation];
}

id objc_msgSend_publishedInstallProgress(void *a1, const char *a2, ...)
{
  return [a1 publishedInstallProgress];
}

id objc_msgSend_queue(void *a1, const char *a2, ...)
{
  return [a1 queue];
}

id objc_msgSend_queuedInstalls(void *a1, const char *a2, ...)
{
  return [a1 queuedInstalls];
}

id objc_msgSend_reason(void *a1, const char *a2, ...)
{
  return [a1 reason];
}

id objc_msgSend_reconcileAppRemovabilityForSystemAppPlaceholders(void *a1, const char *a2, ...)
{
  return [a1 reconcileAppRemovabilityForSystemAppPlaceholders];
}

id objc_msgSend_relativeStagedPath(void *a1, const char *a2, ...)
{
  return [a1 relativeStagedPath];
}

id objc_msgSend_removability(void *a1, const char *a2, ...)
{
  return [a1 removability];
}

id objc_msgSend_removabilityChangeClock(void *a1, const char *a2, ...)
{
  return [a1 removabilityChangeClock];
}

id objc_msgSend_removabilityInfoForAllIdentities(void *a1, const char *a2, ...)
{
  return [a1 removabilityInfoForAllIdentities];
}

id objc_msgSend_removabilityURL(void *a1, const char *a2, ...)
{
  return [a1 removabilityURL];
}

id objc_msgSend_removeAllObjects(void *a1, const char *a2, ...)
{
  return [a1 removeAllObjects];
}

id objc_msgSend_removeLastObject(void *a1, const char *a2, ...)
{
  return [a1 removeLastObject];
}

id objc_msgSend_requestUserConfirmation(void *a1, const char *a2, ...)
{
  return [a1 requestUserConfirmation];
}

id objc_msgSend_requiredDeviceCapabilities(void *a1, const char *a2, ...)
{
  return [a1 requiredDeviceCapabilities];
}

id objc_msgSend_resume(void *a1, const char *a2, ...)
{
  return [a1 resume];
}

id objc_msgSend_rootPath(void *a1, const char *a2, ...)
{
  return [a1 rootPath];
}

id objc_msgSend_run(void *a1, const char *a2, ...)
{
  return [a1 run];
}

id objc_msgSend_runsIndependentlyOfCompanionApp(void *a1, const char *a2, ...)
{
  return [a1 runsIndependentlyOfCompanionApp];
}

id objc_msgSend_sandboxExtensionToken(void *a1, const char *a2, ...)
{
  return [a1 sandboxExtensionToken];
}

id objc_msgSend_saveDir(void *a1, const char *a2, ...)
{
  return [a1 saveDir];
}

id objc_msgSend_saveState(void *a1, const char *a2, ...)
{
  return [a1 saveState];
}

id objc_msgSend_saveURL(void *a1, const char *a2, ...)
{
  return [a1 saveURL];
}

id objc_msgSend_savedRemovability(void *a1, const char *a2, ...)
{
  return [a1 savedRemovability];
}

id objc_msgSend_savedRemovabilityClient(void *a1, const char *a2, ...)
{
  return [a1 savedRemovabilityClient];
}

id objc_msgSend_sbAppTags(void *a1, const char *a2, ...)
{
  return [a1 sbAppTags];
}

id objc_msgSend_sbIconMasqueradeIdentifier(void *a1, const char *a2, ...)
{
  return [a1 sbIconMasqueradeIdentifier];
}

id objc_msgSend_scheduleQueue(void *a1, const char *a2, ...)
{
  return [a1 scheduleQueue];
}

id objc_msgSend_scheduledInstallCount(void *a1, const char *a2, ...)
{
  return [a1 scheduledInstallCount];
}

id objc_msgSend_scheduledInstallIsRunning(void *a1, const char *a2, ...)
{
  return [a1 scheduledInstallIsRunning];
}

id objc_msgSend_scheduledUpdatesEnabled(void *a1, const char *a2, ...)
{
  return [a1 scheduledUpdatesEnabled];
}

id objc_msgSend_schedulerCallback(void *a1, const char *a2, ...)
{
  return [a1 schedulerCallback];
}

id objc_msgSend_scopedToConnection(void *a1, const char *a2, ...)
{
  return [a1 scopedToConnection];
}

id objc_msgSend_seed(void *a1, const char *a2, ...)
{
  return [a1 seed];
}

id objc_msgSend_sentBeginPostProcessing(void *a1, const char *a2, ...)
{
  return [a1 sentBeginPostProcessing];
}

id objc_msgSend_sentBeginRestoringUserData(void *a1, const char *a2, ...)
{
  return [a1 sentBeginRestoringUserData];
}

id objc_msgSend_sentDidBegin(void *a1, const char *a2, ...)
{
  return [a1 sentDidBegin];
}

id objc_msgSend_sentinelPath(void *a1, const char *a2, ...)
{
  return [a1 sentinelPath];
}

id objc_msgSend_sequenceNumber(void *a1, const char *a2, ...)
{
  return [a1 sequenceNumber];
}

id objc_msgSend_serviceConnection(void *a1, const char *a2, ...)
{
  return [a1 serviceConnection];
}

id objc_msgSend_serviceRespondsToMap(void *a1, const char *a2, ...)
{
  return [a1 serviceRespondsToMap];
}

id objc_msgSend_serviceToConnectionMap(void *a1, const char *a2, ...)
{
  return [a1 serviceToConnectionMap];
}

id objc_msgSend_set(void *a1, const char *a2, ...)
{
  return [a1 set];
}

id objc_msgSend_setTaskCompleted(void *a1, const char *a2, ...)
{
  return [a1 setTaskCompleted];
}

id objc_msgSend_sharedBehavior(void *a1, const char *a2, ...)
{
  return [a1 sharedBehavior];
}

id objc_msgSend_sharedConnection(void *a1, const char *a2, ...)
{
  return [a1 sharedConnection];
}

id objc_msgSend_sharedDatabaseContext(void *a1, const char *a2, ...)
{
  return [a1 sharedDatabaseContext];
}

id objc_msgSend_sharedDeviceConnection(void *a1, const char *a2, ...)
{
  return [a1 sharedDeviceConnection];
}

id objc_msgSend_sharedGuard(void *a1, const char *a2, ...)
{
  return [a1 sharedGuard];
}

id objc_msgSend_sharedInstance(void *a1, const char *a2, ...)
{
  return [a1 sharedInstance];
}

id objc_msgSend_sharedManager(void *a1, const char *a2, ...)
{
  return [a1 sharedManager];
}

id objc_msgSend_sharedMediaInMessagesCount(void *a1, const char *a2, ...)
{
  return [a1 sharedMediaInMessagesCount];
}

id objc_msgSend_sharedPhotoLibrary(void *a1, const char *a2, ...)
{
  return [a1 sharedPhotoLibrary];
}

id objc_msgSend_sharedPresenter(void *a1, const char *a2, ...)
{
  return [a1 sharedPresenter];
}

id objc_msgSend_sharedScheduler(void *a1, const char *a2, ...)
{
  return [a1 sharedScheduler];
}

id objc_msgSend_sharedUninstaller(void *a1, const char *a2, ...)
{
  return [a1 sharedUninstaller];
}

id objc_msgSend_sharedWebFilterSettings(void *a1, const char *a2, ...)
{
  return [a1 sharedWebFilterSettings];
}

id objc_msgSend_shouldBeginPostProcessing(void *a1, const char *a2, ...)
{
  return [a1 shouldBeginPostProcessing];
}

id objc_msgSend_shouldBeginRestoringUserData(void *a1, const char *a2, ...)
{
  return [a1 shouldBeginRestoringUserData];
}

id objc_msgSend_shouldCopy(void *a1, const char *a2, ...)
{
  return [a1 shouldCopy];
}

id objc_msgSend_shouldRequestMoreTime(void *a1, const char *a2, ...)
{
  return [a1 shouldRequestMoreTime];
}

id objc_msgSend_showArchiveOption(void *a1, const char *a2, ...)
{
  return [a1 showArchiveOption];
}

id objc_msgSend_showDemotionOption(void *a1, const char *a2, ...)
{
  return [a1 showDemotionOption];
}

id objc_msgSend_sinfData(void *a1, const char *a2, ...)
{
  return [a1 sinfData];
}

id objc_msgSend_sinfPromise(void *a1, const char *a2, ...)
{
  return [a1 sinfPromise];
}

id objc_msgSend_sinfPromiseUUID(void *a1, const char *a2, ...)
{
  return [a1 sinfPromiseUUID];
}

id objc_msgSend_stagedPath(void *a1, const char *a2, ...)
{
  return [a1 stagedPath];
}

id objc_msgSend_stagedPathMayNotExistWhenAwakening(void *a1, const char *a2, ...)
{
  return [a1 stagedPathMayNotExistWhenAwakening];
}

id objc_msgSend_stagingBaseDir(void *a1, const char *a2, ...)
{
  return [a1 stagingBaseDir];
}

id objc_msgSend_state(void *a1, const char *a2, ...)
{
  return [a1 state];
}

id objc_msgSend_storeItemIdentifier(void *a1, const char *a2, ...)
{
  return [a1 storeItemIdentifier];
}

id objc_msgSend_stringByDeletingLastPathComponent(void *a1, const char *a2, ...)
{
  return [a1 stringByDeletingLastPathComponent];
}

id objc_msgSend_stringByDeletingPathExtension(void *a1, const char *a2, ...)
{
  return [a1 stringByDeletingPathExtension];
}

id objc_msgSend_subPromiseUUIDs(void *a1, const char *a2, ...)
{
  return [a1 subPromiseUUIDs];
}

id objc_msgSend_systemAppNotAllowed(void *a1, const char *a2, ...)
{
  return [a1 systemAppNotAllowed];
}

id objc_msgSend_systemPersonaUniqueString(void *a1, const char *a2, ...)
{
  return [a1 systemPersonaUniqueString];
}

id objc_msgSend_szOptions(void *a1, const char *a2, ...)
{
  return [a1 szOptions];
}

id objc_msgSend_targetGizmoPairingID(void *a1, const char *a2, ...)
{
  return [a1 targetGizmoPairingID];
}

id objc_msgSend_targetLastPathComponent(void *a1, const char *a2, ...)
{
  return [a1 targetLastPathComponent];
}

id objc_msgSend_teamIdentifier(void *a1, const char *a2, ...)
{
  return [a1 teamIdentifier];
}

id objc_msgSend_termAssertion(void *a1, const char *a2, ...)
{
  return [a1 termAssertion];
}

id objc_msgSend_testSpecificValidationData(void *a1, const char *a2, ...)
{
  return [a1 testSpecificValidationData];
}

id objc_msgSend_timeIntervalSinceNow(void *a1, const char *a2, ...)
{
  return [a1 timeIntervalSinceNow];
}

id objc_msgSend_title(void *a1, const char *a2, ...)
{
  return [a1 title];
}

id objc_msgSend_totalBytesForProgress(void *a1, const char *a2, ...)
{
  return [a1 totalBytesForProgress];
}

id objc_msgSend_totalBytesNeededOnDisk(void *a1, const char *a2, ...)
{
  return [a1 totalBytesNeededOnDisk];
}

id objc_msgSend_totalExpectedEssentialAssetSizeInBytes(void *a1, const char *a2, ...)
{
  return [a1 totalExpectedEssentialAssetSizeInBytes];
}

id objc_msgSend_totalODRAssetSizeInBytes(void *a1, const char *a2, ...)
{
  return [a1 totalODRAssetSizeInBytes];
}

id objc_msgSend_totalUnitCount(void *a1, const char *a2, ...)
{
  return [a1 totalUnitCount];
}

id objc_msgSend_totalUnits(void *a1, const char *a2, ...)
{
  return [a1 totalUnits];
}

id objc_msgSend_totalUnitsCompleted(void *a1, const char *a2, ...)
{
  return [a1 totalUnitsCompleted];
}

id objc_msgSend_transferPath(void *a1, const char *a2, ...)
{
  return [a1 transferPath];
}

id objc_msgSend_tryDeltaCopy(void *a1, const char *a2, ...)
{
  return [a1 tryDeltaCopy];
}

id objc_msgSend_typeDescription(void *a1, const char *a2, ...)
{
  return [a1 typeDescription];
}

id objc_msgSend_uiDeviceFamily(void *a1, const char *a2, ...)
{
  return [a1 uiDeviceFamily];
}

id objc_msgSend_uncompressedAppAssetSizeInBytes(void *a1, const char *a2, ...)
{
  return [a1 uncompressedAppAssetSizeInBytes];
}

id objc_msgSend_underlyingError(void *a1, const char *a2, ...)
{
  return [a1 underlyingError];
}

id objc_msgSend_uninstallConcurrencyQueue(void *a1, const char *a2, ...)
{
  return [a1 uninstallConcurrencyQueue];
}

id objc_msgSend_uniqueIdentifier(void *a1, const char *a2, ...)
{
  return [a1 uniqueIdentifier];
}

id objc_msgSend_unsignedCharValue(void *a1, const char *a2, ...)
{
  return [a1 unsignedCharValue];
}

id objc_msgSend_unsignedIntegerValue(void *a1, const char *a2, ...)
{
  return [a1 unsignedIntegerValue];
}

id objc_msgSend_unsignedLongLongValue(void *a1, const char *a2, ...)
{
  return [a1 unsignedLongLongValue];
}

id objc_msgSend_unsignedLongValue(void *a1, const char *a2, ...)
{
  return [a1 unsignedLongValue];
}

id objc_msgSend_updateScheduleState(void *a1, const char *a2, ...)
{
  return [a1 updateScheduleState];
}

id objc_msgSend_userDataPromise(void *a1, const char *a2, ...)
{
  return [a1 userDataPromise];
}

id objc_msgSend_userDataPromiseUUID(void *a1, const char *a2, ...)
{
  return [a1 userDataPromiseUUID];
}

id objc_msgSend_userInfo(void *a1, const char *a2, ...)
{
  return [a1 userInfo];
}

id objc_msgSend_userPersonaUniqueString(void *a1, const char *a2, ...)
{
  return [a1 userPersonaUniqueString];
}

id objc_msgSend_userVolumeURL(void *a1, const char *a2, ...)
{
  return [a1 userVolumeURL];
}

id objc_msgSend_uuidToCoordinatorMap(void *a1, const char *a2, ...)
{
  return [a1 uuidToCoordinatorMap];
}

id objc_msgSend_uuidToPromiseMap(void *a1, const char *a2, ...)
{
  return [a1 uuidToPromiseMap];
}

id objc_msgSend_waitForAssertionSemaphore(void *a1, const char *a2, ...)
{
  return [a1 waitForAssertionSemaphore];
}

id objc_msgSend_waitForDeletion(void *a1, const char *a2, ...)
{
  return [a1 waitForDeletion];
}

id objc_msgSend_waitingOperations(void *a1, const char *a2, ...)
{
  return [a1 waitingOperations];
}

id objc_msgSend_watchOnlyApp(void *a1, const char *a2, ...)
{
  return [a1 watchOnlyApp];
}

id objc_msgSend_weakObjectsHashTable(void *a1, const char *a2, ...)
{
  return [a1 weakObjectsHashTable];
}

id objc_msgSend_webKitPushBundleMetadata(void *a1, const char *a2, ...)
{
  return [a1 webKitPushBundleMetadata];
}

id objc_msgSend_whitespaceAndNewlineCharacterSet(void *a1, const char *a2, ...)
{
  return [a1 whitespaceAndNewlineCharacterSet];
}

id objc_msgSend_width(void *a1, const char *a2, ...)
{
  return [a1 width];
}

id objc_msgSend_xpcConnection(void *a1, const char *a2, ...)
{
  return [a1 xpcConnection];
}