@interface _LSDDeviceIdentifierService
+ (Class)clientClass;
+ (id)XPCInterface;
+ (id)vendorNameForDeviceIdentifiersWithContext:(LSContext *)a3 bundleUnit:(unsigned int)a4 bundleData:(const LSBundleData *)a5;
+ (unsigned)connectionType;
+ (void)clearIdentifiersForUninstallationWithContext:(LSContext *)a3 bundleUnit:(unsigned int)a4 bundleData:(const LSBundleData *)a5;
+ (void)generateIdentifiersForInstallationWithContext:(LSContext *)a3 bundleUnit:(unsigned int)a4 bundleData:(const LSBundleData *)a5;
@end

@implementation _LSDDeviceIdentifierService

+ (id)vendorNameForDeviceIdentifiersWithContext:(LSContext *)a3 bundleUnit:(unsigned int)a4 bundleData:(const LSBundleData *)a5
{
  v5 = 0;
  if (a3 && a4 && a5)
  {
    v5 = (__CFString *)_CSStringCopyCFString();
    if (v5) {
      goto LABEL_5;
    }
    v8 = (void *)_CSStringCopyCFString();
    if (!v8)
    {
      v5 = 0;
      goto LABEL_16;
    }
    id v9 = v8;
    if ([v9 hasPrefix:@"com.apple."])
    {
      v5 = @"Apple Inc.";
    }
    else
    {
      v10 = [v9 componentsSeparatedByString:@"."];
      v11 = (void *)[v10 mutableCopy];

      if ((unint64_t)[v11 count] >= 2)
      {
        [v11 removeLastObject];
        v12 = NSString;
        v13 = [v11 componentsJoinedByString:@"."];
        v5 = [v12 stringWithFormat:@"BundleID:%@", v13];
      }
      else
      {
        v5 = [NSString stringWithFormat:@"BundleID:%@", v9];
      }
    }
    if (v5)
    {
LABEL_5:
      if ((*((unsigned char *)&a5->_clas + 6) & 0x20) != 0)
      {
        uint64_t v7 = [NSString stringWithFormat:@"Beta:%@", v5];

        v5 = (__CFString *)v7;
      }
    }
  }
LABEL_16:

  return v5;
}

+ (unsigned)connectionType
{
  return 7;
}

+ (void)clearIdentifiersForUninstallationWithContext:(LSContext *)a3 bundleUnit:(unsigned int)a4 bundleData:(const LSBundleData *)a5
{
  if (a3 && a4 && a5)
  {
    objc_msgSend(a1, "vendorNameForDeviceIdentifiersWithContext:bundleUnit:bundleData:");
    id v8 = (id)objc_claimAutoreleasedReturnValue();
    v6 = (void *)_CSStringCopyCFString();
    uint64_t v7 = +[_LSDService XPCProxyWithErrorHandler:]((uint64_t)a1, 0);
    [v7 clearIdentifiersForUninstallationWithVendorName:v8 bundleIdentifier:v6];
  }
}

+ (void)generateIdentifiersForInstallationWithContext:(LSContext *)a3 bundleUnit:(unsigned int)a4 bundleData:(const LSBundleData *)a5
{
  uint64_t v6 = *(void *)&a4;
  id v9 = +[_LSDService XPCProxyWithErrorHandler:]((uint64_t)a1, 0);
  memset(&v16, 0, sizeof(v16));
  v10 = +[_LSDServiceDomain defaultServiceDomain]();
  v11 = _LSDServiceGetXPCConnection(a1, (uint64_t)v10);
  v12 = v11;
  if (v11) {
    [v11 auditToken];
  }
  else {
    memset(&v16, 0, sizeof(v16));
  }

  if (a3)
  {
    if (v6)
    {
      if (a5)
      {
        audit_token_t v15 = v16;
        if ((a5->_bundleFlags & 0x18000000) == 0 || softLinkba_is_process_extension(&v15))
        {
          v13 = objc_msgSend(a1, "vendorNameForDeviceIdentifiersWithContext:bundleUnit:bundleData:", a3, v6, a5, *(_OWORD *)v15.val, *(_OWORD *)&v15.val[4]);
          v14 = (void *)_CSStringCopyCFString();
          [v9 generateIdentifiersWithVendorName:v13 bundleIdentifier:v14];
        }
      }
    }
  }
}

+ (Class)clientClass
{
  return (Class)objc_opt_class();
}

+ (id)XPCInterface
{
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __43___LSDDeviceIdentifierService_XPCInterface__block_invoke;
  v4[3] = &__block_descriptor_48_e5_v8__0l;
  v4[4] = a2;
  v4[5] = a1;
  if (+[_LSDDeviceIdentifierService XPCInterface]::once != -1) {
    dispatch_once(&+[_LSDDeviceIdentifierService XPCInterface]::once, v4);
  }
  v2 = (void *)+[_LSDDeviceIdentifierService XPCInterface]::result;

  return v2;
}

@end