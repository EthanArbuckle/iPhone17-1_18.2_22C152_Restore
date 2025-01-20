@interface CHSConfiguredWidgetDescriptor
+ (BOOL)supportsSecureCoding;
+ (id)new;
- (BOOL)isEqual:(id)a3;
- (BOOL)isSuggestion;
- (BOOL)isSystemConfigured;
- (BOOL)matches:(id)a3;
- (BOOL)matchesPersonality:(id)a3;
- (BOOL)showsWidgetLabel;
- (BOOL)supportsLowLuminance;
- (BOOL)supportsTinting;
- (CHSConfiguredWidgetContainerDescriptor)container;
- (CHSConfiguredWidgetDescriptor)init;
- (CHSConfiguredWidgetDescriptor)initWithCoder:(id)a3;
- (CHSConfiguredWidgetDescriptor)initWithUniqueIdentifier:(id)a3 widget:(id)a4 metrics:(id)a5;
- (CHSConfiguredWidgetDescriptor)initWithUniqueIdentifier:(id)a3 widget:(id)a4 metrics:(id)a5 isSuggestion:(BOOL)a6 isSystemConfigured:(BOOL)a7;
- (CHSExtensionIdentity)extensionIdentity;
- (CHSWidget)widget;
- (CHSWidgetDisplayProperties)displayProperties;
- (CHSWidgetMetrics)metrics;
- (CHSWidgetRefreshStrategy)refreshStrategy;
- (NSArray)supportedRenderSchemes;
- (NSString)description;
- (NSString)kind;
- (NSString)uniqueIdentifier;
- (id)_initWithDescriptor:(id)a3;
- (id)descriptionBuilderWithMultilinePrefix:(id)a3;
- (id)descriptionWithMultilinePrefix:(id)a3;
- (id)extensionBundleIdentifier;
- (id)mutableCopyWithZone:(_NSZone *)a3;
- (id)succinctDescription;
- (id)succinctDescriptionBuilder;
- (unint64_t)hash;
- (unint64_t)supportedColorSchemes;
- (unint64_t)supportedRenderingModes;
- (void)_setContainer:(id)a3;
- (void)encodeWithCoder:(id)a3;
@end

@implementation CHSConfiguredWidgetDescriptor

+ (id)new
{
  v4 = [MEMORY[0x1E4F28B00] currentHandler];
  [v4 handleFailureInMethod:a2 object:a1 file:@"CHSConfiguredWidgetDescriptor.m" lineNumber:45 description:@"use designated initializer"];

  return 0;
}

- (CHSConfiguredWidgetDescriptor)init
{
  v4 = [MEMORY[0x1E4F28B00] currentHandler];
  [v4 handleFailureInMethod:a2 object:self file:@"CHSConfiguredWidgetDescriptor.m" lineNumber:50 description:@"use designated initializer"];

  return 0;
}

- (CHSConfiguredWidgetDescriptor)initWithUniqueIdentifier:(id)a3 widget:(id)a4 metrics:(id)a5
{
  v36[1] = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v30.receiver = self;
  v30.super_class = (Class)CHSConfiguredWidgetDescriptor;
  v11 = [(CHSConfiguredWidgetDescriptor *)&v30 init];
  if (v11)
  {
    uint64_t v12 = [v9 copy];
    widget = v11->_widget;
    v11->_widget = (CHSWidget *)v12;

    uint64_t v14 = [v8 copy];
    uniqueIdentifier = v11->_uniqueIdentifier;
    v11->_uniqueIdentifier = (NSString *)v14;

    uint64_t v16 = [v10 copy];
    metrics = v11->_metrics;
    v11->_metrics = (CHSWidgetMetrics *)v16;

    *(_WORD *)&v11->_suggestion = 0;
    uint64_t v18 = +[CHSWidgetRefreshStrategyFactory defaultStrategy];
    refreshStrategy = v11->_refreshStrategy;
    v11->_refreshStrategy = (CHSWidgetRefreshStrategy *)v18;

    v11->_supportedColorSchemes = 3;
    v20 = [[CHSWidgetRenderScheme alloc] initWithRenderingMode:0 backgroundViewPolicy:0];
    v36[0] = v20;
    uint64_t v21 = [MEMORY[0x1E4F1C978] arrayWithObjects:v36 count:1];
    supportedRenderSchemes = v11->_supportedRenderSchemes;
    v11->_supportedRenderSchemes = (NSArray *)v21;

    *(_WORD *)&v11->_supportsLowLuminance = 0;
    uint64_t v32 = 0;
    v33 = &v32;
    uint64_t v34 = 0x2050000000;
    v23 = (void *)getFBDisplayManagerClass_softClass;
    uint64_t v35 = getFBDisplayManagerClass_softClass;
    if (!getFBDisplayManagerClass_softClass)
    {
      v31[0] = MEMORY[0x1E4F143A8];
      v31[1] = 3221225472;
      v31[2] = __getFBDisplayManagerClass_block_invoke;
      v31[3] = &unk_1E56C8628;
      v31[4] = &v32;
      __getFBDisplayManagerClass_block_invoke((uint64_t)v31);
      v23 = (void *)v33[3];
    }
    id v24 = v23;
    _Block_object_dispose(&v32, 8);
    v25 = [CHSWidgetDisplayProperties alloc];
    v26 = [v24 mainConfiguration];
    uint64_t v27 = [(CHSWidgetDisplayProperties *)v25 initWithDisplayConfiguration:v26];
    displayProperties = v11->_displayProperties;
    v11->_displayProperties = (CHSWidgetDisplayProperties *)v27;
  }
  return v11;
}

