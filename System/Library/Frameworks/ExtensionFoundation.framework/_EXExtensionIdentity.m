@interface _EXExtensionIdentity
+ (BOOL)disableExtension:(id)a3 error:(id *)a4;
+ (BOOL)enableExtension:(id)a3 error:(id *)a4;
+ (BOOL)supportsSecureCoding;
+ (_EXExtensionIdentity)allocWithZone:(_NSZone *)a3;
- (BOOL)canDisable;
- (BOOL)disableLaunchdCheckinTimeout;
- (BOOL)enabled;
- (BOOL)hasSandboxEntitlement;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToExtension:(id)a3;
- (BOOL)isSystemComponent;
- (BOOL)launchesViaExtensionKitService;
- (BOOL)performsUserInteractiveWork;
- (BOOL)presentsUserInterface;
- (BOOL)requiresFBSceneHosting;
- (BOOL)requiresHostToBeContainerApp;
- (BOOL)requiresLegacyInfrastructure;
- (BOOL)requiresLibXPCConnection;
- (BOOL)requiresMultiInstance;
- (BOOL)requiresNetworkAttribution;
- (BOOL)requiresUIKitSceneHosting;
- (BOOL)showsInExtensionsManager;
- (BOOL)spotlightIndexable;
- (BOOL)supportsNSExtensionPlistKeys;
- (BOOL)targetsSystemExtensionPoint;
- (BOOL)unelected;
- (Class)connectionHandlerClass;
- (Class)extensionClass;
- (Class)extensionContextClass;
- (Class)hostContextClass;
- (Class)principalClass;
- (ISIcon)icon;
- (NSArray)alternateSandboxProfileNames;
- (NSArray)roles;
- (NSArray)spotlightImporterIdentifiers;
- (NSDictionary)nsExtensionAttributes;
- (NSDictionary)requiredHostEntitlements;
- (NSString)description;
- (NSString)developerName;
- (NSString)internalServiceName;
- (NSString)sandboxProfileName;
- (NSURL)executableURL;
- (_EXExtensionIdentity)initWithApplicationExtensionRecord:(id)a3;
- (_EXExtensionIdentity)initWithCoder:(id)a3;
- (_EXExtensionIdentity)initWithPlugInKitProxy:(id)a3;
- (_EXExtensionIdentity)initWithServiceIdentifier:(id)a3 error:(id *)a4;
- (id)_executableURLWithError:(id *)a3;
- (id)_init;
- (id)entitlementNamed:(id)a3 ofClass:(Class)a4;
- (id)makeXPCConnectionWithError:(id *)a3;
- (id)xpcOverlayDictionaryOverridingSandboxProfileName:(id)a3 multiInstance:(BOOL)a4 arguments:(id)a5 additionalEnvironment:(id)a6;
- (int64_t)lauchThrottlePolicy;
- (unint64_t)enablementState;
- (unint64_t)hash;
- (unint64_t)type;
- (void)encodeWithCoder:(id)a3;
- (void)extensionContextClass;
@end

@implementation _EXExtensionIdentity

- (void).cxx_destruct
{
}

- (BOOL)targetsSystemExtensionPoint
{
  v2 = [(_EXExtensionIdentity *)self extensionPointIdentifier];
  char v3 = [v2 hasPrefix:@"com.apple."];

  return v3;
}

- (BOOL)requiresHostToBeContainerApp
{
  char v3 = [(_EXExtensionIdentity *)self applicationExtensionRecord];
  v4 = [v3 extensionPointRecord];
  v5 = [v4 SDKDictionary];
  v6 = objc_msgSend(v5, "_EX_dictionaryForKey:", @"_EXHostRequirements");

  if (objc_msgSend(v6, "_EX_BOOLForKey:defaultValue:", @"_EXHostableByContainerAppOnly", 0))
  {
    char v7 = 1;
  }
  else
  {
    v8 = [(_EXExtensionIdentity *)self attributes];
    v9 = objc_msgSend(v8, "_EX_dictionaryForKey:", @"_EXHostRequirements");

    char v7 = objc_msgSend(v9, "_EX_BOOLForKey:defaultValue:", @"_EXHostableByContainerAppOnly", 0);
  }

  return v7;
}

- (_EXExtensionIdentity)initWithApplicationExtensionRecord:(id)a3
{
  id v4 = a3;
  v5 = [[_EXExtensionRecordIdentity alloc] initWithApplicationExtensionRecord:v4];

  return &v5->super;
}

+ (_EXExtensionIdentity)allocWithZone:(_NSZone *)a3
{
  if ((id)objc_opt_class() == a1)
  {
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __38___EXExtensionIdentity_allocWithZone___block_invoke;
    block[3] = &__block_descriptor_48_e5_v8__0l;
    block[4] = a3;
    block[5] = a1;
    if (allocWithZone__onceToken != -1) {
      dispatch_once(&allocWithZone__onceToken, block);
    }
    v6 = (void *)allocWithZone__factory;
    return (_EXExtensionIdentity *)v6;
  }
  else
  {
    v7.receiver = a1;
    v7.super_class = (Class)&OBJC_METACLASS____EXExtensionIdentity;
    return (_EXExtensionIdentity *)objc_msgSendSuper2(&v7, sel_allocWithZone_, a3);
  }
}

- (id)_init
{
  v3.receiver = self;
  v3.super_class = (Class)_EXExtensionIdentity;
  return [(_EXExtensionIdentity *)&v3 init];
}

- (BOOL)presentsUserInterface
{
  v2 = [(_EXExtensionIdentity *)self extensionPointConfiguration];
  char v3 = objc_msgSend(v2, "_EX_BOOLForKey:", @"EXPresentsUserInterface");

  return v3;
}

