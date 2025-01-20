@interface CHSWidgetDescriptor
+ (BOOL)supportsSecureCoding;
- (BOOL)_didMigrateToRecommendationsContainer;
- (BOOL)enablesMultipleTapTargets;
- (BOOL)hasIntents;
- (BOOL)isBackgroundRemovable;
- (BOOL)isEqual:(id)a3;
- (BOOL)isInternal;
- (BOOL)isTransparent;
- (BOOL)isTransparentForFamily:(int64_t)a3;
- (BOOL)matches:(id)a3;
- (BOOL)matchesPersonality:(id)a3;
- (BOOL)supportsAccentedContent;
- (BOOL)supportsInteraction;
- (BOOL)wantsMaterialBackgroundForFamily:(int64_t)a3;
- (CHSIntentRecommendationsContainer)intentRecommendationsContainer;
- (CHSIntentReference)defaultIntentReference;
- (CHSWidgetDescriptor)initWithCoder:(id)a3;
- (CHSWidgetDescriptor)initWithExtensionBundleIdentifier:(id)a3 containerBundleIdentifier:(id)a4 kind:(id)a5 displayName:(id)a6 intentType:(id)a7 supportedSizeClasses:(unint64_t)a8 widgetDescription:(id)a9 widgetVisibility:(int64_t)a10;
- (CHSWidgetDescriptor)initWithExtensionBundleIdentifier:(id)a3 containerBundleIdentifier:(id)a4 kind:(id)a5 supportedFamilies:(unint64_t)a6 intentType:(id)a7;
- (CHSWidgetDescriptor)initWithExtensionBundleIdentifier:(id)a3 kind:(id)a4 supportedFamilies:(unint64_t)a5 intentType:(id)a6;
- (CHSWidgetDescriptor)initWithExtensionIdentity:(id)a3 kind:(id)a4 supportedFamilies:(unint64_t)a5 intentType:(id)a6;
- (INIntent)defaultIntent;
- (NSArray)intentRecommendations;
- (NSDictionary)disfavoredLocations;
- (NSString)description;
- (NSString)intentType;
- (NSString)kind;
- (id)_initWithDescriptor:(id)a3;
- (id)_intentDescription;
- (id)copyAsCHSAvocadoDescriptor;
- (id)copyWithoutIntents;
- (id)descriptionBuilderWithMultilinePrefix:(id)a3;
- (id)descriptionWithMultilinePrefix:(id)a3;
- (id)initFromDescriptor:(id)a3 includeIntents:(BOOL)a4;
- (id)mutableCopyWithZone:(_NSZone *)a3;
- (id)succinctDescription;
- (id)succinctDescriptionBuilder;
- (id)widgetForFamily:(int64_t)a3 intent:(id)a4;
- (int64_t)widgetVisibility;
- (unint64_t)disfavoredFamiliesForLocation:(unint64_t)a3;
- (unint64_t)hash;
- (unint64_t)locationsDisfavoredByFamily:(int64_t)a3;
- (unint64_t)supportedFamilies;
- (unint64_t)supportedSizeClasses;
- (void)_evaluateSupportsAccentedContent;
- (void)encodeWithCoder:(id)a3;
- (void)isTransparent;
- (void)loadDefaultIntent:(id)a3;
- (void)setDefaultIntent:(id)a3;
- (void)setDefaultIntentReference:(id)a3;
@end

@implementation CHSWidgetDescriptor

- (CHSWidgetDescriptor)initWithExtensionIdentity:(id)a3 kind:(id)a4 supportedFamilies:(unint64_t)a5 intentType:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a6;
  v21.receiver = self;
  v21.super_class = (Class)CHSWidgetDescriptor;
  v13 = [(CHSBaseDescriptor *)&v21 initWithExtensionIdentity:v10];
  v13->_supportedFamilies = a5;
  uint64_t v14 = [v11 copy];
  kind = v13->_kind;
  v13->_kind = (NSString *)v14;

  uint64_t v16 = [v12 copy];
  intentType = v13->_intentType;
  v13->_intentType = (NSString *)v16;

  v13->_widgetVisibility = 0;
  v13->_supportsInteraction = 1;
  v13->_backgroundRemovable = 1;
  v13->_supportsAccentedContent = 0;
  v18 = (NSDictionary *)objc_alloc_init(MEMORY[0x1E4F1C9E8]);
  disfavoredLocations = v13->_disfavoredLocations;
  v13->_disfavoredLocations = v18;

  return v13;
}

