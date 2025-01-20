@interface DNDSClientDetails
+ (id)_detailsForClientIdentifier:(id)a3 bundleInfoDictionary:(id)a4;
+ (id)detailsForBundleAtURL:(id)a3;
+ (id)detailsForClientIdentifier:(id)a3 applicationBundleURL:(id)a4;
- (BOOL)forcesAssertionStatusUpdate;
- (BOOL)isIOS14SyncSuppressedClient;
- (BOOL)isPersistentAssertionClient;
- (BOOL)isResolutionContextAssumingDeviceUILocked;
- (BOOL)isSyncSuppressedClient;
- (BOOL)isUserInteractionClient;
- (DNDSClientDetails)initWithClientIdentifier:(id)a3 identifiers:(id)a4 resolutionContextAssumingDeviceUILocked:(BOOL)a5 userInteractionClient:(BOOL)a6 persistentAssertionClient:(BOOL)a7 syncSuppressedClient:(BOOL)a8 iOS14SyncSuppressedClient:(BOOL)a9 forcesAssertionStatusUpdate:(BOOL)a10;
- (NSArray)identifiers;
- (NSString)clientIdentifier;
@end

@implementation DNDSClientDetails

+ (id)detailsForBundleAtURL:(id)a3
{
  CFDictionaryRef v4 = CFBundleCopyInfoDictionaryInDirectory((CFURLRef)a3);
  if (v4)
  {
    v5 = [a1 _detailsForClientIdentifier:0 bundleInfoDictionary:v4];
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

+ (id)detailsForClientIdentifier:(id)a3 applicationBundleURL:(id)a4
{
  id v6 = a3;
  CFDictionaryRef v7 = CFBundleCopyInfoDictionaryInDirectory((CFURLRef)a4);
  v8 = [(__CFDictionary *)v7 bs_safeDictionaryForKey:@"DNDClientDetails"];
  v9 = objc_msgSend(v8, "bs_safeDictionaryForKey:", v6);
  if (v9)
  {
    v10 = [a1 _detailsForClientIdentifier:v6 bundleInfoDictionary:v9];
  }
  else
  {
    v10 = 0;
  }

  return v10;
}

+ (id)_detailsForClientIdentifier:(id)a3 bundleInfoDictionary:(id)a4
{
  v35[1] = *MEMORY[0x1E4F143B8];
  v5 = (__CFString *)a3;
  id v6 = a4;
  CFDictionaryRef v7 = objc_msgSend(v6, "bs_safeDictionaryForKey:", @"DNDModeAssertionServiceOptions");
  v8 = v7;
  if (v5)
  {
    v9 = 0;
  }
  else
  {
    v10 = objc_msgSend(v7, "bs_safeStringForKey:", @"DNDClientIdentifier");
    v11 = v10;
    if (v10)
    {
      v5 = v10;
    }
    else
    {
      uint64_t v12 = objc_msgSend(v6, "bs_safeStringForKey:", *MEMORY[0x1E4F1CFF8]);
      v13 = (void *)v12;
      v14 = &stru_1F2A2D288;
      if (v12) {
        v14 = (__CFString *)v12;
      }
      v5 = v14;
    }
    v15 = objc_msgSend(v8, "bs_safeArrayForKey:", @"DNDClientIdentifier");
    v9 = objc_msgSend(v15, "bs_filter:", &__block_literal_global_29);
  }
  v33 = v5;
  if (![v9 count])
  {
    v35[0] = v5;
    uint64_t v16 = [MEMORY[0x1E4F1C978] arrayWithObjects:v35 count:1];

    v9 = (void *)v16;
  }
  v17 = objc_msgSend(v6, "bs_safeDictionaryForKey:", @"DNDEventBehaviorResolutionServiceOptions");
  v18 = objc_msgSend(v17, "bs_safeNumberForKey:", @"DNDEventBehaviorResolutionContextDeviceUILocked");
  unsigned int v32 = [v18 BOOLValue];

  v19 = objc_msgSend(v8, "bs_safeNumberForKey:", @"DNDUserInteractive");
  uint64_t v20 = [v19 BOOLValue];

  v21 = objc_msgSend(v8, "bs_safeNumberForKey:", @"DNDAssertionsPersist");
  uint64_t v22 = [v21 BOOLValue];

  v23 = objc_msgSend(v8, "bs_safeNumberForKey:", @"DNDSyncSuppressed");
  uint64_t v24 = [v23 BOOLValue];

  v25 = objc_msgSend(v8, "bs_safeNumberForKey:", @"DNDiOS14SyncSuppressed");
  char v26 = [v25 BOOLValue];

  v27 = objc_msgSend(v8, "bs_safeNumberForKey:", @"DNDForceAssertionStatusUpdate");
  char v28 = [v27 BOOLValue];

  BYTE1(v31) = v28;
  LOBYTE(v31) = v26;
  v29 = objc_msgSend(objc_alloc((Class)a1), "initWithClientIdentifier:identifiers:resolutionContextAssumingDeviceUILocked:userInteractionClient:persistentAssertionClient:syncSuppressedClient:iOS14SyncSuppressedClient:forcesAssertionStatusUpdate:", v33, v9, v32, v20, v22, v24, v31);

  return v29;
}

uint64_t __70__DNDSClientDetails__detailsForClientIdentifier_bundleInfoDictionary___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

- (DNDSClientDetails)initWithClientIdentifier:(id)a3 identifiers:(id)a4 resolutionContextAssumingDeviceUILocked:(BOOL)a5 userInteractionClient:(BOOL)a6 persistentAssertionClient:(BOOL)a7 syncSuppressedClient:(BOOL)a8 iOS14SyncSuppressedClient:(BOOL)a9 forcesAssertionStatusUpdate:(BOOL)a10
{
  id v16 = a3;
  id v17 = a4;
  v24.receiver = self;
  v24.super_class = (Class)DNDSClientDetails;
  v18 = [(DNDSClientDetails *)&v24 init];
  if (v18)
  {
    uint64_t v19 = [v16 copy];
    clientIdentifier = v18->_clientIdentifier;
    v18->_clientIdentifier = (NSString *)v19;

    uint64_t v21 = [v17 copy];
    identifiers = v18->_identifiers;
    v18->_identifiers = (NSArray *)v21;

    v18->_resolutionContextAssumingDeviceUILocked = a5;
    v18->_userInteractionClient = a6;
    v18->_persistentAssertionClient = a7;
    v18->_syncSuppressedClient = a8;
    v18->_iOS14SyncSuppressedClient = a9;
    v18->_forcesAssertionStatusUpdate = a10;
  }

  return v18;
}

- (NSString)clientIdentifier
{
  return self->_clientIdentifier;
}

- (NSArray)identifiers
{
  return self->_identifiers;
}

- (BOOL)isResolutionContextAssumingDeviceUILocked
{
  return self->_resolutionContextAssumingDeviceUILocked;
}

- (BOOL)isUserInteractionClient
{
  return self->_userInteractionClient;
}

- (BOOL)isPersistentAssertionClient
{
  return self->_persistentAssertionClient;
}

- (BOOL)isSyncSuppressedClient
{
  return self->_syncSuppressedClient;
}

- (BOOL)isIOS14SyncSuppressedClient
{
  return self->_iOS14SyncSuppressedClient;
}

- (BOOL)forcesAssertionStatusUpdate
{
  return self->_forcesAssertionStatusUpdate;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_identifiers, 0);
  objc_storeStrong((id *)&self->_clientIdentifier, 0);
}

@end