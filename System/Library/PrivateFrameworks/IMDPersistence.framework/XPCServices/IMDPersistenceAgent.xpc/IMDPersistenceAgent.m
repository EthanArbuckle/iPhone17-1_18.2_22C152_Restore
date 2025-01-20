void sub_100002E6C(uint64_t a1, void *a2)
{
  id v2;
  uint64_t vars8;

  v2 = a2;
  if (MKBDeviceUnlockedSinceBoot() == 1 && qword_100008048 != -1) {
    dispatch_once(&qword_100008048, &stru_100004250);
  }
  __IMDPersistenceIPCServer_peer_event_handler();
}

uint64_t start()
{
  xpc_track_activity();
  IMDSetIsRunningInDatabaseServerProcess();
  int v1 = MKBDeviceUnlockedSinceBoot();
  if (v1 == 1)
  {
    if (IMOSLoggingEnabled())
    {
      v4 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
      {
        LOWORD(v15[0]) = 0;
        _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "ProtectionMerge: Device has been unlocked, loading real database", (uint8_t *)v15, 2u);
      }
    }
    if (IMOSLoggingEnabled())
    {
      v5 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
      {
        LOWORD(v15[0]) = 0;
        _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "ProtectionDelete: Checking to see if we need to delete the temp db", (uint8_t *)v15, 2u);
      }
    }
    if (IMDPersistenceProtectionMerge_UnprotectedDatabaseExists())
    {
      if (IMOSLoggingEnabled())
      {
        v6 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
        {
          LOWORD(v15[0]) = 0;
          _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "ProtectionDelete: device unlocked after boot and need to delete temp db", (uint8_t *)v15, 2u);
        }
      }
      IMDPersistenceProtectionMerge_DeleteUnprotectedDatabase();
      notify_post("com.apple.imdpersistenceagent.notification.switchcompleted");
    }
  }
  else
  {
    int v2 = v1;
    if (v1)
    {
      if (IMOSLoggingEnabled())
      {
        v7 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
        {
          v15[0] = 67109120;
          v15[1] = v2;
          _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "ProtectionMerge: unable to get device unlock state from MobileKeyBag: %d\n", (uint8_t *)v15, 8u);
        }
      }
    }
    else
    {
      if (IMOSLoggingEnabled())
      {
        v3 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
        {
          LOWORD(v15[0]) = 0;
          _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "ProtectionMerge: Device has not been unlocked since boot, registering for lock state notifications", (uint8_t *)v15, 2u);
        }
      }
      dispatch_assert_queue_V2((dispatch_queue_t)&_dispatch_main_q);
      notify_register_dispatch(kMobileKeyBagLockStatusNotifyToken, &dword_100008030, (dispatch_queue_t)&_dispatch_main_q, &stru_1000041D0);
    }
  }
  dispatch_assert_queue_V2((dispatch_queue_t)&_dispatch_main_q);
  notify_register_dispatch("AppleLanguagePreferencesChangedNotification", &dword_100008034, (dispatch_queue_t)&_dispatch_main_q, &stru_1000041F0);

  IMSetAppBoolForKey();
  IMSyncronizeAppPreferences();
  IMSetEmbeddedTempDirectory();
  v8 = +[IMImagePreviewGenerator UTITypes];
  id v9 = [v8 mutableCopy];

  v10 = +[IMAnimatedImagePreviewGenerator UTITypes];
  [v9 addObjectsFromArray:v10];

  CGImageSourceSetAllowableTypes();
  v12 = +[IMFeatureFlags sharedFeatureFlags];
  LODWORD(v10) = [v12 isModernPersistenceXPCEnabled];

  if (!v10) {
    xpc_main((xpc_connection_handler_t)sub_1000032FC);
  }
  id v13 = objc_alloc_init((Class)IMDPersistenceServiceListener);
  [v13 resume];

  return 0;
}

void sub_1000032FC(void *a1)
{
  int v1 = a1;
  if (qword_100008040 != -1) {
    dispatch_once(&qword_100008040, &stru_100004230);
  }
  xpc_connection_set_target_queue(v1, (dispatch_queue_t)qword_100008038);
  handler[0] = _NSConcreteStackBlock;
  handler[1] = 3221225472;
  handler[2] = sub_100002E6C;
  handler[3] = &unk_100004278;
  v4 = v1;
  int v2 = v1;
  xpc_connection_set_event_handler(v2, handler);
  xpc_connection_resume(v2);
}

void sub_1000033CC(id a1, int a2)
{
  if (IMOSLoggingEnabled())
  {
    int v2 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
    {
      int v4 = 136315138;
      uint64_t v5 = kMobileKeyBagLockStatusNotifyToken;
      _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_INFO, "ProtectionMerge: %s notification\n", (uint8_t *)&v4, 0xCu);
    }
  }
  if (MKBDeviceUnlockedSinceBoot() == 1)
  {
    if (IMOSLoggingEnabled())
    {
      v3 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
      {
        LOWORD(v4) = 0;
        _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "ProtectionMerge: device unlocked after boot, IMDPersistenceAgent dying\n", (uint8_t *)&v4, 2u);
      }
    }
    sub_100003524();
    exit(0);
  }
}

