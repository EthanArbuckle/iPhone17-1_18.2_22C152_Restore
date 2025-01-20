@interface GEOOfflineServiceDaemon
- (BOOL)isOfflineService;
- (BOOL)shouldAllowIncomingConnection:(id)a3;
@end

@implementation GEOOfflineServiceDaemon

- (BOOL)isOfflineService
{
  return 1;
}

- (BOOL)shouldAllowIncomingConnection:(id)a3
{
  v3 = (void *)xpc_connection_copy_entitlement_value();
  v4 = v3;
  if (!v3)
  {
    v5 = sub_1000052A8();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      __int16 v12 = 0;
      v6 = "Rejecting incoming connection due to missing entitlement";
      v7 = (uint8_t *)&v12;
      goto LABEL_11;
    }
LABEL_12:

    BOOL v8 = 0;
    goto LABEL_13;
  }
  if (xpc_get_type(v3) != (xpc_type_t)&_xpc_type_BOOL)
  {
    v5 = sub_1000052A8();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      __int16 v11 = 0;
      v6 = "Rejecting incoming connection due to malformed entitlement value";
      v7 = (uint8_t *)&v11;
LABEL_11:
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_ERROR, v6, v7, 2u);
      goto LABEL_12;
    }
    goto LABEL_12;
  }
  if (!xpc_BOOL_get_value(v4))
  {
    v5 = sub_1000052A8();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      __int16 v10 = 0;
      v6 = "Rejecting incoming connection due to incorrect entitlement value";
      v7 = (uint8_t *)&v10;
      goto LABEL_11;
    }
    goto LABEL_12;
  }
  BOOL v8 = 1;
LABEL_13:

  return v8;
}

- (void).cxx_destruct
{
}

@end