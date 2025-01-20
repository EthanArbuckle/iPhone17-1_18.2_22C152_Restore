@interface CHSBaseDescriptor
+ (BOOL)supportsSecureCoding;
- (BOOL)hasIntents;
- (BOOL)hiddenBySensitiveUI;
- (BOOL)isEnabled;
- (BOOL)isEqual:(id)a3;
- (BOOL)isInternal;
- (BOOL)isLinkedOnOrAfter:(unint64_t)a3;
- (BOOL)prefersUserConfiguration;
- (BOOL)promptsForUserConfiguration;
- (BOOL)supportsVibrantContent;
- (BOOL)wasEnablementExplicitlyDeclared;
- (CHSBaseDescriptor)initWithCoder:(id)a3;
- (CHSBaseDescriptor)initWithExtensionIdentity:(id)a3;
- (CHSExtensionIdentity)extensionIdentity;
- (NSArray)requiredFeatureFlags;
- (NSData)localeToken;
- (NSString)description;
- (NSString)displayName;
- (NSString)effectiveContainerBundleIdentifier;
- (NSString)eventMachServiceName;
- (NSString)nativeContainerBundleIdentifier;
- (NSString)sdkVersion;
- (NSString)widgetDescription;
- (id)_initWithDescriptor:(id)a3;
- (id)containerBundleIdentifier;
- (id)descriptionBuilderWithMultilinePrefix:(id)a3;
- (id)descriptionWithMultilinePrefix:(id)a3;
- (id)extensionBundleIdentifier;
- (id)mutableCopyWithZone:(_NSZone *)a3;
- (id)sourceDeviceIdentifier;
- (id)succinctDescription;
- (id)succinctDescriptionBuilder;
- (int64_t)preferredBackgroundStyle;
- (unint64_t)enablement;
- (unint64_t)hash;
- (unint64_t)platform;
- (unint64_t)version;
- (void)encodeWithCoder:(id)a3;
- (void)setEnablement:(unint64_t)a3;
- (void)setVersion:(unint64_t)a3;
@end

@implementation CHSBaseDescriptor

- (CHSBaseDescriptor)initWithExtensionIdentity:(id)a3
{
  id v4 = a3;
  v18.receiver = self;
  v18.super_class = (Class)CHSBaseDescriptor;
  v5 = [(CHSBaseDescriptor *)&v18 init];
  if (v5)
  {
    uint64_t v6 = [v4 copy];
    extensionIdentity = v5->_extensionIdentity;
    v5->_extensionIdentity = (CHSExtensionIdentity *)v6;

    nativeContainerBundleIdentifier = v5->_nativeContainerBundleIdentifier;
    v5->_nativeContainerBundleIdentifier = 0;

    sdkVersion = v5->_sdkVersion;
    v5->_sdkVersion = (NSString *)@"Unknown";

    v5->_platform = CHSCurrentPlatform();
    uint64_t v20 = 0;
    v21 = &v20;
    uint64_t v22 = 0x2050000000;
    v10 = (void *)getNSLocaleClass_softClass;
    uint64_t v23 = getNSLocaleClass_softClass;
    if (!getNSLocaleClass_softClass)
    {
      v19[0] = MEMORY[0x1E4F143A8];
      v19[1] = 3221225472;
      v19[2] = __getNSLocaleClass_block_invoke;
      v19[3] = &unk_1E56C8628;
      v19[4] = &v20;
      __getNSLocaleClass_block_invoke((uint64_t)v19);
      v10 = (void *)v21[3];
    }
    id v11 = v10;
    _Block_object_dispose(&v20, 8);
    id v17 = 0;
    id v12 = (id)[v11 archivedPreferencesWithHash:&v17];
    id v13 = v17;
    uint64_t v14 = [v13 copy];
    localeToken = v5->_localeToken;
    v5->_localeToken = (NSData *)v14;

    v5->_version = 1;
    *(_WORD *)&v5->_hiddenBySensitiveUI = 0;
    v5->_enablement = 0;
  }
  return v5;
}