- (CHSConfiguredWidgetDescriptor)initWithUniqueIdentifier:(id)a3 widget:(id)a4 metrics:(id)a5 isSuggestion:(BOOL)a6 isSystemConfigured:(BOOL)a7
{
  result = [(CHSConfiguredWidgetDescriptor *)self initWithUniqueIdentifier:a3 widget:a4 metrics:a5];
  if (result)
  {
    result->_suggestion = a6;
    result->_systemConfigured = a7;
  }
  return result;
}

- (id)_initWithDescriptor:(id)a3
{
  id v4 = a3;
  v5 = [(CHSConfiguredWidgetDescriptor *)self initWithUniqueIdentifier:*((void *)v4 + 8) widget:*((void *)v4 + 9) metrics:*((void *)v4 + 10)];
  v6 = v5;
  if (v5)
  {
    v5->_suggestion = *((unsigned char *)v4 + 16);
    v5->_systemConfigured = *((unsigned char *)v4 + 17);
    v5->_supportedColorSchemes = *((void *)v4 + 3);
    uint64_t v7 = [*((id *)v4 + 4) copy];
    supportedRenderSchemes = v6->_supportedRenderSchemes;
    v6->_supportedRenderSchemes = (NSArray *)v7;

    v6->_supportsLowLuminance = *((unsigned char *)v4 + 40);
    v6->_showsWidgetLabel = *((unsigned char *)v4 + 41);
    objc_storeStrong((id *)&v6->_displayProperties, *((id *)v4 + 6));
    objc_storeStrong((id *)&v6->_refreshStrategy, *((id *)v4 + 7));
  }

  return v6;
}

- (CHSConfiguredWidgetContainerDescriptor)container
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_weak_container);
  return (CHSConfiguredWidgetContainerDescriptor *)WeakRetained;
}

