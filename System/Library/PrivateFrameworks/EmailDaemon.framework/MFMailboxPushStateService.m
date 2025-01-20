@interface MFMailboxPushStateService
+ (BOOL)handleMessage:(id)a3 connectionState:(id)a4 replyObject:(id *)a5 error:(id *)a6;
+ (id)requiredEntitlement;
+ (id)serviceName;
@end

@implementation MFMailboxPushStateService

+ (id)serviceName
{
  return MSAccountsMailboxPushState;
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
    v26 = +[NSAssertionHandler currentHandler];
    [v26 handleFailureInMethod:a2, a1, @"MFAccountsService.m", 262, @"Invalid parameter not satisfying: %@", @"arguments" object file lineNumber description];
  }
  v27 = xpc_dictionary_get_value(v10, (const char *)[MSAccountsArgumentAccountUniqueIdentifiers UTF8String]);
  v11 = (void *)_CFXPCCreateCFObjectFromXPCObject();
  v12 = [v11 objectAtIndex:0];
  v13 = xpc_dictionary_get_value(v10, (const char *)[MSAccountsArgumentMailboxRelativePath UTF8String]);
  v14 = (void *)_CFXPCCreateCFObjectFromXPCObject();

  v15 = xpc_dictionary_get_value(v10, (const char *)[MSAccountsArgumentMailboxPushState UTF8String]);
  v16 = a5;
  v17 = (void *)_CFXPCCreateCFObjectFromXPCObject();

  v18 = +[MailAccount accountWithUniqueId:v12];
  v19 = v18;
  if (v18)
  {
    v20 = [v18 mailboxUidForRelativePath:v14 create:0];
    if (v20)
    {
      if ([v17 BOOLValue])
      {
        v21 = +[NSSet setWithObject:v20];
        [v19 changePushedMailboxUidsAdded:v21 deleted:0];
      }
      else
      {
        v21 = +[NSSet setWithObject:v20];
        [v19 changePushedMailboxUidsAdded:0 deleted:v21];
      }

      v22 = 0;
    }
    else
    {
      v22 = +[NSError errorWithDomain:MSAccountsErrorDomain code:1003 userInfo:0];
    }

    if (v22) {
      goto LABEL_13;
    }
LABEL_8:
    xpc_object_t reply = xpc_dictionary_create_reply(original);
    xpc_dictionary_set_BOOL(reply, (const char *)[MSAccountsResultSuccess UTF8String], 1);
    id v24 = reply;
    id *v16 = v24;

    goto LABEL_15;
  }
  v22 = +[NSError errorWithDomain:MSAccountsErrorDomain code:1001 userInfo:0];
  if (!v22) {
    goto LABEL_8;
  }
LABEL_13:
  if (a6) {
    *a6 = v22;
  }
LABEL_15:

  return v22 == 0;
}

@end