- (BOOL)requiresLibXPCConnection
{
  v2 = [(_EXExtensionIdentity *)self extensionPointConfiguration];
  char v3 = objc_msgSend(v2, "_EX_BOOLForKey:", @"EXRequiresLibXPCConnection");

  return v3;
}

- (id)xpcOverlayDictionaryOverridingSandboxProfileName:(id)a3 multiInstance:(BOOL)a4 arguments:(id)a5 additionalEnvironment:(id)a6
{
  BOOL v64 = a4;
  v93[1] = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  id v10 = a5;
  id v11 = a6;
  v12 = [(_EXExtensionIdentity *)self sdkDictionary];
  v13 = (void *)MEMORY[0x1E4F1CA60];
  v14 = [v12 objectForKeyedSubscript:@"XPCService"];
  v15 = [v13 dictionaryWithDictionary:v14];

  unint64_t v16 = [(_EXExtensionIdentity *)self type];
  v66 = v11;
  v67 = v9;
  v63 = v10;
  if ([(_EXExtensionIdentity *)self launchesViaExtensionKitService])
  {
    v17 = (void *)MEMORY[0x1E4F1CC08];
  }
  else
  {
    v92 = @"LaunchRequestEndpointIdentifiers";
    v90[0] = @"com.apple.frontboard.workspace-service";
    v58 = [(_EXExtensionIdentity *)self configuration];
    v18 = [v58 serviceName];
    v91[0] = v18;
    v19 = [(_EXExtensionIdentity *)self configuration];
    [v19 serviceName];
    v20 = v60 = v15;
    v90[1] = v20;
    v91[1] = MEMORY[0x1E4F1CC38];
    v21 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v91 forKeys:v90 count:2];
    v93[0] = v21;
    v17 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v93 forKeys:&v92 count:1];

    v15 = v60;
  }
  if ([(_EXExtensionIdentity *)self lauchThrottlePolicy] == 1)
  {
    uint64_t v22 = objc_msgSend(v17, "_EX_dictionaryBySettingObject:forKey:", MEMORY[0x1E4F1CC38], @"Backoff");

    v17 = (void *)v22;
  }
  v23 = @"NSRunLoop";
  unint64_t v62 = v16;
  switch(v16)
  {
    case 0uLL:
      v88 = @"extensionkit.internal";
      uint64_t v89 = MEMORY[0x1E4F1CC38];
      v24 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v89 forKeys:&v88 count:1];
      v25 = (void *)MEMORY[0x1E4F1CC08];
      goto LABEL_16;
    case 1uLL:
      if ([(_EXExtensionIdentity *)self performsUserInteractiveWork]) {
        v23 = @"_UIApplicationMain";
      }
      v24 = &unk_1EE2E0E28;
      v25 = &unk_1EE2E0E00;
      goto LABEL_16;
    case 2uLL:
      v86[0] = @"viewbridge";
      v86[1] = @"extensionkit.internal";
      v87[0] = MEMORY[0x1E4F1CC38];
      v87[1] = MEMORY[0x1E4F1CC38];
      v24 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v87 forKeys:v86 count:2];
      v23 = @"_NSApplicationMain";
      v25 = &unk_1EE2E0EC8;
      goto LABEL_16;
    case 3uLL:
    case 4uLL:
      v84[0] = @"viewservice";
      v84[1] = @"extensionkit.internal";
      v85[0] = MEMORY[0x1E4F1CC38];
      v85[1] = MEMORY[0x1E4F1CC38];
      v24 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v85 forKeys:v84 count:2];
      v23 = @"_UIApplicationMain";
      v25 = &unk_1EE2E0F40;
      goto LABEL_16;
    case 5uLL:
    case 6uLL:
      v82[0] = @"viewbridge";
      v82[1] = @"viewservice";
      v83[0] = MEMORY[0x1E4F1CC38];
      v83[1] = MEMORY[0x1E4F1CC38];
      v82[2] = @"extensionkit.internal";
      v83[2] = MEMORY[0x1E4F1CC38];
      v24 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v83 forKeys:v82 count:3];
      v23 = @"_UIApplicationMain";
      v25 = &unk_1EE2E0FB8;
      goto LABEL_16;
    case 7uLL:
      v23 = @"_UIApplicationMain";
      v24 = (void *)MEMORY[0x1E4F1CC08];
      v25 = &unk_1EE2E1030;