- (id)initFromDescriptor:(id)a3 includeIntents:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  v7 = [(CHSWidgetDescriptor *)self initWithExtensionIdentity:*((void *)v6 + 1) kind:*((void *)v6 + 16) supportedFamilies:*((void *)v6 + 15) intentType:*((void *)v6 + 17)];
  if (v7)
  {
    uint64_t v8 = [*((id *)v6 + 3) copy];
    displayName = v7->super._displayName;
    v7->super._displayName = (NSString *)v8;

    uint64_t v10 = [*((id *)v6 + 4) copy];
    widgetDescription = v7->super._widgetDescription;
    v7->super._widgetDescription = (NSString *)v10;

    v7->_widgetVisibility = *((void *)v6 + 19);
    uint64_t v12 = [*((id *)v6 + 6) copy];
    localeToken = v7->super._localeToken;
    v7->super._localeToken = (NSData *)v12;

    uint64_t v14 = [*((id *)v6 + 5) copy];
    eventMachServiceName = v7->super._eventMachServiceName;
    v7->super._eventMachServiceName = (NSString *)v14;

    v7->super._preferredBackgroundStyle = *((void *)v6 + 7);
    v7->super._supportsVibrantContent = *((unsigned char *)v6 + 64);
    v7->_supportsAccentedContent = *((unsigned char *)v6 + 195);
    v7->_supportsInteraction = *((unsigned char *)v6 + 192);
    objc_storeStrong((id *)&v7->super._sdkVersion, *((id *)v6 + 10));
    v7->super._platform = *((void *)v6 + 11);
    v7->_enablesMultipleTapTargets = *((unsigned char *)v6 + 193);
    v7->_backgroundRemovable = *((unsigned char *)v6 + 194);
    v7->super._version = *((void *)v6 + 9);
    uint64_t v16 = [*((id *)v6 + 23) copy];
    disfavoredLocations = v7->_disfavoredLocations;
    v7->_disfavoredLocations = (NSDictionary *)v16;

    if (v4)
    {
      uint64_t v18 = [*((id *)v6 + 18) copy];
      intentRecommendationsContainer = v7->_intentRecommendationsContainer;
      v7->_intentRecommendationsContainer = (CHSIntentRecommendationsContainer *)v18;

      v20 = (void *)*((void *)v6 + 22);
    }
    else
    {
      objc_super v21 = v7->_intentRecommendationsContainer;
      v7->_intentRecommendationsContainer = 0;

      v20 = 0;
    }
    objc_storeStrong((id *)&v7->_defaultIntentReference, v20);
    v7->super._hiddenBySensitiveUI = *((unsigned char *)v6 + 96);
    v7->super._promptsForUserConfiguration = *((unsigned char *)v6 + 97);
    uint64_t v22 = [*((id *)v6 + 2) copy];
    nativeContainerBundleIdentifier = v7->super._nativeContainerBundleIdentifier;
    v7->super._nativeContainerBundleIdentifier = (NSString *)v22;

    v7->super._enablement = *((void *)v6 + 13);
    objc_storeStrong((id *)&v7->super._requiredFeatureFlags, *((id *)v6 + 14));
  }

  return v7;
}

- (id)_initWithDescriptor:(id)a3
{
  return [(CHSWidgetDescriptor *)self initFromDescriptor:a3 includeIntents:1];
}

- (NSArray)intentRecommendations
{
  return [(CHSIntentRecommendationsContainer *)self->_intentRecommendationsContainer recommendations];
}

- (INIntent)defaultIntent
{
  return [(CHSIntentReference *)self->_defaultIntentReference intent];
}

- (id)widgetForFamily:(int64_t)a3 intent:(id)a4
{
  id v6 = a4;
  if (a3)
  {
    if (((1 << a3) & ~[(CHSWidgetDescriptor *)self supportedFamilies]) != 0)
    {
      a3 = 0;
    }
    else
    {
      v7 = [CHSWidget alloc];
      uint64_t v8 = [(CHSBaseDescriptor *)self extensionIdentity];
      v9 = [(CHSWidgetDescriptor *)self kind];
      a3 = [(CHSWidget *)v7 initWithExtensionIdentity:v8 kind:v9 family:a3 intent:v6 activityIdentifier:0];
    }
  }

  return (id)a3;
}

- (BOOL)isInternal
{
  return self->_widgetVisibility == 1;
}

- (BOOL)matches:(id)a3
{
  id v4 = a3;
  v5 = [(CHSBaseDescriptor *)self extensionIdentity];
  id v6 = [v4 extensionIdentity];
  if (BSEqualObjects())
  {
    v7 = [(CHSWidgetDescriptor *)self kind];
    uint64_t v8 = [v4 kind];
    char v9 = BSEqualStrings();
  }
  else
  {
    char v9 = 0;
  }

  return v9;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (CHSWidgetDescriptor *)a3;
  v8.receiver = self;
  v8.super_class = (Class)CHSWidgetDescriptor;
  if (![(CHSBaseDescriptor *)&v8 isEqual:v4]) {
    goto LABEL_15;
  }
  if (self == v4)
  {
    char v6 = 1;
    goto LABEL_19;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v5 = v4;
    if (self->_supportedFamilies == v5->_supportedFamilies
      && BSEqualObjects()
      && BSEqualObjects()
      && BSEqualObjects()
      && BSEqualObjects()
      && BSEqualObjects()
      && self->_widgetVisibility == v5->_widgetVisibility
      && BSEqualBools()
      && BSEqualBools()
      && BSEqualBools())
    {
      char v6 = BSEqualBools();
    }
    else
    {
      char v6 = 0;
    }
  }
  else
  {
LABEL_15:
    char v6 = 0;
  }
LABEL_19:

  return v6;
}

