@interface CRLAppRemovalService
- (BOOL)p_removeAllUserDefaultsWithError:(id *)a3;
- (void)removeAppWithReply:(id)a3;
@end

@implementation CRLAppRemovalService

- (void)removeAppWithReply:(id)a3
{
  v4 = (void (**)(id, id))a3;
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_INFO, "About to remove all user defaults.", buf, 2u);
  }
  id v10 = 0;
  unsigned __int8 v5 = [(CRLAppRemovalService *)self p_removeAllUserDefaultsWithError:&v10];
  id v6 = v10;
  v7 = v6;
  id v8 = 0;
  if ((v5 & 1) == 0) {
    id v8 = v6;
  }
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v9 = 0;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_INFO, "Finished removing all user defaults.", v9, 2u);
  }
  v4[2](v4, v8);
}

- (BOOL)p_removeAllUserDefaultsWithError:(id *)a3
{
  id v4 = objc_alloc((Class)NSUserDefaults);
  unsigned __int8 v5 = CRLAppBundleIdentifier();
  id v6 = [v4 initWithSuiteName:v5];

  if (!v6)
  {
    id v9 = +[NSError errorWithDomain:@"com.apple.freeform.appremoval.errorDomain" code:1 userInfo:0];
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_FAULT))
    {
      -[CRLAppRemovalService p_removeAllUserDefaultsWithError:](v9);
      if (a3) {
        goto LABEL_16;
      }
    }
    else if (a3)
    {
LABEL_16:
      id v9 = v9;
      unsigned __int8 v14 = 0;
      *a3 = v9;
      goto LABEL_19;
    }
    unsigned __int8 v14 = 0;
    goto LABEL_19;
  }
  v7 = [v6 dictionaryRepresentation];
  id v8 = [v7 allKeys];

  long long v19 = 0u;
  long long v20 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v9 = v8;
  id v10 = [v9 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v10)
  {
    id v11 = v10;
    uint64_t v12 = *(void *)v18;
    do
    {
      for (i = 0; i != v11; i = (char *)i + 1)
      {
        if (*(void *)v18 != v12) {
          objc_enumerationMutation(v9);
        }
        objc_msgSend(v6, "removeObjectForKey:", *(void *)(*((void *)&v17 + 1) + 8 * i), (void)v17);
      }
      id v11 = [v9 countByEnumeratingWithState:&v17 objects:v21 count:16];
    }
    while (v11);
  }

  unsigned __int8 v14 = [v6 synchronize];
  if ((v14 & 1) == 0)
  {
    v15 = +[NSError errorWithDomain:@"com.apple.freeform.appremoval.errorDomain" code:2 userInfo:0];
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_FAULT))
    {
      -[CRLAppRemovalService p_removeAllUserDefaultsWithError:](v15);
      if (!a3) {
        goto LABEL_13;
      }
    }
    else if (!a3)
    {
LABEL_13:

      goto LABEL_19;
    }
    *a3 = v15;
    goto LABEL_13;
  }
LABEL_19:

  return v14;
}

- (void)p_removeAllUserDefaultsWithError:(void *)a1 .cold.1(void *a1)
{
  v2 = (objc_class *)objc_opt_class();
  v3 = NSStringFromClass(v2);
  id v4 = [a1 domain];
  [a1 code];
  OUTLINED_FUNCTION_0();
  _os_log_fault_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_FAULT, "Error getting user defaults to remove: errorClass=%{public}@, domain=%{public}@, code=%zd (%@) ", v5, 0x2Au);
}

- (void)p_removeAllUserDefaultsWithError:(void *)a1 .cold.2(void *a1)
{
  v2 = (objc_class *)objc_opt_class();
  v3 = NSStringFromClass(v2);
  id v4 = [a1 domain];
  [a1 code];
  OUTLINED_FUNCTION_0();
  _os_log_fault_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_FAULT, "Error synchronizing removed user defaults: errorClass=%{public}@, domain=%{public}@, code=%zd (%@) ", v5, 0x2Au);
}

@end