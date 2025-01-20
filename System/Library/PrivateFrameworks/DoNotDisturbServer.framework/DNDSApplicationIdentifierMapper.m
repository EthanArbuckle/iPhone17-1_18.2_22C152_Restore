@interface DNDSApplicationIdentifierMapper
- (id)_iOSBundleIDForMacOSBundleID:(id)a3;
- (id)_macOSBundleIDForiOSBundleID:(id)a3;
- (id)applicationIdentifierForFileWithSourceApplicationIdentifier:(id)a3;
- (id)applicationIdentifierForSyncWithSourceApplicationIdentifier:(id)a3;
- (id)applicationIdentifierForTargetPlatform:(unint64_t)a3 withSourceApplicationIdentifier:(id)a4;
@end

@implementation DNDSApplicationIdentifierMapper

- (id)applicationIdentifierForTargetPlatform:(unint64_t)a3 withSourceApplicationIdentifier:(id)a4
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  unint64_t v7 = [v6 platform];
  v8 = [v6 bundleID];

  id v9 = v8;
  v10 = v9;
  if (a3 == 2 && v7 == 1)
  {
    v11 = [(DNDSApplicationIdentifierMapper *)self _macOSBundleIDForiOSBundleID:v9];
    v12 = v11;
    if (v11)
    {
      id v13 = v11;

      unint64_t v7 = 2;
LABEL_17:

      goto LABEL_18;
    }
    unint64_t v7 = 1;
    goto LABEL_16;
  }
  if (a3 == 1 && v7 == 2)
  {
    v14 = [(DNDSApplicationIdentifierMapper *)self _iOSBundleIDForMacOSBundleID:v9];
    v12 = v14;
    if (v14)
    {
      id v13 = v14;

      unint64_t v7 = 1;
      goto LABEL_17;
    }
    unint64_t v7 = 2;
LABEL_16:
    id v13 = v10;
    goto LABEL_17;
  }
  if (v7 == a3)
  {
    id v13 = v9;
    unint64_t v7 = a3;
  }
  else
  {
    v15 = (void *)DNDSLogSettings;
    if (os_log_type_enabled((os_log_t)DNDSLogSettings, OS_LOG_TYPE_DEFAULT))
    {
      v16 = v15;
      v17 = NSStringFromDNDPlatform();
      v18 = NSStringFromDNDPlatform();
      int v21 = 138478339;
      v22 = v10;
      __int16 v23 = 2114;
      v24 = v17;
      __int16 v25 = 2114;
      v26 = v18;
      _os_log_impl(&dword_1D3052000, v16, OS_LOG_TYPE_DEFAULT, "Cannot map %{private}@ from %{public}@ to %{public}@ on this device", (uint8_t *)&v21, 0x20u);
    }
    id v13 = v10;
  }
LABEL_18:
  v19 = (void *)[objc_alloc(MEMORY[0x1E4F5F598]) initWithBundleID:v13 platform:v7];

  return v19;
}

- (id)applicationIdentifierForFileWithSourceApplicationIdentifier:(id)a3
{
  id v4 = a3;
  v5 = [(DNDSApplicationIdentifierMapper *)self applicationIdentifierForTargetPlatform:DNDPlatformForCurrentDevice() withSourceApplicationIdentifier:v4];

  return v5;
}

- (id)applicationIdentifierForSyncWithSourceApplicationIdentifier:(id)a3
{
  return [(DNDSApplicationIdentifierMapper *)self applicationIdentifierForTargetPlatform:1 withSourceApplicationIdentifier:a3];
}

- (id)_iOSBundleIDForMacOSBundleID:(id)a3
{
  v3 = (void *)MEMORY[0x1E4F580A0];
  id v4 = a3;
  v5 = [v3 sharedCategories];
  id v6 = [v5 bundleIDForPlatform:*MEMORY[0x1E4F58090] fromBundleID:v4 platform:*MEMORY[0x1E4F58098]];

  return v6;
}

- (id)_macOSBundleIDForiOSBundleID:(id)a3
{
  v3 = (void *)MEMORY[0x1E4F580A0];
  id v4 = a3;
  v5 = [v3 sharedCategories];
  id v6 = [v5 bundleIDForPlatform:*MEMORY[0x1E4F58098] fromBundleID:v4 platform:*MEMORY[0x1E4F58090]];

  return v6;
}

@end