- (id)_initWithDescriptor:(id)a3
{
  id v4 = a3;
  v5 = [(CHSBaseDescriptor *)self initWithExtensionIdentity:*((void *)v4 + 1)];
  if (v5)
  {
    uint64_t v6 = [*((id *)v4 + 3) copy];
    displayName = v5->_displayName;
    v5->_displayName = (NSString *)v6;

    uint64_t v8 = [*((id *)v4 + 4) copy];
    widgetDescription = v5->_widgetDescription;
    v5->_widgetDescription = (NSString *)v8;

    uint64_t v10 = [*((id *)v4 + 6) copy];
    localeToken = v5->_localeToken;
    v5->_localeToken = (NSData *)v10;

    uint64_t v12 = [*((id *)v4 + 5) copy];
    eventMachServiceName = v5->_eventMachServiceName;
    v5->_eventMachServiceName = (NSString *)v12;

    v5->_preferredBackgroundStyle = *((void *)v4 + 7);
    v5->_supportsVibrantContent = *((unsigned char *)v4 + 64);
    objc_storeStrong((id *)&v5->_sdkVersion, *((id *)v4 + 10));
    v5->_platform = *((void *)v4 + 11);
    v5->_version = *((void *)v4 + 9);
    uint64_t v14 = [*((id *)v4 + 2) copy];
    nativeContainerBundleIdentifier = v5->_nativeContainerBundleIdentifier;
    v5->_nativeContainerBundleIdentifier = (NSString *)v14;

    v5->_hiddenBySensitiveUI = *((unsigned char *)v4 + 96);
    v5->_promptsForUserConfiguration = *((unsigned char *)v4 + 97);
    v5->_enablement = *((void *)v4 + 13);
  }

  return v5;
}

- (BOOL)isLinkedOnOrAfter:(unint64_t)a3
{
  sdkVersion = self->_sdkVersion;
  if (sdkVersion && ![(NSString *)sdkVersion isEqualToString:@"Unknown"])
  {
    unint64_t platform = self->_platform;
    if (platform)
    {
      uint64_t v10 = _CHSSystemVersionStringToCompareAgainstFromSDKAndPlatform(a3, platform);
      id v11 = [MEMORY[0x1E4F223E0] defaultWorkspace];
      char v7 = [v11 isVersion:self->_sdkVersion greaterThanOrEqualToVersion:v10];

      return v7;
    }
    uint64_t v6 = CHSLogChronoServices();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      -[CHSBaseDescriptor isLinkedOnOrAfter:](v6);
    }
  }
  else
  {
    uint64_t v6 = CHSLogChronoServices();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      -[CHSBaseDescriptor isLinkedOnOrAfter:](v6);
    }
  }

  return 0;
}

- (NSString)effectiveContainerBundleIdentifier
{
  nativeContainerBundleIdentifier = self->_nativeContainerBundleIdentifier;
  if (nativeContainerBundleIdentifier)
  {
    id v4 = (void *)[(NSString *)nativeContainerBundleIdentifier copy];
  }
  else
  {
    v5 = [(CHSExtensionIdentity *)self->_extensionIdentity containerBundleIdentifier];
    id v4 = (void *)[v5 copy];
  }
  return (NSString *)v4;
}

- (BOOL)isInternal
{
  return 0;
}

- (BOOL)hasIntents
{
  return 0;
}

- (BOOL)isEnabled
{
  return self->_enablement < 2;
}

- (BOOL)wasEnablementExplicitlyDeclared
{
  return self->_enablement - 1 < 2;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (CHSBaseDescriptor *)a3;
  if (self == v4)
  {
    BOOL v6 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v5 = v4;
      BOOL v6 = BSEqualBools()
        && self->_platform == v5->_platform
        && self->_version == v5->_version
        && BSEqualObjects()
        && BSEqualObjects()
        && BSEqualObjects()
        && BSEqualObjects()
        && BSEqualObjects()
        && BSEqualObjects()
        && BSEqualObjects()
        && BSEqualObjects()
        && BSEqualBools()
        && BSEqualBools()
        && self->_preferredBackgroundStyle == v5->_preferredBackgroundStyle
        && self->_enablement == v5->_enablement;
    }
    else
    {
      BOOL v6 = 0;
    }
  }

  return v6;
}

