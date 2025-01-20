void sub_3338(id a1)
{
  id v1;
  uint64_t vars8;

  v1 = +[MBPrebuddyManager sharedManager];
  [v1 updateFollowUp];
}

uint64_t MBGetDefaultLog()
{
  return _MBGetDefaultLog();
}

uint64_t _MBLog()
{
  return __MBLog();
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
}

dispatch_queue_global_t dispatch_get_global_queue(intptr_t identifier, uintptr_t flags)
{
  return _dispatch_get_global_queue(identifier, flags);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return _objc_claimAutoreleasedReturnValue();
}

void objc_enumerationMutation(id obj)
{
}

void objc_release(id a1)
{
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return _os_log_type_enabled(oslog, type);
}

id objc_msgSend__updateFollowUp(void *a1, const char *a2, ...)
{
  return [a1 _updateFollowUp];
}

id objc_msgSend_cancelPrebuddyOnAccountSignOut(void *a1, const char *a2, ...)
{
  return [a1 cancelPrebuddyOnAccountSignOut];
}

id objc_msgSend_sharedManager(void *a1, const char *a2, ...)
{
  return [a1 sharedManager];
}

id objc_msgSend_updateFollowUp(void *a1, const char *a2, ...)
{
  return [a1 updateFollowUp];
}
os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    if (v8) {
      v10 = &__kCFBooleanTrue;
    }
    else {
      v10 = &__kCFBooleanFalse;
    }
    *(_DWORD *)buf = 138412802;
    v12 = v6;
    v13 = 2112;
    v14 = v10;
    v15 = 2112;
    v16 = v7;
    _os_log_impl(&dword_0, v9, OS_LOG_TYPE_DEFAULT, "MBPrebuddyAccountNotificationPlugin: didPerformActionsForDataclasses: %@\nisPrimary: %@\n%@", buf, 0x20u);
    _MBLog();
  }

  if (v8
    && [(MBPrebuddyAccountNotificationPlugin *)self _shouldUpdateFollowUpForDataclasses:v7])
  {
    [(MBPrebuddyAccountNotificationPlugin *)self _updateFollowUp];
  }
}

- (BOOL)_shouldUpdateFollowUpForDataclasses:(id)a3
{
  id v3 = a3;
  v23[0] = ACAccountDataclassBookmarks;
  v23[1] = ACAccountDataclassNews;
  v23[2] = ACAccountDataclassStocks;
  v23[3] = ACAccountDataclassHome;
  v23[4] = ACAccountDataclassHealth;
  v23[5] = ACAccountDataclassSiri;
  v23[6] = ACAccountDataclassShoebox;
  v23[7] = ACAccountDataclassKeychainSync;
  v23[8] = ACAccountDataclassMoments;
  v4 = +[NSArray arrayWithObjects:v23 count:9];
  v5 = +[NSSet setWithArray:v4];

  long long v18 = 0u;
  long long v19 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  v6 = v3;
  id v7 = [v6 countByEnumeratingWithState:&v16 objects:v22 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v17;
    while (2)
    {
      for (i = 0; i != v8; i = (char *)i + 1)
      {
        if (*(void *)v17 != v9) {
          objc_enumerationMutation(v6);
        }
        uint64_t v11 = *(void *)(*((void *)&v16 + 1) + 8 * i);
        if ([v5 containsObject:v11])
        {
          v14 = MBGetDefaultLog();
          if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412290;
            uint64_t v21 = v11;
            _os_log_impl(&dword_0, v14, OS_LOG_TYPE_DEFAULT, "MBPrebuddyAccountNotificationPlugin: Dataclass means we should update the follow up: %@", buf, 0xCu);
            _MBLog();
          }

          BOOL v13 = 1;
          v12 = v6;
          goto LABEL_15;
        }
      }
      id v8 = [v6 countByEnumeratingWithState:&v16 objects:v22 count:16];
      if (v8) {
        continue;
      }
      break;
    }
  }

  v12 = MBGetDefaultLog();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_0, v12, OS_LOG_TYPE_DEFAULT, "MBPrebuddyAccountNotificationPlugin: No dataclasses triggering us to update the follow up", buf, 2u);
    _MBLog();
  }
  BOOL v13 = 0;
LABEL_15:

  return v13;
}

- (void)_updateFollowUp
{
  v2 = MBGetDefaultLog();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl(&dword_0, v2, OS_LOG_TYPE_DEFAULT, "MBPrebuddyAccountNotificationPlugin: Updating follow up", v4, 2u);
    _MBLog();
  }

  id v3 = dispatch_get_global_queue(21, 0);
  dispatch_async(v3, &stru_4138);
}

@end