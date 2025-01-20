@interface MFCustomSignatureService
+ (BOOL)handleMessage:(id)a3 connectionState:(id)a4 replyObject:(id *)a5 error:(id *)a6;
+ (id)requiredEntitlement;
+ (id)serviceName;
@end

@implementation MFCustomSignatureService

+ (id)serviceName
{
  return MSAccountsCustomSignature;
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
    v19 = +[NSAssertionHandler currentHandler];
    [v19 handleFailureInMethod:a2, a1, @"MFAccountsService.m", 109, @"Invalid parameter not satisfying: %@", @"arguments" object file lineNumber description];
  }
  v11 = xpc_dictionary_get_value(v10, (const char *)[MSAccountsArgumentSendingEmailAddress UTF8String]);
  v12 = (void *)_CFXPCCreateCFObjectFromXPCObject();

  v13 = +[MFSignatures sharedInstance];
  v14 = [v13 signatureForSendingEmailAddress:v12];

  xpc_object_t reply = xpc_dictionary_create_reply(v9);
  v16 = (void *)_CFXPCCreateXPCObjectFromCFObject();
  xpc_dictionary_set_value(reply, (const char *)[MSAccountsResultSignature UTF8String], v16);
  id v17 = reply;
  *a5 = v17;

  return 1;
}

@end