- (unint64_t)hash
{
  v3 = [MEMORY[0x1E4F4F758] builder];
  v18.receiver = self;
  v18.super_class = (Class)CHSWidgetDescriptor;
  id v4 = (id)objc_msgSend(v3, "appendUnsignedInteger:", -[CHSBaseDescriptor hash](&v18, sel_hash));
  id v5 = (id)[v3 appendString:self->_kind];
  id v6 = (id)[v3 appendInteger:self->_supportedFamilies];
  id v7 = (id)[v3 appendString:self->_intentType];
  id v8 = (id)[v3 appendObject:self->_defaultIntentReference];
  id v9 = (id)[v3 appendObject:self->_intentRecommendationsContainer];
  id v10 = (id)[v3 appendInteger:self->_widgetVisibility];
  id v11 = (id)[v3 appendObject:self->_disfavoredLocations];
  id v12 = (id)[v3 appendBool:self->_enablesMultipleTapTargets];
  id v13 = (id)[v3 appendBool:self->_backgroundRemovable];
  id v14 = (id)[v3 appendBool:self->_supportsAccentedContent];
  id v15 = (id)[v3 appendBool:self->_supportsInteraction];
  unint64_t v16 = [v3 hash];

  return v16;
}

- (NSString)description
{
  return (NSString *)[(CHSWidgetDescriptor *)self descriptionWithMultilinePrefix:0];
}

- (id)succinctDescription
{
  v2 = [(CHSWidgetDescriptor *)self succinctDescriptionBuilder];
  v3 = [v2 build];

  return v3;
}

- (id)succinctDescriptionBuilder
{
  v3 = [MEMORY[0x1E4F4F718] builderWithObject:self];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __49__CHSWidgetDescriptor_succinctDescriptionBuilder__block_invoke;
  v7[3] = &unk_1E56C81F0;
  id v4 = v3;
  id v8 = v4;
  id v9 = self;
  [v4 appendProem:self block:v7];
  id v5 = v4;

  return v5;
}

id __49__CHSWidgetDescriptor_succinctDescriptionBuilder__block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) appendString:*(void *)(*(void *)(a1 + 40) + 128) withName:@"kind"];
  v2 = *(void **)(a1 + 32);
  v3 = CHSWidgetFamilyMaskDescription(*(void *)(*(void *)(a1 + 40) + 120));
  [v2 appendString:v3 withName:@"supportedFamilies"];

  return (id)[*(id *)(a1 + 32) appendBool:*(void *)(*(void *)(a1 + 40) + 176) != 0 withName:@"hasDefaultIntent"];
}

- (id)descriptionWithMultilinePrefix:(id)a3
{
  v3 = [(CHSWidgetDescriptor *)self descriptionBuilderWithMultilinePrefix:a3];
  id v4 = [v3 build];

  return v4;
}

- (id)descriptionBuilderWithMultilinePrefix:(id)a3
{
  id v4 = a3;
  id v5 = [MEMORY[0x1E4F4F718] builderWithObject:self];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __61__CHSWidgetDescriptor_descriptionBuilderWithMultilinePrefix___block_invoke;
  v9[3] = &unk_1E56C81F0;
  id v6 = v5;
  id v10 = v6;
  id v11 = self;
  [v6 appendBodySectionWithName:0 multilinePrefix:v4 block:v9];
  id v7 = v6;

  return v7;
}

