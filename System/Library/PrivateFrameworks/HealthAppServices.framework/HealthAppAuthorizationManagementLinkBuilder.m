@interface HealthAppAuthorizationManagementLinkBuilder
+ (BOOL)canOpenAuthorizationManagementWithValidIdentifier:(id)a3;
+ (BOOL)canOpenLinkWithSourceIdentifier:(id)a3 destinationIdentifier:(id)a4;
- (id)URLForAuthorizationManagementFromLocation:(int64_t)a3;
- (id)_URLForAuthorizationManagementFromLocation:(int64_t)a3 bundleIdentifier:(id)a4;
- (id)_URLForAuthorizationManagementLocationHealthProfileWithBundleIdentifier:(id)a3;
- (id)_URLForAuthorizationManagementLocationHealthSharingWithBundleIdentifier:(id)a3;
- (id)_URLForAuthorizationManagementLocationSettingsWithBundleIdentifier:(id)a3;
- (id)appendBundleIdentifierIfNecessary:(id)a3;
- (id)appendBundleIdentifierIfNecessary:(id)a3 toPath:(id)a4;
@end

@implementation HealthAppAuthorizationManagementLinkBuilder

+ (BOOL)canOpenLinkWithSourceIdentifier:(id)a3 destinationIdentifier:(id)a4
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  v6 = (__CFString *)a3;
  v7 = (__CFString *)a4;
  id v8 = objc_alloc(MEMORY[0x1E4F1CB18]);
  v9 = (void *)[v8 initWithSuiteName:*MEMORY[0x1E4F2BD98]];
  uint64_t v10 = [v9 stringForKey:@"SourceApplicationBundleIdentifierOverride"];
  v11 = (void *)v10;
  if (v6) {
    v12 = v6;
  }
  else {
    v12 = v7;
  }
  if (v10) {
    v12 = (void *)v10;
  }
  v13 = v12;
  unsigned int v14 = [a1 canOpenAuthorizationManagementWithValidIdentifier:v13];
  _HKInitializeLogging();
  v15 = (void *)*MEMORY[0x1E4F29F28];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29F28], OS_LOG_TYPE_DEFAULT))
  {
    v16 = v15;
    v17 = objc_opt_class();
    v18 = @"nil";
    int v23 = 138544386;
    v24 = v17;
    if (v7) {
      v19 = v7;
    }
    else {
      v19 = @"nil";
    }
    __int16 v25 = 2048;
    uint64_t v26 = v14;
    if (v6) {
      v20 = v6;
    }
    else {
      v20 = @"nil";
    }
    __int16 v27 = 2112;
    v28 = v19;
    if (v13) {
      v18 = v13;
    }
    __int16 v29 = 2112;
    v30 = v20;
    __int16 v31 = 2112;
    v32 = v18;
    id v21 = v17;
    _os_log_impl(&dword_1E0118000, v16, OS_LOG_TYPE_DEFAULT, "%{public}@ [Authorization] Can Open Link: %ld Destination: %@ Source: %@ Derived: %@", (uint8_t *)&v23, 0x34u);
  }
  return v14;
}

+ (BOOL)canOpenAuthorizationManagementWithValidIdentifier:(id)a3
{
  v10[4] = *MEMORY[0x1E4F143B8];
  if (!a3) {
    return 0;
  }
  v3 = (objc_class *)MEMORY[0x1E4F1CA48];
  id v4 = a3;
  id v5 = [v3 alloc];
  v10[0] = @"com.apple.installcoordinationd";
  v10[1] = @"com.hip.PistoPilot";
  v10[2] = *MEMORY[0x1E4F2BF50];
  v10[3] = @"com.apple.journal";
  v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:v10 count:4];
  v7 = (void *)[v5 initWithArray:v6];

  char v8 = [v7 containsObject:v4];
  return v8;
}

- (id)URLForAuthorizationManagementFromLocation:(int64_t)a3
{
  return [(HealthAppAuthorizationManagementLinkBuilder *)self _URLForAuthorizationManagementFromLocation:a3 bundleIdentifier:0];
}

- (id)_URLForAuthorizationManagementFromLocation:(int64_t)a3 bundleIdentifier:(id)a4
{
  id v7 = a4;
  if (a3)
  {
    if (a3 == 1)
    {
      uint64_t v8 = [(HealthAppAuthorizationManagementLinkBuilder *)self _URLForAuthorizationManagementLocationHealthSharingWithBundleIdentifier:v7];
    }
    else
    {
      if (a3 != 2) {
        goto LABEL_8;
      }
      uint64_t v8 = [(HealthAppAuthorizationManagementLinkBuilder *)self _URLForAuthorizationManagementLocationSettingsWithBundleIdentifier:v7];
    }
  }
  else
  {
    uint64_t v8 = [(HealthAppAuthorizationManagementLinkBuilder *)self _URLForAuthorizationManagementLocationHealthProfileWithBundleIdentifier:v7];
  }
  id v4 = (void *)v8;
LABEL_8:

  return v4;
}