LABEL_16:
      v61 = v25;
      break;
    case 8uLL:
      v61 = (void *)MEMORY[0x1E4F1CC08];
      v24 = &unk_1EE2E0E50;
      break;
    default:
      v24 = (void *)MEMORY[0x1E4F1CC08];
      v61 = (void *)MEMORY[0x1E4F1CC08];
      break;
  }
  v80[0] = @"ServiceType";
  v80[1] = @"RunLoopType";
  v81[0] = @"Application";
  v81[1] = v23;
  v26 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v81 forKeys:v80 count:2];
  [v15 addEntriesFromDictionary:v26];

  v27 = +[_EXDefaults sharedInstance];
  if ([v27 forceSandbox])
  {
  }
  else
  {
    BOOL v28 = [(_EXExtensionIdentity *)self hasSandboxEntitlement];

    if (!v28)
    {
LABEL_24:
      v32 = v12;
      if (v9)
      {
        v33 = _EXDefaultLog();
        if (os_log_type_enabled(v33, OS_LOG_TYPE_DEBUG)) {
          -[_EXExtensionIdentity(Overlay) xpcOverlayDictionaryOverridingSandboxProfileName:multiInstance:arguments:additionalEnvironment:].cold.4();
        }

        [v15 setObject:v9 forKeyedSubscript:@"_SandboxProfile"];
      }
      if (v64) {
        [v15 setObject:MEMORY[0x1E4F1CC38] forKeyedSubscript:@"_MultipleInstances"];
      }
      if ([(_EXExtensionIdentity *)self requiresHostToBeContainerApp]) {
        [v15 setObject:MEMORY[0x1E4F1CC28] forKeyedSubscript:@"_AbandonCoalition"];
      }
      if ([v17 count])
      {
        v34 = objc_msgSend(MEMORY[0x1E4F1CC08], "_EX_dictionaryBySettingObject:forKey:", v17, @"RunningBoard");
      }
      else
      {
        v34 = (void *)MEMORY[0x1E4F1CC08];
      }
      if ([v34 count])
      {
        v78 = @"_AdditionalProperties";
        v79 = v34;
        v35 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v79 forKeys:&v78 count:1];
        [v15 addEntriesFromDictionary:v35];
      }
      v56 = v34;
      if ([v24 count])
      {
        v76 = @"_AdditionalSubServices";
        v77 = v24;
        v36 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v77 forKeys:&v76 count:1];
        [v15 addEntriesFromDictionary:v36];
      }
      id v37 = v11;
      uint64_t v38 = objc_msgSend(v32, "_EX_stringForKey:", @"EXProcessType");
      v39 = (void *)v38;
      if (v38)
      {
        v74 = @"_ProcessType";
        uint64_t v75 = v38;
        v40 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v75 forKeys:&v74 count:1];
        [v15 addEntriesFromDictionary:v40];
      }
      if (v62 <= 7 && ((1 << v62) & 0xA8) != 0) {
        [v15 addEntriesFromDictionary:&unk_1EE2E1058];
      }
      v57 = v17;
      v59 = v32;
      v41 = [MEMORY[0x1E4F1CA60] dictionaryWithDictionary:v37];
      uint64_t v42 = [v15 objectForKeyedSubscript:@"EnvironmentVariables"];
      if (v42) {
        [v41 addEntriesFromDictionary:v42];
      }
      v55 = (void *)v42;
      v43 = self;
      id v68 = 0;
      v44 = [MEMORY[0x1E4F28D90] dataWithJSONObject:v61 options:0 error:&v68];
      id v65 = v68;
      uint64_t v45 = [[NSString alloc] initWithData:v44 encoding:4];
      v46 = (void *)v45;
      if (v45)
      {
        v72 = @"BSServiceDomains";
        uint64_t v73 = v45;
        v47 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v73 forKeys:&v72 count:1];
        [v41 addEntriesFromDictionary:v47];
      }
      else
      {
        v47 = _EXDefaultLog();
        if (os_log_type_enabled(v47, OS_LOG_TYPE_ERROR)) {
          -[_EXExtensionIdentity(Overlay) xpcOverlayDictionaryOverridingSandboxProfileName:multiInstance:arguments:additionalEnvironment:]();
        }
      }

      v48 = objc_msgSend(NSString, "stringWithFormat:", @"%lu", v62);
      [v41 setObject:v48 forKeyedSubscript:@"EXTENSION_KIT_EXTENSION_TYPE"];

      [v15 setObject:v41 forKeyedSubscript:@"EnvironmentVariables"];
      if ([(_EXExtensionIdentity *)v43 disableLaunchdCheckinTimeout]) {
        [v15 setObject:&unk_1EE2E10D0 forKeyedSubscript:@"_LaunchWatchdogTimeOut"];
      }
      [v15 setObject:v63 forKeyedSubscript:@"ProgramArguments"];
      v49 = [(_EXExtensionIdentity *)v43 configuration];
      v50 = [v49 serviceName];
      v71 = v50;
      v51 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v71 count:1];
      [v15 setObject:v51 forKeyedSubscript:@"_ManagedBy_Services"];

      v69[0] = @"CFBundlePackageType";
      v69[1] = @"XPCService";
      v70[0] = @"XPC!";
      v70[1] = v15;
      v52 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v70 forKeys:v69 count:2];
      v53 = _EXDefaultLog();
      if (os_log_type_enabled(v53, OS_LOG_TYPE_DEBUG)) {
        -[_EXExtensionIdentity(Overlay) xpcOverlayDictionaryOverridingSandboxProfileName:multiInstance:arguments:additionalEnvironment:]();
      }

      return v52;
    }
  }
  v29 = [(_EXExtensionIdentity *)self sandboxProfileName];
  v30 = _EXDefaultLog();
  v31 = v30;
  if (v29)
  {
    if (os_log_type_enabled(v30, OS_LOG_TYPE_DEBUG)) {
      -[_EXExtensionIdentity(Overlay) xpcOverlayDictionaryOverridingSandboxProfileName:multiInstance:arguments:additionalEnvironment:].cold.5();
    }

    [v15 setObject:v29 forKeyedSubscript:@"_SandboxProfile"];
    goto LABEL_24;
  }
  if (os_log_type_enabled(v30, OS_LOG_TYPE_FAULT)) {
    -[_EXExtensionIdentity(Overlay) xpcOverlayDictionaryOverridingSandboxProfileName:multiInstance:arguments:additionalEnvironment:](v31);
  }

  __break(1u);
  return result;
}

- (unint64_t)type
{
  if ([(_EXExtensionIdentity *)self presentsUserInterface])
  {
    if ([(_EXExtensionIdentity *)self platform] == 1)
    {
      return 2;
    }
    else if ([(_EXExtensionIdentity *)self requiresFBSceneHosting])
    {
      return 7;
    }
    else if ([(_EXExtensionIdentity(Configuration) *)self requiresUIKitSceneHosting])
    {
      return 3;
    }
    else
    {
      return 4;
    }
  }
  else if ([(_EXExtensionIdentity *)self requiresLibXPCConnection])
  {
    return 8;
  }
  else
  {
    return 1;
  }
}