void __61__CHSWidgetDescriptor_descriptionBuilderWithMultilinePrefix___block_invoke(uint64_t a1)
{
  id v2 = (id)[*(id *)(a1 + 32) appendObject:*(void *)(*(void *)(a1 + 40) + 8) withName:@"extensionIdentity"];
  [*(id *)(a1 + 32) appendString:*(void *)(*(void *)(a1 + 40) + 128) withName:@"kind"];
  [*(id *)(a1 + 32) appendString:*(void *)(*(void *)(a1 + 40) + 24) withName:@"displayName"];
  [*(id *)(a1 + 32) appendString:*(void *)(*(void *)(a1 + 40) + 136) withName:@"intentType"];
  id v3 = (id)objc_msgSend(*(id *)(a1 + 32), "appendBool:withName:", objc_msgSend(*(id *)(a1 + 40), "isEnabled"), @"enabled");
  id v4 = (id)[*(id *)(a1 + 32) appendUnsignedInteger:*(void *)(*(void *)(a1 + 40) + 104) withName:@"enablement"];
  id v5 = (id)[*(id *)(a1 + 32) appendUnsignedInteger:*(void *)(*(void *)(a1 + 40) + 72) withName:@"version"];
  id v6 = (id)[*(id *)(a1 + 32) appendUnsignedInteger:*(void *)(*(void *)(a1 + 40) + 56) withName:@"preferredBackgroundStyle"];
  id v7 = (id)[*(id *)(a1 + 32) appendBool:*(unsigned __int8 *)(*(void *)(a1 + 40) + 64) withName:@"supportsVibrantContent"];
  id v8 = (id)[*(id *)(a1 + 32) appendBool:*(unsigned __int8 *)(*(void *)(a1 + 40) + 195) withName:@"supportsAccentedContent"];
  id v9 = (id)[*(id *)(a1 + 32) appendBool:*(unsigned __int8 *)(*(void *)(a1 + 40) + 193) withName:@"enablesMultipleTapTargets"];
  id v10 = (id)[*(id *)(a1 + 32) appendBool:*(unsigned __int8 *)(*(void *)(a1 + 40) + 194) withName:@"backgroundRemovable"];
  id v11 = (id)[*(id *)(a1 + 32) appendBool:*(unsigned __int8 *)(*(void *)(a1 + 40) + 192) withName:@"supportsInteraction" ifEqualTo:0];
  [*(id *)(a1 + 32) appendString:*(void *)(*(void *)(a1 + 40) + 80) withName:@"sdkVersion"];
  id v12 = (id)[*(id *)(a1 + 32) appendInteger:*(void *)(*(void *)(a1 + 40) + 88) withName:@"platform"];
  id v13 = (id)[*(id *)(a1 + 32) appendBool:*(void *)(*(void *)(a1 + 40) + 176) != 0 withName:@"hasDefaultIntent"];
  id v14 = (id)[*(id *)(a1 + 32) appendBool:*(unsigned __int8 *)(*(void *)(a1 + 40) + 97) withName:@"promptsForUserConfiguration" ifEqualTo:1];
  id v15 = *(void **)(a1 + 32);
  unint64_t v16 = CHSWidgetFamilyMaskDescription(*(void *)(*(void *)(a1 + 40) + 120));
  [v15 appendString:v16 withName:@"supportedFamilies"];

  v17 = *(void **)(*(void *)(a1 + 40) + 184);
  v25[0] = MEMORY[0x1E4F143A8];
  v25[1] = 3221225472;
  v25[2] = __61__CHSWidgetDescriptor_descriptionBuilderWithMultilinePrefix___block_invoke_2;
  v25[3] = &unk_1E56C8350;
  id v26 = *(id *)(a1 + 32);
  [v17 enumerateKeysAndObjectsUsingBlock:v25];
  [*(id *)(a1 + 32) appendString:*(void *)(*(void *)(a1 + 40) + 32) withName:@"widgetDescription"];
  objc_super v18 = *(void **)(a1 + 32);
  v19 = CHSDescriptionForWidgetVisibility(*(void *)(*(void *)(a1 + 40) + 152));
  [v18 appendString:v19 withName:@"widgetVisibility"];

  v20 = *(void **)(a1 + 32);
  objc_super v21 = [*(id *)(*(void *)(a1 + 40) + 48) base64EncodedStringWithOptions:0];
  [v20 appendString:v21 withName:@"localeToken"];

  uint64_t v22 = *(void **)(a1 + 32);
  v23 = [*(id *)(*(void *)(a1 + 40) + 40) description];
  [v22 appendString:v23 withName:@"eventMachServiceName"];

  [*(id *)(a1 + 32) appendArraySection:*(void *)(*(void *)(a1 + 40) + 112) withName:@"requiredFeatureFlags" skipIfEmpty:1];
  id v24 = (id)[*(id *)(a1 + 32) appendObject:*(void *)(*(void *)(a1 + 40) + 144) withName:@"intentRecommendations" skipIfNil:1];
}

void __61__CHSWidgetDescriptor_descriptionBuilderWithMultilinePrefix___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v12 = a3;
  uint64_t v5 = [a2 integerValue];
  uint64_t v6 = [v12 unsignedIntegerValue];
  id v7 = *(void **)(a1 + 32);
  id v8 = NSStringFromCHSWidgetLocationStyleMask(v6);
  id v9 = NSString;
  id v10 = CHSWidgetFamilyDescription(v5);
  id v11 = [v9 stringWithFormat:@"disfavoredLocations (%@)", v10];
  [v7 appendString:v8 withName:v11];
}

- (id)copyWithoutIntents
{
  id v3 = [CHSWidgetDescriptor alloc];
  return [(CHSWidgetDescriptor *)v3 initFromDescriptor:self includeIntents:0];
}

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  id v4 = [CHSMutableWidgetDescriptor alloc];
  return [(CHSWidgetDescriptor *)v4 initFromDescriptor:self includeIntents:1];
}

- (BOOL)hasIntents
{
  if (self->_defaultIntentReference) {
    return 1;
  }
  id v3 = [(CHSIntentRecommendationsContainer *)self->_intentRecommendationsContainer recommendations];
  BOOL v2 = [v3 count] != 0;

  return v2;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v5.receiver = self;
  v5.super_class = (Class)CHSWidgetDescriptor;
  [(CHSBaseDescriptor *)&v5 encodeWithCoder:v4];
  [v4 encodeObject:self->_kind forKey:@"kind"];
  [v4 encodeObject:self->_intentType forKey:@"intentType"];
  [v4 encodeObject:self->_intentRecommendationsContainer forKey:@"intentRecommendationsContainer"];
  [v4 encodeInteger:self->_supportedFamilies forKey:@"supportedSizeClasses"];
  [v4 encodeInteger:self->_widgetVisibility forKey:@"widgetVisibility"];
  [v4 encodeObject:self->_disfavoredLocations forKey:@"unsupLoca"];
  [v4 encodeBool:self->_supportsInteraction forKey:@"supportsInteraction"];
  [v4 encodeBool:self->_enablesMultipleTapTargets forKey:@"enablesMultipleTapTargets"];
  [v4 encodeBool:self->_backgroundRemovable forKey:@"backgroundRemovable"];
  [v4 encodeBool:self->_supportsAccentedContent forKey:@"supportsAccentedContent"];
  [v4 encodeObject:self->_defaultIntentReference forKey:@"defaultIntent2"];
}