uint64_t sub_100003524()
{
  dispatch_assert_queue_V2((dispatch_queue_t)&_dispatch_main_q);
  uint64_t result = dword_100008030;
  if (dword_100008030 != -1)
  {
    uint64_t result = notify_cancel(dword_100008030);
    dword_100008030 = -1;
  }
  return result;
}

void sub_100003568(id a1, int a2)
{
  if (IMOSLoggingEnabled())
  {
    int v2 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v3 = 0;
      _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_INFO, "AppleLanguagePreferencesChangedNotification", v3, 2u);
    }
  }
  exit(0);
}

void sub_1000035F0(id a1)
{
  qword_100008038 = (uint64_t)dispatch_queue_create("IMDPersistenceAgentConnectionQueue", 0);
  _objc_release_x1();
}

void sub_100003630(id a1)
{
  if (IMDPersistenceProtectionMerge_CurrentlyUsingUnprotectedDatabase())
  {
    if (IMOSLoggingEnabled())
    {
      int v1 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v1, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)int v2 = 0;
        _os_log_impl((void *)&_mh_execute_header, v1, OS_LOG_TYPE_INFO, "We are past first unlock but still using the unprotected database. Restarting", v2, 2u);
      }
    }
    exit(0);
  }
}

uint64_t CGImageSourceSetAllowableTypes()
{
  return _CGImageSourceSetAllowableTypes();
}

uint64_t IMDPersistenceProtectionMerge_CurrentlyUsingUnprotectedDatabase()
{
  return _IMDPersistenceProtectionMerge_CurrentlyUsingUnprotectedDatabase();
}

uint64_t IMDPersistenceProtectionMerge_DeleteUnprotectedDatabase()
{
  return _IMDPersistenceProtectionMerge_DeleteUnprotectedDatabase();
}

uint64_t IMDPersistenceProtectionMerge_UnprotectedDatabaseExists()
{
  return _IMDPersistenceProtectionMerge_UnprotectedDatabaseExists();
}

uint64_t IMDSetIsRunningInDatabaseServerProcess()
{
  return _IMDSetIsRunningInDatabaseServerProcess();
}

uint64_t IMOSLoggingEnabled()
{
  return _IMOSLoggingEnabled();
}

uint64_t IMSetAppBoolForKey()
{
  return _IMSetAppBoolForKey();
}

uint64_t IMSetEmbeddedTempDirectory()
{
  return _IMSetEmbeddedTempDirectory();
}

uint64_t IMSyncronizeAppPreferences()
{
  return _IMSyncronizeAppPreferences();
}

uint64_t MKBDeviceUnlockedSinceBoot()
{
  return _MKBDeviceUnlockedSinceBoot();
}

uint64_t OSLogHandleForIMFoundationCategory()
{
  return _OSLogHandleForIMFoundationCategory();
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
}

uint64_t __IMDPersistenceIPCServer_peer_event_handler()
{
  return ___IMDPersistenceIPCServer_peer_event_handler();
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void dispatch_assert_queue_V2(dispatch_queue_t queue)
{
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
}

dispatch_queue_t dispatch_queue_create(const char *label, dispatch_queue_attr_t attr)
{
  return _dispatch_queue_create(label, attr);
}

void exit(int a1)
{
}

uint32_t notify_cancel(int token)
{
  return _notify_cancel(token);
}

uint32_t notify_post(const char *name)
{
  return _notify_post(name);
}

uint32_t notify_register_dispatch(const char *name, int *out_token, dispatch_queue_t queue, notify_handler_t handler)
{
  return _notify_register_dispatch(name, out_token, queue, handler);
}

uint64_t objc_alloc_init()
{
  return _objc_alloc_init();
}

{
}

{
}

id objc_begin_catch(void *exc_buf)
{
  return _objc_begin_catch(exc_buf);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return _objc_claimAutoreleasedReturnValue();
}

void objc_end_catch(void)
{
}

void objc_release(id a1)
{
}

id objc_retain(id a1)
{
  return _objc_retain(a1);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return _os_log_type_enabled(oslog, type);
}

void xpc_connection_resume(xpc_connection_t connection)
{
}

void xpc_connection_set_event_handler(xpc_connection_t connection, xpc_handler_t handler)
{
}

void xpc_connection_set_target_queue(xpc_connection_t connection, dispatch_queue_t targetq)
{
}

void xpc_main(xpc_connection_handler_t handler)
{
}

uint64_t xpc_track_activity()
{
  return _xpc_track_activity();
}

id objc_msgSend_UTITypes(void *a1, const char *a2, ...)
{
  return [a1 UTITypes];
}

id objc_msgSend_isModernPersistenceXPCEnabled(void *a1, const char *a2, ...)
{
  return [a1 isModernPersistenceXPCEnabled];
}

id objc_msgSend_mutableCopy(void *a1, const char *a2, ...)
{
  return [a1 mutableCopy];
}

id objc_msgSend_resume(void *a1, const char *a2, ...)
{
  return [a1 resume];
}

id objc_msgSend_sharedFeatureFlags(void *a1, const char *a2, ...)
{
  return [a1 sharedFeatureFlags];
}