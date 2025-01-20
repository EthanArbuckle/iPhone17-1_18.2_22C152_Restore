@interface RTXPC
+ (BOOL)clientCodeSignatureIsValid:(id)a3 error:(id *)a4;
+ (id)executablePathOfConnection:(id)a3;
+ (id)signingIdentifierOfConnection:(id)a3;
@end

@implementation RTXPC

+ (id)executablePathOfConnection:(id)a3
{
  bzero(buffer, 0x1000uLL);
  if (proc_pidpath((int)[a3 processIdentifier], buffer, 0x1000u) < 1)
  {
    v4 = 0;
  }
  else
  {
    v4 = +[NSString stringWithUTF8String:buffer];
  }
  return v4;
}

+ (BOOL)clientCodeSignatureIsValid:(id)a3 error:(id *)a4
{
  return 1;
}

+ (id)signingIdentifierOfConnection:(id)a3
{
  id v3 = a3;
  v4 = v3;
  if (v3) {
    [v3 auditToken];
  }
  else {
    memset(&v9, 0, sizeof(v9));
  }
  v5 = SecTaskCreateWithAuditToken(0, &v9);
  if (v5)
  {
    v6 = v5;
    v7 = (__CFString *)SecTaskCopySigningIdentifier(v5, 0);
    CFRelease(v6);
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

@end