- (CHSWidgetDescriptor)initWithCoder:(id)a3
{
  v54[1] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v50.receiver = self;
  v50.super_class = (Class)CHSWidgetDescriptor;
  objc_super v5 = [(CHSBaseDescriptor *)&v50 initWithCoder:v4];
  if (!v5)
  {
LABEL_44:
    objc_super v5 = v5;
    id v13 = v5;
    goto LABEL_45;
  }
  v48 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"intentType"];
  v49 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"kind"];
  uint64_t v6 = [v4 decodeIntegerForKey:@"supportedSizeClasses"];
  if (v6)
  {
    if ([v4 containsValueForKey:@"intentRecommendationsContainer"])
    {
      obj = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"intentRecommendationsContainer"];
    }
    else
    {
      id v14 = (void *)MEMORY[0x1E4F1CAD0];
      v52[0] = objc_opt_class();
      v52[1] = objc_opt_class();
      id v15 = [MEMORY[0x1E4F1C978] arrayWithObjects:v52 count:2];
      unint64_t v16 = [v14 setWithArray:v15];
      v17 = [v4 decodeObjectOfClasses:v16 forKey:@"intentRecommendations"];

      if ([v17 count])
      {
        objc_super v18 = [v17 firstObject];
        v19 = [v18 intentReference];
        v20 = [v19 intent];

        obj = [[CHSIntentRecommendationsContainer alloc] initWithSchemaIntent:v20 recommendations:v17];
        v5->_didMigrateToRecommendationsContainer = 1;
      }
      else
      {
        obj = 0;
      }
    }
    uint64_t v21 = [v4 decodeIntegerForKey:@"widgetVisibility"];
    uint64_t v22 = (void *)MEMORY[0x1E4F1CAD0];
    v51[0] = objc_opt_class();
    v51[1] = objc_opt_class();
    v23 = [MEMORY[0x1E4F1C978] arrayWithObjects:v51 count:2];
    id v24 = [v22 setWithArray:v23];
    int64_t v46 = v21;
    id v25 = [v4 decodeObjectOfClasses:v24 forKey:@"unsupLoca"];

    if (!v25) {
      id v25 = objc_alloc_init(MEMORY[0x1E4F1C9E8]);
    }
    char v45 = [v4 decodeBoolForKey:@"enablesMultipleTapTargets"];
    char v26 = [(CHSBaseDescriptor *)v5 isLinkedOnOrAfter:0];
    if ([v4 containsValueForKey:@"backgroundRemovable"]) {
      char v26 = [v4 decodeBoolForKey:@"backgroundRemovable"];
    }
    int v27 = [v4 containsValueForKey:@"supportsAccentedContent"];
    char v28 = v27;
    if (v27) {
      char v44 = [v4 decodeBoolForKey:@"supportsAccentedContent"];
    }
    else {
      char v44 = 0;
    }
    if ([v4 containsValueForKey:@"supportsInteraction"]) {
      char v43 = [v4 decodeBoolForKey:@"supportsInteraction"];
    }
    else {
      char v43 = 1;
    }
    if ([v4 containsValueForKey:@"defaultIntent2"])
    {
      v29 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"defaultIntent2"];
LABEL_31:
      v5->_supportedFamilies = v6;
      if (!v5->super._version)
      {
        v36 = [(CHSExtensionIdentity *)v5->super._extensionIdentity extensionBundleIdentifier];
        if ([v36 isEqualToString:@"com.apple.news.widget"]
          && ([v49 isEqualToString:@"today"] & 1) != 0)
        {
          BOOL v37 = (v5->_supportedFamilies & 0x10) == 0;

          if (!v37) {
            v5->_supportedFamilies = v5->_supportedFamilies & 0xFFFFFFFFFFFFFFAFLL | 0x40;
          }
        }
        else
        {
        }
      }
      if (v5->super._extensionIdentity && v49 && v5->_supportedFamilies)
      {
        uint64_t v38 = [v48 copy];
        intentType = v5->_intentType;
        v5->_intentType = (NSString *)v38;

        uint64_t v40 = [v49 copy];
        kind = v5->_kind;
        v5->_kind = (NSString *)v40;

        v5->_widgetVisibility = v46;
        objc_storeStrong((id *)&v5->_disfavoredLocations, v25);
        v5->_enablesMultipleTapTargets = v45;
        v5->_backgroundRemovable = v26;
        v5->_supportsAccentedContent = v44;
        v5->_supportsInteraction = v43;
        objc_storeStrong((id *)&v5->_defaultIntentReference, v29);
        objc_storeStrong((id *)&v5->_intentRecommendationsContainer, obj);
        if ((v28 & 1) == 0) {
          [(CHSWidgetDescriptor *)v5 _evaluateSupportsAccentedContent];
        }
      }
      else
      {

        objc_super v5 = 0;
      }

      goto LABEL_44;
    }
    v30 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v31 = objc_opt_class();
    v32 = objc_msgSend(v30, "setWithObjects:", v31, objc_opt_class(), 0);
    v33 = [v4 decodeObjectOfClasses:v32 forKey:@"defaultIntent"];

    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v34 = [MEMORY[0x1E4F28DC0] unarchivedObjectOfClass:objc_opt_class() fromData:v33 error:0];
    }
    else
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        v35 = 0;
        goto LABEL_29;
      }
      id v34 = v33;
    }
    v35 = v34;
    if (v34)
    {
      v29 = [[CHSIntentReference alloc] initWithIntent:v34];
LABEL_30:

      goto LABEL_31;
    }