- (id)_URLForAuthorizationManagementLocationSettingsWithBundleIdentifier:(id)a3
{
  id v4 = (objc_class *)MEMORY[0x1E4F29088];
  id v5 = a3;
  id v6 = objc_alloc_init(v4);
  id v7 = [MEMORY[0x1E4F2B860] sharedBehavior];
  int v8 = [v7 isAppleWatch];

  if (v8)
  {
    v9 = +[HAServicesDefines nanoInternalSettingsAppURLScheme];
    [v6 setScheme:v9];

    uint64_t v10 = +[HAServicesDefines nanoHealthSettingsBundleIdentifier];
    [v6 setHost:v10];

    v11 = NSString;
    v12 = +[HAServicesDefines authorizationManagementHostName];
    v13 = [v11 stringWithFormat:@"/%@", v12];

    unsigned int v14 = [(HealthAppAuthorizationManagementLinkBuilder *)self appendBundleIdentifierIfNecessary:v5 toPath:v13];

    [v6 setPath:v14];
  }
  else
  {
    v15 = +[HAServicesDefines internalSettingsAppURLScheme];
    [v6 setScheme:v15];

    v16 = NSString;
    v17 = +[HAServicesDefines healthSettingsSourcesHostName];
    v18 = [v16 stringWithFormat:@"%@&path=%@", @"root=HEALTH", v17];
    [v6 setHost:v18];

    v13 = [(HealthAppAuthorizationManagementLinkBuilder *)self appendBundleIdentifierIfNecessary:v5];

    [v6 setPath:v13];
  }

  v19 = [v6 URL];

  return v19;
}

- (id)_URLForAuthorizationManagementLocationHealthProfileWithBundleIdentifier:(id)a3
{
  id v4 = (objc_class *)MEMORY[0x1E4F29088];
  id v5 = a3;
  id v6 = objc_alloc_init(v4);
  id v7 = +[HAServicesDefines internalHealthAppURLScheme];
  [v6 setScheme:v7];

  int v8 = +[HAServicesDefines authorizationManagementHostName];
  [v6 setHost:v8];

  v9 = [(HealthAppAuthorizationManagementLinkBuilder *)self appendBundleIdentifierIfNecessary:v5];

  [v6 setPath:v9];
  uint64_t v10 = [v6 URL];

  return v10;
}

- (id)_URLForAuthorizationManagementLocationHealthSharingWithBundleIdentifier:(id)a3
{
  id v4 = (objc_class *)MEMORY[0x1E4F29088];
  id v5 = a3;
  id v6 = objc_alloc_init(v4);
  id v7 = +[HAServicesDefines internalHealthAppURLScheme];
  [v6 setScheme:v7];

  int v8 = +[HAServicesDefines sharingOverviewHostName];
  [v6 setHost:v8];

  v9 = NSString;
  uint64_t v10 = +[HAServicesDefines authorizationManagementHostName];
  v11 = [v9 stringWithFormat:@"/%@", v10];

  v12 = [(HealthAppAuthorizationManagementLinkBuilder *)self appendBundleIdentifierIfNecessary:v5 toPath:v11];

  [v6 setPath:v12];
  v13 = [v6 URL];

  return v13;
}

- (id)appendBundleIdentifierIfNecessary:(id)a3
{
  return [(HealthAppAuthorizationManagementLinkBuilder *)self appendBundleIdentifierIfNecessary:a3 toPath:&stru_1F3B565B8];
}

- (id)appendBundleIdentifierIfNecessary:(id)a3 toPath:(id)a4
{
  v12[2] = *MEMORY[0x1E4F143B8];
  id v5 = a4;
  id v6 = v5;
  if (a3)
  {
    v12[0] = @"/";
    v12[1] = a3;
    id v7 = (void *)MEMORY[0x1E4F1C978];
    id v8 = a3;
    v9 = [v7 arrayWithObjects:v12 count:2];

    uint64_t v10 = [v9 componentsJoinedByString:&stru_1F3B565B8];
    id v6 = [v5 stringByAppendingString:v10];
  }
  return v6;
}

@end