@interface NSError(AppSSOKerberos)
+ (id)kerberosErrorWithCode:()AppSSOKerberos withDescription:;
+ (uint64_t)KDCUnreachable;
+ (uint64_t)credentialMissing;
+ (uint64_t)hostNameMissing;
+ (uint64_t)invalidKerberosOperation;
+ (uint64_t)passwordChangeNotEnabled;
+ (uint64_t)passwordSyncNotEnabled;
+ (uint64_t)servicePrincipalNameMissing;
+ (uint64_t)sourceAppNotAllowed;
+ (uint64_t)unhandledKerberosResult;
@end

@implementation NSError(AppSSOKerberos)

+ (uint64_t)credentialMissing
{
  return [a1 kerberosErrorWithCode:-110 withDescription:@"No gss credentials or errors found during authentication"];
}

+ (uint64_t)passwordChangeNotEnabled
{
  return [a1 kerberosErrorWithCode:-111 withDescription:@"Password change is not enabled"];
}

+ (uint64_t)servicePrincipalNameMissing
{
  return [a1 kerberosErrorWithCode:-112 withDescription:@"Service principal name is missing"];
}

+ (uint64_t)invalidKerberosOperation
{
  return [a1 kerberosErrorWithCode:-113 withDescription:@"Invalid Kerberos operation"];
}

+ (uint64_t)hostNameMissing
{
  return [a1 kerberosErrorWithCode:-114 withDescription:@"Host name missing"];
}

+ (uint64_t)unhandledKerberosResult
{
  return [a1 kerberosErrorWithCode:-115 withDescription:@"Kerberos result unhandled"];
}

+ (uint64_t)sourceAppNotAllowed
{
  return [a1 kerberosErrorWithCode:-116 withDescription:@"Source app not allowed"];
}

+ (uint64_t)KDCUnreachable
{
  return [a1 kerberosErrorWithCode:-118 withDescription:@"KDC unreachable"];
}

+ (id)kerberosErrorWithCode:()AppSSOKerberos withDescription:
{
  v12[1] = *MEMORY[0x263EF8340];
  v5 = (objc_class *)MEMORY[0x263F087E8];
  id v6 = a4;
  id v7 = [v5 alloc];
  uint64_t v11 = *MEMORY[0x263F08320];
  v12[0] = v6;
  v8 = [NSDictionary dictionaryWithObjects:v12 forKeys:&v11 count:1];

  v9 = (void *)[v7 initWithDomain:@"com.apple.AppSSO" code:a3 userInfo:v8];
  return v9;
}

+ (uint64_t)passwordSyncNotEnabled
{
  return [a1 kerberosErrorWithCode:-117 withDescription:@"Password sync is not enabled"];
}

@end