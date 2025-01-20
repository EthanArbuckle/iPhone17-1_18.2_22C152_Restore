@interface MFEmailModelSendService
+ (id)requiredEntitlement;
+ (id)serviceName;
+ (void)handleMessage:(id)a3 connectionState:(id)a4 reply:(id)a5;
@end

@implementation MFEmailModelSendService

+ (id)serviceName
{
  return MSSendEmailCommand;
}

+ (id)requiredEntitlement
{
  return @"com.apple.mobilemail.mailservices";
}

+ (void)handleMessage:(id)a3 connectionState:(id)a4 reply:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  if ([v10 shouldCancel])
  {
    v12 = +[NSError errorWithDomain:MSMailServiceErrorDomain code:7334 userInfo:0];
    (*((void (**)(id, void, void, void *))v11 + 2))(v11, 0, 0, v12);
  }
  else
  {
    v12 = xpc_dictionary_get_value(v9, (const char *)[_MSMailServiceArguments UTF8String]);
    if (!v12)
    {
      v20 = +[NSAssertionHandler currentHandler];
      [v20 handleFailureInMethod:a2, a1, @"MFDeliveryService.m", 531, @"Invalid parameter not satisfying: %@", @"args" object file lineNumber description];
    }
    v13 = (void *)_CFXPCCreateCFObjectFromXPCObject();
    v14 = [v13 objectForKeyedSubscript:MSSendEmailArgumentKeyEmail];
    v15 = [v13 objectForKeyedSubscript:MSSendEmailArgumentKeyPlaySound];
    unsigned __int8 v16 = [v15 BOOLValue];

    v17 = [v13 objectForKeyedSubscript:MSSendEmailArgumentKeyHideMyEmailMessage];
    unsigned __int8 v18 = [v17 BOOLValue];

    v19 = +[NSKeyedUnarchiver unarchivedObjectOfClass:objc_opt_class() fromData:v14 error:0];
    v21[0] = _NSConcreteStackBlock;
    v21[1] = 3221225472;
    v21[2] = sub_100064D68;
    v21[3] = &unk_10013BE30;
    unsigned __int8 v24 = v16;
    unsigned __int8 v25 = v18;
    id v22 = v9;
    id v23 = v11;
    objc_msgSend(v19, "mf_mailMessageFromModel:", v21);
  }
}

@end