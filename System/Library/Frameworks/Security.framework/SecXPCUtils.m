@interface SecXPCUtils
+ (BOOL)clientCanEditPreferenceOwnership;
+ (__CFString)copyApplicationIdentifier;
+ (__CFString)copyApplicationIdentifierFromConnection:(id)a3;
+ (__CFString)copyApplicationIdentifierFromSelf;
+ (__CFString)copySigningIdentifier:(id)a3;
@end

@implementation SecXPCUtils

+ (__CFString)copyApplicationIdentifier
{
  v2 = [MEMORY[0x1E4F29268] currentConnection];
  if (v2) {
    v3 = +[SecXPCUtils copyApplicationIdentifierFromConnection:v2];
  }
  else {
    v3 = +[SecXPCUtils copyApplicationIdentifierFromSelf];
  }
  v4 = v3;

  return v4;
}

+ (__CFString)copyApplicationIdentifierFromConnection:(id)a3
{
  id v3 = a3;
  v4 = [v3 valueForEntitlement:@"application-identifier"];
  if (!v4
    && ([v3 valueForEntitlement:@"com.apple.application-identifier"],
        (v4 = (__CFString *)objc_claimAutoreleasedReturnValue()) == 0)
    || ![(__CFString *)v4 isMemberOfClass:objc_opt_class()]
    || (Copy = (__CFString *)CFStringCreateCopy(0, v4)) == 0)
  {
    Copy = +[SecXPCUtils copySigningIdentifier:v3];
  }

  return Copy;
}

+ (__CFString)copyApplicationIdentifierFromSelf
{
  v2 = SecTaskCreateFromSelf(0);
  if (v2)
  {
    id v3 = v2;
    v4 = (__CFString *)SecTaskCopyValueForEntitlement(v2, @"application-identifier", 0);
    if (v4)
    {
      v5 = v4;
      CFRelease(v3);
    }
    else
    {
      v5 = (__CFString *)SecTaskCopyValueForEntitlement(v3, @"com.apple.application-identifier", 0);
      CFRelease(v3);
      if (!v5) {
        goto LABEL_8;
      }
    }
    CFTypeID v6 = CFGetTypeID(v5);
    if (v6 == CFStringGetTypeID()) {
      return v5;
    }
    CFRelease(v5);
  }
LABEL_8:

  return +[SecXPCUtils copySigningIdentifier:0];
}

+ (__CFString)copySigningIdentifier:(id)a3
{
  id v3 = a3;
  v4 = v3;
  if (v3)
  {
    [v3 auditToken];
    SecTaskRef v5 = SecTaskCreateWithAuditToken(0, &v9);
  }
  else
  {
    SecTaskRef v5 = SecTaskCreateFromSelf(0);
  }
  SecTaskRef v6 = v5;
  if (v5)
  {
    v7 = (__CFString *)SecTaskCopyIdentifier((uint64_t)v5, 11, 0);
    CFRelease(v6);
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

+ (BOOL)clientCanEditPreferenceOwnership
{
  v2 = [MEMORY[0x1E4F29268] currentConnection];
  id v3 = v2;
  if (v2)
  {
    v4 = [v2 valueForEntitlement:@"keychain-access-groups"];
    if (v4
      && [v4 isMemberOfClass:objc_opt_class()]
      && ([v4 containsObject:@"*"] & 1) != 0)
    {

      LOBYTE(v5) = 1;
      goto LABEL_8;
    }

LABEL_7:
    LOBYTE(v5) = 0;
    goto LABEL_8;
  }
  v7 = SecTaskCreateFromSelf(0);
  SecTaskRef v5 = v7;
  if (!v7) {
    goto LABEL_8;
  }
  v8 = (void *)SecTaskCopyValueForEntitlement(v7, @"keychain-access-groups", 0);
  CFRelease(v5);
  if (!v8) {
    goto LABEL_7;
  }
  CFTypeID v9 = CFGetTypeID(v8);
  if (v9 == CFArrayGetTypeID()) {
    LOBYTE(v5) = [v8 containsObject:@"*"];
  }
  else {
    LOBYTE(v5) = 0;
  }
  CFRelease(v8);
LABEL_8:

  return (char)v5;
}

@end