- (NSString)sandboxProfileName
{
  if ([(_EXExtensionIdentity *)self targetsSystemExtensionPoint])
  {
    char v3 = [(_EXExtensionIdentity *)self sdkDictionary];
    id v4 = objc_msgSend(v3, "_EX_stringForKey:", @"_EXSandboxProfileName");

    if (!v4)
    {
      v5 = [(_EXExtensionIdentity *)self sdkDictionary];
      id v4 = objc_msgSend(v5, "_EX_stringForKey:", @"EXSandboxProfileName");

      if (!v4)
      {
        v6 = [(_EXExtensionIdentity *)self sdkDictionary];
        objc_super v7 = objc_msgSend(v6, "_EX_dictionaryForKey:", @"NSExtension");
        id v4 = objc_msgSend(v7, "_EX_stringForKey:", @"NSExtensionSandboxProfile");
      }
    }
  }
  else
  {
    id v4 = 0;
  }
  v8 = [(_EXExtensionIdentity *)self entitlements];
  id v9 = objc_msgSend(v8, "_EX_stringForKey:", @"com.apple.private.extensionkit.sandbox-profile-name");

  if (v9)
  {
    id v10 = v9;
LABEL_8:
    id v11 = v10;

    id v4 = v11;
    goto LABEL_10;
  }
  if (!v4)
  {
    id v4 = +[_EXDefaults sharedInstance];
    id v10 = [v4 defaultSandboxProfileName];
    goto LABEL_8;
  }
LABEL_10:

  return (NSString *)v4;
}

- (int64_t)lauchThrottlePolicy
{
  char v3 = [(_EXExtensionIdentity *)self sdkDictionary];
  id v4 = objc_msgSend(v3, "_EX_stringForKey:", @"_EXLaunchThrottlePolicy");

  if ([v4 isEqualToString:@"disabled"]) {
    int64_t v5 = 2;
  }
  else {
    int64_t v5 = ([v4 isEqualToString:@"throttled"] & 1) != 0
  }
      || ![(_EXExtensionIdentity *)self launchesViaExtensionKitService]
      || [(_EXExtensionIdentity *)self type] == 7;

  return v5;
}

- (BOOL)disableLaunchdCheckinTimeout
{
  char v3 = +[_EXDefaults sharedInstance];
  if ([v3 disableLaunchdCheckinTimeout])
  {
    char v4 = 1;
  }
  else
  {
    int64_t v5 = [(_EXExtensionIdentity *)self sdkDictionary];
    char v4 = objc_msgSend(v5, "_EX_BOOLForKey:defaultValue:", @"EXDisableLaunchdCheckinTimeout", 0);
  }
  return v4;
}

- (BOOL)performsUserInteractiveWork
{
  if ([(_EXExtensionIdentity *)self presentsUserInterface])
  {
    LOBYTE(v3) = 1;
  }
  else
  {
    BOOL v3 = [(_EXExtensionIdentity *)self targetsSystemExtensionPoint];
    if (v3)
    {
      char v4 = [(_EXExtensionIdentity *)self sdkDictionary];
      char v5 = objc_msgSend(v4, "_EX_BOOLForKey:defaultValue:", @"EXPerformsUserInteractiveWork", 0);

      LOBYTE(v3) = v5;
    }
  }
  return v3;
}

- (BOOL)launchesViaExtensionKitService
{
  BOOL v3 = +[_EXDefaults sharedInstance];
  char v4 = [v3 inProcessLaunch];

  if (v4) {
    return 0;
  }
  else {
    return ![(_EXExtensionIdentity *)self requiresLibXPCConnection];
  }
}

- (BOOL)requiresNetworkAttribution
{
  v2 = [(_EXExtensionIdentity *)self extensionPointConfiguration];
  char v3 = objc_msgSend(v2, "_EX_BOOLForKey:", @"EXRequiresNetworkAttribution");

  return v3;
}

- (BOOL)requiresMultiInstance
{
  v2 = [(_EXExtensionIdentity *)self sdkDictionary];
  char v3 = objc_msgSend(v2, "_EX_BOOLForKey:", @"EXRequiresMultiInstance");

  return v3;
}

- (BOOL)requiresLegacyInfrastructure
{
  v2 = [(_EXExtensionIdentity *)self sdkDictionary];
  char v3 = objc_msgSend(v2, "_EX_BOOLForKey:", @"EXRequiresLegacyInfrastructure");

  return v3;
}

