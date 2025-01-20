@interface NSXPCConnection(SLClientAuthentication)
- (const)sl_clientHasEntitlement:()SLClientAuthentication;
- (id)_clientBundleID;
- (id)sl_localizedClientName;
@end

@implementation NSXPCConnection(SLClientAuthentication)

- (const)sl_clientHasEntitlement:()SLClientAuthentication
{
  id v5 = a3;
  CFBooleanRef v6 = (const __CFBoolean *)[a1 valueForEntitlement:v5];
  CFBooleanRef v7 = v6;
  if (v6)
  {
    CFTypeID v8 = CFGetTypeID(v6);
    if (v8 == CFBooleanGetTypeID()) {
      CFBooleanRef v7 = (const __CFBoolean *)(CFBooleanGetValue(v7) != 0);
    }
    else {
      CFBooleanRef v7 = 0;
    }
  }
  else
  {
    id v15 = v5;
    _SLLog(v3, 3, @"Unable to get entitlement '%@'");
  }
  v9 = objc_msgSend(a1, "sl_localizedClientName", v15);
  if (!v9)
  {
    v10 = NSString;
    size_t v16 = 648;
    dword_1EA3352A4 = [a1 processIdentifier];
    byte_1EA335A13 = 0;
    int v11 = sysctl(getprocname_name, 4u, &getprocname_kp, &v16, 0, 0);
    if (byte_1EA335A13) {
      v12 = &byte_1EA335A13;
    }
    else {
      v12 = "exited?";
    }
    if (v11) {
      v13 = "?";
    }
    else {
      v13 = v12;
    }
    v9 = [v10 stringWithCString:v13 encoding:4];
  }
  _SLLog(v3, 6, @"Entitlement %@ verified for %@: %@");

  return v7;
}

- (id)sl_localizedClientName
{
  [a1 processIdentifier];
  CFArrayRef v1 = (const __CFArray *)SBSCopyDisplayIdentifiersForProcessID();
  if (v1)
  {
    CFArrayRef v2 = v1;
    if (CFArrayGetCount(v1))
    {
      CFArrayGetValueAtIndex(v2, 0);
      uint64_t v3 = (void *)SBSCopyLocalizedApplicationNameForDisplayIdentifier();
    }
    else
    {
      uint64_t v3 = 0;
    }
    CFRelease(v2);
  }
  else
  {
    uint64_t v3 = 0;
  }

  return v3;
}

- (id)_clientBundleID
{
  [a1 processIdentifier];
  CFArrayRef v1 = (void *)SBSCopyBundleInfoValueForKeyAndProcessID();

  return v1;
}

@end