- (unint64_t)hash
{
  v3 = [MEMORY[0x1E4F4F758] builder];
  id v4 = (id)[v3 appendObject:self->_extensionIdentity];
  id v5 = (id)[v3 appendString:self->_nativeContainerBundleIdentifier];
  id v6 = (id)[v3 appendString:self->_displayName];
  id v7 = (id)[v3 appendString:self->_widgetDescription];
  id v8 = (id)[v3 appendObject:self->_localeToken];
  id v9 = (id)[v3 appendObject:self->_eventMachServiceName];
  id v10 = (id)[v3 appendInteger:self->_preferredBackgroundStyle];
  id v11 = (id)[v3 appendBool:self->_supportsVibrantContent];
  id v12 = (id)[v3 appendString:self->_sdkVersion];
  id v13 = (id)[v3 appendUnsignedInteger:self->_platform];
  id v14 = (id)[v3 appendBool:self->_version != 0];
  id v15 = (id)[v3 appendBool:self->_hiddenBySensitiveUI];
  id v16 = (id)[v3 appendBool:self->_promptsForUserConfiguration];
  id v17 = (id)[v3 appendUnsignedInteger:self->_enablement];
  id v18 = (id)[v3 appendObject:self->_requiredFeatureFlags];
  unint64_t v19 = [v3 hash];

  return v19;
}

- (NSString)description
{
  return (NSString *)[(CHSBaseDescriptor *)self descriptionWithMultilinePrefix:0];
}

- (id)succinctDescription
{
  v2 = [(CHSBaseDescriptor *)self succinctDescriptionBuilder];
  v3 = [v2 build];

  return v3;
}

- (id)succinctDescriptionBuilder
{
  v3 = [MEMORY[0x1E4F4F718] builderWithObject:self];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __47__CHSBaseDescriptor_succinctDescriptionBuilder__block_invoke;
  v7[3] = &unk_1E56C81F0;
  id v4 = v3;
  id v8 = v4;
  id v9 = self;
  [v4 appendProem:self block:v7];
  id v5 = v4;

  return v5;
}

id __47__CHSBaseDescriptor_succinctDescriptionBuilder__block_invoke(uint64_t a1)
{
  return (id)[*(id *)(a1 + 32) appendObject:*(void *)(*(void *)(a1 + 40) + 8) withName:@"extensionIdentity"];
}

- (id)descriptionWithMultilinePrefix:(id)a3
{
  v3 = [(CHSBaseDescriptor *)self descriptionBuilderWithMultilinePrefix:a3];
  id v4 = [v3 build];

  return v4;
}

- (id)descriptionBuilderWithMultilinePrefix:(id)a3
{
  id v4 = a3;
  id v5 = [MEMORY[0x1E4F4F718] builderWithObject:self];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __59__CHSBaseDescriptor_descriptionBuilderWithMultilinePrefix___block_invoke;
  v9[3] = &unk_1E56C81F0;
  id v6 = v5;
  id v10 = v6;
  id v11 = self;
  [v6 appendBodySectionWithName:0 multilinePrefix:v4 block:v9];
  id v7 = v6;

  return v7;
}

