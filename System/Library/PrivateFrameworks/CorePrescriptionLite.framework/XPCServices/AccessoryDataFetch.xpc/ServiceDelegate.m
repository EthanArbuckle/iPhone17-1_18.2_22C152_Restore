@interface ServiceDelegate
- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4;
@end

@implementation ServiceDelegate

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  id v4 = a4;
  v5 = [v4 valueForEntitlement:@"com.apple.CorePrescription.CalibrationDataFetcher"];
  if (v5
    && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
    && ([v5 BOOLValue] & 1) != 0)
  {
    v6 = +[NSXPCInterface interfaceWithProtocol:&OBJC_PROTOCOL___AccessoryDataFetchProtocol];
    [v4 setExportedInterface:v6];

    v7 = objc_opt_new();
    [v4 setExportedObject:v7];
    [v4 resume];

    BOOL v8 = 1;
  }
  else
  {
    v9 = off_100028CD0;
    if (os_log_type_enabled((os_log_t)off_100028CD0, OS_LOG_TYPE_ERROR))
    {
      v11 = v9;
      unsigned int v12 = [v4 processIdentifier];
      if (v4) {
        [v4 auditToken];
      }
      else {
        memset(&v16, 0, sizeof(v16));
      }
      audit_token_t token = v16;
      v13 = SecTaskCreateWithAuditToken(0, &token);
      v14 = 0;
      if (v13)
      {
        v15 = v13;
        v14 = (__CFString *)SecTaskCopySigningIdentifier(v13, 0);
        CFRelease(v15);
      }
      token.val[0] = 138412802;
      *(void *)&token.val[1] = @"com.apple.CorePrescription.CalibrationDataFetcher";
      LOWORD(token.val[3]) = 1024;
      *(unsigned int *)((char *)&token.val[3] + 2) = v12;
      HIWORD(token.val[4]) = 2112;
      *(void *)&token.val[5] = v14;
      _os_log_error_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_ERROR, "failed for missing entitlement: %@, client: (%d) %@", (uint8_t *)&token, 0x1Cu);
    }
    objc_msgSend(v4, "invalidate", *(_OWORD *)v16.val, *(_OWORD *)&v16.val[4]);
    BOOL v8 = 0;
  }

  return v8;
}

@end