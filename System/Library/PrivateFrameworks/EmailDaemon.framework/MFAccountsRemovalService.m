@interface MFAccountsRemovalService
+ (BOOL)handleMessage:(id)a3 connectionState:(id)a4 replyObject:(id *)a5 error:(id *)a6;
+ (id)requiredEntitlement;
+ (id)serviceName;
+ (void)_deleteAccount:(id)a3;
@end

@implementation MFAccountsRemovalService

+ (id)serviceName
{
  return MSAccountsRemoveAccounts;
}

+ (id)requiredEntitlement
{
  return @"com.apple.mobilemail.mailservices";
}

+ (BOOL)handleMessage:(id)a3 connectionState:(id)a4 replyObject:(id *)a5 error:(id *)a6
{
  id v10 = a3;
  id v27 = a4;
  xpc_dictionary_get_value(v10, (const char *)[_MSMailServiceArguments UTF8String]);
  xpc_object_t xdict = (xpc_object_t)objc_claimAutoreleasedReturnValue();
  if (!xdict)
  {
    v24 = +[NSAssertionHandler currentHandler];
    [v24 handleFailureInMethod:a2, a1, @"MFAccountsService.m", 138, @"Invalid parameter not satisfying: %@", @"arguments" object file lineNumber description];
  }
  v28 = xpc_dictionary_get_value(xdict, (const char *)[MSAccountsArgumentAccountUniqueIdentifiers UTF8String]);
  long long v32 = 0u;
  long long v33 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  id v11 = (id)_CFXPCCreateCFObjectFromXPCObject();
  id v12 = [v11 countByEnumeratingWithState:&v30 objects:v34 count:16];
  v25 = a5;
  v13 = 0;
  if (v12)
  {
    uint64_t v14 = *(void *)v31;
    do
    {
      for (i = 0; i != v12; i = (char *)i + 1)
      {
        if (*(void *)v31 != v14) {
          objc_enumerationMutation(v11);
        }
        uint64_t v16 = *(void *)(*((void *)&v30 + 1) + 8 * i);
        v17 = +[MailAccount accountWithUniqueId:v16];
        if (v17)
        {
          [a1 _deleteAccount:v17];
        }
        else
        {
          if (!v13)
          {
            v13 = +[NSMutableArray array];
          }
          [v13 addObject:v16];
        }
      }
      id v12 = [v11 countByEnumeratingWithState:&v30 objects:v34 count:16];
    }
    while (v12);
  }

  if ([v13 count]
    && (+[NSError errorWithDomain:MSAccountsErrorDomain code:1001 userInfo:0], v18 = objc_claimAutoreleasedReturnValue(), (id v19 = v18) != 0))
  {
    if (a6)
    {
      id v19 = v18;
      BOOL v20 = 0;
      *a6 = v19;
    }
    else
    {
      BOOL v20 = 0;
    }
  }
  else
  {
    xpc_object_t reply = xpc_dictionary_create_reply(v10);
    xpc_dictionary_set_BOOL(reply, (const char *)[MSAccountsResultSuccess UTF8String], 1);
    id v22 = reply;
    id *v25 = v22;

    id v19 = 0;
    BOOL v20 = 1;
  }

  return v20;
}

+ (void)_deleteAccount:(id)a3
{
  id v3 = a3;
  if (v3)
  {
    id v7 = v3;
    v4 = [v3 identifier];
    v5 = +[MailPersistentStorage sharedStorage];
    [v5 removeAllDataBelongingToAccount:v7];

    [v7 invalidateAndDelete];
    if (v4)
    {
      id v6 = objc_alloc_init((Class)TLToneManager);
      [v6 setCurrentToneIdentifier:0 forAlertType:5 topic:v4];
    }
    id v3 = v7;
  }
}

@end