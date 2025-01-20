@interface NSXPCConnection
- (id)gc_peerBundleIdentifier;
@end

@implementation NSXPCConnection

- (id)gc_peerBundleIdentifier
{
  v0 = (void *)MEMORY[0x270FA5388]();
  if (!v0)
  {
LABEL_31:
    v9 = 0;
    goto LABEL_32;
  }
  memset(&v16, 0, sizeof(v16));
  [v0 auditToken];
  memset(&token, 0, sizeof(token));
  v1 = SecTaskCreateWithAuditToken(0, &token);
  if (!v1 || (v2 = (void *)SecTaskCopyValueForEntitlement(v1, @"application-identifier", 0)) == 0)
  {
LABEL_24:
    int v10 = proc_pidpath_audittoken(&v16, &token, 0x1000u);
    if (v10 >= 1)
    {
      v11 = [[NSString_0 alloc] initWithBytes:&token length:v10 encoding:4];
      v12 = +[NSURL fileURLWithPath:v11];
      if (v12)
      {
        v13 = (void *)_CFBundleCopyBundleURLForExecutableURL();
        if (v13)
        {
          v14 = +[NSBundle bundleWithURL:v13];
          v9 = [v14 bundleIdentifier];

          if (v9)
          {

            goto LABEL_32;
          }
        }
      }
    }
    goto LABEL_31;
  }
  id v3 = v2;
  if ((unint64_t)[v3 length] >= 0xB
    && [v3 characterAtIndex:10] == 46)
  {
    v4 = objc_msgSend(v3, "substringWithRange:", 0, 10);
    unint64_t v5 = 0;
    do
    {
      int v6 = [v3 characterAtIndex:v5];
      BOOL v8 = (v6 - 65) < 0x1A || (v6 - 48) < 0xA;
      if (v5 > 8) {
        break;
      }
      ++v5;
    }
    while (v8);
    if (v8)
    {
      v9 = objc_msgSend(v3, "substringWithRange:", 11, objc_msgSend(v3, "length") - 11);
      if (v9) {
        goto LABEL_21;
      }
      goto LABEL_20;
    }
  }
  v4 = 0;
LABEL_20:
  v9 = (void *)CFRetain(v3);
LABEL_21:
  if (v4) {
    CFRelease(v4);
  }

  CFRelease(v3);
  if (!v9) {
    goto LABEL_24;
  }
LABEL_32:

  return v9;
}

@end