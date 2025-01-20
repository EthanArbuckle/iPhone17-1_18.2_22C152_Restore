@interface CLMapHelperServiceDelegate
- (BOOL)clientConnection:(id)a3 hasEntitlement:(id)a4;
- (BOOL)isExecutableAllowed:(id)a3;
- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4;
- (id)executablePathOfConnection:(id)a3;
@end

@implementation CLMapHelperServiceDelegate

- (BOOL)clientConnection:(id)a3 hasEntitlement:(id)a4
{
  v5 = [a3 valueForEntitlement:a4];
  *(_WORD *)&self->hasEntitlementForRoadData = 0;
  p_hasEntitlementForRoadData = &self->hasEntitlementForRoadData;
  objc_opt_class();
  BOOL v7 = 0;
  if (objc_opt_isKindOfClass())
  {
    id v8 = v5;
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 67109120;
      LODWORD(v28) = [v8 count];
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "CLTSP,MapHelperService,entitlementCheck,arrayEntries,%d", buf, 8u);
    }
    v22 = v5;
    long long v25 = 0u;
    long long v26 = 0u;
    long long v23 = 0u;
    long long v24 = 0u;
    id v9 = v8;
    id v10 = [v9 countByEnumeratingWithState:&v23 objects:v35 count:16];
    if (v10)
    {
      id v11 = v10;
      char v12 = 0;
      uint64_t v13 = *(void *)v24;
      do
      {
        for (i = 0; i != v11; i = (char *)i + 1)
        {
          if (*(void *)v24 != v13) {
            objc_enumerationMutation(v9);
          }
          uint64_t v15 = *(void *)(*((void *)&v23 + 1) + 8 * i);
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            unsigned __int8 v16 = [@"road-tiles" isEqualToString:v15];
            v17 = p_hasEntitlementForRoadData;
            if ((v16 & 1) != 0
              || (unsigned int v18 = [@"building-tiles" isEqualToString:v15],
                  v17 = p_hasEntitlementForRoadData + 1,
                  v18))
            {
              char v12 = 1;
              BOOL *v17 = 1;
            }
            if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
            {
              BOOL v19 = *p_hasEntitlementForRoadData;
              BOOL v20 = p_hasEntitlementForRoadData[1];
              *(_DWORD *)buf = 138413058;
              uint64_t v28 = v15;
              __int16 v29 = 1024;
              int v30 = v12 & 1;
              __int16 v31 = 1024;
              BOOL v32 = v19;
              __int16 v33 = 1024;
              BOOL v34 = v20;
              _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "CLTSP,MapHelperService,entitlementCheck,entry,%@,returnValue,%d,road,%d,building,%d", buf, 0x1Eu);
            }
          }
        }
        id v11 = [v9 countByEnumeratingWithState:&v23 objects:v35 count:16];
      }
      while (v11);
    }
    else
    {
      char v12 = 0;
    }

    BOOL v7 = v12 & 1;
    v5 = v22;
  }
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67109120;
    LODWORD(v28) = v7;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "CLTSP,MapHelperService,returnValue,%d", buf, 8u);
  }

  return v7;
}

- (id)executablePathOfConnection:(id)a3
{
  id v3 = a3;
  bzero(buffer, 0x1000uLL);
  memset(&v6, 0, sizeof(v6));
  if (v3) {
    objc_msgSend(v3, "auditToken", *(_OWORD *)v6.val, *(_OWORD *)&v6.val[4]);
  }
  if (proc_pidpath_audittoken(&v6, buffer, 0x1000u) < 1)
  {
    v4 = 0;
  }
  else
  {
    v4 = +[NSString stringWithUTF8String:buffer];
  }

  return v4;
}

- (BOOL)isExecutableAllowed:(id)a3
{
  id v4 = a3;
  v5 = +[NSSet setWithObjects:@"routined", @"locationd", @"CLLogger", @"wedge", 0];
  audit_token_t v6 = [(CLMapHelperServiceDelegate *)self executablePathOfConnection:v4];

  BOOL v7 = [v6 lastPathComponent];

  LOBYTE(v6) = [v5 containsObject:v7];
  return (char)v6;
}

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  id v5 = a4;
  if (![(CLMapHelperServiceDelegate *)self clientConnection:v5 hasEntitlement:@"com.apple.private.corelocation.map-helper-service"])
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v12) = 0;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "CLTSP,MapHelperService,Application does not have correct entitlement", (uint8_t *)&v12, 2u);
    }
    goto LABEL_8;
  }
  if (![(CLMapHelperServiceDelegate *)self isExecutableAllowed:v5])
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      id v9 = [(CLMapHelperServiceDelegate *)self executablePathOfConnection:v5];
      id v10 = [v9 lastPathComponent];
      int v12 = 138412290;
      uint64_t v13 = v10;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "CLTSP,MapHelperService,Application not allowed to establish connection,%@", (uint8_t *)&v12, 0xCu);
    }
LABEL_8:
    [v5 invalidate];
    BOOL v8 = 0;
    goto LABEL_9;
  }
  audit_token_t v6 = +[NSXPCInterface interfaceWithProtocol:&OBJC_PROTOCOL___CLMapHelperServiceProtocol];
  [v5 setExportedInterface:v6];

  BOOL v7 = objc_opt_new();
  [v7 setEntitlementsForRoad:self->hasEntitlementForRoadData];
  [v7 setEntitlementsForBuilding:self->hasEntitlementForBuildingData];
  [v5 setExportedObject:v7];
  [v5 resume];

  BOOL v8 = 1;
LABEL_9:

  return v8;
}

@end