uint64_t __59__CHSBaseDescriptor_descriptionBuilderWithMultilinePrefix___block_invoke(uint64_t a1)
{
  id v2 = (id)[*(id *)(a1 + 32) appendObject:*(void *)(*(void *)(a1 + 40) + 8) withName:@"extensionIdentity"];
  [*(id *)(a1 + 32) appendString:*(void *)(*(void *)(a1 + 40) + 16) withName:@"nativeContainerBundleIdentifier" skipIfEmpty:1];
  [*(id *)(a1 + 32) appendString:*(void *)(*(void *)(a1 + 40) + 24) withName:@"displayName"];
  id v3 = (id)[*(id *)(a1 + 32) appendUnsignedInteger:*(void *)(*(void *)(a1 + 40) + 72) withName:@"version"];
  id v4 = (id)[*(id *)(a1 + 32) appendUnsignedInteger:*(void *)(*(void *)(a1 + 40) + 56) withName:@"preferredBackgroundStyle"];
  id v5 = (id)[*(id *)(a1 + 32) appendUnsignedInteger:*(unsigned __int8 *)(*(void *)(a1 + 40) + 64) withName:@"supportsVibrantContent"];
  [*(id *)(a1 + 32) appendString:*(void *)(*(void *)(a1 + 40) + 80) withName:@"sdkVersion"];
  id v6 = (id)[*(id *)(a1 + 32) appendUnsignedInteger:*(void *)(*(void *)(a1 + 40) + 88) withName:@"platform"];
  [*(id *)(a1 + 32) appendString:*(void *)(*(void *)(a1 + 40) + 32) withName:@"widgetDescription"];
  id v7 = *(void **)(a1 + 32);
  id v8 = [*(id *)(*(void *)(a1 + 40) + 48) base64EncodedStringWithOptions:0];
  [v7 appendString:v8 withName:@"localeToken"];

  id v9 = *(void **)(a1 + 32);
  id v10 = [*(id *)(*(void *)(a1 + 40) + 40) description];
  [v9 appendString:v10 withName:@"eventMachServiceName"];

  id v11 = (id)[*(id *)(a1 + 32) appendBool:*(unsigned __int8 *)(*(void *)(a1 + 40) + 96) withName:@"hiddenBySensitiveUI" ifEqualTo:1];
  id v12 = (id)[*(id *)(a1 + 32) appendBool:*(unsigned __int8 *)(*(void *)(a1 + 40) + 97) withName:@"promptsForUserConfiguration"];
  id v13 = (id)objc_msgSend(*(id *)(a1 + 32), "appendBool:withName:", objc_msgSend(*(id *)(a1 + 40), "isEnabled"), @"enabled");
  id v14 = (id)[*(id *)(a1 + 32) appendUnsignedInteger:*(void *)(*(void *)(a1 + 40) + 104) withName:@"enablement"];
  id v15 = *(void **)(a1 + 32);
  uint64_t v16 = *(void *)(*(void *)(a1 + 40) + 112);
  return [v15 appendArraySection:v16 withName:@"requiredFeatureFlags" skipIfEmpty:1];
}

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  id v5 = objc_msgSend(MEMORY[0x1E4F28B00], "currentHandler", a3);
  [v5 handleFailureInMethod:a2 object:self file:@"CHSBaseDescriptor.m" lineNumber:280 description:@"Not implemented - for subclasses to provide."];

  return 0;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v6 = a3;
  [v6 encodeObject:self->_extensionIdentity forKey:@"extensionIdentity"];
  [v6 encodeObject:self->_nativeContainerBundleIdentifier forKey:@"nativeCBI"];
  [v6 encodeObject:self->_displayName forKey:@"displayName"];
  [v6 encodeObject:self->_widgetDescription forKey:@"widgetDescription"];
  [v6 encodeObject:self->_localeToken forKey:@"localeToken"];
  [v6 encodeObject:self->_eventMachServiceName forKey:@"eventMachServiceName"];
  [v6 encodeInteger:self->_preferredBackgroundStyle forKey:@"backgroundStyle"];
  [v6 encodeBool:self->_supportsVibrantContent forKey:@"supportsVibrantContent"];
  [v6 encodeObject:self->_sdkVersion forKey:@"sdkVersion"];
  id v4 = [MEMORY[0x1E4F28ED0] numberWithUnsignedInteger:self->_platform];
  [v6 encodeObject:v4 forKey:@"platform"];

  id v5 = [MEMORY[0x1E4F28ED0] numberWithUnsignedInteger:self->_version];
  [v6 encodeObject:v5 forKey:@"version"];

  [v6 encodeBool:self->_hiddenBySensitiveUI forKey:@"hiddenBySensitiveUI"];
  [v6 encodeBool:self->_promptsForUserConfiguration forKey:@"promptsForUserConfiguration"];
  [v6 encodeInt32:LODWORD(self->_enablement) forKey:@"enablement"];
  [v6 encodeObject:self->_requiredFeatureFlags forKey:@"requiredFeatureFlags"];
}

