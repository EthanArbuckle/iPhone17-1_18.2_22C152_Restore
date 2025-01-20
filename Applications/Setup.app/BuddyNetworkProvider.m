@interface BuddyNetworkProvider
- (BOOL)connectedOverCellular;
- (BOOL)connectedOverWiFi;
- (BOOL)connectedOverWiFiAndNetworkReachable;
- (BOOL)currentNetworkRequiresDataUsageWarningForRestore;
- (BOOL)currentNetworkSupportsRestore;
- (BOOL)deviceSupportsCellularRestore;
- (BOOL)forceNetworkReachabilityOverWiFi;
- (BOOL)inAppleStore;
- (BOOL)isCellularDataPossible;
- (BOOL)networkReachable;
- (BOOL)supportsWiFi;
- (BuddyNetworkProvider)init;
- (CoreTelephonyClient)telephonyClient;
- (NWPathEvaluator)pathEvaluator;
- (OS_dispatch_queue)forceNetworkReachabilityQueue;
- (OS_nw_path_monitor)pathMonitor;
- (void)assumeNetworkReachabilityOverWiFi;
- (void)setForceNetworkReachabilityOverWiFi:(BOOL)a3;
- (void)setForceNetworkReachabilityQueue:(id)a3;
- (void)setPathEvaluator:(id)a3;
- (void)setPathMonitor:(id)a3;
- (void)setTelephonyClient:(id)a3;
@end

@implementation BuddyNetworkProvider

- (BuddyNetworkProvider)init
{
  SEL v22 = a2;
  id location = 0;
  v21.receiver = self;
  v21.super_class = (Class)BuddyNetworkProvider;
  id location = [(BuddyNetworkProvider *)&v21 init];
  objc_storeStrong(&location, location);
  if (location)
  {
    id v2 = objc_alloc_init((Class)NWPathEvaluator);
    v3 = (void *)*((void *)location + 2);
    *((void *)location + 2) = v2;

    id v4 = objc_alloc((Class)CoreTelephonyClient);
    v5 = dispatch_get_global_queue(0, 0);
    id v6 = [v4 initWithQueue:v5];
    v7 = (void *)*((void *)location + 3);
    *((void *)location + 3) = v6;

    dispatch_queue_t v8 = dispatch_queue_create("Force Network Reachability Queue", 0);
    v9 = (void *)*((void *)location + 5);
    *((void *)location + 5) = v8;

    nw_path_monitor_t v10 = nw_path_monitor_create();
    v11 = (void *)*((void *)location + 4);
    *((void *)location + 4) = v10;

    nw_path_monitor_set_queue(*((nw_path_monitor_t *)location + 4), *((dispatch_queue_t *)location + 5));
    v12 = *((void *)location + 4);
    update_handler = _NSConcreteStackBlock;
    int v16 = -1073741824;
    int v17 = 0;
    v18 = sub_1000937D0;
    v19 = &unk_1002B0F48;
    id v20 = location;
    nw_path_monitor_set_update_handler(v12, &update_handler);
    nw_path_monitor_start(*((nw_path_monitor_t *)location + 4));
    objc_storeStrong(&v20, 0);
  }
  v13 = (BuddyNetworkProvider *)location;
  objc_storeStrong(&location, 0);
  return v13;
}

- (BOOL)networkReachable
{
  if (![(BuddyNetworkProvider *)self forceNetworkReachabilityOverWiFi])
  {
    id v2 = [(BuddyNetworkProvider *)self pathEvaluator];
    id v3 = [(NWPathEvaluator *)v2 path];
    id v4 = (char *)[v3 status];

    if (v4)
    {
      if (v4 == (char *)1)
      {
        char v7 = 1;
        return v7 & 1;
      }
      if ((unint64_t)(v4 - 2) >= 2) {
        return v7 & 1;
      }
    }
    char v7 = 0;
    return v7 & 1;
  }
  char v7 = 1;
  return v7 & 1;
}

- (BOOL)connectedOverWiFi
{
  if (![(BuddyNetworkProvider *)self forceNetworkReachabilityOverWiFi])
  {
    id v2 = [(BuddyNetworkProvider *)self pathEvaluator];
    id v3 = [(NWPathEvaluator *)v2 path];
    id v4 = [v3 interface];
    id v5 = [v4 type];

    if (v5)
    {
      if (v5 == (id)1) {
        goto LABEL_9;
      }
      if (v5 == (id)2) {
        goto LABEL_8;
      }
      if (v5 == (id)3)
      {
LABEL_9:
        char v8 = 1;
        return v8 & 1;
      }
      if (v5 != (id)4) {
        return v8 & 1;
      }
    }
LABEL_8:
    char v8 = 0;
    return v8 & 1;
  }
  char v8 = 1;
  return v8 & 1;
}

