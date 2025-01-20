@interface MFAttachmentCapabilitiesService
+ (BOOL)handleMessage:(id)a3 connectionState:(id)a4 replyObject:(id *)a5 error:(id *)a6;
+ (id)requiredEntitlement;
+ (id)serviceName;
@end

@implementation MFAttachmentCapabilitiesService

+ (id)serviceName
{
  return MSAccountsAttachmentCapabilities;
}

+ (id)requiredEntitlement
{
  return 0;
}

+ (BOOL)handleMessage:(id)a3 connectionState:(id)a4 replyObject:(id *)a5 error:(id *)a6
{
  id v10 = a3;
  v11 = xpc_dictionary_get_value(v10, (const char *)[_MSMailServiceArguments UTF8String]);
  if (!v11)
  {
    v20 = +[NSAssertionHandler currentHandler];
    [v20 handleFailureInMethod:a2, a1, @"MFAccountsService.m", 319, @"Invalid parameter not satisfying: %@", @"arguments" object file lineNumber description];
  }
  v12 = +[MFAttachmentCapabilities capabilitiesDictionary];
  if (v12
    || (+[NSError errorWithDomain:MSAccountsErrorDomain code:1001 userInfo:0], v19 = objc_claimAutoreleasedReturnValue(), (id v16 = v19) == 0))
  {
    xpc_object_t reply = xpc_dictionary_create_reply(v10);
    v14 = (void *)_CFXPCCreateXPCObjectFromCFObject();
    xpc_dictionary_set_value(reply, (const char *)[MSAccountsResultCapabilities UTF8String], v14);
    id v15 = reply;
    *a5 = v15;

    id v16 = 0;
    BOOL v17 = 1;
  }
  else if (a6)
  {
    id v16 = v19;
    BOOL v17 = 0;
    *a6 = v16;
  }
  else
  {
    BOOL v17 = 0;
  }

  return v17;
}

@end