- (CHSBaseDescriptor)initWithCoder:(id)a3
{
  v56[1] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if ([v4 containsValueForKey:@"extensionIdentity"])
  {
    uint64_t v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"extensionIdentity"];
  }
  else
  {
    id v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"extensionBundleIdentifier"];
    uint64_t v7 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"containerBundleIdentifier"];
    id v8 = (void *)v7;
    uint64_t v5 = 0;
    if (v6 && v7)
    {
      id v9 = [CHSExtensionIdentity alloc];
      id v10 = getDeviceIDFromBundleID(v6);
      uint64_t v5 = [(CHSExtensionIdentity *)v9 initWithExtensionBundleIdentifier:v6 containerBundleIdentifier:v8 deviceIdentifier:v10];
    }
  }
  v54 = (void *)v5;
  if (v5)
  {
    v52 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"nativeCBI"];
    v53 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"displayName"];
    v51 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"widgetDescription"];
    v50 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"localeToken"];
    v49 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"eventMachServiceName"];
    char v11 = [v4 decodeBoolForKey:@"transparent"];
    uint64_t v12 = [v4 decodeIntegerForKey:@"backgroundStyle"];
    char v13 = [v4 decodeBoolForKey:@"supportsVibrantContent"];
    if ([v4 containsValueForKey:@"promptsForUserConfiguration"]) {
      char v47 = [v4 decodeBoolForKey:@"promptsForUserConfiguration"];
    }
    else {
      char v47 = 0;
    }
    if ([v4 containsValueForKey:@"sdkVersion"])
    {
      obj = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"sdkVersion"];
    }
    else
    {
      obj = @"Unknown";
    }
    char v46 = v13;
    if ([v4 containsValueForKey:@"platform"])
    {
      unint64_t v19 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"platform"];
      uint64_t v20 = [v19 unsignedIntegerValue];
    }
    else
    {
      uint64_t v20 = 0;
    }
    char v21 = v11 & (v12 == 0);
    if (v21) {
      uint64_t v22 = 2;
    }
    else {
      uint64_t v22 = v12;
    }
    uint64_t v23 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"version"];
    uint64_t v24 = [v23 unsignedIntegerValue];

    char v25 = [v4 decodeBoolForKey:@"hiddenBySensitiveUI"];
    if ([v4 containsValueForKey:@"enablement"])
    {
      unsigned int v26 = [v4 decodeInt32ForKey:@"enablement"];
      if (v26 >= 3) {
        signed int v27 = 0;
      }
      else {
        signed int v27 = v26;
      }
      unint64_t v28 = v27;
    }
    else
    {
      unint64_t v28 = 0;
    }
    v29 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v30 = objc_opt_class();
    v31 = objc_msgSend(v29, "setWithObjects:", v30, objc_opt_class(), 0);
    uint64_t v32 = [v4 decodeObjectOfClasses:v31 forKey:@"requiredFeatureFlags"];

    v33 = [(CHSBaseDescriptor *)self initWithExtensionIdentity:v54];
    uint64_t v34 = [v53 copy];
    displayName = v33->_displayName;
    v33->_displayName = (NSString *)v34;

    uint64_t v36 = [v51 copy];
    widgetDescription = v33->_widgetDescription;
    v33->_widgetDescription = (NSString *)v36;

    uint64_t v38 = [v50 copy];
    localeToken = v33->_localeToken;
    v33->_localeToken = (NSData *)v38;

    uint64_t v40 = [v49 copy];
    eventMachServiceName = v33->_eventMachServiceName;
    v33->_eventMachServiceName = (NSString *)v40;

    v33->_preferredBackgroundStyle = v22;
    v33->_supportsVibrantContent = (v21 | v46) & 1;
    objc_storeStrong((id *)&v33->_sdkVersion, obj);
    v33->_unint64_t platform = v20;
    v33->_version = v24;
    uint64_t v42 = [v52 copy];
    nativeContainerBundleIdentifier = v33->_nativeContainerBundleIdentifier;
    v33->_nativeContainerBundleIdentifier = (NSString *)v42;

    v33->_hiddenBySensitiveUI = v25;
    v33->_promptsForUserConfiguration = v47;
    requiredFeatureFlags = v33->_requiredFeatureFlags;
    v33->_enablement = v28;
    v33->_requiredFeatureFlags = (NSArray *)v32;

    self = v33;
    id v18 = self;
  }
  else
  {
    id v14 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v55 = *MEMORY[0x1E4F28568];
    id v15 = [NSString stringWithFormat:@"Unable to decode base descriptor: %@", 0];
    v56[0] = v15;
    uint64_t v16 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v56 forKeys:&v55 count:1];
    id v17 = [v14 errorWithDomain:@"com.apple.chronoservices.descriptor" code:1 userInfo:v16];
    [v4 failWithError:v17];

    id v18 = 0;
  }

  return v18;
}

