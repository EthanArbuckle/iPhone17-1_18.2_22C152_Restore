@interface DDRTaskResetSystemConfiguration
- (double)estimatedTimeOfCompletion;
- (id)identifier;
- (void)run;
@end

@implementation DDRTaskResetSystemConfiguration

- (void)run
{
  SCPreferencesRef v2 = SCPreferencesCreateWithAuthorization(0, @"com.apple.devicedatareset.reset", 0, 0);
  if (!v2)
  {
    v6 = DDRLogForCategory(0);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      sub_100008910(v6);
    }
    goto LABEL_90;
  }
  v3 = v2;
  v4 = +[MCProfileConnection sharedConnection];
  v5 = [v4 managedSystemConfigurationServiceIDs];

  v6 = v5;
  if (!SCPreferencesLock(v3, 1u))
  {
    SCPreferencesSynchronize(v3);
    if (!SCPreferencesLock(v3, 1u))
    {
      v11 = DDRLogForCategory(0);
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
        sub_100008954();
      }
      goto LABEL_89;
    }
  }
  ServiceID = SCNetworkSetCopyCurrent(v3);
  v8 = ServiceID;
  if (!ServiceID)
  {
    v9 = 0;
    goto LABEL_10;
  }
  ServiceID = (const __SCNetworkService *)SCNetworkSetCopySelectedVPNService();
  v9 = ServiceID;
  if (!ServiceID)
  {
LABEL_10:
    char v10 = 1;
    goto LABEL_11;
  }
  ServiceID = (const __SCNetworkService *)SCNetworkServiceGetServiceID(ServiceID);
  char v10 = 0;
