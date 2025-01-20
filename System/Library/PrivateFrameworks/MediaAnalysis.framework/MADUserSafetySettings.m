@interface MADUserSafetySettings
+ (BOOL)isEnabledForTask:(__SecTask *)a3;
+ (BOOL)isTaskEntitled:(__SecTask *)a3;
+ (id)_bundleIDForTask:(__SecTask *)a3;
+ (id)_servicesForTask:(__SecTask *)a3;
+ (id)_valuesForEntitlement:(__CFString *)a3 expectedElementClass:(Class)a4 task:(__SecTask *)a5;
+ (id)sharedSettings;
+ (unint64_t)policyForTask:(__SecTask *)a3;
- (MADUserSafetySettings)init;
- (MOUserSafetyScanningPolicy)scanningPolicy;
- (void)setScanningPolicy:(id)a3;
@end

@implementation MADUserSafetySettings

- (MADUserSafetySettings)init
{
  v21.receiver = self;
  v21.super_class = (Class)MADUserSafetySettings;
  v2 = [(MADUserSafetySettings *)&v21 init];
  if (v2)
  {
    objc_initWeak(&location, v2);
    v3 = +[NSSet setWithObject:MOSettingsGroupNameUserSafety];
    v4 = +[MOEffectiveSettingsStore publisherForGroups:v3];
    v15 = _NSConcreteStackBlock;
    uint64_t v16 = 3221225472;
    v17 = sub_1000E67A4;
    v18 = &unk_10021DBB0;
    objc_copyWeak(&v19, &location);
    uint64_t v5 = [v4 sinkWithRecieveInput:&v15];
    subscription = v2->_subscription;
    v2->_subscription = (MOCancellable *)v5;

    id v7 = objc_alloc_init((Class)MOEffectiveSettingsStore);
    v8 = objc_msgSend(v7, "userSafety", v15, v16, v17, v18);
    uint64_t v9 = [v8 scanningPolicy];
    scanningPolicy = v2->_scanningPolicy;
    v2->_scanningPolicy = (MOUserSafetyScanningPolicy *)v9;

    if ((int)MediaAnalysisLogLevel() >= 5)
    {
      v11 = VCPLogInstance();
      os_log_type_t v12 = VCPLogToOSLogType[5];
      if (os_log_type_enabled(v11, v12))
      {
        v13 = v2->_scanningPolicy;
        *(_DWORD *)buf = 138412290;
        v23 = v13;
        _os_log_impl((void *)&_mh_execute_header, v11, v12, "[UserSafety] Initialized scanning policy (%@)", buf, 0xCu);
      }
    }
    objc_destroyWeak(&v19);

    objc_destroyWeak(&location);
  }
  return v2;
}

+ (id)sharedSettings
{
  v2 = +[VCPSharedInstanceManager sharedManager];
  v3 = (objc_class *)objc_opt_class();
  v4 = NSStringFromClass(v3);
  uint64_t v5 = [v2 sharedInstanceWithIdentifier:v4 andCreationBlock:&stru_10021DBF0];

  return v5;
}