- (BOOL)prefersUserConfiguration
{
  return self->_promptsForUserConfiguration;
}

- (id)extensionBundleIdentifier
{
  return [(CHSExtensionIdentity *)self->_extensionIdentity extensionBundleIdentifier];
}

- (id)containerBundleIdentifier
{
  return [(CHSExtensionIdentity *)self->_extensionIdentity containerBundleIdentifier];
}

- (id)sourceDeviceIdentifier
{
  return [(CHSExtensionIdentity *)self->_extensionIdentity deviceIdentifier];
}

- (CHSExtensionIdentity)extensionIdentity
{
  return self->_extensionIdentity;
}

- (NSString)displayName
{
  return self->_displayName;
}

- (NSString)widgetDescription
{
  return self->_widgetDescription;
}

- (BOOL)hiddenBySensitiveUI
{
  return self->_hiddenBySensitiveUI;
}

- (unint64_t)version
{
  return self->_version;
}

- (void)setVersion:(unint64_t)a3
{
  self->_version = a3;
}

- (NSString)nativeContainerBundleIdentifier
{
  return self->_nativeContainerBundleIdentifier;
}

- (NSString)eventMachServiceName
{
  return self->_eventMachServiceName;
}

- (NSData)localeToken
{
  return self->_localeToken;
}

- (NSString)sdkVersion
{
  return self->_sdkVersion;
}

- (unint64_t)platform
{
  return self->_platform;
}

- (int64_t)preferredBackgroundStyle
{
  return self->_preferredBackgroundStyle;
}

- (BOOL)supportsVibrantContent
{
  return self->_supportsVibrantContent;
}

- (BOOL)promptsForUserConfiguration
{
  return self->_promptsForUserConfiguration;
}

- (unint64_t)enablement
{
  return self->_enablement;
}

- (void)setEnablement:(unint64_t)a3
{
  self->_enablement = a3;
}

- (NSArray)requiredFeatureFlags
{
  return self->_requiredFeatureFlags;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_requiredFeatureFlags, 0);
  objc_storeStrong((id *)&self->_sdkVersion, 0);
  objc_storeStrong((id *)&self->_localeToken, 0);
  objc_storeStrong((id *)&self->_eventMachServiceName, 0);
  objc_storeStrong((id *)&self->_widgetDescription, 0);
  objc_storeStrong((id *)&self->_displayName, 0);
  objc_storeStrong((id *)&self->_nativeContainerBundleIdentifier, 0);
  objc_storeStrong((id *)&self->_extensionIdentity, 0);
}

- (void)isLinkedOnOrAfter:(os_log_t)log .cold.1(os_log_t log)
{
  *(_WORD *)v1 = 0;
}

- (void)isLinkedOnOrAfter:(os_log_t)log .cold.2(os_log_t log)
{
  *(_WORD *)v1 = 0;
}

@end