- (void)_setContainer:(id)a3
{
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  v5 = [MEMORY[0x1E4F4F738] builderWithObject:v4 ofExpectedClass:objc_opt_class()];
  uint64_t v6 = objc_opt_class();
  id v7 = v4;
  if (v6)
  {
    if (objc_opt_isKindOfClass()) {
      id v8 = v7;
    }
    else {
      id v8 = 0;
    }
  }
  else
  {
    id v8 = 0;
  }
  id v9 = v8;

  if (v9)
  {
    uniqueIdentifier = self->_uniqueIdentifier;
    v67[0] = MEMORY[0x1E4F143A8];
    v67[1] = 3221225472;
    v67[2] = __41__CHSConfiguredWidgetDescriptor_isEqual___block_invoke;
    v67[3] = &unk_1E56C8508;
    id v11 = v9;
    id v68 = v11;
    id v12 = (id)[v5 appendString:uniqueIdentifier counterpart:v67];
    widget = self->_widget;
    v65[0] = MEMORY[0x1E4F143A8];
    v65[1] = 3221225472;
    v65[2] = __41__CHSConfiguredWidgetDescriptor_isEqual___block_invoke_2;
    v65[3] = &unk_1E56C81C8;
    id v14 = v11;
    id v66 = v14;
    id v15 = (id)[v5 appendObject:widget counterpart:v65];
    metrics = self->_metrics;
    v63[0] = MEMORY[0x1E4F143A8];
    v63[1] = 3221225472;
    v63[2] = __41__CHSConfiguredWidgetDescriptor_isEqual___block_invoke_3;
    v63[3] = &unk_1E56C81C8;
    id v17 = v14;
    id v64 = v17;
    id v18 = (id)[v5 appendObject:metrics counterpart:v63];
    BOOL suggestion = self->_suggestion;
    v61[0] = MEMORY[0x1E4F143A8];
    v61[1] = 3221225472;
    v61[2] = __41__CHSConfiguredWidgetDescriptor_isEqual___block_invoke_4;
    v61[3] = &unk_1E56C8468;
    id v20 = v17;
    id v62 = v20;
    id v21 = (id)[v5 appendBool:suggestion counterpart:v61];
    BOOL systemConfigured = self->_systemConfigured;
    v59[0] = MEMORY[0x1E4F143A8];
    v59[1] = 3221225472;
    v59[2] = __41__CHSConfiguredWidgetDescriptor_isEqual___block_invoke_5;
    v59[3] = &unk_1E56C8468;
    id v23 = v20;
    id v60 = v23;
    id v24 = (id)[v5 appendBool:systemConfigured counterpart:v59];
    unint64_t supportedColorSchemes = self->_supportedColorSchemes;
    v57[0] = MEMORY[0x1E4F143A8];
    v57[1] = 3221225472;
    v57[2] = __41__CHSConfiguredWidgetDescriptor_isEqual___block_invoke_6;
    v57[3] = &unk_1E56C84B8;
    id v26 = v23;
    id v58 = v26;
    id v27 = (id)[v5 appendUnsignedInteger:supportedColorSchemes counterpart:v57];
    supportedRenderSchemes = self->_supportedRenderSchemes;
    v55[0] = MEMORY[0x1E4F143A8];
    v55[1] = 3221225472;
    v55[2] = __41__CHSConfiguredWidgetDescriptor_isEqual___block_invoke_7;
    v55[3] = &unk_1E56C81C8;
    id v29 = v26;
    id v56 = v29;
    id v30 = (id)[v5 appendObject:supportedRenderSchemes counterpart:v55];
    BOOL supportsLowLuminance = self->_supportsLowLuminance;
    v53[0] = MEMORY[0x1E4F143A8];
    v53[1] = 3221225472;
    v53[2] = __41__CHSConfiguredWidgetDescriptor_isEqual___block_invoke_8;
    v53[3] = &unk_1E56C8468;
    id v32 = v29;
    id v54 = v32;
    id v33 = (id)[v5 appendBool:supportsLowLuminance counterpart:v53];
    BOOL showsWidgetLabel = self->_showsWidgetLabel;
    v51[0] = MEMORY[0x1E4F143A8];
    v51[1] = 3221225472;
    v51[2] = __41__CHSConfiguredWidgetDescriptor_isEqual___block_invoke_9;
    v51[3] = &unk_1E56C8468;
    id v35 = v32;
    id v52 = v35;
    id v36 = (id)[v5 appendBool:showsWidgetLabel counterpart:v51];
    displayProperties = self->_displayProperties;
    v49[0] = MEMORY[0x1E4F143A8];
    v49[1] = 3221225472;
    v49[2] = __41__CHSConfiguredWidgetDescriptor_isEqual___block_invoke_10;
    v49[3] = &unk_1E56C81C8;
    id v38 = v35;
    id v50 = v38;
    id v39 = (id)[v5 appendObject:displayProperties counterpart:v49];
    refreshStrategy = self->_refreshStrategy;
    uint64_t v44 = MEMORY[0x1E4F143A8];
    uint64_t v45 = 3221225472;
    v46 = __41__CHSConfiguredWidgetDescriptor_isEqual___block_invoke_11;
    v47 = &unk_1E56C81C8;
    id v48 = v38;
    id v41 = (id)[v5 appendObject:refreshStrategy counterpart:&v44];
    char v42 = objc_msgSend(v5, "isEqual", v44, v45, v46, v47);
  }
  else
  {
    char v42 = 0;
  }

  return v42;
}