+ (id)_valuesForEntitlement:(__CFString *)a3 expectedElementClass:(Class)a4 task:(__SecTask *)a5
{
  CFErrorRef error = 0;
  objc_super v21 = (void *)SecTaskCopyValueForEntitlement(a5, a3, &error);
  if (error)
  {
    if ((int)MediaAnalysisLogLevel() >= 4)
    {
      v6 = VCPLogInstance();
      os_log_type_t v7 = VCPLogToOSLogType[4];
      if (os_log_type_enabled(v6, v7))
      {
        *(_DWORD *)buf = 138412546;
        v29 = a3;
        __int16 v30 = 2112;
        CFErrorRef v31 = error;
        _os_log_impl((void *)&_mh_execute_header, v6, v7, "[UserSafety] Failed to query %@ entitlement (%@)", buf, 0x16u);
      }
LABEL_5:
      v8 = 0;
LABEL_6:

      goto LABEL_29;
    }
  }
  else if (v21)
  {
    if (objc_opt_isKindOfClass())
    {
      v8 = +[NSSet setWithObject:v21];
      goto LABEL_29;
    }
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v8 = +[NSMutableSet set];
      long long v24 = 0u;
      long long v25 = 0u;
      long long v22 = 0u;
      long long v23 = 0u;
      v6 = v21;
      id v9 = [v6 countByEnumeratingWithState:&v22 objects:v27 count:16];
      if (v9)
      {
        uint64_t v10 = *(void *)v23;
        os_log_type_t v11 = VCPLogToOSLogType[4];
        do
        {
          for (i = 0; i != v9; i = (char *)i + 1)
          {
            if (*(void *)v23 != v10) {
              objc_enumerationMutation(v6);
            }
            uint64_t v13 = *(void *)(*((void *)&v22 + 1) + 8 * i);
            if (objc_opt_isKindOfClass())
            {
              [v8 addObject:v13];
            }
            else if ((int)MediaAnalysisLogLevel() >= 4)
            {
              v14 = VCPLogInstance();
              if (os_log_type_enabled(v14, v11))
              {
                v15 = (objc_class *)objc_opt_class();
                NSStringFromClass(v15);
                uint64_t v16 = (__CFError *)objc_claimAutoreleasedReturnValue();
                *(_DWORD *)buf = 138412546;
                v29 = a3;
                __int16 v30 = 2112;
                CFErrorRef v31 = v16;
                _os_log_impl((void *)&_mh_execute_header, v14, v11, "[UserSafety] Entitlement %@ has unexpected element type %@", buf, 0x16u);
              }
            }
          }
          id v9 = [v6 countByEnumeratingWithState:&v22 objects:v27 count:16];
        }
        while (v9);
      }
      goto LABEL_6;
    }
    if ((int)MediaAnalysisLogLevel() >= 4)
    {
      v6 = VCPLogInstance();
      os_log_type_t v17 = VCPLogToOSLogType[4];
      if (os_log_type_enabled(v6, v17))
      {
        v18 = (objc_class *)objc_opt_class();
        NSStringFromClass(v18);
        id v19 = (__CFError *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412546;
        v29 = a3;
        __int16 v30 = 2112;
        CFErrorRef v31 = v19;
        _os_log_impl((void *)&_mh_execute_header, v6, v17, "[UserSafety] Entitlement %@ has unexpected type %@", buf, 0x16u);
      }
      goto LABEL_5;
    }
  }
  v8 = 0;
LABEL_29:

  sub_100004484((const void **)&error);
  return v8;
}

+ (id)_servicesForTask:(__SecTask *)a3
{
  v4 = objc_opt_class();
  uint64_t v5 = [v4 _valuesForEntitlement:@"com.apple.sensitivecontentanalysis.service" expectedElementClass:objc_opt_class() task:a3];
  if (!v5)
  {
    os_log_type_t v7 = objc_opt_class();
    uint64_t v5 = [v7 _valuesForEntitlement:@"com.apple.usersafety.service" expectedElementClass:objc_opt_class() task:a3];
    if (v5)
    {
      if ((int)MediaAnalysisLogLevel() >= 4)
      {
        v8 = VCPLogInstance();
        os_log_type_t v9 = VCPLogToOSLogType[4];
        if (os_log_type_enabled(v8, v9))
        {
          *(_WORD *)uint64_t v10 = 0;
          _os_log_impl((void *)&_mh_execute_header, v8, v9, "[UserSafety] Client using deprecated \"com.apple.usersafety.service\" entitlement", v10, 2u);
        }
      }
    }
  }
  return v5;
}

+ (id)_bundleIDForTask:(__SecTask *)a3
{
  CFErrorRef error = 0;
  v3 = (__CFString *)SecTaskCopySigningIdentifier(a3, &error);
  v4 = v3;
  if (error)
  {
    if ((int)MediaAnalysisLogLevel() >= 3)
    {
      uint64_t v5 = VCPLogInstance();
      os_log_type_t v6 = VCPLogToOSLogType[3];
      if (os_log_type_enabled(v5, v6))
      {
        *(_DWORD *)buf = 138412290;
        CFErrorRef v11 = error;
        _os_log_impl((void *)&_mh_execute_header, v5, v6, "[UserSafety] Failed to query client bundleID (%@)", buf, 0xCu);
      }
    }
    os_log_type_t v7 = 0;
  }
  else
  {
    os_log_type_t v7 = v3;
  }

  sub_100004484((const void **)&error);
  return v7;
}

