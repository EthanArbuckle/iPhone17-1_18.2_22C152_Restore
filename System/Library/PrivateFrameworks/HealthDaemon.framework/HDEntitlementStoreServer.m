@interface HDEntitlementStoreServer
+ (id)requiredEntitlements;
+ (id)taskIdentifier;
- (id)exportedInterface;
- (id)remoteInterface;
- (void)remote_fetchContainerAppExtensionEntitlementsWithCompletion:(id)a3;
@end

@implementation HDEntitlementStoreServer

- (void)remote_fetchContainerAppExtensionEntitlementsWithCompletion:(id)a3
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  v4 = (void (**)(id, id, void))a3;
  if (v4)
  {
    v5 = [(HDStandardTaskServer *)self client];
    v6 = [v5 process];

    if (v6)
    {
      int v7 = [v6 isExtension];
      id v8 = (id)MEMORY[0x1E4F1CC08];
      if (v7)
      {
        v9 = (void *)MEMORY[0x1E4F223F0];
        v10 = [(HDStandardTaskServer *)self client];
        v11 = [v10 connection];
        v12 = objc_msgSend(v9, "hk_appExtensionContainerBundleForConnection:", v11);

        if (v12)
        {
          v13 = [MEMORY[0x1E4F2B8D8] _allowedEntitlementsSet];
          v14 = [v12 entitlementValuesForKeys:v13];

          uint64_t v15 = [v14 rawValues];
          v16 = (void *)v15;
          if (v15) {
            v17 = (void *)v15;
          }
          else {
            v17 = v8;
          }
          id v8 = v17;
        }
        else
        {
          _HKInitializeLogging();
          v19 = (void *)*MEMORY[0x1E4F29F28];
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29F28], OS_LOG_TYPE_ERROR))
          {
            v20 = v19;
            v21 = [(HDStandardTaskServer *)self client];
            int v22 = 138543362;
            v23 = v21;
            _os_log_error_impl(&dword_1BCB7D000, v20, OS_LOG_TYPE_ERROR, "No container app bundle found for client %{public}@", (uint8_t *)&v22, 0xCu);
          }
          id v8 = 0;
        }
      }
      v4[2](v4, v8, 0);
    }
    else
    {
      v18 = objc_msgSend(MEMORY[0x1E4F28C58], "hk_error:description:", 100, @"No client connection");
      ((void (**)(id, id, void *))v4)[2](v4, 0, v18);
    }
  }
}

- (id)exportedInterface
{
  return (id)MEMORY[0x1F40E7CB0](self, a2);
}

- (id)remoteInterface
{
  return (id)MEMORY[0x1F40E7CA8](self, a2);
}

+ (id)taskIdentifier
{
  return (id)[MEMORY[0x1E4F2AFC0] taskIdentifier];
}

+ (id)requiredEntitlements
{
  return (id)MEMORY[0x1E4F1CBF0];
}

@end