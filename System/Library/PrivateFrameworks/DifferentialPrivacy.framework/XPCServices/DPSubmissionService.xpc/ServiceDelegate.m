@interface ServiceDelegate
- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4;
@end

@implementation ServiceDelegate

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  id v5 = a4;
  v6 = +[_DPStrings submissionServiceAccessEntitlement];
  v7 = [v5 valueForEntitlement:v6];
  v8 = v7;
  if (v7 && ([v7 BOOLValue] & 1) != 0)
  {
    v9 = +[NSXPCInterface interfaceWithProtocol:&OBJC_PROTOCOL____DPSubmissionServiceProtocol];
    v10 = +[_DPDediscoDonation requiredClasses];
    uint64_t v21 = objc_opt_class();
    v11 = +[NSArray arrayWithObjects:&v21 count:1];
    v12 = [v10 setByAddingObjectsFromArray:v11];

    [v9 setClasses:v12 forSelector:"submitDonation:toDediscoWithReply:" argumentIndex:0 ofReply:0];
    v13 = +[NSSet setWithObjects:](NSSet, "setWithObjects:", objc_opt_class(), 0);
    [v9 setClasses:v13 forSelector:"submitDonation:toDediscoWithReply:" argumentIndex:1 ofReply:1];

    v14 = +[NSSet setWithObjects:](NSSet, "setWithObjects:", objc_opt_class(), 0);
    [v9 setClasses:v14 forSelector:"fetchTokenWithReply:" argumentIndex:1 ofReply:1];

    [v5 setExportedInterface:v9];
    v15 = +[_DPSubmissionService sharedInstance];
    [v5 setExportedObject:v15];
    [v5 resume];
    v16 = +[_DPLog service];
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v23 = v5;
      _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "accepted new connection %@", buf, 0xCu);
    }

    BOOL v17 = 1;
  }
  else
  {
    v18 = +[_DPLog service];
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      v20 = NSStringFromSelector(a2);
      *(_DWORD *)buf = 138412802;
      id v23 = v20;
      __int16 v24 = 1024;
      unsigned int v25 = [v5 processIdentifier];
      __int16 v26 = 2112;
      v27 = v6;
      _os_log_error_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_ERROR, "%@: client(%d) : missing entitlement(%@)", buf, 0x1Cu);
    }
    [v5 invalidate];
    BOOL v17 = 0;
  }

  return v17;
}

@end