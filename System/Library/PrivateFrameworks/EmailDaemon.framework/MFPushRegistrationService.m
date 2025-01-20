@interface MFPushRegistrationService
+ (BOOL)handleMessage:(id)a3 connectionState:(id)a4 replyObject:(id *)a5 error:(id *)a6;
+ (id)requiredEntitlement;
+ (id)serviceName;
@end

@implementation MFPushRegistrationService

+ (id)serviceName
{
  return MSPushRegistrationCommandName;
}

+ (id)requiredEntitlement
{
  return @"com.apple.mobilemail.mailservices";
}

+ (BOOL)handleMessage:(id)a3 connectionState:(id)a4 replyObject:(id *)a5 error:(id *)a6
{
  xpc_object_t original = a3;
  v10 = xpc_dictionary_get_value(original, (const char *)[_MSMailServiceArguments UTF8String]);
  if (!v10)
  {
    v25 = +[NSAssertionHandler currentHandler];
    [v25 handleFailureInMethod:a2, a1, @"MFPushRegistrationService.m", 29, @"Invalid parameter not satisfying: %@", @"args" object file lineNumber description];
  }
  v11 = (void *)_CFXPCCreateCFObjectFromXPCObject();
  v26 = [v11 objectForKey:MSPushRegistrationArgumentBundle];
  v12 = [v11 objectForKey:MSPushRegistrationArgumentAccount];
  v13 = +[MailAccount accountWithUniqueId:v12];
  v14 = a5;
  v15 = [v11 objectForKey:MSPushRegistrationArgumentPrefix];
  v16 = [v11 objectForKey:MSPushRegistrationArgumentMailboxNames];
  unsigned int v17 = [v13 _registerPushNotificationPrefix:v15 forMailboxNames:v16];
  if (v17)
  {
    v18 = MFLogGeneral();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
    {
      v19 = [v16 componentsJoinedByString:@", "];
      *(_DWORD *)buf = 138413058;
      v29 = v13;
      __int16 v30 = 2112;
      v31 = v19;
      __int16 v32 = 2112;
      v33 = v15;
      __int16 v34 = 2112;
      v35 = v26;
      _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_INFO, "#aps-push account %@: registered mailboxes {%@} for external push notifications with prefix '%@' for '%@'", buf, 0x2Au);
    }
    xpc_object_t reply = xpc_dictionary_create_reply(original);
    xpc_dictionary_set_BOOL(reply, (const char *)[MSPushRegistrationResultSuccess UTF8String], 1);
    id v21 = reply;
    id *v14 = v21;

    id v22 = 0;
  }
  else
  {
    v23 = MFLogGeneral();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR)) {
      sub_1000C23E4((uint64_t)v13, v23);
    }

    id v22 = +[NSError errorWithDomain:MSPushRegistrationErrorDomain code:1001 userInfo:0];
    if (a6)
    {
      id v22 = v22;
      *a6 = v22;
    }
  }

  return v17;
}

@end