- (void)encodeWithCoder:(id)a3
{
  id v18 = a3;
  char v4 = [(_EXExtensionIdentity *)self extensionPointIdentifier];
  [v18 encodeObject:v4 forKey:@"extensionPointIdentifier"];

  char v5 = [(_EXExtensionIdentity *)self bundleIdentifier];
  [v18 encodeObject:v5 forKey:@"bundleIdentifier"];

  v6 = [(_EXExtensionIdentity *)self bundleVersion];
  [v18 encodeObject:v6 forKey:@"bundleVersion"];

  objc_super v7 = [(_EXExtensionIdentity *)self containingBundleRecord];
  v8 = [v7 persistentIdentifier];
  [v18 encodeObject:v8 forKey:@"containingBundleRecordIdentifier"];

  objc_msgSend(v18, "encodeInt32:forKey:", -[_EXExtensionIdentity platform](self, "platform"), @"platform");
  id v9 = [(_EXExtensionIdentity *)self UUID];
  [v18 encodeObject:v9 forKey:@"UUID"];

  id v10 = [(_EXExtensionIdentity *)self localizedName];
  [v18 encodeObject:v10 forKey:@"localizedName"];

  id v11 = [(_EXExtensionIdentity *)self developerName];
  [v18 encodeObject:v11 forKey:@"developerName"];

  v12 = [(_EXExtensionIdentity *)self url];
  [v18 encodeObject:v12 forKey:@"url"];

  v13 = [(_EXExtensionIdentity *)self containingURL];
  [v18 encodeObject:v13 forKey:@"containingURL"];

  v14 = [(_EXExtensionIdentity *)self sdkDictionary];
  [v18 encodeObject:v14 forKey:@"sdkDictionary"];

  v15 = [(_EXExtensionIdentity *)self extensionDictionary];
  [v18 encodeObject:v15 forKey:@"extensionDictionary"];

  unint64_t v16 = [(_EXExtensionIdentity *)self attributes];
  [v18 encodeObject:v16 forKey:@"attributes"];

  v17 = [(_EXExtensionIdentity *)self entitlements];
  [v18 encodeObject:v17 forKey:@"entitlements"];

  objc_msgSend(v18, "encodeInteger:forKey:", -[_EXExtensionIdentity userElection](self, "userElection"), @"userElection");
  objc_msgSend(v18, "encodeInteger:forKey:", -[_EXExtensionIdentity defaultUserElection](self, "defaultUserElection"), @"defaultUserElection");
  objc_msgSend(v18, "encodeBool:forKey:", -[_EXExtensionIdentity isSystemComponent](self, "isSystemComponent"), @"isSystemComponent");
}

- (BOOL)isEqual:(id)a3
{
  char v4 = (_EXExtensionIdentity *)a3;
  if (v4 == self)
  {
    BOOL v5 = 1;
  }
  else
  {
    objc_opt_class();
    BOOL v5 = (objc_opt_isKindOfClass() & 1) != 0
      && [(_EXExtensionIdentity *)self isEqualToExtension:v4];
  }

  return v5;
}

- (BOOL)isEqualToExtension:(id)a3
{
  id v4 = a3;
  BOOL v5 = [(_EXExtensionIdentity *)self UUID];
  v6 = [v4 UUID];

  LOBYTE(v4) = [v5 isEqual:v6];
  return (char)v4;
}

- (unint64_t)hash
{
  v2 = [(_EXExtensionIdentity *)self UUID];
  unint64_t v3 = [v2 hash];

  return v3;
}

- (BOOL)requiresFBSceneHosting
{
  v2 = [(_EXExtensionIdentity *)self extensionPointConfiguration];
  char v3 = objc_msgSend(v2, "_EX_BOOLForKey:", @"EXRequiresSceneHosting");

  return v3;
}

- (BOOL)supportsNSExtensionPlistKeys
{
  v2 = [(_EXExtensionIdentity *)self extensionPointConfiguration];
  char v3 = objc_msgSend(v2, "_EX_BOOLForKey:", @"EXSupportsNSExtensionPlistKeys");

  return v3;
}

- (Class)principalClass
{
  char v3 = [(_EXExtensionIdentity *)self extensionPointConfiguration];
  objc_msgSend(v3, "_EX_stringForKey:", @"EXExtensionPrincipalClass");
  id v4 = (NSString *)objc_claimAutoreleasedReturnValue();

  if (!v4)
  {
    BOOL v5 = [(_EXExtensionIdentity *)self attributes];
    objc_msgSend(v5, "_EX_stringForKey:", @"EXExtensionPrincipalClass");
    id v4 = (NSString *)objc_claimAutoreleasedReturnValue();

    if (!v4)
    {
      v6 = [(_EXExtensionIdentity *)self attributes];
      id v4 = [v6 objectForKeyedSubscript:@"EXPrincipalClass"];

      if (!v4)
      {
        objc_super v7 = [(_EXExtensionIdentity *)self attributes];
        id v4 = [v7 objectForKeyedSubscript:@"EXAppExtensionDelegateClass"];

        if (!v4)
        {
          if ([(_EXExtensionIdentity *)self supportsNSExtensionPlistKeys])
          {
            v8 = [(_EXExtensionIdentity *)self extensionDictionary];
            objc_msgSend(v8, "_EX_stringForKey:", @"NSExtensionPrincipalClass");
            id v4 = (NSString *)objc_claimAutoreleasedReturnValue();
          }
          else
          {
            id v4 = 0;
          }
        }
      }
    }
  }
  Class v9 = NSClassFromString(v4);
  if (!v9)
  {
    id v10 = (void *)[[NSString alloc] initWithUTF8String:getprogname()];
    id v11 = [v10 stringByAppendingFormat:@".%@", v4];

    Class v9 = NSClassFromString(v11);
  }
  v12 = v9;

  return v12;
}

- (Class)extensionClass
{
  char v3 = [(_EXExtensionIdentity *)self extensionPointConfiguration];
  objc_msgSend(v3, "_EX_stringForKey:", @"EXAppExtensionClass");
  id v4 = (NSString *)objc_claimAutoreleasedReturnValue();

  if (v4
    || ([(_EXExtensionIdentity *)self attributes],
        BOOL v5 = objc_claimAutoreleasedReturnValue(),
        [v5 objectForKeyedSubscript:@"EXAppExtensionClass"],
        id v4 = (NSString *)objc_claimAutoreleasedReturnValue(),
        v5,
        v4))
  {
    Class v6 = NSClassFromString(v4);
    if (v6)
    {
      objc_super v7 = v6;
    }
    else
    {
      v8 = (void *)[[NSString alloc] initWithUTF8String:getprogname()];
      Class v9 = [v8 stringByAppendingFormat:@".%@", v4];

      objc_super v7 = NSClassFromString(v9);
    }
  }
  else
  {
    objc_super v7 = 0;
  }
  if ([(_EXExtensionIdentity *)self supportsNSExtensionPlistKeys]
    && [(_EXExtensionIdentity *)self extensionContextClass]
    && [(_EXExtensionIdentity *)self presentsUserInterface])
  {
    id v10 = @"_EXNSExtensionUIShimExtension";
LABEL_14:
    objc_super v7 = NSClassFromString(&v10->isa);
    goto LABEL_15;
  }
  if ([(_EXExtensionIdentity *)self supportsNSExtensionPlistKeys]
    && [(_EXExtensionIdentity *)self extensionContextClass])
  {
    id v10 = @"_EXNSExtensionShimExtension";
    goto LABEL_14;
  }
LABEL_15:
  if (!v7) {
    objc_super v7 = objc_opt_class();
  }
  id v11 = v7;

  return v11;
}