id __41__CHSConfiguredWidgetDescriptor_isEqual___block_invoke(uint64_t a1)
{
  return *(id *)(*(void *)(a1 + 32) + 64);
}

id __41__CHSConfiguredWidgetDescriptor_isEqual___block_invoke_2(uint64_t a1)
{
  return *(id *)(*(void *)(a1 + 32) + 72);
}

id __41__CHSConfiguredWidgetDescriptor_isEqual___block_invoke_3(uint64_t a1)
{
  return *(id *)(*(void *)(a1 + 32) + 80);
}

uint64_t __41__CHSConfiguredWidgetDescriptor_isEqual___block_invoke_4(uint64_t a1)
{
  return *(unsigned __int8 *)(*(void *)(a1 + 32) + 16);
}

uint64_t __41__CHSConfiguredWidgetDescriptor_isEqual___block_invoke_5(uint64_t a1)
{
  return *(unsigned __int8 *)(*(void *)(a1 + 32) + 17);
}

uint64_t __41__CHSConfiguredWidgetDescriptor_isEqual___block_invoke_6(uint64_t a1)
{
  return *(void *)(*(void *)(a1 + 32) + 24);
}

id __41__CHSConfiguredWidgetDescriptor_isEqual___block_invoke_7(uint64_t a1)
{
  return *(id *)(*(void *)(a1 + 32) + 32);
}

uint64_t __41__CHSConfiguredWidgetDescriptor_isEqual___block_invoke_8(uint64_t a1)
{
  return *(unsigned __int8 *)(*(void *)(a1 + 32) + 40);
}

uint64_t __41__CHSConfiguredWidgetDescriptor_isEqual___block_invoke_9(uint64_t a1)
{
  return *(unsigned __int8 *)(*(void *)(a1 + 32) + 41);
}

id __41__CHSConfiguredWidgetDescriptor_isEqual___block_invoke_10(uint64_t a1)
{
  return *(id *)(*(void *)(a1 + 32) + 48);
}

id __41__CHSConfiguredWidgetDescriptor_isEqual___block_invoke_11(uint64_t a1)
{
  return *(id *)(*(void *)(a1 + 32) + 56);
}

- (unint64_t)hash
{
  v3 = [MEMORY[0x1E4F4F758] builder];
  id v4 = (id)[v3 appendString:self->_uniqueIdentifier];
  id v5 = (id)[v3 appendObject:self->_widget];
  id v6 = (id)[v3 appendObject:self->_metrics];
  id v7 = (id)[v3 appendBool:self->_suggestion];
  id v8 = (id)[v3 appendBool:self->_systemConfigured];
  id v9 = (id)[v3 appendUnsignedInteger:self->_supportedColorSchemes];
  id v10 = (id)[v3 appendObject:self->_supportedRenderSchemes];
  id v11 = (id)[v3 appendBool:self->_supportsLowLuminance];
  id v12 = (id)[v3 appendBool:self->_showsWidgetLabel];
  id v13 = (id)[v3 appendObject:self->_displayProperties];
  id v14 = (id)[v3 appendObject:self->_refreshStrategy];
  unint64_t v15 = [v3 hash];

  return v15;
}

- (NSString)description
{
  return (NSString *)[(CHSConfiguredWidgetDescriptor *)self descriptionWithMultilinePrefix:0];
}

- (id)succinctDescription
{
  v2 = [(CHSConfiguredWidgetDescriptor *)self succinctDescriptionBuilder];
  v3 = [v2 build];

  return v3;
}

- (id)succinctDescriptionBuilder
{
  return (id)[MEMORY[0x1E4F4F718] builderWithObject:self];
}

- (id)descriptionWithMultilinePrefix:(id)a3
{
  v3 = [(CHSConfiguredWidgetDescriptor *)self descriptionBuilderWithMultilinePrefix:a3];
  id v4 = [v3 build];

  return v4;
}

- (id)descriptionBuilderWithMultilinePrefix:(id)a3
{
  id v4 = a3;
  id v5 = [(CHSConfiguredWidgetDescriptor *)self succinctDescriptionBuilder];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __71__CHSConfiguredWidgetDescriptor_descriptionBuilderWithMultilinePrefix___block_invoke;
  v9[3] = &unk_1E56C81F0;
  id v6 = v5;
  id v10 = v6;
  id v11 = self;
  [v6 appendBodySectionWithName:0 multilinePrefix:v4 block:v9];
  id v7 = v6;

  return v7;
}