LABEL_29:
    v29 = 0;
    goto LABEL_30;
  }
  id v7 = (void *)MEMORY[0x1E4F28C58];
  uint64_t v53 = *MEMORY[0x1E4F28568];
  id v8 = NSString;
  id v9 = [(CHSBaseDescriptor *)v5 extensionIdentity];
  id v10 = [v8 stringWithFormat:@"Unable to decode widget descriptor: %@", v9];
  v54[0] = v10;
  id v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v54 forKeys:&v53 count:1];
  id v12 = [v7 errorWithDomain:@"com.apple.chronoservices.descriptor" code:1 userInfo:v11];
  [v4 failWithError:v12];

  id v13 = 0;
LABEL_45:

  return v13;
}

- (id)_intentDescription
{
  id v3 = NSString;
  id v4 = [(CHSExtensionIdentity *)self->super._extensionIdentity extensionBundleIdentifier];
  objc_super v5 = [v3 stringWithFormat:@"[%@ - %@]", v4, self->_intentType];

  return v5;
}

- (void)_evaluateSupportsAccentedContent
{
  if ([(CHSBaseDescriptor *)self isLinkedOnOrAfter:1]) {
    BOOL v3 = self->_supportsAccentedContent || self->_backgroundRemovable;
  }
  else {
    BOOL v3 = 0;
  }
  self->_supportsAccentedContent = v3;
}

- (BOOL)isTransparent
{
  BOOL v3 = CHSLogChronoServices();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
    -[CHSWidgetDescriptor isTransparent](v3);
  }

  uint64_t v8 = 0;
  id v9 = &v8;
  uint64_t v10 = 0x2020000000;
  char v11 = 0;
  unint64_t supportedFamilies = self->_supportedFamilies;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __36__CHSWidgetDescriptor_isTransparent__block_invoke;
  v7[3] = &unk_1E56C8378;
  void v7[4] = self;
  v7[5] = &v8;
  CHSWidgetFamilyMaskEnumerateFamilies(supportedFamilies, v7);
  char v5 = *((unsigned char *)v9 + 24);
  _Block_object_dispose(&v8, 8);
  return v5;
}

uint64_t __36__CHSWidgetDescriptor_isTransparent__block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t result = [*(id *)(a1 + 32) isTransparentForFamily:a2];
  if (result) {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 1;
  }
  return result;
}

- (BOOL)isTransparentForFamily:(int64_t)a3
{
  return self->super._preferredBackgroundStyle != 0;
}

- (BOOL)wantsMaterialBackgroundForFamily:(int64_t)a3
{
  return self->super._preferredBackgroundStyle == 2;
}

- (unint64_t)locationsDisfavoredByFamily:(int64_t)a3
{
  disfavoredLocations = self->_disfavoredLocations;
  id v4 = [MEMORY[0x1E4F28ED0] numberWithInteger:a3];
  char v5 = [(NSDictionary *)disfavoredLocations objectForKeyedSubscript:v4];

  unint64_t v6 = [v5 unsignedIntegerValue];
  return v6;
}

- (unint64_t)disfavoredFamiliesForLocation:(unint64_t)a3
{
  uint64_t v9 = 0;
  uint64_t v10 = &v9;
  uint64_t v11 = 0x2020000000;
  uint64_t v12 = 0;
  uint64_t v4 = CHSWidgetLocationStyleMaskFromStyle(a3);
  disfavoredLocations = self->_disfavoredLocations;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __53__CHSWidgetDescriptor_disfavoredFamiliesForLocation___block_invoke;
  v8[3] = &unk_1E56C83A0;
  v8[4] = &v9;
  v8[5] = v4;
  [(NSDictionary *)disfavoredLocations enumerateKeysAndObjectsUsingBlock:v8];
  unint64_t v6 = v10[3];
  _Block_object_dispose(&v9, 8);
  return v6;
}

void __53__CHSWidgetDescriptor_disfavoredFamiliesForLocation___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v8 = a2;
  id v5 = a3;
  uint64_t v6 = [v8 integerValue];
  if ((*(void *)(a1 + 40) & ~[v5 unsignedIntegerValue]) == 0)
  {
    uint64_t v7 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
    *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = CHSWidgetFamilyMaskFromWidgetFamily(v6) | v7;
  }
}

