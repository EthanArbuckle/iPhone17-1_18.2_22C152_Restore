@interface MFAccountsListService
+ (BOOL)handleMessage:(id)a3 connectionState:(id)a4 replyObject:(id *)a5 error:(id *)a6;
+ (id)requiredEntitlement;
+ (id)serviceName;
@end

@implementation MFAccountsListService

+ (id)serviceName
{
  return MSAccountsListAccounts;
}

+ (id)requiredEntitlement
{
  return @"com.apple.mobilemail.mailservices";
}

+ (BOOL)handleMessage:(id)a3 connectionState:(id)a4 replyObject:(id *)a5 error:(id *)a6
{
  xpc_object_t original = a3;
  xpc_dictionary_get_value(original, (const char *)[_MSMailServiceArguments UTF8String]);
  xpc_object_t xdict = (xpc_object_t)objc_claimAutoreleasedReturnValue();
  if (!xdict)
  {
    v25 = +[NSAssertionHandler currentHandler];
    [v25 handleFailureInMethod:a2, a1, @"MFAccountsService.m", 51, @"Invalid parameter not satisfying: %@", @"arguments" object file lineNumber description];
  }
  v26 = xpc_dictionary_get_value(xdict, (const char *)[MSAccountsArgumentKeys UTF8String]);
  v28 = (void *)_CFXPCCreateCFObjectFromXPCObject();
  string = xpc_dictionary_get_string(xdict, (const char *)[MSAccountsArgumentBundleID UTF8String]);
  if (string)
  {
    v29 = +[NSString stringWithUTF8String:string];
  }
  else
  {
    v29 = 0;
  }
  v10 = xpc_dictionary_get_value(xdict, (const char *)[MSAccountsArgumentSourceAccountManagement UTF8String]);
  v30 = (void *)_CFXPCCreateCFObjectFromXPCObject();

  v11 = +[MCProfileConnection sharedConnection];
  v12 = objc_msgSend(v11, "filteredMailSheetAccountsForBundleID:sourceAccountManagement:", v29, objc_msgSend(v30, "intValue"));

  v13 = +[NSMutableArray arrayWithCapacity:](NSMutableArray, "arrayWithCapacity:", [v12 count]);
  v14 = [(_MFResultsGenerator *)[MFAccountResultsGenerator alloc] initWithKeys:v28];
  long long v34 = 0u;
  long long v35 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  id v15 = v12;
  id v16 = [v15 countByEnumeratingWithState:&v32 objects:v36 count:16];
  if (v16)
  {
    uint64_t v17 = *(void *)v33;
    do
    {
      for (i = 0; i != v16; i = (char *)i + 1)
      {
        if (*(void *)v33 != v17) {
          objc_enumerationMutation(v15);
        }
        uint64_t v19 = *(void *)(*((void *)&v32 + 1) + 8 * i);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          [(MFAccountResultsGenerator *)v14 setAccount:v19];
          v20 = [(_MFResultsGenerator *)v14 results];
          [v13 addObject:v20];
        }
      }
      id v16 = [v15 countByEnumeratingWithState:&v32 objects:v36 count:16];
    }
    while (v16);
  }

  xpc_object_t reply = xpc_dictionary_create_reply(original);
  v22 = (void *)_CFXPCCreateXPCObjectFromCFObject();
  xpc_dictionary_set_value(reply, (const char *)[MSAccountsResultAccounts UTF8String], v22);
  id v23 = reply;
  *a5 = v23;

  return 1;
}

@end