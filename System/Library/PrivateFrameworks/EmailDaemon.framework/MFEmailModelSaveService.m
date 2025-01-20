@interface MFEmailModelSaveService
+ (id)requiredEntitlement;
+ (id)serviceName;
+ (void)handleMessage:(id)a3 connectionState:(id)a4 reply:(id)a5;
@end

@implementation MFEmailModelSaveService

+ (id)serviceName
{
  return MSSaveEmailCommand;
}

+ (id)requiredEntitlement
{
  return @"com.apple.mobilemail.mailservices";
}

+ (void)handleMessage:(id)a3 connectionState:(id)a4 reply:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  v10 = xpc_dictionary_get_value(v8, (const char *)[_MSMailServiceArguments UTF8String]);
  if (!v10)
  {
    v16 = +[NSAssertionHandler currentHandler];
    [v16 handleFailureInMethod:a2, a1, @"MFDeliveryService.m", 247, @"Invalid parameter not satisfying: %@", @"args" object file lineNumber description];
  }
  v11 = (void *)_CFXPCCreateCFObjectFromXPCObject();
  v12 = [v11 objectForKey:MSSaveEmailArgumentKeyEmail];
  v13 = +[NSKeyedUnarchiver unarchivedObjectOfClass:objc_opt_class() fromData:v12 error:0];
  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472;
  v17[2] = sub_100063AB8;
  v17[3] = &unk_10013BE08;
  id v14 = v8;
  id v18 = v14;
  id v15 = v9;
  id v19 = v15;
  objc_msgSend(v13, "mf_mailMessageFromModel:", v17);
}

@end