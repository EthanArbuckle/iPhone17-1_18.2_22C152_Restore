@interface _EXDefaults
+ (id)sharedInstance;
- (BOOL)allowPrototypeAPI;
- (BOOL)allowPrototypeSPI;
- (BOOL)appleInternal;
- (BOOL)assertOnDisallowedPrototypeAPIUse;
- (BOOL)assertOnDisallowedPrototypeSPIUse;
- (BOOL)disableLaunchdCheckinTimeout;
- (BOOL)enforceLegacyExtensionPointAllowList;
- (BOOL)enforceXPCCacheCodeSigning;
- (BOOL)forceSandbox;
- (BOOL)hostRequiresEntitlements;
- (BOOL)implementsNSExtension;
- (BOOL)inProcessLaunch;
- (BOOL)platformShouldExhibitEmbeddedBehavior;
- (BOOL)preferInProcessDiscovery;
- (BOOL)queryAllowsDuplicates;
- (BOOL)queryPredicatesEvaluatedOutOfProcess;
- (BOOL)startUIHostingSessionImmediately;
- (BOOL)supportExtensionKitConfigPath;
- (BOOL)useItemProviderXPCConnection;
- (BOOL)useLSDExtensionKitServiceForDiscovery;
- (NSSet)allowedUnsandboxedExtensionPoints;
- (NSSet)alwaysEnabledExtensionBundleIdentifiers;
- (NSSet)errorTypes;
- (NSSet)extensionItemTypes;
- (NSSet)imageTypes;
- (NSSet)itemProviderTypes;
- (NSSet)plistAndValueTypes;
- (NSSet)plistTypes;
- (NSString)defaultSandboxProfileName;
- (id)_init;
@end

@implementation _EXDefaults

- (BOOL)forceSandbox
{
  return _os_feature_enabled_impl();
}

- (BOOL)disableLaunchdCheckinTimeout
{
  return _os_feature_enabled_impl();
}

- (NSString)defaultSandboxProfileName
{
  return (NSString *)@"plugin";
}

- (BOOL)platformShouldExhibitEmbeddedBehavior
{
  return 1;
}

+ (id)sharedInstance
{
  if (sharedInstance_onceToken_2 != -1) {
    dispatch_once(&sharedInstance_onceToken_2, &__block_literal_global_14);
  }
  v2 = (void *)sharedInstance_defaults;

  return v2;
}

- (BOOL)inProcessLaunch
{
  return _os_feature_enabled_impl();
}

- (NSSet)plistTypes
{
  if (plistTypes_onceToken != -1) {
    dispatch_once(&plistTypes_onceToken, &__block_literal_global_14);
  }
  v2 = (void *)plistTypes_plistTypes;

  return (NSSet *)v2;
}

- (BOOL)preferInProcessDiscovery
{
  if (preferInProcessDiscovery_onceToken != -1) {
    dispatch_once(&preferInProcessDiscovery_onceToken, &__block_literal_global_79);
  }
  return preferInProcessDiscovery_value;
}

- (BOOL)queryAllowsDuplicates
{
  return _os_feature_enabled_impl();
}

- (id)_init
{
  v3.receiver = self;
  v3.super_class = (Class)_EXDefaults;
  return [(_EXDefaults *)&v3 init];
}

- (BOOL)implementsNSExtension
{
  return 1;
}

- (BOOL)queryPredicatesEvaluatedOutOfProcess
{
  return 0;
}

- (NSSet)errorTypes
{
  if (errorTypes_onceToken != -1) {
    dispatch_once(&errorTypes_onceToken, &__block_literal_global_3);
  }
  v2 = (void *)errorTypes_errorTypes;

  return (NSSet *)v2;
}

- (NSSet)plistAndValueTypes
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __33___EXDefaults_plistAndValueTypes__block_invoke;
  block[3] = &unk_1E573CBB8;
  block[4] = self;
  if (plistAndValueTypes_onceToken != -1) {
    dispatch_once(&plistAndValueTypes_onceToken, block);
  }
  return (NSSet *)(id)plistAndValueTypes_types;
}