id __71__CHSConfiguredWidgetDescriptor_descriptionBuilderWithMultilinePrefix___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) appendString:*(void *)(*(void *)(a1 + 40) + 64) withName:@"uniqueIdentifier"];
  id v2 = (id)[*(id *)(a1 + 32) appendObject:*(void *)(*(void *)(a1 + 40) + 72) withName:@"widget"];
  id v3 = (id)[*(id *)(a1 + 32) appendObject:*(void *)(*(void *)(a1 + 40) + 80) withName:@"metrics"];
  id v4 = (id)[*(id *)(a1 + 32) appendBool:*(unsigned __int8 *)(*(void *)(a1 + 40) + 16) withName:@"isSuggestion"];
  id v5 = (id)[*(id *)(a1 + 32) appendBool:*(unsigned __int8 *)(*(void *)(a1 + 40) + 17) withName:@"isSystemConfigured"];
  id v6 = *(void **)(a1 + 32);
  id v7 = NSStringFromCHSWidgetColorSchemes(*(void *)(*(void *)(a1 + 40) + 24));
  [v6 appendString:v7 withName:@"supportedColorSchemes"];

  id v8 = (id)[*(id *)(a1 + 32) appendObject:*(void *)(*(void *)(a1 + 40) + 32) withName:@"supportedRenderSchemes"];
  id v9 = (id)[*(id *)(a1 + 32) appendBool:*(unsigned __int8 *)(*(void *)(a1 + 40) + 40) withName:@"supportsLowLuminance"];
  id v10 = (id)[*(id *)(a1 + 32) appendBool:*(unsigned __int8 *)(*(void *)(a1 + 40) + 41) withName:@"showsWidgetLabel"];
  id v11 = (id)[*(id *)(a1 + 32) appendObject:*(void *)(*(void *)(a1 + 40) + 48) withName:@"displayProperties"];
  return (id)[*(id *)(a1 + 32) appendObject:*(void *)(*(void *)(a1 + 40) + 56) withName:@"refreshStrategy"];
}

- (CHSExtensionIdentity)extensionIdentity
{
  return [(CHSWidget *)self->_widget extensionIdentity];
}

- (BOOL)matches:(id)a3
{
  return [(CHSWidget *)self->_widget matches:a3];
}

- (NSString)kind
{
  return [(CHSWidget *)self->_widget kind];
}

- (id)extensionBundleIdentifier
{
  id v2 = [(CHSWidget *)self->_widget extensionIdentity];
  id v3 = [v2 extensionBundleIdentifier];

  return v3;
}

- (BOOL)matchesPersonality:(id)a3
{
  return [(CHSWidget *)self->_widget matchesPersonality:a3];
}

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  id v4 = [CHSMutableConfiguredWidgetDescriptor alloc];
  return [(CHSConfiguredWidgetDescriptor *)v4 _initWithDescriptor:self];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  [v4 encodeObject:self->_widget forKey:@"widget"];
  [v4 encodeObject:self->_uniqueIdentifier forKey:@"uniqueIdentifier"];
  [v4 encodeObject:self->_metrics forKey:@"metrics"];
  [v4 encodeBool:self->_suggestion forKey:@"isSuggestion"];
  [v4 encodeBool:self->_systemConfigured forKey:@"isSystemConfigured"];
  [v4 encodeInt32:LODWORD(self->_supportedColorSchemes) forKey:@"supportedColorSchemes"];
  [v4 encodeObject:self->_supportedRenderSchemes forKey:@"supportedRenderSchemes2"];
  [v4 encodeBool:self->_supportsLowLuminance forKey:@"supportsLowLuminance"];
  [v4 encodeBool:self->_showsWidgetLabel forKey:@"showsWidgetLabel"];
  [v4 encodeObject:self->_displayProperties forKey:@"displayProperties"];
  [v4 encodeObject:self->_refreshStrategy forKey:@"refreshStrategy"];
}

