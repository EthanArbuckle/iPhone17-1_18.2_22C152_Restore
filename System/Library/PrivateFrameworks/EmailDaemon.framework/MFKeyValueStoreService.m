@interface MFKeyValueStoreService
+ (BOOL)handleMessage:(id)a3 connectionState:(id)a4 replyObject:(id *)a5 error:(id *)a6;
+ (id)requiredEntitlement;
+ (id)serviceName;
@end

@implementation MFKeyValueStoreService

+ (id)serviceName
{
  return MSKeyValueStoreValueForKey;
}

+ (id)requiredEntitlement
{
  return @"com.apple.mobilemail.mailservices";
}

+ (BOOL)handleMessage:(id)a3 connectionState:(id)a4 replyObject:(id *)a5 error:(id *)a6
{
  id v9 = a3;
  v10 = xpc_dictionary_get_value(v9, (const char *)[_MSMailServiceArguments UTF8String]);
  if (!v10)
  {
    v21 = +[NSAssertionHandler currentHandler];
    [v21 handleFailureInMethod:a2, a1, @"MFKeyValueStoreService.m", 31, @"Invalid parameter not satisfying: %@", @"args" object file lineNumber description];
  }
  v11 = (void *)_CFXPCCreateCFObjectFromXPCObject();
  v12 = [v11 objectForKey:MSKeyValueStoreArgumentKey];
  if (!v12) {
    goto LABEL_14;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    goto LABEL_14;
  }
  if ([v12 isEqualToString:@"SignatureKey"])
  {
    v13 = +[MFSignatures sharedInstance];
    uint64_t v14 = [v13 signature];
LABEL_11:
    v16 = (void *)v14;

    goto LABEL_15;
  }
  if ([v12 isEqualToString:@"UseAccountSignatures"])
  {
    v13 = +[MFSignatures sharedInstance];
    uint64_t v14 = +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", [v13 useAccountSignatures]);
    goto LABEL_11;
  }
  uint64_t v15 = EMUserDefaultAlwaysBCCSelf;
  if ([v12 isEqualToString:EMUserDefaultAlwaysBCCSelf])
  {
    v13 = +[NSUserDefaults em_userDefaults];
    uint64_t v14 = [v13 valueForKey:v15];
    goto LABEL_11;
  }
  if ([v12 isEqualToString:EMUserDefaultLinesOfPreviewKey])
  {
    v16 = +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", +[NSUserDefaults em_linesOfPreview]);
  }
  else
  {
LABEL_14:
    v16 = 0;
  }
LABEL_15:
  xpc_object_t reply = xpc_dictionary_create_reply(v9);
  if (v16)
  {
    v18 = (void *)_CFXPCCreateXPCObjectFromCFObject();
    xpc_dictionary_set_value(reply, (const char *)[MSKeyValueStoreResultValue UTF8String], v18);
  }
  id v19 = reply;
  *a5 = v19;

  return 1;
}

@end