- (BOOL)connectedOverCellular
{
  id v2 = [(BuddyNetworkProvider *)self pathEvaluator];
  id v3 = [(NWPathEvaluator *)v2 path];
  id v4 = [v3 interface];
  id v5 = (char *)[v4 type];

  if ((unint64_t)v5 < 2) {
    goto LABEL_4;
  }
  if (v5 == (char *)2)
  {
    char v7 = 1;
    return v7 & 1;
  }
  if ((unint64_t)(v5 - 3) <= 1) {
LABEL_4:
  }
    char v7 = 0;
  return v7 & 1;
}

- (BOOL)connectedOverWiFiAndNetworkReachable
{
  unsigned __int8 v2 = [(BuddyNetworkProvider *)self networkReachable];
  unsigned __int8 v3 = 0;
  if (v2) {
    unsigned __int8 v3 = [(BuddyNetworkProvider *)self connectedOverWiFi];
  }
  return v3 & 1;
}

- (BOOL)supportsWiFi
{
  return MGGetBoolAnswer() & 1;
}

- (BOOL)currentNetworkSupportsRestore
{
  v72 = self;
  location[1] = (id)a2;
  unsigned __int8 v2 = [(BuddyNetworkProvider *)self pathEvaluator];
  id v3 = [(NWPathEvaluator *)v2 path];
  id v4 = (char *)[v3 status];

  if (!v4) {
    goto LABEL_74;
  }
  if (v4 != (char *)1)
  {
    if ((unint64_t)(v4 - 2) >= 2) {
      return v73 & 1;
    }
    goto LABEL_74;
  }
  id v5 = [(BuddyNetworkProvider *)v72 pathEvaluator];
  id v6 = [(NWPathEvaluator *)v5 path];
  id v7 = [v6 interface];
  char v8 = (char *)[v7 type];

  if ((unint64_t)v8 < 2) {
    goto LABEL_73;
  }
  if (v8 != (char *)2)
  {
    if ((unint64_t)(v8 - 3) >= 2)
    {
LABEL_74:
      char v73 = 0;
      return v73 & 1;
    }
LABEL_73:
    char v73 = 1;
    return v73 & 1;
  }
  v9 = [(BuddyNetworkProvider *)v72 pathEvaluator];
  id v10 = [(NWPathEvaluator *)v9 path];
  id v11 = [v10 interface];
  unsigned __int8 v12 = [v11 isExpensive];

  if (v12)
  {
    location[0] = (id)_BYLoggingFacility();
    os_log_type_t v70 = OS_LOG_TYPE_DEFAULT;
    if (os_log_type_enabled((os_log_t)location[0], OS_LOG_TYPE_DEFAULT))
    {
      v13 = location[0];
      os_log_type_t v14 = v70;
      sub_10004B24C(buf);
      _os_log_impl((void *)&_mh_execute_header, v13, v14, "Cellular network is expensive; does not support restore",
        buf,
        2u);
    }
    objc_storeStrong(location, 0);
    char v73 = 0;
    return v73 & 1;
  }
  if ([(BuddyNetworkProvider *)v72 deviceSupportsCellularRestore])
  {
    id v65 = 0;
    int v17 = [(BuddyNetworkProvider *)v72 telephonyClient];
    id v63 = 0;
    id v18 = [(CoreTelephonyClient *)v17 getCurrentDataSubscriptionContextSync:&v63];
    objc_storeStrong(&v65, v63);
    id v64 = v18;

    if (v65)
    {
      id v62 = (id)_BYLoggingFacility();
      os_log_type_t v61 = OS_LOG_TYPE_ERROR;
      if (os_log_type_enabled((os_log_t)v62, OS_LOG_TYPE_ERROR))
      {
        char v59 = 0;
        char v57 = 0;
        if (_BYIsInternalInstall())
        {
          v19 = (NSString *)v65;
        }
        else if (v65)
        {
          id v60 = [v65 domain];
          char v59 = 1;
          v19 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"<Error domain: %@, code %ld>", v60, [v65 code]);
          id v58 = v19;
          char v57 = 1;
        }
        else
        {
          v19 = 0;
        }
        sub_10004BB7C((uint64_t)v77, (uint64_t)v19);
        _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)v62, v61, "Failed to get data subscription context: %{public}@", v77, 0xCu);
        if (v57) {

        }
        if (v59) {
      }
        }
      objc_storeStrong(&v62, 0);
      char v73 = 0;
      int v56 = 1;
      goto LABEL_72;
    }
    id v55 = [objc_alloc((Class)CTBundle) initWithBundleType:1];
    id v20 = [(BuddyNetworkProvider *)v72 telephonyClient];
    id obj = v65;
    id v21 = [(CoreTelephonyClient *)v20 copyCarrierBundleValue:v64 key:@"EnableRestoreOnCellular" bundleType:v55 error:&obj];
    objc_storeStrong(&v65, obj);
    id v54 = v21;

    if (v54)
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        if (([v54 BOOLValue] & 1) == 0)
        {
          os_log_t oslog = (os_log_t)(id)_BYLoggingFacility();
          os_log_type_t v51 = OS_LOG_TYPE_DEFAULT;
          if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEFAULT))
          {
            SEL v22 = oslog;
            os_log_type_t v23 = v51;
            sub_10004B24C(v50);
            _os_log_impl((void *)&_mh_execute_header, v22, v23, "Cellular network is disallowed for restore", v50, 2u);
          }
          objc_storeStrong((id *)&oslog, 0);
          char v73 = 0;
          int v56 = 1;
