@interface MFMailboxListingService
+ (BOOL)handleMessage:(id)a3 connectionState:(id)a4 replyObject:(id *)a5 error:(id *)a6;
+ (id)requiredEntitlement;
+ (id)serviceName;
@end

@implementation MFMailboxListingService

+ (id)serviceName
{
  return MSAccountsListMailboxes;
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
    v31 = +[NSAssertionHandler currentHandler];
    [v31 handleFailureInMethod:a2, a1, @"MFAccountsService.m", 206, @"Invalid parameter not satisfying: %@", @"arguments" object file lineNumber description];
  }
  v11 = xpc_dictionary_get_value(v10, (const char *)[MSAccountsArgumentAccountUniqueIdentifiers UTF8String]);
  v33 = (void *)_CFXPCCreateCFObjectFromXPCObject();
  v37 = [v33 objectAtIndex:0];
  uint64_t v12 = xpc_dictionary_get_value(v10, (const char *)[MSAccountsArgumentKeys UTF8String]);
  v32 = a5;

  v34 = (void *)v12;
  v35 = (void *)_CFXPCCreateCFObjectFromXPCObject();
  v13 = +[MailAccount accountWithUniqueId:v37];
  v14 = v13;
  if (v13)
  {
    v15 = [v13 allMailboxUidsSortedWithSpecialsAtTopIncludingLocals:0];
    v16 = +[NSMutableArray arrayWithCapacity:](NSMutableArray, "arrayWithCapacity:", [v15 count]);
    v17 = [(_MFResultsGenerator *)[MFMailboxResultsGenerator alloc] initWithKeys:v35];
    v18 = [v14 pushedMailboxUids];
    [(MFMailboxResultsGenerator *)v17 setPushedMailboxUids:v18];

    long long v40 = 0u;
    long long v41 = 0u;
    long long v38 = 0u;
    long long v39 = 0u;
    id v19 = v15;
    id v20 = [v19 countByEnumeratingWithState:&v38 objects:v42 count:16];
    if (v20)
    {
      uint64_t v21 = *(void *)v39;
      do
      {
        for (i = 0; i != v20; i = (char *)i + 1)
        {
          if (*(void *)v39 != v21) {
            objc_enumerationMutation(v19);
          }
          [(MFMailboxResultsGenerator *)v17 setMailboxUid:*(void *)(*((void *)&v38 + 1) + 8 * i)];
          v23 = [(_MFResultsGenerator *)v17 results];
          [v16 addObject:v23];
        }
        id v20 = [v19 countByEnumeratingWithState:&v38 objects:v42 count:16];
      }
      while (v20);
    }

    goto LABEL_12;
  }
  v30 = +[NSError errorWithDomain:MSAccountsErrorDomain code:1001 userInfo:0];
  id v27 = v30;
  if (!v30)
  {
    v16 = 0;
LABEL_12:
    xpc_object_t reply = xpc_dictionary_create_reply(original);
    v25 = (void *)_CFXPCCreateXPCObjectFromCFObject();
    xpc_dictionary_set_value(reply, (const char *)[MSAccountsResultMailboxes UTF8String], v25);
    id v26 = reply;
    id *v32 = v26;

    id v27 = 0;
    BOOL v28 = 1;
    goto LABEL_13;
  }
  if (a6)
  {
    id v27 = v30;
    BOOL v28 = 0;
    *a6 = v27;
  }
  else
  {
    BOOL v28 = 0;
  }
LABEL_13:

  return v28;
}

@end