- (void)setDefaultIntent:(id)a3
{
  id v5 = a3;
  if (v5)
  {
    uint64_t v4 = [[CHSIntentReference alloc] initWithIntent:v5];
    [(CHSWidgetDescriptor *)self setDefaultIntentReference:v4];
  }
  else
  {
    [(CHSWidgetDescriptor *)self setDefaultIntentReference:0];
  }
}

- (void)setDefaultIntentReference:(id)a3
{
  id v5 = (CHSIntentReference *)a3;
  if (self->_defaultIntentReference != v5)
  {
    uint64_t v6 = v5;
    objc_storeStrong((id *)&self->_defaultIntentReference, a3);
    id v5 = v6;
  }
}

- (CHSWidgetDescriptor)initWithExtensionBundleIdentifier:(id)a3 kind:(id)a4 supportedFamilies:(unint64_t)a5 intentType:(id)a6
{
  return [(CHSWidgetDescriptor *)self initWithExtensionBundleIdentifier:a3 containerBundleIdentifier:0 kind:a4 supportedFamilies:a5 intentType:a6];
}

- (CHSWidgetDescriptor)initWithExtensionBundleIdentifier:(id)a3 containerBundleIdentifier:(id)a4 kind:(id)a5 supportedFamilies:(unint64_t)a6 intentType:(id)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a7;
  unint64_t v16 = [[CHSExtensionIdentity alloc] initWithExtensionBundleIdentifier:v12 containerBundleIdentifier:v13 deviceIdentifier:0];
  v17 = [(CHSWidgetDescriptor *)self initWithExtensionIdentity:v16 kind:v14 supportedFamilies:a6 intentType:v15];

  return v17;
}

- (NSString)kind
{
  return self->_kind;
}

- (NSString)intentType
{
  return self->_intentType;
}

- (unint64_t)supportedFamilies
{
  return self->_supportedFamilies;
}

- (int64_t)widgetVisibility
{
  return self->_widgetVisibility;
}

- (BOOL)enablesMultipleTapTargets
{
  return self->_enablesMultipleTapTargets;
}

- (BOOL)isBackgroundRemovable
{
  return self->_backgroundRemovable;
}

- (BOOL)supportsInteraction
{
  return self->_supportsInteraction;
}

- (CHSIntentReference)defaultIntentReference
{
  return self->_defaultIntentReference;
}

- (NSDictionary)disfavoredLocations
{
  return self->_disfavoredLocations;
}

- (CHSIntentRecommendationsContainer)intentRecommendationsContainer
{
  return self->_intentRecommendationsContainer;
}

- (BOOL)_didMigrateToRecommendationsContainer
{
  return self->_didMigrateToRecommendationsContainer;
}

- (BOOL)supportsAccentedContent
{
  return self->_supportsAccentedContent;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_disfavoredLocations, 0);
  objc_storeStrong((id *)&self->_defaultIntentReference, 0);
  objc_storeStrong((id *)&self->_defaultIntentProvider, 0);
  objc_storeStrong((id *)&self->_fetchDefaultIntentCompletions, 0);
  objc_storeStrong((id *)&self->_intentRecommendationsContainer, 0);
  objc_storeStrong((id *)&self->_intentType, 0);
  objc_storeStrong((id *)&self->_kind, 0);
}

- (CHSWidgetDescriptor)initWithExtensionBundleIdentifier:(id)a3 containerBundleIdentifier:(id)a4 kind:(id)a5 displayName:(id)a6 intentType:(id)a7 supportedSizeClasses:(unint64_t)a8 widgetDescription:(id)a9 widgetVisibility:(int64_t)a10
{
  id v16 = a3;
  id v17 = a4;
  id v18 = a5;
  id v19 = a6;
  id v20 = a7;
  id v21 = a9;
  uint64_t v22 = [(CHSWidgetDescriptor *)self initWithExtensionBundleIdentifier:v16 containerBundleIdentifier:v17 kind:v18 supportedFamilies:a8 intentType:v20];
  if (v22)
  {
    uint64_t v23 = [v19 copy];
    displayName = v22->super._displayName;
    v22->super._displayName = (NSString *)v23;

    uint64_t v25 = [v21 copy];
    widgetDescription = v22->super._widgetDescription;
    v22->super._widgetDescription = (NSString *)v25;

    v22->_widgetVisibility = a10;
    int v27 = (NSDictionary *)objc_alloc_init(MEMORY[0x1E4F1C9E8]);
    disfavoredLocations = v22->_disfavoredLocations;
    v22->_disfavoredLocations = v27;

    v22->_supportsInteraction = 1;
  }

  return v22;
}

- (unint64_t)supportedSizeClasses
{
  return self->_supportedFamilies;
}

