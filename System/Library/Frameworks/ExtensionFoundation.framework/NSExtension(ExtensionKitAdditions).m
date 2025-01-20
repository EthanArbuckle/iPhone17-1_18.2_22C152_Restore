@interface NSExtension(ExtensionKitAdditions)
+ (_EXRunningExtensionInfo)extensionInfoForCurrentProcess;
+ (id)extensionRepresentedBy:()ExtensionKitAdditions error:;
+ (uint64_t)extensionWithIdentity:()ExtensionKitAdditions error:;
- (BOOL)requiresMacCatalystBehavior;
- (_EXExtensionIdentity)extensionIdentityWithError:()ExtensionKitAdditions;
- (id)URL;
- (id)containingBundleIdentifier;
- (id)extensionRecord;
- (id)preferredLanguages;
- (id)uuid;
- (uint64_t)_personas;
- (void)setPreferredLanguages:()ExtensionKitAdditions;
@end

@implementation NSExtension(ExtensionKitAdditions)

+ (_EXRunningExtensionInfo)extensionInfoForCurrentProcess
{
  return +[_EXRunningExtensionInfo extensionInfoForCurrentProcess];
}

+ (id)extensionRepresentedBy:()ExtensionKitAdditions error:
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v17 = _EXDefaultLog();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_FAULT)) {
      +[NSExtension(ExtensionKitAdditions) extensionRepresentedBy:error:]((uint64_t)v5, v17);
    }

    __break(1u);
  }
  id v6 = v5;
  v7 = [v6 UUID];

  if (v7)
  {
    v8 = [MEMORY[0x1E4F91488] defaultHost];
    v9 = [v6 UUID];
    v10 = [v8 findPlugInByUUID:v9 withError:a4];

    if (v10)
    {
      id v11 = [[EXConcreteExtension alloc] _initWithPKPlugin:v10];
    }
    else
    {
      v13 = _EXLegacyLog();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        v14 = [v6 UUID];
        v15 = [v14 UUIDString];
        int v18 = 138412290;
        v19 = v15;
        _os_log_impl(&dword_191F29000, v13, OS_LOG_TYPE_DEFAULT, "Couldn't find pkplugin with uuid: %@", (uint8_t *)&v18, 0xCu);
      }
      id v11 = 0;
    }
  }
  else
  {
    v12 = _EXLegacyLog();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
      +[NSExtension(ExtensionKitAdditions) extensionRepresentedBy:error:]((uint64_t)v6, v12);
    }

    if (a4)
    {
      [MEMORY[0x1E4F28C58] errorWithDomain:@"com.apple.extensionKit.errorDomain" code:5 userInfo:MEMORY[0x1E4F1CC08]];
      id v11 = 0;
      *a4 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      id v11 = 0;
    }
  }

  return v11;
}

+ (uint64_t)extensionWithIdentity:()ExtensionKitAdditions error:
{
  return objc_msgSend(MEMORY[0x1E4F28C70], "extensionRepresentedBy:error:");
}

- (_EXExtensionIdentity)extensionIdentityWithError:()ExtensionKitAdditions
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v5 = objc_alloc(MEMORY[0x1E4F223A0]);
  id v6 = [a1 uuid];
  v7 = (void *)[v5 initWithUUID:v6 error:a3];

  if (v7)
  {
    v8 = [[_EXExtensionIdentity alloc] initWithApplicationExtensionRecord:v7];
  }
  else
  {
    v9 = _EXDefaultLog();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      v10 = [a1 uuid];
      int v12 = 138412546;
      v13 = a1;
      __int16 v14 = 2112;
      v15 = v10;
    }
    v8 = 0;
  }

  return v8;
}

- (id)preferredLanguages
{
  v1 = [a1 _plugIn];
  v2 = [v1 preferredLanguages];

  return v2;
}

- (void)setPreferredLanguages:()ExtensionKitAdditions
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [a1 _plugIn];
  id v6 = _EXLegacyLog();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v7 = [v5 uuid];
    int v8 = 138543618;
    v9 = v7;
    __int16 v10 = 2114;
    id v11 = v4;
    _os_log_impl(&dword_191F29000, v6, OS_LOG_TYPE_DEFAULT, "Setting preferred languages on %{public}@: %{public}@", (uint8_t *)&v8, 0x16u);
  }
  [v5 setPreferredLanguages:v4];
}

- (BOOL)requiresMacCatalystBehavior
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  v1 = [a1 _plugIn];
  v2 = [v1 uuid];

  id v8 = 0;
  v3 = (void *)[objc_alloc(MEMORY[0x1E4F223A0]) initWithUUID:v2 error:&v8];
  id v4 = v8;
  if (v3)
  {
    id v5 = [v3 extensionPointRecord];
    BOOL v6 = [v5 platform] == 6;
  }
  else
  {
    id v5 = _EXLegacyLog();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543618;
      uint64_t v10 = 0;
      __int16 v11 = 2114;
      id v12 = v4;
      _os_log_impl(&dword_191F29000, v5, OS_LOG_TYPE_DEFAULT, "Extension point not found for: %{public}@ with error: %{public}@", buf, 0x16u);
    }
    BOOL v6 = 0;
  }

  return v6;
}

- (id)containingBundleIdentifier
{
  id v2 = objc_alloc(MEMORY[0x1E4F223A0]);
  v3 = [a1 identifier];
  id v4 = (void *)[v2 initWithBundleIdentifier:v3 error:0];

  if (v4)
  {
    id v5 = [v4 containingBundleRecord];
    BOOL v6 = [v5 bundleIdentifier];
  }
  else
  {
    BOOL v6 = 0;
  }

  return v6;
}

- (uint64_t)_personas
{
  return MEMORY[0x1E4F1CBF0];
}

- (id)uuid
{
  v1 = [a1 _plugIn];
  id v2 = [v1 uuid];

  return v2;
}

- (id)URL
{
  v1 = [a1 _plugIn];
  id v2 = [v1 url];

  return v2;
}

- (id)extensionRecord
{
  id v2 = objc_alloc(MEMORY[0x1E4F223A0]);
  v3 = [a1 uuid];
  id v4 = (void *)[v2 initWithUUID:v3 error:0];

  return v4;
}

+ (void)extensionRepresentedBy:()ExtensionKitAdditions error:.cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138543362;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_191F29000, a2, OS_LOG_TYPE_ERROR, "UUID not found for extension representation: %{public}@", (uint8_t *)&v2, 0xCu);
}

+ (void)extensionRepresentedBy:()ExtensionKitAdditions error:.cold.2(uint64_t a1, NSObject *a2)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  int v3 = 136315906;
  uint64_t v4 = "[extensionRep isKindOfClass:_EXExtensionIdentity.class]";
  __int16 v5 = 2080;
  BOOL v6 = "/Library/Caches/com.apple.xbs/Sources/ExtensionFoundation/ExtensionFoundation/Source/NSExtension/NSExtensionSuppo"
       "rt/NSExtension+ExtensionKitAdditions.m";
  __int16 v7 = 1024;
  int v8 = 29;
  __int16 v9 = 2112;
  uint64_t v10 = objc_opt_class();
}

@end