LABEL_71:
          objc_storeStrong(&v54, 0);
          objc_storeStrong(&v55, 0);
LABEL_72:
          objc_storeStrong(&v64, 0);
          objc_storeStrong(&v65, 0);
          return v73 & 1;
        }
      }
      else
      {
        os_log_t v49 = (os_log_t)(id)_BYLoggingFacility();
        os_log_type_t v48 = OS_LOG_TYPE_ERROR;
        if (os_log_type_enabled(v49, OS_LOG_TYPE_ERROR))
        {
          sub_10004B238((uint64_t)v76, (uint64_t)v54);
          _os_log_error_impl((void *)&_mh_execute_header, v49, v48, "Unexpected value from carrier bundle for restore: %@", v76, 0xCu);
        }
        objc_storeStrong((id *)&v49, 0);
      }
    }
    else
    {
      os_log_t v47 = (os_log_t)(id)_BYLoggingFacility();
      os_log_type_t v46 = OS_LOG_TYPE_ERROR;
      if (os_log_type_enabled(v47, OS_LOG_TYPE_ERROR))
      {
        char v44 = 0;
        char v42 = 0;
        if (_BYIsInternalInstall())
        {
          v24 = (NSString *)v65;
        }
        else if (v65)
        {
          id v45 = [v65 domain];
          char v44 = 1;
          v24 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"<Error domain: %@, code %ld>", v45, [v65 code]);
          id v43 = v24;
          char v42 = 1;
        }
        else
        {
          v24 = 0;
        }
        sub_10004BB7C((uint64_t)v75, (uint64_t)v24);
        _os_log_error_impl((void *)&_mh_execute_header, v47, v46, "Failed to get carrier bundle for restore: %{public}@", v75, 0xCu);
        if (v42) {

        }
        if (v44) {
      }
        }
      objc_storeStrong((id *)&v47, 0);
    }
    v25 = [(BuddyNetworkProvider *)v72 telephonyClient];
    id v40 = v65;
    id v26 = [(CoreTelephonyClient *)v25 getDataStatus:v64 error:&v40];
    objc_storeStrong(&v65, v40);
    id v41 = v26;

    if (v65)
    {
      os_log_t v39 = (os_log_t)(id)_BYLoggingFacility();
      os_log_type_t v38 = OS_LOG_TYPE_ERROR;
      if (os_log_type_enabled(v39, OS_LOG_TYPE_ERROR))
      {
        char v36 = 0;
        char v34 = 0;
        if (_BYIsInternalInstall())
        {
          v27 = (NSString *)v65;
        }
        else if (v65)
        {
          id v37 = [v65 domain];
          char v36 = 1;
          v27 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"<Error domain: %@, code %ld>", v37, [v65 code]);
          id v35 = v27;
          char v34 = 1;
        }
        else
        {
          v27 = 0;
        }
        sub_10004BB7C((uint64_t)v74, (uint64_t)v27);
        _os_log_error_impl((void *)&_mh_execute_header, v39, v38, "Failed to get data status: %{public}@", v74, 0xCu);
        if (v34) {

        }
        if (v36) {
      }
        }
      objc_storeStrong((id *)&v39, 0);
      char v73 = 0;
      int v56 = 1;
    }
    else if ([v41 newRadioCoverage])
    {
      char v73 = 1;
      int v56 = 1;
    }
    else if ([v41 radioTechnology] == 7 {
           || [v41 radioTechnology] == 10)
    }
    {
      char v73 = 1;
      int v56 = 1;
    }
    else
    {
      os_log_t v33 = (os_log_t)(id)_BYLoggingFacility();
      os_log_type_t v32 = OS_LOG_TYPE_DEFAULT;
      if (os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT))
      {
        v28 = v33;
        os_log_type_t v29 = v32;
        sub_10004B24C(v31);
        _os_log_impl((void *)&_mh_execute_header, v28, v29, "Cellular network is not qualified for restore", v31, 2u);
      }
      objc_storeStrong((id *)&v33, 0);
      char v73 = 0;
      int v56 = 1;
    }
    objc_storeStrong(&v41, 0);
    goto LABEL_71;
  }
  id v68 = (id)_BYLoggingFacility();
  os_log_type_t v67 = OS_LOG_TYPE_DEFAULT;
  if (os_log_type_enabled((os_log_t)v68, OS_LOG_TYPE_DEFAULT))
  {
    v15 = v68;
    os_log_type_t v16 = v67;
    sub_10004B24C(v66);
    _os_log_impl((void *)&_mh_execute_header, v15, v16, "Device does not support cellular restore", v66, 2u);
  }
  objc_storeStrong(&v68, 0);
  char v73 = 0;
  return v73 & 1;
}