+ (BOOL)isTaskEntitled:(__SecTask *)a3
{
  v4 = objc_opt_class();
  uint64_t v5 = [v4 _valuesForEntitlement:@"com.apple.developer.sensitivecontentanalysis.client" expectedElementClass:objc_opt_class() task:a3];
  if (!v5)
  {
    os_log_type_t v6 = objc_opt_class();
    uint64_t v7 = [v6 _valuesForEntitlement:@"com.apple.developer.usersafety.client" expectedElementClass:objc_opt_class() task:a3];
    if (v7)
    {
      if ((int)MediaAnalysisLogLevel() >= 4)
      {
        v8 = VCPLogInstance();
        os_log_type_t v9 = VCPLogToOSLogType[4];
        if (os_log_type_enabled(v8, v9))
        {
          *(_WORD *)long long v24 = 0;
          _os_log_impl((void *)&_mh_execute_header, v8, v9, "[UserSafety] Client using deprecated \"com.apple.developer.usersafety.client\" entitlement", v24, 2u);
        }
      }
      uint64_t v5 = (void *)v7;
    }
    else
    {
      uint64_t v5 = 0;
    }
  }
  unsigned int v10 = [v5 containsObject:@"analysis"];
  if (v10)
  {
    CFErrorRef v11 = [(id)objc_opt_class() _servicesForTask:a3];
    if (!v11)
    {
      os_log_type_t v12 = [(id)objc_opt_class() _bundleIDForTask:a3];
      id v13 = [objc_alloc((Class)MOApplication) initWithBundleIdentifier:v12];
      id v14 = [objc_alloc((Class)MOLocalSettingsStore) initWithName:@"UserSafety" sharedContainer:@"com.apple.UserSafety"];
      v15 = [v14 userSafety];
      uint64_t v16 = [v15 allowedClients];
      unsigned __int8 v17 = [v16 containsObject:v13];

      if ((v17 & 1) == 0)
      {
        v18 = [v14 userSafety];
        id v19 = [v18 allowedClients];
        v20 = +[NSMutableSet setWithSet:v19];

        [v20 addObject:v13];
        id v21 = [v20 copy];
        long long v22 = [v14 userSafety];
        [v22 setAllowedClients:v21];
      }
    }
  }
  return v10;
}

+ (unint64_t)policyForTask:(__SecTask *)a3
{
  v4 = [(id)objc_opt_class() sharedSettings];
  uint64_t v5 = [v4 scanningPolicy];

  if ([v5 policy] == (id)1)
  {
    os_log_type_t v6 = [(id)objc_opt_class() _servicesForTask:a3];
    uint64_t v7 = v6;
    if (v6)
    {
      long long v23 = 0u;
      long long v24 = 0u;
      long long v21 = 0u;
      long long v22 = 0u;
      id v8 = v6;
      id v9 = [v8 countByEnumeratingWithState:&v21 objects:v25 count:16];
      if (v9)
      {
        uint64_t v10 = *(void *)v22;
        while (2)
        {
          CFErrorRef v11 = 0;
          do
          {
            if (*(void *)v22 != v10) {
              objc_enumerationMutation(v8);
            }
            uint64_t v12 = *(void *)(*((void *)&v21 + 1) + 8 * (void)v11);
            id v13 = objc_msgSend(v5, "services", (void)v21);
            LOBYTE(v12) = [v13 containsObject:v12];

            if (v12)
            {

              goto LABEL_20;
            }
            CFErrorRef v11 = (char *)v11 + 1;
          }
          while (v9 != v11);
          id v9 = [v8 countByEnumeratingWithState:&v21 objects:v25 count:16];
          if (v9) {
            continue;
          }
          break;
        }
      }
    }
    id v14 = [(id)objc_opt_class() _bundleIDForTask:a3];
    id v15 = [objc_alloc((Class)MOApplication) initWithBundleIdentifier:v14];
    uint64_t v16 = [v5 allApplications];
    unsigned __int8 v17 = [v16 objectForKeyedSubscript:v15];

    if (!v17)
    {

LABEL_20:
      unint64_t v19 = 1;
      goto LABEL_21;
    }
    unsigned __int8 v18 = [v17 BOOLValue];

    if (v18) {
      goto LABEL_20;
    }
    goto LABEL_17;
  }
  if ([v5 policy] != (id)2)
  {
LABEL_17:
    unint64_t v19 = 0;
    goto LABEL_21;
  }
  unint64_t v19 = 2;
LABEL_21:

  return v19;
}

+ (BOOL)isEnabledForTask:(__SecTask *)a3
{
  return [(id)objc_opt_class() policyForTask:a3] != 0;
}

- (MOUserSafetyScanningPolicy)scanningPolicy
{
  return self->_scanningPolicy;
}

- (void)setScanningPolicy:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_scanningPolicy, 0);
  objc_storeStrong((id *)&self->_subscription, 0);
}

@end