- (Class)connectionHandlerClass
{
  v2 = [(_EXExtensionIdentity *)self extensionPointConfiguration];
  objc_msgSend(v2, "_EX_stringForKey:", @"EXConnectionHandlerClass");
  char v3 = (NSString *)objc_claimAutoreleasedReturnValue();

  id v4 = NSClassFromString(v3);
  BOOL v5 = v4;
  if (v3 && !v4)
  {
    Class v6 = _EXDefaultLog();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      -[_EXExtensionIdentity(Configuration) connectionHandlerClass](v6);
    }
LABEL_9:

    goto LABEL_10;
  }
  if (v4 && !class_conformsToProtocol(v4, (Protocol *)&unk_1EE2E56C0))
  {
    Class v6 = _EXDefaultLog();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      -[_EXExtensionIdentity(Configuration) connectionHandlerClass](v6);
    }
    goto LABEL_9;
  }
LABEL_10:
  objc_super v7 = v5;

  return v7;
}

- (NSDictionary)requiredHostEntitlements
{
  char v3 = [(_EXExtensionIdentity *)self extensionPointConfiguration];
  id v4 = [(_EXExtensionIdentity *)self extensionPointIdentifier];
  BOOL v5 = _EXExtractRequiredHostEntitlements(v3, v4);

  return (NSDictionary *)v5;
}

- (NSString)internalServiceName
{
  v2 = _EXDefaultLog();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_FAULT))
  {
    int v4 = 136315394;
    BOOL v5 = "/Library/Caches/com.apple.xbs/Sources/ExtensionFoundation/ExtensionFoundation/Source/EXExtension/Extension/Inte"
         "rnal/EXExtension+Configuration.m";
    __int16 v6 = 1024;
    int v7 = 209;
  }

  __break(1u);
  return result;
}

- (_EXExtensionIdentity)initWithPlugInKitProxy:(id)a3
{
  id v4 = a3;
  BOOL v5 = [[_EXExtensionRecordIdentity alloc] initWithPlugInKitProxy:v4];

  return &v5->super;
}

- (_EXExtensionIdentity)initWithServiceIdentifier:(id)a3 error:(id *)a4
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  int v7 = [MEMORY[0x1E4F223F8] bundleRecordForCurrentProcess];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v20 = self;
    long long v23 = 0u;
    long long v24 = 0u;
    long long v21 = 0u;
    long long v22 = 0u;
    v8 = [v7 applicationExtensionRecords];
    uint64_t v9 = [v8 countByEnumeratingWithState:&v21 objects:v25 count:16];
    if (v9)
    {
      uint64_t v10 = v9;
      uint64_t v11 = *(void *)v22;
LABEL_4:
      uint64_t v12 = 0;
      while (1)
      {
        if (*(void *)v22 != v11) {
          objc_enumerationMutation(v8);
        }
        v13 = *(void **)(*((void *)&v21 + 1) + 8 * v12);
        v14 = [v13 bundleIdentifier];
        char v15 = [v14 isEqualToString:v6];

        if (v15) {
          break;
        }
        if (v10 == ++v12)
        {
          uint64_t v10 = [v8 countByEnumeratingWithState:&v21 objects:v25 count:16];
          if (v10) {
            goto LABEL_4;
          }
          goto LABEL_10;
        }
      }
      id v16 = v13;

      self = v20;
      if (v16) {
        goto LABEL_13;
      }
    }
    else
    {
LABEL_10:

      self = v20;
    }
  }
  id v16 = (id)[objc_alloc(MEMORY[0x1E4F223A0]) initWithBundleIdentifier:v6 requireValid:1 platform:dyld_get_active_platform() error:a4];
  if (v16)
  {
LABEL_13:
    v17 = [[_EXExtensionRecordIdentity alloc] initWithApplicationExtensionRecord:v16];
  }
  else
  {
    id v18 = _EXDefaultLog();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR)) {
      -[_EXExtensionIdentity initWithServiceIdentifier:error:]();
    }

    if (a4)
    {
      [MEMORY[0x1E4F28C58] errorWithDomain:@"com.apple.extensionKit.errorDomain" code:5 userInfo:MEMORY[0x1E4F1CC08]];
      id v16 = 0;
      v17 = 0;
      *a4 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      id v16 = 0;
      v17 = 0;
    }
  }

  return &v17->super;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (_EXExtensionIdentity)initWithCoder:(id)a3
{
  id v4 = a3;
  BOOL v5 = [[_EXExtensionValueIdentity alloc] initWithCoder:v4];

  return &v5->super;
}

