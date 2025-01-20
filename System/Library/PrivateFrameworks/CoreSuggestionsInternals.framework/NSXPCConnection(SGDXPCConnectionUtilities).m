@interface NSXPCConnection(SGDXPCConnectionUtilities)
- (id)sgd_clientName;
@end

@implementation NSXPCConnection(SGDXPCConnectionUtilities)

- (id)sgd_clientName
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  [a1 auditToken];
  v2 = SecTaskCreateWithAuditToken(0, &token);
  if (!v2
    || (v3 = v2,
        v4 = (void *)SecTaskCopyValueForEntitlement(v2, @"application-identifier", 0),
        CFRelease(v3),
        !v4))
  {
    memset(buffer, 0, 255);
    if (proc_name([a1 processIdentifier], buffer, 0xFFu) <= 0
      || ([NSString stringWithUTF8String:buffer],
          (v4 = objc_claimAutoreleasedReturnValue()) == 0))
    {
      v4 = objc_msgSend([NSString alloc], "initWithFormat:", @"%d", objc_msgSend(a1, "processIdentifier"));
    }
  }
  return v4;
}

@end