- (CHSConfiguredWidgetDescriptor)initWithCoder:(id)a3
{
  uint64_t v42 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v37 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"widget"];
  id v36 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"uniqueIdentifier"];
  id v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"metrics"];
  char v34 = [v4 decodeBoolForKey:@"isSystemConfigured"];
  char v33 = [v4 decodeBoolForKey:@"isSuggestion"];
  id obj = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"displayProperties"];
  if ([v4 containsValueForKey:@"supportedColorSchemes"])
  {
    uint64_t v31 = (int)[v4 decodeInt32ForKey:@"supportedColorSchemes"];
    int IsValid = CHSWidgetColorSchemesIsValid();
  }
  else
  {
    id v7 = CHSLogChronoServices();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      id v41 = v37;
      _os_log_impl(&dword_190C6F000, v7, OS_LOG_TYPE_DEFAULT, "Cannot find color schemes encoded; using all as a fallback for %{public}@",
        buf,
        0xCu);
    }

    uint64_t v31 = -1;
    int IsValid = 1;
  }
  if (objc_msgSend(v4, "containsValueForKey:", @"supportedRenderSchemes2", v31))
  {
    id v8 = [v4 decodeArrayOfObjectsOfClass:objc_opt_class() forKey:@"supportedRenderSchemes2"];
    goto LABEL_21;
  }
  if ([v4 containsValueForKey:@"supportedRenderSchemes"])
  {
    id v9 = [v4 decodeArrayOfObjectsOfClass:objc_opt_class() forKey:@"supportedRenderSchemes"];
    id v10 = [MEMORY[0x1E4F1CA48] array];
    v38[0] = MEMORY[0x1E4F143A8];
    v38[1] = 3221225472;
    v38[2] = __47__CHSConfiguredWidgetDescriptor_initWithCoder___block_invoke;
    v38[3] = &unk_1E56C92B0;
    id v11 = v10;
    id v39 = v11;
    [v9 enumerateObjectsUsingBlock:v38];
    id v12 = (CHSWidgetRenderScheme *)v11;

    id v13 = v39;
    id v8 = v12;
LABEL_19:

    goto LABEL_21;
  }
  if ([v4 containsValueForKey:@"supportedRenderingModes"])
  {
    char v14 = [v4 decodeInt32ForKey:@"supportedRenderingModes"];
    if (CHSWidgetRenderingModesIsValid(v14))
    {
      uint64_t v15 = v14 & 6;
      if ((v14 & 1) == 0)
      {
        id v8 = (void *)MEMORY[0x1E4F1CBF0];
LABEL_17:
        if (!v15) {
          goto LABEL_21;
        }
        id v12 = [[CHSWidgetRenderScheme alloc] initWithRenderingModes:v15 backgroundViewPolicy:1];
        id v13 = [(CHSWidgetRenderScheme *)v12 _compatibilityRenderSchemesFromDeprecatedRenderingModes];
        uint64_t v18 = [v8 arrayByAddingObjectsFromArray:v13];

        id v8 = (void *)v18;
        goto LABEL_19;
      }
LABEL_16:
      uint64_t v16 = [[CHSWidgetRenderScheme alloc] initWithRenderingModes:1 backgroundViewPolicy:0];
      id v17 = [(CHSWidgetRenderScheme *)v16 _compatibilityRenderSchemesFromDeprecatedRenderingModes];
      id v8 = [MEMORY[0x1E4F1CBF0] arrayByAddingObjectsFromArray:v17];

      goto LABEL_17;
    }
  }
  else if ([v4 decodeBoolForKey:@"supportsTinting"])
  {
    uint64_t v15 = 6;
    goto LABEL_16;
  }
  id v8 = (void *)MEMORY[0x1E4F1CBF0];
