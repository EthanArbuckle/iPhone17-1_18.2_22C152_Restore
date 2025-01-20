@interface CKSettingsiMessageApp
- (BOOL)isDeletable;
- (BOOL)isHiddenInSendMenuByUserPreference;
- (BOOL)isiMessageAppOnly;
- (CKSettingsiMessageApp)initWithExtension:(id)a3;
- (NSString)appBundleID;
- (NSString)appDisplayName;
- (NSString)extensionBundleID;
- (NSString)extensionDisplayName;
- (id)_hiddenExtensionBundleIdentifiers;
- (id)_stringArrayFromUserDefaults:(id)a3 key:(id)a4;
- (void)_setHiddenExtensionBundleIdentifiers:(id)a3;
- (void)setHiddenInSendMenuByUserPreference:(BOOL)a3;
@end

@implementation CKSettingsiMessageApp

- (CKSettingsiMessageApp)initWithExtension:(id)a3
{
  id v4 = a3;
  v26.receiver = self;
  v26.super_class = (Class)CKSettingsiMessageApp;
  v5 = [(CKSettingsiMessageApp *)&v26 init];
  if (!v5) {
    goto LABEL_19;
  }
  v6 = [v4 identifier];
  id v25 = 0;
  v7 = (void *)[objc_alloc(MEMORY[0x263F01858]) initWithBundleIdentifier:v6 error:&v25];
  id v8 = v25;
  if (v8)
  {
    int v9 = 1;
  }
  else
  {
    v10 = [v7 containingBundleRecord];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v11 = v10;
      v5->_isiMessageAppOnly = [v11 isLaunchProhibited];
      objc_storeStrong((id *)&v5->_extensionBundleID, v6);
      uint64_t v12 = [v11 bundleIdentifier];
      appBundleID = v5->_appBundleID;
      v5->_appBundleID = (NSString *)v12;

      v14 = [v7 localizedName];
      v15 = v14;
      if (v14)
      {
        v16 = v14;
      }
      else
      {
        v16 = [v7 localizedShortName];
      }
      extensionDisplayName = v5->_extensionDisplayName;
      v5->_extensionDisplayName = v16;

      v18 = [v11 localizedName];
      v19 = v18;
      if (v18)
      {
        v20 = v18;
      }
      else
      {
        v20 = [v11 localizedShortName];
      }
      appDisplayName = v5->_appDisplayName;
      v5->_appDisplayName = v20;

      char v22 = ([v11 isDeletable] & 1) != 0 ? 1 : objc_msgSend(v11, "isDeletableSystemApplication");
      v5->_deletable = v22;

      int v9 = 0;
    }
    else
    {
      int v9 = 1;
    }
  }
  if (v9) {
    v23 = 0;
  }
  else {
LABEL_19:
  }
    v23 = v5;

  return v23;
}

- (id)_hiddenExtensionBundleIdentifiers
{
  v3 = (void *)[objc_alloc(MEMORY[0x263EFFA40]) initWithSuiteName:@"com.apple.MobileSMS"];
  id v4 = [(CKSettingsiMessageApp *)self _stringArrayFromUserDefaults:v3 key:@"SendMenuHiddenExtensionBundleIdentifiers"];

  return v4;
}

- (void)_setHiddenExtensionBundleIdentifiers:(id)a3
{
  v3 = (objc_class *)MEMORY[0x263EFFA40];
  id v4 = a3;
  id v5 = (id)[[v3 alloc] initWithSuiteName:@"com.apple.MobileSMS"];
  [v5 setObject:v4 forKey:@"SendMenuHiddenExtensionBundleIdentifiers"];
}