- (NSString)description
{
  char v3 = NSString;
  id v4 = [(_EXExtensionIdentity *)self UUID];
  BOOL v5 = [(_EXExtensionIdentity *)self bundleIdentifier];
  id v6 = [(_EXExtensionIdentity *)self extensionPointIdentifier];
  int v7 = [v3 stringWithFormat:@"Extension identity [%@]: %@ extension point: %@ platform: %u", v4, v5, v6, -[_EXExtensionIdentity platform](self, "platform")];

  return (NSString *)v7;
}

- (NSURL)executableURL
{
  v2 = [(_EXExtensionIdentity *)self url];
  Unique = (__CFBundle *)_CFBundleCreateUnique();

  if (Unique)
  {
    CFURLRef v4 = CFBundleCopyExecutableURL(Unique);
    CFRelease(Unique);
  }
  else
  {
    CFURLRef v4 = 0;
  }

  return (NSURL *)v4;
}

- (NSDictionary)nsExtensionAttributes
{
  v2 = [(_EXExtensionIdentity *)self extensionDictionary];
  char v3 = objc_msgSend(v2, "_EX_dictionaryForKey:", @"NSExtensionAttributes");
  CFURLRef v4 = v3;
  if (!v3) {
    char v3 = (void *)MEMORY[0x1E4F1CC08];
  }
  BOOL v5 = v3;

  return v5;
}

- (id)entitlementNamed:(id)a3 ofClass:(Class)a4
{
  id v4 = a3;
  BOOL v5 = _EXDefaultLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_FAULT))
  {
    int v7 = 136315906;
    v8 = "false";
    __int16 v9 = 2080;
    uint64_t v10 = "/Library/Caches/com.apple.xbs/Sources/ExtensionFoundation/ExtensionFoundation/Source/EXExtension/Extension/EXE"
          "xtensionIdentity.m";
    __int16 v11 = 1024;
    int v12 = 531;
    __int16 v13 = 2080;
    v14 = "-[_EXExtensionIdentity entitlementNamed:ofClass:]";
    _os_log_fault_impl(&dword_191F29000, v5, OS_LOG_TYPE_FAULT, "%s - %s:%d: _EXExtensionIdentity subclass must implement '%s'", (uint8_t *)&v7, 0x26u);
  }

  __break(1u);
  return result;
}

- (BOOL)hasSandboxEntitlement
{
  v2 = [(_EXExtensionIdentity *)self entitlementNamed:@"com.apple.security.app-sandbox" ofClass:objc_opt_class()];
  char v3 = v2;
  if (v2) {
    int v4 = [v2 isEqual:MEMORY[0x1E4F1CC28]] ^ 1;
  }
  else {
    LOBYTE(v4) = 0;
  }

  return v4;
}

- (ISIcon)icon
{
  uint64_t v10 = 0;
  __int16 v11 = &v10;
  uint64_t v12 = 0x2050000000;
  char v3 = (void *)getISIconClass_softClass;
  uint64_t v13 = getISIconClass_softClass;
  if (!getISIconClass_softClass)
  {
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __getISIconClass_block_invoke;
    v9[3] = &unk_1E573CC00;
    v9[4] = &v10;
    __getISIconClass_block_invoke((uint64_t)v9);
    char v3 = (void *)v11[3];
  }
  int v4 = v3;
  _Block_object_dispose(&v10, 8);
  id v5 = [v4 alloc];
  id v6 = [(_EXExtensionIdentity *)self bundleIdentifier];
  int v7 = (void *)[v5 initWithBundleIdentifier:v6];

  return (ISIcon *)v7;
}

- (Class)hostContextClass
{
  v2 = [(_EXExtensionIdentity *)self sdkDictionary];
  char v3 = [v2 objectForKeyedSubscript:@"NSExtensionContextHostClass"];

  int v4 = NSClassFromString(v3);
  return v4;
}

- (Class)extensionContextClass
{
  v2 = [(_EXExtensionIdentity *)self sdkDictionary];
  objc_msgSend(v2, "_EX_stringForKey:", @"EXExtensionContextClass");
  char v3 = (NSString *)objc_claimAutoreleasedReturnValue();

  if (!v3)
  {
LABEL_6:
    Class v4 = 0;
    goto LABEL_7;
  }
  Class v4 = NSClassFromString(v3);
  if (!v4)
  {
    id v5 = _EXDefaultLog();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      -[_EXExtensionIdentity extensionContextClass]();
    }

    goto LABEL_6;
  }
LABEL_7:
  id v6 = v4;

  return v6;
}

- (NSArray)roles
{
  v2 = [(_EXExtensionIdentity *)self extensionPointConfiguration];
  char v3 = objc_msgSend(v2, "_EX_dictionaryForKey:", @"EXSceneManifest");
  Class v4 = [v3 allKeys];

  return (NSArray *)v4;
}

- (id)makeXPCConnectionWithError:(id *)a3
{
  v13.opaque[0] = 0;
  v13.opaque[1] = 0;
  id v5 = _os_activity_create(&dword_191F29000, "Make extension XPC connection", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
  os_activity_scope_enter(v5, &v13);
  id v6 = _EXDefaultLog();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG)) {
    -[_EXExtensionIdentity makeXPCConnectionWithError:]();
  }

  int v7 = objc_opt_new();
  objc_msgSend(v7, "setExtensionIdentity:", self, v13.opaque[0], v13.opaque[1]);
  v8 = +[_EXExtensionProcess extensionProcessWithConfiguration:v7 error:a3];
  __int16 v9 = v8;
  if (v8)
  {
    uint64_t v10 = (void *)[v8 newXPCConnectionWithError:a3];
  }
  else
  {
    __int16 v11 = _EXDefaultLog();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG)) {
      -[_EXExtensionIdentity makeXPCConnectionWithError:]();
    }

    uint64_t v10 = 0;
  }
  os_activity_scope_leave(&v13);

  return v10;
}