- (void)loadDefaultIntent:(id)a3
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  uint64_t v4 = (void (**)(id, void *))a3;
  id v5 = [(CHSWidgetDescriptor *)self defaultIntent];
  if (v5)
  {
    v4[2](v4, v5);
  }
  else
  {
    uint64_t v6 = [(CHSWidgetDescriptor *)self intentType];
    if (v6)
    {
      fetchDefaultIntentCompletions = self->_fetchDefaultIntentCompletions;
      if (fetchDefaultIntentCompletions)
      {
        id v8 = (void *)[v4 copy];
        uint64_t v9 = _Block_copy(v8);
        [(NSMutableArray *)fetchDefaultIntentCompletions addObject:v9];
      }
      else
      {
        uint64_t v10 = CHSLogChronoServices();
        if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
        {
          uint64_t v11 = [(CHSWidgetDescriptor *)self _intentDescription];
          *(_DWORD *)buf = 138543362;
          uint64_t v22 = v11;
          _os_log_impl(&dword_190C6F000, v10, OS_LOG_TYPE_DEFAULT, "Begin loading default intent for %{public}@", buf, 0xCu);
        }
        id v12 = objc_alloc_init(MEMORY[0x1E4F70C18]);
        id v13 = [(CHSBaseDescriptor *)self extensionBundleIdentifier];
        [v12 setExtensionBundleIdentifier:v13];

        [v12 setIntentType:v6];
        id v14 = objc_alloc_init(MEMORY[0x1E4F70C10]);
        objc_storeStrong((id *)&self->_defaultIntentProvider, v14);
        id v15 = (void *)MEMORY[0x1E4F1CA48];
        id v16 = (void *)[v4 copy];
        id v17 = [v15 arrayWithObject:v16];

        id v18 = self->_fetchDefaultIntentCompletions;
        self->_fetchDefaultIntentCompletions = v17;
        id v19 = v17;

        v20[0] = MEMORY[0x1E4F143A8];
        v20[1] = 3221225472;
        v20[2] = __53__CHSWidgetDescriptor_Deprecated__loadDefaultIntent___block_invoke;
        v20[3] = &unk_1E56C83F0;
        v20[4] = self;
        [v14 provideIntentWithOptions:v12 completionHandler:v20];
      }
    }
    else
    {
      v4[2](v4, 0);
    }
  }
}

void __53__CHSWidgetDescriptor_Deprecated__loadDefaultIntent___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __53__CHSWidgetDescriptor_Deprecated__loadDefaultIntent___block_invoke_2;
  block[3] = &unk_1E56C83C8;
  block[4] = *(void *)(a1 + 32);
  id v10 = v6;
  id v11 = v5;
  id v7 = v5;
  id v8 = v6;
  dispatch_async(MEMORY[0x1E4F14428], block);
}

void __53__CHSWidgetDescriptor_Deprecated__loadDefaultIntent___block_invoke_2(uint64_t a1)
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  BOOL v2 = CHSLogChronoServices();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    id v3 = [*(id *)(a1 + 32) _intentDescription];
    uint64_t v4 = *(void *)(a1 + 40);
    if (v4)
    {
      id v5 = [NSString stringWithFormat:@"error: %@", *(void *)(a1 + 40)];
    }
    else
    {
      id v5 = @"success";
    }
    *(_DWORD *)buf = 138543618;
    id v20 = v3;
    __int16 v21 = 2114;
    uint64_t v22 = v5;
    _os_log_impl(&dword_190C6F000, v2, OS_LOG_TYPE_DEFAULT, "Completed loading default intent for %{public}@: %{public}@", buf, 0x16u);
    if (v4) {
  }
    }
  uint64_t v6 = *(void *)(a1 + 32);
  id v7 = *(void **)(v6 + 168);
  *(void *)(v6 + 168) = 0;

  [*(id *)(a1 + 32) setDefaultIntent:*(void *)(a1 + 48)];
  id v8 = (void *)[*(id *)(*(void *)(a1 + 32) + 160) copy];
  uint64_t v9 = *(void **)(*(void *)(a1 + 32) + 160);
  *(void *)(*(void *)(a1 + 32) + 160) = 0;

  long long v16 = 0u;
  long long v17 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v10 = v8;
  uint64_t v11 = [v10 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v11)
  {
    uint64_t v12 = *(void *)v15;
    do
    {
      uint64_t v13 = 0;
      do
      {
        if (*(void *)v15 != v12) {
          objc_enumerationMutation(v10);
        }
        (*(void (**)(void))(*(void *)(*((void *)&v14 + 1) + 8 * v13++) + 16))();
      }
      while (v11 != v13);
      uint64_t v11 = [v10 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v11);
  }
}

- (BOOL)matchesPersonality:(id)a3
{
  id v4 = a3;
  id v5 = [(CHSBaseDescriptor *)self extensionIdentity];
  uint64_t v6 = [v5 extensionBundleIdentifier];
  id v7 = [v4 extensionBundleIdentifier];
  if (BSEqualStrings())
  {
    id v8 = [(CHSWidgetDescriptor *)self kind];
    uint64_t v9 = [v4 kind];
    char v10 = BSEqualStrings();
  }
  else
  {
    char v10 = 0;
  }

  return v10;
}

- (id)copyAsCHSAvocadoDescriptor
{
  id v3 = [CHSAvocadoDescriptor alloc];
  return [(CHSWidgetDescriptor *)v3 _initWithDescriptor:self];
}

- (void)isTransparent
{
  *(_WORD *)v1 = 0;
}

@end