@interface MFMessageSaveService
+ (BOOL)handleMessage:(id)a3 connectionState:(id)a4 replyObject:(id *)a5 error:(id *)a6;
+ (id)requiredEntitlement;
+ (id)serviceName;
@end

@implementation MFMessageSaveService

+ (id)serviceName
{
  return MSSaveEmailMessageUICommand;
}

+ (id)requiredEntitlement
{
  return @"com.apple.mobilemail.mailservices";
}

+ (BOOL)handleMessage:(id)a3 connectionState:(id)a4 replyObject:(id *)a5 error:(id *)a6
{
  id v10 = a3;
  v11 = xpc_dictionary_get_value(v10, (const char *)[_MSMailServiceArguments UTF8String]);
  if (!v11)
  {
    v27 = +[NSAssertionHandler currentHandler];
    [v27 handleFailureInMethod:a2, a1, @"MFDeliveryService.m", 298, @"Invalid parameter not satisfying: %@", @"args" object file lineNumber description];
  }
  v12 = (void *)_CFXPCCreateCFObjectFromXPCObject();
  v13 = [v12 objectForKey:@"UniqueID"];
  v14 = [v12 objectForKey:MSSaveEmailArgumentKeyRFC822Data];
  v15 = [v12 objectForKey:MSSaveEmailArgumentKeyAutosaveIdentifier];
  if (!v14)
  {
    uint64_t v16 = +[NSError errorWithDomain:MSMailServiceErrorDomain code:7500 userInfo:0];
    goto LABEL_12;
  }
  if (v13) {
    +[MailAccount accountWithUniqueId:v13];
  }
  else {
  v17 = +[LocalAccount localAccount];
  }
  if (!v17)
  {
    uint64_t v16 = +[NSError errorWithDomain:MSMailServiceErrorDomain code:7502 userInfo:0];
LABEL_12:
    id v24 = (id)v16;
    if (!a6)
    {
LABEL_15:
      BOOL v25 = 0;
      goto LABEL_16;
    }
LABEL_13:
    id v24 = v24;
    BOOL v25 = 0;
    *a6 = v24;
    goto LABEL_16;
  }
  v18 = +[MFMailMessage messageWithRFC822Data:v14];
  if (!v18)
  {
    id v24 = +[NSError errorWithDomain:MSMailServiceErrorDomain code:7501 userInfo:0];

    if (!a6) {
      goto LABEL_15;
    }
    goto LABEL_13;
  }
  v19 = dispatch_get_global_queue(0, 0);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10006429C;
  block[3] = &unk_10013ABC8;
  id v29 = v18;
  id v30 = v17;
  id v31 = v15;
  id v20 = v17;
  id v21 = v18;
  dispatch_async(v19, block);

  xpc_object_t reply = xpc_dictionary_create_reply(v10);
  xpc_dictionary_set_BOOL(reply, (const char *)[MSSaveEmailResultKeySuccess UTF8String], 1);
  id v23 = reply;
  *a5 = v23;

  id v24 = 0;
  BOOL v25 = 1;
LABEL_16:

  return v25;
}

@end