- (NSSet)extensionItemTypes
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __33___EXDefaults_extensionItemTypes__block_invoke;
  block[3] = &unk_1E573CBB8;
  block[4] = self;
  if (extensionItemTypes_onceToken != -1) {
    dispatch_once(&extensionItemTypes_onceToken, block);
  }
  return (NSSet *)(id)extensionItemTypes_types;
}

- (NSSet)itemProviderTypes
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __32___EXDefaults_itemProviderTypes__block_invoke;
  block[3] = &unk_1E573CBB8;
  block[4] = self;
  if (itemProviderTypes_onceToken != -1) {
    dispatch_once(&itemProviderTypes_onceToken, block);
  }
  return (NSSet *)(id)itemProviderTypes_types;
}

- (NSSet)imageTypes
{
  if (imageTypes_onceToken != -1) {
    dispatch_once(&imageTypes_onceToken, &__block_literal_global_69);
  }
  v2 = (void *)imageTypes_types;

  return (NSSet *)v2;
}

- (BOOL)appleInternal
{
  if (appleInternal_once != -1) {
    dispatch_once(&appleInternal_once, &__block_literal_global_74);
  }
  return appleInternal_appleInternal;
}

- (BOOL)useLSDExtensionKitServiceForDiscovery
{
  return _os_feature_enabled_impl();
}

- (BOOL)useItemProviderXPCConnection
{
  if (useItemProviderXPCConnection_onceToken != -1) {
    dispatch_once(&useItemProviderXPCConnection_onceToken, &__block_literal_global_84_0);
  }
  return useItemProviderXPCConnection_value;
}

- (BOOL)supportExtensionKitConfigPath
{
  return 1;
}

- (BOOL)hostRequiresEntitlements
{
  return _os_feature_enabled_impl();
}

- (BOOL)enforceLegacyExtensionPointAllowList
{
  return 1;
}

- (BOOL)allowPrototypeAPI
{
  return _os_feature_enabled_impl();
}

- (BOOL)allowPrototypeSPI
{
  return _os_feature_enabled_impl();
}

- (BOOL)assertOnDisallowedPrototypeAPIUse
{
  return _os_feature_enabled_impl();
}

- (BOOL)assertOnDisallowedPrototypeSPIUse
{
  return _os_feature_enabled_impl();
}

- (BOOL)startUIHostingSessionImmediately
{
  return 0;
}

- (NSSet)alwaysEnabledExtensionBundleIdentifiers
{
  if (alwaysEnabledExtensionBundleIdentifiers_onceToken != -1) {
    dispatch_once(&alwaysEnabledExtensionBundleIdentifiers_onceToken, &__block_literal_global_93);
  }
  v2 = (void *)alwaysEnabledExtensionBundleIdentifiers_alwaysEnabled;

  return (NSSet *)v2;
}

- (BOOL)enforceXPCCacheCodeSigning
{
  if (enforceXPCCacheCodeSigning_onceToken != -1) {
    dispatch_once(&enforceXPCCacheCodeSigning_onceToken, &__block_literal_global_110);
  }
  char v2 = _os_feature_enabled_impl();
  if (enforceXPCCacheCodeSigning_codeSigningEnforcementIsDisabled) {
    BOOL v3 = 0;
  }
  else {
    BOOL v3 = v2;
  }
  if (!v3)
  {
    v4 = _EXDefaultLog();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v6 = 0;
      _os_log_impl(&dword_191F29000, v4, OS_LOG_TYPE_DEFAULT, "XPC extension point cache code signing will not be enforced", v6, 2u);
    }
  }
  return v3;
}

- (NSSet)allowedUnsandboxedExtensionPoints
{
  if (_os_feature_enabled_impl())
  {
    if (allowedUnsandboxedExtensionPoints_onceToken != -1) {
      dispatch_once(&allowedUnsandboxedExtensionPoints_onceToken, &__block_literal_global_115);
    }
    id v2 = (id)allowedUnsandboxedExtensionPoints_allowList;
  }
  else
  {
    id v2 = (id)objc_opt_new();
  }

  return (NSSet *)v2;
}

@end