- (BOOL)currentNetworkRequiresDataUsageWarningForRestore
{
  unsigned __int8 v2 = [(BuddyNetworkProvider *)self pathEvaluator];
  id v3 = [(NWPathEvaluator *)v2 path];
  id v4 = [v3 interface];
  BOOL v5 = [v4 type] == (id)2;

  return v5;
}

- (BOOL)isCellularDataPossible
{
  id location[2] = self;
  location[1] = (id)a2;
  location[0] = 0;
  unsigned __int8 v2 = [(BuddyNetworkProvider *)self telephonyClient];
  id obj = 0;
  id v3 = [(CoreTelephonyClient *)v2 getInternetDataStatusBasicSync:&obj];
  objc_storeStrong(location, obj);
  id v14 = v3;

  if (location[0])
  {
    os_log_t oslog = (os_log_t)(id)_BYLoggingFacility();
    if (os_log_type_enabled(oslog, OS_LOG_TYPE_ERROR))
    {
      char v10 = 0;
      char v8 = 0;
      if (_BYIsInternalInstall())
      {
        id v4 = (NSString *)location[0];
      }
      else if (location[0])
      {
        id v11 = [location[0] domain];
        char v10 = 1;
        id v4 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"<Error domain: %@, code %ld>", v11, [location[0] code]);
        v9 = v4;
        char v8 = 1;
      }
      else
      {
        id v4 = 0;
      }
      sub_10004BB7C((uint64_t)buf, (uint64_t)v4);
      _os_log_error_impl((void *)&_mh_execute_header, oslog, OS_LOG_TYPE_ERROR, "Failed to get data subscription context: %{public}@", buf, 0xCu);
      if (v8) {

      }
      if (v10) {
    }
      }
    objc_storeStrong((id *)&oslog, 0);
    char v16 = 0;
  }
  else
  {
    unsigned __int8 v5 = [v14 roamAllowed];
    unsigned __int8 v6 = 0;
    if (v5) {
      unsigned __int8 v6 = [v14 cellularDataPossible];
    }
    char v16 = v6 & 1;
  }
  objc_storeStrong(&v14, 0);
  objc_storeStrong(location, 0);
  return v16 & 1;
}