- (id)_stringArrayFromUserDefaults:(id)a3 key:(id)a4
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v4 = [a3 objectForKey:a4];
  if (v4 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    id v5 = objc_alloc_init(MEMORY[0x263EFF980]);
    id v6 = v4;
    long long v14 = 0u;
    long long v15 = 0u;
    long long v16 = 0u;
    long long v17 = 0u;
    uint64_t v7 = [v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
    if (v7)
    {
      uint64_t v8 = v7;
      uint64_t v9 = *(void *)v15;
      do
      {
        for (uint64_t i = 0; i != v8; ++i)
        {
          if (*(void *)v15 != v9) {
            objc_enumerationMutation(v6);
          }
          uint64_t v11 = *(void *)(*((void *)&v14 + 1) + 8 * i);
          objc_opt_class();
          if (objc_opt_isKindOfClass()) {
            [v5 addObject:v11];
          }
        }
        uint64_t v8 = [v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
      }
      while (v8);
    }
    uint64_t v12 = (void *)[v5 copy];
  }
  else
  {
    uint64_t v12 = (void *)MEMORY[0x263EFFA68];
  }

  return v12;
}

- (BOOL)isHiddenInSendMenuByUserPreference
{
  if (self->_isiMessageAppOnly) {
    return 0;
  }
  v3 = self;
  id v4 = [(CKSettingsiMessageApp *)self _hiddenExtensionBundleIdentifiers];
  LOBYTE(v3) = [v4 containsObject:v3->_extensionBundleID];

  return (char)v3;
}

- (void)setHiddenInSendMenuByUserPreference:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v15 = *MEMORY[0x263EF8340];
  id v5 = self->_extensionBundleID;
  id v6 = csui_log();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    int v11 = 138412546;
    uint64_t v12 = v5;
    __int16 v13 = 1024;
    BOOL v14 = v3;
    _os_log_impl(&dword_21ED18000, v6, OS_LOG_TYPE_INFO, "Setting extension %@ to hidden=%{BOOL}d", (uint8_t *)&v11, 0x12u);
  }

  uint64_t v7 = [(CKSettingsiMessageApp *)self _hiddenExtensionBundleIdentifiers];
  int v8 = [v7 containsObject:v5];
  if (!v3 || (v8 & 1) != 0)
  {
    if (v3 || ((v8 ^ 1) & 1) != 0)
    {
      uint64_t v9 = csui_log();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
        [(CKSettingsiMessageApp *)(uint64_t)v5 setHiddenInSendMenuByUserPreference:v9];
      }
    }
    else
    {
      uint64_t v9 = [v7 mutableCopy];
      [v9 removeObject:v5];
      id v10 = [v9 copy];
      [(CKSettingsiMessageApp *)self _setHiddenExtensionBundleIdentifiers:v10];
    }
  }
  else
  {
    uint64_t v9 = [v7 arrayByAddingObject:v5];
    [(CKSettingsiMessageApp *)self _setHiddenExtensionBundleIdentifiers:v9];
  }
}

- (NSString)extensionBundleID
{
  return self->_extensionBundleID;
}

- (NSString)appBundleID
{
  return self->_appBundleID;
}

- (NSString)extensionDisplayName
{
  return self->_extensionDisplayName;
}

- (NSString)appDisplayName
{
  return self->_appDisplayName;
}

- (BOOL)isiMessageAppOnly
{
  return self->_isiMessageAppOnly;
}

- (BOOL)isDeletable
{
  return self->_deletable;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_appDisplayName, 0);
  objc_storeStrong((id *)&self->_extensionDisplayName, 0);
  objc_storeStrong((id *)&self->_appBundleID, 0);
  objc_storeStrong((id *)&self->_extensionBundleID, 0);
}

- (void)setHiddenInSendMenuByUserPreference:(os_log_t)log .cold.1(uint64_t a1, char a2, os_log_t log)
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  int v3 = 138412546;
  uint64_t v4 = a1;
  __int16 v5 = 1024;
  int v6 = a2 & 1;
  _os_log_error_impl(&dword_21ED18000, log, OS_LOG_TYPE_ERROR, "Extension %@ was already hidden=%{BOOL}d", (uint8_t *)&v3, 0x12u);
}

@end