- (unint64_t)enablementState
{
  char v3 = [(_EXExtensionIdentity *)self extensionPointIdentifier];

  if (!v3) {
    return 0;
  }
  int v4 = [(_EXExtensionIdentity *)self userElection];
  if (v4)
  {
    unint64_t v5 = 1;
  }
  else
  {
    int v4 = [(_EXExtensionIdentity *)self defaultUserElection];
    unint64_t v5 = 0;
  }
  if (v4 == 1) {
    return v5 | 2;
  }
  else {
    return v5;
  }
}

- (BOOL)enabled
{
  return ([(_EXExtensionIdentity *)self enablementState] >> 1) & 1;
}

- (BOOL)unelected
{
  return ([(_EXExtensionIdentity *)self enablementState] & 1) == 0;
}

+ (BOOL)enableExtension:(id)a3 error:(id *)a4
{
  id v5 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    char v6 = [v5 setUserElection:1 error:a4];
  }
  else if (a4)
  {
    objc_msgSend(MEMORY[0x1E4F28C58], "_EX_parameterError");
    char v6 = 0;
    *a4 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    char v6 = 0;
  }

  return v6;
}

+ (BOOL)disableExtension:(id)a3 error:(id *)a4
{
  id v5 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    char v6 = [v5 setUserElection:2 error:a4];
  }
  else if (a4)
  {
    objc_msgSend(MEMORY[0x1E4F28C58], "_EX_parameterError");
    char v6 = 0;
    *a4 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    char v6 = 0;
  }

  return v6;
}

- (BOOL)showsInExtensionsManager
{
  if (![(_EXExtensionIdentity *)self isSystemComponent]) {
    return 1;
  }
  char v3 = [(_EXExtensionIdentity *)self extensionDictionary];
  char v4 = objc_msgSend(v3, "_EX_BOOLForKey:defaultValue:", @"com.apple.showsInExtensionsManager", 1);

  return v4;
}

- (BOOL)canDisable
{
  if ([(_EXExtensionIdentity *)self isSystemComponent])
  {
    char v3 = +[_EXDefaults sharedInstance];
    char v4 = [v3 alwaysEnabledExtensionBundleIdentifiers];
    id v5 = [(_EXExtensionIdentity *)self bundleIdentifier];
    int v6 = [v4 containsObject:v5] ^ 1;
  }
  else
  {
    LOBYTE(v6) = 1;
  }
  return v6;
}

- (BOOL)spotlightIndexable
{
  v2 = [(_EXExtensionIdentity *)self sdkDictionary];
  char v3 = objc_msgSend(v2, "_EX_arrayForKey:", @"EXSpotlightIndexable");
  BOOL v4 = v3 != 0;

  return v4;
}

- (NSArray)spotlightImporterIdentifiers
{
  v2 = [(_EXExtensionIdentity *)self sdkDictionary];
  char v3 = objc_msgSend(v2, "_EX_arrayForKey:", @"EXSpotlightIndexable");
  BOOL v4 = v3;
  if (!v3) {
    char v3 = (void *)MEMORY[0x1E4F1CBF0];
  }
  id v5 = v3;

  return v5;
}

- (NSArray)alternateSandboxProfileNames
{
  if ([(_EXExtensionIdentity *)self targetsSystemExtensionPoint])
  {
    char v3 = [(_EXExtensionIdentity *)self sdkDictionary];
    BOOL v4 = objc_msgSend(v3, "_EX_arrayForKey:", @"EXAlternateSandboxProfileNames");
  }
  else
  {
    BOOL v4 = (void *)MEMORY[0x1E4F1CBF0];
  }

  return (NSArray *)v4;
}

- (NSString)developerName
{
  return (NSString *)objc_getProperty(self, a2, 16, 1);
}

- (BOOL)requiresUIKitSceneHosting
{
  return self->_requiresUIKitSceneHosting;
}

- (BOOL)isSystemComponent
{
  return self->_systemComponent;
}

- (id)_executableURLWithError:(id *)a3
{
  BOOL v4 = [(_EXExtensionIdentity *)self url];
  Unique = (__CFBundle *)_CFBundleCreateUnique();
  if (Unique)
  {
    int v6 = Unique;
    CFURLRef v7 = CFBundleCopyExecutableURL(Unique);
    CFRelease(v6);
  }
  else
  {
    CFURLRef v7 = 0;
  }
  v8 = [(__CFURL *)v7 path];
  if (!v8)
  {
    __int16 v9 = _EXDefaultLog();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      -[_EXExtensionIdentity(Overlay) _executableURLWithError:](v9);
    }

    if (a3)
    {
      *a3 = [MEMORY[0x1E4F28C58] errorWithDomain:@"com.apple.extensionKit.errorDomain" code:2 userInfo:MEMORY[0x1E4F1CC08]];
    }

    CFURLRef v7 = 0;
  }

  return v7;
}

- (void)initWithServiceIdentifier:error:.cold.1()
{
  OUTLINED_FUNCTION_3();
}

- (void)extensionContextClass
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_3_0(&dword_191F29000, v0, v1, "Failed to load extension context class '%{public}@', does the appex link the extension point framework?", v2, v3, v4, v5, v6);
}

- (void)makeXPCConnectionWithError:.cold.1()
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_3();
  _os_log_debug_impl(&dword_191F29000, v0, OS_LOG_TYPE_DEBUG, "Failed to make xpc connection for extension %{public}@  (extension launch failed)", v1, 0xCu);
}

- (void)makeXPCConnectionWithError:.cold.2()
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_3();
  _os_log_debug_impl(&dword_191F29000, v0, OS_LOG_TYPE_DEBUG, "making XPC connection for extension: %{public}@", v1, 0xCu);
}

@end