LABEL_21:
  uint64_t v19 = [v8 count];
  id v20 = +[CHSWidgetRefreshStrategyFactory defaultStrategy];
  if ([v4 containsValueForKey:@"refreshStrategy"])
  {
    uint64_t v21 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"refreshStrategy"];

    id v20 = (void *)v21;
  }
  char v22 = [v4 decodeBoolForKey:@"supportsLowLuminance"];
  char v23 = [v4 decodeBoolForKey:@"showsWidgetLabel"];
  id v24 = 0;
  if (v37 && v36 && v5 && ((IsValid ^ 1) & 1) == 0 && v19)
  {
    BOOL v25 = v23;
    id v26 = [(CHSConfiguredWidgetDescriptor *)self initWithUniqueIdentifier:v36 widget:v37 metrics:v5];
    id v27 = v26;
    if (v26)
    {
      v26->_BOOL suggestion = v33;
      v26->_BOOL systemConfigured = v34;
      v26->_unint64_t supportedColorSchemes = v32;
      uint64_t v28 = [v8 copy];
      supportedRenderSchemes = v27->_supportedRenderSchemes;
      v27->_supportedRenderSchemes = (NSArray *)v28;

      v27->_BOOL supportsLowLuminance = v22;
      v27->_BOOL showsWidgetLabel = v25;
      objc_storeStrong((id *)&v27->_displayProperties, obj);
      objc_storeStrong((id *)&v27->_refreshStrategy, v20);
    }
    self = v27;
    id v24 = self;
  }

  return v24;
}

void __47__CHSConfiguredWidgetDescriptor_initWithCoder___block_invoke(uint64_t a1, void *a2)
{
  id v3 = [a2 _compatibilityRenderSchemesFromDeprecatedRenderingModes];
  if ([v3 count]) {
    [*(id *)(a1 + 32) addObjectsFromArray:v3];
  }
}

- (unint64_t)supportedRenderingModes
{
  uint64_t v6 = 0;
  id v7 = &v6;
  uint64_t v8 = 0x2020000000;
  uint64_t v9 = 0;
  supportedRenderSchemes = self->_supportedRenderSchemes;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __56__CHSConfiguredWidgetDescriptor_supportedRenderingModes__block_invoke;
  v5[3] = &unk_1E56C92D8;
  v5[4] = &v6;
  [(NSArray *)supportedRenderSchemes enumerateObjectsUsingBlock:v5];
  unint64_t v3 = v7[3];
  _Block_object_dispose(&v6, 8);
  return v3;
}

unint64_t __56__CHSConfiguredWidgetDescriptor_supportedRenderingModes__block_invoke(uint64_t a1, void *a2)
{
  unint64_t result = [a2 renderingMode];
  if (result <= 2) {
    *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) |= qword_190D4A518[result];
  }
  return result;
}

- (BOOL)supportsTinting
{
  uint64_t v6 = 0;
  id v7 = &v6;
  uint64_t v8 = 0x2020000000;
  char v9 = 0;
  supportedRenderSchemes = self->_supportedRenderSchemes;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __48__CHSConfiguredWidgetDescriptor_supportsTinting__block_invoke;
  v5[3] = &unk_1E56C92D8;
  v5[4] = &v6;
  [(NSArray *)supportedRenderSchemes enumerateObjectsUsingBlock:v5];
  char v3 = *((unsigned char *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

void __48__CHSConfiguredWidgetDescriptor_supportsTinting__block_invoke(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  id v6 = a2;
  if ([v6 renderingMode] == 4 || objc_msgSend(v6, "renderingMode") == 1)
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = 1;
    *a4 = 1;
  }
}

- (NSString)uniqueIdentifier
{
  return self->_uniqueIdentifier;
}

- (CHSWidget)widget
{
  return self->_widget;
}

- (CHSWidgetMetrics)metrics
{
  return self->_metrics;
}

- (BOOL)isSuggestion
{
  return self->_suggestion;
}

- (BOOL)isSystemConfigured
{
  return self->_systemConfigured;
}

- (unint64_t)supportedColorSchemes
{
  return self->_supportedColorSchemes;
}

- (NSArray)supportedRenderSchemes
{
  return self->_supportedRenderSchemes;
}

- (BOOL)supportsLowLuminance
{
  return self->_supportsLowLuminance;
}

- (BOOL)showsWidgetLabel
{
  return self->_showsWidgetLabel;
}

- (CHSWidgetDisplayProperties)displayProperties
{
  return self->_displayProperties;
}

- (CHSWidgetRefreshStrategy)refreshStrategy
{
  return self->_refreshStrategy;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_metrics, 0);
  objc_storeStrong((id *)&self->_widget, 0);
  objc_storeStrong((id *)&self->_uniqueIdentifier, 0);
  objc_storeStrong((id *)&self->_refreshStrategy, 0);
  objc_storeStrong((id *)&self->_displayProperties, 0);
  objc_storeStrong((id *)&self->_supportedRenderSchemes, 0);
  objc_destroyWeak((id *)&self->_weak_container);
}

@end