- (BOOL)deviceSupportsCellularRestore
{
  id v26 = self;
  location[1] = (id)a2;
  location[0] = 0;
  unsigned __int8 v2 = [(BuddyNetworkProvider *)self telephonyClient];
  id obj = 0;
  id v3 = [(CoreTelephonyClient *)v2 getCurrentDataSubscriptionContextSync:&obj];
  objc_storeStrong(location, obj);
  id v24 = v3;

  if (location[0])
  {
    os_log_t oslog = (os_log_t)(id)_BYLoggingFacility();
    os_log_type_t v21 = OS_LOG_TYPE_ERROR;
    if (os_log_type_enabled(oslog, OS_LOG_TYPE_ERROR))
    {
      char v19 = 0;
      char v17 = 0;
      if (_BYIsInternalInstall())
      {
        id v4 = (NSString *)location[0];
      }
      else if (location[0])
      {
        id v20 = [location[0] domain];
        char v19 = 1;
        id v4 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"<Error domain: %@, code %ld>", v20, [location[0] code]);
        id v18 = v4;
        char v17 = 1;
      }
      else
      {
        id v4 = 0;
      }
      sub_10004BB7C((uint64_t)buf, (uint64_t)v4);
      _os_log_error_impl((void *)&_mh_execute_header, oslog, v21, "Failed to get data subscription context: %{public}@", buf, 0xCu);
      if (v17) {

      }
      if (v19) {
    }
      }
    objc_storeStrong((id *)&oslog, 0);
    char v27 = 0;
    int v16 = 1;
  }
  else
  {
    unsigned __int8 v5 = [(BuddyNetworkProvider *)v26 telephonyClient];
    id v14 = location[0];
    id v6 = [(CoreTelephonyClient *)v5 getSupports5G:v24 error:&v14];
    objc_storeStrong(location, v14);
    id v15 = v6;

    if (location[0])
    {
      os_log_t v13 = (os_log_t)(id)_BYLoggingFacility();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      {
        char v11 = 0;
        char v9 = 0;
        if (_BYIsInternalInstall())
        {
          id v7 = (NSString *)location[0];
        }
        else if (location[0])
        {
          id v12 = [location[0] domain];
          char v11 = 1;
          id v7 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"<Error domain: %@, code %ld>", v12, [location[0] code]);
          char v10 = v7;
          char v9 = 1;
        }
        else
        {
          id v7 = 0;
        }
        sub_10004BB7C((uint64_t)v28, (uint64_t)v7);
        _os_log_error_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_ERROR, "Failed to determine 5G support: %{public}@", v28, 0xCu);
        if (v9) {

        }
        if (v11) {
      }
        }
      objc_storeStrong((id *)&v13, 0);
      char v27 = 0;
      int v16 = 1;
    }
    else
    {
      char v27 = [v15 BOOLValue] & 1;
      int v16 = 1;
    }
    objc_storeStrong(&v15, 0);
  }
  objc_storeStrong(&v24, 0);
  objc_storeStrong(location, 0);
  return v27 & 1;
}

- (BOOL)inAppleStore
{
  id location[2] = self;
  location[1] = (id)a2;
  location[0] = objc_alloc_init((Class)CWFInterface);
  [location[0] activate];
  id v2 = [location[0] networkName];
  unsigned __int8 v3 = [v2 isEqualToString:@"Apple Store"];

  [location[0] invalidate];
  objc_storeStrong(location, 0);
  return v3 & 1;
}

- (void)assumeNetworkReachabilityOverWiFi
{
  char v9 = self;
  v8[1] = (id)a2;
  id v2 = [(BuddyNetworkProvider *)self forceNetworkReachabilityQueue];
  block = _NSConcreteStackBlock;
  int v4 = -1073741824;
  int v5 = 0;
  id v6 = sub_100094DEC;
  id v7 = &unk_1002B0D20;
  v8[0] = v9;
  dispatch_async((dispatch_queue_t)v2, &block);

  objc_storeStrong(v8, 0);
}

- (NWPathEvaluator)pathEvaluator
{
  return self->_pathEvaluator;
}

- (void)setPathEvaluator:(id)a3
{
}

- (CoreTelephonyClient)telephonyClient
{
  return self->_telephonyClient;
}

- (void)setTelephonyClient:(id)a3
{
}

- (OS_nw_path_monitor)pathMonitor
{
  return self->_pathMonitor;
}

- (void)setPathMonitor:(id)a3
{
}

- (BOOL)forceNetworkReachabilityOverWiFi
{
  return self->_forceNetworkReachabilityOverWiFi;
}

- (void)setForceNetworkReachabilityOverWiFi:(BOOL)a3
{
  self->_forceNetworkReachabilityOverWiFi = a3;
}

- (OS_dispatch_queue)forceNetworkReachabilityQueue
{
  return self->_forceNetworkReachabilityQueue;
}

- (void)setForceNetworkReachabilityQueue:(id)a3
{
}

- (void).cxx_destruct
{
}

@end