LABEL_11:
  v11 = ServiceID;
  v12 = &AKUnregisterAllAppleIDs_ptr;
  if (![v6 count])
  {
    id v40 = 0;
    if (v8) {
      goto LABEL_69;
    }
    goto LABEL_70;
  }
  char v64 = v10;
  v65 = v9;
  v66 = v11;
  v67 = v6;
  v68 = v8;
  +[NSSet setWithArray:v6];
  prefs = v3;
  id cf2 = (id)objc_claimAutoreleasedReturnValue();
  CFArrayRef v13 = SCNetworkSetCopyAll(v3);
  int v14 = [(__CFArray *)v13 count];
  if (v14 >= 1)
  {
    uint64_t v15 = 0;
    uint64_t v16 = v14;
    do
    {
      v17 = (const __SCNetworkSet *)[(__CFArray *)v13 objectAtIndex:v15];
      id v18 = cf2;
      CFArrayRef v19 = SCNetworkSetCopyServices(v17);
      int v20 = [(__CFArray *)v19 count];
      if (v20 >= 1)
      {
        uint64_t v21 = 0;
        uint64_t v22 = v20;
        do
        {
          v23 = (const __SCNetworkService *)[(__CFArray *)v19 objectAtIndex:v21];
          SCNetworkServiceGetServiceID(v23);
          v24 = (char *)objc_claimAutoreleasedReturnValue();
          if (([v18 containsObject:v24] & 1) == 0
            && !SCNetworkSetRemoveService(v17, v23))
          {
            v25 = DDRLogForCategory(0);
            if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
            {
              int v26 = SCError();
              v27 = SCErrorString(v26);
              *(_DWORD *)buf = 138543618;
              v82 = v24;
              __int16 v83 = 2082;
              *(void *)v84 = v27;
              _os_log_error_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_ERROR, "Failed to remove service %{public}@: %{public}s", buf, 0x16u);
            }
          }
          ++v21;
        }
        while (v22 != v21);
      }

      ++v15;
    }
    while (v15 != v16);
  }

  id v28 = cf2;
  CFArrayRef v29 = SCNetworkServiceCopyAll(prefs);
  int v30 = [(__CFArray *)v29 count];
  int v31 = v30 - 1;
  if (v30 >= 1)
  {
    unint64_t v32 = v30 + 1;
    do
    {
      v33 = (const __SCNetworkService *)[(__CFArray *)v29 objectAtIndex:(v32 - 2)];
      SCNetworkServiceGetServiceID(v33);
      v34 = (char *)objc_claimAutoreleasedReturnValue();
      if (([v28 containsObject:v34] & 1) == 0)
      {
        int v35 = SCNetworkServiceRemove(v33);
        v36 = DDRLogForCategory(0);
        v37 = v36;
        if (v35)
        {
          if (os_log_type_enabled(v36, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 136315650;
            v82 = "removeServicesGlobally";
            __int16 v83 = 1024;
            *(_DWORD *)v84 = v31;
            *(_WORD *)&v84[4] = 2112;
            *(void *)&v84[6] = v34;
            _os_log_impl((void *)&_mh_execute_header, v37, OS_LOG_TYPE_INFO, "%s removed %d %@", buf, 0x1Cu);
          }
        }
        else if (os_log_type_enabled(v36, OS_LOG_TYPE_ERROR))
        {
          int v38 = SCError();
          v39 = SCErrorString(v38);
          *(_DWORD *)buf = 138543618;
          v82 = v34;
          __int16 v83 = 2082;
          *(void *)v84 = v39;
          _os_log_error_impl((void *)&_mh_execute_header, v37, OS_LOG_TYPE_ERROR, "Failed to remove service %{public}@: %{public}s", buf, 0x16u);
        }
      }
      --v32;
      --v31;
    }
    while (v32 > 1);
  }

  v3 = prefs;
  SCPreferencesPathGetValue(prefs, @"/");
  v69 = v12 = &AKUnregisterAllAppleIDs_ptr;
  id v40 = [objc_alloc((Class)NSMutableDictionary) initWithDictionary:v69];
  v41 = [v40 allKeys];
  long long v76 = 0u;
  long long v77 = 0u;
  long long v78 = 0u;
  long long v79 = 0u;
  id v42 = [v41 countByEnumeratingWithState:&v76 objects:buf count:16];
  if (v42)
  {
    id v43 = v42;
    uint64_t v44 = *(void *)v77;
    do
    {
      for (i = 0; i != v43; i = (char *)i + 1)
      {
        if (*(void *)v77 != v44) {
          objc_enumerationMutation(v41);
        }
        v46 = *(void **)(*((void *)&v76 + 1) + 8 * i);
        if (([v46 isEqualToString:kSCPrefNetworkServices] & 1) == 0) {
          [v40 removeObjectForKey:v46];
        }
      }
      id v43 = [v41 countByEnumeratingWithState:&v76 objects:buf count:16];
    }
    while (v43);
  }
  v11 = v66;
  v8 = v68;
  if (!v68 || ([v28 containsObject:v66] & 1) != 0) {
    goto LABEL_68;
  }
  long long v74 = 0u;
  long long v75 = 0u;
  long long v72 = 0u;
  long long v73 = 0u;
  v47 = v67;
  id v48 = [v47 countByEnumeratingWithState:&v72 objects:v80 count:16];
  if (!v48) {
    goto LABEL_67;
  }
  id v49 = v48;
  uint64_t v50 = *(void *)v73;
  CFTypeRef v63 = (CFTypeRef)kSCNetworkInterfaceTypeVPN;
  while (2)
  {
    for (j = 0; j != v49; j = (char *)j + 1)
    {
      if (*(void *)v73 != v50) {
        objc_enumerationMutation(v47);
      }
      v52 = SCNetworkServiceCopy(v3, *(CFStringRef *)(*((void *)&v72 + 1) + 8 * (void)j));
      if (v52)
      {
        v53 = v52;
        Interface = SCNetworkServiceGetInterface(v52);
        if (Interface)
        {
          v55 = Interface;
          CFStringRef InterfaceType = SCNetworkInterfaceGetInterfaceType(Interface);
          if (!CFEqual(InterfaceType, kSCNetworkInterfaceTypePPP))
          {
            if (CFEqual(InterfaceType, v63)) {
              goto LABEL_66;
            }
            CFStringRef v59 = InterfaceType;
            CFStringRef v60 = kSCNetworkInterfaceTypeIPSec;
            goto LABEL_57;
          }
          v57 = SCNetworkInterfaceGetInterface(v55);
          if (v57)
          {
            CFStringRef v58 = SCNetworkInterfaceGetInterfaceType(v57);
            if (CFEqual(v58, kSCNetworkInterfaceTypeL2TP)) {
              goto LABEL_66;
            }
            CFStringRef v59 = v58;
            CFStringRef v60 = kSCNetworkInterfaceTypePPTP;
LABEL_57:
            if (CFEqual(v59, v60))
            {
LABEL_66:
              v8 = v68;
              SCNetworkSetSetSelectedVPNService();
              CFRelease(v53);
              v3 = prefs;
              goto LABEL_67;
            }
          }
        }
        CFRelease(v53);
        v3 = prefs;
        continue;
      }
    }
    id v49 = [v47 countByEnumeratingWithState:&v72 objects:v80 count:16];
    v8 = v68;
    if (v49) {
      continue;
    }
    break;
  }
LABEL_67:

  v11 = v66;
  v12 = &AKUnregisterAllAppleIDs_ptr;
LABEL_68:

  v6 = v67;
  v9 = v65;
  char v10 = v64;
  if (v8) {
LABEL_69:
  }
    CFRelease(v8);
LABEL_70:
  if ((v10 & 1) == 0) {
    CFRelease(v9);
  }
  if (!v40) {
    id v40 = objc_alloc_init((Class)v12[144]);
  }
  if (SCPreferencesPathSetValue(v3, @"/", (CFDictionaryRef)v40))
  {
    if (SCPreferencesCommitChanges(v3))
    {
      if (SCPreferencesApplyChanges(v3))
      {
        if (!SCPreferencesUnlock(v3))
        {
          v61 = DDRLogForCategory(0);
          if (os_log_type_enabled(v61, OS_LOG_TYPE_ERROR)) {
            sub_100008B44();
          }
          goto LABEL_82;
        }
        goto LABEL_88;
      }
      v62 = DDRLogForCategory(0);
      if (os_log_type_enabled(v62, OS_LOG_TYPE_ERROR)) {
        sub_100008AC8();
      }
    }
    else
    {
      v62 = DDRLogForCategory(0);
      if (os_log_type_enabled(v62, OS_LOG_TYPE_ERROR)) {
        sub_100008A4C();
      }
    }

    SCPreferencesUnlock(v3);
    goto LABEL_88;
  }
  v61 = DDRLogForCategory(0);
  if (os_log_type_enabled(v61, OS_LOG_TYPE_ERROR)) {
    sub_1000089D0();
  }
LABEL_82:

LABEL_88:
LABEL_89:

  CFRelease(v3);
LABEL_90:
}

- (id)identifier
{
  return @"com.apple.devicedatareset.resetSystemconfiguration";
}

- (double)estimatedTimeOfCompletion
{
  return 0.2;
}

@end